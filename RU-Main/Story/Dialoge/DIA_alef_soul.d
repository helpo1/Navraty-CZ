
instance DIA_ALEF_SOUL_EXIT(C_Info)
{
	npc = alef_soul;
	nr = 999;
	condition = dia_alef_soul_exit_condition;
	information = dia_alef_soul_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_alef_soul_exit_condition()
{
	return TRUE;
};

func void dia_alef_soul_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ALEF_SOUL_HALLO(C_Info)
{
	npc = alef_soul;
	nr = 1;
	condition = dia_alef_soul_hallo_condition;
	information = dia_alef_soul_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_alef_soul_hallo_condition()
{
	if((TALKTOALEF == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_alef_soul_hallo_info()
{
	Snd_Play("MFX_FEAR_CAST");
	B_GivePlayerXP(100);
	AI_Output(self,other,"DIA_Alef_Soul_HALLO_01_00");	//(мертвым голосом) Зачем ты побеспокоил душу умершего, смертный? Что тебе нужно?
	AI_Output(other,self,"DIA_Alef_Soul_HALLO_01_01");	//Мне нужно кое-что узнать, призрак.
	AI_Output(self,other,"DIA_Alef_Soul_HALLO_01_02");	//Мертвые не в ответе перед живыми... Ты ничего не узнаешь от меня!
	AI_Output(other,self,"DIA_Alef_Soul_HALLO_01_03");	//Тебе придется ответить на мои вопросы - иначе тебя постигнет страшное разочарование. И ты догадываешься, какое!
	AI_Output(self,other,"DIA_Alef_Soul_HALLO_01_04");	//Ааргггхх! Задавай свои вопросы.
	AI_Output(other,self,"DIA_Alef_Soul_HALLO_01_06");	//Кажется, при жизни тебя звали Алеф и ты был рудокопом в старой шахте?
	AI_Output(self,other,"DIA_Alef_Soul_HALLO_01_07");	//Да... это я.
	AI_Output(other,self,"DIA_Alef_Soul_HALLO_01_08");	//Тогда ты должен помнить своих приятелей - Снайпса и Вайпера. Ты помнишь их?
	AI_Output(other,self,"DIA_Alef_Soul_HALLO_01_10");	//Однажды вам троим необычайно повезло: вы стали обладателями большого груза магической руды, которую должны были отвезти в Старый лагерь.
	AI_Output(other,self,"DIA_Alef_Soul_HALLO_01_11");	//Вы решили припрятать эту руду на лучшие времена, и именно ты отправился в пещеру закапывать руду. А в этот момент как раз рухнул Барьер.
	AI_Output(self,other,"DIA_Alef_Soul_HALLO_01_14");	//Да... но откуда тебе это известно?
	AI_Output(other,self,"DIA_Alef_Soul_HALLO_01_15");	//Сейчас это не имеет значения. Ответь мне на последний вопрос: где ты спрятал эту руду?
	AI_Output(self,other,"DIA_Alef_Soul_HALLO_01_16");	//...ищи мост через реку... рядом пещера, кругом вода - там внутри то, что ты ищешь...
	AI_Output(self,other,"DIA_Alef_Soul_HALLO_01_17");	//Ааргггг!!!
	AI_Output(self,other,"DIA_Alef_Soul_HALLO_01_20");	//Время вышло, смертный! Больше магические чары не властны надо мной!
	AI_Output(self,other,"DIA_Alef_Soul_HALLO_01_22");	//А ты сейчас умрешь, за то что потревожил меня!
	TALKTOALEF = TRUE;
	B_LogEntry(TOPIC_VIPERNUGGETS,"Ксардас вызвал душу Алефа. Душа не обрадовалась тому, что ее побеспокоили, однако все же ответила на мои вопросы насчет пропавшей руды. Судя по ее словам, руда находится в пещере недалеко от моста. Пещера едва заметна, поскольку вход в нее затоплен водой. Точное местонахождение мне так и не удалось выяснить, поскольку истекло время.");
	Info_ClearChoices(dia_alef_soul_hallo);
	Info_AddChoice(dia_alef_soul_hallo,"Это мы еще посмотрим!",dia_alef_soul_hallo_end);
};

func void dia_alef_soul_hallo_end()
{
	AI_Output(other,self,"DIA_Alef_Soul_Hallo_End_01_00");	//Это мы еще посмотрим!
	AI_Output(self,other,"DIA_Alef_Soul_Hallo_End_01_01");	//Ааррггхх!!! Умри, смертный!
	self.flags = NPC_FLAG_NONE;
	AI_StopProcessInfos(self);
};

