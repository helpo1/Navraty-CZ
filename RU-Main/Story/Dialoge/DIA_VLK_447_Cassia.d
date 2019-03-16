
var int CassiaTellsAttila;
var int CassiaRecievePay;

instance DIA_Cassia_EXIT(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 999;
	condition = DIA_Cassia_EXIT_Condition;
	information = DIA_Cassia_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Cassia_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Cassia_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Cassia_PICKME(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 900;
	condition = DIA_Cassia_PICKME_Condition;
	information = DIA_Cassia_PICKME_Info;
	permanent = TRUE;
	description = Pickpocket_100_Female;
};

func int DIA_Cassia_PICKME_Condition()
{
	return C_Beklauen(100,400);
};

func void DIA_Cassia_PICKME_Info()
{
	Info_ClearChoices(DIA_Cassia_PICKME);
	Info_AddChoice(DIA_Cassia_PICKME,Dialog_Back,DIA_Cassia_PICKME_BACK);
	Info_AddChoice(DIA_Cassia_PICKME,DIALOG_PICKPOCKET,DIA_Cassia_PICKME_DoIt);
};

func void DIA_Cassia_PICKME_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= 100)
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		}
		else
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		};
		B_GiveInvItems(self,other,ItMi_Gold,80);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		BELIARPRAYCOUNT = BELIARPRAYCOUNT + 1;
		B_GiveThiefXP();
		Info_ClearChoices(dia_lord_hagen_pickpocket);
	}
	else
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		};
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
};

func void DIA_Cassia_PICKME_BACK()
{
	Info_ClearChoices(DIA_Cassia_PICKME);
};


instance DIA_Cassia_Gilde(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 1;
	condition = DIA_Cassia_Gilde_Condition;
	information = DIA_Cassia_Gilde_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Cassia_Gilde_Condition()
{
	if((Cassia_Gildencheck == TRUE) && (Join_Thiefs == TRUE) && ((other.guild == GIL_MIL) || (other.guild == GIL_PAL) || (other.guild == GIL_KDF)))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Gilde_Info()
{
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Cassia_Gilde_16_00");	//Я вижу, ты стал служителем закона и порядка.
		AI_Output(self,other,"DIA_Cassia_Gilde_16_01");	//Но то, что ты теперь служишь Инносу, для нас значения не имеет. Ты один из нас. И я надеюсь, что ты это тоже понимаешь.
	};
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Cassia_Gilde_16_02");	//Так ты теперь служитель церкви Инноса? Отлично. Но ты помимо этого один из нас - надеюсь, ты никогда это не забудешь.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Cassia_Abgelaufen(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = DIA_Cassia_Abgelaufen_Condition;
	information = DIA_Cassia_Abgelaufen_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Cassia_Abgelaufen_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Cassia_Frist == TRUE) && (Cassia_Day < (B_GetDayPlus() - 2)) && (Join_Thiefs != TRUE))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Abgelaufen_Info()
{
	AI_Output(self,other,"DIA_Cassia_Abgelaufen_16_00");	//Твой срок истек! Тебе не следовало возвращаться.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,0);
};


instance DIA_Cassia_News(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 1;
	condition = DIA_Cassia_News_Condition;
	information = DIA_Cassia_News_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Cassia_News_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Cassia_News_Info()
{
	if(MIS_ThiefGuild_sucked == FALSE)
	{
		AI_Output(self,other,"DIA_Cassia_News_16_00");	//Я вижу, ты получил наш подарок! Я Кассия.
		AI_Output(other,self,"DIA_Cassia_News_15_01");	//Хорошо, Кассия. Теперь скажи мне, зачем я здесь?
		AI_Output(self,other,"DIA_Cassia_News_16_02");	//Ты привлек наше внимание тем, что завоевал доверие одного из наших друзей.
		AI_Output(self,other,"DIA_Cassia_News_16_03");	//И мы хотим дать тебе шанс. Ты можешь присоединиться к нам.
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_News_16_04");	//Только посмотрите, кто нашел дорогу сюда! Аттила недооценил тебя...но я не сделаю такой ошибки.
		AI_Output(other,self,"DIA_Cassia_News_15_05");	//Что это за игры?
		AI_Output(self,other,"DIA_Cassia_News_16_06");	//Мы хотели, чтобы ты умер за то, что сдал одного из наших друзей. Вот почему мы послали Аттилу.
		AI_Output(self,other,"DIA_Cassia_News_16_07");	//Твое присутствие здесь, однако, открывает новые возможности...
		AI_Output(other,self,"DIA_Cassia_News_15_08");	//... что ты хочешь предложить мне?
		AI_Output(self,other,"DIA_Cassia_News_16_09");	//Ты можешь присоединиться к нам.
	};
	if((other.guild == GIL_NONE) || (other.guild == GIL_NOV))
	{
		Cassia_Gildencheck = TRUE;
	};
	DG_gefunden = TRUE;
};


instance DIA_Cassia_mehr(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = DIA_Cassia_mehr_Condition;
	information = DIA_Cassia_mehr_Info;
	permanent = FALSE;
	description = "Расскажи мне о вашей организации.";
};

func int DIA_Cassia_mehr_Condition()
{
	return TRUE;
};

func void DIA_Cassia_mehr_Info()
{
	AI_Output(other,self,"DIA_Cassia_mehr_15_00");	//Расскажи мне о вашей организации.
	AI_Output(self,other,"DIA_Cassia_mehr_16_01");	//Горожане недолюбливают нас. Но никто не знает, где находится наше укрытие.
	AI_Output(self,other,"DIA_Cassia_mehr_16_02");	//Те немногие, что вообще знают, что канализация существует, полагают, что она закрыта, и в нее невозможно попасть.
	AI_Output(self,other,"DIA_Cassia_mehr_16_03");	//И пока они не найдут нас, мы можем работать спокойно.
};


instance DIA_Cassia_MissingPeople(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = DIA_Cassia_MissingPeople_Condition;
	information = DIA_Cassia_MissingPeople_Info;
	permanent = FALSE;
	description = "Что ты знаешь о пропавших людях?";
};

func int DIA_Cassia_MissingPeople_Condition()
{
	if((SC_HearedAboutMissingPeople == TRUE) && (MissingPeopleReturnedHome == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Cassia_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Cassia_Add_15_00");	//Что ты знаешь о пропавших людях?
	AI_Output(self,other,"DIA_Addon_Cassia_Add_16_01");	//А почему это так интересует тебя?
	AI_Output(other,self,"DIA_Addon_Cassia_Add_15_02");	//Я хочу выяснить, что случилось с ними.
	AI_Output(self,other,"DIA_Addon_Cassia_Add_16_03");	//Когда выйдешь из канализации, плыви вдоль побережья вправо.
	AI_Output(self,other,"DIA_Addon_Cassia_Add_16_04");	//Там ты найдешь ответы на интересующие тебя вопросы...
};

instance DIA_Cassia_Vorteil(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 3;
	condition = DIA_Cassia_Vorteil_Condition;
	information = DIA_Cassia_Vorteil_Info;
	permanent = FALSE;
	description = "А какая мне выгода от присоединения к вам?";
};

func int DIA_Cassia_Vorteil_Condition()
{
	return TRUE;
};

func void DIA_Cassia_Vorteil_Info()
{
	AI_Output(other,self,"DIA_Cassia_Vorteil_15_00");	//А какая мне выгода от присоединения к вам?
	AI_Output(self,other,"DIA_Cassia_Vorteil_16_01");	//Ты можешь научиться у нас особым навыкам - навыкам, которые позволят тебе жить в роскоши.
	AI_Output(other,self,"DIA_Cassia_Vorteil_15_02");	//Но для этого мне придется скрываться здесь, да?
	AI_Output(self,other,"DIA_Cassia_Vorteil_16_03");	//Нет...(тихо смеется) Тебе только нужно придерживаться наших правил. Вот и все!
};

instance DIA_Cassia_Lernen(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 4;
	condition = DIA_Cassia_Lernen_Condition;
	information = DIA_Cassia_Lernen_Info;
	permanent = FALSE;
	description = "Чему я могу научиться у вас?";
};

func int DIA_Cassia_Lernen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Cassia_Vorteil))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Lernen_Info()
{
	AI_Output(other,self,"DIA_Cassia_Lernen_15_00");	//Чему я могу научиться у вас?
	AI_Output(self,other,"DIA_Cassia_Lernen_16_01");	//Джеспер может научить тебя передвигаться бесшумно.
	AI_Output(self,other,"DIA_Cassia_Lernen_16_98");	//Кроме того, у него ты сможешь разжиться приличным доспехом.
	AI_Output(self,other,"DIA_Cassia_Lernen_16_02");	//Рамирез - чрезвычайно одаренный медвежатник! Ни один замок не устоит перед его отмычками.
	AI_Output(self,other,"DIA_Cassia_Lernen_77_11");	//Но самое главное - он может обучить тебя изготовлению воровского оружия.
	AI_Output(self,other,"DIA_Cassia_Lernen_16_03");	//А я могу научить тебя карманному воровству.
	AI_Output(self,other,"DIA_Cassia_Lernen_16_04");	//Также я могу помочь тебе стать более ловким! Именно ловкость - ключ к воровским способностям.
	AI_Output(self,other,"DIA_Cassia_Lernen_16_99");	//Кроме того, я могу показать, как правильно управлять своим телом в движении.
	AI_Output(self,other,"DIA_Cassia_Lernen_16_97");	//Очень важный навык. Особенно в ситуации, если тебя застали врасплох, и надо быстро среагировать на опасность. 
	Log_CreateTopic(TOPIC_ThiefTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_ThiefTeacher,"Кассия сможет обучить меня карманному воровству, акробатике или просто помочь мне стать более ловким.");
	B_LogEntry_Quiet(TOPIC_ThiefTeacher,"Рамирез готов обучить меня пользоваться отмычками. Также он сможет показать мне, как изготавливать воровское оружие.");
	B_LogEntry_Quiet(TOPIC_ThiefTeacher,"Джеспер покажет мне, как правильно красться. Кроме того я смогу приобрести у него неплохие доспехи.");
};

instance DIA_Cassia_Regeln(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 3;
	condition = DIA_Cassia_Regeln_Condition;
	information = DIA_Cassia_Regeln_Info;
	permanent = FALSE;
	description = "Что у вас за правила?";
};

func int DIA_Cassia_Regeln_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Cassia_Vorteil))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Regeln_Info()
{
	AI_Output(other,self,"DIA_Cassia_Regeln_15_00");	//Что у вас за правила?
	AI_Output(self,other,"DIA_Cassia_Regeln_16_02");	//Первое правило - никому ни слова о нас! Никогда.
	AI_Output(self,other,"DIA_Cassia_Regeln_16_03");	//Второе: не попадайся.
	AI_Output(self,other,"DIA_Cassia_Regeln_16_04");	//Третье: если ты обнажишь оружие здесь, чтобы напасть на кого-нибудь, мы убьем тебя!
	AI_Output(self,other,"DIA_Cassia_Regeln_16_05");	//И четвертое, последнее правило. Тот, кто хочет присоединиться к нам, должен доказать серьезность своих намерений.
};

instance DIA_Cassia_Erwischen(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = DIA_Cassia_Erwischen_Condition;
	information = DIA_Cassia_Erwischen_Info;
	permanent = FALSE;
	description = "Что будет, если меня поймают?";
};

func int DIA_Cassia_Erwischen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Cassia_Regeln))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Erwischen_Info()
{
	AI_Output(other,self,"DIA_Cassia_Erwischen_15_00");	//Что будет, если меня поймают?
	AI_Output(self,other,"DIA_Cassia_Erwischen_16_01");	//Просто не попадайся, хорошо?
};

instance DIA_Cassia_beweisen(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = DIA_Cassia_beweisen_Condition;
	information = DIA_Cassia_beweisen_Info;
	permanent = TRUE;
	description = "Как мне доказать серьезность моих намерений?";
};

var int DIA_Cassia_beweisen_permanent;

