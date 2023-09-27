ARG VERSION=2

FROM caddy:${VERSION}-builder AS builder

RUN apk add git

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/baldinof/caddy-supervisor

FROM caddy:${VERSION}

COPY --from=builder /usr/bin/caddy /usr/bin/caddy