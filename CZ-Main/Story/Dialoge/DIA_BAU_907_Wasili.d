/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.02:

CZ_SkillCheckCondition - přidáno zobrazování skill checků

*/



instance DIA_Wasili_EXIT(C_Info)
{
	npc = BAU_907_Wasili;
	nr = 999;
	condition = DIA_Wasili_EXIT_Condition;
	information = DIA_Wasili_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Wasili_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Wasili_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Wasili_HALLO(C_Info)
{
	npc = BAU_907_Wasili;
	nr = 1;
	condition = DIA_Wasili_HALLO_Condition;
	information = DIA_Wasili_HALLO_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Wasili_HALLO_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Wasili_HALLO_Info()
{
	AI_Output(self,other,"DIA_Wasili_HALLO_01_00");	//Neodvažuj se ani pomyslet na to, že bys tu mohl něco ukrást. Jinak tě vynesou nohama napřed, jasný?
};


instance DIA_Wasili_Job(C_Info)
{
	npc = BAU_907_Wasili;
	nr = 1;
	condition = DIA_Wasili_Job_Condition;
	information = DIA_Wasili_Job_Info;
	permanent = FALSE;
	description = "Co je tvoje práce?";
};


func int DIA_Wasili_Job_Condition()
{
	return TRUE;
};

func void DIA_Wasili_Job_Info()
{
	AI_Output(other,self,"DIA_Wasili_Job_15_00");	//Co je tvoje práce?
	AI_Output(self,other,"DIA_Wasili_Job_01_01");	//Onar po mně chce, abych celý den dohlížel na jeho věci.
	AI_Output(self,other,"DIA_Wasili_Job_01_02");	//Dělá si starosti, že něco zmizí. A já taky - na tomhle místě...
	AI_Output(self,other,"DIA_Wasili_Job_01_03");	//Většina z těch žoldáků, co najal, jsou bývalí vězni z trestanecké kolonie.
	AI_Output(self,other,"DIA_Wasili_Job_01_04");	//Když se nikdo z nás nekouká, v mžiku odnesou všechno, co není přišroubovaný.
};


instance DIA_Wasili_Sammler(C_Info)
{
	npc = BAU_907_Wasili;
	nr = 4;
	condition = DIA_Wasili_Sammler_Condition;
	information = DIA_Wasili_Sammler_Info;
	permanent = FALSE;
	description = "Je tady spousta haraburdí.";
};


func int DIA_Wasili_Sammler_Condition()
{
	return TRUE;
};

func void DIA_Wasili_Sammler_Info()
{
	AI_Output(other,self,"DIA_Wasili_Sammler_15_00");	//Je tady spousta haraburdí.
	AI_Output(self,other,"DIA_Wasili_Sammler_01_01");	//Jo, a většina z něj je hodně drahá. Onar sbírá cennosti.
	AI_Output(self,other,"DIA_Wasili_Sammler_01_02");	//Obyčejný člověk jako já si takový luxus nemůže dovolit. Mám raději jiné věci.
	AI_Output(other,self,"DIA_Wasili_Sammler_15_03");	//A to jako?
	AI_Output(self,other,"DIA_Wasili_Sammler_01_04");	//Sbírám staré mince.
	MIS_Wasili_BringOldCoin = LOG_Running;
};


instance DIA_Wasili_FirstOldCoin(C_Info)
{
	npc = BAU_907_Wasili;
	nr = 5;
	condition = DIA_Wasili_FirstOldCoin_Condition;
	information = DIA_Wasili_FirstOldCoin_Info;
	permanent = TRUE;
	description = "Mám tady pár starých mincí.";
};


var int Wasili_BringOldCoin_NoMore;

func int DIA_Wasili_FirstOldCoin_Condition()
{
	if((MIS_Wasili_BringOldCoin == LOG_Running) && (WasilisOldCoinOffer == 0) && (Npc_HasItems(other,ItMi_OldCoin) >= 1) && (Wasili_BringOldCoin_NoMore == FALSE))
	{
		return TRUE;
	};
};


var int WasilisOldCoinOffer;
var int FirstOldCoin_angebotenXP_OneTime;
var int DIA_Wasili_FirstOldCoin_mehr_OneTime;

func void DIA_Wasili_FirstOldCoin_Info()
{
	AI_Output(other,self,"DIA_Wasili_FirstOldCoin_15_00");	//Mám tady pár starých mincí.

	if(FirstOldCoin_angebotenXP_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Wasili_FirstOldCoin_01_01");	//Hmm. Ukaž.
	};

	B_GiveInvItems(other,self,ItMi_OldCoin,1);

	if(FirstOldCoin_angebotenXP_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Wasili_FirstOldCoin_01_02");	//Hm, jo. To by ti tedy na tržišti moc nevyneslo.
	};
	if(DIA_Wasili_FirstOldCoin_mehr_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Wasili_FirstOldCoin_01_03");	//Dám ti za ně zlaťák. Přesně tolik, jaká je jejich hodnota.
	}
	else
	{
		AI_Output(self,other,"DIA_Wasili_FirstOldCoin_01_04");	//Ty moc dobře víš, kolik jsem za ně ochoten zaplatit. Přesně jeden zlaťák za kus, ani o minci více!
	};
	Info_ClearChoices(DIA_Wasili_FirstOldCoin);
	Info_AddChoice(DIA_Wasili_FirstOldCoin,"Ne, mám dojem, že si je raději nechám.",DIA_Wasili_FirstOldCoin_nein);
	Info_AddChoice(DIA_Wasili_FirstOldCoin,
		ConcatStrings(CZ_SkillCheckCondition(CZ_SKILL_RHE, 20, FALSE), "To nestačí. Co takhle dva?"),
		// "To nestačí. Co takhle dva?",
		DIA_Wasili_FirstOldCoin_mehr);
	Info_AddChoice(DIA_Wasili_FirstOldCoin,"Dohodnuto.",DIA_Wasili_FirstOldCoin_ok);
	if(FirstOldCoin_angebotenXP_OneTime == FALSE)
	{
		B_GivePlayerXP(XP_BringOldCoin);
		FirstOldCoin_angebotenXP_OneTime = TRUE;
	};
};

func void DIA_Wasili_FirstOldCoin_ok()
{
	AI_Output(other,self,"DIA_Wasili_FirstOldCoin_ok_15_00");	//Dohodnuto.
	AI_Output(self,other,"DIA_Wasili_FirstOldCoin_ok_01_01");	//Skvěle!

	if(WasilisOldCoinOffer == 2)
	{
		AI_Output(self,other,"DIA_Wasili_FirstOldCoin_ok_01_02");	//Tady jsou dva zlaté.
	}
	else
	{
		AI_Output(self,other,"DIA_Wasili_FirstOldCoin_ok_01_03");	//Kdybys měl takových mincí víc, víš, kde mě najdeš.
		WasilisOldCoinOffer = 1;
	};
	CreateInvItems(self,ItMi_Gold,WasilisOldCoinOffer);
	B_GiveInvItems(self,other,ItMi_Gold,WasilisOldCoinOffer);
	Info_ClearChoices(DIA_Wasili_FirstOldCoin);
};

func void DIA_Wasili_FirstOldCoin_mehr()
{
	AI_Output(other,self,"DIA_Wasili_FirstOldCoin_mehr_15_00");	//To nestačí. Co takhle dva?

	if(RhetorikSkillValue[1] >= 20)
	{
		AI_Output(self,other,"DIA_Wasili_FirstOldCoin_mehr_01_02");	//Arrgh, tak platí.
		WasilisOldCoinOffer = 2;
		Info_AddChoice(DIA_Wasili_FirstOldCoin,"Co takhle tři?",DIA_Wasili_FirstOldCoin_ZumTeufel);
	}
	else
	{
		AI_Output(self,other,"DIA_Wasili_FirstOldCoin_mehr_01_01");	//Táhni...
		DIA_Wasili_FirstOldCoin_mehr_OneTime = TRUE;
		B_GiveInvItems(self,other,ItMi_OldCoin,1);
		AI_StopProcessInfos(self);
	};
};

func void DIA_Wasili_FirstOldCoin_nein()
{
	AI_Output(other,self,"DIA_Wasili_FirstOldCoin_nein_15_00");	//Ne, mám dojem, že si je raději nechám.
	AI_Output(self,other,"DIA_Wasili_FirstOldCoin_nein_01_01");	//Nemaj pro tebe žádnou hodnotu. Však ty se vrátíš.
	B_GiveInvItems(self,other,ItMi_OldCoin,1);
	WasilisOldCoinOffer = 0;
	Info_ClearChoices(DIA_Wasili_FirstOldCoin);
};

func void DIA_Wasili_FirstOldCoin_ZumTeufel()
{
	AI_Output(other,self,"DIA_Wasili_FirstOldCoin_ZumTeufel_15_00");	//V tom případě by tři nebyly tak špatné...
	AI_Output(self,other,"DIA_Wasili_FirstOldCoin_ZumTeufel_01_01");	//Táhni do pekel, ty bastarde!
	AI_StopProcessInfos(self);
	Wasili_BringOldCoin_NoMore = TRUE;
	WasilisOldCoinOffer = 0;
};

instance DIA_Wasili_BringOldCoin(C_Info)
{
	npc = BAU_907_Wasili;
	nr = 5;
	condition = DIA_Wasili_BringOldCoin_Condition;
	information = DIA_Wasili_BringOldCoin_Info;
	permanent = TRUE;
	description = "Máš zájem o další staré mince?";
};

func int DIA_Wasili_BringOldCoin_Condition()
{
	if((WasilisOldCoinOffer > 0) && (Npc_HasItems(other,ItMi_OldCoin) >= 1) && (Wasili_BringOldCoin_NoMore == FALSE))
	{
		return TRUE;
	};
};


var int OldCoinCounter;

func void DIA_Wasili_BringOldCoin_Info()
{
	var int OldCoinCount;
	var int XP_BringOldCoins;
	var int OldCoinGeld;
	AI_Output(other,self,"DIA_Wasili_BringOldCoin_15_00");	//Máš zájem o další staré mince?
	AI_Output(self,other,"DIA_Wasili_BringOldCoin_01_01");	//Jasně. Máš ještě nějaké?
	OldCoinCount = Npc_HasItems(other,ItMi_OldCoin);

	if(OldCoinCount == 1)
	{
		AI_Output(other,self,"DIA_Wasili_BringOldCoin_15_02");	//Jednu.
		B_GivePlayerXP(XP_BringOldCoin);
		B_GiveInvItems(other,self,ItMi_OldCoin,1);
		OldCoinCounter = OldCoinCounter + 1;
	}
	else
	{
		AI_Output(other,self,"DIA_Wasili_BringOldCoin_15_03");	//Pár.
		B_GiveInvItems(other,self,ItMi_OldCoin,OldCoinCount);
		XP_BringOldCoins = OldCoinCount * XP_BringOldCoin;
		OldCoinCounter = OldCoinCounter + OldCoinCount;
		B_GivePlayerXP(XP_BringOldCoins);
	};
	AI_Output(self,other,"DIA_Wasili_BringOldCoin_01_04");	//Díky! Tady jsou tvoje peníze. Přines mi všechny, co najdeš.
	OldCoinGeld = OldCoinCount * WasilisOldCoinOffer;
	CreateInvItems(self,ItMi_Gold,OldCoinGeld);
	B_GiveInvItems(self,other,ItMi_Gold,OldCoinGeld);
	Npc_RemoveInvItems(self,ItMi_OldCoin,Npc_HasItems(self,ItMi_OldCoin));
};


instance DIA_Wasili_PERM(C_Info)
{
	npc = BAU_907_Wasili;
	nr = 900;
	condition = DIA_Wasili_PERM_Condition;
	information = DIA_Wasili_PERM_Info;
	permanent = TRUE;
	description = "Už se tu někdo pokusil něco ukrást?";
};


func int DIA_Wasili_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wasili_Job))
	{
		return TRUE;
	};
};

