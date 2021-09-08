
instance DIA_DRAGON_GOLD_EXIT(C_Info)
{
	npc = none_103_dragon_gold;
	nr = 999;
	condition = dia_dragon_gold_exit_condition;
	information = dia_dragon_gold_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_dragon_gold_exit_condition()
{
	return TRUE;
};

func void dia_dragon_gold_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DRAGON_GOLD_HELLO(C_Info)
{
	npc = none_103_dragon_gold;
	nr = 1;
	condition = dia_dragon_gold_hello_condition;
	information = dia_dragon_gold_hello_info;
	important = TRUE;
};


func int dia_dragon_gold_hello_condition()
{
	return TRUE;
};

func void dia_dragon_gold_hello_info()
{
	B_GivePlayerXP(500);
	AI_Output(self,other,"DIA_Dragon_Gold_Hello_01_00");	//Člověk?!
	AI_Output(self,other,"DIA_Dragon_Gold_Hello_01_01");	//Již dlouhý čas jsem neviděl člověka...
	AI_Output(other,self,"DIA_Dragon_Gold_Hello_01_02");	//Tak proto byl tento portál schovaný. Ještě jeden drak! Kdo by si to pomyslel!
	AI_Output(other,self,"DIA_Dragon_Gold_Hello_01_05");	//Kdo jsi?!
	AI_Output(self,other,"DIA_Dragon_Gold_Hello_01_06");	//Já jsem Ashtar, zlatý drak, ale mylím, že ti to moc neřekne...
	AI_Output(other,self,"DIA_Dragon_Gold_Hello_01_11");	//Cti?! Být sežrán drakem je podle tebe čest?!
	AI_Output(self,other,"DIA_Dragon_Gold_Hello_01_12");	//Ha, ha, ha!... (vrčení) Jsi směšný. Už dlouho mě nikdo takto nepobavil...
	AI_Output(other,self,"DIA_Dragon_Gold_Hello_01_14");	//Když draci jsou generací temnoty, není snad smysl jejich života zabít vše živé, co uvidí?!
	AI_Output(self,other,"DIA_Dragon_Gold_Hello_01_18");	//V tomto světě jsou hodní a zlí, i když mohou vypadat úplně stejně, člověče.
	AI_Output(other,self,"DIA_Dragon_Gold_Hello_01_20");	//Proč jsem ještě neslyšel, že by draci v tomto světě byli hodní?
	AI_Output(self,other,"DIA_Dragon_Gold_Hello_01_22");	//Záleží, jak se díváš na svět!
	AI_Output(self,other,"DIA_Dragon_Gold_Hello_01_21");	//Ve tvých očích vidím pochybnosti...
	self.name[0] = "Ashtar";
	DRAGONGOLDMEET = TRUE;

	if(MIS_GOLDDRAGONPORTAL == LOG_Running)
	{
		B_LogEntry(TOPIC_GOLDDRAGONPORTAL,"V prastarých ruinách Stavitelů jsem našel portál. Aktivoval jsem ho pomocí divného kamene, který jsem našel v Adanově chrámu. Přenesl mě do malého údolí, kde na mě čekalo hodně zajímavé setkání.");
	}
	else
	{
		Log_CreateTopic(TOPIC_GOLDDRAGONPORTAL,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_GOLDDRAGONPORTAL,LOG_Running);
		B_LogEntry(TOPIC_GOLDDRAGONPORTAL,"V prastarých ruinách Stavitelů jsem našel portál. Aktivoval jsem ho pomocí divného kamene, který jsem našel v Adanově chrámu. Přenesl mě do malého údolí, kde na mě čekalo hodně zajímavé setkání.");
		MIS_GOLDDRAGONPORTAL = LOG_Running;
	};
};


instance DIA_DRAGON_GOLD_WHOCREATE(C_Info)
{
	npc = none_103_dragon_gold;
	nr = 1;
	condition = dia_dragon_gold_whocreate_condition;
	information = dia_dragon_gold_whocreate_info;
	permanent = FALSE;
	description = "Co tady děláš?";
};

func int dia_dragon_gold_whocreate_condition()
{
	if(Npc_KnowsInfo(hero,dia_dragon_gold_hello))
	{
		return TRUE;
	};
};

func void dia_dragon_gold_whocreate_info()
{
	AI_Output(other,self,"DIA_Dragon_Gold_WhoCreate_01_00");	//Co tady děláš?
	AI_Output(self,other,"DIA_Dragon_Gold_WhoCreate_01_01");	//Myslím, že bych ti měl dát stejnou otázku. Co tady děláš TY?
	AI_Output(other,self,"DIA_Dragon_Gold_WhoCreate_01_03");	//Dobře... Pak tu není nic divného. Získal jsem artefakt v podobě zaměřovacího kamene, který mě sem přenesl.
	AI_Output(self,other,"DIA_Dragon_Gold_WhoCreate_01_04");	//Hmm... Pravděpodobně jsi našel klíč slunce, který ti sem otevřel cestu.
	AI_Output(self,other,"DIA_Dragon_Gold_WhoCreate_01_06");	//Ale jak se dostal k tobě?! Pouze strážci - 'Strážci slunce' - vlastní toto tajemství a mají přístup ke mě.
	AI_Output(other,self,"DIA_Dragon_Gold_WhoCreate_01_08");	//Ne! Nikomu jsem nic neukradl... Tam kde jsem toto našel nebyli žádní strážci ani Strážci slunce.
	AI_Output(other,self,"DIA_Dragon_Gold_WhoCreate_01_09");	//Nebyl tam vůbec nikdo až na pár banditů a jejich vůdce Ravena.
	AI_Output(other,self,"DIA_Dragon_Gold_WhoCreate_01_12");	//S největší pravděpodobností civilizace těch tvojich strážců slunce zmizela už před dlouhou dobou.
	AI_Output(self,other,"DIA_Dragon_Gold_WhoCreate_01_13");	//Tomu nerozumím. Ale, JAK SE TO MOHLO STÁT?!
	AI_Output(other,self,"DIA_Dragon_Gold_WhoCreate_01_14");	//Neco nevídaně rozzlobeného zničilo jejich zemi, smutná historie, to mi můžeš věřit.
	AI_Output(other,self,"DIA_Dragon_Gold_WhoCreate_01_16");	//Ale možné! A jediná věc, která teď připomíná jejich civilizaci je pár ruin a portály.
	AI_Output(other,self,"DIA_Dragon_Gold_WhoCreate_01_17");	//Ve jedné z nich jsem taky našel ten artefakt.
	AI_Output(self,other,"DIA_Dragon_Gold_WhoCreate_01_18");	//Ale říkal jsi, že jsi potkal nějaké lidi, ne?!
	AI_Output(other,self,"DIA_Dragon_Gold_WhoCreate_01_20");	//Na tom místě byli jen banditi, kteří se tam vydali pro zlato.
	AI_Output(self,other,"DIA_Dragon_Gold_WhoCreate_01_27");	//... (strašlivé vrčení) Dráp?!... (strašlivé vrčení)
	AI_Output(self,other,"DIA_Dragon_Gold_WhoCreate_01_28");	//Pokud je to tak... tak mě neposlouchali... (strašlivé vrčení) Oni ho nezničili, blázni!
	AI_Output(self,other,"DIA_Dragon_Gold_WhoCreate_01_29");	//Teď mi začíná být vše jasné...
	AI_Output(self,other,"DIA_Dragon_Gold_WhoCreate_01_31");	//... Zlo již bylo vypuštěno na svobodu a provede svůj plán... (vrčení)
	B_LogEntry(TOPIC_GOLDDRAGONPORTAL,"Ashtar je překvapen zprávou o záhubě Stavitelů, ale ještě více ho zaskočila existence Beliarova drápu, který měl být podle Ashtara zničen.");
};

instance DIA_DRAGON_GOLD_ADANOSVALLEY(C_Info)
{
	npc = none_103_dragon_gold;
	nr = 1;
	condition = dia_dragon_gold_ADANOSVALLEY_condition;
	information = dia_dragon_gold_ADANOSVALLEY_info;
	permanent = FALSE;
	description = "Tuhle kamennou tabulku jsem našel v chrámu Stavitelů.";
};

func int dia_dragon_gold_ADANOSVALLEY_condition()
{
	if((Npc_KnowsInfo(hero,dia_dragon_gold_whatdo)) && (Npc_HasItems(hero,ItWr_CroneAdanos) >= 1) && (MIS_AdanosCrone == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_dragon_gold_ADANOSVALLEY_info()
{
	AI_Output(other,self,"DIA_Dragon_Gold_ADANOSVALLEY_01_01");	//Tuhle kamennou tabulku jsem našel v chrámu Stavitelů. Co to je?
	AI_Output(self,other,"DIA_Dragon_Gold_ADANOSVALLEY_01_02");	//Podívám se na ni.
	AI_Output(other,self,"DIA_Dragon_Gold_ADANOSVALLEY_01_03");	//Tady.
	B_GiveInvItems(other,self,ItWr_CroneAdanos,1);
	AI_Output(self,other,"DIA_Dragon_Gold_ADANOSVALLEY_01_04");	//(vrčení) Kamenné tabulky?! To jsi mě pobavil, muži.
	AI_Output(self,other,"DIA_Dragon_Gold_ADANOSVALLEY_01_05");	//To čemu říkáš kamenná tabulka je magický svitek!
	AI_Output(other,self,"DIA_Dragon_Gold_ADANOSVALLEY_01_06");	//Takže to je magický svitek Stavitelů?
	AI_Output(self,other,"DIA_Dragon_Gold_ADANOSVALLEY_01_07");	//Ano... (vrčí) Ale soudě podle jazyka ve kterým je psán - spadá až do doby těsně po vzniku světa.
	AI_Output(self,other,"DIA_Dragon_Gold_ADANOSVALLEY_01_08");	//Ale necítím v něm ani kapku magie.
	AI_Output(other,self,"DIA_Dragon_Gold_ADANOSVALLEY_01_09");	//Můžeš mi přeložit co je tam napsáno?
	AI_Output(self,other,"DIA_Dragon_Gold_ADANOSVALLEY_01_10");	//(vrčí) Jistě.
	AI_Output(self,other,"DIA_Dragon_Gold_ADANOSVALLEY_01_11");	//Podle textu je tohle vyvolání...
	AI_Output(other,self,"DIA_Dragon_Gold_ADANOSVALLEY_01_12");	//... Čeho?
	AI_Output(self,other,"DIA_Dragon_Gold_ADANOSVALLEY_01_13");	//... (vrčí) Vyvolání starověkého Adanova strážce!
	AI_Output(other,self,"DIA_Dragon_Gold_ADANOSVALLEY_01_14");	//Zajímavé! Co je to za gardu?
	AI_Output(self,other,"DIA_Dragon_Gold_ADANOSVALLEY_01_15");	//Rozumím tomu tak že je to tvor co kdysi střežil Adanův chrám.
	AI_Output(self,other,"DIA_Dragon_Gold_ADANOSVALLEY_01_16");	//Nicméně, pokud je mi známo, jejich čas již dávno odezněl.
	AI_Output(other,self,"DIA_Dragon_Gold_ADANOSVALLEY_01_17");	//To je vše, co říká?
	AI_Output(self,other,"DIA_Dragon_Gold_ADANOSVALLEY_01_18");	//(vrčí) odkazuje taky na nějaký mocný artefakt, který tito tvorové chránily.
	AI_Output(other,self,"DIA_Dragon_Gold_ADANOSVALLEY_01_19");	//Velmi zajímavé. Co je to za artefakt?
	AI_Output(self,other,"DIA_Dragon_Gold_ADANOSVALLEY_01_20");	//O tom se tu nezmiňují...
	AI_Output(self,other,"DIA_Dragon_Gold_ADANOSVALLEY_01_21");	//Jestli někdo jiný ví něco více, tak to budou ti strážci? 
	B_GiveInvItems(self,other,ItWr_CroneAdanos,1);
	B_LogEntry(TOPIC_AdanosCrone,"Chvála Innosovi! Drak mi pomohl přeložit tento starý záznam, zdá se že to sloužilo k vyvolání strážců kteří hlídaly Adanův chrám v němž se ukrýval mocný artefakt.");
	KnowsTextAdanos = TRUE;
};


instance DIA_DRAGON_GOLD_AWAKEGUARDS(C_Info)
{
	npc = none_103_dragon_gold;
	nr = 1;
	condition = dia_dragon_gold_AWAKEGUARDS_condition;
	information = dia_dragon_gold_AWAKEGUARDS_info;
	permanent = FALSE;
	description = "Nemohl bys ten svitek použít?";
};

func int dia_dragon_gold_AWAKEGUARDS_condition()
{
	if(KnowsTextAdanos == TRUE)
	{
		return TRUE;
	};
};

func void dia_dragon_gold_AWAKEGUARDS_info()
{
	AI_Output(other,self,"DIA_Dragon_Gold_AWAKEGUARDS_01_00");	//Nemohl bys ten svitek použít?
	AI_Output(self,other,"DIA_Dragon_Gold_AWAKEGUARDS_01_01");	//(vrčení) Tak, mohl.
	AI_Output(other,self,"DIA_Dragon_Gold_AWAKEGUARDS_01_02");	//Tak proč je nevyvoláš a nezeptáme se na artefakt?
	AI_Output(self,other,"DIA_Dragon_Gold_AWAKEGUARDS_01_03");	//Příliš nebezpečenství... Tito tvorové by tě snadno zabili.
	AI_Output(self,other,"DIA_Dragon_Gold_AWAKEGUARDS_01_04");	//Krom toho to není obyčejné vyvolávání, ten svitek je potřeba spravit...
	AI_Output(other,self,"DIA_Dragon_Gold_AWAKEGUARDS_01_05");	//A jak to můžu udělat?
	AI_Output(self,other,"DIA_Dragon_Gold_AWAKEGUARDS_01_06");	//Jak vidím, nikdy nemáš dost pokoušení své vlastní smrti...
	AI_Output(other,self,"DIA_Dragon_Gold_AWAKEGUARDS_01_08");	//A pořád tu jsem, plný života.
	AI_Output(self,other,"DIA_Dragon_Gold_AWAKEGUARDS_01_09");	//No, pokud ano... Tak vidím jeden způsob jak vrátit tomuto předmětu magické síly.
	AI_Output(self,other,"DIA_Dragon_Gold_AWAKEGUARDS_01_11");	//(vrčení) Pokud si dobře vzpomínám, v jednom chrámu kdysi drželi speciální runový přístroj.
	AI_Output(self,other,"DIA_Dragon_Gold_AWAKEGUARDS_01_12");	//Stavitelé to používali k přenesení magie z jednoho předmětu do druhého.
	AI_Output(self,other,"DIA_Dragon_Gold_AWAKEGUARDS_01_13");	//S ním můžeš zkusit přenést kouzlo tohoto starobylého svitku.
	AI_Output(self,other,"DIA_Dragon_Gold_AWAKEGUARDS_01_14");	//Mělo by to jít přenést do jakéhokoliv předmětu disponující magii Stavitelů.
	AI_Output(other,self,"DIA_Dragon_Gold_AWAKEGUARDS_01_16");	//Zdá se, že to není nic složitého. A až se mi to podaří, kde můžu použít svitek na vyvolání strážce?
	AI_Output(self,other,"DIA_Dragon_Gold_AWAKEGUARDS_01_17");	//To netuším... Být tebou použiju to v srdci chrámu.
	AI_Output(self,other,"DIA_Dragon_Gold_AWAKEGUARDS_01_18");	//Nezapomeň, je to stará magie... Možná že to půjde.
	AI_Output(other,self,"DIA_Dragon_Gold_AWAKEGUARDS_01_19");	//Dobře, porozhlédnu se po okolí.
	KnowsMakeOldMgic = TRUE;
	B_LogEntry(TOPIC_AdanosCrone,"Rozhodl jsem se riskovat a najít příčinu těchto dávných tvorů. Ale nejprve je třeba obnovit magii objektu. Ashtar mi řekl, že v jednom z chrámů byl jednou speciální runový přístroj, kterým Stavitelé převáděli magii z jednoho kusu do jiného. Přesunu kouzlo do kamenné tabulky, budu potřebovat předmět obsahující alespoň část magie Stavitelů. A když se to podaří, budu muset najít místo kde to použiji. Zlatý drak mi řekl, abych to udělal ve středu chrámu.");
};


instance DIA_DRAGON_GOLD_AboutAntientGuards(C_Info)
{
	npc = none_103_dragon_gold;
	nr = 1;
	condition = DIA_DRAGON_GOLD_AboutAntientGuards_condition;
	information = DIA_DRAGON_GOLD_AboutAntientGuards_info;
	permanent = FALSE;
	description = "Jak zvládnu Adanova strážce?";
};

func int DIA_DRAGON_GOLD_AboutAntientGuards_condition()
{
	if((KnowAboutAdVal == TRUE) && (RavenIsDead == FALSE) && (StoneBossIsDead == FALSE) && (TellAboutAdanosWeapon == FALSE))
	{
		return TRUE;
	};
};

func void DIA_DRAGON_GOLD_aboutantientguards_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_DRAGON_GOLD_AboutAntientGuards_01_01");	//Jak zvládnu Adanova strážce?
	AI_Output(self,other,"DIA_DRAGON_GOLD_AboutAntientGuards_01_02");	//(vrčení) Pro tento čin potřebuješ neobyčejnou zbraň! Pouze s její pomocí rozdrtíš tyto pradávné tvory.
	AI_Output(other,self,"DIA_DRAGON_GOLD_AboutAntientGuards_01_04");	//Kde ji najdu?
	AI_Output(self,other,"DIA_DRAGON_GOLD_AboutAntientGuards_01_05");	//Vím o jedné v chrámu lidí. Bohužel nevím v jakém.
	B_LogEntry(TOPIC_AdanosCrone,"Měl jsem problém s poražením starého strážce, zjistil jsem že normálními zbraněmi nejde zabít. Ashtar mi řekl o existenci zbraně která by ho měla porazit. Náchází se v nějakém chrámu v údolí.");
	TellAboutAdanosWeapon = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_DRAGON_GOLD_AVGO(C_Info)
{
	npc = none_103_dragon_gold;
	nr = 1;
	condition = DIA_DRAGON_GOLD_AVGO_condition;
	information = DIA_DRAGON_GOLD_AVGO_info;
	permanent = FALSE;
	description = "Mám další kamennou tabulku.";
};

func int DIA_DRAGON_GOLD_AVGO_condition()
{
	if((KnowAboutAdVal == TRUE) && (Npc_HasItems(hero,ItWr_StoneAdanosPortal) >= 1))
	{
		return TRUE;
	};
};

func void DIA_DRAGON_GOLD_AVGO_info()
{
	B_GivePlayerXP(400);
	AI_Output(other,self,"DIA_DRAGON_GOLD_AVGO_01_00");	//Mám další kamennou tabulku. Můžeš mi ji přeložit?
	B_GiveInvItems(other,self,ItWr_StoneAdanosPortal,1);
	Npc_RemoveInvItems(self,ItWr_StoneAdanosPortal,1);
	AI_Output(self,other,"DIA_DRAGON_GOLD_AVGO_01_04");	//(vrčení) Velmi zajímavé...
	AI_Output(self,other,"DIA_DRAGON_GOLD_AVGO_01_06");	//Je zde návod k otevření portálu do prastaré Adanovy země!
	AI_Output(self,other,"DIA_DRAGON_GOLD_AVGO_01_08");	//Tato země - posvátné dědictví Adana, kde se poprvé dotkl této planety.
	AI_Output(self,other,"DIA_DRAGON_GOLD_AVGO_01_09");	//Krásné místo, kde staletí vládl mír a vše jen kvetlo!
	AI_Output(other,self,"DIA_DRAGON_GOLD_AVGO_01_10");	//Takže, jak se zdá, artefakt je tam? Jak se tam dostat?
	AI_Output(self,other,"DIA_DRAGON_GOLD_AVGO_01_11");	//(vrčení) Zaprvé je nutno použít srdce Strážce. Mělo by být použito před magickým portálem.
	AI_Output(other,self,"DIA_DRAGON_GOLD_AVGO_01_13");	//Vynikajicí! Jedno už mám.
	AI_Output(self,other,"DIA_DRAGON_GOLD_AVGO_01_14");	//JAK JSTE TO...? Můžeš ho vyvolat v tomto světě znovu?
	AI_Output(other,self,"DIA_DRAGON_GOLD_AVGO_01_15");	//Ano jednou. Jestli jsem chtěl jeho srdce, musel zemřít.
	AI_Output(self,other,"DIA_DRAGON_GOLD_AVGO_01_16");	//(vrčení) Jsem stále více překvapen, jak se lidé jako ty stále hůře snášíte s prastarými bytostmi.
	AI_Output(other,self,"DIA_DRAGON_GOLD_AVGO_01_17");	//Já někdy taky.
	AI_Output(self,other,"DIA_DRAGON_GOLD_AVGO_01_18");	//Jak vidím, bohové ti stále přejí když jsi po tolika případech tady, zdravý. Jiné vysvětlení nemám.
	AI_Output(other,self,"DIA_DRAGON_GOLD_AVGO_01_20");	//To všechno je sice pěkné ale odbočily jsme od témata. Co s tím portálem?
	AI_Output(self,other,"DIA_DRAGON_GOLD_AVGO_01_21");	//Tvoje poselství říká, že se nachází v severní části údolí. 
	AI_Output(other,self,"DIA_DRAGON_GOLD_AVGO_01_22");	//Je možno přesněji? 
	AI_Output(self,other,"DIA_DRAGON_GOLD_AVGO_01_23");	//Nic víc tu není... Budeš muset hledat a snad i najít.
	AI_Output(self,other,"DIA_DRAGON_GOLD_AVGO_01_25");	//(vrčení) Ale už znovu tě chci varovat... Adanova země může být velmi nebezpečná pro obyčejného smrtelníka jako jsi ty.
	AI_Output(self,other,"DIA_DRAGON_GOLD_AVGO_01_27");	//Takže se dobře připrav, než tam vyrazíš...
	B_LogEntry(TOPIC_AdanosCrone,"Ashtar přeložil tabulku strážce chrámu. Je tam uvedena zmínka o magickém portálu v severní části údolí, který vede do Adanovy země. Skvělé místo kde se nachází tajemný artefakt, který jsem hledal tady. K aktivaci portálu musím použít srdce strážce. Ashtar mě varoval, že to tam může být velice nebezpečné, proto se musím důkladně připravit, než vyrazím.");
	InsFireShadowGuards = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_DRAGON_GOLD_WHATDO(C_Info)
{
	npc = none_103_dragon_gold;
	nr = 1;
	condition = dia_dragon_gold_whatdo_condition;
	information = dia_dragon_gold_whatdo_info;
	permanent = FALSE;
	description = "A v čem je smysl tvé existence, draku?";
};

func int dia_dragon_gold_whatdo_condition()
{
	if(Npc_KnowsInfo(hero,dia_dragon_gold_hello))
	{
		return TRUE;
	};
};

func void dia_dragon_gold_whatdo_info()
{
	AI_Output(other,self,"DIA_Dragon_Gold_WhatDo_01_00");	//A v čem je smysl tvé existence, draku?
	AI_Output(self,other,"DIA_Dragon_Gold_WhatDo_01_01");	//Ptáš se mě na tuto otázku a přitom sám neznáš smysl té své.
	AI_Output(other,self,"DIA_Dragon_Gold_WhatDo_01_03");	//Můj je jasný, mám odstranit tvé příbuzné, aby nesežrali Khorinis.
	AI_Output(self,other,"DIA_Dragon_Gold_WhatDo_01_05");	//Chápu tvé chování člověče. Jestli chceš, můžeš zkusit bojovat proti mě!
	AI_Output(self,other,"DIA_Dragon_Gold_WhatDo_01_06");	//Ale to bys nepřinesl světu žádné dobro.
	AI_Output(other,self,"DIA_Dragon_Gold_WhatDo_01_09");	//Hmm... To by opravdu nebylo dobré. Temnota by se asi rozšířila po celém ostrově!
	AI_Output(self,other,"DIA_Dragon_Gold_WhatDo_01_10");	//A to sis myslel, že problémem jsou jen draci... (vrčení)
	AI_Output(self,other,"DIA_Dragon_Gold_WhatDo_01_11");	//Ach! Jak se ten svět změnil...
	B_LogEntry(TOPIC_GOLDDRAGONPORTAL,"Zdá se, že Ashtar, Zlatý drak, který žije v údolí, není vraždící monstrum, ale je laskavý a se smyslem pro humor. Měl bych to říct Saturasovi.");
};


instance DIA_DRAGON_GOLD_ABOUTCLAW(C_Info)
{
	npc = none_103_dragon_gold;
	nr = 1;
	condition = dia_dragon_gold_aboutclaw_condition;
	information = dia_dragon_gold_aboutclaw_info;
	permanent = FALSE;
	description = "Co je? Co máš v záměru?!";
};

func int dia_dragon_gold_aboutclaw_condition()
{
	if(Npc_KnowsInfo(hero,dia_dragon_gold_whocreate))
	{
		return TRUE;
	};
};

func void dia_dragon_gold_aboutclaw_info()
{
	AI_Output(other,self,"DIA_Dragon_Gold_AboutClaw_01_00");	//Co je? Co máš v záměru?!... Vysvětli mi to!
	AI_Output(self,other,"DIA_Dragon_Gold_AboutClaw_01_01");	//Po nalezení Drápu se Strážcům slunce dostala do rukou jedna z nejmocnějších zbraní starověku.
	AI_Output(self,other,"DIA_Dragon_Gold_AboutClaw_01_03");	//Vůbec neodhadli, co je to za zbraň a neznali její sílu!
	AI_Output(self,other,"DIA_Dragon_Gold_AboutClaw_01_06");	//Řekl jsem jim, že by měli zbraň zničit, aby se z ní nedostalo ven zlo.
	AI_Output(self,other,"DIA_Dragon_Gold_AboutClaw_01_07");	//Ale vidina síli je oslepila a neposlouchali mě.
	AI_Output(other,self,"DIA_Dragon_Gold_AboutClaw_01_10");	//A co je s ním tak špatně?
	AI_Output(self,other,"DIA_Dragon_Gold_AboutClaw_01_11");	//Dráp sám o sobě je silný, ale jeho pravá síla, ukrytá ještě jinde je ještě větší.
	AI_Output(self,other,"DIA_Dragon_Gold_AboutClaw_01_13");	//Síla Drápu, který vysával sílu jiných byla uchována v krystalcích na čepeli!
	AI_Output(self,other,"DIA_Dragon_Gold_AboutClaw_01_15");	//A Dráp, stvořen Temným bohem měl díky Senyakovi vlastní vůli...
	AI_Output(self,other,"DIA_Dragon_Gold_AboutClaw_01_17");	//A když konečně vtáhla duši svého majitele, uvěznila ji. V krystalcích, kde byla nesmrtelná duše Senyaka uvězněna.
	AI_Output(self,other,"DIA_Dragon_Gold_AboutClaw_01_20");	//Potom znalost této čepele zmizela v těchto horách na tisíciletí. Bojím se, co mohl Senyak udělat.
	AI_Output(self,other,"DIA_Dragon_Gold_AboutClaw_01_22");	//Protože čepel nemusela vydržet jeho sílu!
	AI_Output(other,self,"DIA_Dragon_Gold_AboutClaw_01_23");	//Ale proč prastaří nezničili tu zbraň?!
	AI_Output(self,other,"DIA_Dragon_Gold_AboutClaw_01_24");	//To mi není známo. Jen mohu říci, že takto svět ohrožuje daleko větší nebezpečí!
	AI_Output(other,self,"DIA_Dragon_Gold_AboutClaw_01_27");	//Hmm... A můžeš si být opravdu jistý, že Senyak je na svobodě?
	AI_Output(self,other,"DIA_Dragon_Gold_AboutClaw_01_28");	//Je nemožné to říci, ale myslím, že bychom se to mohli dozvědět z Drápu.
	AI_Output(other,self,"DIA_Dragon_Gold_AboutClaw_01_34");	//A když ti přinesu Dráp, můžeš mi to říct?
	AI_Output(self,other,"DIA_Dragon_Gold_AboutClaw_01_37");	//Ó, Adane. Přines Dráp... (vrčení) A odpovím na tvé otázky.
	TASKFINDCLAW = TRUE;
	B_LogEntry(TOPIC_GOLDDRAGONPORTAL,"Ashtar mi řekl o hrozbě, v podobě duše Senyaka, která se skrývá v Drápu. Měl bych mu ho přinést, aby se ujistil, že démonova duše je stále v mečí.");
};

instance DIA_DRAGON_GOLD_WHATMAN(C_Info)
{
	npc = none_103_dragon_gold;
	nr = 1;
	condition = dia_dragon_gold_whatman_condition;
	information = dia_dragon_gold_whatman_info;
	permanent = FALSE;
	description = "Mám Dráp.";
};

func int dia_dragon_gold_whatman_condition()
{
	if(Npc_KnowsInfo(hero,dia_dragon_gold_aboutclaw) && C_ScHasBeliarsWeapon())
	{
		return TRUE;
	};
};

func void dia_dragon_gold_whatman_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Dragon_Gold_WhatMan_01_00");	//Mám Dráp.
	AI_Output(self,other,"DIA_Dragon_Gold_WhatMan_01_01");	//Hmmmm... Dobře, ukaž mi ho!

	if((Npc_HasItems(other,itru_beliarsrune01) == TRUE) || (Npc_HasItems(other,itru_beliarsrune02) == TRUE) || (Npc_HasItems(other,itru_beliarsrune03) == TRUE) || (Npc_HasItems(other,itru_beliarsrune04) == TRUE) || (Npc_HasItems(other,itru_beliarsrune05) == TRUE) || (Npc_HasItems(other,itru_beliarsrune06) == TRUE))
	{
		AI_Output(other,self,"DIA_Dragon_Gold_WhatMan_01_02");	//To nepůjde, proměnil jsem Dráp v runu!
		AI_Output(self,other,"DIA_Dragon_Gold_WhatMan_01_03");	//Není důležité, jestli je v podobě meče, nebo runy!
		AI_Output(self,other,"DIA_Dragon_Gold_WhatMan_01_09");	//(studuje) Já to věděl!
		AI_Output(self,other,"DIA_Dragon_Gold_WhatMan_01_10");	//Symbol je matný a necítím Senyakovu energii.
		AI_Output(self,other,"DIA_Dragon_Gold_WhatMan_01_11");	//To znamená jediné - Senyak uprchl!
		AI_Output(self,other,"DIA_Dragon_Gold_WhatMan_01_13");	//To je velmi špatné!
		AI_Output(other,self,"DIA_Dragon_Gold_WhatMan_01_16");	//Co budeme dělat?
		B_LogEntry(TOPIC_GOLDDRAGONPORTAL,"Nejhorší obavy se ukázali být pravdou... Energie Drápu je matná, takže Senyak uprchl...");
	}
	else
	{
		if(C_ScHasEquippedBeliarsWeapon() == TRUE)
		{
			AI_ReadyMeleeWeapon(other);
		};
		AI_Output(other,self,"DIA_Dragon_Gold_WhatMan_01_06");	//Tady...!
		AI_Output(self,other,"DIA_Dragon_Gold_WhatMan_01_09");	//(vrčí úzkostí) ... Můžu!
		AI_Output(self,other,"DIA_Dragon_Gold_WhatMan_01_21");	//Krystaly jsou matné a necítím Senyakovu energii... (vrčení)
		AI_Output(self,other,"DIA_Dragon_Gold_WhatMan_01_11");	//To znamená jediné - Senyak uprchl!
		if(C_ScHasEquippedBeliarsWeapon() == TRUE)
		{
			AI_RemoveWeapon(other);
		};
		AI_Output(self,other,"DIA_Dragon_Gold_WhatMan_01_13");	//Tím, že tam trávil století je ještě nebezpečnější.
		AI_Output(other,self,"DIA_Dragon_Gold_WhatMan_01_16");	//Co budeme dělat?
		B_LogEntry(TOPIC_GOLDDRAGONPORTAL,"Nejhorší obavy se ukázali být pravdou... Energie Drápu je matná, takže Senyak uprchl.");
	};
	AI_Output(self,other,"DIA_Dragon_Gold_WhatMan_01_28");	//Musíme démona zastavit dřív než stačí napáchat škody.
	AI_Output(self,other,"DIA_Dragon_Gold_WhatMan_01_32");	//Při Adanovi, to nesmíme dopustit!
	AI_Output(other,self,"DIA_Dragon_Gold_WhatMan_01_33");	//Ano, naprosto souhlasím.
	AI_Output(self,other,"DIA_Dragon_Gold_WhatMan_01_35");	//Máme málo času a ještě menší šanci.
	AI_Output(self,other,"DIA_Dragon_Gold_WhatMan_01_36");	//Je naděje, že Senyak neměl šanci obnovit své síly.
};


instance DIA_DRAGON_GOLD_DESTROYWAY(C_Info)
{
	npc = none_103_dragon_gold;
	nr = 1;
	condition = dia_dragon_gold_destroyway_condition;
	information = dia_dragon_gold_destroyway_info;
	permanent = FALSE;
	description = "Jak můžeme zničit Senyaka?!";
};

func int dia_dragon_gold_destroyway_condition()
{
	if(Npc_KnowsInfo(hero,dia_dragon_gold_whatman))
	{
		return TRUE;
	};
};

func void dia_dragon_gold_destroyway_info()
{
	AI_Output(other,self,"DIA_Dragon_Gold_DestroyWay_01_00");	//Jak můžeme zničit Senyaka?!
	AI_Output(self,other,"DIA_Dragon_Gold_DestroyWay_01_01");	//Znám jen dvě cesty... (vrčení)
	AI_Output(self,other,"DIA_Dragon_Gold_DestroyWay_01_04");	//Nicméně, můžeme získat moc z elementů!
	AI_Output(other,self,"DIA_Dragon_Gold_DestroyWay_01_05");	//Elementů?!
	AI_Output(self,other,"DIA_Dragon_Gold_DestroyWay_01_07");	//Pro zničení Senyaka budeme potřebovat Kříž elementů! Neznámé kouzlo, které je schopno vzít život čemukoli!
	AI_Output(self,other,"DIA_Dragon_Gold_DestroyWay_01_10");	//Není důležité, jestli je to člověk, nebo démon. Jeho síla zničí i nesmrtelného Senyaka!
	AI_Output(other,self,"DIA_Dragon_Gold_DestroyWay_01_12");	//Ale kde mám získat Kříž elementů?
	AI_Output(self,other,"DIA_Dragon_Gold_DestroyWay_01_13");	//Udělej si čas, řeknu ti to.
	AI_Output(self,other,"DIA_Dragon_Gold_DestroyWay_01_17");	//Naše kouzlo spočívá ve spojení všech elementů dohromady!
	AI_Output(self,other,"DIA_Dragon_Gold_DestroyWay_01_18");	//Oheň, Voda, Kámen and Temnota - pouze všechny elementy spolu dokážou vytvořit kouzlo!
	AI_Output(other,self,"DIA_Dragon_Gold_DestroyWay_01_22");	//Co vše je tedy nezbytné pro vytvoření Kříže elementů?
	AI_Output(self,other,"DIA_Dragon_Gold_DestroyWay_01_23");	//Pro absolutní podstatu elementů je potřeba ještě nějaké silné esence... (vrčení)
	AI_Output(other,self,"DIA_Dragon_Gold_DestroyWay_01_24");	//Jaké esence?!
	AI_Output(self,other,"DIA_Dragon_Gold_DestroyWay_01_25");	//Každý element má hlavní zdroj své síly.
	AI_Output(self,other,"DIA_Dragon_Gold_DestroyWay_01_29");	//Proto jakmile to bude možné, měl bys sféry hledat blízko příslušných elementů...
	AI_Output(self,other,"DIA_Dragon_Gold_DestroyWay_01_30");	//... Teprvé pak z nich bude moci být Kříž elementů!
	AI_Output(other,self,"DIA_Dragon_Gold_DestroyWay_01_31");	//A kde bych měl ty oblasti hledat?!
	AI_Output(self,other,"DIA_Dragon_Gold_DestroyWay_01_32");	//Bojím se, že s tím ti nepomůžu. Budeš muset prohledávat jeskyně, krypty a sklepení.
	AI_Output(self,other,"DIA_Dragon_Gold_DestroyWay_01_33");	//Až je najdeš, vrať se, počkám na tebe!
	AI_Output(other,self,"DIA_Dragon_Gold_DestroyWay_01_34");	//Dobrá, Ashtare. Nebudu ztrácet čas.
	TASKFINDSPHERE = TRUE;
	SENYAKSEEKSWORD = TRUE;
	B_LogEntry(TOPIC_GOLDDRAGONPORTAL,"Zdá se, že zase zachráním svět před Beliarem. Mám najít 4 sféry elementů, abych stvořil kouzlo, které má zastavit démona Senyaka.");
};

instance DIA_DRAGON_GOLD_DESTROYWAYTWO(C_Info)
{
	npc = none_103_dragon_gold;
	nr = 1;
	condition = dia_dragon_gold_destroywaytwo_condition;
	information = dia_dragon_gold_destroywaytwo_info;
	permanent = FALSE;
	description = "Řekl jsi, že znáš dva způsoby.";
};

func int dia_dragon_gold_destroywaytwo_condition()
{
	if(Npc_KnowsInfo(hero,dia_dragon_gold_destroyway) && (DESTROYCLAW == FALSE))
	{
		return TRUE;
	};
};

func void dia_dragon_gold_destroywaytwo_info()
{
	AI_Output(other,self,"DIA_Dragon_Gold_DestroyWayTwo_01_00");	//Řekl jsi, že znáš dva způsoby. Alespoň jsi mi to řekl.
	AI_Output(self,other,"DIA_Dragon_Gold_DestroyWayTwo_01_01");	//Ano, je ještě jeden... (vrčení)
	AI_Output(self,other,"DIA_Dragon_Gold_DestroyWayTwo_01_03");	//Druhý způsob zpočívá v tom, že bude znovu uvězněn.
	AI_Output(other,self,"DIA_Dragon_Gold_DestroyWayTwo_01_06");	//A jak můžu chytit Senyakovu duši?
	AI_Output(self,other,"DIA_Dragon_Gold_DestroyWayTwo_01_07");	//(vrčení) ... Opakujeme starou chybu...
	AI_Output(self,other,"DIA_Dragon_Gold_DestroyWayTwo_01_09");	//K zajmutí duše slouží jedna prastará věc.
	AI_Output(self,other,"DIA_Dragon_Gold_DestroyWayTwo_01_11");	//Je to runa. Jmenuje se - Mora Ulartu! V jazyce prastarých to znamená bludiště duší.
	AI_Output(self,other,"DIA_Dragon_Gold_DestroyWayTwo_01_12");	//Měl bys ji použít na Senyaka.
	AI_Output(self,other,"DIA_Dragon_Gold_DestroyWayTwo_01_13");	//Je snažší o tom mluvit, než ho zabít...
	AI_Output(self,other,"DIA_Dragon_Gold_DestroyWayTwo_01_16");	//Ne, vůbec ne. Je nutno duši umístit zpět do krystalů.
	AI_Output(other,self,"DIA_Dragon_Gold_DestroyWayTwo_01_17");	//Může být krystal v Drápu použit?
	AI_Output(self,other,"DIA_Dragon_Gold_DestroyWayTwo_01_18");	//Hmm... (vrčení) Ano, ale meč není na spolehlivém místě.
	AI_Output(self,other,"DIA_Dragon_Gold_DestroyWayTwo_01_19");	//Ačkoli je to bezpodmínečné, alespoň se meči vrátí část jeho síly!
	AI_Output(self,other,"DIA_Dragon_Gold_DestroyWayTwo_01_21");	//Jeden omyl a Senyakova duše je na svobodě.
	AI_Output(other,self,"DIA_Dragon_Gold_DestroyWayTwo_01_1W");	//Dobře. A co je to kouzlo, o kterém jsi mluvil?
	AI_Output(self,other,"DIA_Dragon_Gold_DestroyWayTwo_01_2W");	//Mora Ulartu - dar Temného boha! Někdo, kdo ovládá magii Temnoty by o tom mohl vědět...
	if(Kapitel >= 5)
	{
		if(!Npc_IsDead(none_102_kreol))
		{
			if(KREOL_MYTEACHER == TRUE)
			{
				AI_Output(other,self,"DIA_Dragon_Gold_DestroyWayTwo_01_22");	//Hmm... Myslím, že někoho takového znám.
				AI_Output(self,other,"DIA_Dragon_Gold_DestroyWayTwo_01_23");	//... (vrčení)
				AI_Output(other,self,"DIA_Dragon_Gold_DestroyWayTwo_01_24");	//A až najdu kouzlo, kde mám hledat Senyaka?
				AI_Output(self,other,"DIA_Dragon_Gold_DestroyWayTwo_01_25");	//První najdi bludiště Duší a až potom se budeme bavit o tvém setkání se Senyakem... (vrčení)
				AI_Output(self,other,"DIA_Dragon_Gold_DestroyWayTwo_01_27");	//Rychle, potřebujeme každou minutu!
				TASKFINDDARKSOUL = TRUE;
				B_LogEntry(TOPIC_GOLDDRAGONPORTAL,"Ashtar mi řekl ještě o jednom způsobu, jak zničit Senyaka. Tedy ne úplně zničit, ale uvěznit jeho duši, tak jako byla dříve. Kvůli tomu musím najít Mora Ulartu, ve starověkém jazyce to znamená bludiště Duší. Drak mi řekl, že by o ní mohl vědět někdo, kdo se zabývá magií Temnoty. Zajdu za Creolem!");
			}
			else
			{
				AI_Output(other,self,"DIA_Dragon_Gold_DestroyWayTwo_01_28");	//Hmm... Tak tu může být problém...
				AI_Output(self,other,"DIA_Dragon_Gold_DestroyWayTwo_01_23");	//... (vrčení)
				AI_Output(other,self,"DIA_Dragon_Gold_DestroyWayTwo_01_24");	//A až najdu kouzlo, kde mám hledat Senyaka?
				AI_Output(self,other,"DIA_Dragon_Gold_DestroyWayTwo_01_25");	//První najdi bludiště Duší a až potom se budeme bavit o tvém setkání se Senyakem... (vrčení)
				AI_Output(self,other,"DIA_Dragon_Gold_DestroyWayTwo_01_27");	//Rychle, potřebujeme každou minutu!
				TASKFINDDARKSOUL = TRUE;
				B_LogEntry(TOPIC_GOLDDRAGONPORTAL,"Ashtar mi řekl ještě o jednom způsobu, jak zničit Senyaka. Tedy ne úplně zničit, ale uvěznit jeho duši, tak jako byla dříve. Kvůli tomu musím najít Mora Ulartu, ve starověkém jazyce to znamená bludiště Duší. Drak mi řekl, že by o ní mohl vědět někdo, kdo se zabývá magií Temnoty. Jen jestli někoho najdu.");
			};
		}
		else
		{
			AI_Output(other,self,"DIA_Dragon_Gold_DestroyWayTwo_01_34");	//Hmm... Obávám se, že nikoho takového nenajdu!
			AI_Output(self,other,"DIA_Dragon_Gold_DestroyWayTwo_01_35");	//... Pak neztrácej čas a jdi hledat sféry elementů... (vrčení)
			B_LogEntry(TOPIC_GOLDDRAGONPORTAL,"Ashtar mi řekl ještě o jednom způsobu, jak zničit Senyaka. Tedy ne úplně zničit, ale uvěznit jeho duši, tak jako byla dříve. Kvůli tomu musím najít Mora Ulartu, ve starověkém jazyce to znamená bludiště Duší. Drak mi řekl, že by o ní mohl vědět někdo, kdo se zabývá magií Temnoty. Jestli někoho takového najdu, asi bych měl na tohle zapomenout...");
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Dragon_Gold_DestroyWayTwo_01_37");	//Hmm... Myslím, že vím kam jít.
		AI_Output(other,self,"DIA_Dragon_Gold_DestroyWayTwo_01_24");	//A až najdu kouzlo, kde mám hledat Senyaka?
		AI_Output(self,other,"DIA_Dragon_Gold_DestroyWayTwo_01_25");	//Prvně najdi bludiště Duší a až potom se budeme bavit o tvém setkání se Senyakem... (vrčení)
		AI_Output(self,other,"DIA_Dragon_Gold_DestroyWayTwo_01_27");	//Rychle, potřebujeme každou minutu!
		TASKFINDDARKSOUL = TRUE;
		B_LogEntry(TOPIC_GOLDDRAGONPORTAL,"Ashtar mi řekl ještě o jednom způsobu, jak zničit Senyaka. Tedy ne úplně zničit, ale uvěznit jeho duši, tak jako byla dříve. Kvůli tomu musím najít Mora Ulartu, ve starověkém jazyce to znamená bludiště Duší. Drak mi řekl, že by o ní mohl vědět někdo, kdo se zabývá magií Temnoty. Měl bych promluvit s Xardasem!");
	};
};


instance DIA_DRAGON_GOLD_CLAWCARE(C_Info)
{
	npc = none_103_dragon_gold;
	nr = 1;
	condition = dia_dragon_gold_clawcare_condition;
	information = dia_dragon_gold_clawcare_info;
	permanent = FALSE;
	description = "A co Dráp?";
};

func int dia_dragon_gold_clawcare_condition()
{
	if(TASKFINDSPHERE == TRUE)
	{
		return TRUE;
	};
};

func void dia_dragon_gold_clawcare_info()
{
	AI_Output(other,self,"DIA_Dragon_Gold_ClawCare_01_00");	//A co Dráp?
	AI_Output(self,other,"DIA_Dragon_Gold_ClawCare_01_01");	//Můžeš si ho nechat pro sebe. Ačkoli je Dráp artefakt temnot, může sloužit i účelům dobra.
	AI_Output(self,other,"DIA_Dragon_Gold_ClawCare_01_02");	//Pamatuj na jedno. Meč byl stvořen pro Senyaka a bude se chtít vrátit ke svému mistru.
	AI_Output(self,other,"DIA_Dragon_Gold_ClawCare_01_08");	//Pokud si nejseš jistý, že dokážeš meč ovládnout...
	AI_Output(self,other,"DIA_Dragon_Gold_ClawCare_01_09");	//... dej ho mě. Zničím tento zdroj zkázy jednou pro vždy!... (vrčení)
	AI_Output(other,self,"DIA_Dragon_Gold_ClawCare_01_11");	//Dobře, promyslím si tvou nabídku.
	B_LogEntry(TOPIC_GOLDDRAGONPORTAL,"Ashtar může Dráp zničit, pokud bude jeho ovládnutí nad mé síly.");
};


instance DIA_DRAGON_GOLD_CLAWDESTROY(C_Info)
{
	npc = none_103_dragon_gold;
	nr = 1;
	condition = dia_dragon_gold_clawdestroy_condition;
	information = dia_dragon_gold_clawdestroy_info;
	permanent = TRUE;
	description = "Znič Dráp!";
};

func int dia_dragon_gold_clawdestroy_condition()
{
	if(Npc_KnowsInfo(hero,dia_dragon_gold_clawcare) && (DESTROYCLAW == FALSE) && C_ScHasBeliarsWeapon())
	{
		return TRUE;
	};
};

func void dia_dragon_gold_clawdestroy_info()
{
	AI_Output(other,self,"DIA_Dragon_Gold_ClawDestroy_01_00");	//Znič Dráp!
	AI_Output(other,self,"DIA_Dragon_Gold_ClawDestroy_01_03");	//Myslím, že tohle je nejlepší rozhodnutí!
	AI_Output(self,other,"DIA_Dragon_Gold_ClawDestroy_01_04");	//Jsi si tím zcela jistý?!... (vrčení)
	Info_AddChoice(dia_dragon_gold_clawdestroy,"Ne, počkej!",dia_dragon_gold_clawdestroy_no);
	Info_AddChoice(dia_dragon_gold_clawdestroy,"Ano!",dia_dragon_gold_clawdestroy_yes);
};

func void dia_dragon_gold_clawdestroy_yes()
{
	B_GivePlayerXP(2500);
	B_ClearBeliarsWeapon();
	Wld_PlayEffect("spellFX_Innoseye",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_LIGHTSTAR_RED",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Snd_Play("DEM_WARN");
	AI_PlayAni(self,"T_SURPRISE_CCW");
	AI_PlayAni(self,"T_SURPRISE_CW");
	AI_Output(self,other,"DIA_Dragon_Gold_DestroyWayTwo_01_23");	//... (vrčení)
	AI_Output(self,other,"DIA_Dragon_Gold_ClawDestroy_Yes_01_01");	//To je vše. Dráp je zničen!
	AI_Output(self,other,"DIA_Dragon_Gold_ClawDestroy_Yes_01_02");	//Svět kvůli nemu už nikdy nebude trpět... (vrčení)
	DESTROYCLAW = TRUE;
	TOPIC_END_Klaue = TRUE;
	Log_SetTopicStatus(TOPIC_Addon_Klaue,LOG_Success);
	B_LogEntry(TOPIC_GOLDDRAGONPORTAL,"Dal jsem Dráp Ashtarovi a on ho zničil.");
	Info_ClearChoices(dia_dragon_gold_clawdestroy);
};

func void dia_dragon_gold_clawdestroy_no()
{
	AI_Output(other,self,"DIA_Dragon_Gold_ClawDestroy_No_01_00");	//Ne, počkej!
	AI_Output(self,other,"DIA_Dragon_Gold_ClawDestroy_No_01_01");	//Jak říkáš... (vrčení)
	Info_ClearChoices(dia_dragon_gold_clawdestroy);
};

instance DIA_DRAGON_GOLD_HAVEONEORALL(C_Info)
{
	npc = none_103_dragon_gold;
	nr = 1;
	condition = dia_dragon_gold_haveoneorall_condition;
	information = dia_dragon_gold_haveoneorall_info;
	permanent = TRUE;
	description = "O té naší věci...";
};

func int dia_dragon_gold_haveoneorall_condition()
{
	if(((TASKFINDDARKSOUL == TRUE) && (DESTROYCLAW == FALSE)) || (TASKFINDSPHERE == TRUE))
	{
		if(MISSSOULFOREVER == FALSE)
		{
			return TRUE;
		};
	};
};

func void dia_dragon_gold_haveoneorall_info()
{
	AI_Output(other,self,"DIA_Dragon_Gold_HaveOneOrAll_01_00");	//O té naší věci...
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_01_01");	//Ano?! Chceš mi něco říci člověče?... (vrčení)
	Info_ClearChoices(dia_dragon_gold_haveoneorall);
	Info_AddChoice(dia_dragon_gold_haveoneorall,"Ještě ne.",dia_dragon_gold_haveoneorall_none);

	if((TASKFINDDARKSOUL == TRUE) && (Npc_HasItems(other,itru_moraulartu) >= 1) && (DESTROYCLAW == FALSE) && (TELLGDMU == FALSE))
	{
		Info_AddChoice(dia_dragon_gold_haveoneorall,"Mám Mora Ulartu!",dia_dragon_gold_haveoneorall_mora);
	};
	if((TASKFINDSPHERE == TRUE) && (Npc_HasItems(other,itmi_fireshpere) >= 1) && (Npc_HasItems(other,itmi_watershpere) >= 1) && (Npc_HasItems(other,itmi_stoneshpere) >= 1) && (Npc_HasItems(other,itmi_darkshpere) >= 1))
	{
		Info_AddChoice(dia_dragon_gold_haveoneorall,"Mám všechny sféry!",dia_dragon_gold_haveoneorall_sphere);
	};
	if((MIS_STONNOSTEST == LOG_SUCCESS) && (MISSSHEPREFOREVER == TRUE) && (MISSSOULFOREVER == FALSE))
	{
		Info_AddChoice(dia_dragon_gold_haveoneorall,"Dal jsem sféry Strážcům.",dia_dragon_gold_haveoneorall_spheregone);
	};
};

func void dia_dragon_gold_haveoneorall_none()
{
	AI_Output(other,self,"DIA_Dragon_Gold_HaveOneOrAll_None_01_00");	//Nemám je.
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_None_01_01");	//Tak na co čekáš?!... (vrčení)
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_None_01_02");	//Jdi a přines to, o čem mluvíme, rychle!
	AI_StopProcessInfos(self);
};

func void dia_dragon_gold_haveoneorall_spheregone()
{
	AI_Output(other,self,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_00");	//Nemám je, dal jsem je Strážcům.
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_01");	//Arrgh!... (vrčení) Ale proč jsi to udělal?!
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_02");	//Bez nich nemáme nejmenší šanci překonat Senyaka!
	AI_Output(other,self,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_03");	//Bylo to nutné.
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_06");	//Musíš bojovat s démonem bez pomoci. S největší pravděpodobností ale prohraješ!

	if((TASKFINDDARKSOUL == TRUE) && (Npc_HasItems(other,itru_moraulartu) >= 1) && (DESTROYCLAW == FALSE) && (TELLGDMU == FALSE))
	{
		B_GivePlayerXP(200);
		AI_Output(other,self,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_08");	//Ale mám Mora Ulartu, co ona?!
		AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_09");	//Arrgh... (vrčení) Takže se ti podařilo získat ji.
		AI_Output(other,self,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_14");	//Ano, a nebylo by špatné vědět co teď.
		AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_15");	//Vše je velmi jednoduché - než začneš bojovat se Senyakem, použij na něho Mora Ulartu.
		AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_16");	//Až bude arcidémon poražen, vezmi z jeh srce kámen s duší, který tam vytvoří Mora Ulartu... (vrčení)
		AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_17");	//Pak spoj kámen s Drápem na oltáři Temného boha a meč získá část své bývalé síly!
		TELLGDMU = TRUE;
		B_LogEntry(TOPIC_GOLDDRAGONPORTAL,"Pokud mám v úmyslu použít Mora Ulartu na Senyaka, měl bych pak kámen s jeho duší spojit s Drápem na Beliarově oltáři, aby zbraň získala zpět alespoň část své síly.");
	}
	else if((TASKFINDDARKSOUL == TRUE) && (TELLGDMU == FALSE))
	{
		AI_Output(other,self,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_22");	//A pokud se mi podaří dostat Mora Ulartu?!
		AI_Output(other,self,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_25");	//Jak ho použiju?
		AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_15");	//Vše je velmi jednoduché - než začneš bojovat se Senyakem, použij na něho Mora Ulartu.
		AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_16");	//Až bude arcidémon poražen, vezmi z jeh srce kámen s duší, který tam vytvoří Mora Ulartu... (vrčení)
		AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_17");	//Pak spoj kámen s Drápem na oltáři Temného boha a meč získá část své bývalé síly!
		TELLGDMU = TRUE;
		B_LogEntry(TOPIC_GOLDDRAGONPORTAL,"Pokud mám v úmyslu použít Mora Ulartu na Senyaka, měl bych pak kámen s jeho duší spojit s Drápem na Beliarově oltáři, aby zbraň získala zpět alespoň část své síly.");
	}
	else
	{
		AI_Output(other,self,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_33");	//Nu, uvidíme.
	};

	AI_Output(other,self,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_34");	//Raději mi řekni, kde ho můžu najít?!
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_36");	//Jeho klášter je ve světě démonů, kde se smrtelník nemůže dostat!
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_37");	//Jedniný způsob, jak se Senyakem bojovat je dostat ho do tohoto světa!
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_39");	//Stačí si vzít tohle.
	B_GiveInvItems(self,other,ITMI_DRAGONGOLDGORN,1);
	AI_Output(other,self,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_40");	//Co to je?
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_41");	//Zlatý roh Akhianti. Jeho majitel může přivolat cokoli ze světa démonů, ale vždy jen jednou!
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_42");	//Senyak nemůže odolat síle tohoto artefaktu.
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_43");	//Jak jistě chápeš, místo setkání se Senyakem si můžeš vybrat sám, tak vybýrej moudře.
	KNOWS_CRESTMAKE = TRUE;
	AshtarLastWarn = TRUE;
	MISSSOULFOREVER = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_dragon_gold_haveoneorall_mora()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Dragon_Gold_HaveOneOrAll_Mora_01_00");	//Mám Mora Ulartu!	
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_09");	//Arrgh... (vrčení) Takže se ti podařilo získat ji.
	AI_Output(other,self,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_14");	//Ano, a nebylo by špatné vědět co teď.
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_15");	//Vše je velmi jednoduché - než začneš bojovat se Senyakem, použij na něho Mora Ulartu.
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_16");	//Až bude arcidémon poražen, vezmi z jeh srce kámen s duší, který tam vytvoří Mora Ulartu.
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_17");	//Pak spoj kámen s Drápem na oltáři Temného boha a meč získá část své bývalé síly!
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_Mora_01_13");	//Ale musím ti říci, že jestli chceš použít Mora Ulartu...
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_Mora_01_14");	//... NESMÍŠ POUŽÍT KŘÍŽ ELEMENTŮ!... (vrčení)
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_Mora_01_16");	//Nemůže odolat síle Kříže elementů a kámen s jeho duší by se rozpadl!
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_Mora_01_17");	//Proto je třeba bojovat se Senyakem normálním způsobem.
	AI_Output(other,self,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_33");	//Nu, uvidíme.
	AI_Output(other,self,"DIA_Dragon_Gold_HaveOneOrAll_Mora_01_1W");	//Řekneš mi jak dosáhnu Senyaka?!
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_Mora_01_20");	//Ne... (vrčení)
	AI_Output(other,self,"DIA_Dragon_Gold_HaveOneOrAll_Mora_01_21");	//Jak?
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_Mora_01_23");	//V tom případě budež muset použít Kříž elementů!
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_Mora_01_25");	//Jestli je něco, co může zničit Senyaka, je to Kříž elementů!...
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_Mora_01_26");	//Proto bys mi měl přinést sféry o kterých jsem ti říkal.
	TELLGDMU = TRUE;
	B_LogEntry(TOPIC_GOLDDRAGONPORTAL,"Pokud mám použít Mora Ulartu, nesmím na démona použít Kříž elementů, nebo by se jeho duše zničila. Každopádně bych ale pro každý případ měl mít Kříž u sebe, takže musím najít sféry.");
	Info_ClearChoices(dia_dragon_gold_haveoneorall);
};

func void dia_dragon_gold_haveoneorall_sphere()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Dragon_Gold_HaveOneOrAll_Sphere_01_00");	//Mám všechny sféry.
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_Sphere_01_01");	//Takže jsi to dokázal!... (vrčení) Velmi dobře!
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_Sphere_01_02");	//Nyní je nezbytné vytvořit Kříž elementů a zničit Senyaka!
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_Sphere_01_04");	//Ještě jeden detail...
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_Sphere_01_06");	//Moje SRDCE!
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_Sphere_01_08");	//Jen něco vyjmečně silného může spojit sféry elementů v Kříž!
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_Sphere_01_09");	//Ptal ses mě, v čem je smysl mé existence... (vrčení)
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_Sphere_01_11");	//Je to šance, jak může smrtelník porazit něco nesmrtelného, jako je Senyak!
	AI_Output(other,self,"DIA_Dragon_Gold_HaveOneOrAll_Sphere_01_14");	//Ale!... Ale bez srdce zemřeš!
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_Sphere_01_16");	//Nezatěžuj se tím. Soustřeď se jen na svůj boj se Senyakem!
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_Sphere_01_17");	//Ale to jsme trochu odchýlili...
	AshtarLastWarn = TRUE;
	B_LogEntry(TOPIC_GOLDDRAGONPORTAL,"Když jsem Ashtarovi donesl sféry Elementů, řekl mi jak vytvořit Kříž elementů! Bohužel, ke spojení je třeba něčeho silného, takže Ashtar mi chce dát své srdce. Taky mi sdělil další věci, jak mám bojovat se Senyakem.");
	Info_ClearChoices(dia_dragon_gold_haveoneorall);
	Info_AddChoice(dia_dragon_gold_haveoneorall,"...?",dia_dragon_gold_haveoneorall_giveheart);
};

func void dia_dragon_gold_haveoneorall_giveheart()
{
	AI_Dodge(other);
	Wld_PlayEffect("spellFX_Innoseye",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_LIGHTSTAR_RED",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Snd_Play("DEM_WARN");
	KNOWS_CRESTMAKE = TRUE;
	AI_Print("Naučeno: Tvorba run - 'Kříž elementů'");
	AI_PlayAni(self,"T_SURPRISE_CCW");
	AI_PlayAni(self,"T_SURPRISE_CW");
	B_GiveInvItems(self,other,itat_golddragonheart,1);
	AI_Wait(self,5);
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_GiveHeart_01_00");	//Tady, ber... (panické vrčení)
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_GiveHeart_01_03");	//Pro vytvoření Kříže jen spoj sféry s mojim srdcem, nejlépe ti to pujde uprostřed runového stolu!
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_GiveHeart_01_04");	//Pak se setkej s arcidémonem.
	AI_Output(other,self,"DIA_Dragon_Gold_HaveOneOrAll_GiveHeart_01_05");	//Kde to můžu najít?!
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_36");	//Jeho klášter je ve světě démonů, kde se smrtelník nemůže dostat!
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_37");	//Jedniný způsob, jak se Senyakem bojovat je dostat ho do tohoto světa!
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_39");	//Stačí si vzít tohle.
	B_GiveInvItems(self,other,ITMI_DRAGONGOLDGORN,1);
	AI_Output(other,self,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_40");	//Co to je?
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_41");	//Zlatý roh Akhianti. Jeho majitel může přivolat cokoli ze světa démonů, ale vždy jen jednou!
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_42");	//Senyak nemůže odolat síle tohoto artefaktu.
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_43");	//Jak jistě chápeš, místo setkání se Senyakem si můžeš vybrat sám, tak vybýrej moudře.

	if((TASKFINDDARKSOUL == TRUE) && (Npc_HasItems(other,itru_moraulartu) >= 1) && (DESTROYCLAW == FALSE) && (TELLGDMU == FALSE))
	{
		B_GivePlayerXP(500);
		AI_Output(other,self,"DIA_Dragon_Gold_HaveOneOrAll_GiveHeart_01_18");	//Stále mám Mora Ulartu!
		AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_09");	//Arrgh... (vrčení) Takže se ti podařilo získat ji.
		AI_Output(other,self,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_14");	//Jak ta věc funguje?
		AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_15");	//Vše je velmi jednoduché - než začneš bojovat se Senyakem, použij na něho Mora Ulartu.
		AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_16");	//Až bude arcidémon poražen, vezmi z jeh srce kámen s duší, který tam vytvoří Mora Ulartu.
		AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_17");	//Pak spoj kámen s Drápem na oltáři Temného boha a meč získá část své bývalé síly!
		AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_Mora_01_13");	//Ale musím ti říci, že jestli chceš použít Mora Ulartu...
		AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_Mora_01_14");	//... NESMÍŠ POUŽÍT KŘÍŽ ELEMENTŮ!...
		AI_Output(other,self,"DIA_Dragon_Gold_HaveOneOrAll_Mora_01_15");	//A proč?!
		AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_Mora_01_16");	//Nemůže odolat síle Kříže elementů a kámen s jeho duší by se rozpadl!
		AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_Mora_01_17");	//Proto je třeba bojovat se Senyakem normálním způsobem.
		AI_Output(other,self,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_33");	//No, uvidíme.
		TELLGDMU = TRUE;
		B_LogEntry(TOPIC_GOLDDRAGONPORTAL,"Pokud mám použít Mora Ulartu, nesmím na démona použít Kříž elementů, nebo by se jeho duše zničila. Každopádně bych ale pro každý případ měl mít Kříž u sebe.");
	}
	else if((TASKFINDDARKSOUL == TRUE) && (TELLGDMU == FALSE))
	{
		AI_Output(other,self,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_22");	//A pokud se mi podaří dostat Mora Ulartu?!
		AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_15");	//Vše je velmi jednoduché - než začneš bojovat se Senyakem, použij na něho Mora Ulartu.
		AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_16");	//Až bude arcidémon poražen, vezmi z jeh srce kámen s duší, který tam vytvoří Mora Ulartu.
		AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_17");	//Pak spoj kámen s Drápem na oltáři Temného boha a meč získá část své bývalé síly!
		TELLGDMU = TRUE;
		B_LogEntry(TOPIC_GOLDDRAGONPORTAL,"Pokud chci použít Mora Ulartu na Senyaka, pomůže mi kouzlo, Kříž elementů. Až bude Senyak mrtev, musím propojit kámen s jeho duší spolu s Drápem, abych mu navrátil původní moc!");
	}
	else
	{
		AI_Output(other,self,"DIA_Dragon_Gold_HaveOneOrAll_SphereGone_01_33");	//Dobrá, podívám se na to.
	};

	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_GiveHeart_01_57");	//To je vše, co máš udělat... (vrčení)
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_GiveHeart_01_58");	//Můj čas nadešel...
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_GiveHeart_01_59");	//Cítím, jak mě opouští má síla...
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_GiveHeart_01_61");	//... (vrčí z bolesti)
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_GiveHeart_01_62");	//Jdi člověče a pamatuj, co jsem ti řekl.
	AI_Output(self,other,"DIA_Dragon_Gold_HaveOneOrAll_Dead_01_00");	//Ach, teď mě nech!... (umírající)
	Info_ClearChoices(dia_dragon_gold_haveoneorall);
	Info_AddChoice(dia_dragon_gold_haveoneorall,Dialog_Ende,dia_dragon_gold_haveoneorall_dead);
};

func void dia_dragon_gold_haveoneorall_dead()
{
	AI_StopProcessInfos(self);
	DragonGoldIsDead = TRUE;
	HeroNotMobsi = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	Wld_StopEffect("DIALOGSCOPE_FX");
};


//---------------------Drakon Adanosa-------------------------------------------

instance DIA_Dragon_AV_EXIT(C_Info)
{
	npc = Dragon_AV;
	nr = 999;
	condition = dia_Dragon_AV_exit_condition;
	information = dia_Dragon_AV_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int dia_Dragon_AV_exit_condition()
{
	return TRUE;
};

func void dia_Dragon_AV_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Dragon_AV_HELLO(C_Info)
{
	npc = Dragon_AV;
	nr = 1;
	condition = dia_Dragon_AV_hello_condition;
	information = dia_Dragon_AV_hello_info;
	important = TRUE;
};

func int dia_Dragon_AV_hello_condition()
{
	return TRUE;
};

func void dia_Dragon_AV_Hello_info()
{
	B_GivePlayerXP(2000);
	AI_Output(self,other,"DIA_Dragon_AV_Hello_01_00");	//Konečně jsi tady!... (vrčení) Čekal jsem tě!
	AI_Output(other,self,"DIA_Dragon_AV_Hello_01_01");	//Ty na mě čekáš?! Jak to mám chápat?
	AI_Output(self,other,"DIA_Dragon_AV_Hello_01_02");	//Arrgh!... (vrčení) TY jsi ten kterého si Adanos vyvolil!
	AI_Output(other,self,"DIA_Dragon_AV_Hello_01_03");	//Myslíš, jak to?! 
	AI_Output(self,other,"DIA_Dragon_AV_Hello_01_04");	//Nosíš jeho symboli moci a navíc ses dostal na toto místo.
	AI_Output(self,other,"DIA_Dragon_AV_Hello_01_05");	//A to může znamenat jediné - Adanos si tě vybral!
	AI_Output(other,self,"DIA_Dragon_AV_Hello_01_06");	//No dobře! Co teď?
	AI_Output(self,other,"DIA_Dragon_AV_Hello_01_07");	//Arrgh... (vrčení) Nyní je čas abys splnil svoje povinnosti!
	AI_Output(other,self,"DIA_Dragon_AV_Hello_01_08");	//Jaké další povinnosti?!
	AI_Output(self,other,"DIA_Dragon_AV_Hello_01_09");	//Zničit zlo které nedočkavě vyčkává až se dostane ven.
	AI_Output(self,other,"DIA_Dragon_AV_Hello_01_10");	//Zlo, které jsem tady střežil staletí!
};

instance DIA_Dragon_AV_Evil(C_Info)
{
	npc = Dragon_AV;
	nr = 1;
	condition = dia_Dragon_AV_Evil_condition;
	information = dia_Dragon_AV_Evil_info;
	permanent = FALSE;
	description = "Jaké zlo?";
};

func int dia_Dragon_AV_Evil_condition()
{
	return TRUE;
};

func void dia_Dragon_AV_Evil_info()
{
	AI_Output(other,self,"DIA_Dragon_AV_Evil_01_00");	//Jaké zlo?
	AI_Output(self,other,"DIA_Dragon_AV_Evil_01_01");	//Jedná se o prastaré a nebezpečné... (vrčení) Zlo, stvořené jedním z Adanových vlastních bratrů!
	AI_Output(other,self,"DIA_Dragon_AV_Evil_01_02");	//Myslíš Innose nebo Beliara?!
	AI_Output(self,other,"DIA_Dragon_AV_Evil_01_03");	//Beliara!... (vrčení) Jen on je schopen něčeho takového.
	AI_Output(other,self,"DIA_Dragon_AV_Evil_01_04");	//Dobře. Jak špatně to vypadá?
	AI_Output(self,other,"DIA_Dragon_AV_Evil_01_05");	//Po ty tisíce let své existence přijalo celou řadu forem a tvarů.
	AI_Output(self,other,"DIA_Dragon_AV_Evil_01_06");	//Jak teď vypadá, nevím! Ale stále ho cítím... Myslím že tam pořád je.
	AI_Output(other,self,"DIA_Dragon_AV_Evil_01_07");	//Kde je?!
	AI_Output(self,other,"DIA_Dragon_AV_Evil_01_08");	//Arrgh... (vrčení) V chrámu za mnou!
	AI_Output(other,self,"DIA_Dragon_AV_Evil_01_09");	//Říkáte, že bych musel jít do chrámu a zničit to zlo?
	AI_Output(self,other,"DIA_Dragon_AV_Evil_01_12");	//To je... (vrčení)
	AI_Output(other,self,"DIA_Dragon_AV_Evil_01_13");	//No řekněme že souhlasím. A jak mám porazit to tvoje zlo?!
	AI_Output(self,other,"DIA_Dragon_AV_Evil_01_14");	//Netuším... (vrčení) Prostě jen strážce, nic víc!
	AI_Output(other,self,"DIA_Dragon_AV_Evil_01_15");	//Dobré skutky! No, abychom si rozuměli. Jak se tam dostanu?
	AI_Output(self,other,"DIA_Dragon_AV_Evil_01_17");	//Otevřu dveře chrámu jakmile mi řekneš že si připraven.
	AI_Output(self,other,"DIA_Dragon_AV_Evil_01_18");	//Ale chci tě varovat... (vrčení) S výjimkou mě, chrám je stále střežen nesmrtelnými strážci!
	AI_Output(self,other,"DIA_Dragon_AV_Evil_01_19");	//Čas strávený vevnitř, pod vlivem mocného zla je přemněnil na strašlivá monstra.
	AI_Output(self,other,"DIA_Dragon_AV_Evil_01_20");	//V minulosti by se neodvážili zaútočit ani Adanovi vyvolení ale teď... (vrčení)
	AI_Output(other,self,"DIA_Dragon_AV_Evil_01_21");	//Domnívám se že mi nebudou chtít ublížit?
	AI_Output(self,other,"DIA_Dragon_AV_Evil_01_22");	//Nyní jsou zlý, budou bránit svého pána dokud nezemřou!
};

var int HramDoorOpen;

instance DIA_Dragon_AV_OpenHram(C_Info)
{
	npc = Dragon_AV;
	nr = 1;
	condition = dia_Dragon_AV_OpenHram_condition;
	information = dia_Dragon_AV_OpenHram_info;
	permanent = TRUE;
	description = "Otevři dveře chrámu!";
};

func int dia_Dragon_AV_OpenHram_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Dragon_AV_Evil) && (HramDoorOpen == FALSE))
	{
		return TRUE;
	};
};

func void dia_Dragon_AV_OpenHram_info()
{
	AI_Output(other,self,"DIA_Dragon_AV_OpenHram_01_00");	//Otevři dveře chrámu!
	AI_Output(self,other,"DIA_Dragon_AV_OpenHram_01_01");	//Připravil ses na tu bitvu?... (vrčení)
	AI_Output(self,other,"DIA_Dragon_AV_OpenHram_01_02");	//Pokud se ti to nepodaří, zlo vypukne znovu a nebudu schopen ho zastavit.
	Info_ClearChoices(DIA_Dragon_AV_OpenHram);
	Info_AddChoice(DIA_Dragon_AV_OpenHram,"Ne, počkej.",DIA_Dragon_AV_OpenHram_No);
	Info_AddChoice(DIA_Dragon_AV_OpenHram,"Otevři už!",DIA_Dragon_AV_OpenHram_Yes);
};

func void DIA_Dragon_AV_OpenHram_No()
{
	AI_Output(other,self,"DIA_Dragon_AV_OpenHram_No_01_00");	//Ne, počkej.
	AI_Output(self,other,"DIA_Dragon_AV_OpenHram_No_01_01");	//Tvoje nerozhodnost před bojem mě trochu děsí... (vrčení)
	AI_Output(self,other,"DIA_Dragon_AV_OpenHram_No_01_02");	//Ale je lepší se před bitvou pořádně připravit, souboj bude velmi náročný.
	Info_ClearChoices(DIA_Dragon_AV_OpenHram);
};

func void DIA_Dragon_AV_OpenHram_Yes()
{
	AI_Output(other,self,"DIA_Dragon_AV_OpenHram_Yes_01_00");	//Otevři už!
	AI_Output(self,other,"DIA_Dragon_AV_OpenHram_Yes_01_01");	//Brána je otevřena... (vrčení) Hodně štěstí v boji! Nechť tě provází Adanos.
	AI_StopProcessInfos(self);

	Wld_PlayEffect("SPELLFX_THUNDERSTORM_RAIN_NOCOL",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("SPELLFX_THUNDERSTORM_SCREENBLEND",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_INCOVATION_WHITE",hero,hero,0,0,0,FALSE);
	Wld_SendTrigger("EVT_RAVENTEMPLEDOOR_01");
	HramDoorOpen = TRUE;

	if(SBMODE == TRUE)
	{
		Wld_InsertNpc(Stoneguardian_Undead,"FP_ROAM_OASE_8");
		Wld_InsertNpc(Stoneguardian_Undead,"FP_ROAM_OASE_16");
		Wld_InsertNpc(Stoneguardian_Undead,"FP_ROAM_OASE_15");
		Wld_InsertNpc(Stoneguardian_Undead,"FP_ROAM_OASE_10");
		Wld_InsertNpc(Stoneguardian_Undead,"FP_ROAM_OASE_11");
		Wld_InsertNpc(Stoneguardian_Undead,"FP_ROAM_OASE_4");
		Wld_InsertNpc(Stoneguardian_Undead,"FP_ROAM_OASE_5");
	};
};