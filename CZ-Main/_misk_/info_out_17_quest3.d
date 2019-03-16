
instance INFO_OUT_17_QUEST3(C_Info)
{
	nr = 4;
	condition = info_out_17_quest3_condition;
	information = info_out_17_quest3_info;
	permanent = TRUE;
	description = "Je všechno v pořádku?";
};


func int info_out_17_quest3_condition()
{
	return TRUE;
};

func void info_out_17_quest3_info()
{
	AI_Output(other,self,"Info_Out_17_Quest3_01_00");	//Je všechno v pořádku?
	AI_Output(self,other,"Info_Out_17_Quest3_01_01");	//Jo, naprosto. Stejně jako před 20 lety. Od té doby se toho moc nezměnilo.
};

func void b_assignambientinfos_out_17(var C_Npc slf)
{
	info_out_17_quest3.npc = Hlp_GetInstanceID(slf);
};

