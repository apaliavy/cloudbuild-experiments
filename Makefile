# Define the application binary name
BINARY_NAME=simple-calculator

# Define the golangci-lint binary name
GOLANGCI_LINT=golangci-lint

# Check if golangci-lint is installed
$(GOLANGCI_LINT):
	@command -v golangci-lint >/dev/null 2>&1 || { \
		echo >&2 "golangci-lint is not installed. Installing..."; \
		curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(GOPATH)/bin v1.50.1; \
	}

# Build the application
build:
	go build -o $(BINARY_NAME) cmd/calculator/main.go

# Run the application
run: build
	./$(BINARY_NAME)

# Run tests
test:
	go test -v ./...

# Run golangci-lint
lint: $(GOLANGCI_LINT)
	$(GOLANGCI_LINT) run

# Clean up the build artifacts
clean:
	rm -f $(BINARY_NAME)

# Run all (build, lint, test, run)
all: clean lint test run

.PHONY: build run test lint clean all
