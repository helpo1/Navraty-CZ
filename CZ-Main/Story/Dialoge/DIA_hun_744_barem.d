
instance DIA_HUN_744_BAREM_EXIT(C_Info)
{
	npc = hun_744_barem;
	nr = 999;
	condition = dia_hun_744_barem_exit_condition;
	information = dia_hun_744_barem_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_hun_744_barem_exit_condition()
{
	return TRUE;
};

func void dia_hun_744_barem_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HUN_744_BAREM_WELCOME(C_Info)
{
	npc = hun_744_barem;
	nr = 1;
	condition = dia_hun_744_barem_welcome_condition;
	information = dia_hun_744_barem_welcome_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_hun_744_barem_welcome_condition()
{
	if((HEROISHUNTER == FALSE) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void dia_hun_744_barem_welcome_info()
{
	var C_Item itm;
	itm = Npc_GetEquippedArmor(other);
	if(Hlp_IsItem(itm,ITAR_Leather_L) == TRUE)
	{
		AI_Output(self,other,"DIA_HUN_744_Barem_Welcome_01_01");	//Hej, chlape, vypadáš jako lovec...
		AI_Output(self,other,"DIA_HUN_744_Barem_Welcome_01_04");	//Tohle je tábor lovců.
		AI_Output(self,other,"DIA_HUN_744_Barem_Welcome_01_06");	//Dám ti radu - promluv si s Falkem, von je tu něco jako náš... ten... jo... jo, vůdce!
	}
	else
	{
		AI_Output(self,other,"DIA_HUN_744_Barem_Welcome_01_09");	//Stůj! Zastav se na chvilku.
		AI_Output(self,other,"DIA_HUN_744_Barem_Welcome_01_13");	//Tohle je tábor lovců. Chápeš?
		AI_StopProcessInfos(self);
	};
};


instance DIA_HUN_744_BAREM_WELCOMEDONE(C_Info)
{
	npc = hun_744_barem;
	nr = 1;
	condition = dia_hun_744_barem_welcomedone_condition;
	information = dia_hun_744_barem_welcomedone_info;
	permanent = FALSE;
	description = "Nyní jsem s vámi.";
};


func int dia_hun_744_barem_welcomedone_condition()
{
	if(HEROISHUNTER == TRUE)
	{
		return TRUE;
	};
};

func void dia_hun_744_barem_welcomedone_info()
{
	AI_Output(other,self,"DIA_HUN_744_Barem_WelcomeDone_01_00");	//Nyní jsem s vámi.
	AI_Output(self,other,"DIA_HUN_744_Barem_WelcomeDone_01_01");	//Bezva, chlape! Věděl jsem, že v táboře se ti zalíbí.
};


instance DIA_HUN_744_BAREM_HELLO(C_Info)
{
	npc = hun_744_barem;
	nr = 4;
	condition = dia_hun_744_barem_hello_condition;
	information = dia_hun_744_barem_hello_info;
	permanent = TRUE;
	description = "Co se děje?";
};


func int dia_hun_744_barem_hello_condition()
{
	if(HEROISHUNTER == TRUE)
	{
		return TRUE;
	};
};

func void dia_hun_744_barem_hello_info()
{
	AI_Output(other,self,"DIA_HUN_744_Barem_Hello_01_00");	//Co se děje?
	if((Kapitel >= 2) && (MIS_INSVEPR == FALSE))
	{
		AI_Output(self,other,"DIA_HUN_744_Barem_Hello_01_01");	//Vše v klidu, ale slyšels ty novinky?
		AI_Output(self,other,"DIA_HUN_744_Barem_Hello_01_03");	//Nedaleko jedněch kamennejch šutrů se vobjevil jeden velkej divočák, viděl jsi už něco takovýho?
		AI_Output(other,self,"DIA_HUN_744_Barem_Hello_01_04");	//Ne, ani ne.
		AI_Output(self,other,"DIA_HUN_744_Barem_Hello_01_06");	//A to je pro tebe lepší chlape. Protože tenhle divočák je velmi nebezpečné stvoření!
		AI_Output(self,other,"DIA_HUN_744_Barem_Hello_01_07");	//Bez problému tě rozžvejká na kousky.
		MIS_INSVEPR = LOG_Running;
		Log_CreateTopic(TOPIC_INSVEPR,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_INSVEPR,LOG_Running);
		B_LogEntry(TOPIC_INSVEPR,"Barem říkal, že u kamenného kruhu v severních lesích se objevil extrémně velký divočák. Říkal, že je také extrémě nebezpečný a měl bych se mu vyhnout. Copak by asi řekl, kdybych ho složil?");
		Wld_InsertNpc(keiler_vepr,"FP_ROAM_NW_HUNTVEPR_01");
	}
	else if(Kapitel == 3)
	{
		AI_Output(self,other,"DIA_HUN_744_Barem_Hello_01_11");	//Z těch chlapů v černym mě zebe kůže.
		AI_Output(self,other,"DIA_HUN_744_Barem_Hello_01_12");	//Chodí tu sem a tam, nic příjemného!
	}
	else if(Kapitel == 7)
	{
		AI_Output(self,other,"DIA_HUN_744_Barem_Hello_01_13");	//Asi jsi viděl ten kruh skřetů!
		AI_Output(self,other,"DIA_HUN_744_Barem_Hello_01_14");	//A kolik jich je!
	}
	else
	{
		AI_Output(self,other,"DIA_HUN_744_Barem_Hello_01_15");	//Vše jako obvykle!
		AI_Output(self,other,"DIA_HUN_744_Barem_Hello_01_16");	//A to je to správný pro unaveného lovce, kterej se vrací z lovu.
	};
};


instance DIA_HUN_744_BAREM_INSVEPR(C_Info)
{
	npc = hun_744_barem;
	nr = 1;
	condition = dia_hun_744_barem_insvepr_condition;
	information = dia_hun_744_barem_insvepr_info;
	permanent = FALSE;
	description = "Zabil jsem toho velkého divočáka!";
};


func int dia_hun_744_barem_insvepr_condition()
{
	if((MIS_INSVEPR == LOG_Running) && Npc_IsDead(keiler_vepr) && (Npc_HasItems(other,itat_veprfur) >= 1))
	{
		return TRUE;
	};
};

func void dia_hun_744_barem_insvepr_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_HUN_744_Barem_InsVepr_01_00");	//Zabil jsem toho velkého divočáka!
	AI_Output(self,other,"DIA_HUN_744_Barem_InsVepr_01_01");	//Vážně? (velmi udiveně) Ale jak jsi to udělal?
	AI_Output(other,self,"DIA_HUN_744_Barem_InsVepr_01_02");	//To ti asi nevysvětlím, ale jestli mi nevěříš, tady je kůže.
	B_GiveInvItems(other,self,itat_veprfur,1);
	Npc_RemoveInvItems(self,itat_veprfur,1);
	AI_Output(self,other,"DIA_HUN_744_Barem_InsVepr_01_03");	//Mm... Pak není pochyb, že je po něm!
	AI_Output(self,other,"DIA_HUN_744_Barem_InsVepr_01_04");	//Hmm... Jsi samé překvapení!
	AI_Output(self,other,"DIA_HUN_744_Barem_InsVepr_01_05");	//Tohle si zapamatuju!
	AI_Output(self,other,"DIA_HUN_744_Barem_InsVepr_01_06");	//A aby sis to pamatoval ty, vem si tenhle prsten.
	B_GiveInvItems(self,other,itri_vepr,1);
	MIS_INSVEPR = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_INSVEPR,LOG_SUCCESS);
	B_LogEntry(TOPIC_INSVEPR,"Můj příběh Barema uchvátil. Nevěřil, že bych to mohl dokázat. Na památku mi dal jeho prsten.");
};


instance DIA_HUN_744_BAREM_RESPECT(C_Info)
{
	npc = hun_744_barem;
	nr = 4;
	condition = dia_hun_744_barem_respect_condition;
	information = dia_hun_744_barem_respect_info;
	permanent = FALSE;
	description = "Potřebuji tvůj hlas.";
};


func int dia_hun_744_barem_respect_condition()
{
	if((CANHUNTERCHALLANGE == TRUE) && (BAREM_RESPECT == FALSE) && (MIS_HUNTERCHALLANGE == FALSE))
	{
		return TRUE;
	};
};

func void dia_hun_744_barem_respect_info()
{
	AI_Output(other,self,"DIA_HUN_744_Barem_Respect_01_00");	//Potřebuji tvůj hlas.
	AI_Output(self,other,"DIA_HUN_744_Barem_Respect_01_01");	//A to proč?
	AI_Output(other,self,"DIA_HUN_744_Barem_Respect_01_02");	//Chci vyzvat Falka v soutěži o nejlepšího lovce a abych tak mohl učinit, potřebuji hlasy lovců.
	if(MIS_INSVEPR == LOG_SUCCESS)
	{
		B_GivePlayerXP(100);
		AI_Output(self,other,"DIA_HUN_744_Barem_Respect_01_03");	//Nemám s tím problém, chlape!
		AI_Output(self,other,"DIA_HUN_744_Barem_Respect_01_04");	//Chlap, kterej složil toho divočáka, si to zaslouží.
		AI_Output(self,other,"DIA_HUN_744_Barem_Respect_01_05");	//Můžeš všem říci, že souhlasím, abys ho vyzval v tý soutěži.
		B_LogEntry(TOPIC_HUNTERSWORK,"Barem není proti mému nápadu vyzvat Falka.");
		BAREM_RESPECT = TRUE;
		HUNTCHALLENGECOUNT = HUNTCHALLENGECOUNT + 1;
	}
	else
	{
		AI_Output(self,other,"DIA_HUN_744_Barem_Respect_01_07");	//Chlape, já nevím vo ničem, proč bys měl mít tohle právo!
		AI_Output(self,other,"DIA_HUN_744_Barem_Respect_01_09");	//Takže udělej něco co by zvedlo mý mínění vo tobě a pak se zkus vrátit.
	};
};


instance DIA_HUN_744_BAREM_RESPECTDONE(C_Info)
{
	npc = hun_744_barem;
	nr = 4;
	condition = dia_hun_744_barem_respectdone_condition;
	information = dia_hun_744_barem_respectdone_info;
	permanent = TRUE;
	description = "Dáš mi svůj hlas?";
};


func int dia_hun_744_barem_respectdone_condition()
{
	if(Npc_KnowsInfo(other,dia_hun_744_barem_respect) && (CANHUNTERCHALLANGE == TRUE) && (BAREM_RESPECT == FALSE) && (MIS_HUNTERCHALLANGE == FALSE))
	{
		return TRUE;
	};
};

func void dia_hun_744_barem_respectdone_info()
{
	AI_Output(other,self,"DIA_HUN_744_Barem_RespectDone_01_00");	//Dáš mi svůj hlas?
	if(MIS_INSVEPR == LOG_SUCCESS)
	{
		B_GivePlayerXP(100);
		AI_Output(self,other,"DIA_HUN_744_Barem_RespectDone_01_01");	//Bez problému, chlape!
		AI_Output(self,other,"DIA_HUN_744_Barem_RespectDone_01_02");	//Chlap, kterej složil toho divočáka, si to zaslouží.
		AI_Output(self,other,"DIA_HUN_744_Barem_RespectDone_01_03");	//Můžeš všem říci, že souhlasím, abys ho vyzval v tý soutěži.
		B_LogEntry(TOPIC_HUNTERSWORK,"Barem není proti mému nápadu vyzvat Falka.");
		BAREM_RESPECT = TRUE;
		HUNTCHALLENGECOUNT = HUNTCHALLENGECOUNT + 1;
	}
	else
	{
		AI_Output(self,other,"DIA_HUN_744_Barem_RespectDone_01_05");	//Už jsi snad udělal něco speciálního?!
		AI_Output(other,self,"DIA_HUN_744_Barem_RespectDone_01_06");	//Zatím ne.
		AI_Output(self,other,"DIA_HUN_744_Barem_RespectDone_01_07");	//Pak znáš mou odpověď.
	};
};


instance DIA_HUN_744_BAREM_LURKERCLAW(C_Info)
{
	npc = hun_744_barem;
	nr = 1;
	condition = dia_hun_744_barem_lurkerclaw_condition;
	information = dia_hun_744_barem_lurkerclaw_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_hun_744_barem_lurkerclaw_condition()
{
	if((Kapitel >= 1) && (HEROISHUNTER == TRUE))
	{
		return TRUE;
	};
};

func void dia_hun_744_barem_lurkerclaw_info()
{
	AI_Output(self,other,"DIA_HUN_744_Barem_LurkerClaw_01_00");	//Hej, příteli! Počkej chvíli!
	AI_Output(self,other,"DIA_HUN_744_Barem_LurkerClaw_01_01");	//Mám pro tebe jistou nabídku...
	AI_Output(self,other,"DIA_HUN_744_Barem_LurkerClaw_01_03");	//Jeden obchodník mi dal zakázku na pět číhavčích drápů.
	AI_Output(self,other,"DIA_HUN_744_Barem_LurkerClaw_01_04");	//Já teď absolutně nemám na něco takovýho čas!
	AI_Output(other,self,"DIA_HUN_744_Barem_LurkerClaw_01_05");	//Takže chceš, abych přinesl ty drápy...
	AI_Output(other,self,"DIA_HUN_744_Barem_LurkerClaw_01_07");	//A jaká bude odměna?!
	AI_Output(self,other,"DIA_HUN_744_Barem_LurkerClaw_01_08");	//No, boužel ti nemůžu zaplatit, bo teď ňák potřebuju zlato!
	AI_Output(self,other,"DIA_HUN_744_Barem_LurkerClaw_01_09");	//Ale moh' bych ti za to dát nějaký pláty z důlního červa.
	AI_Output(self,other,"DIA_HUN_744_Barem_LurkerClaw_01_10");	//Slyšel jsem, že jeden žoldák na Onarový farmě z toho umí udělat zbroj.
	AI_Output(other,self,"DIA_HUN_744_Barem_LurkerClaw_01_13");	//Uvidím, co budu moci udělat.
	AI_Output(self,other,"DIA_HUN_744_Barem_LurkerClaw_01_14");	//Bezva, tož víš, kde mě hledat, že.
	MIS_LURKERCLAW = LOG_Running;
	Log_CreateTopic(TOPIC_LURKERCLAW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LURKERCLAW,LOG_Running);
	B_LogEntry(TOPIC_LURKERCLAW,"Lovec Barem mi nabízí 3 krunýře z důlního červa za 5 číhavčích drápů.");
	AI_StopProcessInfos(self);
};


instance DIA_HUN_744_BAREM_LURKERCLAWDONE(C_Info)
{
	npc = hun_744_barem;
	nr = 1;
	condition = dia_hun_744_barem_lurkerclawdone_condition;
	information = dia_hun_744_barem_lurkerclawdone_info;
	permanent = FALSE;
	description = "Mám ty drápy.";
};


func int dia_hun_744_barem_lurkerclawdone_condition()
{
	if((MIS_LURKERCLAW == LOG_Running) && (Npc_HasItems(other,ItAt_LurkerClaw) >= 5))
	{
		return TRUE;
	};
};

func void dia_hun_744_barem_lurkerclawdone_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_HUN_744_Barem_LurkerClawDone_01_00");	//Mám ty drápy.
	B_GiveInvItems(other,self,ItAt_LurkerClaw,5);
	AI_Output(self,other,"DIA_HUN_744_Barem_LurkerClawDone_01_03");	//Bezva práce, chlape.
	AI_Output(self,other,"DIA_HUN_744_Barem_LurkerClawDone_01_04");	//Tady je ten krunýř - jak jsme se domluvili.
	B_GiveInvItems(self,other,ItAt_CrawlerPlate,3);
	AI_Output(self,other,"DIA_HUN_744_Barem_LurkerClawDone_01_05");	//A jsem si vzpomněl, jak že se jmenuje ten žoldák, co z nich dělá zbroje.
	AI_Output(self,other,"DIA_HUN_744_Barem_LurkerClawDone_01_07");	//Jeho jméno je Wolf. Promluv s ním, určitě ti pomůže.
	MIS_LURKERCLAW = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_LURKERCLAW,LOG_SUCCESS);
	B_LogEntry(TOPIC_LURKERCLAW,"Přinesl jsem Baremovi drápy a dal mi za ně ty krunýře. Taky se zmínil, že žoldák Wolf z nich dělá zbroj.");
	Wolf_ProduceCrawlerArmor = TRUE;
	HOKURN_ARMOR = TRUE;
};


instance DIA_HUN_744_BAREM_CRAWLERARMOR(C_Info)
{
	npc = hun_744_barem;
	nr = 1;
	condition = dia_hun_744_barem_crawlerarmor_condition;
	information = dia_hun_744_barem_crawlerarmor_info;
	permanent = FALSE;
	description = "Proč si nenecháš udělat takovou zbroj taky?";
};


func int dia_hun_744_barem_crawlerarmor_condition()
{
	if(MIS_LURKERCLAW == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_hun_744_barem_crawlerarmor_info()
{
	AI_Output(other,self,"DIA_HUN_744_Barem_CrawlerArmor_01_00");	//Proč si nenecháš udělat takovou zbroj taky?
	AI_Output(self,other,"DIA_HUN_744_Barem_CrawlerArmor_01_01");	//Nemám dost těch krunýřů.
	AI_Output(self,other,"DIA_HUN_744_Barem_CrawlerArmor_01_03");	//A nemůžu dneska opustit tábor abych je splašil.
	AI_Output(other,self,"DIA_HUN_744_Barem_CrawlerArmor_01_06");	//Můžu ti nějak pomoci.
	AI_Output(self,other,"DIA_HUN_744_Barem_CrawlerArmor_01_07");	//Chlape, to by bylo úžasný!
	AI_Output(self,other,"DIA_HUN_744_Barem_CrawlerArmor_01_08");	//Jestli se ti povede mi splašit tu zbroj, budu tvým dlužníkem!
	AI_Output(self,other,"DIA_HUN_744_Barem_CrawlerArmor_01_10");	//Tady máš všechny pláty, který mi ještě zbyly.
	B_GiveInvItems(self,other,ItAt_CrawlerPlate,4);
	AI_Output(self,other,"DIA_HUN_744_Barem_CrawlerArmor_01_13");	//Slyšel jsem ale, že jestli je zbroj z čerstvých plátů, je lepší!
	AI_Output(self,other,"DIA_HUN_744_Barem_CrawlerArmor_01_14");	//Nevím, jestli je to pravda, nebo není, to jen abys věděl.
	MIS_BAREMCRAWLERARMOR = LOG_Running;
	Log_CreateTopic(TOPIC_BAREMCRAWLERARMOR,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BAREMCRAWLERARMOR,LOG_Running);
	B_LogEntry(TOPIC_BAREMCRAWLERARMOR,"Rozhodl jsem se pro Barema získat zbroj z krunýře důlního červa. Říkal, že z čerstvých plátů je lepší, ale neví, jestli to nejsou povídačky! Měl bych zajít za Wolfem, ten by mohl vědět o tom, jak ty krunýře dostat z červíků.");
};


instance DIA_HUN_744_BAREM_CRAWLERARMORDONE(C_Info)
{
	npc = hun_744_barem;
	nr = 1;
	condition = dia_hun_744_barem_crawlerarmordone_condition;
	information = dia_hun_744_barem_crawlerarmordone_info;
	permanent = FALSE;
	description = "Mám pro tebe zbroj z krunýřů důlního červa.";
};

func int dia_hun_744_barem_crawlerarmordone_condition()
{
	if((MIS_BAREMCRAWLERARMOR == LOG_Running) && (Npc_HasItems(other,ITAR_DJG_Crawler) >= 1))
	{
		return TRUE;
	};
};

func void dia_hun_744_barem_crawlerarmordone_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_HUN_744_Barem_CrawlerArmorDone_01_00");	//Mám pro tebe zbroj z krunýřů důlního červa.
	AI_Output(self,other,"DIA_HUN_744_Barem_CrawlerArmorDone_01_01");	//Opravdu?... Ukaž mi ho.
	B_GiveInvItems(other,self,ITAR_DJG_Crawler,1);
	AI_Output(self,other,"DIA_HUN_744_Barem_CrawlerArmorDone_01_03");	//Ohó! To je vynikajcí zbroj, příteli! Díky ti!
	AI_EquipBestArmor(self);
	AI_Output(self,other,"DIA_HUN_744_Barem_CrawlerArmorDone_01_04");	//Tady si vem tuhle teplou ovčí kůži.
	B_GiveInvItems(self,other,itmi_sleepsack,1);
	AI_Output(other,self,"DIA_HUN_744_Barem_CrawlerArmorDone_01_05");	//A co s ní můžu dělat?!
	AI_Output(self,other,"DIA_HUN_744_Barem_CrawlerArmorDone_01_06");	//Vím co si myslíš, ale není to to, co se to zdá být.
	AI_Output(self,other,"DIA_HUN_744_Barem_CrawlerArmorDone_01_07");	//Pro lovce je to nenahraditelná věc!
	AI_Output(self,other,"DIA_HUN_744_Barem_CrawlerArmorDone_01_09");	//Asi si říkáš na co ti bude.
	AI_Output(self,other,"DIA_HUN_744_Barem_CrawlerArmorDone_01_10");	//Je totiž sešitá do tvaru batohu, ve kterým se můžeš kdekoli a kdykoli vyspat uprostřed divočiny.
	AI_Output(self,other,"DIA_HUN_744_Barem_CrawlerArmorDone_01_11");	//Věř mi - udrží tě celou noc v teple a je snad stejně pohodlná jak postel! Je z těch nejhuňatějších a největších ovcí na ostrově!
	AI_Output(self,other,"DIA_HUN_744_Barem_CrawlerArmorDone_01_13");	//To vážně nezní špatně! Jen škoda, že takových věcí není více...
	MIS_BAREMCRAWLERARMOR = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_BAREMCRAWLERARMOR,LOG_SUCCESS);
	B_LogEntry(TOPIC_BAREMCRAWLERARMOR,"Přinesl jsem Baremovi zbroj z důlního červa. Byl tak rád, že mi dal jednu speciálně upravenou ovčí kůži, se kterou můžu spát kdekoli v divočině! Stačí položit na zem a uvelebit se.");
};

instance DIA_HUN_744_BAREM_PICKPOCKET(C_Info)
{
	npc = hun_744_barem;
	nr = 900;
	condition = dia_hun_744_barem_pickpocket_condition;
	information = dia_hun_744_barem_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int dia_hun_744_barem_pickpocket_condition()
{
	return C_Beklauen(70,120);
};

func void dia_hun_744_barem_pickpocket_info()
{
	Info_ClearChoices(dia_hun_744_barem_pickpocket);
	Info_AddChoice(dia_hun_744_barem_pickpocket,Dialog_Back,dia_hun_744_barem_pickpocket_back);
	Info_AddChoice(dia_hun_744_barem_pickpocket,DIALOG_PICKPOCKET,dia_hun_744_barem_pickpocket_doit);
};

func void dia_hun_744_barem_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_hun_744_barem_pickpocket);
};

