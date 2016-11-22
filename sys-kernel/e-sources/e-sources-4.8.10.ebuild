# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"
K_DEBLOB_AVAILABLE="0"
K_KDBUS_AVAILABLE="1"


ck_version="1"
gentoo_version="11"
#tuxonice_version="2015.10.30"
#uksm_version=""

aufs_kernel_version="4.8_p20161010"
cjktty_kernel_version="4.4"
reiser4_kernel_version="4.8.0"
#tuxonice_kernel_version="4.2.5"
#uksm_kernel_version=""

KEYWORDS="~amd64 ~x86 ~mips"

SUPPORTED_USE="+additional aufs cjktty +ck +experimental +gentoo +reiser4 +thinkpad"
UNSUPPORTED_USE="uksm tuxonice"

UNIPATCH_EXCLUDE=""

OVERRIDE_AUFS_PATCHES=""
OVERRIDE_CJKTTY_PATCHES=""
OVERRIDE_CK_PATCHES=""
OVERRIDE_REISER4_PATCHES=""
OVERRIDE_TUXONICE_PATCHES=""
OVERRIDE_UKSM_PATCHES=""

inherit e-sources
