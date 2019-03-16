
instance DIA_Girion_DI_XIT(C_Info)
{
	npc = Pal_207_Girion_DI;
	nr = 999;
	condition = DIA_Girion_DI_EXIT_Condition;
	information = DIA_Girion_DI_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Girion_DI_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Girion_DI_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Girion_DI_Hallo(C_Info)
{
	npc = Pal_207_Girion_DI;
	nr = 2;
	condition = DIA_Girion_DI_Hallo_Condition;
	information = DIA_Girion_DI_Hallo_Info;
	permanent = TRUE;
	description = "Все в порядке?";
};


func int DIA_Girion_DI_Hallo_Condition()
{
	if(UndeadDragonIsDead == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Girion_DI_Hallo_Info()
{
	AI_Output(other,self,"DIA_Girion_DI_Hallo_15_00");	//Все в порядке?
	if(ORkSturmDI == TRUE)
	{
		AI_Output(self,other,"DIA_Girion_DI_Hallo_08_01");	//У орков хватило мужества, чтобы атаковать меня.
		AI_Output(self,other,"DIA_Girion_DI_Hallo_08_02");	//Но им стоило лучше подумать, прежде чем нападать на паладина из королевской стражи.
	}
	else if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Girion_DI_Hallo_08_03");	//Думаю, да. Долго ты еще будешь возиться на этом утесе?
	}
	else
	{
		AI_Output(self,other,"DIA_Girion_DI_Hallo_08_04");	//Не считай меня за идиота. Делай то, что нужно сделать, и побыстрее возвращай корабль мне.
	};
};


instance DIA_Girion_DI_Teach(C_Info)
{
	npc = Pal_207_Girion_DI;
	nr = 5;
	condition = DIA_Girion_DI_Teach_Condition;
	information = DIA_Girion_DI_Teach_Info;
	permanent = TRUE;
	description = "Обучи меня, тогда мы сможем убраться отсюда быстрее!";
};


func int DIA_Girion_DI_Teach_Condition()
{
	if(UndeadDragonIsDead == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Girion_DI_Teach_Info()
{
	AI_Output(other,self,"DIA_Girion_DI_Teach_15_00");	//Обучи меня, тогда мы сможем быстрее убраться с этого острова.
	AI_Output(self,other,"DIA_Girion_DI_Teach_08_01");	//Похоже, у меня нет другого выбора.
	Info_ClearChoices(DIA_Girion_DI_Teach);
	Info_AddChoice(DIA_Girion_DI_Teach,Dialog_Back,DIA_Girion_DI_Teach_Back);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Girion_DI_Teach_CROSSBOW_1);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Girion_DI_Teach_CROSSBOW_5);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Girion_DI_Teach_2H_1);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Girion_DI_Teach_2H_5);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Girion_DI_Teach_1H_1);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Girion_DI_Teach_1H_5);
};

func void DIA_Girion_DI_Teach_CROSSBOW_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,1,90))
	{
		AI_Output(self,other,"DIA_Girion_DI_Teach_CROSSBOW_1_08_00");	//При стрельбе никогда не опирайся локтями. Это сделает твою хватку слишком жесткой, и ты неизбежно собьешь прицел.
	};
	Info_ClearChoices(DIA_Girion_DI_Teach);
	Info_AddChoice(DIA_Girion_DI_Teach,Dialog_Back,DIA_Girion_DI_Teach_Back);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Girion_DI_Teach_CROSSBOW_1);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Girion_DI_Teach_CROSSBOW_5);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Girion_DI_Teach_2H_1);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Girion_DI_Teach_2H_5);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Girion_DI_Teach_1H_1);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Girion_DI_Teach_1H_5);
};

func void DIA_Girion_DI_Teach_CROSSBOW_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,5,90))
	{
		AI_Output(self,other,"DIA_Girion_DI_Teach_CROSSBOW_5_08_00");	//Всегда расслабляй свою левую руку перед выстрелом. Это позволит тебе более точно прицелиться.
	};
	Info_ClearChoices(DIA_Girion_DI_Teach);
	Info_AddChoice(DIA_Girion_DI_Teach,Dialog_Back,DIA_Girion_DI_Teach_Back);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Girion_DI_Teach_CROSSBOW_1);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Girion_DI_Teach_CROSSBOW_5);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Girion_DI_Teach_2H_1);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Girion_DI_Teach_2H_5);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Girion_DI_Teach_1H_1);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Girion_DI_Teach_1H_5);
};

