= Einleitung

// PLZ-Phase "Anlass" (Ahrens 2012): Grund und Motivation der Arbeit nennen,
// ohne Situation, Ziele oder Vorgehen bereits ausführlich vorwegzunehmen.

Sprachmodelle entwickeln sich zunehmend von reinen Textgeneratoren zu Systemen, die Aufgaben analysieren, Handlungsschritte ableiten und dafür externe Werkzeuge nutzen können @yao2022react @wang2024survey. Ihr betrieblicher Nutzen hängt damit wesentlich davon ab, ob sie kontrolliert auf die Funktionen und Daten bestehender Systeme zugreifen können. Mit dem Model Context Protocol (@mcp) hat sich für diesen Zugriff ein offener Standard etabliert, der die Anbindung von KI-Anwendungen an externe Werkzeuge und Datenquellen vereinheitlichen soll @hou2025model.

Vor diesem Hintergrund verfolgt das Unternehmen das Ziel, KI-gestützte Funktionen künftig stärker in seine bestehende Systemlandschaft zu integrieren. Im Mittelpunkt steht das unternehmensinterne KI-Modell NOVA. Damit NOVA über die Beantwortung von Anfragen hinaus Informationen aus betrieblichen Systemen abrufen und Funktionen nutzen kann, benötigt es eine geeignete technische Schnittstelle. Als Kandidat dafür kommt die im Unternehmen eingesetzte Low-Code-Plattform Simplifier in Betracht, für die der Hersteller einen eigenen MCP-Server bereitstellt @simplifier2026mcp.

Simplifier wird bislang jedoch nicht für diesen Zweck eingesetzt. Ob sich die Plattform als MCP-Server für NOVA eignet, ist daher offen. Ohne eine fundierte Prüfung besteht das Risiko, dass das Unternehmen Ressourcen in eine technisch ungeeignete oder nur eingeschränkt realisierbare Lösung investiert. Die vorliegende Transferleistung nimmt diesen Anlass auf und untersucht die Machbarkeit einer solchen Integration.

Der Aufbau der Arbeit folgt dem Problemlösungszyklus nach Ahrens @ahrens2012gliederung. Zunächst wird in @situationsanalyse die betriebliche und technische Ausgangssituation analysiert und das bestehende Defizit herausgearbeitet. Daraus wird in @zielsetzung die Zielsetzung abgeleitet. @methodik beschreibt die gewählten Methoden und das Arbeitsprogramm. In @synthese werden die Methoden angewendet und die Integration im Rahmen eines Proof of Concept (@poc) praktisch erprobt. @bewertung bewertet die Ergebnisse anhand der zuvor festgelegten Ziele und leitet eine Empfehlung ab. Die Arbeit schließt in @zusammenfassung mit einer Zusammenfassung und einem Ausblick.
