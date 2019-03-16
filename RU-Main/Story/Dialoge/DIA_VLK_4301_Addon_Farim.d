
instance DIA_Addon_Farim_EXIT(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 999;
	condition = DIA_Addon_Farim_EXIT_Condition;
	information = DIA_Addon_Farim_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Farim_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Farim_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Farim_PICKPOCKET(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 900;
	condition = DIA_Addon_Farim_PICKPOCKET_Condition;
	information = DIA_Addon_Farim_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Farim_PICKPOCKET_Condition()
{
	return C_Beklauen(20,11);
};

func void DIA_Addon_Farim_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Farim_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Farim_PICKPOCKET,Dialog_Back,DIA_Addon_Farim_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Farim_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Farim_PICKPOCKET_DoIt);
};

func void DIA_Addon_Farim_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Farim_PICKPOCKET);
};

func void DIA_Addon_Farim_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Farim_PICKPOCKET);
};


instance DIA_Addon_Farim_Hallo(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 5;
	condition = DIA_Addon_Farim_Hallo_Condition;
	information = DIA_Addon_Farim_Hallo_Info;
	description = "Ты рыбак?";
};


func int DIA_Addon_Farim_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Addon_Farim_Hallo_Info()
{
	AI_Output(other,self,"DIA_Addon_Farim_Hallo_15_00");	//Ты рыбак?
	AI_Output(self,other,"DIA_Addon_Farim_Hallo_11_01");	//Интересно, как ты догадался?
	AI_Output(self,other,"DIA_Addon_Farim_Hallo_11_02");	//Не мог бы ты оставить меня в покое?

	if(hero.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Addon_Farim_Landstreicher_Add_11_02");	//Не принимай это на свой счет, но в последнее время от ополчения у меня одни неприятности.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Farim_Landstreicher_Add_11_03");	//Не принимай на свой счет. Просто в последнее время у меня неприятности с ополчением.
	};
};


instance DIA_Addon_Farim_MilizProbs(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 5;
	condition = DIA_Addon_Farim_MilizProbs_Condition;
	information = DIA_Addon_Farim_MilizProbs_Info;
	description = "Неприятности с ополчением?";
};

func int DIA_Addon_Farim_MilizProbs_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Farim_Hallo))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Farim_MilizProbs_Info()
{
	AI_Output(other,self,"DIA_Addon_Farim_MilizProbs_15_00");	//Неприятности с ополчением?
	if(((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL)) == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_11_01");	//Эти подонки приходят ко мне и забирают все, что им вздумается.
	};
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_11_02");	//На прошлой неделе они забрали весь мой улов. Сказали, что он пойдет на благое дело.
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_11_03");	//Я, конечно, понимаю, что после того, как фермеры прекратили торговать с городом, все выкручиваются, как могут.
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_11_04");	//Иногда им не хватает еды. Не удивительно, что они забирают мою рыбу.
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_11_05");	//Но если они продолжат так поступать, мне самому нечего будет есть.
	Info_ClearChoices(DIA_Addon_Farim_MilizProbs);
	Info_AddChoice(DIA_Addon_Farim_MilizProbs,"Отдай мне всю свою рыбу.",DIA_Addon_Farim_MilizProbs_klauen);
	Info_AddChoice(DIA_Addon_Farim_MilizProbs,"Может быть, я смогу помочь.",DIA_Addon_Farim_MilizProbs_helfen);
	Info_AddChoice(DIA_Addon_Farim_MilizProbs,"Ты рассказывал об этом паладинам?",DIA_Addon_Farim_MilizProbs_paladine);
};

func void DIA_Addon_Farim_MilizProbs_paladine()
{
	AI_Output(other,self,"DIA_Addon_Farim_MilizProbs_paladine_15_00");	//Ты рассказывал об этом паладинам?
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_paladine_11_01");	//Ты шутишь? Ты действительно думаешь, что их заинтересует, что у какого-то бедняка возникли проблемы с ополчением?
};


var int Farim_PissedOff;

