
instance DMT_1213_MORIUS_EXIT(C_Info)
{
	npc = dmt_1213_morius;
	nr = 999;
	condition = dmt_1213_morius_exit_condition;
	information = dmt_1213_morius_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dmt_1213_morius_exit_condition()
{
	return TRUE;
};

func void dmt_1213_morius_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DMT_1213_MORIUS_HELLO(C_Info)
{
	npc = dmt_1213_morius;
	condition = dmt_1213_morius_hello_condition;
	information = dmt_1213_morius_hello_info;
	important = TRUE;
	permanent = FALSE;
};


func int dmt_1213_morius_hello_condition()
{
	if((MIS_GUARDIANSTEST == LOG_Running) && (DAGOT_AGREE == TRUE))
	{
		return TRUE;
	};
};

func void dmt_1213_morius_hello_info()
{
	AI_Output(self,other,"DMT_1213_Morius_Hello_00");	//Итак, ты здесь.
	AI_Output(self,other,"DMT_1213_Morius_Hello_01");	//Дагот мне много рассказывал о тебе.
	AI_Output(self,other,"DMT_1213_Morius_Hello_02");	//И про твою победу над Люцианом, хоть и не без помощи одного из Асгардов.
	AI_Output(self,other,"DMT_1213_Morius_Hello_03");	//Воистину, ты - любимец богов!
	AI_Output(other,self,"DMT_1213_Morius_Hello_04");	//Так ты... Хранитель? Значит, я нашел тебя. А мне уже казалось, что я проведу в этих поисках остаток своей жизни.
	AI_Output(self,other,"DMT_1213_Morius_Hello_05");	//Ты не мог меня не найти.
	AI_Output(self,other,"DMT_1213_Morius_Hello_06");	//Так, ладно. Дагот любит, чтоб все было по правилам, поэтому я задам глупый вопрос. Что тебе нужно от меня?
	AI_Output(other,self,"DMT_1213_Morius_Hello_07");	//Я пришел испросить у тебя твое согласие на посвящение меня в адепты Круга Хранителей, мастер.
	AI_Output(self,other,"DMT_1213_Morius_Hello_08");	//О стихии, как неожиданно! Но ты же знаешь, что прежде ты должен выполнить одно мое условие?
	AI_Output(other,self,"DMT_1213_Morius_Hello_09");	//Да, мастер. Я должен пройти твое испытание.
	AI_Output(self,other,"DMT_1213_Morius_Hello_10");	//Хорошо, тогда не будем попусту тратить время. Ты готов принять мое испытание?
	B_RemoveNpc(dmt_1212_dagot);
	Info_ClearChoices(dmt_1213_morius_hello);
	Info_AddChoice(dmt_1213_morius_hello,"Да, мастер. Я готов.",dmt_1213_morius_hello_test);
};

func void dmt_1213_morius_hello_test()
{
	AI_Output(other,self,"DMT_1213_Morius_Hello_11");	//Да, мастер. Я готов.
	Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_Output(self,other,"DMT_1213_Morius_Hello_12");	//Отлично. Итак, я - Мориус, второй страж бога Белиара и восьмой Хранитель священных Чертогов Вакхана, - даю тебе твое второе испытание...
	AI_Output(self,other,"DMT_1213_Morius_Hello_13");	//Слушай же внимательно.
	AI_Output(self,other,"DMT_1213_Morius_Hello_14");	//То, что Люциан мертв, - это, конечно, хорошо. Но ваши с Даготом действия вызвали гнев Бога Тьмы.
	AI_Output(self,other,"DMT_1213_Morius_Hello_15");	//Этот демон был сборщиком душ для Темного бога. Он пожирал души своих жертв для своего хозяина.
	AI_Output(self,other,"DMT_1213_Morius_Hello_16");	//Мы - Хранители - не можем допустить этого и, естественно, знаем, как укротить ярость Темного бога.
	AI_Output(self,other,"DMT_1213_Morius_Hello_17");	//В общем, твое второе задание состоит в том, чтобы вернуть Белиару эти души и сменить его гнев на милость.
	AI_Output(other,self,"DMT_1213_Morius_Hello_18");	//И что же это за приношение? Надеюсь, мне не придется приносить в жертву человека?!
	AI_Output(self,other,"DMT_1213_Morius_Hello_19");	//Нет. Когда ты убил демона, ты взял его сердце. Само оно по себе ничем ни отличается от сердца обычного демона.
	AI_Output(self,other,"DMT_1213_Morius_Hello_20");	//Кроме одного. В этом сердце хранятся души тех, кто пал жертвой этого демона. Люциан пожирал не только плоть, но и души убиенных.
	AI_Output(self,other,"DMT_1213_Morius_Hello_21");	//Вот почему Белиар так разгневался, когда Люциан был низвержен. Ему нужны эти души.
	AI_Output(other,self,"DMT_1213_Morius_Hello_22");	//И как нам ему вернуть их?
	AI_Output(self,other,"DMT_1213_Morius_Hello_23");	//Все достаточно просто. Души можно извлечь из сердца демона, а в монастыре у магов Огня есть книга, в которой указан способ, как это можно реализовать.
	AI_Output(self,other,"DMT_1213_Morius_Hello_24");	//Найди эту книгу и сделай все по инструкции. А потом отправляйся к ближайшему алтарю Темного бога и отслужи ему молебен, принеся в дар то, о чем говорится в книге.
	AI_Output(self,other,"DMT_1213_Morius_Hello_26");	//Вот, - возьми сердце. Береги его!
	B_GiveInvItems(self,other,itat_luzianheart,1);
	AI_Output(self,other,"DMT_1213_Morius_Hello_27");	//Да, и еще. Не забывай про кольцо, которое тебе дал Дагот. И помни, что Белиар коварен и жесток даже к тем, кто ему служит.
	AI_Output(self,other,"DMT_1213_Morius_Hello_28");	//Сделай все, что я тебе сказал, - и ты получишь мое согласие. Ступай.
	AI_StopProcessInfos(self);
	MIS_MORIUSTEST = LOG_Running;
	Log_CreateTopic(TOPIC_MORIUSTEST,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MORIUSTEST,LOG_Running);
	B_LogEntry(TOPIC_MORIUSTEST,"Хранитель Мориус - второй Страж бога Белиара и восьмой Хранитель священных Чертогов Вакхана, - поручил мне принести в жертву Темному богу души созданий, убитых Люцианом. Его сердце удерживает собранные души, а в монастыре хранится книга с описанием, как можно извлечь души из сердца демона. Если я выполню все, о чем говорил Мориус, - я пройду его испытание.");
	MORIUS_AGREE = FALSE;
	SOUL_PRAY = FALSE;
	READ_SOULRIVER = FALSE;
	SOULRIVER = FALSE;
	MORIUS_MEET = TRUE;
	PARLAN_SOULRIVER = FALSE;
	SOUL_PRAY_BLESSED = FALSE;
	Wld_InsertItem(itwr_soulriver,"FP_NW_ITEM_LIBRARY_IRDORATHBOOK");
};


instance DMT_1213_MORIUS_TEST(C_Info)
{
	npc = dmt_1213_morius;
	nr = 1;
	condition = dmt_1213_morius_test_condition;
	information = dmt_1213_morius_test_info;
	permanent = FALSE;
	description = "Я выполнил то, что ты просил.";
};


func int dmt_1213_morius_test_condition()
{
	if((MIS_GUARDIANSTEST == LOG_Running) && (MIS_MORIUSTEST == LOG_Running) && (SOUL_PRAY == TRUE) && (SOUL_PRAY_AFTER_END == TRUE) && (MORIUS_AGREE == FALSE))
	{
		return TRUE;
	};
};

func void dmt_1213_morius_test_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DMT_1213_Morius_Test_00");	//Я выполнил то, что ты просил, - заплатил дань Темному богу!
	AI_Output(self,other,"DMT_1213_Morius_Test_01");	//(могущественно) Да... я это почувствовал, как только Белиар принял твой дар.
	AI_Output(self,other,"DMT_1213_Morius_Test_02");	//Темный бог получил что хотел, и теперь все встало на свои места.
	MIS_MORIUSTEST = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_MORIUSTEST,LOG_SUCCESS);
	B_LogEntry(TOPIC_MORIUSTEST,"Я провел ритуал подношения Темному богу и тем самым прошел свое второе испытание Хранителей.");
	Info_ClearChoices(dmt_1213_morius_test);
	Info_AddChoice(dmt_1213_morius_test,"Теперь ты дашь мне свое согласие, мастер?",dmt_1213_morius_test_pass);
};

