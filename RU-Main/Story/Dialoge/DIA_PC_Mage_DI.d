
instance DIA_Milten_DI_EXIT(C_Info)
{
	npc = PC_Mage_DI;
	nr = 999;
	condition = DIA_Milten_DI_EXIT_Condition;
	information = DIA_Milten_DI_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Milten_DI_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Milten_DI_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Milten_DI_Hello(C_Info)
{
	npc = PC_Mage_DI;
	nr = 3;
	condition = DIA_Milten_DI_Hello_Condition;
	information = DIA_Milten_DI_Hello_Info;
	description = "Прямо как в старые времена.";
};


func int DIA_Milten_DI_Hello_Condition()
{
	if(UndeadDragonIsDead == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Milten_DI_Hello_Info()
{
	AI_Output(other,self,"DIA_Milten_DI_Hello_15_00");	//Прямо как в старые времена.
	AI_Output(self,other,"DIA_Milten_DI_Hello_03_01");	//Ты сам сказал это. Мне даже интересно, сможешь ли ты выкарабкаться на этот раз.
	AI_Output(other,self,"DIA_Milten_DI_Hello_15_02");	//Ты о чем?
	AI_Output(self,other,"DIA_Milten_DI_Hello_03_03");	//Удастся ли тебе спасти свою задницу, когда на тебя опять обрушится весь этот ад.
};


instance DIA_Milten_DI_TRADE(C_Info)
{
	npc = PC_Mage_DI;
	nr = 12;
	condition = DIA_Milten_DI_TRADE_Condition;
	information = DIA_Milten_DI_TRADE_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "Есть несколько лишних зелий?";
};


func int DIA_Milten_DI_TRADE_Condition()
{
	if((UndeadDragonIsDead == FALSE) && Npc_KnowsInfo(other,DIA_Milten_DI_Hello))
	{
		return TRUE;
	};
};

func void DIA_Milten_DI_TRADE_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Milten_DI_TRADE_15_00");	//Есть несколько лишних зелий?

	if(Npc_HasItems(self,itpo_anpois) != 3)
	{
		Npc_RemoveInvItems(self,itpo_anpois,Npc_HasItems(self,itpo_anpois));
		CreateInvItems(self,itpo_anpois,3);
	};

	B_GiveTradeInv(self);
	Npc_RemoveInvItems(self,ItPo_Health_02,Npc_HasItems(self,ItPo_Health_02));
	CreateInvItems(self,ItPo_Health_02,15);
	Npc_RemoveInvItems(self,ItPo_Mana_02,Npc_HasItems(self,ItPo_Mana_02));
	CreateInvItems(self,ItPo_Mana_02,15);
	CreateInvItems(self,ItMi_Flask,3);
	AI_Output(self,other,"DIA_Milten_DI_TRADE_03_01");	//Пока запас достаточный.
};


instance DIA_Milten_DI_Rat(C_Info)
{
	npc = PC_Mage_DI;
	nr = 3;
	condition = DIA_Milten_DI_Rat_Condition;
	information = DIA_Milten_DI_Rat_Info;
	description = "Какой совет ты можешь дать мне?";
};


func int DIA_Milten_DI_Rat_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Milten_DI_Hello) && (UndeadDragonIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Milten_DI_Rat_Info()
{
	AI_Output(other,self,"DIA_Milten_DI_Rat_15_00");	//Можешь дать мне какой-нибудь совет?
	AI_Output(self,other,"DIA_Milten_DI_Rat_03_01");	//Ммм. Это большая честь, что ты спрашиваешь у меня совета. Но у меня в голове все это время вертится только одно.
	AI_Output(self,other,"DIA_Milten_DI_Rat_03_02");	//У тебя есть Глаз Инноса?
	Info_ClearChoices(DIA_Milten_DI_Rat);
	if(SC_InnosEyeVergessen_DI == TRUE)
	{
		Info_AddChoice(DIA_Milten_DI_Rat,"Нет.",DIA_Milten_DI_Rat_nein);
	}
	else
	{
		Info_AddChoice(DIA_Milten_DI_Rat,"Конечно.",DIA_Milten_DI_Rat_ja);
	};
};

func void DIA_Milten_DI_Rat_nein()
{
	AI_Output(other,self,"DIA_Milten_DI_Rat_nein_15_00");	//Нет.
	AI_Output(self,other,"DIA_Milten_DI_Rat_nein_03_01");	//(возмущенно) Ты такой...Что ты будешь делать, если ты встретишься с драконами здесь, на острове?
	AI_Output(self,other,"DIA_Milten_DI_Rat_nein_03_02");	//Ты так и не поумнел? Здесь у нас есть даже алхимический стол, мы могли бы спокойно перезарядить Глаз.
	AI_Output(self,other,"DIA_Milten_DI_Rat_nein_03_03");	//А ты о чем думаешь? Мне остается только надеяться, что твоя непредусмотрительность не будет стоить нам жизней.
	Info_ClearChoices(DIA_Milten_DI_Rat);
};

func void DIA_Milten_DI_Rat_ja()
{
	AI_Output(other,self,"DIA_Milten_DI_Rat_ja_15_00");	//Конечно.
	AI_Output(self,other,"DIA_Milten_DI_Rat_ja_03_01");	//Извини, что я задаю такой глупый вопрос. Я немного нервничаю.
	B_GivePlayerXP(XP_Ambient);
	Info_ClearChoices(DIA_Milten_DI_Rat);
};


instance DIA_Milten_DI_PEDROTOT(C_Info)
{
	npc = PC_Mage_DI;
	nr = 3;
	condition = DIA_Milten_DI_PEDROTOT_Condition;
	information = DIA_Milten_DI_PEDROTOT_Info;
	description = "Я нашел Педро.";
};


func int DIA_Milten_DI_PEDROTOT_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Pedro_DI_YOU))
	{
		return TRUE;
	};
};

