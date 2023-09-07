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

