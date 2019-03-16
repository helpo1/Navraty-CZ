
instance DIA_SNIPES_EXIT(C_Info)
{
	npc = bau_987_snipes;
	nr = 999;
	condition = dia_snipes_exit_condition;
	information = dia_snipes_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_snipes_exit_condition()
{
	return TRUE;
};

func void dia_snipes_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SNIPES_HALLO(C_Info)
{
	npc = bau_987_snipes;
	nr = 1;
	condition = dia_snipes_hallo_condition;
	information = dia_snipes_hallo_info;
	permanent = FALSE;
	description = "Эй, Снайпс! Как дела?";
};


func int dia_snipes_hallo_condition()
{
	return TRUE;
};

func void dia_snipes_hallo_info()
{
	AI_Output(other,self,"DIA_Snipes_HALLO_01_00");	//Эй, Снайпс! Как дела?
	AI_Output(self,other,"DIA_Snipes_HALLO_01_01");	//(удивленно) Что? Ты кто такой? Что тебе от меня нужно?
	AI_Output(other,self,"DIA_Snipes_HALLO_01_02");	//Тебе привет от Вайпера.
	AI_Output(self,other,"DIA_Snipes_HALLO_01_03");	//От кого?!
	AI_Output(other,self,"DIA_Snipes_HALLO_01_04");	//От Вайпера! Мне кажется, ты должен был его знать.
	AI_Output(self,other,"DIA_Snipes_HALLO_01_05");	//Что-то я не особо припоминаю, чтобы был знаком с этим парнем...
	AI_Output(self,other,"DIA_Snipes_HALLO_01_06");	//Может, напомнишь мне, где бы я с ним мог познакомиться? А?
	Info_AddChoice(dia_snipes_hallo,"Откуда мне знать?",dia_snipes_hallo_answer1);
	Info_AddChoice(dia_snipes_hallo,"Вы были вместе в Долине Рудников.",dia_snipes_hallo_answer2);
	Info_AddChoice(dia_snipes_hallo,"Странно, что ты его не помнишь.",dia_snipes_hallo_answer3);
	Info_AddChoice(dia_snipes_hallo,"Кажется, у вас осталось одно незаконченное дело.",dia_snipes_hallo_answer4);
};

func void dia_snipes_hallo_answer1()
{
	AI_Output(other,self,"DIA_Snipes_HALLO_Answer1_01_00");	//Откуда мне знать?
	AI_Output(self,other,"DIA_Snipes_HALLO_Answer1_01_01");	//А мне тогда откуда? (смеется) Хммм... Видно, ты ошибся, парень.
	AI_Output(self,other,"DIA_Snipes_HALLO_Answer1_01_02");	//Я не знаю и никогда не знал никакого Вайпера. И хватит меня отвлекать от работы.
	AI_Output(other,self,"DIA_Snipes_HALLO_Answer1_01_04");	//Ну, как скажешь.
	Info_ClearChoices(dia_snipes_hallo);
};

func void dia_snipes_hallo_answer2()
{
	AI_Output(other,self,"DIA_Snipes_HALLO_Answer2_01_00");	//Вы были вместе в Долине Рудников.
	AI_Output(self,other,"DIA_Snipes_HALLO_Answer2_01_01");	//ЧТО?! Ха! Послушай, что я тебе скажу...
	AI_Output(self,other,"DIA_Snipes_HALLO_Answer2_01_03");	//Я понятия не имею, кто этот Вайпер и откуда он взялся! И с бывшими каторжниками дел не имею.
	AI_Output(self,other,"DIA_Snipes_HALLO_Answer2_01_04");	//Так что не приставай ко мне с глупыми вопросами.
	AI_Output(other,self,"DIA_Snipes_HALLO_Answer2_01_05");	//Хорошо. Как скажешь.
	Info_ClearChoices(dia_snipes_hallo);
};

func void dia_snipes_hallo_answer3()
{
	AI_Output(other,self,"DIA_Snipes_HALLO_Answer3_01_00");	//Странно, что ты его не помнишь.
	AI_Output(other,self,"DIA_Snipes_HALLO_Answer3_01_01");	//А вот Вайпер прекрасно тебя помнит еще с тех времен, когда вы вместе сидели в Старой шахте.
	AI_Output(self,other,"DIA_Snipes_HALLO_Answer3_01_02");	//Старой шахте?! О чем ты говоришь, парень?
	AI_Output(self,other,"DIA_Snipes_HALLO_Answer3_01_03");	//Не знаю никакого Вайпера и никакой шахты. И отвали от меня, пока Лобарт не заметил, что я тут с тобой болтаю!
	AI_Output(self,other,"DIA_Snipes_HALLO_Answer3_01_05");	//Знаешь что, мне кажется, ты просто обознался. Такое бывает! Думаю, будет лучше, если ты оставишь меня в покое.
	AI_Output(other,self,"DIA_Snipes_HALLO_Answer3_01_10");	//Ну ладно, ладно... Как скажешь.
	AI_StopProcessInfos(self);
};

func void dia_snipes_hallo_answer4()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Snipes_HALLO_Answer4_01_00");	//Кажется, у вас осталось одно незаконченное дело.
	AI_Output(self,other,"DIA_Snipes_HALLO_Answer4_01_01");	//Да?! И что же это за дело?
	AI_Output(other,self,"DIA_Snipes_HALLO_Answer4_01_02");	//Дело касается небольшого груза руды.
	AI_Output(self,other,"DIA_Snipes_HALLO_Answer4_01_03");	//(с интересом) Руды? Какой руды?
	AI_Output(other,self,"DIA_Snipes_HALLO_Answer4_01_04");	//Которую, по словам Вайпера, вы вывозили из Старой шахты как раз в тот момент, когда она обрушилась.
	AI_Output(other,self,"DIA_Snipes_HALLO_Answer4_01_05");	//И, как ты сам понимаешь, его очень интересует судьба этого груза.
	AI_Output(self,other,"DIA_Snipes_HALLO_Answer4_01_06");	//Ну ты и сказочник! (смеется) Если бы у меня была эта руда, мне бы не пришлось батрачить на эту скотину Лобарта!
	AI_Output(self,other,"DIA_Snipes_HALLO_Answer4_01_07");	//И даже если бы это было так, я бы не стал рассказывать об этом незнакомцу.
	AI_Output(other,self,"DIA_Snipes_HALLO_Answer4_01_08");	//А вот мне кажется, что мы с тобой раньше тоже встречались.
	AI_Output(self,other,"DIA_Snipes_HALLO_Answer4_01_09");	//Встречались? Вот уж вряд ли.
	AI_Output(other,self,"DIA_Snipes_HALLO_Answer4_01_10");	//Может, я и ошибаюсь, но, кажется, в свое время ты очень любил издеваться над стражниками в Старой шахте. Ключ от сундука Арона, помнишь?
	AI_Output(self,other,"DIA_Snipes_HALLO_Answer4_01_13");	//Ааа... Хммм. Ну да, ну да. Возможно, ты свой паренек. Никогда бы не подумал!
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_Snipes_HALLO_Answer4_01_14");	//Значит, говоришь, Вайпер объявился, и передает мне привет? А я то думал, что он мертв.
	AI_Output(other,self,"DIA_Snipes_HALLO_Answer4_01_15");	//Нет, с ним все в порядке. Он сейчас ошивается в портовом кабаке Хориниса.
	AI_Output(self,other,"DIA_Snipes_HALLO_Answer4_01_16");	//Ну что же, это не может не радовать.
	AI_Output(other,self,"DIA_Snipes_HALLO_Answer4_01_17");	//Так что насчет руды?
	AI_Output(self,other,"DIA_Snipes_HALLO_Answer4_01_18");	//Хммм... Это Вайпер рассказал тебе про нее?
	AI_Output(other,self,"DIA_Snipes_HALLO_Answer4_01_19");	//Ну да, кто же еще. И про то, как вам удалось избежать гибели, когда произошел обвал в шахте.
	AI_Output(self,other,"DIA_Snipes_HALLO_Answer4_01_20");	//Хммм... м-да...(задумчиво) Если честно, я бы и сам хотел знать, где эта руда.
	AI_Output(self,other,"DIA_Snipes_HALLO_Answer4_01_22");	//Дело в том, что я знаю о руде практически столько же, сколько знает и Вайпер.
	AI_Output(self,other,"DIA_Snipes_HALLO_Answer4_01_24");	//Когда Вайпер остался следить за тем, чтобы никто не проследил нас, мы с Алефом пошли дальше.
	AI_Output(self,other,"DIA_Snipes_HALLO_Answer4_01_2A");	//Некоторое время спустя мы набрели на одну из пещер и решили, что это будет как раз отличное место для того, чтобы зарыть нашу руду.
	AI_Output(self,other,"DIA_Snipes_HALLO_Answer4_01_25");	//Я остался стоять у входа в ту пещеру - так сказать, прикрывать тыл. (смеется)
	AI_Output(self,other,"DIA_Snipes_HALLO_Answer4_01_26");	//А Алеф с рудой пошел в пещеру. А через несколько минут раздался взрыв такой оглушительной силы, что я даже не смог устоять на ногах.
	AI_Output(self,other,"DIA_Snipes_HALLO_Answer4_01_27");	//Падая, я ударился головой о камень и потерял сознание...
	AI_Output(other,self,"DIA_Snipes_HALLO_Answer4_01_28");	//Видимо, это рухнул магический барьер.
	AI_Output(self,other,"DIA_Snipes_HALLO_Answer4_01_29");	//Да, именно он! Когда я очнулся, то увидел, что вход в пещеру завален камнями.
	AI_Output(self,other,"DIA_Snipes_HALLO_Answer4_01_30");	//Алефа поблизости не было. Видимо, он так и остался в той пещере, как и та руда, которая необыкновенным образом оказалась в наших руках...
	AI_Output(self,other,"DIA_Snipes_HALLO_Answer4_01_31");	//Я встал и пошел искать Вайпера. Когда я вернулся к тому месту, Вайпера там уже не было, а вот орки - были. И я решил сваливать...
	AI_Output(self,other,"DIA_Snipes_HALLO_Answer4_01_34");	//Попав в Хоринис, я пару дней наедался в таверне, а потом и нанялся к Лобарту.
	AI_Output(other,self,"DIA_Snipes_HALLO_Answer4_01_36");	//Значит, и ты не знаешь где руда?
	AI_Output(self,other,"DIA_Snipes_HALLO_Answer4_01_37");	//Нет, парень. Кто и знает, так это Алеф! Но, боюсь, вряд ли он еще в живых.
	AI_Output(other,self,"DIA_Snipes_HALLO_Answer4_01_38");	//А где та пещера, в которой вы решили закопать руду?
	AI_Output(self,other,"DIA_Snipes_HALLO_Answer4_01_39");	//А ты что, решил наведаться в Долину Рудников? Ну ты псих... Там же орки!
	AI_Output(other,self,"DIA_Snipes_HALLO_Answer4_01_40");	//С орками я как-нибудь разберусь. Так где эта пещера?
	AI_Output(self,other,"DIA_Snipes_HALLO_Answer4_01_41");	//Как я помню, она находилась по пути в лагерь баронов, недалеко от старой хижины Кавалорна. Попробуй поискать там.
	AI_Output(self,other,"DIA_Snipes_HALLO_Answer4_01_42");	//И еще кое-что. Если найдешь ее, запомни, что треть - моя! А если обманешь меня, кое-кто узнает о твоем каторжном прошлом.
	AI_Output(other,self,"DIA_Snipes_HALLO_Answer4_01_52");	//Не беспокойся! Все-таки я тоже был заключенным. А нам, бывшим каторжникам, лучше всего держаться вместе.
	AI_Output(self,other,"DIA_Snipes_HALLO_Answer4_01_53");	//Да, парень, ты прав. Ну, а теперь мне пора за работу. (нехотя) Лобарт выгонит, если заметит что я бью баклуши.
	B_LogEntry(TOPIC_VIPERNUGGETS,"Я встретил Снайпса, рабочего на ферме Лобарта. Он оказался тем самым Снайпсом, что когда-то со своими товарищами, Алефом и Вайпером, имел отношение к грузу руды. Однако Снайпс и сам не знает, где эта руда. Единственное, в чем он смог мне помочь, так это указать пещеру, где они с Алефом решили зарыть руду. Она находится по пути из Нового лагеря в Старый, недалеко от старой хижины Кавалорна.");
	MEETSNIPS = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_SNIPES_HOWWORK(C_Info)
{
	npc = bau_987_snipes;
	nr = 1;
	condition = dia_snipes_howwork_condition;
	information = dia_snipes_howwork_info;
	permanent = TRUE;
	description = "Как продвигается работа?";
};


func int dia_snipes_howwork_condition()
{
	if(Npc_KnowsInfo(other,dia_snipes_hallo) && (MEETSNIPS == FALSE) && (SNIPESRECRUITEDDT == FALSE))
	{
		return TRUE;
	};
};

func void dia_snipes_howwork_info()
{
	AI_Output(other,self,"DIA_Snipes_HowWork_01_00");	//Как продвигается работа?
	AI_Output(self,other,"DIA_Snipes_HowWork_01_01");	//Отвали! Не мешай работать!
	AI_StopProcessInfos(self);
};


instance DIA_SNIPES_HOWWORKGOOD(C_Info)
{
	npc = bau_987_snipes;
	nr = 1;
	condition = dia_snipes_howworkgood_condition;
	information = dia_snipes_howworkgood_info;
	permanent = TRUE;
	description = "Как дела, Снайпс?";
};

func int dia_snipes_howworkgood_condition()
{
	if(Npc_KnowsInfo(other,dia_snipes_hallo) && (MEETSNIPS == TRUE) && (SNIPESRECRUITEDDT == FALSE) && (MIS_VIPERNUGGETS == LOG_Running) && (SNIPSGETNUGGETS == FALSE) && (SNIPSGETNUGGETS == FALSE))
	{
		return TRUE;
	};
};

func void dia_snipes_howworkgood_info()
{
	AI_Output(other,self,"DIA_Snipes_HowWorkGood_01_00");	//Как дела, Снайпс?
	AI_Output(self,other,"DIA_Snipes_HowWorkGood_01_01");	//Да как, парень. Вкалываю с утра до вечера...
	AI_Output(self,other,"DIA_Snipes_HowWorkGood_01_02");	//Скорей бы ты нашел нашу руду. Вот тогда бы - эээх! (грустно вздыхая)
};


instance DIA_SNIPES_GETTREASURE(C_Info)
{
	npc = bau_987_snipes;
	nr = 1;
	condition = dia_snipes_gettreasure_condition;
	information = dia_snipes_gettreasure_info;
	permanent = FALSE;
	description = "Эй, Снайпс! У меня кое-что для тебя есть.";
};

func int dia_snipes_gettreasure_condition()
{
	if((MIS_VIPERNUGGETS == LOG_Running) && (Npc_HasItems(other,ItMi_Nugget) >= 200) && (SNIPSGETNUGGETS == FALSE) && (TALKTOALEF == TRUE))
	{
		return TRUE;
	};
};

func void dia_snipes_gettreasure_info()
{
	AI_Output(other,self,"DIA_Snipes_GetTreasure_01_00");	//Эй, Снайпс! У меня кое-что есть для тебя.
	AI_Output(self,other,"DIA_Snipes_GetTreasure_01_01");	//Единственное, что мне нужно, парень, - это моя руда.
	AI_Output(other,self,"DIA_Snipes_GetTreasure_01_02");	//Хммм... И как ты догадался?
	AI_Output(self,other,"DIA_Snipes_GetTreasure_01_03");	//(недоумевающе) ЧТО? Неужели? Но... где она?
	AI_Output(other,self,"DIA_Snipes_GetTreasure_01_04");	//Вот, держи свою долю. Ровно двести кусков руды.
	B_GiveInvItems(other,self,ItMi_Nugget,200);
	Npc_RemoveInvItems(self,ItMi_Nugget,Npc_HasItems(self,ItMi_Nugget));
	AI_Output(self,other,"DIA_Snipes_GetTreasure_01_05");	//Потрясающе! Моя ненаглядная! Заживу теперь не хуже баронов из Старого лагеря!
	AI_Output(self,other,"DIA_Snipes_GetTreasure_01_08");	//Спасибо тебе. Я никогда не забуду, что ты для меня сделал! Кстати, что же стало с Алефом?
	AI_Output(other,self,"DIA_Snipes_GetTreasure_01_11");	//Боюсь огорчить тебя, но он мертв. К сожалению, ему так и не удалось миновать орков в Долине.
	AI_Output(self,other,"DIA_Snipes_GetTreasure_01_12");	//Жаль! Он был неплохим парнем...

	if(VIPERGETNUGGETS == TRUE)
	{
		B_GivePlayerXP(200);
		AI_Output(self,other,"DIA_Snipes_GetTreasure_01_13");	//Скажи, а что насчет Вайпера?
		AI_Output(other,self,"DIA_Snipes_GetTreasure_01_14");	//Вайперу я уже отдал его часть руды. Скажу тебе: он был на седьмом небе от счастья.
		AI_Output(self,other,"DIA_Snipes_GetTreasure_01_15");	//Хммм... Я рад за него!
		MIS_VIPERNUGGETS = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_VIPERNUGGETS,LOG_SUCCESS);
		B_LogEntry(TOPIC_VIPERNUGGETS,"Я отдал Снайпсу его долю. Он был вне себя от радости.");
	}
	else
	{
		B_GivePlayerXP(50);
		AI_Output(self,other,"DIA_Snipes_GetTreasure_01_16");	//А как насчет Вайпера?
		AI_Output(other,self,"DIA_Snipes_GetTreasure_01_17");	//Я как раз хотел встретиться с ним.
		AI_Output(self,other,"DIA_Snipes_GetTreasure_01_18");	//Хммм... Ну, это правильно!
		B_LogEntry(TOPIC_VIPERNUGGETS,"Я отдал Снайпсу его долю. Он был вне себя от радости.");
	};

	if(SNIPESRECRUITEDDT == FALSE)
	{
		AI_Output(other,self,"DIA_Snipes_GetTreasure_01_19");	//Что будешь делать дальше?
		AI_Output(self,other,"DIA_Snipes_GetTreasure_01_20");	//Думаю, для начала пойду в кабак к Орлану и нажрусь до чертиков.
		AI_Output(self,other,"DIA_Snipes_GetTreasure_01_21");	//А потом не знаю - посмотрим.
	};

	AI_Output(other,self,"DIA_Snipes_GetTreasure_01_22");	//Понятно. Ладно, мне пора.
	AI_Output(self,other,"DIA_Snipes_GetTreasure_01_23");	//Давай, приятель! Буду рад тебя встретить вновь. И еще раз спасибо!
	AI_Output(self,other,"DIA_Snipes_GetTreasure_01_24");	//Ах да, чуть не забыл. Вот, возьми это в награду за свои хлопоты.
	AI_Output(self,other,"DIA_Snipes_GetTreasure_01_25");	//Уверен, это пойло тебе пригодится...
	B_GiveInvItems(self,other,ItPo_Perm_Health,1);
	SNIPSGETNUGGETS = TRUE;
	AI_StopProcessInfos(self);

	if(SNIPESRECRUITEDDT == FALSE)
	{
		Npc_ExchangeRoutine(self,"GetNuggets");
	};
};


