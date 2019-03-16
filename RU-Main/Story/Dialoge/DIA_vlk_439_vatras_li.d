
var int dia_addon_vatras_pissoffforevver_li_onetime;
var int trd_vatli;

instance DIA_VATRAS_LI_EXIT(C_Info)
{
	npc = vlk_439_vatras_li;
	nr = 999;
	condition = dia_vatras_li_exit_condition;
	information = dia_vatras_li_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int dia_vatras_li_exit_condition()
{
	return TRUE;
};

func void dia_vatras_li_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_VATRAS_LI_HEAL(C_Info)
{
	npc = vlk_439_vatras_li;
	nr = 99;
	condition = dia_vatras_li_heal_condition;
	information = dia_vatras_li_heal_info;
	permanent = TRUE;
	description = "Вылечи меня. ";
};

func int dia_vatras_li_heal_condition()
{
	return TRUE;
};

func void dia_vatras_li_heal_info()
{
	AI_Output(other,self,"DIA_Vatras_DI_HEAL_15_00");	//Вылечи меня.

	if(hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX])
	{
		AI_Output(self,other,"DIA_Vatras_DI_HEAL_05_01");	//Аданос, благослови его! Он будет тем, кто восстановит равновесие мира.
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
		AI_Print(PRINT_FullyHealed);
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_DI_HEAL_05_02");	//Твое тело не повреждено!
	};
};


instance DIA_VATRAS_LI_TRADE(C_Info)
{
	npc = vlk_439_vatras_li;
	nr = 12;
	condition = dia_vatras_li_trade_condition;
	information = dia_vatras_li_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Ты можешь мне что-нибудь продать?";
};


func int dia_vatras_li_trade_condition()
{
	return TRUE;
};

func void dia_vatras_li_trade_info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Vatras_DI_TRADE_15_00");	//Ты можешь продать мне что-нибудь продать?
	AI_Output(self,other,"DIA_Vatras_DI_TRADE_05_01");	//В чем ты нуждаешься?

	if(TRD_VATLI != TRUE)
	{
		CreateInvItems(self,ItPo_HealObsession_MIS,2);
		CreateInvItems(self,ItPl_Temp_Herb,4);
		CreateInvItems(self,ItSc_LightHeal,2);
		CreateInvItems(self,ItSc_Zap,2);
		CreateInvItems(self,ItSc_Icebolt,2);
		CreateInvItems(self,itsc_sumicegol,2);
		CreateInvItems(self,ItSc_Icelance,5);
		CreateInvItems(self,ItSc_LightningFlash,1);
		CreateInvItems(self,ItSc_TrfScavenger,1);
		CreateInvItems(self,ItSc_IceWave,2);
		CreateInvItems(self,ItPo_Health_03,10);
		CreateInvItems(self,ItPo_Mana_02,12);
		CreateInvItems(self,ItPo_Mana_03,10);
		TRD_VATLI = TRUE;
	};

	B_GiveTradeInv(self);
};

instance DIA_VATRAS_LI_VATRASSUCKED(C_Info)
{
	npc = vlk_439_vatras_li;
	nr = 1;
	condition = dia_vatras_li_vatrassucked_condition;
	information = dia_vatras_li_vatrassucked_info;
	important = TRUE;
	permanent = TRUE;
};

func int dia_vatras_li_vatrassucked_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (DIA_Vatras_DI_PEDROTOT_VatrasSucked == TRUE) && (VATRASFORGIVENME == FALSE))
	{
		return TRUE;
	};
};

