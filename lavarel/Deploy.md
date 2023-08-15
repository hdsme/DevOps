Mixed Content, This request has been blocked; the content must be served over HTTPS

App/Providers/AppServiceProvider
use Illuminate\Support\Facades\URL;
public function boot()
{
    URL::forceScheme('https');
}