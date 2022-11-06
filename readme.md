# fedi.cress.space

## about

this runs gotosocial.org on fly.io

this setup has no email support, so administration has to happen via shell (see below)


## setup for fly.io

create volume
```
flyctl volumes create gotosocial_data --app fedi-cress-space --region fra --size 1
```


## deploy

```
flyctl deploy --local-only --region fra
```


## now add user(s) to the instance

login to the instance via ssh
```
flyctl ssh console
```

and create a superuser
```
# create account
/app/gotosocial --config-path /app/config.yaml admin account create --username some_username --email some_email@whatever.org --password 'SOME_PASSWORD'
# activate account
/app/gotosocial --config-path /app/config.yaml admin account confirm --username some_username
# give super user rights to account
/app/gotosocial --config-path /app/config.yaml admin account promote --username some_username
```
