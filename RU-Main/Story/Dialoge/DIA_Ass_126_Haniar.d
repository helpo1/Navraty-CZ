
instance DIA_Ass_126_Haniar_EXIT(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 999;
	condition = dia_Ass_126_Haniar_exit_condition;
	information = dia_Ass_126_Haniar_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_Ass_126_Haniar_exit_condition()
{
	return TRUE;
};

func void dia_Ass_126_Haniar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Ass_126_Haniar_PreHALLO(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 1;
	condition = dia_Ass_126_Haniar_PreHALLO_condition;
	information = dia_Ass_126_Haniar_PreHALLO_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_Ass_126_Haniar_PreHALLO_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (HaniarMurid == FALSE) && (HaniarMeet == TRUE))
	{
		return TRUE;
	};
};

func void dia_Ass_126_Haniar_PreHALLO_info()
{
	AI_Output(self,other,"DIA_Ass_126_Haniar_PreHALLO_01_00");	//Зачем ты меня беспокоишь?
};

instance DIA_Ass_126_Haniar_PreHALLO_Kill(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 1;
	condition = dia_Ass_126_Haniar_PreHALLO_Kill_condition;
	information = dia_Ass_126_Haniar_PreHALLO_Kill_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_Ass_126_Haniar_PreHALLO_Kill_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (HaniarMurid == FALSE) && (TiamantMurid == FALSE) && (PlayerIsAssNow == FALSE))
	{
		return TRUE;
	};
};

func void dia_Ass_126_Haniar_PreHALLO_Kill_info()
{
	PlayerIsPrioratFake = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};

instance DIA_Ass_126_Haniar_HALLO(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 1;
	condition = dia_Ass_126_Haniar_hallo_condition;
	information = dia_Ass_126_Haniar_hallo_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_Ass_126_Haniar_hallo_condition()
{
	if(TiamantMurid == TRUE)
	{
		return TRUE;
	};
};

func void dia_Ass_126_Haniar_hallo_info()
{
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_01_01");	//Постой, послушник. До меня дошли слухи, что мастер Тиамант сделал тебя своим мюридом. Это правда?
	AI_Output(other,self,"DIA_Ass_126_Haniar_HALLO_01_02");	//(молча кивает)
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_01_03");	//Что же, видимо, ты действительно произвел на него сильное впечатление, раз он удостоил тебя подобной чести.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_01_04");	//И, по правде говоря, я рад тому, что у нас наконец-то появился достойный претендент на звание Тени.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_01_05");	//Но не будем больше об этом. Это только его решение, и ничье больше.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_01_06");	//Давай лучше поговорим о тебе.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_01_07");	//Уверен, что сейчас ты задаешься одним и тем же вопросом - что же я от тебя хочу в данный момент? И почему заговорил с тобой.
	AI_Output(other,self,"DIA_Ass_126_Haniar_HALLO_01_08");	//(молча кивает)
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_01_09");	//Это и неудивительно! Ты обратил на себя внимание трех приоров Масиаф, а это не может пройти мимо меня бесследно.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_01_10");	//Поэтому я и заговорил с тобой, чтобы дать тебе шанс вновь проявить себя. 
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_01_11");	//Но на этот раз оценивать твои деяния буду я сам.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_01_12");	//Ну а теперь к делу. Готов ли ты принять мое испытание?
	Info_ClearChoices(DIA_Ass_126_Haniar_HALLO);
	Info_AddChoice(DIA_Ass_126_Haniar_HALLO,"(молча кивнуть)",DIA_Ass_126_Haniar_HALLO_M1);
	Info_AddChoice(DIA_Ass_126_Haniar_HALLO,"Я не уверен, что справлюсь.",DIA_Ass_126_Haniar_HALLO_M2);
	Info_AddChoice(DIA_Ass_126_Haniar_HALLO,"Нет, я не готов к этому.",DIA_Ass_126_Haniar_HALLO_M3);
	Info_AddChoice(DIA_Ass_126_Haniar_HALLO,"Конечно, я готов!",DIA_Ass_126_Haniar_HALLO_M4);
};

func void DIA_Ass_126_Haniar_HALLO_M2()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_HALLO_M2_01_01");	//Я не уверен, что справлюсь.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_M2_01_02");	//Ты разочаровал меня, послушник. Честно говоря, я ожидал от тебя большего.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_M2_01_03");	//Но раз так, то ты должен знать, что нашему Братству не нужны слабые духом.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_M2_01_04");	//Уверен, что ты и сам прекрасно понимаешь, что это для тебя означает.
	MIS_HasimKill = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_HasimKill,LOG_SUCCESS);
	B_LogEntry(TOPIC_HasimKill,"Ханиар остался не слишком доволен моими объяснениями. Теперь мне осталось только одно - сражаться за свою жизнь со всем Братством!");	
	PlayerIsPrioratFakeTemp = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};

func void DIA_Ass_126_Haniar_HALLO_M3()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_HALLO_M3_01_01");	//Нет, я не готов к этому.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_M3_01_02");	//Ну, раз так... как говорится, на нет и суда нет.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_M3_01_03");	//Его и не будет. Ты просто сейчас умрешь за свою дерзость!
	MIS_HasimKill = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_HasimKill,LOG_SUCCESS);
	B_LogEntry(TOPIC_HasimKill,"Ханиар остался не слишком доволен моими объяснениями. Теперь мне осталось только одно - сражаться за свою жизнь со всем Братством!");	
	PlayerIsPrioratFakeTemp = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};

func void DIA_Ass_126_Haniar_HALLO_M4()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_HALLO_M4_01_01");	//Конечно, я готов!
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_M4_01_02");	//Мне казалось, что ты должен знать наши правила.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_M4_01_03");	//И то, что за подобный ответ приору Масиаф полагается только одно - смерть.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_M4_01_04");	//Но, учитывая твои былые заслуги перед Братством, так уж и быть...
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_M4_01_05");	//...на первый раз я прощаю тебе подобную дерзость!
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_M4_01_06");	//Однако в будущем будь более осторожным в выборе своих слов.
};

func void DIA_Ass_126_Haniar_HALLO_M1()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_HALLO_M1_01_01");	//(молча кивает)
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_M1_01_02");	//Очень хорошо! Теперь слушай меня внимательно.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_M1_01_03");	//Совсем недавно был убит один из наших братьев. Его звали Хасим Клыколом. 
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_M1_01_04");	//Ты что-нибудь слышал об этом?
	Info_ClearChoices(DIA_Ass_126_Haniar_HALLO);
	Info_AddChoice(DIA_Ass_126_Haniar_HALLO,"Конечно. Ведь это я убил его.",DIA_Ass_126_Haniar_HALLO_M6);
	Info_AddChoice(DIA_Ass_126_Haniar_HALLO,"Я знаю о том, что он мертв.",DIA_Ass_126_Haniar_HALLO_Ok);
	Info_AddChoice(DIA_Ass_126_Haniar_HALLO,"Нет, ничего такого.",DIA_Ass_126_Haniar_HALLO_M5);
};

func void DIA_Ass_126_Haniar_HALLO_M5()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_HALLO_M5_01_01");	//Нет, ничего такого.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_M5_01_02");	//Убит один из самых уважаемых братьев, а тебе, выходит, и дела нет до этого?
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_M5_01_03");	//Это звучит крайне странно, ведь об этом знают абсолютно ВСЕ. Все, кроме тебя.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_M5_01_04");	//Следовательно, ты либо глухой слепец, либо попросту сейчас пытаешься меня обмануть или что-то скрыть.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_M5_01_05");	//А это, как ты сам понимаешь, может означать только одно - что тебе нельзя доверять.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_M5_01_06");	//Сейчас я покажу тебе, что мы обычно делаем со лгунами...
	MIS_HasimKill = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_HasimKill,LOG_SUCCESS);
	B_LogEntry(TOPIC_HasimKill,"Ханиар остался не слишком доволен моими объяснениями. Теперь мне осталось только одно - сражаться за свою жизнь со всем Братством!");	
	PlayerIsPrioratFakeTemp = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};

func void DIA_Ass_126_Haniar_HALLO_M6()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Ass_126_Haniar_HALLO_M6_01_01");	//Конечно. Ведь это я убил его.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_M6_01_02");	//Ты?! Ты убил элитную тень Масиафа? Знаешь, мне в это как-то трудно поверить.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_M6_01_03");	//Хасим был сильным воином и никогда не отличался особой глупостью и неосторожностью.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_M6_01_04");	//Но хорошо, допустим, я тебе поверил. Тогда ответь мне на вопрос: зачем тебе понадобилось его убивать?
	AI_Output(other,self,"DIA_Ass_126_Haniar_HALLO_M6_01_05");	//Я сделал это по приказу приора Тиаманта.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_M6_01_06");	//Тиаманта? Знаешь, все, что ты сейчас здесь сказал, крайне интересно.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_M6_01_07");	//Думаю, ты понимаешь, что, произнося такое вслух, ты очень сильно рискуешь своей головой.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_M6_01_08");	//Хотя, с другой стороны, ты не производишь впечатление безумца, готового с легкостью расстаться со своей жизнью.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_M6_01_09");	//Поэтому мне нужно время, чтобы разобраться со всем этим.
	AI_Output(other,self,"DIA_Ass_126_Haniar_HALLO_M6_01_12");	//(молча кивает)
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_M6_01_10");	//Ты же пока ступай и помолись Белиару, чтобы твои слова не оказались ложью!
	MIS_HasimKill = LOG_SUCCESS;
	HaniarKnowKiller = TRUE;
	Log_SetTopicStatus(TOPIC_HasimKill,LOG_SUCCESS);
	B_LogEntry(TOPIC_HasimKill,"Ханиар стал расспрашивать меня о судьбе Хасима, и я решил рассказать ему правду. Конечно, это может стоить мне головы, однако, если Ханиар все-таки удостоверится в правдивости моих слов, возможно, это больше сыграет мне на руку. Теперь, чтобы хоть как-то сгладить свою вину, мне следует помолиться Белиару за душу убитого мною Хасима. Уверен, и Гонсалесу будет интересно узнать, чем закончилась вся эта история.");	
	AI_StopProcessInfos(self);
};

func void DIA_Ass_126_Haniar_HALLO_Ok()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_HALLO_Ok_01_01");	//Я знаю о том, что он мертв.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_Ok_01_02");	//Само собой. И, как ты понимаешь, я не в восторге от этой новости.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_Ok_01_03");	//Но главное, что еще хуже, - я сам об этом абсолютно ничего не знаю. А такого быть не должно.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_Ok_01_04");	//Поэтому твоя первоочередная задача - выяснить, кто стоит за этим убийством. И как можно быстрее.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_Ok_01_05");	//Конечно, это будет нелегко, но я в тебя верю. Иначе ты бы не стал мюридом трех приоров.
	AI_Output(self,other,"DIA_Ass_126_Haniar_HALLO_Ok_01_06");	//Теперь ступай. И если что-нибудь узнаешь, то первым делом сообщи мне.
	B_LogEntry(TOPIC_HasimKill,"Ханиар стал расспрашивать меня о судьбе Хасима, однако я не стал раскрывать ему всю правду, опасаясь последствий. Теперь мне поручено найти убийцу, и это даже немного забавно - искать самого себя. Пожалуй, стоит посоветоваться об этом с Гонсалесом.");	
	HaniarSeekKiller = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_Ass_126_Haniar_Quest1(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 1;
	condition = DIA_Ass_126_Haniar_Quest1_condition;
	information = DIA_Ass_126_Haniar_Quest1_info;
	permanent = FALSE;
	description = "Насчет убийцы Хасима...";
};

func int DIA_Ass_126_Haniar_Quest1_condition()
{
	if((HaniarSeekKiller == TRUE) && (MIS_HasimKill != LOG_SUCCESS) && (HaniarKnowKiller == FALSE))
	{
		return TRUE;
	};
};
	
func void DIA_Ass_126_Haniar_Quest1_info()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_Quest1_01_01");	//Насчет убийцы Хасима...
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_01_02");	//Хорошо. Только говори быстро и по существу!

	Info_ClearChoices(DIA_Ass_126_Haniar_Quest1);
	Info_AddChoice(DIA_Ass_126_Haniar_Quest1,"Я ничего не смог узнать об этом.",DIA_Ass_126_Haniar_Quest1_M1);
	Info_AddChoice(DIA_Ass_126_Haniar_Quest1,"Это я убил Хасима.",DIA_Ass_126_Haniar_Quest1_M2);

	if(Npc_HasItems(other,ItWr_TiamantPaperToHaniar) >= 1)
	{
		Info_AddChoice(DIA_Ass_126_Haniar_Quest1,"У меня для вас письмо от приора Тиаманта, мастер.",DIA_Ass_126_Haniar_Quest1_Ok);
	};
};


func void DIA_Ass_126_Haniar_Quest1_Ok()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Ass_126_Haniar_Quest1_Ok_01_01");	//У меня для вас письмо от приора Тиаманта, мастер.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_Ok_01_02");	//Письмо? Дай мне взглянуть.
	B_GiveInvItems(other,self,ItWr_TiamantPaperToHaniar,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_Ok_01_03");	//А ты умеешь заводить себе влиятельных друзей, если сам Тиамант вступился за тебя.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_Ok_01_04");	//Ну хорошо, оставим пока в стороне убийство Хасима.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_Ok_01_05");	//Лучше ответь мне на один вопрос: почему ты сразу все мне не рассказал?
	Info_ClearChoices(DIA_Ass_126_Haniar_Quest1);
	Info_AddChoice(DIA_Ass_126_Haniar_Quest1,"Приор Тиамант попросил меня об этом.",DIA_Ass_126_Haniar_Quest1_M3);	
	Info_AddChoice(DIA_Ass_126_Haniar_Quest1,"В отличие от слов Тиаманта, мое слово мало что стоит.",DIA_Ass_126_Haniar_Quest1_M7);
	Info_AddChoice(DIA_Ass_126_Haniar_Quest1,"Я просто побоялся сказать правду.",DIA_Ass_126_Haniar_Quest1_M4);	
	Info_AddChoice(DIA_Ass_126_Haniar_Quest1,"Я немного растерялся. Но больше такое не повторится.",DIA_Ass_126_Haniar_Quest1_M5);	
	Info_AddChoice(DIA_Ass_126_Haniar_Quest1,"Я решил сначала разобраться в ситуации.",DIA_Ass_126_Haniar_Quest1_M6);
};


