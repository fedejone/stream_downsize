SET PATH=%VIVADO_ROOTDIR_19_2%\bin;%PATH%
hdlmake
make mrproper
make synthesize
@pause
