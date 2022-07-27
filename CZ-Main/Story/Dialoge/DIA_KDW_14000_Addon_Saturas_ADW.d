/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.01:

(6x) CanLearnMagicCircleNext_ABCZ - upraveny podmínky učení se magických kruhů (na žádost hráčů)
(2x) TOPIC_ORcGREATWAR - TOPIC_ORCGREATWAR (cyrilice -> latinka)


v1.00:

func void DIA_Addon_Saturas_BeliarWeapGeben_Info - upraveny výpisy

*/




instance DIA_Addon_Saturas_ADW_EXIT(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 999;
	condition = DIA_Addon_Saturas_ADW_EXIT_Condition;
	information = DIA_Addon_Saturas_ADW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Saturas_ADW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Saturas_ADW_EXIT_Info()
{
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_EXIT_14_00");	//Nechť tě Adanos ochraňuje.
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Saturas_ADWStart(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = DIA_Addon_Saturas_ADWStart_Condition;
	information = DIA_Addon_Saturas_ADWStart_Info;
	important = TRUE;
};


func int DIA_Addon_Saturas_ADWStart_Condition()
{
	return TRUE;
};

func void DIA_Addon_Saturas_ADWStart_Info()
{
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_14_00");	//Díky Adanovi. Konečně jsi tady. Mysleli jsme, že už se neukážeš.
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_15_01");	//(zmateně) Cože? Jakto, že už jste tady?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_14_02");	//Když jsi prošel skrz portál, tak jsme tě následovali. Krátce poté jsme se objevili zde.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_14_03");	//Ale ty jsi tady nebyl. Už jsme tady několik dní.
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_15_04");	//(překvapeně) NĚKOLIK DNÍ? Jak se to mohlo stát?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_14_05");	//Nebyl jsi k nalezení, Nefarius se snažil zjistit, co se mohlo pokazit. Nevěděl si s tím rady.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_14_06");	//Ale dobrá. Teď jsi tady a můžeme začít s naší prací.
	Wld_InsertNpc(Giant_Rat,"ADW_PORTALTEMPEL_11");
	Wld_InsertNpc(Giant_Rat,"ADW_PORTALTEMPEL_11");

	if(SBMODE == TRUE)
	{
		Wld_InsertNpc(OrcBiter,"ADW_CANYON_PATH_TO_LIBRARY_31A");
		Wld_InsertNpc(OrcBiter,"ADW_CANYON_PATH_TO_LIBRARY_16A");
		Wld_InsertNpc(Wolf,"ADW_CANYON_PATH_TO_LIBRARY_12A");
		Wld_InsertNpc(Bloodhound,"ADW_CANYON_PATH_TO_MINE2_09");
		Wld_InsertNpc(Giant_DesertRat,"ADW_CANYON_PATH_TO_BANDITS_26");
		Wld_InsertNpc(Giant_DesertRat,"ADW_CANYON_PATH_TO_BANDITS_66");
		Wld_InsertNpc(Minecrawler,"ADW_CANYON_PATH_TO_BANDITS_22");
		Wld_InsertNpc(Minecrawler,"ADW_CANYON_PATH_TO_BANDITS_14");
		Wld_InsertNpc(Gobbo_Black,"ADW_ENTRANCE_2_PIRATECAMP_19");
		Wld_InsertNpc(Gobbo_Black,"ADW_ENTRANCE_2_PIRATECAMP_19");
		Wld_InsertNpc(orcwarrior3,"ADW_CANYON_ORCS_08");
		Wld_InsertNpc(OrcWarrior_Roam,"ADW_CANYON_ORCS_11");
		Wld_InsertNpc(orcwarrior4,"ADW_CANYON_ORCS_01");
		Wld_InsertNpc(orcwarrior3s,"ADW_VALLEY_PATH_035");
	};

	Wld_InsertNpc(CanyonRazor03,"ADW_CANYON_PATH_TO_LIBRARY_07A");
	Wld_InsertNpc(CanyonRazor04,"ADW_CANYON_PATH_TO_LIBRARY_36");
	Wld_InsertNpc(Valley_Troll,"ADW_VALLEY_BIGCAVE_15");
	Wld_InsertItem(itpl_super_herb,"FP_ITEM_VALLEY_05");
	Wld_InsertNpc(MinecrawlerWarrior,"ADW_CANYON_MINE2_09");
	Wld_InsertNpc(MinecrawlerWarrior,"ADW_CANYON_MINE2_09");
	Info_ClearChoices(DIA_Addon_Saturas_ADWStart);
	Info_AddChoice(DIA_Addon_Saturas_ADWStart,"Co se mezitím stalo?",DIA_Addon_Saturas_ADWStart_was);
};

func void DIA_Addon_Saturas_ADWStart_was()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_was_15_00");	//Co se mezitím stalo?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_was_14_01");	//Zjistili jsme toho docela dost.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_was_14_02");	//Zemětřesení stále sílí. Nejsme daleko od epicentra.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_was_14_03");	//Stavitelé těchto starých staveb tu nejdřív postavili tohle město, jenž jsme již objevili.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_was_14_04");	//Bez zjevných důvodů jejich kultura zanikla.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_was_14_05");	//Teď můžeme jen spekulovat proč.
	Info_AddChoice(DIA_Addon_Saturas_ADWStart,"Našli jste něco nového ohledně těch ztracených lidí?",DIA_Addon_Saturas_ADWStart_missingPeople);
	Info_AddChoice(DIA_Addon_Saturas_ADWStart,"A co Raven?",DIA_Addon_Saturas_ADWStart_Raven);
};

func void DIA_Addon_Saturas_ADWStart_Raven()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_Raven_15_00");	//A co Raven?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_Raven_14_01");	//V Ravenově dopise se hovoří o nějaké svatyni, do které se pokouší dostat.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_Raven_14_02");	//Shodli jsme se na tom, že by to mohl být Adanův chrám a Raven se ho pokusí znesvětit.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_Raven_14_03");	//Zemětřesení jsou zřejmě důsledkem poskvrňujícího zaklínadla, které neustále naráží na mocná protikouzla.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_Raven_14_04");	//Brány tohoto chrámu jsou magicky uzavřené a při pokusech o sejmutí kouzla oživují kamenné strážce.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_Raven_14_05");	//Chrám zatím odolává. Musíme zastavit Ravena dříve, než se dostane dovnitř.
	Info_AddChoice(DIA_Addon_Saturas_ADWStart,"Co teď uděláme?",DIA_Addon_Saturas_ADWStart_wastun);
	Info_AddChoice(DIA_Addon_Saturas_ADWStart,"Raven je jen rudobaron, ne mág. Jak by mohl sesílat taková zaklínadla?",DIA_Addon_Saturas_ADWStart_RavenOnlyBaron);
	Info_AddChoice(DIA_Addon_Saturas_ADWStart,"Proč se chce Raven do chrámu dostat?",DIA_Addon_Saturas_ADWStart_RavenAim);
};

func void DIA_Addon_Saturas_ADWStart_RavenAim()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_RavenAim_15_00");	//Proč se chce Raven do chrámu dostat?
	AI_Output(self,other,"DIA_Addon_Bodo_14_01");	//Víme jen to, že mu jde o mocný artefakt, který nějak souvisí s Adanem a Beliarem.
	AI_Output(self,other,"DIA_Addon_Bodo_14_02");	//(rozzuřeně) Měli jsme vědět, že má něco za lubem...
};

func void DIA_Addon_Saturas_ADWStart_RavenOnlyBaron()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_RavenOnlyBaron_15_00");	//Raven je jen rudobaron, ne mág. Jak by mohl sesílat taková zaklínadla?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_RavenOnlyBaron_14_01");	//Možná to nedělá on. Možná je to jiný mág, který poslouchá jeho rozkazy.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_RavenOnlyBaron_14_02");	//Každopádně MUSÍME odvrátit tohle zlo.
};

func void DIA_Addon_Saturas_ADWStart_missingPeople()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_missingPeople_15_00");	//Našli jste něco nového, ohledně těch ztracených lidí?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_missingPeople_14_01");	//Zrovna včera jsme našli mrtvolu rybáře. Leží v ruinách na východ.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_missingPeople_14_02");	//Vypadá jako rybář z Khorinisu. Měl by ses tam jít podívat.
	Saturas_AboutWilliam = TRUE;
	B_LogEntry(TOPIC_Addon_MissingPeople,LogText_Addon_WilliamLeiche);
};

func void DIA_Addon_Saturas_ADWStart_wastun()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_wastun_15_00");	//Co teď uděláme?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun_14_01");	//MY tady zůstaneme a budeme nadále studovat tuhle kulturu.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun_14_02");	//Staré svitky Stavitelů zachovávají mnoho tajemství, které musíme vyřešit - pokud chceme zjistit, co se tu v minulosti stalo.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun_14_03");	//TY musíš pro nás ještě udělat pár věcí...
	Info_AddChoice(DIA_Addon_Saturas_ADWStart,"Co bych měl udělat?",DIA_Addon_Saturas_ADWStart_wastun2);
};

func void DIA_Addon_Saturas_ADWStart_wastun2()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_wastun2_15_00");	//Co bych měl udělat?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun2_14_01");	//Najdi Ravena a nedovol mu znesvětit chrám.
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_wastun2_15_02");	//Říkaš, že ho mám ZABÍT?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun2_14_03");	//Pokud to bude jediná možná cesta jak ho zastavit, tak ve jménu Adana... ANO!
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun2_14_04");	//Posbírej všechny pozůstatky po Stavitelích, které najdeš, a přines nám je.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun2_14_05");	//Musíme se dozvědět něco víc o tomto národě a jeho osudu.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun2_14_06");	//Jestli chceme Ravena zastavit, musíme vědět, co plánuje.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun2_14_07");	//Navíc musíš nějakým způsobem osvobodit otroky.
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_wastun2_15_08");	//(cynicky) To je všechno? To udělám i se zavázanýma očima!
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun2_14_09");	//(mrzutě) Vím, že to bude tvrdý oříšek, ale podívej - máš šanci získat si mou důvěru.
	MIS_ADDON_Saturas_GoToRaven = LOG_Running;
	Log_CreateTopic(TOPIC_Addon_RavenKDW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RavenKDW,LOG_Running);
	B_LogEntry(TOPIC_Addon_RavenKDW,"Raven znesvěcuje Adanův chrám. Musím ho zastavit. I kdybych ho měl zabít.");
	Log_CreateTopic(TOPIC_Addon_Sklaven,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Sklaven,LOG_Running);
	Log_AddEntry(TOPIC_Addon_Sklaven,"Saturas chce, abych osvobodil otroky.");
	Log_CreateTopic(TOPIC_Addon_Relicts,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Relicts,LOG_Running);
	Log_AddEntry(TOPIC_Addon_Relicts,"Saturas chce, abych mu donesl všechno, co by mohlo souviset s prastarými Staviteli, architekty těchto budov.");
	Info_AddChoice(DIA_Addon_Saturas_ADWStart,"Ja tedy už půjdu.",DIA_Addon_Saturas_ADWStart_back);
};

func void DIA_Addon_Saturas_ADWStart_back()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_back_15_00");	//Ja tedy už půjdu.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_back_14_01");	//Ještě něco... pro Ravena pracuje mnoho banditů.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_back_14_02");	//Po dobu tvé nepřítomnosti jsme přijali dalšího člena 'Kruhu Vody'.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_back_14_03");	//Poslali jsme ho do bažin. Ještě se nevrátil.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_back_14_04");	//Předpokládáme, že banditi útočí na všechno, co nevypadá jako oni.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_back_14_05");	//Obstarej si tedy zbroj banditů.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_back_14_06");	//Budeš mít šanci dostat se blíž bez toho, aby na tebe zaútočili.
	Log_CreateTopic(TOPIC_Addon_BDTRuestung,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BDTRuestung,LOG_Running);
	B_LogEntry(TOPIC_Addon_BDTRuestung,"Banditi útočí na všechno, co nevypadá jako oni. Musím si najít zbroj banditů, abych se mohl dostat blíž.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};

instance DIA_Addon_Saturas_PoorRanger(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 2;
	condition = DIA_Addon_Saturas_PoorRanger_Condition;
	information = DIA_Addon_Saturas_PoorRanger_Info;
	description = "Co za blázna jsi poslal do močálu?";
};


func int DIA_Addon_Saturas_PoorRanger_Condition()
{
	return TRUE;
};

func void DIA_Addon_Saturas_PoorRanger_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_PoorRanger_15_00");	//Co za blázna jsi poslal do močálu?
	AI_Output(self,other,"DIA_Addon_Saturas_PoorRanger_14_01");	//Jmenuje se Lance.
	AI_Output(self,other,"DIA_Addon_Saturas_PoorRanger_14_02");	//Myslím, že se nedostal moc daleko.
	Log_CreateTopic(TOPIC_Addon_Lance,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Lance,LOG_Running);
	Log_AddEntry(TOPIC_Addon_Lance,"Saturas poslal do močálu někoho jménem Lance. Obává se, že se nedostal moc daleko.");
};

instance DIA_Addon_Saturas_WhatThink(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 2;
	condition = DIA_Addon_Saturas_WhatThink_Condition;
	information = DIA_Addon_Saturas_WhatThink_Info;
	description = "Co si myslíš o Ravenovi?";
};

func int DIA_Addon_Saturas_WhatThink_Condition()
{
	return TRUE;
};

func void DIA_Addon_Saturas_WhatThink_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_WhatThink_01_00");	//Co si myslíš o Ravenovi?
	AI_Output(self,other,"DIA_Addon_Saturas_WhatThink_01_01");	//Ve Starém táboře, byl pravá ruka Gomeze a jedním z nejvlivnějších lidí v kolonii.
	AI_Output(self,other,"DIA_Addon_Saturas_WhatThink_01_02");	//Nevím, jak se dostal na cestu zla, ale jeho činy jsou velmi závažné a musíme ho zastavit!
	AI_Output(self,other,"DIA_Addon_Saturas_WhatThink_01_03");	//Ve skutečnosti mám podezření, že Raven je pouze vykonavatelem vůle někoho jiného. A skutečné zlo nám ještě neodhalilo svou pravou tvář.
};

instance DIA_Addon_Saturas_Piraten(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = DIA_Addon_Saturas_Piraten_Condition;
	information = DIA_Addon_Saturas_Piraten_Info;
	description = "Kde získam tu potřebnou zbroj banditů?";
};


func int DIA_Addon_Saturas_Piraten_Condition()
{
	if((AlligatorJack.aivar[AIV_TalkedToPlayer] == FALSE) && (Greg.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Saturas_Piraten_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_Piraten_15_00");	//Kde získam tu potřebnou zbroj banditů?
	AI_Output(self,other,"DIA_Addon_Saturas_Piraten_14_01");	//Na zapadě je tábor pirátů.
	AI_Output(self,other,"DIA_Addon_Saturas_Piraten_14_02");	//Pokud víme, mají s bandity nějaké kontakty.
	AI_Output(self,other,"DIA_Addon_Saturas_Piraten_14_03");	//Nemyslím si, že na tebe zaútoči, když tě spozorují.
	AI_Output(self,other,"DIA_Addon_Saturas_Piraten_14_04");	//Možná ti tam pomohou...
	B_LogEntry(TOPIC_Addon_BDTRuestung,"Saturas věří, že piráti mi pomohou získat banditskou zbroj.");
};


instance DIA_Addon_Saturas_LanceLeiche(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 2;
	condition = DIA_Addon_Saturas_LanceLeiche_Condition;
	information = DIA_Addon_Saturas_LanceLeiche_Info;
	description = "Našel jsem Lanceho mrtvolu.";
};


func int DIA_Addon_Saturas_LanceLeiche_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Saturas_PoorRanger) && (Npc_HasItems(NONE_Addon_114_Lance_ADW,ItRi_LanceRing) == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Saturas_LanceLeiche_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_LanceLeiche_15_00");	//Našel jsem Lanceho mrtvolu.
	AI_Output(self,other,"DIA_Addon_Saturas_LanceLeiche_14_01");	//Nechť jeho duše vstoupí do Adanovy říše.
	AI_Output(self,other,"DIA_Addon_Saturas_LanceLeiche_14_02");	//Buď opatrný, synu. Nechci přijít o dalšího člena.
	TOPIC_End_Lance = TRUE;
	B_GivePlayerXP(XP_Addon_LanceLeiche);
};

instance DIA_Addon_Saturas_LanceChange(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 2;
	condition = DIA_Addon_Saturas_LanceChange_Condition;
	information = DIA_Addon_Saturas_LanceChange_Info;
	permanent = FALSE;
	description = "Kdo nahradí Lanceho?";
};

func int DIA_Addon_Saturas_LanceChange_Condition()
{
	if(TOPIC_End_Lance == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_LanceChange_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_LanceChange_01_00");	//Kdo nahradí Lanceho?
	AI_Output(self,other,"DIA_Addon_Saturas_LanceChange_01_01");	//Já nevím... Všichni ostatní bratři 'Kruhu Vody' jsou nyní zaneprázdněni jinými důležitými úkoly.
	AI_Output(other,self,"DIA_Addon_Saturas_LanceChange_01_02");	//Podle mého názoru prostě nemáte dost lidí.
	AI_Output(self,other,"DIA_Addon_Saturas_LanceChange_01_03");	//To je pravda, můj synu... (sklíčeně) Ale je nepravděpodobné, že zde najdeme někoho spolehlivého na Lanceho místo.
	AI_Output(self,other,"DIA_Addon_Saturas_LanceChange_01_04");	//Vždyť zde na ostrově, jsou pouze banditi nebo piráti.
	MIS_LanceChange = LOG_Running;
	Log_CreateTopic(TOPIC_LanceChange,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LanceChange,LOG_Running);
	B_LogEntry(TOPIC_LanceChange,"Saturas je přesvědčen, že v této části ostrova jen stěží najdu osobu, která může nahradit Lanceho. Ale kdo ví, možná se mi podaří někoho najít.");
};

instance DIA_Addon_Saturas_LanceChange_Eremit(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 2;
	condition = DIA_Addon_Saturas_LanceChange_Eremit_Condition;
	information = DIA_Addon_Saturas_LanceChange_Eremit_Info;
	permanent = FALSE;
	description = "Našel jsem vám nového pomocníka.";
};

func int DIA_Addon_Saturas_LanceChange_Eremit_Condition()
{
	if((MIS_LanceChange == LOG_Running) && (EremitAgreed == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_LanceChange_Eremit_Info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Addon_Saturas_LanceChange_Eremit_01_00");	//Našel jsem vám nového pomocníka.
	AI_Output(self,other,"DIA_Addon_Saturas_LanceChange_Eremit_01_01");	//A kdo to je?
	AI_Output(other,self,"DIA_Addon_Saturas_LanceChange_Eremit_01_02");	//Jmenuje se Eremit. Je to poustevník a žije hluboko v údolí.
	AI_Output(self,other,"DIA_Addon_Saturas_LanceChange_Eremit_01_03");	//Myslíš si, že pro nás může být užitečný?
	AI_Output(other,self,"DIA_Addon_Saturas_LanceChange_Eremit_01_04");	//Ovšem! Kromě toho, ví něco o kultuře Stavitelů, také umí číst starodávné tabulky.
	AI_Output(self,other,"DIA_Addon_Saturas_LanceChange_Eremit_01_05");	//Opravdu? Hmmm... (zamyšleně) No, můj synu. V tom případě souhlasím aby se k nám přidal.
	MIS_LanceChange = LOG_Success;
	Log_SetTopicStatus(TOPIC_LanceChange,LOG_Success);
	B_LogEntry(TOPIC_LanceChange,"Saturas souhlasil s přijetím Eremita jako asistenta mágů. Je nutné ho o tom informovat.");
};

instance DIA_Addon_Saturas_LanceRing(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = DIA_Addon_Saturas_LanceRing_Condition;
	information = DIA_Addon_Saturas_LanceRing_Info;
	description = "Mám Lanceho akvamarínový prsten.";
};


func int DIA_Addon_Saturas_LanceRing_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Saturas_LanceLeiche) && Npc_HasItems(other,ItRi_LanceRing))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Saturas_LanceRing_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_LanceRing_15_00");	//Mám Lanceho akvamarínový prsten.
	AI_Output(self,other,"DIA_Addon_Saturas_LanceRing_14_01");	//Bude nejlepší, když mi ho dáš dřív, než se dostane do nesprávných rukou.
	B_GiveInvItems(other,self,ItRi_LanceRing,1);
	B_GivePlayerXP(XP_Addon_LanceRing);
};


instance DIA_Addon_Saturas_Tokens(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 10;
	condition = DIA_Addon_Saturas_Tokens_Condition;
	information = DIA_Addon_Saturas_Tokens_Info;
	permanent = TRUE;
	description = "K relikviím...";
};


func int DIA_Addon_Saturas_Tokens_Condition()
{
	if(Saturas_SCBroughtAllToken == FALSE)
	{
		return TRUE;
	};
	return FALSE;
};


var int DIA_Addon_Saturas_Tokens_OneTime;
var int Saturas_SCBroughtAllToken;
var int Saturas_BroughtTokenAmount;
var int ScBroughtToken;
var int Saturas_SCFound_ItMi_Addon_Stone_01;
var int Saturas_SCFound_ItMi_Addon_Stone_02;
var int Saturas_SCFound_ItMi_Addon_Stone_03;
var int Saturas_SCFound_ItMi_Addon_Stone_04;
var int Saturas_SCFound_ItMi_Addon_Stone_05;

func void DIA_Addon_Saturas_Tokens_Info()
{
	var int BroughtToken;
	var int XP_BroughtTokens;
	var int Kohle;
	AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_00");	//K relikviím...
	if((DIA_Addon_Saturas_Tokens_OneTime == FALSE) && (C_ScHasMagicStonePlate() || Npc_HasItems(other,ItWr_StonePlateCommon_Addon)))
	{
		AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_01");	//Myslím, že pro tebe něco mám.
		AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_02");	//O těchto kamenných tabulkách už víme. Ty nám již nepomůžou.
		AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_03");	//Musí tam toho být víc než jen tohle.
		DIA_Addon_Saturas_Tokens_OneTime = TRUE;
	};
	BroughtToken = 0;
	XP_BroughtTokens = 0;
	if((Npc_HasItems(other,ItMi_Addon_Stone_01) && (Saturas_SCFound_ItMi_Addon_Stone_01 == FALSE)) || (Npc_HasItems(other,ItMi_Addon_Stone_02) && (Saturas_SCFound_ItMi_Addon_Stone_02 == FALSE)) || (Npc_HasItems(other,ItMi_Addon_Stone_03) && (Saturas_SCFound_ItMi_Addon_Stone_03 == FALSE)) || (Npc_HasItems(other,ItMi_Addon_Stone_04) && (Saturas_SCFound_ItMi_Addon_Stone_04 == FALSE)) || (Npc_HasItems(other,ItMi_Addon_Stone_05) && (Saturas_SCFound_ItMi_Addon_Stone_05 == FALSE)))
	{
		AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_04");	//Co říkáš na tohle?
		AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_05");	//Vypadá to dobře. Kde jsi to našel?
		B_LogEntry(TOPIC_Addon_Relicts,"Dal jsem Saturasovi tyto relikvie:");
		if(Npc_HasItems(other,ItMi_Addon_Stone_01) && (Saturas_SCFound_ItMi_Addon_Stone_01 == FALSE))
		{
			B_GiveInvItems(other,self,ItMi_Addon_Stone_01,1);
			Saturas_SCFound_ItMi_Addon_Stone_01 = TRUE;
			BroughtToken = BroughtToken + 1;
			AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_06");	//Banditi tyto kamenné tabulky používali jako nějaký druh peněz.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_07");	//Tyto tabulky nesou symbol Quarhodrona, velkého válečníka.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_08");	//Byl to vojevůdce a jeho syn Rhademes zničil celé město.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_09");	//(opovrženě) Pche. Vsadím se, že banditi ani netuší, s čím to obchodují.
			Log_AddEntry(TOPIC_Addon_Relicts,"Červenou kamennou tabulku, kterou banditi používají jako peníze. Je na ní zobrazen velký válečník Quarhodron.");
		};
		if(Npc_HasItems(other,ItMi_Addon_Stone_02) && (Saturas_SCFound_ItMi_Addon_Stone_02 == FALSE))
		{
			B_GiveInvItems(other,self,ItMi_Addon_Stone_02,1);
			Saturas_SCFound_ItMi_Addon_Stone_02 = TRUE;
			BroughtToken = BroughtToken + 1;
			AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_10");	//Tuhle tabulku jsem našel v jedné budově na jihu.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_11");	//Ach! Tabulka Strážců smrti. Pomocí ní vyvolávali duchy mrtvých.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_12");	//Souvislost mezi Staviteli a jejich původem je velmi blízká.
			Log_AddEntry(TOPIC_Addon_Relicts,"Fialovou kamennou tabulku ze sídla Strážců smrti na jihu.");
		};
		if(Npc_HasItems(other,ItMi_Addon_Stone_03) && (Saturas_SCFound_ItMi_Addon_Stone_03 == FALSE))
		{
			B_GiveInvItems(other,self,ItMi_Addon_Stone_03,1);
			Saturas_SCFound_ItMi_Addon_Stone_03 = TRUE;
			BroughtToken = BroughtToken + 1;
			AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_13");	//Našel jsem tuhle tabulku v budově na jihozápadě.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_14");	//Soudě podle toho, co říká tato tabulka, to byl dům kněží ve městě.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_15");	//Velekněz se jmenoval Khardimon. Zatím toho o něm moc nevíme.
			Log_AddEntry(TOPIC_Addon_Relicts,"Modrou kamennou tabulku z obydlí kněží na jihozápadě.");
		};
		if(Npc_HasItems(other,ItMi_Addon_Stone_04) && (Saturas_SCFound_ItMi_Addon_Stone_04 == FALSE))
		{
			B_GiveInvItems(other,self,ItMi_Addon_Stone_04,1);
			Saturas_SCFound_ItMi_Addon_Stone_04 = TRUE;
			BroughtToken = BroughtToken + 1;
			AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_15");	//Tohle leželo v budově blízko močálu.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_16");	//To by mohl být dům léčitelů.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_17");	//Zatím o nich moc nevíme. Zdá se, že byli první, co odsud zmizeli.
			Log_AddEntry(TOPIC_Addon_Relicts,"Zelenou kamennou tabulku z domu léčitelů v jižní části bažiny.");
		};
		if(Npc_HasItems(other,ItMi_Addon_Stone_05) && (Saturas_SCFound_ItMi_Addon_Stone_05 == FALSE))
		{
			B_GiveInvItems(other,self,ItMi_Addon_Stone_05,1);
			Saturas_SCFound_ItMi_Addon_Stone_05 = TRUE;
			BroughtToken = BroughtToken + 1;
			AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_18");	//Tahle věc ležela ve velké budově v kaňonu.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_19");	//Tohle je z knihovny starého národa.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_20");	//Podle všeho je to tabulka učenců.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_80");	//Většina rukopisů, které jsme našli, se vztahovala na vůdce kasty učenců.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_81");	//Zvláštní, že na těch zápiscích nenechal své jméno...
			Log_AddEntry(TOPIC_Addon_Relicts,"Žlutou kamennou tabulku z knihovny učenců na severu.");
		};
		if(SC_Knows_WeaponInAdanosTempel == TRUE)
		{
		};
		XP_BroughtTokens = XP_Addon_ForOneToken * BroughtToken;
		B_GivePlayerXP(XP_BroughtTokens);
		Saturas_BroughtTokenAmount = Saturas_BroughtTokenAmount + BroughtToken;
		if(Saturas_BroughtTokenAmount < 5)
		{
			if(Ghost_SCKnowsHow2GetInAdanosTempel == FALSE)
			{
				AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_21");	//Velmi dobře. Obrázek města se pořád vyjasňuje, ale stále toho nevíme dost.
			};
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_22");	//V téhle oblasti musí být ukryto pět kamenných tabulek.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_23");	//Najdi je a přines je sem.
		};
		AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_24");	//Přijmi tohle zlato za svou ochotu.
		Kohle = 200 * BroughtToken;
		CreateInvItems(self,ItMi_Gold,Kohle);
		B_GiveInvItems(self,other,ItMi_Gold,Kohle);
		ScBroughtToken = TRUE;
	};
	if(Saturas_BroughtTokenAmount == 5)
	{
		AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_25");	//Teď jsme už máme všechny tabulky, které potřebujeme.
		if(Ghost_SCKnowsHow2GetInAdanosTempel == FALSE)
		{
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_26");	//Udělal jsi pro nás velkou službu, patří ti díky.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_27");	//Pro naše studia je to veliký pokrok.
		};
		MIS_Saturas_LookingForHousesOfRulers = LOG_SUCCESS;
		Saturas_SCBroughtAllToken = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_28");	//Uvidím, jestli se mi něco podaří najít.
		AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_29");	//Dobře. Pospěš si. Čas běží.
	};
};


