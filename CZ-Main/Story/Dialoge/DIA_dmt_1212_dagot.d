
instance DMT_1212_DAGOT_EXIT(C_Info)
{
	npc = dmt_1212_dagot;
	nr = 999;
	condition = dmt_1212_dagot_exit_condition;
	information = dmt_1212_dagot_exit_info;
	important = FALSE;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dmt_1212_dagot_exit_condition()
{
	return TRUE;
};

func void dmt_1212_dagot_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DMT_1212_DAGOT_HELLO(C_Info)
{
	npc = dmt_1212_dagot;
	condition = dmt_1212_dagot_hello_condition;
	information = dmt_1212_dagot_hello_info;
	important = TRUE;
	permanent = FALSE;
};

func int dmt_1212_dagot_hello_condition()
{
	if((Npc_KnowsInfo(other,DIA_Xardas_FirstEXIT) == TRUE) && (Npc_IsInState(self,ZS_Talk) == TRUE))
	{
		return TRUE;
	};
};

func void dmt_1212_dagot_hello_info()
{
	B_GivePlayerXP(100);
	AI_Output(self,other,"DMT_1212_Dagot_Hello_01");	//Rozumím správně, že to tys zapudil Spáče z tohoto světa?
	AI_Output(other,self,"DMT_1212_Dagot_Hello_02");	//Ano, to jsem byl já.
	AI_Output(self,other,"DMT_1212_Dagot_Hello_03");	//Xardas o tobě hodně mluvil. Jen málo hrdinů z tohoto světa zdárně splní takový úkol!
	AI_Output(other,self,"DMT_1212_Dagot_Hello_04");	//Kdo jsi? A co děláš v Xardasově věži?
	AI_Output(self,other,"DMT_1212_Dagot_Hello_05");	//Jsem Dagoth, jeden z devíti Strážců posvátných Vakhanských síní.
	AI_Output(other,self,"DMT_1212_Dagot_Hello_07");	//Jsi také nekromant a vyvolávač démonů jako Xardas?
	AI_Output(self,other,"DMT_1212_Dagot_Hello_08");	//Pokud máš na mysli, zdali užívám stejné schopnosti a mocnou sílu Beliarových run jako Xardas, pak ano.
	AI_Output(self,other,"DMT_1212_Dagot_Hello_10");	//Ale Xardas stojí jen na počátku této cesty, zatímco my, Strážci, ji následujeme již celé věky.
	AI_Output(self,other,"DMT_1212_Dagot_Hello_11");	//Tahle cesta je naším životem a smyslem našeho pobytu v tomhle světě.
	AI_Output(other,self,"DMT_1212_Dagot_Hello_12");	//A co je to za cestu?
	AI_Output(self,other,"DMT_1212_Dagot_Hello_13");	//Cesta Strážce. Ale její význam nelze pochopit ani shrnout do jediného slova. Je to tvá podstata, tvůj vnitřní svět, tvůj osud.
	AI_Output(self,other,"DMT_1212_Dagot_Hello_14");	//Každá živoucí bytost má svou předurčenou cestu, které se drží po celý život - od narození až po smrt.
	AI_Output(other,self,"DMT_1212_Dagot_Hello_15");	//A jaká je moje cesta?
	AI_Output(self,other,"DMT_1212_Dagot_Hello_16");	//Tím se teď nemusíš zabývat. Stejně tak ani důvodem, proč jsem tady.
	AI_Output(other,self,"DMT_1212_Dagot_Hello_18");	//A kterému bohu slouží Strážci? Pochybuji, že ti, kteří ovládají sílu temné magie, slouží bohům.
	AI_Output(self,other,"DMT_1212_Dagot_Hello_19");	//Strážci neslouží nikomu. Jejich cílem je udržovat rovnováhu tohoto světa před ničitelskými chouťkami Beliara, Innose a Adana.
	AI_Output(other,self,"DMT_1212_Dagot_Hello_20");	//Adana? Není snad i jeho cílem udržovat rovnováhu mezi svými bratry?
	AI_Output(self,other,"DMT_1212_Dagot_Hello_22");	//Poslouchej: nezáleží na tom, jestli si spojuješ fialovou a temnou barvu s Beliarem, rudé, posvátné světlo s Innosem a modrou s moudrými vodami Adana...
	AI_Output(self,other,"DMT_1212_Dagot_Hello_23");	//Jejich cesty, navzdory jejich cílům, nemůžou ve výsledku přinést tomuto světu rovnováhu...
	AI_Output(self,other,"DMT_1212_Dagot_Hello_24");	//... protože není dobro bez zla, jako ani zlo bez dobra; není střed bez začátku a konce.
	AI_Output(self,other,"DMT_1212_Dagot_Hello_25");	//Každá síla již pouhým zasahováním do tohoto světa narušuje podstatu posvátné rovnováhy...
	AI_Output(self,other,"DMT_1212_Dagot_Hello_26");	//... jako ji porušil Beliar, když umožnil Spáči vstoupit na tento svět...
	AI_Output(self,other,"DMT_1212_Dagot_Hello_27");	//... nebo jako ji zničil Innos, když s pomocí paladinů zničil veliké Síně Bestie...
	AI_Output(self,other,"DMT_1212_Dagot_Hello_28");	//... nebo jako ji narušil Adanos, když zničil všechny výtvory svých bratří společně se vším, co považoval za zlé.
	AI_Output(self,other,"DMT_1212_Dagot_Hello_29");	//Cesta Strážců leží mezi každou jednou z těchto cest i mezi nimi všemi jako jedním celkem.
	AI_Output(self,other,"DMT_1212_Dagot_Hello_30");	//Pokud tohle vše dokážeš pochopit, možná se na ni můžeš vydat i ty sám.
	AI_Output(other,self,"DMT_1212_Dagot_Hello_31");	//Chceš tím říct, že i já se mohu stát Strážcem?
	AI_Output(self,other,"DMT_1212_Dagot_Hello_32");	//Možná, ale zatím je příliš brzy na to, abychom o tom mluvili.
	AI_Output(other,self,"DMT_1212_Dagot_Hello_33");	//A co jsou to ty Vakhanské síně? Nikdy jsem o nich neslyšel.
	AI_Output(self,other,"DMT_1212_Dagot_Hello_34");	//Posvátné Vakhanské síně... Prastaří jim říkali 'Síně Chaosu'. Je to místo, kde není nic než prázdnota...
	AI_Output(self,other,"DMT_1212_Dagot_Hello_35");	//... a síla, která může navždy změnit tvář tohoto světa.
	AI_Output(self,other,"DMT_1212_Dagot_Hello_36");	//Dokonce i tak mocná božství, jako jsou Innos, Beliar nebo Adanos, této síle neodolají, pokud přijde na tento svět.
	AI_Output(self,other,"DMT_1212_Dagot_Hello_37");	//A my, Strážci, ochránci těchto Síní, jsme povoláni tohle místo a jeho tisíciletá tajemství ukrývat.
	AI_Output(other,self,"DMT_1212_Dagot_Hello_39");	//A co tedy chceš ode mne?
	AI_Output(self,other,"DMT_1212_Dagot_Hello_40");	//Zatím ti jen mohu mohu doporučit, aby ses vydal na tuhle cestu, hrdino. A mohu ti to nabídnout jen jednou.
	AI_Output(self,other,"DMT_1212_Dagot_Hello_41");	//Poté už své rozhodnutí nebudeš moci zvrátit. Takže přemýšlej dobře, než mi odpovíš...
	AI_Output(self,other,"DMT_1212_Dagot_Hello_42");	//(panovačně) Takže, jak ses rozhodl?
	DAGOT_MEET = TRUE;
	XARDAS_SPEAKDAGOT = FALSE;
	GUARDIAN_WAY = FALSE;
	Info_ClearChoices(dmt_1212_dagot_hello);
	Info_AddChoice(dmt_1212_dagot_hello,"Ne, tohle je pro mne příliš komplikované.",dmt_1212_dagot_hello_no);
	Info_AddChoice(dmt_1212_dagot_hello,"Jsem připraven.",dmt_1212_dagot_hello_yes);
};

func void dmt_1212_dagot_hello_yes()
{
	AI_Output(other,self,"DMT_1212_Dagot_Hello_43");	//Jsem připraven.
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	GUARDIAN_WAY = TRUE;
	AI_Output(self,other,"DMT_1212_Dagot_Hello_44");	//Tvé rozhodnutí je zapsáno v Knize osudu. Možná ještě pořád nechápeš, cos právě učinil.
	AI_Output(self,other,"DMT_1212_Dagot_Hello_45");	//I když jsem nepochyboval, že to bude takhle - zvolil sis cestu Strážce a vydal ses na ni.
	AI_Output(other,self,"DMT_1212_Dagot_Hello_46");	//Co mám teď dělat?
	AI_Output(self,other,"DMT_1212_Dagot_Hello_47");	//Nyní se zaměř na své pozemské povinnosti.
	AI_Output(self,other,"DMT_1212_Dagot_Hello_48");	//Zbytek se dozvíš časem...
	AI_Output(self,other,"DMT_1212_Dagot_Hello_49");	//Buď s bohy!
	MIS_GUARDIANS = LOG_Running;
	Log_CreateTopic(TOPIC_GUARDIANS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GUARDIANS,LOG_Running);
	B_LogEntry(TOPIC_GUARDIANS,"V Xardasově věži jsem se setkal s jedním ze Strážců - Dagothem, prastarým strážcem posvátných Vakhanských síní.");
	Log_AddEntry(TOPIC_GUARDIANS,"Přijal jsem Dagothovu nabídku vydat se na cestu Strážce. Dagoth pak zmizel stejně náhle, jako se objevil, i když se zřejmě nevidíme naposled. Musím to říct Xardasovi.");
	Info_ClearChoices(dmt_1212_dagot_hello);
	Info_AddChoice(dmt_1212_dagot_hello,"Hej, počkej... (musím to říct Xardasovi)",dmt_1212_dagot_endyes);
};

func void dmt_1212_dagot_hello_no()
{
	AI_Output(other,self,"DMT_1212_Dagot_Hello_50");	//Ne, tohle je pro mne příliš komplikované.
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DMT_1212_Dagot_Hello_51");	//Tvé rozhodnutí je zapsáno v Knize osudu. Možná ještě pořád nechápeš, cos právě učinil.
	AI_Output(self,other,"DMT_1212_Dagot_Hello_52");	//Tvoje odpověď je pro mne velkým zklamáním. Ale patrně to takhle mělo být.
	AI_Output(self,other,"DMT_1212_Dagot_Hello_53");	//Více už se nesetkáme. Buď s bohy!
	GUARDIAN_WAY = FALSE;
	MIS_GUARDIANS = LOG_Running;
	Log_CreateTopic(TOPIC_GUARDIANS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GUARDIANS,LOG_Running);
	B_LogEntry(TOPIC_GUARDIANS,"V Xardasově věži jsem se setkal s jedním ze Strážců - Dagothem, prastarým strážcem posvátných Vakhanských síní.");
	Log_AddEntry(TOPIC_GUARDIANS,"Odmítnul jsem Dagothovu nabídku vydat se na cestu Strážce. Více už se nesetkáme. Musím to říct Xardasovi.");
	Info_ClearChoices(dmt_1212_dagot_hello);
	Info_AddChoice(dmt_1212_dagot_hello,"... (musím to říct Xardasovi)",dmt_1212_dagot_endno);
};

func void dmt_1212_dagot_endyes()
{
	Npc_ExchangeRoutine(self,"WaitInSecretLab");
	AI_StopProcessInfos(self);
	B_Attack(self,other,0,0);
	Wld_InsertNpc(Wisp,"NW_DMT_1212_DAGOT");
	Wld_InsertNpc(Wisp,"NW_DMT_1213_MORIUS");
	Wld_InsertNpc(Wisp,"NW_DMT_1214_TEGON");
	Wld_InsertNpc(Wisp,"NW_DMT_1215_KELIOS");
	Wld_InsertNpc(Wisp,"NW_DMT_1216_DEMOS");
	Wld_InsertNpc(Wisp,"NW_DMT_1217_FARION");
	Wld_InsertNpc(Wisp,"NW_DMT_1218_GADER");
	Wld_InsertNpc(Wisp,"NW_DMT_1219_NARUS");
	Wld_InsertNpc(Wisp,"NW_DMT_1220_WAKON");
	Wld_InsertNpc(Wisp,"NW_DMT_1297_STONNOS");
};

func void dmt_1212_dagot_endno()
{
	Npc_ExchangeRoutine(self,"WaitInSecretLab");
	AI_StopProcessInfos(self);
	B_Attack(self,other,0,0);
};


instance DMT_1212_DAGOT_HELLOTWO(C_Info)
{
	npc = dmt_1212_dagot;
	condition = dmt_1212_dagot_hellotwo_condition;
	information = dmt_1212_dagot_hellotwo_info;
	important = TRUE;
	permanent = FALSE;
};


func int dmt_1212_dagot_hellotwo_condition()
{
	if((MIS_GUARDIANS == LOG_Running) && (XARDAS_SPEAKDAGOT == TRUE))
	{
		return TRUE;
	};
};

func void dmt_1212_dagot_hellotwo_info()
{
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_00");	//Takže tvoje cesta tě zavedla sem.
	AI_Output(other,self,"DMT_1212_Dagot_HelloTwo_02");	//Jak ses tady ocitnul ty?
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_04");	//Nebuď překvapen. Naše setkání bylo předurčeno již v době, kdy jsi přijal mou nabídku.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_05");	//Dříve nebo později by se tohle všechno stalo - na tom nezáleží. Důležité je pouze to, že se to stalo a že jsi tady.
	AI_Output(other,self,"DMT_1212_Dagot_HelloTwo_06");	//Tys tady na mne čekal? Proč?
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_07");	//Moje přítomnost tady, stejně jako naše setkání, znamená, že je čas, aby ses o dozvěděl více o nás, Strážcích...
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_08");	//... a udělal první krok ke svému osudu.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_09");	//Jsi připraven?
	AI_Output(other,self,"DMT_1212_Dagot_HelloTwo_10");	//Ano, mistře.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_11");	//Dobře. Poslouchej pozorně...
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_12");	//Na počátku věků svět ponořen v chaosu byl. Nevypadal jako svět, který tě obklopuje dnes.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_13");	//Nic tam nebylo - jen nekonečná prázdnota. V tomhle chaosu čtyři elementy se zrodily: Země, Voda, Kámen a Oheň.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_14");	//Jenže v chaosu tyhle elementy pouze zkázu přinášely. A v jejich věčném boji nebylo ustání.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_15");	//A to vše jen k tomu vedlo, že zničily by se navzájem a v zapomnění upadly...
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_16");	//A elementy prozřely a zjistily, že ve světě, kde Chaos vládne, není pro ně místa. A jen tehdy, když se ho zbaví, klidu dojdou.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_17");	//Proto na cestu vzájemné dohody vstoupily i společně Velký Chaos vyhnaly a na místě, kde se zrodil ho uvěznily.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_18");	//Ve Vakhanských síních... Navždy ho za posvátnými branami před zraky tohoto světa pod mocnou pečeť věčnosti ukryly.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_19");	//A aby brány tyto nikdo neotevřel, každý element své božstvo zplodil...
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_20");	//Takto na svět čtyři božští bratři přišli...
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_21");	//Innos, zrozen z hořícího Ohně, prvním z bratří byl.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_22");	//Druhý Beliar, jehož Temnota Země porodila...
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_23");	//Adana hladina Vody zbožštila...
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_24");	//A čtvrtým z bratrů Stonnos se stal - bůh, jehož otcem Kámen byl...
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_25");	//Tyto božstva uchovávala tajemství pečeti i toho, což skrývala.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_26");	//Ale bratři nemohli dlouho v harmonii žít, protože každý se za nejdůležitějšího považoval a rovnováhu elementů přehlížel.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_27");	//A tak stalo se, že Beliar se Stonnosem znesvářil se a ve vzteku usmrtil ho...
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_28");	//A tak jen tři zůstali... To je důvod, proč jméno božstva čtvrtého neuchovalo se do věků lidí, aby klaněli se mu.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_29");	//Innos, první z bratří, čin Beliarův odsoudil a od té doby mezi nimi nenávist panuje.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_30");	//Adanos na Innosovu ni Beliarovu stranu nepřidal se, nýbrž mezi ně se postavil, jakožto moudrý prostředník jejich střetu.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_31");	//A bratři zapomněli, proč na tento svět přišli. I čím více boj mezi nimi zuřil...
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_32");	//... tím slabší pečeť věčnosti byla, která skutečné zlo ukrývala.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_33");	//I hrozilo, že Chaos opět vládu nad tímto světem převezme a všechny do nicoty a prázdnoty uvrhne.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_34");	//Proto elementy, jež bohy stvořily, nechtějíce pozorovat nepřátelství jejich a bojíce se příchodu Chaosu do tohoto světa...
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_35");	//... slovem síly božstvům nařídily, ať každé z nich tři strážce vytvoří...
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_36");	//... a ti, obdařeni mocí a moudrostí svých tvůrců, posvátný mír Vakhanských síní ochraňují.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_37");	//Element, který o své božstvo byl ukrácen, sám jednoho strážce utvořil, mocí tří ho obdařil a se souhlasem elementů ostatních...
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_38");	//... aby žádných dalších neshod mezi strážci ni jich tvůrci nebylo, za hlavu jich ostatních ustanovil ho.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_39");	//Takto zrodilo se devět Strážců posvátného Kruhu rovnováhy i nejvyšší Strážce, pán Vakhanu a vládce čtyř elementů...
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_40");	//... a od těch dob Strážci posvátné Síně hlídají.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_41");	//Tento svět tisíciletími míru a poklidu obdařen byl.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_42");	//Avšak spor mezi Innosem a Beliarem s nezastavitelnou sílou narůstal, důsledky jeho stávajíce se hrůznějšími a hrůznějšími...
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_43");	//I Innos člověka stvořil a svou božskou sílou ho obdařil, a Beliar Bestii, a svůj hněv a zlost jí udělil...
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_44");	//A stejně jako božští bratři i člověk a Bestie válku na zemi vést započali...
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_45");	//A tento bratrovražedný konflikt záhy svět ohrožovat začal, stejně jako Chaos kdysi všechen život v nebezpečí uvedl.
	AI_Output(other,self,"DMT_1212_Dagot_HelloTwo_46");	//A co udělal Adanos? Třetí z bratrů?
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_47");	//Adanos, zře, že nemůže spor bratří svých uklidnit, své posvátné území od jejich nivočení uchránil...
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_48");	//... a bratrům smrt a zkázu rozsévat zapověděl tam, kde Innos ni Beliar moc žádnou neměli, niče vše, co jeho posvátný mír narušovalo.
	AI_Output(other,self,"DMT_1212_Dagot_HelloTwo_49");	//Rozumím. A co s tím můžeme udělat my?
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_50");	//My, Strážci, se usilujeme uchránit tento svět před skázou a vést ho po cestě rovnováhy a harmonie.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_51");	//Proto mají naše zásahy do tohoto střetu bohů za cíl pouze zabránit tomu, aby některá ze stran tuto konfrontaci vyhrála.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_52");	//To je důvod, proč byl Xardas schopen rozluštit záhadu Spáče, čímž zmařil úsilí Beliara přivést na tento svět jednoho ze svých nejmocnějších démonů.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_53");	//To je důvod, proč paladinové nebyli schopni zničit Irdorathské síně, jelikož nečekaně zmizely. Elementy je ukryly před zraky služebníků Innose.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_54");	//A to je i důvod, proč ani Adanův hněv nemohl zabránit příchodu nejmocnějších prastarých artefaktů vytvořených jeho bratry.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_55");	//V tom leží moudrost cesty Strážců, na kterou jsi vstoupil i ty...
	AI_Output(other,self,"DMT_1212_Dagot_HelloTwo_56");	//A jak se můžu stát Strážcem, jako jsi ty?
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_57");	//Samozřejmě, že se jím stát nemůžeš. Náš božský původ má pramálo společného se smrtelníky jako ty.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_58");	//Ale stejně jako všechna božstva tohoto světa, i my, Strážci, máme své následovníky z řad smrtelníků, kteří ztělesňují naše myšlenky a naši vůli.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_59");	//Stejně jako Innosovi paladinové a mágové Ohně, mágové Vody Adana a jeho Kruh, jako služebníci Beliara a bytosti Temnoty, tak i naši válečníci nesou jméno posvátného Kruhu Strážců...
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_60");	//... na svých rtech a naši víru v srdcích.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_61");	//Asgardové, válečníci elementů, takové jest jejich jméno. Od věčných časů chrání Strážce a jejich veliká tajemství.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_62");	//A jen několika vyvoleným se dostalo cti nést jméno Proroka, největšího zaklínače čtyř elementů, jehož moc byla darem posvátných znalostí Kruhu Strážců.
	AI_Output(other,self,"DMT_1212_Dagot_HelloTwo_63");	//Je tohle má cesta? Cesta válečníka elementů?
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_64");	//Než se staneš velkým válečníkem elementů, máš před sebou ještě velice dlouhou pouť. Právě jsi na tuhle cestu vstoupil, ještě jsi ani neučinil první krok.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_66");	//Prvně se musíš stát hodným jména učedník našeho Kruhu.
	AI_Output(other,self,"DMT_1212_Dagot_HelloTwo_67");	//A jak můžu dojít této cti, mistře?
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_68");	//Jen samotní Strážci rozhodnou, jestli zasloužíš nést tohle jméno. Každý Strážce ti dá zkoušku, kterou musíš splnit.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_69");	//Jakmile získáš souhlas všech devíti Strážců, budeš muset složit Zkoušku víry, a jen pokud jí projdeš, bude ti udělena tahle pocta.
	AI_Output(other,self,"DMT_1212_Dagot_HelloTwo_70");	//A kde Strážce najdu, mistře?
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_71");	//(směje se) Nesnaž se je nalézt - tvá pouť tě k nim zavede, stejně jako tě dovedla ke mně.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_72");	//Já budu prvním Strážcem, jehož zkoušku budeš muset splnit.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_73");	//A jen když získáš můj souhlas a svolení, budeš mít možnost setkat se s ostatními z nás.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_74");	//Až budeš mít podporu všech Strážců, budeš mít tu čest setkat se s vůdcem našeho Kruhu - nejvyšším Strážcem, pánem Vakhanu.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_75");	//A on sám ti vysvětlí, co bude tvou Zkouškou víry... Ale zatím jsi tomu pořád příliš vzdálený.
	AI_Output(other,self,"DMT_1212_Dagot_HelloTwo_76");	//Rozumím, mistře.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_77");	//Takže, jsi připraven přijmout mou zkoušku?
	MIS_GUARDIANSTEST = LOG_Running;
	Log_CreateTopic(TOPIC_GUARDIANSTEST,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GUARDIANSTEST,LOG_Running);
	B_LogEntry(TOPIC_GUARDIANSTEST,"Abych se mohl stát válečníkem elementů, musím se zodpovědět Kruhu Strážců, z nichž každý vyzkouší mou sílu a odhodlanost. Pak musím projít ještě Zkouškou víry, kterou mi zadá Nejvyšší Strážce.");
	Log_AddEntry(TOPIC_GUARDIANSTEST,"Když zdárně splním zkoušku jednoho Strážce, budu moci předstoupit před dalšího.");
	Log_AddEntry(TOPIC_GUARDIANS,"V jedné z jeskyní se s Dagothem opět naše cesty setkali. Dagoth mi vyprávěl o legendách minulosti. Dozvěděl jsem se o počátku světa, bozích, jejich válce a nenávisti mezi nimi, o Strážcích i posvátném Kruhu rovnováhy a harmonie.");
	Log_AddEntry(TOPIC_GUARDIANS,"Dagoth mi řekl, že žádný smrtelník se nemůže stát Strážcem, a že mou cestou je cesta válečníka elementů - Asgarda. To je cíl, ke kterému na konci své poutě dojdu já.");
	Info_ClearChoices(dmt_1212_dagot_hellotwo);
	Info_AddChoice(dmt_1212_dagot_hellotwo,"Ano, mistře. Jsem připraven.",dmt_1212_dagot_hellotwo_test);
};

