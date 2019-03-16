
instance DIA_STRF_8127_Addon_Hildur_EXIT(C_Info)
{
	npc = STRF_8127_Addon_Hildur;
	nr = 999;
	condition = DIA_STRF_8127_Addon_Hildur_EXIT_Condition;
	information = DIA_STRF_8127_Addon_Hildur_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_STRF_8127_Addon_Hildur_EXIT_Condition()
{
	return TRUE;
};

func void DIA_STRF_8127_Addon_Hildur_EXIT_Info()
{
	AI_StopProcessInfos(self);
};
	
	
instance DIA_STRF_8127_Addon_Hildur_HowYou(C_Info)
{
	npc = STRF_8127_Addon_Hildur;
	nr = 4;
	condition = DIA_STRF_8127_Addon_Hildur_HowYou_Condition;
	information = DIA_STRF_8127_Addon_Hildur_HowYou_Info;
	permanent = FALSE;
	description = "Ты кузнец?";
};

func int DIA_STRF_8127_Addon_Hildur_HowYou_Condition()
{
	return TRUE;
};

func void DIA_STRF_8127_Addon_Hildur_HowYou_Info()
{
	AI_Output(other,self,"DIA_STRF_8127_Addon_Hildur_HowYou_01_00");	//Ты кузнец?
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_HowYou_01_01");	//Нет, я простой плавильщик руды.
	AI_Output(other,self,"DIA_STRF_8127_Addon_Hildur_HowYou_01_02");	//То есть тебе не приходится целый день вкалывать с кайлом в руках?
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_HowYou_01_03");	//Как видишь. Однако не думай, что у меня легкая работа!
	AI_Output(other,self,"DIA_STRF_8127_Addon_Hildur_HowYou_01_04");	//Правда?
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_HowYou_01_05");	//Вот постоишь тут с мое - сам поймешь.
};	
	
instance DIA_STRF_8127_Addon_Hildur_HowLong(C_Info)
{
	npc = STRF_8127_Addon_Hildur;
	nr = 4;
	condition = DIA_STRF_8127_Addon_Hildur_HowLong_Condition;
	information = DIA_STRF_8127_Addon_Hildur_HowLong_Info;
	permanent = FALSE;
	description = "Ты уже давно тут?";
};

func int DIA_STRF_8127_Addon_Hildur_HowLong_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8127_Addon_Hildur_HowYou) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8127_Addon_Hildur_HowLong_Info()
{
	AI_Output(other,self,"DIA_STRF_8127_Addon_Hildur_HowLong_01_00");	//Ты уже давно тут?
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_HowLong_01_01");	//Больше, чем ты можешь себе представить.
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_HowLong_01_02");	//Я попал сюда еще в те времена, когда всей долиной заправляли рудные бароны.
	AI_Output(other,self,"DIA_STRF_8127_Addon_Hildur_HowLong_01_03");	//Как же ты угодил к оркам?
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_HowLong_01_04");	//Это долгая история...(задумчиво) Как-то раз я сопровождал груз руды из старой шахты.
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_HowLong_01_05");	//Когда мы уже почти подходили к замку, на нас вдруг внезапно напали орки.
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_HowLong_01_06");	//Большую часть конвоя они тогда перебили, ну а меня и еще нескольких парней приволокли сюда.
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_HowLong_01_07");	//Когда же орки прознали, что я неплохо умею обращаться с рудой, то поставили меня тут у печи, лить стальные болванки.
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_HowLong_01_08");	//Вот так я тут до сих пор и торчу.
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_HowLong_01_09");	//Мне, конечно, попроще, чем другим парням. У меня даже есть своя кровать.
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_HowLong_01_10");	//Но по сути я такой же раб, как и они.
	AI_Output(other,self,"DIA_STRF_8127_Addon_Hildur_HowLong_01_11");	//Понятно.
};	

