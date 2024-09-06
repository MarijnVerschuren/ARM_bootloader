# STM32_bootloader
Bootloader for STM32 devices


# upload
>- cd build
>- cmake -D CMAKE_BUILD_TYPE=Release ..
>- make srec
>- pystlink flash:erase:verify:ARM_bootloader.srec