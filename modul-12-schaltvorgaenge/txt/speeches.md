

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


## Video 1 (03-09)

Videoziele: Einführung [Lernziele Folie übernehmen]
Sehr geehrte Studierende,
herzlich willkommen zum Video "Einführung in Schaltvorgänge".
In diesem Video werden die Inhalte aus Kapitel 1 des Moduls Schaltvorgänge vorgestellt.
Hier sehen Sie die Lernziele des Kapitels und dieses Videos.

Anhand von Ausgleichsvorgängen im Allgemeinen mit einfachen Beispielen aus der Physik
werden wir den Begriff Schaltvorgang näher erläutern und Analogien heraus arbeiten.
Sie werden Ursachen, den typischen Ablauf und eine grobe Definition von Schaltvorgängen kennen lernen
und diese im größeren Zusammenhang mit anderen Ausgleichsvorgängen verstehen lernen. Anhand von Beispielen,
wo diese Auftreten und welche Auswirkungen möglich sind,
werden sie mögliche Herausforderungen sowie Möglichkeiten, die sich aus Schaltvorgängen ergeben kennen lernen.
Zudem lernen Sie Unterschiede im Verhalten von idealen und realen Schaltern kennen.

-SKIP 

Was sind nun Schaltvorgänge? Um diese Frage zu beantworten, fangen wir mit einem kleinem Beispiel an.
In der Schaltung links sehen wir eine R C Reihenschaltung.
Diese kann über einen Schalter entweder kurzgeschlossen werden oder an eine ideale Gleichspannungsquelle U q geschlossen werden.

Was passiert nun, wenn die Schalterstellung wechselt und die Spannung U q an die R C Reihenschaltung angeschlossen wird?

Ist die Kapazität zum Schaltzeitpunkt entladen (das heißt die Spannung u C an der Kapazität ist gleich null), so stellt sich der rechts zu sehende Zeitverlauf ein.
Wie zu sehen ist, steigt die Spannung u c an der Kapazität zunächst schnell und dann immer langsamer an und konvergiert am Ende gegen eine konstante Spannung.
Am Ende dieses Ladevorganges hat sich ein **stationärer Zustand** eingestellt.
Vor dem Schalten hatten wir ebenfalls einen **stationären Zustand** als die Kapazität vollständig entladen war.
Das was sich zwischen diesen beiden stationären Zuständen abspielt wird als **Ausgleichsvorgang** bezeichnet.
Von der angeschlossenen Spannungsquelle fließt solange Energie in die Kapazität, bis sich die Spannungen sich angeglichen haben.
Am Ende fließt kein Strom mehr und die Kapazität hat die Spannung U_q erreicht.

-skip

Im Prinzip basieren alle makroskopischen Prozesse auf Ausgleichsvorgängen, je nachdem wie weit die Systemgrenzen gewählt werden.
Betrachten wir dieses Bild von einem Topf, der über einem Lagerfeuer erhitzt wird.
Nehmen wir an, der Topf ist mit Wasser gefüllt, das zunächst Umgebuntstemperatur hat.
Bei bei genügend Wärmezufuhr wird das Wasser anfangen zu kochen und schließlich unter Normaldruck eine konstante Temperatur von ungefähr hundert Grad Celsius erreichen.
Die zugeführte Energie entspricht dann exakt der abgeführten Energie (z.B. durch Verdunstung).

-skip

Ursache für den Temperaturausgleich ist das Feuer machen unter dem Topf.
Analog dazu resultierte der Spannungsausgleich an der Kapazität durch den Anschluss der Gleichspannungsquelle.
Ursächlich für Ausgleichsvorgänge in Schaltungen sind plötzliche Änderungen in der Schaltung.
Zum Beispiel durch Schalthandlungen, bei DC-Netzwerken durch Änderung von Spannung oder Strom oder bei AC-Netzwerken durch Änderung von Amplitude, Frequenz oder Phase.

-SKIP

Hier sind weitere Beispiele für ähnliches Systemverhalten. Auch Einschwingvorgänge bei Regelungsprozessen können als Ausgleichsvorgänge betrachtet werden. 

Im obigen Beispiel sehen wir einen Beispiel aus der Robotik.
Links zu sehen ist eine Roboterhand, die eine Glühbirne hält. 
Zum Halten, muss der Fingerdruck auf einen festen Wert regeln. 
Kommt es zu einem Überschwingen wie bei der orangenen Sprungantwort im mittleren Diagramm, kann dies den Bruch der Birne bedeuten
wie rechts im Bild angedeutet ist. Für eine feine Motorik muss das System schnell, aber auch präzise reagieren wie bei der blauen Sprungantwort ohne Überschwingen dargestellt ist. 

Im unteren Beispiel sehen wir ein Beispiel aus der Automobilindustrie. 
Links sehen wir den Querschnitt eines Verbrennungsmotors. Für ein angenehmes Fahrverhalten müssen Drehzahl- und Drehomentregelung stimmen.
Auch ohne Überschwingen kann eine zu abrupte Beschleunigung oder Abbremsung gerade beim Personentransport zu unerwünschten Folgen führen.

All diese Beispiele haben gemein, dass eine plötzliche Änderung, in diesem Fall durch den Sprung der Sollgröße im Regelkreis, einen Ausgleichsvorgang nach sich zieht.
Während der Ausgleichsvorgänge strebt die betrachtete Systemgröße einen stationären Zustand an. 

-SKIP

 Hier sehen wir zwei Beispiele von Schaltvorgängen. Diese sind nichts anderes als Ausgleichsvorgänge in elektrischen Schaltungen, ausgelöst durch plötzliche Änderungen wie Schaltaktionen.

 Im obigen Beispiel sehen wir einen Einschwingvorgang bei Anregung mit einer Gleichspannung. Der Verlauf ähnelt dem Ladevorgang der Kapazität über den Widerstand. 
 Im unteren Beispiel sehen wir einen Einschwingvorgang bei Anregung mit einer Wechselspannung. In diesem Fall schwingt sich die Systemgröße s auf eine konstante Sinusform ein. 
 Mit den gepunkteten Verläufen wird angedeutet, wie sich der Zeitverlauf von s während des Schaltvorganges aus der Überlagerung einer Sinusschwingung wie im eingeschwungenen Zustand und einer Exponentialkurve wie im DC Fall ergibt. 

 Der Schaltvorgang bezeichnet den Zustand des Überganges bei dem ein stationärer Zustand angestrebt wird aber. 
 Stationär heißt im D C Fall ein konstanter Wert oder im A C Fall eine konstante Amplitude, Frequenz und Phase.
 Ausgleichsvorgänge werden insbesondere im Hochspannungsbereich oft **Transienten** genannt, abgeleitet vom lateinischen Wort *transire*, was zu Deutsch so viel wie *übergehen* bedeutet. Das Adjektiv *transient* bedeutet so viel wie übergangsweise. Das Gegenteil dazu ist *persistent*, vom lateinischen *persistere*, zu Deutsch *verharren*. 

-SKIP

Ein Bereich in dem es regelmäßig zu Schaltvorgängen kommt ist die Leistungselektronik.
In sogenannten Stromrichtern wird durch getaktetes Schalten elektrische Energie in eine andere Form elektrischer Energie gewandelt.
Im hier gezeigten Tiefsetzsteller wird beispielsweise die Gleichspannung U eins am Eingang in eine niedrigere Gleichspannung U zwei am Ausgang gewandelt. 

