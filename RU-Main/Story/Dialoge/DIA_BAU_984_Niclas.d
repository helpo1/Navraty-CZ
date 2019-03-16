
instance DIA_Niclas_EXIT(C_Info)
{
	npc = BAU_984_Niclas;
	nr = 999;
	condition = DIA_Niclas_EXIT_Condition;
	information = DIA_Niclas_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Niclas_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Niclas_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Niclas_Hello(C_Info)
{
	npc = BAU_984_Niclas;
	nr = 1;
	condition = DIA_Niclas_Hello_Condition;
	information = DIA_Niclas_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Niclas_Hello_Condition()
{
	if(KAPITELORCATC == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Niclas_Hello_Info()
{
	AI_Output(self,other,"DIA_Niclas_Hello_03_03");	//Эй, парень. Ты что, заблудился?
	AI_Output(other,self,"DIA_Niclas_Hello_15_01");	//С чего ты это взял?
	AI_Output(self,other,"DIA_Niclas_Hello_03_02");	//Как с чего? Тут же ничего нет. (смеется)
};


instance DIA_Niclas_HaveALook(C_Info)
{
	npc = BAU_984_Niclas;
	nr = 1;
	condition = DIA_Niclas_HaveALook_Condition;
	information = DIA_Niclas_HaveALook_Info;
	permanent = FALSE;
	description = "Я просто брожу, любуюсь природой.";
};


func int DIA_Niclas_HaveALook_Condition()
{
	return TRUE;
};

func void DIA_Niclas_HaveALook_Info()
{
	AI_Output(other,self,"DIA_Niclas_HaveALook_15_00");	//Я просто брожу, любуюсь природой.
	AI_Output(self,other,"DIA_Niclas_HaveALook_03_01");	//Хорошо, будь моим гостем. Хочешь кусок мяса?
	CreateInvItems(self,ItFoMutton,1);
	Info_ClearChoices(DIA_Niclas_HaveALook);
	Info_AddChoice(DIA_Niclas_HaveALook,"Нет, спасибо.",DIA_Niclas_HaveALook_No);
	Info_AddChoice(DIA_Niclas_HaveALook,"Да, спасибо.",DIA_Niclas_HaveALook_Yes);
};

func void DIA_Niclas_HaveALook_No()
{
	AI_Output(other,self,"DIA_Niclas_HaveALook_No_15_00");	//Нет, спасибо.
	AI_Output(self,other,"DIA_Niclas_HaveALook_No_03_01");	//Как хочешь. Надеюсь, ты не будешь против, если я поем.
	B_UseItem(self,ItFoMutton);
	Info_ClearChoices(DIA_Niclas_HaveALook);
};

func void DIA_Niclas_HaveALook_Yes()
{
	AI_Output(other,self,"DIA_Niclas_HaveALook_Yes_15_00");	//Да, спасибо.
	AI_Output(self,other,"DIA_Niclas_HaveALook_Yes_03_01");	//Держи, вкуснейшая нога кротокрыса! Приготовлена по моему собственному рецепту.
	B_GiveInvItems(self,other,itfomutton_niclas,1);
	Info_ClearChoices(DIA_Niclas_HaveALook);
};


instance DIA_Niclas_WhyHere(C_Info)
{
	npc = BAU_984_Niclas;
	nr = 2;
	condition = DIA_Niclas_WhyHere_Condition;
	information = DIA_Niclas_WhyHere_Info;
	permanent = FALSE;
	description = "Что ты тут делаешь?";
};


func int DIA_Niclas_WhyHere_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Niclas_HaveALook))
	{
		return TRUE;
	};
};

func void DIA_Niclas_WhyHere_Info()
{
	AI_Output(other,self,"DIA_Niclas_WhyHere_15_00");	//Что ты тут делаешь?
	AI_Output(self,other,"DIA_Niclas_WhyHere_01_01");	//Как что? Охочусь, что же еще. В лагере скукотища жуткая, а тут просто отличное место!
	if(HEROISHUNTER == FALSE)
	{
		AI_Output(self,other,"DIA_Niclas_WhyHere_01_02");	//Кстати, ты был в нашем лагере? Если хочешь стать настоящим охотником, то тебе обязательно нужно там побывать.
		AI_Output(other,self,"DIA_Niclas_WhyHere_01_03");	//А где находится ваш лагерь?
		AI_Output(self,other,"DIA_Niclas_WhyHere_01_04");	//В небольшой ложбине, что находится по дороге между фермой Онара и Бенгара. Не волнуйся, его пропустить сложно.
		AI_Output(self,other,"DIA_Niclas_WhyHere_01_05");	//Если случайно забредешь туда, то поговори с Фальком - он у нас старший охотник.
	};
};


instance DIA_Niclas_ShouldntWork(C_Info)
{
	npc = BAU_984_Niclas;
	nr = 2;
	condition = DIA_Niclas_ShouldntWork_Condition;
	information = DIA_Niclas_ShouldntWork_Info;
	permanent = FALSE;
	description = "И как охота?";
};

func int DIA_Niclas_ShouldntWork_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Niclas_WhyHere))
	{
		return TRUE;
	};
};

