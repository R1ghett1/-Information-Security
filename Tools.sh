#!/bin/bash

# Cores
RED="\033[1;31m"
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
BLUE="\033[1;34m"
CYAN="\033[1;36m"
RESET="\033[0m"

clear
echo -e "${CYAN}=========================================${RESET}"
echo -e "        🔎 ${GREEN}Tools - R1ghett1${RESET} 🔎"
echo -e "${CYAN}=========================================${RESET}"
echo
echo -e "${YELLOW}[1]${RESET} - Port Scan"
echo -e "${YELLOW}[2]${RESET} - Procurar Diretorios"
echo -e "${YELLOW}[3]${RESET} - Procurar SubDominios"
echo -e "${YELLOW}[4]${RESET} - Google Hacking"
echo -e "${YELLOW}[5]${RESET} - Analise de Metadados"
echo -e "${YELLOW}[6]${RESET} - Whois"
echo
echo -e "${YELLOW}[0]${RESET} - Sair"
echo

read -p "Escolha uma opção: " choice



if [ "$choice" -eq 1 ]; then
    read -p "Digite o host ou IP alvo: " host
    echo
    echo -e "${BLUE}Opções de PortScan:${RESET}"
    echo -e "${YELLOW}[1]${RESET} - Definir Portas específicas"
    echo -e "${YELLOW}[2]${RESET} - Intervalo de Portas"
    echo -e "${YELLOW}[3]${RESET} - Todas as Portas (1-65535)"
    echo
    read -p "Escolha: " choicePort
    echo

    if [ "$choicePort" -eq 1 ]; then
        read -p "Quais portas deseja (ex: 22,80,443): " ports
        echo -e "\n${GREEN}▶ Executando PortScan...${RESET}\n"
        nmap -p "$ports" -sV --open "$host" | grep -E '^PORT|^[0-9]' | awk '{print $1, $3}'

    elif [ "$choicePort" -eq 2 ]; then
        read -p "Digite o intervalo de portas (ex: 20-100): " range
        echo -e "\n${GREEN}▶ Executando PortScan...${RESET}\n"
        nmap -p "$range" -sV --open "$host" | grep -E '^PORT|^[0-9]' | awk '{print $1, $3}'

    elif [ "$choicePort" -eq 3 ]; then
        echo -e "\n${GREEN}▶ Executando PortScan em todas as portas...${RESET}\n"
        nmap -p- -sV --open "$host" | grep -E '^PORT|^[0-9]' | awk '{print $1, $3}'
    else
        echo -e "${RED}Opção inválida!${RESET}"
    fi

