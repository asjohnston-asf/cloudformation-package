set -e

# build and upload lambda deployment package
cd src/
zip -r ../package.zip *
cd ..
aws s3 cp package.zip s3://$BUCKET/

# deploy cloudformation template
aws cloudformation deploy --template-file cloudformation.yaml --stack-name $STACK_NAME --capabilities CAPABILITY_NAMED_IAM --parameter-overrides Bucket=$BUCKET Key=package.zip
