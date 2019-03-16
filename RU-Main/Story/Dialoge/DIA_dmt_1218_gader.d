
instance DMT_1218_GADER_EXIT(C_Info)
{
	npc = dmt_1218_gader;
	nr = 999;
	condition = dmt_1218_gader_exit_condition;
	information = dmt_1218_gader_exit_info;
	important = FALSE;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dmt_1218_gader_exit_condition()
{
	return TRUE;
};

func void dmt_1218_gader_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DMT_1218_GADER_HELLO(C_Info)
{
	npc = dmt_1218_gader;
	condition = dmt_1218_gader_hello_condition;
	information = dmt_1218_gader_hello_info;
	important = TRUE;
	permanent = FALSE;
};


func int dmt_1218_gader_hello_condition()
{
	if((MIS_GUARDIANSTEST == LOG_Running) && (FARION_AGREE == TRUE))
	{
		return TRUE;
	};
};

func void dmt_1218_gader_hello_info()
{
	AI_Output(self,other,"DMT_1218_Gader_Hello_00");	//(властно) Приветствую тебя, странник.
	AI_Output(self,other,"DMT_1218_Gader_Hello_01");	//Наверняка мне не стоит тебе объяснять, кто я такой. Думаю, ты это и сам прекрасно понимаешь.
	AI_Output(other,self,"DMT_1218_Gader_Hello_02");	//Ты Хранитель?
	AI_Output(self,other,"DMT_1218_Gader_Hello_03");	//Да. Я - Хранитель Гадэр, первый страж Воды и шестой Хранитель священных Чертогов Вакхана.
	AI_Output(self,other,"DMT_1218_Gader_Hello_04");	//И раз мы с тобой повстречались, значит, ты уже преодолел большую часть своего нелегкого пути.
	AI_Output(self,other,"DMT_1218_Gader_Hello_05");	//Теперь настало время пройти оставшуюся его часть, чтобы закончить посвящение в адепты нашего круга!
	AI_Output(self,other,"DMT_1218_Gader_Hello_06");	//Ты готов?
	Info_ClearChoices(dmt_1218_gader_hello);
	Info_AddChoice(dmt_1218_gader_hello,"Да, мастер, я готов.",dmt_1218_gader_hello_test);
};

func void dmt_1218_gader_hello_test()
{
	AI_Output(other,self,"DMT_1218_Gader_Hello_07");	//Да, мастер, я готов.
	Wld_PlayEffect("spellFX_INCOVATION_BLUE",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_Output(self,other,"DMT_1218_Gader_Hello_08");	//Хорошо! Тогда начнем.
	AI_Output(self,other,"DMT_1218_Gader_Hello_09");	//Мое испытание не будет таить в себе какого-либо скрытого умысла или смертельную угрозу для твоей жизни.
	AI_Output(self,other,"DMT_1218_Gader_Hello_10");	//И, скорее всего, оно покажется тебе не слишком тяжелым по сравнению с поручениями других Хранителей.
	AI_Output(self,other,"DMT_1218_Gader_Hello_11");	//Все, что от тебя требуется, - это лишь совершить небольшое паломничество в Долину Древних, что находится в северо-восточных землях этого острова.
	AI_Output(self,other,"DMT_1218_Gader_Hello_12");	//Люди называют это место Яркендаром. Думаю, ты уже неоднократно бывал там, и я хочу попросить тебя сделать это вновь.
	AI_Output(self,other,"DMT_1218_Gader_Hello_13");	//Тебе будет необходимо отнести в эту долину несколько магических артефактов, которые я тебе сейчас передам.
	AI_Output(self,other,"DMT_1218_Gader_Hello_14");	//Вот, возьми их.
	CreateInvItems(self,itmi_gaderstone,5);
	B_GiveInvItems(self,other,itmi_gaderstone,5);
	AI_Output(other,self,"DMT_1218_Gader_Hello_15");	//А это не опасно?
	AI_Output(self,other,"DMT_1218_Gader_Hello_16");	//(могущественно) Нет! Магия этих предметов не способна причинить ни малейшего вреда кому-либо.
	AI_Output(self,other,"DMT_1218_Gader_Hello_17");	//Но она поможет вернуть этому священному месту былое величие и его утерянную силу!
	AI_Output(other,self,"DMT_1218_Gader_Hello_18");	//Хорошо. Но как именно я должен буду распорядиться этими артефактами, мастер?
	AI_Output(self,other,"DMT_1218_Gader_Hello_19");	//Все очень просто.
	AI_Output(self,other,"DMT_1218_Gader_Hello_20");	//Как ты наверняка знаешь, в Яркендаре расположенно несколько полуразрушенных храмов. Точнее, их всего пять.
	AI_Output(self,other,"DMT_1218_Gader_Hello_21");	//Когда-то их возвели сами древние, чтобы проводить там свои магические ритуалы.
	AI_Output(self,other,"DMT_1218_Gader_Hello_22");	//Казалось бы, с виду эти каменные развалины не представляют особого интереса.
	AI_Output(self,other,"DMT_1218_Gader_Hello_23");	//(вкрадчиво) Если, конечно, не знать одну вещь.
	AI_Output(other,self,"DMT_1218_Gader_Hello_24");	//Какую именно?
	AI_Output(self,other,"DMT_1218_Gader_Hello_25");	//Места закладок этих строений были выбраны далеко не случайным образом.
	AI_Output(other,self,"DMT_1218_Gader_Hello_26");	//То есть?
	AI_Output(self,other,"DMT_1218_Gader_Hello_27");	//Каждое из этих мест обладает невидимой энергетической аурой, способной усилить влияние любой магической субстанции в сотни раз!
	AI_Output(self,other,"DMT_1218_Gader_Hello_28");	//Это касается и магии полученных тобой предметов.
	AI_Output(self,other,"DMT_1218_Gader_Hello_31");	//Все, что тебе нужно сделать, - это просто возложить на алтарь каждого из этих храмов по одному имеющемуся у тебя артефакту.
	AI_Output(other,self,"DMT_1218_Gader_Hello_35");	//Хорошо, я все понял, мастер.
	AI_Output(self,other,"DMT_1218_Gader_Hello_36");	//Тогда ступай. И пусть Вода придаст тебе сил в твоих делах.
	AI_StopProcessInfos(self);
	MIS_GADERTEST = LOG_Running;
	Log_CreateTopic(TOPIC_GADERTEST,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GADERTEST,LOG_Running);
	B_LogEntry(TOPIC_GADERTEST,"Хранитель Воды Гадэр поручил мне совершить паломничество в Яркендар, чтобы возложить на алтари разрушенных храмов Зодчих пять артефактов, которые он вручил мне. Магия этих предметов поможет вернуть храмам былое величие и утерянную силу.");
};

instance DMT_1218_GADER_TEST(C_Info)
{
	npc = dmt_1218_gader;
	nr = 1;
	condition = dmt_1218_gader_test_condition;
	information = dmt_1218_gader_test_info;
	permanent = FALSE;
	description = "Я выполнил твое поручение, мастер.";
};


func int dmt_1218_gader_test_condition()
{
	if((MIS_GUARDIANSTEST == LOG_Running) && (MIS_GADERTEST == LOG_Running) && (PLACEGADERSTONNES == TRUE))
	{
		return TRUE;
	};
};

func void dmt_1218_gader_test_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DMT_1218_Gader_Test_00");	//Я выполнил твое поручение, мастер.
	AI_Output(self,other,"DMT_1218_Gader_Test_01");	//(могущественно) И тем самым прошел мое испытание.
	AI_Output(self,other,"DMT_1218_Gader_Test_02");	//Твои успехи заставляют меня думать, что ты без особого труда сможешь пройти через любое испытание и достичь своей окончательной цели!
	AI_Output(self,other,"DMT_1218_Gader_Test_03");	//Хотя на другое я и не рассчитывал.
	MIS_GADERTEST = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_GADERTEST,LOG_SUCCESS);
	B_LogEntry(TOPIC_GADERTEST,"Я выполнил поручение Гадэра и прошел его испытание.");
	Info_ClearChoices(dmt_1218_gader_test);
	Info_AddChoice(dmt_1218_gader_test,"Тогда могу ли я получить твое согласие?",dmt_1218_gader_test_pass);
};

