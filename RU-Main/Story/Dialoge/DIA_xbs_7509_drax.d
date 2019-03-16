
instance DIA_DRAX_EXIT(C_Info)
{
	npc = xbs_7509_drax;
	nr = 999;
	condition = dia_drax_exit_condition;
	information = dia_drax_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_drax_exit_condition()
{
	return TRUE;
};

func void dia_drax_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DRAX_PICKPOCKET(C_Info)
{
	npc = xbs_7509_drax;
	nr = 900;
	condition = dia_drax_pickpocket_condition;
	information = dia_drax_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_drax_pickpocket_condition()
{
	return C_Beklauen(25,30);
};

func void dia_drax_pickpocket_info()
{
	Info_ClearChoices(dia_drax_pickpocket);
	Info_AddChoice(dia_drax_pickpocket,Dialog_Back,dia_drax_pickpocket_back);
	Info_AddChoice(dia_drax_pickpocket,DIALOG_PICKPOCKET,dia_drax_pickpocket_doit);
};

func void dia_drax_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_drax_pickpocket);
};

func void dia_drax_pickpocket_back()
{
	Info_ClearChoices(dia_drax_pickpocket);
};


instance DIA_DRAX_HALLO(C_Info)
{
	npc = xbs_7509_drax;
	nr = 2;
	condition = dia_drax_hallo_condition;
	information = dia_drax_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_drax_hallo_condition()
{
	if(Npc_RefuseTalk(self) == FALSE)
	{
		return TRUE;
	};
};

func void dia_drax_hallo_info()
{
	AI_Output(self,other,"DIA_Drax_Hallo_01_0E");	//Так, так...

	if((other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Drax_Hallo_01_00");	//Ну надо же! Сколько лет я не видел слуг Инноса...
	}
	else if((other.guild == GIL_NDW) || (other.guild == GIL_KDW))
	{
		AI_Output(self,other,"DIA_Drax_Hallo_01_0A");	//Ну надо же! Сколько лет я не видел слуг Аданоса...
	}
	else if((other.guild == GIL_NDM) || (other.guild == GIL_KDM))
	{
		AI_Output(self,other,"DIA_Drax_Hallo_01_0B");	//Ну надо же! Вас приспешников Белиара невозможно ни с кем перепутать...(с опаской)
	}
	else if((other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR))
	{
		AI_Output(self,other,"DIA_Drax_Hallo_01_0C");	//Ну надо же! Еще одна пропащая душа из бывшего болотного Братства...
	}
	else if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Drax_Hallo_01_0D");	//Ну надо же - еще один наемник... Как ты тут очутился?!
	}
	else if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Drax_Hallo_01_01");	//Ну надо же! Сколько лет я не видел королевских холопов...
	}
	else if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Drax_Hallo_01_02");	//Еще один бродяга! Удивительно только, как ты сюда добрался.
	};
	AI_Output(other,self,"DIA_Drax_Hallo_15_03");	//Тебя, кажется, зовут Дракс, так? Я тебя помню - я тоже бывший заключенный...
	AI_Output(self,other,"DIA_Drax_Hallo_01_04");	//Да? А-а, разве вас всех упомнишь... Мы охотились рядом с проходом и перевидали столько зеленых новичков.
	AI_Output(other,self,"DIA_Drax_Hallo_15_05");	//Ну, не всякий потом наводил столько шума в Старом лагере.
	AI_Output(self,other,"DIA_Drax_Hallo_01_06");	//Вот теперь припоминаю - было такое дело перед самым падением Барьера!
	AI_Output(self,other,"DIA_Drax_Hallo_01_07");	//Жаль только, что Ворона тебе достать не удалось.

	if(RavenIsDead == TRUE)
	{
		AI_Output(other,self,"DIA_Drax_Hallo_15_08");	//Ошибаешься, я его нашел чуть позже.
		AI_Output(self,other,"DIA_Drax_Hallo_01_09");	//Да ну? Не верю!
		AI_Output(self,other,"DIA_Drax_Hallo_01_10");	//Ни капли не верю! Мне бы на колечко его посмотреть. Одним глазком хотя бы!

		if(Npc_HasItems(other,ITMI_RAVENGOLDRING) >= 1)
		{
			B_GivePlayerXP(1000);
			AI_Output(other,self,"DIA_Drax_Hallo_15_11");	//Вот оно - смотри. Можешь даже оставить его себе.
			B_GiveInvItems(other,self,ITMI_RAVENGOLDRING,1);
			Npc_RemoveInvItems(self,ITMI_RAVENGOLDRING,1);
			AI_Output(self,other,"DIA_Drax_Hallo_01_12");	//(с уважением) Да, кто-то все-таки достал этого ублюдка! Ну, спасибо тебе, брат.
			AI_Output(other,self,"DIA_Drax_RavenRing_15_00");	//Так мне что-нибудь причитается за это колечко?
			AI_Output(self,other,"DIA_Drax_RavenRing_01_01");	//Точнее за твои труды...(смеется) Ну, почему бы и нет? Для хорошего человека ничего не жалко.
			AI_Output(self,other,"DIA_Drax_RavenRing_01_02");	//Конечно, не бог весть какой подарок - но чем богаты, тем и рады.
			B_GiveInvItems(self,other,ItWr_DexStonePlate3_Addon,1);
			AI_Output(self,other,"DIA_Drax_RavenRing_01_03");	//Вот, возьми эту странную каменную табличку. Я так и не понял, что она из себя представляет.
			AI_Output(self,other,"DIA_Drax_RavenRing_01_04");	//Может, тебе под силу будет с ней разобраться.
			AI_Output(other,self,"DIA_Drax_RavenRing_01_05");	//И на том спасибо!
			DRAXHASRING = TRUE;
		}
		else
		{
			AI_Output(other,self,"DIA_Drax_Hallo_15_13");	//...черт, кому-то уже продал.
			AI_Output(self,other,"DIA_Drax_Hallo_01_14");	//Ну-ну.
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Drax_Hallo_15_15");	//Дойдет и до него очередь.
		AI_Output(self,other,"DIA_Drax_Hallo_01_16");	//Ха. Ну, допустим... Хочется тебе поверить.
		AI_Output(self,other,"DIA_Drax_Hallo_01_17");	//Принеси мне тогда его колечко. Было у него такое, особенное!
		AI_Output(self,other,"DIA_Drax_Hallo_01_18");	//И старина Дракс отплатит такому хорошему человеку.
		MIS_RavenRing = LOG_Running;
		Log_CreateTopic(TOPIC_RavenRing,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_RavenRing,LOG_Running);
		B_LogEntry(TOPIC_RavenRing,"Дракс попросил меня принести ему кольцо Ворона в качестве доказательства его смерти.");
	};
};

