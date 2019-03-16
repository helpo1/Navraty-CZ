instance DIA_Alrik_EXIT(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 999;
	condition = DIA_Alrik_EXIT_Condition;
	information = DIA_Alrik_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Alrik_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Alrik_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Alrik_PICKPOCKET(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 900;
	condition = DIA_Alrik_PICKPOCKET_Condition;
	information = DIA_Alrik_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Alrik_PICKPOCKET_Condition()
{
	return C_Beklauen(55,50);
};

func void DIA_Alrik_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Alrik_PICKPOCKET);
	Info_AddChoice(DIA_Alrik_PICKPOCKET,Dialog_Back,DIA_Alrik_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Alrik_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Alrik_PICKPOCKET_DoIt);
};

func void DIA_Alrik_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Alrik_PICKPOCKET);
};

func void DIA_Alrik_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Alrik_PICKPOCKET);
};


instance DIA_Alrik_Hallo(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_Hallo_Condition;
	information = DIA_Alrik_Hallo_Info;
	permanent = FALSE;
	description = "Что ты делаешь здесь?";
};


func int DIA_Alrik_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Alrik_Hallo_Info()
{
	AI_Output(other,self,"DIA_Alrik_Hallo_15_00");	//Что ты делаешь здесь?

	if(Npc_GetDistToWP(self,"NW_CITY_PATH_HABOUR_16_01") <= 500)
	{
		AI_Output(self,other,"DIA_Alrik_Hallo_09_01");	//(смеется) Это мой дом!
	}
	else if(Npc_GetDistToWP(self,"NW_CITY_HABOUR_TAVERN01_01") <= 500)
	{
		AI_Output(self,other,"DIA_Alrik_Hallo_09_02");	//А что мне еще делать здесь? Я пью.
	}
	else
	{
		AI_Output(self,other,"DIA_Alrik_Hallo_09_03");	//Я собираюсь немного прогуляться.
	};

	if(AlrikRECRUITEDDT == FALSE)
	{
		AI_Output(self,other,"DIA_Alrik_Hallo_09_04");	//Но если ты имеешь в виду, что я делаю днем - то я устраиваю бои.
	};
};


instance DIA_Alrik_YouFight(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_YouFight_Condition;
	information = DIA_Alrik_YouFight_Info;
	permanent = FALSE;
	description = "Ты устраиваешь бои?";
};

