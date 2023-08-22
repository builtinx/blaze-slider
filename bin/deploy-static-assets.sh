#!/bin/bash
if [ ! "$BUILTIN_STATIC_S3_URI" ]; then
    echo "Missing S3 URI; exiting"
    exit 1
fi

ASSETFILES=$(find blaze-slider/dist -type f -mindepth 1 -maxdepth 3)

for file in $ASSETFILES
do
    aws s3 cp "$file" "${BUILTIN_STATIC_S3_URI}/dist/blaze/$(basename "$file")"
done