func void DIA_Milten_DI_PEDROTOT_Info()
{
	B_GivePlayerXP(XP_Ambient);
	AI_Output(other,self,"DIA_Milten_DI_PEDROTOT_15_00");	//Я нашел Педро.
	AI_Output(self,other,"DIA_Milten_DI_PEDROTOT_03_01");	//Что?! Где?!...(пораженно) Здесь на острове? Проклятие, это действительно невероятно.
	AI_Output(self,other,"DIA_Milten_DI_PEDROTOT_03_02");	//Теперь я не буду считать его таким идиотом.
	if(Npc_IsDead(Pedro_DI))
	{
		AI_Output(other,self,"DIA_Milten_DI_PEDROTOT_15_03");	//Он мертв.
		AI_Output(self,other,"DIA_Milten_DI_PEDROTOT_03_04");	//Да? Хорошо. Да упокоится его прах с миром. Хотя я не могу сказать, что мне жаль его, я все же был бы не прочь задать ему парочку вопросов.
	}
	else
	{
		AI_Output(self,other,"DIA_Milten_DI_PEDROTOT_03_05");	//У меня с ним давние счеты.
	};
};


instance DIA_Milten_DI_TeachMagic(C_Info)
{
	npc = PC_Mage_DI;
	nr = 31;
	condition = DIA_Milten_DI_TeachMagic_Condition;
	information = DIA_Milten_DI_TeachMagic_Info;
	permanent = TRUE;
	description = "Я хочу повысить свои магические способности.";
};


func int DIA_Milten_DI_TeachMagic_Condition()
{
	if((UndeadDragonIsDead == FALSE) && Npc_KnowsInfo(other,DIA_Milten_DI_Hello))
	{
		return TRUE;
	};
};


var int DIA_Milten_DI_TeachMagic_OneTime;

func void DIA_Milten_DI_TeachMagic_Info()
{
	AI_Output(other,self,"DIA_Milten_DI_TeachMagic_15_00");	//Я хочу повысить свои магические способности.
	if(ORkSturmDI == FALSE)
	{
		AI_Output(self,other,"DIA_Milten_DI_TeachMagic_03_01");	//Я сделаю все, что смогу.
	}
	else if(DIA_Milten_DI_TeachMagic_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Milten_DI_TeachMagic_03_02");	//Я помогу тебе, но только при условии, что ты позаботишься, чтобы орки оставались там, где они есть сейчас.
		DIA_Milten_DI_TeachMagic_OneTime = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Milten_DI_TeachMagic_03_03");	//Хорошо. Что тебе требуется?
	};
	Info_ClearChoices(DIA_Milten_DI_TeachMagic);
	Info_AddChoice(DIA_Milten_DI_TeachMagic,Dialog_Back,DIA_Milten_DI_TeachMagic_BACK);
	Info_AddChoice(DIA_Milten_DI_TeachMagic,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Milten_DI_TeachMagic_MANA_1);
	Info_AddChoice(DIA_Milten_DI_TeachMagic,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Milten_DI_TeachMagic_MANA_5);
	if((hero.guild == GIL_KDF) || (CHOOSEFIRE == TRUE))
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,"Создать руну",DIA_Milten_DI_TeachMagic_RUNES);
	};
};

