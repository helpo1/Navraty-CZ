
instance DIA_JORU_EXIT(C_Info)
{
	npc = sek_8013_joru;
	nr = 999;
	condition = dia_joru_exit_condition;
	information = dia_joru_exit_info;
	important = FALSE;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_joru_exit_condition()
{
	return TRUE;
};

func void dia_joru_exit_info()
{
	AI_StopProcessInfos(self);
};

instance dia_joru_PICKPOCKET(C_Info)
{
	npc = sek_8013_joru;
	nr = 900;
	condition = dia_joru_PICKPOCKET_Condition;
	information = dia_joru_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int dia_joru_PICKPOCKET_Condition()
{
	return C_Beklauen(20,43);
};

func void dia_joru_PICKPOCKET_Info()
{
	Info_ClearChoices(dia_joru_PICKPOCKET);
	Info_AddChoice(dia_joru_PICKPOCKET,Dialog_Back,dia_joru_PICKPOCKET_BACK);
	Info_AddChoice(dia_joru_PICKPOCKET,DIALOG_PICKPOCKET,dia_joru_PICKPOCKET_DoIt);
};

func void dia_joru_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(dia_joru_PICKPOCKET);
};

func void dia_joru_PICKPOCKET_BACK()
{
	Info_ClearChoices(dia_joru_PICKPOCKET);
};

instance DIA_JORU_HELLO(C_Info)
{
	npc = sek_8013_joru;
	nr = TRUE;
	condition = dia_joru_hello_condition;
	information = dia_joru_hello_info;
	permanent = FALSE;
	description = "Привет! Я здесь новенький - расскажи мне о Лагере.";
};


func int dia_joru_hello_condition()
{
	return TRUE;
};

func void dia_joru_hello_info()
{
	AI_Output(other,self,"DIA_Joru_Hello_15_00");	//Привет! Я здесь новенький и мне нужно, чтобы кто-нибудь рассказал мне о Лагере.

	if(PSI_TALK == TRUE)
	{
		AI_Output(self,other,"DIA_Joru_Hello_11_01");	//Ты выбрал не самое удачное время. Стражи готовятся к бою, и мы работаем день и ночь.
		AI_Output(self,other,"DIA_Joru_Hello_11_02");	//У меня нет времени на болтовню. Так что не отвлекай меня - если, конечно, ты не хочешь что-нибудь купить.
		Log_CreateTopic(TOPIC_TRADERPSI,LOG_NOTE);
		B_LogEntry(TOPIC_TRADERPSI,"Кузнец Йору кует и продает оружие. Он практически все время работает в кузнице.");
	}
	else
	{
		AI_Output(self,other,"DIA_Joru_Hello_11_03");	//У меня нет времени на болтовню. Так что не отвлекай меня.
	};
};

instance DIA_JORU_TRADE(C_Info)
{
	npc = sek_8013_joru;
	nr = 800;
	condition = dia_joru_trade_condition;
	information = dia_joru_trade_info;
	permanent = TRUE;
	description = "Покажи, что у тебя есть.";
	trade = TRUE;
};

func int dia_joru_trade_condition()
{
	if(Npc_KnowsInfo(hero,dia_joru_hello) && (PSI_TALK == TRUE) && Wld_IsTime(7,0,22,0))
	{
		return TRUE;
	};
};

func void dia_joru_trade_info()
{
	var int daynow;
	daynow = Wld_GetDay();

	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Joru_Trade_15_00");	//Покажи, что у тебя есть.
	AI_Output(self,other,"DIA_Joru_Trade_11_01");	//Другое дело! Вот, здесь все, что есть у меня сегодня.
	Npc_RemoveInvItems(self,itmiswordrawhot_1,Npc_HasItems(self,itmiswordrawhot_1));
	Npc_RemoveInvItems(self,itmiswordblade_1,Npc_HasItems(self,itmiswordblade_1));
	Npc_RemoveInvItems(self,ItMiSwordbladehot,Npc_HasItems(self,ItMiSwordbladehot));

	if((SekBelt_01 == FALSE) && ((hero.guild == GIL_SEK) || (hero.guild == GIL_TPL) || (hero.guild == GIL_GUR)))
	{
		CreateInvItems(self,ItBE_Addon_SEK_01,1);
		SekBelt_01 = TRUE;
	};

	B_GiveTradeInv(self);
};


instance DIA_JORU_ARMORCANTEACH(C_Info)
{
	npc = sek_8013_joru;
	nr = 5;
	condition = dia_joru_armorcanteach_condition;
	information = dia_joru_armorcanteach_info;
	permanent = TRUE;
	description = "Ты умеешь ковать доспехи?";
};

func int dia_joru_armorcanteach_condition()
{
	if((JORU_TEACHARMOR == FALSE) && Npc_KnowsInfo(hero,dia_joru_hello) && (PSI_TALK == TRUE) && ((hero.guild == GIL_GUR) || (hero.guild == GIL_SEK) || (hero.guild == GIL_NONE) || (other.guild == GIL_TPL)))
	{
		return TRUE;
	};
};

func void dia_joru_armorcanteach_info()
{
	AI_Output(other,self,"DIA_Joru_ArmorCanTeach_01_00");	//Ты умеешь ковать доспехи?
	AI_Output(self,other,"DIA_Joru_ArmorCanTeach_01_01");	//Я не очень хорошо в этом разбираюсь. Не то, что Даррион!
	AI_Output(self,other,"DIA_Joru_ArmorCanTeach_01_02");	//Он был настоящим мастером этого дела и ковал доспехи для всех Стражей болотного Братства.
	AI_Output(other,self,"DIA_Joru_ArmorCanTeach_01_03");	//А где сейчас Даррион?
	AI_Output(self,other,"DIA_Joru_ArmorCanTeach_01_04");	//Этого никто не знает. Уже давно ничего о нем не было слышно, и кто знает, что с ним стало!
	AI_Output(self,other,"DIA_Joru_ArmorCanTeach_01_05");	//Так что, если ты хотел научиться ковать хорошие прочные доспехи, - кроме него вряд ли кто-то смог бы тебе помочь.
	AI_Output(self,other,"DIA_Joru_ArmorCanTeach_01_06");	//Единственное, что могу сделать я, так это показать тебе, как можно немного улучшить набедренную повязку новичка...
	AI_Output(self,other,"DIA_Joru_ArmorCanTeach_01_07");	//...или, скажем, я мог бы продать тебе один из доспехов наших послушников. Конечно, при том условии, что ты являешься одним из наших братьев.
	AI_Output(other,self,"DIA_Joru_ArmorCanTeach_01_08");	//Что необходимо для того, чтобы ты показал мне, как улучшить набедренную повязку?
	AI_Output(self,other,"DIA_Joru_ArmorCanTeach_01_09");	//Ну, для начала тебе необходимо хотя бы немного разбираться в ковке.

	if(Npc_GetTalentSkill(other,NPC_TALENT_SMITH) > 0)
	{
		AI_Output(other,self,"DIA_Joru_ArmorCanTeach_01_10");	//Я немного разбираюсь в ковке.
		AI_Output(self,other,"DIA_Joru_ArmorCanTeach_01_11");	//Что же, уже неплохо!
		AI_Output(self,other,"DIA_Joru_ArmorCanTeach_01_12");	//Правда, ты, наверное, сам понимаешь, тебе за это придется заплатить.
		AI_Output(self,other,"DIA_Joru_ArmorCanTeach_01_13");	//А так, только скажи, и мы приступим к твоему обучению.
	}
	else
	{
		AI_Output(self,other,"DIA_Joru_ArmorCanTeach_01_14");	//А как я вижу, ты и понятия не имеешь даже, как держать молот.
		AI_Output(self,other,"DIA_Joru_ArmorCanTeach_01_15");	//Так что, парень, иди сначала научись ковать. Научишься - тогда и приходи.
		AI_Output(self,other,"DIA_Joru_ArmorCanTeach_01_16");	//И еще. Сам понимаешь, за мои уроки тебе придется заплатить.
	};
	JORU_TEACHARMOR = TRUE;
	Log_CreateTopic(TOPIC_ARMORTEACHER,LOG_NOTE);
	B_LogEntry(TOPIC_ARMORTEACHER,"Йору может показать мне, как улучшить набедренную повязку послушника. Доспехи для всех Стражей болотного Братства ковал Даррион, он же мог и обучить перековке доспехов Стражей. Но Йору не знает, где Даррион сейчас.");
};

func void b_joru_teacharmor_1()
{
	AI_Output(self,other,"DIA_Joru_TeachArmor_1_01_01");	//Итак, приступим. Проверь, что все необходимые материалы у тебя под рукой. Берешь разогретую стальную заготовку...

	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"NW_PSICAMP_SMITH_ANVIL");
		AI_AlignToWP(self);
		AI_UseMob(self,"BSANVIL",5);
		AI_Output(self,other,"DIA_Joru_TeachArmor_1_01_02");	//...на наковальне придаешь ей форму пластины и вковываешь в нее кусок заготовки....
		AI_Output(self,other,"DIA_Joru_TeachArmor_1_01_03");	//...далее делаешь крепления и соединяешь пластину с ним, тщательно проковывая места схода...
		AI_Output(self,other,"DIA_Joru_TeachArmor_1_01_04");	//...после этого тщательно крепишь полученный элемент на корпус доспеха - вот таким образом...смотри...(показывает)
		AI_UseMob(self,"BSANVIL",-1);
		B_TurnToNpc(self,other);
		AI_Output(self,other,"DIA_Joru_TeachArmor_1_01_05");	//...готово!
		AI_Output(self,other,"DIA_Joru_TeachArmor_1_01_06");	//Это все, что тебе следует знать, чтобы улучшить этот доспех.
	};
};

