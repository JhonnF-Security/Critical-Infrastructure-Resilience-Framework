# 01 - OS Hardening

**Módulo: Linux Server Hardening Baseline (LSHB)**

Este módulo contiene guías, configuraciones y scripts para aplicar **endurecimiento seguro** en servidores Linux (Ubuntu 24.04), siguiendo estándares **CIS Benchmarks** y **NIST SP 800-123**.

Forma parte del **Critical Infrastructure Resilience Framework**.

## 🎯 Objetivo

Reducir la superficie de ataque, mejorar la resiliencia y lograr un nivel aceptable de seguridad en servidores Linux para infraestructuras críticas y entornos empresariales.

## 📁 Estructura de la carpeta

- `harden_ubuntu_safe.sh` → Script principal de hardening seguro
- `EVIDENCIA_HARDENING.md` → Implementación real, pantallazos y resultados detallados
- `01-Bare-Metal-Installation/` → Guías de instalación inicial
- `02-Network-Provisioning/` → Configuración de red
- `LSHB-Shield-Suite/` → Suite de configuraciones
- `assets/` → Recursos visuales

## 🚀 Cómo usar el script

    cd 01-OS-Hardening

# Dar permisos de ejecución
     
     chmod +x harden_ubuntu_safe.sh

# Ejecutar el script (modo seguro)
     sudo ./harden_ubuntu_safe.sh
     
Importante: Siempre prueba primero en una máquina virtual antes de aplicarlo en producción.

## 📊 Resultados obtenidos (Abril 2026)

* Hardening Index (Lynis): 65/100
* Firewall UFW configurado correctamente (puerto SSH 21041)
* Fail2Ban activo y configurado
* Acceso por llave SSH implementado
* Root login deshabilitado
* Actualizaciones automáticas configuradas
* Auditoría básica (auditd) activada

## 🛡️ Fases cubiertas

* Actualización y parcheo del sistema
*Configuración de Firewall (UFW)
* Protección contra fuerza bruta (Fail2Ban)
* Blindaje básico de SSH
* Auditoría del sistema

## Próximos pasos

* Mejorar Fail2Ban con más jails
* Implementar AIDE (integridad de archivos)
* Configurar alertas por correo
* Crear versión para Red Hat / CentOS
* Alcanzar Hardening Index > 80

## 📄 Documentación adicional

* EVIDENCIA_HARDENING.md → Evidencia completa y pantallazos
* harden_ubuntu_safe.sh → Script ejecutable


Autor: Jhonn Freddy Arias
Parte de: Critical Infrastructure Resilience Framework

