= Methodik und Arbeitsprogramm <methodik>

// PLZ-Phase "Methodik und Arbeitsprogramm": Methoden wählen, die geeignet sind,
// die Ziele zu erreichen, und begründen, warum (immer theoriebezogen).

Die Auftragsklärung sieht drei Methoden vor: eine Literaturanalyse als Sekundärforschung, ein Experteninterview als Primärforschung und einen @poc als experimentelle Untersuchung an einem modellhaften Untersuchungsobjekt @ahrens2012gliederung. In dieser Arbeit werden die Literaturanalyse und das dokumentierte Interview ausgewertet. Ein praktischer @poc mit einer eigenen Anbindung an NOVA und Simplifier wird nicht durchgeführt; stattdessen werden die technischen Voraussetzungen und Prüfkriterien dafür abgeleitet. Die Ergebnisse werden anhand der Erfüllungskriterien aus @tab:teilziele bewertet.

== Literaturanalyse

Die Literaturanalyse dient der Erarbeitung der theoretischen und technischen Grundlagen. Betrachtet werden die Architektur und Funktionsweise des @mcp, die Nutzung externer Werkzeuge durch Sprachmodelle sowie bekannte Sicherheitsrisiken von MCP-Servern. Ergänzend werden die Integrationsdokumentation von Langdock und die technischen Informationen von Simplifier ausgewertet. Die Analyse liefert damit Beiträge zu den technischen Voraussetzungen (TZ1), zu Einschränkungen (TZ3) und zu den Sicherheitsaspekten (TZ4).

Systematische Literaturübersichten zielen darauf ab, vorhandene Forschung vollständig und nachvollziehbar zu identifizieren und zu bewerten @kitchenham2009systematic. Eine solche Übersicht wäre im Rahmen einer Transferleistung nicht leistbar und ist für die Fragestellung auch nicht erforderlich. Die Literatur wird daher gezielt zur Fundierung der technischen Untersuchung herangezogen.

== Experteninterview

Die betrieblichen Anforderungen und Rahmenbedingungen für die Verbindung von Simplifier mit NOVA lassen sich nicht aus der Literatur ableiten. Sie werden daher über ein leitfadengestütztes Experteninterview erhoben. Experteninterviews eignen sich, um das Wissen von Personen zu erschließen, die aufgrund ihrer Funktion über besondere Kenntnisse zu einem Untersuchungsgegenstand verfügen @glaser2010experteninterviews @liebold2009experteninterview. Der Leitfaden stellt sicher, dass die für die Zielsetzung relevanten Themen angesprochen werden, lässt aber Raum für Ergänzungen des Experten @helfferich2011qualitat.

Das Interview wird anonymisiert und in geglätteter Form im Anhang dokumentiert. Die Auswertung erfolgt in Anlehnung an die qualitative Inhaltsanalyse, indem relevante Aussagen regelgeleitet Kategorien zugeordnet und zu Anforderungen verdichtet werden @mayring2015qualitative @kuckartz2012qualitative. Die Kategorien werden aus den Teilzielen abgeleitet. Da das Interview NOVA und Simplifier nicht ausdrücklich behandelt, lassen sich daraus allgemeine Anforderungen, aber keine bestätigten unternehmensspezifischen technischen Rahmenbedingungen ableiten. Das Interview trägt damit vor allem zu TZ1 und TZ4 bei.

== Proof of Concept

Ein @poc prüft die grundsätzliche Umsetzbarkeit einer technischen Idee unter bewusst begrenzten Bedingungen @elliott2021proof. Er eignet sich für die vorliegende Fragestellung, weil Machbarkeit sich letztlich nur durch eine praktische Erprobung belegen lässt, eine vollständige Implementierung zum jetzigen Zeitpunkt aber weder sinnvoll noch im Rahmen der Arbeit leistbar ist.

Ein @poc wäre erforderlich, um die technische Umsetzbarkeit unter begrenzten Bedingungen praktisch zu prüfen. Für eine solche Erprobung werden ein abgegrenztes Anwendungsszenario, ein eigener netzwerkfähiger MCP-Server, eine erreichbare Simplifier-Testumgebung und ein für MCP-Integrationen konfiguriertes NOVA benötigt. Diese Voraussetzungen liegen der Arbeit nicht als umgesetzte Testumgebung vor. Daher werden die Prüfschritte in @synthese definiert, aber nicht als durchgeführte Tests ausgewiesen. TZ2 kann auf dieser Grundlage nicht als praktisch nachgewiesen gelten.

== Bewertungsmethode

Die Bewertung schließt an die Zielsetzung an, indem die Teilziele als Bewertungskriterien dienen @ahrens2012gliederung. Für jedes Teilziel wird anhand des Erfüllungskriteriums aus @tab:teilziele ein Erfüllungsgrad bestimmt. Verwendet wird eine dreistufige Skala (erfüllt, teilweise erfüllt, nicht erfüllt), da die Kriterien überwiegend qualitativ sind und eine feinere Abstufung eine Genauigkeit vortäuschen würde, die die Datenbasis nicht hergibt. Die Machbarkeit gilt als gegeben, wenn alle Muss-Ziele erfüllt sind.

== Arbeitsprogramm

Das Arbeitsprogramm umfasst sechs aufeinander aufbauende Schritte: Literaturanalyse (Kapitel 5.1), Interviewauswertung (5.2), Konzeption der MCP-Anbindung (5.3), dokumentarische Machbarkeitsprüfung (5.4–5.5), Sicherheitsanalyse (5.6) und Bewertung mit Handlungsempfehlung (Kapitel 6). Literatur und Interview liefern Grundlagen und Anforderungen für die Zielarchitektur und die Prüfkriterien eines späteren @poc.
