
instance DIA_BAALPARVEZ_EXIT(C_Info)
{
	npc = gur_8004_parvez;
	nr = 999;
	condition = dia_baalparvez_exit_condition;
	information = dia_baalparvez_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_baalparvez_exit_condition()
{
	return TRUE;
};

func void dia_baalparvez_exit_info()
{
	AI_StopProcessInfos(self);
};

instance dia_baalparvez_PICKPOCKET(C_Info)
{
	npc = gur_8004_parvez;
	nr = 900;
	condition = dia_baalparvez_PICKPOCKET_Condition;
	information = dia_baalparvez_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int dia_baalparvez_PICKPOCKET_Condition()
{
	return C_Beklauen(49,35);
};

func void dia_baalparvez_PICKPOCKET_Info()
{
	Info_ClearChoices(dia_baalparvez_PICKPOCKET);
	Info_AddChoice(dia_baalparvez_PICKPOCKET,Dialog_Back,dia_baalparvez_PICKPOCKET_BACK);
	Info_AddChoice(dia_baalparvez_PICKPOCKET,DIALOG_PICKPOCKET,dia_baalparvez_PICKPOCKET_DoIt);
};

func void dia_baalparvez_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(dia_baalparvez_PICKPOCKET);
};

func void dia_baalparvez_PICKPOCKET_BACK()
{
	Info_ClearChoices(dia_baalparvez_PICKPOCKET);
};


instance DIA_BAALPARVEZ_NOTALK_SLEEPER(C_Info)
{
	npc = gur_8004_parvez;
	nr = 1;
	condition = dia_baalparvez_notalk_sleeper_condition;
	information = dia_baalparvez_notalk_sleeper_info;
	permanent = FALSE;
	important = FALSE;
	description = "Да пребудет с тобой Спящий!";
};


func int dia_baalparvez_notalk_sleeper_condition()
{
	if((IDOLPARVEZ_YES == FALSE) && ((other.guild == GIL_NONE) || (other.guild == GIL_SEK)))
	{
		return TRUE;
	};
};

func void dia_baalparvez_notalk_sleeper_info()
{
	AI_Output(other,self,"DIA_BaalParvez_NoTalk_Sleeper_01_00");	//Да пребудет с тобой Спящий!
	AI_Output(self,other,"DIA_BaalParvez_NoTalk_Sleeper_01_01");	//(вздох)
	AI_StopProcessInfos(self);
};


instance DIA_BAALPARVEZ_NOTALK_IMP(C_Info)
{
	npc = gur_8004_parvez;
	nr = 1;
	condition = dia_baalparvez_notalk_imp_condition;
	information = dia_baalparvez_notalk_imp_info;
	permanent = TRUE;
	important = FALSE;
	description = "Все в порядке, приятель?";
};


func int dia_baalparvez_notalk_imp_condition()
{
	if((IDOLPARVEZ_YES == FALSE) && ((other.guild == GIL_NONE) || (other.guild == GIL_SEK)))
	{
		return TRUE;
	};
};

func void dia_baalparvez_notalk_imp_info()
{
	AI_Output(other,self,"DIA_BaalParvez_NoTalk_Imp_01_00");	//Все в порядке, приятель?
	AI_Output(self,other,"DIA_BaalParvez_NoTalk_Sleeper_01_01");	//(вздох)
	AI_StopProcessInfos(self);
};


instance DIA_BAALPARVEZ_SPECIALJOINT(C_Info)
{
	npc = gur_8004_parvez;
	nr = 1;
	condition = dia_baalparvez_specialjoint_condition;
	information = dia_baalparvez_specialjoint_info;
	permanent = TRUE;
	important = FALSE;
	description = "(предложить приготовленный 'Зов Сна')";
};

func int dia_baalparvez_specialjoint_condition()
{
	if((IDOLPARVEZ_YES == FALSE) && (CANBEGURU == TRUE) && (other.guild == GIL_SEK) && (Npc_HasItems(other,itmi_specialjoint) >= 1))
	{
		return TRUE;
	};
};

func void dia_baalparvez_specialjoint_info()
{
	AI_Output(other,self,"DIA_BaalParvez_SpecialJoint_01_00");	//Вот, господин мой, - примите сей скромный дар от вашего верного ученика.
	AI_StopProcessInfos(self);
	B_GiveInvItems(other,self,itmi_specialjoint,1);
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};
	AI_UseItem(self,itmi_specialjoint);
	AI_Output(self,other,"DIA_BaalParvez_SpecialJoint_01_01");	//Мммм...
	IDOLPARVEZ_YES = TRUE;
	Npc_SetRefuseTalk(self,5);
	hero.aivar[AIV_INVINCIBLE] = FALSE;
};


