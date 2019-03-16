
instance DIA_PAL_9159_RAYNE_EXIT(C_Info)
{
	npc = pal_9159_rayne;
	nr = 999;
	condition = dia_pal_9159_rayne_exit_condition;
	information = dia_pal_9159_rayne_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_9159_rayne_exit_condition()
{
	return TRUE;
};

func void dia_pal_9159_rayne_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_9159_RAYNE_MATTER(C_Info)
{
	npc = pal_9159_rayne;
	nr = 1;
	condition = dia_pal_9159_rayne_matter_condition;
	information = dia_pal_9159_rayne_matter_info;
	permanent = FALSE;
	description = "Привет, ты кто?";
};


func int dia_pal_9159_rayne_matter_condition()
{
	return TRUE;
};

func void dia_pal_9159_rayne_matter_info()
{
	AI_Output(other,self,"DIA_Pal_9159_Rayne_Matter_01_00");	//Ты кто?
	AI_Output(self,other,"DIA_Pal_9159_Rayne_Matter_01_01");	//Меня зовут Рэйн, и если у тебя хорошо с глазами, то, думаю, ты заметил, что я паладин короля.
	AI_Output(self,other,"DIA_Pal_9159_Rayne_Matter_01_03");	//Лорд Варус назначил меня управляющим складом тут в форте.
	AI_Output(self,other,"DIA_Pal_9159_Rayne_Matter_01_04");	//(раздраженно) Как будто кроме меня этим больше и заняться некому! 
	AI_Output(other,self,"DIA_Pal_9159_Rayne_Matter_01_06");	//Кажется, тебе не очень нравится твоя работа?
	AI_Output(self,other,"DIA_Pal_9159_Rayne_Matter_01_07");	//А что тут может понравиться? Каждый день только и делаю, что проверяю содержимое этих ящиков.
	AI_Output(self,other,"DIA_Pal_9159_Rayne_Matter_01_13");	//Так что если у тебя ко мне нет больше никаких вопросов - оставь меня в покое и позволь заняться своими обязанностями!
};


instance DIA_PAL_9159_RAYNE_SKLADWATCH(C_Info)
{
	npc = pal_9159_rayne;
	nr = 1;
	condition = dia_pal_9159_rayne_skladwatch_condition;
	information = dia_pal_9159_rayne_skladwatch_info;
	permanent = TRUE;
	description = "Ничего не пропало?";
};


func int dia_pal_9159_rayne_skladwatch_condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_9159_rayne_matter))
	{
		return TRUE;
	};
};

func void dia_pal_9159_rayne_skladwatch_info()
{
	AI_Output(other,self,"DIA_Pal_9159_Rayne_SkladWatch_01_00");	//Ничего не пропало?
	if(MIS_RAYNEHELP == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Pal_9159_Rayne_SkladWatch_01_01");	//Теперь, когда у меня есть помощник, об этом можно не беспокоиться. (смеется)
		AI_Output(self,other,"DIA_Pal_9159_Rayne_SkladWatch_01_02");	//Все в полном порядке!
	}
	else
	{
		AI_Output(self,other,"DIA_Pal_9159_Rayne_SkladWatch_01_04");	//Очень смешно, умник!
		AI_Output(self,other,"DIA_Pal_9159_Rayne_SkladWatch_01_05");	//Тебе бы такую работенку - может, тогда ты бы понял, что это такое.
	};
};


instance DIA_PAL_9159_RAYNE_SKLADGOODS(C_Info)
{
	npc = pal_9159_rayne;
	nr = 1;
	condition = dia_pal_9159_rayne_skladgoods_condition;
	information = dia_pal_9159_rayne_skladgoods_info;
	permanent = FALSE;
	description = "А что хранится на складе?";
};


func int dia_pal_9159_rayne_skladgoods_condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_9159_rayne_matter) == TRUE)
	{
		return TRUE;
	};
};

