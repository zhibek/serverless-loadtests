# serverless-loadtests

This repository configures **serverless-artillery** to run loadtests using AWS Lambda infrastructure (a cost effective way of producing a large amount of load for testing).


## Prerequisites

Before you start, make sure you have AWS (Amazon Web Services) credentials setup and ready to use. Copy `.env.dist` to `.env` and paste in your AWS credentials after `AWS_ACCESS_KEY_ID=` and `AWS_SECRET_ACCESS_KEY=`.

Also, to improve reporting, you can provide an InfluxDB instance which loadtests stats shall be sent to. This can be used to analyse the loadtests using Grafana. Uncomment the relevant lines in `script.yml` to enable reporting to InfluxDB.


## Installation

Now start the Docker containers to setup an environment containing `slsart` (serverless-artillery) binaries:
```
docker-compose up
```

Once the image is built, you can proceed with using `slsart` to deploy the required serverless function to AWS:
```
docker-compose exec app ./deploy.sh
```


## Configuring Loadtests
Loadtests are declared using configuration files (the default filename is `script.yml`). A sample `script.yml` has been created by running \"slsart script\". This script should be modified to target the website under testing.

Further reference can be found here:
https://artillery.io/docs/script-reference/


## Running Loadtests
To run a loadtest (based on the script.yaml configuration defined above), run the following command:
```
docker-compose exec app ./runtest.sh
```


## Cleanup
To remove the `slsart` serverless function from AWS, run the following command:
```
docker-compose exec app ./cleanup.sh
```
