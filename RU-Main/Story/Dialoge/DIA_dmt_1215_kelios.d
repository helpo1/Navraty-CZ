
instance DMT_1215_KELIOS_EXIT(C_Info)
{
	npc = dmt_1215_kelios;
	nr = 999;
	condition = dmt_1215_kelios_exit_condition;
	information = dmt_1215_kelios_exit_info;
	important = FALSE;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dmt_1215_kelios_exit_condition()
{
	return TRUE;
};

func void dmt_1215_kelios_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DMT_1215_KELIOS_HELLO(C_Info)
{
	npc = dmt_1215_kelios;
	condition = dmt_1215_kelios_hello_condition;
	information = dmt_1215_kelios_hello_info;
	important = TRUE;
	permanent = FALSE;
};


func int dmt_1215_kelios_hello_condition()
{
	if((MIS_GUARDIANSTEST == LOG_Running) && (TEGON_AGREE == TRUE))
	{
		return TRUE;
	};
};

func void dmt_1215_kelios_hello_info()
{
	AI_Output(self,other,"DMT_1215_Kelios_Hello_00");	//Итак, как я вижу, тебе удалось пройти все испытания Хранителей Тьмы.
	AI_Output(self,other,"DMT_1215_Kelios_Hello_03");	//Однако не стоит думать, что остальные испытания будут для тебя легкой прогулкой.
	AI_Output(self,other,"DMT_1215_Kelios_Hello_05");	//Помни об этом и не дай эйфории от успеха затуманить твой разум и притупить твои чувства.
	AI_Output(other,self,"DMT_1215_Kelios_Hello_06");	//Конечно, я это понимаю.
	AI_Output(self,other,"DMT_1215_Kelios_Hello_07");	//(властно) Хорошо. Тогда для тебя настала очередь пройти испытания Хранителей Огня.
	AI_Output(self,other,"DMT_1215_Kelios_Hello_08");	//И я - Келиос, первый Хранитель этой стихии, - даю тебе свое испытание!
	Info_ClearChoices(dmt_1215_kelios_hello);
	Info_AddChoice(dmt_1215_kelios_hello,"Да, мастер.",dmt_1215_kelios_hello_test);
};

func void dmt_1215_kelios_hello_test()
{
	AI_Output(other,self,"DMT_1215_Kelios_Hello_09");	//Да, мастер.
	Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_Output(self,other,"DMT_1215_Kelios_Hello_10");	//Слушай внимательно. Как ты уже понял, моя стихия - это огонь!
	AI_Output(self,other,"DMT_1215_Kelios_Hello_11");	//Это то, что дает тепло домашнему очагу и в тот же самый момент испепеляет все вокруг себя в одно мгновение ока!
	AI_Output(self,other,"DMT_1215_Kelios_Hello_12");	//Он - посредник между видимым и невидимым, между формой и магической энергией.
	AI_Output(self,other,"DMT_1215_Kelios_Hello_13");	//Для того чтобы понять все это самому, ты должен будешь для начала познать его сущность.
	AI_Output(self,other,"DMT_1215_Kelios_Hello_14");	//И в этом тебе поможет ритуал Очищения Огнем!
	AI_Output(other,self,"DMT_1215_Kelios_Hello_15");	//Очищения Огнем?
	AI_Output(self,other,"DMT_1215_Kelios_Hello_16");	//Да, ты не ослышался. Только так ты сможешь вобрать в себя великую мудрость этой стихии.
	AI_Output(self,other,"DMT_1215_Kelios_Hello_17");	//И только так ты сможешь пройти мое испытание. Пройди его, - и ты обретешь мое согласие!
	AI_Output(other,self,"DMT_1215_Kelios_Hello_18");	//Я постараюсь, что я должен сделать?
	AI_Output(self,other,"DMT_1215_Kelios_Hello_19");	//Все очень просто. Отправляйся на север к старым развалинам древних.
	AI_Output(self,other,"DMT_1215_Kelios_Hello_20");	//Там ты найдешь магический камень телепортации, который и перенесет тебя в место твоего испытания.
	AI_Output(self,other,"DMT_1215_Kelios_Hello_21");	//Все остальное, думаю, ты поймешь сам.
	AI_Output(self,other,"DMT_1215_Kelios_Hello_22");	//После же того как ты пройдешь ритуал очищения, возвращайся ко мне. Я буду ждать тебя.
	AI_Output(other,self,"DMT_1215_Kelios_Hello_23");	//Хорошо. Я все понял, мастер.
	AI_Output(self,other,"DMT_1215_Kelios_Hello_24");	//Тогда ступай, и пусть Огонь хранит тебя!
	AI_StopProcessInfos(self);
	MIS_KELIOSTEST = LOG_Running;
	Log_CreateTopic(TOPIC_KELIOSTEST,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KELIOSTEST,LOG_Running);
	B_LogEntry(TOPIC_KELIOSTEST,"Первый Хранитель Огня - Келиос - дал мне очередное испытание. Я должен пройти ритуал Очищения Огнем. В северной части острова в старых развалинах древних расположен камень телепортации, открывающий путь к месту ритуала. После его завершения меня ожидает Хранитель Келиос. Только так я получу его согласие на вступление в адепты Стражей Стихий.");
};


instance DMT_1215_KELIOS_TEST(C_Info)
{
	npc = dmt_1215_kelios;
	nr = 1;
	condition = dmt_1215_kelios_test_condition;
	information = dmt_1215_kelios_test_info;
	permanent = FALSE;
	description = "Мне удалось пройти ритуал Очищения Огнем!";
};


func int dmt_1215_kelios_test_condition()
{
	if((MIS_GUARDIANSTEST == LOG_Running) && (MIS_KELIOSTEST == LOG_Running) && (KELIOSFIRETEST == TRUE))
	{
		return TRUE;
	};
};

func void dmt_1215_kelios_test_info()
{
	B_GivePlayerXP(150);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	AI_Output(other,self,"DMT_1215_Kelios_Test_00");	//Мне удалось пройти ритуал Очищения Огнем!
	AI_Output(self,other,"DMT_1215_Kelios_Test_01");	//(властно) Я уже знаю об этом. Священный Огонь очистил твою душу и наделил мудростью твой разум.
	AI_Output(self,other,"DMT_1215_Kelios_Test_02");	//Теперь эта стихия будет к тебе более благосклонна. Думаю, что ты и сам это почувствовал.
	AI_Output(other,self,"DMT_1215_Kelios_Test_03");	//Да, так оно и есть.
	AI_Output(self,other,"DMT_1215_Kelios_Test_04");	//Не сомневаюсь. Что же касается твоего испытания, то я признаю его тобою пройденным.
	AI_Output(self,other,"DMT_1215_Kelios_Test_05");	//И в связи с этим, властью, данной мне Огнем, даю тебе свое согласие на принятие в адепты Круга Хранителей.
	AI_Output(self,other,"DMT_1215_Kelios_Test_06");	//Твои способности удивили меня, и мне кажется, твое присутствие в наших рядах не заставит себя долго ждать!
	AI_Output(self,other,"DMT_1215_Kelios_Test_07");	//Теперь же иди, избранный. Ищи следующего из нас.
	AI_Output(self,other,"DMT_1215_Kelios_Test_08");	//И пусть священный Огонь хранит твой путь!
	other.protection[PROT_FIRE] += 5;
	REALPROTFIRE += 5;
	AI_Print(PRINT_LEARNPROTHOT);
	MIS_KELIOSTEST = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_KELIOSTEST,LOG_SUCCESS);
	B_LogEntry(TOPIC_KELIOSTEST,"Я прошел ритуал Очищения Огнем и тем самым прошел испытание Хранителя Келиоса.");
	Log_AddEntry(TOPIC_GUARDIANSTEST,"Хранитель Келиос дал мне свое согласие на принятие в адепты их Круга.");
	KELIOS_AGREE = TRUE;
	Info_ClearChoices(dmt_1215_kelios_test);
	Info_AddChoice(dmt_1215_kelios_test,"(закончить разговор)",dmt_1215_kelios_test_end);
};

func void dmt_1215_kelios_test_end()
{
	Npc_ExchangeRoutine(self,"WaitInSecretLab");
	AI_StopProcessInfos(self);
	B_Attack(self,other,0,0);
};