func void DIA_Addon_Farim_MilizProbs_klauen()
{
	AI_Output(other,self,"DIA_Addon_Farim_MilizProbs_klauen_15_00");	//Отдай мне всю свою рыбу.
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_klauen_11_01");	//(сердито) Я так и знал! Ты просто очередной подонок.
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_klauen_11_02");	//Боюсь, ты опоздал. Здесь уже побывали твои друзья, которые все забрали.
	};
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_klauen_11_04");	//Думаю, тебе лучше уйти.
	Farim_PissedOff = TRUE;
	Info_ClearChoices(DIA_Addon_Farim_MilizProbs);
};

func void DIA_Addon_Farim_MilizProbs_helfen()
{
	AI_Output(other,self,"DIA_Addon_Farim_MilizProbs_helfen_15_00");	//Может быть, я смогу тебе помочь.
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_helfen_11_02");	//Не знаю... Полагаю, тут нужен кто-нибудь, имеющий влияние на ополчение или паладинов.
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_helfen_11_03");	//Хотя вряд ли паладины будут покупать у меня рыбу.
	AI_Output(other,self,"DIA_Addon_Farim_MilizProbs_helfen_15_04");	//Я посмотрю, что можно сделать.
	Info_ClearChoices(DIA_Addon_Farim_MilizProbs);
	Log_CreateTopic(TOPIC_Addon_FarimsFish,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_FarimsFish,LOG_Running);
	B_LogEntry(TOPIC_Addon_FarimsFish,"У рыбака Фарима проблемы с ополчением. Они забирают у него столько рыбы, что ему не хватает на жизнь. Чтобы помочь ему, я должен поговорить с кем-нибудь, имеющим влияние среди паладинов.");
	MIS_Addon_Farim_PaladinFisch = LOG_Running;
};


instance DIA_Addon_Farim_MartinHelps(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 5;
	condition = DIA_Addon_Farim_MartinHelps_Condition;
	information = DIA_Addon_Farim_MartinHelps_Info;
	description = "Я знаю, как решить твои проблемы с ополчением.";
};


func int DIA_Addon_Farim_MartinHelps_Condition()
{
	if((MIS_Addon_Farim_PaladinFisch == LOG_Running) && (Martin_KnowsFarim == TRUE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Farim_MartinHelps_Info()
{
	B_GivePlayerXP(XP_Addon_Farim_PaladinFisch);
	AI_Output(other,self,"DIA_Addon_Farim_MartinHelps_15_00");	//Я знаю, как решить твои проблемы с ополчением.
	AI_Output(self,other,"DIA_Addon_Farim_MartinHelps_11_01");	//И как же?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(other,self,"DIA_Addon_Farim_MartinHelps_15_02");	//Я бываю здесь слишком редко, чтобы постоянно присматривать за твоей рыбой.
		AI_Output(other,self,"DIA_Addon_Farim_MartinHelps_15_03");	//Но я знаю кое-кого, кто может тебе помочь.
	};
	AI_Output(other,self,"DIA_Addon_Farim_MartinHelps_15_04");	//Мартин, интендант паладинов, хочет выслушать твою историю об ополчении и рыбе.
	AI_Output(self,other,"DIA_Addon_Farim_MartinHelps_11_05");	//Думаешь, он сможет сделать так, чтобы люди из ополчения оставили меня в покое?
	AI_Output(other,self,"DIA_Addon_Farim_MartinHelps_15_06");	//Он так сказал.
	AI_Output(self,other,"DIA_Addon_Farim_MartinHelps_11_07");	//Отлично! Спасибо тебе! Мне нечем тебе заплатить... Хотя постой...
	AI_Output(self,other,"DIA_Addon_Farim_MartinHelps_11_08");	//Я нашел этот странный камень на одном из островов у побережья Хориниса.
	AI_Output(self,other,"DIA_Addon_Farim_MartinHelps_11_09");	//Не думаю, что он очень ценный, но такой человек, как ты, наверняка найдет ему применение.
	AI_Output(self,other,"DIA_Addon_Farim_MartinHelps_11_10");	//Кроме этого, если хочешь, я смогу продать тебе немного рыбы и все остальное, чем одаряет меня море.
	B_GiveInvItems(self,other,ItMi_Aquamarine,1);
	MIS_Addon_Farim_PaladinFisch = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_Addon_FarimsFish,LOG_SUCCESS);
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,"Фарим теперь сможет продавать мне рыбу и другие дары моря.");
};

instance DIA_Addon_Farim_Trade(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 5;
	condition = DIA_Addon_Farim_Trade_Condition;
	information = DIA_Addon_Farim_Trade_Info;
	permanent = TRUE;
	description = "Покажи мне свои товары.";
	trade = TRUE;
};

