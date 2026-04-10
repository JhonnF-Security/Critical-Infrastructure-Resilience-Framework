# 01 - OS Hardening

**Módulo: Linux Server Hardening Baseline (LSHB)**

Este módulo contiene guías, configuraciones y herramientas para aplicar **endurecimiento seguro** en servidores Linux, siguiendo estándares **CIS Benchmarks** y **NIST SP 800-123**.

Forma parte del **Critical Infrastructure Resilience Framework**.

## 🎯 Objetivo

Reducir la superficie de ataque del sistema operativo, mejorar su resiliencia y cumplir con requisitos básicos de seguridad para infraestructuras críticas y entornos empresariales.

## 📁 Estructura de esta carpeta

- `01-Bare-Metal-Installation` → Instalación inicial segura
- `02-Network-Provisioning` → Configuración de red
- `LSHB-Shield-Suite` → Suite principal de hardening
- `assets` → Recursos visuales y evidencias
- [`EVIDENCIA_HARDENING.md`](./EVIDENCIA_HARDENING.md) → Implementación real y resultados obtenidos

## 🛡️ Contenido principal

Este módulo cubre las siguientes fases de hardening:

- Actualización y parcheo del sistema
- Blindaje de acceso remoto (SSH)
- Gestión de identidades y privilegios
- Configuración de firewall y protección contra ataques
- Auditoría y monitoreo (Lynis, AIDE, etc.)

## 🚀 Cómo utilizar este módulo

    cd 01-OS-Hardening

Revisa las subcarpetas según la fase que necesites aplicar.

## Importante: 
    Siempre prueba las configuraciones primero en una máquina virtual antes de aplicarlas en producción.
    
## 📊 Evidencia de implementación
Puedes ver la implementación real, pantallazos y resultados de auditorías en el archivo:

      EVIDENCIA_HARDENING.md

## Próximos pasos

* Convertir las configuraciones manuales en scripts automatizados (*.sh)
* Añadir script de verificación automática
* Crear versión para Red Hat Enterprise Linux / CentOS
* Mejorar la suite de hardening con más automatización


Autor: Jhonn Freddy Arias
Parte de: Critical Infrastructure Resilience Framework