Das Spannungsverhältnis wird dabei durch den Tastgrad bestimmt, das heißt durch das Verhältnis von der Zeit bei geschlossenem Schalter während einer Periodendauer zur gesamten Periodendauer. Bei geschlossenen Schalter lädt die Induktivität, wobei der Strom i L näherungsweise linear ansteigt und bei geschlossenem Schalter entlädt die Induktivität nährungsweise linear. 

Andere Beispiele in denen Schaltvorgänge auftreten sind zum Beispiel das Ein- und Ausschalten von elektrischen Geräten, die Änderung von Eingangssignalen bei A D und bei D A Convertern und Fahrradlampen mit Kondensator, wenn die Dynamospannung weg bricht. 

-SKIP

Für die Betrachtung von Schaltvorgängen werden im Rahmen des Moduls immer ideale Schalter angenommen. 
Ideale Schalte zeichnen sich dadurch aus, dass sie verlustlos und instantan schalten. 
Das bedeutet, dass Schaltaktionen sofort ohne Zeitverzögerung ausgeführt werden.
Im Durchlassbetrieb wird eine unendlich große Leitfähigkeit (wie ein Kurzschluss) angenommen und
im Sperrbetrieb wird ein unendlich großer elektrischer Widerstand (wie offene Klemmen) angenommen.

-skip

In Realität kommt es bei realen Schaltern stets zu Verlusten und Latenzen. 
Im Durchlassbetrieb liegt immernoch eine kleine Spannung über dem nicht vernachlässigten Innenwiderstand an. 
Im Sperrbetrieb fließen immernoch kleine Ströme, wodurch ein Teil der Spannung über dem Innenwiderstand der Spannungsquelle abfällt. 
Aufgrund der Latenzen ändert sich die Schalterspannung nicht instantan in den Übergansphasen. 
Dadurch kommt es insbesondere während des Schaltens zu Verlusten, da bereits Ströme fließen während noch eine Spannung anliegt oder umgekehrt.
Die Latenzen und Verluste resultieren auf ohmschen, kapazitiven und induktiven parasitären Effekten wie gleich am Beispiel eines MOSFETs gezeigt wird.

-SKIP

Links sehen wir das Schaltbild eines MOSFET Schalters mit Gain, Drain und Source Anschlüssen.
Ideal betrachtet treten keine paraisären Effekte auf.

-skip

Real betrachtet treten kapazitive Effektische zwischen allen drei Anschlüssen auf.
Das führt dazu, dass die Gate-Source Spannung, um den Schalter zu Öffnen oder zu Schließen sich nicht instantan ändern kann.
Bevor der MOSFET seinen Zustand zwischen Sperren und Durchlass wechselt, müssen die Kapazitäten erst entladen oder geladen werden,
wodurch Latenzen beim Schalten entstehen.

Im Rahmen des Moduls fokussieren wir uns ausschließlich auf Schaltvorgänge, das heißt auf die Ausgleichsvorgänge *nach* dem Schalten.
Real betrachtet kommt es bereits während des Schaltens zu Ausgleichsvorgängen innerhalb der jeweiligen Schalter.
Zur Vereinfachung werden in diesem Modul stets ideale Schalter angenommen.

## Video 2

 Wilkommen zu diesem Video über den ersten Teil der Grundlagen zum Modul Schaltvorgänge.
 Im ersten Grundlagen Video nähern wir uns dem Thema von eher theoretischer Seite her.
 Wie auf dieser Folie zu erkennen ist, lernen wir zunächst wichtige grundlegende Begriffsdefinitionen kennen und verstehen.
 Wir lernen zwei prinzipielle Berechnungsmethoden für Schaltvorgänge kennen, eine im Zeit- und eine im Bildbereich.
 Da beide Methoden auf dem Lösen von Differentialgeichungen, kurz D G L n basieren, wird ein Verfahren zum Aufstellen von Differentialgeichungen vorgestellt.
 Anhand von Eigenschaften und Topologie einer Schaltung werden sie lernen, Eigenschaften und Form der zugehörigen Differentialgeichung abzuleiten.

 Die Kenntnisse aus diesem Grundlagenvideo dienen allesamt als Bausteine für das Berechnungsverfahren von Schaltvorgängen im Zeitberech, 
 welches im zweiten Grundlagen Video vorgestellt wird.

-SKIP

Beginnen wir mit der Definition von wichtigen Begriffen für das Thema Schaltvorgänge. 
Die Tabelle, die Sie hier auf dieser Folie sehen, dient als Nachschlagewerk mit Kurzdefinitionen einiger wichtiger Begriffe. 
Sie kann bei Bedarf im Sinne eines Glossars verwendet werden. Im Skript ist eine etwas ausführlichere Variante der Tabelle hinterlegt.
Die einzelnen Begriffe werden an den Stellen im Modul, wenn diese erstmalig Verwendung finden, ausführlicher beschrieben.

An dieser Stelle sei darauf hingeweisen, dass es für die verschiedenen hier gelisteten Vorgänge leicht unterschiedliche Definitionen in der Fachliteratur gibt.
Die Begriffe "Ausgleichsvorgang", "Einschwingvorgang", "Schaltvorgang" und "Transiente" haben teils überschneidende Bedeutungen und werden teils synonym verwendet. 
Die hier gezeigten Definitionen können im Rahmen dieses Moduls unbeschränkt angewandt werden und sind tendentiell etwas allgemeiner definiert, als in den Literaturquellen des beiliegenden Skriptes. 

Schaltvorgänge können im Kontext des Moduls als Ausgleichsvorgänge nach dem Schalten verstanden werden. 

-SKIP

Kommen wir zu den allgemeinen Berechnungsmethoden für Schaltvorgänge. 
Prinzipiell gibt es zwei Ansätze, um die Zeitverläufe von Systemgrößen wie Strom oder Spannung während eines Schaltvorganges zu berechnen.

Bei der *ersten Methode* wird der Schaltvorgang im Zeitbereich berechnet - wie hier in der oberen Bildhälfte zu sehen ist.
Ausgangspunkt der Methode ist die Differentialgleichung der Schaltung für die Systemgröße f.
Durch lösen der Differentialgleichung lässt sich der gesuchte Zeitverlauf f von t bestimmen.

Die Methode im Zeitbereich ist diejenige, welche wir hier im Modul ausführlich bearbeiten. 
Die Methode bietet sich gerade zu Beginn an, um ein Verständnis für die physikalischen Abläufe während eines Schaltvorganges zu entwickeln.
Für diese Methode wird der Zeitverlauf auf anschauliche Weise in einen flüchtigen und einen eingeschwungenen Zustand zerlegt wie später noch gezeigt wird.

Bei der *zweiten Methode* wird die gleiche Differentialgleichung als Ausgangspunkt genommen, allerdings wird diese im Bildbereich gelöst. 
Vorraussetzung ist, dass die Differentialgleichung für t größer gleich 0 gilt, was bei Schaltvorgängen gegeben ist. 
Die Methode im Bildbereich ist weniger anschaulich und etwas abstrakter durch die mathematische Repräsentation im Bildbereich.
Daher wird die Methode an dieser Stelle kurz erklärt, aber im Rahmen des Moduls nicht ausführlicher behandelt. 

