
const int BONUSSTR = 15;
const int BONUSDEX = 15;
const int BONUSMAN = 100;
const int BONUSHEA = 150;

instance DMT_1297_STONNOS_EXIT(C_Info)
{
	npc = dmt_1297_stonnos;
	nr = 999;
	condition = dmt_1297_stonnos_exit_condition;
	information = dmt_1297_stonnos_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dmt_1297_stonnos_exit_condition()
{
	if((GUARDIANADEPT == TRUE) && (CHOOSENATUREISDONE == FALSE))
	{
		return FALSE;
	};
	return TRUE;
};

func void dmt_1297_stonnos_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DMT_1297_STONNOS_HELLO(C_Info)
{
	npc = dmt_1297_stonnos;
	condition = dmt_1297_stonnos_hello_condition;
	information = dmt_1297_stonnos_hello_info;
	important = TRUE;
	permanent = FALSE;
};


func int dmt_1297_stonnos_hello_condition()
{
	if((MIS_GUARDIANSTEST == LOG_Running) && (WAKON_AGREE == TRUE))
	{
		return TRUE;
	};
};

func void dmt_1297_stonnos_hello_info()
{
	AI_Output(self,other,"DMT_1297_Stonnos_Hello_00");	//(властно) Наконец-то пришло время нам с тобой повстречаться, смертный!
	AI_Output(self,other,"DMT_1297_Stonnos_Hello_01");	//Не стану от тебя скрывать, что я с большим интересом ожидал нашей встречи.
	AI_Output(self,other,"DMT_1297_Stonnos_Hello_02");	//И не сомневаюсь, что ты также в свою очередь догадался - кто я такой и зачем сейчас здесь...(могущественно) Не так ли?
	AI_Output(other,self,"DMT_1297_Stonnos_Hello_03");	//Думаю, ты - Хранитель Стоннос, самый могущественный из Стражей Стихий и глава божественного Круга Хранителей.
	AI_Output(self,other,"DMT_1297_Stonnos_Hello_04");	//Все верно, человек.
	AI_Output(self,other,"DMT_1297_Stonnos_Hello_07");	//Итак. Настало время тебе закончить тот путь, на который ты вступил и наконец-то стать тем, кем тебе предначертано быть.
	AI_Output(self,other,"DMT_1297_Stonnos_Hello_08");	//Но вначале тебе необходимо будет пройти еще одно испытание, которое мы, Хранители, именуем как Испытание Веры!
	AI_Output(self,other,"DMT_1297_Stonnos_Hello_09");	//Пройдя его, ты докажешь, что целиком и полностью осознаешь свой выбор и готов пожертвовать всем ради воплощения в жизнь наших священных замыслов.
	Info_ClearChoices(dmt_1297_stonnos_hello);
	Info_AddChoice(dmt_1297_stonnos_hello,"А в чем заключается мое Испытание Веры, мастер?",dmt_1297_stonnos_hello_test);
};

func void dmt_1297_stonnos_hello_test()
{
	AI_Output(other,self,"DMT_1297_Stonnos_Hello_11");	//В чем заключается мое Испытание Веры, мастер?
	Wld_PlayEffect("spellFX_INCOVATION_WHITE",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_Output(self,other,"DMT_1297_Stonnos_Hello_12");	//Тебе необходимо отыскать и принести мне четыре древних магических артефакта, именуемых Сферами.
	AI_Output(self,other,"DMT_1297_Stonnos_Hello_13");	//Эти древнейшие реликвии являют собой источник магии каждой из существующих стихий и дают власть над их созданиями.
	AI_Output(self,other,"DMT_1297_Stonnos_Hello_14");	//Однако сами по себе Сферы не являются творением богов или самих сил природы. Их сущность заключена исключительно в магии!
	AI_Output(self,other,"DMT_1297_Stonnos_Hello_15");	//Поэтому обычно появление сиих артефактов в этом мире вызвано сильнейшими магическими волнениями - и ничем более.
	AI_Output(self,other,"DMT_1297_Stonnos_Hello_20");	//Разрушив магический барьер и уничтожив Спящего, ты вызвал мощнейший магический взрыв, что в свою очередь породило появление магических сфер в этой части мира.
	AI_Output(self,other,"DMT_1297_Stonnos_Hello_24");	//Каждая Сфера обладает собственной волей и окружает себя различными созданиями с целью собственной защиты.
	AI_Output(self,other,"DMT_1297_Stonnos_Hello_28");	//Теперь иди, человек! И помни, что от твоих действий зависит твое дальнейшее будущее.
	AI_StopProcessInfos(self);
	MIS_STONNOSTEST = LOG_Running;
	Log_CreateTopic(TOPIC_STONNOSTEST,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_STONNOSTEST,LOG_Running);
	B_LogEntry(TOPIC_STONNOSTEST,"Я повстречал главного Хранителя – Стонноса, назначившего мне Испытание Веры. После его прохождения меня примут в адепты Круга Хранителей. Для этого необходимо отыскать и принести Стонносу четыре магических Сферы стихий. Найти их будет непросто и крайне опасно. Но ведь мне не привыкать к трудностям?");
};


instance DMT_1297_STONNOS_TESTFAIL(C_Info)
{
	npc = dmt_1297_stonnos;
	nr = 1;
	condition = dmt_1297_stonnos_testfail_condition;
	information = dmt_1297_stonnos_testfail_info;
	permanent = FALSE;
	description = "По поводу твоего поручения, мастер...";
};


func int dmt_1297_stonnos_testfail_condition()
{
	if((MIS_STONNOSTEST == LOG_Running) && (CRESTNATUREISDONE == TRUE))
	{
		return TRUE;
	};
};

func void dmt_1297_stonnos_testfail_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DMT_1297_Stonnos_TestFail_00");	//По поводу твоего поручения, мастер...
	AI_Output(self,other,"DMT_1297_Stonnos_TestFail_01");	//Да, человек?
	AI_Output(other,self,"DMT_1297_Stonnos_TestFail_02");	//Боюсь, я не смогу принести тебе эти Сферы Стихий, поскольку их больше нет.
	AI_Output(other,self,"DMT_1297_Stonnos_TestFail_04");	//Я использовал эти артефакты для создания одной магической руны, чтобы с ее помощью уничтожить могущественного демона по имени С'эньяк.
	AI_Output(self,other,"DMT_1297_Stonnos_TestFail_05");	//(крайне удивленно) С'эньяк?! Древнейший архидемон Лэнга?
	AI_Output(self,other,"DMT_1297_Stonnos_TestFail_07");	//(задумчиво) Ну что ж, должен признать, это довольно непредвиденный ход событий.
	AI_Output(self,other,"DMT_1297_Stonnos_TestFail_08");	//Я и представить себе не мог, что обычному смертному такое под силу!
	AI_Output(other,self,"DMT_1297_Stonnos_TestFail_10");	//У меня просто не было выбора.
	AI_Output(other,self,"DMT_1297_Stonnos_TestFail_12");	//И что теперь будет с моим Испытанием Веры?
	AI_Output(self,other,"DMT_1297_Stonnos_TestFail_13");	//Хммм... Ты разочаровал меня.
	AI_Output(self,other,"DMT_1297_Stonnos_TestFail_14");	//Однако, если посмотреть на все это немного с другой стороны, - то, возможно, последствия твоего выбора оказались нам только на руку.
	AI_Output(self,other,"DMT_1297_Stonnos_TestFail_15");	//Так что, после небольших раздумий, я пришел к выводу... что будет правильным признать твое испытание пройденным.
	MIS_STONNOSTEST = LOG_SUCCESS;
	MIS_GUARDIANSTEST = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_STONNOSTEST,LOG_SUCCESS);
	Log_SetTopicStatus(TOPIC_GUARDIANSTEST,LOG_SUCCESS);
	B_LogEntry(TOPIC_STONNOSTEST,"Несмотря на то, что я не смог принести сферы Хранителю Стонносу, он посчитал, что я все-таки смог пройти его Испытание Веры.");
	Log_AddEntry(TOPIC_GUARDIANSTEST,"Я прошел все испытания Хранителей. Думаю, теперь я наконец-то удостоюсь чести стать адептом божественного Круга Хранителей!");
	Info_ClearChoices(dmt_1297_stonnos_testfail);
	Info_AddChoice(dmt_1297_stonnos_testfail,"Значит, я все-таки смогу вступить в Круг Хранителей?",dmt_1297_stonnos_testdone_pass);
};