func void dia_vatras_li_vatrassucked_info()
{
	AI_Output(self,other,"DIA_Vatras_DI_VatrasSucked_05_00");	//Убирайся с глаз моих, убийца! Ты не можешь больше рассчитывать на мою помощь!
	AI_Output(other,self,"DIA_Vatras_DI_VatrasSucked_05_10");	//Неужели после всего, что я сделал, ты до сих пор отказываешься выслушать меня?
	AI_Output(self,other,"DIA_Vatras_DI_VatrasSucked_05_11");	//Да, твои заслуги велики! Но они не оправдывают всех тех вещей, которые ты натворил ранее.
	AI_Output(other,self,"DIA_Vatras_DI_VatrasSucked_05_12");	//Но все мы, люди, иногда ошибаемся в своих поступках.
	AI_Output(other,self,"DIA_Vatras_DI_VatrasSucked_05_13");	//Признаю, что был не прав, творя подобные злодеяния. Прости меня, отче! Смени уже свой гнев на милость.
	AI_Output(self,other,"DIA_Vatras_DI_VatrasSucked_05_14");	//Хммм...(сомнительно) Это не так легко сделать, как тебе кажется, сын мой.
	AI_Output(self,other,"DIA_Vatras_DI_VatrasSucked_05_15");	//Конечно я могу тебя простить, но вот простит ли тебя Аданос?
	AI_Output(other,self,"DIA_Vatras_DI_VatrasSucked_05_16");	//Я постараюсь выпросить прощение и у него.
	AI_Output(self,other,"DIA_Vatras_DI_VatrasSucked_05_17");	//Что же...(серьезно) Надеюсь, что твои слова также же серьезны, как и твои намерения!
	AI_Output(self,other,"DIA_Vatras_DI_VatrasSucked_05_18");	//Хорошо, считай что ты прощен! Пусть сами боги решают, что с тобой делать за твои грехи.
	VATRASFORGIVENME = TRUE;
};

instance DIA_VATRAS_LI_TALENTE(C_Info)
{
	npc = vlk_439_vatras_li;
	condition = dia_vatras_li_talente_condition;
	information = dia_vatras_li_talente_info;
	permanent = TRUE;
	description = "Обучи меня своим способностям.";
};

func int dia_vatras_li_talente_condition()
{
	return TRUE;
};

func void dia_vatras_li_talente_info()
{
	AI_Output(other,self,"DIA_Vatras_DI_Talente_15_00");	//Обучи меня своим способностям.
	AI_Output(self,other,"DIA_Vatras_DI_Talente_05_01");	//Я сделаю все, что в моих силах.
	Info_ClearChoices(dia_vatras_li_talente);
	Info_AddChoice(dia_vatras_li_talente,Dialog_Back,dia_vatras_li_talente_back);
	if((hero.guild == GIL_KDW) || (hero.guild == GIL_KDF) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR))
	{
		Info_AddChoice(dia_vatras_li_talente,"Изучать круги магии",dia_vatras_li_talente_circles);
	};

	Info_AddChoice(dia_vatras_li_talente,"Изучать алхимию",dia_vatras_li_talente_alchimie);
};

func void dia_vatras_li_talente_circles()
{
	Info_ClearChoices(dia_vatras_li_talente);
	Info_AddChoice(dia_vatras_li_talente,Dialog_Back,dia_vatras_li_talente_back);
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 3)
	{
		Info_AddChoice(dia_vatras_li_talente,B_BuildLearnString("4 Круг магии",B_GetLearnCostTalent(other,NPC_TALENT_MAGE,4)),dia_vatras_li_talente_circle_4);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 4)
	{
		Info_AddChoice(dia_vatras_li_talente,B_BuildLearnString("5 Круг магии",B_GetLearnCostTalent(other,NPC_TALENT_MAGE,5)),dia_vatras_li_talente_circle_5);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 5)
	{
		Info_AddChoice(dia_vatras_li_talente,B_BuildLearnString("6 Круг магии",B_GetLearnCostTalent(other,NPC_TALENT_MAGE,6)),dia_vatras_li_talente_circle_6);
	};
};

