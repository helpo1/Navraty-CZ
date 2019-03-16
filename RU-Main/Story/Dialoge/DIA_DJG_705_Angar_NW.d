
instance DIA_Angar_NW_KAP5_EXIT(C_Info)
{
	npc = DJG_705_Angar_NW;
	nr = 999;
	condition = DIA_Angar_NW_KAP5_EXIT_Condition;
	information = DIA_Angar_NW_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Angar_NW_KAP5_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Angar_NW_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Angar_NW_AllDragonsDead(C_Info)
{
	npc = DJG_705_Angar_NW;
	nr = 59;
	condition = DIA_Angar_NW_AllDragonsDead_Condition;
	information = DIA_Angar_NW_AllDragonsDead_Info;
	description = "Как дела?";
};


func int DIA_Angar_NW_AllDragonsDead_Condition()
{
	if(CAPITANORDERDIAWAY == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Angar_NW_AllDragonsDead_Info()
{
	AI_Output(other,self,"DIA_Angar_NW_AllDragonsDead_15_00");	//Как дела?
	AI_Output(self,other,"DIA_Angar_NW_AllDragonsDead_04_01");	//Хорошо. Но меня все равно мучают головные боли, хотя они уменьшились с тех пор, как я покинул Долину Рудников.
	if(Angar_IsOnBoard != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Angar_NW_AllDragonsDead_04_02");	//Я останусь здесь. Ты будешь знать, где найти меня, если я тебе понадоблюсь.
	};
};


instance DIA_Angar_NW_KnowWhereEnemy(C_Info)
{
	npc = DJG_705_Angar_NW;
	nr = 55;
	condition = DIA_Angar_NW_KnowWhereEnemy_Condition;
	information = DIA_Angar_NW_KnowWhereEnemy_Info;
	permanent = TRUE;
	description = "Я собираюсь покинуть Хоринис. Ты хочешь присоединиться ко мне?";
};


func int DIA_Angar_NW_KnowWhereEnemy_Condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && (Angar_IsOnBoard == FALSE) && Npc_KnowsInfo(other,DIA_Angar_NW_AllDragonsDead) && (CAPITANORDERDIAWAY == FALSE) && (SCGotCaptain == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Angar_NW_KnowWhereEnemy_Info()
{
	AI_Output(other,self,"DIA_Angar_NW_KnowWhereEnemy_15_00");	//Я собираюсь покинуть Хоринис. Ты хочешь присоединиться ко мне?
	AI_Output(self,other,"DIA_Angar_NW_KnowWhereEnemy_04_01");	//Чем дальше я буду от Долины Рудников, тем лучше. Когда мы отчаливаем?
	Log_CreateTopic(Topic_Crew,LOG_MISSION);
	Log_SetTopicStatus(Topic_Crew,LOG_Running);
	B_LogEntry(Topic_Crew,"Ангар рад каждой миле, которая лежит между ним и рудниковой долиной. Он согласился сопровождать меня");
	if(Crewmember_Count >= Max_Crew)
	{
		AI_Output(other,self,"DIA_Angar_NW_KnowWhereEnemy_15_02");	//У меня сейчас достаточно людей, чтобы управлять кораблем. Возможно, я обращусь к тебе позже.
		AI_Output(self,other,"DIA_Angar_NW_KnowWhereEnemy_04_03");	//Хорошо. Ты знаешь, где найти меня.
	}
	else
	{
		Info_ClearChoices(DIA_Angar_NW_KnowWhereEnemy);
		Info_AddChoice(DIA_Angar_NW_KnowWhereEnemy,"Я дам тебе знать, когда придет время.",DIA_Angar_NW_KnowWhereEnemy_No);
		Info_AddChoice(DIA_Angar_NW_KnowWhereEnemy,"Иди в гавань. Встретимся там.",DIA_Angar_NW_KnowWhereEnemy_Yes);
	};
};

func void DIA_Angar_NW_KnowWhereEnemy_Yes()
{
	AI_Output(other,self,"DIA_Angar_NW_KnowWhereEnemy_Yes_15_00");	//Приходи в гавань. Я подойду позже.
	AI_Output(self,other,"DIA_Angar_NW_KnowWhereEnemy_Yes_04_01");	//Я уже в дороге.
	Angar_IsOnBoard = LOG_SUCCESS;
	Crewmember_Count = Crewmember_Count + 1;
	B_GivePlayerXP(XP_Crewmember_Success);
	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	Info_ClearChoices(DIA_Angar_NW_KnowWhereEnemy);
};

func void DIA_Angar_NW_KnowWhereEnemy_No()
{
	AI_Output(other,self,"DIA_Angar_NW_KnowWhereEnemy_No_15_00");	//Я дам тебе знать, когда придет время.
	AI_Output(self,other,"DIA_Angar_NW_KnowWhereEnemy_No_04_01");	//Хорошо.
	Angar_IsOnBoard = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Angar_NW_KnowWhereEnemy);
};


instance DIA_Angar_NW_LeaveMyShip(C_Info)
{
	npc = DJG_705_Angar_NW;
	nr = 55;
	condition = DIA_Angar_NW_LeaveMyShip_Condition;
	information = DIA_Angar_NW_LeaveMyShip_Info;
	permanent = TRUE;
	description = "Оставайся здесь и лечись от своей головной боли.";
};


func int DIA_Angar_NW_LeaveMyShip_Condition()
{
	if((Angar_IsOnBoard == LOG_SUCCESS) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Angar_NW_LeaveMyShip_Info()
{
	AI_Output(other,self,"DIA_Angar_NW_LeaveMyShip_15_00");	//Оставайся здесь и лечись от своей головной боли.
	AI_Output(self,other,"DIA_Angar_NW_LeaveMyShip_04_01");	//Хорошо. Я пойду назад. Может, так даже будет лучше.
	Angar_IsOnBoard = LOG_OBSOLETE;
	Crewmember_Count = Crewmember_Count - 1;
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_Angar_NW_StillNeedYou(C_Info)
{
	npc = DJG_705_Angar_NW;
	nr = 55;
	condition = DIA_Angar_NW_StillNeedYou_Condition;
	information = DIA_Angar_NW_StillNeedYou_Info;
	permanent = TRUE;
	description = "Возвращайся на борт.";
};


func int DIA_Angar_NW_StillNeedYou_Condition()
{
	if(((Angar_IsOnBoard == LOG_OBSOLETE) || (Angar_IsOnBoard == LOG_FAILED)) && (Crewmember_Count < Max_Crew) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Angar_NW_StillNeedYou_Info()
{
	AI_Output(other,self,"DIA_Angar_NW_StillNeedYou_15_00");	//Возвращайся на борт!
	AI_Output(self,other,"DIA_Angar_NW_StillNeedYou_04_01");	//Ты даже хуже, чем я. Немного определенности тебе совсем бы не помешало. Увидимся позже!
	Angar_IsOnBoard = LOG_SUCCESS;
	Crewmember_Count = Crewmember_Count + 1;
	AI_StopProcessInfos(self);
	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
};


instance DIA_Angar_NW_PICKPOCKET(C_Info)
{
	npc = DJG_705_Angar_NW;
	nr = 900;
	condition = DIA_Angar_NW_PICKPOCKET_Condition;
	information = DIA_Angar_NW_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Angar_NW_PICKPOCKET_Condition()
{
	return C_Beklauen(47,34);
};

func void DIA_Angar_NW_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Angar_NW_PICKPOCKET);
	Info_AddChoice(DIA_Angar_NW_PICKPOCKET,Dialog_Back,DIA_Angar_NW_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Angar_NW_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Angar_NW_PICKPOCKET_DoIt);
};

func void DIA_Angar_NW_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Angar_NW_PICKPOCKET);
};

func void DIA_Angar_NW_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Angar_NW_PICKPOCKET);
};


instance DIA_Angar_NW_FOUNDAMULETT(C_Info)
{
	npc = DJG_705_Angar_NW;
	nr = 7;
	condition = DIA_Angar_NW_FOUNDAMULETT_Condition;
	information = DIA_Angar_NW_FOUNDAMULETT_Info;
	description = "Я нашел твой амулет.";
};


func int DIA_Angar_NW_FOUNDAMULETT_Condition()
{
	if(Npc_HasItems(other,ItAm_Mana_Angar_MIS) && Npc_KnowsInfo(other,DIA_Angar_WIEKOMMSTDUHIERHER) && (DJG_AngarGotAmulett == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Angar_NW_FOUNDAMULETT_Info()
{
	B_AngarsAmulettAbgeben();
};


instance DIA_ANGAR_NW_KAPITELORCATTACK(C_Info)
{
	npc = DJG_705_Angar_NW;
	nr = 1;
	condition = dia_angar_nw_kapitelorcattack_condition;
	information = dia_angar_nw_kapitelorcattack_info;
	permanent = FALSE;
	description = "Ты слышал, что произошло?!";
};


func int dia_angar_nw_kapitelorcattack_condition()
{
	if((MIS_HELPCREW == LOG_Running) && (MOVECREWTOHOME == FALSE) && (ANGARBACKNW == TRUE))
	{
		return TRUE;
	};
};

func void dia_angar_nw_kapitelorcattack_info()
{
	AI_Output(other,self,"DIA_Angar_NW_KapitelOrcAttack_01_00");	//Ты слышал, что произошло? Город захватили орки!
	AI_Output(self,other,"DIA_Angar_NW_KapitelOrcAttack_01_01");	//Да, плохо дело! Как же нам теперь вырваться из этой западни?
	AI_Output(other,self,"DIA_Angar_NW_KapitelOrcAttack_01_02");	//У тебя есть идеи?
	AI_Output(self,other,"DIA_Angar_NW_KapitelOrcAttack_01_03");	//Я не знаю. Но, по всей видимости, нам остается только прорываться с боем через Хоринис.
	AI_Output(self,other,"DIA_Angar_NW_KapitelOrcAttack_01_04");	//Хотя я почти уверен, что это верная смерть.
	Info_ClearChoices(dia_angar_nw_kapitelorcattack);

	if(Npc_HasItems(other,ItMi_TeleportPsicamp) >= 1)
	{
		Info_AddChoice(dia_angar_nw_kapitelorcattack,"(предложить руну телепортации в лагерь Братства)",dia_angar_nw_kapitelorcattack_psicamp);
	};
	Info_AddChoice(dia_angar_nw_kapitelorcattack,"Думаю, так оно и есть.",dia_angar_nw_kapitelorcattack_nogiverune);
};

func void dia_angar_nw_kapitelorcattack_psicamp()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Angar_NW_KapitelOrcAttack_PsiCamp_01_01");	//Учитывая, сколько там может быть орков - думаю, ты прав.
	AI_Output(other,self,"DIA_Angar_NW_KapitelOrcAttack_PsiCamp_01_02");	//Правда, у меня есть с собой руна телепортации в лагерь Братства. Ты бы мог ей воспользоваться.
	AI_Output(self,other,"DIA_Angar_NW_KapitelOrcAttack_PsiCamp_01_03");	//У тебя есть руна телепортации?
	AI_Output(self,other,"DIA_Angar_NW_KapitelOrcAttack_PsiCamp_01_05");	//Что ж, спасибо, конечно. Но, по правде сказать, я бы предпочел бой.
	AI_Output(other,self,"DIA_Angar_NW_KapitelOrcAttack_PsiCamp_01_06");	//Не сомневаюсь в твоей храбрости, Ангар! Но думаю, ты и сам прекрасно понимаешь, что шансов пробиться через город практически нет.
	B_GiveInvItems(other,self,ItMi_TeleportPsicamp,1);
	Npc_RemoveInvItems(self,ItMi_TeleportPsicamp,1);
	AI_Output(self,other,"DIA_Angar_NW_KapitelOrcAttack_PsiCamp_01_08");	//(вздыхая) Ладно. Так и сделаю.
	ANGARNOBATTLETHROUGTH = TRUE;
	B_LogEntry(TOPIC_HELPCREW,"Я отдал Ангару руну телепортации в лагерь болотного Братства. Теперь он без проблем сможет уйти из гавани, минуя патрули орков.");
	PERMCOUNTBACKNW = PERMCOUNTBACKNW + 1;
	b_countbackcrew();
	AI_StopProcessInfos(self);
};

func void dia_angar_nw_kapitelorcattack_nogiverune()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Angar_NW_KapitelOrcAttack_NoGiveRune_01_00");	//Думаю, так оно и есть.
	AI_Output(other,self,"DIA_Angar_NW_KapitelOrcAttack_NoGiveRune_01_01");	//Учитывая, сколько там может быть орков, - думаю, ты прав. Шансов пробиться через город практически нет.
	AI_Output(self,other,"DIA_Angar_NW_KapitelOrcAttack_NoGiveRune_01_02");	//Мы постараемся. В любом случае больше нам ничего не остается.
	AI_Output(other,self,"DIA_Angar_NW_KapitelOrcAttack_NoGiveRune_01_03");	//Ладно, тогда удачи тебе, Ангар! Надеюсь, мы еще встретимся.
	AI_Output(self,other,"DIA_Angar_NW_KapitelOrcAttack_NoGiveRune_01_04");	//Я тоже, приятель.
	B_LogEntry(TOPIC_HELPCREW,"Судя по всему, Ангар решил с боем пробиваться из захваченного города. Это безумие, но я надеюсь, что ему все-таки повезет и он не погибнет. По крайней мере, у него неплохие шансы на это!");
	ANGARBATTLETHROUGTH = TRUE;
	PERMCOUNTBACKNW = PERMCOUNTBACKNW + 1;
	b_countbackcrew();
	AI_StopProcessInfos(self);
};


instance DIA_DJG_705_ANGAR_NW_FUCKOFF(C_Info)
{
	npc = DJG_705_Angar_NW;
	nr = 2;
	condition = dia_djg_705_angar_nw_fuckoff_condition;
	information = dia_djg_705_angar_nw_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_djg_705_angar_nw_fuckoff_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (ANGARCAPTURED == TRUE) && (HORINISISFREE == FALSE))
	{
		return TRUE;
	};
};

func void dia_djg_705_angar_nw_fuckoff_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
};


instance DIA_DJG_705_ANGAR_NW_YOURFREE(C_Info)
{
	npc = DJG_705_Angar_NW;
	nr = 1;
	condition = dia_djg_705_angar_nw_yourfree_condition;
	information = dia_djg_705_angar_nw_yourfree_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_djg_705_angar_nw_yourfree_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (ANGARCAPTURED == TRUE) && (HORINISISFREE == TRUE) && (CAPTUREDMANSISFREE == FALSE))
	{
		return TRUE;
	};
};

func void dia_djg_705_angar_nw_yourfree_info()
{
	AI_Output(self,other,"DIA_DJG_705_Angar_NW_YourFree_01_08");	//Что ты здесь делаешь, приятель?
	AI_Output(other,self,"DIA_DJG_705_Angar_NW_YourFree_01_00");	//Ты свободен!
	AI_Output(self,other,"DIA_DJG_705_Angar_NW_YourFree_01_01");	//(удивленно) Ты что, перебил всех орков в городе?!
	AI_Output(other,self,"DIA_DJG_705_Angar_NW_YourFree_01_02");	//Да, именно так.
	if(COUNTCAPTURED > 1)
	{
		AI_Output(self,other,"DIA_DJG_705_Angar_NW_YourFree_01_03");	//Невероятно! Мы были уверены, что нам всем пришел конец.
		AI_Output(self,other,"DIA_DJG_705_Angar_NW_YourFree_01_04");	//Открой решетки, чтобы мы смогли выбраться отсюда.
	}
	else
	{
		AI_Output(self,other,"DIA_DJG_705_Angar_NW_YourFree_01_05");	//Невероятно! Я был уверен, что мне пришел конец.
		AI_Output(self,other,"DIA_DJG_705_Angar_NW_YourFree_01_06");	//Открой решетку, чтобы я смог выбраться отсюда.
	};
	CAPTUREDMANSISFREE = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_DJG_705_ANGAR_NW_OPENGATENOW(C_Info)
{
	npc = DJG_705_Angar_NW;
	nr = 1;
	condition = dia_djg_705_angar_nw_opengatenow_condition;
	information = dia_djg_705_angar_nw_opengatenow_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_djg_705_angar_nw_opengatenow_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (ANGARCAPTURED == TRUE) && (HORINISISFREE == TRUE) && (CAPTUREDMANSISFREE == TRUE) && (ANGARISFREE == FALSE))
	{
		return TRUE;
	};
};

func void dia_djg_705_angar_nw_opengatenow_info()
{
	AI_Output(self,other,"DIA_DJG_705_Angar_NW_OpenGateNow_01_00");	//Ну и чего ты ждешь? Выпусти меня!
	AI_StopProcessInfos(self);
};


instance DIA_ANGAR_NW_PSICAMPHOME(C_Info)
{
	npc = DJG_705_Angar_NW;
	nr = 1;
	condition = dia_angar_nw_psicamphome_condition;
	information = dia_angar_nw_psicamphome_info;
	permanent = FALSE;
	description = "Снова дома.";
};


func int dia_angar_nw_psicamphome_condition()
{
	if((REPLACEPLACESCREW == TRUE) && (ANGARCAPTURED == FALSE) && ((ANGARNOBATTLETHROUGTH == TRUE) || (ANGARBATTLETHROUGTH == TRUE)))
	{
		return TRUE;
	};
};

func void dia_angar_nw_psicamphome_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Angar_NW_PsiCampHome_01_00");	//Теперь ты снова дома.
	AI_Output(self,other,"DIA_Angar_NW_PsiCampHome_01_01");	//Да. Почти как в старые добрые времена!
	AI_Output(other,self,"DIA_Angar_NW_PsiCampHome_01_02");	//Значит, ты вновь возглавишь Круг Стражей?
	AI_Output(self,other,"DIA_Angar_NW_PsiCampHome_01_03");	//(серьезно) Нет, не сейчас. Мне надо немного отдохнуть и прийти в себя после всего произошедшего.
	AI_Output(self,other,"DIA_Angar_NW_PsiCampHome_01_04");	//Тем более, что и Гор На Кош вполне справляется с этой обязанностью.
	AI_Output(other,self,"DIA_Angar_NW_PsiCampHome_01_06");	//Понятно.
};


