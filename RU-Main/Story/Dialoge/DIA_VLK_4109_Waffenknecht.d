
instance DIA_WAFFEN4109_EXIT(C_Info)
{
	npc = VLK_4109_Waffenknecht;
	nr = 999;
	condition = dia_waffen4109_exit_condition;
	information = dia_waffen4109_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_waffen4109_exit_condition()
{
	return TRUE;
};

func void dia_waffen4109_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_WAFFEN4109_HALLO(C_Info)
{
	npc = VLK_4109_Waffenknecht;
	nr = 1;
	condition = dia_waffen4109_hallo_condition;
	information = dia_waffen4109_hallo_info;
	description = "Эй, как дела?";
	permanent = TRUE;
};


func int dia_waffen4109_hallo_condition()
{
	return TRUE;
};


var int waffen4109firsttime;

func void dia_waffen4109_hallo_info()
{
	AI_Output(other,self,"DIA_Waffen4109_HALLO_15_00");	//Эй, как дела?
	if(COOK1107_GOBASE == TRUE)
	{
		AI_Output(self,other,"DIA_Waffen4109_HALLO_03_01");	//Этот чертов повар удрал, и мне приходится кашеварить за него.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Waffen4109_HALLO_03_02");	//Думаешь, это здорово - целый день распиливать тут эти ящики?
		if(WAFFEN4109FIRSTTIME == FALSE)
		{
			AI_Output(other,self,"DIA_Waffen4109_HALLO_15_01");	//А зачем ты их распиливаешь?
			AI_Output(self,other,"DIA_Waffen4109_HALLO_03_03");	//Чтобы изготовить из них стрелы. Нам нужно много стрел!
			AI_Output(other,self,"DIA_Waffen4109_HALLO_15_02");	//Да, это точно.
			if(KNOWHOWTOMAKEARROWS == FALSE)
			{
				AI_Output(other,self,"DIA_Waffen4109_HALLO_15_03");	//Так ты умеешь делать стрелы? Может научишь?
				AI_Output(self,other,"DIA_Waffen4109_HALLO_03_04");	//Хммм... А ты думаешь, у меня на это есть время?
				AI_Output(self,other,"DIA_Waffen4109_HALLO_03_05");	//Поищи лучше кого-нибудь другого.
			};
			WAFFEN4109FIRSTTIME = TRUE;
		};
	};
};
