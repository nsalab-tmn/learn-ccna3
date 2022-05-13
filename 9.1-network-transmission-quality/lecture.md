<!-- 9.1.1 -->
## Обучающее видео. Назначение качества обслуживания

Нажмите кнопку «Воспроизведение», чтобы просмотреть краткое объяснение назначения качества обслуживания.

![youtube](https://www.youtube.com/watch?v=s_4r5MBW_Uc)

<!-- 9.1.2 -->
## Установка приоритетов трафика

В предыдущем видео вы узнали о цели качества обслуживания (QoS). Современные сети предъявляют все более высокие требования к качеству обслуживания (QoS). Новые, ставшие теперь доступными приложения, например для передачи голоса и видео в режиме реального времени, предъявляют более высокие требования к качеству предоставляемых сервисов.

При агрегации нескольких каналов связи на одном устройстве, например маршрутизаторе, когда большая часть этих данных затем передается на меньшее число исходящих интерфейсов или на более медленный интерфейс, может возникнуть перегрузка сети. Это может также произойти, когда большие пакеты данных препятствуют своевременной передаче более мелких пакетов.

Когда объем трафика превышает возможности доставки по сети, устройства помещают пакеты в очередь в памяти и удерживают их до тех пор, пока не будут доступны ресурсы передачи. Постановка пакетов в очередь приводит к задержке, поскольку новые пакеты не могут передаваться до тех пор, пока не будут обработаны предыдущие. Если число пакетов для постановки в очередь продолжает расти, память устройства заполняется и пакеты отбрасываются. Метод QoS, который может помочь в решении этой проблемы, заключается в распределении данных по нескольким очередям, как показано на этом рисунке.

**Примечание**: Устройство обеспечивает доступность качества обслуживания только при возникновении перегрузки определенного типа.

**Использование очередей для приоритетных коммуникаций**

![](./assets/9.1.2.png)
<!-- /courses/ensa-dl/ae8eb390-34fd-11eb-ba19-f1886492e0e4/aeb59c8a-34fd-11eb-ba19-f1886492e0e4/assets/c680f510-1c46-11ea-af56-e368b99e9723.svg -->

<!--
На рисунке показано использование очередей для приоритизации трафика. Существует три различных очереди: высокий приоритет, средний приоритет и низкий приоритет. Голосовая телефония  по IP (VoIP) имеет трафик, обозначенный как высокий приоритет, компьютер, отправляющий финансовые транзакции, помечен как средний приоритет, а сервер, отправляющий данные веб-страницы, помечен как низкий приоритет. Когда маршрутизатор получает трафик от трех устройств, маршрутизатор определяет приоритет трафика в зависимости от его приоритета. Пакеты смешаны в в сети в зависимости  от приоритета, но все типы приоритетов имеют доступ. Ни один из типов трафика не должен полностью занимать пропускную способность. На изображении показаны пакеты VoIP, которые приоритетизируются в первую очередь, затем второй пакеты финансовых транзакций, третий пакет VoIP, четвертый пакет финансовых транзакций, пятый и шестой пакеты VoIP, а затем седьмой веб-страницы.
-->

<!-- 9.1.3 -->
## Пропускная способность, перегрузка, задержка и джиттер

Полоса пропускания сети измеряется в количестве бит, которое можно передать за одну секунду, то есть в битах в секунду (бит/с). Например, для сетевого устройства может быть указана скорость передачи 10 Гбит/с.

Затор в сети приводит к задержке. Затор в интерфейсе возникает, когда объем трафика превышает тот объем, который может быть обработан. Точки затора в сети — та область, где необходимо использовать механизмы QoS. На рисунке показаны три примера типичных точек затора.

**Примеры точек затора**

![](./assets/9.1.3.png)
<!-- /courses/ensa-dl/ae8eb390-34fd-11eb-ba19-f1886492e0e4/aeb59c8a-34fd-11eb-ba19-f1886492e0e4/assets/c6819153-1c46-11ea-af56-e368b99e9723.svg -->

<!--
На рисунке показаны три примера точек перегрузки на сетевом устройстве. Первый пример — агрегация на коммутаторе. Пять каналов входят в коммутатор и один канал  выходит. Второй пример — несоответствие скорости коммутатора. Входящее соединение составляет 1000 Мбит/с, а исходящее — 100 Мбит/с. Третий пример — канал локальная сеть - глобальная сеть на маршрутизаторе. Входящее соединение составляет 1000 Мбит/с, а исходящее — 100 Мбит/с.
-->

Под задержкой понимается время, которое занимает передача пакета от источника до адресата. Задержки бывают фиксированные и переменные. Фиксированная задержка представляет собой определенное количество времени, которое требуется конкретному процессу, например количество времени, требуемое для помещения бита на передающий носитель. Переменная задержка занимает неопределенное количество времени и зависит от таких факторов, как количество текущего трафика.

Источники задержки приведены в таблице.

**Sources of Delay**

| **Задержка**  | **Описание** |
| --- | --- |
| Задержка кодирования | Фиксированное время, необходимое для сжатия данных в источнике данных перед их передачей на первое подключенное по сети устройство. |
| Задержка пакетирования | Фиксированное время, необходимое для инкапсуляции пакета со всеми необходимыми данными заголовка. |
| Задержка в очереди | Изменяемый период времени, в течение которого кадр или пакет ожидает передачи по каналу. |
| Задержка сериализации | Фиксированный период времени, в течение которого кадр передается в канал. |
| Задержка распространения | Изменяемое время, необходимое для передачи кадра между источником и получателем. |
| Задержка устранения джиттера | Фиксированный период времени, необходимый для буферизации потока пакетов и последующей отправки их через равномерно распределенные интервалы. |

Джиттер — это разница в задержке полученных пакетов. На стороне отправителя пакеты отправляются в непрерывном потоке с равномерно разнесенными пакетами. В результате перегруженности сети, некорректной организации очереди или ошибок конфигурации время задержки для каждого пакета может меняться. И задержку, и джиттер необходимо контролировать и минимизировать, чтобы поддерживать интерактивный трафик в реальном времени.

<!-- 9.1.4 -->
## Потеря пакетов

Без использования механизмов качества обслуживания пакеты обрабатываются в порядке их получения. В случае перегрузки сетевые устройства, такие как маршрутизаторы и коммутаторы, могут отбрасывать пакеты. Это означает, что пакеты, чувствительные к задержкам, например голосовой связи и видео в режиме реального времени, будут отбрасываться так же часто, как и данные, которые нечувствительны к задержкам, например электронная почта и страницы, просматриваемые в Интернете.

Например, когда маршрутизатор по протоколу реального времени (RTP) принимает поток цифровой голосовой информации по протоколу IP (VoIP), он должен компенсировать возникающий джиттер. Механизмом, который выполняет эту функцию, является буфер задержки воспроизведения. Буфер задержки воспроизведения буферизирует эти пакеты, а затем воспроизводит их в виде устойчивого потока, как показано на рисунке. Цифровые пакеты затем обратно преобразуются в аналоговый аудиопоток.

**Буфер задержки воспроизведения компенсирует джиттер.**

![](./assets/9.1.4-1.png)
<!-- /courses/ensa-dl/ae8eb390-34fd-11eb-ba19-f1886492e0e4/aeb59c8a-34fd-11eb-ba19-f1886492e0e4/assets/c6822d93-1c46-11ea-af56-e368b99e9723.svg -->

<!--
На рисунке показано, как буфер задержки воспроизведения компенсирует джиттер. Пять пакетов принимаются устройством в разные промежутки времени. Буфер задержки воспроизведения, буферирует пакеты и отправляет их на исходящий интерфейс в устойчивом и согласованном потоке.
-->

Если джиттер настолько интенсивен, что приводит к выходу принимаемых пакетов из области данного буфера, пакеты вне области отбрасываются и эти потери слышны в звуковом потоке, как показано на рисунке.

**Пакет отбрасывается из-за чрезмерного джиттера.**

![](./assets/9.1.4-2.png)
<!-- /courses/ensa-dl/ae8eb390-34fd-11eb-ba19-f1886492e0e4/aeb59c8a-34fd-11eb-ba19-f1886492e0e4/assets/c6827bb0-1c46-11ea-af56-e368b99e9723.svg -->

<!--
На рисунке показана функция буфера задержки воспроизведения, сбрасывая пакет из-за чрезмерного джиттера. Шесть пакетов принимаются устройством в разные промежутки времени. Буфер воспроизведения, буферирует пакеты, но из-за того, что некоторыйджиттер  настолько велики, что пакеты должны быть получены вне диапазона этого буфера. Пакеты вне допустимого диапазона отбрасываются из-за чрезмерного джиттера.
-->

При небольших потерях на уровне одного пакета процессор цифровых сигналов применяет интерполяцию, восстанавливая нормальное звучание без заметных на слух дефектов. Вместе тем, если джиттер превышает возможности DSP по компенсации потерянных пакетов, проблемы со звуком будут слышны.

Потеря пакетов является широко распространенной причиной возникновения проблем с качеством голосовой связи в IP-сети. В правильно спроектированной сети потеря пакетов должна быть близка к нулю. Голосовые кодеки, используемые процессором DSP, допускают определенный процент потерянных пакетов без значительного влияния на качество голосовой связи. Сетевые инженеры используют механизмы качества обслуживания для классификации пакетов голосовой связи с целью обеспечения нулевой потери пакетов. Полоса пропускания гарантируется для голосовых вызовов за счет предоставления приоритета голосовому трафику относительно трафика, нечувствительного к задержкам.

<!-- 9.1.5 -->
<!-- quiz -->
