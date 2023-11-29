Mixed Content, This request has been blocked; the content must be served over HTTPS

`App/Providers/AppServiceProvider
use Illuminate\Support\Facades\URL;
public function boot()
{
    URL::forceScheme('https');
}`




`chmod -R 775 public`

`chmod -R 775 public/index.php`

`chown -R www-data:www-data bootstrap`

`chown -R www-data:www-data bootstrap/cache`

`chown -R www-data:www-data storage/logs`

`chown -R www-data:www-data storage/framework`

`sudo chown -R www-data:www-data storage/logs/laravel.log`

`sudo chown -R $USER:www-data storage`



Vite build
`npm install`

`npm run build`


## Note

build vite before and chown public

# SSL Error
- This site can’t provide a secure domain sent an invalid response., Try running Windows Network Diagnostics., ERR_SSL_PROTOCOL_ERROR
Try to use http instead of https, set .env into development, nginx configuration only port 80, and finally install SSL certbot
# Deploy laravel in subpath if not connect assets path
'mix_url' => env('APP_URL', 'http://localhost'), -> config/app.php