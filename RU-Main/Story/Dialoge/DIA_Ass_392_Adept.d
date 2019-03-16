instance DIA_Ass_392_Adept_EXIT(C_Info)
{
	npc = Ass_392_Adept;
	nr = 999;
	condition = DIA_Ass_392_Adept_exit_condition;
	information = DIA_Ass_392_Adept_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Ass_392_Adept_exit_condition()
{
	return TRUE;
};

func void DIA_Ass_392_Adept_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Ass_392_Adept_Hello(C_Info)
{
	npc = Ass_392_Adept;
	nr = 1;
	condition = DIA_Ass_392_Adept_hello_condition;
	information = DIA_Ass_392_Adept_hello_info;
	permanent = FALSE;
	description = "Кто ты?";
};
	
func int DIA_Ass_392_Adept_hello_condition()
{
	return TRUE;
};	
	
func void DIA_Ass_392_Adept_hello_info()
{
	AI_Output(other,self,"DIA_Ass_392_Adept_hello_01_01");	//Кто ты?
	AI_Output(self,other,"DIA_Ass_392_Adept_hello_01_02");	//Мое имя Рафат, брат.
	AI_Output(other,self,"DIA_Ass_392_Adept_hello_01_03");	//Я раньше не видел тебя в храме.
	AI_Output(self,other,"DIA_Ass_392_Adept_hello_01_04");	//Это неудивительно. Ведь практически все время я провожу в молитвах у алтаря Белиара в долине.
	AI_Output(other,self,"DIA_Ass_392_Adept_hello_01_05");	//А почему ты не молишься в храме?
	AI_Output(self,other,"DIA_Ass_392_Adept_hello_01_06");	//Эээм... это довольно долгая история, брат.
	AI_Output(other,self,"DIA_Ass_392_Adept_hello_01_07");	//Я готов ее послушать.
	AI_Output(self,other,"DIA_Ass_392_Adept_hello_01_08");	//Одним словом, мне просто нельзя молиться тут!
	AI_Output(other,self,"DIA_Ass_392_Adept_hello_01_09");	//Но почему?
	AI_Output(self,other,"DIA_Ass_392_Adept_hello_01_10");	//Потому, что приор Ханиар запретил мне это делать до тех пор, пока мой дух не преисполнится силой и уверенностью. 
	AI_Output(other,self,"DIA_Ass_392_Adept_hello_01_11");	//Похоже, ты в чем-то провинился перед ним.
	AI_Output(self,other,"DIA_Ass_392_Adept_hello_01_12");	//Да, ты прав. Но я не хочу говорить об этом.
};

instance DIA_Ass_392_Adept_Deal(C_Info)
{
	npc = Ass_392_Adept;
	nr = 1;
	condition = DIA_Ass_392_Adept_Deal_condition;
	information = DIA_Ass_392_Adept_Deal_info;
	permanent = FALSE;
	description = "Ты работаешь на приора Ханиара?";
};
	
func int DIA_Ass_392_Adept_Deal_condition()
{
	if(Npc_KnowsInfo(other,DIA_Ass_392_Adept_hello) && (MIS_CareOsair == LOG_Running))
	{
		return TRUE;
	};
};	
	
func void DIA_Ass_392_Adept_Deal_info()
{
	AI_Output(other,self,"DIA_Ass_392_Adept_Deal_01_01");	//Ты работаешь на приора Ханиара?
	AI_Output(self,other,"DIA_Ass_392_Adept_Deal_01_02");	//Не совсем. Ханиар лишь является моим духовным наставником.
	AI_Output(self,other,"DIA_Ass_392_Adept_Deal_01_03");	//Правда, я уже чуть не пожалел об этом. Особенно после того случая с Хасимом.
	AI_Output(other,self,"DIA_Ass_392_Adept_Deal_01_04");	//А ты не думал сменить своего наставника?
	AI_Output(self,other,"DIA_Ass_392_Adept_Deal_01_05");	//Не думаю, что кто-то из приоров решит взять меня под свое покровительство.
	AI_Output(self,other,"DIA_Ass_392_Adept_Deal_01_06");	//К тому же Ханиар придет просто в ярость, если вдруг узнает об этом.
	AI_Output(other,self,"DIA_Ass_392_Adept_Deal_01_07");	//Я слышал, что приору Осаиру нужны такие преданные люди, как ты.
	AI_Output(self,other,"DIA_Ass_392_Adept_Deal_01_08");	//Ты это серьезно? Или же ты просто испытываешь мое терпение?
	AI_Output(other,self,"DIA_Ass_392_Adept_Deal_01_09");	//Я лишь хочу сказать, что тебе не стоит упускать такой шанс.
	AI_Output(other,self,"DIA_Ass_392_Adept_Deal_01_10");	//И тогда, возможно, тебе снова разрешат молиться в храме.
	AI_Output(self,other,"DIA_Ass_392_Adept_Deal_01_11");	//Хммм...(задумчиво) Это было бы прекрасно!
	AI_Output(self,other,"DIA_Ass_392_Adept_Deal_01_12");	//Но не будучи полностью уверенным в этом, я вряд ли решусь на такой шаг.
	AI_Output(other,self,"DIA_Ass_392_Adept_Deal_01_13");	//А если я поговорю с Осаиром и он даст тебе подобное разрешение?
	AI_Output(self,other,"DIA_Ass_392_Adept_Deal_01_14");	//Если так, тогда я, пожалуй, попрошусь к нему в наставники.
	AI_Output(self,other,"DIA_Ass_392_Adept_Deal_01_15");	//Но не раньше, чем я получу его разрешение.
	AI_Output(other,self,"DIA_Ass_392_Adept_Deal_01_16");	//Хорошо, я тебя понял.
	RafatNeedPermission = TRUE;
	B_LogEntry(TOPIC_CareOsair,"Рафат хочет снова молиться в храме, но без разрешения одного из приоров он не может этого сделать. Надо поговорить об этом с Осаиром.");
};

instance DIA_Ass_392_Adept_Deal_Done(C_Info)
{
	npc = Ass_392_Adept;
	nr = 1;
	condition = DIA_Ass_392_Adept_Deal_Done_condition;
	information = DIA_Ass_392_Adept_Deal_Done_info;
	permanent = FALSE;
	description = "Теперь ты можешь молиться в храме.";
};
	
func int DIA_Ass_392_Adept_Deal_Done_condition()
{
	if((MIS_CareOsair == LOG_Running) && (RafatGetPermission == TRUE))
	{
		return TRUE;
	};
};	
	
func void DIA_Ass_392_Adept_Deal_Done_info()
{
	B_GivePlayerXP(400);
	AI_Output(other,self,"DIA_Ass_392_Adept_Deal_Done_01_01");	//Теперь ты можешь молиться в храме.
	AI_Output(self,other,"DIA_Ass_392_Adept_Deal_Done_01_02");	//(недоверчиво) Ты это серьезно?
	AI_Output(other,self,"DIA_Ass_392_Adept_Deal_Done_01_03");	//Приор Осаир дал на то свое разрешение. Можешь ни о чем не беспокоиться.
	AI_Output(self,other,"DIA_Ass_392_Adept_Deal_Done_01_04");	//Что же, тогда, пожалуй, стоит отплатить ему тем же.
	B_LogEntry(TOPIC_CareOsair,"Рафат теперь может молиться в храме с разрешения Осаира. И наверняка ряды верных приору людей вскоре пополнятся.");
	RafatAgreed = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"PrayInHram");
};