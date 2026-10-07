= Zielsetzung <zielsetzung>

// PLZ-Phase "Zielsetzung": Defizit positiv formulieren, Hauptziel in Teilziele
// differenzieren, operationalisieren, Zielkonflikte auflösen, Prioritäten setzen.
// Die Teilziele sind später die Bewertungskriterien in Kapitel 6.

== Hauptziel

Ausgehend von dem in @situationsanalyse herausgearbeiteten Defizit ist es Ziel der Transferleistung, die technische Machbarkeit zu untersuchen, Simplifier als MCP-Server zur Anbindung des unternehmensinternen KI-Modells NOVA einzusetzen. Auf Grundlage der Ergebnisse soll eine fundierte Bewertung erfolgen und eine Empfehlung für das weitere Vorgehen im Unternehmen abgeleitet werden.

== Teilziele

Das Hauptziel wird in fünf Teilziele differenziert. Um die spätere Bewertung zu ermöglichen, wird für jedes Teilziel festgelegt, woran seine Erfüllung erkennbar ist (@tab:teilziele).

#figure(
  table(
    columns: (auto, 1fr, 1.3fr, auto),
    align: (left, left, left, center),
    inset: 6pt,
    table.header([*Nr.*], [*Teilziel*], [*Erfüllungskriterium*], [*Priorität*]),
    [TZ1], [Technische Voraussetzungen ermitteln], [Die Voraussetzungen auf Seiten von NOVA, Simplifier und Infrastruktur sind vollständig erfasst und begründet.], [Muss],
    [TZ2], [Grundsätzliche Anbindung nachweisen], [Im @poc sind die Muss-Testfälle TF1 bis TF4 (@tab:testfaelle) erfolgreich durchlaufen.], [Muss],
    [TZ3], [Einschränkungen identifizieren], [Die im @poc und in der Dokumentation festgestellten Einschränkungen sind beschrieben und hinsichtlich ihrer Auswirkung eingeordnet.], [Soll],
    [TZ4], [Sicherheitsaspekte analysieren], [Die relevanten Risiken sind identifiziert und jeweils mit mindestens einer Gegenmaßnahme versehen.], [Muss],
    [TZ5], [Handlungsempfehlung ableiten], [Es liegt eine begründete Empfehlung für das weitere Vorgehen vor, die sich auf die Ergebnisse zu TZ1 bis TZ4 stützt.], [Muss],
  ),
  caption: [Teilziele, Erfüllungskriterien und Prioritäten],
) <tab:teilziele>

== Zielbeziehungen und Prioritäten

Zwischen den Teilzielen bestehen überwiegend komplementäre Beziehungen. So setzt die Handlungsempfehlung (TZ5) die Ergebnisse der übrigen Teilziele voraus, und die Erprobung im @poc (TZ2) liefert zugleich Erkenntnisse zu Voraussetzungen (TZ1) und Einschränkungen (TZ3).

Ein Zielkonflikt besteht zwischen TZ2 und TZ4. Je mehr Funktionen NOVA im @poc zur Verfügung gestellt werden, desto aussagekräftiger ist zwar der Nachweis der Anbindung, desto größer ist aber auch die potenzielle Angriffs- und Fehlerfläche. Dieser Konflikt wird zugunsten der Sicherheit aufgelöst: Im @poc werden ausschließlich lesende Funktionen in einer Testumgebung bereitgestellt. Schreibende Zugriffe auf betriebliche Systeme werden nicht erprobt, sondern nur im Rahmen von TZ4 analytisch betrachtet.

Die Priorisierung folgt der Unterscheidung in Muss- und Soll-Ziele. Muss-Ziele sind für eine belastbare Entscheidungsgrundlage zwingend erforderlich. Das Soll-Ziel TZ3 erhöht deren Aussagekraft, ist für eine Machbarkeitsaussage aber nicht zwingend vollständig zu erfüllen.

== Abgrenzung

Die Transferleistung untersucht die technische Machbarkeit anhand eines ausgewählten Anwendungsszenarios. Der @poc dient ausschließlich der Prüfung der grundsätzlichen Umsetzbarkeit und stellt kein produktiv einsetzbares System dar. Nicht Bestandteil der Arbeit sind die Überführung in den Produktivbetrieb, eine Wirtschaftlichkeitsbetrachtung sowie eine vollständige Sicherheits- oder Datenschutzprüfung. Sicherheitsaspekte werden in dem Umfang betrachtet, der für eine Machbarkeitsaussage erforderlich ist. Die Ergebnisse gelten für das untersuchte Szenario und die eingesetzten Versionen von NOVA und Simplifier; eine Übertragbarkeit auf andere Anwendungsfälle wird nicht vorausgesetzt.
