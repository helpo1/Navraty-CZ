
instance DIA_NIGEL_EXIT(C_Info)
{
	npc = vlk_6110_nigel;
	nr = 999;
	condition = dia_nigel_exit_condition;
	information = dia_nigel_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_nigel_exit_condition()
{
	return TRUE;
};

func void dia_nigel_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NIGEL_PICKPOCKET(C_Info)
{
	npc = vlk_6110_nigel;
	nr = 900;
	condition = dia_nigel_pickpocket_condition;
	information = dia_nigel_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_nigel_pickpocket_condition()
{
	return C_Beklauen(30,28);
};

func void dia_nigel_pickpocket_info()
{
	Info_ClearChoices(dia_nigel_pickpocket);
	Info_AddChoice(dia_nigel_pickpocket,Dialog_Back,dia_nigel_pickpocket_back);
	Info_AddChoice(dia_nigel_pickpocket,DIALOG_PICKPOCKET,dia_nigel_pickpocket_doit);
};

func void dia_nigel_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_nigel_pickpocket);
};

func void dia_nigel_pickpocket_back()
{
	Info_ClearChoices(dia_nigel_pickpocket);
};


instance DIA_NIGEL_HALLO(C_Info)
{
	npc = vlk_6110_nigel;
	nr = 2;
	condition = dia_nigel_hallo_condition;
	information = dia_nigel_hallo_info;
	permanent = FALSE;
	description = "Говорят, что ты задолжал много денег.";
};


func int dia_nigel_hallo_condition()
{
	if((MIS_KILLTARGET4 == LOG_Running) && (Npc_KnowsInfo(hero,dia_nigel_meetfirst) == TRUE))
	{
		return TRUE;
	};
};

func void dia_nigel_hallo_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Nigel_Hallo_01_00");	//Говорят, что ты задолжал много денег одному торговцу и не хочешь их возвращать.
	AI_Output(self,other,"DIA_Nigel_Hallo_01_01");	//(нервно) Мало ли что говорят? А ты вообще кто такой?
	AI_Output(other,self,"DIA_Nigel_Hallo_01_02");	//Я тот, кого послали заставить тебя заплатить по счетам. Или ты думал легко отделаться?
	AI_Output(self,other,"DIA_Nigel_Hallo_01_03");	//А с чего ты взял, что я вообще кому-то что-то должен? И вообще, я не понимаю, о чем ты говоришь.
	AI_Output(other,self,"DIA_Nigel_Hallo_01_04");	//Тебя ведь зовут Найджел, не так ли?
	AI_Output(self,other,"DIA_Nigel_Hallo_01_05");	//Ну да - это я.
	AI_Output(other,self,"DIA_Nigel_Hallo_01_06");	//Значит, я не ошибся - именно ты мне и нужен. Так что хватит строить из себя непонимающего идиота!
	AI_Output(other,self,"DIA_Nigel_Hallo_01_07");	//Отдай мне долг, или ты обретешь на свою голову столько неприятностей, сколько и представить трудно.
	AI_Output(self,other,"DIA_Nigel_Hallo_01_08");	//Да ну? (смеется) И как же ты собираешься мне устроить все эти неприятности?
	AI_Output(other,self,"DIA_Nigel_Hallo_01_09");	//Дам тебе совет: лучше отдай мне эти деньги по-хорошему. Если ты, конечно, не хочешь умереть.
	AI_Output(self,other,"DIA_Nigel_Hallo_01_12");	//Ты мне что, угрожаешь?! Думаешь, я тебя боюсь?
	AI_Output(other,self,"DIA_Nigel_Hallo_01_15");	//Ну, это легко проверить. Ты готов рискнуть?
	AI_Output(self,other,"DIA_Nigel_Hallo_01_16");	//М-ммм-м...(нервно соображает)
	AI_Output(other,self,"DIA_Nigel_Hallo_01_17");	//Я вижу, что не очень - в твоих глазах лишь страх.
	AI_Output(self,other,"DIA_Nigel_Hallo_01_18");	//(обреченно) Думай и говори, что хочешь! Этих денег ты все равно не получишь!
	Info_ClearChoices(dia_nigel_hallo);
	Info_AddChoice(dia_nigel_hallo,"Даю тебе последний шанс, Найджел.",dia_nigel_hallo_nokill);
	Info_AddChoice(dia_nigel_hallo,"Тогда придется все-таки убить тебя!",dia_nigel_hallo_kill);
};

