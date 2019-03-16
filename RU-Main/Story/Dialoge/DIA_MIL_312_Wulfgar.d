
instance DIA_Wulfgar_EXIT(C_Info)
{
	npc = MIL_312_Wulfgar;
	nr = 999;
	condition = DIA_Wulfgar_EXIT_Condition;
	information = DIA_Wulfgar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Wulfgar_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Wulfgar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Wulfgar_Hallo(C_Info)
{
	npc = MIL_312_Wulfgar;
	nr = 1;
	condition = DIA_Wulfgar_Hallo_Condition;
	information = DIA_Wulfgar_Hallo_Info;
	permanent = FALSE;
	description = "Каковы твои обязанности?";
};

func int DIA_Wulfgar_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Wulfgar_Hallo_Info()
{
	AI_Output(other,self,"DIA_Wulfgar_Hallo_15_00");	//Каковы твои обязанности?
	AI_Output(self,other,"DIA_Wulfgar_Hallo_04_01");	//Эти олухи машут мечами, как крестьяне.
	AI_Output(self,other,"DIA_Wulfgar_Hallo_04_02");	//Но когда они пройдут обучение под моим руководством, каждый из них станет серьезным воином!
};

instance DIA_Wulfgar_WannaJoin(C_Info)
{
	npc = MIL_312_Wulfgar;
	nr = 2;
	condition = DIA_Wulfgar_WannaJoin_Condition;
	information = DIA_Wulfgar_WannaJoin_Info;
	permanent = FALSE;
	description = "Я хочу вступить в ополчение!";
};


func int DIA_Wulfgar_WannaJoin_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wulfgar_Hallo) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Wulfgar_WannaJoin_Info()
{
	AI_Output(other,self,"DIA_Wulfgar_WannaJoin_15_00");	//Я хочу вступить в ополчение!
	AI_Output(self,other,"DIA_Wulfgar_WannaJoin_04_01");	//Да? А ты гражданин этого города?
	if(Player_IsApprentice == APP_NONE)
	{
		AI_Output(other,self,"DIA_Wulfgar_WannaJoin_15_02");	//Нет.
		AI_Output(self,other,"DIA_Wulfgar_WannaJoin_04_03");	//Тогда лорд Андрэ не примет тебя.
		AI_Output(self,other,"DIA_Wulfgar_WannaJoin_04_04");	//Конечно, ты можешь поговорить с ним, но я не думаю, что он сделает для тебя исключение.
	}
	else
	{
		AI_Output(other,self,"DIA_Wulfgar_WannaJoin_15_05");	//Да.
		AI_Output(self,other,"DIA_Wulfgar_WannaJoin_04_06");	//Тогда поговори с лордом Андрэ. Он решает, кого можно принять, а кого нет.
	};
};


instance DIA_Wulfgar_AboutMiliz(C_Info)
{
	npc = MIL_312_Wulfgar;
	nr = 3;
	condition = DIA_Wulfgar_AboutMiliz_Condition;
	information = DIA_Wulfgar_AboutMiliz_Info;
	permanent = FALSE;
	description = "Каково это, служить в ополчении?";
};


func int DIA_Wulfgar_AboutMiliz_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wulfgar_Hallo) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Wulfgar_AboutMiliz_Info()
{
	AI_Output(other,self,"DIA_Wulfgar_AboutMiliz_15_00");	//Каково это, служить в ополчении?
	AI_Output(self,other,"DIA_Wulfgar_AboutMiliz_04_01");	//Сейчас нами командует лорд Андрэ.
	AI_Output(self,other,"DIA_Wulfgar_AboutMiliz_04_02");	//Раньше ополчение подчинялось губернатору. (смеется) Он понятия не имел, чем мы занимались здесь.
	AI_Output(self,other,"DIA_Wulfgar_AboutMiliz_04_03");	//Но лорд Андрэ знает свое дело. Он заботится о своих людях.
	AI_Output(self,other,"DIA_Wulfgar_AboutMiliz_04_04");	//Каждый, кто вступает в ополчение, получает неплохие доспехи и хорошее оружие.
	AI_Output(self,other,"DIA_Wulfgar_AboutMiliz_04_05");	//А если ты выполняешь свою работу хорошо, то можешь рассчитывать на поощрение. Лорд Андрэ дает награду за каждого пойманного преступника.
};


