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
echo "removing qcom-caf 8996 and cloning Hal's from AEX"
cd hardware/qcom-caf/msm8996 && rm -rf display &&  rm -rf audio && rm -rf media && cd ../../.. 
git clone https://github.com/AospExtended/platform_hardware_qcom_audio -b 12.x-caf-msm8996 hardware/qcom-caf/msm8996/audio && 
git clone https://github.com/AospExtended/platform_hardware_qcom_display -b 12.x-caf-msm8996 hardware/qcom-caf/msm8996/display && 
git clone https://github.com/AospExtended/platform_hardware_qcom_media -b 12.x-caf-msm8996 hardware/qcom-caf/msm8996/media
echo ""

# FM Radio App
echo "Cloning libs and app from Pixel Experience"
git clone -b twelve https://github.com/PixelExperience/packages_apps_FMRadio packages/apps/FMRadio
git clone -b twelve https://github.com/PixelExperience/vendor_qcom_opensource_libfmjni vendor/qcom/opensource/libfmjni
echo ""

