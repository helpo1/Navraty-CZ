instance DIA_Ass_184_Adept_EXIT(C_Info)
{
	npc = Ass_184_Adept;
	nr = 999;
	condition = DIA_Ass_184_Adept_exit_condition;
	information = DIA_Ass_184_Adept_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Ass_184_Adept_exit_condition()
{
	return TRUE;
};

func void DIA_Ass_184_Adept_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Ass_184_Adept_Hello(C_Info)
{
	npc = Ass_184_Adept;
	nr = 1;
	condition = DIA_Ass_184_Adept_hello_condition;
	information = DIA_Ass_184_Adept_hello_info;
	permanent = FALSE;
	important = TRUE;
};
	
func int DIA_Ass_184_Adept_hello_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};	
	
func void DIA_Ass_184_Adept_hello_info()
{
	AI_Output(self,other,"DIA_Ass_184_Adept_hello_01_01");	//А-ха. Кто у нас здесь? Еще один послушник, решивший попытать свое счастье?
	AI_Output(other,self,"DIA_Ass_184_Adept_hello_01_02");	//Что ты имеешь в виду?
	AI_Output(self,other,"DIA_Ass_184_Adept_hello_01_03");	//Как что? Разве ты пришел сюда не для того, чтобы произвести впечатление на приора Осаира?
	AI_Output(other,self,"DIA_Ass_184_Adept_hello_01_04");	//Мне это ни к чему. 
	AI_Output(self,other,"DIA_Ass_184_Adept_hello_01_05");	//Это почему же?
	AI_Output(other,self,"DIA_Ass_184_Adept_hello_01_06");	//Я уже работал на мастера Осаира, за что и был возведен в ранг его мюрида.
	AI_Output(self,other,"DIA_Ass_184_Adept_hello_01_07");	//(удрученно) Что? Так значит, ты его мюрид?

	if(PlayerIsAssNow == TRUE)
	{
		AI_Output(other,self,"DIA_Ass_184_Adept_hello_01_08");	//Ты что, слепой? Разве не видно, что я уже посвящен в Тени Братства?
		AI_Output(self,other,"DIA_Ass_184_Adept_hello_01_09");	//Прошу простить меня, брат. Просто я очень сильно расстроился, узнав о том, что у приора Осаира уже есть мюрид.
		AI_Output(other,self,"DIA_Ass_184_Adept_hello_01_10");	//А ты, значит, хотел бы им стать?
	}
	else
	{
		AI_Output(other,self,"DIA_Ass_184_Adept_hello_01_11");	//Да, ты прав. Но скоро я буду принят в касту Теней Братства.
		AI_Output(other,self,"DIA_Ass_184_Adept_hello_01_12");	//Так что у тебя еще есть шанс стать им.
	};

	AI_Output(self,other,"DIA_Ass_184_Adept_hello_01_13");	//О! Я бы все отдал за это. Лишь бы мне только предоставили такой шанс.
	AI_Output(other,self,"DIA_Ass_184_Adept_hello_01_14");	//Возможно, я бы мог тебе в этом помочь. 
	AI_Output(self,other,"DIA_Ass_184_Adept_hello_01_15");	//Интересно, как?
	AI_Output(other,self,"DIA_Ass_184_Adept_hello_01_16");	//Ну, допустим, я знаю, как можно произвести впечатление на приора Осаира.
	AI_Output(self,other,"DIA_Ass_184_Adept_hello_01_17");	//И как же?
	AI_Output(other,self,"DIA_Ass_184_Adept_hello_01_18");	//Принеси ему шкуру какого-нибудь очень редкого зверя.
	AI_Output(other,self,"DIA_Ass_184_Adept_hello_01_19");	//Насколько я знаю, мастер Осаир очень любит подобные вещи.
	AI_Output(other,self,"DIA_Ass_184_Adept_hello_01_20");	//Только это должна быть по-настоящему хорошая шкура, а не какая-нибудь дешевка.
	AI_Output(other,self,"DIA_Ass_184_Adept_hello_01_21");	//Если сделаешь все правильно - считай, что одной ногой ты уже в ранге его мюрида.
	AI_Output(self,other,"DIA_Ass_184_Adept_hello_01_22");	//Понимаю. Вот только где мне достать такую шкуру?
	AI_Output(other,self,"DIA_Ass_184_Adept_hello_01_23");	//Тут уже я тебе не помощник. Купи ее у кого-нибудь или выменяй.
	AI_Output(self,other,"DIA_Ass_184_Adept_hello_01_24");	//Ладно, я все понял и постараюсь сделать все в точности, как ты сказал.
	TiamantNeedsSlaves = TRUE;
	B_LogEntry(TOPIC_Intriges,"В пещере Осаира я повстречал послушника Хоакина, который мечтает стать его мюридом. Я решил помочь ему советом, как можно обратить на себя внимание приора. И, если все получится, будущий мюрид Осаира будет передо мной в долгу.");
	AI_StopProcessInfos(self);
};

