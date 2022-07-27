
instance DIA_VIRAN_EXIT(C_Info)
{
	npc = sek_8009_viran;
	nr = 999;
	condition = dia_viran_exit_condition;
	information = dia_viran_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_viran_exit_condition()
{
	return TRUE;
};

func void dia_viran_exit_info()
{
	AI_StopProcessInfos(self);
};

instance dia_viran_PICKPOCKET(C_Info)
{
	npc = sek_8009_viran;
	nr = 900;
	condition = dia_viran_PICKPOCKET_Condition;
	information = dia_viran_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int dia_viran_PICKPOCKET_Condition()
{
	return C_Beklauen(20,43);
};

func void dia_viran_PICKPOCKET_Info()
{
	Info_ClearChoices(dia_viran_PICKPOCKET);
	Info_AddChoice(dia_viran_PICKPOCKET,Dialog_Back,dia_viran_PICKPOCKET_BACK);
	Info_AddChoice(dia_viran_PICKPOCKET,DIALOG_PICKPOCKET,dia_viran_PICKPOCKET_DoIt);
};

func void dia_viran_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(dia_viran_PICKPOCKET);
};

func void dia_viran_PICKPOCKET_BACK()
{
	Info_ClearChoices(dia_viran_PICKPOCKET);
};

instance DIA_VIRAN_MAGICSYMBOLS(C_Info)
{
	npc = sek_8009_viran;
	nr = 1;
	condition = dia_viran_magicsymbols_condition;
	information = dia_viran_magicsymbols_info;
	permanent = TRUE;
	important = FALSE;
	description = "Mám na tebe prosbu.";
};


func int dia_viran_magicsymbols_condition()
{
	if((CANMAKESYMBOLS == TRUE) && (SYMBOLSMAKEDONE == FALSE))
	{
		return TRUE;
	};
};

func void dia_viran_magicsymbols_info()
{
	AI_Output(other,self,"DIA_Viran_MagicSymbols_01_00");	//Mám na tebe prosbu.

	if(VIRANFIRSTTALKSYMBOLS == FALSE)
	{
		AI_Output(self,other,"DIA_Viran_MagicSymbols_01_01");	//(podrážděně) Co chceš? Mluv rychle nemám čas.
		AI_Output(other,self,"DIA_Viran_MagicSymbols_01_02");	//Orun mi řekl, že mi můžeš vytetovat magické symboly na tělo.
		AI_Output(other,self,"DIA_Viran_MagicSymbols_01_03");	//Jako jeden z členů Bratrstva už můžu symboly nosit.
		AI_Output(self,other,"DIA_Viran_MagicSymbols_01_04");	//A tohle to je ta prosba. Samozřejmě ti pomůžu. Nebude to trvat ani moc času.
		AI_Output(self,other,"DIA_Viran_MagicSymbols_01_05");	//Jsi si jistý že to chceš opravdu udělat?
		VIRANFIRSTTALKSYMBOLS = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Viran_MagicSymbols_01_06");	//(mrzutě) Co zase chceš?
		AI_Output(other,self,"DIA_Viran_MagicSymbols_01_07");	//Nakonec jsem se rozhodl si symboly nechat vytetovat. Pomůžeš mi?
		AI_Output(self,other,"DIA_Viran_MagicSymbols_01_08");	//Dobře... (pochybovačně) Jsi si opravdu jistý?
	};
	Info_ClearChoices(dia_viran_magicsymbols);
	Info_AddChoice(dia_viran_magicsymbols,"Ano, samozřejmě!",dia_viran_magicsymbols_yes);
	Info_AddChoice(dia_viran_magicsymbols,"Ne, tohle není nic pro mě.",dia_viran_magicsymbols_no);
};

func void dia_viran_magicsymbols_yes()
{
	PlayVideo("RET2_BlackScreen.bik");
	other.protection[PROT_MAGIC] += 5;
	REALPROTMAGIC += 5;
	AI_Print(NAME_SEK_MAGIC);
	Snd_Play("LevelUp");
	SYMBOLSMAKEDONE = TRUE;
	HelmIsUpTemp = FALSE;
	AI_Output(self,other,"DIA_Viran_MagicSymbols_Yes_01_01");	//To je vše, hotovo. Kouzlo těchto posvátných symbolů tě nyní ochrání.
	AI_Output(other,self,"DIA_Viran_MagicSymbols_Yes_01_02");	//Děkuji.
	Info_ClearChoices(dia_viran_magicsymbols);
};

func void dia_viran_magicsymbols_no()
{
	AI_Output(other,self,"DIA_Viran_MagicSymbols_No_01_01");	//Ne, tohle není nic pro mě.
	AI_Output(self,other,"DIA_Viran_MagicSymbols_No_01_02");	//Dobře cokoliv řekneš.
	Info_ClearChoices(dia_viran_magicsymbols);
};

instance DIA_Viran_Bold(C_Info)
{
	npc = sek_8009_viran;
	nr = 899;
	condition = DIA_Viran_Bold_condition;
	information = DIA_Viran_Bold_info;
	permanent = TRUE;
	description = "Vyhol mě na pleš.";
};

func int DIA_Viran_Bold_condition()
{
	if((HeroBoldHead == FALSE) && ((hero.guild == GIL_SEK) || (hero.guild == GIL_SEK) || (hero.guild == GIL_SEK)))
	{
		return TRUE;
	};
};

func void DIA_Viran_Bold_info()
{
	AI_Output(other,self,"DIA_Viran_Bold_01_00");	//Vyhol mě na pleš.
	AI_Output(self,other,"DIA_Viran_MagicSymbols_01_08");	//Dobře... (překvapeně) Jsi si tím jistý?
	Info_ClearChoices(DIA_Viran_Bold);
	Info_AddChoice(DIA_Viran_Bold,"Jo, dělej!",DIA_Viran_Bold_Yes);
	Info_AddChoice(DIA_Viran_Bold,"Ne, to není pro mě.",DIA_Viran_Bold_No);
};

func void DIA_Viran_Bold_Yes()
{
	PlayVideo("RET2_BlackScreen.bik");
	HeroBoldHead = TRUE;
	Ext_RemoveFromSlot(hero,"BIP01 HEAD");
	Npc_RemoveInvItems(hero,ITMI_GERALTHAIR,Npc_HasItems(hero,ITMI_GERALTHAIR));
	GeraltHead = FALSE;

	if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == TRUE))
	{
		Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_XNG_Player,0,NO_ARMOR);
	}
	else if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == FALSE))
	{
		Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_XNG_Player,0,NO_ARMOR);
	}
	else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == TRUE))
	{
		Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_NX_Player,0,NO_ARMOR);
	}
	else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == FALSE))
	{
		Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_NX_Player,0,NO_ARMOR);
	};

	AI_Output(other,self,"DIA_Viran_MagicSymbols_Yes_01_02");	//Děkuji.
	Info_ClearChoices(DIA_Viran_Bold);
};

