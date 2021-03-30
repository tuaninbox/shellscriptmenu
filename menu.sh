#!/bin/zsh
WANRouter="./WANRouter.txt"
ssh-add -K key1
ssh-add -K key2
ssh-add -K key3
clear
sleep 0.5
RED='\033[0;41;30m'
STD='\033[0;0;39m'
show_menus(){
    clear
    echo "
╔═══════════════════════╦═══════════════════════╦═════════════════╦══════════════════════╦══════════════════════════╦════════════════╗
║       Firewall        ║        Router         ║    Wireless     ║       Switch         ║   Server and LB          ║      Home      ║
╠═══════════════════════╬═══════════════════════╬═════════════════╬══════════════════════╬══════════════════════════╬════════════════╣
║ 1. DC2 FW             ║ 20. RTR Center - Ext  ║ 39. 1445vamm001 ║ 40. DC01CSW          ║ 60. DC01DC2VNWK001       ║ 80. Router     ║
║ 2. DC01FW             ║ 21. RTR Center - WAN  ║                 ║ 41. DC01CSW fr Home  ║ 61. DC01DC2VNWK001 - Ext ║ 81. PC         ║
║ 3. 1000FW             ║ 22. RTR EXP           ║                 ║ 42. DC01DC2SW1       ║ 62. DC01DC2VNWK001 - Ans ║ 82. SMHO       ║
║ 4. 1055FW             ║ 23. RTR EXP DC2       ║                 ║ 43. DC01DC2SW2       ║ 63. DC01DC2VNWK001 - A&E ║ 83. HOME       ║
║ 5. 1120FW             ║ 24. WAN - interactive ║                 ║ 44. DC01DC2OOBSW     ║ 64. DC01DUPH01           ║ 84. AP         ║
║ 6. 1415FW             ║ 25. WAN - show cmd    ║                 ║ 45. OFFI-CSW         ║ 65. DC01DUPH02           ║ 85. AP1        ║
║ 7. 1680FW             ║ 26. WAN - Backup      ║                 ║ 46. OFFI-PR          ║ 66. Mailserver           ║ 86. Switch     ║
║ 8. 1157FW             ║                       ║                 ║ 47. DC01FWSW1        ║                          ║ 87. Lab        ║
║ 9. DC01fwm            ║                       ║                 ║ 48. DC01FWSW2        ║                          ║ 88. lab1       ║
║ 10. fw100000000fwmg02 ║                       ║                 ║                      ║                          ║ 89. VM         ║
╠═══════════════════════╩═══════════════════════╩═════════════════╩══════════════════════╩══════════════════════════╩════════════════╣
║                          W. WAN Account  -  O. Other Account  - P. userng Test -  !. Shell  -  Q. Exit                               ║ 
╚════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╝"
# Firewall	Router	Wireless	Switch	Server and LB	Home
# 1. DC2 FW	20. RTR Center - Ext	39. 1445vamm001	40. DC01CSW	60. DC01DC2VNWK001	80. Router
# 2. DC01FW	21. RTR Center - WAN		41. DC01CSW fr Home	61. DC01DUPH01	81.  PC
# 3. 1000FW	22. RTR EXP		42. DC01DC2SW1	62. DC01DUPH02	82. Hass
# 4. 1055FW	23. RTR EXP DC2		43. DC01DC2SW2	63. mailserver	83. HOME
# 5. 1120FW		    24. WAN - interactive	44. DC01DC2OOBSW	64. DC01LB01	84. AP
# 6. 1415FW			25. WAN - show cmd    45. OFFI-CSW		85. AP1
# 7. 1680FW			26. WAN - Backup    46. OFFI-PR.    		86. Switch
# 8. 1157FW					87. kali - lab
# 9. DC01fwm					88. lab
# 10. fw100000000fwmg02					89. VM
# 		q or Q. Exit    c/C. check user/pass
# https://ozh.github.io/ascii-tables/
}

