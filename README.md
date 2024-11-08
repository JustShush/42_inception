# So same thing
*back to the wp-config.php*
Where are back with the ERROR: 

```sh
wordpress  | Error: WordPress files seem to already be present here.
```

So i tried running `php-fpm7.4 -F` it gives me this error:

PATH + CMD: `root@1e35a67e2362:/usr/sbin# php-fpm7.4 -F`
```sh
[08-Nov-2024 18:19:00] ERROR: unable to bind listening socket for address '0.0.0.0:9000': Address already in use (98)
[08-Nov-2024 18:19:00] ERROR: FPM initialization failed
```

# Go back
wordpress exited with code 0
nginx      | nginx: [emerg] host not found in upstream "wordpress" in /etc/nginx/conf.d/nginx.conf:32
nginx exited with code 1
