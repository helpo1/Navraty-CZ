
instance DIA_Mortis_EXIT(C_Info)
{
	npc = Mil_314_Mortis;
	nr = 999;
	condition = DIA_Mortis_EXIT_Condition;
	information = DIA_Mortis_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Mortis_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Mortis_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Mortis_Hallo(C_Info)
{
	npc = Mil_314_Mortis;
	nr = 2;
	condition = DIA_Mortis_Hallo_Condition;
	information = DIA_Mortis_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Mortis_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && ((Npc_KnowsInfo(other,DIA_Peck_FOUND_PECK) == FALSE) && (Kapitel < 3)))
	{
		return TRUE;
	};
};

func void DIA_Mortis_Hallo_Info()
{
	AI_Output(self,other,"DIA_Mortis_Hallo_13_00");	//Что тебе нужно? Пека здесь нет. А без него ты ничего не получишь. Заходи позже.
};


instance DIA_Mortis_Waffe(C_Info)
{
	npc = Mil_314_Mortis;
	nr = 2;
	condition = DIA_Mortis_Waffe_Condition;
	information = DIA_Mortis_Waffe_Info;
	permanent = FALSE;
	description = "А где Пек?";
};


func int DIA_Mortis_Waffe_Condition()
{
	if((MIS_Andre_Peck == LOG_Running) && ((Npc_KnowsInfo(other,DIA_Peck_FOUND_PECK) == FALSE) && (Kapitel < 3)))
	{
		return TRUE;
	};
};

func void DIA_Mortis_Waffe_Info()
{
	AI_Output(other,self,"DIA_Mortis_Waffe_15_00");	//А где Пек?
	AI_Output(self,other,"DIA_Mortis_Waffe_13_01");	//Ты только что вступил в наши ряды? Ну, тогда добро пожаловать.
	AI_Output(self,other,"DIA_Mortis_Waffe_13_02");	//Пек ушел в город уже давно. Готов поспорить, что он обхаживает Ваню в Красном Фонаре.
};


instance DIA_Mortis_Paket(C_Info)
{
	npc = Mil_314_Mortis;
	nr = 2;
	condition = DIA_Mortis_Paket_Condition;
	information = DIA_Mortis_Paket_Info;
	permanent = FALSE;
	description = "Ты что-нибудь знаешь о тюке травки?";
};


