###############################################################################
# common variables across the various scripts for building Aloofix
###############################################################################

arch=i686
distroname=Aloofix
distroversion=0.9
distroversionname="Awake from a coma"
timezone="America/Denver"
maintainer='Kevin Johnson <kjj@aloofschipperke.com>'

export TMPDIR=/var/tmp

c_optim="-O2"

users="man 20 man 20 /bin/sh Man
mail 21 mail 21 /bin/false Email
dns 23 dns 23 /bin/false DNS
web 24 web 24 /bin/false Web
sudo - sudo 200 - -
distcc 201 distcc 201 /bin/false DistCC
tcpdump 201 tcpdump 201 /bin/false Tcpdump
build 999 build 999 /bin/sh Build
"

devicelist="console 0600 c 5 1
null 0777 c 1 3
zero 0777 c 1 5
urandom 0666 c 1 9
ram0 0640 b 1 0
"

imagetrees="$top/build/imagetrees"
logtree="$top/build/logs"
pkgtrees="$top/build/pkgtrees"
preinstalltree="$top/build/preinstall"
srctree="$top/build/src"
statusdir="$top/build/status"
tarballdir="$top/build/tarballs"
pkgstree="$top/pkgs"
imagedir="$top/images"

spectree="$top/specs/pkgs"
imagespectree="$top/specs/images"

###############################################################################
user_info() { echo "$users" | grep -w "^$1"; }

no_sigs() { checksigs= ; }

###############################################################################
