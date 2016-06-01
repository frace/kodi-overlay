EAPI="5"

inherit eutils

DESCRIPTION="A SleepProxyClient implementation"
HOMEPAGE="https://github.com/awein/SleepProxyClient"

MY_PN="SleepProxyClient"
SRC_URI="https://github.com/awein/${MY_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${MY_PN}-${PV}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

RDEPEND="
	dev-python/dnspython:py2
	dev-python/netifaces
	net-dns/avahi
	sys-power/upower-pm-utils
"

src_prepare() {
	epatch "${FILESDIR}"/${P}-find-config.patch
	epatch "${FILESDIR}"/${P}-python27.patch
}

src_install() {
	exeinto /usr/share/${PN}/scripts
	doexe sleepproxyclient.py sleepproxyclient.sh
	use examples && doexe checkSleep.sh

	exeinto /etc/pm/sleep.d
	doexe 00_sleepproxyclient

	insinto /etc
	newins debian/sleepproxyclient.default sleepproxyclient

	dodoc README.md
}
