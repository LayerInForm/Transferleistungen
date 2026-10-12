= Untersuchung der Machbarkeit <synthese>

// PLZ-Phase "Synthese und Analyse": die gewählten Methoden anwenden und zu einem
// Ergebnis gelangen. Reihenfolge entspricht dem Arbeitsprogramm (Tabelle in Kap. 4).

== Grundlagen des Model Context Protocol

Vor der Einführung des @mcp mussten KI-Anwendungen für jedes externe Werkzeug eine eigene Schnittstelle mit individueller Authentifizierung und Datenumwandlung erhalten. Das @mcp ersetzt diese Einzelanbindungen durch ein einheitliches Protokoll, über das Werkzeuge zur Laufzeit gefunden, beschrieben und aufgerufen werden können @hou2025model.

Die Architektur besteht aus drei Komponenten. Der MCP-Host ist die KI-Anwendung, in der Aufgaben bearbeitet werden. Er enthält einen oder mehrere MCP-Clients, die jeweils eine Eins-zu-eins-Verbindung zu einem MCP-Server halten, dessen Fähigkeiten abfragen und Anfragen an ihn richten. Der MCP-Server schließlich ermöglicht den Zugriff auf externe Systeme @hou2025model. Er stellt dafür drei Arten von Fähigkeiten bereit: Tools zur Ausführung von Operationen, Resources zur Bereitstellung von Daten und Prompts als wiederverwendbare Vorlagen @hou2025model.

Beim Verbindungsaufbau fragt der Client die verfügbaren Fähigkeiten des Servers ab und erhält eine Beschreibung der angebotenen Tools, Resources und Prompts. Anhand dieser Beschreibungen wählt das Sprachmodell im Verlauf einer Anfrage ein geeignetes Tool aus, der Client übermittelt den Aufruf, und der Server führt die Operation aus und gibt das Ergebnis zurück @hou2025model. Dieses Zusammenspiel aus Schlussfolgern und Handeln entspricht dem Grundprinzip werkzeugnutzender Sprachmodelle, bei dem das Modell Zwischenschritte begründet und darauf aufbauend Aktionen auslöst @yao2022react.

Übertragen auf die vorliegende Fragestellung übernimmt NOVA die Rolle des MCP-Hosts, sofern es einen MCP-Client enthält oder um einen solchen ergänzt werden kann. Simplifier übernimmt die Rolle des MCP-Servers. Die Business Objects und Connectors von Simplifier bilden die Funktionen, die NOVA als Tools angeboten werden @simplifier2026mcp.

== Betriebliche Anforderungen aus dem Experteninterview

#text(fill: red)[*Hinweis:* Das vorliegende Interview (Anhang) behandelt den Einsatz eines MCP-basierten Agenten allgemein. Simplifier und NOVA werden darin nicht genannt. Laut Auftragsklärung soll das Interview aber gezielt die Anforderungen und Rahmenbedingungen für die Verbindung von Simplifier mit NOVA erheben. Vor der Abgabe ist zu klären, ob dazu ergänzende Aussagen des Experten vorliegen oder ein kurzes Nachgespräch geführt wird. Die folgenden Anforderungen beruhen ausschließlich auf den bereits dokumentierten Aussagen.]

Die Auswertung des Experteninterviews ergibt die in @tab:anforderungen zusammengefassten Anforderungen.

#figure(
  table(
    columns: (auto, 1fr, auto),
    align: (center, left, center),
    inset: 6pt,
    table.header([*Nr.*], [*Anforderung*], [*Quelle*]),
    [A1], [Der Zugriff des KI-Modells auf Informationen und Funktionen erfolgt kontrolliert und ist auf ausgewählte Werkzeuge beschränkt.], [Frage 1, 2],
    [A2], [Verfügbare Werkzeuge, verarbeitete Informationen und ausgelöste Aktionen sind nachvollziehbar.], [Frage 2],
    [A3], [Kritische Aktionen werden nicht ohne menschliche Kontrolle ausgeführt.], [Frage 3],
    [A4], [Die Untersuchung beschränkt sich auf einen klar abgegrenzten Anwendungsfall.], [Frage 3],
    [A5], [Der Prototyp wird anhand definierter Anwendungsfälle und Anforderungen geprüft.], [Frage 4],
    [A6], [Das Ergebnis liefert eine Entscheidungsgrundlage einschließlich erkennbarer Grenzen.], [Frage 5],
    [#text(fill: red)[A7 ff.]], [#text(fill: red)[*TODO:* Simplifier/NOVA-spezifische Anforderungen (z. B. Betriebsumgebung, Authentifizierung, freigegebene Systeme, Datenschutz).]], [],
  ),
  caption: [Aus dem Experteninterview abgeleitete Anforderungen],
) <tab:anforderungen>

== Konzeption des Proof of Concept

=== Anwendungsszenario

#text(fill: red)[*TODO:* Das Szenario beschreiben, z. B. eine standardisierte interne Anfrage, die NOVA mithilfe einer Simplifier-Funktion beantworten soll. Angeben, welches Business Object bzw. welcher Connector genutzt wird und welche Daten dabei gelesen werden. Begründen, warum dieses Szenario repräsentativ und gemäß A4 ausreichend abgegrenzt ist.]

=== Architektur

Die Architektur des @poc folgt der Host-Client-Server-Struktur des @mcp. NOVA fungiert als Host mit MCP-Client, der Simplifier-MCP-Server als Server. Der Server greift auf die Business Objects der Testinstanz zu, die ihrerseits über Connectors mit dem angebundenen System kommunizieren.

