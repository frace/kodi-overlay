EAPI=5
inherit user

DESCRIPTION="Monitoring daemon serving statistics to your iStat iPhone application"
HOMEPAGE="https://github.com/tiwilliam/istatd"
SRC_URI="mirror://github/tiwilliam/istatd/istatd-0.5.7.tar.gz"

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

	dodir /var/cache/${PN} || die
	dodir /run/${PN} || die

	fowners istatd:istatd /var/cache/${PN} || die
	fowners istatd:istatd /run/${PN} || die

	newinitd "${FILESDIR}/istatd-init" ${PN} || die
	newconfd "${FILESDIR}/istatd-conf" ${PN} || die

	dodoc AUTHORS.txt DEVELOPERS.txt CHANGELOG.txt README.txt || die
}
