# postfix2http

Postfix receives emails, converts them to JSON and redirects them to an HTTP server.
Environment variables:
CONFIG_HTTP_SERVER - URL to redirect the HTTP request
CONFIG_RELAY_DOMAINS - domains list for the mail server