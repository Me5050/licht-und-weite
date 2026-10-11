# Prompt-Schablone „Licht & Weite“

**So benutzt du sie:**

1. Neuen Chat öffnen und das Vorlagenpaket anhängen: `vorlage_post.html`, `render.py` und den Ordner `hintergruende/` (oder die ZIP-Datei).
2. Den Prompt aus Teil 1 unverändert hineinkopieren.
3. Darunter Teil 2 einfügen und nur die Felder in `[ … ]` ausfüllen. Für mehrere Posts den Block „POST“ kopieren.
4. Ergebnis: fertige PNGs in 1080 × 1350 px.

Ohne Vorlagenpaket funktioniert der Prompt auch, weil die vollständige Design-Spezifikation enthalten ist. Das Paket liefert aber das genaueste Ergebnis.

---

## TEIL 1 · Fester Prompt (immer gleich, nicht ändern)

```
Du gestaltest Instagram-Posts für das islamische Informationsprojekt „Jesus auch Muslim“.
Zielgruppe: christlich geprägte und neugierige Menschen. Gemeinsamer Bezugspunkt ist Jesus (ʿĪsā).
Verwende ausschließlich das Designsystem „Licht & Weite“. Erfinde kein neues Layout.

ARBEITSWEISE
1. Wenn vorlage_post.html, render.py und hintergruende/ angehängt sind:
   - Verwende nur diese Vorlage. CSS, Maße, Farben und Schriften dürfen nicht verändert werden.
   - Übertrage meine Angaben aus „INHALT“ in eine JSON-Datei mit den Feldern der Vorlage
     (hintergrund, kopf_rechts, arabischer_begriff, begriff_position, titel, titel_akzent, label,
     arabischer_text, text, quelle_links, quelle_rechts, aufruf, zaehler, datei).
   - Erzeuge die PNGs mit: python render.py inhalt.json ausgabe
     (Falls nötig vorher: pip install playwright und python -m playwright install chromium.)
2. Wenn keine Vorlage angehängt ist: Baue den Post als HTML exakt nach der DESIGN-SPEZIFIKATION
   unten und exportiere ihn als PNG mit 1080 × 1350 px.
3. Gib mir zurück: die PNG-Datei(en) und die verwendete JSON, damit ich sie wiederverwenden kann.

FELDZUORDNUNG
- label: QUELLENTYP Koran → „Was der Koran sagt“ · Hadith → „Was der Hadith sagt“
  · Vergleich → „Im Vergleich“ · sonst den eingetragenen Text verwenden.
- quelle_links: QUELLE + " · " + TEXTTYP
  (TEXTTYP „sinngemäß“ → „sinngemäß“; „wörtlich – Übersetzung: NAME“ → „Übers. NAME“).
- quelle_rechts: ZUSATZ RECHTS (Surenname bei Koran, Einstufung bei Hadith).
- hintergrund: hintergruende/<NAME>.jpg
- titel: Zeilenumbrüche aus meinem Eintrag mit \n übernehmen.
- aufruf: bei „Standard“ → „Mehr zur islamischen Sicht – per Direktnachricht.“
- datei: post_<KOPFZEILE ohne Leerzeichen>.png
- Felder mit „–“ oder leer bleiben leer; die Vorlage blendet sie dann aus.

INHALTLICHE REGELN (verbindlich)
- Verwende nur die Inhalte, die ich eintrage. Erfinde keine Verse, Hadithe, Stellenangaben,
  Übersetzungen, Einstufungen oder arabischen Texte und ergänze sie nicht.
- Arabischen Text Zeichen für Zeichen übernehmen. Nicht selbst vokalisieren, korrigieren oder kürzen.
- Fehlt ein Pflichtfeld (TITEL, DEUTSCHER TEXT, QUELLE, TEXTTYP), frag nach, statt zu raten.
- Ist ein Feld mit „VORSCHLAG“ markiert (nur bei TITEL, TITEL-AKZENT oder AUFRUF erlaubt):
  Mach einen Vorschlag im Ton des Projekts und kennzeichne ihn in deiner Antwort als Vorschlag.
- Tonalität: sachlich, respektvoll, bestimmt. Die islamische Perspektive wird klar benannt
  („Im Islam …“, „Der Koran …“). Keine Emojis, keine Umgangssprache, keine Ironie und keine
  Herabsetzung des Christentums. Behaupte keine gleiche Christologie von Islam und Christentum.
- Anrede einheitlich: [Sie]
- Längen: TITEL max. 2 Zeilen à ca. 14 Zeichen · TITEL-AKZENT 1 Zeile, ca. 22 Zeichen
  · DEUTSCHER TEXT ideal ≤ 160 Zeichen, max. 220 · ARABISCHER VERSTEXT max. ca. 60 Zeichen.
  Ist ein Text länger, kürze ihn NICHT eigenmächtig. Melde es und schlag eine Aufteilung
  auf zwei Posts (Karussell) vor.
- Bilder: keine Personen und keine Prophetendarstellungen (auch keine Silhouetten),
  keine Symbole anderer Religionen, keine erkennbaren realen Gebäude.

QUALITÄTSKONTROLLE (vor der Ausgabe, für jeden Post)
- PNG ansehen: Überlappt der Titel die Karte? Ist ein Text abgeschnitten? Ist alles lesbar?
- render.py meldet „ZU LANG“ oder „stark verkleinert“ → mir melden und Aufteilung vorschlagen.
- Stellenangabe, Texttyp und arabischen Text mit meinen Angaben abgleichen.
- Stimmt die Position des arabischen Begriffs mit dem Bild überein? Bei Mond oder Sonne
  oben rechts → „links“.

DESIGN-SPEZIFIKATION „LICHT & WEITE“ (nur nötig, wenn keine Vorlage angehängt ist)
Format: 1080 × 1350 px. Hintergrundbild vollflächig (cover). Motiv: Wüstendünen unter
weitem Himmel (Morgenlicht, Sternenhimmel, Dämmerung mit Mondsichel, blaue oder goldene
Stunde); obere ~60 % ruhiger Himmel, untere ~40 % Dünen.
Farben: Nachtblau #1D1F3E · Morgengold #D9A45B · Sand #F4ECDF · Düne #E8D3B4
· Tiefnacht #12132A · Lichtweiß #FBF4E8.
Schriften: Cormorant Garamond (Titel, Kerntext) · Inter (Labels, Quellen, Fußzeile)
· Amiri (Arabisch).
Abdunklung über dem Bild:
  oben: linear-gradient(180deg, rgba(14,14,36,.55) 0 %, transparent 38 %)
  unten: linear-gradient(0deg, rgba(14,12,30,.62) 0 %, rgba(14,12,30,.15) 26 %, transparent 42 %)
Kopfzeile: top 70, links/rechts 84; links fix „JESUS AUCH MUSLIM“, rechts KOPFZEILE;
  Inter 600, 21 px, Laufweite 0,32 em, Versalien, Sand 90 %; darunter eine 1,5-px-Linie in Morgengold 75 %,
  Abstand 22 px.
Arabischer Begriff: top 150, rechts (oder links) 84; Amiri 50 px, Morgengold, RTL.
Titel: top 248, links/rechts 80; Cormorant Garamond 600, 128 px, Zeilenhöhe 1,0,
  Laufweite −0,01 em, Lichtweiß, Schatten 0 2 30 rgba(10,10,30,.35).
  Akzentzeile: eigene Zeile, kursiv 500, Morgengold, 10 px Abstand.
Quellenkarte: links/rechts 84, unten 190; Innenabstand 46/52/40; Radius 6;
  Hintergrund rgba(18,19,42,.42) mit 14 px Hintergrund-Unschärfe; Rand 1 px rgba(244,236,223,.22).
  · Label: Inter 600, 19 px, Laufweite 0,28 em, Versalien, Morgengold, 24 px Abstand nach unten.
  · Optional arabischer Verstext: Amiri 40 px, Düne, RTL, rechtsbündig, feine Linie darunter.
  · Kerntext: Cormorant Garamond 500, 47 px, Zeilenhöhe 1,22, Lichtweiß.
  · Quellenzeile: 30 px Abstand nach oben, Linie 1 px Morgengold 50 %; Inter 600, 19 px,
    Laufweite 0,22 em, Versalien, Sand 85 %; links Quelle, rechts Zusatz.
Fußzeile: unten 78, links/rechts 84; links Aufruf (Inter 500, 25 px, Sand 95 %),
  rechts Zähler (Inter 600, 19 px, Laufweite 0,2 em, Morgengold).
Bei zu langem Text zuerst den Titel bis 100 px, dann den Kerntext bis 38 px verkleinern.
Zwischen Titel und Karte bleiben mindestens 36 px Abstand.
```

