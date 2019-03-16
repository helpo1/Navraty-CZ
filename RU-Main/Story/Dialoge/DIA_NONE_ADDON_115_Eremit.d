
instance DIA_Addon_Eremit_EXIT(C_Info)
{
	npc = NONE_ADDON_115_Eremit;
	nr = 999;
	condition = DIA_Addon_Eremit_EXIT_Condition;
	information = DIA_Addon_Eremit_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Eremit_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Eremit_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Eremit_Hello(C_Info)
{
	npc = NONE_ADDON_115_Eremit;
	nr = 1;
	condition = DIA_Addon_Eremit_Hello_Condition;
	information = DIA_Addon_Eremit_Hello_Info;
	description = "Что ты здесь делаешь?";
};


func int DIA_Addon_Eremit_Hello_Condition()
{
	return TRUE;
};

func void DIA_Addon_Eremit_Hello_Info()
{
	AI_Output(other,self,"DIA_Addon_Eremit_Add_15_00");	//Что ты здесь делаешь?
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_00");	//Что я здесь делаю?! А что ТЫ, черт возьми, здесь делаешь?
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_01");	//Я уехал в самую безлюдную часть острова, потому что искал покой!
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_02");	//Гражданская война, бандитские набеги, нападения орков...
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_03");	//Мне надоело все это безумие, так что я решил оставить его за своей спиной.
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_04");	//Здесь, конечно, тоже встречаются орки, но совсем немного.
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_05");	//А вот люди, хвала Инносу, здесь не появляются... вернее, до сих пор не появлялись.
};


instance DIA_Addon_Eremit_SeekTafeln(C_Info)
{
	npc = NONE_ADDON_115_Eremit;
	nr = 2;
	condition = DIA_Addon_Eremit_SeekTafeln_Condition;
	information = DIA_Addon_Eremit_SeekTafeln_Info;
	description = "Я ищу каменные таблички...";
};


func int DIA_Addon_Eremit_SeekTafeln_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Eremit_Hello) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Eremit_SeekTafeln_Info()
{
	AI_Output(other,self,"DIA_Addon_Eremit_Add_15_02");	//Я ищу каменные таблички. Тебе они не попадались?
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_06");	//Да, у меня есть пара табличек. Но я тебе их не отдам!
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_07");	//Это единственное, что у меня есть почитать.
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_08");	//Конечно, полностью написанное на них я не понимаю, но некоторые тексты уже расшифровал.
};


var int Eremit_Teach_Once;

instance DIA_Addon_Eremit_Teach(C_Info)
{
	npc = NONE_ADDON_115_Eremit;
	nr = 3;
	condition = DIA_Addon_Eremit_Teach_Condition;
	information = DIA_Addon_Eremit_Teach_Info;
	permanent = TRUE;
	description = "Насчет каменных табличек...";
};


func int DIA_Addon_Eremit_Teach_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Eremit_SeekTafeln) && (Eremit_Teach_Once == FALSE) && (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Eremit_Teach_Info()
{
	AI_Output(other,self,"DIA_Addon_Eremit_Add_15_03");	//Насчет каменных табличек...
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_25");	//Ты хочешь, чтобы я научил тебя их читать?
	if(MIS_Eremit_Klamotten != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Eremit_Add_04_26");	//(быстро) Но свои я тебе не отдам! Сам ищи себе таблички!
	};
	Info_ClearChoices(DIA_Addon_Eremit_Teach);
	Info_AddChoice(DIA_Addon_Eremit_Teach,Dialog_Back,DIA_Addon_Eremit_Teach_No);
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Eremit_Teach,b_buildlearnstringforlanguage(NAME_ADDON_LEARNLANGUAGE_1,B_GetLearnCostTalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_1)),DIA_Addon_Eremit_Teach_Yes);
	}
	else if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE) && (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE))
	{
		Info_AddChoice(DIA_Addon_Eremit_Teach,b_buildlearnstringforlanguage(NAME_ADDON_LEARNLANGUAGE_2,B_GetLearnCostTalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_2)),DIA_Addon_Eremit_Teach_Yes);
	}
	else if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE) && (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE) && (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == TRUE))
	{
		Info_AddChoice(DIA_Addon_Eremit_Teach,b_buildlearnstringforlanguage(NAME_ADDON_LEARNLANGUAGE_3,B_GetLearnCostTalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_3)),DIA_Addon_Eremit_Teach_Yes);
	};
};

