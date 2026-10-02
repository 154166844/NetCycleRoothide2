export THEOS_PACKAGE_SCHEME = roothide
ARCHS = arm64 arm64e

TARGET := iphone:clang:latest:15.0

include $(THEOS)/makefiles/common.mk

TOOL_NAME = netcycled
netcycled_FILES = daemon/main.m daemon/NCConfig.m daemon/NCScheduler.m daemon/DeviceControl.m
netcycled_FRAMEWORKS = Foundation
netcycled_CFLAGS = -fobjc-arc -Wall
netcycled_CODESIGN_FLAGS = --entitlements entitlements/netcycled.plist
netcycled_INSTALL_PATH = /usr/local/bin

include $(THEOS_MAKE_PATH)/tool.mk

SUBPROJECTS += settings

include $(THEOS_MAKE_PATH)/aggregate.mk
