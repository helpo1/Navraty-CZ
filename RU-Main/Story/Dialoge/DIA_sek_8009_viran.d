
instance DIA_VIRAN_EXIT(C_Info)
{
	npc = sek_8009_viran;
	nr = 999;
	condition = dia_viran_exit_condition;
	information = dia_viran_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_viran_exit_condition()
{
	return TRUE;
};

func void dia_viran_exit_info()
{
	AI_StopProcessInfos(self);
};

instance dia_viran_PICKPOCKET(C_Info)
{
	npc = sek_8009_viran;
	nr = 900;
	condition = dia_viran_PICKPOCKET_Condition;
	information = dia_viran_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int dia_viran_PICKPOCKET_Condition()
{
	return C_Beklauen(20,43);
};

func void dia_viran_PICKPOCKET_Info()
{
	Info_ClearChoices(dia_viran_PICKPOCKET);
	Info_AddChoice(dia_viran_PICKPOCKET,Dialog_Back,dia_viran_PICKPOCKET_BACK);
	Info_AddChoice(dia_viran_PICKPOCKET,DIALOG_PICKPOCKET,dia_viran_PICKPOCKET_DoIt);
};

func void dia_viran_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(dia_viran_PICKPOCKET);
};

func void dia_viran_PICKPOCKET_BACK()
{
	Info_ClearChoices(dia_viran_PICKPOCKET);
};

instance DIA_VIRAN_MAGICSYMBOLS(C_Info)
{
	npc = sek_8009_viran;
	nr = 1;
	condition = dia_viran_magicsymbols_condition;
	information = dia_viran_magicsymbols_info;
	permanent = TRUE;
	important = FALSE;
	description = "У меня к тебе есть дело.";
};


func int dia_viran_magicsymbols_condition()
{
	if((CANMAKESYMBOLS == TRUE) && (SYMBOLSMAKEDONE == FALSE))
	{
		return TRUE;
	};
};

func void dia_viran_magicsymbols_info()
{
	AI_Output(other,self,"DIA_Viran_MagicSymbols_01_00");	//У меня есть к тебе дело.

	if(VIRANFIRSTTALKSYMBOLS == FALSE)
	{
		AI_Output(self,other,"DIA_Viran_MagicSymbols_01_01");	//(недовольно) Что еще такое?  Выкладывай, но только быстро.
		AI_Output(other,self,"DIA_Viran_MagicSymbols_01_02");	//Идол Оран сказал, что ты сможешь помочь мне нанести магические символы на тело.
		AI_Output(other,self,"DIA_Viran_MagicSymbols_01_03");	//Как один из членов Братства, я теперь тоже могу носить их!
		AI_Output(self,other,"DIA_Viran_MagicSymbols_01_04");	//А, вот в чем дело. Конечно, я помогу тебе. Это не займет много времени.
		AI_Output(self,other,"DIA_Viran_MagicSymbols_01_05");	//Ты точно уверен, что хочешь это сделать?
		VIRANFIRSTTALKSYMBOLS = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Viran_MagicSymbols_01_06");	//(ворчливо) Ну и что на этот раз?
		AI_Output(other,self,"DIA_Viran_MagicSymbols_01_07");	//Я все-таки решил нанести магические символы на свое тело. Ты поможешь мне?
		AI_Output(self,other,"DIA_Viran_MagicSymbols_01_08");	//Хорошо...(с сомнением) Ты в этом полностью уверен?
	};
	Info_ClearChoices(dia_viran_magicsymbols);
	Info_AddChoice(dia_viran_magicsymbols,"Да, конечно!",dia_viran_magicsymbols_yes);
	Info_AddChoice(dia_viran_magicsymbols,"Нет, это не для меня.",dia_viran_magicsymbols_no);
};

func void dia_viran_magicsymbols_yes()
{
	PlayVideo("RET2_BlackScreen.bik");
	other.protection[PROT_MAGIC] += 5;
	REALPROTMAGIC += 5;
	AI_Print(NAME_SEK_MAGIC);
	Snd_Play("LevelUp");
	SYMBOLSMAKEDONE = TRUE;
	HelmIsUpTemp = FALSE;
	AI_Output(self,other,"DIA_Viran_MagicSymbols_Yes_01_01");	//Вот все и готово! Магия этих священных символов теперь защитит тебя.
	AI_Output(other,self,"DIA_Viran_MagicSymbols_Yes_01_02");	//Спасибо.
	Info_ClearChoices(dia_viran_magicsymbols);
};

func void dia_viran_magicsymbols_no()
{
	AI_Output(other,self,"DIA_Viran_MagicSymbols_No_01_01");	//Нет, пожалуй, это не для меня.
	AI_Output(self,other,"DIA_Viran_MagicSymbols_No_01_02");	//Ладно, как скажешь.
	Info_ClearChoices(dia_viran_magicsymbols);
};

instance DIA_Viran_Bold(C_Info)
{
	npc = sek_8009_viran;
	nr = 899;
	condition = DIA_Viran_Bold_condition;
	information = DIA_Viran_Bold_info;
	permanent = TRUE;
	description = "Побрей меня наголо.";
};

func int DIA_Viran_Bold_condition()
{
	if((HeroBoldHead == FALSE) && ((hero.guild == GIL_SEK) || (hero.guild == GIL_SEK) || (hero.guild == GIL_SEK)))
	{
		return TRUE;
	};
};

func void DIA_Viran_Bold_info()
{
	AI_Output(other,self,"DIA_Viran_Bold_01_00");	//Побрей меня наголо.
	AI_Output(self,other,"DIA_Viran_MagicSymbols_01_08");	//Хорошо...(с сомнением) Ты в этом полностью уверен?
	Info_ClearChoices(DIA_Viran_Bold);
	Info_AddChoice(DIA_Viran_Bold,"Да, конечно!",DIA_Viran_Bold_Yes);
	Info_AddChoice(DIA_Viran_Bold,"Нет, это не для меня.",DIA_Viran_Bold_No);
};

func void DIA_Viran_Bold_Yes()
{
	PlayVideo("RET2_BlackScreen.bik");
	HeroBoldHead = TRUE;
	Ext_RemoveFromSlot(hero,"BIP01 HEAD");
	Npc_RemoveInvItems(hero,ITMI_GERALTHAIR,Npc_HasItems(hero,ITMI_GERALTHAIR));
	GeraltHead = FALSE;

	if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == TRUE))
	{
		Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_XNG_Player,0,NO_ARMOR);
	}
	else if((SYMBOLSMAKEGURUDONE == TRUE) && (SYMBOLSMAKEDONE == FALSE))
	{
		Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_XNG_Player,0,NO_ARMOR);
	}
	else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == TRUE))
	{
		Mdl_SetVisualBody(hero,"hum_body_Naked0",13,0,"Hum_Head_Bald",Face_NX_Player,0,NO_ARMOR);
	}
	else if((SYMBOLSMAKEGURUDONE == FALSE) && (SYMBOLSMAKEDONE == FALSE))
	{
		Mdl_SetVisualBody(hero,"hum_body_Naked0",16,0,"Hum_Head_Bald",Face_NX_Player,0,NO_ARMOR);
	};

	AI_Output(other,self,"DIA_Viran_MagicSymbols_Yes_01_02");	//Спасибо.
	Info_ClearChoices(DIA_Viran_Bold);
};