func void dia_pal_9159_rayne_skladgoods_info()
{
	AI_Output(other,self,"DIA_Pal_9159_Rayne_SkladGoods_01_00");	//А что хранится на складе?
	AI_Output(self,other,"DIA_Pal_9159_Rayne_SkladGoods_01_03");	//Да барахло всякое - оружие, припасы, одежда, ну и прочая ерунда.
	AI_Output(self,other,"DIA_Pal_9159_Rayne_SkladGoods_01_05");	//Вижу по глазам, что эта информация тебя немного заинтересовала.
	AI_Output(self,other,"DIA_Pal_9159_Rayne_SkladGoods_01_06");	//Но только можешь губу особо не раскатывать - тебе туда все равно не попасть.
	AI_Output(self,other,"DIA_Pal_9159_Rayne_SkladGoods_01_08");	//Склад закрыт, а ключ находится у самого лорда Варуса.
	AI_Output(self,other,"DIA_Pal_9159_Rayne_SkladGoods_01_10");	//Так что выбрось эту затею из головы!
	KNOWSVARUSKEY = TRUE;
};


instance DIA_PAL_9159_RAYNE_HELP(C_Info)
{
	npc = pal_9159_rayne;
	nr = 1;
	condition = dia_pal_9159_rayne_help_condition;
	information = dia_pal_9159_rayne_help_info;
	permanent = FALSE;
	description = "У тебя есть серебряные кубки?";
};


