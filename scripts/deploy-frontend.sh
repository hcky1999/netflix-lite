#!/bin/bash

BUCKET_NAME="netflix-lite-frontend-bucket"

echo "🏗️ Building frontend..."
cd frontend
npm run build

echo "📤 Uploading to S3..."
aws s3 sync dist/ s3://$BUCKET_NAME --delete

echo "✅ Frontend deployed to S3!"