instance DIA_SNIPES_HOWLIFE(C_Info)
{
	npc = bau_987_snipes;
	nr = 1;
	condition = dia_snipes_howlife_condition;
	information = dia_snipes_howlife_info;
	permanent = TRUE;
	description = "Теперь все в порядке?";
};


func int dia_snipes_howlife_condition()
{
	if(Npc_KnowsInfo(other,dia_snipes_gettreasure))
	{
		return TRUE;
	};
};

func void dia_snipes_howlife_info()
{
	AI_Output(other,self,"DIA_Snipes_HowLife_01_00");	//Теперь все в порядке?
	AI_Output(self,other,"DIA_Snipes_HowLife_01_01");	//Лучше не бывает, приятель.
};


instance DIA_SNIPES_PICKPOCKET(C_Info)
{
	npc = bau_987_snipes;
	nr = 900;
	condition = dia_snipes_pickpocket_condition;
	information = dia_snipes_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_snipes_pickpocket_condition()
{
	return C_Beklauen(15,25);
};

func void dia_snipes_pickpocket_info()
{
	Info_ClearChoices(dia_snipes_pickpocket);
	Info_AddChoice(dia_snipes_pickpocket,Dialog_Back,dia_snipes_pickpocket_back);
	Info_AddChoice(dia_snipes_pickpocket,DIALOG_PICKPOCKET,dia_snipes_pickpocket_doit);
};

func void dia_snipes_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_snipes_pickpocket);
};

