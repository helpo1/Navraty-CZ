
instance DIA_Larius_EXIT(C_Info)
{
	npc = VLK_400_Larius;
	nr = 999;
	condition = DIA_Larius_EXIT_Condition;
	information = DIA_Larius_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Larius_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Larius_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Larius_Hello(C_Info)
{
	npc = VLK_400_Larius;
	nr = 1;
	condition = DIA_Larius_Hello_Condition;
	information = DIA_Larius_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Larius_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Larius_Hello_Info()
{
	AI_Output(self,other,"DIA_Larius_Hello_01_00");	//Что ты делаешь здесь? Если тебе что-то нужно, запишись на прием.
};


instance DIA_Larius_WhoAreYou(C_Info)
{
	npc = VLK_400_Larius;
	nr = 2;
	condition = DIA_Larius_WhoAreYou_Condition;
	information = DIA_Larius_WhoAreYou_Info;
	permanent = FALSE;
	description = "Кто ты?";
};


func int DIA_Larius_WhoAreYou_Condition()
{
	return TRUE;
};

func void DIA_Larius_WhoAreYou_Info()
{
	AI_Output(other,self,"DIA_Larius_WhoAreYou_15_00");	//Кто ты?
	AI_Output(self,other,"DIA_Larius_WhoAreYou_01_01");	//Я Лариус, глава города Хоринис.
	AI_Output(self,other,"DIA_Larius_WhoAreYou_01_02");	//Даже если я не кажусь тебе таковым в данный момент, я самый влиятельный человек в этом городе.
	AI_Output(other,self,"DIA_Larius_WhoAreYou_15_03");	//То есть ты всем здесь заправляешь?
	AI_Output(self,other,"DIA_Larius_WhoAreYou_01_04");	//Я... ну... в настоящий момент мои руки связаны.
	AI_Output(self,other,"DIA_Larius_WhoAreYou_01_05");	//Здесь командует этот лорд Хаген, по крайней мере, пока он в городе.
};


instance DIA_Larius_Disturb(C_Info)
{
	npc = VLK_400_Larius;
	nr = 3;
	condition = DIA_Larius_Disturb_Condition;
	information = DIA_Larius_Disturb_Info;
	permanent = TRUE;
	description = "Я не хотел помешать.";
};


func int DIA_Larius_Disturb_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Larius_WhoAreYou) && Wld_IsTime(14,0,12,0))
	{
		return TRUE;
	};
};

func void DIA_Larius_Disturb_Info()
{
	AI_Output(other,self,"DIA_Larius_Disturb_15_00");	//Я не хотел помешать.
	AI_Output(self,other,"DIA_Larius_Disturb_01_01");	//Но, тем не менее, помешал! Убирайся!
};


instance DIA_Larius_DieLage(C_Info)
{
	npc = VLK_400_Larius;
	nr = 2;
	condition = DIA_Larius_DieLage_Condition;
	information = DIA_Larius_DieLage_Info;
	permanent = TRUE;
	description = "Как дела?";
};


func int DIA_Larius_DieLage_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Larius_WhoAreYou))
	{
		return TRUE;
	};
};

func void DIA_Larius_DieLage_Info()
{
	AI_Output(other,self,"DIA_Larius_DieLage_15_00");	//Как дела?
	AI_Output(self,other,"DIA_Larius_DieLage_01_01");	//Тебе до этого какое дело? Пока паладины здесь, лорд Хаген занимается всеми делами, касающимися жизни города.
};


instance DIA_Larius_Richterueberfall(C_Info)
{
	npc = VLK_400_Larius;
	nr = 2;
	condition = DIA_Larius_Richterueberfall_Condition;
	information = DIA_Larius_Richterueberfall_Info;
	description = "Судья нанял бандитов, чтобы они убили тебя.";
};


func int DIA_Larius_Richterueberfall_Condition()
{
	if((SCKnowsRichterKomproBrief == TRUE) && Npc_KnowsInfo(hero,DIA_Larius_WhoAreYou))
	{
		return TRUE;
	};
};