instance DIA_Addon_Saturas_StonePlateHint(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = DIA_Addon_Saturas_StonePlateHint_Condition;
	information = DIA_Addon_Saturas_StonePlateHint_Info;
	important = TRUE;
};


func int DIA_Addon_Saturas_StonePlateHint_Condition()
{
	if(((Merdarion_GotFocusCount >= 2) || (RavenIsInTempel == TRUE)) && (Saturas_SCBroughtAllToken == FALSE) && (Ghost_SCKnowsHow2GetInAdanosTempel == FALSE) && (RavenAway == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Saturas_StonePlateHint_Info()
{
	AI_Output(self,other,"DIA_Addon_Saturas_StonePlateHint_14_00");	//Dobře, že ses vrátil. Musím ti říct něco nového.
	AI_Output(other,self,"DIA_Addon_Saturas_StonePlateHint_15_01");	//Poslouchám.
	AI_Output(self,other,"DIA_Addon_Saturas_StonePlateHint_14_02");	//Ztracené město se jmenovalo Jharkendar. Bylo tady pět vládců, kteří řídili svůj lid.
	AI_Output(self,other,"DIA_Addon_Saturas_StonePlateHint_14_03");	//Každý z těchto vládců měl své sídlo, ve kterém žil a měl svůj majetek.
	AI_Output(self,other,"DIA_Addon_Saturas_StonePlateHint_14_04");	//Myslím si, že bys měl hledat ona učení po staré kultuře zrovna v těchto místech.
	MIS_Saturas_LookingForHousesOfRulers = LOG_Running;
	Info_ClearChoices(DIA_Addon_Saturas_StonePlateHint);
	Info_AddChoice(DIA_Addon_Saturas_StonePlateHint,"Co když už ta sídla neexistují?",DIA_Addon_Saturas_StonePlateHint_unter);
	Info_AddChoice(DIA_Addon_Saturas_StonePlateHint,"Kde přesně bych měl ta sídla hledat?",DIA_Addon_Saturas_StonePlateHint_wo);
};

func void DIA_Addon_Saturas_StonePlateHint_wo()
{
	AI_Output(other,self,"DIA_Addon_Saturas_StonePlateHint_wo_15_00");	//Kde přesně bych měl ta sídla hledat?
	AI_Output(self,other,"DIA_Addon_Saturas_StonePlateHint_wo_14_01");	//Riordian tě obeznámí s uspořádáním staveb v Jharkendaru.
	AI_Output(self,other,"DIA_Addon_Saturas_StonePlateHint_wo_14_02");	//Poví ti, kde je máš hledat.
	Log_CreateTopic(TOPIC_Addon_HousesOfRulers,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_HousesOfRulers,LOG_Running);
	B_LogEntry(TOPIC_Addon_HousesOfRulers,"Saturas chce, abych se poohlédl po nějakých užitečných záznamech Stavitelů. Riordian mi poví, kde je mám hledat.");
};

func void DIA_Addon_Saturas_StonePlateHint_unter()
{
	AI_Output(other,self,"DIA_Addon_Saturas_StonePlateHint_unter_15_00");	//Co když už ta sídla neexistují?
	AI_Output(self,other,"DIA_Addon_Saturas_StonePlateHint_unter_14_01");	//Jestli je nenajdeš, pak byly zřejmě zničeny spolu s městem.
	AI_Output(self,other,"DIA_Addon_Saturas_StonePlateHint_unter_14_02");	//Ale pokud ještě stále existují, budou neocenitelnou pomocí pro naše studia.
};


instance DIA_Addon_Saturas_SCBroughtAllToken(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = DIA_Addon_Saturas_SCBroughtAllToken_Condition;
	information = DIA_Addon_Saturas_SCBroughtAllToken_Info;
	description = "Na co potřebuješ těch pět kamenných tabulek?";
};


func int DIA_Addon_Saturas_SCBroughtAllToken_Condition()
{
	if((ScBroughtToken == TRUE) && (Ghost_SCKnowsHow2GetInAdanosTempel == FALSE) && (RavenAway == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Saturas_SCBroughtAllToken_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_SCBroughtAllToken_15_00");	//Na co potřebuješ těch pět kamenných tabulek?
	AI_Output(self,other,"DIA_Addon_Saturas_SCBroughtAllToken_14_01");	//Záznamy, které jsme našli v ruinách nejsou kompletní.
	AI_Output(self,other,"DIA_Addon_Saturas_SCBroughtAllToken_14_02");	//Ale v zápisech Stavitelů se říká o pěti vládcích, kteří řídili město.
	AI_Output(self,other,"DIA_Addon_Saturas_SCBroughtAllToken_14_03");	//Každý z těchto vládců měl jednu z tabulek, které symbolizovali jeho autoritu.
	AI_Output(self,other,"DIA_Addon_Saturas_SCBroughtAllToken_14_04");	//Myslím, že tyto tabulky jsou klíčem na mé otázky.
};


instance DIA_Addon_Saturas_Flut(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = DIA_Addon_Saturas_Flut_Condition;
	information = DIA_Addon_Saturas_Flut_Info;
	description = "Nefarius mi řekl o potopě...";
};


func int DIA_Addon_Saturas_Flut_Condition()
{
	if((NefariusADW_Talk2Saturas == TRUE) && (RavenAway == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Saturas_Flut_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_Flut_15_00");	//Nefarius mi řekl o potopě...
	AI_Output(self,other,"DIA_Addon_Saturas_Flut_14_02");	//Ukázalo se, že Adanos sestoupil z nebes, aby potrestal nevěřící a vyhnal je do světa mrtvých.
	AI_Output(self,other,"DIA_Addon_Saturas_Flut_14_03");	//Ve svém svatém hněvu nechal mořem pohltit město a smetl ho pryč.
	AI_Output(self,other,"DIA_Addon_Saturas_Flut_14_04");	//Bažina na východě je ještě stále svědectvím těchto událostí.
	TOPIC_END_Flut = TRUE;
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Addon_Saturas_AdanosZorn(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = DIA_Addon_Saturas_AdanosZorn_Condition;
	information = DIA_Addon_Saturas_AdanosZorn_Info;
	description = "Co se Adanovi stalo, že se tak rozhněval?";
};


func int DIA_Addon_Saturas_AdanosZorn_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Saturas_Flut) && (RavenAway == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Saturas_AdanosZorn_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_AdanosZorn_15_00");	//Co se Adanovi stalo, že se tak rozhněval?
	AI_Output(self,other,"DIA_Addon_Saturas_AdanosZorn_14_01");	//Chrámem tohoto města byla kdysi velká zářivá budova.
	AI_Output(self,other,"DIA_Addon_Saturas_AdanosZorn_14_02");	//Všichni ji obdivovali a modlili se k našemu bohu Adanovi.
	AI_Output(self,other,"DIA_Addon_Saturas_AdanosZorn_14_03");	//Rhademes, syn vojevůdce Quarhodrona, znesvětil chrám.
	AI_Output(self,other,"DIA_Addon_Saturas_AdanosZorn_14_04");	//Jeden po druhém podlehli zlu.
	AI_Output(self,other,"DIA_Addon_Saturas_AdanosZorn_14_05");	//Předpokládam, že Adanos jim nemohl odpustit a jeho pomsta postihla celý kraj.
	AI_Output(self,other,"DIA_Addon_Saturas_AdanosZorn_14_06");	//Proto je tak důležité, abychom Ravena zastavili...
};


instance DIA_Addon_Saturas_RavenInfos(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 9;
	condition = DIA_Addon_Saturas_RavenInfos_Condition;
	information = DIA_Addon_Saturas_RavenInfos_Info;
	permanent = TRUE;
	description = "Ohledně Ravena...";
};


var int DIA_Addon_Saturas_RavenInfos_OneTime1;
var int DIA_Addon_Saturas_RavenInfos_OneTime2;
var int DIA_Addon_Saturas_RavenInfos_OneTime3;
var int DIA_Addon_Saturas_RavenInfos_OneTime4;
var int DIA_Addon_Saturas_RavenInfos_OneTime5;
var int Addon_Saturas_Fortuno;

func int DIA_Addon_Saturas_RavenInfos_Condition()
{
	if((MIS_ADDON_Saturas_GoToRaven == LOG_Running) && (RavenAway == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_RavenInfos_Info()
{
	var int RavenNeuigkeit;
	var int XP_RavenNeuigkeit;
	AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_00");	//Ohledně Ravena...
	RavenNeuigkeit = 0;
	if((Thorus.aivar[AIV_TalkedToPlayer] == TRUE) && (DIA_Addon_Saturas_RavenInfos_OneTime1 == FALSE) && (RavenIsInTempel == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_01");	//Byl jsem v táboře banditů. Raven je jejich vůdce.
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_02");	//Ale na to, abych se dostal blíž k Ravenovi, se budu muset zbavit několika banditů.
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_03");	//Dobře. Hodně štěstí. Ale nezapomeň, že to musíš udělat rychle.
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_04");	//Raven nesmí za žádných okolností dosáhnout svého cíle.
		DIA_Addon_Saturas_RavenInfos_OneTime1 = TRUE;
		RavenNeuigkeit = RavenNeuigkeit + 1;
	};
	if((SC_KnowsRavensGoldmine == TRUE) && (DIA_Addon_Saturas_RavenInfos_OneTime2 == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_05");	//Má svůj zlatý důl a nutí otroky hledat zlato.
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_06");	//To se mu podobá. Musíš otroky osvobodit.
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_07");	//(povzdech) Jasně. Pracuji na tom.
		DIA_Addon_Saturas_RavenInfos_OneTime2 = TRUE;
		RavenNeuigkeit = RavenNeuigkeit + 1;
	};
	if((SC_KnowsFortunoInfos == TRUE) && (DIA_Addon_Saturas_RavenInfos_OneTime3 == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_08");	//Mezi bandity je jeden chlap, který tvrdí, že zná Ravenův plán.
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_09");	//Jmenuje se Fortuno. Myslí si, že se Raven chce dostat do chrámu, aby získal mocný artefakt.
		AI_Output(self,other,"DIA_Addon_Bodo_14_03");	//A? Ví něco víc o tom artefaktu?
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_11");	//Řekl mi jen to, že Raven otevřel Adanovu hrobku.
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_12");	//Možná ten hrob obsahuje klíč k chrámu. Měl by ses tam porozhlédnout.
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_13");	//Raven přinutil zajatce, aby hrob vykopali.
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_14");	//To je zlé. Musíš si pospíšit a zastavit Ravena.
		Addon_Saturas_Fortuno = TRUE;
		DIA_Addon_Saturas_RavenInfos_OneTime3 = TRUE;
		RavenNeuigkeit = RavenNeuigkeit + 1;
	};
	if((RavenIsInTempel == TRUE) && (DIA_Addon_Saturas_RavenInfos_OneTime4 == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_15");	//Vtrhl jsem do Ravenova doupěte.
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_16");	//A? Co se stalo?
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_17");	//Přišel jsem pozdě. Ztratil se v Adanově chrámu přímo před mýma očima.
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_18");	//(rozzuřeně) Cože? To je KATASTROFA! Proč jsi ho nenásledoval?!
		DIA_Addon_Saturas_RavenInfos_OneTime4 = TRUE;
		MIS_ADDON_Saturas_GoToRaven = LOG_SUCCESS;
		RavenNeuigkeit = RavenNeuigkeit + 1;
	};
	if(RavenNeuigkeit != 0)
	{
		XP_RavenNeuigkeit = RavenNeuigkeit * XP_Ambient;
		B_GivePlayerXP(XP_RavenNeuigkeit);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_19");	//Přišel jsi oznámit nějaké nové zprávy?
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_20");	//Zatím ne.
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_21");	//Dám ti radu. Nepodceňuj Ravena, rozumíš?
	};
};


instance DIA_Addon_Saturas_TuerZu(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = DIA_Addon_Saturas_TuerZu_Condition;
	information = DIA_Addon_Saturas_TuerZu_Info;
	description = "Nemohl jsem Ravena následovat. Uzavřel bránu zevnitř!";
};


func int DIA_Addon_Saturas_TuerZu_Condition()
{
	if((MIS_ADDON_Saturas_GoToRaven == LOG_SUCCESS) && (RavenAway == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Saturas_TuerZu_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_TuerZu_15_00");	//Nemohl jsem Ravena následovat. Uzavřel bránu zevnitř!
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_02");	//(rozrušeně) Musím přemýšlet...
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_03");	//Otázkou je, jak se Raven dostal dovnitř...
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_04");	//Co udělal předtím, než prošel branou?
	AI_Output(other,self,"DIA_Addon_Saturas_TuerZu_15_05");	//Vyslovil na bránu zaklínadlo.
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_06");	//A před tím?
	AI_Output(other,self,"DIA_Addon_Saturas_TuerZu_15_07");	//Otevřel hrob.
	if(Addon_Saturas_Fortuno == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Saturas_TuerZu_15_09");	//Už jsem ti to jednou říkal...
		AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_10");	//Správně!
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Saturas_TuerZu_15_08");	//Vím jen, že tam musel vykonat nějaký rituál...
	};
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_11");	//(přemýšlí) Rituál...
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_12");	//(přišel na to) Ano! To je ono!
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_13");	//Obávám se, že Raven získal sílu Strážců smrti.
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_14");	//A teď získá vědomosti ze svatyně!
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_15");	//Musíš hned jít za Myxirem a všechno mu říct!
	Log_CreateTopic(TOPIC_Addon_Quarhodron,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Quarhodron,LOG_Running);
	B_LogEntry(TOPIC_Addon_Quarhodron,"Raven ovládl Strážce smrti. Taky získal od ducha informace o Adanově chrámu. Měl bych to oznámit Myxirovi.");
	Saturas_RiesenPlan = TRUE;
};


instance DIA_Addon_Saturas_GhostQuestions(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = DIA_Addon_Saturas_GhostQuestions_Condition;
	information = DIA_Addon_Saturas_GhostQuestions_Info;
	description = "Mluvil jsem s Quarhodronem.";
};


func int DIA_Addon_Saturas_GhostQuestions_Condition()
{
	if((Npc_IsDead(Quarhodron) == FALSE) && (SC_TalkedToGhost == TRUE) && (Ghost_SCKnowsHow2GetInAdanosTempel == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Saturas_GhostQuestions_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_GhostQuestions_15_00");	//Mluvil jsem s Quarhodronem.
	AI_Output(self,other,"DIA_Addon_Saturas_GhostQuestions_14_01");	//A co říkal?
	AI_Output(other,self,"DIA_Addon_Saturas_GhostQuestions_15_02");	//Pomůže mi, jen když mu odpovím na jeho otázky.
	AI_Output(self,other,"DIA_Addon_Saturas_GhostQuestions_14_03");	//V čem je problém?
	AI_Output(other,self,"DIA_Addon_Saturas_GhostQuestions_15_04");	//Nevím správné odpovědi.
	AI_Output(self,other,"DIA_Addon_Saturas_GhostQuestions_14_05");	//Hmm... víme, že učenci z tohoto města postavili na severu knihovnu.
	AI_Output(self,other,"DIA_Addon_Saturas_GhostQuestions_14_06");	//Byli velice usilovní a snažili se zapisovat všechny své dějiny.
	AI_Output(self,other,"DIA_Addon_Saturas_GhostQuestions_14_07");	//Možná nalezneš odpovědi na Quarhodronovy otázky pravě tam.
	B_LogEntry(TOPIC_Addon_Quarhodron,"Saturas předpokládá, že bych mohl najít odpovědi na Quarhodronovy otázky v knihovně učenců. Ta je daleko na severu.");
};


instance DIA_Addon_Saturas_TalkedToGhost(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = DIA_Addon_Saturas_TalkedToGhost_Condition;
	information = DIA_Addon_Saturas_TalkedToGhost_Info;
	description = "Problém se vstupem do chrámu jsem vyřešil.";
};


func int DIA_Addon_Saturas_TalkedToGhost_Condition()
{
	if((Ghost_SCKnowsHow2GetInAdanosTempel == TRUE) && (RavenAway == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Saturas_TalkedToGhost_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_TalkedToGhost_15_00");	//Problém se vstupem do chrámu jsem vyřešil.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_14_01");	//Duch promluvil?
	AI_Output(other,self,"DIA_Addon_Saturas_TalkedToGhost_15_02");	//Ano, promluvil.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_14_03");	//Pak víš jak se dostat do chrámu.
	AI_Output(other,self,"DIA_Addon_Saturas_TalkedToGhost_15_04");	//Ano. A navíc mi prozradil, co se skrývá uvnitř.
	AI_Output(other,self,"DIA_Addon_Saturas_TalkedToGhost_15_05");	//Říkal něco o mocném meči a o Adanových komnatách.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_14_06");	//(zoufale) Ó, Adane. Jsme ale hlupáci. Jakto že jsme nic netušili?
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_14_07");	//(šokovaně) Podle tvých slov...
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_14_08");	//Ten meč může být jedině 'Beliarův dráp'.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_14_09");	//Musíme překonat komnaty tak rychle, jak to jen jde a získat tu zbraň.
	Info_ClearChoices(DIA_Addon_Saturas_TalkedToGhost);
	Info_AddChoice(DIA_Addon_Saturas_TalkedToGhost,"Co je to 'Beliarův dráp'?",DIA_Addon_Saturas_TalkedToGhost_wasistdas);
	Info_AddChoice(DIA_Addon_Saturas_TalkedToGhost,"Co jsou Adanovy komnaty?",DIA_Addon_Saturas_TalkedToGhost_kammern);
};

func void DIA_Addon_Saturas_TalkedToGhost_wasistdas()
{
	AI_Output(other,self,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_15_00");	//Co je to 'Beliarův dráp'?
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_01");	//Je to převtělené zlo. Sestrojil ho sám Beliar.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_02");	//Každý, kdo ho používá, má hroznou zbraň ničení.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_03");	//Čím silnější je nositel, tím mocnější je i 'Dráp'.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_04");	//Jen ten, kdo má silného ducha a pevnou vůli, může odolat kletbě.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_05");	//Teď je mi už jasné, proč Stavitelé zablokovali tohle údolí.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_06");	//Přinesli tuto ďábelskou zbraň do svého města a oddali se jejímu kouzlu.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_07");	//Ti arogantní blázni zabili jeden druhého kvůli nenasytnosti.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_08");	//Krutost neskončila, Adanův hněv se stáhnul okolo této krajiny a vše se potopilo do hlubin moře.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_09");	//Vskutku. Stavitelé portálu velmi dobře ukryli tyto věci před zbytkem světa.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_10");	//Jak tragický konec pro tak úžasnou kulturu.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_11");	//Pochopil jsi naléhavost naší mise?
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_12");	//Raven je silný bojovník a je zaslepen touhou po moci.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_13");	//V jeho rukou se 'Dráp' stává nástrojem zkázy.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_14");	//Nesmí získat tu zbraň, jinak jsme všichni odsouzeni k záhubě.
	Log_CreateTopic(TOPIC_Addon_Klaue,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Klaue,LOG_Running);
	B_LogEntry(TOPIC_Addon_Klaue,"V Adanově chrámu je silná zbraň. Jmenuje se 'Beliarův dráp'. Raven se ji nesmí zmocnit.");
};

func void DIA_Addon_Saturas_TalkedToGhost_kammern()
{
	AI_Output(other,self,"DIA_Addon_Saturas_TalkedToGhost_kammern_15_00");	//Co jsou Adanovy komnaty?
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_kammern_14_01");	//Zjistili jsme, že brána není jediná překážka na cestě do svatyně.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_kammern_14_02");	//V chrámu jsou tři komnaty, jenž mají zastavit vetřelce.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_kammern_14_03");	//Barevné kamenné tabulky Stavitelů jsou klíčem.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_kammern_14_04");	//Jen když máš všechny desky a vyřešíš jejich hádanku, smíš vstoupit dovnitř.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_kammern_14_05");	//Nevím, jestli Raven rozluštil tajemství chrámu, ale pokud ano, tak máme velký problém.
	Log_CreateTopic(TOPIC_Addon_Kammern,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Kammern,LOG_Running);
	B_LogEntry(TOPIC_Addon_Kammern,LogText_Addon_Relicts);
	Log_CreateTopic(TOPIC_Addon_Relicts,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Relicts,LOG_Running);
	B_LogEntry_Quiet(TOPIC_Addon_Relicts,LogText_Addon_Relicts);
	Saturas_KnowsHow2GetInTempel = TRUE;
};

instance DIA_Addon_Saturas_RelictsBack(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = DIA_Addon_Saturas_RelictsBack_Condition;
	information = DIA_Addon_Saturas_RelictsBack_Info;
	description = "Co přesně mám v chrámu s deskami udělat?";
};


func int DIA_Addon_Saturas_RelictsBack_Condition()
{
	if((Saturas_SCBroughtAllToken == TRUE) && (Saturas_KnowsHow2GetInTempel == TRUE) && (RavenAway == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Saturas_RelictsBack_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_RelictsBack_15_00");	//Co přesně mám v chrámu s deskami udělat?
	AI_Output(self,other,"DIA_Addon_Saturas_RelictsBack_14_03");	//To zatím nevíme. Ale doufám, že to zjistíš, hned jak vstoupíš dovnitř.
	AI_Output(self,other,"DIA_Addon_Saturas_RelictsBack_14_05");	//Je mi líto, že ti nemohu říct víc. Teď už je všechno jenom na tobě.
	AI_Output(self,other,"DIA_Addon_Saturas_RelictsBack_14_06");	//Vem si ty tabulky a okamžitě běž do chrámu.
	CreateInvItems(hero,ItMi_Addon_Stone_01,1);
	CreateInvItems(hero,ItMi_Addon_Stone_02,1);
	CreateInvItems(hero,ItMi_Addon_Stone_03,1);
	CreateInvItems(hero,ItMi_Addon_Stone_04,1);
	CreateInvItems(hero,ItMi_Addon_Stone_05,1);
	B_GiveInvItemsManyThings(self,other);
	B_LogEntry(TOPIC_Addon_Kammern,"Saturas mě posíla do Adanova chrámu s pěti relikviemi po Stavitelích. Musím se dostat dovnitř a zastavit Ravena.");
	AI_Output(self,other,"DIA_Addon_Saturas_RelictsBack_14_07");	//Adane, slituj se nad ním a ochraň nás všechny.
	AI_Output(self,other,"DIA_Addon_Saturas_RelictsBack_14_08");	//Možná ještě není pozdě.
};

instance DIA_Addon_Saturas_RavensDead(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 2;
	condition = DIA_Addon_Saturas_RavensDead_Condition;
	information = DIA_Addon_Saturas_RavensDead_Info;
	important = TRUE;
};


func int DIA_Addon_Saturas_RavensDead_Condition()
{
	if(RavenIsDead == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_RavensDead_Info()
{
	B_GivePlayerXP(2000);
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_00");	//Zemětřesení se zastavilo a ty jsi ještě stále naživu.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_01");	//Splnil jsi tedy svůj úkol?
	AI_Output(other,self,"DIA_Addon_Saturas_RavensDead_15_02");	//Ano. Raven je mrtev.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_03");	//Potom je už po všem. Díky Adanovi.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_04");	//Vedl sis dobře synu. Jsme tvými dlužníky.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_05");	//Zachránil jsi tuto mocnou zbraň před Zlem a přinesl rovnováhu zpět do téhle části světa.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_06");	//Po dobu zemětřesení jsme se radili, co budeme dělat dál a dohodli jsme se následovně...
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_07");	//Vem si 'Beliarův dráp'. Je ti předurčen!
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_08");	//V tvých rukách, by mohl být mocným spojencem pro nás všechny.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_09");	//Používej ho moudře, můj synu. Adanos ti bude pomáhat.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_11");	//Zůstaneme zde, a ujistíme se, že chrám bude znovu zářit tak, jako kdysi.
	MIS_AdanosCrone = LOG_Success;
	Log_SetTopicStatus(TOPIC_AdanosCrone,LOG_Success);
	B_LogEntry(TOPIC_AdanosCrone,"Řekl jsem Saturasovi že je Raven mrtev!");
};

instance DIA_Addon_Saturas_MixyrBack(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = DIA_Addon_Saturas_MixyrBack_Condition;
	information = DIA_Addon_Saturas_MixyrBack_Info;
	description = "Vatras potřebuje pomoc ve městě.";
};

func int DIA_Addon_Saturas_MixyrBack_Condition()
{
	if(MIS_VatrasAbloesung == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_MixyrBack_Info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Addon_Saturas_MixyrBack_01_01");		//Vatras potřebuje pomoc ve městě.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_12");	//Obrať se na Myxira. Ten Vatrasovi pomůže.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_13");	//Již příliš dlouho zůstal Vatras ve městě sám.
	MyxirIsBack = TRUE;
	B_LogEntry(TOPIC_Addon_VatrasAbloesung,"Saturas posílá na pomoc Myxira.");
	AI_Teleport(KDW_14030_Addon_Myxir_ADW,"TOT");
	Npc_ExchangeRoutine(KDW_14030_Addon_Myxir_ADW,"TOT");
};

instance DIA_Addon_Saturas_FreedMissingPeople(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 2;
	condition = DIA_Addon_Saturas_FreedMissingPeople_Condition;
	information = DIA_Addon_Saturas_FreedMissingPeople_Info;
	description = "Osvobodil jsem vězně.";
};

func int DIA_Addon_Saturas_FreedMissingPeople_Condition()
{
	if(MissingPeopleReturnedHome == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_FreedMissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_FreedMissingPeople_15_00");	//Osvobodil jsem vězně.
	AI_Output(self,other,"DIA_Addon_Saturas_FreedMissingPeople_14_01");	//Velmi dobře. Teď se mohou vrátit zpět domů.
	B_GivePlayerXP(XP_Addon_Saturas_FreedMissingPeople);
};


instance DIA_Addon_Saturas_BeliarsWeapon(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = DIA_Addon_Saturas_BeliarsWeapon_Condition;
	information = DIA_Addon_Saturas_BeliarsWeapon_Info;
	description = "Našel jsem 'Beliarův dráp'.";
};

func int DIA_Addon_Saturas_BeliarsWeapon_Condition()
{
	if((RavenIsDead == TRUE) && C_ScHasBeliarsWeapon())
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_BeliarsWeapon_Info()
{
	AI_UnequipWeapons(hero);
	AI_Output(other,self,"DIA_Addon_Saturas_BeliarsWeapon_15_00");	//Našel jsem 'Beliarův dráp'.

	if(Npc_HasItems(hero,ItMw_BeliarWeapon_Raven) && (SC_FailedToEquipBeliarsWeapon == TRUE))
	{
		AI_Output(other,self,"DIA_Addon_Saturas_BeliarsWeapon_15_01");	//Ale nemohu ho použít.
	};

	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_14_02");	//Beliarův dráp je VELICE zvláštní zbraň.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_14_03");	//Má vlastní vůli i ducha.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_14_04");	//Ty, majitel této mocné zbraně, jsi její pán.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_14_05");	//Ta zbraň je částí tebe a přizpůsobuje se tvým schopnostem.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_14_06");	//Ale nemůžeš ji donutit, aby dělala, co si zamaneš.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_14_07");	//Jenom sám Beliar ji může donutit, aby tě poslouchala.
	AI_Output(other,self,"DIA_Addon_Saturas_BeliarsWeapon_besser_15_00");	//Proč by mi měl Beliar pomoci?
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_besser_14_01");	//Dosáhneš toho jenom modlitbou k němu.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_besser_14_02");	//Buď opatrný. Beliar je nejhorší.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_besser_14_03");	//Pokud ho rozzuříš, brzo to pocítíš.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_besser_14_04");	//A ještě něco bys měl vědět... (vážně)
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_besser_14_05");	//Nemůžeš doufat, že ti Beliar dá moc 'Drápu' jenom tak!
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_besser_14_06");	//Pokud s ním nebudeš v přízni, nebude tě ani poslouchat.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_besser_14_07");	//Čili zbraň můžeš použít jenom, když máš jeho přízeň!
	Log_CreateTopic(TOPIC_Addon_Klaue,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Klaue,LOG_Running);
	Log_AddEntry(TOPIC_Addon_Klaue,"Abych mohl ovládat 'Beliarův dráp', musím se pomodlit k Beliarovi a získat si jeho přízeň.");
	Info_ClearChoices(DIA_Addon_Saturas_BeliarsWeapon);
	Info_AddChoice(DIA_Addon_Saturas_BeliarsWeapon,"Co můžu dělat s touhle zbraní?",DIA_Addon_Saturas_BeliarsWeapon_wastun);
};

func void DIA_Addon_Saturas_BeliarsWeapon_wastun()
{
	AI_Output(other,self,"DIA_Addon_Saturas_BeliarsWeapon_wastun_15_00");	//Co můžu dělat s touhle zbraní?
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_wastun_14_01");	//To záleží na tobě. Ovládl jsi tu zbraň a teď jsi její pán.

	if(TASKFINDCLAW == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_wastun_14_02");	//Mohu ti dát jenom radu, co s ní můžeš udělat.
		AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_wastun_14_03");	//Buď mi ji odevzdáš, a já zaručím, že už nikdy nezpůsobí žádnou škodu...
		AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_wastun_14_04");	//... nebo využiješ její moc a použiješ ji k boji.
		Info_ClearChoices(DIA_Addon_Saturas_BeliarsWeapon);
		Info_AddChoice(DIA_Addon_Saturas_BeliarsWeapon,"Nemůžeš si tu zbraň nechat?",DIA_Addon_Saturas_BeliarsWeapon_geben);
	};
};

func void DIA_Addon_Saturas_BeliarsWeapon_geben()
{
	AI_Output(other,self,"DIA_Addon_Saturas_BeliarsWeapon_geben_15_00");	//Nemůžeš si tu zbraň nechat?
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_geben_14_03");	//Pokud mi ji dáš, zničím ji, takže už ji nikdo nebude moci zneužít.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_geben_14_04");	//Takže si promysli, co chceš.
	SaturasTakeClaw = TRUE;
	B_LogEntry(TOPIC_Addon_Klaue,"Můžu 'Beliarův dráp' odevzdat Saturasovi nebo si ho nechat.");
};

instance DIA_Addon_Saturas_PermENDE_ADDON(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = DIA_Addon_Saturas_PermENDE_ADDON_Condition;
	information = DIA_Addon_Saturas_PermENDE_ADDON_Info;
	permanent = TRUE;
	description = "Co teď budete dělat?";
};

func int DIA_Addon_Saturas_PermENDE_ADDON_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Saturas_RavensDead) && (AWORCINVASIONSTART == FALSE))
	{
		return TRUE;
	};
};

var int DIA_Addon_Saturas_PermENDE_ADDON_OneTime;

func void DIA_Addon_Saturas_PermENDE_ADDON_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_PermENDE_ADDON_15_00");	//Co teď budete dělat?
	AI_Output(self,other,"DIA_Addon_Saturas_PermENDE_ADDON_14_01");	//Zůstaneme tady a zajistíme, aby chrám opět odhalil svou krásu a velikost.
	AI_Output(self,other,"DIA_Addon_Saturas_PermENDE_ADDON_14_02");	//Tyto zdi chátrají již příliš dlouho.
	if(DIA_Addon_Saturas_PermENDE_ADDON_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Saturas_PermENDE_ADDON_14_03");	//Díky ti, synu...
		AI_Output(self,other,"DIA_Addon_Saturas_PermENDE_ADDON_14_04");	//Velmi jsem se v tobě mýlil. Jsi ochránce rovnováhy. O tom není pochyb.
		AI_Output(self,other,"DIA_Addon_Saturas_PermENDE_ADDON_14_05");	//Bez tvé pomoci a statečnosti by ostrov Khorinis zanikl. Děkujeme ti a budeme oslavovat tvou čest.
		AI_Output(self,other,"DIA_Addon_Saturas_PermENDE_ADDON_14_06");	//Soustřeď se na své další úkoly, které leží před tebou a udržuj tento svět v rovnováze a míru.
		AI_Output(self,other,"DIA_Addon_Saturas_PermENDE_ADDON_14_07");	//Jdi a přijmi svůj osud ochránce. Budeme se za tebe modlit.
		DIA_Addon_Saturas_PermENDE_ADDON_OneTime = TRUE;
	};
};

instance DIA_Addon_Saturas_BeliarWeapGeben(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = DIA_Addon_Saturas_BeliarWeapGeben_Condition;
	information = DIA_Addon_Saturas_BeliarWeapGeben_Info;
	description = "Vem si 'Beliarův dráp' a znič ho.";
};

func int DIA_Addon_Saturas_BeliarWeapGeben_Condition()
{
	if(C_ScHasBeliarsWeapon() && (RavenIsDead == TRUE) && (SaturasTakeClaw == TRUE) && (TASKFINDCLAW == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_BeliarWeapGeben_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_BeliarWeapGeben_15_00");	//Vem si 'Beliarův dráp' a znič ho.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarWeapGeben_14_01");	//Jak si přeješ, synu. Dej mi ho.
	B_ClearBeliarsWeapon();
	// AI_Print(b_formgivestring(other,1));
	AI_Print("Předáno 1x Beliarův dráp");
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarWeapGeben_14_02");	//Už nikdy nikomu neublíží. Zahodím ho do hlubin moře.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarWeapGeben_14_03");	//Adanos na to dohlédne.
	TOPIC_END_Klaue = TRUE;
	B_GivePlayerXP(XP_Addon_BeliarsWeaponAbgegeben);
	Saturas_KlaueInsMeer = TRUE;
};


instance DIA_ADDON_SATURAS_BELIARWEAPGEBENBACK(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = dia_addon_saturas_beliarweapgebenback_condition;
	information = dia_addon_saturas_beliarweapgebenback_info;
	permanent = FALSE;
	description = "Stále máš Dráp?!";
};

func int dia_addon_saturas_beliarweapgebenback_condition()
{
	if((Saturas_KlaueInsMeer == TRUE) && (TASKFINDCLAW == TRUE) && (MIS_GOLDDRAGONPORTAL == LOG_Running) && !Npc_KnowsInfo(other,dia_dragon_gold_whatman))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_beliarweapgebenback_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_BeliarWeapGebenBack_15_00");	//Stále máš Dráp?!
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarWeapGebenBack_14_01");	//Ano - stále.
	AI_Output(other,self,"DIA_Addon_Saturas_BeliarWeapGebenBack_14_02");	//Nechystal ses ho zničit?
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarWeapGebenBack_14_03");	//Ukázalo se, že to není lehké! Stále nevím, jak to udělat.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarWeapGebenBack_14_04");	//Ale Adanova moudrost mi pomůže. Proč tě to vlastně zajímá?
	AI_Output(other,self,"DIA_Addon_Saturas_BeliarWeapGebenBack_14_05");	//Potřebuji ho. Můžeš mi ho vrátit?
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarWeapGebenBack_14_06");	//Proč?... (udiveně)
	AI_Output(other,self,"DIA_Addon_Saturas_BeliarWeapGebenBack_14_07");	//Věř mi, je to velice důležité!
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarWeapGebenBack_14_08");	//Tvá slova znějí zvláštně, avšak nemám důvod ti nevěřit...
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarWeapGebenBack_14_09");	//Pokud je to pro tebe tak důležité... Tady, vezmi si ho.
	B_GiveInvItems(self,other,ItMw_BeliarWeapon_Raven,1);
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarWeapGebenBack_14_12");	//Doufám, že víš, co děláš...
};

instance DIA_ADDON_SATURAS_CANBEWATERMAGE(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_canbewatermage_condition;
	information = dia_addon_saturas_canbewatermage_info;
	permanent = FALSE;
	description = "Můžu již nosit roucho mága Vody, mistře?";
};

func int dia_addon_saturas_canbewatermage_condition()
{
	if(hero.guild == GIL_NDW)
	{
		return TRUE;
	};
};

func void dia_addon_saturas_canbewatermage_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_CanBeWaterMage_14_00");	//Můžu již nosit roucho mága Vody, mistře?

	if(ATR_INTELLECT >= 40)
	{
		AI_Output(self,other,"DIA_Addon_Saturas_CanBeWaterMage_14_01");	//Ano! Myslím, že čas nadešel.
		AI_Output(self,other,"DIA_Addon_Saturas_CanBeWaterMage_14_02");	//Po celý čas jsi nosil roucho novice a dokázal jsi, že jsi toho hoden.
		AI_Output(self,other,"DIA_Addon_Saturas_CanBeWaterMage_14_03");	//Taktéž jsi dokázal, že jsi ochoten následovat Adana, i kdyby tě to mělo stát život.
		AI_Output(self,other,"DIA_Addon_Saturas_CanBeWaterMage_14_04");	//Zvažuji, jestli jsi připraven přijmout tento dar a vstoupit do našeho rádu.
		AI_Output(self,other,"DIA_Addon_Saturas_CanBeWaterMage_14_05");	//Měl bys to však zvážit i ty, protože je to závazné a šlechetné rozhodnutí.
		AI_Output(self,other,"DIA_Addon_Saturas_CanBeWaterMage_14_06");	//Myslím, že nadešel čas, abys to skutečně zvážil.
		AI_Output(self,other,"DIA_Addon_Saturas_CanBeWaterMage_14_07");	//Máš času, kolik chceš!
		AI_Output(self,other,"DIA_Addon_Saturas_CanBeWaterMage_14_08");	//A pokud se rozhodneš, řekni mi, a já tě přijmu do kruhu následovníků Adanových.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Saturas_CanBeWaterMage_14_09");	//Ještě nepřišel tvůj čas synu.
		AI_Output(self,other,"DIA_Addon_Saturas_CanBeWaterMage_14_10");	//Síla tvoji mysli ještě není dostatečná.
		Log_CreateTopic(TOPIC_KDW_Accept,LOG_NOTE);
		B_LogEntry(TOPIC_KDW_Accept,"Podle Saturase mi ještě chybí zkušenosti, abych se připojil do Kruhu mágů Vody. (Požadavek: nejméně 40 jednotek inteligence)");
	};
};

instance DIA_ADDON_SATURAS_BEWATERMAGE(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_bewatermage_condition;
	information = dia_addon_saturas_bewatermage_info;
	permanent = TRUE;
	description = "Jsem připraven stát se mágem Vody.";
};

func int dia_addon_saturas_bewatermage_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_saturas_canbewatermage) && (hero.guild == GIL_NDW))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_bewatermage_info()
{
	if(ATR_INTELLECT < 40)
	{
		AI_Output(self,other,"DIA_Addon_Saturas_CanBeWaterMage_14_09");	//Ještě nepřišel tvůj čas synu.
		AI_Output(self,other,"DIA_Addon_Saturas_CanBeWaterMage_14_10");	//Síla tvoji mysli ještě není dostatečná.
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Saturas_BeWaterMage_14_00");	//Jsem připraven stát se mágem Vody.
		AI_Output(self,other,"DIA_Addon_Saturas_BeWaterMage_14_01");	//Promyslel sis to a je to tvé konečné rozhodnutí?
		AI_Output(other,self,"DIA_Addon_Saturas_BeWaterMage_14_02");	//Ano, je.
		AI_Output(self,other,"DIA_Addon_Saturas_BeWaterMage_14_03");	//Pamatuj, jak jsem ti řekl, není to volba na den anebo měsíc, nýbrž na celý život. Rozumíš?
		AI_Output(other,self,"DIA_Addon_Saturas_BeWaterMage_14_04");	//Ano.
		AI_Output(self,other,"DIA_Addon_Saturas_BeWaterMage_14_05");	//Dobrá tedy. Jsi připraven složit přísahu?
		AI_Output(other,self,"DIA_Addon_Saturas_BeWaterMage_14_06");	//Jsem připraven složit přísahu.
		AI_Output(self,other,"DIA_Addon_Saturas_BeWaterMage_14_07");	//Tak tedy přijmi požehnání Vody a Adana!
		AI_Output(self,other,"DIA_Addon_Saturas_BeWaterMage_14_08");	//Opakuj po mne slova přísahy:
		AI_Output(self,other,"DIA_Addon_Saturas_BeWaterMage_14_09");	//Přísahám při moci bohů...
		AI_Output(other,self,"DIA_Addon_Saturas_BeWaterMage_14_10");	//Přísahám při moci bohů...
		AI_Output(self,other,"DIA_Addon_Saturas_BeWaterMage_14_11");	//... a při síle svaté Vody...
		AI_Output(other,self,"DIA_Addon_Saturas_BeWaterMage_14_12");	//... a při síle svaté Vody...
		AI_Output(self,other,"DIA_Addon_Saturas_BeWaterMage_14_13");	//... že mé vědomosti a činy budou sloužit Vodě až do konce dní...
		AI_Output(other,self,"DIA_Addon_Saturas_BeWaterMage_14_14");	//... že mé vědomosti a činy budou sloužit Vodě až do konce dní...
		AI_Output(self,other,"DIA_Addon_Saturas_BeWaterMage_14_15");	//... dokud mé dočasné tělo nenajde odpočinek v Beliarových komnatách a zdroj mého života se nevyčerpá.
		AI_Output(other,self,"DIA_Addon_Saturas_BeWaterMage_14_16");	//... dokud mé dočasné tělo nenajde odpočinek v Beliarových komnatách a zdroj mého života se nevyčerpá.
		AI_Output(self,other,"DIA_Addon_Saturas_BeWaterMage_14_17");	//Tato přísaha ti dala sílu a požehnání Vody.
		AI_Output(self,other,"DIA_Addon_Saturas_BeWaterMage_14_18");	//Nos tohle roucho na znak spojení s posvátnou Vodou a Adanem.
		CreateInvItems(self,ITAR_KDW_L_Addon,1);
		B_GiveInvItems(self,other,ITAR_KDW_L_Addon,1);
		other.guild = GIL_KDW;
		CheckHeroGuild[0] = TRUE;
		Snd_Play("GUILD_INV");
		Mdl_ApplyOverlayMds(hero,"Humans_Mage.mds");
		B_GivePlayerXP(XP_BecomeMage);
		ATR_INTELLECT += 10;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_PrintClr("Inteligence + 10",83,152,48);
		AI_Output(self,other,"DIA_Addon_Saturas_BeWaterMage_14_1A");	//Taktéž přijmi tuto magickou hůl. Jenom nám, mágům Vody, je dopřáno ji vlastnit a použít!
		CreateInvItems(self,ITMW_2H_G3_STAFFWATER_01,1);
		B_GiveInvItems(self,other,ITMW_2H_G3_STAFFWATER_01,1);
		AI_Output(other,self,"DIA_Addon_Saturas_BeWaterMage_14_19");	//A jaké jsou teď mé povinnosti?
		AI_Output(self,other,"DIA_Addon_Saturas_BeWaterMage_14_20");	//Tvou základní povinností je teď přinášet dobro a moudrost Adana všem živým.
		AI_Output(self,other,"DIA_Addon_Saturas_BeWaterMage_14_21");	//Konej moudře a pamatuj na odpovědnost, kterou přináší tvé postavení.
		AI_Output(self,other,"DIA_Addon_Saturas_BeWaterMage_14_22");	//Nechť tě Adanos provází, bratře!
		AI_StopProcessInfos(self);
	};
};

instance DIA_Addon_Saturas_ADW_PreTeachCircle(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 10;
	condition = DIA_Addon_Saturas_ADW_PreTeachCircle_Condition;
	information = DIA_Addon_Saturas_ADW_PreTeachCircle_Info;
	permanent = FALSE;
	description = "Můžeš mě naučit magii Vody?";
};


func int DIA_Addon_Saturas_ADW_PreTeachCircle_Condition()
{
	if(hero.guild == GIL_KDW)
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_ADW_PreTeachCircle_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_PreTeachCircle_15_00");	//Můžeš mě naučit magii Vody?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_PreTeachCircle_14_10");	//Když jsi teď mágem Vody, s velikým potěšením tě zasvětím do kruhů magie.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_PreTeachCircle_14_11");	//Mimo to tě Nefarius může naučit vytvářet runy a Merdarion ti pomůže zvýšit tvou magickou sílu.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_PreTeachCircle_14_12");	//Cronos ti vždy poskytne svitky magie Vody a Riordian tě naučí připravit různé lektvary.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_PreTeachCircle_14_13");	//Přirozeně můžeš vždy počítat s naší pomocí, bratře.
	Saturas_Addon_TeachCircle = TRUE;
	Log_CreateTopic(TOPIC_Addon_KDWTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_Addon_KDWTeacher,LogText_Addon_SaturasTeach);
};


instance DIA_ADDON_SATURAS_ADW_EXPLAINCIRCLES(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	condition = dia_addon_saturas_adw_explaincircles_condition;
	information = dia_addon_saturas_adw_explaincircles_info;
	important = FALSE;
	permanent = FALSE;
	description = "Můžeš mi, prosím, vysvětlit, co jsou kruhy magie?";
};


func int dia_addon_saturas_adw_explaincircles_condition()
{
	if((hero.guild == GIL_KDW) && Npc_KnowsInfo(other,DIA_Addon_Saturas_ADW_PreTeachCircle))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_explaincircles_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_EXPLAINCIRCLES_Info_15_01");	//Můžeš mi, prosím, vysvětlit, co jsou kruhy magie?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_EXPLAINCIRCLES_Info_14_02");	//S radostí. Kruhy symbolizují, jak chápeš magii.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_EXPLAINCIRCLES_Info_14_03");	//Ukazují úroveň tvých schopností a vědomostí, zároveň i jaké kouzla se můžeš naučit.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_EXPLAINCIRCLES_Info_14_04");	//Měl bys plně ovládnout jeden kruh, pokud se chceš naučit další.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_EXPLAINCIRCLES_Info_14_05");	//Musíš trénovat dlouhé hodiny a mít mnoho zkušeností, abys mohl ovládnout nejvyšší kruhy.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_EXPLAINCIRCLES_Info_14_06");	//Odměnou ti budou nová kouzla. Kruhy magie však znamenají mnohem víc.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_EXPLAINCIRCLES_Info_14_07");	//Jsou součástí tvého života. Vždy budou s tebou. Jsou součástí tebe.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_EXPLAINCIRCLES_Info_14_08");	//Abys pochopil jejich sílu, musíš poznat sebe.
	EXPLAINCIRCLEMEAN = TRUE;
};


instance DIA_ADDON_SATURAS_ADW_TEACHFIRSTCIRCLE(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 10;
	condition = dia_addon_saturas_adw_teachfirstcircle_condition;
	information = dia_addon_saturas_adw_teachfirstcircle_info;
	permanent = TRUE;
	description = "Nauč mě první kruh magie. (VB: 20)";
};


func int dia_addon_saturas_adw_teachfirstcircle_condition()
{
	if((hero.guild == GIL_KDW) && (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) < 1) && (CanLearnMagicCircleNext_ABCZ(1) == TRUE) && (Saturas_Addon_TeachCircle == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_teachfirstcircle_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_TeachFirstCircle_01_00");	//Nauč mě první kruh magie.

	if(B_TeachMagicCircle(self,other,1))
	{
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_TeachFirstCircle_01_03");	//V prvním kruhu se naučíš použít magické runy.
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_TeachFirstCircle_01_04");	//Každá runa obsahuje speciální kouzlo.
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_TeachFirstCircle_01_05");	//Svou vlastní magickou sílou si můžeš vytvořit vlastní runy.
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_TeachFirstCircle_01_06");	//Avšak narozdíl od svitků, runa drží strukturu kouzla navždy.
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_TeachFirstCircle_01_07");	//Každá runa v sobě obsahuje magickou sílu, kterou můžeš kdykoli využít.
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_TeachFirstCircle_01_08");	//Jako u svitků, když runu používáš, spotřebuješ svou vlastní magickou energii.
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_TeachFirstCircle_01_09");	//S každým kruhem se naučíš víc a víc o runách.
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_TeachFirstCircle_01_10");	//Použij jejich sílu a poznej sebe.
	};
};


instance DIA_Addon_Saturas_ADW_CIRCLE(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 99;
	condition = DIA_Addon_Saturas_ADW_CIRCLE_Condition;
	information = DIA_Addon_Saturas_ADW_CIRCLE_Info;
	permanent = TRUE;
	description = "Jsem připraven vstoupit do dalšího kruhu magie.";
};

var int DIA_Addon_Saturas_ADW_CIRCLE_NoPerm;

func int DIA_Addon_Saturas_ADW_CIRCLE_Condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 1) && (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) <= 6) && (Saturas_Addon_TeachCircle == TRUE) && (DIA_Addon_Saturas_ADW_CIRCLE_NoPerm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_ADW_CIRCLE_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_CIRCLE_15_00");	//Jsem připraven vstoupit do dalšího kruhu magie.
	Info_ClearChoices(DIA_Addon_Saturas_ADW_CIRCLE);
	Info_AddChoice(DIA_Addon_Saturas_ADW_CIRCLE,Dialog_Back,DIA_Addon_Saturas_ADW_CIRCLE_Back);

	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 1) && (CanLearnMagicCircleNext_ABCZ(2) == TRUE))
	{
		Info_AddChoice(DIA_Addon_Saturas_ADW_CIRCLE,"2. kruh magie (VB: 30)",DIA_Addon_Saturas_ADW_CIRCLE_2);
	}
	else if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 2) && (CanLearnMagicCircleNext_ABCZ(3) == TRUE))
	{
		Info_AddChoice(DIA_Addon_Saturas_ADW_CIRCLE,"3. kruh magie (VB: 40)",DIA_Addon_Saturas_ADW_CIRCLE_3);
	}
	else if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 3) && (CanLearnMagicCircleNext_ABCZ(4) == TRUE))
	{
		Info_AddChoice(DIA_Addon_Saturas_ADW_CIRCLE,"4. kruh magie (VB: 60)",DIA_Addon_Saturas_ADW_CIRCLE_4);
	}
	else if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 4) && (CanLearnMagicCircleNext_ABCZ(5) == TRUE))
	{
		Info_AddChoice(DIA_Addon_Saturas_ADW_CIRCLE,"5. kruh magie (VB: 80)",DIA_Addon_Saturas_ADW_CIRCLE_5);
	}
	else if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 5) && (CanLearnMagicCircleNext_ABCZ(6) == TRUE))
	{
		Info_AddChoice(DIA_Addon_Saturas_ADW_CIRCLE,"6. kruh magie (VB: 100)",DIA_Addon_Saturas_ADW_CIRCLE_6);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_12");	//Nejsi ještě připraven! Vrať se později.
	};
};

