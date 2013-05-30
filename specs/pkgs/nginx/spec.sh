# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=nginx
version=1.4.1
sequence=1
description="HTTP and reverse proxy server"
compression_suffix=gz
site=http://nginx.org/download/
depends="zlib-lib pcre-lib openssl-lib user-web"
builddepends="zlib-dev pcre-dev openssl-dev"
section=web

user=web
group=web

license=BSD-2-Clause
license_files=LICENSE

extra_doc_files=CHANGES

configure_args="--prefix=/usr
	--sbin-path=/usr/sbin/nginx
	--conf-path=/etc/nginx/nginx.conf
	--pid-path=/var/run/nginx.pid
	--lock-path=/var/lock/nginx.lock
	--http-log-path=/var/log/nginx/access.log
	--error-log-path=/var/log/nginx/error.log
	--http-client-body-temp-path=/home/$user/tmp/client-body
	--http-proxy-temp-path=/home/$user/tmp/proxy
	--http-fastcgi-temp-path=/home/$user/tmp/fastcgi
	--http-scgi-temp-path=/home/$user/tmp/scgi
	--http-uwsgi-temp-path=/home/$user/tmp/uwsgi
"

extra_configure_args="
	--user=$user
	--group=$group
	--with-ipv6
	--with-file-aio
	--with-http_ssl_module
	--with-http_gunzip_module
	--with-http_gzip_static_module
	--with-http_stub_status_module
"

configure() {
    CFLAGS="$cflags" ./configure $configure_args $extra_configure_args
}

install_target=install

preinstall_hook() {
    install -d -m 0755 "$preinstalldir/srv/www"
    mv "$preinstalldir"/usr/html/* "$preinstalldir/srv/www"
    rm -rf "$preinstalldir/usr/html"
    rm -rf "$preinstalldir"/etc/nginx/*.default
}

pkg_base_hook() {
    mkdir -p "$pkgcontentdir/home/$user/tmp"
    register_conffile /etc/nginx/mime.types
    register_conffile /etc/nginx/uwsgi_params
    register_conffile /etc/nginx/fastcgi.conf
    register_conffile /etc/nginx/nginx.conf
    register_conffile /etc/nginx/koi-win
    register_conffile /etc/nginx/koi-utf
    register_conffile /etc/nginx/win-utf
    register_conffile /etc/nginx/fastcgi_params
    register_conffile /etc/nginx/scgi_params
    register_conffile /srv/www/index.html
    register_conffile /srv/www/50x.html
    sed -i -e 's@root \+html;@root /srv/www;@' \
	"$pkgcontentdir/etc/nginx/nginx.conf"
}