func int DIA_Alrik_YouFight_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Alrik_Hallo) && (AlrikRECRUITEDDT == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Alrik_YouFight_Info()
{
	AI_Output(other,self,"DIA_Alrik_YouFight_15_00");	//Ты устраиваешь бои?
	AI_Output(self,other,"DIA_Alrik_YouFight_09_01");	//Каждый день, с полудня до вечера.

	if(Npc_GetDistToWP(self,"NW_CITY_PATH_HABOUR_16_01") <= 500)
	{
		AI_Output(self,other,"DIA_Alrik_YouFight_09_02");	//И прямо здесь!
	};
	AI_Output(self,other,"DIA_Alrik_YouFight_09_03");	//За складом в портовом квартале - здесь мой дом!
};


instance DIA_Alrik_Regeln(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_Regeln_Condition;
	information = DIA_Alrik_Regeln_Info;
	permanent = FALSE;
	description = "Каковы правила боев?";
};


func int DIA_Alrik_Regeln_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Alrik_YouFight) && (AlrikRECRUITEDDT == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Alrik_Regeln_Info()
{
	AI_Output(other,self,"DIA_Alrik_Regeln_15_00");	//Каковы правила боев?
	AI_Output(self,other,"DIA_Alrik_Regeln_09_01");	//Это просто! Разрешено все обычное оружие. Никаких луков, арбалетов и НИКАКОЙ магии!
	AI_Output(self,other,"DIA_Alrik_Regeln_09_02");	//Мы сражаемся, пока один из нас не упадет. Как только один из нас окажется распростертым на земле, бой окончен, понятно?
	AI_Output(self,other,"DIA_Alrik_Regeln_09_03");	//Кто сбежит - тот проиграл! То есть, если ты вышел из боя, то я победил!
	AI_Output(self,other,"DIA_Alrik_Regeln_09_04");	//Ставка - пятьдесят золотых! Если ты победишь, ты получишь сто монет. Если нет...(ухмыляется) Ну, тогда твои деньги останутся у меня.
	AI_Output(self,other,"DIA_Alrik_Regeln_09_05");	//Понял?
	AI_Output(other,self,"DIA_Alrik_Regeln_15_06");	//Да!
};

func void B_Alrik_Again()
{
	AI_Output(self,other,"DIA_Alrik_Add_09_03");	//Как дела? Ты хочешь сразиться со мной еще раз? Я думаю, за это время я стал лучше...
};


instance DIA_Alrik_NewFights3(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_NewFights3_Condition;
	information = DIA_Alrik_NewFights3_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Alrik_NewFights3_Condition()
{
	if((Kapitel >= 3) && (Kapitel <= 4) && (Alrik_ArenaKampfVerloren <= 6))
	{
		return TRUE;
	};
};

func void DIA_Alrik_NewFights3_Info()
{
	B_AddFightSkill(self,NPC_TALENT_1H,5);
	B_SetAttributesToChapter(self,5);
	B_Alrik_Again();
};


instance DIA_Alrik_NewFights5(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_NewFights5_Condition;
	information = DIA_Alrik_NewFights5_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Alrik_NewFights5_Condition()
{
	if((Kapitel >= 5) && (Alrik_ArenaKampfVerloren <= 9))
	{
		return TRUE;
	};
};

func void DIA_Alrik_NewFights5_Info()
{
	B_AddFightSkill(self,NPC_TALENT_1H,5);
	B_SetAttributesToChapter(self,6);
	B_Alrik_Again();
};

func void B_Alrik_Enough()
{
	AI_Output(self,other,"DIA_Alrik_WannaFight_09_05");	//Мне кажется, ты побеждаешь слишком часто.
	AI_Output(self,other,"DIA_Alrik_WannaFight_09_06");	//Не пойми меня неверно, но моя башка все еще гудит после прошлого раза...
};

func void B_Alrik_ComeBackLater()
{
	AI_Output(self,other,"DIA_Alrik_Add_09_02");	//Заходи позже. А пока я потренируюсь...
};


instance DIA_Alrik_WannaFight(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_WannaFight_Condition;
	information = DIA_Alrik_WannaFight_Info;
	permanent = TRUE;
	description = "Я хочу сразиться с тобой!";
};

func int DIA_Alrik_WannaFight_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Alrik_Regeln) && (self.aivar[AIV_ArenaFight] == AF_NONE) && (AlrikRECRUITEDDT == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Alrik_WannaFight_Info()
{
	AI_Output(other,self,"DIA_Alrik_WannaFight_15_00");	//Я хочу сразиться с тобой!
	Info_ClearChoices(DIA_Alrik_WannaFight);

	if((Alrik_ArenaKampfVerloren > 0) && (Npc_HasItems(self,ItMw_AlriksSword_Mis) == 0))
	{
		if(MIS_Alrik_Sword == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Alrik_WannaFight_09_01");	//Сначала верни мне мой меч. А там посмотрим...

			if(Npc_HasItems(other,ItMw_AlriksSword_Mis) >= 1)
			{
				Info_ClearChoices(DIA_Alrik_WannaFight);
				Info_AddChoice(DIA_Alrik_WannaFight,"...(отдать меч)",DIA_Alrik_WannaFight_GiveSword);
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Alrik_WannaFight_09_02");	//Нет, нет. Прежде чем выйти против тебя еще раз, мне раздобыть нужно оружие получше!
			AI_Output(self,other,"DIA_Alrik_WannaFight_09_03");	//Мне несколько дней назад пришлось продать свой меч.
			AI_Output(self,other,"DIA_Alrik_WannaFight_09_04");	//С ним я непобедим! Если ты вернешь его мне, я готов опять сражаться с тобой!
			Alrik_VomSchwertErzaehlt = TRUE;
		};
	}
	else if((Kapitel <= 2) && (Alrik_ArenaKampfVerloren > 3))
	{
		AI_Output(self,other,"DIA_Alrik_Add_09_00");	//Я думаю, пока хватит...
		AI_Output(self,other,"DIA_Alrik_Add_09_01");	//Дай мне немного передохнуть.
		B_Alrik_ComeBackLater();
	}
	else if((Kapitel >= 3) && (Kapitel <= 4) && (Alrik_ArenaKampfVerloren > 6))
	{
		B_Alrik_Enough();
		B_Alrik_ComeBackLater();
	}
	else if(Kapitel >= 5)
	{
		if(Alrik_ArenaKampfVerloren > 9)
		{
			B_Alrik_Enough();
			AI_Output(self,other,"DIA_Alrik_Add_09_04");	//Кроме того, у меня уже достаточно золота.
		}
		else
		{
			AI_Output(self,other,"DIA_Alrik_Add_09_04A");	//У меня уже набралось достаточно золота.
		};
		if(Npc_IsDead(edda) == FALSE)
		{
			AI_Output(self,other,"DIA_Alrik_Add_09_05");	//И я завязал с этим делом и, даже, нашел общий язык с Эддой.
			AI_Output(self,other,"DIA_Alrik_Add_09_06");	//Кхм... Думаю, ты понимаешь, о чем я...
		}
		else
		{
			AI_Output(self,other,"DIA_Alrik_Add_09_05A");	//И я завязал с этим делом! Прикупил хибарку Эдды.
			AI_Output(self,other,"DIA_Alrik_Add_09_06A");	//И теперь я не живу за складом.
		};
	}
	else if(Wld_IsTime(11,0,19,0))
	{
		AI_Output(self,other,"DIA_Alrik_WannaFight_09_07");	//У тебя есть полсотни золотых?
		Info_ClearChoices(DIA_Alrik_WannaFight);
		Info_AddChoice(DIA_Alrik_WannaFight,"Хм...",DIA_Alrik_WannaFight_NoGold);

		if(Npc_HasItems(other,ItMi_Gold) >= 50)
		{
			Info_AddChoice(DIA_Alrik_WannaFight,"Вот они...",DIA_Alrik_WannaFight_Gold);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Alrik_WannaFight_09_08");	//Я сражаюсь только с полудня до вечера.
		AI_Output(self,other,"DIA_Alrik_WannaFight_09_09");	//Бои имеют смысл, только если есть достаточно зрителей, делающих ставки!
		if(Wld_IsTime(19,0,3,30))
		{
			AI_Output(self,other,"DIA_Alrik_WannaFight_09_10");	//Сейчас слишком поздно. Приходи завтра в полдень!
		}
		else
		{
			AI_Output(self,other,"DIA_Alrik_WannaFight_09_11");	//Все еще слишком рано, заходи позже!
		};
	};
};

func void DIA_Alrik_WannaFight_GiveSword()
{
	AI_Output(other,self,"DIA_Alrik_WannaFight_Gold_15_00");	//Вот, держи...
	B_GiveInvItems(other,self,ItMw_AlriksSword_Mis,1);
	AI_EquipBestMeleeWeapon(self);
	AI_StopProcessInfos(self);
};

func void DIA_Alrik_WannaFight_Gold()
{
	AI_Output(other,self,"DIA_Alrik_WannaFight_Gold_15_00");	//Вот, держи...
	B_GiveInvItems(other,self,ItMi_Gold,50);
	AI_Output(self,other,"DIA_Alrik_WannaFight_Gold_09_01");	//(громко) У нас новый боец!
	AI_Output(self,other,"DIA_Alrik_WannaFight_Gold_09_02");	//Ставки сделаны...
	Npc_RemoveInvItems(self,ItMi_Gold,Npc_HasItems(self,ItMi_Gold));
	AI_Output(self,other,"DIA_Alrik_WannaFight_Gold_09_03");	//Ты готов?
	self.aivar[AIV_ArenaFight] = AF_RUNNING;
	Alrik_Kaempfe = Alrik_Kaempfe + 1;
	Info_ClearChoices(DIA_Alrik_WannaFight);
	Info_AddChoice(DIA_Alrik_WannaFight,"Подожди секундочку...",DIA_Alrik_WannaFight_Moment);
	Info_AddChoice(DIA_Alrik_WannaFight,"Иди сюда!",DIA_Alrik_WannaFight_NOW);
};

func void DIA_Alrik_WannaFight_NoGold()
{
	AI_Output(other,self,"DIA_Alrik_WannaFight_NoGold_15_00");	//Нет...
	AI_Output(self,other,"DIA_Alrik_WannaFight_NoGold_09_01");	//Тогда найди их! Без ставок боя не будет!
	Info_ClearChoices(DIA_Alrik_WannaFight);
};

func void DIA_Alrik_WannaFight_NOW()
{
	AI_Output(other,self,"DIA_Alrik_WannaFight_NOW_15_00");	//Иди сюда!
	AI_Output(self,other,"DIA_Alrik_WannaFight_NOW_09_01");	//Посмотрим, на что ты способен!

	if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
	{
		CreateInvItems(self,ItPo_Health_03,1);
		B_UseItem(self,ItPo_Health_03);
	};

	AI_StopProcessInfos(self);
	CreateInvItems(self,ItMi_Gold,100);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Alrik_WannaFight_Moment()
{
	AI_Output(other,self,"DIA_Alrik_WannaFight_Moment_15_00");	//Подожди секундочку...
	AI_Output(self,other,"DIA_Alrik_WannaFight_Moment_09_01");	//Как хочешь... а я начинаю сейчас!

	if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
	{
		CreateInvItems(self,ItPo_Health_03,1);
		B_UseItem(self,ItPo_Health_03);
	};

	AI_StopProcessInfos(self);
	CreateInvItems(self,ItMi_Gold,100);
	B_Attack(self,other,AR_NONE,1);
};

instance DIA_Alrik_AfterFight(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_AfterFight_Condition;
	information = DIA_Alrik_AfterFight_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Alrik_AfterFight_Condition()
{
	if((self.aivar[AIV_LastFightComment] == FALSE) && (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_NONE))
	{
		if(self.aivar[AIV_ArenaFight] != AF_NONE)
		{
			return TRUE;
		}
		else if(Npc_IsInState(self,ZS_Talk))
		{
			return TRUE;
		};
	};
};

func void DIA_Alrik_AfterFight_Info()
{
	if((self.aivar[AIV_ArenaFight] != AF_NONE) && (self.aivar[AIV_ArenaFight] != AF_AFTER_PLUS_DAMAGE))
	{
		if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		{
			B_GivePlayerXP(100);
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_00");	//Ох, парень. Ну и удары у тебя!

			if(Npc_HasItems(self,ItMi_Gold) >= 100)
			{
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_01");	//Вот твои сто золотых! Ты заработал их!
				B_GiveInvItems(self,other,ItMi_Gold,100);
			}
			else if(Npc_HasItems(self,ItMi_Gold) == 0)
			{
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_02");	//Я вижу, ты уже забрал свое золото.
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_03");	//Ты мог бы подождать, пока я сам не отдам его тебе - я держу свое слово!
			}
			else
			{
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_04");	//Ты пошарил в моих карманах, пока я был без сознания!
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_05");	//Это дурной тон! Но ладно, эти деньги все равно были твоими! Вот остальное.
				B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(self,ItMi_Gold));
			};

			Alrik_ArenaKampfVerloren = Alrik_ArenaKampfVerloren + 1;

			if(Alrik_Ok_01 == FALSE)
			{
				Alrik_Ok_01 = TRUE;
			};
		}
		else if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
		{
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_06");	//Ты хорошо дрался. Но твоя ставка пропала - не расстраивайся особенно, она пойдет на доброе дело! (ухмыляется)
		}
		else
		{
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_07");	//Эй, я же предупреждал, тот, кто убежит за угол проигрывает! Если хочешь попробовать еще раз, я к твоим услугам!
		};
		if(Alrik_Kaempfe == 1)
		{
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_08");	//И еще одно: никто не говорит о том, что происходит за складом.
			if((other.guild != GIL_MIL) && (other.guild != GIL_PAL))
			{
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_09");	//Ополчение готово за малейшее прегрешение засунуть тебя за решетку. А эти парни не любят когда делаются ставки на бой.
			};
		};
		self.aivar[AIV_ArenaFight] = AF_NONE;
		self.aivar[AIV_LastFightComment] = TRUE;
	}
	else
	{
		if(self.aivar[AIV_ArenaFight] == AF_AFTER_PLUS_DAMAGE)
		{
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_10");	//Бой был окончен, ты, кретин!
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_11");	//Я не люблю, когда кто-нибудь не подчиняется моим правилам.
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_12");	//Убирайся отсюда!
		}
		else
		{
			if(Alrik_Kaempfe == 0)
			{
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_13");	//Если ты хотел сразиться со мной, тебе нужно было вызвать меня.
			}
			else
			{
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_14");	//Если ты хотел сразиться еще раз, тебе нужно было вызвать меня!
			};

			AI_Output(self,other,"DIA_Alrik_AfterFight_09_15");	//Я не хочу иметь дела с таким дерьмом, как ты! Проваливай!
		};

		self.aivar[AIV_ArenaFight] = AF_NONE;
		AI_StopProcessInfos(self);
	};
};


instance DIA_Alrik_DuWohnst(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_DuWohnst_Condition;
	information = DIA_Alrik_DuWohnst_Info;
	permanent = FALSE;
	description = "Ты 'живешь' за этим складом?";
};


func int DIA_Alrik_DuWohnst_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Alrik_YouFight) && (Kapitel < 5) && (AlrikRECRUITEDDT == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Alrik_DuWohnst_Info()
{
	AI_Output(other,self,"DIA_Alrik_DuWohnst_15_00");	//(удивленно)...Ты живешь за этим складом?
	AI_Output(self,other,"DIA_Alrik_DuWohnst_09_01");	//Только временно. (ухмыляется) Когда имеешь столько денег, как у меня, можно позволить себе немного роскоши!
	AI_Output(self,other,"DIA_Alrik_DuWohnst_09_02");	//Я был инструктором в армии, но я бросил это занятие и выбрал судьбу искателя приключений.
	AI_Output(self,other,"DIA_Alrik_DuWohnst_09_03");	//И вот я застрял в этой дыре. Мои последние сто золотых ушли в карман стражникам у городских ворот.
	AI_Output(self,other,"DIA_Alrik_DuWohnst_09_04");	//Теперь я пытаюсь опять разбогатеть! Мне даже пришлось продать мой меч.
	Alrik_VomSchwertErzaehlt = TRUE;
};


instance DIA_Alrik_WerSchwert(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_WerSchwert_Condition;
	information = DIA_Alrik_WerSchwert_Info;
	permanent = FALSE;
	description = "Кому ты продал свой меч?";
};

func int DIA_Alrik_WerSchwert_Condition()
{
	if(Alrik_VomSchwertErzaehlt == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Alrik_WerSchwert_Info()
{
	AI_Output(other,self,"DIA_Alrik_WerSchwert_15_00");	//Кому ты продал свой меч?
	AI_Output(self,other,"DIA_Alrik_WerSchwert_09_01");	//Я обменял его у торговца с рыночной площади на кое-какие вещи.
	AI_Output(self,other,"DIA_Alrik_WerSchwert_09_02");	//Его зовут Джора. Факелы и мясо, что он дал мне, давно закончились.
	AI_Output(other,self,"DIA_Alrik_WerSchwert_15_03");	//Он вряд ли отдаст мне этот меч просто так...
	AI_Output(self,other,"DIA_Alrik_WerSchwert_09_04");	//Это старый меч. Он вряд ли много за него запросит. Просто думай об этих деньгах, как о дополнительной ставке. (ухмыляется)
	MIS_Alrik_Sword = LOG_Running;
	Log_CreateTopic(TOPIC_AlrikSchwert,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AlrikSchwert,LOG_Running);
	B_LogEntry(TOPIC_AlrikSchwert,"Альрик продал свой меч торговцу Джоре. Он будет сражаться со мной, только если я верну ему его меч.");
};

var int Alrik_EinmalSchwertBonus;

instance DIA_Alrik_HaveSword(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_HaveSword_Condition;
	information = DIA_Alrik_HaveSword_Info;
	permanent = FALSE;
	description = "Я принес твой меч!";
};

func int DIA_Alrik_HaveSword_Condition()
{
	if((Npc_HasItems(other,ItMw_AlriksSword_Mis) >= 1) && (MIS_Alrik_Sword == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Alrik_HaveSword_Info()
{
	B_GivePlayerXP(XP_AlriksSword);
	AI_Output(other,self,"DIA_Alrik_HaveSword_15_00");	//Я принес твой меч!
	B_GiveInvItems(other,self,ItMw_AlriksSword_Mis,1);
	AI_Output(self,other,"DIA_Alrik_HaveSword_09_01");	//Ах! Им значительно удобнее сражаться, чем палкой!
	AI_Output(self,other,"DIA_Alrik_HaveSword_09_02");	//Отлично! Интересно, осмелишься ли ты вызвать меня теперь!
	MIS_Alrik_Sword = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_AlrikSchwert,LOG_SUCCESS);
	B_LogEntry(TOPIC_AlrikSchwert,"Я вернул Альрику его меч.");

	if(Alrik_EinmalSchwertBonus == FALSE)
	{
		B_AddFightSkill(self,NPC_TALENT_1H,5);
		Alrik_EinmalSchwertBonus = TRUE;
	};
	if(Alrik_Ok_02 == FALSE)
	{
		Alrik_Ok_02 = TRUE;
	};

	AI_EquipBestMeleeWeapon(self);
};

instance DIA_Alrik_Krieg(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_Krieg_Condition;
	information = DIA_Alrik_Krieg_Info;
	permanent = FALSE;
	description = "Что ты знаешь о войне с орками?";
};


func int DIA_Alrik_Krieg_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Alrik_DuWohnst) || (hero.guild != GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Alrik_Krieg_Info()
{
	AI_Output(other,self,"DIA_Alrik_Krieg_15_00");	//Что ты знаешь о войне с орками?
	AI_Output(self,other,"DIA_Alrik_Krieg_09_01");	//Мне почти нечего сказать. Эта война идет уже очень давно.
	AI_Output(self,other,"DIA_Alrik_Krieg_09_02");	//Народ голодает. Повсюду поднимаются крестьянские восстания, которые безжалостно подавляются королем.
	AI_Output(self,other,"DIA_Alrik_Krieg_09_03");	//Но их слишком много. Если война вскоре не закончится, королевство развалится.
};

var int Alrik_VorausErzaehlt;

instance DIA_Alrik_Ausbilden(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_Ausbilden_Condition;
	information = DIA_Alrik_Ausbilden_Info;
	permanent = TRUE;
	description = "Ты можешь обучить меня?";
};

func int DIA_Alrik_Ausbilden_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Alrik_DuWohnst) || (hero.guild != GIL_NONE)) && (Alrik_Teach1H == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Alrik_Ausbilden_Info()
{
	AI_Output(other,self,"DIA_Alrik_Ausbilden_15_00");	//Ты можешь обучить меня?

	if((Alrik_Kaempfe == 0) && (hero.guild == GIL_NONE))
	{
		AI_Output(self,other,"DIA_Alrik_Ausbilden_09_01");	//Если ты действительно хочешь научиться сражаться, то выходи против меня...(ухмыляется) За этот урок я не возьму дополнительной платы.
		Alrik_VorausErzaehlt = TRUE;
	}
	else
	{
		if(Alrik_VorausErzaehlt == TRUE)
		{
			AI_Output(self,other,"DIA_Alrik_Ausbilden_09_02");	//Я держу свое слово. Я научу тебя всему, что я знаю - если у тебя достаточно опыта.
		}
		else
		{
			AI_Output(self,other,"DIA_Alrik_Ausbilden_09_03");	//Как только у тебя будет необходимый опыт - пожалуйста.
		};
		Alrik_Teach1H = TRUE;
		Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
		B_LogEntry(TOPIC_CityTeacher,"Альрик может обучить меня искусству владения одноручным оружием. Он ошивается за складом в портовом квартале.");
	};
};


var int Alrik_Merke_1h;

instance DIA_Alrik_Teach(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_Teach_Condition;
	information = DIA_Alrik_Teach_Info;
	permanent = TRUE;
	description = "Научи меня сражаться.";
};

func int DIA_Alrik_Teach_Condition()
{
	if(Alrik_Teach1H == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Alrik_Teach_Info()
{
	AI_Output(other,self,"DIA_Cord_Teach_15_00");	//Научи меня сражаться.
	Alrik_Merke_1h = other.HitChance[NPC_TALENT_1H];
	Info_ClearChoices(DIA_Alrik_Teach);
	Info_AddChoice(DIA_Alrik_Teach,Dialog_Back,DIA_Alrik_Teach_Back);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_alrik_teach_stamina_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_alrik_teach_stamina_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_alrik_teach_hp_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_alrik_teach_hp_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Alrik_Teach_1H_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Alrik_Teach_1H_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Alrik_Teach_crossbow_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Alrik_Teach_crossbow_5);

	if((hero.attribute[ATR_REGENERATEMANA] >= 1) && (hero.attribute[ATR_REGENERATEMANA] < 50))
	{
		Info_AddChoice(DIA_Alrik_Teach,PRINT_Shield1,DIA_Alrik_Teach_Shield_1);
		Info_AddChoice(DIA_Alrik_Teach,PRINT_Shield5,DIA_Alrik_Teach_Shield_5);
	};
};

func void DIA_Alrik_Teach_Back()
{
	Info_ClearChoices(DIA_Alrik_Teach);
};

func void DIA_Alrik_Teach_Shield_1()
{
	B_TeachShield(self,other,1,50);
	Info_ClearChoices(DIA_Alrik_Teach);
	Info_AddChoice(DIA_Alrik_Teach,Dialog_Back,DIA_Alrik_Teach_Back);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_alrik_teach_stamina_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_alrik_teach_stamina_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_alrik_teach_hp_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_alrik_teach_hp_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Alrik_Teach_1H_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Alrik_Teach_1H_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Alrik_Teach_crossbow_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Alrik_Teach_crossbow_5);

	if((hero.attribute[ATR_REGENERATEMANA] >= 1) && (hero.attribute[ATR_REGENERATEMANA] < 50))
	{
		Info_AddChoice(DIA_Alrik_Teach,PRINT_Shield1,dia_alrik_teach_shield_1);
		Info_AddChoice(DIA_Alrik_Teach,PRINT_Shield5,dia_alrik_teach_shield_5);
	};
};

func void DIA_Alrik_Teach_Shield_5()
{
	B_TeachShield(self,other,5,50);
	Info_ClearChoices(DIA_Alrik_Teach);
	Info_AddChoice(DIA_Alrik_Teach,Dialog_Back,DIA_Alrik_Teach_Back);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_alrik_teach_stamina_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_alrik_teach_stamina_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_alrik_teach_hp_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_alrik_teach_hp_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Alrik_Teach_1H_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Alrik_Teach_1H_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Alrik_Teach_crossbow_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Alrik_Teach_crossbow_5);

	if((hero.attribute[ATR_REGENERATEMANA] >= 1) && (hero.attribute[ATR_REGENERATEMANA] < 50))
	{
		Info_AddChoice(DIA_Alrik_Teach,PRINT_Shield1,dia_alrik_teach_shield_1);
		Info_AddChoice(DIA_Alrik_Teach,PRINT_Shield5,dia_alrik_teach_shield_5);
	};
};

func void DIA_Alrik_Teach_1H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,60);
	Info_ClearChoices(DIA_Alrik_Teach);
	Info_AddChoice(DIA_Alrik_Teach,Dialog_Back,DIA_Alrik_Teach_Back);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_alrik_teach_stamina_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_alrik_teach_stamina_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_alrik_teach_hp_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_alrik_teach_hp_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Alrik_Teach_1H_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Alrik_Teach_1H_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Alrik_Teach_crossbow_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Alrik_Teach_crossbow_5);

	if((hero.attribute[ATR_REGENERATEMANA] >= 1) && (hero.attribute[ATR_REGENERATEMANA] < 50))
	{
		Info_AddChoice(DIA_Alrik_Teach,PRINT_Shield1,dia_alrik_teach_shield_1);
		Info_AddChoice(DIA_Alrik_Teach,PRINT_Shield5,dia_alrik_teach_shield_5);
	};
};

func void DIA_Alrik_Teach_1H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,60);
	Info_ClearChoices(DIA_Alrik_Teach);
	Info_AddChoice(DIA_Alrik_Teach,Dialog_Back,DIA_Alrik_Teach_Back);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_alrik_teach_stamina_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_alrik_teach_stamina_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_alrik_teach_hp_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_alrik_teach_hp_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Alrik_Teach_1H_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Alrik_Teach_1H_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Alrik_Teach_crossbow_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Alrik_Teach_crossbow_5);

	if((hero.attribute[ATR_REGENERATEMANA] >= 1) && (hero.attribute[ATR_REGENERATEMANA] < 50))
	{
		Info_AddChoice(DIA_Alrik_Teach,PRINT_Shield1,dia_alrik_teach_shield_1);
		Info_AddChoice(DIA_Alrik_Teach,PRINT_Shield5,dia_alrik_teach_shield_5);
	};
};

func void dia_alrik_teach_stamina_1()
{
	b_teachstamina(self,other,NPC_TALENT_STAMINA,1);
	Info_ClearChoices(DIA_Alrik_Teach);
	Info_AddChoice(DIA_Alrik_Teach,Dialog_Back,DIA_Alrik_Teach_Back);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_alrik_teach_stamina_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_alrik_teach_stamina_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_alrik_teach_hp_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_alrik_teach_hp_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Alrik_Teach_1H_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Alrik_Teach_1H_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Alrik_Teach_crossbow_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Alrik_Teach_crossbow_5);

	if((hero.attribute[ATR_REGENERATEMANA] >= 1) && (hero.attribute[ATR_REGENERATEMANA] < 50))
	{
		Info_AddChoice(DIA_Alrik_Teach,PRINT_Shield1,dia_alrik_teach_shield_1);
		Info_AddChoice(DIA_Alrik_Teach,PRINT_Shield5,dia_alrik_teach_shield_5);
	};
};

func void dia_alrik_teach_stamina_5()
{
	b_teachstamina(self,other,NPC_TALENT_STAMINA,5);
	Info_ClearChoices(DIA_Alrik_Teach);
	Info_AddChoice(DIA_Alrik_Teach,Dialog_Back,DIA_Alrik_Teach_Back);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_alrik_teach_stamina_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_alrik_teach_stamina_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_alrik_teach_hp_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_alrik_teach_hp_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Alrik_Teach_1H_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Alrik_Teach_1H_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Alrik_Teach_crossbow_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Alrik_Teach_crossbow_5);

	if((hero.attribute[ATR_REGENERATEMANA] >= 1) && (hero.attribute[ATR_REGENERATEMANA] < 50))
	{
		Info_AddChoice(DIA_Alrik_Teach,PRINT_Shield1,dia_alrik_teach_shield_1);
		Info_AddChoice(DIA_Alrik_Teach,PRINT_Shield5,dia_alrik_teach_shield_5);
	};
};