func int DIA_Mortis_Paket_Condition()
{
	if(MIS_Andre_WAREHOUSE == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Mortis_Paket_Info()
{
	AI_Output(other,self,"DIA_Mortis_Paket_15_00");	//Ты что-нибудь знаешь о тюке травки?
	AI_Output(self,other,"DIA_Mortis_Paket_13_01");	//Хм... последний раз, когда я был в портовом кабаке, я слышал, как Кардиф говорил об этом с каким-то парнем.
	AI_Output(other,self,"DIA_Mortis_Paket_15_02");	//Что это за парень?
	AI_Output(self,other,"DIA_Mortis_Paket_13_03");	//Понятия не имею. Но он сказал, что нашел отличное место для хранения травы - а затем они долго ржали как пьяные орки.
	B_LogEntry(TOPIC_Warehouse,"Мортис слышал, как трактирщик Кардиф и кто-то еще разговаривали о тюке в портовой таверне. Они обсуждали, где лучше хранить его.");
};


instance DIA_Mortis_Redlight(C_Info)
{
	npc = Mil_314_Mortis;
	nr = 2;
	condition = DIA_Mortis_Redlight_Condition;
	information = DIA_Mortis_Redlight_Info;
	permanent = FALSE;
	description = "Ты хорошо знаешь портовый квартал?";
};


func int DIA_Mortis_Redlight_Condition()
{
	if(MIS_Andre_REDLIGHT == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Mortis_Redlight_Info()
{
	AI_Output(other,self,"DIA_Mortis_Redlight_15_00");	//Ты хорошо знаешь портовый квартал? Я хочу найти того, кто продает болотную траву.
	AI_Output(self,other,"DIA_Mortis_Redlight_13_01");	//Ну-у... Народ там не особенно разговорчивый, и они уж точно ничего не скажут городскому стражнику.
	AI_Output(self,other,"DIA_Mortis_Redlight_13_02");	//Если ты хочешь разузнать что-либо там, тебе лучше... нет, ты ДОЛЖЕН снять свои доспехи.
	AI_Output(other,self,"DIA_Mortis_Redlight_15_03");	//Хорошо, а что дальше?
	AI_Output(self,other,"DIA_Mortis_Redlight_13_04");	//Кабак и бордель - вероятно, самые лучшие места для поисков. Если тебе вообще удастся что-либо узнать, то ты узнаешь это там.
	B_LogEntry(TOPIC_Redlight,"Мортис полагает, что если я хочу купить болотную траву в портовом квартале, мне лучше снять все доспехи. Лучше всего попытать счастья в таверне или борделе.");
};


instance DIA_Mortis_CanTeach(C_Info)
{
	npc = Mil_314_Mortis;
	nr = 5;
	condition = DIA_Mortis_CanTeach_Condition;
	information = DIA_Mortis_CanTeach_Info;
	permanent = TRUE;
	description = "Я хочу стать сильнее.";
};


func int DIA_Mortis_CanTeach_Condition()
{
	if(Mortis_TeachSTR == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Mortis_CanTeach_Info()
{
	AI_Output(other,self,"DIA_Mortis_CanTeach_15_00");	//Я хочу стать сильнее.

	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Mortis_CanTeach_13_01");	//Понятно! Если у тебя достаточно опыта, я могу потренировать тебя.
		Mortis_TeachSTR = TRUE;
		Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
		B_LogEntry(TOPIC_CityTeacher,"Мортис, городской гвардеец, может помочь мне повысить мою силу.");
	}
	else
	{
		AI_Output(self,other,"DIA_Mortis_CanTeach_13_02");	//Конечно, хочешь! Но пока ты не станешь одним из нас или паладином, я не буду помогать тебе.
	};
};

instance DIA_Mortis_Trade(C_Info)
{
	npc = Mil_314_Mortis;
	nr = 80;
	condition = DIA_Mortis_Trade_Condition;
	information = DIA_Mortis_Trade_Info;
	trade = TRUE;
	permanent = TRUE;
	description = "Что ты можешь предложить?";
};

func int DIA_Mortis_Trade_Condition()
{
	if(Wld_IsTime(7,0,23,59) && ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL)))
	{
		return TRUE;
	};
};

func void DIA_Mortis_Trade_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Addon_Martin_Trade_15_00");	//Что ты можешь предложить?

	if((MilBelt_01 == FALSE) && ((hero.guild == GIL_MIL) || (hero.guild == GIL_MIL)))
	{
		CreateInvItems(self,ItBE_Addon_MIL_01,1);
		MilBelt_01 = TRUE;
	};
	if((MilBelt_02 == FALSE) && ((hero.guild == GIL_MIL) || (hero.guild == GIL_MIL)))
	{
		CreateInvItems(self,ItBE_Addon_MIL_02,1);
		MilBelt_02 = TRUE;
	};

	B_GiveTradeInv(self);
	Npc_RemoveInvItems(self,itmiswordrawhot_1,Npc_HasItems(self,itmiswordrawhot_1));
	Npc_RemoveInvItems(self,itmiswordblade_1,Npc_HasItems(self,itmiswordblade_1));
	Npc_RemoveInvItems(self,ItMiSwordbladehot,Npc_HasItems(self,ItMiSwordbladehot));
};

instance DIA_Mortis_Teach(C_Info)
{
	npc = Mil_314_Mortis;
	nr = 100;
	condition = DIA_Mortis_Teach_Condition;
	information = DIA_Mortis_Teach_Info;
	permanent = TRUE;
	description = "Я хочу стать сильнее.";
};

func int DIA_Mortis_Teach_Condition()
{
	if(Mortis_TeachSTR == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Mortis_Teach_Info()
{
	AI_Output(other,self,"DIA_Mortis_Teach_15_00");	//Я хочу стать сильнее.
	Info_ClearChoices(DIA_Mortis_Teach);
	Info_AddChoice(DIA_Mortis_Teach,Dialog_Back,DIA_Mortis_Teach_BACK);
	Info_AddChoice(DIA_Mortis_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Mortis_Teach_1);
	Info_AddChoice(DIA_Mortis_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Mortis_Teach_5);
};

func void DIA_Mortis_Teach_BACK()
{
	if(other.attribute[ATR_STRENGTH] >= T_LOW)
	{
		AI_Output(self,other,"DIA_Mortis_Teach_13_00");	//Ты и так достаточно силен. Если же ты стремишься к большему, найди себе другого учителя.
	};
	Info_ClearChoices(DIA_Mortis_Teach);
};

func void DIA_Mortis_Teach_1()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_LOW);
	Info_ClearChoices(DIA_Mortis_Teach);
	Info_AddChoice(DIA_Mortis_Teach,Dialog_Back,DIA_Mortis_Teach_BACK);
	Info_AddChoice(DIA_Mortis_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Mortis_Teach_1);
	Info_AddChoice(DIA_Mortis_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Mortis_Teach_5);
};

func void DIA_Mortis_Teach_5()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_LOW);
	Info_ClearChoices(DIA_Mortis_Teach);
	Info_AddChoice(DIA_Mortis_Teach,Dialog_Back,DIA_Mortis_Teach_BACK);
	Info_AddChoice(DIA_Mortis_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Mortis_Teach_1);
	Info_AddChoice(DIA_Mortis_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Mortis_Teach_5);
};


