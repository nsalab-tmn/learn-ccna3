<!-- 10.1.1 -->
## Общие сведения о CDP

Первое, что вы хотите знать о вашей сети: что в ней, где находятся компоненты и как они связаны? Вам понадобится карта. В этом разделе объясняется, как можно использовать протокол Cisco Discovery Protocol (CDP) для создания карты сети.

Протокол Cisco Discovery Protocol (CDP) — это проприетарный протокол компании Cisco уровня 2 для сбора информации об устройствах, использующих один канал передачи данных. CDP не зависит от среды передачи данных и других протоколов, он включен на всех устройствах Cisco: маршрутизаторах, коммутаторах и серверах доступа.

Периодически устройство отправляет объявления CDP на подключенные устройства, как показано на рисунке.

![](./assets/10.1.1.png)
<!-- /courses/ensa-dl/ae8eb392-34fd-11eb-ba19-f1886492e0e4/aeb5c39a-34fd-11eb-ba19-f1886492e0e4/assets/c69bd011-1c46-11ea-af56-e368b99e9723.svg -->

С помощью объявлений происходит обмен информацией о типах обнаруженных устройств, их именах, количестве и типах интерфейсов.

Поскольку большинство сетевых устройств подключены к другим устройствам, протокол CDP может помочь спроектировать сети, найти и устранить неполадки, а также во внести изменения в оборудование. CDP также можно использовать в качестве сетевого средства обнаружения, чтобы получать информацию о соседних устройствах. Собранная информация помогает построить логическую топологию сети, когда документации нет или она недостаточно детализирована.

<!-- 10.1.2 -->
## Настройка и проверка CDP

На устройствах Cisco протокол CDP включен по умолчанию. Иногда из соображений безопасности может потребоваться его отключить — глобально или для отдельных интерфейсов. Когда CDP включен, злоумышленник может получить ценную информацию о структуре сети: IP-адреса, версии IOS и типы устройств.

Чтобы проверить состояние CDP и отобразить сведения о нем, введите команду **show cdp**, как показано в примере.

```
Router# show cdp
Global CDP information:
      Sending CDP packets every 60 seconds
      Sending a holdtime value of 180 seconds
      Sending CDPv2 advertisements is enabled
```

Чтобы включить CDP сразу для всех поддерживаемых интерфейсов устройства, введите команду **cdp run** в режиме глобальной конфигурации. Чтобы отключить CDP сразу для всех интерфейсов устройства, введите команду **no cdp run** в режиме глобальной конфигурации.

```
Router(config)# no cdp run
Router(config)# exit
Router# show cdp
CDP is not enabled
Router# configure terminal
Router(config)# cdp run
```

Чтобы отключить CDP для определенного интерфейса, например для подключения к интернет-провайдеру, введите **no cdp enable** режиме настройки интерфейса. Протокол по-прежнему включен на устройстве, но его объявления больше не передаются через указанный интерфейс. Чтобы снова включить CDP для конкретного интерфейса, введите **cdp enable**, как показано в примере.

```
Switch(config)# interface gigabitethernet 0/0/1
Switch(config-if)# cdp enable
```

Чтобы проверить состояние CDP и просмотреть список соседних устройств, выполните команду **show cdp neighbors** в привилегированном режиме EXEC. Команда **show cdp neighbors** отображает важную информацию о соседних устройствах CDP. Как видно из результатов в примере, в настоящее время у устройства нет соседей, поскольку оно физически не подключено к другим устройствам.

```
Router# show cdp neighbors
Capability Codes: R - Router, T - Trans Bridge, B - Source Route Bridge
                  S - Switch, H - Host, I - IGMP, r - Repeater, P - Phone,
                  D - Remote, C - CVTA, M - Two-port Mac Relay
 
Device ID        Local Intrfce     Holdtme    Capability  Platform  Port ID
 
Total cdp entries displayed : 0
```

Команда **show cdp interface** отображает интерфейсы устройства, на которых включен протокол CDP. Кроме того, выводится состояние каждого интерфейса. На рисунке показано, что протокол CDP включен на пяти интерфейсах маршрутизатора, при этом есть только одно активное подключение к другому устройству.

```
Router# show cdp interface
GigabitEthernet0/0/0 is administratively down, line protocol is down
  Encapsulation ARPA
  Sending CDP packets every 60 seconds
  Holdtime is 180 seconds
GigabitEthernet0/0/1 is up, line protocol is up
  Encapsulation ARPA
  Sending CDP packets every 60 seconds
  Holdtime is 180 seconds
GigabitEthernet0/0/2 is down, line protocol is down
  Encapsulation ARPA
  Sending CDP packets every 60 seconds
  Holdtime is 180 seconds
Serial0/1/0 is administratively down, line protocol is down
  Encapsulation HDLC
  Sending CDP packets every 60 seconds
  Holdtime is 180 seconds
Serial0/1/1 is administratively down, line protocol is down
  Encapsulation HDLC
  Sending CDP packets every 60 seconds
  Holdtime is 180 seconds
GigabitEthernet0 is down, line protocol is down
  Encapsulation ARPA
  Sending CDP packets every 60 seconds
  Holdtime is 180 seconds
 cdp enabled interfaces : 6
 interfaces up          : 1
 interfaces down        : 5
```

<!-- 10.1.3 -->
## Поиск устройств с помощью CDP

Предположим, что документация по топологии, показанной на рисунке, отсутствует. Администратор сети знает только, что R1 подключен к другому устройству.

