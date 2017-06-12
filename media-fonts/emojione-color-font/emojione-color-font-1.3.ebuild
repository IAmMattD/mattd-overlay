# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit eutils font

DESCRIPTION="A color and B&W emoji SVG-in-OpenType font"
HOMEPAGE="https://github.com/eosrei/emojione-color-font"
SRC_URI="https://github.com/eosrei/emojione-color-font/releases/download/v${PV//_/-}/EmojiOneColor-SVGinOT-Linux-${PV//_/-}.tar.gz"
KEYWORDS="~*"
S="${WORKDIR}"
RESTRICT="mirror"
LICENSE="MIT"
SLOT="0"
IUSE="X"

DEPEND="media-fonts/ttf-bitstream-vera[X?]"
RDEPEND="${DEPEND}"

FONT_SUFFIX="ttf"
DOCS="README.md"
FONT_CONF=( fontconfig/56-${PN}.conf )

S=$WORKDIR/EmojiOneColor-SVGinOT-Linux-${PV}

src_install(){
	insinto ${EPREFIX}/usr/share/licenses/${PN}
	font_src_install
}
