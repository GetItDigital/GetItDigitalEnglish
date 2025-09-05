# Speech Texte für Videos
-------------------------

## Video Gliederung

__Modul 12__

- [ ] K1.1-3 03-09:	L. K1, Intro (Gesamtübersicht), Einführung Ausgleichsvorgänge
- [ ] K2.1-3 10-17:	L. K2, *Def.*, *Berechn.meth.* (Zeit/Bild), *DGL* (Schaltung <-> GL), Aufstell. (Zeit/Bild) + Bsp., Ordnung u. Energiespeich.
- [ ] K2.4   18-23: *Berechnung im Zeitb.*, Anfangsbed., Zerlegung y=yh+yf, Lsg. yh, Bsp. yh; Lsg. yp, Merke 5 Steps
- [ ] K3.1   24-30: L. K3, Schaltvorgänge bei Gleichspannung: Beispiel RC Laden, Zeitkonstante einführen, 5 Steps short und Detail
- [ ] K3.1   31-40: Bsp. RC Entladen, 5 Steps detail; Vgl RC Laden/Entladen, Vgl. RL (zu erwartend), RL Laden 5 steps Detail, RL Entladen 5 Steps short
- [ ] K3.2   41-46: Schaltvorgänge bei sinusförmiger Anregung, Allg., Bsp. RC an u_q(t), Konsequenzen (Überspannungen-/Ströme, Schaltzeitpunkt)
- [ ] K3.2   47-50: Bsp. RL an u_q(t)
- [ ] K3.3   51-59: Bsp. RLCs, Fallunterscheidung, 5 Steps für jeden Fall: yh -> Diskriminante, w_d, delta bei period. Fall einführen
- [ ] K3.4   60-64: Exkurse: yh period. Fall Herleitung (Überlagerung abklingender Schwingungen); Ortskurve/Systemtheorie/Regelungstechnik; Vgl. delta, w_d, w_0, Güte

## Prompts für Ollama

Zum Beispiel: 

```bash
FOLIENANFANG=13
FOLIENENDE=22

INHALT="""
(Folienzahl nach Dateiname, nicht nach Angabe in Fußzeile unten rechts.)
* F13: Lerninhalte; 
* F14: Definitionen (zum selber Nachschlagen wie in einem Glossar, etwas ausführlichere Tabelle im Skript. Genaueren Definitionen erfolgen in den jeweiligen Kapiteln, wenn die Begriffe verwendet werden).  
* F15: Berechnungsmethoden (im Zeit- oder Bildbereich möglich; im Zeitbereich allgemein lösbar, im Bildbereich oft schneller, aber nur bei verschwindenden Anfangsbedingungen. Hier im Rahmen des Moduls wird zunächst nur die Methode im Zeitbereich behandelt.)
* F16: Nur lineare Schaltungen betrachtet. Bei Vorhandensein von Energiespeichern kann es zu Schaltvorgängen kommen, da sich Ströme in Induktivitäten und Spannungen an Kapazitäten nicht instantan ändern können. 
* F17: Aufstellen von DGLs auch im Zeitbereich als auch im Bildbereich möglich. Fokus auf Aufstellung im Zeitbereich.
* F18-19: Beispiel DGL Aufstellen Zeitbereich
* F20: Beispiel DGL Aufstellen Bildbereich
* F21: Allgemein bedingen die Systemeigenschaften einer betrachteten Schaltung (bei den hier betrachteten Schaltungen immer linear und zeitinvariant) auch die Form der DGL (mathematische Repräsentation, in diesem Fall linear mit konstanten Koeffizienten.) Hier immer gewöhnliche (in-)homogene Differentialgleichungen n-ter Ordnung  mit konstanten Koeffizienten der gezeigten Form betrachtet. 
* F22: Ordnung der DGL anhand Anzahl der Energiespeicher
"""
MODEL="gemma3:27b"

# Prompt Setup
FOLIEN="'/root/.ollama/modul-12/Folien-${FOLIENANFANG}.png'"
for i in $(seq $( expr $FOLIENANFANG + 1 ) $FOLIENENDE);
do
    FOLIEN=${FOLIEN}", '/root/.ollama/modul-12/Folien-${i}.png'"
done

PROMPT="""
Du bist Gemma, ein multimodales LLM. Deine Aufgabe ist es, Skripte für Lehrvideos zu erstellen, die auf den bereitgestellten Präsentationsfolien basieren. Die Skripte sollen wie eine Vorlesung im Bachelor-Studiengang Elektrotechnik klingen.

**Anforderungen:**

*   **Zielgruppe:** Bachelor-Studierende Elektrotechnik (Grundlagenveranstaltung).
*   **Stil:** Respektvoll, professionell, motivierend und wissenschaftlich präzise. Erkläre detailliert und akkurat.
*   **Formatierung (WICHTIG für Text-to-Speech):**
    *   Zahlen, Einheiten und Werte vollständig ausschreiben (z.B. 'fünf komma zwei sieben Volt' statt '5,72 V').
    *   Mathematische Formeln in lateinische Buchstaben ausschreiben (z.B. 'R ist gleich U durch I' statt 'R=U/I').
    *   Sätze kurz und prägnant halten, um die Verständlichkeit für das TTS-Modell zu erhöhen.
*   **Prozess:**  Analysiere zunächst den gesamten Inhalt der Folien und der Inhaltsvorgabe. Erstelle danach für jede Folie einen separaten Textabschnitt.

**Material:**

*   **Präsentationsfolien:** ${FOLIEN}
*   **Zusätzliche Inhaltsvorgabe:** ${INHALT}

Beginne nun mit der Erstellung der Skripte.
"""

# Ollama call
ollama run $MODEL "$PROMPT" 1> ~/ollama/modul-12/v1.txt
```




