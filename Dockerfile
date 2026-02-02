FROM rust:alpine AS builder
RUN apk add --no-cache musl-dev git npm perl make
RUN git clone https://github.com/cooklang/CookCLI.git /build
WORKDIR /build
RUN npm install && npm run build-css
RUN cargo build --release

FROM alpine:latest
COPY --from=builder /build/target/release/cook /usr/local/bin/cook
WORKDIR /recipes
ENTRYPOINT ["cook"]