In den meisten Fällen, insbesondere bei komplexeren Schaltung oder gekoppelten Schaltvorgängen, ist die Berechnung im Bildbereich deutlich einfacher. 
Wie links zu sehen ist, wird die Differentialgleichung durch die Laplace-Transformation in eine algebraische Form gebracht. 
Das bedeutet, dass Integrale und Differentiale durch die Transforamtion entfallen und die Gleichung - wie unten zu sehen ist - 
algebraisch nach der Bildfunktion groß F von s aufgelöst werden kann. Durch Rücktransformation wird so der Zeitverlauf klein f von t bestimmt. 

Der große Vorteil ist, dass die algebraische Umformung im Bildbereich in der Regel einfacher zu berechnen ist als das Lösen der Differentialgleichung im Zeitbereich. 
Für die Transformation und Rücktransformation gibt es entsprechende Korrespondenztabellen.
Vereinfacht wird das Verfahren zusätzlich, bei verschwindenden Anfangsbedingungen, das heißt wenn f von t oder deren Ableitungen zum Schaltzeitpunkt gleich Null sind.
Andernfalls müssen die Anfangsbedingungen im Bildbereich mit eingearbeitet werden. 

Ähnliche Ansätze im Bildbereich zu rechnen finden wir auch bei der komplexen Wechselstromrechnung oder beim Aufstellen von Differentialgleichungen.

-SKIP

Wie erhalten wir nun die erforderlichen Differentialgleichungen? 
Die Schaltungen die wir in diesem Modul betrachten werden, bestehen aus den links gezeigten Komponenten. 
Das sind zum Einen die passiven Komponenten: Elektrische Widerstände R, Induktivtitäen L, Kapazitäten C und Leitungen, 
zum Anderen die aktiven Komponenten: Spannungsquellen U und Stromquellen I. 

Das Vorhandensein von Energiespeichern, das heißt von Induktivitäten oder Kapazitäten, führt zu Schaltvorgängen und Differentialgleichungen. 
Wie rechts bei den Komponenten Gleichungen zu sehen ist, ist die Spannung u L an Induktivtitäten proportional zur zeitlichen Ableitung des Stromes i L. 
Das heißt der Strom i L kann niemals springen, ist also stetig. Genauso verhält es sich mit dem Strom i C bei Kapazitäten, der proportional zur zeitlichen Ableitung der Spannung u C ist. Daher kann die Spannung u C niemals springen, ist also stetig. 

Die Differentialgleichung erhalten wir durch Anwendung der Komponentengleichung und der Kirchhoff'schen Regeln, also der Knoten- und Maschenregel. 

-SKIP

Das hier gezeigte Flussdiagramm stellt prinzipiell zwei Vorgehensweisen dar, um die gesuchte Differentialgleichung - oben rechts im Bild - auf zu stellen.
Welches Vorgehen am geschicktesten ist, hängt stark von der Schaltungstopologie ab.
Die erste Methode, welche in diesem Modul ausführlich behandelt wird, ist in der oberen Bildhälfte zu sehen und nutzt nur den Zeitbereich.

Im ersten Schritt - oben links im Bild - stellen wir eine Knoten- oder eine Maschengleichung auf. 
Im zweiten Schritt setzen wir in diese die Komponentengleichungen für R, L und C ein, um möglichst eine Gleichung zu erhalten, die nur noch von der Zielgröße und deren zeitlichen Ableitungen ist. 
Ist beispielsweise die Spannung u C gesucht, versuchen wir durch knoten- und maschenweise wiederholen von Schritt 1 und 2 alle Ströme und Spannungen an anderen Komponenten durch Terme zu ersetzen, die nur noch von der gewünschten Zielgröße abhängig sind oder deren zeitlichen Ableitungen und anderen Konstanten wie R, L und C. 
Am Ende erhalten wir durch entsprechende Umformung die gesuchte Differentialgleichung oben rechts im Bild.

Alterantiv können wir uns auch der komplexen Wechselstromrechnung bedienen. Auch wenn es sich während des Schaltvorganges weder um Gleichgrößen, noch um Wechselgrößen handelt, gilt die Differentialgleichung für alle Zeitpunkte t ab dem Schaltzeitpunkt. Da die Differentialgleichung auch im eingeschwungenen Zustand gilt, wenn wir nur noch reine Gleich- oder Wechselgrößen haben, können wir zum Aufstellen der D G L auch mit komplexen Größen rechnen. 
Anhand der komplexen Knoten- und Maschengleichung - unten links im Bild, können wir durch Einsetzen der Impedanz- oder Admitanzgleichungen, komplexer Strom und Spannungsteilern
eine algebraische Gleichung in der Form unten links bestimmen. Hierfür werden analog zur Methode im Zeitbereich gegebenenfalls knoten- und maschenweise die ersten beiden Schritte wiederholt bis die algebraische Gleichung nur noch die komplexe Zielgröße enthält. 
Bei der Rücktransformation in den Zeitbereich werden die jott omega Terme zu Differntialoperatoren umgeschrieben. 

Für beide Methoden folgt gleich ein kurzes Beispiel.

-SKIP

Gegeben sei die oben gezeigte Schaltung. 
Die R C Serienschaltung ist über einen Schalter entweder in der Ausgangsstellung kurzgeschlossen 
oder ab dem Schaltzeitpunkt t gleich null an eine ideale Gleichspannungsquelle U q angeschlossen. 
Gesucht sei die Spannung u c an der Kapazität für t größer gleich 0.

Wir sehen hier die Knoten und Maschengleichung und die Komponentengleichungen für i C und für u R. 
Da es sich um eine Serienschaltung handelt fließt der gleiche Strom durch R und durch C.

-skip

Deshalb setzen wir zunächst R mal i in die Maschengleichung für u R  ein
Als nächsten Schritt ersetzen wir i durch C mal der zeitlichen Ableitung von u C. 

Dadurch erhalten wir die D G L erster Ordnung: R C mal der ersten Ableitung von u C plus u C ist gleich U q. 

-SKIP

Zum Vergleich stellen wir nun die D G L für die gleiche Schaltung mit der zweiten Methode auf. 
Da wir die D G L für u C bestimmen wollen, beginnen wir mit dem komplexen Spannungsteiler für U C. 

U C ist gleich U q mal Z C geteilt durch R + Z C. 
In dieser Form haben wir bereits nur unsere gewünschte Zielgröße u C, 
die Spannungsquelle U q als unsere Störquelle und die Variablen R und C, die unsere konstanten Koeffizienten bilden.
Durch algebraische Umformung stellen wir wir die Gleichung um. 
Auf die linke Seite kommen erstens alle jot omega Terme, zweitens unsere Zielgröße u C in komplexer Form. 
Wichtig ist, dass die jot omega Terme im Zähler stehen, damit diese am Ende zu Differntialoperatoren umgewandelt werden können.
Auf die rechte Seite kommt unser komplexes U q als Störterm. 
Durch Rücktransformation in den Zeitbereich erhalten wir unsere Differentialgleichung. 

-SKIP