instance DIA_DRAX_RAVENRING(C_Info)
{
	npc = xbs_7509_drax;
	nr = 1;
	condition = dia_drax_ravenring_condition;
	information = dia_drax_ravenring_info;
	permanent = FALSE;
	description = "У меня есть кольцо Ворона!";
};

func int dia_drax_ravenring_condition()
{
	if((MIS_RavenRing == LOG_Running) && (DRAXHASRING == FALSE) && (Npc_HasItems(hero,ITMI_RAVENGOLDRING) >= 1))
	{
		return TRUE;
	};
};

func void dia_drax_ravenring_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Drax_RavenRing_01_06");	//У меня есть кольцо Ворона!
	AI_Output(self,other,"DIA_Drax_RavenRing_01_07");	//Правда?
	AI_Output(other,self,"DIA_Drax_Hallo_15_11");		//Вот оно - любуйся сколько влезет. Можешь даже оставить его себе.
	B_GiveInvItems(other,self,ITMI_RAVENGOLDRING,1);
	Npc_RemoveInvItems(self,ITMI_RAVENGOLDRING,1);
	AI_Output(self,other,"DIA_Drax_Hallo_01_12");		//(с уважением) Да, кто-то все-таки достал этого ублюдка! Ну, спасибо тебе, брат.
	AI_Output(other,self,"DIA_Drax_RavenRing_15_00");	//Так мне что-нибудь причитается за это колечко?
	AI_Output(self,other,"DIA_Drax_RavenRing_01_01");	//Точнее за твои труды...(смеется) Ну, почему бы и нет? Для хорошего человека ничего не жалко.
	AI_Output(self,other,"DIA_Drax_RavenRing_01_02");	//Конечно, не бог весть какой подарок - но чем богаты, тем и рады.
	B_GiveInvItems(self,other,ItWr_DexStonePlate3_Addon,1);
	AI_Output(self,other,"DIA_Drax_RavenRing_01_03");	//Вот, возьми эту странную каменную табличку. Я так и не понял, что она из себя представляет.
	AI_Output(self,other,"DIA_Drax_RavenRing_01_04");	//Может, тебе под силу будет с ней разобраться.
	AI_Output(other,self,"DIA_Drax_RavenRing_01_05");	//И на том спасибо!
	DRAXHASRING = TRUE;
	MIS_RavenRing = LOG_Success;
	Log_SetTopicStatus(TOPIC_RavenRing,LOG_Success);
	B_LogEntry(TOPIC_RavenRing,"Я принес Драксу кольцо Ворона.");
	AI_StopProcessInfos(self);
};