func void DIA_Niclas_ShouldntWork_Info()
{
	AI_Output(other,self,"DIA_Niclas_ShouldntWork_01_00");	//И как охота?
	AI_Output(self,other,"DIA_Niclas_ShouldntWork_01_01");	//Отлично. Говорю тебе, это отличное охотничье угодие!
	AI_Output(other,self,"DIA_Niclas_ShouldntWork_01_02");	//На кого ты охотишся?
	AI_Output(self,other,"DIA_Niclas_ShouldntWork_01_03");	//В основном на падальщиков - безопасно, и куча мяса для ребят в лагере.
	AI_Output(self,other,"DIA_Niclas_ShouldntWork_01_04");	//К тому же, я никогда не прочь поупражняться в стрельбе из лука.
};

instance DIA_Niclas_CanTeachMe(C_Info)
{
	npc = BAU_984_Niclas;
	nr = 2;
	condition = DIA_Niclas_CanTeachMe_Condition;
	information = DIA_Niclas_CanTeachMe_Info;
	permanent = FALSE;
	description = "В таком случае, я уверен, что ты можешь научить меня чему-нибудь.";
};


func int DIA_Niclas_CanTeachMe_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Niclas_ShouldntWork))
	{
		return TRUE;
	};
};

func void DIA_Niclas_CanTeachMe_Info()
{
	AI_Output(other,self,"DIA_Niclas_CanTeachMe_15_00");	//В таком случае, я уверен, что ты можешь научить меня чему-нибудь.
	AI_Output(self,other,"DIA_Niclas_CanTeachMe_03_01");	//Почему бы и нет? Я могу показать тебе, как правильно держать лук.
	if(HEROISHUNTER == FALSE)
	{
		Log_CreateTopic(TOPIC_Teacher,LOG_NOTE);
		B_LogEntry(TOPIC_Teacher,"Никлас может научить меня точнее стрелять из лука. ");
	}
	else
	{
		Log_CreateTopic(TOPIC_HUNTERTEACHERS,LOG_NOTE);
		B_LogEntry(TOPIC_HUNTERTEACHERS,"Никлас может научить меня точнее стрелять из лука.");
	};
};


instance DIA_Niclas_Teach(C_Info)
{
	npc = BAU_984_Niclas;
	nr = 2;
	condition = DIA_Niclas_Teach_Condition;
	information = DIA_Niclas_Teach_Info;
	permanent = TRUE;
	description = "Покажи мне, как правильно держать лук.";
};


func int DIA_Niclas_Teach_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Niclas_CanTeachMe))
	{
		return TRUE;
	};
};

