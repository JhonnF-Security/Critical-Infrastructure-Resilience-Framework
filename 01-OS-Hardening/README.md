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

**Cómo usarlo:**

    cd 01-OS-Hardening
    chmod +x harden_ubuntu_safe.sh
    sudo ./harden_ubuntu_safe.sh
    
Nota: Ejecuta siempre primero en entorno de prueba (máquina virtual).

## 📁 Estructura de la carpeta

* harden_ubuntu_safe.sh → Script automatizado de hardening
* EVIDENCIA_HARDENING.md → Evidencia completa y pantallazos
* 01-Bare-Metal-Installation/ → Guías de instalación inicial
* 02-Network-Provisioning/ → Configuración de red
* assets/ → Recursos visuales

## 🛡️ Fases implementadas

* Actualización y parcheo del sistema
* Configuración de Firewall (UFW)
* Protección contra fuerza bruta (Fail2Ban)
* Blindaje básico de SSH
* Auditoría del sistema

## Próximos objetivos

* Alcanzar Hardening Index ≥ 80
* Implementar AIDE (integridad de archivos)
* Configurar alertas por correo
* Crear versión para Red Hat / CentOS

## 📋 Checklist de Hardening

- [x] Actualización completa del sistema
- [x] Configuración de Firewall UFW
- [x] Fail2Ban instalado y configurado
- [x] Root login deshabilitado
- [x] Autenticación por llave SSH implementada
- [x] Auditoría básica (`auditd`) activada
- [ ] Implementar AIDE (integridad de archivos)
- [ ] Configurar alertas por correo
- [ ] Fortalecer GRUB con contraseña
- [ ] Alcanzar Hardening Index ≥ 80

## 📄 Archivos incluidos

* harden_ubuntu_safe.sh → Script seguro
* EVIDENCIA_HARDENING.md → Evidencia y pantallazos


Autor: Jhonn Freddy Arias
Parte del proyecto: Critical Infrastructure Resilience Framework
