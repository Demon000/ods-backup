#!/usr/bin/env bash

source "vars.sh"

mkdir -p "$ODDSOLUTIONS_US_HTML"
mkdir -p "$ODS_NINJA_HTML"
mkdir -p "$ODS_NINJA_BUILD_SERVER"

# Nginx
cp "$LOCAL_NGINX/oddsolutions.us" "$NGINX_SITES_AVAILABLE/oddsolutions.us"
cp "$LOCAL_NGINX/ods.ninja" "$NGINX_SITES_AVAILABLE/ods.ninja"
ln -s "$NGINX_SITES_AVAILABLE/oddsolutions.us" "$NGINX_SITES_ENABLED/oddsolutions.us"
ln -s "$NGINX_SITES_AVAILABLE/ods.ninja" "$NGINX_SITES_ENABLED/ods.ninja"

# Systemd
cp "$LOCAL_SYSTEMD/*" "$SYSTEMD_PATH"

# Webhook
cp "$LOCAL_WEBHOOK" "$WEBHOOK_PATH"

# Builds publisher
git clone https://github.com/Demon000/builds_publisher "$BUILDS_PUBLISHER_PATH"
cp ./builds_publisher/personal_config.json "$BUILDS_PUBLISHER_PATH"
cp ./builds_publisher/prod_config.json "$BUILDS_PUBLISHER_PATH"
python -m venv "$BUILDS_PUBLISHER_PATH/venv"
pushd "$BUILDS_PUBLISHER_PATH"
pip install -r requirements.txt
popd

# Updater
git clone https://gitlab.com/oddsolutions/infrastructure/updater -b main-prod "$ODDSOLUTIONS_US_UPDATER"
git clone https://gitlab.com/oddsolutions/infrastructure/updater -b main "$ODS_NINJA_UPDATER"

# Updater client
git clone https://gitlab.com/oddsolutions/infrastructure/updater-client "$ODDSOLUTIONS_US_UPDATER_CLIENT"
git clone https://gitlab.com/oddsolutions/infrastructure/updater-client "$ODS_NINJA_UPDATER_CLIENT"

echo > "$ODDSOLUTIONS_US_UPDATER_CLIENT/.env.local" <<EOL
VITE_API_HOSTNAME=https://updater-api.oddsolutions.us/
VITE_BRAND_NAME="Odd Solutions"
VITE_WIKI_URL=https://wiki.oddsolutions.us
VITE_HIDE_VERIFIER=true
EOL

pushd "$ODDSOLUTIONS_US_UPDATER_CLIENT"
npm install
npm run build
popd

echo > "$ODS_NINJA_UPDATER_CLIENT/.env.local" <<EOL
VITE_API_HOSTNAME=https://updater-api.ods.ninja/
VITE_BRAND_NAME="Odd Solutions Personal"
VITE_WIKI_URL=https://wiki.oddsolutions.us
VITE_HIDE_VERIFIER=true
EOL

pushd "$ODS_NINJA_UPDATER_CLIENT"
npm install
npm run build
popd

# Wiki
git clone https://gitlab.com/oddsolutions/infrastructure/wiki "$ODDSOLUTIONS_US_WIKI"

# Webssh
git clone https://gitlab.com/oddsolutions/infrastructure/webssh "$ODS_NINJA_WEBSSH"
cp "$LOCAL_WEBSSH/config.js" "$ODS_NINJA_WEBSSH"
pushd "$ODS_NINJA_WEBSSH"
npm install
npm run link
popd

# H5AI
wget https://github.com/lrsjng/h5ai/releases/download/v0.30.0/h5ai-0.30.0.zip
unzip h5ai-0.30.0.zip -d "$ODS_NINJA_H5AI"
cp "$LOCAL_H5AI/styles.css" "$ODS_NINJA_H5AI/public/css"
