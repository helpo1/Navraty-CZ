
instance XBS_7513_DARRION_EXIT(C_Info)
{
	npc = xbs_7513_darrion;
	nr = 999;
	condition = xbs_7513_darrion_exit_condition;
	information = xbs_7513_darrion_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int xbs_7513_darrion_exit_condition()
{
	return TRUE;
};

func void xbs_7513_darrion_exit_info()
{
	Npc_RemoveInvItems(self,ItMw_1H_AssBlade_View,Npc_HasItems(self,ItMw_1H_AssBlade_View));
	AI_StopProcessInfos(self);
};


instance XBS_7513_DARRION_NO_TALK(C_Info)
{
	npc = xbs_7513_darrion;
	nr = 1;
	condition = xbs_7513_darrion_no_talk_condition;
	information = xbs_7513_darrion_no_talk_info;
	permanent = TRUE;
	important = TRUE;
};


func int xbs_7513_darrion_no_talk_condition()
{
	if((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void xbs_7513_darrion_no_talk_info()
{
	B_Say(self,other,"$SPAREME");
	B_Say(self,other,"$NEVERENTERROOMAGAIN");
	AI_StopProcessInfos(self);
};


instance XBS_7513_DARRION_PICKPOCKET(C_Info)
{
	npc = xbs_7513_darrion;
	nr = 900;
	condition = xbs_7513_darrion_pickpocket_condition;
	information = xbs_7513_darrion_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int xbs_7513_darrion_pickpocket_condition()
{
	return C_Beklauen(85,102);
};

func void xbs_7513_darrion_pickpocket_info()
{
	Info_ClearChoices(xbs_7513_darrion_pickpocket);
	Info_AddChoice(xbs_7513_darrion_pickpocket,Dialog_Back,xbs_7513_darrion_pickpocket_back);
	Info_AddChoice(xbs_7513_darrion_pickpocket,DIALOG_PICKPOCKET,xbs_7513_darrion_pickpocket_doit);
};

func void xbs_7513_darrion_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(xbs_7513_darrion_pickpocket);
};

func void xbs_7513_darrion_pickpocket_back()
{
	Info_ClearChoices(xbs_7513_darrion_pickpocket);
};


instance XBS_7513_DARRION_HI(C_Info)
{
	npc = xbs_7513_darrion;
	nr = 1;
	condition = xbs_7513_darrion_hi_condition;
	information = xbs_7513_darrion_hi_info;
	permanent = FALSE;
	description = "Как дела, мастер?";
};

func int xbs_7513_darrion_hi_condition()
{
	return TRUE;
};

func void xbs_7513_darrion_hi_info()
{
	AI_Output(other,self,"XBS_7513_Darrion_Hi_15_00");	//Как дела, мастер?
	AI_Output(self,other,"XBS_7513_Darrion_Hi_06_01");	//Все как обычно.
	AI_Output(other,self,"XBS_7513_Darrion_Hi_15_02");	//Ты меня не помнишь?
	AI_Output(self,other,"XBS_7513_Darrion_Hi_06_03");	//Что-то припоминаю...(задумчиво) Впрочем, ничего удивительного - тут все свои.
	AI_Output(other,self,"XBS_7513_Darrion_Hi_15_04");	//А могу я купить у мастера оружие или кузнечные принадлежности?
	AI_Output(self,other,"XBS_7513_Darrion_Hi_06_06");	//Конечно. Но только тогда, когда я в кузнице.
	AI_Output(self,other,"XBS_7513_Darrion_Hi_06_07");	//Вечером я отдыхаю - мы тут особо на работе не надрываемся.
	Log_CreateTopic(TOPIC_XBS,LOG_NOTE);
	B_LogEntry(TOPIC_XBS,"Даррион торгует материалами для кузницы и отмычками. Но только тогда, когда он в кузнице.");
};


instance XBS_7513_DARRION_BLITZ(C_Info)
{
	npc = xbs_7513_darrion;
	nr = 2;
	condition = xbs_7513_darrion_blitz_condition;
	information = xbs_7513_darrion_blitz_info;
	permanent = FALSE;
	description = "Как ты забрался в эти горы?";
};


func int xbs_7513_darrion_blitz_condition()
{
	if(Npc_KnowsInfo(other,xbs_7513_darrion_hi))
	{
		return TRUE;
	};
};

func void xbs_7513_darrion_blitz_info()
{
	AI_Output(other,self,"XBS_7513_Darrion_Blitz_15_00");	//Расскажи, как ты забрался в эти горы?
	AI_Output(self,other,"XBS_7513_Darrion_Blitz_06_01");	//В тот день, когда пал Барьер, в лагере наступил хаос.
	AI_Output(self,other,"XBS_7513_Darrion_Blitz_06_02");	//Мало кто сохранил остатки разума. Те, кто сумел это сделать, теперь в основном тут.
	AI_Output(other,self,"XBS_7513_Darrion_Blitz_15_03");	//А что делал ты?
	AI_Output(self,other,"XBS_7513_Darrion_Blitz_06_04");	//Я какое-то время, как и все, носился, потеряв разум. Пока не наткнулся на Нетбека.
	AI_Output(self,other,"XBS_7513_Darrion_Blitz_06_05");	//Он, наверное, был единственным спокойным человеком в долине. И я пошел за ним.
	AI_Output(self,other,"XBS_7513_Darrion_Blitz_06_06");	//Но я кузнец и далек от его деревьев. Поэтому и тут занимаюсь своим ремеслом.
};


instance XBS_7513_DARRION_TRADE(C_Info)
{
	npc = xbs_7513_darrion;
	nr = 888;
	condition = xbs_7513_darrion_trade_condition;
	information = xbs_7513_darrion_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = DIALOG_TRADE;
};

func int xbs_7513_darrion_trade_condition()
{
	if(Npc_KnowsInfo(other,xbs_7513_darrion_hi) && (Npc_GetDistToWP(self,"WP_COAST_FOREST_118") < 1000))
	{
		return TRUE;
	};
};

var int darionday;

func void xbs_7513_darrion_trade_info()
{
	var int daynow;

	daynow = Wld_GetDay();

	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	B_Say(other,self,"$TRADE_3");
	B_GiveTradeInv(self);
	Npc_RemoveInvItems(self,itmiswordrawhot_1,Npc_HasItems(self,itmiswordrawhot_1));
	Npc_RemoveInvItems(self,itmiswordblade_1,Npc_HasItems(self,itmiswordblade_1));
	Npc_RemoveInvItems(self,ItMiSwordbladehot,Npc_HasItems(self,ItMiSwordbladehot));
	Npc_RemoveInvItems(self,ItMw_1H_AssBlade_View,Npc_HasItems(self,ItMw_1H_AssBlade_View));
};


instance DIA_DARRION_ARMORCANTEACH(C_Info)
{
	npc = xbs_7513_darrion;
	nr = 5;
	condition = dia_darrion_armorcanteach_condition;
	information = dia_darrion_armorcanteach_info;
	permanent = TRUE;
	description = "Я слышал, что ты единственный, кто умеет ковать доспехи Стражей.";
};


func int dia_darrion_armorcanteach_condition()
{
	if((DARRION_TEACHARMOR == FALSE) && (hero.guild == GIL_TPL))
	{
		return TRUE;
	};
};

func void dia_darrion_armorcanteach_info()
{
	AI_Output(other,self,"DIA_Darrion_ArmorCanTeach_01_00");	//Я слышал, что ты единственный, кто умеет ковать доспехи Стражей.
	AI_Output(self,other,"DIA_Darrion_ArmorCanTeach_01_01");	//И это правда, поскольку я был единственным кузнецом на болотах. Мне приходилось ковать доспехи для всех братьев, и даже для самого Кор-Ангара.
	AI_Output(other,self,"DIA_Darrion_ArmorCanTeach_01_02");	//Ты можешь меня обучить этому ремеслу?
	AI_Output(self,other,"DIA_Darrion_ArmorCanTeach_01_03");	//Ну, почему бы и нет. Я мог бы показать тебе несколько способов улучшить твой доспех.
	AI_Output(self,other,"DIA_Darrion_ArmorCanTeach_01_04");	//Но для этого ты должен неплохо разбираться в ковке.

	if(Npc_GetTalentSkill(other,NPC_TALENT_SMITH) > 0)
	{
		AI_Output(other,self,"DIA_Darrion_ArmorCanTeach_01_05");	//Я довольно сносно разбираюсь в ковке.
		AI_Output(self,other,"DIA_Darrion_ArmorCanTeach_01_06");	//Ну хорошо, тогда можем начинать хоть сейчас.
		AI_Output(self,other,"DIA_Darrion_ArmorCanTeach_01_07");	//Но скажу сразу: не бесплатно.
	}
	else
	{
		AI_Output(self,other,"DIA_Darrion_ArmorCanTeach_01_09");	//А как я погляжу, ты в этом самый настоящий дилетант!
		AI_Output(self,other,"DIA_Darrion_ArmorCanTeach_01_10");	//Вот что, парень. Сперва научись основам кузнечного дела. И тогда мы поговорим о твоем обучении.
		AI_Output(self,other,"DIA_Darrion_ArmorCanTeach_01_11");	//И скажу сразу: бесплатно я этого делать не стану.
	};
	DARRION_TEACHARMOR = TRUE;
	Log_CreateTopic(TOPIC_ARMORTEACHER,LOG_NOTE);
	B_LogEntry(TOPIC_ARMORTEACHER,"Даррион может научить меня улучшать доспехи Стражей болотного Братства.");
};

func void b_darrion_teacharmor_4()
{
	AI_Output(self,other,"DIA_Darrion_TeachArmor_4_01_01");	//Что ж, приступим. Проверь, чтобы все необходимые материалы были у тебя под рукой. Берешь разогретую стальную заготовку...
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"WP_COAST_FOREST_117");
		AI_AlignToWP(self);
		AI_UseMob(self,"BSANVIL",5);
		AI_Output(self,other,"DIA_Darrion_TeachArmor_4_01_02");	//...на наковальне придаешь ей форму пластины и вковываешь в нее кусок магической руды...
		AI_Output(self,other,"DIA_Darrion_TeachArmor_4_01_03");	//...потом делаешь крепления и соединяешь пластину с ними, тщательно проковывая места схода...
		AI_Output(self,other,"DIA_Darrion_TeachArmor_4_01_04");	//...после этого тщательно крепишь полученный элемент на корпус доспеха - вот таким образом... смотри...
		AI_UseMob(self,"BSANVIL",-1);
		B_TurnToNpc(self,other);
		AI_Output(self,other,"DIA_Darrion_TeachArmor_4_01_05");	//...готово!
		AI_Output(self,other,"DIA_Darrion_TeachArmor_4_01_06");	//Это все, что тебе следует знать, чтобы улучшить этот доспех.
	};
};

func void b_darrion_teacharmor_5()
{
	AI_Output(self,other,"DIA_Darrion_TeachArmor_5_01_01");	//Для создания этого доспеха тебе потребуется много времени и усилий, но это того стоит...
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"WP_COAST_FOREST_117");
		AI_AlignToWP(self);
		AI_UseMob(self,"BSANVIL",5);
		AI_Output(self,other,"DIA_Darrion_TeachArmor_5_01_02");	//...возьми раскаленную стальную заготовку и раздели ее на две равные части...
		AI_Output(self,other,"DIA_Darrion_TeachArmor_5_01_03");	//...обработай каждую из них с помощью магической рудной крошки, а затем скрепи обе части и прокуй места схода...
		AI_Output(self,other,"DIA_Darrion_TeachArmor_5_01_04");	//...полученный элемент скрепляешь с доспехом по бокам с помощью металлической пластины... смотри, как я это делаю...
		AI_Output(self,other,"DIA_Darrion_TeachArmor_5_01_05");	//...видишь, как четко он сел, практически обтекая поверхность доспеха. Усиливаешь крепление металлическими болтами и...
		AI_UseMob(self,"BSANVIL",-1);
		B_TurnToNpc(self,other);
		AI_Output(self,other,"DIA_Darrion_TeachArmor_5_01_06");	//...все, доспех готов.
	};
};

func void b_darrion_teacharmor_6()
{
	AI_Output(self,other,"DIA_Darrion_TeachArmor_6_01_01");	//Овладев этим знанием, ты сможешь сделать невероятно прочный и надежный доспех.
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"WP_COAST_FOREST_117");
		AI_AlignToWP(self);
		AI_UseMob(self,"BSANVIL",5);
		AI_Output(self,other,"DIA_Darrion_TeachArmor_6_01_02");	//Смотри внимательно и запоминай. Берешь раскаленную стальную заготовку и на наковальне придаешь ей форму пластины...
		AI_Output(self,other,"DIA_Darrion_TeachArmor_6_01_03");	//...покрываешь полученный элемент магической рудной крошкой и поверху наносишь слой смоляного раствора...
		AI_Output(self,other,"DIA_Darrion_TeachArmor_6_01_04");	//...скрепляешь две таких пластины стальными болтами и крепишь на каркас брони... вот так, как я это делаю...
		AI_Output(self,other,"DIA_Darrion_TeachArmor_6_01_05");	//...это добавит прочности в местах крепления всех элементов доспеха. Еще немного подбиваем контур брони и...
		AI_UseMob(self,"BSANVIL",-1);
		B_TurnToNpc(self,other);
		AI_Output(self,other,"DIA_Darrion_TeachArmor_6_01_06");	//...все, доспех готов!
		AI_Output(self,other,"DIA_Darrion_TeachArmor_6_01_07");	//Теперь ты знаешь все, чему я мог научить тебя. Попробуй применить полученные знания на практике.
	};
};

