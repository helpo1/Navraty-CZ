
instance DIA_HUN_745_RAFFA_EXIT(C_Info)
{
	npc = hun_745_raffa;
	nr = 999;
	condition = dia_hun_745_raffa_exit_condition;
	information = dia_hun_745_raffa_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_hun_745_raffa_exit_condition()
{
	return TRUE;
};

func void dia_hun_745_raffa_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HUN_745_RAFFA_R(C_Info)
{
	npc = hun_745_raffa;
	nr = 1;
	condition = dia_hun_745_raffa_r_condition;
	information = dia_hun_745_raffa_r_info;
	permanent = FALSE;
	description = "Кто ты?";
};


func int dia_hun_745_raffa_r_condition()
{
	if(HEROISHUNTER == FALSE)
	{
		return TRUE;
	};
};

func void dia_hun_745_raffa_r_info()
{
	var C_Item itm;
	itm = Npc_GetEquippedArmor(other);
	if(Hlp_IsItem(itm,ITAR_Leather_L) == TRUE)
	{
		AI_Output(other,self,"DIA_HUN_745_R_01_00");	//Кто ты?
		AI_Output(self,other,"DIA_HUN_745_R_01_01");	//Мое имя Раффа.
		AI_Output(other,self,"DIA_HUN_745_R_01_02");	//Ты тоже охотник?
		AI_Output(self,other,"DIA_HUN_745_R_01_03");	//Да.
		AI_Output(other,self,"DIA_HUN_745_R_01_04");	//А ты не особо разговорчивый, да?
		AI_Output(self,other,"DIA_HUN_745_R_01_05");	//Я не люблю просто так болтать без дела.
		AI_Output(self,other,"DIA_HUN_745_R_01_06");	//Так что тебе лучше обратиться к Фальку. Он скажет больше, чем я!
	}
	else
	{
		AI_Output(other,self,"DIA_HUN_745_R_01_07");	//Кто ты?
		AI_Output(self,other,"DIA_HUN_745_R_01_08");	//А какое тебе дело до того, кто я?
		AI_Output(other,self,"DIA_HUN_745_R_01_09");	//Ты тоже охотник?
		AI_Output(self,other,"DIA_HUN_745_R_01_10");	//Это тебя не касается.
		AI_Output(other,self,"DIA_HUN_745_R_01_12");	//А ты не особо разговорчивый, да?
		AI_Output(self,other,"DIA_HUN_745_R_01_13");	//Да.
		AI_StopProcessInfos(self);
	};
};


instance DIA_HUN_745_RAFFA_GREET(C_Info)
{
	npc = hun_745_raffa;
	nr = 1;
	condition = dia_hun_745_raffa_greet_condition;
	information = dia_hun_745_raffa_greet_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_hun_745_raffa_greet_condition()
{
	if((HEROISHUNTER == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_hun_745_raffa_greet_info()
{
	AI_Output(self,other,"DIA_HUN_745_Greet_01_00");	//Эй! Теперь ты один из нас, малыш!
};


instance DIA_HUN_745_RAFFA_NEWS(C_Info)
{
	npc = hun_745_raffa;
	nr = 3;
	condition = dia_hun_745_raffa_news_condition;
	information = dia_hun_745_raffa_news_info;
	permanent = TRUE;
	description = "Есть интересные новости?";
};

func int dia_hun_745_raffa_news_condition()
{
	if(HEROISHUNTER == TRUE)
	{
		return TRUE;
	};
};

func void dia_hun_745_raffa_news_info()
{
	AI_Output(other,self,"DIA_HUN_745_News_01_00");	//Есть интересные новости?

	if((Kapitel >= 1) && (MIS_INSLUKER == FALSE))
	{
		AI_Output(self,other,"DIA_HUN_745_News_01_01");	//Интересные вещи есть всегда...(улыбается)
		AI_Output(self,other,"DIA_HUN_745_News_01_02");	//Вот, например, недавно я охотился на одного шныга.
		AI_Output(self,other,"DIA_HUN_745_News_01_07");	//Понимаешь, я уже долгое время пытаюсь добыть хотя бы одно яйцо этих существ. Но вот как раз тут и возникает проблема!
		AI_Output(self,other,"DIA_HUN_745_News_01_09");	//Обычно шныг не очень серьезный противник для опытного охотника.
		AI_Output(self,other,"DIA_HUN_745_News_01_10");	//Однако когда дело касается их потомства, шныги очень надежно охраняют свое гнездо и отчаянно защищаются от незваных гостей.
		AI_Output(self,other,"DIA_HUN_745_News_01_11");	//Оказывается, шныг, во время кладки яиц, становится чрезвычайно сильным и опасным созданием!
		AI_Output(self,other,"DIA_HUN_745_News_01_12");	//Я как-то попробовал завалить одного такого.
		AI_Output(self,other,"DIA_HUN_745_News_01_13");	//Представляешь, эта тварь оказалась настолько сильной, что я даже не смог нанести ей хоть какие-то серьезные повреждения!
		MIS_INSLUKER = LOG_Running;
		Log_CreateTopic(TOPIC_INSLUKER,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_INSLUKER,LOG_Running);
		B_LogEntry(TOPIC_INSLUKER,"Раффа рассказал мне, что шныги, защищая свое потомство, становятся невероятно опасными. Во время недавней охоты он наткнулся на гнездо одного из них. Охотник хотел забрать из кладки несколько яиц, но столкнулся с охранявшим их шныгом, который оказался настолько сильным, что Раффа чуть не погиб. Поэтому мне тоже стоит быть осторожным, если я набреду на подобное место.");
		Wld_InsertNpc(egglurker,"FP_ROAM_NW_HUNTEGGLURKER_01");
		Wld_InsertItem(itat_lukeregg,"FP_NW_ITEM_EGGLURKER_01");
	}
	else if((Kapitel >= 2) && (MIS_INSSHADOWBEAST == FALSE) && (MIS_INSLUKER == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_HUN_745_News_01_20");	//Говорят, что в ложбине за фермой Лобарта видели одного невероятно большого и странного с виду зверя.
		AI_Output(self,other,"DIA_HUN_745_News_01_21");	//Судя по описанию, это существо очень сильно напоминает мне одного... так скажем, необычного мракориса.
		AI_Output(other,self,"DIA_HUN_745_News_01_22");	//То есть какого-то особенного?
		AI_Output(self,other,"DIA_HUN_745_News_01_23");	//Да. Призрачного мракориса, охотника ночи! Слышал когда-нибудь о нем?
		AI_Output(other,self,"DIA_HUN_745_News_01_24");	//Нет. А что это за тварь такая?
		AI_Output(self,other,"DIA_HUN_745_News_01_25");	//Ха! Этот зверь - почти легенда. Силен, как тролль и ловок, как пантера!
		AI_Output(self,other,"DIA_HUN_745_News_01_26");	//Встретить его хотя бы раз в жизни считается огромной удачей, или же наоборот - большим невезением.
		AI_Output(self,other,"DIA_HUN_745_News_01_27");	//Ведь выстоять против него не удавалось еще никому.
		AI_Output(self,other,"DIA_HUN_745_News_01_28");	//И, ко всему прочему, у него отличное зрение, поскольку охотится этот зверь только ночью.
		AI_Output(self,other,"DIA_HUN_745_News_01_29");	//Собственно говоря, по этой причине он и получил свое прозвище.
		AI_Output(other,self,"DIA_HUN_745_News_01_30");	//Значит, никто так и не смог его убить?
		AI_Output(self,other,"DIA_HUN_745_News_01_31");	//Многие пытались это сделать, но все эти бедолаги погибли в его пасти. Все до единого!
		AI_Output(self,other,"DIA_HUN_745_News_01_32");	//Так что могу с уверенностью тебе сказать - сильнее противника просто не найти!
		AI_Output(other,self,"DIA_HUN_745_News_01_33");	//А ты сам не пробовал поохотиться на него?
		AI_Output(self,other,"DIA_HUN_745_News_01_34");	//Ты что, - мне еще жить не надоело!
		AI_Output(self,other,"DIA_HUN_745_News_01_35");	//Да и тебе не советую этого делать.
		AI_Output(self,other,"DIA_HUN_745_News_01_36");	//Не стоит дергать смерть за усы, иначе можно нарваться на большие неприятности.
		MIS_INSSHADOWBEAST = LOG_Running;
		Log_CreateTopic(TOPIC_INSSHADOWBEAST,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_INSSHADOWBEAST,LOG_Running);
		B_LogEntry(TOPIC_INSSHADOWBEAST,"По словам Раффы, в расщелине недалеко от фермы Лобарта видели необычного мракориса. Раффа полагает, что это был призрачный мракорис или, по-другому, Охотник Ночи – невероятно сильное создание, одолеть которое никому до сих пор не удалось.");
		Wld_InsertNpc(nighthunter,"FP_ROAM_NW_HUNTBLOODBEAST_01");
	}
	else
	{
		AI_Output(self,other,"DIA_HUN_745_News_01_39");	//Нет. Ничего такого, приятель!
	};
};


instance DIA_HUN_745_RAFFA_INSLUKER(C_Info)
{
	npc = hun_745_raffa;
	nr = 2;
	condition = dia_hun_745_raffa_insluker_condition;
	information = dia_hun_745_raffa_insluker_info;
	permanent = FALSE;
	description = "У меня есть яйцо шныга.";
};


func int dia_hun_745_raffa_insluker_condition()
{
	if((MIS_INSLUKER == LOG_Running) && (Npc_HasItems(other,itat_lukeregg) >= 1))
	{
		return TRUE;
	};
};

func void dia_hun_745_raffa_insluker_info()
{
	AI_Output(other,self,"DIA_HUN_745_InsLuker_01_00");	//У меня есть яйцо шныга.
	AI_Output(self,other,"DIA_HUN_745_InsLuker_01_01");	//Правда?
	B_GiveInvItems(other,self,itat_lukeregg,1);
	Npc_RemoveInvItems(self,itat_lukeregg,1);
	AI_Output(self,other,"DIA_HUN_745_InsLuker_01_03");	//Ух ты! И вправду это оно. Но где ты его нашел?
	AI_Output(other,self,"DIA_HUN_745_InsLuker_01_04");	//Это не так уж и важно.
	AI_Output(other,self,"DIA_HUN_745_InsLuker_01_05");	//Однако ты был прав - шныг, охранявший его, был куда сильнее, чем обычные.
	AI_Output(self,other,"DIA_HUN_745_InsLuker_01_06");	//Ты что, дрался с ним?
	MIS_INSLUKER = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_INSLUKER,LOG_SUCCESS);

	if(Npc_IsDead(egglurker))
	{
		AI_Output(other,self,"DIA_HUN_745_InsLuker_01_07");	//Да, я его убил.
		AI_Output(self,other,"DIA_HUN_745_InsLuker_01_08");	//Ха! Так ты еще и прикончил его - вот это да!
		AI_Output(self,other,"DIA_HUN_745_InsLuker_01_09");	//Не думал, что тебе это будет по силам.
		AI_Output(self,other,"DIA_HUN_745_InsLuker_01_11");	//Возьми эту небольшую награду за свои труды.
		B_GiveInvItems(self,other,ItPo_Perm_Health,1);
		AI_Output(self,other,"DIA_HUN_745_InsLuker_01_12");	//Думаю, ты ее вполне заслужил.
		AI_Output(other,self,"DIA_HUN_745_InsLuker_01_13");	//Спасибо!
		B_GivePlayerXP(200);
		B_LogEntry(TOPIC_INSLUKER,"Раффа поблагодарил меня за то, что я принес ему яйцо шныга. И был очень удивлен, что мне удалось прикончить зверя, охранявшего его.");
	}
	else
	{
		AI_Output(other,self,"DIA_HUN_745_InsLuker_01_14");	//Я пытался. Правда, из этой затеи не вышло ничего хорошего.
		AI_Output(self,other,"DIA_HUN_745_InsLuker_01_15");	//Это и неудивительно! Тебе еще повезло, что ты в живых остался.
		AI_Output(self,other,"DIA_HUN_745_InsLuker_01_16");	//Ну да ладно - в конце концов, не каждый бой можно выиграть.
		AI_Output(self,other,"DIA_HUN_745_InsLuker_01_17");	//Возьми эту небольшую награду за свои труды.
		B_GiveInvItems(self,other,ItPo_Health_03,3);
		AI_Output(self,other,"DIA_HUN_745_InsLuker_01_18");	//Думаю, ты ее вполне заслужил.
		AI_Output(other,self,"DIA_HUN_745_InsLuker_01_19");	//Спасибо!
		B_GivePlayerXP(100);
		B_LogEntry(TOPIC_INSLUKER,"Раффа поблагодарил меня за то, что я принес ему яйцо шныга.");
	};
};


instance DIA_HUN_745_RAFFA_INSSHADOWBEAST(C_Info)
{
	npc = hun_745_raffa;
	nr = 2;
	condition = dia_hun_745_raffa_insshadowbeast_condition;
	information = dia_hun_745_raffa_insshadowbeast_info;
	permanent = FALSE;
	description = "Призрачный мракорис мертв.";
};


func int dia_hun_745_raffa_insshadowbeast_condition()
{
	if((MIS_INSSHADOWBEAST == LOG_Running) && Npc_IsDead(nighthunter) && (Npc_HasItems(other,itat_nighthunterfur) >= 1))
	{
		return TRUE;
	};
};

func void dia_hun_745_raffa_insshadowbeast_info()
{
	B_GivePlayerXP(350);
	AI_Output(other,self,"DIA_HUN_745_InsShadowBeast_01_00");	//Призрачный мракорис мертв.
	AI_Output(self,other,"DIA_HUN_745_InsShadowBeast_01_01");	//(недоверчиво) Что? Да ладно, хватит заливать, - такого просто быть не может!
	AI_Output(other,self,"DIA_HUN_745_InsShadowBeast_01_02");	//Вот его шкура! Что ты теперь скажешь?
	B_GiveInvItems(other,self,itat_nighthunterfur,1);
	Npc_RemoveInvItems(self,itat_nighthunterfur,1);
	AI_Output(self,other,"DIA_HUN_745_InsShadowBeast_01_03");	//Невероятно! Глазам своим не верю!
	AI_Output(self,other,"DIA_HUN_745_InsShadowBeast_01_04");	//Неужели ты действительно победил Охотника Ночи? Но как тебе это удалось?
	AI_Output(other,self,"DIA_HUN_745_InsShadowBeast_01_06");	//Этот твой Охотник Ночи и вправду оказался чертовски сильным противником. Но это его все равно не спасло.
	AI_Output(self,other,"DIA_HUN_745_InsShadowBeast_01_07");	//В таком случае мне остается только одно - признать тебя величайшим охотником в здешних краях!
	AI_Output(self,other,"DIA_HUN_745_InsShadowBeast_01_08");	//(с уважением) Даже сам Фальк не отважился бы на такое, а ты... Ты даже смог убить его!
	AI_Output(self,other,"DIA_HUN_745_InsShadowBeast_01_09");	//Поздравляю, парень! Держи немного золота за шкуру.
	CreateInvItems(self,ItMi_Gold,500);
	B_GiveInvItems(self,other,ItMi_Gold,500);
	MIS_INSSHADOWBEAST = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_INSSHADOWBEAST,LOG_SUCCESS);
	B_LogEntry(TOPIC_INSSHADOWBEAST,"Раффа был потрясен и назвал меня величайшим охотником Хориниса, узнав о том, что я убил Охотника Ночи.");
};


instance DIA_HUN_745_RAFFA_RESPECT(C_Info)
{
	npc = hun_745_raffa;
	nr = 4;
	condition = dia_hun_745_raffa_respect_condition;
	information = dia_hun_745_raffa_respect_info;
	permanent = FALSE;
	description = "Я хочу стать лучшим охотником в лагере.";
};


func int dia_hun_745_raffa_respect_condition()
{
	if((CANHUNTERCHALLANGE == TRUE) && (RAFFA_RESPECT == FALSE) && (MIS_HUNTERCHALLANGE == FALSE))
	{
		return TRUE;
	};
};

func void dia_hun_745_raffa_respect_info()
{
	AI_Output(other,self,"DIA_HUN_745_Respect_01_00");	//Я хочу стать лучшим охотником в лагере.
	AI_Output(other,self,"DIA_HUN_745_Respect_01_01");	//Ты бы мог мне в этом помочь?
	AI_Output(self,other,"DIA_HUN_745_Respect_01_02");	//(улыбается) Чтобы им стать, тебе для начала нужно заслужить уважение охотников и мое в том числе.
	AI_Output(self,other,"DIA_HUN_745_Respect_01_03");	//А потом вызвать Фалька на охотничий поединок, который и покажет - кто из вас лучший.

	if(MIS_INSSHADOWBEAST == LOG_SUCCESS)
	{
		B_GivePlayerXP(100);
		AI_Output(self,other,"DIA_HUN_745_Respect_01_04");	//Правда, зная твои способности, я нисколько не сомневаюсь в том, что ты легко обставишь этого зазнайку.
		AI_Output(self,other,"DIA_HUN_745_Respect_01_05");	//Человек, который смог убить призрачного мракориса, может считаться не просто лучшим, а великим охотником!
		AI_Output(self,other,"DIA_HUN_745_Respect_01_06");	//Так что я за тебя. Можешь так и передать Фальку.
		B_LogEntry(TOPIC_HUNTERSWORK,"Охотник Раффа согласился отдать за меня свой голос в том случае, если я решусь вызвать Фалька на охотничий поединок.");
		RAFFA_RESPECT = TRUE;
		HUNTCHALLENGECOUNT = HUNTCHALLENGECOUNT + 1;
	}
	else
	{
		AI_Output(self,other,"DIA_HUN_745_Respect_01_08");	//Но по моему мнению, тебе пока рано об этом думать.
		AI_Output(other,self,"DIA_HUN_745_Respect_01_09");	//Почему?
		AI_Output(self,other,"DIA_HUN_745_Respect_01_10");	//Потому, что только опыт имеет цену в нашем ремесле, а за твоими плечами его слишком мало.
		AI_Output(self,other,"DIA_HUN_745_Respect_01_11");	//Так что я пока не стану тебе в этом помогать. Извини.
	};
};


instance DIA_HUN_745_RAFFA_RESPECTDONE(C_Info)
{
	npc = hun_745_raffa;
	nr = 4;
	condition = dia_hun_745_raffa_respectdone_condition;
	information = dia_hun_745_raffa_respectdone_info;
	permanent = TRUE;
	description = "Что теперь скажешь?";
};


func int dia_hun_745_raffa_respectdone_condition()
{
	if(Npc_KnowsInfo(other,dia_hun_745_raffa_respect) && (CANHUNTERCHALLANGE == TRUE) && (RAFFA_RESPECT == FALSE) && (MIS_HUNTERCHALLANGE == FALSE))
	{
		return TRUE;
	};
};

func void dia_hun_745_raffa_respectdone_info()
{
	AI_Output(other,self,"DIA_HUN_745_RespectDone_01_00");	//Что теперь скажешь?

	if(MIS_INSSHADOWBEAST == LOG_SUCCESS)
	{
		B_GivePlayerXP(100);
		AI_Output(self,other,"DIA_HUN_745_RespectDone_01_02");	//Теперь другое дело! Человек, который смог убить призрачного мракориса, может считаться не просто лучшим, а великим охотником!
		AI_Output(self,other,"DIA_HUN_745_RespectDone_01_03");	//Так что я за тебя. Можешь так и передать Фальку.
		B_LogEntry(TOPIC_HUNTERSWORK,"Охотник Раффа согласился отдать за меня свой голос в том случае, если я решусь вызвать Фалька на охотничий поединок.");
		RAFFA_RESPECT = TRUE;
		HUNTCHALLENGECOUNT = HUNTCHALLENGECOUNT + 1;
	}
	else
	{
		AI_Output(self,other,"DIA_HUN_745_RespectDone_01_05");	//То же самое, что и в прошлый раз.
	};
};


instance DIA_HUN_745_RAFFA_F(C_Info)
{
	npc = hun_745_raffa;
	nr = 2;
	condition = dia_hun_745_raffa_f_condition;
	information = dia_hun_745_raffa_f_info;
	permanent = FALSE;
	description = "Ты можешь меня чему-нибудь научить?";
};


func int dia_hun_745_raffa_f_condition()
{
	if(HEROISHUNTER == TRUE)
	{
		return TRUE;
	};
};

func void dia_hun_745_raffa_f_info()
{
	AI_Output(other,self,"DIA_HUN_745_F_01_00");	//Ты можешь меня чему-нибудь научить?
	AI_Output(self,other,"DIA_HUN_745_F_01_01");	//Ну, поскольку ты теперь один из нас, то почему бы и нет.
	AI_Output(self,other,"DIA_HUN_745_F_01_02");	//Я могу тебе показать несколько приемов стрельбы из лука.
	Log_CreateTopic(TOPIC_HUNTERTEACHERS,LOG_NOTE);
	B_LogEntry(TOPIC_HUNTERTEACHERS,"Раффа учит стрельбе из лука.");
};


instance DIA_HUN_745_RAFFA_BOW(C_Info)
{
	npc = hun_745_raffa;
	nr = 3;
	condition = dia_hun_745_raffa_bow_condition;
	information = dia_hun_745_raffa_bow_info;
	permanent = TRUE;
	description = "Я хочу научиться стрелять из лука.";
};


func int dia_hun_745_raffa_bow_condition()
{
	if(Npc_KnowsInfo(other,dia_hun_745_raffa_f))
	{
		return TRUE;
	};
};

func void dia_hun_745_raffa_bow_info()
{
	AI_Output(other,self,"DIA_HUN_745_Bow_01_00");	//Я хочу научиться стрелять из лука.
	AI_Output(self,other,"DIA_HUN_745_Bow_01_01");	//Я могу научить тебя, но не задаром.
	AI_Output(self,other,"DIA_HUN_745_Bow_01_02");	//В конце концов, мне тоже нужно есть!
	Info_ClearChoices(dia_hun_745_raffa_bow);
	Info_AddChoice(dia_hun_745_raffa_bow,Dialog_Back,dia_hun_745_raffa_bow_back);
	Info_AddChoice(dia_hun_745_raffa_bow,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),dia_hun_745_raffa_bow_1);
	Info_AddChoice(dia_hun_745_raffa_bow,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),dia_hun_745_raffa_bow_5);
};

func void dia_hun_745_raffa_bow_back()
{
	Info_ClearChoices(dia_hun_745_raffa_bow);
};

func void dia_hun_745_raffa_bow_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,1,90))
	{
		if(RAFFATEACHFT == FALSE)
		{
			AI_Output(self,other,"DIA_HUN_745_Bow_1_01_01");	//Точность стрельбы зависит от твоей ловкости. Чем выше ловкость, тем точнее стрелы летят в цель.
			AI_Output(self,other,"DIA_HUN_745_Bow_1_01_02");	//Ну а твой навык определяет расстояние, с которого ты сможешь поразить мишень.
			AI_Output(self,other,"DIA_HUN_745_Bow_1_01_03");	//Для того чтобы стать хорошим лучником, ты должен развивать и то, и другое.
			RAFFATEACHFT = TRUE;
		};
		if((RAFFATEACHST == FALSE) && (other.HitChance[NPC_TALENT_BOW] >= 60))
		{
			AI_Output(self,other,"DIA_HUN_745_Bow_1_01_04");	//Тебя уже можно назвать хорошим охотником. Пришло время научиться тому, чего ты еще не знаешь.
			AI_Output(self,other,"DIA_HUN_745_Bow_1_01_05");	//Для того чтобы стать хорошим лучником, одной ловкости мало. Важно понять, из чего складывается хороший выстрел.
			AI_Output(self,other,"DIA_HUN_745_Bow_1_01_06");	//Тут многое приходится учитывать: зоркий взгляд и натяжение тетивы, полет стрелы и расстояние до мишени. И главное, всегда быть начеку!
			AI_Output(self,other,"DIA_HUN_745_Bow_1_01_07");	//Ты уже очень хорошо освоил технику. Осталось найти применение новым знаниям и навыкам.
			RAFFATEACHST = TRUE;
		};
		Info_ClearChoices(dia_hun_745_raffa_bow);
		Info_AddChoice(dia_hun_745_raffa_bow,Dialog_Back,dia_hun_745_raffa_bow_back);
		Info_AddChoice(dia_hun_745_raffa_bow,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),dia_hun_745_raffa_bow_1);
		Info_AddChoice(dia_hun_745_raffa_bow,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),dia_hun_745_raffa_bow_5);
	};
};

