FROM golang:alpine AS builder

WORKDIR /var/www

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o dockergo

FROM scratch

COPY --from=builder /var/www/dockergo .

CMD ["./dockergo"]