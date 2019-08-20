set -e
pip3 install --system -r lambda-b/requirements.txt -t lambda-b/src/
aws cloudformation package --s3-bucket $BUCKET --template-file cloudformation.yaml --output-template-file packaged.yaml
aws cloudformation deploy --template-file packaged.yaml --stack-name $STACK_NAME --capabilities CAPABILITY_NAMED_IAM