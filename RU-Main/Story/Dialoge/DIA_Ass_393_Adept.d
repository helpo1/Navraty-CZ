instance DIA_Ass_393_Adept_EXIT(C_Info)
{
	npc = Ass_393_Adept;
	nr = 999;
	condition = DIA_Ass_393_Adept_exit_condition;
	information = DIA_Ass_393_Adept_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Ass_393_Adept_exit_condition()
{
	return TRUE;
};

func void DIA_Ass_393_Adept_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Ass_393_Adept_Hello(C_Info)
{
	npc = Ass_393_Adept;
	nr = 1;
	condition = DIA_Ass_393_Adept_hello_condition;
	information = DIA_Ass_393_Adept_hello_info;
	permanent = FALSE;
	description = "У меня к тебе дело.";
};
	
func int DIA_Ass_393_Adept_hello_condition()
{
	return TRUE;
};	
	
func void DIA_Ass_393_Adept_hello_info()
{
	AI_Output(other,self,"DIA_Ass_393_Adept_hello_01_01");	//У меня к тебе дело.
	AI_Output(self,other,"DIA_Ass_393_Adept_hello_01_02");	//Интересно. Какое у тебя дело к Назиму?
	AI_Output(other,self,"DIA_Ass_393_Adept_hello_01_03");	//Ты не хотел бы поработать на приора Осаира?
	AI_Output(self,other,"DIA_Ass_393_Adept_hello_01_04");	//На Осаира? Да хоть на самого Белиара!
	AI_Output(self,other,"DIA_Ass_393_Adept_hello_01_05");	//Но только если он вытащит меня из этой проклятой дыры.
	AI_Output(self,other,"DIA_Ass_393_Adept_hello_01_06");	//Мне ужас как надоела эта пещера, но куда деваться - я должен охранять этих рабов!
	AI_Output(self,other,"DIA_Ass_393_Adept_hello_01_07");	//Но Ханиар с меня шкуру спустит, если я решу покинуть свой пост.
	AI_Output(other,self,"DIA_Ass_393_Adept_hello_01_08");	//Возможно, я смогу уладить твою проблему.
	AI_Output(self,other,"DIA_Ass_393_Adept_hello_01_09");	//Ты уж постарайся, брат! А я уж в долгу не останусь, будь уверен.
	NazimNeedGetOutCave = TRUE;
	B_LogEntry(TOPIC_CareOsair,"Назим хочет выбраться с рудника. Если я помогу ему, он готов поработать на Осаира. Думаю, стоит поговорить с Ханиаром на эту тему.");
};

instance DIA_Ass_393_Adept_GetOutCave(C_Info)
{
	npc = Ass_393_Adept;
	nr = 1;
	condition = DIA_Ass_393_Adept_GetOutCave_condition;
	information = DIA_Ass_393_Adept_GetOutCave_info;
	permanent = FALSE;
	description = "Я тут поговорил с Ханиаром...";
};
	
func int DIA_Ass_393_Adept_GetOutCave_condition()
{
	if((MIS_CareOsair == LOG_Running) && ((NazimPissOff == TRUE) || (NazimGetOutCave == TRUE) || (NazimStayInCave == TRUE)))
	{
		return TRUE;
	};
};	
	
func void DIA_Ass_393_Adept_GetOutCave_info()
{
	AI_Output(other,self,"DIA_Ass_393_Adept_GetOutCave_01_01");	//Я тут поговорил с Ханиаром...

	if(NazimPissOff == TRUE)
	{
		AI_Output(self,other,"DIA_Ass_393_Adept_GetOutCave_01_02");	//(гневно) Можешь не распинаться тут. Я уже наслышан!
		AI_Output(self,other,"DIA_Ass_393_Adept_GetOutCave_01_03");	//И теперь по твоей милости я застряну в этой пещере на всю свою оставшуюся жизнь!
		AI_Output(self,other,"DIA_Ass_393_Adept_GetOutCave_01_04");	//Так что постарайся больше не попадаться мне на глаза.
		AI_Output(self,other,"DIA_Ass_393_Adept_GetOutCave_01_05");	//Иначе я за себя не отвечаю!
		B_LogEntry(TOPIC_CareOsair,"Теперь Назим даже видеть меня не желает. Не говоря уже про то, чтобы слушать.");
	}
	else if(NazimStayInCave == TRUE)
	{
		B_GivePlayerXP(100);
		AI_Output(self,other,"DIA_Ass_393_Adept_GetOutCave_01_06");	//И что он сказал?
		AI_Output(other,self,"DIA_Ass_393_Adept_GetOutCave_01_07");	//Тебе придется еще немного побыть в этой шахте.
		AI_Output(self,other,"DIA_Ass_393_Adept_GetOutCave_01_08");	//Я так и думал. Этот старый хрыч сведет меня в могилу.
		AI_Output(self,other,"DIA_Ass_393_Adept_GetOutCave_01_09");	//Ладно, Белиар с ним! Но ты подал мне отличную идею насчет приора Осаира.
		AI_Output(self,other,"DIA_Ass_393_Adept_GetOutCave_01_10");	//Главное побыстрей выбраться отсюда. И тогда я сам позабочусь обо всем!
		B_LogEntry(TOPIC_CareOsair,"Мне не удалось помочь Назиму. Теперь я вряд ли смогу переманить его на сторону Осаира. Хотя это и не требуется - Назим сам решил поменять наставника. Все сложилось как нельзя лучше.");
	}
	else if(NazimGetOutCave == TRUE)
	{
		B_GivePlayerXP(1000);
		AI_Output(other,self,"DIA_Ass_393_Adept_GetOutCave_01_11");	//Ты можешь покинуть свой пост в шахте.
		AI_Output(self,other,"DIA_Ass_393_Adept_GetOutCave_01_12");	//(недоверчиво) Это правда? Неужели Ханиар наконец-то сжалился надо мной?
		AI_Output(other,self,"DIA_Ass_393_Adept_GetOutCave_01_13");	//Да, это правда. И, если не хочешь вновь очутиться здесь, лучше воспользуйся моим предложением.
		AI_Output(self,other,"DIA_Ass_393_Adept_GetOutCave_01_14");	//Насчет работы на приора Осаира?
		AI_Output(other,self,"DIA_Ass_393_Adept_GetOutCave_01_15");	//Именно.
		AI_Output(self,other,"DIA_Ass_393_Adept_GetOutCave_01_16");	//Хммм...(задумчиво) Полагаю, я так и сделаю. У него, я слышал, люди в роскоши купаются.
		AI_Output(self,other,"DIA_Ass_393_Adept_GetOutCave_01_17");	//Так что сейчас же и отправлюсь к нему. Спасибо за помощь, брат.
		B_LogEntry(TOPIC_CareOsair,"Я вытащил Назима из шахты, и только благодаря тому, что Ханиар тоже был заинтересован в этом.");
		Npc_ExchangeRoutine(self,"WaitInOsairCave");
	};

	NazimKnowAboutCave = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_Ass_393_Adept_NazimPissOff(C_Info)
{
	npc = Ass_393_Adept;
	nr = 1;
	condition = DIA_Ass_393_Adept_NazimPissOff_condition;
	information = DIA_Ass_393_Adept_NazimPissOff_info;
	permanent = TRUE;
	important = TRUE;
};
	
func int DIA_Ass_393_Adept_NazimPissOff_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && Npc_KnowsInfo(other,DIA_Ass_393_Adept_GetOutCave) && (NazimPissOff == TRUE))
	{
		return TRUE;
	};
};	
	
func void DIA_Ass_393_Adept_NazimPissOff_info()
{
	AI_Output(self,other,"DIA_Ass_393_Adept_NazimPissOff_01_01");	//Кажется, я тебя предупреждал...
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};