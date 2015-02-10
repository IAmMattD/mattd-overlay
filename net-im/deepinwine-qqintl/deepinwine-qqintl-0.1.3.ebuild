# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils

DESCRIPTION="Tencent QQ for Linux by Deepin"
HOMEPAGE="http://www.linuxdeepin.com/"
SRC_URI="http://packages.linuxdeepin.com/deepin/pool/non-free/d/deepinwine-qqintl/wine-qqintl_${PV}-2_i386.deb"

LICENSE="Tencent"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="system-wine"

RDEPEND="
	amd64? (
		|| (
			 x11-libs/gtk+:2[abi_x86_32]
			 app-emulation/emul-linux-x86-gtklibs 
		)
	)

	x86? (  x11-libs/gtk+:2  )

	system-wine? (
		>=app-emulation/wine-1.7.16[abi_x86_32,-abi_x86_x32,-abi_x86_64,fontconfig,mp3,truetype,X,nls,xml]
	)
"

RESTRICT="mirror strip"

QA_PRESTRIPPED="usr/share/deepinwine/qqintl/wine-qqintl"

S=$WORKDIR

src_install() {
	tar xzvf data.tar.gz -C ${D}/	

	chmod 755 ${D}/usr
	chown -R root:root ${D}

	if use system-wine ; then
		rm ${D}/usr/share/deepinwine/qqintl/wine/bin -rf
		ln -svf /usr/bin  ${D}/usr/share/deepinwine/qqintl/wine/bin
		rm -rf ${D}/usr/share/deepinwine/qqintl/wine/lib
	fi
}

pkg_postinst() {
	elog
	elog "Please report bugs to Deepin."
	elog
}