func void DIA_Viran_Bold_No()
{
	AI_Output(other,self,"DIA_Viran_MagicSymbols_No_01_01");	//Ne, to není pro mě.
	AI_Output(self,other,"DIA_Viran_MagicSymbols_No_01_02");	//Jasně, když chceš.
	Info_ClearChoices(DIA_Viran_Bold);
};

instance DIA_VIRAN_WHATYOUDO(C_Info)
{
	npc = sek_8009_viran;
	nr = 1;
	condition = dia_viran_whatyoudo_condition;
	information = dia_viran_whatyoudo_info;
	permanent = FALSE;
	important = FALSE;
	description = "Čím se zabýváš?";
};

func int dia_viran_whatyoudo_condition()
{
	return TRUE;
};

func void dia_viran_whatyoudo_info()
{
	AI_Output(other,self,"DIA_Viran_WhatYouDo_01_00");	//Čím se zabýváš?
	AI_Output(self,other,"DIA_Viran_WhatYouDo_01_01");	//Copak nevidíš? Pomáhám Jorovi. Kováme meče pro templáře!
	AI_Output(other,self,"DIA_Viran_WhatYouDo_01_02");	//K čemu potřebujete tolik zbraní?
	AI_Output(self,other,"DIA_Viran_WhatYouDo_01_03");	//Člověče, otevři oči. Hornické údolí se hemží skřety. Brzy sem vtrhnou!
	AI_Output(self,other,"DIA_Viran_WhatYouDo_01_04");	//Určitě budou ještě litovat! My se nenecháme překvapit!
};


