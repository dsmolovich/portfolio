#!/usr/bin/env bash
BASE_URL='https://sites.google.com/site/dsmolovich/_/rsrc/1352864200223/home/';

for i in {43..70}
do
    IMAGE_URL=$BASE_URL$i'.jpg';
    echo $IMAGE_URL;
    wget $IMAGE_URL;
done