elif [ "$choice" -eq 4 ]; then
	read -p "Digite o host ou IP alvo: " hostHacking
	echo
	echo -e "${YELLOW}[1]${RESET} - Trello"
   	echo -e "${YELLOW}[2]${RESET} - Pastebin"
	echo -e "${YELLOW}[3]${RESET} - Pesquisar por arquivos"
	echo
	read -p "Escolha uma opção: " choiceHackingSearch

	if [ "$choiceHackingSearch" -eq 1 ]; then
        echo -e "\n${GREEN}▶ Fazendo buscar pelo Trello ...${RESET}\n"
	xdg-open "https://google.com/search?q=site:trello.com+$hostHacking" 2>/dev/null &

	elif [ "$choiceHackingSearch" -eq 2 ]; then
        echo -e "\n${GREEN}▶ Fazendo buscar pelo Pastebin ...${RESET}\n"
        xdg-open "https://google.com/search?q=site:pastebin.com+$hostHacking" 2>/dev/null &

	elif [ "$choiceHackingSearch" -eq 3 ]; then
        echo
        echo -e "${YELLOW}[1]${RESET} - Credenciais / logs (txt, log, sql, xml, json, csv)"
        echo -e "${YELLOW}[2]${RESET} - Configurações (conf, ini, env, yml, yaml)"
        echo -e "${YELLOW}[3]${RESET} - Código / Scripts (php, asp, aspx, jsp, sh, bat)"
        echo -e "${YELLOW}[4]${RESET} - Documentos internos (pdf, xls, xlsx, doc, docx, ppt, pptx)"
        echo -e "${YELLOW}[5]${RESET} - Backups / comprimidos (bak, old, zip, rar, 7z, tar, gz)"
        echo
        read -p "Escolha o tipo de arquivo: " choiceFile
        echo

        case $choiceFile in
            1)
                echo -e "\n${GREEN}▶ Buscando arquivos de credenciais/logs...${RESET}\n"
                xdg-open "https://google.com/search?q=site:$hostHacking+(ext:txt+OR+ext:log+OR+ext:sql+OR+ext:xml+OR+ext:json+OR+ext:csv)" 2>/dev/null &
                ;;
            2)
                echo -e "\n${GREEN}▶ Buscando arquivos de configuração...${RESET}\n"
                xdg-open "https://google.com/search?q=site:$hostHacking+(ext:conf+OR+ext:ini+OR+ext:env+OR+ext:yml+OR+ext:yaml)" 2>/dev/null &
                ;;
            3)
                echo -e "\n${GREEN}▶ Buscando arquivos de código/scripts...${RESET}\n"
                xdg-open "https://google.com/search?q=site:$hostHacking+(ext:php+OR+ext:asp+OR+ext:aspx+OR+ext:jsp+OR+ext:sh+OR+ext:bat)" 2>/dev/null &
                ;;
            4)
                echo -e "\n${GREEN}▶ Buscando documentos internos...${RESET}\n"
                xdg-open "https://google.com/search?q=site:$hostHacking+(ext:pdf+OR+ext:xls+OR+ext:xlsx+OR+ext:doc+OR+ext:docx+OR+ext:ppt+OR+ext:pptx)" 2>/dev/null &
                ;;
            5)
                echo -e "\n${GREEN}▶ Buscando backups/comprimidos...${RESET}\n"
                xdg-open "https://google.com/search?q=site:$hostHacking+(ext:bak+OR+ext:old+OR+ext:zip+OR+ext:rar+OR+ext:7z+OR+ext:tar+OR+ext:gz)" 2>/dev/null &
                ;;
            *)
                echo -e "${RED}Opção inválida!${RESET}"
                ;;
        	esac
	fi
elif [ "$choice" -eq 5 ]; then
	echo -e "${YELLOW}${RESET} - Procura por arquivos e faz download para analise. "
	echo -e "${YELLOW}[1]${RESET} - TXT"
        echo -e "${YELLOW}[2]${RESET} - PDF"
	echo

	read -p "Escolha o tipo de arquivo: " choiceFileMeta
	read -p "Digite o host ou IP alvo: " hostMeta
	echo

	if [ "$choiceFileMeta" -eq 1 ]; then
	links=$(lynx --dump "https://google.com/search?&q=site:$hostMeta+ext:txt" | grep ".txt" | cut -d "=" -f2 | egrep -v "site|google" | sed 's/...$//' | grep "http")

	echo "Baixando os arquivos..."
	for link in $links; do
        wget -q "$link"
    	done

    	echo -e "\n${GREEN}▶ Metadados dos arquivos: ${RESET}\n"
    	exiftool *.txt
	rm *.txt

	elif [ "$choiceFileMeta" -eq 2 ]; then
	links=$(lynx --dump "https://google.com/search?&q=site:$hostMeta+ext:pdf" | grep ".pdf" | cut -d "=" -f2 | egrep -v "site|google" | sed 's/...$//' | grep "http")

	echo "Baixando os arquivos..."
	for link in $links; do
	wget -q "$link"
	done

	echo -e "\n${GREEN}▶ Metadados dos arquivos: ${RESET}\n"
	exiftool *.pdf
	rm *.pdf

	fi


elif [ "$choice" -eq 6 ]; then

	read -p "Digite o host ou IP para WHOIS: " hostWHOIS
	resp=$(echo "$hostWHOIS" | nc whois.iana.org 43)
	whois=$(echo "$resp" | grep "refer" | cut -d ":" -f2 | sed 's/^[ \t]*//;s/[ \t]*$// ')

	echo -e "\n${GREEN}▶ [Resposta da IANA.ORG] ${YELLOW} Servidor WHOIS responsável: ${RESET} $whois \n"

	resp2=$(echo "$hostWHOIS" | nc "$whois" 43)
	echo -e "${GREEN}▶ [Resposta da(o) ${YELLOW} $whois]: "
	echo -e "${RESET} $resp2"

elif [ "$choice" -eq 0 ]; then

	echo -e "\n${GREEN}▶ Saindo do Programa... ${RESET}\n"
	exit

fi
