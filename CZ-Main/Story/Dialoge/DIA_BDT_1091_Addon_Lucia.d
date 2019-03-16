
instance DIA_Addon_Lucia_EXIT(C_Info)
{
	npc = BDT_1091_Addon_Lucia;
	nr = 999;
	condition = DIA_Addon_Lucia_EXIT_Condition;
	information = DIA_Addon_Lucia_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Lucia_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Lucia_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Lucia_PICKPOCKET(C_Info)
{
	npc = BDT_1091_Addon_Lucia;
	nr = 900;
	condition = DIA_Addon_Lucia_PICKPOCKET_Condition;
	information = DIA_Addon_Lucia_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Lucia_PICKPOCKET_Condition()
{
	return C_Beklauen(80,100);
};

func void DIA_Addon_Lucia_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Lucia_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Lucia_PICKPOCKET,Dialog_Back,DIA_Addon_Lucia_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Lucia_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Lucia_PICKPOCKET_DoIt);
};

func void DIA_Addon_Lucia_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Lucia_PICKPOCKET);
};

func void DIA_Addon_Lucia_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Lucia_PICKPOCKET);
};


instance DIA_Addon_Lucia_Hi(C_Info)
{
	npc = BDT_1091_Addon_Lucia;
	nr = 2;
	condition = DIA_Addon_Lucia_Hi_Condition;
	information = DIA_Addon_Lucia_Hi_Info;
	permanent = FALSE;
	description = "Jak to jde?";
};


func int DIA_Addon_Lucia_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Lucia_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Hi_15_00");	//Jak to jde?
	AI_Output(self,other,"DIA_Addon_Lucia_Hi_16_01");	//Poslouchej, jestli bys rád něco k jídlu, obrať se tam na Snafa. Jestli chceš něco k pití, pak mluvíš se správnou osobou.
};


instance DIA_Addon_Lucia_was(C_Info)
{
	npc = BDT_1091_Addon_Lucia;
	nr = 2;
	condition = DIA_Addon_Lucia_was_Condition;
	information = DIA_Addon_Lucia_was_Info;
	permanent = FALSE;
	description = "Tak co mi můžeš nabídnout?";
};


func int DIA_Addon_Lucia_was_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Lucia_Hi))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Lucia_was_Info()
{
	AI_Output(other,self,"DIA_Addon_Lucia_was_15_00");	//Tak co mi můžeš nabídnout?
	AI_Output(self,other,"DIA_Addon_Lucia_was_16_01");	//Bohužel nemáme dost piva. Dostupné je jenom na ostrovech, kam ho přivezli paladinové.
	AI_Output(self,other,"DIA_Addon_Lucia_was_16_02");	//Alespoň na něco byli dobří...
	AI_Output(self,other,"DIA_Addon_Lucia_was_16_03");	//A mimo to my obvykle pijeme kořalku. Mám kořalku vlastní výroby, grog a bílý rum.
	AI_Output(self,other,"DIA_Addon_Lucia_was_16_04");	//(chutně) Hmmm... Opravdu bys měl zkusit TOTO. Mám recept od Samuela. Ten starý chlápek fakt ví, jak míchat pití.
	Log_CreateTopic(Topic_Addon_BDT_Trader,LOG_NOTE);
	B_LogEntry(Topic_Addon_BDT_Trader,"Lucia obchoduje s tvrdým chlastem - kořalkou.");
};


instance DIA_Addon_Lucia_Khorinis(C_Info)
{
	npc = BDT_1091_Addon_Lucia;
	nr = 2;
	condition = DIA_Addon_Lucia_Khorinis_Condition;
	information = DIA_Addon_Lucia_Khorinis_Info;
	permanent = FALSE;
	description = "Hej, nejsi z Khorinisu?";
};


func int DIA_Addon_Lucia_Khorinis_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Bromor_Lucia) || (Nadja_GaveLuciaInfo == TRUE) || Npc_KnowsInfo(other,DIA_Addon_Elvrich_WhatExactly))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Lucia_Khorinis_Info()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Khorinis_15_00");	//Hej, nejsi z Khorinisu?
	AI_Output(self,other,"DIA_Addon_Lucia_Khorinis_16_01");	//Nepřipomínej mi to místo! Můj život tam byl strašný.
	AI_Output(self,other,"DIA_Addon_Lucia_Khorinis_16_02");	//Podívej, byla to velká akce, když dorazila loď s novými odsouzenci.
	AI_Output(self,other,"DIA_Addon_Lucia_Khorinis_16_03");	//Ale tito ostatní chlapi... (směje se) Ne, díky. Možná proto, že jsme na ostrově. No dobrá, ty časy jsou pryč.
	if((MIS_LuciasLetter != 0) || (SC_KnowsLuciaCaughtByBandits != 0) || (Nadja_GaveLuciaInfo != 0))
	{
		AI_Output(self,other,"DIA_Addon_Lucia_Khorinis_16_06");	//Mluvila jsem s Elvrichem!
		AI_Output(other,self,"DIA_Addon_Lucia_Khorinis_15_04");	//Proč?
		AI_Output(self,other,"DIA_Addon_Lucia_Khorinis_16_05");	//Jaká zbabělost. Neudělal nic, když banditi přišli a zajali mě.
		TOPIC_END_Lucia = TRUE;
		B_GivePlayerXP(XP_Ambient);
	};
	TOPIC_END_Lucia = TRUE;
};


