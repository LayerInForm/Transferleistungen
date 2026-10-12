= Untersuchung der Machbarkeit <synthese>

// Seitenbudget: ca. 5 Seiten. PLZ-Phase "Synthese und Analyse".

== Grundlagen des Model Context Protocol

Das @mcp ersetzt individuelle Einzelanbindungen von Werkzeugen durch ein einheitliches Protokoll, über das Werkzeuge zur Laufzeit gefunden, beschrieben und aufgerufen werden @hou2025model. Die Architektur umfasst den Host als KI-Anwendung, darin einen oder mehrere Clients mit jeweils einer Verbindung zu einem Server, sowie den Server, der den Zugriff auf externe Systeme ermöglicht. Ein Server bietet Tools zur Ausführung von Operationen, Resources zur Bereitstellung von Daten und Prompts als Vorlagen an. Das Sprachmodell wählt anhand der Beschreibungen ein Tool aus, dessen Aufruf der Server ausführt @hou2025model @yao2022react. Übertragen auf die Fragestellung übernimmt Langdock als Plattform von NOVA die Rolle des Hosts @langdock2026mcp, Business Objects von Simplifier bilden die Funktionen, die als Tools angeboten werden @simplifier2026mcp.

== Betriebliche Anforderungen

Das Experteninterview wurde mit zwei Vertretern des Auftraggebers geführt (Anhang A). Aus ihren Aussagen und der Vorgabe des Auftraggebers ergeben sich die Anforderungen in @tab:anforderungen.

#figure(
  table(
    columns: (auto, 1fr, auto),
    align: (center, left, center),
    inset: 5pt,
    table.header([*Nr.*], [*Anforderung*], [*Quelle*]),
    [A1], [Zugriff des KI-Modells erfolgt kontrolliert und beschränkt auf ausgewählte Werkzeuge.], [Frage 1, 2],
    [A2], [Werkzeuge, verarbeitete Informationen und Aktionen sind nachvollziehbar.], [Frage 2],
    [A3], [Kritische Aktionen erfordern menschliche Kontrolle.], [Frage 3],
    [A4], [Die Prüfung erfolgt an einem abgegrenzten, definierten Anwendungsfall.], [Frage 3, 4],
    [A5], [NOVA schlägt ein Vorgehen lediglich vor und führt keine Aktionen selbstständig aus.], [Auftraggeber],
  ),
  caption: [Anforderungen an die Integration],
) <tab:anforderungen>

== Konzeption des Proof of Concept

*Anwendungsszenario.* Ein Mitarbeitender bittet NOVA um Unterstützung bei einem standardisierten internen Anliegen, etwa dem Zurücksetzen eines Passworts. NOVA ermittelt über Simplifier das hinterlegte Standardvorgehen und schlägt es vor. Dafür stellt ein Business Object `NovaAssist` die lesende Funktion `getStandardvorgehen` mit dem Parameter `thema` bereit. Das Szenario ist bewusst auf eine lesende Funktion begrenzt (A4) und entspricht der assistierenden Rolle von NOVA (A5).

*Architektur.* Der @poc wird in zwei Stufen durchgeführt. In Stufe 1 wird der Hersteller-Server unverändert von einem generischen MCP-Client über die Standard-Ein- und -Ausgabe angesprochen. Da Langdock diesen Transportweg nicht unterstützt @langdock2026mcp, wird in Stufe 2 ein eigener MCP-Adapter vorgeschaltet (@fig:architektur). Er ist über Streamable HTTP erreichbar, mit einem API-Schlüssel geschützt, bietet ausschließlich ein lesendes Tool an und ruft dafür die REST-Schnittstelle von Simplifier auf. In beiden Stufen ersetzt ein generischer Client den Client in Langdock und ein Testdouble die Simplifier-Instanz.

