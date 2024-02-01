FROM golang:1.17-alpine AS builder

WORKDIR /app

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o script script.go

FROM scratch

WORKDIR /app

COPY --from=builder /app/script .

CMD ["./script"]