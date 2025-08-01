include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-dawn2
PKG_VERSION:=1.0
PKG_RELEASE:=1

LUCI_TITLE:=LuCI interface for DAWN2
LUCI_PKGCAPTION:=LuCI interface for DAWN2
LUCI_DEPENDS:=+dawn2

define Package/$(PKG_NAME)
  SECTION:=luci
  CATEGORY:=LuCI
  SUBMENU:=3. Applications
  TITLE:=$(LUCI_TITLE)
  DEPENDS:=$(LUCI_DEPENDS)
endef

define Package/$(PKG_NAME)/install
	# Binario DAWN2
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) ./files/usr/sbin/dawn2 $(1)/usr/sbin/dawn2

	# JS principal
	$(INSTALL_DIR) $(1)/www/luci-static/resources/dawn2
	$(INSTALL_DATA) ./htdocs/luci-static/resources/dawn2/dawn2-common.js $(1)/www/luci-static/resources/dawn2/dawn2-common.js

	# Vistas JS
	$(INSTALL_DIR) $(1)/www/luci-static/resources/view/network
	$(INSTALL_DATA) ./htdocs/luci-static/resources/view/network/dawn2.js $(1)/www/luci-static/resources/view/network/dawn2.js

	$(INSTALL_DIR) $(1)/www/luci-static/resources/view/status/dawn2
	$(INSTALL_DATA) ./htdocs/luci-static/resources/view/status/dawn2/hearing_map.js $(1)/www/luci-static/resources/view/status/dawn2/hearing_map.js
	$(INSTALL_DATA) ./htdocs/luci-static/resources/view/status/dawn2/network_overview.js $(1)/www/luci-static/resources/view/status/dawn2/network_overview.js

	# Menú LuCI
	$(INSTALL_DIR) $(1)/usr/share/luci/menu.d
	$(INSTALL_DATA) ./root/luci/menu.d/luci-app-dawn2.json $(1)/usr/share/luci/menu.d/luci-app-dawn2.json

	# Permisos RPCD
	$(INSTALL_DIR) $(1)/usr/share/rpcd/acl.d
	$(INSTALL_DATA) ./root/luci/rpcd/acl.d/luci-app-dawn2.json $(1)/usr/share/rpcd/acl.d/luci-app-dawn2.json

	# Archivo de configuración por defecto
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./etc/config/dawn2 $(1)/etc/config/dawn2
endef

define Package/$(PKG_NAME)/conffiles
/etc/config/dawn2
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