## Notes
DGLs haben prinzipiell unendlich viele Lösungen, die Eingrenzung auf eine konkrete, distinktive Lösung zur Bestimmung des Zeitverhaltens erfolgt mittels Anfangsbedingungen. Energie kann niemals instantan fließen oder sich wandeln. Speicherung im Magnetfeld (Induktivitäten) oder im E-Feld (Kapazitäten) -> u_C bzw. i_L stetig. Wenn Zustand vor dem Schalten bekannt, können daraus die notwendigen Anfangsbedingungen bestimmt werden. Für DGLs n-ter Ordnung bedarf es hierfür n Anfangsbedingungen. 


# Selbstgeschrieben

## Video 0 (Extra Folien)

Überblick über Modulinhalte - Inhaltsübersicht.
Sehr geehrte Studierende,
herzlich willkommen zu diesem Übersichtsvideo zur Videoreihe Schaltvorgänge begleitend zu den Materialien aus Modul 12 Schaltvorgänge. 
In diesem Video erhalten Sie eine Übersicht zu den Inhalten der einzelnen Videos und der entsprechenden Kapitel im begleitenden Skript und Foliensatz beziehungsweise Folien Handout.

-skip- 

Video 1 behandelt alle Themen aus Kapitel 1 der Einführung. 
Dies umfasst eine Vorstellung von Ausgleichsvorgängen im Allgemeinen und von Schaltvorgängen im Speziellen. 
Behandelt Fragen sind unter Andrem: Was sind Schaltvorgänge? Welche Ursachen, Herausforderungen und Möglichkeiten gibt es? Wie unterscheidet sich das Verhalten realer und idealer Schalter?

-skip-

Video 2 deckt einen Großteil des Kapitel 2 Grundlagen ab. 
Es gibt einen Überblick zu Definitionen der wichtigsten Begriffe für die Inhalte dieses Moduls.
Die wichtigsten Kernpunkte die behandelt werden sind: 
* Definitionen (Kurzüberblick)
* Berechnungsmethoden (im Zeit- und Bildbereich)
* Aufstellen von Differentialgleichungen
* Eigenschaften der DGL und des Systems sowie die Form der DGL

-skip

Video 3 schließt das Kapitel 2 Grundlagen ab. 
Vorgestellt wird das Berechnungsverfahren von Schaltvorgängen im Zeitbereich. Anhand einzelner Problemstellungen und Lösungsansätze wird das Verfahren Stück für Stück hergeleitet. 
Das Video deckt die folgenden Themen ab: 
* Anfangsbedingungen und deren Bedeutung zur eindeutigen Lösung von Differentialgleichungen.
* Die Zerlegung von Schaltvorgängen in einen flüchtigen und einen eingeschwungenen Zustand
* Bestimmung des flüchtigen Zustandes (homogene Lösung der DGL)
* Bestimmung des eingeschwungenen Zustandes (partikulare Lösung der DGL)
* Zusammenfassung: Berechnungsverfahren im Zeitbereich in 5 Schritten 
    
