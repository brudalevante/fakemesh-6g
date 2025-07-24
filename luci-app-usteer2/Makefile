# Copyright (C) 2024 brudalevante
# This is free software, licensed under the GNU General Public License v3.

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-usteer2
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

PKG_LICENSE:=GPLv3
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=brudalevante

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  SECTION:=Mesh
  CATEGORY:=Mesh
  SUBMENU:=Configuration Fake Mesh Support
  TITLE:=LuCI Support for usteer2
  PKGARCH:=all
  DEPENDS:=+luci-base +jsonfilter +umdns +firewall4
endef

define Package/$(PKG_NAME)/description
LuCI Support for usteer2.
endef

define Package/$(PKG_NAME)/install
	# Traducciones
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/i18n
	-$(INSTALL_DATA) ./po/*.lmo $(1)/usr/lib/lua/luci/i18n/ 2>/dev/null || true

	# Menú JSON
	$(INSTALL_DIR) $(1)/usr/share/luci/menu.d
	$(INSTALL_DATA) ./usr/share/luci/menu.d/luci-app-usteer2.json $(1)/usr/share/luci/menu.d/luci-app-usteer2.json

	# ACL
	$(INSTALL_DIR) $(1)/usr/share/rpcd/acl.d
	$(INSTALL_DATA) ./usr/share/rpcd/acl.d/luci-app-usteer2.json $(1)/usr/share/rpcd/acl.d/luci-app-usteer2.json

	# Vista JS moderna
	$(INSTALL_DIR) $(1)/www/luci-static/resources/view/usteer2
	$(INSTALL_DATA) ./www/luci-static/resources/view/usteer2/usteer2.js $(1)/www/luci-static/resources/view/usteer2/usteer2.js

	# Controlador Lua
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/controller
	$(INSTALL_DATA) ./usr/lib/lua/luci/controller/usteer2.lua $(1)/usr/lib/lua/luci/controller/usteer2.lua
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
