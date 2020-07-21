Bitnami WordPress Backup
========================

## Summary

A simple script for creating a local backup of a Bitnami Wordpress 
(both [application files][0] and [DB)][1].) 

Backups are automatically timestamped & created under `/var/backups/wordpress`.

## Running

Simply make `bitnami_wordpress_backup.sh` executable and then run on from inside your Bitnami 
WordPress instance:

```bash
chmod +x bitnami_wordpress_backup.sh
sudo ./bitnami_wordpress_backup.sh
```

Enjoy! 🎉


[0]: https://docs.bitnami.com/aws/apps/wordpress/administration/backup-restore/
[1]: https://docs.bitnami.com/aws/apps/wordpress/administration/backup-restore-mysql-mariadb/
