
instance DIA_Bartok_EXIT(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 999;
	condition = DIA_Bartok_EXIT_Condition;
	information = DIA_Bartok_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bartok_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Bartok_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Bartok_Hallo(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 1;
	condition = DIA_Bartok_Hallo_Condition;
	information = DIA_Bartok_Hallo_Info;
	permanent = FALSE;
	description = "Jak se vede?";
};


func int DIA_Bartok_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Bartok_Hallo_Info()
{
	AI_Output(other,self,"DIA_Bartok_Hello_15_00");	//Jak se vede?
	AI_Output(self,other,"DIA_Bartok_Hello_04_01");	//Ty nejsi tady z okolí, co? Nevadí - ani já ne.
	AI_Output(other,self,"DIA_Bartok_Hello_15_02");	//Kde ses toulal dřív?
	AI_Output(self,other,"DIA_Bartok_Hello_04_03");	//V lesích, společně s dalšími lovci jsme chytali mrchožrouty a vlky.
	AI_Output(self,other,"DIA_Bartok_Hello_04_04");	//Ale nechal jsem toho. Teď jsou nebezpečný časy. Pohybuje se tu spousta různý chátry.
};


instance DIA_Bartok_Jaeger(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 2;
	condition = DIA_Bartok_Jaeger_Condition;
	information = DIA_Bartok_Jaeger_Info;
	permanent = FALSE;
	description = "Kde najdu ty ostatní lovce?";
};

func int DIA_Bartok_Jaeger_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bartok_Hallo) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Bartok_Jaeger_Info()
{
	AI_Output(other,self,"DIA_Bartok_Jager_15_00");	//Kde najdu ty ostatní lovce?
	AI_Output(self,other,"DIA_Bartok_Jager_01_01");	//Tady ve městě je rozhodně nenajdeš... (usměje se) Tady jsme zústali jen já a můj přítel Trokar.
	AI_Output(self,other,"DIA_Bartok_Jager_01_02");	//Zbytek odešel do tábora poblíž Onarovy farmy, někde v půli cesty od hostince.
	AI_Output(other,self,"DIA_Bartok_Jager_01_03");	//Co je to za tábor?!
	AI_Output(self,other,"DIA_Bartok_Jager_01_04");	//Říkáme tomu tábor Svobodných lovců! Sám jsem ho byl několikrát navštívit... 
	AI_Output(other,self,"DIA_Bartok_Jager_01_05");	//Jaké to tam je?
	AI_Output(self,other,"DIA_Bartok_Jager_01_06");	//Abych řekl pravdu, tak je to dobré místo, velice přívětivé.
	AI_Output(other,self,"DIA_Bartok_Jager_01_07");	//Potom bude nezbytné abych tábor navštívil také.
	AI_Output(self,other,"DIA_Bartok_Jager_01_08");	//Můžeš to zkusit (usměje se) Možná se jednou staneš jedním z nich!
	AI_Output(self,other,"DIA_Bartok_Jager_01_09");	//Věř mi, od chlapů v táboře se mají ještě hodně co učit.
	AI_Output(other,self,"DIA_Bartok_Jager_01_10");	//Co mám teda udělat?
	AI_Output(self,other,"DIA_Bartok_Jager_01_11");	//Hmmm (zamyslí se) Opravdu nevím.
	AI_Output(self,other,"DIA_Bartok_Jager_01_12");	//Ale myslím, že pro začátek by sis mohl sehnat nějakou loveckou zbroj.
	AI_Output(self,other,"DIA_Bartok_Jager_01_13");	//V těch hadrech co máš právě na sobě by tě měli chlapi tak akorát za nějakého žebráka.
	AI_Output(self,other,"DIA_Bartok_Jager_01_14");	//A nikdo se s tebou vůbec nezačne ani bavit.
	AI_Output(other,self,"DIA_Bartok_Jager_01_15");	//Kde seženu loveckou zbroj?!
	AI_Output(self,other,"DIA_Bartok_Jager_01_16");	//Vím pouze o jednom takovém místě - u obchodníka Bospera. Jedině ten má skvělé lovecké zbroje!
	AI_Output(self,other,"DIA_Bartok_Jager_01_17");	//Pravda je, že se budeš muset možná stát jedním z jeho poskoků.
	AI_Output(self,other,"DIA_Bartok_Jager_01_18");	//Neprodává své zbroje jen tak.
	AI_Output(self,other,"DIA_Bartok_Jager_01_19");	//Ale když se u nej zaměstnáš, tak máš zbroj prakticky v rucích. Já svou získal stejně.
	AI_Output(self,other,"DIA_Bartok_Jager_01_20");	//Takže, myslím, že víš co máš dělat.
};


