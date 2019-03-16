
instance DIA_EMNOL_EXIT(C_Info)
{
	npc = vlk_6004_emnol;
	nr = 999;
	condition = dia_emnol_exit_condition;
	information = dia_emnol_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_emnol_exit_condition()
{
	return TRUE;
};

func void dia_emnol_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_EMNOL_HELLO(C_Info)
{
	npc = vlk_6004_emnol;
	nr = 1;
	condition = dia_emnol_hello_condition;
	information = dia_emnol_hello_info;
	permanent = TRUE;
	important = FALSE;
	description = "Как дела?";
};


func int dia_emnol_hello_condition()
{
	if(MEETEMNOL == FALSE)
	{
		return TRUE;
	};
};

func void dia_emnol_hello_info()
{
	AI_Output(other,self,"DIA_Emnol_Hello_01_01");	//Как дела?
	AI_Output(self,other,"DIA_Emnol_Hello_01_02");	//Эй? постой. Ты же тот парень, который появился тут совсем недавно.
	AI_Output(other,self,"DIA_Emnol_Hello_01_03");	//...'и обо мне все только и говорят' - это я уже слышал, приятель.
	AI_Output(self,other,"DIA_Emnol_Hello_01_04");	//Вижу, тебя это уже достало...(смеется)
	AI_Output(self,other,"DIA_Emnol_Hello_01_05");	//Понимаешь, ничего нового здесь-то особо и не происходит. Все одно и тоже.
	AI_Output(self,other,"DIA_Emnol_Hello_01_06");	//И вдруг ты - как снег на голову! Понятное дело, что к тебе столько внимания.
	AI_Output(other,self,"DIA_Emnol_Hello_01_07");	//Чем ты занимаешься в лагере?
	AI_Output(self,other,"DIA_Emnol_Hello_01_08");	//Обычно охочусь, как и все. А по большей части ошиваюсь тут, в пещере.
	AI_Output(other,self,"DIA_Emnol_Hello_01_10");	//Скажи, а ты случайно не видел в долине дракона?
	AI_Output(self,other,"DIA_Emnol_Hello_01_11");	//(с ужасом) Ты что приятель, шутишь? Я с роду таких чудовищ не видал...
	AI_Output(other,self,"DIA_Emnol_Hello_01_12");	//Понятно...
	MEETEMNOL = TRUE;
};


instance DIA_EMNOL_HELLO_TEACH(C_Info)
{
	npc = vlk_6004_emnol;
	nr = 1;
	condition = dia_emnol_hello_teach_condition;
	information = dia_emnol_hello_teach_info;
	permanent = TRUE;
	important = FALSE;
	description = "Я слышал, ты крепкий парень.";
};


func int dia_emnol_hello_teach_condition()
{
	if((MEETEMNOL == TRUE) && (EMNOLTEACHER == TRUE) && (EMNOLREADYTEACH == FALSE))
	{
		return TRUE;
	};
};

func void dia_emnol_hello_teach_info()
{
	AI_Output(other,self,"DIA_Emnol_Hello_Teach_01_01");	//Я слышал, ты крепкий парень, Эмнол. Да, собственно, и выглядишь ты внушительно!
	AI_Output(other,self,"DIA_Emnol_Hello_Teach_01_02");	//Я был бы не прочь прибавить в силенках. Сможешь потренировать меня?
	AI_Output(self,other,"DIA_Emnol_Hello_Teach_01_03");	//Ну-ка посмотрим... Да уж, парень, прибавить в мышцах тебе бы не помешало!
	AI_Output(self,other,"DIA_Emnol_Hello_Teach_01_04");	//Но ничего, это мы быстро исправим. В этой долине слабакам трудно выжить.
	AI_Output(self,other,"DIA_Emnol_Hello_Teach_01_05");	//Хоть ты и не производишь впечатления дохляка, но пара тренировок тебе бы действительно не помешала.
	EMNOLREADYTEACH = TRUE;
};


var int emnol_merkestr;

instance DIA_EMNOL_TEACH(C_Info)
{
	npc = vlk_6004_emnol;
	nr = 20;
	condition = dia_emnol_teach_condition;
	information = dia_emnol_teach_info;
	permanent = TRUE;
	description = "Начнем тренировку.";
};


func int dia_emnol_teach_condition()
{
	if((MEETEMNOL == TRUE) && (EMNOLREADYTEACH == TRUE))
	{
		return TRUE;
	};
};

func void dia_emnol_teach_info()
{
	AI_Output(other,self,"DIA_Emnol_Teach_01_01");	//Начнем тренировку.
	EMNOL_MERKESTR = other.attribute[ATR_STRENGTH];
	Info_ClearChoices(dia_emnol_teach);
	Info_AddChoice(dia_emnol_teach,Dialog_Back,dia_emnol_teach_back);
	Info_AddChoice(dia_emnol_teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),dia_emnol_teachstr_1);
	Info_AddChoice(dia_emnol_teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),dia_emnol_teachstr_5);
};

