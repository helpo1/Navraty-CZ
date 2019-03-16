var int FirstMeet;

instance DIA_TPL_8014_TEMPLER_EXIT(C_Info)
{
	npc = tpl_8014_templer;
	nr = 999;
	condition = dia_tpl_8014_templer_exit_condition;
	information = dia_tpl_8014_templer_exit_info;
	permanent = 1;
	description = Dialog_Ende;
};


func int dia_tpl_8014_templer_exit_condition()
{
	return TRUE;
};

func void dia_tpl_8014_templer_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TPL_8014_TEMPLER_FIRST(C_Info)
{
	npc = tpl_8014_templer;
	nr = 2;
	condition = dia_tpl_8014_templer_first_condition;
	information = dia_tpl_8014_templer_first_info;
	permanent = 0;
	important = 1;
};


func int dia_tpl_8014_templer_first_condition()
{
	if((STARTBIGBATTLE == FALSE) && (BIGBATTLEBACKPOSITION == FALSE))
	{
		return TRUE;
	};
};

func void dia_tpl_8014_templer_first_info()
{
	AI_Output(self,other,"DIA_TPL_8014_Templer_First_13_00");	//Привет, незнакомец!
	AI_Output(self,other,"DIA_TPL_8014_Templer_First_13_01");	//То, что ты видишь перед собой - новый лагерь нашего Братства.
	AI_Output(self,other,"DIA_TPL_8014_Templer_First_13_02");	//Что привело тебя сюда?
	FirstMeet = TRUE;
	Info_ClearChoices(dia_tpl_8014_templer_first);
	Info_AddChoice(dia_tpl_8014_templer_first,"Я хочу осмотреть Лагерь.",dia_tpl_8014_templer_first_justlooking);
	if(other.guild == GIL_NONE)
	{
		Info_AddChoice(dia_tpl_8014_templer_first,"Я хочу присоединиться к вам.",dia_tpl_8014_templer_first_join);
	};
};

func void dia_tpl_8014_templer_first_join()
{
	AI_Output(other,self,"DIA_TPL_8014_Templer_First_Join_15_00");	//Я слышал о том, что вам нужны люди. Я хочу присоединиться к вам.
	AI_Output(self,other,"DIA_TPL_8014_Templer_First_Join_13_01");	//Добро пожаловать! Братство с радостью примет любого, кто ищет душевного покоя.
	AI_Output(self,other,"DIA_TPL_8014_Templer_First_Join_13_02");	//Если твои намерения серьезны, постарайся обратить на себя внимание Идола Намиба. Ты найдешь его во дворе за воротами.
	AI_Output(self,other,"DIA_TPL_8014_Templer_First_Join_13_04");	//Но ты не должен обращаться к нему до тех пор, пока он сам не заговорит с тобой.
	Info_ClearChoices(dia_tpl_8014_templer_first);
};

func void dia_tpl_8014_templer_first_justlooking()
{
	AI_Output(other,self,"DIA_TPL_8014_Templer_First_JustLooking_15_00");	//Я хочу осмотреть Лагерь.
	AI_Output(self,other,"DIA_TPL_8014_Templer_First_JustLooking_13_01");	//Заходи, друг! Мы всегда рады гостям.
	AI_Output(self,other,"DIA_TPL_8014_Templer_First_JustLooking_13_02");	//Но только не создавай здесь проблем и не отвлекай Идолов от работы.
	Info_ClearChoices(dia_tpl_8014_templer_first);
};


instance DIA_TPL_8014_TEMPLER_SIT(C_Info)
{
	npc = tpl_8014_templer;
	nr = 2;
	condition = dia_tpl_8014_templer_sit_condition;
	information = dia_tpl_8014_templer_sit_info;
	permanent = 1;
	description = "Как дела в Лагере?";
};


func int dia_tpl_8014_templer_sit_condition()
{
	if((STARTBIGBATTLE == FALSE) && (BIGBATTLEBACKPOSITION == FALSE))
	{
		return TRUE;
	};
};

func void dia_tpl_8014_templer_sit_info()
{
	AI_Output(other,self,"DIA_TPL_8014_Templer_Sit_15_00");	//Как дела в Лагере?
	AI_Output(self,other,"DIA_TPL_8014_Templer_Sit_13_01");	//Все тихо. Заходи.
};

instance DIA_TPL_8014_TEMPLER_PrioratStart(C_Info)
{
	npc = tpl_8014_templer;
	nr = 2;
	condition = dia_tpl_8014_templer_PrioratStart_condition;
	information = dia_tpl_8014_templer_PrioratStart_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_tpl_8014_templer_PrioratStart_condition()
{
	if((STARTBIGBATTLE == FALSE) && (BIGBATTLEBACKPOSITION == FALSE) && (Kapitel >= 3) && (FirstMeet == TRUE))
	{
		return TRUE;
	};
};

func void dia_tpl_8014_templer_PrioratStart_info()
{
	if((hero.guild == GIL_SEK) || (hero.guild == GIL_GUR) || (hero.guild == GIL_TPL))
	{
		if(hero.guild == GIL_SEK)
		{
			AI_Output(self,other,"DIA_TPL_8014_Templer_PrioratStart_01_00");	//Постой, послушник!
			AI_Output(other,self,"DIA_TPL_8014_Templer_PrioratStart_01_01");	//Что такое?
			AI_Output(self,other,"DIA_TPL_8014_Templer_PrioratStart_01_02");	//Идол Намиб срочно хотел поговорить с тобой. Поэтому сразу же ступай к нему.
		}
		else if(hero.guild == GIL_GUR)
		{
			AI_Output(self,other,"DIA_TPL_8014_Templer_PrioratStart_01_05");	//Прошу простить меня, мастер...
			AI_Output(other,self,"DIA_TPL_8014_Templer_PrioratStart_01_06");	//Я слушаю тебя, страж. Что случилось?
			AI_Output(self,other,"DIA_TPL_8014_Templer_PrioratStart_01_07");	//Ничего, мастер. Просто Идол Намиб попросил меня передать вам, что он срочно хотел вас видеть.
		}
		else if(hero.guild == GIL_TPL)
		{
			AI_Output(self,other,"DIA_TPL_8014_Templer_PrioratStart_01_10");	//Постой, брат.
			AI_Output(other,self,"DIA_TPL_8014_Templer_PrioratStart_01_11");	//Что такое?
			AI_Output(self,other,"DIA_TPL_8014_Templer_PrioratStart_01_12");	//Идол Намиб срочно хотел поговорить с тобой. Так что лучше сразу иди к нему.
		};

	}
	else
	{
		AI_Output(self,other,"DIA_TPL_8014_Templer_PrioratStart_01_15");	//Постой, незнакомец! Один из наших духовных наставников очень хотел бы поговорить с тобой.
		AI_Output(other,self,"DIA_TPL_8014_Templer_PrioratStart_01_18");	//И что же ему вдруг понадобилось от меня?
		AI_Output(self,other,"DIA_TPL_8014_Templer_PrioratStart_01_19");	//Это ты выяснишь у него сам. Глупо полагать, что наши наставники посвящают нас, стражей, во все свои дела.
		AI_Output(self,other,"DIA_TPL_8014_Templer_PrioratStart_01_21");	//Тебе следует обратиться к Идолу Намибу. Обычно он находится на площадке для медитаций, справа от входа в лагерь.
	};

	PrioratPreStart = TRUE;
	AI_StopProcessInfos(self);
};