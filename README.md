Ayras Desktop
=============
This is the official source tree for the Ayras desktop environment. A fork of the Lumina desktop environment specifically designed for the needs of the Potabi Systems project. As development continues, Lumina and Ayras would be completely seperate. Ayras will be working on an ImGui-based reimplementation (https://github.com/ocornut/imgui) that may release in Potabi Systems 2.0 Fenn.

Please browse this website for documentation: 
https://lumina-desktop.org/

For download and installation instructions, screenshots, and more (documentation coming soon):
https://ayras.potabi.com/

**Community Chat Channels:**
- Github Discussions: https://github.com/Potabi/ayras/discussions
- Discord: https://discord.com/invite/8s8nNwndtF

**Ayras README.md: Table of Contents**

- [Description](#description)
- [Operating Systems and Distributions](#osdistros)
- [Latest Versions](#latestversions)
- [Translations](#translations)
- [How to file bug reports or feature requests](#filebugs)
- [How to build from source](#buildfromsource)

---

Description <a name="description"></a>
=====

Ayras is a lightweight desktop envionment for any Unix-like operating systems. Ayras is a fork of the Lumina desktop environment, which has a plugin-based approach - allowing users to rearrange and reassemble the desktop environment to taste. Ayras is a fork which aims to support Potabi, and later aiming to replace all of Lumina's original Qt code with the ImGui graphical toolkit, in order to fully remove any and all GPL and other copyleft licensed-software.

![](https://github.com/lumina-desktop/lumina-themes/blob/master/artwork/screenshots/Screenshot-2021-10-02-15-55-58.png)
Operating Systems and Distributions <a name="osdistros"></a>
----
Being a fork of Lumina, Ayras has unofficial support for many operating systems, including ones that may have it pre-installed. Aryas is only officially supported for the CoreNGS and Potabi Systems platforms, as they are why Ayras is designed and built.

Unofficially supported operating systems include (but are not limited to):
 * BSD: TrueOS, FreeBSD, OpenBSD, NetBSD, DragonflyBSD, GNU/kFreeBSD
 * Linux: Void, Gentoo, Debian, "Generic" Linux (including Arch, Ubuntu, and more)

Latest Versions <a name="latestversions"></a>
----
Click [HERE](https://github.com/lumina-desktop/lumina/releases) to see all the available releases for the Lumina Desktop.

Click [HERE](https://github.com/lumina-desktop/lumina/branches) to see all the available branches of the Lumina Desktop source tree (includes development versions: X.Y.(Z > 0)).
The master branch is where all development is performed and tested before the next version is tagged. Additionally, every version (development **and** release) of the project gets branched off of master at the time the version is tagged, so older versions may be fetched/patched/used as desired.

Occasionally there may be patches committed for particular versions which are not included in the static "release" archives. On the release page these can be identified by a note stating the release is a number of commits behind it's corresponding branch. In this situation, it may be preferable to fetch/use the corresponding branch of the source tree rather than the static archive if the patch(es) which were committed impact your particular operating system.

Translations <a name="translations"></a>
----
With Ayras being based on Lumina, it should be mostly functional with localization files. This is not confirmed, and as development continues, may break non-english translations. If you wish to help translations, join the discord listed above.

### For Lumina:
**Legacy Versions (1.0.0 and older)**

All the translation files for Lumina are available through the trueos/lumina-i18n repository (Qt5+ only). Please follow the directions in that repository for installing localization files.

**Version 1.1.0+**

All the translations for Lumina are contained within this repository directly (the i18n/ subdirectories within each project source tree). To include these translation files, the `WITH_I18N` build flag must be set at compilation time, in which case the translation files will automatically get synced/built alongside the corresponding binaries.

To submit translations, please edit those i18n/*.ts translation files and submit a pull request to this repository.

How to file bug reports or feature requests <a name="filebugs"></a>
----
Please create a ticket through the [GitHub issues tracker](https://github.com/potabi/ayras/issues) on this repository. Similarly, if you want to send in patches or other source contributions, please send in a GitHub pull request so that it can get reviewed/committed as quickly as possible.


How to build from source <a name="buildfromsource"></a>
----
1) Checkout the source repo to your local box (GitHub gives a few methods for this)

Examples:
* To checkout the master branch of the repo, run `git clone https://github.com/potabi/ayras` to create an "ayras" directory with a local copy of the source tree.
* To update an exising checkout of the Lumina repo, run "git pull" while within your local copy of the source tree. 

2) In a terminal, change to the lumina repo directory (base dir, not one of the sub-projects)

3) Run "qmake" on your local system to turn all the Qt project files (*.pro) into Makefiles
 * NOTE 1: The Qt5 version of qmake is located in /usr/local/lib/qt5/bin/qmake on FreeBSD, other OS's may have slightly different locations or names for qmake (such as qmake-qt5 for example)
 * NOTE 2: Check the terminal output of the qmake command to ensure that your OS build settings were loaded properly. Here is an example:

> Project MESSAGE: Build OS Info: FreeBSD, amd64, FreeBSD 10.2-RELEASE-p11 #0: Thu Jan 14 15:48:17 UTC 2016 root@amd64-builder.pcbsd.org:/usr/obj/usr/src/sys/GENERIC

> Project MESSAGE: Build Settings Loaded: FreeBSD

 * Build Note: Compile-time options may be set at this time using qmake. This is typically not needed unless you are setting up Lumina for automated build/packaging. If the automatically-detected build settings for your particular OS are invalid or need adjustment, please update the "OS-detect.pri" file as needed and send in your changes so that it can be corrected for future builds.
  * PREFIX: Determines the base directory used to install/run Lumina ("/usr/local" by default)
	Example: `qmake PREFIX=/usr/local`
  * LIBPREFIX: Determines the location to install the Lumina library ("PREFIX/lib" by default)
	Example: `qmake LIBPREFIX=/usr/local/lib`
  * DESTDIR: An optional directory where the compiled files will be placed temporary (such as for packaging/distributing via some other system).
	Example: `qmake DESTDIR=/my/build/dir`
  * DEFAULT_SETTINGS: An optional flag to install the default settings/wallpaper for some other operating system (Note: Make sure the OS name is capitalized appropriately!)
	Example: `qmake DEFAULT_SETTINGS=TrueOS`
  * WITH_I18N: Generate/install the translation files. (Note: For versions prior to 1.1.0, do *not* use this flag! The localization files for versions up through 1.0.0 are available in the lumina-i18n repository instead).
	Example: `qmake CONFIG+=WITH_I18N`
  * debug: (not recommended for release builds) Do not strip all the debugging information out of the binaries (useful for performing backtraces on builds that crash or for other development tests)
	Example: `qmake CONFIG+=debug`

4) Run "make" to compile all the Lumina projects (can be done as user)

5) Run "make install" to install the Lumina desktop on your local system (requires admin/root privileges usually)

6-optional) Run "make distclean" to clean up all the build files in the Lumina source tree. (go back to step 3 later)

NOTE: The Lumina project is naturally broken down into a number of individual "sub-projects" which are designed to be built and packaged individually. These sub-projects all use the same overall dependencies, but might have differing library/runtime dependencies or even an alternate minimum-supported version of Qt.
The sub-projects are broken down as follows:
 * [lumina-core](https://github.com/lumina-desktop/lumina/tree/master/src-qt5/core): The core of the project (desktop itself)
 * [lumina-coreutils](https://github.com/lumina-desktop/lumina/tree/master/src-qt5/core-utils): The core utilities for configuring/managing the desktop
 * [desktop-utilities](https://github.com/lumina-desktop/lumina/tree/master/src-qt5/desktop-utils): Various support utilities for desktop systems. Every one of these utilities should be independently packaged.

The desktop utilities are gradually getting migrated out into their own repositories under the lumina-desktop github organization as well. These repositories are open for individual versioning and updates if an individual would like to "adopt" these utilities and develop them independantly of the release schedule for the desktop components themselves.