instance DIA_DRAX_KAPITEL4(C_Info)
{
	npc = xbs_7509_drax;
	nr = 2;
	condition = dia_drax_kapitel4_condition;
	information = dia_drax_kapitel4_info;
	permanent = FALSE;
	description = "Тут орки недавно не проходили?";
};

func int dia_drax_kapitel4_condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void dia_drax_kapitel4_info()
{
	AI_Output(other,self,"DIA_Drax_Kapitel4_15_00");	//Тут орки недавно не проходили?
	AI_Output(self,other,"DIA_Drax_Kapitel4_01_01");	//Нет, не проходили - пробегали. Как-то им неуютно в нашем лесу.
	AI_Output(self,other,"DIA_Drax_Kapitel4_01_02");	//Целая толпа орков! И они даже не взглянули в нашу сторону. Унеслись за свой забор - только пятки сверкали. Да!
	AI_Output(other,self,"DIA_Drax_Kapitel4_15_03");	//Понятно.
};

instance DIA_DRAX_CAMPER(C_Info)
{
	npc = xbs_7509_drax;
	nr = 2;
	condition = dia_drax_camper_condition;
	information = dia_drax_camper_info;
	permanent = FALSE;
	description = "А кто это c вами?";
};

func int dia_drax_camper_condition()
{
	if(!Npc_KnowsInfo(other,dia_camper01_hallo) && (Npc_IsDead(camper_7501) == FALSE) && (MoveDracarBoard == FALSE))
	{
		return TRUE;
	};
};

func void dia_drax_camper_info()
{
	AI_Output(other,self,"DIA_Drax_Camper_15_00");	//А кто это c вами?
	AI_Output(self,other,"DIA_Drax_Camper_01_01");	//Этот парень из лагеря, что находится где-то на севере.
	AI_Output(self,other,"DIA_Drax_Camper_01_02");	//Звал нас к ним. Говорит, у них там не то маг, не то пророк какой-то и жизнь спокойная.

	if(Npc_IsDead(ratford))
	{
		AI_Output(self,other,"DIA_Drax_Camper_01_03");	//А на что оно мне? Мне и тут свободно и спокойно.
		AI_Output(self,other,"DIA_Drax_Camper_01_04");	//Поговорить только теперь не с кем.
		AI_Output(self,other,"DIA_Drax_Camper_01_05");	//Хотя Рэтфорд и не был большим болтуном.
	}
	else
	{
		AI_Output(self,other,"DIA_Drax_Camper_01_06");	//А на что оно нам? Нам и тут свободно и спокойно.
	};
};

instance DIA_DRAX_GOHOME(C_Info)
{
	npc = xbs_7509_drax;
	nr = 2;
	condition = DIA_DRAX_GOHOME_condition;
	information = DIA_DRAX_GOHOME_info;
	permanent = FALSE;
	description = "И вы тут?";
};

