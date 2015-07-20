# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils

DESCRIPTION="Thunder for Linux by Deepin"
HOMEPAGE="http://www.linuxdeepin.com/"
SRC_URI="http://packages.linuxdeepin.com/deepin/pool/non-free/d/deepinwine-thunder5/deepinwine-thunder5_${PV}_all.deb"

LICENSE="Thunder"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	amd64? (
		|| (
			 x11-libs/gtk+:2[abi_x86_32]
			 app-emulation/emul-linux-x86-gtklibs
                         app-emulation/wine
		)
	)

	x86? (  
             x11-libs/gtk+:2
             app-emulation/wine
        )
"

RESTRICT="mirror strip"

S=$WORKDIR

src_install() {
	tar xzvf data.tar.gz -C ${D}/	

	chmod 755 ${D}/usr
	chown -R root:root ${D}
}

pkg_postinst() {
	elog
	elog "Please report bugs to Deepin."
	elog
}