func void DIA_Ass_126_Haniar_Quest1_M1()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_Quest1_M1_01_01");	//Я ничего не смог узнать об этом, приор.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M1_01_02");	//Тогда позволь поинтересоваться, какого Белиара ты пришел ко мне?
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M1_01_03");	//Или, быть может, ты считаешь, что меня можно отвлекать по всяким пустякам?
	AI_Output(other,self,"DIA_Ass_126_Haniar_Quest1_M1_01_04");	//Но я...
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M1_01_04");	//Послушник, ты не смог выполнить элементарного поручения! И к тому же повел себя крайне дерзко.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M1_01_05");	//За это ты умрешь! Во имя Белиара!
	MIS_HasimKill = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_HasimKill,LOG_SUCCESS);
	B_LogEntry(TOPIC_HasimKill,"Ханиар остался не слишком доволен моими объяснениями. Теперь мне осталось только одно - сражаться за свою жизнь со всем Братством!");	
	PlayerIsPrioratFakeTemp = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};

func void DIA_Ass_126_Haniar_Quest1_M2()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_Quest1_M2_01_01");	//Это я убил Хасима.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M2_01_02");	//Ты? Ты убил элитную тень Масиафа? Знаешь, мне в это как-то трудно поверить.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M2_01_03");	//Хасим был сильным воином и никогда не отличался особой глупостью и неосторожностью.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M2_01_04");	//Но хорошо, допустим, я тебе поверил. Тогда ответь мне на вопрос: зачем тебе понадобилось его убивать?
	AI_Output(other,self,"DIA_Ass_126_Haniar_Quest1_M2_01_05");	//Я сделал это по приказу приора Тиаманта.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M2_01_06");	//Тиаманта? (задумчиво) И где доказательства того, что это был его приказ?

	if(Npc_HasItems(other,ItWr_TiamantPaperToHaniar) >= 1)
	{
		B_GivePlayerXP(500);
		AI_Output(other,self,"DIA_Ass_126_Haniar_Quest1_M2_01_07");	//У меня для вас письмо от приора Тиаманта, мастер.
		AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M2_01_08");	//Письмо? Дай мне взглянуть.
		B_GiveInvItems(other,self,ItWr_TiamantPaperToHaniar,1);
		B_UseFakeScroll();
		AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M2_01_09");	//А ты умеешь заводить себе влиятельных друзей, если сам Тиамант вступился за тебя.
		AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M2_01_10");	//Ну хорошо, оставим пока в стороне убийство Хасима.
		AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M2_01_11");	//Лучше ответь мне на один вопрос: почему ты сразу все мне не рассказал?
		Info_ClearChoices(DIA_Ass_126_Haniar_Quest1);
		Info_AddChoice(DIA_Ass_126_Haniar_Quest1,"Приор Тиамант попросил меня об этом.",DIA_Ass_126_Haniar_Quest1_M3);	
		Info_AddChoice(DIA_Ass_126_Haniar_Quest1,"В отличие от слов Тиаманта, мое слово мало что стоит.",DIA_Ass_126_Haniar_Quest1_M7);
		Info_AddChoice(DIA_Ass_126_Haniar_Quest1,"Я просто побоялся сказать правду.",DIA_Ass_126_Haniar_Quest1_M4);	
		Info_AddChoice(DIA_Ass_126_Haniar_Quest1,"Я немного растерялся. Но больше такое не повторится.",DIA_Ass_126_Haniar_Quest1_M5);	
		Info_AddChoice(DIA_Ass_126_Haniar_Quest1,"Я решил сначала разобраться в ситуации.",DIA_Ass_126_Haniar_Quest1_M6);
	}
	else
	{
		AI_Output(other,self,"DIA_Ass_126_Haniar_Quest1_M2_01_12");	//Сейчас у меня их нет, но если бы вы дали мне время...
		AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M2_01_13");	//Я сожалею, послушник. Но, кажется, твое время уже подошло к концу.
		AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M2_01_14");	//Никому не позволено без моего ведома и разрешения убивать кого-либо в нашем Братстве.
		AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M2_01_15");	//Это закон Масиафа. Поэтому тебе придется понести суровое наказание за свое неразумное деяние.
		AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M2_01_16");	//Во имя Белиара!
		MIS_HasimKill = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_HasimKill,LOG_SUCCESS);
		B_LogEntry(TOPIC_HasimKill,"Ханиар остался не слишком доволен моими объяснениями. Теперь мне осталось только одно - сражаться за свою жизнь со всем Братством!");	
		PlayerIsPrioratFakeTemp = TRUE;
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_KILL,1);
	};
};
	
func void DIA_Ass_126_Haniar_Quest1_M6()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_Quest1_M6_01_01");	//Я решил сначала разобраться в ситуации.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M6_01_02");	//Разобраться в ситуации? Поэтому ты решил, что лучший способ для этого это морочить мне голову?
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M6_01_03");	//Тогда позволь мне, в свою очередь, тоже разобраться в ситуации, но по-своему.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M6_01_04");	//Во имя Белиара!
	MIS_HasimKill = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_HasimKill,LOG_SUCCESS);
	B_LogEntry(TOPIC_HasimKill,"Ханиар остался не слишком доволен моими объяснениями. Теперь мне осталось только одно - сражаться за свою жизнь со всем Братством!");	
	PlayerIsPrioratFakeTemp = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};
	
func void DIA_Ass_126_Haniar_Quest1_M5()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_Quest1_M5_01_01");	//Я немного растерялся. Но больше такое не повторится.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M5_01_02");	//Интересно... Но мне всегда казалось, что уверенность - это то качество, которое и отличает воина Масиаф от простого наемного убийцы.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M5_01_03");	//Если ты в себе не уверен, то сможешь легко поступиться своими принципами и, главное, своей верой!
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M5_01_04");	//А таким людям не место в нашем Братстве. Уверен, что ты понимаешь, о чем я!
	AI_Output(other,self,"DIA_Ass_126_Haniar_Quest1_M5_01_05");	//Но мастер...
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M5_01_06");	//Ведь твоя секундная слабость, случившись раз, может повториться. И кто знает, какие еще беды она принесет.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M5_01_07");	//Так что лучше сейчас убить одного барана, чем потом потерять всю паству.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M5_01_08");	//Во имя Белиара!
	MIS_HasimKill = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_HasimKill,LOG_SUCCESS);
	B_LogEntry(TOPIC_HasimKill,"Ханиар остался не слишком доволен моими объяснениями. Теперь мне осталось только одно - сражаться за свою жизнь со всем Братством!");	
	PlayerIsPrioratFakeTemp = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};

func void DIA_Ass_126_Haniar_Quest1_M4()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_Quest1_M4_01_01");	//Я просто побоялся сказать правду.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M4_01_02");	//Выходит, что ты просто-напросто испугался!
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M4_01_03");	//Но ты должен был знать, что это непростительная вещь для любого из членов нашего Братства.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M4_01_04");	//Крепость духа и бесстрашие перед лицом опасности - вот то, что отличает воина Масиаф от простого наемного убийцы.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M4_01_05");	//Ну а слабым духом и трусам нет места среди нас. Так что не обижайся.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M4_01_06");	//Во имя Белиара!
	MIS_HasimKill = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_HasimKill,LOG_SUCCESS);
	B_LogEntry(TOPIC_HasimKill,"Ханиар остался не слишком доволен моими объяснениями. Теперь мне осталось только одно - сражаться за свою жизнь со всем Братством!");	
	PlayerIsPrioratFakeTemp = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};

func void DIA_Ass_126_Haniar_Quest1_M3()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_Quest1_M3_01_01");	//Приор Тиамант попросил меня об этом.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M3_01_02");	//(гневно) ЧТО?! Что за чушь ты несешь, послушник?
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M3_01_03");	//Тиамант никогда бы не попросил подобного у мюрида. Как и ни один из других приоров нашего Братства.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M3_01_04");	//Однако, мне кажется, что ты принял меня за полного идиота, если подумал, что я куплюсь на эту ложь. 
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M3_01_05");	//А такого я никому не прощаю! Во имя Белиара! Умри, ублюдок!
	MIS_HasimKill = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_HasimKill,LOG_SUCCESS);
	B_LogEntry(TOPIC_HasimKill,"Ханиар остался не слишком доволен моими объяснениями. Теперь мне осталось только одно - сражаться за свою жизнь со всем Братством!");	
	PlayerIsPrioratFakeTemp = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};

func void DIA_Ass_126_Haniar_Quest1_M7()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_Quest1_M7_01_01");	//Боюсь, в отличие от слов Тиаманта, мое слово мало что стоит.
	AI_Output(other,self,"DIA_Ass_126_Haniar_Quest1_M7_01_02");	//Да и расскажи я тебе все сразу, скорее всего, ты бы убил меня на месте.
	AI_Output(other,self,"DIA_Ass_126_Haniar_Quest1_M7_01_03");	//Хотя это и ваше право, мастер.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M7_01_04");	//(пристально вглядываясь) А ты вовсе не глуп, мюрид.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M7_01_05"); 	//Признаюсь честно: в любом бы другом случае я снес бы твою голову, не сходя с этого места.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M7_01_06");	//Даже несмотря на то, что тебе покровительствует сам Тиамант.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M7_01_07");	//Однако твоя убедительная речь пока что заставила меня повременить с этим.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M7_01_08");	//Возможно, ты действительно будешь мне полезен, но сейчас пока еще рано говорить об этом.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M7_01_09");	//На твоем же месте я бы сейчас лучше сходил и помолился Белиару за душу нашего брата Хасима.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M7_01_10");	//Это лучшее, что ты можешь сейчас сделать, дабы хоть как-то загладить свою вину.
	AI_Output(other,self,"DIA_Ass_126_Haniar_Quest1_M7_01_12");	//(молча кивает)
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Ass_126_Haniar_Quest1_M7_01_11");	//Тогда не стой истуканом! Ступай уже.
	MIS_HasimKill = LOG_SUCCESS;
	HaniarKnowKiller = TRUE;
	Log_SetTopicStatus(TOPIC_HasimKill,LOG_SUCCESS);
	B_LogEntry(TOPIC_HasimKill,"Это было непросто, но мне удалось избежать гнева Ханиара. Чтобы хоть как-то сгладить свою вину, мне следует помолиться Белиару за душу убитого мною Хасима. Уверен, и Гонсалесу будет интересно узнать, чем закончилась вся эта история.");	
	AI_StopProcessInfos(self);
};


instance DIA_Ass_126_Haniar_FollowMe(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 1;
	condition = dia_Ass_126_Haniar_FollowMe_condition;
	information = dia_Ass_126_Haniar_FollowMe_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_Ass_126_Haniar_FollowMe_condition()
{
	if((GonsalesFinishHasimStory == TRUE) && (PrayForHasim == TRUE))
	{
		return TRUE;
	};
};

func void dia_Ass_126_Haniar_FollowMe_info()
{
	AI_Output(self,other,"DIA_Ass_126_Haniar_FollowMe_01_01");	//Хорошо, что ты тут. Нам как раз необходимо кое-что обсудить. 
	AI_Output(self,other,"DIA_Ass_126_Haniar_FollowMe_01_02");	//Но не здесь. Следуй за мной, послушник.
	AI_Output(other,self,"DIA_Ass_126_Haniar_FollowMe_01_03");	//(молча кивает)
	AI_PlayAni(other,"T_YES");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"HideMeet");
};

instance DIA_Ass_126_Haniar_ANGEKOMMEN(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 55;
	condition = DIA_Ass_126_Haniar_ANGEKOMMEN_Condition;
	information = DIA_Ass_126_Haniar_ANGEKOMMEN_Info;
	important = TRUE;
};

func int DIA_Ass_126_Haniar_ANGEKOMMEN_Condition()
{
	if((GonsalesFinishHasimStory == TRUE) && (PrayForHasim == TRUE) && (Npc_GetDistToWP(self,"PW_HANIAR_HIDE") < 500))
	{
		return TRUE;
	};
};

func void DIA_Ass_126_Haniar_ANGEKOMMEN_Info()
{
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_01_00");	//Отлично. Здесь нам никто не помешает.
	AI_ReadyMeleeWeapon(self);
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_01_01");	//Теперь ответь мне на вопрос: ты боишься смерти, послушник?
	Info_ClearChoices(DIA_Ass_126_Haniar_ANGEKOMMEN);
	Info_AddChoice(DIA_Ass_126_Haniar_ANGEKOMMEN,"Нет.",DIA_Ass_126_Haniar_ANGEKOMMEN_No);	
	Info_AddChoice(DIA_Ass_126_Haniar_ANGEKOMMEN,"Да, боюсь.",DIA_Ass_126_Haniar_ANGEKOMMEN_Yes);
};

