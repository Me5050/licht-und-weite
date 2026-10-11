# Licht & Weite

Instagram-Vorlage (1080 × 1350 px) der Designrichtung D für das Projekt **„Jesus auch Muslim“**. Die Posts erklären christlich geprägten und neugierigen Menschen die islamische Sicht auf Jesus (ʿĪsā) anhand von Koranversen und Hadithen – sachlich, respektvoll, mit sichtbarer Quelle.
## Inhalt

| Pfad | Zweck |
|---|---|
| `PROMPT_Licht_und_Weite.md` | Prompt-Schablone: Teil 1 fest, Teil 2 Lückenformular für Titel, Quelle, Vers/Hadith und Übersetzung, Teil 3 Bild-KI-Prompt |
| `vorlage_post.html` | Post-Vorlage mit eingebetteten Schriften; nur den Block `INHALT` ausfüllen |
| `render.py` | Erzeugt PNGs aus einer JSON-Datei und meldet zu lange Texte |
| `hintergruende/` | Sechs Hintergründe (Wüstendünen in verschiedenen Lichtstimmungen) |
| `beispiele/` | Beispielinhalte (`beispiel_inhalt.json`) und die daraus erzeugten Posts |

## Verwendung

**Mit einer KI (empfohlen):** Neuen Chat öffnen, die Dateien anhängen, Teil 1 des Prompts einfügen, darunter Teil 2 ausfüllen. Ergebnis: fertige PNGs.

**Direkt im Browser:** `vorlage_post.html` öffnen, den Block `INHALT` im Quelltext anpassen, neu laden.

**Per Skript:**

```bash
pip install playwright
python -m playwright install chromium
python render.py beispiele/beispiel_inhalt.json ausgabe
```

`inhalt.json` enthält ein Objekt oder eine Liste von Objekten mit den Feldern
`hintergrund, kopf_rechts, arabischer_begriff, begriff_position, titel, titel_akzent, label, arabischer_text, text, quelle_links, quelle_rechts, aufruf, zaehler, datei`.

## Gestaltung in Kürze

- **Farben:** Nachtblau `#1D1F3E` · Morgengold `#D9A45B` · Sand `#F4ECDF` · Düne `#E8D3B4` · Tiefnacht `#12132A` · Lichtweiß `#FBF4E8`
- **Schriften:** Cormorant Garamond (Titel, Text) · Inter (Auszeichnung) · Amiri (Arabisch) – alle unter SIL Open Font License
- **Raster:** Kopfzeile 70 px · Titel ab 248 px · Quellenkarte endet 190 px über dem Rand · Seitenrand 84 px

Die vollständige Spezifikation steht im Prompt (Teil 1).

## Hinweise

- Die Hintergrundbilder sind computergenerierte Platzhalter.
- Beispielinhalte sind sinngemäß wiedergegeben. Übersetzungen und arabischer Text sind vor jeder Veröffentlichung fachlich zu prüfen.
- Keine Personen- oder Prophetendarstellungen, keine Symbole anderer Religionen in Bildern.
