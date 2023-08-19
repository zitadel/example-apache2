# ZITADEL OpenID Authentication Apache

For now, this is just a basic example. Needs some more love and review.

## Configure

### Setup PKCE client in ZITADEL

- Go to your organization and setup a new application with the type PKCE
- When created go to the "Redirect Settings" and **enable Development Mode*
- Add the Redirect Uri `http://localhost:8080/secure/callback`
- Add the Post Logout Uri `http://localhost:8080/index.html`
![Configuration](/img/configuration.png)
![Redirect Settings](/img/redirect_settings.png)

You can find the url to your discovery endpoint under "URLs":
![Discovery Endpoint](/img/urls.png)

### Configure Apache2

1. Rename `example.auth_openidc-httpd.conf` to `auth_openidc-httpd.conf`
2. Update the values in `auth_openidc-httpd.conf` with values from ZITADEL.

auth_openidc-httpd.conf
```
OIDCProviderMetadataURL https://<your_domain>.zitadel.cloud/.well-known/openid-configuration
OIDCClientID <client_id, eg 227791....@apache_test>
# OIDCRedirectURI is a vanity URL that must point to a path protected by this module but must NOT point to any content
OIDCRedirectURI <redirect_uri, eg http://localhost:8080/secure/callback>
OIDCCryptoPassphrase <very-secure-phrase>
```

## How to run

```bash
docker build -t my-apache2 .
docker run -dit --name my-running-app -p 8080:80 my-apache2
``````

Open your [browser](http://localhost:8080) and click on the link to the secure route.

## References

- https://github.com/OpenIDC/mod_auth_openidc/wiki#16-what-does-a-minimal-apache-configuration-file-look-like
- https://github.com/OpenIDC/mod_auth_openidc/blob/master/auth_openidc.conf