instance DIA_Wulfgar_CanYouTrain(C_Info)
{
	npc = MIL_312_Wulfgar;
	nr = 4;
	condition = DIA_Wulfgar_CanYouTrain_Condition;
	information = DIA_Wulfgar_CanYouTrain_Info;
	permanent = FALSE;
	description = "Ты можешь обучить меня сражению на мечах?";
};


func int DIA_Wulfgar_CanYouTrain_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wulfgar_Hallo) && (other.guild != GIL_MIL))
	{
		return TRUE;
	};
};

func void DIA_Wulfgar_CanYouTrain_Info()
{
	AI_Output(other,self,"DIA_Wulfgar_CanYouTrain_15_00");	//Ты можешь обучить меня сражению на мечах?
	AI_Output(self,other,"DIA_Wulfgar_CanYouTrain_04_01");	//По приказу лорда Андрэ мы тренируем всех, кто в состоянии защищать город.

	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Wulfgar_CanYouTrain_04_02");	//Впрочем, это не касается наемников. Забудь об этом.
	}
	else
	{
		AI_Output(self,other,"DIA_Wulfgar_CanYouTrain_04_03");	//Но это касается только боевого обучения. Все остальные виды обучения предназначены только для ополчения.
		AI_Output(self,other,"DIA_Wulfgar_CanYouTrain_04_04");	//А ты меч-то можешь удержать?
		AI_Output(other,self,"DIA_Wulfgar_CanYouTrain_15_05");	//Думаю, что да...
		AI_Output(self,other,"DIA_Wulfgar_CanYouTrain_04_06");	//(вздыхает) Хорошо, ты можешь приступать, когда пожелаешь.
		Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
		B_LogEntry(TOPIC_CityTeacher,"Вульфгар, городской гвардеец, может обучить меня искусству обращения с одноручным и двуручным оружием.");
		Wulfgar_Teach1H = TRUE;
	};
};


instance DIA_Wulfgar_Advantage(C_Info)
{
	npc = MIL_312_Wulfgar;
	nr = 5;
	condition = DIA_Wulfgar_Advantage_Condition;
	information = DIA_Wulfgar_Advantage_Info;
	permanent = FALSE;
	description = "Каковы преимущества двуручного оружия?";
};


func int DIA_Wulfgar_Advantage_Condition()
{
	if((Wulfgar_Teach1H == TRUE) || (other.guild != GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Wulfgar_Advantage_Info()
{
	AI_Output(other,self,"DIA_Wulfgar_Advantage_15_00");	//Каковы преимущества двуручного оружия?
	AI_Output(self,other,"DIA_Wulfgar_Advantage_04_01");	//Это просто. С одноручным оружием ты быстрее. Это может стать значительным преимуществом в бою.
	AI_Output(self,other,"DIA_Wulfgar_Advantage_04_02");	//Двуручное оружие более тяжеловесно и замедляет тебя. При сражении им нужно просчитывать свои действия на шаг вперед, но оно наносит больший урон.
};

instance DIA_Wulfgar_Teach(C_Info)
{
	npc = MIL_312_Wulfgar;
	nr = 7;
	condition = DIA_Wulfgar_Teach_Condition;
	information = DIA_Wulfgar_Teach_Info;
	permanent = TRUE;
	description = "Начнем обучение.";
};

func int DIA_Wulfgar_Teach_Condition()
{
	if((Wulfgar_Teach1H == TRUE) || (other.guild == GIL_MIL))
	{
		return TRUE;
	};
};

func void DIA_Wulfgar_Teach_Info()
{
	AI_Output(other,self,"DIA_Wulfgar_Teach_15_00");	//Начнем обучение.

	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Wulfgar_Add_04_00");	//Я не обучаю наемников!
	}
	else
	{
		if((other.guild == GIL_KDF) || (other.guild == GIL_KDW) || (other.guild == GIL_KDM))
		{
			AI_Output(self,other,"DIA_Wulfgar_Add_04_01");	//Конечно, уважаемый.
		};

		Info_ClearChoices(DIA_Wulfgar_Teach);
		Info_AddChoice(DIA_Wulfgar_Teach,Dialog_Back,DIA_Wulfgar_Teach_Back);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_wulfgar_teach_stamina_1);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_wulfgar_teach_stamina_5);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_wulfgar_teach_hp_1);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_wulfgar_teach_hp_5);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Wulfgar_Teach_2H_1);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Wulfgar_Teach_2H_5);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Wulfgar_Teach_1H_1);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Wulfgar_Teach_1H_5);

		if((Kapitel >= 2) && (VATRAS_TEACHREGENSTAM == FALSE) && ((other.guild == GIL_MIL) || (other.guild == GIL_PAL))) 
		{
			Info_AddChoice(DIA_Wulfgar_Teach,"Регенерация выносливости (Очки обучения: 10, Цена: 5000 монет)",DIA_Wulfgar_Teach_RegenStam);
		};
	};
};