func void dia_nigel_hallo_kill()
{
	AI_Output(other,self,"DIA_Nigel_Hallo_Kill_01_00");	//Тогда придется все-таки убить тебя!
	AI_Output(self,other,"DIA_Nigel_Hallo_Kill_01_01");	//Ты... ты не можешь так поступить!...(в панике) Я... я не виноват!
	AI_Output(other,self,"DIA_Nigel_Hallo_Kill_01_02");	//Все так говорят.	
	AI_Output(self,other,"DIA_Nigel_Hallo_Kill_01_03");	//(обреченно) Черт... черт... черт!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_ReactToWeapon,0);
};

func void dia_nigel_hallo_nokill()
{
	AI_Output(other,self,"DIA_Nigel_Hallo_NoKill_01_00");	//Даю тебе последний шанс, Найджел.
	AI_Output(other,self,"DIA_Nigel_Hallo_NoKill_01_01");	//Отдай мне деньги! И я оставлю тебя в покое.
	AI_Output(other,self,"DIA_Nigel_Hallo_NoKill_01_03");	//Отдать тебе их придется в любом случае. Без них я отсюда не уйду.
	AI_Output(self,other,"DIA_Nigel_Hallo_Kill_01_03");	//(обреченно) Черт... черт... черт!
	AI_Output(self,other,"DIA_Nigel_Hallo_NoKill_01_08");	//(обреченно) Но у меня их нет...
	AI_Output(other,self,"DIA_Nigel_Hallo_NoKill_01_09");	//Как нет?!
	AI_Output(self,other,"DIA_Nigel_Hallo_NoKill_01_11");	//(в истерике) Меня ограбили! У меня нет этих денег.
	AI_Output(other,self,"DIA_Nigel_Hallo_NoKill_01_12");	//Хммм...
	AI_Output(self,other,"DIA_Nigel_Hallo_NoKill_01_13");	//Я собирался купить на них товар на ферме Онара и прибыльно продать его в городе...
	AI_Output(self,other,"DIA_Nigel_Hallo_NoKill_01_14");	//Но на пути между таверной и городом на меня напали бандиты. Они забрали все, в том числе и эти деньги.
	Info_ClearChoices(dia_nigel_hallo);
	Info_AddChoice(dia_nigel_hallo,"Я тебе не верю.",dia_nigel_hallo_notrust);
	Info_AddChoice(dia_nigel_hallo,"Где именно на тебя напали бандиты?",dia_nigel_hallo_trust);
};

func void dia_nigel_hallo_notrust()
{
	AI_Output(other,self,"DIA_Nigel_Hallo_NoTrust_01_00");	//Я тебе не верю.
	AI_Output(self,other,"DIA_Nigel_Hallo_NoTrust_01_01");	//Но я говорю чистую правду!
	AI_Output(other,self,"DIA_Nigel_Hallo_NoTrust_01_02");	//Послушай - меня интересуют только деньги, а у тебя их нет.
	AI_Output(other,self,"DIA_Nigel_Hallo_NoTrust_01_03");	//То, что тебя ограбили, - это твои личные проблемы. Так что придется тебе все-таки заплатить.	
	AI_Output(self,other,"DIA_Nigel_Hallo_Kill_01_01");	//Ты... ты не можешь так поступить! (в панике) Я... я не виноват!
	AI_Output(other,self,"DIA_Nigel_Hallo_Kill_01_02");	//Все так говорят.	
	AI_Output(self,other,"DIA_Nigel_Hallo_Kill_01_03");	//(обреченно) Черт... черт... черт!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_ReactToWeapon,0);
};

