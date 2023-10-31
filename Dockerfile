FROM golang:1.21 as builder

WORKDIR /app

COPY main.go .

RUN go mod init main && \
    go build -ldflags "-s -w" main .


FROM scratch

COPY --from=builder /app/main .

CMD [ "./main"]
