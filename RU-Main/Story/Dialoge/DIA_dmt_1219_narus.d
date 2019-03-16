
instance DMT_1219_NARUS_EXIT(C_Info)
{
	npc = dmt_1219_narus;
	nr = 999;
	condition = dmt_1219_narus_exit_condition;
	information = dmt_1219_narus_exit_info;
	important = FALSE;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dmt_1219_narus_exit_condition()
{
	return TRUE;
};

func void dmt_1219_narus_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DMT_1219_NARUS_HELLO(C_Info)
{
	npc = dmt_1219_narus;
	condition = dmt_1219_narus_hello_condition;
	information = dmt_1219_narus_hello_info;
	important = TRUE;
	permanent = FALSE;
};


func int dmt_1219_narus_hello_condition()
{
	if((MIS_GUARDIANSTEST == LOG_Running) && (GADER_AGREE == TRUE))
	{
		return TRUE;
	};
};

func void dmt_1219_narus_hello_info()
{
	AI_Output(self,other,"DMT_1219_Narus_Hello_00");	//(вкрадчиво) Итак, ты здесь.
	AI_Output(self,other,"DMT_1219_Narus_Hello_01");	//Честно говоря, я немного удивлен нашей встрече. Не думал, что тебе удастся зайти так далеко!
	AI_Output(self,other,"DMT_1219_Narus_Hello_02");	//Но, по всей видимости, какая-то божественная сила хранит тебя от опасностей и помогает преодолеть тебе этот нелегкий путь.
	AI_Output(self,other,"DMT_1219_Narus_Hello_03");	//Что же, это хороший знак.
	AI_Output(other,self,"DMT_1219_Narus_Hello_04");	//Кто ты?
	AI_Output(self,other,"DMT_1219_Narus_Hello_05");	//(могущественно) Я - Нарус. Второй страж священных вод Адана и шестой Хранитель священных врат!
	AI_Output(self,other,"DMT_1219_Narus_Hello_06");	//И я здесь для того, чтобы предложить тебе пройти твое следующее испытание.
	AI_Output(self,other,"DMT_1219_Narus_Hello_07");	//Конечно, глядя на уже пройденный тобою путь, может показаться, что мое поручение не составит для тебя особого труда.
	AI_Output(self,other,"DMT_1219_Narus_Hello_08");	//Ты уже многим доказал на что действительно способен, и, думаю, сам сейчас полон уверености в том, что уже практически достиг своей основной цели.
	AI_Output(self,other,"DMT_1219_Narus_Hello_09");	//Теперь настало время пройти мое испытание. Ты готов?
	Info_ClearChoices(dmt_1219_narus_hello);
	Info_AddChoice(dmt_1219_narus_hello,"Да, я готов.",dmt_1219_narus_hello_test);
};

func void dmt_1219_narus_hello_test()
{
	AI_Output(other,self,"DMT_1219_Narus_Hello_10");	//Да, я готов.
	Wld_PlayEffect("spellFX_INCOVATION_BLUE",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_Output(self,other,"DMT_1219_Narus_Hello_11");	//Тогда слушай меня внимательно.
	AI_Output(self,other,"DMT_1219_Narus_Hello_12");	//Стоя здесь и ожидая твоего скорого появления, я глубоко размышлял о ходе времени и о том, как оно скоротечно уплывает от нас, словно песок сквозь пальцы.
	AI_Output(self,other,"DMT_1219_Narus_Hello_13");	//В своих раздумьях я, видимо, совершенно не заметил того, как случайно обронил вниз свое сапфировое кольцо.
	AI_Output(self,other,"DMT_1219_Narus_Hello_14");	//Думаю, оно упало в тот глубокий пруд, что под нами...
	AI_Output(self,other,"DMT_1219_Narus_Hello_15");	//Эта вещь очень дорога для меня, и я хочу ее вернуть!
	AI_Output(self,other,"DMT_1219_Narus_Hello_16");	//Поэтому не удивляйся, если это испытание будет, скорее всего, звучать для тебя как обычная просьба.
	AI_Output(self,other,"DMT_1219_Narus_Hello_17");	//И она проста: найди мое потерянное кольцо и принеси его обратно мне.
	AI_Output(other,self,"DMT_1219_Narus_Hello_18");	//Хорошо. Я найду твое кольцо, мастер.
	AI_Output(self,other,"DMT_1219_Narus_Hello_19");	//Тогда я жду тебя с ним. Ступай!
	AI_StopProcessInfos(self);
	MIS_NARUSTEST = LOG_Running;
	Wld_InsertItem(itri_narus,"FP_ITEM_NARUSRING");
	Log_CreateTopic(TOPIC_NARUSTEST,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_NARUSTEST,LOG_Running);
	B_LogEntry(TOPIC_NARUSTEST,"Хранитель Нарус попросил найти его кольцо, которое он случайно обронил в глубокий пруд рядом с фермой Бенгара. Мне кажется, Хранитель передумал испытывать меня, если дал такое пустяковое задание.");
};


instance DMT_1219_NARUS_TEST(C_Info)
{
	npc = dmt_1219_narus;
	nr = 1;
	condition = dmt_1219_narus_test_condition;
	information = dmt_1219_narus_test_info;
	permanent = FALSE;
	description = "Я нашел твое кольцо.";
};


func int dmt_1219_narus_test_condition()
{
	if((MIS_GUARDIANSTEST == LOG_Running) && (MIS_NARUSTEST == LOG_Running) && (Npc_HasItems(other,itri_narus) >= 1))
	{
		return TRUE;
	};
};

func void dmt_1219_narus_test_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DMT_1219_Narus_Test_00");	//Я нашел твое кольцо.
	AI_Output(self,other,"DMT_1219_Narus_Test_01");	//Хорошо. Раз так - покажи!
	AI_Output(other,self,"DMT_1219_Narus_Test_02");	//Вот, смотри.
	AI_Output(self,other,"DMT_1219_Narus_Test_03");	//Хммм. Да, похоже, здесь сомнений быть не может, - это действительно оно!
	AI_Output(other,self,"DMT_1219_Narus_Test_04");	//Тогда я возвращаю это кольцо тебе, мастер.
	AI_Output(self,other,"DMT_1219_Narus_Test_05");	//Постой! Не спеши отдавать его мне. Мне кажется, что будет лучше, если эта вещь пока немного побудет у тебя.
	AI_Output(self,other,"DMT_1219_Narus_Test_06");	//(вкрадчиво) Я уверен, что она тебе и самому еще не раз пригодится. Ты можешь в этом не сомневаться!
	AI_Output(self,other,"DMT_1219_Narus_Test_07");	//Думаю, что это не первая подобная вещь, которую ты получил от Хранителей?
	AI_Output(other,self,"DMT_1219_Narus_Test_08");	//Да, ты прав. Хранитель Дагот тоже подарил мне одно кольцо.
	AI_Output(other,self,"DMT_1219_Narus_Test_09");	//Правда, он тогда так и не объяснил мне, зачем оно нужно.
	AI_Output(self,other,"DMT_1219_Narus_Test_10");	//Всему свой черед, герой времен...(вкрадчиво) Ты еще успеешь познать истинный смысл этих колец.
	AI_Output(self,other,"DMT_1219_Narus_Test_11");	//Но это произойдет только тогда, когда придет время.
	AI_Output(other,self,"DMT_1219_Narus_Test_12");	//Я все понял, мастер.
	AI_Output(self,other,"DMT_1219_Narus_Test_13");	//(могущественно) Хорошо. Теперь же вернемся к твоему испытанию.
	AI_Output(self,other,"DMT_1219_Narus_Test_14");	//Как я и ожидал, тебе удалось выполнить все поставленные мной условия для того, чтобы успешно пройти его.
	AI_Output(self,other,"DMT_1219_Narus_Test_15");	//И ты справился!
	MIS_NARUSTEST = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_NARUSTEST,LOG_SUCCESS);
	B_LogEntry(TOPIC_NARUSTEST,"Хранитель Нарус был доволен тем, что мне удалось отыскать его кольцо. В награду он подарил его мне и признал пройденным его испытание.");
	Info_ClearChoices(dmt_1219_narus_test);
	Info_AddChoice(dmt_1219_narus_test,"Значит, теперь я могу рассчитывать на твое согласие?",dmt_1219_narus_test_pass);
};

