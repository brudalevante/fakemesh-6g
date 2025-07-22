## luci-app-dawn2 - Cómo compilar e instalar

### 1. Clona el repositorio (solo si aún no lo tienes)
```sh
git clone https://github.com/brudalevante/fakemesh-6g.git
cd fakemesh-6g
```

### 2. Copia el paquete luci-app-dawn2 a tu árbol de OpenWrt

Copia la carpeta `luci-app-dawn2` dentro del directorio `package/` de tu buildroot de OpenWrt:

```sh
cp -r luci-app-dawn2 /ruta/a/tu/openwrt/package/
```
> Cambia `/ruta/a/tu/openwrt` por la ruta real donde tienes tu buildroot de OpenWrt.

### 3. Actualiza los feeds y prepara el entorno

Desde el directorio raíz de OpenWrt:

```sh
./scripts/feeds update -a
./scripts/feeds install -a
make menuconfig
```
- Busca el paquete “luci-app-dawn2” en la sección LuCI > Applications y márcalo como `<M>` (module).

### 4. Compila solo el paquete

```sh
make package/luci-app-dawn2/clean
make package/luci-app-dawn2/compile V=s
```

### 5. Instala el .ipk en tu router

El archivo `.ipk` generado estará en `bin/packages/*/luci/luci-app-dawn2_*.ipk`  
Copia el archivo a tu router y ejecuta:

```sh
opkg install --force-reinstall /ruta/al/luci-app-dawn2_*.ipk
```

---

**¡Listo! Ahora puedes acceder a luci-app-dawn2 desde la interfaz LuCI del router.**

---

¿Problemas o dudas? Abre un issue en este repositorio.