func void DIA_Ass_126_Haniar_ANGEKOMMEN_No()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_ANGEKOMMEN_No_01_01");	//Нет.
	AI_RemoveWeapon(self);
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_No_01_02");	//Хорошо. Это я от тебя и хотел услышать.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_No_01_03");	//Теперь же давай снова вернемся к убийству Хасима.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_No_01_04");	//Как ты уже знаешь, его смерть не слишком обрадовала меня.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_No_01_05");	//И дело даже не в том, что он был одним из наших братьев...
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_No_01_06");	//...ко всему прочему, Хасим был моим соглядатаем и доверенным лицом.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_No_01_07");	//Через него я был в курсе всех событий, происходящих в Братстве и среди Теней.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_No_01_08");	//К тому же он умел выудить любую нужную мне информацию, не вызывая при этом каких-либо подозрений.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_No_01_09");	//Что делало его крайне полезным человеком как для меня, так и для самого Братства Масиаф.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_No_01_10");	//Его же смерть стала серьезной потерей.
	AI_Output(other,self,"DIA_Ass_126_Haniar_ANGEKOMMEN_No_01_11");	//Я не знал об этом, мастер.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_No_01_12");	//Естественно ты не знал! Об этом никто не знал, кроме меня.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_No_01_13");	//Ты же стал просто слепым орудием в руках Белиара. Но это уже не важно.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_No_01_14");	//Меня сейчас беспокоит другой факт.
	AI_Output(other,self,"DIA_Ass_126_Haniar_ANGEKOMMEN_No_01_15");	//Какой?
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_No_01_16");	//(задумчиво) Последнее время Хасим занимался тем, что как раз копался в 'грязном белье' приора Тиаманта.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_No_01_17");	//И, мне думается, его смерть не была случайной. Он явно что-то нашел!
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_No_01_18");	//А вот что именно? Это я предлагаю выяснить тебе.
	AI_Output(other,self,"DIA_Ass_126_Haniar_ANGEKOMMEN_No_01_19");	//То есть ты предлагаешь мне работать на тебя?
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_No_01_20");	//Можно сказать и так. Ты смел, сообразителен и, главное, что у тебя есть подход к приору Тиаманту.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_No_01_21");	//Он тебе доверяет - в этом нет сомнений.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_No_01_22");	//Так что было бы глупо не воспользоваться этим. Ну, что скажешь?
	Info_ClearChoices(DIA_Ass_126_Haniar_ANGEKOMMEN);
	Info_AddChoice(DIA_Ass_126_Haniar_ANGEKOMMEN,"Меня это не интересует.",DIA_Ass_126_Haniar_ANGEKOMMEN_None);	
	Info_AddChoice(DIA_Ass_126_Haniar_ANGEKOMMEN,"А что я буду с этого иметь?",DIA_Ass_126_Haniar_ANGEKOMMEN_What);	
	Info_AddChoice(DIA_Ass_126_Haniar_ANGEKOMMEN,"Хорошо, я согласен.",DIA_Ass_126_Haniar_ANGEKOMMEN_Ok);
};

func void DIA_Ass_126_Haniar_ANGEKOMMEN_Yes()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_ANGEKOMMEN_Yes_01_01");	//Да, боюсь.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_Yes_01_02");	//Значит, я все-таки ошибся в тебе. Что же, это случается со всеми.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_Yes_01_03");	//Не бойся! Больно не будет.
	PlayerIsPrioratFake = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};

func void DIA_Ass_126_Haniar_ANGEKOMMEN_None()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_ANGEKOMMEN_None_01_01");	//Меня это не интересует.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_None_01_02");	//(мрачно)Что же, тогда ты не оставляешь мне выбора.
	PlayerIsPrioratFake = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};

func void DIA_Ass_126_Haniar_ANGEKOMMEN_What()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_ANGEKOMMEN_What_01_01");	//А что я буду с этого иметь?
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_What_01_02");	//Логичный вопрос. Я его ждал. Что же, отвечу на него довольно просто - немало!
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_What_01_03");	//Для начала ты во всем сможешь рассчитывать на мою поддержку. 
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_What_01_04");	//А это, как ты понимаешь, я предлагаю не всем подряд.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_What_01_05");	//Во-вторых, ты станешь моим мюридом и, естественно, получишь мое согласие на возведение тебя в ранг Тени.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_What_01_06");	//Ну а если же тебя интересует исключительно золото, то я всегда хорошо платил Хасиму за предоставленную информацию.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_What_01_07");	//Тебя я тоже не собираюсь обделять, ведь хорошая информация всегда дорого стоит.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_What_01_08");	//Ну так как, этого для тебя достаточно?
};

func void DIA_Ass_126_Haniar_ANGEKOMMEN_Ok()
{
	HaniarMurid = TRUE;
	MasiafShadowRitual = Wld_GetDay();
	AI_Output(other,self,"DIA_Ass_126_Haniar_ANGEKOMMEN_Ok_01_01");	//Хорошо, я согласен.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_Ok_01_02");	//(властно) Что же, тогда, согласно закону Масиафа, я нарекаю тебя своим мюридом!
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_Ok_01_03");	//Отныне ты мой избранник из числа послушников, а я - твой наставник.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_Ok_01_04");	//Ну а поскольку ты являешься мюридом и у остальных приоров Братства...
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_Ok_01_05");	//...то тебе уже не придется проходить испытания на вступление в ранг Тени.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_Ok_01_06");	//Однако сам ритуал посвящения мы проведем уже тогда, когда вернемся обратно в храм.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_Ok_01_07");	//Это будет завтра, а пока же можешь немного отдохнуть. 
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_Ok_01_08");	//Что же касается твоих новых обязанностей, вот - возьми это письмо.
	B_GiveInvItems(self,other,ItWr_HaniarOrder,1);
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_Ok_01_09");	//Почитай на досуге, и ты найдешь все необходимые инструкции для твоего следующего задания.
	AI_Output(self,other,"DIA_Ass_126_Haniar_ANGEKOMMEN_Ok_01_10");	//Все, ступай.
	B_LogEntry(TOPIC_MasiafStory,"Итак, теперь я мюрид самого Ханиара Слепца, а завтра он и его приоры возведут меня в ранг Тени. Я стану одним из полноправных членов Братства Масиаф. Думаю, что после этого стоит поговорить с Гонсалесом и обсудить с ним дальнейший план наших действий.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	Wld_InsertNpc(Ass_183_Adept,"PW_TEMPLE_KADUIN");
	Wld_InsertNpc(Ass_184_Adept,"PW_TEMPLE_HOAKIN");
};

instance DIA_Ass_126_Haniar_MasiafShadowRitual(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 1;
	condition = DIA_Ass_126_Haniar_MasiafShadowRitual_condition;
	information = DIA_Ass_126_Haniar_MasiafShadowRitual_info;
	permanent = TRUE;
	description = "Я готов стать Тенью Масиаф.";
};

func int DIA_Ass_126_Haniar_MasiafShadowRitual_condition()
{
	var int daynow;

	daynow = Wld_GetDay();

	if((HaniarMurid == TRUE) && (MasiafShadowRitual < daynow) && (PriorDipost == FALSE))
	{
		return TRUE;
	};
};
	
func void DIA_Ass_126_Haniar_MasiafShadowRitual_info()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_MasiafShadowRitual_01_01");	//Я готов стать Тенью Масиаф.

 	if(Wld_IsTime(10,0,20,0))
	{
		AI_Output(self,other,"DIA_Ass_126_Haniar_MasiafShadowRitual_01_02");	//(властно) Хорошо. Однако для начала надо дождаться всех приоров.
		AI_Output(self,other,"DIA_Ass_126_Haniar_MasiafShadowRitual_01_03");	//Я уже послал за приором Осаиром. Он скоро прибудет.
		AI_Output(self,other,"DIA_Ass_126_Haniar_MasiafShadowRitual_01_04");	//Когда все будут на месте, мы начнем твое посвящение. 
		AI_Output(other,self,"DIA_Ass_126_Haniar_MasiafShadowRitual_01_05");	//А что мне нужно будет делать?
		AI_Output(self,other,"DIA_Ass_126_Haniar_MasiafShadowRitual_01_06");	//Ничего! Просто, когда все соберутся, встань в круг власти Масиаф.
		AI_Output(self,other,"DIA_Ass_126_Haniar_MasiafShadowRitual_01_07");	//Если что, это то место, где сейчас стою я.
		PriorDipost = TRUE;
		Info_ClearChoices(DIA_Ass_126_Haniar_MasiafShadowRitual);
		Info_AddChoice(DIA_Ass_126_Haniar_MasiafShadowRitual,Dialog_Ende,DIA_Ass_126_Haniar_MasiafShadowRitual_Ok);	

	}
	else
	{
		AI_Output(self,other,"DIA_Ass_126_Haniar_MasiafShadowRitual_01_08");	//(раздраженно) Ты бы еще в полночь заявился! Видишь, уже почти ночь на дворе.
		AI_Output(self,other,"DIA_Ass_126_Haniar_MasiafShadowRitual_01_09");	//Так что отложим церемонию посвящения на завтра.
		AI_Output(other,self,"DIA_Ass_126_Haniar_MasiafShadowRitual_01_10");	//Когда?
		AI_Output(self,other,"DIA_Ass_126_Haniar_MasiafShadowRitual_01_11");	//Около полудня. Так что лучше займись пока чем-нибудь полезным.
		AI_StopProcessInfos(self);
	};
};

func void DIA_Ass_126_Haniar_MasiafShadowRitual_Ok()
{
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(Ass_138_Adept,"Ritual");
	Npc_ExchangeRoutine(Ass_139_Adept,"Ritual");
	Npc_ExchangeRoutine(Ass_140_Adept,"Ritual");
	Npc_ExchangeRoutine(Ass_141_Adept,"Ritual");
	Npc_ExchangeRoutine(Ass_125_Tiamant,"MasiafRitual");
	Npc_ExchangeRoutine(Ass_126_Haniar,"MasiafRitual");
	Npc_ExchangeRoutine(Ass_127_Osair,"MasiafRitual");
	Npc_ExchangeRoutine(Ass_128_Nrozas,"MasiafRitual");
	AI_Teleport(Ass_127_Osair,"PW_OUTSIDE_15");
	AI_GotoWP(Ass_126_Haniar,"PW_HANIAR_RITUAL");
};

instance DIA_Ass_126_Haniar_MasiafShadowRitual_Done(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 1;
	condition = DIA_Ass_126_Haniar_MasiafShadowRitual_Done_condition;
	information = DIA_Ass_126_Haniar_MasiafShadowRitual_Done_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Ass_126_Haniar_MasiafShadowRitual_Done_condition()
{
	if(ReadyForMasiafRitual == TRUE)
	{
		return TRUE;
	};
};
	
func void DIA_Ass_126_Haniar_MasiafShadowRitual_Done_info()
{
	Snd_Play("OPEN_PORTAL");
	Wld_SendTrigger("EVT_CAM_03");
	AI_ReadyMeleeWeapon(Ass_125_Tiamant);
	AI_ReadyMeleeWeapon(Ass_126_Haniar);
	AI_ReadyMeleeWeapon(Ass_127_Osair);
	AI_ReadyMeleeWeapon(Ass_128_Nrozas);
	Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
	AI_Wait(self,25);
	Snd_Play("LEVELUP");
	AI_Output(self,other,"DIA_Ass_126_Haniar_MasiafShadowRitual_Done_01_01");	//Братья! Сегодня мы собрались здесь, чтобы возвести этого послушника в ранг Тени!
	AI_Output(self,other,"DIA_Ass_126_Haniar_MasiafShadowRitual_Done_01_02");	//Сразу оговорюсь, что подобного случая посвящения я уже давно не припомню.
	AI_Output(self,other,"DIA_Ass_126_Haniar_MasiafShadowRitual_Done_01_03");	//А именно того, чтобы претендент был принят в ряды Братства без прохождения испытания.
	AI_Output(self,other,"DIA_Ass_126_Haniar_MasiafShadowRitual_Done_01_04");	//Но, учитывая тот факт, что он является мюридом каждого из присутствующих здесь приоров...
	AI_Output(self,other,"DIA_Ass_126_Haniar_MasiafShadowRitual_Done_01_05");	//...и единственным претендентом на вступление - то все это освобождает его от подобной необходимости.
	AI_Output(self,other,"DIA_Ass_126_Haniar_MasiafShadowRitual_Done_01_06");	//Поэтому властью, данной мне высшим советом приоров Масиафа, я нарекаю его именем Тени!
	AI_Output(self,other,"DIA_Ass_126_Haniar_MasiafShadowRitual_Done_01_07");	//Отныне твоя судьба неразрывно связана с этим Братством, его законами и порядками.
	AI_Output(self,other,"DIA_Ass_126_Haniar_MasiafShadowRitual_Done_01_08");	//Следуй им и чти их! И пусть будет крепка твоя вера и точен твой клинок, разя врагов во имя Белиара!
	AI_Output(self,other,"DIA_Ass_126_Haniar_MasiafShadowRitual_Done_01_09");	//А эти доспехи и клинок Теней носи как символ того, что теперь ты один из нас.
	CreateInvItems(hero,ItMw_1H_AssBlade_Hero,1);
	CreateInvItems(hero,ITAR_ASSASINS_04,1);
	AI_EquipArmor(hero,ITAR_ASSASINS_04);
	Npc_RemoveInvItems(other,ITAR_ASSASINS_03,1);
	AI_Output(self,other,"DIA_Ass_126_Haniar_MasiafShadowRitual_Done_01_10");	//...Лер Илах Ил Альу Та Масиаф Масули Белиар!...
	B_LogEntry(TOPIC_MasiafStory,"Приоры посвятили меня в статус Тени Масиаф. И это означает, что я теперь один из них. Надо сообщить эту новость Гонсалесу - уверен, это произведет на него впечатление.");
	PlayerIsAssNow = TRUE;
	Info_ClearChoices(DIA_Ass_126_Haniar_MasiafShadowRitual_Done);
	Info_AddChoice(DIA_Ass_126_Haniar_MasiafShadowRitual_Done,Dialog_Ende,DIA_Ass_126_Haniar_MasiafShadowRitual_Done_Ok);	
};

func void DIA_Ass_126_Haniar_MasiafShadowRitual_Done_Ok()
{
	AI_StopProcessInfos(self);
	AI_RemoveWeapon(Ass_125_Tiamant);
	AI_RemoveWeapon(Ass_126_Haniar);
	AI_RemoveWeapon(Ass_127_Osair);
	AI_RemoveWeapon(Ass_128_Nrozas);
	B_StartOtherRoutine(Ass_125_Tiamant,"Start");
	B_StartOtherRoutine(Ass_126_Haniar,"Start");
	B_StartOtherRoutine(Ass_127_Osair,"Start");
	B_StartOtherRoutine(Ass_128_Nrozas,"Start");
	B_StartOtherRoutine(Ass_138_Adept,"Start");
	B_StartOtherRoutine(Ass_139_Adept,"Start");
	B_StartOtherRoutine(Ass_140_Adept,"Start");
	B_StartOtherRoutine(Ass_141_Adept,"Start");
	AI_GotoWP(Ass_126_Haniar,"PW_HANIAR");
};

var int HaniarRefuseFirstTime;

instance DIA_Ass_126_Haniar_BlameTiamant(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 1;
	condition = DIA_Ass_126_Haniar_BlameTiamant_condition;
	information = DIA_Ass_126_Haniar_BlameTiamant_info;
	permanent = TRUE;
	description = "Насчет вашего поручения, мастер.";
};

func int DIA_Ass_126_Haniar_BlameTiamant_condition()
{
	if((MIS_Intriges == LOG_Running) && (HaniarBlameTiamant == FALSE) && ((KnowOsairToTiamant == TRUE) || (KnowNrozasToTiamant == TRUE) || (KnowWhyHasimDead == TRUE)))
	{
		return TRUE;
	};
};
	
func void DIA_Ass_126_Haniar_BlameTiamant_info()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_01_01");	//Насчет вашего поручения, мастер.

	if(Wld_IsTime(9,0,10,0) || Wld_IsTime(21,0,22,0))
	{
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_01_02");	//Хорошо. Я тебя слушаю.
		Info_ClearChoices(DIA_Ass_126_Haniar_BlameTiamant);
		Info_AddChoice(DIA_Ass_126_Haniar_BlameTiamant,"Пока мне нечего вам сообщить.",DIA_Ass_126_Haniar_BlameTiamant_None);

		if((HaniarKnowOsair == FALSE) && (KnowOsairToTiamant == TRUE))
		{
			Info_AddChoice(DIA_Ass_126_Haniar_BlameTiamant,"Мне стало известно кое-что о приоре Осаире.",DIA_Ass_126_Haniar_BlameTiamant_Osair);	
		};
		if((HaniarKnowNrozas == FALSE) && (KnowNrozasToTiamant == TRUE))
		{
			Info_AddChoice(DIA_Ass_126_Haniar_BlameTiamant,"У меня есть информация о приоре Нрозасе.",DIA_Ass_126_Haniar_BlameTiamant_Nrozas);	
		};
		if((HaniarKnowHasim == FALSE) && (KnowWhyHasimDead == TRUE) && (Npc_HasItems(other,ItWr_Luka) >= 1))
		{
			Info_AddChoice(DIA_Ass_126_Haniar_BlameTiamant,"Я знаю, почему убили Хасима.",DIA_Ass_126_Haniar_BlameTiamant_Hasim);
		};
	}
	else
	{
		if(HaniarRefuseFirstTime == FALSE)
		{
			AI_PlayAni(self,"T_SEARCH");
			AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_01_03");	//(раздраженно) Мне кажется, что ты нашел не самое подходящее место для подобного рода разговоров.
			AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_01_04");	//Так что обсудим это в другой раз, когда нас никто не услышит.
			B_LogEntry(TOPIC_Intriges,"Ханиар не стал меня слушать. Мне надо дождаться момента, когда рядом с ним никого не будет. Кажется, Ханиар иногда выходит из храма подышать свежим воздухом.");
			HaniarRefuseFirstTime = TRUE;
			AI_StopProcessInfos(self);
		}
		else
		{
			AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_01_05");	//Что тебе было непонятно из того, что я сказал?
			AI_StopProcessInfos(self);
		};
	};
};

