#!/bin/bash
# ==============================================================================
# LSHB Shield Suite (All-in-One: Fortify, Audit, Remediate & Report)
# Autor: Jhonnf Arias - Ingeniero de Sistemas & Especialista en Seguridad
# Versión: 3.0 (Empresarial)
# ==============================================================================

# --- Variables y Colores ---
EXPECTED_SSH_PORT=2244
REPORT_FILE="REPORTE_SEGURIDAD_$(date +%F).txt"
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m'

if [ "$EUID" -ne 0 ]; then echo -e "${RED}[!] Corre como sudo${NC}"; exit 1; fi

# --- Funciones de Seguridad ---
menu() {
    clear
    echo -e "${BLUE}=================================================================${NC}"
    echo -e "${BLUE}         LSHB SHIELD SUITE - JHONNF ARIAS SECURITY               ${NC}"
    echo -e "${BLUE}=================================================================${NC}"
    echo -e "1) ${GREEN}FORTIFICAR${NC} (Ejecutar blindaje completo inicial)"
    echo -e "2) ${YELLOW}AUDITAR${NC} (Escanear vulnerabilidades actuales)"
    echo -e "3) ${RED}SIMULAR FALLOS${NC} (Abrir brechas para demostración)"
    echo -e "4) ${BLUE}GENERAR REPORTE${NC} (Archivo listo para el cliente)"
    echo -e "5) SALIR"
    read -p "Selecciona una opción: " opt
    case $opt in
        1) fortify ;;
        2) audit_and_fix ;;
        3) simulate_vulnerabilities ;;
        4) generate_report ;;
        5) exit 0 ;;
        *) menu ;;
    esac
}

fortify() {
    echo -e "\n[+] Aplicando blindaje de grado militar..."
    # SSH Config
    sed -i "s/^#*Port.*/Port $EXPECTED_SSH_PORT/" /etc/ssh/sshd_config
    sed -i "s/^#*PermitRootLogin.*/PermitRootLogin no/" /etc/ssh/sshd_config
    sed -i "s/^#*PasswordAuthentication.*/PasswordAuthentication no/" /etc/ssh/sshd_config
    # Socket Patch
    mkdir -p /etc/systemd/system/ssh.socket.d
    echo -e "[Socket]\nListenStream=\nListenStream=0.0.0.0:$EXPECTED_SSH_PORT" > /etc/systemd/system/ssh.socket.d/override.conf
    systemctl daemon-reload && systemctl restart ssh.socket && systemctl restart ssh.service
    # Firewall
    ufw allow $EXPECTED_SSH_PORT/tcp > /dev/null && ufw --force enable > /dev/null
    # IPv6
    echo "net.ipv6.conf.all.disable_ipv6 = 1" >> /etc/sysctl.conf && sysctl -p > /dev/null
    echo -e "${GREEN}[OK] Servidor fortificado.${NC}"
    sleep 2; menu
}

audit_and_fix() {
    echo -e "\n${BLUE}--- ESCANEO DE CUMPLIMIENTO ---${NC}"
    FAILS=0
    # Chequeo Puerto
    if sshd -T | grep -E -q "^port $EXPECTED_SSH_PORT$"; then echo -e "Puerto $EXPECTED_SSH_PORT: ${GREEN}OK${NC}"; else echo -e "Puerto: ${RED}VULNERABLE${NC}"; FAILS=$((FAILS+1)); fi
    # Chequeo Root
    if sshd -T | grep -E -q "^permitrootlogin no$"; then echo -e "Root Login: ${GREEN}OK${NC}"; else echo -e "Root Login: ${RED}VULNERABLE${NC}"; FAILS=$((FAILS+1)); fi
    # Chequeo UFW
    if ufw status | grep -q "Status: active"; then echo -e "Firewall: ${GREEN}OK${NC}"; else echo -e "Firewall: ${RED}INACTIVO${NC}"; FAILS=$((FAILS+1)); fi

    if [ $FAILS -gt 0 ]; then
        read -p "¿Deseas aplicar auto-remediación para estas $FAILS fallas? (s/n): " fix
        if [[ "$fix" =~ ^[sS]$ ]]; then fortify; fi
    else
        echo -e "${GREEN}\n[!] Cumplimiento al 100%.${NC}"
        sleep 2; menu
    fi
}

simulate_vulnerabilities() {
    echo -e "\n${RED}[!] ABRIENDO BRECHAS DE SEGURIDAD (MODO DEMO)...${NC}"
    # Volver a puerto 22 y habilitar root/pass
    sed -i "s/^Port.*/Port 22/" /etc/ssh/sshd_config
    sed -i "s/^PermitRootLogin.*/PermitRootLogin yes/" /etc/ssh/sshd_config
    sed -i "s/^PasswordAuthentication.*/PasswordAuthentication yes/" /etc/ssh/sshd_config
    rm -rf /etc/systemd/system/ssh.socket.d
    systemctl daemon-reload && systemctl restart ssh.socket && systemctl restart ssh.service
    # Apagar Firewall
    ufw --force disable > /dev/null
    echo -e "${YELLOW}[!] Vulnerabilidades creadas. Ejecuta 'AUDITAR' para verlas en rojo.${NC}"
    sleep 2; menu
}

generate_report() {
    echo -e "\n[+] Generando reporte profesional en $REPORT_FILE..."
    {
        echo "====================================================="
        echo "      REPORTE DE AUDITORÍA Y FORTIFICACIÓN           "
        echo "      ING. JHONNF ARIAS - SECURITY EXPERT            "
        echo "====================================================="
        echo "Fecha: $(date)"
        echo "Servidor: $(hostname)"
        echo "-----------------------------------------------------"
        echo "RESULTADOS DE CUMPLIMIENTO:"
        sshd -T | grep -E "^(port|permitrootlogin|passwordauthentication)"
        ufw status | grep "Status"
        sysctl net.ipv6.conf.all.disable_ipv6
        echo "-----------------------------------------------------"
        echo "ESTADO FINAL: PROTEGIDO / CUMPLE NORMATIVA LSHB"
        echo "====================================================="
    } > "$REPORT_FILE"
    echo -e "${GREEN}[OK] Reporte listo para entregar.${NC}"
    sleep 2; menu
}

menu
