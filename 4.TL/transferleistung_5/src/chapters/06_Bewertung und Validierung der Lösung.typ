= Bewertung <bewertung>

// Seitenbudget: ca. 1,5 Seiten. PLZ-Phase "Bewertung": schließt die Klammer der Zielsetzung.

== Zielerreichung

@tab:zielerreichung bewertet die Ergebnisse anhand der Erfüllungskriterien aus @tab:teilziele.

#figure(
  table(
    columns: (auto, 1fr, auto, 1.7fr),
    align: (center, left, center, left),
    inset: 5pt,
    table.header([*Nr.*], [*Teilziel*], [*Erfüllung*], [*Begründung*]),
    [TZ1], [Voraussetzungen], [erfüllt], [Netzwerkfähiger MCP-Server oder benutzerdefinierte Integration, Erreichbarkeit aus Langdock, technischer Benutzer, lesende Business Objects.],
    [TZ2], [Anbindung], [teilweise], [TF1 bis TF3 bestanden; TF4 als Direktanbindung nicht möglich, über eigenen Adapter technisch nachgewiesen (TF7), in NOVA nicht erprobt.],
    [TZ3], [Einschränkungen], [erfüllt], [Vier Einschränkungen beschrieben und eingeordnet.],
    [TZ4], [Sicherheit], [erfüllt], [Sechs Risiken mit Gegenmaßnahmen.],
    [TZ5], [Empfehlung], [erfüllt], [Begründete Empfehlung in Kapitel 6.2.],
  ),
  caption: [Bewertung der Zielerreichung],
) <tab:zielerreichung>

Mit Ausnahme von TZ2 sind alle Muss-Ziele erfüllt. Die zentrale Erkenntnis ist, dass der Simplifier-MCP-Server in seiner jetzigen Form nicht an NOVA angebunden werden kann, weil Langdock den lokalen Transportweg nicht unterstützt. Zudem ist er für Entwickler konzipiert, nicht für die Bereitstellung ausgewählter Funktionen an ein unternehmensweit genutztes Modell. Simplifier als Quelle der Funktionen ist dagegen geeignet: Business Objects lassen sich über die REST-Schnittstelle aufrufen, und ein eigener, netzwerkfähiger MCP-Adapter funktionierte im @poc. Die Machbarkeit ist damit unter Bedingungen gegeben.

== Handlungsempfehlung

Empfohlen wird, die Integration *unter Bedingungen weiterzuverfolgen*, und zwar nicht über den Hersteller-Server, sondern über eine selbst erstellte Anbindung. Für einen schnellen Pilotbetrieb eignet sich Variante B, da sie ohne zusätzlichen Dienst auskommt und Langdock die Verwaltung der Zugangsdaten übernimmt @langdock2026integrationen. Sollen die Funktionen später auch anderen KI-Anwendungen zur Verfügung stehen, ist Variante A vorzuziehen, da sie auf dem offenen Standard beruht. In beiden Fällen sollten nur freigegebene lesende Business-Object-Funktionen angeboten und ein technischer Benutzer mit minimalen Rechten verwendet werden. Als nächste Schritte sind eine Aktion für das Pilotszenario in Langdock anzulegen und mit einer Simplifier-Entwicklungsinstanz zu testen, die Bestätigungspflicht für kritische Tools festzulegen und IT-Sicherheit und Datenschutz vor dem Pilotbetrieb einzubinden.

== Kritische Würdigung

Die Anforderungen beruhen auf einem Interview mit zwei Vertretern des Auftraggebers. Der @poc nutzte ein Testdouble statt einer realen Simplifier-Instanz und einen generischen Client statt Langdock, sodass das Verhalten der echten Systeme abweichen kann. Variante B wurde nur anhand der Dokumentation bewertet. Da sich @mcp, Simplifier-MCP-Server und Langdock aktiv weiterentwickeln, können sich einzelne Ergebnisse mit künftigen Versionen ändern.