func void DIA_Ass_126_Haniar_BlameTiamant_None()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_None_01_01");	//Пока мне нечего вам сообщить.
	AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_None_01_02");	//(гневно) Тогда зачем ты попросту тратишь мое время?
	AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_None_01_03");	//Прошу простить меня, мастер. Я уже ухожу.
	AI_StopProcessInfos(self);
};

func void DIA_Ass_126_Haniar_BlameTiamant_Osair()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_Osair_01_01");	//Мне стало известно кое-что о приоре Осаире.
	AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Osair_01_02");	//Что именно?
	AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_Osair_01_03");	//В последние дни он очень зол на приора Тиаманта за то, что тот не смог обеспечить безопасность рудной шахты.
	AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_Osair_01_04");	//А теперь вновь просит у Осаира новых рабов, чтобы возобновить там работы.
	AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Osair_01_05");	//А разве на шахту кто-то нападал?
	AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_Osair_01_06");	//Все рабы и охранник шахты были сожраны ползунами.
	AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Osair_01_07");	//Ах вот оно как. Мне об этом ничего не известно.
	AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Osair_01_08");	//Выходит, что Тиамант скрыл от меня этот факт. Не очень умно с его стороны.
	HaniarKnowOsair = TRUE;

	if((HaniarKnowOsair == TRUE) && (HaniarKnowNrozas == TRUE) && (HaniarKnowHasim == TRUE))
	{
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Osair_01_09");	//Ладно, разберемся с этим потом. Еще есть новости?
		AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_Osair_01_10");	//Это все, мастер.
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Osair_01_11");	//Ну что же, хорошая работа. Значит, не зря я тебе доверился.
		AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_Osair_01_12");	//И что будет теперь?
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Osair_01_13");	//(мрачно) Ничего хорошего. По крайней мере, для Тиаманта.
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Osair_01_14");	//Судя по тому, что ты мне рассказал, - и половины хватит для того, чтобы, по законам Масиафа, он был приговорен к смерти!
		AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_Osair_01_15");	//Значит, мне нужно будет его убить?
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Osair_01_16");	//Нет конечно. Во-первых, по законам Масиаф, ты на это просто не имеешь права.
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Osair_01_17");	//Бросить вызов может только ему равный.
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Osair_01_18");	//А во-вторых, у тебя пока что не хватит силенок, чтобы совладать с лучшим бойцом Масиафа!
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Osair_01_19");	//Или ты думаешь, что он просто так занимается подготовкой Теней Братства?
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Osair_01_20");	//Нет. Тут твоя помощь мне не потребуется.
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Osair_01_21");	//Я все сделаю сам. Ты сможешь только понаблюдать за сражением.
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Osair_01_22");	//А сейчас пока что ты свободен. Можешь немного отдохнуть.
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Osair_01_23");	//И вот, возьми это золото. Я не обманывал тебя, когда говорил, что хорошо плачу своим людям.
		B_GiveInvItems(self,other,ItMi_HaniarPurse,1);
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Osair_01_24");	//Теперь все, ступай.
		HaniarBlameTiamant = TRUE;
		MIS_Intriges = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_Intriges,LOG_SUCCESS);
		B_LogEntry(TOPIC_Intriges,"Я сообщил Ханиару обо всем, что смог узнать о приоре Тиаманте. Похоже, Тиаманту в скором времени придется ответить за все свои промахи. Такой поворот событий мне только на руку.");
		AI_StopProcessInfos(self);
		Wld_InsertNpc(SEK_186_SLAVEOBSSEK,"PW_GROT_GOLDORE_SLAVE_01");
		Wld_InsertNpc(SEK_387_SLAVEOBSSEK,"PW_GROT_GOLDORE_SLAVE_02");

		if(HoakinIsDead == FALSE)
		{
			Npc_ExchangeRoutine(Ass_184_Adept,"Osair");
			AI_Teleport(Ass_184_Adept,"PW_TEMPLE_HOAKIN");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Osair_01_25");	//Ладно, разберемся с этим потом. Еще есть новости?
	};
};


func void DIA_Ass_126_Haniar_BlameTiamant_Nrozas()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_01");	//У меня есть информация о приоре Нрозасе.
	AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_02");	//Что с ним?
	AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_03");	//Похоже, Нрозас и Тиамант не очень-то ладят между собой.
	AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_04");	//Особенно после того случая, когда Тиамант отказал Нрозасу в одной просьбе.
	AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_05");	//Интересно. А в чем суть дела?
	AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_06");	//Нрозасу понадобился редкий яд из клыка муритана. У Тиаманта был один такой, но он не стал с ним делиться.
	AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_07");	//Теперь Нрозас только и ждет случая вернуть ему должок.
	AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_08");	//Что же, Тиамант, по всей видимости, недалекий человек, если решил поссориться с мастером ядов.
	AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_09");	//Чего уж скрывать, даже я подчас иду Нрозасу навстречу, не имея при этом особого желания.
	AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_10");	//Поскольку именно таких людей, как Нрозас, и стоит опасаться больше всего.
	HaniarKnowNrozas = TRUE;

	if((HaniarKnowOsair == TRUE) && (HaniarKnowNrozas == TRUE) && (HaniarKnowHasim == TRUE))
	{
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_11");	//Но хватит об этом. У тебя еще есть что-нибудь для меня?
		AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_12");	//Это все, мастер.
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_13");	//Ну что же, хорошая работа. Значит, не зря я тебе доверился.
		AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_14");	//И что будет теперь?
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_15");	//(мрачно) Ничего хорошего. По крайней мере, для Тиаманта.
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_16");	//Судя по тому, что ты мне рассказал, - и половины хватит для того, чтобы, по законам Масиафа, он был приговорен к смерти!
		AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_17");	//Значит, мне нужно будет его убить?
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_18");	//Нет конечно. Во-первых, по законам Масиаф, ты на это просто не имеешь права.
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_19");	//Бросить вызов может только ему равный.
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_20");	//А во-вторых, у тебя пока что не хватит силенок, чтобы совладать с лучшим бойцом Масиафа!
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_21");	//Или ты думаешь, что он просто так занимается подготовкой Теней Братства?
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_22");	//Нет. Тут твоя помощь мне не потребуется.
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_23");	//Я все сделаю сам. Ты сможешь только понаблюдать за сражением.
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_24");	//А сейчас пока что ты свободен. Можешь немного отдохнуть.
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_25");	//И вот, возьми это золото. Я не обманывал тебя, когда говорил, что хорошо плачу своим людям.
		B_GiveInvItems(self,other,ItMi_HaniarPurse,1);
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_26");	//Теперь все, ступай.
		HaniarBlameTiamant = TRUE;
		MIS_Intriges = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_Intriges,LOG_SUCCESS);
		B_LogEntry(TOPIC_Intriges,"Я сообщил Ханиару обо всем, что смог узнать о приоре Тиаманте. Похоже, Тиаманту в скором времени придется ответить за все свои промахи. Такой поворот событий мне только на руку.");
		AI_StopProcessInfos(self);
		Wld_InsertNpc(SEK_186_SLAVEOBSSEK,"PW_GROT_GOLDORE_SLAVE_01");
		Wld_InsertNpc(SEK_387_SLAVEOBSSEK,"PW_GROT_GOLDORE_SLAVE_02");

		if(HoakinIsDead == FALSE)
		{
			Npc_ExchangeRoutine(Ass_184_Adept,"Osair");
			AI_Teleport(Ass_184_Adept,"PW_TEMPLE_HOAKIN");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Nrozas_01_27");	//Но хватит об этом. У тебя еще есть что-нибудь для меня?
	};
};


func void DIA_Ass_126_Haniar_BlameTiamant_Hasim()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_Hasim_01_01");	//Я знаю, почему убили Хасима.
	AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Hasim_01_02");	//Тогда рассказывай все что знаешь.
	AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_Hasim_01_03");	//В подгорном проходе есть большой золотой рудник.
	AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_Hasim_01_04");	//Однако до текущего момента никто, кроме Тиаманта, о нем не знал.
	AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_Hasim_01_05");	//Скорее всего, он решил приберечь его исключительно для себя, но Хасим что-то пронюхал про эту маленькую тайну приора.
	AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_Hasim_01_06");	//Но не успел рассказать вам об этом... Благодаря мне.
	AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_Hasim_01_07");	//Сначала Тиамант хотел поручить это дело своему человеку по имени Лука.
	AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_Hasim_01_08");	//Но потом решил использовать для этого меня. Ну а дальше вы и так знаете.
	AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_Hasim_01_09");	//А в качестве доказательства моих слов - вот это письмо.
	B_GiveInvItems(other,self,ItWr_Luka,1);
	B_UseFakeScroll();
	HaniarKnowHasim = TRUE;

	if((HaniarKnowOsair == TRUE) && (HaniarKnowNrozas == TRUE) && (HaniarKnowHasim == TRUE))
	{
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Hasim_01_11");	//Хммм... Что-нибудь еще?
		AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_Hasim_01_12");	//Это все, мастер.
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Hasim_01_13");	//Ну что же, хорошая работа. Значит, не зря я тебе доверился.
		AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_Hasim_01_14");	//И что будет теперь?
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Hasim_01_15");	//(мрачно) Ничего хорошего. По крайней мере, для Тиаманта.
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Hasim_01_16");	//Судя по тому, что ты мне рассказал, - и половины хватит для того, чтобы, по законам Масиафа, он был приговорен к смерти!
		AI_Output(other,self,"DIA_Ass_126_Haniar_BlameTiamant_Hasim_01_17");	//Значит, мне нужно будет его убить?
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Hasim_01_18");	//Нет конечно. Во-первых, по законам Масиаф, ты на это просто не имеешь права.
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Hasim_01_19");	//Бросить вызов может только ему равный.
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Hasim_01_20");	//А во-вторых, у тебя пока что не хватит силенок, чтобы совладать с лучшим бойцом Масиафа!
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Hasim_01_21");	//Или ты думаешь, что он просто так занимается подготовкой Теней Братства?
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Hasim_01_22");	//Нет. Тут твоя помощь мне не потребуется.
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Hasim_01_23");	//Я все сделаю сам. Ты сможешь только понаблюдать за сражением.
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Hasim_01_24");	//А сейчас пока что ты свободен. Можешь немного отдохнуть.
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Hasim_01_25");	//И вот, возьми это золото. Я не обманывал тебя, когда говорил, что хорошо плачу своим людям.
		B_GiveInvItems(self,other,ItMi_HaniarPurse,1);
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Hasim_01_26");	//Теперь все, ступай.
		HaniarBlameTiamant = TRUE;
		MIS_Intriges = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_Intriges,LOG_SUCCESS);
		B_LogEntry(TOPIC_Intriges,"Я сообщил Ханиару обо всем, что смог узнать о приоре Тиаманте. Похоже, Тиаманту в скором времени придется ответить за все свои промахи. Такой поворот событий мне только на руку.");
		AI_StopProcessInfos(self);
		Wld_InsertNpc(SEK_186_SLAVEOBSSEK,"PW_GROT_GOLDORE_SLAVE_01");
		Wld_InsertNpc(SEK_387_SLAVEOBSSEK,"PW_GROT_GOLDORE_SLAVE_02");

		if(HoakinIsDead == FALSE)
		{
			Npc_ExchangeRoutine(Ass_184_Adept,"Osair");
			AI_Teleport(Ass_184_Adept,"PW_TEMPLE_HOAKIN");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Ass_126_Haniar_BlameTiamant_Hasim_01_27");	//(мрачно) Что-нибудь еще?
	};
};