func void dia_alrik_teach_hp_1()
{
	b_teachattributepointshitpoints(self,other,ATR_HITPOINTS_MAX,1,T_MAX_HP);
	Info_ClearChoices(DIA_Alrik_Teach);
	Info_AddChoice(DIA_Alrik_Teach,Dialog_Back,DIA_Alrik_Teach_Back);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_alrik_teach_stamina_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_alrik_teach_stamina_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_alrik_teach_hp_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_alrik_teach_hp_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Alrik_Teach_1H_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Alrik_Teach_1H_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Alrik_Teach_crossbow_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Alrik_Teach_crossbow_5);

	if((hero.attribute[ATR_REGENERATEMANA] >= 1) && (hero.attribute[ATR_REGENERATEMANA] < 50))
	{
		Info_AddChoice(DIA_Alrik_Teach,PRINT_Shield1,dia_alrik_teach_shield_1);
		Info_AddChoice(DIA_Alrik_Teach,PRINT_Shield5,dia_alrik_teach_shield_5);
	};
};

func void dia_alrik_teach_hp_5()
{
	b_teachattributepointshitpoints(self,other,ATR_HITPOINTS_MAX,5,T_MAX_HP);
	Info_ClearChoices(DIA_Alrik_Teach);
	Info_AddChoice(DIA_Alrik_Teach,Dialog_Back,DIA_Alrik_Teach_Back);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_alrik_teach_stamina_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_alrik_teach_stamina_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_alrik_teach_hp_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_alrik_teach_hp_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Alrik_Teach_1H_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Alrik_Teach_1H_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Alrik_Teach_crossbow_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Alrik_Teach_crossbow_5);

	if((hero.attribute[ATR_REGENERATEMANA] >= 1) && (hero.attribute[ATR_REGENERATEMANA] < 50))
	{
		Info_AddChoice(DIA_Alrik_Teach,PRINT_Shield1,dia_alrik_teach_shield_1);
		Info_AddChoice(DIA_Alrik_Teach,PRINT_Shield5,dia_alrik_teach_shield_5);
	};
};

