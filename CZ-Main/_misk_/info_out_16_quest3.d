
instance INFO_OUT_16_QUEST3(C_Info)
{
	nr = 4;
	condition = info_out_16_quest3_condition;
	information = info_out_16_quest3_info;
	permanent = TRUE;
	description = "Jak se tady žije?";
};


func int info_out_16_quest3_condition()
{
	return TRUE;
};

func void info_out_16_quest3_info()
{
	AI_Output(other,self,"Info_Out_16_Quest3_01_00");	//Jak se tady žije?
	AI_Output(self,other,"Info_Out_16_Quest3_01_01");	//Skvěle!
	AI_Output(self,other,"Info_Out_16_Quest3_01_02");	//Máme se tady dokonce až tak dobře, že se odsud ze všech sil snažíme uprchnout.
};

func void b_assignambientinfos_out_16(var C_Npc slf)
{
	info_out_16_quest3.npc = Hlp_GetInstanceID(slf);
};