instance DIA_VIRAN_NEEDWEAPONS(C_Info)
{
	npc = sek_8009_viran;
	nr = 4;
	condition = dia_viran_needweapons_condition;
	information = dia_viran_needweapons_info;
	permanent = FALSE;
	description = "Můžu si koupit zbraň?";
};


func int dia_viran_needweapons_condition()
{
	return TRUE;
};

func void dia_viran_needweapons_info()
{
	AI_Output(other,self,"DIA_Viran_NeedWeapons_01_00");	//Můžu si koupit zbraň?
	AI_Output(self,other,"DIA_Viran_NeedWeapons_01_01");	//To není v mé kompetenci. Promluv si s Jorou.
};


instance DIA_VIRAN_HOWTHINGS(C_Info)
{
	npc = sek_8009_viran;
	nr = 4;
	condition = dia_viran_howthings_condition;
	information = dia_viran_howthings_info;
	permanent = TRUE;
	description = "A jak jde příprava obrany?";
};


func int dia_viran_howthings_condition()
{
	if(Npc_KnowsInfo(hero,dia_viran_whatyoudo) && Wld_IsTime(8,0,22,0))
	{
		return TRUE;
	};
};

func void dia_viran_howthings_info()
{
	AI_Output(other,self,"DIA_Viran_HowThings_01_00");	//A jak jde příprava obrany?
	AI_Output(self,other,"DIA_Viran_HowThings_01_01");	//Šla by líp kdybys mě nezdržoval od práce! (naštvaně)
};


