# Phase 1: OS Hardening & Infrastructure Baseline

Este módulo documenta el despliegue inicial y el blindaje del nodo central del **Critical Infrastructure Resilience Framework (CIRF)**.

## 🚀 Hitos de Implementación

Para este nodo (`cirf-srv-01`), hemos superado la fase de despliegue físico y aprovisionamiento de red bajo un entorno de alta disponibilidad.

### 1. [Bare-Metal Installation](./01-Bare-Metal-Installation/)
Despliegue del sistema operativo Ubuntu 24.04 LTS en hardware físico.
* **Storage:** Implementación de LVM (Logical Volume Management).
* **Identity:** Estándar de nomenclatura corporativa aplicado.
* **Security Baseline:** Activación de OpenSSH Server.
---

## 🛠️ Próximos Pasos (Fase de Blindaje)
- [ ] Cambio de puerto SSH por defecto (Security through obscurity).
- [ ] Configuración de SSH Keys (RSA/Ed25519) y desactivación de contraseñas.
- [ ] Implementación de Firewall (UFW) con políticas restrictivas.
- [ ] Auditoría de logs inicial.