instance DIA_STRF_8127_Addon_Hildur_NeedRest(C_Info)
{
	npc = STRF_8127_Addon_Hildur;
	nr = 4;
	condition = DIA_STRF_8127_Addon_Hildur_NeedRest_Condition;
	information = DIA_STRF_8127_Addon_Hildur_NeedRest_Info;
	permanent = FALSE;
	description = "Ты можешь научить меня плавить руду?";
};

func int DIA_STRF_8127_Addon_Hildur_NeedRest_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8127_Addon_Hildur_HowYou) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8127_Addon_Hildur_NeedRest_Info()
{
	AI_Output(other,self,"DIA_STRF_8127_Addon_Hildur_NeedRest_01_00");	//Ты можешь научить меня плавить руду?
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_NeedRest_01_01");	//Извини, но у меня сейчас на это нету времени.
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_NeedRest_01_02");	//Орки пристально следят за тем, как я работаю. И чуть что, сразу начинают подгонять своими топорами.
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_NeedRest_01_03");	//Особенно вон тот орк по имени Дабар Шак! Этот вообще с меня глаз не спускает.
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_NeedRest_01_04");	//Вот если бы ты как-то отвлек его на время, то я вполне бы смог показать тебе, как плавить руду.
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_NeedRest_01_05");	//С условием, конечно, что у тебя будет для этого достаточно опыта.
	AI_Output(other,self,"DIA_STRF_8127_Addon_Hildur_NeedRest_01_06");	//Ладно! Попробую что-нибудь придумать.
	MIS_NeedRest = LOG_Running;
	Log_CreateTopic(TOPIC_NeedRest,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_NeedRest,LOG_Running);
	B_LogEntry(TOPIC_NeedRest,"Хильдур может научить меня плавить руду, если я смогу как-то отвлечь орка Дабар Шака, который постоянно следит за ним.");
};	


instance DIA_STRF_8127_Addon_Hildur_NeedRest_Done(C_Info)
{
	npc = STRF_8127_Addon_Hildur;
	nr = 4;
	condition = DIA_STRF_8127_Addon_Hildur_NeedRest_Done_Condition;
	information = DIA_STRF_8127_Addon_Hildur_NeedRest_Done_Info;
	permanent = FALSE;
	description = "Твой охранник завалился спать.";
};

func int DIA_STRF_8127_Addon_Hildur_NeedRest_Done_Condition()
{
	if((MIS_NeedRest == LOG_Running) && (DabarShakIsSleep == TRUE))
	{
		return TRUE;
	};
};

func void DIA_STRF_8127_Addon_Hildur_NeedRest_Done_Info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_STRF_8127_Addon_Hildur_NeedRest_Done_01_00");	//Твой охранник завалился спать.
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_NeedRest_Done_01_01");	//Ну наконец-то. Теперь можно немного и расслабиться!
	AI_Output(other,self,"DIA_STRF_8127_Addon_Hildur_NeedRest_Done_01_02");	//Так ты научишь меня плавить руду?
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_NeedRest_Done_01_03");	//Почему бы и нет? Но только если у тебя будет достаточно опыта.
	AI_Output(other,self,"DIA_STRF_8127_Addon_Hildur_NeedRest_Done_01_04");	//Само собой.
	RT_Respect = RT_Respect + 1;
	MIS_NeedRest = LOG_Success;
	Log_SetTopicStatus(TOPIC_NeedRest,LOG_Success);
	B_LogEntry(TOPIC_NeedRest,"Я рассказал Хильдуру про уснувшего Дабар Шака. Теперь он может научить меня плавить руду.");
};	

instance DIA_STRF_8127_Addon_Hildur_Plavka(C_Info)
{
	npc = STRF_8127_Addon_Hildur;
	nr = 5;
	condition = DIA_STRF_8127_Addon_Hildur_Plavka_condition;
	information = DIA_STRF_8127_Addon_Hildur_Plavka_info;
	permanent = TRUE;
	description = "Научи меня плавить железную руду. (Очки обучения: 3)";
};