Hier sehen wir nochmal eine kurze Zusammenfassung und Übersicht. 
Links sind die linearen, zeitinvarianten Schaltungskomponenten, aus denen sich unsere Schaltungen zusammen setzen. 
Oben rechts sehen wir, welche Eigenschaften der D G L sich aus den Systemeigenschaften der Schaltung ableiten lassen. 
Beinhaltet die Schaltung Energiespeicher, das heißt Induktivitäten oder Kapazitäten, so erhalten wir eine D G L. 

Die Zusammenhänge von Schaltungstopologie und Eigenschaften und Form der D G L zu verstehen hilft uns zum Beispiel 
beim Aufstellen der D G L, da wir wissen, welche Form diese annehmen muss. 
Außerdem kann uns dieses Wissen später helfen das Systemverhalten zum Teil direkt aus der Form der D G L abzuleiten.

Wenn alle Komponenten einer Schaltung linear sind, ist auch die zugehörige D G L linear. 
Bei allen Komponenten gehen wir von Zeitinvariant aus, das heißt zum Beispiel, dass der elektrische Widerstand R sich nicht über die Zeit verändert.
Daraus lässt sich ableiten, dass die Konstanten a i unserer Differentialgleichung konstant sind, da diese nur von den Werten für R, L und oder C abhängen. 

Unten sehen wir die allgemeine Form einer **gewöhnlichen**, **linearen**, **inhomogenen** Differentialgleichung der **Ordnung** n mit **konstanten Koeffizienten**.
Die D G L ist **gewöhnlich**, weil sie nur von einer Variable, hier der Zeit t, abhängt. 
Die D G L ist **linear**, weil nur lineare Terme enthalten sind. 
Die D G L ist ***inhomogen**, da sie einen Störterm b von t auf der rechten Seite der Gleichung enthält. 
Der Störterm stellt unsere Anregung dar, das heißt in ihm finden wir Strom oder Spannung von angeschlossenen Strom- oder Spannungsquellen. 
Ohne Anregung, zum Beispiel beim Entladen einer Kapazität über einen Widerstand, entfällt der Störterm auf der rechten Seite und wir erhalten eine *homogene* D G L.
Die D G L hat die **Ordnung** n, da die n die höchste auftretende Ableitung der Schaltungsgröße y ist.

-SKIP

Die Ordnung einer Differentialgleichung entspricht exakt der Menge an nicht zusammenfassbarer Energiespeicher in der Schaltung.
Auf dieser Folie sehen sie einige Beispielschaltungen und die Anzahl der Energiespeicher und resultierenden Ordnung der D G L.

Sind beispielsweise zwei Induktivitäten unmittelbar in Serie oder zwei Kapazitäten unmittelbar parallel zu einander, lassen sich diese in einem Ersatzschaltbild zu einer Induktivität beziehungsweise Kapazität zusammenfassen und werden daher nur *einzelne* Energiespeicher gezählt. 

Bei den hier gezeigten Beispielen haben die rechten drei Beispiele alle zwei Energiespeicher und somit eine D G L zweiter Ordnung.
Schwingungsfähig sind allerdings nur Schaltungen mit mindestens zwei unterschiedlichen Energiespeichern, das heißt mit mindestens einer Kapazität und einer Induktivität. 
Schaltvorgänge in Serienschwingkreisen werden später ausführlich behandelt.

 ## Video 3 

 Wilkommen zum zweiten Grundlagen Video des Moduls Schaltvorgänge.
 In diesem Video verknüpfen wir die Kenntnisse aus dem ersten Grundlagen Video und lernen ein Berechnungsverfahren kennen und verstehen, mit dem Schaltvorgänge im Zeitbereich berechnet werden können. 
 
Lernziele:
    - Anfangsbedingungen
    - Zerlegung
    - hom. Lsg.
    - hom. Lsg. Beispiel
    - part. Lsg.
    - 5 Schritt Verfahren


-SKIP

Differentialgleichungen haben prinzipiell unendlich viele Lösungen. 

-skip

Um das Zeitverhalten einer gesuchten Schaltungsgröße zu bestimmen, müssen wir die allgemeine Lösung einer D G L auf eine konkrete, distinktive Lösung eingrenzen. 
Zur Eingrenzung auf diese eindeutige Lösung bedarf es für eine D G L n ter Ordnung exakt n **Anfangsbedingungen**.

-skip

Eine Anfangsbedingung ist der Wert einer beliebigen Schaltungsgröße y von t zu einem beliebigen Zeitpunktes während des Schaltvorganges.

Doch Wie erhalten wir die benötigten Anfangsbedingungen, wenn der Zeitverlauf der Schaltungsgrößen während des Schaltvorganges noch unbekannt ist?

Erinnern wir uns hierfür an die Ursache für Schaltvorgänge. 

-skip

Da Kapazitäten Energie in Form elektrischer Energie speichern, ist die Spannung u C an einer Kapazität **stetig** und kann sich nicht schlagartig ändern.
Da Induktivitäten Energie in Form magnetischer Energie speichern, ist der Strom i L durch eine Induktivität **stetig** und kann sich ebenfalls nicht schlagartig ändern. 

Kenn wir also den Zustand der Schaltungsgrößen u C und i L unmittelbar vor dem Schaltzeitpunkt ...

-skip

... so kennen wir aufgrund dieser **Stetigkeitsbedingungen** auch die Werte für u C und i L unmittelbar nach dem Schaltzeitpunkt, das heißt während des Schaltvorganges. 
Kennen wir also u C und i L vor dem Schaltzeitpunkt, können wir daraus unsere Anfangsbedingungen herleiten. 

-SKIP

Um die Differentialgleichung zu lösen hilft es, die gesuchte Systemgröße während des Schaltvorganges in einen **eingeschwungenen Zustand** und einen **flüchtigen Zustand** zu zerlegen.
Da während des Schaltvorganges ein stationärer Zustand angestrebt wird, können wir diesen eingeschwungenen Zustand, hier y e von t im Diagramm blau dargstellt, von unserer Systemgröße y von t, im Diagramm schwarz, subtrahieren. Was übrig bleibt ist ein flüchtiger Zustand, hier y f von t im Diagramm rot dargestellt.

Im gezeigten exemplarischen Einschwingvorgang nähert sich y von t, schwarz, exponentiell einem Grenzwert an. 
In diesem Beispiel handelt es sich um einen Schaltvorgang mit Gleichgröße als Anregung. 
Der eingeschwungene Zustand ist der angestrebte Endwert, also ein konstanter Wert. 
Der flüchtige Zustand ist eine Kurve mit exponentiellem Verlauf, die sich der Null annähert. 

Wie hilft uns das nun weiter bei der Lösung der D G L? 

-skip

Nun die Zerlegung der Systemgröße y in einen eingeschwungenen Zustand y e und einen flüchtigen Zustand y f entspricht wie wir gleich sehen werden mathematisch 
der Zerlegung der Lösung der D G L y in eine **partikläre Lösung** y p und die **Lösung der homogenen D G L** y h, im folgenden kurz homogene Lösung y h genannt. 

Unten rechts sehen wir vereinfacht, mathematisch nicht ganz präzise dargestellt die Herleitung hinter dieser Aufteilung. 
Da die Systemgröße y für t gegen unendlich in den eingeschwungenen Zustand y e übergeht, muss der eingeschwungene Zustand als Lösung die D G L erfüllen.
Subtrahieren wir also von der allgemeinen inhomogenen Differentialgleichung für y - hier schwarz dargestellt - 
die inhomogene Differentialgleichung für y e - hier blau dargestellt. 
So erhalten wir als Resultat eine homogene Differentialgleichung, da der Störterm entfällt. 
Diese homogene Differentialgleichung gilt für unseren flüchtigen Zustand y f. 

