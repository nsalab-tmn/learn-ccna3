# Индекс видео — рабочий фрагмент A (модули 01, 03, 08, 09)

Классификация и посценные сценарии 17 видео, встроенных в модули 01, 03, 08, 09 курса `learn-ccna3`. Все видео — перезалив роликов Cisco Networking Academy (ENSA) на канале оператора, май 2022, язык — английский. Координатор сольёт этот фрагмент и фрагмент B в `videos/README.md`.

## Таблица

| videoId | module/topic | Название (EN) | Длит. | Класс | Предложение по пересборке | Документ |
|---|---|---|---|---|---|---|
| EKLYuwycPQM | 01/01.02-ospf-packets | OSPF Packet Types | 5:49 | explainer | видео с генер. голосом ~2:30 (или 2 анимации) | [doc](01-single-area-ospfv2-concepts/01.02-ospf-packets--EKLYuwycPQM.md) |
| yNiUGbVP2Xc | 01/01.03-ospf-operation | OSPF Operation | 7:43 | explainer | видео с генер. голосом ~3:30 + анимация DR | [doc](01-single-area-ospfv2-concepts/01.03-ospf-operation--yNiUGbVP2Xc.md) |
| gDohT7qGeSs | 03/03.03-threat-actor-tools | Threat Actor Tools | 6:46 | explainer | текст + иллюстрация (или код-рендер ≤ 1:30) | [doc](03-network-security-concepts/03.03-threat-actor-tools--gDohT7qGeSs.md) |
| s1Zb4Si9glY | 03/03.05-common-network-attacks | Reconnaissance Attacks | 2:58 | explainer | текст + иллюстрация (≤ 1:00) | [doc](03-network-security-concepts/03.05-common-network-attacks--s1Zb4Si9glY.md) |
| zSvQp2erbbY | 03/03.05-common-network-attacks | Access and Social Engineering Attacks | 3:36 | explainer | текст + иллюстрация (≤ 1:30, защитный акцент) | [doc](03-network-security-concepts/03.05-common-network-attacks--zSvQp2erbbY.md) |
| aHUs-Q95deY | 03/03.05-common-network-attacks | Denial of Service Attacks | 2:03 | explainer | анимация Figma (≤ 60 с) | [doc](03-network-security-concepts/03.05-common-network-attacks--aHUs-Q95deY.md) |
| qgM_6SJwwP8 | 03/03.06-ip-vulnerabilities-and-threats | Common IP and ICMP Attacks | 4:33 | explainer | текст + иллюстрация (≤ 1:30) | [doc](03-network-security-concepts/03.06-ip-vulnerabilities-and-threats--qgM_6SJwwP8.md) |
| NbmzS--sOyU | 03/03.06-ip-vulnerabilities-and-threats | Amplification, Reflection and Spoofing Attacks | 3:29 | explainer | 2 анимации Figma (Smurf + CAM-спуфинг) | [doc](03-network-security-concepts/03.06-ip-vulnerabilities-and-threats--NbmzS--sOyU.md) |
| Y08C_0jFERY | 03/03.08-ip-services | ARP Spoofing | 5:21 | **lab-demo** | видео с генер. голосом ~2:30 + сценарий для симулятора | [doc](03-network-security-concepts/03.08-ip-services--Y08C_0jFERY.md) |
| YNfNWEeukWQ | 03/03.10-cryptography | Cryptography | 4:29 | explainer | видео с генер. голосом ~2:30 + текст | [doc](03-network-security-concepts/03.10-cryptography--YNfNWEeukWQ.md) |
| kPV8JZzD5iQ | 08/08.03-ipsec | IPsec Concepts | 6:39 | explainer | видео с генер. голосом ~3:00 (осовременить параметры) | [doc](08-vpn-and-ipsec-concepts/08.03-ipsec--kPV8JZzD5iQ.md) |
| mRSTH3Daj6E | 08/08.03-ipsec | IPsec Transport and Tunnel Modes | 1:51 | explainer | анимация Figma (≤ 60 с) | [doc](08-vpn-and-ipsec-concepts/08.03-ipsec--mRSTH3Daj6E.md) |
| s_4r5MBW_Uc | 09/09.01-network-transmission-quality | The Purpose of QoS | 3:06 | explainer | анимация Figma (≤ 60 с) / текст + иллюстрация | [doc](09-qos-concepts/09.01-network-transmission-quality--s_4r5MBW_Uc.md) |
| T9HlXNYJNdg | 09/09.02-traffic-characteristics | Traffic Characteristics | 2:49 | explainer | текст + иллюстрация (≤ 1:30) | [doc](09-qos-concepts/09.02-traffic-characteristics--T9HlXNYJNdg.md) |
| rmxOlo93MWo | 09/09.03-queuing-algorithms | QoS Algorithms | 1:35 | explainer | анимация Figma (≤ 60 с) | [doc](09-qos-concepts/09.03-queuing-algorithms--rmxOlo93MWo.md) |
| jdzgForIwzY | 09/09.04-qos-models | QoS Models | 4:29 | explainer | текст + иллюстрация (≤ 1:30) | [doc](09-qos-concepts/09.04-qos-models--jdzgForIwzY.md) |
| vL-ZYGViSJs | 09/09.05-qos-implementation-techniques | QoS Implementation Techniques | 8:32 | explainer | 2–3 анимации Figma / код-рендер ~3:30 | [doc](09-qos-concepts/09.05-qos-implementation-techniques--vL-ZYGViSJs.md) |