instance DIA_Mortis_PICKPOCKET(C_Info)
{
	npc = Mil_314_Mortis;
	nr = 900;
	condition = DIA_Mortis_PICKPOCKET_Condition;
	information = DIA_Mortis_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Mortis_PICKPOCKET_Condition()
{
	return C_Beklauen(38,60);
};

func void DIA_Mortis_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Mortis_PICKPOCKET);
	Info_AddChoice(DIA_Mortis_PICKPOCKET,Dialog_Back,DIA_Mortis_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Mortis_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Mortis_PICKPOCKET_DoIt);
};

func void DIA_Mortis_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Mortis_PICKPOCKET);
};

func void DIA_Mortis_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Mortis_PICKPOCKET);
};


instance DIA_MORTIS_ARMORCANTEACH(C_Info)
{
	npc = Mil_314_Mortis;
	nr = 5;
	condition = dia_mortis_armorcanteach_condition;
	information = dia_mortis_armorcanteach_info;
	permanent = TRUE;
	description = "Как насчет доспехов получше?";
};

func int dia_mortis_armorcanteach_condition()
{
	if((MORTIS_TEACHARMOR == FALSE) && ((other.guild == GIL_MIL) || (other.guild == GIL_PAL)))
	{
		return TRUE;
	};
};

func void dia_mortis_armorcanteach_info()
{
	AI_Output(other,self,"DIA_Mortis_ArmorCanTeach_01_00");	//Как насчет доспехов получше?
	AI_Output(self,other,"DIA_Mortis_ArmorCanTeach_01_01");	//Каких доспехов?
	AI_Output(other,self,"DIA_Mortis_ArmorCanTeach_01_02");	//Ты ведь кузнец, и наверняка разбираешься в ковке брони. Неправда ли?
	AI_Output(self,other,"DIA_Mortis_ArmorCanTeach_01_03");	//И что с того?
	AI_Output(other,self,"DIA_Mortis_ArmorCanTeach_01_04");	//Ну, вот я и подумал, что, может, ты бы смог продать или выковать для меня доспех получше того, что сейчас на мне.
	AI_Output(self,other,"DIA_Mortis_ArmorCanTeach_01_05");	//Хмм...(смеется) Да, я делаю доспехи для солдат ополчения. Но, даже несмотря на то, что ты один из нас, я не смогу тебе ничего продать.
	AI_Output(self,other,"DIA_Mortis_ArmorCanTeach_01_06");	//Лорд Андрэ мне голову открутит, если узнает об этом. Нет, парень, забудь об этом!
	AI_Output(self,other,"DIA_Mortis_ArmorCanTeach_01_07");	//Но... если тебе это так нужно, я бы мог тебе показать, как улучшить некоторые доспехи.
	AI_Output(self,other,"DIA_Mortis_ArmorCanTeach_01_08");	//Правда, для этого ты должен хотя бы немного разбираться в ковке.

	if(Npc_GetTalentSkill(other,NPC_TALENT_SMITH) > 0)
	{
		AI_Output(other,self,"DIA_Mortis_ArmorCanTeach_01_09");	//Да, я немного разбираюсь в этом деле.
		AI_Output(self,other,"DIA_Mortis_ArmorCanTeach_01_10");	//Вижу, вижу...(смеется) Хорошо! Но только учти, мои уроки не бесплатные. Так что если у тебя нет золота, даже и не думай беспокоить меня!
		AI_Output(self,other,"DIA_Mortis_ArmorCanTeach_01_11");	//Ну а так, просто скажи, как будешь готов. И мы начнем твое обучение.
	}
	else
	{
		AI_Output(self,other,"DIA_Mortis_ArmorCanTeach_01_12");	//А я вижу, что ты даже и с кузнечным молотом не умеешь обращаться, как следует.
		AI_Output(self,other,"DIA_Mortis_ArmorCanTeach_01_13");	//Иди сначала научись ковать. А потом мы поговорим о твоих доспехах.
		AI_Output(self,other,"DIA_Mortis_ArmorCanTeach_01_14");	//И еще учти, мои уроки не бесплатные. Так что если у тебя нет золота, даже и не думай беспокоить меня!
	};
	MORTIS_TEACHARMOR = TRUE;
	Log_CreateTopic(TOPIC_ARMORTEACHER,LOG_NOTE);
	B_LogEntry(TOPIC_ARMORTEACHER,"Мортис может научить меня улучшать доспехи городского ополчения.");
};

