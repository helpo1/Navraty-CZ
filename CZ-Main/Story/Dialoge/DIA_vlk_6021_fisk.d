
instance DIA_FISK_NW_EXIT(C_Info)
{
	npc = vlk_6021_fisk;
	nr = 999;
	condition = dia_fisk_nw_exit_condition;
	information = dia_fisk_nw_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_fisk_nw_exit_condition()
{
	return TRUE;
};

func void dia_fisk_nw_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_FISK_NW_PICKPOCKET(C_Info)
{
	npc = vlk_6021_fisk;
	nr = 900;
	condition = dia_fisk_nw_pickpocket_condition;
	information = dia_fisk_nw_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_fisk_nw_pickpocket_condition()
{
	return C_Beklauen(120,500);
};

func void dia_fisk_nw_pickpocket_info()
{
	Info_ClearChoices(dia_fisk_nw_pickpocket);
	Info_AddChoice(dia_fisk_nw_pickpocket,Dialog_Back,dia_fisk_nw_pickpocket_back);
	Info_AddChoice(dia_fisk_nw_pickpocket,DIALOG_PICKPOCKET,dia_fisk_nw_pickpocket_doit);
};

func void dia_fisk_nw_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_fisk_nw_pickpocket);
};

func void dia_fisk_nw_pickpocket_back()
{
	Info_ClearChoices(dia_fisk_nw_pickpocket);
};


instance DIA_FISK_NW_HI(C_Info)
{
	npc = vlk_6021_fisk;
	nr = 1;
	condition = dia_fisk_nw_hi_condition;
	information = dia_fisk_nw_hi_info;
	permanent = FALSE;
	description = "Nevěřím svým očím!";
};


func int dia_fisk_nw_hi_condition()
{
	return TRUE;
};

func void dia_fisk_nw_hi_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Fisk_NW_Hi_01_00");	//Nevěřím svým očím! Fisku, jak ses sem dostal?
	AI_Output(self,other,"DIA_Fisk_NW_Hi_01_01");	//Divná otázka od někoho, kdo mizí z místa na místo.
	AI_Output(other,self,"DIA_Fisk_NW_Hi_01_03");	//A jak ses dostal přes stráže?!
	AI_Output(self,other,"DIA_Fisk_NW_Hi_01_04");	//No, dohodnout se umím vždy... Učinil jsem nabídku, kterou nemohli odmítnout...(směje se)
	AI_Output(self,other,"DIA_Fisk_NW_Hi_01_05");	//... a myslím, že mě chápeš...

	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Fisk_NW_Hi_01_06");	//... To je poprvé, co vidím banditu, který se stal mágem Ohně!
	}
	else if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Fisk_NW_Hi_01_07");	//Vypadá to, že paladinové začali do služeb přijímat bandity!
	}
	else if(other.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Fisk_NW_Hi_01_08");	//... Takže ty jsi žoldák - to není špatné na bývalého banditu!
	}
	else if(other.guild == GIL_KDW)
	{
		AI_Output(self,other,"DIA_Fisk_NW_Hi_01_0A");	//... To je snad poprvé, co se bandita stal mágem Vody!
	}
	else if(other.guild == GIL_KDM)
	{
		AI_Output(self,other,"DIA_Fisk_NW_Hi_01_0B");	//... Bandita se může stát nekromantem! Zajímavé...(udiveně)
	}
	else if((other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR))
	{
		AI_Output(self,other,"DIA_Fisk_NW_Hi_01_0C");	//... Ty jsi stihl vstoupit do sekty? Zajímavé...(udiveně)
	};

	AI_Output(other,self,"DIA_Fisk_NW_Hi_01_09");	//Není to tak jednoduché... V těch bažinách... Už tehdy jsem nebyl bandita...
	AI_Output(self,other,"DIA_Fisk_NW_Hi_01_10");	//No, to je přece jedno. V bažinách jsi mi pomohl, ne?
	AI_Output(other,self,"DIA_Fisk_NW_Hi_01_11");	//Jo a zrovna špatně sis pak nevedl!
	AI_Output(self,other,"DIA_Fisk_NW_Hi_01_12");	//No, je pravda, že jsem si sehnal dostatek kapitálu, abych si zde mohl otevřít stánek.
	AI_Output(other,self,"DIA_Fisk_NW_Hi_01_13");	//Ostatním obchodníkům to nevadí?
	AI_Output(self,other,"DIA_Fisk_NW_Hi_01_14");	//No, někteří se ješte rozmýšlí, ale myslím, že ne!
	AI_Output(self,other,"DIA_Fisk_NW_Hi_01_15");	//Navíc, tohle místo je velká obchodní zóna, určitě tu pro mě místo bude.
	AI_Output(self,other,"DIA_Fisk_NW_Hi_01_16");	//Budu ale muset pracovat o trochu více, než ostatní obchodníci...
	AI_Output(other,self,"DIA_Fisk_NW_Hi_01_17");	//Můžeš mi prodat něco zajímavého?
	AI_Output(self,other,"DIA_Fisk_NW_Hi_01_18");	//Jen si vyber.
};

instance DIA_FISK_NW_TRADE(C_Info)
{
	npc = vlk_6021_fisk;
	nr = 775;
	condition = dia_fisk_nw_trade_condition;
	information = dia_fisk_nw_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Pojďme obchodovat.";
};

func int dia_fisk_nw_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_fisk_nw_hi) && Wld_IsTime(5,10,21,30))
	{
		return TRUE;
	};
};

func void dia_fisk_nw_trade_info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	B_Say(other,self,"$TRADE_1");
	B_GiveTradeInv(self);
};


