# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

DESCRIPTION="Head tracker for games and flight simulations"
HOMEPAGE="https://github.com/opentrack/opentrack/"
SRC_URI="https://github.com/opentrack/opentrack/archive/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="wine"

DEPEND="
	dev-qt/qtcore
	media-libs/opencv
	wine? ( virtual/wine )"
RDEPEND="${DEPEND}"
BDEPEND="
	>=dev-util/cmake-3.10.3
"

# The archive unpacks in opentrack-opentrack-<version> ...
S="${WORKDIR}/opentrack-${P}"

PATCHES=(
	"${FILESDIR}/${P}-i18n.patch"
)

src_configure() {
	local mycmakeargs=(
	)
	if use wine; then
		mycmakeargs+=(-DSDK_WINE_PREFIX=/usr/)
	fi
	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install

	insinto "/usr/share/applications"
	doins "${FILESDIR}/${PN}.desktop"
}
