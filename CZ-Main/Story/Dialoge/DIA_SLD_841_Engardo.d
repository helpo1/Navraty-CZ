
instance DIA_Engardo_EXIT(C_Info)
{
	npc = SLD_841_Engardo;
	nr = 999;
	condition = DIA_Engardo_EXIT_Condition;
	information = DIA_Engardo_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Engardo_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Engardo_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Engardo_HALLO(C_Info)
{
	npc = SLD_841_Engardo;
	nr = 4;
	condition = DIA_Engardo_HALLO_Condition;
	information = DIA_Engardo_HALLO_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Engardo_HALLO_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};


var int Chance;

func void DIA_Engardo_HALLO_Info()
{
	Akils_SLDStillthere = TRUE;

	if(Chance == FALSE)
	{
		AI_Output(self,other,"DIA_Engardo_HALLO_13_00");	//Hej, burane, to ses ztratil? Vrať se zpátky na pole a vytáhni tam nějaký tuříny.
		Chance = 1;
		AI_StopProcessInfos(self);
	}
	else if(Chance == 1)
	{
		AI_Output(self,other,"DIA_Engardo_HALLO_13_01");	//Jsi ve špatný čas na špatném místě...
		AI_Output(self,other,"DIA_Engardo_HALLO_13_02");	//... takže mám dojem, že jestli se chceš dožít rána, měl bys teď hned odsud pěkně vysmahnout, jasný?
		Chance = 2;
		AI_StopProcessInfos(self);
	}
	else if(Chance == 2)
	{
		AI_Output(self,other,"DIA_Engardo_HALLO_13_03");	//Máš snad něco s ušima? Nebo se chceš pozdravit se zubatou? (cynicky) Fajn, teď už je pozdě.
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_SuddenEnemyInferno,1);
	};
};


instance DIA_Engardo_PICKPOCKET(C_Info)
{
	npc = SLD_841_Engardo;
	nr = 900;
	condition = DIA_Engardo_PICKPOCKET_Condition;
	information = DIA_Engardo_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Engardo_PICKPOCKET_Condition()
{
	return C_Beklauen(34,45);
};

func void DIA_Engardo_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Engardo_PICKPOCKET);
	Info_AddChoice(DIA_Engardo_PICKPOCKET,Dialog_Back,DIA_Engardo_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Engardo_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Engardo_PICKPOCKET_DoIt);
};

func void DIA_Engardo_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Engardo_PICKPOCKET);
};

func void DIA_Engardo_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Engardo_PICKPOCKET);
};

