# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit games

DESCRIPTION="Core data for vcmi"
HOMEPAGE="http://vcmi.eu"
MY_P="core"
SRC_URI="
	http://download.vcmi.eu/core.zip
	http://download.vcmi.eu/WoG/wog.zip
"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="app-arch/unzip"
RDEPEND=""

S="${WORKDIR}"

src_install() {
	insinto "${GAMES_DATADIR}/${PN%-data}"
	rm -rf Mods/vcmi/Data/s
	doins -r *
}

pkg_postinst() {
	elog "In order to play VCMI you must install:"
	elog "- Heroes III: Shadow of Death or Complete edition;"
	elog "- Unnoficial WoG addon;"
	elog "- VCMI data files."
	elog "Use vcmibuilder tool for automated install of data files;"
	elog "Additional information can be found in VCMI wiki:"
	elog "http://wiki.vcmi.eu/index.php?title=Installation_on_Linux#Installing_Heroes_III_data_files"
}