func void DIA_Niclas_Teach_Info()
{
	AI_Output(other,self,"DIA_Niclas_Teach_15_00");	//Покажи мне, как правильно держать лук.

	if(other.HitChance[NPC_TALENT_BOW] >= 60)
	{
		AI_Output(self,other,"DIA_Niclas_Teach_03_01");	//Я научил тебя всему, что мог. Теперь тебе лучше поискать другого учителя.
	}
	else
	{
		Info_ClearChoices(DIA_Niclas_Teach);
		Info_AddChoice(DIA_Niclas_Teach,Dialog_Back,DIA_Niclas_Teach_Back);
		Info_AddChoice(DIA_Niclas_Teach,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_Niclas_Teach_BOW_1);
		Info_AddChoice(DIA_Niclas_Teach,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1) * 5),DIA_Niclas_Teach_BOW_5);
	};
};

func void DIA_Niclas_Teach_Back()
{
	if(other.HitChance[NPC_TALENT_BOW] >= 60)
	{
		AI_Output(self,other,"DIA_Niclas_Teach_03_00");	//Мне нечему больше учить тебя.
	};
	Info_ClearChoices(DIA_Niclas_Teach);
};

func void DIA_Niclas_Teach_BOW_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,1,60);
	Info_ClearChoices(DIA_Niclas_Teach);
	Info_AddChoice(DIA_Niclas_Teach,Dialog_Back,DIA_Niclas_Teach_Back);
	Info_AddChoice(DIA_Niclas_Teach,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_Niclas_Teach_BOW_1);
	Info_AddChoice(DIA_Niclas_Teach,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1) * 5),DIA_Niclas_Teach_BOW_5);
};

func void DIA_Niclas_Teach_BOW_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,5,60);
	Info_ClearChoices(DIA_Niclas_Teach);
	Info_AddChoice(DIA_Niclas_Teach,Dialog_Back,DIA_Niclas_Teach_Back);
	Info_AddChoice(DIA_Niclas_Teach,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_Niclas_Teach_BOW_1);
	Info_AddChoice(DIA_Niclas_Teach,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1) * 5),DIA_Niclas_Teach_BOW_5);
};


instance DIA_NICLAS_MAKEARROWS(C_Info)
{
	npc = BAU_984_Niclas;
	nr = 2;
	condition = dia_niclas_makearrows_condition;
	information = dia_niclas_makearrows_info;
	permanent = FALSE;
	description = "А откуда ты берешь свои стрелы?";
};


func int dia_niclas_makearrows_condition()
{
	if(Npc_KnowsInfo(other,DIA_Niclas_ShouldntWork))
	{
		return TRUE;
	};
};

func void dia_niclas_makearrows_info()
{
	AI_Output(other,self,"DIA_Niclas_MakeArrows_01_00");	//А откуда ты берешь свои стрелы?
	AI_Output(self,other,"DIA_Niclas_MakeArrows_01_01");	//Я их сам делаю. Это не так сложно, как кажется на первый взгляд.
	AI_Output(other,self,"DIA_Niclas_MakeArrows_01_02");	//Может, и меня научишь их изготавливать?
	AI_Output(self,other,"DIA_Niclas_MakeArrows_01_03");	//Конечно. Если тебе интересно, то я с радостью поделюсь с тобой своими знаниями.
};


instance DIA_NICLAS_MAKEARROWSDO(C_Info)
{
	npc = BAU_984_Niclas;
	nr = 2;
	condition = dia_niclas_makearrowsdo_condition;
	information = dia_niclas_makearrowsdo_info;
	permanent = TRUE;
	description = "Научи меня изготавливать стрелы.";
};


func int dia_niclas_makearrowsdo_condition()
{
	if(Npc_KnowsInfo(other,dia_niclas_makearrows) && (KNOWHOWTOMAKEARROWS == FALSE))
	{
		return TRUE;
	};
};

