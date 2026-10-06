= Anonymisiertes Experteninterview

#show heading.where(level: 3): set heading(numbering: none)

#table(
	columns: (30%, 70%),
	inset: (x: 0pt, y: 4pt),
	stroke: none,
	[*Interviewpartner*], [Fachbereich],
	[*Unternehmen und Datum*], [Getriebebau NORD GmbH & Co. KG, 13.09.2026],
    [*Dauer*], [ca. 45 Minuten],
    [*Format*], [Online-Meeting via Microsoft Teams],
	[*Thema*], [Einsatz eines MCP-basierten LLM-Agenten in einem betrieblichen IT-Prozess],
)

#block(
	width: 100%,
	inset: (x: 10pt, y: 8pt),
	fill: luma(245),
	radius: 2pt,
)[
	*Hinweis:* Das Interview wurde anonymisiert und sprachlich geglättet. 
]

== Interview

=== 1. Warum soll ein LLM-Agent eingesetzt werden?

*Experte E1:* Im Unternehmen besteht der Bedarf, einen bestehenden IT-gestützten
Arbeitsprozess besser zu unterstützen. Derzeit müssen Informationen aus unterschiedlichen
Zusammenhängen manuell aufgenommen, bewertet und in weitere Arbeitsschritte überführt
werden. Das verursacht zusätzlichen Aufwand, insbesondere bei wiederkehrenden Tätigkeiten.
Ein LLM-Agent könnte hierbei unterstützen, wenn er nicht nur Texte erzeugt, sondern auch
kontrolliert auf relevante Informationen und Funktionen zugreifen kann.

=== 2. Welche Rolle könnte das Model Context Protocol bei einer solchen Lösung spielen?

*Experte E1:* Das Model Context Protocol könnte dazu dienen, ein Large Language Model mit
ausgewählten Werkzeugen und Datenquellen zu verbinden. Der Agent könnte dadurch
Informationen abrufen, geeignete nächste Schritte ableiten und innerhalb festgelegter Grenzen
Aktionen ausführen oder Handlungsvorschläge erstellen. Wichtig ist, dass die verfügbaren
Werkzeuge, die verarbeiteten Informationen und die ausgeführten Aktionen nachvollziehbar und
kontrollierbar bleiben.

=== 3. Was soll der erste Prototyp können?

*Experte E1:* Die Umsetzung sollte zunächst auf einen klar abgegrenzten Anwendungsfall
beschränkt werden. Ein begrenzter Prototyp müsste zeigen, welche Aufgabe der Agent
übernimmt, welche Informationen er benötigt und wie die Verbindung zu den bereitgestellten
Werkzeugen funktioniert. Dabei geht es nicht um eine vollständige produktive Anwendung,
sondern um einen Proof of Concept. Kritische Aktionen sollten außerdem nicht ohne
menschliche Kontrolle ausgeführt werden.

=== 4. Wie sollte die Untersuchung eines solchen Prototyps Ihrer Einschätzung nach ablaufen?

*Experte E1:* Zunächst sollten die wissenschaftlichen und technischen Grundlagen aufgearbeitet
und der konkrete betriebliche Anwendungsfall eingegrenzt werden. Anschließend kann eine
Lösungsarchitektur entwickelt und ein Prototyp umgesetzt werden. Dieser sollte anhand
definierter Anwendungsfälle und Anforderungen geprüft werden. Dabei wäre zu betrachten, ob
der Agent die vorgesehenen Informationen verarbeitet, geeignete Werkzeuge nutzt und
erwartbare Ergebnisse oder Handlungsvorschläge erzeugt.

=== 5. Welche Erkenntnisse und welchen Nutzen soll die Untersuchung für das Unternehmen liefern?

*Experte E1:* Die Untersuchung soll eine fundierte Entscheidungsgrundlage schaffen. Sie soll
zeigen, ob ein MCP-basierter LLM-Agent technisch umsetzbar und für den betrachteten
Arbeitsprozess grundsätzlich sinnvoll ist. Außerdem sollen mögliche Grenzen und
Anforderungen für eine spätere Weiterentwicklung erkennbar werden. Der Prototyp könnte damit
als Ausgangspunkt für eine zukünftige produktive Lösung dienen.