instance DIA_BAALPARVEZ_SPECIALJOINTOK(C_Info)
{
	npc = gur_8004_parvez;
	nr = 1;
	condition = dia_baalparvez_specialjointok_condition;
	information = dia_baalparvez_specialjointok_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_baalparvez_specialjointok_condition()
{
	if((IDOLPARVEZ_YES == TRUE) && (other.guild == GIL_SEK))
	{
		return TRUE;
	};
};

func void dia_baalparvez_specialjointok_info()
{
	AI_Output(self,other,"DIA_BaalParvez_SpecialJointOk_01_00");	//Во имя Спящего! Меня посетило видение!
	AI_Output(self,other,"DIA_BaalParvez_SpecialJointOk_01_01");	//Это было невероятно! Я видел, что мы встретили нового брата, который был не похож на всех тех, что были до него.
	AI_Output(self,other,"DIA_BaalParvez_SpecialJointOk_01_02");	//Он что-то делал для нас... В руке у него был меч, и он спускался по широкой лестнице. На этом видение закончилось.
	AI_Output(self,other,"DIA_BaalParvez_SpecialJointOk_01_03");	//Он был очень похож на ТЕБЯ. Кто ты? Что тебе нужно?
	AI_Output(other,self,"DIA_BaalParvez_SpecialJointOk_01_04");	//Я бы хотел присоединиться к Братству и прошу вашего согласия, господин.
	AI_Output(self,other,"DIA_BaalParvez_SpecialJointOk_01_05");	//Хмм...(пристально смотрит) Кто послал тебя ко мне?
	AI_Output(other,self,"DIA_BaalParvez_SpecialJointOk_01_06");	//Меня послал Идол Оран. Он сказал, что я должен получить на то ваше одобрение.
	AI_Output(self,other,"DIA_BaalParvez_SpecialJointOk_01_07");	//Что же, если тебя прислал Идол Оран, - это вполне возможно.
	AI_Output(self,other,"DIA_BaalParvez_SpecialJointOk_01_08");	//Окажи мне одну услугу. Докажи свою преданность, и тогда я дам свое согласие на то, чтобы ты стал одним из нас.
	AI_Output(other,self,"DIA_BaalParvez_SpecialJointOk_01_09");	//Как я могу доказать свою преданность?
	AI_Output(self,other,"DIA_BaalParvez_SpecialJointOk_01_10");	//Больше всего мы нуждаемся в новых душах, постигших истину и вступивших в Круг Братства.
	AI_Output(self,other,"DIA_BaalParvez_SpecialJointOk_01_11");	//Если ты убедишь одного из неверных присоединиться к нашему Лагерю, этим ты докажешь свое стремление служить Братству.
	AI_Output(other,self,"DIA_BaalParvez_SpecialJointOk_01_12");	//Где мне найти такого человека?
	AI_Output(self,other,"DIA_BaalParvez_SpecialJointOk_01_13");	//В городе много людей, которые устали от страха и лжи. Души их жаждут просветления и поддержки.
	AI_Output(self,other,"DIA_BaalParvez_SpecialJointOk_01_14");	//Думаю, тебе стоит поискать его именно здесь. В других местах ты едва ли добьешься успеха. Там живут настоящие варвары.
	AI_Output(self,other,"DIA_BaalParvez_SpecialJointOk_01_15");	//Возвращайся ко мне, когда твои поиски подойдут к концу.
	Log_CreateTopic(TOPIC_NOVICECANJOIN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_NOVICECANJOIN,LOG_Running);
	B_LogEntry(TOPIC_NOVICECANJOIN,"Идол Парвез попросил меня привести к нему нового послушника. Это хороший шанс заслужить его расположение.");
	MIS_NOVICECANJOIN = LOG_Running;
};


instance DIA_BAALPARVEZ_VALENTINOJOIN(C_Info)
{
	npc = gur_8004_parvez;
	nr = 1;
	condition = dia_baalparvez_valentinojoin_condition;
	information = dia_baalparvez_valentinojoin_info;
	permanent = FALSE;
	important = FALSE;
	description = "Этот человек ищет твоего расположения, господин!";
};


func int dia_baalparvez_valentinojoin_condition()
{
	var C_Npc Valentino;
	Valentino = Hlp_GetNpc(VLK_421_Valentino);
	if((MIS_NOVICECANJOIN == LOG_Running) && (other.guild == GIL_SEK) && (Npc_GetDistToNpc(self,Valentino) < 500))
	{
		return TRUE;
	};
};

func void dia_baalparvez_valentinojoin_info()
{
	var C_Npc Valentino;
	Valentino = Hlp_GetNpc(VLK_421_Valentino);
	Valentino.aivar[AIV_PARTYMEMBER] = FALSE;
	AI_GotoNpc(Valentino,self);
	AI_TurnToNPC(Valentino,self);
	AI_Output(other,self,"DIA_BaalParvez_ValentinoJoin_01_00");	//Этот человек ищет твоего расположения, господин!
	AI_Output(self,other,"DIA_BaalParvez_ValentinoJoin_01_01");	//Кого ты привел ко мне? Достоин ли он?
	AI_Output(other,self,"DIA_BaalParvez_ValentinoJoin_01_02");	//Он нуждается в духовном наставнике.
	AI_Output(self,other,"DIA_BaalParvez_ValentinoJoin_01_03");	//Очень хорошо. С этого момента он будет одним из моих учеников.
	AI_TurnToNPC(self,Valentino);
	AI_TurnToNPC(Valentino,self);
	AI_Output(self,other,"DIA_BaalParvez_ValentinoJoin_01_04");	//Ты будешь приходить ко мне каждый день и слушать то, что я скажу тебе. Твоя душа еще может быть спасена.
	AI_TurnToNPC(self,other);
	Npc_ExchangeRoutine(VLK_421_Valentino,"JoinPsiCamp");
	Npc_ExchangeRoutine(gur_8004_parvez,"JoinPsiCamp");
	MIS_NOVICECANJOIN = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_NOVICECANJOIN,LOG_SUCCESS);
	B_LogEntry(TOPIC_NOVICECANJOIN,"Валентино теперь является учеником Идола Парвеза. Я выполнил поручение Гуру.");
	B_GivePlayerXP(250);
};


