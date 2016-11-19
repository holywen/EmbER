################################################################################
#
## boblight
#
#################################################################################

BOBLIGHT_VERSION = r478
#BOBLIGHT_SITE_METHOD = svn
BOBLIGHT_SITE = http://sources.geexbox.org/devel/
BOBLIGHT_SOURCE = boblight-$(BOBLIGHT_VERSION).tar.bz2
BOBLIGHT_INSTALL_STAGING = YES
BOBLIGHT_INSTALL_TARGET = YES
BOBLIGHT_AUTORECONF = YES
BOBLIGHT_CONF_OPT += --without-portaudio --without-opengl --without-x11

BOBLIGHT_DEPENDENCIES += linux

ifeq ($(findstring yy,$(BR2_PACKAGE_BOBLIGHT_LIBUSB)$(BR2_PACKAGE_LIBUSB)),yy)
  BOBLIGHT_DEPENDENCIES += libusb
else
  BOBLIGHT_CONF_OPT += --without-libusb
endif

$(eval $(call autotools-package,package/thirdparty,boblight))