Durch die Zerlegung können wir die Lösung der D G L durch die Überlagerung von y h und y p respektive von y f und y e bestimmen.

-SKIP

Beginnen wir zunächst mit der Bestimmung der homogenen Lösung. 
Die homogene D G L ist gleich der inhomogenen D G L mit Störterm gleich Null. 
Wie hier in der allgemeinen Form dargestellt ist, entfällt der rechte Teil der D G L. 

-skip

Als erster Schritt werden aus der homogenen D G L die **Eigenwerte** lambda i bestimmt. 
Die **Eigenwerte** sind die **Nullstellen** des **charakteristischen Polynoms**. 
Das charakteristische Polynom erhalten wir, indem wir den Exponentialansatz K mal e hoch lambda t für y h eingesetzen. 
Durch Differenzieren der Exponentialterme erhalten wir jeweils die i te Potenz von lambda als Koeffizienten zum Exponentialansatz. 
Nach Ausklammern und Eliminieren der Exponentialterme, bleibt das sogenannte **Charakteristische Polynom** übrig. 
Wie hier erkennbar ist, kann das charakteristische Polynom auch direkt aus der D G L abgelesen werden.
Zur Aufstellung wird jeweils die i te Ableitung von y h durch den Potenzterm lambda hoch i ersetzt.
Durch Bestimmung der Nullstellen, erhalten wir die n Eigenwerte der D G L n ter Ordnung. 

-skip
Hierbei können verschiedene Fälle auftreten. Entweder die Eigenwerte sind **einfache Nullstellen** oder **mehrfache Nullstellen**. 

Bei **einfachen Nullstellen** wählen wir den **ersten Lösungsansatz** K mal e hoch lambda t mit dem jeweiligen Index i für K und lambda wie im ersten Lösungsansatz zu sehen ist.
Aufgrund der unterschiedlichen lambda sind diese Lösungsansätze linear unabhängig von einander.

Bei **mehrfachen Nullstellen** wählen wir den **zweiten Lösungsansatz**. Dieser basiert auf der **Variation der Konstanten** des ersten Lösungsansatzes.
Der Grund für den Ansatz ist, dass die allgemeine homogene Lösung einer DGL n ter Ordnung aus einer **Linearkombination** von exakt n linear unabhängiger Einzellösungen bestehen muss.
Der erste Lösungsansatz liefert bei gleichen Nullstellen allerdings keine linear unabhängigen Lösungsansätze, da sich die Konstanten K i durch Ausklammern zu einer einzigen Konstante zusammen fassen ließen. Für eine dreifache Nullstelle lambda eins gleich lambda zwei gleich lambda drei erhalten wir beispielsweise K 1 **plus** K 2 mal t **plus** K 3 mal t Quadrat als Koeffizient multipliziert mit dem Exponentialterm e hoch lambda eins mal t.

Bei einem gemischten Beispiel besteht die allgemeine Lösung aus einer Linearkombination der jeweiligen Lösungsansätze für die zugehörigen Nullstellen.

**Wichtig** Komplex Eigenwerte treten immer nur **paarweise komplex, konjugiert** auf. Systeme mit paarweise konjugierten Eigenwerten sind prinzipiell schwingungsfähig. 
Mehr dazu im folgenden Beispiel und später im Kapitel zu Schaltvorgängen in Serienschwingkreisen.

**Achtung** Die Realteile der Eigenwerte eines stabilien Systems sind **immer** negativ. 
Nur dann konvergiert die allgemeine Lösung für t gegen unendlich und strebt einen stationären Zustand an.

-SKIP

Auf dieser Folie sehen wir exemplarisch ein Beispiel für eine homogene D G L fünfter Ordnung. 

-skip

Aus den konstanten Koeffizienten lesen wir zunächst direkt die Koeffizienten für das charakteristische Polynom ab.

-skip

Hier sind zum Verdeutlichen die Koeffizienten in blau und die Potenzen von Lambda bzw. der Ableitungen von y von t in rot hervor gehoben. 
Die Eigenwerte lambda 1 bis lambda 5 erhalten wir nun durch Bestimmung der Nullstellen des charakteristischen Polynoms.

-skip

In diesem Fall erhalten wir eine gemischte Konstellation mit **einer einfachen Nullstelle** und **zwei doppelte konjugierte, komplexe Nullstellen**. 
Für die einfache Nullstelle lambda 1 wählen wir den ersten Lösungsansatz mit dem einfachen Exponentialterm K1 mal e hoch lambda 1 mal t. 
Für die zwei doppelten Nullstellen lambda zwei und drei, sowie lambda vier und fünf wählen wir den Exponentialansatz mit Variation der Konstanten.

-skip

Hier sehen wir die resultierende allgemeine Lösung mit eingefärbten Koeffizienten K eins bis K fünf. 
Für die doppelten Nullstellen erhalten wir K zwei **plus** K drei mal t, beziehungsweise K vier **plus** K fünf mal t als Koeffizienten für Exponentialtermen.

-skip

Wie hier farblich hervorgehoben zu erkennen ist, ergeben sich aus den beiden komplex konjugierten Nullstellen je ein exponentiell abklingender Sinus- und ein Kosinusterm.
Der Realteil der komplex konjugierten Nullstellen, hier die in orange hervorgehobe minus eins, 
bestimmt die Abklingrate des Exponentialterms, e hoch Realteil von Lambda mal t, hier e hoch minus t. 
Der Imaginärteil der komplex konjugierten Nullstellen, hier die in magenta hervorgehobene minus 2 vor dem jot, 
bestimmt die Kreisfrequenz des Sinus- und des Kosinusterms, hier Sinus von zwei t beziehungsweise Kosinus von zwei t.
Eine Herleitung der Umformung kann am Ende des Moduls im Exkurs für die Herleitung der homogenen Lösung im periodischen Fall bei Serienschwingkreisen nachgesehen werden. 

-SKIP

Kommen wir zur Berechnung der partikulären Lösung y p, das heißt zur Berechnung des eingeschwungenen Zustandes y e.
Im eingeschwungenen Zustand verhält sich unsere Schaltung stationär. 
In linearen, zeitinvariatnen Systemen bedeutet das, dass unsere Systemgröße 
bei DC-Anregung eine Gleichgröße mit konstantem Wert ist und
bei AC-Anregung eine sinusförmige Wechselgröße ist mit gleicher Frequenz wie die der Anregung.

Zur Bestimmung wenden wir unsere bekannten Methoden zur Netzwerkberechnung an. 
Dazu gehören Knoten- und Maschenregeln, daraus abgeleit Spannungs- und Stromteiler in realer oder komplexer Form. 

Im DC Fall verhalten sich Kapazitäten dann wie offene Schaltungen und Induktivitäten wie Kurzschlüsse.
Im AC Fall rechnen wir mit deren Impedanzen oder Admittanzen.

-SKIP

Unsere bisherigen Erkenntnisse können wir nun hier in einem Berechnungsverfahren mit fünf Schritten zur Bestimmung von Differentialgleichungen im Zeitbereich zusammen fassen. 
Mit diesem Verfahren werden wir alle Schaltvorgänge im folgenden Kapitel bestimmen.

