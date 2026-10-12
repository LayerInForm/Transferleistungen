= Methodik und Arbeitsprogramm <methodik>

// Seitenbudget: ca. 2,75 Seiten. Methoden laut Auftragsklärung, jeweils begründet,
// mit Durchführung, Auswertung und Grenzen.

== Methodischer Rahmen

Bei der vorliegenden Arbeit handelt es sich um eine praxisorientierte Aufgabe: Ein neues betriebliches Problem wird mit bekannten wissenschaftlichen Methoden bearbeitet @ahrens2012gliederung. Gemäß Auftragsklärung werden dazu drei Methoden kombiniert, die unterschiedlichen Forschungsansätzen zuzuordnen sind. Die Literaturanalyse ist Sekundärforschung und nutzt vorhandene Informationsquellen. Das Experteninterview ist Primärforschung und erhebt Originaldaten im Feld. Der @poc ist eine experimentelle Untersuchung, die anstelle des realen Untersuchungsobjekts ein modellhaftes verwendet @ahrens2012gliederung.

Die Kombination ergibt sich aus der Zielsetzung. Keine der Methoden kann die Teilziele allein abdecken: Die Literatur liefert das technische Grundverständnis und bekannte Risiken, aber keine betrieblichen Anforderungen. Das Interview liefert diese Anforderungen, aber keinen Nachweis der technischen Umsetzbarkeit. Der @poc erbringt diesen Nachweis, benötigt aber die Grundlagen und Anforderungen aus den beiden anderen Methoden. Indem sich die Methoden gegenseitig ergänzen, wird die Fragestellung aus theoretischer, betrieblicher und technischer Perspektive betrachtet.

== Literaturanalyse

Die Literaturanalyse dient der Erarbeitung der theoretischen und technischen Grundlagen. Sie umfasst drei Arten von Quellen. Wissenschaftliche Literatur erschließt die Architektur und Funktionsweise des @mcp, die Nutzung externer Werkzeuge durch Sprachmodelle sowie bekannte Sicherheitsrisiken von MCP-Servern. Die Herstellerdokumentationen beschreiben den Funktionsumfang und die Konfiguration des Simplifier-MCP-Servers sowie die Anbindungsmöglichkeiten der Plattform Langdock, auf der NOVA basiert. Der öffentlich verfügbare Quellcode des Servers schließlich ermöglicht es, Aussagen der Dokumentation zu überprüfen und Eigenschaften zu ermitteln, die dort nicht beschrieben sind, etwa unterstützte Transportwege und Konfigurationsmöglichkeiten.

Bei der Auswahl wissenschaftlicher Quellen wurden Arbeiten bevorzugt, die den Stand der Forschung zusammenfassen, da das @mcp ein junges und sich schnell entwickelndes Themenfeld ist. Maßgeblich waren dabei der inhaltliche Bezug zur Fragestellung, die Aktualität und die Veröffentlichung in begutachteten Zeitschriften oder als vielzitierte Vorabveröffentlichung. Systematische Literaturübersichten zielen darauf ab, vorhandene Forschung vollständig und nachvollziehbar zu erfassen und zu bewerten @kitchenham2009systematic. Ein solches Vorgehen wäre im Rahmen einer Transferleistung nicht leistbar und ist für eine Machbarkeitsanalyse auch nicht erforderlich. Die Literatur wird daher gezielt zur Fundierung der technischen Untersuchung herangezogen. Die Literaturanalyse trägt zu TZ1, TZ3 und TZ4 bei.

== Experteninterview

Die betrieblichen Anforderungen an die Verbindung von Simplifier und NOVA lassen sich nicht aus der Literatur ableiten, da sie vom konkreten Unternehmen und dessen Zielen abhängen. Sie werden daher über ein Experteninterview erhoben. Experteninterviews eignen sich, um das Wissen von Personen zu erschließen, die aufgrund ihrer Funktion über besondere Kenntnisse zu einem Untersuchungsgegenstand verfügen @glaser2010experteninterviews @liebold2009experteninterview.

*Auswahl und Durchführung.* Als Experten wurden zwei Vertreter des Auftraggebers ausgewählt, da sie das Vorhaben initiiert haben und sowohl die betrieblichen Ziele als auch die Rahmenbedingungen kennen. Das Interview wurde als Online-Meeting mit einer Dauer von etwa 45 Minuten geführt. Es folgte einem Leitfaden mit fünf offenen Fragen zu Anlass, Rolle des @mcp, Anforderungen an einen ersten Prototyp, Vorgehen bei der Untersuchung und erwartetem Nutzen. Ein Leitfaden stellt sicher, dass die für die Zielsetzung relevanten Themen angesprochen werden, lässt den Befragten aber Raum für eigene Schwerpunkte @helfferich2011qualitat.

*Dokumentation und Auswertung.* Das Interview wurde anonymisiert und sprachlich geglättet dokumentiert (Anhang A). Die Auswertung erfolgt in Anlehnung an die qualitative Inhaltsanalyse, bei der sprachliches Material regelgeleitet Kategorien zugeordnet und auf seine wesentlichen Aussagen reduziert wird @mayring2015qualitative @kuckartz2012qualitative. Die Kategorien werden deduktiv aus den Teilzielen abgeleitet, insbesondere Voraussetzungen, Kontrolle und Sicherheit sowie Umfang der Untersuchung. Aussagen, die einer Kategorie zugeordnet werden, werden zu Anforderungen verdichtet und mit der jeweiligen Interviewfrage als Quelle versehen. So bleibt nachvollziehbar, auf welcher Aussage jede Anforderung beruht. Das Interview trägt zu TZ1 und TZ4 bei und bildet die Grundlage für die Konzeption des @poc.