func void DIA_Viran_Bold_No()
{
	AI_Output(other,self,"DIA_Viran_MagicSymbols_No_01_01");	//Нет, пожалуй, это не для меня.
	AI_Output(self,other,"DIA_Viran_MagicSymbols_No_01_02");	//Ладно, как скажешь.
	Info_ClearChoices(DIA_Viran_Bold);
};

instance DIA_VIRAN_WHATYOUDO(C_Info)
{
	npc = sek_8009_viran;
	nr = 1;
	condition = dia_viran_whatyoudo_condition;
	information = dia_viran_whatyoudo_info;
	permanent = FALSE;
	important = FALSE;
	description = "Чем ты занимаешься?";
};

func int dia_viran_whatyoudo_condition()
{
	return TRUE;
};

func void dia_viran_whatyoudo_info()
{
	AI_Output(other,self,"DIA_Viran_WhatYouDo_01_00");	//Чем ты занимаешься?
	AI_Output(self,other,"DIA_Viran_WhatYouDo_01_01");	//А разве не видно? Помогаю Йоре затачивать клинки для мечей Стражей.
	AI_Output(other,self,"DIA_Viran_WhatYouDo_01_02");	//А зачем вам столько оружия?
	AI_Output(self,other,"DIA_Viran_WhatYouDo_01_03");	//Парень, разуй глаза! Вся Долина Рудников просто кишит орками, а несколько дней назад их видели уже неподалеку от прохода.
	AI_Output(self,other,"DIA_Viran_WhatYouDo_01_04");	//Наверняка они скоро пожалуют и сюда. А мы не хотим, чтобы нас застали врасплох.
};


