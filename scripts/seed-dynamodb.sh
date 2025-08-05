#!/bin/bash

TABLE_NAME="Videos"

echo "📥 Seeding DynamoDB table: $TABLE_NAME"

aws dynamodb put-item --table-name $TABLE_NAME --item '{
"id": {"S": "video1"},
"title": {"S": "Planet Earth"},
"thumbnail": {"S": "https://placehold.co/300x180?text=Planet+Earth"}
}'

aws dynamodb put-item --table-name $TABLE_NAME --item '{
"id": {"S": "video2"},
"title": {"S": "The Ocean"},
"thumbnail": {"S": "https://placehold.co/300x180?text=The+Ocean"}
}'

aws dynamodb put-item --table-name $TABLE_NAME --item '{
"id": {"S": "video3"},
"title": {"S": "Cosmos"},
"thumbnail": {"S": "https://placehold.co/300x180?text=Cosmos"}
}'

aws dynamodb put-item --table-name $TABLE_NAME --item '{
"id": {"S": "video4"},
"title": {"S": "Wildlife"},
"thumbnail": {"S": "https://placehold.co/300x180?text=Wildlife"}
}'

aws dynamodb put-item --table-name $TABLE_NAME --item '{
"id": {"S": "video5"},
"title": {"S": "Volcanoes"},
"thumbnail": {"S": "https://placehold.co/300x180?text=Volcanoes"}
}'

echo "✅ Seeding complete."