instance DIA_Addon_Bartok_MissingPeople(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 5;
	condition = DIA_Addon_Bartok_MissingPeople_Condition;
	information = DIA_Addon_Bartok_MissingPeople_Info;
	description = "Kde je Trokar nyní?";
};

func int DIA_Addon_Bartok_MissingPeople_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bartok_Jaeger) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Bartok_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Bartok_MissingPeople_15_00");	//Kde je Trokar nyní?
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_04_01");	//No, to je divný příběh.
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_04_02");	//Před pár dny jsme se oba potulovali kolem Coraganovy hospody a povídali si o lovu.
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_04_03");	//Neptej se mě, co se stalo. Byl jsem totiž dost opilý.
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_04_04");	//Jenom si pamatuju, že Trokar chtěl sehnat nějakou trávu z bažin, ale už se nikdy nevrátil.
	MIS_Bartok_MissingTrokar = LOG_Running;
	Info_ClearChoices(DIA_Addon_Bartok_MissingPeople);
	Info_AddChoice(DIA_Addon_Bartok_MissingPeople,"Zkoušel si ho najít?",DIA_Addon_Bartok_MissingPeople_such);
	Info_AddChoice(DIA_Addon_Bartok_MissingPeople,"Kde můžu najít trochu hulení?",DIA_Addon_Bartok_MissingPeople_wo);
};

func void DIA_Addon_Bartok_MissingPeople_wo()
{
	AI_Output(other,self,"DIA_Addon_Bartok_MissingPeople_wo_15_00");	//Kde můžu najít trochu hulení?
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_wo_04_01");	//Pokud vím, tak někde dole v přístavu.
};

func void DIA_Addon_Bartok_MissingPeople_such()
{
	AI_Output(other,self,"DIA_Addon_Bartok_MissingPeople_such_15_00");	//Ty jsi ho nehledal?
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_such_04_01");	//Ne, ale řekl jsem o tom domobraně.
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_such_04_02");	//A nikdo z nich nebyl schopný ho najít.
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_such_04_03");	//Doufám, že ho nenapadnul nějaký vlk nebo něco horšího.
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_such_04_04");	//Myšlenka, že při lovu zakopnu o jeho chladné tělo mě děsí.
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_such_04_05");	//Nevím, jestli bych se přes to přenesl.
	MIS_TROKARMISS = LOG_Running;
	Log_CreateTopic(TOPIC_TROKARMISS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TROKARMISS,LOG_Running);
	B_LogEntry(TOPIC_TROKARMISS,"Bartokův přítel Trokar zmizel! Bartok dokonce informoval domobranu, ale jejich hledání bylo bezvýsledné.");
	Wld_InsertNpc(vlk_6138_trokar,"NW_FOREST_PATH_04_16_MONSTER2");
	B_KillNpc(vlk_6138_trokar);
	Wld_InsertNpc(orcwarrior2,"FP_ROAM_NW_FOREST_PATH_04_16_MONSTER2_02");
	Wld_InsertNpc(orcwarrior2,"FP_ROAM_NW_FOREST_PATH_04_16_MONSTER2_03");
	Wld_InsertNpc(orcwarrior3,"FP_ROAM_NW_FOREST_PATH_04_16_MONSTER2_04");
};

instance DIA_ADDON_BARTOK_FINDTROKAR(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 1;
	condition = dia_addon_bartok_findtrokar_condition;
	information = dia_addon_bartok_findtrokar_info;
	permanent = FALSE;
	description = "Mám pro tebe špatné zprávy.";
};

func int dia_addon_bartok_findtrokar_condition()
{
	if((MIS_TROKARMISS == LOG_Running) && (Npc_HasItems(hero,itri_trokarring) >= 1))
	{
		return TRUE;
	};
};

