FROM ubuntu:22.04

# Evitar diálogos interactivos durante la instalación
ENV DEBIAN_FRONTEND=noninteractive

# Instalar bind9, utilidades y dnsutils
RUN apt-get update && apt-get install -y \
    bind9 \
    bind9utils \
    dnsutils \
    && rm -rf /var/lib/apt/lists/*

# Copiar los archivos de configuración
COPY named.conf /etc/bind/named.conf
COPY named.conf.local /etc/bind/named.conf.local
COPY db.emartinex.local /etc/bind/db.emartinex.local

# Asignar permisos al usuario bind (por compatibilidad)
RUN chown -R bind:bind /etc/bind

# Exponer el puerto 53 en TCP y UDP
EXPOSE 53/tcp 53/udp

# Lanzar named en primer plano como root para evitar fallos de permisos al escribir archivos PID/cerraduras
CMD ["/usr/sbin/named", "-g", "-u", "root"]
