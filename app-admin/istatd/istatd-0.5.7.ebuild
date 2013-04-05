# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit user

DESCRIPTION="Monitoring daemon serving statistics to your iStat iPhone application"
HOMEPAGE="http://bjango.com/apps/istat/"
SRC_URI="http://github.com/downloads/tiwilliam/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="qnaptemp"

DEPEND="dev-libs/libxml2"
RDEPEND="${DEPEND}"

pkg_setup() {
	enewgroup istatd
	enewuser istatd -1 -1 -1 "istatd"
}

src_configure() {
	econf $(use_with qnaptemp)
}

src_install() {
	emake DESTDIR="${D}" install || die "Install failed"

	dodir /var/{run,cache}/${PN} || die
	fowners istatd:istatd /var/{run,cache}/${PN} || die

	newinitd "${FILESDIR}/istatd-init" ${PN} || die
	newconfd "${FILESDIR}/istatd-conf" ${PN} || die

	dodoc AUTHORS.txt DEVELOPERS.txt CHANGELOG.txt README.txt || die
}