func void dia_emnol_teach_back()
{
	if(other.attribute[ATR_STRENGTH] > EMNOL_MERKESTR)
	{
		AI_Output(self,other,"DIA_Emnol_Teach_Back_01_01");	//(оценивающе) Вот, теперь намного лучше. Ты стал сильнее!
	};
	Info_ClearChoices(dia_emnol_teach);
};

func void dia_emnol_teachstr_1()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_MEGA);
	Info_ClearChoices(dia_emnol_teach);
	Info_AddChoice(dia_emnol_teach,Dialog_Back,dia_emnol_teach_back);
	Info_AddChoice(dia_emnol_teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),dia_emnol_teachstr_1);
	Info_AddChoice(dia_emnol_teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),dia_emnol_teachstr_5);
};

func void dia_emnol_teachstr_5()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_MEGA);
	Info_ClearChoices(dia_emnol_teach);
	Info_AddChoice(dia_emnol_teach,Dialog_Back,dia_emnol_teach_back);
	Info_AddChoice(dia_emnol_teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),dia_emnol_teachstr_1);
	Info_AddChoice(dia_emnol_teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),dia_emnol_teachstr_5);
};


instance DIA_EMNOL_HELLO_ORK(C_Info)
{
	npc = vlk_6004_emnol;
	nr = 1;
	condition = dia_emnol_hello_ork_condition;
	information = dia_emnol_hello_ork_info;
	permanent = TRUE;
	important = FALSE;
	description = "Спросить про орков.";
};


func int dia_emnol_hello_ork_condition()
{
	if((MEETEMNOL == TRUE) && (MEETHARUMFOUR == TRUE) && (EMNOLORKKNOWN == FALSE))
	{
		return TRUE;
	};
};

func void dia_emnol_hello_ork_info()
{
	AI_Output(other,self,"DIA_Emnol_Hello_Ork_01_01");	//Эльваис сказал, что ты встречал орков в этой долине.
	AI_Output(self,other,"DIA_Emnol_Hello_Ork_01_02");	//Да, по ту сторону ущелья я видел созданий, похожих на орков.
	AI_Output(self,other,"DIA_Emnol_Hello_Ork_01_03");	//Но это были какие-то странные орки... они больше напоминали призраков!
	AI_Output(other,self,"DIA_Emnol_Hello_Ork_01_04");	//Орки-призраки?
	AI_Output(self,other,"DIA_Emnol_Hello_Ork_01_05");	//Точно не могу сказать, но выглядели они именно как призраки! А ближе подходить я не решился, слишком опасно.
	AI_Output(other,self,"DIA_Emnol_Hello_Ork_01_06");	//А где это ущелье, в котором ты видел этих призраков?
	AI_Output(self,other,"DIA_Emnol_Hello_Ork_01_07");	//Если пойдешь на запад от нашего лагеря, вскоре упрешься прямо в него.
	AI_Output(self,other,"DIA_Emnol_Hello_Ork_01_08");	//Только будь осторожен, если собираешься туда отправиться. Ущелье очень опасное место!
	AI_Output(self,other,"DIA_Emnol_Hello_Ork_01_09");	//Помимо призраков там еще водятся и такие чудовища, которых всегда лучше обходить стороной. Это мой тебе совет!
	AI_Output(other,self,"DIA_Emnol_Hello_Ork_01_10");	//Спасибо.
	EMNOLORKKNOWN = TRUE;
	B_LogEntry(TOPIC_URNAZULRAGE,"Я поговорил с Эмнолом о здешних орках. Он рассказал мне, что недалеко от лагеря в ущелье видел созданий, напоминающих орков. Но еще больше они походили на призраков.");
	B_LogEntry(TOPIC_URNAZULRAGE,"Судя по всему, мне стоит наведаться в ущелье. Возможно, там я найду хоть что-то, что сможет помочь в моих поисках. Если, конечно, эти призраки будут дружелюбны по отношению ко мне. И если Улу-Мулу для них еще что-то значит.");
};