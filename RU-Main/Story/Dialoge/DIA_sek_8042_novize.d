
instance DIA_SEK_8042_NOVIZE_NOFOREVER(C_Info)
{
	npc = sek_8042_novize;
	nr = 5;
	condition = dia_sek_8042_novize_noforever_condition;
	information = dia_sek_8042_novize_noforever_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_sek_8042_novize_noforever_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_sek_8042_novize_noforever_info()
{
	if(Wld_IsTime(8,0,21,0))
	{
		AI_Output(self,other,"DIA_SEK_8042_Novize_NoForever_01_00");	//Не мешать мне работать!
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_SEK_8042_Novize_NoForever_01_01");	//Отстань! Не мешай мне отдыхать...
		AI_StopProcessInfos(self);
	};
};

