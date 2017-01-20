EAPI="6"

inherit autotools

if [[ ${PV} == "9999" ]] ; then
	inherit git-r3
	EGIT_REPO_URI="git://github.com/bjango/istatserverlinux.git"
else
	SRC_URI="https://s3.amazonaws.com/bjango/files/istatserverlinux/istatserver-3.01.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

DESCRIPTION="A system monitoring daemon"
HOMEPAGE="https://bjango.com/istatserver/"
LICENSE="GPL-2"

SLOT="0"
IUSE="lm_sensors +sqlite zeroconf"

DEPEND="
	sqlite? ( dev-db/sqlite )
	dev-libs/libxml2
	dev-libs/openssl
"

RDEPEND="${DEPEND}
	zeroconf? ( net-dns/avahi )
	lm_sensors? ( >=sys-apps/lm_sensors-3.4.0 )
"

pkg_setup() {
	return
}

src_configure() {
		econf \
			$(use_with sqlite no-sqlite) \
			$(use_with zeroconf no-avahi)
}

src_install() {
	default
}
