# Build stage
FROM golang:alpine AS builder

WORKDIR /app

# Copy the Go source code
COPY . .

# Build the Go application
RUN go build -o main .

# Run stage
FROM alpine:latest

WORKDIR /app

# Copy the compiled binary from the builder stage
COPY --from=builder /app/main .

# Expose the port the app will run on
EXPOSE 8080

# Command to run the executable
CMD ["./main"]
