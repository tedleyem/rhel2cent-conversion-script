Login to the server and become root
Clean up yum’s cache

$yum clean all
migra
$yum clean all
Create a temporary working area

$mkdir -p /temp/centos
$cd /temp/centos


$mkdir -p /temp/centos
$cd /temp/centos
Determine your version of RHEL

$cat /etc/redhat-release

$cat /etc/redhat-release
Determine your architecture (32-bit = i386, 64-bit = x86_64)

$uname -i

$uname -i
Download the applicable files for your release and architecture. The version numbers on these packages could change. This document was written as of CentOS 5.10. To find the current versions of these files browse this FTP site: http://mirror.centos.org/centos/5/os/i386/CentOS/ (32-bit) and http://mirror.centos.org/centos/5/os/x86_64/CentOS/ (64-bit)
CentOS 5.10 / 32-bit

$wget http://mirror.centos.org/centos/5/os/i386/RPM-GPG-KEY-CentOS-5
$wget http://mirror.centos.org/centos/5/os/i386/CentOS/centos-release-5-x.el5.centos.i386.rpm
$wget http://mirror.centos.org/centos/5/os/i386/CentOS/centos-release-notes-x.x-x.i386.rpm
$wget http://mirror.centos.org/centos/5/os/i386/CentOS/yum-x.x.xx-xx.el5.centos.noarch.rpm
$wget http://mirror.centos.org/centos/5/os/i386/CentOS/yum-updatesd-x.x-x.el5.noarch.rpm
$wget http://mirror.centos.org/centos/5/os/i386/CentOS/yum-fastestmirror-x.x.xx-xx.el5.centos.noarch.rpm


$wget http://mirror.centos.org/centos/5/os/i386/RPM-GPG-KEY-CentOS-5
$wget http://mirror.centos.org/centos/5/os/i386/CentOS/centos-release-5-x.el5.centos.i386.rpm
$wget http://mirror.centos.org/centos/5/os/i386/CentOS/centos-release-notes-x.x-x.i386.rpm
$wget http://mirror.centos.org/centos/5/os/i386/CentOS/yum-x.x.xx-xx.el5.centos.noarch.rpm
$wget http://mirror.centos.org/centos/5/os/i386/CentOS/yum-updatesd-x.x-x.el5.noarch.rpm
$wget http://mirror.centos.org/centos/5/os/i386/CentOS/yum-fastestmirror-x.x.xx-xx.el5.centos.noarch.rpm

CentOS 5.10 / 64-bit

$wget http://mirror.centos.org/centos/5/os/x86_64/RPM-GPG-KEY-CentOS-5
$wget http://mirror.centos.org/centos/5/os/x86_64/CentOS/centos-release-5-xx.el5.centos.x86_64.rpm
$wget http://mirror.centos.org/centos/5/os/x86_64/CentOS/centos-release-notes-x.xx-x.x86_64.rpm
$wget http://mirror.centos.org/centos/5/os/x86_64/CentOS/yum-x.x.xx-xx.el5.centos.noarch.rpm
$wget http://mirror.centos.org/centos/5/os/x86_64/CentOS/yum-updatesd-x.x-x.el5.noarch.rpm
$wget http://mirror.centos.org/centos/5/os/x86_64/CentOS/yum-fastestmirror-x.x.xx-xx.el5.centos.noarch.rpm



get http://mirror.centos.org/centos/5/os/x86_64/RPM-GPG-KEY-CentOS-5
$wget http://mirror.centos.org/centos/5/os/x86_64/CentOS/centos-release-5-xx.el5.centos.x86_64.rpm
$wget http://mirror.centos.org/centos/5/os/x86_64/CentOS/centos-release-notes-x.xx-x.x86_64.rpm
$wget http://mirror.centos.org/centos/5/os/x86_64/CentOS/yum-x.x.xx-xx.el5.centos.noarch.rpm
$wget http://mirror.centos.org/centos/5/os/x86_64/CentOS/yum-updatesd-x.x-x.el5.noarch.rpm
$wget http://mirror.centos.org/centos/5/os/x86_64/CentOS/yum-fastestmirror-x.x.xx-xx.el5.centos.noarch.rpm
Import the GPG key for the appropriate version of CentOS

$rpm --import RPM-GPG-KEY-CentOS-5

$rpm --import RPM-GPG-KEY-CentOS-5
Remove the RHEL release files

$rpm -e --nodeps redhat-release

$rpm -e --nodeps redhat-release
Remove the Redhat Network plugin for yum

$rpm –e --nodeps yum-rhn-plugin

$rpm –e --nodeps yum-rhn-plugin
Removing the remaining RHEL files that may be install on the system

$rpm –e --nodeps rhn-client-tools rhn-setup rhn-check rhn-virtualization-common rhnsd redhat-logos redhat-release-notes rhel-instnum

$rpm –e --nodeps rhn-client-tools rhn-setup rhn-check rhn-virtualization-common rhnsd redhat-logos redhat-release-notes rhel-instnum

Note: If this command fails saying a package is not installed remove the package from the command and run it again.
Install the CentOS RPMs we downloaded previously (make sure you are still in /temp/centos)

$rpm -Uvh --force *.rpm

$rpm -Uvh --force *.rpm
Upgrade to CentOS from RHEL

$yum upgrade

$yum upgrade
Reboot the server
Verify functionality
Delete the VM Snapshot if you took one as part of the backup.