func void DIA_Wulfgar_Teach_Back()
{
	Info_ClearChoices(DIA_Wulfgar_Teach);
};

func void DIA_Wulfgar_Teach_RegenStam()
{
	var int kosten;
	var int money;

	AI_Output(other,self,"DIA_Vatras_Teach_regen_15_03");	//Научи меня ускоренному восстановлению выносливости.

	kosten = 10;
	money = 5000;

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		AI_StopProcessInfos(self);
	};
	if(Npc_HasItems(other,ItMi_Gold) < money)
	{
		AI_Print(Print_NotEnoughGold);
		AI_StopProcessInfos(self);
	};
	if((hero.lp >= kosten) && (Npc_HasItems(other,ItMi_Gold) >= money))
	{
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + kosten;
		Npc_RemoveInvItems(other,ItMi_Gold,money);
		AI_Print("Обучение: Ускоренная регенерация выносливости");
		VATRAS_TEACHREGENSTAM = TRUE;
		Snd_Play("LevelUP");
	};

	Info_ClearChoices(DIA_Wulfgar_Teach);
	Info_AddChoice(DIA_Wulfgar_Teach,Dialog_Back,DIA_Wulfgar_Teach_Back);
	Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_wulfgar_teach_stamina_1);
	Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_wulfgar_teach_stamina_5);
	Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_wulfgar_teach_hp_1);
	Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_wulfgar_teach_hp_5);
	Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Wulfgar_Teach_2H_1);
	Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Wulfgar_Teach_2H_5);
	Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Wulfgar_Teach_1H_1);
	Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Wulfgar_Teach_1H_5);
};

func void DIA_Wulfgar_Teach_1H_1()
{
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,60))
		{
			Info_ClearChoices(DIA_Wulfgar_Teach);
			Info_AddChoice(DIA_Wulfgar_Teach,Dialog_Back,DIA_Wulfgar_Teach_Back);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_wulfgar_teach_stamina_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_wulfgar_teach_stamina_5);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_wulfgar_teach_hp_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_wulfgar_teach_hp_5);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Wulfgar_Teach_2H_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Wulfgar_Teach_2H_5);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Wulfgar_Teach_1H_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Wulfgar_Teach_1H_5);

			if((Kapitel >= 2) && (VATRAS_TEACHREGENSTAM == FALSE) && ((other.guild == GIL_MIL) || (other.guild == GIL_PAL))) 
			{
				Info_AddChoice(DIA_Wulfgar_Teach,"Регенерация выносливости (Очки обучения: 10, Цена: 5000 монет)",DIA_Wulfgar_Teach_RegenStam);
			};
		};
	}
	else
	{
		if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,30))
		{
			Info_ClearChoices(DIA_Wulfgar_Teach);
			Info_AddChoice(DIA_Wulfgar_Teach,Dialog_Back,DIA_Wulfgar_Teach_Back);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_wulfgar_teach_stamina_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_wulfgar_teach_stamina_5);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_wulfgar_teach_hp_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_wulfgar_teach_hp_5);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Wulfgar_Teach_2H_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Wulfgar_Teach_2H_5);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Wulfgar_Teach_1H_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Wulfgar_Teach_1H_5);

			if((Kapitel >= 2) && (VATRAS_TEACHREGENSTAM == FALSE) && ((other.guild == GIL_MIL) || (other.guild == GIL_PAL))) 
			{
				Info_AddChoice(DIA_Wulfgar_Teach,"Регенерация выносливости (Очки обучения: 10, Цена: 5000 монет)",DIA_Wulfgar_Teach_RegenStam);
			};
		};
	};
};