func void b_darrionarmorchoices()
{
	Info_ClearChoices(dia_darrion_armorteach);
	Info_AddChoice(dia_darrion_armorteach,Dialog_Back,dia_darrion_armorteach_back);

	if((PLAYER_TALENT_SMITH[29] == FALSE) && (BuyTemplerLight == TRUE))
	{
		Info_AddChoice(dia_darrion_armorteach,B_BuildLearnStringEx("Легкие доспехи Стража (Цена обучения: 3000 монет",B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_ITAR_TPL_L_V1)),dia_darrion_armorteach_itar_tpl_l_v1);
	};
	if((PLAYER_TALENT_SMITH[30] == FALSE) && (BuyTemplerMed == TRUE))
	{
		Info_AddChoice(dia_darrion_armorteach,B_BuildLearnStringEx("Доспехи Стража (Цена обучения: 5000 монет",B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_ITAR_TPL_M_V1)),dia_darrion_armorteach_itar_tpl_m_v1);
	};
	if((PLAYER_TALENT_SMITH[31] == FALSE) && (BuyTemplerHeavy == TRUE))
	{
		Info_AddChoice(dia_darrion_armorteach,B_BuildLearnStringEx("Тяжелые доспехи Стража (Цена обучения: 7000 монет",B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_ITAR_TPL_S_V1)),dia_darrion_armorteach_itar_tpl_s_v1);
	};
};


instance DIA_DARRION_ARMORTEACH(C_Info)
{
	npc = xbs_7513_darrion;
	nr = 5;
	condition = dia_darrion_armorteach_condition;
	information = dia_darrion_armorteach_info;
	permanent = TRUE;
	description = "Научи меня улучшать доспехи.";
};


func int dia_darrion_armorteach_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_SMITH) > 0) && (DARRION_TEACHARMOR == TRUE) && (other.guild == GIL_TPL))
	{
		if((PLAYER_TALENT_SMITH[29] == FALSE) || (PLAYER_TALENT_SMITH[30] == FALSE) || (PLAYER_TALENT_SMITH[31] == FALSE))
		{
			return TRUE;
		};
	};
};

func void dia_darrion_armorteach_info()
{
	AI_Output(other,self,"DIA_Darrion_ArmorTeach_01_00");	//Научи меня улучшать доспехи.
	if(Wld_IsTime(8,0,20,0))
	{
		AI_Output(self,other,"DIA_Darrion_ArmorTeach_01_01");	//Что ты хочешь узнать?
		b_darrionarmorchoices();
	}
	else
	{
		AI_Output(self,other,"DIA_Darrion_ArmorTeach_01_02");	//На сегодня я уже закончил работать в кузнице...
		AI_Output(self,other,"DIA_Darrion_ArmorTeach_01_03");	//Приходи завтра утром, тогда и поговорим об этом.
	};
};

func void dia_darrion_armorteach_back()
{
	Info_ClearChoices(dia_darrion_armorteach);
};

func void dia_darrion_armorteach_itar_tpl_l_v1()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= 3000)
	{
		ARMORTEACHFLAG = TRUE;
		if(B_TeachPlayerTalentSmith(self,other,WEAPON_ITAR_TPL_L_V1))
		{
			Npc_RemoveInvItems(hero,ItMi_Gold,3000);
			b_darrion_teacharmor_4();
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Darrion_TeachArmor_04_00");	//А золотишка-то у тебя не хватает. Так что пока забудь об этом.
	};
	b_darrionarmorchoices();
};

func void dia_darrion_armorteach_itar_tpl_m_v1()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= 5000)
	{
		ARMORTEACHFLAG = TRUE;
		if(B_TeachPlayerTalentSmith(self,other,WEAPON_ITAR_TPL_M_V1))
		{
			Npc_RemoveInvItems(hero,ItMi_Gold,5000);
			b_darrion_teacharmor_5();
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Darrion_TeachArmor_05_00");	//А золото где, приятель? 
	};
	b_darrionarmorchoices();
};

func void dia_darrion_armorteach_itar_tpl_s_v1()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= 7000)
	{
		ARMORTEACHFLAG = TRUE;
		if(B_TeachPlayerTalentSmith(self,other,WEAPON_ITAR_TPL_S_V1))
		{
			Npc_RemoveInvItems(hero,ItMi_Gold,7000);
			b_darrion_teacharmor_6();
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Darrion_TeachArmor_06_00");	//У тебя слишком мало золота. А делиться с тобой таким секретом за меньшую сумму я не собираюсь.
	};
	b_darrionarmorchoices();
};


instance XBS_7513_DARRION_ORESMITH(C_Info)
{
	npc = xbs_7513_darrion;
	nr = 1;
	condition = xbs_7513_darrion_oresmith_condition;
	information = xbs_7513_darrion_oresmith_info;
	permanent = FALSE;
	description = "Нетбек сказал, что ты сможешь меня научить ковать рудное оружие.";
};


func int xbs_7513_darrion_oresmith_condition()
{
	if((HOWCANMAKEBLACKSWORD == TRUE) && (NETBEKLEADME_STEP2DONE == FALSE) && (KNOWNORESWORD == FALSE) && Npc_KnowsInfo(hero,dia_netbek_makeblacksword))
	{
		return TRUE;
	};
};

func void xbs_7513_darrion_oresmith_info()
{
	AI_Output(other,self,"XBS_7513_Darrion_OreSmith_01_00");	//Нетбек сказал, что ты сможешь меня научить ковать рудное оружие.
	AI_Output(self,other,"XBS_7513_Darrion_OreSmith_01_01");	//Ну, если он так сказал, то могу.
	AI_Output(self,other,"XBS_7513_Darrion_OreSmith_01_02");	//Но тебе понадобится некоторый опыт, чтобы овладеть искусством ковки магической руды.
};


instance XBS_7513_DARRION_ORESMITHTEACH(C_Info)
{
	npc = xbs_7513_darrion;
	nr = 1;
	condition = xbs_7513_darrion_oresmithteach_condition;
	information = xbs_7513_darrion_oresmithteach_info;
	permanent = TRUE;
	description = "Научи меня ковать рудное оружие. (Очки обучения: 20)";
};


func int xbs_7513_darrion_oresmithteach_condition()
{
	if((HOWCANMAKEBLACKSWORD == TRUE) && (KNOWNORESWORD == FALSE) && Npc_KnowsInfo(hero,xbs_7513_darrion_oresmith))
	{
		return TRUE;
	};
};

func void xbs_7513_darrion_oresmithteach_info()
{
	AI_Output(other,self,"XBS_7513_Darrion_OreSmithTeach_01_00");	//Научи меня ковать рудное оружие.

	if(other.lp >= 20)
	{
		AI_Output(self,other,"XBS_7513_Darrion_OreSmithTeach_01_01");	//Хорошо, слушай внимательно. Процесс создания рудного клинка достаточно прост.
		AI_Output(self,other,"XBS_7513_Darrion_OreSmithTeach_01_02");	//Берешь необходимое количество магической руды и нагреваешь их до нужной температуры.
		AI_Output(self,other,"XBS_7513_Darrion_OreSmithTeach_01_03");	//Затем нужно соединить куски в единый сплав, придав ему форму клинка, а потом резко охладить.
		AI_Output(self,other,"XBS_7513_Darrion_OreSmithTeach_01_04");	//В итоге ты получишь оружие, прочность которого не будет знать себе равных.
		AI_Output(other,self,"XBS_7513_Darrion_OreSmithTeach_01_05");	//Спасибо, я все понял.
		other.lp = other.lp - 20;
		RankPoints = RankPoints + 20;
		KNOWNORESWORD = TRUE;
		AI_Print("Изучен рецепт ковки - 'Рудный меч'");
		Npc_SetTalentSkill(other,NPC_TALENT_SMITH,1);
		Snd_Play("LevelUP");
	}
	else
	{
		AI_Output(self,other,"XBS_7513_Darrion_OreSmithTeach_01_06");	//У тебя недостаточно опыта для этого.
		AI_Output(self,other,"XBS_7513_Darrion_OreSmithTeach_01_07");	//Приходи, когда наберешься его, и я научу тебя всему, что знаю сам.
		AI_Output(other,self,"XBS_7513_Darrion_OreSmithTeach_01_08");	//Ладно, как скажешь.
	};
};


instance XBS_7513_DARRION_BLACKORE(C_Info)
{
	npc = xbs_7513_darrion;
	nr = 1;
	condition = xbs_7513_darrion_blackore_condition;
	information = xbs_7513_darrion_blackore_info;
	permanent = FALSE;
	description = "Ты не знаешь, где мне отыскать черную руду?";
};


func int xbs_7513_darrion_blackore_condition()
{
	if((HOWCANMAKEBLACKSWORD == TRUE) && (NETBEKLEADME_STEP2DONE == FALSE) && (FINDOREALREADY == FALSE) && (KNOWNORESWORD == TRUE) && Npc_KnowsInfo(hero,dia_netbek_makeblacksword))
	{
		return TRUE;
	};
};

func void xbs_7513_darrion_blackore_info()
{
	AI_Output(other,self,"XBS_7513_Darrion_BlackOre_01_00");	//Ты не знаешь, где мне отыскать черную руду?
	AI_Output(self,other,"XBS_7513_Darrion_BlackOre_01_01");	//Черную руду? Боюсь, что нет. За всю свою жизнь я лишь единожды держал в руках это сокровище.
	AI_Output(self,other,"XBS_7513_Darrion_BlackOre_01_02");	//Однако до меня доходили слухи, будто бы орки знали, где ее искать. Хотя, правда это или нет, - точно утверждать не могу.
	AI_Output(other,self,"XBS_7513_Darrion_BlackOre_01_03");	//Понятно.
	B_LogEntry(TOPIC_GUARDIANS,"Кузнец Даррион слышал, что орки могут знать, где найти черную руду.");
};

instance XBS_7513_DARRION_PrioratBlade(C_Info)
{
	npc = xbs_7513_darrion;
	nr = 1;
	condition = XBS_7513_DARRION_PrioratBlade_condition;
	information = XBS_7513_DARRION_PrioratBlade_info;
	permanent = FALSE;
	description = "Мне нужен твой совет.";
};

func int XBS_7513_DARRION_PrioratBlade_condition()
{
	if((MIS_PrioratStart == LOG_Running) && (BladePrioratSeek == TRUE) && (Npc_HasItems(other,ItMw_1H_AssBlade) >= 1))
	{
		return TRUE;
	};
};

func void XBS_7513_DARRION_PrioratBlade_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"XBS_7513_DARRION_PrioratBlade_01_01");	//Мне нужен твой совет.
	AI_Output(self,other,"XBS_7513_DARRION_PrioratBlade_01_02");	//Какой именно?
	AI_Output(other,self,"XBS_7513_DARRION_PrioratBlade_01_03");	//Ко мне в руки попал один редкий клинок. И я ищу кузнеца, который мог бы рассказать мне о нем.
	AI_Output(self,other,"XBS_7513_DARRION_PrioratBlade_01_06");	//Ну, тогда показывай, что у тебя там.
	AI_Output(other,self,"XBS_7513_DARRION_PrioratBlade_01_07");	//Вот.
	CreateInvItems(self,ItMw_1H_AssBlade_View,1);
	AI_UnequipWeapons(self);
	AI_EquipBestMeleeWeapon(self);
	AI_ReadyMeleeWeapon(self);
	AI_PlayAni(self,"T_1HSINSPECT");
	AI_RemoveWeapon(self);
	AI_UnequipWeapons(self);
	AI_Output(self,other,"XBS_7513_DARRION_PrioratBlade_01_08");	//Это действительно очень редкий клинок для этих мест.
	AI_Output(self,other,"XBS_7513_DARRION_PrioratBlade_01_11");	//Но если бы ты когда-нибудь бывал в Варанте...(ехидно) 
	AI_Output(other,self,"XBS_7513_DARRION_PrioratBlade_01_12");	//То что?
	AI_Output(self,other,"XBS_7513_DARRION_PrioratBlade_01_13");	//То знал бы, что для тамошних жителей это оружие абсолютно не представляет из себя никакой ценности!
	AI_Output(other,self,"XBS_7513_DARRION_PrioratBlade_01_14");	//Значит, оно из Варанта? А что это вообще такое - Варант?
	AI_Output(self,other,"XBS_7513_DARRION_PrioratBlade_01_15");	//Варант - это огромная пустыня, которая распологается на юге Миртаны. Его местные жители - ассасины, очень часто используют подобного рода клинки.
	AI_Output(self,other,"XBS_7513_DARRION_PrioratBlade_01_16");	//Хотя это оружие немного отличается от того, что приходилось мне видеть раньше.
	AI_Output(other,self,"XBS_7513_DARRION_PrioratBlade_01_17");	//В каком смысле?
	AI_Output(self,other,"XBS_7513_DARRION_PrioratBlade_01_18");	//Меня очень заинтересовала гравировка в основании клинка. Символы, изображенные на ней, мне не особо знакомы.
	AI_Output(self,other,"XBS_7513_DARRION_PrioratBlade_01_19");	//Однако зная, что они обозначают, я бы мог точно сказать - кто является настоящим владельцем этого оружия.
	AI_Output(other,self,"XBS_7513_DARRION_PrioratBlade_01_20");	//А кто может это знать?
	AI_Output(self,other,"XBS_7513_DARRION_PrioratBlade_01_21");	//Понятия не имею. (озадаченно) Возможно, сами ассасины и признали бы его хозяина.
	AI_Output(self,other,"XBS_7513_DARRION_PrioratBlade_01_22");	//Но где тут найдешь хотя бы одного из них?
	AI_Output(self,other,"XBS_7513_DARRION_PrioratBlade_01_23");	//Им по душе жаркое солнце Варанта, нежели здешний климат.
	AI_Output(other,self,"XBS_7513_DARRION_PrioratBlade_01_24");	//Ладно, я тебя понял. Спасибо за помощь!
	B_LogEntry(TOPIC_PrioratStart,"Даррион рассказал мне о том, что найденный мною клинок обычно используют ассасины, живущие в пустыне Варант, которая располагается на юге Миртаны. Однако больше всего его заинтересовала гравировка, выбитая в основании клинка. Символы, изображенные на ней, смогли бы дать более точный ответ на мой вопрос. Но к моему большому сожалению, расшифровать их Даррион не смог. По его словам, сами ассасины смогли бы это сделать.");
	BladePrioratKnowsAssasins = TRUE;
};

