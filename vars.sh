BUILDS_PUBLISHER_PATH="/var/www/builds_publisher"
LOCAL_BUILDS_PUBLISHER="./builds_publisher"

NGINX_SITES_AVAILABLE="/etc/nginx/sites-available/"
NGINX_SITES_ENABLED="/etc/nginx/sites-enabled/"

SYSTEMD_PATH="/etc/systemd/system/"
WEBHOOK_PATH="/etc/webhook.config.json"

LOCAL_NGINX="./nginx"
LOCAL_SYSTEMD="./systemd"
LOCAL_WEBHOOK="./webhook.config.json"
LOCAL_WEBSSH="./webssh"

SYSTEMD_SERVICES=(
"updater-builds.service"
"updater-prod-builds.service"
"updater-prod.service"
"updater.service"
"webhook.service"
"wiki.service"
"webssh.service"
)

ODDSOLUTIONS_US_HTML="/var/www/oddsolutions.us/html"
ODDSOLUTIONS_US_UPDATER="$ODDSOLUTIONS_US_HTML/updater"
ODDSOLUTIONS_US_UPDATER_CLIENT="$ODDSOLUTIONS_US_HTML/updater-client"
ODDSOLUTIONS_US_WIKI="$ODDSOLUTIONS_US_HTML/wiki"

ODS_NINJA_HTML="/var/www/ods.ninja/html"
ODS_NINJA_UPDATER="$ODS_NINJA_HTML/updater"
ODS_NINJA_UPDATER_CLIENT="$ODS_NINJA_HTML/updater-client"
ODS_NINJA_WEBSSH="$ODS_NINJA_HTML/webssh"
