set -ex

# build and upload lambda deployment package
cd src/
zip -r ../package.zip *
cd ..
aws s3 cp package.zip s3://cf-package-demo/

# deploy cloudformation template
aws cloudformation deploy --template-file cloudformation.yaml \
                          --stack-name cf-example-1 \
                          --capabilities CAPABILITY_NAMED_IAM \
                          --parameter-overrides Bucket=cf-package-demo Key=package.zip

# invoke lambda to verify deployment
aws lambda invoke --function-name cf-example-1 out.txt
cat out.txt
