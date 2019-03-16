
instance DIA_Bosper_EXIT(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 999;
	condition = DIA_Bosper_EXIT_Condition;
	information = DIA_Bosper_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bosper_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Bosper_EXIT_Info()
{
	Value_Pfeil = 5;
	Value_Bolzen = 10;
	AI_StopProcessInfos(self);
};

var int FirstTalkBosper;

instance DIA_Bosper_NoTalkAtAll(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 1;
	condition = DIA_Bosper_NoTalkAtAll_Condition;
	information = DIA_Bosper_NoTalkAtAll_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Bosper_NoTalkAtAll_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (CanTeachTownMaster == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bosper_NoTalkAtAll_Info()
{
	if(FirstTalkBosper == FALSE)
	{
		AI_Output(self,other,"DIA_Bosper_NoTalkAtAll_12_00");	//Чего тебе здесь надо, а?
		AI_Output(self,other,"DIA_Bosper_NoTalkAtAll_12_01");	//Тебе нечего здесь делать. Прочь отсюда!
		FirstTalkBosper = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_NoTalkAtAll_12_03");	//Я сказал, вон!
		AI_StopProcessInfos(self);
	};
};

instance DIA_Bosper_HALLO(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 2;
	condition = DIA_Bosper_HALLO_Condition;
	information = DIA_Bosper_HALLO_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Bosper_HALLO_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (CanTeachTownMaster == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Bosper_HALLO_Info()
{
	if(Wld_IsTime(14,0,16,0) == FALSE)
	{
		AI_Output(self,other,"DIA_Bosper_HALLO_11_00");	//Добро пожаловать в мою лавку, чужеземец!
	};

	AI_Output(self,other,"DIA_Bosper_HALLO_11_01");	//Я Боспер! Я делаю луки и торгую шкурами.
	AI_Output(self,other,"DIA_Bosper_HALLO_11_02");	//Что привело тебя в Хоринис?
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,"Боспер делает луки и торгует шкурами. Его лавка находится у восточных ворот, в нижней части города.");
};


instance DIA_Bosper_IntoOV(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 1;
	condition = DIA_Bosper_IntoOV_Condition;
	information = DIA_Bosper_IntoOV_Info;
	permanent = FALSE;
	description = "Мне нужно попасть в верхний квартал...";
};


func int DIA_Bosper_IntoOV_Condition()
{
	if((hero.guild == GIL_NONE) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Bosper_IntoOV_Info()
{
	AI_Output(other,self,"DIA_Bosper_IntoOV_15_00");	//Мне нужно попасть в верхний квартал...
	AI_Output(self,other,"DIA_Bosper_IntoOV_11_01");	//Где живут паладины? Забудь об этом.
	AI_Output(self,other,"DIA_Bosper_IntoOV_11_02");	//Тебе нужно быть уважаемым гражданином или, хотя бы, иметь приличную работу.
	AI_Output(self,other,"DIA_Bosper_IntoOV_11_03");	//А чужаку вроде тебя ни за что туда не попасть.
	if(Torwache_305.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output(other,self,"DIA_Bosper_IntoOV_15_04");	//Я это заметил...
	};
	Log_CreateTopic(TOPIC_OV,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OV,LOG_Running);
	B_LogEntry(TOPIC_OV,"Чтобы попасть в верхний квартал, я либо должен стать уважаемым гражданином, либо получить работу.");
};


instance DIA_Bosper_SeekWork(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 2;
	condition = DIA_Bosper_SeekWork_Condition;
	information = DIA_Bosper_SeekWork_Info;
	permanent = FALSE;
	description = "Я ищу работу!";
};


func int DIA_Bosper_SeekWork_Condition()
{
	return TRUE;
};

func void DIA_Bosper_SeekWork_Info()
{
	AI_Output(other,self,"DIA_Bosper_SeekWork_15_00");	//Я ищу работу!
	AI_Output(self,other,"DIA_Bosper_SeekWork_11_01");	//Ммм...(задумчиво) Мне не помешал бы новый ученик.
	AI_Output(self,other,"DIA_Bosper_SeekWork_11_02");	//Последний, что у меня был, бросил свою работу пару дней назад.
	AI_Output(self,other,"DIA_Bosper_SeekWork_11_03");	//Ты что-нибудь знаешь об охоте, а?

	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		AI_Output(other,self,"DIA_Bosper_SeekWork_15_04");	//Нуууу...
		AI_Output(self,other,"DIA_Bosper_SeekWork_11_05");	//Я мог бы научить тебя снимать шкуры с животных.
		AI_Output(self,other,"DIA_Bosper_SeekWork_11_06");	//Я буду хорошо платить тебе за каждую шкуру, что ты принесешь мне.
	}
	else
	{
		AI_Output(other,self,"DIA_Bosper_SeekWork_15_07");	//Я могу дать тебе несколько шкур, если ты это имел в виду.
		AI_Output(self,other,"DIA_Bosper_SeekWork_11_08");	//Превосходно! Приноси мне все шкуры, что тебе удастся добыть - я куплю их у тебя по очень хорошей цене.
	};
	B_LogEntry(TOPIC_Lehrling,"Боспер ищет нового ученика. Я могу начать работать у него.");
};


var int Bosper_HintToJob;
var int Bosper_StartGuild;

instance DIA_Bosper_LEHRLING(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 2;
	condition = DIA_Bosper_LEHRLING_Condition;
	information = DIA_Bosper_LEHRLING_Info;
	permanent = TRUE;
	description = "Я хочу стать твоим учеником!";
};

func int DIA_Bosper_LEHRLING_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bosper_SeekWork) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Bosper_LEHRLING_Info()
{
	var int stimmen;
	stimmen = 0;
	AI_Output(other,self,"DIA_Bosper_LEHRLING_15_00");	//Я хочу стать твоим учеником!
	if(MIS_Bosper_WolfFurs == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Bosper_LEHRLING_11_01");	//(ухмыляется) Отлично! Похоже, ты уже знаешь основы.
		stimmen = stimmen + 1;
		if(Harad.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if((MIS_Harad_Orc == LOG_SUCCESS) || (MIS_HakonBandits == LOG_SUCCESS))
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_02");	//Харад считает, что ты хороший человек.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_03");	//Но Харад пока не уверен в твоих способностях.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_04");	//Но Харад говорит, что никогда не видел тебя.
		};
		if(Thorben.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if(MIS_Thorben_GetBlessings == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_05");	//Торбен дает тебе свое благословение. Я не так набожен, как он, но все же это хорошо.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_06");	//Торбен даст тебе свое одобрение только с благословения богов.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_07");	//Торбен понятия не имеет, кто ты такой.
		};
		if(Constantino.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_08");	//Константино говорит, что ты можешь стать учеником кого захочешь.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_09");	//Константино говорит, что ты обвиняешься в преступлении в городе - надеюсь, это какая-нибудь ерунда?
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_10");	//Позаботься, чтобы этот вопрос был улажен.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_11");	//Константино никогда даже не слышал о тебе.
		};
		if(Matteo.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if(MIS_Matteo_Gold == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_12");	//Маттео говорит, что ты стоишь столько же, сколько золото равное твоему весу.
				stimmen = stimmen + 1;
			}
			else if(MIS_Matteo_Gold == LOG_Running)
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_13");	//Маттео упомянул о каких-то долгах - я не знаю, что он имеет в виду, но тебе лучше поговорить с ним.
			}
			else
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_14");	//Маттео говорит, что еще не говорил с тобой об этом.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_15");	//Маттео говорит, что никогда не видел тебя.
		};
		if(stimmen >= 4)
		{
			if(stimmen == 5)
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_16");	//Это означает, что ты получил одобрение всех мастеров!
			}
			else
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_17");	//Ты получил одобрение четырех мастеров. Этого достаточно, чтобы быть принятым в ученики.
			};
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_18");	//Ты можешь начать работать на меня когда только захочешь.
			Info_ClearChoices(DIA_Bosper_LEHRLING);
			Info_AddChoice(DIA_Bosper_LEHRLING,"Хорошо, я подумаю над этим.",DIA_Bosper_LEHRLING_Later);
			Info_AddChoice(DIA_Bosper_LEHRLING,"Я готов стать твоим учеником.",DIA_Bosper_LEHRLING_OK);
		}
		else
		{
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_19");	//Тебе нужно получить одобрение хотя бы четырех мастеров. Без этого ты не сможешь стать учеником в нижней части города.
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_20");	//Это означает, что ты должен поговорить со всеми, кто еще сомневается в тебе.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_LEHRLING_11_21");	//Прежде чем взять тебя к себе, я должен сначала понять, годен ли ты вообще хоть на что-то.
		if(MIS_Bosper_Bogen == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_22");	//Ты вернул назад мой лук, но это ничего не говорит о твоем таланте охотника.
		};
		Bosper_HintToJob = TRUE;
	};
};

func void DIA_Bosper_LEHRLING_OK()
{
	AI_Output(other,self,"DIA_Bosper_LEHRLING_OK_15_00");	//Я готов стать твоим учеником.
	AI_Output(self,other,"DIA_Bosper_LEHRLING_OK_11_01");	//Ты не пожалеешь об этом! Думаю, мы сработаемся.
	AI_Output(self,other,"DIA_Bosper_LEHRLING_OK_11_02");	//Ах да, чуть не забыл. Вот - возьми этот доспех! Он надежно защитит тебя, когда ты пойдешь на охоту.
	B_GiveInvItems(self,other,ITAR_Leather_L,1);
	AI_Output(self,other,"DIA_Bosper_LEHRLING_OK_11_03");	//И этот лук!
	B_GiveInvItems(self,other,itrw_bospbow_l_03,1);
	AI_Output(self,other,"DIA_Bosper_LEHRLING_OK_11_04");	//И чтобы ты мог им правильно пользоваться - я научу тебя паре новых трюков.
	B_RaiseAttribute_Bonus_Many(other,ATR_DEXTERITY,5);
	B_RaiseFightTalent_Bonus(other,NPC_TALENT_BOW,5);
	AI_Print(PRINT_BOSPERBONUS);
	Player_IsApprentice = APP_Bosper;
	Npc_ExchangeRoutine(Lothar,"START");
	Bosper_StartGuild = other.guild;
	Bosper_Lehrling_Day = Wld_GetDay();
	Wld_AssignRoomToGuild("gritta",GIL_NONE);
	MIS_Apprentice = LOG_SUCCESS;
	B_GivePlayerXP(XP_Lehrling);
	Log_CreateTopic(Topic_Bonus,LOG_NOTE);
	B_LogEntry(Topic_Bonus,"Боспер взял меня к себе в ученики. Теперь я имею доступ в верхний район города. ");
	Info_ClearChoices(DIA_Bosper_LEHRLING);
};

func void DIA_Bosper_LEHRLING_Later()
{
	AI_Output(other,self,"DIA_Bosper_LEHRLING_Later_15_00");	//Хорошо, я подумаю над этим.
	AI_Output(self,other,"DIA_Bosper_LEHRLING_Later_11_01");	//Смотри, не прими ошибочного решения! Ты лучше всего подходишь именно для моей работы.
	Info_ClearChoices(DIA_Bosper_LEHRLING);
};

var int Bosper_LeatherBought;

instance DIA_Bosper_LEATHER(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 850;
	condition = DIA_Bosper_LEATHER_Condition;
	information = DIA_Bosper_LEATHER_Info;
	permanent = TRUE;
	description = "Купить тяжелый кожаный доспех. (Цена: 500 монет)";
};

