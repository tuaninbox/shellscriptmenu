#!/bin/zsh

ssh-add -K privatekeyfile
clear
sleep 0.5
RED='\033[0;41;30m'
STD='\033[0;0;39m'
show_menus(){
    clear
    echo "
╔═══════════════════════╦══════════════════════╦═════════════════╦═════════════════════╦════════════════════╦════════════════╗
║       Firewall        ║        Router        ║    Wireless     ║       Switch        ║   Server and LB    ║      Home      ║
╠═══════════════════════╬══════════════════════╬═════════════════╬═════════════════════╬════════════════════╬════════════════╣
║ 1. DC2 FW             ║ 20. RTR DC - Ext     ║ 39. 2000vamm001 ║ 40. SITECSW         ║ 60. SITEDC2VNWK001 ║ 80. Router     ║
║ 2. SITEFW             ║ 21. RTR DC - WAN     ║                 ║ 41. SITECSW fr Home ║ 61. SITEVBAK01     ║ 81. PC         ║
║ 3. 1000FW             ║ 22. RTR AZE          ║                 ║ 42. SITEDC2SW1      ║ 62. SITEVBAK02     ║ 82. HASS       ║
║ 4. 1001FW             ║ 23. RTR AZE DC2      ║                 ║ 43. SITEDC2SW2      ║ 63. Fortimail      ║ 83. HOME       ║
║ 5. 1002FW             ║                      ║                 ║ 44. SITEDC2OOBSW    ║ 64. SITELB01       ║ 84. AP         ║
║ 6. 1003FW             ║                      ║                 ║ 45. OFFI-CSW        ║                    ║ 85. AP1        ║
║ 7. 1004FW             ║                      ║                 ║ 46. OFFI-PR         ║                    ║ 86. Switch     ║
║ 8. 1005FW             ║                      ║                 ║                     ║                    ║ 87. kali - lab ║
║ 9. SITEfwm            ║                      ║                 ║                     ║                    ║ 88. lab        ║
║ 10. fw2000AZEpdfwmg02 ║                      ║                 ║                     ║                    ║ 89. VM         ║
║                       ║                      ║ q or Q. Exit    ║                     ║                    ║                ║
╚═══════════════════════╩══════════════════════╩═════════════════╩═════════════════════╩════════════════════╩════════════════╝"
# Firewall	Router	Wireless	Switch	Server and LB	Home
# 1. DC2 FW	20. RTR DC - Ext	39. 2000vamm001	40. SITECSW	60. SITEDC2VNWK001	80. Router
# 2. SITEFW	21. RTR DC - WAN		41. SITECSW fr Home	61. SITEVBAK01	81. PC
# 3. 1000FW	22. RTR AZE		42. SITEDC2SW1	62. SITEVBAK02	82. Hass
# 4. 1001FW	23. RTR AZE DC2		43. SITEDC2SW2	63. Fortimail	83. HOME
# 5. 1002FW			44. SITEDC2OOBSW	64. SITELB01	84. AP
# 6. 1003FW			45. OFFI-CSW		85. AP1
# 7. 1004FW			46. OFFI-PR		86. Switch
# 8. 1005FW					87. kali - lab
# 9. SITEfwm					88. lab
# 10. fw2000AZEpdfwmg02					89. VM
# 		q or Q. Exit
# https://ozh.github.io/ascii-tables/
}

read_options(){
	local choice
	read "choice?Enter number: " #zsh
    #read -p "Enter choice [ 1 - 3] " choice #bash
	case $choice in
		1) one ;;
		2) two ;;
        3) three ;;
        4) four ;;
        5) five ;;
        6) six ;;
        7) seven ;;
        8) eight;;
        9) nine ;;
        10) ten ;;
        20) twenty;;
        21) twentyone;;
        22) twentytwo ;;
        23) twentythree ;;
        39) thirtynine ;;
        40) forty ;;
        41) fortyone ;;
        42) fortytwo ;;
        43) fortythree ;;
        44) fortyfour ;;
        45) fortyfive ;;
        46) fortysix ;;
        60) sixty ;;
        61) sixtyone ;;
        62) sixtytwo ;;
        63) sixtythree ;;
        64) sixtyfour ;;
        80) eighty ;;
        81) eightyone ;;
        82) eightytwo ;;
        83) eightythree ;;
        84) eightyfour ;;
        85) eightyfive ;;
        86) eightysix ;;
        87) eightyseven ;;
        88) eightyeight ;;
        89) eightynine ;;
		q) exit 0;;
        Q) exit 0;;
		*) echo -e "${RED}INVALID INPUT!${STD}" && sleep 1
	esac
}