instance DIA_ANGAR_NW_GOONORKSHUNT(C_Info)
{
	npc = DJG_705_Angar_NW;
	nr = 1;
	condition = dia_angar_nw_goonorkshunt_condition;
	information = dia_angar_nw_goonorkshunt_info;
	permanent = FALSE;
	description = "Мне нужна твоя помощь с орками.";
};


func int dia_angar_nw_goonorkshunt_condition()
{
	if((HAGENGIVEHELP == TRUE) && (ANGARCAPTURED == FALSE) && (ALLGREATVICTORY == FALSE) && (ALLDISMISSFROMHUNT == FALSE) && (ANGARTOBIGLAND == FALSE))
	{
		return TRUE;
	};
};

func void dia_angar_nw_goonorkshunt_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Angar_NW_GoOnOrksHunt_01_00");	//Мне нужна твоя помощь с орками.
	AI_Output(self,other,"DIA_Angar_NW_GoOnOrksHunt_01_01");	//(серьезно) В таком случае я с радостью помогу тебе в этом.
	AI_Output(self,other,"DIA_Angar_NW_GoOnOrksHunt_01_02");	//В конце концов, это лучше, чем торчать целыми днями на ферме.
	AI_Output(self,other,"DIA_Angar_NW_GoOnOrksHunt_01_03");	//Только скажи, когда будешь готов.
	AI_Output(other,self,"DIA_Angar_NW_GoOnOrksHunt_01_04");	//Хорошо.
	ANGARJOINMEHUNT = TRUE;
};


