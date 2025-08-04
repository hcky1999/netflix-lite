🎬 Netflix Lite – Serverless AWS Project
Netflix Lite is a portfolio-ready, serverless video listing app built entirely on AWS using modern frontend frameworks and automated CI/CD.

It demonstrates your skills in:

Serverless architecture (Lambda, DynamoDB, API Gateway, S3)

Docker-based Lambda deployment via AWS SAM

Modern React app development (Vite + Bootstrap)

GitHub Actions CI/CD automation

📸 Live Demo
Frontend: https://your-bucket-name.s3-website-REGION.amazonaws.com

API: https://{api-id}.execute-api.{region}.amazonaws.com/Prod/videos

Replace the above with your deployed endpoints.

🧱 Architecture
Layer	Tech Stack
Frontend	React + Vite + Bootstrap (S3 static website)
Backend	Python Lambda (Docker container via AWS SAM)
API	Amazon API Gateway
Database	DynamoDB (Videos table)
Infra as Code	AWS SAM
CI/CD	GitHub Actions

📊 Architecture Diagram:

User → CloudFront (optional) → S3 (static site)
                  ↘
                  API Gateway → Lambda (Docker) → DynamoDB



