
instance DIA_ORC_8566_URHAN_EXIT(C_Info)
{
	npc = orc_8566_urhan;
	nr = 999;
	condition = dia_orc_8566_urhan_exit_condition;
	information = dia_orc_8566_urhan_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_orc_8566_urhan_exit_condition()
{
	return TRUE;
};

func void dia_orc_8566_urhan_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ORC_8566_URHAN_HELLO(C_Info)
{
	npc = orc_8566_urhan;
	condition = dia_orc_8566_urhan_hello_condition;
	information = dia_orc_8566_urhan_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_orc_8566_urhan_hello_condition()
{
	if((MIS_ORсGREATWAR == LOG_Running) && (MIS_STURMCASTLE == FALSE))
	{
		return TRUE;
	};
};

func void dia_orc_8566_urhan_hello_info()
{
	AI_Output(self,other,"DIA_Orc_8566_UrHan_Hello_01_01");	//ХАТАГ БАТ НАР! Человек?! Кто тебя пустить?!
	AI_Output(other,self,"DIA_Orc_8566_UrHan_Hello_01_02");	//Никто! Я сам пришел.
	AI_Output(self,other,"DIA_Orc_8566_UrHan_Hello_01_04");	//Аргхх...(воинственно) Однако человек быть слишком смелый или слишком глупый, что приходить сюда!
	AI_Output(self,other,"DIA_Orc_8566_UrHan_Hello_01_05");	//Хотя ты и носить знак силы орков, но это может не спасать тебя. Только сказать слово - и мои воины разорвать сейчас тебя на куски!
	AI_Output(other,self,"DIA_Orc_8566_UrHan_Hello_01_06");	//Возможно и так, орк. Но я, пожалуй, рискну.
	AI_Output(self,other,"DIA_Orc_8566_UrHan_Hello_01_07");	//Хммм...(немного с уважением) Ну хорошо! И что человек хотеть от меня?
	if(DGJMOVEPALADIN == TRUE)
	{
		b_readydgjmove();
	};
};


instance DIA_ORC_8566_URHAN_WHOYOU(C_Info)
{
	npc = orc_8566_urhan;
	condition = dia_orc_8566_urhan_whoyou_condition;
	information = dia_orc_8566_urhan_whoyou_info;
	permanent = FALSE;
	description = "Кто ты?";
};


func int dia_orc_8566_urhan_whoyou_condition()
{
	if((MIS_ORсGREATWAR == LOG_Running) && (MIS_STURMCASTLE == FALSE))
	{
		return TRUE;
	};
};

func void dia_orc_8566_urhan_whoyou_info()
{
	AI_Output(other,self,"DIA_Orc_8566_UrHan_WhoYou_01_01");	//Кто ты?!
	AI_Output(self,other,"DIA_Orc_8566_UrHan_WhoYou_01_02");	//Меня звать Хаг-Тар, человек.
	AI_Output(self,other,"DIA_Orc_8566_UrHan_WhoYou_01_03");	//(воинственно) Что человек еще хотеть спрашивать?!
};


instance DIA_ORC_8566_URHAN_WHOLEADER(C_Info)
{
	npc = orc_8566_urhan;
	condition = dia_orc_8566_urhan_wholeader_condition;
	information = dia_orc_8566_urhan_wholeader_info;
	permanent = FALSE;
	description = "Кто возглавляет этот отряд в крепости?";
};


func int dia_orc_8566_urhan_wholeader_condition()
{
	if((MIS_ORсGREATWAR == LOG_Running) && (MIS_STURMCASTLE == FALSE) && Npc_KnowsInfo(hero,dia_orc_8566_urhan_whoyou))
	{
		return TRUE;
	};
};

func void dia_orc_8566_urhan_wholeader_info()
{
	AI_Output(other,self,"DIA_Orc_8566_UrHan_WhoLeader_01_01");	//Кто возглавляет этот отряд в крепости?
	AI_Output(self,other,"DIA_Orc_8566_UrHan_WhoLeader_01_02");	//Хаг-Тар быть здесь самый главный! Все воины слушать его и делать то, что он сказать.
	AI_Output(self,other,"DIA_Orc_8566_UrHan_WhoLeader_01_03");	//Человек быть очень глупый, если сам этого не понимать.
};


instance DIA_ORC_8566_URHAN_PALADINSAFE(C_Info)
{
	npc = orc_8566_urhan;
	condition = dia_orc_8566_urhan_paladinsafe_condition;
	information = dia_orc_8566_urhan_paladinsafe_info;
	permanent = FALSE;
	description = "Почему вы сохранили жизнь паладинам?";
};


func int dia_orc_8566_urhan_paladinsafe_condition()
{
	if((MIS_ORсGREATWAR == LOG_Running) && (KNOWABOUTGAROND == TRUE) && (URSHAKTELLPALADIN == FALSE) && Npc_KnowsInfo(hero,dia_orc_8566_urhan_whoyou))
	{
		return TRUE;
	};
};

func void dia_orc_8566_urhan_paladinsafe_info()
{
	AI_Output(other,self,"DIA_Orc_8566_UrHan_PaladinSafe_01_01");	//Почему вы сохранили жизнь паладинам?
	AI_Output(self,other,"DIA_Orc_8566_UrHan_PaladinSafe_01_02");	//Человек задавать слишком много вопросов. Хаг-Тар начинать уже злиться!
	AI_Output(self,other,"DIA_Orc_8566_UrHan_PaladinSafe_01_04");	//(воинственно) Аргхх!
};


instance DIA_ORC_8566_URHAN_PALADINCOST(C_Info)
{
	npc = orc_8566_urhan;
	condition = dia_orc_8566_urhan_paladincost_condition;
	information = dia_orc_8566_urhan_paladincost_info;
	permanent = FALSE;
	description = "Что ты хочешь в обмен на пленных?";
};


func int dia_orc_8566_urhan_paladincost_condition()
{
	if((MIS_ORсGREATWAR == LOG_Running) && (KNOWABOUTGAROND == TRUE) && (MIS_STURMCASTLE == FALSE) && Npc_KnowsInfo(hero,dia_orc_8566_urhan_whoyou))
	{
		return TRUE;
	};
};

func void dia_orc_8566_urhan_paladincost_info()
{
	AI_Output(other,self,"DIA_Orc_8566_UrHan_PaladinCost_01_01");	//Что может заставить тебя отпустить пленных?
	AI_Output(self,other,"DIA_Orc_8566_UrHan_PaladinCost_01_04");	//Хаг-Тар не быть такой глупый, как думать человек.
	AI_Output(self,other,"DIA_Orc_8566_UrHan_PaladinCost_01_05");	//Он всегда только убивать люди или просто есть! Никогда не отпускать - всегда делать их мертвый.
	AI_Output(other,self,"DIA_Orc_8566_UrHan_PaladinCost_01_06");	//Тогда почему же вы не убили их сразу? Зачем они вам нужны?
	AI_Output(self,other,"DIA_Orc_8566_UrHan_PaladinCost_01_07");	//(задумчиво) Хаг-Тар думать так надо! Хаг-Тару так говорить об этом шаман, говорить духи.
	AI_Output(self,other,"DIA_Orc_8566_UrHan_PaladinCost_01_08");	//Сейчас убивать людей нельзя! Надо ждать.
	AI_Output(self,other,"DIA_Orc_8566_UrHan_PaladinCost_01_11");	//А что человек может предложить Хаг-Тар, чтобы он согласился освободить людей?
	if(MIS_NEWSSURVIVERS == LOG_Running)
	{
		B_LogEntry(TOPIC_NEWSSURVIVERS,"Думаю, будет непросто придумать способ освободить Гаронда и его людей. Генерал орков, который возглавляет отряд в крепости, оказался довольно крепким орешком.");
	};
	BOGNARTALK = TRUE;
	Info_ClearChoices(dia_orc_8566_urhan_paladincost);
	Info_AddChoice(dia_orc_8566_urhan_paladincost,"Я не знаю.",dia_orc_8566_urhan_paladincost_dontknow);
	Info_AddChoice(dia_orc_8566_urhan_paladincost,"Отпусти паладинов - и я сохраню тебе жизнь!",dia_orc_8566_urhan_paladincost_live);
	if(FreDragnIsDead == TRUE)
	{
		Info_AddChoice(dia_orc_8566_urhan_paladincost,"Как насчет золота, орк?",dia_orc_8566_urhan_paladincost_gold);
	};
	if((DGJMOVEPALADIN == FALSE) && (KILLGLOBALCOUNTDJG > 0))
	{
		Info_AddChoice(dia_orc_8566_urhan_paladincost,"А что тебе нужно?",dia_orc_8566_urhan_paladincost_quest);
	};
	if((URSHAKTELLSSECRET == TRUE) && (ORCLEADERISDEAD == FALSE))
	{
		Info_AddChoice(dia_orc_8566_urhan_paladincost,"Я слышал, что ты хочешь стать вождем.",dia_orc_8566_urhan_paladincost_leader);
	};
};

func void dia_orc_8566_urhan_paladincost_dontknow()
{
	AI_Output(other,self,"DIA_Orc_8566_UrHan_PaladinCost_DontKnow_01_01");	//Я не знаю.
	AI_Output(self,other,"DIA_Orc_8566_UrHan_PaladinCost_DontKnow_01_02");	//Тогда человек уходить! Хаг-Тар не будет больше говорить с ним.
	AI_Output(self,other,"DIA_Orc_8566_UrHan_PaladinCost_DontKnow_01_03");	//Если человек вновь сказать про это Хаг-Тар - орк гневаться и говорить своим воинам убивать человек!
	AI_Output(self,other,"DIA_Orc_8566_UrHan_PaladinCost_DontKnow_01_04");	//Теперь человек идти!
	if(MIS_NEWSSURVIVERS == LOG_Running)
	{
		B_LogEntry(TOPIC_NEWSSURVIVERS,"Боюсь, теперь я вряд ли смогу договориться с Хаг-Таром, чтобы он отпустил Гаронда и его людей.");
	};
	BOGNARREFUSETALK = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_orc_8566_urhan_paladincost_gold()
{
	AI_Output(other,self,"DIA_Orc_8566_UrHan_PaladinCost_Gold_01_01");	//Как насчет золота, орк?
	AI_Output(self,other,"DIA_Orc_8566_UrHan_PaladinCost_Gold_01_02");	//Хаг-Тар не интересовать золото! Золото быть для орков не больше, чем пыль.
	AI_Output(self,other,"DIA_Orc_8566_UrHan_PaladinCost_Gold_01_03");	//Орки уважать только сила, только великий воин!
	AI_Output(other,self,"DIA_Orc_8566_UrHan_PaladinCost_Gold_01_04");	//Так ты хочешь помериться со мной силами?!
	AI_Output(self,other,"DIA_Orc_8566_UrHan_PaladinCost_Gold_01_05");	//Что?! Человек хочет сразиться с Хаг-Тар?
	AI_Output(self,other,"DIA_Orc_8566_UrHan_PaladinCost_Gold_01_07");	//(смеется) Какой глупый человек! Хаг-Тар думать, что он хочет умирать - если говорить так.
	AI_Output(self,other,"DIA_Orc_8566_UrHan_PaladinCost_Gold_01_09");	//У человек нет ни один шанс победить меня! Хаг-Тар быть самый сильный воин орков.
	AI_Output(other,self,"DIA_Orc_8566_UrHan_PaladinCost_Gold_01_11");	//Тогда давай это проверим! Но при условии, что если я одержу победу - ты отпустишь всех паладинов.
	AI_Output(self,other,"DIA_Orc_8566_UrHan_PaladinCost_Gold_01_13");	//Отпустить паладин?! Хммм... Хаг-Тар надо подумать.
	AI_Output(other,self,"DIA_Orc_8566_UrHan_PaladinCost_Gold_01_14");	//Думай быстрее! Или ты просто боишься?!
	AI_Output(self,other,"DIA_Orc_8566_UrHan_PaladinCost_Gold_01_15");	//Что?! ХРОТОК ЯБАРТ!!! (гневно) Человек сомневаться в силе Хаг-Тар?!
	AI_Output(self,other,"DIA_Orc_8566_UrHan_PaladinCost_Gold_01_19");	//Человек идти туда, где быть большая гора! Туда, где раньше жить огненный дракон.
	AI_Output(self,other,"DIA_Orc_8566_UrHan_PaladinCost_Gold_01_20");	//Там я разорвать человек на куски...(воинственно) Аргххх!
	AI_Output(other,self,"DIA_Orc_8566_UrHan_PaladinCost_Gold_01_21");	//Хорошо! Тогда до встречи.
	MIS_CHALLANGEORC = LOG_Running;
	Log_CreateTopic(TOPIC_CHALLANGEORC,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CHALLANGEORC,LOG_Running);
	B_LogEntry(TOPIC_CHALLANGEORC,"Мне удалось убедить Хаг-Тара сразиться со мной в смертельном поединке. Если я смогу одержать над ним верх, то он обещал отпустить пленных паладинов.");
	AI_StopProcessInfos(self);
};

func void dia_orc_8566_urhan_paladincost_live()
{
	AI_Output(other,self,"DIA_Orc_8566_UrHan_PaladinCost_Live_01_01");	//Отпусти паладинов, немедленно!
	AI_Output(self,other,"DIA_Orc_8566_UrHan_PaladinCost_Live_01_02");	//Человек угрожать Хаг-Тар?! (гневно) Тогда он сейчас умереть, Улу-Мулу его не спасать. Аргххх!
	if(MIS_NEWSSURVIVERS == LOG_Running)
	{
		B_LogEntry(TOPIC_NEWSSURVIVERS,"Боюсь, теперь я вряд ли смогу договориться с Хаг-Таром, чтобы он отпустил Гаронда и его людей.");
	};
	URHANFUCKOFF = TRUE;
	BOGNARREFUSETALK = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_orc_8566_urhan_paladincost_quest()
{
	AI_Output(other,self,"DIA_Orc_8566_UrHan_PaladinCost_Quest_01_01");	//А что тебе нужно?
	AI_Output(self,other,"DIA_Orc_8566_UrHan_PaladinCost_Quest_01_02");	//Человек сам спрашивать об этом Хаг-Тар? Хммм...
	AI_Output(self,other,"DIA_Orc_8566_UrHan_PaladinCost_Quest_01_06");	//Хаг-Тар думать, что где-то здесь в долине должны быть люди.
	AI_Output(self,other,"DIA_Orc_8566_UrHan_PaladinCost_Quest_01_07");	//Полагать, что они приходить сюда сражаться с драконами. Значит, быть сильные воины!
	AI_Output(self,other,"DIA_Orc_8566_UrHan_PaladinCost_Quest_01_08");	//Орки уже долго их искать, но пока нигде не найти.
	AI_Output(other,self,"DIA_Orc_8566_UrHan_PaladinCost_Quest_01_09");	//К чему это ты ведешь?
	AI_Output(self,other,"DIA_Orc_8566_UrHan_PaladinCost_Quest_01_10");	//Человек должен идти сам их искать. А когда находить - то убивать эти люди! (кровожадно) ХРОТОК ЯБАРТ!!!
	AI_Output(self,other,"DIA_Orc_8566_UrHan_PaladinCost_Quest_01_11");	//Хаг-Тар хотеть делать их мертвыми! Их жизни в обмен на другие люди, что быть здесь.
	AI_Output(self,other,"DIA_Orc_8566_UrHan_PaladinCost_Quest_01_12");	//Человек согласен?!
	Info_ClearChoices(dia_orc_8566_urhan_paladincost);
	Info_AddChoice(dia_orc_8566_urhan_paladincost,"Хорошо! Я согласен.",dia_orc_8566_urhan_paladincost_questagreed);
	Info_AddChoice(dia_orc_8566_urhan_paladincost,"И ты полагаешь, что я соглашусь на такое?!",dia_orc_8566_urhan_paladincost_questnotagreed);
};

func void dia_orc_8566_urhan_paladincost_questagreed()
{
	var C_Npc outter;
	outter = Hlp_GetNpc(DJG_708_Kurgan);
	AI_Output(other,self,"DIA_Orc_8566_UrHan_PaladinCost_QuestAgreed_01_01");	//Хорошо! Я согласен.
	AI_Output(self,other,"DIA_Orc_8566_UrHan_PaladinCost_QuestAgreed_01_05");	//Тогда человек делать все то, что ему говорить Хаг-Тар.
	AI_Output(self,other,"DIA_Orc_8566_UrHan_PaladinCost_QuestAgreed_01_06");	//Теперь человек идти. Приходить, когда убивать все люди!
	MIS_KILLDRAGONHUNTER = LOG_Running;
	Log_CreateTopic(TOPIC_KILLDRAGONHUNTER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KILLDRAGONHUNTER,LOG_Running);
	B_LogEntry(TOPIC_KILLDRAGONHUNTER,"Военачальник орков Хаг-Тар предложил мне выполнить его поручение в обмен на жизнь пленных паладинов. Он хочет, чтобы я нашел в Долине Рудников отряд охотников на драконов и убил их всех. Как говорится - одни жизни в обмен на другие. Я согласился на эти условия! Да простит меня Иннос...");
	outter.aivar[93] = FALSE;
	INNOSCRIMECOUNT = INNOSCRIMECOUNT + 50;
	AI_StopProcessInfos(self);
};

func void dia_orc_8566_urhan_paladincost_questnotagreed()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Orc_8566_UrHan_PaladinCost_QuestNotAgreed_01_01");	//И ты полагаешь, что я соглашусь на такое?!
	AI_Output(self,other,"DIA_Orc_8566_UrHan_PaladinCost_QuestNotAgreed_01_04");	//Если так, то Хаг-Тар больше не о чем говорить с человек.
	AI_Output(self,other,"DIA_Orc_8566_UrHan_PaladinCost_QuestNotAgreed_01_05");	//Теперь он идти и не возвращаться! (гневно) Иначе Хаг-Тар гневаться и говорить своим воинам убивать человек.
	if(MIS_NEWSSURVIVERS == LOG_Running)
	{
		B_LogEntry(TOPIC_NEWSSURVIVERS,"Боюсь, теперь я вряд ли смогу договориться с Хаг-Таром, чтобы он отпустил Гаронда и его людей.");
	};
	AI_StopProcessInfos(self);
	BOGNARREFUSETALK = TRUE;
};

func void dia_orc_8566_urhan_paladincost_leader()
{
	AI_Output(other,self,"DIA_Orc_8566_UrHan_PaladinCost_Leader_01_01");	//Я слышал, что ты хочешь стать вождем...
	AI_Standup(self);
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(other,self,"DIA_Orc_8566_UrHan_PaladinCost_Leader_01_03");	//Возможно, тебе бы пригодилась моя помощь в этом деле.
	AI_Output(other,self,"DIA_Orc_8566_UrHan_PaladinCost_Leader_01_04");	//Ну, а ты в свою очередь отпустил бы плененных тобой паладинов на свободу.
	AI_Output(self,other,"DIA_Orc_8566_UrHan_PaladinCost_Leader_01_06");	//(внимательно разглядывая) Хаг-Тар пока не знать, ему надо подумать. Он не слишком доверять люди!
	AI_Output(self,other,"DIA_Orc_8566_UrHan_PaladinCost_Leader_01_07");	//К тому же Хаг-Тар не быть уверен, что у человек получиться это сделать.
	AI_Output(self,other,"DIA_Orc_8566_UrHan_PaladinCost_Leader_01_13");	//Хммм...(задумался) Хаг-Тар быть согласен!
	AI_Output(self,other,"DIA_Orc_8566_UrHan_PaladinCost_Leader_01_14");	//Если человек помочь Хаг-Тар стать вождем и убивать Ур-Тралл, то он освободить люди.
	AI_Output(self,other,"DIA_Orc_8566_UrHan_PaladinCost_Leader_01_15");	//Однако Хаг-Тар нужно доказательство смерть Ур-Тралл! Просто так он человек не поверить.
	AI_Output(other,self,"DIA_Orc_8566_UrHan_PaladinCost_Leader_01_16");	//Я посмотрю что можно сделать.
	AI_Output(self,other,"DIA_Orc_8566_UrHan_PaladinCost_Leader_01_17");	//Аргхх...(воинственно) Хаг-Тар желать человек удача!
	MIS_KILLURTRALL = LOG_Running;
	Log_CreateTopic(TOPIC_KILLURTRALL,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KILLURTRALL,LOG_Running);
	B_LogEntry(TOPIC_KILLURTRALL,"Я поинтересовался у Хаг-Тара насчет его желания стать вождем орков. Ур-Шак был прав - Хаг-Тар действительно не прочь занять это место! Немного подумав, Хаг-Тар согласился с мои предложением помочь ему в этом в обмен на жизни паладинов. Осталось отправиться в город орков и разобраться с этой проблемой.");
	Log_AddEntry(TOPIC_KILLURTRALL,"На словах мне Хаг-Тар вряд ли поверит. Мне стоит принести ему какое-нибудь доказательство смерти Ур-Тралла.");
	AI_StopProcessInfos(self);
};


instance DIA_ORC_8566_URHAN_BOGNARREFUSETALK(C_Info)
{
	npc = orc_8566_urhan;
	condition = dia_orc_8566_urhan_bognarrefusetalk_condition;
	information = dia_orc_8566_urhan_bognarrefusetalk_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_orc_8566_urhan_bognarrefusetalk_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (BOGNARREFUSETALK == TRUE))
	{
		return TRUE;
	};
};

func void dia_orc_8566_urhan_bognarrefusetalk_info()
{
	AI_Output(other,self,"DIA_Orc_8566_UrHan_BogNarRefuseTalk_01_01");	//Эй, ты!
	AI_Output(self,other,"DIA_Orc_8566_UrHan_BogNarRefuseTalk_01_02");	//Разве Хаг-Тар не предупреждать человек, чтобы он больше не говорить со мной?!
	AI_Output(self,other,"DIA_Orc_8566_UrHan_BogNarRefuseTalk_01_03");	//Человек не слушать Хаг-Тар, поэтому сейчас умирать...(гневно) Улу-Мулу его не спасать!
	URHANFUCKOFF = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_ORC_8566_URHAN_KILLDRGHUNTERS(C_Info)
{
	npc = orc_8566_urhan;
	condition = dia_orc_8566_urhan_killdrghunters_condition;
	information = dia_orc_8566_urhan_killdrghunters_info;
	permanent = FALSE;
	description = "Я убил тех людей.";
};


func int dia_orc_8566_urhan_killdrghunters_condition()
{
	if((MIS_KILLDRAGONHUNTER == LOG_Running) && (ALLDRGHUNTERSISDEAD == TRUE))
	{
		return TRUE;
	};
};

func void dia_orc_8566_urhan_killdrghunters_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Orc_8566_UrHan_KillDrgHunters_01_01");	//Я убил тех людей.
	AI_Output(self,other,"DIA_Orc_8566_UrHan_KillDrgHunters_01_02");	//Хорошо...(кровожадно) Хаг-Тар теперь быть доволен! Быть всегда рад, когда люди становиться мертвыми.
	AI_Output(other,self,"DIA_Orc_8566_UrHan_KillDrgHunters_01_03");	//Что теперь насчет паладинов? Ты их отпустишь?!
	AI_Output(self,other,"DIA_Orc_8566_UrHan_KillDrgHunters_01_04");	//(смеется) Думать, что человек очень глупый, если тогда поверить Хаг-Тар!
	AI_Output(self,other,"DIA_Orc_8566_UrHan_KillDrgHunters_01_05");	//Хаг-Тар обмануть человек! Он не освободить другие люди, как говорить.
	AI_Output(other,self,"DIA_Orc_8566_UrHan_KillDrgHunters_01_06");	//Но ты же обещал!
	AI_Output(self,other,"DIA_Orc_8566_UrHan_KillDrgHunters_01_07");	//Хаг-Тар больше не о чем говорить с человек... Он ненавидеть люди! Никогда не отпускать их живыми.
	AI_Output(self,other,"DIA_Orc_8566_UrHan_KillDrgHunters_01_08");	//Теперь человек идти и никогда не возвращаться...(гневно) Иначе Хаг-Тар гневаться и говорить своим воинам убивать человек.
	MIS_KILLDRAGONHUNTER = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_KILLDRAGONHUNTER,LOG_SUCCESS);
	B_LogEntry(TOPIC_KILLDRAGONHUNTER,"Хаг-Тар обманул меня! Он не освободит паладинов. Теперь единственное, что мне остается - это только взять крепость штурмом! ");
	if(MIS_NEWSSURVIVERS == LOG_Running)
	{
		B_LogEntry(TOPIC_NEWSSURVIVERS,"Боюсь, теперь я вряд ли смогу договориться с Хаг-Таром, чтобы он отпустил Гаронда и его людей.");
	};
	AI_StopProcessInfos(self);
	BOGNARREFUSETALK = TRUE;
};


instance DIA_ORC_8566_URHAN_CHALLANGE(C_Info)
{
	npc = orc_8566_urhan;
	condition = dia_orc_8566_urhan_challange_condition;
	information = dia_orc_8566_urhan_challange_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_orc_8566_urhan_challange_condition()
{
	if((MIS_CHALLANGEORC == LOG_Running) && (HAGTARISINSERTED == TRUE) && (URHANBEATEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_orc_8566_urhan_challange_info()
{
	Snd_Play("ORC_Angry");
	AI_Output(self,other,"DIA_Orc_8566_UrHan_Challange_01_01");	//Итак, человек быть здесь! Прийти сражаться с Хаг-Тар.
	AI_Output(self,other,"DIA_Orc_8566_UrHan_Challange_01_03");	//(воинственно) Начинать битва!
	AI_Output(self,other,"DIA_Orc_8566_UrHan_Challange_01_05");	//Аргхххх!!!!
	URHANSPEAKBEFOREBATTLE = TRUE;
	self.aivar[AIV_EnemyOverride] = FALSE;
	self.senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_ORC_8566_URHAN_CHALLANGEORCDONE(C_Info)
{
	npc = orc_8566_urhan;
	condition = dia_orc_8566_urhan_challangeorcdone_condition;
	information = dia_orc_8566_urhan_challangeorcdone_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_orc_8566_urhan_challangeorcdone_condition()
{
	if((MIS_CHALLANGEORC == LOG_Running) && (URHANBEATEN == TRUE))
	{
		return TRUE;
	};
};

func void dia_orc_8566_urhan_challangeorcdone_info()
{
	AI_Output(self,other,"DIA_Orc_8566_UrHan_ChallangeOrcDone_01_01");	//Стой, человек... Хорошо, ты победить Хаг-Тар! Больше не надо сражаться с ним.
	AI_Output(self,other,"DIA_Orc_8566_UrHan_ChallangeOrcDone_01_02");	//Теперь Хаг-Тар будет думать, что человек быть великий воин - очень сильный, очень смелый. Он уважать человек!
	AI_RemoveWeapon(other);
	AI_Output(other,self,"DIA_Orc_8566_UrHan_ChallangeOrcDone_01_03");	//Ладно, спасибо и на этом. А что насчет пленных паладинов? Ты их отпустишь?
	AI_Output(self,other,"DIA_Orc_8566_UrHan_ChallangeOrcDone_01_04");	//(недовольно) Хорошо! Хаг-Тар отпускать люди, как обещать. Они теперь быть свободны и уходить!
	AI_Output(self,other,"DIA_Orc_8566_UrHan_ChallangeOrcDone_01_08");	//Но человек должен обещать Хаг-Тар, что он не говорить никому про свою победу над Хаг-Тар!
	AI_Output(self,other,"DIA_Orc_8566_UrHan_ChallangeOrcDone_01_09");	//Говорить наоборот, что Хаг-Тар одолеть человек. Что Хаг-Тар быть самый великий воин!
	AI_Output(other,self,"DIA_Orc_8566_UrHan_ChallangeOrcDone_01_10");	//Почему?
	AI_Output(self,other,"DIA_Orc_8566_UrHan_ChallangeOrcDone_01_11");	//Если братья узнать, что Хаг-Тар проиграть битва - они перестать уважать его и смеяться над ним.
	AI_Output(self,other,"DIA_Orc_8566_UrHan_ChallangeOrcDone_01_12");	//Тогда Хаг-Тар больше не быть великий воин, как думать братья. Все говорить Хаг-Тар, что он слабый!
	AI_Output(self,other,"DIA_Orc_8566_UrHan_ChallangeOrcDone_01_14");	//Хаг-Тар думать, что если человек обещать ему это сделать, то он сможет дать человек одну очень ценная вещь.
	AI_Output(other,self,"DIA_Orc_8566_UrHan_ChallangeOrcDone_01_15");	//И что это за вещь?
	AI_Output(self,other,"DIA_Orc_8566_UrHan_ChallangeOrcDone_01_16");	//Хаг-Тар обещать быть полезной для человек! Делать его очень сильный, очень ловкий.
	AI_Output(self,other,"DIA_Orc_8566_UrHan_ChallangeOrcDone_01_17");	//Что человек отвечать Хаг-Тар?
	CANFREEPALADIN = TRUE;
	B_LogEntry(TOPIC_CHALLANGEORC,"Теперь Хаг-Тар отпустит пленных паладинов на свободу. Правда, он также попросил меня не говорить никому, что проиграл мне этот поединок, обещав дать за мое молчание одну очень ценную вещь.");
	if(MIS_NEWSSURVIVERS == LOG_Running)
	{
		B_LogEntry(TOPIC_NEWSSURVIVERS,"Паладины теперь свободны! Надо сообщить им об этом.");
	};
	Info_ClearChoices(dia_orc_8566_urhan_challangeorcdone);
	Info_AddChoice(dia_orc_8566_urhan_challangeorcdone,"Хорошо, я согласен.",dia_orc_8566_urhan_challangeorcdone_ok);
	Info_AddChoice(dia_orc_8566_urhan_challangeorcdone,"Мне это не интересно.",dia_orc_8566_urhan_challangeorcdone_no);
};

func void dia_orc_8566_urhan_challangeorcdone_ok()
{
	AI_EquipBestMeleeWeapon(self);
	AI_Output(other,self,"DIA_Orc_8566_UrHan_ChallangeOrcDone_Ok_01_01");	//Хорошо, я согласен.
	AI_Output(self,other,"DIA_Orc_8566_UrHan_ChallangeOrcDone_Ok_01_02");	//Вот, человек брать. Потом пить и становиться сильный и ловкий!
	B_GiveInvItems(self,other,itpo_xorcpotion,1);
	AI_Output(self,other,"DIA_Orc_8566_UrHan_ChallangeOrcDone_Ok_01_03");	//И помнить, что человек обещать Хаг-Тар...(грозно) Не говорить, что он проиграть человек! Говорить, что Хаг-Тар выиграть битва.
	if(MIS_RescueGorn != LOG_SUCCESS)
	{
		B_GiveInvItems(self,other,ItKe_PrisonKey_MIS,1);
	};
	MIS_CHALLANGEORC = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_CHALLANGEORC,LOG_SUCCESS);
	B_LogEntry(TOPIC_CHALLANGEORC,"Я согласился принять его условия.");
	self.aivar[AIV_EnemyOverride] = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_orc_8566_urhan_challangeorcdone_no()
{
	B_GivePlayerXP(300);
	AI_EquipBestMeleeWeapon(self);
	AI_Output(other,self,"DIA_Orc_8566_UrHan_ChallangeOrcDone_No_01_01");	//Мне это не интересно.
	AI_Output(self,other,"DIA_Orc_8566_UrHan_ChallangeOrcDone_No_01_02");	//(гневно) Аргххх! Человек делать плохо, что отказаться от предложения Хаг-Тар.
	AI_Output(self,other,"DIA_Orc_8566_UrHan_ChallangeOrcDone_No_01_03");	//Теперь Хаг-Тар должен будет убить человек, иначе он всем рассказать что Хаг-Тар проиграть ему битва.
	AI_Output(self,other,"DIA_Orc_8566_UrHan_ChallangeOrcDone_No_01_05");	//Убивать человек, разрывать на части...(воинственно) ХРОТОК ЯБАРТ!!!
	REFUSEURHAN = TRUE;
	MIS_CHALLANGEORC = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_CHALLANGEORC,LOG_SUCCESS);
	B_LogEntry(TOPIC_CHALLANGEORC,"Я отказался принять его условия, и Хаг-Тар решил убить меня. Что же, один раз я его уже одолел. Придется преподать ему еще один урок.");
	self.aivar[AIV_EnemyOverride] = FALSE;
	URHANFUCKOFF = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_ORC_8566_URHAN_KILLURTRALLDONE(C_Info)
{
	npc = orc_8566_urhan;
	nr = 1;
	condition = dia_orc_8566_urhan_killurtralldone_condition;
	information = dia_orc_8566_urhan_killurtralldone_info;
	permanent = FALSE;
	description = "Теперь ты сможешь стать вождем.";
};


func int dia_orc_8566_urhan_killurtralldone_condition()
{
	if((MIS_KILLURTRALL == LOG_Running) && (ORCLEADERISDEAD == TRUE) && (Npc_HasItems(hero,itmi_orcmaintotem) >= 1))
	{
		return TRUE;
	};
};

func void dia_orc_8566_urhan_killurtralldone_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Orc_8566_UrHan_KillUrTrallDone_01_01");	//Теперь ты сможешь стать вождем.
	AI_Output(self,other,"DIA_Orc_8566_UrHan_KillUrTrallDone_01_02");	//Хммм, что человек иметь в виду?! (удивленно) Неужели он смог победить верховный вождь Ур-Тралл?
	AI_Output(other,self,"DIA_Orc_8566_UrHan_KillUrTrallDone_01_03");	//Да, я сделал это! Вот, возьми эту вещицу в качестве доказательства моих слов.
	B_GiveInvItems(other,self,itmi_orcmaintotem,1);
	AI_Output(other,self,"DIA_Orc_8566_UrHan_KillUrTrallDone_01_04");	//Думаю, тебе она должна быть знакома.
	AI_Output(self,other,"DIA_Orc_8566_UrHan_KillUrTrallDone_01_05");	//ГАР ТАГАН САХ! (очень удивленно) Это же быть Тотем Силы - знак вождь орков! Хаг-Тар не верить своим глазам...
	AI_Output(self,other,"DIA_Orc_8566_UrHan_KillUrTrallDone_01_07");	//Аргххх! Хаг-Тар думать, что все это быть хорошо...(довольно) Он верить человек и его слово.
	AI_Output(self,other,"DIA_Orc_8566_UrHan_KillUrTrallDone_01_08");	//Теперь Хаг-Тар становиться вождь - все братья его уважать и слушать! Хаг-Тар быть очень довольный.
	AI_Output(other,self,"DIA_Orc_8566_UrHan_KillUrTrallDone_01_09");	//А что насчет нашего уговора? Ты отпустишь пленных паладинов?
	AI_Output(self,other,"DIA_Orc_8566_UrHan_KillUrTrallDone_01_10");	//(задумчиво) Хорошо! Хаг-Тар отпускать люди, как обещать. Они теперь быть свободны и могут уходить!
	if(MIS_RescueGorn != LOG_SUCCESS)
	{
		B_GiveInvItems(self,other,ItKe_PrisonKey_MIS,1);
	};
	CANFREEPALADIN = TRUE;
	MIS_KILLURTRALL = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_KILLURTRALL,LOG_SUCCESS);
	B_LogEntry(TOPIC_KILLURTRALL,"Я сообщил Хаг-Тару о смерти Ур-Тралла. Думаю, теперь он отпустит паладинов.");
	if(MIS_NEWSSURVIVERS == LOG_Running)
	{
		B_LogEntry(TOPIC_NEWSSURVIVERS,"Паладины теперь свободны! Надо сообщить им об этом.");
	};
	AI_StopProcessInfos(self);
};


instance DIA_ORC_8566_URHAN_KILLHAGTARDO(C_Info)
{
	npc = orc_8566_urhan;
	nr = 1;
	condition = dia_orc_8566_urhan_killhagtardo_condition;
	information = dia_orc_8566_urhan_killhagtardo_info;
	permanent = FALSE;
	description = "Вождь Ур-Тралл хочет твоей смерти!";
};


func int dia_orc_8566_urhan_killhagtardo_condition()
{
	if((MIS_KILLURTRALL == LOG_Running) && (ORCLEADERISDEAD == FALSE) && (Npc_HasItems(hero,itmi_orcmaintotem) >= 1) && (URNAZULGIVETASK == TRUE))
	{
		return TRUE;
	};
};

func void dia_orc_8566_urhan_killhagtardo_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Orc_8566_UrHan_KillHagTarDo_01_01");	//Вождь Ур-Тралл хочет твоей смерти!
	AI_Output(self,other,"DIA_Orc_8566_UrHan_KillHagTarDo_01_02");	//Что?! Хаг-Тар не понимать... О чем человек говорить?
	AI_Output(other,self,"DIA_Orc_8566_UrHan_KillHagTarDo_01_03");	//Я ему все рассказал! И он прислал меня поквитаться с тобой.
	AI_Output(self,other,"DIA_Orc_8566_UrHan_KillHagTarDo_01_04");	//ХАТАГ БАТ НАР! Так значит, человек предать меня?! Выдать моя тайна Ур-Тралл?
	AI_Output(self,other,"DIA_Orc_8566_UrHan_KillHagTarDo_01_06");	//Аргххх!!! (в бешенстве) Тогда человек дорого за это заплатит! Мои воины сейчас разорвать человека на части.
	AI_Output(other,self,"DIA_Orc_8566_UrHan_KillHagTarDo_01_07");	//Лучше не спеши! Вот, взгляни что у меня есть.
	AI_Output(self,other,"DIA_Orc_8566_UrHan_KillHagTarDo_01_08");	//Что это? (испуганно) Тотем Сила?!
	AI_Output(other,self,"DIA_Orc_8566_UrHan_KillHagTarDo_01_09");	//Да, это он! Талисман Ур-Тралла - знак его власти, как верховного вождя орков.
	AI_Output(other,self,"DIA_Orc_8566_UrHan_KillHagTarDo_01_10");	//Так что твои воины тебе больше не помогут. Тебе придется самому со мной драться!
	AI_Output(self,other,"DIA_Orc_8566_UrHan_KillHagTarDo_01_11");	//Аргххх!!! (свирепо) Человек все равно умирать! Хаг-тар убивать его прямо сейчас!
	B_LogEntry(TOPIC_KILLURTRALL,"Хаг-Тар был взбешен тем, что я его предал, и без раздумий накинулся на меня. Надеюсь, Ур-Тралл не обманул меня насчет талисмана, и остальные орки не ввяжутся в этот бой.");
	self.guild = GIL_WOLF;
	TELLHAGTARKILLYOU = TRUE;
	URHANFUCKOFF = TRUE;
	self.aivar[AIV_EnemyOverride] = FALSE;
	AI_StopProcessInfos(self);
};

