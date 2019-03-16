
instance DIA_DMT_1257_DEMENTOR_EXIT(C_Info)
{
	npc = dmt_1257_dementor;
	nr = 999;
	condition = dia_dmt_1257_dementor_exit_condition;
	information = dia_dmt_1257_dementor_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_dmt_1257_dementor_exit_condition()
{
	return TRUE;
};

func void dia_dmt_1257_dementor_exit_info()
{
	Wld_StopEffect("DEMENTOR_FX");
	AI_StopProcessInfos(self);
};


instance DIA_DMT_1257_DEMENTOR_FIRST(C_Info)
{
	npc = dmt_1257_dementor;
	nr = 1;
	condition = dia_dmt_1257_dementor_first_condition;
	information = dia_dmt_1257_dementor_first_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_dmt_1257_dementor_first_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (DEMENTORMEET == TRUE))
	{
		return TRUE;
	};
};

func void dia_dmt_1257_dementor_first_info()
{
	//Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
};


instance DIA_DMT_1257_DEMENTOR_HELLO(C_Info)
{
	npc = dmt_1257_dementor;
	nr = 1;
	condition = dia_dmt_1257_dementor_hello_condition;
	information = dia_dmt_1257_dementor_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_dmt_1257_dementor_hello_condition()
{
	if(BELIARSERVANTHERE == TRUE)
	{
		return TRUE;
	};
};

func void dia_dmt_1257_dementor_hello_info()
{
	//Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_DMT_1257_Dementor_Hello_01_00");	//Хозяин услышал твой зов, презренный смертный...
	AI_Output(other,self,"DIA_DMT_1257_Dementor_Hello_01_01");	//ЧТО?! Кто ты?
	AI_Output(self,other,"DIA_DMT_1257_Dementor_Hello_01_02");	//Мое имя Зигос, и я тот, кого прислал мой господин, дабы помочь тебе. Или не ты просил о помощи, молясь перед его алтарем?
	AI_Output(other,self,"DIA_DMT_1257_Dementor_Hello_01_03");	//Так тебя прислал сам Белиар?
	AI_Output(self,other,"DIA_DMT_1257_Dementor_Hello_01_04");	//Ты догадлив, смертный.
	AI_Output(self,other,"DIA_DMT_1257_Dementor_Hello_01_06");	//Хозяин знает о твоих намерениях завладеть амулетом, что так рьяно хранят паладины Инноса.
	AI_Output(self,other,"DIA_DMT_1257_Dementor_Hello_01_07");	//И готов тебе подсказать путь, способный вернуть этот утраченный артефакт.
	AI_Output(self,other,"DIA_DMT_1257_Dementor_Hello_01_09");	//Слушай меня внимательно, смертный...
	AI_Output(self,other,"DIA_DMT_1257_Dementor_Hello_01_10");	//Много веков назад мой господин избрал себе слугу среди смертных, даруя ему способность принимать облик любого человека, выбранного им по своему желанию. Его звали Феллангор!
	AI_Output(self,other,"DIA_DMT_1257_Dementor_Hello_01_11");	//Хозяин возжелал, чтобы его избранник запятнал доброе имя паладинов и магов Огня, творя ужасные злодеяния в их обличии.
	AI_Output(self,other,"DIA_DMT_1257_Dementor_Hello_01_12");	//Но как и все смертные, тот не справился со столь чудесным даром! Его разум оказался слишком слаб, чтобы совладать с дарованной ему силой.
	AI_Output(self,other,"DIA_DMT_1257_Dementor_Hello_01_13");	//Совсем обезумев, этот ничтожный червь забыл свое истинное предназначение и перестал служить Темному богу.
	AI_Output(self,other,"DIA_DMT_1257_Dementor_Hello_01_14");	//С тех пор он блуждает по миру, принимая обличье разных людей...
	AI_Output(other,self,"DIA_DMT_1257_Dementor_Hello_01_15");	//А моя роль в этом какая?
	AI_Output(self,other,"DIA_DMT_1257_Dementor_Hello_01_16");	//А разве ты еще не понял? Будь ты на месте того безумца, то мог бы легко обмануть паладинов, охраняющих амулет Трирамар, затуманив их взор.
	AI_Output(self,other,"DIA_DMT_1257_Dementor_Hello_01_17");	//Правда, для этого тебе бы пришлось найти человека, которому они доверяют. Но наверняка для тебя это не станет большой проблемой.
	AI_Output(other,self,"DIA_DMT_1257_Dementor_Hello_01_18");	//То есть ты хочешь сказать, что Белиар тоже может даровать мне способность менять свой облик?
	AI_Output(self,other,"DIA_DMT_1257_Dementor_Hello_01_20");	//Он позволит тебе один раз воспользоваться его даром!
	AI_Output(self,other,"DIA_DMT_1257_Dementor_Hello_01_21");	//И, естественно, только после того, как ты окажешь ему одну небольшую услугу. Ты согласен?
	DEMENTORMEET = TRUE;
	Info_ClearChoices(dia_dmt_1257_dementor_hello);
	Info_AddChoice(dia_dmt_1257_dementor_hello,"Нет, это все не для меня.",dia_dmt_1257_dementor_hello_no);
	Info_AddChoice(dia_dmt_1257_dementor_hello,"Да, конечно.",dia_dmt_1257_dementor_hello_yes);
};

func void dia_dmt_1257_dementor_hello_no()
{
	AI_Output(other,self,"DIA_DMT_1257_Dementor_Hello_No_01_01");	//Нет, это все не для меня.
	AI_Output(self,other,"DIA_DMT_1257_Dementor_Hello_No_01_02");	//Тогда прощай, смертный! Мы не свидимся более...
	Info_ClearChoices(dia_dmt_1257_dementor_hello);
	Info_AddChoice(dia_dmt_1257_dementor_hello,Dialog_Ende,dia_dmt_1257_dementor_hello_ext);
};

func void dia_dmt_1257_dementor_hello_ext()
{
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,10);
	B_Attack(self,other,0,0);
};

