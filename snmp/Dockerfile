FROM alpine:latest

# Instalar net-snmp y herramientas básicas
RUN apk add --no-cache net-snmp net-snmp-tools

# Crear directorios para estado persistente y PID
RUN mkdir -p /var/lib/net-snmp /var/run/net-snmp /etc/snmp && \
    chmod -R 777 /var/lib/net-snmp /var/run/net-snmp

# Copiar el archivo de configuración de SNMPd
COPY snmpd.conf /etc/snmp/snmpd.conf
RUN chmod 644 /etc/snmp/snmpd.conf

# Exponer el puerto SNMP (UDP 161)
EXPOSE 161/udp

# Ejecutar snmpd en primer plano como root, desactivando caída de privilegios y enviando logs a stderr (-Le)
CMD ["/usr/sbin/snmpd", "-f", "-Le", "-u", "root", "-c", "/etc/snmp/snmpd.conf"]
