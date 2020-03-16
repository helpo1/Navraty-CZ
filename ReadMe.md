# Gothic II: Noc Havrana - Návraty 2.0 - CZ

(český preklad a zdrojové súbory modifikácie **Готика 2: Возвращение 2.0**)

---

## [Download:](https://github.com/helpo1/Navraty-CZ/releases)
- [v1.00](https://github.com/helpo1/Navraty-CZ/releases/tag/v1.00) (aktuálna verzia)

---

## Odporúčaný postup inštalácie:
1. vykonať *čistú* inštaláciu Gothic 2 Gold Edition (referenčná verzia: [GOG.com DE](https://www.gog.com/game/gothic_2_gold_edition))
2. nainštalovať potrebný software priložený na inštalačnom disku Návratov - [Google Drive](https://drive.google.com/file/d/1OymeXz9tHwRq0AQNCD3C8yp5-hvIHf7c/view) / [Yandex Disk](https://yadi.sk/d/nueDqvB43JL6Fx)
   - Microsoft Visual C++, DirectX - iba ak sa v systéme (konkrétne tieto verzie) ešte nenachádzajú
   - Report Version, PlayerKit
3. nainštalovať Návraty (Russian Version Installation) a voliteľné súčasti:
   1. **(ÁNO)** Russification for GoG/Steam
   2. **(ÁNO)** RAM extension to 4 Gb (Win64)
   3. **(ÁNO)** Update of library Shw32.dll
   4. **(NIE)** Fonts for high resolutions
   5. *(voliteľné)* Original music by KaiRo
   6. *(voliteľné)* Camera for the render DX11 + Render DX11 - referenčná verzia z technických príčin DX11 nepoužíva
4. (voliteľné) vložiť jednu z verzií [NoGrass patchu](https://yadi.sk/d/uumUOh_U3GSSyL) do `(...)\Data\`
   - `noGRASS.vdf` - odstránenie trávy
   - `noGRASS_all.vdf` - odstránenie všetkého porastu (okrem stromov)
   - `noGRASS_full.vdf` - odstránenie všetkého porastu (vrátane stromov)
   - `noGRASS_full_all.vdf` - ostránenie všetkého porastu (vrátane stromov, paliem, vodných rastlín apod.)

5. nainštalovať češtinu:
   1. odstrániť všetky súčasti predošlých verzií češtiny (`Returning2CZ`, `R2_BETA_##`, `TexturesCZ`, staršie verzie nižšie uvedených súborov)
   2. `CZScripts###.vdf` vložiť do `(...)\Data\`
   3. `CZFonts###.vdf` vložiť do `(...)\Data\`
   4. *(voliteľné)* `CZStartScreen###.vdf` vložiť do `(...)\Data\`
   5. `AST###.dll` premenovať na `AST.dll` **(nutné!)** a vložiť do `(...)\System\`

---

### Poznámky:

- číslovanie verzií jednotlivých súborov sa nemusí zhodovať - v budúcnosti môže jeden balík CZ obsahovať napríklad skripty v1.04, fonty v1.01, úvodný obrázok v1.00 a AST v1.02

- verzia hry uvedená v hlavnom menu označuje verziu AST; verzia skriptov je dohľadateľná po spustení novej hry (v úvodných titulkoch)

- v prípade, že dôjde k výraznejšiemu updatu, po ktorom už niektoré súčasti nebudú naďalej vzájomne kompatibilné so staršími verziami ostatných súborov, dôjde zároveň aj k zjednoteniu číslovania verzií a rekompilácii všetkých súčastí balíka (napr. na skripty, fonty, obrázok i AST v1.05)
  - podporované sú vždy len kompletné balíky (t.j. tie, ktoré sú [na tejto stránke](#download) spoločne uverejnené v jednom archíve); používanie iných kombinácií je síce možné, ale iba na vlastné riziko

- pri každej verzii hry aj prekladu stále platí odporúčanie **ukladať na čo najviac rôznych pozícií**

- changelogy výraznejších zásahov do kódu sú oddelené ([hlavná časť skriptov](/CZ-Main/CZ-Main-Changelog.txt) a [menu](/CZ-Menu/CZ-Menu-Changelog.txt))

---

### Známe (neopravené) bugy:

##### Výrazný pokles FPS pri zapnutom zobrazovaní dodatočných informácií na obrazovke (kláves I)
- zdroj - ikony pri niektorých štatistikách (karma, hlad/smäd/únava, šípy/šípky)
- workaround - vypnúť zobrazovanie problémových štatistík, odložiť luk/kušu

---

### Ďalšie odkazy:

[**Gothicz.net**](http://forum.gothicz.net/viewtopic.php?f=358&t=22017) - hlavné centrum česko-slovenskej Gothic komunity

[**Discord - ThePreklad**](https://discord.gg/m6uTbZj) - všeobecný server o Návratoch a preklade; najrýchlejší spôsob bugtrackingu (okrem GitHubu) a kontaktovania autorov

[**Discord - Gothicz.net**](https://discord.gg/uCybrpX) - všeobecný server česko-slovenskej Gothic komunity

[**GitHub**](https://github.com/helpo1/Navraty-CZ) (tento repozitár) - download, komplexné informácie a zverejnené skripty pôvodnej (RU, read-only) aj preloženej (CZ) verzie; gramatické, štylistické a ďalšie chyby v texte (najmä dialógoch) môžete opravovať priamo tu, väčšie zmeny alebo zásahy do kódu publikujte len po verejnej diskusii a väčšinovom súhlase, najlepšie aj na (aspoň) jednom z ostatných dvoch vyššie uvedených uvedených miest
