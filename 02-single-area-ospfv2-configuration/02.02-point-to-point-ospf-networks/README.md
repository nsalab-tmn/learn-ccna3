<!-- 2.2.1 -->
## Синтаксис команд

Одним из типов сети, использующей OSPF, является сеть «точка-точка». Указать интерфейсы, принадлежащие к данной сети, можно с помощью команды **network**. Для настройки OSPF непосредственно на интерфейсе используется команда **ip ospf**.

Обе команды используются для определения интерфейсов, участвующих в процессе маршрутизации для области OSPFv2. Базовый синтаксис команды **network** выглядит следующим образом:

```
Router(config-router)# network network-address wildcard-mask area area-id
```

Синтаксис шаблонной маски сетевого адреса используется для включения OSPF на интерфейсах. Любые интерфейсы на роутере, соответствующие сетевому адресу в сети, включаются для отправки и получения пакетов OSPF.
Синтаксис команды **area** area-id  связан с областью OSPF. При настройке OSPF для одной области, команда **network** должна иметь одинаковое значение _area-id_ на всех устройствах. Несмотря на то, что может использоваться любой идентификатор области, в случае OSPFv2 для одной области рекомендуется использовать идентификатор области 0. Применение этого соглашения упростит возможный в будущем переход на сеть с OSPFv2 для нескольких областей.

<!-- 2.2.2 -->
## Шаблонная маска

Шаблонная маска обычно является обратной маской подсети, настроенной на этом интерфейсе. В маске подсети двоичное значение 1 равно совпадению, а двоичное значение 0 не является совпадением. В отношении шаблонной маски верно обратное, как показано далее:

* **бит 0 шаблонной маски** — совпадает с соответствующим значением бита в адресе;
* **бит 1 шаблонной маски** — игнорирует соответствующее значение бита в адресе.

Простейший способ рассчитать шаблонную маску — вычесть маску подсети из 255.255.255.255, как показанно на примере для масок /24 и /26.

![](./assets/2.2.2.png)
<!-- /courses/ensa-dl/ae8e6570-34fd-11eb-ba19-f1886492e0e4/aeb32b80-34fd-11eb-ba19-f1886492e0e4/assets/c5a00af0-1c46-11ea-af56-e368b99e9723.svg -->

<!--
На рисунке показаны шаблонные маски для двух заданных масок подсети. Расчёт шаблонной маски для /24 Написано сверху 255.255.255.255. Маска подсети 255.255.255.0 вычитается внизу, в результате чего шаблонная маска - 0.0.0.255. Расчёт шаблонной маски для /26 Написано сверху 255.255.255.255. Маска подсети 255.255.255.192 вычитается внизу, в результате чего шаблонная маска - 0.0.0.63.
-->

<!-- 2.2.3 -->
<!-- ## Проверьте ваше понимание темы - шаблонные маски -->
<!-- quiz -->

<!-- 2.2.4 -->
## Настройка OSPF с помощью команды network

В режиме конфигурации маршрутизации существует два способа определения интерфейсов, которые будут участвовать в процессе маршрутизации OSPFv2. На рисунке показана  топология.

![](./assets/2.2.4.png)
<!-- /courses/ensa-dl/ae8e6570-34fd-11eb-ba19-f1886492e0e4/aeb32b80-34fd-11eb-ba19-f1886492e0e4/assets/c5a16a80-1c46-11ea-af56-e368b99e9723.svg -->

<!--
стандартная топология сети OSPFv2, используемая в этом модуле, как описано в 2.1.1
-->

В первом примере шаблонная маска определяет интерфейс на основе сетевых адресов. Любой активный интерфейс, настроенный с адресом IPv4, принадлежащим этой сети, будет участвовать в процессе маршрутизации OSPFv2.

```
R1(config)# router ospf 10
R1(config-router)# network 10.10.1.0 0.0.0.255 area 0
R1(config-router)# network 10.1.1.4 0.0.0.3 area 0
R1(config-router)# network 10.1.1.12 0.0.0.3 area 0
R1(config-router)#
```

