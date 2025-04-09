default:
	docker build -t 633788536644.dkr.ecr.us-east-1.amazonaws.com/schema-load:shipping .
	aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 633788536644.dkr.ecr.us-east-1.amazonaws.com
	docker push 633788536644.dkr.ecr.us-east-1.amazonaws.com/schema-load:shipping
