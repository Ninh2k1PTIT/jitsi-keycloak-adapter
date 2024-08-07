#!/bin/bash

cp /usr/share/jitsi-meet/body.html /usr/share/jitsi-meet/{body.html.$(date +'%H%M%S').bck}
cp templates/usr/share/jitsi-meet/body.html /usr/share/jitsi-meet/
cp templates/usr/share/jitsi-meet/static/oidc-* /usr/share/jitsi-meet/static/

mkdir -p /home/adapter/app
cp config.ts /home/adapter/app/
cp adapter.sh /home/adapter/app/
cp adapter.ts /home/adapter/app/
cp context.ts /home/adapter/app/
chown adapter: /home/adapter/app -R

cp templates/etc/systemd/system/oidc-adapter.service /etc/systemd/system/

systemctl daemon-reload
systemctl enable oidc-adapter.service
systemctl start oidc-adapter.service
systemctl status oidc-adapter.service