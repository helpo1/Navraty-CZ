instance DIA_TPL_8104_TEMPLER_EXIT(C_Info)
{
	npc = TPL_8104_TEMPLER;
	nr = 999;
	condition = DIA_TPL_8104_TEMPLER_exit_condition;
	information = DIA_TPL_8104_TEMPLER_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_TPL_8104_TEMPLER_exit_condition()
{
	return TRUE;
};

func void DIA_TPL_8104_TEMPLER_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TPL_8104_TEMPLER_NOFOREVER(C_Info)
{
	npc = TPL_8104_TEMPLER;
	nr = 1;
	condition = DIA_TPL_8104_TEMPLER_noforever_condition;
	information = DIA_TPL_8104_TEMPLER_noforever_info;
	permanent = FALSE;
	description = "Ты возглавляешь этот отряд стражей?";
};

func int DIA_TPL_8104_TEMPLER_noforever_condition()
{
	return TRUE;
};

func void DIA_TPL_8104_TEMPLER_noforever_info()
{
	AI_Output(other,self,"DIA_TPL_8104_TEMPLER_NoForever_01_00");	//Как я понимаю, именно ты возглавляешь этот отряд стражей?
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_NoForever_01_01");	//Да, ты прав. 
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_NoForever_01_02");	//Гор На Тоф лично отдал мне приказ выдвинуться сюда, дабы защитить наших сборщиков от возможного нападения.
	AI_Output(other,self,"DIA_TPL_8104_TEMPLER_NoForever_01_03");	//А он не объяснил, с кем тебе предстоит столкнуться здесь?
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_NoForever_01_04");	//Нет, этого он не сказал. 
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_NoForever_01_05");	//Но это и не имеет особого значения. (спокойно) Я готов выполнить его приказ даже ценой своей собственной жизни!
	AI_Output(other,self,"DIA_TPL_8104_TEMPLER_NoForever_01_06");	//Ну, раз так, тогда я спокоен.
};

instance DIA_TPL_8104_TEMPLER_AboutMe(C_Info)
{
	npc = TPL_8104_TEMPLER;
	nr = 1;
	condition = DIA_TPL_8104_TEMPLER_AboutMe_condition;
	information = DIA_TPL_8104_TEMPLER_AboutMe_info;
	permanent = FALSE;
	description = "Как ты стал стражем?";
};

func int DIA_TPL_8104_TEMPLER_AboutMe_condition()
{
	if(Npc_KnowsInfo(other,DIA_TPL_8104_TEMPLER_noforever))
	{
		return TRUE;
	};
};

func void DIA_TPL_8104_TEMPLER_AboutMe_info()
{
	AI_Output(other,self,"DIA_TPL_8104_TEMPLER_AboutMe_01_00");	//Как ты стал стражем?
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_AboutMe_01_01");	//Очень просто. Когда наше Братство обосновалось здесь, в Хоринисе...
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_AboutMe_01_02");	//...ему потребовались люди, способные держать в руках оружие, чтобы охранять лагерь, новых послушников и самих Гуру. 
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_AboutMe_01_03");	//Я был одним из тех, кого Гор На Тоф выбрал в качестве новых кандидатов в стражи.
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_AboutMe_01_04");	//Позже он лично занялся моим обучением. И теперь я один из них!
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_AboutMe_01_05");	//А почему ты спрашиваешь?
	AI_Output(other,self,"DIA_TPL_8104_TEMPLER_AboutMe_01_06");	//Просто я не помню, чтобы встречал тебя в старом лагере Братства Спящего.
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_AboutMe_01_07");	//Естественно! Ты и не мог меня помнить...(посмеиваясь) В старом лагере я был обычным послушником, который помогал нашим Гуру обрабатывать болотную траву.
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_AboutMe_01_08");	//А вот тебя я запомнил хорошо. Ты ведь тот парень, что принес Кор Галому слюну ползунов. Не так ли?
	AI_Output(other,self,"DIA_TPL_8104_TEMPLER_AboutMe_01_09");	//Ну да, было дело.
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_AboutMe_01_10");	//Значит, я не ошибся...(посмеиваясь) У меня хорошая память на лица! Особенно если дело касалось нашего Братства.
};

instance DIA_TPL_8104_TEMPLER_WhatDo(C_Info)
{
	npc = TPL_8104_TEMPLER;
	nr = 1;
	condition = DIA_TPL_8104_TEMPLER_WhatDo_condition;
	information = DIA_TPL_8104_TEMPLER_WhatDo_info;
	permanent = FALSE;
	description = "Тут довольно скучно, не находишь?";
};

func int DIA_TPL_8104_TEMPLER_WhatDo_condition()
{
	if(Npc_KnowsInfo(other,DIA_TPL_8104_TEMPLER_noforever))
	{
		return TRUE;
	};
};

func void DIA_TPL_8104_TEMPLER_WhatDo_info()
{
	AI_Output(other,self,"DIA_TPL_8104_TEMPLER_WhatDo_01_00");	//Тут довольно скучно, не находишь?
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_WhatDo_01_01");	//Это так, приятель...(тоскливо) Здесь, в этой глуши, трудно себя чем-то занять.
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_WhatDo_01_02");	//Однако, полагаю, что нам не стоит терять бдительности за разного рода делами. 
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_WhatDo_01_03");	//Любое послабление будет стоить нам слишком дорого!
};

instance DIA_TPL_8104_TEMPLER_HowReady(C_Info)
{
	npc = TPL_8104_TEMPLER;
	nr = 1;
	condition = DIA_TPL_8104_TEMPLER_HowReady_condition;
	information = DIA_TPL_8104_TEMPLER_HowReady_info;
	permanent = FALSE;
	description = "Ты считаешь, что твои люди хорошо подготовлены?";
};

func int DIA_TPL_8104_TEMPLER_HowReady_condition()
{
	if(Npc_KnowsInfo(other,DIA_TPL_8104_TEMPLER_noforever))
	{
		return TRUE;
	};
};

func void DIA_TPL_8104_TEMPLER_HowReady_info()
{
	AI_Output(other,self,"DIA_TPL_8104_TEMPLER_HowReady_01_00");	//Ты считаешь, что твои люди хорошо подготовлены?
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_HowReady_01_01");	//Хммм...(надменно) Насколько мне известно, Гор На Тоф лично отбирал тех, кого отправить сюда.
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_HowReady_01_02");	//Полагаю, что ты не станешь сомневаться в компетентности нашего учителя.
	AI_Output(other,self,"DIA_TPL_8104_TEMPLER_HowReady_01_03");	//В этом нет никаких сомнений. Однако я знаю, с кем вам придется иметь дело в случае нападения. И просто хочу быть уверен, что твои люди к этому готовы.
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_HowReady_01_05");	//Они готовы...(спокойно) Возможно, им немного не хватает мастерства во владении оружием. Однако их боевой дух крепок, как никогда!
};


instance DIA_TPL_8104_TEMPLER_LetsTrain(C_Info)
{
	npc = TPL_8104_TEMPLER;
	nr = 1;
	condition = DIA_TPL_8104_TEMPLER_LetsTrain_condition;
	information = DIA_TPL_8104_TEMPLER_LetsTrain_info;
	permanent = FALSE;
	description = "А как насчет того, чтобы немного поупражняться с мечом?";
};

func int DIA_TPL_8104_TEMPLER_LetsTrain_condition()
{
	if(Npc_KnowsInfo(other,DIA_TPL_8104_TEMPLER_HowReady))
	{
		return TRUE;
	};
};

func void DIA_TPL_8104_TEMPLER_LetsTrain_info()
{
	AI_Output(other,self,"DIA_TPL_8104_TEMPLER_LetsTrain_01_00");	//А как насчет того, чтобы немного поупражняться с мечом?
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_LetsTrain_01_01");	//Что ты имеешь в виду?
	AI_Output(other,self,"DIA_TPL_8104_TEMPLER_LetsTrain_01_02");	//Полагаю, твоим бойцам не помешало бы немного попрактиковаться с оружием, пока у них есть на это время.
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_LetsTrain_01_03");	//Хммм...(задумчиво) Это действительно было бы неплохой идеей! Думаю, стоит спросить об этом у них самих.
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_LetsTrain_01_04");	//Однако остается вопрос - кто займется их обучением?
	AI_Output(other,self,"DIA_TPL_8104_TEMPLER_LetsTrain_01_05");	//Может быть, ты?
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_LetsTrain_01_06");	//Ну...(смущенно) Я довольно неплохо управляюсь с двуручем стражей, но быть самому наставником мне еще не доводилось.
	AI_Output(other,self,"DIA_TPL_8104_TEMPLER_LetsTrain_01_07");	//А какого о тебе мнения Гор На Тоф?
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_LetsTrain_01_08");	//Мой учитель? Насколько я знаю, он считает, что мне немного не хватает концентрации в бою. 
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_LetsTrain_01_09");	//Но лучше тебе самому поговорить с ним об этом.
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_LetsTrain_01_10");	//Возможно, если он даст свое согласие, то тогда я займусь обучением стражей здесь, в лагере сборщиков.
	Log_CreateTopic(TOPIC_TrainInCamp,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TrainInCamp,LOG_Running);
	B_LogEntry(TOPIC_TrainInCamp,"Я предложил Тираксу заняться обучением стражей в лагере сборщиков. Но для начала мне следует поговорить с его учителем Гор На Тофом, чтобы тот дал свое согласие.");
	MIS_TrainInCamp = LOG_Running;
};

instance DIA_TPL_8104_TEMPLER_LetsTrain_Done(C_Info)
{
	npc = TPL_8104_TEMPLER;
	nr = 1;
	condition = DIA_TPL_8104_TEMPLER_LetsTrain_Done_condition;
	information = DIA_TPL_8104_TEMPLER_LetsTrain_Done_info;
	permanent = FALSE;
	description = "Гор На Тоф дал тебе свое согласие.";
};

func int DIA_TPL_8104_TEMPLER_LetsTrain_Done_condition()
{
	if((GorNaTotAgreeTiraks == TRUE) && (MIS_TrainInCamp == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_TPL_8104_TEMPLER_LetsTrain_Done_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_TPL_8104_TEMPLER_LetsTrain_Done_01_00");	//Гор На Тоф дал тебе свое согласие, так что можешь начинать обучение стражей.
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_LetsTrain_Done_01_01");	//Хммм...(удивленно) Значит, он довольно высоко ценит мои навыки боя.
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_LetsTrain_Done_01_02");	//Ладно, тогда начнем с завтрашнего дня.
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_LetsTrain_Done_01_03");	//Вот, возьми этот свиток в качестве моей благодарности. 
	B_GiveInvItems(self,other,ITSC_TRFMEATBUG,1);
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_LetsTrain_Done_01_04");	//Мне, как воину, он ни к чему. А тебе возможно и пригодится!
	B_LogEntry(TOPIC_TrainInCamp,"Я передал Тираксу слова Гор На Тофа, и с завтрашнего дня он начнет тренировать стражей.");
	Log_CreateTopic(TOPIC_TrainInCamp,LOG_SUCCESS);
	MIS_TrainInCamp = LOG_SUCCESS;
	CampTrainingTimer = Wld_GetDay();
};


instance DIA_TPL_8104_TEMPLER_TrainDay(C_Info)
{
	npc = TPL_8104_TEMPLER;
	nr = 1;
	condition = DIA_TPL_8104_TEMPLER_TrainDay_condition;
	information = DIA_TPL_8104_TEMPLER_TrainDay_info;
	permanent = FALSE;
	description = "Как идет обучение?";
};

func int DIA_TPL_8104_TEMPLER_TrainDay_condition()
{
	var int Daynow;

	Daynow = Wld_GetDay();

	if((CampTrainingTimer < Daynow) && (MIS_TrainInCamp == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_TPL_8104_TEMPLER_TrainDay_info()
{
	AI_Output(other,self,"DIA_TPL_8104_TEMPLER_TrainDay_01_00");	//Как идет обучение?
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_TrainDay_01_01");	//Как видишь...(посмеиваясь) Попусту мы здесь время не теряем.
	AI_Output(other,self,"DIA_TPL_8104_TEMPLER_TrainDay_01_02");	//Понятно. А почему тренируются не все?
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_TrainDay_01_03");	//Ну, кто-то ведь должен в это время охранять наших сборщиков болотника.
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_TrainDay_01_04");	//Поэтому стражи тренируются по очереди в строго отведенное для этого время. А остальные наблюдают за лагерем.
};

instance DIA_TPL_8104_TEMPLER_Relax(C_Info)
{
	npc = TPL_8104_TEMPLER;
	nr = 1;
	condition = DIA_TPL_8104_TEMPLER_Relax_condition;
	information = DIA_TPL_8104_TEMPLER_Relax_info;
	permanent = FALSE;
	description = "Ты выглядишь немного усталым.";
};

func int DIA_TPL_8104_TEMPLER_Relax_condition()
{
	if((MIS_TrainInCamp == LOG_SUCCESS) && (Wld_IsTime(23,59,7,59)))
	{
		return TRUE;
	};
};

func void DIA_TPL_8104_TEMPLER_Relax_info()
{
	AI_Output(other,self,"DIA_TPL_8104_TEMPLER_Relax_01_00");	//Ты выглядишь немного усталым.
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_Relax_01_01");	//(угрюмо) Правда? Возможно, ты прав.
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_Relax_01_02");	//Просто вся эта неопределенность чертовски изматывает. Да и сами нервы уже на пределе.
	AI_Output(other,self,"DIA_TPL_8104_TEMPLER_Relax_01_03");	//Тебе просто необходимо немного расслабиться.
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_Relax_01_04");	//Эх, приятель... Так-то оно так. Только вот как это сделать?
	AI_Output(other,self,"DIA_TPL_8104_TEMPLER_Relax_01_05");	//А в чем проблема?
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_Relax_01_06");	//Понимаешь, если бы я сейчас находился в лагере Братства, то незамедлительно пошел бы к Таласу. 
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_Relax_01_07");	//Пара затяжек тех косяков, что он раздает послушникам, наверняка вернули бы меня к жизни.
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_Relax_01_08");	//Но где в этой глуши, скажи мне, ты возьмешь хотя бы даже один косяк болотной травы?
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_Relax_01_09");	//Так что пока, видимо, придется повременить с отдыхом.
	Log_CreateTopic(TOPIC_TiraksRelax,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TiraksRelax,LOG_Running);
	B_LogEntry(TOPIC_TiraksRelax,"Тираксу необходимо несколько косяков болотника, чтобы сбросить накопившееся напряжение.");
	MIS_TiraksRelax = LOG_Running;
};

instance DIA_TPL_8104_TEMPLER_Relax_Done(C_Info)
{
	npc = TPL_8104_TEMPLER;
	nr = 1;
	condition = DIA_TPL_8104_TEMPLER_Relax_Done_condition;
	information = DIA_TPL_8104_TEMPLER_Relax_Done_info;
	permanent = FALSE;
	description = "У меня тут кое-что для тебя есть.";
};

func int DIA_TPL_8104_TEMPLER_Relax_Done_condition()
{
	if((MIS_TiraksRelax == LOG_Running) && (Npc_HasItems(hero,ItMi_Joint) >= 1))
	{
		return TRUE;
	};
};

func void DIA_TPL_8104_TEMPLER_Relax_Done_info()
{
	AI_Output(other,self,"DIA_TPL_8104_TEMPLER_Relax_Done_01_00");	//У меня тут кое-что для тебя есть.
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_Relax_Done_01_01");	//О чем ты говоришь?
	AI_Output(other,self,"DIA_TPL_8104_TEMPLER_Relax_Done_01_02");	//Это поможет тебе немного расслабиться. Вот.

	if(Npc_HasItems(other,ItMi_Joint) >= 3)
	{
		B_GivePlayerXP(300);
		B_GiveInvItems(other,self,ItMi_Joint,3);
		B_LogEntry(TOPIC_TiraksRelax,"Тиракс был на седьмом небе от счастья, узнав, что я достал ему косяки из болотной травы.");
	}
	else if(Npc_HasItems(other,ItMi_Joint) >= 2)
	{
		B_GivePlayerXP(200);
		B_GiveInvItems(other,self,ItMi_Joint,2);
		B_LogEntry(TOPIC_TiraksRelax,"Тиракс был на седьмом небе от счастья, узнав, что я достал ему косяки из болотной травы.");
	}
	else
	{
		B_GivePlayerXP(100);
		B_GiveInvItems(other,self,ItMi_Joint,1);
		B_LogEntry(TOPIC_TiraksRelax,"Тиракс был на седьмом небе от счастья, узнав, что я достал ему косяк из болотной травы.");
	};

	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_Relax_Done_01_03");	//Я не верю своим глазам! Ты достал для меня болотник.
	AI_Output(other,self,"DIA_TPL_8104_TEMPLER_Relax_Done_01_04");	//Как видишь.
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_Relax_Done_01_05");	//Что же, ты меня по настоящему выручил, приятель. И я этого не забуду!
	CreateInvItems(self,ItMi_Joint,1);
	B_UseItem(self,ItMi_Joint);
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_Relax_Done_01_06");	//...Мммм
	Log_CreateTopic(TOPIC_TiraksRelax,LOG_SUCCESS);
	MIS_TiraksRelax = LOG_SUCCESS;
};

instance DIA_TPL_8104_TEMPLER_GetFurs(C_Info)
{
	npc = TPL_8104_TEMPLER;
	nr = 1;
	condition = DIA_TPL_8104_TEMPLER_GetFurs_condition;
	information = DIA_TPL_8104_TEMPLER_GetFurs_info;
	permanent = FALSE;
	description = "Могу я еще чем-то помочь вам?";
};

func int DIA_TPL_8104_TEMPLER_GetFurs_condition()
{
	if((MIS_BalamProviant == LOG_SUCCESS) && (kapitel < 6) && (!Npc_IsDead(BAU_982_Grimbald)))
	{
		return TRUE;
	};
};

func void DIA_TPL_8104_TEMPLER_GetFurs_info()
{
	AI_Output(other,self,"DIA_TPL_8104_TEMPLER_GetFurs_01_00");	//Могу я еще чем-то помочь вам?
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_GetFurs_01_01");	//Хммм...(задумчиво) Полагаю, что ты бы мог достать для нас пару-другую овечьих шкур.
	AI_Output(other,self,"DIA_TPL_8104_TEMPLER_GetFurs_01_02");	//Это еще зачем?
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_GetFurs_01_03");	//Ну, видишь ли, тут довольно холодно по ночам. А парням вообще приходится спать прямо на земле.
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_GetFurs_01_04");	//Парочка же теплых овечьих шкур немного скрасит их и без того скудный отдых.
	AI_Output(other,self,"DIA_TPL_8104_TEMPLER_GetFurs_01_05");	//Ладно, понимаю. Но где мне их тут взять? Поблизости же нет ни одной фермы.
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_GetFurs_01_06");	//Так-то да. Но насколько я знаю, тут рядом где-то промышляет один из охотников.
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_GetFurs_01_07");	//Мы видели его несколько дней назад, там, при подъеме на плато.
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_GetFurs_01_08");	//Так что, возможно, у него найдется все необходимое.
	Log_CreateTopic(TOPIC_TiraksFur,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TiraksFur,LOG_Running);
	B_LogEntry(TOPIC_TiraksFur,"Тиракс попросил меня достать для него несколько теплых овечьих шкур, чтобы парни в лагере не мерзли по ночам.");
	MIS_TiraksFur = LOG_Running;
};


instance DIA_TPL_8104_TEMPLER_GetFurs_Done(C_Info)
{
	npc = TPL_8104_TEMPLER;
	nr = 1;
	condition = DIA_TPL_8104_TEMPLER_GetFurs_Done_condition;
	information = DIA_TPL_8104_TEMPLER_GetFurs_Done_info;
	permanent = TRUE;
	description = "По поводу нужных тебе шкур...";
};

func int DIA_TPL_8104_TEMPLER_GetFurs_Done_condition()
{
	if(MIS_TiraksFur == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_TPL_8104_TEMPLER_GetFurs_Done_info()
{
	AI_Output(other,self,"DIA_TPL_8104_TEMPLER_GetFurs_Done_01_00");	//По поводу нужных тебе шкур...
	AI_Output(self,other,"DIA_TPL_8104_TEMPLER_GetFurs_Done_01_01");	//Да? Что скажешь? Неужели тебе удалось достать их для нас?

	if((Npc_HasItems(other,ItAt_ShadowFur) >= 2) && ((GrimbaldTellSellFur == TRUE) || (GrimbaldSellFur == TRUE) || (GrimbaldSellFurAll == TRUE)))
	{
		B_GivePlayerXP(500);
		AI_Output(other,self,"DIA_TPL_8104_TEMPLER_GetFurs_Done_01_02");	//Вот, тут пара шкур мракориса. Надеюсь, этого хватит?
		B_GiveInvItems(other,self,ItAt_ShadowFur,2);
		AI_Output(self,other,"DIA_TPL_8104_TEMPLER_GetFurs_Done_01_03");	//Хммм...(удивленно) По мне, так это просто отличные шкуры, да и к тому же превосходной выделки!
		AI_Output(self,other,"DIA_TPL_8104_TEMPLER_GetFurs_Done_01_04");	//Теперь моим парням точно не придется мерзнуть тут по ночам.
		AI_Output(self,other,"DIA_TPL_8104_TEMPLER_GetFurs_Done_01_05");	//Однако позволь мне узнать, откуда они у тебя? Ты что, охотился на этих тварей?!
		AI_Output(other,self,"DIA_TPL_8104_TEMPLER_GetFurs_Done_01_06");	//Я - нет, но тот охотник, которого вы видели недалеко от лагеря, промышляет этим в здешних краях. От него я их и получил.
		AI_Output(self,other,"DIA_TPL_8104_TEMPLER_GetFurs_Done_01_08");	//Понятно. И небось, тебе пришлось за них выложить огромную кучу золота?
		Info_ClearChoices(DIA_TPL_8104_TEMPLER_GetFurs_Done);

		if(GrimbaldTellSellFur == TRUE)
		{
			Info_AddChoice(DIA_TPL_8104_TEMPLER_GetFurs_Done,"Они достались мне даром.",DIA_TPL_8104_TEMPLER_GetFurs_Done_NoSale);
		};

		if(GrimbaldSellFur == TRUE)
		{
			Info_AddChoice(DIA_TPL_8104_TEMPLER_GetFurs_Done,"Мне пришлось заплатить за одну шкуру.",DIA_TPL_8104_TEMPLER_GetFurs_Done_HalfSale);
		};

		if(GrimbaldSellFurAll == TRUE)
		{
			Info_AddChoice(DIA_TPL_8104_TEMPLER_GetFurs_Done,"Ты прав! Они обошлись мне недешево.",DIA_TPL_8104_TEMPLER_GetFurs_Done_AllSale);
		};
	}
	else if(Npc_HasItems(other,ItAt_SheepFur) >= 2)
	{
		B_GivePlayerXP(250);
		AI_Output(other,self,"DIA_TPL_8104_TEMPLER_GetFurs_Done_01_09");	//Вот, тут пара овечьих шкур. Надеюсь, этого хватит?
		B_GiveInvItems(other,self,ItAt_SheepFur,2);
		AI_Output(self,other,"DIA_TPL_8104_TEMPLER_GetFurs_Done_01_10");	//Конечно, приятель...(довольно) Теперь моим парням не придется тут мерзнуть по ночам.
		AI_Output(self,other,"DIA_TPL_8104_TEMPLER_GetFurs_Done_01_11");	//Возьми это золото в качестве моей благодарности. Извини, но больше мне нечем тебя отблагодарить.
		AI_Output(other,self,"DIA_TPL_8104_TEMPLER_GetFurs_Done_01_12");	//Спасибо.
		B_GiveInvItems(self,other,ItMi_Gold,200);
		AI_Output(self,other,"DIA_TPL_8104_TEMPLER_GetFurs_Done_01_13");	//Тут намного больше, чем смог бы предложить тебе за них любой торговец. Уж будь уверен!
		B_LogEntry(TOPIC_TiraksFur,"Я достал овечьи шкуры для Тиракса.");
		Log_CreateTopic(TOPIC_TiraksFur,LOG_SUCCESS);
		MIS_TiraksFur = LOG_SUCCESS;
	}
	else
	{
		AI_Output(other,self,"DIA_TPL_8104_TEMPLER_GetFurs_Done_01_14");	//Пока нет.
		AI_Output(self,other,"DIA_TPL_8104_TEMPLER_GetFurs_Done_01_15");	//Ладно, нет так нет. Главное, что ты не забыл про мою просьбу.
	}; 
};


func void DIA_TPL_8104_TEMPLER_GetFurs_Done_NoSale()
{
		AI_Output(other,self,"DIA_TPL_8104_TEMPLER_GetFurs_Done_NoSale_01_00");	//Они достались мне даром.
		AI_Output(self,other,"DIA_TPL_8104_TEMPLER_GetFurs_Done_NoSale_01_01");	//Ну, раз так...(задумчиво) Тогда в качестве своей благодарности я дам тебе несколько редких магических эликсиров.
		AI_Output(other,self,"DIA_TPL_8104_TEMPLER_GetFurs_Done_NoSale_01_02");	//Это будет довольно щедро с твоей стороны.
		AI_Output(self,other,"DIA_TPL_8104_TEMPLER_GetFurs_Done_NoSale_01_03");	//Ну, ты помог нам, а это ценится куда дороже.
		AI_Output(self,other,"DIA_TPL_8104_TEMPLER_GetFurs_Done_NoSale_01_04");	//Вот, возьми эти магические напитки. Надеюсь, что они тебе пригодятся.
		B_GiveInvItemsManyThings(self,other);
		CreateInvItems(other,ItPo_Perm_Health,1);
		CreateInvItems(other,ItPo_Perm_Mana,1);
		AI_Output(other,self,"DIA_TPL_8104_TEMPLER_GetFurs_Done_NoSale_01_05");	//Спасибо.
		B_LogEntry(TOPIC_TiraksFur,"Я отдал Тираксу шкуры мракориса.");
		Log_CreateTopic(TOPIC_TiraksFur,LOG_SUCCESS);
		MIS_TiraksFur = LOG_SUCCESS;
		Info_ClearChoices(DIA_TPL_8104_TEMPLER_GetFurs_Done);
};


func void DIA_TPL_8104_TEMPLER_GetFurs_Done_HalfSale()
{
		AI_Output(other,self,"DIA_TPL_8104_TEMPLER_GetFurs_Done_HalfSale_01_00");	//Мне пришлось заплатить за одну шкуру.
		AI_Output(self,other,"DIA_TPL_8104_TEMPLER_GetFurs_Done_HalfSale_01_01");	//Ну, раз так...(задумчиво) Тогда я компенсирую твои затраты и дам еще вдобавок несколько магических эликсиров.
		AI_Output(other,self,"DIA_TPL_8104_TEMPLER_GetFurs_Done_HalfSale_01_02");	//Как щедро с твоей стороны!
		AI_Output(self,other,"DIA_TPL_8104_TEMPLER_GetFurs_Done_HalfSale_01_03");	//Ну, ты помог нам, а это ценится куда дороже. Сколько стоила эта шкура?
		AI_Output(other,self,"DIA_TPL_8104_TEMPLER_GetFurs_Done_HalfSale_01_04");	//Двести золотых.
		AI_Output(self,other,"DIA_TPL_8104_TEMPLER_GetFurs_Done_HalfSale_01_05");	//Хорошо. Вот - возьми свое золото и эти магические напитки.
		B_GiveInvItemsManyThings(self,other);
		CreateInvItems(other,ItMi_Gold,200);
		CreateInvItems(other,ItPo_Health_02,5);
		CreateInvItems(other,ItPo_Mana_02,5);
		AI_Output(self,other,"DIA_TPL_8104_TEMPLER_GetFurs_Done_HalfSale_01_06");	//Надеюсь, что этого тебе хватит в качестве нашей благодарности.
		AI_Output(other,self,"DIA_TPL_8104_TEMPLER_GetFurs_Done_HalfSale_01_07");	//Вполне.
		B_LogEntry(TOPIC_TiraksFur,"Я отдал Тираксу шкуры мракориса.");
		Log_CreateTopic(TOPIC_TiraksFur,LOG_SUCCESS);
		MIS_TiraksFur = LOG_SUCCESS;
		Info_ClearChoices(DIA_TPL_8104_TEMPLER_GetFurs_Done);
};

func void DIA_TPL_8104_TEMPLER_GetFurs_Done_AllSale()
{
		AI_Output(other,self,"DIA_TPL_8104_TEMPLER_GetFurs_Done_AllSale_01_00");	//Ты прав! Они обошлись мне недешево.
		AI_Output(self,other,"DIA_TPL_8104_TEMPLER_GetFurs_Done_AllSale_01_01");	//Ну, раз так...(задумчиво) Тогда я компенсирую твои затраты в двойном размере. Сколько стоит каждая шкура?
		AI_Output(other,self,"DIA_TPL_8104_TEMPLER_GetFurs_Done_AllSale_01_02");	//Двести золотых.
		AI_Output(self,other,"DIA_TPL_8104_TEMPLER_GetFurs_Done_AllSale_01_03");	//Хорошо. Вот - возьми свое золото. Полагаю, что ни один торговец в Хоринисе не предложит тебе подобную цену.
		B_GiveInvItems(self,other,ItMi_Gold,800);
		AI_Output(other,self,"DIA_TPL_8104_TEMPLER_GetFurs_Done_AllSale_01_04");	//Как щедро с твоей стороны!
		AI_Output(self,other,"DIA_TPL_8104_TEMPLER_GetFurs_Done_AllSale_01_05");	//Ну, ты помог нам, а это ценится куда дороже.
		B_LogEntry(TOPIC_TiraksFur,"Я отдал Тираксу шкуры мракориса. Он был очень доволен и отсыпал за них кучу золота.");
		Log_CreateTopic(TOPIC_TiraksFur,LOG_SUCCESS);
		MIS_TiraksFur = LOG_SUCCESS;
		Info_ClearChoices(DIA_TPL_8104_TEMPLER_GetFurs_Done);
};