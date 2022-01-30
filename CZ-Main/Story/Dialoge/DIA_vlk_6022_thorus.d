
instance DIA_THORUS_NW_EXIT(C_Info)
{
	npc = vlk_6022_thorus;
	nr = 999;
	condition = dia_thorus_nw_exit_condition;
	information = dia_thorus_nw_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_thorus_nw_exit_condition()
{
	return TRUE;
};

func void dia_thorus_nw_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_THORUS_NW_PICKPOCKET(C_Info)
{
	npc = vlk_6022_thorus;
	nr = 900;
	condition = dia_thorus_nw_pickpocket_condition;
	information = dia_thorus_nw_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_thorus_nw_pickpocket_condition()
{
	return C_Beklauen(100,200);
};

func void dia_thorus_nw_pickpocket_info()
{
	Info_ClearChoices(dia_thorus_nw_pickpocket);
	Info_AddChoice(dia_thorus_nw_pickpocket,Dialog_Back,dia_thorus_nw_pickpocket_back);
	Info_AddChoice(dia_thorus_nw_pickpocket,DIALOG_PICKPOCKET,dia_thorus_nw_pickpocket_doit);
};

func void dia_thorus_nw_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_thorus_nw_pickpocket);
};

func void dia_thorus_nw_pickpocket_back()
{
	Info_ClearChoices(dia_thorus_nw_pickpocket);
};


instance DIA_THORUS_NW_HI(C_Info)
{
	npc = vlk_6022_thorus;
	nr = 1;
	condition = dia_thorus_nw_hi_condition;
	information = dia_thorus_nw_hi_info;
	important = TRUE;
};


func int dia_thorus_nw_hi_condition()
{
	if(KAPITELORCATC == FALSE)
	{
		return TRUE;
	};
};

func void dia_thorus_nw_hi_info()
{
	B_GivePlayerXP(500);
	AI_Output(self,other,"DIA_Thorus_NW_Hi_01_00");	//Hej, chlape, jsi mi povědomý!
	AI_Output(other,self,"DIA_Thorus_NW_Hi_01_01");	//Thorusi? Jsi to ty?
	AI_Output(self,other,"DIA_Thorus_NW_Hi_01_02");	//Ano... Zase jsme se setkali. Svět je malý...
	AI_Output(other,self,"DIA_Thorus_NW_Hi_01_03");	//Co tady děláš?!
	AI_Output(self,other,"DIA_Thorus_NW_Hi_01_04");	//Mohl bych se tě zeptat, co tady deláš ty. A jak divně vypadáš...
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Thorus_NW_Hi_01_05");	//Odkdy jsi mágem Ohně?
	}
	else if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Thorus_NW_Hi_01_06");	//Odkdy jsi paladinem?
	}
	else if(other.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Thorus_NW_Hi_01_07");	//Odkdy jsi žoldákem?
	}
	else if(other.guild == GIL_KDW)
	{
		AI_Output(self,other,"DIA_Thorus_NW_Hi_01_0A");	//Odkdy jsi mágem Vody?
	}
	else if(other.guild == GIL_KDM)
	{
		AI_Output(self,other,"DIA_Thorus_NW_Hi_01_0B");	//Odkdy jsi... no to mě podrž, TEMNÝ MÁG?!
	}
	else if((other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR))
	{
		AI_Output(self,other,"DIA_Thorus_NW_Hi_01_0C");	//Odkdy jsi členem Bratrstva?
	};
	AI_Output(other,self,"DIA_Thorus_NW_Hi_01_08");	//No, byl jsem jím už při mém výletu v bažinách...
	AI_Output(self,other,"DIA_Thorus_NW_Hi_01_09");	//Aha... To jsi celý ty, nikdy nemůžeme vědet, s kým vlastně jsi.
	AI_Output(other,self,"DIA_Thorus_NW_Hi_01_10");	//Vidím, že ses přidal ke stráži, jak je to sakra možný?!
	AI_Output(self,other,"DIA_Thorus_NW_Hi_01_11");	//To je jednoduché. Před tebou stojí chlápek, kterej umí bojovat. A pochop, že takoví lidé jsou sakra důležití pro městskou bezpečnost.
	AI_Output(self,other,"DIA_Thorus_NW_Hi_01_12");	//Tak jsem přišel za Andrem, že chci do domobrany.
	AI_Output(self,other,"DIA_Thorus_NW_Hi_01_13");	//Byl přirozeně proti a měl nejaké kecy ohledně občanství, ale když viděl jak bojuji, musel mě vzít.
	AI_Output(self,other,"DIA_Thorus_NW_Hi_01_17");	//Stojím tady celý den - dodržuji pořádek. Ale je to lepší než tam, v močálech.
	AI_Output(other,self,"DIA_Thorus_NW_Hi_01_18");	//Bojovník jako ty se Andremu bude hodit.
};