func void dia_hun_745_raffa_bow_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,5,90))
	{
		if(RAFFATEACHFT == FALSE)
		{
			AI_Output(self,other,"DIA_HUN_745_Bow_5_01_01");	//Точность стрельбы зависит от твоей ловкости. Чем выше ловкость, тем точнее стрелы летят в цель.
			AI_Output(self,other,"DIA_HUN_745_Bow_5_01_02");	//Ну а твой навык определяет расстояние, с которого ты сможешь поразить мишень.
			AI_Output(self,other,"DIA_HUN_745_Bow_5_01_03");	//Для того чтобы стать хорошим лучником, ты должен развивать и то, и другое.
			RAFFATEACHFT = TRUE;
		};
		if((RAFFATEACHST == FALSE) && (other.HitChance[NPC_TALENT_BOW] >= 60))
		{
			AI_Output(self,other,"DIA_HUN_745_Bow_5_01_04");	//Тебя уже можно назвать хорошим охотником. Пришло время научиться тому, чего ты еще не знаешь.
			AI_Output(self,other,"DIA_HUN_745_Bow_5_01_05");	//Для того чтобы стать хорошим лучником, одной ловкости мало. Важно понять, из чего складывается хороший выстрел.
			AI_Output(self,other,"DIA_HUN_745_Bow_5_01_06");	//Тут многое приходится учитывать: зоркий взгляд и натяжение тетивы, полет стрелы и расстояние до мишени. И главное, всегда быть начеку!
			AI_Output(self,other,"DIA_HUN_745_Bow_5_01_07");	//Ты уже очень хорошо освоил технику. Осталось найти применение новым знаниям и навыкам.
			RAFFATEACHST = TRUE;
		};
		Info_ClearChoices(dia_hun_745_raffa_bow);
		Info_AddChoice(dia_hun_745_raffa_bow,Dialog_Back,dia_hun_745_raffa_bow_back);
		Info_AddChoice(dia_hun_745_raffa_bow,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),dia_hun_745_raffa_bow_1);
		Info_AddChoice(dia_hun_745_raffa_bow,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),dia_hun_745_raffa_bow_5);
	};
};