func void dia_snipes_pickpocket_back()
{
	Info_ClearChoices(dia_snipes_pickpocket);
};


instance DIA_SNIPES_HOWOREHUCK(C_Info)
{
	npc = bau_987_snipes;
	nr = 2;
	condition = dia_snipes_howorehuck_condition;
	information = dia_snipes_howorehuck_info;
	permanent = FALSE;
	description = "Ты ведь добывал руду?";
};

func int dia_snipes_howorehuck_condition()
{
	if(Npc_KnowsInfo(other,dia_snipes_hallo) && (ABOUTSWBL == TRUE))
	{
		return TRUE;
	};
};

func void dia_snipes_howorehuck_info()
{
	AI_Output(other,self,"DIA_Snipes_HOWOREHUCK_01_00");	//Снайпс! Ты ведь добывал руду и знаешь, как это делается?
	AI_Output(self,other,"DIA_Snipes_HOWOREHUCK_01_01");	//Конечно, малыш! Ты знаешь, сколько времени я провел в Старой шахте?
	AI_Output(other,self,"DIA_Snipes_HOWOREHUCK_01_02");	//Ты можешь научить меня добывать руду?
	AI_Output(self,other,"DIA_Snipes_HOWOREHUCK_01_03");	//Да, я могу дать тебе пару уроков.
	AI_Output(other,self,"DIA_Snipes_HOWOREHUCK_01_04");	//Отлично. А ты, случайно, не знаешь, кто умеет плавить руду?
	AI_Output(self,other,"DIA_Snipes_HOWOREHUCK_01_05");	//Вайпер всю свою каторжную жизнь провел около плавильной печи. Может, чему и научился.
	B_LogEntry(TOPIC_STEELDRAW,"Снайпс может научить добывать руду. Правда, подзабыл он многое. Плавить же руду меня, возможно, сможет научить Вайпер.");
};

