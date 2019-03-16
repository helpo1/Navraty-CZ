
instance DIA_BAALTYON_EXIT(C_Info)
{
	npc = gur_8003_tyon;
	nr = 999;
	condition = dia_baaltyon_exit_condition;
	information = dia_baaltyon_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_baaltyon_exit_condition()
{
	return TRUE;
};

func void dia_baaltyon_exit_info()
{
	AI_StopProcessInfos(self);
};

instance dia_baaltyon_PICKPOCKET(C_Info)
{
	npc = gur_8003_tyon;
	nr = 900;
	condition = dia_baaltyon_PICKPOCKET_Condition;
	information = dia_baaltyon_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int dia_baaltyon_PICKPOCKET_Condition()
{
	return C_Beklauen(49,35);
};

func void dia_baaltyon_PICKPOCKET_Info()
{
	Info_ClearChoices(dia_baaltyon_PICKPOCKET);
	Info_AddChoice(dia_baaltyon_PICKPOCKET,Dialog_Back,dia_baaltyon_PICKPOCKET_BACK);
	Info_AddChoice(dia_baaltyon_PICKPOCKET,DIALOG_PICKPOCKET,dia_baaltyon_PICKPOCKET_DoIt);
};

func void dia_baaltyon_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(dia_baaltyon_PICKPOCKET);
};

func void dia_baaltyon_PICKPOCKET_BACK()
{
	Info_ClearChoices(dia_baaltyon_PICKPOCKET);
};


instance DIA_BAALTYON_NOTALK_SLEEPER(C_Info)
{
	npc = gur_8003_tyon;
	nr = 1;
	condition = dia_baaltyon_notalk_sleeper_condition;
	information = dia_baaltyon_notalk_sleeper_info;
	permanent = FALSE;
	important = FALSE;
	description = "Да пребудет с тобой Спящий!";
};


func int dia_baaltyon_notalk_sleeper_condition()
{
	if((IDOLTYON_YES == FALSE) && ((other.guild == GIL_NONE) || (other.guild == GIL_SEK)))
	{
		return TRUE;
	};
};

func void dia_baaltyon_notalk_sleeper_info()
{
	AI_Output(other,self,"DIA_BaalTyon_NoTalk_Sleeper_01_00");	//Да пребудет с тобой Спящий!
	AI_Output(self,other,"DIA_BaalTyon_NoTalk_Sleeper_01_01");	//(вздох)
	AI_StopProcessInfos(self);
};

instance DIA_BAALTYON_NOTALK_IMP(C_Info)
{
	npc = gur_8003_tyon;
	nr = 1;
	condition = dia_baaltyon_notalk_imp_condition;
	information = dia_baaltyon_notalk_imp_info;
	permanent = TRUE;
	important = FALSE;
	description = "Все в порядке, приятель?";
};

func int dia_baaltyon_notalk_imp_condition()
{
	if((IDOLTYON_YES == FALSE) && ((other.guild == GIL_NONE) || (other.guild == GIL_SEK)))
	{
		return TRUE;
	};
};

func void dia_baaltyon_notalk_imp_info()
{
	AI_Output(other,self,"DIA_BaalTyon_NoTalk_Imp_01_00");	//Все в порядке, приятель?
	AI_Output(self,other,"DIA_BaalTyon_NoTalk_Sleeper_01_01");	//(вздох)
	AI_StopProcessInfos(self);
};


instance DIA_BAALTYON_ABOUTRECEPT(C_Info)
{
	npc = gur_8003_tyon;
	nr = 1;
	condition = dia_baaltyon_aboutrecept_condition;
	information = dia_baaltyon_aboutrecept_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_baaltyon_aboutrecept_condition()
{
	if((IDOLTYON_YES == FALSE) && (PSI_TALK == TRUE) && (CANBEGURU == TRUE) && (other.guild == GIL_SEK))
	{
		return TRUE;
	};
};

func void dia_baaltyon_aboutrecept_info()
{
	AI_Output(self,other,"DIA_BaalTyon_AboutRecept_01_00");	//Это ты тот новичок, который хочет присоединиться к нашему Братству?
	AI_Output(other,self,"DIA_BaalTyon_AboutRecept_01_01");	//Почему ты заговорил со мной?
	AI_Output(self,other,"DIA_BaalTyon_AboutRecept_01_02");	//Потому что я готов дать тебе свое согласие. Но прежде ты должен будешь оказать мне одну услугу.
	AI_Output(other,self,"DIA_BaalTyon_AboutRecept_01_03");	//Что я могу сделать для тебя, господин?
	AI_Output(self,other,"DIA_BaalTyon_AboutRecept_01_04");	//Как ты мог заметить, я занимаюсь алхимией и приготовлением магических эликсиров.
	AI_Output(self,other,"DIA_BaalTyon_AboutRecept_01_05");	//И меня интересуют рецепты неизвестных мне доселе зелий.
	AI_Output(self,other,"DIA_BaalTyon_AboutRecept_01_06");	//Я слышал, что у одного алхимика, живущего в этих краях, имеется рецепт одного интересного зелья.
	AI_Output(self,other,"DIA_BaalTyon_AboutRecept_01_07");	//Судя по всему, этот эликсир способен воздействовать некоторым образом на сознание человека.
	AI_Output(other,self,"DIA_BaalTyon_AboutRecept_01_09");	//Ты хочешь, чтобы я достал его для тебя?
	AI_Output(self,other,"DIA_BaalTyon_AboutRecept_01_10");	//Да! Если ты докажешь мне свою полезность, то можешь не сомневаться в том, что получишь мой голос.
	AI_Output(other,self,"DIA_BaalTyon_AboutRecept_01_11");	//А ты не знаешь, у какого именно алхимика может быть этот рецепт?
	AI_Output(self,other,"DIA_BaalTyon_AboutRecept_01_12");	//Если бы я знал, то не стал бы просить тебя о помощи.
	AI_Output(self,other,"DIA_BaalTyon_AboutRecept_01_13");	//Тебе придется самому выяснить этот вопрос.
	AI_Output(self,other,"DIA_BaalTyon_AboutRecept_01_14");	//Возвращайся, когда у тебя будет этот рецепт. И тогда мы поговорим о твоем вступлении в наше Братство.
	IDOLTYON_YES = TRUE;
	Log_CreateTopic(TOPIC_RECEPTFORTYON,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RECEPTFORTYON,LOG_Running);
	B_LogEntry(TOPIC_RECEPTFORTYON,"Идол Тиона заинтересовал один необычный эликсир. По его словам, у одного из алхимиков на острове наверняка есть его рецепт.");
	MIS_RECEPTFORTYON = LOG_Running;
};


instance DIA_BAALTYON_GOTRECEPT(C_Info)
{
	npc = gur_8003_tyon;
	nr = 1;
	condition = dia_baaltyon_gotrecept_condition;
	information = dia_baaltyon_gotrecept_info;
	permanent = FALSE;
	important = FALSE;
	description = "Я принес рецепт.";
};


func int dia_baaltyon_gotrecept_condition()
{
	if((MIS_RECEPTFORTYON == LOG_Running) && (Npc_HasItems(other,itwr_tyonrecept) >= 1))
	{
		return TRUE;
	};
};

func void dia_baaltyon_gotrecept_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_BaalTyon_GotRecept_01_00");	//Я принес рецепт, о котором ты просил.
	AI_Output(self,other,"DIA_BaalTyon_GotRecept_01_01");	//(нетерпеливо) Дай взглянуть!
	if(B_GiveInvItems(other,self,itwr_tyonrecept,1))
	{
		Npc_RemoveInvItems(self,itwr_tyonrecept,1);
	};
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_BaalTyon_GotRecept_01_02");	//Да, это он. Какой странный состав ингредиентов...(разглядывает)
	AI_Output(other,self,"DIA_BaalTyon_GotRecept_01_03");	//Господин, теперь я могу получить ваше согласие на мое вступление в Братство?
	AI_Output(self,other,"DIA_BaalTyon_GotRecept_01_04");	//(не слушая) Чтобы сварить его, мне потребуются очень редкие вещи...
	AI_Output(self,other,"DIA_BaalTyon_GotRecept_01_05");	//Боюсь, у меня нет даже и половины из того, что здесь перечисляется.
	AI_Output(self,other,"DIA_BaalTyon_GotRecept_01_06");	//Я вынужден тебя попросить об еще одном одолжении.
	AI_Output(other,self,"DIA_BaalTyon_GotRecept_01_07");	//(вздыхает) Ну хорошо, что я должен для тебя сделать на этот раз?
	AI_Output(self,other,"DIA_BaalTyon_GotRecept_01_08");	//Я дам тебе список тех компонентов, которых у меня нет.
	AI_Output(self,other,"DIA_BaalTyon_GotRecept_01_09");	//Достань все эти ингредиенты и принеси их мне.
	AI_Output(self,other,"DIA_BaalTyon_GotRecept_01_10");	//Вот список. Здесь написано все, что мне необходимо.
	B_GiveInvItems(self,other,itwr_tyonlist,1);
	B_LogEntry(TOPIC_RECEPTFORTYON,"Идол Тион дал мне еще одно поручение. Теперь я должен достать для него некоторые ингредиенты для эликсира, который описан в рецепте.");
};


instance DIA_BAALTYON_GIVEMEPOITION(C_Info)
{
	npc = gur_8003_tyon;
	nr = 1;
	condition = dia_baaltyon_givemepoition_condition;
	information = dia_baaltyon_givemepoition_info;
	permanent = FALSE;
	important = FALSE;
	description = "А для чего нужен этот эликсир?";
};


func int dia_baaltyon_givemepoition_condition()
{
	if((MIS_RECEPTFORTYON == LOG_Running) && Npc_KnowsInfo(other,dia_baaltyon_gotrecept))
	{
		return TRUE;
	};
};

func void dia_baaltyon_givemepoition_info()
{
	AI_Output(other,self,"DIA_BaalTyon_GiveMeRecept_01_00");	//А для чего нужен этот эликсир?
	AI_Output(self,other,"DIA_BaalTyon_GiveMeRecept_01_01");	//Судя по рецепту и составу его ингредиентов, я могу сделать вывод, что оно способно многократно увеличить магическую силу!
	AI_Output(self,other,"DIA_BaalTyon_GiveMeRecept_01_02");	//Не могу сказать, на сколько именно и какие последствия могут иметь место при его употреблении.
	AI_Output(other,self,"DIA_BaalTyon_GiveMeRecept_01_03");	//А ты сможешь сварить такое зелье и для меня?
	AI_Output(self,other,"DIA_BaalTyon_GiveMeRecept_01_04");	//Возможно. Ведь мне нужно будет на ком-то испытать действие этого эликсира.
	AI_Output(self,other,"DIA_BaalTyon_GiveMeRecept_01_05");	//Конечно, это будет большой риск. Действие зелья может иметь непредсказуемый характер!
};


instance DIA_BAALTYON_GIVEINGRIDIENTS(C_Info)
{
	npc = gur_8003_tyon;
	nr = 1;
	condition = dia_baaltyon_giveingridients_condition;
	information = dia_baaltyon_giveingridients_info;
	permanent = FALSE;
	important = FALSE;
	description = "Я принес ингредиенты для твоего зелья.";
};


func int dia_baaltyon_giveingridients_condition()
{
	if((MIS_RECEPTFORTYON == LOG_Running) && Npc_KnowsInfo(other,dia_baaltyon_gotrecept) && (Npc_HasItems(other,itat_crawlerqueen) >= 1) && (Npc_HasItems(other,ItAt_StoneGolemHeart) >= 1) && (Npc_HasItems(other,ItAt_WaranFiretongue) >= 1) && (Npc_HasItems(other,ItPl_Perm_Herb) >= 1))
	{
		return TRUE;
	};
};

func void dia_baaltyon_giveingridients_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_BaalTyon_GiveIngridients_01_00");	//Я принес ингредиенты для твоего зелья.
	AI_Output(self,other,"DIA_BaalTyon_GiveIngridients_01_01");	//Покажи мне их.
	B_GiveInvItems(other,self,itat_crawlerqueen,1);
	AI_Output(self,other,"DIA_BaalTyon_GiveIngridients_01_0A");	//Так-так. Яйцо ползуна - правильно...
	B_GiveInvItems(other,self,ItAt_StoneGolemHeart,1);
	AI_Output(self,other,"DIA_BaalTyon_GiveIngridients_01_0B");	//...сердце каменного голема - вот оно...
	B_GiveInvItems(other,self,ItAt_WaranFiretongue,1);
	AI_Output(self,other,"DIA_BaalTyon_GiveIngridients_01_0C");	//...язык огненной ящерицы - есть...
	B_GiveInvItems(other,self,ItPl_Perm_Herb,1);
	AI_Output(self,other,"DIA_BaalTyon_GiveIngridients_01_0D");	//...и царский щавель.
	AI_Output(self,other,"DIA_BaalTyon_GiveIngridients_01_02");	//Кажется, тут все, что я тебя просил принести. Отлично!
	AI_Output(other,self,"DIA_BaalTyon_GiveIngridients_01_03");	//Надеюсь, теперь я могу рассчитывать на твое одобрение, мастер?
	AI_Output(self,other,"DIA_BaalTyon_GiveIngridients_01_04");	//Да, ты хорошо потрудился на благо Братства! Думаю, ты несомненно достоин того, чтобы стать одним из нас!
	AI_Output(self,other,"DIA_BaalTyon_GiveIngridients_01_05");	//Иди к Идолу Орану и скажи ему об этом.
	B_LogEntry(TOPIC_RECEPTFORTYON,"Я принес все ингредиенты, что просил Идол Тион для своего эликсира. Он был очень доволен, и дал свое согласие на мое принятие в Круг Гуру.");
	MIS_RECEPTFORTYON = LOG_SUCCESS;
	TYONAGREED = TRUE;
};