instance DIA_HUN_745_RAFFA_BOWNEED(C_Info)
{
	npc = hun_745_raffa;
	nr = 1;
	condition = dia_hun_745_raffa_bowneed_condition;
	information = dia_hun_745_raffa_bowneed_info;
	permanent = FALSE;
	description = "Ты чем-то расстроен?";
};


func int dia_hun_745_raffa_bowneed_condition()
{
	if((Kapitel >= 1) && (HEROISHUNTER == TRUE))
	{
		return TRUE;
	};
};

func void dia_hun_745_raffa_bowneed_info()
{
	AI_Output(other,self,"DIA_HUN_745_BowNeed_01_00");	//Ты чем-то расстроен?
	AI_Output(self,other,"DIA_HUN_745_BowNeed_01_01");	//Эх, приятель...(печально) Все дело в моем луке.
	AI_Output(self,other,"DIA_HUN_745_BowNeed_01_03");	//Понимаешь, во время последней охоты он дал трещину и теперь стал ни на что не годен.
	AI_Output(other,self,"DIA_HUN_745_BowNeed_01_06");	//А почему ты не купишь себе новый?
	AI_Output(self,other,"DIA_HUN_745_BowNeed_01_07");	//Парень, я бы давно уже сходил в город и прикупил бы себе что-нибудь стоящее. Но без оружия я и шагу не сделаю из этого лагеря!
	AI_Output(self,other,"DIA_HUN_745_BowNeed_01_08");	//Так можно, чего доброго, стать кормом для волков или прочих зверей, что шастают тут в округе.
	AI_Output(self,other,"DIA_HUN_745_BowNeed_01_12");	//(гордо) Лук в моих руках - оружие смертельное! Он не раз спасал мою шкуру, когда я ходил на охоту.
	AI_Output(other,self,"DIA_HUN_745_BowNeed_01_13");	//Может, я смогу принести тебе какой-нибудь новый лук?
	AI_Output(self,other,"DIA_HUN_745_BowNeed_01_16");	//Ты действительно можешь достать мне новый лук? Это было бы здорово!
	AI_Output(self,other,"DIA_HUN_745_BowNeed_01_17");	//Правда, мне не подойдет просто обычный лук.
	AI_Output(other,self,"DIA_HUN_745_BowNeed_01_18");	//А какой-же именно лук тебе нужен?
	AI_Output(self,other,"DIA_HUN_745_BowNeed_01_19");	//(задумчиво) Ну, его редко можно встретить в продаже.
	AI_Output(self,other,"DIA_HUN_745_BowNeed_01_20");	//Лук, что я хочу, сделан из разных пород древесины. Торговцы обычно его называют составным.
	AI_Output(self,other,"DIA_HUN_745_BowNeed_01_21");	//Если сможешь достать его для меня, то я покажу тебе несколько приемов стрельбы, которым тебя больше никто не научит.
	AI_Output(self,other,"DIA_HUN_745_BowNeed_01_25");	//Я, конечно, тебя не тороплю, но, если сможешь, постарайся побыстрее найти мне этот лук.
	MIS_RAFFABOW = LOG_Running;
	Log_CreateTopic(TOPIC_RAFFABOW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RAFFABOW,LOG_Running);
	B_LogEntry(TOPIC_RAFFABOW,"Раффе нужен составной лук. Если я достану для него это оружие, он покажет мне пару приемов стрельбы из лука.");
	AI_StopProcessInfos(self);
};