func void dmt_1213_morius_test_pass()
{
	AI_Output(other,self,"DMT_1213_Morius_Test_03");	//Теперь ты дашь мне свое согласие, мастер?
	Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_Output(self,other,"DMT_1213_Morius_Test_04");	//Да, конечно. Ты выполнил все как надо, и поэтому я даю его тебе.
	if(SAFEYOURING == TRUE)
	{
		AI_Output(self,other,"DMT_1213_Morius_Test_05");	//Кроме того, я знаю, что Белиар покушался и на твою душу. Лишь сила кольца спасла тебя от его проклятия!
		AI_Output(self,other,"DMT_1213_Morius_Test_06");	//И ты, как я вижу, проявил мудрость, не забыв моего совета.
		AI_Output(self,other,"DMT_1213_Morius_Test_07");	//Теперь ищи следующего из нас. И да пребудет с тобой сила стихий!
		AI_Output(self,other,"DMT_1213_Morius_Test_08");	//Прощай!
		B_LogEntry(TOPIC_GUARDIANSTEST,"Я получил согласие Хранителя Мориуса. Теперь я должен искать следующего Хранителя.");
		MORIUS_AGREE = TRUE;
		Info_ClearChoices(dmt_1213_morius_test);
		Info_AddChoice(dmt_1213_morius_test,"(закончить разговор)",dmt_1213_morius_test_end);
	}
	else
	{
		AI_Output(self,other,"DMT_1213_Morius_Test_09");	//Кроме того, я знаю, что Белиар покушался и на твою душу. И, как я вижу, ему это отчасти удалось...(разочарованно)
		AI_Output(self,other,"DMT_1213_Morius_Test_10");	//То кольцо, которое ты получил от первого из Хранителей, могло бы спасти тебя от его проклятия. Но теперь уже слишком поздно!
		AI_Output(self,other,"DMT_1213_Morius_Test_11");	//Ты сам сделал свой выбор. И тебе придется жить с этим все оставшееся время!
		AI_Output(other,self,"DMT_1213_Morius_Test_12");	//То есть я не смогу его снять?
		AI_Output(self,other,"DMT_1213_Morius_Test_13");	//Не думаю...(задумчиво) Возможно, маги Инноса помогут тебе в этом.
		AI_Output(self,other,"DMT_1213_Morius_Test_14");	//А теперь ступай. Ищи следующего из нас. И да пребудет с тобой сила стихий!
		AI_Output(self,other,"DMT_1213_Morius_Test_15");	//Прощай!
		B_LogEntry(TOPIC_GUARDIANSTEST,"Я получил согласие Хранителя Мориуса. Теперь я должен искать следующего Хранителя.");
		Log_AddEntry(TOPIC_BELIARCURSE,"Хранитель Мориус посоветовал мне обратиться к магам Огня. Возможно, они помогут мне избавиться от проклятия Белиара.");
		MORIUS_AGREE = TRUE;
		Info_ClearChoices(dmt_1213_morius_test);
		Info_AddChoice(dmt_1213_morius_test,"(закончить разговор)",dmt_1213_morius_test_end);
	};
};

func void dmt_1213_morius_test_end()
{
	Npc_ExchangeRoutine(self,"WaitInSecretLab");
	AI_StopProcessInfos(self);
	B_Attack(self,other,0,0);
};