instance DIA_VIRAN_NEEDWEAPONS(C_Info)
{
	npc = sek_8009_viran;
	nr = 4;
	condition = dia_viran_needweapons_condition;
	information = dia_viran_needweapons_info;
	permanent = FALSE;
	description = "Я могу купить здесь оружие?";
};


func int dia_viran_needweapons_condition()
{
	return TRUE;
};

func void dia_viran_needweapons_info()
{
	AI_Output(other,self,"DIA_Viran_NeedWeapons_01_00");	//Я могу купить здесь оружие?
	AI_Output(self,other,"DIA_Viran_NeedWeapons_01_01");	//У меня его нет. Им занимается Йору - поговори с ним.
};


instance DIA_VIRAN_HOWTHINGS(C_Info)
{
	npc = sek_8009_viran;
	nr = 4;
	condition = dia_viran_howthings_condition;
	information = dia_viran_howthings_info;
	permanent = TRUE;
	description = "Ну, как идет подготовка к обороне?";
};


func int dia_viran_howthings_condition()
{
	if(Npc_KnowsInfo(hero,dia_viran_whatyoudo) && Wld_IsTime(8,0,22,0))
	{
		return TRUE;
	};
};

func void dia_viran_howthings_info()
{
	AI_Output(other,self,"DIA_Viran_HowThings_01_00");	//Ну, как идет подготовка к обороне?
	AI_Output(self,other,"DIA_Viran_HowThings_01_01");	//(раздраженно) Не мешай мне работать!
};