instance DIA_HUN_745_RAFFA_BOWDONE(C_Info)
{
	npc = hun_745_raffa;
	nr = 1;
	condition = dia_hun_745_raffa_bowdone_condition;
	information = dia_hun_745_raffa_bowdone_info;
	permanent = FALSE;
	description = "Я достал тебе новый лук.";
};


func int dia_hun_745_raffa_bowdone_condition()
{
	if((HEROISHUNTER == TRUE) && (MIS_RAFFABOW == LOG_Running) && (Npc_HasItems(other,ItRw_Bow_M_01) >= 1))
	{
		return TRUE;
	};
};

func void dia_hun_745_raffa_bowdone_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_HUN_745_BowDone_01_00");	//Я достал тебе новый лук.
	AI_Output(self,other,"DIA_HUN_745_BowDone_01_01");	//Правда? Покажи.
	AI_Output(other,self,"DIA_HUN_745_BowDone_01_02");	//Вот, держи.
	B_GiveInvItems(other,self,ItRw_Bow_M_01,1);
	AI_Output(self,other,"DIA_HUN_745_BowDone_01_03");	//Да, это тот самый! Теперь я, наконец-то, смогу отправиться на охоту.
	EquipItem(self,ItRw_Bow_M_01);
	AI_Output(other,self,"DIA_HUN_745_BowDone_01_05");	//А как насчет нескольких приемов стрельбы, которым ты обещал меня научить?
	AI_Output(self,other,"DIA_HUN_745_BowDone_01_06");	//Конечно! Слушай внимательно.
	AI_Output(self,other,"DIA_HUN_745_BowDone_01_07");	//В следующий раз, когда будешь целиться, постарайся предугадать траекторию полета стрелы относительно твоей цели.
	AI_Output(self,other,"DIA_HUN_745_BowDone_01_08");	//Если сделаешь все правильно, ты будешь намного реже промахиваться. Запомнил?
	AI_Output(self,other,"DIA_HUN_745_BowDone_01_09");	//(смеется) А теперь иди тренируйся.
	AI_Output(self,other,"DIA_HUN_745_BowDone_01_10");	//Лучше всего закреплять полученные тобой знания на практике.
	MIS_RAFFABOW = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_RAFFABOW,LOG_SUCCESS);
	B_LogEntry(TOPIC_RAFFABOW,"Раффа получил свой лук, не забыв поделиться со мной советом относительно стрельбы.");
	b_teachfighttalentpercentfree(self,other,NPC_TALENT_BOW,5,100);
};


