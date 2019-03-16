
instance DIA_XBS_1_EXIT(C_Info)
{
	nr = 999;
	condition = dia_xbs_1_exit_condition;
	information = dia_xbs_1_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_xbs_1_exit_condition()
{
	return TRUE;
};

func void dia_xbs_1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_XBS_1_ABOUT(C_Info)
{
	nr = 1;
	condition = dia_xbs_1_about_condition;
	information = dia_xbs_1_about_info;
	permanent = TRUE;
	description = "Что вы тут вообще делаете?";
};


func int dia_xbs_1_about_condition()
{
	return TRUE;
};

func void dia_xbs_1_about_info()
{
	AI_Output(other,self,"DIA_XBS_1_ABOUT_15_00");	//Чем вы тут занимаетесь?
	AI_Output(self,other,"DIA_XBS_1_ABOUT_01_01");	//Живем, охотимся, обсуждаем прошлое и слушаем голоса будущего.
	b_heroknowforestbase();
};


instance DIA_XBS_1_PEOPLE(C_Info)
{
	nr = 3;
	condition = dia_xbs_1_people_condition;
	information = dia_xbs_1_people_info;
	permanent = TRUE;
	description = "Кто здесь старший?";
};


func int dia_xbs_1_people_condition()
{
	return TRUE;
};

func void dia_xbs_1_people_info()
{
	AI_Output(other,self,"DIA_XBS_1_PEOPLE_15_00");	//Кто здесь старший?
	AI_Output(self,other,"DIA_XBS_1_PEOPLE_01_01");	//Мы собрались, чтобы учиться у Нетбека.
	AI_Output(self,other,"DIA_XBS_1_PEOPLE_01_02");	//Но он не занимается жизнью лагеря.
	AI_Output(self,other,"DIA_XBS_1_PEOPLE_01_03");	//Старший по хозяйству сейчас Гор На Бар.
	AI_Output(self,other,"DIA_XBS_1_PEOPLE_01_04");	//В остальном мы все равны - никаких чинов и привилегий.
	b_heroknowforestbase();
};


instance DIA_XBS_1_LOCATION(C_Info)
{
	nr = 2;
	condition = dia_xbs_1_location_condition;
	information = dia_xbs_1_location_info;
	permanent = TRUE;
	description = "Что интересного есть в лагере?";
};


func int dia_xbs_1_location_condition()
{
	return TRUE;
};

func void dia_xbs_1_location_info()
{
	AI_Output(other,self,"DIA_XBS_1_LOCATION_15_00");	//Что интересного есть в лагере?
	AI_Output(self,other,"DIA_XBS_1_LOCATION_01_01");	//Ничего! Это же не город и даже не замок.
	AI_Output(self,other,"DIA_XBS_1_LOCATION_01_02");	//Несколько палаток и несколько послушников.
	AI_Output(self,other,"DIA_XBS_1_LOCATION_01_03");	//Впрочем, внизу в пещере обосновался отряд паладинов Инноса. Сходи к ним - у них, наверняка, жизнь поинтересней.
	b_heroknowforestbase();
};


instance DIA_XBS_1_STANDARD(C_Info)
{
	nr = 4;
	condition = dia_xbs_1_standard_condition;
	information = dia_xbs_1_standard_info;
	permanent = TRUE;
	description = "Что нового?";
};


func int dia_xbs_1_standard_condition()
{
	return TRUE;
};

func void dia_xbs_1_standard_info()
{
	AI_Output(other,self,"DIA_XBS_1_STANDARD_15_00");	//Что нового?
	if(Kapitel == 1)
	{
		AI_Output(self,other,"DIA_XBS_1_STANDARD_01_01");	//Уже несколько недель не видно никого из Болотного лагеря - кроме тех, что собрались здесь, конечно.
	};
	if(Kapitel == 2)
	{
		AI_Output(self,other,"DIA_XBS_1_STANDARD_01_02");	//Вопли из-за забора ветер иногда доносит даже сюда. Не хотел бы я сейчас оказаться в замке!
	};
	if(Kapitel == 3)
	{
		AI_Output(self,other,"DIA_XBS_1_STANDARD_01_03");	//Какая-то грусть напала на всех парней. Кажется, что мы навсегда потеряли что-то или кого-то.
	};
	if(Kapitel == 4)
	{
		AI_Output(self,other,"DIA_XBS_1_STANDARD_01_04");	//Недавно сюда прибыл новый отряд орков. Думаю, защитникам замка в скором времени придется очень туго!
	};
	if(Kapitel == 5)
	{
		AI_Output(self,other,"DIA_XBS_1_STANDARD_01_05");	//Поговоривают, что именно ты истребил всех драконов. Как тебе это удалось, парень?!
	};
	if(Kapitel >= 6)
	{
		AI_Output(self,other,"DIA_XBS_1_STANDARD_01_06");	//Говорят, что орки все-таки взяли замок штурмом! Боюсь, скоро они и до нас доберуться.
	};
	b_heroknowforestbase();
};

func void b_assignambientinfos_xbs(var C_Npc slf)
{
	dia_xbs_1_exit.npc = Hlp_GetInstanceID(slf);
	dia_xbs_1_about.npc = Hlp_GetInstanceID(slf);
	dia_xbs_1_people.npc = Hlp_GetInstanceID(slf);
	dia_xbs_1_location.npc = Hlp_GetInstanceID(slf);
	dia_xbs_1_standard.npc = Hlp_GetInstanceID(slf);
};