func int DIA_Addon_Farim_Trade_Condition()
{
	if((MIS_Addon_Farim_PaladinFisch == LOG_SUCCESS) && Wld_IsTime(7,0,22,0))
	{
		return TRUE;
	};
};

func void DIA_Addon_Farim_Trade_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Lutero_Trade_15_00");	//Покажи мне свои товары.
	B_GiveTradeInv(self);
};

instance DIA_Addon_Farim_Landstreicher(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 5;
	condition = DIA_Addon_Farim_Landstreicher_Condition;
	information = DIA_Addon_Farim_Landstreicher_Info;
	description = "Ты знаешь что-нибудь о пропавших людях?";
};

func int DIA_Addon_Farim_Landstreicher_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Farim_Hallo) && (MIS_Addon_Vatras_WhereAreMissingPeople == LOG_Running))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Farim_Landstreicher_Info()
{
	AI_Output(other,self,"DIA_Addon_Farim_Landstreicher_15_01");	//Ты знаешь что-нибудь о пропавших людях?
	AI_Output(self,other,"DIA_Addon_Farim_Landstreicher_11_02");	//Мой друг Вильям встречался с какими-то подозрительными типами. И к чему это его привело?
	AI_Output(self,other,"DIA_Addon_Farim_Landstreicher_11_03");	//Однажды он просто не пришел на работу. Больше я его не видел.
	SCKnowsFarimAsWilliamsFriend = TRUE;
};


instance DIA_Addon_Farim_William(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 5;
	condition = DIA_Addon_Farim_William_Condition;
	information = DIA_Addon_Farim_William_Info;
	description = "Пропал твой приятель Вильям?";
};


func int DIA_Addon_Farim_William_Condition()
{
	if((SCKnowsFarimAsWilliamsFriend == TRUE) && Npc_KnowsInfo(other,DIA_Addon_Farim_Hallo))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Farim_William_Info()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_15_00");	//Пропал твой приятель Вильям?
	AI_Output(self,other,"DIA_Addon_Farim_William_11_01");	//Именно так. Он был рыбаком, но на мой взгляд он слишком зазнался.
	AI_Output(self,other,"DIA_Addon_Farim_William_11_02");	//Ему следовало держаться подальше от этой шайки.
	Log_CreateTopic(TOPIC_Addon_MissingPeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople,LOG_Running);
	Log_AddEntry(TOPIC_Addon_MissingPeople,LogText_Addon_WilliamMissing);
	Info_ClearChoices(DIA_Addon_Farim_William);
	Info_AddChoice(DIA_Addon_Farim_William,"Но что это были за люди?",DIA_Addon_Farim_William_typen);
	Info_AddChoice(DIA_Addon_Farim_William,"Думаю, он еще появится.",DIA_Addon_Farim_William_auftauchen);
	Info_AddChoice(DIA_Addon_Farim_William,"Чем он занимался?",DIA_Addon_Farim_William_WasGemacht);
	Info_AddChoice(DIA_Addon_Farim_William,"Когда ты видел Вильяма в последний раз?",DIA_Addon_Farim_William_WannWeg);
};

func void DIA_Addon_Farim_William_WasGemacht()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_WasGemacht_15_00");	//Чем он занимался?
	AI_Output(self,other,"DIA_Addon_Farim_William_WasGemacht_11_01");	//У него были какие-то темные делишки с этими жуликами.
	AI_Output(self,other,"DIA_Addon_Farim_William_WasGemacht_11_02");	//Думаю, он продавал им контрабанду.
};

func void DIA_Addon_Farim_William_typen()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_typen_15_00");	//Но что это были за люди?
	AI_Output(self,other,"DIA_Addon_Farim_William_typen_11_01");	//Я не знаю ни кто они, ни что им было нужно в Хоринисе.
	AI_Output(self,other,"DIA_Addon_Farim_William_typen_11_02");	//Могу только сказать тебе, где они встречались с Вильямом.
	AI_Output(self,other,"DIA_Addon_Farim_William_typen_11_03");	//Я один раз увидел его, когда рыбачил в заливе.
	Info_AddChoice(DIA_Addon_Farim_William,"Где именно находится это место?",DIA_Addon_Farim_William_Wo);
};