instance DIA_Addon_Lucia_Jetzt(C_Info)
{
	npc = BDT_1091_Addon_Lucia;
	nr = 2;
	condition = DIA_Addon_Lucia_Jetzt_Condition;
	information = DIA_Addon_Lucia_Jetzt_Info;
	permanent = FALSE;
	description = "A co plánuješ udělat nyní?";
};


func int DIA_Addon_Lucia_Jetzt_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Lucia_Khorinis))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Lucia_Jetzt_Info()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Jetzt_15_00");	//A co plánuješ udělat nyní?
	AI_Output(self,other,"DIA_Addon_Lucia_Jetzt_16_01");	//Uvidíme. Právě nyní mi vyhovuje být zde se Snafem, Fiskem a ostatními.
	AI_Output(self,other,"DIA_Addon_Lucia_Jetzt_16_02");	//Už jsi hovořil s Thorusem? (omdlívá) Ó bože, to je fakt chlap!
	AI_Output(self,other,"DIA_Addon_Lucia_Jetzt_16_03");	//(se smíchem) Promiň... zpět k tvojí otázce... Nemám žádný cíl, nechávám vše náhodě.
};


instance DIA_Addon_Lucia_Paladine(C_Info)
{
	npc = BDT_1091_Addon_Lucia;
	nr = 2;
	condition = DIA_Addon_Lucia_Paladine_Condition;
	information = DIA_Addon_Lucia_Paladine_Info;
	permanent = FALSE;
	description = "Nemáš moc v lásce paladiny, že?";
};


func int DIA_Addon_Lucia_Paladine_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Lucia_was))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Lucia_Paladine_Info()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Paladine_15_00");	//Nemáš moc v lásce paladiny, že?
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_16_01");	//Fanatické vrahy ovládané mágy Ohně? Ne.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_16_02");	//Tento lord Hagen a jeho nohsledi mají kontrolu nad městem a každým občanem.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_16_03");	//A to je to, co mě vůbec nezajímá. Nechci čekat U červené lucerny až mě zavřou.
	if((other.guild != GIL_SLD) && (other.guild != GIL_DJG) && (other.guild != GIL_KDW) && (other.guild != GIL_KDM) && (other.guild != GIL_SEK) && (other.guild != GIL_TPL) && (other.guild != GIL_GUR))
	{
		Info_ClearChoices(DIA_Addon_Lucia_Paladine);
		Info_AddChoice(DIA_Addon_Lucia_Paladine,"... (KONEC)",DIA_Addon_Lucia_Paladine_BACK);
		Info_AddChoice(DIA_Addon_Lucia_Paladine,"Paladinové nebojují ve jménu Innose. On si vybírá své válečníky sám.",DIA_Addon_Lucia_Paladine_WAHL);
		Info_AddChoice(DIA_Addon_Lucia_Paladine,"Paladinové jsou válečníci Innose, ne vrazi.",DIA_Addon_Lucia_Paladine_MURDER);
	};
};

func void DIA_Addon_Lucia_Paladine_BACK()
{
	Info_ClearChoices(DIA_Addon_Lucia_Paladine);
};

func void DIA_Addon_Lucia_Paladine_WAHL()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Paladine_WAHL_15_00");	//Paladinové nebojují ve jménu Innose. On si vybírá své válečníky sám.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_WAHL_16_01");	//Opravdu? Myslím, že lidé si vybírají svůj vlstní osud.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_WAHL_16_02");	//Nicméně, tvá slova mě překvapují. Mluvíš, jako bys byl jedním z nich.
	Info_AddChoice(DIA_Addon_Lucia_Paladine,"Už jsi někdy někoho zabila?",DIA_Addon_Lucia_Paladine_KILL);
};

func void DIA_Addon_Lucia_Paladine_KILL()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Paladine_KILL_15_00");	//Už jsi někdy někoho zabila?
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_KILL_16_01");	//Ne, a jsem docela ráda, že je to tak.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_KILL_16_02");	//Prosím, nemluvme už o takových věcech.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_KILL_16_03");	//Vychutnejme si pití a užijme každou chvilku, kterou nám bohové dali.
	Info_ClearChoices(DIA_Addon_Lucia_Paladine);
};

func void DIA_Addon_Lucia_Paladine_WEIB()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Paladine_WEIB_15_00");	//Ty chceš pošpinit jméno Innosovo, ženo?
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_WEIB_16_01");	//Jak to můžu udělat? To jsou muži, kteří dělají zlo v jeho jméně.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_WEIB_16_02");	//Já nicméně nepochybuji o Innosově božství.
};

