instance DIA_SEK_156_SLAVEOBSSEK_EXIT(C_Info)
{
	npc = SEK_156_SLAVEOBSSEK;
	nr = 999;
	condition = dia_SEK_156_SLAVEOBSSEK_exit_condition;
	information = dia_SEK_156_SLAVEOBSSEK_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int dia_SEK_156_SLAVEOBSSEK_exit_condition()
{
	return TRUE;
};

func void dia_SEK_156_SLAVEOBSSEK_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SEK_156_SLAVEOBSSEK_HALLO(C_Info)
{
	npc = SEK_156_SLAVEOBSSEK;
	nr = 1;
	condition = dia_SEK_156_SLAVEOBSSEK_hallo_condition;
	information = dia_SEK_156_SLAVEOBSSEK_hallo_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_SEK_156_SLAVEOBSSEK_hallo_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_SEK_156_SLAVEOBSSEK_hallo_info()
{
	var int randy;

	randy = Hlp_Random(3);

	if((MIS_RebelSlave == LOG_Running) && (FindMistake == FALSE) && (KnowWhoRebels == FALSE))
	{
		AI_Output(self,other,"DIA_SEK_156_SLAVEOBSSEK_HALLO_01_01");	//Если я не выберусь из этого места, то, скорее всего, сдохну!
		FindMistake = TRUE;
		AI_StopProcessInfos(self);
	}
	else if((MIS_RebelSlave == LOG_Running) && (PW_BetrayFollowMe == FALSE) && (BetrayFound == TRUE))
	{
		AI_Output(other,self,"DIA_SEK_156_SLAVEOBSSEK_HALLO_01_02");	//Эй, ты! Немедленно следуй за мной. Тебя хочет видеть сам Осаир!
		AI_Output(self,other,"DIA_SEK_156_SLAVEOBSSEK_HALLO_01_03");	//(боязно) Осаир? А могу я узнать, зачем?
		AI_Output(other,self,"DIA_SEK_156_SLAVEOBSSEK_HALLO_01_04");	//Просто он хочет лично отблагодарить тебя за помощь в поимке заговорщика. 
		AI_Output(other,self,"DIA_SEK_156_SLAVEOBSSEK_HALLO_01_05");	//Только не вздумай открывать при нем свой рот! Иначе я его лично закрою.
		AI_Output(self,other,"DIA_SEK_156_SLAVEOBSSEK_HALLO_01_06");	//Хорошо, хорошо. Я иду.
		PW_BetrayFollowMe = TRUE;
		self.aivar[AIV_PARTYMEMBER] = TRUE;
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"OsairReady");
	}
	else if((MIS_RebelSlave == LOG_Running) && (PW_BetrayFollowMe == TRUE) && (BetrayFound == TRUE))
	{
		AI_Output(self,other,"DIA_SEK_156_SLAVEOBSSEK_HALLO_01_07");	//Я иду, иду...
		AI_StopProcessInfos(self);
	}
	else if((MIS_RebelSlave == LOG_Running) && (FindMistake == TRUE) && (KnowWhoRebels == FALSE))
	{
		B_GivePlayerXP(150);
		AI_Output(other,self,"DIA_SEK_156_SLAVEOBSSEK_HALLO_01_08");	//Эй! А с чего ты взял, что вообще сможешь выбраться отсюда?
		AI_Output(self,other,"DIA_SEK_156_SLAVEOBSSEK_HALLO_01_09");	//Эммм...(замялся) Не обращай внимания. Это я так, просто... Мысли вслух.
		AI_Output(other,self,"DIA_SEK_156_SLAVEOBSSEK_HALLO_01_10");	//Давай, выкладывай все, что знаешь!
		AI_Output(other,self,"DIA_SEK_156_SLAVEOBSSEK_HALLO_01_11");	//Иначе я позабочусь о том, чтобы тобой лично занялись телохранители Осаира.
		AI_Output(self,other,"DIA_SEK_156_SLAVEOBSSEK_HALLO_01_12");	//Ладно, ладно...(трусливо) Я все скажу. Только не рассказывай об этом стражникам.
		AI_Output(self,other,"DIA_SEK_156_SLAVEOBSSEK_HALLO_01_13");	//Это все Мариус! Он постоянно говорит о том, что готовит побег.
		AI_Output(self,other,"DIA_SEK_156_SLAVEOBSSEK_HALLO_01_14");	//И подбивает нас поднять бунт против людей Масиафа.
		AI_Output(self,other,"DIA_SEK_156_SLAVEOBSSEK_HALLO_01_15");	//Он даже специально вызвался работать в храме, чтобы постараться достать для нас оружие.
		AI_Output(self,other,"DIA_SEK_156_SLAVEOBSSEK_HALLO_01_16");	//А больше мне ничего не известно...
		AI_Output(other,self,"DIA_SEK_156_SLAVEOBSSEK_HALLO_01_17");	//Надеюсь, что ты не соврал. Иначе будет хуже.
		B_LogEntry(TOPIC_RebelSlave,"Кажется, я напал на след. Один из рабов проговорился, что раб Мариус готовит побег и подбивает остальных поднять бунт против охранников. Полагаю, его слова надо сначала проверить, прежде чем докладывать об этом Осаиру.");
		KnowWhoRebels = TRUE;
		MariusIns = TRUE;
		AI_StopProcessInfos(self);
		Wld_InsertNpc(SEK_169_SLAVEOBSSEK,"PW_TEMPLE_MARIUS_01");
	}
	else
	{
		if(randy == 0)
		{
			AI_Output(self,other,"DIA_SEK_156_STANDARD_13_00");	//Оставь меня в покое!
		};
		if(randy == 1)
		{
			AI_Output(self,other,"DIA_SEK_156_STANDARD_13_01");	//Что тебе нужно от меня? Оставь меня в покое!
		};
		if(randy == 2)
		{
			AI_Output(self,other,"DIA_SEK_156_STANDARD_13_02");	//Мы все умрем здесь!
		};

		AI_StopProcessInfos(self);
	};
};