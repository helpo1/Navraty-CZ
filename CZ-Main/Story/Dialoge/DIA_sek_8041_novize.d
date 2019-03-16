
instance DIA_SEK_8041_NOVIZE_NOFOREVER(C_Info)
{
	npc = sek_8041_novize;
	nr = 5;
	condition = dia_sek_8041_novize_noforever_condition;
	information = dia_sek_8041_novize_noforever_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_sek_8041_novize_noforever_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_sek_8041_novize_noforever_info()
{
	if(Wld_IsTime(8,0,21,0))
	{
		AI_Output(self,other,"DIA_SEK_8041_Novize_NoForever_01_00");	//Nevyrušuj mě od práce!
		AI_Output(self,other,"DIA_SEK_8041_Novize_NoForever_01_01");	//Jestli něco potřebuješ, zeptej se na to Balama. On je náš šéf.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_SEK_8041_Novize_NoForever_01_02");	//Jdi pryč! Nech mě odpočinout...
		AI_StopProcessInfos(self);
	};
};