Als erster Schritt wird die Differentialgleichung aufgestellt. 
Als zweiten Schritt bestimmen wir den flüchtigen Zustand, das heißt die Lösung der homogenen Differentialgleichung. 
Im dritten Schritt bestimmen wir den eingeschwungenen Zustand, das heißt die partikuläre Lösung der inhomogenen Differentialgleichung. 
Im vierten Schritt wird die allgemeine Lösung durch Überlagerung, das heißt durch Addition der homogenen Lösung und der partiklären Lösung bestimmt. 
Handelt es sich bei Schritt eins um eine homogene Differentialgleichung entfallen die Schritte drei und vier, dann entspricht unsere homogene Lösung der allgemeinen Lösung der D G L.
Im fünften Schritt bestimmen wir die Konstanten unserer allgemeinen Lösung durch Einsetzen der Anfangsbedingungen. 
Die Anfangsbedingungen ergeben sich aus den Stetigkeitsbedingungen für u C und i L, wenn diese vor dem Schaltzeitpunkt bekannt sind.

## Video 4

Willkommen zum vierten Video der Videoreihe für das Modul Schaltvorgänge. 
In diesem Video steigen wir ein in das Kapitel 3 **Schaltvorgänge im Zeitbereich berechnen**
und befassen uns mit den Themen aus Kapitel 3 punkt 1 **Schaltvorgänge bei Gleichspannung**. 

VIDEOZIELE

Für die praktischen Rechenbeispiele werden wir das fünf schrittige Berechnungsverfahren aus dem letzten Video einsetzen.

-SKIP

Bei Schaltvorgängen bei Gleichspannung kann es sich prinzipiell um **Ladevorgänge** oder um **Entladevorgänge** handeln.

-skip

Diese werden wir exemplarisch jeweils einmal für eine Kapazität C und jeweils einmal für eine Induktivität L, in allen Fällen in Reihe mit einem Widerstand R berechnen.

Können wir bereits abschätzen, wie die Lade- und Entladevorgänge bei Gleichspannung aussehen werden?

-skip

Wie aus den Grundlagen bekannt ist, ergibt sich für ein einfaches R C oder ein einfaches R L Glied 
jeweils eine **D G L erster Ordnung**, da in beiden Fällen nur ein Energiespeicher vorhanden ist (C oder L).

Die D G L wird daher die hier gezeigte Form: A eins mal erste Ableitung von y von t **plus** A null mal y von t ist gleich b annehmen.

Und wie sehen die Zeitverläufe prinzipiell aus?

-skip

Bei einer D G L **erster Ordnung** erhalten wir einen **einzelnen** Eigenwert lambda. 
Dadurch entstehen wie rechts im Diagramm dargestellt ist, charakteristischen Exponentialverläufe beim Laden und Entladen bei Gleichspannung. 
Die Exponentialform resultiert aus dem flüchtigen Zustand, das heißt der homogenen Lösung K mal e hoch lambda t für einfache Nullstellen. 

-SKIP

Beginnen wir links mit einem exemplarischen Schaltbild.
Das gezeigte R C Serienglied ist über einen Schalter entweder kurzgeschlossen 
oder an eine ideale Gleichspannungsquelle U q angeschlossen. 

Bevor wir im Detail die Zeitverläufe rechnerisch bestimmen, führen wir zunächst eine neue Größe ein, um konvergente Exponentialverläufe besser beschreiben zu können.

Wegen des einen Energiespeichers C, hat die D G L erste Ordnung und die Zeitverläufe haben die Form von Exponentialverläufen.

-skip

Rechts sehen wir im Zeitverlaufsdiagramm die Spannung u C an der Kapazität. 
Die Spannung u C ist zu Beginn null und steigt ab dem Schaltzeitpunkt t gleich null exponentiell bis zum Endwert U q.

Die dazughörige Gleichung ist: u C von t ist gleich U q (der Endwert) mal Klammer auf eins minus e hoch minus t durch tau Klammer zu. 
Der Term: Eins minus e hoch minus t durch tau, entspricht einer exponentiellen Annäherung von null an eins. 

-skip

Dieses **Tau** wird als **Zeitkonstante** bezeichnet und hat die gleiche Einheit wie die Zeit. 
Mithilfe von Tau lässt sich die Steilheit exponentieller Verläufe darstellen. 
Wie im Zeitverlauf oben rechts zu sehen ist, schneidet die Tangente von exponentiellen Verläufen nach einem Tau den Endwert. Das gilt zu jedem Zeitpunkt. 
In dem hier gezeigten Schaltbild entspricht die Zeitkonstante Tau dem Produkt aus R und C.

-skip

Die hier gezeigte Tabelle zeigt eine typische Werte exponentieller Annäherungen respektive exponentieller Abfälle, die nach **einem Tau**, nach **drei Tau** und nach **fünf Tau** erreicht werden. Die Werte dienen als wichtige Referenz zum Abschätzen wie weit fortgeschritten solche Verläufe nach wie viel Zeitkonstanten sind.

Eine exponentielle Annäherungen, hier in der oberen Zeile zu sehen, entspricht dem Term: eins **minus** e hoch minus t durch Tau.
Ein expeontieller Abfall, hier in der unteren Zeile zu sehen, entspricht dem Term: e hoch minus t durch Tau.
Beide Verläufe näheren sich einem Endwert (eins oder null), erreichen diesen aber nie.

Deshalb gilt als **Faustregel**, dass ein Exponentialverlauf **nach fünf Tau eingeschwungen** ist. 

Nach einem Tau ist der Endwert bereits zu etwa zwei Drittel erreicht, nach drei Tau bereits zu fünf und neunzig Prozent und nach fünf Tau zu über neunzig Prozent. 

Diese Faustregel ist in vielen Bereichen wie bei der Dimensionierung von Bauteilen, beim Abschätzen von Latenzen und ähnlichem.

-SKIP

Kommen wir zur eigentlichen Berechnung des Ladevorganges beim gerade gezeigten R C Glied. 
Oben links sehen wir die gegebenen Größen, das ist u C unmittelbar vor dem Schalten, die Quellenspannug u Q und die Komponenten R und C. 
Gesucht ist u C während des Schaltvorganges für t größer gleich null. 
Oben rechts sehen wir die Zeitverläufe für u C und darunter für den Strom i. 
**Wichtig**: Die Spannung u C ist stetig, der Strom i kann jedoch springen, was er in diesem Fall auch tut!
Unten sehen wir die 5 Schritte des Berechnungsverfahrens in Kurzform und die dazugehörigen Teillösungen die wir im folgenden Einzeln durch gehen.

-skip

Schritt eins ist das Aufstellen der D G L für unsere gesuchte Größe u c von t für den Zeitraum t größer gleich null, das heißt ab unmittelbar nach dem Schaltzeitpunkt t gleich null.

Wie im Beispiel in den Grundlagen beginnen wir mit der Maschengleichung:
u R plus u C ist gleich U q.

-skip

Dann ersetzen wir u R durch R mal i.

-skip

Und ersetzen i durch C mal d nach d t von u c. 

