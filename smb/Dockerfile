FROM debian:bookworm-slim

# Evitar prompts interactivos durante la instalación
ENV DEBIAN_FRONTEND=noninteractive

# Instalar Samba y herramientas necesarias para el laboratorio
RUN apt-get update && apt-get install -y \
    samba \
    samba-common \
    smbclient \
    procps \
    && rm -rf /var/lib/apt/lists/*

# Copiar el archivo de configuración de Samba
COPY smb.conf /etc/samba/smb.conf

# Copiar el script de inicio
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Exponer los puertos de NetBIOS y SMB
EXPOSE 137/udp 138/udp 139/tcp 445/tcp

ENTRYPOINT ["/entrypoint.sh"]