instance DMT_1297_STONNOS_TESTDONE(C_Info)
{
	npc = dmt_1297_stonnos;
	nr = 1;
	condition = dmt_1297_stonnos_testdone_condition;
	information = dmt_1297_stonnos_testdone_info;
	permanent = FALSE;
	description = "Я принес тебе Сферы Стихий, мастер.";
};

func int dmt_1297_stonnos_testdone_condition()
{
	if((MIS_STONNOSTEST == LOG_Running) && (CRESTNATUREISDONE == FALSE) && (Npc_HasItems(other,itmi_fireshpere) >= 1) && (Npc_HasItems(other,itmi_watershpere) >= 1) && (Npc_HasItems(other,itmi_stoneshpere) >= 1) && (Npc_HasItems(other,itmi_darkshpere) >= 1))
	{
		return TRUE;
	};
};

func void dmt_1297_stonnos_testdone_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DMT_1297_Stonnos_TestDone_00");	//Я принес тебе Сферы Стихий, мастер.
	Npc_RemoveInvItems(other,itmi_fireshpere,1);
	Npc_RemoveInvItems(other,itmi_watershpere,1);
	Npc_RemoveInvItems(other,itmi_stoneshpere,1);
	Npc_RemoveInvItems(other,itmi_darkshpere,1);
	b_giveinvitemsmanythings(other,self);
	AI_Output(self,other,"DMT_1297_Stonnos_TestDone_03");	//Да, все верно...(властно) Это они - божественные артефакты древности, порожденные магией самих создателей.
	AI_Output(self,other,"DMT_1297_Stonnos_TestDone_07");	//Ты справился с испытанием!
	AI_Output(self,other,"DMT_1297_Stonnos_TestDone_08");	//И по моему мнению, безусловно, заслужил того, чтобы стать одним из нас.
	MISSSHEPREFOREVER = TRUE;
	MIS_STONNOSTEST = LOG_SUCCESS;
	MIS_GUARDIANSTEST = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_GUARDIANSTEST,LOG_SUCCESS);
	Log_SetTopicStatus(TOPIC_STONNOSTEST,LOG_SUCCESS);
	B_LogEntry(TOPIC_STONNOSTEST,"После того, как я принес Хранителю Стонносу все Сферы Стихий, он объявил, что я смог пройти его Испытание Веры...");
	Log_AddEntry(TOPIC_GUARDIANSTEST,"Я прошел все испытания Хранителей. Думаю, теперь я наконец-то удостоюсь чести стать адептом божественного Круга Хранителей!");
	Info_ClearChoices(dmt_1297_stonnos_testdone);
	Info_AddChoice(dmt_1297_stonnos_testdone,"Значит, теперь я смогу вступить в Круг Хранителей?",dmt_1297_stonnos_testdone_pass);
};