func void dmt_1219_narus_test_pass()
{
	AI_Output(other,self,"DMT_1219_Narus_Test_16");	//Значит, теперь я могу рассчитывать на твое согласие?
	Wld_PlayEffect("spellFX_INCOVATION_BLUE",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	B_LogEntry(TOPIC_GUARDIANSTEST,"Я смог заручиться согласием Хранителя Наруса.");
	NARUS_AGREE = TRUE;
	AI_Output(self,other,"DMT_1219_Narus_Test_17");	//(властно) Безусловно, так! И властью, данной мне священными водами Адана, я даю его тебе!
	AI_Output(self,other,"DMT_1219_Narus_Test_18");	//Пусть это поможет сделать тебе еще один шаг по тому пути, что ты избрал для себя.
	AI_Output(self,other,"DMT_1219_Narus_Test_19");	//Теперь же ступай. Ищи последнего Хранителя воды - Вакона.
	AI_Output(self,other,"DMT_1219_Narus_Test_20");	//Он даст тебе твое последнее испытание, после чего ты сможешь встретиться с главой нашего Круга.
	AI_Output(self,other,"DMT_1219_Narus_Test_21");	//Прощай!
	Info_ClearChoices(dmt_1219_narus_test);
	Info_AddChoice(dmt_1219_narus_test,"(закончить разговор)",dmt_1219_narus_test_end);
};

func void dmt_1219_narus_test_end()
{
	Npc_ExchangeRoutine(self,"WaitInSecretLab");
	AI_StopProcessInfos(self);
	B_Attack(self,other,0,0);
};