func void dia_hun_744_barem_pickpocket_back()
{
	Info_ClearChoices(dia_hun_744_barem_pickpocket);
};


instance DIA_HUN_744_BAREM_F(C_Info)
{
	npc = hun_744_barem;
	nr = 2;
	condition = dia_hun_744_barem_f_condition;
	information = dia_hun_744_barem_f_info;
	permanent = FALSE;
	description = "Můžeš mě něco naučit?";
};


func int dia_hun_744_barem_f_condition()
{
	if(HEROISHUNTER == TRUE)
	{
		return TRUE;
	};
};

func void dia_hun_744_barem_f_info()
{
	AI_Output(other,self,"DIA_HUN_744_Barem_F_01_00");	//Můžeš mě něco naučit?
	AI_Output(self,other,"DIA_HUN_744_Barem_F_01_01");	//Samozřejmě, ale můj čas něco stojí!
	AI_Output(self,other,"DIA_HUN_744_Barem_F_01_02");	//Jestli se chceš učit, musíš si zaplatit.
	Log_CreateTopic(TOPIC_HUNTERTEACHERS,LOG_NOTE);
	B_LogEntry(TOPIC_HUNTERTEACHERS,"Barem mě může naučit používat jednoruční zbraně. Najdu ho v táboře lovců.");
};


