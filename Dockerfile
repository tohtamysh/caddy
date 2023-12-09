ARG VERSION=2.7.6

FROM caddy:${VERSION}-builder-alpine AS builder

RUN apk add git

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/baldinof/caddy-supervisor

FROM caddy:${VERSION}-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
