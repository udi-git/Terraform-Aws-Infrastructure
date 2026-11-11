resource "aws_instance" "this" {
  ami           = var.ami_id
  instance_type = var.instance_type

  root_block_device {
    volume_size = var.root_volume_size
    volume_type = "gp3"
  }

  user_data = <<-EOF
              #!/bin/bash
              MOUNT_POINT="${var.mount_point}"

              # Wait for the secondary EBS volume to attach (supports both NVMe and Xen device names)
              while true; do
                DEVICE=$(lsblk -dpno NAME,TYPE | grep "disk" | grep -v "nvme0n1" | grep -v "xvda" | awk '{print $1}' | head -n 1)
                if [ -n "$DEVICE" ]; then
                  break
                fi
                sleep 2
              done

              # Format the volume with ext4 only if it does not already have a filesystem
              if ! blkid "$DEVICE"; then
                mkfs.ext4 "$DEVICE"
              fi

              # Create mount directory and mount the volume
              mkdir -p "$MOUNT_POINT"
              mount "$DEVICE" "$MOUNT_POINT"

              # Persist mount across reboots via /etc/fstab
              UUID=$(blkid -s UUID -o value "$DEVICE")
              if ! grep -q "$UUID" /etc/fstab; then
                echo "UUID=$UUID $MOUNT_POINT ext4 defaults,nofail 0 2" >> /etc/fstab
              fi
              EOF

  tags = {
    Name = var.instance_name
  }
}

resource "aws_ebs_volume" "additional" {
  availability_zone = aws_instance.this.availability_zone
  size              = var.ebs_volume_size
  type              = var.ebs_volume_type

  tags = {
    Name = "${var.instance_name}-ebs"
  }
}

resource "aws_volume_attachment" "this" {
  device_name = "/dev/sdf"
  volume_id   = aws_ebs_volume.additional.id
  instance_id = aws_instance.this.id
}
