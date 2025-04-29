# Terraform SRE Stack MVP

This project launches:
- A web app (FastAPI + Prometheus metrics)
- Prometheus monitoring
- Grafana visualization
- All infrastructure provisioned by Terraform

## Usage

1. Edit `terraform/variables.tf` to set your AWS Key Pair name.
2. Build and push your Docker image from `app/`
3. `cd terraform && terraform init && terraform apply`
4. Visit:
   - http://[your-ec2-ip]/ (Web App)
   - http://[your-ec2-ip]:9090 (Prometheus)
   - http://[your-ec2-ip]:3000 (Grafana)


# 🚀 Future TODOs and Stretch Goals

This project is a working MVP — but to truly level up as an SRE/DevOps Engineer, here are real-world growth tasks you can work on next.

---

## 🛠️ Infrastructure Improvements

| Level | Task | What You'll Learn |
|:---|:---|:---|
| 🛠️ Easy | Parameterize instance type, AMI ID, and region in `variables.tf` | Building flexible and portable Terraform modules |
| 🛠️ Medium | Add Auto Scaling Group (ASG) and Launch Template | Real cloud resilience and scaling on traffic load |
| 🛠️ Medium | Add an Application Load Balancer (ALB) | Real-world horizontal scaling and load distribution |
| 🛠️ Hard | Move app hosting to ECS (Fargate or EC2 mode) | Hands-on container orchestration and migration patterns |
| 🛠️ Hard | Add Terraform remote state backend (S3 + DynamoDB locking) | Team-safe Terraform practice — no more local tfstate corruption |

---

## 📈 Observability Enhancements

| Level | Task | What You'll Learn |
|:---|:---|:---|
| 🛠️ Easy | Add Prometheus scrape timeout and retries | Dealing with flaky service endpoints |
| 🛠️ Medium | Add Alertmanager config to send alerts to Slack, Email, or PagerDuty | End-to-end incident alerting like a real SRE system |
| 🛠️ Medium | Add Grafana dashboards for AWS EC2 CPU usage and memory | Cloud resource observability — not just app metrics |
| 🛠️ Hard | Set up Loki for log aggregation, hook into Grafana | Unified logs + metrics observability platform |
| 🛠️ Bonus | Implement blackbox_exporter to test HTTP, TCP, ICMP externally | Service monitoring from user's perspective |

---

## 🔐 Security Upgrades

| Level | Task | What You'll Learn |
|:---|:---|:---|
| 🛠️ Easy | Set up Security Group rules more tightly (only known IPs) | Network security and access control |
| 🛠️ Medium | Use ACM to add HTTPS/SSL to ALB | Real-world secure traffic |
| 🛠️ Hard | Add IAM roles and least-privilege access for EC2 and ECS tasks | Secure cloud infrastructure correctly |

---

## 🧪 Automation & Resilience

| Level | Task | What You'll Learn |
|:---|:---|:---|
| 🛠️ Easy | Write a destroy-and-rebuild script with Terraform | Fast disaster recovery testing |
| 🛠️ Medium | Build Blue/Green deployments with Terraform modules | Safer, zero-downtime deployments |
| 🛠️ Hard | Add Chaos Engineering (randomly kill app containers) | Practicing service failure and recovery (Google/Netflix style resilience) |

---

# 🧠 Recommended Learning Focus Order

Here's the smartest order to tackle TODOs likely:

1. **Parameterize Terraform** → portable and reusable code
2. **Alerts to Slack/Email** → critical real-world alerting experience
3. **Auto Scaling Group + Load Balancer** → cloud-native scaling
4. **Secure Prometheus + Grafana endpoints** → security basics
5. **Grafana dashboards for cloud metrics (CPU, Disk, etc.)** → full resource observability
6. **Move app to ECS (then later EKS if ambitious)** → professional cloud infra skills
7. **Blue/Green deployment for the app** → rollout patterns for critical production releases
8. **Remote Terraform state** → teamwork and real infra scaling
9. **Chaos Engineering practices** → resilience and high availability engineering

---

# 🧠 Personal Growth Mindset for this Project

> **"Build it. Break it. Fix it. Scale it. Secure it. Automate it."**

Every time you extend this project, you:
- Get closer to *real SRE and DevOps engineering maturity*
- Build **interview-winning stories** and **portfolio artifacts**
- Understand **real system failure points** and how to design around them

This is how senior engineers grow.

---

# 🏆 Example Showcase Pitch (for Resumes / Interviews)

> "I built a fully infrastructure-as-code SRE stack using Terraform that deploys a monitored, observable, and scalable FastAPI application on AWS. I implemented Prometheus/Grafana for metrics, alerting pipelines to Slack, auto-scaling based on CPU thresholds, and automated blue/green deployments to minimize downtime. The system is secured by least-privilege IAM roles and SSL-enabled ALB routing."

✅ That's *real experience* interviewers *love* hearing.

---


