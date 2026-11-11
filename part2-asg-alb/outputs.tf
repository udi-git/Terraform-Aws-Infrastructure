output "alb_dns_name" {
  description = "Public DNS name of the Load Balancer"
  value       = module.docker_asg_alb.alb_dns_name
}