func void DIA_Girion_DI_Teach_1H_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,90))
	{
		AI_Output(self,other,"DIA_Girion_DI_Teach_1H_1_08_00");	//Твое лезвие должно скользить по воздуху, как камыш на побережье.
	};
	Info_ClearChoices(DIA_Girion_DI_Teach);
	Info_AddChoice(DIA_Girion_DI_Teach,Dialog_Back,DIA_Girion_DI_Teach_Back);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Girion_DI_Teach_CROSSBOW_1);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Girion_DI_Teach_CROSSBOW_5);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Girion_DI_Teach_2H_1);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Girion_DI_Teach_2H_5);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Girion_DI_Teach_1H_1);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Girion_DI_Teach_1H_5);
};

func void DIA_Girion_DI_Teach_1H_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,90))
	{
		AI_Output(self,other,"DIA_Girion_DI_Teach_1H_5_08_00");	//Силу нужно применять расчетливо. Если ты слепо будешь бросаться на противника, это не приведет тебя к успеху.
	};
	Info_ClearChoices(DIA_Girion_DI_Teach);
	Info_AddChoice(DIA_Girion_DI_Teach,Dialog_Back,DIA_Girion_DI_Teach_Back);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Girion_DI_Teach_CROSSBOW_1);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Girion_DI_Teach_CROSSBOW_5);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Girion_DI_Teach_2H_1);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Girion_DI_Teach_2H_5);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Girion_DI_Teach_1H_1);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Girion_DI_Teach_1H_5);
};

func void DIA_Girion_DI_Teach_2H_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,90))
	{
		AI_Output(self,other,"DIA_DIA_Girion_DI_Teach_2H_1_08_00");	//Не сжимай судорожно руку, тогда твой удар встретит свою цель.
	};
	Info_ClearChoices(DIA_Girion_DI_Teach);
	Info_AddChoice(DIA_Girion_DI_Teach,Dialog_Back,DIA_Girion_DI_Teach_Back);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Girion_DI_Teach_CROSSBOW_1);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Girion_DI_Teach_CROSSBOW_5);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Girion_DI_Teach_2H_1);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Girion_DI_Teach_2H_5);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Girion_DI_Teach_1H_1);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Girion_DI_Teach_1H_5);
};

func void DIA_Girion_DI_Teach_2H_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,90))
	{
		AI_Output(self,other,"DIA_Girion_DI_Teach_2H_5_08_00");	//Не забывай защищаться. Но лучшая защита все же - уклоняться от удара противника.
	};
	Info_ClearChoices(DIA_Girion_DI_Teach);
	Info_AddChoice(DIA_Girion_DI_Teach,Dialog_Back,DIA_Girion_DI_Teach_Back);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Girion_DI_Teach_CROSSBOW_1);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Girion_DI_Teach_CROSSBOW_5);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Girion_DI_Teach_2H_1);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Girion_DI_Teach_2H_5);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Girion_DI_Teach_1H_1);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Girion_DI_Teach_1H_5);
};

func void DIA_Girion_DI_Teach_Back()
{
	Info_ClearChoices(DIA_Girion_DI_Teach);
};


instance DIA_Girion_DI_OrcEliteRing(C_Info)
{
	npc = Pal_207_Girion_DI;
	nr = 99;
	condition = DIA_Girion_DI_OrcEliteRing_Condition;
	information = DIA_Girion_DI_OrcEliteRing_Info;
	permanent = TRUE;
	description = "У меня есть кольцо предводителей орков.";
};


func int DIA_Girion_DI_OrcEliteRing_Condition()
{
	if(Npc_HasItems(other,ItRi_OrcEliteRing))
	{
		return TRUE;
	};
};


var int DIA_Girion_DI_OrcEliteRing_OneTime;

func void DIA_Girion_DI_OrcEliteRing_Info()
{
	AI_Output(other,self,"DIA_Girion_DI_OrcEliteRing_15_00");	//У меня есть кольцо предводителей орков.
	if(DIA_Girion_DI_OrcEliteRing_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Girion_DI_OrcEliteRing_08_01");	//Я думаю, лорд Хаген сможет что-нибудь предпринять.
		DIA_Girion_DI_OrcEliteRing_OneTime = TRUE;
	};
	AI_Output(self,other,"DIA_Girion_DI_OrcEliteRing_08_02");	//Дай его мне. Я покажу его лорду Хагену.
	Info_ClearChoices(DIA_Girion_DI_OrcEliteRing);
	Info_AddChoice(DIA_Girion_DI_OrcEliteRing,"Я лучше оставлю его себе.",DIA_Girion_DI_OrcEliteRing_behalten);
	Info_AddChoice(DIA_Girion_DI_OrcEliteRing,"Вот, возьми.",DIA_Girion_DI_OrcEliteRing_geben);
};

