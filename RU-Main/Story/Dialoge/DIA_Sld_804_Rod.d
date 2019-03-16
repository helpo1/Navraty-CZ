
instance DIA_Rod_EXIT(C_Info)
{
	npc = Sld_804_Rod;
	nr = 999;
	condition = DIA_Rod_EXIT_Condition;
	information = DIA_Rod_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Rod_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Rod_EXIT_Info()
{
	AI_EquipBestMeleeWeapon(self);
	AI_StopProcessInfos(self);
};


instance DIA_Rod_Hello(C_Info)
{
	npc = Sld_804_Rod;
	nr = 1;
	condition = DIA_Rod_Hello_Condition;
	information = DIA_Rod_Hello_Info;
	permanent = FALSE;
	description = "Как дела?";
};


func int DIA_Rod_Hello_Condition()
{
	return TRUE;
};

func void DIA_Rod_Hello_Info()
{
	AI_Output(other,self,"DIA_Rod_Hello_15_00");	//Как дела?

	if(other.guild != GIL_SLD)
	{
		AI_Output(self,other,"DIA_Rod_Hello_06_01");	//Что ТЕБЕ нужно от меня, детка?

		if((other.guild == GIL_KDF) || (other.guild == GIL_NOV))
		{
			AI_Output(self,other,"DIA_Rod_Hello_06_02");	//Что, для тебя не нашлось места в монастыре?
		};
	};
};


var int Rod_SchwachGesagt;
var int Rod_Merke_2h;

instance DIA_Rod_Teach(C_Info)
{
	npc = Sld_804_Rod;
	nr = 3;
	condition = DIA_Rod_Teach_Condition;
	information = DIA_Rod_Teach_Info;
	permanent = TRUE;
	description = "Я хочу научиться лучше владеть двуручным оружием!";
};

func int DIA_Rod_Teach_Condition()
{
	if(Rod_Teach2H == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Rod_Teach_Info()
{
	AI_Output(other,self,"DIA_Rod_Teach_15_00");	//Я хочу научиться лучше владеть двуручным оружием!
	AI_Output(self,other,"DIA_Rod_WannaLearn_06_01");	//Я неплохой боец, но это не означает, что я хороший учитель.
	AI_Output(self,other,"DIA_Rod_WannaLearn_06_02");	//И все же я думаю, я могу показать тебе основы боя двуручным оружием.
	Rod_Merke_2h = other.HitChance[NPC_TALENT_2H];
	Info_ClearChoices(DIA_Rod_Teach);
	Info_AddChoice(DIA_Rod_Teach,Dialog_Back,DIA_Rod_Teach_Back);
	Info_AddChoice(DIA_Rod_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Rod_Teach_2H_1);
	Info_AddChoice(DIA_Rod_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Rod_Teach_2H_5);
};

func void DIA_Rod_Teach_Back()
{
	if(Rod_Merke_2h < other.HitChance[NPC_TALENT_2H])
	{
		AI_Output(self,other,"DIA_Rod_Teach_BACK_06_00");	//Ты уже владеешь им лучше.
	};
	Info_ClearChoices(DIA_Rod_Teach);
};

func void DIA_Rod_Teach_2H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,90);
	Info_ClearChoices(DIA_Rod_Teach);
	Info_AddChoice(DIA_Rod_Teach,Dialog_Back,DIA_Rod_Teach_Back);
	Info_AddChoice(DIA_Rod_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Rod_Teach_2H_1);
	Info_AddChoice(DIA_Rod_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Rod_Teach_2H_5);
};

func void DIA_Rod_Teach_2H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,90);
	Info_ClearChoices(DIA_Rod_Teach);
	Info_AddChoice(DIA_Rod_Teach,Dialog_Back,DIA_Rod_Teach_Back);
	Info_AddChoice(DIA_Rod_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Rod_Teach_2H_1);
	Info_AddChoice(DIA_Rod_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Rod_Teach_2H_5);
};


instance DIA_Rod_WannaJoin(C_Info)
{
	npc = Sld_804_Rod;
	nr = 4;
	condition = DIA_Rod_WannaJoin_Condition;
	information = DIA_Rod_WannaJoin_Info;
	permanent = TRUE;
	description = "Я хочу присоединиться к наемникам!";
};


