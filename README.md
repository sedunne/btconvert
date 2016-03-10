# BTConvert

A very simple Sinatra app that converts a given BTC amount into a variety of currencies.

### Requirements

BTConvert was tested with Ruby 2.1, but may work on other versions. Unicorn and Bundler should be installed at the system level. Access to a Redis instance for caching return data from Blockchain.info is needed as well.

### Usage

Install the gem dependencies locally with bundle:

```
bundle install --path vendor/bundle
```

If setting up with Unicorn, from the project directory run:

```
unicorn -c unicorn.rb -E production -D
```

to start the Unicorn instance as a socket in tmp/sockets/unicorn.sock. Point your webserver to this socket when setting up your proxy (not covered here).

Once the application is listening, you can retrieve data from it via POST requests. A request for one BTC in the default currency (USD) would look something like:

```
$ curl --data "btc=1.0" https://domain.com/btconvert
413.01
```

You can also specify a currency by passing the 'cur' parameter like so:

```
curl --data "btc=1.0&cur=JPY" https://domain.com/btconvert
46291.33
```

You can find a full list of supported currencies at: https://blockchain.info/ticker

### License

This project is licensed under the MIT license. See the LICENSE file for copyright and full details.
