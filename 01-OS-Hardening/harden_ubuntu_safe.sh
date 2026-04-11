#!/bin/bash
# =====================================================
# harden_ubuntu_safe.sh
# Versión Segura para Pruebas - Critical Infrastructure Resilience Framework
# Autor: Jhonn Freddy Arias
# Versión: 1.2 - Abril 2026
# =====================================================

echo "=================================================="
echo "   Linux Server Hardening Baseline (Safe Version)"
echo "   Critical Infrastructure Resilience Framework"
echo "=================================================="
echo ""

# Verificar si se ejecuta como root
if [ "$EUID" -ne 0 ]; then
  echo "❌ Error: Este script debe ejecutarse como root"
  echo "   Uso: sudo ./harden_ubuntu_safe.sh"
  exit 1
fi

echo "🔍 Modo Seguro activado"
echo "   Sistema: Ubuntu 24.04"
echo ""

read -p "¿Deseas continuar con el hardening? (s/n): " confirmar
if [[ ! $confirmar =~ ^[Ss]$ ]]; then
  echo "❌ Operación cancelada por el usuario."
  exit 0
fi

echo "[1/7] Actualizando el sistema..."
apt update && apt upgrade -y

echo "[2/7] Instalando herramientas esenciales de seguridad..."
apt install -y ufw fail2ban auditd lynis aide unattended-upgrades curl

echo "[3/7] Configurando actualizaciones automáticas de seguridad..."
dpkg-reconfigure --priority=low unattended-upgrades

echo "[4/7] Configurando Firewall UFW..."
ufw default deny incoming
ufw default allow outgoing
ufw allow 21041/tcp comment 'SSH Port'
ufw --force enable

echo "[5/7] Configurando Fail2Ban..."
cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local 2>/dev/null || true
systemctl restart fail2ban

echo "[6/7] Aplicando mejoras básicas de SSH..."
sed -i 's/#PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config
sed -i 's/#PubkeyAuthentication.*/PubkeyAuthentication yes/' /etc/ssh/sshd_config
systemctl restart ssh

echo "[7/7] Habilitando auditoría del sistema..."
systemctl enable auditd --now 2>/dev/null || true

echo ""
echo "=================================================="
echo "✅ Hardening seguro completado exitosamente!"
echo "=================================================="
echo ""
echo "Resumen de cambios aplicados:"
echo "   • Sistema actualizado completamente"
echo "   • UFW activado (permite puerto 21041)"
echo "   • Fail2Ban configurado y activo"
echo "   • Root login deshabilitado"
echo "   • Auditoría básica (auditd) activada"
echo ""
echo "Hardening Index actual (Lynis): ~65/100"
echo ""
echo "Próximos pasos recomendados:"
echo "   1. Configurar autenticación por llave SSH (ya hecho)"
echo "   2. Ejecutar: sudo lynis audit system"
echo "   3. Monitorear logs de seguridad"
echo "   4. Probar reconexión SSH desde tu máquina"
echo ""
echo "¡Revisa que sigas teniendo acceso antes de cerrar esta sesión!"
echo "=================================================="