func void DIA_Larius_Richterueberfall_Info()
{
	AI_Output(other,self,"DIA_Larius_Richterueberfall_15_00");	//Судья нанял бандитов, чтобы они убили тебя. Я могу доказать это.
	AI_Output(self,other,"DIA_Larius_Richterueberfall_01_01");	//Не пори чепухи, или ты хочешь, чтобы я заковал тебя в кандалы?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Larius_Richterueberfall_01_02");	//Даже если ты воин Инноса...
	};
	if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM))
	{
		AI_Output(self,other,"DIA_Larius_Richterueberfall_01_03");	//Даже если ты посвященный маг...
	};
	AI_Output(self,other,"DIA_Larius_Richterueberfall_01_04");	//Мое слово все еще имеет вес в этом городе. Не смей даже пытаться запятнать светлое имя нашего судьи!
	B_GivePlayerXP(XP_Ambient);
	AI_StopProcessInfos(self);
};


instance DIA_Larius_PICKPOCKET(C_Info)
{
	npc = VLK_400_Larius;
	nr = 900;
	condition = DIA_Larius_PICKPOCKET_Condition;
	information = DIA_Larius_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Larius_PICKPOCKET_Condition()
{
	return C_Beklauen(35,120);
};

func void DIA_Larius_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Larius_PICKPOCKET);
	Info_AddChoice(DIA_Larius_PICKPOCKET,Dialog_Back,DIA_Larius_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Larius_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Larius_PICKPOCKET_DoIt);
};

func void DIA_Larius_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Larius_PICKPOCKET);
};

func void DIA_Larius_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Larius_PICKPOCKET);
};


instance DIA_LARIUS_DROGENPACKET(C_Info)
{
	npc = VLK_400_Larius;
	nr = 1;
	condition = dia_larius_drogenpacket_condition;
	information = dia_larius_drogenpacket_info;
	permanent = TRUE;
	important = FALSE;
	description = "У меня кое-что есть для тебя.";
};


func int dia_larius_drogenpacket_condition()
{
	if((MIS_ORUNPACKET == LOG_Running) && (Npc_HasItems(other,itmi_drogenpocket) >= 1) && (LARIUSTALKPACKET == FALSE) && Npc_KnowsInfo(hero,DIA_Larius_WhoAreYou))
	{
		return TRUE;
	};
};

