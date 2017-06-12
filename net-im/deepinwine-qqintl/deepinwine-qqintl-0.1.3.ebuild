# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit eutils

DESCRIPTION="Tencent QQ for Linux by Deepin"
HOMEPAGE="http://www.imqq.com"
SRC_URI="mirror://sourceforge/deepinwine-qqintl/wine-qqintl_0.1.3-2_i386.deb"

LICENSE="Tencent"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="system-wine"

RDEPEND="amd64? (
		media-libs/alsa-lib[abi_x86_32]
		media-libs/lcms[abi_x86_32]
		media-libs/libpng:1.2[abi_x86_32]
		media-plugins/alsa-plugins[abi_x86_32]
		media-sound/mpg123[abi_x86_32]
		media-sound/pulseaudio[abi_x86_32]
		net-print/cups[abi_x86_32]
		sys-libs/ncurses[abi_x86_32]
		x11-libs/gtk+:2[abi_x86_32]
	)

	x86? (
		media-libs/alsa-lib
                media-libs/lcms
               	media-libs/libpng:1.2
                media-plugins/alsa-plugins
               	media-sound/mpg123
                media-sound/pulseaudio
                net-print/cups
                sys-libs/ncurses
		x11-libs/gtk+:2
	)

	system-wine? (
		>=app-emulation/wine-1.7.16[abi_x86_32,-abi_x86_x32,-abi_x86_64,fontconfig,mp3,truetype,X,nls,xml]
	)"

RESTRICT="mirror strip"

S=$WORKDIR

src_install() {
	tar xzvf data.tar.gz -C ${D}
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