func void dia_addon_bartok_findtrokar_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Addon_Bartok_FindTrokar_01_00");	//Mám pro tebe špatné zprávy
	AI_Output(self,other,"DIA_Addon_Bartok_FindTrokar_01_01");	//Jakou?! Co se stalo?
	AI_Output(other,self,"DIA_Addon_Bartok_FindTrokar_01_02");	//Opravdu si nepřeji tě naštvat, ale tvůj přítel Trokar už se nikdy nevrátí.
	AI_Output(self,other,"DIA_Addon_Bartok_FindTrokar_01_03");	//Cože? Proč?!
	AI_Output(other,self,"DIA_Addon_Bartok_FindTrokar_01_04");	//Jednoduše... Zemřel.
	AI_Output(self,other,"DIA_Addon_Bartok_FindTrokar_01_05");	//Zemřel? Ale... Ne! To prostě není možné!
	AI_Output(self,other,"DIA_Addon_Bartok_FindTrokar_01_06");	//Jak se to mohlo stát?
	AI_Output(other,self,"DIA_Addon_Bartok_FindTrokar_01_07");	//Našel jsem jeho tělo v lese poblíž Akilovy farmy.
	AI_Output(other,self,"DIA_Addon_Bartok_FindTrokar_01_08");	//Pravděpodobně při lovu narazil na skupinku skřetů a ti ho roztrhali na kusy.
	AI_Output(self,other,"DIA_Addon_Bartok_FindTrokar_01_09");	//Ale... Jsi si vážně jistý, že to byl Trokar?!
	AI_Output(other,self,"DIA_Addon_Bartok_FindTrokar_01_10");	//Pochybnosti nejsou na místě. Měl u sebe tento prsten.
	B_GiveInvItems(other,self,itri_trokarring,1);
	Npc_RemoveInvItems(self,itri_trokarring,1);
	AI_Output(self,other,"DIA_Addon_Bartok_FindTrokar_01_11");	//Ano, ten je opravdu jeho... Takže je to pravda, můj jediný přítel Trokar je mrtev!
	AI_Output(other,self,"DIA_Addon_Bartok_FindTrokar_01_12");	//Je mi to vážně líto.
	AI_Output(self,other,"DIA_Addon_Bartok_FindTrokar_01_13");	//No co se dá dělat... asi to byl jeho osud.
	AI_Output(self,other,"DIA_Addon_Bartok_FindTrokar_01_14");	//V každém případě díky za ten prsten! Zůstane mou jedinou vzpomínkou na starého přítele.
	AI_Output(self,other,"DIA_Addon_Bartok_FindTrokar_01_15");	//Teď bude napořád se mnou. I když pochybuji, že mě to nějak uklidní.
	MIS_TROKARMISS = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_TROKARMISS,LOG_SUCCESS);
	B_LogEntry(TOPIC_TROKARMISS,"Informoval jsem Bartoka o smrti jeho přítele - Bartoka. Byl velmi smutný, ale víc jsem pro něj udělat nemohl...");
};


instance DIA_Bartok_Bosper(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 3;
	condition = DIA_Bartok_Bosper_Condition;
	information = DIA_Bartok_Bosper_Info;
	permanent = FALSE;
	description = "Bosper říkal, že jsi pro něj pracoval...";
};