instance DIA_BaalTyon_Mandibuls(C_Info)
{
	npc = gur_8003_tyon;
	nr = 1;
	condition = DIA_BaalTyon_Mandibuls_condition;
	information = DIA_BaalTyon_Mandibuls_info;
	permanent = FALSE;
	description = "Для меня еще будут поручения?";
};


func int DIA_BaalTyon_Mandibuls_condition()
{
	if(MIS_RECEPTFORTYON == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_BaalTyon_Mandibuls_info()
{
	AI_Output(other,self,"DIA_BaalTyon_Mandibuls_01_00");	//Для меня еще будут поручения?
	AI_Output(self,other,"DIA_BaalTyon_Mandibuls_01_01");	//Да... Хорошо, что ты спросил.
	AI_Output(self,other,"DIA_BaalTyon_Mandibuls_01_02");	//Ты, наверно, помнишь, что в свое время наше Братство постоянно нуждалось в жвалах ползунов, которые стражи добывали в Старой шахте.
	AI_Output(self,other,"DIA_BaalTyon_Mandibuls_01_03");	//Секрет, находившийся в этих железах, мы обычно использовали для увеличения силы духа наших послушников и укрепления их сознания.
	AI_Output(self,other,"DIA_BaalTyon_Mandibuls_01_04");	//Но сейчас мы лишены этой возможности, и мне нужно попробовать найти им альтернативу.
	AI_Output(other,self,"DIA_BaalTyon_Mandibuls_01_05");	//А разве здесь вы не смогли найти логова ползунов?
	AI_Output(self,other,"DIA_BaalTyon_Mandibuls_01_06");	//В Хоринисе их слишком мало для того, чтобы проводить по-настоящему серьезные эксперименты. 
	AI_Output(self,other,"DIA_BaalTyon_Mandibuls_01_07");	//Но я слышал, что тут обитают иные монстры, у которых можно добыть нужные мне ингридиенты.
	AI_Output(self,other,"DIA_BaalTyon_Mandibuls_01_08");	//Кажется, местные называют их полевыми хищниками. Убей несколько этих тварей и принеси мне их железы.
	AI_Output(self,other,"DIA_BaalTyon_Mandibuls_01_09");	//Думаю, пяти штук будет достаточно на первое время.
	MIS_TyonMandibuls = LOG_Running;
	Log_CreateTopic(TOPIC_TyonMandibuls,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TyonMandibuls,LOG_Running);
	B_LogEntry(TOPIC_TyonMandibuls,"Идол Тион попросил достать ему пять мандибул полевых хищников. Уверен, мне не составит это особого труда.");
};

instance DIA_BaalTyon_Mandibuls_Done(C_Info)
{
	npc = gur_8003_tyon;
	nr = 1;
	condition = DIA_BaalTyon_Mandibuls_Done_condition;
	information = DIA_BaalTyon_Mandibuls_Done_info;
	permanent = FALSE;
	description = "Я принес мандибулы.";
};

func int DIA_BaalTyon_Mandibuls_Done_condition()
{
	if((MIS_TyonMandibuls == LOG_Running) && (Npc_HasItems(other,ItAt_BugMandibles) >= 5))
	{
		return TRUE;
	};
};

func void DIA_BaalTyon_Mandibuls_Done_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_BaalTyon_Mandibuls_Done_01_00");	//Я принес мандибулы полевых хищников.
	B_GiveInvItems(other,self,ItAt_BugMandibles,5);
	Npc_RemoveInvItems(self,ItAt_BugMandibles,5);
	AI_Output(self,other,"DIA_BaalTyon_Mandibuls_Done_01_01");	//Что ж, с виду они в полном порядке, да и сами железы почти не повреждены.
	AI_Output(self,other,"DIA_BaalTyon_Mandibuls_Done_01_02");	//В любом случае мне понадобится некоторое время, чтобы тщательно исследовать их свойства.
	AI_Output(self,other,"DIA_BaalTyon_Mandibuls_Done_01_03");	//Ты хорошо поработал! Возьми несколько стеблей болотника.
	B_GiveInvItems(self,other,ItPl_SwampHerb,5);
	MIS_TyonMandibuls = LOG_Success;
	Log_SetTopicStatus(TOPIC_TyonMandibuls,LOG_Success);
	B_LogEntry(TOPIC_TyonMandibuls,"Я принес Идолу Тиону мандибулы полевых хищников.");
};

instance DIA_BAALTYON_TESTPOTIONME(C_Info)
{
	npc = gur_8003_tyon;
	nr = 1;
	condition = dia_baaltyon_testpotionme_condition;
	information = dia_baaltyon_testpotionme_info;
	permanent = TRUE;
	important = FALSE;
	description = "По поводу твоего эликсира...";
};


func int dia_baaltyon_testpotionme_condition()
{
	if((MIS_RECEPTFORTYON == LOG_SUCCESS) && (TYONAGREED == TRUE) && Npc_KnowsInfo(other,dia_baaltyon_givemepoition) && (TYONGIVEPOTION == FALSE))
	{
		return TRUE;
	};
};

func void dia_baaltyon_testpotionme_info()
{
	var int daynow;
	daynow = Wld_GetDay();

	if(BAALTYON_STEW_DAY_ONCE == FALSE)
	{
		BAALTYON_STEW_DAY = Wld_GetDay();
		BAALTYON_STEW_DAY_ONCE = TRUE;
		AI_Output(other,self,"DIA_BaalTyon_TestPotionMe_01_00");	//По поводу твоего эликсира...
		AI_Output(self,other,"DIA_BaalTyon_TestPotionMe_01_01");	//Да, что ты хочешь спросить?
		AI_Output(other,self,"DIA_BaalTyon_TestPotionMe_01_02");	//Ты можешь испытать на мне действие эликсира?
		AI_Output(self,other,"DIA_BaalTyon_TestPotionMe_01_04");	//Хорошо, но я еще не приступил к его изготовлению.
		AI_Output(other,self,"DIA_BaalTyon_TestPotionMe_01_05");	//Когда зелье будет готово?
		AI_Output(self,other,"DIA_BaalTyon_TestPotionMe_01_06");	//Приходи завтра после полудня. Думаю, я успею к этому времени.
	}
	else if(BAALTYON_STEW_DAY < daynow)
	{
		if((BAALTYON_STEW_DAY > 0) && (Wld_IsTime(12,0,23,59) || (BAALTYON_STEW_DAY < (daynow - 1))))
		{
			AI_Output(other,self,"DIA_BaalTyon_TestPotionMe_01_07");	//По поводу твоего эликсира. Готов ли твой напиток?
			AI_Output(self,other,"DIA_BaalTyon_TestPotionMe_01_08");	//Да, он готов. Скажу тебе - на редкость сложное зелье!
			AI_Output(other,self,"DIA_BaalTyon_TestPotionMe_01_09");	//Значит, теперь я могу испытать его действие?
			AI_Output(self,other,"DIA_BaalTyon_TestPotionMe_01_10");	//Тебе так не терпится сделать это? (смеется)
			AI_Output(self,other,"DIA_BaalTyon_TestPotionMe_01_11");	//Ты уверен, что действительно хочешь его попробовать?
			Info_ClearChoices(dia_baaltyon_testpotionme);
			Info_AddChoice(dia_baaltyon_testpotionme,"Я передумал.",dia_baaltyon_testpotionme_no);
			Info_AddChoice(dia_baaltyon_testpotionme,"Да, я хочу его попробовать.",dia_baaltyon_testpotionme_yes);
		};
	}
	else
	{
		AI_Output(other,self,"DIA_BaalTyon_TestPotionMe_01_12");	//По поводу твоего эликсира...
		AI_Output(self,other,"DIA_BaalTyon_TestPotionMe_01_13");	//Я же ясно тебе сказал - завтра после полудня!
	};
};

func void dia_baaltyon_testpotionme_yes()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_BaalTyon_TestPotionMe_Yes_01_00");	//Да, я хочу его попробовать.
	AI_Output(self,other,"DIA_BaalTyon_TestPotionMe_Yes_01_01");	//Хорошо. Вот - выпей его!
	B_UseItem(other,itpo_tyonpotion);
	AI_PlayAni(other,"T_MAGRUN_2_HEASHOOT");
	AI_Output(other,self,"DIA_BaalTyon_TestPotionMe_Yes_01_02");	//Ого!
	AI_PlayAni(other,"T_MAGRUN_2_HEASHOOT");
	AI_Output(other,self,"DIA_BaalTyon_TestPotionMe_Yes_01_0A");	//Ничего себе!
	AI_PlayAni(other,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_BaalTyon_TestPotionMe_Yes_01_03");	//Ну, что скажешь?
	AI_Output(other,self,"DIA_BaalTyon_TestPotionMe_Yes_01_04");	//Я ощущаю себя достаточно странно.
	AI_Output(other,self,"DIA_BaalTyon_TestPotionMe_Yes_01_05");	//Немного кружится голова, разум немного затуманен.
	AI_Output(self,other,"DIA_BaalTyon_TestPotionMe_Yes_01_06");	//Ощущаешь ли ты огромный прилив магической энергии?
	AI_Output(other,self,"DIA_BaalTyon_TestPotionMe_Yes_01_07");	//Мне кажется, моя магическая сила увеличилась.
	AI_Output(self,other,"DIA_BaalTyon_TestPotionMe_Yes_01_08");	//Отлично! Это именно то, что я хотел услышать. Воистину потрясающее действие!
	AI_Output(self,other,"DIA_BaalTyon_TestPotionMe_Yes_01_09");	//И можно сказать, что наш эксперимент удался!
	AI_Output(other,self,"DIA_BaalTyon_TestPotionMe_Yes_01_10");	//А ты мог бы поделиться со мной секретом этого зелья?
	AI_Output(self,other,"DIA_BaalTyon_TestPotionMe_Yes_01_11");	//Нет. Такими тайнами не разбрасываются и не делятся с кем попало.
	AI_Output(self,other,"DIA_BaalTyon_TestPotionMe_Yes_01_12");	//Думаю, тебе достаточно и одной порции. К тому же тебе просто не хватит опыта, чтобы сварить его.
	AI_Output(self,other,"DIA_BaalTyon_TestPotionMe_Yes_01_13");	//Так что забудь об этом! А теперь ступай, мне нужно обдумать результаты эксперимента.
	TYONGIVEPOTION = TRUE;
	Info_ClearChoices(dia_baaltyon_testpotionme);
	AI_StopProcessInfos(self);
};

func void dia_baaltyon_testpotionme_no()
{
	AI_Output(other,self,"DIA_BaalTyon_TestPotionMe_No_01_00");	//Я передумал.
	AI_Output(self,other,"DIA_BaalTyon_TestPotionMe_No_01_01");	//Дело твое. Тогда я испытаю его на ком-нибудь другом.
	TYONGIVEPOTION = TRUE;
	Info_ClearChoices(dia_baaltyon_testpotionme);
};


instance DIA_BAALTYON_ABOUTEXPERIMENTS(C_Info)
{
	npc = gur_8003_tyon;
	nr = 1;
	condition = dia_baaltyon_aboutexperiments_condition;
	information = dia_baaltyon_aboutexperiments_info;
	permanent = FALSE;
	description = "Что за эксперименты ты проводишь?";
};


func int dia_baaltyon_aboutexperiments_condition()
{
	if((IDOLTYON_YES == TRUE) && Npc_KnowsInfo(other,dia_baaltyon_aboutrecept) && ((other.guild == GIL_NONE) || (other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR)))
	{
		return TRUE;
	};
};

func void dia_baaltyon_aboutexperiments_info()
{
	AI_Output(other,self,"DIA_BaalTyon_AboutExperiments_01_00");	//Что за эксперименты ты здесь проводишь?
	AI_Output(self,other,"DIA_BaalTyon_AboutExperiments_01_01");	//Мои исследования находятся на уровне, недоступном для твоего понимания. Не трать попусту мое время!
};


instance DIA_BAALTYON_CANTEACH(C_Info)
{
	npc = gur_8003_tyon;
	nr = 10;
	condition = dia_baaltyon_canteach_condition;
	information = dia_baaltyon_canteach_info;
	permanent = FALSE;
	description = "Ты можешь научить меня алхимии?";
};

func int dia_baaltyon_canteach_condition()
{
	if((other.guild == GIL_TPL) || (other.guild == GIL_GUR))
	{
		return TRUE;
	};
};

func void dia_baaltyon_canteach_info()
{
	AI_Output(other,self,"DIA_BaalTyon_CanTeach_01_00");	//Ты можешь научить меня алхимии?

	if((other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR))
	{
		AI_Output(self,other,"DIA_BaalTyon_CanTeach_01_01");	//Ты хочешь овладеть тайнами приготовления зелий?
		AI_Output(self,other,"DIA_BaalTyon_CanTeach_01_02");	//Для одного из наших братьев я без каких-либо сомнений открыл бы секреты приготовления магических эликсиров.
		AI_Output(self,other,"DIA_BaalTyon_CanTeach_01_03");	//Но для этого тебе понадобится обладать некоторым опытом.

		if(other.guild == GIL_SEK)
		{
			AI_Output(self,other,"DIA_BaalTyon_CanTeach_01_04");	//Кроме этого, познание секретов некоторых сложных зелий, кроме опыта, потребует от тебя и более высокого статуса в Братстве.
			AI_Output(self,other,"DIA_BaalTyon_CanTeach_01_05");	//Только избранные достойны овладеть этими знаниями!
			AI_Output(self,other,"DIA_BaalTyon_CanTeach_01_06");	//Избранному в Круг Стражей они добавят силу и ловкость, а священному избранному Гуру - мудрости и силу жизни.
		}
		else
		{
			AI_Output(self,other,"DIA_BaalTyon_CanTeach_01_07");	//Поскольку твой статус в Братстве достаточно высок, я бы мог научить тебя и приготовлению более сложных эликсиров.
			AI_Output(self,other,"DIA_BaalTyon_CanTeach_01_08");	//Избранному в Круг Стражей они добавят силу и ловкость, а священному избранному Гуру - мудрости и силу жизни.
		};
		AI_Output(self,other,"DIA_BaalTyon_CanTeach_01_09");	//Но в любом случае выбор за тобой.
	}
	else
	{
		AI_Output(self,other,"DIA_BaalTyon_CanTeach_01_10");	//Ты не один из братьев, и поэтому можешь забыть про это.
		AI_Output(self,other,"DIA_BaalTyon_CanTeach_01_11");	//Я не стану тебя учить.
	};
};


instance DIA_BAALTYON_TEACH(C_Info)
{
	npc = gur_8003_tyon;
	nr = 10;
	condition = dia_baaltyon_teach_condition;
	information = dia_baaltyon_teach_info;
	permanent = TRUE;
	description = "Научи меня варить зелья.";
};


func int dia_baaltyon_teach_condition()
{
	if(Npc_KnowsInfo(other,dia_baaltyon_canteach) && ((other.guild == GIL_TPL) || (other.guild == GIL_GUR)))
	{
		return TRUE;
	};
};

func void dia_baaltyon_teach_info()
{
	AI_Output(other,self,"DIA_BaalTyon_TEACH_15_00");	//Научи меня варить зелья.
	AI_Output(self,other,"DIA_BaalTyon_TEACH_01_01");	//Что ты хочешь знать?
	Info_ClearChoices(dia_baaltyon_teach);
	Info_AddChoice(dia_baaltyon_teach,Dialog_Back,dia_baaltyon_teach_back);
	if(PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_AddChoice(dia_baaltyon_teach,b_buildlearnstringforalchemy("Лечебная эссенция.",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_01)),dia_baaltyon_teach_health_01);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE))
	{
		Info_AddChoice(dia_baaltyon_teach,b_buildlearnstringforalchemy("Лечебный экстракт.",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_02)),dia_baaltyon_teach_health_02);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE))
	{
		Info_AddChoice(dia_baaltyon_teach,b_buildlearnstringforalchemy("Лечебный эликсир.",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_03)),dia_baaltyon_teach_health_03);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE) && (other.guild == GIL_GUR))
	{
		Info_AddChoice(dia_baaltyon_teach,b_buildlearnstringforalchemy("Эликсир жизни.",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_Health)),dia_baaltyon_teach_perm_health);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	{
		Info_AddChoice(dia_baaltyon_teach,b_buildlearnstringforalchemy("Эссенция маны.",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_01)),dia_baaltyon_teach_mana_01);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE))
	{
		Info_AddChoice(dia_baaltyon_teach,b_buildlearnstringforalchemy("Экстракт маны.",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_02)),dia_baaltyon_teach_mana_02);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE))
	{
		Info_AddChoice(dia_baaltyon_teach,b_buildlearnstringforalchemy("Эликсир маны.",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_03)),dia_baaltyon_teach_mana_03);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE) && (other.guild == GIL_GUR))
	{
		Info_AddChoice(dia_baaltyon_teach,b_buildlearnstringforalchemy("Эликсир духа.",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_Mana)),dia_baaltyon_teach_perm_mana);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] == FALSE) && (other.guild == GIL_TPL))
	{
		Info_AddChoice(dia_baaltyon_teach,b_buildlearnstringforalchemy("Эликсир силы.",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_STR)),dia_baaltyon_teach_permstr);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] == FALSE) && (other.guild == GIL_TPL))
	{
		Info_AddChoice(dia_baaltyon_teach,b_buildlearnstringforalchemy("Эликсир ловкости.",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_DEX)),dia_baaltyon_teach_permdex);
	};
};