instance DIA_SNIPES_LEARNABOUTERZHUNT(C_Info)
{
	npc = bau_987_snipes;
	nr = 2;
	condition = dia_snipes_learnabouterzhunt_condition;
	information = dia_snipes_learnabouterzhunt_info;
	permanent = TRUE;
	description = "Научи меня добывать руду.";
};

func int dia_snipes_learnabouterzhunt_condition()
{
	if(Npc_KnowsInfo(other,dia_snipes_howorehuck) && (HERO_HACKCHANCEORE < 50))
	{
		return TRUE;
	};
};

func void dia_snipes_learnabouterzhunt_info()
{
	if(KNOWHOWPICKORE == TRUE)
	{
		AI_Output(other,self,"DIA_SNIPES_LearnAboutErzHunt_01_10");	//Расскажи мне больше о добыче руды.
	}
	else
	{
		AI_Output(other,self,"DIA_SNIPES_LearnAboutErzHunt_01_00");	//Научи меня добывать руду.
	};

	Info_ClearChoices(dia_snipes_learnabouterzhunt);
	Info_AddChoice(dia_snipes_learnabouterzhunt,Dialog_Back,dia_snipes_learnabouterzhunt_Back);
	Info_AddChoice(dia_snipes_learnabouterzhunt,b_buildlearnstringforerzhunt("Добыча руды",B_GetLearnCostTalent(other,NPC_TALENT_ERZWORK,1)),dia_snipes_learnabouterzhunt_ERZWORK);
};

