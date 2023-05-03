#!/bin/bash
ls /etc/xinetd.d/echo* >/dev/null 2>&1
if  [ $? != 0 ] ; then 
	echo ''
else
	for i in 'ls /etc/xinetd.d/echo*'
	do
		if [ "cat &i | grep disable | awk '{print $3}'" = yes] ; then
			echo -e "서비스 관리,U-23,DOS 공격에 취약한 서비스 비활성화,상,양호" >> linux_report.csv
		else
			echo -e "서비스 관리,U-23,DOS 공격에 취약한 서비스 비활성화,상,취약" >> linux_report.csv
		fi
	done
fi

ls /etc/xinetd.d/discard* >/dev/null 2>&1
if  [ $? != 0 ] ; then 
	echo ''
else
	for i in 'ls /etc/xinetd.d/discard*'
	do
		if [ "cat &i | grep disable | awk '{print $3}'" = yes] ; then
			echo -e "서비스 관리,U-23,DOS 공격에 취약한 서비스 비활성화,상,양호" >> linux_report.csv
		else
			echo -e "서비스 관리,U-23,DOS 공격에 취약한 서비스 비활성화,상,취약" >> linux_report.csv
		fi
	done
fi

ls /etc/xinetd.d/daytime* >/dev/null 2>&1
if  [ $? != 0 ] ; then 
	echo ''
else
	for i in 'ls /etc/xinetd.d/daytime*'
	do
		if [ "cat &i | grep disable | awk '{print $3}'" = yes] ; then
			echo -e "서비스 관리,U-23,DOS 공격에 취약한 서비스 비활성화,상,양호" >> linux_report.csv
		else
			echo -e "서비스 관리,U-23,DOS 공격에 취약한 서비스 비활성화,상,취약" >> linux_report.csv
		fi
	done
fi

ls /etc/xinetd.d/chargen* >/dev/null 2>&1
if  [ $? != 0 ] ; then 
	echo ''
else
	for i in 'ls /etc/xinetd.d/chargen*'
	do
		if [ "cat &i | grep disable | awk '{print $3}'" = yes] ; then
			echo -e "서비스 관리,U-23,DOS 공격에 취약한 서비스 비활성화,상,양호" >> linux_report.csv
		else
			echo -e "서비스 관리,U-23,DOS 공격에 취약한 서비스 비활성화,상,취약" >> linux_report.csv
		fi
	done
fi

ls /etc/inetd.conf* >/dev/null 2>&1
if  [ $? != 0 ] ; then 
	echo ''
else
	for i in 'ls /etc/inetd.conf*'
	do
		if grep -qE "echo|discard|daytime|chargen" /etc/inetd.conf; then
			if ! grep -qE '^#.*rsh|^#.*rlogin|^#.*rexec|^rsh|^rlogin|^rexec' /etc/inetd.conf
				echo -e "서비스 관리,U-23,DOS 공격에 취약한 서비스 비활성화,상,양호" >> linux_report.csv
			else
				echo -e "서비스 관리,U-23,DOS 공격에 취약한 서비스 비활성화,상,취약" >> linux_report.csv
			fi
		else
			echo -e "서비스 관리,U-23,DOS 공격에 취약한 서비스 비활성화,상,양호" >> linux_report.csv
		fi
	done
fi
