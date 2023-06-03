<!-- 10.2.1 -->
## Общие сведения о протоколе LLDP

Протокол обнаружения уровня канала (LLDP) делает то же, что и CDP, но не только на устройствах Cisco. В качестве бонуса вы можете использовать его, если у вас есть устройства Cisco. Так или иначе, вы получите карту сети.

LLDP — протокол обнаружения соседей, который не зависит от производителя. Он работает с сетевыми устройствами: маршрутизаторами, коммутаторами и точкасм доступа к беспроводной сети LAN. Этот протокол объявляет себя и свои возможности другим устройствам и получает данные от физически подключенных устройств уровня 2.

![](./assets/10.2.1.svg)
<!-- /courses/ensa-dl/ae8eb392-34fd-11eb-ba19-f1886492e0e4/aeb5eaa0-34fd-11eb-ba19-f1886492e0e4/assets/c6ac98f0-1c46-11ea-af56-e368b99e9723.svg -->

<!--
На рисунке показаны объявления протокола LLDP (Link Layer Discovery Protocol), отправляемые между маршрутизатором и коммутатором, подключенным напрямую. Стрелка, помеченная как LLDP, указывает от коммутатора на маршрутизатор, а другая стрелка указывает обратное направление. Стрелки указывают на периодические рекламные объявления LLDP, отправляемые между двумя устройствами.
-->

<!-- 10.2.2 -->
## Настройка и проверка протокола LLDP

На некоторых устройствах протокол LLDP включен по умолчанию. Чтобы включить LLDP для всех интерфейсов сетевого устройства Cisco, введите команду **lldp run** в режиме глобальной конфигурации, а чтобы отключить, введите команду **no lldp run**.

Как и протокол CDP, LLDP можно включить и отключить на конкретных интерфейсах. Но передачу и прием пакетов LLDP нужно настраивать отдельно, как показано на рисунке.

Чтобы убедиться, что протокол LLDP включен на устройстве, введите команду **show lldp** в привилегированном режиме EXEC.

```
Switch# conf t
Enter configuration commands, one per line.  End with CNTL/Z.
Switch(config)# lldp run
Switch(config)# interface gigabitethernet 0/1
Switch(config-if)# lldp transmit
Switch(config-if)# lldp receive
Switch(config-if)# end
Switch# show lldp
Global LLDP Information:
    Status: ACTIVE
    LLDP advertisements are sent every 30 seconds
    LLDP hold time advertised is 120 seconds
    LLDP interface reinitialisation delay is 2 seconds
```

<!-- 10.2.3 -->
## Поиск устройств с помощью LLDP

Предположим, что документация по топологии, показанной на рисунке, отсутствует. Сетевой администратор знает только, что коммутатор S1 подключен к двум устройствам.

![](./assets/10.2.3-1.svg)
<!-- /courses/ensa-dl/ae8eb392-34fd-11eb-ba19-f1886492e0e4/aeb5eaa0-34fd-11eb-ba19-f1886492e0e4/assets/c6ad0e23-1c46-11ea-af56-e368b99e9723.svg -->

<!--
На рисунке показан коммутатор S1, соединенный с двумя облаками, обозначенными вопросительными знаками. Облака подключены к коммутатору по одному с каждой стороны.
-->

При включенном LLDP соседние устройства можно обнаружить с помощью команды **show lldp neighbors**, как показано в выходных данных.

```
S1# show lldp neighbors
Capability codes:
    (R) Router, (B) Bridge, (T) Telephone, (C) DOCSIS Cable Device
    (W) WLAN Access Point, (P) Repeater, (S) Station, (O) Other
Device ID           Local Intf     Hold-time  Capability      Port ID
R1                  Fa0/5          117        R               Gi0/0/1
S2                  Fa0/1          112        B               Fa0/1
Total entries displayed: 2
```

Сетевой администратор узнает, что у S1 два соседних устройства: маршрутизатор и коммутатор. В этих выходных данных буква B (от слова bridge — мост) может также означать коммутатор.

Из результатов **show lldp neighbors** можно построить топологию из коммутатора S1, как показано на рисунке.

![](./assets/10.2.3-2.svg)
<!-- /courses/ensa-dl/ae8eb392-34fd-11eb-ba19-f1886492e0e4/aeb5eaa0-34fd-11eb-ba19-f1886492e0e4/assets/c6ad5c40-1c46-11ea-af56-e368b99e9723.svg -->

<!--
На рисунке показан маршрутизатор с меткой R1, подключенный к коммутатору S1. S1 подключен к другому коммутатору с надписью S2.
-->

Если нужна более подробная информация о соседних устройствах, можно воспользоваться командой **show lldp neighbors detail**, которая предоставляет такие сведения, как версии IOS, IP-адреса и функции соседних устройств.

```
S1# show lldp neighbors detail
------------------------------------------------
Chassis id: 848a.8d44.49b0
Port id: Gi0/0/1
Port Description: GigabitEthernet0/0/1
System Name: R1
  
System Description:
Cisco IOS Software [Fuji], ISR Software (X86_64_LINUX_IOSD-UNIVERSALK9-M), Version 16.9.4, RELEASE SOFTWARE (fc2)
Technical Support: http://www.cisco.com/techsupport
Copyright (c) 1986-2019 by Cisco Systems, Inc.
Compiled Thu 22-Aug-19 18:09 by mcpre
  
Time remaining: 111 seconds
System Capabilities: B,R
Enabled Capabilities: R
Management Addresses - not advertised
Auto Negotiation - not supported
Physical media capabilities - not advertised
Media Attachment Unit type - not advertised
Vlan ID: - not advertised
  
------------------------------------------------
Chassis id: 0025.83e6.4b00
Port id: Fa0/1
Port Description: FastEthernet0/1
System Name: S2
  
System Description:
Cisco IOS Software, C2960 Software (C2960-LANBASEK9-M), Version 15.0(2)SE4, RELEASE SOFTWARE (fc1)
Technical Support: http://www.cisco.com/techsupport
Copyright (c) 1986-2013 by Cisco Systems, Inc.
Compiled Wed 26-Jun-13 02:49 by prod_rel_team
  
Time remaining: 107 seconds
System Capabilities: B
Enabled Capabilities: B
Management Addresses - not advertised
Auto Negotiation - supported, enabled
Physical media capabilities:
    100base-TX(FD)
    100base-TX(HD)
    10base-T(FD)
    10base-T(HD)
Media Attachment Unit type: 16
Vlan ID: 1
  
Total entries displayed: 2
```

<!-- 10.2.4 -->
<!-- syntax -->

