# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit git-r3

DESCRIPTION="Tool which allows you to compose wallpapers ('root pixmaps') for X"
HOMEPAGE="https://github.com/elbeardmorez/hsetroot"
SRC_URI=""
EGIT_REPO_URI="https://github.com/elbeardmorez/hsetroot.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~ppc ~x86 ~amd64-linux ~x86-linux ~x86-solaris"

RDEPEND="
	>=media-libs/imlib2-1.0.6.2003[X]
	x11-libs/libX11
	x11-apps/xrandr
"
DEPEND="${RDEPEND}
	x11-base/xorg-proto
"
BDEPEND="virtual/pkgconfig"

src_install () {
	mkdir -p "${D}/usr/bin/"
	emake INSTALL_PREFIX="${D}/usr/bin/" install
}
