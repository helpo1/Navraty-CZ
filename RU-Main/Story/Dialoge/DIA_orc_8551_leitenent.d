
instance DIA_ORC_8551_LEITENENT_EXIT(C_Info)
{
	npc = orc_8551_leitenent;
	condition = dia_orc_8551_leitenent_exit_condition;
	information = dia_orc_8551_leitenent_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};


func int dia_orc_8551_leitenent_exit_condition()
{
	return TRUE;
};

func void dia_orc_8551_leitenent_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ORC_8551_LEITENENT_HELLO(C_Info)
{
	npc = orc_8551_leitenent;
	condition = dia_orc_8551_leitenent_hello_condition;
	information = dia_orc_8551_leitenent_hello_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_orc_8551_leitenent_hello_condition()
{
	return TRUE;
};

func void dia_orc_8551_leitenent_hello_info()
{
	Snd_Play("ORC_AMBIENT_SHORT01");
	AI_PlayAni(self,"T_FORGETIT");
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_Hello_Info_18_01");	//Стой, человек!
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_Hello_Info_18_02");	//Чужак знать, куда идти? Чужак не мочь идти дальше!
	AI_Output(other,self,"DIA_Orc_8551_Leitenent_Hello_Info_18_03");	//А что это за место, куда нельзя идти?
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_Hello_Info_18_04");	//Зал Вождей. Чертог Ур-Тралла - быть великий вождь Орды, быть великий воин.
	AI_Output(other,self,"DIA_Orc_8551_Leitenent_Hello_Info_18_05");	//Но мне надо срочно поговорить с Ур-Траллом. Это очень важно!
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_Hello_Info_18_06");	//Какое быть к нему дело у человек?
	MEETFARROK = TRUE;
	Info_ClearChoices(dia_orc_8551_leitenent_hello);
	Info_AddChoice(dia_orc_8551_leitenent_hello,"Я не знаю.",dia_orc_8551_leitenent_hello_dontknow);

	if(MIS_KILLURTRALL == LOG_Running)
	{
		Info_AddChoice(dia_orc_8551_leitenent_hello,"У меня послание от Хаг-Тара.",dia_orc_8551_leitenent_hello_hagtar);
	};
	if((MIS_ORCTEMPLE == LOG_Running) && (MIS_KILLURTRALL == FALSE))
	{
		Info_AddChoice(dia_orc_8551_leitenent_hello,"Это касается Храма Спящего в Долине Рудников.",dia_orc_8551_leitenent_hello_hram);
	};
};

func void dia_orc_8551_leitenent_hello_hram()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Orc_8551_Leitenent_Hello_Hram_18_01");	//Это касается Храма Спящего в Долине Рудников. Мне кажется, у вас возникли некоторые проблемы с ним.
	AI_Output(other,self,"DIA_Orc_8551_Leitenent_Hello_Hram_18_02");	//Ну как? Это достаточно веская причина, чтобы ты впустил меня?
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_Hello_Hram_18_20");	//Человек говорить о великий Храм Крушак?! (думает) Да, это может быть интересно Ур-Тралл.
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_Hello_Hram_18_21");	//Но человек все равно не мочь идти дальше! 
	AI_Output(other,self,"DIA_Orc_8551_Leitenent_Hello_Hram_18_22");	//Но почему?
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_Hello_Hram_18_23");	//Орки не доверять ему и не уважать, чтобы Фаррок мог пустить его к великий вождь!
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_Hello_Hram_18_24");	//А если человек все-таки пытаться войти в чертог - орки убивать его. Улу-Мулу не помочь!
	AI_Output(other,self,"DIA_Orc_8551_Leitenent_Hello_Hram_18_25");	//Может, все-таки пустишь меня?
	AI_PlayAni(self,"T_NO");
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_Hello_Hram_18_26");	//Нет!
	MIS_HeroOrcJoin = LOG_Running;
	Log_CreateTopic(TOPIC_HeroOrcJoin,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HeroOrcJoin,LOG_Running);
	B_LogEntry(TOPIC_HeroOrcJoin,"Я должен завоевать уважение и доверие орков, чтобы меня пустили к Ур-Траллу.");
	AI_StopProcessInfos(self);
};