instance DIA_THORUS_NW_CITY(C_Info)
{
	npc = vlk_6022_thorus;
	nr = 2;
	condition = dia_thorus_nw_city_condition;
	information = dia_thorus_nw_city_info;
	permanent = TRUE;
	description = "Jak jsi postoupil s bojem proti kriminalitě?";
};


func int dia_thorus_nw_city_condition()
{
	if(Npc_KnowsInfo(other,dia_thorus_nw_hi) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void dia_thorus_nw_city_info()
{
	AI_Output(other,self,"DIA_Thorus_NW_City_01_00");	//Jak jsi postoupil s bojem proti kriminalitě?
	AI_Output(self,other,"DIA_Thorus_NW_City_01_01");	//No, potichoučku, pomaloučku to postupuje samo...
};

instance DIA_THORUS_NW_ESCAPEFROMTOWN(C_Info)
{
	npc = vlk_6022_thorus;
	nr = 1;
	condition = dia_thorus_nw_escapefromtown_condition;
	information = dia_thorus_nw_escapefromtown_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_thorus_nw_escapefromtown_condition()
{
	if(KAPITELORCATC == TRUE)
	{
		return TRUE;
	};
};

func void dia_thorus_nw_escapefromtown_info()
{
	AI_Output(self,other,"DIA_Thorus_NW_EscapeFromTown_01_00");	//Tak to jsem fakt nevěděl, že tě zrovna tady potkám!
	AI_Output(self,other,"DIA_Thorus_NW_EscapeFromTown_01_01");	//Myslel jsem, že jsi někde v prdeli.
	AI_Output(other,self,"DIA_Thorus_NW_EscapeFromTown_01_02");	//Jsem překvapený stejně jako ty - jak ses dostal z města?!
	AI_Output(self,other,"DIA_Thorus_NW_EscapeFromTown_01_03");	//To Cavalorn... (vážně) Kdyby mi nepomohl, bylo by po mě!
	AI_Output(self,other,"DIA_Thorus_NW_EscapeFromTown_01_04");	//Jakmile všem došlo, že je vše ztraceno, ukázal mi tajnou cestu z města - utekli jsme po pobřeží.
	AI_Output(self,other,"DIA_Thorus_NW_EscapeFromTown_01_05");	//A nyní jsme tady, na Akilově farmě. Skřeti sem ješte nedorazili.

	if(MEETCAVALORNAGAIN == FALSE)
	{
		AI_Output(other,self,"DIA_Thorus_NW_EscapeFromTown_01_06");	//Takže Cavalorn také přežil, to je úžasná zpráva!
		AI_Output(self,other,"DIA_Thorus_NW_EscapeFromTown_01_07");	//Nemůžu nesouhlasit... (smích) Je nedaleko mostu.
		AI_Output(self,other,"DIA_Thorus_NW_EscapeFromTown_01_08");	//Sleduje, jestli se neblíží skřetí patroly. Dej si pozor, jsou na druhé straně.
	};

	THORUSHERE = TRUE;
};


instance DIA_THORUS_NW_WHATNEXT(C_Info)
{
	npc = vlk_6022_thorus;
	nr = 1;
	condition = dia_thorus_nw_whatnext_condition;
	information = dia_thorus_nw_whatnext_info;
	permanent = TRUE;
	description = "Co budeš dělat dál?";
};

func int dia_thorus_nw_whatnext_condition()
{
	if(Npc_KnowsInfo(hero,dia_thorus_nw_escapefromtown) && (MIS_OLDGUARDGOWAR == FALSE))
	{
		return TRUE;
	};
};

func void dia_thorus_nw_whatnext_info()
{
	AI_Output(other,self,"DIA_Thorus_NW_WhatNext_01_00");	//Co budeš dělat dál?
	AI_Output(self,other,"DIA_Thorus_NW_WhatNext_01_01");	//To nevím, pro začátek si odpočinu!
	AI_Output(self,other,"DIA_Thorus_NW_WhatNext_01_02");	//Neměl bych být tak nervózní.
	AI_Output(other,self,"DIA_Thorus_NW_WhatNext_01_03");	//Jo, to je fakt.
};

instance DIA_THORUS_NW_OLDGUARDGOWAR(C_Info)
{
	npc = vlk_6022_thorus;
	nr = 1;
	condition = dia_thorus_nw_oldguardgowar_condition;
	information = dia_thorus_nw_oldguardgowar_info;
	permanent = FALSE;
	description = "Pojď se mnou, vezmu tě na Onarovu farmu.";
};

func int dia_thorus_nw_oldguardgowar_condition()
{
	if((MIS_OLDGUARDGOWAR == LOG_Running) && (THORUSHERE == TRUE))
	{
		return TRUE;
	};
};

func void dia_thorus_nw_oldguardgowar_info()
{
	AI_Output(other,self,"DIA_Thorus_NW_OldGuardGoWar_01_00");	//Pojď se mnou, vezmu tě na Onarovu farmu.
	AI_Output(self,other,"DIA_Thorus_NW_OldGuardGoWar_01_01");	//Doufám, že víš, co děláš!
	THORUSJOINME = TRUE;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Follow");
};

instance DIA_THORUS_NW_OLDGUARDGOWAR_DONE(C_Info)
{
	npc = vlk_6022_thorus;
	nr = 1;
	condition = DIA_THORUS_NW_OLDGUARDGOWAR_DONE_condition;
	information = DIA_THORUS_NW_OLDGUARDGOWAR_DONE_info;
	permanent = FALSE;
	description = "Jsme tady!";
};

func int DIA_THORUS_NW_OLDGUARDGOWAR_DONE_condition()
{
	if((THORUSJOINME == TRUE) && (Npc_GetDistToWP(self,"NW_BIGFARM_PATH_04") <= 2000))
	{
		return TRUE;
	};
};

func void DIA_THORUS_NW_OLDGUARDGOWAR_DONE_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_THORUS_NW_OLDGUARDGOWAR_DONE_01_00");	//Jsme tady!
	AI_Output(self,other,"DIA_THORUS_NW_OLDGUARDGOWAR_DONE_01_01");	//Dobře... V jistých mezích, skřety nevidím.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	THORUSINSAFE = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FarmRest");
};

instance DIA_THORUS_NW_WHEREPEASANT(C_Info)
{
	npc = vlk_6022_thorus;
	nr = 1;
	condition = dia_thorus_nw_wherepeasant_condition;
	information = dia_thorus_nw_wherepeasant_info;
	permanent = FALSE;
	description = "Kde jsou všichni rolníci?";
};

func int dia_thorus_nw_wherepeasant_condition()
{
	if((THORUSHERE == TRUE) && (KNOWWHEREAKIL == FALSE) && (MIS_OLDGUARDGOWAR == FALSE))
	{
		return TRUE;
	};
};

func void dia_thorus_nw_wherepeasant_info()
{
	AI_Output(other,self,"DIA_Thorus_NW_WherePeasant_01_00");	//Kde jsou všichni rolníci?
	AI_Output(self,other,"DIA_Thorus_NW_WherePeasant_01_01");	//Nevím, někam zdrhli!
	AI_Output(self,other,"DIA_Thorus_NW_WherePeasant_01_02");	//Ale skřeti s tím počítali, takže je ani nenapadlo farmu prohledat!
	AI_Output(other,self,"DIA_Thorus_NW_WherePeasant_01_03");	//To vidím.
	KNOWWHEREAKIL = TRUE;
};

instance DIA_THORUS_NW_TRAVELONBIGLAND(C_Info)
{
	npc = vlk_6022_thorus;
	nr = 1;
	condition = dia_thorus_nw_travelonbigland_condition;
	information = dia_thorus_nw_travelonbigland_info;
	permanent = FALSE;
	description = "Mám v plánu odplout na kontinent.";
};

func int dia_thorus_nw_travelonbigland_condition()
{
	if(WHOTRAVELONBIGLAND == TRUE)
	{
		return TRUE;
	};
};

func void dia_thorus_nw_travelonbigland_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Thorus_NW_TravelOnBigLand_01_00");	//Mám v plánu odplout na kontinent.
	AI_Output(other,self,"DIA_Thorus_NW_TravelOnBigLand_01_01");	//Myslím, že bych pro tebe měl místo v posádce!
	AI_Output(self,other,"DIA_Thorus_NW_TravelOnBigLand_01_02");	//Heh, díky příteli... Jsem rád, že jsi na mě nezapomněl.
	AI_Output(self,other,"DIA_Thorus_NW_TravelOnBigLand_01_03");	//Rád s tebou půjdu - na pevnině začnu nový život.
	AI_Output(self,other,"DIA_Thorus_NW_TravelOnBigLand_01_04");	//Tady mě už nic dobrého nečeká!
	AI_Output(other,self,"DIA_Thorus_NW_TravelOnBigLand_01_05");	//Tak vzhůru na palubu!
	COUNTTRAVELONBIGLAND = COUNTTRAVELONBIGLAND + 1;
	THORUSTOBIGLAND = TRUE;
	B_LogEntry(TOPIC_SALETOBIGLAND,"Nabídl jsem Thorusovi, aby se mnou odplul. Souhlasil.");
	Npc_ExchangeRoutine(self,"SHIP");
	AI_StopProcessInfos(self);
};
