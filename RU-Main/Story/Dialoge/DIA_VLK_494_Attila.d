
instance DIA_Attila_EXIT(C_Info)
{
	npc = VLK_494_Attila;
	nr = 999;
	condition = DIA_Attila_EXIT_Condition;
	information = DIA_Attila_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Attila_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Attila_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Attila_PICKPOCKET(C_Info)
{
	npc = VLK_494_Attila;
	nr = 900;
	condition = DIA_Attila_PICKPOCKET_Condition;
	information = DIA_Attila_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Attila_PICKPOCKET_Condition()
{
	return C_Beklauen(55,100);
};

func void DIA_Attila_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Attila_PICKPOCKET);
	Info_AddChoice(DIA_Attila_PICKPOCKET,Dialog_Back,DIA_Attila_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Attila_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Attila_PICKPOCKET_DoIt);
};

func void DIA_Attila_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Attila_PICKPOCKET);
};

func void DIA_Attila_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Attila_PICKPOCKET);
};


instance DIA_Attila_Hallo(C_Info)
{
	npc = VLK_494_Attila;
	nr = 1;
	condition = DIA_Attila_Hallo_Condition;
	information = DIA_Attila_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Attila_Hallo_Condition()
{
	if(MIS_ThiefGuild_sucked == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Attila_Hallo_Info()
{
	AI_Output(self,other,"DIA_Attila_Hallo_09_00");	//Ах, наконец. Я ждал тебя, чужеземец.
	Info_ClearChoices(DIA_Attila_Hallo);
	Info_AddChoice(DIA_Attila_Hallo,"Что тебе нужно от меня?",DIA_Attila_Hallo_Was);
	Info_AddChoice(DIA_Attila_Hallo,"Кто ты?",DIA_Attila_Hallo_Wer);
	B_GivePlayerXP(XP_Attila_MetHim);
};

func void DIA_Attila_Hallo_Wer()
{
	AI_Output(other,self,"DIA_Attila_Hallo_Wer_15_00");	//Кто ты?
	AI_Output(self,other,"DIA_Attila_Hallo_Wer_09_01");	//Меня зовут Аттила, но разве мое имя важно? Наши имена ничего не значат.
	AI_Output(self,other,"DIA_Attila_Hallo_Wer_09_02");	//Ты это должен знать, чужеземец.
	Knows_Attila_Wer = TRUE;
	Info_ClearChoices(DIA_Attila_Hallo);
	if(Knows_Attila_Was == FALSE)
	{
		Info_AddChoice(DIA_Attila_Hallo,"Что тебе нужно от меня?",DIA_Attila_Hallo_Was);
	};
	Info_AddChoice(DIA_Attila_Hallo,"К чему весь этот фарс?",DIA_Attila_Hallo_Theater);
};

func void DIA_Attila_Hallo_Was()
{
	AI_Output(other,self,"DIA_Attila_Hallo_Was_15_00");	//Что тебе нужно от меня?
	AI_Output(self,other,"DIA_Attila_Hallo_Was_09_01");	//Я здесь, чтобы объяснить тебе несколько вещей. И кроме этого, я собираюсь убить тебя.
	Knows_Attila_Was = TRUE;
	Info_ClearChoices(DIA_Attila_Hallo);
	if(Knows_Attila_Wer == FALSE)
	{
		Info_AddChoice(DIA_Attila_Hallo,"Кто ты?",DIA_Attila_Hallo_Wer);
	};
	Info_AddChoice(DIA_Attila_Hallo,"Кто платит тебе за это?",DIA_Attila_Hallo_Auftrag);
	Info_AddChoice(DIA_Attila_Hallo,"К чему весь этот фарс?",DIA_Attila_Hallo_Theater);
};

func void DIA_Attila_Hallo_Theater()
{
	AI_Output(other,self,"DIA_Attila_Hallo_Theater_15_00");	//К чему весь этот фарс?
	AI_Output(self,other,"DIA_Attila_Hallo_Theater_09_01");	//Ты не должен умереть в неведении. Считай это проявлением уважения к приговоренным.
	Info_ClearChoices(DIA_Attila_Hallo);
	Info_AddChoice(DIA_Attila_Hallo,"Я, пожалуй, пойду.",DIA_Attila_Hallo_Ende);
	Info_AddChoice(DIA_Attila_Hallo,"Кто платит тебе за это?",DIA_Attila_Hallo_Auftrag);
	Info_AddChoice(DIA_Attila_Hallo,"Почему ты хочешь убить меня?",DIA_Attila_Hallo_Warum);
};

func void DIA_Attila_Hallo_Ende()
{
	AI_Output(other,self,"DIA_Attila_Hallo_Ende_15_00");	//Я, пожалуй, пойду...
	AI_Output(self,other,"DIA_Attila_Hallo_Ende_09_01");	//Боюсь... я не могу позволить тебе этого. Смирись. Пришло время умереть.
	AI_DrawWeapon(self);
	Info_ClearChoices(DIA_Attila_Hallo);
	Info_AddChoice(DIA_Attila_Hallo,"Кто платит тебе за это?",DIA_Attila_Hallo_Auftrag);
	Info_AddChoice(DIA_Attila_Hallo,"Почему ты хочешь убить меня?",DIA_Attila_Hallo_Warum);
};

func void DIA_Attila_Hallo_Auftrag()
{
	AI_Output(other,self,"DIA_Attila_Hallo_Auftrag_15_00");	//Кто платит тебе за это?
	AI_Output(self,other,"DIA_Attila_Hallo_Auftrag_09_01");	//Мои хозяева стараются работать в тени, как и я.
	AI_Output(self,other,"DIA_Attila_Hallo_Auftrag_09_02");	//В условиях моего контракта записано, что я не имею права разглашать ни их имя, ни их резиденцию.
	Info_ClearChoices(DIA_Attila_Hallo);
	Info_AddChoice(DIA_Attila_Hallo,"Почему ты хочешь убить меня?",DIA_Attila_Hallo_Warum);
};

func void DIA_Attila_Hallo_Warum()
{
	AI_Output(other,self,"DIA_Attila_Hallo_Warum_15_00");	//Почему ты хочешь убить меня?
	if(Betrayal_Halvor == TRUE)
	{
		AI_Output(self,other,"DIA_Attila_Hallo_Warum_09_01");	//Ты сдал Халвора! Теперь он сидит в тюрьме. Так не пойдет.
	};
	if(Rengaru_InKnast == TRUE)
	{
		AI_Output(self,other,"DIA_Attila_Hallo_Warum_09_02");	//Ты продал Ренгару ополчению. Он всего лишь мелкий воришка, но тебе не следовало делать этого.
	};
	if(Nagur_Ausgeliefert == TRUE)
	{
		AI_Output(self,other,"DIA_Attila_Hallo_Warum_09_03");	//Нагур попал за решетку по твоей вине. Кое-кому кажется, что это непростительная ошибка.
	};
	AI_Output(self,other,"DIA_Attila_Hallo_Warum_09_04");	//Мои хозяева недовольны этим. Чтобы не дать тебе совершить еще одну ошибку, они послали меня.
	Info_ClearChoices(DIA_Attila_Hallo);
	Info_AddChoice(DIA_Attila_Hallo,"Я могу дать тебе золото.",DIA_Attila_Hallo_Gold);
	Info_AddChoice(DIA_Attila_Hallo,"Дай мне хотя бы вынуть свое оружие.",DIA_Attila_Hallo_Attacke);
};

func void DIA_Attila_Hallo_Gold()
{
	AI_Output(other,self,"DIA_Attila_Hallo_Gold_15_00");	//Я могу дать тебе золото - много золота.
	AI_Output(self,other,"DIA_Attila_Hallo_Gold_09_01");	//Тщетно! Я не за этим сюда пришел. Единственная цена, которую ты заплатишь - твоя жизнь. И заплатишь ты ее прямо сейчас.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Attila_Hallo_Attacke()
{
	AI_Output(other,self,"DIA_Attila_Hallo_Attacke_15_00");	//Дай мне хотя бы вынуть свое оружие.
	if(Npc_HasEquippedWeapon(other) == TRUE)
	{
		AI_Output(self,other,"DIA_Attila_Hallo_Attacke_09_01");	//Хорошо, приготовься к своей последней битве.
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_NONE,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Attila_Hallo_Attacke_09_02");	//Да у тебя нет никакого оружия на поясе. У тебя осталось очень мало времени, чужеземец. Смерть уже близко.
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_NONE,2);
	};
};


instance DIA_Attila_Willkommen(C_Info)
{
	npc = VLK_494_Attila;
	nr = 1;
	condition = DIA_Attila_Willkommen_Condition;
	information = DIA_Attila_Willkommen_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Attila_Willkommen_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_ThiefGuild_sucked == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Attila_Willkommen_Info()
{
	AI_Output(self,other,"DIA_Attila_Willkommen_09_00");	//Ах, наконец. Я ждал тебя, чужеземец.
	B_GivePlayerXP(XP_Attila_Friend);
	AI_Output(other,self,"DIA_Attila_Willkommen_15_01");	//Кто ты и что тебе нужно от меня?
	AI_Output(self,other,"DIA_Attila_Willkommen_09_02");	//Это не важно. Важно лишь то, что ты делал. Ты оставался лояльным - даже если ты сам не знал об этом.
	AI_Output(self,other,"DIA_Attila_Willkommen_09_03");	//Некоторые покровители прослышали про твою лояльность. И они дают тебе шанс. Так используй его.
	AI_Output(other,self,"DIA_Attila_Willkommen_15_04");	//Эй, просто скажи мне кто они.
	AI_Output(self,other,"DIA_Attila_Willkommen_09_05");	//У меня есть для тебя подарок. А все остальное в твоих руках, чужеземец.
	B_GiveInvItems(self,other,ItKe_ZhiefGuildKey_MIS,1);
	Attila_Key = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"AFTER");
};

instance DIA_Attila_NachSchluessel(C_Info)
{
	npc = VLK_494_Attila;
	nr = 1;
	condition = DIA_Attila_NachSchluessel_Condition;
	information = DIA_Attila_NachSchluessel_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Attila_NachSchluessel_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Attila_Wer) && (IS_LOVCACH == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Attila_NachSchluessel_Info()
{
	AI_Output(self,other,"DIA_Attila_NachSchluessel_09_00");	//Моя задача выполнена - пока.
	AI_Output(self,other,"DIA_Attila_NachSchluessel_09_01");	//Но кто знает, может, наши пути опять пересекутся...
	AI_StopProcessInfos(self);
};

instance DIA_Attila_Wer(C_Info)
{
	npc = VLK_494_Attila;
	nr = 1;
	condition = DIA_Attila_Wer_Condition;
	information = DIA_Attila_Wer_Info;
	permanent = FALSE;
	description = "Кто ты?";
};

func int DIA_Attila_Wer_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Attila_Willkommen) && (IS_LOVCACH == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Attila_Wer_Info()
{
	AI_Output(other,self,"DIA_Attila_Hallo_Wer_15_00");	//Кто ты?
	AI_Output(self,other,"DIA_Attila_Hallo_Wer_09_01");	//Меня зовут Аттила... но разве мое имя важно? Наши имена ничего не значат.
	AI_Output(self,other,"DIA_Attila_Hallo_Wer_09_02");	//Ты это должен знать, чужеземец.
	AI_StopProcessInfos(self);
};

instance DIA_Attila_Job(C_Info)
{
	npc = VLK_494_Attila;
	nr = 1;
	condition = DIA_Attila_Job_Condition;
	information = DIA_Attila_Job_Info;
	permanent = FALSE;
	description = "А каковы твои обязанности в гильдии?";
};

func int DIA_Attila_Job_Condition()
{
	if(IS_LOVCACH == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Attila_Job_Info()
{
	AI_Output(other,self,"DIA_Attila_Hallo_Job_15_00");	//А каковы твои обязанности в гильдии?
	AI_Output(self,other,"DIA_Attila_Hallo_Job_09_01");	//Раз теперь ты один из нас, то, пожалуй, расскажу.
	AI_Output(self,other,"DIA_Attila_Hallo_Job_09_02");	//Я являюсь посредником между нашими людьми сверху и Кассией. Почти все дела проходят через меня.
	AI_Output(self,other,"DIA_Attila_Hallo_Job_09_03");	//Также я доставляю различного рода послания.
};

instance DIA_Attila_CanTeach(C_Info)
{
	npc = VLK_494_Attila;
	nr = 1;
	condition = DIA_Attila_CanTeach_Condition;
	information = DIA_Attila_CanTeach_Info;
	permanent = FALSE;
	description = "Чему ты можешь меня научить?";
};

func int DIA_Attila_CanTeach_Condition()
{
	if(IS_LOVCACH == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Attila_CanTeach_Info()
{
	AI_Output(other,self,"DIA_Attila_Hallo_CanTeach_15_00");	//Чему ты можешь меня научить?
	AI_Output(self,other,"DIA_Attila_Hallo_CanTeach_09_01");	//Если хочешь, я могу показать тебе, как лучше обращаться с двуручным оружием.
	AI_Output(self,other,"DIA_Attila_Hallo_CanTeach_09_02");	//Хотя обычно воры предпочитают шпаги или рапиры.
};

instance DIA_Attila_TEACH(C_Info)
{
	npc = VLK_494_Attila;
	nr = 10;
	condition = DIA_Attila_teach_condition;
	information = DIA_Attila_teach_info;
	permanent = TRUE;
	description = "Я нуждаюсь в тренировке.";
};

func int DIA_Attila_teach_condition()
{
	if((Npc_KnowsInfo(other,DIA_Attila_CanTeach) == TRUE) && (IS_LOVCACH == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Attila_teach_info()
{
	AI_Output(other,self,"DIA_Attila_Teach_15_00");	//Я нуждаюсь в тренировке.
	Info_ClearChoices(DIA_Attila_teach);
	Info_AddChoice(DIA_Attila_teach,Dialog_Back,DIA_Attila_teach_back);
	Info_AddChoice(DIA_Attila_teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Attila_teach_2h_1);
	Info_AddChoice(DIA_Attila_teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Attila_teach_2h_5);
};

func void DIA_Attila_teach_2h_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,60);
	Info_ClearChoices(DIA_Attila_teach);
	Info_AddChoice(DIA_Attila_teach,Dialog_Back,DIA_Attila_teach_back);
	Info_AddChoice(DIA_Attila_teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Attila_teach_2h_1);
	Info_AddChoice(DIA_Attila_teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Attila_teach_2h_5);
};

func void DIA_Attila_teach_2h_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,60);
	Info_ClearChoices(DIA_Attila_teach);
	Info_AddChoice(DIA_Attila_teach,Dialog_Back,DIA_Attila_teach_back);
	Info_AddChoice(DIA_Attila_teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Attila_teach_2h_1);
	Info_AddChoice(DIA_Attila_teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Attila_teach_2h_5);
};

func void DIA_Attila_teach_back()
{
	Info_ClearChoices(DIA_Attila_teach);
};