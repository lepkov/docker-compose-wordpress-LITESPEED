# docker-compose-wordpress-LITESPEED
[Litespeed home page aka What is Litespeed](https://www.litespeedtech.com/)
### Infra/Hosting for developing and troubleshooting a WordPress website inside of the LiteSpeed environment
Contains: 
* LiteSpeed Memcached Container
* LiteSpeed Webserver + LiteSpeed PHP (LSPHP) 7.4/8.1 Container
* MariaDB 10.6 Container
* phpMyAdmin Container
![image](https://github.com/lepkov/docker-compose-wordpress-LITESPEED/assets/23506790/d3f0aa87-6e1d-4e13-9a70-4e4a73ec0581)

## Manage infra
`docker-compose up -d`

`docker-compose down`

bash start.sh - cleans logs and runs `docker-compose up -d`

bash backup_files.sh - runs `cp -r "$WORKDIR/public_html" "$WORKDIR/backup/public_html"` with checking

bash clean.sh - runs `docker-compose down`, `rm -rf app/logs/* && rm -rf app/logs/.*`, `docker system prune --all --force`

## Upload a WordPress Website into Docker Compose Infra
* Open `localhost:8081` in the browser
* Login to the phpMyAdmin with `root/my_password`
* Upload your exported DB
* Upload the website's root dir into the `/app/public_html` folder
* Make changes to the `wp-config.php` with the new DB credentials and add:
```
define('DB_NAME', 'YOUR DB NAME');
define('DB_USER', 'root');
define('DB_PASSWORD', 'my_password');
define('WP_HOME', 'http://localhost'); 
define('WP_SITEURL', 'http://localhost');
define('FS_METHOD', 'direct');
```
* Make changes in `.htaccess` in paths if they exist
* Open `localhost` in the browser to check your website
## LiteSpeed WebAdmin
* Login to `localhost:7080` with `admin/my_password`
## LiteSpeed MemCached (LSMCD)
To connect to the LSMCD:
* Specify the hostname `litespeed_memcache`
* Specify the port `11211`
No special credentials are needed.
## Logs
All logs are in the `/app/logs` folder.

Search and Replace sitename in the DB:
`sed -i 's/original\.site/localhost/g' newlepko_lepkov_shop.sql`