#figure(
  box(width: 100%, inset: 6pt, stroke: 0.5pt + luma(150), radius: 3pt)[
    #set text(size: 9pt)
    #grid(columns: (1fr, auto, 1fr, auto, 1fr, auto, 1fr), align: center + horizon, gutter: 4pt,
      box(stroke: 0.5pt, inset: 5pt, radius: 2pt)[*NOVA* \ (Langdock, Host) \ _im PoC: generischer \ MCP-Client_],
      [⇄ \ HTTP + \ API-Key],
      box(stroke: 0.5pt, inset: 5pt, radius: 2pt)[*Eigener \ MCP-Adapter* \ 1 lesendes Tool],
      [⇄ \ REST + \ Token],
      box(stroke: 0.5pt, inset: 5pt, radius: 2pt)[*Simplifier* \ Business Object \ _im PoC: Testdouble_],
      [⇄ \ Connector],
      box(stroke: 0.5pt + luma(150), inset: 5pt, radius: 2pt)[*SAP / weitere \ Systeme* \ _nicht Teil \ des PoC_],
    )
  ],
  caption: [Zielarchitektur mit eigenem MCP-Adapter (Stufe 2)],
) <fig:architektur>

== Umsetzung und Testergebnisse

Der @poc wurde mit dem Simplifier-MCP-Server 0.11.2 und dem offiziellen MCP-SDK für TypeScript 1.32.1 unter Node.js 22 umgesetzt; Testdouble, Adapter und Testclients sind in Anhang B dokumentiert. Die Testdaten sind fiktiv. TF1 bis TF4 bilden die Mindestanforderung für TZ2 (@tab:testfaelle).

#figure(
  table(
    columns: (auto, 1fr, auto, 1.6fr),
    align: (center, left, center, left),
    inset: 5pt,
    table.header([*Nr.*], [*Prüfgegenstand*], [*Art*], [*Ergebnis*]),
    [TF1], [Verbindungsaufbau zum Hersteller-Server (stdio)], [Muss], [Bestanden. Verbindung in unter 0,5 s.],
    [TF2], [Abruf der verfügbaren Fähigkeiten], [Muss], [Bestanden. 36 Tools, 23 Resources, 3 Prompts.],
    [TF3], [Aufruf der lesenden Funktion], [Muss], [Bestanden. Erwartete Schritte geliefert; unbekannte Themen als Fehler gemeldet.],
    [TF4], [Anbindung an NOVA (Langdock)], [Muss], [Direkt nicht möglich, da Langdock nur Streamable HTTP und SSE unterstützt @langdock2026mcp. Verarbeitung in NOVA nicht erprobt.],
    [TF5], [Fehlerfall ungültiges Token], [Soll], [Bestanden. HTTP 401, als Tool-Fehler gemeldet.],
    [TF6], [Nachvollziehbarkeit der Aufrufe], [Soll], [Bestanden. Anfrageprotokoll mit geschwärztem Token.],
    [TF7], [Eigener Adapter über Streamable HTTP mit API-Key], [Soll], [Bestanden. Nur das freigegebene Tool sichtbar, Aufruf erfolgreich, falscher Schlüssel abgelehnt.],
  ),
  caption: [Testfälle und Ergebnisse des Proof of Concept],
) <tab:testfaelle>

Aus @poc, Quellcode- und Dokumentenanalyse ergeben sich folgende Einschränkungen (TZ3):

- *Inkompatibler Transport.* Der Hersteller-Server unterstützt nur die Standard-Ein- und -Ausgabe, Langdock nur netzwerkbasierte Transportwege @langdock2026mcp. Eine Direktanbindung ist daher ausgeschlossen. Zudem blockiert Langdock standardmäßig private und interne Netzwerkadressen; ein interner Server ist nur in einem dedizierten Deployment erreichbar @langdock2026mcp.
- *Keine Einschränkung der Tools.* Der Hersteller-Server bietet stets alle 36 Tools an, darunter 14 schreibende und 9 destruktive, etwa zum Löschen von Business Objects oder SAP-Systemkonfigurationen. Eine serverseitige Beschränkung ist nicht vorgesehen. Dies widerspricht A1 und A5.
- *Ausführung nur über Testfunktionen.* Funktionen werden über das Entwicklungswerkzeug `businessobject-function-test` ausgeführt, das als nur lesend gekennzeichnet ist, obwohl die aufgerufene Funktion beliebigen Code ausführen kann.
- *Authentifizierung.* Neben dem wechselnden Token unterstützt der Server eine Anmeldung über eine Datei mit Zugangsdaten. Ein technischer Benutzer ist damit möglich, die Zugangsdaten liegen dann jedoch im Dateisystem.