instance DIA_Ass_126_Haniar_DeadTiamant(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 1;
	condition = DIA_Ass_126_Haniar_DeadTiamant_condition;
	information = DIA_Ass_126_Haniar_DeadTiamant_info;
	permanent = FALSE;
	description = "Это было впечатляюще, мастер!";
};

func int DIA_Ass_126_Haniar_DeadTiamant_condition()
{
	if((TiamantIsDead == TRUE) && (MIS_PW_FollowGoldOre == LOG_Success))
	{
		return TRUE;
	};
};
	
func void DIA_Ass_126_Haniar_DeadTiamant_info()
{
	OsairSeekYou = TRUE;
	AI_Output(other,self,"DIA_Ass_126_Haniar_DeadTiamant_01_01");	//Это было впечатляюще, мастер!
	AI_Output(self,other,"DIA_Ass_126_Haniar_DeadTiamant_01_02");	//(мрачно) Возможно. Только не думай, что я рад этому.
	AI_Output(self,other,"DIA_Ass_126_Haniar_DeadTiamant_01_03");	//Потеря одного из приоров, тем более такого, как Тиамант, безусловно, скажется на Братстве.
	AI_Output(self,other,"DIA_Ass_126_Haniar_DeadTiamant_01_04");	//И, естественно, не в лучшую сторону.
	AI_Output(self,other,"DIA_Ass_126_Haniar_DeadTiamant_01_05");	//(властно) Но я должен был это сделать, ибо того требовали законы Масиафа. И все это прекрасно понимают.
	AI_Output(other,self,"DIA_Ass_126_Haniar_DeadTiamant_01_06");	//И что будет теперь?
	AI_Output(self,other,"DIA_Ass_126_Haniar_DeadTiamant_01_07");	//Пока ничего. Со временем мы выберем нового приора из тех братьев, кто будет этого достоин.
	AI_Output(self,other,"DIA_Ass_126_Haniar_DeadTiamant_01_08");	//Пока же приор Осаир возьмет на себя обязанности Тиаманта. 
	AI_Output(self,other,"DIA_Ass_126_Haniar_DeadTiamant_01_09");	//Кстати. Кажется, он искал тебя. Уверен, что не стоит заставлять его ждать.
	AI_Output(self,other,"DIA_Ass_126_Haniar_DeadTiamant_01_10");	//Так что ступай.
	AI_StopProcessInfos(self);
};

instance DIA_Ass_126_Haniar_TrueBattle(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 1;
	condition = dia_Ass_126_Haniar_TrueBattle_condition;
	information = dia_Ass_126_Haniar_TrueBattle_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_Ass_126_Haniar_TrueBattle_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_TrueBattle == LOG_Running) && (NrozasIsDead == FALSE))
	{
		return TRUE;
	};
};

func void dia_Ass_126_Haniar_TrueBattle_info()
{
	AI_Output(self,other,"DIA_Ass_126_Haniar_TrueBattle_01_00");	//Не сейчас! Поговорим после поединка.
	AI_StopProcessInfos(self);
};

instance DIA_Ass_126_Haniar_NrozasPoisonGift(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 1;
	condition = DIA_Ass_126_Haniar_NrozasPoisonGift_condition;
	information = DIA_Ass_126_Haniar_NrozasPoisonGift_info;
	permanent = FALSE;
	description = "Вы хотели видеть меня, мастер?";
};

func int DIA_Ass_126_Haniar_NrozasPoisonGift_condition()
{
	if((MIS_NrozasPoisonGift == LOG_Running) && (HaniarGetGift == FALSE))
	{
		return TRUE;
	};
};
	
func void DIA_Ass_126_Haniar_NrozasPoisonGift_info()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_01");	//Вы хотели видеть меня, мастер?
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_02");	//Ах, хорошо что ты тут. Я слышал, что ты помог приору Нрозасу в его исследованиях.
	AI_Output(other,self,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_03");	//Это так. Я опробовал для него один очень сильный и быстродействующий яд.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_04");	//И как все прошло?
	AI_Output(other,self,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_05");	//Как нельзя лучше. Он за считанные секунды свалил с ног огромного горного тролля.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_06");	//Что же. Меня, если честно, радуют последние успехи Нрозаса.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_07");	//Но они как и радуют, так и... одновременно немного пугают.
	AI_PlayAni(other,"T_SEARCH");
	AI_Output(other,self,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_08");	//Что вы имеете в виду, мастер?
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_09");	//Я, конечно, не сомневаюсь в намерениях Нрозаса, однако, обладая таким весомым аргументом, как это зелье...
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_10");	//...возможно, он захочет использовать его не только во благо Братства.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_11");	//Ведь соблазн иногда настолько велик, что порой даже самые стойкие поддаются искушению.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_12");	//К тому же в последнее время в Братстве творятся довольно странные вещи.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_13");	//Порой у меня складывается такое впечатление, что какая-то неведомая сила стала вмешиваться в наши дела.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_14");	//Поведение многих братьев вызывает у меня серьезные опасения.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_15");	//Еще этот случай с Тиамантом! Такого я уже давно не припомню.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_16");	//(отвлеченно) Кстати. У тебя сейчас нет никаких поручений?
	AI_Output(other,self,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_17");	//Я как раз должен отнести бутылку вина Нрозасу.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_18");	//Бутылку вина?
	AI_Output(other,self,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_19");	//Ее дал мне приор Осаир в знак благодарности за пузырек с ядом.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_20");	//(удивленно) Выходит, что Осаир проявил заинтересованность в нем?
	AI_Output(other,self,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_21");	//Думаю, он хочет заказать у Нрозаса еще больше этого зелья.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_22");	//Странно... мне об этом ничего не было известно.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_23");	//А он, случайно, не обмолвился, для чего ему этот яд?
	AI_Output(other,self,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_24");	//Этот яд для его людей. По его мнению, с ним они будут непобедимы.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_25");	//Я, конечно, не хочу делать пока поспешных выводов...
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_26");	//Но, мне кажется, что наше Братство в большой опасности.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_27");	//Если Нрозасу интересны только его склянки, то Осаир - это совсем иное дело.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_28");	//Его всегда интересовала только власть.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_29");	//Даже когда мы прибыли сюда, он намеренно поселился в отдельной пещере.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_30");	//И я даже не сомневаюсь в том, что он бы с радостью занял мое место.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_31");	//(серьезно) Послушай, эта бутылка вина - она у тебя с собой?

	if(Npc_HasItems(other,ItFo_BeliarTear) >= 1)
	{
		AI_Output(other,self,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_32");	//Да, вот она.
		AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_33");	//Дай мне ее!
		AI_Output(other,self,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_34");	//Конечно. Вот, возьмите, мастер.
		B_GiveInvItems(other,self,ItFo_BeliarTear,1);
		Npc_RemoveInvItems(self,ItFo_BeliarTear,1);
		AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_35");	//'Слеза Белиара'? Такого рода вино пьют только короли!
		AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_36");	//Неужели Осаир так легко расстался с таким сокровищем только для того, чтобы отблагодарить Нрозаса?
		AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_37");	//Это все выглядит довольно странно. Мне надо подумать.
		AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_38");	//Поговорим позже, когда нам никто не помешает.
		HaniarGetGift = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(other,self,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_39");	//У меня ее нет.
		AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_40");	//Интересно, что ты тогда несешь Нрозасу?
		AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_01_41");	//Принеси мне эту бутылку вина. Немедленно!
		AI_StopProcessInfos(self);
	};
};

instance DIA_Ass_126_Haniar_NrozasPoisonGift_Lol(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 1;
	condition = DIA_Ass_126_Haniar_NrozasPoisonGift_Lol_condition;
	information = DIA_Ass_126_Haniar_NrozasPoisonGift_Lol_info;
	permanent = FALSE;
	description = "Вот бутылка вина Осаира, мастер.";
};

func int DIA_Ass_126_Haniar_NrozasPoisonGift_Lol_condition()
{
	if((MIS_NrozasPoisonGift == LOG_Running) && (HaniarGetGift == FALSE) && (Npc_HasItems(hero,ItFo_BeliarTear) >= 1) && (Npc_KnowsInfo(hero,DIA_Ass_126_Haniar_NrozasPoisonGift)))
	{
		return TRUE;
	};
};
	
func void DIA_Ass_126_Haniar_NrozasPoisonGift_Lol_info()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_NrozasPoisonGift_Lol_01_01");	//Вот бутылка вина Осаира, мастер.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Lol_01_02");	//Дай мне ее!
	AI_Output(other,self,"DIA_Ass_126_Haniar_NrozasPoisonGift_Lol_01_03");	//Конечно. Вот, возьмите, мастер.
	B_GiveInvItems(other,self,ItFo_BeliarTear,1);
	Npc_RemoveInvItems(self,ItFo_BeliarTear,1);
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Lol_01_04");	//'Слеза Белиара'? Такого рода вино пьют только короли!
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Lol_01_05");	//Неужели Осаир так легко расстался с таким сокровищем только для того, чтобы отблагодарить Нрозаса?
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Lol_01_06");	//Это все выглядит довольно странно. Мне надо подумать.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Lol_01_07");	//Поговорим позже, когда нам никто не помешает.
	HaniarGetGift = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_Ass_126_Haniar_NrozasPoisonGift_Ok(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 1;
	condition = DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_condition;
	information = DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_NrozasPoisonGift == LOG_Running) && (HaniarGetGift == TRUE) && (Wld_IsTime(9,0,10,0) || Wld_IsTime(21,0,22,0)))
	{
		return TRUE;
	};
};
	
func void DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_info()
{
	B_GivePlayerXP(300);
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_01");	//(мрачно) Итак. Мои опасения полностью подтвердились. То вино было отравлено.
	AI_Output(other,self,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_02");	//Правда?
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_03");	//Тебе еще повезло, что ты не успел отдать его Нрозасу. Точнее, повезло вам обоим.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_04");	//Этот глупец наверняка также испил бы это вино, даже не задумываясь о последствиях.
	AI_Output(other,self,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_05");	//Благодарю вас, мастер.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_06");	//Не стоит. Но, по всей видимости, Осаир затеял довольно опасную игру. А смерть Тиаманта лишь развязала ему руки.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_07");	//Убив Нрозаса и свалив всю ответственность на тебя, он легко бы решил этот вопрос в свою пользу.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_08");	//И на его пути, по сути, остался бы только я!
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_09");	//Однако он делает большую ошибку, если считает, что сможет совладать со мной.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_10");	//Это властолюбец даже не догадывается, насколько могущественная сила мне покровительствует!
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_11");	//Но угрозу Осаира также не стоит недооценивать, поскольку в этой резне могут пострадать наши братья.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_12");	//А я не допущу, чтобы чьи-то амбиции вмиг разрушили все то, что создавалось веками.
	AI_Output(other,self,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_13");	//Что вы собираетесь делать, мастер?
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_14");	//Я не могу сейчас обвинить в чем-то Осаира, не имея при этом существенных доказательств.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_15");	//Поэтому надо заставить его самого открыть свои планы и сделать первый шаг навстречу своей смерти.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_16");	//И ты поможешь мне в этом.
	AI_Output(other,self,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_17");	//Я сделаю все, что в моих силах.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_18");	//Отлично! Для начала я позабочусь о Нрозасе. И его смерть сыграет нам на руку.
	AI_Output(other,self,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_19");	//Вы убьете его?
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_20");	//Не совсем. К тому же Нрозас слишком ценен своими знаниями, чтобы его просто так можно было убить.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_21");	//Я отправлю Нрозаса во внутреннее святилище нашего храма, где он сможет в одиночестве продолжить свои эксперименты на блага Братства.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_22");	//Но для остальных Нрозас умрет. В том числе и для Осаира.
	AI_Output(other,self,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_23");	//Внутреннее святилище?
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_24");	//Я понимаю твое удивление. О его существовании знаю только я.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_25");	//Это то место, где можно спрятать свои самые страшные тайны.
	AI_Output(other,self,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_26");	//А что там находится?
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_27");	//То, с чем тебе лучше никогда не сталкиваться. Большего знать об этом не нужно.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_28");	//Что касается Осаира, я напишу ему письмо, которое ты ему и отнесешь.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_29");	//Я предложу ему обсудить ситуацию в Братстве с глазу на глаз.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_30");	//Уверен, что он не упустит такой возможности разделаться со мной.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_31");	//И вот тогда ему наступит конец!
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_32");	//Однако мне нужно время, чтобы написать это письмо.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_33");	//А ты пока сходи к Нрозасу и отнеси ему вот это вино.
	B_GiveInvItems(self,other,ItFo_BeliarTear_Haniar,1); 
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_34");	//И, естественно, преподнеси его, как подарок от Осаира.
	AI_Output(other,self,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_35");	//А оно его не убьет?
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_36");	//Не беспокойся. Оно теперь абсолютно безопасно.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_37");	//Пусть старик напоследок побалует себя этим божественным нектаром.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Ok_01_38");	//Все, ступай. Увидимся позже.
	B_LogEntry(TOPIC_NrozasPoisonGift,"Ханиар сказал, что вино было отравлено. Похоже, Осаир хотел убить Нрозаса моими руками, а заодно и меня. Ведь все подозрения сразу же падут на меня. По всей видимости, Осаир хочет разделаться со всеми приорами Братства, чтобы прибрать власть в свои руки. Однако Ханиар предвидел это и придумал некий план, чтобы остановить Осаира.");
	AI_StopProcessInfos(self);
};


