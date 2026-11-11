output "alb_dns_name" {
  description = "Public DNS name of the Load Balancer"
  value       = aws_lb.app.dns_name
}
