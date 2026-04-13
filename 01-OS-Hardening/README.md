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
- Firewall: UFW configurado correctamente
- Protección anti-brute force: Fail2Ban activo
- Acceso remoto: Autenticación por llave SSH
- Root login: Deshabilitado
- Auditoría básica: `auditd` habilitado

## 🚀 Script Principal

[`harden_ubuntu_safe.sh`](./harden_ubuntu_safe.sh) — Versión segura recomendada

**Cómo ejecutarlo:**

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

📁 Estructura

* harden_ubuntu_safe.sh → Script automatizado de hardening
* EVIDENCIA_HARDENING.md → Evidencia completa, pantallazos y logs
* 01-Bare-Metal-Installation/ → Instalación inicial segura
* 02-Network-Provisioning/ → Configuración de red
* assets/ → Recursos visuales

🛡️ Fases implementadas

* Actualización y parcheo del sistema
* Configuración de Firewall (UFW)
* Protección contra ataques automatizados (Fail2Ban)
* Blindaje básico de SSH
* Auditoría del sistema

Próximos objetivos

* Alcanzar Hardening Index ≥ 80
* Implementar AIDE (verificación de integridad)
* Configurar alertas de seguridad
* Crear versión para Red Hat / CentOS

📄 Documentación adicional

* Ver evidencia completa

Autor: Jhonn Freddy Arias
Framework: Critical Infrastructure Resilience Framework