func void DIA_Alrik_Teach_crossbow_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,1,40);
	Info_ClearChoices(DIA_Alrik_Teach);
	Info_AddChoice(DIA_Alrik_Teach,Dialog_Back,DIA_Alrik_Teach_Back);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_alrik_teach_stamina_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_alrik_teach_stamina_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_alrik_teach_hp_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_alrik_teach_hp_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Alrik_Teach_1H_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Alrik_Teach_1H_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Alrik_Teach_crossbow_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Alrik_Teach_crossbow_5);

	if((hero.attribute[ATR_REGENERATEMANA] >= 1) && (hero.attribute[ATR_REGENERATEMANA] < 50))
	{
		Info_AddChoice(DIA_Alrik_Teach,PRINT_Shield1,dia_alrik_teach_shield_1);
		Info_AddChoice(DIA_Alrik_Teach,PRINT_Shield5,dia_alrik_teach_shield_5);
	};
};

func void DIA_Alrik_Teach_crossbow_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,5,40);
	Info_ClearChoices(DIA_Alrik_Teach);
	Info_AddChoice(DIA_Alrik_Teach,Dialog_Back,DIA_Alrik_Teach_Back);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_alrik_teach_stamina_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_alrik_teach_stamina_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_alrik_teach_hp_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_alrik_teach_hp_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Alrik_Teach_1H_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Alrik_Teach_1H_5);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Alrik_Teach_crossbow_1);
	Info_AddChoice(DIA_Alrik_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Alrik_Teach_crossbow_5);

	if((hero.attribute[ATR_REGENERATEMANA] >= 1) && (hero.attribute[ATR_REGENERATEMANA] < 50))
	{
		Info_AddChoice(DIA_Alrik_Teach,PRINT_Shield1,dia_alrik_teach_shield_1);
		Info_AddChoice(DIA_Alrik_Teach,PRINT_Shield5,dia_alrik_teach_shield_5);
	};
};

