THEOS_DEVICE_IP = 10.0.0.75

include $(THEOS)/makefiles/common.mk

ARCHS = armv7 arm64 arm64e # Build for all archs including A12 or the wrath of eta kids will consume you

TWEAK_NAME = LockCharge
LockCharge_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "sbreload" # Use sbreload please
