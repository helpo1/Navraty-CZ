
instance DIA_GornOW_EXIT(C_Info)
{
	npc = PC_Fighter_OW;
	nr = 999;
	condition = DIA_GornOW_EXIT_Condition;
	information = DIA_GornOW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_GornOW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_GornOW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GornOW_Hello(C_Info)
{
	npc = PC_Fighter_OW;
	nr = 2;
	condition = DIA_GornOW_Hello_Condition;
	information = DIA_GornOW_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_GornOW_Hello_Condition()
{
	return TRUE;
};

func void DIA_GornOW_Hello_Info()
{
	var C_Npc Milten;
	Milten = Hlp_GetNpc(PC_Mage_OW);
	AI_Output(other,self,"DIA_GornOW_Hello_15_00");	//Konec s tady tím flákáním - jsi volný!
	AI_Output(self,other,"DIA_GornOW_Hello_12_01");	//Už bylo na čase, aby mě odsud někdo dostal.
	AI_Output(self,other,"DIA_GornOW_Hello_12_02");	//Ale nepočítal jsem s tebou. Jsem pekelně rád, že tě vidím!
	AI_Output(other,self,"DIA_GornOW_Hello_15_03");	//Garond říkal, že moc jíš a on už tě nemůže živit.
	AI_Output(self,other,"DIA_GornOW_Hello_12_04");	//Když už o tom mluvíš, dal bych si pár piv. Pojďme odsud, tuhle celu už mám okoukanou.
	AI_Output(other,self,"DIA_GornOW_Hello_15_05");	//Dobře, uvidíme se u Miltena.
	AI_Output(self,other,"DIA_GornOW_Hello_12_06");	//Jistě.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FREE");
	B_StartOtherRoutine(Milten,"GORNFREE");
	MIS_RescueGorn = LOG_SUCCESS;
	B_GivePlayerXP(XP_RescueGorn);
};


instance DIA_GornOW_MetMilten(C_Info)
{
	npc = PC_Fighter_OW;
	nr = 2;
	condition = DIA_GornOW_MetMilten_Condition;
	information = DIA_GornOW_MetMilten_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_GornOW_MetMilten_Condition()
{
	if((MIS_RescueGorn == LOG_SUCCESS) && (Npc_GetDistToWP(self,"OC_MAGE_LIBRARY_IN") <= 500) && Npc_IsInState(self,ZS_Talk) && (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_GornOW_MetMilten_Info()
{
	AI_Output(self,other,"DIA_GornOW_MetMilten_12_00");	//Poslouchej - mám dost tady toho poflakování. Je načase vidět něco jíného, než toto údolí.
	AI_Output(self,other,"DIA_GornOW_MetMilten_12_01");	//Jak ses dostal přes průsmyk?
	AI_Output(other,self,"DIA_GornOW_MetMilten_15_02");	//Vede tam stezka přes opuštěný důl.
	AI_Output(self,other,"DIA_GornOW_MetMilten_12_03");	//Dobře. Počkám na vhodnou chvíli a pak to tady zabalím.
	if(other.guild != GIL_SLD)
	{
		AI_Output(other,self,"DIA_GornOW_MetMilten_15_04");	//Kam potom půjdeš?
		AI_Output(self,other,"DIA_GornOW_MetMilten_12_05");	//Zaslechl jsem, že je Lee naživu. Chci se k němu znovu připojit.
	}
	else
	{
		AI_Output(other,self,"DIA_GornOW_MetMilten_15_06");	//Tak běž na Onarovu farmu. Je tam Lee a jeho hoši. Potřebuje dobré muže, jako jsi ty.
		AI_Output(self,other,"DIA_GornOW_MetMilten_12_07");	//Udělám to. Podívám se, jak se jim tam vede.
	};
};


instance DIA_GornOW_SeeYou(C_Info)
{
	npc = PC_Fighter_OW;
	nr = 900;
	condition = DIA_GornOW_SeeYou_Condition;
	information = DIA_GornOW_Seeyou_Info;
	permanent = TRUE;
	description = "Ještě se setkáme.";
};


func int DIA_GornOW_SeeYou_Condition()
{
	if(Npc_KnowsInfo(other,DIA_GornOW_MetMilten) && (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_GornOW_Seeyou_Info()
{
	AI_Output(other,self,"DIA_GornOW_SeeYou_15_00");	//Ještě se setkáme.
	AI_Output(self,other,"DIA_GornOW_SeeYou_12_01");	//S tím můžeš počítat.
	AI_StopProcessInfos(self);
};

