
instance DMT_1220_WAKON_EXIT(C_Info)
{
	npc = dmt_1220_wakon;
	nr = 999;
	condition = dmt_1220_wakon_exit_condition;
	information = dmt_1220_wakon_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dmt_1220_wakon_exit_condition()
{
	return TRUE;
};

func void dmt_1220_wakon_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DMT_1220_WAKON_HELLO(C_Info)
{
	npc = dmt_1220_wakon;
	condition = dmt_1220_wakon_hello_condition;
	information = dmt_1220_wakon_hello_info;
	important = TRUE;
	permanent = FALSE;
};


func int dmt_1220_wakon_hello_condition()
{
	if((MIS_GUARDIANSTEST == LOG_Running) && (NARUS_AGREE == TRUE))
	{
		return TRUE;
	};
};

func void dmt_1220_wakon_hello_info()
{
	AI_Output(self,other,"DMT_1220_Wakon_Hello_00");	//Итак...(могущественно) Наконец-то мы с тобой встретились!
	AI_Output(self,other,"DMT_1220_Wakon_Hello_01");	//Надеюсь, мне не стоит тебе объяснять, кто я такой?
	AI_Output(other,self,"DMT_1220_Wakon_Hello_02");	//Я думаю, что ты один из Хранителей. Я прав?
	AI_Output(self,other,"DMT_1220_Wakon_Hello_03");	//Все верно, перед тобой Вакон - третий страж Воды и Хранитель священных врат Вакхана.
	AI_Output(self,other,"DMT_1220_Wakon_Hello_04");	//Уверен, что ты уже знаешь причину моего появления здесь. Пришло время принять тебе свое последнее испытание!
	AI_Output(self,other,"DMT_1220_Wakon_Hello_05");	//И только пройдя его, ты заслужишь мое расположение и согласие на принятие тебя в адепты нашего Круга.
	AI_Output(other,self,"DMT_1220_Wakon_Hello_06");	//Я знаю это, мастер. И я уверен, что справлюсь.
	AI_Output(self,other,"DMT_1220_Wakon_Hello_07");	//Твоя уверенность порой поражает. Хорошо...(серьезно) На этот раз тебе придется показать все, на что ты способен!
	AI_Output(self,other,"DMT_1220_Wakon_Hello_08");	//(могущественно) Не будем терять времени. Ты готов принять мое испытание?
	Info_ClearChoices(dmt_1220_wakon_hello);
	Info_AddChoice(dmt_1220_wakon_hello,"Да, мастер! Я готов.",dmt_1220_wakon_hello_test);
};

func void dmt_1220_wakon_hello_test()
{
	AI_Output(other,self,"DMT_1220_Wakon_Hello_09");	//Да, мастер! Я готов.
	Wld_PlayEffect("spellFX_INCOVATION_BLUE",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_Output(self,other,"DMT_1220_Wakon_Hello_10");	//Тогда слушай меня внимательно, человек...(властно)
	AI_Output(self,other,"DMT_1220_Wakon_Hello_11");	//Твой путь лежит в место, именуемое Гадесом, или - как называют его люди - Долина Рудников.
	AI_Output(self,other,"DMT_1220_Wakon_Hello_12");	//Думаю, ты и сам понимаешь, о чем я говорю.
	AI_Output(other,self,"DMT_1220_Wakon_Hello_13");	//Да, мастер, я хорошо знаком с этим местом.
	AI_Output(self,other,"DMT_1220_Wakon_Hello_14");	//Хорошо. Там ты должен будешь отыскать одного из пяти духов священных вод Адана и освободить его.
	AI_Output(other,self,"DMT_1220_Wakon_Hello_15");	//Освободить Духа Воды?
	AI_Output(self,other,"DMT_1220_Wakon_Hello_16");	//Я понимаю твое большое удивление такому поручению, ибо ты навряд ли когда-либо встречал подобных созданий и не имеешь ни малейшего представления, кто они такие.
	AI_Output(self,other,"DMT_1220_Wakon_Hello_17");	//Однако, несмотря на это, тебе все равно придется это сделать, - если ты, конечно, хочешь пройти мое испытание.
	AI_Output(other,self,"DMT_1220_Wakon_Hello_18");	//А кто такие эти Духи Воды?
	AI_Output(self,other,"DMT_1220_Wakon_Hello_19");	//Духи Воды - это дети своей стихии! Древние существа, в которых мы - Хранители - отчасти черпаем свои жизненные силы.
	AI_Output(self,other,"DMT_1220_Wakon_Hello_20");	//Кроме этого, они также являются источником нашей мудрости и магической силы.
	AI_Output(self,other,"DMT_1220_Wakon_Hello_22");	//Вот поэтому много веков назад один из таких духов был пленен шаманами одного орочьего племени, которые полагали с его помощью обрести безграничную власть.
	AI_Output(self,other,"DMT_1220_Wakon_Hello_23");	//Правда, у них так ничего и не вышло.
	AI_Output(self,other,"DMT_1220_Wakon_Hello_24");	//Поэтому орки оставили Духа Воды у себя в заточении в надежде, что когда-нибудь им удастся постигнуть тайны его могущества.
	AI_Output(self,other,"DMT_1220_Wakon_Hello_27");	//Не имея возможности черпать магию из родной ему стихии, Дух Воды стал понемногу терять свою жизненную силу и угасать на глазах.
	AI_Output(self,other,"DMT_1220_Wakon_Hello_28");	//Так что, скорее всего, за многие века, проведенные в заточении, это создание уже полностью утратило свое былое могущество, которое когда-то казалось безграничным.
	AI_Output(other,self,"DMT_1220_Wakon_Hello_29");	//Но почему Хранители сами не освободили Духа Воды?
	AI_Output(self,other,"DMT_1220_Wakon_Hello_30");	//Ты уже давно должен был понять, что мы никогда не вмешиваемся в ход событий и времени.
	AI_Output(self,other,"DMT_1220_Wakon_Hello_31");	//Наше вмешательство может нарушить и без того хрупкое равновесие этого мира, и последствия всего этого будут просто ужасающими!
	AI_Output(self,other,"DMT_1220_Wakon_Hello_32");	//Именно поэтому исполнение нашей божественной воли возложено на простых смертных вроде тебя, - и иного пути быть не может!
	AI_Output(self,other,"DMT_1220_Wakon_Hello_34");	//Отправляйся в Гадес и освободи пленника из его темницы...(властно) Я же буду ждать тебя здесь.
	AI_StopProcessInfos(self);
	MIS_WAKONTEST = LOG_Running;
	Log_CreateTopic(TOPIC_WAKONTEST,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_WAKONTEST,LOG_Running);
	B_LogEntry(TOPIC_WAKONTEST,"Хранитель Вакон приказал мне отправиться в Долину Рудников, чтобы найти и освободить древнейшее создание - Духа Воды. Когда-то Дух был пленен шаманами орочьего племени. Ну почему он не потерял кольцо, как предыдущий Хранитель?");

	if(URSHAKISDEAD == FALSE)
	{
		Log_AddEntry(TOPIC_WAKONTEST,"По всей видимости, мне придется вновь иметь дело с орками. Возможно, Ур-Шак подскажет мне, с чего начать поиски.");
	};
};


instance DMT_1220_WAKON_TEST(C_Info)
{
	npc = dmt_1220_wakon;
	nr = 1;
	condition = dmt_1220_wakon_test_condition;
	information = dmt_1220_wakon_test_info;
	important = FALSE;
	permanent = TRUE;
	description = "Дух Воды свободен!";
};


func int dmt_1220_wakon_test_condition()
{
	if((MIS_GUARDIANSTEST == LOG_Running) && (MIS_WAKONTEST == LOG_Running) && (FREEWATERSOUL == TRUE))
	{
		return TRUE;
	};
};

func void dmt_1220_wakon_test_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DMT_1220_Wakon_Test_00");	//Дух Воды свободен!
	AI_Output(self,other,"DMT_1220_Wakon_Test_01");	//Что же, это очень хорошие новости. Хотя, по правде говоря, мне уже они и так известны.
	AI_Output(other,self,"DMT_1220_Wakon_Test_02");	//Как ты это почувствовал?!
	AI_Output(self,other,"DMT_1220_Wakon_Test_03");	//(серьезно) Все просто, человек. Не забывай о том, что мы - Хранители Воды - тесно связаны с этими древними существами.
	AI_Output(self,other,"DMT_1220_Wakon_Test_04");	//Любое, хотя бы малейшее магическое волнение, вызванное этими созданиями - в свою очередь очень сильно влияет на каждого из нас.
	AI_Output(self,other,"DMT_1220_Wakon_Test_06");	//Но сейчас это уже не так важно. Важно другое - ты выполнил мое поручение и тем самым прошел свое последнее испытание!
	AI_Output(self,other,"DMT_1220_Wakon_Test_07");	//Думаю, ты и сам догадываешься, что это означает. Не так ли?
	MIS_WAKONTEST = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_WAKONTEST,LOG_SUCCESS);
	B_LogEntry(TOPIC_WAKONTEST,"Я прошел испытание Хранителя Вакона.");
	Info_ClearChoices(dmt_1220_wakon_test);
	Info_AddChoice(dmt_1220_wakon_test,"Да, кажется, догадываюсь.",dmt_1220_wakon_test_pass);
};