func void DIA_Addon_Lucia_Paladine_MURDER()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Paladine_MURDER_15_00");	//Paladinové jsou Innosovi válečníci. Nejsou vrazi.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_MURDER_16_01");	//Opravdu? Jejich zbraně jsou poskvrněny krví stejně jako zbraně banditů a pirátů.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_MURDER_16_02");	//Jediným rozdílem je to, že oni to dělají ve jménu Innose. Ne proto, aby přežili.
	Info_AddChoice(DIA_Addon_Lucia_Paladine,"Ty chceš pošpinit jméno Innosovo, ženo?",DIA_Addon_Lucia_Paladine_WEIB);
};


instance DIA_Addon_Lucia_Attentat(C_Info)
{
	npc = BDT_1091_Addon_Lucia;
	nr = 9;
	condition = DIA_Addon_Lucia_Attentat_Condition;
	information = DIA_Addon_Lucia_Attentat_Info;
	permanent = FALSE;
	description = DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};


func int DIA_Addon_Lucia_Attentat_Condition()
{
	if(MIS_Judas == LOG_Running)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Lucia_Attentat_Info()
{
	B_Say(other,self,"$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output(self,other,"DIA_Addon_Lucia_Attentat_16_00");	//Nic.
};


instance DIA_Addon_Lucia_Trade(C_Info)
{
	npc = BDT_1091_Addon_Lucia;
	nr = 99;
	condition = DIA_Addon_Lucia_Trade_Condition;
	information = DIA_Addon_Lucia_Trade_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "Chci něco k pití.";
};


func int DIA_Addon_Lucia_Trade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Lucia_was))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Lucia_Trade_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Addon_Lucia_Trade_15_00");	//Chci něco k pití.
	B_GiveTradeInv(self);
};


instance DIA_Addon_Lucia_lernen(C_Info)
{
	npc = BDT_1091_Addon_Lucia;
	nr = 19;
	condition = DIA_Addon_Lucia_lernen_Condition;
	information = DIA_Addon_Lucia_lernen_Info;
	permanent = FALSE;
	description = "Je ještě něco, co mě můžeš naučit?";
};


func int DIA_Addon_Lucia_lernen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Lucia_Hi))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Lucia_lernen_Info()
{
	AI_Output(other,self,"DIA_Addon_Lucia_lernen_15_00");	//Je ještě něco, co mě můžeš naučit?
	AI_Output(self,other,"DIA_Addon_Lucia_lernen_16_01");	//(směje se) Určitě. Můžu ti pomoct zvýšit OBRATNOST.
	Log_CreateTopic(Topic_Addon_BDT_Teacher,LOG_NOTE);
	B_LogEntry(Topic_Addon_BDT_Teacher,"Lucia mi může zvýšit obratnost.");
};


instance DIA_Addon_Lucia_TEACH(C_Info)
{
	npc = BDT_1091_Addon_Lucia;
	nr = 101;
	condition = DIA_Addon_Lucia_TEACH_Condition;
	information = DIA_Addon_Lucia_TEACH_Info;
	permanent = TRUE;
	description = "Chci být obratnější.";
};


func int DIA_Addon_Lucia_TEACH_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Lucia_lernen))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Lucia_TEACH_Info()
{
	AI_Output(other,self,"DIA_Addon_Lucia_TEACH_15_00");	//Chci být obratnější.
	Info_ClearChoices(DIA_Addon_Lucia_TEACH);
	Info_AddChoice(DIA_Addon_Lucia_TEACH,Dialog_Back,DIA_Addon_Lucia_TEACH_BACK);
	Info_AddChoice(DIA_Addon_Lucia_TEACH,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Addon_Lucia_TEACH_1);
	Info_AddChoice(DIA_Addon_Lucia_TEACH,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Addon_Lucia_TEACH_5);
};

func void DIA_Addon_Lucia_TEACH_BACK()
{
	Info_ClearChoices(DIA_Addon_Lucia_TEACH);
};

func void DIA_Addon_Lucia_TEACH_1()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,T_MED);
	Info_ClearChoices(DIA_Addon_Lucia_TEACH);
	Info_AddChoice(DIA_Addon_Lucia_TEACH,Dialog_Back,DIA_Addon_Lucia_TEACH_BACK);
	Info_AddChoice(DIA_Addon_Lucia_TEACH,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Addon_Lucia_TEACH_1);
	Info_AddChoice(DIA_Addon_Lucia_TEACH,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Addon_Lucia_TEACH_5);
};

func void DIA_Addon_Lucia_TEACH_5()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,T_MED);
	Info_ClearChoices(DIA_Addon_Lucia_TEACH);
	Info_AddChoice(DIA_Addon_Lucia_TEACH,Dialog_Back,DIA_Addon_Lucia_TEACH_BACK);
	Info_AddChoice(DIA_Addon_Lucia_TEACH,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Addon_Lucia_TEACH_1);
	Info_AddChoice(DIA_Addon_Lucia_TEACH,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Addon_Lucia_TEACH_5);
};