instance DIA_Darrion_DoCrossBow(C_Info)
{
	npc = xbs_7513_darrion;
	nr = 1;
	condition = DIA_Darrion_DoCrossBow_condition;
	information = DIA_Darrion_DoCrossBow_info;
	permanent = FALSE;
	description = "Ты умеешь делать арбалеты?";
};

func int DIA_Darrion_DoCrossBow_condition()
{
	if((MIS_TagNorGrHunWeap == LOG_Running) && (FindSmithTeacherCrBow == TRUE) && (CrossBowNeedPlotnik == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Darrion_DoCrossBow_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Darrion_DoCrossBow_01_01");	//Ты умеешь делать арбалеты?
	AI_Output(self,other,"DIA_Darrion_DoCrossBow_01_02");	//Арбалеты? Это ты обратился не по адресу, приятель.
	AI_Output(self,other,"DIA_Darrion_DoCrossBow_01_03");	//Тебе нужен хороший плотник или столяр.
	AI_Output(self,other,"DIA_Darrion_DoCrossBow_01_04");	//Только он, возможно, сможет помочь тебе в этом деле.
	AI_Output(other,self,"DIA_Darrion_DoCrossBow_01_05");	//Понял.
	CrossBowNeedPlotnik = TRUE;
	B_LogEntry(TOPIC_TagNorGrHunWeap,"Делать арбалеты меня сможет научить только плотник или столяр.");
};

instance XBS_7513_DARRION_CanSellArmor(C_Info)
{
	npc = xbs_7513_darrion;
	nr = 1;
	condition = XBS_7513_DARRION_CanSellArmor_condition;
	information = XBS_7513_DARRION_CanSellArmor_info;
	permanent = FALSE;
	description = "Тебя, случаем, не интересуют поношенные доспехи?";
};

func int XBS_7513_DARRION_CanSellArmor_condition()
{
	if(Npc_KnowsInfo(hero,xbs_7513_darrion_hi) == TRUE)
	{
		return TRUE;
	};
};

func void XBS_7513_DARRION_CanSellArmor_info()
{
	AI_Output(other,self,"XBS_7513_DARRION_CanSellArmor_01_00");	//Тебя, случаем, не интересуют поношенные доспехи?
	AI_Output(self,other,"XBS_7513_DARRION_CanSellArmor_01_01");	//Возможно. А почему ты спрашиваешь?
	AI_Output(other,self,"XBS_7513_DARRION_CanSellArmor_01_02");	//У меня тут завалялась пара ненужных комплектов, и я понятия не имею, что с ними теперь делать.
	AI_Output(self,other,"XBS_7513_DARRION_CanSellArmor_01_03");	//Ну, если так, можешь приносить их мне.
	AI_Output(self,other,"XBS_7513_DARRION_CanSellArmor_01_04");	//Часть из них можно будет попробовать подогнать под кого-нибудь из ребят в лагере.
	AI_Output(self,other,"XBS_7513_DARRION_CanSellArmor_01_05");	//Остальные же пойдут как подручный материал для создания новых. Сталь, кожа, ткань, дратва - все сгодится!
	AI_Output(other,self,"XBS_7513_DARRION_CanSellArmor_01_06");	//А что я с этого получу?
	AI_Output(self,other,"XBS_7513_DARRION_CanSellArmor_01_07");	//Золота у меня мало. А вот обменять их на руду - это легко.
	AI_Output(other,self,"XBS_7513_DARRION_CanSellArmor_01_09");	//Хорошо, я подумаю над твоим предложением.
	Log_CreateTopic(TOPIC_XBS,LOG_NOTE);
	B_LogEntry(TOPIC_XBS,"Даррион принимает поношенные доспехи в обмен на магическую руду.");
	DarrionCanSellArmor = TRUE;
};

instance XBS_7513_DARRION_CanSellArmor_Do(C_Info)
{
	npc = xbs_7513_darrion;
	nr = 1;
	condition = XBS_7513_DARRION_CanSellArmor_Do_condition;
	information = XBS_7513_DARRION_CanSellArmor_Do_info;
	permanent = TRUE;
	description = "Я принес тебе доспехи.";
};

func int XBS_7513_DARRION_CanSellArmor_Do_condition()
{
	if(DarrionCanSellArmor == TRUE)
	{
		return TRUE;
	};
};

func void XBS_7513_DARRION_CanSellArmor_Do_info()
{
	var C_Item EquipWeap;
	EquipWeap = Npc_GetEquippedArmor(other);

	AI_Output(other,self,"XBS_7513_DARRION_CanSellArmor_Do_01_00");	//Я принес тебе доспехи.
	AI_Output(self,other,"XBS_7513_DARRION_CanSellArmor_Do_01_01");	//Хорошо. Давай посмотрим на них.
	Info_ClearChoices(XBS_7513_DARRION_CanSellArmor_Do);
	Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,Dialog_Back,XBS_7513_DARRION_CanSellArmor_Do_back);

	if((Hlp_IsItem(EquipWeap,ITAR_PRISONEL) == FALSE) && (Npc_HasItems(other,ITAR_PRISONEL) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Простые штаны рудокопа' - 5 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_PRISONEL);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_Prisoner) == FALSE) && (Npc_HasItems(other,ITAR_Prisoner) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Штаны рудокопа' - 5 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_Prisoner);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_Bau_L) == FALSE) && (Npc_HasItems(other,ITAR_Bau_L) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Легкая одежда крестьянина' - 5 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_Bau_L);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_Vlk_L) == FALSE) && (Npc_HasItems(other,ITAR_Vlk_L) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Легкая одежда горожанина' - 5 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_Vlk_L);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_Bau_M) == FALSE) && (Npc_HasItems(other,ITAR_Bau_M) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Одежда крестьянина' - 5 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_Bau_M);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_Vlk_M) == FALSE) && (Npc_HasItems(other,ITAR_Vlk_M) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Одежда горожанина' - 5 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_Vlk_M);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_Vlk_H) == FALSE) && (Npc_HasItems(other,ITAR_Vlk_H) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Роскошная одежда горожанина' - 10 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_Vlk_H);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_SEKBED) == FALSE) && (Npc_HasItems(other,ITAR_SEKBED) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Набедренная повязка Братства' - 10 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_SEKBED);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_SEKBED_V1) == FALSE) && (Npc_HasItems(other,ITAR_SEKBED_V1) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Набедренный кушак Братства' - 10 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_SEKBED_V1);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_SMITH_NOV) == FALSE) && (Npc_HasItems(other,ITAR_SMITH_NOV) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Одежда кузнеца-подмастерья' - 10 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_SMITH_NOV);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_SMITH_NOV_01) == FALSE) && (Npc_HasItems(other,ITAR_SMITH_NOV_01) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Одежда кузнеца-подмастерья' - 10 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_SMITH_NOV_01);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_SMITH_NOV_02) == FALSE) && (Npc_HasItems(other,ITAR_SMITH_NOV_02) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Одежда кузнеца-подмастерья' - 10 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_SMITH_NOV_02);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_SMITH_NOV_03) == FALSE) && (Npc_HasItems(other,ITAR_SMITH_NOV_03) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Одежда кузнеца-подмастерья' - 10 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_SMITH_NOV_03);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_SMITH_NOV_04) == FALSE) && (Npc_HasItems(other,ITAR_SMITH_NOV_04) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Одежда кузнеца-подмастерья' - 10 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_SMITH_NOV_04);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_SMITH_NOV_05) == FALSE) && (Npc_HasItems(other,ITAR_SMITH_NOV_05) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Одежда кузнеца-подмастерья' - 10 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_SMITH_NOV_05);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_Leather_L) == FALSE) && (Npc_HasItems(other,ITAR_Leather_L) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Кожаный доспех' - 15 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_Leather_L);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_Leather_M) == FALSE) && (Npc_HasItems(other,ITAR_Leather_M) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Тяжелый кожаный доспех' - 15 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_Leather_M);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_ALCHEMY_NOV) == FALSE) && (Npc_HasItems(other,ITAR_ALCHEMY_NOV) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Одежда алхимика-подмастерья' - 10 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_ALCHEMY_NOV);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_KIL_SL) == FALSE) && (Npc_HasItems(other,ITAR_KIL_SL) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Доспех убийцы' - 15 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_KIL_SL);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_KIL_SLS) == FALSE) && (Npc_HasItems(other,ITAR_KIL_SLS) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Доспех мастера-убийцы' - 20 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_KIL_SLS);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_TOWNGUARD) == FALSE) && (Npc_HasItems(other,ITAR_TOWNGUARD) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Легкие доспехи ополчения' - 15 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_TOWNGUARD);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_Mil_L) == FALSE) && (Npc_HasItems(other,ITAR_Mil_L) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Доспехи ополчения' - 20 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_Mil_L);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_MIL_L_V1) == FALSE) && (Npc_HasItems(other,ITAR_MIL_L_V1) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Кованые доспехи ополчения' - 25 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_MIL_L_V1);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_MIL_L_V12) == FALSE) && (Npc_HasItems(other,ITAR_MIL_L_V12) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Кованые доспехи ополчения' - 25 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_MIL_L_V12);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_MIL_L_V13) == FALSE) && (Npc_HasItems(other,ITAR_MIL_L_V13) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Кованые доспехи ополчения' - 25 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_MIL_L_V13);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_MIL_L_V14) == FALSE) && (Npc_HasItems(other,ITAR_MIL_L_V14) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Кованые доспехи ополчения' - 25 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_MIL_L_V14);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_MIL_L_V15) == FALSE) && (Npc_HasItems(other,ITAR_MIL_L_V15) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Кованые доспехи ополчения' - 30 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_MIL_L_V15);
	};
	if((Hlp_IsItem(EquipWeap,ItAr_Sld_L) == FALSE) && (Npc_HasItems(other,ItAr_Sld_L) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Легкие доспехи наемника' - 25 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ItAr_Sld_L);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_SLD_L_V1) == FALSE) && (Npc_HasItems(other,ITAR_SLD_L_V1) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Легкие кованые доспехи наемника' - 30 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_L_V1);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_SLD_L_V2) == FALSE) && (Npc_HasItems(other,ITAR_SLD_L_V2) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Легкие кованые доспехи наемника' - 30 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_L_V2);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_SLD_L_V3) == FALSE) && (Npc_HasItems(other,ITAR_SLD_L_V3) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Легкие кованые доспехи наемника' - 30 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_L_V3);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_SLD_L_V4) == FALSE) && (Npc_HasItems(other,ITAR_SLD_L_V4) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Легкие кованые доспехи наемника' - 30 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_L_V4);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_SLD_L_V5) == FALSE) && (Npc_HasItems(other,ITAR_SLD_L_V5) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Легкие кованые доспехи наемника' - 35 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_L_V5);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_SLD_M) == FALSE) && (Npc_HasItems(other,ITAR_SLD_M) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Доспехи наемника' - 40 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_M);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_SLD_M_V1) == FALSE) && (Npc_HasItems(other,ITAR_SLD_M_V1) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Кованые доспехи наемника' - 45 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_M_V1);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_SLD_M_V2) == FALSE) && (Npc_HasItems(other,ITAR_SLD_M_V2) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Кованые доспехи наемника' - 45 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_M_V2);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_SLD_M_V3) == FALSE) && (Npc_HasItems(other,ITAR_SLD_M_V3) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Кованые доспехи наемника' - 45 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_M_V3);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_SLD_M_V4) == FALSE) && (Npc_HasItems(other,ITAR_SLD_M_V4) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Кованые доспехи наемника' - 45 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_M_V4);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_SLD_M_V5) == FALSE) && (Npc_HasItems(other,ITAR_SLD_M_V5) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Кованые доспехи наемника' - 50 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_M_V5);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_SLP_UL) == FALSE) && (Npc_HasItems(other,ITAR_SLP_UL) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Доспехи послушника Братства' - 30 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLP_UL);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_SLP_L) == FALSE) && (Npc_HasItems(other,ITAR_SLP_L) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Тяжелые доспехи послушника Братства' - 35 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLP_L);
	};
	if((Hlp_IsItem(EquipWeap,ItAr_NOV_L) == FALSE) && (Npc_HasItems(other,ItAr_NOV_L) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Роба послушника Огня' - 25 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ItAr_NOV_L);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_NDW_L) == FALSE) && (Npc_HasItems(other,ITAR_NDW_L) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Роба послушника Воды' - 25 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_NDW_L);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_NDM_L) == FALSE) && (Npc_HasItems(other,ITAR_NDM_L) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Роба темного послушника' - 25 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_NDM_L);
	};
	if((Hlp_IsItem(EquipWeap,ItAr_KDF_L) == FALSE) && (Npc_HasItems(other,ItAr_KDF_L) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Роба младшего мага Огня' - 30 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ItAr_KDF_L);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_KDF_M) == FALSE) && (Npc_HasItems(other,ITAR_KDF_M) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Роба мага Огня' - 40 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_KDF_M);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_KDF_M_NEW) == FALSE) && (Npc_HasItems(other,ITAR_KDF_M_NEW) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Роба мага Огня' - 40 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_KDF_M_NEW);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_KDW_L_Addon) == FALSE) && (Npc_HasItems(other,ITAR_KDW_L_Addon) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Роба мага Воды' - 35 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_KDW_L_Addon);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DMT_L) == FALSE) && (Npc_HasItems(other,ITAR_DMT_L) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Роба темного мага' - 40 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_DMT_L);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_GUR_L) == FALSE) && (Npc_HasItems(other,ITAR_GUR_L) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Роба гуру Братства' - 40 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_GUR_L);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_MAYA_PRIEST) == FALSE) && (Npc_HasItems(other,ITAR_MAYA_PRIEST) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Роба древних жрецов' - 45 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_MAYA_PRIEST);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_RANGER_Addon) == FALSE) && (Npc_HasItems(other,ITAR_RANGER_Addon) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"Доспех 'Кольца Воды' - 40 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_RANGER_Addon);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_RANGER_ADDON_V1) == FALSE) && (Npc_HasItems(other,ITAR_RANGER_ADDON_V1) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"Кованый доспех 'Кольца Воды' - 45 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_RANGER_ADDON_V1);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_RANGER_ADDON_V2) == FALSE) && (Npc_HasItems(other,ITAR_RANGER_ADDON_V2) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"Кованый доспех 'Кольца Воды' - 45 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_RANGER_ADDON_V2);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_RANGER_ADDON_V3) == FALSE) && (Npc_HasItems(other,ITAR_RANGER_ADDON_V3) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"Кованый доспех 'Кольца Воды' - 45 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_RANGER_ADDON_V3);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_RANGER_ADDON_V4) == FALSE) && (Npc_HasItems(other,ITAR_RANGER_ADDON_V4) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"Кованый доспех 'Кольца Воды' - 45 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_RANGER_ADDON_V4);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_RANGER_ADDON_V5) == FALSE) && (Npc_HasItems(other,ITAR_RANGER_ADDON_V5) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"Кованый доспех 'Кольца Воды' - 50 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_RANGER_ADDON_V5);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_PIR_L_Addon) == FALSE) && (Npc_HasItems(other,ITAR_PIR_L_Addon) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Легкие доспехи пирата' - 40 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_PIR_L_Addon);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_PIR_M_Addon) == FALSE) && (Npc_HasItems(other,ITAR_PIR_M_Addon) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Доспехи пирата' - 50 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_PIR_M_Addon);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_PIR_H_Addon) == FALSE) && (Npc_HasItems(other,ITAR_PIR_H_Addon) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Тяжелые доспехи пирата' - 60 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_PIR_H_Addon);
	};
	if((Hlp_IsItem(EquipWeap,ItAr_BDT_M) == FALSE) && (Npc_HasItems(other,ItAr_BDT_M) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Легкие доспехи бандита' - 30 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ItAr_BDT_M);
	};
	if((Hlp_IsItem(EquipWeap,ItAr_BDT_H) == FALSE) && (Npc_HasItems(other,ItAr_BDT_H) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Доспехи бандита' - 40 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ItAr_BDT_H);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_BDT_F) == FALSE) && (Npc_HasItems(other,ITAR_BDT_F) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Тяжелые доспехи бандита' - 50 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_BDT_F);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_GRD_L) == FALSE) && (Npc_HasItems(other,ITAR_GRD_L) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Лeгкие доспехи стражника' - 40 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_GRD_L);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_GRD_L_V1) == FALSE) && (Npc_HasItems(other,ITAR_GRD_L_V1) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Легкие кованые доспехи стражника' - 45 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_GRD_L_V1);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_Bloodwyn_Addon) == FALSE) && (Npc_HasItems(other,ITAR_Bloodwyn_Addon) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Доспехи стражника' - 50 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_Bloodwyn_Addon);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_BLOODWYN_ADDON_V1) == FALSE) && (Npc_HasItems(other,ITAR_BLOODWYN_ADDON_V1) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Кованые доспехи стражника' - 55 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_BLOODWYN_ADDON_V1);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_Thorus_Addon) == FALSE) && (Npc_HasItems(other,ITAR_Thorus_Addon) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Тяжелые доспехи стражника' - 60 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_Thorus_Addon);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_THORUS_ADDON_V1) == FALSE) && (Npc_HasItems(other,ITAR_THORUS_ADDON_V1) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Тяжелые кованые доспехи стражника' - 65 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_THORUS_ADDON_V1);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_OreBaron_Addon) == FALSE) && (Npc_HasItems(other,ITAR_OreBaron_Addon) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Доспехи рудного барона' - 80 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_OreBaron_Addon);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DJG_Crawler) == FALSE) && (Npc_HasItems(other,ITAR_DJG_Crawler) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Доспехи из панцирей ползунов' - 40 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_Crawler);
	};
	if((Hlp_IsItem(EquipWeap,ItAr_MIL_M) == FALSE) && (Npc_HasItems(other,ItAr_MIL_M) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Тяжелые доспехи ополчения' - 60 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ItAr_MIL_M);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_MIL_M_V1) == FALSE) && (Npc_HasItems(other,ITAR_MIL_M_V1) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Тяжелые кованые доспехи ополчения' - 65 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_MIL_M_V1);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_MIL_M_V12) == FALSE) && (Npc_HasItems(other,ITAR_MIL_M_V12) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Тяжелые кованые доспехи ополчения' - 65 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_MIL_M_V12);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_MIL_M_V13) == FALSE) && (Npc_HasItems(other,ITAR_MIL_M_V13) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Тяжелые кованые доспехи ополчения' - 65 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_MIL_M_V13);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_MIL_M_V14) == FALSE) && (Npc_HasItems(other,ITAR_MIL_M_V14) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Тяжелые кованые доспехи ополчения' - 65 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_MIL_M_V14);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_MIL_M_V15) == FALSE) && (Npc_HasItems(other,ITAR_MIL_M_V15) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Тяжелые кованые доспехи ополчения' - 70 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_MIL_M_V15);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_PAL_L) == FALSE) && (Npc_HasItems(other,ITAR_PAL_L) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Доспех оруженосца' - 80 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_PAL_L);
	};
	if((Hlp_IsItem(EquipWeap,ItAr_Sld_H) == FALSE) && (Npc_HasItems(other,ItAr_Sld_H) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Тяжелые доспехи наемника' - 70 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ItAr_Sld_H);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_SLD_H_V1) == FALSE) && (Npc_HasItems(other,ITAR_SLD_H_V1) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Тяжелые кованые доспехи наемника' - 75 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_H_V1);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_SLD_H_V2) == FALSE) && (Npc_HasItems(other,ITAR_SLD_H_V2) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Тяжелые кованые доспехи наемника' - 75 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_H_V2);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_SLD_H_V3) == FALSE) && (Npc_HasItems(other,ITAR_SLD_H_V3) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Тяжелые кованые доспехи наемника' - 75 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_H_V3);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_SLD_H_V4) == FALSE) && (Npc_HasItems(other,ITAR_SLD_H_V4) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Тяжелые кованые доспехи наемника' - 75 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_H_V4);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_SLD_H_V5) == FALSE) && (Npc_HasItems(other,ITAR_SLD_H_V5) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Тяжелые кованые доспехи наемника' - 80 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_H_V5);
	};
	if((Hlp_IsItem(EquipWeap,ItAr_PAL_M) == FALSE) && (Npc_HasItems(other,ItAr_PAL_M) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Доспехи рыцаря' - 90 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ItAr_PAL_M);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_PAL_M_V1) == FALSE) && (Npc_HasItems(other,ITAR_PAL_M_V1) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Кованые доспехи рыцаря' - 95 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_PAL_M_V1);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_PAL_M_V12) == FALSE) && (Npc_HasItems(other,ITAR_PAL_M_V12) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Кованые доспехи рыцаря' - 95 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_PAL_M_V12);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_PAL_M_V13) == FALSE) && (Npc_HasItems(other,ITAR_PAL_M_V13) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Кованые доспехи рыцаря' - 95 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_PAL_M_V13);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_PAL_M_V14) == FALSE) && (Npc_HasItems(other,ITAR_PAL_M_V14) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Кованые доспехи рыцаря' - 95 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_PAL_M_V14);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_PAL_M_V15) == FALSE) && (Npc_HasItems(other,ITAR_PAL_M_V15) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Рудные доспехи рыцаря' - 100 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_PAL_M_V15);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_PAL_M_V2) == FALSE) && (Npc_HasItems(other,ITAR_PAL_M_V2) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Освященные рудные доспехи рыцаря' - 105 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_PAL_M_V2);
	};
	if((Hlp_IsItem(EquipWeap,ItAr_PAl_H) == FALSE) && (Npc_HasItems(other,ItAr_PAl_H) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Доспехи паладина' - 120 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ItAr_PAl_H);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_PAL_H_V1) == FALSE) && (Npc_HasItems(other,ITAR_PAL_H_V1) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Кованые доспехи паладина' - 130 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_PAL_H_V1);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_PAL_H_V12) == FALSE) && (Npc_HasItems(other,ITAR_PAL_H_V12) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Кованые доспехи паладина' - 130 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_PAL_H_V12);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_PAL_H_V13) == FALSE) && (Npc_HasItems(other,ITAR_PAL_H_V13) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Кованые доспехи паладина' - 130 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_PAL_H_V13);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_PAL_H_V14) == FALSE) && (Npc_HasItems(other,ITAR_PAL_H_V14) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Кованые доспехи паладина' - 130 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_PAL_H_V14);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_PAL_H_V15) == FALSE) && (Npc_HasItems(other,ITAR_PAL_H_V15) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Рудные доспехи паладина' - 140 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_PAL_H_V15);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_PAL_H_V2) == FALSE) && (Npc_HasItems(other,ITAR_PAL_H_V2) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Освященные рудные доспехи паладина' - 150 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_PAL_H_V2);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DJG_L) == FALSE) && (Npc_HasItems(other,ITAR_DJG_L) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Легкие доспехи драконоборца' - 80 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_L);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DJG_L_V1) == FALSE) && (Npc_HasItems(other,ITAR_DJG_L_V1) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Легкие кованые доспехи драконоборца' - 90 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_L_V1);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DJG_L_V2) == FALSE) && (Npc_HasItems(other,ITAR_DJG_L_V2) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Легкие кованые доспехи драконоборца' - 90 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_L_V2);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DJG_L_V3) == FALSE) && (Npc_HasItems(other,ITAR_DJG_L_V3) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Легкие кованые доспехи драконоборца' - 90 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_L_V3);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DJG_L_V4) == FALSE) && (Npc_HasItems(other,ITAR_DJG_L_V4) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Легкие кованые доспехи драконоборца' - 90 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_L_V4);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DJG_L_V5) == FALSE) && (Npc_HasItems(other,ITAR_DJG_L_V5) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Легкие кованые доспехи драконоборца' - 100 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_L_V5);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DJG_M) == FALSE) && (Npc_HasItems(other,ITAR_DJG_M) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Доспехи драконоборца' - 110 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_M);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DJG_M_V1) == FALSE) && (Npc_HasItems(other,ITAR_DJG_M_V1) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Кованые доспехи драконоборца' - 120 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_M_V1);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DJG_M_V2) == FALSE) && (Npc_HasItems(other,ITAR_DJG_M_V2) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Кованые доспехи драконоборца' - 120 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_M_V2);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DJG_M_V3) == FALSE) && (Npc_HasItems(other,ITAR_DJG_M_V3) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Кованые доспехи драконоборца' - 120 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_M_V3);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DJG_M_V4) == FALSE) && (Npc_HasItems(other,ITAR_DJG_M_V4) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Кованые доспехи драконоборца' - 120 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_M_V4);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DJG_M_V5) == FALSE) && (Npc_HasItems(other,ITAR_DJG_M_V5) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Кованые доспехи драконоборца' - 130 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_M_V5);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_Dargonscale) == FALSE) && (Npc_HasItems(other,ITAR_Dargonscale) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Доспех из драконьей чешуи' - 140 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_Dargonscale);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DJG_H) == FALSE) && (Npc_HasItems(other,ITAR_DJG_H) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Тяжелые доспехи драконоборца' - 140 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_H);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DJG_H_V1) == FALSE) && (Npc_HasItems(other,ITAR_DJG_H_V1) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Тяжелые кованые доспехи драконоборца' - 150 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_H_V1);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DJG_H_V2) == FALSE) && (Npc_HasItems(other,ITAR_DJG_H_V2) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Тяжелые кованые доспехи драконоборца' - 150 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_H_V2);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DJG_H_V3) == FALSE) && (Npc_HasItems(other,ITAR_DJG_H_V3) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Тяжелые кованые доспехи драконоборца' - 150 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_H_V3);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DJG_H_V4) == FALSE) && (Npc_HasItems(other,ITAR_DJG_H_V4) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Тяжелые кованые доспехи драконоборца' - 150 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_H_V4);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DJG_H_V5) == FALSE) && (Npc_HasItems(other,ITAR_DJG_H_V5) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Тяжелые кованые доспехи драконоборца' - 160 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_H_V5);
	};
	if((Hlp_IsItem(EquipWeap,ItAr_DragonKiller) == FALSE) && (Npc_HasItems(other,ItAr_DragonKiller) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Доспехи убийцы драконов' - 200 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ItAr_DragonKiller);
	};
	if((Hlp_IsItem(EquipWeap,ItAr_SHVWarrior) == FALSE) && (Npc_HasItems(other,ItAr_SHVWarrior) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Доспехи Вершителя' - 130 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ItAr_SHVWarrior);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_TPL_LST) == FALSE) && (Npc_HasItems(other,ITAR_TPL_LST) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Боевой кильт Стража Братства' - 70 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_LST);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_TPL_L) == FALSE) && (Npc_HasItems(other,ITAR_TPL_L) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Легкие доспехи Стража Братства' - 80 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_L);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_TPL_L_V1) == FALSE) && (Npc_HasItems(other,ITAR_TPL_L_V1) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Легкие кованые доспехи Стража Братства' - 90 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_L_V1);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_TPL_L_V2) == FALSE) && (Npc_HasItems(other,ITAR_TPL_L_V2) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Легкие кованые доспехи Стража Братства' - 90 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_L_V2);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_TPL_L_V3) == FALSE) && (Npc_HasItems(other,ITAR_TPL_L_V3) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Легкие кованые доспехи Стража Братства' - 90 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_L_V3);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_TPL_L_V4) == FALSE) && (Npc_HasItems(other,ITAR_TPL_L_V4) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Легкие кованые доспехи Стража Братства' - 90 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_L_V4);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_TPL_L_V5) == FALSE) && (Npc_HasItems(other,ITAR_TPL_L_V5) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Легкие кованые доспехи Стража Братства' - 100 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_L_V5);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_TPL_M) == FALSE) && (Npc_HasItems(other,ITAR_TPL_M) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Доспехи Стража Братства' - 110 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_M);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_TPL_M_V1) == FALSE) && (Npc_HasItems(other,ITAR_TPL_M_V1) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Кованые доспехи Стража Братства' - 120 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_M_V1);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_TPL_M_V2) == FALSE) && (Npc_HasItems(other,ITAR_TPL_M_V2) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Кованые доспехи Стража Братства' - 120 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_M_V2);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_TPL_M_V3) == FALSE) && (Npc_HasItems(other,ITAR_TPL_M_V3) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Кованые доспехи Стража Братства' - 120 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_M_V3);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_TPL_M_V4) == FALSE) && (Npc_HasItems(other,ITAR_TPL_M_V4) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Кованые доспехи Стража Братства' - 120 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_M_V4);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_TPL_M_V5) == FALSE) && (Npc_HasItems(other,ITAR_TPL_M_V5) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Кованые доспехи Стража Братства' - 130 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_M_V5);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_TPL_S) == FALSE) && (Npc_HasItems(other,ITAR_TPL_S) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Тяжелые доспехи Стража Братства' - 140 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_S);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_TPL_S_V1) == FALSE) && (Npc_HasItems(other,ITAR_TPL_S_V1) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Тяжелые кованые доспехи Стража Братства' - 150 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_S_V1);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_TPL_S_V2) == FALSE) && (Npc_HasItems(other,ITAR_TPL_S_V2) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Тяжелые кованые доспехи Стража Братства' - 150 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_S_V2);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_TPL_S_V3) == FALSE) && (Npc_HasItems(other,ITAR_TPL_S_V3) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Тяжелые кованые доспехи Стража Братства' - 150 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_S_V3);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_TPL_S_V4) == FALSE) && (Npc_HasItems(other,ITAR_TPL_S_V4) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Тяжелые кованые доспехи Стража Братства' - 150 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_S_V4);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_TPL_S_V5) == FALSE) && (Npc_HasItems(other,ITAR_TPL_S_V5) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Тяжелые кованые доспехи Стража Братства' - 160 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_S_V5);
	};
	if((Hlp_IsItem(EquipWeap,ItAr_KDF_H) == FALSE) && (Npc_HasItems(other,ItAr_KDF_H) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Роба высшего мага Огня' - 80 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ItAr_KDF_H);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_KDF_H_BLESSED) == FALSE) && (Npc_HasItems(other,ITAR_KDF_H_BLESSED) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Освященная роба высшего мага Огня' - 90 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_KDF_H_BLESSED);
	};
	if((Hlp_IsItem(EquipWeap,ItAr_KDF_SH) == FALSE) && (Npc_HasItems(other,ItAr_KDF_SH) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Роба архимага Огня' - 100 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ItAr_KDF_SH);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_KDW_H) == FALSE) && (Npc_HasItems(other,ITAR_KDW_H) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Роба высшего мага Воды' - 80 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_KDW_H);
	};
	if((Hlp_IsItem(EquipWeap,ItAr_KDW_SH) == FALSE) && (Npc_HasItems(other,ItAr_KDW_SH) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Роба архимага Воды' - 90 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ItAr_KDW_SH);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_KDW_ADANOS) == FALSE) && (Npc_HasItems(other,ITAR_KDW_ADANOS) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Роба жреца Аданоса' - 100 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_KDW_ADANOS);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DMT_H) == FALSE) && (Npc_HasItems(other,ITAR_DMT_H) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Роба высшего темного мага' - 100 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_DMT_H);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DMT_H_BELIAR_1) == FALSE) && (Npc_HasItems(other,ITAR_DMT_H_BELIAR_1) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Оскверненная роба высшего темного мага' - 110 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_DMT_H_BELIAR_1);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DMT_H_BELIAR_3) == FALSE) && (Npc_HasItems(other,ITAR_DMT_H_BELIAR_3) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Роба вестника Тьмы' - 120 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_DMT_H_BELIAR_3);
	};
	if((Hlp_IsItem(EquipWeap,ItAr_KDM_SH) == FALSE) && (Npc_HasItems(other,ItAr_KDM_SH) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Роба архимага Тьмы' - 130 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ItAr_KDM_SH);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_GUR_H) == FALSE) && (Npc_HasItems(other,ITAR_GUR_H) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Роба высшего гуру Братства' - 110 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_GUR_H);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_HARADRIMMAGE) == FALSE) && (Npc_HasItems(other,ITAR_HARADRIMMAGE) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Роба адепта Хранителей' - 50 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_HARADRIMMAGE);
	};
	if((Hlp_IsItem(EquipWeap,ItAr_BloodArmor) == FALSE) && (Npc_HasItems(other,ItAr_BloodArmor) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Доспехи Крови' - 170 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ItAr_BloodArmor);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_ASSASINS_01) == FALSE) && (Npc_HasItems(other,ITAR_ASSASINS_01) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Тяжелые доспехи тени Масиаф' - 100 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_ASSASINS_01);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_ASSASINS_02) == FALSE) && (Npc_HasItems(other,ITAR_ASSASINS_02) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Доспехи приора Масиаф' - 120 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_ASSASINS_02);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_ASSASINS_03) == FALSE) && (Npc_HasItems(other,ITAR_ASSASINS_03) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Доспехи послушника Масиаф' - 80 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_ASSASINS_03);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_ASSASINS_04) == FALSE) && (Npc_HasItems(other,ITAR_ASSASINS_04) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Доспехи тени Масиаф' - 90 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_ASSASINS_04);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_ASSASINS_DEMONMAGE) == FALSE) && (Npc_HasItems(other,ITAR_ASSASINS_DEMONMAGE) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Доспехи гуру-демона' - 150 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_ASSASINS_DEMONMAGE);
	};
	if((Hlp_IsItem(EquipWeap,ItAr_Hun_H) == FALSE) && (Npc_HasItems(other,ItAr_Hun_H) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Тяжелые доспехи охотника' - 40 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ItAr_Hun_H);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DHT_END) == FALSE) && (Npc_HasItems(other,ITAR_DHT_END) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Доспехи ловкача' - 10 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_DHT_END);
	};
	if((Hlp_IsItem(EquipWeap,ItAr_HuntArmor_01) == FALSE) && (Npc_HasItems(other,ItAr_HuntArmor_01) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Доспехи охотника-следопыта' - 40 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ItAr_HuntArmor_01);
	};
	if((Hlp_IsItem(EquipWeap,ItAr_HuntArmor_02) == FALSE) && (Npc_HasItems(other,ItAr_HuntArmor_02) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Доспехи охотника-зверобоя' - 60 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ItAr_HuntArmor_02);
	};
	if((Hlp_IsItem(EquipWeap,ItAr_HuntArmor_03) == FALSE) && (Npc_HasItems(other,ItAr_HuntArmor_03) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Доспехи охотника-троллебойца' - 80 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ItAr_HuntArmor_03);
	};
	if((Hlp_IsItem(EquipWeap,ItAr_HuntArmor_04) == FALSE) && (Npc_HasItems(other,ItAr_HuntArmor_04) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Доспехи мастера-охотника' - 100 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ItAr_HuntArmor_04);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DHT_END_1) == FALSE) && (Npc_HasItems(other,ITAR_DHT_END_1) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Доспехи вора' - 20 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_DHT_END_1);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DHT_END_2) == FALSE) && (Npc_HasItems(other,ITAR_DHT_END_2) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Доспехи призрака' - 30 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_DHT_END_2);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DHT_END_3) == FALSE) && (Npc_HasItems(other,ITAR_DHT_END_3) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Доспехи ночной тени' - 50 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_DHT_END_3);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DHT_END_4) == FALSE) && (Npc_HasItems(other,ITAR_DHT_END_4) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Доспехи мастера-вора' - 60 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_DHT_END_4);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DHT_END_5) == FALSE) && (Npc_HasItems(other,ITAR_DHT_END_5) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Доспехи главаря воров' - 80 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_DHT_END_5);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DHT_END_6) == FALSE) && (Npc_HasItems(other,ITAR_DHT_END_6) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Доспехи короля воров' - 100 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_DHT_END_6);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_ASS) == FALSE) && (Npc_HasItems(other,ITAR_ASS) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Доспех ассасина' - 120 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_ASS);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_TOPTHIEF) == FALSE) && (Npc_HasItems(other,ITAR_TOPTHIEF) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Доспех Эр'Хазира' - 150 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_TOPTHIEF);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_ASGARD) == FALSE) && (Npc_HasItems(other,ITAR_ASGARD) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Доспех призрачной тени' - 180 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_ASGARD);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_ADVENTURE_HERO) == FALSE) && (Npc_HasItems(other,ITAR_ADVENTURE_HERO) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Доспехи авантюриста' - 30 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_ADVENTURE_HERO);
	};
	if((Hlp_IsItem(EquipWeap,ItAr_OldSteelArmor) == FALSE) && (Npc_HasItems(other,ItAr_OldSteelArmor) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Стальной самокованный доспех' - 60 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ItAr_OldSteelArmor);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_STTP_01) == FALSE) && (Npc_HasItems(other,ITAR_STTP_01) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Кольчуга призрака' - 40 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_STTP_01);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_OREARMOR) == FALSE) && (Npc_HasItems(other,ITAR_OREARMOR) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Рудные доспехи Света' - 250 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_OREARMOR);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_Raven_Addon) == FALSE) && (Npc_HasItems(other,ITAR_Raven_Addon) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Рудные доспехи Тьмы' - 250 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_Raven_Addon);
	};
	if(Npc_HasItems(other,ItAr_Hut) >= 1)
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Матерчатая шапка' - 1 кусок руды",XBS_7513_DARRION_CanSellArmor_Do_ItAr_Hut);
	};
	if(Npc_HasItems(other,ItAr_HoodHelm) >= 1)
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Матерчатая накидка' - 2 куска руды",XBS_7513_DARRION_CanSellArmor_Do_ItAr_HoodHelm);
	};
	if(Npc_HasItems(other,ItAr_ThiefHut) >= 1)
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Шапка вора' - 2 куска руды",XBS_7513_DARRION_CanSellArmor_Do_ItAr_ThiefHut);
	};
	if(Npc_HasItems(other,ItAr_PirateHat) >= 1)
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Шляпа капитана' - 3 куска руды",XBS_7513_DARRION_CanSellArmor_Do_ItAr_PirateHat);
	};
	if(Npc_HasItems(other,ItAr_Helm_01) >= 1)
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Железный шлем' - 5 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ItAr_Helm_01);
	};
	if(Npc_HasItems(other,ItAr_Helm_New_01) >= 1)
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Шлем лучника' - 5 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ItAr_Helm_New_01);
	};
	if(Npc_HasItems(other,ItAr_Helm_New_02) >= 1)
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Шлем Эр'Хазира' - 30 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ItAr_Helm_New_02);
	};
	if(Npc_HasItems(other,ItAr_Helm_02) >= 1)
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Нордмарский шлем' - 8 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ItAr_Helm_02);
	};
	if(Npc_HasItems(other,ItAr_Helm_Hunt) >= 1)
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Покров берсерка' - 15 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ItAr_Helm_Hunt);
	};
	if(Npc_HasItems(other,ItAr_Helm_03) >= 1)
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Шлем рыцаря' - 10 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ItAr_Helm_03);
	};
	if(Npc_HasItems(other,ItAr_Pal_Helm) >= 1)
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Шлем паладина' - 15 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ItAr_Pal_Helm);
	};
	if(Npc_HasItems(other,ItAr_Pal_Helm_Open) >= 1)
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Шлем паладина' - 15 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ItAr_Pal_Helm_Open);
	};
	if(Npc_HasItems(other,ItAr_DJG_Helm) >= 1)
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Шлем драконоборца' - 20 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ItAr_DJG_Helm);
	};
	if(Npc_HasItems(other,ItAr_Helm_Demon) >= 1)
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Драконий шлем' - 40 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ItAr_Helm_Demon);
	};
	if(Npc_HasItems(other,ItAr_God_Helm) >= 1)
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Древний шлем' - 50 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ItAr_God_Helm);
	};
	if(Npc_HasItems(other,ItAr_Helm_G3_01) >= 1)
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Стальной шлем' - 10 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ItAr_Helm_G3_01);
	};
	if(Npc_HasItems(other,ItAr_Helm_G3_02) >= 1)
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Шлем наемника' - 12 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ItAr_Helm_G3_02);
	};
	if(Npc_HasItems(other,ItAr_Helm_G3_04) >= 1)
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Рогатый шлем' - 12 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ItAr_Helm_G3_04);
	};
	if(Npc_HasItems(other,ItAr_ShrecHelm) >= 1)
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Шлем жреца Зодчих' - 8 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ItAr_ShrecHelm);
	};
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_Hut()
{
	B_GivePlayerXP(50);
	B_GiveInvItems(other,self,ItAr_Hut,1);
	B_GiveInvItems(self,other,ItMi_Nugget,1);
	Npc_RemoveInvItems(self,ItAr_Hut,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_HoodHelm()
{
	B_GivePlayerXP(50);
	B_GiveInvItems(other,self,ItAr_HoodHelm,1);
	B_GiveInvItems(self,other,ItMi_Nugget,2);
	Npc_RemoveInvItems(self,ItAr_HoodHelm,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_ThiefHut()
{
	B_GivePlayerXP(50);
	B_GiveInvItems(other,self,ItAr_ThiefHut,1);
	B_GiveInvItems(self,other,ItMi_Nugget,2);
	Npc_RemoveInvItems(self,ItAr_ThiefHut,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_PirateHat()
{
	B_GivePlayerXP(50);
	B_GiveInvItems(other,self,ItAr_PirateHat,1);
	B_GiveInvItems(self,other,ItMi_Nugget,3);
	Npc_RemoveInvItems(self,ItAr_PirateHat,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_Helm_01()
{
	B_GivePlayerXP(50);
	B_GiveInvItems(other,self,ItAr_Helm_01,1);
	B_GiveInvItems(self,other,ItMi_Nugget,5);
	Npc_RemoveInvItems(self,ItAr_Helm_01,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_Helm_New_01()
{
	B_GivePlayerXP(50);
	B_GiveInvItems(other,self,ItAr_Helm_New_01,1);
	B_GiveInvItems(self,other,ItMi_Nugget,5);
	Npc_RemoveInvItems(self,ItAr_Helm_New_01,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_Helm_New_02()
{
	B_GivePlayerXP(50);
	B_GiveInvItems(other,self,ItAr_Helm_New_02,1);
	B_GiveInvItems(self,other,ItMi_Nugget,30);
	Npc_RemoveInvItems(self,ItAr_Helm_New_02,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_Helm_02()
{
	B_GivePlayerXP(50);
	B_GiveInvItems(other,self,ItAr_Helm_02,1);
	B_GiveInvItems(self,other,ItMi_Nugget,8);
	Npc_RemoveInvItems(self,ItAr_Helm_02,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_Helm_Hunt()
{
	B_GivePlayerXP(50);
	B_GiveInvItems(other,self,ItAr_Helm_Hunt,1);
	B_GiveInvItems(self,other,ItMi_Nugget,15);
	Npc_RemoveInvItems(self,ItAr_Helm_Hunt,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_Helm_03()
{
	B_GivePlayerXP(50);
	B_GiveInvItems(other,self,ItAr_Helm_03,1);
	B_GiveInvItems(self,other,ItMi_Nugget,10);
	Npc_RemoveInvItems(self,ItAr_Helm_03,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_Pal_Helm_Open()
{
	B_GivePlayerXP(50);
	B_GiveInvItems(other,self,ItAr_Pal_Helm_Open,1);
	B_GiveInvItems(self,other,ItMi_Nugget,15);
	Npc_RemoveInvItems(self,ItAr_Pal_Helm_Open,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_Pal_Helm()
{
	B_GivePlayerXP(50);
	B_GiveInvItems(other,self,ItAr_Pal_Helm,1);
	B_GiveInvItems(self,other,ItMi_Nugget,15);
	Npc_RemoveInvItems(self,ItAr_Pal_Helm,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_DJG_Helm()
{
	B_GivePlayerXP(50);
	B_GiveInvItems(other,self,ItAr_DJG_Helm,1);
	B_GiveInvItems(self,other,ItMi_Nugget,20);
	Npc_RemoveInvItems(self,ItAr_DJG_Helm,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_Helm_Demon()
{
	B_GivePlayerXP(50);
	B_GiveInvItems(other,self,ItAr_Helm_Demon,1);
	B_GiveInvItems(self,other,ItMi_Nugget,40);
	Npc_RemoveInvItems(self,ItAr_Helm_Demon,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_God_Helm()
{
	B_GivePlayerXP(50);
	B_GiveInvItems(other,self,ItAr_God_Helm,1);
	B_GiveInvItems(self,other,ItMi_Nugget,50);
	Npc_RemoveInvItems(self,ItAr_God_Helm,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_Helm_G3_01()
{
	B_GivePlayerXP(50);
	B_GiveInvItems(other,self,ItAr_Helm_G3_01,1);
	B_GiveInvItems(self,other,ItMi_Nugget,10);
	Npc_RemoveInvItems(self,ItAr_Helm_G3_01,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_Helm_G3_02()
{
	B_GivePlayerXP(50);
	B_GiveInvItems(other,self,ItAr_Helm_G3_02,1);
	B_GiveInvItems(self,other,ItMi_Nugget,12);
	Npc_RemoveInvItems(self,ItAr_Helm_G3_02,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_Helm_G3_04()
{
	B_GivePlayerXP(50);
	B_GiveInvItems(other,self,ItAr_Helm_G3_04,1);
	B_GiveInvItems(self,other,ItMi_Nugget,12);
	Npc_RemoveInvItems(self,ItAr_Helm_G3_04,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_ShrecHelm()
{
	B_GivePlayerXP(50);
	B_GiveInvItems(other,self,ItAr_ShrecHelm,1);
	B_GiveInvItems(self,other,ItMi_Nugget,8);
	Npc_RemoveInvItems(self,ItAr_ShrecHelm,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_STTP_01()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_STTP_01,1);
	B_GiveInvItems(self,other,ItMi_Nugget,40);
	Npc_RemoveInvItems(self,ITAR_STTP_01,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_back()
{
	Info_ClearChoices(XBS_7513_DARRION_CanSellArmor_Do);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_PRISONEL()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_PRISONEL,1);
	B_GiveInvItems(self,other,ItMi_Nugget,5);
	Npc_RemoveInvItems(self,ITAR_PRISONEL,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_Prisoner()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_Prisoner,1);
	B_GiveInvItems(self,other,ItMi_Nugget,5);
	Npc_RemoveInvItems(self,ITAR_Prisoner,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_Bau_L()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_Bau_L,1);
	B_GiveInvItems(self,other,ItMi_Nugget,5);
	Npc_RemoveInvItems(self,ITAR_Bau_L,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_Vlk_L()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_Vlk_L,1);
	B_GiveInvItems(self,other,ItMi_Nugget,5);
	Npc_RemoveInvItems(self,ITAR_Vlk_L,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_Bau_M()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_Bau_M,1);
	B_GiveInvItems(self,other,ItMi_Nugget,5);
	Npc_RemoveInvItems(self,ITAR_Bau_M,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_Vlk_M()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_Vlk_M,1);
	B_GiveInvItems(self,other,ItMi_Nugget,5);
	Npc_RemoveInvItems(self,ITAR_Vlk_M,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_Vlk_H()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_Vlk_H,1);
	B_GiveInvItems(self,other,ItMi_Nugget,10);
	Npc_RemoveInvItems(self,ITAR_Vlk_H,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_SEKBED()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_SEKBED,1);
	B_GiveInvItems(self,other,ItMi_Nugget,10);
	Npc_RemoveInvItems(self,ITAR_SEKBED,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_SEKBED_V1()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_SEKBED_V1,1);
	B_GiveInvItems(self,other,ItMi_Nugget,10);
	Npc_RemoveInvItems(self,ITAR_SEKBED_V1,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_SMITH_NOV()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_SMITH_NOV,1);
	B_GiveInvItems(self,other,ItMi_Nugget,10);
	Npc_RemoveInvItems(self,ITAR_SMITH_NOV,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_SMITH_NOV_01()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_SMITH_NOV_01,1);
	B_GiveInvItems(self,other,ItMi_Nugget,10);
	Npc_RemoveInvItems(self,ITAR_SMITH_NOV_01,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_SMITH_NOV_02()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_SMITH_NOV_02,1);
	B_GiveInvItems(self,other,ItMi_Nugget,10);
	Npc_RemoveInvItems(self,ITAR_SMITH_NOV_02,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_SMITH_NOV_03()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_SMITH_NOV_03,1);
	B_GiveInvItems(self,other,ItMi_Nugget,10);
	Npc_RemoveInvItems(self,ITAR_SMITH_NOV_03,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_SMITH_NOV_04()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_SMITH_NOV_04,1);
	B_GiveInvItems(self,other,ItMi_Nugget,10);
	Npc_RemoveInvItems(self,ITAR_SMITH_NOV_04,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_SMITH_NOV_05()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_SMITH_NOV_05,1);
	B_GiveInvItems(self,other,ItMi_Nugget,10);
	Npc_RemoveInvItems(self,ITAR_SMITH_NOV_05,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_Leather_L()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_Leather_L,1);
	B_GiveInvItems(self,other,ItMi_Nugget,15);
	Npc_RemoveInvItems(self,ITAR_Leather_L,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_Leather_M()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_Leather_M,1);
	B_GiveInvItems(self,other,ItMi_Nugget,15);
	Npc_RemoveInvItems(self,ITAR_Leather_M,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_ALCHEMY_NOV()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_ALCHEMY_NOV,1);
	B_GiveInvItems(self,other,ItMi_Nugget,10);
	Npc_RemoveInvItems(self,ITAR_ALCHEMY_NOV,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_KIL_SL()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_KIL_SL,1);
	B_GiveInvItems(self,other,ItMi_Nugget,15);
	Npc_RemoveInvItems(self,ITAR_KIL_SL,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_KIL_SLS()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_KIL_SLS,1);
	B_GiveInvItems(self,other,ItMi_Nugget,20);
	Npc_RemoveInvItems(self,ITAR_KIL_SLS,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_TOWNGUARD()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_TOWNGUARD,1);
	B_GiveInvItems(self,other,ItMi_Nugget,15);
	Npc_RemoveInvItems(self,ITAR_TOWNGUARD,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_Mil_L()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_Mil_L,1);
	B_GiveInvItems(self,other,ItMi_Nugget,20);
	Npc_RemoveInvItems(self,ITAR_Mil_L,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_MIL_L_V1()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_MIL_L_V1,1);
	B_GiveInvItems(self,other,ItMi_Nugget,25);
	Npc_RemoveInvItems(self,ITAR_MIL_L_V1,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_MIL_L_V12()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_MIL_L_V12,1);
	B_GiveInvItems(self,other,ItMi_Nugget,25);
	Npc_RemoveInvItems(self,ITAR_MIL_L_V12,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_MIL_L_V13()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_MIL_L_V13,1);
	B_GiveInvItems(self,other,ItMi_Nugget,25);
	Npc_RemoveInvItems(self,ITAR_MIL_L_V13,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_MIL_L_V14()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_MIL_L_V14,1);
	B_GiveInvItems(self,other,ItMi_Nugget,25);
	Npc_RemoveInvItems(self,ITAR_MIL_L_V14,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_MIL_L_V15()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_MIL_L_V15,1);
	B_GiveInvItems(self,other,ItMi_Nugget,30);
	Npc_RemoveInvItems(self,ITAR_MIL_L_V15,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_Sld_L()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItAr_Sld_L,1);
	B_GiveInvItems(self,other,ItMi_Nugget,25);
	Npc_RemoveInvItems(self,ItAr_Sld_L,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_L_V1()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_SLD_L_V1,1);
	B_GiveInvItems(self,other,ItMi_Nugget,30);
	Npc_RemoveInvItems(self,ITAR_SLD_L_V1,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_L_V2()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_SLD_L_V2,1);
	B_GiveInvItems(self,other,ItMi_Nugget,30);
	Npc_RemoveInvItems(self,ITAR_SLD_L_V2,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_L_V3()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_SLD_L_V3,1);
	B_GiveInvItems(self,other,ItMi_Nugget,30);
	Npc_RemoveInvItems(self,ITAR_SLD_L_V3,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_L_V4()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_SLD_L_V4,1);
	B_GiveInvItems(self,other,ItMi_Nugget,30);
	Npc_RemoveInvItems(self,ITAR_SLD_L_V4,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_L_V5()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_SLD_L_V5,1);
	B_GiveInvItems(self,other,ItMi_Nugget,35);
	Npc_RemoveInvItems(self,ITAR_SLD_L_V5,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_M()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_SLD_M,1);
	B_GiveInvItems(self,other,ItMi_Nugget,40);
	Npc_RemoveInvItems(self,ITAR_SLD_M,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_M_V1()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_SLD_M_V1,1);
	B_GiveInvItems(self,other,ItMi_Nugget,45);
	Npc_RemoveInvItems(self,ITAR_SLD_M_V1,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_M_V2()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_SLD_M_V2,1);
	B_GiveInvItems(self,other,ItMi_Nugget,45);
	Npc_RemoveInvItems(self,ITAR_SLD_M_V2,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_M_V3()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_SLD_M_V3,1);
	B_GiveInvItems(self,other,ItMi_Nugget,45);
	Npc_RemoveInvItems(self,ITAR_SLD_M_V3,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_M_V4()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_SLD_M_V4,1);
	B_GiveInvItems(self,other,ItMi_Nugget,45);
	Npc_RemoveInvItems(self,ITAR_SLD_M_V4,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_M_V5()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_SLD_M_V5,1);
	B_GiveInvItems(self,other,ItMi_Nugget,50);
	Npc_RemoveInvItems(self,ITAR_SLD_M_V5,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLP_UL()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_SLP_UL,1);
	B_GiveInvItems(self,other,ItMi_Nugget,30);
	Npc_RemoveInvItems(self,ITAR_SLP_UL,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLP_L()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_SLP_L,1);
	B_GiveInvItems(self,other,ItMi_Nugget,35);
	Npc_RemoveInvItems(self,ITAR_SLP_L,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_NOV_L()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItAr_NOV_L,1);
	B_GiveInvItems(self,other,ItMi_Nugget,25);
	Npc_RemoveInvItems(self,ItAr_NOV_L,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_NDW_L()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_NDW_L,1);
	B_GiveInvItems(self,other,ItMi_Nugget,25);
	Npc_RemoveInvItems(self,ITAR_NDW_L,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_NDM_L()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_NDM_L,1);
	B_GiveInvItems(self,other,ItMi_Nugget,25);
	Npc_RemoveInvItems(self,ITAR_NDM_L,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_KDF_L()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItAr_KDF_L,1);
	B_GiveInvItems(self,other,ItMi_Nugget,30);
	Npc_RemoveInvItems(self,ItAr_KDF_L,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_KDF_M()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_KDF_M,1);
	B_GiveInvItems(self,other,ItMi_Nugget,40);
	Npc_RemoveInvItems(self,ITAR_KDF_M,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_KDF_M_NEW()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_KDF_M_NEW,1);
	B_GiveInvItems(self,other,ItMi_Nugget,40);
	Npc_RemoveInvItems(self,ITAR_KDF_M_NEW,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_KDW_L_Addon()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_KDW_L_Addon,1);
	B_GiveInvItems(self,other,ItMi_Nugget,35);
	Npc_RemoveInvItems(self,ITAR_KDW_L_Addon,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DMT_L()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DMT_L,1);
	B_GiveInvItems(self,other,ItMi_Nugget,40);
	Npc_RemoveInvItems(self,ITAR_DMT_L,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_GUR_L()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_GUR_L,1);
	B_GiveInvItems(self,other,ItMi_Nugget,40);
	Npc_RemoveInvItems(self,ITAR_GUR_L,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_MAYA_PRIEST()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_MAYA_PRIEST,1);
	B_GiveInvItems(self,other,ItMi_Nugget,45);
	Npc_RemoveInvItems(self,ITAR_MAYA_PRIEST,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_RANGER_Addon()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_RANGER_Addon,1);
	B_GiveInvItems(self,other,ItMi_Nugget,40);
	Npc_RemoveInvItems(self,ITAR_RANGER_Addon,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_RANGER_ADDON_V1()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_RANGER_ADDON_V1,1);
	B_GiveInvItems(self,other,ItMi_Nugget,45);
	Npc_RemoveInvItems(self,ITAR_RANGER_ADDON_V1,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_RANGER_ADDON_V2()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_RANGER_ADDON_V2,1);
	B_GiveInvItems(self,other,ItMi_Nugget,45);
	Npc_RemoveInvItems(self,ITAR_RANGER_ADDON_V2,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_RANGER_ADDON_V3()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_RANGER_ADDON_V3,1);
	B_GiveInvItems(self,other,ItMi_Nugget,45);
	Npc_RemoveInvItems(self,ITAR_RANGER_ADDON_V3,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_RANGER_ADDON_V4()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_RANGER_ADDON_V4,1);
	B_GiveInvItems(self,other,ItMi_Nugget,45);
	Npc_RemoveInvItems(self,ITAR_RANGER_ADDON_V4,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_RANGER_ADDON_V5()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_RANGER_ADDON_V5,1);
	B_GiveInvItems(self,other,ItMi_Nugget,50);
	Npc_RemoveInvItems(self,ITAR_RANGER_ADDON_V5,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_PIR_L_Addon()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_PIR_L_Addon,1);
	B_GiveInvItems(self,other,ItMi_Nugget,40);
	Npc_RemoveInvItems(self,ITAR_PIR_L_Addon,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_PIR_M_Addon()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_PIR_M_Addon,1);
	B_GiveInvItems(self,other,ItMi_Nugget,50);
	Npc_RemoveInvItems(self,ITAR_PIR_M_Addon,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_PIR_H_Addon()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_PIR_H_Addon,1);
	B_GiveInvItems(self,other,ItMi_Nugget,60);
	Npc_RemoveInvItems(self,ITAR_PIR_H_Addon,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_BDT_M()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItAr_BDT_M,1);
	B_GiveInvItems(self,other,ItMi_Nugget,30);
	Npc_RemoveInvItems(self,ItAr_BDT_M,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_BDT_H()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItAr_BDT_H,1);
	B_GiveInvItems(self,other,ItMi_Nugget,40);
	Npc_RemoveInvItems(self,ItAr_BDT_H,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_BDT_F()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_BDT_F,1);
	B_GiveInvItems(self,other,ItMi_Nugget,50);
	Npc_RemoveInvItems(self,ITAR_BDT_F,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_GRD_L()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_GRD_L,1);
	B_GiveInvItems(self,other,ItMi_Nugget,40);
	Npc_RemoveInvItems(self,ITAR_GRD_L,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_GRD_L_V1()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_GRD_L_V1,1);
	B_GiveInvItems(self,other,ItMi_Nugget,45);
	Npc_RemoveInvItems(self,ITAR_GRD_L_V1,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_Bloodwyn_Addon()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_Bloodwyn_Addon,1);
	B_GiveInvItems(self,other,ItMi_Nugget,50);
	Npc_RemoveInvItems(self,ITAR_Bloodwyn_Addon,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_BLOODWYN_ADDON_V1()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_BLOODWYN_ADDON_V1,1);
	B_GiveInvItems(self,other,ItMi_Nugget,55);
	Npc_RemoveInvItems(self,ITAR_BLOODWYN_ADDON_V1,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_Thorus_Addon()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_Thorus_Addon,1);
	B_GiveInvItems(self,other,ItMi_Nugget,60);
	Npc_RemoveInvItems(self,ITAR_Thorus_Addon,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_THORUS_ADDON_V1()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_THORUS_ADDON_V1,1);
	B_GiveInvItems(self,other,ItMi_Nugget,65);
	Npc_RemoveInvItems(self,ITAR_THORUS_ADDON_V1,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_OreBaron_Addon()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_OreBaron_Addon,1);
	B_GiveInvItems(self,other,ItMi_Nugget,70);
	Npc_RemoveInvItems(self,ITAR_OreBaron_Addon,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_Crawler()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DJG_Crawler,1);
	B_GiveInvItems(self,other,ItMi_Nugget,40);
	Npc_RemoveInvItems(self,ITAR_DJG_Crawler,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_MIL_M()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItAr_MIL_M,1);
	B_GiveInvItems(self,other,ItMi_Nugget,60);
	Npc_RemoveInvItems(self,ItAr_MIL_M,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_MIL_M_V1()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_MIL_M_V1,1);
	B_GiveInvItems(self,other,ItMi_Nugget,65);
	Npc_RemoveInvItems(self,ITAR_MIL_M_V1,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_MIL_M_V12()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_MIL_M_V12,1);
	B_GiveInvItems(self,other,ItMi_Nugget,65);
	Npc_RemoveInvItems(self,ITAR_MIL_M_V12,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_MIL_M_V13()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_MIL_M_V13,1);
	B_GiveInvItems(self,other,ItMi_Nugget,65);
	Npc_RemoveInvItems(self,ITAR_MIL_M_V13,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_MIL_M_V14()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_MIL_M_V14,1);
	B_GiveInvItems(self,other,ItMi_Nugget,65);
	Npc_RemoveInvItems(self,ITAR_MIL_M_V14,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_MIL_M_V15()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_MIL_M_V15,1);
	B_GiveInvItems(self,other,ItMi_Nugget,70);
	Npc_RemoveInvItems(self,ITAR_MIL_M_V15,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_PAL_L()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_PAL_L,1);
	B_GiveInvItems(self,other,ItMi_Nugget,80);
	Npc_RemoveInvItems(self,ITAR_PAL_L,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_Sld_H()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItAr_Sld_H,1);
	B_GiveInvItems(self,other,ItMi_Nugget,70);
	Npc_RemoveInvItems(self,ItAr_Sld_H,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_H_V1()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_SLD_H_V1,1);
	B_GiveInvItems(self,other,ItMi_Nugget,75);
	Npc_RemoveInvItems(self,ITAR_SLD_H_V1,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_H_V2()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_SLD_H_V2,1);
	B_GiveInvItems(self,other,ItMi_Nugget,75);
	Npc_RemoveInvItems(self,ITAR_SLD_H_V2,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_H_V3()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_SLD_H_V3,1);
	B_GiveInvItems(self,other,ItMi_Nugget,75);
	Npc_RemoveInvItems(self,ITAR_SLD_H_V3,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_H_V4()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_SLD_H_V4,1);
	B_GiveInvItems(self,other,ItMi_Nugget,75);
	Npc_RemoveInvItems(self,ITAR_SLD_H_V4,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_H_V5()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_SLD_H_V5,1);
	B_GiveInvItems(self,other,ItMi_Nugget,80);
	Npc_RemoveInvItems(self,ITAR_SLD_H_V5,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_PAL_M()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItAr_PAL_M,1);
	B_GiveInvItems(self,other,ItMi_Nugget,90);
	Npc_RemoveInvItems(self,ItAr_PAL_M,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_PAL_M_V1()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_PAL_M_V1,1);
	B_GiveInvItems(self,other,ItMi_Nugget,95);
	Npc_RemoveInvItems(self,ITAR_PAL_M_V1,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_PAL_M_V12()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_PAL_M_V12,1);
	B_GiveInvItems(self,other,ItMi_Nugget,95);
	Npc_RemoveInvItems(self,ITAR_PAL_M_V12,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_PAL_M_V13()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_PAL_M_V13,1);
	B_GiveInvItems(self,other,ItMi_Nugget,95);
	Npc_RemoveInvItems(self,ITAR_PAL_M_V13,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_PAL_M_V14()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_PAL_M_V14,1);
	B_GiveInvItems(self,other,ItMi_Nugget,95);
	Npc_RemoveInvItems(self,ITAR_PAL_M_V14,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_PAL_M_V15()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_PAL_M_V15,1);
	B_GiveInvItems(self,other,ItMi_Nugget,100);
	Npc_RemoveInvItems(self,ITAR_PAL_M_V15,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_PAL_M_V2()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_PAL_M_V2,1);
	B_GiveInvItems(self,other,ItMi_Nugget,105);
	Npc_RemoveInvItems(self,ITAR_PAL_M_V2,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_PAl_H()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItAr_PAl_H,1);
	B_GiveInvItems(self,other,ItMi_Nugget,120);
	Npc_RemoveInvItems(self,ItAr_PAl_H,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_PAL_H_V1()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_PAL_H_V1,1);
	B_GiveInvItems(self,other,ItMi_Nugget,130);
	Npc_RemoveInvItems(self,ITAR_PAL_H_V1,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_PAL_H_V12()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_PAL_H_V12,1);
	B_GiveInvItems(self,other,ItMi_Nugget,130);
	Npc_RemoveInvItems(self,ITAR_PAL_H_V12,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_PAL_H_V13()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_PAL_H_V13,1);
	B_GiveInvItems(self,other,ItMi_Nugget,130);
	Npc_RemoveInvItems(self,ITAR_PAL_H_V13,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_PAL_H_V14()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_PAL_H_V14,1);
	B_GiveInvItems(self,other,ItMi_Nugget,130);
	Npc_RemoveInvItems(self,ITAR_PAL_H_V14,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_PAL_H_V15()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_PAL_H_V15,1);
	B_GiveInvItems(self,other,ItMi_Nugget,140);
	Npc_RemoveInvItems(self,ITAR_PAL_H_V15,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_PAL_H_V2()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_PAL_H_V2,1);
	B_GiveInvItems(self,other,ItMi_Nugget,150);
	Npc_RemoveInvItems(self,ITAR_PAL_H_V2,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_L()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DJG_L,1);
	B_GiveInvItems(self,other,ItMi_Nugget,80);
	Npc_RemoveInvItems(self,ITAR_DJG_L,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_L_V1()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DJG_L_V1,1);
	B_GiveInvItems(self,other,ItMi_Nugget,90);
	Npc_RemoveInvItems(self,ITAR_DJG_L_V1,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_L_V2()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DJG_L_V2,1);
	B_GiveInvItems(self,other,ItMi_Nugget,90);
	Npc_RemoveInvItems(self,ITAR_DJG_L_V2,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_L_V3()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DJG_L_V3,1);
	B_GiveInvItems(self,other,ItMi_Nugget,90);
	Npc_RemoveInvItems(self,ITAR_DJG_L_V3,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_L_V4()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DJG_L_V4,1);
	B_GiveInvItems(self,other,ItMi_Nugget,90);
	Npc_RemoveInvItems(self,ITAR_DJG_L_V4,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_L_V5()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DJG_L_V5,1);
	B_GiveInvItems(self,other,ItMi_Nugget,100);
	Npc_RemoveInvItems(self,ITAR_DJG_L_V5,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_M()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DJG_M,1);
	B_GiveInvItems(self,other,ItMi_Nugget,110);
	Npc_RemoveInvItems(self,ITAR_DJG_M,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_M_V1()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DJG_M_V1,1);
	B_GiveInvItems(self,other,ItMi_Nugget,120);
	Npc_RemoveInvItems(self,ITAR_DJG_M_V1,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_M_V2()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DJG_M_V2,1);
	B_GiveInvItems(self,other,ItMi_Nugget,120);
	Npc_RemoveInvItems(self,ITAR_DJG_M_V2,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_M_V3()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DJG_M_V3,1);
	B_GiveInvItems(self,other,ItMi_Nugget,120);
	Npc_RemoveInvItems(self,ITAR_DJG_M_V3,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_M_V4()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DJG_M_V4,1);
	B_GiveInvItems(self,other,ItMi_Nugget,120);
	Npc_RemoveInvItems(self,ITAR_DJG_M_V4,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_M_V5()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DJG_M_V5,1);
	B_GiveInvItems(self,other,ItMi_Nugget,130);
	Npc_RemoveInvItems(self,ITAR_DJG_M_V5,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_Dargonscale()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_Dargonscale,1);
	B_GiveInvItems(self,other,ItMi_Nugget,140);
	Npc_RemoveInvItems(self,ITAR_Dargonscale,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_H()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DJG_H,1);
	B_GiveInvItems(self,other,ItMi_Nugget,140);
	Npc_RemoveInvItems(self,ITAR_DJG_H,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_H_V1()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DJG_H_V1,1);
	B_GiveInvItems(self,other,ItMi_Nugget,150);
	Npc_RemoveInvItems(self,ITAR_DJG_H_V1,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_H_V2()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DJG_H_V2,1);
	B_GiveInvItems(self,other,ItMi_Nugget,150);
	Npc_RemoveInvItems(self,ITAR_DJG_H_V2,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_H_V3()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DJG_H_V3,1);
	B_GiveInvItems(self,other,ItMi_Nugget,150);
	Npc_RemoveInvItems(self,ITAR_DJG_H_V3,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_H_V4()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DJG_H_V4,1);
	B_GiveInvItems(self,other,ItMi_Nugget,150);
	Npc_RemoveInvItems(self,ITAR_DJG_H_V4,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_H_V5()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DJG_H_V5,1);
	B_GiveInvItems(self,other,ItMi_Nugget,160);
	Npc_RemoveInvItems(self,ITAR_DJG_H_V5,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_DragonKiller()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItAr_DragonKiller,1);
	B_GiveInvItems(self,other,ItMi_Nugget,200);
	Npc_RemoveInvItems(self,ItAr_DragonKiller,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_SHVWarrior()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItAr_SHVWarrior,1);
	B_GiveInvItems(self,other,ItMi_Nugget,130);
	Npc_RemoveInvItems(self,ItAr_SHVWarrior,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_LST()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_TPL_LST,1);
	B_GiveInvItems(self,other,ItMi_Nugget,70);
	Npc_RemoveInvItems(self,ITAR_TPL_LST,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_L()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_TPL_L,1);
	B_GiveInvItems(self,other,ItMi_Nugget,80);
	Npc_RemoveInvItems(self,ITAR_TPL_L,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_L_V1()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_TPL_L_V1,1);
	B_GiveInvItems(self,other,ItMi_Nugget,90);
	Npc_RemoveInvItems(self,ITAR_TPL_L_V1,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_L_V2()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_TPL_L_V2,1);
	B_GiveInvItems(self,other,ItMi_Nugget,90);
	Npc_RemoveInvItems(self,ITAR_TPL_L_V2,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_L_V3()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_TPL_L_V3,1);
	B_GiveInvItems(self,other,ItMi_Nugget,90);
	Npc_RemoveInvItems(self,ITAR_TPL_L_V3,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_L_V4()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_TPL_L_V4,1);
	B_GiveInvItems(self,other,ItMi_Nugget,90);
	Npc_RemoveInvItems(self,ITAR_TPL_L_V4,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_L_V5()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_TPL_L_V5,1);
	B_GiveInvItems(self,other,ItMi_Nugget,100);
	Npc_RemoveInvItems(self,ITAR_TPL_L_V5,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_M()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_TPL_M,1);
	B_GiveInvItems(self,other,ItMi_Nugget,110);
	Npc_RemoveInvItems(self,ITAR_TPL_M,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_M_V1()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_TPL_M_V1,1);
	B_GiveInvItems(self,other,ItMi_Nugget,120);
	Npc_RemoveInvItems(self,ITAR_TPL_M_V1,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_M_V2()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_TPL_M_V2,1);
	B_GiveInvItems(self,other,ItMi_Nugget,120);
	Npc_RemoveInvItems(self,ITAR_TPL_M_V2,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_M_V3()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_TPL_M_V3,1);
	B_GiveInvItems(self,other,ItMi_Nugget,120);
	Npc_RemoveInvItems(self,ITAR_TPL_M_V3,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_M_V4()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_TPL_M_V4,1);
	B_GiveInvItems(self,other,ItMi_Nugget,120);
	Npc_RemoveInvItems(self,ITAR_TPL_M_V4,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_M_V5()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_TPL_M_V5,1);
	B_GiveInvItems(self,other,ItMi_Nugget,130);
	Npc_RemoveInvItems(self,ITAR_TPL_M_V5,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_S()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_TPL_S,1);
	B_GiveInvItems(self,other,ItMi_Nugget,140);
	Npc_RemoveInvItems(self,ITAR_TPL_S,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_S_V1()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_TPL_S_V1,1);
	B_GiveInvItems(self,other,ItMi_Nugget,150);
	Npc_RemoveInvItems(self,ITAR_TPL_S_V1,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_S_V2()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_TPL_S_V2,1);
	B_GiveInvItems(self,other,ItMi_Nugget,150);
	Npc_RemoveInvItems(self,ITAR_TPL_S_V2,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_S_V3()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_TPL_S_V3,1);
	B_GiveInvItems(self,other,ItMi_Nugget,150);
	Npc_RemoveInvItems(self,ITAR_TPL_S_V3,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_S_V4()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_TPL_S_V4,1);
	B_GiveInvItems(self,other,ItMi_Nugget,150);
	Npc_RemoveInvItems(self,ITAR_TPL_S_V4,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_S_V5()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_TPL_S_V5,1);
	B_GiveInvItems(self,other,ItMi_Nugget,160);
	Npc_RemoveInvItems(self,ITAR_TPL_S_V5,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_KDF_H()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItAr_KDF_H,1);
	B_GiveInvItems(self,other,ItMi_Nugget,80);
	Npc_RemoveInvItems(self,ItAr_KDF_H,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_KDF_H_BLESSED()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_KDF_H_BLESSED,1);
	B_GiveInvItems(self,other,ItMi_Nugget,90);
	Npc_RemoveInvItems(self,ITAR_KDF_H_BLESSED,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_KDF_SH()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItAr_KDF_SH,1);
	B_GiveInvItems(self,other,ItMi_Nugget,100);
	Npc_RemoveInvItems(self,ItAr_KDF_SH,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_KDW_H()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_KDW_H,1);
	B_GiveInvItems(self,other,ItMi_Nugget,80);
	Npc_RemoveInvItems(self,ITAR_KDW_H,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_KDW_SH()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItAr_KDW_SH,1);
	B_GiveInvItems(self,other,ItMi_Nugget,90);
	Npc_RemoveInvItems(self,ItAr_KDW_SH,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_KDW_ADANOS()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_KDW_ADANOS,1);
	B_GiveInvItems(self,other,ItMi_Nugget,100);
	Npc_RemoveInvItems(self,ITAR_KDW_ADANOS,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DMT_H()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DMT_H,1);
	B_GiveInvItems(self,other,ItMi_Nugget,100);
	Npc_RemoveInvItems(self,ITAR_DMT_H,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_OREARMOR()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_OREARMOR,1);
	B_GiveInvItems(self,other,ItMi_Nugget,250);
	Npc_RemoveInvItems(self,ITAR_OREARMOR,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_Raven_Addon()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_Raven_Addon,1);
	B_GiveInvItems(self,other,ItMi_Nugget,250);
	Npc_RemoveInvItems(self,ITAR_Raven_Addon,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DMT_H_BELIAR_1()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DMT_H_BELIAR_1,1);
	B_GiveInvItems(self,other,ItMi_Nugget,110);
	Npc_RemoveInvItems(self,ITAR_DMT_H_BELIAR_1,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DMT_H_BELIAR_3()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DMT_H_BELIAR_3,1);
	B_GiveInvItems(self,other,ItMi_Nugget,120);
	Npc_RemoveInvItems(self,ITAR_DMT_H_BELIAR_3,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_KDM_SH()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItAr_KDM_SH,1);
	B_GiveInvItems(self,other,ItMi_Nugget,130);
	Npc_RemoveInvItems(self,ItAr_KDM_SH,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_GUR_H()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_GUR_H,1);
	B_GiveInvItems(self,other,ItMi_Nugget,110);
	Npc_RemoveInvItems(self,ITAR_GUR_H,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_HARADRIMMAGE()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_HARADRIMMAGE,1);
	B_GiveInvItems(self,other,ItMi_Nugget,50);
	Npc_RemoveInvItems(self,ITAR_HARADRIMMAGE,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_BloodArmor()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItAr_BloodArmor,1);
	B_GiveInvItems(self,other,ItMi_Nugget,170);
	Npc_RemoveInvItems(self,ItAr_BloodArmor,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_ASSASINS_01()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_ASSASINS_01,1);
	B_GiveInvItems(self,other,ItMi_Nugget,100);
	Npc_RemoveInvItems(self,ITAR_ASSASINS_01,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_ASSASINS_02()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_ASSASINS_02,1);
	B_GiveInvItems(self,other,ItMi_Nugget,120);
	Npc_RemoveInvItems(self,ITAR_ASSASINS_02,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_ASSASINS_03()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_ASSASINS_03,1);
	B_GiveInvItems(self,other,ItMi_Nugget,80);
	Npc_RemoveInvItems(self,ITAR_ASSASINS_03,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_ASSASINS_04()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_ASSASINS_04,1);
	B_GiveInvItems(self,other,ItMi_Nugget,90);
	Npc_RemoveInvItems(self,ITAR_ASSASINS_04,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_ASSASINS_DEMONMAGE()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_ASSASINS_DEMONMAGE,1);
	B_GiveInvItems(self,other,ItMi_Nugget,150);
	Npc_RemoveInvItems(self,ITAR_ASSASINS_DEMONMAGE,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_Hun_H()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItAr_Hun_H,1);
	B_GiveInvItems(self,other,ItMi_Nugget,40);
	Npc_RemoveInvItems(self,ItAr_Hun_H,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DHT_END()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DHT_END,1);
	B_GiveInvItems(self,other,ItMi_Nugget,10);
	Npc_RemoveInvItems(self,ITAR_DHT_END,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_HuntArmor_01()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItAr_HuntArmor_01,1);
	B_GiveInvItems(self,other,ItMi_Nugget,40);
	Npc_RemoveInvItems(self,ItAr_HuntArmor_01,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_HuntArmor_02()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItAr_HuntArmor_02,1);
	B_GiveInvItems(self,other,ItMi_Nugget,60);
	Npc_RemoveInvItems(self,ItAr_HuntArmor_02,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_HuntArmor_03()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItAr_HuntArmor_03,1);
	B_GiveInvItems(self,other,ItMi_Nugget,80);
	Npc_RemoveInvItems(self,ItAr_HuntArmor_03,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_HuntArmor_04()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItAr_HuntArmor_04,1);
	B_GiveInvItems(self,other,ItMi_Nugget,100);
	Npc_RemoveInvItems(self,ItAr_HuntArmor_04,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DHT_END_1()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DHT_END_1,1);
	B_GiveInvItems(self,other,ItMi_Nugget,20);
	Npc_RemoveInvItems(self,ITAR_DHT_END_1,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DHT_END_2()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DHT_END_2,1);
	B_GiveInvItems(self,other,ItMi_Nugget,30);
	Npc_RemoveInvItems(self,ITAR_DHT_END_2,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DHT_END_3()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DHT_END_3,1);
	B_GiveInvItems(self,other,ItMi_Nugget,50);
	Npc_RemoveInvItems(self,ITAR_DHT_END_3,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DHT_END_4()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DHT_END_4,1);
	B_GiveInvItems(self,other,ItMi_Nugget,60);
	Npc_RemoveInvItems(self,ITAR_DHT_END_4,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DHT_END_5()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DHT_END_5,1);
	B_GiveInvItems(self,other,ItMi_Nugget,80);
	Npc_RemoveInvItems(self,ITAR_DHT_END_5,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DHT_END_6()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DHT_END_6,1);
	B_GiveInvItems(self,other,ItMi_Nugget,100);
	Npc_RemoveInvItems(self,ITAR_DHT_END_6,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_ASS()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_ASS,1);
	B_GiveInvItems(self,other,ItMi_Nugget,120);
	Npc_RemoveInvItems(self,ITAR_ASS,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_TOPTHIEF()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_TOPTHIEF,1);
	B_GiveInvItems(self,other,ItMi_Nugget,150);
	Npc_RemoveInvItems(self,ITAR_TOPTHIEF,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_ASGARD()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_ASGARD,1);
	B_GiveInvItems(self,other,ItMi_Nugget,180);
	Npc_RemoveInvItems(self,ITAR_ASGARD,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_ADVENTURE_HERO()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_ADVENTURE_HERO,1);
	B_GiveInvItems(self,other,ItMi_Nugget,30);
	Npc_RemoveInvItems(self,ITAR_ADVENTURE_HERO,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_OldSteelArmor()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItAr_OldSteelArmor,1);
	B_GiveInvItems(self,other,ItMi_Nugget,60);
	Npc_RemoveInvItems(self,ItAr_OldSteelArmor,1);
};