func void dia_baaltyon_teach_back()
{
	Info_ClearChoices(dia_baaltyon_teach);
};

func void dia_baaltyon_teach_health_01()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_01);
};

func void dia_baaltyon_teach_health_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_02);
};

func void dia_baaltyon_teach_health_03()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_03);
};

func void dia_baaltyon_teach_perm_health()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_Health);
};

func void dia_baaltyon_teach_mana_01()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_01);
};

func void dia_baaltyon_teach_mana_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_02);
};

func void dia_baaltyon_teach_mana_03()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_03);
};

func void dia_baaltyon_teach_perm_mana()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_Mana);
};

func void dia_baaltyon_teach_permstr()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_STR);
};

func void dia_baaltyon_teach_permdex()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_DEX);
};


instance DIA_BAALTYON_CANTRADE(C_Info)
{
	npc = gur_8003_tyon;
	nr = 99;
	condition = dia_baaltyon_cantrade_condition;
	information = dia_baaltyon_cantrade_info;
	permanent = FALSE;
	description = "Идол Оран сказал, что ты продаешь магические свитки.";
};


func int dia_baaltyon_cantrade_condition()
{
	if((BAALTYON_CANTRADE == TRUE) && (other.guild == GIL_GUR))
	{
		return TRUE;
	};
};