func void DIA_Addon_Saturas_ADW_CIRCLE_Back()
{
	Info_ClearChoices(DIA_Addon_Saturas_ADW_CIRCLE);
};

func void DIA_Addon_Saturas_ADW_CIRCLE_2()
{
	if(B_TeachMagicCircle(self,other,2))
	{
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_01");	//Ano, jsi připraven naučit se víc.
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_02");	//Vstup nyní do druhého kruhu magie. Nechť ti Adanos dá sílu použít tvé schopnosti moudře.
	};
	Info_ClearChoices(DIA_Addon_Saturas_ADW_CIRCLE);
};

func void DIA_Addon_Saturas_ADW_CIRCLE_3()
{
	if(B_TeachMagicCircle(self,other,3))
	{
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_03");	//Ano, je správný čas. Vstup teď do třetího kruhu magie.
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_04");	//Tvé vědomosti ti teď umožní použít nové, mocnější kouzla. Použij je dobře.
	};
	Info_ClearChoices(DIA_Addon_Saturas_ADW_CIRCLE);
};

func void DIA_Addon_Saturas_ADW_CIRCLE_4()
{
	if(B_TeachMagicCircle(self,other,4))
	{
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_05");	//Čas nadešel. Jsi připraven vstoupit do čtvrtého kruhu magie.
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_06");	//Mocná jsou teď tvá slova a skutky. Vždy vybírej svá kouzla starostlivě a rozumně.
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_0A");	//A ještě něco. Se čtvrtým kruhem získáváš nejvyšší roucho mágů Vody. Nos ho se ctí.
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_0B");	//Předtím se to zdálo nemožné, ale teď jsi jeden z Adanových nejlepších!
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_0C");	//Tady, vezmi si roucho.
		CreateInvItems(hero,ItMW_Addon_Stab02,1);
		CreateInvItems(self,itar_kdw_h,1);
		B_GiveInvItems(self,other,itar_kdw_h,1);
	};
	Info_ClearChoices(DIA_Addon_Saturas_ADW_CIRCLE);
};

