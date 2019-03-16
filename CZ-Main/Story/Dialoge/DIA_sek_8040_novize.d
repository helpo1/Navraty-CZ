
instance DIA_SEK_8040_NOVIZE_NOFOREVER(C_Info)
{
	npc = sek_8040_novize;
	nr = 5;
	condition = dia_sek_8040_novize_noforever_condition;
	information = dia_sek_8040_novize_noforever_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_sek_8040_novize_noforever_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_sek_8040_novize_noforever_info()
{
	if(Wld_IsTime(8,0,21,0))
	{
		AI_Output(self,other,"DIA_SEK_8040_Novize_NoForever_01_00");	//Nevyrušuj mě od práce!
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_SEK_8040_Novize_NoForever_01_01");	//Jdi pryč! Nech mě odpočinout...
		AI_StopProcessInfos(self);
	};
};