func void dia_snipes_learnabouterzhunt_Back()
{
	Info_ClearChoices(dia_snipes_learnabouterzhunt);
};

func void dia_snipes_learnabouterzhunt_ERZWORK()
{
	if(HERO_HACKCHANCEORE < 50)
	{
		if(b_teachplayertalenterzhunt(self,other,NPC_TALENT_ERZWORK))
		{
			if(GRIMESTEACHMOREORE == FALSE)
			{
				AI_Output(self,other,"DIA_SNIPES_LearnAboutErzHunt_01_01");	//Хорошо! Слушай внимательно...
				AI_Output(self,other,"DIA_SNIPES_LearnAboutErzHunt_01_02");	//Для начала тебе необходимо обзавестись хорошей киркой - это половина дела.
				AI_Output(self,other,"DIA_SNIPES_LearnAboutErzHunt_01_03");	//Потом начинай обрабатывать найденный тобой рудный самородок.
				AI_Output(self,other,"DIA_SNIPES_LearnAboutErzHunt_01_04");	//Бить надо не по краю породы, а точно в центр. Наноси один мощный удар, после - несколько более слабых.
				AI_Output(self,other,"DIA_SNIPES_LearnAboutErzHunt_01_05");	//Тем самым ты немного нарушишь структуру самородка, и при следующем сильном ударе наверняка какой-нибудь кусок от него обязательно отколется.
				AI_Output(self,other,"DIA_SNIPES_LearnAboutErzHunt_01_06");	//А потом повторяй все заново, пока не надоест. (смеется)
				AI_Output(self,other,"DIA_SNIPES_LearnAboutErzHunt_01_07");	//Это главное, что тебе нужно знать о добыче руды.
				AI_Output(other,self,"DIA_SNIPES_LearnAboutErzHunt_01_08");	//Спасибо!
				GRIMESTEACHMOREORE = TRUE;
			}
			else
			{
				AI_Output(self,other,"DIA_SNIPES_LearnAboutErzHunt_01_09");	//Ладно! Слушай внимательно...(рассказывает)
			};
		};
	}
	else
	{
		AI_Output(self,other,"DIA_SNIPES_LearnAboutErzHunt_01_11");	//Я научил тебя всему, что мог вспомнить. Попробуй поискать другого учителя.
	};

	Info_ClearChoices(dia_snipes_learnabouterzhunt);
};