func void DIA_Addon_Saturas_ADW_CIRCLE_5()
{
	if(B_TeachMagicCircle(self,other,5))
	{
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_07");	//Teď máš privilegium vstoupit do pátého kruhu magie.
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_08");	//Kouzla, která teď můžeš studovat, můžou být skutečně ničivá.
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_09");	//Takže buď opatrný a zastav se v pravý čas.
	};
	Info_ClearChoices(DIA_Addon_Saturas_ADW_CIRCLE);
};

func void DIA_Addon_Saturas_ADW_CIRCLE_6()
{
	if(B_TeachMagicCircle(self,other,6))
	{
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_13");	//Mnoho času uběhlo od doby, kdy sis zvolil cestu Adana. Naučil ses mnoho!
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_14");	//Nadešel čas, aby ses naučil poslední věc, kterou nám náš patron dal.
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_15");	//Vstupuješ do šestého kruhu - se kterým ovládneš nejsilnější kouzla mágů Vody.
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_16");	//Všímej si, že do šestého kruhu mohou vstoupit jenom ti nejmocnější. Poznamenává totiž život.
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_17");	//Znamením je Voda!
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_18");	//Šestý kruh ti umožní použít všechny runy.
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_19");	//Též nezapomeň: nežeň se za silou, buď jejím zdrojem.
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_20");	//Konej moudře, rozvážně a snaž se použít své vědomosti pro světlo a dobro Adana!
		DIA_Addon_Saturas_ADW_CIRCLE_NoPerm = TRUE;
	};
	Info_ClearChoices(DIA_Addon_Saturas_ADW_CIRCLE);
};

instance DIA_ADDON_SATURAS_MAXROBE(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 2;
	condition = dia_addon_saturas_MAXROBE_condition;
	information = dia_addon_saturas_MAXROBE_info;
	permanent = FALSE;
	description = "Jak mohu získat lepší roucho?";
};