instance DIA_HUN_745_RAFFA_PICKPOCKET(C_Info)
{
	npc = hun_745_raffa;
	nr = 900;
	condition = dia_hun_745_raffa_pickpocket_condition;
	information = dia_hun_745_raffa_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_hun_745_raffa_pickpocket_condition()
{
	return C_Beklauen(100,350);
};

func void dia_hun_745_raffa_pickpocket_info()
{
	Info_ClearChoices(dia_hun_745_raffa_pickpocket);
	Info_AddChoice(dia_hun_745_raffa_pickpocket,Dialog_Back,dia_hun_745_raffa_pickpocket_back);
	Info_AddChoice(dia_hun_745_raffa_pickpocket,DIALOG_PICKPOCKET,dia_hun_745_raffa_pickpocket_doit);
};

func void dia_hun_745_raffa_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_hun_745_raffa_pickpocket);
};

func void dia_hun_745_raffa_pickpocket_back()
{
	Info_ClearChoices(dia_hun_745_raffa_pickpocket);
};


instance DIA_HUN_745_RAFFA_TRADEBOW(C_Info)
{
	npc = hun_745_raffa;
	nr = 5;
	condition = dia_hun_745_raffa_tradebow_condition;
	information = dia_hun_745_raffa_tradebow_info;
	permanent = FALSE;
	description = "Где мне достать хороший лук?";
};