Wenn wir unsere D G L mit der allgemeinen Form oben rechts vergleichen, erkennen wir:
R C entspricht unserem konstanten Koeffizienten a eins. 
u c von t entspricht unserer Systemgröße y von t. 
Und die Quellenspannung U q entspricht der Störgröße b.

-SKIP

Um die flüchtige Lösung zu bestimmen, bestimmen wir als nächsten Schritt die Lösung der homogenen D G L, das heißt für die D G L ohne Störterm. 

Aus der D G L können wir direkt das charakteristische Polynom ableiten: R C mal lambda plus eins.
Die Nullstelle erhalten wir durch Umformung. Lambda ist gleich minus eins durch R C. 

Unsere homogene Lösung entspricht allgemein dem Exponentialansatz K mal e hoch lambda t.
Für eine bessere Lesbarkeit der Eigenschaften schreiben wir den Exponentialansatz in Abhängigkeit der Zeitkonstante auf. 
Unsere homogene Lösung ist K mal e hoch minus t durch Tau. 
Mit lambda ist gleich Minus eins durch Tau erhalten wir durch Einsetzen unserer Nullstelle den Wert für Tau. 
Hier folgt: Tau ist gleich R C. 

-skip

Die partikuläre Lösung, das heißt den eingeschwungenen Zustand für t gegen unendlich, erhalten wir entweder durch Netzwerkberechnung oder leiten ihn aus der D G L ab.
Für beide Herangehensweisen gilt, dass die eingeschwungenen Größen Gleichgrößen sind, weil die Anregung eine Gleichspannung ist. (D C Fall) 
Aus der Gleichstrom Netzwerkberechnung wissen wir, dass die Kapazität wie eine offene Klemme wirkt. Es fließt kein Strom und die gesamte Spannung U q liegt über C an.
Alternativ können wir wie hier gezeigt ist die D G L für die partikläre Lösung herannehmen.
Da es sich um Gleichgrößen handelt, ist die zeitliche Ableitung von u c p gleich Null und der erste Teil der D G L verschwindet.
Übrig bleibt, dass u C p gleich der Anregung U q ist. 

-SKIP

Die allgemeine Lösung der inhomogenen D G L erhalten wir durch Überlagerung unserer homogenen und unserer partiklären Lösung.

U c ist gleich u c h plus u c p. Oder alternativ ist gleich u c f plus u c e. 
Eingesetzt ergibt sich daraus die allgemein Lösung: u c von t ist gleich K mal e hoch minus t durch Tau plus U q. 

-skip

Die Konstanten bestimmen wir durch einsetzen der Anfangsbedingung. Die Kapazität sei zum Zeitpunkt t gleich Null unmittelbar vor dem Schalten vollständig entladen. 

Das heißt u c von t gleich null ist gleich K plus U q ist gleich Null aufgrund der Stetigkeitsbedingung. Der Exponentialterm e hoch minus null durch Tau ergibt eins und entspricht daher dem Faktor eins. 
Durch Umformung erhalten wir K ist gleich Minus U q und können die Konstante in unsere allgemeine Lösung einsetzen. 
Durch Ausklammern von U q und Umsortieren erhalten wir die spezielle allgemeine Lösung:
u c von t ist gleich U q mal Klammer auf eins minus e hoch minus t durch lambda Klammer zu. 

Den Strom können wir aus der Beziehung i gleich C mal d nach d t von u C an der Kapazität herleiten. 
In der gezeigten Lösung ist C durch tau bereits zu eins durch R gekürzt worden. 
Dadurch erhalten wir den Stromverlauf i c von t ist gleich U q durch R mal e hoch minus t durch Tau. 
Der Strom wird also durch Uq durch R begrenzt! 

## Video 5

INTRO
In diesem Video setzen wir das Beispiel aus dem letzten Video zu Schaltvorgängen bei Gleichspannung fort.
Ausgehend von der selben Schaltung bestimmen wir nun den Entladevorgang des R C Seriengliedes über einen Kurzschluss.

-skip

Das Vorgehen ist identisch zum Vorgehen beim Ladevorgang. 
Wir betrachten die gleiche Schaltung, hier oben links zu sehen, mit dem einzigen Unterschied, 
dass bei t gleich null von der Spannungsquelle zu einem Kurzschluss geschalten wird.
Gesucht ist wieder der Zeitverlauf für u C von t während des Schaltvorganges, alle Konstanten sind gegeben.
Oben rechts sehen wir bereits die Zeitverläufe für u C und für i.
U C ist zu Beginn vollständig geladen und fällt dann exponentiell ab bis null. 
Der Strom beginnt bei null und macht dann einen Sprung auf Minus U q durch R um sich von dort aus exponentiell der Null anzunähern.
Der Strom ist negativ wegen des Erzeugerzählpfeilsystems im Schaltdiagramm, da die Kapazität beim Entladen als Quelle dient. 
Hier beim Skizzieren immer auf die korrekten Vorzeichen achten. 

Unten sehen Sie die fünf Schritte im Berechnungsverfahren mit den jeweiligen Teillösungen die wir im Folgenden wieder einzeln durchgehen. 

-skip

Die D G L wird im gleichen Verfahren aufgestellt wie beim Ladevorgang. Der einzige Unterschied ist, dass unsere Masche statt der Spannungsquelle nun einen Kurzschluss enthällt. 
Dadurch entfällt die Anregung.
Unsere D G L entspricht damit exakt der homogenen D G L aus dem vorigen Beispiel beim Ladevorgang.

-skip

In Schritt drei können wir die homogene Lösung daher exakt aus der Lösung für den Ladevorgang übernehmen. 
Schritt vier entfällt, da die partikuläre Lösung gleich Null ist, weil es sich um eine homogene D G L handelt. (Triviale Lösung)
Anders gesagt, der eingeschwungene Zustand ist Null, da es keine Anregung gibt. 
Physikalisch betrachtet nähert sich für t gegen unendlich die Spannung u C wegen des Kurzschlusses der Null.
Unsere allgemeine Lösung entspricht also der homogenen Lösung.

In Schritt fünf bestimmen wir die Konstanten durch die Anfangsbedingung, dass u C zum Schaltzeitpunkt t gleich null vollständig geladen ist, also die Quellspannung U q beträgt.

Mit u c von null gleich K mal e hoch null gleich U q folgt K ist gleich U q.
Die speziefische allgemeine Lösung lautet daher uc von t ist gleich U q mal e hoch minus t durch Tau. 

Den Strom können wir wieder über die Strom Spannungsbeziehung von C bestimmen. 
Daraus ergibt sich für den Strom i C von t ist gleich Minus U q durch R mal e hoch minus t durch Tau.

-SKIP

Wenn wir den gerade betrachteten Lade- und Entladevorgang vergleichen, ergeben sich in beiden Fällen ähnliche Lösungen.

In beiden Fällen sind die Verläufe exponentialförmig mit der gleichen Zeitkonstante Tau ist gleich R C. 

Wenn wir die Anfangsbedingung allgemein als u c zum Schaltzeitpunkt t null formulieren. 
Und den eingeschwungenen Zustand mit allgemein als u c e bezeichnen,

können wir die Lösung für den Lade und den Entladevorgang der gezeigten Schaltung allgemein für einen Schaltzeitpunkt t null bestimmen.
Durch etwas Umformung können wir die Lösung in die folgende Form bringen:

