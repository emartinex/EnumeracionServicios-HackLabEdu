# Guía del Estudiante: Laboratorio Práctico de Enumeración de Servicios (CTF)

## 1. Introducción y Contexto

Bienvenido al laboratorio práctico de la materia de **Hacking Ético**.

Como especialista en seguridad, tu equipo ha sido contratado por la empresa **eMartinex Corp.** para realizar una auditoría de seguridad en modalidad *Caja Negra (Black Box)* sobre su infraestructura interna. Los administradores sospechan que algunos servicios comunes de red están exponiendo más información de la necesaria a usuarios no autenticados dentro de la red local.

Tu objetivo principal es la **Enumeración de Servicios** para mapear la infraestructura, identificar usuarios y configuraciones inseguras.

### Dinámica Capture the Flag (CTF)
Para hacer este laboratorio más interesante, se han escondido **5 banderas** en la infraestructura en formato:
`FLAG{texto_identificador_de_la_bandera}`

Tu misión es enumerar detalladamente cada servicio para recolectar estas 5 banderas. Deberás presentar el comando exacto y la captura de pantalla de cada bandera descubierta en tu reporte final.

---

## 2. Alcance Autorizado e IP Inicial

*   **Punto de Partida (IP Inicial provista):** `172.20.0.30`
*   **Segmento de red autorizado:** Subred local asociada a la IP inicial (`172.20.0.0/24`).
*   **Herramientas permitidas:** `nmap`, `enum4linux`, `nbtscan`, `snmpwalk`, `dig`, `host`, `nslookup`, `smbclient`, `smbmap` y scripts de Nmap NSE.

---

## 3. Reglas del Laboratorio (Restricciones Críticas)

> [!CAUTION]
> **Normas de Ejecución (Puntaje Cero si se violan):**
> *   **NO realizar explotación de vulnerabilidades:** No debes utilizar exploits (como EternalBlue, etc.) ni intentar obtener shells (acceso por consola) a los servidores.
> *   **NO realizar ataques de fuerza bruta:** No utilices herramientas como `hydra`, `medusa` o scripts de fuerza bruta sobre contraseñas. Toda la información debe obtenerse a través de lectura de servicios y consultas legítimas mal configuradas.
> *   **Enfoque 100% Pasivo/Enumeración:** El laboratorio consiste en interactuar de forma ordenada con los protocolos para recolectar información.

---

## 4. Metodología Recomendada

1.  **Reconocimiento y Descubrimiento:** Utiliza técnicas de barrido para localizar qué otras direcciones IP están activas en el segmento de red y qué puertos tienen abiertos.
2.  **Enumeración DNS:** Comienza interactuando con el servidor DNS provisto. Investiga si puedes obtener un mapa completo de la red. Busca registros adicionales e información textual almacenada en él. Hay una bandera escondida aquí.
3.  **Enumeración NetBIOS & SMB:** Analiza el servidor de archivos. Identifica el nombre del servidor, grupo de trabajo, recursos compartidos e información de usuarios. 
    *   *Pista 1:* Busca banderas en la descripción general de banners.
    *   *Pista 2:* Hay carpetas accesibles de forma pública y carpetas que no se listan a primera vista pero pueden ser accedidas de forma directa con la pista de DNS adecuada.
4.  **Enumeración SNMP:** Interroga al agente SNMP activo usando la comunidad estándar. Busca datos de contacto, ubicación física e información del sistema operativo. Hay una bandera dentro de uno de los parámetros del sistema.
5.  **Análisis y Correlación:** Muchas veces, la información descubierta en un servicio te dará las claves para consultar el siguiente. Sigue el hilo de la información.

---

## 5. Entregables y Evidencias Requeridas

Deberás completar la **Plantilla de Reporte de Alumno** (`plantilla_reporte.md`) detallando:
*   La metodología y herramientas aplicadas en cada paso.
*   Capturas de pantalla o extractos de código con los comandos ejecutados y la salida obtenida.
*   La tabla con las **5 banderas** descubiertas y su valor exacto.
*   Los subdominios de la red identificados.
*   Los metadatos del agente SNMP (Ubicación, contacto, etc.).
*   Los riesgos de seguridad identificados asociados a las configuraciones actuales y tus recomendaciones de mitigación defensiva.
