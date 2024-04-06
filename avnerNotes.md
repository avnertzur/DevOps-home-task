# Not the way I though it would go… I used the readme file and followed the steps

```

1. I added a localstack compose file as suggested in the readme, which I think is not suable for the task (details below)

2. I added the lamda.tf content with 3 lambda sections (the name that was in the api-gateway.tf)  file “test_lambda” using the first image, and the other two with new names. Also added the role for the lambda.

3. applied the terraform deployment and tried to query the lambda, which uses a docker image, but I kept getting an error that the “The specified bucket does not exist”; spent too much time on trying to get an answer but not luck.

4. I tried to deploy it to my personal AWS account… which didn’t work since it was looking for the docker images in an ECR. That was the clue that got be back to using localstack

5. I redeployed the terraform and started looking at the lamda’s properties. The property of “PackageType” was “Image” but there was no “image_uri”

6. looking at localstack documentation got me to this page: https://docs.localstack.cloud/tutorials/lambda-ecr-container-images/ which tells me you need to run the “pro” version for supporting the.

7. I remembered that in the email from Gal there was a token, so I created a new compose file for the pro version, was able to create an ECR but couldn't list any images I uploaded …  turns out you need to have persistency, so I added the flag and a docker volume.

8. I followed the guide https://docs.localstack.cloud/tutorials/lambda-ecr-container-images/ to make sure its working, the image was successfully listed by the aws cli (or awslocal)

That's it, I spent a lot of time to get this far but I need to stop.

BTW, for the sake aof transparicy I already "dived" into t8. I followed the guide https://docs.localstack.cloud/tutorials/lambda-ecr-container-images/ to make sure its working, the image was successfully listed by the aws cli (or awslocal)

That's it, I spent a lot of time to get this far but I need to stop.

BTW, for the sake of transparency I already "dived" into the containers and knew the expected input and outputs I need to get the answer. 
'The Authorization header token is the epoch value of 01.01.2000 12:00:00 AM GMT.' & if (946684800) then 'Congratulations! You have successfully authorized the request, the secret is: Null.'he containers and knew the expected input and outputs I need to get the answer

```