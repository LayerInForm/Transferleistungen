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