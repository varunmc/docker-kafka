# docker-kafka
_Docker image for Kafka_

This image is intended to be used as part of the [Stack](https://github.com/varunmc/docker-stack) and therefore [Zookeeper](https://github.com/varunmc/docker-zookeeper) is referenced by its service name "zookeeper". To run this image standalone, the Zookeeper host can be overriden by adding the following line to your hosts file:

```
127.0.0.1   zookeeper
```

The _init.sh_ script will wait for Zookeeper to be up before starting Kafka. 

## Getting Started
The [AWS CodeFormation](https://console.aws.amazon.com/cloudformation/home?region=us-east-1#/stack/detail?stackId=arn:aws:cloudformation:us-east-1:497513737772:stack%2FKafka%2Fe9f68bc0-91d5-11e7-9a79-50d5cd265c36) template _stack.yml_ will create an [AWS CodePipeline](https://console.aws.amazon.com/codepipeline/home?region=us-east-1#/view/Kafka) with an [AWS CodeBuild](https://console.aws.amazon.com/codebuild/home?region=us-east-1#/projects/Kafka/view) builder as defined in _buildspec.yml_. The continuous build pipeline will build and publish the image to [AWS ECR](https://console.aws.amazon.com/ecs/home?region=us-east-1#/repositories/mc.varun:kafka#images;tagStatus=ALL).

## Links
* [Kafka](https://kafka.apache.org)