instance DIA_VIRAN_NEEDSTEEL(C_Info)
{
	npc = sek_8009_viran;
	nr = 4;
	condition = dia_viran_needsteel_condition;
	information = dia_viran_needsteel_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_viran_needsteel_condition()
{
	if(Npc_KnowsInfo(hero,dia_viran_whatyoudo) && (PSI_TALK == TRUE))
	{
		return TRUE;
	};
};

func void dia_viran_needsteel_info()
{
	AI_Output(self,other,"DIA_Viran_NeedSteel_01_00");	//Подожди минутку...
	AI_Output(other,self,"DIA_Viran_NeedSteel_01_01");	//Что еще?
	AI_Output(self,other,"DIA_Viran_NeedSteel_01_02");	//Тут есть одна работенка, как раз для такого парня, как ты.
	AI_Output(other,self,"DIA_Viran_NeedSteel_01_03");	//И в чем она заключается?
	AI_Output(self,other,"DIA_Viran_NeedSteel_01_05");	//Видишь ли, последнее время мы испытываем крайнюю нехватку материала для производства оружия и доспехов.
	AI_Output(self,other,"DIA_Viran_NeedSteel_01_06");	//А именно стальных заготовок.
	AI_Output(other,self,"DIA_Viran_NeedSteel_01_07");	//И что же?
	AI_Output(self,other,"DIA_Viran_NeedSteel_01_08");	//А то, что, если бы ты сумел добыть для нас небольшое количество стали, - было бы уже совсем неплохо.
	AI_Output(other,self,"DIA_Viran_NeedSteel_01_09");	//И что же я получу за свою услугу?
	AI_Output(self,other,"DIA_Viran_NeedSteel_01_13");	//Скажем, за твою помощь я бы мог дать тебе... ммм...
	AI_Output(self,other,"DIA_Viran_NeedSteel_01_14");	//...одно очень неплохое оружие из запасов нашего арсенала.
	AI_Output(other,self,"DIA_Viran_NeedSteel_01_15");	//А какое именно?
	AI_Output(self,other,"DIA_Viran_NeedSteel_01_16");	//Сначала выполни то, о чем я тебя попросил. А потом узнаешь, какое именно.
	AI_Output(self,other,"DIA_Viran_NeedSteel_01_17");	//Могу сказать только одно. Сколько стали принесешь - такое оружие и получишь.
	AI_Output(self,other,"DIA_Viran_NeedSteel_01_18");	//Ну, что скажешь?
	Info_ClearChoices(dia_viran_needsteel);
	Info_AddChoice(dia_viran_needsteel,"Хорошо. Но только попробуй меня надуть!",dia_viran_needsteel_ja);
	Info_AddChoice(dia_viran_needsteel,"Об этом не может быть и речи.",dia_viran_needsteel_nein);
};

func void dia_viran_needsteel_ja()
{
	AI_Output(other,self,"DIA_Viran_NeedSteel_Ja_01_00");	//Хорошо. Но только попробуй меня надуть!
	AI_Output(self,other,"DIA_Viran_NeedSteel_Ja_01_01");	//Ну что ты! Поверь, ты об этом не пожалеешь.
	AI_Output(other,self,"DIA_Viran_NeedSteel_Ja_01_02");	//Надеюсь.
	VIRAN_BRINGSTEEL = LOG_Running;
	Log_CreateTopic(TOPIC_VIRANBRINGSTEEL,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_VIRANBRINGSTEEL,LOG_Running);
	B_LogEntry(TOPIC_VIRANBRINGSTEEL,"Виран попросил меня принести ему как можно больше стальных заготовок.");
	Info_ClearChoices(dia_viran_needsteel);
};

func void dia_viran_needsteel_nein()
{
	AI_Output(other,self,"DIA_Viran_NeedSteel_Nein_01_00");	//Меня не устраивают эти условия.
	AI_Output(self,other,"DIA_Viran_NeedSteel_Nein_01_01");	//Ну, как знаешь.
	Info_ClearChoices(dia_viran_needsteel);
};


instance DIA_VIRAN_BRINGSTEEL(C_Info)
{
	npc = sek_8009_viran;
	nr = 5;
	condition = dia_viran_bringsteel_condition;
	information = dia_viran_bringsteel_info;
	permanent = TRUE;
	description = "Я принес сталь.";
};


func int dia_viran_bringsteel_condition()
{
	if((VIRAN_BRINGSTEEL == LOG_Running) && (Npc_HasItems(other,ItMiSwordraw) >= 1))
	{
		return TRUE;
	};
};

func void dia_viran_bringsteel_info()
{
	var C_Item EquipWeap;
	var int countsteel;
	AI_Output(other,self,"DIA_Viran_BringSteel_01_00");	//Я принес сталь.
	AI_Output(self,other,"DIA_Viran_BringSteel_01_01");	//Хорошо, давай посмотрим, сколько стали ты принес.
	countsteel = Npc_HasItems(other,ItMiSwordraw);
	if((countsteel >= 1) && (countsteel <= 3))
	{
		B_GiveInvItems(other,self,ItMiSwordraw,countsteel);
		AI_Output(self,other,"DIA_Viran_BringSteel_01_02");	//(негодующе) И это все, что ты смог раздобыть?!
		AI_Output(self,other,"DIA_Viran_BringSteel_01_03");	//Да этого даже не хватит и на то, чтобы выковать более или менее приличный клинок!
		AI_Output(other,self,"DIA_Viran_BringSteel_01_04");	//Где моя награда?
		AI_Output(self,other,"DIA_Viran_BringSteel_01_05");	//Ах да, твоя награда...(ехидно)
		AI_Output(self,other,"DIA_Viran_BringSteel_01_06");	//Вот - возьми. Как раз по твоим заслугам.
		if(countsteel == 1)
		{
			B_GiveInvItems(self,other,itmw_1h_misc_gsword,1);
		}
		else
		{
			B_GiveInvItems(self,other,ItMw_ShortSword3,1);
			B_GivePlayerXP(50);
		};
	}
	else if((countsteel > 3) && (countsteel <= 5))
	{
		B_GivePlayerXP(200);
		B_GiveInvItems(other,self,ItMiSwordraw,countsteel);
		AI_Output(self,other,"DIA_Viran_BringSteel_01_07");	//Неплохо. Хотя, если признаться, я ожидал больше...
		AI_Output(self,other,"DIA_Viran_BringSteel_01_08");	//Но все-таки это лучше, чем ничего.
		AI_Output(other,self,"DIA_Viran_BringSteel_01_09");	//Где моя награда?
		AI_Output(self,other,"DIA_Viran_BringSteel_01_10");	//Ах да, твоя награда...(вздыхая)
		AI_Output(self,other,"DIA_Viran_BringSteel_01_11");	//Вот, возьми. Большего все равно не заслужил!
		B_GiveInvItems(self,other,ItMw_Schwert,1);
	}
	else if((countsteel > 5) && (countsteel <= 7))
	{
		B_GivePlayerXP(400);
		B_GiveInvItems(other,self,ItMiSwordraw,countsteel);
		AI_Output(self,other,"DIA_Viran_BringSteel_01_12");	//О! Совсем неплохо!
		AI_Output(self,other,"DIA_Viran_BringSteel_01_13");	//Приблизительно столько я и рассчитывал от тебя получить.
		AI_Output(other,self,"DIA_Viran_BringSteel_01_14");	//Как насчет моей награды?
		AI_Output(self,other,"DIA_Viran_BringSteel_01_16");	//Вот, возьми эту вещицу. Думаю, тебе она сослужит неплохую службу.
		B_GiveInvItems(self,other,ItMw_Bartaxt,1);
	}
	else if((countsteel > 7) && (countsteel <= 15))
	{
		B_GivePlayerXP(600);
		B_GiveInvItems(other,self,ItMiSwordraw,countsteel);
		AI_Output(self,other,"DIA_Viran_BringSteel_01_17");	//Парень, откуда ты взял столько стальных заготовок?
		AI_Output(self,other,"DIA_Viran_BringSteel_01_18");	//Это куда больше, чем я рассчитывал.
		AI_Output(other,self,"DIA_Viran_BringSteel_01_19");	//Как насчет моей награды?
		AI_Output(self,other,"DIA_Viran_BringSteel_01_20");	//Конечно! Поверь, я в долгу не останусь.
		AI_Output(self,other,"DIA_Viran_BringSteel_01_21");	//Вот, возьми. Отличная вещь.
		B_GiveInvItems(self,other,ItMw_Schwert4,1);
	}
	else if(countsteel > 15)
	{
		B_GivePlayerXP(1000);
		B_GiveInvItems(other,self,ItMiSwordraw,countsteel);
		AI_Output(self,other,"DIA_Viran_BringSteel_01_22");	//Глазам своим не верю! Откуда у тебя столько стальных заготовок?
		AI_Output(self,other,"DIA_Viran_BringSteel_01_23");	//Это превысило все мои ожидания. Я даже и подумать не мог, что ты сможешь раздобыть столько стали.
		AI_Output(other,self,"DIA_Viran_BringSteel_01_24");	//Как насчет моей награды?
		AI_Output(self,other,"DIA_Viran_BringSteel_01_25");	//Без проблем, парень!
		AI_Output(self,other,"DIA_Viran_BringSteel_01_26");	//Вот, возьми эту вещицу. Поверь, это лучшее оружие, что у меня имеется!
		B_GiveInvItems(self,other,itmw_1h_mace_107,1);
	};
	Npc_RemoveInvItems(self,ItMiSwordraw,Npc_HasItems(self,ItMiSwordraw));
	VIRAN_BRINGSTEEL = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_VIRANBRINGSTEEL,LOG_SUCCESS);
};


instance DIA_VIRAN_SEKTEHEILEN(C_Info)
{
	npc = sek_8009_viran;
	nr = 1;
	condition = dia_viran_sekteheilen_condition;
	information = dia_viran_sekteheilen_info;
	permanent = FALSE;
	description = "Выпей напиток! Он помогает от головной боли.";
};


func int dia_viran_sekteheilen_condition()
{
	if((Npc_HasItems(other,ItPo_HealObsession_MIS) > 0) && (MIS_SEKTEHEILEN == LOG_Running) && Npc_KnowsInfo(hero,dia_baalorun_sekteheilengot))
	{
		return TRUE;
	};
};

func void dia_viran_sekteheilen_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Viran_SekteHeilen_01_00");	//Выпей напиток! Он помогает от головной боли.
	B_GiveInvItems(other,self,ItPo_HealObsession_MIS,1);
	B_UseItem(self,ItPo_HealObsession_MIS);
	SEKTEHEILENCOUNT = SEKTEHEILENCOUNT + 1;
	AI_Output(self,other,"DIA_Viran_SekteHeilen_01_01");	//Моя голова...она прошла!
	AI_Output(self,other,"DIA_Viran_SekteHeilen_01_02");	//Спасибо тебе, брат.
};

