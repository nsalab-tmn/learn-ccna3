<!-- 2.5.1 -->
## Передача статического маршрута по умолчанию в OSPFv2

Пользователям сети необходимо будет отправлять пакеты из сети в сети, не входящие в OSPF, например в Интернет. Здесь вам нужно будет иметь статический маршрут по умолчанию, который они могут использовать. В топологии на рисунке R2 подключен к Интернету и должен распространять маршрут по умолчанию на R1 и R3. Роутер, подключенный к Интернету, иногда называют пограничным или роутером шлюза. Однако в терминологии OSPF роутер, расположенный между доменом маршрутизации OSPF и сетью без OSPF, также называют граничным роутером автономной системы (ASBR).

![](./assets/2.5.1.svg)
<!-- /courses/ensa-dl/ae8e6570-34fd-11eb-ba19-f1886492e0e4/aeb32b86-34fd-11eb-ba19-f1886492e0e4/assets/c5be1a42-1c46-11ea-af56-e368b99e9723.svg -->

<!--
стандартная топология сети OSPFv2, используемая в этом модуле, как описано в 2.1.1
-->

Все, что нужно R2 для получения доступа к Интернету — это статический маршрут по умолчанию к оператору связи.

**Примечание**. в этом примере интерфейс loopback с адресом IPv4 209.165.200.225 используется для имитации подключения к поставщику услуг.

Для распространения маршрута по умолчанию на граничном устройстве (R2) должны быть настроены:

* **команда ip route 0.0.0.0 0.0.0.0** {ip-addres | exit-intf}.
Применить команду конфигурации устройства * The **default-information originate**. Благодаря этому параметру R2 становится источником информации о маршруте по умолчанию и распространяет статический маршрут по умолчанию в обновлениях OSPF.

В следующем примере R2 настроен с замыканием на себя для имитации подключения к Интернету. Затем маршрут по умолчанию настраивается и распространяется на все другие устройства OSPF в домене маршрутизации.

**Примечание**. При настройке статических маршрутов рекомендуется использовать IP-адрес следующего перехода. Однако при моделировании подключения к Интернету не существует IP-адреса следующего перехода. Поэтому мы используем аргумент _exit-intf_.

```
R2(config)# interface lo1
R2(config-if)# ip address 64.100.0.1 255.255.255.252 
R2(config-if)# exit
R2(config)# ip route 0.0.0.0 0.0.0.0 loopback 1
%Default route without gateway, if not a point-to-point interface, may impact performance
R2(config)# router ospf 10
R2(config-router)# default-information originate
R2(config-router)# end
R2#
```

<!-- 2.5.2 -->
## Проверка распространяемого маршрута по умолчанию

Проверьте настройки маршрута по умолчанию с помощью команды **show ip route**. Убедитесь, что R1 и R3 получили маршрут по умолчанию.

Обратите внимание, что источником маршрута является **O\*E2**, значит маршрут был получен с помощью протокола OSPFv2. Звездочка указывает, что это хороший кандидат для маршрута по умолчанию. Обозначение E2 означает, что это внешний маршрут. Значение E1 и E2 выходит за рамки данного модуля.

**Таблица маршрутизации R2**

```
R2# show ip route | begin Gateway
Gateway of last resort is 0.0.0.0 to network 0.0.0.0
S*    0.0.0.0/0 is directly connected, Loopback1
      10.0.0.0/8 is variably subnetted, 9 subnets, 3 masks
C        10.1.1.4/30 is directly connected, GigabitEthernet0/0/0
L        10.1.1.6/32 is directly connected, GigabitEthernet0/0/0
C        10.1.1.8/30 is directly connected, GigabitEthernet0/0/1
L        10.1.1.9/32 is directly connected, GigabitEthernet0/0/1
O        10.1.1.12/30 [110/40] via 10.1.1.10, 00:48:42, GigabitEthernet0/0/1
                      [110/40] via 10.1.1.5, 00:59:30, GigabitEthernet0/0/0
O        10.10.1.0/24 [110/20] via 10.1.1.5, 00:59:30, GigabitEthernet0/0/0
C        10.10.2.0/24 is directly connected, Loopback0
L        10.10.2.1/32 is directly connected, Loopback0
O        10.10.3.0/24 [110/20] via 10.1.1.10, 00:48:42, GigabitEthernet0/0/1
      64.0.0.0/8 is variably subnetted, 2 subnets, 2 masks
C        64.100.0.0/30 is directly connected, Loopback1
L        64.100.0.1/32 is directly connected, Loopback1
R2#
```

**Таблица маршрутизации R1**

```
R1# show ip route | begin Gateway
Gateway of last resort is 10.1.1.6 to network 0.0.0.0
O*E2  0.0.0.0/0 [110/1] via 10.1.1.6, 00:11:08, GigabitEthernet0/0/0
      10.0.0.0/8 is variably subnetted, 9 subnets, 3 masks
C        10.1.1.4/30 is directly connected, GigabitEthernet0/0/0
L        10.1.1.5/32 is directly connected, GigabitEthernet0/0/0
O        10.1.1.8/30 [110/20] via 10.1.1.6, 00:58:59, GigabitEthernet0/0/0
C        10.1.1.12/30 is directly connected, GigabitEthernet0/0/1
L        10.1.1.14/32 is directly connected, GigabitEthernet0/0/1
C        10.10.1.0/24 is directly connected, Loopback0
L        10.10.1.1/32 is directly connected, Loopback0
O        10.10.2.0/24 [110/20] via 10.1.1.6, 00:58:59, GigabitEthernet0/0/0
O        10.10.3.0/24 [110/30] via 10.1.1.6, 00:48:11, GigabitEthernet0/0/0
R1#
```

**Таблица маршрутизации R3**

```
R3# show ip route | begin Gateway
Gateway of last resort is 10.1.1.9 to network 0.0.0.0
O*E2  0.0.0.0/0 [110/1] via 10.1.1.9, 00:12:04, GigabitEthernet0/0/1
      10.0.0.0/8 is variably subnetted, 9 subnets, 3 masks
O        10.1.1.4/30 [110/20] via 10.1.1.9, 00:49:08, GigabitEthernet0/0/1
C        10.1.1.8/30 is directly connected, GigabitEthernet0/0/1
L        10.1.1.10/32 is directly connected, GigabitEthernet0/0/1
C        10.1.1.12/30 is directly connected, GigabitEthernet0/0/0
L        10.1.1.13/32 is directly connected, GigabitEthernet0/0/0
O        10.10.1.0/24 [110/30] via 10.1.1.9, 00:49:08, GigabitEthernet0/0/1
O        10.10.2.0/24 [110/20] via 10.1.1.9, 00:49:08, GigabitEthernet0/0/1
C        10.10.3.0/24 is directly connected, Loopback0
L        10.10.3.1/32 is directly connected, Loopback0
R3#
```

