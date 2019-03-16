
instance DIA_GORNATOT_EXIT(C_Info)
{
	npc = tpl_8006_gornatot;
	nr = 999;
	condition = dia_gornatot_exit_condition;
	information = dia_gornatot_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_gornatot_exit_condition()
{
	return TRUE;
};

func void dia_gornatot_exit_info()
{
	AI_StopProcessInfos(self);
};

instance dia_gornatot_PICKPOCKET(C_Info)
{
	npc = tpl_8006_gornatot;
	nr = 900;
	condition = dia_gornatot_PICKPOCKET_Condition;
	information = dia_gornatot_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_gornatot_PICKPOCKET_Condition()
{
	return C_Beklauen(15,35);
};

func void dia_gornatot_PICKPOCKET_Info()
{
	Info_ClearChoices(dia_gornatot_PICKPOCKET);
	Info_AddChoice(dia_gornatot_PICKPOCKET,Dialog_Back,dia_gornatot_PICKPOCKET_BACK);
	Info_AddChoice(dia_gornatot_PICKPOCKET,DIALOG_PICKPOCKET,dia_gornatot_PICKPOCKET_DoIt);
};

func void dia_gornatot_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(dia_gornatot_PICKPOCKET);
};

func void dia_gornatot_PICKPOCKET_BACK()
{
	Info_ClearChoices(dia_gornatot_PICKPOCKET);
};


instance DIA_GORNATOT_WHOYOU(C_Info)
{
	npc = tpl_8006_gornatot;
	nr = 1;
	condition = dia_gornatot_whoyou_condition;
	information = dia_gornatot_whoyou_info;
	permanent = FALSE;
	description = "Кто ты?";
};


func int dia_gornatot_whoyou_condition()
{
	if(PSI_TALK == TRUE)
	{
		return TRUE;
	};
};

func void dia_gornatot_whoyou_info()
{
	AI_Output(other,self,"DIA_GorNaTot_WhoYou_01_00");	//Кто ты?
	AI_Output(self,other,"DIA_GorNaTot_WhoYou_01_01");	//Я - Гор На Тоф.
	AI_Output(other,self,"DIA_GorNaTot_WhoYou_01_02");	//А что ты тут делаешь?
	if((other.guild == GIL_NONE) || (other.guild == GIL_GUR) || (other.guild == GIL_TPL) || (other.guild == GIL_SEK))
	{
		AI_Output(self,other,"DIA_GorNaTot_WhoYou_01_03");	//Я занимаюсь обучением Стражей Братства.
		AI_Output(other,self,"DIA_GorNaTot_WhoYou_01_04");	//Как идет это обучение?
		AI_Output(self,other,"DIA_GorNaTot_WhoYou_01_05");	//Неплохо! Но мы по-прежнему очень сильно нуждаемся в людях.
		AI_Output(self,other,"DIA_GorNaTot_WhoYou_01_06");	//Идол Парвез целыми днями торчит в городе, пытаясь отыскать людей, достойных принять нашу веру.
		AI_Output(self,other,"DIA_GorNaTot_WhoYou_01_07");	//Но большинство из тех, кого он приводит в лагерь, почти ни на что не способны.
		AI_Output(self,other,"DIA_GorNaTot_WhoYou_01_08");	//Они даже меч в руках толком держать не умеют, не говоря уже об остальном.
		AI_Output(self,other,"DIA_GorNaTot_WhoYou_01_09");	//Хотя, безусловно, мы рады новым послушникам - ибо с каждым новым последователем крепчает и наша вера!
	}
	else
	{
		AI_Output(self,other,"DIA_GorNaTot_WhoYou_01_10");	//(раздраженно) В данный момент я отвечаю на твои идиотские вопросы.
		AI_Output(self,other,"DIA_GorNaTot_WhoYou_01_11");	//Поэтому будет лучше, если ты оставишь меня в покое! Ясно?
		AI_StopProcessInfos(self);
	};
};


instance DIA_GORNATOT_MITMACHEN(C_Info)
{
	npc = tpl_8006_gornatot;
	nr = 2;
	condition = dia_gornatot_mitmachen_condition;
	information = dia_gornatot_mitmachen_info;
	permanent = TRUE;
	description = "Я хочу присоединиться к вам!";
};


func int dia_gornatot_mitmachen_condition()
{
	if(Npc_KnowsInfo(hero,dia_gornatot_whoyou) && ((other.guild == GIL_NONE) || (other.guild == GIL_SEK)))
	{
		return TRUE;
	};
};

func void dia_gornatot_mitmachen_info()
{
	AI_Output(other,self,"DIA_GorNaTot_Mitmachen_01_00");	//Я хочу присоединиться к вам!
	AI_Output(self,other,"DIA_GorNaTot_Mitmachen_01_01");	//Ты хочешь стать стражем? Да, наглости тебе не занимать. Ты ведь не думаешь, что мы принимаем любого, кто об этом попросит?
	AI_Output(self,other,"DIA_GorNaTot_Mitmachen_01_02");	//Поживи в Лагере, а там посмотрим.
};


instance DIA_GORNATOT_ABWEISEND(C_Info)
{
	npc = tpl_8006_gornatot;
	nr = 2;
	condition = dia_gornatot_abweisend_condition;
	information = dia_gornatot_abweisend_info;
	permanent = TRUE;
	description = "Ты можешь чему-нибудь научить меня?";
};


func int dia_gornatot_abweisend_condition()
{
	if(Npc_KnowsInfo(hero,dia_gornatot_whoyou) && (GORNATOTTEACH == FALSE))
	{
		return TRUE;
	};
};

func void dia_gornatot_abweisend_info()
{
	AI_Output(other,self,"DIA_GorNaTot_Abweisend_01_00");	//Ты можешь чему-нибудь научить меня?
	if(other.guild == GIL_GUR)
	{
		AI_Output(self,other,"DIA_GorNaTot_Abweisend_01_01");	//Я учу только тех, кто принадлежит к священному кругу Стражей Братства!
		AI_Output(self,other,"DIA_GorNaTot_Abweisend_01_02");	//Обучением Гуру занимаются Идолы - обратись к ним.
	}
	else if(other.guild == GIL_SEK)
	{
		AI_Output(self,other,"DIA_GorNaTot_Abweisend_01_03");	//Я учу только тех, кто принадлежит к священному кругу Стражей Братства!
		AI_Output(self,other,"DIA_GorNaTot_Abweisend_01_04");	//Если ты хочешь стать им - поговори с Гор На Кошем. Он поможет тебе вступить на этот путь.
	}
	else if(other.guild == GIL_TPL)
	{
		AI_Output(self,other,"DIA_GorNaTot_Abweisend_01_06");	//Поскольку ты являешься одним из нас - я с радостью обучу тебя тому, что знаю сам.
		AI_Output(self,other,"DIA_GorNaTot_Abweisend_01_07");	//Я помогу тебе освоить заклинания боевой магии Стражей и увеличить твою магическую силу для использования этих заклинаний.
		AI_Output(self,other,"DIA_GorNaTot_Abweisend_01_08");	//Безусловно, наша магия не сравнима по силе и мощи со священной магией Гуру...
		AI_Output(self,other,"DIA_GorNaTot_Abweisend_01_09");	//...однако, даже несмотря на это, она все равно является неплохим подспорьем в бою.
		AI_Output(self,other,"DIA_GorNaTot_Abweisend_01_10");	//К тому же для ее овладения тебе не потребуются знания магических кругов.
		AI_Output(self,other,"DIA_GorNaTot_Abweisend_01_11");	//Скажи, когда захочешь начать свое обучение - и мы тотчас приступим.
		Log_CreateTopic(TOPIC_ADDON_TPLTEACHER,LOG_NOTE);
		B_LogEntry(TOPIC_ADDON_TPLTEACHER,"Гор На Тоф покажет мне, как использовать боевую магию Стражей и сможет повысить мою магическую энергию.");
		GORNATOTTEACH = TRUE;
	}
	else if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_GorNaTot_Abweisend_01_12");	//Мои уроки распространяются только на Стражей!
		AI_Output(self,other,"DIA_GorNaTot_Abweisend_01_13");	//А тебе хватает наглости спрашивать об этом, хотя ты сам даже не принадлежишь к нашему Братству!
		AI_Output(self,other,"DIA_GorNaTot_Abweisend_01_14");	//До тех пор, пока ты не один из нас - можешь даже не мечтать об этом.
	}
	else
	{
		AI_Output(self,other,"DIA_GorNaTot_Abweisend_01_15");	//Мои уроки не распространяются на неверных!
		AI_Output(self,other,"DIA_GorNaTot_Abweisend_01_16");	//Убирайся прочь!
		AI_StopProcessInfos(self);
	};
};


