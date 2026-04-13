# 01 - OS Hardening

![Ubuntu](https://img.shields.io/badge/Ubuntu-24.04-E95420?style=for-the-badge&logo=ubuntu&logoColor=white)
![Bash](https://img.shields.io/badge/Bash-4.4+-4EAA25?style=for-the-badge&logo=gnu-bash&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-blue?style=for-the-badge)

**Linux Server Hardening Baseline (LSHB)**

Módulo principal del **Critical Infrastructure Resilience Framework** enfocado en el endurecimiento seguro de servidores Linux Ubuntu 24.04.

## 🎯 Objetivo

Reducir la superficie de ataque, mejorar la resiliencia del sistema y aplicar mejores prácticas recomendadas por **CIS Benchmarks** y **NIST SP 800-123**.

## 📊 Resultados Actuales (Abril 2026)

- **Hardening Index (Lynis)**: **65/100**
- Firewall: UFW configurado correctamente (puerto 21041)
- Protección anti-brute force: Fail2Ban activo
- Acceso remoto: Autenticación por llave SSH
- Root login: Deshabilitado
- Auditoría básica: `auditd` habilitado

## 🚀 Script Principal

[`harden_ubuntu_safe.sh`](./harden_ubuntu_safe.sh) — Versión segura recomendada

**Cómo usarlo:**

```bash
cd 01-OS-Hardening
chmod +x harden_ubuntu_safe.sh
sudo ./harden_ubuntu_safe.sh
Nota: Siempre prueba primero en una máquina virtual.
📋 Checklist de Hardening

 Actualización completa del sistema
 Configuración de Firewall UFW
 Fail2Ban instalado y configurado
 Root login deshabilitado
 Autenticación por llave SSH implementada
 Auditoría básica (auditd) activada
 Implementar AIDE (integridad de archivos)
 Configurar alertas por correo
 Fortalecer GRUB con contraseña
 Alcanzar Hardening Index ≥ 80

📁 Estructura de la carpeta

harden_ubuntu_safe.sh → Script automatizado
EVIDENCIA_HARDENING.md → Evidencia completa y pantallazos
01-Bare-Metal-Installation/ → Instalación inicial
02-Network-Provisioning/ → Configuración de red
assets/ → Recursos visuales

Próximos objetivos

Mejorar Fail2Ban con más jails
Implementar AIDE (verificación de integridad)
Configurar alertas por correo
Crear versión para Red Hat / CentOS

📄 Documentación adicional

Ver evidencia completa


Autor: Jhonn Freddy Arias
Parte del proyecto: Critical Infrastructure Resilience Framework