instance DIA_VIRAN_NEEDSTEEL(C_Info)
{
	npc = sek_8009_viran;
	nr = 4;
	condition = dia_viran_needsteel_condition;
	information = dia_viran_needsteel_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_viran_needsteel_condition()
{
	if(Npc_KnowsInfo(hero,dia_viran_whatyoudo) && (PSI_TALK == TRUE))
	{
		return TRUE;
	};
};

func void dia_viran_needsteel_info()
{
	AI_Output(self,other,"DIA_Viran_NeedSteel_01_00");	//Počkej chvilku...
	AI_Output(other,self,"DIA_Viran_NeedSteel_01_01");	//Co dál?
	AI_Output(self,other,"DIA_Viran_NeedSteel_01_02");	//Víš je tu jedna práce, pro tebe jako dělaná.
	AI_Output(other,self,"DIA_Viran_NeedSteel_01_03");	//O co jde?
	AI_Output(self,other,"DIA_Viran_NeedSteel_01_05");	//Víš máme extrémní nedostatek oceli na výrobu zbraní a zbrojí.
	AI_Output(self,other,"DIA_Viran_NeedSteel_01_06");	//Prostě máme málo oceli.
	AI_Output(other,self,"DIA_Viran_NeedSteel_01_07");	//No a?
	AI_Output(self,other,"DIA_Viran_NeedSteel_01_08");	//Pokud se ti podaří sehnat nějakou ocel, bylo by to pro nás dost užitečný.
	AI_Output(other,self,"DIA_Viran_NeedSteel_01_09");	//Co přesně mi za tu ocel můžeš nabídnout?
	AI_Output(self,other,"DIA_Viran_NeedSteel_01_13");	//Řekněme že za tvoji pomoc bych ti mohl dát... Hmmm...
	AI_Output(self,other,"DIA_Viran_NeedSteel_01_14");	//... jednu velmi dobrou zbraň co máme v našem arzenálu rezerv.
	AI_Output(other,self,"DIA_Viran_NeedSteel_01_15");	//Co je to za zbraň?
	AI_Output(self,other,"DIA_Viran_NeedSteel_01_16");	//Nejprve dones ocel. Potom ti o ní řeknu víc.
	AI_Output(self,other,"DIA_Viran_NeedSteel_01_17");	//Řeknu ti jen jedno. Čím více oceli doneseš tím lepší zbraň dostaneš!
	AI_Output(self,other,"DIA_Viran_NeedSteel_01_18");	//No, co na to říkáš?
	Info_ClearChoices(dia_viran_needsteel);
	Info_AddChoice(dia_viran_needsteel,"Dobře. Ale doufám že se mi to vyplatí!",dia_viran_needsteel_ja);
	Info_AddChoice(dia_viran_needsteel,"Nepřipadá v úvahu.",dia_viran_needsteel_nein);
};

func void dia_viran_needsteel_ja()
{
	AI_Output(other,self,"DIA_Viran_NeedSteel_Ja_01_00");	//Dobře. Ale doufám že se mi to vyplatí!
	AI_Output(self,other,"DIA_Viran_NeedSteel_Ja_01_01");	//Fajn! Věř mi, nebudeš litovat.
	AI_Output(other,self,"DIA_Viran_NeedSteel_Ja_01_02");	//To doufám.
	VIRAN_BRINGSTEEL = LOG_Running;
	Log_CreateTopic(TOPIC_VIRANBRINGSTEEL,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_VIRANBRINGSTEEL,LOG_Running);
	B_LogEntry(TOPIC_VIRANBRINGSTEEL,"Viran chce donést co nejvíce oceli.");
	Info_ClearChoices(dia_viran_needsteel);
};

func void dia_viran_needsteel_nein()
{
	AI_Output(other,self,"DIA_Viran_NeedSteel_Nein_01_00");	//Nepřipadá v úvahu.
	AI_Output(self,other,"DIA_Viran_NeedSteel_Nein_01_01");	//Dobře... jak myslíš.
	Info_ClearChoices(dia_viran_needsteel);
};


instance DIA_VIRAN_BRINGSTEEL(C_Info)
{
	npc = sek_8009_viran;
	nr = 5;
	condition = dia_viran_bringsteel_condition;
	information = dia_viran_bringsteel_info;
	permanent = TRUE;
	description = "Mám tu ocel.";
};


func int dia_viran_bringsteel_condition()
{
	if((VIRAN_BRINGSTEEL == LOG_Running) && (Npc_HasItems(other,ItMiSwordraw) >= 1))
	{
		return TRUE;
	};
};

func void dia_viran_bringsteel_info()
{
	var C_Item EquipWeap;
	var int countsteel;
	AI_Output(other,self,"DIA_Viran_BringSteel_01_00");	//Mám tu ocel.
	AI_Output(self,other,"DIA_Viran_BringSteel_01_01");	//Dobře! Tak ji ukaž.
	countsteel = Npc_HasItems(other,ItMiSwordraw);
	if((countsteel >= 1) && (countsteel <= 3))
	{
		B_GiveInvItems(other,self,ItMiSwordraw,countsteel);
		AI_Output(self,other,"DIA_Viran_BringSteel_01_02");	//(zklamaně) To je všechno?
		AI_Output(self,other,"DIA_Viran_BringSteel_01_03");	//To ale nebude stačit ani na pořádný meč!
		AI_Output(other,self,"DIA_Viran_BringSteel_01_04");	//Co má odměna?
		AI_Output(self,other,"DIA_Viran_BringSteel_01_05");	//Ach ano tvoje odměna... (zlomyslně)
		AI_Output(self,other,"DIA_Viran_BringSteel_01_06");	//Tady, víc si nezasloužíš!
		if(countsteel == 1)
		{
			B_GiveInvItems(self,other,itmw_1h_misc_gsword,1);
		}
		else
		{
			B_GiveInvItems(self,other,ItMw_ShortSword3,1);
			B_GivePlayerXP(50);
		};
	}
	else if((countsteel > 3) && (countsteel <= 5))
	{
		B_GivePlayerXP(200);
		B_GiveInvItems(other,self,ItMiSwordraw,countsteel);
		AI_Output(self,other,"DIA_Viran_BringSteel_01_07");	//To není špatné ale upřímně jsem čekal více...
		AI_Output(self,other,"DIA_Viran_BringSteel_01_08");	//Ale lepší něco než nic...
		AI_Output(other,self,"DIA_Viran_BringSteel_01_09");	//Co má odměna?
		AI_Output(self,other,"DIA_Viran_BringSteel_01_10");	//Ach ano tvoje odměna... (povzdech)
		AI_Output(self,other,"DIA_Viran_BringSteel_01_11");	//Tady, víc si nezasloužíš!
		B_GiveInvItems(self,other,ItMw_Schwert,1);
	}
	else if((countsteel > 5) && (countsteel <= 7))
	{
		B_GivePlayerXP(400);
		B_GiveInvItems(other,self,ItMiSwordraw,countsteel);
		AI_Output(self,other,"DIA_Viran_BringSteel_01_12");	//Ooo! Rozhodně to není špatné!
		AI_Output(self,other,"DIA_Viran_BringSteel_01_13");	//To jsem očekával.
		AI_Output(other,self,"DIA_Viran_BringSteel_01_14");	//Co má odměna?
		AI_Output(self,other,"DIA_Viran_BringSteel_01_16");	//Tady vezmi si tuhle maličkost. Myslím že si ji plně zasloužíš.
		B_GiveInvItems(self,other,ItMw_Bartaxt,1);
	}
	else if((countsteel > 7) && (countsteel <= 15))
	{
		B_GivePlayerXP(600);
		B_GiveInvItems(other,self,ItMiSwordraw,countsteel);
		AI_Output(self,other,"DIA_Viran_BringSteel_01_17");	//Člověče kde jsi vzal tolik oceli?
		AI_Output(self,other,"DIA_Viran_BringSteel_01_18");	//To je víc než jsem vůbec doufal!
		AI_Output(other,self,"DIA_Viran_BringSteel_01_19");	//A co má odměna?
		AI_Output(self,other,"DIA_Viran_BringSteel_01_20");	//Samozřejmě! Hned se ti vyrovnám.
		AI_Output(self,other,"DIA_Viran_BringSteel_01_21");	//Tady máš. Je to skvělá věc.
		B_GiveInvItems(self,other,ItMw_Schwert4,1);
	}
	else if(countsteel > 15)
	{
		B_GivePlayerXP(1000);
		B_GiveInvItems(other,self,ItMiSwordraw,countsteel);
		AI_Output(self,other,"DIA_Viran_BringSteel_01_22");	//Já... nevěřím svým očím! (překvapeně)
		AI_Output(self,other,"DIA_Viran_BringSteel_01_23");	//To je mnohem víc než v kolik jsem mohl kdy doufat!
		AI_Output(other,self,"DIA_Viran_BringSteel_01_24");	//Mám naději, že tomu bude odpovídat i má odměna?
		AI_Output(self,other,"DIA_Viran_BringSteel_01_25");	//Samozřejmě! Hned ti vyrovnám náklady. A ještě něco přihodím!
		AI_Output(self,other,"DIA_Viran_BringSteel_01_26");	//Tady máš. Věř mi je to nejlepší zbraň co mám k dispozici!
		B_GiveInvItems(self,other,itmw_1h_mace_107,1);
	};
	Npc_RemoveInvItems(self,ItMiSwordraw,Npc_HasItems(self,ItMiSwordraw));
	VIRAN_BRINGSTEEL = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_VIRANBRINGSTEEL,LOG_SUCCESS);
};


