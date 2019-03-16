
instance DIA_DIA_VLK_6130_BENCHEL_EXIT(C_Info)
{
	npc = vlk_6130_benchel;
	nr = 999;
	condition = dia_vlk_6130_benchel_exit_condition;
	information = dia_vlk_6130_benchel_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_vlk_6130_benchel_exit_condition()
{
	return TRUE;
};

func void dia_vlk_6130_benchel_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_VLK_6130_BENCHEL_MISSBRENDI(C_Info)
{
	npc = vlk_6130_benchel;
	nr = 1;
	condition = dia_vlk_6130_benchel_missbrendi_condition;
	information = dia_vlk_6130_benchel_missbrendi_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_vlk_6130_benchel_missbrendi_condition()
{
	if(BENCHELTELLTHANKS == TRUE)
	{
		return TRUE;
	};
};

func void dia_vlk_6130_benchel_missbrendi_info()
{
	B_GivePlayerXP(100);
	AI_Output(self,other,"DIA_VLK_6130_Benchel_MissBrendi_Info_01_01");	//(переводя дыхание) Спасибо, что помог мне!
	AI_Output(self,other,"DIA_VLK_6130_Benchel_MissBrendi_Info_01_02");	//Если бы не ты, то эти ублюдки отправили бы меня на тот свет!
	AI_Output(other,self,"DIA_VLK_6130_Benchel_MissBrendi_Info_01_04");	//Успокойся, парень. Тебя зовут Бенчел?
	AI_Output(self,other,"DIA_VLK_6130_Benchel_MissBrendi_Info_01_05");	//Да, это я Бенчел.
	AI_Output(other,self,"DIA_VLK_6130_Benchel_MissBrendi_Info_01_06");	//Тогда я хочу сказать тебе, Бенчел, что Лютеро уже заждался тебя.
	AI_Output(other,self,"DIA_VLK_6130_Benchel_MissBrendi_Info_01_08");	//Ты ведь должен был отнести ему партию черного бренди, который дал тебе Орлан.
	AI_Output(self,other,"DIA_VLK_6130_Benchel_MissBrendi_Info_01_13");	//Да, да. Я уже шел обратно в город, чтобы отнести Лютеро это чертово пойло.
	AI_Output(self,other,"DIA_VLK_6130_Benchel_MissBrendi_Info_01_14");	//Но потом вон из-за тех кустов выбежали эти парни и окружили меня.
	AI_Output(other,self,"DIA_VLK_6130_Benchel_MissBrendi_Info_01_18");	//Что им от тебя было нужно?
	AI_Output(self,other,"DIA_VLK_6130_Benchel_MissBrendi_Info_01_24");	//В таверне я ляпнул, что несу одному крупному торговцу в Хоринис очень дорогой товар.
	AI_Output(other,self,"DIA_VLK_6130_Benchel_MissBrendi_Info_01_25");	//Дай угадаю - черный бренди?
	AI_Output(self,other,"DIA_VLK_6130_Benchel_MissBrendi_Info_01_28");	//Именно. Одна бутылка стоит целое состояние - не сказать больше!
	AI_Output(self,other,"DIA_VLK_6130_Benchel_MissBrendi_Info_01_30");	//Раньше его возили с материка, но после того, как в нашу гавань перестали заходить торговые корабли, новые партии перестали поступать.
	AI_Output(self,other,"DIA_VLK_6130_Benchel_MissBrendi_Info_01_31");	//Поэтому цены на этот черный бренди так и взлетели!
	B_LogEntry(TOPIC_BLACKBRENDI,"Я помог Бенчелу разобраться с бандитами.");
};


instance DIA_VLK_6130_BENCHEL_MISSBRENDIFOLLOW(C_Info)
{
	npc = vlk_6130_benchel;
	nr = 1;
	condition = dia_vlk_6130_benchel_missbrendifollow_condition;
	information = dia_vlk_6130_benchel_missbrendifollow_info;
	permanent = FALSE;
	description = "Нужно отнести этот бренди Лютеро.";
};


func int dia_vlk_6130_benchel_missbrendifollow_condition()
{
	if(Npc_KnowsInfo(hero,dia_vlk_6130_benchel_missbrendi))
	{
		return TRUE;
	};
};

func void dia_vlk_6130_benchel_missbrendifollow_info()
{
	AI_Output(other,self,"DIA_VLK_6130_Benchel_MissBrendiFollow_Info_01_01");	//Нужно отнести этот бренди Лютеро.
	AI_Output(self,other,"DIA_VLK_6130_Benchel_MissBrendiFollow_Info_01_02");	//Ты прав! Но... но до города еще так далеко, а здешняя местность просто кишит бандитами!
	AI_Output(self,other,"DIA_VLK_6130_Benchel_MissBrendiFollow_Info_01_04");	//Поэтому я решил, что, пожалуй, лучше останусь тут.
	AI_Output(self,other,"DIA_VLK_6130_Benchel_MissBrendiFollow_Info_01_07");	//Я не хочу больше рисковать жизнью из-за всякого барахла.
	AI_Output(other,self,"DIA_VLK_6130_Benchel_MissBrendiFollow_Info_01_11");	//Что скажешь, если я помогу тебе добраться до городских ворот?
	AI_Output(self,other,"DIA_VLK_6130_Benchel_MissBrendiFollow_Info_01_12");	//Ты пойдешь со мной?
	AI_Output(self,other,"DIA_VLK_6130_Benchel_MissBrendiFollow_Info_01_18");	//(думает) Хорошо, пошли!
	B_LogEntry(TOPIC_BLACKBRENDI,"Я согласился сопроводить Бенчела до городских ворот. Похоже, один он просто никуда не пойдет. Так что придется некоторое время побыть ему нянькой.");
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	BENCHELFOLLOWME = TRUE;
	Npc_ExchangeRoutine(self,"FOLLOW");
};

instance DIA_VLK_6130_BENCHEL_ANGEKOMMEN(C_Info)
{
	npc = vlk_6130_benchel;
	nr = 55;
	condition = dia_vlk_6130_benchel_angekommen_condition;
	information = dia_vlk_6130_benchel_angekommen_info;
	important = TRUE;
};

func int dia_vlk_6130_benchel_angekommen_condition()
{
	if((MIS_BLACKBRENDI == LOG_Running) && (BENCHELFOLLOWME == TRUE) && (Npc_GetDistToWP(self,"CITY2") < 6000))
	{
		return TRUE;
	};
};

func void dia_vlk_6130_benchel_angekommen_info()
{
	B_GivePlayerXP(200);
	AI_Output(self,other,"DIA_VLK_6130_Benchel_ANGEKOMMEN_Info_01_00");	//Постой! Думаю, дальше я смогу сам.
	AI_Output(self,other,"DIA_VLK_6130_Benchel_ANGEKOMMEN_Info_01_01");	//Да, и кстати, пока мы шли, я тут немного пораскинул мозгами...
	AI_Output(self,other,"DIA_VLK_6130_Benchel_ANGEKOMMEN_Info_01_02");	//...и решил, что хватит с меня всего этого!
	AI_Output(other,self,"DIA_VLK_6130_Benchel_ANGEKOMMEN_Info_01_03");	//Что ты имеешь в виду?
	AI_Output(self,other,"DIA_VLK_6130_Benchel_ANGEKOMMEN_Info_01_04");	//Хватит с меня всех этих приключений!
	AI_Output(self,other,"DIA_VLK_6130_Benchel_ANGEKOMMEN_Info_01_05");	//Я до сих пор в себя прийти не могу после той разборки с бандитами.
	AI_Output(self,other,"DIA_VLK_6130_Benchel_ANGEKOMMEN_Info_01_06");	//Поэтому, если встретишь Лютеро, - передай ему, что я больше на него не работаю.
	AI_Output(self,other,"DIA_VLK_6130_Benchel_ANGEKOMMEN_Info_01_09");	//Вот, возьми эти пять бутылок черного думтрейского бренди и отдай ему их сам!
	AI_Output(self,other,"DIA_VLK_6130_Benchel_ANGEKOMMEN_Info_01_10");	//Наверняка он отблагодарит тебя за это. А, может, даже возьмет на работу. Хе-хе...
	B_GiveInvItems(self,other,itmi_blackbrendi,5);
	AI_Output(other,self,"DIA_VLK_6130_Benchel_ANGEKOMMEN_Info_01_12");	//И что ты теперь будешь делать?
	AI_Output(self,other,"DIA_VLK_6130_Benchel_ANGEKOMMEN_Info_01_13");	//Ровным счетом - ничего.
	AI_Output(self,other,"DIA_VLK_6130_Benchel_ANGEKOMMEN_Info_01_14");	//Буду сидеть целыми днями в таверне, пить пиво и наслаждаться покоем.
	AI_Output(other,self,"DIA_VLK_6130_Benchel_ANGEKOMMEN_Info_01_15");	//Ну, как знаешь. Я передам Лютеро твои слова.
	AI_Output(self,other,"DIA_VLK_6130_Benchel_ANGEKOMMEN_Info_01_16");	//Тогда удачи, приятель! Мы наверняка еще увидимся.
	BENCHELLEAVEME = TRUE;
	B_LogEntry(TOPIC_BLACKBRENDI,"После того как я довел Бенчела до ворот города, он отдал мне черный думтрейский бренди и попросил передать Лютеро, что больше на него не работает. Осталось рассказать обо всем Лютеро.");
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"RestInTavern");
};

instance DIA_VLK_6130_BENCHEL_HALLO(C_Info)
{
	npc = vlk_6130_benchel;
	nr = 55;
	condition = dia_vlk_6130_benchel_hallo_condition;
	information = dia_vlk_6130_benchel_hallo_info;
	permanent = TRUE;
	description = "Как дела, Бенчел?";
};

func int dia_vlk_6130_benchel_hallo_condition()
{
	if(BENCHELLEAVEME == TRUE)
	{
		return TRUE;
	};
};

func void dia_vlk_6130_benchel_hallo_info()
{
	AI_Output(other,self,"DIA_VLK_6130_Benchel_Hallo_01_00");	//Как дела?
	AI_Output(self,other,"DIA_VLK_6130_Benchel_Hallo_01_01");	//Лучше не придумаешь, приятель.
	AI_Output(self,other,"DIA_VLK_6130_Benchel_Hallo_01_02");	//Никогда не чувствовал себя так спокойно!
};


instance DIA_VLK_6130_BENCHEL_GO(C_Info)
{
	npc = vlk_6130_benchel;
	nr = 55;
	condition = dia_vlk_6130_benchel_go_condition;
	information = dia_vlk_6130_benchel_go_info;
	permanent = TRUE;
	description = "Пойдем, я провожу тебя.";
};


func int dia_vlk_6130_benchel_go_condition()
{
	if((BENCHELLEAVEME == FALSE) && (BENCHELFOLLOWME == TRUE) && (MIS_BLACKBRENDI == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_vlk_6130_benchel_go_info()
{
	AI_Output(other,self,"DIA_VLK_6130_Benchel_Go_01_00");	//Не бойся, пойдем! Я провожу тебя.
	AI_Output(self,other,"DIA_VLK_6130_Benchel_Go_01_01");	//Ну хорошо, пошли...
	BENCHELFOLLOWME = TRUE;
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"FOLLOW");
};

