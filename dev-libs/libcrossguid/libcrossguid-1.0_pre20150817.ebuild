EAPI="5"

inherit git-r3 toolchain-funcs

MY_PV="1.0_pre20150817"
EGIT_REPO_URI="git://github.com/graeme-hill/crossguid.git"

if [[ ${PV} ==  ${MY_PV} ]] ; then
	EGIT_COMMIT="8f399e8bd4"
fi

DESCRIPTION="Lightweight cross platform C++ GUID/UUID library"
HOMEPAGE="https://github.com/graeme-hill/crossguid"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

src_compile() {
	$(tc-getCXX) \
		${CXXFLAGS} ${CFLAGS} ${LDFLAGS} \
		-std=c++11 \
		-c guid.cpp -o guid.o \
		-DGUID_LIBUUID \
		|| die

	$(tc-getAR) \
		rvs \
		libcrossguid.a guid.o \
		|| die
}

src_install() {
	insinto /usr/include
	doins "${S}"/guid.h || die
	dolib.a "${S}"/libcrossguid.a || die
}
