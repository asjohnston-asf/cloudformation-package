set -e

# install python dependencies
pip3 install --system -r lambda-b/requirements.txt -t lambda-b/src/

# package cloudformation templates
aws cloudformation package --s3-bucket cf-package-demo --template-file cloudformation.yaml --output-template-file packaged.yaml

# deploy packaged cloudformation template
aws cloudformation deploy --template-file packaged.yaml --stack-name cf-package-demo --capabilities CAPABILITY_NAMED_IAM
