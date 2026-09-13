variable "region" {
  description = "AWS region where the shared Kubernetes VPC exists."
  type        = string
  default     = "sa-east-1"
}

variable "project_name" {
  description = "Prefix used to name database resources."
  type        = string
  default     = "mechanic-shop"
}

variable "vpc_id" {
  description = "VPC ID output by the Kubernetes infrastructure repository."
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR of the VPC output by the Kubernetes infrastructure repository."
  type        = string
}

variable "private_subnet_ids" {
  description = "At least two private subnet IDs output by the Kubernetes infrastructure repository."
  type        = list(string)
}

variable "database_name" {
  description = "Initial PostgreSQL database name."
  type        = string
  default     = "mechanic_shop"
}

variable "database_username" {
  description = "Master username for the application database."
  type        = string
  default     = "mechanic_shop"
}

variable "database_password" {
  description = "Master password. Supply through CI/CD secrets only."
  type        = string
  sensitive   = true
}

variable "tags" {
  description = "Tags applied to database resources."
  type        = map(string)
  default = {
    Project     = "mechanic-shop"
    School      = "FIAP"
    Turma       = "15SOAT"
    Environment = "Production"
    Year        = "2026"
  }
}
