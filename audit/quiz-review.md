# CCNA3 quiz and exam review (kb#275)

> **Status:** review done on 2026-10-18. The findings were rebuilt on learn-ccna3 `origin/main` `f4c5c2a` after the kb#280 tier-3 rewrites were merged. Fixes are in the PRs listed below. By the operator's decision on kb#275 (comment 6250372119), which applies to CCNA3 as it did to CCNA1 and CCNA2, the doubtful items are reworded in CCNA3 §1/§2 PRs, and lecture errors are fixed first in learn-ccna3#57.

## What

A question-by-question review of every CCNA3 quiz and exam, and of the CCNA3 bank in learn-ccna1 `__exams/CCNA3`:

| Set | Files | Questions |
|---|---|---|
| module quizzes (`NN-module/*quiz*/`) | 67 | 451 |
| module and final exams (`*-exam/`, `final-exam/`) | 6 | 323 |
| bank copies (learn-ccna1 `__exams/CCNA3/*_Exam/`) | 6 | 362 |

The CCNA1 and CCNA2 reviews are in learn-ccna1 and learn-ccna2 `audit/quiz-review.md` (learn-ccna1#119, learn-ccna2#51). `final-test/` is not connected to the course and is out of scope. Labs and `.pka` files are out of scope too (kb#271).

## Why

The quizzes and exams are translations of the vendor's question banks. The de-marketing passes (kb#274) changed vendor names but did not check whether the questions are right. This review checks each question for:
1. **Correctness:** the key is right by the course text and the standards (RFC, IEEE). Every distractor is wrong, and the number of correct answers matches the stem.
2. **Course match:** the question can be answered from its module or an earlier one, in the module's terms.
3. **Language:** natural literary Russian, without machine-translation artefacts or English left in prose.
4. **Vendor and Packet Tracer leftovers** that the de-marketing missed. Modules 13 and 14 still teach some vendor products on purpose (tier 3 of the de-marketing plan), so questions about them are not leftovers.
5. **References:** images exist, and comments match the key.

## How

1. **Mechanical pass** over all files: answer counts against `answerType` and the stem, matching keys, image paths, Packet Tracer UI strings. In CCNA3 it found 09-12-exam Q9 (a matching key 0 with no option) and final-exam Q27 (the stem says «три», two answers are marked), each with its bank twin.
2. **Review:** seven reviewers each took a block of modules or exams and wrote findings with evidence (`README.md:line`, RFC or IEEE) and a proposed minimal fix. The CCNA1 and CCNA2 lessons went into their brief.
3. **Verification:** a second reviewer checked every finding and confirmed every key change on their own, rewriting fixes where needed. The coordinator read every error-severity fix. Fixes were checked against the glossary (`conventions/ru-glossary.md` in the knowledge base, with the rows decided in kb#279, kb#281, kb#283 and kb#284).
4. **Rebuild:** the review ran before the kb#280 tier-3 rewrites (learn-ccna3#55, #56 and their learn-ccna1 bank twins) were merged. Every finding was rebuilt on the current `origin/main`; step 7 lists the ones that no longer apply.
5. **Fix PRs:** one per module block, so no two open PRs share a line. The bank copies live in learn-ccna1, so each exam block has a paired PR there with the same wording.
6. **Doubtful items** are not changed in the fix PRs:
   - two defensible answers, or content the course does not teach: a CCNA3 §1/§2 PR rewords each one until exactly one answer can be defended from the lecture text (the operator's decision of 2026-10-18). Items that rest on a lecture error follow learn-ccna3#57, which fixes the lecture first;
   - exhibits that disagree with their text are logged in each exam PR's `audit/figma-followups/<branch>.csv`;
   - the `.pka` questions wait for the lab rework, and the structural items (an empty bank question, a matching placeholder) stay.
7. **Held back:** findings whose text the kb#280 rewrites replaced, findings that learn-ccna3#54 already carries, 09.01.05 q1 (it waits for learn-ccna3#57) and 03.11.03 q10 (domain shadowing goes to the kb#276 pass, kb#284).

Severity follows kb#275:
- `error`: a wrong key, a distractor that is actually right, a wrong statement in a question or comment, or a comment copied from another question;
- `style`: language, terms, typos, English or Cyrillic/Latin mix-ups;
- `unclear`: an ambiguous stem or two defensible answers.

## JSON structure (recorded, unchanged)

No PR changes keys, key order, the number of questions or answers, image paths or HTML comments. The value changes outside text are the key moves listed in *Fix PRs*: `correct` in 03-05 Q36 and its bank twin, bank 03-05 Q33, bank 09-12 Q29, final-exam Q27 and bank Practice Final Q27. In 09.04.06 q5 the answer texts swap places instead, so no key changes there.

- **Top level:** quizzes have `title`, `materialType`, `description`, `difficulty`, `duration`, `tags`, `skills`, `passingScore`, `assets`, `questions`. The exams have the same keys in another order, and the bank copies carry `assetsPath` instead of `assets`.
- **Question:** `question` (string, Markdown; an image as `![](./assets/x.png)`), `answerType` and `answers`. A `matching` question also has `options`.
  - `singleChoice`: 955 questions.
  - `multiChoice`: 159 questions; the stem says how many answers are right («верны два варианта»).
  - `matching`: 22 questions.
- **Answer:** `answer` (string) and `correct` (bool). Answers of a `matching` question carry `match` instead of `correct`. An optional `comment` is shown after a wrong answer, and by convention the same comment sits on every wrong answer of a question.

## Fix PRs

| PR | Scope |
|---|---|
| learn-ccna3#58 | quizzes, modules 01–05 |
| learn-ccna3#59 | quizzes, modules 06–10 |
| learn-ccna3#60 | quizzes, modules 11–14 |
| learn-ccna3#61 and learn-ccna1#143 | exams 01–02, 03–05 and their bank copies (key changes: 03-05 Q36 in both, bank 03-05 Q33) |
| learn-ccna3#62 and learn-ccna1#144 | exams 06–08, 09–12 and their bank copies (key change: bank 09-12 Q29) |
| learn-ccna3#63 and learn-ccna1#145 | exams 13–14, final and their bank copies (key change: final and Practice Final Q27) |

## Totals

Findings are counted per file. A bank copy's finding counts separately from its connected exam's, and a comment copied onto three wrong answers is one finding.

| | quizzes | exams | bank copies | all |
|---|---|---|---|---|
| error | 33 | 31 | 51 | 115 |
| style | 171 | 124 | 164 | 459 |
| unclear | 25 | 9 | 10 | 44 |
| **fixed** | 190 | 144 | 199 | 533 |
| **doubtful** (§1/§2, follow-up or structural) | 27 | 15 | 21 | 63 |
| **held back** | 12 | 5 | 5 | 22 |
| **rejected** | 0 | 0 | 0 | 0 |
| **total findings** | 229 | 164 | 225 | 618 |

The fix PRs are listed in *Fix PRs* above. *How*, step 6, says how the doubtful items are handled, and step 7 why some findings are held back.


## Findings: Quizzes

| File | Q | Sev | Issue | Fix |
|---|---|---|---|---|
| 01.01.07-ospf-features-and-characteristics-quiz | 2 | style | Typo in the name: «Дийкстры» instead of «Дейкстры» on all four wrong-answer comments; the answer options of the same question spell it «Дейкстры». | #58 → «Алгоритм Дейкстры» |
| 01.01.07-ospf-features-and-characteristics-quiz | 5 | style | MT calque with a broken case: «Правильный порядок операции состояния канала» (literally "order of link-state operation"); the stem says «порядок действий при ма… | #58 → «Правильный порядок действий при маршрутизации по состоянию канала:» |
| 01.02.05-ospf-packets-quiz | 1 | style | English word order «DBD пакет» in option 2 of Q1-Q5, while the other options say «пакет LSR», «пакет LSU», «пакет LSAck». | #58 → «пакет DBD» |
| 01.03.07-ospf-operation-quiz | 2 | unclear | Distractor «состояние ExStart» is arguably also correct: routers already send each other (empty) DBD packets in ExStart to choose master/slave and the initial D… | §1/§2 rephrasing (kb#275) |
| 01.03.07-ospf-operation-quiz | 5 | style | MT calque «роутеры имеют сошедшиеся базы данных» ("routers have converged databases") with «Во время этого состояния»; the course says the database is fully syn… | #58 → «В этом состоянии OSPF соседи полностью синхронизировали свои LSDB.» |
| 01.03.07-ospf-operation-quiz | 5 | style | Same calque in the six wrong-answer comments: «роутеры имеют сошедшиеся LSDB». | #58 → «В состоянии Full соседи полностью синхронизировали свои LSDB» |
| 01.03.07-ospf-operation-quiz | 6 | style | Typo «приветсвия» (listed in the glossary as a typo); the comments of the same question say «приветствия». | #58 → «приветствия» |
| 01.04.02-quiz | 2 | style | Typo «OPSF» instead of «OSPF». | #58 → «Какой пакет OSPF» |
| 01.04.02-quiz | 3 | style | Gender agreement: «его содержимое» refers to «таблица топологии» (feminine), should be «ее». | #58 → «ее содержимое является результатом запуска алгоритма SPF» |
| 01.04.02-quiz | 3 | style | Garbled calque «Маршруты возможных последующих элементов» (EIGRP feasible successors) explained through «таблица топологии EIGRP», a protocol the course does no… | #58 → «Возможные последующие маршруты содержатся в таблице топологии EIGRP. Это понятие не используется протоколом OSPF.» |
| 01.04.02-quiz | 4 | error | The word «роутера» was lost from "Router IDs uniquely identify each router": right after the sentence about process IDs, «Идентификаторы однозначно определяют к… | #58 → «Каждое устройство однозначно определяется своим идентификатором (router ID)» |
| 01.04.02-quiz | 5 | style | Typo «рутера». Rephrased without the noun so the stem does not mix two words for a router. | #58 → «от соседа DROTHER OSPF» |
| 01.04.02-quiz | 5 | style | Typo «DR/DBR» instead of «DR/BDR»; option 4 of the same question says «DR/BDR». | #58 → «DR/BDR» |
| 01.04.02-quiz | 5 | unclear | Not answerable from module 01 or earlier: the dead interval, its default of 4x hello and removal of the neighbour when it expires are taught only in module 02; … | §1/§2 rephrasing (kb#275) |
| 01.04.02-quiz | 6 | style | Calque «для установления конвергенции» ("to establish convergence"); the course and the comments of this question say «сходимость». | #58 → «для достижения сходимости?» |
| 01.04.02-quiz | 6 | error | Comment says the hello packet is used «для выбора OSPF» ("to select OSPF"), which is meaningless; the hello packet discovers OSPF neighbours and establishes adj… | #58 → «используемый для обнаружения соседей OSPF и установления смежности с ними» |
| 01.04.02-quiz | 7 | unclear | Distractor 2 and its comment rest on OSPF authentication, which the course never teaches. The comment is also outdated: «OSPFv3 не включает никаких собственных … | §1/§2 rephrasing (kb#275) |
| 01.04.02-quiz | 8 | style | Missing noun: «таблицы соседних OSPF»; should be «таблицы соседей OSPF». | #58 → «таблицы соседей OSPF» |
| 01.04.02-quiz | 13 | style | English «dead interval» in prose and a clumsy word order («По умолчанию, какой ...»); the comment and the course say «интервал простоя». | #58 → «Каким по умолчанию будет интервал простоя (dead interval) на этом» |
| 01.04.02-quiz | 13 | unclear | Not answerable from module 01 or earlier: the 4x hello default for the dead interval is taught only in module 02. | §1/§2 rephrasing (kb#275) |
| 01.04.02-quiz | 14 | style | English adjectives in prose: «hello и dead интервалы». | #58 → «как интервалы приветствия (hello) и простоя (dead)» |
| 01.04.02-quiz | 14 | unclear | Distractor 2 («если они находятся в сети множественного доступа, согласуется процесс выбора») is defensible from the course: on Ethernet the DR/BDR election hap… | §1/§2 rephrasing (kb#275) |
| 01.04.02-quiz | 15 | style | Garbled key: «организация роутеров в области, разделяющей большую автономную систему, необходима ...» reads as "an area that divides the AS"; the meaning is tha… | #58 → «разделение большой автономной системы на области снижает нагрузку на устройства» |
| 02.01.09-ospf-router-id-quiz | 1 | style | Broken sentence: a «Верно ли утверждение, что ...» question ends with a period, and «Он должен» does not agree with «значение» (neuter). | #58 → «является глобально значимым и должно быть одинаковым для всех устройств в области OSPF?» |
| 02.01.09-ospf-router-id-quiz | 1 | error | «не должно быть одинаковым» means "must not be the same", which is wrong and contradicts the next sentence of the comment; the process ID does not have to match… | #58 → «и не обязательно должно совпадать на всех устройствах» |
| 02.07.05-quiz | 1 | error | «(им не должен быть интерфейс с включённым OSPF)» says the interface must NOT run OSPF; the course says OSPF does not have to be enabled on it. | #58 → «(OSPF на этом интерфейсе может быть и не включен)» |
| 02.07.05-quiz | 3 | style | Wrong hyphens in numerals («24-битам», «24-бита», «8-бит») and a stray comma before the main clause. | #58 → «первым 24 битам. Для точного соответствия битов шаблонная маска использует двоичные нули. Это означает, что первые 24 би…» |
| 02.07.05-quiz | 5 | style | Typo «Дийкстры» instead of «Дейкстры» in the key and three comments. | #58 → «Дейкстры» |
| 02.07.05-quiz | 8 | unclear | Two defensible answers: «(config-if)# ip ospf cost 100» gives GigE a lower cost than FE if applied to the Fast Ethernet interface, and the course presents ip os… | §1/§2 rephrasing (kb#275) |
| 02.07.05-quiz | 9 | style | Calque «процесс OSPFv2 должен быть очищен» ("cleared"); the course says the process is reset («сброшен»). | #58 → «процесс OSPFv2 должен быть сброшен» |
| 02.07.05-quiz | 10 | style | English adjectives in prose: «hello и dead интервалов». | #58 → «для просмотра интервалов приветствия (hello) и простоя (dead) OSPF» |
| 02.07.05-quiz | 10 | style | Same English adjectives in the comments: «Таймеры hello и dead OSPF». | #58 → «Таймеры приветствия (hello) и простоя (dead) OSPF можно настроить» |
| 02.07.05-quiz | 11 | error | The key «каналы с самой высокой совокупной пропускной способностью» is not what SPF minimises: OSPF picks the lowest sum of interface costs, and cost is inverse… | #58 → «путь с наименьшей совокупной стоимостью» |
| 02.07.05-quiz | 12 | error | «который должен быть активен, но не должен участвовать в процессе OSPF» says the interface must NOT run OSPF; it does not have to. | #58 → «но может и не участвовать в процессе OSPF» |
| 02.07.05-quiz | 13 | style | Typo «OPSF» instead of «OSPF». | #58 → «роутером OSPF» |
| 02.07.05-quiz | 14 | unclear | Two defensible answers: «show ip ospf interface» also confirms the adjacency, and the course output shows it («Adjacent with neighbor 2.2.2.2»; the brief form s… | §1/§2 rephrasing (kb#275) |
| 02.07.05-quiz | 15 | style | Wrong case: «на все другие устройства в область OSPF». | #58 → «на все другие устройства в области OSPF» |
| 03.01.04-current-state-of-cybersecurity-quiz | 5 | style | Broken government «контрмер(а) потенциальной угрозе или риску» (dative) in the stem and the three comments. | #58 → «против потенциальной угрозы или риска» |
| 03.02.06-intruders-quiz | 1 | style | «раскрыть уязвимость пострадавшей организации после взлома их сети»: «раскрыть» suggests public disclosure, and «их» does not agree with «организации»; the cour… | #58 → «Серые хакеры могут сообщить пострадавшей организации об уязвимости после взлома ее сети» |
| 03.02.06-intruders-quiz | 4 | style | A period splits the question in two: «... кредитных карт. Затем я продал ...?». | #58 → «, а затем продал эту информацию» |
| 03.02.06-intruders-quiz | 6 | style | The question has no question mark. | #58 → «исправления уязвимостей DNS?» |
| 03.03.05-threat-actor-tools-quiz | 2 | style | Number agreement: «Какой инструмент используются ...? Они также используются ...». | #58 → «Какие инструменты используются» |
| 03.03.05-threat-actor-tools-quiz | 4 | error | Mistranslation of "sniff out any trace of evidence" as «для анализа трафика»: forensic tools are described as traffic analysers, which points to the distractor … | #58 → «для выявления следов улик в компьютерной системе» |
| 03.05.10-common-network-attacks-quiz | 1 | style | Calque «в безопасное место ... к безопасной зоне» ("secure" = protected). | #58 → «в закрытое место, чтобы получить доступ к защищенной зоне» |
| 03.06.07-ip-vulnerabilities-and-threats-quiz | 3 | unclear | The stem («одновременную скоординированную атаку из нескольких компьютеров-источников») is the course definition of DDoS, not of amplification and reflection, w… | §1/§2 rephrasing (kb#275) |
| 03.07.06-tcp-and-udp-vulnerabilities-quiz | 2 | error | The stem describes the normal four-way FIN/ACK close as what the attack uses. The TCP reset attack sends a forged segment with RST, which tears the connection d… | #58 → «Какая атака разрывает TCP-соединение с помощью поддельного сегмента RST, минуя обычный четырехсторонний обмен флагами FI…» |
| 03.07.06-tcp-and-udp-vulnerabilities-quiz | 2 | error | The comment repeats the error (reset attack «с использованием пары сегментов FIN и ACK от каждой конечной точки»). Rewritten from the module text; it now also s… | #58 → «Атака сброса TCP разрывает соединение между двумя узлами: злоумышленник отправляет одному или обоим оконечным устройства…» |
| 03.10.10-cryptography-quiz | 1 | unclear | The stem and comment call 3DES «очень надежным» with short key lifetimes, following the course table. This is outdated: NIST deprecated three-key TDEA and disal… | §1/§2 rephrasing (kb#275) |
| 03.10.10-cryptography-quiz | 2 | unclear | Two defensible answers by the course itself: RC4, the most used Rivest cipher, is a stream cipher, and Q4 of this quiz marks «Rivest Cipher — это потоковый шифр… | §1/§2 rephrasing (kb#275) |
| 03.10.10-cryptography-quiz | 3 | style | The key starts with a Latin «c» («cимметричное»), which breaks search and spell-checking. | #58 → «симметричное» |
| 03.10.10-cryptography-quiz | 4 | unclear | RC4 is prohibited in TLS (RFC 7465, 2015), so «используется для защиты веб-трафика в SSL и TLS» is outdated, in the course table as well. Operator: rephrase as … | §1/§2 rephrasing (kb#275) |
| 03.11.03-quiz | 2 | style | Dangling gerund: «Посылая слишком много данных ..., смежные области памяти перезаписываются». | #58 → «Если записать в буфер больше данных, чем он может вместить, лишние байты затирают соседние участки,» |
| 03.11.03-quiz | 3 | error | Comment says «Хеш-функция — это еще один способ обеспечения конфиденциальности»; hash functions provide integrity, not confidentiality. Rewritten to explain the… | #58 → «Тема 3.10.0 — Шифрование преобразует данные так, чтобы прочитать сообщение могли только авторизованные получатели, то ес…» |
| 03.11.03-quiz | 3 | error | The third comment is a different translation of the same wrong text (hash functions «обеспечения конфиденциальности»); same rewrite, so all wrong answers carry … | #58 → «Тема 3.10.0 — Шифрование преобразует данные так, чтобы прочитать сообщение могли только авторизованные получатели, то ес…» |
| 03.11.03-quiz | 4 | style | Spelling «Бот-нет» differs from option 4 «ботнет», and «серия компьютеров-зомби» is a calque of "a series". | #58 → «Ботнет — это группа компьютеров-зомби» |
| 03.11.03-quiz | 5 | style | Mistranslation: «посредничество (intervention)»; intervention is «вмешательство». | #58 → «вмешательство (intervention)» |
| 03.11.03-quiz | 6 | style | Broken sentence: «... (DoS-атака), запускается из множества ...» lacks «которая». | #58 → «(DoS-атака), которая запускается из множества» |
| 03.11.03-quiz | 8 | style | Typo «хекер» instead of «хакер». | #58 → «хакер» |
| 03.11.03-quiz | 9 | style | Case mismatch: «фильтрации трафика» while the other options are in the nominative («фильтрация», «обнаружение», «обеспечение»). | #58 → «фильтрация трафика на основе информации 7-го уровня» |
| 03.11.03-quiz | 10 | style | The key is «теневое управление DNS», but two comments call the attack «теневое копирование DNS», so the comment does not name the key; the comment on option 4 a… | held back: domain shadowing goes to the kb#276 pass («теневые поддомены», kb#284) |
| 03.11.03-quiz | 10 | style | Same term mix in the next sentence, which also switches subject mid-sentence («При теневом копировании DNS взламывают ..., а затем киберпреступник создает»). | held back: domain shadowing goes to the kb#276 pass («теневые поддомены», kb#284) |
| 03.11.03-quiz | 11 | style | Straight quotes 'серые' where the course and the comments of this question use «серые». | #58 → ««серые»» |
| 03.11.03-quiz | 11 | error | Comment says script kiddies «создают хакерские скрипты»; the course defines them as using existing scripts, tools and exploits. | #58 → «Хакеры-дилетанты используют готовые хакерские скрипты» |
| 04.01.05-purpose-of-acls-quiz | 1 | style | The comment says the sequential list itself "is called" ACEs (singular subject, plural predicate); the list is the ACL, its statements are the ACEs. | #58 → «Разрешающие и запрещающие инструкции ACL называются записями контроля доступа (ACE)» |
| 04.01.05-purpose-of-acls-quiz | 2 | style | The stem word "Какоe" ends in a Latin "e". | #58 → «Какое утверждение о фильтрации» |
| 04.01.05-purpose-of-acls-quiz | 3 | error | The stem asks which statement is NOT true, but all four options are true (they are the four steps of standard ACL processing), and the key is a true statement, … | #58 → «Чем заканчивается обработка пакета, если ему не соответствует ни одна запись ACE стандартного ACL?» |
| 04.02.05-wildcard-masks-in-acls-quiz | 1 | style | Missing comma before the participial phrase "разрешающая только узел..." (the comments of Q2-Q4 have it). | #58 → «Шаблонная маска, разрешающая только узел» |
| 04.05.02-quiz | 3 | error | The comment says an interface can have only one ACL per direction; the module says one ACL per protocol and per direction (a dual-stack interface has two inboun… | #58 → «Интерфейс может иметь только один ACL для каждого протокола и направления.» |
| 04.05.02-quiz | 4 | style | Broken government: "соответствие со всеми следующим сетям" (preposition plus a dative adjective). | #58 → «обеспечит соответствие всем следующим сетям» |
| 04.05.02-quiz | 9 | style | Typo "заперта" for "запрета". | #58 → «для запрета или разрешения» |
| 04.05.02-quiz | 9 | error | The comment says established permits connections initiated "from the current device"; established permits only return TCP traffic of sessions that were initiate… | #58 → «Ключевое слово established разрешает только ответный трафик TCP-соединений, которые были инициированы из внутренней сети…» |
| 04.05.02-quiz | 10 | style | Stray commas split the phrase "расположение между источником и местом назначения трафика для фильтрации...". | #58 → «расположение между источником и местом назначения для фильтрации» |
| 04.05.02-quiz | 11 | style | Wrong term "Групповая маска" for the wildcard mask ("групповой" reads as multicast); the stem and the module say "шаблонная маска". | #58 → «Шаблонная маска 0.0.7.255» |
| 04.05.02-quiz | 14 | style | Latin "c" used as the Russian preposition «с» in "сопоставления c конкретным". | #58 → «сопоставления с конкретным» |
| 05.05.04-quiz | 1 | style | Missing space: "VTYpermit" in the distractor command (the ACL name VTY and the keyword permit are run together). | #58 → «access-list standard VTY permit 10.7.0.0 0.0.0.127» |
| 05.05.04-quiz | 3 | style | Misspelled command "show-access lists" in the comment; the key is "show access-lists". | #58 → «**show access-lists**» |
| 05.05.04-quiz | 5 | style | MT artefact: "какой оператор описывает" renders "which statement describes" (оператор = operator); the options are statements. Also drops the stray comma after … | #58 → «какое утверждение описывает наиболее» |
| 05.05.04-quiz | 8 | style | MT artefact: "Запись ACE разрешения совпадения (permit)" / "Запись ACE запрета совпадения (deny)" are word-for-word renderings of "permit ACE matches" / "deny A… | #58 → «Счетчик совпадений с записью permit показывает, сколько попыток подключения к портам VTY было разрешено. Совпадение с за…» |
| 05.05.04-quiz | 11 | style | Ungrammatical count marker "(верные два варианта)"; the course formula is "(верны два варианта)". | #58 → «(верны два варианта)» |
| 05.05.04-quiz | 12 | style | MT artefact: "режим конфигурации строки" renders "line configuration mode" as "string"; the mode is the VTY line configuration mode. | #58 → «путем перехода в режим конфигурации линии VTY и ввода команды access-class» |
| 06.03.03-nat-advantages-quiz | 1 | style | Wrong preposition "скрывает ... из внешней сети" (hide from = «от»); missing hyphen in "IPv4 адреса". | #59 → «скрывает IPv4-адреса внутренних узлов от внешней сети» |
| 06.03.03-nat-advantages-quiz | 2 | style | The comment names the right answer "Ложь", but the options are labelled "верно" / "неверно" (the other comments in this quiz say "Правильный ответ – верно/невер… | #59 → «Правильный ответ – неверно.» |
| 06.03.03-nat-advantages-quiz | 3 | style | Calque "между источником и целью" for "source and destination". | #59 → «между источником и узлом назначения» |
| 06.08.04-quiz | 4 | style | "переадресация хостов" for re-addressing hosts: «переадресация» means redirection; the module says «изменение адресации узлов». | #59 → «затраты на изменение адресации узлов могут быть значительными» |
| 06.08.04-quiz | 5 | style | Calque of "do not have to": "не должны быть сконфигурированы" reads as a prohibition (must not), not as "need not". | #59 → «устройства во внутренней сети не нужно перенастраивать» |
| 06.08.04-quiz | 5 | style | Same calque in the comment: "узлы внутренней сети не должны изменять свои адреса" reads as "must not change". | #59 → «узлам внутренней сети не нужно менять свои адреса» |
| 06.08.04-quiz | 6 | style | Plural stem "Какие преимущества" on a singleChoice question with one correct option. | #59 → «Какое преимущество дает NAT64?» |
| 06.08.04-quiz | 8 | style | Dangling gerund: "Используя терминологию NAT, к какому типу адресов относится адрес..." (the gerund has no matching subject). | #59 → «В терминологии NAT к какому типу» |
| 06.08.04-quiz | 8 | style | Mistranslation: "с точки зрения хоста, которому транслируется адрес" (the host to which an address is translated); the module says from the perspective of the d… | #59 → «с точки зрения устройства, адрес которого транслируется» |
| 06.08.04-quiz | 10 | style | Several MT errors in the stem: PCs "назначали IP-адреса от DHCP-серверов" (PCs receive, not assign, addresses), tense mismatch "транслируются", typo "роуеру", a… | #59 → «Компания проектирует свою сеть таким образом, чтобы ПК во внутренней сети получали IP-адреса от DHCP-серверов, а пакеты,…» |
| 07.01.06-purpose-of-wans-quiz | 1 | style | Broken government: "принадлежит и управляется организацией" (принадлежит takes the dative, управляется the instrumental). | #59 → «WAN находится в собственности и под управлением организации или домашнего пользователя» |
| 07.01.06-purpose-of-wans-quiz | 3 | style | The option gives the topology only by its English name; the module names it «звезда» with the English in parentheses. | #59 → «топология типа «звезда» (Hub-and-Spoke)» |
| 07.01.06-purpose-of-wans-quiz | 3 | style | Doubled word "топология топология". | #59 → «частичносвязанная топология (Partially Meshed)» |
| 07.01.06-purpose-of-wans-quiz | 4 | style | Stray comma between subject and predicate: "Какой тип WAN-соединения, обеспечивает избыточность?". | #59 → «Какой тип WAN-соединения обеспечивает» |
| 07.03.05-traditional-wan-connectivity-quiz | 2 | style | Typo "Выберете" (future tense) for the imperative "Выберите", and the sentence is broken: "варианты подключения WAN являются сетью с коммутацией каналов". | #59 → «Выберите традиционные варианты подключения WAN с коммутацией каналов.» |
| 07.03.05-traditional-wan-connectivity-quiz | 3 | style | Typo "Выберете" for "Выберите", wrong case "с коммутации пакетов", and a question mark after an imperative. | #59 → «Выберите традиционные варианты подключения к глобальной сети с коммутацией пакетов.» |
| 07.06.03-quiz | 1 | style | Two names for MAN inside one question: option 3 says «городская сеть (MAN)», the comment says «Муниципальная сеть (MAN)». | #59 → «Городская сеть (MAN)» |
| 07.06.03-quiz | 3 | style | English "Topic" left in the comment (all other comments say «Тема»), and the topic number is wrong: SONET, SDH and DWDM are taught in 7.2, not 7.5. | #59 → «Тема 7.2.0» |
| 07.06.03-quiz | 8 | unclear | The distractor "сеть с коммутацией пакетов" overlaps with the key: Ethernet WAN is itself a packet-switched WAN in the module. The comment also claims that pack… | §1/§2 rephrasing (kb#275) |
| 07.06.03-quiz | 10 | style | MT artefacts in the comment: agreement error "филиалов будет соединены", "со всеми ее филиалами" (the office is masculine), and the garbled "по желанию при необ… | #59 → «(все или большинство филиалов будут соединены друг с другом). Топология «звезда» свяжет центральный офис со всеми его фи…» |
| 08.01.05-vpn-technology-quiz | 4 | style | Typo "соединенить" for "соединить". | #59 → «безопасно соединить» |
| 08.01.05-vpn-technology-quiz | 5 | style | MT artefact: the comment lists VPN types as "корпоративные сети" (enterprise networks); the list is of enterprise-managed VPNs. | #59 → «К VPN, которыми управляет само предприятие, относятся» |
| 08.02.08-types-of-vpns-quiz | 1 | style | Spelling: "безклиентный" for «бесклиентный» (бес- before a voiceless consonant); the comments of the same question say «Бесклиентное». | #59 → «бесклиентный VPN» |
| 08.02.08-types-of-vpns-quiz | 2 | style | MT artefact: "SSL VPN требует подключения только через веб-браузер" says a browser is the only allowed way to connect (client-based SSL VPN exists); the intende… | #59 → «Для подключения через SSL VPN нужен только веб-браузер, а аутентификация может быть односторонней. Однако такие VPN» |
| 08.03.09-ipsec-quiz | 0 | style | Title word "cтек" starts with a Latin "c". | #59 → «стек протоколов IPsec» |
| 08.03.09-ipsec-quiz | 2 | style | MT artefact "предварительные пароли" (preliminary passwords) for pre-shared keys; the module calls them «предустановленные ключи (PSK)». | #59 → «предустановленные ключи (PSK)» |
| 08.03.09-ipsec-quiz | 5 | style | "инфраструктуры IPsec" mistranslates "IPsec framework"; the stem and the module say «структура IPsec». | #59 → «конфиденциальности в структуре IPsec» |
| 08.03.09-ipsec-quiz | 8 | style | Ungrammatical option "DH групп 1, 2, и 5" (genitive plural with no head) and a comma before «и». | #59 → «группы DH 1, 2 и 5» |
| 08.03.09-ipsec-quiz | 8 | style | Ungrammatical option "DH групп 14, 15, и 16" and a comma before «и». | #59 → «группы DH 14, 15 и 16» |
| 08.03.09-ipsec-quiz | 8 | style | Ungrammatical option "DH групп 19, 20, 21 и 24". | #59 → «группы DH 19, 20, 21 и 24» |
| 08.04.02-quiz | 1 | style | Typo "програмное" for "программное". | #59 → «программное» |
| 08.04.02-quiz | 2 | style | Typo "Конфеденциальность" for "Конфиденциальность". | #59 → «Конфиденциальность» |
| 08.04.02-quiz | 3 | unclear | Distractor "SSL VPN" is defensible: a client-based remote-access VPN can use SSL, so an SSL VPN may also require VPN client software (the stem says "может потре… | §1/§2 rephrasing (kb#275) |
| 08.04.02-quiz | 6 | style | Broken sentence "надежно и безопасно способ подключают ..."; the comments on options 4 and 5 of the same question have the intact wording. | #59 → «имеют надежный безопасный способ подключения удаленных пользователей, филиалов и поставщиков» |
| 08.04.02-quiz | 10 | style | "протокол инфраструктуры IPsec" mistranslates "IPsec framework"; the module says «структура IPsec». | #59 → «Какой протокол в структуре IPsec» |
| 08.04.02-quiz | 12 | error | Lost superscript: "1019 лет" should be 10^19 years; as written the comment says a 128-bit key falls in about a thousand years. Note: the space in the raw `old` … | #59 → «— около 10 квинтиллионов лет» |
| 08.04.02-quiz | 12 | style | Calque "сломать" (break) for cracking a key; the comment and the module say «взломать». | #59 → «тем сложнее его взломать» |
| 09.01.05-network-transmission-quality-quiz | 1 | unclear | The question hinges on propagation delay being «переменная». The course table says so, but propagation delay is fixed for a given path (distance / signal speed)… | §1/§2 rephrasing (kb#275) |
| 09.01.05-network-transmission-quality-quiz | 1 | style | Stem is a calque: «переменное количество времени» (variable amount of time) and «назначение» used for destination; the module says «получатель». | held back: 09.01.05 q1 is reworked in the §1/§2 block after learn-ccna3#57 fixes 09.01:56 |
| 09.01.05-network-transmission-quality-quiz | 2 | error | Tautological stem («Что происходит, когда происходит …»), and as asked the distractor «Джиттер» is also a consequence of congestion by the course text. Narrow t… | #59 → «Что происходит при перегрузке, если очередь в памяти устройства переполнена?» |
| 09.01.05-network-transmission-quality-quiz | 4 | style | Calque «изменением в задержке» (variation in delay). | #59 → «Что вызвано изменением задержки?» |
| 09.02.06-traffic-characteristics-quiz | 1 | error | With «как правило, потребляет большую часть» the key «Данные» contradicts the module, which says video is 70–82% of all traffic. The comment and the module only… | #59 → «Какой тип трафика может занять всю полосу пропускания канала связи?» |
| 09.02.06-traffic-characteristics-quiz | 5 | style | Typo «повтроно». | #59 → «не может быть повторно передан» |
| 09.02.06-traffic-characteristics-quiz | 5 | unclear | Two defensible answers: by the module video also runs over UDP, so lost video packets are not retransmitted either; the distractor «Видео» is as correct as «Гол… | §1/§2 rephrasing (kb#275) |
| 09.03.07-queuing-algorithms-quiz | 1 | style | Wrong case: «сократить времени отклика». | #59 → «чтобы сократить время отклика.» |
| 09.04.06-qos-models-quiz | 1 | style | Broken apposition «Модель QoS типа интегрированные сервисы» (nominative after «типа»). | #59 → «Модель интегрированных сервисов (IntServ) обеспечивает политики контроля допуска» |
| 09.04.06-qos-models-quiz | 3 | style | «Дифференцированная модель QoS» misnames the model (it is the model of differentiated services). | #59 → «Модель дифференцированных сервисов (DiffServ) предоставляет различные уровни качества.» |
| 09.04.06-qos-models-quiz | 3 | unclear | The module also credits IntServ with several QoS levels, so «Интегрированные сервисы» is defensible for «обеспечивает много разных уровней качества». The key fo… | §1/§2 rephrasing (kb#275) |
| 09.04.06-qos-models-quiz | 4 | style | Broken apposition «Модель QoS типа интегрированные сервисы». | #59 → «Модель интегрированных сервисов (IntServ) обеспечивает явный» |
| 09.04.06-qos-models-quiz | 5 | error | Comment states DiffServ is the most scalable, contradicting the module (best effort is the most scalable). Rewrite before the key change below. | #59 → «Самая масштабируемая модель — негарантированная доставка: ее ограничивает только доступная пропускная способность, а спе…» |
| 09.04.06-qos-models-quiz | 5 | error | Same wrong claim, plus a case error («наиболее масштабируемыми»). Same new text as answer 1. | #59 → «Самая масштабируемая модель — негарантированная доставка: ее ограничивает только доступная пропускная способность, а спе…» |
| 09.04.06-qos-models-quiz | 5 | error | Wrong key: by the module the most scalable model is best effort («Негарантированная доставка», 09.04 README:39, 09.06 README:42), not DiffServ. The old key has … | #59 key fixed: answer texts 1 and 3 swapped (flags and comments stay) |
| 09.05.14-qos-implementation-techniques-quiz | 2 | style | Question ends with a period instead of a question mark. | #59 → «принадлежит пакет или кадр?» |
| 09.06.02-quiz | 3 | style | Calques «из конца в конец» (end-to-end) and «ориентированный на подключение подход»; the module says «на всем пути» and «подход, ориентированный на соединения». | #59 → «коэффициент потери пакетов на всем пути. Модель IntServ использует подход, ориентированный на соединения,» |
| 09.06.02-quiz | 6 | style | «очередь с жестким приоритетом (PQ)» does not match the module term «строгий» (strict priority queue). | #59 → «со строгим приоритетом (PQ)» |
| 09.06.02-quiz | 7 | style | Calque «В какой единственной модели» (which is the only model); clumsy. | #59 → «В какой модели QoS нет механизма классификации пакетов?» |
| 09.06.02-quiz | 7 | style | Distractor «Принудительного QoS» is a bare genitive (ungrammatical as an option) and does not use the module term for hard QoS. | #59 → «"answer": "Модель строгого качества обслуживания (hard QoS)"» |
| 09.06.02-quiz | 13 | style | Typo «WFC» for WFQ. | #59 → «чем в WFQ.» |
| 10.04.05-snmp-quiz | 5 | unclear | By the standards SNMPv3 carries the same SNMPv2 PDUs with the expanded error-status codes, so «Обе версии» is defensible; the course only contrasts SNMPv2c with… | §1/§2 rephrasing (kb#275) |
| 10.04.05-snmp-quiz | 7 | style | Mistranslated stem: «используется для обеспечения совместимости» (interoperable) and «включает отчеты о целостности сообщений» (message integrity); also ends wi… | #59 → «является совместимым протоколом на основе стандартов и обеспечивает целостность сообщений?» |
| 10.05.06-syslog-quiz | 2 | style | Missing period between the format line and the next sentence («description Поэтому»). | #59 → «description. Поэтому» |
| 10.05.06-syslog-quiz | 3 | style | Missing comma after the introductory «Таким образом». | #59 → «Таким образом, объектом» |
| 10.08.04-quiz | 4 | error | Comment says «ntp broadcast client» lets the device broadcast NTP messages; the command does the opposite: it makes the device accept (receive) NTP broadcasts. | #59 → «Команда ntp broadcast client настраивает прием широковещательных сообщений NTP.» |
| 10.08.04-quiz | 4 | unclear | Not taught: the NTP lecture covers only «ntp server», «show clock detail», «show ntp associations/status»; «ntp master» (the key) and «ntp broadcast client» nev… | §1/§2 rephrasing (kb#275) |
| 10.08.04-quiz | 7 | style | Stray comma after «Компьютер» and a broken participle construction («с загруженным … и используемый»). | #59 → «Компьютер с загруженным программным обеспечением управления, используемый администратором для мониторинга сети» |
| 10.08.04-quiz | 8 | style | Missing comma before the participial phrase «настроенных в режиме read-only». | #59 → «строк сообщества, настроенных» |
| 10.08.04-quiz | 9 | error | Stem says the command is entered on a switch, but every option and the comment, including the key, speak of the router's RAM/NVRAM; the key is literally wrong f… | #59 → «вводит на маршрутизаторе команду» |
| 10.08.04-quiz | 11 | style | Missing space: «Источникзагрузочной». | #59 → «Источник загрузочной» |
| 10.08.04-quiz | 12 | unclear | Vendor model leftover: the image name «c1900-universalk9-mz.SPA.152-4.M3.bin» is a Cisco 1900 IOS image (the audit marks it for replacement with a model-free na… | §1/§2 rephrasing (kb#275) |
| 10.08.04-quiz | 13 | error | Mistranslation makes a false claim: show cdp neighbors lists capabilities («возможности»), not «производительность» (performance). | #59 → «локальный интерфейс, список возможностей, платформу» |
| 10.08.04-quiz | 14 | style | Wrong case: «Что такое сообщений SNMP trap?». | #59 → «Что такое сообщения SNMP trap?» |
| 11.01.08-hierarchical-networks-quiz | 1 | style | Typo in the key: «Отказоустойчая». | held back: learn-ccna3#54 makes this fix (kb#280) |
| 11.01.08-hierarchical-networks-quiz | 5 | style | Comment is a statement but ends with «?» (copied from the stem). | held back: learn-ccna3#54 makes this fix (kb#280) |
| 11.01.08-hierarchical-networks-quiz | 6 | style | MT artefact «интегрируется с магистралью и пользователями для обеспечения …» (a layer does not «integrate with users»); the module describes the distribution la… | #60 → «Какой уровень сети связывает магистраль с пользователями и обеспечивает интеллектуальную коммутацию, маршрутизацию и без…» |
| 11.01.08-hierarchical-networks-quiz | 6 | style | Same MT wording as the stem, and the statement ends with «?». | held back: learn-ccna3#54 makes this fix (kb#280) |
| 11.03.08-switch-hardware-quiz | 3 | style | Agreement: the stem asks «Как называют коммутаторы …» (plural) but the key is singular «Стекируемый» while «Модульные» is plural. | #60 → «"Стекируемые"» |
| 11.03.08-switch-hardware-quiz | 3 | style | Same agreement problem: «Многоуровневый» should be plural. | #60 → «"Многоуровневые"» |
| 11.03.08-switch-hardware-quiz | 6 | style | Calque «интегральные схемы для конкретных приложений (ASIC)»; the module term is «специализированные интегральные микросхемы (ASIC)». | #60 → «специализированные интегральные микросхемы (ASIC)» |
| 11.04.04-router-hardware-quiz | 0 | style | Capital letter after the colon; every other quiz title in the course uses lower case there. | #60 → «"Тест на понимание темы: оборудование для маршрутизации"» |
| 11.05.03-quiz | 5 | style | «свойство модели» mistranslates «design feature»; no model is named. Q13–Q14 of the same quiz say «решение при проектировании». | #60 → «Какое решение при проектировании ограничит» |
| 11.05.03-quiz | 7 | style | Wrong term «сквозной доступ PoE» (PoE pass-through) and the collocation «роль выполняет»; the module says «сквозное питание PoE». | #60 → «Какую функцию выполняет сквозное питание PoE?» |
| 11.05.03-quiz | 7 | style | Wrong term «Сквозная коммутация PoE»; the module says «сквозное питание PoE». | #60 → «Сквозное питание PoE позволяет» |
| 11.05.03-quiz | 11 | error | Garbled comment: «Коммутаторы уровня распространения получают доступ к коммутаторам уровня доступа» is meaningless and wrong; «функции переключения» mistranslat… | held back: learn-ccna3#54 makes this fix (kb#280) |
| 11.05.03-quiz | 12 | error | «для включения резервных каналов после создания коммутируемой сети» reads as «to turn redundant links on», the opposite of what STP does (it blocks redundant pa… | #60 → «Какая технология необходима, если в коммутируемой сети есть резервные каналы?» |
| 11.05.03-quiz | 12 | error | Comment claims link aggregation has nothing to do with link redundancy, which contradicts the course (EtherChannel provides redundancy); it also leaves English … | #60 → «Если в коммутируемой сети есть резервные каналы 2-го уровня, обязательно используйте протокол связующего дерева (STP): о…» |
| 11.05.03-quiz | 14 | style | Clumsy, redundant stem «подключения узлов к уровню доступа для конечных устройств» (hosts and end devices both, wrong preposition). | #60 → «расширяет возможности подключения оконечных устройств на уровне доступа?» |
| 12.01.09-network-documentation-quiz | 2 | style | Typo «комутационным» and a missing preposition: «Документация комутационным устройствам» is not grammatical. | #60 → «Документация по коммутационным устройствам LAN» |
| 12.01.09-network-documentation-quiz | 4 | style | Typos «какик» and «части … используется» (agreement), and the comment never says why the statement is false. | #60 → «Правильный ответ — Ложь. Определение базовых показателей длится ограниченное время: обычно на него уходит от 2 до 4 неде…» |
| 12.02.08-troubleshooting-process-quiz | 4 | style | MT artefact: a stray comma after the adverbial phrase and «глобальное, специфичное для интерфейса состояние» (a calque of "global and interface-specific status"… | #60 → «На этапе сбора информации какая команда отображает настроенные протоколы уровня 3, а также их общее и специфичное для ин…» |
| 12.02.08-troubleshooting-process-quiz | 5 | style | Broken syntax: «Какой самый высокий уровень OSI, который следует учитывать …?» is a relative clause with no main predicate (calque of "What is the highest OSI l… | #60 → «Какой самый высокий уровень модели OSI следует учитывать при» |
| 12.02.08-troubleshooting-process-quiz | 7 | style | Calque «проблемы, ориентированной на программное обеспечение» ("software-oriented problem"). | #60 → «при возникновении проблемы с программным обеспечением?» |
| 12.02.08-troubleshooting-process-quiz | 7 | style | Same calque in the comment on every wrong answer; the comma after the phrase goes with it. | #60 → «При возникновении проблемы с программным обеспечением следует» |
| 12.04.07-symptoms-and-causes-of-network-problems-quiz | 5 | style | MT artefact: «(например, на уровне OSI 7)» means "for example at layer 7"; the application layer IS layer 7 (i.e., not e.g.). | #60 → «(т.е. на уровне OSI 7)» |
| 12.06.04-quiz | 1 | style | Calque «токенной сетью» for "token-passing network". | #60 → «Она описывает, является ли локальная сеть широковещательной или в ней используется передача маркера.» |
| 12.06.04-quiz | 2 | style | Spelling: «Сверху-вниз» is written without a hyphen. | #60 → «Сверху вниз» |
| 12.06.04-quiz | 2 | style | Spelling: «Снизу-вверх» is written without a hyphen. | #60 → «Снизу вверх» |
| 12.06.04-quiz | 4 | error | The comment contradicts the key: it says a successful ping proves the network layer works and only "the rest" must be checked, while the key is «От сетевого уро… | #60 → «Тема 12.4.0 — Успешная отправка эхо-запроса показывает, что физический и канальный уровни работают и между устройствами …» |
| 12.06.04-quiz | 5 | style | «IoE» (Internet of Everything) is a Cisco marketing term, not used anywhere in the course; also the typo «созздать» and the calque «диаграммы новой физической т… | #60 → «из-за внедрения IoT администратору сети необходимо создать схемы новой физической топологии.» |
| 12.06.04-quiz | 6 | style | MT artefact: "an email" (a message) rendered as «электронная почта» (the service): «Насколько велика электронная почта, которую вы пытались отправить?». | #60 → «Какого размера было письмо, которое вы пытались отправить?» |
| 12.06.04-quiz | 6 | style | Mistranslation of "Is your email working now?": «Ваш адрес электронной почты теперь работает?» (an address does not "work"; «теперь» ≠ "now" in this sense). | #60 → «Ваша электронная почта сейчас работает?» |
| 12.06.04-quiz | 8 | unclear | The question asks to classify third-party products (WhatsUp Gold, CyberGauge, LANsurveyor) that the course never names; only Wireshark appears in the module. It… | §1/§2 rephrasing (kb#275) |
| 12.06.04-quiz | 9 | style | Case error: «неполадок с производительности сети» (genitive after «с» instead of instrumental). | #60 → «неполадок с производительностью сети» |
| 12.06.04-quiz | 10 | unclear | The options «Уточнение области поисков», «Определение владения», «Сбор данных о симптомах от предположительно неисправных устройств», «Документирование симптомо… | §1/§2 rephrasing (kb#275) |
| 12.06.04-quiz | 11 | style | Broken parallelism: «проверить правильность установки и действительно ли аутентификация зашифрована» joins a noun and an indirect question. | #60 → «Инженер по сети должен проверить, правильно ли все установлено и действительно ли аутентификация зашифрована.» |
| 12.06.04-quiz | 11 | style | The comment explains a tool «Средство защиты от ошибок и неисправностей … управления отказоустойчивостью», which is not among the options (option 4 is «Инструме… | #60 → «Средство определения базовых показателей автоматизирует документирование сети и сбор данных о ее нормальной работе. Инст…» |
| 13.01.06-cloud-computing-quiz | 1 | style | The question ends with a period instead of a question mark. | #60 → «Какая услуга обеспечивает доступ к средствам разработки и сервисам доставки приложений?» |
| 13.01.06-cloud-computing-quiz | 2 | style | Truncated comment: it ends with «услугам,.» and never names the services from the stem. | #60 → «ПО как услуга (SaaS). Поставщик облачных сервисов отвечает за доступ к онлайн-приложениям и услугам, таким как электронн…» |
| 13.01.06-cloud-computing-quiz | 4 | style | Agreement error «каждая часть которого» (refers to nothing: «модель» is feminine, «облака» plural), «представляет» for "consists of", and a period instead of a … | #60 → «Какая облачная модель объединяет два или более облака, каждое из которых остается отдельным объектом, однако все они свя…» |
| 13.01.06-cloud-computing-quiz | 4 | style | Same agreement error «каждая часть которого» in the comment on every wrong answer. | #60 → «Гибридная облачная модель объединяет два или более облака, каждое из которых остается отдельным объектом» |
| 13.01.06-cloud-computing-quiz | 5 | style | Case error «удовлетворяет потребностей» (accusative needed) and a period instead of a question mark. | #60 → «Какая облачная модель удовлетворяет потребности какой-либо конкретной отрасли, например здравоохранения или СМИ?» |
| 13.02.07-virtualization-quiz | 2 | style | Agreement: «память, мощность и место …, отведенное» — the participle agrees with the last noun only; it refers to all three. | #60 → «отведенные для одной службы?» |
| 13.02.07-virtualization-quiz | 4 | error | Factually wrong list item: virtualization gives «поддержку устаревших ОС и приложений», not support for legacy hardware (it frees workloads from specific hardwa… | #60 → «Поддержка устаревших ОС и приложений.» |
| 13.03.04-virtual-network-infrastructure-quiz | 3 | style | Wrong term: «перераспределение» (redistribution) for oversubscription; the module calls it «переподписка». | #60 → «не допускают переподписку ресурсов сервера.» |
| 13.03.04-virtual-network-infrastructure-quiz | 3 | style | Same wrong term in the comment, and «все четыре экземпляра ОС» refers to an example of four instances that the comment never gives. | #60 → «Некоторые консоли управления позволяют серверу настраивать переподписку ресурсов. Она возникает, когда установлено неско…» |
| 13.04.05-software-defined-networking-quiz | 1 | style | Number mismatch: «Какая характеристика лучше всего описывает … (Выберите три варианта.)» — three answers are asked for. | #60 → «Какие характеристики лучше всего описывают уровень управления» |
| 13.04.05-software-defined-networking-quiz | 2 | style | The comment mixes three names for the planes inside one question («плоскость пересылки данных», «плоскость контроля», «плоскость данных») against the module's «… | #60 → «Уровень передачи данных (data plane) также называется уровнем пересылки. Обычно это коммутационная структура, соединяюща…» |
| 13.04.05-software-defined-networking-quiz | 2 | style | Same mixed plane terms as the answer 1 comment (a slightly different copy); both comments get one text. | #60 → «Уровень передачи данных (data plane) также называется уровнем пересылки. Обычно это коммутационная структура, соединяюща…» |
| 13.04.05-software-defined-networking-quiz | 3 | error | The question tests the control plane vs management plane distinction, which the Russian course text does not make: it calls both «уровень управления». The comme… | §1/§2 rephrasing (kb#275) |
| 13.04.05-software-defined-networking-quiz | 6 | style | Garbled stem: «Что используется стандартизированными запросами контроллера SDN …» (APIs are themselves the "set of standardized requests"), ending with a period… | #60 → «Что использует контроллер SDN для определения поведения уровня передачи данных на нисходящих коммутаторах и маршрутизато…» |
| 13.05.08-controllers-quiz | 3 | style | Calque «Централизованное расположение этого типа SDN отвечает за управление устройствами» — a "location" cannot manage devices. (Policy-based SDN also has a cen… | #60 → «В этом типе SDN приложения взаимодействуют с централизованным контроллером, который знает обо всех устройствах в сети и …» |
| 13.05.08-controllers-quiz | 3 | style | Same calque «централизованное расположение» in the comment. | #60 → «Так работает SDN на основе контроллера. В этом типе SDN централизованный контроллер знает обо всех устройствах сети и уп…» |
| 13.05.08-controllers-quiz | 4 | style | Typo «устройста». | #60 → «программировать устройства.» |
| 13.05.08-controllers-quiz | 5 | style | Mistranslation «задачи дополнительной настройки» ("advanced configuration tasks"); the module and the comment say «задачи настройки». | #60 → «автоматизируют задачи настройки» |
| 13.06.03-quiz | 1 | error | False absolute claim «Технологии BaaS не существует» (BaaS is a known term: Backend as a Service, and browser-as-a-service offerings exist). What makes the opti… | #60 → «Тема 13.1.0 — Браузер как услуга (BaaS) не входит в число основных типов облачных сервисов.» |
| 13.06.03-quiz | 7 | style | Wrong topic reference: private clouds and the data-center text of this comment are in topic 13.1, not 13.2 (virtualization). | #60 → «Тема 13.1.0 — У крупного предприятия» |
| 13.06.03-quiz | 8 | unclear | Two keys out of several defensible options. The key includes «Удовлетворить растущие потребности в электропитании и аппаратных средствах», which the course does… | §1/§2 rephrasing (kb#275) |
| 13.06.03-quiz | 9 | style | Case error «Обмен данных» (обмен чем? — instrumental). | #60 → «Обмен данными между контроллером и коммутаторами» |
| 13.06.03-quiz | 10 | style | The comment lists six layers (with «Ассемблер», «Ядро», «Услуги») while the module teaches four (сервисы, ОС, микропрограмма, аппаратное обеспечение), and says … | #60 → «Тема 13.2.0 — Компьютерная система состоит из следующих уровней абстракции: сервисы, ОС, микропрограммное и аппаратное о…» |
| 13.06.03-quiz | 12 | style | Case error «обмен данных» (обмен чем? — instrumental). | #60 → «обмен данными между виртуальными серверами в ЦОД» |
| 13.06.03-quiz | 13 | style | Two words for one plane inside one question: the stem and answer 1 say «плоскость контроля», answers 2-4 and the comment say «уровень управления» (the module te… | #60 → «Как изменяется уровень управления для работы с виртуализацией сети?» |
| 13.06.03-quiz | 13 | style | Same mixed term «плоскости контроля» in answer 1. | #60 → «резервирование уровня управления.» |
| 13.06.03-quiz | 13 | style | Case error: «Уровня управления на каждом устройстве подключается» (subject must be nominative). | #60 → «Уровень управления на каждом устройстве подключается» |
| 14.02.09-data-formats-quiz | 5 | style | «Этот формат информативен благодаря структуре данных» is a loose rendering of "self-descriptive" that fits every listed format; the module and the comment use «… | #60 → «Этот формат данных самоописательный.» |
| 14.03.06-apis-quiz | 3 | unclear | After de-branding ("used by Cisco to give students lab access" → «учебная платформа … студентам»), the key «Открытые или публичные API» is hard to defend: acces… | §1/§2 rephrasing (kb#275) |
| 14.04.07-rest-quiz | 3 | error | By the standards the key is wrong: «www.ya.ru/c/en/us/solutions/design-zone.html» is not a URN (a URN has the form urn:<NID>:<NSS>; a string without a scheme is… | §1/§2 rephrasing (kb#275) |
| 14.04.07-rest-quiz | 4 | unclear | Two defensible answers: option 2 «https://www.ya.ru/c/en/us/solutions/design-zone.html» is a URL, and every URL is a URI, both by RFC 3986 and by the course tex… | §1/§2 rephrasing (kb#275) |
| 14.04.07-rest-quiz | 5 | unclear | Ambiguous stem: «Что из перечисленного составляет часть запроса RESTful?» — the course lists five parts of an API request, including the two distractors «API се… | §1/§2 rephrasing (kb#275) |
| 14.05.06-configuration-management-quiz | 2 | style | Calque: «Какой термин описывает инструмент управления конфигурацией: Программное выполнение задачи …» says the term describes a tool (automation is not a tool);… | #60 → «Какой термин управления конфигурацией описывает программное выполнение задачи в системе, например настройку интерфейса и…» |
| 14.05.06-configuration-management-quiz | 3 | style | Same calque «Какой термин описывает инструмент управления конфигурацией:», plus «процесс того, как …, такие как порядок» and a period instead of a question mark… | #60 → «Какой термин управления конфигурацией описывает процесс, который определяет, как и в каком порядке выполняются все автом…» |
| 14.05.06-configuration-management-quiz | 4 | style | English left in prose with broken grammar: «осуществляется «push-based»». | #60 → «Безагентное управление конфигурацией работает на основе push («push-based»).» |
| 14.06.10-ibn-and-cisco-dna-center-quiz | 2 | style | English word order «IBN функция»; Q1 of the same quiz says «функция IBN». | held back: superseded: rewritten by kb#280 after the review (learn-ccna3#56) |
| 14.06.10-ibn-and-cisco-dna-center-quiz | 3 | style | English word order «IBN функция» and a period instead of a question mark. | held back: superseded: rewritten by kb#280 after the review (learn-ccna3#56) |
| 14.06.10-ibn-and-cisco-dna-center-quiz | 4 | style | Gender agreement: «Наложение … Он также предоставляет» («наложение» is neuter). The same slip is in the lecture. | held back: superseded: rewritten by kb#280 after the review (learn-ccna3#56) |
| 14.07.02-quiz | 3 | style | Typo in the resource path: «direction/v2/route»; the stem and the URI have «directions/v2/route». | #60 → «directions/v2/route» |
| 14.07.02-quiz | 5 | style | Typo «Темы 14.5.0» (every other comment says «Тема …»). | #60 → «Тема 14.5.0» |
| 14.07.02-quiz | 12 | style | «IBNS» is never used in the course (the module says IBN), and «функция сетевой системы, основанной на IBNS» is redundant ("intent-based network system based on … | held back: superseded: rewritten by kb#280 after the review (learn-ccna3#56) |
| 14.07.02-quiz | 12 | style | Same untaught abbreviation «IBNS» in the comment. | held back: superseded: rewritten by kb#280 after the review (learn-ccna3#56) |
| 14.07.02-quiz | 14 | error | The comment on "which characters delimit a JSON key" shows the key in guillemets («ключе», and declined): JSON keys use straight double quotes, so the example c… | #60 → «Они должны быть заключены в двойные кавычки, например "ключ", и могут» |
| 14.07.02-quiz | 15 | style | The JSON sample is written with guillemets («ключ»: «значение»), which is not valid JSON syntax. | #60 → «"ключ": "значение", "ключ": "значение".» |

## Findings: Exams

| File | Q | Sev | Issue | Fix |
|---|---|---|---|---|
| 01-02-exam | 4 | style | Typo «роутерм» in the stem. Text written anew cannot use «роутер» (kb#279), so the whole stem uses «маршрутизатор» (one word in the question); this matches the … | #61 → «Какой шаг делает маршрутизатор с поддержкой OSPF сразу после установления смежности с другим маршрутизатором?» |
| 01-02-exam | 8 | style | Calque «соседское взаимоотношение» (neighbor adjacency): unnatural Russian; the module says «отношения смежности». | #61 → «Чтобы установить отношения смежности» |
| 01-02-exam | 11 | style | Stray semicolon in the matching option «состояние Down;». | #61 → «состояние Down» |
| 01-02-exam | 11 | style | Gender agreement: «состояние … в котором он встречается»; «состояние» is neuter. | #61 → «в котором оно встречается» |
| 01-02-exam | 19 | style | The code fence opens in mid-line («команды: ```»), so it is not a fenced block; the closing line «```. Что означает цифра 11?» then starts an unclosed fenced bl… | #61 → «использует следующие команды: ``` R1(config)# router ospf 11 R1(config-router)# network 10.10.10.0 0.0.0.255 area 0 ``` …» |
| 01-02-exam | 20 | error | Comment is left over from the /16 version: it speaks of «172.16.1.0/16» and a mask matching the first 16 bits, which would make answer 1 (0.0.255.255) correct, … | #61 → «Чтобы объявить только сеть 172.16.1.0/24, шаблонная маска в команде network должна требовать совпадения первых 24 бит ад…» |
| 01-02-exam | 21 | error | Comment names show ip ospf interface serial 0/0/0 for OSPFv3 (should be show ipv6 ospf …), has a broken word «dead вого», a case error «коллективного доступом»,… | #61 → «Команда show ip ospf interface serial 0/0/0 отображает настроенные интервалы приветствия (hello) и простоя (dead) на пос…» |
| 01-02-exam | 23 | error | «Процесс выбора DR и BDR … не является приоритетным» mistranslates non-preemptive; in a question about priorities it says the opposite of what is meant. | #61 → «не является вытесняющим» |
| 01-02-exam | 26 | style | Comment is broken MT: formula split across lines («опорная пропускная способность /пропускная способность интерфейса По умолчанию»), English «A LAN», «Gigabit E… | #61 → «Стоимость OSPF рассчитывается по формуле: опорная пропускная способность / пропускная способность интерфейса. По умолчан…» |
| 01-02-exam | 26 | unclear | Key 65 relies on truncation (100 000 000 / 1 544 000 = 64.77 → 64). The lecture says OSPF rounds to the nearest integer (which gives 65 + 1 = 66) and then contr… | §1/§2 rephrasing (kb#275) |
| 01-02-exam | 27 | style | «распределяет этот маршрут по умолчанию» (allocates) instead of «распространяет» (propagates). | #61 → «R0-A затем распространяет этот маршрут» |
| 01-02-exam | 29 | style | Calque «Какая команда обеспечила администратору получение этого вывода?». | #61 → «С помощью какой команды администратор получил этот вывод?» |
| 01-02-exam | 30 | style | Broken command name «show ip protocol s». | #61 → «show ip protocols» |
| 01-02-exam | 30 | style | Garbled stem «предоставляет список сетей, объявленных сетей». | #61 → «Какая команда позволяет проверить, включен ли OSPF, и выводит список объявляемых сетей?» |
| 01-02-exam | 31 | style | Spelling: «будет не доступна» → «будет недоступна». | #61 → «будет недоступна» |
| 01-02-exam | 33 | style | Broken word order «пути равной стоимости балансировки нагрузки» (equal-cost path load balancing). Same distractor in Q34; count 2 covers both. | #61 → «балансировка нагрузки по путям равной стоимости» |
| 01-02-exam | 36 | style | «роутера, заполняющего информацию о состоянии канала» mistranslates "flooding"; read literally ("filling in") it describes building the database, which makes di… | #61 → «рассылающего информацию о состоянии канала» |
| 01-02-exam | 38 | style | Calque «в инструкции сети OSPF» (OSPF network statement); the module calls it «команда network». Same phrase in Q38-Q42; count 5 covers all. | #61 → «в команде OSPF network» |
| 01-02-exam | 40 | error | 192.168.223.0 255.255.254.0 is not a network address: a /23 starts at an even third octet, so the network is 192.168.222.0/23. The key 0.0.1.255 stays right. | #61 → «192.168.222.0 255.255.254.0» |
| 01-02-exam | 45 | style | Calque «Какая команда является способом сделать новый идентификатор роутера эффективным…» ("make the new router ID effective"). | #61 → «С помощью какой команды можно применить новый идентификатор маршрутизатора после его изменения в OSPF?» |
| 03-05-exam | 2 | style | Ungrammatical «Какая мотивация обычно движет киберпреступниками атаковать сети» («движет кем» does not take an infinitive). | #61 → «Что обычно побуждает киберпреступников атаковать сети» |
| 03-05-exam | 5 | style | Comment says «социотехника» while the key and the module say «социальная инженерия» (two words for one thing in one question). | #61 → «Социальная инженерия состоит в попытках вызвать доверие сотрудника и убедить его раскрыть конфиденциальную или важную ин…» |
| 03-05-exam | 9 | style | «синхронная атака SYN-flood»: SYN mistranslated as "synchronous"; the module says «лавинная атака SYN-flood». Same text is the key of Q38; count 2 covers both. | #61 → «лавинная атака SYN-flood» |
| 03-05-exam | 11 | style | Case error «систем предотвращение вторжений» and MT «разворачивается внутри» (inline). | #61 → «Преимущество систем предотвращения вторжений (IPS) заключается в том, что они могут определять и останавливать вредоносн…» |
| 03-05-exam | 12 | style | Spelling «ассиметричными». | #61 → «асимметричными» |
| 03-05-exam | 14 | style | Garbled comment: «14 битов высокого уровня/порядка», «Подстановочная маска» (module: «шаблонная»), typo «заиси», missing period, «Маска точечно-десятичной заиси… | #61 → «У всех сетей с 172.16.0.0 по 172.19.0.0 совпадают 14 старших бит адреса. Шаблонная маска, которая требует совпадения 14 …» |
| 03-05-exam | 15 | error | Comment says any «разрешить любую маску, которая соответствует критериям»; any stands for the pair 0.0.0.0 255.255.255.255 and matches any address. Also tautolo… | #61 → «Ключевое слово host заменяет шаблонную маску 0.0.0.0 и указывает один конкретный адрес: deny host 192.168.5.5 означает т…» |
| 03-05-exam | 16 | style | Truncated mask in the comment: «permit 192.168.10.0 0.0.127» (answer 1 is 0.0.0.127). | #61 → «permit 192.168.10.0 0.0.0.127» |
| 03-05-exam | 18 | style | Clumsy «но оставить у обоих учащихся доступ к веб с компьютеров». | #61 → «но сохранить у обоих учащихся доступ к веб-ресурсам» |
| 03-05-exam | 23 | style | Exhibit 4.png still shows the prompt «CiscoVille(config)#», while the stem says «роутер Kostroma» and the comment quotes «Kostroma(config)# access-list 9 deny …… | image follow-up (CSV in the exam PR) |
| 03-05-exam | 24 | style | Typo «ключевое слвов host» in the comments of answers 3 and 4 (answer 5 already has «слово»). | #61 → «ключевое слово host» |
| 03-05-exam | 25 | style | Typo «роуера R2»; new text uses «маршрутизатора» (kb#279), as the bank twin does; no other router noun in the question. | #61 → «интерфейсу G0/0 маршрутизатора R2» |
| 03-05-exam | 27 | style | «к внутреннему трафику» for inbound; the module says «входящий». | #61 → «к входящему трафику интерфейса FastEthernet 0/0» |
| 03-05-exam | 27 | style | «к внешнему трафику» for outbound; the module says «исходящий». | #61 → «к исходящему трафику на всех интерфейсах» |
| 03-05-exam | 27 | error | Negation flipped: «Весь остальной трафик в подсеть 172.16.3.0/24 пропускаться не должен». The source requires all other traffic to be permitted; as written, blo… | #61 → «должен пропускаться» |
| 03-05-exam | 27 | style | «применен к внешнему трафику на интерфейсе Fa0/0» for outbound; the module says «исходящий»; exhibit uses ip access-group 1 out. | #61 → «применен к исходящему трафику на интерфейсе Fa0/0» |
| 03-05-exam | 29 | style | «SSH-соединение с рабочей станцией с IP … к устройству» reads as "connection with the workstation"; answers 3-4 correctly say «от рабочей станции». | #61 → «SSH-соединение от рабочей станции с IP» |
| 03-05-exam | 35 | error | Mistranslation: the policy is stated as denying FTP/Telnet «от всех внешних источников», but the source and the exhibit deny the interns (172.18.200.0/24); «инт… | #61 → «запрещающего стажерам подключаться к файловому серверу Corp по FTP и Telnet. Адрес файлового сервера — 172.16.1.15, а вс…» |
| 03-05-exam | 36 | error | Key fix, step 1 of 3. Only answer 1 is correct as written: answer 5 (devices on 192.168.10.0/24 can ping 192.168.11.0) is false because ACE 2 denies their echo … | #61 → «разрешается отвечать на запросы ping» |
| 03-05-exam | 36 | style | Key fix, step 2 of 3: comment has English «pings» and does not cover answers 3-5; rewritten for the new key (1, 2). | #61 → «Первая запись ACE разрешает устройству 192.168.10.1 любой IP-трафик. Вторая запись отбрасывает эхо-запросы остальных уст…» |
| 03-05-exam | 36 | error | Key fix, step 3 of 3: correct answers should be 1 and 2, not 1 and 5. The old key answer 5 has no comment while the wrong answers share one: the comment must mo… | #61 key → answer 1, 2 |
| 03-05-exam | 38 | style | «При синхронной атаке SYN flood TCP»: SYN mistranslated as "synchronous" (three narrow fixes so that no new text repeats «хост»). | #61 → «При лавинной атаке SYN-flood TCP» |
| 03-05-exam | 38 | style | «непрерывный поток синхронных запросов сеансов TCP» (SYN requests). | #61 → «непрерывный поток запросов сеанса TCP SYN» |
| 03-05-exam | 38 | style | «в ответ на каждый синхронный запрос сеанса» (each SYN). | #61 → «TCP SYN-ACK в ответ на каждый запрос SYN» |
| 03-05-exam | 40 | style | Broken grammar: «не соответствует одному из инструкций в ACL, имеет неявное запрещение применяется к нему». | #61 → «К любому трафику, который не соответствует ни одной из записей ACL, применяется неявный запрет (deny), то есть он отбрас…» |
| 03-05-exam | 40 | style | Calque «настроенным заявлениям ACL» (statements). | #61 → «настроенным записям ACL» |
| 03-05-exam | 41 | style | Typo in the subinterface name «Gigabit 0/1/.12». | #61 → «Gigabit 0/1.12» |
| 03-05-exam | 45 | style | «групповую маску» for the wildcard mask; the module term is «шаблонная маска». | #61 → «шаблонную маску» |
| 03-05-exam | 48 | error | «предварительно открытого ключа» mistranslates pre-shared key: «открытый ключ» is the public key of asymmetric encryption, which points away from the key (symme… | #61 → «предварительно согласованного общего (секретного) ключа» |
| 03-05-exam | 48 | style | Answer 3 «aсимметричного» starts with a Latin «a» (U+0061) instead of Cyrillic «а» (U+0430), which breaks search and spell-checking. | #61 → «асимметричного» |
| 03-05-exam | 52 | style | Typo «во входащем направлении». | #61 → «во входящем направлении» |
| 03-05-exam | 52 | style | Typo «во входяшем направлении». | #61 → «во входящем направлении» |
| 03-05-exam | 55 | style | Dangling gerund «на интерфейсе WAN R2, подключившись к Интернету»; same distractor in Q57 answer 4; count 2 covers both. | #61 → «подключенном к Интернету» |
| 03-05-exam | 58 | style | Garbled stem «использовать команду access-class 20 в параметре конфигурации или команде?»; Q61-Q63 were already rewritten as «использовать команду …?». | #61 → «команду **access-class 20**?» |
| 03-05-exam | 58 | unclear | Two defensible answers: answer 3 renders "to secure management traffic into the router", which also describes access-class on VTY lines (the source pool uses it… | §1/§2 rephrasing (kb#275) |
| 06-08-exam | 2 | style | Comment repeats a clause after the sentence ends (garbled copy) and writes the pool name as «NAT-POOL 2». | #62 → «пул NAT-POOL2 связан не с настроенным списком ACL 1, а с ACL 100. Это станет причиной сбоя PAT (преобразование адресов п…» |
| 06-08-exam | 3 | style | Wrong case: «на последовательном интерфейс R1». | #62 → «на последовательном интерфейсе R1» |
| 06-08-exam | 4 | error | Comment gives the static inside global address as 209.165.200.255; the exhibit configures 209.165.200.225. | #62 → «209.165.200.225» |
| 06-08-exam | 4 | style | MT garble «пул NAT с внутренним глобальным адресом или перегрузкой». | #62 → «пул внутренних глобальных адресов или NAT с перегрузкой» |
| 06-08-exam | 4 | style | Gender agreement: NAT is masculine in this course («статического NAT», «динамический NAT» in 06-nat-for-ipv4/06.09-summary/README.md:22,46; «статический NAT» in… | #62 → «является статическим NAT» |
| 06-08-exam | 5 | style | Typo in the unused option: 209.65.200.254 instead of 209.165.200.254. | #62 → «209.165.200.254» |
| 06-08-exam | 7 | style | Typo «рутера». | #62 → «один порт маршрутизатора» |
| 06-08-exam | 7 | error | Comment claims «Поскольку имеется 4 пропуска, проблема очевидна» (mistranslation of 'a problem might be evident'), contradicting the key that translation works;… | #62 → «» |
| 06-08-exam | 9 | style | MT garble in the comment («Отображаются только номера портов…», «4 000 синхронных переводов»). | #62 → «Номера портов отображаются только при использовании PAT. Такие же выходные данные были бы и при PAT с пулом адресов.» |
| 06-08-exam | 10 | error | Comment defines outside local addresses as 'the real private addresses of destination hosts behind other NAT devices', which contradicts the module; the same co… | #62 → «Внешними локальными называют адреса назначения, видимые из внутренней сети; обычно они совпадают с внешними глобальными.» |
| 06-08-exam | 14 | style | «перенаправляемых» (redirected) for forwarded packets; the comment of the same question says «пересылаемых». | #62 → «для пакетов, пересылаемых в Интернет» |
| 06-08-exam | 16 | unclear | Exhibit 11.PNG shows «pool NAT-POOL1: netmask …» while the configuration and the line «access-list 1 pool corp» name the pool corp; the comment says the output … | image follow-up (CSV in the exam PR) |
| 06-08-exam | 18 | style | Calque «по всему городу» (across town) and missing hyphen in «WAN соединения». | #62 → «Когда связываются два офиса в разных концах города, передача данных, скорее всего, осуществляется через какое-либо WAN-с…» |
| 06-08-exam | 20 | error | Two matching items carry the same label «оборудование передачи данных»; item 4 (match 5, customer devices that send data from the corporate network onto the WAN… | #62 → «терминальное оборудование данных"» |
| 06-08-exam | 26 | error | Comment says MD5 and SHA are used 'to prevent interception and modification'; hashing detects modification, it does not prevent interception. | #62 → «два популярных алгоритма, которые позволяют обнаружить изменение данных при передаче (обеспечивают целостность)» |
| 06-08-exam | 27 | error | Same claim that MD5/SHA prevent interception. | #62 → «два популярных алгоритма, которые позволяют обнаружить изменение данных при передаче (обеспечивают целостность и подлинн…» |
| 06-08-exam | 29 | error | Comment calls OSPF an open-source routing protocol. | #62 → «OSPF – это протокол маршрутизации, основанный на открытом стандарте.» |
| 06-08-exam | 30 | style | Typo «могоуровневый» (missing «н») in answer 4; the bank twin reads «Многоуровневый коммутатор». | #62 → «многоуровневый коммутатор» |
| 06-08-exam | 30 | unclear | Question tests vendor products (ASA site-to-site VPN configured with ASDM, ISR router); it cannot be made neutral without changing what it tests. | §1/§2 rephrasing (kb#275) |
| 06-08-exam | 34 | style | Wrong expansion of DMVPN («виртуальные многоточечные соединения»). | #62 → «динамическую многоточечную VPN-сеть (DMVPN)» |
| 06-08-exam | 38 | unclear | Exhibit 14.png labels Inside Global = 209.165.200.254 and Outside Local = 209.165.200.225, which contradicts the key and the comment (inside global 209.165.200.… | image follow-up (CSV in the exam PR) |
| 06-08-exam | 39 | style | Calque «Какая инструкция» for 'which statement'. | #62 → «Какое утверждение правильно описывает» |
| 06-08-exam | 39 | error | Comment calls 192.0.2.254 an outside (external) IP address; in the exhibit it is the inside global address. | #62 → «преобразуется во внутренний глобальный адрес 192.0.2.254» |
| 06-08-exam | 39 | error | Distractor is broken Russian and, as worded, true for the static entry; reword so it is wrong as intended. | #62 → «трафик из Интернета сможет напрямую достигать частных внутренних адресов IPv4» |
| 06-08-exam | 41 | style | «Пропускная способность медленнее» (bandwidth is not slow; it is lower). | #62 → «Пропускная способность глобальных сетей обычно ниже из-за их большей сложности.» |
| 09-12-exam | 1 | style | Wrong case «о качества обслуживания». | #62 → «о качестве обслуживания» |
| 09-12-exam | 5 | style | Typo «на роуере R1»; dropping the noun avoids writing «роутер» and mixing it with «маршрутизатор» in the same question. | #62 → «вводит на маршрутизаторе R1» |
| 09-12-exam | 9 | style | «устанавливает ограничения маршрутизации уровня 3»: 'boundaries' mistranslated as 'restrictions'. | #62 → «устанавливает границы маршрутизации уровня 3» |
| 09-12-exam | 9 | error | Known: matching key 0 is not among the options (placeholder item). Structural, no text fix. | structural: stays |
| 09-12-exam | 12 | unclear | The stages of gathering symptoms («определение владения», «уточнение области поисков» etc.) are not taught in module 12, so the question cannot be answered from… | §1/§2 rephrasing (kb#275) |
| 09-12-exam | 15 | style | Wrong case: «пересылался перед сетевым трафиком в другие очереди» (accusative of direction) for traffic in other queues. | #62 → «перед сетевым трафиком из других очередей» |
| 09-12-exam | 16 | style | English model name «Best Effort» in prose; the module and the question's own comment say «модель негарантированной доставки». | #62 → «модели негарантированной доставки QoS» |
| 09-12-exam | 23 | style | Vendor leftover «образов Cisco IOS». | #62 → «образов ОС» |
| 09-12-exam | 23 | style | Vendor leftover «образ Cisco IOS … образ IOS». | #62 → «третий образ ОС, так как он самый последний» |
| 09-12-exam | 23 | style | Vendor leftover «образ Cisco IOS … образ IOS». | #62 → «второй образ ОС, так как он самый маленький» |
| 09-12-exam | 23 | style | Vendor leftover «образ Cisco IOS». | #62 → «третий образ ОС, поскольку» |
| 09-12-exam | 23 | style | Vendor leftovers «версий IOS», «устройства Cisco»; also the clumsy «образа, используемого для загрузки». | #62 → «При обновлении или тестировании различных версий ОС команда boot system используется для выбора образа, с которого загру…» |
| 09-12-exam | 23 | style | Answer 5 says an image «содержит образ advipservicesk9» (an image containing an image); after finding e06-12 line 72 it reads «третий образ ОС, поскольку он сод… | #62 → «набор функций advipservicesk9» |
| 09-12-exam | 24 | style | MT garble «исходный маршрут моста» for the CDP capability Source Route Bridge. | #62 → «мост с маршрутизацией от источника» |
| 09-12-exam | 30 | style | Option «иерархическая» (adjective) where the module names the principle «иерархичность». | held back: learn-ccna3#54 makes this fix (kb#280, kb#283) |
| 09-12-exam | 31 | style | «блок коммутатора» where the module says «блок коммутации», and the calque «содержатся в этом блоке». | #62 → «Это создает так называемый блок коммутации. Отказы в блоке коммутации не выходят за его пределы и не нарушают работу все…» |
| 09-12-exam | 33 | style | «домене возникновения сбоя» vs the comment's «Домен возникновения ошибки»; use the module term «домен отказов» in both. | #62 → «в домене отказов» |
| 09-12-exam | 33 | style | «Домен возникновения ошибки» (a failure domain is not an error domain); module term «домен отказов». | #62 → «Домен отказов» |
| 09-12-exam | 35 | error | Keyed answer says a switch-block failure 'will not affect end users at all'; the module says it affects only a small number of users. | #62 → «тказ блока коммутации затронет не всех конечных пользователей» |
| 09-12-exam | 37 | style | Agreement error «решение … коммутатора, принимаемого проектировщиком». | #62 → «может повлиять на решение проектировщика в пользу многоуровневого коммутатора» |
| 09-12-exam | 38 | style | Gender agreement «сеть … Он должен быть определен». | #62 → «Она должна быть определена в области 0» |
| 09-12-exam | 41 | style | Incomplete sentence «альтернативный DNS-сервер не должен быть». | #62 → «льтернативный DNS-сервер не должен быть указан» |
| 09-12-exam | 47 | style | Clumsy tautology «описывается как состоящий из трафика, который получает…». | #62 → «получает более низкий приоритет, если он не является критически важным» |
| 09-12-exam | 50 | error | Disputed key: the course copy keys «данные» (changed in the 2026-08 content review), the bank keys «голос». The module attributes this exact wording to voice an… | §1/§2 rephrasing (kb#275) |
| 09-12-exam | 52 | style | Clumsy tautology «описывается как состоящий из трафика, требующего…». | #62 → «требует более высокого приоритета, если он интерактивный» |
| 09-12-exam | 57 | style | MT artefact «добавить время для регистрации сообщений». | #62 → «добавлять к сообщениям журнала временную метку, чтобы знать, когда каждое из них было создано» |
| 13-14-exam | 1 | style | Wrong-answer comment opens with the NetAcad leftover «Этот вариант основан на информации из презентации» (there is no presentation in this course) and does not … | #63 → «Маршрутизаторы, коммутаторы и межсетевые экраны — это устройства инфраструктуры, которые можно получить через облако по …» |
| 13-14-exam | 7 | style | Key says «переадресация» (redirect) for forwarding; the module and this question's own comment say «пересылка/пересылает потоков трафика». | #63 → «пересылка потоков трафика» |
| 13-14-exam | 8 | unclear | Options 3 and 4 use «уровень контроля» for the control plane, which the module and this exam (Q5, Q26) call «уровень управления». The module also calls the mana… | §1/§2 rephrasing (kb#275) |
| 13-14-exam | 10 | style | Key 1 is an MT calque: «рассматривать расходы ... как ресурс» makes no sense (source: treat expenses as a utility). Rewritten after the module wording. | #63 → «модель оплаты по мере использования, при которой затраты на вычисления и хранение данных относятся к текущим расходам на…» |
| 13-14-exam | 10 | style | Option 5 is a verb phrase («повышает ...») in a list of noun phrases answering «Какие преимущества»; broken agreement with the stem. | #63 → «повышение зависимости от ИТ-ресурсов на местах» |
| 13-14-exam | 11 | style | «размещенными на хостинге» mistranslates «hosted» (running on a host OS) as a hosting service. The module term is «гипервизоры на основе базовой ОС». | #63 → «также называемые гипервизорами на основе базовой ОС,» |
| 13-14-exam | 13 | error | Comment says live migration moves «один виртуальный сервер на другой виртуальный сервер»: wrong, a running VM moves to another physical host (hypervisor). It al… | #63 → «Динамическая миграция (перенос работающих систем) позволяет переместить запущенную виртуальную машину на другой физическ…» |
| 13-14-exam | 18 | error | The stem says «(используются не все варианты)», but all six options are matched by the six terms; the note misleads the learner into leaving one option out. | #63 → «» |
| 13-14-exam | 21 | style | Broken comment: it literally says the SaltStack tool itself «называется Базовый компонент (Pillar)», and it does not explain the wrong options. Rewritten after … | #63 → «В инструменте управления конфигурацией SaltStack набор инструкций, которые должны быть выполнены, называется базовым ком…» |
| 13-14-exam | 21 | style | Chef term «книга рецептов (Cookbook)»; the lecture says «Cookbook (сборник рецептов)» (14-network-automation/14.05-configuration-management/README.md:76,81). | #63 → «"answer": "сборник рецептов (Cookbook)"» |
| 13-14-exam | 23 | style | Stray line break in the middle of the comment sentence («общение и интеграцию»); «общение» between companies' software reads oddly. | #63 → «Они облегчают взаимодействие и интеграцию» |
| 13-14-exam | 25 | style | Typo «RESTFul» (the comment and module write «RESTful»). | #63 → «Какая операция RESTful» |
| 13-14-exam | 27 | style | Comment calls the host «вспомогательный компьютер» (literal «supporting machine»), while the same comment calls it «главный компьютер»; reads as a different mac… | #63 → «Жесткий диск главного компьютера» |
| 13-14-exam | 28 | style | Comment has no spaces after five sentence-ending periods («средств.Виртуализация», «ЦОД.Хотя» ...). | #63 → «Облачные вычисления отделяют приложение от аппаратных средств. Виртуализация отделяет операционную систему от соответств…» |
| 13-14-exam | 33 | style | MT calques in the stem: «воспользоваться преимуществами простоя системных ресурсов» (take advantage of idle resources), «консолидировать количество серверов», d… | #63 → «компания хочет задействовать простаивающие системные ресурсы и сократить число серверов, запустив несколько операционных…» |
| 13-14-exam | 34 | style | Broken MT stem: «компания находит свою клиентскую базу данных и объем заказов, перегружает их вычислительные системы» (wrong verb, agreement and pronoun), calqu… | #63 → «После рекламной кампании нового продукта на нескольких континентах компания обнаружила, что клиентская база данных и объ…» |
| 13-14-exam | 37 | style | «программисты требуют Windows ...» is a calque (programmers require); «MAC OS» is misspelled (the module and Q11 write «Mac OS»). | #63 → «программистам нужны на компьютерах Windows, Linux и Mac OS» |
| 13-14-exam | 38 | style | «резервный сайт» calques «backup site»; in Russian «сайт» means a website. | #63 → «администратор ищет резервную площадку для всех данных с серверов компании» |
| final-exam | 1 | style | Agreement error: «состояние ... в котором он встречается» (состояние is neuter). | #63 → «в котором оно встречается» |
| final-exam | 1 | style | Stray semicolon in the option «состояние Down;». | #63 → «состояние Down» |
| final-exam | 5 | style | Grammar in the comment: «настроена IP-адрес» (gender), «он не существует в подсети» (calque of «does not exist in the subnet»). | #63 → «у маршрутизатора R2 настроен IP-адрес 192.168.20.5. Он не входит в подсеть» |
| final-exam | 7 | unclear | Two defensible answers. The module lists the router ID's uses as participation in OSPF database synchronization (the router with the highest ID sends DBD first … | §1/§2 rephrasing (kb#275) |
| final-exam | 8 | style | Broken case in the stem «для локальной сети 172.16.1.0/24 роутер А от роутера B» (nominative «роутер» where a genitive is needed), and Cyrillic «А» next to Lati… | #63 → «Какова стоимость маршрута OSPF от B до локальной сети 172.16.1.0/24 маршрутизатора A?» |
| final-exam | 8 | style | Garbled comment: English left in prose («Cost =», «A LAN»), MT «Gigabit Ethernet по цене A» (on A), the formula split across lines, «172.16.1. 0/24», and «100,0… | #63 → «Стоимость OSPF рассчитывается по формуле: стоимость = опорная пропускная способность / пропускная способность интерфейса…» |
| final-exam | 9 | style | In the comment «IP-адреса обратной связи» mistranslates loopback («обратная связь» = feedback), «имеют более высокий приоритет» confuses router-ID selection wit… | #63 → «Если идентификатор маршрутизатора не настроен вручную, им становится самый высокий IPv4-адрес среди loopback-интерфейсов…» |
| final-exam | 12 | style | Broken MT comment («информацию о компьютере, например, словах или изображениях, а также, которые не являются причиной ...», «по общему носителю, например, к ком… | #63 → «Вирус скрывается, прикрепляя себя к компьютерному коду, программам или документам, и выполняется, когда пользователь отк…» |
| final-exam | 13 | style | Comment: case error «систем предотвращение вторжений», and «разворачивается внутри» mistranslates «deployed inline» (inside what?). | #63 → «Преимущество систем предотвращения вторжений (IPS) заключается в том, что они могут определять и останавливать вредоносн…» |
| final-exam | 16 | style | Typo in the subinterface name «Gigabit 0/1/.12» (the exhibit and the example config use Gi0/1.12). | #63 → «Gigabit 0/1.12» |
| final-exam | 18 | style | Word order: «настроил на ... список доступа R1» reads as if the ACL were named R1; R1 is the router. (The new text uses «маршрутизатор» per the glossary.) | #63 → «Администратор настроил на маршрутизаторе R1 список доступа» |
| final-exam | 21 | style | Comment opens with an MT sentence («операторы всегда перечислены в последовательном порядке») that does not state the point: ACEs are checked in order. | #63 → «Записи ACL (ACE) проверяются последовательно, начиная с первой.» |
| final-exam | 21 | error | Exhibit 7.png shows the hostname «CiscoVille» in every prompt, while the stem and comment were renamed to Kostroma. Text and figure disagree; the figure needs r… | image follow-up (CSV in the exam PR) |
| final-exam | 22 | style | Exhibit 8.png labels the Internet server 209.265.200.200, an invalid IPv4 address (octet 265); option 2 refers to 209.165.200.200. Figure fix only (follow-up). | image follow-up (CSV in the exam PR) |
| final-exam | 24 | style | Option «NAT c перегрузкой» uses a Latin «c» instead of the Cyrillic preposition «с». | #63 → «NAT с перегрузкой» |
| final-exam | 25 | error | Exhibit 9.png labels 209.165.200.225 «Outside Local» and 209.165.200.254 «Inside Global», but the key and comment say PC1's inside global address is 209.165.200… | image follow-up (CSV in the exam PR) |
| final-exam | 27 | error | Stem says «три», but only 2 answers are marked. The comment lists «требования к информационной безопасности» among the traffic-related factors, so answer 4 is t… | #63 key → answer 1, 2, 4 |
| final-exam | 27 | unclear | Content not taught: module 07 has no list of traffic-related factors for choosing a WAN link (type, amount, quality and security requirements), so the question … | §1/§2 rephrasing (kb#275) |
| final-exam | 33 | style | Comment expands DMVPN as «виртуальные» multipoint connections; DMVPN is Dynamic Multipoint VPN, and the module says «Динамическая многоточечная VPN-сеть». | #63 → «динамические многоточечные VPN-сети (DMVPN)» |
| final-exam | 38 | error | Comment says «начальная конфигурация хранится в ОЗУ»: «начальная» means startup, which the same sentence places in NVRAM. It is the running configuration that l… | #63 → «а текущая конфигурация хранится в ОЗУ» |
| final-exam | 41 | style | Comment opens with a verbless fragment («Агрегация крупных сетей ...») and «Этот уровень» is ambiguous. Rewritten after the module; covers the key and options 1… | #63 → «Уровень распределения объединяет крупные сети, состоящие из множества коммутационных шкафов, и связывает их с остальной …» |
| final-exam | 44 | style | Key says «встроенных портов» (built-in), but port density also counts line-card ports of modular switches; the module defines it as the number of ports availabl… | #63 → «количество портов, доступных на одном коммутаторе» |
| final-exam | 45 | style | Typo «шаблонню» in the comment (listed among known term typos). | #63 → «шаблонную маску» |
| final-exam | 45 | error | The comment calls 0.0.255.255 an «недопустимую» (invalid) wildcard mask; it is a valid mask that is too broad, matching the whole 172.16.0.0/16 instead of the f… | #63 → «слишком широкую шаблонную маску» |
| final-exam | 45 | style | «перевести» for NAT translation; the course uses «преобразовать / преобразование» (ru-glossary.md:188; 06-nat-for-ipv4/06.09-summary/README.md:4 «необходимо пре… | #63 → «позволяет преобразовать только четыре подсети» |
| final-exam | 46 | style | Missing space/line break after «Посмотрите на изображение.» before «Почему». | #63 → «Посмотрите на изображение. Почему» |
| final-exam | 46 | style | English left in prose: «Serial интерфейсы» (the bank twin and the course say «последовательные интерфейсы»). | #63 → «последовательные интерфейсы находятся в разных областях» |
| final-exam | 46 | style | Agreement error in the comment: «сеть 192.168.10.0/30 ... Он должен быть определен». | #63 → «Она должна быть определена в области 0» |
| final-exam | 49 | style | Comment has no spaces after five sentence-ending periods («средств.Виртуализация», «ЦОД.Хотя» ...). | #63 → «Облачные вычисления отделяют приложение от аппаратных средств. Виртуализация отделяет операционную систему от соответств…» |
| final-exam | 50 | style | The stem names the topology in English («spine-leaf») or as «магистраль и листья»; the module term is «ствол-листья» (Spine-Leaf). | held back: superseded: rewritten by kb#280 after the review (learn-ccna3#55) |
| final-exam | 50 | style | Option 1 calls the spine tier «уровень магистрали»; the module calls it «ствол», and the rewritten comment does too. «реализован с коммутаторами» → «на коммутат… | held back: superseded: rewritten by kb#280 after the review (learn-ccna3#55) |
| final-exam | 50 | error | Distractor 3 is negated in translation: «контроллер APIC напрямую не управляет каналом передачи данных» is a true statement (module and this question's comment … | held back: superseded: rewritten by kb#280 after the review (learn-ccna3#55) |
| final-exam | 50 | style | Comment: typo «листев», agreement «Коммутатор ... присоединяются», English «spine-/leaf-коммутаторы» in prose and «магистраль» for the spine tier. Rewritten wit… | held back: superseded: rewritten by kb#280 after the review (learn-ccna3#55) |
| final-exam | 51 | style | «размещенными на хостинге» mistranslates «hosted» (running on a host OS) as a hosting service. The module term is «гипервизоры на основе базовой ОС». | #63 → «также называемые гипервизорами на основе базовой ОС,» |
| final-exam | 52 | style | Stem says «уровня контроля сетью SDN» for the control plane; the module, the comment and the twin question (13-14-exam Q5, bank Q52) say «уровень управления». | #63 → «уровня управления сетью SDN» |
| final-exam | 53 | style | Options 1 and 2 are both «двойные скобки» (calque of «double braces/brackets») and differ only by the symbol; the module says «фигурные скобки { }» for objects … | #63 → «фигурные скобки {}» |
| final-exam | 53 | style | Options 1 and 2 are both «двойные скобки» (calque of «double braces/brackets») and differ only by the symbol; the module says «фигурные скобки { }» for objects … | #63 → «квадратные скобки []» |
| final-exam | 54 | style | Tautological MT «Общие распространенные» (Common data formats); the module and 13-14-exam Q16 say «Распространенные форматы данных». | #63 → «Распространенные форматы данных» |
| final-exam | 55 | error | Comment gives the path «/author/book.html», copied from the module example, but the URI in this question has the path «/author1a/book2.html». | #63 → «Путь и имя файла - /author1a/book2.html» |
| final-exam | 55 | style | MT «На сайте URI» (In the URI): a URI is not a site. | #63 → «В URI» |

## Findings: Bank copies (`__exams/CCNA3`)

The bank copies live in learn-ccna1 and have extra questions, so their numbering differs from the connected exams; twins were matched by content. 125 of their 225 findings mirror an exam fix above and get the same fix, with the same wording, in the paired learn-ccna1 PR; they are not repeated here. The table lists the other 100: fixes whose wording differs from the exam's, problems that exist only in the bank, and every doubtful or held-back bank item.

| File | Q | Sev | Issue | Fix |
|---|---|---|---|---|
| bank 01-02 | 0 | style | Bank title starts with the English NetAcad course name and version «Enterprise Networking, Security, and Automation (Version 7.00) - »: English in a learner-fac… | learn-ccna1#143 → «Экзамен по основам протокола OSPF» |
| bank 01-02 | 14 | style | Bank only: broken agreement «две соседние соседи» in answers 2 and 4 (exam twin Q14 reads «два соседа»). | learn-ccna1#143 → «два соседа» |
| bank 01-02 | 14 | style | Bank only: MT word order «В сети OSPF, когда требуются выборы DR и BDR?». Use the exam wording. | learn-ccna1#143 → «Когда требуется выбор DR и BDR в сети OSPF?» |
| bank 01-02 | 20 | error | Bank only: the key «network 172.16.1.0 255.255.255.0 area 0» puts a subnet mask where the network command takes a wildcard mask (read as a wildcard it ignores t… | learn-ccna1#143 → «router(config-router)# network 172.16.1.0 0.0.0.255 area 0» |
| bank 01-02 | 20 | error | Bank only: «172.16.0.0/16, 172.16.1.0/16 и 172.16.2.0/16» are one and the same /16 network, so three distinct connected networks are impossible. The exam twin u… | learn-ccna1#143 → «172.16.0.0/24, 172.16.1.0/24 и 172.16.2.0/24» |
| bank 01-02 | 24 | error | Bank only: «Между ними R3 имеет более высокий идентификатор» — R3 has priority 1 and is not «между ними»; R4 (4.4.4.4) beats R1. The exam twin says R4. | learn-ccna1#143 → «Между ними R4 имеет» |
| bank 01-02 | 26 | unclear | Bank twin of exam Q26: key 65 relies on truncation, the lecture says rounding to the nearest integer (operator). | §1/§2 rephrasing (kb#275) |
| bank 01-02 | 33 | style | Bank: MT stem «Какой шаг … описывается маршрутизатором, выполняющим…» ("is described by the router"). The exam twins were rewritten as «описывает действия …, вы… | learn-ccna1#143 → «Какой шаг в процессе маршрутизации OSPF описывает действия маршрутизатора, выполняющего» |
| bank 01-02 | 34 | style | Bank: MT stem «описывается маршрутизатором, помещающим…»; exam twin Q34 wording. | learn-ccna1#143 → «Какой шаг в процессе маршрутизации OSPF описывает действия маршрутизатора, помещающего» |
| bank 01-02 | 35 | style | Bank: MT stem «описывается маршрутизатором, отправляющим…»; exam twin Q35 wording. | learn-ccna1#143 → «Какой шаг в процессе маршрутизации OSPF описывает действия маршрутизатора, отправляющего» |
| bank 01-02 | 36 | style | Bank: MT stem «описывается маршрутизатором, заполняющим информацию…» («заполняющим» mistranslates "flooding", see exam Q36). Same stem in bank-only Q37; count 2… | learn-ccna1#143 → «Какой шаг в процессе маршрутизации OSPF описывает действия маршрутизатора, рассылающего» |
| bank 01-02 | 38 | style | Bank: MT stem «описывается маршрутизатором, создающим…» (twin of exam Q37). Same stem in bank-only Q39 and Q41; count 3 covers them. | learn-ccna1#143 → «Какой шаг в процессе маршрутизации OSPF описывает действия маршрутизатора, создающего» |
| bank 01-02 | 45 | error | Bank only: truncated mask «128.107.0.0 255.252.0» (exam twin Q39 has 255.255.252.0). | learn-ccna1#143 → «128.107.0.0 255.255.252.0» |
| bank 01-02 | 46 | error | Bank twin of exam Q40: truncated mask «255.254.0», missing dash, and 192.168.223.0 is not a /23 network address (should be 192.168.222.0). | learn-ccna1#143 → «объявлена — 192.168.222.0 255.255.254.0» |
| bank 01-02 | 47 | error | Bank only: truncated mask «255.254.0», missing dash, and 192.168.181.0 is not a /23 network address (should be 192.168.180.0). | learn-ccna1#143 → «объявлена — 192.168.180.0 255.255.254.0» |
| bank 01-02 | 51 | error | Bank: truncated mask «128.107.0.0 255.255.192» in Q51 (twin of exam Q42) and bank-only Q52; count 2 covers both. | learn-ccna1#143 → «128.107.0.0 255.255.255.192» |
| bank 01-02 | 58 | unclear | Bank only: Packet Tracer activity (.pka, «Откройте упражнение в Packet Tracer») — known from the mechanical pass; cannot be made neutral without a new activity. | `.pka`: stays until the lab rework |
| bank 03-05 | 0 | style | Bank title starts with the English NetAcad course name and version «Enterprise Networking, Security, and Automation (Version 7.00) - » (same as CCNA3_01-02). | learn-ccna1#143 → «Экзамен по сетевой безопасности» |
| bank 03-05 | 5 | style | Bank only: the key itself says «социотехника»; the exam twin and the module say «социальная инженерия». | learn-ccna1#143 → «"answer": "социальная инженерия"» |
| bank 03-05 | 14 | style | Bank only: the question word is missing: «Шаблонная маска будет соответствовать сетям…?». | learn-ccna1#143 → «Какая шаблонная маска будет соответствовать сетям» |
| bank 03-05 | 18 | style | Bank twin of exam Q18, garbled here: «но у обоих учащихся все ещё есть доступ к веб-средствам назначений компьютеров» states a fact instead of the requirement a… | learn-ccna1#143 → «хочет прекратить это, но сохранить у обоих учащихся доступ к веб-ресурсам» |
| bank 03-05 | 23 | style | Bank twin of exam Q23: exhibit assert/4.png shows «CiscoVille(config)#» while the stem says «маршрутизатор Kostroma»; image follow-up. | image follow-up (CSV in the exam PR) |
| bank 03-05 | 24 | style | Bank only: agreement «доступ … мог получить только рабочая станция» (feminine subject). | learn-ccna1#143 → «могла получить только рабочая станция» |
| bank 03-05 | 33 | error | Known from the mechanical pass: the stem says «три», but only answers 1 and 3 are marked; answer 7 (ip access-group 101 in) completes the configuration and is m… | learn-ccna1#143 key → answer 1, 3, 7 |
| bank 03-05 | 34 | error | Bank only: answer 1 duplicates answer 2 («access-list 101 permit tcp host 192.168.1.1 any eq 80»). The exam twin Q34 has «… host 192.168.1.1 eq 80 any». The old… | learn-ccna1#143 → «"answer": "access-list 101 permit tcp host 192.168.1.1 eq 80 any"» |
| bank 03-05 | 36 | error | Bank twin of exam Q36, step 3 of 3: key 1, 2 instead of 1, 5. The comment must move from answer 2 (new key) to answer 5 (old key, no comment). | learn-ccna1#143 key → answer 1, 2 |
| bank 03-05 | 48 | error | Bank twin of exam Q48 (and bank-only Q49): «предварительно открытого ключа» for pre-shared key, plus wrong case «известного как отправителем, так и получателем»… | learn-ccna1#143 → «предварительно согласованного общего (секретного) ключа, известного как отправителю, так и получателю» |
| bank 03-05 | 50 | style | Bank twin of exam Q49, garbled here: «…не является подделкой и действительно от кого оно написано?». | learn-ccna1#143 → «и получено от легитимного источника?» |
| bank 03-05 | 58 | style | Bank only: missing space «R3во». | learn-ccna1#143 → «на R3 во входящем» |
| bank 03-05 | 59 | style | Bank only: typo «в исходащем направлении». | learn-ccna1#143 → «в исходящем направлении» |
| bank 03-05 | 63 | style | Bank only: agreement «Многие сотрудники тратит» in Q63 (twin of exam Q56) and Q64; count 2 covers both. | learn-ccna1#143 → «Многие сотрудники тратят время» |
| bank 03-05 | 66 | style | Bank: garbled «использовать access-class 20 в параметре конфигурации или команде?» in Q66 (twin of exam Q58) and Q67; count 2 covers both. | learn-ccna1#143 → «использовать команду access-class 20?» |
| bank 03-05 | 66 | unclear | Bank twin of exam Q58: «для обеспечения безопасности управления трафиком в маршрутизатор» renders "secure management traffic into the router", which also descri… | §1/§2 rephrasing (kb#275) |
| bank 03-05 | 71 | style | Bank: garbled «использовать ip access-group 101 in в параметре конфигурации или команде?» in Q71 (twin of exam Q61) and Q72; count 2. | learn-ccna1#143 → «использовать команду ip access-group 101 in?» |
| bank 03-05 | 73 | style | Bank: garbled «использовать параметр конфигурации 40 deny host 192.168.23.8 или команду?» in Q73 (twin of exam Q62) and Q74; count 2. | learn-ccna1#143 → «использовать команду 40 deny host 192.168.23.8?» |
| bank 03-05 | 75 | style | Bank: garbled «использовать параметр конфигурации no ip access-list 101 или команду?» (twin of exam Q63). | learn-ccna1#143 → «использовать команду no ip access-list 101?» |
| bank 06-08 | 0 | style | Bank title carries the NetAcad course name in English («Enterprise Networking, Security, and Automation (Version 7.00)»); use the course copy's title, as the CC… | learn-ccna1#144 → «Экзамен по технологиям глобальных сетей» |
| bank 06-08 | 3 | error | Bank only: the comment gives the inside global address as 209.165.200.224, the network address of 209.165.200.224/27; the key and the exhibit say .225 (the cour… | learn-ccna1#144 → «R1, 209.165.200.225.» |
| bank 06-08 | 4 | style | Bank only: garbled stem «во внутренней локальной сети выключения R1 может иметь одновременное преобразование NAT». | learn-ccna1#144 → «маршрутизатора R1 может одновременно использовать преобразование NAT» |
| bank 06-08 | 7 | style | Bank only: «Что именно проверяет администратор?» does not fit the answers, which are conclusions drawn from the output. | learn-ccna1#144 → «Какие выводы может сделать администратор?» |
| bank 06-08 | 9 | style | Bank only: «статическая NAT с пулом NAT» (wrong gender; the course treats NAT as masculine). | learn-ccna1#144 → «статический NAT с пулом» |
| bank 06-08 | 10 | style | Bank only: wrong case «к глобально маршрутизируемым IPv4-адресом». | learn-ccna1#144 → «глобально маршрутизируемым IPv4-адресам узла» |
| bank 06-08 | 16 | error | Bank only: the stem shows ./assert/5.PNG, Q7's `show ip nat statistics` (Serial0/2/1, pool NAT); this question needs ERtr's output (assert/11.PNG, as in the cou… | image follow-up (CSV in the exam PR) |
| bank 06-08 | 17 | error | Bank only: the stem shows ./assert/11.PNG (ERtr `show ip nat statistics`), but the question is about a translations table; it needs assert/12.PNG, as in the cou… | image follow-up (CSV in the exam PR) |
| bank 06-08 | 20 | style | The DTE label «Оконечное оборудование данных» differs from the lecture term «Терминальное оборудование данных» (07-wan-concepts/07.02-wan-operations/README.md:6… | learn-ccna1#144 → «Терминальное оборудование данных» |
| bank 06-08 | 30 | unclear | Twin of 06-08-exam Q30: ASA/ASDM/ISR product question. | §1/§2 rephrasing (kb#275) |
| bank 06-08 | 35 | style | Bank only: aspect mismatch «чтобы зашифровать и расшифровывать». | learn-ccna1#144 → «чтобы зашифровывать и расшифровывать трафик» |
| bank 06-08 | 37 | error | Bank only: empty question text; the answers duplicate Q36 (Diffie-Hellman). Structural, cannot be fixed by text replacement. | structural: stays |
| bank 06-08 | 38 | error | Known: points at the missing image ../assert/13.PNG (the topology is ./assert/13.PNG, as in the course copy Q37). | image follow-up (CSV in the exam PR) |
| bank 06-08 | 39 | style | Bank only: missing space «дляиспользования». | learn-ccna1#144 → «для использования» |
| bank 06-08 | 39 | error | Bank only: shows ./assert/12.PNG (a translations table) instead of the PC1/R1/ISP topology assert/14.png used by the course copy Q38. Note that 14.png itself ha… | image follow-up (CSV in the exam PR) |
| bank 06-08 | 40 | style | Bank only: stray letter «используя й адрес». | learn-ccna1#144 → «используя адрес» |
| bank 06-08 | 40 | error | Bank only: shows ./assert/13.PNG (Q38's NAT-overload topology) instead of RT2's `show ip interface brief` / `show ip nat translations` output assert/15.png used… | image follow-up (CSV in the exam PR) |
| bank 06-08 | 42 | style | Bank only: typo «подключаютс». | learn-ccna1#144 → «подключают конечные» |
| bank 06-08 | 46 | unclear | Known: Packet Tracer activity (./assert/Assessment01.pka, «Откройте упражнение в Packet Tracer»); cannot be answered or made neutral without the activity. | `.pka`: stays until the lab rework |
| bank 06-08 | 57 | style | Bank only: «операторские» for the GRE carrier protocol. | learn-ccna1#144 → «пассажирские, несущие и транспортные» |
| bank 06-08 | 63 | style | Bank only: missing verb «позволяет многоадресный и широковещательный трафик». | learn-ccna1#144 → «позволяет передавать многоадресный и широковещательный трафик» |
| bank 09-12 | 0 | style | Bank title carries the NetAcad course name in English («Enterprise Networking, Security, and Automation (Version 7.00)»); use the course copy's title. | learn-ccna1#144 → «Экзамен по оптимизации, проектированию и управлению сетью» |
| bank 09-12 | 4 | style | Bank only: «для получения и установки сообщений SNMP» mistranslates 'SNMP get and set messages'. | learn-ccna1#144 → «для сообщений SNMP типа GET и SET» |
| bank 09-12 | 7 | style | Bank only: «группирование двух устройства» (wrong case). | learn-ccna1#144 → «группирование двух устройств» |
| bank 09-12 | 7 | style | Bank only: «позволяющих прохождение трафика» (wrong government). | learn-ccna1#144 → «обеспечивающих прохождение трафика» |
| bank 09-12 | 9 | style | Bank only: «для всех кварталов комплекса зданий» mistranslates 'campus blocks'. | learn-ccna1#144 → «для всей инфраструктуры комплекса зданий» |
| bank 09-12 | 9 | error | Known: matching key 0 is not among the options (placeholder item). Structural, no text fix. | structural: stays |
| bank 09-12 | 12 | unclear | Twin of 09-12-exam Q12: symptom-gathering stages are not taught in module 12. | §1/§2 rephrasing (kb#275) |
| bank 09-12 | 22 | style | Bank only: «значение реестра настройки» for the configuration register. | learn-ccna1#144 → «значение регистра конфигурации» |
| bank 09-12 | 29 | error | Known: the stem asks for three, but only 2 are marked; «Уровень распределения» (answer 6) must be correct, as in the course copy. Answer 6 carries the wrong-ans… | learn-ccna1#144 key → answer 1, 3, 6 |
| bank 09-12 | 30 | style | Twin of 09-12-exam Q30: «иерархическая». | held back: superseded: rewritten by kb#280 after the review (learn-ccna1#127) |
| bank 09-12 | 31 | style | Bank only: garbled key «разделение переключаемых соединений данного уровня доступа» ('switch connections' rendered as 'switched connections'). | learn-ccna1#144 → «разделение соединений коммутаторов уровня доступа между ними» |
| bank 09-12 | 34 | style | Bank only: missing «путем» in «расширения уровня доступа подключения пользователей». | learn-ccna1#144 → «расширения уровня доступа путем подключения пользователей» |
| bank 09-12 | 50 | unclear | Twin of 09-12-exam Q50: the bank keys «голос», the course copy «данные»; by the module both voice and video match the stem's wording. Operator decision needed; … | §1/§2 rephrasing (kb#275) |
| bank 09-12 | 59 | style | Bank only: the command `dir` translated as «каталог». | learn-ccna1#144 → «dir» |
| bank 09-12 | 63 | error | Bank only: keyed command written «show flash:0»; the command is `show flash0:` (bank-only Q64 has the same key; 2 occurrences, fixed together). | learn-ccna1#144 → «show flash0:» |
| bank 13-14 | 0 | style | Bank title keeps the NetAcad course name «Enterprise Networking, Security, and Automation (Version 7.00)» in English. Use the connected exam's title, as the CCN… | learn-ccna1#145 → «Экзамен по виртуализации и автоматизации сетей» |
| bank 13-14 | 7 | style | Bank-only calque «Что такое функция плоскости данных» (What is a function of). The exam twin reads «Какую функцию выполняет плоскость данных сетевого устройства… | learn-ccna1#145 → «Какую функцию выполняет плоскость данных сетевого устройства?» |
| bank 13-14 | 8 | unclear | Option 4 «Разделение уровня менеджмента и уровня управления» uses «уровень менеджмента», not a course term, for the management plane; the module calls both the … | §1/§2 rephrasing (kb#275) |
| bank 13-14 | 25 | style | Bank answer 4 glosses POST as «опубликовать» (a verb, unlike the noun glosses «чтение», «обновление», «исправление»); the connected 13-14-exam Q25 answer 4 read… | learn-ccna1#145 → «post (отправка)» |
| bank Practice Final | 0 | style | Bank title keeps the NetAcad course name «Enterprise Networking, Security, and Automation (Version 7.00)» and the acronym ENSA. Use the connected exam's title, … | learn-ccna1#145 → «Экзамен по стандартам корпоративных сетей, сетевой безопасности и автоматизации управления сетью» |
| bank Practice Final | 4 | style | Bank-only garbled stem «Какой шаг ... описывается маршрутизатором, создающим базу данных» (which step is described by a router). The exam twin reads «описывает … | learn-ccna1#145 → «описывает действия маршрутизатора, создающего базу данных» |
| bank Practice Final | 7 | unclear | Two defensible answers. The module lists the router ID's uses as participation in OSPF database synchronization (the router with the highest ID sends DBD first … | §1/§2 rephrasing (kb#275) |
| bank Practice Final | 9 | error | Bank-only: the comment says «Между ними R3 имеет более высокий идентификатор маршрутизатора», but the tie is between R4 (4.4.4.4) and R1 (1.1.1.1); R3 has prior… | learn-ccna1#145 → «Между ними R4 имеет» |
| bank Practice Final | 12 | style | Bank-only garbled option «Отказ в обслуживании троянов» («denial of service of Trojans»); the exam twin reads «отказ в обслуживании». | learn-ccna1#145 → «Отказ в обслуживании» |
| bank Practice Final | 17 | style | Bank-only garbled stem «Когда техник будет использовать access-class 20 in в конфигурации или команде?»; the exam twin reads «Зачем техник будет использовать ко… | learn-ccna1#145 → «Зачем техник будет использовать команду **access-class 20 in**?» |
| bank Practice Final | 21 | error | Exhibit 7.png shows the hostname «CiscoVille» in every prompt, while the stem and comment were renamed to Kostroma. Text and figure disagree; the figure needs r… | image follow-up (CSV in the exam PR) |
| bank Practice Final | 22 | style | Exhibit 8.png labels the Internet server 209.265.200.200, an invalid IPv4 address (octet 265); option 2 refers to 209.165.200.200. Figure fix only (follow-up). | image follow-up (CSV in the exam PR) |
| bank Practice Final | 24 | style | Bank-only: «одному разрешенному внутреннему глобальному адресу» — «разрешенному» mistranslates «registered» and is not in the exam twin or the comment. | learn-ccna1#145 → «одному внутреннему глобальному адресу» |
| bank Practice Final | 24 | style | Gender agreement: NAT is masculine in this course («динамический NAT», 06-nat-for-ipv4/06.09-summary/README.md:46); the exam twin final-exam Q24 reads «динамиче… | learn-ccna1#145 → «Динамический NAT.» |
| bank Practice Final | 24 | style | Gender agreement: NAT is masculine in this course («статический NAT», 06-nat-for-ipv4/06.08.01-lab-configure-nat-for-ipv4/README.md:40); the exam twin final-exa… | learn-ccna1#145 → «Статический NAT.» |
| bank Practice Final | 25 | style | Bank-only typo: missing space «дляиспользования». | learn-ccna1#145 → «для использования» |
| bank Practice Final | 25 | error | Exhibit 9.png labels 209.165.200.225 «Outside Local» and 209.165.200.254 «Inside Global», but the key and comment say PC1's inside global address is 209.165.200… | image follow-up (CSV in the exam PR) |
| bank Practice Final | 27 | error | Stem says «три», but only 2 answers are marked. The comment lists «требования к информационной безопасности» among the traffic-related factors, so answer 4 is t… | learn-ccna1#145 key → answer 1, 2, 4 |
| bank Practice Final | 27 | unclear | Content not taught: module 07 has no list of traffic-related factors for choosing a WAN link (type, amount, quality and security requirements), so the question … | §1/§2 rephrasing (kb#275) |
| bank Practice Final | 37 | style | Bank-only: key «загружает файл конфигурации запуска во время запуска» repeats «запуска» and uses a forbidden variant for startup-config; the exam twin says «фай… | learn-ccna1#145 → «файл загрузочной конфигурации во время запуска» |
| bank Practice Final | 38 | error | Bank-only: the stem asks which command «восстановит на TFTP-сервере» the NVRAM configuration (restore), while the key copy startup-config tftp backs it up to th… | learn-ccna1#145 → «Какая команда создаст резервную копию конфигурации, которая хранится в NVRAM, на TFTP-сервере?» |
| bank Practice Final | 45 | error | Bank-only: the stem is corrupted — «циалист», «access-llst» and the wildcard «0.0.255» (three octets). The exam twin reads «Сетевой специалист использовал коман… | learn-ccna1#145 → «Сетевой специалист использовал команду **access-list 1 permit 172.16.0.0 0.0.0.255** для» |
| bank Practice Final | 45 | error | Bank-only: option 3 has the three-octet wildcard «0.0.255»; the comment describes it as a mask that translates the whole 172.16.0.0 network, i.e. 0.0.255.255 (e… | learn-ccna1#145 → «заменен на access-list 1 permit 172.16.0.0 0.0.255.255» |
| bank Practice Final | 45 | error | Bank-only: the key has the invalid wildcard «0.3.255» (three octets); the four /24 networks 172.16.0.0-172.16.3.0 need 0.0.3.255 (exam twin). | learn-ccna1#145 → «access-list 1 permit 172.16.0.0 0.0.3.255» |
| bank Practice Final | 50 | style | The stem names the topology in English («spine-leaf») or as «магистраль и листья»; the module term is «ствол-листья» (Spine-Leaf). | held back: superseded: rewritten by kb#280 after the review (learn-ccna1#128, #138) |
| bank Practice Final | 50 | style | Option 1 calls the spine tier «уровень магистрали»; the module calls it «ствол», and the rewritten comment does too. «реализован с коммутаторами» → «на коммутат… | held back: superseded: rewritten by kb#280 after the review (learn-ccna1#128, #138) |
| bank Practice Final | 50 | error | Distractor 3 is negated in translation: «контроллер APIC напрямую не управляет каналом передачи данных» is a true statement (module and this question's comment … | held back: superseded: rewritten by kb#280 after the review (learn-ccna1#128, #138) |
| bank Practice Final | 50 | style | Comment: typo «листев», agreement «Коммутатор ... присоединяются», English «spine-/leaf-коммутаторы» in prose and «магистраль» for the spine tier. Rewritten wit… | held back: superseded: rewritten by kb#280 after the review (learn-ccna1#128, #138) |

## Course text found on the way

Errors in the lecture text that the review ran into. The quiz PRs don't change them, because the lectures are outside kb#275. By the operator's decision, the factual errors are fixed in learn-ccna3#57, each with its source, and the questions that rest on them are reworded after it.

| Lecture | Problem | Where |
|---|---|---|
| `01-single-area-ospfv2-concepts/01.03-ospf-operation/README.md:24`, `02-single-area-ospfv2-configuration/02.06-verify-single-area-ospfv2/README.md:150` | DR and BDR elected on «multiaccess» wording that reads as all networks; they are elected on multiaccess networks only | learn-ccna3#57 |
| `02-single-area-ospfv2-configuration/02.01-ospf-router-id/README.md:66` | the router that sends DBD packets first: it is the one with the higher router ID | learn-ccna3#57 |
| `02-single-area-ospfv2-configuration/02.04-modify-single-area-ospfv2/README.md:31` | OSPF cost «rounded» to the nearest integer; the fraction is dropped and the minimum is 1 (01-02-exam Q26 and final Q8 rely on it) | learn-ccna3#57 |
| `03-network-security-concepts/03.10-cryptography/README.md:178`, `:181` | 3DES and RC4 presented as current; both are retired (NIST SP 800-131A, RFC 7465). Quiz 03.10.10 q1, q2, q4 follow | learn-ccna3#57 |
| `09-qos-concepts/09.01-network-transmission-quality/README.md:56` | propagation delay called variable; it is fixed for a given path (ITU-T G.114). Quiz 09.01.05 q1 follows | learn-ccna3#57 |
| `13-network-virtualization/13.04-software-defined-networking/README.md:38-41` | the management plane named like the control plane; kb#284 names it «уровень администрирования». Quiz 13.04.05 q3 and 13-14 Q8 follow | learn-ccna3#57 |
| `14-network-automation/14.04-rest/README.md:68` | the URN defined as a namespace; a URN is a persistent name (RFC 8141). Quiz 14.04.07 q3 follows | learn-ccna3#57 |
| `03-network-security-concepts/03.08-network-application-threats/README.md:66`, `:89`, `:91` | domain shadowing has two names, «теневое управление DNS» and «теневое копирование доменов»; kb#284 decides «теневые поддомены (domain shadowing)» | kb#276 pass |
| `07-wan-concepts/07.01-purpose-of-wans/README.md:23`, `01-single-area-ospfv2-concepts/01.04-summary/README.md:38` | wording: an agreement error, and «мертвый интервал» where module 02 says «интервал простоя (dead)» | wording, kb#276 pass |

## Follow-ups

- **Images:** CiscoVille prompts (03-05 Q23, final Q21), an invalid address 209.265.200.200 (final Q22), swapped NAT labels (06-08 Q38, final Q25), a pool name that disagrees with the configuration (06-08 Q16) and five bank questions that point to the wrong image (bank 06-08 Q16, Q17, Q38–Q40). Each is logged in its exam PR's `audit/figma-followups/<branch>.csv`.
- **Packet Tracer items:** bank 01-02 Q58 and bank 06-08 Q46 are `.pka` activities. They stay until the lab rework.
- **Structural items:** bank 06-08 Q37 has an empty question text, and 09-12 Q9 (with its bank twin) has a matching placeholder with key 0. Both need changes to the JSON structure, which kb#275 does not make.
- **Term alignment:** existing «роутер», «хост», «транк» and «затор» are left to the kb#276 alignment PRs, which start after this course's kb#275 PRs are merged. So is domain shadowing (03.08 and quiz 03.11.03, kb#284). The kb#275 PRs change a term only where they rewrite the sentence.