read_options(){
	local choice
	read "choice?Enter number: " #zsh
    #read -p "Enter choice [ 1 - 3] " choice #bash
	case $choice in
		1) SSHUsingKey "vpn.DC01.com" "user" ;;
		2) SSHUsingKey "10.10.10.9" "user" ;;
        3) SSHUsingKey "10.10.16.4" "user" ;;
        4) SSHUsingKey "1055.DC01.com" "user" ;;
        5) SSHUsingKey "1120.DC01.com" "user" ;;
        6) SSHUsingKey "1415.DC01.com" "user" ;;
        7) SSHUsingKey "1680.DC01.com" "user" ;;
        8) SSHUsingKey "1157.DC01.com" "user";;
        9) SSHUsingKey "10.10.10.20" "user" ;;
        10) SSHUsingKey "10.12.2.26" "user" ;;
        20) OtherDevice "10.108.44.1" "wan";;
        21) OtherDevice "10.11.87.5" "wan";;
        22) OtherDevice "10.10.50.9" "other" ;;
        23) OtherDevice "10.10.50.1" "other" ;;
        24) WANRouters ;;
        25) WANRouterShow ;;
        26) WANRouterBackup ;;
        39) thirtynine ;;
        40) OtherDevice "10.10.3.1" "other" ;;
        41) SSHUsingKey "100.100.82.58" "user" ;;
        42) SSHUsingKey "10.104.1.3" "user" ;;
        43) SSHUsingKey "10.104.1.4" "user" ;;
        44) SSHUsingKey "10.104.1.5" "user";;
        45) OtherDevice "10.10.16.10" "other" ;;
        46) OtherDevice "10.10.16.17" "other" ;;
        47) SSHUsingKey "10.10.16.5" "user" ;;
        48) SSHUsingKey "10.10.16.6" "user" ;;
        60) SSHUsingKey "10.104.10.13" "user" ;;
        61) SSHUsingKey "100.101.137.174" "user" "222";;
        62) SSHUsingKey "10.104.10.13" "ansible" ;;
        63) SSHUsingKey "100.101.137.174" "ansible" "222";;
        64) SSHUsingKey "10.10.3.240" "user";;
        65) SSHUsingKey "10.10.3.242" "user";;
        66) SSHUsingKey "10.104.10.22" "user" ;;
        80) SSHUsingKey "domain.com" "user" ;;
        81) eightyone ;;
        82) SSHUsingKey "10.13.0.16" "user" ;;
        83) SSHUsingKey "10.13.0.17" "user" ;;
        84) eightyfour ;;
        85) eightyfive ;;
        86) eightysix ;;
        87) eightyseven ;;
        88) eightyeight ;;
        89) eightynine ;;
        o) setvar "user2" ;;
        O) setvar "user2" ;;
        p) userngTest ;;
        P) userngTest ;;
        r) resetuser ;;
        R) resetuser ;;
        w) setvar "user" ;;
        W) setvar "user" ;;
		q) exit 0;;
        Q) exit 0;;
        !) OpenShell;;
		*) echo -e "${RED}INVALID INPUT!${STD}" && sleep 1
	esac
}

thirtynine(){
    echo "Connecting to 10.10.1.58"
    ssh user@10.10.1.58
}

sixtyfour(){
    echo "Connecting to DC01DUPH02 @ 10.10.3.242"
    ssh -A user@10.10.3.242
}

eightyone(){
    echo "Connecting to 10.13.0.5"
    ssh -D 8084 -A user@10.13.0.5
}

eightyfour(){
    echo "Connecting to 10.13.0.9"
    telnet -l user 10.13.0.9
}

eightyfive(){
    echo "Connecting to 10.13.0.7"
    telnet -l user 10.13.0.17
}

eightysix(){
    echo "Connecting to 10.13.0.8"
    telnet -l user 10.13.0.1
}

eightyseven(){
    echo "Connecting to lab.domain.com"
    ssh -D 8081 -A user@lab.domain.com -p 221
}

eightyeight(){
    echo "Connecting to lab.domain.com"
    ssh -A user@lab.domain.com
}

eightynine(){
    echo "Connecting to 10.15.110.153"
    ssh -D 8085 -A user@10.15.110.153
}

