#!/bin/bash

TABLE_NAME="Videos"

echo "🔧 Creating DynamoDB table: $TABLE_NAME"

aws dynamodb create-table \
    --table-name $TABLE_NAME \
    --attribute-definitions \
        AttributeName=id,AttributeType=S \
    --key-schema \
        AttributeName=id,KeyType=HASH \
    --billing-mode PAY_PER_REQUEST

echo "⏳ Waiting for table to be active..."
aws dynamodb wait table-exists --table-name $TABLE_NAME

echo "✅ Table created successfully!"