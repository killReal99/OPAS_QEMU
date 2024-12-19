# OPAS_QEMU

Запуск QEMU с эмуляцией абстрактного RISC-V без привязки к конкретному железу:

`sudo sh RISC-V_QEMU.sh $NUMBER_OF_CORES $AMOUNT_OF_RAM $AMOUNT_OF_ROM $PASSWORD`

Пример запуска:
`sudo sh RISC-V_QEMU.sh 4 4096 16G root`

В роли ОС QEMU использует ubuntu 24.04.1. 
В будущем скрипт будет доработан и позволит запускать QEMU с различными версиями ОС и ядер.
