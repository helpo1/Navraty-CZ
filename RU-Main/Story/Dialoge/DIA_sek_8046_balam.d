
instance DIA_BALAM_EXIT(C_Info)
{
	npc = sek_8046_balam;
	nr = 999;
	condition = dia_balam_exit_condition;
	information = dia_balam_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_balam_exit_condition()
{
	return TRUE;
};

func void dia_balam_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BALAM_NOFOREVER(C_Info)
{
	npc = sek_8046_balam;
	nr = 5;
	condition = dia_balam_noforever_condition;
	information = dia_balam_noforever_info;
	permanent = FALSE;
	description = "Кто вы?";
};


func int dia_balam_noforever_condition()
{
	return TRUE;
};

func void dia_balam_noforever_info()
{
	AI_Output(other,self,"DIA_Balam_NoForever_01_00");	//Кто вы?
	AI_Output(self,other,"DIA_Balam_NoForever_01_01");	//(гордо) Мы - сборщики болотника!
	AI_Output(self,other,"DIA_Balam_NoForever_01_02");	//Братству требуется очень много болотника. И наша задача - собрать его как можно больше.
};


instance DIA_BALAM_PSIINFO(C_Info)
{
	npc = sek_8046_balam;
	nr = 5;
	condition = dia_balam_psiinfo_condition;
	information = dia_balam_psiinfo_info;
	permanent = FALSE;
	description = "Братству? Какому Братству?!";
};


func int dia_balam_psiinfo_condition()
{
	if(!Npc_KnowsInfo(hero,dia_tpl_8014_templer_first) && !Npc_KnowsInfo(hero,dia_hanis_psiinfo) && !Npc_KnowsInfo(hero,dia_shrat_psiinfo) && Npc_KnowsInfo(hero,dia_balam_noforever))
	{
		return TRUE;
	};
};

func void dia_balam_psiinfo_info()
{
	AI_Output(other,self,"DIA_Balam_PsiInfo_01_00");	//Братству? Какому Братству?
	AI_Output(self,other,"DIA_Balam_PsiInfo_01_01");	//Братству Спящего! Хотя теперь его можно называть просто - Братство.
	AI_Output(other,self,"DIA_Balam_PsiInfo_01_02");	//Но я думал, что после падения барьера Братство Спящего перестало существовать!
	AI_Output(self,other,"DIA_Balam_PsiInfo_01_03");	//Это не так! Конечно, большинство наших братьев погибли, а многие сошли с ума от тлетворного влияния демонических сил.
	AI_Output(self,other,"DIA_Balam_PsiInfo_01_04");	//Но были и такие, кто все же выжил. Именно они стали лидерами нашего нового лагеря.
	AI_Output(other,self,"DIA_Balam_PsiInfo_01_05");	//А где находится ваш лагерь?
	AI_Output(self,other,"DIA_Balam_PsiInfo_01_06");	//Ступай по направлению к проходу в Долину Рудников. Не доходя до самого прохода, ты найдешь небольшую ферму.
	AI_Output(self,other,"DIA_Balam_PsiInfo_01_07");	//Недалеко от нее и находится наша новая обитель.
};


instance DIA_BALAM_HELLO(C_Info)
{
	npc = sek_8046_balam;
	nr = 5;
	condition = dia_balam_hello_condition;
	information = dia_balam_hello_info;
	permanent = FALSE;
	description = "А почему ты не помогаешь остальным?";
};


func int dia_balam_hello_condition()
{
	if(Npc_KnowsInfo(hero,dia_balam_noforever))
	{
		return TRUE;
	};
};

func void dia_balam_hello_info()
{
	AI_Output(other,self,"DIA_Balam_Hello_01_00");	//А почему ты не помогаешь остальным?
	AI_Output(self,other,"DIA_Balam_Hello_01_01");	//А кто, по-твоему, будет следить за тем, чтобы к сборщикам не подобралась какая-нибудь тварь и не сожрала их, а?
	AI_Output(self,other,"DIA_Balam_Hello_01_02");	//Эта местность просто кишит всяким зверьем. Тут надо глядеть в оба!
	AI_Output(other,self,"DIA_Balam_Hello_01_03");	//Об этом я и не подумал.
	AI_Output(self,other,"DIA_Balam_Hello_01_04");	//Вот-вот.
};


instance DIA_BALAM_HELLOTWO(C_Info)
{
	npc = sek_8046_balam;
	nr = 5;
	condition = dia_balam_hellotwo_condition;
	information = dia_balam_hellotwo_info;
	permanent = TRUE;
	description = "Как продвигается сбор болотника?";
};


func int dia_balam_hellotwo_condition()
{
	if(Npc_KnowsInfo(hero,dia_balam_noforever))
	{
		return TRUE;
	};
};

func void dia_balam_hellotwo_info()
{
	AI_Output(other,self,"DIA_Balam_HelloTwo_01_00");	//Как продвигается сбор болотника?
	AI_Output(self,other,"DIA_Balam_HelloTwo_01_01");	//Если ты не будешь приставать к нашим сборщикам, он будет продвигаться еще быстрее!
};

instance DIA_BALAM_GIVEPLANT(C_Info)
{
	npc = sek_8046_balam;
	nr = 5;
	condition = dia_balam_giveplant_condition;
	information = dia_balam_giveplant_info;
	permanent = TRUE;
	description = "Меня прислал Идол Кадар.";
};


func int dia_balam_giveplant_condition()
{
	if((MIS_PLANTSFORBAALCADAR == LOG_Running) && (SEKONGROUPSEK == FALSE) && (other.guild == GIL_SEK) && Npc_KnowsInfo(hero,dia_balam_noforever))
	{
		return TRUE;
	};
};

func void dia_balam_giveplant_info()
{
	var C_Item itm;
	itm = Npc_GetEquippedArmor(other);
	AI_Output(other,self,"DIA_Balam_GivePlant_01_00");	//Меня прислал Идол Кадар.
	AI_Output(self,other,"DIA_Balam_GivePlant_01_01");	//И зачем он это сделал?
	AI_Output(other,self,"DIA_Balam_GivePlant_01_02");	//Он хочет, чтобы я доставил ему собранный вами болотник.
	if((Hlp_IsItem(itm,itar_sekbed) == TRUE) || (Hlp_IsItem(itm,itar_sekbed_v1) == TRUE) || (Hlp_IsItem(itm,itar_slp_ul) == TRUE) || (Hlp_IsItem(itm,itar_slp_l) == TRUE))
	{
		AI_Output(self,other,"DIA_Balam_GivePlant_01_03");	//Хорошо. Вот, возьми. Тут все, что у нас есть.
		B_GiveInvItems(self,other,ItPl_SwampHerb,50);
		AI_Output(self,other,"DIA_Balam_GivePlant_01_04");	//Будь аккуратен с ним! На его сбор мы потратили не меньше месяца.
		SEKONGROUPSEK = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Balam_GivePlant_01_05");	//Ты не похож на человека, которого мог бы прислать Идол Кадар.
		AI_Output(self,other,"DIA_Balam_GivePlant_01_06");	//Я бы не доверил тебе и стебля этой травы!
	};
};

//-----------------PRIORAT---------------------


instance dia_balam_PrioratStart(C_Info)
{
	npc = sek_8046_balam;
	nr = 1;
	condition = dia_balam_PrioratStart_condition;
	information = dia_balam_PrioratStart_info;
	permanent = FALSE;
	description = "Меня прислал Идол Намиб.";
};


func int dia_balam_PrioratStart_condition()
{
	if(MIS_PrioratStart == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_balam_PrioratStart_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"dia_balam_PrioratStart_01_00");	//Меня прислал Идол Намиб.
	AI_Output(self,other,"dia_balam_PrioratStart_01_01");	//О! (уважительно) Так тебя прислал один из наших духовных наставников. И что же ему нужно?
	AI_Output(other,self,"dia_balam_PrioratStart_01_02");	//Он просто хочет удостовериться, что с вами все в порядке.
	AI_Output(self,other,"dia_balam_PrioratStart_01_03");	//С нами все в порядке. Можешь так ему и передать.
	AI_Output(other,self,"dia_balam_PrioratStart_01_04");	//Ну, также ему очень интересно, что вы знаете о пропаже нескольких послушников из лагеря Братства.
	AI_Output(self,other,"dia_balam_PrioratStart_01_05");	//(озадаченно) Откуда же нам знать об этом? Все новости мы узнаем только тогда, когда возвращаемся в лагерь с очередной партией болотной травы.
	AI_Output(self,other,"dia_balam_PrioratStart_01_06");	//А о пропавших послушниках я вообще слышу первый раз.
	AI_Output(other,self,"dia_balam_PrioratStart_01_07");	//Ну, возможно, вы их видели?
	AI_Output(self,other,"dia_balam_PrioratStart_01_08");	//Если бы это было так, то Идол Намиб первым же узнал бы об этом.
	AI_Output(self,other,"dia_balam_PrioratStart_01_09");	//Так что больше мне нечего сказать.
	AI_Output(other,self,"dia_balam_PrioratStart_01_10");	//Ладно, я тебя понял.
	PsiCamp_01_Ok = TRUE;
	B_LogEntry(TOPIC_PrioratStart,"В лагере сборщиков под управлением Балама все спокойно. О пропавших послушниках они ничего не знают.");
};

instance DIA_BALAM_NamibSendTempler(C_Info)
{
	npc = sek_8046_balam;
	nr = 5;
	condition = dia_balam_NamibSendTempler_condition;
	information = dia_balam_NamibSendTempler_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_balam_NamibSendTempler_condition()
{
	if((NamibSendTempler == TRUE) && (CountDownAssInvasion == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_balam_NamibSendTempler_info()
{
	B_GivePlayerXP(100);
	AI_Output(self,other,"DIA_Balam_NamibSendTempler_01_01");	//Опять ты? С чем на этот раз пожаловал?
	AI_Output(other,self,"DIA_Balam_NamibSendTempler_01_02");	//Я тут по просьбе Идола Намиба. Ваш лагерь сборщиков может подвергнуться нападению!
	AI_Output(self,other,"DIA_Balam_NamibSendTempler_01_03");	//(встревоженно) Нападению? Так вот зачем Гуру прислал к нам несколько Стражей.
	AI_Output(other,self,"DIA_Balam_NamibSendTempler_01_04");	//Именно так.
	AI_Output(self,other,"DIA_Balam_NamibSendTempler_01_05");	//Ну хорошо. Надеюсь, что с ними нам будет куда спокойней тут.
	AI_Output(other,self,"DIA_Balam_NamibSendTempler_01_06");	//Можешь в этом не сомневаться.
	CountDownAssInvasion = TRUE;
	CountDownAssInvasionDay = Wld_GetDay();
	CountDownAssInvasionRandomDay = Hlp_Random(2);
};


instance DIA_BALAM_JobInCamp(C_Info)
{
	npc = sek_8046_balam;
	nr = 5;
	condition = dia_balam_JobInCamp_condition;
	information = dia_balam_JobInCamp_info;
	permanent = FALSE;
	description = "Найдется тут для меня какая-нибудь работенка?";
};

func int dia_balam_JobInCamp_condition()
{
	if(CountDownAssInvasion == TRUE)
	{
		return TRUE;
	};
};

func void dia_balam_JobInCamp_info()
{
	AI_Output(other,self,"DIA_Balam_JobInCamp_01_01");	//Найдется тут для меня какая-нибудь работенка?
	AI_Output(self,other,"DIA_Balam_JobInCamp_01_02");	//Хммм...(задумчиво) Если хочешь, то можешь помочь нашим парням со сбором болотника.
	AI_Output(self,other,"DIA_Balam_JobInCamp_01_03");	//По правде говоря, нам действительно не помешали бы лишние руки.
	AI_Output(other,self,"DIA_Balam_JobInCamp_01_04");	//Хорошо. И где мне его искать?
	AI_Output(self,other,"DIA_Balam_JobInCamp_01_05");	//Здесь, вблизи лагеря. Или можешь поискать его на берегу озера. В общем, приноси все, что найдешь. Но не меньше десяти стеблей.
	AI_Output(self,other,"DIA_Balam_JobInCamp_01_06");	//Только будь осторожен! В здешних зарослях иногда водятся довольно опасные твари.
	Log_CreateTopic(TOPIC_JobInCamp,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_JobInCamp,LOG_Running);
	B_LogEntry(TOPIC_JobInCamp,"Балам попросил меня помочь его сборщикам собрать болотную траву. Заняться в лагере нечем, поэтому я решил прогуляться в окрестностях и найти не меньше десяти стеблей болотника.");
	MIS_JobInCamp = LOG_Running;
	AI_StopProcessInfos(self);
	Wld_InsertItem(ItPl_SwampHerb,"FP_ITEM_BALAMSWAMP_01");
	Wld_InsertItem(ItPl_SwampHerb,"FP_ITEM_BALAMSWAMP_02");
	Wld_InsertItem(ItPl_SwampHerb,"FP_ITEM_BALAMSWAMP_03");
	Wld_InsertItem(ItPl_SwampHerb,"FP_ITEM_BALAMSWAMP_04");
	Wld_InsertItem(ItPl_SwampHerb,"FP_ITEM_BALAMSWAMP_05");
	Wld_InsertItem(ItPl_SwampHerb,"FP_ITEM_BALAMSWAMP_06");
	Wld_InsertItem(ItPl_SwampHerb,"FP_ITEM_BALAMSWAMP_07");
	Wld_InsertItem(ItPl_SwampHerb,"FP_ITEM_BALAMSWAMP_08");
	Wld_InsertItem(ItPl_SwampHerb,"FP_ITEM_BALAMSWAMP_09");
	Wld_InsertItem(ItPl_SwampHerb,"FP_ITEM_BALAMSWAMP_10");
	Wld_InsertItem(ItPl_SwampHerb,"FP_ITEM_BALAMSWAMP_11");
	Wld_InsertItem(ItPl_SwampHerb,"FP_ITEM_BALAMSWAMP_12");
	Wld_InsertItem(ItPl_SwampHerb,"FP_ITEM_BALAMSWAMP_13");
	Wld_InsertItem(ItPl_SwampHerb,"FP_ITEM_BALAMSWAMP_14");
	Wld_InsertItem(ItPl_SwampHerb,"FP_ITEM_BALAMSWAMP_15");
};

instance DIA_BALAM_JobInCamp_Done(C_Info)
{
	npc = sek_8046_balam;
	nr = 5;
	condition = dia_balam_JobInCamp_Done_condition;
	information = dia_balam_JobInCamp_Done_info;
	permanent = FALSE;
	description = "У меня есть для тебя немного болотной травы.";
};

func int dia_balam_JobInCamp_Done_condition()
{
	if((MIS_JobInCamp == LOG_Running) && (Npc_HasItems(other,ItPl_SwampHerb) >= 10))
	{
		return TRUE;
	};
};

func void dia_balam_JobInCamp_Done_info()
{
	var int swamp_herbz;
	var int swamp_xp;
	var int swamp_xp_big;

	AI_Output(other,self,"DIA_Balam_JobInCamp_Done_01_01");	//У меня есть для тебя немного болотной травы.
	AI_Output(self,other,"DIA_Balam_JobInCamp_Done_01_02");	//Отлично, парень! Давай ее сюда.

	swamp_xp_big = FALSE;	
	swamp_herbz = Npc_HasItems(hero,ItPl_SwampHerb);
	B_GiveInvItems(other,self,ItPl_SwampHerb,swamp_herbz);
	Npc_RemoveInvItems(self,ItPl_SwampHerb,swamp_herbz);
	swamp_xp_big = swamp_herbz * 50;
	B_GivePlayerXP(swamp_xp_big);

	if(swamp_herbz >= 10)
	{
		AI_Output(other,self,"DIA_Balam_JobInCamp_Done_01_03");	//Вот, держи. Собрал все, что смог найти.
		AI_Output(self,other,"DIA_Balam_JobInCamp_Done_01_04");	//Хорошо. Думаю, этого количества вполне хватит для следующей партии в лагерь.
		AI_Output(self,other,"DIA_Balam_JobInCamp_Done_01_05");	//Ты здорово потрудился! Вот, возьми этот напиток в качестве награды за свои труды.
		B_GiveInvItems(self,other,ItPo_Perm_Health,1);
		AI_Output(other,self,"DIA_Balam_JobInCamp_Done_01_06");	//С удовольствием.
	}
	else
	{
		B_GivePlayerXP(swamp_xp_big);
		AI_Output(other,self,"DIA_Balam_JobInCamp_Done_01_07");	//Вот - все, что у меня есть.
		AI_Output(self,other,"DIA_Balam_JobInCamp_Done_01_08");	//Да, неплохо. Хотя, по правде говоря, я рассчитывал чуть на большее количество.
		AI_Output(other,self,"DIA_Balam_JobInCamp_Done_01_09");	//Разве тебе этого мало?
		AI_Output(self,other,"DIA_Balam_JobInCamp_Done_01_10");	//Видишь ли, последний сбор, отправленный в лагерь, был не слишком большим.
		AI_Output(self,other,"DIA_Balam_JobInCamp_Done_01_11");	//Ну да ладно. Сколько уж есть.
	};

	MIS_JobInCamp = LOG_SUCCESS;
	Log_CreateTopic(TOPIC_JobInCamp,LOG_SUCCESS);
	B_LogEntry(TOPIC_JobInCamp,"Я собрал для Балама достаточно болотной травы для следующей отправки в лагерь Братства.");
};


instance DIA_BALAM_StrangeCave(C_Info)
{
	npc = sek_8046_balam;
	nr = 5;
	condition = dia_balam_StrangeCave_condition;
	information = dia_balam_StrangeCave_info;
	permanent = FALSE;
	description = "Еще работенка для меня найдется?";
};

func int dia_balam_StrangeCave_condition()
{
	if(MIS_JobInCamp == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_balam_StrangeCave_info()
{
	AI_Output(other,self,"DIA_Balam_StrangeCave_01_01");	//Еще работенка для меня найдется?
	AI_Output(self,other,"DIA_Balam_StrangeCave_01_02");	//Хммм...(задумчиво) Ну, если тебе больше нечем заняться...
	AI_Output(self,other,"DIA_Balam_StrangeCave_01_03");	//...то можешь наведаться в пещеру, что находится неподалеку от нашего лагеря.
	AI_Output(self,other,"DIA_Balam_StrangeCave_01_05");	//Последнее время оттуда по ночам стали доноситься странного рода звуки!
	AI_Output(self,other,"DIA_Balam_StrangeCave_01_06");	//Мы с парнями уже не раз днем наведывались туда, но никого, кроме пары мясных жуков не нашли.
	AI_Output(self,other,"DIA_Balam_StrangeCave_01_07");	//Может быть, тебе повезет, и ты сможешь выяснить, что там, черт возьми, происходит.
	AI_Output(other,self,"DIA_Balam_StrangeCave_01_08");	//Ладно, попробую.
	AI_Output(self,other,"DIA_Balam_StrangeCave_01_09");	//Было бы неплохо, приятель. Было бы неплохо!
	Log_CreateTopic(TOPIC_StrangeCave,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_StrangeCave,LOG_Running);
	B_LogEntry(TOPIC_StrangeCave,"Балам попросил меня выяснить, что за странные звуки раздаются по ночам из пещеры. Сборщики болотника обнаружили там лишь мясных жуков. По всей видимости, надо прокрасться туда, не привлекая лишнего шума.");
	MIS_StrangeCave = LOG_Running;
	AI_StopProcessInfos(self);
	Wld_InsertItem(ITSC_TRFMEATBUG,"FP_ITEM_NW_TROLLAREA_TRFMEATBUG");
};


instance DIA_BALAM_StrangeCave_News(C_Info)
{
	npc = sek_8046_balam;
	nr = 5;
	condition = dia_balam_StrangeCave_News_condition;
	information = dia_balam_StrangeCave_News_info;
	permanent = FALSE;
	description = "Что ты можешь еще рассказать по поводу той пещеры?";
};

func int dia_balam_StrangeCave_News_condition()
{
	if((MIS_StrangeCave == LOG_Running) && (StrangeCaveMageIsDead == FALSE))
	{
		return TRUE;
	};
};

func void dia_balam_StrangeCave_News_info()
{
	AI_Output(other,self,"DIA_Balam_StrangeCave_News_01_01");	//Что ты можешь мне еще рассказать по поводу той пещеры?
	AI_Output(self,other,"DIA_Balam_StrangeCave_News_01_02");	//Ну, есть тут еще кое-что...(серьезно) Возможно, тебе это как-то поможет.
	AI_Output(other,self,"DIA_Balam_StrangeCave_News_01_03");	//Ну, выкладывай же, не тяни.
	AI_Output(self,other,"DIA_Balam_StrangeCave_News_01_04");	//В общем, когда мы заходили в ту пещеру, то один из сборщиков заметил, что на стене мелькнула чья-то тень и потом мгновенно исчезла.
	AI_Output(self,other,"DIA_Balam_StrangeCave_News_01_05");	//Я так думаю, что, возможно, своим присутствием мы спугнули кого-то!
	AI_Output(self,other,"DIA_Balam_StrangeCave_News_01_06");	//Ну а дальше ты уже знаешь. Кроме вонючих мясных жуков там никого больше не было.
	AI_Output(other,self,"DIA_Balam_StrangeCave_News_01_07");	//Больше ничего?
	AI_Output(self,other,"DIA_Balam_StrangeCave_News_01_08");	//Ничего такого, чтобы показалось интересным.
	AI_Output(other,self,"DIA_Balam_StrangeCave_News_01_09");	//Ладно.
	B_LogEntry(TOPIC_StrangeCave,"Балам рассказал, что один из его сборщиков мимолетно заметил чью-то тень в пещере. Однако внутри никого, кроме мясных жуков, не оказалось.");
};


instance DIA_BALAM_StrangeCave_Done(C_Info)
{
	npc = sek_8046_balam;
	nr = 5;
	condition = dia_balam_StrangeCave_Done_condition;
	information = dia_balam_StrangeCave_Done_info;
	permanent = FALSE;
	description = "Я разобрался с тем, что было в пещере.";
};

func int dia_balam_StrangeCave_Done_condition()
{
	if((MIS_StrangeCave == LOG_Running) && (StrangeCaveMageIsDead == TRUE))
	{
		return TRUE;
	};
};

func void dia_balam_StrangeCave_Done_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Balam_StrangeCave_Done_01_01");	//Я разобрался с тем, что было в пещере.
	AI_Output(self,other,"DIA_Balam_StrangeCave_Done_01_02");	//И кто же издавал эти звуки по ночам?
	AI_Output(other,self,"DIA_Balam_StrangeCave_Done_01_03");	//Обычная нечисть. Но будь спокоен, теперь она больше вас не потревожит.
	AI_Output(self,other,"DIA_Balam_StrangeCave_Done_01_04");	//Надеюсь, что ты прав.
	AI_Output(self,other,"DIA_Balam_StrangeCave_Done_01_05");	//Ладно, вот, возьми за свои труды. Эту награду ты заслужил по праву!
	B_GiveInvItems(self,other,ItMi_Joint,10);
	B_LogEntry(TOPIC_StrangeCave,"Я сообщил Баламу, что с проблемой в пещере покончено.");
	Log_CreateTopic(TOPIC_StrangeCave,LOG_SUCCESS);
	MIS_StrangeCave = LOG_SUCCESS;
};

instance DIA_BALAM_Proviant(C_Info)
{
	npc = sek_8046_balam;
	nr = 5;
	condition = dia_balam_Proviant_condition;
	information = dia_balam_Proviant_info;
	permanent = FALSE;
	description = "Как обстоят дела?";
};

func int dia_balam_Proviant_condition()
{
	if(MIS_StrangeCave == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_balam_Proviant_info()
{
	AI_Output(other,self,"DIA_Balam_Proviant_01_01");	//Как обстоят дела?
	AI_Output(self,other,"DIA_Balam_Proviant_01_02");	//Вроде пока все без изменений. 
	AI_Output(self,other,"DIA_Balam_Proviant_01_03");	//Однако вскоре нам будет необходимо пополнить наши запасы пищи. Те, что остались, уже почти на исходе.
	AI_Output(other,self,"DIA_Balam_Proviant_01_04");	//И у тебя есть идеи на этот счет?
	AI_Output(self,other,"DIA_Balam_Proviant_01_05");	//Хммм...(задумчиво) Тут недалеко от лагеря днем обычно пасется целая стая горных падальщиков.
	AI_Output(self,other,"DIA_Balam_Proviant_01_06");	//Полагаю, что было бы неплохо подстрелить парочку из них.
	AI_Output(self,other,"DIA_Balam_Proviant_01_07");	//Этого мяса хватило бы нам на пару недель точно!
	AI_Output(other,self,"DIA_Balam_Proviant_01_08");	//И кого ты хочешь послать на охоту? 
	AI_Output(self,other,"DIA_Balam_Proviant_01_09");	//Поначалу я хотел попросить об этом Тиракса. Но он последнее время какой-то раздражительный, что навряд ли станет меня слушать.
	AI_Output(self,other,"DIA_Balam_Proviant_01_10");	//Поэтому хочу предложить эту работенку тебе. Ты как, не против?
	AI_Output(other,self,"DIA_Balam_Proviant_01_11");	//Почему бы и нет. Это куда лучше, чем умирать целыми днями от скуки.
	AI_Output(self,other,"DIA_Balam_Proviant_01_12");	//Хорошо, тогда я могу рассчитывать на тебя. 
	AI_Output(other,self,"DIA_Balam_Proviant_01_13");	//А где именно пасутся горные падальщики?
	AI_Output(self,other,"DIA_Balam_Proviant_01_14");	//Если пойдешь прямо от нашей палатки, как раз наткнешься на то место. 
	AI_Output(self,other,"DIA_Balam_Proviant_01_15");	//Но будь осторожен! Эти птицы, хоть и кажутся с виду беззащитными, но могут заклевать тебя насмерть.
	AI_Output(other,self,"DIA_Balam_Proviant_01_16");	//Не волнуйся, мне не впервой на них охотиться.
	AI_Output(self,other,"DIA_Balam_Proviant_01_17");	//Ну, если так, тогда жду твоего возвращения. И, надеюсь, не с пустыми руками.
	AI_Output(self,other,"DIA_Balam_Proviant_01_18");	//Принеси мяса столько, сколько сможешь унести.
	Log_CreateTopic(TOPIC_BalamProviant,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BalamProviant,LOG_Running);
	B_LogEntry(TOPIC_BalamProviant,"Баламу нужно пополнить запасы провианта. Он попросил меня поохотиться на горных падальщиков рядом с лагерем.");
	MIS_BalamProviant = LOG_Running;
	AI_StopProcessInfos(self);
	Wld_InsertNpc(Scavenger_Mount,"NW_TROLLAREA_BALAMMEAT_01");
	Wld_InsertNpc(Scavenger_Mount,"NW_TROLLAREA_BALAMMEAT_02");
	Wld_InsertNpc(Scavenger_Mount,"NW_TROLLAREA_BALAMMEAT_03");
	Wld_InsertNpc(Scavenger_Mount,"NW_TROLLAREA_BALAMMEAT_04");
	Wld_InsertNpc(Scavenger_Mount,"NW_TROLLAREA_BALAMMEAT_05");
	Wld_InsertNpc(Scavenger_Mount,"NW_TROLLAREA_BALAMMEAT_06");
	Wld_InsertNpc(Scavenger_Mount,"NW_TROLLAREA_BALAMMEAT_07");
	Wld_InsertNpc(Scavenger_Mount,"NW_TROLLAREA_BALAMMEAT_08");
	Wld_InsertNpc(Scavenger_Mount,"NW_TROLLAREA_BALAMMEAT_09");
	Wld_InsertNpc(Scavenger_Mount,"NW_TROLLAREA_BALAMMEAT_10");
};

instance DIA_BALAM_Proviant_Done(C_Info)
{
	npc = sek_8046_balam;
	nr = 5;
	condition = dia_balam_Proviant_Done_condition;
	information = dia_balam_Proviant_Done_info;
	permanent = FALSE;
	description = "Я принес тебе мясо горных падальщиков.";
};

func int dia_balam_Proviant_Done_condition()
{
	if((MIS_BalamProviant == LOG_Running) && (Npc_HasItems(other,ItFoMuttonRaw_Mount) >= 1))
	{
		return TRUE;
	};
};

func void dia_balam_Proviant_Done_info()
{
	var int Raw_Mount;
	var int Xp_Raw_Mount;

	AI_Output(other,self,"DIA_Balam_Proviant_Done_01_01");	//Я принес тебе мясо горных падальщиков.
	AI_Output(self,other,"DIA_Balam_Proviant_Done_01_02");	//Отлично! И как много тебе его удалось добыть?
	AI_Output(other,self,"DIA_Balam_Proviant_Done_01_03");	//Вот, взгляни сам.

	Raw_Mount = Npc_HasItems(other,ItFoMuttonRaw_Mount);
	Xp_Raw_Mount = Raw_Mount * 10;

	B_GivePlayerXP(Xp_Raw_Mount);
	B_GiveInvItems(other,self,ItFoMuttonRaw_Mount,Raw_Mount);
	Npc_RemoveInvItems(self,ItFoMuttonRaw_Mount,Raw_Mount);

	if(Raw_Mount >= 10)
	{
		AI_Output(self,other,"DIA_Balam_Proviant_Done_01_04");	//Да, тут именно столько мяса, сколько и требовалось. Я вижу, что ты хорошо поохотился!
		AI_Output(self,other,"DIA_Balam_Proviant_Done_01_05");	//Тогда вот, возьми этот напиток и немного золота за свои хлопоты.
		AI_Output(self,other,"DIA_Balam_Proviant_Done_01_06");	//К сожалению, это самое большое, чем я могу отблагодарить тебя сейчас.
		AI_Output(other,self,"DIA_Balam_Proviant_Done_01_07");	//Мне этого вполне хватит. К тому же приятно, когда твою работу ценят подобным образом.
		AI_Output(self,other,"DIA_Balam_Proviant_Done_01_08");	//(улыбаясь) Не сомневаюсь.
		B_GiveInvItemsManyThings(self,other);
		CreateInvItems(other,ItMi_Gold,150);
		CreateInvItems(other,ITPO_FALLDEFENCE,1);
	}
	else if(Raw_Mount >= 4)
	{
		AI_Output(self,other,"DIA_Balam_Proviant_Done_01_09");	//Неплохо. Хотя, по правде говоря, я ожидал от тебя немного большего количества мяса.
		AI_Output(self,other,"DIA_Balam_Proviant_Done_01_10");	//Ну да ладно. Думаю, пока и этого хватит. Вот, возьми это золото за свои хлопоты.
		B_GiveInvItems(self,other,ItMi_Gold,75);
	}
	else
	{
		AI_Output(self,other,"DIA_Balam_Proviant_Done_01_12");	//Хммм... Видимо, ты не очень хороший охотник, раз принес мне так мало мяса.
		AI_Output(self,other,"DIA_Balam_Proviant_Done_01_13");	//Хотя в любом случае я благодарен тебе за твою помощь.
	};

	B_LogEntry(TOPIC_BalamProviant,"Я принес Баламу мясо горных падальщиков. Сборщики болотника не останутся голодными.");
	Log_CreateTopic(TOPIC_BalamProviant,LOG_SUCCESS);
	MIS_BalamProviant = LOG_SUCCESS;
};

instance DIA_BALAM_AssasinsAttack(C_Info)
{
	npc = sek_8046_balam;
	nr = 5;
	condition = dia_balam_AssasinsAttack_condition;
	information = dia_balam_AssasinsAttack_info;
	permanent = TRUE;
	description = "Все в порядке?";
};

func int dia_balam_AssasinsAttack_condition()
{
	if((MIS_TiraksFur == LOG_SUCCESS) && (AssasinsAttackCamp == FALSE))
	{
		return TRUE;
	};
};

func void dia_balam_AssasinsAttack_info()
{
	AI_Output(other,self,"DIA_Balam_AssasinsAttack_01_01");	//Все в порядке?

	if(Wld_IsTime(20,59,7,59))
	{
		AI_Output(self,other,"DIA_Balam_AssasinsAttack_01_02");	//Лучше не придумаешь...(раcслабленно) Последние дни в лагере были крайне спокойными.
		AI_Output(self,other,"DIA_Balam_AssasinsAttack_01_03");	//И все благодаря тебе и тем стражам, что прислал Гор На Тоф.
		AI_Output(self,other,"DIA_Balam_AssasinsAttack_01_04");	//Не думаю, что нам здесь что-то угрожает...
		AI_PlayAni(self,"T_SEARCH");
		AI_Output(self,other,"DIA_Balam_AssasinsAttack_01_05");	//Хммм...(встревоженно) Ты это слышал?
		Info_ClearChoices(DIA_Balam_AssasinsAttack);
		Info_AddChoice(DIA_Balam_AssasinsAttack,"Что именно?",dia_balam_AssasinsAttack_Done);
	}
	else
	{
		AI_Output(self,other,"DIA_Balam_AssasinsAttack_01_08");	//Как видишь. Но лучше поговорим об этом позже. Вечером.
		AI_Output(self,other,"DIA_Balam_AssasinsAttack_01_09");	//Сейчас мне надо присматривать за сборщиками.
		AI_StopProcessInfos(self);
	};
};

func void dia_balam_AssasinsAttack_Done()
{
	AI_Output(other,self,"DIA_Balam_AssasinsAttack_01_06");	//Что именно?
	AI_Output(self,other,"DIA_Balam_AssasinsAttack_01_07");	//Осторожно, сзади!
	AssasinsAttackCamp = TRUE;
	AI_StopProcessInfos(self);
	Wld_InsertNpc(Ass_121_Adept,"NW_FOREST_ASS_START_01");
	Wld_InsertNpc(Ass_122_Adept,"NW_FOREST_ASS_START_02");
	Wld_InsertNpc(Ass_123_Adept,"NW_FOREST_ASS_START_03");
	Wld_InsertNpc(Ass_124_Adept,"NW_FOREST_ASS_START_04");
};