func void DIA_Wulfgar_Teach_1H_5()
{
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,60))
		{
			Info_ClearChoices(DIA_Wulfgar_Teach);
			Info_AddChoice(DIA_Wulfgar_Teach,Dialog_Back,DIA_Wulfgar_Teach_Back);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_wulfgar_teach_stamina_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_wulfgar_teach_stamina_5);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_wulfgar_teach_hp_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_wulfgar_teach_hp_5);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Wulfgar_Teach_2H_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Wulfgar_Teach_2H_5);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Wulfgar_Teach_1H_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Wulfgar_Teach_1H_5);

			if((Kapitel >= 2) && (VATRAS_TEACHREGENSTAM == FALSE) && ((other.guild == GIL_MIL) || (other.guild == GIL_PAL))) 
			{
				Info_AddChoice(DIA_Wulfgar_Teach,"Регенерация выносливости (Очки обучения: 10, Цена: 5000 монет)",DIA_Wulfgar_Teach_RegenStam);
			};
		};
	}
	else
	{
		if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,30))
		{
			Info_ClearChoices(DIA_Wulfgar_Teach);
			Info_AddChoice(DIA_Wulfgar_Teach,Dialog_Back,DIA_Wulfgar_Teach_Back);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_wulfgar_teach_stamina_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_wulfgar_teach_stamina_5);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_wulfgar_teach_hp_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_wulfgar_teach_hp_5);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Wulfgar_Teach_2H_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Wulfgar_Teach_2H_5);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Wulfgar_Teach_1H_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Wulfgar_Teach_1H_5);

			if((Kapitel >= 2) && (VATRAS_TEACHREGENSTAM == FALSE) && ((other.guild == GIL_MIL) || (other.guild == GIL_PAL))) 
			{
				Info_AddChoice(DIA_Wulfgar_Teach,"Регенерация выносливости (Очки обучения: 10, Цена: 5000 монет)",DIA_Wulfgar_Teach_RegenStam);
			};
		};
	};
};

func void DIA_Wulfgar_Teach_2H_1()
{
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,60))
		{
			Info_ClearChoices(DIA_Wulfgar_Teach);
			Info_AddChoice(DIA_Wulfgar_Teach,Dialog_Back,DIA_Wulfgar_Teach_Back);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_wulfgar_teach_stamina_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_wulfgar_teach_stamina_5);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_wulfgar_teach_hp_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_wulfgar_teach_hp_5);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Wulfgar_Teach_2H_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Wulfgar_Teach_2H_5);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Wulfgar_Teach_1H_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Wulfgar_Teach_1H_5);

			if((Kapitel >= 2) && (VATRAS_TEACHREGENSTAM == FALSE) && ((other.guild == GIL_MIL) || (other.guild == GIL_PAL))) 
			{
				Info_AddChoice(DIA_Wulfgar_Teach,"Регенерация выносливости (Очки обучения: 10, Цена: 5000 монет)",DIA_Wulfgar_Teach_RegenStam);
			};
		};
	}
	else
	{
		if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,30))
		{
			Info_ClearChoices(DIA_Wulfgar_Teach);
			Info_AddChoice(DIA_Wulfgar_Teach,Dialog_Back,DIA_Wulfgar_Teach_Back);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_wulfgar_teach_stamina_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_wulfgar_teach_stamina_5);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_wulfgar_teach_hp_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_wulfgar_teach_hp_5);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Wulfgar_Teach_2H_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Wulfgar_Teach_2H_5);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Wulfgar_Teach_1H_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Wulfgar_Teach_1H_5);

			if((Kapitel >= 2) && (VATRAS_TEACHREGENSTAM == FALSE) && ((other.guild == GIL_MIL) || (other.guild == GIL_PAL))) 
			{
				Info_AddChoice(DIA_Wulfgar_Teach,"Регенерация выносливости (Очки обучения: 10, Цена: 5000 монет)",DIA_Wulfgar_Teach_RegenStam);
			};
		};
	};
};