func void dia_baaltyon_cantrade_info()
{
	AI_Output(other,self,"DIA_BaalTyon_CanTrade_01_01");	//Идол Оран сказал, что ты продаешь магические свитки.
	AI_Output(self,other,"DIA_BaalTyon_CanTrade_01_02");	//Да, я продаю свитки с заклинаниями магии Спящего. Но только для Гуру.
	AI_Output(other,self,"DIA_BaalTyon_CanTrade_01_03");	//Как видишь, я тоже принадлежу к Кругу избранных. Ты мог бы продать мне кое-какие из них?
	AI_Output(self,other,"DIA_BaalTyon_CanTrade_01_04");	//Конечно. Правда, их у меня не так много.
	AI_Output(self,other,"DIA_BaalTyon_CanTrade_01_05");	//Поэтому постарайся распорядиться этими свитками мудро.
};

var int SixCircle;

instance DIA_BAALTYON_TRADE(C_Info)
{
	npc = gur_8003_tyon;
	nr = 99;
	condition = dia_baaltyon_trade_condition;
	information = dia_baaltyon_trade_info;
	trade = TRUE;
	permanent = TRUE;
	description = "Покажи мне свои магические свитки.";
};


func int dia_baaltyon_trade_condition()
{
	if((BAALTYON_CANTRADE == TRUE) && (other.guild == GIL_GUR) && Npc_KnowsInfo(other,dia_baaltyon_cantrade) && Wld_IsTime(9,0,20,0))
	{
		return TRUE;
	};
};

