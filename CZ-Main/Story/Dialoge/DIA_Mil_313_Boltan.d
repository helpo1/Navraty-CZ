
instance DIA_Boltan_EXIT(C_Info)
{
	npc = Mil_313_Boltan;
	nr = 999;
	condition = DIA_Boltan_EXIT_Condition;
	information = DIA_Boltan_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Boltan_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Boltan_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Boltan_PICKPOCKET(C_Info)
{
	npc = Mil_313_Boltan;
	nr = 998;
	condition = DIA_Boltan_PICKPOCKET_Condition;
	information = DIA_Boltan_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int DIA_Boltan_PICKPOCKET_Condition()
{
	return C_Beklauen(18,10);
};

func void DIA_Boltan_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Boltan_PICKPOCKET);
	Info_AddChoice(DIA_Boltan_PICKPOCKET,Dialog_Back,DIA_Boltan_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Boltan_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Boltan_PICKPOCKET_DoIt);
};

func void DIA_Boltan_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Boltan_PICKPOCKET);
};

func void DIA_Boltan_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Boltan_PICKPOCKET);
};

instance DIA_Boltan_HALLO(C_Info)
{
	npc = Mil_313_Boltan;
	nr = 1;
	condition = DIA_Boltan_HALLO_Condition;
	information = DIA_Boltan_HALLO_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Boltan_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Boltan_HALLO_Info()
{
	AI_Output(self,other,"DIA_Boltan_Add_05_00");	//Co tady chceš?
};


instance DIA_Boltan_ToConvicts(C_Info)
{
	npc = Mil_313_Boltan;
	nr = 2;
	condition = DIA_Boltan_ToConvicts_Condition;
	information = DIA_Boltan_ToConvicts_Info;
	permanent = TRUE;
	description = "Chtěl bych vidět vězně.";
};


func int DIA_Boltan_ToConvicts_Condition()
{
	return TRUE;
};

func void DIA_Boltan_ToConvicts_Info()
{
	AI_Output(other,self,"DIA_Boltan_Add_15_01");	//Chtěl bych vidět vězně.
	if((Kapitel == 3) && (MIS_RescueBennet != LOG_SUCCESS))
	{
		if(other.guild == GIL_SLD)
		{
			AI_Output(self,other,"DIA_Boltan_Add_05_07");	//Jasan, jen běž a rozluč se se svým kamarádíčkem.
		}
		else
		{
			AI_Output(self,other,"DIA_Boltan_Add_05_06");	//Zabásli jsme tu svini, co zavraždila paladina Lothara.
		};
	}
	else if(((Canthar_Ausgeliefert == FALSE) || (Canthar_WiederRaus == TRUE)) && (Sarah_Ausgeliefert == FALSE) && (Rengaru_Ausgeliefert == FALSE) && (Nagur_Ausgeliefert == FALSE) && (CANTHAR_AUSGELIEFERT2 == FALSE))
	{
		AI_Output(self,other,"DIA_Boltan_Add_05_02");	//Všechny cely jsou momentálně prázdné.
	}
	else if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Boltan_Add_05_04");	//Dobrá, kámo.
	}
	else if((other.guild == GIL_PAL) || (other.guild == GIL_KDF) || (other.guild == GIL_KDM) || (other.guild == GIL_KDW))
	{
		AI_Output(self,other,"DIA_Boltan_Add_05_05");	//Samozřejmě.
	}
	else
	{
		AI_Output(self,other,"DIA_Boltan_Add_05_03");	//Jen běž, ale nebuď tam dlouho, rozumíš?
	};
};