func void DIA_Milten_DI_TeachMagic_MANA_1()
{
	if(B_TeachAttributePoints(self,other,ATR_MANA_MAX,1,T_MAX))
	{
		AI_Output(self,other,"DIA_Milten_DI_TeachMagic_MANA_1_03_00");	//Да ведет тебя рука Инноса.
	};
	Info_ClearChoices(DIA_Milten_DI_TeachMagic);
	Info_AddChoice(DIA_Milten_DI_TeachMagic,Dialog_Back,DIA_Milten_DI_TeachMagic_BACK);
	Info_AddChoice(DIA_Milten_DI_TeachMagic,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Milten_DI_TeachMagic_MANA_1);
	Info_AddChoice(DIA_Milten_DI_TeachMagic,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Milten_DI_TeachMagic_MANA_5);

	if((hero.guild == GIL_KDF) || (CHOOSEFIRE == TRUE))
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,"Создать руну",DIA_Milten_DI_TeachMagic_RUNES);
	};
};

func void DIA_Milten_DI_TeachMagic_MANA_5()
{
	if(B_TeachAttributePoints(self,other,ATR_MANA_MAX,5,T_MAX))
	{
		AI_Output(self,other,"DIA_Milten_DI_TeachMagic_MANA_5_03_00");	//Пусть Инноса осветит твой путь.
	};
	Info_ClearChoices(DIA_Milten_DI_TeachMagic);
	Info_AddChoice(DIA_Milten_DI_TeachMagic,Dialog_Back,DIA_Milten_DI_TeachMagic_BACK);
	Info_AddChoice(DIA_Milten_DI_TeachMagic,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Milten_DI_TeachMagic_MANA_1);
	Info_AddChoice(DIA_Milten_DI_TeachMagic,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Milten_DI_TeachMagic_MANA_5);

	if((hero.guild == GIL_KDF) || (CHOOSEFIRE == TRUE))
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,"Создать руну",DIA_Milten_DI_TeachMagic_RUNES);
	};
};

func void DIA_Milten_DI_TeachMagic_RUNES()
{
	Info_ClearChoices(DIA_Milten_DI_TeachMagic);
	Info_AddChoice(DIA_Milten_DI_TeachMagic,Dialog_Back,DIA_Milten_DI_TeachMagic_BACK);
	AI_Output(self,other,"DIA_Milten_DI_TeachMagic_RUNES_03_00");	//Ох, нет! Я не большой специалист в этом, но мы как-нибудь справимся.

	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 4) && ((hero.guild == GIL_KDF) || (CHOOSEFIRE == TRUE)))
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,"Круг четвертый",DIA_Milten_DI_TeachMagic_Runen_Circle_4);
	};
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 5) && ((hero.guild == GIL_KDF) || (CHOOSEFIRE == TRUE)))
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,"Круг пятый",DIA_Milten_DI_TeachMagic_Runen_Circle_5);
	};
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 6) && ((hero.guild == GIL_KDF) || (CHOOSEFIRE == TRUE)))
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,"Круг шестой",DIA_Milten_DI_TeachMagic_Runen_Circle_6);
	};
};

func void DIA_Milten_DI_TeachMagic_Runen_Circle_4()
{
	Info_ClearChoices(DIA_Milten_DI_TeachMagic);
	Info_AddChoice(DIA_Milten_DI_TeachMagic,Dialog_Back,DIA_Milten_DI_TeachMagic_BACK);

	if(PLAYER_TALENT_RUNES[SPL_ChargeFireball] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,b_buildlearnstringforrunes(NAME_SPL_ChargeFireball,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_ChargeFireball)),DIA_Milten_DI_TeachMagic_Runen_Circle_4_SPL_ChargeFireball);
	};
	if(PLAYER_TALENT_RUNES[93] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,b_buildlearnstringforrunes(NAME_SPL_FIRELIGHT,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_FIRELIGHT)),dia_milten_di_teachmagic_runen_circle_4_spl_firelight);
	};
};

