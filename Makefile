BINARY_NAME := rememberme
VERSION := 1.0.0
BUILD_DIR := bin
INSTALL_DIR := /usr/local/bin

build:
	@echo "Building $(BINARY_NAME)..."
	mkdir -p $(BUILD_DIR)
	go build -o $(BUILD_DIR)/$(BINARY_NAME) main.go
	@echo "Build complete. Binary is located at $(BUILD_DIR)/$(BINARY_NAME)"
	@echo "Version: $(VERSION)"
	@echo "Build date: $(shell date +'%Y-%m-%d %H:%M:%S')"
	@echo "Go version: $(shell go version | awk '{print $$3}')"

install:
	@echo "Installing $(BINARY_NAME) to $(INSTALL_DIR)..."
	sudo cp $(BUILD_DIR)/$(BINARY_NAME) $(INSTALL_DIR)/$(BINARY_NAME)
	sudo chmod +x $(INSTALL_DIR)/$(BINARY_NAME)

clean:
	@echo "Cleaning up..."
	sudo rm -rf $(BUILD_DIR)
	if [ -f "$(INSTALL_DIR)/$(BINARY_NAME)" ]; then \
		echo "Removing installed binary from $(INSTALL_DIR)..."; \
		sudo rm -f $(INSTALL_DIR)/$(BINARY_NAME); \
	fi


all: build install