func void DIA_Wulfgar_Teach_2H_5()
{
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,60))
		{
			Info_ClearChoices(DIA_Wulfgar_Teach);
			Info_AddChoice(DIA_Wulfgar_Teach,Dialog_Back,DIA_Wulfgar_Teach_Back);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_wulfgar_teach_stamina_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_wulfgar_teach_stamina_5);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_wulfgar_teach_hp_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_wulfgar_teach_hp_5);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Wulfgar_Teach_2H_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Wulfgar_Teach_2H_5);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Wulfgar_Teach_1H_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Wulfgar_Teach_1H_5);
		};
	}
	else
	{
		if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,30))
		{
			Info_ClearChoices(DIA_Wulfgar_Teach);
			Info_AddChoice(DIA_Wulfgar_Teach,Dialog_Back,DIA_Wulfgar_Teach_Back);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_wulfgar_teach_stamina_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_wulfgar_teach_stamina_5);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_wulfgar_teach_hp_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_wulfgar_teach_hp_5);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Wulfgar_Teach_2H_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Wulfgar_Teach_2H_5);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Wulfgar_Teach_1H_1);
			Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Wulfgar_Teach_1H_5);
		};
	};
};

func void dia_wulfgar_teach_stamina_1()
{
	if(b_teachstamina(self,other,NPC_TALENT_STAMINA,1))
	{
		Info_ClearChoices(DIA_Wulfgar_Teach);
		Info_AddChoice(DIA_Wulfgar_Teach,Dialog_Back,DIA_Wulfgar_Teach_Back);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_wulfgar_teach_stamina_1);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_wulfgar_teach_stamina_5);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_wulfgar_teach_hp_1);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_wulfgar_teach_hp_5);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Wulfgar_Teach_2H_1);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Wulfgar_Teach_2H_5);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Wulfgar_Teach_1H_1);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Wulfgar_Teach_1H_5);
	};
};

func void dia_wulfgar_teach_stamina_5()
{
	if(b_teachstamina(self,other,NPC_TALENT_STAMINA,5))
	{
		Info_ClearChoices(DIA_Wulfgar_Teach);
		Info_AddChoice(DIA_Wulfgar_Teach,Dialog_Back,DIA_Wulfgar_Teach_Back);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_wulfgar_teach_stamina_1);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_wulfgar_teach_stamina_5);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_wulfgar_teach_hp_1);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_wulfgar_teach_hp_5);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Wulfgar_Teach_2H_1);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Wulfgar_Teach_2H_5);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Wulfgar_Teach_1H_1);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Wulfgar_Teach_1H_5);
	};
};

func void dia_wulfgar_teach_hp_1()
{
	if(b_teachattributepointshitpoints(self,other,ATR_HITPOINTS_MAX,1,T_MAX_HP))
	{
		Info_ClearChoices(DIA_Wulfgar_Teach);
		Info_AddChoice(DIA_Wulfgar_Teach,Dialog_Back,DIA_Wulfgar_Teach_Back);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_wulfgar_teach_stamina_1);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_wulfgar_teach_stamina_5);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_wulfgar_teach_hp_1);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_wulfgar_teach_hp_5);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Wulfgar_Teach_2H_1);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Wulfgar_Teach_2H_5);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Wulfgar_Teach_1H_1);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Wulfgar_Teach_1H_5);
	};
};

func void dia_wulfgar_teach_hp_5()
{
	if(b_teachattributepointshitpoints(self,other,ATR_HITPOINTS_MAX,5,T_MAX_HP))
	{
		Info_ClearChoices(DIA_Wulfgar_Teach);
		Info_AddChoice(DIA_Wulfgar_Teach,Dialog_Back,DIA_Wulfgar_Teach_Back);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_wulfgar_teach_stamina_1);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_wulfgar_teach_stamina_5);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_wulfgar_teach_hp_1);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_wulfgar_teach_hp_5);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Wulfgar_Teach_2H_1);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Wulfgar_Teach_2H_5);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Wulfgar_Teach_1H_1);
		Info_AddChoice(DIA_Wulfgar_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Wulfgar_Teach_1H_5);
	};
};


