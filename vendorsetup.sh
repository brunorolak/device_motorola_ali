# Clone/Fetch Upstream Device Dependencies
# Device tree
echo "cloning commmon"
git clone https://github.com/LucyfMorning/device_xiaomi_sdm845-common device/xiaomi/sdm845-common
echo ""

echo "cloning vendor blobs"
git clone https://github.com/LucyfMorning/vendor_xiaomi_dipper vendor/xiaomi/dipper
git clone https://github.com/LucyfMorning/vendor_xiaomi_sdm845common vendor/xiaomi/sdm845-common
echo ""

# Kernel
echo "cloning kernel and clang"
git clone -b twelve https://github.com/PixelExperience-Devices/kernel_xiaomi_polaris kernel/xiaomi/dipper
git clone --depth=1 https://gitlab.com/jjpprrrr/prelude-clang prebuilts/clang/host/linux-x86/clang-prelude
echo ""

# HAL's
echo "removing and cloning Hal's pathc for sdm845"
rm -rf hardware/qcom-caf/sdm845/display
rm -rf hardware/qcom-caf/sdm845/media
git clone https://github.com/PixelExperience/hardware_qcom-caf_sdm845_display hardware/qcom-caf/sdm845/display
git clone https://github.com/PixelExperience/hardware_qcom-caf_sdm845_media hardware/qcom-caf/sdm845/media
echo ""

