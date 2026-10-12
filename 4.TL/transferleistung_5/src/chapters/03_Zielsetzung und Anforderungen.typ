= Zielsetzung <zielsetzung>

// Seitenbudget: ca. 1,25 Seiten. Teilziele = Bewertungskriterien in Kap. 6.

Ziel der Transferleistung ist es, die technische Machbarkeit zu untersuchen, Simplifier als MCP-Server zur Anbindung von NOVA einzusetzen, und daraus eine Empfehlung für das weitere Vorgehen abzuleiten. @tab:teilziele differenziert dieses Hauptziel in Teilziele mit überprüfbaren Erfüllungskriterien.

#figure(
  table(
    columns: (auto, 1fr, 1.4fr, auto),
    align: (center, left, left, center),
    inset: 5pt,
    table.header([*Nr.*], [*Teilziel*], [*Erfüllungskriterium*], [*Prio.*]),
    [TZ1], [Technische Voraussetzungen ermitteln], [Voraussetzungen für NOVA, Simplifier und Infrastruktur sind vollständig erfasst und begründet.], [Muss],
    [TZ2], [Anbindung nachweisen], [Die Muss-Testfälle TF1 bis TF4 (@tab:testfaelle) sind bestanden.], [Muss],
    [TZ3], [Einschränkungen identifizieren], [Festgestellte Einschränkungen sind beschrieben und in ihrer Auswirkung eingeordnet.], [Soll],
    [TZ4], [Sicherheitsaspekte analysieren], [Relevante Risiken sind identifiziert und mit je mindestens einer Gegenmaßnahme versehen.], [Muss],
    [TZ5], [Empfehlung ableiten], [Eine auf TZ1 bis TZ4 gestützte, begründete Empfehlung liegt vor.], [Muss],
  ),
  caption: [Teilziele, Erfüllungskriterien und Prioritäten],
) <tab:teilziele>

Die Teilziele ergänzen sich überwiegend; TZ5 baut auf den übrigen auf. Ein Zielkonflikt besteht zwischen TZ2 und TZ4, da mehr bereitgestellte Funktionen den Nachweis stärken, aber das Risiko erhöhen. Er wird zugunsten der Sicherheit aufgelöst: Im @poc werden nur lesende Funktionen in einer Testumgebung genutzt.

*Abgrenzung.* Untersucht wird die Machbarkeit anhand eines Anwendungsszenarios. Der @poc ist kein produktives System. Nicht Bestandteil sind Produktivsetzung, Wirtschaftlichkeitsbetrachtung sowie eine vollständige Sicherheits- und Datenschutzprüfung. Die Ergebnisse gelten für das untersuchte Szenario und die eingesetzten Versionen.