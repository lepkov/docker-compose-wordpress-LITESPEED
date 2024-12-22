# Docker Compose WordPress with LiteSpeed

[Litespeed home page](https://www.litespeedtech.com/)

### Infrastructure for Developing and Troubleshooting a WordPress Website in a LiteSpeed Environment

This project sets up a WordPress environment using Docker Compose with LiteSpeed, MariaDB, and additional caching layers for high-load WooCommerce websites.

## Services

- **LiteSpeed Webserver + LiteSpeed PHP (LSPHP) 7.4/8.1/8.2/8.3 Container**
- **LiteSpeed Memcached Container**
- **MariaDB 10.6 Container**
- **phpMyAdmin Container**

![image](https://github.com/lepkov/docker-compose-wordpress-LITESPEED/assets/23506790/d3f0aa87-6e1d-4e13-9a70-4e4a73ec0581)

Infra size: ~940 MB

## Project Structure

```
docker-compose-wordpress-LITESPEED/
├── app/
│   ├── logs/
│   ├── public_html/
│   │   ├── wp-config.php
│   │   ├── .htaccess
│   │   └── ... (WordPress files)
│   └── backup/
├── dockerfiles/
│   ├── mariadb/
│   │   └── Dockerfile
│   ├── litespeed/
│   │   └── Dockerfile
│   └── lsmcd/
│       └── Dockerfile
├── .env.example
├── docker-compose.yml
├── README.md
├── start.sh
├── backup_files.sh
└── clean.sh
```

## Managing the Infrastructure

To prepare the infrastructure:
```sh
mv .env.example .env
```
```sh
git clone https://github.com/lepkov/docker-compose-wordpress-LITESPEED.git
```

To start the infrastructure:
```sh
docker-compose up -d
```

To stop the infrastructure:
```sh
docker-compose down
```

Additional scripts:
- `bash start.sh`: Cleans logs and runs `docker-compose up -d`
- `bash backup_files.sh`: Runs `cp -r "$WORKDIR/public_html" "$WORKDIR/backup/public_html"` with checking
- `bash clean.sh`: Runs `docker-compose down`, `rm -rf app/logs/* && rm -rf app/logs/.*`, `docker system prune --all --force`

## Uploading a WordPress Website into Docker Compose Infrastructure

1. Open `localhost:8081` in your browser.
2. Log in to phpMyAdmin with `root/my_password`.
3. Upload your exported database.
4. Upload the website's root directory into the `/app/public_html` folder.
5. Update the `wp-config.php` file with the new database credentials and add:
   ```php
   define('DB_NAME', 'YOUR_DB_NAME');
   define('DB_USER', 'root');
   define('DB_PASSWORD', 'my_password');
   define('WP_HOME', 'http://localhost');
   define('WP_SITEURL', 'http://localhost');
   define('FS_METHOD', 'direct');
   ```
6. Update paths in the `.htaccess` file if necessary.
7. Open `localhost` in your browser to check your website.

## LiteSpeed WebAdmin

Access the LiteSpeed WebAdmin at `localhost:7080` with the credentials `admin/my_password`.

## LiteSpeed Memcached (LSMCD)

To connect to LSMCD:
- Hostname: `litespeed_memcache`
- Port: `11211`
No special credentials are needed.

## Logs

All logs are located in the `/app/logs` folder.

## Useful Commands

Search and replace the site name in the database:
```sh
sed -i 's/original\.site/localhost/g' exported_db.sql
```

## Additional Notes

- Ensure you have Docker and Docker Compose installed on your system.
- The `phpmyadmin` service is intended for development purposes and should be disabled in production.
- Review and adjust the resource limits and reservations in the `docker-compose.yml` file based on your server's capacity.

## Contributing

Feel free to submit issues and pull requests to improve this project.

## License

This project is licensed under the MIT License.
