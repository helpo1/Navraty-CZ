
instance DMT_1216_DEMOS_EXIT(C_Info)
{
	npc = dmt_1216_demos;
	nr = 999;
	condition = dmt_1216_demos_exit_condition;
	information = dmt_1216_demos_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dmt_1216_demos_exit_condition()
{
	return TRUE;
};

func void dmt_1216_demos_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DMT_1216_DEMOS_HELLO(C_Info)
{
	npc = dmt_1216_demos;
	nr = 1;
	condition = dmt_1216_demos_hello_condition;
	information = dmt_1216_demos_hello_info;
	important = TRUE;
	permanent = FALSE;
};


func int dmt_1216_demos_hello_condition()
{
	if((MIS_GUARDIANSTEST == LOG_Running) && (KELIOS_AGREE == TRUE))
	{
		return TRUE;
	};
};

func void dmt_1216_demos_hello_info()
{
	AI_Output(self,other,"DMT_1216_Demos_Hello_00");	//(вкрадчиво) Приветствую тебя, путник. Вот и настало время нам с тобой встретиться.
	AI_Output(other,self,"DMT_1216_Demos_Hello_01");	//Кто ты?
	AI_Output(self,other,"DMT_1216_Demos_Hello_02");	//Мое имя Демос, и я второй страж своего создателя Инноса и Хранитель священного огня Баала.
	AI_Output(self,other,"DMT_1216_Demos_Hello_03");	//Думаю, ты догадываешься, почему я здесь?
	AI_Output(other,self,"DMT_1216_Demos_Hello_04");	//Да, мастер. Я должен пройти твое испытание и получить твое согласие на принятие меня в адепты Круга Хранителей.
	AI_Output(self,other,"DMT_1216_Demos_Hello_05");	//Все верно...(могущественно) А раз так, то не будем отвлекаться на пустую болтовню.
	AI_Output(self,other,"DMT_1216_Demos_Hello_06");	//Ты готов принять его?
	Info_ClearChoices(dmt_1216_demos_hello);
	Info_AddChoice(dmt_1216_demos_hello,"Я готов.",dmt_1216_demos_hello_test);
};

func void dmt_1216_demos_hello_test()
{
	AI_Output(other,self,"DMT_1216_Demos_Hello_07");	//Я готов.
	Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_Output(self,other,"DMT_1216_Demos_Hello_08");	//Хорошо. Слушай меня внимательно.
	AI_Output(self,other,"DMT_1216_Demos_Hello_09");	//Чтобы пройти свое следующее испытание, тебе придется отправиться в место, именуемое Гадесом!
	AI_Output(other,self,"DMT_1216_Demos_Hello_10");	//Гадес?
	AI_Output(self,other,"DMT_1216_Demos_Hello_11");	//Это имя ему дали древние в те времена, когда человечество еще только начинало свой нелегкий путь в этом мире.
	AI_Output(self,other,"DMT_1216_Demos_Hello_12");	//Но чтобы тебе было более понятно, я скажу проще: вы - люди - когда-то нарекли это некогда прекрасное место Долиной Рудников!
	AI_Output(self,other,"DMT_1216_Demos_Hello_13");	//Думаю, это название тебе уже хорошо знакомо.
	AI_Output(other,self,"DMT_1216_Demos_Hello_14");	//Конечно, я был в ней заключенным.
	AI_Output(self,other,"DMT_1216_Demos_Hello_15");	//Сейчас мы не будем вдаваться в подробности. Тебя сейчас должно волновать другое.
	AI_Output(other,self,"DMT_1216_Demos_Hello_16");	//И что же?
	AI_Output(self,other,"DMT_1216_Demos_Hello_17");	//Там, в долине, некогда был сокрыт один из артефактов древности, обладающий невероятной магической силой!
	AI_Output(other,self,"DMT_1216_Demos_Hello_18");	//Что это был за предмет?
	AI_Output(self,other,"DMT_1216_Demos_Hello_19");	//У него нет какого-то определенного названия, но его сущность олицетворяет противоположность моего создателя.
	AI_Output(self,other,"DMT_1216_Demos_Hello_20");	//Думаю, тебе не составит труда понять, о чем именно идет речь.
	AI_Output(self,other,"DMT_1216_Demos_Hello_21");	//В свое время этим артефактом владели орки, которые на протяжении тысячелетий были хозяевами этих земель.
	AI_Output(self,other,"DMT_1216_Demos_Hello_22");	//Пока, естественно, сюда не пришли вы - люди!
	AI_Output(self,other,"DMT_1216_Demos_Hello_23");	//Опасаясь, что этот предмет будет навсегда ими утерян, орки сокрыли его в одном из своих священных мест.
	AI_Output(self,other,"DMT_1216_Demos_Hello_24");	//Где именно, я сказать не могу.
	AI_Output(self,other,"DMT_1216_Demos_Hello_25");	//Но уверен, что с твоей помощью мне удастся это все-таки узнать.
	AI_Output(other,self,"DMT_1216_Demos_Hello_26");	//Ты хочешь, чтобы я отыскал его для тебя?
	AI_Output(self,other,"DMT_1216_Demos_Hello_27");	//Совершенно верно. Принеси мне этот артефакт, и ты получишь мое согласие!
	AI_Output(other,self,"DMT_1216_Demos_Hello_28");	//М-да, задачка, кажется, не из простых.
	AI_Output(self,other,"DMT_1216_Demos_Hello_32");	//Хорошо...(вкрадчиво) Тогда ступай, и пусть священный огонь поможет тебе в твоих поисках.
	AI_StopProcessInfos(self);
	MIS_DEMOSTEST = LOG_Running;
	Log_CreateTopic(TOPIC_DEMOSTEST,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DEMOSTEST,LOG_Running);
	B_LogEntry(TOPIC_DEMOSTEST,"Демос, Хранитель огненной стихии, дал мне очередное испытание. Я должен найти артефакт, сокрытый в Долине Рудников. Предмет моих поисков по своей сути противоположен творцу стражей Огня. Орки - его последние хозяева - спрятали артефакт в одном из своих священных мест.");
};

instance DMT_1216_DEMOS_TEST(C_Info)
{
	npc = dmt_1216_demos;
	nr = 1;
	condition = dmt_1216_demos_test_condition;
	information = dmt_1216_demos_test_info;
	permanent = FALSE;
	description = "Я, кажется, нашел нужный тебе артефакт.";
};


func int dmt_1216_demos_test_condition()
{
	if((MIS_GUARDIANSTEST == LOG_Running) && (MIS_DEMOSTEST == LOG_Running) && (Npc_HasItems(other,itmi_idol_02) >= 1))
	{
		return TRUE;
	};
};

func void dmt_1216_demos_test_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DMT_1216_Demos_Test_00");	//Я, кажется, нашел нужный тебе артефакт.
	AI_Output(self,other,"DMT_1216_Demos_Test_01");	//Если ты так уверен в этом, то просто дай мне на него взглянуть.
	AI_Output(other,self,"DMT_1216_Demos_Test_02");	//Вот он, мастер.
	B_GiveInvItems(other,self,itmi_idol_02,1);
	Npc_RemoveInvItems(self,itmi_idol_02,1);
	AI_Output(self,other,"DMT_1216_Demos_Test_03");	//(внимательно вглядываясь) Да, это действительно он.
	AI_Output(self,other,"DMT_1216_Demos_Test_04");	//Облик Тьмы - третья сущность темного бога...(могущественно) И теперь благодаря тебе она в надежных руках Хранителей.
	AI_Output(other,self,"DMT_1216_Demos_Test_05");	//Третья сущность? Что это значит?
	AI_Output(self,other,"DMT_1216_Demos_Test_08");	//Хммм...(вкрадчиво) Если хочешь, то я могу поведать тебе о них.
	AI_Output(self,other,"DMT_1216_Demos_Test_09");	//В конце концов, ты заслужил право знать, ради чего рисковал своей жизнью.
	AI_Output(other,self,"DMT_1216_Demos_Test_10");	//У меня как раз есть время выслушать твой рассказ.
	AI_Output(self,other,"DMT_1216_Demos_Test_11");	//Хорошо. Ответь, ты когда-нибудь слышал про священные Залы Ирдората?
	if(ItWr_SCReadsHallsofIrdorath == TRUE)
	{
		AI_Output(other,self,"DMT_1216_Demos_Test_12");	//Да, я о них слышал.
		AI_Output(self,other,"DMT_1216_Demos_Test_13");	//Тогда ты должен знать, что эти залы есть не что иное, как чертоги самого Зверя!
		AI_Output(self,other,"DMT_1216_Demos_Test_14");	//И, соответственно, место заклинания самого темного бога...
	}
	else
	{
		AI_Output(other,self,"DMT_1216_Demos_Test_15");	//Нет. Первый раз слышу о них.
		AI_Output(self,other,"DMT_1216_Demos_Test_16");	//(могущественно) Тогда знай же, что Залы Ирдората есть не что иное, как чертоги самого Зверя!
		AI_Output(self,other,"DMT_1216_Demos_Test_17");	//И, соответственно, место заклинания самого темного бога...
	};
	AI_Output(self,other,"DMT_1216_Demos_Test_18");	//Всего существует четыре подобных храма.
	AI_Output(self,other,"DMT_1216_Demos_Test_19");	//Точнее, их было четыре, пока паладины Инноса не разрушили первые два.
	AI_Output(self,other,"DMT_1216_Demos_Test_20");	//В свою очередь каждое из этих мест черпает свою силу в древних артефактах, в коих сам Белиар заключил часть своей божественной силы.
	AI_Output(self,other,"DMT_1216_Demos_Test_21");	//Эта сила и являет сущность повелителя багровой Тьмы!
	AI_Output(other,self,"DMT_1216_Demos_Test_22");	//Понятно. Значит, всего должно существовать четыре подобных артефакта?
	AI_Output(self,other,"DMT_1216_Demos_Test_23");	//Так оно и есть. Их всего четыре. И один из них ты уже видел.
	AI_Output(other,self,"DMT_1216_Demos_Test_24");	//А где можно найти остальные три?
	AI_Output(self,other,"DMT_1216_Demos_Test_25");	//(ухмыляется) Думаю, тебе не стоит уж слишком сильно интересоваться всем этим.
	AI_Output(other,self,"DMT_1216_Demos_Test_26");	//Но почему?
	AI_Output(self,other,"DMT_1216_Demos_Test_27");	//Даже если ты найдешь их, то все равно не сможешь овладеть той силой, что сокрыта в этих предметах.
	AI_Output(self,other,"DMT_1216_Demos_Test_28");	//Это и Хранителям-то не под силу, не говоря уже о простых смертных!
	AI_Output(self,other,"DMT_1216_Demos_Test_29");	//Так что лучше оставь свои мысли об этом. Ты только зря потратишь свое время.
	AI_Output(other,self,"DMT_1216_Demos_Test_30");	//Хорошо, как скажешь.
	AI_Output(self,other,"DMT_1216_Demos_Test_31");	//(серьезно) Теперь давай вернемся к твоему испытанию.
	AI_Output(self,other,"DMT_1216_Demos_Test_32");	//По моему мнению, ты его успешно прошел и, безусловно, заслужил мое согласие на принятие тебя в адепты нашего Круга!
	KNOWABOUTIRDORAT = TRUE;
	MIS_DEMOSTEST = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_DEMOSTEST,LOG_SUCCESS);
	B_LogEntry(TOPIC_DEMOSTEST,"Я принес Демосу артефакт, о котором он говорил, и он признал мое испытание пройденным.");
	Info_ClearChoices(dmt_1216_demos_test);
	Info_AddChoice(dmt_1216_demos_test,"Да, мастер.",dmt_1216_demos_test_pass);
};

