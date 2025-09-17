---
title:  "Big Data ML Infra on AWS - 7. Apache Spark Installation on EC2"
categories:
  - ai_cloud
tags:
  - AWS
  - Cloud
  
classes: wide
toc: false

---

## Apache Spark Installation on EC2

### Prerequisites
- **EC2 Instance**: Running Linux instance (Amazon Linux 2023 recommended)
- **SSH Access**: Connected to your EC2 instance
- **Java**: Required for Spark

### Installation Steps

#### 1. Update System
```bash
# Update system packages
# Follow instructiom in https://docs.aws.amazon.com/linux/al2023/ug/updating.html for latest version
sudo dnf --releasever=2023.8.20250818 update 

```

#### 2. Install Java and Scala
```bash
# Install Java 
sudo dnf install java-17-amazon-corretto-headless

# Install Scala
curl -fL https://github.com/coursier/coursier/releases/latest/download/cs-x86_64-pc-linux.gz | gzip -d > cs && chmod +x cs && ./cs setup
```

#### 3. Install pip
```bash
# python3 is already installed
# Install Python 3 and pip
sudo dnf install python3-pip

```

#### 4. Install Spark
```bash
# Create directory for Spark
sudo mkdir -p /opt/spark
cd /opt/spark

# Download Spark (adjust version as needed)
sudo wget  https://dlcdn.apache.org/spark/spark-4.0.1/spark-4.0.1-bin-hadoop3.tgz

# Unpack Spark
sudo tar -xzf spark-4.0.1-bin-hadoop3.tgz

```