func void dmt_1220_wakon_test_pass()
{
	AI_Output(other,self,"DMT_1220_Wakon_Test_08");	//Да, кажется догадываюсь.
	Wld_PlayEffect("spellFX_INCOVATION_BLUE",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	B_LogEntry(TOPIC_GUARDIANSTEST,"Я получил согласие последнего из Хранителей - Вакона. Теперь мне нужно предстать перед главой их Божественного Круга. Судя по всему, я смогу найти его в месте, что олицетворяет стихию, породившую его. Насколько я помню, это стихия есть не что иное, как Священный Камень.");
	WAKON_AGREE = TRUE;
	AI_Output(self,other,"DMT_1220_Wakon_Test_09");	//Тогда властью, данной мне Аданосом и Священной Водой, я - Вакон, третий страж Воды и первый Хранитель священных врат Вакхана, - даю тебе свое согласие на посвящение тебя в ранг адепта нашего Круга.
	AI_Output(self,other,"DMT_1220_Wakon_Test_10");	//Отныне мое решение вписано в великую Книгу Судеб, и никто не сможет этого изменить!
	AI_Output(other,self,"DMT_1220_Wakon_Test_11");	//Теперь я буду служить Хранителям?
	AI_Output(self,other,"DMT_1220_Wakon_Test_12");	//Да, ты заслужил эту честь по праву!
	AI_Output(self,other,"DMT_1220_Wakon_Test_13");	//Теперь же тебе осталось только одно - предстать перед тем, кто своим могуществом объединил всех нас.
	AI_Output(self,other,"DMT_1220_Wakon_Test_15");	//(властно) Хранитель Стоннос! Он - самый могущественный из Стражей Стихий и ко всему прочему является главой нашего Божественного Ордена.
	AI_Output(other,self,"DMT_1220_Wakon_Test_17");	//Но где мне его искать?
	AI_Output(self,other,"DMT_1220_Wakon_Test_18");	//Ищи его там, где является божественная мудрость стихии, породившей его...(вкрадчиво) И тем самым олицетворяет саму ее суть!
	AI_Output(self,other,"DMT_1220_Wakon_Test_20");	//Теперь все. Прощай. И да хранит тебя мудрость Воды!
	Info_ClearChoices(dmt_1220_wakon_test);
	Info_AddChoice(dmt_1220_wakon_test,"(закончить разговор)",dmt_1220_wakon_test_end);
};

func void dmt_1220_wakon_test_end()
{
	Npc_ExchangeRoutine(self,"WaitInSecretLab");
	AI_StopProcessInfos(self);
	B_Attack(self,other,0,0);
};

