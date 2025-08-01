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

define Build/Compile
	# Si tienes traducciones LMO, genera aquí
	# po2lmo $(CURDIR)/po/es/dawn.po $(PKG_BUILD_DIR)/dawn.es.lmo
endef

define Build/Configure
endef

define Package/$(PKG_NAME)/install
	# Binario DAWN, lo incluye siempre en el paquete
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(CURDIR)/files/usr/sbin/dawn $(1)/usr/sbin/dawn

	# JS principal
	$(INSTALL_DIR) $(1)/www/luci-static/resources/dawn
	$(INSTALL_DATA) $(CURDIR)/htdocs/luci-static/resources/dawn/dawn-common.js $(1)/www/luci-static/resources/dawn/dawn-common.js

	# Vistas JS
	$(INSTALL_DIR) $(1)/www/luci-static/resources/view/network
	$(INSTALL_DATA) $(CURDIR)/htdocs/luci-static/resources/view/network/dawn.js $(1)/www/luci-static/resources/view/network/dawn.js

	$(INSTALL_DIR) $(1)/www/luci-static/resources/view/status/dawn
	$(INSTALL_DATA) $(CURDIR)/htdocs/luci-static/resources/view/status/dawn/hearing_map.js $(1)/www/luci-static/resources/view/status/dawn/hearing_map.js
	$(INSTALL_DATA) $(CURDIR)/htdocs/luci-static/resources/view/status/dawn/network_overview.js $(1)/www/luci-static/resources/view/status/dawn/network_overview.js

	# Menú LuCI
	$(INSTALL_DIR) $(1)/usr/share/luci/menu.d
	$(INSTALL_DATA) $(CURDIR)/root/luci/menu.d/luci-app-dawn.json $(1)/usr/share/luci/menu.d/luci-app-dawn.json

	# Permisos RPCD
	$(INSTALL_DIR) $(1)/usr/share/rpcd/acl.d
	$(INSTALL_DATA) $(CURDIR)/root/luci/rcpd/acl.d/luci-app-dawn.json $(1)/usr/share/rpcd/acl.d/luci-app-dawn.json

	# Si tienes controladores, vistas Lua, i18n, etc. agrégalos aquí
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