func void dia_niclas_makearrowsdo_info()
{
	AI_Output(other,self,"Dia_Niclas_MakeArrowsDo_01_00");	//Научи меня изготавливать стрелы.
	Info_ClearChoices(dia_niclas_makearrowsdo);
	Info_AddChoice(dia_niclas_makearrowsdo,Dialog_Back,dia_niclas_makearrowsdo_Back);
	Info_AddChoice(dia_niclas_makearrowsdo,b_buildlearnstringformakearrows("Изготовление стрел и болтов",B_GetLearnCostTalent(other,NPC_TALENT_MAKEARROWS,1)),dia_niclas_makearrowsdo_MAKEARROWS);
};

func void dia_niclas_makearrowsdo_Back()
{
	Info_ClearChoices(dia_niclas_makearrowsdo);
};

func void dia_niclas_makearrowsdo_MAKEARROWS()
{
	if(b_teachplayertalentmakearrows(self,other,NPC_TALENT_MAKEARROWS))
	{
		AI_Output(self,other,"Dia_Niclas_MakeArrowsDo_01_01");	//Как скажешь. Для начала тебе нужна хорошая пила.
		AI_Output(self,other,"Dia_Niclas_MakeArrowsDo_01_02");	//Пилишь подходящее бревно на заготовки нужного размера.
		AI_Output(self,other,"Dia_Niclas_MakeArrowsDo_01_03");	//Потом вырезаешь из них деревянные древки. После этого тебе нужно вырезать стальные наконечники из куска стали и соединить с древком.
		AI_Output(self,other,"Dia_Niclas_MakeArrowsDo_01_04");	//Такой же принцип работает и с болтами для арбалетов, просто для их производства нужно больше стали.
	};

	Info_ClearChoices(dia_niclas_makearrowsdo);
};

instance DIA_Niclas_PICKPOCKET(C_Info)
{
	npc = BAU_984_Niclas;
	nr = 900;
	condition = DIA_Niclas_PICKPOCKET_Condition;
	information = DIA_Niclas_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Niclas_PICKPOCKET_Condition()
{
	return C_Beklauen(27,20);
};

func void DIA_Niclas_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Niclas_PICKPOCKET);
	Info_AddChoice(DIA_Niclas_PICKPOCKET,Dialog_Back,DIA_Niclas_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Niclas_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Niclas_PICKPOCKET_DoIt);
};

func void DIA_Niclas_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Niclas_PICKPOCKET);
};

func void DIA_Niclas_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Niclas_PICKPOCKET);
};


instance DIA_NICLAS_RESPECT(C_Info)
{
	npc = BAU_984_Niclas;
	nr = 1;
	condition = dia_niclas_respect_condition;
	information = dia_niclas_respect_info;
	permanent = FALSE;
	description = "Мне бы пригодилась твоя помощь.";
};


func int dia_niclas_respect_condition()
{
	if((CANHUNTERCHALLANGE == TRUE) && (MIS_HUNTERCHALLANGE == FALSE) && (NICLAS_RESPECT == FALSE) && Npc_KnowsInfo(other,DIA_Niclas_WhyHere))
	{
		return TRUE;
	};
};

func void dia_niclas_respect_info()
{
	AI_Output(other,self,"DIA_Niclas_Respect_01_00");	//Мне нужна твоя помощь.
	AI_Output(self,other,"DIA_Niclas_Respect_01_01");	//И почему вдруг она тебе понадобилась?
	AI_Output(other,self,"DIA_Niclas_Respect_01_02");	//Я хочу поспорить с Фальком за звание лучшего охотника в лагере.
	AI_Output(self,other,"DIA_Niclas_Respect_01_03");	//(задумчиво) Зачем тебе это, парень?
	AI_Output(self,other,"DIA_Niclas_Respect_01_04");	//Фальк очень опытный охотник, и вряд ли ты сможешь его победить.
	AI_Output(other,self,"DIA_Niclas_Respect_01_05");	//Я все-таки попробую.
	AI_Output(self,other,"DIA_Niclas_Respect_01_06");	//Ладно, как скажешь. Но для начала окажи мне одну небольшую услугу.
	AI_Output(self,other,"DIA_Niclas_Respect_01_08");	//Моя последняя охота была не слишком удачной...
	AI_Output(self,other,"DIA_Niclas_Respect_01_09");	//Мне не удалось добыть и большей части требуемого количества мяса для парней в лагере.
	AI_Output(self,other,"DIA_Niclas_Respect_01_10");	//Так что, если сможешь достать для меня хотя бы дюжину свежих кусков, то считай, что мое согласие у тебя в кармане.
	AI_Output(self,other,"DIA_Niclas_Respect_01_11");	//К тому же тем самым ты еще и докажешь мне, что являешься неплохим охотником. Ну как, согласен?
	B_LogEntry(TOPIC_HUNTERSWORK,"Никлас поддержит меня в споре с Фальком, если я принесу ему дюжину кусков свежего мяса.");
};