In Worten: Die Spannung an der Kapazität ab Schaltzeitpunkt t null ist gleich der Startspannung plus einer exponentiellen Annäherung der Differenz von Endwert und Startwert.

Mathematisch ausgedrückt: u c von t minus t0 **ist gleich** u c von t null, der Startwert, **plus** Klammer auf, die Differenz u c e **minus** u c von t null, Klammer zu, **mal** klammer auf Eins minus Exponent minus t minus t null durch Tau Exponent Ende, die exponentielle Annäherung, Klammer zu. 

Die Rechenwege zur Berechnung von Lade- und Entladevorgängen bei D C Fällen sind prinzipiell **identisch**
und unterscheiden sich in diesem Beispiel nur beim Störterm (der Anregung), den Anfangsbedingungen und den eingeschwungenen Zuständen (den Endwerten).

-SKIP

Kommen wir nun zum Lade- und Entladevorgang eines R L Seriengliedes bei Gleichspannung. 
Die Schaltung ist identisch zu den Beispielen mit dem R C Glied aufgebaut, nur dass die Kapazität mit einer Induktivität ersetzt wurde.

Da es sich zum eine Schaltung mit nur einem Energiespeicher handelt, erhalten wir wieder eine D G L erster Ordnung. 
Im Gegensatz zur Kapazität ist hier allerdings i stetig und u L sprunghaft, da die Energie im Magnetfeld der Induktivität gespeicher ist. 

Als Vermutung können wir aufstellen, dass die Zeitverläufe prinzipiell ähnlich aussehen wie bei den D C Schaltvorgängen beim R C Glied.

Sie können das Video kurz pausieren und überlegen, 
ob die hier aufgestellte Gleichung für den Strom plausibel ist und
ob die Zeitverläufe oben rechts für den Strom i und die Spannung u L plausibel ist. 

Überlegen Sie sich, welche eingeschwungenen Zustände jeweils angestrebt werden. 

Wie könnt die Gleichung für die Zeitkonstante lauten? 

Zur Überprüfung bestimmen wir im folgenden detailliert den Ladevorgang und danach kurz den Entladevorgang der gezeigten Induktivität.

-SKIP

Beginnen wir beim Ladevorgang. Oben links sehen Sie das Schaltbild.
Zu Beginn ist das R L Glied kurzgeschlossen und ab t gleich null ist das R L Glied an die Spannungsquelle U q geschlossen.
Zu Beginn fließt kein Strom, U q, R und L sind bekannt, gesucht ist der Strom i für t größer gleich null.

Oben rechts sehen Sie die Zeitverläufe für u L und i. U l springt bei t gleich null von null auf U q.
Weil i stetig ist, fließt zu Beginn kein Strom und die volle Quellenspannung liegt über L an.
U L fällt dann exponentiell auf Null ab.
Der Strom nähert sich ab t gleich null exponentiell seinem Endwert U q durch R, da der Widerstand R den maximalen Strom begrenzt.

Unten sind die fünf Rechenschritte mit Teillösungen zusammen gefasst, welche wir im Folgenden einzeln durch gehen.

-SKIP

Die D G L stellen wir am Besten ausgehend von der Maschengleichung auf.
u R und u L ist gleich U q. 
Durch Einsetzen der Komponentengleichungen für R und für L erhalten wir die Gleichung in Abhängigkeit von unserer gesuchten Größe i:

L mal d nach d t von i plus R mal i ist gleich U q.

Theoretisch könnten wir nun bereits weiter rechnen, allerdings bietet es sich an, die D G L weiter umzuformen, dass unsere gesuchte Größe i ohne Koeffizienten einzeln steht.
Also teilen wir durch R und erhaltene eine D G L, bei der die Einzelterme die gleiche Einheit wie unsere gesuchte Größe haben.

-skip

Durch Aufstellen des charakteristschen Polnoms können wir den Eigenwert Lambda bestimmen.
Da die Lösung in Exponentialform auftritt, schreiben wir direkt Lambda ist gleich minus eins durch Tau ist gleich minus R durch L.

Dadurch können wir die homogene Lösung direkt in die Form K mal e hoch minus t durch Tau bringen mit Tau ist gleich L durch R.

-skip

Für die partikläre Lösung bestimmen wir den eingeschwungenen Zustand. Hier ist i p gleich U q durch R.

-SKIP

Die Allgemeine Lösung ergibt sich durch Überlagerung beider Lösungen.

-skip

und durch einsetzen unserer Anfangsbedingung bestimmen wir unsere Konstante.
i von null ist gleich K mal e hoch null plus U q durch R ist gleich Null.
Daraus folgt K ist gleich minus U q durch R.
Die eindeutige Lösung ergibt: UU q durch R mal Klammer auf eins minus e hoch minus t durch tau Klammer zu.

Die Spannung u L lässt sich über u L gleich L mal d nach d t von i bestimmen.
Durch Einsetzen und Vereinfachung folgt: u L ist gleich U q mal e hoch minus lambda durch tau.

Als Probe können wir überlegen, ob die Ergebnisse plausibel sind.
Der Strom i von t entspricht einer exponentiellen Annäherung an den maximalen Strom U q durch R.
Die Spannung fällt exponentiell ab vom Maximalwert U q.
Da die Induktivität lädt, passt die positive Spannung gemäß Verbraucherzählpfeilsystem.
Da der eingeschwungene Strom konstant ist, geht u L gegen null.
Beide Ergebnisse sind also korrekt.

-skip

Der Entladevorgang der Induktivität über L lässt sich analog zum Ladevorgang berechnen und ist hier nur kurz als Zusammenfassung dargestellt.
Oben links sehen sie wieder das Schaltbild und rechts die Zeitverläufe für u L und für i beim Entladen.
Die fünf Schritte mit Teillösungen sind unten wieder zusammen gefasst.

Wichtig: Die Zeitkonstante tau ist gleich für den Lade- und für den Entladevorgang!
Hier: Tau gleich L durch R.

Als Übung können Sie:
erstens Zeitverlauf für i und für u L bestimmen,
zweitens die Zeitkonstante Tau allgemein bestimmen.

Im nächsten Video geht es weiter mit Schaltvorgängen bei sinusförmigen Anregungen. 


## Video 6



# Speech Texte für Videos
-------------------------

## Video Gliederung

__Modul 12__

Text Drafts:
- [x] K1.1-3 03-09:	L. K1, Intro (Gesamtübersicht), Einführung Ausgleichsvorgänge
- [x] K2.1-3 10-17:	L. K2, *Def.*, *Berechn.meth.* (Zeit/Bild), *DGL* (Schaltung <-> GL), Aufstell. (Zeit/Bild) + Bsp., Ordnung u. Energiespeich.
- [x] K2.4   18-23: *Berechnung im Zeitb.*, Anfangsbed., Zerlegung y=yh+yf, Lsg. yh, Bsp. yh; Lsg. yp, Merke 5 Steps
- [x] K3.1   24-30: L. K3, Schaltvorgänge bei Gleichspannung: Beispiel RC Laden, Zeitkonstante einführen, 5 Steps short und Detail
- [x] K3.1   31-40: Bsp. RC Entladen, 5 Steps detail; Vgl RC Laden/Entladen, Vgl. RL (zu erwartend), RL Laden 5 steps Detail, RL Entladen 5 Steps short
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