func void dmt_1297_stonnos_testdone_pass()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DMT_1297_Stonnos_TestDone_Pass_01");	//Значит, я смогу вступить в Круг Хранителей?
	Wld_PlayEffect("spellFX_INCOVATION_WHITE",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_Output(self,other,"DMT_1297_Stonnos_TestDone_Pass_02");	//(могущественно) Так оно и будет, человек. Ведь в этом твое предназначение!
	AI_Output(self,other,"DMT_1297_Stonnos_TestDone_Pass_03");	//Поэтому властью, данной мне создателями этого мира, я, Хранитель Стоннос, главный страж Чертогов Хаоса и божественного камня...
	AI_Output(self,other,"DMT_1297_Stonnos_TestDone_Pass_04");	//...возвожу тебя в степень Адепта Стихий, даруя это кольцо как символ твоего причастия к нашему священному Кругу!
	B_GiveInvItems(self,other,itri_guardians_02,1);
	AI_Output(self,other,"DMT_1297_Stonnos_TestDone_Pass_05");	//Отныне твоя судьба нераздельно связана с судьбами тех, кто так же как и ты избрал этот путь и дал клятву следовать ему.
	AI_Output(self,other,"DMT_1297_Stonnos_TestDone_Pass_06");	//И пусть твои решения будут мудрыми, как темные воды Хурона, а твоя вера - тверда, как божественная скала Амшора!
	AI_Output(self,other,"DMT_1297_Stonnos_TestDone_Pass_07");	//ЭРРАТ КНАР ХАК...(властно) Да будет так!
	B_LogEntry(TOPIC_GUARDIANS,"Хранитель Стоннос возвел меня в статус адепта их священного Круга - с этого момента я один из них! Правда, что теперь ждет меня впереди, я не знаю...");
	STONNOS_AGREE = TRUE;
	ADEPTGUARDIAN = TRUE;
};


