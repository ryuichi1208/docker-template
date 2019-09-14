FROM golang:alpine AS build-env

# 最低限のビルド用ツール
RUN apk --no-cache add git make build-base

COPY . .

RUN mkdir -p /build
RUN go build -a -tags "netgo" -installsuffix netgo -ldflags="-s -w -extldflags \"-static\"" -o=/build/app main.go

FROM alpine:3.9.4
# Timezone = Tokyo
RUN apk --no-cache add tzdata && \
    cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

COPY --from=build-env /build/app /app
RUN chmod u+x /app

ENTRYPOINT ["/app"]
EXPOSE 80