func void DIA_Wasili_PERM_Info()
{
	AI_Output(other,self,"DIA_Wasili_PERM_15_00");	//Už se tu někdo pokusil něco ukrást?

	if(Kapitel <= 2)
	{
		if(PETZCOUNTER_Farm_Theft > 0)
		{
			AI_Output(self,other,"DIA_Wasili_PERM_01_01");	//Myslíš kromě tebe?
		};
		AI_Output(self,other,"DIA_Wasili_PERM_01_02");	//Párkrát! A vždycky jsem je chytil!
	};
	if(Kapitel == 3)
	{
		AI_Output(self,other,"DIA_Wasili_PERM_01_03");	//Před pár dny se v noci jeden ze žoldáků plížil po domě.
		AI_Output(self,other,"DIA_Wasili_PERM_01_04");	//Měl na sobě černou róbu s kapucí, takže jsem ho nemohl poznat.
		AI_Output(self,other,"DIA_Wasili_PERM_01_05");	//Ale přinutil jsem ho, aby utekl.
	};
	if(Kapitel == 4)
	{
		AI_Output(self,other,"DIA_Wasili_perm_01_06");	//Ne, poslední dobou ne.
	};
	if(Kapitel >= 5)
	{
		AI_Output(self,other,"DIA_Wasili_perm_01_07");	//Ti žoldáci vypadají, jakoby byli připraveni opustit tábor.
		AI_Output(self,other,"DIA_Wasili_perm_01_08");	//Nebyl bych překvapen, pokud by Lee se svými hochy přes noc opustili ostrov.
	};
};


instance DIA_Wasili_PICKPOCKET(C_Info)
{
	npc = BAU_907_Wasili;
	nr = 900;
	condition = DIA_Wasili_PICKPOCKET_Condition;
	information = DIA_Wasili_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Wasili_PICKPOCKET_Condition()
{
	return C_Beklauen(55,90);
};

func void DIA_Wasili_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Wasili_PICKPOCKET);
	Info_AddChoice(DIA_Wasili_PICKPOCKET,Dialog_Back,DIA_Wasili_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Wasili_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Wasili_PICKPOCKET_DoIt);
};

func void DIA_Wasili_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Wasili_PICKPOCKET);
};

func void DIA_Wasili_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Wasili_PICKPOCKET);
};