func int dia_hun_745_raffa_tradebow_condition()
{
	if((HEROISHUNTER == TRUE) && (MIS_RAFFABOW == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_hun_745_raffa_tradebow_info()
{
	AI_Output(other,self,"DIA_HUN_745_TradeBow_01_00");	//Где мне достать хороший лук?
	AI_Output(self,other,"DIA_HUN_745_TradeBow_01_01");	//Ты пришел туда, куда нужно. Я подберу для тебя отличный лук!
	Log_CreateTopic(TOPIC_HUNTERTRADES,LOG_NOTE);
	B_LogEntry(TOPIC_HUNTERTRADES,"Раффа торгует луками и стрелами.");
	RAFFACANTRADE = TRUE;
};


instance DIA_HUN_745_RAFFA_TRADE(C_Info)
{
	npc = hun_745_raffa;
	nr = 775;
	condition = dia_hun_745_raffa_trade_condition;
	information = dia_hun_745_raffa_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Покажи мне, что у тебя есть.";
};


func int dia_hun_745_raffa_trade_condition()
{
	if((RAFFACANTRADE == TRUE) && Wld_IsTime(8,0,23,0))
	{
		return TRUE;
	};
};

func void dia_hun_745_raffa_trade_info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_HUN_745_Trade_01_01");	//Покажи мне, что у тебя есть.

	if((HunBelt_01 == FALSE) && (HEROISHUNTER == TRUE))
	{
		CreateInvItems(self,ItBe_Addon_Custom_01,1);
		HunBelt_01 = TRUE;
	};
	if((HunBelt_02 == FALSE) && (HEROISHUNTER == TRUE) && (Know_HuntArmor_01 == TRUE) && (MIS_LETTERFALK == LOG_SUCCESS))
	{
		CreateInvItems(self,ItBe_Addon_Custom_02,1);
		HunBelt_02 = TRUE;
	};
	if((HunBelt_03 == FALSE) && (HEROISHUNTER == TRUE) && (Know_HuntArmor_02 == TRUE) && (MIS_INSSHADOWBEAST == LOG_SUCCESS))
	{
		CreateInvItems(self,ItBe_Addon_Custom_03,1);
		HunBelt_03 = TRUE;
	};
	if((HunBelt_04 == FALSE) && (HEROISHUNTER == TRUE) && (Know_HuntArmor_03 == TRUE) && (MIS_HUNTERCHALLANGE == LOG_SUCCESS))
	{
		CreateInvItems(self,ItBe_Addon_Custom_04,1);
		HunBelt_04 = TRUE;
	};
	if((HunBelt_05 == FALSE) && (HEROISHUNTER == TRUE) && (Know_HuntArmor_04 == TRUE) && (Kapitel >= 4))
	{
		CreateInvItems(self,ItBe_Addon_BT_01,1);
		HunBelt_05 = TRUE;
	};

	B_GiveTradeInv(self);
	RAFFATELLSPECIAL = TRUE;
};


instance DIA_HUN_745_RAFFA_RAFFATELLSPECIAL(C_Info)
{
	npc = hun_745_raffa;
	nr = 5;
	condition = dia_hun_745_raffa_raffatellspecial_condition;
	information = dia_hun_745_raffa_raffatellspecial_info;
	permanent = FALSE;
	description = "У тебя очень хороший выбор луков!";
};


func int dia_hun_745_raffa_raffatellspecial_condition()
{
	if(RAFFATELLSPECIAL == TRUE)
	{
		return TRUE;
	};
};

func void dia_hun_745_raffa_raffatellspecial_info()
{
	AI_Output(other,self,"DIA_HUN_745_TellSpecial_01_00");	//У тебя очень хороший выбор луков!
	AI_Output(self,other,"DIA_HUN_745_TellSpecial_01_01");	//Спасибо, конечно. Но такие ты можешь найти и у других торговцев.
	AI_Output(self,other,"DIA_HUN_745_TellSpecial_01_02");	//Было бы куда интереснее иметь в своем распоряжении что-нибудь совершенно иное, нежели просто деревянные луки.
	AI_Output(other,self,"DIA_HUN_745_TellSpecial_01_03");	//Что ты имеешь в виду?
	AI_Output(self,other,"DIA_HUN_745_TellSpecial_01_04");	//Ну, например, какой-нибудь особенный лук или арбалет, который не похож на другие.
	AI_Output(self,other,"DIA_HUN_745_TellSpecial_01_05");	//Так что, если вдруг где-нибудь встретишь подобное оружие, - я с удовольствием куплю его у тебя.
	AI_Output(self,other,"DIA_HUN_745_TellSpecial_01_06");	//И по хорошей цене!
	MIS_RAFFATELLSPECIAL = LOG_Running;
	Log_CreateTopic(TOPIC_RAFFATELLSPECIAL,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RAFFATELLSPECIAL,LOG_Running);
	B_LogEntry(TOPIC_RAFFATELLSPECIAL,"Раффа интересуется редкими видами стрелкового оружия. Он обещал хорошо заплатить, если я принесу ему нечто подобное.");
};


instance DIA_HUN_745_RAFFA_RAFFATELLSPECIALDONE(C_Info)
{
	npc = hun_745_raffa;
	nr = 5;
	condition = dia_hun_745_raffa_raffatellspecialdone_condition;
	information = dia_hun_745_raffa_raffatellspecialdone_info;
	permanent = TRUE;
	description = "У меня есть для тебя особенное оружие.";
};


func int dia_hun_745_raffa_raffatellspecialdone_condition()
{
	if((MIS_RAFFATELLSPECIAL == LOG_Running) && (Npc_HasItems(other,itrw_addon_magiccrossbow_shv) >= 1))
	{
		return TRUE;
	};
};

func void dia_hun_745_raffa_raffatellspecialdone_info()
{
	AI_Output(other,self,"DIA_HUN_745_TellSpecialDone_01_00");	//У меня есть для тебя особенное оружие.
	AI_Output(self,other,"DIA_HUN_745_TellSpecialDone_01_01");	//Правда? Покажи!
	Info_ClearChoices(dia_hun_745_raffa_raffatellspecialdone);
	Info_AddChoice(dia_hun_745_raffa_raffatellspecialdone,Dialog_Back,dia_hun_745_raffa_raffatellspecialdone_back);
	if(Npc_HasItems(other,itrw_addon_magiccrossbow_shv) >= 1)
	{
		Info_AddChoice(dia_hun_745_raffa_raffatellspecialdone,"Отдать 'Вершителя'.",dia_hun_745_raffa_raffatellspecialdone_magiccrossbowextro);
	};
};

func void dia_hun_745_raffa_raffatellspecialdone_back()
{
	Info_ClearChoices(dia_hun_745_raffa_raffatellspecialdone);
};

func void dia_hun_745_raffa_raffatellspecialdone_magiccrossbowextro()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_HUN_745_TellSpecialDone_MagicCrossBowExtro_01_01");	//Даю руку на отсечение - подобной штуки ты еще никогда не видел.
	B_GiveInvItems(other,self,itrw_addon_magiccrossbow_shv,1);
	AI_Output(self,other,"DIA_HUN_745_TellSpecialDone_MagicCrossBowExtro_01_02");	//(зачарованно) Невероятно. Вот это оружие!
	AI_Output(self,other,"DIA_HUN_745_TellSpecialDone_MagicCrossBowExtro_01_03");	//Судя по виду, оно очень древнее. Смотри, тут даже есть какие-то надписи! Правда, на непонятном мне языке.
	AI_Output(self,other,"DIA_HUN_745_TellSpecialDone_MagicCrossBowExtro_01_07");	//Как насчет двух тысяч золотых монет?
	AI_Output(self,other,"DIA_HUN_745_TellSpecialDone_MagicCrossBowExtro_01_09");	//Естественно, оно стоит намного дороже. Но большего я все равно предложить не смогу.
	AI_Output(self,other,"DIA_HUN_745_TellSpecialDone_MagicCrossBowExtro_01_10");	//Это все золото, что у меня есть!
	AI_Output(other,self,"DIA_HUN_745_TellSpecialDone_MagicCrossBowExtro_01_11");	//Думаю, да.
	AI_Output(self,other,"DIA_HUN_745_TellSpecialDone_MagicCrossBowExtro_01_12");	//Вот, держи свои деньги.
	B_GiveInvItems(self,other,ItMi_Gold,2000);
	Npc_RemoveInvItems(self,itrw_addon_magiccrossbow_shv,1);
	B_LogEntry(TOPIC_RAFFATELLSPECIAL,"Я отдал Раффе древнее оружие Вершителя, найденное в Городе Мертвых.");
	MIS_RAFFATELLSPECIAL = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_RAFFATELLSPECIAL,LOG_SUCCESS);
	Info_ClearChoices(dia_hun_745_raffa_raffatellspecialdone);
};