func void dmt_1216_demos_test_pass()
{
	AI_Output(other,self,"DMT_1216_Demos_Test_33");	//Да, мастер.
	Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_Output(self,other,"DMT_1216_Demos_Test_34");	//И властью, данной мне творцом, я вписываю свое решение в Книгу судеб...(могущественно) Да будет так!
	AI_Output(self,other,"DMT_1216_Demos_Test_35");	//Теперь продолжай свой путь. Ищи Хранителя Фариона - третьего из нас, стражей Огня. Он даст тебе следующее испытание.
	AI_Output(self,other,"DMT_1216_Demos_Test_36");	//Прощай!
	B_LogEntry(TOPIC_GUARDIANSTEST,"Хранитель Демос дал свое согласие на принятие меня в адепты. Теперь мне необходимо найти Хранителя Фариона - последнего из стражей Огня. Он даст мне следующее испытание.");
	DEMOS_AGREE = TRUE;
	Info_ClearChoices(dmt_1216_demos_test);
	Info_AddChoice(dmt_1216_demos_test,"(закончить разговор)",dmt_1216_demos_test_end);
};

func void dmt_1216_demos_test_end()
{
	Npc_ExchangeRoutine(self,"WaitInSecretLab");
	AI_StopProcessInfos(self);
	B_Attack(self,other,0,0);
};

