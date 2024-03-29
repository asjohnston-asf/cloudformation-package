set -ex

# package lambda function and prepare final cloudformation template
aws cloudformation package --template-file cloudformation.yaml \
                           --s3-bucket cf-package-demo \
                           --output-template-file packaged.yaml

# deploy final cloudformation template
aws cloudformation deploy --template-file packaged.yaml \
                          --stack-name cf-example-2 \
                          --capabilities CAPABILITY_NAMED_IAM

# invoke lambda to verify deployment
aws lambda invoke --function-name cf-example-2 out.txt
cat out.txt
