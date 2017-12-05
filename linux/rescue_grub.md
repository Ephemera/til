Rescue Grub
-----------

여러 방법이 있겠지만 내 환경이 UEFI모드로 설치된 Ubuntu여서 이걸 기준으로 복구해보자면,

준비한 USB스틱도 UEFI모드로 부틱해야한다:

```
$ ls -CF /sys/firmware
```


Ubuntu가 설치된 파티션 및 설치된 모드 확인:

```
$ sudo parted /dev/sda print

# ESP 파티션도 확인해 둬야함(2번 파티션이라고 가정).
# Ubuntu가 5번 파티션에 설치되었으면

$ sudo mkdir /mnt
$ sudo mount /dev/sda5 /mnt
$ ls -CF /mnt/boot/grub
... x86_64-efi/ ... ...
```

grub-efi 패키지를 설치한다:

```
$ sudo apt install --reinstall grub-efi
```

이제 작업 시작:

```
$ sudo mount -t vfat /dev/sda2 /mnt/boot/efi
$ sudo modprobe dm-mod
$ sudo grub-install --target=x86_64-efi --efi-directory=/mnt/boot/efi --bootloader-id=ubuntu --boot-directory=/mnt/boot --recheck --debug
```

그리고 재부팅.