instance DMT_1297_STONNOS_CHOOSENATURE(C_Info)
{
	npc = dmt_1297_stonnos;
	nr = 1;
	condition = dmt_1297_stonnos_choosenature_condition;
	information = dmt_1297_stonnos_choosenature_info;
	permanent = TRUE;
	description = "То есть теперь - я один из вас?";
};


func int dmt_1297_stonnos_choosenature_condition()
{
	if((ADEPTGUARDIAN == TRUE) && (CHOOSENATUREISDONE == FALSE))
	{
		return TRUE;
	};
};

func void dmt_1297_stonnos_choosenature_info()
{
	AI_Output(other,self,"DMT_1297_Stonnos_ChooseNature_01");	//То есть теперь я один из вас?
	AI_Output(self,other,"DMT_1297_Stonnos_ChooseNature_02");	//Да, отныне, ты - избранник Стихий!
	AI_Output(self,other,"DMT_1297_Stonnos_ChooseNature_07");	//Прежде чем ты продолжишь свой путь, тебе необходимо будет сделать еще одну вещь.
	AI_Output(self,other,"DMT_1297_Stonnos_ChooseNature_09");	//Поскольку ты теперь являешься адептом нашего Круга, тебе придется решить для себя - с какой именно из стихий ты хочешь связать свою судьбу.
	AI_Output(self,other,"DMT_1297_Stonnos_ChooseNature_10");	//(властно) Как ты уже наверно знаешь, всего их четыре - Огонь, Вода, Камень и Тьма.
	AI_Output(self,other,"DMT_1297_Stonnos_ChooseNature_11");	//Каждая из них способна даровать тебе то, что не смогут даровать остальные! Однако свой выбор ты сможешь сделать только в пользу одной.
	AI_Output(self,other,"DMT_1297_Stonnos_ChooseNature_12");	//Поэтому хорошенько подумай, прежде чем принять решение.
	Info_ClearChoices(dmt_1297_stonnos_choosenature);
	Info_AddChoice(dmt_1297_stonnos_choosenature,"Я еще подумаю, мастер.",dmt_1297_stonnos_choosenature_later);
	Info_AddChoice(dmt_1297_stonnos_choosenature,"Я выбираю стихию Тьмы, мастер.",dmt_1297_stonnos_choosenature_dark);
	Info_AddChoice(dmt_1297_stonnos_choosenature,"Я выбираю стихию Камня, мастер.",dmt_1297_stonnos_choosenature_stone);
	Info_AddChoice(dmt_1297_stonnos_choosenature,"Я выбираю стихию Воды, мастер.",dmt_1297_stonnos_choosenature_water);
	Info_AddChoice(dmt_1297_stonnos_choosenature,"Я выбираю стихию Огня, мастер.",dmt_1297_stonnos_choosenature_fire);
};

func void dmt_1297_stonnos_choosenature_later()
{
	Info_ClearChoices(dmt_1297_stonnos_choosenature);
};

