
instance DIA_MIGUEL_NW_EXIT(C_Info)
{
	npc = vlk_6026_miguel;
	nr = 999;
	condition = dia_miguel_nw_exit_condition;
	information = dia_miguel_nw_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_miguel_nw_exit_condition()
{
	return TRUE;
};

func void dia_miguel_nw_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MIGUEL_NW_PICKPOCKET(C_Info)
{
	npc = vlk_6026_miguel;
	nr = 900;
	condition = dia_miguel_nw_pickpocket_condition;
	information = dia_miguel_nw_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_miguel_nw_pickpocket_condition()
{
	return C_Beklauen(40,48);
};

func void dia_miguel_nw_pickpocket_info()
{
	Info_ClearChoices(dia_miguel_nw_pickpocket);
	Info_AddChoice(dia_miguel_nw_pickpocket,Dialog_Back,dia_miguel_nw_pickpocket_back);
	Info_AddChoice(dia_miguel_nw_pickpocket,DIALOG_PICKPOCKET,dia_miguel_nw_pickpocket_doit);
};

func void dia_miguel_nw_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_miguel_nw_pickpocket);
};

func void dia_miguel_nw_pickpocket_back()
{
	Info_ClearChoices(dia_miguel_nw_pickpocket);
};


instance DIA_MIGUEL_NW_HI(C_Info)
{
	npc = vlk_6026_miguel;
	nr = 1;
	condition = dia_miguel_nw_hi_condition;
	information = dia_miguel_nw_hi_info;
	permanent = FALSE;
	description = "CO tu děláš?";
};


func int dia_miguel_nw_hi_condition()
{
	return TRUE;
};

func void dia_miguel_nw_hi_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Miguel_NW_Hi_01_00");	//Co tu děláš?
	AI_Output(self,other,"DIA_Miguel_NW_Hi_01_01");	//Také bych se tě na to chtěl zeptat. Naposledy bandita v močálech a teď...

	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Miguel_NW_Hi_01_02");	//... ctihodný mág Ohně, před nímž se lidé klaní.
	}
	else if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Miguel_NW_Hi_01_03");	//... králův paladin, a prochází se zde jak ve svým domě.
	}
	else if(other.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Miguel_NW_Hi_01_04");	//... žoldák.
	}
	else if(other.guild == GIL_KDW)
	{
		AI_Output(self,other,"DIA_Miguel_NW_Hi_01_0A");	//... ctihodný mág Vody, před nímž se lidé klaní.
	}
	else if(other.guild == GIL_KDM)
	{
		AI_Output(self,other,"DIA_Miguel_NW_Hi_01_0B");	//... ach, vyvolávač démonů! (opatrně)
	}
	else if((other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR))
	{
		AI_Output(self,other,"DIA_Miguel_NW_Hi_01_0C");	//... sektář!
	};
	AI_Output(other,self,"DIA_Miguel_NW_Hi_01_05");	//No je to trochu prostší, v bažinách jsem měl jen jistý úkol.
	AI_Output(other,self,"DIA_Miguel_NW_Hi_01_06");	//A jsem, jak se ukázalo, ne? Jak jste se sem dostali?
	AI_Output(self,other,"DIA_Miguel_NW_Hi_01_07");	//Vše bylo jednoduché chlape. Piráti nás sem hodili výměnou za trávu z bažin.

	if(KILLHAPPENSMADE == FALSE)
	{
		AI_Output(self,other,"DIA_Miguel_NW_Hi_01_08");	//Teď jsme prodávali trávu Ignazovi a Constantinovi. Stáli o nás. Zákon - zákon a zboží k nim. A tam je nutno přijmout.
		AI_Output(other,self,"DIA_Miguel_NW_Hi_01_09");	//Jasný. Takže stačí jim prodat svou trávu?
		AI_Output(self,other,"DIA_Miguel_NW_Hi_01_10");	//Dokážeš zavzpomínat na staré... (smích)
	};
};

instance DIA_MIGUEL_NW_CITY(C_Info)
{
	npc = vlk_6026_miguel;
	nr = 2;
	condition = dia_miguel_nw_city_condition;
	information = dia_miguel_nw_city_info;
	permanent = TRUE;
	description = "A jak se ti tu žije?";
};


func int dia_miguel_nw_city_condition()
{
	if(Npc_KnowsInfo(other,dia_miguel_nw_hi))
	{
		return TRUE;
	};
};

func void dia_miguel_nw_city_info()
{
	AI_Output(other,self,"DIA_Miguel_NW_City_15_00");	//A jak se ti tu žije? Tady jsi žil předtím?
	AI_Output(self,other,"DIA_Miguel_NW_City_11_01");	//Ano, ale teď už Khorinis není vůbec to samé.
	AI_Output(self,other,"DIA_Miguel_NW_City_11_02");	//Umíš si to představit, rušný přístav, námořníci ze všech koutů světa?
	AI_Output(self,other,"DIA_Miguel_NW_City_11_03");	//Plno obchodníků, zboží, zlaté třpytky. Pašovaná ruda tady vytvářela zázraky.
	AI_Output(self,other,"DIA_Miguel_NW_City_11_04");	//Eeeh... jak se život otočil.
};


instance DIA_MIGUEL_NW_TRADE(C_Info)
{
	npc = vlk_6026_miguel;
	nr = 775;
	condition = dia_miguel_nw_trade_condition;
	information = dia_miguel_nw_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Pojďme obchodovat.";
};


func int dia_miguel_nw_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_miguel_nw_hi))
	{
		return TRUE;
	};
};

func void dia_miguel_nw_trade_info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	B_Say(other,self,"$TRADE_1");
	B_GiveTradeInv(self);
};