instance DIA_NICLAS_RESPECTDONE(C_Info)
{
	npc = BAU_984_Niclas;
	nr = 1;
	condition = dia_niclas_respectdone_condition;
	information = dia_niclas_respectdone_info;
	permanent = FALSE;
	description = "Вот твое мясо.";
};


func int dia_niclas_respectdone_condition()
{
	if(Npc_KnowsInfo(other,dia_niclas_respect) && (CANHUNTERCHALLANGE == TRUE) && (MIS_HUNTERCHALLANGE == FALSE) && (NICLAS_RESPECT == FALSE) && (Npc_HasItems(other,ItFoMuttonRaw) >= 12))
	{
		return TRUE;
	};
};

func void dia_niclas_respectdone_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Niclas_RespectDone_01_00");	//Вот твое мясо.
	B_GiveInvItems(other,self,ItFoMuttonRaw,12);
	AI_Output(self,other,"DIA_Niclas_RespectDone_01_01");	//Отлично, парень! Похоже, ты действительно неплохой охотник.
	AI_Output(other,self,"DIA_Niclas_RespectDone_01_02");	//Как теперь насчет твоего согласия?
	AI_Output(self,other,"DIA_Niclas_RespectDone_01_03");	//Хорошо. Я поддержу тебя в споре с Фальком, как и обещал.
	NICLAS_RESPECT = TRUE;
	B_LogEntry(TOPIC_HUNTERSWORK,"Я принес мясо Никласу, а он выполнил то, что обещал.");
	HUNTCHALLENGECOUNT = HUNTCHALLENGECOUNT + 1;
};

instance DIA_NICLAS_RECRUITDT(C_Info)
{
	npc = BAU_984_Niclas;
	nr = 21;
	condition = dia_niclas_recruitdt_condition;
	information = dia_niclas_recruitdt_info;
	permanent = FALSE;
	description = "Как дела?";
};

func int dia_niclas_recruitdt_condition()
{
	if(HURRAYICANHIRE == TRUE)
	{
		return TRUE;
	};
};