func void dia_larius_drogenpacket_info()
{
	var C_Item itm;
	itm = Npc_GetEquippedArmor(other);
	AI_Output(other,self,"DIA_Larius_DrogenPacket_01_00");	//У меня кое-что есть для тебя.
	AI_Output(self,other,"DIA_Larius_DrogenPacket_01_01");	//Что еще?
	AI_Output(other,self,"DIA_Larius_DrogenPacket_01_02");	//Идол Оран просил передать тебе этот пакет.
	AI_Output(self,other,"DIA_Larius_DrogenPacket_01_03");	//Хмм...(смотрит оценивающе)

	if((Hlp_IsItem(itm,itar_sekbed) == TRUE) || (Hlp_IsItem(itm,itar_sekbed_v1) == TRUE))
	{
		MeetLarius = TRUE;
		AI_Output(self,other,"DIA_Larius_DrogenPacket_01_04");	//(пристально смотрит) Оран, говоришь?
		AI_Output(self,other,"DIA_Larius_DrogenPacket_01_05");	//Хорошо, давай ее сюда.
		B_GiveInvItems(other,self,itmi_drogenpocket,1);
		Npc_RemoveInvItems(self,itmi_drogenpocket,1);
		AI_Output(self,other,"DIA_Larius_DrogenPacket_01_06");	//Уфф! Наконец-то, я уже ее заждался. Отлично!
		AI_Output(self,other,"DIA_Larius_DrogenPacket_01_07");	//Вот, передай это ему эту суму. И не смей открывать ее, понял? И помалкивай обо всем, что видел!
		B_GiveInvItems(self,other,itmi_lariusgoldpocket,1);
		B_LogEntry(TOPIC_ORUNPACKET,"Я встретился с губернатором Лариусом. Он сильно занервничал, когда я упомянул о посылке от Идола Орана, но все же взял ее. В свою очередь он передал мне суму, которую мне надо в целости и сохранности доставить обратно Идолу.");

		if(TALKLARIUSABOUTTALIASAN == TRUE)
		{
			Npc_ExchangeRoutine(self,"Always");
		};

		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Larius_DrogenPacket_01_10");	//Какой еще Идол? Какой еще Оран? Какая еще посылка?
		AI_Output(self,other,"DIA_Larius_DrogenPacket_01_11");	//Ты вообще кто?!
		AI_Output(other,self,"DIA_Larius_DrogenPacket_01_12");	//Ну, как же. Вы же с ним, кажется, договорились.
		AI_Output(self,other,"DIA_Larius_DrogenPacket_01_13");	//Не знаю я никакого Орана! Ты, видимо, ошибся, парень.
		AI_Output(self,other,"DIA_Larius_DrogenPacket_01_14");	//Так что отвали от меня! Понял?!
		B_LogEntry(TOPIC_ORUNPACKET,"Я встретился с губернатором Лариусом. Он сильно занервничал, когда я упомянул о посылке от Идола Орана и сказал, что даже понятия не имеет, о чем я говорю. Лариус напрочь отказался брать посылку. Может, я сделал что-то не так?");
		AI_StopProcessInfos(self);
		LARIUSTALKPACKET = TRUE;
		LARIUSCANCELPACKET = 0;
	};
};


instance DIA_LARIUS_DROGENPACKETAGAIN(C_Info)
{
	npc = VLK_400_Larius;
	nr = 1;
	condition = dia_larius_drogenpacketagain_condition;
	information = dia_larius_drogenpacketagain_info;
	permanent = TRUE;
	important = FALSE;
	description = "По поводу той посылки...";
};


func int dia_larius_drogenpacketagain_condition()
{
	if((MIS_ORUNPACKET == LOG_Running) && (Npc_HasItems(other,itmi_drogenpocket) >= 1) && (LARIUSTALKPACKET == TRUE) && (LARIUSCANCELPACKET < 2))
	{
		return TRUE;
	};
};