func int DIA_Bartok_Bosper_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bosper_Bartok) && Npc_KnowsInfo(other,DIA_Bartok_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Bartok_Bosper_Info()
{
	AI_Output(other,self,"DIA_Bartok_Bosper_15_00");	//Bosper říkal, že jsi pro něj pracoval...
	AI_Output(self,other,"DIA_Bartok_Bosper_04_01");	//Ano, pracoval. Ale on se zajímal jen o ty svý kůže.
	AI_Output(self,other,"DIA_Bartok_Bosper_04_02");	//Říkal jsem mu, jak je to venku nebezpečný. Ale vůbec mě neposlouchal.
	AI_Output(self,other,"DIA_Bartok_Bosper_04_03");	//No, ale jinak platil dobře - na to si nemůžu stěžovat.
	AI_Output(other,self,"DIA_Bartok_Bosper_15_04");	//Můžeš mi o něm něco říct?
	AI_Output(self,other,"DIA_Bartok_Bosper_04_05");	//(smích) Bosperovi někdo nedávno ukradl luk. Za bílého dne.
	AI_Output(self,other,"DIA_Bartok_Bosper_04_06");	//Nějakej chlap prostě nakráčel do jeho skladu, vzal luk a zmizel.
	AI_Output(self,other,"DIA_Bartok_Bosper_04_07");	//Ti zloději jsou čím dál tím drzejší!

	if(MIS_Bosper_Bogen != LOG_SUCCESS)
	{
		MIS_Bosper_Bogen = LOG_Running;
	};
};

instance DIA_Bartok_WannaLearn(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 4;
	condition = DIA_Bartok_WannaLearn_Condition;
	information = DIA_Bartok_WannaLearn_Info;
	permanent = FALSE;
	description = "Můžeš mě naučit něco o lovu?";
};

func int DIA_Bartok_WannaLearn_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bartok_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Bartok_WannaLearn_Info()
{
	AI_Output(other,self,"DIA_Bartok_WannaLearn_15_00");	//Můžeš mě naučit něco o lovu?
	AI_Output(self,other,"DIA_Bartok_WannaLearn_04_01");	//Můžu tě naučit jak se správně plížit a jak zacházet s lukem.
	AI_Output(self,other,"DIA_Bartok_WannaLearn_04_02");	//A taky jak stahovat zvířata z kůže. To mě naučil Bosper.
	Bartok_TeachPlayer = TRUE;
	Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_CityTeacher,"Bartok mě naučí plížit se, střílet z luku a jak stahovat zvířata z kůže.");
};

instance DIA_Bartok_TeachFUR(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 900;
	condition = DIA_Bartok_TeachFUR_Condition;
	information = DIA_Bartok_TeachFUR_Info;
	permanent = TRUE;
	description = "Vysvětli mi, jak stahovat zvířata z kůže.";
};

func int DIA_Bartok_TeachFUR_Condition()
{
	if((Bartok_TeachPlayer == TRUE) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bartok_TeachFUR_Info()
{
	AI_Output(other,self,"DIA_Bosper_TeachFUR_15_00");	//Vysvětli mi, jak stahovat zvířata z kůže!
	Info_ClearChoices(DIA_Bartok_TeachFUR);
	Info_AddChoice(DIA_Bartok_TeachFUR,Dialog_Back,DIA_Bartok_TeachFUR_Back);
	Info_AddChoice(DIA_Bartok_TeachFUR,b_buildlearnstringforsmithhunt("Stahování kůží",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Fur)),DIA_Bartok_TeachFUR_Do);
};

func void DIA_Bartok_TeachFUR_Back()
{
	Info_ClearChoices(DIA_Bartok_TeachFUR);
};

func void DIA_Bartok_TeachFUR_Do()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Fur))
	{
		AI_Output(self,other,"DIA_Bartok_TeachFUR_11_01");	//No tak poslouchej, je to jednoduché, opravdu.
		AI_Output(self,other,"DIA_Bartok_TeachFUR_11_02");	//Stačí vzít ostrý nůž a rozříznout zvířeti břicho. Pak po stranách trochu nařízni kůži na nohou a můžeš celou kožišinu směle stáhnout.
	};

	Info_ClearChoices(DIA_Bartok_TeachFUR);
};

instance DIA_Bartok_TeachSneak(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 899;
	condition = DIA_Bartok_TeachSneak_Condition;
	information = DIA_Bartok_TeachSneak_Info;
	permanent = TRUE;
	description = "Nauč mě, jak se plížit.";
};

func int DIA_Bartok_TeachSneak_Condition()
{
	if((Bartok_TeachPlayer == TRUE) && (Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) == 0))
	{
		return TRUE;
	};
};

func void DIA_Bartok_TeachSneak_Info()
{
	AI_Output(other,self,"DIA_Bartok_TeachSneak_15_00");	//Nauč mě, jak se plížit.
	Info_ClearChoices(DIA_Bartok_TeachSneak);
	Info_AddChoice(DIA_Bartok_TeachSneak,Dialog_Back,DIA_Bartok_TeachSneak_Back);
	Info_AddChoice(DIA_Bartok_TeachSneak,b_buildlearnstringforthief("Plížení",B_GetLearnCostTalent(other,NPC_TALENT_SNEAK,1)),DIA_Bartok_TeachSneak_SNEAK);
};