-skip

Die folgenden Videos umfassen alle Teile von Kapitel 3 Berechnung im Zeitbereich.

Video 4 zeigt die Berechnung bei Anregung mit Gleichspannung.
* Die Zeitkonstante Tau wird hierfür eingeführt
* Exemplarisch werden einfache Schaltvorgänge bei R L Gliedern und bei R C Gliedern berechnet. 

-skip

Video 5 zegit die Berechnung bei sinusförmiger Anregung.
* Verhalten bei unterschiedlichen Schaltzeitpunkten und bei unterschiedlichen Zeitkonstanten.
* Minimierung von Ausgleichsvorgängen und Möglichkeit von Überspannungen- und strömen.
* Beispiel Rechnung bei einem R C Glied.

-skip

Video 6  Fortsetzung vom vorigen Video.
* Beispiel Rechnung bei einem R L Glied bei sinusförmiger Anregung.

-skip

Video 7 zeigt die Berechnung bei RLC-Serienschwingkreisen
    * Fallunterscheidung
    * aperiodischer Fall
    * aperiodischer Grenzfall
    * periodischer Fall

-skip

Video 8 zeigt optionale Exkurse zu Schwingkreisen zum Vertiefen
    * Herleitung der homogenen Lösung im periodschen Fall (Überlagerung zweier gleichfrequenter Schwingungen)
    * Nullstellen des charakteristischen Polynoms (Eigenwerte) im Ortskurven Diagramm und Analyse des Systemverhaltens (Systemtheorie)
    * Zusammenhang von Abklingkonstante, Eigenkreis- und Resonanzkreisfrequenz, Güte und DGLen linear gedämpfte Schwingungen.



- Video 0: Videoübersicht (Inhaltsverzeichnis im Videoformat)
- Video 1: Kapitel 1 -  Einführung
- Video 2: Kapitel 2 -  Grundlagen 
    + Kapitel 2.1 -  Definitionen (__Glossar__), 
    + Kapitel 2.2 -  Berechnungsmethoden (__Bild-/Zeitbereich__), 
    + Kapitel 2.3 -  Differentialgleichungen (__Eigenschaften__, __Form__, __Aufstellen__, __Ordnung__)
- Video 3: Kapitel 2 -  Grundlagen
    + Kapitel 2.4 - Berechnungsverfahren im Zeitbereich 
    + (__Anfangsbedingungen__, __Zerlegung in eingeschwungen, flüchtig__, __hom. Lsg.__, __Beispiel__, __part. Lsg.__, __5 Schritte__)
- Video 4: Kapitel 3.1 -    Schaltvorgänge berechnen: bei Gleichspannung
- Video 5: Kapitel 3.2 -    Schaltvorgänge berechnen: bei sinusförmiger Anregung (1/2)
- Video 6: Kapitel 3.2 -    Schaltvorgänge berechnen: bei sinusförmiger Anregung (2/2)
- Video 7: Kapitel 3.3 -    Schaltvorgänge berechnen: bei RLC-Serienschwingkreisen
- Video 8: Kapitel 3.4 -    Schaltvorgänge berechnen: Exkurse zu Serienschwingkreisen


- [ ] K3.1   24-30: L. K3, Schaltvorgänge bei Gleichspannung: Beispiel RC Laden, Zeitkonstante einführen, 5 Steps short und Detail
- [ ] K3.1   31-40: Bsp. RC Entladen, 5 Steps detail; Vgl RC Laden/Entladen, Vgl. RL (zu erwartend), RL Laden 5 steps Detail, RL Entladen 5 Steps short
- [ ] K3.2   41-46: Schaltvorgänge bei sinusförmiger Anregung, Allg., Bsp. RC an u_q(t), Konsequenzen (Überspannungen-/Ströme, Schaltzeitpunkt)
- [ ] K3.2   47-50: Bsp. RL an u_q(t)
- [ ] K3.3   51-59: Bsp. RLCs, Fallunterscheidung, 5 Steps für jeden Fall: yh -> Diskriminante, w_d, delta bei period. Fall einführen
- [ ] K3.4   60-64: Exkurse: yh period. Fall Herleitung (Überlagerung abklingender Schwingungen); Ortskurve/Systemtheorie/Regelungstechnik; Vgl. delta, w_d, w_0, Güte