func void dia_larius_drogenpacketagain_info()
{
	var C_Item itm;
	itm = Npc_GetEquippedArmor(other);
	AI_Output(other,self,"DIA_Larius_DrogenPacketAgain_01_00");	//По поводу той посылки...
	AI_Output(self,other,"DIA_Larius_DrogenPacketAgain_01_01");	//(гневно) Что?!

	if((Hlp_IsItem(itm,itar_sekbed) == TRUE) || (Hlp_IsItem(itm,itar_sekbed_v1) == TRUE))
	{
		MeetLarius = TRUE;
		AI_Output(other,self,"DIA_Larius_DrogenPacketAgain_01_02");	//Я не мог ничего перепутать. Тебе ее передает ИДОЛ ОРАН!
		AI_Output(self,other,"DIA_Larius_DrogenPacketAgain_01_03");	//Хмм...(смотрит оценивающе)
		AI_Output(self,other,"DIA_Larius_DrogenPacketAgain_01_04");	//(пристально смотрит) Оран, говоришь?
		AI_Output(self,other,"DIA_Larius_DrogenPacketAgain_01_05");	//Хорошо, давай ее сюда.
		B_GiveInvItems(other,self,itmi_drogenpocket,1);
		Npc_RemoveInvItems(self,itmi_drogenpocket,1);
		AI_Output(self,other,"DIA_Larius_DrogenPacketAgain_01_06");	//Уфф! Наконец-то, я уже ее заждался. Отлично!
		AI_Output(self,other,"DIA_Larius_DrogenPacketAgain_01_07");	//Вот, передай это ему эту суму. И не смей открывать ее, понял? И помалкивай обо всем, что видел!
		B_GiveInvItems(self,other,itmi_lariusgoldpocket,1);
		B_LogEntry(TOPIC_ORUNPACKET,"Лариус все-таки согласился взять посылку. В свою очередь он передал мне суму, которую мне надо в целости и сохранности доставить обратно Идолу.");
		if(TALKLARIUSABOUTTALIASAN == TRUE)
		{
			Npc_ExchangeRoutine(self,"Always");
		};
		AI_StopProcessInfos(self);
	}
	else
	{
		LARIUSCANCELPACKET = LARIUSCANCELPACKET + 1;
		if(LARIUSCANCELPACKET != 2)
		{
			AI_Output(self,other,"DIA_Larius_DrogenPacketAgain_01_10");	//Послушай, парень!
			AI_Output(self,other,"DIA_Larius_DrogenPacketAgain_01_11");	//Если ты еще раз рискнешь предложить мне эту посылку, то остаток своих дней ты проведешь за решеткой!
			AI_Output(self,other,"DIA_Larius_DrogenPacketAgain_01_12");	//Понял?!!!
			AI_StopProcessInfos(self);
		}
		else
		{
			AI_Output(self,other,"DIA_Larius_DrogenPacketAgain_01_13");	//Кажется, я тебя предупреждал! Теперь пеняй на себя - ты, тупой ублюдок!
			AI_Standup(self);
			AI_Output(self,other,"DIA_Larius_DrogenPacketAgain_01_14");	//Стража!!!
			MIS_ORUNPACKET = LOG_FAILED;
			B_LogEntry_Failed(TOPIC_ORUNPACKET);

			if(TALKLARIUSABOUTTALIASAN == TRUE)
			{
				Npc_ExchangeRoutine(self,"Always");
			};

			AI_StopProcessInfos(self);
			B_Attack(self,other,AR_NONE,1);
		};
	};
};


instance DIA_LARIUS_LETTERFROMTALIASAN(C_Info)
{
	npc = VLK_400_Larius;
	nr = 1;
	condition = dia_larius_letterfromtaliasan_condition;
	information = dia_larius_letterfromtaliasan_info;
	permanent = FALSE;
	description = "У меня к тебе дело.";
};


func int dia_larius_letterfromtaliasan_condition()
{
	if((MIS_TALIASANHELP == LOG_Running) && (Npc_HasItems(other,itwr_taliasanrecomendedletters) >= 1) && (TALIASANHELP_STEP1 == TRUE) && Npc_KnowsInfo(hero,DIA_Larius_WhoAreYou))
	{
		return TRUE;
	};
};

