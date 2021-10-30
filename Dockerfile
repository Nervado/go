FROM golang:1.16-alpine AS builder

WORKDIR /app

COPY app/ .

RUN go build fullcycle.go

FROM scratch

WORKDIR /app

COPY --from=builder /app /app

ENTRYPOINT ["./fullcycle"]