func void DIA_Milten_DI_TeachMagic_Runen_Circle_4_SPL_ChargeFireball()
{
	B_TeachPlayerTalentRunes(self,other,SPL_ChargeFireball);
};

func void dia_milten_di_teachmagic_runen_circle_4_spl_firelight()
{
	B_TeachPlayerTalentRunes(self,other,SPL_FIRELIGHT);
};

func void DIA_Milten_DI_TeachMagic_Runen_Circle_5()
{
	Info_ClearChoices(DIA_Milten_DI_TeachMagic);
	Info_AddChoice(DIA_Milten_DI_TeachMagic,Dialog_Back,DIA_Milten_DI_TeachMagic_BACK);

	if(PLAYER_TALENT_RUNES[SPL_Pyrokinesis] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,b_buildlearnstringforrunes(NAME_SPL_Pyrokinesis,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Pyrokinesis)),DIA_Milten_DI_TeachMagic_Runen_Circle_5_SPL_Pyrokinesis);
	};
	if(PLAYER_TALENT_RUNES[SPL_Explosion] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,b_buildlearnstringforrunes(NAME_SPL_Explosion,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Explosion)),DIA_Milten_DI_TeachMagic_Runen_Circle_5_SPL_Explosion);
	};
};

func void DIA_Milten_DI_TeachMagic_Runen_Circle_5_SPL_Pyrokinesis()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Pyrokinesis);
};

func void DIA_Milten_DI_TeachMagic_Runen_Circle_5_SPL_Explosion()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Explosion);
};

func void DIA_Milten_DI_TeachMagic_Runen_Circle_6()
{
	Info_ClearChoices(DIA_Milten_DI_TeachMagic);
	Info_AddChoice(DIA_Milten_DI_TeachMagic,Dialog_Back,DIA_Milten_DI_TeachMagic_BACK);

	if(PLAYER_TALENT_RUNES[SPL_Firerain] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic,b_buildlearnstringforrunes(NAME_SPL_Firerain,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Firerain)),DIA_Milten_DI_TeachMagic_Runen_Circle_6_SPL_Firerain);
	};
};

func void DIA_Milten_DI_TeachMagic_Runen_Circle_6_SPL_Firerain()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Firerain);
};

func void DIA_Milten_DI_TeachMagic_BACK()
{
	Info_ClearChoices(DIA_Milten_DI_TeachMagic);
};


instance DIA_Milten_DI_DementorObsessionBook(C_Info)
{
	npc = PC_Mage_DI;
	nr = 99;
	condition = DIA_Milten_DI_DementorObsessionBook_Condition;
	information = DIA_Milten_DI_DementorObsessionBook_Info;
	description = "Эта книга, Альманах Одержимых, говорит тебе о чем-то?";
};


func int DIA_Milten_DI_DementorObsessionBook_Condition()
{
	if(Npc_HasItems(other,ITWR_DementorObsessionBook_MIS))
	{
		return TRUE;
	};
};

