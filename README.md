# docker-compose-wordpress-LITESPEED
[Litespeed home page aka What is Litespeed](https://www.litespeedtech.com/)
### Infra/Hosting for developing and troubleshooting a WordPress website inside of the LiteSpeed environment
Contains: 
* LiteSpeed Memcached Container
* LiteSpeed Webserver + LiteSpeed PHP (LSPHP) 7.4 Container
* MariaDB 10.6 Container
* phpMyAdmin Container

## Manage infra
`docker-compose up -d`

`docker-compose down`

## Upload a WordPress Website
* Open `localhost:8081` in the browser
* Login to the phpMyAdmin with `root/my_password`
* Upload your exported DB
* Upload the website's root dir into the `/app/public_html` folder
* Make changes to the `wp-config.php` with the new DB credentials and add:
```
define( 'WP_HOME', 'http://localhost' ); 
define( 'WP_SITEURL', 'http://localhost' );
define( 'FS_METHOD', 'direct' );
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