instance DIA_Alrik_Shield(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_Shield_Condition;
	information = DIA_Alrik_Shield_Info;
	permanent = FALSE;
	description = "Ты сражаешься с щитом?";
};

func int DIA_Alrik_Shield_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Alrik_YouFight))
	{
		return TRUE;
	};
};

func void DIA_Alrik_Shield_Info()
{
	AI_Output(other,self,"DIA_Alrik_Shield_01_00");	//Ты сражаешься с щитом?
	AI_Output(self,other,"DIA_Alrik_Shield_01_01");	//Конечно! С ним я никогда не расстаюсь...(гордо) Он моя основная надежда и опора в бою!
	AI_Output(other,self,"DIA_Alrik_Shield_01_02");	//А меня ты бы мог обучить владению щитом?

	if((Alrik_Ok_01 == TRUE) && (Alrik_Ok_02 == TRUE))
	{
		AI_Output(self,other,"DIA_Alrik_Shield_01_03");	//Хммм...(оценивающе) Почему бы и нет? Ты производишь впечатление довольно способного ученика.
		AI_Output(self,other,"DIA_Alrik_Shield_01_04");	//Но тебе понадобится иметь некоторый опыт, чтобы овладеть этой техникой боя.
		AI_Output(self,other,"DIA_Alrik_Shield_01_05");	//И немного золота. Бесплатно я этого делать не стану.
		Alrik_Ok_Final = TRUE;
	}
	else if(Alrik_Ok_01 == FALSE)
	{
		AI_Output(self,other,"DIA_Alrik_Shield_01_06");	//Для начала покажи мне, на что ты способен. А там будет видно!
	}
	else if(Alrik_Ok_02 == FALSE)
	{
		AI_Output(self,other,"DIA_Alrik_Shield_01_07");	//Для начала мне нужно обзавестись нормальным оружием вместо этой дубины.
		AI_Output(self,other,"DIA_Alrik_Shield_01_08");	//Иначе я просто не смогу ничему тебя обучить.
	};

	Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_CityTeacher,"Альрик может обучить меня искусству владения щитом.");
};

