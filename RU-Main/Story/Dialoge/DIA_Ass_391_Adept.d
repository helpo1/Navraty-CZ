var int FazimRefuseTalk;
var int FazimFirstMeet;


instance DIA_Ass_391_Adept_EXIT(C_Info)
{
	npc = Ass_391_Adept;
	nr = 999;
	condition = DIA_Ass_391_Adept_exit_condition;
	information = DIA_Ass_391_Adept_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Ass_391_Adept_exit_condition()
{
	return TRUE;
};

func void DIA_Ass_391_Adept_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Ass_391_Adept_Hello(C_Info)
{
	npc = Ass_391_Adept;
	nr = 1;
	condition = DIA_Ass_391_Adept_hello_condition;
	information = DIA_Ass_391_Adept_hello_info;
	permanent = FALSE;
	description = "Тебя зовут Фамид?";
};
	
func int DIA_Ass_391_Adept_hello_condition()
{
	if((MIS_CareOsair == LOG_Running) && (FazimAgreed == FALSE))
	{
		return TRUE;
	};
};	
	
func void DIA_Ass_391_Adept_hello_info()
{
	AI_Output(other,self,"DIA_Ass_391_Adept_hello_01_01");	//Тебя зовут Фамид?
	AI_Output(self,other,"DIA_Ass_391_Adept_hello_01_02");	//Да, брат. Именно такое имя мне дали при рождении.
	AI_Output(other,self,"DIA_Ass_391_Adept_hello_01_03");	//У меня к тебе одно небольшое дельце.
	AI_Output(self,other,"DIA_Ass_391_Adept_hello_01_04");	//Что же, я тебя слушаю.
	AI_Output(other,self,"DIA_Ass_391_Adept_hello_01_05");	//Ты бы не хотел немного поработать на приора Осаира?
	AI_Output(self,other,"DIA_Ass_391_Adept_hello_01_06");	//А разве у Осаира мало своих людей, что ему понадобился я?
	AI_Output(other,self,"DIA_Ass_391_Adept_hello_01_07");	//Достаточно. Но лишние люди ему никогда не помешают. Так тебя это интересует?
	AI_Output(self,other,"DIA_Ass_391_Adept_hello_01_08");	//Хммм. Предложение довольно интересное. Учитывая, что другие приоры не очень-то меня жалуют.
	AI_Output(self,other,"DIA_Ass_391_Adept_hello_01_09");	//Но моя верность напрямую будет зависеть от его щедрости.
	AI_Output(other,self,"DIA_Ass_391_Adept_hello_01_10");	//Ты имеешь в виду золото?
	AI_Output(self,other,"DIA_Ass_391_Adept_hello_01_11");	//Именно его, брат. Поскольку единственное, что меня интересует в жизни, это золото. Причем в любом виде!
	AI_Output(self,other,"DIA_Ass_391_Adept_hello_01_12");	//И чем больше его у меня, тем лучше я себя чувствую.
	AI_Output(other,self,"DIA_Ass_391_Adept_hello_01_13");	//То есть предложение тебя устраивает, и остается лишь сойтись в цене?
	AI_Output(self,other,"DIA_Ass_391_Adept_hello_01_14");	//Это самое важное, брат.
	FazimFirstMeet = TRUE;
	Info_ClearChoices(DIA_Ass_391_Adept_hello);

	if(Npc_HasItems(other,ItMi_Gold) < 100)
	{
		Info_AddChoice(DIA_Ass_391_Adept_hello,"Давай вернемся к этому вопросу позже.",DIA_Ass_391_Adept_hello_NoGold);
	};

	if(Npc_HasItems(other,ItMi_Gold) >= 5000)
	{
		Info_AddChoice(DIA_Ass_391_Adept_hello,"Как насчет пяти тысяч золотых?",DIA_Ass_391_Adept_hello_5000);
	};

	if(Npc_HasItems(other,ItMi_Gold) >= 3000)
	{
		Info_AddChoice(DIA_Ass_391_Adept_hello,"Как насчет трех тысяч золотых?",DIA_Ass_391_Adept_hello_3000);
	};

	if(Npc_HasItems(other,ItMi_Gold) >= 1000)
	{
		Info_AddChoice(DIA_Ass_391_Adept_hello,"Как насчет тысячи золотых?",DIA_Ass_391_Adept_hello_1000);
	};

	if(Npc_HasItems(other,ItMi_Gold) >= 500)
	{
		Info_AddChoice(DIA_Ass_391_Adept_hello,"Как насчет пятиста золотых монет?",DIA_Ass_391_Adept_hello_500);
	};

	if(Npc_HasItems(other,ItMi_Gold) >= 100)
	{
		Info_AddChoice(DIA_Ass_391_Adept_hello,"Как насчет сотни золотых монет?",DIA_Ass_391_Adept_hello_100);
	};
};

func void DIA_Ass_391_Adept_hello_5000()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Ass_391_Adept_hello_5000_01_01");	//Как насчет пяти тысяч золотых?
	AI_Output(self,other,"DIA_Ass_391_Adept_hello_5000_01_02");	//О, отец щедрости. Конечно, я с радостью приму твое предложение!
	B_GiveInvItems(other,self,ItMi_Gold,5000);
	Npc_RemoveInvItems(self,ItMi_Gold,5000);
	AI_Output(self,other,"DIA_Ass_391_Adept_hello_5000_01_03");	//Так что можешь передать приору, что у него появился новый, крайне преданный человек!
	AI_Output(other,self,"DIA_Ass_391_Adept_hello_5000_01_04");	//Ну да, конечно.
	FazimAgreed = TRUE;
	B_LogEntry(TOPIC_CareOsair,"Я купил верность Фамида. Теперь он будет работать на приора Осаира.");
	AI_StopProcessInfos(self);
};

