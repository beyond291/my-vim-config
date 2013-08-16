#!/usr/bin/awk -f
BEGIN {
    include_num=split("./arch/arm/mach-omap2,./arch/arm/plat-omap,asm-generic,\
arm/boot,arm/common,./arch/arm/kernel,arm/lib,./kernel,\
./init/,./net/,./include/linux,./include/sound,./drivers/net/davinci,\
./drivers/net/phy,drivers/net/wlan,./drivers/net/wireless,\
./drivers/char,./drivers/mtd,./drivers/usb,./drivers/serial,./drivers/watchdog,\
./drivers/misc,./drivers/pci,./drivers/media,./drivers/video,\
./drivers/mmc,./drivers/base,./drivers/gpio,./drivers/rtc,./drivers/spi/omap2_mcspi,./drivers/tty,\
./drivers/input,./drivers/i2c,./sound",include_files,",")
    exclude_num=split("staging,IR,dvb,radio,tools,mod.c,fs/9d,fs/adfs,fs/affs,fs/autofs,\
fs/befs,fs/bfs,fs/btrfs,fs/cifs,fs/ceph,fs/coda,fs/configfs,\
fs/cramfs,fs/dlm,fs/ecryptfs,fs/efs,fs/exofs,fs/exportfs,fs/ext,\
fs/fat,fs/freevxfs,fs/fuse,fs/gfs2,fs/hf,fs/hostfs,fs/hp,hs/isofs,\
fs/jbd,fs/jfs,fs/minix,fs/ncpfs,fs/xfs,fs/udf,fs/ufs,fs/ntfs,\
fs/squashfs,fs/romfs,fs/reiserfs,fs/quota,fs/nilfs2,fs/ocfs2,fs/partitions,\
net/dsa,net/ipx,net/lapb,net/phonet,net/sctp,net/tipc,net/x25,net/econet,\
net/irda,net/rds,net/TUNABLE,net/xfrm,net/9p,net/dcb,net/iucv,net/rfkill,net/appletalk,\
net/caif,net/dccp,net/netrom,net/rose,net/sunrpc,net/atm,net/can,net/decnet,net/rxrpc,\
net/ax25,net/ceph,net/l2tp,sound/usb,sound/atmel,sound/pci,sound/sh,sound/sparc,\
sound/aoa,sound/mips,sound/pcmcia,sound/isa,sound/parisc,sound/ppc,sound/soc/atmel,\
sound/soc/ep93xx,sound/soc/nuc900,sound/soc/s3c24xx,sound/soc/aulx,sound/soc/fsl,\
sound/soc/omap,sound/soc/s6000,sound/soc/txx9,sound/soc/blackfin,sound/soc/imx,\
sound/soc/kirkwood,sound/soc/pxa,sound/soc/sh,sound/soc/txx9,sound/soc/jz4740,\
media/video/au0828,media/video/bt8xx,media/video/cpia2,media/video/cx,\
media/video/em28xx,media/video/et61x251,media/video/gspca,media/video/hdpvr,\
media/video/isp,media/video/ivtv,media/video/pvrusb2,media/video/pwc,\
media/video/s5p-fimc,media/video/sn9c102,media/video/tiler,media/video/tlg2300,\
media/video/usbvision,media/video/zoran,\
video/aty,video/geode,video/i810,video/intelfb,video/kyro,video/matrox,\
video/mb862xx,video/mbx,video/msm,video/nvidia,video/omap,video/omap2,\
video/pnx4008,video/riva,video/savage,video/sis,video/vermilion,video/via\
drivers/input/gameport,drivers/input/joystick",exclude_files,",")
}

function exclude_filter(line) {
    orig_line = line
    for ( e=1; e<=exclude_num; e++ ) {
        #speed faster
        edx = index(line, exclude_files[e])
        if (edx != 0) {
            return;
        }

        #speed lower
        #if (match(line, exclude_files[e])) {
        #    # print orig_line " match " reg
        #    return;
        #}
    }

    print line
}

{
    for ( x=1; x<=include_num; x++ ) {
        idx = index($0, include_files[x])

        if ( 0 != idx ) {
            exclude_filter($0)
            continue
        }
    }
}
