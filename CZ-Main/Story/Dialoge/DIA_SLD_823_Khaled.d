
instance DIA_Khaled_EXIT(C_Info)
{
	npc = SLD_823_Khaled;
	nr = 999;
	condition = DIA_Khaled_EXIT_Condition;
	information = DIA_Khaled_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Khaled_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Khaled_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


var int Khaled_weiter;

instance DIA_Khaled_Hallo(C_Info)
{
	npc = SLD_823_Khaled;
	nr = 1;
	condition = DIA_Khaled_Hallo_Condition;
	information = DIA_Khaled_Hallo_Info;
	permanent = TRUE;
	description = "Jsi v pořádku?";
};

func int DIA_Khaled_Hallo_Condition()
{
	if(Khaled_weiter == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Khaled_Hallo_Info()
{
	AI_Output(other,self,"DIA_Khaled_Hallo_15_00");	//Jsi v pořádku?

	if(Npc_KnowsInfo(other,DIA_Lee_WannaJoin))
	{
		AI_Output(self,other,"DIA_Khaled_Hallo_11_01");	//Tak co, chceš se k nám tedy přidat? Máš aspoň nějakou zbraň?
		Khaled_weiter = TRUE;
		Log_CreateTopic(Topic_SoldierTrader,LOG_NOTE);
		B_LogEntry(Topic_SoldierTrader,"Khaled obchoduje se zbraněmi.");
	}
	else
	{
		AI_Output(self,other,"DIA_Khaled_Hallo_11_02");	//Jestli je to důležité, promluv si s Leem. Jinak mi dej pokoj.
		AI_StopProcessInfos(self);
	};
};

instance DIA_Khaled_TRADE(C_Info)
{
	npc = SLD_823_Khaled;
	nr = 700;
	condition = DIA_Khaled_TRADE_Condition;
	information = DIA_Khaled_TRADE_Info;
	permanent = TRUE;
	description = "Jaké zbraně mi můžeš nabídnout?";
	trade = TRUE;
};

func int DIA_Khaled_TRADE_Condition()
{
	if((Khaled_weiter == TRUE) && Wld_IsTime(7,55,23,55))
	{
		return TRUE;
	};
};

func void DIA_Khaled_TRADE_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Khaled_TRADE_15_00");	//Jaké zbraně mi můžeš nabídnout?

	if((Khaled_Trade_OneTime == FALSE) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		CreateInvItems(self,ItMw_1h_Sld_Sword_New,1);
		CreateInvItems(self,ItMw_2h_Sld_Sword,1);
		CreateInvItems(self,ItMw_1h_Sld_Axe,1);
		CreateInvItems(self,ItMw_Bartaxt,1);
		CreateInvItems(self,ItMw_Doppelaxt,1);
		CreateInvItems(self,ItMw_2h_Sld_Axe,1);
		CreateInvItems(self,ItMw_Streitaxt1,1);
		CreateInvItems(self,ITMW_2H_G3A_ORCAXE_02,1);
		CreateInvItems(self,ItMw_Streitaxt2,1);
		CreateInvItems(self,ItMw_Streitaxt3,1);
		CreateInvItems(self,ItMw_Kriegshammer1,1);
		CreateInvItems(self,ItMw_Kriegshammer2,1);
		CreateInvItems(self,ItMw_2H_Warhammer,1);
		CreateInvItems(self,ItRw_Bow_H_01,1);
		CreateInvItems(self,ItRw_Bow_H_02,1);
		CreateInvItems(self,ItRw_Bow_H_03,1);
		CreateInvItems(self,ItRw_Bow_H_04,1);
		CreateInvItems(self,ItRw_Crossbow_M_01,1);
		CreateInvItems(self,ItRw_Arrow,100);
		CreateInvItems(self,ItRw_Bolt,50);
		CreateInvItems(self,ItBE_Addon_SLD_01,1);
		CreateInvItems(self,ItBE_Addon_SLD_02,1);
		CreateInvItems(self,ItBE_Addon_SLD_03,1);
		Khaled_Trade_OneTime = TRUE;
		AI_Output(self,other,"DIA_Khaled_TRADE_11_01");	//Jenom ty nejlepší, jen si je prohlídni.
	};

	B_GiveTradeInv(self);
};


instance DIA_Khaled_WannaJoin(C_Info)
{
	npc = SLD_823_Khaled;
	nr = 10;
	condition = DIA_Khaled_WannaJoin_Condition;
	information = DIA_Khaled_WannaJoin_Info;
	permanent = TRUE;
	description = "Nevadilo by ti, kdybych se k vám přidal?";
};


func int DIA_Khaled_WannaJoin_Condition()
{
	if((Khaled_weiter == TRUE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Khaled_WannaJoin_Info()
{
	AI_Output(other,self,"DIA_Khaled_WannaJoin_15_00");	//Nevadilo by ti, kdybych se k vám přidal?
	AI_Output(self,other,"DIA_Khaled_WannaJoin_11_01");	//Jestli jsi prošel zkouškou, klidně se za tebe přimluvím.
	if((MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS) || (MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS))
	{
		AI_Output(other,self,"DIA_Khaled_WannaJoin_15_02");	//Už jsem všechno splnil.
		AI_Output(self,other,"DIA_Khaled_WannaJoin_11_03");	//No, tak je to teda v cajku.
	};
};


instance DIA_Khaled_Woher(C_Info)
{
	npc = SLD_823_Khaled;
	nr = 3;
	condition = DIA_Khaled_Woher_Condition;
	information = DIA_Khaled_Woher_Info;
	permanent = FALSE;
	description = "Jak ses dostal k žoldákům?";
};


func int DIA_Khaled_Woher_Condition()
{
	if(Khaled_weiter == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Khaled_Woher_Info()
{
	AI_Output(other,self,"DIA_Khaled_Woher_15_00");	//Jak ses dostal k žoldákům?
	AI_Output(self,other,"DIA_Khaled_Woher_11_01");	//Přišel jsem z jihu spolu se Sylviem. Patřili jsme k žoldácké armádě, která bojovala proti skřetům.
};


instance DIA_Khaled_AboutSylvio(C_Info)
{
	npc = SLD_823_Khaled;
	nr = 4;
	condition = DIA_Khaled_AboutSylvio_Condition;
	information = DIA_Khaled_AboutSylvio_Info;
	permanent = FALSE;
	description = "Co si myslíš o Sylviovi?";
};


func int DIA_Khaled_AboutSylvio_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Khaled_Woher))
	{
		return TRUE;
	};
};

func void DIA_Khaled_AboutSylvio_Info()
{
	AI_Output(other,self,"DIA_Khaled_AboutSylvio_15_00");	//Co si myslíš o Sylviovi?
	AI_Output(self,other,"DIA_Khaled_AboutSylvio_11_01");	//Je to nebezpečný chlápek! A spousta žoldáků, co přišla s ním, ho pořád poslouchá. Radši by ses s ním neměl pouštět do křížku.
};


instance DIA_Khaled_AboutLee(C_Info)
{
	npc = SLD_823_Khaled;
	nr = 5;
	condition = DIA_Khaled_AboutLee_Condition;
	information = DIA_Khaled_AboutLee_Info;
	permanent = FALSE;
	description = "Jaký máš názor na Leeho?";
};


func int DIA_Khaled_AboutLee_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Khaled_Woher))
	{
		return TRUE;
	};
};

func void DIA_Khaled_AboutLee_Info()
{
	AI_Output(other,self,"DIA_Khaled_AboutLee_15_00");	//Jaký máš názor na Leeho?
	AI_Output(self,other,"DIA_Khaled_AboutLee_11_01");	//Myslím, že jedině Lee se opravdu stará, abychom se dostali z tohohle ostrova.
	AI_Output(self,other,"DIA_Khaled_AboutLee_11_02");	//Chce se vydat na pevninu, ale nejspíš si tu chce ještě s někým něco vyřídit...
	AI_Output(self,other,"DIA_Khaled_AboutLee_11_03");	//V každém případě dělá svou práci daleko líp, než by to kdy dokázal Sylvio.
	AI_Output(self,other,"DIA_Khaled_AboutLee_11_04");	//Krom toho je to dobrý vůdce. Většinou si tu můžeme dělat, co chceme.
};


instance DIA_Khaled_PICKPOCKET(C_Info)
{
	npc = SLD_823_Khaled;
	nr = 900;
	condition = DIA_Khaled_PICKPOCKET_Condition;
	information = DIA_Khaled_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Khaled_PICKPOCKET_Condition()
{
	return C_Beklauen(78,85);
};

func void DIA_Khaled_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Khaled_PICKPOCKET);
	Info_AddChoice(DIA_Khaled_PICKPOCKET,Dialog_Back,DIA_Khaled_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Khaled_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Khaled_PICKPOCKET_DoIt);
};

func void DIA_Khaled_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Khaled_PICKPOCKET);
};

func void DIA_Khaled_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Khaled_PICKPOCKET);
};

