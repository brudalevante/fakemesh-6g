include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/luci.mk

PKG_NAME:=luci-app-dawn2
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

PKG_LICENSE:=GPLv3
PKG_MAINTAINER:=brudalevante

define Package/$(PKG_NAME)
  CATEGORY:=Network
  SUBMENU:=Mesh
  TITLE:=LuCI Support for dawn2
  PKGARCH:=all
  DEPENDS:=+luci-base +jsonfilter +umdns +firewall4
endef

define Package/$(PKG_NAME)/description
LuCI Support for dawn2.
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/i18n
	-$(INSTALL_DATA) ./po/*.lmo $(1)/usr/lib/lua/luci/i18n/ 2>/dev/null || true

	$(INSTALL_DIR) $(1)/usr/share/luci/menu.d
	$(INSTALL_DATA) ./usr/share/luci/menu.d/luci-app-dawn2.json $(1)/usr/share/luci/menu.d/luci-app-dawn2.json

	$(INSTALL_DIR) $(1)/usr/share/rpcd/acl.d
	$(INSTALL_DATA) ./usr/share/rpcd/acl.d/luci-app-dawn2.json $(1)/usr/share/rpcd/acl.d/luci-app-dawn2.json

	$(INSTALL_DIR) $(1)/www/luci-static/resources/dawn
	-$(INSTALL_DATA) ./www/luci-static/resources/dawn/dawn2-common.js $(1)/www/luci-static/resources/dawn/dawn2-common.js

	$(INSTALL_DIR) $(1)/www/luci-static/resources/view/dawn2
	$(INSTALL_DATA) ./www/luci-static/resources/view/dawn2/dawn2.js $(1)/www/luci-static/resources/view/dawn2/dawn2.js

	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/controller
	$(INSTALL_DATA) ./usr/lib/lua/luci/controller/dawn2.lua $(1)/usr/lib/lua/luci/controller/dawn2.lua
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
