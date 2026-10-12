<<<<<<< HEAD
= Situationsanalyse <situationsanalyse>

// Seitenbudget: ca. 1,5 Seiten. PLZ-Phase "Situationsanalyse" (praxisorientiert),
// endet mit dem Defizit.

== Betriebliche Ausgangssituation

Im Unternehmen wird das interne KI-Modell NOVA betrieben, das auf der Plattform Langdock basiert. NOVA kann derzeit nur auf Informationen zurückgreifen, die ihm innerhalb einer Anfrage bereitgestellt werden. Künftig soll es Mitarbeitende bei standardisierten internen Anliegen unterstützen, indem es auf Basis betrieblicher Informationen ein passendes Standardvorgehen vorschlägt. Nach Vorgabe des Auftraggebers soll NOVA dabei ausschließlich assistieren, also Vorschläge unterbreiten, aber keine Aktionen in betrieblichen Systemen selbstständig ausführen.

Für die Anbindung betrieblicher Systeme nutzt das Unternehmen die Low-Code-Plattform Simplifier. Sie ist insbesondere an SAP angebunden und wird für Workflows und weitere Anwendungen rund um diese Systeme eingesetzt. Simplifier stellt Funktionen als Business Objects bereit, die serverseitig ausgeführte JavaScript-Funktionen enthalten; externe Systeme werden über Connectors angebunden, etwa über REST, SOAP, SQL oder SAP RFC @simplifier2026mcp. Damit bündelt Simplifier bereits einen Großteil der Systemzugriffe, die für NOVA relevant wären.

== Technische Ausgangssituation

*Anbindungsmöglichkeiten in Langdock.* Langdock sieht drei Wege vor, externe Systeme anzubinden. Native Integrationen werden vom Anbieter bereitgestellt und übernehmen Authentifizierung und Schnittstellenkommunikation @langdock2026verzeichnis. MCP-Integrationen verbinden Langdock als MCP-Host mit externen MCP-Servern; unterstützt werden dabei ausschließlich die netzwerkbasierten Transportwege Streamable HTTP und Server-Sent Events @langdock2026mcp. Benutzerdefinierte Integrationen schließlich erlauben es, beliebige Systeme mit einer Programmierschnittstelle selbst anzubinden, indem in JavaScript formulierte Aktionen angelegt werden, die Agenten aufrufen können @langdock2026integrationen. Weder das Verzeichnis der nativen Integrationen noch das Verzeichnis der von Langdock geprüften MCP-Server enthält einen Eintrag für Simplifier @langdock2026verzeichnis @langdock2026mcpverzeichnis. Eine fertige Anbindung steht damit nicht zur Verfügung.

*MCP-Server von Simplifier.* Der Hersteller stellt einen MCP-Server bereit, über den KI-Anwendungen Connectors, Business Objects und Datentypen verwalten sowie Funktionen ausführen können @simplifier2026mcp. Laut Dokumentation wird er jedoch als lokaler Prozess gestartet und kommuniziert über die Standard-Ein- und -Ausgabe. Die Authentifizierung erfolgt im Regelfall über ein Benutzertoken, das sich mit jeder Anmeldung ändert, und der Funktionsumfang ist auf die Entwicklung von Simplifier-Artefakten ausgerichtet und umfasst schreibende Zugriffe @simplifier2026mcp. Dies steht in einem Spannungsverhältnis zur Vorgabe, dass NOVA lediglich assistieren soll. Zudem deutet der Vergleich der Transportwege darauf hin, dass sich der Server nicht ohne Weiteres in Langdock einbinden lässt.

== Defizit

Eine technische Grundlage ist damit vorhanden, ihre Eignung für den betrieblichen Zweck aber ungeklärt. Offen ist, welche Voraussetzungen erfüllt sein müssen, ob und auf welchem Weg NOVA mit Simplifier verbunden werden kann, welche Einschränkungen bestehen und welche Sicherheitsrisiken entstehen, wenn ein KI-Modell über Simplifier auf betriebliche Systeme zugreift. Eine systematische Untersuchung und praktische Erprobung fehlen bislang. Dem Unternehmen fehlt somit eine fundierte Entscheidungsgrundlage.
=======
= Situationsanalyse <situationsanalyse>

// PLZ-Phase "Situationsanalyse" (praxisorientiert): das praktische Problem genau
// identifizieren, in seinen Kontext einordnen und am Ende ein Defizit herausarbeiten.

== Betriebliche Ausgangssituation