func void dmt_1212_dagot_hellotwo_test()
{
	Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_Output(other,self,"DMT_1212_Dagot_HelloTwo_78");	//Ano, mistře. Jsem připraven.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_79");	//Dobrá. Já, Dagoth, první ochránce boha Beliara a sedmý Strážce posvátných Vakhanských síní, ti dávám tvůj první úkol...
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_80");	//Musíš najít a zničit jednoho z dávných démonů Baalova plamene, Luciana. Přines mi jeho srdce a tvá zkouška bude splněna.
	AI_Output(other,self,"DMT_1212_Dagot_HelloTwo_81");	//To nebude zrovna snadné. A kde toho démona najdu?
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_82");	//Nikdo neřekl, že cesta, kterou sis zvolil, bude snadná nebo příjemná. Musíš ho najít sám.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_99");	//Ale mohu ti dát jednu radu. Když jsi na pochybách, někdy je lepší se vrátit na samý začátek.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_83");	//Lucian je prastará bytost, která pochází z časů, kdy se utvářel tento svět. Pro obyčejného smrtelníka znamená setkání s ním rozsudek smrti.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_84");	//Je mi jedno, jak to uděláš. Ale dokud mi nepřineseš jeho srdce, můj souhlas nedostaneš.
	AI_Output(other,self,"DMT_1212_Dagot_HelloTwo_85");	//No dobrá, tak já se toho démona pokusím najít a zničit.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_86");	//Dobře tedy. Počkám tu na tebe.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_87");	//(panovačně) A ještě jedna věc...
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_88");	//Vezmi si tento prsten. Možná se ti bude hodit.
	B_GiveInvItems(self,other,itri_guardians_01,1);
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_89");	//A teď jdi.
	MIS_DAGOTTEST = LOG_Running;
	Log_CreateTopic(TOPIC_DAGOTTEST,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DAGOTTEST,LOG_Running);
	B_LogEntry(TOPIC_DAGOTTEST,"Můj první úkol mi zadal Strážce Dagoth. Mám zničit prastarého démona Luciana a jako důkaz přinést Dagothovi jeho srdce.");
	GUARDIAN_RING = FALSE;
	AI_StopProcessInfos(self);
	Wld_InsertNpc(XOR_12207_WARRIORNATURE,"NW_XARDAS_TOWER_VALLEY_09");
	Wld_InsertNpc(luzian_demon,"NW_XARDAS_TOWER_SECRET_CAVE_04");
};