func void b_mortis_teacharmor_1()
{
	AI_Output(self,other,"DIA_Mortis_TeachArmor_1_01_01");	//Хорошо, смотри внимательно как это делается. Берешь нужные материалы и...

	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"NW_CITY_KASERN_ARMORY_ANVIL");
		AI_AlignToWP(self);
		AI_UseMob(self,"BSANVIL",5);
		AI_Output(self,other,"DIA_Mortis_TeachArmor_1_01_02");	//...на наковальне добавляешь их в нужной последовательности к разогретой стальной заготовке...
		AI_Output(self,other,"DIA_Mortis_TeachArmor_1_01_03");	//...после чего придаешь ей необходимую форму и скрепляешь с имеющимся доспехом...
		AI_Output(self,other,"DIA_Mortis_TeachArmor_1_01_04");	//...вот так, как это делаю я сейчас...(показывает)
		AI_UseMob(self,"BSANVIL",-1);
		B_TurnToNpc(self,other);
		AI_Output(self,other,"DIA_Mortis_TeachArmor_1_01_05");	//...вот и все!
		AI_Output(self,other,"DIA_Mortis_TeachArmor_1_01_06");	//Теперь ты можешь попробовать сделать это сам.
	};
};

func void b_mortis_teacharmor_2()
{
	AI_Output(self,other,"DIA_Mortis_TeachArmor_2_01_01");	//Отлично. Запоминай тщательно все, что я тебе сейчас буду показывать. Прежде всего, тебе необходимо иметь под рукой все материалы для ковки...

	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"NW_CITY_KASERN_ARMORY_ANVIL");
		AI_AlignToWP(self);
		AI_UseMob(self,"BSANVIL",5);
		AI_Output(self,other,"DIA_Mortis_TeachArmor_2_01_02");	//...берешь раскаленную стальную заготовку и разбиваешь ее на несколько составных частей...
		AI_Output(self,other,"DIA_Mortis_TeachArmor_2_01_03");	//...в определенной последовательности смешивая каждую часть с очередным материалом...
		AI_Output(self,other,"DIA_Mortis_TeachArmor_2_01_04");	//...потом вковываешь их в каркас имеющейся брони, особенно тщательно проковывая места схода. Вот так, видишь...(показывает)
		AI_UseMob(self,"BSANVIL",-1);
		B_TurnToNpc(self,other);
		AI_Output(self,other,"DIA_Mortis_TeachArmor_2_01_05");	//...и всего то-делов!
		AI_Output(self,other,"DIA_Mortis_TeachArmor_2_01_06");	//Ничего сложного, поверь мне. Главное запомни правильную последовательность действий.
	};
};