instance DIA_GORNATOT_TEACH_MANA(C_Info)
{
	npc = tpl_8006_gornatot;
	nr = 10;
	condition = dia_gornatot_teach_mana_condition;
	information = dia_gornatot_teach_mana_info;
	permanent = TRUE;
	description = "Я хочу увеличить свою магическую энергию.";
};


func int dia_gornatot_teach_mana_condition()
{
	if((other.guild == GIL_TPL) && (GORNATOTTEACH == TRUE) && (other.attribute[ATR_MANA_MAX] < T_MED))
	{
		return TRUE;
	};
};

func void dia_gornatot_teach_mana_info()
{
	AI_Output(other,self,"DIA_GorNaTot_TEACH_MANA_15_00");	//Я хочу увеличить свою магическую энергию.
	AI_Output(self,other,"DIA_GorNaTot_TEACH_MANA_15_01");	//Сила разума не менее важна, чем сила и ловкость тела воина.
	Info_ClearChoices(dia_gornatot_teach_mana);
	Info_AddChoice(dia_gornatot_teach_mana,Dialog_Back,dia_gornatot_teach_mana_back);
	Info_AddChoice(dia_gornatot_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_gornatot_teach_mana_1);
	Info_AddChoice(dia_gornatot_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_gornatot_teach_mana_5);
};