instance DMT_1212_DAGOT_LUZIAN(C_Info)
{
	npc = dmt_1212_dagot;
	nr = 1;
	condition = dmt_1212_dagot_luzian_condition;
	information = dmt_1212_dagot_luzian_info;
	permanent = FALSE;
	description = "Přinesl jsem ti Lucianovo srdce!";
};

func int dmt_1212_dagot_luzian_condition()
{
	if((MIS_GUARDIANSTEST == LOG_Running) && (MIS_DAGOTTEST == LOG_Running) && (Npc_HasItems(other,itat_luzianheart) >= 1) && Npc_IsDead(luzian_demon))
	{
		return TRUE;
	};
};

func void dmt_1212_dagot_luzian_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DMT_1212_Dagot_Luzian_00");	//Přinesl jsem ti Lucianovo srdce!
	AI_Output(self,other,"DMT_1212_Dagot_Luzian_01");	//Ukaž mi ho.
	B_GiveInvItems(other,self,itat_luzianheart,1);
	AI_Output(self,other,"DMT_1212_Dagot_Luzian_02");	//Opravdu, to je jeho srdce! Prokázal jsi, že jsi schopen velkých věcí, a neztratil jsi odvahu ani ve smrtelném nebezpečí.
	MIS_DAGOTTEST = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_DAGOTTEST,LOG_SUCCESS);
	B_LogEntry(TOPIC_DAGOTTEST,"Přinesl jsem Strážci Dagothovi Lucianovo srdce a tím jsem složil svou první zkoušku.");
	Info_ClearChoices(dmt_1212_dagot_luzian);
	Info_AddChoice(dmt_1212_dagot_luzian,"Dáš mi teď svůj souhlas, mistře?",dmt_1212_dagot_luzian_pass);
};