func int DIA_Cassia_beweisen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Cassia_Regeln) && (DIA_Cassia_beweisen_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Cassia_beweisen_Info()
{
	AI_Output(other,self,"DIA_Cassia_beweisen_15_00");	//Как мне доказать серьезность моих намерений?

	if(Join_Thiefs == FALSE)
	{
		AI_Output(self,other,"DIA_Cassia_beweisen_16_01");	//Так ты присоединишься к нам или нет?
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_beweisen_16_02");	//У этого упрямого алхимика - Константино, есть прекрасное кольцо!
		AI_Output(self,other,"DIA_Cassia_beweisen_16_03");	//Но оно ему совсем ни к чему. Я хочу, чтобы оно украшало мою руку.
		MIS_CassiaRing = LOG_Running;
		DIA_Cassia_beweisen_permanent = TRUE;
		Log_CreateTopic(Topic_CassiaRing,LOG_MISSION);
		Log_SetTopicStatus(Topic_CassiaRing,LOG_Running);
		B_LogEntry(Topic_CassiaRing,"Кассия хочет, чтобы я принес ей кольцо Константино.");
	};
};

instance DIA_Cassia_Beitreten(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 10;
	condition = DIA_Cassia_Beitreten_Condition;
	information = DIA_Cassia_Beitreten_Info;
	permanent = FALSE;
	description = "Хорошо, я в деле.";
};

func int DIA_Cassia_Beitreten_Condition()
{
	if((Join_Thiefs == FALSE) && Npc_KnowsInfo(other,DIA_Cassia_Regeln))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Beitreten_Info()
{
	AI_Output(other,self,"DIA_Cassia_Beitreten_15_00");	//Хорошо, я в деле.
	AI_Output(self,other,"DIA_Cassia_Beitreten_16_01");	//Отлично! Теперь тебе будет дана возможность проявить себя.
	Join_Thiefs = TRUE;
};

instance DIA_Cassia_Ablehnen(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 9;
	condition = DIA_Cassia_Ablehnen_Condition;
	information = DIA_Cassia_Ablehnen_Info;
	permanent = FALSE;
	description = "А что если я не хочу присоединяться к вам?..";
};

func int DIA_Cassia_Ablehnen_Condition()
{
	if((Join_Thiefs == FALSE) && Npc_KnowsInfo(other,DIA_Cassia_Regeln))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Ablehnen_Info()
{
	AI_Output(other,self,"DIA_Cassia_Ablehnen_15_00");	//А что если я не хочу присоединяться к вам?

	if(MIS_ThiefGuild_sucked == FALSE)
	{
		AI_Output(self,other,"DIA_Cassia_Ablehnen_16_01");	//Ты теряешь шанс, который дается один раз в жизни, но ты можешь идти.
		AI_Output(self,other,"DIA_Cassia_Ablehnen_16_02");	//И даже не думай предать нас. Ты горько пожалеешь об этом.
		Info_ClearChoices(DIA_Cassia_Ablehnen);
		Info_AddChoice(DIA_Cassia_Ablehnen,"Хорошо, я в деле.",DIA_Cassia_Ablehnen_Okay);
		Info_AddChoice(DIA_Cassia_Ablehnen,"Мне нужно время на размышление.",DIA_Cassia_Ablehnen_Frist);
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_Ablehnen_16_03");	//В таком случае, я убью тебя!
		Info_ClearChoices(DIA_Cassia_Ablehnen);
		Info_AddChoice(DIA_Cassia_Ablehnen,"Хорошо, я в деле.",DIA_Cassia_Ablehnen_Okay);
		Info_AddChoice(DIA_Cassia_Ablehnen,"Ну, тогда попробуй меня убить.",DIA_Cassia_Ablehnen_Kill);
	};
};

func void DIA_Cassia_Ablehnen_Okay()
{
	AI_Output(other,self,"DIA_Cassia_Ablehnen_Okay_15_00");	//Хорошо, я в деле.
	AI_Output(self,other,"DIA_Cassia_Ablehnen_Okay_16_01");	//Ты принял мудрое решение...(улыбается) Если ты сможешь доказать серьезность своих намерений, то сможешь влиться в наши ряды.
	Join_Thiefs = TRUE;
	Info_ClearChoices(DIA_Cassia_Ablehnen);
};

func void DIA_Cassia_Ablehnen_Kill()
{
	AI_Output(other,self,"DIA_Cassia_Ablehnen_Kill_15_00");	//Ну, тогда попробуй меня убить.
	AI_Output(self,other,"DIA_Cassia_Ablehnen_Kill_16_01");	//Жаль...(спокойно) Я думала, ты умнее.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Cassia_Ablehnen_Frist()
{
	AI_Output(other,self,"DIA_Cassia_Ablehnen_Frist_15_00");	//Мне нужно время на размышление.
	AI_Output(self,other,"DIA_Cassia_Ablehnen_Frist_16_01");	//Пожалуйста! Я дам тебе два дня на принятие этого решения. После этого, тебе лучше не появляться здесь.
	Cassia_Day = B_GetDayPlus();
	Cassia_Frist = TRUE;
	Info_ClearChoices(DIA_Cassia_Ablehnen);
};

instance DIA_Cassia_BevorLernen(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 5;
	condition = DIA_Cassia_BevorLernen_Condition;
	information = DIA_Cassia_BevorLernen_Info;
	permanent = FALSE;
	description = "Ты можешь обучить меня?";
};

func int DIA_Cassia_BevorLernen_Condition()
{
	if(IS_LOVCACH == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Cassia_BevorLernen_Info()
{
	AI_Output(other,self,"DIA_Cassia_BevorLernen_15_00");		//Ты можешь обучить меня?
	AI_Output(self,other,"DIA_Cassia_BevorLernen_900_02");	//Конечно! Ведь, ты теперь один из нас.
	Cassia_TeachPickpocket = TRUE;
	Cassia_TeachDEX = TRUE;
	Cassia_TeachAcrobat = TRUE;
};

instance DIA_Cassia_TEACH(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 12;
	condition = DIA_Cassia_TEACH_Condition;
	information = DIA_Cassia_TEACH_Info;
	permanent = TRUE;
	description = "Я хочу стать более ловким.";
};

func int DIA_Cassia_TEACH_Condition()
{
	if(Cassia_TeachDEX == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Cassia_TEACH_Info()
{
	AI_Output(other,self,"DIA_Cassia_TEACH_15_00");	//Я хочу стать более ловким.

	if((AttilaIsDead == TRUE) && (CassiaRecievePay == FALSE))
	{
		if(CassiaTellsAttila == FALSE)
		{
			AI_Output(self,other,"DIA_Cassia_Pickpocket_16_05");	//Не так быстро, друг мой. Прежде чем мы начнем наше обучение, ты должен кое-что сделать.
			AI_Output(other,self,"DIA_Cassia_Pickpocket_16_06");	//Что именно?
			AI_Output(self,other,"DIA_Cassia_Pickpocket_16_07");	//Заплатить мне небольшую компенсацию за смерть Аттилы.
			AI_Output(self,other,"DIA_Cassia_Pickpocket_16_08");	//Он выполнял для меня довольно важные поручения и теперь с некоторыми из них могут возьникнуть проблемы.
			AI_Output(other,self,"DIA_Cassia_Pickpocket_16_09");	//И сколько ты хочешь?
			AI_Output(self,other,"DIA_Cassia_Pickpocket_16_10");	//Думаю, тысячи золотых монет вполне хватит, чтобы забыть об этом недоразумении.
			CassiaTellsAttila = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Cassia_Pickpocket_16_11");	//Так как насчет небольшой компенсации?
		};

		Info_ClearChoices(DIA_Cassia_TEACH);

		if(Npc_HasItems(other,ItMi_Gold) >= 1000)
		{
			Info_AddChoice(DIA_Cassia_TEACH,"Хорошо, вот твои деньги.",DIA_Cassia_TEACH_Ok);
		};

		Info_AddChoice(DIA_Cassia_TEACH,"У меня нет таких денег.",DIA_Cassia_TEACH_No);
		Info_AddChoice(DIA_Cassia_TEACH,"А не пойти ли тебе куда подальше?",DIA_Cassia_TEACH_Damn);

		if(RhetorikSkillValue[1] >= 10)
		{
			Info_AddChoice(DIA_Cassia_TEACH,"У меня на этот счет иное мнение.",DIA_Cassia_TEACH_Agreed);
		};
	}
	else
	{
		Info_ClearChoices(DIA_Cassia_TEACH);
		Info_AddChoice(DIA_Cassia_TEACH,Dialog_Back,DIA_Cassia_TEACH_BACK);
		Info_AddChoice(DIA_Cassia_TEACH,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Cassia_TEACH_1);
		Info_AddChoice(DIA_Cassia_TEACH,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Cassia_TEACH_5);
	};
};

func void DIA_Cassia_TEACH_BACK()
{
	Info_ClearChoices(DIA_Cassia_TEACH);
};

func void DIA_Cassia_TEACH_1()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,T_MAX);
	Info_ClearChoices(DIA_Cassia_TEACH);
	Info_AddChoice(DIA_Cassia_TEACH,Dialog_Back,DIA_Cassia_TEACH_BACK);
	Info_AddChoice(DIA_Cassia_TEACH,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Cassia_TEACH_1);
	Info_AddChoice(DIA_Cassia_TEACH,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Cassia_TEACH_5);
};

func void DIA_Cassia_TEACH_5()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,T_MAX);
	Info_ClearChoices(DIA_Cassia_TEACH);
	Info_AddChoice(DIA_Cassia_TEACH,Dialog_Back,DIA_Cassia_TEACH_BACK);
	Info_AddChoice(DIA_Cassia_TEACH,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Cassia_TEACH_1);
	Info_AddChoice(DIA_Cassia_TEACH,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Cassia_TEACH_5);
};

instance DIA_Cassia_Pickpocket(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 10;
	condition = DIA_Cassia_Pickpocket_Condition;
	information = DIA_Cassia_Pickpocket_Info;
	permanent = TRUE;
	description = "Научи меня карманному воровству. (Очки обучения: 10)";
};

func int DIA_Cassia_Pickpocket_Condition()
{
	if((Cassia_TeachPickpocket == TRUE) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == FALSE) && (MIS_CassiaRing == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Pickpocket_Info()
{
	AI_Output(other,self,"DIA_Cassia_Pickpocket_15_00");	//Научи меня карманному воровству.

	if((AttilaIsDead == TRUE) && (CassiaRecievePay == FALSE))
	{
		if(CassiaTellsAttila == FALSE)
		{
			AI_Output(self,other,"DIA_Cassia_Pickpocket_16_05");	//Не так быстро, друг мой. Прежде чем мы начнем наше обучение, ты должен кое-что сделать.
			AI_Output(other,self,"DIA_Cassia_Pickpocket_16_06");	//Что именно?
			AI_Output(self,other,"DIA_Cassia_Pickpocket_16_07");	//Заплатить мне небольшую компенсацию за смерть Аттилы.
			AI_Output(self,other,"DIA_Cassia_Pickpocket_16_08");	//Он выполнял для меня довольно важные поручения и теперь с некоторыми из них могут возьникнуть проблемы.
			AI_Output(other,self,"DIA_Cassia_Pickpocket_16_09");	//И сколько ты хочешь?
			AI_Output(self,other,"DIA_Cassia_Pickpocket_16_10");	//Думаю, тысячи золотых монет вполне хватит, чтобы забыть об этом недоразумении.
			CassiaTellsAttila = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Cassia_Pickpocket_16_11");	//Так как насчет небольшой компенсации?
		};

		Info_ClearChoices(DIA_Cassia_Pickpocket);

		if(Npc_HasItems(other,ItMi_Gold) >= 1000)
		{
			Info_AddChoice(DIA_Cassia_Pickpocket,"Хорошо, вот твои деньги.",DIA_Cassia_Pickpocket_Ok);
		};

		Info_AddChoice(DIA_Cassia_Pickpocket,"У меня нет таких денег.",DIA_Cassia_Pickpocket_No);
		Info_AddChoice(DIA_Cassia_Pickpocket,"А не пойти ли тебе куда подальше?",DIA_Cassia_Pickpocket_Damn);

		if(RhetorikSkillValue[1] >= 10)
		{
			Info_AddChoice(DIA_Cassia_Pickpocket,"У меня на этот счет иное мнение.",DIA_Cassia_Pickpocket_Agreed);
		};
	}
	else
	{
		if(b_teachthieftalentfree(self,other,NPC_TALENT_PICKPOCKET))
		{
			AI_Output(self,other,"DIA_Cassia_Pickpocket_16_01");	//Если ты хочешь обчистить чьи-нибудь карманы, отвлеки его. Просто начни говорить с ним, поболтай.
			AI_Output(self,other,"DIA_Cassia_Pickpocket_16_02");	//А когда будешь разговаривать, оцени его. Обращай внимание на оттопыривающиеся карманы, драгоценности или кожаный шнурок на шее. И, самое главное, попытайся оценить, насколько он осторожен.
			AI_Output(self,other,"DIA_Cassia_Pickpocket_16_03");	//Обокрасть пьяного поденного рабочего - это далеко не то же самое, что украсть у бдительного торговца. Помни об этом.
			AI_Output(self,other,"DIA_Cassia_Pickpocket_16_04");	//Если ты неуклюж, он, конечно же, почувствует недоброе. И, превыше всего: всегда сохраняй хладнокровие!
		};
	};
};

var int CassiaAcrobatPerm;

instance DIA_Cassia_Acrobat(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 10;
	condition = DIA_Cassia_Acrobat_Condition;
	information = DIA_Cassia_Acrobat_Info;
	permanent = TRUE;
	description = "Покажи мне, как правильно управлять своим телом. (Очки обучения: 10)";
};

func int DIA_Cassia_Acrobat_Condition()
{
	if((Cassia_TeachAcrobat == TRUE) && (Npc_GetTalentSkill(other,NPC_TALENT_ACROBAT) == FALSE) && (MIS_CassiaRing == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Acrobat_Info()
{
	AI_Output(other,self,"DIA_Cassia_Acrobat_15_00");	//Покажи мне, как правильно управлять своим телом.

	if((AttilaIsDead == TRUE) && (CassiaRecievePay == FALSE))
	{
		if(CassiaTellsAttila == FALSE)
		{
			AI_Output(self,other,"DIA_Cassia_Pickpocket_16_05");	//Не так быстро, друг мой. Прежде чем мы начнем наше обучение, ты должен кое-что сделать.
			AI_Output(other,self,"DIA_Cassia_Pickpocket_16_06");	//Что именно?
			AI_Output(self,other,"DIA_Cassia_Pickpocket_16_07");	//Заплатить мне небольшую компенсацию за смерть Аттилы.
			AI_Output(self,other,"DIA_Cassia_Pickpocket_16_08");	//Он выполнял для меня довольно важные поручения и теперь с некоторыми из них могут возьникнуть проблемы.
			AI_Output(other,self,"DIA_Cassia_Pickpocket_16_09");	//И сколько ты хочешь?
			AI_Output(self,other,"DIA_Cassia_Pickpocket_16_10");	//Думаю, тысячи золотых монет вполне хватит, чтобы забыть об этом недоразумении.
			CassiaTellsAttila = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Cassia_Pickpocket_16_11");	//Так как насчет небольшой компенсации?
		};

		Info_ClearChoices(DIA_Cassia_Acrobat);

		if(Npc_HasItems(other,ItMi_Gold) >= 1000)
		{
			Info_AddChoice(DIA_Cassia_Acrobat,"Хорошо, вот твои деньги.",DIA_Cassia_Acrobat_Ok);
		};

		Info_AddChoice(DIA_Cassia_Acrobat,"У меня нет таких денег.",DIA_Cassia_Acrobat_No);
		Info_AddChoice(DIA_Cassia_Acrobat,"А не пойти ли тебе куда подальше?",DIA_Cassia_Acrobat_Damn);

		if(RhetorikSkillValue[1] >= 10)
		{
			Info_AddChoice(DIA_Cassia_Acrobat,"У меня на этот счет иное мнение.",DIA_Cassia_Acrobat_Agreed);
		};
	}
	else
	{
		if(hero.attribute[ATR_DEXTERITY] >= 120)
		{
			if(B_TeachThiefTalentFree(self,other,NPC_TALENT_ACROBAT))
			{
				AI_Output(self,other,"DIA_Cassia_Acrobat_16_01");	//Когда ты контролируешь свое тело, ты можешь прыгать гораздо дальше.
				AI_Output(self,other,"DIA_Cassia_Acrobat_16_02");	//Я научу тебя откатываться в сторону, покажу, как приземляться после падения.
				AI_Output(self,other,"DIA_Cassia_Acrobat_16_03");	//Но не стоит забывать, что ты все-таки не бессмертный!
				AI_Output(self,other,"DIA_Cassia_Acrobat_16_04");	//Кроме этого, акробатика также очень полезна в бою.
				AI_Output(self,other,"DIA_Cassia_Acrobat_16_05");	//Ты сможешь быстро менять дистанцию между собой и противником.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Cassia_Acrobat_16_98");	//Тебе еще не хватает для этого ловкости.
			AI_Output(self,other,"DIA_Cassia_Acrobat_16_99");	//Поговорим об этом позже.

			if(CassiaAcrobatPerm == FALSE)
			{
				B_LogEntry_Quiet(TOPIC_ThiefTeacher,"Чтобы выучить акробатику, мне необходимо быть более ловким. (Ловкость: 120 и более)");
				CassiaAcrobatPerm = TRUE;
			};
		};
	};
};

func void DIA_Cassia_Pickpocket_Ok()
{
	AI_Output(other,self,"DIA_Cassia_Pickpocket_Ok_16_01");	//Хорошо, вот твои деньги.
	B_GiveInvItems(other,self,ItMi_Gold,1000);
	Npc_RemoveInvItems(self,ItMi_Gold,1000);
	AI_Output(self,other,"DIA_Cassia_Pickpocket_Ok_16_02");	//Отлично! Теперь можно и потренироваться.
	CassiaRecievePay = TRUE;
	Info_ClearChoices(DIA_Cassia_Pickpocket);
};

func void DIA_Cassia_Pickpocket_No()
{
	AI_Output(other,self,"DIA_Cassia_Pickpocket_No_16_01");	//У меня нет таких денег.
	AI_Output(self,other,"DIA_Cassia_Pickpocket_No_16_02");	//Так найди их! Иначе, можешь забыть о своем обучении.
	Info_ClearChoices(DIA_Cassia_Pickpocket);
};

func void DIA_Cassia_Pickpocket_Damn()
{
	AI_Output(other,self,"DIA_Cassia_Pickpocket_Damn_16_01");	//А не пойти ли тебе куда подальше
	AI_Output(self,other,"DIA_Cassia_Pickpocket_Damn_16_02");	//Мне кажется, это было довольно дерзко с твоей стороны.
	AI_Output(self,other,"DIA_Cassia_Pickpocket_Damn_16_03");	//Придется преподать тебе урок хороших манер.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Cassia_Pickpocket_Agreed()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Cassia_Pickpocket_Agreed_16_01");	//У меня на этот счет иное мнение.
	AI_Output(self,other,"DIA_Cassia_Pickpocket_Agreed_16_02");	//Хммм... Интересно какое?
	AI_Output(other,self,"DIA_Cassia_Pickpocket_Agreed_16_03");	//Аттила хотел убить меня! Причем, хотел убить по твоему же приказу.
	AI_Output(other,self,"DIA_Cassia_Pickpocket_Agreed_16_04");	//То, что он не справился, говорит лишь о том, что для такого рода дел нужно подбирать более опытных людей.
	AI_Output(other,self,"DIA_Cassia_Pickpocket_Agreed_16_05");	//И уж тем болеее, если он был так важен для тебя, то не стоило посылать его одного.
	AI_Output(other,self,"DIA_Cassia_Pickpocket_Agreed_16_06");	//Так что, в его смерти виновата лишь ты сама и никто более.
	AI_Output(self,other,"DIA_Cassia_Pickpocket_Agreed_16_07");	//Ну хорошо! Сукин ты сын... Считай, что убедил меня в правильности своего выбора.
	AI_Output(self,other,"DIA_Cassia_Pickpocket_Agreed_16_08");	//А теперь давай просто забудем про это недоразумение и вернемся к нашим делам. 
	AI_Output(self,other,"DIA_Cassia_Pickpocket_Agreed_16_09");	//Так, что ты там хотел узнать?

	if(RhetorikSkillValue[1] < 100)
	{
		RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
		AI_Print("Риторика + 1");
	};

	CassiaRecievePay = TRUE;
	Info_ClearChoices(DIA_Cassia_Pickpocket);
};

func void DIA_Cassia_Acrobat_Ok()
{
	AI_Output(other,self,"DIA_Cassia_Pickpocket_Ok_16_01");	//Хорошо, вот твои деньги.
	B_GiveInvItems(other,self,ItMi_Gold,1000);
	Npc_RemoveInvItems(self,ItMi_Gold,1000);
	AI_Output(self,other,"DIA_Cassia_Pickpocket_Ok_16_02");	//Отлично! Теперь можно и потренироваться.
	CassiaRecievePay = TRUE;
	Info_ClearChoices(DIA_Cassia_Acrobat);
};

func void DIA_Cassia_Acrobat_No()
{
	AI_Output(other,self,"DIA_Cassia_Pickpocket_No_16_01");	//У меня нет таких денег.
	AI_Output(self,other,"DIA_Cassia_Pickpocket_No_16_02");	//Так найди их! Иначе, можешь забыть о своем обучении.
	Info_ClearChoices(DIA_Cassia_Acrobat);
};

func void DIA_Cassia_Acrobat_Damn()
{
	AI_Output(other,self,"DIA_Cassia_Pickpocket_Damn_16_01");	//А не пойти ли тебе куда подальше
	AI_Output(self,other,"DIA_Cassia_Pickpocket_Damn_16_02");	//Мне кажется, это было довольно дерзко с твоей стороны.
	AI_Output(self,other,"DIA_Cassia_Pickpocket_Damn_16_03");	//Придется преподать тебе урок хороших манер.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Cassia_Acrobat_Agreed()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Cassia_Pickpocket_Agreed_16_01");	//У меня на этот счет иное мнение.
	AI_Output(self,other,"DIA_Cassia_Pickpocket_Agreed_16_02");	//Хммм... Интересно какое?
	AI_Output(other,self,"DIA_Cassia_Pickpocket_Agreed_16_03");	//Аттила хотел убить меня! Причем, хотел убить по твоему же приказу.
	AI_Output(other,self,"DIA_Cassia_Pickpocket_Agreed_16_04");	//То, что он не справился, говорит лишь о том, что для такого рода дел нужно подбирать более опытных людей.
	AI_Output(other,self,"DIA_Cassia_Pickpocket_Agreed_16_05");	//И уж тем болеее, если он был так важен для тебя, то не стоило посылать его одного.
	AI_Output(other,self,"DIA_Cassia_Pickpocket_Agreed_16_06");	//Так что, в его смерти виновата лишь ты сама и никто более.
	AI_Output(self,other,"DIA_Cassia_Pickpocket_Agreed_16_07");	//Ну хорошо! Сукин ты сын... Считай, что убедил меня в правильности своего выбора.
	AI_Output(self,other,"DIA_Cassia_Pickpocket_Agreed_16_08");	//А теперь давай просто забудем про это недоразумение и вернемся к нашим делам. 
	AI_Output(self,other,"DIA_Cassia_Pickpocket_Agreed_16_09");	//Так, что ты там хотел узнать?

	if(RhetorikSkillValue[1] < 100)
	{
		RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
		AI_Print("Риторика + 1");
	};

	CassiaRecievePay = TRUE;
	Info_ClearChoices(DIA_Cassia_Acrobat);
};

func void DIA_Cassia_TEACH_Ok()
{
	AI_Output(other,self,"DIA_Cassia_Pickpocket_Ok_16_01");	//Хорошо, вот твои деньги.
	B_GiveInvItems(other,self,ItMi_Gold,1000);
	Npc_RemoveInvItems(self,ItMi_Gold,1000);
	AI_Output(self,other,"DIA_Cassia_Pickpocket_Ok_16_02");	//Отлично! Теперь можно и потренироваться.
	CassiaRecievePay = TRUE;
	Info_ClearChoices(DIA_Cassia_TEACH);
};

func void DIA_Cassia_TEACH_No()
{
	AI_Output(other,self,"DIA_Cassia_Pickpocket_No_16_01");	//У меня нет таких денег.
	AI_Output(self,other,"DIA_Cassia_Pickpocket_No_16_02");	//Так найди их! Иначе, можешь забыть о своем обучении.
	Info_ClearChoices(DIA_Cassia_TEACH);
};

func void DIA_Cassia_TEACH_Damn()
{
	AI_Output(other,self,"DIA_Cassia_Pickpocket_Damn_16_01");	//А не пойти ли тебе куда подальше
	AI_Output(self,other,"DIA_Cassia_Pickpocket_Damn_16_02");	//Мне кажется, это было довольно дерзко с твоей стороны.
	AI_Output(self,other,"DIA_Cassia_Pickpocket_Damn_16_03");	//Придется преподать тебе урок хороших манер.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Cassia_TEACH_Agreed()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Cassia_Pickpocket_Agreed_16_01");	//У меня на этот счет иное мнение.
	AI_Output(self,other,"DIA_Cassia_Pickpocket_Agreed_16_02");	//Хммм... Интересно какое?
	AI_Output(other,self,"DIA_Cassia_Pickpocket_Agreed_16_03");	//Аттила хотел убить меня! Причем, хотел убить по твоему же приказу.
	AI_Output(other,self,"DIA_Cassia_Pickpocket_Agreed_16_04");	//То, что он не справился, говорит лишь о том, что для такого рода дел нужно подбирать более опытных людей.
	AI_Output(other,self,"DIA_Cassia_Pickpocket_Agreed_16_05");	//И уж тем болеее, если он был так важен для тебя, то не стоило посылать его одного.
	AI_Output(other,self,"DIA_Cassia_Pickpocket_Agreed_16_06");	//Так что, в его смерти виновата лишь ты сама и никто более.
	AI_Output(self,other,"DIA_Cassia_Pickpocket_Agreed_16_07");	//Ну хорошо! Сукин ты сын... Считай, что убедил меня в правильности своего выбора.
	AI_Output(self,other,"DIA_Cassia_Pickpocket_Agreed_16_08");	//А теперь давай просто забудем про это недоразумение и вернемся к нашим делам. 
	AI_Output(self,other,"DIA_Cassia_Pickpocket_Agreed_16_09");	//Так, что ты там хотел узнать?

	if(RhetorikSkillValue[1] < 100)
	{
		RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
		AI_Print("Риторика + 1");
	};

	CassiaRecievePay = TRUE;
	Info_ClearChoices(DIA_Cassia_TEACH);
};

instance DIA_Cassia_Aufnahme(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = DIA_Cassia_Aufnahme_Condition;
	information = DIA_Cassia_Aufnahme_Info;
	permanent = FALSE;
	description = "Я принес кольцо Константино.";
};

func int DIA_Cassia_Aufnahme_Condition()
{
	if((MIS_CassiaRing == LOG_Running) && (Npc_HasItems(other,ItRi_Prot_Point_01_MIS) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Aufnahme_Info()
{
	B_GivePlayerXP(XP_CassiaRing);
	AI_Output(other,self,"DIA_Cassia_Aufnahme_15_00");	//Я принес кольцо Константино.
	B_GiveInvItems(other,self,ItRi_Prot_Point_01_MIS,1);
	Npc_RemoveInvItems(self,ItRi_Prot_Point_01_MIS,1);
	AI_Output(self,other,"DIA_Cassia_Aufnahme_16_01");	//Поздравляю! Ты прошел вступительный тест. Считай, что теперь ты один из нас!
	MIS_CassiaRing = LOG_SUCCESS;
	Log_SetTopicStatus(Topic_CassiaRing,LOG_SUCCESS);
	B_LogEntry(Topic_CassiaRing,"Кассия осталась довольна моей работой и предложила мне вступить в гильдию воров Хориниса. По ее словам это даст мне некоторые неоспоримые преимущества.");
};


instance DIA_Cassia_In_Guild_Invite(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = DIA_Cassia_In_Guild_Invite_condition;
	information = DIA_Cassia_In_Guild_Invite_info;
	permanent = FALSE;
	description = "Я готов вступить в гильдию воров!";
};

func int DIA_Cassia_In_Guild_Invite_condition()
{
	if(MIS_CassiaRing == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Cassia_In_Guild_Invite_info()
{
	if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR) || (hero.guild == GIL_KDW) || (hero.guild == GIL_NOV) || (hero.guild == GIL_NDM) || (hero.guild == GIL_NDW))
	{
		AI_Output(other,self,"DIA_Cassia_In_Guild_Invite_01_01");	//Я готов вступить в гильдию воров!
		AI_Output(self,other,"DIA_Cassia_In_Guild_Invite_01_00");	//Извини, но мы не принимаем в свою гильдию тех, кто уже связал свой путь с одним из божеств.
		AI_StopProcessInfos(self);
	}
	else
	{
		Snd_Play("LEVELUP");
		IS_LOVCACH = TRUE;
		Knows_SecretSign = TRUE;

		if(AttilaIsDead == FALSE)
		{
			THIEF_REPUTATION = THIEF_REPUTATION + 3;
		};

		AI_Output(other,self,"DIA_Cassia_In_Guild_Invite_01_01");	//Я готов вступить в гильдию воров!
		AI_Output(self,other,"DIA_Cassia_In_Guild_Invite_01_02");	//Поздравляю, теперь ты являешься полноправным членом гильдии воров!
		AI_Output(self,other,"DIA_Cassia_In_Guild_Invite_01_03");	//Отныне твой путь - это путь вора и мастера шпаги.
		AI_Output(self,other,"DIA_Cassia_In_Guild_Invite_01_04");	//Со временем для тебя будут открываться все новые и новые возможности, мой друг.
		AI_Output(self,other,"DIA_Cassia_In_Guild_Invite_01_05");	//Развивай свою ловкость, учись владеть телом, фехтовать шпагой и метко стрелять из лука.
		AI_Output(self,other,"DIA_Cassia_In_Guild_Invite_01_06");	//И я уверена, что в скором времени ты встанешь в один ряд с другими великими ворами Хориниса.
		AI_Output(self,other,"DIA_Cassia_In_Guild_Invite_01_07");	//Например таким, каким был мой наставник мастер Фингерс!
		AI_Output(other,self,"DIA_Cassia_In_Guild_Invite_01_08");	//Спасибо.
		AI_Output(self,other,"DIA_Cassia_Aufnahme_16_02");	//Возьми этот ключ. Он открывает дверь в отель...(улыбается) Теперь тебе не придется каждый раз плыть сюда.
		B_GiveInvItems(self,other,ItKe_XhiefGuildKey_Hotel_MIS,1);
		AI_Output(self,other,"DIA_Cassia_Aufnahme_16_03");	//Кроме того, ты должен знать, что у нас есть секретный знак - 'особый' кивок!
		AI_PlayAni(self,"T_YES");
		AI_Output(self,other,"DIA_Cassia_Aufnahme_16_04");	//Вот такой! Когда ты говоришь с правильными людьми и делаешь этот знак, они поймут, что ты один из нас.
		AI_Output(self,other,"DIA_Cassia_In_Guild_Invite_01_09");	//Кстати, не забудь заглянуть к Рамирезу. Мне кажется он хотел кое-чему тебя научить.
		AI_Output(self,other,"DIA_Cassia_In_Guild_Invite_01_10");	//Полагаю, что в первый раз он это сделает бесплатно.
		B_LogEntry(Topic_Diebesgilde,"Теперь я полноправный член гильдии воров Хориниса. Кассия посоветовала мне зайти к Рамирезу.");
	};
};

instance DIA_Cassia_Fingers(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = DIA_Cassia_Fingers_Condition;
	information = DIA_Cassia_Fingers_Info;
	permanent = FALSE;
	description = "Фингерс был твоим наставником?";
};

func int DIA_Cassia_Fingers_Condition()
{
	if((IS_LOVCACH == TRUE) && (FingersIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Fingers_Info()
{
	AI_Output(other,self,"DIA_Cassia_Fingers_01_00");	//Фингерс был твоим наставником?
	AI_Output(self,other,"DIA_Cassia_Fingers_01_01");	//Да. Это он научил меня всему, что я умею.
	AI_Output(other,self,"DIA_Cassia_Fingers_01_02");	//А где он сейчас?
	AI_Output(self,other,"DIA_Cassia_Fingers_01_03");	//Я ничего не слышала о нем с тех пор, как его отправили в колонию.
	AI_Output(self,other,"DIA_Cassia_Fingers_01_04");	//Так что если вдруг что-то узнаешь о его судьбе, то пожалуйста - дай мне знать.
	AI_Output(other,self,"DIA_Cassia_Fingers_01_05");	//Хорошо.
	MIS_WhereFingers = LOG_Running;
	Log_CreateTopic(Topic_WhereFingers,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_WhereFingers,LOG_Running);
	B_LogEntry(TOPIC_WhereFingers,"Кассии очень хотелось бы знать, что стало с ее наставником - мастером Фингерсом.");
};

instance DIA_Cassia_Fingers_Done(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = DIA_Cassia_Fingers_Done_Condition;
	information = DIA_Cassia_Fingers_Done_Info;
	permanent = FALSE;
	description = "Я нашел твоего наставника.";
};

func int DIA_Cassia_Fingers_Done_Condition()
{
	if((MIS_WhereFingers == LOG_Running) && (FingersMeet == TRUE) && (FingersIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Fingers_Done_Info()
{
	B_GivePlayerXP(400);
	AI_Output(other,self,"DIA_Cassia_Fingers_Done_01_00");	//Я нашел твоего наставника.
	AI_Output(self,other,"DIA_Cassia_Fingers_Done_01_01");	//(взволнованно) Правда? Что с ним?
	AI_Output(other,self,"DIA_Cassia_Fingers_Done_01_02");	//С ним все в порядке. Он жив и здоров.
	AI_Output(self,other,"DIA_Cassia_Fingers_Done_01_03");	//Это хорошие новости! Надеюсь, что когда-нибудь он все-таки вернется к нам.
	AI_Output(self,other,"DIA_Cassia_Fingers_Done_01_04");	//И все будет так же, как и раньше. Спасибо тебе.
	MIS_WhereFingers = LOG_Success;
	Log_SetTopicStatus(TOPIC_WhereFingers,LOG_Success);
	B_LogEntry(TOPIC_WhereFingers,"Кассию обрадовала новость о том, что мастер Фингерс жив.");
};


instance DIA_Cassia_Fingers_Dead(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = DIA_Cassia_Fingers_Dead_Condition;
	information = DIA_Cassia_Fingers_Dead_Info;
	permanent = FALSE;
	description = "Я нашел твоего наставника.";
};

func int DIA_Cassia_Fingers_Dead_Condition()
{
	if((MIS_WhereFingers == LOG_Running) && (FingersIsDead == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Fingers_Dead_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Cassia_Fingers_Dead_01_00");	//Я нашел твоего наставника.
	AI_Output(self,other,"DIA_Cassia_Fingers_Dead_01_01");	//(взволнованно) Правда? Что с ним?
	AI_Output(other,self,"DIA_Cassia_Fingers_Dead_01_02");	//Он мертв.
	AI_Output(self,other,"DIA_Cassia_Fingers_Dead_01_03");	//Это плохие новости. Но нам всем придется смириться с этим.
	AI_Output(self,other,"DIA_Cassia_Fingers_Dead_01_04");	//В любом случае спасибо.
	MIS_WhereFingers = LOG_Success;
	Log_SetTopicStatus(TOPIC_WhereFingers,LOG_Success);
	B_LogEntry(TOPIC_WhereFingers,"Кассию сильно опечалило известие о том, что Фингерс мертв.");
};

instance DIA_Cassia_Versteck(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = DIA_Cassia_Versteck_Condition;
	information = DIA_Cassia_Versteck_Info;
	permanent = FALSE;
	description = "А где вы прячете награбленное?";
};

func int DIA_Cassia_Versteck_Condition()
{
	if((IS_LOVCACH == TRUE) && Npc_KnowsInfo(other,DIA_Ramirez_Beute))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Versteck_Info()
{
	AI_Output(other,self,"DIA_Cassia_Versteck_15_00");	//А где вы прячете награбленное?
	AI_Output(self,other,"DIA_Cassia_Versteck_16_01");	//Ты думаешь, я тебе вот так просто все и выложу?
	AI_Output(self,other,"DIA_Cassia_Versteck_16_02");	//У тебя будет достаточно возможностей самому сколотить состояние. Помни - жадные обычно остаются ни с чем!
};

instance DIA_Cassia_Blutkelche(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = DIA_Cassia_Blutkelche_Condition;
	information = DIA_Cassia_Blutkelche_Info;
	permanent = TRUE;
	description = "У тебя есть работа для меня?";
};

func int DIA_Cassia_Blutkelche_Condition()
{
	if((IS_LOVCACH == TRUE) && (MIS_CassiaKelche == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Blutkelche_Info()
{
	AI_Output(other,self,"DIA_Cassia_Blutkelche_15_00");	//У тебя есть работа для меня?

	if(hero.attribute[ATR_DEXTERITY] >= 50)
	{
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_03");	//Да, меня интересует коллекция кубков. Всего их шесть!
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_04");	//Король Робар захватил их как-то во время одной из своих кампаний - но для этого ему пришлось положить очень много своих людей. Вот почему они называются Кровавые Кубки.
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_05");	//Каждый из кубков сам по себе не особенно ценен - но все шесть, собранные вместе, стоят целое состояние.
		AI_Output(other,self,"DIA_Cassia_Blutkelche_15_06");	//Где эти кубки?
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_07");	//Они здесь, в городе - ими владеют богатые торговцы из верхнего квартала.
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_08");	//Принеси их мне. А тем временем я подыщу покупателя для них.
		AI_Output(other,self,"DIA_Cassia_Blutkelche_15_09");	//А мне что с этого будет?
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_10");	//Либо половина от дохода, либо ты сможешь выбрать что-нибудь из моей сокровищницы.
		MIS_CassiaKelche = LOG_Running;
		Log_CreateTopic(Topic_CassiaKelche,LOG_MISSION);
		Log_SetTopicStatus(Topic_CassiaKelche,LOG_Running);
		B_LogEntry(Topic_CassiaKelche,"Кассия хочет, чтобы я принес ей шесть кровавых кубков. По-видимому, они находятся в городе.");
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_20");	//Хммм...(оценивающе) Извини, но сейчас с твоей ловкостью тебе только пустые бутылки у пьяниц воровать.
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_21");	//Поэтому вначале ты должен немного повысить свои навыки вора.
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_22");	//Тогда, может быть, и работенка найдется.
	};
};

instance DIA_Cassia_abgeben(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = DIA_Cassia_abgeben_Condition;
	information = DIA_Cassia_abgeben_Info;
	permanent = TRUE;
	description = "Насчет Кровавых Кубков...";
};

func int DIA_Cassia_abgeben_Condition()
{
	if(MIS_CassiaKelche == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Cassia_abgeben_Info()
{
	AI_Output(other,self,"DIA_Cassia_abgeben_15_00");	//Насчет Кровавых Кубков...

	if(B_GiveInvItems(other,self,ItMi_ZloodCup_MIS,6))
	{
		B_GivePlayerXP(XP_CassiaBlutkelche);
		AI_Output(other,self,"DIA_Cassia_abgeben_15_01");	//У меня все шесть кубков.
		AI_Output(self,other,"DIA_Cassia_abgeben_16_02");	//Отличная работа, а я тем временем подыскала покупателя.
		AI_Output(self,other,"DIA_Cassia_abgeben_16_03");	//Ты можешь получить свою награду. Спасибо, что сделал это для меня.
		Npc_RemoveInvItems(self,ItMi_ZloodCup_MIS,6);
		THIEF_REPUTATION = THIEF_REPUTATION + 3;
		MIS_CassiaKelche = LOG_SUCCESS;
		Log_SetTopicStatus(Topic_CassiaKelche,LOG_SUCCESS);
		B_LogEntry(Topic_CassiaKelche,"Я принес Кассии все шесть кубков.");
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_abgeben_16_05");	//Я могу продать эти кубки только все вместе. Принеси мне все шесть.
	};
};


instance DIA_Cassia_Belohnung(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = DIA_Cassia_Belohnung_Condition;
	information = DIA_Cassia_Belohnung_Info;
	permanent = FALSE;
	description = "Я пришел за своей наградой.";
};

func int DIA_Cassia_Belohnung_Condition()
{
	if(MIS_CassiaKelche == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Cassia_Belohnung_Info()
{
	AI_Output(other,self,"DIA_Cassia_Belohnung_15_00");	//Я пришел за своей наградой.
	AI_Output(self,other,"DIA_Cassia_Belohnung_16_01");	//Что ты выбираешь?
	Info_ClearChoices(DIA_Cassia_Belohnung);
	Info_AddChoice(DIA_Cassia_Belohnung,"Полторы тысячи золотых монет.",DIA_Cassia_Belohnung_Gold);
	Info_AddChoice(DIA_Cassia_Belohnung,"Десять эликсиров лечения.",DIA_Cassia_Belohnung_Trank);
	Info_AddChoice(DIA_Cassia_Belohnung,"Кольцо мошенника.",DIA_Cassia_Belohnung_Ring);
};

func void DIA_Cassia_Belohnung_Gold()
{
	AI_Output(other,self,"DIA_Cassia_Belohnung_15_02");	//Дай мне золото.
	B_GiveInvItems(self,other,ItMi_Gold,1500);
	Info_ClearChoices(DIA_Cassia_Belohnung);
};

func void DIA_Cassia_Belohnung_Trank()
{
	AI_Output(other,self,"DIA_Cassia_Belohnung_15_03");	//Дай мне напитки.
	B_GiveInvItems(self,other,ItPo_Health_03,10);
	Info_ClearChoices(DIA_Cassia_Belohnung);
};

func void DIA_Cassia_Belohnung_Ring()
{
	AI_Output(other,self,"DIA_Cassia_Belohnung_15_04");	//Дай мне кольцо.
	B_GiveInvItems(self,other,itri_dex_03,1);
	Info_ClearChoices(DIA_Cassia_Belohnung);
};

instance DIA_Cassia_In_Guild(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = DIA_Cassia_In_Guild_condition;
	information = DIA_Cassia_In_Guild_info;
	permanent = FALSE;
	description = "Для меня будут еще поручения?";
};

func int DIA_Cassia_In_Guild_condition()
{
	if((IS_LOVCACH == TRUE) && (MIS_CassiaKelche == LOG_SUCCESS) && (hero.attribute[ATR_DEXTERITY] >= 75))
	{
		return TRUE;
	};
};

func void DIA_Cassia_In_Guild_info()
{
	AI_Output(other,self,"DIA_Cassia_In_Guild_01_01");	//Для меня будут еще поручения?
	AI_Output(self,other,"DIA_Cassia_In_Guild_01_02");	//Конечно. Для таких, как ты, всегда найдется работенка.
	AI_Output(self,other,"DIA_Cassia_In_Guild_01_03");	//Один наш...(замявшись) ...постоянный клиент, скажем так, заказал нам освященную статуэтку Инноса.
	AI_Output(self,other,"DIA_Cassia_In_Guild_01_04");	//И он готов выложить за нее кругленькую сумму. Интересно?
	AI_Output(other,self,"DIA_Cassia_In_Guild_01_05");	//Само собой.
	AI_Output(self,other,"DIA_Cassia_In_Guild_01_06");	//Отлично! Тогда займись этим...
	AI_Output(self,other,"DIA_Cassia_In_Guild_01_07");	//Но будь внимателен - я не хочу передать нашему заказчику подделку.
	AI_Output(self,other,"DIA_Cassia_In_Guild_01_08");	//А настоящую статуэтку наверняка будет достать весьма и весьма непросто, учти это.
	AI_Output(self,other,"DIA_Cassia_In_Guild_01_09");	//Как только она будет у тебя, мы поговорим о твоей награде, мой милый.
	MISS_KASSIA_IN_GUILD = LOG_Running;
	Log_CreateTopic(TOPIC_CASSIA_STATUETTE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CASSIA_STATUETTE,LOG_Running);
	B_LogEntry(TOPIC_CASSIA_STATUETTE,"Кассия хочет, чтобы я принес освященную статуэтку Инноса. Однако Кассия предупредила меня, что могут существовать поддельные статуэтки.");
};

instance DIA_Cassia_In_Guild_Done(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = DIA_Cassia_In_Guild_Done_condition;
	information = DIA_Cassia_In_Guild_Done_info;
	permanent = FALSE;
	description = "Статуэтка у меня.";
};

func int DIA_Cassia_In_Guild_Done_condition()
{
	if((Npc_HasItems(hero,ItMi_LostInnosStatue_Daron) || Npc_HasItems(hero,ItMi_GoblinnosStatue_Daron_New)) && (MISS_KASSIA_IN_GUILD == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Cassia_In_Guild_Done_info()
{
	AI_Output(other,self,"DIA_Cassia_In_Guild_Done_01_01");	//Статуэтка у меня.

	if(Npc_HasItems(hero,ItMi_LostInnosStatue_Daron) && Npc_HasItems(hero,ItMi_GoblinnosStatue_Daron_New))
	{
		B_GivePlayerXP(500);
		B_GiveInvItems(hero,self,ItMi_LostInnosStatue_Daron,1);
		Npc_RemoveInvItems(self,ItMi_LostInnosStatue_Daron,1);
		Npc_RemoveInvItems(hero,ItMi_GoblinnosStatue_Daron_New,1);
		AI_Output(self,other,"DIA_Cassia_In_Guild_Done_01_02");	//Да, я вижу. И ты даже принес еще одну - только подделку.
		AI_Output(self,other,"DIA_Cassia_In_Guild_Done_01_03");	//Ладно, попробую продать и ее.
		AI_Output(self,other,"DIA_Cassia_In_Guild_Done_01_04");	//Что же касается тебя лично, то ты великолепно поработал! Даже лучше, чем я ожидала.
		AI_Output(self,other,"DIA_Cassia_In_Guild_Done_01_05");	//Вот, возьми этот эликсир. Думаю, это неплохая награда за твои труды.
		B_GiveInvItems(self,other,ItPo_Perm_DEX,1);
		THIEF_REPUTATION = THIEF_REPUTATION + 3;
		MISS_KASSIA_IN_GUILD = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_CASSIA_STATUETTE,LOG_SUCCESS);
		B_LogEntry(TOPIC_CASSIA_STATUETTE,"Каccия осталась в восторге от проделанной мною работы.");
	}
	else if(Npc_HasItems(hero,ItMi_GoblinnosStatue_Daron_New))
	{
		B_GivePlayerXP(100);
		B_GiveInvItems(hero,self,ItMi_GoblinnosStatue_Daron_New,1);
		Npc_RemoveInvItems(self,ItMi_GoblinnosStatue_Daron_New,1);
		AI_Output(self,other,"DIA_Cassia_In_Guild_Done_01_06");	//Да, я вижу. Но к моему большому сожалению, это всего лишь подделка!
		AI_Output(self,other,"DIA_Cassia_In_Guild_Done_01_07");	//Ладно, попробую продать и ее.
		AI_Output(self,other,"DIA_Cassia_In_Guild_Done_01_08");	//Что касается тебя, то ты подвел меня в этом деле.
		AI_Output(self,other,"DIA_Cassia_In_Guild_Done_01_09");	//Однако я не держу на тебя зла. Так что заходи к нам, если что.
		THIEF_REPUTATION = THIEF_REPUTATION + 1;
		MISS_KASSIA_IN_GUILD = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_CASSIA_STATUETTE,LOG_SUCCESS);
		B_LogEntry(TOPIC_CASSIA_STATUETTE,"Кассия была раздосадована из-за того, что я не смог найти подлинную статуэтку.");
	}
	else if(Npc_HasItems(hero,ItMi_LostInnosStatue_Daron))
	{
		B_GivePlayerXP(300);
		B_GiveInvItems(hero,self,ItMi_LostInnosStatue_Daron,1);
		Npc_RemoveInvItems(self,ItMi_LostInnosStatue_Daron,1);
		AI_Output(self,other,"DIA_Cassia_In_Guild_Done_01_10");	//Да, я вижу...(довольно) Она самая!
		AI_Output(self,other,"DIA_Cassia_In_Guild_Done_01_11");	//Наш заказчик останется доволен, а мы получим приличный куш с этого дела.
		AI_Output(self,other,"DIA_Cassia_In_Guild_Done_01_12");	//Что же касается тебя лично, то ты великолепно поработал!
		AI_Output(self,other,"DIA_Cassia_In_Guild_Done_01_13");	//Вот твоя доля.
		B_GiveInvItems(self,other,ItMi_Gold,350);
		THIEF_REPUTATION = THIEF_REPUTATION + 2;
		MISS_KASSIA_IN_GUILD = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_CASSIA_STATUETTE,LOG_SUCCESS);
		B_LogEntry(TOPIC_CASSIA_STATUETTE,"Каccия осталась довольна от проделанной мною работы.");
	};
};

instance DIA_CASSIA_ANOTHERJOB(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = dia_cassia_anotherjob_condition;
	information = dia_cassia_anotherjob_info;
	permanent = FALSE;
	description = "А есть для меня какая-нибудь работа вне города?";
};

func int dia_cassia_anotherjob_condition()
{
	if((IS_LOVCACH == TRUE) && (MISS_KASSIA_IN_GUILD == LOG_SUCCESS) && (hero.attribute[ATR_DEXTERITY] >= 100))
	{
		return TRUE;
	};
};

func void dia_cassia_anotherjob_info()
{
	AI_Output(other,self,"DIA_Cassia_AnotherJob_15_00");	//А есть для меня какая-нибудь работа вне города?
	AI_Output(self,other,"DIA_Cassia_AnotherJob_16_03");	//Есть одна, но очень сложная. Но ты можешь взяться за нее, если хочешь.
	AI_Output(other,self,"DIA_Cassia_AnotherJob_16_99");	//В чем она заключается?
	AI_Output(self,other,"DIA_Cassia_AnotherJob_16_04");	//Один ненормальный просил меня достать чашу Рудного барона! Говорит, она принесет ему удачу.
	AI_Output(self,other,"DIA_Cassia_AnotherJob_16_05");	//Впрочем, это его дело - вознаграждение он дает щедрое.
	AI_Output(other,self,"DIA_Cassia_AnotherJob_15_06");	//И как я понимаю, эта чаша хранится в замке Долины Рудников?
	AI_Output(self,other,"DIA_Cassia_AnotherJob_16_07");	//Да. Причем никто точно не знает, где именно.
	AI_Output(other,self,"DIA_Cassia_AnotherJob_15_09");	//Что я за это получу?
	AI_Output(self,other,"DIA_Cassia_AnotherJob_16_10");	//Как всегда - половина от прибыли или ценная вещь из моей сокровищницы.
	AI_Output(other,self,"DIA_Cassia_AnotherJob_16_98");	//Хорошо, договорились.
	MIS_CASSIAGOLDCUP = LOG_Running;
	Log_CreateTopic(TOPIC_CASSIAGOLDCUP,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CASSIAGOLDCUP,LOG_Running);
	B_LogEntry(TOPIC_CASSIAGOLDCUP,"Кассия хочет, чтобы я принес чашу Рудного барона. Она находится где-то в замке Долины Рудников.");
};

instance DIA_CASSIA_ANOTHERJOB2(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = dia_cassia_anotherjob2_condition;
	information = dia_cassia_anotherjob2_info;
	permanent = TRUE;
	description = "Я нашел чашу Рудного Барона.";
};

func int dia_cassia_anotherjob2_condition()
{
	if((MIS_CASSIAGOLDCUP == LOG_Running) && (Npc_HasItems(hero,ITMI_GOMEZGOLDCUP) >= 1))
	{
		return TRUE;
	};
};

func void dia_cassia_anotherjob2_info()
{
	AI_Output(other,self,"DIA_Cassia_AnotherJob2_15_00");	//Я нашел чашу Рудного барона.

	if(B_GiveInvItems(other,self,ITMI_GOMEZGOLDCUP,1))
	{
		B_GivePlayerXP(500);
		AI_Output(other,self,"DIA_Cassia_AnotherJob2_15_01");	//Но для этого пришлось изрядно потрудиться.
		AI_Output(self,other,"DIA_Cassia_AnotherJob2_16_02");	//Признаюсь - я восхищена!
		AI_Output(self,other,"DIA_Cassia_AnotherJob2_16_03");	//Благодарю тебя. Теперь ты можешь получить свое вознаграждение.
		Npc_RemoveInvItems(self,ITMI_GOMEZGOLDCUP,1);
		THIEF_REPUTATION = THIEF_REPUTATION + 4;
		MIS_CASSIAGOLDCUP = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_CASSIAGOLDCUP,LOG_SUCCESS);
		B_LogEntry(TOPIC_CASSIAGOLDCUP,"Я достал для Кассии чашу Рудного барона.");
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_AnotherJob2_16_99");	//И где же она?!
	};
};

instance DIA_CASSIA_BELOHNUNG2(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = dia_cassia_belohnung2_condition;
	information = dia_cassia_belohnung2_info;
	permanent = FALSE;
	description = "Я хочу забрать свою награду за чашу Рудного барона.";
};

func int dia_cassia_belohnung2_condition()
{
	if(MIS_CASSIAGOLDCUP == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_cassia_belohnung2_info()
{
	AI_Output(other,self,"DIA_Cassia_Belohnung2_15_00");	//Я хочу забрать свою награду за чашу Рудного барона.
	AI_Output(self,other,"DIA_Cassia_Belohnung2_15_97");	//Ладно. Вот, возьми эти древние таблички.
	B_GiveInvItems(self,other,ItWr_HitPointStonePlate1_Addon,2);
	AI_Output(self,other,"DIA_Cassia_Belohnung2_15_98");	//Текст на них выбит на каком-то древнем языке, и я не смогла ничего разобрать. Но такому человеку, как ты, они наверняка пригодятся.
};

instance DIA_CASSIA_GUILDKILL(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 1;
	condition = dia_cassia_guildkill_condition;
	information = dia_cassia_guildkill_info;
	permanent = FALSE;
	description = "Ты что-нибудь знаешь про гильдию убийц?";
};

func int dia_cassia_guildkill_condition()
{
	if((MIS_GUILDKILL == LOG_Running) && (IS_LOVCACH == TRUE) && (CANCOMPLETEGUILDKILL == FALSE))
	{
		return TRUE;
	};
};

func void dia_cassia_guildkill_info()
{
	AI_Output(other,self,"DIA_Cassia_GuildKill_01_00");	//Ты что-нибудь знаешь про гильдию убийц?
	AI_Output(self,other,"DIA_Cassia_GuildKill_01_01");	//(испуганно) Гильдию убийц? А зачем тебе это?
	AI_Output(other,self,"DIA_Cassia_GuildKill_01_02");	//Ну, скажем так - у меня есть к ним одно дельце.
	AI_Output(self,other,"DIA_Cassia_GuildKill_01_03");	//Я бы посоветовала тебе держаться подальше от этих людей. Но если тебе это так необходимо...
	AI_Output(self,other,"DIA_Cassia_GuildKill_01_04");	//...поговори с Рамирезом. Он расскажет тебе о них больше.
	B_LogEntry(TOPIC_GUILDKILL,"Кассия ничего не знает про гильдию убийц. Она посоветовала мне поговорить с Рамирезом.");
};


instance DIA_Cassia_Quest_Music(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 999;
	condition = DIA_Cassia_Quest_Music_condition;
	information = DIA_Cassia_Quest_Music_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Cassia_Quest_Music_condition()
{
	if((IS_LOVCACH == TRUE) && (MIS_CASSIAGOLDCUP == LOG_SUCCESS) && (Npc_KnowsInfo(hero,dia_jesper_quest) == TRUE) && (Kapitel >= 2) && (hero.attribute[ATR_DEXTERITY] >= 125) && (MIS_FindKillPlace == LOG_Success))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Quest_Music_info()
{
	AI_Output(self,other,"DIA_Cassia_Quest_Music_01_01");	//Постой. Для тебя тут есть работенка.
	AI_Output(other,self,"DIA_Cassia_Quest_Music_01_02");	//И какая же?
	AI_Output(self,other,"DIA_Cassia_Quest_Music_01_03");	//Недавно нам поступил очень выгодный заказ, и я готова на все, чтобы его выполнить.
	AI_Output(self,other,"DIA_Cassia_Quest_Music_01_04");	//Мне нужны музыкальные инструменты - лютня, волынка, арфа и китаррон.
	AI_Output(self,other,"DIA_Cassia_Quest_Music_01_05");	//Меня не волнует, где ты их возьмешь. Главное, чтобы они в ближайшее время были у меня.
	AI_Output(other,self,"DIA_Cassia_Quest_Music_01_06");	//Я понял. Постараюсь достать для тебя эти инструменты.
	MIS_KASSIAMUSIC = LOG_Running;
	Log_CreateTopic(TOPIC_KASSIAMUSIC,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KASSIAMUSIC,LOG_Running);
	B_LogEntry(TOPIC_KASSIAMUSIC,"Кассия попросила меня принести четыре музыкальных инструмента: волынку, арфу, лютню и китаррон. Ох, чует мое сердце, что просто так их нигде не найти.");
};

instance DIA_Cassia_Quest_Music_Done(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 1;
	condition = DIA_Cassia_Quest_Music_Done_condition;
	information = DIA_Cassia_Quest_Music_Done_info;
	permanent = FALSE;
	description = "Я принес тебе все инструменты.";
};

func int DIA_Cassia_Quest_Music_Done_condition()
{
	if((Npc_HasItems(hero,ItMi_IEHarfe) >= 1) && (Npc_HasItems(hero,ItMi_IEDrumScheit) >= 1) && (Npc_HasItems(hero,ItMi_IEDudelBlau) >= 1) && (Npc_HasItems(hero,ItMi_IELaute) >= 1) && (MIS_KASSIAMUSIC == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Quest_Music_Done_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Cassia_Quest_Music_Done_01_01");	//Я принес тебе все инструменты.
	AI_Output(self,other,"DIA_Cassia_Quest_Music_Done_01_02");	//Отлично! Давай их сюда.
	B_GiveInvItemsManyThings(other,self);
	Npc_RemoveInvItems(hero,ItMi_IEHarfe,1);
	Npc_RemoveInvItems(hero,ItMi_IEDudelBlau,1);
	Npc_RemoveInvItems(hero,ItMi_IELaute,1);
	Npc_RemoveInvItems(hero,ItMi_IEDrumScheit,1);
	AI_Output(self,other,"DIA_Cassia_Quest_Music_Done_01_03");	//(довольно) Ты славно потрудился! А я выручу за эти вещи огромную кучу золота.
	AI_Output(other,self,"DIA_Cassia_Quest_Music_Done_01_04");	//А мне что-нибудь перепадет?
	AI_Output(self,other,"DIA_Cassia_Quest_Music_Done_01_05");	//Уверена, что ты оценишь мою благодарность...
	B_GiveInvItems(self,other,ItMi_Gold,500);
	THIEF_REPUTATION = THIEF_REPUTATION + 4;
	MIS_KASSIAMUSIC = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_KASSIAMUSIC,LOG_SUCCESS);
	B_LogEntry(TOPIC_KASSIAMUSIC,"Я принес Кассии инструменты. Она была очень довольна, и вручила мне изрядную сумму золота.");
};

instance DIA_Cassia_MagicBook(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 1;
	condition = DIA_Cassia_MagicBook_condition;
	information = DIA_Cassia_MagicBook_info;
	permanent = FALSE;
	description = "Ты не знаешь, кто обокрал дом Ватраса?";
};

func int DIA_Cassia_MagicBook_condition()
{
	if((IS_LOVCACH == TRUE) && (MIS_VatrasMagicBook == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Cassia_MagicBook_info()
{
	AI_Output(other,self,"DIA_Cassia_MagicBook_01_01");	//Ты случайно не знаешь, кто обокрал дом Ватраса?
	AI_Output(self,other,"DIA_Cassia_MagicBook_01_02");	//Конечно, знаю. (улыбаясь) Такие события просто не могут произойти без моего ведома.
	AI_Output(other,self,"DIA_Cassia_MagicBook_01_03");	//Тогда, может быть, подскажешь, с кем мне стоит поговорить об этом деле?
	AI_Output(self,other,"DIA_Cassia_MagicBook_01_04");	//(подозрительно) А зачем тебе это?
	Info_ClearChoices(DIA_Cassia_MagicBook);
	Info_AddChoice(DIA_Cassia_MagicBook,"Просто стало интересно.",DIA_Cassia_MagicBook_JustInt);
	Info_AddChoice(DIA_Cassia_MagicBook,"Это мерзавец должен сидеть в тюрьме!",DIA_Cassia_MagicBook_Kill);
	Info_AddChoice(DIA_Cassia_MagicBook,"Я ищу одну вещь, которую там украли.",DIA_Cassia_MagicBook_Stolen);

	if(RhetorikSkillValue[1] >= 15)
	{
		Info_AddChoice(DIA_Cassia_MagicBook,"Просто ходят слухи, знаешь ли.",DIA_Cassia_MagicBook_Rumors);
	};
};

func void DIA_Cassia_MagicBook_JustInt()
{
	AI_Output(other,self,"DIA_Cassia_MagicBook_JustInt_01_01");	//Просто стало интересно.
	AI_Output(self,other,"DIA_Cassia_MagicBook_JustInt_01_02");	//На твоем месте я бы держалась подальше от таких тем.
	AI_Output(self,other,"DIA_Cassia_MagicBook_JustInt_01_03");	//За лишние вопросы тут можно попасть в большие неприятности.
	MagicBookCantFind = TRUE;
	B_LogEntry(TOPIC_VatrasMagicBook,"Вряд ли мне теперь удастся выяснить, кто украл дневник Ватраса. Придется сообщить ему эту печальную новость.");	
	Info_ClearChoices(DIA_Cassia_MagicBook);
};

func void DIA_Cassia_MagicBook_Kill()
{
	AI_Output(other,self,"DIA_Cassia_MagicBook_Kill_01_01");	//Этот мерзавец должен сидеть в тюрьме!
	AI_Output(self,other,"DIA_Cassia_MagicBook_Kill_01_02");	//Ты не слишком умен, раз говоришь мне сейчас подобные вещи.
	AI_Output(self,other,"DIA_Cassia_MagicBook_Kill_01_03");	//На первый раз я тебя прощаю...(грозно) Но впредь хорошенько подумай, прежде чем открыть свой рот.
	MagicBookCantFind = TRUE;
	B_LogEntry(TOPIC_VatrasMagicBook,"Вряд ли мне теперь удастся выяснить, кто украл дневник Ватраса. Придется сообщить ему эту печальную новость.");	
	Info_ClearChoices(DIA_Cassia_MagicBook);
};

func void DIA_Cassia_MagicBook_Stolen()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Cassia_MagicBook_Stolen_01_01");	//Я ищу одну вещь, которую там украли.
	AI_Output(self,other,"DIA_Cassia_MagicBook_Stolen_01_02");	//Какую?
	AI_Output(other,self,"DIA_Cassia_MagicBook_Stolen_01_03");	//Дневник Ватраса. Не знаешь, где он может быть?
	AI_Output(self,other,"DIA_Cassia_MagicBook_Stolen_01_04");	//Нет, конечно. Но здесь ты точно его не найдешь.
	AI_Output(self,other,"DIA_Cassia_MagicBook_Stolen_01_05");	//Поспрашивай лучше торговцев на рыночной площади. Возможно, там твоя книга и объявится.
	B_LogEntry(TOPIC_VatrasMagicBook,"Кассия посоветовала мне поговорить с торговцами на рыночной площади. Возможно дневник уже ищет своего нового покупателя.");	
	MagicBookFindTrade = TRUE;
	Info_ClearChoices(DIA_Cassia_MagicBook);
};

func void DIA_Cassia_MagicBook_Rumors()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Cassia_MagicBook_Rumors_01_01");	//Просто ходят слухи, знаешь ли.
	AI_Output(other,self,"DIA_Cassia_MagicBook_Rumors_01_02");	//Вот и захотелось посмотреть на того умельца, который столь блестяще провернул это дельце.
	AI_Output(self,other,"DIA_Cassia_MagicBook_Rumors_01_03");	//Ну, это не секрет...(улыбаясь) Конечно, Рамирез! Только ему под силу такое.
	AI_Output(self,other,"DIA_Cassia_MagicBook_Rumors_01_04");	//Так что можешь пойти и выразить ему свое восхищение.

	if(RhetorikSkillValue[1] < 100)
	{
		RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
		AI_Print("Риторика + 1");
	};

	MagicBookFindTradeExt = TRUE;
	B_LogEntry(TOPIC_VatrasMagicBook,"Кассия рассказала мне о том, что дом Ватраса обокрал Рамирез. Он должен точно знать, где сейчас этот дневник.");
	Info_ClearChoices(DIA_Cassia_MagicBook);
};

instance DIA_Cassia_RichStones(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 3;
	condition = DIA_Cassia_RichStones_Condition;
	information = DIA_Cassia_RichStones_Info;
	permanent = FALSE;
	description = "Есть что-нибудь новенькое?";
};

func int DIA_Cassia_RichStones_Condition()
{
	if((IS_LOVCACH == TRUE) && (Kapitel >= 3) && (hero.attribute[ATR_DEXTERITY] >= 150))
	{
		return TRUE;
	};
};

func void DIA_Cassia_RichStones_Info()
{
	AI_Output(other,self,"DIA_Cassia_RichStones_01_00");	//Есть что-нибудь новенькое?
	AI_Output(self,other,"DIA_Cassia_RichStones_01_01");	//Да. Хорошо, что ты зашел.
	AI_Output(self,other,"DIA_Cassia_RichStones_01_02");	//Недавно до нас дошли слухи, что паладины привезли с собой на остров множество драгоценных камней.
	AI_Output(self,other,"DIA_Cassia_RichStones_01_03");	//Но нас заинтересовал только один из них - огромный рубин, с размером почти с кулак!
	AI_Output(other,self,"DIA_Cassia_RichStones_01_04");	//А как ты узнала о нем?
	AI_Output(self,other,"DIA_Cassia_RichStones_01_05");	//Неважно...(улыбаясь) У нас достаточно источников информации в этом городе.
	AI_Output(self,other,"DIA_Cassia_RichStones_01_06");	//Так вот, я хочу, чтобы этот камень стал украшением моей сокровищницы.
	AI_Output(other,self,"DIA_Cassia_RichStones_01_07");	//Намекаешь на то, что я мог бы выкрасть его для тебя?
	AI_Output(self,other,"DIA_Cassia_RichStones_01_08");	//Ты все правильно понял.
	AI_Output(self,other,"DIA_Cassia_RichStones_01_09");	//Насколько мне известно, сундук с этими драгоценностями паладины перевезли с корабля в городскую ратушу.
	AI_Output(self,other,"DIA_Cassia_RichStones_01_10");	//И там он, конечно, надежно охраняется.
	AI_Output(self,other,"DIA_Cassia_RichStones_01_11");	//Есть и другая проблема - скорее всего, у этого сундука очень сложный замок.
	AI_Output(self,other,"DIA_Cassia_RichStones_01_12");	//Даже Рамирезу будет крайне сложно вскрыть его быстро и аккуратно.
	AI_Output(other,self,"DIA_Cassia_RichStones_01_13");	//А я, по-твоему, справлюсь лучше?
	AI_Output(self,other,"DIA_Cassia_RichStones_01_14");	//Ты вхож в ратушу, а значит, тебе будет проще подступиться к нему.
	AI_Output(other,self,"DIA_Cassia_RichStones_01_15");	//Ну, хорошо. А что я буду с этого иметь?
	AI_Output(self,other,"DIA_Cassia_RichStones_01_16");	//Все, что найдешь в сундуке кроме рубина - твое. Договорились?
	AI_Output(other,self,"DIA_Cassia_RichStones_01_17");	//Хорошо, попробую.
	MIS_RichStones = LOG_Running;
	Log_CreateTopic(Topic_RichStones,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RichStones,LOG_Running);
	B_LogEntry(TOPIC_RichStones,"Кассия хочет, чтобы я выкрал для нее один огромный рубин, размером почти с кулак! Он хранится в городской ратуше вместе с другими драгоценностями. Но есть проблема: замок на том сундуке невероятно сложный.");
};

instance DIA_Cassia_RichStones_Done(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 3;
	condition = DIA_Cassia_RichStones_Done_Condition;
	information = DIA_Cassia_RichStones_Done_Info;
	permanent = FALSE;
	description = "Рубин у меня!";
};

func int DIA_Cassia_RichStones_Done_Condition()
{
	if((MIS_RichStones == LOG_Running) && (Npc_HasItems(hero,ItMi_BigRuby) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Cassia_RichStones_Done_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Cassia_RichStones_Done_01_00");	//Рубин у меня!
	AI_Output(self,other,"DIA_Cassia_RichStones_Done_01_01");	//Отлично! (жадно) Тогда чего ты ждешь - отдай его мне.
	AI_Output(other,self,"DIA_Cassia_RichStones_Done_01_02");	//Конечно, вот он. 
	B_GiveInvItems(other,self,ItMi_BigRuby,1);
	Npc_RemoveInvItems(self,ItMi_BigRuby,1);
	AI_Output(other,self,"DIA_Cassia_RichStones_Done_01_03");	//Просто захотелось еще немного на него полюбоваться.
	AI_Output(self,other,"DIA_Cassia_RichStones_Done_01_04");	//Я тебя понимаю. Нечасто в руки попадает такое сокровище.
	AI_Output(self,other,"DIA_Cassia_RichStones_Done_01_05");	//А ты хорошо поработал. Переплюнул даже Рамиреза.
	AI_Output(self,other,"DIA_Cassia_RichStones_Done_01_06");	//Только ему об этом не говори. Он не очень-то жалует хвастунов.
	AI_Output(self,other,"DIA_Cassia_RichStones_Done_01_07");	//(ехидно) И чуть не забыла - вот твоя награда.
	B_GiveInvItems(self,other,ItMi_Gold,1000);
	THIEF_REPUTATION = THIEF_REPUTATION + 5;
	MIS_RichStones = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_RichStones,LOG_SUCCESS);
	B_LogEntry(TOPIC_RichStones,"Кассия была очень довольна тем, что мне удалось выкрасть рубин.");
};

instance DIA_Cassia_DragonTreasure(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 3;
	condition = DIA_Cassia_DragonTreasure_Condition;
	information = DIA_Cassia_DragonTreasure_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Cassia_DragonTreasure_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (IS_LOVCACH == TRUE) && (Kapitel >= 4) && (MIS_AllDragonsDead == FALSE) && (hero.attribute[ATR_DEXTERITY] >= 200))
	{
		return TRUE;
	};
};

func void DIA_Cassia_DragonTreasure_Info()
{
	AI_Output(self,other,"DIA_Cassia_DragonTreasure_01_00");	//Решил снова заглянуть к нам?
	AI_Output(other,self,"DIA_Cassia_DragonTreasure_01_01");	//Просто хотел узнать, как у вас тут дела.
	AI_Output(self,other,"DIA_Cassia_DragonTreasure_01_02");	//Все хорошо...(улыбаясь) А ты, я слышала, вновь собираешься в Долину Рудников?
	AI_Output(other,self,"DIA_Cassia_DragonTreasure_01_03");	//Ну... Кое-кто попросил меня прикончить там парочку драконов.
	AI_Output(self,other,"DIA_Cassia_DragonTreasure_01_04");	//Драконы? В таком случае у меня к тебе есть одно заманчивое предложение.
	AI_Output(other,self,"DIA_Cassia_DragonTreasure_01_05");	//Внимательно тебя слушаю.
	AI_Output(self,other,"DIA_Cassia_DragonTreasure_01_06");	//Согласно легенде, драконы очень опасные существа. Но также и очень богатые.
	AI_Output(self,other,"DIA_Cassia_DragonTreasure_01_07");	//У каждого из них обычно есть своя сокровищница, где кроме золота они хранят еще и довольно ценные вещи.
	AI_Output(self,other,"DIA_Cassia_DragonTreasure_01_08");	//Было бы неплохо заполучить хотя бы одну из таких вещиц. Не говоря уже о чем-то большем!
	AI_Output(self,other,"DIA_Cassia_DragonTreasure_01_09");	//Я же, в свою очередь, щедро вознагражу тебя за твои хлопоты. Что скажешь? 
	AI_Output(other,self,"DIA_Cassia_DragonTreasure_01_10");	//Да, твое предложение довольно интересное. Ладно, я в деле. А что конкретно тебе нужно от драконов?
	AI_Output(self,other,"DIA_Cassia_DragonTreasure_01_11");	//Если бы я знала...(ухмыляясь) Неси мне все необычные вещи, что тебе попадутся в сокровищницах драконов. А потом мы разберемся, что к чему.
	MIS_DragonTreasure = LOG_Running;
	Log_CreateTopic(Topic_DragonTreasure,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DragonTreasure,LOG_Running);
	B_LogEntry(TOPIC_DragonTreasure,"Кассия хочет, чтобы я пошарил в сокровищнице драконов и принес ей какие-нибудь очень ценные вещи. За это она хорошо вознаградит меня. Теперь дело за малым - пойти и убить драконов.");
};

var int OreBaronCrownUp;
var int GoldHuntHornUp;
var int DiamondChokerUp;
var int GoldKnifeUp;

instance DIA_Cassia_DragonTreasure_Done(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 3;
	condition = DIA_Cassia_DragonTreasure_Done_Condition;
	information = DIA_Cassia_DragonTreasure_Done_Info;
	permanent = TRUE;
	description = "У меня тут для тебя кое-что есть.";
};

func int DIA_Cassia_DragonTreasure_Done_Condition()
{
	if((MIS_DragonTreasure == LOG_Running) && ((Npc_HasItems(hero,ItMi_DiamondChoker) >= 1) || (Npc_HasItems(hero,ItMi_HuntHornGold) >= 1) || (Npc_HasItems(hero,ItMi_KnifeGold) >= 1) || (Npc_HasItems(hero,ItMi_OreBaronCrown) >= 1)))
	{
		return TRUE;
	};
};

func void DIA_Cassia_DragonTreasure_Done_Info()
{
	AI_Output(other,self,"DIA_Cassia_DragonTreasure_Done_01_00");	//У меня тут кое-что для тебя есть.
	AI_Output(self,other,"DIA_Cassia_DragonTreasure_Done_01_01");	//Ну что ж, давай посмотрим.
	Info_ClearChoices(DIA_Cassia_DragonTreasure_Done);
	Info_AddChoice(DIA_Cassia_DragonTreasure_Done,"Больше пока ничего.",DIA_Cassia_DragonTreasure_Done_Back);

	if((Npc_HasItems(hero,ItMi_DiamondChoker) >= 1) && (DiamondChokerUp == FALSE))
	{
		Info_AddChoice(DIA_Cassia_DragonTreasure_Done,"Отдать бриллиантовое ожерелье.",DIA_Cassia_DragonTreasure_Done_DiamondChoker);
	};
	if((Npc_HasItems(hero,ItMi_HuntHornGold) >= 1) && (GoldHuntHornUp == FALSE))
	{
		Info_AddChoice(DIA_Cassia_DragonTreasure_Done,"Отдать золотой охотничий горн.",DIA_Cassia_DragonTreasure_Done_GoldHuntHorn);
	};
	if((Npc_HasItems(hero,ItMi_KnifeGold) >= 1) && (GoldKnifeUp == FALSE))
	{
		Info_AddChoice(DIA_Cassia_DragonTreasure_Done,"Отдать золотой кинжал.",DIA_Cassia_DragonTreasure_Done_GoldKnife);
	};
	if((Npc_HasItems(hero,ItMi_OreBaronCrown) >= 1) && (OreBaronCrownUp == FALSE))
	{
		Info_AddChoice(DIA_Cassia_DragonTreasure_Done,"Отдать корону.",DIA_Cassia_DragonTreasure_Done_OreBaronCrown);
	};
};

func void DIA_Cassia_DragonTreasure_Done_Back()
{
	AI_Output(other,self,"DIA_Cassia_DragonTreasure_Done_Back_01_00");	//Больше пока ничего.
	AI_Output(self,other,"DIA_Cassia_DragonTreasure_Done_Back_01_01");	//Хорошо. Но я надеюсь, что в скором времени ты меня еще чем-нибудь порадуешь.
	AI_Output(other,self,"DIA_Cassia_DragonTreasure_Done_Back_01_02");	//Можешь в этом не сомневаться.
	Info_ClearChoices(DIA_Cassia_DragonTreasure_Done);
};

func void DIA_Cassia_DragonTreasure_Done_DiamondChoker()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Cassia_DragonTreasure_Done_DiamondChoker_01_00");	//Вот, возьми это бриллиантовое ожерелье.
	B_GiveInvItems(other,self,ItMi_DiamondChoker,1);
	Npc_RemoveInvItems(self,ItMi_DiamondChoker,1);
	AI_Output(self,other,"DIA_Cassia_DragonTreasure_Done_DiamondChoker_01_01");	//Какая красота... Такая вещь должна стоить очень дорого!
	AI_Output(self,other,"DIA_Cassia_DragonTreasure_Done_DiamondChoker_01_02");	//Думаю, что я оставлю ее себе. Остальным такие дорогие вещи совершенно ни к чему.
	AI_Output(other,self,"DIA_Cassia_DragonTreasure_Done_DiamondChoker_01_03");	//Дело твое. А что насчет моей награды?
	AI_Output(self,other,"DIA_Cassia_DragonTreasure_Done_DiamondChoker_01_04");	//Конечно, как я и обещала. Вот, возьми свое золото.
	B_GiveInvItems(self,other,ItMi_Gold,1000);
	AI_Output(other,self,"DIA_Cassia_DragonTreasure_Done_DiamondChoker_01_05");	//Сколько тут?
	AI_Output(self,other,"DIA_Cassia_DragonTreasure_Done_DiamondChoker_01_06");	//Ровно тысяча золотых. Вдвое больше того, что бы ты выручил за него у торговцев.
	DiamondChokerUp = TRUE;

	if((DiamondChokerUp == TRUE) && (GoldKnifeUp == TRUE) && (GoldHuntHornUp == TRUE) && (OreBaronCrownUp == TRUE))
	{
		THIEF_REPUTATION = THIEF_REPUTATION + 5;
		MIS_DragonTreasure = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_DragonTreasure,LOG_SUCCESS);
		B_LogEntry(TOPIC_DragonTreasure,"Думаю, хватит подарков для Кассии! Уверен, что она довольна и так.");
	};

};

func void DIA_Cassia_DragonTreasure_Done_GoldHuntHorn()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Cassia_DragonTreasure_Done_GoldHuntHorn_01_00");	//Золотой охотничий горн.
	B_GiveInvItems(other,self,ItMi_HuntHornGold,1);
	Npc_RemoveInvItems(self,ItMi_HuntHornGold,1);
	AI_Output(self,other,"DIA_Cassia_DragonTreasure_Done_GoldHuntHorn_01_01");	//Дорогая вещица...(оценивающе) Обычно такими пользовались только люди очень знатного происхождения.
	AI_Output(other,self,"DIA_Cassia_DragonTreasure_Done_GoldHuntHorn_01_02");	//По всей видимости, он когда-то принадлежал одному из рудных баронов.
	AI_Output(self,other,"DIA_Cassia_DragonTreasure_Done_GoldHuntHorn_01_03");	//Возможно. Но сейчас это уже не имеет значения.
	AI_Output(self,other,"DIA_Cassia_DragonTreasure_Done_GoldHuntHorn_01_04");	//Вот, возьми обещанную награду.
	B_GiveInvItems(self,other,ItMi_Gold,500);
	GoldHuntHornUp = TRUE;

	if((DiamondChokerUp == TRUE) && (GoldKnifeUp == TRUE) && (GoldHuntHornUp == TRUE) && (OreBaronCrownUp == TRUE))
	{
		THIEF_REPUTATION = THIEF_REPUTATION + 5;
		MIS_DragonTreasure = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_DragonTreasure,LOG_SUCCESS);
		B_LogEntry(TOPIC_DragonTreasure,"Думаю, хватит подарков для Кассии! Уверен, что она довольна и так.");
	};
};

func void DIA_Cassia_DragonTreasure_Done_GoldKnife()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Cassia_DragonTreasure_Done_GoldKnife_01_00");	//Вот, взгляни на этот кинжал.
	B_GiveInvItems(other,self,ItMi_KnifeGold,1);
	Npc_RemoveInvItems(self,ItMi_KnifeGold,1);
	AI_Output(self,other,"DIA_Cassia_DragonTreasure_Done_GoldKnife_01_01");	//Хммм. Довольно искусная работа. Скорее всего, его сделали на материке.
	AI_Output(self,other,"DIA_Cassia_DragonTreasure_Done_GoldKnife_01_02");	//Местные коллекционеры наверняка заинтересуются этим предметом.
	AI_Output(other,self,"DIA_Cassia_DragonTreasure_Done_GoldKnife_01_03");	//А меня больше интересует моя награда.
	AI_Output(self,other,"DIA_Cassia_DragonTreasure_Done_GoldKnife_01_04");	//Не волнуйся, я не забыла. (улыбаясь) Вот, возьми этот магический эликсир.
	B_GiveInvItems(self,other,ItPo_Perm_DEX,1);
	AI_Output(self,other,"DIA_Cassia_DragonTreasure_Done_GoldKnife_01_05");	//Он сделает тебя еще более ловким.
	GoldKnifeUp = TRUE;

	if((DiamondChokerUp == TRUE) && (GoldKnifeUp == TRUE) && (GoldHuntHornUp == TRUE) && (OreBaronCrownUp == TRUE))
	{
		THIEF_REPUTATION = THIEF_REPUTATION + 5;
		MIS_DragonTreasure = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_DragonTreasure,LOG_SUCCESS);
		B_LogEntry(TOPIC_DragonTreasure,"Думаю, хватит подарков для Кассии! Уверен, что она довольна и так.");
	};
};

func void DIA_Cassia_DragonTreasure_Done_OreBaronCrown()
{
	B_GivePlayerXP(1500);
	AI_Output(other,self,"DIA_Cassia_DragonTreasure_Done_OreBaronCrown_01_00");	//В сокровищнице одного из драконов я нашел эту корону.
	B_GiveInvItems(other,self,ItMi_OreBaronCrown,1);
	Npc_RemoveInvItems(self,ItMi_OreBaronCrown,1);
	AI_Output(self,other,"DIA_Cassia_DragonTreasure_Done_OreBaronCrown_01_01");	//Невероятно! Какая удача...(восхищенно) Это же корона рудных баронов!
	AI_Output(other,self,"DIA_Cassia_DragonTreasure_Done_OreBaronCrown_01_02");	//Правда?!
	AI_Output(self,other,"DIA_Cassia_DragonTreasure_Done_OreBaronCrown_01_03");	//Да, она самая. Подарок самого короля Миртаны!
	AI_Output(self,other,"DIA_Cassia_DragonTreasure_Done_OreBaronCrown_01_04");	//Когда-то ее носил самый могущественный барон этого острова.
	AI_Output(self,other,"DIA_Cassia_DragonTreasure_Done_OreBaronCrown_01_05");	//Я и представить не могла, что когда-нибудь буду держать ее в руках.
	AI_Output(other,self,"DIA_Cassia_DragonTreasure_Done_OreBaronCrown_01_06");	//За нее, наверное, любой торговец отвалит кучу золота.
	AI_Output(self,other,"DIA_Cassia_DragonTreasure_Done_OreBaronCrown_01_07");	//Она практически бесценна! Но мне нравится ход твоих мыслей.
	AI_Output(self,other,"DIA_Cassia_DragonTreasure_Done_OreBaronCrown_01_08");	//Сейчас я не знаю, что с ней делать. Надо хорошенько подумать.
	AI_Output(self,other,"DIA_Cassia_DragonTreasure_Done_OreBaronCrown_01_09");	//А что касается тебя, то ты хорошо потрудился и заслужил самую высокую награду.
	AI_Output(self,other,"DIA_Cassia_DragonTreasure_Done_OreBaronCrown_01_10");	//Я научу тебя, как правильно использовать свои силы при беге и прыжках. Согласен?
	OreBaronCrownUp = TRUE;

	if((DiamondChokerUp == TRUE) && (GoldKnifeUp == TRUE) && (GoldHuntHornUp == TRUE) && (OreBaronCrownUp == TRUE))
	{
		THIEF_REPUTATION = THIEF_REPUTATION + 5;
		MIS_DragonTreasure = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_DragonTreasure,LOG_SUCCESS);
		B_LogEntry(TOPIC_DragonTreasure,"Думаю, хватит подарков для Кассии! Уверен, что она довольна и так.");
	};

	Info_ClearChoices(DIA_Cassia_DragonTreasure_Done);
	Info_AddChoice(DIA_Cassia_DragonTreasure_Done,"Дай мне лучше золото.",DIA_Cassia_DragonTreasure_Done_Gold);
	Info_AddChoice(DIA_Cassia_DragonTreasure_Done,"Конечно!",DIA_Cassia_DragonTreasure_Done_Run);
};

func void DIA_Cassia_DragonTreasure_Done_Run()
{
	AI_Output(other,self,"DIA_Cassia_DragonTreasure_Done_Run_01_01");	//Конечно!
	AI_Output(self,other,"DIA_Cassia_DragonTreasure_Done_Run_01_02");	//Тогда слушай. Главное научиться правильно распределять нагрузку своего тела.
	AI_Output(self,other,"DIA_Cassia_DragonTreasure_Done_Run_01_03");	//Это поможет тебе меньше уставать. И следи за тем, чтобы ровно дышать.
	AI_Output(self,other,"DIA_Cassia_DragonTreasure_Done_Run_01_04");	//Используй новые знания в своих следующих походах.
	CassiaTeachRegen = TRUE;
	AI_Print("Изучено: неутомимый бегун");
	Snd_Play("LevelUP");
	Info_ClearChoices(DIA_Cassia_DragonTreasure_Done);
};

func void DIA_Cassia_DragonTreasure_Done_Gold()
{
	AI_Output(other,self,"DIA_Cassia_DragonTreasure_Done_Gold_01_01");	//Лучше дай мне золото.
	AI_Output(self,other,"DIA_Cassia_DragonTreasure_Done_Gold_01_02");	//Ну, как скажешь. (ехидно) Вот, держи свое золото.
	B_GiveInvItems(self,other,ItMi_Gold,2000);
	AI_Output(self,other,"DIA_Cassia_DragonTreasure_Done_Gold_01_03");	//Этого достаточно, чтобы с лихвой покрыть все твои расходы.
	AI_Output(other,self,"DIA_Cassia_DragonTreasure_Done_Gold_01_04");	//Благодарю.
	Info_ClearChoices(DIA_Cassia_DragonTreasure_Done);
};

instance DIA_Cassia_OrcHide(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 1;
	condition = DIA_Cassia_OrcHide_condition;
	information = DIA_Cassia_OrcHide_info;
	permanent = FALSE;
	description = "Я думал, тут все мертвы.";
};

func int DIA_Cassia_OrcHide_condition()
{
	if(KAPITELORCATC == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Cassia_OrcHide_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Cassia_OrcHide_01_01");	//Я думал, тут все мертвы.
	AI_Output(self,other,"DIA_Cassia_OrcHide_01_02");	//(нервно) Как видишь, нам удалось выжить.
	AI_Output(self,other,"DIA_Cassia_OrcHide_01_03");	//Сейчас это единственное безопасное место во всем Хоринисе.
	AI_Output(other,self,"DIA_Cassia_OrcHide_01_04");	//А если они вас все-таки найдут?
	AI_Output(self,other,"DIA_Cassia_OrcHide_01_05");	//Как? (посмеиваясь) Об этой части канализации и раньше мало кто знал.
	AI_Output(self,other,"DIA_Cassia_OrcHide_01_06");	//А уж орки о ней и вовсе не догадываются.
};

instance DIA_Cassia_OrcHideWhat(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 1;
	condition = DIA_Cassia_OrcHideWhat_condition;
	information = DIA_Cassia_OrcHideWhat_info;
	permanent = FALSE;
	description = "И что вы дальше будете делать?";
};

func int DIA_Cassia_OrcHideWhat_condition()
{
	if(Npc_KnowsInfo(other,DIA_Cassia_OrcHide) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Cassia_OrcHideWhat_info()
{
	AI_Output(other,self,"DIA_Cassia_OrcHideWhat_01_01");	//И что вы будете делать дальше?
	AI_Output(self,other,"DIA_Cassia_OrcHideWhat_01_02");	//Ничего. Будем спокойно сидеть тут и поменьше высовываться наружу.
	AI_Output(other,self,"DIA_Cassia_OrcHideWhat_01_03");	//Но вы не сможете просидеть здесь всю оставшуюся жизнь!
	AI_Output(self,other,"DIA_Cassia_OrcHideWhat_01_04");	//Надеюсь, этого и не случится.
	AI_Output(self,other,"DIA_Cassia_OrcHideWhat_01_05");	//Паладины скоро вернутся сюда и освободят город. Или наш король зря их только кормит!
	AI_Output(other,self,"DIA_Cassia_OrcHideWhat_01_06");	//Ну да, в чем-то ты права.
};