func void b_joruarmorchoices()
{
	Info_ClearChoices(dia_joru_armorteach);
	Info_AddChoice(dia_joru_armorteach,Dialog_Back,dia_joru_armorteach_back);

	if(PLAYER_TALENT_SMITH[28] == FALSE)
	{
		Info_AddChoice(dia_joru_armorteach,"Набедренный кушак Братства (Цена обучения: 200 монет)",dia_joru_armorteach_itar_sekbed_v1);
	};
	if((PLAYER_TALENT_SMITH[29] == FALSE) && (BuyTemplerLight == TRUE))
	{
		Info_AddChoice(dia_joru_armorteach,B_BuildLearnStringEx("Легкие доспехи Стража (Цена обучения: 3000 монет",B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_ITAR_TPL_L_V1)),dia_joru_armorteach_itar_tpl_l_v1);
	};
};

instance DIA_JORU_ARMORTEACH(C_Info)
{
	npc = sek_8013_joru;
	nr = 5;
	condition = dia_joru_armorteach_condition;
	information = dia_joru_armorteach_info;
	permanent = TRUE;
	description = "Научи меня улучшать доспехи.";
};

func int dia_joru_armorteach_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_SMITH) > 0) && (JORU_TEACHARMOR == TRUE) && ((hero.guild == GIL_GUR) || (hero.guild == GIL_SEK) || (other.guild == GIL_TPL)))
	{
		if((PLAYER_TALENT_SMITH[28] == FALSE) || (PLAYER_TALENT_SMITH[29] == FALSE))
		{
			return TRUE;
		};
	};
};

