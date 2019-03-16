
instance DIA_LESTER_LI_EXIT(C_Info)
{
	npc = pc_psionic_li;
	nr = 999;
	condition = dia_lester_li_exit_condition;
	information = dia_lester_li_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_lester_li_exit_condition()
{
	return TRUE;
};

func void dia_lester_li_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LESTER_LI_HELLO(C_Info)
{
	npc = pc_psionic_li;
	nr = 1;
	condition = dia_lester_li_hello_condition;
	information = dia_lester_li_hello_info;
	permanent = TRUE;
	description = "Ты можешь мне что-нибудь сообщить?";
};


func int dia_lester_li_hello_condition()
{
	return TRUE;
};

func void dia_lester_li_hello_info()
{
	AI_Output(other,self,"DIA_Lester_LI_Hello_15_00");	//Ты можешь мне что-нибудь сообщить?
	AI_Output(self,other,"DIA_Lester_LI_Hello_13_06");	//На данный момент ничего. Может, позднее.
};


instance DIA_PSIONIC_LI_PICKPOCKET(C_Info)
{
	npc = pc_psionic_li;
	nr = 900;
	condition = dia_psionic_li_pickpocket_condition;
	information = dia_psionic_li_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_psionic_li_pickpocket_condition()
{
	return C_Beklauen(56,25);
};

func void dia_psionic_li_pickpocket_info()
{
	Info_ClearChoices(dia_psionic_li_pickpocket);
	Info_AddChoice(dia_psionic_li_pickpocket,Dialog_Back,dia_psionic_li_pickpocket_back);
	Info_AddChoice(dia_psionic_li_pickpocket,DIALOG_PICKPOCKET,dia_psionic_li_pickpocket_doit);
};

func void dia_psionic_li_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_psionic_li_pickpocket);
};

func void dia_psionic_li_pickpocket_back()
{
	Info_ClearChoices(dia_psionic_li_pickpocket);
};


instance DIA_PSIONIC_LI_REDJOINT(C_Info)
{
	npc = pc_psionic_li;
	nr = 2;
	condition = dia_psionic_li_redjoint_condition;
	information = dia_psionic_li_redjoint_info;
	permanent = FALSE;
	description = "Я тут нашел необычный сорт болотника.";
};


func int dia_psionic_li_redjoint_condition()
{
	if(Npc_HasItems(hero,itpl_swampherb_02) >= 1)
	{
		return TRUE;
	};
};

func void dia_psionic_li_redjoint_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Psionic_LI_RedJoint_01_01");	//Я тут нашел необычный сорт болотника. Хочешь взглянуть?
	AI_Output(self,other,"DIA_Psionic_LI_RedJoint_01_02");	//(удивленно) Необычный сорт? Ну что же, давай посмотрим.
	AI_Output(other,self,"DIA_Psionic_LI_RedJoint_01_03");	//Вот, держи.
	B_GiveInvItems(other,self,itpl_swampherb_02,1);
	AI_Output(self,other,"DIA_Psionic_LI_RedJoint_01_04");	//Хммм...(внимательно рассматривая) С виду это действительно болотник. Только он... красный!
	AI_Output(other,self,"DIA_Psionic_LI_RedJoint_01_05");	//Ты когда-нибудь встречал нечто подобное?
	AI_Output(self,other,"DIA_Psionic_LI_RedJoint_01_06");	//Нет, приятель. Первый раз в жизни вижу такое!
	AI_Output(self,other,"DIA_Psionic_LI_RedJoint_01_09");	//Возможно, конечно, что этот болотник обладает куда более загадочными свойствами, чем обычный... Но я бы не стал торопиться с выводами.
	AI_Output(self,other,"DIA_Psionic_LI_RedJoint_01_10");	//Одно мне ясно точно: этот остров таит в себе множество сюрпризов, раз здесь встречаются подобные вещи!
	AI_Output(other,self,"DIA_Psionic_LI_RedJoint_01_11");	//И что нам теперь делать с этим болотником?
	AI_Output(self,other,"DIA_Psionic_LI_RedJoint_01_12");	//Хммм. Ну, думаю, что для начала нам стоит изучить это загадочное растение.
	AI_Output(self,other,"DIA_Psionic_LI_RedJoint_01_13");	//Возможно, его свойства будут полезны для какого-либо рода дел.
	AI_Output(self,other,"DIA_Psionic_LI_RedJoint_01_14");	//Если тебе попадется еще что-нибудь нечто подобное - приноси мне!
	MIS_REDJOINT = LOG_Running;
	Log_CreateTopic(TOPIC_REDJOINT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_REDJOINT,LOG_Running);
	B_LogEntry(TOPIC_REDJOINT,"Я показал Лестеру необычный болотник, который нашел на этом острове. Его удивила моя находка, и он захотел тщательно изучить его свойства, а также попросил принести еще несколько подобных экземпляров, если они мне попадутся на глаза.");
};


