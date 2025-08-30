FROM golang:1.25-alpine

COPY . .
RUN go build .

EXPOSE 8080

ENTRYPOINT ["./web-server"]