func void DIA_Bartok_TeachSneak_Back()
{
	Info_ClearChoices(DIA_Bartok_TeachSneak);
};

func void DIA_Bartok_TeachSneak_SNEAK()
{
	if(B_TeachThiefTalent(self,other,NPC_TALENT_SNEAK))
	{
		AI_Output(self,other,"DIA_Bartok_TeachSneak_04_01");	//Dobrá - tak nejdřív se musíš ujistit, že správně přesouváš své těžiště.
		AI_Output(self,other,"DIA_Bartok_TeachSneak_04_02");	//Na to musíš ohnout kolena a došlapovat na paty.
		AI_Output(self,other,"DIA_Bartok_TeachSneak_04_03");	//Musíš mít vždycky váhu svýho těla na noze, na který stojíš, až do tý doby, než tou druhou jistě došlápneš.
		AI_Output(self,other,"DIA_Bartok_TeachSneak_04_04");	//Kolem většiny zvířat se nemůžeš proplížit, pokud nespí. Ty potvory tě prostě vycítí.
		AI_Output(self,other,"DIA_Bartok_TeachSneak_04_05");	//Takže vždycky, když jsi venku, dávej dobrej pozor.
	};

	Info_ClearChoices(DIA_Bartok_TeachSneak);
};

var int Bosper_MerkeBow;

instance DIA_Bartok_Teach(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 4;
	condition = DIA_Bartok_Teach_Condition;
	information = DIA_Bartok_Teach_Info;
	permanent = TRUE;
	description = "Chci se naučit líp zacházet s lukem!";
};

func int DIA_Bartok_Teach_Condition()
{
	if(Bartok_TeachPlayer == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Bartok_Teach_Info()
{
	AI_Output(other,self,"DIA_Bartok_TeachBow_15_00");	//Chci se naučit líp zacházet s lukem!
	AI_Output(self,other,"DIA_Bartok_TeachBow_04_01");	//Fajn, tak se podíváme, jestli s tím můžu něco dělat...
	Bosper_MerkeBow = other.HitChance[NPC_TALENT_BOW];
	Info_ClearChoices(DIA_Bartok_Teach);
	Info_AddChoice(DIA_Bartok_Teach,Dialog_Back,DIA_Bartok_Teach_Back);
	Info_AddChoice(DIA_Bartok_Teach,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_Bartok_Teach_BOW_1);
	Info_AddChoice(DIA_Bartok_Teach,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),DIA_Bartok_Teach_BOW_5);
};

func void DIA_Bartok_Teach_Back()
{
	if(other.HitChance[NPC_TALENT_BOW] >= 60)
	{
		AI_Output(self,other,"DIA_Bartok_TeachBow_BACK_04_00");	//Měl by ses podívat po někom, kdo o tom ví víc než já.
	}
	else if(Bosper_MerkeBow < other.HitChance[NPC_TALENT_BOW])
	{
		AI_Output(self,other,"DIA_Bartok_TeachBow_BACK_04_01");	//Skvěle, dosáhl si větší přesnosti.
	};
	Info_ClearChoices(DIA_Bartok_Teach);
};

func void DIA_Bartok_Teach_BOW_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,1,60);
	Info_ClearChoices(DIA_Bartok_Teach);
	Info_AddChoice(DIA_Bartok_Teach,Dialog_Back,DIA_Bartok_Teach_Back);
	Info_AddChoice(DIA_Bartok_Teach,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_Bartok_Teach_BOW_1);
	Info_AddChoice(DIA_Bartok_Teach,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),DIA_Bartok_Teach_BOW_5);
};

func void DIA_Bartok_Teach_BOW_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,5,60);
	Info_ClearChoices(DIA_Bartok_Teach);
	Info_AddChoice(DIA_Bartok_Teach,Dialog_Back,DIA_Bartok_Teach_Back);
	Info_AddChoice(DIA_Bartok_Teach,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_Bartok_Teach_BOW_1);
	Info_AddChoice(DIA_Bartok_Teach,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),DIA_Bartok_Teach_BOW_5);
};