func void dmt_1297_stonnos_choosenature_dark()
{
	CHOOSEDARK = TRUE;
	CHOOSENATUREISDONE = TRUE;
	AI_Print(PRINT_BONUSDARK);
	hero.protection[PROT_MAGIC] += 20;
	REALPROTMAGIC += 20;

	if(hero.guild == GIl_KDM)
	{
		if(RealMode[2] == TRUE)
		{
			CountLearnSpell += 15;		
		}
		else
		{
			CountLearnSpell += 20;
		};
	};

	Wld_PlayEffect("SPELLFX_INCOVATION_VIOLET",hero,hero,0,0,0,FALSE);
	AI_Output(other,self,"DMT_1297_Stonnos_ChooseNature_Dark_01_00");	//Я выбираю стихию Тьмы, мастер.
	AI_Output(self,other,"DMT_1297_Stonnos_ChooseNature_Dark_01_01");	//(властно) Хорошо, смертный. Пусть будет так! Ты сделал свой окончательный выбор.
	AI_Output(self,other,"DMT_1297_Stonnos_ChooseNature_Dark_01_02");	//Отныне твоя судьба будет нераздельно связана только с ней, а все твои деяния и помыслы будут направлены исключительно во благо ее величия.
	AI_Output(self,other,"DMT_1297_Stonnos_ChooseNature_Dark_01_04");	//Теперь ты должен следовать дальше по тому пути, который только что выбрал для себя.
	AI_Output(self,other,"DMT_1297_Stonnos_ChooseNature_Dark_01_07");	//Отправляйся к Хранителю Даготу! Теперь он, как главный из стражей Тьмы, станет твои наставником и учителем.
	AI_Output(other,self,"DMT_1297_Stonnos_ChooseNature_Dark_01_08");	//А где мне его искать?
	AI_Output(self,other,"DMT_1297_Stonnos_ChooseNature_Dark_01_09");	//Вот, - возьми эту магическую руну телепортации. Она приведет тебя в нужное место.
	B_GiveInvItems(self,other,itru_teleportdagot,1);
	AI_Output(self,other,"DMT_1297_Stonnos_ChooseNature_Dark_01_11");	//Теперь прощай, смертный...(могущественно) И да хранят тебя стихии!
	B_LogEntry(TOPIC_GUARDIANS,"Хранитель Стоннос предложил мне выбрать стихию, с которой я хочу связать свою дальнейшую судьбу в качестве их адепта. Я предпочел стихию Тьмы.");
	Log_AddEntry(TOPIC_GUARDIANS,"Стоннос также дал мне руну телепортации, с помощью которой я смогу отправиться в священную обитель Стражей Стихий. Там я должен буду встретиться с Хранителем Даготом, который отныне будет моим наставником.");
	Info_ClearChoices(dmt_1297_stonnos_choosenature);
	Info_AddChoice(dmt_1297_stonnos_choosenature,"(закончить разговор)",dmt_1297_stonnos_test_end);
};