func void dia_baaltyon_trade_info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_BaalTyon_Trade_01_01");	//Покажи мне свои магические свитки.

	if((GurBelt_01 == FALSE) && (hero.guild == GIL_GUR))
	{
		CreateInvItems(self,ItBE_Addon_GUR_01,1);
		GurBelt_01 = TRUE;
	};

	B_GiveTradeInv(self);

	if((PLAYER_TALENT_RUNES[SPL_GuruWrath] == TRUE) && (SixCircle == FALSE))
	{	
		CreateInvItems(self,itwr_GuruWrath,1);
		SixCircle = TRUE;
	};
};


instance DIA_BAALTYON_RUNEMAGICNOTWORK(C_Info)
{
	npc = gur_8003_tyon;
	nr = 1;
	condition = dia_baaltyon_runemagicnotwork_condition;
	information = dia_baaltyon_runemagicnotwork_info;
	permanent = FALSE;
	description = "Как обстоят дела с вашей магией?";
};


func int dia_baaltyon_runemagicnotwork_condition()
{
	if((STOPBIGBATTLE == TRUE) && (MIS_RUNEMAGICNOTWORK == LOG_Running) && (GURUMAGERUNESNOT == FALSE))
	{
		return TRUE;
	};
};

func void dia_baaltyon_runemagicnotwork_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_BaalTyon_RuneMagicNotWork_01_00");	//Как обстоят дела с вашей магией?
	AI_Output(self,other,"DIA_BaalTyon_RuneMagicNotWork_01_01");	//Наши магические руны ослабли и более не способны творить заклинания!
	AI_Output(self,other,"DIA_BaalTyon_RuneMagicNotWork_01_02");	//Мы все крайне удивлены этому обстоятельству, но ничего не можем сделать.
	AI_Output(self,other,"DIA_BaalTyon_RuneMagicNotWork_01_03");	//Все это довольно странно.
	B_LogEntry(TOPIC_RUNEMAGICNOTWORK,"Гуру Братства также лишились власти над магией рун.");
	GURUMAGERUNESNOT = TRUE;
};