instance DIA_BAALPARVEZ_AGREED(C_Info)
{
	npc = gur_8004_parvez;
	nr = 1;
	condition = dia_baalparvez_agreed_condition;
	information = dia_baalparvez_agreed_info;
	permanent = FALSE;
	important = FALSE;
	description = "Господин! Я хочу стать одним из Гуру.";
};


func int dia_baalparvez_agreed_condition()
{
	if((MIS_NOVICECANJOIN == LOG_SUCCESS) && (PARVEZAGREED == FALSE))
	{
		return TRUE;
	};
};

func void dia_baalparvez_agreed_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_BaalParvez_Agreed_01_00");	//Господин! Я хочу стать одним из Гуру.
	AI_Output(self,other,"DIA_BaalParvez_Agreed_01_01");	//Хорошо. Ты доказал, что достоин этой чести!
	AI_Output(self,other,"DIA_BaalParvez_Agreed_01_02");	//Иди к Идолу Орану.
	AI_Output(self,other,"DIA_BaalParvez_Agreed_01_03");	//Теперь оставь меня. Мне нужно многое обсудить со своим новым учеником.
	AI_TurnToNPC(self,VLK_421_Valentino);
	AI_Output(self,other,"DIA_BaalParvez_Agreed_01_04");	//Следуй за мной, мой ученик.
	B_LogEntry(TOPIC_PSICAMPJOIN,"Идол Парвез согласен на мое принятие в Круг Гуру.");
	PARVEZAGREED = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_BAALPARVEZ_RUNEMAGICNOTWORK(C_Info)
{
	npc = gur_8004_parvez;
	nr = 1;
	condition = dia_baalparvez_runemagicnotwork_condition;
	information = dia_baalparvez_runemagicnotwork_info;
	permanent = FALSE;
	description = "Как обстоят дела с вашей магией?";
};