instance DIA_PSIONIC_LI_REDJOINTMORE(C_Info)
{
	npc = pc_psionic_li;
	nr = 2;
	condition = dia_psionic_li_redjointmore_condition;
	information = dia_psionic_li_redjointmore_info;
	permanent = TRUE;
	description = "У меня есть несколько стеблей красного болотника.";
};


func int dia_psionic_li_redjointmore_condition()
{
	if((MIS_REDJOINT == LOG_Running) && (Npc_HasItems(hero,itpl_swampherb_02) >= 1) && (TESTSWAMPHERB == FALSE))
	{
		return TRUE;
	};
};

func void dia_psionic_li_redjointmore_info()
{
	var int redjointcount;
	AI_Output(other,self,"DIA_Psionic_LI_RedJointMore_01_01");	//У меня есть несколько стеблей красного болотника.
	AI_Output(self,other,"DIA_Psionic_LI_RedJointMore_01_02");	//Хорошо! Давай их сюда.
	redjointcount = Npc_HasItems(other,itpl_swampherb_02);
	GLOBALREDJOINTCOUNT = GLOBALREDJOINTCOUNT + redjointcount;
	B_GiveInvItems(other,self,itpl_swampherb_02,redjointcount);
	redjointcount = redjointcount * 100;
	B_GivePlayerXP(redjointcount);
	if(GLOBALREDJOINTCOUNT >= 5)
	{
		AI_Output(self,other,"DIA_Psionic_LI_RedJointMore_01_04");	//Отлично! Думаю, что теперь у меня вполне достаточно этого болотника, чтобы попробовать определить его свойства.
		AI_Output(self,other,"DIA_Psionic_LI_RedJointMore_01_06");	//Это займет немного времени...
		B_LogEntry(TOPIC_REDJOINT,"Я принес Лестеру достаточное количество красного болотника. Нужно немного времени, чтобы понять, в чем именно заключаются загадочные свойства этого растения.");
		TESTSWAMPHERB = TRUE;
		TESTSWAMPHERBTIMER = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Psionic_LI_RedJointMore_01_08");	//Совсем неплохо. Правда, боюсь, что для моих исследований мне нужно немного больше этого болотника.
		AI_Output(self,other,"DIA_Psionic_LI_RedJointMore_01_09");	//Если тебе попадется еще что-нибудь подобное - приноси мне.
	};
};


instance DIA_PSIONIC_LI_REDJOINTDONE(C_Info)
{
	npc = pc_psionic_li;
	nr = 2;
	condition = dia_psionic_li_redjointdone_condition;
	information = dia_psionic_li_redjointdone_info;
	permanent = TRUE;
	description = "Как успехи?";
};


func int dia_psionic_li_redjointdone_condition()
{
	if((MIS_REDJOINT == LOG_Running) && (TESTSWAMPHERB == TRUE) && (TESTSWAMPHERBREADY == FALSE))
	{
		return TRUE;
	};
};

func void dia_psionic_li_redjointdone_info()
{
	var int daynow;
	daynow = Wld_GetDay();
	AI_Output(other,self,"DIA_Psionic_LI_RedJointDone_01_00");	//Как успехи?
	if(TESTSWAMPHERBTIMER <= (daynow - 1))
	{
		B_GivePlayerXP(100);
		AI_Output(self,other,"DIA_Psionic_LI_RedJointDone_01_01");	//Кажется, я понял, в чем заключается секрет этого болотника...
		AI_Output(self,other,"DIA_Psionic_LI_RedJointDone_01_03");	//Если его обработать надлежащим образом, а после выдержать определенную пропорцию - то эффект от воскурения этой травы будет просто потрясающим!
		AI_Output(self,other,"DIA_Psionic_LI_RedJointDone_01_04");	//Даже 'Северный темный' не сравниться с ним!
		B_GiveInvItems(self,other,itmi_redjoint,1);
		AI_Output(self,other,"DIA_Psionic_LI_RedJointDone_01_07");	//Вот, возьми вот это, и сам все поймешь!
		B_LogEntry(TOPIC_REDJOINT,"Лестер наконец-то закончил свои исследования. Он не стал вдаваться в их подробности, а просто вручил мне одну порцию уже обработанного красного болотника.");
		TESTSWAMPHERBREADY = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Psionic_LI_RedJointDone_01_09");	//Я еще работаю над этим. Так что поговорим об этом позже.
	};
};