func void DIA_Milten_DI_DementorObsessionBook_Info()
{
	AI_Output(other,self,"DIA_Milten_DI_DementorObsessionBook_15_00");	//Эта книга, Альманах Одержимых, говорит тебе о чем-то?
	AI_Output(self,other,"DIA_Milten_DI_DementorObsessionBook_03_01");	//Пирокар эксперт по таким книгам.
	AI_Output(self,other,"DIA_Milten_DI_DementorObsessionBook_03_02");	//Извини. Я знаю слишком мало, чтобы сказать что-либо умное об этом.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Milten_DI_DragonEgg(C_Info)
{
	npc = PC_Mage_DI;
	nr = 99;
	condition = DIA_Milten_DI_DragonEgg_Condition;
	information = DIA_Milten_DI_DragonEgg_Info;
	description = "Ты имел дело с драконьими яйцами?";
};


func int DIA_Milten_DI_DragonEgg_Condition()
{
	if(Npc_HasItems(other,ItAt_DragonEgg_MIS))
	{
		return TRUE;
	};
};

func void DIA_Milten_DI_DragonEgg_Info()
{
	AI_Output(other,self,"DIA_Milten_DI_DragonEgg_15_00");	//Ты имел дело с драконьими яйцами?
	AI_Output(self,other,"DIA_Milten_DI_DragonEgg_03_01");	//Нет, не совсем. Я слышал, что искусный алхимик как-то смог сварить зелье из них.
	AI_Output(self,other,"DIA_Milten_DI_DragonEgg_03_02");	//Но, пожалуйста, не спрашивай меня о рецепте. Я понятия не имею, как оно готовится.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Milten_DI_UndeadDragonDead(C_Info)
{
	npc = PC_Mage_DI;
	nr = 31;
	condition = DIA_Milten_DI_UndeadDragonDead_Condition;
	information = DIA_Milten_DI_UndeadDragonDead_Info;
	permanent = TRUE;
	description = "Хорошо. Дело сделано!";
};


func int DIA_Milten_DI_UndeadDragonDead_Condition()
{
	if(UndeadDragonIsDead == TRUE)
	{
		return TRUE;
	};
};


var int DIA_Milten_DI_UndeadDragonDead_OneTime;

func void DIA_Milten_DI_UndeadDragonDead_Info()
{
	AI_Output(other,self,"DIA_Milten_DI_UndeadDragonDead_15_00");	//Хорошо. Дело сделано! Храм теперь лишен своей силы.
	if(DIA_Milten_DI_UndeadDragonDead_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Milten_DI_UndeadDragonDead_03_01");	//Как тебе всегда удается выходись сухим из воды?
		AI_Output(other,self,"DIA_Milten_DI_UndeadDragonDead_15_02");	//Черт меня побери, если я знаю.
		AI_Output(self,other,"DIA_Milten_DI_UndeadDragonDead_03_03");	//(смеется) Мы, когда-нибудь сможем пожить спокойно? Мы, определенно, заслужили это.
		if(hero.guild == GIL_KDF)
		{
			AI_Output(other,self,"DIA_Milten_DI_UndeadDragonDead_15_04");	//Что ты собираешься делать сейчас?
			AI_Output(self,other,"DIA_Milten_DI_UndeadDragonDead_03_05");	//Я думаю об основании собственной академии, чтобы проповедовать нашу веру. Но из этого может ничего не получиться.
			AI_Output(self,other,"DIA_Milten_DI_UndeadDragonDead_03_06");	//Я никогда не жалел о том, что стал Магом Огня. А как тебе это?
			AI_Output(other,self,"DIA_Milten_DI_UndeadDragonDead_15_07");	//Я даже не знаю.
			AI_Output(self,other,"DIA_Milten_DI_UndeadDragonDead_03_08");	//(смеется) Сухо, как всегда. Эй, парень. Ты только что спас мир. Разве это недостаточная причина для радости?
			AI_Output(other,self,"DIA_Milten_DI_UndeadDragonDead_15_09");	//Ммм. Может быть.
		};
		AI_Output(self,other,"DIA_Milten_DI_UndeadDragonDead_03_10");	//Да ладно, дружище, я думаю, что главное, что тебе сейчас нужно, - немного поспать.
		DIA_Milten_DI_UndeadDragonDead_OneTime = TRUE;
	};
	AI_Output(self,other,"DIA_Milten_DI_UndeadDragonDead_03_11");	//Тебе нужно пойти к капитану и сказать ему, чтобы он поднимал якорь.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_Mage_DI_PICKPOCKET(C_Info)
{
	npc = PC_Mage_DI;
	nr = 900;
	condition = DIA_Mage_DI_PICKPOCKET_Condition;
	information = DIA_Mage_DI_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Mage_DI_PICKPOCKET_Condition()
{
	return C_Beklauen(45,120);
};

func void DIA_Mage_DI_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Mage_DI_PICKPOCKET);
	Info_AddChoice(DIA_Mage_DI_PICKPOCKET,Dialog_Back,DIA_Mage_DI_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Mage_DI_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Mage_DI_PICKPOCKET_DoIt);
};

func void DIA_Mage_DI_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Mage_DI_PICKPOCKET);
};

func void DIA_Mage_DI_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Mage_DI_PICKPOCKET);
};