instance DIA_Ass_184_Adept_HelpWithAssair(C_Info)
{
	npc = Ass_184_Adept;
	nr = 1;
	condition = dia_Ass_184_Adept_HelpWithAssair_condition;
	information = dia_Ass_184_Adept_HelpWithAssair_info;
	permanent = FALSE;
	description = "Как твои успехи?";
};

func int dia_Ass_184_Adept_HelpWithAssair_condition()
{
	if(TiamantSendsToOsair == TRUE)
	{
		return TRUE;
	};
};

func void dia_Ass_184_Adept_HelpWithAssair_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Ass_184_Adept_HelpWithAssair_01_01");	//Как твои успехи?
	AI_Output(self,other,"DIA_Ass_184_Adept_HelpWithAssair_01_02");	//Лучше и не бывает. Как ты и говорил, мастер Осаир по достоинству оценил мое подношение.
	AI_Output(self,other,"DIA_Ass_184_Adept_HelpWithAssair_01_03");	//Так что теперь я у него в роли подручного. 
	AI_Output(other,self,"DIA_Ass_184_Adept_HelpWithAssair_01_04");	//Да, вижу, что ты не упустил свой шанс.
};

instance DIA_Ass_184_Adept_GiveLetter(C_Info)
{
	npc = Ass_184_Adept;
	nr = 1;
	condition = dia_Ass_184_Adept_GiveLetter_condition;
	information = dia_Ass_184_Adept_GiveLetter_info;
	permanent = FALSE;
	description = "Что ты здесь делаешь?";
};