func void dia_vatras_li_talente_alchimie()
{
	Info_ClearChoices(dia_vatras_li_talente);
	Info_AddChoice(dia_vatras_li_talente,Dialog_Back,dia_vatras_li_talente_back);
	if(PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_AddChoice(dia_vatras_li_talente,b_buildlearnstringforalchemy("Лечебная эссенция ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_01)),dia_vatras_li_talente_potion_health_01);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE))
	{
		Info_AddChoice(dia_vatras_li_talente,b_buildlearnstringforalchemy("Лечебный экстракт ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_02)),dia_vatras_li_talente_potion_health_02);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE))
	{
		Info_AddChoice(dia_vatras_li_talente,b_buildlearnstringforalchemy("Лечебный эликсир",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_03)),dia_vatras_li_talente_potion_health_03);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	{
		Info_AddChoice(dia_vatras_li_talente,b_buildlearnstringforalchemy("Эссенция маны ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_01)),dia_vatras_li_talente_potion_mana_01);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE))
	{
		Info_AddChoice(dia_vatras_li_talente,b_buildlearnstringforalchemy("Экстракт маны ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_02)),dia_vatras_li_talente_potion_mana_02);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE))
	{
		Info_AddChoice(dia_vatras_li_talente,b_buildlearnstringforalchemy("Эликсир маны ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_03)),dia_vatras_li_talente_potion_mana_03);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Speed] == FALSE)
	{
		Info_AddChoice(dia_vatras_li_talente,b_buildlearnstringforalchemy("Напиток ускорения ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Speed)),dia_vatras_li_talente_potion_speed);
	}
	else if(PLAYER_TALENT_ALCHEMY[15] == FALSE)
	{
		Info_AddChoice(dia_vatras_li_talente,b_buildlearnstringforalchemy("Двойной напиток ускорения ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_SPEED_02)),dia_vatras_di_talente_potion_speed_02);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] == FALSE)
	{
		Info_AddChoice(dia_vatras_li_talente,b_buildlearnstringforalchemy("Эликсир силы ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_STR)),dia_vatras_li_talente_potion_perm_str);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] == FALSE)
	{
		Info_AddChoice(dia_vatras_li_talente,b_buildlearnstringforalchemy("Эликсир ловкости",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_DEX)),dia_vatras_li_talente_potion_perm_dex);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE))
	{
		Info_AddChoice(dia_vatras_li_talente,b_buildlearnstringforalchemy("Эликсир духа",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_Mana)),dia_vatras_li_talente_potion_perm_mana);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE))
	{
		Info_AddChoice(dia_vatras_li_talente,b_buildlearnstringforalchemy("Эликсир жизни ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_Health)),dia_vatras_li_talente_potion_perm_health);
	};
};

func void dia_vatras_li_talente_circle_4()
{
	Info_ClearChoices(dia_vatras_li_talente);
	B_TeachMagicCircle(self,other,4);
};

func void dia_vatras_li_talente_circle_5()
{
	AI_Output(self,other,"DIA_Vatras_DI_Talente_Circle_5_05_00");	//Теперь ты маг пятого круга! Обдуманно используй доступные тебе заклинания.
	Info_ClearChoices(dia_vatras_li_talente);
	B_TeachMagicCircle(self,other,5);
};

func void dia_vatras_li_talente_circle_6()
{
	AI_Output(self,other,"DIA_Vatras_DI_Talente_Circle_6_05_00");	//Теперь ты имеешь доступ к высшему знанию магии.
	AI_Output(self,other,"DIA_Vatras_DI_Talente_Circle_6_05_01");	//Руководствуйся разумом и знай свои человеческие слабости. Они могут разрушить тебя.
	Info_ClearChoices(dia_vatras_li_talente);
	B_TeachMagicCircle(self,other,6);
};

func void dia_vatras_li_talente_potion_health_01()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_01);
};

func void dia_vatras_li_talente_potion_health_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_02);
};

func void dia_vatras_li_talente_potion_health_03()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_03);
};

func void dia_vatras_li_talente_potion_mana_01()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_01);
};

func void dia_vatras_li_talente_potion_mana_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_02);
};

func void dia_vatras_li_talente_potion_mana_03()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_03);
};

func void dia_vatras_li_talente_potion_speed()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Speed);
};

func void dia_vatras_li_talente_potion_speed_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_SPEED_02);
};

func void dia_vatras_li_talente_potion_perm_str()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_STR);
};

func void dia_vatras_li_talente_potion_perm_dex()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_DEX);
};

func void dia_vatras_li_talente_potion_perm_mana()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_Mana);
};