func void dia_dmt_1257_dementor_hello_yes()
{
	AI_Output(other,self,"DIA_DMT_1257_Dementor_Hello_Yes_01_01");	//Да.
	AI_Output(self,other,"DIA_DMT_1257_Dementor_Hello_Yes_01_02");	//Что же. Тогда, для начала, вот, - возьми эту вещь.
	CreateInvItems(self,itam_zigosmagic,1);
	B_GiveInvItems(self,other,itam_zigosmagic,1);
	MIS_BELIARHELPME = LOG_Running;
	AI_Output(other,self,"DIA_DMT_1257_Dementor_Hello_Yes_01_03");	//Это магический амулет?
	AI_Output(self,other,"DIA_DMT_1257_Dementor_Hello_Yes_01_04");	//Да, именно так. Правда, сейчас, как ты видишь, в нем нет и намека на его магические свойства.
	AI_Output(self,other,"DIA_DMT_1257_Dementor_Hello_Yes_01_07");	//Тебе следует найти того безумца, который когда-то поклялся в верности моему хозяину. Найти и убить его!
	AI_Output(other,self,"DIA_DMT_1257_Dementor_Hello_Yes_01_10");	//Судя по тому, что ты рассказал, этот человек может быть кем угодно!
	AI_Output(self,other,"DIA_DMT_1257_Dementor_Hello_Yes_01_13");	//Просто произнеси слова - '...АРХ БЕЛИАР НОМЭН САКТ ДАГАР ХАР...' и используй на нем магию полученного тобой амулета.
	AI_Output(self,other,"DIA_DMT_1257_Dementor_Hello_Yes_01_14");	//Правда, я боюсь, что его мощь навряд ли сможет полностью лишить твоего будущего врага жизненной силы, ибо он довольно могущественен.
	AI_Output(self,other,"DIA_DMT_1257_Dementor_Hello_Yes_01_17");	//Просто убить его у тебя не получится!
	AI_Output(self,other,"DIA_DMT_1257_Dementor_Hello_Yes_01_19");	//Теперь иди. А после ты получишь свою награду, как помощь, о кой просил моего господина.
	Log_CreateTopic(TOPIC_BELIARHELPME,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BELIARHELPME,LOG_Running);
	B_LogEntry(TOPIC_BELIARHELPME,"Белиар откликнулся на мой зов и прислал своего слугу - темного посланника Зигоса. Тот поведал мне историю о неком человеке - Феллангоре, которому Белиар даровал способность принимать облик других людей. Однако его избранник, не выдержав бремени такого могущества, в конце концов попросту обезумел и отрекся от Темного бога.");
	Log_AddEntry(TOPIC_BELIARHELPME,"Как оказалось, Зигос рассказал мне историю об этом безумце не просто так. Воспользовавшись способностью принимать облик другого человека, я смогу обмануть и ввести в заблуждение любого, кого захочу, том числе и паладинов Инноса, охраняющих амулет на острове. Правда, этому человеку они должны доверять.");
	Log_AddEntry(TOPIC_BELIARHELPME,"Однако чтобы заполучить в свои руки эту темную магию, Зигос сперва потребовал от меня найти и убить того безумца, что в свое время отверг его хозяина. Этот человек может быть кем угодно, и мне придется приложить немало усилий, чтобы отыскать его. На случай если я его встречу, Зигос дал мне магический амулет, сила которого поможет мне одолеть избранника Белиара.");
	Log_AddEntry(TOPIC_BELIARHELPME,"Перед тем как я использую амулет на своей жертве, мне необходимо произнести слова заклинания - 'АРХ БЕЛИАР НОМЭН САКТ ДАГАР ХАР'. Без них сила амулета не подействует. Также Зигос предупредил меня, что амулет не способен в одночасье убить того безумца, поэтому мне придется использовать его несколько раз.");
	if(CurrentLevel == NEWWORLD_ZEN)
	{
		B_StartOtherRoutine(Fellan,"Insane");
		AI_Teleport(Fellan,"NW_FELLAN_REPAIR_01");
	}
	else
	{
		FLAGFELLANUP = TRUE;
	};
	Info_ClearChoices(dia_dmt_1257_dementor_hello);
};


