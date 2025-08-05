#!/bin/bash

echo "🐳 Starting Docker..."
open -a Docker

echo "⏳ Waiting for Docker to start..."
while ! docker info > /dev/null 2>&1; do
    sleep 2
done

echo "🏗️ Building SAM app..."
cd backend
sam build

echo "🚀 Deploying with CloudFront..."
sam deploy --parameter-overrides S3BucketName=netflix-lite-frontend-$(date +%s)

echo "✅ Deployment complete!"