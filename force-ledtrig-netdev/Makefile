include $(TOPDIR)/rules.mk

PKG_NAME:=force-ledtrig-netdev
PKG_VERSION:=1.0
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/force-ledtrig-netdev
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Force kmod-ledtrig-netdev in .config
  DEPENDS:=+kmod-ledtrig-netdev
endef

define Package/force-ledtrig-netdev/description
  Dummy package to always force kmod-ledtrig-netdev to be built.
endef

define Build/Compile
endef

define Package/force-ledtrig-netdev/install
	# Nothing to install
endef

$(eval $(call BuildPackage,force-ledtrig-netdev))