#!/bin/sh

rm -rf /tmp/builddir2

LIBRARY_PATH="/usr/local/lib" \
PKG_CONFIG_PATH="/usr/local/lib/pkgconfig" \
C_INCLUDE_PATH="/usr/local/include" \
CFLAGS="-I/usr/local/include -DWATT32_NO_NAMESPACE" \
CXXFLAGS="-I/usr/local/include -DWATT32_NO_NAMESPACE" \
LDFLAGS="-L/usr/local/lib" \
meson setup /tmp/builddir2 --cross-file cross/linux-djgpp.txt \
-D88-colors=false \
-D256-colors=false \
-Dbacktrace=false \
-Dbittorrent=false \
-Dbrotli=true \
-Dbzlib=true \
-Dcgi=false \
-Dcss=true \
-Dcombining=false \
-Ddgi=true \
-Dexmode=true \
-Dfastmem=true \
-Dfsp=false \
-Dfsp2=true \
-Dgemini=true \
-Dgettext=false \
-Dgnutls=false \
-Dgopher=true \
-Dgpm=false \
-Dguile=false \
-Didn=true \
-Dipv6=true \
-Dlibcss=true \
-Dlibcurl=false \
-Dlibev=false \
-Dlibevent=false \
-Dluapkg='lua' \
-Dlzma=true \
-Dmailcap=false \
-Dmouse=true \
-Dnls=true \
-Dnntp=true \
-Dopenssl=true \
-Dperl=false \
-Dprefix=$HOME \
-Dpython=false \
-Dquickjs=true \
-Druby=false \
-Dsm-scripting=false \
-Dspidermonkey=false \
-Dstatic=true \
-Dterminfo=false \
-Dtest=false \
-Dtre=false \
-Dtrue-color=false \
-Dutf-8=false \
-Dwithdebug=false \
-Dx=false \
-Dxbel=true \
-Dzlib=true \
-Dzstd=false \

meson compile -C /tmp/builddir2

i586-pc-msdosdjgpp-strip /tmp/builddir2/src/elinks.exe

upx /tmp/builddir2/src/elinks.exe
