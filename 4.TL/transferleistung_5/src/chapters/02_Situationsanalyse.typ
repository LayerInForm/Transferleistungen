= Situationsanalyse

== Betriebliche Ausgangssituation

Im betrachteten betrieblichen Umfeld besteht der Bedarf, einen bestehenden IT-gestützten Arbeitsprozess durch den Einsatz eines Large Language Model-basierten Agenten zu unterstützen. Derzeit müssen Informationen aus unterschiedlichen Zusammenhängen manuell aufgenommen, bewertet und anschließend in weitere Arbeitsschritte überführt werden. Dadurch entsteht zusätzlicher Arbeitsaufwand, insbesondere bei wiederkehrenden Tätigkeiten.

Large Language Models können Informationen verarbeiten und sprachliche Ausgaben erzeugen. Ihr betrieblicher Nutzen bleibt jedoch begrenzt, wenn sie ausschließlich innerhalb eines Dialogs eingesetzt werden. Für eine weitergehende Unterstützung müssen sie kontrolliert auf relevante Datenquellen und Funktionen zugreifen können. Agentische Systeme erweitern den Einsatzbereich von Sprachmodellen, indem sie auf Grundlage einer Aufgabenstellung geeignete Handlungsschritte ableiten und externe Werkzeuge verwenden können @yao2022react; @wang2024survey; @luo2025large.

Im Rahmen der Transferleistung soll deshalb untersucht werden, wie ein Large Language Model mit ausgewählten Werkzeugen und Datenquellen verbunden werden kann. Ein besonderer Schwerpunkt liegt dabei auf dem Model Context Protocol. Dieses stellt einen technischen Ansatz zur standardisierten Anbindung von Sprachmodellen an externe Funktionen und Informationsquellen dar @hou2025model.

== Bestehende Problemstellung

Die zentrale Herausforderung besteht darin, dass ein Sprachmodell ohne technische Anbindung nur auf die Informationen zurückgreifen kann, die ihm im jeweiligen Dialog bereitgestellt werden. Informationen aus betrieblichen Systemen oder die Ausführung bestimmter Funktionen können dadurch nicht ohne Weiteres in den Arbeitsprozess eingebunden werden.

Für den betrachteten Anwendungsfall ergibt sich daraus ein zusätzlicher manueller Aufwand. Mitarbeitende müssen Informationen selbst zusammentragen, bewerten und in die nächsten Arbeitsschritte überführen. Gleichzeitig ist unklar, in welchem Umfang ein LLM-basierter Agent diese Tätigkeiten zuverlässig unterstützen kann und welche technischen Voraussetzungen dafür erfüllt sein müssen.

Neben der grundsätzlichen Verbindung mit externen Werkzeugen ist auch die Kontrolle der Agentenhandlungen von Bedeutung. Es muss nachvollziehbar bleiben, welche Informationen verarbeitet werden, welche Werkzeuge dem Agenten zur Verfügung stehen und welche Aktionen durch ihn ausgelöst werden. Kritische Aktionen dürfen daher nicht ohne geeignete Kontrolle oder menschliche Freigabe ausgeführt werden.

Die bisherige Situation bietet somit noch keine ausreichende Grundlage für eine Entscheidung über den Einsatz eines MCP-basierten LLM-Agenten. Es fehlt insbesondere eine prototypische Untersuchung, anhand derer die technische Umsetzbarkeit, die Kontrollierbarkeit und der mögliche betriebliche Nutzen bewertet werden können. Die Transferleistung setzt an dieser Stelle an und untersucht den Lösungsansatz zunächst in Form eines begrenzten Proof of Concept.