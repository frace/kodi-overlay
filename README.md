xbmc-overlay
============
A Gentoo overlay which provides modified and unofficial ebuilds
for a XBMC appliance/set-top-box/htpc.

Available ebuilds
=================
xbmc-overlay
│
├── app-admin
│   └── istatd
│       └── istatd-0.5.7.ebuild
├── media-plugins
│   ├── xbmc-addon-libshairplay
│   │   └── xbmc-addon-libshairplay-1.0_pre20130416.ebuild
│   └── xbmc-addon-libshairport
│       └── xbmc-addon-libshairport-1.2.0.20310_pre20130221.ebuild
├── media-tv
│   └── xbmc
│       └── xbmc-9999.ebuild
├── net-fs
│   └── afpfs-ng
│       └── afpfs-ng-0.8.1.ebuild
└── sys-apps
    └── qingy
        └── qingy-1.0.0.ebuild

ToDo
====
- Add an ebuild for a patched («quietboot») version of syslinux
- Add an ebuild for XBMC fbsplash themes in media-gfx/

Links
=====
- [Gentoo dev manual][0]
- [Ebuild writing][1]
- [Ebuild file format][2]

[0]:http://devmanual.gentoo.org/
[1]:http://devmanual.gentoo.org/ebuild-writing/
[2]:http://devmanual.gentoo.org/ebuild-writing/file-format/
