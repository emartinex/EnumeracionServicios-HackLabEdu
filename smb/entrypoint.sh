#!/bin/bash
set -e

# Crear grupo para Samba
groupadd -r smbgroup || true

# Crear usuarios del sistema y Samba con contraseñas seguras
declare -A users
users=(
  ["jlopez"]="J@vierL0pez2026!"
  ["amartinez"]="AnaM@rtinezFinanzas"
  ["soporte"]="SoporteTI#2026"
  ["administrador"]="AdminSecureP@ss1"
)

for user in "${!users[@]}"; do
  password="${users[$user]}"
  # Crear usuario de sistema sin shell
  if ! id "$user" &>/dev/null; then
    useradd -M -s /sbin/nologin "$user"
    usermod -aG smbgroup "$user"
  fi
  # Añadir a Samba
  (echo "$password"; echo "$password") | smbpasswd -a -s "$user"
done

# Crear directorios de comparticiones
mkdir -p /srv/samba/public
mkdir -p /srv/samba/finance
mkdir -p /srv/samba/backup

# Poblar archivos pedagógicos (pistas y banderas CTF)
cat << 'EOF' > /srv/samba/public/empleados.txt
Listado de Empleados de eMartinex Corp.
======================================
ID   | Nombre             | Usuario       | Departamento
---------------------------------------------------
001  | Javier Lopez       | jlopez        | Ventas
002  | Ana Martinez       | amartinez     | Finanzas
003  | Soporte Técnico    | soporte       | TI
004  | Administrador      | administrador | TI (admin@emartinex.local)

Nota de Seguridad: Favor de no compartir contraseñas y reportar cualquier anomalía a soporte.

FELICIDADES! HAS DESCUBIERTO LA COMPARITICIÓN PÚBLICA.
AQUÍ TIENES TU BANDERA: FLAG{smb_public_share_anonymous_access}
EOF

cat << 'EOF' > /srv/samba/backup/politica_backups.txt
Instrucciones de Respaldo eMartinex Corp.
=========================================
Las copias de seguridad de la base de datos se generan diariamente.
El contacto para reportar fallas en los respaldos es admin@emartinex.local.
Para dudas de conectividad de red, favor de consultar el servidor DNS (172.20.0.30)
o revisar las interfaces activas en el agente SNMP (172.20.0.20).

EXCELENTE! HAS DESCUBIERTO LA COMPARTICIÓN OCULTA MEDIANTE LA PISTA DE DNS.
AQUÍ TIENES TU BANDERA: FLAG{smb_hidden_backup_share_accessed}
EOF

# Ajustar permisos
chmod -R 755 /srv/samba/public
chmod -R 770 /srv/samba/finance
chown -R root:smbgroup /srv/samba/finance
chmod -R 755 /srv/samba/backup

# Iniciar NetBIOS Daemon (nmbd) en segundo plano
echo "Iniciando nmbd (NetBIOS Name Service)..."
nmbd -D

# Iniciar Samba Daemon (smbd) en primer plano para mantener vivo el contenedor
echo "Iniciando smbd (Samba Active Directory/Fileshare Service)..."
exec smbd -F --no-process-group </dev/null