instance DIA_Wulfgar_AlsMil(C_Info)
{
	npc = MIL_312_Wulfgar;
	nr = 1;
	condition = DIA_Wulfgar_AlsMil_Condition;
	information = DIA_Wulfgar_AlsMil_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Wulfgar_AlsMil_Condition()
{
	if(other.guild == GIL_MIL)
	{
		return TRUE;
	};
};

func void DIA_Wulfgar_AlsMil_Info()
{
	AI_Output(self,other,"DIA_Wulfgar_AlsMil_04_00");	//Значит, лорд Андрэ принял тебя!
	AI_Output(self,other,"DIA_Wulfgar_AlsMil_04_01");	//Я надеюсь, ты будешь регулярно тренироваться здесь.
	AI_Output(self,other,"DIA_Wulfgar_AlsMil_04_02");	//Руга научит тебя пользоваться арбалетом, а Мортис поможет тебе стать сильнее.
	AI_Output(self,other,"DIA_Wulfgar_AlsMil_04_03");	//Но самое важное - это научиться правильно держать свой меч.
	AI_Output(self,other,"DIA_Wulfgar_AlsMil_04_04");	//Я еще сделаю из тебя отличного воина!
};


instance DIA_Wulfgar_Bonus(C_Info)
{
	npc = MIL_312_Wulfgar;
	nr = 2;
	condition = DIA_Wulfgar_Bonus_Condition;
	information = DIA_Wulfgar_Bonus_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Wulfgar_Bonus_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && Wld_IsTime(5,2,6,54))
	{
		return TRUE;
	};
};

func void DIA_Wulfgar_Bonus_Info()
{
	AI_Output(self,other,"DIA_Wulfgar_Bonus_04_00");	//Ранняя пташка? Я обычно один в это время дня. Но раз уж ты здесь, то можно потренироваться.
	AI_Output(self,other,"DIA_Wulfgar_Bonus_04_01");	//Будь внимательным. Ты можешь обмануть некоторых противников, если уклонишься от удара, а затем атакуешь в правильный момент.
	AI_Output(self,other,"DIA_Wulfgar_Bonus_04_02");	//Помни об этом в своем следующем бою!

	if(other.HitChance[NPC_TALENT_1H] >= other.HitChance[NPC_TALENT_2H])
	{
		B_RaiseFightTalent_Bonus(other,NPC_TALENT_1H,1);
	}
	else
	{
		B_RaiseFightTalent_Bonus(other,NPC_TALENT_2H,1);
	};
};


instance DIA_Wulfgar_PICKPOCKET(C_Info)
{
	npc = MIL_312_Wulfgar;
	nr = 900;
	condition = DIA_Wulfgar_PICKPOCKET_Condition;
	information = DIA_Wulfgar_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Wulfgar_PICKPOCKET_Condition()
{
	return C_Beklauen(58,80);
};

func void DIA_Wulfgar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Wulfgar_PICKPOCKET);
	Info_AddChoice(DIA_Wulfgar_PICKPOCKET,Dialog_Back,DIA_Wulfgar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Wulfgar_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Wulfgar_PICKPOCKET_DoIt);
};

func void DIA_Wulfgar_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Wulfgar_PICKPOCKET);
};

func void DIA_Wulfgar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Wulfgar_PICKPOCKET);
};

instance DIA_Wulfgar_Bandits(C_Info)
{
	npc = MIL_312_Wulfgar;
	nr = 1;
	condition = DIA_Wulfgar_Bandits_Condition;
	information = DIA_Wulfgar_Bandits_Info;
	permanent = FALSE;
	description = "У тебя есть для меня какие-нибудь поручения?";
};