func int dia_addon_saturas_MAXROBE_condition()
{
	if((hero.guild == GIL_KDW) && (Kapitel >= 5) && (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 6) && (LastRobeKDW == FALSE) && (MAXROBE_Permanent == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_MAXROBE_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_MAXROBE_01_00");	//Jak mohu získat lepší roucho?
	AI_Output(self,other,"DIA_Addon_Saturas_MAXROBE_01_01");	//Vzhledem k tomu, že jsi dokončil všech šest kruhů magie, jsi hoden nosit roucho arcimága Vody.
	AI_Output(self,other,"DIA_Addon_Saturas_MAXROBE_01_02");	//Nicméně, budeš za něj muset zaplatit. Jeho výroba je příliš drahá, abys ho mohl dostat darem.
	AI_Output(other,self,"DIA_Addon_Saturas_MAXROBE_01_03");	//Rozumím.
	LastRobeKDW = TRUE;
};

instance DIA_ADDON_SATURAS_MAXROBE_Buy(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 2;
	condition = dia_addon_saturas_MAXROBE_Buy_condition;
	information = dia_addon_saturas_MAXROBE_Buy_info;
	permanent = TRUE;
	description = "Prodej mi roucho arcimága Vody. (cena: 20000 zlatých)";
};

func int dia_addon_saturas_MAXROBE_Buy_condition()
{
	if((hero.guild == GIL_KDW) && (LastRobeKDW == TRUE) && (MAXROBE_Permanent == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_MAXROBE_Buy_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_MAXROBE_Buy_01_00");	//Prodej mi roucho arcimága Vody.

	if(Npc_HasItems(hero,ItMi_Gold) >= 20000)
	{
		B_GiveInvItems(other,self,ItMi_Gold,20000);
		Npc_RemoveInvItems(self,ItMi_Gold,20000);
		AI_Output(self,other,"DIA_Addon_Saturas_MAXROBE_Buy_01");	//Výborně, tady je.
		AI_Output(self,other,"DIA_Addon_Saturas_MAXROBE_Buy_02");	//Je to velká čest! Nezapomínej.
		CreateInvItems(self,itar_kdw_sh,1);
		B_GiveInvItems(self,other,itar_kdw_sh,1);
		MAXROBE_Permanent = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Saturas_MAXROBE_Buy_01_03");	//Nemáš dost zlata.
	};
};

instance DIA_ADDON_SATURAS_KAPITEL3(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 2;
	condition = dia_addon_saturas_kapitel3_condition;
	information = dia_addon_saturas_kapitel3_info;
	permanent = FALSE;
	description = "Jak to jde?";
};

func int dia_addon_saturas_kapitel3_condition()
{
	if((Kapitel == 3) && (RavenAway == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_kapitel3_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_Kapitel3_15_00");	//Jak to jde?
	AI_Output(self,other,"DIA_Addon_Saturas_Kapitel3_14_01");	//Postupujeme pomalu.
	AI_Output(self,other,"DIA_Addon_Saturas_Kapitel3_14_02");	//Zdržují nás banditi v bažině.
	AI_Output(self,other,"DIA_Addon_Saturas_Kapitel3_14_03");	//Díky nim nemůžeme začít studovat Adanův chrám.
};


instance DIA_ADDON_SATURAS_KAPITEL4(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 2;
	condition = dia_addon_saturas_kapitel4_condition;
	information = dia_addon_saturas_kapitel4_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_saturas_kapitel4_condition()
{
	if((Kapitel >= 4) && (RavenAway == TRUE) && (AWORCINVASIONSTART == FALSE) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_kapitel4_info()
{
	AI_Output(self,other,"DIA_Addon_Saturas_Kapitel4_01_01");	//Díky bohům, že jsi tu!
 	AI_Output(self,other,"DIA_Addon_Saturas_Kapitel4_01_02");	//(vyděšeně) Dějí se hrozné věci...
 	AI_Output(self,other,"DIA_Addon_Saturas_Kapitel4_01_04");	//Skřeti narušili Adanovo posvátné území!
	AI_Output(other,self,"DIA_Addon_Saturas_Kapitel4_01_05");	//Skřeti? Tady?!
	AI_Output(self,other,"DIA_Addon_Saturas_Kapitel4_01_06");	//Ano, a je jich mnoho. Přímo nespočetně! A každý den přicházejí další hordy...
	AI_Output(self,other,"DIA_Addon_Saturas_Kapitel4_01_09");	//Ovládli prakticky celé údolí... A je jen záležitostí času, kdy přijdou sem.
	AI_Output(self,other,"DIA_Addon_Saturas_Kapitel4_01_11");	//Kromě toho, kdyby našli portál do Khorinisu... Neodvážím se vyslovit, co by nastalo!
	AI_Output(self,other,"DIA_Addon_Saturas_Kapitel4_01_13");	//Měl bys nám pomoci. Jsi naše jediná naděje!
	AI_Output(other,self,"DIA_Addon_Saturas_Kapitel4_01_14");	//Co můžu udělat?
	AI_Output(self,other,"DIA_Addon_Saturas_Kapitel4_01_15");	//Skřeti, co se tu objevili, nejsou jako ty obyčejné skupiny.
	AI_Output(self,other,"DIA_Addon_Saturas_Kapitel4_01_16");	//Je to kompletní, efektivní armáda. A každou armádu někdo řídí.
	AI_Output(other,self,"DIA_Addon_Saturas_Kapitel4_01_17");	//Co naznačuješ?
	AI_Output(self,other,"DIA_Addon_Saturas_Kapitel4_01_18");	//Naznačuji, že nejlépe se s monstrem vypořádáš tak, že mu odsekneš hlavu...
	AI_Output(self,other,"DIA_Addon_Saturas_Kapitel4_01_23");	//Před několika dny jsme zahlédli skupinu, která šla ke starobylým chrámům na západě.
	AI_Output(self,other,"DIA_Addon_Saturas_Kapitel4_01_24");	//Další velká skupina mířila k táboru banditů.
	AI_Output(self,other,"DIA_Addon_Saturas_Kapitel4_01_25");	//To je vše, co vím...
	AI_Output(other,self,"DIA_Addon_Saturas_Kapitel4_01_26");	//Hm, není to moc... Dobře tedy, pokusím se to nějak vyřešit.
	AI_Output(self,other,"DIA_Addon_Saturas_Kapitel4_01_27");	//Ano, Adanos ti žehnej, synu. Všichni v tebe doufáme!
	AWORCINVASIONSTART = TRUE;
	MIS_ADW_ORCINVASION = LOG_Running;
	Log_CreateTopic(TOPIC_ADW_ORCINVASION,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADW_ORCINVASION,LOG_Running);
	B_LogEntry(TOPIC_ADW_ORCINVASION,"Saturas mi řekl hrozné zprávy! V údolí se usadila celá armáda skřetů. Mágové Vody se bojí, že najdou portál do Khorinisu a to nemůžeme v žádném případě dopustit. Saturas mě požádal o pomoc. Jelikož bojovat s celou armádou je sebevražda, měl bych najít a odstranit jejich vůdce.");
	Log_AddEntry(TOPIC_ADW_ORCINVASION,"Saturas mi řekl, že viděl, jak se jedna skupina vydala k ruinám na západ a druhá na východ, k táboru banditů.");
	AI_StopProcessInfos(self);
	B_RemoveNpc(BDT_1091_Addon_Lucia);
	B_KillNpc(BDT_1095_Addon_Crimson);
	B_KillNpc(BDT_10023_Addon_Wache);
	B_KillNpc(BDT_10024_Addon_Garaz);
	B_KillNpc(STRF_1131_Addon_Sklave);
	B_KillNpc(STRF_1132_Addon_Sklave);
	B_KillNpc(STRF_1133_Addon_Sklave);
	B_KillNpc(STRF_1134_Addon_Sklave);
	B_KillNpc(STRF_1135_Addon_Sklave);
	B_KillNpc(STRF_1128_Addon_Sklave);
	B_KillNpc(STRF_1129_Addon_Sklave);
	B_KillNpc(STRF_1130_Addon_Sklave);
	B_KillNpc(STRF_1136_Addon_Sklave);
	B_KillNpc(STRF_1137_Addon_Sklave);
	B_KillNpc(STRF_1138_Addon_Sklave);
	B_KillNpc(STRF_1139_Addon_Sklave);
	B_KillNpc(STRF_1140_Addon_Sklave);
	B_KillNpc(BDT_10025_Addon_Wache);
	B_KillNpc(BDT_10026_Addon_Wache);
	B_KillNpc(BDT_10027_Addon_Buddler);
	B_KillNpc(BDT_10028_Addon_Buddler);
	B_KillNpc(BDT_10029_Addon_Buddler);
	B_KillNpc(BDT_10030_Addon_Buddler);
	B_KillNpc(BDT_1093_Addon_Franco);
	B_KillNpc(BDT_10011_Addon_Bandit);
	B_KillNpc(BDT_10012_Addon_Bandit);
	B_KillNpc(BDT_1076_Addon_Bandit);
	B_KillNpc(BDT_1077_Addon_Bandit);
	B_KillNpc(BDT_1073_Addon_Sancho);
	B_KillNpc(BDT_1087_Addon_Bandit);
	B_KillNpc(BDT_1072_Addon_Logan);
	B_KillNpc(BDT_1074_Addon_Edgor);
	B_KillNpc(BDT_1078_Addon_Bandit);
	B_KillNpc(BDT_1071_Addon_Ramon);
	B_KillNpc(BDT_10004_Addon_Finn);
	B_KillNpc(BDT_1088_Addon_Torwache);
	B_KillNpc(BDT_1083_Addon_Esteban);
	B_KillNpc(BDT_1081_Addon_Wache_01);
	B_KillNpc(BDT_10005_Addon_Wache_02);
	B_KillNpc(BDT_1099_Addon_Huno);
	B_KillNpc(BDT_1070_Addon_Paul);
	B_KillNpc(BDT_1082_Addon_Skinner);
	B_KillNpc(BDT_1075_Addon_Fortuno);
	B_KillNpc(BDT_1084_Addon_Senyan);
	B_KillNpc(BDT_10015_Addon_Emilio);
	B_KillNpc(BDT_1096_Addon_Lennar);
	B_KillNpc(BDT_1079_Addon_Carlos);
	B_KillNpc(BDT_10031_Addon_Wache);
	B_KillNpc(STRF_1141_Addon_Sklave);
	B_KillNpc(STRF_1142_Addon_Sklave);
	B_KillNpc(STRF_1143_Addon_Sklave);
	B_KillNpc(STRF_1144_Addon_Sklave);
	B_KillNpc(BDT_10001_Addon_Bandit_L);
	B_KillNpc(BDT_10002_Addon_Bandit_M);
	B_KillNpc(BDT_10003_Addon_Bandit_H);
	B_KillNpc(BDT_10006_Addon_Bandit);
	B_KillNpc(BDT_10007_Addon_Bandit);
	B_KillNpc(BDT_10008_Addon_Bandit);
	B_KillNpc(BDT_10009_Addon_Bandit);
	B_KillNpc(BDT_10010_Addon_Bandit);
	B_KillNpc(BDT_10018_Addon_Torwache);
	B_KillNpc(BDT_10019_Addon_Wache);
	B_KillNpc(BDT_10020_Addon_Wache);
	B_KillNpc(BDT_10021_Addon_Wache);

	if(Npc_IsDead(BDT_10022_Addon_Miguel) == FALSE)
	{
		AI_Teleport(BDT_10022_Addon_Miguel,"ADW_PIRATECAMP_CAVE3_92");
		Npc_ExchangeRoutine(BDT_10022_Addon_Miguel,"OrcInvasion");
		MIGUEL_TP = TRUE;
	};
	if(Npc_IsDead(BDT_1097_Addon_Fisk) == FALSE)
	{
		AI_Teleport(BDT_1097_Addon_Fisk,"ADW_PIRATECAMP_CAVE3_91");
		Npc_ExchangeRoutine(BDT_1097_Addon_Fisk,"OrcInvasion");
		FISK_TP = TRUE;
	};
	if(Npc_IsDead(BDT_1080_Addon_Tom) == FALSE)
	{
		AI_Teleport(BDT_1080_Addon_Tom,"ADW_PIRATECAMP_CAVE3_90");
		Npc_ExchangeRoutine(BDT_1080_Addon_Tom,"OrcInvasion");
		TOM_TP = TRUE;
	};
	if(Npc_IsDead(BDT_10014_Addon_Thorus) == FALSE)
	{
		AI_Teleport(BDT_10014_Addon_Thorus,"ADW_PIRATECAMP_CAVE3_01");
		Npc_ExchangeRoutine(BDT_10014_Addon_Thorus,"OrcInvasion");
		THORUS_TP = TRUE;
	};
	if(Npc_IsDead(BDT_1086_Addon_Scatty) == FALSE)
	{
		AI_Teleport(BDT_1086_Addon_Scatty,"ADW_PIRATECAMP_CAVE3_03");
		Npc_ExchangeRoutine(BDT_1086_Addon_Scatty,"OrcInvasion");
		SCATTY_TP = TRUE;
	};
	if(Npc_IsDead(BDT_1098_Addon_Snaf) == FALSE)
	{
		AI_Teleport(BDT_1098_Addon_Snaf,"ADW_PIRATECAMP_CAVE3_04");
		Npc_ExchangeRoutine(BDT_1098_Addon_Snaf,"OrcInvasion");
		SNAF_TP = TRUE;
	};
	if((Npc_IsDead(BDT_4568_KINJARTS) == FALSE) && (KinjartsIns == TRUE))
	{
		AI_Teleport(BDT_4568_KINJARTS,"ADW_PIRATECAMP_CAVE3_01");
		Npc_ExchangeRoutine(BDT_4568_KINJARTS,"Invasion");
	};

	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ORKINCAMP_01");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ORKINCAMP_03");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ORKINCAMP_05");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ORKINCAMP_07");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ORKINCAMP_09");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ORKINCAMP_11");
	Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ORKINCAMP_12");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ORKINCAMP_14");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ORKINCAMP_16");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ORKINCAMP_18");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ORKINCAMP_20");
	Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ORKINCAMP_22");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ORKINCAMP_24");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ORKINCAMP_26");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ORKINCAMP_28");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ORKINCAMP_30");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ORKINCAMP_32");
	Wld_InsertNpc(orkelite_addon3,"FP_ROAM_ORKINCAMP_35");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ORKINCAMP_37");
	Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ORKINCAMP_39");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ORKINCAMP_41");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ORKINCAMP_43");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ORKINCAMP_45");
	Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ORKINCAMP_47");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ORKINCAMP_49");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ORKINCAMP_51");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ORKINCAMP_53");
	Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ORKINCAMP_55");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ORKINCAMP_57");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ORKINCAMP_59");
	Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ENTRANCEORCGUARD_01");
	Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ENTRANCEORCGUARD_03");
	Wld_InsertNpc(orkelite_bowmenroam,"FP_ROAM_ENTRANCEORCGUARD_05");
	Wld_InsertNpc(orkelite_bowmenroam,"FP_ROAM_ENTRANCEORCGUARD_07");
	Wld_InsertNpc(orkelite_bowmenroam,"FP_ROAM_ENTRANCEORCGUARD_09");
	Wld_InsertNpc(OrcShaman_Sit,"FP_CAMPFIRE_ORKINCAMP_01");
	Wld_InsertNpc(OrcShaman_Sit,"FP_CAMPFIRE_ORKINCAMP_03");
	Wld_InsertNpc(OrcShaman_Sit,"FP_CAMPFIRE_ORKINCAMP_05");
	Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_SWAMP_01");
	Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_VP1_02");
	Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ORCINADANOS_01");
	Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ORCINADANOS_03");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ORCINADANOS_05");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ZOBIE_01");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ZOBIE_03");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ZOBIE_05");
	Wld_InsertNpc(orkelite_addon3,"FP_ROAM_ELITEORCSHAMANGUARD_03");
	Wld_InsertNpc(orkelite_addon3,"FP_ROAM_ELITEORCSHAMANGUARD_04");
	Wld_InsertNpc(orcshaman_leader4,"FP_CAMPFIRE_ELITEORCSHAMAN_04");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ENTRANCEORCGUARD_19");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ENTRANCEORCGUARD_21");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ENTRANCEORCGUARD_23");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ENTRANCEORCGUARD_25");
	Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ENTRANCEORCGUARD_27");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ENTRANCEORCGUARD_29");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ENTRANCEORCGUARD_31");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_ADANOSTEMPEL_RHADEMES_DEADBDT_01");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_ADANOSTEMPEL_RHADEMES_DEADBDT_02");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_ADANOSTEMPEL_RHADEMES");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_ADANOSTEMPEL_ENTRANCE_17");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_ADANOSTEMPEL_ENTRANCE_20");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_ADANOSTEMPEL_ENTRANCE_13");
	Wld_InsertNpc(orkelite_addon1,"ADW_ADANOSTEMPEL_TREASUREPITS_05A");
	Wld_InsertNpc(orkelite_addon1,"ADW_ADANOSTEMPEL_TREASUREPITS_05C");
	Wld_InsertNpc(orkelite_addon1,"ADW_ADANOSTEMPEL_TREASUREPITS_05E");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_ADANOSTEMPEL_TREASUREPITS_09A");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_ADANOSTEMPEL_TREASUREPITS_09C");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_ADANOSTEMPEL_TREASUREPITS_09E");
	Wld_InsertNpc(orkelite_addon1,"ADW_ADANOSTEMPEL_RHADEMES_14A");
	Wld_InsertNpc(orkelite_addon1,"ADW_ADANOSTEMPEL_RHADEMES_14C");
	Wld_InsertNpc(orkelite_addon1,"ADW_ADANOSTEMPEL_RHADEMES_14E");
	Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ADANOSTEMPEL_ORC_01");
	Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ADANOSTEMPEL_ORC_03");
	Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ADANOSTEMPEL_ORC_05");
	Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ADANOSTEMPEL_ORC_07");
	Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ADANOSTEMPEL_ORC_09");
	Wld_InsertNpc(orkelite_adw_leader,"FP_CAMPFIRE_ADANOSTEMPEL_ORC_08");
	Wld_InsertNpc(orkelite_bowmenroam,"FP_ROAM_ENTRANCEORCGUARD_11");
	Wld_InsertNpc(orkelite_bowmenroam,"FP_ROAM_ENTRANCEORCGUARD_13");
	Wld_InsertNpc(orkelite_bowmenroam,"FP_ROAM_ENTRANCEORCGUARD_15");
	Wld_InsertNpc(orkelite_bowmenroam,"FP_ROAM_ENTRANCEORCGUARD_17");
	Wld_InsertNpc(orkelite_addon2,"ADW_CANYON_LIBRARY_04");
	Wld_InsertNpc(orkelite_addon2,"ADW_CANYON_LIBRARY_LEFT_08");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_CANYON_LIBRARY_LEFT_07");
	Wld_InsertNpc(orkelite_addon2,"ADW_CANYON_LIBRARY_RIGHT_07");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_CANYON_LIBRARY_RIGHT_13");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_CANYON_LIBRARY_STONIE_01");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_CANYON_LIBRARY_STONIE_05");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_CANYON_ORCS_08");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_CANYON_PATH_TO_LIBRARY_14");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_CANYON_PATH_TO_LIBRARY_19");
	Wld_InsertNpc(orkelite_addon2,"ADW_CANYON_PATH_TO_LIBRARY_20");
	Wld_InsertNpc(orkelite_addon2,"ADW_CANYON_ORCS_05");
	Wld_InsertNpc(orkelite_addon2,"ADW_CANYON_ORCS_02");
	Wld_InsertNpc(OrcShaman_Sit,"ADW_CANYON_ORCS_02");
	Wld_InsertNpc(orcshaman_leader5,"FP_CAMPFIRE_ELITEORCSHAMAN_05");
	Wld_InsertNpc(orkelite_addon3,"FP_ROAM_ELITEORCSHAMANGUARD_06");
	Wld_InsertNpc(orkelite_addon2,"ADW_SENAT_SIDE_01");
	Wld_InsertNpc(orkelite_addon2,"ADW_SENAT_SIDE_03");
	Wld_InsertNpc(orkelite_addon3,"ADW_SENAT_GUARDIAN_01");
	Wld_InsertNpc(orkelite_addon3,"ADW_SENAT_GUARDIAN_03");
	Wld_InsertNpc(orcshaman_leader3,"FP_CAMPFIRE_ELITEORCSHAMAN_03");
	Wld_InsertNpc(orkelite_addon3,"FP_ROAM_ELITEORCSHAMANGUARD_02");
	Wld_InsertNpc(OrcWarrior_Roam,"STRAND");
	Wld_InsertNpc(orkelite_addon2,"ADW_VALLEY_PATH_131");
	Wld_InsertNpc(orkelite_addon3,"ADW_VALLEY_PATH_132_A");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_VALLEY_PATH_134");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_VALLEY_PATH_135");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_VALLEY_PATH_135");
	Wld_InsertNpc(orcshaman_leader2,"FP_CAMPFIRE_ELITEORCSHAMAN_02");
	Wld_InsertNpc(orkelite_addon3,"FP_ROAM_ELITEORCSHAMANGUARD_07");
	Wld_InsertNpc(orkelite_addon3,"FP_ROAM_ELITEORCSHAMANGUARD_08");
	Wld_InsertNpc(orkelite_addon2,"ADW_VALLEY_PATH_064_A");
	Wld_InsertNpc(orkelite_addon2,"ADW_VALLEY_PATH_072");
	Wld_InsertNpc(orkelite_addon3,"ADW_VALLEY_PATH_073");
	Wld_InsertNpc(orcshaman_leader1,"FP_CAMPFIRE_ELITEORCSHAMAN_01");
	Wld_InsertNpc(orkelite_addon3,"FP_ROAM_ELITEORCSHAMANGUARD_09");
	Wld_InsertNpc(orkelite_addon3,"FP_ROAM_ELITEORCSHAMANGUARD_10");
	Wld_InsertNpc(orkelite_addon1,"ADW_CANYON_TELEPORT_PATH_09");
	Wld_InsertNpc(orkelite_addon1,"ADW_CANYON_TELEPORT_PATH_09");
	Wld_InsertNpc(orkelite_addon1,"ADW_ENTRANCE_PATH2BANDITS_10");
	Wld_InsertNpc(orkelite_addon1,"ADW_ENTRANCE_PATH2BANDITS_03");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_PORTALTEMPEL_08A");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_PORTALTEMPEL_08B");
	Wld_InsertNpc(orkelite_addon1,"ADW_BL_FLIES_03");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_BL_FLIES_06");
	Wld_InsertNpc(orkelite_addon1,"ADW_LITTLE_HILL_03");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_LITTLE_HILL_04");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_SWAMP_04");
	Wld_InsertNpc(orkelite_addon1,"ADW_SWAMP_05");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_SWAMP_LITTLE_SEA_01");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_SWAMP_LITTLE_SEA_02");
	Wld_InsertNpc(orkelite_addon1,"ADW_SWAMP_LITTLE_SEA_03");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_SWAMP_12");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_SWAMP_13");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_PATH_TO_BL_09");
	Wld_InsertNpc(orkelite_addon1,"ADW_PATH_TO_BL_10");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_PATH_TO_LOCH_01");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_PATH_TO_LOCH_01");
	Wld_InsertNpc(orkelite_addon1,"ADW_SWAMP_10");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_SWAMP_05");
	Wld_InsertNpc(orkelite_addon1,"ADW_SENAT_MONSTER_03");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_SENAT_MONSTER_04");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_SWAMP_HILLS_DOWN_06");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_SWAMP_HILLS_DOWN_03");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_SWAMP_LOCH_05");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_SWAMP_TO_BIGSEA_01");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_PIRATECAMP_LONEBEACH_11");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_PIRATECAMP_LONEBEACH_10");
	Wld_InsertNpc(orkelite_addon2,"DAW_PIRTECAMP_LONEBEACH_07");
	Wld_InsertNpc(orkelite_addon2,"ADW_PIRATECAMP_LONEBEACH_08");
	Wld_InsertNpc(orkelite_addon2,"ADW_PIRATECAMP_LONEBEACH_04");
	Wld_InsertNpc(orkelite_addon3,"ADW_PIRATECAMP_LONEBEACH_CAVE_03");
	Wld_InsertNpc(orkelite_addon1,"ADW_PIRATECAMP_LONEBEACH_CAVE_03");
	Wld_InsertNpc(orkelite_addon1,"ADW_PIRATCAMP_PLAIN_05");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_PIRATCAMP_PLAIN_05");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_VALLEY_PATH_033_A");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_VALLEY_PATH_035");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_VALLEY_PATH_036");
	Wld_InsertNpc(orkelite_addon1,"ADW_VALLEY_BIGCAVE_06");
	Wld_InsertNpc(orkelite_addon3,"ADW_VALLEY_BIGCAVE_15");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_VALLEY_PATH_110");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_VALLEY_PATH_020");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_VALLEY_PATH_048_A");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_VALLEY_PATH_047_G");
	Wld_InsertNpc(orkelite_addon1,"ADW_VALLEY_PATH_017");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_VALLEY_SHOWCASE1_02");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_VALLEY_SHOWCASE1_03");
	Wld_InsertNpc(orkelite_bowmenroam,"FP_ROAM_ADWENTRANCEHRAM_02");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ADWENTRANCEHRAM_04");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ADWENTRANCEHRAM_06");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ADWENTRANCEHRAM_08");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ADWENTRANCEHRAM_10");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ADWENTRANCEHRAM_12");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ADWENTRANCEHRAM_14");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ADWENTRANCEHRAM_16");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ADWENTRANCEHRAM_18");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ADWENTRANCEHRAM_20");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ADWENTRANCEHRAM_22");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ADWENTRANCEHRAM_24");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ADWENTRANCEHRAM_26");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ADWENTRANCEHRAM_30");
	Wld_InsertNpc(orkelite_bowmenroam,"FP_ROAM_ADWENTRANCEHRAM_31");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ADWENTRANCEHRAM_32");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ADWENTRANCEHRAM_34");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ADWENTRANCEHRAM_36");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_GOLDSHAHT_02");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_GOLDSHAHT_04");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_GOLDSHAHT_06");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_GOLDSHAHT_08");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_GOLDSHAHT_10");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_GOLDSHAHT_12");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_GOLDSHAHT_14");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_GOLDSHAHT_16");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_GOLDSHAHT_18");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_GOLDSHAHT_20");
};


instance DIA_ADDON_SATURAS_ORCLEADERDS(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 2;
	condition = dia_addon_saturas_orcleaderds_condition;
	information = dia_addon_saturas_orcleaderds_info;
	permanent = TRUE;
	description = "Co se týče skřetů...";
};