instance DIA_PSIONIC_LI_REDJOINTDONEEXT(C_Info)
{
	npc = pc_psionic_li;
	nr = 2;
	condition = dia_psionic_li_redjointdoneext_condition;
	information = dia_psionic_li_redjointdoneext_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_psionic_li_redjointdoneext_condition()
{
	if(MIS_REDJOINT == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_psionic_li_redjointdoneext_info()
{
	AI_Output(self,other,"DIA_Psionic_LI_RedJointDoneExt_01_01");	//Ну и как тебе болотник?
	AI_Output(other,self,"DIA_Psionic_LI_RedJointDoneExt_01_02");	//Как ты и говорил - превосходно! Правда, от всего этого у меня немного странные ощущения.
	AI_Output(self,other,"DIA_Psionic_LI_RedJointDoneExt_01_03");	//Оно и понятно... Все-таки это не обычный болотник!
	AI_Output(self,other,"DIA_Psionic_LI_RedJointDoneExt_01_04");	//Мой тебе совет: иди поспи. Все как рукой снимет.
};


instance DIA_PSIONIC_LI_REDJOINTDONEEXTMORE(C_Info)
{
	npc = pc_psionic_li;
	nr = 2;
	condition = dia_psionic_li_redjointdoneextmore_condition;
	information = dia_psionic_li_redjointdoneextmore_info;
	permanent = FALSE;
	description = "А у тебя есть еще этот болотник?";
};


func int dia_psionic_li_redjointdoneextmore_condition()
{
	if((MIS_REDJOINT == LOG_SUCCESS) && Npc_KnowsInfo(hero,dia_psionic_li_redjointdoneext))
	{
		return TRUE;
	};
};

func void dia_psionic_li_redjointdoneextmore_info()
{
	AI_Output(other,self,"DIA_Psionic_LI_RedJointDoneExtMore_01_01");	//У тебя есть еще такой болотник?
	AI_Output(self,other,"DIA_Psionic_LI_RedJointDoneExtMore_01_02");	//Что, понравилось? Это и понятно - вещь действительно хорошая.
	AI_Output(self,other,"DIA_Psionic_LI_RedJointDoneExtMore_01_03");	//Но на твоем месте я бы не слишком увлекался!
	AI_Output(self,other,"DIA_Psionic_LI_RedJointDoneExtMore_01_05");	//Нам еще до конца не известно, как именно он будет действовать в дальнейшем.
	AI_Output(self,other,"DIA_Psionic_LI_RedJointDoneExtMore_01_06");	//Возможно, у этой травы есть какие-нибудь побочные эффекты. Так что лучше не рисковать.
};


instance DIA_PSIONIC_LI_MISSMYGOLD(C_Info)
{
	npc = pc_psionic_li;
	nr = 2;
	condition = dia_psionic_li_missmygold_condition;
	information = dia_psionic_li_missmygold_info;
	permanent = FALSE;
	description = "Ничего не знаешь о моем золоте?";
};


func int dia_psionic_li_missmygold_condition()
{
	if((BEGINGOLDSEEK == TRUE) && (MIS_MISSMYGOLD == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_psionic_li_missmygold_info()
{
	AI_Output(other,self,"DIA_Psionic_LI_MissMyGold_01_01");	//Ничего не знаешь о моем золоте?
	AI_Output(self,other,"DIA_Psionic_LI_MissMyGold_01_02");	//Нет. А что с ним?
	AI_Output(other,self,"DIA_Psionic_LI_MissMyGold_01_03");	//Оно куда-то пропало.
	AI_Output(self,other,"DIA_Psionic_LI_MissMyGold_01_04");	//(удивленно) Пропало? Но как же это могло случиться?
	AI_Output(other,self,"DIA_Psionic_LI_MissMyGold_01_05");	//Вот и меня интересует тот же вопрос.
	AI_Output(self,other,"DIA_Psionic_LI_MissMyGold_01_06");	//Извини, приятель... но я вряд ли смогу тебе здесь чем-то помочь.
	B_LogEntry(TOPIC_MISSMYGOLD,"Лестер не в курсе моей проблемы.");
};


instance DIA_PSIONIC_LI_AWAY(C_Info)
{
	npc = pc_psionic_li;
	nr = 3;
	condition = dia_psionic_li_away_condition;
	information = dia_psionic_li_away_info;
	permanent = FALSE;
	description = "Тебе нужно вернуться.";
};


func int dia_psionic_li_away_condition()
{
	if((MIS_GATHERCREW == LOG_Running) && (LESTERLIONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_psionic_li_away_info()
{
	var int countpeopple;
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Psionic_LI_Away_01_01");	//Тебе нужно вернуться.
	AI_Output(self,other,"DIA_Psionic_LI_Away_01_02");	//А что случилось?
	AI_Output(other,self,"DIA_Psionic_LI_Away_01_03");	//С ближайшим приливом мы снимаемся с якоря.
	AI_Output(self,other,"DIA_Psionic_LI_Away_01_04");	//Наконец-то! Давно уже пора.
	AI_Output(self,other,"DIA_Psionic_LI_Away_01_05");	//А то за последнее время мне этот остров уже порядком поднадоел.
	B_LogEntry(TOPIC_GATHERCREW,"Лестер рад был услышать о нашем отплытии с острова.");
	LESTERLIONBOARD = TRUE;
	if((GORNLIHERE == TRUE) && (GORNLIONBOARD == TRUE))
	{
		countpeopple = countpeopple + 1;
	};
	if((MILTENLIONBOARD == TRUE) && (MILTENLIHERE == TRUE))
	{
		countpeopple = countpeopple + 1;
	};
	if((LESTERLIONBOARD == TRUE) && (LESTERLIHERE == TRUE))
	{
		countpeopple = countpeopple + 1;
	};
	if((DIEGOLIONBOARD == TRUE) && (DIEGOLIHERE == TRUE))
	{
		countpeopple = countpeopple + 1;
	};
	if((ANGARLIONBOARD == TRUE) && (ANGARLIHERE == TRUE))
	{
		countpeopple = countpeopple + 1;
	};
	if((COUNTPEOPLEONBEACH <= countpeopple) && (LICREWONBOARD == FALSE))
	{
		LICREWONBOARD = TRUE;
	};
	AI_StopProcessInfos(self);
};


instance DIA_PSIONIC_LI_FINDMAGICORECAVE(C_Info)
{
	npc = pc_psionic_li;
	nr = 2;
	condition = dia_psionic_li_findmagicorecave_condition;
	information = dia_psionic_li_findmagicorecave_info;
	permanent = FALSE;
	description = "Я нашел пещеру с залежами магической руды.";
};


func int dia_psionic_li_findmagicorecave_condition()
{
	if((MIS_FINDMAGICORECAVE == LOG_Running) && (LIBEFORETESTOK == FALSE) && (LITESTOK == FALSE) && (GOTOORECAPITAN == FALSE))
	{
		return TRUE;
	};
};

func void dia_psionic_li_findmagicorecave_info()
{
	AI_Output(other,self,"DIA_Psionic_LI_FindMagicOreCave_01_01");	//Я нашел пещеру с залежами магической руды.
	AI_Output(self,other,"DIA_Psionic_LI_FindMagicOreCave_01_02");	//Правда?! Тогда тебе стоит поговорить об этом с нашим капитаном.
	AI_Output(self,other,"DIA_Psionic_LI_FindMagicOreCave_01_03");	//Думаю, ему будет интересно услышать эту новость.
	GOTOORECAPITAN = TRUE;
};


instance DIA_PSIONIC_LI_CHANGECOURSE(C_Info)
{
	npc = pc_psionic_li;
	nr = 2;
	condition = dia_psionic_li_changecourse_condition;
	information = dia_psionic_li_changecourse_info;
	permanent = FALSE;
	description = "У меня есть к тебе один вопрос.";
};


func int dia_psionic_li_changecourse_condition()
{
	if(MIS_CHANGECOURSE == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_psionic_li_changecourse_info()
{
	AI_Output(other,self,"DIA_Psionic_LI_ChangeCourse_01_02");	//Что ты скажешь на то, если мы вернемся обратно Хоринис?
	AI_Output(self,other,"DIA_Psionic_LI_ChangeCourse_01_03");	//Интересно! Даже, честно говоря, очень неожиданное предложение!
	AI_Output(self,other,"DIA_Psionic_LI_ChangeCourse_01_04");	//А в чем дело?
	Info_ClearChoices(dia_psionic_li_changecourse);
	Info_AddChoice(dia_psionic_li_changecourse,"Все дело в магической руде.",dia_psionic_li_changecourse_ore);
	Info_AddChoice(dia_psionic_li_changecourse,"Золото - главная тому причина.",dia_psionic_li_changecourse_gold);
};

func void dia_psionic_li_changecourse_ore()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Psionic_LI_ChangeCourse_Ore_01_01");	//Все дело в магической руде, которую мы отыскали на этом острове.
	AI_Output(other,self,"DIA_Psionic_LI_ChangeCourse_Ore_01_02");	//Думаю, нам стоит сообщить о ней паладинам, пока те окончательно не проиграли эту войну оркам.
	AI_Output(self,other,"DIA_Psionic_LI_ChangeCourse_Ore_01_03");	//Хммм...(задумчиво) Выходит, что дело действительно серьезное.
	AI_Output(self,other,"DIA_Psionic_LI_ChangeCourse_Ore_01_05");	//Но мне кажется, что какая-то жалкая горстка руды уже вряд ли сможет изменить ситуацию паладинов в целом.
	AI_Output(self,other,"DIA_Psionic_LI_ChangeCourse_Ore_01_06");	//Думаю, эта война ими уже давно проиграна, и наши усилия, скорее всего, окажутся напрасными.
	AI_Output(self,other,"DIA_Psionic_LI_ChangeCourse_Ore_01_07");	//По крайней мере, слухи, приходящие с материка, свидетельствуют именно об этом.
	AI_Output(other,self,"DIA_Psionic_LI_ChangeCourse_Ore_01_08");	//Возможно, и так. Но мы все равно должны сделать все, что в наших силах.
	AI_Output(self,other,"DIA_Psionic_LI_ChangeCourse_Ore_01_10");	//Ладно. Если хочешь знать мое мнение, то я не против составить тебе компанию.
	AI_Output(self,other,"DIA_Psionic_LI_ChangeCourse_Ore_01_11");	//В любом случае твои решения всегда имели необъяснимый для меня смысл, но, несмотря на это, в итоге они всегда оказывались верными.
	B_LogEntry(TOPIC_CHANGECOURSE,"Лестер дал свое согласие на то, чтобы мы отправились обратно в Хоринис.");
	CREWAGREEAWAYBACKPAL = CREWAGREEAWAYBACKPAL + 1;
	COUNTPEOPLEDECIDEPRG = COUNTPEOPLEDECIDEPRG + 1;
	if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
	{
		READYCHANGECOURSE = TRUE;
		Log_AddEntry(TOPIC_CHANGECOURSE,"Кажется, я поговорил со всеми парнями. Пора сообщить об этом нашему капитану.");
	};
	Info_ClearChoices(dia_psionic_li_changecourse);
};

func void dia_psionic_li_changecourse_gold()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Psionic_LI_ChangeCourse_Gold_01_01");	//Золото - главная тому причина.
	AI_Output(other,self,"DIA_Psionic_LI_ChangeCourse_Gold_01_03");	//Паладины наверняка хорошо нам заплатят за ту руду, которую мы отыскали на этом острове.
	AI_Output(self,other,"DIA_Psionic_LI_ChangeCourse_Gold_01_04");	//Вот уж не думал, что ты так любишь золото... По моему мнению, вся эта затея все равно слишком рискованная!
	AI_Output(self,other,"DIA_Psionic_LI_ChangeCourse_Gold_01_06");	//Когда мы отплывали на Ирдорат, Хоринис уже был под угрозой вторжения орков!
	AI_Output(self,other,"DIA_Psionic_LI_ChangeCourse_Gold_01_08");	//Возможно, что орки уже захватили весь остров.
	AI_Output(self,other,"DIA_Psionic_LI_ChangeCourse_Gold_01_10");	//Эх... Но все же я не против составить тебе компанию.
	AI_Output(self,other,"DIA_Psionic_LI_ChangeCourse_Gold_01_11");	//В любом случае твои решения всегда имели необъяснимый для меня смысл, но, несмотря на это, в итоге они всегда оказывались верными.
	B_LogEntry(TOPIC_CHANGECOURSE,"Лестер с большой неохотой дал свое согласие на то, чтобы отправиться обратно в Хоринис.");
	COUNTPEOPLEDECIDEPRG = COUNTPEOPLEDECIDEPRG + 1;
	if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
	{
		READYCHANGECOURSE = TRUE;
		Log_AddEntry(TOPIC_CHANGECOURSE,"Кажется, я поговорил со всеми парнями. Пора сообщить об этом нашему капитану.");
	};
	Info_ClearChoices(dia_psionic_li_changecourse);
};

