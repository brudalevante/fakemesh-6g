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

	# Instala el archivo de configuración por defecto
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) $(CURDIR)/etc/config/dawn2 $(1)/etc/config/dawn2
endef

define Package/$(PKG_NAME)/conffiles
/etc/config/dawn2
endef