instance DIA_SNIPES_AskforDT(C_Info)
{
	npc = bau_987_snipes;
	nr = 6;
	condition = DIA_SNIPES_AskforDT_condition;
	information = DIA_SNIPES_AskforDT_info;
	permanent = FALSE;
	description = "Мне нужен опытный рудокоп в шахту.";
};

func int DIA_SNIPES_askfordt_condition()
{
	if((HURRAYICANHIRE == TRUE) && (SearchOreMine == TRUE) && (MEETSNIPS == TRUE))
	{
		return TRUE;
	};
};

func void DIA_SNIPES_AskforDT_info()
{
	AI_Output(other,self,"DIA_SNIPES_AskforDT_15_00");	//Мне нужен опытный рудокоп в шахту.
	AI_Output(self,other,"DIA_SNIPES_AskforDT_17_01");	//И с чего ты вдруг решил, что я снова хочу гнуть свою спину на руднике?
	AI_Output(self,other,"DIA_SNIPES_AskforDT_17_02");	//Нет уж! Хватит с меня всего этого.

	if(RhetorikSkillValue[1] >= 60)
	{
		Info_AddChoice(DIA_SNIPES_AskforDT,"(попытаться убедить)",DIA_SNIPES_AskforDT_yes);
	};
};

func void DIA_SNIPES_AskforDT_yes()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_SNIPES_askfordt_yes_15_00");	//Послушай! Никто и не собирается заставлять тебя торчать в шахте целыми сутками.
	AI_Output(other,self,"DIA_SNIPES_askfordt_yes_15_01");	//Всего пару часов в день с кайлом в руках, а за все это - кров, пища и достойная оплата.
	AI_Output(other,self,"DIA_SNIPES_askfordt_yes_15_02");	//Уверен, с твоим то опытом рудокопа это не должно для тебя составить особого труда.
	AI_Output(self,other,"DIA_SNIPES_askfordt_yes_15_03");	//Что? Хочешь сказать, ты еще и платить мне за это будешь?
	AI_Output(other,self,"DIA_SNIPES_askfordt_yes_15_04");	//Ну да - скажем, по тридцать золотых монет в день. 
	AI_Output(self,other,"DIA_SNIPES_askfordt_yes_15_05");	//Тридцать золотых? Хммм... Звучит неплохо. По крайней мере, это вдвое больше, чем я получал, работая на ферме Лобарта.
	AI_Output(other,self,"DIA_SNIPES_askfordt_yes_15_06");	//Вот видишь. Не все так плохо, как могло бы показаться на первый взгляд.
	AI_Output(self,other,"DIA_SNIPES_askfordt_yes_15_07");	//Ну допустим. А где находится эта шахта?
	AI_Output(other,self,"DIA_SNIPES_askfordt_yes_15_08");	//В моем лагере недалеко от фермы Онара, рядом со старой башней.
	AI_Output(self,other,"DIA_SNIPES_askfordt_yes_15_09");	//Ах да... Кажется, я знаю это место. В свое время я уже работал там, пока меня не бросили гнить в этой проклятой колонии.
	AI_Output(other,self,"DIA_SNIPES_askfordt_yes_15_10");	//Так ты уже бывал там? Может, тогда расскажешь, что тебе еще известно о той шахте?
	AI_Output(self,other,"DIA_SNIPES_askfordt_yes_15_11");	//Да что тут рассказывать. Шахта как шахта. Сама по себе не очень большая, но главное - довольно сухая. 
	AI_Output(self,other,"DIA_SNIPES_askfordt_yes_15_12");	//Сырость и обвалы породы там практически никогда не случались. В общем и целом - не самое плохое место для работы.
	AI_Output(other,self,"DIA_SNIPES_askfordt_yes_15_13");	//Ну раз так, то почему бы тебе там снова не поработать?
	AI_Output(self,other,"DIA_SNIPES_askfordt_yes_15_14");	//Эх... Ладно, я согласен. В конце концов, хуже чем сейчас уже точно не будет, а деньги за работу ты платишь все-таки приличные.
	AI_Output(self,other,"DIA_SNIPES_askfordt_yes_15_15");	//Когда мне туда отправляться?
	AI_Output(other,self,"DIA_SNIPES_askfordt_yes_15_16");	//Можешь прямо сейчас! Если что, паролем для входа туда является фраза 'Драконовы сокровища'.
	AI_Output(self,other,"DIA_SNIPES_askfordt_yes_15_17");	//Хорошо! Тогда до встречи.
	AI_Output(other,self,"DIA_SNIPES_askfordt_yes_15_18");	//Увидимся.

	if(RhetorikSkillValue[1] < 100)
	{
		RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
		AI_Print("Риторика + 1");
	};

	B_LogEntry(TOPIC_PPL_FOR_TOWER,"Снайпс согласился работать у меня в шахте.");
	self.npcType = NPCTYPE_FRIEND;
	self.aivar[AIV_ToughGuy] = TRUE;
	self.aivar[AIV_IGNORE_Theft] = TRUE;
	self.aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	self.aivar[AIV_IgnoresArmor] = TRUE;
	SNIPESRECRUITEDDT = TRUE;

	if(DT_IRONGATHER_START == FALSE)
	{
		DT_IRONGATHER_START = TRUE;
		EVERYDAYDTIRON = Wld_GetDay();
	};

	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"InTower");
};

func void DIA_SNIPES_AskforDT_no()
{
	AI_Output(other,self,"DIA_SNIPES_AskforDT_no_15_00");	//Хорошо, как скажешь.
	AI_StopProcessInfos(self);
};

instance DIA_SNIPES_INTOWER(C_Info)
{
	npc = bau_987_snipes;
	nr = 22;
	condition = DIA_SNIPES_intower_condition;
	information = DIA_SNIPES_intower_info;
	permanent = TRUE;
	description = "Как продвигается работа?";
};

func int DIA_SNIPES_intower_condition()
{
	if((SNIPESRECRUITEDDT == TRUE) && (Npc_GetDistToWP(self,"NW_CASTLEMINE_TOWER_01") < 5000))
	{
		return TRUE;
	};
};

func void DIA_SNIPES_intower_info()
{
	AI_Output(other,self,"DIA_Snipes_HowWork_01_00");	//Как продвигается работа?
	AI_Output(self,other,"DIA_SNIPES_InTower_OrcKap_01_01");	//Копаем потихоньку!
};