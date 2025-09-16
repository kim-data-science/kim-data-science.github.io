---
title:  "Big Data ML Infra on AWS - 2. Multi Factor Authentication (MFA)"
categories:
  - ai_cloud
tags:
  - AWS
  - Cloud
  
classes: wide
toc: false

---

## AWS ROOT User Multi Factor Authentication (MFA)

### MFA Setup Steps

#### 1. Access ROOT User Security Settings
1. Sign in to AWS Console as ROOT user
2. Click your account name on the top right corner to expand drop-down menu
3. Click **Security credentials** tab

#### 2. Enable Authenticator App MFA
1. Find **Multi-factor authentication (MFA)** section
2. Click **Assign MFA device**
3. Select MFA device type and follow instruction

### Authenticator App Best Practices
- Ensure your authenticator app is backed up
- Protect your MFA device: Use password and do not lose it