#!/bin/sh

BASE_DIR=${1:-$PWD}

if [ ! "$JAVA_HOME" ]; then
    case $(uname -s) in
        Darwin)
        export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Home/"
        ;;
        Linux)
        export JAVA_HOME=/usr/lib/jvm/java
        ;;
    esac
fi

export AWS_AUTO_SCALING_HOME=$BASE_DIR/AutoScaling-1.0.61.1
export AWS_CLOUD_WATCH_HOME=$BASE_DIR/CloudWatch-1.0.13.4
export AWS_ELB_HOME=$BASE_DIR/ElasticLoadBalancing-1.0.17.0
export EC2_API_HOME=$BASE_DIR/ec2-api-tools-1.6.4
export EC2_AMITOOL_HOME=$BASE_DIR/ec2-ami-tools-1.4.0.7
export AWS_RDS_HOME=$BASE_DIR/RDSCli-1.10.003

export EC2_HOME=$EC2_API_HOME
export SERVICE_HOME=$AWS_ELB_HOME
export AWS_CLOUDWATCH_HOME=$AWS_CLOUD_WATCH_HOME

export PATH=$PATH:$EC2_AMITOOL_HOME/bin:$EC2_API_HOME/bin:$AWS_ELB_HOME/bin:$AWS_CLOUD_WATCH_HOME/bin:$AWS_AUTO_SCALING_HOME/bin:$AWS_RDS_HOME/bin
unset BASE_DIR
set +x