checkvar(){
    if [ $1 = user2 ]; then
        u=${user2}
    elif [ $1 = user ]; then
        u=${user}
    fi
    echo "Current Credential: "
    if [ ${#u} -ge 1 ]; then
        echo "user=$u"
    else
        echo "user not set"
    fi
    
    if [ $1 = user2 ]; then
        p=${pass2}
    elif [ $1 = user ]; then
        p=${pass}
    fi
    if [ ${#p} -ge 1 ]; then
        echo -n "pass="
       for i in `seq 1 ${#p}`
       do
            if [ $i -eq 1 ] || [ $i -eq ${#p} ]; then
                echo -n "$p[i]"
            else 
                echo -n "*"
            fi
        done
    else
        echo "pass not set"
    fi
    sleep 1
}

setvar(){
    local choice
    checkvar $1
    echo ""
    while true
    do
        read -k 1 -s "choice?Do you want to change? [y/n/c]"
        case $choice in
            y) ChangeCred $1 ;;
            Y) ChangeCred $1 ;;
            n) NoChangeCred ;;
            N) NoChangeCred ;;
            c) break ;;
            C) break ;;
            *) echo -e "${RED}INVALID INPUT!${STD}" && sleep 1
        esac
    done
    }

ChangeCred(){
    echo
    read "u?Username: "
    read -s "p?Password: "
    if [ $1 = user ]; then
        export user=$u
        export pass=$p
    elif [ $1 = user2 ]; then
        export user2=$u
        export pass2=$p
    fi
    echo "\nUser/Pass set"
    sleep 2
    break;
    }

NoChangeCred(){
    echo
    echo "Keep old credential" && sleep 1
    break;
    }

ResetUser(){
    if [ $1 = user ]; then
        unset user
        unset pass
    elif [ $1 = user2 ]; then
        unset user2
        unset pass2
    fi
    }

OpenShell(){
    /bin/bash
    }

userngTest(){
    read "add?IP address: "
    read "t?Warning Threshold (ms): "
    CYAN='\033[4;36;40m'; 
    #CYAN=$(tput setab 0; tput setaf 6; tput blink)
    GREEN='\033[0;32;40m'; YELLOW='\033[1;33;40m'; RED='\033[5;41;30m'; STD='\033[0;0;39m';
    mkdir -p userngResult
    f="userngResult/$add-"$(date +'%y%m%d-%H%M')".txt"
    heading="\n${CYAN}TESTING CONNECTIVITY TO $add. Threshold $t ms. Press Ctrl-C to stop!${STD}"
    echo "Testing Connectivity to $add, threshold $t ms" >> $f
    trap break INT
    ip=$add; threshold=$t; file=$f; timer=0; while true; do if [ $timer -gt 600 ] || [ $timer -eq 0 ]; then echo $heading; timer=0; fi; r=`userng -c 1 $ip | tr "\n" " " | awk '/1 packets received/ {print $13}' | cut -d"=" -f2`; if [ -z $r ]; then echo "Down: " `date` >> $file; echo -n "${RED}Down${STD} "; tput bel; elif [ ${r%.*} -gt $threshold ]; then echo "Warning:" `date` $r "ms" >> $file; echo -n "${YELLOW}$r${STD} ms "; elif [ ${r%.*} -le $threshold ]; then echo "Up:" `date` $r "ms" >> $file; echo -n "${GREEN}$r${STD} ms "; else echo "Unknown"; fi; sleep 2; timer=$(($timer+2)); done
    trap - INT
}