func int DIA_Bosper_LEATHER_Condition()
{
	if((Player_IsApprentice == APP_Bosper) && (Bosper_LeatherBought == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bosper_LEATHER_Info()
{
	AI_Output(other,self,"DIA_Bosper_LEATHER_01_00");	//Продай мне тяжелый кожаный доспех.

	if(B_GiveInvItems(other,self,ItMi_Gold,500))
	{
		AI_Output(self,other,"DIA_Bosper_LEATHER_01_01");	//Как скажешь! Вот, держи. Он тебе понравится!
		B_GiveInvItems(self,other,ITAR_Leather_M,1);
		Bosper_LeatherBought = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_LEATHER_01_02");	//У тебя недостаточно золота, приятель.
	};
};

instance DIA_Bosper_OtherMasters(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 3;
	condition = DIA_Bosper_OtherMasters_Condition;
	information = DIA_Bosper_OtherMasters_Info;
	permanent = FALSE;
	description = "А что если я захочу поступить в ученики к другому мастеру?";
};

func int DIA_Bosper_OtherMasters_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bosper_SeekWork) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Bosper_OtherMasters_Info()
{
	AI_Output(other,self,"DIA_Bosper_OtherMasters_15_00");	//А что если я захочу поступить в ученики к другому мастеру?
	AI_Output(self,other,"DIA_Bosper_OtherMasters_11_01");	//Бред!
	AI_Output(self,other,"DIA_Bosper_OtherMasters_11_02");	//Харад и Маттео уже имеют учеников.
	AI_Output(self,other,"DIA_Bosper_OtherMasters_11_03");	//Алхимик Константино - одиночка! У него не было ученика уже многие годы.
	AI_Output(self,other,"DIA_Bosper_OtherMasters_11_04");	//А что касается Торбена - все знают, что он слишком беден. Он, вероятно, даже не сможет платить тебе.
	AI_Output(self,other,"DIA_Bosper_OtherMasters_11_05");	//А мне вот, например, очень нужен ученик. И плачу я хорошо.
	AI_Output(self,other,"DIA_Bosper_OtherMasters_11_06");	//Но не важно, чьим учеником ты хочешь стать - тебе понадобится одобрение всех мастеров из нижней части города...
};

instance DIA_Bosper_Bartok(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 4;
	condition = DIA_Bosper_Bartok_Condition;
	information = DIA_Bosper_Bartok_Info;
	permanent = FALSE;
	description = "А почему твой ученик бросил работу?";
};

func int DIA_Bosper_Bartok_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bosper_SeekWork))
	{
		return TRUE;
	};
};

func void DIA_Bosper_Bartok_Info()
{
	AI_Output(other,self,"DIA_Bosper_Bartok_15_00");	//А почему твой ученик бросил работу?
	AI_Output(self,other,"DIA_Bosper_Bartok_11_01");	//Как он сказал, последнее время охотиться стало слишком опасно.
	AI_Output(self,other,"DIA_Bosper_Bartok_11_02");	//Если тебе это действительно интересно, ты можешь спросить его об этом сам.
	AI_Output(self,other,"DIA_Bosper_Bartok_11_03");	//Его зовут Барток. Он, вероятно, ошивается где-то у таверны Корагона.
	AI_Output(self,other,"DIA_Bosper_Bartok_11_04");	//Пройди через подземный проход у кузницы и окажешься прямо перед ним.
};

instance DIA_Bosper_ZUSTIMMUNG(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 3;
	condition = DIA_Bosper_ZUSTIMMUNG_Condition;
	information = DIA_Bosper_ZUSTIMMUNG_Info;
	permanent = TRUE;
	description = "Я получу твое одобрение на работу с другим мастером?";
};

func int DIA_Bosper_ZUSTIMMUNG_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bosper_OtherMasters) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

var int Bosper_Zustimmung_Once;

func void DIA_Bosper_ZUSTIMMUNG_Info()
{
	AI_Output(other,self,"DIA_Bosper_ZUSTIMMUNG_15_00");	//Я получу твое одобрение на работу с другим мастером?
	if((MIS_Bosper_Bogen == LOG_SUCCESS) || (MIS_Bosper_WolfFurs == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_01");	//(разочарованно) Я надеялся, что ты выберешь меня.
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_02");	//Но если ты решил так...
		AI_Output(other,self,"DIA_Bosper_ZUSTIMMUNG_15_03");	//Это означает, что ты проголосуешь за меня?
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_04");	//Если никто больше из мастеров не будет возражать - то да.
		if(MIS_Bosper_Bogen == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_05");	//Ты ведь все же вернул назад мой лук.
		};
		if(MIS_Bosper_WolfFurs == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_06");	//Но из тебя бы получился такой хороший охотник!
		};
		if(Bosper_Zustimmung_Once == FALSE)
		{
			B_GivePlayerXP(XP_Zustimmung);
			Bosper_Zustimmung_Once = TRUE;
			B_LogEntry(TOPIC_Lehrling,"Боспер даст свое согласие, если я захочу стать учеником у другого мастера.");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_07");	//(вздыхает) Хорошо! Ты получишь мое одобрение - но при одном условии.
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_08");	//Поработай на меня, хотя бы недолго.
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_09");	//Таким образом, ты сможешь понять, нравится тебе мое ремесло или нет.
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_10");	//И кто знает - может это тебе так понравится, что ты останешься со мной.
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_11");	//Если ты достаточно хорош, чтобы стать МОИМ учеником, то ты также подойдешь и другим мастерам.
		Bosper_HintToJob = TRUE;
	};
};

instance DIA_Bosper_Job(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 2;
	condition = DIA_Bosper_Job_Condition;
	information = DIA_Bosper_Job_Info;
	permanent = FALSE;
	description = "Что ты хочешь, чтобы я сделал для тебя?";
};

func int DIA_Bosper_Job_Condition()
{
	if(Bosper_HintToJob == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Bosper_Job_Info()
{
	AI_Output(other,self,"DIA_Bosper_Job_15_00");	//Что ты хочешь, чтобы я сделал для тебя?
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		AI_Output(self,other,"DIA_Bosper_Job_11_01");	//Я научу тебя снимать шкуры с животных, и ты принесешь мне - скажем - полдюжины волчьих шкур.
		Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
		B_LogEntry(TOPIC_CityTeacher,"Боспер может обучить меня снимать шкуры с животных.");
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_Job_11_02");	//Принеси мне полдюжины волчьих шкур.
	};
	AI_Output(self,other,"DIA_Bosper_Job_11_03");	//Тогда я пойму, что ты освоил это ремесло.
	AI_Output(self,other,"DIA_Bosper_Job_11_04");	//Если только у тебя не уйдет на это целая вечность, и если шкуры будут в приемлемом состоянии. И тогда я возьму тебя к себе, если ты захочешь.
	if(Npc_KnowsInfo(other,DIA_Bosper_OtherMasters))
	{
		AI_Output(self,other,"DIA_Bosper_Job_11_05");	//Или (вздыхает) ты сможешь стать учеником другого мастера - если ты этого действительно хочешь.
	};
	MIS_Bosper_WolfFurs = LOG_Running;
	Log_CreateTopic(TOPIC_BosperWolf,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BosperWolf,LOG_Running);
	B_LogEntry(TOPIC_BosperWolf,"Я должен принести Босперу шесть волчьих шкур. Тогда я смогу либо работать на него, либо получу его одобрение на работу с другими мастерами.");
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		B_LogEntry(TOPIC_BosperWolf,"Я должен попросить его обучить меня снимать шкуры с животных.");
	};
};


instance DIA_Bosper_BringFur(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 102;
	condition = DIA_Bosper_BringFur_Condition;
	information = DIA_Bosper_BringFur_Info;
	permanent = TRUE;
	description = "Насчет волчьих шкур...";
};


func int DIA_Bosper_BringFur_Condition()
{
	if(MIS_Bosper_WolfFurs == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Bosper_BringFur_Info()
{
	AI_Output(other,self,"DIA_Bosper_BringFur_15_00");	//Насчет волчьих шкур...

	if(Player_IsApprentice > APP_NONE)
	{
		AI_Output(self,other,"DIA_Bosper_BringFur_11_01");	//Ты уже стал учеником другого мастера. Я буду покупать у тебя шкуры по обычной цене.
		MIS_Bosper_WolfFurs = LOG_OBSOLETE;
		return;
	};
	if(B_GiveInvItems(other,self,ItAt_WolfFur,6))
	{
		B_GivePlayerXP(XP_Bosper_Bogen);
		AI_Output(other,self,"DIA_Bosper_BringFur_15_02");	//Я принес их - вот.
		AI_Output(self,other,"DIA_Bosper_BringFur_11_03");	//Отлично! Я знал, что ты подходишь для этой работы.
		AI_Output(self,other,"DIA_Bosper_BringFur_11_04");	//Вот деньги, как я и обещал тебе.
		B_GiveInvItems(self,other,ItMi_Gold,Value_WolfFur * 3);
		AI_Output(self,other,"DIA_Bosper_BringFur_11_05");	//И? Что скажешь? Разве это не лучше, чем корпеть над мечами день напролет или наполнять бутылочки в пыльной каморке?
		MIS_Bosper_WolfFurs = LOG_SUCCESS;
		B_LogEntry(TOPIC_Lehrling,"Боспер примет меня в ученики, если другие мастера не будут против.");
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_BringFur_11_06");	//Мы договорились на полдюжины - но у тебя еще есть время. Иди и добудь эти шкуры.
	};
};

instance DIA_Bosper_TeachFUR(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 2;
	condition = DIA_Bosper_TeachFUR_Condition;
	information = DIA_Bosper_TeachFUR_Info;
	permanent = TRUE;
	description = "Научи меня снимать шкуры с животных.";
};

func int DIA_Bosper_TeachFUR_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bosper_Job) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bosper_TeachFUR_Info()
{
	AI_Output(other,self,"DIA_Bosper_TeachFUR_15_00");	//Научи меня снимать шкуры с животных.
	Info_ClearChoices(DIA_Bosper_TeachFUR);
	Info_AddChoice(DIA_Bosper_TeachFUR,Dialog_Back,DIA_Bosper_TeachFUR_Back);
	Info_AddChoice(DIA_Bosper_TeachFUR,b_buildlearnstringforsmithhunt("Содрать шкуру",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Fur)),DIA_Bosper_TeachFUR_Fur);
};

func void DIA_Bosper_TeachFUR_Back()
{
	Info_ClearChoices(DIA_Bosper_TeachFUR);
};

func void DIA_Bosper_TeachFUR_Fur()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Fur))
	{
		AI_Output(self,other,"DIA_Bosper_TeachFUR_11_01");	//Хорошо! Слушай. Это довольно просто.
		AI_Output(self,other,"DIA_Bosper_TeachFUR_11_02");	//Берешь острый нож и разрезаешь брюхо животного. Затем делаешь несколько небольших надрезов на внутренней стороне ног, и снимаешь шкуру.
	};

	Info_ClearChoices(DIA_Bosper_TeachFUR);
};

instance DIA_Bosper_Trade(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 700;
	condition = DIA_Bosper_Trade_Condition;
	information = DIA_Bosper_Trade_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "Покажи мне свои товары.";
};