func void b_mortisarmorchoices()
{
	Info_ClearChoices(dia_mortis_armorteach);
	Info_AddChoice(dia_mortis_armorteach,Dialog_Back,dia_mortis_armorteach_back);

	if(PLAYER_TALENT_SMITH[13] == FALSE)
	{
		Info_AddChoice(dia_mortis_armorteach,"Доспехи ополчения (Цена обучения: 500 монет)",dia_mortis_armorteach_itar_mil_l_v1);
	};
	if((PLAYER_TALENT_SMITH[14] == FALSE) && (SHOW_ITAR_MIL_M == TRUE))
	{
		Info_AddChoice(dia_mortis_armorteach,"Тяжелые доспехи ополчения (Цена обучения: 1000 монет)",dia_mortis_armorteach_itar_mil_m_v1);
	};
};

instance DIA_MORTIS_ARMORTEACH(C_Info)
{
	npc = Mil_314_Mortis;
	nr = 5;
	condition = dia_mortis_armorteach_condition;
	information = dia_mortis_armorteach_info;
	permanent = TRUE;
	description = "Научи меня улучшать доспехи.";
};

func int dia_mortis_armorteach_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_SMITH) > 0) && (MORTIS_TEACHARMOR == TRUE) && ((other.guild == GIL_MIL) || (other.guild == GIL_PAL)))
	{
		if((PLAYER_TALENT_SMITH[14] == FALSE) || (PLAYER_TALENT_SMITH[13] == FALSE))
		{
			return TRUE;
		};
	};
};

func void dia_mortis_armorteach_info()
{
	AI_Output(other,self,"DIA_Mortis_ArmorTeach_01_00");	//Научи меня улучшать доспехи.

	if(Wld_IsTime(7,10,20,59))
	{
		AI_Output(self,other,"DIA_Mortis_ArmorTeach_01_01");	//Хорошо. Что ты хочешь знать?
		b_mortisarmorchoices();
	}
	else
	{
		AI_Output(self,other,"DIA_Mortis_ArmorTeach_01_02");	//Парень, но сейчас же ночь на дворе! И к тому же на сегодня я уже закончил работать.
		AI_Output(self,other,"DIA_Mortis_ArmorTeach_01_03");	//И потом, где я тебе, по-твоему, буду все это объяснять и показывать...(смеется)
		AI_Output(self,other,"DIA_Mortis_ArmorTeach_01_04");	//Приходи утром, когда я буду в кузне. Тогда и поговорим об этом.
	};
};

func void dia_mortis_armorteach_back()
{
	Info_ClearChoices(dia_mortis_armorteach);
};

func void dia_mortis_armorteach_itar_mil_l_v1()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= 500)
	{
		ARMORTEACHFLAG = TRUE;

		if(B_TeachPlayerTalentSmith_RemakeArmor_NoLP(self,other,WEAPON_ITAR_MIL_L_V1))
		{
			Npc_RemoveInvItems(hero,ItMi_Gold,500);
			b_mortis_teacharmor_2();
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Mortis_TeachArmor_01_00");	//Но у тебя же не хватает золота! Разве я тебе об этом не говорил?
	};
	b_mortisarmorchoices();
};

func void dia_mortis_armorteach_itar_mil_m_v1()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= 1000)
	{
		ARMORTEACHFLAG = TRUE;

		if(B_TeachPlayerTalentSmith_RemakeArmor_NoLP(self,other,WEAPON_ITAR_MIL_M_V1))
		{
			Npc_RemoveInvItems(hero,ItMi_Gold,1000);
			b_mortis_teacharmor_1();
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Mortis_TeachArmor_01_00");	//Но у тебя же не хватает золота! Разве я тебе об этом не говорил?
	};
	b_mortisarmorchoices();
};