= Untersuchung der Machbarkeit <synthese>

// PLZ-Phase "Synthese und Analyse": die gewählten Methoden anwenden und zu einem
// Ergebnis gelangen. Reihenfolge entspricht dem Arbeitsprogramm (Tabelle in Kap. 4).

== Grundlagen und Anforderungen

Vor der Einführung des @mcp mussten KI-Anwendungen für jedes externe Werkzeug eine eigene Schnittstelle mit individueller Authentifizierung und Datenumwandlung erhalten. Das @mcp ersetzt diese Einzelanbindungen durch ein einheitliches Protokoll, über das Werkzeuge zur Laufzeit gefunden, beschrieben und aufgerufen werden können @hou2025model.

Die Architektur besteht aus drei Komponenten. Der MCP-Host ist die KI-Anwendung, in der Aufgaben bearbeitet werden. Er enthält einen oder mehrere MCP-Clients, die jeweils eine Eins-zu-eins-Verbindung zu einem MCP-Server halten, dessen Fähigkeiten abfragen und Anfragen an ihn richten. Der MCP-Server schließlich ermöglicht den Zugriff auf externe Systeme @hou2025model. Er stellt dafür drei Arten von Fähigkeiten bereit: Tools zur Ausführung von Operationen, Resources zur Bereitstellung von Daten und Prompts als wiederverwendbare Vorlagen @hou2025model.

Beim Verbindungsaufbau fragt der Client die verfügbaren Fähigkeiten des Servers ab und erhält eine Beschreibung der angebotenen Tools, Resources und Prompts. Anhand dieser Beschreibungen wählt das Sprachmodell im Verlauf einer Anfrage ein geeignetes Tool aus, der Client übermittelt den Aufruf, und der Server führt die Operation aus und gibt das Ergebnis zurück @hou2025model. Dieses Zusammenspiel aus Schlussfolgern und Handeln entspricht dem Grundprinzip werkzeugnutzender Sprachmodelle, bei dem das Modell Zwischenschritte begründet und darauf aufbauend Aktionen auslöst @yao2022react.

Übertragen auf die vorliegende Fragestellung übernimmt Langdock als Plattform von NOVA die Rolle des MCP-Hosts, sofern die MCP-Integration für NOVA verfügbar und freigeschaltet ist. Ein eigener, netzwerkfähiger MCP-Server müsste die ausgewählten Simplifier-Funktionen als Tools bereitstellen und deren Aufrufe an Business Objects beziehungsweise die zugehörigen Schnittstellen weiterleiten. Die Dokumentationen beider Plattformen bilden eine Grundlage für diese Konzeption; eine solche Verbindung ist derzeit nicht eingerichtet.

Das dokumentierte Interview behandelt den Einsatz eines MCP-basierten Agenten allgemein; NOVA und Simplifier werden nicht ausdrücklich thematisiert @interview_mcp_agent_2026. Die daraus abgeleiteten Anforderungen beschreiben deshalb allgemeine Rahmenbedingungen und sind nicht als bestätigte unternehmensspezifische Anforderungen zu verstehen.

Das Interview setzt sechs allgemeine Anforderungen: Der Zugriff ist auf ausgewählte Werkzeuge zu beschränken (Fragen 1–2), Werkzeuge und Aktionen müssen nachvollziehbar sein (Frage 2), kritische Aktionen menschliche Kontrolle erfordern (Frage 3), die Untersuchung einen abgegrenzten Anwendungsfall betrachten und den Prototyp anhand definierter Kriterien prüfen (Fragen 3–4) sowie eine Entscheidungsgrundlage mit erkennbaren Grenzen liefern (Frage 5) @interview_mcp_agent_2026. Diese Punkte sind allgemeine Anforderungen und keine bestätigten NOVA- oder Simplifier-spezifischen Vorgaben.

== Konzeption der Anbindung

*Anwendungsszenario.* Als Prüfszenario eignet sich eine standardisierte interne Anfrage, bei der NOVA zu einem klar eingegrenzten Thema Informationen aus einem freigegebenen, ausschließlich lesenden Simplifier-Business-Object abruft und daraus einen Handlungsvorschlag formuliert. Ein konkretes Business Object, ein Connector und die zu verwendenden Daten sind mit dem Fachbereich festzulegen; das Interview enthält dazu keine Angaben. Das Szenario ist daher eine konzeptionelle Abgrenzung und noch kein durchgeführter Anwendungsfall.

*Zielarchitektur.* Die Zielarchitektur folgt der Host-Client-Server-Struktur des @mcp. Langdock stellt als Host die MCP-Integration bereit. Ein selbst zu entwickelnder MCP-Server wird in einer von Langdock erreichbaren Umgebung betrieben und bietet über einen unterstützten Netzwerktransport ausschließlich die freigegebenen Tools an. Bei einem Aufruf greift er mit einem dafür vorgesehenen technischen Zugang auf ein Simplifier-Business-Object zu und gibt das Ergebnis an NOVA zurück. Authentifizierung, Netzwerkerreichbarkeit und Berechtigungen sind vor einer Umsetzung mit den Verantwortlichen festzulegen.