func void dmt_1297_stonnos_choosenature_stone()
{
	CHOOSESTONE = TRUE;
	CHOOSENATUREISDONE = TRUE;
	AI_Print(PRINT_BONUSSTONE);
	hero.protection[PROT_EDGE] += 10;
	hero.protection[PROT_BLUNT] += 10;
	hero.protection[PROT_POINT] += 10;
	hero.protection[PROT_FLY] += 50;
	Npc_ChangeAttribute(hero,ATR_HITPOINTS_MAX,BONUSHEA);
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] + BONUSHEA;

	if(hero.guild == GIl_GUR)
	{
		if(RealMode[2] == TRUE)
		{
			CountLearnSpell += 15;		
		}
		else
		{
			CountLearnSpell += 20;
		};
	};

	Wld_PlayEffect("spellFX_INCOVATION_WHITE",hero,hero,0,0,0,FALSE);
	AI_Output(other,self,"DMT_1297_Stonnos_ChooseNature_Stone_01_00");	//Я выбираю стихию Камня, мастер.
	AI_Output(self,other,"DMT_1297_Stonnos_ChooseNature_Dark_01_01");	//(властно) Хорошо, смертный. Пусть будет так! Ты сделал свой окончательный выбор.
	AI_Output(self,other,"DMT_1297_Stonnos_ChooseNature_Dark_01_02");	//Отныне твоя судьба будет нераздельно связана только с ней, а все твои деяния и помыслы будут направлены исключительно во благо ее величия.
	AI_Output(self,other,"DMT_1297_Stonnos_ChooseNature_Stone_01_04");	//Что же касается меня, то с этого момента, как главный и единственный страж божественной Скалы, я стану твоим наставником и открою перед тобой древние таинства этой стихии.
	AI_Output(self,other,"DMT_1297_Stonnos_ChooseNature_Stone_01_05");	//Однако это будет позже. Сейчас же для начала тебе необходимо добраться до нашей священной обители, где мы и продолжим эту беседу.
	AI_Output(other,self,"DMT_1297_Stonnos_ChooseNature_Stone_01_06");	//Как я смогу туда добраться?
	AI_Output(self,other,"DMT_1297_Stonnos_ChooseNature_Dark_01_09");	//Вот, - возьми эту магическую руну телепортации. Она приведет тебя в нужное место.
	B_GiveInvItems(self,other,itru_teleportdagot,1);
	AI_Output(self,other,"DMT_1297_Stonnos_ChooseNature_Dark_01_11");	//Теперь прощай, смертный...(могущественно) И да хранят тебя стихии!
	B_LogEntry(TOPIC_GUARDIANS,"Хранитель Стоннос предложил мне выбрать стихию, с которой я хочу связать свою дальнейшую судьбу в качестве их адепта. Я предпочел стихию Камня.");
	Log_AddEntry(TOPIC_GUARDIANS,"Стоннос также дал мне руну телепортации, с помощью которой я смогу отправиться в священную обитель Стражей Стихий. Там я снова должен буду встретиться с ним, но уже в качестве его ученика.");
	Info_ClearChoices(dmt_1297_stonnos_choosenature);
	Info_AddChoice(dmt_1297_stonnos_choosenature,"(закончить разговор)",dmt_1297_stonnos_test_end);
};

func void dmt_1297_stonnos_choosenature_water()
{
	CHOOSEWATER = TRUE;
	CHOOSENATUREISDONE = TRUE;
	AI_Print(PRINT_BONUSWATER);
	NPC_DAM_DIVE_TIME = 10000000;
	Npc_ChangeAttribute(hero,ATR_MANA_MAX,BONUSMAN);
	hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA] + BONUSMAN;

	if(hero.guild == GIl_KDW)
	{
		if(RealMode[2] == TRUE)
		{
			CountLearnSpell += 15;		
		}
		else
		{
			CountLearnSpell += 20;
		};
	};

	Wld_PlayEffect("SPELLFX_INCOVATION_BLUE",hero,hero,0,0,0,FALSE);
	AI_Output(other,self,"DMT_1297_Stonnos_ChooseNature_Water_01_00");	//Я выбираю стихию Воды, мастер.
	AI_Output(self,other,"DMT_1297_Stonnos_ChooseNature_Dark_01_01");	//(властно) Хорошо, смертный. Пусть будет так! Ты сделал свой окончательный выбор.
	AI_Output(self,other,"DMT_1297_Stonnos_ChooseNature_Dark_01_02");	//Отныне твоя судьба будет нераздельно связана только с ней, а все твои деяния и помыслы будут направлены исключительно во благо ее величия.
	AI_Output(self,other,"DMT_1297_Stonnos_ChooseNature_Dark_01_04");	//Теперь ты должен следовать дальше по тому пути, который только что выбрал для себя.
	AI_Output(self,other,"DMT_1297_Stonnos_ChooseNature_Water_01_07");	//Отправляйся к Хранителю Вакону! Теперь он, как главный из стражей Воды, станет твои наставником и учителем.
	AI_Output(other,self,"DMT_1297_Stonnos_ChooseNature_Dark_01_08");	//А где мне его искать?
	AI_Output(self,other,"DMT_1297_Stonnos_ChooseNature_Dark_01_09");	//Вот, - возьми эту магическую руну телепортации. Она приведет тебя в нужное место.
	B_GiveInvItems(self,other,itru_teleportdagot,1);
	AI_Output(self,other,"DMT_1297_Stonnos_ChooseNature_Dark_01_11");	//Теперь прощай, смертный...(могущественно) И да хранят тебя стихии!
	B_LogEntry(TOPIC_GUARDIANS,"Хранитель Стоннос предложил мне выбрать стихию, с которой я хочу связать свою дальнейшую судьбу в качестве их адепта. Я предпочел стихию Воды.");
	Log_AddEntry(TOPIC_GUARDIANS,"Стоннос также дал мне руну телепортации, с помощью которой я смогу отправиться в священную обитель Стражей Стихий. Там я должен буду встретиться с Хранителем Ваконом, который отныне будет моим наставником.");
	Info_ClearChoices(dmt_1297_stonnos_choosenature);
	Info_AddChoice(dmt_1297_stonnos_choosenature,"(закончить разговор)",dmt_1297_stonnos_test_end);
};

