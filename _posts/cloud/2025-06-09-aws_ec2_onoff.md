---
title:  "Big Data ML Infra on AWS - 9. Terminate EC2 Instances and Launch with Data"
categories:
  - ai_cloud
tags:
  - AWS
  - Cloud
  
classes: wide
toc: false

---

## Launch EC2 Instance with Data

### Motivation
To avoid charges, EC2 instances should be terminated when not in use. However, we've done extensive installation and configuration work (Spark, Jupyter, etc.) from previous posts. Repeating this setup every time we terminate and launch new instances is terrible.

While stopping instances instead of terminating avoids reconfiguration, it's not cost-effective as you still pay for storage. Here's how to launch EC2 instances with pre-configured data to reduce setup time.

### What is User Data?
- **Script Execution**: Commands run automatically when instance launches
- **One-time Setup**: Executes only on first boot
- **Root Privileges**: Runs with root permissions
- **Logging**: Output saved to `/var/log/cloud-init-output.log`

### Creating User Data Script

#### 1. Prepare Installation Script
```bash
#!/bin/bash

# Update system
sudo dnf --releasever=2023.8.20250818 update -y

# Install Java
sudo dnf install java-17-amazon-corretto-headless -y

# Install Scala
curl -fL https://github.com/coursier/coursier/releases/latest/download/cs-x86_64-pc-linux.gz | gzip -d > cs && chmod +x cs && ./cs setup -y

# Install pip
sudo dnf install python3-pip -y

# Create directory for Spark installation
sudo mkdir -p /opt/spark
cd /opt/spark

# Download Spark (adjust version as needed)
sudo wget  https://dlcdn.apache.org/spark/spark-4.0.1/spark-4.0.1-bin-hadoop3.tgz

# Unpack Spark
sudo tar -xzf spark-4.0.1-bin-hadoop3.tgz

cd ~

# Install Jupyter Notebook
pip3 install notebook 

# Generate default configuration file
jupyter notebook --generate-config
# This creates ~/.jupyter/jupyter_notebook_config.py


# Create custom configuration
cat > ~/.jupyter/jupyter_notebook_config.py << EOF
c.NotebookApp.ip = '0.0.0.0'
c.NotebookApp.port = 8888
c.NotebookApp.open_browser = False
c.NotebookApp.allow_root = True
c.NotebookApp.token = ''
c.NotebookApp.password = ''
c.NotebookApp.notebook_dir = '/home/ec2-user'
EOF

# Install python packages (add more as needed)
pip3 install py4j findspark 
```

### Launching EC2 with User Data

#### 1. Launch Instance
1. Go to **EC2** → **Instances** → **Launch instance**
2. Configure instance as usual
3. In **Advanced details** section:
   - **User data**: Paste your script

#### 2. Monitor Installation
```bash
# SSH into instance after launch
chmod 400 your-key.pem
ssh -i your-key.pem ec2-user@your-public-ip

# Check installation progress
sudo tail -f /var/log/cloud-init-output.log

```

#### 3. Verify Installation
```bash
# Check if services are installed
java -version
jupyter --version

```

### Important Notes
- **One-time Execution**: Runs only on first boot
- **Security Groups**: Still need to configure for Jupyter access
