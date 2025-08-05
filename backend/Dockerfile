FROM public.ecr.aws/lambda/python:3.11

# Copy source code into Lambda task root
COPY app/ ${LAMBDA_TASK_ROOT}

# Install Python dependencies
COPY requirements.txt .
RUN pip install -r requirements.txt --target "${LAMBDA_TASK_ROOT}"

# Set the Lambda handler
CMD ["app.lambda_handler"]