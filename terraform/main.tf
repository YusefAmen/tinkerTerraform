resource "aws_instance" "app_server" {
  ami           = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 AMI (change if needed)
  instance_type = "t2.micro"
  key_name      = var.key_name

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install docker git -y
              service docker start
              usermod -a -G docker ec2-user
              docker run -d -p 80:80 your-dockerhub-username/your-fastapi-app
              docker run -d -p 9090:9090 -v /home/ec2-user/prometheus.yml:/etc/prometheus/prometheus.yml prom/prometheus
              docker run -d -p 3000:3000 grafana/grafana
            EOF

  security_groups = [aws_security_group.allow_http.name]

  tags = {
    Name = "SRE-App-Server"
  }
}

resource "aws_security_group" "allow_http" {
  name        = "allow_http"
  description = "Allow HTTP inbound traffic"
  
  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Prometheus scrape"
    from_port   = 9090
    to_port     = 9090
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Grafana"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

