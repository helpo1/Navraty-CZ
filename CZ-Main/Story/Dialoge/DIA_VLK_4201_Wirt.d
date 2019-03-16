
instance DIA_Wirt_EXIT(C_Info)
{
	npc = VLK_4201_Wirt;
	nr = 999;
	condition = DIA_Wirt_EXIT_Condition;
	information = DIA_Wirt_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Wirt_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Wirt_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Wirt_PICKPOCKET(C_Info)
{
	npc = VLK_4201_Wirt;
	nr = 900;
	condition = DIA_Wirt_PICKPOCKET_Condition;
	information = DIA_Wirt_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Wirt_PICKPOCKET_Condition()
{
	return C_Beklauen(60,65);
};

func void DIA_Wirt_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Wirt_PICKPOCKET);
	Info_AddChoice(DIA_Wirt_PICKPOCKET,Dialog_Back,DIA_Wirt_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Wirt_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Wirt_PICKPOCKET_DoIt);
};

func void DIA_Wirt_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Wirt_PICKPOCKET);
};

func void DIA_Wirt_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Wirt_PICKPOCKET);
};


instance DIA_Wirt_Hallo(C_Info)
{
	npc = VLK_4201_Wirt;
	nr = 2;
	condition = DIA_Wirt_Hallo_Condition;
	information = DIA_Wirt_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Wirt_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (CoragonGuestBack == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Wirt_Hallo_Info()
{
	AI_Output(self,other,"DIA_Wirt_Hallo_14_00");	//Hej, pojď blíž - dej si pauzu a pár loku dobře chlazeného piva.
	AI_Output(self,other,"DIA_Wirt_Hallo_14_01");	//Lord Andre objednal pár soudku piva, které točíme zdarma.
};

instance DIA_WIRT_GIVEBEER(C_Info)
{
	npc = VLK_4201_Wirt;
	nr = 2;
	condition = dia_wirt_givebeer_condition;
	information = dia_wirt_givebeer_info;
	permanent = TRUE;
	description = "Nalej mi.";
};

func int dia_wirt_givebeer_condition()
{
 	if(CoragonGuestBack == FALSE)
	{
		return TRUE;
	};
};

func void dia_wirt_givebeer_info()
{
	var int randy;
	AI_Output(other,self,"DIA_Wirt_GiveBeer_01_00");	//Nalej mi.
	if(WIRT_DAY != Wld_GetDay())
	{
		AI_Output(self,other,"DIA_Wirt_GiveBeer_01_01");	//Jasne, že jo! Tady, ber... (úsmev)
		B_GiveInvItems(self,other,ItFo_Beer,1);
		randy = Hlp_Random(3);
		if(randy == 0)
		{
			AI_Output(self,other,"DIA_Wirt_Hallo_14_02");	//Není nad to, když si po práci dáš jednu pintu oroseného.
		}
		else if(randy == 1)
		{
			AI_Output(self,other,"DIA_Wirt_Hallo_14_03");	//Paladinové dají všechno do pořádku, takže si klidne ješte lokni a užij si to.
		}
		else if(randy == 2)
		{
			AI_Output(self,other,"DIA_Wirt_Hallo_14_04");	//O Khorinisu si říkej co chceš, ale náš 'Temný paladin' je proste nejlepší pívo z celé Myrtany.
		};
		WIRT_DAY = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Wirt_GiveBeer_01_02");	//Hej, dnes jsi už svoji porci mel.
		AI_Output(self,other,"DIA_Wirt_GiveBeer_01_03");	//Paladinové platí pro všechny. Ne jen pro tebe.
		AI_Output(self,other,"DIA_Wirt_GiveBeer_01_04");	//Jestli chceš ješte, přijď zítra!
	};
};

instance DIA_Wirt_FixBeer_Done(C_Info)
{
	npc = VLK_4201_Wirt;
	nr = 3;
	condition = DIA_Wirt_FixBeer_Done_Condition;
	information = DIA_Wirt_FixBeer_Done_Info;
	permanent = FALSE;
	description = "Teď sloužíš v domobraně?";
};

func int DIA_Wirt_FixBeer_Done_Condition()
{
	if(CoragonGuestBack == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Wirt_FixBeer_Done_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Wirt_FixBeer_Done_01_00");	//Teď sloužíš v armáde?
	AI_Output(self,other,"DIA_Wirt_FixBeer_Done_01_01");	//Stále tomu sám nemohu uveřiť. Proste přjeli a odvědli mně.
	AI_Output(self,other,"DIA_Wirt_FixBeer_Done_01_02");	//Řekli, že na obranu města potřebují silné muže jako jsem já.
	AI_Output(self,other,"DIA_Wirt_FixBeer_Done_01_03");	//Ja ani nevím jako držet měč v ruce.
	AI_Output(other,self,"DIA_Wirt_FixBeer_Done_01_04");	//Nuž, časy jsou těžké.
	AI_Output(other,self,"DIA_Wirt_FixBeer_Done_01_05");	//Domobrana potřebuje všechnu pomoc! A pohled na tebe je mimochodem celkem ohromující.
	AI_Output(other,self,"DIA_Wirt_FixBeer_Done_01_06");	//Myslím, že každej zlodejíček, vidíc tě už zdálky, bude utíkat jako o život.
	AI_Output(self,other,"DIA_Wirt_FixBeer_Done_01_07");	//(Zmatenej) Ummm... Naozaj si to myslíš?
	AI_Output(other,self,"DIA_Wirt_FixBeer_Done_01_08");	//Jsem jsi jistej - vždyť se na sebe koukni!
	AI_Output(other,self,"DIA_Wirt_FixBeer_Done_01_09");	//Dokonce i já jsem byl z tebe trocha vystrašenej.
	AI_Output(self,other,"DIA_Wirt_FixBeer_Done_01_10");	//Hmmm... er... Nuž, možná máš pravdu. Proč jinak by mě sem zatáhli.
	AI_Output(self,other,"DIA_Wirt_FixBeer_Done_01_11");	//(Zamyšlene) Teda... Teda dost kecu! Mně se tenhle post docela líbí.
	AI_Output(other,self,"DIA_Wirt_FixBeer_Done_01_12");	//Samozrejme, samozrejme! Střež to tady... vojáku.
	AI_StopProcessInfos(self);
};

instance DIA_Wirt_FixBeer_Perm(C_Info)
{
	npc = VLK_4201_Wirt;
	nr = 3;
	condition = DIA_Wirt_FixBeer_Perm_Condition;
	information = DIA_Wirt_FixBeer_Perm_Info;
	permanent = TRUE;
	description = "Jako šichta?";
};

func int DIA_Wirt_FixBeer_Perm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wirt_FixBeer_Done))
	{
		return TRUE;
	};
};

func void DIA_Wirt_FixBeer_Perm_Info()
{
	AI_Output(other,self,"DIA_Wirt_FixBeer_Perm_01_00");	//Jako šichta?
	AI_Output(self,other,"DIA_Wirt_FixBeer_Perm_01_01");	//Neobťežuj se!
	AI_StopProcessInfos(self);
};