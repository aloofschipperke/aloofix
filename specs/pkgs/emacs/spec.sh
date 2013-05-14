# This file is part of the Aloofix project.
# Copyright (C) 2013 Kevin Johnson <kjj@aloofschipperke.com>
# Distributed under the terms of the GNU General Public License version 3,
# or (at your option) any later version.

name=emacs
version=24.3
sequence=1
description="GNU Emacs text editor"
site=http://ftp.gnu.org/pub/gnu/$name
depends="emacs-nox emacs-el"
builddepends="ncurses-dev"
section=editors
compression_suffix=xz

license=GPLv3+
license_files=COPYING

doc_pkg_files="$doc_pkg_files
	       usr/share/emacs/${version}/etc/refcards
	       usr/share/emacs/${version}/etc/tutorials"

extra_doc_files="BUGS ChangeLog README"

extra_configure_args="--without-sound --without-gpm --without-x"

preinstall_hook() {
    mv "$preinstalldir"/usr/bin/emacs-$version \
        "$preinstalldir"/usr/bin/emacs-${version}-nox
    mv "$preinstalldir"/usr/share/man/man1/etags.1.gz \
        "$preinstalldir"/usr/share/man/man1/etags.emacs.1.gz
    rm "$preinstalldir"/usr/share/man/man1/ctags.1.gz
    ln -s etags.emacs.1.gz "$preinstalldir"/usr/share/man/man1/ctags.emacs.1.gz
    rm -rf "$preinstalldir"/usr/share/applications
    rm -rf "$preinstalldir"/usr/share/icons
    # possible trademark issues, so let's play it safe
    rm -f "$preinstalldir"/usr/share/emacs/*/lisp/play/tetris.el*
    # no need for game scores on a fresh install
    rm -f "$preinstalldir"/var/games/emacs/*
}

extra_pkgs="common nox el"

nox_description="Minimal Emacs installation without X"
nox_depends="emacs-common ncurses"
nox_pkg_files=usr/bin/emacs-${version}-nox

el_description="Emacs-lisp files for emacs"
el_arch=noarch
el_pkg_files=usr/share/emacs/$version/lisp
el_pkg_excludes="*.elc *.el README README.prev COPYING"

# no leim package defined yet, but let's define the files to make it
# easier to exclude
leim_pkg_files="usr/share/emacs/$version/leim"

# no X package defined yet, but let's define the files to make it
# easier to exclude
x_pkg_files="usr/bin/emacs-${version}-x usr/share/emacs/$version/etc/images"

common_description="Common files for emacs packages"
common_pkg_files="usr/share/emacs usr/bin/emacsclient"
common_pkg_excludes="*.el.gz $leim_pkg_files $x_pkg_files $doc_pkg_files"

base_pkg_files="usr/bin usr/libexec"
base_pkg_excludes="$nox_pkg_files $x_pkg_files usr/bin/emacsclient"

pkg_base_hook() {
    rm "$pkgcontentdir"/usr/bin/emacs
    pkg_file_mv /usr/bin/ctags /usr/bin/ctags.emacs
    pkg_file_mv /usr/bin/etags /usr/bin/etags.emacs
    register_alternative /usr/bin/ctags ctags.emacs 10
    register_alternative /usr/bin/etags etags.emacs 10
}

pkg_common_hook() {
    echo '(setq dired-use-ls-dired nil)' \
        >>"$pkgcontentdir"/usr/share/emacs/site-lisp/site-start.el
}

pkg_nox_hook() {
    register_alternative /usr/bin/emacs emacs-${version}-nox 100
}
