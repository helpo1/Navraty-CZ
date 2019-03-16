
instance INFO_OUT_17_QUEST3(C_Info)
{
	nr = 4;
	condition = info_out_17_quest3_condition;
	information = info_out_17_quest3_info;
	permanent = TRUE;
	description = "Все в порядке?";
};


func int info_out_17_quest3_condition()
{
	return TRUE;
};

func void info_out_17_quest3_info()
{
	AI_Output(other,self,"Info_Out_17_Quest3_01_00");	//Все в порядке?
	AI_Output(self,other,"Info_Out_17_Quest3_01_01");	//В полном, как и двадцать лет назад. С тех пор все не слишком-то изменилось.
};

func void b_assignambientinfos_out_17(var C_Npc slf)
{
	info_out_17_quest3.npc = Hlp_GetInstanceID(slf);
};