func int DIA_STRF_8127_Addon_Hildur_Plavka_condition()
{
	if((MIS_NeedRest == LOG_Success) && (KNOWHOWTOOREFUS == FALSE))
	{
		return TRUE;
	};
};

func void DIA_STRF_8127_Addon_Hildur_Plavka_info()
{
	AI_Output(other,self,"DIA_STRF_8127_Addon_Hildur_Plavka_01_00");	//Научи меня плавить железную руду.

	if(hero.lp < 3)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		B_Say(self,other,"$NOLEARNNOPOINTS");
		AI_StopProcessInfos(self);
	};
	if(hero.lp >= 3)
	{
		AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_Plavka_01_01");	//В плавильной печи все проще, но подойдет и простой кузнечный горн.
		AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_Plavka_01_02");	//Тебе нужно как минимум пятьдесят кусков руды. Топишь их в печи, а потом сливаешь в форму!
		AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_Plavka_01_03");	//Вот и весь секрет изготовления стальной заготовки.
		hero.lp = hero.lp - 3;
		RankPoints = RankPoints + 3;
		AI_Print("Изучено: плавка руды");
		KNOWHOWTOOREFUS = TRUE;
		DabarShakIsAwake = TRUE;
		Snd_Play("LevelUP");
		B_LogEntry(TOPIC_STEELDRAW,"Теперь я умею переплавлять железную руду в стальные заготовки. Для получения стальной заготовки нужен кузнечный горн и пятьдесят кусков руды.");
	};
};

instance DIA_STRF_8127_Addon_Hildur_Work(C_Info)
{
	npc = STRF_8127_Addon_Hildur;
	nr = 4;
	condition = DIA_STRF_8127_Addon_Hildur_Work_Condition;
	information = DIA_STRF_8127_Addon_Hildur_Work_Info;
	permanent = FALSE;
	description = "У тебя есть какая-нибудь работенка для меня?";
};

func int DIA_STRF_8127_Addon_Hildur_Work_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8127_Addon_Hildur_HowYou) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8127_Addon_Hildur_Work_Info()
{
	AI_Output(other,self,"DIA_STRF_8127_Addon_Hildur_Work_01_00");	//У тебя есть какая-нибудь работенка для меня?
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_Work_01_01");	//Хммм...(задумчиво) Ты бы мне очень помог, если бы раздобыл где-нибудь угля.
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_Work_01_02");	//Эта печь так стара, что мне каждый раз приходится тратить кучу времени, чтобы разжечь в ней огонь.
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_Work_01_03");	//А нормального угля тут днем с огнем не сыщешь! 
	AI_Output(other,self,"DIA_STRF_8127_Addon_Hildur_Work_01_04");	//И сколько тебе его нужно?
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_Work_01_05");	//Совсем немного. Имей бы я под рукой хотя бы десять кусков угля, то этого количества мне бы надолго хватило.
	AI_Output(other,self,"DIA_STRF_8127_Addon_Hildur_Work_01_06");	//Хорошо. Попробую достать его для тебя.
	MIS_HildurCoal = LOG_Running;
	Log_CreateTopic(TOPIC_HildurCoal,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HildurCoal,LOG_Running);
	B_LogEntry(TOPIC_HildurCoal,"Хильдуру нужен уголь, чтобы разжигать огонь в своей старой плавильне. По меньшей мере кусков десять.");
};	

instance DIA_STRF_8127_Addon_Hildur_WorkDone(C_Info)
{
	npc = STRF_8127_Addon_Hildur;
	nr = 4;
	condition = DIA_STRF_8127_Addon_Hildur_WorkDone_Condition;
	information = DIA_STRF_8127_Addon_Hildur_WorkDone_Info;
	permanent = FALSE;
	description = "Я принес тебе угля.";
};