func int dia_pal_9159_rayne_help_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Pal_9159_Rayne_SkladGoods) && (MIS_FERDSILVERCUP == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_pal_9159_rayne_help_info()
{
	AI_Output(other,self,"DIA_Pal_9159_Rayne_Help_01_00");	//У тебя есть серебряные кубки?
	AI_Output(self,other,"DIA_Pal_9159_Rayne_Help_01_01");	//(задумался) Ну да, кажется, на складе есть пара штук.
	AI_Output(self,other,"DIA_Pal_9159_Rayne_Help_01_02");	//А с чего вдруг ты этим заинтересовался?
	AI_Output(other,self,"DIA_Pal_9159_Rayne_Help_01_03");	//Паладин Фердинанд попросил меня достать для него один такой кубок.
	AI_Output(self,other,"DIA_Pal_9159_Rayne_Help_01_10");	//Послушай, эти кубки - собственность ордена паладинов.
	AI_Output(self,other,"DIA_Pal_9159_Rayne_Help_01_11");	//Поэтому забудь об этом.
	AI_Output(other,self,"DIA_Pal_9159_Rayne_Help_01_12");	//Может, сделаешь исключение?
	AI_Output(self,other,"DIA_Pal_9159_Rayne_Help_01_14");	//Пойми - я бы с удовольствием помог Фердинанду, но если Варус узнает о том, что я торгую вещами со склада - он убьет меня!
	AI_Output(self,other,"DIA_Pal_9159_Rayne_Help_01_15");	//Все только и делают, что ноют и обижаются на меня!
	AI_Output(self,other,"DIA_Pal_9159_Rayne_Help_01_16");	//А вместо этого лучше бы кто-нибудь из них вызвался мне помочь управляться со складом.
	AI_Output(self,other,"DIA_Pal_9159_Rayne_Help_01_17");	//Один я тут просто не справляюсь. Но это уже никого не интересует.
	AI_Output(other,self,"DIA_Pal_9159_Rayne_Help_01_18");	//Мне кажется, что тебе бы не помешал помощник.
	AI_Output(self,other,"DIA_Pal_9159_Rayne_Help_01_19");	//(печально) Это точно.
	AI_Output(self,other,"DIA_Pal_9159_Rayne_Help_01_21");	//Вот только что скажет Варус? Думаю, он не даст людей для этой работы.
	Info_ClearChoices(dia_pal_9159_rayne_help);
	Info_AddChoice(dia_pal_9159_rayne_help,"Может, я смогу помочь?",dia_pal_9159_rayne_help_ok);
	Info_AddChoice(dia_pal_9159_rayne_help,"Тогда не буду мешать.",dia_pal_9159_rayne_help_no);
};

func void dia_pal_9159_rayne_help_ok()
{
	AI_Output(other,self,"DIA_Pal_9159_Rayne_Help_Ok_01_00");	//Я что-нибудь придумаю.
	AI_Output(self,other,"DIA_Pal_9159_Rayne_Help_Ok_01_09");	//Хорошо. Может, у тебя что-нибудь и получится.
	MIS_RAYNEHELP = LOG_Running;
	Log_CreateTopic(TOPIC_RAYNEHELP,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RAYNEHELP,LOG_Running);
	B_LogEntry(TOPIC_RAYNEHELP,"Я пообещал паладину Рэйну найти для него помощника для работы на складе.");
	Info_ClearChoices(dia_pal_9159_rayne_help);
};

func void dia_pal_9159_rayne_help_no()
{
	AI_Output(other,self,"DIA_Pal_9159_Rayne_Help_No_01_00");	//Тогда тебе придется работать самому - не буду мешать.
	AI_Output(self,other,"DIA_Pal_9159_Rayne_Help_No_01_01");	//Хммм...
	Info_ClearChoices(dia_pal_9159_rayne_help);
};


instance DIA_PAL_9159_RAYNE_HELPDONE(C_Info)
{
	npc = pal_9159_rayne;
	nr = 1;
	condition = dia_pal_9159_rayne_helpdone_condition;
	information = dia_pal_9159_rayne_helpdone_info;
	permanent = FALSE;
	description = "Лорд Варус пришлет тебе человека.";
};


func int dia_pal_9159_rayne_helpdone_condition()
{
	if((MIS_RAYNEHELP == LOG_Running) && (FINDHELPERRAYNE == TRUE))
	{
		return TRUE;
	};
};

func void dia_pal_9159_rayne_helpdone_info()
{
	AI_Output(other,self,"DIA_Pal_9159_Rayne_HelpDone_01_00");	//Лорд Варус пришлет тебе человека.
	AI_Output(self,other,"DIA_Pal_9159_Rayne_HelpDone_01_04");	//Отлично! Спасибо, парень.
	AI_Output(self,other,"DIA_Pal_9159_Rayne_HelpDone_01_05");	//Если честно, я даже особо и не рассчитывал на твою помощь.
	if(MIS_FERDSILVERCUP == LOG_Running)
	{
		AI_Output(self,other,"DIA_Pal_9159_Rayne_HelpDone_01_08");	//Вот - возьми этот серебряный кубок, что ты искал.
		B_GiveInvItems(self,other,ItMi_SilverCup,1);
		AI_Output(self,other,"DIA_Pal_9159_Rayne_HelpDone_01_09");	//Думаю, тебе он пригодится.
	}
	else
	{
		AI_Output(self,other,"DIA_Pal_9159_Rayne_HelpDone_01_12");	//Вот - возьми это растение. Говорят, оно встречается чрезвычайно редко.
		B_GiveInvItems(self,other,ItPl_Perm_Herb,1);
		AI_Output(self,other,"DIA_Pal_9159_Rayne_HelpDone_01_13");	//Наверняка эта вещица тебе пригодится.
	};
	MIS_RAYNEHELP = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_RAYNEHELP,LOG_SUCCESS);
	B_LogEntry(TOPIC_RAYNEHELP,"Рэйн был счастлив узнать, что лорд Варус пришлет ему человека в помощь.");
	Wld_InsertNpc(pal_9162_ritter,"LGR_ZUMBANVIERTEL_02");
};


instance DIA_PAL_9159_RAYNE_PICKPOCKET(C_Info)
{
	npc = pal_9159_rayne;
	nr = 900;
	condition = dia_pal_9159_rayne_pickpocket_condition;
	information = dia_pal_9159_rayne_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_pal_9159_rayne_pickpocket_condition()
{
	return C_Beklauen(80,150);
};

func void dia_pal_9159_rayne_pickpocket_info()
{
	Info_ClearChoices(dia_pal_9159_rayne_pickpocket);
	Info_AddChoice(dia_pal_9159_rayne_pickpocket,Dialog_Back,dia_pal_9159_rayne_pickpocket_back);
	Info_AddChoice(dia_pal_9159_rayne_pickpocket,DIALOG_PICKPOCKET,dia_pal_9159_rayne_pickpocket_doit);
};

func void dia_pal_9159_rayne_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_pal_9159_rayne_pickpocket);
};

func void dia_pal_9159_rayne_pickpocket_back()
{
	Info_ClearChoices(dia_pal_9159_rayne_pickpocket);
};