func int DIA_DRAX_GOHOME_condition()
{
	if((Kapitel >= 5) && (MoveDracarBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_DRAX_GOHOME_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_DRAX_GOHOME_01_00");	//И вы тут?
	AI_Output(self,other,"DIA_DRAX_GOHOME_01_01");	//Да. Тут местечко что надо! Тихое и спокойное.
	AI_Output(self,other,"DIA_DRAX_GOHOME_01_02");	//К тому же я слышал, что орки опять атаковали замок. И кто знает, что у них теперь дальше на уме!
	AI_Output(self,other,"DIA_DRAX_GOHOME_01_03");	//Но одно я знаю точно - сюда они навряд ли сунутся.
	AI_Output(other,self,"DIA_DRAX_GOHOME_01_04");	//И чем вы здесь занимаетесь целыми днями?
	AI_Output(self,other,"DIA_DRAX_GOHOME_01_05");	//Стоим на часах. По очереди, конечно. Сначала я, потом Рэтфорд.
	AI_Output(self,other,"DIA_DRAX_GOHOME_01_06");	//Следим за тем, чтобы в случае чего дать сигнал. Ну, если орки подойдут слишком близко к нашему лагерю.
	AI_Output(other,self,"DIA_DRAX_GOHOME_01_07");	//Да, неплохо вы тут устроились.
};

instance DIA_DRAX_WHOCAP(C_Info)
{
	npc = xbs_7509_drax;
	nr = 1;
	condition = DIA_DRAX_WHOCAP_condition;
	information = DIA_DRAX_WHOCAP_info;
	permanent = FALSE;
	description = "Ты случайно не знаешь, среди вас нет моряков?";
};

func int DIA_DRAX_WHOCAP_condition()
{
	if((MIS_SylvioCrew == LOG_Running) && (RatfordAgree == FALSE) && (RatfordNeedMap == FALSE))
	{
		return TRUE;
	};
};

func void DIA_DRAX_WHOCAP_info()
{
	AI_Output(other,self,"DIA_DRAX_WHOCAP_01_00");	//Ты случайно не знаешь, среди вас нет моряков?

	if(Npc_IsDead(xbs_7510_ratford) == TRUE)
	{
		AI_Output(self,other,"DIA_DRAX_WHOCAP_01_01");	//Эх, приятель...
		AI_Output(self,other,"DIA_DRAX_WHOCAP_01_02");	//Рэтфорд как раз был капитаном одного торгового судна, пока не угодил в колонию.
		AI_Output(self,other,"DIA_DRAX_WHOCAP_01_03");	//Но это уже не важно. Теперь-то он мертв...
		AI_Output(other,self,"DIA_DRAX_WHOCAP_01_04");	//Ясно.
	}
	else
	{
		B_GivePlayerXP(100);
		AI_Output(self,other,"DIA_DRAX_WHOCAP_01_05");	//Ну, как тебе сказать... Имеются.
		AI_Output(other,self,"DIA_DRAX_WHOCAP_01_06");	//И кто же это?
		AI_Output(self,other,"DIA_DRAX_WHOCAP_01_07");	//Да, вон, мой приятель Рэтфорд как раз один из них.
		AI_Output(other,self,"DIA_DRAX_WHOCAP_01_08");	//Ты это серьезно?
		AI_Output(self,other,"DIA_DRAX_WHOCAP_01_09");	//Конечно! Он был капитаном одного торгового судна, пока не угодил в колонию.
		AI_Output(self,other,"DIA_DRAX_WHOCAP_01_10");	//Потом по пьяни набил морду королевскому приставу. И с тех пор он здесь.
		AI_Output(other,self,"DIA_DRAX_WHOCAP_01_11");	//М-да, веселые вы парни.
		AI_Output(self,other,"DIA_DRAX_WHOCAP_01_12");	//А то!
		RatfordCap = TRUE;
	};
};

instance DIA_Drax_Sail(C_Info)
{
	npc = xbs_7509_drax;
	nr = 2;
	condition = DIA_Drax_Sail_condition;
	information = DIA_Drax_Sail_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Drax_Sail_condition()
{
	if((RatfordAgree == TRUE) && (MoveDracarBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Drax_Sail_info()
{
	B_GivePlayerXP(100);
	AI_Output(self,other,"DIA_Drax_Sail_01_01");	//Эй, приятель...(улыбаясь) Рэтфорд рассказал мне о том, что ты задумал.
	AI_Output(self,other,"DIA_Drax_Sail_01_02");	//По мне, так это самая лучшая идея с тех пор, как я оказался за Барьером.
	AI_Output(self,other,"DIA_Drax_Sail_01_03");	//Давно уже мечтал побывать на материке! 
	AI_Output(self,other,"DIA_Drax_Sail_01_04");	//Говорят, что там есть чем заняться такому ловкому парню, как я. 
	AI_Output(other,self,"DIA_Drax_Sail_01_05");	//Мечты сбываются. Главное, не попадись снова!
	AI_Output(self,other,"DIA_Drax_Sail_01_06");	//Хммм. Это точно, приятель. Это точно...
	AI_StopProcessInfos(self);
};

instance DIA_Drax_Drakar_Perm(C_Info)
{
	npc = xbs_7509_drax;
	nr = 1;
	condition = DIA_Drax_Drakar_Perm_condition;
	information = DIA_Drax_Drakar_Perm_info;
	permanent = TRUE;
	description = "Как тебе на корабле?";
};

func int DIA_Drax_Drakar_Perm_condition()
{
	if((MoveDracarBoard == TRUE) && (DraxOnBoard == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Drax_Drakar_Perm_info()
{
	AI_Output(other,self,"DIA_Drax_Drakar_Perm_01_00");	//Как тебе на корабле?
	AI_Output(self,other,"DIA_Drax_Drakar_Perm_01_01");	//Нормально. Только бы скорее уже Рэтфорд починил этот чертов руль!
	AI_Output(self,other,"DIA_Drax_Drakar_Perm_01_02");	//А то по ночам мне почти в каждом углу мерещатся орки.
	AI_Output(other,self,"DIA_Drax_Drakar_Perm_01_03");	//Спокойно, приятель. Думаю, что орки сюда еще не скоро пожалуют.
	AI_Output(self,other,"DIA_Drax_Drakar_Perm_01_04");	//Эх...(вздыхая) Мне бы твою уверенность.
};