func void dia_joru_armorteach_info()
{
	AI_Output(other,self,"DIA_Joru_ArmorTeach_01_00");	//Научи меня улучшать доспехи.
	if(Wld_IsTime(7,0,22,0))
	{
		AI_Output(self,other,"DIA_Joru_ArmorTeach_01_01");	//И что же ты хочешь узнать?
		b_joruarmorchoices();
	}
	else
	{
		AI_Output(self,other,"DIA_Joru_ArmorTeach_01_02");	//На сегодня я уже закончил работать в кузне.
		AI_Output(self,other,"DIA_Joru_ArmorTeach_01_03");	//Приходи завтра утром, тогда и поговорим об этом.
	};
};

func void dia_joru_armorteach_back()
{
	Info_ClearChoices(dia_joru_armorteach);
};

func void dia_joru_armorteach_itar_sekbed_v1()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= 200)
	{
		ARMORTEACHFLAG = TRUE;

		if(B_TeachPlayerTalentSmith_RemakeArmor_NoLP(self,other,WEAPON_ITAR_SEKBED_V1))
		{
			Npc_RemoveInvItems(hero,ItMi_Gold,200);
			b_joru_teacharmor_1();
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Joru_TeachArmor_04_00");	//У тебя не хватает золота! Приходи, когда оно у тебя будет.
	};

	b_joruarmorchoices();
};

func void dia_joru_armorteach_itar_tpl_l_v1()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= 3000)
	{
		ARMORTEACHFLAG = TRUE;

		if(B_TeachPlayerTalentSmith(self,other,WEAPON_ITAR_TPL_L_V1))
		{
			Npc_RemoveInvItems(hero,ItMi_Gold,3000);
			b_joru_teacharmor_1();
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Joru_TeachArmor_04_00");	//У тебя не хватает золота! Приходи, когда оно у тебя будет.
	};

	b_joruarmorchoices();
};


instance DIA_JORU_TRADEARMOR(C_Info)
{
	npc = sek_8013_joru;
	nr = 3;
	condition = dia_joru_tradearmor_condition;
	information = dia_joru_tradearmor_info;
	permanent = TRUE;
	description = "Продай мне доспехи послушника.";
};


