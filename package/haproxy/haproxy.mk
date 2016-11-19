################################################################################
#
# haproxy
#
################################################################################

HAPROXY_VERSION = 1.6.9
HAPROXY_SOURCE = haproxy-$(HAPROXY_VERSION).tar.gz
HAPROXY_SITE = http://haproxy.1wt.eu/download/1.6/src
HAPROXY_DEPENDENCIES = pcre
#HAPROXY_MAKE_OPT = TARGET=linux2628 CPU=$(BR2_ARCH) USE_STATIC_PCRE=1
HAPROXY_MAKE_OPT = TARGET=linux2628 CPU=$(BR2_ARCH) 

define HAPROXY_BUILD_CMDS
	$(TARGET_MAKE_ENV)
		$(MAKE) -C $(@D) $(HAPROXY_MAKE_OPT) $(TARGET_CONFIGURE_OPTS)
endef

define HAPROXY_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV)
	$(INSTALL) -D -m 0755 $(@D)/haproxy $(TARGET_DIR)/usr/sbin/haproxy
endef

$(eval $(generic-package))

