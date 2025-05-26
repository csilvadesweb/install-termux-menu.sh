#!/data/data/com.termux/files/usr/bin/bash

# Atualizando pacotes
pkg update -y && pkg upgrade -y

# Instalando dependências
pkg install -y hydra nmap metasploit sqlmap curl wget whois git python nodejs nano htop ncdu iftop dnsutils net-tools traceroute figlet

# Criando o menu.sh com conteúdo avançado
cat > ~/menu.sh << 'EOF'
#!/data/data/com.termux/files/usr/bin/bash
while true; do
  clear
  figlet TERMUX MENU
  echo "==============================="
  echo "1. Ferramentas de Ataque"
  echo "2. Análise de Rede"
  echo "3. Dev & Utilitários"
  echo "4. Limpeza e Diagnóstico"
  echo "5. Sair"
  echo "==============================="
  read -p "Escolha uma opção: " main_option

  case $main_option in
    1)
      while true; do
        clear
        echo "[ ATAQUE & PENTEST ]"
        echo "============================="
        echo "1. Hydra"
        echo "2. Metasploit Framework"
        echo "3. Sqlmap"
        echo "4. Nikto (se instalado)"
        echo "5. John the Ripper (se instalado)"
        echo "6. Setoolkit (se instalado)"
        echo "7. Voltar"
        echo "============================="
        read -p "Escolha uma opção: " attack_option
        case $attack_option in
          1) hydra ;;
          2) msfconsole ;;
          3) sqlmap ;;
          4) echo "Digite: nikto -h http://site.com" && read ;;
          5) echo "Digite: john --wordlist=lista.txt hash.txt" && read ;;
          6) echo "Digite: setoolkit" && read ;;
          7) break ;;
          *) echo "Opção inválida"; sleep 1 ;;
        esac
      done
      ;;
    2)
      while true; do
        clear
        echo "[ ANÁLISE DE REDE ]"
        echo "============================="
        echo "1. Nmap"
        echo "2. Ping"
        echo "3. Netcat"
        echo "4. Tcpdump"
        echo "5. Whois"
        echo "6. Traceroute"
        echo "7. Dnsenum (se instalado)"
        echo "8. Voltar"
        echo "============================="
        read -p "Escolha uma opção: " net_option
        case $net_option in
          1) nmap ;;
          2) ping 8.8.8.8 ;;
          3) nc ;;
          4) tcpdump ;;
          5) whois google.com ;;
          6) traceroute google.com ;;
          7) echo "Digite: dnsenum site.com" && read ;;
          8) break ;;
          *) echo "Opção inválida"; sleep 1 ;;
        esac
      done
      ;;
    3)
      while true; do
        clear
        echo "[ DEV & UTILITÁRIOS ]"
        echo "============================="
        echo "1. Git"
        echo "2. Python"
        echo "3. Node.js"
        echo "4. Curl"
        echo "5. Wget"
        echo "6. Nano"
        echo "7. Ngrok (se instalado)"
        echo "8. Voltar"
        echo "============================="
        read -p "Escolha uma opção: " dev_option
        case $dev_option in
          1) git ;;
          2) python ;;
          3) node ;;
          4) curl ifconfig.me ;;
          5) wget https://example.com ;;
          6) nano ;;
          7) echo "Digite: ./ngrok http 8080" && read ;;
          8) break ;;
          *) echo "Opção inválida"; sleep 1 ;;
        esac
      done
      ;;
    4)
      while true; do
        clear
        echo "[ LIMPEZA & MONITORAMENTO ]"
        echo "============================="
        echo "1. Excluir caches"
        echo "2. Htop"
        echo "3. Ncdu"
        echo "4. Iftop"
        echo "5. Voltar"
        echo "============================="
        read -p "Escolha uma opção: " sys_option
        case $sys_option in
          1) apt clean && echo "Caches excluídos" && sleep 2 ;;
          2) htop ;;
          3) ncdu ;;
          4) iftop ;;
          5) break ;;
          *) echo "Opção inválida"; sleep 1 ;;
        esac
      done
      ;;
    5)
      echo "Saindo..."; sleep 1; exit ;;
    *) echo "Opção inválida"; sleep 1 ;;
  esac
done
EOF

chmod +x ~/menu.sh

# Inserindo execução automática no bashrc
grep -qxF 'bash ~/menu.sh' ~/.bashrc || echo 'bash ~/menu.sh' >> ~/.bashrc

echo "Instalação concluída! Reinicie o Termux."
