#!/usr/bin/env bash

source "vars.sh"

# Nginx
mkdir -p "$LOCAL_NGINX"
cp "$NGINX_SITES_AVAILABLE/oddsolutions.us" "$LOCAL_NGINX/oddsolutions.us"
cp "$NGINX_SITES_AVAILABLE/ods.ninja" "$LOCAL_NGINX/ods.ninja"

# Systemd
mkdir -p "$LOCAL_SYSTEMD"
for SERVICE in "${SYSTEMD_SERVICES[@]}"; do
    cp "$SYSTEMD_PATH/$SERVICE" "$LOCAL_SYSTEMD"
done

# Webhook
cp "$WEBHOOK_PATH" "$LOCAL_WEBHOOK"

# Builds publisher
mkdir -p "$LOCAL_BUILDS_PUBLISHER"
cp "$BUILDS_PUBLISHER_PATH/personal_config.json" "$LOCAL_BUILDS_PUBLISHER"
cp "$BUILDS_PUBLISHER_PATH/prod_config.json" "$LOCAL_BUILDS_PUBLISHER"

# Webssh
mkdir -p "$LOCAL_WEBSSH"
cp "$ODS_NINJA_WEBSSH/config.js" "$LOCAL_WEBSSH"