func void DIA_Addon_Farim_William_Wo()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_Wo_15_00");	//Где именно находится это место?
	AI_Output(self,other,"DIA_Addon_Farim_William_Wo_11_01");	//К северу отсюда есть небольшая бухта.
	AI_Output(self,other,"DIA_Addon_Farim_William_Wo_11_02");	//Туда можно приплыть самому или на лодке.
	AI_Output(self,other,"DIA_Addon_Farim_William_Wo_11_03");	//На берегу этой бухты расположен небольшой рыбацкий лагерь. Там-то я их и видел.
	self.flags = 0;
	Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_WhoStolePeople,"Рыбак Фарим пожаловался мне, что пропал его приятель Вильям. Фарим рассказал, что Вильям встречался с какими-то головорезами на пляже к северу от гавани.");
	Info_AddChoice(DIA_Addon_Farim_William,"Я услышал все, что хотел знать.",DIA_Addon_Farim_William_Tschau);
};

func void DIA_Addon_Farim_William_WannWeg()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_WannWeg_15_00");	//Когда ты видел Вильяма в последний раз?
	AI_Output(self,other,"DIA_Addon_Farim_William_WannWeg_11_01");	//Несколько дней назад.
	Info_AddChoice(DIA_Addon_Farim_William,"Может быть, он просто ушел в море рыбачить?",DIA_Addon_Farim_William_Fischen);
};

func void DIA_Addon_Farim_William_Fischen()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_Fischen_15_00");	//Может быть, он просто ушел в море рыбачить?
	AI_Output(self,other,"DIA_Addon_Farim_William_Fischen_11_01");	//Не похоже. Его лодка стоит на якоре в гавани.
};

func void DIA_Addon_Farim_William_auftauchen()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_auftauchen_15_00");	//Думаю, он еще появится.
	AI_Output(self,other,"DIA_Addon_Farim_William_auftauchen_11_01");	//Вряд ли. Его не было слишком долго.
	AI_Output(self,other,"DIA_Addon_Farim_William_auftauchen_11_02");	//Боюсь, через некоторое время его тело прибьет к берегу волнами.
};

func void DIA_Addon_Farim_William_Tschau()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_Tschau_15_00");	//Я услышал все, что хотел знать.
	AI_Output(self,other,"DIA_Addon_Farim_William_Tschau_11_01");	//Тебе не стоит беспокоиться. Не думаю, что ты его найдешь.
	Info_ClearChoices(DIA_Addon_Farim_William);
};


instance DIA_Addon_Farim_Perm(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 99;
	condition = DIA_Addon_Farim_Perm_Condition;
	information = DIA_Addon_Farim_Perm_Info;
	permanent = TRUE;
	description = "Как клюет?";
};

func int DIA_Addon_Farim_Perm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Farim_Hallo) && (FARIMRECRUITEDDT == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Farim_Perm_Info()
{
	AI_Output(other,self,"DIA_Addon_Farim_Perm_15_00");	//Как клюет?

	if(Farim_PissedOff == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Farim_Perm_11_01");	//Прекрати изображать интерес.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Farim_Perm_11_02");	//Бывало и получше. Выжить сейчас сложно, а вот погибнуть - проще простого.
	};
};


instance DIA_Addon_Farim_WilliamReport(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 1;
	condition = DIA_Addon_Farim_WilliamReport_Condition;
	information = DIA_Addon_Farim_WilliamReport_Info;
	important = TRUE;
};


func int DIA_Addon_Farim_WilliamReport_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Farim_William))
	{
		if((Npc_HasItems(other,ITWr_Addon_William_01) > 0) || (Saturas_AboutWilliam == TRUE))
		{
			return TRUE;
		};
	};
	return FALSE;
};

func void DIA_Addon_Farim_WilliamReport_Info()
{
	AI_Output(self,other,"DIA_Addon_Farim_Add_11_01");	//А, это снова ты!
	AI_Output(self,other,"DIA_Addon_Farim_Add_11_02");	//Есть какие-нибудь новости о Вильяме?
	AI_Output(other,self,"DIA_Addon_Farim_Add_15_02");	//Он мертв.
	AI_Output(self,other,"DIA_Addon_Farim_Add_11_03");	//(вздыхает) Так я и думал.
	AI_Output(self,other,"DIA_Addon_Farim_Add_11_04");	//Что ж, спасибо, что рассказал.
	AI_Output(self,other,"DIA_Addon_Farim_Add_11_05");	//Пойду-ка я в кабак и пропью его долю из нашего последнего улова. Он бы хотел, чтобы я так поступил...
};

