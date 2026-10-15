= Zusammenfassung und Ausblick <zusammenfassung>

// Seitenbudget: ca. 0,5 Seiten. Schließt die Klammer aus der Einleitung.

Anlass der Arbeit war das Ziel, das auf Langdock basierende KI-Modell NOVA über Simplifier mit betrieblichen Systemen zu verbinden. Die Literaturanalyse und das Experteninterview zeigen, dass derzeit keine für NOVA einsatzbereite MCP-Anbindung vorliegt. Die Dokumentationen von Langdock und Simplifier liefern jedoch Informationen, auf deren Grundlage eine eigene, netzwerkfähige MCP-Anbindung konzipiert werden kann. Eine solche Eigenentwicklung wurde in dieser Arbeit nicht umgesetzt; die technische Machbarkeit ist daher nicht praktisch nachgewiesen. Empfohlen wird, die Entwicklung unter Bedingungen weiterzuverfolgen und zunächst einen auf freigegebene, ausschließlich lesende Funktionen beschränkten PoC in einer Testumgebung durchzuführen.

Für die weitere Untersuchung sind zunächst ein konkretes Anwendungsszenario und ein passendes Business Object festzulegen. Danach ist ein eigener Server zu implementieren und die Erreichbarkeit, Authentifizierung, Rechtebeschränkung, Fehlerbehandlung und Antwortverarbeitung mit NOVA zu testen. Vor einem Pilotbetrieb sind außerdem IT-Sicherheit und Datenschutz einzubeziehen. Erst die Ergebnisse dieses PoC ermöglichen eine belastbare Entscheidung über einen Einsatz in der Produktivumgebung.
