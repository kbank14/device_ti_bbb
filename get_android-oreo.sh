# 안드로이드 AOSP 개발 소스 및 툴 다운로드 스크립트
# 사용법:
#   $ download <get_android-oreo.sh>
#   $ get_android-oreo.sh

TI_LINUX=ti-linux-4.1.y
#TI_LINUX=ti-linux-4.4.y
#TI_LINUX=ti-linux-4.9.y
#TI_LINUX=ti-linux-rt-4.1.y
#TI_LINUX=ti-linux-rt-4.4.y
#TI_LINUX=ti-linux-rt-4.9.y

get_download_android_oreo()
{
    if [ ! -d oreo ]; then
        mkdir oreo
    fi

    cd oreo

    if [ -d .repo ]; then
        echo "Android OREO repo가 있습니다. 다운로드 건너뜀니다."
        return
    fi

    # get android oreo
    repo init -u https://android.googlesource.com/platform/manifest -b android-8.1.0_r7
    repo sync -c -j 8
}

get_download_kernel()
{
    if [ -d kernel/ti-kernel/.git ]; then
        echo "ti-kernel이 있습니다. 다운로드 건너뜀니다."
        return
    fi

    if [ ! -d kernel ]; then
        mkdir kernel
    fi

    cd kernel

    # get kernel
    git clone https://github.com/RobertCNelson/ti-linux-kernel-dev.git ti-kernel
    cd ti-kernel
    git checkout origin/$TI_LINUX -b tmp
    cd ..
    cd ..
}

get_download_overlays()
{
    if [ -d kernel/bb.org-overlays/.git ]; then
        echo "bb.org-overlays가 있습니다. 다운로드 건너뜀니다."
        return
    fi

    if [ ! -d kernel ]; then
        mkdir kernel
    fi

    cd kernel

    # get overlays
    git clone https://github.com/beagleboard/bb.org-overlays.git bb.org-overlays
    cd ..
}

get_download_u_boot()
{
    if [ -d kernel/u-boot/.git ]; then
        echo "u-boot가 있습니다. 다운로드 건너뜀니다."
        return
    fi

    if [ ! -d kernel ]; then
        mkdir kernel
    fi

    cd kernel

    # get u-boot
    git clone https://github.com/csimmonds/u-boot.git u-boot
    cd u-boot
    git checkout origin/am335x-v2013.01.01-bbb-fb -b tmp
    cd ..
    cd ..
}

get_download_scripts()
{
    if [ -d kernel/scripts/.git ]; then
        echo "scripts가 있습니다. 다운로드 건너뜀니다."
        return
    fi

    if [ ! -d kernel ]; then
        mkdir kernel
    fi

    cd kernel

    PWD=`/bin/pwd`

    # get scripts
    git clone https://github.com/kbank14/bbb-scripts.git scripts
    cd scripts
    git checkout origin/m6.0 -b tmp
    ln -s $PWD/build-beagleboneblack.sh ../../build-beagleboneblack.sh
    cd ..
    cd ..
}

get_download_bbb()
{
    if [ -d device/beagleboard/BBB/.git ]; then
        echo "BBB가 있습니다. 다운로드 건너뜀니다."
        return
    fi

    if [ ! -d device ]; then
        mkdir device
    fi
    cd device

    if [ ! -d beagleboard ]; then
        mkdir beagleboard
    fi
    cd beagleboard

    # get scripts
    git clone https://github.com/kbank14/BBB.git BBB
    cd BBB
    git checkout origin/m6.0 -b oreo
    cd ..
    cd ..
}

#get_download_android_oreo

cd oreo

get_download_kernel
get_download_overlays
get_download_u_boot
get_download_scripts
get_download_bbb
 
