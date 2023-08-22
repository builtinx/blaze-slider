#!/bin/bash
if [ ! "$BUILTIN_STATIC_S3_URI" ]; then
    echo "Missing S3 URI; exiting"
    exit 1
fi

ASSETDIRS=$(find blaze-slider/dist -type f -mindepth 1 -maxdepth 3 -exec basename {} \;)
for i in $ASSETDIRS
do
    if [ ! -d "blaze-slider/dist/${i}" ]
    then
        continue
    fi
    aws s3 sync "blaze-slider/dist/${i}" "${BUILTIN_STATIC_S3_URI}/dist/blaze/${i}"
done