func void dia_gornatot_teach_mana_back()
{
	if(other.attribute[ATR_MANA_MAX] >= T_HIGH)
	{
		AI_Output(self,other,"DIA_GorNaTot_TEACH_MANA_05_00");	//Я больше не в силах помочь тебе в этом.
		AI_Output(self,other,"DIA_GorNaTot_TEACH_MANA_05_01");	//Ты на пределе своих возможностей!
	};
	Info_ClearChoices(dia_gornatot_teach_mana);
};

func void dia_gornatot_teach_mana_1()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,1,T_HIGH);
	Info_ClearChoices(dia_gornatot_teach_mana);
	Info_AddChoice(dia_gornatot_teach_mana,Dialog_Back,dia_gornatot_teach_mana_back);
	Info_AddChoice(dia_gornatot_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_gornatot_teach_mana_1);
	Info_AddChoice(dia_gornatot_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_gornatot_teach_mana_5);
};

func void dia_gornatot_teach_mana_5()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,5,T_HIGH);
	Info_ClearChoices(dia_gornatot_teach_mana);
	Info_AddChoice(dia_gornatot_teach_mana,Dialog_Back,dia_gornatot_teach_mana_back);
	Info_AddChoice(dia_gornatot_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_gornatot_teach_mana_1);
	Info_AddChoice(dia_gornatot_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_gornatot_teach_mana_5);
};


