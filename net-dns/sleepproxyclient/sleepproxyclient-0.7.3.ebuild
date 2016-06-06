EAPI="6"

PYTHON_COMPAT=( python2_7 )

inherit eutils python-single-r1

if [[ ${PV} == "9999" ]] ; then
	inherit git-r3
	EGIT_REPO_URI="git://github.com/awein/SleepProxyClient.git"
else
	MY_PN="SleepProxyClient"
	SRC_URI="https://github.com/awein/${MY_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	S="${WORKDIR}/${MY_PN}-${PV}"
fi

DESCRIPTION="A SleepProxyClient implementation"
HOMEPAGE="https://github.com/awein/SleepProxyClient"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

RDEPEND="
	dev-python/dnspython[${PYTHON_USEDEP}]
	dev-python/netifaces[${PYTHON_USEDEP}]
	net-dns/avahi
	sys-power/upower-pm-utils
"

DOCS=( README.md )
PATCHES=(
	"${FILESDIR}"/${PN}-0.7.3-find-config.patch
	"${FILESDIR}"/${PN}-0.7.3-python27.patch
)

src_install() {
	exeinto /usr/share/${PN}/scripts
	doexe sleepproxyclient.py sleepproxyclient.sh
	use examples && doexe checkSleep.sh

	exeinto /etc/pm/sleep.d
	doexe 00_sleepproxyclient

	insinto /etc
	newins debian/sleepproxyclient.default sleepproxyclient

	einstalldocs
}