instance DIA_Ass_126_Haniar_NrozasPoisonGift_Done(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 1;
	condition = DIA_Ass_126_Haniar_NrozasPoisonGift_Done_condition;
	information = DIA_Ass_126_Haniar_NrozasPoisonGift_Done_info;
	permanent = FALSE;
	description = "Я передал вино Нрозасу, мастер.";
};

func int DIA_Ass_126_Haniar_NrozasPoisonGift_Done_condition()
{
	if((MIS_NrozasPoisonGift == LOG_Success) && (HaniarGetGift == TRUE))
	{
		return TRUE;
	};
};
	
func void DIA_Ass_126_Haniar_NrozasPoisonGift_Done_info()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_NrozasPoisonGift_Done_01_01");	//Я передал вино Нрозасу, мастер.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Done_01_02");	//Отлично! Там, где он сейчас, ему будет куда спокойней.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Done_01_03");	//Я же тем временем написал письмо. Вот, возьми его и отнеси Осаиру.
	B_GiveInvItems(self,other,ItWr_HaniarToOsair,1); 
	AI_Output(other,self,"DIA_Ass_126_Haniar_NrozasPoisonGift_Done_01_04");	//Полагаю, он не слишком будет рад видеть меня.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Done_01_05");	//Не волнуйся. Он не посмеет тронуть моего посыльного.
	AI_Output(other,self,"DIA_Ass_126_Haniar_NrozasPoisonGift_Done_01_06");	//А что насчет вас? Вы пойдете туда один?
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Done_01_07");	//Абсолютно верно.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Done_01_08");	//Иное просто может спугнуть Осаира и он не станет раскрывать передо мной все свои карты.
	AI_Output(other,self,"DIA_Ass_126_Haniar_NrozasPoisonGift_Done_01_09");	//Мне кажется, что для боя вас одного будет маловато против всех его головорезов.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Done_01_10");	//Я надеюсь, что сам Осаир подумает точно так же, как и ты сейчас. Очень надеюсь!
	AI_Output(self,other,"DIA_Ass_126_Haniar_NrozasPoisonGift_Done_01_11");	//Но хватит уже болтать. Ступай и отнеси ему письмо.
	AI_Output(other,self,"DIA_Ass_126_Haniar_NrozasPoisonGift_Done_01_12");	//Само собой, мастер.
	AI_StopProcessInfos(self);
};

instance DIA_Ass_126_Haniar_TrueBattle_Done(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 1;
	condition = dia_Ass_126_Haniar_TrueBattle_Done_condition;
	information = dia_Ass_126_Haniar_TrueBattle_Done_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_Ass_126_Haniar_TrueBattle_Done_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_TrueBattle == LOG_Success) && (NrozasIsDead == TRUE))
	{
		return TRUE;
	};
};

func void dia_Ass_126_Haniar_TrueBattle_Done_info()
{
	AI_Output(self,other,"DIA_Ass_126_Haniar_TrueBattle_Done_01_00");	//Что же. Нрозас проиграл. Кто бы мог подумать.
	AI_Output(self,other,"DIA_Ass_126_Haniar_TrueBattle_Done_01_01");	//Значит, по всей видимости, правда была на твоей стороне.
	AI_Output(self,other,"DIA_Ass_126_Haniar_TrueBattle_Done_01_02");	//Однако я не сомневаюсь в том, что его потеря еще аукнется нам в будущем.
	AI_Output(self,other,"DIA_Ass_126_Haniar_TrueBattle_Done_01_03");	//Но что сделано, то сделано.
	AI_StopProcessInfos(self);
	B_StartOtherRoutine(Ass_126_Haniar,"Start");
};

instance DIA_Ass_126_Haniar_TrueBattle_Next(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 1;
	condition = dia_Ass_126_Haniar_TrueBattle_Next_condition;
	information = dia_Ass_126_Haniar_TrueBattle_Next_info;
	permanent = FALSE;
	description = "Для меня еще будут поручения, мастер?";
};

func int dia_Ass_126_Haniar_TrueBattle_Next_condition()
{
	if((MIS_TrueBattle == LOG_Success) && (NrozasIsDead == TRUE))
	{
		return TRUE;
	};
};

func void dia_Ass_126_Haniar_TrueBattle_Next_info()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_TrueBattle_Next_01_00");	//Для меня еще будут поручения, мастер?
	AI_Output(self,other,"DIA_Ass_126_Haniar_TrueBattle_Next_01_01");	//Да, будут. Мне необходимо, чтобы ты сходил к алтарю Белиара.
	AI_Output(self,other,"DIA_Ass_126_Haniar_TrueBattle_Next_01_02");	//Я дам тебе с собой золото, которое ты должен будешь преподнести ему в качестве дара.
	AI_Output(self,other,"DIA_Ass_126_Haniar_TrueBattle_Next_01_03");	//В последнее время дела в Братстве идут не важно. В том числе и благодаря тебе.
	AI_Output(self,other,"DIA_Ass_126_Haniar_TrueBattle_Next_01_04");	//Так что, возможно, это подношение позволит нам рассчитывать на его помощь.
	AI_Output(self,other,"DIA_Ass_126_Haniar_TrueBattle_Next_01_05");	//Только не вздумай присвоить это золото себе, иначе я с тебя шкуру живьем спущу!
	AI_Output(other,self,"DIA_Ass_126_Haniar_TrueBattle_Next_01_06");	//Уверен, что с этим проблем не будет.
	AI_Output(self,other,"DIA_Ass_126_Haniar_TrueBattle_Next_01_07");	//Для тебя же лучше. Тогда вот, возьми его и ступай.
	B_GiveInvItems(self,other,ItMi_Gold,2000); 
	MIS_BeliarTribe = LOG_Running;
	Log_CreateTopic(TOPIC_BeliarTribe,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BeliarTribe,LOG_Running);
	B_LogEntry(TOPIC_BeliarTribe,"Мне необходимо отправиться к алтарю Белиара и принести ему в дар золото Ханиара Слепца.");
	AI_StopProcessInfos(self);
};

instance DIA_Ass_126_Haniar_BeliarTribe(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 1;
	condition = dia_Ass_126_Haniar_BeliarTribe_condition;
	information = dia_Ass_126_Haniar_BeliarTribe_info;
	permanent = FALSE;
	description = "Белиар принял ваш дар, мастер.";
};

func int dia_Ass_126_Haniar_BeliarTribe_condition()
{
	if(MIS_BeliarTribe == LOG_Success)
	{
		return TRUE;
	};
};

func void dia_Ass_126_Haniar_BeliarTribe_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Ass_126_Haniar_BeliarTribe_01_00");	//Белиар принял ваш дар, мастер.
	AI_Output(self,other,"DIA_Ass_126_Haniar_BeliarTribe_01_01");	//Рад это слышать. Надеюсь, это поможет нам.
};

instance DIA_Ass_126_Haniar_OsairTrait(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 1;
	condition = dia_Ass_126_Haniar_OsairTrait_condition;
	information = dia_Ass_126_Haniar_OsairTrait_info;
	permanent = FALSE;
	description = "У меня для вас плохие новости, мастер.";
};

func int dia_Ass_126_Haniar_OsairTrait_condition()
{
	if((MIS_OsairTrait == LOG_Running) && (Wld_IsTime(9,0,10,0) || Wld_IsTime(21,0,22,0)))
	{
		return TRUE;
	};
};

func void dia_Ass_126_Haniar_OsairTrait_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Ass_126_Haniar_OsairTrait_01_00");	//У меня для вас плохие новости, мастер.
	AI_Output(self,other,"DIA_Ass_126_Haniar_OsairTrait_01_01");	//О чем идет речь?
	AI_Output(other,self,"DIA_Ass_126_Haniar_OsairTrait_01_02");	//Кажется, приор Осаир собирает верных ему людей, чтобы напасть на храм.
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_Ass_126_Haniar_OsairTrait_01_03");	//Ты говоришь очень опасные вещи, брат. Ты в этом уверен?
	AI_Output(other,self,"DIA_Ass_126_Haniar_OsairTrait_01_04");	//Осаир лично говорил со мной и пытался склонить на свою сторону.
	AI_Output(self,other,"DIA_Ass_126_Haniar_OsairTrait_01_05");	//И что, ему это удалось?
	AI_Output(other,self,"DIA_Ass_126_Haniar_OsairTrait_01_06");	//Ну, пришлось сделать вид, что я согласился.
	AI_Output(self,other,"DIA_Ass_126_Haniar_OsairTrait_01_07");	//Ладно, это не столь важно. Одно то, что ты тут, уже говорит о многом.
	AI_Output(self,other,"DIA_Ass_126_Haniar_OsairTrait_01_08");	//И хорошо, что тебе хватило ума сообщить мне об этом, когда нас никто не услышит.
	AI_Output(self,other,"DIA_Ass_126_Haniar_OsairTrait_01_09");	//Значит, по всей видимости, Осаир затеял довольно опасную игру. А смерти Тиаманта и Нрозаса лишь развязали ему руки.
	AI_Output(self,other,"DIA_Ass_126_Haniar_OsairTrait_01_10");	//И на его пути, по сути, остался только я.
	AI_Output(other,self,"DIA_Ass_126_Haniar_OsairTrait_01_11");	//Выходит, что так.
	AI_Output(self,other,"DIA_Ass_126_Haniar_OsairTrait_01_12");	//Но он делает большую ошибку, если считает что сможет совладать со мной.
	AI_Output(self,other,"DIA_Ass_126_Haniar_OsairTrait_01_13");	//Это властолюбец даже не догадывается, насколько могущественная сила мне покровительствует!
	AI_Output(self,other,"DIA_Ass_126_Haniar_OsairTrait_01_14");	//Но угрозу Осаира также не стоит недооценивать, поскольку в этой резне могут пострадать наши братья.
	AI_Output(self,other,"DIA_Ass_126_Haniar_OsairTrait_01_15");	//А я не допущу, чтобы чьи-то амбиции вмиг разрушили все то, что создавалось веками!
	AI_Output(other,self,"DIA_Ass_126_Haniar_OsairTrait_01_16");	//Что вы собираетесь делать, мастер?
	AI_Output(self,other,"DIA_Ass_126_Haniar_OsairTrait_01_17");	//Я не могу сейчас обвинить в чем то Осаира, не имея при этом существенных доказательств.
	AI_Output(self,other,"DIA_Ass_126_Haniar_OsairTrait_01_18");	//Поэтому надо заставить его самого открыть свои планы и сделать первый шаг навстречу своей смерти.
	AI_Output(self,other,"DIA_Ass_126_Haniar_OsairTrait_01_19");	//И ты поможешь мне в этом.
	AI_Output(other,self,"DIA_Ass_126_Haniar_OsairTrait_01_20");	//Я сделаю все, что в моих силах.
	AI_Output(self,other,"DIA_Ass_126_Haniar_OsairTrait_01_21");	//Я напишу ему письмо, которое ты ему и отнесешь.
	AI_Output(self,other,"DIA_Ass_126_Haniar_OsairTrait_01_22");	//Я предложу ему обсудить ситуацию в Братстве с глазу на глаз.
	AI_Output(self,other,"DIA_Ass_126_Haniar_OsairTrait_01_23");	//Уверен, что он не упустит такой возможности разделаться со мной.
	AI_Output(self,other,"DIA_Ass_126_Haniar_OsairTrait_01_24");	//И вот тогда, ему наступит конец!
	AI_Output(self,other,"DIA_Ass_126_Haniar_OsairTrait_01_25");	//Однако мне нужно время, чтобы написать это письмо.
	AI_Output(self,other,"DIA_Ass_126_Haniar_OsairTrait_01_26");	//Так что подожди тут минутку. 
	B_LogEntry(TOPIC_OsairTrait,"Я рассказал Ханиару о планах Осаира. Однако Ханиар предвидел это и придумал некий план, чтобы остановить его. Мне надо немного подождать, пока Ханиар напишет письмо Осаиру.");
	HaniarWriteLetter = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"LetterWrite");
};