instance DIA_GORNATOT_TEACHTPLRUNES(C_Info)
{
	npc = tpl_8006_gornatot;
	nr = 100;
	condition = dia_gornatot_teachtplrunes_condition;
	information = dia_gornatot_teachtplrunes_info;
	permanent = TRUE;
	description = "Я хочу овладеть боевой магией Стражей.";
};


func int dia_gornatot_teachtplrunes_condition()
{
	if((other.guild == GIL_TPL) && (GORNATOTTEACH == TRUE) && (FIRSTTALKTPLMAGIC == FALSE))
	{
		return TRUE;
	};
};

func void dia_gornatot_teachtplrunes_info()
{
	AI_Output(other,self,"DIA_GorNaTot_TEACHTplRunes_01_00");	//Я хочу овладеть боевой магией Стражей.
	AI_Output(self,other,"DIA_GorNaTot_TEACHTplRunes_01_01");	//Перед тем как мы начнем обучение, позволь я тебе кое-что расскажу.
	AI_Output(self,other,"DIA_GorNaTot_TEACHTplRunes_01_02");	//Принципы использования боевой магии Стражей похожи на те, что лежат в основе любой другой магии.
	AI_Output(self,other,"DIA_GorNaTot_TEACHTplRunes_01_03");	//Для ее применения мы используем магические руны, в которых содержатся формулы с заклинаниями. Но есть и отличия...
	AI_Output(self,other,"DIA_GorNaTot_TEACHTplRunes_01_05");	//Первое, что ты уже наверняка знаешь - магия Стражей не требует от тебя владения магическими кругами.
	AI_Output(self,other,"DIA_GorNaTot_TEACHTplRunes_01_06");	//Кроме этого, существуют несколько способов ее применения или, как мы их называем, - Путей.
	AI_Output(self,other,"DIA_GorNaTot_TEACHTplRunes_01_07");	//В зависимости от того, какой путь ты выберешь в самом начале своего обучения - то направление магии ты и сможешь использовать в дальнейшем.
	AI_Output(self,other,"DIA_GorNaTot_TEACHTplRunes_01_09");	//Теперь мне осталось задать тебе единственный вопрос, на который ты должен будешь мне сейчас ответить.
	AI_Output(self,other,"DIA_GorNaTot_TEACHTplRunes_01_10");	//Подумай хорошо, прежде чем дать ответ - впоследствии ты уже не сможешь изменить свой выбор.
	AI_Output(self,other,"DIA_GorNaTot_TEACHTplRunes_01_11");	//Итак: какой путь ты выбираешь для себя - Путь Целителя или Путь Воина?
	Info_ClearChoices(dia_gornatot_teachtplrunes);
	Info_AddChoice(dia_gornatot_teachtplrunes,"Я выбираю Путь Целителя.",dia_gornatot_teachtplrunes_heal);
	Info_AddChoice(dia_gornatot_teachtplrunes,"Я выбираю Путь Воина.",dia_gornatot_teachtplrunes_combat);
};

func void dia_gornatot_teachtplrunes_heal()
{
	AI_Output(other,self,"DIA_GorNaTot_TEACHTplRunes_Heal_01_00");	//Я выбираю Путь Целителя.
	AI_Output(self,other,"DIA_GorNaTot_TEACHTplRunes_Heal_01_01");	//Хорошо, ты сделал свой выбор, и с этим я передаю тебе первую руну этого пути.
	B_GiveInvItems(self,other,itru_tplheal_00,1);
	AI_Output(self,other,"DIA_GorNaTot_TEACHTplRunes_Heal_01_02");	//Она позволит тебе исцелять свои раны, полученные в сражениях во славу Братства!
	AI_Output(self,other,"DIA_GorNaTot_TEACHTplRunes_Heal_01_03");	//Будь мудр и рассудителен в ее использовании. И не забывай про то, что я тебе говорил.
	PSIWAYHEAL = TRUE;
	FIRSTTALKTPLMAGIC = TRUE;
	Info_ClearChoices(dia_gornatot_teachtplrunes);
};

