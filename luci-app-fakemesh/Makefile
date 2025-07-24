# Copyright (C) 2017-2019 Chen Minqiang <ptpt52@gmail.com>
# This is free software, licensed under the GNU General Public License v3.

include $(TOPDIR)/rules.mk

LUCI_TITLE:=LuCI Support for fakemesh
LUCI_PKGARCH:=all
LUCI_DEPENDS:=+jsonfilter +umdns +firewall4

PKG_NAME:=luci-app-fakemesh
PKG_VERSION:=1.0.2
PKG_RELEASE:=1

include $(TOPDIR)/feeds/luci/luci.mk

define Package/luci-app-fakemesh/conffiles
/etc/config/fakemesh
endef

define Package/luci-app-fakemesh/install
	# Configuración principal, scripts y archivos fuera de las rutas LuCI estándar
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DATA) ./root/etc/config/fakemesh $(1)/etc/config/fakemesh
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./root/etc/init.d/fakemesh $(1)/etc/init.d/fakemesh
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) ./root/usr/sbin/fakemesh $(1)/usr/sbin/fakemesh
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_DATA) ./root/etc/uci-defaults/40_luci-app-fakemesh $(1)/etc/uci-defaults/40_luci-app-fakemesh
	$(INSTALL_DATA) ./root/etc/uci-defaults/96-fakemesh-defaults $(1)/etc/uci-defaults/96-fakemesh-defaults
	$(INSTALL_DIR) $(1)/etc/hotplug.d/dhcp/
	$(INSTALL_DATA) ./root/etc/hotplug.d/dhcp/10-fakemesh $(1)/etc/hotplug.d/dhcp/10-fakemesh
	$(INSTALL_DIR) $(1)/etc/hotplug.d/iface/
	$(INSTALL_DATA) ./root/etc/hotplug.d/iface/19-fakemesh $(1)/etc/hotplug.d/iface/19-fakemesh
	$(INSTALL_DIR) $(1)/usr/share/rpcd/acl.d
	$(INSTALL_DATA) ./root/usr/share/rpcd/acl.d/*.json $(1)/usr/share/rpcd/acl.d/
	$(INSTALL_DIR) $(1)/usr/share/luci/menu.d
	$(INSTALL_DATA) ./root/usr/share/luci/menu.d/*.json $(1)/usr/share/luci/menu.d/
	$(INSTALL_DIR) $(1)/www/luci-static/resources/view/fakemesh
	$(INSTALL_DATA) ./htdocs/luci-static/resources/view/fakemesh/fakemesh.js $(1)/www/luci-static/resources/view/fakemesh/fakemesh.js
	$(INSTALL_DIR) $(1)/usr/share/ucitrack
	$(INSTALL_DATA) ./root/usr/share/ucitrack/*.json $(1)/usr/share/ucitrack/
endef
