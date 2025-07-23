# Copyright (C) 2024 brudalevante
# This is free software, licensed under the GNU General Public License v3.
# See /LICENSE for more information.

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-dawn2
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

PKG_LICENSE:=GPLv3
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=brudalevante

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

PKG_BUILD_DEPENDS:=luci-base/host

include $(INCLUDE_DIR)/package.mk

define Package/luci-app-dawn2
	CATEGORY:=X
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
	-mkdir -p $(PKG_BUILD_DIR)/po
	-cp -r $(CURDIR)/po/* $(PKG_BUILD_DIR)/po/ 2>/dev/null || true
endef

define Build/Compile
	@for po in $(PKG_BUILD_DIR)/po/*/*.po; do \
		lang=$$(basename $$(dirname $$po)); \
		base=$$(basename $${po%.po}); \
		dest="$(PKG_BUILD_DIR)/$$base.$$lang.lmo"; \
		echo "Compilando $$po → $$dest"; \
		$(STAGING_DIR_HOSTPKG)/bin/po2lmo "$$po" "$$dest"; \
	done
endef

define Package/luci-app-dawn2/install
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/i18n
	-$(INSTALL_DATA) $(PKG_BUILD_DIR)/*.lmo $(1)/usr/lib/lua/luci/i18n/ 2>/dev/null || true

	$(INSTALL_DIR) $(1)/usr/share/luci/menu.d
	$(INSTALL_DATA) ./usr/share/luci/menu.d/luci-app-dawn2.json $(1)/usr/share/luci/menu.d/luci-app-dawn2.json

	$(INSTALL_DIR) $(1)/usr/share/rpcd/acl.d
	-$(INSTALL_DATA) ./usr/share/rpcd/acl.d/luci-app-dawn2.json $(1)/usr/share/rpcd/acl.d/luci-app-dawn2.json

	$(INSTALL_DIR) $(1)/www/luci-static/resources/dawn
	-$(INSTALL_DATA) ./www/luci-static/resources/dawn/dawn2-common.js $(1)/www/luci-static/resources/dawn/dawn2-common.js

	$(INSTALL_DIR) $(1)/www/luci-static/resources/view/dawn2
	$(INSTALL_DATA) ./www/luci-static/resources/view/dawn2/dawn2.js $(1)/www/luci-static/resources/view/dawn2/dawn2.js
endef

$(eval $(call BuildPackage,luci-app-dawn2))