func void dia_nigel_hallo_trust()
{
	AI_Output(other,self,"DIA_Nigel_Hallo_Trust_01_00");	//Где именно на тебя напали бандиты?
	AI_Output(self,other,"DIA_Nigel_Hallo_Trust_01_01");	//Совсем недалеко от города, в пролеске, что тянется вдоль городских стен.
	AI_Output(self,other,"DIA_Nigel_Hallo_Trust_01_02");	//Я... даже предположить не мог, что на меня смогут напасть в этом месте.
	AI_Output(other,self,"DIA_Nigel_Hallo_Trust_01_04");	//Ладно! Надеюсь, ты не врешь, - иначе я вернусь и отрежу твой лживый язык.
	AI_Output(self,other,"DIA_Nigel_Hallo_Trust_01_03");	//Все это чистая правда, клянусь!
	AI_Output(other,self,"DIA_Nigel_Hallo_Trust_01_05");	//Сколько бандитов на тебя напало?
	AI_Output(self,other,"DIA_Nigel_Hallo_Trust_01_06");	//По меньшей мере трое! Я точно не помню. Я просто так испугался, что...(заикается)
	AI_Output(other,self,"DIA_Nigel_Hallo_Trust_01_07");	//Можешь не продолжать, я понял, о чем ты.
	AI_Output(other,self,"DIA_Nigel_Hallo_Trust_01_08");	//Ну что же, придется, видимо, навестить этих бандитов и вернуть твое золото.
	AI_Output(self,other,"DIA_Nigel_Hallo_Trust_01_09");	//Я на это очень надеюсь! Если у тебя получится вернуть это золото - верни его торговцу.
	AI_Output(self,other,"DIA_Nigel_Hallo_Trust_01_10");	//Мне оно и так уже доставило столько проблем и головной боли, что уже больше некуда.
	AI_Output(other,self,"DIA_Nigel_Hallo_Trust_01_11");	//А у тебя есть предложение получше?
	AI_Output(self,other,"DIA_Nigel_Hallo_Trust_01_12");	//Ну...(с опаской) Я, конечно, не могу расcчитывать на то, что ты вернешь их мне...
	AI_Output(self,other,"DIA_Nigel_Hallo_Trust_01_13");	//Но если ты бы смог это сделать...(с надеждой)
	AI_Output(self,other,"DIA_Nigel_Hallo_Trust_01_15");	//...я смог бы провернуть то дельце, что задумывал.
	B_LogEntry(TOPIC_KILLTARGET4,"Найджел сказал, что у него нет денег. Его ограбили бандиты, которые промышляют недалеко от восточных ворот города. Придется наведаться к этим парням, если я хочу вернуть золото Асмалу.");
	Info_ClearChoices(dia_nigel_hallo);
	Info_AddChoice(dia_nigel_hallo,"Мне это не интересно.",dia_nigel_hallo_nodeal);
	Info_AddChoice(dia_nigel_hallo,"А мне-то что до этого дельца?",dia_nigel_hallo_deal);
	GRABTARGET4 = TRUE;
};

func void dia_nigel_hallo_nodeal()
{
	AI_Output(other,self,"DIA_Nigel_Hallo_NoDeal_01_00");	//Мне это не интересно.
	AI_Output(self,other,"DIA_Nigel_Hallo_NoDeal_01_01");	//Как скажешь - дело твое. Но если ты все-таки передумаешь, то ты знаешь, где меня найти.
	AI_Output(other,self,"DIA_Nigel_Hallo_NoDeal_01_02");	//Вряд ли я передумаю. Но уж поверь, про тебя я не забуду. Тем более если ты мне соврал про бандитов.
	AI_Output(self,other,"DIA_Nigel_Hallo_NoDeal_01_03");	//(нервно) Зачем мне врать?
	AI_Output(self,other,"DIA_Nigel_Hallo_NoDeal_01_06");	//Надеюсь, что ты вернешь это золото.
	AI_StopProcessInfos(self);
	Wld_InsertNpc(bdt_6121_nigelband_01,"NW_CITY_TO_FOREST_04_08");
	Wld_InsertNpc(bdt_6122_nigelband_02,"NW_CITY_TO_FOREST_04_09");
	Wld_InsertNpc(bdt_6123_nigelband_03,"NW_BDT_NIGEL_03");
};

