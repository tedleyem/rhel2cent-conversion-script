
# Convert RedHat Server to CentOs server
# Helps avoiding RHEL Licensing fees
#Login to the server and become root
#Clean up yum’s cache
unamestr=`uname -m`

neo_install(){
cd neo/
sudo make install
cd ..
neofetch
}

echo "Testing the Migration from Red Hat Enterprise Linux Server release 6.9 (Santiago)" && sleep 2
echo "To CentOS LInux Server 6.9 (Santiago)" && sleep 2
echo "Checking Current OS"
neo_install
echo "Current OS"
neofetch | grep "OS"

yum clean all  && sleep 1
#Create a temporary working area
echo "Creating temp folder" && sleep 1
mkdir -p /temp/centos
cd /temp/centos
#Determine your version of RHEL
echo "Finding arc and download proper CentOS packages" && sleep 3
if [[ "$unamestr" == 'i386' ]]; then
wget http://mirror.centos.org/centos/6/os/i386/RPM-GPG-KEY-CentOS-6
wget http://mirror.centos.org/centos/6/os/i386/CentOS/centos-release-6-x.el6.centos.i386.rpm
wget http://mirror.centos.org/centos/6/os/i386/CentOS/centos-release-notes-x.x-x.i386.rpm
wget http://mirror.centos.org/centos/6/os/i386/CentOS/yum-x.x.xx-xx.el6.centos.noarch.rpm
wget http://mirror.centos.org/centos/6/os/i386/CentOS/yum-updatesd-x.x-x.el6.noarch.rpm
wget http://mirror.centos.org/centos/6/os/i386/CentOS/yum-fastestmirror-x.x.xx-xx.el6.centos.noarch.rpm

elif [[ "$unamestr" == 'x86_64' ]]; then
wget http://mirror.centos.org/centos/6/os/x86_64/RPM-GPG-KEY-CentOS-6
wget http://mirror.centos.org/centos/6/os/x86_64/CentOS/centos-release-6-xx.el6.centos.x86_64.rpm
wget http://mirror.centos.org/centos/6/os/x86_64/CentOS/centos-release-notes-x.xx-x.x86_64.rpm
wget http://mirror.centos.org/centos/6/os/x86_64/CentOS/yum-x.x.xx-xx.el6.centos.noarch.rpm
wget http://mirror.centos.org/centos/6/os/x86_64/CentOS/yum-updatesd-x.x-x.el6.noarch.rpm
wget http://mirror.centos.org/centos/6/os/x86_64/CentOS/yum-fastestmirror-x.x.xx-xx.el6.centos.noarch.rpm

fi
#Import the GPG key for the appropriate version of CentOS
echo "importing GPG Keys"
rpm --import RPM-GPG-KEY-CentOS-6 && sleep 1

#Remove the RHEL release files
echo "Remove OS dependancies"
rpm -e --nodeps redhat-release

#Remove the Redhat Network plugin for yum
echo "Cleaning RedHat plugins" && sleep 2
rpm –e --nodeps yum-rhn-plugin

#Removing the remaining RHEL files that may be install on the system
echo "Remove all RedHat markings" && sleep 2
rpm –e --nodeps rhn-client-tools rhn-setup rhn-check rhn-virtualization-common rhnsd redhat-logos redhat-release-notes rhel-instnum

#Note: If this command fails saying a package is not installed remove the package from the command and run it again.
#Install the CentOS RPMs we downloaded previously (make sure you are still in /temp/centos)
echo "Install CentOS keys"
rpm -Uvh --force *.rpm

#Upgrade to CentOS from RHEL
echo "Run update and Upgrade" && sleep 2
yum upgrade

echo "checking OS" && sleep 2
neo_install

if [[ "neofetch | grep "OS"" == 'Red Hat Enterprise Linux Server release 6.9 (Santiago) x86_64' ]]; then
echo "Migration Failed"
else
  echo "Migration Completed, feel free to reboot your machine"
  echo "Reboot the server"
  echo "Verify functionality"
  echo "Delete the VM Snapshot if you took one as part of the backup."
fi
