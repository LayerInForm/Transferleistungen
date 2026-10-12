= Methodik und Arbeitsprogramm <methodik>

// PLZ-Phase "Methodik und Arbeitsprogramm": Methoden wählen, die geeignet sind,
// die Ziele zu erreichen, und begründen, warum (immer theoriebezogen).

Zur Erreichung der Teilziele werden, wie in der Auftragsklärung festgelegt, drei Methoden kombiniert: eine Literaturanalyse als Sekundärforschung, ein Experteninterview als Primärforschung und ein @poc als experimentelle Untersuchung an einem modellhaften Untersuchungsobjekt @ahrens2012gliederung. Die Ergebnisse werden anschließend anhand der Erfüllungskriterien aus @tab:teilziele bewertet.

== Literaturanalyse

Die Literaturanalyse dient der Erarbeitung der theoretischen und technischen Grundlagen. Betrachtet werden die Architektur und Funktionsweise des @mcp, die Nutzung externer Werkzeuge durch Sprachmodelle sowie bekannte Sicherheitsrisiken von MCP-Servern. Ergänzend wird die Herstellerdokumentation des Simplifier-MCP-Servers ausgewertet. Die Analyse liefert damit Beiträge zu den technischen Voraussetzungen (TZ1), zu Einschränkungen (TZ3) und zu den Sicherheitsaspekten (TZ4).

Systematische Literaturübersichten zielen darauf ab, vorhandene Forschung vollständig und nachvollziehbar zu identifizieren und zu bewerten @kitchenham2009systematic. Eine solche Übersicht wäre im Rahmen einer Transferleistung nicht leistbar und ist für die Fragestellung auch nicht erforderlich. Die Literatur wird daher gezielt zur Fundierung der technischen Untersuchung herangezogen.

== Experteninterview

Die betrieblichen Anforderungen und Rahmenbedingungen für die Verbindung von Simplifier mit NOVA lassen sich nicht aus der Literatur ableiten. Sie werden daher über ein leitfadengestütztes Experteninterview erhoben. Experteninterviews eignen sich, um das Wissen von Personen zu erschließen, die aufgrund ihrer Funktion über besondere Kenntnisse zu einem Untersuchungsgegenstand verfügen @glaser2010experteninterviews @liebold2009experteninterview. Der Leitfaden stellt sicher, dass die für die Zielsetzung relevanten Themen angesprochen werden, lässt aber Raum für Ergänzungen des Experten @helfferich2011qualitat.

Das Interview wird anonymisiert und in geglätteter Form im Anhang dokumentiert. Die Auswertung erfolgt in Anlehnung an die qualitative Inhaltsanalyse, indem relevante Aussagen regelgeleitet Kategorien zugeordnet und zu Anforderungen verdichtet werden @mayring2015qualitative @kuckartz2012qualitative. Die Kategorien werden aus den Teilzielen abgeleitet. Das Interview trägt damit vor allem zu TZ1 und TZ4 bei und liefert die Anforderungen, an denen sich die Konzeption des @poc orientiert.

== Proof of Concept

Ein @poc prüft die grundsätzliche Umsetzbarkeit einer technischen Idee unter bewusst begrenzten Bedingungen @elliott2021proof. Er eignet sich für die vorliegende Fragestellung, weil Machbarkeit sich letztlich nur durch eine praktische Erprobung belegen lässt, eine vollständige Implementierung zum jetzigen Zeitpunkt aber weder sinnvoll noch im Rahmen der Arbeit leistbar ist.

Im @poc wird der Simplifier-MCP-Server in einer Testumgebung an NOVA angebunden. Anhand eines ausgewählten Anwendungsszenarios wird geprüft, ob NOVA die bereitgestellten Funktionen erkennt, aufruft und die Ergebnisse verarbeitet. Die Prüfung erfolgt über vorab definierte Testfälle (@tab:testfaelle in @synthese). Der @poc liefert damit den Nachweis für TZ2 und zugleich praktische Erkenntnisse zu TZ1, TZ3 und TZ4.

== Bewertungsmethode

Die Bewertung schließt an die Zielsetzung an, indem die Teilziele als Bewertungskriterien dienen @ahrens2012gliederung. Für jedes Teilziel wird anhand des Erfüllungskriteriums aus @tab:teilziele ein Erfüllungsgrad bestimmt. Verwendet wird eine dreistufige Skala (erfüllt, teilweise erfüllt, nicht erfüllt), da die Kriterien überwiegend qualitativ sind und eine feinere Abstufung eine Genauigkeit vortäuschen würde, die die Datenbasis nicht hergibt. Die Machbarkeit gilt als gegeben, wenn alle Muss-Ziele erfüllt sind.

== Arbeitsprogramm

Aus den gewählten Methoden ergibt sich das in @tab:arbeitsprogramm dargestellte Arbeitsprogramm. Die Schritte bauen aufeinander auf: Literatur und Interview liefern die Grundlagen und Anforderungen, auf denen die Konzeption und Umsetzung des @poc beruhen.

#figure(
  table(
    columns: (auto, 1fr, auto, auto),
    align: (center, left, left, center),
    inset: 6pt,
    table.header([*Schritt*], [*Inhalt*], [*Beitrag zu*], [*Kapitel*]),
    [1], [Literaturanalyse zu MCP, Werkzeugnutzung und Sicherheitsrisiken], [TZ1, TZ3, TZ4], [5.1],
    [2], [Durchführung und Auswertung des Experteninterviews], [TZ1, TZ4], [5.2],
    [3], [Konzeption des @poc und Festlegung der Testfälle], [TZ1, TZ2], [5.3],
    [4], [Umsetzung des @poc und Durchführung der Testfälle], [TZ2, TZ3], [5.4, 5.5],
    [5], [Analyse der Sicherheitsaspekte], [TZ4], [5.6],
    [6], [Bewertung der Zielerreichung und Ableitung der Empfehlung], [TZ5], [6],
  ),
  caption: [Arbeitsprogramm],
) <tab:arbeitsprogramm>