instance DIA_BAALTYON_LOKIPOTION(C_Info)
{
	npc = gur_8003_tyon;
	nr = 1;
	condition = dia_baaltyon_LOKIPOTION_condition;
	information = dia_baaltyon_LOKIPOTION_info;
	important = FALSE;
	description = "Мне нужен особенный напиток.";
};

func int dia_baaltyon_LOKIPOTION_condition()
{
	if((MIS_PrioratStart == LOG_Running) && (LokiNeedMemory == TRUE))
	{
		return TRUE;
	};
};

func void dia_baaltyon_LOKIPOTION_info()
{
	AI_Output(other,self,"DIA_BaalTyon_LOKIPOTION_01_00");	//Мне нужен особенный напиток.
	AI_Output(self,other,"DIA_BaalTyon_LOKIPOTION_01_01");	//О чем именно ты говоришь?
	AI_Output(other,self,"DIA_BaalTyon_LOKIPOTION_01_02");	//О напитке, способном оживить воспоминания человека. У тебя такой есть?
	AI_Output(self,other,"DIA_BaalTyon_LOKIPOTION_01_03");	//Хммм... К сожалению, нет.
	AI_Output(self,other,"DIA_BaalTyon_LOKIPOTION_01_04");	//Но если бы ты принес мне все необходимые ингредиенты, то я смог бы сварить его для тебя.
	AI_Output(self,other,"DIA_BaalTyon_LOKIPOTION_01_05");	//А зачем он тебе вдруг понадобился?
	AI_Output(other,self,"DIA_BaalTyon_LOKIPOTION_01_06");	//Это не для меня, а для одного послушника. 
	AI_Output(other,self,"DIA_BaalTyon_LOKIPOTION_01_07");	//Просто необходимо освежить его память на предмет одной очень важной вещи.
	AI_Output(self,other,"DIA_BaalTyon_LOKIPOTION_01_08");	//Понимаю. Ладно, тогда слушай и запоминай, что мне понадобится.
	AI_Output(other,self,"DIA_BaalTyon_LOKIPOTION_01_09");	//Я весь во внимании.
	AI_Output(self,other,"DIA_BaalTyon_LOKIPOTION_01_10");	//Итак, для начала мне необходима болотная трава. Трех стеблей должно хватить.
	AI_Output(self,other,"DIA_BaalTyon_LOKIPOTION_01_11");	//Потом мне понадобится один эликсир духа, царский щавель, два целебных растения, пять мандибул ползунов, аквамарин...
	AI_Output(self,other,"DIA_BaalTyon_LOKIPOTION_01_12");	//...и, наконец, последний ингредиент в моем списке - это цветок кактуса!
	AI_Output(self,other,"DIA_BaalTyon_LOKIPOTION_01_13");	//Уверен, что у тебя не возникнет проблем, чтобы достать все это. Ну, может, за исключением последнего компонента.
	AI_Output(other,self,"DIA_BaalTyon_LOKIPOTION_01_14");	//Как раз насчет него я и хотел спросить - где мне его искать?
	AI_Output(self,other,"DIA_BaalTyon_LOKIPOTION_01_15");	//Хороший вопрос. Проблема в том, что это растение произрастает только в условиях высоких температур и сухого климата.
	AI_Output(self,other,"DIA_BaalTyon_LOKIPOTION_01_16");	//Я слышал, что в пустынном Варанте это растение не такая уж и редкость.
	AI_Output(self,other,"DIA_BaalTyon_LOKIPOTION_01_17");	//Но, ясное дело, попасть туда сейчас не представляется возможным.
	AI_Output(self,other,"DIA_BaalTyon_LOKIPOTION_01_18");	//Поэтому, где его искать на этом острове, - я тебе сказать не могу.
	AI_Output(self,other,"DIA_BaalTyon_LOKIPOTION_01_19");	//Попробуй поспрашивать об этом у других алхимиков. Может, кто-то тебе и поможет в его поисках.
	SeekCactus = TRUE;
	B_LogEntry(TOPIC_PrioratStart,"Идол Тион знает способ приготовления напитка, способного восстановить память человека. Однако ему необходимы соответствующие ингредиенты, а именно: три стебля болотника, эликсир духа, царский щавель, два целебных растения, пять мандибул ползуна, аквамарин и цветок кактуса. Достать последний довольно проблематично, поскольку он растет только в условиях сухого климата, - например, в пустынном Варанте. Мне остается поспрашивать местных алхимиков.");
};