func int DIA_STRF_8127_Addon_Hildur_WorkDone_Condition()
{
	if((MIS_HildurCoal == LOG_Running) && (Npc_HasItems(hero,ItMi_Coal) >= 10))
	{
		return TRUE;
	};
};

func void DIA_STRF_8127_Addon_Hildur_WorkDone_Info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_STRF_8127_Addon_Hildur_WorkDone_01_00");	//Я принес тебе угля.
	B_GiveInvItems(other,self,ItMi_Coal,10);
	Npc_RemoveInvItems(self,ItMi_Coal,10);
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_WorkDone_01_01");	//Отлично, парень! Теперь моим мучениям пришел конец!
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_WorkDone_01_02");	//К сожалению, мне нечем тебя отблагодарить.
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_WorkDone_01_03");	//Если только парой кусков железной руды.
	B_GiveInvItems(self,other,ItMi_SNugget,2);
	AI_Output(other,self,"DIA_STRF_8127_Addon_Hildur_WorkDone_01_04");	//Большего и не надо.
	RT_Respect = RT_Respect + 1;
	MIS_HildurCoal = LOG_Success;
	Log_SetTopicStatus(TOPIC_HildurCoal,LOG_Success);
	B_LogEntry(TOPIC_HildurCoal,"Я принес Хильдуру уголь.");
};
	
instance DIA_STRF_8127_Addon_Hildur_LowLevel(C_Info)
{
	npc = STRF_8127_Addon_Hildur;
	nr = 4;
	condition = DIA_STRF_8127_Addon_Hildur_LowLevel_Condition;
	information = DIA_STRF_8127_Addon_Hildur_LowLevel_Info;
	permanent = FALSE;
	description = "Что ты знаешь о нижнем уровне шахты?";
};