== Proof of Concept

Ein @poc prüft die grundsätzliche Umsetzbarkeit einer technischen Idee unter bewusst begrenzten Bedingungen @elliott2021proof. Er eignet sich für die vorliegende Fragestellung, weil sich technische Machbarkeit letztlich nur durch eine praktische Erprobung belegen lässt, eine vollständige Implementierung zum jetzigen Zeitpunkt aber verfrüht wäre und den Rahmen der Arbeit überschreiten würde.

*Testumgebung.* Der @poc wird in einer isolierten Testumgebung durchgeführt. Der Simplifier-MCP-Server wird unverändert in der aktuellen Version eingesetzt und von einem generischen MCP-Client angesprochen, der stellvertretend für den MCP-Client in NOVA arbeitet. Die Simplifier-Instanz wird durch ein Testdouble ersetzt, das die vom Server benötigten Schnittstellen mit fiktiven Testdaten nachbildet. Da Langdock MCP-Server nur über netzwerkbasierte Transportwege anbindet, wird in einer zweiten Stufe zusätzlich ein eigener MCP-Adapter erprobt, der über Streamable HTTP erreichbar ist. Dieses Vorgehen hat zwei Gründe. Zum einen werden betriebliche Systeme und Daten nicht berührt, was dem Zielkonflikt zugunsten der Sicherheit entspricht. Zum anderen lassen sich Fehlerfälle wie ein ungültiges Token gezielt herbeiführen.

*Testfälle.* Die Prüfung erfolgt anhand vorab definierter Testfälle. Sie werden aus TZ2 und den Anforderungen abgeleitet und folgen dem Ablauf einer Anfrage: Verbindungsaufbau, Abruf der verfügbaren Funktionen, Aufruf einer Funktion und Verarbeitung des Ergebnisses. Hinzu kommen das Verhalten im Fehlerfall und die Nachvollziehbarkeit der Aufrufe. Für jeden Testfall werden vorab das erwartete Ergebnis und die Einstufung als Muss- oder Soll-Testfall festgelegt. Die Durchführung wird protokolliert.

*Quellcodeanalyse.* Ergänzend wird der Quellcode des Servers auf Transportwege, Authentifizierungsverfahren, Konfigurationsmöglichkeiten und die Kennzeichnung der angebotenen Tools untersucht. Damit lassen sich Eigenschaften feststellen, die im Test nicht unmittelbar sichtbar werden. Der @poc trägt zu TZ2 sowie zu TZ1, TZ3 und TZ4 bei.

*Grenzen.* Das Testdouble bildet nur die benötigten Schnittstellen nach. Das Verhalten einer realen Simplifier-Instanz kann daher im Detail abweichen. Die Ergebnisse gelten zudem für die eingesetzte Version des Servers.

== Bewertungsmethode

Die Bewertung schließt an die Zielsetzung an, indem die Teilziele als Bewertungskriterien dienen @ahrens2012gliederung. Für jedes Teilziel wird anhand seines Erfüllungskriteriums ein Erfüllungsgrad auf einer dreistufigen Skala bestimmt (@tab:skala). Eine feinere Abstufung, etwa im Rahmen einer Nutzwertanalyse, wird bewusst nicht verwendet. Die Kriterien sind überwiegend qualitativ, sodass eine numerische Gewichtung eine Genauigkeit vortäuschen würde, die die Datenbasis nicht hergibt. Die Machbarkeit gilt als vollständig nachgewiesen, wenn alle Muss-Ziele erfüllt sind.

#figure(
  table(
    columns: (auto, 1fr),
    align: (left, left),
    inset: 5pt,
    table.header([*Stufe*], [*Bedeutung*]),
    [erfüllt], [Das Erfüllungskriterium ist vollständig erreicht.],
    [teilweise], [Das Kriterium ist in wesentlichen Teilen erreicht, einzelne Bestandteile sind offen.],
    [nicht erfüllt], [Das Kriterium ist nicht oder nur in unwesentlichen Teilen erreicht.],
  ),
  caption: [Skala zur Bewertung des Erfüllungsgrads],
) <tab:skala>

== Arbeitsprogramm

Aus den gewählten Methoden ergibt sich das Arbeitsprogramm in @tab:arbeitsprogramm. Die Schritte bauen aufeinander auf: Literatur und Interview liefern Grundlagen und Anforderungen, auf denen Konzeption und Durchführung des @poc beruhen. Die Bewertung führt schließlich alle Ergebnisse zusammen.

#figure(
  table(
    columns: (auto, 1fr, auto, auto),
    align: (center, left, left, center),
    inset: 5pt,
    table.header([*Nr.*], [*Arbeitsschritt*], [*Teilziele*], [*Kap.*]),
    [1], [Literaturanalyse], [TZ1, TZ3, TZ4], [5.1],
    [2], [Experteninterview und Auswertung], [TZ1, TZ4], [5.2],
    [3], [Konzeption des @poc und der Testfälle], [TZ1, TZ2], [5.3],
    [4], [Umsetzung und Test des @poc, Quellcodeanalyse, Anbindungsvarianten], [TZ2, TZ3], [5.4, 5.5],
    [5], [Sicherheitsanalyse], [TZ4], [5.6],
    [6], [Bewertung und Empfehlung], [TZ5], [6],
  ),
  caption: [Arbeitsprogramm],
) <tab:arbeitsprogramm>