func int dia_joru_tradearmor_condition()
{
	if((other.guild == GIL_SEK) && (PSI_TALK == TRUE) && ((JORU_TRADEARMOR_MIDDLE == FALSE) || (JORU_TRADEARMOR_MIDDLE2 == FALSE)))
	{
		return TRUE;
	};
};

func void dia_joru_tradearmor_info()
{
	AI_Output(other,self,"DIA_Joru_TradeArmor_01_00");	//Продай мне доспехи послушника.
	Info_ClearChoices(dia_joru_tradearmor);
	Info_AddChoice(dia_joru_tradearmor,Dialog_Back,dia_joru_tradearmor_back);
	if(JORU_TRADEARMOR_MIDDLE == FALSE)
	{
		Info_AddChoice(dia_joru_tradearmor,"Тяжелые доспехи послушника (Цена: 1000 монет)",dia_joru_tradearmor_buy1);
	};
	if(JORU_TRADEARMOR_MIDDLE2 == FALSE)
	{
		Info_AddChoice(dia_joru_tradearmor,"Доспехи послушника (Цена: 450 монет)",dia_joru_tradearmor_buy11);
	};
};

func void dia_joru_tradearmor_back()
{
	Info_ClearChoices(dia_joru_tradearmor);
};

func void dia_joru_tradearmor_buy1()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,VALUE_ITAR_SLP_L))
	{
		AI_Output(self,other,"DIA_Joru_TradeArmor_Buy1_01_01");	//Отлично!
		AI_Print("Получен тяжелый доспех послушника");
		CreateInvItems(other,itar_slp_l,1);
		JORU_TRADEARMOR_MIDDLE = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Joru_TradeArmor_Buy1_01_02");	//Нет денег - нет доспеха.
	};
	Info_ClearChoices(dia_joru_tradearmor);
};

func void dia_joru_tradearmor_buy11()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,450))
	{
		AI_Output(self,other,"DIA_Joru_TradeArmor_Buy1_01_01");	//Отлично!
		AI_Print("Получен доспех послушника");
		CreateInvItems(other,itar_slp_ul,1);
		JORU_TRADEARMOR_MIDDLE2 = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Joru_TradeArmor_Buy1_01_02");	//Нет денег - нет доспеха.
	};
	Info_ClearChoices(dia_joru_tradearmor);
};


instance DIA_JORU_SEKTEHEILEN(C_Info)
{
	npc = sek_8013_joru;
	nr = 1;
	condition = dia_joru_sekteheilen_condition;
	information = dia_joru_sekteheilen_info;
	permanent = FALSE;
	description = "Выпей напиток! Он помогает от головной боли.";
};


func int dia_joru_sekteheilen_condition()
{
	if((Npc_HasItems(other,ItPo_HealObsession_MIS) > 0) && (MIS_SEKTEHEILEN == LOG_Running) && Npc_KnowsInfo(hero,dia_baalorun_sekteheilengot))
	{
		return TRUE;
	};
};

func void dia_joru_sekteheilen_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Joru_SekteHeilen_01_00");	//Выпей напиток! Он помогает от головной боли.
	B_GiveInvItems(other,self,ItPo_HealObsession_MIS,1);
	B_UseItem(self,ItPo_HealObsession_MIS);
	SEKTEHEILENCOUNT = SEKTEHEILENCOUNT + 1;
	AI_Output(self,other,"DIA_Joru_SekteHeilen_01_01");	//Мое самочувствие улучшилось!
	AI_Output(self,other,"DIA_Joru_SekteHeilen_01_02");	//Большое спасибо!
};

instance DIA_Joru_DoCrossBow(C_Info)
{
	npc = sek_8013_joru;
	nr = 1;
	condition = DIA_Joru_DoCrossBow_condition;
	information = DIA_Joru_DoCrossBow_info;
	permanent = FALSE;
	description = "Ты умеешь делать арбалеты?";
};

func int DIA_Joru_DoCrossBow_condition()
{
	if((MIS_TagNorGrHunWeap == LOG_Running) && (FindSmithTeacherCrBow == TRUE) && (CrossBowNeedPlotnik == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Joru_DoCrossBow_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Joru_DoCrossBow_01_01");	//Ты умеешь делать арбалеты?
	AI_Output(self,other,"DIA_Joru_DoCrossBow_01_02");	//Арбалеты? Не-а. Это тебе надо найти плотника или столяра.
	AI_Output(other,self,"DIA_Joru_DoCrossBow_01_05");	//Понял.
	CrossBowNeedPlotnik = TRUE;
	B_LogEntry(TOPIC_TagNorGrHunWeap,"Делать арбалеты меня может научить только плотник или столяр.");
};