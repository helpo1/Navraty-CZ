
instance DIA_ADDON_GREG_BF_EXIT(C_Info)
{
	npc = pir_13200_addon_greg;
	nr = 999;
	condition = dia_addon_greg_bf_exit_condition;
	information = dia_addon_greg_bf_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_addon_greg_bf_exit_condition()
{
	return TRUE;
};

func void dia_addon_greg_bf_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_GREG_BF_PICKPOCKET(C_Info)
{
	npc = pir_13200_addon_greg;
	nr = 900;
	condition = dia_addon_greg_bf_pickpocket_condition;
	information = dia_addon_greg_bf_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_addon_greg_bf_pickpocket_condition()
{
	return C_Beklauen(111,666);
};

func void dia_addon_greg_bf_pickpocket_info()
{
	Info_ClearChoices(dia_addon_greg_bf_pickpocket);
	Info_AddChoice(dia_addon_greg_bf_pickpocket,Dialog_Back,dia_addon_greg_bf_pickpocket_back);
	Info_AddChoice(dia_addon_greg_bf_pickpocket,DIALOG_PICKPOCKET,dia_addon_greg_bf_pickpocket_doit);
};

func void dia_addon_greg_bf_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_addon_greg_bf_pickpocket);
};

func void dia_addon_greg_bf_pickpocket_back()
{
	Info_ClearChoices(dia_addon_greg_bf_pickpocket);
};


instance DIA_ADDON_GREG_BF_ARMOR(C_Info)
{
	npc = pir_13200_addon_greg;
	nr = 5;
	condition = dia_addon_greg_bf_armor_condition;
	information = dia_addon_greg_bf_armor_info;
	permanent = FALSE;
	description = "Není ti ta zbroj trochu těsná?";
};


func int dia_addon_greg_bf_armor_condition()
{
	return TRUE;
};

func void dia_addon_greg_bf_armor_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_BF_Armor_01_00");	//Není ti ta zbroj trochu těsná?
	AI_Output(self,other,"DIA_Addon_Greg_BF_Armor_01_01");	//Jen se směj, blbečku... (ironicky) Ne dali mi přesně moji velikost.
	AI_Output(self,other,"DIA_Addon_Greg_BF_Armor_01_02");	//A díky, že jsi mě přesvědčil, abychom pomohli paladinům.
	AI_Output(self,other,"DIA_Addon_Greg_BF_Armor_01_03");	//Teď se můžeme pořádně nadlábnout a v kapsách nám budou cinkat nějaký zlaťáky.
	AI_Output(self,other,"DIA_Addon_Greg_BF_Armor_01_04");	//(nešťastně) I když, teď budeme muset bojovat proti skřetům.
	AI_Output(self,other,"DIA_Addon_Greg_BF_Armor_01_05");	//(šklebí se) Ale myslím, že to nějak zvládnem... Díky.
};


instance DIA_ADDON_GREG_BF_HOW(C_Info)
{
	npc = pir_13200_addon_greg;
	nr = 5;
	condition = dia_addon_greg_bf_how_condition;
	information = dia_addon_greg_bf_how_info;
	permanent = FALSE;
	description = "Co se děje?";
};


func int dia_addon_greg_bf_how_condition()
{
	return TRUE;
};

func void dia_addon_greg_bf_how_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_BF_How_01_00");	//Co se děje?
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
};


instance DIA_ADDON_GREG_BF_CAPITAN(C_Info)
{
	npc = pir_13200_addon_greg;
	nr = 5;
	condition = dia_addon_greg_bf_capitan_condition;
	information = dia_addon_greg_bf_capitan_info;
	permanent = FALSE;
	description = "Takže teď jsi kapitánem královské galéry?";
};