instance DIA_DMT_1257_DEMENTOR_WHATITMEANS(C_Info)
{
	npc = dmt_1257_dementor;
	nr = 1;
	condition = dia_dmt_1257_dementor_whatitmeans_condition;
	information = dia_dmt_1257_dementor_whatitmeans_info;
	permanent = FALSE;
	description = "Что означают слова 'АРХ БЕЛИАР НОМЭН САКТ ДАГАР ХАР'?";
};


func int dia_dmt_1257_dementor_whatitmeans_condition()
{
	if((MIS_BELIARHELPME == LOG_Running) && (FELLANGORSAVE == FALSE) && (INSANEKILLDONE == FALSE))
	{
		return TRUE;
	};
};

func void dia_dmt_1257_dementor_whatitmeans_info()
{
	AI_Output(other,self,"DIA_DMT_1257_Dementor_WhatItMeans_01_00");	//Что означают слова 'АРХ БЕЛИАР НОМЭН САКТ ДАГАР ХАР'?
	AI_Output(self,other,"DIA_DMT_1257_Dementor_WhatItMeans_01_01");	//На древнем языке Тьмы они означают: 'ВО ИМЯ БЕЛИАРА, ПОВЕЛИТЕЛЯ ТЬМЫ И ВЛАСТЕЛИНА СИЛ ЗЛА - ВЕРНИ СИЛУ БОГА СВОЕГО И УПЛАТИ НАЗНАЧЕННУЮ ЦЕНУ'.
};