var int RaffaCanTeachTrueShot;

instance DIA_HUN_745_RAFFA_TrueShot(C_Info)
{
	npc = hun_745_raffa;
	nr = 5;
	condition = dia_hun_745_raffa_TrueShot_condition;
	information = dia_hun_745_raffa_TrueShot_info;
	permanent = FALSE;
	description = "Мне нужен твой совет.";
};

func int dia_hun_745_raffa_TrueShot_condition()
{
	if((HEROISHUNTER == TRUE) && (MIS_RAFFABOW == LOG_SUCCESS) && (RaffaCanTeachTrueShot == FALSE) && ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (hero.guild == GIL_TPL)))
	{
		return TRUE;
	};
};

func void dia_hun_745_raffa_TrueShot_info()
{
	AI_Output(other,self,"DIA_HUN_745_raffa_TrueShot_01_00");	//Мне нужен твой совет.
	AI_Output(self,other,"DIA_HUN_745_raffa_TrueShot_01_01");	//Какой именно?
	AI_Output(other,self,"DIA_HUN_745_raffa_TrueShot_01_02");	//Понимаешь, иногда, стреляя из лука, я не могу причинить некоторым существам ни малейшего вреда.
	AI_Output(self,other,"DIA_HUN_745_raffa_TrueShot_01_03");	//Ах, вот ты о чем. Можешь не продолжать. Я уже понял, к чему ты клонишь.
	AI_Output(self,other,"DIA_HUN_745_raffa_TrueShot_01_04");	//Безусловно, это большая проблема для того, кто привык пользоваться исключительно луком.
	AI_Output(self,other,"DIA_HUN_745_raffa_TrueShot_01_05");	//Однако существует несколько приемов стрельбы, при которых твои выстрелы начнут пробивать любые доспехи и даже самую прочную шкуру.
	AI_Output(other,self,"DIA_HUN_745_raffa_TrueShot_01_06");	//А ты можешь меня этому научить?

 	if((hero.attribute[ATR_DEXTERITY] >= 150) && (hero.HitChance[NPC_TALENT_BOW] >= 50))
	{
		AI_Output(self,other,"DIA_HUN_745_raffa_TrueShot_01_07");	//Конечно. Но для этого тебе необходим некоторый опыт в обращении со стрелковым оружием.
		AI_Output(self,other,"DIA_HUN_745_raffa_TrueShot_01_08");	//Ну и от золота я никогда не отказывался.
		AI_Output(other,self,"DIA_HUN_745_raffa_TrueShot_01_09");	//Понимаю.
		RaffaCanTeachTrueShot = TRUE;
		B_LogEntry(TOPIC_HUNTERTEACHERS,"Раффа может научить меня особенным приемам стрельбы из лука.");
	}
	else
	{
		AI_Output(self,other,"DIA_HUN_745_raffa_TrueShot_01_10");	//А зачем тебе это?
		AI_Output(self,other,"DIA_HUN_745_raffa_TrueShot_01_11");	//Ты больше похож на того, кто сражается мечом, а не луком.
		AI_Output(other,self,"DIA_HUN_745_raffa_TrueShot_01_12");	//И что с того?
		AI_Output(self,other,"DIA_HUN_745_raffa_TrueShot_01_13");	//Знаешь, я просто не хочу терять свое время.
		AI_Output(self,other,"DIA_HUN_745_raffa_TrueShot_01_14");	//Сначала научись более-менее сносно стрелять из лука, ловкости поднаберись. Тогда и поговорим.
	};
};