instance DIA_Boltan_HalloBennet(C_Info)
{
	npc = Mil_313_Boltan;
	nr = 1;
	condition = DIA_Boltan_HalloBennet_Condition;
	information = DIA_Boltan_HalloBennet_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Boltan_HalloBennet_Condition()
{
	if((Kapitel == 3) && (MIS_RescueBennet != LOG_SUCCESS) && (other.guild == GIL_SLD))
	{
		return TRUE;
	};
};

func void DIA_Boltan_HalloBennet_Info()
{
	AI_Output(self,other,"DIA_Boltan_Add_05_08");	//Nepřišel jsi odsud vysekat toho svého přítelíčka, že ne?
	AI_Output(self,other,"DIA_Boltan_Add_05_09");	//Tak na to zapomeň! Jakmile spustím poplach, okamžitě tady budou ostatní hoši!
	AI_Output(self,other,"DIA_Boltan_Add_05_10");	//A pak si dáme pár žoldanátků! (ošklivě se směje)
};


instance DIA_Boltan_HalloCanthar(C_Info)
{
	npc = Mil_313_Boltan;
	nr = 1;
	condition = DIA_Boltan_HalloCanthar_Condition;
	information = DIA_Boltan_HalloCanthar_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Boltan_HalloCanthar_Condition()
{
	if(((Kapitel != 3) || ((Kapitel == 3) && ((MIS_RescueBennet == LOG_SUCCESS) || (other.guild != GIL_SLD)))) && (Canthar_WiederRaus == TRUE) && (Canthar_Ausgeliefert == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Boltan_HalloCanthar_Info()
{
	AI_Output(self,other,"DIA_Boltan_Add_05_11");	//Hej, ty jsi ten chlapík, co obžaloval toho kupce Canthara.
	AI_Output(self,other,"DIA_Boltan_Add_05_12");	//Přišla se za něj přimluvit spousta lidí. Docela významných lidí.
	AI_Output(self,other,"DIA_Boltan_Add_05_13");	//Celá ta věc musela být jedno velké nedorozumění. To se stává.
	AI_Output(self,other,"DIA_Boltan_Add_05_14");	//Příště by sis měl dávat větší pozor, koho dáváš do vězení.
};


instance DIA_BOLTAN_SARAHELPSTWO(C_Info)
{
	npc = Mil_313_Boltan;
	nr = 2;
	condition = dia_boltan_sarahelpstwo_condition;
	information = dia_boltan_sarahelpstwo_info;
	permanent = FALSE;
	description = "Něco od tebe potřebuji!";
};


func int dia_boltan_sarahelpstwo_condition()
{
	if(MIS_SARAHELPSTWO == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_boltan_sarahelpstwo_info()
{
	AI_Output(other,self,"DIA_Boltan_SaraHelpsTwo_01_02");	//Vzal jsi obchodnici Sarah prsten. Dej mi ho!
	AI_Output(self,other,"DIA_Boltan_SaraHelpsTwo_01_03");	//Cože? Proč si něco takového myslíš?
	AI_Output(other,self,"DIA_Boltan_SaraHelpsTwo_01_04");	//Sama mi o tom řekla.
	AI_Output(self,other,"DIA_Boltan_SaraHelpsTwo_01_05");	//Jooo?! (naštvaně) Nesmysly!
	AI_Output(other,self,"DIA_Boltan_SaraHelpsTwo_01_06");	//Nedělej žádné hlouposti a dej ho sem.
	AI_Output(self,other,"DIA_Boltan_SaraHelpsTwo_01_07");	//(arogantně) Aha! To určitě!
	AI_Output(self,other,"DIA_Boltan_SaraHelpsTwo_01_08");	//Ten prsten je můj, takže na to zapomeň!
	Info_ClearChoices(dia_boltan_sarahelpstwo);
	Info_AddChoice(dia_boltan_sarahelpstwo,"Dej mi ten prsten, nebo budeš litovat!",dia_boltan_sarahelpstwo_kill);
	Info_AddChoice(dia_boltan_sarahelpstwo,"Tak mi ho prodej!",dia_boltan_sarahelpstwo_buy);
	if(other.guild == GIL_KDF)
	{
		Info_AddChoice(dia_boltan_sarahelpstwo,"Odvažuješ se odporovat vůli mága Ohně?",dia_boltan_sarahelpstwo_kdf);
	};
	if(other.guild == GIL_PAL)
	{
		Info_AddChoice(dia_boltan_sarahelpstwo,"Odvažuješ se odporovat rozkazu paladina?",dia_boltan_sarahelpstwo_pal);
	};
	if(other.guild == GIL_MIL)
	{
		Info_AddChoice(dia_boltan_sarahelpstwo,"Tak řeknu Andremu, že jsi ho ukradl.",dia_boltan_sarahelpstwo_mil);
	};
};

func void dia_boltan_sarahelpstwo_kdf()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Boltan_SaraHelpsTwo_KDF_01_00");	//Odvažuješ se odporovat vůli Innosova služebníka?
	AI_Output(self,other,"DIA_Boltan_SaraHelpsTwo_KDF_01_01");	//Ne! Tys... Já... (koktá)
	AI_Output(self,other,"DIA_Boltan_SaraHelpsTwo_KDF_01_04");	//Tady, ctihodnosti, tady je.
	B_GiveInvItems(self,other,itri_sarafamilyring,1);
	B_LogEntry(TOPIC_SARAHELPSTWO,"Jelikož jsem mág Ohně, Boltan se se mnou neodvážil přít a dal mi Sařin prsten.");
	AI_StopProcessInfos(self);
};

func void dia_boltan_sarahelpstwo_pal()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Boltan_SaraHelpsTwo_PAL_01_00");	//Odvažuješ se odporovat vůli Innosova služebníka?
	AI_Output(self,other,"DIA_Boltan_SaraHelpsTwo_PAL_01_01");	//Ne! Tys... Já... (koktá)
	AI_Output(self,other,"DIA_Boltan_SaraHelpsTwo_PAL_01_04");	//Tady, pane, tady je.
	B_GiveInvItems(self,other,itri_sarafamilyring,1);
	B_LogEntry(TOPIC_SARAHELPSTWO,"Jelikož jsem paladin, Boltan se se mnou neodvážil přít a dal mi Sařin prsten.");
	AI_StopProcessInfos(self);
};

func void dia_boltan_sarahelpstwo_mil()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Boltan_SaraHelpsTwo_MIL_01_00");	//Tak řeknu Andremu, že jsi ho ukradl.
	AI_Output(self,other,"DIA_Boltan_SaraHelpsTwo_MIL_01_01");	//A to si myslíš, že ti bude věřit?
	AI_Output(other,self,"DIA_Boltan_SaraHelpsTwo_MIL_01_02");	//A proč ne? Koneckonců, jsem taky domobránce jako ty.
	AI_Output(self,other,"DIA_Boltan_SaraHelpsTwo_MIL_01_06");	//Dobrá, dobrá... (naštvaně) K čertu s tebou! Tady, tady máš!
	B_GiveInvItems(self,other,itri_sarafamilyring,1);
	B_LogEntry(TOPIC_SARAHELPSTWO,"Povedlo se mi 'přesvědčit' Boltana, aby mi dal prsten. Teď ho musím odnést Sarah.");
	AI_StopProcessInfos(self);
};

func void dia_boltan_sarahelpstwo_buy()
{
	AI_Output(other,self,"DIA_Boltan_SaraHelpsTwo_Buy_01_00");	//Tak mi ho prodej!
	AI_Output(other,self,"DIA_Boltan_SaraHelpsTwo_Buy_01_05");	//Kolik za něj chceš?
	AI_Output(self,other,"DIA_Boltan_SaraHelpsTwo_Buy_01_06");	//No... (zamyšleně) Chci za něj...
	AI_Output(self,other,"DIA_Boltan_SaraHelpsTwo_Buy_01_07");	//Pět set zlatých mincí!
	AI_Output(self,other,"DIA_Boltan_SaraHelpsTwo_Buy_01_09");	//(sarkasticky) To není zrovna špatná cena za takovou věcičku, že?
	AI_Output(other,self,"DIA_Boltan_SaraHelpsTwo_Buy_01_11");	//No, budu o tvé nabídce přemýšlet.
	Info_ClearChoices(dia_boltan_sarahelpstwo);
	B_LogEntry(TOPIC_SARAHELPSTWO,"Povedlo se mi přesvědčit Boltana, aby mi prodal Sařin prsten za pět set zlatých.");
	BOLTANTRADERING = TRUE;
};

func void dia_boltan_sarahelpstwo_kill()
{
	AI_Output(other,self,"DIA_Boltan_SaraHelpsTwo_Kill_01_00");	//Dej mi ten prsten, nebo budeš litovat!
	AI_Output(self,other,"DIA_Boltan_SaraHelpsTwo_Kill_01_01");	//Opravdu? (směje se) A co uděláš?
	AI_Output(other,self,"DIA_Boltan_SaraHelpsTwo_Kill_01_02");	//Jednoduše ti nakopu zadnici!
	AI_Output(self,other,"DIA_Boltan_SaraHelpsTwo_Kill_01_04");	//COŽE?!... (naštvaně) Ty se opovažuješ mi vyhrožovat?
	AI_Output(self,other,"DIA_Boltan_SaraHelpsTwo_Kill_01_05");	//Já ti ukážu, parchante!
	CreateInvItems(self,itri_sarafamilyring,1);
	B_LogEntry(TOPIC_SARAHELPSTWO,"Nepovedlo se mi přesvědčit Boltana, aby mi dal Sařin prsten. Jedinou zbývající možností je teď dát mu nakládačku.");
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_BOLTAN_SARAHELPSTWOBUYRING(C_Info)
{
	npc = Mil_313_Boltan;
	nr = 1;
	condition = dia_boltan_sarahelpstwobuyring_condition;
	information = dia_boltan_sarahelpstwobuyring_info;
	permanent = TRUE;
	description = "Prodej mi Sařin prsten.";
};


func int dia_boltan_sarahelpstwobuyring_condition()
{
	if((MIS_SARAHELPSTWO == LOG_Running) && (BOLTANTRADERING == TRUE) && (BOLTANTRADERINGDONE == FALSE))
	{
		return TRUE;
	};
};

func void dia_boltan_sarahelpstwobuyring_info()
{
	AI_Output(other,self,"DIA_Boltan_SaraHelpsTwoBuyRing_01_00");	//Prodej mi Sařin prsten.
	AI_Output(self,other,"DIA_Boltan_SaraHelpsTwoBuyRing_01_01");	//A kde je mých pět set zlatých?
	if(Npc_HasItems(other,ItMi_Gold) >= 500)
	{
		B_GivePlayerXP(200);
		Npc_RemoveInvItems(other,ItMi_Gold,500);
		AI_Output(other,self,"DIA_Boltan_SaraHelpsTwoBuyRing_01_02");	//Tady jsou tvé peníze.
		AI_Output(self,other,"DIA_Boltan_SaraHelpsTwoBuyRing_01_03");	//Dobře! Tady máš tu svou cetku.
		B_GiveInvItems(self,other,itri_sarafamilyring,1);
		B_LogEntry(TOPIC_SARAHELPSTWO,"Koupil jsem od Boltana ten prsten. Teď ho musím odnést Sarah.");
		BOLTANTRADERINGDONE = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(other,self,"DIA_Boltan_SaraHelpsTwoBuyRing_01_06");	//Ještě je nemám.
		AI_Output(self,other,"DIA_Boltan_SaraHelpsTwoBuyRing_01_07");	//Tak se vrať, až je mít budeš.
		AI_StopProcessInfos(self);
	};
};

