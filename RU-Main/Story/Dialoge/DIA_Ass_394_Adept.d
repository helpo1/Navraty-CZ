instance DIA_Ass_394_Adept_EXIT(C_Info)
{
	npc = Ass_394_Adept;
	nr = 999;
	condition = DIA_Ass_394_Adept_exit_condition;
	information = DIA_Ass_394_Adept_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Ass_394_Adept_exit_condition()
{
	return TRUE;
};

func void DIA_Ass_394_Adept_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Ass_394_Adept_Hello(C_Info)
{
	npc = Ass_394_Adept;
	nr = 1;
	condition = DIA_Ass_394_Adept_hello_condition;
	information = DIA_Ass_394_Adept_hello_info;
	permanent = FALSE;
	description = "Кудир?";
};
	
func int DIA_Ass_394_Adept_hello_condition()
{
	if(MIS_CareOsair == LOG_Running)
	{
		return TRUE;
	};
};	
	
func void DIA_Ass_394_Adept_hello_info()
{
	AI_Output(other,self,"DIA_Ass_394_Adept_hello_01_01");	//Кудир?
	AI_Output(self,other,"DIA_Ass_394_Adept_hello_01_02");	//Да, это я. Что привело тебя ко мне, брат?
	AI_Output(other,self,"DIA_Ass_394_Adept_hello_01_03");	//Тебя было довольно трудно отыскать.
	AI_Output(self,other,"DIA_Ass_394_Adept_hello_01_04");	//Не сомневаюсь. Тебе еще повезло, что ты смог меня застать тут. Обычно я редко бываю в храме.
	AI_Output(other,self,"DIA_Ass_394_Adept_hello_01_05");	//А чем ты занимаешься?

	if(NrozasIsDead == FALSE)
	{
		AI_Output(self,other,"DIA_Ass_394_Adept_hello_01_06");	//В основном я собираю редкие травы и ингредиенты для мастера Нрозаса.
		AI_Output(self,other,"DIA_Ass_394_Adept_hello_01_07");	//Правда, в этой долине нечасто можно найти действительно ценный экземпляр.
		AI_Output(self,other,"DIA_Ass_394_Adept_hello_01_08");	//Поэтому большую часть времени я путешествую по всему острову.
		AI_Output(self,other,"DIA_Ass_394_Adept_hello_01_09");	//Кстати, зачем ты искал меня?
		AI_Output(other,self,"DIA_Ass_394_Adept_hello_01_10");	//У меня к тебе есть одно небольшое предложение.
		AI_Output(self,other,"DIA_Ass_394_Adept_hello_01_11");	//Интересно, какое?
		AI_Output(other,self,"DIA_Ass_394_Adept_hello_01_12");	//Приор Осаир ищет себе новых людей. Я подумал, что тебя это заинтересует.
		AI_Output(self,other,"DIA_Ass_394_Adept_hello_01_13");	//(надменно) Осаир? Хммм. Боюсь, что ты обратился не по адресу, брат.
		AI_Output(self,other,"DIA_Ass_394_Adept_hello_01_14");	//Я уже работаю на приора Нрозаса. И пока что меня все устраивает.
		AI_Output(other,self,"DIA_Ass_394_Adept_hello_01_15");	//А я могу как-нибудь переубедить тебя?
		AI_Output(self,other,"DIA_Ass_394_Adept_hello_01_16");	//Хммм. А ты умеешь заинтересовать людей, да?
		AI_Output(self,other,"DIA_Ass_394_Adept_hello_01_17");	//Если хорошенько подумать, то действительно есть одна вещь, которую бы я хотел получить.
		AI_Output(self,other,"DIA_Ass_394_Adept_hello_01_18");	//Так что, если сможешь достать ее для меня, то, считай, мы договорились.
		AI_Output(other,self,"DIA_Ass_394_Adept_hello_01_19");	//И что это?
		AI_Output(self,other,"DIA_Ass_394_Adept_hello_01_20");	//Одно очень редкое растение. Его еще называют вишней тролля.
		AI_Output(self,other,"DIA_Ass_394_Adept_hello_01_21");	//Я как-то пытался самостоятельно отыскать его, но все безрезультатно.
		AI_Output(self,other,"DIA_Ass_394_Adept_hello_01_22");	//Судя по названию, оно должно произрастать в месте обитания троллей.
		AI_Output(self,other,"DIA_Ass_394_Adept_hello_01_23");	//Но я не больной, чтобы ошиваться рядом с этими парнями. Они просто в два счета оставят от меня мокрое место!
		AI_Output(self,other,"DIA_Ass_394_Adept_hello_01_24");	//Ну а ты можешь попробовать. Если, конечно, хочешь, чтобы я принял предложение Осаира.
		AI_Output(other,self,"DIA_Ass_394_Adept_hello_01_25");	//Ладно, я попробую.
		KudirNeedTrollPlant = TRUE;
		B_LogEntry(TOPIC_CareOsair,"Кудир попросил меня найти для него редкое растение - вишню тролля. Тогда он согласится поработать на Осаира.");
		AI_StopProcessInfos(self);
		Wld_InsertItem(ITPL_SUPER_HERB,"FP_ITEMSPAWN_KUDIR_PLANT");
	}
	else
	{
		AI_Output(self,other,"DIA_Ass_394_Adept_hello_01_26");	//До последнего времени я занимался сбором редких трав и ингредиентов для мастера Нрозаса.
		AI_Output(self,other,"DIA_Ass_394_Adept_hello_01_27");	//Но теперь я работаю на приора Ханиара. Выполняю для него различную работенку.
		AI_Output(self,other,"DIA_Ass_394_Adept_hello_01_28");	//Кстати, зачем ты искал меня?
		AI_Output(other,self,"DIA_Ass_394_Adept_hello_01_29");	//У меня к тебе есть одно небольшое предложение.
		AI_Output(self,other,"DIA_Ass_394_Adept_hello_01_30");	//Интересно, какое?
		AI_Output(other,self,"DIA_Ass_394_Adept_hello_01_31");	//Приор Осаир ищет себе новых людей. Я подумал, что тебя это заинтересует.
		AI_Output(self,other,"DIA_Ass_394_Adept_hello_01_32");	//(надменно) Осаир? Хммм. Боюсь, что ты обратился не по адресу, брат.
		AI_Output(self,other,"DIA_Ass_394_Adept_hello_01_33");	//Это самое последнее, что сможет меня заинтересовать в этой жизни.
		AI_Output(other,self,"DIA_Ass_394_Adept_hello_01_34");	//Это почему?
		AI_Output(self,other,"DIA_Ass_394_Adept_hello_01_35");	//Потому что никогда не знаешь, что от него можно ожидать. Он слишком хитер и непредсказуем.
		AI_Output(self,other,"DIA_Ass_394_Adept_hello_01_36");	//Я никогда не доверял ему - и тебе не советую.
		KudirPissOff = TRUE;
		B_LogEntry(TOPIC_CareOsair,"Кудир теперь работает на приора Ханиара. Вряд ли он согласится на мое предложение.");
		AI_StopProcessInfos(self);
	};

};

instance DIA_Ass_394_Adept_GetPlant(C_Info)
{
	npc = Ass_394_Adept;
	nr = 1;
	condition = DIA_Ass_394_Adept_GetPlant_condition;
	information = DIA_Ass_394_Adept_GetPlant_info;
	permanent = FALSE;
	description = "Я принес тебе вишню троллей.";
};
	
func int DIA_Ass_394_Adept_GetPlant_condition()
{
	if((MIS_CareOsair == LOG_Running) && (KudirNeedTrollPlant == TRUE) && (Npc_HasItems(other,ITPL_SUPER_HERB) >= 1))
	{
		return TRUE;
	};
};	
	
func void DIA_Ass_394_Adept_GetPlant_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Ass_394_Adept_GetPlant_01_01");	//Я принес тебе вишню троллей.
	AI_Output(self,other,"DIA_Ass_394_Adept_GetPlant_01_02");	//Неужели ты смог ее отыскать?
	AI_Output(other,self,"DIA_Ass_394_Adept_GetPlant_01_03");	//Как видишь. Вот, держи.
	B_GiveInvItems(other,self,ITPL_SUPER_HERB,1);
	Npc_RemoveInvItems(self,ITPL_SUPER_HERB,1);
	AI_Output(self,other,"DIA_Ass_394_Adept_GetPlant_01_04");	//Отлично! Что же, ты выполнил свою часть сделки.
	AI_Output(self,other,"DIA_Ass_394_Adept_GetPlant_01_05");	//Теперь пришло время мне выполнить свою.
	AI_Output(self,other,"DIA_Ass_394_Adept_GetPlant_01_06");	//Поэтому можешь передать Осаиру, что отныне я его человек.
	KudirGetTrollPlant = TRUE;
	B_LogEntry(TOPIC_CareOsair,"Я принес Кудиру вишню троллей. Теперь он человек Осаира.");
	AI_StopProcessInfos(self);
};


instance DIA_Ass_394_Adept_KadirPissOff(C_Info)
{
	npc = Ass_394_Adept;
	nr = 1;
	condition = DIA_Ass_394_Adept_KadirPissOff_condition;
	information = DIA_Ass_394_Adept_KadirPissOff_info;
	permanent = TRUE;
	important = TRUE;
};
	
func int DIA_Ass_394_Adept_KadirPissOff_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (KudirPissOff == TRUE))
	{
		return TRUE;
	};
};	
	
func void DIA_Ass_394_Adept_KadirPissOff_info()
{
	AI_Output(self,other,"DIA_Ass_394_Adept_KadirPissOff_01_01");	//Извини, брат. Но я занят.
	AI_StopProcessInfos(self);
};