instance DIA_BAALTYON_LokiPotion_Ready(C_Info)
{
	npc = gur_8003_tyon;
	nr = 1;
	condition = dia_baaltyon_LokiPotion_Ready_condition;
	information = dia_baaltyon_LokiPotion_Ready_info;
	important = FALSE;
	description = "У меня есть все ингредиенты.";
};

func int dia_baaltyon_LokiPotion_Ready_condition()
{
	if((MIS_PrioratStart == LOG_Running) && (SeekCactus == TRUE) && (Npc_HasItems(other,ItPl_CactusFlower) >= 1) && (Npc_HasItems(other,ItPl_SwampHerb) >= 3) && (Npc_HasItems(other,ItPo_Perm_Mana) >= 1) && (Npc_HasItems(other,ItPl_Perm_Herb) >= 1) && (Npc_HasItems(other,ItPl_Health_Herb_02) >= 2) && (Npc_HasItems(other,ItAt_CrawlerMandibles) >= 5) && (Npc_HasItems(other,ItMi_Aquamarine) >= 1))
	{
		return TRUE;
	};
};

func void dia_baaltyon_LokiPotion_Ready_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_BaalTyon_LokiPotion_Ready_01_00");	//У меня есть все ингредиенты.
	AI_Output(self,other,"DIA_BaalTyon_LokiPotion_Ready_01_01");	//Хорошо. Давай их мне, и я начну приготовление напитка.
	B_GiveInvItemsManyThings(other,self);
	Npc_RemoveInvItems(other,ItPl_CactusFlower,1);
	Npc_RemoveInvItems(other,ItPl_SwampHerb,3);
	Npc_RemoveInvItems(other,ItPo_Perm_Mana,1);
	Npc_RemoveInvItems(other,ItPl_Perm_Herb,1);
	Npc_RemoveInvItems(other,ItPl_Health_Herb_02,2);
	Npc_RemoveInvItems(other,ItAt_CrawlerMandibles,5);
	Npc_RemoveInvItems(other,ItMi_Aquamarine,1);
	AI_Output(other,self,"DIA_BaalTyon_LokiPotion_Ready_01_02");	//Сколько это займет времени?
	AI_Output(self,other,"DIA_BaalTyon_LokiPotion_Ready_01_03");	//Не меньше пары дней, поскольку рецепт невероятно сложен.
	TyonPotionResearchDayEnd = Wld_GetDay();
	B_LogEntry(TOPIC_PrioratStart,"Я принес все нужные ингредиенты Идолу Тиону, и Гуру приступил к созданию напитка воспоминаний. Процесс приготовления займет не меньше одного дня.");
};