OtherDevice(){
	local choice
    h=$1
    if [ $2 = other ]; then
        if [ ${#user2} -ge 1 ] && [ ${#pass2} -ge 1 ]; then 
            echo "Using current user $user2 and password "
        else
            read "u2?Username: "
            read -s "p2?Password: "
            export user2=$u2
            export pass2=$p2
        fi
        u=$user2
        p=$pass2
    elif [ $2 = wan ]; then
        if [ ${#user} -ge 1 ] && [ ${#pass} -ge 1 ]; then 
            echo "Using current user $user and password "
        else
            read "u?Username: "
            read -s "p?Password: "
            export user=$u
            export pass=$p
        fi
        u=$user
        p=$pass
    fi
    echo "\nConnecting to $h using account $u"
    # sshpass -e ssh -oStrictHostKeyChecking=no $user@$host
    sshpass -p $p ssh -A -oStrictHostKeyChecking=no $u@$h
    sleep 1
    }

SSHUsingKey(){
    if [ $3 ]; then
        p=$3
    else
        p=22
    fi
    echo "Connecting to $1"
    ssh -A $2@$1 -p $p
    }

WANRouters(){
	local choice
	read "choice?Enter School code: " #zsh
    #read -p "Enter choice [ 1 - 3] " choice #bash
	host=`grep $choice $WANRouter | cut -d"," -f2`
    user=`echo $user`
    pass=`echo $pass`
    if [ ${#user} -ge 1 ] && [ ${#pass} -ge 1 ]; then 
        echo "Using current user $user and password "
    else
        read "user?Username: "
        read -s "pass?Password: "
        export user=$user
        export pass=$pass
    fi
    echo "\nConnecting to " $choice " - " $host
    sshpass -p $pass ssh -oStrictHostKeyChecking=no $user@$host
    #SSH $host $user $pass
    sleep 1
    # echo "Connecting to " $choice " - " $host
    # ssh $user@$host
    # sleep 1
}

WANRouterShow(){
	local choice
	read "choice?Enter School code: " #zsh
    #read -p "Enter choice [ 1 - 3] " choice #bash
	host=`grep $choice $WANRouter | cut -d"," -f2`
    user=`echo $user`
    pass=`echo $pass`
    if [ ${#user} -ge 1 ] && [ ${#pass} -ge 1 ]; then 
        echo "Using current user $user and password "
    else
        read "user?Username: "
        read -s "pass?Password: "
        export user=$user
        export pass=$pass
        echo
    fi
    read "cmd?Command to run: "
    echo "Connecting to " $choice " - " $host
    result=`sshpass -p $pass ssh -oStrictHostKeyChecking=no $user@$host $cmd`
    echo $result
    read -k 1 -s "option?Save output to file? [y/n]"
    echo
    if [ $option = y ] || [ $option = Y ]; then
        read "filename?File name? "
        echo $filename | grep "/" 1>& /dev/null
        if [ $? -eq 0 ]; then
            mkdir -p "${filename%/*}" && touch "$filename"
        fi
        r=`echo $result > $filename`
        if [ $? -eq 0 ]; then 
            echo "Saved to $filename successfully" 
        else 
            echo $r 
        fi
        sleep 2
    fi
}

WANRouterBackup(){
	local choice
	read "choice?Enter School code: " #zsh
    #read -p "Enter choice [ 1 - 3] " choice #bash
	host=`grep $choice $WANRouter | cut -d"," -f2`
    user=`echo $user`
    pass=`echo $SSHPASS`
    if [ ${#user} -ge 1 ] && [ ${#pass} -ge 1 ]; then 
        echo "Using current user $user and password "
    else
        read "user?Username: "
        read -s "pass?Password: "
        export user=$user
        export SSHPASS=$pass
        echo
    fi
    #read "cmd?Command to run: "
    cmd="show run"
    read "filename?File name? "
    echo "Backing up configuration from " $choice " - " $host
    result=`sshpass -p $pass ssh -oStrictHostKeyChecking=no $user@$host $cmd`
    echo $filename | grep "/" 1>& /dev/null
    if [ $? -eq 0 ]; then
        mkdir -p "${filename%/*}" && touch "$filename"
    fi
    r=`echo $result > $filename`
    if [ $? -eq 0 ]; then 
        echo "Backup to $filename successfully" 
    else 
        echo $r 
    fi
    sleep 2
}

# ----------------------------------------------
# Step #3: Trap CTRL+C, CTRL+Z and quit singles
# ----------------------------------------------
trap '' SIGINT SIGTSTP
#SIGQUIT
 
# -----------------------------------
# Step #4: Main logic - infinite loop
# ------------------------------------
while true
do
	show_menus
	read_options
done