func void DIA_Ass_391_Adept_hello_3000()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Ass_391_Adept_hello_3000_01_01");	//Как насчет трех тысяч золотых?
	AI_Output(self,other,"DIA_Ass_391_Adept_hello_3000_01_02");	//Что же, вполне реальная цена за мои услуги. Хорошо, я согласен работать на приора Осаира.
	B_GiveInvItems(other,self,ItMi_Gold,3000);
	Npc_RemoveInvItems(self,ItMi_Gold,3000);
	AI_Output(self,other,"DIA_Ass_391_Adept_hello_3000_01_03");	//Можешь так ему и передать.
	FazimAgreed = TRUE;
	B_LogEntry(TOPIC_CareOsair,"Я купил верность Фамида. Теперь он будет работать на приора Осаира.");
	AI_StopProcessInfos(self);
};

func void DIA_Ass_391_Adept_hello_1000()
{
	AI_Output(other,self,"DIA_Ass_391_Adept_hello_1000_01_01");	//Как насчет тысячи золотых?
	AI_Output(self,other,"DIA_Ass_391_Adept_hello_1000_01_02");	//Маловато будет, брат. Это совершенно не так сумма золота, на которую я рассчитывал.
	AI_Output(other,self,"DIA_Ass_391_Adept_hello_1000_01_03");	//Но это же целая куча золота!
	AI_Output(self,other,"DIA_Ass_391_Adept_hello_1000_01_04");	//Извини, брат. Но я ничем не смогу тебе помочь. 
	AI_StopProcessInfos(self);
};

func void DIA_Ass_391_Adept_hello_500()
{
	AI_Output(other,self,"DIA_Ass_391_Adept_hello_500_01_01");	//Как насчет пятиста золотых монет?
	AI_Output(self,other,"DIA_Ass_391_Adept_hello_500_01_02");	//(презрительно) Хммм. За такие деньги ты можешь сам пойти поработать на Осаира!
	AI_Output(self,other,"DIA_Ass_391_Adept_hello_500_01_03");	//Так что, считай, наша сделка не состоялась.
	FazimRefuseTalk = TRUE;
	B_LogEntry(TOPIC_CareOsair,"Я не смог договориться с Фамидом. Осаир будет не слишком этим доволен.");
	AI_StopProcessInfos(self);
};

func void DIA_Ass_391_Adept_hello_100()
{
	AI_Output(other,self,"DIA_Ass_391_Adept_hello_100_01_01");	//Как насчет сотни золотых монет?
	AI_Output(self,other,"DIA_Ass_391_Adept_hello_100_01_02");	//(гневно) Ты, видимо, решил немного подшутить надо мной, да?
	AI_Output(self,other,"DIA_Ass_391_Adept_hello_100_01_03");	//Хорошо, брат. Тогда сейчас я тоже немного пошучу...
	FazimRefuseTalk = TRUE;
	B_LogEntry(TOPIC_CareOsair,"Я не смог договориться с Фамидом. Да еще и оскорбил его. Осаир будет не слишком этим доволен.");
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};

func void DIA_Ass_391_Adept_hello_NoGold()
{
	AI_Output(other,self,"DIA_Ass_391_Adept_hello_NoGold_01_01");	//Давай вернемся к этому вопросу позже.
	AI_Output(self,other,"DIA_Ass_391_Adept_hello_NoGold_01_02");	//Как скажешь, брат.
	AI_StopProcessInfos(self);
};