func int DIA_STRF_8127_Addon_Hildur_LowLevel_Condition()
{
	if((Npc_KnowsInfo(hero,DIA_STRF_8127_Addon_Hildur_HowYou) == TRUE) && (MIS_LowLevel == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_STRF_8127_Addon_Hildur_LowLevel_Info()
{
	AI_Output(other,self,"DIA_STRF_8127_Addon_Hildur_LowLevel_01_00");	//Что ты знаешь о нижнем уровне шахты?
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_LowLevel_01_01");	//Хммм...(удивленно) А с чего вдруг такие вопросы?!
	AI_Output(other,self,"DIA_STRF_8127_Addon_Hildur_LowLevel_01_02");	//По словам Роллана, ты должен кое-что знать об этом.
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_LowLevel_01_03");	//Ага! Так значит, это тебе Роллан нашептал? Вот же ж трепло!
	AI_Output(other,self,"DIA_STRF_8127_Addon_Hildur_LowLevel_01_04");	//Значит, он прав. Может, тогда расскажешь мне, что тебе известно про нижний уровень?
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_LowLevel_01_05");	//Эх! Ну ладно...(вздыхая) Хотя я и не особо люблю говорить на эту тему.
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_LowLevel_01_06");	//В общем, в свое время на нижнем уровне тоже добывалась руда.
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_LowLevel_01_07");	//Но не просто железная, а магическая! Там было очень богатое месторождение этой горной породы.
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_LowLevel_01_08");	//И все шло прекрасно до тех пор, пока орки, видимо, не откопали там то, что они не должны были откапывать.
	AI_Output(other,self,"DIA_STRF_8127_Addon_Hildur_LowLevel_01_09");	//Что же именно они там нашли?
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_LowLevel_01_10");	//Я не знаю, приятель. В то время я уже работал здесь, у печи. Поэтому отходить далеко не мог.
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_LowLevel_01_11");	//Но одно я знаю точно...
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_LowLevel_01_12");	//...после того случая орки закрыли проход, ведущий на нижний уровень, и больше его никогда не открывали!
	AI_Output(other,self,"DIA_STRF_8127_Addon_Hildur_LowLevel_01_13");	//Значит, никто не знает настоящую причину, почему орки закрыли ту часть шахты?
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_LowLevel_01_14");	//Если ее кто-то и знает, то только сами орки.
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_LowLevel_01_15");	//Но из тех, кто здесь был тогда, остался только один Грок. Старый орк-охранник, что стоит возле подъемника.
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_LowLevel_01_16");	//Можешь попробовать поговорить с ним. Если, конечно, он станет тебя слушать.
	AI_Output(other,self,"DIA_STRF_8127_Addon_Hildur_LowLevel_01_17");	//Хорошо, так и сделаю.
	KnowGrok = TRUE;
	B_LogEntry(TOPIC_LowLevel,"Я поговорил с Хильдуром по поводу нижнего уровня шахты. Похоже, орки обнаружили там нечто такое, что их крайне напугало. Что именно - Хильдиру не известно. Старый орк Грок может кое-что знать об этом.");
};	

instance DIA_STRF_8127_Addon_Hildur_Perm(C_Info)
{
	npc = STRF_8127_Addon_Hildur;
	nr = 2;
	condition = DIA_STRF_8127_Addon_Hildur_Perm_Condition;
	information = DIA_STRF_8127_Addon_Hildur_Perm_Info;
	permanent = TRUE;
	description = "Как работается?";
};

func int DIA_STRF_8127_Addon_Hildur_Perm_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8127_Addon_Hildur_HowLong) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8127_Addon_Hildur_Perm_Info()
{
	AI_Output(other,self,"DIA_STRF_8127_Addon_Hildur_Perm_01_00");	//Как работается?
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_Perm_01_01");	//Все так же, приятель...(вздыхая) Целый день только и занимаюсь тем, что отливаю стальные болванки.
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_Perm_01_02");	//Но лучше уж так, чем с кайлом у жилы.
	AI_Output(other,self,"DIA_STRF_8127_Addon_Hildur_Perm_01_03");	//Это ты точно подметил.
};	

instance DIA_STRF_8127_Addon_Hildur_ElkKirka(C_Info)
{
	npc = STRF_8127_Addon_Hildur;
	nr = 2;
	condition = DIA_STRF_8127_Addon_Hildur_ElkKirka_Condition;
	information = DIA_STRF_8127_Addon_Hildur_ElkKirka_Info;
	permanent = FALSE;
	description = "Ты случайно не знаешь, где тут можно раздобыть приличную кирку?";
};

func int DIA_STRF_8127_Addon_Hildur_ElkKirka_Condition()
{
	if((MIS_ElkKirka == LOG_Running) && (ElkNeedNewKirka == TRUE) && (Npc_KnowsInfo(hero,DIA_STRF_8127_Addon_Hildur_HowYou) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_STRF_8127_Addon_Hildur_ElkKirka_Info()
{
	AI_Output(other,self,"DIA_STRF_8127_Addon_Hildur_ElkKirka_01_00");	//Ты случайно не знаешь, где тут можно раздобыть приличную кирку?
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_ElkKirka_01_01");	//За весь инструмент тут отвечает Вакур Шак.
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_ElkKirka_01_02");	//Но тебе он продаст ее только в том случае, если у тебя есть золото.
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_ElkKirka_01_03");	//Эта скотина слишком жадная для орка! Но тем не менее...
	AI_Output(other,self,"DIA_STRF_8127_Addon_Hildur_ElkKirka_01_04");	//А откуда рабы берут золото?
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_ElkKirka_01_05");	//Подчас среди породы железной руды можно найти небольшие золотые прожилки.
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_ElkKirka_01_06");	//Если ты наткнулся на такую, то, считай, тебе крупно повезло.
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_ElkKirka_01_07");	//За золото тут можно купить более-менее нормальной еды или новые инструменты.
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_ElkKirka_01_08");	//Вот так и выживаем!
	AI_Output(other,self,"DIA_STRF_8127_Addon_Hildur_ElkKirka_01_09");	//Ясно.
	ElkNeedNewKirka = 2;
};	