one(){
    echo "Connecting to vpn.SITE.com"
    ssh -A user@vpn.SITE.com
}

two(){
    echo "Connecting to 192.168.6.9"
    ssh -A user@192.168.6.9
}

three(){
    echo "Connecting to 192.168.16.4"
    ssh -A user@192.168.16.4
}

four(){
    echo "Connecting to 1001.SITE.com"
    ssh -A user@1001.SITE.com
}

five(){
    echo "Connecting to 1002.SITE.com"
    ssh -A user@1002.SITE.com
}

six(){
    echo "Connecting to 1003.SITE.com"
    ssh -A user@1003.SITE.com
}

seven(){
    echo "Connecting to 1004.SITE.com"
    ssh -A user@1004.SITE.com
}

eight(){
    echo "Connecting to 1005.SITE.com"
    ssh -A user@1005.SITE.com
}

nine(){
    echo "Connecting to 192.168.6.20"
    ssh -A user@192.168.6.20
}

ten(){
    echo "Connecting to 200.248.2.26"
    ssh -A user@200.248.2.26
}

twenty(){
    echo "Connecting to 172.16.44.1"
    ssh hoangt@172.16.44.1
}

twentyone(){
    echo "Connecting to 172.17.87.5"
    ssh user@172.17.87.5
}

twentytwo(){
    echo "Connecting to 192.168.50.9"
    ssh user@192.168.50.9
}

twentythree(){
    echo "Connecting to 192.168.50.1"
    ssh user@192.168.50.1
}

thirtynine(){
    echo "Connecting to 192.168.1.58"
    ssh user@192.168.1.58
}

forty(){
    echo "Connecting to 192.168.0.1"
    ssh user@192.168.0.1
}

fortyone(){
    echo "Connecting to 100.100.82.58"
    ssh user@100.100.82.58
}

fortytwo(){
    echo "Connecting to 192.168.4.3"
    ssh -A user@192.168.4.3
}

fortythree(){
    echo "Connecting to 192.168.4.4"
    ssh -A user@192.168.4.4
}

fortyfour(){
    echo "Connecting to 192.168.4.5"
    ssh -A user@192.168.4.5
}

fortyfive(){
    echo "Connecting to 192.168.16.10"
    telnet -l user 192.168.16.10
}

fortysix(){
    echo "Connecting to 192.168.16.17"
    ssh user@192.168.16.17
}

sixty(){
    echo "Connecting to 192.168.4.10.13"
    ssh -A user@192.168.4.10.13
}

sixtyone(){
    echo "Connecting to 192.168.3.240"
    ssh -A user@192.168.3.240
}

sixtytwo(){
    echo "Connecting to 192.168.3.242"
    ssh -A user@192.168.3.242
}

sixtythree(){
    echo "Connecting to 192.168.4.10.22"
    ssh -A user@192.168.4.10.22
}

sixtyfour(){
    echo "Connecting to SITEvbak02 @ 192.168.3.242"
    ssh -A user@192.168.3.242
}

eighty(){
    echo "Connecting to 192.168.0.1"
    ssh -A user@192.168.0.1
}

eightyone(){
    echo "Connecting to 192.168.0.5"
    ssh -A user@192.168.0.1
}

eightytwo(){
    echo "Connecting to 192.168.0.16"
    ssh -A user@192.168.0.16
}

eightythree(){
    echo "Connecting to 192.168.0.17"
    ssh -A user@192.168.0.17
}

eightyfour(){
    echo "Connecting to 192.168.0.9"
    telnet -l user 192.168.0.9
}

eightyfive(){
    echo "Connecting to 192.168.0.7"
    telnet -l user 192.168.0.17
}

eightysix(){
    echo "Connecting to 192.168.0.8"
    telnet -l user 192.168.0.1
}

eightyseven(){
    echo "Connecting to lab.com"
    ssh -A user@lab.com -p 221
}

eightyeight(){
    echo "Connecting to lab.com"
    ssh -A user@lab.com
}

eightynine(){
    echo "Connecting to 200.200.110.153"
    ssh -A opc@200.200.110.153
}
# ----------------------------------------------
# Step #3: Trap CTRL+C, CTRL+Z and quit singles
# ----------------------------------------------
trap '' SIGINT SIGQUIT SIGTSTP
 
# -----------------------------------
# Step #4: Main logic - infinite loop
# ------------------------------------
while true
do
	show_menus
	read_options
done