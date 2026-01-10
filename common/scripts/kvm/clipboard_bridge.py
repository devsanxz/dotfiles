#!/usr/bin/env python3
"""
LILITH NEURAL LINK: CLIPBOARD BRIDGE (SSHKVM)
Sincroniza a área de transferência entre Mestre (Note) e Escravo (Pi).
Requer: wl-clipboard (Wayland) e acesso SSH sem senha configurado.
"""

import subprocess
import time
import os
import sys
import hashlib

# --- CONFIGURAÇÃO ---
REMOTE_HOST = "pi" # Assumindo que 'pi' está no seu ~/.ssh/config
REMOTE_USER = "san" # Ou 'alarm', verifique seu user na Pi
POLL_INTERVAL = 1.0 # Checa a cada 1 segundo

def get_local_clipboard():
    try:
        # Pega o texto do clipboard local
        result = subprocess.run(['wl-paste'], capture_output=True, text=True, check=True)
        return result.stdout
    except (subprocess.CalledProcessError, FileNotFoundError):
        return None

def send_to_remote(text):
    if not text: return
    
    # Escapa caracteres perigosos para o shell remoto
    # Uma abordagem mais segura é usar pipe direto pro ssh
    try:
        cmd = ['ssh', f'{REMOTE_USER}@{REMOTE_HOST}', 'wl-copy']
        process = subprocess.Popen(cmd, stdin=subprocess.PIPE, text=True)
        process.communicate(input=text)
        if process.returncode == 0:
            print(f"[Link] Enviado: {text[:20]}...")
        else:
            print(f"[Erro] Falha ao enviar para Pi via SSH.")
    except Exception as e:
        print(f"[Erro] SSH Falhou: {e}")

def main():
    print("--- LILITH CLIPBOARD BRIDGE (ONE-WAY: Note -> Pi) ---")
    print("Aguardando wl-clipboard...")
    
    last_hash = ""
    
    while True:
        current_text = get_local_clipboard()
        
        if current_text:
            # Calcula hash para saber se mudou
            current_hash = hashlib.md5(current_text.encode('utf-8')).hexdigest()
            
            if current_hash != last_hash:
                # Mudança detectada!
                print(f"[Detectado] Novo conteúdo.")
                send_to_remote(current_text)
                last_hash = current_hash
        
        time.sleep(POLL_INTERVAL)

if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        print("\n[Link] Desconectado.")