instance DIA_DMT_1257_DEMENTOR_DONEPRICE(C_Info)
{
	npc = dmt_1257_dementor;
	nr = 1;
	condition = dia_dmt_1257_dementor_doneprice_condition;
	information = dia_dmt_1257_dementor_doneprice_info;
	permanent = FALSE;
	description = "Я выполнил то, что ты просил.";
};


func int dia_dmt_1257_dementor_doneprice_condition()
{
	if((MIS_BELIARHELPME == LOG_Running) && (INSANEKILLDONE == TRUE))
	{
		return TRUE;
	};
};

func void dia_dmt_1257_dementor_doneprice_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_DMT_1257_Dementor_DonePrice_01_00");	//Я выполнил то, о чем ты просил.
	AI_Output(self,other,"DIA_DMT_1257_Dementor_DonePrice_01_01");	//(могущественно) Мне это уже известно! Мой господин будет доволен этой новостью.
	AI_Output(self,other,"DIA_DMT_1257_Dementor_DonePrice_01_04");	//А тот амулет, что я тебе дал, - он еще при тебе?
	if(Npc_HasItems(hero,itam_zigosmagic) >= 1)
	{
		AI_Output(other,self,"DIA_DMT_1257_Dementor_DonePrice_01_05");	//Да, вот он.
		AI_Output(self,other,"DIA_DMT_1257_Dementor_DonePrice_01_06");	//Хорошо. Тогда оставь его у себя в качестве обещанной тебе награды.
		AI_Output(self,other,"DIA_DMT_1257_Dementor_DonePrice_01_07");	//Хотя, по всей видимости, ты сейчас не понимаешь, как тебе его использовать в твоем предстоящем деле.
	}
	else
	{
		AI_Output(other,self,"DIA_DMT_1257_Dementor_DonePrice_01_08");	//У меня его нет.
		AI_Output(self,other,"DIA_DMT_1257_Dementor_DonePrice_01_09");	//(гневно) Глупец! Неужели ты его потерял?
		AI_Output(self,other,"DIA_DMT_1257_Dementor_DonePrice_01_10");	//Именно он и был обещанной наградой за твои труды!
	};
	AI_Output(other,self,"DIA_DMT_1257_Dementor_DonePrice_01_12");	//Может, тогда объяснишь, для чего он мне нужен?
	AI_Output(self,other,"DIA_DMT_1257_Dementor_DonePrice_01_13");	//Конечно. Лишив избранника Белиара жизненной силы, этот артефакт впитал в себя и частицу его божественного дара.
	AI_Output(self,other,"DIA_DMT_1257_Dementor_DonePrice_01_14");	//Поэтому, воспользовавшись им, ты бы смог принять облик любого другого из ныне живущих смертных.
	AI_Output(self,other,"DIA_DMT_1257_Dementor_DonePrice_01_15");	//Правда, всего один раз. После этого сила амулета иссякнет.
	AI_Output(self,other,"DIA_DMT_1257_Dementor_DonePrice_01_19");	//Но использовав магию амулета и приняв облик другого человека, тебе нельзя будет сражаться или использовать любые другие магические заклинания.
	AI_Output(self,other,"DIA_DMT_1257_Dementor_DonePrice_01_20");	//Его чары - крайне хрупкая субстанция, и при любом на нее воздействии она мгновенно будет уничтожена.
	MIS_BELIARHELPME = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_BELIARHELPME,LOG_SUCCESS);
	B_LogEntry(TOPIC_BELIARHELPME,"Я сообщил Зигосу, что расправился с тем безумцем и спросил о своей награде. На это Зигос ответил мне, что моя награда - амулет, что я получил от него ранее. Лишив свою жертву жизненных сил, этот артефакт впитал в себя частицу божественного дара, коим Белиар наградил своего безумного слугу. И теперь я смогу использовать его, чтобы принять облик любого другого человека, но всего лишь один раз. Зигос также предупредил, что, использовав силу амулета, мне нельзя сражаться или использовать какое-либо магическое заклинание, иначе чары его магии моментально развеются.");
};