func void dia_vatras_li_talente_potion_perm_health()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_Health);
};

func void dia_vatras_li_talente_back()
{
	Info_ClearChoices(dia_vatras_li_talente);
};

instance DIA_ADDON_VATRAS_LI_MISSMYGOLD(C_Info)
{
	npc = vlk_439_vatras_li;
	nr = 2;
	condition = dia_addon_vatras_li_missmygold_condition;
	information = dia_addon_vatras_li_missmygold_info;
	permanent = FALSE;
	description = "А служитель Аданоса случайно не знает, куда подевалось мое золото?";
};


func int dia_addon_vatras_li_missmygold_condition()
{
	if((BEGINGOLDSEEK == TRUE) && (MIS_MISSMYGOLD == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_li_missmygold_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_LI_MissMyGold_01_01");	//А служитель Аданоса случайно не знает, куда подевалось мое золото?
	AI_Output(self,other,"DIA_Addon_Vatras_LI_MissMyGold_01_02");	//Мне это неведомо, сын мой...(серьезно) К тому же подобного рода вещи меня мало интересуют.
	B_LogEntry(TOPIC_MISSMYGOLD,"Естественно, Ватрас ничего не знает о пропаже моего золота.");
};


instance DIA_ADDON_VATRAS_LI_FINDMAGICORECAVE(C_Info)
{
	npc = vlk_439_vatras_li;
	nr = 2;
	condition = dia_addon_vatras_li_findmagicorecave_condition;
	information = dia_addon_vatras_li_findmagicorecave_info;
	permanent = FALSE;
	description = "Я нашел пещеру с залежами магической руды.";
};


func int dia_addon_vatras_li_findmagicorecave_condition()
{
	if((MIS_FINDMAGICORECAVE == LOG_Running) && (LIBEFORETESTOK == FALSE) && (LITESTOK == FALSE) && (GOTOORECAPITAN == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_li_findmagicorecave_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_LI_FindMagicOreCave_01_01");	//Я нашел пещеру с залежами магической руды.
	AI_Output(self,other,"DIA_Addon_Vatras_LI_FindMagicOreCave_01_02");	//Правда?!...(удивленно) Тогда тебе стоит поговорить об этом с нашим капитаном.
	AI_Output(self,other,"DIA_Addon_Vatras_LI_FindMagicOreCave_01_03");	//Думаю, ему будет интересно услышать эту новость.
	GOTOORECAPITAN = TRUE;
};


instance DIA_ADDON_VATRAS_LI_CHANGECOURSE(C_Info)
{
	npc = vlk_439_vatras_li;
	nr = 2;
	condition = dia_addon_vatras_li_changecourse_condition;
	information = dia_addon_vatras_li_changecourse_info;
	permanent = FALSE;
	description = "Мне нужен твой совет.";
};


func int dia_addon_vatras_li_changecourse_condition()
{
	if(MIS_CHANGECOURSE == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_addon_vatras_li_changecourse_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_LI_ChangeCourse_01_00");	//Мне нужен твой совет.
	AI_Output(self,other,"DIA_Addon_Vatras_LI_ChangeCourse_01_01");	//Чем я могу помочь тебе, сын мой?
	AI_Output(other,self,"DIA_Addon_Vatras_LI_ChangeCourse_01_02");	//Нам надо решить, что делать с рудой, которую мы обнаружили на этом острове.
	AI_Output(self,other,"DIA_Addon_Vatras_LI_ChangeCourse_01_03");	//Хммм...(задумчиво) А у тебя самого есть идеи на этот счет?
	Info_ClearChoices(dia_addon_vatras_li_changecourse);
	Info_AddChoice(dia_addon_vatras_li_changecourse,"Думаю, нам стоит рассказать о ней паладинам.",dia_addon_vatras_li_changecourse_ore);
	Info_AddChoice(dia_addon_vatras_li_changecourse,"Уверен, что паладины хорошо заплатят нам за эту руду!",dia_addon_vatras_li_changecourse_gold);
};

func void dia_addon_vatras_li_changecourse_ore()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Addon_Vatras_LI_ChangeCourse_Ore_01_01");	//Думаю, нам стоит рассказать о ней паладинам.
	AI_Output(self,other,"DIA_Addon_Vatras_LI_ChangeCourse_Ore_01_03");	//Я целиком и полностью одобряю твои замыслы, сын мой...(серьезно)
	AI_Output(self,other,"DIA_Addon_Vatras_LI_ChangeCourse_Ore_01_04");	//Ты прав. Мы должны незамедлительно сообщить об этом лорду Хагену.
	AI_Output(self,other,"DIA_Addon_Vatras_LI_ChangeCourse_Ore_01_05");	//Хммм...(задумчиво) правда для этого, нам понадобится вернуться обратно в Хоринис.
	AI_Output(other,self,"DIA_Addon_Vatras_LI_ChangeCourse_Ore_01_08");	//Спасибо за совет.
	AI_Output(self,other,"DIA_Addon_Vatras_LI_ChangeCourse_Ore_01_09");	//Да пребудет с тобой Аданос!
	B_LogEntry(TOPIC_CHANGECOURSE,"Ватрас полагает, что мы просто обязаны вернуться в Хоринис и сообщить паладинам о руде.");
	CREWAGREEAWAYBACKPAL = CREWAGREEAWAYBACKPAL + 1;
	COUNTPEOPLEDECIDEPRG = COUNTPEOPLEDECIDEPRG + 1;
	if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
	{
		READYCHANGECOURSE = TRUE;
		Log_AddEntry(TOPIC_CHANGECOURSE,"Кажется, я поговорил со всеми парнями! Теперь стоит сообщить об этом нашему капитану.");
	};
	Info_ClearChoices(dia_addon_vatras_li_changecourse);
};

func void dia_addon_vatras_li_changecourse_gold()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Addon_Vatras_LI_ChangeCourse_Gold_01_01");	//Уверен, что паладины хорошо заплатят нам за эту руду. Она им просто необходима!
	AI_Output(self,other,"DIA_Addon_Vatras_LI_ChangeCourse_Gold_01_02");	//Мне не очень по душе твои мысли, сын мой...(серьезно) Использовать чужую нужду ради своей выгоды - поступок, который не может быть достоин уважения.
	AI_Output(self,other,"DIA_Addon_Vatras_LI_ChangeCourse_Gold_01_05");	//Мне казалось, что понятие чести и благородства ты всегда ставил выше, нежели тусклый блеск золота.
	AI_Output(self,other,"DIA_Addon_Vatras_LI_ChangeCourse_Gold_01_06");	//Но видимо я ошибался!...(печально)
	AI_Output(self,other,"DIA_Addon_Vatras_LI_ChangeCourse_Gold_01_07");	//Конечно, решение принимать только тебе.
	AI_Output(self,other,"DIA_Addon_Vatras_LI_ChangeCourse_Gold_01_08");	//Но я не одобряю твоих замыслов!
	B_LogEntry(TOPIC_CHANGECOURSE,"Ватрас не одобрил моей идеи насчет того, чтобы стребовать с паладинов золото за найденую нами магическую руду.");
	COUNTPEOPLEDECIDEPRG = COUNTPEOPLEDECIDEPRG + 1;
	if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
	{
		READYCHANGECOURSE = TRUE;
		Log_AddEntry(TOPIC_CHANGECOURSE,"Кажется, я поговорил со всеми парнями! Теперь стоит сообщить об этом нашему капитану.");
	};
	Info_ClearChoices(dia_addon_vatras_li_changecourse);
};