instance DIA_Ass_126_Haniar_OsairTrait_Done(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 1;
	condition = DIA_Ass_126_Haniar_OsairTrait_Done_condition;
	information = DIA_Ass_126_Haniar_OsairTrait_Done_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Ass_126_Haniar_OsairTrait_Done_condition()
{
	if((MIS_OsairTrait == LOG_Running) && (HaniarWriteLetter == TRUE) && (HaniarWriteLetterDone == TRUE))
	{
		return TRUE;
	};
};
	
func void DIA_Ass_126_Haniar_OsairTrait_Done_info()
{
	AI_Output(self,other,"DIA_Ass_126_Haniar_OsairTrait_Done_01_01");	//Вот, возьми его и отнеси Осаиру.
	B_GiveInvItems(self,other,ItWr_HaniarToOsair,1); 
	AI_Output(other,self,"DIA_Ass_126_Haniar_OsairTrait_Done_01_02");	//Полагаю, он не слишком будет рад видеть меня с ним.
	AI_Output(self,other,"DIA_Ass_126_Haniar_OsairTrait_Done_01_03");	//Не волнуйся. Он не посмеет тронуть моего посыльного.
	AI_Output(other,self,"DIA_Ass_126_Haniar_OsairTrait_Done_01_04");	//А что насчет вас? Вы пойдете туда один?
	AI_Output(self,other,"DIA_Ass_126_Haniar_OsairTrait_Done_01_05");	//(спокойно) Абсолютно верно.
	AI_Output(self,other,"DIA_Ass_126_Haniar_OsairTrait_Done_01_06");	//Иное просто может спугнуть Осаира и он не станет раскрывать передо мной все свои карты.
	AI_Output(other,self,"DIA_Ass_126_Haniar_OsairTrait_Done_01_07");	//Мне кажется, что для боя вас одного будет маловато против всех его головорезов.
	AI_Output(self,other,"DIA_Ass_126_Haniar_OsairTrait_Done_01_08");	//Я надеюсь, что сам Осаир подумает точно также, как и ты сейчас. Очень надеюсь!
	AI_Output(self,other,"DIA_Ass_126_Haniar_OsairTrait_Done_01_09");	//Но хватит уже болтать. Ступай и отнеси ему письмо.
	AI_Output(other,self,"DIA_Ass_126_Haniar_OsairTrait_Done_01_10");	//Само собой, мастер.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};

instance DIA_Ass_126_Haniar_PRETEACH_MANA(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 23;
	condition = dia_Ass_126_Haniar_preteach_mana_condition;
	information = dia_Ass_126_Haniar_preteach_mana_info;
	permanent = FALSE;
	description = "Чему я смогу научиться у вас, мастер?";
};

func int dia_Ass_126_Haniar_preteach_mana_condition()
{
	if(PlayerIsAssNow == TRUE)
	{
		return TRUE;
	};
};

func void dia_Ass_126_Haniar_preteach_mana_info()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_PreTeach_Mana_01_00");	//Чему я смогу научиться у вас, мастер?
	AI_Output(self,other,"DIA_Ass_126_Haniar_PreTeach_Mana_01_01");	//(серьезно) Моя стезя обучения наших братьев - это их духовная сила.
	AI_Output(self,other,"DIA_Ass_126_Haniar_PreTeach_Mana_01_02");	//Мы, конечно, сами по себе не практикуем магию Белиара, как это делают темные маги Варанта.
	AI_Output(self,other,"DIA_Ass_126_Haniar_PreTeach_Mana_01_03");	//Но это еще не означает, что крепость духа абсолютно бесполезная для нас вещь.
	AI_Output(self,other,"DIA_Ass_126_Haniar_PreTeach_Mana_01_04");	//Так что, если захочешь, я могу потренировать и тебя.
	AI_Output(self,other,"DIA_Ass_126_Haniar_PreTeach_Mana_01_05");	//Ко всему прочему, мои тренировки смогут закалить твое тело и повысить его выносливость.
	AI_Output(self,other,"DIA_Ass_126_Haniar_PreTeach_Mana_01_06");	//При условии, конечно, что у тебя будет достаточно для этого опыта.
	AI_Output(self,other,"DIA_Ass_126_Haniar_PreTeach_Mana_01_07");	//Если же хочешь получше овладеть навыкам ведения боя, то тебе лучше обратиться к Тиаманту.
	AI_Output(self,other,"DIA_Ass_126_Haniar_PreTeach_Mana_01_08");	//Боевой подготовкой наших братьев занимается только он.
	HaniarTeachMe = TRUE;
	Log_CreateTopic(TOPIC_PrioratTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_PrioratTeacher,"Приор Ханиар поможет мне повысить мою духовную силу, жизненную энергию и выносливость.");
};


instance DIA_Ass_126_Haniar_TEACH_MANA(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 10;
	condition = dia_Ass_126_Haniar_teach_mana_condition;
	information = dia_Ass_126_Haniar_teach_mana_info;
	permanent = TRUE;
	description = "Я хочу тренироваться.";
};

func int dia_Ass_126_Haniar_teach_mana_condition()
{
	if(HaniarTeachMe == TRUE)
	{
		return TRUE;
	};
};

func void dia_Ass_126_Haniar_teach_mana_info()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_TEACH_MANA_01_00");	//Я хочу тренироваться.
	Info_ClearChoices(dia_Ass_126_Haniar_teach_mana);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,Dialog_Back,dia_Ass_126_Haniar_teach_mana_back);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_Ass_126_Haniar_teach_mana_1);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_Ass_126_Haniar_teach_mana_5);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_Ass_126_Haniar_teach_mana_stamina_1);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_Ass_126_Haniar_teach_mana_stamina_5);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_Ass_126_Haniar_teach_mana_hp_1);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_Ass_126_Haniar_teach_mana_hp_5);

	if(VATRAS_TEACHREGEN == FALSE)
	{
		Info_AddChoice(DIA_Ass_126_Haniar_TEACH_MANA,"Регенерация здоровья (Очки обучения: 5)",DIA_Ass_126_Haniar_TEACH_MANA_RegenHealth);
	};
};

func void dia_Ass_126_Haniar_teach_mana_back()
{
	Info_ClearChoices(dia_Ass_126_Haniar_teach_mana);
};

func void DIA_Ass_126_Haniar_TEACH_MANA_RegenHealth()
{
	var int kosten;

	AI_Output(other,self,"DIA_Vatras_Teach_regen_15_04");	//Научи меня регенерации здоровья.

	kosten = 5;

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		B_Say(self,other,"$NOLEARNNOPOINTS");
		AI_StopProcessInfos(self);
	}
	else
	{
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + kosten;
		AI_Print("Обучение: Регенерация здоровья");
		VATRAS_TEACHREGEN = TRUE;
		Snd_Play("LevelUP");
	};

	Info_ClearChoices(dia_Ass_126_Haniar_teach_mana);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,Dialog_Back,dia_Ass_126_Haniar_teach_mana_back);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_Ass_126_Haniar_teach_mana_1);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_Ass_126_Haniar_teach_mana_5);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_Ass_126_Haniar_teach_mana_stamina_1);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_Ass_126_Haniar_teach_mana_stamina_5);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_Ass_126_Haniar_teach_mana_hp_1);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_Ass_126_Haniar_teach_mana_hp_5);
};

func void dia_Ass_126_Haniar_teach_mana_1()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,1,T_MEGA);
	Info_ClearChoices(dia_Ass_126_Haniar_teach_mana);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,Dialog_Back,dia_Ass_126_Haniar_teach_mana_back);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_Ass_126_Haniar_teach_mana_1);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_Ass_126_Haniar_teach_mana_5);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_Ass_126_Haniar_teach_mana_stamina_1);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_Ass_126_Haniar_teach_mana_stamina_5);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_Ass_126_Haniar_teach_mana_hp_1);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_Ass_126_Haniar_teach_mana_hp_5);

	if(VATRAS_TEACHREGEN == FALSE)
	{
		Info_AddChoice(DIA_Ass_126_Haniar_TEACH_MANA,"Регенерация здоровья (Очки обучения: 5)",DIA_Ass_126_Haniar_TEACH_MANA_RegenHealth);
	};
};

func void dia_Ass_126_Haniar_teach_mana_5()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,5,T_MEGA);
	Info_ClearChoices(dia_Ass_126_Haniar_teach_mana);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,Dialog_Back,dia_Ass_126_Haniar_teach_mana_back);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_Ass_126_Haniar_teach_mana_1);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_Ass_126_Haniar_teach_mana_5);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_Ass_126_Haniar_teach_mana_stamina_1);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_Ass_126_Haniar_teach_mana_stamina_5);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_Ass_126_Haniar_teach_mana_hp_1);
	Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_Ass_126_Haniar_teach_mana_hp_5);

	if(VATRAS_TEACHREGEN == FALSE)
	{
		Info_AddChoice(DIA_Ass_126_Haniar_TEACH_MANA,"Регенерация здоровья (Очки обучения: 5)",DIA_Ass_126_Haniar_TEACH_MANA_RegenHealth);
	};
};

func void dia_Ass_126_Haniar_teach_mana_stamina_1()
{
	if(b_teachstamina(self,other,NPC_TALENT_STAMINA,1))
	{
		Info_ClearChoices(dia_Ass_126_Haniar_teach_mana);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,Dialog_Back,dia_Ass_126_Haniar_teach_mana_back);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_Ass_126_Haniar_teach_mana_1);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_Ass_126_Haniar_teach_mana_5);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_Ass_126_Haniar_teach_mana_stamina_1);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_Ass_126_Haniar_teach_mana_stamina_5);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_Ass_126_Haniar_teach_mana_hp_1);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_Ass_126_Haniar_teach_mana_hp_5);

		if(VATRAS_TEACHREGEN == FALSE)
		{
			Info_AddChoice(DIA_Ass_126_Haniar_TEACH_MANA,"Регенерация здоровья (Очки обучения: 10)",DIA_Ass_126_Haniar_TEACH_MANA_RegenHealth);
		};
	};
};

func void dia_Ass_126_Haniar_teach_mana_stamina_5()
{
	if(b_teachstamina(self,other,NPC_TALENT_STAMINA,5))
	{
		Info_ClearChoices(dia_Ass_126_Haniar_teach_mana);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,Dialog_Back,dia_Ass_126_Haniar_teach_mana_back);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_Ass_126_Haniar_teach_mana_1);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_Ass_126_Haniar_teach_mana_5);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_Ass_126_Haniar_teach_mana_stamina_1);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_Ass_126_Haniar_teach_mana_stamina_5);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_Ass_126_Haniar_teach_mana_hp_1);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_Ass_126_Haniar_teach_mana_hp_5);

		if(VATRAS_TEACHREGEN == FALSE)
		{
			Info_AddChoice(DIA_Ass_126_Haniar_TEACH_MANA,"Регенерация здоровья (Очки обучения: 10)",DIA_Ass_126_Haniar_TEACH_MANA_RegenHealth);
		};
	};
};

func void dia_Ass_126_Haniar_teach_mana_hp_1()
{
	if(b_teachattributepointshitpoints(self,other,ATR_HITPOINTS_MAX,1,T_MAX_HP))
	{
		Info_ClearChoices(dia_Ass_126_Haniar_teach_mana);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,Dialog_Back,dia_Ass_126_Haniar_teach_mana_back);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_Ass_126_Haniar_teach_mana_1);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_Ass_126_Haniar_teach_mana_5);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_Ass_126_Haniar_teach_mana_stamina_1);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_Ass_126_Haniar_teach_mana_stamina_5);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_Ass_126_Haniar_teach_mana_hp_1);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_Ass_126_Haniar_teach_mana_hp_5);

		if(VATRAS_TEACHREGEN == FALSE)
		{
			Info_AddChoice(DIA_Ass_126_Haniar_TEACH_MANA,"Регенерация здоровья (Очки обучения: 10)",DIA_Ass_126_Haniar_TEACH_MANA_RegenHealth);
		};
	};
};

func void dia_Ass_126_Haniar_teach_mana_hp_5()
{
	if(b_teachattributepointshitpoints(self,other,ATR_HITPOINTS_MAX,5,T_MAX_HP))
	{
		Info_ClearChoices(dia_Ass_126_Haniar_teach_mana);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,Dialog_Back,dia_Ass_126_Haniar_teach_mana_back);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_Ass_126_Haniar_teach_mana_1);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_Ass_126_Haniar_teach_mana_5);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_Ass_126_Haniar_teach_mana_stamina_1);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_Ass_126_Haniar_teach_mana_stamina_5);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_Ass_126_Haniar_teach_mana_hp_1);
		Info_AddChoice(dia_Ass_126_Haniar_teach_mana,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_Ass_126_Haniar_teach_mana_hp_5);

		if(VATRAS_TEACHREGEN == FALSE)
		{
			Info_AddChoice(DIA_Ass_126_Haniar_TEACH_MANA,"Регенерация здоровья (Очки обучения: 10)",DIA_Ass_126_Haniar_TEACH_MANA_RegenHealth);
		};
	};
};


instance DIA_Ass_126_Haniar_FinalHaniar(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 1;
	condition = DIA_Ass_126_Haniar_FinalHaniar_condition;
	information = DIA_Ass_126_Haniar_FinalHaniar_info;
	permanent = FALSE;
	description = "Приор Осаир согласился на встречу, мастер.";
};

func int DIA_Ass_126_Haniar_FinalHaniar_condition()
{
	if(OsairReadyMeeting == TRUE)
	{
		return TRUE;
	};
};
	
func void DIA_Ass_126_Haniar_FinalHaniar_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Ass_126_Haniar_FinalHaniar_01_01");	//Приор Осаир согласился на встречу, мастер.
	AI_Output(self,other,"DIA_Ass_126_Haniar_FinalHaniar_01_02");	//(зловеще) Что же, отлично. Хотя другого я и не ожидал.
	AI_Output(self,other,"DIA_Ass_126_Haniar_FinalHaniar_01_03");	//Надеюсь, что он все-таки сделает ту ошибку, на которую я так рассчитываю.
	AI_Output(self,other,"DIA_Ass_126_Haniar_FinalHaniar_01_04");	//Что же касается тебя, то ты хорошо поработал.
	AI_Output(self,other,"DIA_Ass_126_Haniar_FinalHaniar_01_05");	//Теперь можешь немного отдохнуть и заняться своими делами.
	AI_Output(self,other,"DIA_Ass_126_Haniar_FinalHaniar_01_06");	//А после того как я улажу дело с Осаиром, возможно, у меня еще будут для тебя поручения.

	if(MIS_OsairTrait == LOG_Running)
	{
		MIS_OsairTrait = LOG_Success;
		Log_SetTopicStatus(TOPIC_OsairTrait,LOG_Success);
	};

	B_LogEntry(TOPIC_MasiafStory,"Мне надо рассказать Гонсалесу о встрече Осаира и Ханиара. Думаю, что в Братстве назревает серьезная заварушка.");
	HaniarReadyMeeting = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_Ass_126_Haniar_Meeting(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 1;
	condition = DIA_Ass_126_Haniar_Meeting_condition;
	information = DIA_Ass_126_Haniar_Meeting_info;
	permanent = FALSE;
	description = "Могу ли я вам помочь разобраться с людьми Осаира?";
};

