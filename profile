#!/bin/sh
# use this file as "source ./profile"
#set -x
case $(uname -s) in
    Darwin)
        fpath=$(cd $(dirname $0) && pwd && cd $oldpwd)
    ;;
    *)
        if [ -z "$BASH_SOURCE" ]; then
            fpath=$(cd $(dirname $(readlink -f $0)) && pwd && cd $oldpwd)
        else
            fpath=$(cd $(dirname $(readlink -f $BASH_SOURCE)) && pwd && cd $OLDPWD)
        fi
    ;;
esac


BASE_DIR=$fpath


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

export EC2_AMITOOL_HOME=$BASE_DIR/ec2-ami-tools-1.3-49953
export EC2_API_HOME=$BASE_DIR/ec2-api-tools-1.3-51254
export AWS_ELB_HOME=$BASE_DIR/ElasticLoadBalancing-1.0.9.3
export AWS_CLOUD_WATCH_HOME=$BASE_DIR/CloudWatch-1.0.2.3
export AWS_AUTO_SCALING_HOME=$BASE_DIR/AutoScaling-1.0.9.0
export AWS_RDS_HOME=$BASE_DIR/RDSCli-1.1.004


export EC2_HOME=$EC2_API_HOME
export SERVICE_HOME=$AWS_ELB_HOME
export AWS_CLOUDWATCH_HOME=$AWS_CLOUD_WATCH_HOME

export PATH=$PATH:$EC2_AMITOOL_HOME/bin:$EC2_API_HOME/bin:$AWS_ELB_HOME/bin:$AWS_CLOUD_WATCH_HOME/bin:$AWS_AUTO_SCALING_HOME/bin:$AWS_RDS_HOME/bin
unset BASE_DIR
set +x

