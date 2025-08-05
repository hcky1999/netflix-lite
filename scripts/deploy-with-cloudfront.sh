#!/bin/bash

BUCKET_NAME="netflix-lite-frontend-bucket"
STACK_NAME="netflix-lite-cloudfront"

echo "🏗️ Building frontend..."
cd frontend
npm run build
cd ..

echo "📤 Uploading to S3..."
aws s3 sync frontend/dist/ s3://$BUCKET_NAME --delete

echo "🌐 Deploying CloudFront..."
aws cloudformation deploy \
  --template-file cloudfront-template.yaml \
  --stack-name $STACK_NAME \
  --parameter-overrides S3BucketName=$BUCKET_NAME

echo "🔍 Getting CloudFront URL..."
CLOUDFRONT_URL=$(aws cloudformation describe-stacks \
  --stack-name $STACK_NAME \
  --query 'Stacks[0].Outputs[?OutputKey==`CloudFrontURL`].OutputValue' \
  --output text)

echo "✅ Deployment complete!"
echo "🔒 Secure HTTPS URL: $CLOUDFRONT_URL"