**Примечание.** В некоторых версиях IOS можно указать маску подсети вместо шаблонной маски. После чего IOS преобразовывает маску подсети в формат шаблонной маски.

В качестве альтернативы на втором примере показано, как можно включить OSPFv2, указав точный адрес IPv4 интерфейса с помощью шаблонной маски из четырех нулей. При вводе команды **network 10.1.1.5 0.0.0.0 area 0** на R1 роутерр получает указание включить интерфейс Serial0/0/0 для процесса маршрутизации. В результате процесс OSPFv2 объявляет сеть, подключенную к этому интерфейсу (172.16.3.0/30).

```
R1(config)# router ospf 10
R1(config-router)# network 10.10.1.1 0.0.0.0 area 0
R1(config-router)# network 10.1.1.5 0.0.0.0 area 0
R1(config-router)# network 10.1.1.14 0.0.0.0 area 0
R1(config-router)#
```

Преимуществом определения интерфейса является отсутсвие необходимости в расчёте шаблонной маски. Обратите внимание, что во всех случаях **area** аргумент указывает область 0.

<!-- 2.2.5 -->
<!-- syntax -->

<!-- 2.2.6 -->
## Настройка OSPF с помощью команды ip ospf

Настроить OSPF можно как непосредственно на интерфейсе, так и с помощью  команды **network**. Чтобы настроить OSPF непосредственно на интерфейсе, используйте команду конфигурации интерфейса **ip ospf**. Синтаксис может выглядеть следующим образом:

```
Router(config-if)# ip ospf process-id area area-id
```

Для R1 удалите команды объявления сетей, используя форму **no** команды **network**. Затем перейдите к каждому интерфейсу и используйте команду **ip ospf**, как показано в окне команд.

```
R1(config)# router ospf 10
R1(config-router)# no network 10.10.1.1 0.0.0.0 area 0
R1(config-router)# no network 10.1.1.5 0.0.0.0 area 0
R1(config-router)# no network 10.1.1.14 0.0.0.0 area 0
R1(config-router)# interface GigabitEthernet 0/0/0
R1(config-if)# ip ospf 10 area 0
R1(config-if)# interface GigabitEthernet 0/0/1 
R1(config-if)# ip ospf 10 area 0
R1(config-if)# interface Loopback 0
R1(config-if)# ip ospf 10 area 0
R1(config-if)#
```

<!-- 2.2.7 -->
<!-- syntax -->

<!-- 2.2.8 -->
## Пассивный интерфейс

По умолчанию сообщения OSPF пересылаются из интерфейсов с включённым OSPF. При этом необходимо, чтобы эти сообщения отправлялись только из интерфейсов, подключенных к другим устройствам, использующим протокол OSPF.

См. топологию на рисунке. Сообщения OSPFv2 пересылаются через три loopback интерфейса, даже если в этих имитированных локальных сетях не существует соседа OSPFv2. В производственной сети эти замыкания будут физическими интерфейсами к сетям с пользователями и трафиком. Отправка ненужных сообщений в сеть LAN имеет следующие последствия для сети:

* **неэффективное использование пропускной способности** — доступная пропускная способность потребляется для передачи ненужных сообщений;
* **неэффективное использование ресурсов** — все устройства в сети LAN должны обработать сообщение и впоследствии удалить его;
* **повышенный риск безопасности** — без дополнительных конфигураций безопасности OSPF сообщения OSPF можно перехватывать с помощью программного обеспечения для перехвата пакетов. Обновления маршрутизации можно изменить и отправить обратно на роутер, что вызовет повреждение таблицы маршрутизации из-за ложных метрик, неверно направляющих трафик.

![](./assets/2.2.8.png)
<!-- /courses/ensa-dl/ae8e6570-34fd-11eb-ba19-f1886492e0e4/aeb32b80-34fd-11eb-ba19-f1886492e0e4/assets/c5a4c5e0-1c46-11ea-af56-e368b99e9723.svg -->

