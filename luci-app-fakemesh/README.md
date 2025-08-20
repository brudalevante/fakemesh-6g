## Descripción de fakemesh

fakemesh es una arquitectura de red compuesta por un `controlador (AC)`, uno o varios `AP cableados (Wired AP)` y `satélites (Agent)`. Es una red híbrida que combina los modos de despliegue `Mesh inalámbrico` y `AC+AP`. Los `AP cableados` se conectan al controlador mediante cable Ethernet, mientras que los `satélites (Agent)` se conectan de forma inalámbrica como estaciones (STA), formando juntos una red de cobertura combinada (inalámbrica y cableada).

La implementación de fakemesh es bastante sencilla: solo debes conectar los dispositivos a la red correspondiente y configurar el rol, el Mesh ID y otros parámetros. Dado que fakemesh permite la combinación de topologías Mesh y AC+AP, el despliegue mixto es fácil y proporciona mayor cobertura y fiabilidad.

Actualmente, [XGS-PONT-2-ESPEJO](https://github.com/brudalevante/xgs-pont-2-espejo.git) integra fakemesh por defecto.

## Uso de fakemesh

### Una vez desplegada la red, las direcciones de acceso son:

- Para acceder al controlador: `http://controller.fakemesh/` o `http://ac.fakemesh/`
- Para acceder a un AP: `http://{mac}.ap.fakemesh/` o `http://N.ap.fakemesh/`

Donde `{mac}` es la dirección MAC del AP (por ejemplo, `1122334455AB`), y `N` es el número automático asignado al AP (N=1, N=2, ...).

Ejemplos:
```
http://1.ap.fakemesh/
http://1122334455AB.ap.fakemesh/
```

### Modo de Recuperación

Si un AP queda offline durante unos 3 minutos, entra en modo de recuperación, activando un SSID por defecto para permitir la reconfiguración.

SSID y contraseña predeterminados:
```
SSID: X-WRT_XXXX
PASSWD: 88888888
```

En modo recuperación, la IP de gestión del AP será la dirección de puerta de enlace DHCP. Si tu PC obtiene la IP `192.168.16.x`, la gestión será en `192.168.16.1`.

## Componentes de fakemesh

La red está formada por un `controlador (controller)` y uno o varios AP:

- **Controlador (Controller)**: Actúa como AC y gateway principal, gestiona los AP cableados y satélites, y administra la red inalámbrica.
- **Satélite (Agent)**: AP conectado vía Wi-Fi.
- **AP cableado (Wired AP)**: AP conectado vía cable Ethernet.

## Parámetros de configuración de fakemesh

1. **Mesh ID**  
   ID común para todos los nodos de la red fakemesh.

2. **Clave (Key)**  
   Clave unificada para la red. Se puede dejar en blanco si no se desea cifrado.

3. **Banda (Band)**  
   Banda de operación del Wi-Fi (2G o 5G, debe coincidir en todos los nodos).

4. **Rol (Role)**  
   Define si el nodo es controlador, satélite o AP cableado.

5. **Sincronizar configuración (Sync Config)**  
   Permite que el controlador gestione la configuración Wi-Fi de todos los nodos.

6. **Dirección IP de acceso (Access IP address)**  
   IP específica para acceder a la gestión del controlador.

7. **Deshabilitar fronthaul (Fronthaul Disabled)**  
   Si está activado, este nodo no permitirá que otros AP se conecten a través de su Wi-Fi.

8. **Asistente de roaming (Band Steer Helper)**  
   Se puede elegir [DAWN](https://github.com/fakemesh/dawn) o [usteer](https://github.com/fakemesh/usteer) como asistentes de roaming.

## Gestión inalámbrica

La gestión de SSID, cifrado, y ancho de banda se puede realizar desde la interfaz del controlador.

## Despliegue del controlador en modo “bypass” (no gateway)

Si el controlador no funciona como gateway ni proporciona DHCP, deberás configurar manualmente la IP LAN, puerta de enlace y DNS. Por defecto, el controlador intentará obtener IP por DHCP. Si usas IP estática, asegúrate de que esté en la misma subred que el gateway y que haya comunicación entre ambos, de lo contrario, no podrá sincronizar la configuración con los AP.