func void dia_nigel_hallo_deal()
{
	AI_Output(other,self,"DIA_Nigel_Hallo_Deal_01_00");	//А мне-то что до этого дельца?
	AI_Output(self,other,"DIA_Nigel_Hallo_Deal_01_01");	//Я мог бы вернуть тебе гораздо больше золота, чем должен.
	AI_Output(self,other,"DIA_Nigel_Hallo_Deal_01_03");	//Ты ведь, наверное, в курсе недавних проблем города с Онаром и другими крестьянами.
	AI_Output(self,other,"DIA_Nigel_Hallo_Deal_01_04");	//Из-за всего этого поставки еды в город резко сократились, и торговцы готовы выложить куда больше золота за лишнюю партию продовольствия.
	AI_Output(self,other,"DIA_Nigel_Hallo_Deal_01_05");	//И, как сам понимаешь, на этом можно хорошо нагреть руки. Естественно, если знать, как вести торговлю.
	AI_Output(self,other,"DIA_Nigel_Hallo_Deal_01_06");	//Правда, как сам видишь, все это сопряжено с большим риском. Округа просто кишит разбойниками!
	AI_Output(other,self,"DIA_Nigel_Hallo_Deal_01_07");	//Хммм... И какова будет моя доля в этом деле?
	AI_Output(self,other,"DIA_Nigel_Hallo_Deal_01_08");	//Думаю, около ста золотых. Конечно, с учетом тех денег, что я должен.
	AI_Output(self,other,"DIA_Nigel_Hallo_Deal_01_09");	//Это хорошие деньги... Что скажешь?
	Info_ClearChoices(dia_nigel_hallo);
	Info_AddChoice(dia_nigel_hallo,"Договорились.",dia_nigel_hallo_dealyes);
	Info_AddChoice(dia_nigel_hallo,"Слишком мало!",dia_nigel_hallo_dealbad);
};

func void dia_nigel_hallo_dealbad()
{
	AI_Output(other,self,"DIA_Nigel_Hallo_DealBad_01_00");	//Слишком мало! Я не буду терять время на такие мелочи.
	AI_Output(self,other,"DIA_Nigel_Hallo_NoDeal_01_01");	//Как скажешь - дело твое. Но если ты все-таки передумаешь, то ты знаешь, где меня найти.
	AI_Output(other,self,"DIA_Nigel_Hallo_NoDeal_01_02");	//Вряд ли я передумаю. Но уж поверь, про тебя я не забуду. Тем более если ты мне наврал по поводу бандитов.
	AI_Output(self,other,"DIA_Nigel_Hallo_NoDeal_01_03");	//(нервно) Зачем мне врать?
	AI_Output(self,other,"DIA_Nigel_Hallo_NoDeal_01_06");	//Надеюсь, что ты вернешь это золото.
	AI_StopProcessInfos(self);
	Wld_InsertNpc(bdt_6121_nigelband_01,"NW_CITY_TO_FOREST_04_08");
	Wld_InsertNpc(bdt_6122_nigelband_02,"NW_CITY_TO_FOREST_04_09");
	Wld_InsertNpc(bdt_6123_nigelband_03,"NW_BDT_NIGEL_03");
};

func void dia_nigel_hallo_dealyes()
{
	AI_Output(other,self,"DIA_Nigel_Hallo_DealYes_01_00");	//Хорошо. Считай, что мы договорились.
	AI_Output(self,other,"DIA_Nigel_Hallo_DealYes_01_01");	//Вот и славно! И никто не останется в накладе.
	AI_Output(self,other,"DIA_Nigel_Hallo_DealYes_01_02");	//Теперь тебе осталось только разобраться с этими бандитами.
	AI_Output(self,other,"DIA_Nigel_Hallo_DealYes_01_03");	//У них при себе должен быть мой кошелек с деньгами, который они забрали у меня. В нем все те деньги, которые я занял у торговца.
	AI_Output(self,other,"DIA_Nigel_Hallo_DealYes_01_04");	//Просто принеси его мне, а об остальном я сам позабочусь. Я буду ждать тебя тут. Только умоляю тебя, поторопись!
	AI_Output(other,self,"DIA_Nigel_Hallo_DealYes_01_05");	//Я постараюсь побыстрее уладить эту проблему.
	MIS_NIGELMATTER = LOG_Running;
	Log_CreateTopic(TOPIC_NIGELMATTER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_NIGELMATTER,LOG_Running);
	B_LogEntry(TOPIC_NIGELMATTER,"Найджел сделал мне предложение: если я верну ему деньги, он хочет пустить их в оборот, а часть прибыли, которую он с этого поимеет, будет моя. Я решил согласиться. А Асмал со своим долгом пусть подождет. Осталось разобраться с бандитами, ограбившими Найджела, и принести ему кошелек.");
	AI_StopProcessInfos(self);
	Wld_InsertNpc(bdt_6121_nigelband_01,"NW_CITY_TO_FOREST_04_08");
	Wld_InsertNpc(bdt_6122_nigelband_02,"NW_CITY_TO_FOREST_04_09");
	Wld_InsertNpc(bdt_6123_nigelband_03,"NW_BDT_NIGEL_03");
};