instance DIA_Ass_391_Adept_FazimRefuseTalk(C_Info)
{
	npc = Ass_391_Adept;
	nr = 1;
	condition = DIA_Ass_391_Adept_FazimRefuseTalk_condition;
	information = DIA_Ass_391_Adept_FazimRefuseTalk_info;
	permanent = TRUE;
	important = TRUE;
};
	
func int DIA_Ass_391_Adept_FazimRefuseTalk_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (FazimRefuseTalk == TRUE))
	{
		return TRUE;
	};
};	
	
func void DIA_Ass_391_Adept_FazimRefuseTalk_info()
{
	AI_Output(self,other,"DIA_Ass_391_Adept_FazimRefuseTalk_01_01");	//Нам с тобой больше нечего обсуждать! Проваливай.
	AI_StopProcessInfos(self);
};

instance DIA_Ass_391_Adept_FazimFirstMeet(C_Info)
{
	npc = Ass_391_Adept;
	nr = 1;
	condition = DIA_Ass_391_Adept_FazimFirstMeet_condition;
	information = DIA_Ass_391_Adept_FazimFirstMeet_info;
	permanent = TRUE;
	description = "Насчет моего предложения...";
};
	
func int DIA_Ass_391_Adept_FazimFirstMeet_condition()
{
	if((MIS_CareOsair == LOG_Running) && (FazimAgreed == FALSE) && (FazimRefuseTalk == FALSE) && (FazimFirstMeet == TRUE))
	{
		return TRUE;
	};
};	
	
func void DIA_Ass_391_Adept_FazimFirstMeet_info()
{
	AI_Output(other,self,"DIA_Ass_391_Adept_FazimFirstMeet_01_01");	//Насчет моего предложения поработать на приора Осаира...
	AI_Output(self,other,"DIA_Ass_391_Adept_FazimFirstMeet_01_02");	//(с интересом) Так-так... А что у тебя есть предложить мне?
	Info_ClearChoices(DIA_Ass_391_Adept_FazimFirstMeet);

	if(Npc_HasItems(other,ItMi_Gold) < 100)
	{
		Info_AddChoice(DIA_Ass_391_Adept_FazimFirstMeet,"Давай вернемся к этому вопросу позже.",DIA_Ass_391_Adept_FazimFirstMeet_NoGold);
	};

	if(Npc_HasItems(other,ItMi_Gold) >= 5000)
	{
		Info_AddChoice(DIA_Ass_391_Adept_FazimFirstMeet,"Как насчет пяти тысяч золотых?",DIA_Ass_391_Adept_FazimFirstMeet_5000);
	};

	if(Npc_HasItems(other,ItMi_Gold) >= 3000)
	{
		Info_AddChoice(DIA_Ass_391_Adept_FazimFirstMeet,"Как насчет трех тысяч золотых?",DIA_Ass_391_Adept_FazimFirstMeet_3000);
	};

	if(Npc_HasItems(other,ItMi_Gold) >= 1000)
	{
		Info_AddChoice(DIA_Ass_391_Adept_FazimFirstMeet,"Как насчет тысячи золотых?",DIA_Ass_391_Adept_FazimFirstMeet_1000);
	};

	if(Npc_HasItems(other,ItMi_Gold) >= 500)
	{
		Info_AddChoice(DIA_Ass_391_Adept_FazimFirstMeet,"Как насчет пятиста золотых монет?",DIA_Ass_391_Adept_FazimFirstMeet_500);
	};

	if(Npc_HasItems(other,ItMi_Gold) >= 100)
	{
		Info_AddChoice(DIA_Ass_391_Adept_FazimFirstMeet,"Как насчет сотни золотых монет?",DIA_Ass_391_Adept_FazimFirstMeet_100);
	};
};

func void DIA_Ass_391_Adept_FazimFirstMeet_5000()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Ass_391_Adept_FazimFirstMeet_5000_01_01");	//Как насчет пяти тысяч золотых?
	AI_Output(self,other,"DIA_Ass_391_Adept_FazimFirstMeet_5000_01_02");	//О, отец щедрости. Конечно, я с радостью приму твое предложение!
	B_GiveInvItems(other,self,ItMi_Gold,5000);
	Npc_RemoveInvItems(self,ItMi_Gold,5000);
	AI_Output(self,other,"DIA_Ass_391_Adept_FazimFirstMeet_5000_01_03");	//Так что можешь передать приору, что у него появился новый, крайне преданный человек!
	AI_Output(other,self,"DIA_Ass_391_Adept_FazimFirstMeet_5000_01_04");	//Ну да, конечно.
	FazimAgreed = TRUE;
	B_LogEntry(TOPIC_CareOsair,"Я купил верность Фамида. Теперь он будет работать на приора Осаира.");
	AI_StopProcessInfos(self);
};

