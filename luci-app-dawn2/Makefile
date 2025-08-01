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

define Build/Configure
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/install
	# Controlador LuCI
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/controller
	$(INSTALL_DATA) $(CURDIR)/usr/lib/lua/luci/controller/dawn2.lua $(1)/usr/lib/lua/luci/controller/dawn2.lua

	# Menú LuCI
	$(INSTALL_DIR) $(1)/usr/share/luci/menu.d
	$(INSTALL_DATA) $(CURDIR)/root/luci/menu.d/luci-app-dawn2.json $(1)/usr/share/luci/menu.d/luci-app-dawn2.json

	# Permisos RPCD
	$(INSTALL_DIR) $(1)/usr/share/rpcd/acl.d
	$(INSTALL_DATA) $(CURDIR)/root/luci/rcpd/acl.d/luci-app-dawn2.json $(1)/usr/share/rpcd/acl.d/luci-app-dawn2.json

	# JS principal
	$(INSTALL_DIR) $(1)/www/luci-static/resources/dawn
	$(INSTALL_DATA) $(CURDIR)/htdocs/luci-static/resources/dawn/dawn2-common.js $(1)/www/luci-static/resources/dawn/dawn2-common.js

	# Vistas JS
	$(INSTALL_DIR) $(1)/www/luci-static/resources/view/dawn2
	$(INSTALL_DATA) $(CURDIR)/htdocs/luci-static/resources/view/dawn2/dawn2.js $(1)/www/luci-static/resources/view/dawn2/dawn2.js

	# Instala el archivo de configuración por defecto
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) $(CURDIR)/etc/config/dawn2 $(1)/etc/config/dawn2

	# Instala el script de inicio
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) $(CURDIR)/files/etc/init.d/dawn2 $(1)/etc/init.d/dawn2
endef

define Package/$(PKG_NAME)/conffiles
/etc/config/dawn2
endef

define Package/$(PKG_NAME)/postinst
#!/bin/sh
/etc/init.d/dawn enable
/etc/init.d/dawn start
exit 0
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
