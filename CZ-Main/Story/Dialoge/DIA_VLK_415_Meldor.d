
instance DIA_Meldor_EXIT(C_Info)
{
	npc = VLK_415_Meldor;
	nr = 999;
	condition = DIA_Meldor_EXIT_Condition;
	information = DIA_Meldor_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Meldor_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Meldor_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Meldor_Hallo(C_Info)
{
	npc = VLK_415_Meldor;
	nr = 2;
	condition = DIA_Meldor_Hallo_Condition;
	information = DIA_Meldor_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Meldor_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Meldor_Hallo_Info()
{
	AI_Output(self,other,"DIA_Meldor_Hallo_07_00");	//Co chceš?
	AI_Output(other,self,"DIA_Meldor_Hallo_15_01");	//Chtěl jsem se tu trochu porozhlédnout.
	AI_Output(self,other,"DIA_Meldor_Hallo_07_02");	//A kam přesně máš namířeno?
};


instance DIA_Meldor_Interessantes(C_Info)
{
	npc = VLK_415_Meldor;
	nr = 2;
	condition = DIA_Meldor_Interessantes_Condition;
	information = DIA_Meldor_Interessantes_Info;
	permanent = FALSE;
	description = "Co je tu zajímavého k vidění?";
};


func int DIA_Meldor_Interessantes_Condition()
{
	return TRUE;
};

func void DIA_Meldor_Interessantes_Info()
{
	AI_Output(other,self,"DIA_Meldor_Interessantes_15_00");	//Co je tu zajímavého k vidění?
	AI_Output(self,other,"DIA_Meldor_Interessantes_07_01");	//Najdeš tu nevěstinec i krčmu. Hospodský se jmenuje Kardif a jestli hledáš nějaké informace, pak je on ten pravý, s kým si máš promluvit.
	AI_Output(self,other,"DIA_Meldor_Interessantes_07_02");	//Mimochodem, nepotřebuješ peníze?
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,"Kardif, hospodský z přístavní krčmy, prodává krom kořalky i informace.");
};


instance DIA_Meldor_Lehmar(C_Info)
{
	npc = VLK_415_Meldor;
	nr = 3;
	condition = DIA_Meldor_Lehmar_Condition;
	information = DIA_Meldor_Lehmar_Info;
	permanent = FALSE;
	description = "Ty se jich chceš zbavit?";
};


func int DIA_Meldor_Lehmar_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Meldor_Interessantes))
	{
		return TRUE;
	};
};

func void DIA_Meldor_Lehmar_Info()
{
	AI_Output(other,self,"DIA_Meldor_Lehmar_15_00");	//Ty se jich chceš zbavit?
	AI_Output(self,other,"DIA_Meldor_Lehmar_07_01");	//(znuděně) Ne, ale přímo naproti přes ulici sídlí Lehmar - lichvář.
	AI_Output(self,other,"DIA_Meldor_Lehmar_07_02");	//Určitě ti pár zlaťáků půjčí, jen běž dál.
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Meldor_Arbeitest(C_Info)
{
	npc = VLK_415_Meldor;
	nr = 4;
	condition = DIA_Meldor_Arbeitest_Condition;
	information = DIA_Meldor_Arbeitest_Info;
	permanent = FALSE;
	description = "Ty pro Lehmara pracuješ?";
};


func int DIA_Meldor_Arbeitest_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Meldor_Lehmar))
	{
		return TRUE;
	};
};

func void DIA_Meldor_Arbeitest_Info()
{
	AI_Output(other,self,"DIA_Meldor_Arbeitest_15_00");	//Ty pro Lehmara pracuješ?
	AI_Output(self,other,"DIA_Meldor_Arbeitest_07_01");	//Bystrej hoch.
};


instance DIA_Meldor_InsOV(C_Info)
{
	npc = VLK_415_Meldor;
	nr = 5;
	condition = DIA_Meldor_InsOV_Condition;
	information = DIA_Meldor_InsOV_Info;
	permanent = FALSE;
	description = "Vlastně jsem měl namířeno do horní čtvrti.";
};


func int DIA_Meldor_InsOV_Condition()
{
	return TRUE;
};

func void DIA_Meldor_InsOV_Info()
{
	AI_Output(other,self,"DIA_Meldor_InsOV_15_00");	//Vlastně jsem měl namířeno do horní čtvrti.
	AI_Output(self,other,"DIA_Meldor_InsOV_07_01");	//(sarkasticky) No jasně. A já si zase chtěl najmout loď, aby mě zavezla přímo na královský dvůr k audienci.
	AI_Output(self,other,"DIA_Meldor_InsOV_07_02");	//Od té doby, co sem přišli paladinové, nemají takoví jako ty nebo já v horní čtvrti co pohledávat.
};


instance DIA_Meldor_Citizen(C_Info)
{
	npc = VLK_415_Meldor;
	nr = 6;
	condition = DIA_Meldor_Citizen_Condition;
	information = DIA_Meldor_Citizen_Info;
	permanent = FALSE;
	description = "Ty jsi občanem tohoto města?";
};


func int DIA_Meldor_Citizen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Meldor_InsOV))
	{
		return TRUE;
	};
};