func void dia_niclas_recruitdt_info()
{
	AI_Output(other,self,"Dia_Niclas_RecruitDT_15_00");	//Как дела?
	AI_Output(self,other,"Dia_Niclas_RecruitDT_01_01");	//Неплохо. Я говорил, что здесь отличные охотничьи угодья?
	AI_Output(self,other,"Dia_Niclas_RecruitDT_01_02");	//Хотя увы, - последнее время здесь становится все опасней.
	AI_Output(self,other,"Dia_Niclas_RecruitDT_01_03");	//Я уже не первый раз видел нежить на старом кладбище внизу, а из леса постоянно доносится рев орков.
	AI_Output(self,other,"Dia_Niclas_RecruitDT_01_04");	//И как они только сюда пробрались? Разве паладины не охраняют Проход?
	AI_Output(other,self,"Dia_Niclas_RecruitDT_15_05");	//Боюсь, больше нет. Паладины, охранявшие Проход, мертвы.
	AI_Output(self,other,"Dia_Niclas_RecruitDT_01_06");	//Проклятье. Да, невеселая новость. Пожалуй, мне стоит вернуться в лагерь.
	AI_Output(other,self,"Dia_Niclas_RecruitDT_15_07");	//Погоди с лагерем. У меня к тебе предложение. Не хочешь поработать на меня?
	AI_Output(self,other,"Dia_Niclas_RecruitDT_01_08");	//На тебя? Что ты предлагаешь?
	AI_Output(other,self,"Dia_Niclas_RecruitDT_15_09");	//Я теперь владею старой башней рядом с фермой Онара, где я пытаюсь организовать что-то вроде небольшого лагеря.
	AI_Output(other,self,"Dia_Niclas_RecruitDT_15_10");	//Но лагерю нужна пища. Я предлагаю тебе заняться этим вопросом.
	AI_Output(other,self,"Dia_Niclas_RecruitDT_15_11");	//Жить будешь в башне, охотиться в соседнем лесу. Все трофеи твои, мне от тебя нужно только мясо.
	AI_Output(self,other,"Dia_Niclas_RecruitDT_01_12");	//Хмм... А сколько будешь платить?
	AI_Output(other,self,"Dia_Niclas_RecruitDT_15_13");	//Тридцать золотых в день.
	AI_Output(self,other,"Dia_Niclas_RecruitDT_01_14");	//Интересно. Хорошо, я согласен. Но с одним условием. В будущем ты найдешь мне напарника.
	AI_Output(self,other,"Dia_Niclas_RecruitDT_01_15");	//Лес рядом с фермой Онара не многим безопасней, чем Темный лес. Одному туда довольно опасно ходить.
	Info_ClearChoices(dia_niclas_recruitdt);
	Info_AddChoice(dia_niclas_recruitdt,"По рукам.",dia_niclas_recruitdt_yes);
	Info_AddChoice(dia_niclas_recruitdt,"Мне еще надо подумать.",dia_niclas_recruitdt_no);
};

func void dia_niclas_recruitdt_yes()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"Dia_Niclas_RecruitDT_yes_15_00");	//По рукам. И да, пароль для входа в башню – 'Драконовы сокровища'.
	AI_Output(self,other,"Dia_Niclas_RecruitDT_yes_01_00");	//Что ж, как и договорились, отныне я ежедневно буду обеспечивать лагерь мясом.
	AI_Output(self,other,"Dia_Niclas_RecruitDT_yes_01_01");	//А теперь пора отправляться в путь.
	B_LogEntry(TOPIC_PPL_FOR_TOWER,"Никлас согласился работать на меня. Он будет обеспечивать лагерь пищей, но лучше подыскать ему напарника для охоты.");
	self.npcType = NPCTYPE_FRIEND;
	self.aivar[AIV_ToughGuy] = TRUE;
	self.aivar[AIV_IGNORE_Theft] = TRUE;
	self.aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	self.aivar[AIV_IgnoresArmor] = TRUE;
	NICLASRECRUITEDDT = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(BAU_984_Niclas,"InCastle");
};

func void dia_niclas_recruitdt_no()
{
	AI_Output(other,self,"Dia_Niclas_RecruitDT_no_15_00");	//Мне надо подумать.
	AI_Output(self,other,"Dia_Niclas_RecruitDT_no_01_01");	//Хорошо. Я пока побуду здесь если что.
	AI_StopProcessInfos(self);
};

instance DIA_NICLAS_RECRUITDT_AGREE(C_Info)
{
	npc = BAU_984_Niclas;
	nr = 21;
	condition = dia_niclas_recruitdt_agree_condition;
	information = dia_niclas_recruitdt_agree_info;
	permanent = FALSE;
	description = "Я согласен с твоим условием.";
};

func int dia_niclas_recruitdt_agree_condition()
{
	if(Npc_KnowsInfo(hero,dia_niclas_recruitdt) && (NICLASRECRUITEDDT == FALSE) && (HURRAYICANHIRE == TRUE))
	{
		return TRUE;
	};
};