func void dia_orc_8551_leitenent_hello_hagtar()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Orc_8551_Leitenent_Hello_HagTar_18_01");	//У меня послание от орка Хаг-Тара!
	AI_Output(other,self,"DIA_Orc_8551_Leitenent_Hello_Hram_18_02");	//Ну как? Это достаточно веская причина, чтобы ты впустил меня?
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_Hello_HagTar_18_03");	//Хммм...(думает) Я знать Хаг-Тар - быть большой воин, воевать с люди в долине.
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_Hello_Hram_18_04");	//Хорошо, человек может идти дальше. Но чужак быть очень осторожный!
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_Hello_Hram_18_05");	//Если Ур-Тралл гневаться - чужак умереть. Улу-Мулу не помочь!

	if(MIS_HeroOrcJoin == LOG_Running)
	{
		MIS_HeroOrcJoin = LOG_Success;
		Log_SetTopicStatus(TOPIC_HeroOrcJoin,LOG_SUCCESS);
	};

	self.aivar[AIV_EnemyOverride] = FALSE;
	PASSORKCHAMBER = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_orc_8551_leitenent_hello_dontknow()
{
	AI_Output(other,self,"DIA_Orc_8551_Leitenent_Hello_DontKnow_18_01");	//Я не знаю.
	AI_PlayAni(self,"T_NO");
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_Hello_DontKnow_18_02");	//(грозно) Тогда человек поворачивать назад!
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_Hello_DontKnow_18_03");	//Если пытаться войти в чертог - орки убивать человек. Улу-Мулу не помочь!
	AI_Output(other,self,"DIA_Orc_8551_Leitenent_Hello_DontKnow_18_04");	//Может, все-таки пустишь меня?
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_Hello_DontKnow_18_05");	//Нет!
	AI_StopProcessInfos(self);
};


instance DIA_ORC_8551_LEITENENT_HELLOTWO(C_Info)
{
	npc = orc_8551_leitenent;
	condition = dia_orc_8551_leitenent_hellotwo_condition;
	information = dia_orc_8551_leitenent_hellotwo_info;
	important = TRUE;
	permanent = TRUE;
};

func int dia_orc_8551_leitenent_hellotwo_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MEETFARROK == TRUE) && (PASSORKCHAMBER == FALSE) && ((MIS_HeroOrcJoin == FALSE) || (MIS_KILLURTRALL == LOG_Running)))
	{
		return TRUE;
	};
};

func void dia_orc_8551_leitenent_hellotwo_info()
{
	Snd_Play("ORC_AMBIENT_SHORT01");
	AI_PlayAni(self,"T_FORGETIT");
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_HelloTwo_Info_18_01");	//Стой, человек! (угрожающе) Что тебе опять тут быть нужно?
	AI_Output(other,self,"DIA_Orc_8551_Leitenent_HelloTwo_Info_18_02");	//Пропусти меня к Ур-Траллу!
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_Hello_Info_18_06");	//Какое быть к нему дело у человек?
	Info_ClearChoices(dia_orc_8551_leitenent_hellotwo);
	Info_AddChoice(dia_orc_8551_leitenent_hellotwo,"Я не знаю.",dia_orc_8551_leitenent_hellotwo_dontknow);

	if(MIS_KILLURTRALL == LOG_Running)
	{
		Info_AddChoice(dia_orc_8551_leitenent_hellotwo,"У меня послание от Хаг-Тара.",dia_orc_8551_leitenent_hellotwo_hagtar);
	};
	if((MIS_ORCTEMPLE == LOG_Running) && (MIS_KILLURTRALL == FALSE))
	{
		Info_AddChoice(dia_orc_8551_leitenent_hellotwo,"Это касается Храма Спящего в Долине Рудников.",dia_orc_8551_leitenent_hellotwo_hram);
	};
};

