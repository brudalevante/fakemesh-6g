include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-dawn2
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

PKG_LICENSE:=GPLv3
PKG_MAINTAINER:=brudalevante

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  CATEGORY:=Network
  SUBMENU:=Mesh
  TITLE:=LuCI Support for dawn2
  PKGARCH:=all
  DEPENDS:=+jsonfilter +umdns +firewall4
endef

define Package/$(PKG_NAME)/description
LuCI Support for dawn2.
endef

define Build/Prepare
	$(foreach po,$(wildcard $(CURDIR)/po/es/dawn.po), \
		po2lmo $(po) $(PKG_BUILD_DIR)/dawn.es.lmo;)
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/i18n
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/dawn.es.lmo $(1)/usr/lib/lua/luci/i18n/

	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/controller
	$(INSTALL_DATA) $(CURDIR)/usr/lib/lua/luci/controller/dawn.lua $(1)/usr/lib/lua/luci/controller/dawn.lua

	$(INSTALL_DIR) $(1)/usr/share/luci/menu.d
	$(INSTALL_DATA) $(CURDIR)/usr/share/luci/menu.d/luci-app-dawn.json $(1)/usr/share/luci/menu.d/luci-app-dawn.json

	$(INSTALL_DIR) $(1)/usr/share/rpcd/acl.d
	$(INSTALL_DATA) $(CURDIR)/usr/share/rpcd/acl.d/luci-app-dawn.json $(1)/usr/share/rpcd/acl.d/luci-app-dawn.json

	$(INSTALL_DIR) $(1)/usr/share/luci/ucitrack
	$(INSTALL_DATA) $(CURDIR)/usr/ucitrack/luci-app-dawn.json $(1)/usr/share/luci/ucitrack/luci-app-dawn.json

	$(INSTALL_DIR) $(1)/www/luci-static/resources/dawn
	$(INSTALL_DATA) $(CURDIR)/www/luci-static/resources/dawn/dawn-common.js $(1)/www/luci-static/resources/dawn/dawn-common.js

	$(INSTALL_DIR) $(1)/www/luci-static/resources/view/dawn
	$(INSTALL_DATA) $(CURDIR)/www/luci-static/resources/view/dawn/dawn.js $(1)/www/luci-static/resources/view/dawn/dawn.js

	$(INSTALL_DIR) $(1)/www/luci-static/resources/i18n
	$(INSTALL_DATA) $(CURDIR)/www/luci-static/resources/i18n/dawn.es.js $(1)/www/luci-static/resources/i18n/dawn.es.js

	# Instala el archivo de configuración por defecto
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) $(CURDIR)/etc/config/dawn $(1)/etc/config/dawn
endef

define Package/$(PKG_NAME)/conffiles
/etc/config/dawn
endef

$(eval $(call BuildPackage,$(PKG_NAME)))