func int DIA_Bosper_Trade_Condition()
{
	if((MIS_Bosper_WolfFurs == LOG_Success) && (Wld_IsTime(5,0,14,0) || Wld_IsTime(16,0,23,0)))
	{
		return TRUE;
	};
	if((Player_IsApprentice > APP_NONE) && (Wld_IsTime(5,0,14,0) || Wld_IsTime(16,0,23,0)))
	{
		return TRUE;
	};
};

var int bosperarrowsday;
var int bosperarrowssay;
var int BosperTradeLowBows;

func void DIA_Bosper_Trade_Info()
{
	var int daynow;
	var int bolzenamount;

	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Bosper_Trade_15_00");	//Покажи мне свои товары.

	daynow = Wld_GetDay();

	if((Player_IsApprentice == APP_Bosper) && (BosperTradeBows == FALSE) && (MIS_Bosper_Bogen == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Bosper_BogenSuccess_11_06");	//Поскольку ты помог мне вернуть мой лук и к тому же еще и мой ученик...
		AI_Output(self,other,"DIA_Bosper_BogenSuccess_11_07");	//...то я, пожалуй, смогу продавать тебе не только болты и стрелы, но и довольно неплохие луки.
		AI_Output(self,other,"DIA_Bosper_BogenSuccess_11_08");	//Их, конечно, нельзя назвать произведением искусства, но они вполне годятся для охоты.
		BosperTradeBows = TRUE;
	};
	if((BosperTradeBows == TRUE) && (BosperTradeLowBows == FALSE))
	{
		CreateInvItems(self,ItRw_Bow_L_01,1);
		CreateInvItems(self,ItRw_Bow_L_02,1);
		CreateInvItems(self,ItRw_Bow_L_03,1);
		CreateInvItems(self,ItRw_Bow_L_04,1);
		CreateInvItems(self,ItRw_Bow_M_01,1);
		CreateInvItems(self,ItRw_Bow_M_02,1);
		CreateInvItems(self,ItRw_Bow_M_03,1);
		CreateInvItems(self,ItRw_Bow_M_04,1);
		BosperTradeLowBows = TRUE;
	};
	if(BOSPERARROWSDAY < daynow)
	{
		if(Wld_IsTime(12,0,23,59) || (BOSPERARROWSDAY < (daynow - 1)))
		{
			bolzenamount = (Kapitel * 25) + (10 * (daynow - BOSPERARROWSDAY - 1));

			if(bolzenamount > Npc_HasItems(self,ItRw_Bolt))
			{
				CreateInvItems(self,ItRw_Bolt,bolzenamount - Npc_HasItems(self,ItRw_Bolt));
			};
			if(bolzenamount > Npc_HasItems(self,ItRw_Arrow))
			{
				CreateInvItems(self,ItRw_Arrow,bolzenamount - Npc_HasItems(self,ItRw_Arrow));
			};

			BOSPERARROWSDAY = daynow;
		};
	}
	else if(BOSPERARROWSSAY == FALSE)
	{
		if((Npc_HasItems(self,ItRw_Bolt) == 0) && (Npc_HasItems(self,ItRw_Arrow) == 0))
		{
			AI_Output(self,other,"DIA_Bosper_Trade_11_03");	//Стрелы и болты закончились - приходи завтра.
		}
		else if(Npc_HasItems(self,ItRw_Bolt) == 0)
		{
			AI_Output(self,other,"DIA_Bosper_Trade_11_04");	//Болты закончились - приходи завтра.
		}
		else if(Npc_HasItems(self,ItRw_Arrow) == 0)
		{
			AI_Output(self,other,"DIA_Bosper_Trade_11_05");	//Стрелы закончились - приходи завтра.
		};

		AI_Output(self,other,"DIA_Bosper_Trade_11_06");	//Новые поступления - только завтра к полудню.
		BOSPERARROWSSAY = TRUE;
	};

	B_GiveTradeInv(self);
};

instance DIA_Bosper_BogenRunning(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 5;
	condition = DIA_Bosper_BogenRunning_Condition;
	information = DIA_Bosper_BogenRunning_Info;
	permanent = FALSE;
	description = "Я слышал, что у тебя что-то украли.";
};

func int DIA_Bosper_BogenRunning_Condition()
{
	if(MIS_Bosper_Bogen == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Bosper_BogenRunning_Info()
{
	AI_Output(other,self,"DIA_Bosper_BogenRunning_15_00");	//Я слышал, что у тебя что-то украли.
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_01");	//Кто сказал тебе это? Вероятно Барток, да? Ему что, больше нечего было сказать тебе? Ох, ладно.
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_02");	//Но если я доберусь до этого ублюдка, никакие молитвы ему не помогут!
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_03");	//Я отлучился из своей лавки всего на минуту. А когда вернулся, я увидел только, как он выходил - с моим луком на плече.
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_04");	//Я тут же позвал стражу, но этот подонок побежал к гавани. И они потеряли его там!
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_05");	//Я спустил на них всех собак за это, и стражники обыскали весь портовый квартал. Но ничего не нашли.
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_06");	//Бестолочи!
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_07");	//Готов поклясться, что мой лук все еще находится где-то в городе. Я поговорил со стражей у обоих городских ворот, но они не видели, чтобы кто-нибудь выходил из города с луком.
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_08");	//Когда я доберусь до этого ублюдка...
	Log_CreateTopic(TOPIC_BosperBogen,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BosperBogen,LOG_Running);
	B_LogEntry(TOPIC_BosperBogen,"У Боспера был украден лук. Вор побежал к гавани, и скрылся там. Ополчение обыскало портовый квартал, но они ничего не нашли, хотя лук все еще должен быть в городе.");
};

instance DIA_Bosper_BogenSuccess(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 6;
	condition = DIA_Bosper_BogenSuccess_Condition;
	information = DIA_Bosper_BogenSuccess_Info;
	permanent = FALSE;
	description = "Я думаю, это твой лук.";
};

func int DIA_Bosper_BogenSuccess_Condition()
{
	if((MIS_Bosper_Bogen == LOG_Running) && (Npc_KnowsInfo(other,DIA_Bosper_BogenRunning) == TRUE) && (Npc_HasItems(other,ItRw_Bow_L_03_MIS) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Bosper_BogenSuccess_Info()
{
	B_GivePlayerXP(XP_Bosper_Bogen);
	AI_Output(other,self,"DIA_Bosper_BogenSuccess_15_00");	//Я думаю, это твой лук.
	B_GiveInvItems(other,self,ItRw_Bow_L_03_MIS,1);
	Npc_RemoveInvItems(self,ItRw_Bow_L_03_MIS,1);
	AI_Output(self,other,"DIA_Bosper_BogenSuccess_11_01");	//Мой лук! Где ты нашел его?
	AI_Output(other,self,"DIA_Bosper_BogenSuccess_15_02");	//В темной дыре, полной крыс.
	AI_Output(self,other,"DIA_Bosper_BogenSuccess_11_03");	//Надеюсь, у тебя не возникло проблем из-за этого?
	AI_Output(other,self,"DIA_Bosper_BogenSuccess_15_04");	//Нет! Мне приходилось делать такое и раньше.
	AI_Output(self,other,"DIA_Bosper_BogenSuccess_11_05");	//Хммм...(одобрительно) Но все же спасибо. Я твой должник!
	MIS_Bosper_Bogen = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_BosperBogen,LOG_SUCCESS);
	B_LogEntry(TOPIC_BosperBogen,"Я вернул Босперу его лук.");

	if((Player_IsApprentice == APP_Bosper) && (BosperTradeBows == FALSE))
	{
		AI_Output(self,other,"DIA_Bosper_BogenSuccess_11_06");	//Поскольку ты помог мне вернуть мой лук и к тому же еще и мой ученик...
		AI_Output(self,other,"DIA_Bosper_BogenSuccess_11_07");	//...то я, пожалуй, смогу продавать тебе не только болты и стрелы, но и довольно неплохие луки.
		AI_Output(self,other,"DIA_Bosper_BogenSuccess_11_08");	//Их, конечно, нельзя назвать произведением искусства, но они вполне годятся для охоты.
		BosperTradeBows = TRUE;
	};
};

instance DIA_Bosper_MakeBow(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 1;
	condition = DIA_Bosper_MakeBow_Condition;
	information = DIA_Bosper_MakeBow_Info;
	permanent = FALSE;
	description = "А откуда ты берешь свои луки?";
};

func int DIA_Bosper_MakeBow_Condition()
{
	if((BosperTradeBows == TRUE) && (Player_IsApprentice == APP_Bosper))
	{
		return TRUE;
	};
};

func void DIA_Bosper_MakeBow_Info()
{
	AI_Output(other,self,"DIA_Bosper_MakeBow_01_00");	//А откуда ты берешь свои луки?
	AI_Output(self,other,"DIA_Bosper_MakeBow_01_01");	//(удивленно) Как откуда? Я их делаю сам!
	AI_Output(self,other,"DIA_Bosper_MakeBow_01_02");	//Правда, совсем немного, поскольку производство каждого из них отнимает довольно много времени.
	AI_Output(self,other,"DIA_Bosper_MakeBow_01_03");	//Но в конечном счете оно того стоит! Это занятие вполне окупает себя.
	AI_Output(other,self,"DIA_Bosper_MakeBow_01_04");	//А меня ты мог бы этому научить?
	AI_Output(self,other,"DIA_Bosper_MakeBow_01_05");	//(задумчиво) Ну, почему бы и нет. В конце концов, ты ведь мой ученик.
	AI_Output(self,other,"DIA_Bosper_MakeBow_01_06");	//Правда, для этого тебе понадобится некоторый опыт, ибо ремесло это довольно непростое! 
	AI_Output(self,other,"DIA_Bosper_MakeBow_01_07");	//Ну а денег за это я с тебя, конечно, не возьму.
	BosperTeachMakeBows = TRUE;
	Log_CreateTopic(Topic_TalentMakeBows,LOG_NOTE);
	B_LogEntry(Topic_TalentMakeBows,"Боспер может научить меня делать луки.");
};

instance DIA_Bosper_BOWTEACH1(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 5;
	condition = DIA_Bosper_BOWTEACH1_condition;
	information = DIA_Bosper_BOWTEACH1_info;
	permanent = TRUE;
	description = "Научи меня делать луки (Очки обучения: 1 LP)";
};

func int DIA_Bosper_BOWTEACH1_condition()
{
	if((BosperTeachMakeBows == TRUE) && (BowMake_01 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bosper_BOWTEACH1_info()
{
	AI_Output(other,self,"DIA_Bosper_BOWTEACH1_01_00");	//Научи меня делать луки.

	if(hero.lp >= 1)
	{
		AI_Output(self,other,"DIA_Bosper_BOWTEACH1_01_01");	//Хорошо. Тогда, пожалуй, начнем с основ.
		AI_Output(self,other,"DIA_Bosper_BOWTEACH1_01_02");	//Главное, что тебе следует знать, - это то, что лук состоит из двух основополагающих компонентов - древка и тетивы.
		AI_Output(self,other,"DIA_Bosper_BOWTEACH1_01_03");	//Чем лучше качество этих составляющих, тем лучше будет лук, который ты собираешься сделать.
		AI_Output(self,other,"DIA_Bosper_BOWTEACH1_01_04");	//Для древка используются разные сорта древесины, каждое из которых имеет разные сочетания изгиба и упругости. 
		AI_Output(self,other,"DIA_Bosper_BOWTEACH1_01_05");	//Если ты возьмешь обычное бревно и сделаешь из него лук, то он треснет пополам при первом же выстреле.
		AI_Output(self,other,"DIA_Bosper_BOWTEACH1_01_06");	//Поэтому следует тщательно подходить к выбору того материала, который будет использоваться в производстве.
		AI_Output(self,other,"DIA_Bosper_BOWTEACH1_01_07");	//Теперь насчет тетивы. Здесь тоже существуют свои некоторые нюансы.
		AI_Output(self,other,"DIA_Bosper_BOWTEACH1_01_08");	//В основном тетива изготавливается из шкур животных - волков, кабанов, мракорисов или варгов. 
		AI_Output(self,other,"DIA_Bosper_BOWTEACH1_01_09");	//Этот материал позволяет тетиве сохранять свои свойства натяжения в любую погоду.
		AI_Output(self,other,"DIA_Bosper_BOWTEACH1_01_10");	//Она никогда не размокнет при дожде и не задубеет при лютом морозе.
		AI_Output(self,other,"DIA_Bosper_BOWTEACH1_01_11");	//Правда, для этого ее также необходимо будет обработать различными смазками вроде жира или смолы.
		AI_Output(self,other,"DIA_Bosper_BOWTEACH1_01_12");	//Что касается самого процесса производства, то тут все просто.
		AI_Output(self,other,"DIA_Bosper_BOWTEACH1_01_13");	//Берешь нужную тебе заготовку древесины, щипцы и аккуратно вытачиваешь на столярном верстаке само древко.
		AI_Output(self,other,"DIA_Bosper_BOWTEACH1_01_14");	//Затем берешь кусок шкуры, разделочный нож и на шкуродере нарезаешь ее тонкими кусками. 
		AI_Output(self,other,"DIA_Bosper_BOWTEACH1_01_15");	//Далее обрабатываешь каждый из этих кусков жиром или смолой, переплетаешь и высушиваешь их. 
		AI_Output(self,other,"DIA_Bosper_BOWTEACH1_01_16");	//Собственно, так делается тетива. Ну а после на том же верстаке собираешь уже сам лук.
		AI_Output(self,other,"DIA_Bosper_BOWTEACH1_01_17");	//Твои первые луки не будут произведением искусств, но если будешь долго практиковаться, то...
		AI_Output(self,other,"DIA_Bosper_BOWTEACH1_01_18");	//...в общем - все придет с опытом.
		AI_Output(self,other,"DIA_Bosper_BOWTEACH1_01_19");	//Ну а в дальнейшем я смогу показать тебе, как делать еще более прочные и смертоносные луки.
		hero.lp = hero.lp - 1;
		BowMake_01 = TRUE;
		AI_Print("Изучен рецепт изготовления луков - 'Короткий деревянный лук'");
		B_LogEntry(Topic_TalentMakeBows,"Для создания древков луков мне понадобится: столярный верстак, заготовка из определенной породы древесины и обычные щипцы.");
		B_LogEntry_Quiet(Topic_TalentMakeBows,"Для создания тетивы мне понадобится: шкуродер, разделочный нож, кусок шкуры животного и смазочный материал в виде жира или смолы.");
		B_LogEntry_Quiet(Topic_TalentMakeBows,"Для создания самого лука мне понадобится: столярный верстак, готовое древко лука, тетива и обычные щипцы.");
		B_LogEntry_Quiet(Topic_TalentMakeBows,"Чтобы сделать короткий деревянный лук, мне понадобится тетива из шкуры волка, обычное древко лука и смола.");
		Snd_Play("LevelUP");
	}
	else if(hero.lp < 1)
	{
		AI_Output(self,other,"DIA_Bosper_BOWTEACH1_01_22");	//Ты еще не готов к этому! Приходи, когда наберешься опыта.
		AI_StopProcessInfos(self);
	};
};

instance DIA_Bosper_WhereBowWood(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 4;
	condition = DIA_Bosper_WhereBowWood_Condition;
	information = DIA_Bosper_WhereBowWood_Info;
	permanent = FALSE;
	description = "Где мне взять заготовки из древесины?";
};

func int DIA_Bosper_WhereBowWood_Condition()
{
	if(BowMake_01 == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Bosper_WhereBowWood_Info()
{
	AI_Output(other,self,"DIA_Bosper_WhereBowWood_01_00");	//Где мне взять заготовки из древесины?
	AI_Output(self,other,"DIA_Bosper_WhereBowWood_01_01");	//Поговори об этом с Торбеном. Наверняка у него их навалом.
	AI_Output(self,other,"DIA_Bosper_WhereBowWood_01_02");	//Может быть, он что-нибудь тебе и продаст.
	TorbenSellWood = TRUE;
	Log_CreateTopic(Topic_TalentMakeBows,LOG_NOTE);
	B_LogEntry(Topic_TalentMakeBows,"По поводу заготовок из древесины Боспер посоветовал мне поговорить с Торбеном.");
};

instance DIA_Bosper_BosperBuyAllBows(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 4;
	condition = DIA_Bosper_BosperBuyAllBows_Condition;
	information = DIA_Bosper_BosperBuyAllBows_Info;
	permanent = FALSE;
	description = "А что мне делать с изготовленными луками?";
};

func int DIA_Bosper_BosperBuyAllBows_Condition()
{
	if(BowMake_01 == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Bosper_BosperBuyAllBows_Info()
{
	AI_Output(other,self,"DIA_Bosper_BosperBuyAllBows_01_00");	//А что мне делать с изготовленными луками?
	AI_Output(self,other,"DIA_Bosper_BosperBuyAllBows_01_01");	//Ну, если хочешь, то можешь продать их торговцам на площади. Правда, они тебе дадут за них сущие гроши!
	AI_Output(self,other,"DIA_Bosper_BosperBuyAllBows_01_02");	//Лучше приноси их мне. Я уверен, мы сумеем договориться.
	AI_Output(other,self,"DIA_Bosper_BosperBuyAllBows_01_03");	//Я подумаю над этим.
	BosperBuyAllBows = TRUE;
	Log_CreateTopic(Topic_TalentMakeBows,LOG_NOTE);
	B_LogEntry(Topic_TalentMakeBows,"Боспер купит у меня все луки, что я изготовлю.");
};

instance DIA_Bosper_SellBows(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 200;
	condition = DIA_Bosper_SellBows_Condition;
	information = DIA_Bosper_SellBows_Info;
	permanent = TRUE;
	description = "Я хочу продать изготовленные луки.";
};

func int DIA_Bosper_SellBows_Condition()
{
	if((Player_IsApprentice == APP_Bosper) && (BosperBuyAllBows == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Bosper_SellBows_Info()
{
	var C_Item EquipWeap;
	var int anzahl_common;
	var int anzahl_eve;
	var int anzahl_vyz;
	var int anzahl_ysuo;
	var int anzahl_bok;
	var int gesamt;
	var int lohnbow;
	var string concatText;


	AI_Output(other,self,"DIA_Bosper_SellBows_15_00");	//Я хочу продать изготовленные луки.
	EquipWeap = Npc_GetEquippedRangedWeapon(other);

	anzahl_common = Npc_HasItems(other,ItRw_BowCraft_01);

	if(Hlp_IsItem(EquipWeap,ItRw_BowCraft_01) == TRUE)
	{
		if(anzahl_common > 1)
		{
			Npc_RemoveInvItems(other,ItRw_BowCraft_01,anzahl_common);
		};
		anzahl_common -= 1;
	};

	anzahl_eve = Npc_HasItems(other,ItRw_BowCraft_02);

	if(Hlp_IsItem(EquipWeap,ItRw_BowCraft_02) == TRUE)
	{
		if(anzahl_eve > 1)
		{
			Npc_RemoveInvItems(other,ItRw_BowCraft_02,anzahl_eve);
		};
		anzahl_eve = anzahl_eve - 1;
	};

	anzahl_vyz = Npc_HasItems(other,ItRw_BowCraft_03);

	if(Hlp_IsItem(EquipWeap,ItRw_BowCraft_03) == TRUE)
	{
		if(anzahl_vyz > 1)
		{
			Npc_RemoveInvItems(other,ItRw_BowCraft_03,anzahl_vyz);
		};
		anzahl_vyz = anzahl_vyz - 1;
	};

	anzahl_ysuo = Npc_HasItems(other,ItRw_BowCraft_04);

	if(Hlp_IsItem(EquipWeap,ItRw_BowCraft_04) == TRUE)
	{
		if(anzahl_ysuo > 1)
		{
			Npc_RemoveInvItems(other,ItRw_BowCraft_04,anzahl_ysuo);
		};
		anzahl_ysuo = anzahl_ysuo - 1;
	};

	anzahl_bok = Npc_HasItems(other,ItRw_BowCraft_05);

	if(Hlp_IsItem(EquipWeap,ItRw_BowCraft_05) == TRUE)
	{
		if(anzahl_bok > 1)
		{
			Npc_RemoveInvItems(other,ItRw_BowCraft_05,anzahl_bok);
		};
		anzahl_bok = anzahl_bok - 1;
	};

	gesamt = anzahl_common + anzahl_eve + anzahl_vyz + anzahl_ysuo + anzahl_bok;

	if(gesamt == 0)
	{
		if((Hlp_IsItem(EquipWeap,ItRw_BowCraft_01) == TRUE) || (Hlp_IsItem(EquipWeap,ItRw_BowCraft_02) == TRUE) || (Hlp_IsItem(EquipWeap,ItRw_BowCraft_03) == TRUE) || (Hlp_IsItem(EquipWeap,ItRw_BowCraft_04) == TRUE) || (Hlp_IsItem(EquipWeap,ItRw_BowCraft_05) == TRUE))
		{
			AI_Output(self,other,"DIA_Bosper_SellBows_12_01");	//Но кроме того, что висит у тебя за спиной, я не вижу у тебя ни одного лука!
		}
		else
		{
			AI_Output(self,other,"DIA_Bosper_SellBows_12_04");	//Так сделай их сначала!
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_SellBows_12_02");	//Хорошо - давай сюда.

		if(Hlp_IsItem(EquipWeap,ItRw_BowCraft_01) != TRUE)
		{
			Npc_RemoveInvItems(other,ItRw_BowCraft_01,anzahl_common);
		};
		if(Hlp_IsItem(EquipWeap,ItRw_BowCraft_02) != TRUE)
		{
			Npc_RemoveInvItems(other,ItRw_BowCraft_02,anzahl_eve);
		};
		if(Hlp_IsItem(EquipWeap,ItRw_BowCraft_03) != TRUE)
		{
			Npc_RemoveInvItems(other,ItRw_BowCraft_03,anzahl_vyz);
		};
		if(Hlp_IsItem(EquipWeap,ItRw_BowCraft_04) != TRUE)
		{
			Npc_RemoveInvItems(other,ItRw_BowCraft_04,anzahl_ysuo);
		};
		if(Hlp_IsItem(EquipWeap,ItRw_BowCraft_05) != TRUE)
		{
			Npc_RemoveInvItems(other,ItRw_BowCraft_05,anzahl_bok);
		};

		concatText = b_formgivestring(other,gesamt);
		AI_Print(concatText);
		AI_Output(self,other,"DIA_Bosper_SellBows_12_03");	//Отлично! А вот твое золото.
		lohnbow = (anzahl_common * 50) + (anzahl_eve * 100) + (anzahl_vyz * 200) + (anzahl_ysuo * 300) + (anzahl_bok * 500);
		B_GiveInvItems(self,other,ItMi_Gold,lohnbow);
	};
};

instance DIA_Bosper_BOWTEACH_Other(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 5;
	condition = DIA_Bosper_BOWTEACH_Other_condition;
	information = DIA_Bosper_BOWTEACH_Other_info;
	permanent = TRUE;
	description = "Изготовлению каких луков я еще смогу у тебя обучиться?";
};

func int DIA_Bosper_BOWTEACH_Other_condition()
{
	if((BosperTeachMakeBows == TRUE) && (BowMake_01 == TRUE) && ((BowMake_02 == FALSE) || (BowMake_03 == FALSE) || (BowMake_04 == FALSE) || (BowMake_05 == FALSE)))
	{
		return TRUE;
	};
};

func void DIA_Bosper_BOWTEACH_Other_info()
{
	AI_Output(other,self,"DIA_Bosper_BOWTEACH_Other_01_00");	//Изготовлению каких луков я еще смогу у тебя обучиться?
	AI_Output(self,other,"DIA_Bosper_BOWTEACH_Other_01_01");	//Смотри сам...
	Info_ClearChoices(DIA_Bosper_BOWTEACH_Other);
	Info_AddChoice(DIA_Bosper_BOWTEACH_Other,Dialog_Back,DIA_Bosper_BOWTEACH_Other_Back);

	if((BowMake_01 == TRUE) && (BowMake_02 == FALSE) && (hero.attribute[ATR_DEXTERITY] >= Condition_Weidenbogen))
	{
		Info_AddChoice(DIA_Bosper_BOWTEACH_Other,"Ивовый лук (Очки обучения: 1)",DIA_Bosper_BOWTEACH_Other_Bow_01);
	};
	if((BowMake_02 == TRUE) && (BowMake_03 == FALSE) && (hero.attribute[ATR_DEXTERITY] >= Condition_Ulmenbogen))
	{
		Info_AddChoice(DIA_Bosper_BOWTEACH_Other,"Вязовый лук (Очки обучения: 2)",DIA_Bosper_BOWTEACH_Other_Bow_02);
	};
	if((BowMake_03 == TRUE) && (BowMake_04 == FALSE) && (hero.attribute[ATR_DEXTERITY] >= Condition_Eschenbogen))
	{
		Info_AddChoice(DIA_Bosper_BOWTEACH_Other,"Ясеневый лук (Очки обучения: 3)",DIA_Bosper_BOWTEACH_Other_Bow_03);
	};
	if((BowMake_04 == TRUE) && (BowMake_05 == FALSE) && (hero.attribute[ATR_DEXTERITY] >= Condition_Buchenbogen))
	{
		Info_AddChoice(DIA_Bosper_BOWTEACH_Other,"Буковый лук (Очки обучения: 4)",DIA_Bosper_BOWTEACH_Other_Bow_04);
	};
};

func void DIA_Bosper_BOWTEACH_Other_Back()
{
	Info_ClearChoices(DIA_Bosper_BOWTEACH_Other);
};

func void DIA_Bosper_BOWTEACH_Other_Bow_01()
{
	if(hero.lp >= 1)
	{
		AI_Output(self,other,"DIA_Bosper_BOWTEACH_Other_Bow_01_01_01");	//Хорошо. Теперь ты знаешь, как сделать этот лук.
		AI_Output(self,other,"DIA_Bosper_BOWTEACH_Other_Bow_01_01_02");	//Надеюсь, что у тебя все получится.
		hero.lp = hero.lp - 1;
		BowMake_02 = TRUE;
		AI_Print("Изучен рецепт изготовления луков - 'Ивовый лук'");
		B_LogEntry(Topic_TalentMakeBows,"Чтобы сделать ивовый лук, мне понадобится тетива из шкуры кабана, ивовое древко лука и смола.");
		Snd_Play("LevelUP");
	}
	else if(hero.lp < 1)
	{
		AI_Output(self,other,"DIA_Bosper_BOWTEACH_Other_Bow_01_01_03");	//Ты еще не готов к этому! Приходи, когда наберешься опыта.
		AI_StopProcessInfos(self);
	};
};

func void DIA_Bosper_BOWTEACH_Other_Bow_02()
{
	if(hero.lp >= 2)
	{
		AI_Output(self,other,"DIA_Bosper_BOWTEACH_Other_Bow_02_01_01");	//Хорошо. Теперь ты знаешь, как сделать этот лук.
		AI_Output(self,other,"DIA_Bosper_BOWTEACH_Other_Bow_02_01_02");	//Надеюсь, что у тебя все получится.
		hero.lp = hero.lp - 2;
		BowMake_03 = TRUE;
		AI_Print("Изучен рецепт изготовления луков - 'Вязовый лук'");
		B_LogEntry(Topic_TalentMakeBows,"Чтобы сделать вязовый лук, мне понадобится тетива из шкуры варга, вязовое древко лука и смола.");
		Snd_Play("LevelUP");
	}
	else if(hero.lp < 2)
	{
		AI_Output(self,other,"DIA_Bosper_BOWTEACH_Other_Bow_02_01_03");	//Ты еще не готов к этому! Приходи, когда наберешься опыта.
		AI_StopProcessInfos(self);
	};
};

func void DIA_Bosper_BOWTEACH_Other_Bow_03()
{
	if(hero.lp >= 3)
	{
		AI_Output(self,other,"DIA_Bosper_BOWTEACH_Other_Bow_03_01_01");	//Хорошо. Теперь ты знаешь, как сделать этот лук.
		AI_Output(self,other,"DIA_Bosper_BOWTEACH_Other_Bow_03_01_02");	//Надеюсь, что у тебя все получится.
		hero.lp = hero.lp - 3;
		BowMake_04 = TRUE;
		AI_Print("Изучен рецепт изготовления луков - 'Ясеневый лук'");
		B_LogEntry(Topic_TalentMakeBows,"Чтобы сделать ясеневый лук, мне понадобится тетива из шкуры мракориса, ясеневое древко лука и смола.");
		Snd_Play("LevelUP");
	}
	else if(hero.lp < 3)
	{
		AI_Output(self,other,"DIA_Bosper_BOWTEACH_Other_Bow_03_01_03");	//Ты еще не готов к этому! Приходи, когда наберешься опыта.
		AI_StopProcessInfos(self);
	};
};

func void DIA_Bosper_BOWTEACH_Other_Bow_04()
{
	if(hero.lp >= 4)
	{
		AI_Output(self,other,"DIA_Bosper_BOWTEACH_Other_Bow_04_01_01");	//Хорошо. Теперь ты знаешь, как сделать этот лук.
		AI_Output(self,other,"DIA_Bosper_BOWTEACH_Other_Bow_04_01_02");	//Надеюсь, что у тебя все получится.
		hero.lp = hero.lp - 4;
		BowMake_05 = TRUE;
		AI_Print("Изучен рецепт изготовления луков - 'Буковый лук'");
		B_LogEntry(Topic_TalentMakeBows,"Чтобы сделать буковый лук, мне понадобится тетива из шкуры тролля, буковое древко лука и две порции смолы.");
		Snd_Play("LevelUP");
	}
	else if(hero.lp < 4)
	{
		AI_Output(self,other,"DIA_Bosper_BOWTEACH_Other_Bow_04_01_03");	//Ты еще не готов к этому! Приходи, когда наберешься опыта.
		AI_StopProcessInfos(self);
	};
};

var int Bosper_Island;

instance DIA_Bosper_PERM(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 10;
	condition = DIA_Bosper_PERM_Condition;
	information = DIA_Bosper_PERM_Info;
	permanent = TRUE;
	description = "Как обстановка в городе?";
};

func int DIA_Bosper_PERM_Condition()
{
	if(Kapitel >= 2)
	{
		return TRUE;
	};
};

func void DIA_Bosper_PERM_Info()
{
	AI_Output(other,self,"DIA_Bosper_PERM_15_00");	//Как обстановка в городе?
	if(Bosper_Island == FALSE)
	{
		AI_Output(self,other,"DIA_Bosper_PERM_11_01");	//Если орки действительно решатся напасть на нас, здесь станет совсем паршиво.
		AI_Output(self,other,"DIA_Bosper_PERM_11_02");	//В гавани стоит только один корабль - и его охраняют паладины. Я не думаю, что они используют его для спасения горожан.
		AI_Output(other,self,"DIA_Bosper_PERM_15_03");	//А нет другого способа выбраться отсюда?
		AI_Output(self,other,"DIA_Bosper_PERM_11_04");	//Нет, никому из нас не покинуть этот остров без корабля.
		Bosper_Island = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_PERM_11_05");	//Пока нет никаких новостей. Если хочешь, зайди позже.
	};
};

var int Bosper_MILKommentar;
var int Bosper_PALKommentar;
var int Bosper_INNOSKommentar;
var int Bosper_KDWKommentar;
var int Bosper_SEKKommentar;
var int Bosper_KDMKommentar;

instance DIA_Bosper_AlsLehrling(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 1;
	condition = DIA_Bosper_AlsLehrling_Condition;
	information = DIA_Bosper_AlsLehrling_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Bosper_AlsLehrling_Condition()
{
	if((Player_IsApprentice == APP_Bosper) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Bosper_AlsLehrling_Info()
{
	if((other.guild == GIL_MIL) && (Bosper_StartGuild != GIL_MIL) && (Bosper_MILKommentar == FALSE))
	{
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_00");	//Ты что, вступил в ополчение, да?
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_01");	//Мне, в общем-то, все равно. Лишь бы ты, помимо орков и бандитов, охотился также и на волков. (ухмыляется)
		Bosper_MILKommentar = TRUE;
	}
	else if((other.guild == GIL_PAL) && (Bosper_StartGuild != GIL_PAL) && (Bosper_PALKommentar == FALSE))
	{
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_02");	//Похоже, твоя карьера переживает стремительный взлет. Паладин короля!
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_03");	//Но куда бы ни занесло тебя, прошу, не забывай своего старого учителя...
		Bosper_PALKommentar = TRUE;
	}
	else if(((other.guild == GIL_NOV) || (other.guild == GIL_KDF)) && (Bosper_StartGuild != GIL_NOV) && (Bosper_StartGuild != GIL_KDF) && (Bosper_INNOSKommentar == FALSE))
	{
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_04");	//Ты постригся в монастырь, да? Надеюсь, они будут отпускать тебя хоть иногда, и ты сможешь приносить мне шкуры...
		Bosper_INNOSKommentar = TRUE;
	}
	else if((other.guild == GIL_KDW) && (Bosper_KDWKommentar == FALSE))
	{
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_08");	//Ты примкнул к Кругу Воды. Надеюсь, твой обет не помешает тебе охотиться и приносить мне шкуры, как раньше. Ты не забудешь старика Боспера, ведь так?
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_09");	//Только... не мочи шкуры почем зря, хорошо? Ты - водный маг, а я терпеть не могу мокрые шкуры. 
		Bosper_KDWKommentar = TRUE;
	}
	else if((Bosper_SEKKommentar == FALSE) && ((other.guild == GIL_TPL) || (other.guild == GIL_GUR) || (other.guild == GIL_SEK)))
	{
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_10");	//О, ты теперь с этими чудными ребятами! Отлично! Ты сделал правильный выбор! Болотное братство - очень хорошее место для тебя!

		if(other.guild == GIL_TPL)
		{
			AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_11");	//Монастырь Инноса, скажем, наверняка прервал бы наше сотрудничество, а с Братством ты будешь ближе к природе, к зверям, к шкурам и ко мне...
		};

		Bosper_SEKKommentar = TRUE;
	}
	else if((Bosper_KDMKommentar == FALSE) && ((other.guild == GIL_KDM) || (other.guild == GIL_NDM)))
	{
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_12");	//Ты - темный маг? Некромант, да? Это... меня нисколько не смущает, клянусь. 
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_13");	//Я буду покупать у тебя шкуры, даже если ты обратишься в самого Белиара! Только приноси их лично. Не присылай сюда своих... как их? Поднятых слуг. Договорились?
		Bosper_KDMKommentar = TRUE;
	}
	else if((Bosper_Lehrling_Day <= (Wld_GetDay() - 4)) && (other.guild != GIL_PAL) && (other.guild != GIL_KDF))
	{
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_05");	//Где ты болтался так долго?
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_06");	//Мне нужны еще шкуры. Ты принес их?
		Bosper_Lehrling_Day = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_07");	//Пришел, наконец...
		Bosper_Lehrling_Day = Wld_GetDay();
	};
};


instance DIA_Bosper_Aufgaben(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 1;
	condition = DIA_Bosper_Aufgaben_Condition;
	information = DIA_Bosper_Aufgaben_Info;
	permanent = FALSE;
	description = "Что должен делать ученик?";
};

func int DIA_Bosper_Aufgaben_Condition()
{
	if(Player_IsApprentice == APP_Bosper)
	{
		return TRUE;
	};
};

func void DIA_Bosper_Aufgaben_Info()
{
	AI_Output(other,self,"DIA_Bosper_Aufgaben_15_00");	//Что должен делать ученик?
	AI_Output(self,other,"DIA_Bosper_Aufgaben_11_01");	//Это просто. Приноси мне все шкуры, что сможешь добыть.
	AI_Output(self,other,"DIA_Bosper_Aufgaben_11_02");	//Я дам тебе за них более высокую цену, чем любой другой из местных торговцев.
	AI_Output(self,other,"DIA_Bosper_Aufgaben_11_03");	//Ну, а в остальное время, тебе не обязательно появляться в моей лавке. Я и один тут неплохо справляюсь.
	if(other.guild == GIL_NONE)
	{
		AI_Output(other,self,"DIA_Bosper_Aufgaben_15_04");	//А где я буду спать?
		AI_Output(self,other,"DIA_Bosper_Aufgaben_11_05");	//У меня здесь нет места для тебя. Но ты всегда найдешь свободную койку в отеле на рыночной площади.
	};
	Log_CreateTopic(Topic_Bonus,LOG_NOTE);
	B_LogEntry(Topic_Bonus,"Боспер готов платить очень хорошую цену за шкуры животных.");
};


var int Bosper_TrollFurSold;

instance DIA_Bosper_SellFur(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 600;
	condition = DIA_Bosper_SellFur_Condition;
	information = DIA_Bosper_SellFur_Info;
	permanent = TRUE;
	description = "Я принес несколько шкур для тебя.";
};

func int DIA_Bosper_SellFur_Condition()
{
	if(Player_IsApprentice == APP_Bosper)
	{
		return TRUE;
	};
};

func void DIA_Bosper_SellFur_Info()
{
	var int wargfur;
	var int SummRabbitFur;
	var int dogfur;
	var int wolffur;
	var int icewolffur;
	var int summwolf;
	var int LurkerSkin;
	var int SharkSkin;
	var int SummSkin;
	var int pumafur;
	var int icepumafur;
	var int summpuma;

	AI_Output(other,self,"DIA_Bosper_SellFur_15_00");	//Я принес несколько шкур для тебя.

	if((Npc_HasItems(other,ItAt_RabbitFur) > 0) || (Npc_HasItems(other,ItAt_SheepFur) > 0) || (Npc_HasItems(other,ItAt_SharkSkin) > 0) || (Npc_HasItems(other,ItAt_IceWolfFur) > 0) || (Npc_HasItems(other,ItAt_WolfFur) > 0) || (Npc_HasItems(other,ItAt_OrcDogFur) > 0) || (Npc_HasItems(other,ItAt_WargFur) > 0) || (Npc_HasItems(other,ItAt_ShadowFur) > 0) || (Npc_HasItems(other,ItAt_TrollFur) > 0) || (Npc_HasItems(other,ItAt_TrollBlackFur) > 0) || (Npc_HasItems(other,ItAt_Addon_KeilerFur) > 0) || (Npc_HasItems(other,itat_pumafur) > 0) || (Npc_HasItems(other,itat_LurkerSkin) > 0))
	{
		if(Npc_HasItems(other,ItAt_RabbitFur) > 0)
		{
			SummRabbitFur = Npc_HasItems(other,ItAt_RabbitFur) * 5;
			AI_Output(self,other,"DIA_Bosper_SellFur_11_95A");	//Хмм... Кроличьи шкуры? Ладно, давай их сюда. Сгодятся для чего-нибудь.
			B_GiveInvItems(self,other,ItMi_Gold,SummRabbitFur);
			Npc_RemoveInvItems(other,ItAt_RabbitFur,Npc_HasItems(other,ItAt_RabbitFur));
		};
		if((Npc_HasItems(other,itat_LurkerSkin) > 0) || (Npc_HasItems(other,ItAt_SharkSkin) > 0))
		{
			LurkerSkin = Npc_HasItems(other,itat_LurkerSkin);
			SharkSkin = Npc_HasItems(other,ItAt_SharkSkin);
			SummSkin = (LurkerSkin * Value_ReptileSkin) + (SharkSkin * Value_SharkSkin);

			AI_Output(self,other,"DIA_Bosper_SellFur_11_15A");	//Шкуры рептилий? Пригодятся для доспехов стражи.
			B_GiveInvItems(self,other,ItMi_Gold,SummSkin);
			Npc_RemoveInvItems(other,itat_LurkerSkin,Npc_HasItems(other,itat_LurkerSkin));
			Npc_RemoveInvItems(other,ItAt_SharkSkin,Npc_HasItems(other,ItAt_SharkSkin));
		};
		if(Npc_HasItems(other,ItAt_Addon_KeilerFur) > 0)
		{
			AI_Output(self,other,"DIA_Bosper_SellFur_11_15B");	//Шкура кабана? Неплохо для начала...
			B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(other,ItAt_Addon_KeilerFur) * Value_Keilerfur);
			Npc_RemoveInvItems(other,ItAt_Addon_KeilerFur,Npc_HasItems(other,ItAt_Addon_KeilerFur));
		};
		if(Npc_HasItems(other,ItAt_SheepFur) > 0)
		{
			AI_Output(self,other,"DIA_Bosper_SellFur_11_01");	//Овечьи шкура? Ты ведь не убивал овец фермеров на пастбищах, нет?
			AI_Output(other,self,"DIA_Bosper_SellFur_15_02");	//Я даже и не думал заниматься этим.
			B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(other,ItAt_SheepFur) * Value_SheepFur);
			Npc_RemoveInvItems(other,ItAt_SheepFur,Npc_HasItems(other,ItAt_SheepFur));
		};
		if((Npc_HasItems(other,ItAt_WolfFur) > 0) || (Npc_HasItems(other,ItAt_IceWolfFur) > 0))
		{
			wolffur = Npc_HasItems(other,ItAt_WolfFur);
			icewolffur = Npc_HasItems(other,ItAt_IceWolfFur);
			summwolf = (wolffur * Value_WolfFur) + (icewolffur * Value_IceWolfFur);

			AI_Output(self,other,"DIA_Bosper_SellFur_11_03");	//Волчьи шкуры, это хорошо...
			B_GiveInvItems(self,other,ItMi_Gold,summwolf);
			Npc_RemoveInvItems(other,ItAt_WolfFur,Npc_HasItems(other,ItAt_WolfFur));
			Npc_RemoveInvItems(other,ItAt_IceWolfFur,Npc_HasItems(other,ItAt_IceWolfFur));
		};
		if((Npc_HasItems(other,ItAt_WargFur) > 0) || (Npc_HasItems(other,ItAt_OrcDogFur) > 0))
		{
			wargfur = Npc_HasItems(other,ItAt_WargFur);
			dogfur = Npc_HasItems(other,ItAt_OrcDogFur);
			wargfur = wargfur + dogfur;

			AI_Output(self,other,"DIA_Bosper_SellFur_11_04");	//Шкура варга? Это опасные звери...
			B_GiveInvItems(self,other,ItMi_Gold,wargfur * Value_WargFur);
			Npc_RemoveInvItems(other,ItAt_WargFur,Npc_HasItems(other,ItAt_WargFur));
			Npc_RemoveInvItems(other,ItAt_OrcDogFur,Npc_HasItems(other,ItAt_OrcDogFur));
		};
		if((Npc_HasItems(other,itat_pumafur) > 0) || (Npc_HasItems(other,ItAt_WhitePuma) > 0))
		{
			pumafur = Npc_HasItems(other,itat_pumafur);
			icepumafur = Npc_HasItems(other,ItAt_WhitePuma);
			summpuma = (pumafur * Value_PumaFur) + (icepumafur * Value_IcePumaFur);

			AI_Output(self,other,"DIA_Bosper_SellFur_11_14");	//Шкура пантеры? Это большая редкость в наших краях.
			B_GiveInvItems(self,other,ItMi_Gold,summpuma);
			Npc_RemoveInvItems(other,itat_pumafur,Npc_HasItems(other,itat_pumafur));
			Npc_RemoveInvItems(other,ItAt_WhitePuma,Npc_HasItems(other,ItAt_WhitePuma));
		};
		if(Npc_HasItems(other,ItAt_ShadowFur) > 0)
		{
			AI_Output(self,other,"DIA_Bosper_SellFur_11_05");	//Ага...(пораженно) И даже шкура мракориса? Она дорогого стоит!
			B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(other,ItAt_ShadowFur) * Value_ShadowFur);
			Npc_RemoveInvItems(other,ItAt_ShadowFur,Npc_HasItems(other,ItAt_ShadowFur));
		};
		if((Npc_HasItems(other,ItAt_TrollFur) > 0) || (Npc_HasItems(other,ItAt_TrollBlackFur) > 0))
		{
			if(Bosper_TrollFurSold == FALSE)
			{
				AI_Output(self,other,"DIA_Bosper_SellFur_11_06");	//А это что за шкура, черт побери?
				AI_Output(other,self,"DIA_Bosper_SellFur_15_07");	//Я снял ее с тролля.
				AI_Output(self,other,"DIA_Bosper_SellFur_11_08");	//Это... Она стоит целое состояние!
				Bosper_TrollFurSold = TRUE;
			}
			else
			{
				AI_Output(self,other,"DIA_Bosper_SellFur_11_09");	//Еще одна огромная шкура тролля! Ты на них охотишься?!
				AI_Output(other,self,"DIA_Bosper_SellFur_15_10");	//Если мне вдруг один попадется, так я уж момент не упущу...
			};
			if(Npc_HasItems(other,ItAt_TrollFur) > 0)
			{
				B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(other,ItAt_TrollFur) * Value_TrollFur);
				Npc_RemoveInvItems(other,ItAt_TrollFur,Npc_HasItems(other,ItAt_TrollFur));
			};
			if(Npc_HasItems(other,ItAt_TrollBlackFur) > 0)
			{
				AI_Output(self,other,"DIA_Bosper_SellFur_11_11");	//И шкура ЧЕРНОГО тролля! Надо же!
				B_GiveInvItems(self,other,ItMi_Gold,Npc_HasItems(other,ItAt_TrollBlackFur) * Value_TrollBlackFur);
				Npc_RemoveInvItems(other,ItAt_TrollBlackFur,Npc_HasItems(other,ItAt_TrollBlackFur));
			};
		};
		AI_Output(self,other,"DIA_Bosper_SellFur_11_12");	//Отличная работа! Заходи ко мне еще, когда у тебя будут шкуры.
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_SellFur_11_13");	//Но знаешь, меня интересуют только шкуры волков, мракорисов и им подобные.
	};
};


instance DIA_Bosper_Minenanteil(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 3;
	condition = DIA_Bosper_Minenanteil_Condition;
	information = DIA_Bosper_Minenanteil_Info;
	description = "Я вижу, ты продаешь акции шахт.";
};

func int DIA_Bosper_Minenanteil_Condition()
{
	if((hero.guild == GIL_KDF) && (MIS_Serpentes_MinenAnteil_KDF == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Bosper_Minenanteil_Info()
{
	AI_Output(other,self,"DIA_Bosper_Minenanteil_15_00");	//Я вижу, ты продаешь акции шахт.
	AI_Output(self,other,"DIA_Bosper_Minenanteil_11_01");	//Гм. Я ничего не знаю об этом. Ты можешь забрать их, если хочешь.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Bosper_PICKPOCKET(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 900;
	condition = DIA_Bosper_PICKPOCKET_Condition;
	information = DIA_Bosper_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Bosper_PICKPOCKET_Condition()
{
	return C_Beklauen(67,120);
};

func void DIA_Bosper_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Bosper_PICKPOCKET);
	Info_AddChoice(DIA_Bosper_PICKPOCKET,Dialog_Back,DIA_Bosper_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Bosper_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Bosper_PICKPOCKET_DoIt);
};

func void DIA_Bosper_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Bosper_PICKPOCKET);
};

func void DIA_Bosper_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Bosper_PICKPOCKET);
};


instance DIA_BOSPER_BRINGARROW(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 3;
	condition = dia_bosper_bringarrow_condition;
	information = dia_bosper_bringarrow_info;
	permanent = FALSE;
	description = "У меня для тебя письмо.";
};


func int dia_bosper_bringarrow_condition()
{
	if((MIS_LETTERFALK == LOG_Running) && ((Npc_HasItems(hero,itwr_letterfalk) >= 1) || (Npc_HasItems(hero,itwr_letterfalk_open) >= 1)))
	{
		return TRUE;
	};
};

func void dia_bosper_bringarrow_info()
{
	AI_Output(other,self,"DIA_Bosper_BringArrow_01_00");	//У меня для тебя письмо от охотника Фалька.
	AI_Output(self,other,"DIA_Bosper_BringArrow_01_03");	//Ну, тогда давай его сюда.
	if(Npc_HasItems(hero,itwr_letterfalk) >= 1)
	{
		B_GivePlayerXP(150);
		B_GiveInvItems(other,self,itwr_letterfalk,1);
		B_UseFakeScroll();
		AI_Output(self,other,"DIA_Bosper_BringArrow_01_05");	//Ага! Все ясно. Думаю, с этим заказом не будет никаких проблем.
		AI_Output(self,other,"DIA_Bosper_BringArrow_01_06");	//Вот, возьми эти стрелы и отнеси их Фальку.
		B_GiveInvItems(self,other,ITRW_ZUNTARROW,100);
		Npc_RemoveInvItems(self,itwr_letterfalk,1);
		AI_Output(self,other,"DIA_Bosper_BringArrow_01_07");	//И смотри не потеряй их...(серьезно) Иначе за это он тебе спасибо не скажет!
		B_LogEntry(TOPIC_LETTERFALK,"Торговец Боспер прочитал письмо, а потом вручил мне сто стрел, которые я должен отнести Фальку.");
		BOSPERGIVEARROWS = TRUE;
		AI_StopProcessInfos(self);
	}
	else if(Npc_HasItems(hero,itwr_letterfalk_open) >= 1)
	{
		B_GiveInvItems(other,self,itwr_letterfalk_open,1);
		Npc_RemoveInvItems(self,itwr_letterfalk_open,1);
		AI_Output(self,other,"DIA_Bosper_BringArrow_01_13");	//Так, посмотрим, что он пишет. Но постой, его письмо... оно же вскрыто! Печать сломана!
		AI_Output(other,self,"DIA_Bosper_BringArrow_01_14");	//Правда?! Я не знаю, как так случилось.
		AI_Output(self,other,"DIA_Bosper_BringArrow_01_17");	//Не держи меня за идиота, мальчик! (гневно) Такого не может быть!
		AI_Output(self,other,"DIA_Bosper_BringArrow_01_18");	//Так что лучше убирайся с моих глаз, пока я не испытал на тебе свой новый лук.
		AI_Output(self,other,"DIA_Bosper_BringArrow_01_19");	//От меня ты ничего не получишь. Прочь!
		B_LogEntry(TOPIC_LETTERFALK,"Торговец Боспер выставил меня за дверь, когда увидел, что предназначавшееся для него письмо вскрыто. Теперь не остается ничего другого, как сказать об этом самому Фальку.");
		BOSPERREFUSEARROW = TRUE;
		AI_StopProcessInfos(self);
	};
};


instance DIA_BOSPER_SHADOWBOW(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 1;
	condition = dia_bosper_shadowbow_condition;
	information = dia_bosper_shadowbow_info;
	permanent = FALSE;
	description = "Тебе знаком этот лук?";
};

func int dia_bosper_shadowbow_condition()
{
	if((MIS_HUNTERCHALLANGE == LOG_SUCCESS) && (Npc_HasItems(hero,itrw_shadowbow) >= 1) && (TakeShadowBow == TRUE))
	{
		return TRUE;
	};
};

func void dia_bosper_shadowbow_info()
{
	AI_Output(other,self,"DIA_Bosper_ShadowBow_01_00");	//Тебе знаком этот лук?
	AI_Output(self,other,"DIA_Bosper_ShadowBow_01_01");	//Хммм, кереновый лук...(разглядывая) Конечно знаком - его трудно спутать с какой-либо другой вещью.
	AI_Output(self,other,"DIA_Bosper_ShadowBow_01_02");	//Правда, я пока не очень понимаю, что этот лук делает у тебя?!
	AI_Output(other,self,"DIA_Bosper_ShadowBow_01_03");	//Мне подарил его Фальк.
	AI_Output(self,other,"DIA_Bosper_ShadowBow_01_04");	//Фальк?! Хммм...(удивленно) Тогда это может означать только одно - у нас появился еще один великий охотник!
	AI_Output(self,other,"DIA_Bosper_ShadowBow_01_06");	//Тогда прими мои поздравления, приятель! Поверь мне: лишь единицы удостаивались этой чести!
	if(Player_IsApprentice == APP_Bosper)
	{
		AI_Output(self,other,"DIA_Bosper_ShadowBow_01_07");	//Хотя я никогда и не сомневался в том, что ты сможешь достигнуть подобных высот.
		AI_Output(self,other,"DIA_Bosper_ShadowBow_01_10");	//Я это понял еще тогда, когда ты первый раз зашел в мою лавку.
		AI_Output(self,other,"DIA_Bosper_ShadowBow_01_11");	//И сейчас очень рад тому, что принял тогда решение взять тебя к себе в ученики.
	};
	AI_Output(self,other,"DIA_Bosper_ShadowBow_01_14");	//И тебе, видимо, нужны стрелы для этого лука.
	AI_Output(self,other,"DIA_Bosper_ShadowBow_01_16");	//Я смогу их сделать для тебя.
	AI_Output(self,other,"DIA_Bosper_ShadowBow_01_17");	//Правда, это будет не бесплатно.
	AI_Output(self,other,"DIA_Bosper_ShadowBow_01_18");	//За свою работу я с тебя ничего не возьму, но за материал для этих стрел тебе придется заплатить.
	BOSPERMAKESHADOWARROW = TRUE;
};

instance DIA_Bosper_ShadowBowArrowMake(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 1;
	condition = DIA_Bosper_ShadowBowArrowMake_condition;
	information = DIA_Bosper_ShadowBowArrowMake_info;
	permanent = FALSE;
	description = "А сам я их делать могу?";
};

func int DIA_Bosper_ShadowBowArrowMake_condition()
{
	if((BOSPERMAKESHADOWARROW == TRUE) && (Player_IsApprentice == APP_Bosper) && (KNOWHOWTOMAKEARROWS == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Bosper_ShadowBowArrowMake_info()
{
	AI_Output(other,self,"DIA_Bosper_ShadowBowArrowMake_01_00");	//А сам я их делать могу?
	AI_Output(self,other,"DIA_Bosper_ShadowBowArrowMake_01_01");	//(задумчиво) Изготовление подобных стрел на самом деле - большой секрет!
	AI_Output(self,other,"DIA_Bosper_ShadowBowArrowMake_01_02");	//Но раз уж так вышло, что ты мой ученик... так уж и быть.
	AI_Output(self,other,"DIA_Bosper_ShadowBowArrowMake_01_03");	//Я расскажу тебе, как изготовить кереновые стрелы.
	AI_Output(self,other,"DIA_Bosper_ShadowBowArrowMake_01_04");	//Но тебе за это придется заплатить. Бесплатно я не стану этому учить.
	Log_CreateTopic(TOPIC_TALENTMAKEARROWS,LOG_NOTE);
	B_LogEntry(TOPIC_TALENTMAKEARROWS,"Поскольку я ученик Боспера, он может обучить меня изготовлению кереновых стрел.");
};

instance DIA_Bosper_ShadowBowArrowMakeDone(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 5;
	condition = DIA_Bosper_ShadowBowArrowMakeDone_condition;
	information = DIA_Bosper_ShadowBowArrowMakeDone_info;
	permanent = TRUE;
	description = "Научи меня изготавливать кереновые стрелы. (Очки обучения: 5, Цена: 3000 монет)";
};

func int DIA_Bosper_ShadowBowArrowMakeDone_condition()
{
	if(Npc_KnowsInfo(other,DIA_Bosper_ShadowBowArrowMake) && (KNOWHOWTOMAKEARROWSKER == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bosper_ShadowBowArrowMakeDone_info()
{
	var int kosten;
	var int money;

	kosten = 5;
	money = 3000;

	AI_Output(other,self,"DIA_Bosper_ShadowBowArrowMakeDone_01_00");	//Научи меня изготавливать кереновые стрелы.

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		B_Say(self,other,"$NOLEARNNOPOINTS");
		AI_StopProcessInfos(self);
	}
	else if(Npc_HasItems(other,ItMi_Gold) < money)
	{
		AI_Print(Print_NotEnoughGold);
		AI_Output(self,other,"DIA_Bosper_ShadowBowArrowMakeDone_03_90");	//У тебя не хватает золота для обучения! Приходи позже.
		AI_StopProcessInfos(self);
	};
	if((hero.lp >= kosten) && (Npc_HasItems(other,ItMi_Gold) >= money))
	{
		AI_Output(self,other,"DIA_Bosper_ShadowBowArrowMakeDone_01_01");	//Хорошо. Слушай внимательно.
		AI_Output(self,other,"DIA_Bosper_ShadowBowArrowMakeDone_01_02");	//Секрет кереновых стрел кроется в их идеальном балансе.
		AI_Output(self,other,"DIA_Bosper_ShadowBowArrowMakeDone_01_03");	//Именно он позволяет этим стрелам лететь намного дальше обычных и пробивать самые прочные доспехи.
		AI_Output(self,other,"DIA_Bosper_ShadowBowArrowMakeDone_01_04");	//Их древка делаются из обычной древесины, а вот наконечники куются из магической руды, вместо обычной железной.
		AI_Output(self,other,"DIA_Bosper_ShadowBowArrowMakeDone_01_05");	//А так, собственно, и все.
		hero.lp = hero.lp - kosten;
		Npc_RemoveInvItems(other,ItMi_Gold,money);
		RankPoints = RankPoints + kosten;
		Npc_SetTalentSkill(hero,NPC_TALENT_MAKEARROWS,1);
		AI_Print("Изучен рецепт изготовления - 'Кереновые стрелы'");
		KNOWHOWTOMAKEARROWSKER = TRUE;
		Snd_Play("LevelUP");
		Log_CreateTopic(TOPIC_TALENTMAKEARROWS,LOG_NOTE);
		B_LogEntry(TOPIC_TALENTMAKEARROWS,"Для изготовления кереновых стрел мне понадобится древко стрелы, наконечник, выкованный из магической руды, и перо гарпии, в количестве одного стака на полсотни стрел.");
	};
};

instance DIA_BOSPER_SHADOWBOWARROW(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 1;
	condition = dia_bosper_shadowbowarrow_condition;
	information = dia_bosper_shadowbowarrow_info;
	permanent = TRUE;
	description = "Мне нужны стрелы для керенового лука.";
};


func int dia_bosper_shadowbowarrow_condition()
{
	if((BOSPERMAKESHADOWARROW == TRUE) && (BOSPERMAKESHADOWARROWPROGRESS == FALSE))
	{
		return TRUE;
	};
};

func void dia_bosper_shadowbowarrow_info()
{
	AI_Output(other,self,"DIA_Bosper_ShadowBowArrow_01_00");	//Мне нужны стрелы для керенового лука.
	AI_Output(self,other,"DIA_Bosper_ShadowBowArrow_01_01");	//Нет проблем! Если, конечно, у тебя есть золото.
	if(KNOWSHADOWBOWARROW == FALSE)
	{
		AI_Output(other,self,"DIA_Bosper_ShadowBowArrow_01_02");	//Сколько?
		AI_Output(self,other,"DIA_Bosper_ShadowBowArrow_01_03");	//Думаю, двухсот золотых монет будет вполне достаточно.
		KNOWSHADOWBOWARROW = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_ShadowBowArrow_01_04");	//Ты мою цену знаешь - двести золотых монет.
	};
	Info_ClearChoices(dia_bosper_shadowbowarrow);
	Info_AddChoice(dia_bosper_shadowbowarrow,"Пожалуй, в другой раз.",dia_bosper_shadowbowarrow_no);
	if(Npc_HasItems(hero,ItMi_Gold) >= 200)
	{
		Info_AddChoice(dia_bosper_shadowbowarrow,"Вот твое золото.",dia_bosper_shadowbowarrow_yes);
	};
};

func void dia_bosper_shadowbowarrow_no()
{
	AI_Output(other,self,"DIA_Bosper_ShadowBowArrow_No_01_00");	//Пожалуй, в другой раз.
	AI_Output(self,other,"DIA_Bosper_ShadowBowArrow_No_01_01");	//Как скажешь.
	Info_ClearChoices(dia_bosper_shadowbowarrow);
};

func void dia_bosper_shadowbowarrow_yes()
{
	AI_Output(other,self,"DIA_Bosper_ShadowBowArrow_Yes_01_00");	//Вот твое золото.
	B_GiveInvItems(other,self,ItMi_Gold,200);
	AI_Output(self,other,"DIA_Bosper_ShadowBowArrow_Yes_01_01");	//Отлично! Тогда я немедленно приступаю к работе.
	AI_Output(other,self,"DIA_Bosper_ShadowBowArrow_Yes_01_02");	//Когда будут готовы мои стрелы?
	AI_Output(self,other,"DIA_Bosper_ShadowBowArrow_Yes_01_03");	//Думаю, до завтрашнего полудня управлюсь с твоим заказом. Так что придется немного подождать.
	BOSPERMAKESHADOWARROWPROGRESS = TRUE;
	TIMER_SHADOWBOWARROW = Wld_GetDay();
	Info_ClearChoices(dia_bosper_shadowbowarrow);
};


instance DIA_BOSPER_SHADOWBOWARROWDONE(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 1;
	condition = dia_bosper_shadowbowarrowdone_condition;
	information = dia_bosper_shadowbowarrowdone_info;
	permanent = TRUE;
	description = "Как поживает мой заказ?";
};


func int dia_bosper_shadowbowarrowdone_condition()
{
	if((BOSPERMAKESHADOWARROW == TRUE) && (BOSPERMAKESHADOWARROWPROGRESS == TRUE))
	{
		return TRUE;
	};
};

func void dia_bosper_shadowbowarrowdone_info()
{
	var int daynow;
	daynow = Wld_GetDay();
	AI_Output(other,self,"DIA_Bosper_ShadowBowArrowDone_01_00");	//Как поживает мой заказ?

	if(TIMER_SHADOWBOWARROW < daynow)
	{
		if(Wld_IsTime(12,0,23,59) || (TIMER_SHADOWBOWARROW < (daynow - 1)))
		{
			AI_Output(self,other,"DIA_Bosper_ShadowBowArrowDone_01_01");	//Все готово! Вот, держи - тут пятьдесят кереновых стрел лучшего качества!
			B_GiveInvItems(self,other,ITRW_MYHUNTARROW,50);
			AI_Output(self,other,"DIA_Bosper_ShadowBowArrowDone_01_04");	//Но если тебе понадобятся еще, можешь смело обращаться ко мне.
			BOSPERMAKESHADOWARROWPROGRESS = FALSE;
			TIMER_SHADOWBOWARROW = 0;
		}
		else
		{
			AI_Output(self,other,"DIA_Bosper_ShadowBowArrowDone_01_06");	//Пока еще не готов. Приходи позже!
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_ShadowBowArrowDone_01_06");	//Пока еще не готов. Приходи позже!
	};
};

var int BosperBuyMace;

instance DIA_Bosper_CanBuyGoblinWeapon(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 3;
	condition = DIA_Bosper_CanBuyGoblinWeapon_Condition;
	information = DIA_Bosper_CanBuyGoblinWeapon_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Bosper_CanBuyGoblinWeapon_Condition()
{
	if(Player_IsApprentice != APP_NONE)
	{
		return TRUE;
	};
};

func void DIA_Bosper_CanBuyGoblinWeapon_Info()
{
	AI_Output(self,other,"DIA_Bosper_CanBuyGoblinWeapon_01_00");	//Постой! У меня к тебе есть одно предложение.
	AI_Output(other,self,"DIA_Bosper_CanBuyGoblinWeapon_01_01");	//Я тебя слушаю.
	AI_Output(self,other,"DIA_Bosper_CanBuyGoblinWeapon_01_02");	//Если тебе попадутся гоблинские палки, то я бы мог выменять их у тебя на стрелы!
	AI_Output(other,self,"DIA_Bosper_CanBuyGoblinWeapon_01_03");	//А зачем тебе это?
	AI_Output(self,other,"DIA_Bosper_CanBuyGoblinWeapon_01_04");	//Понимаешь, хотя гоблины и кажутся весьма примитивными созданиями, но на самом деле это вовсе не так.
	AI_Output(self,other,"DIA_Bosper_CanBuyGoblinWeapon_01_05");	//Для своих дубинок они выбирают самые ровные ветви и тщательно высушивают их.
	AI_Output(self,other,"DIA_Bosper_CanBuyGoblinWeapon_01_06");	//Из одной такой дубинки можно сделать несколько отличных стрел, причем без предварительной просушки.
	AI_Output(self,other,"DIA_Bosper_CanBuyGoblinWeapon_01_07");	//Палку гоблина всего лишь нужно расщепить и немного обработать. Для такого мастера, как я, это не представляет большого труда.
	AI_Output(other,self,"DIA_Bosper_CanBuyGoblinWeapon_01_08");	//И как же ты это делаешь?
	AI_Output(self,other,"DIA_Bosper_CanBuyGoblinWeapon_01_09");	//Если я буду рассказывать обо всех тонкостях моего ремесла всем подряд, то вскоре мне придется идти на улицу попрошайничать.
	AI_Output(self,other,"DIA_Bosper_CanBuyGoblinWeapon_01_10");	//Но мы можем заключить с тобой выгодную сделку! Ты приносишь мне палки гоблинов, а я тебе даю за них готовые стрелы.
	AI_Output(self,other,"DIA_Bosper_CanBuyGoblinWeapon_01_11");	//Разумеется, ты получишь меньше стрел, чем я сделаю из одной палки. Но, учитывая обработку и оперение для стрел, - это будет честный обмен!
	AI_Output(other,self,"DIA_Bosper_CanBuyGoblinWeapon_01_12");	//И сколько стрел я получу за одну палку?
	AI_Output(self,other,"DIA_Bosper_CanBuyGoblinWeapon_01_13");	//(задумчиво) Ну, скажем, я дам тебе две хороших стрелы моего производства. Ну как, согласен?
	AI_Output(other,self,"DIA_Bosper_CanBuyGoblinWeapon_01_14");	//Хорошо, я буду иметь в виду.
	BosperBuyMace = TRUE;
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,"Боспер скупает деревянные палки гоблинов. За одну палку он даст две стрелы.");
};

instance DIA_Bosper_BuyGoblinWeapon(C_Info)
{
	npc = VLK_413_Bosper;
	nr = 3;
	condition = DIA_Bosper_BuyGoblinWeapon_Condition;
	information = DIA_Bosper_BuyGoblinWeapon_Info;
	permanent = TRUE;
	description = "У меня тут есть несколько палок гоблинов для тебя.";
};

func int DIA_Bosper_BuyGoblinWeapon_Condition()
{
	if((BosperBuyMace == TRUE) && (Npc_HasItems(hero,ItMw_1h_Bau_Mace) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Bosper_BuyGoblinWeapon_Info()
{
	var int allarrow;

	allarrow = Npc_HasItems(hero,ItMw_1h_Bau_Mace);
	Npc_RemoveInvItems(hero,ItMw_1h_Bau_Mace,allarrow);
	AI_Output(other,self,"DIA_Bosper_BuyGoblinWeapon_01_00");	//У меня тут есть несколько гоблинских палок для тебя.
	AI_Output(self,other,"DIA_Bosper_BuyGoblinWeapon_01_01");	//Так, давай посмотрим, сколько их у тебя...
	AI_Output(self,other,"DIA_Bosper_BuyGoblinWeapon_01_02");	//(считает) Отлично! Я возьму их все.
	AI_Output(self,other,"DIA_Bosper_BuyGoblinWeapon_01_03");	//А вот твои стрелы!
	B_GiveInvItems(self,other,ItRw_Arrow,allarrow * 2);
};