## Video 1 (03-09)

Videoziele: Einführung [Lernziele Folie übernehmen]
Sehr geehrte Studierende,
herzlich willkommen zu dieser Vorlesung über Schaltvorgänge. 



# OUTPUTS

## Video 1 (03-09)

**Folie 1: Idealer Schalter vs. Realer Schalter**

Sehr geehrte Studierende, herzlich willkommen zu dieser Vorlesung über Schaltvorgänge. In dieser 
Vorlesung werden wir uns mit dem Verhalten von Schaltungen beim Schalten beschäftigen. Wir beginnen 
mit einer Gegenüberstellung: Was passiert, wenn wir einen idealen Schalter betrachten, und was 
passiert in der Realität?

Der ideale Schalter, wie wir ihn hier im Schaltbild sehen, öffnet und schließt augenblicklich. Das 
bedeutet, es gibt keine Schaltzeit, keine Verluste und keine Übergangszustände. Die Spannung an den 
Anschlüssen des Schalters wechselt sofort von einem Wert auf einen anderen.

In der Realität ist das anders. Reale Schalter benötigen eine gewisse Zeit, um zu öffnen oder zu 
schließen. Dabei entstehen Verluste, beispielsweise durch den Widerstand des Schalters. Außerdem kommt 
es zu Übergangszuständen, bei denen sich die Spannung und der Strom allmählich ändern. Das sehen wir 
im unteren Diagramm.

Diese Unterschiede sind wichtig, da sie das Verhalten der gesamten Schaltung beeinflussen können.

---

**Folie 2: Idealer Schalter vs. Realer Schalter (Diagramme)**

Wie Sie in diesem Diagramm sehen, ist die Spannungsform im Falle eines idealen Schalters ein Rechteck. 
Die Spannung wechselt augenblicklich von dem Wert 'U q' auf Null und dann wieder zurück.

Im Gegensatz dazu zeigt das Diagramm für den realen Schalter eine allmähliche Änderung der Spannung. 
Es gibt eine gewisse Anstiegs- und Abfallzeit, während der die Spannung nicht sofort wechselt. Diese 
Übergangszeit wird durch die Eigenschaften des realen Schalters und der angeschlossenen Schaltung 
bestimmt.

Wir werden uns später noch genauer mit den Ursachen für diese Übergänge beschäftigen.

---

**Folie 3: Idealer Schalter vs. Realer Schalter (MOSFET)**

Betrachten wir nun ein konkretes Beispiel: den MOSFET, ein weit verbreiteter Transistor, der als 
Schalter eingesetzt wird. Hier sehen wir das Schaltbild eines einfachen MOSFET-Schalters mit einem 
Widerstand 'R' als Last.

Im idealen Fall nehmen wir an, dass der MOSFET keine parasitären Effekte hat. Das bedeutet, dass er 
sich sofort ein- und ausschaltet, ohne jegliche Verzögerung.

---

**Folie 4: Idealer Schalter vs. Realer Schalter (MOSFET mit Kapazitäten)**

In der Realität hat der MOSFET jedoch parasitäre Kapazitäten. Diese Kapazitäten, wie 'Cgs' und 'Cds', 
sind zwischen den verschiedenen Anschlüssen des Transistors vorhanden. Sie beeinflussen das 
Schaltverhalten, da sie geladen und entladen werden müssen.

Wenn wir den MOSFET einschalten, müssen die Kapazitäten geladen werden, bevor der Strom fließen kann. 
Das führt zu einer Verzögerung und zu Übergangszuständen. Das gleiche gilt beim Ausschalten, wo die 
Kapazitäten entladen werden müssen.

Diese parasitären Effekte sind bei Hochfrequenzanwendungen besonders wichtig, da sie die 
Schaltgeschwindigkeit begrenzen können.

---

**Folie 5: Grundlagen der Berechnung von Schaltvorgängen**

