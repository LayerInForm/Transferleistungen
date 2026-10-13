= Bewertung <bewertung>

// PLZ-Phase "Bewertung": Erfüllungsgrad je Teilziel bestimmen. Hier wird die
// "Klammer" geschlossen, die in Kapitel 3 mit der Zielsetzung geöffnet wurde.

== Zielerreichung

Die Ergebnisse aus @synthese werden im Folgenden anhand der Erfüllungskriterien aus @tab:teilziele bewertet. Da kein praktischer @poc durchgeführt wurde, berücksichtigt die Bewertung ausdrücklich, dass die technische Anbindung nicht empirisch nachgewiesen ist. @tab:zielerreichung fasst die Bewertung zusammen.

#figure(
  table(
    columns: (auto, 1fr, auto),
    align: (center, left, center),
    inset: 5pt,
    table.header([*Nr.*], [*Teilziel*], [*Erfüllungsgrad*]),
    [TZ1], [Voraussetzungen], [Teilweise],
    [TZ2], [Anbindung nachweisen], [Nicht erfüllt],
    [TZ3], [Einschränkungen], [Erfüllt],
    [TZ4], [Sicherheitsaspekte], [Erfüllt],
    [TZ5], [Empfehlung], [Erfüllt],
  ),
  caption: [Bewertung der Zielerreichung],
) <tab:zielerreichung>

TZ1 ist teilweise erfüllt, weil die technischen Möglichkeiten auf Basis der Dokumentationen beschrieben sind, konkrete Angaben zur Unternehmensumgebung und zu Berechtigungen jedoch nicht vorliegen (@synthese). TZ2 ist nicht erfüllt: Ohne implementierten Server und Verbindung zu NOVA konnte keiner der definierten Prüfschritte durchgeführt werden. TZ3 ist erfüllt, da die wesentlichen Einschränkungen und noch offenen Nachweise herausgearbeitet wurden. TZ4 ist erfüllt im Sinne einer dokumentarischen Risikoanalyse; die vorgeschlagenen Maßnahmen wurden nicht implementiert oder auf ihre Wirksamkeit getestet. TZ5 ist erfüllt, weil sich aus diesen Ergebnissen eine begründete Empfehlung für die nächsten Schritte ableiten lässt.

Die Muss-Ziele TZ1 und TZ2 sind damit nicht vollständig erfüllt. Eine praktische Machbarkeit kann folglich nicht als nachgewiesen gelten. Auf Grundlage der verfügbaren Dokumentationen erscheint eine Eigenentwicklung grundsätzlich konzipierbar; ob sie in der konkreten NOVA- und Simplifier-Umgebung funktioniert, bleibt offen.

== Handlungsempfehlung

Empfohlen wird, die Integration unter Bedingungen weiterzuverfolgen. Für eine MCP-basierte Lösung sollte zunächst ein eigener, netzwerkfähiger Server entwickelt werden, der nur fachlich freigegebene, zunächst ausschließlich lesende Simplifier-Funktionen anbietet. Die Informationen von Langdock und Simplifier bilden dafür die technische Ausgangsbasis; vor dem Entwicklungsstart sind Anwendungsszenario, Testumgebung, Netzwerkfreigaben, Authentifizierung und Berechtigungen mit den zuständigen Fach- und IT-Stellen abzustimmen. Anschließend sollte ein PoC die sechs Prüfschritte aus @tab:testfaelle in einer isolierten Testumgebung durchlaufen. Erst nach erfolgreichem Test sowie einer Prüfung durch IT-Sicherheit und Datenschutz sollte über einen Pilotbetrieb entschieden werden. Eine benutzerdefinierte Langdock-Integration, die Simplifier-Funktionen direkt aufruft, kann als einfachere Alternative geprüft werden, falls die Wiederverwendbarkeit des @mcp nicht erforderlich ist.

== Kritische Würdigung

Die Aussagekraft der Ergebnisse ist begrenzt. Das Interview behandelt den Einsatz eines MCP-basierten Agenten allgemein und enthält keine bestätigten Angaben zu NOVA, Simplifier oder einem konkreten betrieblichen Anwendungsszenario. Da kein eigener Server implementiert und kein @poc durchgeführt wurde, beruhen die Aussagen zur Integration auf einer dokumentarischen und konzeptionellen Prüfung. Aussagen zur tatsächlichen Erreichbarkeit aus Langdock, zur korrekten Verarbeitung realer Simplifier-Daten, zur Leistungsfähigkeit, zum Verhalten unter Last und zum dauerhaften Betrieb sind daher nicht möglich. Die vorgeschlagenen Sicherheitsmaßnahmen wurden ebenfalls nicht praktisch validiert.
