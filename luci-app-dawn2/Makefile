# Copyright (C) 2024 brudalevante
# This is free software, licensed under the GNU General Public License v3.

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-dawn2
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

PKG_LICENSE:=GPLv3
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=brudalevante

include $(INCLUDE_DIR)/package.mk

define Package/luci-app-dawn2
  CATEGORY:=Mesh
  SUBMENU:=Configuration Fake Mesh Support
  TITLE:=LuCI Support for dawn2
  PKGARCH:=all
  DEPENDS:=+luci-base +jsonfilter +umdns +firewall4
endef

define Package/luci-app-dawn2/description
LuCI Support for dawn2.
endef

define Build/Prepare
	$(call Build/Prepare/Default)
	# Traducciones (.po a .lmo)
	$(foreach po,$(wildcard $(CURDIR)/po/*/*.po), \
		po2lmo $(po) $(CURDIR)/po/$(notdir $(patsubst %.po,%.lmo,$(po)));)
endef

define Package/luci-app-dawn2/install
	# Traducciones
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/i18n
	-$(INSTALL_DATA) $(CURDIR)/po/*.lmo $(1)/usr/lib/lua/luci/i18n/ 2>/dev/null || true

	# Menú JSON
	$(INSTALL_DIR) $(1)/usr/share/luci/menu.d
	$(INSTALL_DATA) ./usr/share/luci/menu.d/luci-app-dawn2.json $(1)/usr/share/luci/menu.d/luci-app-dawn2.json

	# ACL
	$(INSTALL_DIR) $(1)/usr/share/rpcd/acl.d
	$(INSTALL_DATA) ./usr/share/rpcd/acl.d/luci-app-dawn2.json $(1)/usr/share/rpcd/acl.d/luci-app-dawn2.json

	# Recursos JS comunes
	$(INSTALL_DIR) $(1)/www/luci-static/resources/dawn
	-$(INSTALL_DATA) ./www/luci-static/resources/dawn/dawn2-common.js $(1)/www/luci-static/resources/dawn/dawn2-common.js

	# Vista JS moderna
	$(INSTALL_DIR) $(1)/www/luci-static/resources/view/dawn2
	$(INSTALL_DATA) ./www/luci-static/resources/view/dawn2/dawn2.js $(1)/www/luci-static/resources/view/dawn2/dawn2.js

	# Controlador Lua
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/controller
	$(INSTALL_DATA) ./usr/lib/lua/luci/controller/dawn2.lua $(1)/usr/lib/lua/luci/controller/dawn2.lua
endef

$(eval $(call BuildPackage,luci-app-dawn2))