Im Unternehmen wird mit NOVA ein unternehmensinternes KI-Modell betrieben. #text(fill: red)[*TODO:* NOVA kurz beschreiben: technische Basis (welches Modell/welche Plattform), Betriebsform (On-Premises/Cloud), aktuelle Nutzergruppen und Einsatzbereiche, Art des Zugriffs (z. B. Chat-Oberfläche).] In seiner derzeitigen Form kann NOVA ausschließlich auf die Informationen zurückgreifen, die ihm innerhalb einer Anfrage bereitgestellt werden. Ein Zugriff auf Daten oder Funktionen weiterer betrieblicher Systeme besteht nicht.

Das Unternehmen strebt an, KI-gestützte Funktionen künftig stärker in die bestehende Systemlandschaft zu integrieren. NOVA soll dazu mit zusätzlichen Funktionen und Systemzugriffen ausgestattet werden, um beispielsweise bei standardisierten internen Anfragen relevante Informationen abzurufen und darauf aufbauend Vorschläge für das weitere Vorgehen zu erstellen. #text(fill: red)[*TODO:* Ein bis zwei konkrete Beispiele für solche Anfragen aus dem Unternehmen nennen.]

Für die Anbindung betrieblicher Systeme setzt das Unternehmen die Low-Code-Plattform Simplifier ein. #text(fill: red)[*TODO:* Einsatz von Simplifier im Unternehmen beschreiben: seit wann, wofür, welche Systeme bereits über Connectors angebunden sind (z. B. SAP), welche Umgebungen (DEV/QA/PROD) existieren, On-Premises oder Cloud.] Simplifier stellt Funktionen in Form sogenannter Business Objects bereit, die serverseitig ausgeführte JavaScript-Funktionen enthalten. Externe Systeme werden über Connectors angebunden, unter anderem über REST, SOAP, SQL und SAP RFC @simplifier2026mcp.

== Technische Ausgangssituation

Der Hersteller von Simplifier stellt einen MCP-Server bereit, über den KI-Anwendungen mit einer Simplifier-Instanz interagieren können. Laut Dokumentation ermöglicht dieser Server unter anderem, Connectors, Business Objects und Datentypen zu verwalten, Business-Object-Funktionen auszuführen und Connector-Aufrufe an externe Systeme abzusetzen @simplifier2026mcp. Damit bietet Simplifier grundsätzlich einen Weg, Funktionen betrieblicher Systeme über das @mcp für ein Sprachmodell nutzbar zu machen.

Die Dokumentation des MCP-Servers wurde im Unternehmen als erste Informationsgrundlage herangezogen. Aus ihr ergeben sich jedoch bereits Merkmale, die für einen Einsatz mit NOVA zu prüfen sind. Die dokumentierte Konfiguration sieht vor, den Server als lokalen Prozess zu starten, der über die Standard-Ein- und -Ausgabe mit dem MCP-Client kommuniziert. Die Authentifizierung erfolgt über ein Benutzertoken, das sich laut Dokumentation mit jeder Anmeldung an Simplifier ändert und anschließend neu hinterlegt werden muss. Die Beispielkonfigurationen beziehen sich zudem auf eine Entwicklungsinstanz @simplifier2026mcp. Ebenso ist der Funktionsumfang des Servers erkennbar auf die Entwicklung und Verwaltung von Simplifier-Artefakten ausgerichtet und umfasst damit auch schreibende Zugriffe.

Ob und wie sich diese Merkmale mit den Anforderungen eines unternehmensweit genutzten KI-Modells vereinbaren lassen, ist bislang nicht untersucht. #text(fill: red)[*TODO:* Prüfen und ergänzen, ob NOVA bereits als MCP-Client bzw. MCP-Host fungieren kann und welche Transportwege es unterstützt.]

== Defizit

Aus der Analyse ergibt sich, dass für den Einsatz von Simplifier als MCP-Server für NOVA zwar eine technische Grundlage vorhanden ist, deren Eignung für den betrieblichen Zweck aber offen ist. Im Einzelnen ist unklar,

- welche technischen Voraussetzungen auf Seiten von NOVA, Simplifier und der Infrastruktur erfüllt sein müssen,
- ob und wie die Verbindung zwischen NOVA und dem Simplifier-MCP-Server praktisch umgesetzt werden kann,
- welche Einschränkungen sich aus dem dokumentierten Funktionsumfang und der Betriebsweise des Servers ergeben und
- welche Sicherheitsrisiken entstehen, wenn ein KI-Modell über Simplifier auf Funktionen und Daten betrieblicher Systeme zugreift.

Eine systematische Untersuchung dieser Fragen und eine praktische Erprobung wurden bislang nicht durchgeführt. Dem Unternehmen fehlt damit eine fundierte Entscheidungsgrundlage für den möglichen Einsatz von Simplifier im Zusammenhang mit NOVA.
>>>>>>> 59557d55ac11a1f9c61f9924c74c986e5832aa6e