func int DIA_Rod_WannaJoin_Condition()
{
	if((other.guild == GIL_NONE) && (RodAgreed == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Rod_WannaJoin_Info()
{
	AI_Output(other,self,"DIA_Rod_WannaJoin_15_00");	//Я хочу присоединиться к наемникам!

	if(Npc_HasItems(self,ItMw_2h_Rod) == 0)
	{
		AI_Output(self,other,"DIA_Rod_WannaJoin_06_01");	//А как насчет того, чтобы сначала вернуть мне мой меч, а?
	}
	else if((self.aivar[AIV_DefeatedByPlayer] == TRUE) || (Rod_WetteGewonnen == TRUE))
	{
		if(self.aivar[AIV_DefeatedByPlayer] == TRUE)
		{
			AI_Output(self,other,"DIA_Rod_WannaJoin_06_02");	//Хорошо! Я не держу обиды.
			AI_Output(self,other,"DIA_Rod_WannaJoin_06_03");	//Ты умеешь сражаться, и только это имеет значение.
			AI_Output(self,other,"DIA_Rod_WannaJoin_06_04");	//Большинство парней здесь не обращает внимание на мелкие стычки между друзьями. Ты привыкнешь к этому.
		};

		AI_Output(self,other,"DIA_Rod_WannaJoin_06_06");	//Если тебе интересно мое мнение, то я не против.
		B_LogEntry(TOPIC_SLDRespekt,"Я получу голос Рода, если я захочу присоединиться к наемникам.");
		RodAgreed = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Rod_WannaLearn_06_05");	//Почему бы тебе не пойти на пастбище и не поиграть в хоровод с овечками?
		Rod_SchwachGesagt = TRUE;
	};
};


instance DIA_Rod_Duell(C_Info)
{
	npc = Sld_804_Rod;
	nr = 6;
	condition = DIA_Rod_Duell_Condition;
	information = DIA_Rod_Duell_Info;
	permanent = TRUE;
	description = "Похоже, мне нужно поучить тебя хорошим манерам, ты не против?";
};


func int DIA_Rod_Duell_Condition()
{
	if(self.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		if((Rod_WetteGewonnen == FALSE) && (Rod_SchwachGesagt == TRUE))
		{
			return TRUE;
		};
		if(MIS_Jarvis_SldKO == LOG_Running)
		{
			return TRUE;
		};
	};
};

func void DIA_Rod_Duell_Info()
{
	AI_Output(other,self,"DIA_Rod_Duell_15_00");	//Похоже, мне нужно поучить тебя хорошим манерам, ты не против?

	if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE)
	{
		AI_Output(self,other,"DIA_Rod_Duell_06_01");	//Давай, попробуй!
	}
	else
	{
		AI_Output(self,other,"DIA_Rod_Duell_06_02");	//Ты ничему не учишься!
	};

	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

instance DIA_Rod_StarkGenug(C_Info)
{
	npc = Sld_804_Rod;
	nr = 5;
	condition = DIA_Rod_StarkGenug_Condition;
	information = DIA_Rod_StarkGenug_Info;
	permanent = FALSE;
	description = "Я достаточно силен!";
};

func int DIA_Rod_StarkGenug_Condition()
{
	if((self.aivar[AIV_DefeatedByPlayer] == FALSE) && (Rod_WetteGewonnen == FALSE) && (Rod_SchwachGesagt == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Rod_StarkGenug_Info()
{
	AI_Output(other,self,"DIA_Rod_StarkGenug_15_00");	//Я достаточно силен!
	AI_Output(self,other,"DIA_Rod_StarkGenug_06_01");	//Чушь! Ты даже не смог бы поднять приличный меч, вроде моего!
	MIS_RodWette = LOG_Running;
	Log_CreateTopic(Topic_RodWette,LOG_MISSION);
	Log_SetTopicStatus(Topic_RodWette,LOG_Running);
	B_LogEntry(Topic_RodWette,"Наемник Род не думает, что я смогу удержать его меч.");
};


instance DIA_Rod_BINStarkGenug(C_Info)
{
	npc = Sld_804_Rod;
	nr = 5;
	condition = DIA_Rod_BINStarkGenug_Condition;
	information = DIA_Rod_BINStarkGenug_Info;
	permanent = FALSE;
	description = "Я сказал, я достаточно силен!";
};


func int DIA_Rod_BINStarkGenug_Condition()
{
	if((self.aivar[AIV_DefeatedByPlayer] == FALSE) && (Rod_WetteGewonnen == FALSE) && Npc_KnowsInfo(other,DIA_Rod_StarkGenug))
	{
		return TRUE;
	};
};

func void DIA_Rod_BINStarkGenug_Info()
{
	AI_Output(other,self,"DIA_Rod_BINStarkGenug_15_00");	//Я сказал, я достаточно силен!
	AI_Output(self,other,"DIA_Rod_BINStarkGenug_06_01");	//Охх, ты разбиваешь мое сердце! Рискнешь заключить небольшое пари?
};


var int Rod_WetteGewonnen;
var int Rod_WetteAngenommen;
var int DoomSword1;
var int DoomSword2;

instance DIA_Rod_Wette(C_Info)
{
	npc = Sld_804_Rod;
	nr = 5;
	condition = DIA_Rod_Wette_Condition;
	information = DIA_Rod_Wette_Info;
	permanent = TRUE;
	description = "Готов поспорить, что смогу удержать твой меч!";
};


func int DIA_Rod_Wette_Condition()
{
	if((self.aivar[AIV_DefeatedByPlayer] == FALSE) && (MIS_RodWette == LOG_Running) && (Rod_WetteGewonnen == FALSE) && Npc_KnowsInfo(other,DIA_Rod_BINStarkGenug) && (Npc_HasItems(self,ItMw_2h_Rod) > 0) && (Rod_WetteAngenommen == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Rod_Wette_Info()
{
	AI_Output(other,self,"DIA_Rod_Wette_15_00");	//Готов поспорить, что смогу удержать твой меч!
	AI_Output(self,other,"DIA_Rod_Wette_06_01");	//Точно? Хмм...(думает) И сколько же мне с тебя взять?
	AI_Output(self,other,"DIA_Rod_Wette_06_02");	//Ну...ты похож на нищего сосунка! Скажем, это будет тридцать монет! У тебя есть хотя бы столько?
	Info_ClearChoices(DIA_Rod_Wette);
	Info_AddChoice(DIA_Rod_Wette,"Нет.",DIA_Rod_Wette_No);
	Info_AddChoice(DIA_Rod_Wette,"Конечно!",DIA_Rod_Wette_Yes);
	B_LogEntry(Topic_RodWette,"Род ставит тридцать золотых монет на то, что я не смогу удержать его меч.");
};

func void DIA_Rod_Wette_No()
{
	AI_Output(other,self,"DIA_Rod_Wette_No_15_00");	//Нет.
	AI_Output(self,other,"DIA_Rod_Wette_No_06_01");	//Ох, тогда проваливай.
	Info_ClearChoices(DIA_Rod_Wette);
};

func void DIA_Rod_Wette_Yes()
{
	AI_Output(other,self,"DIA_Rod_Wette_Yes_15_00");	//Конечно!
	AI_Output(self,other,"DIA_Rod_Wette_Yes_06_01");	//Покажи...

	if(B_GiveInvItems(other,self,ItMi_Gold,30))
	{
		Rod_WetteAngenommen = TRUE;
		AI_Output(other,self,"DIA_Rod_Wette_Yes_15_02");	//Вот!
		AI_Output(self,other,"DIA_Rod_Wette_Yes_06_03");	//Хорошо, давай посмотрим, насколько ты силен...(злорадно) 
		B_GiveInvItems(self,other,ItMw_2h_Rod,1);

		if(other.attribute[ATR_STRENGTH] >= 30)
		{
			if(Npc_HasItems(hero,ITMW_1H_DOOMSWORD) > 0)
			{
				DoomSword1 = Npc_HasItems(hero,ITMW_1H_DOOMSWORD);			
				Npc_RemoveInvItems(hero,ITMW_1H_DOOMSWORD,Npc_HasItems(hero,ITMW_1H_DOOMSWORD));
			};
			if(Npc_HasItems(hero,ITMW_2H_DOOMSWORD) > 0)
			{
				DoomSword2 = Npc_HasItems(hero,ITMW_2H_DOOMSWORD);			
				Npc_RemoveInvItems(hero,ITMW_2H_DOOMSWORD,Npc_HasItems(hero,ITMW_2H_DOOMSWORD));
			};

			CreateInvItems(hero,ItMw_2h_Rod_Fake,1);
			AI_UnequipWeapons(hero);
			AI_EquipBestMeleeWeapon(hero);
			AI_ReadyMeleeWeapon(hero);
			AI_Output(other,self,"DIA_Rod_Wette_Yes_15_04");	//Так достаточно?
			AI_Output(self,other,"DIA_Rod_Wette_Yes_06_05");	//Похоже...(удивленно) Ты побил меня?
			AI_RemoveWeapon(hero);
			AI_UnequipWeapons(hero);
			AI_Output(self,other,"DIA_Rod_Wette_Yes_06_06");	//Я никак не ожидал от тебя такого. Ты не похож на человека, обладающего такой силой.
			AI_Output(self,other,"DIA_Rod_Wette_Yes_06_07");	//Ну, похоже, я только что потерял тридцать золотых монет. Держи!
			B_GiveInvItems(self,other,ItMi_Gold,60);
			Rod_WetteGewonnen = TRUE;
			B_GivePlayerXP(XP_Rod);
			MIS_RodWette = LOG_SUCCESS;
			Log_SetTopicStatus(Topic_RodWette,LOG_SUCCESS);
			B_LogEntry(Topic_RodWette,"Я поднял меч Рода и тем самым одержал вверх в нашем споре.");
		}
		else
		{
			AI_Output(other,self,"DIA_Rod_Wette_Yes_15_08");	//Я не могу поднять это оружие.
			AI_Output(self,other,"DIA_Rod_Wette_Yes_06_09");	//Что я и говорил!
			MIS_RodWette = LOG_FAILED;
			B_LogEntry_Failed(Topic_RodWette);
		};

		AI_Output(self,other,"DIA_Rod_Wette_Yes_06_10");	//А теперь, отдай мне мое оружие назад.
		Info_ClearChoices(DIA_Rod_Wette);
		Info_AddChoice(DIA_Rod_Wette,"Как же!",DIA_Rod_Wette_KeepIt);
		Info_AddChoice(DIA_Rod_Wette,"Вот, держи.",DIA_Rod_Wette_GiveBack);
	}
	else
	{
		AI_Output(other,self,"DIA_Rod_Wette_Yes_15_11");	//И куда же я дел его...
		AI_Output(self,other,"DIA_Rod_Wette_Yes_06_12");	//Ха! Возвращайся, когда у тебя будет достаточно золота, чтобы сделать ставку.
		Info_ClearChoices(DIA_Rod_Wette);
	};
};

func void DIA_Rod_Wette_GiveBack()
{
	AI_RemoveWeapon(other);
	Npc_RemoveInvItems(hero,ItMw_2h_Rod_Fake,1);
	AI_Output(other,self,"DIA_Rod_Wette_GiveBack_15_00");	//Вот, держи.
	Info_ClearChoices(DIA_Rod_Wette);
	Info_AddChoice(DIA_Rod_Wette,"(...вернуть оружие)",DIA_Rod_Wette_GiveBack2);
};

func void DIA_Rod_Wette_GiveBack2()
{
	if(DoomSword1 > 0)
	{
		CreateInvItems(other,ITMW_1H_DOOMSWORD,DoomSword1);
		DoomSword1 = FALSE;
	};
	if(DoomSword2 > 0)
	{
		CreateInvItems(other,ITMW_1H_DOOMSWORD,DoomSword2);
		DoomSword2 = FALSE;
	};

	B_GiveInvItems(other,self,ItMw_2h_Rod,1);
	Rod_WetteAngenommen = FALSE;

	if(Rod_WetteGewonnen == FALSE)
	{
		AI_Output(self,other,"DIA_Rod_Wette_GiveBack_06_01");	//Да ты просто подлец после этого!
	}
	else
	{
		AI_Output(self,other,"DIA_Rod_GiveItBack_06_01");	//Вовремя!
	};

	RodCanGiveRing = TRUE;
	CanBeatRodFist = FALSE;
	Info_ClearChoices(DIA_Rod_Wette);
};

func void DIA_Rod_Wette_KeepIt()
{
	if(DoomSword1 > 0)
	{
		CreateInvItems(other,ITMW_1H_DOOMSWORD,DoomSword1);
		DoomSword1 = FALSE;
	};
	if(DoomSword2 > 0)
	{
		CreateInvItems(other,ITMW_1H_DOOMSWORD,DoomSword2);
		DoomSword2 = FALSE;
	};

	Npc_RemoveInvItems(hero,ItMw_2h_Rod_Fake,1);
	AI_Output(other,self,"DIA_Rod_Wette_KeepIt_15_00");	//Как же!
	AI_Output(self,other,"DIA_Rod_Wette_KeepIt_06_01");	//(угрожающе) Что это значит?!
	AI_Output(other,self,"DIA_Rod_Wette_KeepIt_15_02");	//Лучше я подержу его у себя немного.
	AI_Output(self,other,"DIA_Rod_Wette_KeepIt_06_03");	//Ну, подожди, ублюдок!
	Info_ClearChoices(DIA_Rod_Wette);
	AI_StopProcessInfos(self);
	CanBeatRodFist = TRUE;
	B_Attack(self,other,AR_NONE,1);
};

instance DIA_Rod_GiveItBack(C_Info)
{
	npc = Sld_804_Rod;
	nr = 7;
	condition = DIA_Rod_GiveItBack_Condition;
	information = DIA_Rod_GiveItBack_Info;
	permanent = TRUE;
	description = "Вот, держи свой меч!";
};

func int DIA_Rod_GiveItBack_Condition()
{
	if(Npc_HasItems(other,ItMw_2h_Rod) > 0)
	{
		return TRUE;
	};
};

func void DIA_Rod_GiveItBack_Info()
{
	B_GiveInvItems(other,self,ItMw_2h_Rod,1);
	AI_Output(other,self,"DIA_Rod_GiveItBack_15_00");	//Вот, держи свой меч!
	AI_Output(self,other,"DIA_Rod_GiveItBack_06_01");	//Вовремя!
	RodCanGiveRing = TRUE;

	if(Rod_SchwertXPGiven == FALSE)
	{
		B_GivePlayerXP(XP_Ambient);
		Rod_SchwertXPGiven = TRUE;
	};

	CanBeatRodFist = FALSE;
};

instance DIA_Rod_Quest(C_Info)
{
	npc = Sld_804_Rod;
	nr = 3;
	condition = DIA_Rod_Quest_Condition;
	information = DIA_Rod_Quest_Info;
	permanent = FALSE;
	description = "Что особенного в твоем мече?";
};

func int DIA_Rod_Quest_Condition()
{
	if((RodCanGiveRing == TRUE) && (Npc_HasItems(self,ItMw_2h_Rod) > 0))
	{
		return TRUE;
	};
};

func void DIA_Rod_Quest_Info()
{
	AI_Output(other,self,"DIA_Rod_Quest_01_01");	//Что особенного в твоем мече?
	AI_Output(self,other,"DIA_Rod_Quest_01_02");	//Ничего. Просто я привык сражаться исключительно с двуручным оружием. Все остальное как-то не по мне.
	AI_Output(other,self,"DIA_Rod_Quest_01_04");	//А меня ты мог бы потренировать в обращении с ним?
	AI_Output(self,other,"DIA_Rod_Quest_01_05");	//Конечно, приятель. Правда, для этого мне понадобится не меньше дюжины бутылок шнапса.
	AI_Output(other,self,"DIA_Rod_Quest_01_06");	//Хммм... Ты в этом уверен?
	AI_Output(self,other,"DIA_Rod_Quest_01_07");	//Можешь не сомневаться...(смеется) Принеси выпивку - и я покажу тебе, как рассекать двуручным мечом.
	MIS_RodRing = LOG_Running;
	Log_CreateTopic(TOPIC_RodRing,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RodRing,LOG_Running);
	B_LogEntry(TOPIC_RodRing,"Род может помочь повысить мои навыки владения двуручным оружием. Но для этого ему нужна как минимум дюжина бутылок шнапса.");
};

instance DIA_Rod_Quest_Done(C_Info)
{
	npc = Sld_804_Rod;
	nr = 1;
	condition = DIA_Rod_Quest_Done_Condition;
	information = DIA_Rod_Quest_Done_Info;
	permanent = FALSE;
	description = "Вот твой шнапс!";
};

func int DIA_Rod_Quest_Done_Condition()
{
	if((MIS_RodRing == LOG_Running) && (Npc_HasItems(other,ItFo_Booze) >= 12))
	{
		return TRUE;
	};
};

func void DIA_Rod_Quest_Done_Info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_Rod_Quest_Done_01_01");	//Вот твой шнапс!
	B_GiveInvItems(other,self,ItFo_Booze,12);
	Npc_RemoveInvItems(self,ItFo_Booze,12);
	AI_Output(self,other,"DIA_Rod_Quest_Done_01_02");	//Хммм...(оценивающе) Да, похоже он самый!
	AI_Output(self,other,"DIA_Rod_Quest_Done_01_03");	//Теперь у меня будет чем скоротать время, которое мы еще проторчим на этой ферме!
	AI_Output(other,self,"DIA_Rod_Quest_Done_01_04");	//А как насчет обучения?
	AI_Output(self,other,"DIA_Rod_Quest_Done_01_05");	//Конечно! Как я и обещал.
	AI_Output(self,other,"DIA_Rod_Quest_Done_01_06");	//Вот, возьми это кольцо.
	B_GiveInvItems(self,other,ItRi_Rod,1);
	AI_Output(other,self,"DIA_Rod_Quest_Done_01_07");	//Кольцо?! И что мне с ним делать?
	AI_Output(self,other,"DIA_Rod_Quest_Done_01_08");	//Одень его - и ты поймешь, что стал чуточку лучше разбираться в двуручном оружии.
	Rod_Teach2H = TRUE;
	MIS_RodRing = LOG_Success;
	Log_SetTopicStatus(TOPIC_RodRing,LOG_Success);
	B_LogEntry(TOPIC_RodRing,"Я принес Роду шнапс, а он подарил мне кольцо. По его словам, оно поможет мне лучше владеть двуручным оружием.");
};

instance DIA_Rod_PERM(C_Info)
{
	npc = Sld_804_Rod;
	nr = 1;
	condition = DIA_Rod_PERM_Condition;
	information = DIA_Rod_PERM_Info;
	permanent = TRUE;
	description = "Как дела?";
};


func int DIA_Rod_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rod_Hello))
	{
		return TRUE;
	};
};

func void DIA_Rod_PERM_Info()
{
	AI_Output(other,self,"DIA_Rod_PERM_15_00");	//Как дела?
	if(Kapitel <= 2)
	{
		if(other.guild == GIL_NONE)
		{
			if((self.aivar[AIV_DefeatedByPlayer] == FALSE) && (Rod_WetteGewonnen == FALSE))
			{
				AI_Output(self,other,"DIA_Rod_PERM_06_01");	//Это не твое дело, слабак.
				Rod_SchwachGesagt = TRUE;
			}
			else
			{
				AI_Output(self,other,"DIA_Rod_PERM_06_02");	//Мне интересно, позволят ли тебе присоединиться к нам.
			};
		}
		else if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
		{
			AI_Output(self,other,"DIA_Rod_PERM_06_03");	//Теперь ты один из нас, малыш. Скоро мы к тебе привыкнем.
		}
		else
		{
			AI_Output(self,other,"DIA_Rod_PERM_06_04");	//Ты не наш человек. Ошивался бы ты лучше в другом месте!
		};
	};
	if(Kapitel >= 3)
	{
		AI_Output(self,other,"DIA_Rod_PERM_06_05");	//Если все эти истории о драконах действительно правда, нам нужно собрать отряд и прикончить этих тварей!
	};
};


instance DIA_RodSLD_PICKPOCKET(C_Info)
{
	npc = Sld_804_Rod;
	nr = 900;
	condition = DIA_RodSLD_PICKPOCKET_Condition;
	information = DIA_RodSLD_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_RodSLD_PICKPOCKET_Condition()
{
	return C_Beklauen(15,35);
};

func void DIA_RodSLD_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_RodSLD_PICKPOCKET);
	Info_AddChoice(DIA_RodSLD_PICKPOCKET,Dialog_Back,DIA_RodSLD_PICKPOCKET_BACK);
	Info_AddChoice(DIA_RodSLD_PICKPOCKET,DIALOG_PICKPOCKET,DIA_RodSLD_PICKPOCKET_DoIt);
};

func void DIA_RodSLD_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_RodSLD_PICKPOCKET);
};

func void DIA_RodSLD_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_RodSLD_PICKPOCKET);
};