instance DIA_ANGAR_NW_FOLLOWME(C_Info)
{
	npc = DJG_705_Angar_NW;
	nr = 1;
	condition = dia_angar_nw_followme_condition;
	information = dia_angar_nw_followme_info;
	permanent = TRUE;
	description = "Иди за мной!";
};


func int dia_angar_nw_followme_condition()
{
	if((ANGARJOINMEHUNT == TRUE) && (self.aivar[AIV_PARTYMEMBER] == FALSE) && (ALLDISMISSFROMHUNT == FALSE) && (ANGARTOBIGLAND == FALSE))
	{
		return TRUE;
	};
};

func void dia_angar_nw_followme_info()
{
	AI_Output(other,self,"DIA_Angar_NW_FollowMe_01_00");	//Иди за мной!
	AI_Output(self,other,"DIA_Angar_NW_FollowMe_01_01");	//Хорошо, веди.
	Npc_ExchangeRoutine(self,"Follow");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_ANGAR_NW_STOPHERE(C_Info)
{
	npc = DJG_705_Angar_NW;
	nr = 1;
	condition = dia_angar_nw_stophere_condition;
	information = dia_angar_nw_stophere_info;
	permanent = TRUE;
	description = "Жди тут!";
};


func int dia_angar_nw_stophere_condition()
{
	if((ANGARJOINMEHUNT == TRUE) && (self.aivar[AIV_PARTYMEMBER] == TRUE) && (ALLDISMISSFROMHUNT == FALSE) && (ANGARTOBIGLAND == FALSE))
	{
		return TRUE;
	};
};

func void dia_angar_nw_stophere_info()
{
	AI_Output(other,self,"DIA_Angar_NW_StopHere_01_00");	//Жди тут!
	AI_Output(self,other,"DIA_Angar_NW_StopHere_01_01");	//Как скажешь! Тогда я вновь возвращаюсь на ферму.
	Npc_ExchangeRoutine(self,"CampOn");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	AI_StopProcessInfos(self);
};


instance DIA_ANGAR_NW_ALLGREATVICTORY(C_Info)
{
	npc = DJG_705_Angar_NW;
	nr = 1;
	condition = dia_angar_nw_allgreatvictory_condition;
	information = dia_angar_nw_allgreatvictory_info;
	permanent = FALSE;
	description = "Хоринис полностью освобожден!";
};


func int dia_angar_nw_allgreatvictory_condition()
{
	if(ALLGREATVICTORY == TRUE)
	{
		return TRUE;
	};
};

func void dia_angar_nw_allgreatvictory_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Angar_NW_AllGreatVictory_01_00");	//Хоринис полностью освобожден!
	AI_Output(self,other,"DIA_Angar_NW_AllGreatVictory_01_01");	//И я очень рад этому. Теперь нам всем можно немного передохнуть.
	AI_Output(self,other,"DIA_Angar_NW_AllGreatVictory_01_02");	//Думаю, это и тебе не повредит. Последние деньки были не из легких.
};