func int DIA_Wulfgar_Bandits_Condition()
{
	if((hero.guild == GIl_MIL) && (MIS_Andre_REDLIGHT == LOG_SUCCESS) && (MIS_Andre_Peck == LOG_SUCCESS) && (DexterIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Wulfgar_Bandits_Info()
{
	AI_Output(other,self,"DIA_Wulfgar_Bandits_01_00");	//У тебя есть для меня какие-нибудь поручения?
	AI_Output(self,other,"DIA_Wulfgar_Bandits_01_01");	//Ну, поскольку ты теперь состоишь в городском ополчении, для тебя найдется работенка.
	AI_Output(other,self,"DIA_Wulfgar_Bandits_01_02");	//Что надо делать?
	AI_Output(self,other,"DIA_Wulfgar_Bandits_01_03");	//(серьезно) Слушай внимательно. Недавно бандитами было совершено несколько нападений на близлежащие фермы.
	AI_Output(self,other,"DIA_Wulfgar_Bandits_01_04");	//Нам, конечно, удалось вовремя подоспеть на помощь и отбить их атаку. Но меня беспокоит совсем иное.
	AI_Output(other,self,"DIA_Wulfgar_Bandits_01_05");	//А что именно?
	AI_Output(self,other,"DIA_Wulfgar_Bandits_01_06");	//Они действовали слишком организованно для простых бандитов!
	AI_Output(self,other,"DIA_Wulfgar_Bandits_01_07");	//Нам удалось допросить одного из них.
	AI_Output(self,other,"DIA_Wulfgar_Bandits_01_08");	//И если верить его словам, сейчас вокруг Хориниса рассредоточено несколько крупных бандитских групп.
	AI_Output(self,other,"DIA_Wulfgar_Bandits_01_09");	//К сожалению, он не успел рассказать нам, где точно находятся их логова.
	AI_Output(self,other,"DIA_Wulfgar_Bandits_01_10");	//А потому эту задачу я возлагаю на тебя.
	AI_Output(other,self,"DIA_Wulfgar_Bandits_01_11");	//Но мне одному будет сложно справится с целой бандой!
	AI_Output(self,other,"DIA_Wulfgar_Bandits_01_12");	//Этого я и не прошу тебя делать. Будет достаточно просто выследить их.
	AI_Output(self,other,"DIA_Wulfgar_Bandits_01_13");	//А уж мы с ребятами позже позаботимся о том, чтобы все они оказались на виселице!
	AI_Output(self,other,"DIA_Wulfgar_Bandits_01_14");	//Но главное, нам надо понять, кто именно координирует их действия.
	AI_Output(self,other,"DIA_Wulfgar_Bandits_01_15");	//Без этого все наши усилия будут тщетны.
	AI_Output(other,self,"DIA_Wulfgar_Bandits_01_16");	//Ладно. Постараюсь сделать все, что в моих силах. На какие фермы были совершены нападения?
	AI_Output(self,other,"DIA_Wulfgar_Bandits_01_17");	//На ферму Акила и Лобарта. Так что для начала стоит начать поиски бандитов именно там.
	MIS_WulfgarBandits = LOG_Running;
	Log_CreateTopic(TOPIC_WulfgarBandits,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_WulfgarBandits,LOG_Running);
	B_LogEntry(TOPIC_WulfgarBandits,"Вульфгар поручил мне найти бандитов, совершивших нападения на фермы Акила и Лобарта. Он хочет знать, кто именно координирует их действия.");
};

instance DIA_Wulfgar_Bandits_Letter(C_Info)
{
	npc = MIL_312_Wulfgar;
	nr = 1;
	condition = DIA_Wulfgar_Bandits_Letter_Condition;
	information = DIA_Wulfgar_Bandits_Letter_Info;
	permanent = FALSE;
	description = "У меня есть письмо для главаря бандитов.";
};

func int DIA_Wulfgar_Bandits_Letter_Condition()
{
	if((MIS_WulfgarBandits == LOG_Running) && (Npc_HasItems(other,ItWr_DexterOrder) >= 1) && (Npc_HasItems(other,ItWr_DexTrait) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Wulfgar_Bandits_Letter_Info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Wulfgar_Bandits_Letter_01_00");	//У меня есть письмо для главаря бандитов.
	AI_Output(self,other,"DIA_Wulfgar_Bandits_Letter_01_01");	//Дай мне взглянуть на него. Быстрей!
	AI_Output(other,self,"DIA_Wulfgar_Bandits_Letter_01_02");	//Держи.
	B_GiveInvItems(other,self,ItWr_DexterOrder,1);
	Npc_RemoveInvItems(self,ItWr_DexterOrder,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Wulfgar_Bandits_Letter_01_03");	//Этого еще не хватало! Значит, среди нас есть предатель.
	AI_Output(self,other,"DIA_Wulfgar_Bandits_Letter_01_04");	//Хорошие новости! Теперь понятно, почему они действовали так слаженно.
	AI_Output(self,other,"DIA_Wulfgar_Bandits_Letter_01_05");	//Ведь они наперед знали о всех наших планах и действиях.
	AI_Output(other,self,"DIA_Wulfgar_Bandits_Letter_01_06");	//И что мы теперь будем делать?
	AI_Output(self,other,"DIA_Wulfgar_Bandits_Letter_01_07");	//(грозно) Нам необходимо любой ценой вычислить этого мерзавца!
	AI_Output(self,other,"DIA_Wulfgar_Bandits_Letter_01_08");	//Иначе рано или поздно нам всем придется несладко.
	AI_Output(other,self,"DIA_Wulfgar_Bandits_Letter_01_09");	//А как нам это сделать?
	AI_Output(self,other,"DIA_Wulfgar_Bandits_Letter_01_10");	//Я уверен: тот, кто написал это письмо, должен обладать нужной информацией.
	AI_Output(self,other,"DIA_Wulfgar_Bandits_Letter_01_11");	//Найди его и допроси. Но не убивай, пока не узнаешь имя предателя.
	AI_Output(self,other,"DIA_Wulfgar_Bandits_Letter_01_12");	//Ты все понял?
	AI_Output(other,self,"DIA_Wulfgar_Bandits_Letter_01_13");	//Да, все предельно ясно.
	AI_Output(self,other,"DIA_Wulfgar_Bandits_Letter_01_14");	//Тогда поспеши - сейчас дорога каждая минута.
	WulfgarSendDexter = TRUE;
	B_LogEntry(TOPIC_WulfgarBandits,"Вульфгар был вне себя от злости, узнав, что среди ополчения появился предатель. Он поручил мне найти автора письма и выбить из него имя этого мерзавца.");
};

instance DIA_Wulfgar_Bandits_Done(C_Info)
{
	npc = MIL_312_Wulfgar;
	nr = 1;
	condition = DIA_Wulfgar_Bandits_Done_Condition;
	information = DIA_Wulfgar_Bandits_Done_Info;
	permanent = FALSE;
	description = "Взгляни на это письмо.";
};

func int DIA_Wulfgar_Bandits_Done_Condition()
{
	if((MIS_WulfgarBandits == LOG_Running) && (Npc_HasItems(other,ItWr_DexTrait) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Wulfgar_Bandits_Done_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Wulfgar_Bandits_Done_01_00");	//Взгляни на это письмо.
	B_GiveInvItems(other,self,ItWr_DexTrait,1);
	Npc_RemoveInvItems(self,ItWr_DexTrait,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Wulfgar_Bandits_Done_01_01");	//Так вот, кто эта крыса! Я так и думал.
	AI_Output(self,other,"DIA_Wulfgar_Bandits_Done_01_02");	//Теперь понятно, откуда у этого мерзавца столько золота, что он сорит им в кабаке и борделе.
	AI_Output(self,other,"DIA_Wulfgar_Bandits_Done_01_03");	//Но его сладкой жизни пришел конец. Я немедленно отдам приказ о его аресте!
	AI_Output(self,other,"DIA_Wulfgar_Bandits_Done_01_04");	//Тебя же я благодарю от имени всего ополчения!
	AI_Output(self,other,"DIA_Wulfgar_Bandits_Done_01_05");	//И в доказательство моих слов - прими эти доспехи.
	B_GiveInvItems(self,other,ItAr_MIL_M,1);
	AI_Output(self,other,"DIA_Wulfgar_Bandits_Done_01_06");	//Ты их по праву заслужил, солдат!
	MIS_WulfgarBandits = LOG_Success;
	SHOW_ITAR_MIL_M = TRUE;
	Log_SetTopicStatus(TOPIC_WulfgarBandits,LOG_Success);
	B_LogEntry(TOPIC_WulfgarBandits,"Я отдал Вульфгару письмо Декстера, написанное ополченцем Пеком. Теперь этого парня ждут неприятности. Что ж, предателей никто и нигде не любит.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(MIL_324_Peck,"Jail");
	AI_Teleport(MIL_324_Peck,"NW_CITY_HABOUR_KASERN_HALVOR");
};