func void DIA_Girion_DI_OrcEliteRing_geben()
{
	AI_Output(other,self,"DIA_Girion_DI_OrcEliteRing_geben_15_00");	//Вот, возьми.
	AI_Output(self,other,"DIA_Girion_DI_OrcEliteRing_geben_08_01");	//Спасибо. Все равно я не думаю, что оно может тебе пригодиться.
	Info_ClearChoices(DIA_Girion_DI_OrcEliteRing);
	B_GiveInvItems(other,self,ItRi_OrcEliteRing,1);
	B_GivePlayerXP(XP_PAL_OrcRing);
};

func void DIA_Girion_DI_OrcEliteRing_behalten()
{
	AI_Output(other,self,"DIA_Girion_DI_OrcEliteRing_behalten_15_00");	//Я лучше оставлю его себе.
	AI_Output(self,other,"DIA_Girion_DI_OrcEliteRing_behalten_08_01");	//Как знаешь. Все равно оно вряд ли тебе пригодится.
	Info_ClearChoices(DIA_Girion_DI_OrcEliteRing);
};


instance DIA_Girion_DI_UndeadDragonDead(C_Info)
{
	npc = Pal_207_Girion_DI;
	nr = 2;
	condition = DIA_Girion_DI_UndeadDragonDead_Condition;
	information = DIA_Girion_DI_UndeadDragonDead_Info;
	permanent = TRUE;
	description = "Мы готовы к отплытию.";
};


func int DIA_Girion_DI_UndeadDragonDead_Condition()
{
	if(UndeadDragonIsDead == TRUE)
	{
		return TRUE;
	};
};

var int DIA_Girion_DI_UndeadDragonDead_OneTime;

func void DIA_Girion_DI_UndeadDragonDead_Info()
{
	AI_Output(other,self,"DIA_Girion_DI_UndeadDragonDead_15_00");	//Мы готовы к отплытию.
	AI_Output(self,other,"DIA_Girion_DI_UndeadDragonDead_08_01");	//Это хорошо. А то я уже начал думать, что сгнием здесь на этом утесе.
	if(DIA_Girion_DI_UndeadDragonDead_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Girion_DI_UndeadDragonDead_08_02");	//Теперь ты немедленно передашь корабль мне!
		AI_Output(other,self,"DIA_Girion_DI_UndeadDragonDead_15_03");	//Мы еще не в Хоринисе. И, честно говоря, я не очень-то хочу снова в Хоринис.
		AI_Output(other,self,"DIA_Girion_DI_UndeadDragonDead_15_04");	//Я пробыл там достаточно долго.
		AI_Output(self,other,"DIA_Girion_DI_UndeadDragonDead_08_05");	//Я уже подумывал что-то в этом роде. Однако, сейчас не время и не место. Снова побеседуем об этом в море.
		AI_Output(self,other,"DIA_Girion_DI_UndeadDragonDead_08_06");	//Что это значит... Я все же рад, видеть тебя снова невредимым на борту.
		if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
		{
			AI_Output(self,other,"DIA_Girion_DI_UndeadDragonDead_08_07");	//Ты настоящий воин Инноса. У меня нет сомнений на этот счет. Я рад, что ты на нашей стороне.
		}
		else
		{
			AI_Output(self,other,"DIA_Girion_DI_UndeadDragonDead_08_08");	//Даже хотя ты и мошенник, последнее время ты вел себя как настоящий праведник.
		};
		DIA_Girion_DI_UndeadDragonDead_OneTime = TRUE;
	};
	AI_Output(self,other,"DIA_Girion_DI_UndeadDragonDead_08_09");	//Хорошо. Теперь иди к капитану. Пусть он поднимает якорь.
	AI_StopProcessInfos(self);
};


instance DIA_Girion_DI_PICKPOCKET(C_Info)
{
	npc = Pal_207_Girion_DI;
	nr = 900;
	condition = DIA_Girion_DI_PICKPOCKET_Condition;
	information = DIA_Girion_DI_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Girion_DI_PICKPOCKET_Condition()
{
	return C_Beklauen(71,260);
};

func void DIA_Girion_DI_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Girion_DI_PICKPOCKET);
	Info_AddChoice(DIA_Girion_DI_PICKPOCKET,Dialog_Back,DIA_Girion_DI_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Girion_DI_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Girion_DI_PICKPOCKET_DoIt);
};

func void DIA_Girion_DI_PICKPOCKET_DoIt()
{
	B_Beklauen();
	INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
	Info_ClearChoices(DIA_Girion_DI_PICKPOCKET);
};

func void DIA_Girion_DI_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Girion_DI_PICKPOCKET);
};

