##functions

function TASK11 {

	clear
	echo """
1. Install OS
2. Apply Patches
3. Abort/Exit
"""
	read -p "Choose what operation to perform (1/2/3): " TASK1

	if [ $TASK1 -eq 1 ]; then
		TASK33
	elif [ $TASK1 -eq 2 ]; then
		echo "patch is not released yet"
	elif [ $TASK1 -eq 3 ]; then
		exit 0
	else
		echo "wrong input"
		sleep 2s
		TASK11
	fi

}

function TASK22 {

	clear
	echo """
1. Ubuntu
2. Debian
3. Kali
4. CentOS
"""
	read -p "Choose what os you want to install (1/2/3/4): " TASK2

	if [ $TASK2 -eq 1 ]; then
		echo "installing Ubuntu"
		wget "https://raw.githubusercontent.com/AKPR2007/termux-linux/main/install/ubuntu.sh"
		chmod +x ubuntu.sh
		bash ubuntu.sh
		rm ubuntu.sh
	elif [ $TASK2 -eq 2 ]; then
		echo "installing Debian"
		wget "https://raw.githubusercontent.com/AKPR2007/termux-linux/main/install/debian.sh"
		chmod +x debian.sh
		bash debian.sh
		rm debian.sh
	elif [ $TASK2 -eq 3 ]; then
		echo "installing Kali"
		wget "https://raw.githubusercontent.com/AKPR2007/termux-linux/main/install/kali.sh"
		chmod +x kali.sh
		bash kali.sh
		rm kali.sh
	elif [ $TASK2 -eq 4 ]; then
		echo "installing CentOS"
		wget "https://raw.githubusercontent.com/AKPR2007/termux-linux/main/install/centos.sh"
		chmod +x centos.sh
		bash centos.sh
		rm centos.sh
	else
		echo "wrong input"
		sleep 2s
		TASK22
	fi
}

function TASK33 {

	echo "preparing for installation"
	yes | apt update
	yes | apt upgrade
	pkg install wget openssl-tool proot -y
	hash -r
	clear
	TASK22

}

##execute

clear
echo "Termux-Linux v1.1.0"
sleep 3s
echo "checking termux version"
if [ -n "$TERMUX_VERSION" ]; then
	MIN_VERSION=0.117
	CHECK_VERSION=$(awk 'BEGIN{ print "'$TERMUX_VERSION'">="'$MIN_VERSION'" }')
	if [ "$CHECK_VERSION" -eq 1 ]; then
		echo "termux version is stable. continuing"
		TASK11
	else
		echo "termux version is unstable. exiting with error code 1"
		exit 1
	fi
else
	echo "termux version is unstable. exiting with error code 1"
	exit 1
fi
