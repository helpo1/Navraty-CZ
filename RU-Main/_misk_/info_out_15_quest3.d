
instance INFO_OUT_15_QUEST3(C_Info)
{
	nr = 4;
	condition = info_out_15_quest3_condition;
	information = info_out_15_quest3_info;
	permanent = TRUE;
	description = "Как дела?";
};


func int info_out_15_quest3_condition()
{
	return TRUE;
};

func void info_out_15_quest3_info()
{
	AI_Output(other,self,"Info_Out_15_Quest3_01_00");	//Как дела?
	AI_Output(self,other,"Info_Out_15_Quest3_01_01");	//Скоро ты все поймешь. Всегда будь начеку. Особенно по ночам!
};

func void b_assignambientinfos_out_15(var C_Npc slf)
{
	info_out_15_quest3.npc = Hlp_GetInstanceID(slf);
};