instance DIA_BAALTYON_LokiPotion_Done(C_Info)
{
	npc = gur_8003_tyon;
	nr = 1;
	condition = dia_baaltyon_LokiPotion_Done_condition;
	information = dia_baaltyon_LokiPotion_Done_info;
	important = FALSE;
	description = "Как поживает мой напиток?";
};

func int dia_baaltyon_LokiPotion_Done_condition()
{
	var int daynow;

	daynow = Wld_GetDay();

	if((MIS_PrioratStart == LOG_Running) && (TyonPotionResearchDayEnd > 0) && (TyonPotionResearchDayEnd <= (daynow - 1)))
	{
		return TRUE;
	};
};

func void dia_baaltyon_LokiPotion_Done_info()
{
	AI_Output(other,self,"DIA_BaalTyon_LokiPotion_Done_01_00");	//Как поживает мой напиток?
	AI_Output(self,other,"DIA_BaalTyon_LokiPotion_Done_01_01");	//Он готов. Вот, можешь его забрать.
	B_GiveInvItems(self,other,ItPo_Memories,1);
	AI_Output(other,self,"DIA_BaalTyon_LokiPotion_Done_01_02");	//Спасибо.
	B_LogEntry(TOPIC_PrioratStart,"Напиток воспоминаний готов. Осталось дать его послушнику, чтобы тот вспомнил необходимую мне информацию.");
};