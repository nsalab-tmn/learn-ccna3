<!-- 10.1.1 -->
## Общие сведения о CDP

Первое, что вы хотите знать о вашей сети: что в ней находится, где эти компоненты и как они связаны? Вам понадобится карта. В этом разделе объясняется, как можно использовать протокол CDP для создания карты сети.

Протокол CDP — это проприетарный протокол уровня 2 для сбора информации об устройствах, использующих один канал передачи данных. CDP не зависит от среды передачи данных и других протоколов, он включен на устройствах, которые его поддерживают: маршрутизаторах, коммутаторах и серверах доступа.

Периодически устройство отправляет объявления CDP на подключенные устройства, как показано на рисунке.

![](./assets/10.1.1.svg)
<!-- /courses/ensa-dl/ae8eb392-34fd-11eb-ba19-f1886492e0e4/aeb5c39a-34fd-11eb-ba19-f1886492e0e4/assets/c69bd011-1c46-11ea-af56-e368b99e9723.svg -->

С помощью объявлений происходит обмен информацией о типах обнаруженных устройств, их именах, количестве и типах интерфейсов.

Поскольку большинство сетевых устройств подключены к другим, протокол CDP поможет спроектировать сети, найти и устранить неполадки, а также внести изменения в оборудование. Ещё CDP можно использовать в качестве сетевого средства обнаружения, чтобы получать информацию о соседних устройствах. Собранная информация помогает построить логическую топологию сети, когда документации нет или она недостаточно детализирована.

<!-- 10.1.2 -->
## Настройка и проверка CDP

На устройствах, которые его поддерживают, протокол CDP обычно включен по умолчанию. Иногда из соображений безопасности может потребоваться его отключить — глобально или для отдельных интерфейсов. Когда CDP включен, злоумышленник может получить ценную информацию о структуре сети: IP-адреса, версии ОС и типы устройств.

Чтобы проверить состояние CDP и отобразить сведения о нем, введите команду **show cdp**, как показано в примере.

```
Router# show cdp
Global CDP information:
      Sending CDP packets every 60 seconds
      Sending a holdtime value of 180 seconds
      Sending CDPv2 advertisements is enabled
```

Чтобы включить CDP сразу для всех поддерживаемых интерфейсов устройства, введите команду **cdp run** в режиме глобальной конфигурации, а чтобы отключить — **no cdp run**.

```
Router(config)# no cdp run
Router(config)# exit
Router# show cdp
CDP is not enabled
Router# configure terminal
Router(config)# cdp run
```

Чтобы отключить CDP для определенного интерфейса, например для подключения к интернет-провайдеру, введите **no cdp enable** режиме настройки интерфейса. Протокол по-прежнему включен на устройстве, но его объявления больше не передаются через указанный интерфейс. Чтобы снова его включить, введите **cdp enable**, как показано в примере.

```
Switch(config)# interface gigabitethernet 0/0/1
Switch(config-if)# cdp enable
```

Чтобы проверить состояние CDP и просмотреть список соседних устройств, выполните команду **show cdp neighbors** в привилегированном режиме EXEC. Команда **show cdp neighbors** отображает важную информацию о соседних устройствах CDP. Как видно из результатов в примере, у устройства нет соседей, поскольку оно физически к ним не подключено.

```
Router# show cdp neighbors
Capability Codes: R - Router, T - Trans Bridge, B - Source Route Bridge
                  S - Switch, H - Host, I - IGMP, r - Repeater, P - Phone,
                  D - Remote, C - CVTA, M - Two-port Mac Relay
 
Device ID        Local Intrfce     Holdtme    Capability  Platform  Port ID
 
Total cdp entries displayed : 0
```

Команда **show cdp interface** отображает интерфейсы устройства, на которых включен протокол CDP. Кроме того, выводится состояние каждого интерфейса. На рисунке показано, что протокол CDP включен на шести интерфейсах маршрутизатора, при этом есть только одно активное подключение к другому устройству.

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

![](./assets/10.1.3-1.svg)
<!-- /courses/ensa-dl/ae8eb392-34fd-11eb-ba19-f1886492e0e4/aeb5c39a-34fd-11eb-ba19-f1886492e0e4/assets/c69cba71-1c46-11ea-af56-e368b99e9723.svg -->

Если в сети включен протокол CDP, ее структуру можно определить с помощью команды **show cdp neighbors**.

