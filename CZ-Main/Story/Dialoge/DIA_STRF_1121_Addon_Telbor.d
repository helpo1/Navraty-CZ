
instance DIA_Addon_Telbor_EXIT(C_Info)
{
	npc = STRF_1121_Addon_Telbor;
	nr = 999;
	condition = DIA_Addon_Telbor_EXIT_Condition;
	information = DIA_Addon_Telbor_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Telbor_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Telbor_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


var int Telbor_Once;

instance DIA_Addon_Telbor_Hi(C_Info)
{
	npc = STRF_1121_Addon_Telbor;
	nr = 2;
	condition = DIA_Addon_Telbor_Hi_Condition;
	information = DIA_Addon_Telbor_Hi_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Telbor_Hi_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && !Npc_IsDead(Patrick) && !Npc_IsDead(Pardos))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Telbor_Hi_Info()
{
	AI_Output(self,other,"DIA_Addon_Telbor_Hi_12_00");	//Hej, jsem v pořádku.
	if(Sklaven_Flucht == FALSE)
	{
		if(Pardos_Geheilt == FALSE)
		{
			AI_Output(self,other,"DIA_Addon_Telbor_Hi_12_01");	//Ale Pardos vypadá pěkně špatně.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Telbor_Hi_12_02");	//Díky za pomoc Pardosovi.
			if(Telbor_Once == FALSE)
			{
				B_GivePlayerXP(XP_Ambient);
				Telbor_Once = TRUE;
			};
		};
	};
	AI_Output(self,other,"DIA_Addon_Telbor_Hi_12_03");	//Jestli chceš o něčem diskutovat, řekni Patrickovi. Je náš mluvčí.
	AI_StopProcessInfos(self);
};

