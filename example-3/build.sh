set -ex

# install python dependencies
pip3 install --system --requirement lambda-b/requirements.txt --target lambda-b/src/

# package cloudformation templates
aws cloudformation package --s3-bucket cf-package-demo --template-file cloudformation.yaml --output-template-file packaged.yaml

# deploy packaged cloudformation template
aws cloudformation deploy --template-file packaged.yaml --stack-name cf-example-3 --capabilities CAPABILITY_NAMED_IAM
