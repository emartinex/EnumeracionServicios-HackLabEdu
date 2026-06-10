# Reporte de Auditoría y Desafío CTF: Fase de Enumeración de Servicios
**Materia:** Hacking Ético  
**Estudiante:** [Nombre Completo del Estudiante]  
**Fecha:** [Fecha de Entrega]  

---

## 1. Tabla de Banderas Capturadas (CTF Flags)

| ID | Servicio | Bandera Descubierta (Valor Exacto) | Descripción breve de dónde se localizó |
| :---: | :--- | :--- | :--- |
| **1** | DNS | `FLAG{...}` | [Escriba aquí] |
| **2** | NetBIOS | `FLAG{...}` | [Escriba aquí] |
| **3** | SMB (Público) | `FLAG{...}` | [Escriba aquí] |
| **4** | SMB (Oculto) | `FLAG{...}` | [Escriba aquí] |
| **5** | SNMP | `FLAG{...}` | [Escriba aquí] |

---

## 2. Resumen Ejecutivo
*Proporcione una breve descripción del alcance del laboratorio, el objetivo de la auditoría y un resumen de alto nivel de los hallazgos críticos detectados.*

---

## 3. Fase de Descubrimiento de Hosts y Puertos
*Describa el comando utilizado para descubrir los hosts activos en el segmento y el escaneo de puertos realizado.*

*   **Comando ejecutado:**
    ```bash
    [Escriba aquí el comando, ej. nmap -sn ...]
    ```
*   **Captura de pantalla / Consola:**
    ```text
    [Pegue aquí la salida de la consola que demuestre los hosts y puertos descubiertos]
    ```

---

## 4. Enumeración DNS (IP: 172.20.0.30)
*Explique el proceso para identificar el dominio, verificar la transferencia de zona y obtener el mapa de la red.*

*   **Herramienta y comando de Transferencia de Zona:**
    ```bash
    [Escriba aquí el comando de dig/host]
    ```
*   **Salida obtenida (Registros de Zona descubiertos y Bandera #1):**
    ```text
    [Pegue la lista de subdominios, registros A, MX, TXT y la bandera detectada]
    ```
*   **Análisis del hallazgo:**
    *   *¿Qué información sensible o pistas indirectas se encontraron en los registros DNS?*

---

## 5. Enumeración NetBIOS y SMB (IP: 172.20.0.10)
*Detalle los comandos utilizados para obtener información de NetBIOS y las comparticiones/usuarios de Samba.*

*   **Enumeración NetBIOS y Bandera #2 (Herramienta, Comando y Salida):**
    ```text
    [Pegue el comando y salida donde se visualiza el banner de NetBIOS con la bandera]
    ```
*   **Enumeración de Usuarios locales:**
    ```text
    [Lista de usuarios y el comando usado para obtenerla]
    ```
*   **Enumeración de Recursos Compartidos (Comparticiones y Banderas #3 y #4):**
    *   *Acceso a recurso público (Comando y bandera encontrada):*
    *   *Acceso a recurso oculto (Comando y bandera encontrada):*

---

## 6. Enumeración SNMP (IP: 172.20.0.20)
*Detalle el comando y la información obtenida a través de las consultas SNMP.*

*   **Comando ejecutado (Comunidad utilizada: `public`):**
    ```bash
    [Comando snmpwalk o snmp-check]
    ```
*   **Metadatos del Sistema descubiertos y Bandera #5:**
    *   *Hostname (`sysName`):* [Hostname]
    *   *Ubicación física (`sysLocation` con bandera):* [Ubicación y bandera]
    *   *Contacto del Administrador (`sysContact`):* [Email de contacto]
    *   *Descripción del Sistema Operativo (`sysDescr`):* [Detalles]

---

## 7. Análisis de Riesgos y Hallazgos Identificados

| ID | Servicio afectado | Descripción de la Vulnerabilidad / Mala Configuración | Impacto (Bajo/Medio/Alto) |
| :--- | :--- | :--- | :---: |
| 1 | DNS | Transferencia de zona no restringida (AXFR) | [Elegir] |
| 2 | DNS | Divulgación de información de infraestructura en registros TXT | [Elegir] |
| 3 | SMB | Compartición pública accesible de forma anónima (Guest access) | [Elegir] |
| 4 | SMB | Compartición oculta (`backup$`) accesible de forma anónima | [Elegir] |
| 5 | SMB | Exposición de nombres de usuarios del sistema vía SAMR RPC | [Elegir] |
| 6 | SNMP | Comunidad pública de lectura (`public`) activa y expuesta | [Elegir] |

---

## 8. Recomendaciones de Mitigación Defensiva
*Para cada uno de los riesgos identificados en la sección anterior, proponga la configuración correcta o mitigación técnica para asegurar el entorno.*

1.  **Mitigación DNS (AXFR):**
    *   [Escriba su recomendación y cómo implementarla]
2.  **Mitigación SMB (Accesos anónimos e información de usuarios):**
    *   [Escriba su recomendación]
3.  **Mitigación SNMP (Comunidad y visibilidad):**
    *   [Escriba su recomendación]

---

## 9. Conclusiones
*Conclusión general sobre la postura de seguridad interna de la empresa auditada.*
