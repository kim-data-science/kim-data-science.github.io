---
title:  "Big Data ML Infra on AWS - 8. Jupyter Notebook Installation on EC2"
categories:
  - ai_cloud
tags:
  - AWS
  - Cloud
  
classes: wide
toc: false

---

## Jupyter Notebook Installation and Configuration on EC2

### Prerequisites
- **EC2 Instance**: Running Linux instance with SSH access
- **Python 3**: Already installed on Amazon Linux 2023
- **pip**: Package installer for Python
- **Security Group**: 8888 port must be enabled for inbound

### Installation Steps


#### 1. Install Jupyter Notebook
```bash
# Install Jupyter Notebook
pip3 install notebook

```

#### 2. Generate Jupyter Configuration
```bash
cd ~
# Generate default configuration file
jupyter notebook --generate-config

# This creates ~/.jupyter/jupyter_notebook_config.py
```

#### 3. Configure Jupyter for Remote Access
```bash

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
```

#### 4. Start Jupyter Notebook
```bash
# Start Jupyter Notebook
jupyter notebook --no-browser --port=8888
```

#### 5. Access via Browser
- **URL**: `http://your-ec2-public-ip-that-can-be-found-from-ec2-instance-console:8888`

#### 6. Use spark libraries
```python
import findspark
findspark.init('/opt/spark/spark-4.0.1-bin-hadoop3')
```