func int dia_Ass_184_Adept_GiveLetter_condition()
{
	if(MIS_PW_GOLDSHAHT == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_Ass_184_Adept_GiveLetter_info()
{
	AI_Output(other,self,"DIA_Ass_184_Adept_GiveLetter_01_01");	//Что ты здесь делаешь?
	AI_Output(other,self,"DIA_Ass_184_Adept_GiveLetter_01_02");	//Разве ты не должен быть сейчас на пути к храму, чтобы передать письмо приору Тиаманту?
	AI_Output(self,other,"DIA_Ass_184_Adept_GiveLetter_01_03");	//Так оно и есть...(замялся) Просто я решил здесь немного помолиться.
	AI_Output(other,self,"DIA_Ass_184_Adept_GiveLetter_01_04");	//Это и так понятно. Но если Осаир об этом узнает, он с тебя шкуру живьем сдерет.
	AI_Output(self,other,"DIA_Ass_184_Adept_GiveLetter_01_05");	//(нервно) Да, ты прав. Я немедленно отправляюсь в храм.
	AI_Output(other,self,"DIA_Ass_184_Adept_GiveLetter_01_06");	//Постой! То письмо для приора Тиаманта, оно у тебя с собой?
	AI_Output(self,other,"DIA_Ass_184_Adept_GiveLetter_01_07");	//Да, оно у меня. А почему ты спрашиваешь?
	AI_Output(other,self,"DIA_Ass_184_Adept_GiveLetter_01_08");	//Дай мне его прочесть.
	AI_Output(self,other,"DIA_Ass_184_Adept_GiveLetter_01_09");	//Что? Но я... я не могу этого сделать!
	Info_ClearChoices(DIA_Ass_184_Adept_GiveLetter);
	Info_AddChoice(DIA_Ass_184_Adept_GiveLetter,"Отдай мне письмо или я убью тебя!",DIA_Ass_184_Adept_GiveLetter_M1);
	Info_AddChoice(DIA_Ass_184_Adept_GiveLetter,"Тогда, полагаю, Осаиру будет интересно кое-что узнать про тебя.",DIA_Ass_184_Adept_GiveLetter_M2);
	Info_AddChoice(DIA_Ass_184_Adept_GiveLetter,"Не волнуйся. Никто об этом не узнает.",DIA_Ass_184_Adept_GiveLetter_M3);
};


func void DIA_Ass_184_Adept_GiveLetter_M1()
{
	CreateInvItems(self,ItWr_OsaitToTiamant,1);
	AI_Output(other,self,"DIA_Ass_184_Adept_GiveLetter_M1_01_01");	//Отдай мне письмо или я убью тебя!
	AI_Output(self,other,"DIA_Ass_184_Adept_GiveLetter_M1_01_02");	//Послушай, тебе не запугать меня! Я все равно не отдам его.
	AI_Output(other,self,"DIA_Ass_184_Adept_GiveLetter_M1_01_03");	//Ну как хочешь. Ты сам напросился.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};

func void DIA_Ass_184_Adept_GiveLetter_M2()
{
	AI_Output(other,self,"DIA_Ass_184_Adept_GiveLetter_M2_01_01");	//Тогда, полагаю, Осаиру будет интересно кое-что узнать про тебя.
	AI_Output(other,self,"DIA_Ass_184_Adept_GiveLetter_M2_01_02");	//И тогда тебе точно не поздоровится!
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_Ass_184_Adept_GiveLetter_M2_01_03");	//Белиар бы тебя побрал! Ладно. Вот, возьми его.
	AI_Output(other,self,"DIA_Ass_184_Adept_GiveLetter_M2_01_04");	//Да не переживай ты так. Прочитаю и сразу же верну обратно.
	B_GiveInvItems(self,other,ItWr_OsaitToTiamant,1);
	B_HeroUseFakeScroll();
	AI_Output(other,self,"DIA_Ass_184_Adept_GiveLetter_M2_01_05");	//Вот и все! А ты боялся.
	B_GiveInvItems(other,self,ItWr_OsaitToTiamant,1);
	AI_Output(self,other,"DIA_Ass_184_Adept_GiveLetter_M2_01_06");	//Надеюсь, что это все останется между нами. Иначе Осаир лично снесет мне мою голову.
	AI_Output(other,self,"DIA_Ass_184_Adept_GiveLetter_M2_01_07");	//Само собой. Теперь немедленно отправляйся в храм. А после я жду тебя в пещере у Осаира.
	AI_Output(self,other,"DIA_Ass_184_Adept_GiveLetter_M2_01_08");	//(недоверчиво) Это еще зачем?
	AI_Output(other,self,"DIA_Ass_184_Adept_GiveLetter_M2_01_09");	//Приор приказал отвести тебя и еще нескольких рабов в золотой рудник, который недавно обнаружили в подгорном проходе.
	AI_Output(other,self,"DIA_Ass_184_Adept_GiveLetter_M2_01_10");	//Так что не стоит затягивать с этим.
	AI_Output(self,other,"DIA_Ass_184_Adept_GiveLetter_M2_01_11");	//Хорошо, встретимся там.
	B_LogEntry(TOPIC_Intriges,"Судя по тексту из письма, Осаир крайне недоволен Тиамантом. Уверен, что Ханиару будет интересно об этом узнать.");
	KnowOsairToTiamant = TRUE;
	TiamantNeedsSlaves = TRUE;
	AI_StopProcessInfos(self);
	B_StartOtherRoutine(Ass_184_Adept,"Tiamant");
};

func void DIA_Ass_184_Adept_GiveLetter_M3()
{
	AI_Output(other,self,"DIA_Ass_184_Adept_GiveLetter_M3_01_01");	//Не волнуйся. Никто об этом не узнает.
	AI_Output(self,other,"DIA_Ass_184_Adept_GiveLetter_M3_01_02");	//Нет, это слишком рискованно.
	AI_Output(self,other,"DIA_Ass_184_Adept_GiveLetter_M3_01_03");	//Да и кто ты такой, чтобы читать переписку приоров?
};

instance DIA_Ass_184_Adept_GoShaht(C_Info)
{
	npc = Ass_184_Adept;
	nr = 1;
	condition = dia_Ass_184_Adept_GoShaht_condition;
	information = dia_Ass_184_Adept_GoShaht_info;
	permanent = FALSE;
	description = "Пора отправляться в путь.";
};

func int dia_Ass_184_Adept_GoShaht_condition()
{
	if((HaniarBlameTiamant == TRUE) && (HoakinIsDead == FALSE))
	{
		return TRUE;
	};
};

func void dia_Ass_184_Adept_GoShaht_info()
{
	var C_Npc Slave_01;
	var C_Npc Slave_02;

	Slave_01 = Hlp_GetNpc(SEK_186_SLAVEOBSSEK);
	Slave_02 = Hlp_GetNpc(SEK_387_SLAVEOBSSEK);

	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Slave_01.aivar[AIV_PARTYMEMBER] = TRUE;
	Slave_02.aivar[AIV_PARTYMEMBER] = TRUE;

	AI_Output(other,self,"DIA_Ass_184_Adept_GoShaht_01_01");	//Пора отправляться в путь. Рабы готовы?
	AI_Output(self,other,"DIA_Ass_184_Adept_GoShaht_01_02");	//Да, все в порядке. Я уже отобрал парочку покрепче.
	AI_Output(other,self,"DIA_Ass_184_Adept_GoShaht_01_03");	//Тогда веди их за мной, и смотри не отставай.
	AI_Output(self,other,"DIA_Ass_184_Adept_GoShaht_01_04");	//Само собой.
	MIS_PW_FollowGoldOre = LOG_Running;
	Log_CreateTopic(TOPIC_PW_FollowGoldOre,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PW_FollowGoldOre,LOG_Running);
	B_LogEntry(TOPIC_PW_FollowGoldOre,"По распоряжению приора Осаира, мне необходимо отвести Хоакина и рабов в золотой рудник.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(Ass_184_Adept,"FollowGoldOre");
	Npc_ExchangeRoutine(SEK_186_SLAVEOBSSEK,"FollowGoldOre");
	Npc_ExchangeRoutine(SEK_387_SLAVEOBSSEK,"FollowGoldOre");
	Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_GOLDOREWAY_01");
	Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_GOLDOREWAY_02");
	Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_GOLDOREWAY_03");
	Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_GOLDOREWAY_04");
	Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_GOLDOREWAY_05");
	Wld_InsertNpc(Gobbo_Black,"FP_ROAM_GOLDOREWAY_06");
	Wld_InsertNpc(Gobbo_Black,"FP_ROAM_GOLDOREWAY_07");
	Wld_InsertNpc(Gobbo_Black,"FP_ROAM_GOLDOREWAY_08");
	Wld_InsertNpc(Gobbo_Black,"FP_ROAM_GOLDOREWAY_09");
	Wld_InsertNpc(Gobbo_Black,"FP_ROAM_GOLDOREWAY_10");
	Wld_InsertNpc(Gobbo_Black,"FP_ROAM_GOLDOREWAY_11");
	Wld_InsertNpc(OreBug,"FP_ROAM_GOLDOREWAY_12");
	Wld_InsertNpc(OreBug,"FP_ROAM_GOLDOREWAY_13");
};

instance DIA_Ass_184_Adept_GoShaht_Done(C_Info)
{
	npc = Ass_184_Adept;
	nr = 1;
	condition = DIA_Ass_184_Adept_GoShaht_Done_condition;
	information = DIA_Ass_184_Adept_GoShaht_Done_info;
	permanent = FALSE;
	description = "Мы на месте.";
};
	
func int DIA_Ass_184_Adept_GoShaht_Done_condition()
{
	if((MIS_PW_FollowGoldOre == LOG_Running) && (Npc_GetDistToWP(self,"PW_GOLD_CAVEORE_GUARD_03") <= 750))
	{
		return TRUE;
	};
};	
	
func void DIA_Ass_184_Adept_GoShaht_Done_info()
{
	var C_Npc Hoakin;
	var C_Npc Slave_01;
	var C_Npc Slave_02;
	var int XP_Count;

	Hoakin = Hlp_GetNpc(Ass_184_Adept);
	Slave_01 = Hlp_GetNpc(SEK_186_SLAVEOBSSEK);
	Slave_02 = Hlp_GetNpc(SEK_387_SLAVEOBSSEK);

	if(HoakinIsDead == FALSE)
	{
		XP_Count = XP_Count + 1;
		Hoakin.aivar[AIV_PARTYMEMBER] = FALSE;
	};
	if(GoldSlave_01_IsDead == FALSE)
	{
		XP_Count = XP_Count + 1;
		Slave_01.aivar[AIV_PARTYMEMBER] = FALSE;
	};
	if(GoldSlave_02_IsDead == FALSE)
	{
		XP_Count = XP_Count + 1;
		Slave_02.aivar[AIV_PARTYMEMBER] = FALSE;
	};
	XP_Count = 500 + (XP_Count * 500);
	B_GivePlayerXP(XP_Count);
	AI_Output(other,self,"DIA_Ass_184_Adept_GoShaht_Done_01_00");	//Мы на месте.
	AI_Output(self,other,"DIA_Ass_184_Adept_GoShaht_Done_01_01");	//Благодарю, что проводил нас.
	AI_Output(self,other,"DIA_Ass_184_Adept_GoShaht_Done_01_02");	//Правда, тут такое опасное место! Думаю, что тебе стоит остаться здесь до прибытия охраны.
	OsairWarriorWait = TRUE;
	B_LogEntry(TOPIC_PW_FollowGoldOre,"Я привел рабов в шахту. Теперь надо дождаться людей Осаира, а после доложиться об этом ему самому. Думаю, не стоит бросать рабов и этого послушника. Если они погибнут до прихода охраны шахты, это будет только моя вина. И тогда мне точно не поздоровится.");
	AI_StopProcessInfos(self);
	B_StartOtherRoutine(SEK_387_SLAVEOBSSEK,"GoldOre");
	B_StartOtherRoutine(SEK_186_SLAVEOBSSEK,"GoldOre");
	B_StartOtherRoutine(Ass_184_Adept,"GoldOre");
};