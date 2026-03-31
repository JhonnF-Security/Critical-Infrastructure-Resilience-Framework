# Phase 1: OS Hardening & Infrastructure Baseline

Este módulo documenta el despliegue inicial y el blindaje del nodo central del **Critical Infrastructure Resilience Framework (CIRF)**.

## 🚀 Hitos de Implementación

Para este nodo (`cirf-srv-01`), hemos superado la fase de despliegue físico y aprovisionamiento de red bajo un entorno de alta disponibilidad.


### 2. [Network Provisioning](./02-Network-Provisioning/)
Resolución de problemas de conectividad post-instalación (Offline deployment).
* **Troubleshooting:** Reconstrucción manual del árbol de directorios de Netplan.
* **Configuration:** Autoría de archivos YAML para handshake DHCP.
* **Validation:** Pruebas de conectividad ICMP exitosas.

---

## 🛠️ Próximos Pasos (Fase de Blindaje)
- [ ] Cambio de puerto SSH por defecto (Security through obscurity).
- [ ] Configuración de SSH Keys (RSA/Ed25519) y desactivación de contraseñas.
- [ ] Implementación de Firewall (UFW) con políticas restrictivas.
- [ ] Auditoría de logs inicial.
