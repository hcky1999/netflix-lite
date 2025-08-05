#!/bin/bash

BUCKET_NAME="netflix-lite-frontend-bucket"
REGION="us-east-1"

echo "🌐 Setting up CloudFront distribution..."

# Create CloudFront distribution
aws cloudfront create-distribution --distribution-config '{
  "CallerReference": "'$(date +%s)'",
  "Comment": "Netflix Lite CloudFront Distribution",
  "DefaultCacheBehavior": {
    "TargetOriginId": "S3-'$BUCKET_NAME'",
    "ViewerProtocolPolicy": "redirect-to-https",
    "MinTTL": 0,
    "ForwardedValues": {
      "QueryString": false,
      "Cookies": {
        "Forward": "none"
      }
    },
    "TrustedSigners": {
      "Enabled": false,
      "Quantity": 0
    }
  },
  "Origins": {
    "Quantity": 1,
    "Items": [
      {
        "Id": "S3-'$BUCKET_NAME'",
        "DomainName": "'$BUCKET_NAME'.s3-website-'$REGION'.amazonaws.com",
        "CustomOriginConfig": {
          "HTTPPort": 80,
          "HTTPSPort": 443,
          "OriginProtocolPolicy": "http-only"
        }
      }
    ]
  },
  "Enabled": true,
  "DefaultRootObject": "index.html",
  "CustomErrorResponses": {
    "Quantity": 1,
    "Items": [
      {
        "ErrorCode": 404,
        "ResponsePagePath": "/index.html",
        "ResponseCode": "200",
        "ErrorCachingMinTTL": 300
      }
    ]
  },
  "PriceClass": "PriceClass_100"
}' --query 'Distribution.DomainName' --output text

echo "✅ CloudFront distribution created!"
echo "🔒 Your app is now secure with HTTPS"