func void dia_gornatot_teachtplrunes_combat()
{
	AI_Output(other,self,"DIA_GorNaTot_TEACHTplRunes_Combat_01_00");	//Я выбираю Путь Воина.
	AI_Output(self,other,"DIA_GorNaTot_TEACHTplRunes_Combat_01_01");	//Хорошо, ты сделал свой выбор, и с этим я передаю тебе первую руну этого пути.
	B_GiveInvItems(self,other,itru_tplstrike_00,1);
	AI_Output(self,other,"DIA_GorNaTot_TEACHTplRunes_Combat_01_02");	//Она поможет тебе одолеть твоих врагов!
	AI_Output(self,other,"DIA_GorNaTot_TEACHTplRunes_Combat_01_03");	//Будь мудр и рассудителен в ее использовании. И не забывай про то, что я тебе говорил.
	PSIWAYCOMBAT = TRUE;
	FIRSTTALKTPLMAGIC = TRUE;
	Info_ClearChoices(dia_gornatot_teachtplrunes);
};


instance DIA_GORNATOT_TEACHTPLNEXTRUNES(C_Info)
{
	npc = tpl_8006_gornatot;
	nr = 100;
	condition = dia_gornatot_teachtplnextrunes_condition;
	information = dia_gornatot_teachtplnextrunes_info;
	permanent = TRUE;
	description = "Я хочу продолжить свое обучение магии Стражей.";
};

func int dia_gornatot_teachtplnextrunes_condition()
{
	if((other.guild == GIL_TPL) && (GORNATOTTEACH == TRUE) && (PSIWAYRUNECOMPLETE == FALSE) && ((PSIWAYHEAL == TRUE) || (PSIWAYCOMBAT == TRUE)))
	{
		return TRUE;
	};
};