instance DIA_Alrik_Shield_Teach(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_Shield_Teach_Condition;
	information = DIA_Alrik_Shield_Teach_Info;
	permanent = TRUE;
	description = "Научи меня обращаться с щитом. (Очки обучения: 10, Цена: 1000 монет)";
};

func int DIA_Alrik_Shield_Teach_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Alrik_Shield) && (hero.attribute[ATR_REGENERATEMANA] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Alrik_Shield_Teach_Info()
{
	AI_Output(other,self,"DIA_Alrik_Shield_Teach_01_00");	//Научи меня обращаться с щитом.

	if((Alrik_Ok_Final == TRUE) || ((Alrik_Ok_01 == TRUE) && (Alrik_Ok_02 == TRUE)))
	{
		if((hero.lp >= 10) && (Npc_HasItems(other,ItMi_Gold) >= 1000))
		{
			hero.lp = hero.lp - 10;
			RankPoints = RankPoints + 10;
			B_GiveInvItems(other,self,ItMi_Gold,1000);
			Npc_RemoveInvItems(self,ItMi_Gold,1000);
			AI_Output(self,other,"DIA_Alrik_Shield_Teach_01_01");	//Хорошо! Слушай внимательно. (серьезно)
			AI_Output(self,other,"DIA_Alrik_Shield_Teach_01_02");	//Щит - это то, что в трудную минуту может прикрыть твою задницу от смертельного удара.
			AI_Output(self,other,"DIA_Alrik_Shield_Teach_01_03");	//Техникой боя со щитом владеет далеко не каждый! Но эти знания определенно того стоят.
			AI_Output(self,other,"DIA_Alrik_Shield_Teach_01_04");	//Самое главное - старайся держать щит на уровне глаз. Не ниже и не выше.
			AI_Output(self,other,"DIA_Alrik_Shield_Teach_01_05");	//Это одновременно поможет тебе видеть своего противника и надежно прикрыть тело от удара.
			AI_Output(self,other,"DIA_Alrik_Shield_Teach_01_06");	//Удары меча должны быть быстрыми и короткими. Открылся, ударил и снова прикрылся щитом!
			AI_Output(self,other,"DIA_Alrik_Shield_Teach_01_07");	//Противнику придется изрядно поломать голову над тем, как пройти твою оборону.
			AI_Output(self,other,"DIA_Alrik_Shield_Teach_01_08");	//И рано или поздно он допустит ошибку, которой ты должен будешь воспользоваться.
			AI_Output(self,other,"DIA_Alrik_Shield_Teach_01_09");	//Если все сделаешь правильно, то когда-нибудь обязательно сможешь стать настоящим мастером-щитоносцем!
			AI_Output(self,other,"DIA_Alrik_Shield_Teach_01_10");	//И вот еще что. Возьми это деревянный щит в качестве небольшого подарка от меня.
			B_GiveInvItems(self,other,ItAr_Shield_01,1);
			AI_Output(self,other,"DIA_Alrik_Shield_Teach_01_11");	//Ведь с чем-то тебе придется тренироваться!
			AI_Print("Бой с щитом - обучен!");
			Snd_Play("LevelUP");
			hero.attribute[ATR_REGENERATEMANA] = TRUE;
			Npc_SetTalentSkill(hero,NPC_TALENT_RHETORIKA,1);
			Npc_SetTalentValue(hero,NPC_TALENT_RHETORIKA,hero.attribute[ATR_REGENERATEMANA]);
		}
		else
		{
			if(hero.lp < 10)
			{
				AI_Output(self,other,"DIA_Alrik_Shield_Teach_01_16");	//У тебя не хватает опыта, приятель! Извини.
			}
			else if(Npc_HasItems(other,ItMi_Gold) < 1000)
			{
				AI_Output(self,other,"DIA_Alrik_Shield_Teach_01_17");	//У тебя не хватает золота, приятель! Извини.	
			};
		};
	}
	else
	{
		if(Alrik_Ok_01 == FALSE)
		{
			AI_Output(self,other,"DIA_Alrik_Shield_Teach_01_12");	//Я же сказал - сначала покажи мне, на что ты способен!
			AI_Output(self,other,"DIA_Alrik_Shield_Teach_01_13");	//А потом поговорим.
		}
		else if(Alrik_Ok_02 == FALSE)
		{
			AI_Output(self,other,"DIA_Alrik_Shield_Teach_01_14");	//Ты разве не видишь, что в моей руке до сих пор это чертова дубина?
			AI_Output(self,other,"DIA_Alrik_Shield_Teach_01_15");	//Без нормального оружия я не стану тебя ничему учить!
		};
	};
};

instance DIA_Alrik_Armor(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_Armor_Condition;
	information = DIA_Alrik_Armor_Info;
	permanent = FALSE;
	description = "Неплохие у тебя доспехи.";
};

func int DIA_Alrik_Armor_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Alrik_YouFight) == TRUE) && (AlrikRECRUITEDDT == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Alrik_Armor_Info()
{
	AI_Output(other,self,"DIA_Alrik_Armor_01_00");	//Неплохие у тебя доспехи.
	AI_Output(self,other,"DIA_Alrik_Armor_01_01");	//Нравятся, да? (улыбаясь) Бьюсь об заклад, таких ты здесь больше нигде не найдешь.
	AI_Output(other,self,"DIA_Alrik_Armor_01_02");	//Да, я был бы не прочь примерить их.
	AI_Output(self,other,"DIA_Alrik_Armor_01_03");	//Нет ничего проще, приятель! Кажется, у меня оставался еще один комплект.
	AI_Output(self,other,"DIA_Alrik_Armor_01_04");	//Но тебе придется за него заплатить.
	AI_Output(other,self,"DIA_Alrik_Armor_01_05");	//И сколько?
	AI_Output(self,other,"DIA_Alrik_Armor_01_06");	//Эммм... Ну, думаю... Пятьсот золотых монет мне вполне хватит!
	AI_Output(other,self,"DIA_Alrik_Armor_01_07");	//А почему так дорого?
	AI_Output(self,other,"DIA_Alrik_Armor_01_08");	//Ну, видишь ли... (замялся) Мне очень нужны деньги.
	AI_Output(self,other,"DIA_Alrik_Armor_01_09");	//С их помощью я наконец-то смогу начать здесь новую жизнь.
	AI_Output(self,other,"DIA_Alrik_Armor_01_10");	//Ну и заодно расплатиться с некоторыми долгами.
	AI_Output(self,other,"DIA_Alrik_Armor_01_11");	//Так что извини, парень. Дешевле я не смогу их тебе продать.
};

var int BuyAlrikArmor;

instance DIA_Alrik_Armor_Trade(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_Armor_Trade_Condition;
	information = DIA_Alrik_Armor_Trade_Info;
	permanent = TRUE;
	description = "Купить доспехи Альрика. (Цена: 500 монет)";
};

func int DIA_Alrik_Armor_Trade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Alrik_Armor) && (BuyAlrikArmor == FALSE) && (AlrikRECRUITEDDT == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Alrik_Armor_Trade_Info()
{
	AI_Output(other,self,"DIA_Alrik_Armor_Trade_01_00");	//Продай мне свои доспехи.

	if(Npc_HasItems(other,ItMi_Gold) >= 500)
	{
		B_GiveInvItems(other,self,ItMi_Gold,500);
		Npc_RemoveInvItems(self,ItMi_Gold,500);
		AI_Output(self,other,"DIA_Alrik_Armor_Trade_01_01");	//Отлично, приятель! Вот, держи.
		B_GiveInvItems(self,other,ITAR_ADVENTURE_HERO,1);
		AI_Output(self,other,"DIA_Alrik_Armor_Trade_01_02");	//Поверь, ты не пожалеешь, что потратился на них.
		BuyAlrikArmor = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Alrik_Armor_Trade_01_03");	//У тебя не хватает золота, приятель! Извини.
	};
};

instance DIA_Alrik_ASKFORDT(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 6;
	condition = DIA_Alrik_askfordt_condition;
	information = DIA_Alrik_askfordt_info;
	permanent = FALSE;
	description = "Мне нужны люди.";
};

func int DIA_Alrik_askfordt_condition()
{
	var int DayNow;

	DayNow = Wld_GetDay();

	if((HURRAYICANHIRE == TRUE) && (WOLFRECRUITEDDT == TRUE) && (WolfDayHire < DayNow) && (Alrik_Ok_01 == TRUE) && (Alrik_Ok_02 == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Alrik_askfordt_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Alrik_AskforDT_15_00");	//Мне нужны люди.
	AI_Output(self,other,"DIA_Alrik_AskforDT_17_01");	//Для чего, позволь поинтересоваться?
	AI_Output(other,self,"DIA_Alrik_AskforDT_17_02");	//Для охраны моего лагеря. А ты вроде опытный боец, драться умеешь, вот я и подумал...
	AI_Output(self,other,"DIA_Alrik_AskforDT_17_03");	//Правда? У тебя есть лагерь?
	AI_Output(other,self,"DIA_Alrik_AskforDT_17_04");	//Да, неподалеку от фермы Онара, на месте старой башни.
	AI_Output(self,other,"DIA_Alrik_AskforDT_17_05");	//Хммм... А я смотрю, ты парень не промах! И когда ты только все успеваешь.
	AI_Output(other,self,"DIA_Alrik_AskforDT_17_06");	//Ну так, что скажешь? В конце концов, это лучше, чем получать каждый день по физиономии за складом в порту.
	AI_Output(self,other,"DIA_Alrik_AskforDT_17_07");	//И то верно. В принципе, я согласен на твое предложение. Но я хочу получать каждый день не меньше того, что я зарабатываю тут на арене.
	AI_Output(other,self,"DIA_Alrik_AskforDT_17_08");	//Ареной это назвать трудно! Но пятьдесят золотых монет в день я готов тебе платить. Если ты об этом...
	AI_Output(self,other,"DIA_Alrik_AskforDT_17_09");	//Хорошо, договорились. 
	AI_Output(other,self,"DIA_Alrik_AskforDT_17_10");	//Тогда не теряй времени и немедленно отправляйся в мой лагерь.
	AI_Output(other,self,"DIA_Alrik_AskforDT_17_11");	//Если что, охране у ворот скажешь пароль - 'Драконовы сокровища'. Тогда они тебя пропустят.
	AI_Output(self,other,"DIA_Alrik_AskforDT_17_12");	//Хорошо, увидимся.
	B_LogEntry(TOPIC_PPL_FOR_TOWER,"Альрик теперь будет охранять мой лагерь.");
	self.npcType = NPCTYPE_FRIEND;
	self.aivar[AIV_ToughGuy] = TRUE;
	self.aivar[AIV_IGNORE_Theft] = TRUE;
	self.aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	self.aivar[AIV_IgnoresArmor] = TRUE;
	AlrikRECRUITEDDT = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"InTower");
};

instance DIA_Alrik_INTOWER(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 22;
	condition = DIA_Alrik_intower_condition;
	information = DIA_Alrik_intower_info;
	permanent = TRUE;
	description = "Все в порядке?";
};

func int DIA_Alrik_intower_condition()
{
	if((AlrikRECRUITEDDT == TRUE) && (Npc_GetDistToWP(self,"NW_CASTLEMINE_TOWER_01") < 5000))
	{
		return TRUE;
	};
};

func void DIA_Alrik_intower_info()
{
	AI_Output(other,self,"DIA_Alrik_InTower_OrcKap_15_00");	//Все в порядке?
	AI_Output(self,other,"DIA_Alrik_InTower_OrcKap_01_01");	//Пока все тихо.
};

instance DIA_Alrik_BackShield(C_Info)
{
	npc = VLK_438_Alrik;
	nr = 1;
	condition = DIA_Alrik_BackShield_Condition;
	information = DIA_Alrik_BackShield_Info;
	permanent = FALSE;
	description = "Держи свой щит обратно.";
};

func int DIA_Alrik_BackShield_Condition()
{
	if(Npc_HasItems(other,ItAr_Shield_01_Alrik) > 1)
	{
		return TRUE;
	};
};

func void DIA_Alrik_BackShield_Info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Alrik_WannaFight_Gold_15_00");	//Вот, держи...
	B_GiveInvItems(other,self,ItAr_Shield_01_Alrik,1);
	Npc_RemoveInvItems(self,ItAr_Shield_01_Alrik,Npc_HasItems(self,ItAr_Shield_01_Alrik));
	AI_Output(self,other,"DIA_Rod_GiveItBack_06_01");	//Вовремя!
	AI_StopProcessInfos(self);
	B_SetFightSkills(self,30);
};