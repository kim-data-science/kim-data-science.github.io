---
title:  "Big Data ML Infra on AWS - 1. Free Tier ROOT User Account Creation"
categories:
  - ai_cloud
tags:
  - AWS
  - Cloud
  
classes: wide
toc: false

---

## AWS Free Tier Account Creation - ROOT User

### Free Tier Benefits
Currently they last 12 months. Selective services are free, up to certain usage (e.g. computing times, storage amount).
Even for paid service, the amount of usage for trainings won't be expensive. Check pricing for each service you are interested in.


### Steps to Create ROOT Account
1. Visit [aws.amazon.com](https://aws.amazon.com)
2. Click "Create an AWS Account"
3. Follow steps. You have to add payment method, but it won't charge for free tier usage.
4. **Important**: The account you create becomes the ROOT user with full administrative access.

### ROOT User Best Practices
ROOT user is difficult to recover once compromized. The best practice is to reduce risks of hacking.
- **Enable MFA immediately** - Go to IAM → Users → ROOT user → Security credentials
- **Use strong password** - Minimum 8 characters with mixed case, numbers, symbols
- **Avoid using ROOT for daily operations** - Create IAM users for regular tasks including admin permissions

### Useful Services
You can search a service at your console.
- **Billing Dashboard**: Monitor your cost in real time
- **Budget**: Set up billing alerts (e.g. email) to avoid unexpected charges
- **CloudTrail**: Enable for audit logging