func void dmt_1218_gader_test_pass()
{
	AI_Output(other,self,"DMT_1218_Gader_Test_04");	//Тогда могу ли я получить твое согласие, мастер?
	Wld_PlayEffect("spellFX_INCOVATION_BLUE",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_Output(self,other,"DMT_1218_Gader_Test_05");	//Несомненно!  И я с большим удовольствием даю его тебе.
	AI_Output(self,other,"DMT_1218_Gader_Test_06");	//Теперь ищи Наруса, второго Хранителя Воды.
	AI_Output(self,other,"DMT_1218_Gader_Test_07");	//Он даст тебе твое следующее испытание.
	AI_Output(self,other,"DMT_1218_Gader_Test_08");	//Прощай!
	B_LogEntry(TOPIC_GUARDIANSTEST,"Хранитель Гадэр дал мне свое согласие на посвящение в адепты Круга.");
	GADER_AGREE = TRUE;
	Info_ClearChoices(dmt_1218_gader_test);
	Info_AddChoice(dmt_1218_gader_test,"(закончить разговор)",dmt_1218_gader_test_end);
};

func void dmt_1218_gader_test_end()
{
	Npc_ExchangeRoutine(self,"WaitInSecretLab");
	AI_StopProcessInfos(self);
	B_Attack(self,other,0,0);
};

