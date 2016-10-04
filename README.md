# Tubet API

Tubet is a Restful API providing access to sports betting odds in Kenya.


## Deploying to AWS Beanstalk

```
  # Setup the elastic beanstalk env
  eb init tubet -p Ruby -r eu-west-1

  # Create the dev environment
  eb create tubet-dev --single --keyname ongair-shared.pem --envvars SECRET_KEY_BASE=`rake secret`

  # Deploying
  eb deploy tubet-dev
```
