# Clone/Fetch Upstream Device Dependencies
# Device tree
echo "cloning commmon"
git clone -b lineage-19.1 git@github.com:brunorolak/device_motorola_msm8953-common.git device/motorola/msm8953-common
echo ""

echo "cloning vendor blobs"
git clone -b lineage-19.1 git@github.com:brunorolak/vendor_motorola_ali.git vendor/motorola/ali
git clone -b lineage-19.1 git@github.com:brunorolak/vendor_motorola_msm8953-common.git vendor/motorola/msm8953-common
echo ""

# Kernel
echo "cloning kernel and clang"
git clone -b lineage-19.1 git@github.com:brunorolak/kernel_motorola_msm8953.git kernel/motorola/msm8953
echo ""

# HAL's
echo "Cheking if Hals is right"

mkdir hardware/
mkdir hardware/qcom-caf/
mkdir hardware/qcom-caf/msm8996/
mkdir hardware/qcom-caf/msm8996/audio
cd hardware/qcom-caf/msm8996/audio
git status | tee gitdata.txt
if
grep -q 12.x-caf-msm8996 "gitdata.txt" ; then
echo "HAL is okay"
cd ../../../..
else
echo "Cloning AEX Hals"
cd ../../../..
rm -rf hardware/qcom-caf/msm8996/audio
git clone https://github.com/AospExtended/platform_hardware_qcom_audio -b 12.x-caf-msm8996 hardware/qcom-caf/msm8996/audio
echo ""
fi

mkdir hardware/qcom-caf/msm8996/media
cd hardware/qcom-caf/msm8996/media
git status | tee gitdata.txt
if
grep -q 12.x-caf-msm8996 "gitdata.txt" ; then
echo "HAL is okay"
cd ../../../..
else
echo "Cloning AEX Hals"
cd ../../../..
rm -rf hardware/qcom-caf/msm8996/media
git clone https://github.com/AospExtended/platform_hardware_qcom_media -b 12.x-caf-msm8996 hardware/qcom-caf/msm8996/media
echo ""
fi

mkdir hardware/qcom-caf/msm8996/display
cd hardware/qcom-caf/msm8996/display
git status | tee gitdata.txt
if
grep -q 12.x-caf-msm8996 "gitdata.txt" ; then
echo "HAL is okay"
cd ../../../..
else
echo "Cloning AEX Hals"
cd ../../../..
rm -rf hardware/qcom-caf/msm8996/display
git clone https://github.com/AospExtended/platform_hardware_qcom_display -b 12.x-caf-msm8996 hardware/qcom-caf/msm8996/display
echo ""
fi

# Fix source for old moto devices
echo "Fix source for old moto devices"
cd frameworks/native
git fetch https://github.com/phhusson/platform_frameworks_native android-12.0.0_r16-phh
git cherry-pick 11160ca79ca44375af895f70af14bb2af909aa77
git cherry-pick --abort
git cherry-pick 40b43f648327b3fc13a18f0f28da54b34db11c79
git cherry-pick --abort
cd ../..
cd system/netd
git fetch https://github.com/phhusson/platform_system_netd android-12.0.0_r15-phh
git cherry-pick 5f6bfe7390eafc659b36996398deb670436fc9df
git cherry-pick --abort
cd ..
cd bpf
git fetch https://github.com/phhusson/platform_system_bpf android-12.0.0_r15-phh
git cherry-pick 2f0ac4a3596fc20c94828a01534fd77d12ec20dd
git cherry-pick --abort
cd ../..
cd external/selinux
git fetch https://github.com/phhusson/platform_external_selinux android-12.0.0_r16-phh android-12.0.0_r26-phh android-12.0.0_r28-phh
git cherry-pick 010b772593639c9fdb4392ac976d5f3da4ea5e57
git cherry-pick --abort
cd ../..
echo "If cherry-pick fails use https://gerrit.aicp-rom.com/q/topic:twelve-ultralegacy-devices"
echo ""

# FM Radio App
echo "Cloning libs and app from Pixel Experience"
git clone -b twelve https://github.com/PixelExperience/packages_apps_FMRadio packages/apps/FMRadio
git clone -b twelve https://github.com/PixelExperience/vendor_qcom_opensource_libfmjni vendor/qcom/opensource/libfmjni
echo ""

# Delete / Debloat Apps
echo "Deleting / Debloating Apps"

#AudioFX
echo "Removing AudioFX"
cd  packages/apps/
rm -rf AudioFX
cd ../..
echo ""