func int dia_addon_saturas_orcleaderds_condition()
{
	if((Kapitel >= 4) && (RavenAway == TRUE) && (AWORCINVASIONSTART == TRUE) && (AWORCINVASIONSTOP == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_orcleaderds_info()
{
	var int OrcCountXP;

	OrcCountXP = FALSE;
	AI_Output(other,self,"DIA_Addon_Saturas_OrcLeaderds_01_01");	//Co se týče skřetů...
	AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_02");	//Je něco nového?

	if((ORCSHAMAN1ISDEAD == FALSE) && (Npc_IsDead(orcshaman_leader1) == TRUE))
	{
		OrcCountXP = OrcCountXP + 100;
		AI_Output(other,self,"DIA_Addon_Saturas_OrcLeaderds_01_03");	//Jedna ze skupin skřetů, které se vydaly na západ, se usídlila v domě kněží. Bezpochyby si vybrali dobré místo!
		AI_Output(other,self,"DIA_Addon_Saturas_OrcLeaderds_01_04");	//Byli vedeni šamanem Varrag-Shatanem. Teď už ale on ani ostatní nejsou nebezpeční.
		AI_Output(other,self,"DIA_Addon_Saturas_OrcLeaderds_01_05");	//Vlastně jsem z nich vymlátil duši.
		AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_06");	//Díky Adanovi! Aspoň nějaké dobré zprávy...
		ORCSHAMAN1ISDEAD = TRUE;
	};
	if((ORCSHAMAN2ISDEAD == FALSE) && (Npc_IsDead(orcshaman_leader2) == TRUE))
	{
		OrcCountXP = OrcCountXP + 100;
		AI_Output(other,self,"DIA_Addon_Saturas_OrcLeaderds_01_07");	//Několik dalších skřetů je už minulostí!
		AI_Output(other,self,"DIA_Addon_Saturas_OrcLeaderds_01_08");	//V chrámu Strážců smrti jsem narazil na další skupinu, která se vydala na západ. Bylo potřebné jim dát do zubů!
		AI_Output(other,self,"DIA_Addon_Saturas_OrcLeaderds_01_09");	//Soudím, že je vedl šaman Varrag-Kazorg. Teď je on i se skupinou mrtev.
		AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_10");	//Dobrá práce, synu!
		ORCSHAMAN2ISDEAD = TRUE;
	};
	if((ORCSHAMAN3ISDEAD == FALSE) && (Npc_IsDead(orcshaman_leader3) == TRUE))
	{
		OrcCountXP = OrcCountXP + 100;
		AI_Output(other,self,"DIA_Addon_Saturas_OrcLeaderds_01_12");	//V domě léčitelů v bažině jsem našel další skupinu skřetů. Postavili si tam malý tábor.
		AI_Output(other,self,"DIA_Addon_Saturas_OrcLeaderds_01_13");	//Jejich velitelem byl šaman Varrag-Hashor. Byl, protože už z nich nic nezbylo...
		AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_15");	//Skvělé zprávy. Pokračuj se stejným zápalem!
		ORCSHAMAN3ISDEAD = TRUE;
	};
	if((ORCSHAMAN5ISDEAD == FALSE) && (Npc_IsDead(orcshaman_leader5) == TRUE))
	{
		OrcCountXP = OrcCountXP + 100;
		AI_Output(other,self,"DIA_Addon_Saturas_OrcLeaderds_01_16");	//V kaňonu na severu, u domu válečníků, se usadila další skupina skřetů.
		AI_Output(other,self,"DIA_Addon_Saturas_OrcLeaderds_01_17");	//Dohled nad nimi měl šaman Varrag-Hatash.
		AI_Output(other,self,"DIA_Addon_Saturas_OrcLeaderds_01_18");	//Bylo potřebné lehce upravit stav věcí. Teď už v kaňonu žádní skřeti nejsou!
		AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_19");	//Úžasné!
		ORCSHAMAN5ISDEAD = TRUE;
	};
	if((ORCSHAMAN4ISDEAD == FALSE) && (Npc_IsDead(orcshaman_leader4) == TRUE))
	{
		OrcCountXP = OrcCountXP + 100;
		AI_Output(other,self,"DIA_Addon_Saturas_OrcLeaderds_01_20");	//Skřeti zaútočili na tábor banditů. Byl to pořádný boj!
		AI_Output(other,self,"DIA_Addon_Saturas_OrcLeaderds_01_21");	//Velmi jsem se snažil, abych je všechny pozabíjel.
		AI_Output(other,self,"DIA_Addon_Saturas_OrcLeaderds_01_22");	//Včetně velícího šamana hordy - Varrag-Nazula. Myslím, že on byl za tu skupinu odpovědný.
		AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_23");	//Úctyhodný skutek. Myslím, že to skřety hodně oslabí!
		ORCSHAMAN4ISDEAD = TRUE;
	};
	if((ORKELITELEADERISDEAD == FALSE) && (Npc_IsDead(orkelite_adw_leader) == TRUE))
	{
		OrcCountXP = OrcCountXP + 100;
		AI_Output(other,self,"DIA_Addon_Saturas_OrcLeaderds_01_24");	//Skřeti se dostali do Adanova chrámu!
		AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_25");	//Při Adanovi! To prokleté zvěrstvo znesvětilo náš chrám! Podnikl jsi nějaké kroky?
		AI_Output(other,self,"DIA_Addon_Saturas_OrcLeaderds_01_26");	//Všechny jsem zabil, včetně jejich vůdce. Byl to tvrdý boj, ale teď je to za námi.
		AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_27");	//Kdo to byl?
		AI_Output(other,self,"DIA_Addon_Saturas_OrcLeaderds_01_28");	//Silný nepřítel! Jeden z vůdců celého klanu - Ur-Katan. Já však ukončil jeho život.
		AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_29");	//Soudím, že se skřeti připravovali vážně důkladně, jelikož povolali jednoho z jejich nejlepších.
		AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_30");	//Jsi na správné cestě! Pokud budeš pokračovat takto, zlomíme je.
		ORKELITELEADERISDEAD = TRUE;
	};
	if((ORCSHAMAN1ISDEAD == TRUE) && (ORCSHAMAN2ISDEAD == TRUE) && (ORCSHAMAN3ISDEAD == TRUE) && (ORCSHAMAN4ISDEAD == TRUE) && (ORCSHAMAN5ISDEAD == TRUE) && (ORKELITELEADERISDEAD == TRUE))
	{
		OrcCountXP = OrcCountXP + 500;
		B_GivePlayerXP(OrcCountXP);
		AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_31");	//Myslím, že to stačí. Tento úkol jsi splnil perfektně!
		AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_32");	//Když jsou jejich vůdci mrtví, skřeti už nepodniknou žádné vážné kroky. A určitě opustí údolí.
		AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_34");	//... Nevím, co bychom bez tebe dělali. Jsi skutečně vyvolený bohů!
		MIS_ADW_ORCINVASION = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_ADW_ORCINVASION,LOG_SUCCESS);
		B_LogEntry(TOPIC_ADW_ORCINVASION,"Pravděpodobně jsem zabil všechny vůdce skřetů, kteří pronikli do Jharkendaru. Můžeme věřit, že bez jejich vůdců skřeti ztratili zájem o toto místo a brzy odejdou.");

		if(other.guild == GIL_KDF)
		{
			AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_36");	//Tedy, mágu, přijmi tento dar jako vděk za tvé skutky.
			B_GiveInvItems(self,other,ItPo_Perm_Mana,1);
			AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_37");	//Jsou přirozeně hodny mnohem vícera než tohoto. Ale je to nejcennější věc, kterou mám.
			AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_39");	//A teď pokračuj ve své cestě. Na tomto světě je stále mnoho zla, se kterým všichni bojujeme.
			AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_40");	//Sbohem.
			DIA_Addon_Saturas_ADW_EXIT_Info();
		}
		else if(other.guild == GIL_PAL)
		{
			AI_Output(other,self,"DIA_Addon_Saturas_OrcLeaderds_01_41");	//Je mou svatou povinností bojovat se zlem! Innos mi dává sílu!
			AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_42");	//Tedy, šlechetný paladine, přijmi ode mne tento malý dar na počest tvých skutků.
			B_GiveInvItems(self,other,ItPo_Perm_Health,2);
			AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_43");	//Jsou přirozeně hodny mnohem vícera než tohoto. Ale pomůže ti to ve tvém boji!
			AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_45");	//A teď pokračuj ve své cestě. Na tomto světě je stále mnoho míst, kde tě potřebují.
			AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_46");	//Sbohem.
			DIA_Addon_Saturas_ADW_EXIT_Info();
		}
		else if(other.guild == GIL_DJG)
		{
			AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_48");	//Tedy, žoldáku, přijmi ode mne tenhle malý dar na počest tvých skutků.
			B_GiveInvItems(self,other,ItPo_Perm_STR,1);
			AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_49");	//Jsou přirozeně hodny mnohem vícera než tohoto. Ale doufám, že to bude stačit.
			AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_51");	//A teď pokračuj ve své cestě. Určitě ještě přijde čas, kdy bude tvůj meč potřebný v boji se zlem!
			AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_52");	//Sbohem.
			DIA_Addon_Saturas_ADW_EXIT_Info();
		}
		else if((other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR))
		{
			AI_Output(other,self,"DIA_Addon_Saturas_OrcLeaderds_01_53");	//Jak jistě chápeš, my v Bratrstvu těmto věcem nevěříme! Naše cesta je bohům příliš vzdálená.
			AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_54");	//Tedy, přijmi ode mne tento malý dar na počest tvých skutků.
			if((other.guild == GIL_SEK) || (other.guild == GIL_TPL))
			{
				B_GiveInvItems(self,other,ItPo_Perm_STR,1);
			}
			else
			{
				B_GiveInvItems(self,other,ItPo_Perm_Mana,1);
			};
			AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_55");	//Jsou přirozeně hodny mnohem vícera než tohoto. Ale doufám, že to bude stačit.
			AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_57");	//A teď pokračuj ve své cestě. Určitě ještě přijde čas, kdy budeš pomáhat v boji se zlem!
			AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_58");	//Sbohem.
			DIA_Addon_Saturas_ADW_EXIT_Info();
		}
		else if(other.guild == GIL_KDW)
		{
			AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_60");	//Tedy, bratře, přijmi ode mne tento malý dar na počest tvých skutků.
			B_GiveInvItems(self,other,itpo_perm_mana,1);
			AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_61");	//Jsou přirozeně hodny mnohem vícera než tohoto. Ale doufám, že to bude dost.
			AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_63");	//A teď pokračuj ve své cestě. Určitě ještě přijde čas, kdy budeš pomáhat v boji se zlem!
			AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_64");	//Sbohem.
			DIA_Addon_Saturas_ADW_EXIT_Info();
		}
		else if(other.guild == GIL_KDM)
		{
			AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_66");	//Taková slova nejsou potřebná. Nezapomínej, že sloužím jenom jedinému bohu! A myslím, že mými činy nebude nadšený.
			B_GiveInvItems(self,other,ItPo_Perm_Mana,1);
			AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_67");	//Jsou přirozeně hodny mnohem vícera než tohoto. Ale doufám, že to bude stačit.
			AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_69");	//A teď pokračuj ve své cestě. Doufám, že to nebude tvůj jediný čin ve jménu světla!
			AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_70");	//Sbohem.
			DIA_Addon_Saturas_ADW_EXIT_Info();
		};
		AWORCINVASIONSTOP = TRUE;
	}
	else
	{
		B_GivePlayerXP(OrcCountXP);
		AI_Output(other,self,"DIA_Addon_Saturas_OrcLeaderds_01_71");	//Ještě nic.
		AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_72");	//Veliká škoda. Doufal jsem, že uslyším příjemnější zprávy.
	};
};


instance DIA_ADDON_SATURAS_ADW_UNKNOWNPORTAL(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 99;
	condition = dia_addon_saturas_adw_unknownportal_condition;
	information = dia_addon_saturas_adw_unknownportal_info;
	permanent = FALSE;
	description = "V Adanově chrámu jsem našel tenhle divný kámen.";
};

func int dia_addon_saturas_adw_unknownportal_condition()
{
	if((Npc_HasItems(other,ITMI_DRAGONGOLDFOCUS) >= 1) && (DRAGONGOLDMEET == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_unknownportal_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_UnknownPortal_01_00");	//V Adanově chrámu jsem našel tenhle divný kámen.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_UnknownPortal_01_01");	//Nuže, dovol mi ho prozkoumat.
	B_GiveInvItems(other,self,ITMI_DRAGONGOLDFOCUS,1);
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_UnknownPortal_01_02");	//Hmmm... Ano - velice zajímavý artefakt! Ještě nikdy jsem takový neviděl.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_UnknownPortal_01_04");	//Těžko přesně říct, ale připomíná mi to kameny, které jsme používali na aktivaci portálů.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_UnknownPortal_01_06");	//Nenapadá mě však, pro jaký portál byl kámen vytvořen.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_UnknownPortal_01_07");	//Znamená to, že je možné ho nějak použít?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_UnknownPortal_01_08");	//Asi ano! Ale víc mě zajímá, kde jsi ho našel.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_UnknownPortal_01_09");	//Jestli jsi ho našel v Adanově chrámu, jak říkáš, určitě představoval pro lidi, jež tu kdysi žili, velikou hodnotu.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_UnknownPortal_01_10");	//Nebo právě opačně, velikou hrozbu.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_UnknownPortal_01_11");	//V každém případě musíš dávat veliký pozor, objevíš-li, jak ho použít. Následky mohou být nepředvídatelné!
	B_GiveInvItems(self,other,ITMI_DRAGONGOLDFOCUS,1);
	Log_CreateTopic(TOPIC_GOLDDRAGONPORTAL,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GOLDDRAGONPORTAL,LOG_Running);
	B_LogEntry(TOPIC_GOLDDRAGONPORTAL,"Ukázal jsem Saturasovi kámen, který jsem našel v Adanově chrámu. Saturas mi nemohl přesně říct, na co slouží, ale podotkl, že velmi silně připomíná kameny použité na aktivaci portálů. Asi bych se měl porozhlédnout, jestli se něco jako portál v údolí nachází.");
	MIS_GOLDDRAGONPORTAL = LOG_Running;
};

instance DIA_ADDON_SATURAS_ADW_UNKNOWNPORTALKNOWN(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 98;
	condition = dia_addon_saturas_adw_unknownportalknown_condition;
	information = dia_addon_saturas_adw_unknownportalknown_info;
	permanent = FALSE;
	description = "Našel jsem portál...";
};

func int dia_addon_saturas_adw_unknownportalknown_condition()
{
	if(DRAGONGOLDMEET == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_unknownportalknown_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_UnknownPortalKnown_01_00");	//Našel jsem portál a aktivoval ho s pomocí kamenu z chrámu...
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_UnknownPortalKnown_01_01");	//ANO?!... (velmi překvapeně) nemožné!...
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_UnknownPortalKnown_01_02");	//A kdes ho našel?
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_UnknownPortalKnown_01_03");	//V ruinách starého chrámu nedaleko odtud.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_UnknownPortalKnown_01_07");	//A kam portál vedl?
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_UnknownPortalKnown_01_08");	//Do jednoho malého údolí...
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_UnknownPortalKnown_01_12");	//Není tam nic zajímavého, kromě jedné věci... Draka!
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_UnknownPortalKnown_01_13");	//DRAKA?! Můj bože!... (vystrašeně)
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_UnknownPortalKnown_01_15");	//(panikaří) Pak se obávám, že jsme všichni ve velkém nebezpečí.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_UnknownPortalKnown_01_16");	//Neboj se! Žádné nebezpečí nehrozí. Ashtar není služebníkem zla!
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_UnknownPortalKnown_01_17");	//Ashtar?!
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_UnknownPortalKnown_01_18");	//Ano, Ashtar - zlatý drak! Ani v nejmenším se nepodobá na draky, kteří zaplavili Hornické údolí.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_UnknownPortalKnown_01_22");	//Tedy! Nejsem si jistý, jestli říkáš pravdu. Je tomu těžké uvěřit!
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_UnknownPortalKnown_01_25");	//Při našem výzkumu jsme našli fresky, které zobrazovaly bytost nejasného původu...
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_UnknownPortalKnown_01_26");	//... velice podobnou drakovi. Možná to i byl on.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_UnknownPortalKnown_01_35");	//Myslím, že bych měl jít do toho údolí a promluvit si s ním.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_UnknownPortalKnown_01_36");	//Možná nám osvětlí, co se vlastně stalo.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_UnknownPortalKnown_01_38");	//Věřím, že si s ním máš co říct.
	B_LogEntry(TOPIC_GOLDDRAGONPORTAL,"Řekl jsem Saturasovi o drakovi. Byl mírně otřesen, ale dost ho to zajímá.");
	AI_StopProcessInfos(self);
	SATURASKNOWSASHTAR = TRUE;
	self.aivar[AIV_EnemyOverride] = TRUE;
};


instance DIA_ADDON_SATURAS_ADW_ARCHDEMON(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 97;
	condition = dia_addon_saturas_adw_archdemon_condition;
	information = dia_addon_saturas_adw_archdemon_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_saturas_adw_archdemon_condition()
{
	if((TASKFINDSPHERE == TRUE) && Npc_KnowsInfo(hero,dia_addon_saturas_adw_unknownportalknown) && (Npc_GetDistToWP(self,"ADW_SATURAS_2_GOLDDRAGON") < 500) && (AshtarLastWarn == FALSE) && (SenyakIsDead == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_archdemon_info()
{
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_ArchDemon_01_00");	//(rozrušeně) Ashtar mi řekl o Senyakovi.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_ArchDemon_01_01");	//Pokud má drak pravdu, svět je ve vážném nebezpečí! To nemůžeme dopustit!
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_ArchDemon_01_02");	//Měl bys hned konat. Jdi a najdi sféry, o kterých ti drak řekl!
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_ArchDemon_01_03");	//Jdi, synu! Každá minuta je důležitá!
	AI_StopProcessInfos(self);
};

instance DIA_ADDON_SATURAS_ADW_PRAYFORGOMEZ(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_adw_prayforgomez_condition;
	information = dia_addon_saturas_adw_prayforgomez_info;
	permanent = FALSE;
	description = "Potřebuji Adanovo požehnání.";
};


func int dia_addon_saturas_adw_prayforgomez_condition()
{
	if((MIS_RESCUEGOMEZ == LOG_Running) && (RESCUEGOMEZSTEPONE == TRUE) && (RESCUEGOMEZSTEPONEDONE == FALSE) && (RESCUEGOMEZPRAYADANOS == FALSE) && (SATURASREFUSEHELPGOMEZ == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_prayforgomez_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_PrayForGomez_01_01");	//Potřebuji Adanovo požehnání.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_PrayForGomez_01_02");	//(nechápavě) Potřebuješ požehnání Vody?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_PrayForGomez_01_03");	//Co jsi opět udělal, když o něj tak žádáš?
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_PrayForGomez_01_04");	//Já nic! Je pro duši, kterou jsem na tomto světě potkal.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_PrayForGomez_01_10");	//Duši bývalého rudobarona - Gomeze!
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_PrayForGomez_01_11");	//GOMEZE?!... (nahněvaně) Toho vraha?!
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_PrayForGomez_01_12");	//Jak se mne opovažuješ žádat o TOTO?!... (rozzuřeně)
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_PrayForGomez_01_14");	//(nahněvaně) Ten si zaslouží svůj osud!
	B_LogEntry(TOPIC_RESCUEGOMEZ,"Saturas a ostatní mágové Vody mi odmítli pomoct.");
	SATURASREFUSEHELPGOMEZ = TRUE;
};


instance DIA_ADDON_SATURAS_ADW_TELLABORKS(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_adw_tellaborks_condition;
	information = dia_addon_saturas_adw_tellaborks_info;
	permanent = FALSE;
	description = "Mám zlé zprávy.";
};


func int dia_addon_saturas_adw_tellaborks_condition()
{
	if((HAGENOTHERSAGREED == FALSE) && (MIS_BEWAREWATERMAGE == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_tellaborks_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_TellAbOrks_01_01");	//Mám zlé zprávy.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_TellAbOrks_01_02");	//O čem, synu?!
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_TellAbOrks_01_03");	//Na Khorinis vtrhli skřeti!
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_TellAbOrks_01_04");	//Co? (otřeseně) To nemůže být pravda!
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_TellAbOrks_01_06");	//Za několik dní proměnili ostrov v peklo.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_TellAbOrks_01_07");	//Přišel jsem tě varovat!
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_TellAbOrks_01_08");	//A co město?!
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_TellAbOrks_01_09");	//Skřeti to zvládli bez velkého úsilí. Paladinové byli prakticky bezmocní!
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_TellAbOrks_01_10");	//Při Adanovi... (zničený) Přinesl jsi vážně zlé zprávy!
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_TellAbOrks_01_11");	//Pokud jsou královští paladinové bezmocní, naše naděje na záchranu je skutečně malá.
	BEWAREWATERMAGE = TRUE;
	MIS_BEWAREWATERMAGE = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_BEWAREWATERMAGE,LOG_SUCCESS);
	B_LogEntry(TOPIC_BEWAREWATERMAGE,"Oznámil jsem mágům Vody, co se stalo.");
};


instance DIA_ADDON_SATURAS_ADW_GATHERARMY(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_adw_gatherarmy_condition;
	information = dia_addon_saturas_adw_gatherarmy_info;
	permanent = FALSE;
	description = "Paladinové potřebují vaší pomoc!";
};


func int dia_addon_saturas_adw_gatherarmy_condition()
{
	if((HAGENOTHERSAGREED == TRUE) && (HAGENNOMORETIMEWAIT == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_gatherarmy_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_GatherArmy_01_01");	//Paladinové potřebují vaší pomoc!
	if((MIS_BEWAREWATERMAGE == LOG_Running) || (MIS_BEWAREWATERMAGE == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_GatherArmy_01_02");	//Hmmm, zajímavé... (udiveně) Co se stalo?
		AI_Output(other,self,"DIA_Addon_Saturas_ADW_GatherArmy_01_05");	//Skřeti vtrhli na Khorinis!
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_GatherArmy_01_06");	//Co?!... (otřeseně) To nemůže být pravda!
		AI_Output(other,self,"DIA_Addon_Saturas_ADW_GatherArmy_01_08");	//Za několik dní proměnili ostrov v peklo.
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_GatherArmy_01_09");	//A co město?!
		AI_Output(other,self,"DIA_Addon_Saturas_ADW_GatherArmy_01_10");	//Skřeti to zvládli bez velkého úsilí. Paladinové byli prakticky bezmocní!
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_GatherArmy_01_11");	//Při Adanovi... (zničený) Přinesl jsi vážně zlé zprávy!
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_GatherArmy_01_12");	//Pokud jsou královští paladinové bezmocní, naše naděje na záchranu je skutečně malá. Tento svět je v koncích!
		AI_Output(other,self,"DIA_Addon_Saturas_ADW_GatherArmy_01_13");	//Ano! Proto tady jsem - lord Hagen potřebuje vaší pomoc.
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_GatherArmy_01_14");	//Dobře!... (rozhodně) Jsme připraveni pomoct mu, jak jen budeme moci.
		BEWAREWATERMAGE = TRUE;
		if(MIS_BEWAREWATERMAGE == LOG_Running)
		{
			B_GivePlayerXP(1000);
			MIS_BEWAREWATERMAGE = LOG_SUCCESS;
			Log_SetTopicStatus(TOPIC_BEWAREWATERMAGE,LOG_SUCCESS);
			Log_AddEntry(TOPIC_BEWAREWATERMAGE,"Oznámil jsem mágům Vody, co se stalo.");
		}
		else
		{
			B_GivePlayerXP(500);
		};
	}
	else
	{
		B_GivePlayerXP(500);
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_GatherArmy_01_22");	//(rozhodně) Jsme připraveni pomoci, jak jen budeme moci.
	};
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_GatherArmy_01_23");	//Musíme ale nejprve vykonat jednu důležitou věc.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_GatherArmy_01_24");	//Nemůže to počkat?!
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_GatherArmy_01_25");	//Obávám se, že ne... (lítostivě) Osud téhle časti ostrova na tom závisí!
	B_LogEntry(TOPIC_ORCGREATWAR,"Mágové Vody souhlasili, že lordu Hagenovi pomůžou. Musí však ještě před návratem na Khorinis dokončit jednu důležitou věc. Měl bych jim pomoci zrychlit tento proces.");
};


instance DIA_ADDON_SATURAS_ADW_ISTOK(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_adw_istok_condition;
	information = dia_addon_saturas_adw_istok_info;
	permanent = FALSE;
	description = "Co máš na mysli?";
};


func int dia_addon_saturas_adw_istok_condition()
{
	if(Npc_KnowsInfo(hero,dia_addon_saturas_adw_gatherarmy))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_istok_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_Istok_01_01");	//Co máš na mysli?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_Istok_01_02");	//Hmmm... (přemýšlivě) Víš, že jsme kulturu této části studovali už dost dlouho.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_Istok_01_03");	//Odhalili jsme už mnoho věcí, které zachovávaly moudrost předků.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_Istok_01_04");	//Vždy nás ale zajímala jedna věc.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_Istok_01_05");	//Abych byl přesný... Vždy jsme si přáli pochopit, co zapříčinilo ty smutné události.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_Istok_01_06");	//Nebyl na příčině Beliarův dráp?!
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_Istok_01_08");	//Beliarův artefakt skutečně přinesl do tohoto údolí zlo.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_Istok_01_09");	//Nikdy by se to však nestalo, kdyby na toto místo Adanos neseslal kletbu!
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_Istok_01_12");	//A důkazem je jeden ze spisů, které jsme našli v Adanově chrámu.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_Istok_01_13");	//To posvátné místo bylo prokleté ještě než Stavitelé našli Dráp. Adanos se od nich odvrátil!
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_Istok_01_15");	//Chtěli bychom to napravit, aby Adanos opět požehnal tomuto místu!
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_Istok_01_19");	//Co uděláte?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_Istok_01_20");	//Po několika meditacích jsme se rozhodli vykonat rituál Osvícení.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_Istok_01_21");	//Myslím, že to chrámu vrátí bývalou sílu a velkolepost. A s tím i Adanovo požehnání!
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_Istok_01_22");	//Jasně. A mohu ti s něčím pomoct?!
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_Istok_01_23");	//Ano, tvá pomoc přijde vhod. Mám takové tušení, že nás někdo bude chtít zastavit.
	MIS_RESTOREHRAM = LOG_Running;
	Log_CreateTopic(TOPIC_RESTOREHRAM,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RESTOREHRAM,LOG_Running);
	B_LogEntry(TOPIC_RESTOREHRAM,"Podle Saturase mágové Vody konečně pochopili pravou příčinu zkázy prastaré civilizace. Sám Adanos seslal na chrám kletbu. A teď je potřebné znova ochránit tuhle část ostrova. Mágové Vody se rozhodli znova vysvětit chrám tajemným rituálem. Saturas mě ale varoval, že někdo tomu bude chtít zabránit! Přesně neví, kdo...");
};


instance DIA_ADDON_SATURAS_ADW_FINDRIORDAN(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_adw_findriordan_condition;
	information = dia_addon_saturas_adw_findriordan_info;
	permanent = FALSE;
	description = "Kdy chcete vykonat rituál?";
};


func int dia_addon_saturas_adw_findriordan_condition()
{
	if(MIS_RESTOREHRAM == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_findriordan_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_FindRiordan_01_01");	//Kdy chcete vykonat rituál?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_FindRiordan_01_02");	//Co nejdřív. (přemýšlivě) Ale měli bychom nejdřív počkat na Riordiana!
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_FindRiordan_01_04");	//Před několika dny jsem ho poslal do ruin chrámu na severu.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_FindRiordan_01_05");	//Podle záznamů by tam měl být jeden z artefaktů, které Stavitelé používali při rituálech.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_FindRiordan_01_06");	//Pro náš rituál je taktéž extremně důležitý!
	Wld_InsertNpc(riordian_zombie,"ADW_CANYON_LIBRARY_RIGHT_13");
	B_LogEntry(TOPIC_RESTOREHRAM,"Saturas mi řekl, že čekají na návrat Riordiana. Měl přinést nějaký starobylý artefakt z chrámu na severu, který je pro ně důležitý. Stavitelé ho používali na provádění rituálů v Adanově chrámu.");
};


