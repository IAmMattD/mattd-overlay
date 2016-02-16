# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit gnome2 autotools

DESCRIPTION="Evolve OS's Simple Media Player"
HOMEPAGE="http://ikeydoherty.github.io/budgie/"

if [[ ${PV} == "9999" ]] ; then
    EGIT_REPO_URI="https://github.com/evolve-os/${PN}.git"
    SRC_URI=""
    KEYWORDS=""
    inherit git-r3
else
    SRC_URI="https://github.com/evolve-os/${PN}/archive/v${PV}.tar.gz"
    KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND="
	>=dev-libs/glib-2.40.0:2
	>=media-libs/gstreamer-1.0.10:1.0
	>=media-libs/gst-plugins-base-1.0.1:1.0
	media-libs/id3lib
	>=x11-libs/gtk+-3.12.0:3
	"

if [[ ${PV} == "9999" ]] ; then
    RDEPEND="${RDEPEND}
        gnome-base/gnome-common:3"
fi

DEPEND="${RDEPEND}
    sys-libs/gdbm
    virtual/pkgconfig"

src_unpack() {
    if [[ ${PV} == "9999" ]] ; then
        git-r3_src_unpack
    else
        default_src_unpack
    fi
}

src_prepare() {
    eautoreconf
}