<!--
стандартная топология сети OSPFv2, используемая в этом модуле, как описано в 2.1.1
-->

<!-- 2.2.9 -->
## Настройка пассивных интерфейсов

Чтобы запретить передачу сообщений маршрутизации посредством интерфейса роутера и при этом разрешить объявление этой сети для других устройств, используйте команду режима конфигурации **passive-interface**, как показано на рис. 1. Конфигурация определяет интерфейс loopback 0/0/0 роутера R1 как пассивный.

Затем, с помощю команды **show ip protocols** проверяем, что интерфейс Loopback 0 указан как пассивный. Интерфейс по-прежнему указан под заголовком «Маршрутизация на интерфейсах, настроенных явно (область 0)», обозначая, что сеть включена в качестве записи маршрута в обновления OSPFv2, которые отправляются на R2 и R3.

```
R1(config)# router ospf 10
R1(config-router)# passive-interface loopback 0
R1(config-router)# end
R1#
*May 23 20:24:39.309: %SYS-5-CONFIG_I: Configured from console by console
R1# show ip protocols
*** IP Routing is NSF aware ***
(output omitted)
Routing Protocol is "ospf 10"
  Outgoing update filter list for all interfaces is not set
  Incoming update filter list for all interfaces is not set
  Router ID 1.1.1.1
  Number of areas in this router is 1. 1 normal 0 stub 0 nssa
  Maximum path: 4
  Routing for Networks:
  Routing on Interfaces Configured Explicitly (Area 0):
    Loopback0
    GigabitEthernet0/0/1
    GigabitEthernet0/0/0
  Passive Interface(s):
    Loopback0
  Routing Information Sources:
    Gateway         Distance      Last Update
    3.3.3.3              110      01:01:48
    2.2.2.2              110      01:01:38
  Distance: (default is 110)
R1#
```

<!-- 2.2.10 -->
<!-- syntax -->

<!-- 2.2.11 -->
## Сети OSPF типа «точка-точка»

Роутеры Cisco по умолчанию выбирают DR и BDR на интерфейсах Ethernet, даже если на канале имеется только одно другое устройство. Это можно проверить с помощью команды **show ip ospf interface**, как показано в примере для G0/0/0 R1.

```
R1# show ip ospf interface GigabitEthernet 0/0/0
GigabitEthernet0/0/0 is up, line protocol is up 
  Internet Address 10.1.1.5/30, Area 0, Attached via Interface Enable
  Process ID 10, Router ID 1.1.1.1, Network Type BROADCAST, Cost: 1
  Topology-MTID    Cost    Disabled    Shutdown      Topology Name
        0           1         no          no            Base
  Enabled by interface config, including secondary ip addresses
  Transmit Delay is 1 sec, State BDR, Priority 1
  Designated Router (ID) 2.2.2.2, Interface address 10.1.1.6
  Backup Designated router (ID) 1.1.1.1, Interface address 10.1.1.5
  Timer intervals configured, Hello 10, Dead 40, Wait 40, Retransmit 5
    oob-resync timeout 40
    Hello due in 00:00:08
  Supports Link-local Signaling (LLS)
  Cisco NSF helper support enabled
  IETF NSF helper support enabled
  Index 1/2/2, flood queue length 0
  Next 0x0(0)/0x0(0)/0x0(0)
  Last flood scan length is 1, maximum is 1
  Last flood scan time is 0 msec, maximum is 0 msec
  Neighbor Count is 1, Adjacent neighbor count is 1 
    Adjacent with neighbor 2.2.2.2  (Designated Router)
  Suppress hello for 0 neighbor(s)
R1#
```

R1 — BDR, а R2 — DR. Процесс выборов DR/BDR не нужен, так как в сети «точка-точка» между R1 и R2 может быть только два устройства. Обратите внимание на вывод — роутер назначил тип сети BROADCAST. Чтобы изменить это на сеть «точка-точка», используйте команду конфигурации интерфейса **ip ospf network point-to-point** на всех интерфейсах, где требуется отключить процесс выбора DR/BDR. В приведенном ниже примере показана эта конфигурация для R1. Состояние смежности OSPF будет уменьшаться в течение нескольких миллисекунд.