func void dmt_1212_dagot_luzian_pass()
{
	AI_Output(other,self,"DMT_1212_Dagot_Luzian_03");	//Dáš mi teď svůj souhlas, mistře?
	Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_Output(self,other,"DMT_1212_Dagot_Luzian_04");	//Prokázal jsi, že jsi hoden dostat můj souhlas.
	AI_Output(self,other,"DMT_1212_Dagot_Luzian_05");	//A taky jsi ho dostal!
	AI_Output(self,other,"DMT_1212_Dagot_Luzian_06");	//Teď jdi! Hledej dalšího Strážce - on ti dá tvůj další úkol.
	AI_Output(self,other,"DMT_1212_Dagot_Luzian_07");	//Buď s bohy.
	B_LogEntry(TOPIC_GUARDIANSTEST,"Získal jsem souhlas Strážce Dagotha pro přijetí do Kruhu učedníků. Teď musím najít dalšího Strážce a splnit jeho zkoušku.");
	DAGOT_AGREE = TRUE;
	B_RemoveNpc(XOR_12207_WARRIORNATURE);
	Info_ClearChoices(dmt_1212_dagot_luzian);
	Info_AddChoice(dmt_1212_dagot_luzian,"... (KONEC)",dmt_1212_dagot_luzian_end);
};

func void dmt_1212_dagot_luzian_end()
{
	Npc_ExchangeRoutine(self,"WaitInSecretLab");
	AI_StopProcessInfos(self);
	B_Attack(self,other,0,0);
};