func int dia_baalparvez_runemagicnotwork_condition()
{
	if((STOPBIGBATTLE == TRUE) && (MIS_RUNEMAGICNOTWORK == LOG_Running) && (GURUMAGERUNESNOT == FALSE))
	{
		return TRUE;
	};
};

func void dia_baalparvez_runemagicnotwork_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_BaalParvez_RuneMagicNotWork_01_00");	//Как обстоят дела с вашей магией?
	AI_Output(self,other,"DIA_BaalParvez_RuneMagicNotWork_01_01");	//Наши магические руны ослабли и более не способны творить заклинания!
	AI_Output(self,other,"DIA_BaalParvez_RuneMagicNotWork_01_02");	//Мы все крайне удивлены этому обстоятельству, но ничего не можем сделать.
	AI_Output(self,other,"DIA_BaalParvez_RuneMagicNotWork_01_03");	//Все это довольно странно.
	B_LogEntry(TOPIC_RUNEMAGICNOTWORK,"Гуру Братства также лишились власти над магией рун!");
	GURUMAGERUNESNOT = TRUE;
};

instance DIA_BaalParvez_PrioratStart(C_Info)
{
	npc = gur_8004_parvez;
	nr = 1;
	condition = DIA_BaalParvez_PrioratStart_condition;
	information = DIA_BaalParvez_PrioratStart_info;
	permanent = FALSE;
	description = "Меня прислал Идол Намиб.";
};

func int DIA_BaalParvez_PrioratStart_condition()
{
	if(MIS_PrioratStart == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_BaalParvez_PrioratStart_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_BaalParvez_PrioratStart_01_00");	//Меня прислал Идол Намиб.
	AI_Output(self,other,"DIA_BaalParvez_PrioratStart_01_01");	//(вздох)
	AI_Output(other,self,"DIA_BaalParvez_PrioratStart_01_02");	//Дело касается пропавших послушников Братства. Ты ничего не знаешь об этом?
	AI_Output(self,other,"DIA_BaalParvez_PrioratStart_01_03");	//Ну, раз ты в курсе происходящего, значит, Намиб тебе действительно доверяет.
	AI_Output(self,other,"DIA_BaalParvez_PrioratStart_01_04");	//Отвечая на твой вопрос, я могу сказать тебе лишь одно - в городе их нет.
	AI_Output(other,self,"DIA_BaalParvez_PrioratStart_01_05");	//Ты в этом уверен?
	AI_Output(self,other,"DIA_BaalParvez_PrioratStart_01_06");	//Абсолютно! Они никогда бы не прошли мимо городской стражи незамеченными. Уж я бы об этом точно знал.
	AI_Output(self,other,"DIA_BaalParvez_PrioratStart_01_07");	//Однако, если ты мне не веришь, то можешь поискать их сам.
	AI_Output(other,self,"DIA_BaalParvez_PrioratStart_01_08");	//Хорошо, я передам Идолу Намибу твои слова. Прощай!
	AI_Output(self,other,"DIA_BaalParvez_PrioratStart_01_09");	//(вздох)
	PsiCamp_04_Ok = TRUE;
	B_LogEntry(TOPIC_PrioratStart,"По словам Идола Парвеза, в городе пропавшие послушники не появлялись.");
};