---

## TEIL 2 · Inhalt (für jeden Post ausfüllen)

```
INHALT

=== POST ===
HINTERGRUND:               [01_morgenlicht | 02_sternenhimmel | 03_daemmerung_mondsichel | 04_morgenlicht_links | 05_blaue_stunde | 06_goldene_stunde]
KOPFZEILE RECHTS:          [z. B. Quelle 04 / Hadith 02]
QUELLENTYP:                [Koran | Hadith | Vergleich]
ARABISCHER BEGRIFF:        [kurzer Schlüsselbegriff, 1–4 Wörter – oder –]
POSITION BEGRIFF:          [rechts | links]
TITEL (weiß):              [Zeile 1]
                           [Zeile 2 – oder –]
TITEL-AKZENT (gold):       [eine kurze Zeile – oder – oder VORSCHLAG]
ARABISCHER VERSTEXT:       [nur kurze Verse – oder –]
DEUTSCHER TEXT:            [Übersetzung oder Inhaltsangabe des Verses bzw. Hadith]
TEXTTYP:                   [sinngemäß | wörtlich – Übersetzung: NAME]
QUELLE:                    [z. B. Koran 19:30 | Sahih al-Bukhari 3442]
ZUSATZ RECHTS:             [Surenname, z. B. Maryam | Einstufung, z. B. ṣaḥīḥ – oder –]
AUFRUF:                    [Standard | eigener Text]
ZÄHLER:                    [z. B. 04 / 06 – oder –]
```

