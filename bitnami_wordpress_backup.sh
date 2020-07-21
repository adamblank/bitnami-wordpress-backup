#!/usr/bin/env bash
# A simple script to backup Bitnami WordPress application files and database
# See Bitnami documentation for details https://docs.bitnami.com/aws/apps/wordpress

set -e

start_server() {
  /opt/bitnami/ctlscript.sh start
}

on_error() {
  start_server
  popd
}

trap on_error ERR

backup_time=$(date +"%Y-%m-%d-%H%M%S")

echo "Starting application backup..."

# run backups from proper directory
mkdir -p /var/backups/wordpress
pushd /var/backups/wordpress

echo "Stopping all servers"
/opt/bitnami/ctlscript.sh stop

echo "Compressing directory /opt/bitnami"
tar -pczvf application-backup-${backup_time}.tar.gz /opt/bitnami

echo "Restarting all servers"
start_server

echo "Application backup complete! Starting database backup..."
echo "You will be prompted for your root database password shortly"

mysqldump -A -u root -p > database-backup-${backup_time}.sql

echo "Database backup complete!"

popd