instance DIA_ANGAR_NW_WHATDONOW(C_Info)
{
	npc = DJG_705_Angar_NW;
	nr = 1;
	condition = dia_angar_nw_whatdonow_condition;
	information = dia_angar_nw_whatdonow_info;
	permanent = FALSE;
	description = "Что будешь теперь делать?";
};


func int dia_angar_nw_whatdonow_condition()
{
	if((ALLGREATVICTORY == TRUE) && (ANGARTOBIGLAND == FALSE))
	{
		return TRUE;
	};
};

func void dia_angar_nw_whatdonow_info()
{
	AI_Output(other,self,"DIA_Angar_NW_WhatDoNow_01_00");	//Что будешь теперь делать?
	AI_Output(self,other,"DIA_Angar_NW_WhatDoNow_01_01");	//Не знаю. Я пока об этом и не думал.
	AI_Output(self,other,"DIA_Angar_NW_WhatDoNow_01_02");	//Думаю, какое-то время я поживу в нашем лагере. А потом решу, что делать дальше.
	AI_Output(other,self,"DIA_Angar_NW_WhatDoNow_01_03");	//Понятно.
};


instance DIA_ANGAR_NW_TRAVELONBIGLAND(C_Info)
{
	npc = DJG_705_Angar_NW;
	nr = 1;
	condition = dia_angar_nw_travelonbigland_condition;
	information = dia_angar_nw_travelonbigland_info;
	permanent = FALSE;
	description = "Я отплываю на материк.";
};


