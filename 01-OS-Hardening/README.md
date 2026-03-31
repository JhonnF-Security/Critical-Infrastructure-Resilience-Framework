# 🐧 Linux Server Hardening Baseline (LSHB)

Este estándar define los controles de seguridad mínimos obligatorios para reducir la superficie de ataque en servidores basados en distribuciones Debian/Ubuntu, siguiendo los lineamientos de **CIS Benchmarks** y **NIST SP 800-123**.

## 🛡️ Fase 1: Actualización y Parcheo
* [ ] **Actualización Inicial:** Ejecutar `sudo apt update && sudo apt full-upgrade -y`.
* [ ] **Limpieza de Residuos:** Eliminar paquetes innecesarios con `sudo apt autoremove --purge`.
* [ ] **Parcheo Automático:** Configurar `unattended-upgrades` para actualizaciones críticas de seguridad.

      Hito: Optimización de Energía (Headless Mode)- Siguiendo el estándar de actualización inicial y preparación de entorno.
      * Acción: Se configuró logind.conf para ignorar el Lid Switch.
      * Razón: Permitir operación 24/7 con la tapa cerrada en el server.

## 🔑 Fase 2: Blindaje de Acceso Remoto (SSH)
* [ ] **Protocolo Seguro:** Forzar el uso exclusivo de `SSH Protocol 2`.
* [ ] **Deshabilitar Root Login:** Configurar `PermitRootLogin no` en `/etc/ssh/sshd_config`.
* [ ] **Autenticación por Llaves:** Deshabilitar contraseñas (`PasswordAuthentication no`) y usar llaves RSA de 4096 bits.
* [ ] **Cambio de Puerto:** Mover el servicio del puerto 22 a un puerto no estándar (seguridad por oscuridad básica).
      
      Hito: Ofuscación y Reconfiguración de Sockets (Ubuntu 24.04)-Aplicando el estándar de reducción de superficie de ataque. 
      * Acción: Cambio de puerto 22 a [****] mediante el override de ssh.socket.
      * Razón: Invisible para escaneos de IA y bots automatizados.
      
## 👤 Fase 3: Gestión de Identidades y Privilegios
* [ ] **Principio de Menor Privilegio:** Eliminar usuarios inactivos y restringir el uso de `sudo`.
* [ ] **Políticas de Contraseña:** Implementar `libpam-pwquality` para forzar complejidad y rotación.
* [ ] **Banner de Advertencia:** Configurar `/etc/issue.net` con avisos legales de acceso restringido.

## 🌐 Fase 4: Seguridad de Red y Firewall
* [ ] **Política Drop por Defecto:** Configurar `UFW` para denegar todo el tráfico entrante excepto puertos autorizados.
* [ ] **Prevención de Fuerza Bruta:** Implementar `Fail2Ban` para monitorear y bloquear IPs tras intentos fallidos de conexión.
* [ ] **Deshabilitar IPv6:** Si no es requerido, deshabilitar IPv6 para reducir vectores de ataque.

## 🔍 Fase 5: Auditoría y Monitoreo de Integridad
* [ ] **Escaneo Inicial:** Realizar auditoría con `Lynis` para obtener el Hardening Index actual.
* [ ] **Check de Integridad:** Configurar `AIDE` (Advanced Intrusion Detection Environment) para monitorear cambios en archivos críticos.

---
**Nota:** Este checklist debe aplicarse en entornos de laboratorio antes de su despliegue en producción.