instance DIA_HUN_744_BAREM_1H(C_Info)
{
	npc = hun_744_barem;
	nr = 3;
	condition = dia_hun_744_barem_1h_condition;
	information = dia_hun_744_barem_1h_info;
	permanent = TRUE;
	description = "Chci se zlepšit s jednoručními zbraněmi.";
};


func int dia_hun_744_barem_1h_condition()
{
	if(Npc_KnowsInfo(other,dia_hun_744_barem_f))
	{
		return TRUE;
	};
};

func void dia_hun_744_barem_1h_info()
{
	AI_Output(other,self,"DIA_HUN_744_Barem_1H_01_00");	//Chci se zlepšit s jednoručními zbraněmi.
	Info_ClearChoices(dia_hun_744_barem_1h);
	Info_AddChoice(dia_hun_744_barem_1h,Dialog_Back,dia_hun_744_barem_1h_back);
	Info_AddChoice(dia_hun_744_barem_1h,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_hun_744_barem_1h_1);
	Info_AddChoice(dia_hun_744_barem_1h,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_hun_744_barem_1h_5);
};

func void dia_hun_744_barem_1h_back()
{
	Info_ClearChoices(dia_hun_744_barem_1h);
};

func void dia_hun_744_barem_1h_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,60))
	{
		if(BAREMTEACHFT == FALSE)
		{
			AI_Output(self,other,"DIA_HUN_744_Barem_1H_1_01_01");	//Nauč se lépe držet zbraň.
			AI_Output(self,other,"DIA_HUN_744_Barem_1H_1_01_02");	//Začátečníci ji drží oběma rukama a tuto chybu by měli co nejdříve odstranit.
			AI_Output(self,other,"DIA_HUN_744_Barem_1H_1_01_03");	//Vezmi ji do jedné ruky. Nepůjde to hned, ale časem určitě.
			AI_Output(self,other,"DIA_HUN_744_Barem_1H_1_01_04");	//Sžije se s tvojí rukou a pomůže ti upravit směr útoku.
			AI_Output(self,other,"DIA_HUN_744_Barem_1H_1_01_05");	//Jestli uděláš co jsem ti řekl, budeš s ní zacházet rychleji.
			AI_Output(self,other,"DIA_HUN_744_Barem_1H_1_01_06");	//A ještě něco: Některé útoky se ti povedou lépe než jiné, ale až jako mistr budeš provádět pouze dokonalé útoky.
			AI_Output(self,other,"DIA_HUN_744_Barem_1H_1_01_07");	//Ale to bude ještě hodně tréninku.
			BAREMTEACHFT = TRUE;
		};
		if((BAREMTEACHST == FALSE) && (other.HitChance[NPC_TALENT_1H] >= 60))
		{
			AI_Output(other,self,"DIA_HUN_744_Barem_1H_1_01_08");	//Řekni mi něco o jednoručních zbraních.
			AI_Output(self,other,"DIA_HUN_744_Barem_1H_1_01_09");	//Drž čepel trochu níž, budeš mít větší rozpřah a tak i sílu.
			AI_Output(self,other,"DIA_HUN_744_Barem_1H_1_01_10");	//Řezné útoky, jasné? Bude se ti mnohem lépe pohybovat.
			AI_Output(self,other,"DIA_HUN_744_Barem_1H_1_01_11");	//Ve vlně z leva do prava budeš mít nejsilnější rozmach...
			AI_Output(self,other,"DIA_HUN_744_Barem_1H_1_01_12");	//... a pak se můžeš elegantně vrátit do krytu.
			BAREMTEACHST = TRUE;
		};
		Info_ClearChoices(dia_hun_744_barem_1h);
		Info_AddChoice(dia_hun_744_barem_1h,Dialog_Back,dia_hun_744_barem_1h_back);
		Info_AddChoice(dia_hun_744_barem_1h,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_hun_744_barem_1h_1);
		Info_AddChoice(dia_hun_744_barem_1h,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_hun_744_barem_1h_5);
	};
};

