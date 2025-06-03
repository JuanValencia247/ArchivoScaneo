#!/bin/bash

# Variables
TARGET="saferisingequity.info"
WORDLIST="/usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt"

echo ">> Iniciando escaneo con Gobuster..."
gobuster dir -u https://$TARGET -w $WORDLIST -t 20 -o gobuster_result.txt

echo ">> Escaneo con Dirb..."
dirb https://$TARGET -o dirb_result.txt

echo ">> Escaneo con Nmap..."
nmap -Pn -sS -sV -T4 -p- $TARGET -oN nmap_result.txt

echo ">> Escaneos completados. Resultados guardados en archivos de salida:"
echo "   - gobuster_result.txt"
echo "   - dirb_result.txt"
echo "   - nmap_result.txt"