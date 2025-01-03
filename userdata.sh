#!/bin/bash
apt update
apt install -y apache2

# Get the instance ID using the instance metadata
INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)

# Install the AWS CLI
apt install -y awscli

# Download the images from S3 bucket
#aws s3 cp s3://myterraformprojectbucket2023/project.webp /var/www/html/project.png --acl public-read

# Create a simple HTML file with the portfolio content and display the images
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Terraform Project</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #f0f4f8;
        }
        .container {
            max-width: 600px;
            padding: 20px;
            border: 2px solid #4CAF50;
            border-radius: 10px;
            background-color: #ffffff;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .heading {
            font-size: 28px;
            color: #4CAF50;
            margin-bottom: 10px;
        }
        .text {
            font-size: 18px;
            color: #333;
            margin-bottom: 20px;
        }
        .code-section {
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            padding: 10px;
            border-radius: 5px;
            font-family: monospace;
            color: #555;
            overflow-x: auto;
            text-align: left;
        }
        .footer {
            margin-top: 20px;
            font-size: 14px;
            color: #888;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="heading">Welcome to My Terraform Project</h1>
        <p class="text">
            This page represents a project I created using Terraform, a tool for building and managing infrastructure as code. Below is a sample of the configuration file used:
        </p>
        <div class="code-section">
            <code>
                provider "aws" &#123;<br>
                &nbsp;&nbsp;region = "us-east-1"<br>
                &#125;<br><br>
                resource "aws_instance" "example" &#123;<br>
                &nbsp;&nbsp;ami           = "ami-12345678"<br>
                &nbsp;&nbsp;instance_type = "t2.micro"<br>
                &#125;
            </code>
        </div>
        <p class="text">
            Terraform allows you to define cloud resources in a simple and declarative way. By accessing this page, you're seeing an example of how infrastructure projects can be represented.
        </p>
        <p class="footer">
            &copy; 2025 My Terraform Project. All rights reserved.
        </p>
    </div>
</body>
</html>

EOF

# Start Apache and enable it on boot
systemctl start apache2
systemctl enable apache2
