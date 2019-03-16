
instance DIA_PAL_91680_NATAN_EXIT(C_Info)
{
	npc = pal_91680_natan;
	nr = 999;
	condition = dia_pal_91680_natan_exit_condition;
	information = dia_pal_91680_natan_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_91680_natan_exit_condition()
{
	return TRUE;
};

func void dia_pal_91680_natan_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_91680_NATAN_PERM(C_Info)
{
	npc = pal_91680_natan;
	nr = 1;
	condition = dia_pal_91680_natan_perm_condition;
	information = dia_pal_91680_natan_perm_info;
	permanent = FALSE;
	description = "Co si o tom myslíš?";
};


func int dia_pal_91680_natan_perm_condition()
{
	if(HAGENOTHERSAGREED == FALSE)
	{
		return TRUE;
	};
};

func void dia_pal_91680_natan_perm_info()
{
	AI_Output(other,self,"DIA_Pal_91680_Natan_Perm_01_00");	//Co si o tom myslíš?
	AI_Output(self,other,"DIA_Pal_91680_Natan_Perm_01_01");	//Veřím, že bychom měli jít do pevnosti, protože zůstat zde je příliš nebezpečné!
	AI_Output(self,other,"DIA_Pal_91680_Natan_Perm_01_02");	//Kromě toho je nutné donést lordu Hagenovi zprávu o situaci v Hornickém údolí.
	AI_Output(self,other,"DIA_Pal_91680_Natan_Perm_01_03");	//Měl by vědět co se tam děje!
	AI_Output(other,self,"DIA_Pal_91680_Natan_Perm_01_04");	//Dobrá, nyní splň rozkaz vojáku.
};


instance DIA_PAL_91680_NATAN_UDAR(C_Info)
{
	npc = pal_91680_natan;
	nr = 1;
	condition = dia_pal_91680_natan_udar_condition;
	information = dia_pal_91680_natan_udar_info;
	permanent = FALSE;
	description = "Paladin Udar je opět s námi!";
};


func int dia_pal_91680_natan_udar_condition()
{
	if((MIS_NATANDOLG == LOG_Running) && !Npc_IsDead(pal_2680_udar))
	{
		return TRUE;
	};
};

func void dia_pal_91680_natan_udar_info()
{
	AI_Output(other,self,"DIA_Pal_91680_Natan_Udar_01_00");	//Paladin Udar je opět s námi!
	AI_Output(self,other,"DIA_Pal_91680_Natan_Udar_01_01");	//Naštěstí pro nás, ano... A přirozeně jsem šťastný, že se vrátil!
	AI_Output(self,other,"DIA_Pal_91680_Natan_Udar_01_02");	//Pokud by padl, jen velmi obtížně bych tu skutečnost přijal.
	AI_Output(other,self,"DIA_Pal_91680_Natan_Udar_01_03");	//Pak věřím, že tvůj slib je splněn
	AI_Output(self,other,"DIA_Pal_91680_Natan_Udar_01_04");	//Obávám se, že ne úplně... (vážně) Ve skutečnosti jsem JÁ nehnul ani prstem!
	AI_Output(other,self,"DIA_Pal_91680_Natan_Udar_01_05");	//Ale bojoval jsi se skřety v údolí, získal jsi čas, abych ho zachránil a bezpečně jsi ho dopravil pryč. Copak to nestačí?!
	AI_Output(self,other,"DIA_Pal_91680_Natan_Udar_01_06");	//Jistě... trochu... (smutný) Rozuměj, udělal jsem vše pro boj s těmi nestvůrami.
	AI_Output(self,other,"DIA_Pal_91680_Natan_Udar_01_07");	//Ale abych řekl pravdu, je to jen součást mojich velkých povinností paladina...
	AI_Output(self,other,"DIA_Pal_91680_Natan_Udar_01_08");	//A Udar mi zachránil život! A já bych mu to měl vrátit stejně a ne v menší míře.
	AI_Output(self,other,"DIA_Pal_91680_Natan_Udar_01_09");	//Takže mě nemusíš uklidňovat, protože já jistě najdu způsob, jak svůj dluh zplatit.
	AI_Output(other,self,"DIA_Pal_91680_Natan_Udar_01_10");	//M-jo... Samozřejmě.
};


instance DIA_PAL_91680_NATAN_ZASADA(C_Info)
{
	npc = pal_91680_natan;
	nr = 900;
	condition = dia_pal_91680_natan_zasada_condition;
	information = dia_pal_91680_natan_zasada_info;
	permanent = FALSE;
	description = "... (KONEC)";
};


func int dia_pal_91680_natan_zasada_condition()
{
	if((MIS_NATANDOLG == LOG_Running) && (UDARORCSTRAP == TRUE) && (UDARORCSTRAPDONE == FALSE) && !Npc_IsDead(pal_2680_udar))
	{
		return TRUE;
	};
};

func void dia_pal_91680_natan_zasada_info()
{
	PlayVideo("RET2_BlackScreen.bik");
	UDARORCSTRAPDONE = TRUE;
	AI_Teleport(pal_2680_udar,"NW_UDAR_ZASADA");
	Wld_InsertNpc(orkelite_udar,"FP_ROAM_ZASADAORCS_01");
	Wld_InsertNpc(orcwarrior_udar_01,"FP_ROAM_ZASADAORCS_02");
	Wld_InsertNpc(orcwarrior_udar_02,"FP_ROAM_ZASADAORCS_03");
	Wld_InsertNpc(orcwarrior_udar_03,"FP_ROAM_ZASADAORCS_04");
	Wld_InsertNpc(orcwarrior_udar_04,"FP_ROAM_ZASADAORCS_05");
	Wld_InsertNpc(orcwarrior_udar_05,"FP_ROAM_ZASADAORCS_06");
	AI_StopProcessInfos(self);
};


instance DIA_PAL_91680_NATAN_WHEREUDAR(C_Info)
{
	npc = pal_91680_natan;
	nr = 1;
	condition = dia_pal_91680_natan_whereudar_condition;
	information = dia_pal_91680_natan_whereudar_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_pal_91680_natan_whereudar_condition()
{
	if((MIS_NATANDOLG == LOG_Running) && !Npc_IsDead(pal_2680_udar) && (UDARORCSTRAPDONE == TRUE))
	{
		return TRUE;
	};
};

func void dia_pal_91680_natan_whereudar_info()
{
	AI_Output(self,other,"DIA_Pal_91680_Natan_WhereUdar_01_00");	//Počkej chvíli!... Když jsme se tu vítali, nevšiml jsem si Udara.
	AI_Output(self,other,"DIA_Pal_91680_Natan_WhereUdar_01_01");	//Nevíš mimochodem, kde je?!
	AI_Output(other,self,"DIA_Pal_91680_Natan_WhereUdar_01_02");	//Šel ulovit pár skřetů.
	AI_Output(self,other,"DIA_Pal_91680_Natan_WhereUdar_01_03");	//Na skřety sám?!... (udiveně) Ale to může být velmi nebezpečné!
	AI_Output(self,other,"DIA_Pal_91680_Natan_WhereUdar_01_04");	//Ale věřím, že je potřeba zabít pár těch hnusnejch stvoření.
	AI_Output(self,other,"DIA_Pal_91680_Natan_WhereUdar_01_05");	//Proklatě... (na co jsem myslel) Může zmeškat ceremoniál.
	AI_Output(self,other,"DIA_Pal_91680_Natan_WhereUdar_01_06");	//Měl bych ho najít co nejdříve... Kam přesně šel?!
	AI_Output(other,self,"DIA_Pal_91680_Natan_WhereUdar_01_07");	//Věřím, že někde kolem hostince 'U Mrtvé harpyje', jak řekl, je tam dobré místo pro přepadení!
	AI_Output(self,other,"DIA_Pal_91680_Natan_WhereUdar_01_08");	//Můžeš mě tam dovést?!
	AI_Output(other,self,"DIA_Pal_91680_Natan_WhereUdar_01_09");	//Jasně! Pojď za mnou.
	AI_Output(self,other,"DIA_Pal_91680_Natan_WhereUdar_01_10");	//Veď mě.
	B_LogEntry(TOPIC_NATANDOLG,"Nathan byl překvapen, že se Udar vydal lovit skřety. Zeptal se mě, jestli mu nepomůžu ho najít! Přirozeně jsem souhlasil.");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"Follow");
	AI_StopProcessInfos(self);
};


instance DIA_PAL_91680_NATAN_WHEREUDARDONE(C_Info)
{
	npc = pal_91680_natan;
	nr = 1;
	condition = dia_pal_91680_natan_whereudardone_condition;
	information = dia_pal_91680_natan_whereudardone_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_pal_91680_natan_whereudardone_condition()
{
	if((MIS_NATANDOLG == LOG_Running) && (UDARORCSTRAPISDONE == TRUE))
	{
		return TRUE;
	};
};

func void dia_pal_91680_natan_whereudardone_info()
{
	B_GivePlayerXP(200);
	AI_Output(self,other,"DIA_Pal_91680_Natan_WhereUdarDone_01_00");	//Je dobře, že jsme tu včas... Ještě trochu a ta stvoření by ho zabila!
	AI_Output(other,self,"DIA_Pal_91680_Natan_WhereUdarDone_01_01");	//Ale jak vidíš, vše se povedlo! Myslím, že teď jsi Udarovi konečně splatil svůj dluh - Právě jsi mu zachránili život.
	AI_Output(self,other,"DIA_Pal_91680_Natan_WhereUdarDone_01_02");	//Hmmm... Žije... Všechno se to semlelo tak rychle.
	AI_Output(other,self,"DIA_Pal_91680_Natan_WhereUdarDone_01_03");	//Hlavní je, že jsi splatil svůj dluh, jak se to stalo už není důležité.
	AI_Output(self,other,"DIA_Pal_91680_Natan_WhereUdarDone_01_04");	//No, máš pravdu... Díky za pomoc (úsměv) Doufám, že se znovu potkáme!
	AI_Output(other,self,"DIA_Pal_91680_Natan_WhereUdarDone_01_05");	//Nápodobně.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"Start");
	MIS_NATANDOLG = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_NATANDOLG,LOG_SUCCESS);
	AI_StopProcessInfos(self);
};