func void dia_niclas_recruitdt_agree_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"Dia_Niclas_RecruitDT_Agree_15_00");	//Я согласен с твоим условием.
	AI_Output(self,other,"Dia_Niclas_RecruitDT_Agree_01_00");	//Что ж, как и договорились, отныне я ежедневно буду обеспечивать лагерь мясом.
	AI_Output(self,other,"Dia_Niclas_RecruitDT_Agree_01_01");	//А теперь пора отправляться в путь.
	AI_Output(other,self,"Dia_Niclas_RecruitDT_Agree_15_02");	//Погоди. Последний момент. Башня охраняется, пароль – 'Драконовы сокровища'.
	AI_Output(self,other,"Dia_Niclas_RecruitDT_Agree_01_03");	//Постараюсь не забыть. До встречи.
	B_LogEntry(TOPIC_PPL_FOR_TOWER,"Никлас согласился работать на меня. Он будет обеспечивать лагерь пищей, но лучше подыскать ему напарника для охоты.");
	self.npcType = NPCTYPE_FRIEND;
	self.aivar[AIV_ToughGuy] = TRUE;
	self.aivar[AIV_IGNORE_Theft] = TRUE;
	self.aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	self.aivar[AIV_IgnoresArmor] = TRUE;
	NICLASRECRUITEDDT = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(BAU_984_Niclas,"InCastle");
};

instance DIA_NICLAS_HIREDASSIST(C_Info)
{
	npc = BAU_984_Niclas;
	nr = 21;
	condition = dia_niclas_hiredassist_condition;
	information = dia_niclas_hiredassist_info;
	permanent = FALSE;
	description = "Я нашел тебе напарника.";
};

func int dia_niclas_hiredassist_condition()
{
	if(TALBINRECRUITEDDT == TRUE)
	{
		return TRUE;
	};
};

func void dia_niclas_hiredassist_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"Dia_Niclas_HiredAssist_15_00");	//Я нашел тебе напарника. Это охотник Тальбин.
	AI_Output(self,other,"Dia_Niclas_HiredAssist_01_01");	//Я знаю его! Он не из храбрейших, но стреляет метко.
};

instance DIA_NICLAS_INTOWER(C_Info)
{
	npc = BAU_984_Niclas;
	nr = 22;
	condition = dia_niclas_intower_condition;
	information = dia_niclas_intower_info;
	permanent = TRUE;
	description = "Как тебе здесь живется?";
};

func int dia_niclas_intower_condition()
{
	if((NICLASRECRUITEDDT == TRUE) && (KAPITELORCATC == FALSE) && (Npc_GetDistToWP(self,"NW_CASTLEMINE_TOWER_CAMPFIRE_01") < 12000))
	{
		return TRUE;
	};
};

func void dia_niclas_intower_info()
{
	AI_Output(other,self,"DIA_Niclas_InTower_15_00");	//Как тебе здесь живется?
	AI_Output(self,other,"DIA_Niclas_InTower_01_01");	//Неплохо. Хорошо, когда есть крыша над головой.
};

instance DIA_NICLAS_INTOWER_ORCKAP(C_Info)
{
	npc = BAU_984_Niclas;
	nr = 22;
	condition = dia_niclas_intower_orckap_condition;
	information = dia_niclas_intower_orckap_info;
	permanent = TRUE;
	description = "Как дела?";
};

func int dia_niclas_intower_orckap_condition()
{
	if((NICLASRECRUITEDDT == TRUE) && (KAPITELORCATC == TRUE))
	{
		return TRUE;
	};
};

func void dia_niclas_intower_orckap_info()
{
	AI_Output(other,self,"DIA_Niclas_InTower_OrcKap_15_00");	//Как дела?
	AI_Output(self,other,"DIA_Niclas_InTower_OrcKap_01_01");	//Хорошо, что мы сумели заранее запастить провиантом. Сейчас охота стала слишком опасной.
};