# Gothic II: Noc Havrana - Návraty 2.0 - CZ

(český preklad a zdrojové súbory modifikácie **Готика 2: Возвращение 2.0**)

---

## [Download:](https://github.com/helpo1/Navraty-CZ/releases)
- **[v1.02](https://github.com/helpo1/Navraty-CZ/releases/tag/v1.02)** (aktuálna verzia)
- [v1.01](https://github.com/helpo1/Navraty-CZ/releases/tag/v1.01)
- [v1.00](https://github.com/helpo1/Navraty-CZ/releases/tag/v1.00)

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
      - lepší výkon a funkcionalitu je možné dosiahnuť s aktuálnejšími verziami/forkmi DX11 (napr. [kirides/GD3D11](https://github.com/kirides/GD3D11/releases)) - kvôli stále prebiehajúcemu vývoju DX11 však kompatibilita s budúcimi verziami nie je stopercentne zaručená
4. (voliteľné) vložiť jednu z verzií [NoGrass patchu](https://yadi.sk/d/uumUOh_U3GSSyL) do `(...)\Data\`
   - `noGRASS.vdf` - odstránenie trávy
   - `noGRASS_all.vdf` - odstránenie všetkého porastu (okrem stromov)
   - `noGRASS_full.vdf` - odstránenie všetkého porastu (vrátane stromov)
   - `noGRASS_full_all.vdf` - ostránenie všetkého porastu (vrátane stromov, paliem, vodných rastlín apod.)

5. nainštalovať češtinu:
   - **automaticky**
     1. stiahnuť a spustiť [inštalátor](https://github.com/helpo1/Navraty-CZ/releases/latest)
	 2. vybrať požadované voliteľné súčasti:
	    - **(odporúčané)** alternatívny obrázok pozadia hlavného menu
		- **(odporúčané)** [Gothic Discord Rich Presence](https://github.com/helpo1/GDRPC) (v1.00) pre Návraty 2.0
	   - pozn.: češtinu je možné kedykoľvek odinštalovať spustením súboru `N2.0-CZ-v[verzia češtiny]_Uninst.exe` v adresári s hrou

   **ALEBO**
   - **manuálne**
     1. odstrániť všetky súčasti predošlých verzií češtiny (`Returning2CZ`, `R2_BETA_##`, `TexturesCZ`, staršie verzie nižšie uvedených súborov)
     2. `CZScripts###.vdf` vložiť do `(...)\Data\`
     3. `CZFonts###.vdf` vložiť do `(...)\Data\`
     4. *(voliteľné)* `CZStartScreen###.vdf` vložiť do `(...)\Data\`
	 5. *(voliteľné)*  GDRPC:
        - `libdiscord-rpc.dll`, `orgVdfs32g.dll` a `vdfs32g.dll` vložiť do `(...)\System\`
		- `GDRPC-CZ-R2.ini` premenovať na `GDRPC.ini` **(nutné!)** a vložiť do `(...)\System\`
     6. `AST###.dll` premenovať na `AST.dll` **(nutné!)** a vložiť do `(...)\System\`

---

### Poznámky:

- číslovanie verzií jednotlivých súborov sa nemusí zhodovať - v budúcnosti môže jeden balík CZ obsahovať napríklad skripty v1.04, fonty v1.01, úvodný obrázok v1.00 a AST v1.02

- verzia hry uvedená v hlavnom menu označuje len **verziu balíku AST**; verzia skriptov je dohľadateľná po spustení novej hry (v úvodných titulkoch) alebo v knihe nastavení

- v prípade, že dôjde k výraznejšiemu updatu, po ktorom už niektoré súčasti nebudú naďalej vzájomne kompatibilné so staršími verziami ostatných súborov, dôjde zároveň aj k zjednoteniu číslovania verzií a rekompilácii všetkých súčastí balíka (napr. na skripty, fonty, obrázok i AST v1.05)
  - podporované sú vždy len kompletné balíky (t.j. tie, ktoré sú [na tejto stránke](#download) spoločne uverejnené v jednom archíve); používanie iných kombinácií je síce možné, ale iba na vlastné riziko

- pri každej verzii hry aj prekladu stále platí odporúčanie **ukladať na čo najviac rôznych pozícií** a pred začiatkom novej hry **vymazať/presunúť obsah zložky `\Saves`** v adresári s hrou

- changelogy výraznejších zásahov do kódu sú oddelené ([hlavná časť skriptov](/CZ-Main/CZ-Main-Changelog.txt) a [menu](/CZ-Menu/CZ-Menu-Changelog.txt))

---

### Známe (neopravené) bugy:

##### ~~Výrazný pokles FPS pri zapnutom zobrazovaní dodatočných informácií na obrazovke (kláves I)~~
- ~~zdroj - ikony pri niektorých štatistikách (karma, hlad/smäd/únava, šípy/šípky)~~
- ~~workaround - vypnúť zobrazovanie problémových štatistík, odložiť luk/kušu~~
- **vyriešené** (v1.02+)

##### Hra aj s češtinou v1.02+ stále používa starý (AST) freeaim modul namiesto nového (GFA)
- príznaky:
  - nepresná registrácia zásahu (strela vizuálne zasiahne NPC/monštrum, ale "netrafí" ho)
  - počas mierenia sa nedá plynulo pohybovať
- zdroj - nesprávne nastavenia AST freeaim modulu (napr. kvôli čistej inštalácii hry / hraní s AST freeaimom pred v1.02)
- riešenie - manuálne v `Gothic.ini` v sekcii `[AST]` nastaviť `AutoAIM=1` (a v sekcii `[GFA]` ponechať `freeAimingEnabled=1`)

---

### FAQ:

##### Q: Po (manuálnom) nainštalovaní češtiny sa namiesto znakov s diakritikou zobrazuje cyrilika
- A: viď body **3.iv.)** a **5.iii.)** [odporúčaného postupu inštalácie](#odporúčaný-postup-inštalácie)
  - pokiaľ už fonty z bodu 3.iv.) nainštalované sú, manuálne ich vymazať (súbor `(...)\Data\RET2_Font_High_Resolution.vdf`)

##### Q: Po (manuálnom) nainštalovaní češtiny nie sú preložené štatistiky, recepty atď. (záložky dostupné pod B/C)
- A: viď bod **5.v.)** [odporúčaného postupu inštalácie](#odporúčaný-postup-inštalácie)

---

### Úpravy `Gothic.ini` a nastavení obtiažnosti v hre
Po prvom načítaní hry / spustení novej hry a úvodnom dialógu sa v súbore `(...)\System\Gothic.ini` vytvoria nové sekcie v nasledovnom tvare:

```ini
[CZ_SETTINGS_OTHER]                ; predvolené hodnoty : (popis nastavenia)
OtherInitialized=1                 ; def:  1            : (interná premenná)
DialogueNumKeysControl=1           ; def:  1            : zapnutie / vypnutie upraveného ovládania dialógových možností číslami
DialogueNumKeysShow=1              ; def:  1            : zapnutie / vypnutie zobrazovania čísel vedľa dialógových možností
OutputGDRPC=1                      ; def:  1            : zapnutie / vypnutie Discord integrácie cez Discord Rich Presence
ShowSkillChecks=1                  ; def:  1            : zapnutie / vypnutie zobrazovania skill checkov v dialógoch

[GFA]
freeAimingEnabled=1                ; def:  1            : (pre bližší popis GFA nastavení pozri
focusUpdateIntervalMS=0            ; def:  0            :  https://github.com/szapp/GothicFreeAim/wiki/Free-Aiming#ini-settings)
showFocusWhenNotAiming=0           ; def:  0            :
reticleSizePx=64                   ; def:  64           :
overwriteControlSchemeRanged=2     ; def:  2            : predvolene: G2 schéma ovládania (mierenie pravým tlačidlom myši, streľba tlačidlom akcie; umožňuje pohyb vpred počas mierenia)
overwriteControlSchemeSpells=2     ; def:  2            :   alternatívne: G1 schéma ovládania (mierenie tlačidlom akcie, streľba tlačidlom pohybu vpred; neumožňuje pohyb vpred počas mierenia)
```

a vypíše sa text `Inicializuji ostatní nastavení v Gothic.ini...`.

Nastavenia obtiažnosti boli od verzie 1.02+ **presunuté z `Gothic.ini` priamo do hry prostredníctvom knihy nastavení** a sú uchovávané pre každú uloženú hru samostatne. Sekcia `CZ_SETTINGS_DIFF` z CZ v1.01 už na hru nemá žiaden vplyv.

Pokiaľ chce hráč zmeniť niektoré z nastavení obtiažnosti, je potrebné otvoriť knihu nastavení v inventári a podľa pokynov nastaviť jednotlivé hodnoty. V štatistikách sa pri názve obtiažnosti zobrazí poznámka ` (upr.)`.

Pri zmene nastavení v sekcii Ostatné (`CZ_SETTINGS_OTHER`) stačí vypnúť hru, zmeniť príslušné hodnoty a znovu zapnúť hru.

---

### Ďalšie odkazy:

[**Gothicz.net**](http://forum.gothicz.net/viewtopic.php?f=358&t=22017) - hlavné centrum česko-slovenskej Gothic komunity

[**Discord - ThePreklad**](https://discord.gg/m6uTbZj) - všeobecný server o Návratoch a preklade; najrýchlejší spôsob bugtrackingu (okrem GitHubu) a kontaktovania autorov

[**Discord - Gothicz.net**](https://discord.gg/uCybrpX) - všeobecný server česko-slovenskej Gothic komunity

[**GitHub**](https://github.com/helpo1/Navraty-CZ) (tento repozitár) - download, komplexné informácie a zverejnené skripty pôvodnej (RU, read-only) aj preloženej (CZ) verzie; gramatické, štylistické a ďalšie chyby v texte (najmä dialógoch) môžete opravovať priamo tu, väčšie zmeny alebo zásahy do kódu publikujte len po verejnej diskusii a väčšinovom súhlase, najlepšie aj na (aspoň) jednom z ostatných dvoch vyššie uvedených uvedených miest