instance DIA_DMT_1257_DEMENTOR_HOWUSEAM(C_Info)
{
	npc = dmt_1257_dementor;
	nr = 1;
	condition = dia_dmt_1257_dementor_howuseam_condition;
	information = dia_dmt_1257_dementor_howuseam_info;
	permanent = FALSE;
	description = "Как мне использовать амулет?";
};


func int dia_dmt_1257_dementor_howuseam_condition()
{
	if((MIS_BELIARHELPME == LOG_SUCCESS) && (MEHASTRIRAVAR == FALSE))
	{
		return TRUE;
	};
};

func void dia_dmt_1257_dementor_howuseam_info()
{
	AI_Output(other,self,"DIA_DMT_1257_Dementor_HowUseAm_01_00");	//Как мне использовать амулет?
	AI_Output(self,other,"DIA_DMT_1257_Dementor_HowUseAm_01_01");	//Все очень просто. Надень его и заговори с тем, в кого хочешь превратиться.
	AI_Output(self,other,"DIA_DMT_1257_Dementor_HowUseAm_01_02");	//А после произнеси слова заклинания, которые разбудят магию амулета.
	AI_Output(self,other,"DIA_DMT_1257_Dementor_HowUseAm_01_04");	//Слушай и запоминай - '...ГВАР САХ ЭСК ШАТАР...'! Без них сила амулета не пойдствует на твою жертву.
	B_LogEntry(TOPIC_BELIARHELPME,"Зигос объяснил мне, как использовать силу амулета. Мне необходимо надеть его и заговорить с тем, в кого собираюсь превратиться. А после произнести слова заклинания - 'ГВАР САХ ЭСК ШАТАР'.");
	CANUSEZIGOSMAGIC = TRUE;
	Info_ClearChoices(dia_dmt_1257_dementor_howuseam);
	Info_AddChoice(dia_dmt_1257_dementor_howuseam,Dialog_Ende,dia_dmt_1257_dementor_howuseam_ext);
};

func void dia_dmt_1257_dementor_howuseam_ext()
{
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,10);
	B_Attack(self,other,0,0);
};


instance DIA_DMT_1257_DEMENTOR_DONEPRICEFAILED(C_Info)
{
	npc = dmt_1257_dementor;
	nr = 1;
	condition = dia_dmt_1257_dementor_donepricefailed_condition;
	information = dia_dmt_1257_dementor_donepricefailed_info;
	permanent = FALSE;
	description = "Я не смог выполнить твое поручение.";
};


func int dia_dmt_1257_dementor_donepricefailed_condition()
{
	if((MIS_BELIARHELPME == LOG_Running) && (FELLANGORSAVE == TRUE))
	{
		return TRUE;
	};
};

func void dia_dmt_1257_dementor_donepricefailed_info()
{
	AI_Output(other,self,"DIA_DMT_1257_Dementor_DonePriceFailed_01_00");	//Я не смог выполнить твое поручение.
	AI_Output(self,other,"DIA_DMT_1257_Dementor_DonePriceFailed_01_01");	//(разочарованно) Можешь ничего не рассказывать! Я и так уже знаю об этом.
	AI_Output(self,other,"DIA_DMT_1257_Dementor_DonePriceFailed_01_02");	//Теперь ты можешь не рассчитывать на помощь со стороны моего господина!
	AI_Output(self,other,"DIA_DMT_1257_Dementor_DonePriceFailed_01_04");	//Прощай, смертный. Мы не свидимся более...
	MIS_BELIARHELPME = LOG_OBSOLETE;
	Log_SetTopicStatus(TOPIC_BELIARHELPME,LOG_OBSOLETE);
	Info_ClearChoices(dia_dmt_1257_dementor_donepricefailed);
	Info_AddChoice(dia_dmt_1257_dementor_donepricefailed,Dialog_Ende,dia_dmt_1257_dementor_donepricefailed_ext);
};

func void dia_dmt_1257_dementor_donepricefailed_ext()
{
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,10);
	B_Attack(self,other,0,0);
};