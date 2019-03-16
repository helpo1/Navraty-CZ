
instance DMT_1217_FARION_EXIT(C_Info)
{
	npc = dmt_1217_farion;
	nr = 999;
	condition = dmt_1217_farion_exit_condition;
	information = dmt_1217_farion_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dmt_1217_farion_exit_condition()
{
	return TRUE;
};

func void dmt_1217_farion_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DMT_1217_FARION_HELLO(C_Info)
{
	npc = dmt_1217_farion;
	condition = dmt_1217_farion_hello_condition;
	information = dmt_1217_farion_hello_info;
	important = TRUE;
	permanent = FALSE;
};


func int dmt_1217_farion_hello_condition()
{
	if((MIS_GUARDIANSTEST == LOG_Running) && (DEMOS_AGREE == TRUE))
	{
		return TRUE;
	};
};

func void dmt_1217_farion_hello_info()
{
	AI_Output(self,other,"DMT_1217_Farion_Hello_00");	//(властно) Стой, человек! Остановись!
	AI_Output(other,self,"DMT_1217_Farion_Hello_01");	//Кто ты? И почему ты так со мной разговариваешь?
	AI_Output(self,other,"DMT_1217_Farion_Hello_02");	//Перед тобой Фарион - последний из стражей священного Огня и пятый Хранитель священных Чертогов Вакхана!
	AI_Output(other,self,"DMT_1217_Farion_Hello_03");	//Если так, то, значит, пришло время для моего очередного испытания. Я прав?
	AI_Output(self,other,"DMT_1217_Farion_Hello_04");	//Ты догадлив, смертный...(ехидно) Именно за этим я и явился в этот мир.
	AI_Output(self,other,"DMT_1217_Farion_Hello_05");	//Тебе выпал отличный шанс доказать мне, что ты достоин стать адептом нашего Круга.
	AI_Output(self,other,"DMT_1217_Farion_Hello_06");	//Судя по словам других Хранителей, чьи испытания ты уже прошел, - ты можешь многого добиться!
	AI_Output(self,other,"DMT_1217_Farion_Hello_07");	//Но я пока что вижу перед собой только слабого человека, не способного даже противостоять и тени зла, уже окутавшее этот мир.
	AI_Output(other,self,"DMT_1217_Farion_Hello_08");	//Ну, тогда я постараюсь поскорее изменить твое мнение о себе.
	AI_Output(self,other,"DMT_1217_Farion_Hello_09");	//(смеется) Ты сможешь это сделать только в том случае, если пройдешь испытание, которое я тебе уготовил.
	AI_Output(self,other,"DMT_1217_Farion_Hello_10");	//И можешь не сомневаться - оно будет не из легких!
	AI_Output(other,self,"DMT_1217_Farion_Hello_11");	//На другое я и не рассчитывал.
	AI_Output(self,other,"DMT_1217_Farion_Hello_12");	//Раз так, ответь - ты готов принять его?
	Info_ClearChoices(dmt_1217_farion_hello);
	Info_AddChoice(dmt_1217_farion_hello,"Само собой.",dmt_1217_farion_hello_test);
};

func void dmt_1217_farion_hello_test()
{
	AI_Output(other,self,"DMT_1217_Farion_Hello_13");	//Само собой.
	Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_Output(self,other,"DMT_1217_Farion_Hello_14");	//(могущественно) Хммм. Ты дерзок, человек!
	AI_Output(self,other,"DMT_1217_Farion_Hello_15");	//Посмотрим, насколько тебе это поможет. Слушай внимательно...(властно)
	AI_Output(other,self,"DMT_1217_Farion_Hello_16");	//Да, мастер.
	AI_Output(self,other,"DMT_1217_Farion_Hello_17");	//Ты, наверно, уже знаешь, что священная стихия Огня может даровать как жизнь, так и смерть...(мрачно) В данном случае огонь выбирает смерть!
	AI_Output(other,self,"DMT_1217_Farion_Hello_18");	//Что это значит?
	AI_Output(self,other,"DMT_1217_Farion_Hello_19");	//Это означает то, что ты послужишь мне в качестве орудия божественного проведения и возложишь к жертвенному алтарю судьбы жизнь одного смертного.
	AI_Output(other,self,"DMT_1217_Farion_Hello_20");	//То есть я должен буду кого-то убить?!
	AI_Output(self,other,"DMT_1217_Farion_Hello_21");	//Не просто кого-то. А именно того человека, на которого я тебе сам укажу.
	AI_Output(self,other,"DMT_1217_Farion_Hello_22");	//К тому же говоря, он не совсем похож на обычного человека.
	AI_Output(other,self,"DMT_1217_Farion_Hello_23");	//А кто же он?
	AI_Output(self,other,"DMT_1217_Farion_Hello_24");	//(надменно) Он - паладин Инноса и верный слуга своего бога!
	AI_Output(other,self,"DMT_1217_Farion_Hello_25");	//Паладин Инноса?!
	AI_Output(self,other,"DMT_1217_Farion_Hello_26");	//Я вижу, что тебя это немного удивляет...(ехидно) Однако, несмотря на это, тебе в любом случае придется это сделать, - если ты, конечно, хочешь пройти мое испытание.
	AI_Output(other,self,"DMT_1217_Farion_Hello_27");	//Да, мастер. Я уже понял, что выбора у меня нет.
	AI_Output(self,other,"DMT_1217_Farion_Hello_28");	//Хорошо, что ты это понимаешь! И, чтобы ты окончательно перестал сомневаться в правоте своих будущих деяний, - я объясню тебе причину, по которой это необходимо сделать.
	AI_Output(other,self,"DMT_1217_Farion_Hello_29");	//Было бы неплохо. Ведь для убийства паладина должна быть очень веская причина!
	AI_Output(self,other,"DMT_1217_Farion_Hello_30");	//(ехидно) Можешь не переживать, такая действительно есть.
	AI_Output(other,self,"DMT_1217_Farion_Hello_31");	//И в чем она заключается?
	AI_Output(self,other,"DMT_1217_Farion_Hello_32");	//В силу определенных обстоятельств мне стало известно, что тот паладин, жизнь которого должна быть принесена в жертву, после своей смерти будет предан ритуалу обращения!
	AI_Output(self,other,"DMT_1217_Farion_Hello_33");	//Ты знаешь, что это такое?
	AI_Output(other,self,"DMT_1217_Farion_Hello_34");	//Совсем немного.
	AI_Output(self,other,"DMT_1217_Farion_Hello_35");	//Все очень просто. Ему будет уготовлена участь стать Лордом Теней и верным слугой темного бога.
	AI_Output(other,self,"DMT_1217_Farion_Hello_36");	//Лордом Теней? А кто это?
	AI_Output(self,other,"DMT_1217_Farion_Hello_37");	//Лорды Теней - генералы армии Белиара. Могущественные создания, наделенные огромной силой и ведомые жаждой уничтожать все живое.
	AI_Output(self,other,"DMT_1217_Farion_Hello_38");	//Они ведут свои легионы мертвых в бой от имени своего господина, чтобы навечно погрузить этот мир в пустоту тьмы.
	AI_Output(self,other,"DMT_1217_Farion_Hello_39");	//Поэтому так важно, чтобы ты прошел мое испытание и уничтожил это зло в самом его зародыше!
	AI_Output(other,self,"DMT_1217_Farion_Hello_40");	//Хорошо, мастер! Теперь я все понимаю.
	AI_Output(other,self,"DMT_1217_Farion_Hello_41");	//А как зовут того паладина?
	AI_Output(self,other,"DMT_1217_Farion_Hello_42");	//Его имя Серджио. Ты найдешь его в монастыре магов Огня.
	AI_Output(self,other,"DMT_1217_Farion_Hello_43");	//Там он проводит все свое свободное время в молитвах, пытаясь как-то спасти свою душу.
	AI_Output(self,other,"DMT_1217_Farion_Hello_44");	//Но это ему не поможет...(властно) Его судьба уже определена!
	AI_Output(self,other,"DMT_1217_Farion_Hello_45");	//Так что отправляйся в путь. Найди этого человека и навсегда упокой его душу.
	AI_Output(self,other,"DMT_1217_Farion_Hello_46");	//Я же буду ждать тебя здесь. Теперь ступай!
	MIS_FARIONTEST = LOG_Running;
	Log_CreateTopic(TOPIC_FARIONTEST,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FARIONTEST,LOG_Running);
	B_LogEntry(TOPIC_FARIONTEST,"Хранитель Фарион назначил необычное на первый взгляд испытание: убить паладина Серджио. После смерти его душа будет предана ритуалу обращения, и воин Инноса превратится в Лорда Теней – могущественного и верного слугу темного бога! Необходимо уничтожить зарождающееся зло в самом начале. Серджио проводит время в молитвах Инносу, пытаясь спасти свою душу. Нужно искать его в монастыре магов Огня.");
	AI_StopProcessInfos(self);
	B_StartOtherRoutine(PAL_299_Sergio,"AwayMonastery");
};


instance DMT_1217_FARION_TEST(C_Info)
{
	npc = dmt_1217_farion;
	nr = 1;
	condition = dmt_1217_farion_test_condition;
	information = dmt_1217_farion_test_info;
	permanent = FALSE;
	important = TRUE;
};


func int dmt_1217_farion_test_condition()
{
	if((MIS_GUARDIANSTEST == LOG_Running) && (MIS_FARIONTEST == LOG_Running) && (SERGIOISDEAD == TRUE) && (SERDAHISDEAD == TRUE))
	{
		return TRUE;
	};
};

func void dmt_1217_farion_test_info()
{
	B_GivePlayerXP(200);
	AI_Output(self,other,"DMT_1217_Farion_Test_00");	//(властно) Можешь ничего не говорить. Я и так уже знаю, что тебе удалось выполнить мое поручение.
	AI_Output(self,other,"DMT_1217_Farion_Test_01");	//Возможно, тебя еще до сих пор мучают угрызения совести за твой поступок, но поверь мне: ты поступил правильно.
	AI_Output(self,other,"DMT_1217_Farion_Test_02");	//К тому же тем самым ты еще и прошел мое испытание. А это тоже немаловажно!
	Info_ClearChoices(dmt_1217_farion_test);
	Info_AddChoice(dmt_1217_farion_test,"Значит, ты теперь дашь мне свое согласие, мастер?",dmt_1217_farion_test_pass);
};

func void dmt_1217_farion_test_pass()
{
	AI_Output(other,self,"DMT_1217_Farion_Test_03");	//Значит, ты теперь дашь мне свое согласие, мастер?
	Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_Output(self,other,"DMT_1217_Farion_Test_04");	//Так оно и будет. Ты убедил меня в своих возможностях и заслужил эту честь по праву.
	AI_Output(self,other,"DMT_1217_Farion_Test_05");	//Поэтому, именем священного Огня, я даю свое согласие на принятие тебя в адепты Круга Хранителей.
	AI_Output(self,other,"DMT_1217_Farion_Test_07");	//(властно) Теперь же ступай... Продложай свой путь и поиски следующего из нас.
	AI_Output(self,other,"DMT_1217_Farion_Test_08");	//И пусть великая тайна Огня наделяет твои поступки своей мудростью!
	MIS_FARIONTEST = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_FARIONTEST,LOG_SUCCESS);
	B_LogEntry(TOPIC_FARIONTEST,"Я прошел испытание Хранителя Фариона.");
	Log_AddEntry(TOPIC_GUARDIANSTEST,"Я получил от Хранителя Фариона его согласие на принятие меня в адепты Круга Хранителей.");
	FARION_AGREE = TRUE;
	Info_ClearChoices(dmt_1217_farion_test);
	Info_AddChoice(dmt_1217_farion_test,"(закончить разговор)",dmt_1217_farion_test_end);
};

func void dmt_1217_farion_test_end()
{
	Npc_ExchangeRoutine(self,"WaitInSecretLab");
	AI_StopProcessInfos(self);
	B_Attack(self,other,0,0);
};

