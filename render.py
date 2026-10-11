"""
Licht & Weite – Posts als PNG erzeugen (1080 x 1350).

Aufruf:
    python render.py inhalt.json            -> PNGs im Ordner "ausgabe/"
    python render.py inhalt.json meinordner

inhalt.json enthält EIN Objekt oder eine LISTE von Objekten mit denselben Feldern
wie der INHALT-Block in vorlage_post.html. Optionales Feld "datei" = Dateiname des PNG.

Voraussetzung:  pip install playwright  &&  python -m playwright install chromium
"""
import asyncio, json, sys, pathlib
from playwright.async_api import async_playwright

HIER = pathlib.Path(__file__).resolve().parent
VORLAGE = (HIER / 'vorlage_post.html').as_uri()


async def main(src, out):
    daten = json.loads(pathlib.Path(src).read_text(encoding='utf-8'))
    if isinstance(daten, dict):
        daten = [daten]
    out = pathlib.Path(out); out.mkdir(parents=True, exist_ok=True)
    fehler = 0
    async with async_playwright() as p:
        b = await p.chromium.launch()
        for i, d in enumerate(daten, 1):
            pg = await b.new_page(viewport={'width': 1080, 'height': 1350})
            await pg.add_init_script('window.INHALT_OVERRIDE = ' + json.dumps(d, ensure_ascii=False) + ';')
            await pg.goto(VORLAGE)
            await pg.wait_for_function('window.FIT_STATUS !== undefined', timeout=15000)
            await pg.wait_for_timeout(250)
            status = await pg.evaluate('window.FIT_STATUS')
            name = d.get('datei') or f'post_{i:02d}.png'
            await pg.locator('#post').screenshot(path=str(out / name))
            ok = ('HINWEIS: stark verkleinert – kürzen empfohlen' if status['verkleinert'] else 'OK') if status['ok'] else 'ZU LANG'
            if not status['ok']:
                fehler += 1
            print(f'{out / name}  ->  {ok}   (Titel {status["titel_px"]}px, Text {status["text_px"]}px)')
            await pg.close()
        await b.close()
    if fehler:
        print(f'\n{fehler} Post(s) mit zu viel Text – bitte kürzen oder aufteilen.')


if __name__ == '__main__':
    if len(sys.argv) < 2:
        print(__doc__); sys.exit(1)
    asyncio.run(main(sys.argv[1], sys.argv[2] if len(sys.argv) > 2 else HIER / 'ausgabe'))
