# fedi.cress.space

## about

Setup and update a <https://gotosocial.org> on <https://fly.io> for <https://fedi.cress.space>.

This setup has no email support, so administration has to happen via shell (see below).


## bootstrap / update

To update to a newer version edit `bootstrap.sh`.

run script:
```
sh bootstrap.sh
```

and edit config.yaml if new. For updated version look into added settings!


## setup for fly.io

create volume
```
flyctl volumes create gotosocial_data --app fedi-cress-space --region fra --size 1
```


## deploy

```
flyctl deploy --local-only --region fra
```


## DNS / SSL

Add `A` and `AAAA` records to your DNS provider.
And a CNAME for the letsencrypt of <https://fly.io>, see <https://fly.io/apps/fedi-cress-space/certificates>


## add user(s) to instance

Login to the instance via ssh
```
flyctl ssh console
```

Create a superuser
```
# create account
/app/gotosocial --config-path /app/config.yaml admin account create --username some_username --email some_email@whatever.org --password 'SOME_PASSWORD'
# activate account
/app/gotosocial --config-path /app/config.yaml admin account confirm --username some_username
# give super user rights to account
/app/gotosocial --config-path /app/config.yaml admin account promote --username some_username
```

First two steps to add "normal" users.