func void B_Addon_Eremit_TeachLanguage()
{
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_27");	//Вообще это все довольно просто. 'G' читается как 'O', 'T' - как 'Х', а 'I' - как 'Ц'.
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_28");	//Если ты это понял, то и все остальное поймешь довольно быстро...
	Eremit_Teach_Once = TRUE;
};

func void DIA_Addon_Eremit_Teach_No()
{
	Info_ClearChoices(DIA_Addon_Eremit_Teach);
};

func void DIA_Addon_Eremit_Teach_Yes()
{
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Eremit_Add_04_29");	//Не думаю, что могу еще чему-то тебя научить.
		Eremit_Teach_Once = TRUE;
	}
	else if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == TRUE)
	{
		if(B_TeachPlayerTalentForeignLanguage(self,other,LANGUAGE_3))
		{
			B_Addon_Eremit_TeachLanguage();
		};
	}
	else if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		if(B_TeachPlayerTalentForeignLanguage(self,other,LANGUAGE_2))
		{
			B_Addon_Eremit_TeachLanguage();
		};
	}
	else if(B_TeachPlayerTalentForeignLanguage(self,other,LANGUAGE_1))
	{
		B_Addon_Eremit_TeachLanguage();
	};
};


instance DIA_Addon_Eremit_Klamotten(C_Info)
{
	npc = NONE_ADDON_115_Eremit;
	nr = 4;
	condition = DIA_Addon_Eremit_Klamotten_Condition;
	information = DIA_Addon_Eremit_Klamotten_Info;
	permanent = TRUE;
	description = "Я принес тебе кое-какую одежду...";
};


func int DIA_Addon_Eremit_Klamotten_Condition()
{
	if(MIS_Eremit_Klamotten == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Eremit_Klamotten_Info()
{
	AI_Output(other,self,"DIA_Addon_Eremit_Add_15_01");	//Я принес тебе кое-какую одежду...
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_19");	//Правда? Давай ее мне, я хочу ее примерить!
	Info_ClearChoices(DIA_Addon_Eremit_Klamotten);
	Info_AddChoice(DIA_Addon_Eremit_Klamotten,Dialog_Back,DIA_Addon_Eremit_Klamotten_BACK);
	if(Npc_HasItems(other,ITAR_PIR_L_Addon) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten,"Дать легкие доспехи пирата",DIA_Addon_Eremit_Klamotten_PIR_L);
	};
	if(Npc_HasItems(other,ITAR_PIR_M_Addon) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten,"Дать средние доспехи пирата",DIA_Addon_Eremit_Klamotten_PIR_M);
	};
	if(Npc_HasItems(other,ITAR_PIR_H_Addon) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten,"Дать доспехи капитана пиратов",DIA_Addon_Eremit_Klamotten_PIR_H);
	};
	if(Npc_HasItems(other,ITAR_RANGER_Addon) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten,"Дать кольчугу Кольца Воды",DIA_Addon_Eremit_Klamotten_Ranger);
	};
	if(Npc_HasItems(other,ITAR_Vlk_L) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten,"Дать легкую одежду горожанина",DIA_Addon_Eremit_Klamotten_VLK_L);
	};
	if(Npc_HasItems(other,ITAR_Vlk_M) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten,"Дать одежду горожанина",DIA_Addon_Eremit_Klamotten_VLK_M);
	};
	if(Npc_HasItems(other,ITAR_Vlk_H) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten,"Дать роскошную одежду горожанина",DIA_Addon_Eremit_Klamotten_VLK_H);
	};
	if(Npc_HasItems(other,ITAR_Bau_L) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten,"Дать легкую одежду фермера",DIA_Addon_Eremit_Klamotten_BAU_L);
	};
	if(Npc_HasItems(other,ITAR_Bau_M) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten,"Дать одежду крестьянина",DIA_Addon_Eremit_Klamotten_BAU_M);
	};
	if(Npc_HasItems(other,ITAR_DJG_Crawler) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten,"Дать доспехи из панцирей ползунов",DIA_Addon_Eremit_Klamotten_DJG_Crawler);
	};
	if(Npc_HasItems(other,ITAR_Leather_L) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten,"Дать кожаный доспех",DIA_Addon_Eremit_Klamotten_Leather);
	};
	if(Npc_HasItems(other,ITAR_Prisoner) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten,"Дать штаны старателя",DIA_Addon_Eremit_Klamotten_Prisoner);
	};
};