instance DIA_ADDON_SATURAS_ADW_FINDRIORDANDONE(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_adw_findriordandone_condition;
	information = dia_addon_saturas_adw_findriordandone_info;
	permanent = FALSE;
	description = "Střetl jsem se s Riordianem.";
};


func int dia_addon_saturas_adw_findriordandone_condition()
{
	if((MIS_RESTOREHRAM == LOG_Running) && (RIORDANEVILDEAD == TRUE) && (Npc_HasItems(hero,itmi_adanosamulet) >= 1))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_findriordandone_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_FindRiordanDone_01_01");	//Střetl jsem se s Riordianem.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_FindRiordanDone_01_02");	//(vážně) Proč se nevrátil s tebou?
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_FindRiordanDone_01_03");	//Je mrtvý! Ovládlo ho zlo a téměř mě zabil.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_FindRiordanDone_01_05");	//Při Adanovi... (rozrušeně) Veliká ztráta pro všechny mágy Vody! Neměl jsem to dopustit.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_FindRiordanDone_01_07");	//Dobře... (přichází ke smyslům) Věřím, že nemůžeme dál váhat!
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_FindRiordanDone_01_08");	//Zlo je blízko a může se nás kdykoliv zmocnit.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_FindRiordanDone_01_09");	//Mimochodem, získal jsi ten artefakt, co měl Riordian přinést?
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_FindRiordanDone_01_10");	//Ano, tady.
	B_GiveInvItems(other,self,itmi_adanosamulet,1);
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_FindRiordanDone_01_11");	//Dobře. Pošlu všechny do Adanova chrámu.
	READYWATERRITUAL = TRUE;
	B_LogEntry(TOPIC_RESTOREHRAM,"Saturas byl šokován, když se dozvěděl o smrti Riordiana. Teď nezbývá nic víc, než jít do Adanova chrámu a vykonat posvátný rituál, než zlo, které zničilo Riordiana, se nezmocní všech mágů.");
	AI_StopProcessInfos(self);
	B_StartOtherRoutine(KDW_14000_Addon_Saturas_ADW,"WaitTempel");
	B_StartOtherRoutine(KDW_14020_Addon_Nefarius_ADW,"WaitTempel");
	B_StartOtherRoutine(KDW_14010_Addon_Cronos_ADW,"WaitTempel");
	B_StartOtherRoutine(KDW_14050_Addon_Merdarion_ADW,"WaitTempel");
};

instance DIA_ADDON_SATURAS_ADW_BEFORERITUAL(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_adw_beforeritual_condition;
	information = dia_addon_saturas_adw_beforeritual_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_saturas_adw_beforeritual_condition()
{
	if((MIS_RESTOREHRAM == LOG_Running) && (READYWATERRITUAL == TRUE) && (Npc_GetDistToWP(self,"ADW_ADANOSTEMPEL_RAVEN_01") <= 2000))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_beforeritual_info()
{
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_BeforeRitual_01_01");	//Jsi tady... Dobře, měli bychom tedy začít!
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_BeforeRitual_01_03");	//Všechno, co požadujeme je, abys dohlédl, aby nám nikdo nezabránil vykonat rituál.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_BeforeRitual_01_04");	//Když začneme, budeme absolutně bezbranní!
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_BeforeRitual_01_05");	//Čili pokud se cokoliv objeví, je to jen a jen na tobě.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_BeforeRitual_01_06");	//V pořádku, rozumím.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_BeforeRitual_01_07");	//Začneme... Adane, ochraňuj nás!
	B_LogEntry(TOPIC_RESTOREHRAM,"Mágové Vody začali rituál Osvícení! Měl bych dohlédnout, aby je nikdo nevyrušoval.");
	BEGINWATERRITUAL = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"WaterRitual");
	B_StartOtherRoutine(KDW_14020_Addon_Nefarius_ADW,"WaterRitual");
	B_StartOtherRoutine(KDW_14010_Addon_Cronos_ADW,"WaterRitual");
	B_StartOtherRoutine(KDW_14050_Addon_Merdarion_ADW,"WaterRitual");
};

instance DIA_ADDON_SATURAS_ADW_DURINGRITUAL(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_adw_duringritual_condition;
	information = dia_addon_saturas_adw_duringritual_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_saturas_adw_duringritual_condition()
{
	if((MIS_RESTOREHRAM == LOG_Running) && (BEGINWATERRITUAL == TRUE) && (STOPWATERRITUAL == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_duringritual_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_SATURAS_ADW_AFTERRITUAL(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_adw_afterritual_condition;
	information = dia_addon_saturas_adw_afterritual_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_saturas_adw_afterritual_condition()
{
	if((MIS_RESTOREHRAM == LOG_Running) && (STOPWATERRITUAL == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_afterritual_info()
{
	B_GivePlayerXP(1000);
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_AfterRitual_01_01");	//Perfektně... (chytá dech) Vypadá to, že všechno vyšlo!
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_AfterRitual_01_04");	//Můžu ti však říct, že někdo určitě nechtěl, abychom rituál vykonali.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_AfterRitual_01_06");	//Už cítím, jak je naplněný Adanovým požehnáním!
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_AfterRitual_01_09");	//Toto místo je opět posvátné a už to tak i zůstane.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_AfterRitual_01_11");	//(usmívá se) Děkuji za tvou pomoc! Byla neocenitelná.
	MIS_RESTOREHRAM = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_RESTOREHRAM,LOG_SUCCESS);
	B_LogEntry(TOPIC_RESTOREHRAM,"S mou pomocí mágové Vody vykonali rituál. Adanův chrám byl očištěn od zla a byla mu navrácena původní síla. Teď je toto místo pod Adanovou ochranou a nic mu nehrozí.");
};


instance DIA_ADDON_SATURAS_ADW_GATHERARMYDONE(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_adw_gatherarmydone_condition;
	information = dia_addon_saturas_adw_gatherarmydone_info;
	permanent = FALSE;
	description = "Půjdete teď na pomoc lordu Hagenovi?";
};


func int dia_addon_saturas_adw_gatherarmydone_condition()
{
	if(MIS_RESTOREHRAM == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_gatherarmydone_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_GatherArmyDone_01_01");	//Půjdete teď na pomoc lordu Hagenovi?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_GatherArmyDone_01_03");	//Řekni veliteli paladinů, že přijdeme hned, jakmile nám dá vědět.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_GatherArmyDone_01_04");	//Jen Adanos nám teď může pomoci!
	KDW_JOINHAGEN = TRUE;
	B_LogEntry(TOPIC_ORCGREATWAR,"Je potřebné informovat lorda Hagena, že mágové Vody čekají na jeho další rozkazy ohledně nadcházejícího boje se skřety.");
};


instance DIA_ADDON_SATURAS_ADW_RAVENAWAY(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_adw_RAVENAWAY_condition;
	information = dia_addon_saturas_adw_RAVENAWAY_info;
	permanent = FALSE;
	description = "Raven utekl!";
};

func int dia_addon_saturas_adw_RAVENAWAY_condition()
{
	if(RavenAway == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_RAVENAWAY_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_RAVENAWAY_01_01");	//Raven utekl!
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_RAVENAWAY_01_02");	//(nechápavě) Co? Jak uprchl?
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_RAVENAWAY_01_03");	//Dostihnul jsem ho ve vnitřní svatyni chrámu! A pak došlo na souboj.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_RAVENAWAY_01_04");	//Ale na poslední chvíli, použil nějakou mě neznámou magii a prostě zmizel.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_RAVENAWAY_01_05");	//Hmmm... (zamyšleně) Ani nevím, co na to říct.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_RAVENAWAY_01_06");	//Možná, že teď už není tak nebezpečný?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_RAVENAWAY_01_07");	//To si nemyslím. Je zde stále cítit obrovská přítomnost zla!
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_RAVENAWAY_01_08");	//A dokud se nezbavíme Ravena, tak se to nezlepší.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_RAVENAWAY_01_09");	//Takže, kde ho mám hledat?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_RAVENAWAY_01_10");	//Kdybych to věděl, už bych tě za ním poslal! Potřebuji nějaký čas, abych si všechno promyslel.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_RAVENAWAY_01_12");	//Pak ti možná budu schopen dát odpověď.
	B_LogEntry(TOPIC_Addon_RavenKDW,"Saturas byl překvapený když se dozvěděl, že mi Raven utekl. Teď potřebuje čas na promyšlení o našich dalších krocích.");
	RavenAwayDone = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_Addon_Kammern,LOG_SUCCESS);
};

instance DIA_ADDON_SATURAS_ADW_ADANOSVALLEY(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_adw_ADANOSVALLEY_condition;
	information = dia_addon_saturas_adw_ADANOSVALLEY_info;
	permanent = FALSE;
	description = "Co mi můžeš říci o této starověké tabulce?";
};

func int dia_addon_saturas_adw_ADANOSVALLEY_condition()
{
	if((Npc_HasItems(hero,ItWr_CroneAdanos) >= 1) && (KnowsTextAdanos == FALSE) && (MIS_AdanosCrone == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_ADANOSVALLEY_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_ADANOSVALLEY_01_01");	//Co mi můžeš říci o této starověké tabulce?
	B_GiveInvItems(other,self,ItWr_CroneAdanos,1);
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_ADANOSVALLEY_01_02");	//(překvapeně) Je jiná než ty tabulky, které jsme našli předtím.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_ADANOSVALLEY_01_03");	//Kde jsi ji získal?
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_ADANOSVALLEY_01_04");	//V jedné vnitřní svatyni Adanova chrámu.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_ADANOSVALLEY_01_05");	//Zdá se, že má velkou hodnotu, pokud byla ukryta právě tam.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_ADANOSVALLEY_01_06");	//Dokážeš přečíst, co je na ni napsáno?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_ADANOSVALLEY_01_07");	//Obávám se, že ne. Symboly, které jsou na ní zobrazeny, mi nic neříkají.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_ADANOSVALLEY_01_08");	//Zdá se, že všechny texty jsou psány v nějakém velmi starodávném jazyce. A prostudovat ho může trvat několik let.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_ADANOSVALLEY_01_10");	//Tak dlouho čekat nemůžu.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_ADANOSVALLEY_01_11");	//Musíš tedy najít někoho, kdo ten jazyk ovládá. Nic jiného mě nenapadá.
	B_GiveInvItems(self,other,ItWr_CroneAdanos,1);
	B_LogEntry(TOPIC_AdanosCrone,"Saturase velmi zaujala starodávná tabulka, kterou jsem našel v chrámu, ale nedokázal ji přečíst. Zdá se, že nápisy jsou psané v nějakém velmi starém jazyce.");
};

instance DIA_ADDON_SATURAS_ADW_ABOUTANTIENTGUARDS(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_adw_aboutantientguards_condition;
	information = dia_addon_saturas_adw_aboutantientguards_info;
	permanent = FALSE;
	description = "Zjistil jsi něco o kamenných strážcích?";
};

func int dia_addon_saturas_adw_aboutantientguards_condition()
{
	if((KnowAboutAdVal == TRUE) && (RavenIsDead == FALSE) && (StoneBossIsDead == FALSE) && (TellAboutAdanosWeapon == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_aboutantientguards_info()
{
	var int randomplace;

	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_AboutAntientGuards_01_01");	//Zjistil jsi něco o kamenných strážcích?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_AboutAntientGuards_01_04");	//V starých záznamech se píše, že je stvořil Adanos a byli tady jakýmisi strážci zákona.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_AboutAntientGuards_01_05");	//Jsou velmi silní a dokonce i zkušený válečník by s nimi mohl mít potíže.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_AboutAntientGuards_01_06");	//Jak jsme ale pochopili, existovala jistá zbraň, která by je mohla pomoci zneškodnit.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_AboutAntientGuards_01_07");	//Co je to za zbraň?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_AboutAntientGuards_01_08");	//Nevím co to je. (lítostivě) Ani kde to hledat...

	if(DragonGoldIsDead == TRUE)
	{
		if(TellAboutAdanosWeapon == FALSE)
		{
			randomplace = Hlp_Random(4);

			if(randomplace == 0)
			{
				Wld_InsertItem(itmw_adanosmolot,"FP_ITEM_ADANOSMOLOT_01");
			}
			else if(randomplace == 1)
			{
				Wld_InsertItem(itmw_adanosmolot,"FP_ITEM_ADANOSMOLOT_02");
			}
			else if(randomplace == 2)
			{
				Wld_InsertItem(itmw_adanosmolot,"FP_ITEM_ADANOSMOLOT_03");
			}
			else
			{
				Wld_InsertItem(itmw_adanosmolot,"FP_ITEM_ADANOSMOLOT_04");
			};

			TELLABOUTSTONEGUARD = TRUE;
			TellAboutAdanosWeapon = TRUE;
		};
	};
};

instance DIA_ADDON_SATURAS_ADW_AncientAltar(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_adw_AncientAltar_condition;
	information = dia_addon_saturas_adw_AncientAltar_info;
	permanent = FALSE;
	description = "Víš jak je možné vrátit magii starodávnému oltáři?";
};

func int dia_addon_saturas_adw_AncientAltar_condition()
{
	if((TaskHram_04 == TRUE) && (ANCIENTALTARSIsAwake == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_AncientAltar_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_AncientAltar_01_01");	//Víš jak je možné vrátit magii starodávnému oltáři?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_AncientAltar_01_02");	//Docela neobvyklá otázka! Jen nechápu, proč tě to zajímá.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_AncientAltar_01_03");	//Podle mého názoru to lze provést pomocí ohniskového kamene.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_AncientAltar_01_04");	//Mluvíš o ohnisku?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_AncientAltar_01_05");	//Ano. On má schopnost přitahovat magickou energii a část jí předávat místu, kde se nachází.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_AncientAltar_01_06");	//Aha. Náhodou nemáš u sebe navíc několik těchto kamenů?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_AncientAltar_01_07");	//S tím by ses měl obrátit na Merdariona. Všechna ohniska, která jsem měl, jsem mu dal.
	AltarToMerdarion = TRUE;
};

instance DIA_ADDON_SATURAS_ADW_Tree(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_adw_Tree_condition;
	information = dia_addon_saturas_adw_Tree_info;
	permanent = FALSE;
	description = "Zajímáš se o stromy?";
};

func int dia_addon_saturas_adw_Tree_condition()
{
	if((LastAdanosTask == TRUE) && (RootIsUp == FALSE) && (LastAdanosTaskDone == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_Tree_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_Tree_01_01");	//Zajímáš se o stromy?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_Tree_01_02");	//(překvapeně) Co? Začínáš mi pokládat velmi zvláštní otázky.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_Tree_01_03");	//Proč se ptáš?
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_Tree_01_04");	//Mám mrtvý strom a musím ho přivést zpět k životu.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_Tree_01_05");	//Ale proč ses v této záležitosti rozhodl obrátit přímo na mě?
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_Tree_01_06");	//No jsi mág, mohl bys znát způsob jak to zařídit.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_Tree_01_07");	//Dokonce i když jsem mág, tak to neznamená, že dokážu všechny věci na tomhle světě.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_Tree_01_08");	//Jakto, že ani moudrý Saturas pro mě nemůže nic udělat?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_Tree_01_09");	//Obávám se, že tentokrát, bohužel...
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_Tree_01_10");	//I když... (zamyšleně) Něco mě napadlo. Jediné co by ti mohlo v této situaci pomoct, je kouzlo druidů.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_Tree_01_11");	//Magie druidů. O té jsem nikdy neslyšel.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_Tree_01_12");	//Sám si toho pamatuji jen velmi málo. Nicméně, existuje!
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_Tree_01_13");	//Když jsem byl tak mladý jako ty, tak jsem se s některými z druidů setkal.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_Tree_01_14");	//Stejně jako my, mágové Vody, ctí posvátné přikázání Adana. Ale druidové svoji magickou sílu čerpají - ze stromů a rostlin.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_Tree_01_15");	//To znamená, že musím najít druida?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_Tree_01_16");	//Ano! Ale pochybuji, že některého z nich najdeš na tomto ostrově.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_Tree_01_17");	//Pokud si vzpomínám, všichni žili v lesích Myrtany, na pevnině. Avšak stále existuje nějaká šance.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_Tree_01_18");	//Jestli mě paměť neklame, tak jeden z mágů kteří přišli na tento ostrov vztyčit magickou bariéru, ovládal umění druidů.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_Tree_01_19");	//A kdo to byl?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_Tree_01_20");	//(s nechutí) Xardas! V té době často experimentoval s různou magií a taky s něčím co připomínalo magii druidů.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_Tree_01_21");	//Víc ti už v téhle záležitosti nemůžu pomoci.
	XarDruid = TRUE;

	if(Kapitel < 5)
	{
		B_LogEntry(TOPIC_AdanosCrone,"Saturas se zmínil o magii druidů, která by mohla oživit velký strom. Říkal něco o tom, že by mohl pomoci Xardas. Myslím že je čas návštívit starého přítele. Nebo najít někoho jiného, kdo zná magii druidů.");
	}
	else
	{
		B_LogEntry(TOPIC_AdanosCrone,"Saturas se zmínil o magii druidů, která by mohla oživit velký strom. Musím najít někoho, kdo jí rozumí.");
	};
};

instance DIA_ADDON_SATURAS_ADW_JarCurse(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_adw_JarCurse_condition;
	information = dia_addon_saturas_adw_JarCurse_info;
	permanent = FALSE;
	description = "Je všechno v pořádku?";
};

func int dia_addon_saturas_adw_JarCurse_condition()
{
	if((MIS_JarCurse == LOG_Running) && (MyxirSendSaturas == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_JarCurse_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_JarCurse_01_01");	//Je všechno v pořádku?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_JarCurse_01_02");	//Ne, jak vidíš. Zdá se, že znesvěcení Adanova chrámu mělo dalekosáhlé důsledky!
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_JarCurse_01_03");	//Co tím myslíš?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_JarCurse_01_04");	//(rozčileně) Jsi snad slepý? Obrovské armády nemrtvých vtrhly do země!
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_JarCurse_01_05");	//Nějaká nám neznámá pradávná moc je přiměla povstat z mrtvých.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_JarCurse_01_06");	//A teď jsou připraveni obrátit svůj hněv proti všem, kdo se odváží postavit se jim do cesty.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_JarCurse_01_07");	//Myslíš, že na tom všem nese vinu Raven?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_JarCurse_01_08");	//S největší pravděpodobností. Jeho rouhání a znesvěcení starověkých svatyní jistě nezůstalo bez povšimnutí.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_JarCurse_01_09");	//Můžeme se jen modlit, aby to byla jediná katastrofa, která nás v budoucnu čeká.
	MeetSaturasOkPortal = TRUE;
	B_LogEntry(TOPIC_JarCurse,"Situace v Jharkendaru není o moc lepší než v Khorinisu. Nějaké neznámé starobylé síly vyvolaly obrovskou armádu nemrtvých. Podle všeho nemrtví prorazili portál do Khorinisu, a to je jen malá část toho, co nás do budoucna čeká.");	
};

instance DIA_ADDON_SATURAS_ADW_JarCurseUndead(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_adw_JarCurseUndead_condition;
	information = dia_addon_saturas_adw_JarCurseUndead_info;
	permanent = FALSE;
	description = "Takové nemrtvé jsem ještě neviděl.";
};

func int dia_addon_saturas_adw_JarCurseUndead_condition()
{
	if((MIS_JarCurse == LOG_Running) && (Npc_KnowsInfo(other,DIA_Addon_Saturas_ADW_JarCurse) == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_JarCurseUndead_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_JarCurseUndead_01_01");	//Takové nemrtvé jsem ještě neviděl.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_JarCurseUndead_01_02");	//Ne, to určitě ne. A to není největší problém. Naše magie je prakticky vůči nim bezmocná!
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_JarCurseUndead_01_03");	//Zdá se, že jsou to válečníci a kněží starodávného národa, kteří kdysi zemřeli díky svému prokletí.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_JarCurseUndead_01_04");	//A nyní povstali, aby se pomstili za svoji smrt a za znesvěcení této země přisluhovači Beliara!
};

instance DIA_ADDON_SATURAS_ADW_JarCurseDo(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_adw_JarCurseDo_condition;
	information = dia_addon_saturas_adw_JarCurseDo_info;
	permanent = FALSE;
	description = "Co budeme dělat?";
};

func int dia_addon_saturas_adw_JarCurseDo_condition()
{
	if((MIS_JarCurse == LOG_Running) && (Npc_KnowsInfo(other,DIA_Addon_Saturas_ADW_JarCurseUndead) == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_JarCurseDo_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_JarCurseDo_01_01");	//Co budeme dělat?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_JarCurseDo_01_02");	//Modlit se k Adanovi... aby nás všechny ušetřil!
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_JarCurseDo_01_03");	//A teď vážně?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_JarCurseDo_01_04");	//(zamyšleně) Já nevím. Ale mám podezření, že všichni tito nemrtví nejsou jen nemyslící stádo.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_JarCurseDo_01_06");	//Řídí je nějaká zlá vůle! Ale čí?
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_JarCurseDo_01_07");	//Máš na mysli něco konkrétního?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_JarCurseDo_01_08");	//Jako u každého národa mají i Stavitelé své vůdce a šéfy. Ty, které respektovali a ctili.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_JarCurseDo_01_09");	//Možná za tím vším stojí někdo z nich!
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_JarCurseDo_01_10");	//Možná Khardimon? On byl velkým vůdcem Stavitelů.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_JarCurseDo_01_11");	//Jediné, co teď můžem udělat je, že se ho zeptáme, co se stalo.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_JarCurseDo_01_14");	//Dávej si ale pozor! Podle mých informací všechny cesty, od velkého chrámu v údolí, nyní ovládají nemrtví.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_JarCurseDo_01_15");	//A teleportační kameny už vůbec nejsou bezpečné.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_JarCurseDo_01_16");	//Takže jestli můžeš postarej se o jejich ochranu.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_JarCurseDo_01_17");	//Postarám se.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_JarCurseDo_01_18");	//Tak si pospěš, každá minuta se počítá.
	MIS_FreeTeleport = LOG_Running;
	Log_CreateTopic(TOPIC_FreeTeleport,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FreeTeleport,LOG_Running);
	B_LogEntry(TOPIC_FreeTeleport,"Saturas mě požádal, abych osvobodil všechny teleporty v údolí z rukou nemrtvých.");	
	B_LogEntry_Quiet(TOPIC_JarCurse,"Podle Saturase řídí armádu nemrtvých něčí zlá vůle. Musím najít Khardimona. Možná, že o tom něco ví.");	
	AI_StopProcessInfos(self);
	Wld_InsertNpc(NONE_ADDON_1159_Rhademes,"ADW_SATURAS_2_GOLDDRAGON");
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"FP_ROAM_VALLEY_037");
	Wld_InsertNpc(Ancient_Warrior_01,"FP_ROAM_VALLEY_036");
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"ADW_VALLEY_PATH_032");
	Wld_InsertNpc(Ancient_Warrior_02,"ADW_VALLEY_PATH_031");
	Wld_InsertNpc(Skeleton_Shadow_Priest_ADW_01,"ADW_SOUTHWEST_TELEPORTSTATION");
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"ADW_PORTALTEMPEL_05");
	Wld_InsertNpc(Ancient_Warrior_01,"ADW_PORTALTEMPEL_06");
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"ADW_PORTALTEMPEL_08B");
	Wld_InsertNpc(Ancient_Warrior_02,"ADW_PORTALTEMPEL_08A");
	Wld_InsertNpc(Skeleton_Shadow_Priest_ADW_02,"ADW_PORTALTEMPEL_TELEPORTSTATION");
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"FP_ROAM_TELEPORT_03_01");
	Wld_InsertNpc(Ancient_Warrior_01,"FP_ROAM_TELEPORT_03_02");
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"FP_ROAM_TELEPORT_03_03");
	Wld_InsertNpc(Ancient_Warrior_02,"FP_ROAM_TELEPORT_03_04");
	Wld_InsertNpc(Skeleton_Shadow_Priest_ADW_03,"FP_ROAM_TELEPORT_03_05");
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"FP_ROAM_CANYON_MONSTER_32");
	Wld_InsertNpc(Ancient_Warrior_01,"FP_ROAM_CANYON_MONSTER_31");
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"ADW_CANYON_TELEPORT_PATH_02");
	Wld_InsertNpc(Ancient_Warrior_02,"FP_ROAM_CANYON_MONSTER_33");
	Wld_InsertNpc(Skeleton_Shadow_Priest_ADW_04,"ADW_CANYON_TELEPORT_PATH_01");
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"BL_UP_PLACE_06");
	Wld_InsertNpc(Ancient_Warrior_01,"FP_ROAM_ORKINCAMP_51");
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"FP_ROAM_ENTRANCEORCGUARD_10");
	Wld_InsertNpc(Ancient_Warrior_02,"BL_UP_PLACE_03");
	Wld_InsertNpc(Skeleton_Shadow_Priest_ADW_05,"ADW_ADANOSTEMPEL_TELEPORTSTATION");
};