var int Bartok_Bereit;
var int Bartok_Later;

instance DIA_Bartok_Zusammen(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 5;
	condition = DIA_Bartok_Zusammen_Condition;
	information = DIA_Bartok_Zusammen_Info;
	permanent = TRUE;
	description = "Co takhle jít lovit společně?";
};


func int DIA_Bartok_Zusammen_Condition()
{
	if((Bartok_Bereit == FALSE) && Npc_KnowsInfo(other,DIA_Bartok_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Bartok_Zusammen_Info()
{
	if(Bartok_Later == FALSE)
	{
		AI_Output(other,self,"DIA_Bartok_Zusammen_15_00");	//Co takhle jít lovit společně?
		AI_Output(self,other,"DIA_Bartok_Zusammen_04_01");	//Hmm. Ve dvou to nebude tak nebezpečné, to je pravda.
		AI_Output(self,other,"DIA_Bartok_Zusammen_04_02");	//Víš aspoň něco o lovu?
		AI_Output(self,other,"DIA_Bartok_Zusammen_04_03");	//Myslím, například jak stahovat zvířata.
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == TRUE)
	{
		if(Bartok_Later == TRUE)
		{
			AI_Output(self,other,"DIA_Bartok_HuntNOW_04_01");	//Máš 50 zlatých?
		}
		else
		{
			AI_Output(other,self,"DIA_Bartok_Zusammen_15_04");	//Ano.
			AI_Output(self,other,"DIA_Bartok_Zusammen_04_05");	//Dobrá, ale chci nejdřív vidět 50 zlatých. Za to si můžeš nechat všechny kůže a prodat je Bosperovi.
			AI_Output(self,other,"DIA_Bartok_Zusammen_04_06");	//To je férová nabídka, ne?
		};
		Info_ClearChoices(DIA_Bartok_Zusammen);
		Info_AddChoice(DIA_Bartok_Zusammen,"Později...",DIA_Bartok_Zusammen_Later);
		Info_AddChoice(DIA_Bartok_Zusammen,"Tady jsou.",DIA_Bartok_Zusammen_Pay);
	}
	else
	{
		AI_Output(other,self,"DIA_Bartok_Zusammen_15_07");	//Ne.
		AI_Output(self,other,"DIA_Bartok_Zusammen_04_08");	//V tom případě to za to nestojí.
		AI_Output(self,other,"DIA_Bartok_Zusammen_04_09");	//Vrať se až budeš něco umět
	};
};

func void DIA_Bartok_Zusammen_Later()
{
	AI_Output(other,self,"DIA_Bartok_HuntNOW_Later_15_00");	//Později...
	Bartok_Later = TRUE;
	Info_ClearChoices(DIA_Bartok_Zusammen);
};

func void DIA_Bartok_Zusammen_Pay()
{
	Info_ClearChoices(DIA_Bartok_Zusammen);
	if(B_GiveInvItems(other,self,ItMi_Gold,50))
	{
		AI_Output(other,self,"DIA_Bartok_HuntNOW_GO_15_00");	//Tady jsou.
		Bartok_Bereit = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Bartok_HuntNOW_GO_04_03");	//A kde? Nemáš u sebe žádné zlato.
	};
};


var int Bartok_Los;

instance DIA_Bartok_HuntNOW(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 5;
	condition = DIA_Bartok_HuntNOW_Condition;
	information = DIA_Bartok_HuntNOW_Info;
	permanent = FALSE;
	description = "Jdeme na lov!";
};


func int DIA_Bartok_HuntNOW_Condition()
{
	if(Bartok_Bereit == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Bartok_HuntNOW_Info()
{
	AI_Output(other,self,"DIA_Bartok_HuntNOW_15_00");	//Jdeme na lov!
	AI_Output(self,other,"DIA_Bartok_HuntNOW_GO_04_01");	//Dobrá, pojď za mnou. Venku za jižní bránou je les, kde se dá tý havěti najít víc než dost.
	AI_Output(self,other,"DIA_Bartok_HuntNOW_GO_04_02");	//(pro sebe) Možná víc, než by nám mohlo líbit.
	Bartok_Los = TRUE;
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"GUIDEMITTE");
	Wld_InsertNpc(Wolf,"NW_FARM1_CITYWALL_FOREST_02");
	Wld_InsertNpc(Wolf,"NW_FARM1_CITYWALL_FOREST_02");
	Wld_InsertNpc(Wolf,"NW_FARM1_CITYWALL_FOREST_02");
};


var int Bartok_OrkStillThere;

instance DIA_Bartok_ImWald(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 1;
	condition = DIA_Bartok_ImWald_Condition;
	information = DIA_Bartok_ImWald_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Bartok_ImWald_Condition()
{
	if((Bartok_Los == TRUE) && (Bartok_Ende == FALSE) && (Npc_GetDistToWP(self,"NW_FARM1_CITYWALL_FOREST_03") < 500))
	{
		return TRUE;
	};
};

func void DIA_Bartok_ImWald_Info()
{
	AI_Output(self,other,"DIA_Bartok_ImWald_04_00");	//Tak co myslíš, půjdeme dál do lesa, nebo ne?
	Info_ClearChoices(DIA_Bartok_ImWald);
	Info_AddChoice(DIA_Bartok_ImWald,"Vraťme se!",DIA_Bartok_ImWald_NachHause);
	Info_AddChoice(DIA_Bartok_ImWald,"Pokračujem!",DIA_Bartok_ImWald_Weiter);
};

func void DIA_Bartok_ImWald_NachHause()
{
	AI_Output(other,self,"DIA_Bartok_ImWald_NachHause_15_00");	//Vraťme se!
	AI_Output(self,other,"DIA_Bartok_ImWald_NachHause_04_01");	//Taky bych se raději vrátil. Nejspíš by se nám podařilo vběhnout přímo do náručí nějakému skřetovi.
	Info_ClearChoices(DIA_Bartok_ImWald);
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;

	if(MIS_CoragonFixBeer == LOG_Success)
	{
		Npc_ExchangeRoutine(self,"Coragon");
	}
	else
	{
		Npc_ExchangeRoutine(self,"Start");
	};
};

func void DIA_Bartok_ImWald_Weiter()
{
	AI_Output(other,self,"DIA_Bartok_ImWald_Weiter_15_00");	//Pokračujem.
	AI_Output(self,other,"DIA_Bartok_ImWald_Weiter_04_01");	//Dobrá. (pro sebe) Doufejme, že se to nějak vyřeší...

	if(OrcWarriorHaradIsDead == FALSE)
	{
		Bartok_OrkStillThere = TRUE;
	};

	Info_ClearChoices(DIA_Bartok_ImWald);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GUIDEENDE");
};

instance DIA_Bartok_Angekommen(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 1;
	condition = DIA_Bartok_Angekommen_Condition;
	information = DIA_Bartok_Angekommen_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Bartok_Angekommen_Condition()
{
	if((Bartok_Los == TRUE) && (Bartok_Ende == FALSE) && (Npc_GetDistToWP(self,"NW_FARM1_CITYWALL_FOREST_07") < 500))
	{
		return TRUE;
	};
};

func void DIA_Bartok_Angekommen_Info()
{
	AI_Output(self,other,"DIA_Bartok_Angekommen_04_00");	//Tak! Myslím, že se vrátim do města.
	AI_Output(self,other,"DIA_Bartok_Angekommen_04_01");	//Tady venku je to pro mě prostě příliš nebezpečný - dokonce i pro nás oba.

	if(Bartok_OrkStillThere == TRUE)
	{
		B_Bartok_ShitAnOrc();
		Bartok_OrkGesagt = TRUE;
	};
	AI_Output(self,other,"DIA_Bartok_Angekommen_04_03");	//Tak se měj!
	AI_Output(self,other,"DIA_Bartok_Angekommen_04_04");	//Můžeš ty kůže prodat Bosperovi.
	Bartok_Ende = TRUE;
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;

	if(MIS_CoragonFixBeer == LOG_Success)
	{
		Npc_ExchangeRoutine(self,"Coragon");
	}
	else
	{
		Npc_ExchangeRoutine(self,"Start");
	};
};

var int BartokCanGoHuntCamp;

instance DIA_Bartok_PERM(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 1;
	condition = DIA_Bartok_PERM_Condition;
	information = DIA_Bartok_PERM_Info;
	permanent = TRUE;
	description = "Všechno v pohodě?";
};

func int DIA_Bartok_PERM_Condition()
{
	if(Bartok_Los == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Bartok_PERM_Info()
{
	AI_Output(other,self,"DIA_Bartok_PERM_15_00");	//Všechno v pohodě?

	if(BartokBecameHunt == TRUE)
	{
		AI_Output(self,other,"DIA_Bartok_PERM_04_03");	//Jasně, jdeme ulovit pár bestií!
	}
	else if(Bartok_Ende == TRUE)
	{
		AI_Output(self,other,"DIA_Bartok_PERM_04_01");	//Jo, ale za brány města už mě nikdy nikdo nedostane - alespoň ne v dohldné době.

		if(Bartok_OrkGesagt == TRUE)
		{
			AI_Output(self,other,"DIA_Bartok_PERM_04_02");	//Pořád se mi klepou kolena z toho, že by nás mohl dostat nějaký skřet.
		};
		
		BartokCanGoHuntCamp = TRUE;
		AI_StopProcessInfos(self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;

		if(MIS_CoragonFixBeer == LOG_Success)
		{
			Npc_ExchangeRoutine(self,"Coragon");
		}
		else
		{
			Npc_ExchangeRoutine(self,"Start");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Bartok_PERM_04_03");	//Jasně, jdeme ulovit pár bestií!
	};
};

instance DIA_Bartok_HuntCamp(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 1;
	condition = DIA_Bartok_HuntCamp_Condition;
	information = DIA_Bartok_HuntCamp_Info;
	permanent = FALSE;
	description = "Chtěl by ses konečně stát pravým lovcem?";
};

func int DIA_Bartok_HuntCamp_Condition()
{
	if((MIS_NewHunters == LOG_Running) && (BartokCanGoHuntCamp == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Bartok_HuntCamp_Info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_Bartok_HuntCamp_01_00");	//Chtěl by ses konečně stát pravým lovcem?
	AI_Output(self,other,"DIA_Bartok_HuntCamp_01_01");	//A co nejsem?
	AI_Output(other,self,"DIA_Bartok_HuntCamp_01_02");	//Lovec, co se bojí vyjít z města?
	AI_Output(self,other,"DIA_Bartok_HuntCamp_01_03");	//Co? Já se nebojím! Jen... proč zbytečně riskovat?
	AI_Output(other,self,"DIA_Bartok_HuntCamp_01_04");	//Tak to dokaž.
	AI_Output(self,other,"DIA_Bartok_HuntCamp_01_05");	//A co bych měl udělat?
	AI_Output(other,self,"DIA_Bartok_HuntCamp_01_06");	//Nooo... co takhle se připojit k ostatním lovcům a ne jen vysedávat?
	AI_Output(other,self,"DIA_Bartok_HuntCamp_01_07");	//Rád lovíš?
	AI_Output(self,other,"DIA_Bartok_HuntCamp_01_08");	//Jasně, je to moje oblíbená činnost.
	AI_Output(other,self,"DIA_Bartok_HuntCamp_01_09");	//Tak o to víc by ses k nim měl připojit. Falka zrovna hledá nové lidi.
	AI_Output(self,other,"DIA_Bartok_HuntCamp_01_11");	//Och, já na ně úplně zapomněl.
	AI_Output(self,other,"DIA_Bartok_HuntCamp_01_12");	//Hmmm... alespoň nebudu muset lovit sám.
	AI_Output(self,other,"DIA_Bartok_HuntCamp_01_13");	//Takže říkáš, že potřebují nové lidi?
	AI_Output(other,self,"DIA_Bartok_HuntCamp_01_14");	//Jěsli mi nevěříš, choď se zeptat Falky sám.
	AI_Output(self,other,"DIA_Bartok_HuntCamp_01_15");	//Jěsli je to tak, možná bych měl tvou ponuku zvážit.
	AI_Output(other,self,"DIA_Bartok_HuntCamp_01_16");	//No ták... A pohni si, nebo si najdu někoho jiného.
	B_LogEntry(TOPIC_NewHunters,"Přsvědčil jsem Bartoka aby se mnou šel do tábora lovců.");
	BartokBecameHunt = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GoHuntCamp");
};