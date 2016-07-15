# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils

DESCRIPTION="Skype for Linux WebRTC"
HOMEPAGE="https://www.skype.com"
SRC_URI="https://go.skype.com/${PN}-64-alpha.deb"

LICENSE="Microsoft"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="dev-libs/nss
	gnome-base/gconf
	gnome-base/libgnome-keyring
	media-libs/alsa-lib
	x11-libs/gtk+:2
	x11-libs/libXtst
	x11-misc/xscreensaver"

S=$WORKDIR

src_install() {
	tar xvf data.tar.xz -C ${D}
	insinto "/usr/share/licenses/${PN}"
}
