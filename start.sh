#!/bin/sh
UID=${UID:-0}
GID=${GID:-0}
echo "appuser:x:${UID}:${GID}:appuser:/app:/bin/false" >> /etc/passwd
echo "appgroup:x:${GID}:appuser" >> /etc/group
mkdir -pv /config /data
chown -R appuser:appgroup /config
chown -R appuser:appgroup /data
exec /bin/su -p -s "/bin/sh" -c "exec /sabnzbd/SABnzbd.py -b 0 -f /config/" appuser
