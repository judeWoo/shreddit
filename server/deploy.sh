#!/bin/bash

echo What should the version be?
read VERSION

docker build -t judeWoo/shreddit:$VERSION .
docker push judeWoo/shreddit:$VERSION
ssh root@64.227.13.208 "docker pull judeWoo/shreddit:$VERSION && docker tag judeWoo/shreddit:$VERSION dokku/api:$VERSION && dokku deploy api $VERSION"