```
R1(config)# interface GigabitEthernet 0/0/0
R1(config-if)# ip ospf network point-to-point
*Jun  6 00:44:05.208: %OSPF-5-ADJCHG: Process 10, Nbr 2.2.2.2 on GigabitEthernet0/0/0 from FULL to DOWN, Neighbor Down: Interface down or detached
*Jun  6 00:44:05.211: %OSPF-5-ADJCHG: Process 10, Nbr 2.2.2.2 on GigabitEthernet0/0/0 from LOADING to FULL, Loading Done
R1(config-if)# interface GigabitEthernet 0/0/1
R1(config-if)# ip ospf network point-to-point 
*Jun  6 00:44:45.532: %OSPF-5-ADJCHG: Process 10, Nbr 3.3.3.3 on GigabitEthernet0/0/1 from FULL to DOWN, Neighbor Down: Interface down or detached
*Jun  6 00:44:45.535: %OSPF-5-ADJCHG: Process 10, Nbr 3.3.3.3 on GigabitEthernet0/0/1 from LOADING to FULL, Loading Done
R1(config-if)# end
R1# show ip ospf interface GigabitEthernet 0/0/0
GigabitEthernet0/0/0 is up, line protocol is up 
  Internet Address 10.1.1.5/30, Area 0, Attached via Interface Enable
  Process ID 10, Router ID 1.1.1.1, Network Type POINT_TO_POINT, Cost: 1
  Topology-MTID    Cost    Disabled    Shutdown      Topology Name
        0           1         no          no            Base
  Enabled by interface config, including secondary ip addresses
  Transmit Delay is 1 sec, State POINT_TO_POINT
  Timer intervals configured, Hello 10, Dead 40, Wait 40, Retransmit 5
    oob-resync timeout 40
    Hello due in 00:00:04
  Supports Link-local Signaling (LLS)
  Cisco NSF helper support enabled
  IETF NSF helper support enabled
  Index 1/2/2, flood queue length 0
  Next 0x0(0)/0x0(0)/0x0(0)
  Last flood scan length is 1, maximum is 2
  Last flood scan time is 0 msec, maximum is 1 msec
  Neighbor Count is 1, Adjacent neighbor count is 1 
    Adjacent with neighbor 2.2.2.2
  Suppress hello for 0 neighbor(s)
R1#
```

Обратите внимание, что интерфейс Gigabit Ethernet 0/0/0 теперь отображает тип сети как POINT\ _TO\ _POINT и что на канале нет DR или BDR.

<!-- 2.2.12 -->
## Loopback  и сети точка-точка

Для предоставления дополнительных интерфейсов для различных целей используется Loopback, позволяющий моделировать большее количество сетей, чем может поддерживать оборудование. По умолчанию интерфейсы loopback объявляются как хост-маршруты /32. Например, R1 будет объявлять сеть 10.10.1.0/24 как 10.10.1.1/32 R2 и R3.

```
R2# show ip route | include 10.10.1 
O        10.10.1.1/32 [110/2] via 10.1.1.5, 00:03:05, GigabitEthernet0/0/0
```

Для имитации реальной локальной сети интерфейс Loopback 0 настроен как сеть «точка-точка», R1 будет объявлять полную сеть 10.10.1.0/24 R2 и R3.

```
R1(config-if)# interface Loopback 0
R1(config-if)# ip ospf network point-to-point
```

R2 получает более точный, имитированный сетевой адрес 10.10.1.0/24.

```
R2# show ip route | include 10.10.1
O        10.10.1.0/24 [110/2] via 10.1.1.5, 00:00:30, GigabitEthernet0/0/0
```

**Примечание.** На момент написания этой статьи Packet Tracer не поддерживает команду **ip ospf network point-to-point** на интерфейсах Gigabit Ethernet. Тем не менее, он поддерживается на интерфейсах Loopback.