func int dia_addon_greg_bf_capitan_condition()
{
	if((GREGISCAPITAN == TRUE) && (SHIPAGAINACCESS == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_greg_bf_capitan_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Addon_Greg_BF_Capitan_01_00");	//Takže teď jsi kapitánem královské galéry.?
	AI_Output(self,other,"DIA_Addon_Greg_BF_Capitan_01_01");	//(důležitě) Jo! Lord Hagen mi dal tuhle hodnost.
	AI_Output(self,other,"DIA_Addon_Greg_BF_Capitan_01_02");	//Ve skutečnosti neměl moc na výběr. Slíbil nám přece loď.
	AI_Output(other,self,"DIA_Addon_Greg_BF_Capitan_01_03");	//A očividně svůj slib dodržel.
	AI_Output(self,other,"DIA_Addon_Greg_BF_Capitan_01_04");	//(usmívá se) Očividně... I když, není to přesně podle mého gusta.
	AI_Output(self,other,"DIA_Addon_Greg_BF_Capitan_01_05");	//Proč se vlastně ptáš?
	AI_Output(other,self,"DIA_Addon_Greg_BF_Capitan_01_06");	//Potřebuji se co nejdřív dostat na pevninu. Musím mluvit s tamějšími paladiny.
	AI_Output(self,other,"DIA_Addon_Greg_BF_Capitan_01_07");	//(šťastně) Konečně! Už jsem se bál, že tady shnijem.
	AI_Output(self,other,"DIA_Addon_Greg_BF_Capitan_01_08");	//Kdy máme zvednout kotvu?
	AI_Output(other,self,"DIA_Addon_Greg_BF_Capitan_01_09");	//Co nejdřív.
	AI_Output(self,other,"DIA_Addon_Greg_BF_Capitan_01_10");	//(rozhodně) Tak to abych šel připravit loď.
	AI_Output(self,other,"DIA_Addon_Greg_BF_Capitan_01_11");	//Ale nezapomeň, že sami tu loď neuřídíme. Budeme potřebovat další lidi.
	AI_Output(self,other,"DIA_Addon_Greg_BF_Capitan_01_12");	//Minimálně tak pět šest lidí ještě užijeme.
	AI_Output(other,self,"DIA_Addon_Greg_BF_Capitan_01_13");	//Dobře, nějaké najdu.
	AI_Output(self,other,"DIA_Addon_Greg_BF_Capitan_01_14");	//(usmívá se) Takže se sejdem na lodi.
	B_LogEntry(TOPIC_SALETOBIGLAND,"Greg je teď mým kapitánem. Nicméně, potřebuji sehnat více lidí, abychom se mohli plavit. Podle Grega by mohlo stačit 5-6 lidí.");
	WHOTRAVELONBIGLAND = TRUE;
	b_piratemoveonboard();
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_GREG_BF_TRAVELONBIGLAND(C_Info)
{
	npc = pir_13200_addon_greg;
	nr = 1;
	condition = dia_addon_greg_bf_travelonbigland_condition;
	information = dia_addon_greg_bf_travelonbigland_info;
	permanent = TRUE;
	description = "Je loď připravena?";
};


func int dia_addon_greg_bf_travelonbigland_condition()
{
	if((GREGISCAPITAN == TRUE) && (SHIPAGAINACCESS == TRUE) && (WHOTRAVELONBIGLAND == TRUE) && (COUNTTRAVELONBIGLAND > 0) && (ALLSAYGOODBUY == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_greg_bf_travelonbigland_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_BF_TravelOnBigLand_01_00");	//Je loď připravena?

	if(COUNTTRAVELONBIGLAND >= 5)
	{
		B_GivePlayerXP(1000);
		AI_Output(self,other,"DIA_Addon_Greg_BF_TravelOnBigLand_01_01");	//To vskutku je. (usmívá se) Vše je tak jak má.
		AI_Output(other,self,"DIA_Addon_Greg_BF_TravelOnBigLand_01_02");	//Nuže, je načase odplout.
		AI_Output(self,other,"DIA_Addon_Greg_BF_TravelOnBigLand_01_03");	//Jseš si jistej, že to chceš?
		AI_Output(other,self,"DIA_Addon_Greg_BF_TravelOnBigLand_01_04");	//Ano, čas se krátí.
		AI_Output(self,other,"DIA_Addon_Greg_BF_TravelOnBigLand_01_05");	//(vážně)Ať je tedy po tvým.
		AI_TurnToNPC(self,DiegoNW);
		AI_Output(self,other,"DIA_Addon_Greg_BF_TravelOnBigLand_01_06");	//... (křičí) Hej, vy suchozemský krysy! Všichni na místa!
		AI_Output(self,other,"DIA_Addon_Greg_BF_TravelOnBigLand_01_07");	//... (křičí) Zvedněte kotvu, rozlučte se tady s tím a vyplouváme!
		AI_Output(self,other,"DIA_Addon_Greg_BF_TravelOnBigLand_01_08");	//... (křičí) Napněte plachty! A plnou parou vpřed!
		ALLSAYGOODBUY = TRUE;
		MIS_SALETOBIGLAND = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_SALETOBIGLAND,LOG_SUCCESS);
		B_LogEntry(TOPIC_SALETOBIGLAND,"Opouštíme Khorinis a vyplouváme směrem na pevninu. Ani bohové neví, co nás tam čeká.");
		Info_ClearChoices(dia_addon_greg_bf_travelonbigland);
		Info_AddChoice(dia_addon_greg_bf_travelonbigland,Dialog_Ende,dia_addon_greg_bf_travelonbigland_ok);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Greg_BF_TravelOnBigLand_01_09");	//To vskutku je. (usmívá se) Vše je tak jak má.
	};
};

func void dia_addon_greg_bf_travelonbigland_ok()
{
	//AI_StopProcessInfos(self);
	b_end_avi();
};