func void dia_gornatot_teachtplnextrunes_info()
{
	var string concatText;

	AI_Output(other,self,"DIA_GorNaTot_TEACHTplNextRunes_01_00");	//Я хочу продолжить свое обучение магии Стражей.
	if(PSIWAYHEAL == TRUE)
	{
		if((PSIWAYHEALRUNE_01 == FALSE) && (Kapitel >= 2))
		{
			if(other.lp < 10)
			{
				concatText = PRINT_NeedLP;
				concatText = ConcatStrings(concatText,IntToString(10));
				concatText = ConcatStrings(concatText," очков обучения!");
				AI_Print(concatText);
				AI_Print(PRINT_NotEnoughLearnPoints);
				B_Say(self,other,"$NOLEARNNOPOINTS");
			}
			else
			{
				AI_Output(self,other,"DIA_GorNaTot_TEACHTplNextRunes_01_01");	//Думаю, ты готов сделать следующий шаг на выбранном тобой пути.
				AI_Output(self,other,"DIA_GorNaTot_TEACHTplNextRunes_01_02");	//И в знак моего признания этого права - прими от меня эту руну.
				other.lp = other.lp - 10;
				RankPoints = RankPoints + 10;
				B_GiveInvItems(self,other,itru_tplheal_01,1);
				PSIWAYHEALRUNE_01 = TRUE;
			};
		}
		else if((PSIWAYHEALRUNE_01 == TRUE) && (PSIWAYHEALRUNE_02 == FALSE) && (Kapitel >= 3))
		{
			if(other.lp < 15)
			{
				concatText = PRINT_NeedLP;
				concatText = ConcatStrings(concatText,IntToString(15));
				concatText = ConcatStrings(concatText," очков обучения!");
				AI_Print(concatText);
				B_Say(self,other,"$NOLEARNNOPOINTS");
			}
			else
			{
				AI_Output(self,other,"DIA_GorNaTot_TEACHTplNextRunes_01_03");	//Думаю, ты готов сделать следующий шаг на выбранном тобой пути.
				AI_Output(self,other,"DIA_GorNaTot_TEACHTplNextRunes_01_04");	//И в знак моего признания этого права - прими от меня эту руну.
				other.lp = other.lp - 15;
				RankPoints = RankPoints + 15;
				B_GiveInvItems(self,other,itru_tplheal_02,1);
				PSIWAYHEALRUNE_02 = TRUE;
			};
		}
		else if((PSIWAYHEALRUNE_01 == TRUE) && (PSIWAYHEALRUNE_02 == TRUE) && (PSIWAYHEALRUNE_03 == FALSE) && (Kapitel >= 5))
		{
			if(other.lp < 20)
			{
				concatText = PRINT_NeedLP;
				concatText = ConcatStrings(concatText,IntToString(20));
				concatText = ConcatStrings(concatText," очков обучения!");
				AI_Print(concatText);
				B_Say(self,other,"$NOLEARNNOPOINTS");
			}
			else
			{
				AI_Output(self,other,"DIA_GorNaTot_TEACHTplNextRunes_01_05");	//Думаю, ты готов сделать следующий шаг на выбранном тобой пути.
				AI_Output(self,other,"DIA_GorNaTot_TEACHTplNextRunes_01_06");	//И в знак моего признания этого права - прими от меня эту руну.
				AI_Output(self,other,"DIA_GorNaTot_TEACHTplNextRunes_01_07");	//Это последнее заклинание Пути Целителя - мне больше нечему учить тебя.
				AI_Output(self,other,"DIA_GorNaTot_TEACHTplNextRunes_01_08");	//Надеюсь, ты по достоинству оценишь полученные тобой знания!
				other.lp = other.lp - 20;
				RankPoints = RankPoints + 20;
				B_GiveInvItems(self,other,itru_tplheal_03,1);
				PSIWAYHEALRUNE_03 = TRUE;
				PSIWAYRUNECOMPLETE = TRUE;
			};
		}
		else
		{
			AI_Output(self,other,"DIA_GorNaTot_TEACHTplNextRunes_01_09");	//Ты еще не готов к тому, чтобы получить следующее заклинание Пути Целителя.
		};
	};
	if(PSIWAYCOMBAT == TRUE)
	{
		if((PSIWAYCOMBATRUNE_01 == FALSE) && (Kapitel >= 2))
		{
			if(other.lp < 10)
			{
				concatText = PRINT_NeedLP;
				concatText = ConcatStrings(concatText,IntToString(10));
				concatText = ConcatStrings(concatText," очков обучения!");
				AI_Print(concatText);
				B_Say(self,other,"$NOLEARNNOPOINTS");
			}
			else
			{
				AI_Output(self,other,"DIA_GorNaTot_TEACHTplNextRunes_01_10");	//Думаю, ты готов сделать следующий шаг на выбранном тобой пути.
				AI_Output(self,other,"DIA_GorNaTot_TEACHTplNextRunes_01_11");	//И в знак моего признания этого права - прими от меня эту руну.
				other.lp = other.lp - 10;
				RankPoints = RankPoints + 10;
				B_GiveInvItems(self,other,itru_tplstrike_01,1);
				PSIWAYCOMBATRUNE_01 = TRUE;
			};
		}
		else if((PSIWAYCOMBATRUNE_01 == TRUE) && (PSIWAYCOMBATRUNE_02 == FALSE) && (Kapitel >= 3))
		{
			if(other.lp < 15)
			{
				concatText = PRINT_NeedLP;
				concatText = ConcatStrings(concatText,IntToString(15));
				concatText = ConcatStrings(concatText," очков обучения!");
				AI_Print(concatText);
				B_Say(self,other,"$NOLEARNNOPOINTS");
			}
			else
			{
				AI_Output(self,other,"DIA_GorNaTot_TEACHTplNextRunes_01_12");	//Думаю, ты готов сделать следующий шаг на выбранном тобой пути.
				AI_Output(self,other,"DIA_GorNaTot_TEACHTplNextRunes_01_13");	//И в знак моего признания этого права - прими от меня эту руну.
				other.lp = other.lp - 15;
				RankPoints = RankPoints + 15;
				B_GiveInvItems(self,other,itru_tplstrike_02,1);
				PSIWAYCOMBATRUNE_02 = TRUE;
			};
		}
		else if((PSIWAYCOMBATRUNE_01 == TRUE) && (PSIWAYCOMBATRUNE_02 == TRUE) && (PSIWAYCOMBATRUNE_03 == FALSE) && (Kapitel >= 5))
		{
			if(other.lp < 20)
			{
				concatText = PRINT_NeedLP;
				concatText = ConcatStrings(concatText,IntToString(20));
				concatText = ConcatStrings(concatText," очков обучения!");
				AI_Print(concatText);
				B_Say(self,other,"$NOLEARNNOPOINTS");
			}
			else
			{
				AI_Output(self,other,"DIA_GorNaTot_TEACHTplNextRunes_01_14");	//Думаю, ты готов сделать следующий шаг на выбранном тобой пути.
				AI_Output(self,other,"DIA_GorNaTot_TEACHTplNextRunes_01_15");	//И в знак моего признания этого права - прими от меня эту руну.
				AI_Output(self,other,"DIA_GorNaTot_TEACHTplNextRunes_01_16");	//Это последнее заклинание Пути Воина - мне больше нечему учить тебя.
				AI_Output(self,other,"DIA_GorNaTot_TEACHTplNextRunes_01_17");	//Надеюсь, ты по достоинству оценишь полученные тобой знания!
				other.lp = other.lp - 20;
				RankPoints = RankPoints + 20;
				B_GiveInvItems(self,other,itru_tplstrike_03,1);
				PSIWAYCOMBATRUNE_03 = TRUE;
				PSIWAYRUNECOMPLETE = TRUE;
			};
		}
		else
		{
			AI_Output(self,other,"DIA_GorNaTot_TEACHTplNextRunes_01_18");	//Ты еще не готов к тому, чтобы получить следующее заклинание Пути Воина.
		};
	};
};


