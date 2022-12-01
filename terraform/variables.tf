variable "aws_region" {
  type    = string
  default = "eu-central-1"
}

variable "deployer_public_key" {
  type = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCYFH9HEYiIMXDip7gCtLevkRlOoXaRpbuAj+bolObbRghbWMPGje34xLC3Z04KLpUJRb6Tk7h8j6HcgHBSuDUX47isFrW63E5O/TY9DsdRgL0CV2byjLy0B5PjjOp5oUPon1Za9yAbjEduJhmRlzdbamvQ7jM7VN8o6UpWYWjIwOiTdaEAtDpwTNDZlqn80h/Wwfnmn5/Y5tHotZQocy6siyrPGD90SkPyeJoViWGfEpdsYxI7gOHXH9L9OHq73hevDbveIZqTGnp4gg9WFrtxDTWGixLpF09f+gvWvSpY98fxRLFC2TSXaJhQ+uiPSHhJBh9y/NJbqoXPEtQrAzScviLDiK5GDvQkxqkvqjNrlRjHrrEoT8p3TYs0SYzDQi0KXQIP7XcAr+lYwToguF+tomnRJKYi7VHsr/KXdG72ZOhU93GCgtTbqFjastKSnDlTXQMQ6VS5n44jGBCEzxerQ7di0YEaB/moMEPJtl6ryWF6MbYR6/p8S3qoe5/4XpM="
}

variable "bullseye_ami" {
  type    = string
  default = "ami-0a5d57ed4f0d52565"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "az" {
    type = string
    default = "eu-central-1a"
}
