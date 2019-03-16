
instance DIA_PAL_7524_EXIT(C_Info)
{
	npc = pal_7524_ritter;
	nr = 999;
	condition = dia_pal_7524_exit_condition;
	information = dia_pal_7524_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_7524_exit_condition()
{
	return TRUE;
};

func void dia_pal_7524_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_7524_PASS(C_Info)
{
	npc = pal_7524_ritter;
	nr = 2;
	condition = dia_pal_7524_pass_condition;
	information = dia_pal_7524_pass_info;
	permanent = FALSE;
	description = "Что тут находится?";
};


func int dia_pal_7524_pass_condition()
{
	if(KAPITELORCATC == FALSE)
	{
		return TRUE;
	};
};

func void dia_pal_7524_pass_info()
{
	AI_Output(other,self,"DIA_PAL_7524_Pass_01_00");	//Что тут находится?
	AI_Output(self,other,"DIA_PAL_7524_Pass_01_01");	//Тут расположен лагерь паладинов.
	AI_Output(self,other,"DIA_PAL_7524_Pass_01_02");	//После стычки с орками нам пришлось отойти сюда и занять оборону.
	AI_Output(self,other,"DIA_PAL_7524_Pass_01_03");	//Но вскоре после этого тут вырос этот лес, и орки отступили.
};


instance DIA_PAL_7524_TRESPASS(C_Info)
{
	npc = pal_7524_ritter;
	nr = 2;
	condition = dia_pal_7524_trespass_condition;
	information = dia_pal_7524_trespass_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_pal_7524_trespass_condition()
{
	if(KAPITELORCATC == FALSE)
	{
		return TRUE;
	};
};

func void dia_pal_7524_trespass_info()
{
	AI_Output(self,other,"DIA_PAL_7524_TRESPASS_01_00");	//СТОЙ! Именем Инноса, отвечай - КТО ТЫ?!
	AI_Output(other,self,"DIA_PAL_7524_TRESPASS_01_01");	//Не волнуйся! Я пришел из замка.
	AI_Output(self,other,"DIA_PAL_7524_TRESPASS_01_02");	//Да? (с сомнением) Ну, хорошо, проходи.
	AI_Output(self,other,"DIA_PAL_7524_TRESPASS_01_03");	//Только не создавай тут проблем - у нас их и так предостаточно.
};


instance DIA_PAL_7524_PERM2(C_Info)
{
	npc = pal_7524_ritter;
	nr = 3;
	condition = dia_pal_7524_perm2_condition;
	information = dia_pal_7524_perm2_info;
	permanent = TRUE;
	description = "Как обстановка?";
};


func int dia_pal_7524_perm2_condition()
{
	return TRUE;
};

func void dia_pal_7524_perm2_info()
{
	AI_Output(other,self,"DIA_PAL_7524_Perm2_01_00");	//Как обстановка?
	AI_Output(self,other,"DIA_PAL_7524_Perm2_01_01");	//Пока все спокойно.
	AI_StopProcessInfos(self);
};