instance DIA_GORNATOT_NamibSendTempler(C_Info)
{
	npc = tpl_8006_gornatot;
	nr = 1;
	condition = dia_gornatot_NamibSendTempler_condition;
	information = dia_gornatot_NamibSendTempler_info;
	permanent = FALSE;
	description = "Я прибыл от Идола Намиба.";
};

func int dia_gornatot_NamibSendTempler_condition()
{
	if((MIS_PrioratStart == LOG_Running) && (NamibSendTempler == TRUE) && (AssInvationBegin == FALSE))
	{
		return TRUE;
	};
};

func void dia_gornatot_NamibSendTempler_info()
{
	AI_Output(other,self,"DIA_GorNaTot_NamibSendTempler_01_00");	//Я прибыл от Идола Намиба.
	AI_Output(self,other,"DIA_GorNaTot_NamibSendTempler_01_01");	//(спокойно) Что хочет наш духовный наставник?
	AI_Output(other,self,"DIA_GorNaTot_NamibSendTempler_01_02");	//Он хочет, чтобы ты послал нескольких стражей в лагеря сборщиков болотника. Необходимо как можно скорее обеспечить их безопасность.
	AI_Output(self,other,"DIA_GorNaTot_NamibSendTempler_01_03");	//(удивленно) Зачем? Разве им что-то угрожает?
	AI_Output(other,self,"DIA_GorNaTot_NamibSendTempler_01_04");	//Ты сомневаешься в решении Идола Намиба?
	AI_Output(self,other,"DIA_GorNaTot_NamibSendTempler_01_05");	//Нет, конечно. Просто стало интересно - зачем Идолу Намибу это понадобилось?
	AI_Output(other,self,"DIA_GorNaTot_NamibSendTempler_01_06");	//Можешь спросить у него самого.
	AI_Output(self,other,"DIA_GorNaTot_NamibSendTempler_01_07");	//Ладно, не будем терять времени! Я сейчас же распоряжусь об отправке нескольких стражей к сборщикам. Можешь так ему и передать.
	GorNaTotSendTemplers = TRUE;
	B_LogEntry(TOPIC_PrioratStart,"Наставника стражей Гор На Тофа удивила просьба Намиба, однако он пообещал в ближайшее время отправить в лагеря сборщиков несколько своих воинов.");
	AI_StopProcessInfos(self);
	Wld_InsertNpc(TPL_8100_TEMPLER,"NW_PSICAMP_GUARDCAMP_00_01");
	Wld_InsertNpc(TPL_8101_TEMPLER,"NW_PSICAMP_GUARDCAMP_01_01");
	Wld_InsertNpc(TPL_8102_TEMPLER,"NW_PSICAMP_GUARDCAMP_02_01");
	Wld_InsertNpc(TPL_8103_TEMPLER,"NW_PSICAMP_GUARDCAMP_03_01");
	Wld_InsertNpc(TPL_8104_TEMPLER,"NW_PSICAMP_GUARDCAMP_04_01");
};