func void DIA_Ass_391_Adept_FazimFirstMeet_3000()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Ass_391_Adept_FazimFirstMeet_3000_01_01");	//Как насчет трех тысяч золотых?
	AI_Output(self,other,"DIA_Ass_391_Adept_FazimFirstMeet_3000_01_02");	//Что же, вполне реальная цена за мои услуги. Хорошо, я согласен работать на приора Осаира.
	B_GiveInvItems(other,self,ItMi_Gold,3000);
	Npc_RemoveInvItems(self,ItMi_Gold,3000);
	AI_Output(self,other,"DIA_Ass_391_Adept_FazimFirstMeet_3000_01_03");	//Можешь так ему и передать.
	FazimAgreed = TRUE;
	B_LogEntry(TOPIC_CareOsair,"Я купил верность Фамида. Теперь он будет работать на приора Осаира.");
	AI_StopProcessInfos(self);
};

func void DIA_Ass_391_Adept_FazimFirstMeet_1000()
{
	AI_Output(other,self,"DIA_Ass_391_Adept_FazimFirstMeet_1000_01_01");	//Как насчет тысячи золотых?
	AI_Output(self,other,"DIA_Ass_391_Adept_FazimFirstMeet_1000_01_02");	//Ты не понял с первого раза, да? Очень жаль!
	FazimRefuseTalk = TRUE;
	B_LogEntry(TOPIC_CareOsair,"Я не смог договориться с Фамидом. Осаир будет не слишком этим доволен.");
	AI_StopProcessInfos(self);
};

func void DIA_Ass_391_Adept_FazimFirstMeet_500()
{
	AI_Output(other,self,"DIA_Ass_391_Adept_FazimFirstMeet_500_01_01");	//Как насчет пятиста золотых монет?
	AI_Output(self,other,"DIA_Ass_391_Adept_FazimFirstMeet_500_01_02");	//(презрительно) Хммм. За такие деньги ты можешь сам пойти поработать на Осаира!
	AI_Output(self,other,"DIA_Ass_391_Adept_FazimFirstMeet_500_01_03");	//Так что, считай, наша сделка не состоялась.
	FazimRefuseTalk = TRUE;
	B_LogEntry(TOPIC_CareOsair,"Я не смог договориться с Фамидом. Осаир будет не слишком этим доволен.");
	AI_StopProcessInfos(self);
};

func void DIA_Ass_391_Adept_FazimFirstMeet_100()
{
	AI_Output(other,self,"DIA_Ass_391_Adept_FazimFirstMeet_100_01_01");	//Как насчет сотни золотых монет?
	AI_Output(self,other,"DIA_Ass_391_Adept_FazimFirstMeet_100_01_02");	//(гневно) Ты, видимо, решил немного подшутить надо мной, да?
	AI_Output(self,other,"DIA_Ass_391_Adept_FazimFirstMeet_100_01_03");	//Хорошо, брат. Тогда сейчас я тоже немного пошучу...
	FazimRefuseTalk = TRUE;
	B_LogEntry(TOPIC_CareOsair,"Я не смог договориться с Фамидом. Да еще и оскорбил его. Осаир будет не слишком этим доволен.");
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};

func void DIA_Ass_391_Adept_FazimFirstMeet_NoGold()
{
	AI_Output(other,self,"DIA_Ass_391_Adept_FazimFirstMeet_NoGold_01_01");	//Давай вернемся к этому вопросу позже.
	AI_Output(self,other,"DIA_Ass_391_Adept_FazimFirstMeet_NoGold_01_02");	//Как скажешь, брат.
	AI_StopProcessInfos(self);
};

instance DIA_Ass_391_Adept_FazimAgreed(C_Info)
{
	npc = Ass_391_Adept;
	nr = 1;
	condition = DIA_Ass_391_Adept_FazimAgreed_condition;
	information = DIA_Ass_391_Adept_FazimAgreed_info;
	permanent = TRUE;
	important = TRUE;
};
	
func int DIA_Ass_391_Adept_FazimAgreed_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (FazimAgreed == TRUE))
	{
		return TRUE;
	};
};	
	
func void DIA_Ass_391_Adept_FazimAgreed_info()
{
	AI_Output(self,other,"DIA_Ass_391_Adept_FazimAgreed_01_01");	//Поговорим позже, брат.
	AI_StopProcessInfos(self);
};