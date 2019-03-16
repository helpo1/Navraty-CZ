
instance DIA_TOM_NW_EXIT(C_Info)
{
	npc = vlk_6025_tom;
	nr = 999;
	condition = dia_tom_nw_exit_condition;
	information = dia_tom_nw_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_tom_nw_exit_condition()
{
	return TRUE;
};

func void dia_tom_nw_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TOM_NW_PICKPOCKET(C_Info)
{
	npc = vlk_6025_tom;
	nr = 900;
	condition = dia_tom_nw_pickpocket_condition;
	information = dia_tom_nw_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_tom_nw_pickpocket_condition()
{
	return C_Beklauen(60,90);
};

func void dia_tom_nw_pickpocket_info()
{
	Info_ClearChoices(dia_tom_nw_pickpocket);
	Info_AddChoice(dia_tom_nw_pickpocket,Dialog_Back,dia_tom_nw_pickpocket_back);
	Info_AddChoice(dia_tom_nw_pickpocket,DIALOG_PICKPOCKET,dia_tom_nw_pickpocket_doit);
};

func void dia_tom_nw_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_tom_nw_pickpocket);
};

func void dia_tom_nw_pickpocket_back()
{
	Info_ClearChoices(dia_tom_nw_pickpocket);
};


instance DIA_TOM_NW_HI(C_Info)
{
	npc = vlk_6025_tom;
	nr = 1;
	condition = dia_tom_nw_hi_condition;
	information = dia_tom_nw_hi_info;
	permanent = FALSE;
	description = "Zdravím.";
};


func int dia_tom_nw_hi_condition()
{
	return TRUE;
};

func void dia_tom_nw_hi_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Tom_NW_Hi_01_00");	//Zdravím.
	AI_Output(self,other,"DIA_Tom_NW_Hi_01_01");	//O! Kde se tu bereš?
	AI_Output(other,self,"DIA_Tom_NW_Hi_01_02");	//Neměl by ses ptát, odkud jsem se tu objevil já. Lepší otázka je spíše - kde ses tu vzal?!
	AI_Output(other,self,"DIA_Tom_NW_Hi_01_03");	//Jako ti kluci předtím - přicházíš s piráty?
	AI_Output(self,other,"DIA_Tom_NW_Hi_01_04");	//Ano, pokud víš všechno, tak proč se ptáš?
	AI_Output(other,self,"DIA_Tom_NW_Hi_01_06");	//Co nového v Khorinisu?
	AI_Output(self,other,"DIA_Tom_NW_Hi_01_07");	//No, je to lepší než na místě kde jsem se nedávno zasekl. A mouchy se každý den jíst také nemusí, i práce je, aby se nudou neumřelo.
	AI_Output(other,self,"DIA_Tom_NW_Hi_01_08");	//Co to je za práci?
	AI_Output(self,other,"DIA_Tom_NW_Hi_01_09");	//Pracuji pro Mattea, místního obchodníka.
	AI_Output(other,self,"DIA_Tom_NW_Hi_01_10");	//U Mattea?! Ty pracuješ pro Mattea? A jak tě proboha přijmul?!
	AI_Output(self,other,"DIA_Tom_NW_Hi_01_11");	//No, hodně jsem načetl co se týče účetních knih, takže něco vím. A on zrovna potřeboval takového člověka.
	AI_Output(self,other,"DIA_Tom_NW_Hi_01_12");	//Konec řečí, mám práci.
};


instance DIA_TOM_NW_CITY(C_Info)
{
	npc = vlk_6025_tom;
	nr = 2;
	condition = dia_tom_nw_city_condition;
	information = dia_tom_nw_city_info;
	permanent = TRUE;
	description = "Jak je?";
};


func int dia_tom_nw_city_condition()
{
	if(Npc_KnowsInfo(other,dia_tom_nw_hi))
	{
		return TRUE;
	};
};

func void dia_tom_nw_city_info()
{
	AI_Output(other,self,"DIA_Tom_NW_City_01_00");	//Jak je?
	AI_Output(self,other,"DIA_Tom_NW_City_01_01");	//Dobře! Není si na co stěžovat.
};

