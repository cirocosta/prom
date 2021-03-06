# cirocosta/prom

> Prometheus ([prom/prometheus](https://hub.docker.com/r/prom/prometheus/)) with environment variable substitution

Usage is the same as you would for `prom/prometheus` but requires writing the contifuration file to `/etc/prometheus/prometheus.env.yml`. On start up time the configuration file gets its environment variables substituted and the resulting file written to `/etc/prometheus/prometheus.yml` (which should be used as `config.file`.

note.: `envsubst` is being used with `-no-unset` meaning such that variables without defaults that are not set will make running the container fail.

The image is just a wrap around [github.com/a8m/envsubst](https://github.com/a8m/envsubst) and the original Prometheus Docker image.

## Examples

See `./example`.

## LICENSE

MIT
