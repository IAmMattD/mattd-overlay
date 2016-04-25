# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils

DESCRIPTION="Multiplatform Visual Studio Code from Microsoft"
HOMEPAGE="https://code.visualstudio.com"
SRC_URI="
	x86? ( https://az764295.vo.msecnd.net/stable/fa6d0f03813dfb9df4589c30121e9fcffa8a8ec8/VSCode-linux-ia32-stable.zip -> ${P}-x86.zip )
	amd64? ( https://az764295.vo.msecnd.net/stable/fa6d0f03813dfb9df4589c30121e9fcffa8a8ec8/VSCode-linux-x64-stable.zip -> ${P}-amd64.zip )
	"
RESTRICT="mirror"

LICENSE="Microsoft"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="
	gnome-base/gconf
	>=media-libs/libpng-1.2.46
	x11-libs/cairo
	>=x11-libs/gtk+-2.24.8-r1:2
	"

RDEPEND="${DEPEND}"

ARCH="$(uname -m)"

if [[ $ARCH == "x86_64" ]];then
	S="${WORKDIR}/VSCode-linux-x64"
else
	S="${WORKDIR}/VSCode-linux-ia32"
fi


src_install(){
	insinto "/opt/${PN}"
	doins -r *
	dosym "/opt/${PN}/code" "/usr/bin/visual-studio-code"
	insinto "/usr/share/applications"
	doins ${FILESDIR}/${PN}.desktop
	insinto "/usr/share/pixmaps"
	doins ${FILESDIR}/${PN}.png
	fperms +x "/opt/${PN}/code"
	fperms +x "/opt/${PN}/libgcrypt.so.11"
	fperms +x "/opt/${PN}/libnode.so"
	fperms +x "/opt/${PN}/libnotify.so.4"
	insinto "/usr/share/licenses/${PN}"
	newins "resources/app/LICENSE.txt" "LICENSE"
}

pkg_postinst(){
	elog "You may install some additional utils, so check them in:"
	elog "https://code.visualstudio.com/Docs/setup#_additional-tools"
}
