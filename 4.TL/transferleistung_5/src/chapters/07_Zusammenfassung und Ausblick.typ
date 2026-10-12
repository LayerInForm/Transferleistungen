<<<<<<< HEAD
= Zusammenfassung und Ausblick <zusammenfassung>

// Seitenbudget: ca. 0,5 Seiten. Schließt die Klammer aus der Einleitung.

Anlass der Arbeit war das Ziel, das auf Langdock basierende KI-Modell NOVA über Simplifier mit betrieblichen Systemen zu verbinden. Mithilfe von Literaturanalyse, Experteninterview und @poc wurde gezeigt, dass der Simplifier-MCP-Server Business-Object-Funktionen zwar über das @mcp bereitstellt, sich aber nicht direkt an Langdock anbinden lässt. Er läuft nur lokal und bietet stets alle Tools einschließlich schreibender und löschender an. Eine fertige Anbindung existiert nicht. Ein eigener, auf lesende Funktionen beschränkter Adapter funktionierte dagegen im @poc. Empfohlen wird daher eine selbst erstellte Anbindung, kurzfristig als benutzerdefinierte Integration in Langdock, langfristig gegebenenfalls als eigener MCP-Server.

Offen bleiben der Nachweis im realen Zusammenspiel von Langdock und Simplifier, der Umgang mit echten SAP-Daten sowie eine vollständige Sicherheits- und Datenschutzprüfung. Auf längere Sicht ist auch denkbar, NOVA unter menschlicher Freigabe schreibende Vorgänge vorbereiten zu lassen, etwa das Anstoßen eines Workflows. Bietet der Hersteller künftig einen netzwerkfähigen MCP-Server mit einschränkbarem Funktionsumfang an, wäre die Bewertung neu vorzunehmen.
=======
= Zusammenfassung und Ausblick <zusammenfassung>

// PLZ-Phasen "Zusammenfassung" und "Ausblick": die äußere Klammer aus der
// Einleitung schließen; der Ausblick öffnet bewusst eine neue Klammer.

== Zusammenfassung

Anlass der Transferleistung war das Bestreben des Unternehmens, das interne KI-Modell NOVA über Simplifier mit Funktionen betrieblicher Systeme zu verbinden. Die Situationsanalyse hat gezeigt, dass Simplifier mit seinem MCP-Server zwar eine technische Grundlage bietet, deren Eignung für diesen Zweck aber ungeklärt war. Ziel der Arbeit war daher, die Machbarkeit zu untersuchen und eine Empfehlung abzuleiten. Dazu wurden eine Literaturanalyse, ein Experteninterview und ein @poc kombiniert.

#text(fill: red)[*TODO:* Die zentralen Ergebnisse in wenigen Sätzen zusammenfassen: Ergebnis des PoC, wichtigste Voraussetzungen und Einschränkungen, Sicherheitsbewertung, Empfehlung. Keine neuen Inhalte einführen.]

== Ausblick

#text(fill: red)[*TODO:* Offene Fragen benennen, die nicht Gegenstand der Arbeit waren, z. B. schreibende Zugriffe mit Freigabeprozess, Betrieb außerhalb der Entwicklungsinstanz, Ausweitung auf weitere Anwendungsfälle, vollständige Sicherheits- und Datenschutzprüfung.]
>>>>>>> 59557d55ac11a1f9c61f9924c74c986e5832aa6e
