# docker-build-wg-wrk

Docker build https://github.com/wg/wrk, see https://hub.docker.com/r/qyvlik/wrk

# using lua scripts

> if your need using luarocks install other deps, please run `apk add make gcc libc-dev` in container or build your own docker image.

- `example.lua`

```lua
JSON = require('cjson')
-- your wrk scripts
```

```bash
docker run --rm -it \
  -v ./scripts:/scripts \
  qyvlik/wrk:4.2.0 \
    -t1 \
    -c1 \
    -d30s \
    -s /scripts/example.lua \
    http://your-url 
```

# Ref

1. https://hub.docker.com/layers/akorn/luarocks/lua5.1-alpine/
