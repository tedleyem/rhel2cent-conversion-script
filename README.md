Note: packages like DUO 2FA or Elasticsearch
are specific to distribution it is using so
they should be removed in the packages task of this playbook.



## CONVERSION THERAPY ##

[CentOS Official Migration GUide](https://wiki.centos.org/HowTos/MigrationGuide)

At my job there is a large set of critical Redhat Enterprise Linux (RHEL) 5 and 6 servers that need to be changed to CentOS servers to save on licensing costs.

This application is used to help mitigate that conversion and check to clean all Red Hat brandings on system and add the respective CentOS and EPEL repos/packages.

#inspired by [The Picky Sysadmin](https://www.pickysysadmin.ca/2014/04/27/how-to-convert-rhel-5-x-to-centos-5-x/)



The CentOS Linux distribution is a stable, predictable, manageable and reproducible platform derived from the sources of Red Hat Enterprise Linux (RHEL). Since March 2004, CentOS Linux has been a community-supported distribution derived from sources freely provided to the public by Red Hat. As such, CentOS Linux aims to be functionally compatible with RHEL. We mainly change packages to remove upstream vendor branding and artwork.


## Installation and Testing

### Git

1. Clone or download the project files (**no compilation nor installation** is required) ;

        git clone https://github.com/tmeralus/RHEL2CENT-stripper.git

2. Testing System:

        cd rhel2cent-conversion-script/scripts &&  ./striptease

Running the striptease first will check the OS before running the full conversion and suggest changes to be made if needed.

2. Execute:

      cd rhel2cent-conversion-script/scripts && ./rhelstripper