== Anbindungsvarianten

Da keine fertige Anbindung existiert @langdock2026verzeichnis @langdock2026mcpverzeichnis, kommen zwei selbst zu erstellende Varianten in Betracht (@tab:varianten). In Variante A wird der in Stufe 2 erprobte MCP-Adapter als MCP-Integration in Langdock eingebunden. Langdock erlaubt dabei, die zu aktivierenden Tools auszuwählen und für einzelne Tools eine Bestätigung vor der Ausführung zu verlangen @langdock2026mcp. In Variante B wird eine benutzerdefinierte Integration angelegt, deren Aktionen die REST-Schnittstelle von Simplifier direkt aufrufen. Zugangsdaten werden dabei in Authentifizierungsfeldern hinterlegt, und der Code läuft in einer abgeschotteten Umgebung ohne externe Bibliotheken @langdock2026integrationen.

#figure(
  table(
    columns: (auto, 1fr, 1fr),
    align: left,
    inset: 5pt,
    table.header([*Kriterium*], [*A: Eigener MCP-Adapter*], [*B: Benutzerdefinierte Integration*]),
    [Standard], [@mcp, auch für andere Clients nutzbar], [Langdock-spezifisch],
    [Betrieb], [Eigener, aus Langdock erreichbarer Dienst nötig], [Kein zusätzlicher Dienst],
    [Umfang], [Tools zentral im Adapter gepflegt], [Jede Funktion als eigene Aktion],
    [Nachweis], [Im @poc erprobt (TF7)], [Nur dokumentenbasiert geprüft],
  ),
  caption: [Vergleich der Anbindungsvarianten],
) <tab:varianten>

== Sicherheitsaspekte

Die Anbindung an betriebliche Systeme erweitert die Handlungsmöglichkeiten eines Sprachmodells und damit die Auswirkungen von Fehlern oder Angriffen. Hou et al. nennen unter anderem manipulierte Werkzeugbeschreibungen, gefälschte Installationspakete und unbefugte Zugriffe und empfehlen das Prinzip der geringsten Rechte @hou2025model. @tab:risiken überträgt dies auf die untersuchte Konstellation.

#figure(
  table(
    columns: (1fr, 1.3fr, 1.3fr),
    align: left,
    inset: 5pt,
    table.header([*Risiko*], [*Bezug*], [*Gegenmaßnahme*]),
    [Zu weitreichende Rechte], [Hersteller-Server bietet schreibende und destruktive Tools], [Nur freigegebene lesende Funktionen anbieten (Variante A oder B), technischer Benutzer mit minimalen Rechten],
    [Missbrauch von Zugangsdaten], [Token, Zugangsdatei bzw. API-Schlüssel @simplifier2026mcp], [Ablage in Authentifizierungsfeldern @langdock2026integrationen, begrenzte Gültigkeit],
    [Ungewollte Aktionen], [Bestätigung vor Ausführung in Langdock standardmäßig deaktiviert @langdock2026mcp], [Bestätigung für kritische Tools aktivieren (A3)],
    [Exponierter Dienst], [Adapter muss aus Langdock erreichbar sein @langdock2026mcp], [Absicherung per Schlüssel oder OAuth, Erreichbarkeit beschränken],
    [Manipulierte Tools], [Tool Poisoning, gefälschte Installer @hou2025model], [Eigener Adapter mit fester Tool-Beschreibung],
    [Fehlende Nachvollziehbarkeit], [Anforderung A2], [Tool-Aufrufe protokollieren],
  ),
  caption: [Sicherheitsrisiken und Gegenmaßnahmen],
) <tab:risiken>

Im @poc umgesetzt wurden die Beschränkung auf eine lesende Funktion, der API-Schlüssel, der Verzicht auf personenbezogene Daten und die Protokollierung; die übrigen Maßnahmen sind für einen Betrieb umzusetzen.