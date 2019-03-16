
instance DIA_VLK_6132_GAYVERN_EXIT(C_Info)
{
	npc = vlk_6132_gayvern;
	nr = 999;
	condition = dia_vlk_6132_gayvern_exit_condition;
	information = dia_vlk_6132_gayvern_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_vlk_6132_gayvern_exit_condition()
{
	return TRUE;
};

func void dia_vlk_6132_gayvern_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_VLK_6132_GAYVERN_HALLO(C_Info)
{
	npc = vlk_6132_gayvern;
	nr = 2;
	condition = dia_vlk_6132_gayvern_hallo_condition;
	information = dia_vlk_6132_gayvern_hallo_info;
	permanent = FALSE;
	description = "Привет, ты кто?";
};


func int dia_vlk_6132_gayvern_hallo_condition()
{
	return TRUE;
};

func void dia_vlk_6132_gayvern_hallo_info()
{
	AI_Output(other,self,"DIA_VLK_6132_Gayvern_Hallo_01_00");	//Привет, ты кто?
	AI_Output(self,other,"DIA_VLK_6132_Gayvern_Hallo_01_01");	//Меня зовут Гэйверн. А ты, я так понимаю, новенький в этом городе.
	AI_Output(other,self,"DIA_VLK_6132_Gayvern_Hallo_01_02");	//С чего ты взял?
	AI_Output(self,other,"DIA_VLK_6132_Gayvern_Hallo_01_03");	//(смеется) В портовом квартале нет ни одного человека, которого я бы не знал.
	AI_Output(self,other,"DIA_VLK_6132_Gayvern_Hallo_01_04");	//А вот тебя я тут вижу в первый раз!
	AI_Output(other,self,"DIA_VLK_6132_Gayvern_Hallo_01_05");	//Так, может быть, я из другой части города - например, из верхнего квартала.
	AI_Output(self,other,"DIA_VLK_6132_Gayvern_Hallo_01_06");	//КТО? Ты?...(смеется) Да ты себя со стороны-то видел, парень?
	AI_Output(self,other,"DIA_VLK_6132_Gayvern_Hallo_01_07");	//Ты же выглядишь как оборванец! (смеется) Вот насмешил.
	AI_Output(self,other,"DIA_VLK_6132_Gayvern_Hallo_01_08");	//Нет, дружище, - таких, как ты, туда точно не пустят.
	AI_Output(self,other,"DIA_VLK_6132_Gayvern_Hallo_01_09");	//Так что не пытайся обмануть меня. Поверь мне: у тебя это не выйдет!
};


instance DIA_VLK_6132_GAYVERN_WORK(C_Info)
{
	npc = vlk_6132_gayvern;
	nr = 2;
	condition = dia_vlk_6132_gayvern_work_condition;
	information = dia_vlk_6132_gayvern_work_info;
	permanent = FALSE;
	description = "А чем ты занимаешься?";
};


func int dia_vlk_6132_gayvern_work_condition()
{
	if(Npc_KnowsInfo(other,dia_vlk_6132_gayvern_hallo))
	{
		return TRUE;
	};
};

func void dia_vlk_6132_gayvern_work_info()
{
	AI_Output(other,self,"DIA_VLK_6132_Gayvern_Work_01_00");	//А чем ты занимаешься?
	AI_Output(self,other,"DIA_VLK_6132_Gayvern_Work_01_01");	//Раньше я работал в порту.
	AI_Output(self,other,"DIA_VLK_6132_Gayvern_Work_01_02");	//Но с тех пор как в Хоринис перестали заходить торговые корабли, работы тут совсем не стало.	
	AI_Output(self,other,"DIA_VLK_6132_Gayvern_Work_01_03");	//Вот и сижу уже, почитай, полтора месяца без дела. Короче, одна скукота!
	AI_Output(other,self,"DIA_VLK_6132_Gayvern_Work_01_04");	//Значит, ты безработный?
	AI_Output(self,other,"DIA_VLK_6132_Gayvern_Work_01_07");	//Не совсем. Кардиф, хозяин этой таверны, предложил мне работать у него вышибалой.
	AI_Output(self,other,"DIA_VLK_6132_Gayvern_Work_01_11");	//Дело, конечно, не из приятных, но что поделать - жить-то на что-то надо.
	AI_Output(self,other,"DIA_VLK_6132_Gayvern_Work_01_12");	//Хотел бы я заняться чем-нибудь другим, вот только кому я такой нужен...(печально)

	if((MIS_TRADEHELPER != LOG_Running) || (MIS_TRADEHELPER != LOG_SUCCESS) || (MIS_TRADEHELPER != LOG_FAILED))
	{
		AI_Output(self,other,"DIA_VLK_6132_Gayvern_Work_01_14");	//Послушай, а у ТЕБЯ, случайно, нет для меня какой-нибудь работы?
		AI_Output(other,self,"DIA_VLK_6132_Gayvern_Work_01_15");	//Пожалуй, нет. Но если что-нибудь подвернется, обязательно дам тебе знать.
		AI_Output(self,other,"DIA_VLK_6132_Gayvern_Work_01_16");	//Спасибо, парень. Поверь, я в долгу не останусь.
	};
};

instance DIA_VLK_6132_GAYVERN_HOW(C_Info)
{
	npc = vlk_6132_gayvern;
	nr = 2;
	condition = dia_vlk_6132_gayvern_how_condition;
	information = dia_vlk_6132_gayvern_how_info;
	permanent = TRUE;
	description = "Ну, как дела?";
};

func int dia_vlk_6132_gayvern_how_condition()
{
	if(Npc_KnowsInfo(other,dia_vlk_6132_gayvern_work) && (GAYVERNRECRUITEDDT == FALSE))
	{
		return TRUE;
	};
};

func void dia_vlk_6132_gayvern_how_info()
{
	AI_Output(other,self,"DIA_VLK_6132_Gayvern_How_01_00");	//Ну, как дела?
	AI_Output(self,other,"DIA_VLK_6132_Gayvern_How_01_01");	//Да все также паршиво, как и раньше.

	if((GAYVERNRECRUITEDDT == FALSE) && (HURRAYICANHIRE == TRUE))
	{
		AI_Output(self,other,"DIA_VLK_6132_Gayvern_How_01_06");	//А у тебя новости есть?
		AI_Output(other,self,"DIA_VLK_6132_Gayvern_How_01_07");	//Если ты по поводу работы - то, возможно, есть одна мысль.
		AI_Output(self,other,"DIA_VLK_6132_Gayvern_How_01_08");	//Тогда чего же ты тянешь - выкладывай!
	}
	else if((MIS_TRADEHELPER != LOG_Running) || (MIS_TRADEHELPER != LOG_SUCCESS) || (MIS_TRADEHELPER != LOG_FAILED))
	{
		AI_Output(self,other,"DIA_VLK_6132_Gayvern_How_01_02");	//А у тебя новости есть?
		AI_Output(other,self,"DIA_VLK_6132_Gayvern_How_01_03");	//Если ты по поводу работы - то нет.
		AI_Output(self,other,"DIA_VLK_6132_Gayvern_How_01_04");	//Очень жаль...
		AI_Output(self,other,"DIA_VLK_6132_Gayvern_How_01_05");	//Ладно, если что - ты знаешь, где меня найти.
	}
	else if((MIS_TRADEHELPER == LOG_Running) && (FINDPERSONONE == FALSE))
	{
		AI_Output(self,other,"DIA_VLK_6132_Gayvern_How_01_06");	//А у тебя новости есть?
		AI_Output(other,self,"DIA_VLK_6132_Gayvern_How_01_07");	//Если ты по поводу работы - то, возможно, есть одна мысль.
		AI_Output(self,other,"DIA_VLK_6132_Gayvern_How_01_08");	//Тогда чего же ты тянешь - выкладывай!
	};
};


instance DIA_VLK_6132_GAYVERN_HIRE(C_Info)
{
	npc = vlk_6132_gayvern;
	nr = 2;
	condition = dia_vlk_6132_gayvern_hire_condition;
	information = dia_vlk_6132_gayvern_hire_info;
	permanent = FALSE;
	description = "Тебе еще нужна работа?";
};


func int dia_vlk_6132_gayvern_hire_condition()
{
	if(Npc_KnowsInfo(other,dia_vlk_6132_gayvern_work) && (MIS_TRADEHELPER == LOG_Running) && (GAYVERNRECRUITEDDT == FALSE))
	{
		return TRUE;
	};
};

func void dia_vlk_6132_gayvern_hire_info()
{
	AI_Output(other,self,"DIA_VLK_6132_Gayvern_Hire_01_00");	//Тебе еще нужна работа?
	AI_Output(self,other,"DIA_VLK_6132_Gayvern_Hire_01_01");	//Ха! Он еще и спрашивает! Конечно же нужна.
	AI_Output(self,other,"DIA_VLK_6132_Gayvern_Hire_01_02");	//А что ты можешь предложить?
	AI_Output(other,self,"DIA_VLK_6132_Gayvern_Hire_01_03");	//Один крупный торговец из верхнего квартала города ищет человека на место своего помощника.
	AI_Output(other,self,"DIA_VLK_6132_Gayvern_Hire_01_04");	//А работа заключается в том, чтобы выполнять его поручения и помогать ему вести торговые дела.
	AI_Output(other,self,"DIA_VLK_6132_Gayvern_Hire_01_06");	//Вот я и подумал, что, может быть, ты смог бы взяться за это дело.
	AI_Output(other,self,"DIA_VLK_6132_Gayvern_Hire_01_07");	//Тебе это интересно?
	AI_Output(self,other,"DIA_VLK_6132_Gayvern_Hire_01_08");	//Парень, я готов выполнять любую работу, лишь бы не сидеть тут без дела.
	AI_Output(other,self,"DIA_VLK_6132_Gayvern_Hire_01_10");	//Хорошо. Но не будем торопиться: для начала мне нужно немного узнать, на что ты способен.
	AI_Output(other,self,"DIA_VLK_6132_Gayvern_Hire_01_11");	//Скажи, что ты умеешь делать?
	AI_Output(self,other,"DIA_VLK_6132_Gayvern_Hire_01_12");	//Ну...(задумчиво)
	AI_Output(self,other,"DIA_VLK_6132_Gayvern_Hire_01_13");	//Если тебе нужно что-нибудь там разгрузить или погрузить - в этом деле мне равных нет.
	AI_Output(other,self,"DIA_VLK_6132_Gayvern_Hire_01_14");	//А ты умеешь договариваться с людьми?
	AI_Output(self,other,"DIA_VLK_6132_Gayvern_Hire_01_15");	//Конечно. Каждый день только этим и занимаюсь...(смеется)
	AI_Output(self,other,"DIA_VLK_6132_Gayvern_Hire_01_16");	//Уговариваю людей не делать тут разных глупостей. И знаешь, мои методы уговоров действуют безотказно!
	AI_Output(other,self,"DIA_VLK_6132_Gayvern_Hire_01_17");	//Ну, в этом я не сомневаюсь.
	AI_Output(self,other,"DIA_VLK_6132_Gayvern_Hire_01_18");	//Поверь мне: ты не пожалеешь, если порекомендуешь торговцу именно меня.
	AI_Output(self,other,"DIA_VLK_6132_Gayvern_Hire_01_19");	//Так что, если я тебя заинтересовал, - только скажи - и я в деле!
	AI_Output(other,self,"DIA_VLK_6132_Gayvern_Hire_01_20");	//Хорошо, я подумаю на этим.
	B_LogEntry(TOPIC_TRADEHELPER,"Я поговорил с Гэйверном. Мое предложение - устроиться на работу к Лютеро - он принял с воодушевлением. Хотя, может быть, мне стоит поискать еще кого-нибудь для этой работенки.");
	GAYVERNAGREE = TRUE;
};


instance DIA_VLK_6132_GAYVERN_HIREOK(C_Info)
{
	npc = vlk_6132_gayvern;
	nr = 2;
	condition = dia_vlk_6132_gayvern_hireok_condition;
	information = dia_vlk_6132_gayvern_hireok_info;
	permanent = FALSE;
	description = "Идем к торговцу.";
};


func int dia_vlk_6132_gayvern_hireok_condition()
{
	if((GAYVERNAGREE == TRUE) && (MIS_TRADEHELPER == LOG_Running) && (FINDPERSONONE == FALSE) && (FINDPERSONTWO == FALSE) && (FINDPERSONTHREE == FALSE) && (GAYVERNRECRUITEDDT == FALSE))
	{
		return TRUE;
	};
};

func void dia_vlk_6132_gayvern_hireok_info()
{
	AI_Output(other,self,"DIA_VLK_6132_Gayvern_HireOk_01_00");	//Идем к торговцу.
	AI_Output(other,self,"DIA_VLK_6132_Gayvern_HireOk_01_01");	//Думаю, ты именно тот человек, который ему нужен.
	AI_Output(self,other,"DIA_VLK_6132_Gayvern_HireOk_01_02");	//Отлично! Пошли.
	B_LogEntry(TOPIC_TRADEHELPER,"Я остановил свой выбор на Гэйверне. Надеюсь, Лютеро его оценит.");
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	FINDPERSONONE = TRUE;
	Npc_ExchangeRoutine(self,"FOLLOW");
};


instance DIA_VLK_6132_GAYVERN_NEWLIFE(C_Info)
{
	npc = vlk_6132_gayvern;
	nr = 2;
	condition = dia_vlk_6132_gayvern_newlife_condition;
	information = dia_vlk_6132_gayvern_newlife_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_vlk_6132_gayvern_newlife_condition()
{
	if((GAYVERNNOTHIRED == TRUE) && (HURRAYICANHIRE == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_vlk_6132_gayvern_newlife_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
};


instance DIA_VLK_6132_GAYVERN_PICKPOCKET(C_Info)
{
	npc = vlk_6132_gayvern;
	nr = 900;
	condition = dia_vlk_6132_gayvern_pickpocket_condition;
	information = dia_vlk_6132_gayvern_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_vlk_6132_gayvern_pickpocket_condition()
{
	return C_Beklauen(30,60);
};

func void dia_vlk_6132_gayvern_pickpocket_info()
{
	Info_ClearChoices(dia_vlk_6132_gayvern_pickpocket);
	Info_AddChoice(dia_vlk_6132_gayvern_pickpocket,Dialog_Back,dia_vlk_6132_gayvern_pickpocket_back);
	Info_AddChoice(dia_vlk_6132_gayvern_pickpocket,DIALOG_PICKPOCKET,dia_vlk_6132_gayvern_pickpocket_doit);
};

func void dia_vlk_6132_gayvern_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_vlk_6132_gayvern_pickpocket);
};

func void dia_vlk_6132_gayvern_pickpocket_back()
{
	Info_ClearChoices(dia_vlk_6132_gayvern_pickpocket);
};

instance DIA_VLK_6132_GAYVERN_ASKFORDT(C_Info)
{
	npc = vlk_6132_gayvern;
	nr = 6;
	condition = DIA_VLK_6132_GAYVERN_askfordt_condition;
	information = DIA_VLK_6132_GAYVERN_askfordt_info;
	permanent = FALSE;
	description = "Не хочешь поработать на меня?";
};

func int DIA_VLK_6132_GAYVERN_askfordt_condition()
{
	if(Npc_KnowsInfo(other,dia_vlk_6132_gayvern_work) && (HURRAYICANHIRE == TRUE))
	{
		return TRUE;
	};
};

func void DIA_VLK_6132_GAYVERN_askfordt_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_VLK_6132_GAYVERN_AskforDT_15_00");	//Не хочешь поработать на меня?
	AI_Output(self,other,"DIA_VLK_6132_GAYVERN_AskforDT_17_01");	//А что надо будет делать?
	AI_Output(other,self,"DIA_VLK_6132_GAYVERN_AskforDT_17_02");	//Ну, ты ведь крепкий парень. А мне в лагере не помешал бы еще один охранник.
	AI_Output(self,other,"DIA_VLK_6132_GAYVERN_AskforDT_17_03");	//У тебя даже лагерь есть?
	AI_Output(other,self,"DIA_VLK_6132_GAYVERN_AskforDT_17_04");	//Да, и я как раз набираю туда людей. Ну, что скажешь?
	AI_Output(self,other,"DIA_VLK_6132_GAYVERN_AskforDT_17_05");	//(задумался) Охранник? Что же получается, опять придется кому-то бить морду?
	AI_Output(other,self,"DIA_VLK_6132_GAYVERN_AskforDT_17_06");	//Я бы сказал, это куда более отвественная работа. Конечно же, за порядком следить тоже придется.
	AI_Output(other,self,"DIA_VLK_6132_GAYVERN_AskforDT_17_07");	//Но кроме этого, на лагерь могут напасть монстры, бандиты или даже орки. И мне нужны люди, готовые защищать его.
	AI_Output(self,other,"DIA_VLK_6132_GAYVERN_AskforDT_17_08");	//А, ну... Это звучит куда интересней. А кормить там будут? 
	AI_Output(other,self,"DIA_VLK_6132_GAYVERN_AskforDT_17_09");	//Само собой. Трехразовое питание, кров и небольшая, но ежедневная плата за различного рода хлопоты. 
	AI_Output(self,other,"DIA_VLK_6132_GAYVERN_AskforDT_17_10");	//Еще и платить будут? А сколько?
	AI_Output(other,self,"DIA_VLK_6132_GAYVERN_AskforDT_17_11");	//Хммм... Порядка тридцати золотых монет в день. Идет?
	AI_Output(self,other,"DIA_VLK_6132_GAYVERN_AskforDT_17_12");	//Тридцать золотых монет?! Да я таких денег и отродясь не получал. Хорошо, я согласен.
	AI_Output(other,self,"DIA_VLK_6132_GAYVERN_AskforDT_17_13");	//Вот и славно. Тогда собирай свои вещи и дуй прямиком туда.
	AI_Output(other,self,"DIA_VLK_6132_GAYVERN_AskforDT_17_14");	//И кстати, пароль для входа в лагерь - 'Драконовы сокровища'. Просто скажи его охранникам на входе.
	AI_Output(self,other,"DIA_VLK_6132_GAYVERN_AskforDT_17_15");	//Понял. Только сначала скажу Кардифу, что я увольняюсь. 
	AI_Output(self,other,"DIA_VLK_6132_GAYVERN_AskforDT_17_16");	//Эх... Должно быть, он сильно растроится из-за этого. Но сидеть целыми днями в его кабаке мне наскучило еще больше.
	AI_Output(other,self,"DIA_VLK_6132_GAYVERN_AskforDT_17_17");	//Хорошо, только не задерживайся.
	AI_Output(self,other,"DIA_VLK_6132_GAYVERN_AskforDT_17_18");	//Постараюсь.
	B_LogEntry(TOPIC_PPL_FOR_TOWER,"Гэйверн присоединился к моему лагерю.");
	self.npcType = NPCTYPE_FRIEND;
	self.aivar[AIV_ToughGuy] = TRUE;
	self.aivar[AIV_IGNORE_Theft] = TRUE;
	self.aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	self.aivar[AIV_IgnoresArmor] = TRUE;
	GAYVERNRECRUITEDDT = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"InTower");
};

instance DIA_VLK_6132_GAYVERN_INTOWER(C_Info)
{
	npc = vlk_6132_gayvern;
	nr = 22;
	condition = DIA_VLK_6132_GAYVERN_intower_condition;
	information = DIA_VLK_6132_GAYVERN_intower_info;
	permanent = TRUE;
	description = "Все в порядке?";
};

func int DIA_VLK_6132_GAYVERN_intower_condition()
{
	if((GAYVERNRECRUITEDDT == TRUE) && (Npc_GetDistToWP(self,"NW_CASTLEMINE_TOWER_01") < 5000))
	{
		return TRUE;
	};
};

func void DIA_VLK_6132_GAYVERN_intower_info()
{
	AI_Output(other,self,"DIA_VLK_6132_GAYVERN_InTower_OrcKap_15_00");	//Все в порядке?
	AI_Output(self,other,"DIA_VLK_6132_GAYVERN_InTower_OrcKap_01_01");	//В полном.
};