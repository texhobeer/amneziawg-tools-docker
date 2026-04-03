FROM alpine:3.19 AS build-image

RUN apk add --no-cache linux-headers build-base

COPY src /app
WORKDIR /app

RUN make -j4

FROM alpine:3.19

COPY --from=build-image /app/wg /usr/bin/awg
COPY --from=build-image /app/wg-quick/linux.bash /usr/bin/awg-quick
