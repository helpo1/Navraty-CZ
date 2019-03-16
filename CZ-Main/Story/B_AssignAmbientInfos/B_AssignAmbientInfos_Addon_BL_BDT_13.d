
instance DIA_Addon_BL_BDT_13_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_Addon_BL_BDT_13_EXIT_Condition;
	information = DIA_Addon_BL_BDT_13_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_BL_BDT_13_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_BL_BDT_13_EXIT_Info()
{
	BDT_13_Nerver = 0;
	AI_StopProcessInfos(self);
};


instance DIA_Addon_BL_BDT_13_Chef(C_Info)
{
	nr = 2;
	condition = DIA_Addon_BL_BDT_13_Chef_Condition;
	information = DIA_Addon_BL_BDT_13_Chef_Info;
	permanent = TRUE;
	description = "Kdo tomu tady šéfuje?";
};

func int DIA_Addon_BL_BDT_13_Chef_Condition()
{
	return TRUE;
};

func void DIA_Addon_BL_BDT_13_Chef_Info()
{
	AI_Output(other,self,"DIA_Addon_BL_BDT_13_Chef_15_00");	//Kdo tomu tady šéfuje?
	if(RavenAway == TRUE)
	{
		if(Npc_IsDead(Thorus))
		{
			AI_Output(self,other,"DIA_Addon_BL_BDT_13_Chef_13_01");	//(radostně) Náš skvělý vůdce Thorus. Udělá z nás boháče!
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_BL_BDT_13_Chef_13_02");	//Náš skvělý... ehm... netuším...
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_BL_BDT_13_Chef_13_03");	//(radostně) Náš skvělý vůdce Raven. Udělá z nás boháče!
	};
};


instance DIA_Addon_BL_BDT_13_Lager(C_Info)
{
	nr = 3;
	condition = DIA_Addon_BL_BDT_13_Lager_Condition;
	information = DIA_Addon_BL_BDT_13_Lager_Info;
	permanent = TRUE;
	description = "Co víš o táboře?";
};


func int DIA_Addon_BL_BDT_13_Lager_Condition()
{
	return TRUE;
};

func void DIA_Addon_BL_BDT_13_Lager_Info()
{
	AI_Output(other,self,"DIA_Addon_BL_BDT_13_Lager_15_00");	//Co víš o táboře?
	AI_Output(self,other,"DIA_Addon_BL_BDT_13_Lager_13_01");	//Jestli hledáš informace, promluv si se Snafem. Ten kuchař toho ví spoustu.
	AI_Output(self,other,"DIA_Addon_BL_BDT_13_Lager_13_02");	//Pokud chceš něco koupit, zajdi za Fiskem. Prodává všecko možný i nemožný.
};


instance DIA_Addon_BL_BDT_13_News(C_Info)
{
	nr = 4;
	condition = DIA_Addon_BL_BDT_13_News_Condition;
	information = DIA_Addon_BL_BDT_13_News_Info;
	permanent = TRUE;
	description = "Něco nového?";
};


func int DIA_Addon_BL_BDT_13_News_Condition()
{
	return TRUE;
};

func void DIA_Addon_BL_BDT_13_News_Info()
{
	AI_Output(other,self,"DIA_Addon_BL_BDT_13_News_15_00");	//Něco nového?
	if(RavenAway == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_BL_BDT_13_News_13_01");	//Raven je mrtvý. Teď už se odsud NIKDY nedostaneme.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_BL_BDT_13_News_13_02");	//Piráti stáhli ocasy a odpluli.
		AI_Output(self,other,"DIA_Addon_BL_BDT_13_News_13_03");	//Takže tam na pláži zbyla jen banda idiotů, kteří nemají ani pořádnou loď.
		AI_Output(self,other,"DIA_Addon_BL_BDT_13_News_13_04");	//Ani Beliar neví, jak se z tohoto ostrova dostat.
	};
};


instance DIA_Addon_BL_BDT_13_Gold(C_Info)
{
	nr = 5;
	condition = DIA_Addon_BL_BDT_13_Gold_Condition;
	information = DIA_Addon_BL_BDT_13_Gold_Info;
	permanent = TRUE;
	description = "Jak můžu rychle získat hodně zlata?";
};


func int DIA_Addon_BL_BDT_13_Gold_Condition()
{
	if((MIS_Send_Buddler != LOG_Running) || (MIS_Send_Buddler != LOG_SUCCESS))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_BL_BDT_13_Gold_Info()
{
	BDT_13_Nerver = BDT_13_Nerver + 1;
	AI_Output(other,self,"DIA_Addon_BL_BDT_13_Gold_15_00");	//Jak můžu rychle získat hodně zlata?
	if(BDT_13_Nerver <= 2)
	{
		AI_Output(self,other,"DIA_Addon_BL_BDT_13_Gold_13_01");	//Dobrá otázka. Není to právě důvod, proč jsme všichni tady?
		AI_Output(self,other,"DIA_Addon_BL_BDT_13_Gold_13_02");	//Sežeň si červený kámen od Thoruse a můžeš jít do dolu.
	}
	else if(BDT_13_Kill == FALSE)
	{
		BDT_13_Nerver = 0;
		BDT_13_Kill = TRUE;
		AI_Output(self,other,"DIA_Addon_BL_BDT_13_Gold_13_03");	//Děláš si srandu? Vypadni!
		AI_StopProcessInfos(self);
	}
	else
	{
		BDT_13_Nerver = 0;
		AI_Output(self,other,"DIA_Addon_BL_BDT_13_Gold_13_04");	//Žádný srandičky a jiný skopičiny.
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_NONE,1);
	};
};

func void B_AssignAmbientInfos_Addon_BL_BDT_13(var C_Npc slf)
{
	DIA_Addon_BL_BDT_13_EXIT.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_BL_BDT_13_Chef.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_BL_BDT_13_Lager.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_BL_BDT_13_News.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_BL_BDT_13_Gold.npc = Hlp_GetInstanceID(slf);
};