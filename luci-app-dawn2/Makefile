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
	$(foreach po,$(wildcard $(CURDIR)/po/es/*.po), \
		po2lmo $(po) $(PKG_BUILD_DIR)/$(patsubst %.po,%.lmo,$(notdir $(po)));)
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/i18n
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/dawn2.lmo $(1)/usr/lib/lua/luci/i18n/

	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/controller
	$(INSTALL_DATA) $(CURDIR)/usr/lib/lua/luci/controller/dawn2.lua $(1)/usr/lib/lua/luci/controller/dawn2.lua

	$(INSTALL_DIR) $(1)/usr/share/luci/menu.d
	$(INSTALL_DATA) $(CURDIR)/usr/share/luci/menu.d/luci-app-dawn2.json $(1)/usr/share/luci/menu.d/luci-app-dawn2.json

	$(INSTALL_DIR) $(1)/usr/share/rpcd/acl.d
	$(INSTALL_DATA) $(CURDIR)/usr/share/rpcd/acl.d/luci-app-dawn2.json $(1)/usr/share/rpcd/acl.d/luci-app-dawn2.json

	$(INSTALL_DIR) $(1)/www/luci-static/resources/dawn
	$(INSTALL_DATA) $(CURDIR)/www/luci-static/resources/dawn/dawn2-common.js $(1)/www/luci-static/resources/dawn/dawn2-common.js

	$(INSTALL_DIR) $(1)/www/luci-static/resources/view/dawn2
	$(INSTALL_DATA) $(CURDIR)/www/luci-static/resources/view/dawn2/dawn2.js $(1)/www/luci-static/resources/view/dawn2/dawn2.js

	# Instala el archivo de configuración por defecto
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) $(CURDIR)/etc/config/dawn2 $(1)/etc/config/dawn2
endef

define Package/$(PKG_NAME)/conffiles
/etc/config/dawn2
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
