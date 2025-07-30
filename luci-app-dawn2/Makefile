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
	po2lmo $(CURDIR)/po/es/dawn.po $(PKG_BUILD_DIR)/dawn.es.lmo
endef

define Build/Configure
endef

define Package/$(PKG_NAME)/install
	# i18n
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/i18n
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/dawn.es.lmo $(1)/usr/lib/lua/luci/i18n/

	# Controlador
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/controller
	$(INSTALL_DATA) $(CURDIR)/root/usr/lib/lua/luci/controller/dawn.lua $(1)/usr/lib/lua/luci/controller/dawn.lua

<<<<<<< HEAD
	# Vista
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/view/dawn2
	$(INSTALL_DATA) $(CURDIR)/root/usr/lib/lua/luci/view/dawn2/dawn.htm $(1)/usr/lib/lua/luci/view/dawn2/dawn.htm

	# Menú LuCI
=======
	# Copia la vista
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/view/dawn2
	$(INSTALL_DATA) $(CURDIR)/root/usr/lib/lua/luci/view/dawn2/dawn.htm $(1)/usr/lib/lua/luci/view/dawn2/dawn.htm

>>>>>>> 4d47fdb1004d28dbf1c5072206ddbfd539fa92f3
	$(INSTALL_DIR) $(1)/usr/share/luci/menu.d
	$(INSTALL_DATA) $(CURDIR)/root/usr/share/luci/menu.d/luci-app-dawn.json $(1)/usr/share/luci/menu.d/luci-app-dawn.json

	# Permisos RPCD
	$(INSTALL_DIR) $(1)/usr/share/rpcd/acl.d
	$(INSTALL_DATA) $(CURDIR)/root/usr/share/rpcd/acl.d/luci-app-dawn.json $(1)/usr/share/rpcd/acl.d/luci-app-dawn.json

<<<<<<< HEAD
	# JS en la ruta correcta para la vista dawn2
	$(INSTALL_DIR) $(1)/www/luci-static/resources/view/dawn2
	$(INSTALL_DATA) $(CURDIR)/root/www/luci-static/resources/view/dawn2/dawn.js $(1)/www/luci-static/resources/view/dawn2/dawn.js

	# JS común (si lo usas en otras partes)
=======
	# Copia el JS en la ruta correcta
	$(INSTALL_DIR) $(1)/www/luci-static/resources/view/dawn2
	$(INSTALL_DATA) $(CURDIR)/root/www/luci-static/resources/view/dawn2/dawn.js $(1)/www/luci-static/resources/view/dawn2/dawn.js

>>>>>>> 4d47fdb1004d28dbf1c5072206ddbfd539fa92f3
	$(INSTALL_DIR) $(1)/www/luci-static/resources/dawn
	$(INSTALL_DATA) $(CURDIR)/root/www/luci-static/resources/dawn/dawn-common.js $(1)/www/luci-static/resources/dawn/dawn-common.js

	# JS de internacionalización
	$(INSTALL_DIR) $(1)/www/luci-static/resources/i18n
	$(INSTALL_DATA) $(CURDIR)/root/www/luci-static/resources/i18n/dawn.es.js $(1)/www/luci-static/resources/i18n/dawn.es.js

<<<<<<< HEAD
	# Configuración
=======
>>>>>>> 4d47fdb1004d28dbf1c5072206ddbfd539fa92f3
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) $(CURDIR)/root/etc/config/dawn $(1)/etc/config/dawn
endef

$(eval $(call BuildPackage,$(PKG_NAME)))