instance DIA_Addon_Farim_Uha(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 5;
	condition = DIA_Addon_Farim_Uha_condition;
	information = DIA_Addon_Farim_Uha_info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_Addon_Farim_Uha_condition()
{
	if(MIS_Addon_Farim_PaladinFisch == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Addon_Farim_Uha_info()
{
	AI_Output(self,other,"DIA_Addon_Farim_Uha_01_01");	//Погоди минутку...
	AI_Output(other,self,"DIA_Addon_Farim_Uha_01_02");	//Что еще такое?
	AI_Output(self,other,"DIA_Addon_Farim_Uha_01_03");	//У тебя случайно не найдется немного времени, чтобы выслушать старика?
	Info_ClearChoices(DIA_Addon_Farim_Uha);
	Info_AddChoice(DIA_Addon_Farim_Uha,"Мне некогда.",DIA_Addon_Farim_Uha_no);
	Info_AddChoice(DIA_Addon_Farim_Uha,"Да, конечно.",DIA_Addon_Farim_Uha_yes);
};

func void DIA_Addon_Farim_Uha_no()
{
	AI_Output(other,self,"DIA_Addon_Farim_Uha_no_01_00");	//Мне некогда.
	AI_Output(self,other,"DIA_Addon_Farim_Uha_no_01_01");	//Ну, извини, что снова побеспокоил...
	AI_StopProcessInfos(self);
};

func void DIA_Addon_Farim_Uha_yes()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Addon_Farim_Uha_yes_01_01");	//Да, конечно.
	AI_Output(self,other,"DIA_Addon_Farim_Uha_yes_01_02");	//Понимаешь, тут такое дело...(покашливая) Прихворал я в общем немного.
	AI_Output(self,other,"DIA_Addon_Farim_Uha_yes_01_03");	//Изо дня в день эта возня у воды с сетями, рыбой...
	AI_Output(self,other,"DIA_Addon_Farim_Uha_yes_01_04");	//Вот, видимо, и продуло меня на сквознячке. А работать-то нужно, чтобы хоть как-то сводить концы с концами.
	AI_Output(other,self,"DIA_Addon_Farim_Uha_yes_01_05");	//А я чем могу помочь?
	AI_Output(self,other,"DIA_Addon_Farim_Uha_yes_01_06");	//Помню, во времена моей молодости я ел замечательную уху - не простую, а сборную!
	AI_Output(self,other,"DIA_Addon_Farim_Uha_yes_01_07");	//Туда, помимо рыбы, шел старый сыр, грибы и зелень. А приправлялось это блюдо красным перцем.
	AI_Output(self,other,"DIA_Addon_Farim_Uha_yes_01_08");	//Съешь уху - и тебя сразу же всего пробирает до костей! Чувствуешь себя богатырем, и есть не хочется долго.
	AI_Output(other,self,"DIA_Addon_Farim_Uha_yes_01_09");	//Так в чем проблема? Возьми да приготовь эту свою сборную уху.
	AI_Output(self,other,"DIA_Addon_Farim_Uha_yes_01_10");	//Да я бы с радостью... если бы знал, как!
	AI_Output(self,other,"DIA_Addon_Farim_Uha_yes_01_12");	//В общем, самому мне эту прелесть никак не приготовить, а силы поправить хочется.
	AI_Output(other,self,"DIA_Addon_Farim_Uha_yes_01_13");	//Ладно, старик, помогу чем смогу.
	AI_Output(self,other,"DIA_Addon_Farim_Uha_yes_01_14");	//Тогда вот, возьми хотя бы рыбу. Надеюсь, что ты поможешь, а я в долгу не останусь.
	AI_Output(self,other,"DIA_Addon_Farim_Uha_yes_01_15");	//Поверь, у меня есть чем отблагодарить - недавно после шторма море принесло много всякого добра.
	B_GiveInvItems(self,other,ItFo_Fish,5);
	MIS_FARIM_QUEST = LOG_Running;
	Log_CreateTopic(TOPIC_ADDON_FARIMFISH,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_FARIMFISH,LOG_Running);
	B_LogEntry(TOPIC_ADDON_FARIMFISH,"Рыбак Фарим попросил меня приготовить для него особую уху, называемую 'сборной'.");
	Info_ClearChoices(DIA_Addon_Farim_Uha);
};


instance DIA_Addon_Farim_Uha_Done(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 5;
	condition = DIA_Addon_Farim_Uha_Done_condition;
	information = DIA_Addon_Farim_Uha_Done_info;
	permanent = FALSE;
	description = "Я принес твою сборную уху.";
};

func int DIA_Addon_Farim_Uha_Done_condition()
{
	if((Npc_HasItems(hero,itfo_schildkroetesoup_sborka) >= 1) && (MIS_FARIM_QUEST == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Farim_Uha_Done_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Addon_Farim_Uha_Done_01_01");	//Я принес твою сборную уху.
	B_GiveInvItems(other,self,itfo_schildkroetesoup_sborka,1);
	AI_Output(self,other,"DIA_Addon_Farim_Uha_Done_01_02");	//Ох, спасибо приятель...(покашливая) Это как раз то, что мне сейчас надо!
	AI_Output(self,other,"DIA_Addon_Farim_Uha_Done_01_03");	//Ты уж прости, что из рук вырываю, просто так не терпится ее попробовать снова.
	B_UseItem(self,itfo_schildkroetesoup_sborka);
	AI_Output(self,other,"DIA_Addon_Farim_Uha_Done_01_04");	//Ммм, как вкусно... Ну, а награду можешь выбрать сам.
	KNOWS_UHA = TRUE;
	MIS_FARIM_QUEST = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_ADDON_FARIMFISH,LOG_SUCCESS);
	B_LogEntry(TOPIC_ADDON_FARIMFISH,"Я принес уху Фариму. Он был очень благодарен и неплохо меня наградил за старания.");
	Info_ClearChoices(DIA_Addon_Farim_Uha_Done);
	Info_AddChoice(DIA_Addon_Farim_Uha_Done,"Дай мне черную жемчужину.",DIA_Addon_Farim_Uha_Done_Gemchug);
	Info_AddChoice(DIA_Addon_Farim_Uha_Done,"Дай мне гребешки и креветки.",DIA_Addon_Farim_Uha_Done_Grebni);
};

func void DIA_Addon_Farim_Uha_Done_Gemchug()
{
	AI_Output(other,self,"DIA_Addon_Farim_Uha_Done_Gemchug_01_01");	//Дай мне черную жемчужину.
	AI_Output(self,other,"DIA_Addon_Farim_Uha_Done_Gemchug_01_02");	//Вот, держи.
	B_GiveInvItems(self,other,ItMi_DarkPearl,1);
	AI_StopProcessInfos(self);
};

func void DIA_Addon_Farim_Uha_Done_Grebni()
{
	AI_Output(other,self,"DIA_Addon_Farim_Uha_Done_Grebni_01_01");	//Отдай мне те гребешки и креветки, которые ты нашел после шторма.
	AI_Output(self,other,"DIA_Addon_Farim_Uha_Done_Grebni_01_02");	//Вот, держи.
	B_GiveInvItems(self,other,ItMi_Addon_Shell_01,10);
	B_GiveInvItems(self,other,ItMi_Addon_Shell_02,5);
	AI_StopProcessInfos(self);
};

instance DIA_FARIM_RECRDTSUGG(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 8;
	condition = dia_farim_recrdtsugg_condition;
	information = dia_farim_recrdtsugg_info;
	permanent = FALSE;
	description = "Как рыба? Клюет?";
};

func int dia_farim_recrdtsugg_condition()
{
	if((MIS_Addon_Farim_PaladinFisch == LOG_SUCCESS) && (HURRAYICANHIRE == TRUE))
	{
		return TRUE;
	};
};

func void dia_farim_recrdtsugg_info()
{
	AI_Output(other,self,"DIA_FARIM_RecrDTSugg_15_00");	//Как рыба? Клюет?
	AI_Output(self,other,"DIA_FARIM_RecrDTSugg_99_01");	//Ой, не спрашивай. Не сыпь мне соль на рану.
	AI_Output(other,self,"DIA_FARIM_RecrDTSugg_15_02");	//Что, неужели совсем плохой улов?
	AI_Output(self,other,"DIA_FARIM_RecrDTSugg_99_03");	//Эх, улов-то как раз сейчас неплохой. Сезон, понимаешь ли.
	AI_Output(self,other,"DIA_FARIM_RecrDTSugg_99_04");	//Да вот как на зло, покупать мою рыбу никто не хочет.
	AI_Output(other,self,"DIA_FARIM_RecrDTSugg_15_05");	//Почему?
	AI_Output(self,other,"DIA_FARIM_RecrDTSugg_99_06");	//Неужели ты не слышал? На весь город скандал был.
	AI_Output(self,other,"DIA_FARIM_RecrDTSugg_99_07");	//Какая-то богачка из верхнего квартала начиталась всяких экзотических рецептов, ну и решила блеснуть своими познаниями перед знакомыми.
	AI_Output(self,other,"DIA_FARIM_RecrDTSugg_99_08");	//Накупила у меня рыбы и понаделала из нее этих ... как их...
	AI_Output(self,other,"DIA_FARIM_RecrDTSugg_99_09");	//А, неважно! Главное, что все блюда у нее были из сырой рыбы. Представляешь, сырой!
	AI_Output(self,other,"DIA_FARIM_RecrDTSugg_99_10");	//Ну ведь любому здравомыслящему человеку ясно, что рыбу нужно или прожарить, или отварить, или протушить.
	AI_Output(self,other,"DIA_FARIM_RecrDTSugg_99_11");	//Как можно додуматься есть ее сырой? Гадость какая...
	AI_Output(self,other,"DIA_FARIM_RecrDTSugg_99_12");	//Впрочем, я отвлекся.
	AI_Output(self,other,"DIA_FARIM_RecrDTSugg_99_13");	//Так вот, эта особо одаренная барышня накупила рыбы, наделала этих самых сусей, небось, еще и неправильно, созвала гостей и устроила званый ужин.
	AI_Output(self,other,"DIA_FARIM_RecrDTSugg_99_14");	//Естественно, после ужина всем сильно поплохело.
	AI_Output(self,other,"DIA_FARIM_RecrDTSugg_99_15");	//А кто виноват, что у дамы нет мозгов?
	AI_Output(self,other,"DIA_FARIM_RecrDTSugg_99_16");	//Ну, конечно же, рыбак Фарим!
	AI_Output(self,other,"DIA_FARIM_RecrDTSugg_99_17");	//В общем, она на весь город растрезвонила о том, что у меня некачественная рыба.
	AI_Output(self,other,"DIA_FARIM_RecrDTSugg_99_18");	//Даже к лорду Андрэ ходила и губернатору жаловалась.
	AI_Output(self,other,"DIA_FARIM_RecrDTSugg_99_19");	//К счастью, лорд Андрэ оказался человеком неглупым и не стал ее слушать.
	AI_Output(self,other,"DIA_FARIM_RecrDTSugg_99_20");	//Еще бы: весь город годами ел мою рыбу, никаких претензий, и вдруг какая-то тупая су... сепроизводительница завопила 'У него некачественная рыба!'. Вот ведь шала... Шаланда!
	AI_Output(self,other,"DIA_FARIM_RecrDTSugg_99_21");	//Тем не менее, большинство горожан послушало эту идиотку.
	AI_Output(self,other,"DIA_FARIM_RecrDTSugg_99_22");	//Кто-то даже стал меня обвинять, что я какое-то гемео в рыбу добавляю, и что из-за этого гемео у них жабры потом вырастут.
	AI_Output(self,other,"DIA_FARIM_RecrDTSugg_99_23");	//Одним словом, теперь я сижу с рыбой, но без клиентов и золота.
	AI_Output(self,other,"DIA_FARIM_RecrDTSugg_99_24");	//А ты чего-то хотел?
	Info_ClearChoices(dia_farim_recrdtsugg);
	Info_AddChoice(dia_farim_recrdtsugg,"Нет, просто спросил.",dia_farim_recrdtsugg_no);
	Info_AddChoice(dia_farim_recrdtsugg,"Я куплю твою рыбу.",dia_farim_recrdtsugg_yes);
};

func void dia_farim_recrdtsugg_no()
{
	AI_Output(other,self,"DIA_FARIM_RecrDTSugg_No_15_00");	//Ничего, просто поинтересовался.
	AI_Output(self,other,"DIA_FARIM_RecrDTSugg_No_99_01");	//Ааа... а я уж подумал...ладно тогда, бывай!
	AI_StopProcessInfos(self);
};

func void dia_farim_recrdtsugg_yes()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_FARIM_RecrDTSugg_Yes_15_00");	//Я куплю твою рыбу.
	AI_Output(self,other,"DIA_FARIM_RecrDTSugg_Yes_99_01");	//О, это без проблем. Тебе сколько? Одну, две? Если купишь сразу пять, сделаю скидку!
	AI_Output(other,self,"DIA_FARIM_RecrDTSugg_Yes_15_02");	//Ты меня не совсем понял. Я куплю ВСЮ твою рыбу.
	AI_Output(self,other,"DIA_FARIM_RecrDTSugg_Yes_99_03");	//Эээ...всю рыбу? Но ты же ее один не съешь! Она же спортится!
	AI_Output(other,self,"DIA_FARIM_RecrDTSugg_Yes_15_04");	//А я не один. Нас много. Мне нужен постоянный поставщик пищи для моего лагеря.
	AI_Output(self,other,"DIA_FARIM_RecrDTSugg_Yes_99_05");	//У тебя есть лагерь? Где?
	AI_Output(other,self,"DIA_FARIM_RecrDTSugg_Yes_15_06");	//Рядом с фермой Онара.
	AI_Output(self,other,"DIA_FARIM_RecrDTSugg_Yes_99_06");	//Неплохо! Я буду только рад тебе помочь.
	AI_Output(other,self,"DIA_FARIM_RecrDTSugg_Yes_15_07");	//Рыбу можешь отдавать моему управляющему. Кстати, сколько рыбы ты сможешь предоставлять для лагеря в день и сколько за это хочешь?
	AI_Output(self,other,"DIA_FARIM_RecrDTSugg_Yes_99_07");	//Это зависит от улова. Но дюжиной-то рыбин в день смогу обеспечивать стабильно. А цена стандартная - пять монет за рыбину.
	AI_Output(other,self,"DIA_FARIM_RecrDTSugg_Yes_15_08");	//Договорились.
	AI_Output(self,other,"DIA_FARIM_RecrDTSugg_Yes_99_08");	//Ну что ж, тогда увидимся в лагере.
	self.npcType = NPCTYPE_FRIEND;
	self.aivar[AIV_ToughGuy] = TRUE;
	self.aivar[AIV_IGNORE_Theft] = TRUE;
	self.aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	self.aivar[AIV_IgnoresArmor] = TRUE;
	FARIMRECRUITEDDT = TRUE;
	B_LogEntry(TOPIC_PPL_FOR_TOWER,"Фарим обеспечит мой лагерь рыбой.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"InTower");
};

instance DIA_FARIM_INTOWER(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 22;
	condition = dia_farim_intower_condition;
	information = dia_farim_intower_info;
	permanent = TRUE;
	description = "Как клюет?";
};

func int dia_farim_intower_condition()
{
	if((FARIMRECRUITEDDT == TRUE) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void dia_farim_intower_info()
{
	AI_Output(other,self,"DIA_Addon_Farim_Perm_15_00");	//Как клюет?
	AI_Output(self,other,"DIA_Farim_InTower_01_01");	//Отлично! А главное - мне снова есть, кому продавать улов.
};

instance DIA_FARIM_INTOWER_ORCKAP(C_Info)
{
	npc = VLK_4301_Addon_Farim;
	nr = 22;
	condition = dia_farim_intower_orckap_condition;
	information = dia_farim_intower_orckap_info;
	permanent = TRUE;
	description = "Все в порядке?";
};

func int dia_farim_intower_orckap_condition()
{
	if((FARIMRECRUITEDDT == TRUE) && (KAPITELORCATC == TRUE))
	{
		return TRUE;
	};
};

func void dia_farim_intower_orckap_info()
{
	AI_Output(other,self,"DIA_Farim_InTower_OrcKap_15_00");	//Все в порядке?
	AI_Output(self,other,"DIA_Farim_InTower_OrcKap_01_01");	//Ох, парень. Если бы я не согласился на твое предложение, уже был бы мертв. Спасибо тебе!
};