![](./assets/10.1.3-1.png)
<!-- /courses/ensa-dl/ae8eb392-34fd-11eb-ba19-f1886492e0e4/aeb5c39a-34fd-11eb-ba19-f1886492e0e4/assets/c69cba71-1c46-11ea-af56-e368b99e9723.svg -->

Если в сети включен протокол CDP, ее структуру можно определить с помощью команды **show cdp neighbors**.

```
R1# show cdp neighbors
Capability Codes: R - Router, T - Trans Bridge, B - Source Route Bridge
                  S - Switch, H - Host, I - IGMP, r - Repeater, P - Phone,
                  D - Remote, C - CVTA, M - Two-port Mac Relay
 
Device ID        Local Intrfce     Holdtme    Capability  Platform  Port ID
S1               Gig 0/0/1           179         S I      WS-C3560- Fas 0/5
```

Нет никакой информации об остальной части сети. Команда **show cdp neighbors** отображает полезную информацию о каждом соседнем устройстве CDP:

* **идентификатор устройства**  — имя хоста соседнего устройства (S1);
* **идентификатор порта**  — имя локального или удаленного порта (Gig 0/0/1 и Fas 0/0/5 соответственно);
* **список возможностей**  — является ли устройство маршрутизатором или коммутатором (S обозначает коммутатор; I обозначает IGMP и в данном курсе не рассматривается);
* **платформа**  — аппаратная платформа устройства (WS-C3560 обозначает коммутатор Cisco 3560).

Выходные данные показывают, что к интерфейсу G0/0/1 на R1 подключено другое устройство Cisco S1. Кроме того, S1 подключается через F0/5, как показано в обновленной топологии.

![](./assets/10.1.3-2.png)
<!-- /courses/ensa-dl/ae8eb392-34fd-11eb-ba19-f1886492e0e4/aeb5c39a-34fd-11eb-ba19-f1886492e0e4/assets/c69d2fa3-1c46-11ea-af56-e368b99e9723.svg -->

Сетевой администратор использует **show cdp neighbors detail** для обнаружения IP-адреса S1. Как показано в выходных данных, адрес S1 — 192.168.1.2.

```
R1# show cdp neighbors detail
-------------------------
Device ID: S1
Entry address(es):
  IP address: 192.168.1.2
Platform: cisco WS-C3560-24TS,  Capabilities: Switch IGMP
Interface: GigabitEthernet0/0/1,  Port ID (outgoing port): FastEthernet0/5
Holdtime : 136 sec
 
Version :
Cisco IOS Software, C3560 Software (C3560-LANBASEK9-M), Version 15.0(2)SE7, R
RELEASE SOFTWARE (fc1)
Technical Support: http://www.cisco.com/techsupport
Copyright (c) 1986-2014 by Cisco Systems, Inc.
Compiled Thu 23-Oct-14 14:49 by prod_rel_team
 
advertisement version: 2
Protocol Hello:  OUI=0x00000C, Protocol ID=0x0112; payload len=27, 
value=00000000FFFFFFFF010221FF000000000000002291210380FF0000
VTP Management Domain: ''
Native VLAN: 1
Duplex: full
Management address(es):
  IP address: 192.168.1.2
 
Total cdp entries displayed : 1
```

Получив удаленный доступ к коммутатору S1 через подключение SSH либо физический доступ через консольный порт, сетевой администратор может узнать, какие еще устройства подключены к S1, с помощью команды **show cdp neighbors**. На рисунке показан результат выполнения этой команды.

```
S1# show cdp neighbors
Capability Codes: R - Router, T - Trans Bridge, B - Source Route Bridge
                  S - Switch, H - Host, I - IGMP, r - Repeater, P - Phone,
                  D - Remote, C - CVTA, M - Two-port Mac Relay
Device ID        Local Intrfce     Holdtme    Capability  Platform  Port ID
S2               Fas 0/1           150              S I   WS-C2960- Fas 0/1
R1               Fas 0/5           179             R S I  ISR4331/K Gig 0/0/1
```

В выходных данных появляется еще один коммутатор — S2. Он использует F0/1 для подключения к интерфейсу F0/1 на S1, как показано на рисунке.

![](./assets/10.1.3-3.png)
<!-- /courses/ensa-dl/ae8eb392-34fd-11eb-ba19-f1886492e0e4/aeb5c39a-34fd-11eb-ba19-f1886492e0e4/assets/c69dcbe0-1c46-11ea-af56-e368b99e9723.svg -->

Кроме того, администратор сети может использовать **show cdp neighbors detail** для обнаружения IP-адреса для S2, а затем удаленного доступа к нему. После успешного входа в систему администратор сети использует команду **show cdp neighbors**, чтобы определить, есть ли ещё устройства.

```
S2# show cdp neighbors
Capability Codes: R - Router, T - Trans Bridge, B - Source Route Bridge
                  S - Switch, H - Host, I - IGMP, r - Repeater, P - Phone,
                  D - Remote, C - CVTA, M - Two-port Mac Relay
Device ID        Local Intrfce     Holdtme    Capability  Platform  Port ID
S1               Fas 0/1           141              S I   WS-C3560- Fas 0/1
```

К коммутатору S2 подключено только одно устройство — коммутатор S1. Следовательно, в топологии больше нет доступных для обнаружения устройств. Сетевой администратор может обновить документацию сети, указав в ней обнаруженные устройства.

<!-- 10.1.4 -->
<!-- syntax -->

