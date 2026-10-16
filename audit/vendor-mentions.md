# Аудит упоминаний вендора — CCNA3 (ENSA)

Задача: [nsalab-tmn/learn-ccna3#33](https://github.com/nsalab-tmn/learn-ccna3/issues/33). Только аудит — в материалах ничего не изменено, каталог `audit/` — единственное добавление.

- `audit/vendor-mentions.csv` — карта: по строке на вхождение (правила гранулярности — §7).
- `audit/vendor-mentions.md` — этот отчёт: итоги, топ-20, решения для оператора, покрытие, сверка полноты и итоговый словарь.

Срез: `main` @ `8adfd90` (2026-10-16). Всего строк карты: **2046** (для обучающегося — 1291, служебных — 755). Попаданий поиска по словарю: **9868** (+ 192 в именах файлов/каталогов, + 208 в OCR картинок) — каждое попадание сведено либо в строку карты, либо в «исключено» с причиной (§5).

## 1. Итоги

### По категориям

| category | для обучающегося | служебные | всего |
|---|---:|---:|---:|
| `brand` | 210 | 46 | 256 |
| `certification` | 7 | 326 | 333 |
| `marketing` | 24 | 4 | 28 |
| `product` | 385 | 154 | 539 |
| `model` | 127 | 18 | 145 |
| `cli-vendor-string` | 51 | 0 | 51 |
| `proprietary-tech` | 324 | 29 | 353 |
| `visual` | 109 | 17 | 126 |
| `link` | 46 | 3 | 49 |
| `lab-infra` | 7 | 146 | 153 |
| `legal` | 1 | 12 | 13 |
| **всего** | **1291** | **755** | **2046** |

### По поверхностям

| surface | строк | для обучающегося | служебные |
|---|---:|---:|---:|
| `text` | 639 | 639 | 0 |
| `code` | 139 | 139 | 0 |
| `comment` | 442 | 0 | 442 |
| `quiz` | 387 | 325 | 62 |
| `metadata` | 39 | 33 | 6 |
| `filename` | 51 | 7 | 44 |
| `illustration` | 16 | 16 | 0 |
| `animation` | 1 | 1 | 0 |
| `raster` | 145 | 129 | 16 |
| `lab-infra` | 79 | 1 | 78 |
| `internal-doc` | 107 | 0 | 107 |
| `figma-library` | 1 | 1 | 0 |

HTML-комментарии `<!-- -->` в README помечены `audience: internal` (не отображаются обучающемуся), но лежат в материалах и внесены построчно, как требует задача.

### По модулям

| модуль | строк | для обучающегося | служебные | основные категории |
|---|---:|---:|---:|---|
| `(root)` | 137 | 1 | 136 | product 76, certification 26, visual 17, brand 9 |
| `01-single-area-ospfv2-concepts` | 27 | 6 | 21 | certification 21, proprietary-tech 3, brand 3 |
| `02-single-area-ospfv2-configuration` | 121 | 54 | 67 | lab-infra 36, product 22, certification 20, cli-vendor-string 20 |
| `01-02-exam` | 27 | 27 | 0 | brand 12, visual 8, product 3, proprietary-tech 3 |
| `03-network-security-concepts` | 128 | 77 | 51 | product 53, certification 37, link 20, brand 11 |
| `04-acl-concepts` | 21 | 9 | 12 | certification 7, product 5, brand 4, lab-infra 4 |
| `05-acls-for-ipv4-configuration` | 75 | 32 | 43 | lab-infra 27, product 18, certification 9, visual 7 |
| `03-05-exam` | 18 | 18 | 0 | visual 13, brand 5 |
| `06-nat-for-ipv4` | 61 | 19 | 42 | lab-infra 27, certification 16, product 8, visual 6 |
| `07-wan-concepts` | 41 | 4 | 37 | certification 31, product 4, lab-infra 4, visual 1 |
| `08-vpn-and-ipsec-concepts` | 68 | 33 | 35 | proprietary-tech 27, certification 24, product 10, brand 7 |
| `06-08-exam` | 43 | 43 | 0 | product 13, proprietary-tech 11, visual 8, brand 7 |
| `09-qos-concepts` | 38 | 15 | 23 | certification 23, product 7, proprietary-tech 4, brand 3 |
| `10-network-management` | 537 | 464 | 73 | proprietary-tech 196, product 108, brand 73, model 61 |
| `11-network-design` | 163 | 111 | 52 | model 36, proprietary-tech 26, certification 25, visual 25 |
| `12-network-troubleshooting` | 121 | 80 | 41 | proprietary-tech 30, product 29, certification 29, brand 11 |
| `09-12-exam` | 72 | 72 | 0 | product 27, proprietary-tech 16, model 12, brand 7 |
| `13-network-virtualization` | 125 | 87 | 38 | product 76, certification 21, model 10, proprietary-tech 7 |
| `14-network-automation` | 86 | 66 | 20 | brand 30, product 27, certification 15, link 11 |
| `13-14-exam` | 23 | 23 | 0 | product 14, model 4, proprietary-tech 4, brand 1 |
| `final-lab` | 14 | 12 | 2 | product 10, certification 2, lab-infra 2 |
| `final-exam` | 36 | 36 | 0 | product 10, visual 8, brand 7, model 7 |
| `(all)` | 2 | 2 | 0 | visual 2 |
| `final-test` | 62 | 0 | 62 | brand 22, proprietary-tech 16, product 12, model 5 |

`(root)` — корневые файлы курса и служебные каталоги (`figma-assets.json`, `migration-instructions.md`, `ccna3-labs.md`, `readme-assets/`, `packet-tracer-source-files/`, `animations/`); `(all)` — сквозные решения по стилю (иконки, текстуры).

### По предлагаемым действиям

| action | строк |
|---|---:|
| `replace` | 814 |
| `decide` | 451 |
| `remove` | 396 |
| `neutralize` | 367 |
| `keep` | 18 |

## 2. Топ-20 самых «вендорных» материалов

Считаются строки с `audience: learner`; экзамены и квизы — как отдельные материалы.

| # | материал | строк | разбивка |
|---:|---|---:|---|
| 1 | `10-network-management/10.01-device-discovery-with-cdp` | 77 | proprietary-tech 62, model 7, brand 4, cli-vendor-string 2, product 1, link 1 |
| 2 | `09-12-exam` | 72 | product 27, proprietary-tech 16, model 12, brand 7, marketing 5, visual 4, link 1 |
| 3 | `10-network-management/10.06-router-and-switch-file-maintenance` | 48 | proprietary-tech 17, product 10, model 7, brand 6, cli-vendor-string 6, link 1, visual 1 |
| 4 | `10-network-management/10.07-ios-image-management` | 46 | product 20, model 16, cli-vendor-string 8, brand 1, link 1 |
| 5 | `10-network-management/10.07.06-lab-use-a-tftp-server-to-upgrade-a-cisco-ios-image` | 46 | product 23, model 15, brand 4, cli-vendor-string 2, link 1, visual 1 |
| 6 | `06-08-exam` | 43 | product 13, proprietary-tech 11, visual 8, brand 7, model 4 |
| 7 | `10-network-management/10.09-summary` | 43 | proprietary-tech 21, product 11, brand 8, link 3 |
| 8 | `13-network-virtualization/13.05-controllers` | 37 | product 29, brand 4, model 2, visual 2 |
| 9 | `final-exam` | 36 | product 10, visual 8, brand 7, model 7, proprietary-tech 4 |
| 10 | `10-network-management/10.08.04-quiz` | 35 | proprietary-tech 16, brand 13, model 3, product 3 |
| 11 | `14-network-automation/14.06-ibn-and-cisco-dna-center` | 33 | brand 18, product 13, marketing 1, visual 1 |
| 12 | `10-network-management/10.01.05-lab-use-cdp-to-map-a-network` | 31 | proprietary-tech 29, brand 1, visual 1 |
| 13 | `11-network-design/11.03-switch-hardware` | 31 | visual 16, model 10, product 5 |
| 14 | `01-02-exam` | 27 | brand 12, visual 8, product 3, proprietary-tech 3, cli-vendor-string 1 |
| 15 | `10-network-management/10.06.13-lab-research-and-execute-password-recovery-procedures-physical-mode` | 27 | proprietary-tech 14, brand 7, product 3, model 3 |
| 16 | `11-network-design/11.04-router-hardware` | 24 | brand 8, visual 8, model 6, link 2 |
| 17 | `13-14-exam` | 23 | product 14, model 4, proprietary-tech 4, brand 1 |
| 18 | `03-network-security-concepts/03.09-network-security-best-practices` | 22 | product 22 |
| 19 | `03-network-security-concepts/03.09.06-network-security-best-practices-quiz` | 22 | product 22 |
| 20 | `03-network-security-concepts/03.08.08-lab-explore-dns-traffic` | 20 | link 20 |

## 3. Решения для оператора

Сгруппировано по типам решений, а не по строкам. В скобках — сколько строк карты затрагивает решение и примеры id; полный список — фильтром CSV по `term`/`category`/`action`.

### 3.1. Название курса, репозитория и тег «Cisco»

- **Тег `"Cisco"`** в `material-tags.json` (одна строка, ccna3-vm-0006) ставится **всем** материалам курса через `$ref`. Предложение: удалить тег (или заменить нейтральным, напр. `"Enterprise"`). Самое дешёвое и самое заметное изменение.
- **Видимое обучающемуся название уже нейтрально** («Корпоративные сети, безопасность и автоматизация сети»). «CCNA/ENSA» остаётся в: названии `final-test` («Финальный экзамен CCNA3» — сам `final-test` не подключён к курсу), `final-lab` («… (ENSA-F1)», `shortName: ensa-f1`), фразах «в рамках … экзамена CCNA», «в ходе изучения CCNA» (7 строк для обучающегося, напр. ccna3-vm-0264, ccna3-vm-0522, ccna3-vm-1520, ccna3-vm-1588 … (всего 7)).
- **Внутренние идентификаторы**: репозиторий `learn-ccna3`, id ассетов `ccna3-*` (363), листы Figma «CCNA3 · …» (306 + 21 в `tracks.json`), каталоги `animations/ccna3-*`, URL в `assessment.json` 37 лаб, ссылки на `learn-ccna1` в служебных документах (326 служебных строк). Предложение: **не переименовывать** идентификаторы контракта figma ↔ git (дорого, ломает историю и связи), переименовать только видимое; если курс переименовывается целиком — отдельная миграция.
- HTML-комментарии с путями исходного курса `/courses/ensa-dl/…` (297 строк, ccna3-vm-0138, ccna3-vm-0139, ccna3-vm-0140 … (всего 297)) — служебный след миграции, предложение: удалить массово одним PR.

### 3.2. Проприетарные протоколы и технологии

- **CDP** (170 строк: раздел 10.1 целиком, лабы 10.1.5 и 10.8.1, квизы, экзамены, выводы `show cdp …`, фигура 10.1.1, растр 09-12-exam/3.PNG). Варианты: (a) оставить CDP как учебную тему с пометкой «проприетарный протокол производителя», основным сделать LLDP (раздел 10.2 и лаба 10.2.6 уже есть); (b) свести 10.1 в абзац «проприетарные аналоги LLDP», лабу 10.1.5 перевести на LLDP. Рекомендация: (b) — LLDP покрывает те же цели обучения, а learn-netsim не обязан эмулировать CDP.
- **EIGRP** (16 строк — коды маршрутов `D - EIGRP`, ключевые слова ACL `eigrp`, дистракторы в квизах). Учебной темы в CCNA3 нет. Рекомендация: оставить как название протокола (RFC 7868, реализуется в learn-netsim clean-room), убрать бренд («Cisco's EIGRP routing protocol» в выводе `access-list … ?`).
- **EtherChannel** (47 строк) — торговое название Cisco для агрегирования каналов. Рекомендация: в тексте «агрегирование каналов (LAG, IEEE 802.1AX / LACP)»; синтаксис `show etherchannel`/`channel-group` — решение вместе с CLI NetOS.
- **DMVPN** (51 строка, в основном квизы/экзамены модуля 08) — проприетарное решение. Варианты: обобщить («динамические многоточечные VPN: mGRE + NHRP + IPsec») или оставить с пометкой «решение производителя».
- **PVST+, PAgP, HSRP, VTP, LWAPP, UDLD** (12 строк, дистракторы и фрагменты вывода). Рекомендация: заменить открытыми аналогами (Rapid PVST+ → RSTP/MSTP, PAgP → LACP, HSRP → VRRP, LWAPP → CAPWAP).
- **Фирменные названия функций**: CEF, NSF, NBAR, NetFlow, IP SLA (43 строки). Рекомендация: CEF → «FIB + таблица смежности», NSF → graceful restart (RFC 3623), NBAR → DPI-классификация, NetFlow → IPFIX (RFC 7011), IP SLA → «активный мониторинг/зондирование».
- **ROMMON / регистр конфигурации** (`confreg 0x2142`, `config-register 0x2102`; 42 строки: 10.6, лаба 10.6.13, экзамены). Это механизм восстановления пароля конкретного вендора. Нужно решение: эмулировать аналог в NSALAB NetOS (режим восстановления) или переписать тему как общий принцип «восстановление доступа через загрузчик».

### 3.3. Модели оборудования и имена образов

- 145 строк `model`: 1941/2911/2960/3560/3650/4221/4321/4331, `WS-C…`, `ISR…/K9`, имена образов `c1900-universalk9-mz.SPA.15x…bin`, `isr4200-universalk9_ias.16.09.04.SPA.bin`, `c2960-lanbasek9-mz…`, `sdmconfig-1841.cfg`, Nexus 9000/9300/9500, Catalyst 2960-C/3850/9400.
- Предложение по идентичности learn-netsim: маршрутизаторы → **NR01/NR02**, коммутатор → **NS01**, ПК → **NPC**, ОС → **NSALAB NetOS**; имена образов — единый шаблон NetOS (напр. `netos-nr01-<версия>.bin`), версии — по выпуску learn-netsim. Выводы `show version`/`show cdp neighbors detail`/`dir flash:` и баннеры (`cli-vendor-string`, 51 строка) переписать как вывод NetOS одним проходом.
- **Модуль 11.3–11.4 («Аппаратное обеспечение коммутаторов/маршрутизаторов»)** по сути — каталог продуктов Cisco: текст (Catalyst/Nexus/Meraki/ISR/ASR/NCS/IR) + 24 фото оборудования (25 строк `visual` по фото). Решение: переписать как классы платформ (кампус / ЦОД / оператор / промышленные; фиксированные / модульные / стекируемые) и заменить фото 7 нейтральными фигурами (как в `design/raster-inventory-ccna3.md`).

### 3.4. Cisco IOS и Packet Tracer как названия продуктов

- **IOS / IOS XE** (185 строк `product`; синтаксис команд в стиле IOS по условиям задачи не учитывался). Рекомендация: «Cisco IOS» → **NSALAB NetOS** там, где речь о нашей ОС/симуляторе, и «ОС сетевого устройства» там, где речь об ОС вообще («образ IOS» → «образ ОС»). Каталоги `10.07-ios-image-management`, `10.07.06-lab-use-a-tftp-server-to-upgrade-a-cisco-ios-image` — переименовать вместе с темой.
- **Packet Tracer**: 38 лаб на PT (включая `final-lab`; `deploy/pt-lab`, `.pka`, оценка `validate_web_response http://{pt-url}:{pt-api-port}`), 39 исходных `.docx`, 37 HTML-комментариев «Скачать файл Packet Tracer», 33 строки текста/кода с PT (инструкции по GUI: «Check Results», режим симуляции, «в Packet Tracer интерфейс…»), 28 скриншотов топологий PT, подписи `Server-PT`, домены `.pka`. **Переведённых на learn-netsim лаб в CCNA3 нет** (эталон — learn-ccna1 16.4.6). Предложение: замена по ADR `decisions/packet-tracer-substitution.md`; тексты лаб переписывать при переводе каждой лабы, а не отдельным проходом.

### 3.5. Продукты в модулях 13–14 (SDN, IBN) и безопасности

- **13.5 «Контроллеры»** построен вокруг Cisco ACI / APIC / APIC-EM / Nexus 9000, плюс onePK, UCS, FabricPath; **14.6 «IBN и Cisco DNA Center»** — вокруг DNA Center / SD-Access / ISE / TrustSec (160 строк, включая квизы 13.6.3, 14.7.2 и экзамен 13-14). Варианты: (a) обобщить до классов решений («SDN-контроллер на основе политик», «контроллер IBN») и дать один нейтральный пример реализации с явной атрибуцией; (b) оставить как кейс-стади «пример реализации вендора» с пометкой. Рекомендация: (a) — термины ANP, spine–leaf, northbound/southbound API, intent/assurance вендоро-независимы.
- **Безопасность**: ASA, ESA/WSA, AnyConnect, ASDM, Talos, OpenDNS (74 строки; 3.9, квиз 3.9.6, 8.1–8.2, экзамены). Рекомендация: родовые названия — «межсетевой экран», «шлюз безопасности почты», «веб-прокси», «VPN-клиент», «служба репутации/аналитики угроз», «защищённый DNS».
- **«Сети без границ Cisco» (Borderless Networks)** и **Cisco Visual Networking Index** (27 строк `marketing` в тексте/квизах 11.1, 9.2, экзаменах) — маркетинговые концепции. Рекомендация: убрать бренд, оставить принципы иерархической модели; статистику VNI заменить нейтральной.

### 3.6. Ссылки, домены, учётные данные

- **www.cisco.com как учебный домен** в лабе 3.8.8 (текст, 7 скриншотов Wireshark, `.docx`) и в квизах; `cisco.com` в WHOIS-анимации 3.5.3-1; `www.netacad.com`/`www.netacad.pt` в топологиях PT; `design-zone` URL в квизе 14.4.7; `cisco.com/techsupport` в баннерах (49 строк `link`). Лаба 3.8.8 опирается на реальные CNAME реального домена — нужен собственный домен с похожей цепочкой CNAME (решение оператора).
- **Пароли и имена из бренда**: `cisco`, `ciscorocks`, `$cisco123!`, ключ группы `CISCO`, хост `CiscoVille`, домен `ccna-lab.com`, VTP-домен `CCNA`, `username admin secret ccna` (37 строк + 2 растра CiscoVille). Рекомендация: единая замена по всему курсу (напр. `nsalab` / `class`), синхронно с `assessment/ms.yaml` лаб.

### 3.7. Визуальная идентичность

- **Библиотека Figma (лист `_Библиотека`)** — одна строка-решение (ccna3-vm-1984). Наблюдение по 279 отрендеренным фигурам: иконки — собственная изометрическая отрисовка в палитре курса, но **геометрия символов повторяет фирменный набор Cisco** (маршрутизатор-«шайба» с четырьмя стрелками, коммутатор с парами встречных стрелок, L3-коммутатор со «снежинкой», межсетевой экран-кирпичная стена). Варианты: (a) оставить как де-факто отраслевую нотацию; (b) перерисовать символы (хотя бы маршрутизатор и L3-коммутатор). Решение — `decide`. Сам лист `_Библиотека` открыть не удалось (см. §4.5).
- **Растры в стиле NetAcad**: 48 схем с бирюзовыми иконками Cisco (в основном картинки экзаменов `*-exam/assets`, 6.1.5, лабы на физическом оборудовании) и 28 скриншотов топологий PT — перерисовать библиотекой курса (экзамены — отдельной задачей, их нет в KB-инвентаре `design/raster-inventory-ccna3.md`, он покрывает только `kind: native`).
- **Скриншоты GUI и сайта вендора**: cisco.com Object Navigator (10.4.9), UCS Manager (13.3.2-2), APIC-EM (13.5.6, 13.5.7), DNA Center (14.6.5) и маркетинговый слайд DNA (14.6.4), Postman с коллекциями DevNet / Cisco Spark (14.4.6-2). Вердикты KB-инвентаря (A–E) приведены в `note`.
- **Фото-текстуры** корпусов ПК/серверов в SVG — общий стиль курса, вендорных признаков нет (`keep`, отмечено один раз).

### 3.8. Видео

Вне рамок этого аудита по указанию оператора (2026-10-16): 32 встроенных ролика уже классифицированы в `videos/` (класс, сценарий, транскрипт, предложение по пересборке) и будут пересобраны. Попадания словаря в `videos/*.md` внесены в «исключено» с этой причиной (§5). Для справки: все 32 — перезаливы роликов Cisco Networking Academy / Cisco на стороннем канале; `marketing` — `UlQEjsoNIGM`, `nVxWyrzuaBY` и хвост 5:13–6:55 `bNG9z5NQc44`.

### 3.9. Копирайт и служебные документы

- `legal`: колонтитулы «© … Корпорация Cisco … Открытая информация Cisco» во всех 39 `.docx` и в `13.6.1-lab.pdf` (последний лежит в assets материала 13.06 и доступен обучающемуся), баннеры `Copyright (c) … by Cisco Systems` в выводах CLI (13 строк `legal` + баннеры в `cli-vendor-string`). Рекомендация: `13.6.1-lab.pdf` заменить собственной инструкцией; `packet-tracer-source-files/` удалить после проверки переноса.
- Служебное (`audience: internal`): `migration-instructions.md` (ENSA v7, NetAcad, PT), `ccna3-labs.md`, `readme-assets/` (скриншоты NetAcad и PT, `ensa-v7-scope-and-sequence.pdf`), `figma-assets.json` (`provenance.netacad`). Решение: оставить как историю миграции или вычистить вместе с остальным.
- **Имена каталогов** с вендором (`…-cdp`, `…-ios-image…`, `…-cisco-ios-image`, `…-ibn-and-cisco-dna-center`; 7 строк `filename` для обучающегося): видны в URL, `$ref` и `figma-assets.json` — переименовывать вместе с решением по теме.

## 4. Покрытие

### 4.1. `git ls-files` — 1838 файлов

| тип | файлов | просмотрено | пропущено | как |
|---|---:|---:|---:|---|
| `.tf` | 548 | 548 | 0 | поиск по словарю → строка на лабу |
| `.svg` | 301 | 301 | 0 | рендер rsvg-convert -b white (1600 px) + OCR eng+rus + просмотр глазами; анимации — Chromium, 7 кадров на сцену + OCR; вложенные растры извлечены |
| `.json` | 281 | 281 | 0 | поиск по словарю (метаданные, квизы, экзамены, figma-assets.json, tracks.json) |
| `.md` | 183 | 148 | 35 | поиск по словарю построчно (текст / код / HTML-комментарии раздельно); **35 файлов `videos/` пропущены по указанию оператора** (видео уже классифицированы) |
| `.png` | 139 | 139 | 0 | просмотр глазами (контактные листы) + OCR eng+rus |
| `.yaml` | 114 | 114 | 0 | поиск по словарю (оценка лаб) → строка на лабу |
| `.sh` | 114 | 114 | 0 | поиск по словарю → строка на лабу |
| `.docx` | 39 | 39 | 0 | извлечён текст document.xml + колонтитулы; word/media просмотрены глазами |
| `.pka` | 38 | 38 | 0 | уровень файла: бинарный зашифрованный формат PT, внутрь не заглядывали → строка на лабу |
| `.tpl` | 38 | 38 | 0 | поиск по словарю → строка на лабу |
| `.jpg` | 25 | 25 | 0 | просмотр глазами + OCR eng+rus |
| `.gif` | 12 | 12 | 0 | первый кадр: просмотр глазами + OCR |
| `.py` | 2 | 2 | 0 | поиск по словарю (служебные скрипты) |
| `.pdf` | 2 | 2 | 0 | pdftotext + поиск по словарю |
| `.yml` | 1 | 1 | 0 | поиск по словарю (workflow) |
| `.txt` | 1 | 1 | 0 | поиск по словарю (final-test) |
| **всего** | **1838** | **1803** | **35** | |

Каждый текстовый файл прогнан через словарь целиком; бинарные — по методу из таблицы. `.pka` (37 лаб + `final-lab`) — бинарный зашифрованный формат Packet Tracer: учтён на уровне файла (строка на лабу), содержимое (модели устройств внутри PT) не перечислялось.

### 4.2. Ассеты `figma-assets.json`

| kind | всего | просмотрено | не просмотрено | причина |
|---|---:|---:|---:|---|
| `illustration` | 285 | 279 | 6 | `status: orphan`, файла нет в git (`*-UNPLACED/…`): 2.2.8 `ccna3-eniux5b`, 5.1.6 `ccna3-44f2vls`, 6.5.2 `ccna3-xdrnhbt`, 11.2.2 `ccna3-flq36eq`, 11.2.4 `ccna3-cgxdqqo`, 11.2.5 `ccna3-i47s7rr`; Figma недоступна (§4.5) |
| `animation` | 21 | 21 | 0 | 7 кадров на сцену в Chromium (SMIL `setCurrentTime`) + OCR + имена узлов из `tracks.json` |
| `native` | 57 | 57 | 0 | глазами + OCR; сверено с `design/raster-inventory-ccna3.md` (вердикты совпали, приведены в `note`) |

Растры в git всего: **176** (`kind: native` + картинки экзаменов, лаб и `readme-assets/`): со строками в карте — 137, без вендорных элементов — 35 (синтаксис CLI, Wireshark/Tera Term/Windows, сток), знаки других вендоров — 4 (§8). Вложенные растры SVG: 8 уникальных (3 шум-текстуры, троян/червь/вирус/пламя — клип-арт, логотип OpenFlow) — вендора Cisco нет. Медиа `.docx`: 18 уникальных (логотип Cisco Networking Academy во всех 39 файлах, топологии в иконках Cisco, скриншоты Wireshark с www.cisco.com).

### 4.3. Видео

Пропущены по указанию оператора: документы `videos/<модуль>/…--<videoId>.md` (32) и индексы `videos/README.md`, `_index-a.md`, `_index-b.md` — классификация уже есть, ролики будут пересобраны. Строки встраивания роликов в README (ссылки YouTube) словарём не ловятся и в карту не вносились.

### 4.4. Лабы

Каталогов лаб с `deploy/`: 41. На Packet Tracer — **38** (строка на лабу: `.pka`, `deploy/pt-lab/*`, число PT-проверок в `assessment/ms.yaml`); 4 исследовательские лабы (3.5.7, 3.8.8, 7.5.11, 10.4.10) — Azure-ВМ без зависимостей от вендора в инфраструктуре. **Переведённых на learn-netsim лаб в CCNA3 нет.**

### 4.5. Ограничения

- **Figma недоступна из окружения аудита**: токена `/home/menus12/dev/nsalab/learn/.secrets/figma_ci` здесь нет, Figma MCP не подключился (прокси 403). Поэтому тексты фигур получены не из узлов `TEXT`, а **рендером SVG + OCR (tesseract eng+rus) + просмотром глазами** каждой фигуры и 7 кадров каждой анимации; имена узлов анимаций — из `animations/*/tracks.json`. Лист `_Библиотека` оценён по инстансам компонентов в 279 фигурах; листы Figma «Видео · …» не проверялись (видео вне рамок по указанию оператора).
- 6 «осиротевших» записей `figma-assets.json` без файла в git не проверены (см. §4.2).
- Работа велась на ветке сессии `claude/happy-gates-n4qu90` (а не `audit/vendor-mentions`, как просит задача) — так настроено окружение; PR не открывался, результаты опубликованы комментарием в issue.

## 5. Сверка полноты (N = M + K)

N — попадания поиска (без учёта регистра, если не указано `cs`), M — внесены в строки карты (несколько попаданий могут образовать одну строку: «Cisco Catalyst 2960» = 3 попадания → 1 строка; строки лаб/документов агрегируют попадания по файлу), K — исключены с причиной. Источник: `issue` — стартовый словарь задачи, `added` — добавлено по ходу работы.

### 5.1. Текст (все текстовые файлы git + текст `.docx`/`.pdf`)

| термин | regex | источник | N (текст + docx/pdf) | M | K | причины K |
|---|---|---|---:|---:|---:|---|
| cisco | `[cс][iі]sco` | issue | 1296 (945 + 351) | 925 | 371 | videos/*.md — вне рамок по указанию оператора ×371 |
| сиско | `сиско` | issue | 0 (0 + 0) | 0 | 0 | — |
| циско | `циско` | issue | 1 (1 + 0) | 0 | 1 | videos/*.md — вне рамок по указанию оператора ×1 |
| netacad | `netacad` | issue | 386 (295 + 91) | 384 | 2 | videos/*.md — вне рамок по указанию оператора ×2 |
| networking academy | `networking\s+academy` | issue | 33 (31 + 2) | 2 | 31 | videos/*.md — вне рамок по указанию оператора ×31 |
| сетевая академия | `сетев\w*\s+академи` | issue | 0 (0 + 0) | 0 | 0 | — |
| академи | `академи` | issue | 0 (0 + 0) | 0 | 0 | — |
| learning network | `learning\s+network` | added | 0 (0 + 0) | 0 | 0 | — |
| talos | `\btalos\b` | added | 1 (1 + 0) | 1 | 0 | — |
| devnet | `\bdevnet\b` | added | 8 (8 + 0) | 0 | 8 | videos/*.md — вне рамок по указанию оператора ×8 |
| ccna | `ccna` | issue | 884 (857 + 27) | 874 | 10 | videos/*.md — вне рамок по указанию оператора ×10 |
| ccnp | `ccnp` | issue | 0 (0 + 0) | 0 | 0 | — |
| ccent | `ccent` | issue | 0 (0 + 0) | 0 | 0 | — |
| ccie | `\bccie\b` | added | 0 (0 + 0) | 0 | 0 | — |
| cyberops | `cyber\s?ops` | added | 0 (0 + 0) | 0 | 0 | — |
| itn | `\bitn\b` | issue | 4 (2 + 2) | 4 | 0 | — |
| srwe | `\bsrwe\b` | issue | 2 (0 + 2) | 2 | 0 | — |
| ensa | `\bensa\b` | issue | 341 (335 + 6) | 307 | 34 | videos/*.md — вне рамок по указанию оператора ×34 |
| v7 | `\bv7(\.\d+)?\b` | issue | 3 (2 + 1) | 3 | 0 | — |
| scope and sequence | `scope\s+(and\|&)\s+sequence` | added | 3 (2 + 1) | 3 | 0 | — |
| packet tracer | `packet[\s_-]*tracer` | issue | 799 (733 + 66) | 775 | 24 | videos/*.md — вне рамок по указанию оператора ×24 |
| трейсер | `тр[еэ]йсер` | added | 0 (0 + 0) | 0 | 0 | — |
| \bPT\b | `\bPT\b` | issue | 1773 (1769 + 4) | 1767 | 6 | NAT-PT — стандарт IETF (RFC 2766), не Packet Tracer ×6 |
| -PT device | `\w-PT\b` | added | 44 (44 + 0) | 38 | 6 | NAT-PT — стандарт IETF (RFC 2766), не Packet Tracer ×6 |
| \.pka | `\.pka\b` | issue | 130 (124 + 6) | 130 | 0 | — |
| \.pkt | `\.pkt\b` | issue | 0 (0 + 0) | 0 | 0 | — |
| pt-lab / pt-url | `\bpt[-_](lab\|url\|api)` | added | 1703 (1703 + 0) | 1703 | 0 | — |
| webex | `webex` | issue | 1 (1 + 0) | 0 | 1 | videos/*.md — вне рамок по указанию оператора ×1 |
| meraki | `meraki` | issue | 4 (4 + 0) | 2 | 2 | videos/*.md — вне рамок по указанию оператора ×2 |
| catalyst | `catalyst` | issue | 45 (38 + 7) | 24 | 21 | videos/*.md — вне рамок по указанию оператора ×21 |
| \bISR\b | `\bISR\d*\b` | issue | 48 (43 + 5) | 42 | 6 | videos/*.md — вне рамок по указанию оператора ×6 |
| asr | `\bASR\s?\d{3,4}\b `cs`` | added | 0 (0 + 0) | 0 | 0 | — |
| nexus | `\bnexus\b` | issue | 44 (44 + 0) | 28 | 16 | videos/*.md — вне рамок по указанию оператора ×16 |
| \bASA\b | `\bASA\b` | issue | 27 (27 + 0) | 27 | 0 | — |
| anyconnect | `any\s?connect` | issue | 4 (4 + 0) | 4 | 0 | — |
| dna center | `dna[\s-]*(center\|centre\|c\b)` | issue | 168 (167 + 1) | 27 | 141 | videos/*.md — вне рамок по указанию оператора ×141 |
| apic | `\bapic(-em)?\b` | added | 86 (86 + 0) | 49 | 37 | videos/*.md — вне рамок по указанию оператора ×37 |
| aci | `\bACI\b `cs`` | added | 62 (62 + 0) | 36 | 26 | videos/*.md — вне рамок по указанию оператора ×26 |
| sd-access | `\bsd-?access\b` | added | 1 (1 + 0) | 0 | 1 | videos/*.md — вне рамок по указанию оператора ×1 |
| ise | `\bISE\b `cs`` | added | 23 (23 + 0) | 0 | 23 | videos/*.md — вне рамок по указанию оператора ×23 |
| firepower | `fire\s?power` | added | 0 (0 + 0) | 0 | 0 | — |
| umbrella | `\bumbrella\b` | added | 0 (0 + 0) | 0 | 0 | — |
| esa/wsa | `\b(ESA\|WSA)\b `cs`` | added | 40 (40 + 0) | 40 | 0 | — |
| amp | `\bAMP\b `cs`` | added | 0 (0 + 0) | 0 | 0 | — |
| stealthwatch | `stealth\s?watch` | added | 0 (0 + 0) | 0 | 0 | — |
| ucs | `\bUCS\b `cs`` | added | 5 (5 + 0) | 5 | 0 | — |
| viptela/vmanage | `viptela\|vmanage\|vsmart\|vbond` | added | 0 (0 + 0) | 0 | 0 | — |
| prime | `\bprime\s+infrastructure\b` | added | 0 (0 + 0) | 0 | 0 | — |
| ccp/sdm/asdm | `\b(CCP\|SDM\|ASDM)\b `cs`` | added | 4 (4 + 0) | 4 | 0 | — |
| telepresence/jabber | `telepresence\|jabber\|\bCUCM\b\|callmanager` | added | 1 (1 + 0) | 0 | 1 | jabber — термин Ethernet (бормотание кадров), не Cisco Jabber ×1 |
| \bIOS\b | `\bIOS\b` | issue | 406 (335 + 71) | 281 | 125 | videos/*.md — вне рамок по указанию оператора ×125 |
| IOS XE | `\bIOS[\s-]?XE\b` | issue | 30 (17 + 13) | 21 | 9 | videos/*.md — вне рамок по указанию оператора ×9 |
| IOS XR | `\bIOS[\s-]?XR\b` | added | 0 (0 + 0) | 0 | 0 | — |
| NX-OS | `\bNX-?OS\b` | issue | 0 (0 + 0) | 0 | 0 | — |
| IOx | `\bIOx\b` | added | 0 (0 + 0) | 0 | 0 | — |
| rommon | `rommon` | added | 31 (25 + 6) | 31 | 0 | — |
| confreg | `confreg\|0x21[04]2` | added | 26 (24 + 2) | 26 | 0 | — |
| opendns | `open\s?dns` | added | 1 (1 + 0) | 1 | 0 | — |
| borderless | `borderless\|без\s+границ` | added | 31 (31 + 0) | 30 | 1 | videos/*.md — вне рамок по указанию оператора ×1 |
| ibns | `\bIBNS\b` | added | 5 (5 + 0) | 5 | 0 | — |
| fabricpath | `fabric\s?path` | added | 2 (2 + 0) | 1 | 1 | videos/*.md — вне рамок по указанию оператора ×1 |
| iwan | `\bIWAN\b` | added | 2 (2 + 0) | 0 | 2 | videos/*.md — вне рамок по указанию оператора ×2 |
| trustsec/SGT | `trust\s?sec\|\bSGT\b` | added | 6 (6 + 0) | 0 | 6 | videos/*.md — вне рамок по указанию оператора ×6 |
| techwisetv | `techwise` | added | 10 (10 + 0) | 0 | 10 | videos/*.md — вне рамок по указанию оператора ×10 |
| NSF | `\bNSF\b `cs`` | added | 20 (20 + 0) | 20 | 0 | — |
| model numbers | `\b(1841\|1921\|1941\|2811\|2901\|2911\|2921\|2950\|2960\|3560\|3650\|3750\|3850\|4221\|4321\|4331\|4351\|4451\|9300)\b` | issue | 108 (62 + 46) | 95 | 13 | videos/*.md — вне рамок по указанию оператора ×13 |
| model numbers (ext) | `\b(4200\|4300\|9000\|9300\|9400\|9500\|9800\|1000V\|4221R)\b\|\b\d{4}-C\b\|\bAP\d{4}\b\|\bWLC-\d{4}\b` | added | 104 (99 + 5) | 40 | 64 | число не является моделью оборудования (порт, год, количество) ×4; videos/*.md — вне рамок по указанию оператора ×60 |
| series NNN | `(серии\|серий\|series)\s+(cisco\s+)?\d{3,4}` | added | 36 (36 + 0) | 35 | 1 | videos/*.md — вне рамок по указанию оператора ×1 |
| WS-C | `WS-C` | issue | 11 (7 + 4) | 11 | 0 | — |
| CISCO####/K9 | `\b(CISCO\d{3,4}\|C\d{3,4}(-\w+)?\|ISR\d{4})/K9\b\|\bK9\b` | added | 4 (2 + 2) | 4 | 0 | — |
| ios image name | `\b(c\d{3,4}\|isr\d{4})-[\w.-]*(universalk9\|lanbase\|ipbase\|advipservices\|ipservices\|adventerprise)[\w.-]*` | added | 86 (79 + 7) | 58 | 28 | videos/*.md — вне рамок по указанию оператора ×28 |
| universalk9/lanbase | `universalk9\|lanbase` | added | 109 (83 + 26) | 80 | 29 | videos/*.md — вне рамок по указанию оператора ×29 |
| C2960/C1900/... | `\bC(1900\|2900\|2960\|3560\|3750\|4300\|800)\b` | added | 82 (70 + 12) | 50 | 32 | videos/*.md — вне рамок по указанию оператора ×32 |
| \bCDP\b | `\bCDP\b` | issue | 287 (207 + 80) | 285 | 2 | videos/*.md — вне рамок по указанию оператора ×2 |
| EIGRP | `EIGRP` | issue | 41 (38 + 3) | 21 | 20 | videos/*.md — вне рамок по указанию оператора ×20 |
| IGRP | `(?<!E)\bIGRP\b` | added | 0 (0 + 0) | 0 | 0 | — |
| HSRP | `HSRP` | issue | 2 (2 + 0) | 2 | 0 | — |
| GLBP | `GLBP` | issue | 0 (0 + 0) | 0 | 0 | — |
| \bVTP\b | `\bVTP\b` | issue | 4 (2 + 2) | 4 | 0 | — |
| \bDTP\b | `\bDTP\b` | issue | 0 (0 + 0) | 0 | 0 | — |
| \bISL\b | `\bISL\b` | issue | 0 (0 + 0) | 0 | 0 | — |
| PVST | `PVST` | issue | 7 (4 + 3) | 7 | 0 | — |
| PAgP | `\bPAgP\b` | added | 2 (2 + 0) | 2 | 0 | — |
| EtherChannel | `etherchannel` | added | 57 (50 + 7) | 57 | 0 | — |
| NBAR | `\bNBAR2?\b` | added | 13 (13 + 0) | 4 | 9 | videos/*.md — вне рамок по указанию оператора ×9 |
| NetFlow | `netflow` | added | 7 (7 + 0) | 5 | 2 | videos/*.md — вне рамок по указанию оператора ×2 |
| IP SLA | `\bIP\s+SLA\b` | added | 1 (1 + 0) | 1 | 0 | — |
| SPAN/RSPAN | `\bR?SPAN\b `cs`` | added | 3 (3 + 0) | 0 | 3 | SPAN Engineering — вымышленная компания сценария, не SPAN (зеркалирование портов) ×3 |
| CEF | `\bCEF\b `cs`` | added | 14 (14 + 0) | 12 | 2 | videos/*.md — вне рамок по указанию оператора ×2 |
| DMVPN/GETVPN/FlexVPN | `\b(DMVPN\|GETVPN\|GET\s+VPN\|FlexVPN)\b` | added | 50 (50 + 0) | 50 | 0 | — |
| LWAPP | `LWAPP` | added | 1 (1 + 0) | 1 | 0 | — |
| UDLD | `\bUDLD\b` | added | 1 (1 + 0) | 1 | 0 | — |
| AutoQoS | `auto\s?qos` | added | 0 (0 + 0) | 0 | 0 | — |
| SD-WAN | `\bSD-?WAN\b` | added | 1 (1 + 0) | 0 | 1 | SD-WAN — общеотраслевой класс решений, не продукт одного вендора ×1 |
| © | `©\|\(c\)\s*\d{4}\|ã\s?\d{4}` | issue | 107 (11 + 96) | 103 | 4 | videos/*.md — вне рамок по указанию оператора ×4 |
| ® | `®` | issue | 2 (0 + 2) | 2 | 0 | — |
| ™ | `™` | issue | 2 (1 + 1) | 1 | 1 | videos/*.md — вне рамок по указанию оператора ×1 |
| copyright | `copyright` | issue | 15 (12 + 3) | 10 | 5 | videos/*.md — вне рамок по указанию оператора ×5 |
| товарн | `товарн` | issue | 0 (0 + 0) | 0 | 0 | — |
| cisco.com | `cisco\.com` | issue | 77 (64 + 13) | 51 | 26 | videos/*.md — вне рамок по указанию оператора ×26 |
| all rights reserved | `all\s+rights\s+reserved\|все\s+права\s+защищены` | added | 90 (1 + 89) | 90 | 0 | — |
| **итого** | | | **9868** | **8704** | **1164** | |

Ориентиры из задачи (число **файлов** с совпадением, без SVG) против этого прохода:

| термин | в задаче | здесь |
|---|---:|---:|
| cisco | 126 | 126 |
| netacad | 3 | 3 |
| networking academy | 31 | 31 |
| ccna | 75 | 75 |
| packet tracer | 87 | 87 |
| webex | 1 | 1 |
| catalyst | 13 | 13 |
| meraki | 2 | 2 |
| \bIOS\b | 76 | 71 |
| \.pka | 76 | 76 |

Совпадает всё, кроме `\bIOS\b` (71 против 76): `grep -ilE '\bIOS\b'` на этом коммите тоже даёт 71 — ориентир в задаче снят на другом срезе или другим способом.

### 5.2. Имена файлов и каталогов

| термин | N | M | K | причины K |
|---|---:|---:|---:|---|
| \bPT\b | 40 | 40 | 0 | — |
| pt-lab / pt-url | 38 | 38 | 0 | — |
| \.pka | 38 | 38 | 0 | — |
| \bCDP\b | 6 | 6 | 0 | — |
| \bIOS\b | 3 | 2 | 1 | videos/*.md — вне рамок по указанию оператора ×1 |
| cisco | 8 | 3 | 5 | videos/*.md — вне рамок по указанию оператора ×5 |
| dna center | 7 | 2 | 5 | videos/*.md — вне рамок по указанию оператора ×5 |
| ccna | 22 | 22 | 0 | — |
| packet tracer | 28 | 28 | 0 | — |
| ensa | 1 | 1 | 0 | — |
| v7 | 1 | 1 | 0 | — |

### 5.3. OCR картинок (611 распознанных изображений: рендеры SVG, кадры анимаций, растры, вложенные растры)

| термин | N | M | K | причины K |
|---|---:|---:|---:|---|
| ® | 68 | 0 | 68 | шум OCR: иконки/стрелки распознаны как знак (проверено глазами) ×68 |
| © | 48 | 0 | 48 | шум OCR: иконки/стрелки распознаны как знак (проверено глазами) ×48 |
| cisco | 43 | 43 | 0 | — |
| model numbers | 5 | 5 | 0 | — |
| \bISR\b | 4 | 4 | 0 | — |
| netacad | 4 | 4 | 0 | — |
| cisco.com | 4 | 4 | 0 | — |
| \bPT\b | 3 | 3 | 0 | — |
| EtherChannel | 3 | 3 | 0 | — |
| packet tracer | 3 | 3 | 0 | — |
| ios image name | 3 | 3 | 0 | — |
| universalk9/lanbase | 3 | 3 | 0 | — |
| esa/wsa | 3 | 3 | 0 | — |
| \bCDP\b | 2 | 2 | 0 | — |
| dna center | 2 | 2 | 0 | — |
| srwe | 2 | 2 | 0 | — |
| ™ | 2 | 0 | 2 | шум OCR: иконки/стрелки распознаны как знак (проверено глазами) ×2 |
| NSF | 1 | 1 | 0 | — |
| -PT device | 1 | 1 | 0 | — |
| CISCO####/K9 | 1 | 1 | 0 | — |
| itn | 1 | 1 | 0 | — |
| DMVPN/GETVPN/FlexVPN | 1 | 1 | 0 | — |
| apic | 1 | 1 | 0 | — |

Визуальные находки без текстовых попаданий (логотипы на фото, подпись «APIC» на иконке, стиль иконок) внесены по результатам просмотра глазами — в OCR-сверку они не попадают.

## 6. Итоговый словарь

Словарь — столбцы «термин / regex / источник» таблицы §5.1 (там же N/M/K). Отличия от стартового словаря задачи:

- короткие коды взяты с границами слова (`\bitn\b`, `\bensa\b`, `\bv7…`), иначе `ensa` ловит «license», «compensate»;
- аббревиатуры добавленных продуктов — с учётом регистра (`cs`: ISE, ESA/WSA, AMP, ACI, SPAN, CEF, UCS, CCP/SDM/ASDM, NSF), иначе ловятся `&amp;`, `<span>`, слова;
- `cisco` ловит и смешанное написание кириллица/латиница (`[cс][iі]sco`), `packet tracer` — и `packet-tracer`;
- добавлены: продукты (APIC/ACI, SD-Access, ISE, Firepower, Umbrella, ESA/WSA, Stealthwatch, UCS, Viptela, Prime, ASDM, OpenDNS, IBNS, FabricPath, IWAN, TrustSec, TechWiseTV, Talos, DevNet, IOS XR, IOx), модели и образы (ряды 9000/9300/9500/4200/4300, `NNNN-C`, `AP…`, `WLC-…`, «серии NNN», `…/K9`, `universalk9`/`lanbase`, имена образов), проприетарные технологии (IGRP, PAgP, EtherChannel, NBAR, NetFlow, IP SLA, SPAN, CEF, DMVPN, LWAPP, UDLD, AutoQoS, NSF, ROMMON, `confreg`/`0x2142`), маркетинг («без границ»/Borderless), PT (`-PT`, `pt-lab`/`pt-url`, «трейсер»), «all rights reserved / все права защищены», «Learning Network», «scope and sequence».
- Вне словаря, но учтено вручную: onePK (OCR/глаза), подписи на иконках, логотипы на фото и в GUI.

## 7. Как устроен CSV

Колонки: `id, module, material, surface, locator, term, category, audience, excerpt, action, note` (UTF-8, разделитель `,`).

- **Текст, код, комментарии, квизы, метаданные** — строка на вхождение; `locator` = `путь:строка`. Соседние попадания в одной фразе сливаются в одно вхождение («Cisco Catalyst 2960»); строка вывода CLI в блоке кода = одно вхождение.
- **Лабы** — строка на лабу (`locator` = каталог `deploy/`), как разрешает задача; **`.docx`/`.pdf`** — строка на файл со сводкой терминов в `excerpt`.
- **Иллюстрации/анимации** — `locator` = `key` + `nodeId` + id ассета + путь; **растры** — путь (+ `key` для `kind: native`); где картинка встроена — в `note`.
- **Повторяющиеся служебные паттерны** (`figma-assets.json`: id `ccna3-*`, листы Figma, `provenance.netacad`) — строка на паттерн с jq-путём в `locator`.
- `action`: `remove` | `neutralize` | `replace:<на что>` | `keep` | `decide`; обоснование — в `note`.

## 8. Прочие товарные знаки (не Cisco) — в карту не внесены

- AWS Management Console (`13.2.1.png`), MapQuest (`14.4.5-2`, `14.4.6-1…-3`), логотипы OpenFlow/OpenStack (`13.4.3.png`, вложенный растр в 13.5.5-1…-3), Ansible/Puppet/Chef/SaltStack (`14.5.4.png`), Wireshark, Tera Term, Postman, PuTTY/Tftpd64, Windows — сторонние продукты, не вендор курса. Если цель — нейтральность ко всем вендорам, это отдельный список (в `design/raster-inventory-ccna3.md` большая часть уже помечена C/E).