instance DIA_NIGEL_MONEYBACK(C_Info)
{
	npc = vlk_6110_nigel;
	nr = 2;
	condition = dia_nigel_moneyback_condition;
	information = dia_nigel_moneyback_info;
	permanent = FALSE;
	description = "Держи свой кошелек.";
};

func int dia_nigel_moneyback_condition()
{
	if((Npc_HasItems(other,itse_nigelpocket) >= 1) && (MIS_NIGELMATTER == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_nigel_moneyback_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_Nigel_MoneyBack_01_00");	//Держи свой кошелек.
	B_GiveInvItems(other,self,itse_nigelpocket,1);
	Npc_RemoveInvItems(self,itse_nigelpocket,Npc_HasItems(self,itse_nigelpocket));
	AI_Output(self,other,"DIA_Nigel_MoneyBack_01_01");	//(радостно) Ого! Это действительно он. Как тебе это удалось?
	AI_Output(other,self,"DIA_Nigel_MoneyBack_01_02");	//Тебе лучше не знать.
	AI_Output(self,other,"DIA_Nigel_MoneyBack_01_03");	//Ладно, можешь не рассказывать. Главное, что ты смог вернуть мне эти деньги, и теперь можно снова спокойно заняться делом.
	AI_Output(other,self,"DIA_Nigel_MoneyBack_01_04");	//Что насчет нашего уговора?
	AI_Output(self,other,"DIA_Nigel_MoneyBack_01_05");	//Как и договаривались!
	AI_Output(self,other,"DIA_Nigel_MoneyBack_01_07");	//Не переживай, я умею держать свое слово. Ведь для делового человека это основополагающий залог успеха...(смеется)
	AI_Output(other,self,"DIA_Nigel_MoneyBack_01_08");	//И когда я получу свое обещанное золото?
	AI_Output(self,other,"DIA_Nigel_MoneyBack_01_09");	//Терпение, мой друг, терпение! Так быстро дела не ведутся.
	AI_Output(self,other,"DIA_Nigel_MoneyBack_01_10");	//Торговля - это не такое простое дело, как некоторые полагают!
	AI_Output(self,other,"DIA_Nigel_MoneyBack_01_11");	//Хмм...(подсчитывает) Думаю, на все про все у меня уйдет максимум дня три. Так что придется тебе немного подождать.
	AI_Output(self,other,"DIA_Nigel_MoneyBack_01_12");	//Ну, а потом ты сможешь прийти и спокойно забрать свою долю от нашего дельца.
	AI_Output(other,self,"DIA_Nigel_MoneyBack_01_15");	//И где тебя искать через три дня?
	AI_Output(self,other,"DIA_Nigel_MoneyBack_01_16");	//Ты сможешь меня найти на ферме Онара, я буду там все это время.
	AI_Output(self,other,"DIA_Nigel_MoneyBack_01_20");	//Будь спокоен! Ты получишь все, что тебе причитается.
	AI_Output(other,self,"DIA_Nigel_MoneyBack_01_21");	//До встречи.
	AI_Output(self,other,"DIA_Nigel_MoneyBack_01_22");	//Всего хорошего.
	AI_StopProcessInfos(self);
	B_LogEntry(TOPIC_NIGELMATTER,"Я вернул Найджелу его кошелек. Теперь я должен встретиться с ним через три дня на ферме Онара, чтобы забрать свою долю.");
	NIGELMATTERDAY = Wld_GetDay();
	Npc_ExchangeRoutine(vlk_6110_nigel,"OnarFarm");
};


instance DIA_NIGEL_MONEYNOW(C_Info)
{
	npc = vlk_6110_nigel;
	nr = 2;
	condition = dia_nigel_moneynow_condition;
	information = dia_nigel_moneynow_info;
	permanent = TRUE;
	description = "Как поживает моя доля?";
};


func int dia_nigel_moneynow_condition()
{
	if((MIS_NIGELMATTER == LOG_Running) && Npc_KnowsInfo(hero,dia_nigel_moneyback))
	{
		return TRUE;
	};
};

func void dia_nigel_moneynow_info()
{
	var int daynow;
	daynow = Wld_GetDay();
	AI_Output(other,self,"DIA_Nigel_MoneyNow_01_00");	//Что насчет моей доли?
	if(NIGELMATTERDAY <= (daynow - 3))
	{
		AI_Output(self,other,"DIA_Nigel_MoneyNow_01_01");	//Да, конечно, как и договаривались.
		AI_Output(self,other,"DIA_Nigel_MoneyNow_01_02");	//Вот, держи - этот кошелек, что ты вернул мне...
		B_GiveInvItems(self,other,itse_nigelpocket,1);
		AI_Output(self,other,"DIA_Nigel_MoneyNow_01_0A");	//...и в довесок к нему еще сто золотых!
		B_GiveInvItems(self,other,ItMi_Gold,100);
		AI_Output(self,other,"DIA_Nigel_MoneyNow_01_03");	//Ну, что теперь скажешь? Не зря ты согласился на мое предложение?
		AI_Output(other,self,"DIA_Nigel_MoneyNow_01_04");	//Да, кажется, не зря. Твое дельце действительно оказалось достаточно выгодным.
		AI_Output(self,other,"DIA_Nigel_MoneyNow_01_05");	//Еще бы! Я тебе больше скажу...
		AI_Output(self,other,"DIA_Nigel_MoneyNow_01_06");	//Торговля - это чрезвычайно прибыльное дело, если, конечно, знаешь, как подойти к этому вопросу.

		if((MEMBERTRADEGUILD == FALSE) && (MIS_TRADEGUILD != LOG_FAILED) && (NIGELTELLABOUTGUILD == FALSE) && (EROLTELLABOUTGUILD == FALSE))
		{
			AI_Output(self,other,"DIA_Nigel_MoneyNow_01_09");	//Это точно. А ты сам никогда не подумывал стать торговцем?
			AI_Output(other,self,"DIA_Nigel_MoneyNow_01_10");	//Никогда не задумывался над этим, у меня были дела поважней.
			AI_Output(self,other,"DIA_Nigel_MoneyNow_01_11");	//А зря! Мне кажется, у тебя есть талант к этому делу.
			AI_Output(self,other,"DIA_Nigel_MoneyNow_01_13");	//Думаю, тебе стоит попробовать.
			AI_Output(other,self,"DIA_Nigel_MoneyNow_01_15");	//И с чего ты предлагаешь мне начать?
			AI_Output(self,other,"DIA_Nigel_MoneyNow_01_16");	//Хммм...(задумчиво) Трудно сказать сразу, хотя...(задумался)... Хотя вот что!
			AI_Output(self,other,"DIA_Nigel_MoneyNow_01_19");	//Я напишу для тебя рекомендательное письмо для одного моего друга. Он примет тебя!
			AI_Output(self,other,"DIA_Nigel_MoneyNow_01_21");	//Этот мой друг - очень влиятельное лицо в городе, а кроме того он - мастер гильдии торговцев, что находится в Хоринисе.
			AI_Output(other,self,"DIA_Nigel_MoneyNow_01_22");	//Гильдии торговцев? Никогда не слышал о такой.
			AI_Output(self,other,"DIA_Nigel_MoneyNow_01_23");	//Конечно не слышал! Все, кто состоит в ней, стараются не особо распространяться об этом. Тем более, в такие неспокойные времена.
			AI_Output(other,self,"DIA_Nigel_MoneyNow_01_25");	//И что я ему скажу?
			AI_Output(self,other,"DIA_Nigel_MoneyNow_01_26");	//Ничего особенного тебе говорить и не надо. Я все сам скажу за тебя в этом письме.
			AI_Output(other,self,"DIA_Nigel_MoneyNow_01_28");	//Он примет меня в гильдию торговцев?
			AI_Output(self,other,"DIA_Nigel_MoneyNow_01_29");	//Ну да. А что ты так удивлен? (смеется)
			AI_Output(self,other,"DIA_Nigel_MoneyNow_01_30");	//Чем не лучший способ научиться этому ремеслу, как именно в гильдии? Ведь просто так тебя учить никто не станет.
			AI_Output(self,other,"DIA_Nigel_MoneyNow_01_33");	//Конечно, ты волен сам решать что тебе делать, но...
			AI_Output(self,other,"DIA_Nigel_MoneyNow_01_34");	//...дам тебе совет: не упускай этот шанс!
			B_UseFakeScroll();
			AI_Output(self,other,"DIA_Nigel_MoneyNow_01_35");	//Вот, возьми письмо и отнеси его господину Лютеро.
			B_GiveInvItems(self,other,itwr_nigelletter,1);
			AI_Output(other,self,"DIA_Nigel_MoneyNow_01_36");	//Лютеро?
			AI_Output(self,other,"DIA_Nigel_MoneyNow_01_37");	//Да, именно ему. Наверняка ты уже знаком с ним и знаешь, где он живет.
			AI_Output(self,other,"DIA_Nigel_MoneyNow_01_38");	//Так что тебе не составит большого труда найти его.
			AI_Output(other,self,"DIA_Nigel_MoneyNow_01_39");	//Ну, тогда спасибо!
			AI_Output(self,other,"DIA_Nigel_MoneyNow_01_40");	//Да не за что! В конце концов, я хотел отблагодарить тебя за то, что ты спас мою репутацию и мое золото.
			AI_Output(self,other,"DIA_Nigel_MoneyNow_01_41");	//Думаю, этого письма будет вполне достаточно, что вернуть тебе этот должок.
			AI_Output(self,other,"DIA_Nigel_MoneyNow_01_42");	//А то терпеть не могу, когда я кому-то что-то или за что-то должен, если ты понимаешь, о чем я.
			AI_Output(self,other,"DIA_Nigel_MoneyNow_01_46");	//Пока.
			AI_Output(other,self,"DIA_Nigel_MoneyNow_01_45");	//Еще увидимся!
			NIGELTELLABOUTGUILD = TRUE;
			B_LogEntry(TOPIC_NIGELMATTER,"Найджел не соврал - его дело оказалось весьма выгодным. Он вернул мне кошелек с двумя тысячами монет, вдобавок приложив к нему еще сто золотых.");
			Log_SetTopicStatus(TOPIC_NIGELMATTER,LOG_SUCCESS);
			MIS_NIGELMATTER = LOG_SUCCESS;
			AI_StopProcessInfos(self);
		}
		else
		{
			AI_Output(self,other,"DIA_Nigel_MoneyNow_01_07");	//Поверь, это так!
			B_LogEntry(TOPIC_NIGELMATTER,"Найджел не соврал - его дело оказалось весьма выгодным. Он вернул мне кошелек с двумя тысячами монет, вдобавок приложив к нему еще сто золотых.");
			Log_SetTopicStatus(TOPIC_NIGELMATTER,LOG_SUCCESS);
			MIS_NIGELMATTER = LOG_SUCCESS;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Nigel_MoneyNow_01_47");	//Какой же ты нетерпеливый! Разве три дня уже прошло?
		AI_Output(self,other,"DIA_Nigel_MoneyNow_01_54");	//Так что лучше не отвлекай меня от дел и займись чем-нибудь действительно полезным. Хорошо?
		AI_StopProcessInfos(self);
	};
};

instance DIA_NIGEL_MONEY_NEW(C_Info)
{
	npc = vlk_6110_nigel;
	nr = 2;
	condition = dia_nigel_money_new_condition;
	information = dia_nigel_money_new_info;
	permanent = FALSE;
	description = "Знаешь, а я ведь спас тебе жизнь!";
};

func int dia_nigel_money_new_condition()
{
	if((RhetorikSkillValue[1] >= 30) && (MIS_NIGELMATTER == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_nigel_money_new_info()
{
	AI_Output(other,self,"DIA_Nigel_MoneyNew_01_01");	//Знаешь, а я ведь спас тебе жизнь.
	AI_Output(other,self,"DIA_Nigel_MoneyNew_01_02");	//И мне кажется, что ты просто посмеялся надо мной с этой сотней золотых.
	AI_Output(self,other,"DIA_Nigel_MoneyNew_01_03");	//Нет, что ты...(нервно) Прости, на самом деле я очень благодарен тебе!
	AI_Output(self,other,"DIA_Nigel_MoneyNew_01_04");	//Просто торговцу так всегда трудно расставаться с золотом.
	AI_Output(other,self,"DIA_Nigel_MoneyNew_01_05");	//Полагаю, что сейчас тебе просто необходимо это сделать.
	AI_Output(self,other,"DIA_Nigel_MoneyNew_01_06");	//Да, конечно... Вот, возьми! Этого, я надеюсь, теперь тебе хватит.
	B_GiveInvItems(self,other,ItMi_Gold,500);
	AI_Output(self,other,"DIA_Nigel_MoneyNew_01_07");	//Вполне.
};

instance DIA_NIGEL_MEETFIRST(C_Info)
{
	npc = vlk_6110_nigel;
	nr = 1;
	condition = dia_nigel_meetfirst_condition;
	information = dia_nigel_meetfirst_info;
	permanent = FALSE;
	description = "Привет, ты кто?";
};

func int dia_nigel_meetfirst_condition()
{
	return TRUE;
};

func void dia_nigel_meetfirst_info()
{
	AI_Output(other,self,"DIA_Nigel_MeetFirst_01_00");	//Привет, ты кто?
	AI_Output(self,other,"DIA_Nigel_MeetFirst_01_01");	//Меня зовут Найджел. Я торговец.
};


instance DIA_NIGEL_SELLWHAT(C_Info)
{
	npc = vlk_6110_nigel;
	nr = 1;
	condition = dia_nigel_sellwhat_condition;
	information = dia_nigel_sellwhat_info;
	permanent = TRUE;
	description = "Ты что-нибудь продаешь?";
};


func int dia_nigel_sellwhat_condition()
{
	if((KNOWS_NIGEL == FALSE) && (Npc_KnowsInfo(hero,dia_nigel_meetfirst) || (MASTERTRADEGUILD == TRUE)))
	{
		return TRUE;
	};
};

func void dia_nigel_sellwhat_info()
{
	if((MIS_NIGELMATTER == LOG_SUCCESS) || (MASTERTRADEGUILD == TRUE))
	{
		AI_Output(other,self,"DIA_Nigel_SellWhat_01_00");	//Ты что-нибудь продаешь?
		AI_Output(self,other,"DIA_Nigel_SellWhat_01_01");	//О да! Теперь я смогу тебе продать все, что пожелаешь.

		if(KNOWS_NIGEL == FALSE)
		{
			Log_CreateTopic(Topic_OutTrader,LOG_NOTE);
			B_LogEntry(Topic_OutTrader,"Торговец Найджел теперь сможет мне продавать свои товары.");
			KNOWS_NIGEL = TRUE;
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Nigel_SellWhat_01_02");	//Ты что-нибудь продаешь?
		AI_Output(self,other,"DIA_Nigel_SellWhat_01_03");	//Сейчас я ничего не продаю. Видишь ли, мои дела идут не слишком хорошо.
		AI_Output(self,other,"DIA_Nigel_SellWhat_01_04");	//Так что извини - ничем помочь не могу.
	};
};

instance DIA_NIGEL_TRADE(C_Info)
{
	npc = vlk_6110_nigel;
	nr = 800;
	condition = dia_nigel_trade_condition;
	information = dia_nigel_trade_info;
	permanent = TRUE;
	description = "Покажи мне, что у тебя есть.";
	trade = TRUE;
};

func int dia_nigel_trade_condition()
{
	if((KNOWS_NIGEL == TRUE) && Wld_IsTime(10,0,20,0))
	{
		return TRUE;
	};
};

func void dia_nigel_trade_info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Nigel_TRADE_01_00");	//Покажи мне, что у тебя есть.
	AI_Output(self,other,"DIA_Nigel_TRADE_01_01");	//Для тебя - самое лучшее!
	B_GiveTradeInv(self);
};