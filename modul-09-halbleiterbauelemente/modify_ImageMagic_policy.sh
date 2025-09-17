#!/bin/bash


POLICY_FILE="/etc/ImageMagick-6/policy.xml"
NEW_LIMIT_DISK="8GiB"
NEW_LIMIT_MEMORY="4GiB"
NEW_LIMIT_MAP="4GiB"

sed -i -e '/<policy domain="resource" name="disk"/{s/value="[^"]*"/value="'"$NEW_LIMIT_DISK"'"/}' "$POLICY_FILE"
sed -i -e '/<policy domain="resource" name="memory"/{s/value="[^"]*"/value="'"$NEW_LIMIT_MEMORY"'"/}' "$POLICY_FILE"
sed -i -e '/<policy domain="resource" name="map"/{s/value="[^"]*"/value="'"$NEW_LIMIT_MAP"'"/}' "$POLICY_FILE"

identify -list resource