FROM openresty/openresty:alpine

RUN apk add --no-cache git perl curl
RUN opm get ledgetech/lua-resty-http

COPY src/basic_auth.lua /usr/local/openresty/nginx/conf/basic_auth.lua