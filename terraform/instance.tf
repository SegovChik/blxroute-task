resource "aws_key_pair" "segovchik" {
  key_name   = "deployer"
  public_key = var.deployer_public_key
}

resource "aws_instance" "eth_node" {
  ami           = var.bullseye_ami
  instance_type = var.instance_type
  availability_zone = var.az
  key_name = aws_key_pair.segovchik.key_name
  vpc_security_group_ids = [aws_security_group.node_sg.id]
  tags = {
    Name = "ethNode"
  }
}

resource "aws_instance" "monitoring" {
  ami           = var.bullseye_ami
  instance_type = var.instance_type
  availability_zone = var.az
  key_name = aws_key_pair.segovchik.key_name
  vpc_security_group_ids = [aws_security_group.monitoring_sg.id]
  tags = {
    Name = "monitoring"
  }
}

 resource "aws_eip" "monitoring" {
   instance = aws_instance.monitoring.id
   vpc      = true
 }