instance DIA_GORNATOT_LetsTrain(C_Info)
{
	npc = tpl_8006_gornatot;
	nr = 1;
	condition = dia_gornatot_LetsTrain_condition;
	information = dia_gornatot_LetsTrain_info;
	permanent = FALSE;
	description = "Что ты можешь сказать о Тираксе?";
};

func int dia_gornatot_LetsTrain_condition()
{
	if(MIS_TrainInCamp == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_gornatot_LetsTrain_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_GorNaTot_LetsTrain_01_00");	//Что ты можешь сказать о твоем ученике Тираксе?
	AI_Output(self,other,"DIA_GorNaTot_LetsTrain_01_01");	//Тиракс? Полагаю, что он один из лучших воинов, которых мне приходилось обучать.
	AI_Output(self,other,"DIA_GorNaTot_LetsTrain_01_02");	//Но, на мой взгляд, порой ему не хватает уверенности в себе, что ведет к потери его концентрации в бою.
	AI_Output(self,other,"DIA_GorNaTot_LetsTrain_01_03");	//Ему надо научиться полностью сосредотачиваться на битве, а не размышлять о том, что подумают о нем другие. А почему ты спрашиваешь?
	AI_Output(other,self,"DIA_GorNaTot_LetsTrain_01_04");	//Тиракс сейчас находится в лагере сборщиков болотника вместе с другими стражами.
	AI_Output(self,other,"DIA_GorNaTot_LetsTrain_01_05");	//Я знаю об этом, поскольку сам его туда и отправил.
	AI_Output(other,self,"DIA_GorNaTot_LetsTrain_01_06");	//Так вот. Мне кажется, что им не мешало бы там попрактиковаться во владении мечом.
	AI_Output(other,self,"DIA_GorNaTot_LetsTrain_01_07");	//Это будет куда полезнее, чем проводить все свое свободное время, стоя на посту. Но им нужен наставник, который займется их обучением.
	AI_Output(self,other,"DIA_GorNaTot_LetsTrain_01_08");	//Мысль хорошая. И насколько я понимаю, ты хочешь, чтобы Тиракс занялся этим?
	AI_Output(other,self,"DIA_GorNaTot_LetsTrain_01_09");	//Об этом я и хотел тебя спросить. Тираксу нужно твое согласие, чтобы начать тренировки.
	AI_Output(self,other,"DIA_GorNaTot_LetsTrain_01_10");	//Что ж, я нисколько не против. Он вполне к этому готов.
	GorNaTotAgreeTiraks = TRUE;
	B_LogEntry(TOPIC_TrainInCamp,"Наставник стражей Гор На Тоф дал свое согласие на то, чтобы Тиракс занялся обучением стражей в лагере сборщиков.");
};