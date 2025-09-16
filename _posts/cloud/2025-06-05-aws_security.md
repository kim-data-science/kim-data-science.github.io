---
title:  "Big Data ML Infra on AWS - 5. EC2 Security Group"
categories:
  - ai_cloud
tags:
  - AWS
  - Cloud
  
classes: wide
toc: false

---

## AWS EC2 Security Group Setup

### What is a Security Group?
- **Virtual Firewall**: Controls inbound and outbound traffic to EC2 instances
- Lives outside of EC2, can be applied to multiple EC2 instances

### Security Group Creation Steps

#### 1. Access Security Groups
1. Sign in to AWS Console
2. Go to **EC2** service
3. Click **Security Groups** in left sidebar

#### 2. Configure rules
As creating an EC2 instance, its security group is created accordingly. This security group can be found in the above page.
I left everything as default.
If needed, inbound and outbound rules can be edited. 

#### Common Port Configurations
- 22 (SSH), 80 (HTTP), 443 (HTTPS)