#text(fill: red)[*TODO:* Architekturabbildung einfügen (NOVA → MCP-Client → Simplifier-MCP-Server → Business Object → Connector → Backend) und beschreiben, wo der Server-Prozess läuft, welcher Transportweg genutzt wird und wie das Token bereitgestellt wird.]

Gemäß der Auflösung des Zielkonflikts in @zielsetzung werden im @poc nur lesende Funktionen genutzt. Damit wird zugleich A1 berücksichtigt.

=== Testfälle

Die Prüfung erfolgt anhand der in @tab:testfaelle definierten Testfälle. TF1 bis TF4 bilden die Mindestanforderung an eine grundsätzliche Anbindung und sind daher Muss-Testfälle für TZ2.

#figure(
  table(
    columns: (auto, 1fr, 1fr, auto),
    align: (center, left, left, center),
    inset: 6pt,
    table.header([*Nr.*], [*Prüfgegenstand*], [*Erwartetes Ergebnis*], [*Art*]),
    [TF1], [Verbindungsaufbau zwischen NOVA und dem Simplifier-MCP-Server], [Verbindung wird ohne Fehler hergestellt.], [Muss],
    [TF2], [Abruf der verfügbaren Tools], [NOVA erhält die Liste der freigegebenen Simplifier-Funktionen.], [Muss],
    [TF3], [Aufruf einer lesenden Funktion im Szenario], [Die Funktion wird ausgeführt und liefert die erwarteten Daten.], [Muss],
    [TF4], [Verarbeitung des Ergebnisses durch NOVA], [NOVA gibt eine fachlich korrekte Antwort auf Grundlage der gelieferten Daten.], [Muss],
    [TF5], [Verhalten im Fehlerfall (z. B. ungültiges Token, nicht erreichbares Backend)], [Fehler wird erkannt und nachvollziehbar gemeldet.], [Soll],
    [TF6], [Nachvollziehbarkeit der Aufrufe], [Ausgelöste Tool-Aufrufe sind protokolliert bzw. nachvollziehbar (A2).], [Soll],
  ),
  caption: [Testfälle des Proof of Concept],
) <tab:testfaelle>

== Umsetzung des Proof of Concept

#text(fill: red)[*TODO:* Umsetzung beschreiben: eingesetzte Versionen (Simplifier, Simplifier-MCP-Server, NOVA), Konfiguration der Verbindung, Bereitstellung des Business Objects, Probleme während der Umsetzung und wie sie gelöst wurden. Konfigurationsausschnitte ggf. als Listing; Zugangsdaten unkenntlich machen.]

== Ergebnisse der Testfälle

#text(fill: red)[*TODO:* Für jeden Testfall das tatsächliche Ergebnis dokumentieren (bestanden/nicht bestanden, Beobachtungen, ggf. Screenshot im Anhang). Danach die festgestellten Einschränkungen zusammenfassen (Beitrag zu TZ3).]

== Analyse der Sicherheitsaspekte

Die Anbindung eines Sprachmodells an betriebliche Systeme erweitert dessen Handlungsmöglichkeiten und damit auch die möglichen Auswirkungen von Fehlern oder Angriffen. Hou et al. beschreiben unter anderem Risiken durch manipulierte Werkzeugbeschreibungen, gefälschte Installationspakete und unbefugte Zugriffe und empfehlen, Server nach dem Prinzip der geringsten Rechte zu konfigurieren @hou2025model. @tab:risiken überträgt diese Risiken auf die untersuchte Konstellation und ergänzt sie um Risiken, die sich aus der Dokumentation des Simplifier-MCP-Servers ergeben.

#figure(
  table(
    columns: (1fr, 1.2fr, 1.2fr),
    align: left,
    inset: 6pt,
    table.header([*Risiko*], [*Bezug*], [*Mögliche Gegenmaßnahme*]),
    [Zu weitreichende Rechte], [Der Server bietet neben Ausführungs- auch Verwaltungsfunktionen mit schreibendem Zugriff an @simplifier2026mcp.], [Technischen Benutzer mit minimalen Rechten verwenden; nur benötigte Funktionen freigeben.],
    [Unbefugter Zugriff über das Token], [Die Authentifizierung erfolgt über ein Benutzertoken in der Konfiguration @simplifier2026mcp.], [Token sicher verwalten, nicht im Klartext ablegen; Gültigkeit begrenzen.],
    [Ungewollte Aktionen durch das Modell], [Das Modell wählt Werkzeuge selbstständig aus @hou2025model.], [Kritische Aktionen nur nach menschlicher Freigabe (A3); im @poc nur lesende Funktionen.],
    [Manipulierte Werkzeugbeschreibungen oder Pakete], [Tool Poisoning und gefälschte Installer als bekannte MCP-Risiken @hou2025model.], [Server-Version fest vorgeben und aus vertrauenswürdiger Quelle beziehen.],
    [Fehlende Nachvollziehbarkeit], [Anforderung A2 aus dem Experteninterview.], [Tool-Aufrufe protokollieren und regelmäßig auswerten.],
    [#text(fill: red)[*TODO*]], [#text(fill: red)[Unternehmensspezifische Risiken, z. B. Datenschutz bei personenbezogenen Daten, Betrieb außerhalb der Entwicklungsinstanz.]], [],
  ),
  caption: [Sicherheitsrisiken und Gegenmaßnahmen],
) <tab:risiken>

#text(fill: red)[*TODO:* Kurz ergänzen, welche dieser Maßnahmen im @poc bereits umgesetzt wurden und welche für einen späteren Betrieb offen sind.]