```
R1#show cdp neighbors
Capability Codes: R - Router, T - Trans Bridge, B - Source Route Bridge
                  S - Switch, H - Host, I - IGMP, r - Repeater, P - Phone,
                  D - Remote, C - CVTA, M - Two-port Mac Relay

Device ID        Local Intrfce     Holdtme    Capability  Platform  Port ID
S1               Gig 0/0/1         150                S I NS03      Fas 0/5

Total cdp entries displayed : 1
```

Нет никакой информации об остальной части сети. Команда **show cdp neighbors** отображает полезную информацию о каждом соседнем устройстве CDP:

* **идентификатор устройства**  — имя соседнего устройства (S1);
* **идентификатор порта**  — имя локального или удаленного порта (Gig 0/0/1 и Fas 0/5 соответственно);
* **список возможностей**  — является ли устройство маршрутизатором или коммутатором (S обозначает коммутатор; I обозначает IGMP и в данном курсе не рассматривается);
* **платформа**  — аппаратная платформа, то есть модель соседнего устройства.

Выходные данные показывают, что к интерфейсу G0/0/1 на R1 подключено другое устройство S1. Кроме того, S1 подключается через F0/5, как показано в обновленной топологии.

![](./assets/10.1.3-2.svg)
<!-- /courses/ensa-dl/ae8eb392-34fd-11eb-ba19-f1886492e0e4/aeb5c39a-34fd-11eb-ba19-f1886492e0e4/assets/c69d2fa3-1c46-11ea-af56-e368b99e9723.svg -->

Сетевой администратор использует **show cdp neighbors detail** для обнаружения IP-адреса S1. Как показано в выходных данных, адрес S1 — 192.168.1.2.

```
R1#show cdp neighbors detail
-------------------------
Device ID: S1
Entry address(es):
  IP address: 192.168.1.2
Platform: NS03,  Capabilities: Switch IGMP
Interface: GigabitEthernet0/0/1,  Port ID (outgoing port): FastEthernet0/5
Holdtime : 150 sec

Version :
NSALAB NetOS Software, NS03 Software (NS03-NETOS-M), Version 0.1.0

advertisement version: 2
Duplex: full

Total cdp entries displayed : 1
```

Получив удаленный доступ к коммутатору S1 через подключение SSH либо физический доступ через консольный порт, сетевой администратор может узнать, какие еще устройства подключены к S1, с помощью команды **show cdp neighbors**. На рисунке показан результат.

```
S1#show cdp neighbors
Capability Codes: R - Router, T - Trans Bridge, B - Source Route Bridge
                  S - Switch, H - Host, I - IGMP, r - Repeater, P - Phone,
                  D - Remote, C - CVTA, M - Two-port Mac Relay

Device ID        Local Intrfce     Holdtme    Capability  Platform  Port ID
S2               Fas 0/1           150                S I NS01      Fas 0/1
R1               Fas 0/5           150            R B S I NR05      Gig 0/0/1

Total cdp entries displayed : 2
```

В выходных данных появляется еще один коммутатор — S2. Он использует F0/1 для подключения к интерфейсу F0/1 на S1, как показано на рисунке.

![](./assets/10.1.3-3.svg)
<!-- /courses/ensa-dl/ae8eb392-34fd-11eb-ba19-f1886492e0e4/aeb5c39a-34fd-11eb-ba19-f1886492e0e4/assets/c69dcbe0-1c46-11ea-af56-e368b99e9723.svg -->

Кроме того, администратор сети может использовать **show cdp neighbors detail** для обнаружения IP-адреса для S2, а затем удаленного доступа к нему. После успешного входа в систему администратор сети использует команду **show cdp neighbors**, чтобы определить, есть ли ещё устройства.

```
S2#show cdp neighbors
Capability Codes: R - Router, T - Trans Bridge, B - Source Route Bridge
                  S - Switch, H - Host, I - IGMP, r - Repeater, P - Phone,
                  D - Remote, C - CVTA, M - Two-port Mac Relay

Device ID        Local Intrfce     Holdtme    Capability  Platform  Port ID
S1               Fas 0/1           150                S I NS03      Fas 0/1

Total cdp entries displayed : 1
```

К коммутатору S2 подключено только одно устройство — коммутатор S1. Следовательно, в топологии больше нет доступных для обнаружения устройств. Сетевой администратор может обновить документацию сети, указав в ней обнаруженные устройства.

<!-- 10.1.4 -->
<!-- syntax -->