instance DIA_ADDON_SATURAS_ADW_JarCurseDone(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_adw_JarCurseDone_condition;
	information = dia_addon_saturas_adw_JarCurseDone_info;
	permanent = FALSE;
	description = "Vyčistil jsem okolí teleportačních kamenů.";
};

func int dia_addon_saturas_adw_JarCurseDone_condition()
{
	if((MIS_FreeTeleport == LOG_Running) && (Npc_IsDead(Skeleton_Shadow_Priest_ADW_01) == TRUE) && (Npc_IsDead(Skeleton_Shadow_Priest_ADW_02) == TRUE) && (Npc_IsDead(Skeleton_Shadow_Priest_ADW_03) == TRUE) && (Npc_IsDead(Skeleton_Shadow_Priest_ADW_04) == TRUE) && (Npc_IsDead(Skeleton_Shadow_Priest_ADW_05) == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_JarCurseDone_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_JarCurseDone_01_01");	//Vyčistil jsem okolí teleportačních kamenů.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_JarCurseDone_01_02");	//Dobře! Alespoň se již nebudeme muset bát, že nám někdo vpadne do zad.
	MIS_FreeTeleport = LOG_Success;
	Log_SetTopicStatus(TOPIC_FreeTeleport,LOG_Success);
	B_LogEntry(TOPIC_FreeTeleport,"Oznámil jsem, Saturasovi, že okolí teleportačních kamenů je bezpečné.");	
};

instance DIA_ADDON_SATURAS_ADW_Qvardemon(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_adw_Qvardemon_condition;
	information = dia_addon_saturas_adw_Qvardemon_info;
	permanent = FALSE;
	description = "Potřebuji tvoji radu.";
};

func int dia_addon_saturas_adw_Qvardemon_condition()
{
	if((MIS_Qvardemon == LOG_Running) && (FTDamageQvardemon == TRUE) && (QvardemonIsDead == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_Qvardemon_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_Qvardemon_01_01");	//Potřebuji tvoji radu.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_Qvardemon_01_02");	//Samozřejmě, můj synu. Co konkrétního?
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_Qvardemon_01_03");	//V jednom z chrámů jsem našel ducha velekněze Stavitelů Khardimona.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_Qvardemon_01_04");	//Myslím, že je to právě jeho zlá vůle, která nutí nemrtvé na nás útočit! Ovládá i mágy a předky kněží, jako je on sám.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_Qvardemon_01_05");	//Potom se domnívám, že ho musíme poslat zpět do říše mrtvých.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_Qvardemon_01_06");	//Zkoušel jsem to, ale moje zbraň je proti němu bezmocná. Nemáš nějaké nápady?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_Qvardemon_01_08");	//Nechci být posel špatných zpráv, ale obávám se, že naše znalosti nebudou stačit.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_Qvardemon_01_09");	//Hmmm... Je možné, že v tomto světě existuje nějaký mocný artefakt, který může zlomit kouzlo pradávného kněze.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_Qvardemon_01_10");	//Musí mít však opravdovou božskou moc! Moc, kterou ti může dát jen sám Adanos.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_Qvardemon_01_11");	//Ale to je jen můj odhad... Nemohu ti říct, kde ten artefakt hledat.
	B_LogEntry(TOPIC_Qvardemon,"Saturas mi řekl, že v boji s Khardimonem muže pomoci jen artefakt s mocí bohů samotných. Pouze takový je schopen zlomit jeho kouzla. Nicméně, je to jen domněnka.");	
};

instance DIA_ADDON_SATURAS_ADW_QvardemonDead(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_adw_QvardemonDead_condition;
	information = dia_addon_saturas_adw_QvardemonDead_info;
	permanent = FALSE;
	description = "Zničil jsem Khardimona!";
};

func int dia_addon_saturas_adw_QvardemonDead_condition()
{
	if(MIS_Qvardemon == LOG_Success)
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_QvardemonDead_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_QvardemonDead_01_01");	//Zničil jsem Khardimona!
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_QvardemonDead_01_02");	//To je výborná zpráva, můj synu. Požehnej ti Adanos!
};

instance DIA_ADDON_SATURAS_ADW_CurseAncient(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_adw_CurseAncient_condition;
	information = dia_addon_saturas_adw_CurseAncient_info;
	permanent = FALSE;
	description = "Co víš o prokletí pradávných lidí?";
};

func int dia_addon_saturas_adw_CurseAncient_condition()
{
	if((MIS_CurseAncient == LOG_Running) && (CurseAncientRemove == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_CurseAncient_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_CurseAncient_01_01");	//Co víš o prokletí pradávných lidí?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_CurseAncient_01_02");	//Nic moc. Proč se ptáš?
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_CurseAncient_01_03");	//Musíme co nejrychleji zbavit prokletí tuto zemi.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_CurseAncient_01_04");	//Můj vnitřní hlas mi říká, že je to jediný způsob, jak zastavit útok nemrtvých.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_CurseAncient_01_05");	//Hmmm... Odkud bereš tu jistotu?
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_CurseAncient_01_06");	//To je na dlouhé vyprávění. Jen mi řekni, co můžeme udělat?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_CurseAncient_01_07");	//Pokud je mi známo, prokletí Stavitelů je velmi staré a velmi mocné.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_CurseAncient_01_08");	//Je velmi nepravděpodobné, že by ho dokázal zlomit obyčejný člověk!
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_CurseAncient_01_09");	//A co Adanos? Ten by mohl být schopen?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_CurseAncient_01_10");	//On je bůh! Vše je v jeho moci... Ale obávám se, že obvyklé modlitby nezaberou...
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_CurseAncient_01_11");	//Nedokážu si představit, že by Adanos udělal něco takového.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_CurseAncient_01_12");	//Muselo by to být něco velmi zvláštního, aby kvůli tomu seslal svoje požehnání na tento prokletý národ.
	B_LogEntry(TOPIC_CurseAncient,"Saturas neví, co může přimět Adana sejmout prokletí z pradávného národa. Odpovědi musím hledat jinde.");	
};

instance DIA_ADDON_SATURAS_ADW_CurseAncientDone(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_adw_CurseAncientDone_condition;
	information = dia_addon_saturas_adw_CurseAncientDone_info;
	permanent = FALSE;
	description = "Pradávní nemrtví jsou již minulostí!";
};

func int dia_addon_saturas_adw_CurseAncientDone_condition()
{
	if(MIS_JarCurse == LOG_Success)
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_CurseAncientDone_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_CurseAncientDone_01_01");	//Pradávní nemrtví jsou již minulostí!
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_CurseAncientDone_01_02");	//A ti, co ještě zůstali, už pro vás nebudou problém.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_CurseAncientDone_01_03");	//Jsi si jistý, můj synu? (nevěřícně) Jestli je to tak, musíme ti všichni poděkovat za naši spásu.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_CurseAncientDone_01_04");	//Poděkuj Adanovi! Já jen plnil jeho vůli.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_CurseAncientDone_01_05");	//No, v tom případě se k němu budu každý den modlit a děkovat za naši spásu.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_CurseAncientDone_01_06");	//Nicméně stále věřím, že i ty na tom máš velký podíl!
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_CurseAncientDone_01_07");	//Tady, vem si tento elixír! Je to nejlepší z toho, co ti mohu nabídnout.
	B_GiveInvItems(self,other,ITPO_MEGAPOTIONSKILL,1);
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_CurseAncientDone_01_08");	//Děkuji.
};

instance DIA_ADDON_SATURAS_ADW_WaterMageDocumentsDone(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_adw_WaterMageDocumentsDone_condition;
	information = dia_addon_saturas_adw_WaterMageDocumentsDone_info;
	permanent = FALSE;
	description = "Myslím, že toto patří tobě.";
};

func int dia_addon_saturas_adw_WaterMageDocumentsDone_condition()
{
	if((MIS_WaterMageDocuments == LOG_Running) && (Npc_HasItems(hero,ItWr_WaterMageDoc) >= 1))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_WaterMageDocumentsDone_info()
{
	B_GivePlayerXP(1500);
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_WaterMageDocumentsDone_01_01");	//Myslím, že toto patří tobě.
	B_GiveInvItems(other,self,ItWr_WaterMageDoc,1);
	Npc_RemoveInvItems(self,ItWr_WaterMageDoc,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_WaterMageDocumentsDone_01_02");	//(překvapeně) Nečekal jsem, že to Lee pošle přímo po tobě.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_WaterMageDocumentsDone_01_03");	//Opravdu záleží na tom, kdo ty záznamy přinese?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_WaterMageDocumentsDone_01_04");	//Ne, jen jsem doufal, že do Hornického údolí pošle velkou skupinu žoldáků.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_WaterMageDocumentsDone_01_05");	//A ty ses s tím vypořádal sám.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_WaterMageDocumentsDone_01_06");	//To tě překvapuje?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_WaterMageDocumentsDone_01_07");	//Trochu... Ale v každém případě jsem velmi vděčný za tvou pomoc.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_WaterMageDocumentsDone_01_08");	//Myslím, že najdeš dobré využití pro tyto svitky.
	B_GiveInvItemsManyThings(self,other);
	CreateInvItems(other,ItSc_IceWave,2);
	CreateInvItems(other,ItSc_LightningFlash,1);
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_WaterMageDocumentsDone_01_09");	//Díky.
	MIS_WaterMageDocuments = LOG_Success;
	Log_SetTopicStatus(TOPIC_WaterMageDocuments,LOG_Success);
	B_LogEntry(TOPIC_WaterMageDocuments,"Přinesl jsem Saturasovi záznamy mágů Vody, které zůstaly v Hornickém údolí.");	
};

instance DIA_ADDON_SATURAS_ADW_SendNorolas(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_adw_SendNorolas_condition;
	information = dia_addon_saturas_adw_SendNorolas_info;
	permanent = FALSE;
	description = "A co ty záznamy, které jsem přinesl?";
};

func int dia_addon_saturas_adw_SendNorolas_condition()
{
	if(MIS_WaterMageDocuments == LOG_Success)
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_SendNorolas_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_SendNorolas_01_01");	//A co ty záznamy, které jsem přinesl?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_SendNorolas_01_02");	//Je v nich shromážděna naše práce v průběhu mnoha let v Hornickém údolí.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_SendNorolas_01_03");	//Většina z nich je věnována tehdejšímu Bratrstvu Spáče.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_SendNorolas_01_04");	//Přesněji řečeno, velmi nás zajímala magie, kterou používali jejich duchovní vůdci - Guru.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_SendNorolas_01_06");	//Jejich magie v přírodě byla zcela jedinečná. Nedokázali jsme pochopit, odkud berou svou magickou energii, nebo jak dokáží využívat runy.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_SendNorolas_01_08");	//Kdyby byly tyto znalosti mágům Vody skrze Adanovu vůli dostupné, tak bychom se stali jejich ochránci.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_SendNorolas_01_09");	//Opravdu to nebyl Spáč?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_SendNorolas_01_10");	//Ano, nejdřív jsem si to myslel taky. Ale pokud je mi známo - Guru, kteří zůstali po pádu bariéry, tuto magii stále používají.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_SendNorolas_01_12");	//Proto musí existovat nějaké jiné vysvětlení.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_SendNorolas_01_13");	//Proč si o tom s nimi nepromluvíte?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_SendNorolas_01_14");	//Obávám se, že je nepravděpodobné, že by odhalili svá tajemství.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_SendNorolas_01_15");	//Co navrhuješ?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_SendNorolas_01_16");	//V nedávné době jsem se rozhodl poslat jednoho z našich noviců do starého chrámu Bratrstva v bažinách.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_SendNorolas_01_17");	//S největší pravděpodobností odpovědi na naše otázky můžeme najít pouze tam.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_SendNorolas_01_18");	//Ale je to velmi nebezpečné! Nemáš strach že padne do zajetí skřetů nebo ho roztrhá divoká zvěř?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_SendNorolas_01_20");	//Jsem si jistý, že to zvládne. Je velmi dobře připraven! Ačkoli zvláštní pomoc by nebyla na škodu.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_SendNorolas_01_21");	//Pokud chceš, můžeš jít za ním a pomoci mu v našem úsilí.
	MIS_SendNorolas = LOG_Running;
	Log_CreateTopic(TOPIC_SendNorolas,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SendNorolas,LOG_Running);
	B_LogEntry(TOPIC_SendNorolas,"Saturas poslal novice mága do chrámu Bratrstva Spáče, který leží v bažině v Hornickém údolí. Mohl bych mu pomoci. Saturas hledá něco, co je nějak spojeno s magií Guru.");
};

var int SaturasReadDay;
var int SaturasReadGuru;

instance DIA_ADDON_SATURAS_ADW_SendNorolas_Done(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_adw_SendNorolas_Done_condition;
	information = dia_addon_saturas_adw_SendNorolas_Done_info;
	permanent = FALSE;
	description = "Přinesl jsem Y'Berionův deník!";
};

func int dia_addon_saturas_adw_SendNorolas_Done_condition()
{
	if((MIS_SendNorolas == LOG_Success) && (Npc_HasItems(hero,ItWr_UberionBook) >= 1))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_SendNorolas_Done_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_SendNorolas_Done_01_01");	//Přinesl jsem Y'Berionův deník!
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_SendNorolas_Done_01_02");	//To je velmi dobrá zpráva, můj synu. Podívám se na něj.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_SendNorolas_Done_01_03");	//Tady.
	B_GiveInvItems(other,self,ItWr_UberionBook,1);
	Npc_RemoveInvItems(self,ItWr_UberionBook,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_SendNorolas_Done_01_04");	//Hmmm... Ano, velmi zajímavě tento muž uvažoval.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_SendNorolas_Done_01_05");	//Nyní máme naději, že se dozvíme, jak přesně Guru mohli používat magické runy.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_SendNorolas_Done_01_06");	//Chci ti poděkovat za pomoc Norolasovi. Mimochodem, kde je?
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_SendNorolas_Done_01_07");	//Zůstal v Hornickém údolí. Zaujal ho místní tábor bývalých noviců Bratrstva.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_SendNorolas_Done_01_10");	//Zdá se, že jejich vůdce není nikdo jiný než skutečný druid!
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_SendNorolas_Done_01_11");	//Druid? Hmmm... Naposledy jsem o nich slyšel na pevnině... to bylo už dávno.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_SendNorolas_Done_01_12");	//No abych pravdu řekl, nějak mě to teď nezajímá. 
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_SendNorolas_Done_01_13");	//Ale za tvou nezjištnou pomoc ti chci dát nějaké cenné svitky a lektvary.
	B_GiveInvItemsManyThings(self,other);
	CreateInvItems(other,ItSc_Waterfist,1);
	CreateInvItems(other,ItPo_Perm_Health,1);
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_SendNorolas_Done_01_15");	//Díky.
	SaturasReadGuru = TRUE;
	SaturasReadDay = Wld_GetDay();
};

instance DIA_Addon_Saturas_ADW_SwampSecret(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = DIA_Addon_Saturas_ADW_SwampSecret_condition;
	information = DIA_Addon_Saturas_ADW_SwampSecret_info;
	important = TRUE;
};

func int DIA_Addon_Saturas_ADW_SwampSecret_condition()
{
	var int DayNow;

	DayNow = Wld_GetDay();

	if((SaturasReadGuru == TRUE) && (SaturasReadDay < DayNow))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_ADW_SwampSecret_info()
{
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_SwampSecret_01_01");	//Je dobré, že jsi tady, synu! Čekám na tebe.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_SwampSecret_01_02");	//Co se stalo?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_SwampSecret_01_03");	//Před nějakým časem jsi mi přinesl Y'Berionův deník, za což jsem velmi vděčný.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_SwampSecret_01_04");	//Ale obávám se, že to nestačí. Není tu žádné vysvětlení toho, jak se Guru naučili používat magii.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_SwampSecret_01_05");	//Jsme však přesvědčeni, že jejich kouzlo jim nebylo dáno Spáčem.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_SwampSecret_01_06");	//Ve svém deníku Y'Berion uvádí, že používal obyčejnou bažinnou trávu pro zvýšení své magické síly.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_SwampSecret_01_07");	//Předpokládám, že toto je jediná stopa, která nás může vést k odhalení tohoto tajemství.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_SwampSecret_01_08");	//Takže nejprve se musíme naučit trochu více o této rostlině. Věřím, že nám neodmítneš pomoct.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_SwampSecret_01_09");	//Samozřejmě, starče - zkusím ti něco zjistit.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_SwampSecret_01_10");	//Děkuji synu...
	MIS_SwampSecret = LOG_Running;
	Log_CreateTopic(TOPIC_SwampSecret,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SwampSecret,LOG_Running);
	B_LogEntry(TOPIC_SwampSecret,"Saturas věří, že bažina je nějak spojena s magií Guru. Možná bych se měl zeptat na někoho, kdo je v alchymii a bylinkářství mnohem lepší než ostatní.");
};

instance DIA_Addon_Saturas_ADW_SwampSecret_Done(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = DIA_Addon_Saturas_ADW_SwampSecret_Done_condition;
	information = DIA_Addon_Saturas_ADW_SwampSecret_Done_info;
	permanent = FALSE;
	description = "Zjistil jsem, kde Guru berou svou magickou sílu.";
};

func int DIA_Addon_Saturas_ADW_SwampSecret_Done_condition()
{
	if((MIS_SwampSecret == LOG_Running) && (Npc_HasItems(hero,ItWr_StonePower) >= 1) && (StonePower == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_ADW_SwampSecret_Done_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_SwampSecret_Done_01_01");	//Zjistil jsem, kde Guru berou svou magickou sílu.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_SwampSecret_Done_01_02");	//Řekni mi všechno, co jsi zjistil.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_SwampSecret_Done_01_03");	//Měl jsi pravdu - je to vše z bažinné trávy.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_SwampSecret_Done_01_04");	//Vážně?
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_SwampSecret_Done_01_05");	//Naprosto. Každý stonek trávy nese magickou sílu elementů Země a Kamene.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_SwampSecret_Done_01_06");	//Toto kouzlo je rozděleno v každé rostlině, která roste na tomto světě.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_SwampSecret_Done_01_07");	//Pokud je člověk dostatečně duševně silný, může tuto trávu použít, aby změnil své vědomí a naučil se užívat této magie.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_SwampSecret_Done_01_08");	//Neuvěřitelné! Neuměl jsem si představit nic takového. Ale jak ses o tom dozvěděl?
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_SwampSecret_Done_01_09");	//Četl jsem o tom v jedné ze starých tabulek. Tady - můžeš si to vzít.
	B_GiveInvItems(other,self,ItWr_StonePower,1);
	Npc_RemoveInvItems(self,ItWr_StonePower,1);
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_SwampSecret_Done_01_10");	//Jak zajímavé! Budu ji pečlivě studovat.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_SwampSecret_Done_01_11");	//Děkuji za pomoc. Tady, vezmi si to - tyhle svitky určitě využiješ.
	B_GiveInvItems(self,other,ItSc_IceWave,2);
	MIS_SwampSecret = LOG_Success;
	Log_SetTopicStatus(TOPIC_SwampSecret,LOG_Success);
	B_LogEntry(TOPIC_SwampSecret,"Saturasovi jsem dal starobylou tabulku, která popisovala magické vlastnosti trávy z bažin. Myslím, že zbytek pochopí sám.");
};

instance DIA_Addon_Saturas_ADW_OpenPortal(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = DIA_Addon_Saturas_ADW_OpenPortal_condition;
	information = DIA_Addon_Saturas_ADW_OpenPortal_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Addon_Saturas_ADW_OpenPortal_condition()
{
	if(AdanosPortalOpen == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_ADW_OpenPortal_info()
{
	B_GivePlayerXP(200);
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_OpenPortal_01_01");	//(zmateně) Můj synu, co to bylo?
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_OpenPortal_01_02");	//O čem to mluvíš?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_OpenPortal_01_03");	//Hovořím o jasném záblesku světla, které rozsvítilo oblohu na severovýchodě údolí.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_OpenPortal_01_04");	//A pak přišel skutečný déšť, i když na obloze nebyl jediný mrak.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_OpenPortal_01_05");	//Myslím, že je to díky magickému portálu. Aktivoval jsem ho starodávnou magií Stavitelů.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_OpenPortal_01_06");	//Neuvěřitelné! Co je však tento portál a kde vede?
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_OpenPortal_01_07");	//Ještě nevím. Ale brzy zjistím.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_OpenPortal_01_08");	//Být tebou, jsem velmi opatrný. Možná, za tímto portálem je skryté, něco, čeho bychom se měli vyvarovat!
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_OpenPortal_01_10");	//Domnívám se, že moje slova tě pravděpodobně nezastaví.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_OpenPortal_01_11");	//Vskutku.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_OpenPortal_01_12");	//(povzdech) Dobře. Nezapomeň, že důsledky mohou být nepředvídatelné.
	SaturasKnowPortalOpenDay = Wld_GetDay();
	MIS_LostPower = LOG_Running;
	Log_CreateTopic(TOPIC_LostPower,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LostPower,LOG_Running);
	B_LogEntry(TOPIC_LostPower,"Řekl jsem Saturasovi, že jsem objevil podivný magický portál na severovýchodě údolí. Požádal mě, abych se od něho držel, protože se bál, co by mohlo být skryto na druhé straně. Alespoň prozatím.");
	AI_StopProcessInfos(self);
};
