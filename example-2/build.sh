set -e

# package lambda function and prepare final cloudformation template
aws cloudformation package --s3-bucket cf-package-demo --template-file cloudformation.yaml --output-template-file packaged.yaml

# deploy final cloudformation template
aws cloudformation deploy --template-file packaged.yaml --stack-name cf-package-demo --capabilities CAPABILITY_NAMED_IAM