func int DIA_Ass_126_Haniar_Meeting_condition()
{
	if((HaniarReadyMeeting == TRUE) && (HideMeetCome == FALSE))
	{
		return TRUE;
	};
};
	
func void DIA_Ass_126_Haniar_Meeting_info()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_Meeting_01_01");	//Могу ли я помочь вам разобраться с людьми Осаира?
	AI_Output(self,other,"DIA_Ass_126_Haniar_Meeting_01_02");	//Если тебе дорога твоя жизнь, то лучше держись подальше от всего этого.
	AI_Output(self,other,"DIA_Ass_126_Haniar_Meeting_01_03");	//Это единственное, что я могу тебе сказать.
};

instance DIA_Ass_126_Haniar_CareOsair(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 1;
	condition = DIA_Ass_126_Haniar_CareOsair_condition;
	information = DIA_Ass_126_Haniar_CareOsair_info;
	permanent = FALSE;
	description = "У меня есть новость, которая вас заинтересует.";
};

func int DIA_Ass_126_Haniar_CareOsair_condition()
{
	if((MIS_CareOsair == LOG_Running) && (NazimNeedGetOutCave == FALSE))
	{
		return TRUE;
	};
};
	
func void DIA_Ass_126_Haniar_CareOsair_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Ass_126_Haniar_CareOsair_01_01");	//У меня есть новость, которая вас заинтересует, мастер.
	AI_Output(self,other,"DIA_Ass_126_Haniar_CareOsair_01_02");	//(с интересом) Продолжай.
	AI_Output(other,self,"DIA_Ass_126_Haniar_CareOsair_01_03");	//Приор Осаир дал мне поручение заручиться поддержкой нескольких Теней.
	AI_Output(self,other,"DIA_Ass_126_Haniar_CareOsair_01_04");	//(задумчиво) Их имена?
	AI_Output(other,self,"DIA_Ass_126_Haniar_CareOsair_01_05");	//Фамид, Рафат, Назим и Кудир.
	AI_Output(self,other,"DIA_Ass_126_Haniar_CareOsair_01_06");	//Очень интересно. Он, случайно, не обмолвился, зачем это все ему понадобилось?
	AI_Output(other,self,"DIA_Ass_126_Haniar_CareOsair_01_07");	//Я думал, что ВЫ ответите на этот вопрос.
	AI_Output(self,other,"DIA_Ass_126_Haniar_CareOsair_01_08");	//Нет конечно...(мрачно) Но всех, кого ты назвал, Осаир выбрал, думаю, неспроста.
	AI_Output(self,other,"DIA_Ass_126_Haniar_CareOsair_01_09");	//Попробуй разузнать это, если представится такая возможность. Это может быть важным.
	AI_Output(other,self,"DIA_Ass_126_Haniar_CareOsair_01_10");	//Хорошо. Я сделаю все, что в моих силах.
	HaniarKnowsOsairPlans_01 = TRUE;
};

instance DIA_Ass_126_Haniar_NazimNeedGetOutCave(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 1;
	condition = DIA_Ass_126_Haniar_NazimNeedGetOutCave_condition;
	information = DIA_Ass_126_Haniar_NazimNeedGetOutCave_info;
	permanent = FALSE;
	description = "Можно ли заменить Назима в шахте?";
};

func int DIA_Ass_126_Haniar_NazimNeedGetOutCave_condition()
{
	if((NazimNeedGetOutCave == TRUE) && (MIS_CareOsair == LOG_Running) && (NazimGetOutCave == FALSE))
	{
		return TRUE;
	};
};
	
func void DIA_Ass_126_Haniar_NazimNeedGetOutCave_info()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_01_01");	//Можно ли заменить Назима в шахте?
	AI_Output(self,other,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_01_02");	//(удивленно) А чем вызвано столь сильное беспокойство за него?
	Info_ClearChoices(DIA_Ass_126_Haniar_NazimNeedGetOutCave);
	Info_AddChoice(DIA_Ass_126_Haniar_NazimNeedGetOutCave,"Ему просто не по душе подобное занятие.",DIA_Ass_126_Haniar_NazimNeedGetOutCave_None);
	Info_AddChoice(DIA_Ass_126_Haniar_NazimNeedGetOutCave,"Мне нужна его помощь.",DIA_Ass_126_Haniar_NazimNeedGetOutCave_Help);
	Info_AddChoice(DIA_Ass_126_Haniar_NazimNeedGetOutCave,"Он серьезно болен, мастер.",DIA_Ass_126_Haniar_NazimNeedGetOutCave_Ill);
	Info_AddChoice(DIA_Ass_126_Haniar_NazimNeedGetOutCave,"Его хочет видеть у себя приор Осаир.",DIA_Ass_126_Haniar_NazimNeedGetOutCave_Osair);
};

func void DIA_Ass_126_Haniar_NazimNeedGetOutCave_None()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_None_01_01");	//Ему просто не по душе подобное занятие.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_None_01_02");	//Тогда ему придется смириться с ним. Потому как он останется там же, где и сейчас.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_None_01_03");	//И, судя по всему, на более длительный срок, чем планировал.
	AI_Output(other,self,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_None_01_04");	//Эммм... я понял.
	B_LogEntry(TOPIC_CareOsair,"Кажется, я только что усугубил ситуацию Назима. Надеюсь, он не узнает об этом разговоре с Ханиаром.");
	NazimPissOff = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_Ass_126_Haniar_NazimNeedGetOutCave_Help()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_Help_01_01");	//Мне нужна его помощь.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_Help_01_02");	//Правда? Интересно, в чем?

	if(HaniarKnowsOsairPlans_01 == TRUE)
	{
		AI_Output(other,self,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_Help_01_03");	//В том, что нам обоим будет интересно узнать.
		AI_Output(self,other,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_Help_01_04");	//Понимаю... хорошо.
		AI_Output(self,other,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_Help_01_05");	//Ты можешь передать Назиму, что он может пока оставить свой пост в шахте.
		AI_Output(self,other,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_Help_01_06");	//Надеюсь, что я не пожалею о своем решении.
		AI_Output(other,self,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_Help_01_07");	//Можете не сомневаться, мастер.
		NazimGetOutCave = TRUE;
		B_LogEntry(TOPIC_CareOsair,"Ханиар согласился отпустить Назима с рудника. Нужно сообщить ему эту радостную весть.");
	}
	else
	{
		AI_Output(other,self,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_Help_01_08");	//Просто я решил поохотиться на диких зверей.
		AI_Output(other,self,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_Help_01_09");	//И мне нужен кто-то, кто бы прикрыл мою спину.
		AI_Output(self,other,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_Help_01_10");	//А мне кажется, что такому опытному бойцу, как ты, особо не нужна помощь.
		AI_Output(self,other,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_Help_01_11");	//Так что лучше Назим останется там, где и сейчас.
		AI_Output(self,other,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_Help_01_12");	//Будет больше толку.
 		NazimStayInCave = TRUE;
		B_LogEntry(TOPIC_CareOsair,"Ханиар отказался отпустить Назима с рудника. Думаю, что теперь он не сможет поработать на Осаира.");
	};
	
	AI_StopProcessInfos(self);
};

func void DIA_Ass_126_Haniar_NazimNeedGetOutCave_Ill()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_Ill_01_01");	//Он серьезно болен, мастер.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_Ill_01_02");	//Правда? И что же с ним?
	AI_Output(other,self,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_Ill_01_03");	//Похоже, что эта болезнь может на всю жизнь изуродовать его лицо.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_Ill_01_04");	//Всего-то? Но ведь оно ему и не нужно, не правда ли?
	AI_Output(self,other,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_Ill_01_05");	//Тень никогда не показывает своего истинного лица. Это закон Масиаф.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_Ill_01_06");	//Так что пусть он остается там, где и сейчас.
	AI_Output(self,other,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_Ill_01_07");	//А об остальном волноваться не стоит. Так ему и передай.
	NazimStayInCave = TRUE;
	B_LogEntry(TOPIC_CareOsair,"Ханиар отказался отпустить Назима с рудника. Думаю, что теперь он не сможет поработать на Осаира.");
	AI_StopProcessInfos(self);
};

func void DIA_Ass_126_Haniar_NazimNeedGetOutCave_Osair()
{
	AI_Output(other,self,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_Osair_01_01");	//Его хочет видеть у себя приор Осаир.

	if(HaniarKnowsOsairPlans_01 == TRUE)
	{
		AI_Output(self,other,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_Osair_01_02");	//Хммм... хорошо.
		AI_Output(self,other,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_Osair_01_03");	//Ты можешь передать Назиму, что он может пока оставить свой пост в шахте.
		AI_Output(self,other,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_Osair_01_04");	//Надеюсь, это пойдет ему только на пользу.
		AI_Output(other,self,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_Osair_01_05");	//Несомненно, мастер.
		NazimGetOutCave = TRUE;
		B_LogEntry(TOPIC_CareOsair,"Ханиар согласился отпустить Назима с рудника. Нужно сообщить ему эту радостную весть.");
	}
	else
	{
		AI_Output(self,other,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_Osair_01_06");	//Если Осаир так хочет его видеть, пусть сам придет в шахту.
		AI_Output(self,other,"DIA_Ass_126_Haniar_NazimNeedGetOutCave_Osair_01_07");	//Назим мой человек и останется там, где и сейчас! Так ему и передай.
 		NazimStayInCave = TRUE;
		B_LogEntry(TOPIC_CareOsair,"Ханиар отказался отпустить Назима с рудника. Думаю, что теперь он не сможет поработать на Осаира.");
	};

	AI_StopProcessInfos(self);
};

instance DIA_Ass_126_Haniar_FinalTalk(C_Info)
{
	npc = Ass_126_Haniar;
	nr = 1;
	condition = DIA_Ass_126_Haniar_FinalTalk_condition;
	information = DIA_Ass_126_Haniar_FinalTalk_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Ass_126_Haniar_FinalTalk_condition()
{
	if(HaniarFinalTalk == TRUE)
	{
		return TRUE;
	};
};
	
func void DIA_Ass_126_Haniar_FinalTalk_info()
{
	AI_Output(self,other,"DIA_Ass_126_Haniar_FinalTalk_01_01");	//Так значит, ты все-таки осмелился появиться тут. Я же тебя предупреждал!
	AI_Output(other,self,"DIA_Ass_126_Haniar_FinalTalk_01_02");	//Как видишь, меня это не остановило.
	AI_Output(self,other,"DIA_Ass_126_Haniar_FinalTalk_01_03");	//Да, это несколько меня удивляет. Постой, а кто это с тобой?
	AI_Output(other,self,"DIA_Ass_126_Haniar_FinalTalk_01_04");	//Мне кажется, вы должны быть знакомы.
	AI_Output(self,other,"DIA_Ass_126_Haniar_FinalTalk_01_05");	//Ах вот оно что. Ну конечно! Мой старый друг Гонсалес тоже тут.
	AI_Output(self,other,"DIA_Ass_126_Haniar_FinalTalk_01_06");	//Теперь мне понятно, каким образом ты смог справиться с моими слугами.
	AI_Output(self,other,"DIA_Ass_126_Haniar_FinalTalk_01_07");	//А ты, Гонсалес, все так же мечтаешь о том, чтобы отомстить мне?
	AI_Output(self,other,"DIA_Ass_126_Haniar_FinalTalk_01_08");	//Вижу по глазам, что так оно и есть. Но, боюсь, я тебя огорчу.
	AI_Output(self,other,"DIA_Ass_126_Haniar_FinalTalk_01_09");	//Если и раньше ты в мне в подметки не годился, то теперь я запросто сокрушу тебя безо всяких усилий.
	AI_Output(other,self,"DIA_Ass_126_Haniar_FinalTalk_01_10");	//Ну, это мы еще посмотрим.
	AI_Output(self,other,"DIA_Ass_126_Haniar_FinalTalk_01_11");	//Твоя самоуверенность лишь показывает твою глупость!
	AI_Output(self,other,"DIA_Ass_126_Haniar_FinalTalk_01_12");	//Что же, тогда ты на своей же шкуре ощутишь всю мощь моего повелителя.
	AI_Output(other,self,"DIA_Ass_126_Haniar_FinalTalk_01_13");	//Так ты, оказывается, сам лишь слуга? И где же твой хозяин?
	AI_Output(self,other,"DIA_Ass_126_Haniar_FinalTalk_01_14");	//Его покои находятся во внутреннем святилище храма. Но тебе туда никогда не попасть.
	AI_Output(other,self,"DIA_Ass_126_Haniar_FinalTalk_01_15");	//Если я тебя убью, это может сработать.
	AI_Output(self,other,"DIA_Ass_126_Haniar_FinalTalk_01_16");	//Жалкий червяк! Тогда попробуй это сделать. Во имя Белиара!
	PlayerIsPrioratFake = TRUE;
	self.flags = FALSE;
	self.aivar[AIV_EnemyOverride] = FALSE;
	self.aivar[AIV_INVINCIBLE] = FALSE;
	Info_ClearChoices(DIA_Ass_126_Haniar_FinalTalk);
	Info_AddChoice(DIA_Ass_126_Haniar_FinalTalk,Dialog_Ende,DIA_Ass_126_Haniar_FinalTalk_None);
};

func void DIA_Ass_126_Haniar_FinalTalk_None()
{
	AI_StopProcessInfos(self);
	TempleIsClear = TRUE;
	Snd_Play("MFX_FEAR_CAST");
	B_Attack(self,other,AR_KILL,0);
};