func void dia_orc_8551_leitenent_hellotwo_hram()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Orc_8551_Leitenent_HelloTwo_Hram_18_01");	//Это касается Храма Спящего в Долине Рудников. Мне кажется, у вас возникли некоторые проблемы с ним.
	AI_Output(other,self,"DIA_Orc_8551_Leitenent_HelloTwo_Hram_18_02");	//Ну как? Это достаточно веская причина, чтобы ты впустил меня?
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_HelloTwo_Hram_18_20");	//Человек говорить о великий Храм Крушак?! (думает) Да, это может быть интересно Ур-Тралл.
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_HelloTwo_Hram_18_21");	//Но человек все равно не мочь идти дальше! 
	AI_Output(other,self,"DIA_Orc_8551_Leitenent_HelloTwo_Hram_18_22");	//Но почему?
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_HelloTwo_Hram_18_23");	//Орки не доверять ему и не уважать, чтобы Фаррок мог пустить его к великий вождь!
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_HelloTwo_Hram_18_24");	//А если человек все-таки пытаться войти в чертог - орки убивать его. Улу-Мулу не помочь!
	AI_Output(other,self,"DIA_Orc_8551_Leitenent_HelloTwo_Hram_18_25");	//Может, все-таки пустишь меня?
	AI_PlayAni(self,"T_NO");
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_HelloTwo_Hram_18_26");	//Нет!
	MIS_HeroOrcJoin = LOG_Running;
	Log_CreateTopic(TOPIC_HeroOrcJoin,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HeroOrcJoin,LOG_Running);
	B_LogEntry(TOPIC_HeroOrcJoin,"Я должен завоевать уважение и доверие орков, чтобы меня пустили к Ур-Траллу!");
	AI_StopProcessInfos(self);
};

