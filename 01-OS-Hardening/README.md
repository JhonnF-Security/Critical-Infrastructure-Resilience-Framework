# 01 - OS Hardening

**Linux Server Hardening Baseline (LSHB)**

Módulo principal del **Critical Infrastructure Resilience Framework** enfocado en el endurecimiento seguro de servidores Linux (Ubuntu 24.04).

## 🎯 Objetivo

Aplicar mejores prácticas de seguridad para reducir la superficie de ataque, mejorar la resiliencia y alcanzar estándares recomendados por **CIS Benchmarks** y **NIST**.

## 📊 Resultados Actuales (Abril 2026)

- **Hardening Index (Lynis)**: **65/100**
- Firewall: UFW configurado (puerto SSH 21041)
- Protección contra fuerza bruta: Fail2Ban activo
- Acceso remoto: Autenticación por llave SSH
- Root login: Deshabilitado
- Auditoría: `auditd` habilitado

## 🚀 Script Principal

[`harden_ubuntu_safe.sh`](./harden_ubuntu_safe.sh) — Versión segura recomendada para pruebas

**Cómo ejecutarlo:**

    cd 01-OS-Hardening
    chmod +x harden_ubuntu_safe.sh
    sudo ./harden_ubuntu_safe.sh

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