## Сводка

**Всего:** 17 видео. **По классам:** `explainer` — 16, `lab-demo` — 1, `marketing` — 0, `cli-basics` — 0, `other` — 0.

**Маркетинговых видео нет** — удалять ничего не требуется. Все 17 — технические (концепции с диаграммами/слайдами либо, в одном случае, демонстрация в Packet Tracer). Все подлежат пересборке как анимация / код-рендер с генерированным голосом.

**Самое ценное для симулятора:**
- **Y08C_0jFERY (ARP Spoofing, 03.08)** — единственный lab-demo: полный разбор в Packet Tracer с реальными командами ПК (`ipconfig /all`, `arp -a`, `ping`), командой коммутатора (`show mac address-table dynamic`), настройкой интерфейса и встроенным анализатором. Документ содержит готовый сценарий сессии с фактическими адресами/MAC и добавленными контрмерами (DHCP Snooping + Dynamic ARP Inspection, Port Security) — прямое семя тренинга.
- Косвенно питают CLI-лабы (семена сессий добавлены в документы): **NbmzS--sOyU** (MAC/CAM-спуфинг → Port Security), **rmxOlo93MWo** (CBWFQ/LLQ через MQC), **vL-ZYGViSJs** (классификация/маркировка DSCP, шейпинг через MQC), **kPV8JZzD5iQ** (пролог к настройке site-to-site IPsec VPN). Сами по себе эти ролики — explainer без CLI; CLI-материал вынесен в предложения по пересборке.

**Самые ценные для контент-библиотеки (чистые концепты, хорошо лягут в анимацию):** OSPF-пакеты и работа OSPF (01.02/01.03), транспортный/туннельный режим IPsec (08.03 mRSTH3Daj6E), алгоритмы очередей (09.03), последовательность QoS и маркировка DSCP (09.05).

**Фактические неточности в оригиналах (исправить при пересборке):**
- **EKLYuwycPQM (01.02):** на слайде LSA строка «тип 6» ошибочно содержит текст «Acknowledges the other packet types» (копия описания LSAck); правильно тип 6 — MOSPF. Диктор говорит, что LSAck подтверждает «всё, кроме Hello и Ack» — точнее «LSAck подтверждает LSU/LSA». Текст темы 1.2.2 говорит «7 типов LSA», верно — 11.
- **yNiUGbVP2Xc (01.03):** в анимации лавины LSA источник подписан R3, а диктор говорит «R2»; ExStart в таблице помечен «on point-to-point» (неточно); слайд «The Need for a DR» использует 4 роутера (6 смежностей), текст — 5 (10). Router ID назван «IP-адресом».
- **s1Zb4Si9glY (03.05) и zSvQp2erbbY (03.05):** демонстрации построены на реальном бренде/домене **Cisco** (whois cisco.com; фишинг «от Cisco HR» с покупкой похожего домена) — при пересборке заменить на вымышленную организацию и усилить защитный акцент.
- **NbmzS--sOyU (03.06):** классический Smurf использует directed broadcast, а не multicast (в ролике «multicast or broadcast»). Современные amplification/reflection — на DNS/NTP (есть в тексте 3.6.5, нет в видео).
- **qgM_6SJwwP8 (03.06):** видео не упоминает DNS/NTP-умножение (есть в тексте).
- **Y08C_0jFERY (03.08):** демонстрируется не классическое отравление ARP-кеша gratuitous-ARP, а отравление таблицы MAC (CAM) коммутатора поддельным source-MAC (автор прямо оговаривает, что gratuitous ARP в Packet Tracer недоступен); защита (DAI/DHCP Snooping) не показана.
- **kPV8JZzD5iQ (08.03):** устаревшие параметры — DH 1/2/5, MD5/SHA-1, 3DES (текст 8.3.5/8.3.7 рекомендует SHA-256+, AES, DH14+/DH24).
- **rmxOlo93MWo (09.03):** на слайде LLQ порядок выхода подписан «2 1 3 4 V V» — голос должен выходить **первым** («V V 4 3 1 2», как в тексте 9.3.6).
- **vL-ZYGViSJs (09.05) и T9HlXNYJNdg (09.02):** без ошибок, но видео опускают детали из текста (DSCP BE/EF/AF и формулу AFxy; полные пороги задержки/джиттера для голоса/видео).

**Дефекты загрузки (сказать оператору, не критично для пересборки):**
- **YNfNWEeukWQ (03.10, Cryptography):** видеодорожка MP4 обрывается на ~2:06, аудио/субтитры идут до 4:29; концовка (расшифровка + сводка четырёх элементов) восстановлена по транскрипту.
- **T9HlXNYJNdg (09.02, Traffic Characteristics):** видеодорожка дефектна — один статичный слайд «Data Traffic Factors» на все 2:49 (все кадры байт-в-байт идентичны); слайды о голосе/видео/графиках в дорожке отсутствуют, восстановлены по транскрипту и SVG курса.
- **mRSTH3Daj6E (08.03):** видеодорожка до ~1:49 при аудио 1:51 — содержание не теряется.
