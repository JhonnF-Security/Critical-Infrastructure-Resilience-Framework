```markdown
# Checklist de Hardening - Ubuntu 24.04

## Fase 1: Preparación
- [ ] Actualizar sistema completo (`apt update && apt upgrade -y`)
- [ ] Instalar herramientas básicas

## Fase 2: Firewall y Acceso
- [ ] Configurar UFW (default deny)
- [ ] Permitir puerto SSH personalizado
- [ ] Configurar Fail2Ban

## Fase 3: SSH Security
- [ ] Deshabilitar login root
- [ ] Activar autenticación por llave SSH
- [ ] Cambiar puerto SSH (opcional)

## Fase 4: Auditoría
- [ ] Activar auditd
- [ ] Ejecutar Lynis y revisar reporte

## Fase 5: Avanzado
- [ ] Implementar AIDE
- [ ] Configurar actualizaciones automáticas
- [ ] Configurar alertas

**Puntaje actual:** 65/100