func void dmt_1297_stonnos_choosenature_fire()
{
	CHOOSEFIRE = TRUE;
	CHOOSENATUREISDONE = TRUE;
	AI_Print(PRINT_BONUSFIRE);
	hero.protection[PROT_FIRE] += 20;
	REALPROTFIRE += 20;

	if(hero.guild == GIl_KDF)
	{
		if(RealMode[2] == TRUE)
		{
			CountLearnSpell += 15;		
		}
		else
		{
			CountLearnSpell += 20;
		};
	};

	Wld_PlayEffect("SPELLFX_INCOVATION_FIRE",hero,hero,0,0,0,FALSE);
	AI_Output(other,self,"DMT_1297_Stonnos_ChooseNature_Fire_01_00");	//Я выбираю стихию Огня, мастер.
	AI_Output(self,other,"DMT_1297_Stonnos_ChooseNature_Dark_01_01");	//(властно) Хорошо, смертный. Пусть будет так! Ты сделал свой окончательный выбор.
	AI_Output(self,other,"DMT_1297_Stonnos_ChooseNature_Dark_01_02");	//Отныне твоя судьба будет нераздельно связана только с ней, а все твои деяния и помыслы будут направлены исключительно во благо ее величия.
	AI_Output(self,other,"DMT_1297_Stonnos_ChooseNature_Dark_01_04");	//Теперь ты должен следовать дальше по тому пути, который только что выбрал для себя.
	AI_Output(self,other,"DMT_1297_Stonnos_ChooseNature_Fire_01_07");	//Отправляйся к Хранителю Келиосу! Теперь он, как главный из стражей Огня, станет твои наставником и учителем.
	AI_Output(other,self,"DMT_1297_Stonnos_ChooseNature_Dark_01_08");	//А где мне его искать?
	AI_Output(self,other,"DMT_1297_Stonnos_ChooseNature_Dark_01_09");	//Вот, - возьми эту магическую руну телепортации. Она приведет тебя в нужное место.
	B_GiveInvItems(self,other,itru_teleportdagot,1);
	AI_Output(self,other,"DMT_1297_Stonnos_ChooseNature_Dark_01_11");	//Теперь прощай, смертный...(могущественно) И да хранят тебя стихии!
	B_LogEntry(TOPIC_GUARDIANS,"Хранитель Стоннос предложил мне выбрать стихию, с которой я хочу связать свою дальнейшую судьбу в качестве их адепта. Я предпочел стихию Огня.");
	Log_AddEntry(TOPIC_GUARDIANS,"Стоннос также дал мне руну телепортации, с помощью которой я смогу отправиться в священную обитель Стражей Стихий. Там я должен буду встретиться с Хранителем Келиосом, который отныне будет моим наставником.");
	Info_ClearChoices(dmt_1297_stonnos_choosenature);
	Info_AddChoice(dmt_1297_stonnos_choosenature,"(закончить разговор)",dmt_1297_stonnos_test_end);
};

func void dmt_1297_stonnos_test_end()
{
	Npc_ExchangeRoutine(self,"WaitInSecretLab");
	AI_StopProcessInfos(self);
	B_Attack(self,other,0,0);
};