#figure(
  box(width: 100%, inset: 6pt, stroke: 0.5pt + luma(150), radius: 3pt)[
    #set text(size: 9pt)
    #grid(columns: (1fr, auto, 1fr, auto, 1fr), align: center + horizon, gutter: 4pt,
      box(stroke: 0.5pt, inset: 5pt, radius: 2pt)[*NOVA* \ (Langdock als Host)],
      [⇄ \ MCP \ über Netzwerk],
      box(stroke: 0.5pt, inset: 5pt, radius: 2pt)[*Eigener MCP-Server* \ nur freigegebene Tools],
      [⇄ \ API-Aufruf],
      box(stroke: 0.5pt, inset: 5pt, radius: 2pt)[*Simplifier* \ Business Object],
    )
  ],
  caption: [Konzeptionelle Zielarchitektur einer selbst entwickelten MCP-Anbindung],
) <fig:zielarchitektur>

Die Abbildung zeigt eine Zielarchitektur, keine bereits implementierte Verbindung. Insbesondere müssen der unterstützte Transportweg, die konkrete Simplifier-Schnittstelle und die sichere Verwaltung der Zugangsdaten in einem PoC überprüft werden. Die Beschränkung auf lesende Funktionen folgt dem in @zielsetzung festgelegten Vorrang der Sicherheit.

*Prüfschritte für einen späteren Proof of Concept.* Die nachstehenden Prüfschritte operationalisieren den Nachweis einer grundsätzlichen Anbindung. Sie wurden in dieser Arbeit nicht ausgeführt, da keine einsatzbereite Anbindung an NOVA und Simplifier vorliegt.

#figure(
  table(
    columns: (auto, 1fr, 1fr, auto),
    align: (center, left, left, center),
    inset: 5pt,
    table.header([*Nr.*], [*Prüfschritt*], [*Erwartetes Ergebnis*], [*Priorität*]),
    [TF1], [Verbindung NOVA–Server], [Verbindung wird hergestellt.], [Muss],
    [TF2], [Tools abrufen], [Nur freigegebene Funktionen sind verfügbar.], [Muss],
    [TF3], [Lesende Funktion aufrufen], [Erwartete Daten werden geliefert.], [Muss],
    [TF4], [Ergebnis in NOVA verarbeiten], [NOVA formuliert einen passenden Vorschlag.], [Muss],
    [TF5], [Fehlerfall prüfen], [Fehler wird erkannt und gemeldet.], [Soll],
    [TF6], [Aufrufe nachvollziehen], [Tool-Aufrufe sind protokolliert (A2).], [Soll],
  ),
  caption: [Testfälle des Proof of Concept],
) <tab:testfaelle>

== Machbarkeit und offene Nachweise

Ein eigener MCP-Server für die Verbindung von NOVA mit Simplifier ist derzeit nicht vorhanden. Die vorhandenen Informationen zu den Integrationsmöglichkeiten von Langdock und zu den Schnittstellen und Business Objects von Simplifier reichen aus, um eine Eigenentwicklung zu konzipieren. Dafür muss ein Server die ausgewählten Funktionen über einen von Langdock unterstützten Netzwerktransport veröffentlichen und die Aufrufe kontrolliert an Simplifier weiterleiten. Die Dokumentation allein belegt jedoch weder die Erreichbarkeit aus der konkreten Langdock-Umgebung noch die korrekte Verarbeitung eines realen Aufrufs. Da kein eigener Server implementiert und kein Test in einer Unternehmensumgebung durchgeführt wurde, liegen keine empirischen Testergebnisse vor.

Aus der Dokumentenanalyse ergeben sich drei zentrale Einschränkungen. Erstens ist keine für NOVA unmittelbar nutzbare MCP-Anbindung vorhanden; die Integration erfordert eine Eigenentwicklung. Zweitens sind das konkrete Anwendungsszenario, die freizugebenden Business Objects und die technischen Zugangsdaten noch mit dem Fachbereich und den Systemverantwortlichen festzulegen. Drittens sind Netzwerkzugriff, Authentifizierung, Berechtigungsgrenzen und Verhalten im Fehlerfall erst durch einen PoC in einer freigegebenen Testumgebung nachweisbar. Die grundsätzliche Umsetzbarkeit ist damit konzeptionell plausibel, aber praktisch nicht belegt.

== Analyse der Sicherheitsaspekte

Die Anbindung eines Sprachmodells an betriebliche Systeme erweitert dessen Handlungsmöglichkeiten und damit auch die möglichen Auswirkungen von Fehlern oder Angriffen. Hou et al. beschreiben Risiken durch manipulierte Werkzeugbeschreibungen, gefälschte Installationspakete und unbefugte Zugriffe und empfehlen das Prinzip der geringsten Rechte @hou2025model. Für die geplante Eigenentwicklung ergeben sich daraus drei zentrale Schutzbedarfe: (1) Nur ein technischer Benutzer mit minimalen Rechten und ausschließlich freigegebenen, zunächst lesenden Funktionen sollte eingesetzt werden. (2) Zugangsdaten müssen geschützt verwaltet und Server-Versionen aus vertrauenswürdigen Quellen bezogen werden. (3) Tool-Aufrufe sind zu protokollieren; Umfang und Zweck verarbeiteter Daten müssen begrenzt und vor einem Pilotbetrieb mit IT-Sicherheit und Datenschutz abgestimmt werden. Kritische Aktionen sollten menschliche Freigabe erfordern.

Da kein eigener Server umgesetzt und kein @poc durchgeführt wurde, sind die genannten Maßnahmen Empfehlungen und nicht als bereits implementierte Kontrollen zu verstehen. Ihre konkrete Ausgestaltung und Wirksamkeit müssen vor einem Pilotbetrieb geprüft und dokumentiert werden.
