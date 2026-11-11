SWIFT  := swiftc
SOURCE := theme-switcher.swift
TARGET := theme-switcher

LAUNCHD        := fr.aymerichenouille.theme-switcher.plist
LAUNCHD_DIR    := $(HOME)/Library/LaunchAgents
LAUNCHD_TARGET := $(LAUNCHD_DIR)/$(LAUNCHD)

.PHONY: all build run clean install uninstall

all: build

build: $(TARGET)

$(TARGET): $(SOURCE)
	$(SWIFT) -O $(SOURCE) -o $(TARGET)

$(LAUNCHD_TARGET): $(LAUNCHD)
	mkdir -p $(LAUNCHD_DIR)
	cp $(LAUNCHD) $(LAUNCHD_TARGET)

run: build
	./$(TARGET)

install: build $(LAUNCHD_TARGET)
	-launchctl bootout gui/$$(id -u) $(LAUNCHD_TARGET)
	launchctl bootstrap gui/$$(id -u) $(LAUNCHD_TARGET)

uninstall:
	-launchctl bootout gui/$$(id -u) $(LAUNCHD_TARGET)
	rm -f $(LAUNCHD_TARGET)

clean:
	rm -f $(TARGET)