instance DIA_HUN_745_RAFFA_TrueShot_Again(C_Info)
{
	npc = hun_745_raffa;
	nr = 5;
	condition = dia_hun_745_raffa_TrueShot_Again_condition;
	information = dia_hun_745_raffa_TrueShot_Again_info;
	permanent = TRUE;
	description = "Теперь я достаточно хорошо стреляю из лука?";
};

func int dia_hun_745_raffa_TrueShot_Again_condition()
{
	if(Npc_KnowsInfo(other,DIA_HUN_745_raffa_TrueShot) && (RaffaCanTeachTrueShot == FALSE) && ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (hero.guild == GIL_TPL)))
	{
		return TRUE;
	};
};

func void dia_hun_745_raffa_TrueShot_Again_info()
{
	AI_Output(other,self,"DIA_HUN_745_raffa_TrueShot_Again_01_00");	//Ну как? Теперь я достаточно хорошо стреляю из лука?
	AI_Output(self,other,"DIA_HUN_745_raffa_TrueShot_Again_01_01");	//Хммм...(оценивающе)

	if((hero.attribute[ATR_DEXTERITY] >= 125) && (hero.HitChance[NPC_TALENT_BOW] >= 50))
	{
		AI_Output(self,other,"DIA_HUN_745_raffa_TrueShot_Again_01_02");	//Вот теперь я вижу, что передо мной человек ловкий и знающий толк в обращении с луком.
		AI_Output(other,self,"DIA_HUN_745_raffa_TrueShot_Again_01_03");	//Значит, теперь ты сможешь научить меня своим приемам стрельбы?
		AI_Output(self,other,"DIA_HUN_745_raffa_TrueShot_Again_01_04");	//Конечно! Я покажу их. Но для этого тебе понадобится иметь больше опыта в стрельбе.
		AI_Output(self,other,"DIA_HUN_745_raffa_TrueShot_Again_01_05");	//Ну и немного золота за обучение.
		RaffaCanTeachTrueShot = TRUE;
		B_LogEntry(TOPIC_HUNTERTEACHERS,"Раффа может научить меня особенным приемам стрельбы из лука.");
	}
	else
	{
	 	if(hero.HitChance[NPC_TALENT_BOW] < 50)
		{
			AI_Output(self,other,"DIA_HUN_745_raffa_TrueShot_Again_01_07");	//Нет, ты по-прежнему новичок в этом деле.
			AI_Output(self,other,"DIA_HUN_745_raffa_TrueShot_Again_01_08");	//Приходи, когда станешь лучше.
			Print("Необходим уровень владение луком не менее 50...");
		}
		else if(hero.attribute[ATR_DEXTERITY] < 125)
		{
			AI_Output(self,other,"DIA_HUN_745_raffa_TrueShot_Again_01_09");	//С луком ты, конечно, обращаться умеешь, но вот ловкости тебе пока не хватает.
			AI_Output(self,other,"DIA_HUN_745_raffa_TrueShot_Again_01_10");	//Приходи, когда станешь ловчее.
			Print("Необходимая ловкость не менее 125...");
		};
	};
};

instance DIA_HUN_745_RAFFA_TrueShotTeach(C_Info)
{
	npc = hun_745_raffa;
	nr = 5;
	condition = dia_hun_745_raffa_TrueShotTeach_condition;
	information = dia_hun_745_raffa_TrueShotTeach_info;
	permanent = TRUE;
	description = "Обучи меня своим приемам стрельбы. (Очки обучения: 25, Цена: 10000 монет)";
};

func int dia_hun_745_raffa_TrueShotTeach_condition()
{
	if((RaffaCanTeachTrueShot == TRUE) && (TrueShot == FALSE))
	{
		return TRUE;
	};
};

func void dia_hun_745_raffa_TrueShotTeach_info()
{
	AI_Output(other,self,"DIA_HUN_745_raffa_TrueShotTeach_01_00");	//Обучи меня своим приемам стрельбы.

	if((hero.lp >= 25) && (Npc_HasItems(other,ItMi_Gold) >= 10000))
	{
		AI_Output(self,other,"DIA_HUN_745_raffa_TrueShotTeach_01_01");	//Хорошо, слушай внимательно.
		AI_Output(self,other,"DIA_HUN_745_raffa_TrueShotTeach_01_02");	//В стрельбе важно не только попасть в цель. Главное - это куда ты целишься!
		AI_Output(self,other,"DIA_HUN_745_raffa_TrueShotTeach_01_03");	//У любой твари есть слабое и плохозащищеное место. Вот туда и стреляй.
		AI_Output(self,other,"DIA_HUN_745_raffa_TrueShotTeach_01_04");	//Поначалу тебе будет трудно отыскать его, но все придет с опытом.
		AI_Output(self,other,"DIA_HUN_745_raffa_TrueShotTeach_01_05");	//Просто продолжай тренироваться в стрельбе и не забывай повышать свою ловкость. 
		AI_Output(self,other,"DIA_HUN_745_raffa_TrueShotTeach_01_06");	//И тогда любая мишень станет для тебя простой!
		AI_Output(self,other,"DIA_HUN_745_raffa_TrueShotTeach_01_07");	//Да, и еще надо помнить, что убойная сила выстрела зависит от расстояния до цели.
		AI_Output(self,other,"DIA_HUN_745_raffa_TrueShotTeach_01_08");	//Если ты выпустишь стрелу, находясь слишком далеко от цели, - она не нанесет достаточного урона.
		AI_Output(self,other,"DIA_HUN_745_raffa_TrueShotTeach_01_09");	//Поэтому, чем ближе ты к своей цели, тем больше урон ты будешь наносить ей. Это понятно?
		AI_Output(other,self,"DIA_HUN_745_raffa_TrueShotTeach_01_10");	//Да, все предельно ясно.
		hero.lp = hero.lp - 25;
		RankPoints = RankPoints + 25;
		Npc_RemoveInvItems(hero,ItMi_Gold,10000);
		TrueShot = TRUE;
		AI_Print("Изучено: пробивающий выстрел");
		Snd_Play("LevelUP");
	}
	else
	{
		if(hero.lp < 25)
		{
			AI_Print(PRINT_NotEnoughLearnPoints);
			AI_Output(self,other,"DIA_HUN_745_raffa_TrueShotTeach_01_08");	//Извини, приятель, но для этого у тебя пока не хватает опыта.
		}
		else
		{
			AI_Print(Print_NotEnoughGold);
			AI_Output(self,other,"DIA_HUN_745_raffa_TrueShotTeach_01_09");	//Извини, приятель, но задаром я тебя учить не буду.
		};
	};
};