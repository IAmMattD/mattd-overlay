# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit gnome2

DESCRIPTION="Solus Project Artwork"
HOMEPAGE="https://github.com/solus-project/artwork"

MY_PN=${PN/backgrounds/artwork}

if [[ ${PV} == "9999" ]] ; then
    EGIT_REPO_URI="https://github.com/solus-project/artwork.git"
    SRC_URI=""
    KEYWORDS=""
    inherit git-r3 autotools
else
    SRC_URI="https://github.com/solus-project/artwork/releases/download/v${PV}/${PN}-${PV}.tar.xz"
    S="${WORKDIR}/${PN}-${PV}"
    KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-2"
SLOT="0"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"

src_prepare() {
    if [[ ${PV} == "9999" ]] ; then
        eautoreconf
    else
        default_src_prepare
    fi
}
