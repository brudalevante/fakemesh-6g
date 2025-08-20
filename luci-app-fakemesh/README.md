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
SSID: mesh-brudalevante
PASSWD: 12345678
```

En modo recuperación, la IP de gestión del AP será la dirección de puerta de enlace DHCP. Si tu PC obtiene la IP `192.168.1.x`, la gestión será en `192.168.1.1`.

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

Si el controlador no funciona como gateway ni proporciona DHCP, deberás configurar manualmente la IP LAN, puerta de enlace y DNS. Por defecto, el controlador intentará obtener



## fakemesh Introduction

fakemesh is a network architecture composed of a `controller (AC)`, one or more `wired APs (Wired AP)`, and `satellites (Agents)`. It is a hybrid network that combines both `wireless Mesh` and `AC+AP` deployment modes. The `wired APs` connect to the controller via Ethernet cable, while the `satellites (Agents)` connect wirelessly as STA, together creating a combined (wired and wireless) coverage network.

Deploying fakemesh is quite simple: you just need to connect the devices to the correct network and set the node's role, Mesh ID, and other information. Since fakemesh merges wireless Mesh and AC+AP topologies, it is easy to create a hybrid network, improving coverage and reliability.

Currently, [XGS-PONT-2-ESPEJO](https://github.com/brudalevante/xgs-pont-2-espejo.git) integrates fakemesh by default.

## Using fakemesh

### After the network is deployed, the unified device access addresses are as follows:

- To access the controller: `http://controller.fakemesh/` or `http://ac.fakemesh/`
- To access an AP: `http://{mac}.ap.fakemesh/` or `http://N.ap.fakemesh/`

Where `{mac}` is the MAC address of the AP (for example, `{mac}=1122334455AB`), and `N` is the AP's automatic number (N=1, N=2, N=3, ...).

Examples:
```
http://1.ap.fakemesh/
http://1122334455AB.ap.fakemesh/
```

### Recovery Mode

If an AP is offline for about 3 minutes, it enters recovery mode, which enables a default SSID to provide management access for reconfiguration.

The default SSID and password in recovery mode are:
```
SSID: X-WRT_XXXX
PASSWD: 12345678
```

In recovery mode, the AP's management IP address is the DHCP gateway. For example, if your computer receives `192.168.16.x` as its IP, then the AP's management IP is `192.168.16.1`.

## fakemesh Components

The network consists of one `controller (controller)` and one or more `APs`.

APs include: `satellites (Agent)` and `wired APs (Wired AP)`.

- **Controller:** Acts as AC and gateway, manages the wired and satellite APs, and centrally manages the wireless network.
- **Satellite (Agent):** AP connected via Wi-Fi.
- **Wired AP:** AP connected via Ethernet.

## fakemesh Configuration Parameters

1. **Mesh ID**  
   This parameter is the unified fakemesh network ID; the controller, satellites, and wired APs must all use the same Mesh ID.

2. **Key**  
   The shared network key. Required for encryption; can be left blank if encryption is not needed.

3. **Band**  
   The wireless band used for the network; must be the same on all nodes (5G or 2G).

4. **Role**  
   Can be controller, satellite, or wired AP.

5. **Sync Config**  
   Whether to centrally manage Wi-Fi configurations, managed by the controller.

6. **Access IP address**  
   Set a specific IP address for the controller, used to access its management interface.

7. **Fronthaul Disabled**  
   Disables fronthaul wireless on this node, i.e., does not allow other AP nodes to connect via this node's Wi-Fi.

8. **Band Steer Helper**  
   Currently, you can choose [DAWN](https://github.com/fakemesh/dawn) or [usteer](https://github.com/fakemesh/usteer) as roaming helpers.

## Wireless Management

You can centrally manage the wireless network from the controller's interface, including adding/removing SSIDs, setting encryption, and bandwidth.

## Controller Bypass Deployment

Note: If the controller does not act as a gateway and does not provide DHCP service, you must manually configure network settings, including the controller's LAN IP address, gateway IP, and DNS. By default, the controller's LAN port will use DHCP client to obtain IP and gateway from a third-party gateway. If you need a static IP, ensure the controller and the third-party gateway are in the same subnet and can communicate. Otherwise, the controller will not be able to synchronize configuration with other APs.IP por DHCP. Si usas IP estática, asegúrate de que esté en la misma subred que el gateway y que haya comunicación entre ambos, de lo contrario, no podrá sincronizar la configuración con los AP.
