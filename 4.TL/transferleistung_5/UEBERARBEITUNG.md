# Überarbeitung nach dem Problemlösungszyklus (Ahrens 2012)

Grundlage: Auftragsklärung „Machbarkeitsanalyse der Nutzung von Simplifier als MCP-Server … NOVA“
und Ahrens, V. (2012): Gliederung wissenschaftlicher Abschlussarbeiten (liegt als 726448931.pdf im Ordner).

## Neue Gliederung

| PLZ-Phase (Ahrens)            | Kapitel                              | Datei                                   |
|-------------------------------|--------------------------------------|-----------------------------------------|
| Anlass                        | 1 Einleitung                         | 01_Einleitung.typ                       |
| Situationsanalyse             | 2 Situationsanalyse                  | 02_Situationsanalyse.typ                |
| Zielsetzung                   | 3 Zielsetzung                        | 03_Zielsetzung.typ                      |
| Methodik und Arbeitsprogramm  | 4 Methodik und Arbeitsprogramm       | 04_Methodik und Arbeitsprogramm.typ     |
| Synthese und Analyse          | 5 Untersuchung der Machbarkeit       | 05_Synthese und Analyse.typ             |
| Bewertung                     | 6 Bewertung                          | 06_Bewertung.typ                        |
| Zusammenfassung (+ Ausblick)  | 7 Zusammenfassung und Ausblick       | 07_Zusammenfassung und Ausblick.typ     |

## Was geändert wurde

- Kapitel 2–4 waren allgemein auf einen „MCP-basierten LLM-Agenten“ ausgerichtet. Sie beziehen sich jetzt durchgehend auf Simplifier und NOVA, wie in der Auftragsklärung festgelegt.
- Die Einleitung enthält nur noch den Anlass, also keine vorweggenommene Situationsanalyse und keine ausführliche Methodik mehr (Ahrens 3.2.1).
- Die Situationsanalyse endet mit einem klar formulierten Defizit (Ahrens 3.2.2).
- Die Zielsetzung ist aus dem Defizit abgeleitet und enthält Teilziele mit Erfüllungskriterien und Prioritäten sowie einen aufgelösten Zielkonflikt (Ahrens 3.2.3). Die Teilziele dienen in Kapitel 6 als Bewertungskriterien.
- Die Methodik ist auf die drei Methoden der Auftragsklärung reduziert (Literaturanalyse, Experteninterview, PoC). Hinzugekommen sind die Bewertungsmethode und ein Arbeitsprogramm. „Fallstudienbezug“ und „Design Science“ wurden entfernt, weil sie nicht in der Auftragsklärung stehen.
- Die MCP-Theorie steht in 5.1 als Ergebnis der Literaturanalyse. Bei einer praxisorientierten Arbeit gehört sie laut Ahrens nicht vor die Situationsanalyse.
- Als neue Quelle wurde die Simplifier-MCP-Dokumentation aufgenommen (`simplifier2026mcp`). Sie liefert die technischen Fakten zu Transport, Token und Funktionsumfang.
- Abkürzungsverzeichnis: Der Template-Rest INVEST wurde entfernt. Neu sind API, LLM, MCP und PoC.
- Template: Die Anhang-Überschrift ist jetzt unnummeriert, dadurch heißt das Interview „A“ statt „B“. Querverweise lauten „Kapitel“ statt „Abschnitt“.

## Offene Punkte (im PDF rot markiert)

1. **Interview passt nicht zur Auftragsklärung.** Simplifier und NOVA kommen im Interview nicht vor, die Auftragsklärung verlangt aber genau dazu Anforderungen. Die Antworten wurden **nicht** verändert. Entweder ein kurzes Nachgespräch führen und ergänzen, oder klären, ob es bereits passende Aussagen gibt. Leitfadenvorschlag für das Nachgespräch:
   - Für welche Anfragen soll NOVA über Simplifier Funktionen nutzen können?
   - Auf welche Systeme bzw. Business Objects darf NOVA zugreifen, und auf welche ausdrücklich nicht?
   - In welcher Umgebung soll der MCP-Server laufen (DEV/PROD, On-Prem/Cloud)?
   - Wie soll die Authentifizierung gelöst werden (technischer Benutzer, Token-Verwaltung)?
   - Welche Datenschutz- und Sicherheitsanforderungen gelten?
   - Ab wann wäre die Integration für Sie „machbar“?
2. Firmenspezifische Angaben zu NOVA und Simplifier (Kap. 2.1, 2.2)
3. Anwendungsszenario und Architekturabbildung (5.3)
4. Umsetzung und Testergebnisse (5.4, 5.5), die erst nach dem PoC möglich sind
5. Bewertung, Empfehlung, Zusammenfassung und Ausblick (6, 7)

## Sonstiges

- `Auftragsklärung .docx` ist eine leere Datei (0 Byte).
- `Auftragsklärung Transferleistung (2).pdf` gehört zu einem anderen Thema (Ausbildungsmanagementsystem).
- Das Repo ist öffentlich und enthält die Matrikelnummer sowie urheberrechtlich geschützte PDFs. Es sollte auf „private“ gestellt werden.
