
instance INFO_OUT_19_QUEST3(C_Info)
{
	nr = 4;
	condition = info_out_19_quest3_condition;
	information = info_out_19_quest3_info;
	permanent = TRUE;
	description = "Zdravím!";
};


func int info_out_19_quest3_condition()
{
	return TRUE;
};

func void info_out_19_quest3_info()
{
	AI_Output(other,self,"Info_Out_19_Quest3_01_00");	//Zdravím!
	AI_Output(self,other,"Info_Out_19_Quest3_01_01");	//Co chceš?
};

func void b_assignambientinfos_out_19(var C_Npc slf)
{
	info_out_19_quest3.npc = Hlp_GetInstanceID(slf);
};