func void dia_larius_letterfromtaliasan_info()
{
	AI_Output(other,self,"DIA_Larius_LetterFromTaliasan_01_00");	//У меня к тебе дело.
	AI_Output(self,other,"DIA_Larius_LetterFromTaliasan_01_01");	//Что еще за дело?
	AI_Output(other,self,"DIA_Larius_LetterFromTaliasan_01_02");	//Один человек очень бы хотел вернуть твое расположение к нему.
	AI_Output(self,other,"DIA_Larius_LetterFromTaliasan_01_04");	//(удивленно) Да? И кто этот человек?
	AI_Output(other,self,"DIA_Larius_LetterFromTaliasan_01_05");	//Его имя Галлахад.
	AI_Output(other,self,"DIA_Larius_LetterFromTaliasan_01_06");	//Он просил передать тебе, что очень глубоко сожалеет о случившемся и просит тебя проявить к нему свое снисхождение.
	AI_Output(other,self,"DIA_Larius_LetterFromTaliasan_01_07");	//Кроме этого, у меня имеется пачка рекомендательных писем от влиятельных людей этого города...
	AI_Output(other,self,"DIA_Larius_LetterFromTaliasan_01_08");	//...в которых они очень хорошо отзываются о Галлахаде.

	if(Wld_IsTime(12,0,14,0))
	{
		AI_Output(self,other,"DIA_Larius_LetterFromTaliasan_01_09");	//(удивленно) Так тебя прислал Галлахад?
		AI_Output(self,other,"DIA_Larius_LetterFromTaliasan_01_10");	//Как смело с его стороны было решиться на этот шаг.
		AI_Output(self,other,"DIA_Larius_LetterFromTaliasan_01_11");	//Говоришь, что у тебя есть рекомендательные письма от влиятельных людей Хориниса?
		AI_Output(self,other,"DIA_Larius_LetterFromTaliasan_01_13");	//Ну-ка, дай мне взглянуть на эти письма...
		AI_Output(other,self,"DIA_Larius_LetterFromTaliasan_01_14");	//Вот они.
		B_GiveInvItems(other,self,itwr_taliasanrecomendedletters,1);
		Npc_RemoveInvItems(self,itwr_taliasanrecomendedletters,1);
		B_UseFakeScroll();
		AI_Output(self,other,"DIA_Larius_LetterFromTaliasan_01_15");	//(задумался) М-да - впечатляет!
		AI_Output(self,other,"DIA_Larius_LetterFromTaliasan_01_16");	//Я смотрю, многие, кого я знаю, очень недурно отзываются о нем.
		AI_Output(self,other,"DIA_Larius_LetterFromTaliasan_01_17");	//И все они - достойные уважения люди.
		B_UseFakeScroll();
		AI_Output(self,other,"DIA_Larius_LetterFromTaliasan_01_21");	//Хорошо!
		AI_Output(self,other,"DIA_Larius_LetterFromTaliasan_01_22");	//Ты можешь передать Галлахаду, что я прощаю ему тот инцидент, что произошел тогда между нами.
		AI_Output(self,other,"DIA_Larius_LetterFromTaliasan_01_24");	//Эх... Я всегда ценил его как хорошего работника!
		AI_Output(self,other,"DIA_Larius_LetterFromTaliasan_01_25");	//Поэтому, думаю, будет правильным, если Галлахад опять вернется ко мне на службу.
		AI_Output(self,other,"DIA_Larius_LetterFromTaliasan_01_26");	//Скажи ему, что он восстановлен в должности городского мага.
		TALKLARIUSABOUTTALIASAN = TRUE;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
			AI_Print("Риторика + 1");
		};

		B_LogEntry(TOPIC_TALIASANHELP,"Как ни странно, Лариус выслушал меня. Он посмотрел рекомендательные письма и, подумав, принял решение простить Галлахада. Лариус также велел передать ему, что он восстановлен на должность городского мага и должен немедленно приступить к работе.");
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Larius_LetterFromTaliasan_01_32");	//(вне себя) ЧТО?! Галлахад?
		AI_Output(self,other,"DIA_Larius_LetterFromTaliasan_01_33");	//(разгневанно) Что возомнил о себе этот старый болван?!
		AI_Output(self,other,"DIA_Larius_LetterFromTaliasan_01_35");	//Об этом даже не может быть и речи!
		AI_Output(self,other,"DIA_Larius_LetterFromTaliasan_01_36");	//И убери от меня свои поганые бумажки - этот мусор мне не нужен!
		AI_Output(self,other,"DIA_Larius_LetterFromTaliasan_01_40");	//А теперь убирайся с глаз моих, пока я не позвал стражу!
		AI_Output(self,other,"DIA_Larius_LetterFromTaliasan_01_41");	//(срываясь на крик) Вон!
		LARIUSPISSOFF = TRUE;
		TALKLARIUSABOUTTALIASAN = TRUE;
		B_LogEntry(TOPIC_TALIASANHELP,"Лариус даже не стал меня слушать, когда я завел разговор о Галлахаде. Кажется, я что-то сделал не так. Думаю, мне стоит поговорить с Галлахадом.");
		AI_StopProcessInfos(self);
	};
};


