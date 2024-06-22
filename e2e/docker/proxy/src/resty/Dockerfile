FROM openresty/openresty:alpine-fat AS builder

# Install dependencies
RUN apk add --no-cache openssl openssl-dev git curl zip

# # Install luarocks
# RUN curl -R -O http://luarocks.github.io/luarocks/releases/luarocks-3.7.0.tar.gz
# RUN tar zxpf luarocks-3.7.0.tar.gz
# WORKDIR luarocks-3.7.0
# RUN ls -lha
# RUN ./configure --with-lua=/usr/include/lua5.1 --lua-suffix=5.1 --versioned-rocks-dir
# RUN make build && make install

COPY . /tmp/plugins/
WORKDIR /tmp/plugins/
RUN ls *.rockspec
RUN for rockspec in $(ls *.rockspec); do \
        luarocks make "$rockspec" --pack-binary-rock --deps-mode=none; \
    done
# RUN luarocks make --pack-binary-rock --deps-mode=none

RUN mkdir /prebuilt-rocks
RUN find . -name '*.rock' | xargs -I {} mv {} /prebuilt-rocks

FROM openresty/openresty:alpine-fat

RUN apk add --no-cache git perl curl unzip
RUN opm get ledgetech/lua-resty-http

RUN luarocks install lua-cjson

COPY --from=builder /prebuilt-rocks /prebuilt-rocks/

RUN luarocks install /prebuilt-rocks/lua-resty-opa-auth-1.0-1*.rock