func void B_Eremit_Tatsache()
{
	AI_EquipBestArmor(self);
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_20");	//Подходит!
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_21");	//Так-так, чем же мне тебе заплатить? Все золото я отдал пиратам за то, что они меня сюда привезли.
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_22");	//Все, что я могу тебе отдать, это эти старые каменные таблички.
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_23");	//Забирай! Я поищу себе новые.
	B_GiveInvItems(self,other,ItWr_StonePlateCommon_Addon,2);
	MIS_Eremit_Klamotten = LOG_SUCCESS;

	if(MIS_LanceChange == LOG_Success)
	{
		AI_Output(self,other,"DIA_Addon_Eremit_Add_Done_01_01");	//Ну, а теперь можно отправляться и к магам!
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(NONE_ADDON_115_Eremit,"WaterMage");
	}
	else
	{
		Info_ClearChoices(DIA_Addon_Eremit_Klamotten);
	};
};

func void DIA_Addon_Eremit_Klamotten_BACK()
{
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_24");	//Ну вот... Сначала ты меня обнадежил, а потом... (вздыхает)
	Info_ClearChoices(DIA_Addon_Eremit_Klamotten);
};

func void DIA_Addon_Eremit_Klamotten_PIR_L()
{
	B_GivePlayerXP(150);
	B_GiveInvItems(other,self,ITAR_PIR_L_Addon,1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_PIR_M()
{
	B_GivePlayerXP(200);
	B_GiveInvItems(other,self,ITAR_PIR_M_Addon,1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_PIR_H()
{
	B_GivePlayerXP(250);
	B_GiveInvItems(other,self,ITAR_PIR_H_Addon,1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_Ranger()
{
	B_GivePlayerXP(150);
	B_GiveInvItems(other,self,ITAR_RANGER_Addon,1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_VLK_L()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_Vlk_L,1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_VLK_M()
{
	B_GivePlayerXP(150);
	B_GiveInvItems(other,self,ITAR_Vlk_M,1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_VLK_H()
{
	B_GivePlayerXP(200);
	B_GiveInvItems(other,self,ITAR_Vlk_H,1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_BAU_L()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_Bau_L,1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_BAU_M()
{
	B_GivePlayerXP(150);
	B_GiveInvItems(other,self,ITAR_Bau_M,1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_DJG_Crawler()
{
	B_GivePlayerXP(500);
	B_GiveInvItems(other,self,ITAR_DJG_Crawler,1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_Leather()
{
	B_GivePlayerXP(150);
	B_GiveInvItems(other,self,ITAR_Leather_L,1);
	B_Eremit_Tatsache();
};

func void DIA_Addon_Eremit_Klamotten_Prisoner()
{
	B_GivePlayerXP(50);
	B_GiveInvItems(other,self,ITAR_Prisoner,1);
	B_Eremit_Tatsache();
};

instance DIA_Addon_Eremit_PERM(C_Info)
{
	npc = NONE_ADDON_115_Eremit;
	nr = 99;
	condition = DIA_Addon_Eremit_PERM_Condition;
	information = DIA_Addon_Eremit_PERM_Info;
	permanent = TRUE;
	description = "Как ты здесь живешь?";
};

func int DIA_Addon_Eremit_PERM_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Addon_Eremit_Hello) == TRUE) && ((MIS_LanceChange != LOG_Success) || (MIS_Eremit_Klamotten != LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Eremit_PERM_Info()
{
	AI_Output(other,self,"DIA_Addon_Eremit_Add_15_04");	//Как ты здесь живешь?

	if(MIS_Eremit_Klamotten == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Eremit_Add_04_09");	//(гордо) Я все сделал сам. Дом, оружие, инструменты - все.
		AI_Output(self,other,"DIA_Addon_Eremit_Add_04_10");	//Единственное, что я привез с собой, - хорошее настроение...
		AI_Output(self,other,"DIA_Addon_Eremit_Add_04_11");	//Иногда, правда...
		AI_Output(other,self,"DIA_Addon_Eremit_Doppelt_15_01");	//Да?
		AI_Output(self,other,"DIA_Addon_Eremit_Add_04_12");	//Иногда я жалею, что не взял с собой одежду.
		AI_Output(self,other,"DIA_Addon_Eremit_Add_04_13");	//Я не умею ни шить, ни дубить кожу...
		AI_Output(self,other,"DIA_Addon_Eremit_Add_04_14");	//А ночами в этой части острова бывает довольно холодно.
		MIS_Eremit_Klamotten = LOG_Running;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Eremit_Add_04_15");	//Пока я справляюсь...

		if(MIS_Eremit_Klamotten == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Addon_Eremit_Add_04_18");	//Но зиму пережить без одежды мне будет довольно сложно...
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Eremit_Add_04_16");	//Ладно, все равно здесь лучше, чем в городе!
			AI_Output(self,other,"DIA_Addon_Eremit_Add_04_17");	//Даже без одежды.
		};
	};
};

instance DIA_Addon_Eremit_LanceChange(C_Info)
{
	npc = NONE_ADDON_115_Eremit;
	nr = 99;
	condition = DIA_Addon_Eremit_LanceChange_Condition;
	information = DIA_Addon_Eremit_LanceChange_Info;
	permanent = FALSE;
	description = "А как ты относишься к магам Воды?";
};

func int DIA_Addon_Eremit_LanceChange_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Eremit_Hello) && (MIS_LanceChange == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Eremit_LanceChange_Info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_Addon_Eremit_LanceChange_01_01");	//А как ты относишься к магам Воды?
	AI_Output(self,other,"DIA_Addon_Eremit_LanceChange_01_02");	//К магам Воды? Они, наверное, единственные, кого я был бы рад видеть в этой части острова.
	AI_Output(other,self,"DIA_Addon_Eremit_LanceChange_01_03");	//Даже так? И с чем это связано?
	AI_Output(self,other,"DIA_Addon_Eremit_LanceChange_01_04");	//Ты будешь удивлен, но я и сам когда-то давно пытался стать магом Воды.
	AI_Output(other,self,"DIA_Addon_Eremit_LanceChange_01_05");	//Ты это серьезно?
	AI_Output(self,other,"DIA_Addon_Eremit_LanceChange_01_06");	//Абсолютно! (обиженно) Или ты мне не веришь?
	AI_Output(other,self,"DIA_Addon_Eremit_LanceChange_01_07");	//Да нет, почему же, верю. И что же тебе помешало стать магом?
	AI_Output(self,other,"DIA_Addon_Eremit_LanceChange_01_08");	//К сожалению, мои магические способности оказались недостаточно высокими даже для использования обычных заклинаний.
	AI_Output(self,other,"DIA_Addon_Eremit_LanceChange_01_09");	//Поэтому я и решил оставить эту затею. Кстати, а почему ты вдруг заговорил о них?
	AI_Output(other,self,"DIA_Addon_Eremit_LanceChange_01_10");	//Дело в том, что маги Воды тоже здесь. 
	AI_Output(self,other,"DIA_Addon_Eremit_LanceChange_01_11");	//Правда?!
	AI_Output(other,self,"DIA_Addon_Eremit_LanceChange_01_12");	//Да. Их миссия располагается в больших древних развалинах, что находятся в центре этой долины.
	AI_Output(self,other,"DIA_Addon_Eremit_LanceChange_01_13");	//Я знаю, где это. И что же достопочтенным магам понадобилось в этой заброшенной части острова?
	AI_Output(other,self,"DIA_Addon_Eremit_LanceChange_01_14");	//Они изучают культуру Зодчих. И, кроме того, ищут людей, которые могли бы им в этом помочь.
	AI_Output(self,other,"DIA_Addon_Eremit_LanceChange_01_15");	//Я уже давно тут живу, и много узнал про эту древнюю культуру.
	AI_Output(other,self,"DIA_Addon_Eremit_LanceChange_01_16");	//Интересно, откуда?
	AI_Output(self,other,"DIA_Addon_Eremit_LanceChange_01_17");	//Из каменных табличек, что разбросаны здесь по всей долине.
	AI_Output(other,self,"DIA_Addon_Eremit_LanceChange_01_18");	//Так, значит, ты еще умеешь читать древние таблички?
	AI_Output(self,other,"DIA_Addon_Eremit_LanceChange_01_19");	//Да! Это довольно легко, если разобраться в символах, что на них изображены.
	AI_Output(other,self,"DIA_Addon_Eremit_LanceChange_01_20");	//Тогда, мне кажется, что магам Воды пригодятся твои познания.
	AI_Output(self,other,"DIA_Addon_Eremit_LanceChange_01_21");	//Ты так думаешь?
	AI_Output(other,self,"DIA_Addon_Eremit_LanceChange_01_22");	//Уверен. Не хочешь присоединиться к их миссии?
	AI_Output(self,other,"DIA_Addon_Eremit_LanceChange_01_23");	//Ну, если сами маги не будут против моего общества, то... Почему бы и нет.
	AI_Output(other,self,"DIA_Addon_Eremit_LanceChange_01_24");	//Тогда я поговорю с ними и расскажу о тебе. 
	EremitAgreed = TRUE;
	B_LogEntry(TOPIC_LanceChange,"Отшельник Эрмит, что живет в глубине острова, вполне сгодится, чтобы стать новым помощником магов Воды. Надо рассказать о нем Сатурасу.");
};

instance DIA_Addon_Eremit_LanceChange_Done(C_Info)
{
	npc = NONE_ADDON_115_Eremit;
	nr = 99;
	condition = DIA_Addon_Eremit_LanceChange_Done_Condition;
	information = DIA_Addon_Eremit_LanceChange_Done_Info;
	permanent = FALSE;
	description = "Маги Воды с радостью примут тебя к себе.";
};

func int DIA_Addon_Eremit_LanceChange_Done_Condition()
{
	if(MIS_LanceChange == LOG_Success)
	{
		return TRUE;
	};
};

func void DIA_Addon_Eremit_LanceChange_Done_Info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Addon_Eremit_LanceChange_Done_01_01");	//Маги Воды с радостью примут тебя к себе.
	AI_Output(self,other,"DIA_Addon_Eremit_LanceChange_Done_01_02");	//Тогда, наверное, не стоит заставлять их ждать.


	if(MIS_Eremit_Klamotten != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Eremit_LanceChange_Done_01_03");	//Но я не могу появиться перед ними абсолютно голым!
		AI_Output(self,other,"DIA_Addon_Eremit_LanceChange_Done_01_04");	//Мне надо как-то решить эту проблему.
	}
	else
	{
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(NONE_ADDON_115_Eremit,"WaterMage");
	};
};