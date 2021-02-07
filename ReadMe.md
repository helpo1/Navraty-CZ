# Gothic II: Noc Havrana - Návraty 2.0 - CZ

(český preklad a zdrojové súbory modifikácie **Готика 2: Возвращение 2.0**)

---

## [Download:](https://github.com/helpo1/Navraty-CZ/releases)
- **[v1.01](https://github.com/helpo1/Navraty-CZ/releases/tag/v1.01)** (aktuálna verzia)
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

### FAQ:

##### Q: Po nainštalovaní češtiny sa namiesto znakov s diakritikou zobrazuje cyrilika
- A: viď body **3.iv.)** a **5.iii.)** [odporúčaného postupu inštalácie](#odporúčaný-postup-inštalácie)
  - pokiaľ už fonty z bodu 3.iv.) nainštalované sú, manuálne ich vymazať (súbor `(...)\Data\RET2_Font_High_Resolution.vdf`)

##### Q: Po nainštalovaní češtiny nie sú preložené štatistiky, recepty atď. (záložky dostupné pod B/C)
- A: viď bod **5.v.)** [odporúčaného postupu inštalácie](#odporúčaný-postup-inštalácie)

---

### Úpravy `Gothic.ini`
Po prvom načítaní hry / spustení novej hry a úvodnom dialógu sa v súbore `(...)\System\Gothic.ini` vytvoria nové sekcie v nasledovnom tvare (uvedený príklad pre ťažkú obtiažnosť):

```ini
[CZ_SETTINGS_DIFF]         ; predvolené hodnoty          : (popis nastavenia)
ApplyNewSettings=0         ; def:  0                     : aplikovať nastavenia z tohto súboru pri najbližšom načítaní hry
HPPerLevel=0               ; def:  30 | 20 | 0  | 0      : počet získaných HP pri postupe na novú úroveň
LPPerLevel=15              ; def:  25 | 20 | 15 | 10     : počet získaných LP pri postupe na novú úroveň
XPMult=15                  ; def:  25 | 20 | 15 | 10     : koeficient získaných XP za porazených nepriateľov
HungerPoolBase=496         ; def:  496                   : doba, po uplynutí ktorej sa zvýši hlad o 10% (~ v sekundách)
HungerPoolLevelMult=5      ; def:  5                     :   bonus k ^ za každú úroveň
ThirstPoolBase=616         ; def:  616                   : doba, po uplynutí ktorej sa zvýši smäd o 20% (~ v sekundách)
ThirstPoolLevelMult=5      ; def:  5                     :   bonus k ^ za každú úroveň
FatiguePoolBase=864        ; def:  864                   : doba, po uplynutí ktorej sa zvýši únava o 10% (~ v sekundách)
FatiguePoolLevelMult=0     ; def:  0                     :   bonus k ^ za každú úroveň
EnableHunger=1             ; def:  0 | 0 | 1 | 1         : zapnutie / vypnutie hladu
EnableThirst=1             ; def:  0 | 0 | 1 | 1         : zapnutie / vypnutie smädu
EnableFatigue=1            ; def:  0 | 0 | 1 | 1         : zapnutie / vypnutie únavy
EnableSleepCap=1           ; def:  0 | 0 | 1 | 1         : zapnutie / vypnutie obmedzenia spánku na 10h/deň
EnableTraps=1              ; def:  0 | 1 | 1 | 1         : zapnutie / vypnutie náhodných pascí (v truhlách, sarkofágoch a pod.)
[CZ_SETTINGS_OTHER]
OtherInitialized=1         ; def:  1                     : (interná premenná)
OutputGDRPC=1              ; def:  1                     : zapnutie / vypnutie Discord integrácie cez Discord Rich Presence
ShowAmmo=1                 ; def:  1                     : zapnutie / vypnutie indikátora munície
```

a vypíše sa text `Nastavena obtížnost: Lehká/Střední/Těžká/Legendární!`, prípadne `Inicializuji ostatní nastavení v Gothic.ini...`.

Pokiaľ chce hráč zmeniť niektoré z nastavení obtiažnosti (sekcia `CZ_SETTINGS_DIFF`), je potrebné vypnúť hru, zmeniť príslušné hodnoty, **nastaviť `ApplyNewSettings=1`**, uložiť súbor a načítať uloženú hru. Úspešnú zmenu si je možné overiť zobrazením dvoch kontrolných hlásení po načítaní hry (tieto hlásenia sa v niektorých prípadoch môžu vypísať duplicitne; na ich účinok to nemá vplyv). Taktiež sa v štatistikách pri názve obtiažnosti zobrazí poznámka ` (upr.)`.

Pri zmene nastavení v sekcii Ostatné (`CZ_SETTINGS_OTHER`) stačí vypnúť hru, zmeniť príslušné hodnoty a znovu zapnúť hru.

Súbory potrebné pre integráciu so službou Discord sú nateraz dostupné len na vyžiadanie.

---

### Ďalšie odkazy:

[**Gothicz.net**](http://forum.gothicz.net/viewtopic.php?f=358&t=22017) - hlavné centrum česko-slovenskej Gothic komunity

[**Discord - ThePreklad**](https://discord.gg/m6uTbZj) - všeobecný server o Návratoch a preklade; najrýchlejší spôsob bugtrackingu (okrem GitHubu) a kontaktovania autorov

[**Discord - Gothicz.net**](https://discord.gg/uCybrpX) - všeobecný server česko-slovenskej Gothic komunity

[**GitHub**](https://github.com/helpo1/Navraty-CZ) (tento repozitár) - download, komplexné informácie a zverejnené skripty pôvodnej (RU, read-only) aj preloženej (CZ) verzie; gramatické, štylistické a ďalšie chyby v texte (najmä dialógoch) môžete opravovať priamo tu, väčšie zmeny alebo zásahy do kódu publikujte len po verejnej diskusii a väčšinovom súhlase, najlepšie aj na (aspoň) jednom z ostatných dvoch vyššie uvedených uvedených miest
