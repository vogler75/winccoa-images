#!/bin/sh
if [ -f /proj/default/config/config ] && [ ! -f /etc/opt/pvss/pvssInst.done ]
then
cat >> /etc/opt/pvss/pvssInst.conf <<EOF
[Software\ETM\PVSS II\Configs\default]
notRunnable = 0
InstallationDate = "2020.01.01 00:00:00.000"
InstallationUser = "root"
InstallationVersion = "3.16"
PVSS_II = "/proj/default/config/config"
InstallationDir = "/proj/default"
EOF
touch /etc/opt/pvss/pvssInst.done
fi