func void dia_orc_8551_leitenent_hellotwo_hagtar()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Orc_8551_Leitenent_HelloTwo_HagTar_18_01");	//У меня послание от орка Хаг-Тара!
	AI_Output(other,self,"DIA_Orc_8551_Leitenent_HelloTwo_HagTar_18_02");	//Ну как? Это достаточно веская причина, чтобы ты впустил меня?
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_HelloTwo_HagTar_18_03");	//Хммм...(думает) Я знать Хаг-Тар - быть великий воин, воевать с люди в долине.
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_HelloTwo_HagTar_18_04");	//Хорошо, человек может идти дальше. Но чужак быть очень осторожный!
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_HelloTwo_HagTar_18_05");	//Если Ур-Тралл гневаться - чужак умереть. Улу-Мулу не помочь!

	if(MIS_HeroOrcJoin == LOG_Running)
	{
		MIS_HeroOrcJoin = LOG_Success;
		Log_SetTopicStatus(TOPIC_HeroOrcJoin,LOG_SUCCESS);
	};

	self.aivar[AIV_EnemyOverride] = FALSE;
	PASSORKCHAMBER = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_orc_8551_leitenent_hellotwo_dontknow()
{
	AI_Output(other,self,"DIA_Orc_8551_Leitenent_HelloTwo_DontKnow_18_01");	//Я еще не знаю.
	AI_PlayAni(self,"T_NO");
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_HelloTwo_DontKnow_18_02");	//(грозно) Тогда человек поворачивать назад!
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_HelloTwo_DontKnow_18_03");	//Если он попытаться войти в чертог - орки убивать его. Улу-Мулу не помочь!
	AI_Output(other,self,"DIA_Orc_8551_Leitenent_HelloTwo_DontKnow_18_04");	//Может, все-таки пустишь меня?
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_HelloTwo_DontKnow_18_05");	//Нет!
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8551_Leitenent_Respect(C_Info)
{
	npc = orc_8551_leitenent;
	condition = DIA_Orc_8551_Leitenent_Respect_condition;
	information = DIA_Orc_8551_Leitenent_Respect_info;
	permanent = TRUE;
	description = "Насколько сильно уважение ко мне среди орков?";
};

func int DIA_Orc_8551_Leitenent_Respect_condition()
{
	if((MIS_HeroOrcJoin == LOG_Running) && (PASSORKCHAMBER == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8551_Leitenent_Respect_Info()
{
	var string concatText;

	AI_Output(other,self,"DIA_Orc_8551_Leitenent_Respect_01_00");	//Насколько сильно уважение ко мне среди орков?

	if(ORCRESPECT >= 80)
	{
		B_GivePlayerXP(2000);
		AI_Output(self,other,"DIA_Orc_8551_Leitenent_Respect_01_01");	//(почтительно) Фаррок думать, что человек заслужить огромное уважение среди моих братьев.
		MIS_HeroOrcJoin = LOG_Success;
		Log_SetTopicStatus(TOPIC_HeroOrcJoin,LOG_SUCCESS);
		B_LogEntry(TOPIC_HeroOrcJoin,"Я завоевал доверие и уважение орков. Теперь Фаррок должен пропустить меня к Ур-Траллу.");
	}
	else if(ORCRESPECT >= 70)
	{
		AI_Output(self,other,"DIA_Orc_8551_Leitenent_Respect_01_02");	//(одобрительно) Фаррок знать, что уже многие братья стали уважать человек.
		AI_Output(self,other,"DIA_Orc_8551_Leitenent_Respect_01_03");	//Но этого все еще недостаточно, чтобы Фаррок пустить его.
	}
	else if(ORCRESPECT >= 50)
	{
		AI_Output(self,other,"DIA_Orc_8551_Leitenent_Respect_01_04");	//(задумчиво) Человек надо делать больше, чтобы завоевать уважение моих братьев.
		AI_Output(self,other,"DIA_Orc_8551_Leitenent_Respect_01_05");	//Только тогда он сможет доказать, что достоин встретиться с Ур-Тралл!
	}
	else if(ORCRESPECT >= 25)
	{
		AI_Output(self,other,"DIA_Orc_8551_Leitenent_Respect_01_07");	//(с сожалением) Братья Фаррока пока не много видеть, за что они должны уважать человек.
		AI_Output(self,other,"DIA_Orc_8551_Leitenent_Respect_01_08");	//Поэтому тот должен больше проявлять себя!
	}
	else
	{
		AI_Output(self,other,"DIA_Orc_8551_Leitenent_Respect_01_10");	//(с пренебрежением) Фаррок считать, что пока его не быть вовсе! 
		AI_Output(self,other,"DIA_Orc_8551_Leitenent_Respect_01_11");	//Человек лучше идти помогать братам, чем спрашивать...
	};

	concatText = ConcatStrings("Ваше уважение среди орков - ",IntToString(ORCRESPECT));
	concatText = ConcatStrings(concatText,"/100");
	AI_Print(concatText);
};

instance DIA_Orc_8551_Leitenent_RespectDone(C_Info)
{
	npc = orc_8551_leitenent;
	condition = DIA_Orc_8551_Leitenent_RespectDone_condition;
	information = DIA_Orc_8551_Leitenent_RespectDone_info;
	permanent = FALSE;
	description = "Теперь ты меня пустишь к Ур-Траллу?";
};

func int DIA_Orc_8551_Leitenent_RespectDone_condition()
{
	if((MIS_HeroOrcJoin == LOG_Success) && (PASSORKCHAMBER == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8551_Leitenent_RespectDone_Info()
{
	AI_Output(other,self,"DIA_Orc_8551_Leitenent_RespectDone_18_01");	//Теперь ты пустишь меня к Ур-Траллу?
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_HelloTwo_HagTar_18_04");	//Хорошо, человек может идти дальше. Но чужак быть очень осторожный!
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_HelloTwo_HagTar_18_05");	//Если Ур-Тралл гневаться - чужак умереть. Улу-Мулу не помочь!

	if(MIS_HeroOrcJoin == LOG_Running)
	{
		MIS_HeroOrcJoin = LOG_Success;
		Log_SetTopicStatus(TOPIC_HeroOrcJoin,LOG_SUCCESS);
	};

	self.aivar[AIV_EnemyOverride] = FALSE;
	PASSORKCHAMBER = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8551_Leitenent_DeadHead(C_Info)
{
	npc = orc_8551_leitenent;
	condition = DIA_Orc_8551_Leitenent_DeadHead_condition;
	information = DIA_Orc_8551_Leitenent_DeadHead_info;
	permanent = FALSE;
	description = "А у тебя самого есть для меня работенка?";
};

func int DIA_Orc_8551_Leitenent_DeadHead_condition()
{
	if((MIS_HeroOrcJoin == LOG_Running) && (PASSORKCHAMBER == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8551_Leitenent_DeadHead_Info()
{
	AI_Output(other,self,"DIA_Orc_8551_Leitenent_DeadHead_01_01");	//А у тебя самого есть для меня работенка?
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_DeadHead_01_02");	//Человек хотеть заслужить уважение Фаррок? (оценивающе) Хорошо, он давать ему одно поручение.
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_DeadHead_01_03");	//Пусть тот принести ему трофей враг орков! Только так Фаррок будет уважать человек.
	AI_Output(other,self,"DIA_Orc_8551_Leitenent_DeadHead_01_04");	//И что это должно быть?
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_DeadHead_01_05");	//(задумчиво) Например, голова воина людей! Или его ухо...
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_DeadHead_01_06");	//Но только они должны быть свежий...(зловеще) Не надо приносить Фаррок просто гнилой кусок мяса!
	AI_Output(other,self,"DIA_Orc_8551_Leitenent_DeadHead_01_07");	//Не слишком ли ты кровожаден?
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_DeadHead_01_08");	//Человек может не делать, что просить Фаррок.
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_DeadHead_01_09");	//Он сам пусть решать... Хотеть ли он заслужить уважение Фаррок или нет!
	AI_Output(other,self,"DIA_Orc_8551_Leitenent_DeadHead_01_10");	//Я подумаю над этим.
	MIS_DeadHead = LOG_Running;
	Log_CreateTopic(TOPIC_DeadHead,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DeadHead,LOG_Running);
	B_LogEntry(TOPIC_DeadHead,"Фаррок хочет, чтобы я принес ему вражеский трофей. Желательно голову одного из воинов людей. М-да, запросы у этого орка не шуточные.");
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8551_Leitenent_DeadHeadDone(C_Info)
{
	npc = orc_8551_leitenent;
	condition = DIA_Orc_8551_Leitenent_DeadHeadDone_condition;
	information = DIA_Orc_8551_Leitenent_DeadHeadDone_info;
	permanent = FALSE;
	description = "Вот твой трофей.";
};

func int DIA_Orc_8551_Leitenent_DeadHeadDone_condition()
{
	if((MIS_DeadHead == LOG_Running) && (Npc_HasItems(other,ItMi_DeadManHead) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Orc_8551_Leitenent_DeadHeadDone_Info()
{
	AI_Output(other,self,"DIA_Orc_8551_Leitenent_DeadHeadDone_01_01");	//Вот твой трофей.
	B_GiveInvItems(other,self,ItMi_DeadManHead,1);
	Npc_RemoveInvItems(self,ItMi_DeadManHead,1);
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_DeadHeadDone_01_02");	//Хммм...(оценивающе) Хорошо! Быть свежий голова, человек видимо недавно рубить ее.
	AI_Output(other,self,"DIA_Orc_8551_Leitenent_DeadHeadDone_01_03");	//Это тебя устроит?
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_DeadHeadDone_01_04");	//Да... Фаррок теперь уважать человек! 
	AI_Output(self,other,"DIA_Orc_8551_Leitenent_DeadHeadDone_01_05");	//Видеть, что он не любить люди также, как Фаррок.
	ORCRESPECT = ORCRESPECT + 10;

	if(MIS_HeroOrcJoin == LOG_Running)
	{
		AI_Print("Уважение среди орков + 10");
	};

	MIS_DeadHead = LOG_Success;
	Log_SetTopicStatus(TOPIC_DeadHead,LOG_Success);
	B_LogEntry(TOPIC_DeadHead,"Я принес голову одного из дезертиров Фарроку. Кажется, его это вполне удовлетворило.");
	AI_StopProcessInfos(self);
};