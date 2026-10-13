= Situationsanalyse <situationsanalyse>

// Seitenbudget: ca. 1,5 Seiten. PLZ-Phase "Situationsanalyse" (praxisorientiert),
// endet mit dem Defizit.

== Betriebliche Ausgangssituation

Im Unternehmen wird das interne KI-Modell NOVA betrieben, das auf der Plattform Langdock basiert. NOVA kann derzeit nur auf Informationen zurückgreifen, die ihm innerhalb einer Anfrage bereitgestellt werden. Künftig soll es Mitarbeitende bei standardisierten internen Anliegen unterstützen, indem es auf Basis betrieblicher Informationen ein passendes Standardvorgehen vorschlägt. Nach Vorgabe des Auftraggebers soll NOVA dabei ausschließlich assistieren, also Vorschläge unterbreiten, aber keine Aktionen in betrieblichen Systemen selbstständig ausführen.

Für die Anbindung betrieblicher Systeme nutzt das Unternehmen die Low-Code-Plattform Simplifier. Sie ist insbesondere an SAP angebunden und wird für Workflows und weitere Anwendungen rund um diese Systeme eingesetzt. Simplifier stellt Funktionen als Business Objects bereit, die serverseitig ausgeführte JavaScript-Funktionen enthalten; externe Systeme werden über Connectors angebunden, etwa über REST, SOAP, SQL oder SAP RFC @simplifier2026mcp. Damit bündelt Simplifier bereits einen Großteil der Systemzugriffe, die für NOVA relevant wären.

== Technische Ausgangssituation

*Anbindungsmöglichkeiten in Langdock.* Langdock sieht drei Wege vor, externe Systeme anzubinden. Native Integrationen werden vom Anbieter bereitgestellt und übernehmen Authentifizierung und Schnittstellenkommunikation @langdock2026verzeichnis. MCP-Integrationen verbinden Langdock als MCP-Host mit externen MCP-Servern; unterstützt werden dabei ausschließlich die netzwerkbasierten Transportwege Streamable HTTP und Server-Sent Events @langdock2026mcp. Benutzerdefinierte Integrationen schließlich erlauben es, beliebige Systeme mit einer Programmierschnittstelle selbst anzubinden, indem in JavaScript formulierte Aktionen angelegt werden, die Agenten aufrufen können @langdock2026integrationen. Weder das Verzeichnis der nativen Integrationen noch das Verzeichnis der von Langdock geprüften MCP-Server enthält einen Eintrag für Simplifier @langdock2026verzeichnis @langdock2026mcpverzeichnis. Eine fertige Anbindung steht damit nicht zur Verfügung.

*Verfügbare Simplifier-Informationen.* Die Dokumentation und das öffentliche MCP-Projekt von Simplifier beschreiben, wie Business Objects und weitere Simplifier-Funktionen angesprochen werden können @simplifier2026mcp. Daraus ergibt sich jedoch keine für das Unternehmen unmittelbar einsatzbereite Anbindung an NOVA. Der dokumentierte Server wird als lokaler Prozess gestartet und kommuniziert über die Standard-Ein- und -Ausgabe; Langdock unterstützt für MCP-Integrationen dagegen netzwerkbasierte Transportwege @langdock2026mcp. Zudem ist der dokumentierte Funktionsumfang nicht auf die für NOVA freizugebenden Funktionen beschränkt. Die Informationen von Langdock und Simplifier können als technische Grundlage dienen, um einen eigenen, netzwerkfähigen MCP-Server mit gezielt ausgewählten Funktionen zu entwickeln. Ob eine solche Eigenentwicklung in der Unternehmensumgebung funktioniert, ist praktisch noch nachzuweisen.

== Defizit

Eine technische Informationsgrundlage ist damit vorhanden, eine einsatzbereite Anbindung jedoch nicht. Offen ist, welche Voraussetzungen erfüllt sein müssen, ob und auf welchem Weg ein selbst entwickelter MCP-Server NOVA mit Simplifier verbinden kann, welche Einschränkungen bestehen und welche Sicherheitsrisiken beim Zugriff auf betriebliche Systeme entstehen. Eine praktische Erprobung in der Zielumgebung fehlt. Dem Unternehmen fehlt somit eine fundierte Entscheidungsgrundlage zur Umsetzung und zum späteren Betrieb.
