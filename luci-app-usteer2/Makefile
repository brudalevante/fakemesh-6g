# Copyright (C) 2024 brudalevante
# This is free software, licensed under the GNU General Public License v3.

include $(TOPDIR)/rules.mk

LUCI_TITLE:=LuCI Support for usteer2
LUCI_PKGARCH:=all
LUCI_DEPENDS:=+jsonfilter +umdns +firewall4

PKG_NAME:=luci-app-usteer2
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

include $(TOPDIR)/feeds/luci/luci.mk

define Package/luci-app-usteer2/install
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