func void DIA_Meldor_Citizen_Info()
{
	AI_Output(other,self,"DIA_Meldor_Citizen_15_00");	//Ty jsi občanem tohoto města?
	AI_Output(self,other,"DIA_Meldor_Citizen_07_01");	//Pokud tím myslíš, jestli tu bydlím, pak ano. Ale stejně mě do horní čtvrti nepustí.
	AI_Output(self,other,"DIA_Meldor_Citizen_07_02");	//Tam se mohou dostat jenom nabubřelí hejskové nebo obchodníci a řemeslníci z dolní čtvrti.
	AI_Output(self,other,"DIA_Meldor_Citizen_07_03");	//Lidé z přístavu v Khorinisu nemají velkou moc. Dokonce tu nemáme ani stálou hlídku domobrany.
};


instance DIA_Meldor_Smoke(C_Info)
{
	npc = VLK_415_Meldor;
	nr = 5;
	condition = DIA_Meldor_Smoke_Condition;
	information = DIA_Meldor_Smoke_Info;
	permanent = FALSE;
	description = "Nevíš, kde bych sehnal nějaké kuřivo?";
};


func int DIA_Meldor_Smoke_Condition()
{
	if(MIS_Andre_REDLIGHT == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Meldor_Smoke_Info()
{
	var C_Item heroArmor;
	heroArmor = Npc_GetEquippedArmor(other);
	AI_Output(other,self,"DIA_Meldor_Smoke_15_00");	//Nevíš, kde bych sehnal nějaké kuřivo?

	if((Hlp_IsItem(heroArmor,ITAR_Mil_L) == TRUE) || (Hlp_IsItem(heroArmor,ITAR_TOWNGUARD) == TRUE))
	{
		AI_Output(self,other,"DIA_Meldor_Smoke_07_01");	//(odhaduje) Ne, nemám ponětí.
	}
	else
	{
		AI_Output(self,other,"DIA_Meldor_Smoke_07_02");	//Hmm, být tebou, zkusím štěstí u Červené lucerny.
	};
};


var int Meldor_DGNews;

instance DIA_Meldor_PERM(C_Info)
{
	npc = VLK_415_Meldor;
	nr = 7;
	condition = DIA_Meldor_PERM_Condition;
	information = DIA_Meldor_PERM_Info;
	permanent = TRUE;
	description = "Stalo se v poslední době něco zajímavého?";
};


func int DIA_Meldor_PERM_Condition()
{
	return TRUE;
};

func void DIA_Meldor_PERM_Info()
{
	AI_Output(other,self,"DIA_Meldor_PERM_15_00");	//Stalo se v poslední době něco zajímavého?
	if(Kapitel <= 1)
	{
		AI_Output(self,other,"DIA_Meldor_PERM_07_01");	//Před nedávnem obrátily stráže celou přístavní čtvrť vzhůru nohama.
		AI_Output(self,other,"DIA_Meldor_PERM_07_02");	//Hledali ukradený majetek. Byla teď spousta krádeží v poslední době. Zejména v lepších čtvrtích.
		AI_Output(self,other,"DIA_Meldor_PERM_07_03");	//Samozřejmě se snaží obvinit chuděrky s přístavu za všechno.
	}
	else if((Andre_Diebesgilde_aufgeraeumt == TRUE) && (Meldor_DGNews == FALSE))
	{
		AI_Output(self,other,"DIA_Meldor_PERM_07_04");	//Doneslo se mi, že dole ve stokách byl rozprášen nějaký zlodějský cech. Všichni kradáci byli zabiti.
		Meldor_DGNews = TRUE;
	}
	else if(Kapitel == 3)
	{
		AI_Output(self,other,"DIA_Meldor_PERM_07_05");	//V Hornickém údolí jsou prý draci. Zajímalo by mě, jestli odsud teď paladinové vyrazí a pustí se s nimi do boje.
	}
	else if(Kapitel == 5)
	{
		AI_Output(self,other,"DIA_Meldor_PERM_07_06");	//Podle toho, co se říká, tak už jsou všichni draci mrtví. Někdo je vymetl železným koštětem.
	}
	else
	{
		AI_Output(self,other,"DIA_Meldor_PERM_07_07");	//Ne.
	};
};

instance DIA_Meldor_VonLehmar(C_Info)
{
	npc = VLK_415_Meldor;
	nr = 1;
	condition = DIA_Meldor_VonLehmar_Condition;
	information = DIA_Meldor_VonLehmar_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Meldor_VonLehmar_Condition()
{
	if((Lehmar_GeldGeliehen_Day <= (Wld_GetDay() - 2)) && (Lehmar_GeldGeliehen != 0) && (RangerHelp_LehmarKohle == FALSE) && (Lehmar.aivar[AIV_DefeatedByPlayer] == FALSE) && (LehmarIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Meldor_VonLehmar_Info()
{
	AI_Output(self,other,"DIA_Meldor_VonLehmar_07_00");	//Hej, počkej...
	AI_Output(self,other,"DIA_Meldor_VonLehmar_07_01");	//Nesu ti zprávu od Lehmara.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Meldor_PICKPOCKET(C_Info)
{
	npc = VLK_415_Meldor;
	nr = 900;
	condition = DIA_Meldor_PICKPOCKET_Condition;
	information = DIA_Meldor_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Meldor_PICKPOCKET_Condition()
{
	return C_Beklauen(34,55);
};

func void DIA_Meldor_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Meldor_PICKPOCKET);
	Info_AddChoice(DIA_Meldor_PICKPOCKET,Dialog_Back,DIA_Meldor_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Meldor_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Meldor_PICKPOCKET_DoIt);
};

func void DIA_Meldor_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Meldor_PICKPOCKET);
};

func void DIA_Meldor_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Meldor_PICKPOCKET);
};

