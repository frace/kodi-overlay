# What is kodi-overlay?
kodi-overlay is a [portage][external-portage] overlay for [Gentoo Linux][external-gentoo]
which provides modified and unofficial ebuilds for a [KODI][external-kodi] appliance.


## Get it!
There are two easy ways to get the overlay onto your system:


### 1. Git
1. `emerge -av git`
2. `mkdir /usr/local/portage`
3. `cd /usr/local/portage`
4. `git clone git://github.com/frace/kodi-overlay.git`
5. Modify `/etc/make.conf`:

        PORTDIR_OVERLAY="/usr/local/portage/kodi-overlay/"


### 2. Layman
If you don't know what `layman` is then please read the [documentation][docs-layman] first.

1. `emerge -av layman`
2. Modify `/etc/layman/layman.cfg`:

        overlays  : http://www.gentoo.org/proj/en/overlays/repositories.xml
                    https://raw.github.com/frace/kodi-overlay/master/repositories.xml

3. `layman --list`
4. `layman --add kodi-overlay`

[docs-layman]: http://www.gentoo.org/proj/en/overlays/userguide.xml


## Available ebuilds
        [M] app-admin/istatd-0.5.7
            net-libs/libshairplay-1.0_pre20130416
            media-plugins/kodi-addon-pvr-14.0_rc3
            media-plugins/kodi-addon-pvr-9999
            media-tv/kodi-14.0
            media-tv/kodi-9999

Masked [M] ebuilds are unmaintained and are not in sync with possible upstream ebuilds.


## Bugs
You are welcome to report bugs at the [project bugtracker][project-bugtracker] at github.com.
If you create a [KODI][external-kodi] related pull request then please make sure to report the
issue also at the official [Gentoo Linux bugtracker][gentoo-bugtracker] and reference it here
since we want to stay in sync as much as possible with the official ebuild. Finally our goal is
to help to improve the official [KODI][external-kodi] ebuild and to help to fix bugs.

[project-bugtracker]: https://github.com/frace/kodi-overlay/issues
[gentoo-bugtracker]: https://bugs.gentoo.org/


* * *
### Gentoo docs
- [Portage man pages][docs-gentoo-portage]
- [make.conf man pages][docs-gentoo-makeconf]
- [Gentoo dev manual][docs-devmanual]
- [Ebuild writing][docs-devmanual-ebuild]
- [Ebuild file format][docs-devmanual-ebuild-format]
- [Gentoo color palette][docs-gentoo-colors]

[docs-devmanual]: https://devmanual.gentoo.org
[docs-devmanual-ebuild]: https://devmanual.gentoo.org/ebuild-writing
[docs-devmanual-ebuild-format]: https://devmanual.gentoo.org/ebuild-writing/file-format
[docs-gentoo-colors]: https://www.gentoo.org/proj/en/desktop/artwork/colors.xml
[docs-gentoo-portage]: http://dev.gentoo.org/~zmedico/portage/doc/man/portage.5.html
[docs-gentoo-makeconf]: http://dev.gentoo.org/~zmedico/portage/doc/man/make.conf.5.html

### KODI docs
- [KODI@Gentoo Linux Wiki][docs-gentoo-wiki]
- [KODI Wiki Manual][docs-kodi-wiki]

[docs-gentoo-wiki]: http://wiki.gentoo.org/wiki/Kodi
[docs-kodi-wiki]: http://kodi.wiki


* * *
### Credits
- [Contributors][contrib-people]
- [Gentoo Linux][external-gentoo]
- [KODI Media Player][external-kodi]

[contrib-people]: https://github.com/frace/kodi-overlay/graphs/contributors


[external-gentoo]: http://www.gentoo.org
[external-kodi]: http://kodi.tv
[external-portage]: http://wiki.gentoo.org/wiki/Project:Portage