### Ausgefülltes Beispiel

```
INHALT

=== POST ===
HINTERGRUND:               05_blaue_stunde
KOPFZEILE RECHTS:          Quelle 04
QUELLENTYP:                Koran
ARABISCHER BEGRIFF:        عَبْدُ ٱللَّهِ
POSITION BEGRIFF:          rechts
TITEL (weiß):              Diener
                           Gottes.
TITEL-AKZENT (gold):       Seine ersten Worte.
ARABISCHER VERSTEXT:       قَالَ إِنِّي عَبْدُ ٱللَّهِ آتَانِيَ ٱلْكِتَابَ وَجَعَلَنِي نَبِيًّا
DEUTSCHER TEXT:            Jesus sagte: Ich bin der Diener Gottes. Er hat mir die Schrift gegeben und mich zum Propheten gemacht.
TEXTTYP:                   sinngemäß
QUELLE:                    Koran 19:30
ZUSATZ RECHTS:             Maryam
AUFRUF:                    Standard
ZÄHLER:                    04 / 06
```

*(Beispielinhalt. Übersetzung und arabischer Text sind vor Veröffentlichung fachlich zu prüfen.)*

---

## TEIL 3 · Bild-KI-Prompt für neue Hintergründe (optional)

Für weitere Motive in derselben Bildwelt, z. B. mit ChatGPT, Gemini, Firefly, Midjourney oder Canva. Nur `[MOTIV]` austauschen:

```
Vertical 4:5 background image, 1080×1350. Vast, empty desert dunes under a wide sky, [MOTIV].
Calm, contemplative, cinematic, soft haze, fine sand texture, gentle light on the dune crests.
Color palette: deep night blue (#1D1F3E), warm morning gold (#D9A45B), sand (#E8D3B4).
Upper 60 % of the image is calm, empty sky (space for text); dunes in the lower 40 %.
No people, no silhouettes, no animals, no buildings, no religious symbols, no text, no letters, no watermark.
```

**Vorschläge für [MOTIV]:**

- `first light at dawn, sun just above the horizon on the right`
- `clear night sky full of stars and a faint milky way`
- `dusk, thin crescent moon in the upper right, last warm light on the horizon`
- `blue hour, cool lavender light, a few faint stars`
- `golden hour, low warm sun, long soft shadows`

Neue Bilder einfach in `hintergruende/` ablegen und im Feld HINTERGRUND mit Dateinamen angeben.
