#!/bin/bash
# ================================================
# harden_ubuntu.sh - Linux Server Hardening Baseline
# Parte del Critical Infrastructure Resilience Framework
# Autor: Jhonn Freddy Arias
# Versión: 1.0 - Abril 2026
# ================================================

echo "=================================================="
echo "   Linux Server Hardening Baseline (Ubuntu/Debian)"
echo "   Critical Infrastructure Resilience Framework"
echo "=================================================="
echo ""

# Verificar si se ejecuta como root
if [ "$EUID" -ne 0 ]; then
  echo "❌ Error: Este script debe ejecutarse como root (sudo)"
  exit 1
fi

echo "[+] Actualizando el sistema..."
apt update && apt upgrade -y

echo "[+] Instalando herramientas de seguridad básicas..."
apt install -y ufw fail2ban auditd lynis aide unattended-upgrades

echo "[+] Configurando actualizaciones automáticas de seguridad..."
dpkg-reconfigure --priority=low unattended-upgrades

echo "[+] Configurando Firewall UFW..."
ufw default deny incoming
ufw default allow outgoing
ufw allow ssh
ufw --force enable

echo "[+] Configurando Fail2Ban..."
cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
systemctl restart fail2ban

echo "[+] Mejores prácticas de SSH..."
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config
sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/' /etc/ssh/sshd_config
systemctl restart ssh

echo "[+] Configurando políticas de contraseñas fuertes..."
apt install -y libpam-pwquality
sed -i 's/# minlen = 8/minlen = 12/' /etc/security/pwquality.conf
sed -i 's/# dcredit = 0/dcredit = -1/' /etc/security/pwquality.conf
sed -i 's/# ucredit = 0/ucredit = -1/' /etc/security/pwquality.conf

echo "[+] Habilitando auditoría básica..."
systemctl enable auditd
systemctl start auditd

echo ""
echo "=================================================="
echo "✅ Hardening básico completado exitosamente!"
echo ""
echo "Recomendaciones:"
echo "- Cambia el puerto SSH manualmente en /etc/ssh/sshd_config"
echo "- Configura autenticación por llave pública"
echo "- Ejecuta 'lynis audit system' para verificar el estado"
echo "- Revisa el archivo EVIDENCIA_HARDENING.md para más detalles"
echo "=================================================="
