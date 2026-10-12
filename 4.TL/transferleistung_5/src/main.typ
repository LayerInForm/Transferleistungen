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

#set heading(supplement: [Kapitel])
#show table: set par(justify: false)

// Gliederung nach dem Problemlösungszyklus (Ahrens 2012):
// Anlass -> Situationsanalyse -> Zielsetzung -> Methodik/Arbeitsprogramm
// -> Synthese und Analyse -> Bewertung -> Zusammenfassung (Ausblick)
#include "chapters/01_Einleitung.typ"
#include "chapters/02_Situationsanalyse.typ"
#include "chapters/03_Zielsetzung.typ"
#include "chapters/04_Methodik und Arbeitsprogramm.typ"
#include "chapters/05_Synthese und Analyse.typ"
#include "chapters/06_Bewertung.typ"
#include "chapters/07_Zusammenfassung und Ausblick.typ"