instance DIA_VIRAN_SEKTEHEILEN(C_Info)
{
	npc = sek_8009_viran;
	nr = 1;
	condition = dia_viran_sekteheilen_condition;
	information = dia_viran_sekteheilen_info;
	permanent = FALSE;
	description = "Pij, pij! Pomůže ti to od bolesti hlavy.";
};


func int dia_viran_sekteheilen_condition()
{
	if((Npc_HasItems(other,ItPo_HealObsession_MIS) > 0) && (MIS_SEKTEHEILEN == LOG_Running) && Npc_KnowsInfo(hero,dia_baalorun_sekteheilengot))
	{
		return TRUE;
	};
};

func void dia_viran_sekteheilen_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Viran_SekteHeilen_01_00");	//Pij, pij! Pomůže ti to od bolesti hlavy.
	B_GiveInvItems(other,self,ItPo_HealObsession_MIS,1);
	B_UseItem(self,ItPo_HealObsession_MIS);
	SEKTEHEILENCOUNT = SEKTEHEILENCOUNT + 1;
	AI_Output(self,other,"DIA_Viran_SekteHeilen_01_01");	//Moje hlava... Je volná!
	AI_Output(self,other,"DIA_Viran_SekteHeilen_01_02");	//Děkuji ti, bratře.
};

