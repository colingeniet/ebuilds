# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_PN="flite+hts_engine"

DESCRIPTION="HMM based speech synthesis system"
HOMEPAGE="https://sourceforge.net/projects/hts-engine/"
SRC_URI="mirror://sourceforge/hts-engine/${MY_PN}-${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="app-accessibility/hts-engine"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/${MY_PN}-${PV}"

src_configure() {
	econf \
		--with-hts-engine-header-path="${EPREFIX}/usr/include" \
		--with-hts-engine-library-path="${EPREFIX}/usr/lib64"
}
