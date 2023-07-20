<!-- 10.7.1 -->
## Видео: Управление образами Cisco IOS

Посмотрите видео про управления образами Cisco IOS.

![youtube](https://www.youtube.com/watch?v=nsmyx7XLAPo)

<!-- 10.7.2 -->
## Использование TFTP-серверов для хранения резервной копии

В предыдущем разделе вы изучили способы копирования и вставки конфигурации. В этом разделе мы продвинемся на шаг вперед с образами программного обеспечения IOS. По мере роста сети образы и файлы конфигурации Cisco IOS могут храниться на центральном TFTP-сервере, как показано на рисунке. Это позволяет контролировать количество образов IOS и их версии, а также нуждающиеся в обслуживании файлы настроек ОС.

![](./assets/10.7.2.svg)
<!-- /courses/ensa-dl/ae8eb392-34fd-11eb-ba19-f1886492e0e4/aeb611b0-34fd-11eb-ba19-f1886492e0e4/assets/c6bf5da0-1c46-11ea-af56-e368b99e9723.svg -->

<!--
На рисунке показано, как образы и файлы конфигурации ПО Cisco IOS могут храниться на центральном сервере TFTP. Маршрутизатор с надписью R1 и TFTP-сервер имеют две стрелки между ними, одна указывает на R1 с сервера и наоборот. Под стрелками находится образ IOS, isr4200-universalk9_ias.16.09.04.SPA.bin.
-->

Производственные интерсети обычно занимают обширные области и содержат несколько маршрутизаторов. В любой сети рекомендуется сохранить резервную копию образа ОС Cisco IOS на случай повреждения или случайного удаления образа системы на маршрутизаторе.

Маршрутизаторам, находящимся на большом расстоянии друг от друга, необходим источник или место для хранения резервных образов программного обеспечения Cisco IOS. Использование сетевого TFTP-сервера позволяет загружать файлы образов и конфигураций по сети. Он может быть маршрутизатором, рабочей станцией или хостом.

<!-- 10.7.3 -->
## Пример создания резервной копии образа IOS на TFTP-сервере

Чтобы обслуживать сеть с минимальным временем простоя, необходимо вовремя создавать резервные копии образов Cisco IOS. Тогда сетевые администраторы смогут быстро восстановить стертый или поврежденный образ IOS.

На рисунке администратор сети хочет создать резервную копию текущего файла образа на маршрутизаторе (isr4200-universalk9\ _ias.16.09.04.SPA.bin) на сервере TFTP по адресу 172.16.1.100.

![](./assets/10.7.3.svg)
<!-- /courses/ensa-dl/ae8eb392-34fd-11eb-ba19-f1886492e0e4/aeb611b0-34fd-11eb-ba19-f1886492e0e4/assets/c6bf84b3-1c46-11ea-af56-e368b99e9723.svg -->

<!--
На рисунке показан сетевой администратор, создающий резервную копию файла текущего образа маршрутизаторов на TFTP-сервере. Маршрутизатор с надписью R1 отправляет на TFTP-сервер свой текущий образ программного обеспечения IOS с именем isr4200-universalk9_ias.16.09.04.SPA.bin. TFTP-сервер имеет IP-адрес 172.16.1.100.
-->

**Шаг 1. Отправьте эхо-запрос на TFTP-сервер.**

Убедитесь в доступности TFTP-сервера. Как показано в примере, отправьте эхо-запрос на TFTP-сервер для проверки подключения.

```
R1# ping 172.16.1.100
Type escape sequence to abort.
Sending 5, 100-byte ICMP Echos to 172.16.1.100, timeout is 2 seconds:
!!!!!
Success rate is 100 percent (5/5),
round-trip min/avg/max = 56/56/56 ms
```

**Шаг 2. Проверьте размер образа на флэш-памяти.**

Убедитесь, что на диске TFTP-сервера достаточно места для размещения образа программного обеспечения Cisco IOS. Определить размер файла образа Cisco IOS можно с помощью команды **show flash0:** на маршрутизаторе. Длина файла на примере составляет 517153193 байт.

```
R1# show flash0: 
-# - --length-- -----date/time------ path
8 517153193 Apr 2 2019 21:29:58 +00:00 
                        isr4200-universalk9_ias.16.09.04.SPA.bin
(дальше выходные данные опущены)
```

**Шаг 3. Скопируйте образ на TFTP-сервер.**

Скопируйте образ на TFTP-сервер с помощью команды **copy** _source-url destination-url_. После выполнения команды с использованием заданных URL-адресов источника и получателя пользователь получит запрос на ввод имени файла отправителя, адреса удаленного узла и имени файла назначения. Как правило, вы вводите **Enter** , чтобы принять имя исходного файла в качестве имени файла назначения. После этого начнется передача.

```
R1# copy flash: tftp: 
Source filename []? isr4200-universalk9_ias.16.09.04.SPA.bin
Address or name of remote host []? 172.16.1.100
Destination filename [isr4200-universalk9_ias.16.09.04.SPA.bin]? <Enter>
Writing isr4200-universalk9_ias.16.09.04.SPA.bin...
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! 
(дальше выходные данные опущены)
517153193 bytes copied in 863.468 secs (269058 bytes/sec)
```

<!-- 10.7.4 -->
## Пример копирования образа IOS на устройство

Cisco постоянно выпускает новые версии IOS, чтобы устранить ошибки и предложить новые функции. В этом примере для передачи используется IPv6 для демонстрации того, что TFTP может использоваться в IPv6-сетях.

На рисунке показан процесс копирования образа Cisco IOS с TFTP-сервера. Новый файл образа (isr4200-universalk9\_ias.16.09.04.SPA.bin) будет скопирован на маршрутизатор с TFTP-сервера по адресу 2001:DB8:CAFE:100::99.

![](./assets/10.7.4.svg)
<!-- /courses/ensa-dl/ae8eb392-34fd-11eb-ba19-f1886492e0e4/aeb611b0-34fd-11eb-ba19-f1886492e0e4/assets/c6c020f2-1c46-11ea-af56-e368b99e9723.svg -->

<!--
На рисунке показан процесс копирования образа Cisco IOS с TFTP-сервера на маршрутизатор. TFTP-сервер отправляет R1 файл образа IOS с именем isr4200-universalk9_ias.16.09.04.SPA.bin. TFTP-сервер имеет IP-адрес 2001:db8:cafe:100::99.
-->

**Шаг 1. Отправьте эхо-запрос на TFTP-сервер.**

Убедитесь в доступности TFTP-сервера. Как показано в примере, отправьте на него эхо-запрос для проверки подключения.

```
R1# ping 2001:db8:cafe:100::99
Type escape sequence to abort.
Sending 5, 100-byte ICMP Echos to 2001:DB8:CAFE:100::99,
timeout is 2 seconds:
!!!!!
Success rate is 100 percent (5/5), 
round-trip min/avg/max = 56/56/56 ms
```

**Шаг 2. Проверьте количество свободной флеш-памяти.**

Убедитесь, что на маршрутизаторе достаточно свободной флеш-памяти. Ее объем можно проверить командой **show flash:**. Сравните свободный объем с размером нового файла образа. В примере команда **show flash:** используется для проверки свободной флеш-памяти. Объем свободной флеш-памяти составляет 6294806528 байт.

```
R1# show flash: 
-# - --length-- -----date/time------ path
(дальше выходные данные опущены)
6294806528 bytes available (537251840 bytes used) 
R1#
```

**Шаг 3. Скопируйте новый образ IOS в флэш-память.**

Скопируйте файл образа IOS с TFTP-сервера на маршрутизатор с помощью команды **copy**, показанной в примере. После выполнения этой команды с указанными URL-адресами источника и назначения пользователь получит запрос на ввод IP-адреса удаленного узла, имен файлов источника и назначения. Как правило, вы вводите **Enter**, чтобы принять имя исходного файла в качестве имени файла назначения. После этого начнется передача файла.

```
R1# copy tftp: flash: 
Address or name of remote host []?2001:DB8:CAFE:100::99
Source filename []? isr4200-universalk9_ias.16.09.04.SPA.bin
Destination filename [isr4200-universalk9_ias.16.09.04.SPA.bin]? <Enter>
Accessing tftp://2001:DB8:CAFE:100::99/ isr4200-
universalk9_ias.16.09.04.SPA.bin...
Loading isr4200-universalk9_ias.16.09.04.SPA.bin
from 2001:DB8:CAFE:100::99 (via
GigabitEthernet0/0/0): !!!!!!!!!!!!!!!!!!!!
 
[OK - 517153193 bytes]
517153193 bytes copied in 868.128 secs (265652 bytes/sec)
```

<!-- 10.7.5 -->
## Команда "boot system"

Чтобы установить скопированный образ IOS, когда он сохранен во флеш-памяти маршрутизатора, настройте маршрутизатор на загрузку нового образа во время запуска с помощью команды **boot system**, как показано в примере. Сохраните конфигурацию. Перезагрузите маршрутизатор, чтобы он загрузился с новым образом.

```
R1# configure terminal
R1(config)# boot system flash0:isr4200-universalk9_ias.16.09.04.SPA.bin
R1(config)# exit
R1#
R1# copy running-config startup-config
R1#
R1# reload
Proceed with reload? [confirm] 

*Mar  1 12:46:23.808: %SYS-5-RELOAD: Reload requested by console. Reload Reason: Reload Command.
```

После запуска маршрутизатора в файле загрузочной конфигурации (startup configuration) нужно найти команды **boot system** с указанными в них именем и расположением образа Cisco IOS, который нужно загрузить. Чтобы обеспечить отказоустойчивую загрузку, можно ввести несколько команд **boot system**.

Если в конфигурации нет команд **boot system**, маршрутизатор по умолчанию загружает первый допустимый образ Cisco IOS из флеш-памяти и запускает его.

После загрузки маршрутизатора убедитесь, что новый образ загрузился. Используйте для этого команду **show version**, как показано в примере.

```
R1# show version
Cisco IOS XE Software, Version 16.09.04
Cisco IOS Software [Fuji], ISR Software (X86_64_LINUX_IOSD-UNIVERSALK9_IAS-M), Version 16.9.4, RELEASE SOFTWARE (fc2)
Technical Support: http://www.cisco.com/techsupport
Copyright (c) 1986-2019 by Cisco Systems, Inc.
Compiled Thu 22-Aug-19 18:09 by mcpre
Cisco IOS-XE software, Copyright (c) 2005-2019 by cisco Systems, Inc.
All rights reserved.  Certain components of Cisco IOS-XE software are
licensed under the GNU General Public License ("GPL") Version 2.0.  The
software code licensed under GPL Version 2.0 is free software that comes
with ABSOLUTELY NO WARRANTY.  You can redistribute and/or modify such
GPL code under the terms of GPL Version 2.0.  For more details, see the
documentation or "License Notice" file accompanying the IOS-XE software,
or the applicable URL provided on the flyer accompanying the IOS-XE
software.
   
ROM: IOS-XE ROMMON
Router uptime is 2 hours, 19 minutes
Uptime for this control processor is 2 hours, 22 minutes
System returned to ROM by PowerOn
System image file is "flash:isr4200-universalk9_ias.16.09.04.SPA.bin"
(output omitted)
```
