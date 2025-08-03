include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-fakemesh
PKG_VERSION:=1.0.2
PKG_RELEASE:=1

PKG_LICENSE:=GPLv3
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=brudalevante

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  CATEGORY:=Network
  SUBMENU:=Mesh
  TITLE:=LuCI Support for fakemesh
  PKGARCH:=all
  DEPENDS:=+jsonfilter +umdns +firewall4
endef

define Package/$(PKG_NAME)/description
LuCI Support for fakemesh.
endef

# Convierte todos los .po en .lmo para la traducción
define Build/Prepare
	$(foreach po,$(wildcard $(CURDIR)/root/usr/lib/lua/luci/i18n/*.po), \
		po2lmo $(po) $(PKG_BUILD_DIR)/$(patsubst %.po,%.lmo,$(notdir $(po)));)
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/conffiles
/etc/config/fakemesh
endef

define Package/$(PKG_NAME)/install
	# Traducciones
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/i18n
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/fakemesh.*.lmo $(1)/usr/lib/lua/luci/i18n/

	# Configuración y scripts de inicio
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DATA) $(CURDIR)/root/etc/config/fakemesh $(1)/etc/config/fakemesh

	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) $(CURDIR)/root/etc/init.d/fakemesh $(1)/etc/init.d/fakemesh

	# ACLs, menú y ucitrack
	$(INSTALL_DIR) $(1)/usr/share/rpcd/acl.d
	$(INSTALL_DATA) $(CURDIR)/root/usr/share/rpcd/acl.d/*.json $(1)/usr/share/rpcd/acl.d/

	$(INSTALL_DIR) $(1)/usr/share/luci/menu.d
	$(INSTALL_DATA) $(CURDIR)/root/usr/share/luci/menu.d/*.json $(1)/usr/share/luci/menu.d/

	$(INSTALL_DIR) $(1)/usr/share/ucitrack
	$(INSTALL_DATA) $(CURDIR)/root/usr/share/ucitrack/*.json $(1)/usr/share/ucitrack/

	# JS para LuCI
	$(INSTALL_DIR) $(1)/www/luci-static/resources/view/fakemesh
	$(INSTALL_DATA) $(CURDIR)/root/www/luci-static/resources/view/fakemesh/fakemesh.js $(1)/www/luci-static/resources/view/fakemesh/fakemesh.js
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