func void dia_hun_744_barem_1h_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,60))
	{
		if(BAREMTEACHFT == FALSE)
		{
			AI_Output(self,other,"DIA_HUN_744_Barem_1H_5_01_01");	//Nauč se lépe držet zbraň.
			AI_Output(self,other,"DIA_HUN_744_Barem_1H_5_01_02");	//Začátečníci ji drží oběma rukama a tuto chybu by měli co nejdříve odstranit.
			AI_Output(self,other,"DIA_HUN_744_Barem_1H_5_01_03");	//Vezmi ji do jedné ruky. Nepůjde to hned, ale časem určitě.
			AI_Output(self,other,"DIA_HUN_744_Barem_1H_5_01_04");	//Sžije se s tvojí rukou a pomůže ti upravit směr útoku.
			AI_Output(self,other,"DIA_HUN_744_Barem_1H_5_01_05");	//Jestli uděláš co jsem ti řekl, budeš s ní zacházet rychleji.
			AI_Output(self,other,"DIA_HUN_744_Barem_1H_5_01_06");	//A ještě něco: Některé útoky se ti povedou lépe než jiné, ale až jako mistr budeš provádět pouze dokonalé útoky.
			AI_Output(self,other,"DIA_HUN_744_Barem_1H_5_01_07");	//Ale to bude ještě hodně tréninku...
			BAREMTEACHFT = TRUE;
		};
		if((BAREMTEACHST == FALSE) && (other.HitChance[NPC_TALENT_1H] >= 60))
		{
			AI_Output(other,self,"DIA_HUN_744_Barem_1H_5_01_08");	//Řekni mi něco o jednoručních zbraních.
			AI_Output(self,other,"DIA_HUN_744_Barem_1H_5_01_09");	//Drž čepel trochu níž, budeš mít větší rozpřah a tak i sílu.
			AI_Output(self,other,"DIA_HUN_744_Barem_1H_5_01_10");	//Řezné útoky, jasné? Bude se ti mnohem lépe pohybovat.
			AI_Output(self,other,"DIA_HUN_744_Barem_1H_5_01_11");	//Ve vlně z leva do prava budeš mít nejsilnější rozmach...
			AI_Output(self,other,"DIA_HUN_744_Barem_1H_5_01_12");	//... a pak se můžeš elegantně vrátit do krytu.
			BAREMTEACHST = TRUE;
		};
		Info_ClearChoices(dia_hun_744_barem_1h);
		Info_AddChoice(dia_hun_744_barem_1h,Dialog_Back,dia_hun_744_barem_1h_back);
		Info_AddChoice(dia_hun_744_barem_1h,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_hun_744_barem_1h_1);
		Info_AddChoice(dia_hun_744_barem_1h,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_hun_744_barem_1h_5);
	};
};

