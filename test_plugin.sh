#!/bin/sh

if [ "$1" = "" ]; then
    echo "Usage: test_plugin.sh <DIR>"
    exit 1
fi

# Clean plugin name
plugin=$(echo "$1" | sed "s/\///")

# Clean tag
tag=$(echo "$plugin" | awk '{print tolower($0)}')

# Build image
docker build -t $tag --build-arg BUILD_FROM=$(cat $plugin/config.json | jq -r '.image') -f $plugin/Dockerfile ./$plugin

# Run image
tmp=$(mktemp)
cat $plugin/config.json | jq -r '.options' > $tmp
docker run -it --rm -v $tmp:/data/options.json $tag