func int dia_angar_nw_travelonbigland_condition()
{
	if(WHOTRAVELONBIGLAND == TRUE)
	{
		return TRUE;
	};
};

func void dia_angar_nw_travelonbigland_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Angar_NW_TravelOnBigLand_01_00");	//Я отплываю на материк.
	AI_Output(other,self,"DIA_Angar_NW_TravelOnBigLand_01_01");	//Ты не хочешь отправиться вместе со мной?
	AI_Output(self,other,"DIA_Angar_NW_TravelOnBigLand_01_02");	//Хммм. Почему бы и нет.
	AI_Output(self,other,"DIA_Angar_NW_TravelOnBigLand_01_03");	//Все равно на этом острове меня больше ничего не держит.
	AI_Output(self,other,"DIA_Angar_NW_TravelOnBigLand_01_04");	//А там я, возможно, найду то, что искал всю свою жизнь.
	AI_Output(other,self,"DIA_Angar_NW_TravelOnBigLand_01_05");	//Тогда приходи в гавань. Корабль уже ждет.
	AI_Output(self,other,"DIA_Angar_NW_TravelOnBigLand_01_06");	//Хорошо. Я приду.
	COUNTTRAVELONBIGLAND = COUNTTRAVELONBIGLAND + 1;
	ANGARTOBIGLAND = TRUE;
	B_LogEntry(TOPIC_SALETOBIGLAND,"Кор Ангар поплывет вместе со мной на материк. Он полагает, что найдет там новый смысл своей жизни.");
	Npc_ExchangeRoutine(self,"SHIP");
	AI_StopProcessInfos(self);
};

