#!/bin/sh
set -xue
cd `dirname $0`

[ -f awstools.list ] && {
    wget -c -i awstools.list
    ls *.zip | xargs -n 1 unzip -u
    exit
}


# Dev hacks down here.

# Hack?. Getting list of amazon's S3 ec2-downloads bucket
s3cmd ls s3://ec2-downloads > ec2-downloads.list

TOOLS="AutoScaling CloudWatch ec2-ami-tools ec2-api-tools ElasticLoadBalancing"
for tool in $TOOLS; do
    # Get only first (freshest) zip file
    key=$(egrep 'zip$' ec2-downloads.list | sort -nr | grep $tool | head -1 | awk '{ print $4}')

    b=$(basename $key)
    url="http://ec2-downloads.s3.amazonaws.com/$b"
    echo $url >> awstools.list

    wget -c $url
done
echo 'http://s3.amazonaws.com/rds-downloads/RDSCli.zip' >> awstools.list
ls *.zip | xargs -n 1 unzip -u

cd -

