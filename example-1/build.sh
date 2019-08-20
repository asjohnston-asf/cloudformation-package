set -e

# build and upload lambda deployment package
cd src/
zip -r ../package.zip *
cd ..
aws s3 cp package.zip s3://cf-package-demo/

# deploy cloudformation template
aws cloudformation deploy --template-file cloudformation.yaml --stack-name cf-package-demo --capabilities CAPABILITY_NAMED_IAM --parameter-overrides Bucket=cf-package-demo Key=package.zip