Sehr geehrte Studierende, nun wollen wir uns den Grundlagen der Berechnung von Schaltvorgängen widmen. 
Unser Ziel ist es, das Zeitverhalten von Schaltungen beim Schalten zu bestimmen.

Hier sind die Lernziele für diese Einheit: Sie sollen grundlegende Begriffe kennen und verstehen, wie 
zum Beispiel 'Transient', 'Ausgleichsvorgang' und 'Einschwingvorgang'. Sie sollen Berechnungsmethoden 
im Zeit- und Bildbereich kennen. Sie sollen in der Lage sein, Differentialgleichungen für 
Schaltungsgrößen von LZI-Schaltungen aufzustellen. Sie sollen DGL-Eigenschaften aus 
Schaltungseigenschaften ableiten und schließlich das Zeitverhalten von Schaltvorgängen bestimmen, 
indem Sie die Differentialgleichungen lösen.

---

**Folie 6: Definitionen**

Um sicherzustellen, dass wir alle die gleichen Begriffe verwenden, hier eine Tabelle mit wichtigen 
Definitionen.

Ein 'Schalter' ist ein Bauelement, das eine elektrische Verbindung durch Betätigen öffnen oder 
schließen kann. 'Periodisch' bedeutet, dass etwas in regelmäßigen Abständen wiederkehrt. 
'Zeitinvariant' bedeutet, dass sich die Eigenschaften eines Systems im Laufe der Zeit nicht ändern. 
'Gewöhnlich' bezieht sich auf Differentialgleichungen, die nur Ableitungen nach einer unabhängigen 
Variable enthalten. 'Homogen' bedeutet, dass eine Differentialgleichung ohne konstanten Term ist. 
'Linear' bedeutet, dass die Variablen in einer Differentialgleichung linear vorkommen.

Ein 'Ausgleichsvorgang' ist ein Vorgang, bei dem ein System von einem stationären Zustand in einen 
anderen übergeht. Ein 'Einschwingvorgang' ist ein schwingender Ausgleichsvorgang, der nicht spontan 
abklingt. Ein 'Schaltvorgang' ist der Übergang von einem stationären Zustand in einen anderen nach dem 
Schalten. Ein 'Transient' ist ein vorübergehender Zustand während des Ausgleichsvorgangs.

---

**Folie 7: Berechnungsmethoden für Schaltvorgänge**

Es gibt grundsätzlich zwei Möglichkeiten, Schaltvorgänge zu berechnen: im Zeitbereich und im 
Bildbereich.

Im Zeitbereich lösen wir eine Differentialgleichung, die das Verhalten der Schaltung beschreibt. Die 
Lösung dieser Differentialgleichung gibt uns die Zeitfunktion, also den Verlauf der Schaltungsgrößen 
über die Zeit.

Im Bildbereich transformieren wir die Differentialgleichung in eine algebraische Gleichung. Diese 
algebraische Gleichung können wir leichter lösen, um die Bildfunktion zu erhalten. Durch 
Rücktransformation erhalten wir dann wieder die Zeitfunktion.

In dieser Vorlesung werden wir uns hauptsächlich auf die Berechnung im Zeitbereich konzentrieren, da 
sie für das Verständnis der physikalischen Grundlagen wichtig ist.

---

**Folie 8: Differentialgleichungen**

Wie Sie sehen, basieren beide Berechnungsmethoden auf dem Lösen von Differentialgleichungen. Hier ist 
die allgemeine Form einer Differentialgleichung n-ter Ordnung, die wir zur Beschreibung von linearen, 
zeitinvarianten Schaltungen verwenden.

Die Lösung dieser Differentialgleichung hängt von den Anfangsbedingungen ab, also von den Werten der 
Schaltungsgrößen zum Zeitpunkt des Schaltens. Die Ordnung der Differentialgleichung hängt von der 
Anzahl der Energiespeicher in der Schaltung ab. Eine Induktivität oder Kapazität führt jeweils zu 
einer Ableitung erster Ordnung.

Damit sind wir am Ende dieses ersten Teils der Vorlesung angelangt. Ich hoffe, Sie haben ein gutes 
Verständnis der Grundlagen der Berechnung von Schaltvorgängen erlangt.
