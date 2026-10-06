// Imports
#import "components/transfer_paper.typ": transfer_paper

#show: transfer_paper.with(
	language: "de",
	citation_style: "../res/apa-with-accessed.csl",
  "4",
	"13920",
	"Machbarkeitsanalyse der Nutzung von Simplifier als MCP-Server zur Bereitstellung von Funktionen für das unternehmensinterne KI-Modell NOVA",
	"Wirtschaftsinformatik, I24b",
	appendix_content: include "chapters/99_appendix.typ",
)

// --- Include content here ---
#include "chapters/01_Einleitung.typ"
#include "chapters/02_Situationsanalyse.typ"
#include "chapters/03_Zielsetzung und Anforderungen.typ"
#include "chapters/04_Methodisches Vorgehen.typ"
#include "chapters/05_Entwicklung und Bewertung der Lösung.typ"
#include "chapters/06_Bewertung und Validierung der Lösung.typ"
#include "chapters/07_Zusammenfassung und Ausblick.typ"



