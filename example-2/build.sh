set -e

# package lambda function and prepare final cloudformation template
aws cloudformation package --s3-bucket $BUCKET --template-file cloudformation.yaml --output-template-file packaged.yaml

# deploy final cloudformation template
aws cloudformation deploy --template-file packaged.yaml --stack-name $STACK_NAME --capabilities CAPABILITY_NAMED_IAM
