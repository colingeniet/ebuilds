# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 )

inherit git-r3 cmake-utils
CMAKE_BUILD_TYPE="Release"

DESCRIPTION="A joystick testing and configuration tool for Linux"
HOMEPAGE="http://http://pingus.seul.org/~grumbel/jstest-gtk/"
EGIT_REPO_URI="https://github.com/Grumbel/jstest-gtk.git"
KEYWORDS=""

LICENSE="GPL-3"
SLOT="0"

RDEPEND="dev-libs/libsigc++:*
	dev-cpp/gtkmm:*"
DEPEND="${RDEPEND}
	dev-util/cmake"

src_configure() {
	cmake-utils_src_configure
}

src_install() {
	dobin "${CMAKE_BUILD_DIR}"/${PN}
	insinto /usr/share/${PN}
	doins -r "${S}"/data

	doicon "${S}"/data/generic.png

	make_desktop_entry "${PN}" "${PN}" "generic" "Utility" "Path=/usr/share/${PN}"

}
