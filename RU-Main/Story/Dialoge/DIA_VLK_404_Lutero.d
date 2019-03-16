
instance DIA_Lutero_EXIT(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 999;
	condition = DIA_Lutero_EXIT_Condition;
	information = DIA_Lutero_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lutero_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Lutero_EXIT_Info()
{
	AI_StopProcessInfos(self);
	if((Lutero_Krallen == LOG_Running) && (MIS_Fajeth_Kill_Snapper == LOG_SUCCESS) && (Npc_KnowsInfo(other,DIA_Bilgot_KNOWSLEADSNAPPER) == FALSE))
	{
		Lutero_Krallen = LOG_OBSOLETE;
	};
};


instance DIA_Lutero_Hallo(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = DIA_Lutero_Hallo_Condition;
	information = DIA_Lutero_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Lutero_Hallo_Condition()
{
	if(((other.guild != GIL_NONE) || (other.guild != GIL_NOV)) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Lutero_Hallo_Info()
{
	AI_Output(self,other,"DIA_Lutero_Hallo_13_00");	//Меня зовут Лютеро. Я торгую практически всем.
	AI_Output(other,self,"DIA_Lutero_Hallo_15_01");	//Какие товары ты предлагаешь?
	AI_Output(self,other,"DIA_Lutero_Hallo_13_02");	//Ну, в основном редкие и необычные вещи. Я готов удовлетворить даже самые причудливые прихоти моих клиентов.
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,"Лютеро торгует необычными и редкими предметами в верхнем квартале.");
};


instance DIA_Lutero_GetLost(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = DIA_Lutero_GetLost_Condition;
	information = DIA_Lutero_GetLost_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Lutero_GetLost_Condition()
{
	if(((other.guild == GIL_NONE) || (other.guild == GIL_NOV) || (other.guild == GIL_NDM) || (other.guild == GIL_NDW)) && Npc_IsInState(self,ZS_Talk) && (MEMBERTRADEGUILD == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lutero_GetLost_Info()
{
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Lutero_GetLost_13_00");	//Проваливай отсюда! Тебе что, нечего делать? Тогда найди себе работу - только где-нибудь еще!
	}
	else
	{
		AI_Output(self,other,"DIA_Lutero_GetLost_13_01");	//Что тебе нужно, послушник? Разве ты не должен быть в монастыре?
	};
};


instance DIA_Lutero_Snapper(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = DIA_Lutero_Snapper_Condition;
	information = DIA_Lutero_Snapper_Info;
	permanent = FALSE;
	description = "Ты ищешь что-нибудь конкретное?";
};


func int DIA_Lutero_Snapper_Condition()
{
	if((other.guild != GIL_NONE) && (other.guild != GIL_NOV) && (other.guild != GIL_NDM) && (other.guild != GIL_NDW) && (other.guild != GIL_SEK))
	{
		return TRUE;
	};
};

func void DIA_Lutero_Snapper_Info()
{
	AI_Output(other,self,"DIA_Lutero_Snapper_15_00");	//Ты ищешь что-нибудь конкретное?
	AI_Output(self,other,"DIA_Lutero_Snapper_13_01");	//Да, для одного из моих клиентов мне нужны когти снеппера.
	AI_Output(self,other,"DIA_Lutero_Snapper_13_02");	//Но не просто обычные когти. Это должно быть что-то особенное - когти очень большого зверя, убившего много людей, например.
	AI_Output(other,self,"DIA_Lutero_Snapper_15_03");	//Где мне найти снепперов?
	AI_Output(self,other,"DIA_Lutero_Snapper_13_04");	//На этом острове они встречаются повсеместно, но большинство из них живет в Долине Рудников.
	AI_Output(other,self,"DIA_Lutero_Snapper_15_05");	//А что я с этого получу?
	if((other.guild == GIL_KDF) || (other.guild == GIL_GUR) || (other.guild == GIL_KDM) || (other.guild == GIL_KDW))
	{
		AI_Output(self,other,"DIA_Lutero_Hello_13_06");	//Я могу дать тебе рунный камень.
	}
	else
	{
		AI_Output(self,other,"DIA_Lutero_Hello_13_07");	//Я могу дать тебе кольцо неуязвимости.
	};
	AI_Output(other,self,"DIA_Lutero_Hello_15_08");	//Я посмотрю, что можно сделать.
	Log_CreateTopic(TOPIC_Lutero,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Lutero,LOG_Running);
	B_LogEntry(TOPIC_Lutero,"Торговец Лютеро ищет когти необычайно сильного снеппера.");
	Lutero_Krallen = LOG_Running;
};


instance DIA_Lutero_Kralle(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = DIA_Lutero_Kralle_Condition;
	information = DIA_Lutero_Kralle_Info;
	permanent = FALSE;
	description = "У меня есть особенные когти снеппера для тебя.";
};


func int DIA_Lutero_Kralle_Condition()
{
	if((Npc_HasItems(other,ItAt_ClawLeader) >= 1) && Npc_KnowsInfo(other,DIA_Lutero_Snapper))
	{
		return TRUE;
	};
};

func void DIA_Lutero_Kralle_Info()
{
	AI_Output(other,self,"DIA_Lutero_Kralle_15_00");	//У меня есть особенные когти снеппера для тебя.
	Lutero_Krallen = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_Lutero,LOG_SUCCESS);
	B_GivePlayerXP(XP_Ambient);
	AI_Output(self,other,"DIA_Lutero_Kralle_13_01");	//Мой клиент будет счастлив услышать это.
	B_GiveInvItems(other,self,ItAt_ClawLeader,1);
	Npc_RemoveInvItems(self,ItAt_ClawLeader,1);
	if((other.guild == GIL_KDF) || (other.guild == GIL_GUR) || (other.guild == GIL_KDM) || (other.guild == GIL_KDW))
	{
		AI_Output(self,other,"DIA_Lutero_Hello_13_02");	//У меня нет этого рунного камня с собой. Но я знаю, где его можно найти.
		AI_Output(self,other,"DIA_Lutero_Hello_13_03");	//По пути от города к таверне, ты пойдешь под мостом.
		AI_Output(self,other,"DIA_Lutero_Hello_13_04");	//Там, в пещере, мой друг спрятал в сундуке рунный камень. Вот ключ.
		B_GiveInvItems(self,other,itke_rune_mis,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Lutero_Hello_13_05");	//Вот кольцо, как я и обещал тебе.
		B_GiveInvItems(self,other,ItRi_Prot_Total_01,1);
	};
};


instance DIA_Lutero_Trade(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = DIA_Lutero_Trade_Condition;
	information = DIA_Lutero_Trade_Info;
	permanent = TRUE;
	description = "Покажи мне свои товары.";
	trade = TRUE;
};


func int DIA_Lutero_Trade_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Lutero_Hallo) == TRUE) && Wld_IsTime(8,0,23,59))
	{
		return TRUE;
	};
};

func void DIA_Lutero_Trade_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Lutero_Trade_15_00");	//Покажи мне свои товары.
	B_GiveTradeInv(self);
};


instance DIA_Lutero_PICKPOCKET(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 900;
	condition = DIA_Lutero_PICKPOCKET_Condition;
	information = DIA_Lutero_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Lutero_PICKPOCKET_Condition()
{
	return C_Beklauen(58,65);
};

func void DIA_Lutero_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Lutero_PICKPOCKET);
	Info_AddChoice(DIA_Lutero_PICKPOCKET,Dialog_Back,DIA_Lutero_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Lutero_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Lutero_PICKPOCKET_DoIt);
};

func void DIA_Lutero_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Lutero_PICKPOCKET);
};

func void DIA_Lutero_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Lutero_PICKPOCKET);
};


instance DIA_LUTERO_TALIASANLETTER(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = dia_lutero_taliasanletter_condition;
	information = dia_lutero_taliasanletter_info;
	permanent = FALSE;
	description = "У тебя не найдется для меня какой-нибудь работы?";
};


func int dia_lutero_taliasanletter_condition()
{
	if(MIS_TALIASANHELP == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_lutero_taliasanletter_info()
{
	AI_Output(other,self,"DIA_Lutero_TaliasanLetter_01_00");	//У тебя не найдется для меня какой-нибудь работы?
	AI_Output(self,other,"DIA_Lutero_TaliasanLetter_01_01");	//Ты ищешь работу?
	AI_Output(self,other,"DIA_Lutero_TaliasanLetter_01_02");	//Хммм. Возможно, мне бы и пригодились услуги такого человека, как ты. Хотя тут есть проблема...
	AI_Output(other,self,"DIA_Lutero_TaliasanLetter_01_03");	//И в чем же твоя проблема?
	AI_Output(self,other,"DIA_Lutero_TaliasanLetter_01_04");	//Проблема в том, что мои дела сейчас идут не слишком хорошо, и я не смогу заплатить тебе за твою работу золотом.
	AI_Output(other,self,"DIA_Lutero_TaliasanLetter_01_05");	//Золото меня не интересует.
	AI_Output(self,other,"DIA_Lutero_TaliasanLetter_01_06");	//(удивленно) Да? Тогда что ты хочешь в качестве оплаты?
	AI_Output(other,self,"DIA_Lutero_TaliasanLetter_01_09");	//Мне нужно, чтобы ты написал одно письмо. Оно должно быть адресовано Лариусу, главе Хориниса.
	AI_Output(other,self,"DIA_Lutero_TaliasanLetter_01_10");	//Необходимо, чтобы в нем ты восхищался магическими способности Галлахада и вообще, что он хороший человек...
	AI_Output(self,other,"DIA_Lutero_TaliasanLetter_01_13");	//Хммм. Конечно, мне ничего не стоит написать такое письмо...
	AI_Output(self,other,"DIA_Lutero_TaliasanLetter_01_14");	//Хорошо! Но прежде чем я это сделаю, ты выполнишь одну работенку для меня.
	AI_Output(other,self,"DIA_Lutero_TaliasanLetter_01_15");	//В чем она заключается?

	if(!C_BodyStateContains(self,BS_SIT))
	{
		AI_PlayAni(self,"T_SEARCH");
	};

	AI_Output(self,other,"DIA_Lutero_TaliasanLetter_01_16");	//Ну, понимаешь... Это очень специфическое дело.
	AI_Output(other,self,"DIA_Lutero_TaliasanLetter_01_17");	//И?
	AI_Output(self,other,"DIA_Lutero_TaliasanLetter_01_18");	//Как я тебе говорил, у меня сейчас не очень хорошо с деньгами...(замялся) ммм...
	AI_Output(self,other,"DIA_Lutero_TaliasanLetter_01_19");	//...В общем, чтобы как-то поправить свои дела, мне недавно пришлось занять небольшую сумму денег у одного человека.
	AI_Output(other,self,"DIA_Lutero_TaliasanLetter_01_20");	//У кого?
	AI_Output(self,other,"DIA_Lutero_TaliasanLetter_01_21");	//У Лемара, ростовщика. И, естественно, как ты понимаешь, этот долг в скором времени мне придется отдать ему.
	AI_Output(other,self,"DIA_Lutero_TaliasanLetter_01_22");	//И ты хочешь, чтобы я заплатил за тебя?
	AI_Output(self,other,"DIA_Lutero_TaliasanLetter_01_23");	//Нет, этого делать не надо.
	AI_Output(self,other,"DIA_Lutero_TaliasanLetter_01_24");	//У меня есть идея получше. Беря у него деньги, я написал Лемару долговую расписку.
	AI_Output(self,other,"DIA_Lutero_TaliasanLetter_01_25");	//И мне бы очень хотелось, чтобы эта бумажка просто-напросто у него исчезла...(взволнованно) ...или чтобы он ее потерял, например.
	AI_Output(other,self,"DIA_Lutero_TaliasanLetter_01_26");	//Если я тебя правильно понял, ты хочешь, чтобы я украл у него эту твою расписку?
	AI_Output(self,other,"DIA_Lutero_TaliasanLetter_01_27");	//Тише, тише! Не так громко.

	if(!C_BodyStateContains(self,BS_SIT))
	{
		AI_PlayAni(self,"T_SEARCH");
	};

	AI_Output(self,other,"DIA_Lutero_TaliasanLetter_01_28");	//Ну, можно и так сказать... примерно в этом духе.
	AI_Output(self,other,"DIA_Lutero_TaliasanLetter_01_29");	//Главное, чтобы Лемар не смог доказать, что я ему что-то должен.
	AI_Output(self,other,"DIA_Lutero_TaliasanLetter_01_30");	//Давай сделаем так. Если ты принесешь мне эту расписку, то я тогда напишу рекомендательное письмо для Галлахада.
	AI_Output(self,other,"DIA_Lutero_TaliasanLetter_01_31");	//Тебя устраивают эти условия?
	Info_ClearChoices(dia_lutero_taliasanletter);
	Info_AddChoice(dia_lutero_taliasanletter,"Извини, но на такое я не могу пойти.",dia_lutero_taliasanletter_no);
	Info_AddChoice(dia_lutero_taliasanletter,"Да, вполне.",dia_lutero_taliasanletter_ok);
};

func void dia_lutero_taliasanletter_no()
{
	AI_Output(other,self,"DIA_Lutero_TaliasanLetter_No_01_00");	//Извини, но на такое я не могу пойти.
	AI_Output(self,other,"DIA_Lutero_TaliasanLetter_No_01_01");	//Что ж, очень жаль.
	AI_Output(self,other,"DIA_Lutero_TaliasanLetter_No_01_02");	//Да, и еще: надеюсь, наш разговор останется между нами.
	if(MEMBERTRADEGUILD == FALSE)
	{
		AI_Output(self,other,"DIA_Lutero_TaliasanLetter_No_01_03");	//(раздраженно) В ином же случае я позабочусь о том, чтобы ты поменьше трепал своим языком.
		AI_Output(self,other,"DIA_Lutero_TaliasanLetter_No_01_04");	//А теперь проваливай! У меня нет для тебя больше работы.
	};
	AI_StopProcessInfos(self);
};

func void dia_lutero_taliasanletter_ok()
{
	AI_Output(other,self,"DIA_Lutero_TaliasanLetter_Ok_01_00");	//Да, вполне.
	AI_Output(self,other,"DIA_Lutero_TaliasanLetter_Ok_01_01");	//Вот и отлично! Возвращайся ко мне, когда у тебя будет моя расписка.
	AI_Output(self,other,"DIA_Lutero_TaliasanLetter_Ok_01_02");	//А я тем временем напишу письмо, что так интересует... тебя.
	AI_StopProcessInfos(self);
	MIS_LUTEROHELP = LOG_Running;
	Log_CreateTopic(TOPIC_LUTEROHELP,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LUTEROHELP,LOG_Running);
	B_LogEntry(TOPIC_LUTEROHELP,"Чтобы получить рекомендательное письмо для Галлахада от торговца Лютеро, я должен достать ему его долговую расписку, которую он написал ростовщику Лемару.");
};


instance DIA_LUTERO_BRINGLETTER(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = dia_lutero_bringletter_condition;
	information = dia_lutero_bringletter_info;
	permanent = FALSE;
	description = "Твоя расписка у меня.";
};


func int dia_lutero_bringletter_condition()
{
	if((MIS_TALIASANHELP == LOG_Running) && (MIS_LUTEROHELP == LOG_Running) && (Npc_HasItems(other,itwr_luteroloan) >= 1))
	{
		return TRUE;
	};
};

func void dia_lutero_bringletter_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Lutero_BringLetter_01_00");	//Твоя расписка у меня.
	AI_Output(self,other,"DIA_Lutero_BringLetter_01_01");	//(взволнованно) Покажи мне ее.
	B_GiveInvItems(other,self,itwr_luteroloan,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Lutero_BringLetter_01_02");	//(вне себя от счастья) ДА! Это она! У тебя все получилось!
	Npc_RemoveInvItems(self,itwr_luteroloan,1);
	AI_Output(self,other,"DIA_Lutero_BringLetter_01_03");	//Ты сделал меня счастливым человеком!
	AI_Output(other,self,"DIA_Lutero_BringLetter_01_04");	//Я рад за тебя. А что насчет нашего уговора? Где мое письмо?
	AI_Output(self,other,"DIA_Lutero_BringLetter_01_05");	//Конечно, конечно. Не беспокойся, я уже его написал.
	AI_Output(self,other,"DIA_Lutero_BringLetter_01_06");	//Вот оно. Думаю, тебе понравится.
	B_GiveInvItems(self,other,itwr_luteroletter,1);
	AI_Output(other,self,"DIA_Lutero_BringLetter_01_07");	//Отлично. Главное, чтобы оно понравилось не мне, а Галлахаду...
	AI_Output(self,other,"DIA_Lutero_BringLetter_01_08");	//Я не сомневаюсь, что он будет им доволен.
	AI_Output(self,other,"DIA_Lutero_BringLetter_01_09");	//Ну, а теперь извини - у меня есть другие дела.
	Log_SetTopicStatus(TOPIC_LUTEROHELP,LOG_SUCCESS);
	B_LogEntry(TOPIC_LUTEROHELP,"Я принес Лютеро его долговую расписку. Взамен он дал мне рекомендательное письмо для Галлахада.");
	MIS_LUTEROHELP = LOG_SUCCESS;
	AI_StopProcessInfos(self);
};


instance DIA_LUTERO_NIGELLETTER(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = dia_lutero_nigelletter_condition;
	information = dia_lutero_nigelletter_info;
	permanent = FALSE;
	description = "У меня письмо для тебя.";
};


func int dia_lutero_nigelletter_condition()
{
	if((Npc_HasItems(other,itwr_nigelletter) >= 1) || (Npc_HasItems(other,itwr_erolletter) >= 1))
	{
		return TRUE;
	};
};

func void dia_lutero_nigelletter_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Lutero_NigelLetter_01_00");	//У меня письмо для тебя.
	AI_Output(self,other,"DIA_Lutero_NigelLetter_01_01");	//Что за письмо?
	if(Npc_HasItems(other,itwr_nigelletter) >= 1)
	{
		AI_Output(other,self,"DIA_Lutero_NigelLetter_01_02");	//От торговца Найджела. Ты, кажется, должен знать его.
		AI_Output(self,other,"DIA_Lutero_NigelLetter_01_03");	//(удивленно) От старины Найджела?
		AI_Output(other,self,"DIA_Lutero_NigelLetter_01_04");	//Вот, держи.
		B_GiveInvItems(other,self,itwr_nigelletter,1);
		B_UseFakeScroll();
		AI_Output(self,other,"DIA_Lutero_NigelLetter_01_05");	//(задумчиво) Очень интересно.
		B_UseFakeScroll();
		AI_Output(self,other,"DIA_Lutero_NigelLetter_01_06");	//В этом письме он очень хорошо отзывается о твоей персоне и ручается за тебя, как за надежного человека.
		B_UseFakeScroll();
		AI_Output(self,other,"DIA_Lutero_NigelLetter_01_07");	//И еще...(очень удивленно) Просит меня помочь тебе вступить в нашу гильдию торговцев!
		AI_Output(self,other,"DIA_Lutero_NigelLetter_01_08");	//Хммм, да. Очень смело с его стороны обратиться ко мне с такой просьбой.
		AI_Output(self,other,"DIA_Lutero_NigelLetter_01_09");	//Интересно, что же такое ТЫ для него сделал, что заставило его похлопотать за тебя?
		AI_Output(other,self,"DIA_Lutero_NigelLetter_01_10");	//Как он сам сказал, я спас его репутацию.
		AI_Output(self,other,"DIA_Lutero_NigelLetter_01_11");	//Теперь мне более или менее понятна причина такой его любезности...(смеется)
		AI_Output(self,other,"DIA_Lutero_NigelLetter_01_12");	//Для нас, торговцев, репутация - это одна из самых важных вещей.
		AI_Output(self,other,"DIA_Lutero_NigelLetter_01_14");	//Если у тебя плохая репутация, никто и никогда не будет вести с тобой никаких дел.
		AI_Output(self,other,"DIA_Lutero_NigelLetter_01_15");	//Эх, ну да ладно. Значит, Найджел ручается за тебя и просит меня принять тебя в нашу гильдию...(задумчиво)
		AI_Output(self,other,"DIA_Lutero_NigelLetter_01_16");	//Ну что же, я не вижу ни одной причины, почему бы мне стоило отказать Найджелу.
		AI_Output(self,other,"DIA_Lutero_NigelLetter_01_17");	//Но решение в любом случае принимать тебе.
		AI_Output(self,other,"DIA_Lutero_NigelLetter_01_18");	//Что скажешь? Хочешь попробовать себя в торговле?
	}
	else
	{
		AI_Output(other,self,"DIA_Lutero_NigelLetter_01_19");	//От торговца Эрола. Ты, кажется, должен знать его.
		AI_Output(self,other,"DIA_Lutero_NigelLetter_01_20");	//(удивленно) От старины Эрола? Покажи-ка мне это письмо.
		AI_Output(other,self,"DIA_Lutero_NigelLetter_01_21");	//Вот, держи.
		B_GiveInvItems(other,self,itwr_erolletter,1);
		B_UseFakeScroll();
		AI_Output(self,other,"DIA_Lutero_NigelLetter_01_22");	//(задумчиво) Очень интересно.
		B_UseFakeScroll();
		AI_Output(self,other,"DIA_Lutero_NigelLetter_01_23");	//В этом письме он очень хорошо отзывается о твоей персоне и ручается за тебя, как за надежного человека.
		B_UseFakeScroll();
		AI_Output(self,other,"DIA_Lutero_NigelLetter_01_24");	//И еще...(очень удивленно) Просит меня помочь тебе вступить в нашу гильдию торговцев!
		Npc_RemoveInvItems(self,itwr_erolletter,1);
		AI_Output(self,other,"DIA_Lutero_NigelLetter_01_25");	//Хммм, да. Очень смело с его стороны обратиться ко мне с такой просьбой.
		AI_Output(self,other,"DIA_Lutero_NigelLetter_01_26");	//Интересно, что же такое ты для него сделал, что заставило его похлопотать за тебя?
		AI_Output(other,self,"DIA_Lutero_NigelLetter_01_27");	//Как он сам сказал, я спас его репутацию.
		AI_Output(self,other,"DIA_Lutero_NigelLetter_01_28");	//Теперь мне более или менее понятна причина такой его любезности...(смеется)
		AI_Output(self,other,"DIA_Lutero_NigelLetter_01_29");	//Для нас, торговцев, репутация - это одна из самых важных вещей.
		AI_Output(self,other,"DIA_Lutero_NigelLetter_01_31");	//Если у тебя плохая репутация, никто и никогда не будет вести с тобой никаких дел.
		AI_Output(self,other,"DIA_Lutero_NigelLetter_01_32");	//Эх, ну да ладно. Значит, Эрол ручается за тебя и просит меня принять тебя в нашу гильдию...(задумчиво)
		AI_Output(self,other,"DIA_Lutero_NigelLetter_01_33");	//Ну что же, я не вижу ни одной причины, почему бы мне стоило отказать ему.
		AI_Output(self,other,"DIA_Lutero_NigelLetter_01_34");	//Но решение в любом случае принимать тебе.
		AI_Output(self,other,"DIA_Lutero_NigelLetter_01_35");	//Что скажешь? Хочешь попробовать себя в торговле?
	};
	Info_ClearChoices(dia_lutero_nigelletter);
	Info_AddChoice(dia_lutero_nigelletter,"Не думаю, что мне это будет интересно.",dia_lutero_nigelletter_no);
	Info_AddChoice(dia_lutero_nigelletter,"Почему бы и нет.",dia_lutero_nigelletter_yes);
};

func void dia_lutero_nigelletter_no()
{
	AI_Output(other,self,"DIA_Lutero_NigelLetter_No_01_00");	//Не думаю, что мне это будет интересно.
	AI_Output(self,other,"DIA_Lutero_NigelLetter_No_01_01");	//(разочарованно) Хммм. Ну что же, дело, конечно, твое.
	AI_Output(self,other,"DIA_Lutero_NigelLetter_No_01_02");	//Хотя, думаю, ты делаешь большую ошибку, отказываясь от этой возможности.
	Info_ClearChoices(dia_lutero_nigelletter);
};

func void dia_lutero_nigelletter_yes()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Lutero_NigelLetter_Yes_01_00");	//Почему бы и нет.
	AI_Output(self,other,"DIA_Lutero_NigelLetter_Yes_01_01");	//Хорошо. Тогда, добро пожаловать в гильдию торговцев!
	AI_Output(self,other,"DIA_Lutero_NigelLetter_Yes_01_02");	//Теперь ты один из нас, поздравляю!
	AI_Output(other,self,"DIA_Lutero_NigelLetter_Yes_01_03");	//Спасибо. И что теперь?
	AI_Output(self,other,"DIA_Lutero_NigelLetter_Yes_01_04");	//Теперь поговорим о твоих обязанностях в гильдии.
	AI_Output(other,self,"DIA_Lutero_NigelLetter_Yes_01_05");	//Каковы будут мои обязанности?
	AI_Output(self,other,"DIA_Lutero_NigelLetter_Yes_01_07");	//Пойми, состоять в нашей гильдии - это не только быть одним из нас. Этот статус еще и накладывает на тебя некоторую ответственность.
	AI_Output(self,other,"DIA_Lutero_NigelLetter_Yes_01_09");	//Правда, от тебя не потребуется ничего сверхъестественного.
	AI_Output(self,other,"DIA_Lutero_NigelLetter_Yes_01_10");	//Просто изредка, время от времени, я буду давать тебе некоторые поручения.
	AI_Output(self,other,"DIA_Lutero_NigelLetter_Yes_01_11");	//И как раз сейчас у меня для тебя есть одно такое.
	AI_Output(other,self,"DIA_Lutero_NigelLetter_Yes_01_12");	//И что же нужно делать?
	AI_Output(self,other,"DIA_Lutero_NigelLetter_Yes_01_13");	//Необходимо отнести новый заказ на ферму Бенгара и забрать у него прошлую партию товара.
	AI_Output(self,other,"DIA_Lutero_NigelLetter_Yes_01_14");	//Вот, - возьми это письмо. Тут все написано.
	B_GiveInvItems(self,other,itwr_bengarorderletter,1);
	AI_Output(other,self,"DIA_Lutero_NigelLetter_Yes_01_15");	//А Бенгар знает об этом?
	AI_Output(self,other,"DIA_Lutero_NigelLetter_Yes_01_16");	//Да, он в курсе дел и будет ждать тебя.
	AI_Output(other,self,"DIA_Lutero_NigelLetter_Yes_01_17");	//Что мне с ним делать, когда я заберу у него товар? Принести его тебе?
	AI_Output(self,other,"DIA_Lutero_NigelLetter_Yes_01_18");	//Нет. Я этим не занимаюсь.
	AI_Output(self,other,"DIA_Lutero_NigelLetter_Yes_01_19");	//Отнести его торговцу Джоре. Он позаботится обо всем остальном.
	AI_Output(other,self,"DIA_Lutero_NigelLetter_Yes_01_20");	//Джоре? Торговцу?
	AI_Output(self,other,"DIA_Lutero_NigelLetter_Yes_01_21");	//Да. Ты найдешь его на торговой площади у восточных ворот.
	AI_Output(self,other,"DIA_Lutero_NigelLetter_Yes_01_24");	//Когда выполнишь это поручение, возвращайся ко мне. У нас будет что с тобой обсудить.
	Info_ClearChoices(dia_lutero_nigelletter);
	MEMBERTRADEGUILD = TRUE;
	MIS_TRADEGUILD = LOG_Running;
	Log_CreateTopic(TOPIC_TRADEGUILD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TRADEGUILD,LOG_Running);
	B_LogEntry(TOPIC_TRADEGUILD,"Торговец Лютеро принял меня в гильдию.");
	MIS_BENGARORDER = LOG_Running;
	Log_CreateTopic(TOPIC_BENGARORDER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BENGARORDER,LOG_Running);
	Log_AddEntry(TOPIC_BENGARORDER,"Лютеро дал мне поручение: я должен отнести фермеру Бенгару письмо с новым заказом на продовольствие и заодно забрать у него прошлую партию товара. После этого его необходимо будет доставить Джоре, торговцу на рыночной площади.");
};


instance DIA_LUTERO_BENGARPACKETOPEN(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = dia_lutero_bengarpacketopen_condition;
	information = dia_lutero_bengarpacketopen_info;
	permanent = FALSE;
	description = "У меня тут возникла одна проблемка.";
};


func int dia_lutero_bengarpacketopen_condition()
{
	if(BENGARPACKETOPEN == TRUE)
	{
		return TRUE;
	};
};

func void dia_lutero_bengarpacketopen_info()
{
	AI_Output(other,self,"DIA_Lutero_BengarPacketOpen_01_00");	//У меня тут возникла одна проблема.
	AI_Output(self,other,"DIA_Lutero_BengarPacketOpen_01_01");	//Что случилось?
	AI_Output(other,self,"DIA_Lutero_BengarPacketOpen_01_02");	//Ну... я не смог доставить товар торговцу Джоре.
	AI_Output(self,other,"DIA_Lutero_BengarPacketOpen_01_03");	//Но почему?
	AI_Output(other,self,"DIA_Lutero_BengarPacketOpen_01_04");	//Я потерял посылку Бенгара.
	AI_Output(self,other,"DIA_Lutero_BengarPacketOpen_01_05");	//Как ты сумел это сделать? (с досадой) Черт!
	AI_Output(other,self,"DIA_Lutero_BengarPacketOpen_01_06");	//Так получилось.
	AI_Output(self,other,"DIA_Lutero_BengarPacketOpen_01_07");	//Не стоило тебе поручать это дело. (зло) Ты меня сильно подвел, а еще больше разочаровал!
	AI_Output(other,self,"DIA_Lutero_BengarPacketOpen_01_08");	//Мне очень жаль...
	AI_Output(self,other,"DIA_Lutero_BengarPacketOpen_01_09");	//Мне не нужны твои извинения! И вообще, теперь можешь забыть обо всем том, что я тебе обещал!
	AI_Output(other,self,"DIA_Lutero_BengarPacketOpen_01_10");	//То есть как?! Хочешь сказать, что я больше не состою в гильдии?
	AI_Output(self,other,"DIA_Lutero_BengarPacketOpen_01_11");	//Да. Таким людям, как ты, не место среди нас! Уходи!
	AI_Output(other,self,"DIA_Lutero_BengarPacketOpen_01_12");	//Но я...
	AI_Output(self,other,"DIA_Lutero_BengarPacketOpen_01_13");	//(перебивая) Проваливай! И не смей больше обращаться ко мне!
	AI_StopProcessInfos(self);
	MIS_TRADEGUILD = LOG_FAILED;
	LUTEROPISSOFF = TRUE;
	MEMBERTRADEGUILD = FALSE;
	B_LogEntry_Failed(TOPIC_TRADEGUILD);
};


instance DIA_LUTERO_FUCKOFF(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 10;
	condition = dia_lutero_fuckoff_condition;
	information = dia_lutero_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_lutero_fuckoff_condition()
{
	if((LUTEROPISSOFF == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_lutero_fuckoff_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
};


instance DIA_LUTERO_JORAHELP(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 10;
	condition = dia_lutero_jorahelp_condition;
	information = dia_lutero_jorahelp_info;
	permanent = FALSE;
	description = "У тебя есть еще для меня поручения?";
};


func int dia_lutero_jorahelp_condition()
{
	if((MIS_CHURCHDEAL == LOG_SUCCESS) || (MIS_CHURCHDEAL == LOG_FAILED))
	{
		return TRUE;
	};
};

func void dia_lutero_jorahelp_info()
{
	AI_Output(other,self,"DIA_Lutero_JoraHelp_01_00");	//У тебя есть еще поручения для меня?
	AI_Output(self,other,"DIA_Lutero_JoraHelp_01_01");	//У Джоры возникли проблемы с торговцем Зурисом.
	AI_Output(self,other,"DIA_Lutero_JoraHelp_01_02");	//Он не входит в нашу гильдию, но это не означает, что с его мнением нельзя не считаться.
	AI_Output(other,self,"DIA_Lutero_JoraHelp_01_03");	//Я знаю Зуриса. Судя по всему, он достаточно влиятельный торговец в этом городе. А в чем именно возникла проблема?
	AI_Output(self,other,"DIA_Lutero_JoraHelp_01_04");	//Видишь ли, то место, на котором торгует Джора, принадлежит Зурису. Он просто сдает его Джоре за определенную месячную плату.
	AI_Output(other,self,"DIA_Lutero_JoraHelp_01_05");	//И что с этим не так?
	AI_Output(self,other,"DIA_Lutero_JoraHelp_01_06");	//Недавно Зурис отказал Джоре в продлении аренды, сказав, что у него появилось более выгодное предложение от другого торговца.
	AI_Output(self,other,"DIA_Lutero_JoraHelp_01_07");	//Это место достаточно доходно, и потерять его не в наших интересах.
	AI_Output(self,other,"DIA_Lutero_JoraHelp_01_08");	//Поэтому я прошу тебя заняться этим вопросом и постараться как можно скорее его уладить.
	AI_Output(other,self,"DIA_Lutero_JoraHelp_01_09");	//А почему именно я?
	AI_Output(self,other,"DIA_Lutero_JoraHelp_01_10");	//Потому что Зурис пока не знает, что ты состоишь в нашей гильдии. Иначе бы он даже не стал тебя слушать.
	AI_Output(self,other,"DIA_Lutero_JoraHelp_01_11");	//У него в последнее время не очень-то хорошие отношения с нами. И это еще мягко говоря.
	AI_Output(other,self,"DIA_Lutero_JoraHelp_01_12");	//Почему?
	AI_Output(self,other,"DIA_Lutero_JoraHelp_01_13");	//Причиной стали некоторые мои разногласия с Зурисом, после чего он, кажется, стал иметь на нас зуб.
	AI_Output(self,other,"DIA_Lutero_JoraHelp_01_14");	//Поэтому мне бы очень не хотелось, чтобы Зурис думал, что гильдия крайне заинтересована в разрешении этой проблемы.
	AI_Output(self,other,"DIA_Lutero_JoraHelp_01_15");	//Поскольку, узнав об этом, он может сыграть на наших потребностях и, естественно, не в нашу пользу.
	AI_Output(other,self,"DIA_Lutero_JoraHelp_01_16");	//Хорошо. Но каким образом я должен это сделать?
	AI_Output(self,other,"DIA_Lutero_JoraHelp_01_17");	//Ну...(задумчиво) Даже не знаю, что тебе посоветовать.
	AI_Output(self,other,"DIA_Lutero_JoraHelp_01_18");	//Попробуй для начала просто поговорить с ним. Возможно, тебе удастся нащупать ниточки, за которые впоследствии можно будет дернуть.
	AI_Output(self,other,"DIA_Lutero_JoraHelp_01_19");	//(ехидно) Понимаешь, о чем я?
	AI_Output(other,self,"DIA_Lutero_JoraHelp_01_20");	//Хммм... И ты думаешь, это поможет?
	AI_Output(self,other,"DIA_Lutero_JoraHelp_01_21");	//Возможно. По крайней мере, это даст нам представление о том, как действовать в этой ситуации.
	AI_Output(self,other,"DIA_Lutero_JoraHelp_01_22");	//Также можешь попробовать его чем-нибудь заинтересовать.
	AI_Output(other,self,"DIA_Lutero_JoraHelp_01_25");	//Ладно. Постараюсь что-нибудь придумать.
	AI_Output(self,other,"DIA_Lutero_JoraHelp_01_26");	//Вот именно! И прошу тебя, если тебе что-то удастся выяснить по этому делу - обязательно сообщай это мне. Непременно держи меня в курсе дела.
	AI_Output(self,other,"DIA_Lutero_JoraHelp_01_28");	//Надеюсь, у тебя все получится.
	MIS_JORAHELP = LOG_Running;
	Log_CreateTopic(TOPIC_JORAHELP,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_JORAHELP,LOG_Running);
	B_LogEntry(TOPIC_JORAHELP,"Лютеро дал мне очередное поручение - теперь я должен буду помочь Джоре сохранить его место на торговой площади. Зурис, торговец зельями, не захотел продлевать срок аренды для Джоры, объяснив это тем, что нашел более выгодный способ его использования. Лютеро, как и всю гильдию торговцев, такой поворот дел, конечно, не устраивает. Поэтому мне необходимо каким-то образом решить эту проблему. Для начала мне стоит поговорить с самим Зурисом по этому вопросу. Лютеро предупредил меня, что крайне важно не ставить Зуриса в известность о том, что я действую от имени гильдии.");
};


instance DIA_LUTERO_JORAHELPDO(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 10;
	condition = dia_lutero_jorahelpdo_condition;
	information = dia_lutero_jorahelpdo_info;
	permanent = TRUE;
	description = "По поводу аренды Джоры...";
};


func int dia_lutero_jorahelpdo_condition()
{
	if(MIS_JORAHELP == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_lutero_jorahelpdo_info()
{
	AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_00");	//По поводу аренды места Джоры...
	AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_01");	//Да? У тебя есть новости?
	if((ZURISPISSOFF == TRUE) || (ZURISFUCKOFF == TRUE))
	{
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_02");	//Боюсь, у меня плохие новости.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_03");	//ЧТО?! Что именно?
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_04");	//Мне не удалось убедить Зуриса переменить свое решение относительно места на площади.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_05");	//(вне себя) Но почему?!
		if(ZURISPISSOFF == TRUE)
		{
			AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_08");	//Сам не знаю, но теперь Зурис даже и слушать меня не станет, если я вновь решу обсудить с ним эту тему.
			AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_09");	//Черт! Как это могло случиться?!
			AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_10");	//Видимо, ты что-нибудь ляпнул несуразное, если Зурис отреагировал таким образом.
		}
		else
		{
			AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_11");	//Я случайно проболтался ему, что работаю на тебя.
			AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_12");	//После этого он даже и слушать меня не стал!
			AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_13");	//Черт побери! Я же предупреждал тебя, чтобы ты держал свой язык за зубами относительно меня.
			AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_14");	//Он как-то сам обо всем догадался.
		};
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_15");	//Эх. Ладно, что уж теперь говорить об этом. Что сделано, то сделано - уже не воротишь...(с досадой)
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_16");	//Теперь Джоре придется искать себе новую работу, а гильдия из-за тебя потеряла прибыльное место.
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_17");	//Мне очень жаль.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_18");	//(смеется) Ему, видите ли, очень жаль! (гневно) Головой надо думать, прежде чем открывать свой рот!
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_19");	//Не надо было мне посылать тебя к Зурису...(с досадой) Хотя у нас и выбора-то особо не было.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_20");	//Ладно, забудем об этом. Есть дела и поважней.
		MIS_JORAHELP = LOG_FAILED;
		B_LogEntry_Failed(TOPIC_JORAHELP);

		if(TRADEGUILDREP > 0)
		{
			TRADEGUILDREP = TRADEGUILDREP - 1;
		};
	}
	else if((ZURISTRADEPLACEYES == TRUE) && (ZURISTRADEPLACEMEOK == FALSE) && (ZURISTRADEPLACEYESINFO == FALSE))
	{
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_21");	//Есть, правда, не знаю - придутся ли они тебе по душе.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_22");	//(взволнованно) А в чем дело?!
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_23");	//Зурис оказался не слишком сговорчивым в этом вопросе.
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_24");	//Я случайно проболтался ему, что работаю на тебя.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_25");	//Черт побери! Я же предупреждал тебя, чтобы ты держал свой язык за зубами относительно меня.
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_26");	//Он как-то сам обо всем догадался.
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_29");	//И единственное, что мне пришло в голову на тот момент - это предложить ему продать мне место Джоры.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_30");	//Продать? (удивленно) Насколько я знаю, Зурис никогда бы не пошел на такую сделку.
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_31");	//Как это ни странно, но он согласился.
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_32");	//Правда при этом поставил достаточно жесткие условия - за это место он хочет получить никак не меньше десяти тысяч золотых!
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_33");	//ЧТО?! (чуть не подавился) ДЕСЯТЬ ТЫСЯЧ?! Да он с ума сошел!
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_34");	//(нервно) И что, ты согласился с этими условиями?
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_35");	//А что мне оставалось делать - у меня не было выбора.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_36");	//Безумец! Да это же целое состояние - даже у меня нет таких денег!
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_37");	//В любом случае другого варианта нет. Так что если мы хотим сохранить место Джоры, придется раскошелиться.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_38");	//М-да...(приходя в себя) Просто нет слов - отличные новости! Лучше просто и не придумаешь.
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_39");	//Я не понимаю, а разве гильдии такая сделка не по карману?
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_40");	//Гильдия не в состоянии заплатить ему такую сумму.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_45");	//К тому же, даже если учесть все выгоды и плюсы места Джоры, оно не стоит таких денег.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_46");	//В лучшем случае, ее максимальная цена - это половина того, на что ты согласился...(гневно)
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_47");	//И что же теперь делать?
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_49");	//Максимум, что может гильдия выделить на эту сделку - это две с половиной тысячи золотых.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_51");	//А остальное, мой друг, тебе придется оплатить самому!
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_52");	//В конце концов, это ведь ты у нас гений переговоров и заключения таких выгодных сделок...(ехидно)
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_55");	//Тебя за язык никто не тянул - сам принимал решение, сам и отвечай за него.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_57");	//И, естественно, я очень надеюсь, что тебе все-таки удастся уладить этот вопрос.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_58");	//Потому что если ты снова подведешь нас и сделка не состоится, то...
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_60");	//...то Зурис раструбит об этом по всему городу.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_62");	//А это запятнает в глазах людей нашу репутацию честных торговцев, которые держат свое слово!
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_63");	//Люди перестанут нам доверять - в том числе и мне! А для торговца, как ты понимаешь, репутация и доверие людей - это все!!!
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_64");	//И ты думаешь, что Зурис пойдет на такое?
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_65");	//Зная Зуриса и его отношение к нам - думаю, да. Так что постарайся в этот раз не наломать дров - от этого, кстати, зависит и твое место в гильдии.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_66");	//Поэтому решить эту проблему и в твоих интересах тоже!
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_67");	//А теперь хватит пустой болтовни - не теряй времени и займись поиском денег. Как ты их достанешь - меня не интересует!
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_68");	//А что насчет обещанных денег от гильдии?
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_69");	//Сначала достань свою часть, а потом мы поговорим и о доле гильдии в этом вопросе.
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_70");	//Хорошо. Я постараюсь сделать все, что смогу.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_71");	//(ехидно) Надеюсь на это.
		ZURISTRADEPLACEYESINFO = TRUE;
		B_LogEntry(TOPIC_JORAHELP,"Лютеро был разочарован тем, что я согласился на такие неприемлемые для гильдии условия покупки места Джоры. Он сказал, что гильдия готова выделить на это дело лишь две с половиной тысячи золотых. Остальные деньги мне придется доставать самому.");
	}
	else if((ZURISTRADEPLACEYESCHIP == TRUE) && (ZURISTRADEPLACEMEOK == FALSE) && (ZURISTRADEPLACEYESCHIPINFO == FALSE))
	{
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_72");	//Есть, правда, не знаю - придутся ли они тебе по душе.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_73");	//(взволнованно) А в чем дело?
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_74");	//Зурис оказался не слишком сговорчивым в этом вопросе.
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_75");	//И единственное, что мне пришло в голову на тот момент - это предложить ему продать мне место Джоры.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_76");	//Продать? (удивленно) Хммм, а идея интересная. Скажи, а Зурис понял, что ты входишь в нашу гильдию?
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_77");	//Кажется, нет.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_78");	//Это очень хорошо! Тогда, если подумать...(задумчиво) Ведь Зурис не знает, что ты работаешь на меня.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_79");	//А значит, ты безо всяких подозрений с его стороны мог вполне заинтересоваться таким раскладом дел с местом Джоры.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_80");	//И главное - твое предложение выглядит вполне естественным.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_83");	//И что же сказал Зурис по этому поводу?
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_84");	//Вначале он немного колебался, но потом все-таки поставил свои условия для этой сделки.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_85");	//И каковы они?
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_86");	//Он хочет получить пять тысяч золотых монет за место Джоры.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_87");	//Пять тысяч?! Хммм... Сумма, конечно, немалая, но на меньше в этом случае, я думаю, рассчитывать не приходится.
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_88");	//И что же теперь?
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_89");	//Теперь...(задумался) Теперь нужно достать деньги - вот и все.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_90");	//Со своей стороны гильдия готова выделить на это дело две с половиной тысячи золотых.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_91");	//Это ровно половина того, что хочет Зурис.
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_92");	//А что с остальными?
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_93");	//А остальные деньги тебе придется достать как-то самому.
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_104");	//Хммм... Ну хорошо. А что насчет обещанных денег от гильдии?
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_105");	//Сначала достань свою часть, а потом мы поговорим и о доле гильдии в этом вопросе.
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_106");	//Хорошо. Я постараюсь сделать все, что смогу.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_107");	//(ехидно) Надеюсь на это.
		ZURISTRADEPLACEYESCHIPINFO = TRUE;
		B_LogEntry(TOPIC_JORAHELP,"Лютеро был вполне доволен тем, что я смог договориться с Зурисом о покупке места Джоры - причем на достаточно выгодных для гильдии условиях. Он сказал, что гильдия готова выделить на это дело две с половиной тысячи золотых. Остальные деньги мне необходимо достать самому.");
	}
	else if((ZURISISDEAD == TRUE) && (Npc_HasItems(other,itwr_zurisdocs) >= 1))
	{
		B_GivePlayerXP(100);
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_108");	//Есть, правда, не знаю - придутся ли они тебе по душе.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_109");	//(взволнованно) А в чем дело?
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_110");	//Мне не удалось убедить Зуриса переменить свое решение насчет Джоры.
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_111");	//Поэтому я предпринял кое-какие действия и уладил эту проблему другим способом.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_112");	//То есть? На что ты намекаешь?
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_113");	//Я просто убил его.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_117");	//О, Иннос! Ты что, с ума сошел?!
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_118");	//А что мне оставалось делать? У меня не было выбора.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_119");	//(дрожащим голосом) Неужели в этом была такая необходимость?
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_121");	//В его кармане я обнаружил вот эти документы. Думаю, тебе будет интересно на них взглянуть.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_122");	//(дрожащим голосом) Какие еще документы?
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_123");	//Вот, сам посмотри.
		B_GiveInvItems(other,self,itwr_zurisdocs,1);
		Npc_RemoveInvItems(self,itwr_zurisdocs,1);
		B_UseFakeScroll();
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_125");	//Ну, что скажешь?
		B_UseFakeScroll();
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_130");	//Хммм...(задумчиво) Однако это не оправдывает твое убийство!
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_131");	//Ты должен понимать, что мы - торговцы, а не сборище убийц!
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_132");	//Твои действия бросают тень на всю нашу гильдию!
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_133");	//Не говоря уже о том, что и всех нас это все выставляют далеко не в лучшем свете.
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_134");	//Я просто старался решить эту проблему. Вот и все.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_135");	//Но не такой же ценой!
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_137");	//Учти на будущее, что более не стоит решать наши проблемы подобного рода действиями.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_138");	//Иначе можешь считать, что в гильдии ты больше не состоишь!
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_139");	//Это больше не повторится.
		Log_SetTopicStatus(TOPIC_JORAHELP,LOG_SUCCESS);
		MIS_JORAHELP = LOG_SUCCESS;
		B_LogEntry(TOPIC_JORAHELP,"Лютеро был крайне возмущен, что я убил Зуриса. Правда, он немного поостыл, когда я ему показал документы на право собственности торгового места на площади, где сейчас еще торгует Джора. И, в конце концов, согласился с тем, что проблема решена - а остальное уже не важно. Однако Лютеро предупредил меня, что в будущем подобные действия могут повлечь за собой мое отчисление из гильдии.");
	}
	else if((ZURISGIVEMETASKOK == FALSE) && (ZURISGIVEMETASK == TRUE) && (ZURISGIVEMETASKINFO == FALSE))
	{
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_143");	//Зурис рассказал мне о вашем давнем конфликте с ним.
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_144");	//Кажется, он считает, что ты остался ему кое-что должен.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_145");	//(удивленно) Должен? О чем это ты?!
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_146");	//Речь тогда шла о зелье, известном как Пламя Элигора.
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_147");	//По словам Зуриса, у вас был договор на счет того, что ты достанешь ему этот эликсир.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_148");	//А...(задумчиво) Кажется, я начинаю понимать, о чем ты говоришь.
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_149");	//Но ты тогда нарушил условия этого договора, переиграв их в свою пользу.
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_150");	//И как мне кажется, в этом и есть причина, почему сейчас у гильдии возникли такие проблемы.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_151");	//Хммм...(задумчиво) А я смотрю, тебе здорово удалось разговорить Зуриса, если он решил упомянуть об этом...
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_152");	//Хотя дело тогда обстояло несколько иначе.
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_153");	//И как же именно?
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_154");	//Поверь, я никогда не решился бы на изменения условий этой сделки.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_155");	//Для меня понятие чести торговца - не последние слова в этой жизни!
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_156");	//Но меня заставили это сделать некоторые обстоятельства и, видимо, о которых Зурис даже наверняка не подозревает.
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_157");	//Расскажи мне об этом поподробней.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_158");	//Дело в том, что меня тогда просто обокрали.
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_159");	//Кажется, Зурис упоминал об этом в нашем разговоре.
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_160");	//Но он сказал, что это произошло уже после того, как ты нарушил ваш договор - подняв цену на это зелье в несколько раз!
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_161");	//Он ошибается - все было как раз наоборот!
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_163");	//Ограбив меня, те воры прихватили с собой и тот эликсир, что я обещал Зурису.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_165");	//И продавать мне уже было нечего.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_167");	//Я обратился к городской страже, чтобы они помогли мне разыскать этих ворюг.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_168");	//Но, к сожалению, их поиски не увенчались успехом.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_169");	//Поэтому мне не оставалось ничего другого, кроме как попробовать самому найти способ вернуть этот эликсир.
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_170");	//И тебе это удалось?
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_171");	//Отчасти да. Мне удалось выяснить, кто может стоять за этим ограблением.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_172");	//В конце концов, через своих доверенных людей я вышел на след этих воров и предложил им выкупить у них этот эликсир.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_173");	//Но они, видимо, поняв, насколько для меня ценен этот эликсир, назначили такую сумму за него, что я просто был не в состоянии ее оплатить.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_174");	//В итоге мне ничего не осталось, как пойти к Зурису и предложить ему эти условия возврата эликсира.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_175");	//Я попытался тогда ему объяснить, что иного способа решения этой проблемы нет.
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_176");	//И чем все это кончилось?
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_177");	//Зурис был вне себя от того, что сделка сорвалась.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_178");	//И слушать меня не захотел - а просто выставил меня за дверь.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_179");	//И с тех пор, как видишь, у нас с ним не очень-то хорошие отношения.
		Info_ClearChoices(dia_lutero_jorahelpdo);
		Info_AddChoice(dia_lutero_jorahelpdo,"Думаю, тебе стоит попытаться вновь поговорить с Зурисом...",dia_lutero_jorahelpdo_yes);
		Info_AddChoice(dia_lutero_jorahelpdo,"Мне кажется Зурис сам виноват.",dia_lutero_jorahelpdo_no);
	}
	else if((ZURISGIVEMETASKOK == TRUE) && (ZURISGIVEMETASK == TRUE))
	{
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_180");	//Конечно.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_181");	//Тогда рассказывай - не тяни.
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_182");	//Я достал Зурису тот эликсир, что он просил.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_183");	//Так тебе это удалось? (удивленно) Невероятно!
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_185");	//Да, парень - ты не перестаешь меня удивлять!
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_187");	//А что насчет места Джоры?
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_188");	//Зурис продлит срок его аренды и даже немного снизит цену за предоставляемую им услугу.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_189");	//Отличная работа! Я знал, что ты справишься с этой проблемой!
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_192");	//Прими мою благодарность от меня и всей гильдии в целом.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_193");	//И, естественно, эту небольшую сумму золота, которая положена за твои успехи.
		B_GiveInvItems(self,other,ItMi_Gold,200);
		if(ZURISGIVEMETASKOKBONUS == TRUE)
		{
			B_GivePlayerXP(200);
			AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_194");	//Спасибо. А можно задать тебе еще один вопрос?
			AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_195");	//Конечно, задавай.
			AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_196");	//Зурис сказал мне, что после нашего с тобой разговора ты заходил к нему.
			AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_197");	//Ну да...(ехидно) Я все-таки решил воспользоваться твоим советом и нанести ему визит.
			AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_199");	//Хотя поначалу я сомневался в том, что Зурис выслушает меня.
			AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_200");	//Но все прошло как нельзя удачно.
			AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_203");	//Теперь мы собираемся совместно организовать одно небольшое дельце, которое сулит совсем неплохой доход.
			AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_208");	//Вот, прими это кольцо в качестве моей благодарности.
			B_GiveInvItems(self,other,ItRi_Prot_Total_02,1);
			AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_210");	//Спасибо.
		}
		else
		{
			B_GivePlayerXP(300);
			AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_212");	//Большое спасибо.
		};
		Log_SetTopicStatus(TOPIC_JORAHELP,LOG_SUCCESS);
		MIS_JORAHELP = LOG_SUCCESS;
		B_LogEntry(TOPIC_JORAHELP,"Лютеро был рад услышать о том, что мне удалось достать эликсир для Зуриса и тем самым уладить проблему с Джорой.");
		TRADEGUILDREP = TRADEGUILDREP + 1;
	}
	else if((ZURISTRADEPLACEMEOK == TRUE) && (Npc_HasItems(other,itwr_zurisdocs) >= 1))
	{
		if(ZURISTRADEPLACEYES == TRUE)
		{
			B_GivePlayerXP(250);
		}
		else if(ZURISTRADEPLACEYESCHIP == TRUE)
		{
			B_GivePlayerXP(150);
		};
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_214");	//Да, есть.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_215");	//Тогда рассказывай - не тяни.
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_216");	//Я отдал Зурису ту сумму, о которой мы с ним договаривались.
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_217");	//А он дал мне вот эти документы, подтверждающие право собственности на торговое место Джоры.
		B_GiveInvItems(other,self,itwr_zurisdocs,1);
		Npc_RemoveInvItems(self,itwr_zurisdocs,1);
		B_UseFakeScroll();
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_222");	//Совсем неплохо!
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_223");	//Судя по всему, остается только вписать в эти документы имя нового владельца - и вопрос можно считать закрытым.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_224");	//Хотя, конечно, я рассчитывал обойтись в этом деле без таких больших капиталовложений...
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_225");	//Думаю, по-другому навряд ли бы вышло.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_226");	//Ну да ладно - хватит об этом!
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_227");	//Главное, что теперь место Джоры принадлежит гильдии и более нет поводов для беспокойства.
		Log_SetTopicStatus(TOPIC_JORAHELP,LOG_SUCCESS);
		MIS_JORAHELP = LOG_SUCCESS;
		B_LogEntry(TOPIC_JORAHELP,"Я отдал Лютеро документы, подтверждающие права гильдии на место Джоры. Этот вопрос можно считать закрытым.");
		TRADEGUILDREP = TRADEGUILDREP + 1;
	}
	else
	{
		AI_Output(other,self,"DIA_Lutero_JoraHelpDo_01_229");	//Нет, пока ничего нового.
		AI_Output(self,other,"DIA_Lutero_JoraHelpDo_01_230");	//Жаль. Когда что-нибудь выяснишь, поставь меня в известность.
	};
};

func void dia_lutero_jorahelpdo_yes()
{
	AI_Output(other,self,"DIA_Lutero_JoraHelpDo_Yes_01_00");	//Думаю, тебе стоит попытаться вновь поговорить с Зурисом на эту тему...
	AI_Output(self,other,"DIA_Lutero_JoraHelpDo_Yes_01_01");	//(удивленно) И что я ему скажу?
	AI_Output(other,self,"DIA_Lutero_JoraHelpDo_Yes_01_02");	//Просто расскажи ему правду! Возможно, это поможет вам наладить хорошие отношения.
	AI_Output(self,other,"DIA_Lutero_JoraHelpDo_Yes_01_03");	//Хммм...(задумчиво) Я, конечно, уже подумывал об этом.
	AI_Output(self,other,"DIA_Lutero_JoraHelpDo_Yes_01_07");	//И думаешь, это поможет решить проблему с арендой Джоры?
	AI_Output(other,self,"DIA_Lutero_JoraHelpDo_Yes_01_09");	//Я уже договорился с Зурисом насчет решения этой проблемы.
	AI_Output(self,other,"DIA_Lutero_JoraHelpDo_Yes_01_10");	//Правда? Хммм, неплохо. И на каких условиях?
	AI_Output(other,self,"DIA_Lutero_JoraHelpDo_Yes_01_11");	//Если я достану ему тот эликсир, то он пересмотрит свое решение насчет Джоры.
	AI_Output(self,other,"DIA_Lutero_JoraHelpDo_Yes_01_16");	//Хммм... Значит Зурис все еще хочет заполучить Пламя Элигора.
	AI_Output(self,other,"DIA_Lutero_JoraHelpDo_Yes_01_17");	//Он знает, что просит.
	LUTEROAGREEMEETZURIS = TRUE;
	Info_ClearChoices(dia_lutero_jorahelpdo);
	Info_AddChoice(dia_lutero_jorahelpdo,"Я как раз собирался тебя расспросить об этом.",dia_lutero_jorahelpdo_eleksirinfo);
};

func void dia_lutero_jorahelpdo_no()
{
	AI_Output(other,self,"DIA_Lutero_JoraHelpDo_No_01_00");	//Мне кажется, Зурис сам виноват.
	AI_Output(other,self,"DIA_Lutero_JoraHelpDo_No_01_01");	//Если бы он умел слушать людей, думаю, сейчас бы все было нормально.
	AI_Output(self,other,"DIA_Lutero_JoraHelpDo_No_01_02");	//Ну да, скорее всего, ты прав.
	AI_Output(self,other,"DIA_Lutero_JoraHelpDo_No_01_03");	//Хммм...(задумчиво) Хотя я уже последнее время подумывал о том, чтобы попробовать еще раз поговорить с ним.
	AI_Output(other,self,"DIA_Lutero_JoraHelpDo_No_01_05");	//Я уже договорился с Зурисом насчет решения этой проблемы.
	AI_Output(self,other,"DIA_Lutero_JoraHelpDo_No_01_06");	//Правда? Хммм, неплохо. И на каких условиях?
	AI_Output(other,self,"DIA_Lutero_JoraHelpDo_No_01_08");	//Если я достану ему тот эликсир, то он пересмотрит свое решение насчет Джоры.
	AI_Output(self,other,"DIA_Lutero_JoraHelpDo_No_01_09");	//Хммм... Значит Зурис все еще хочет заполучить Пламя Элигора.
	AI_Output(self,other,"DIA_Lutero_JoraHelpDo_No_01_10");	//Он знает, что просит.
	Info_ClearChoices(dia_lutero_jorahelpdo);
	Info_AddChoice(dia_lutero_jorahelpdo,"Я как раз собирался тебя расспросить о эликсире.",dia_lutero_jorahelpdo_eleksirinfo);
};

func void dia_lutero_jorahelpdo_eleksirinfo()
{
	AI_Output(other,self,"DIA_Lutero_JoraHelpDo_EleksirInfo_01_00");	//Я как раз собирался тебя расспросить о эликсире.
	AI_Output(self,other,"DIA_Lutero_JoraHelpDo_EleksirInfo_01_03");	//Я же сказал тебе, что меня обокрали!
	AI_Output(other,self,"DIA_Lutero_JoraHelpDo_EleksirInfo_01_04");	//Но ты же наверняка предпринимал еще какие-нибудь попытки вернуть себе это зелье?
	AI_Output(self,other,"DIA_Lutero_JoraHelpDo_EleksirInfo_01_05");	//Что касается эликсира - то после того, как я отказался от условий, выдвинутых мне теми бандитами...
	AI_Output(self,other,"DIA_Lutero_JoraHelpDo_EleksirInfo_01_06");	//...его след канул в неизвестность вместе с ними же самими.
	AI_Output(self,other,"DIA_Lutero_JoraHelpDo_EleksirInfo_01_07");	//Хотя, правда, есть один момент в этом деле, который, возможно, сможет тебе помочь.
	AI_Output(other,self,"DIA_Lutero_JoraHelpDo_EleksirInfo_01_08");	//Какой именно?
	AI_Output(self,other,"DIA_Lutero_JoraHelpDo_EleksirInfo_01_09");	//До меня доходили слухи, что тогда городская стража поймала одного парня, который промышлял воровством здесь в городе.
	AI_Output(self,other,"DIA_Lutero_JoraHelpDo_EleksirInfo_01_10");	//Кажется, он что-то знал про ограбление моего дома. Правда выяснить, что именно - я так толком и не успел.
	AI_Output(self,other,"DIA_Lutero_JoraHelpDo_EleksirInfo_01_12");	//Через пару дней его отправили за барьер в Долину Рудников.
	AI_Output(other,self,"DIA_Lutero_JoraHelpDo_EleksirInfo_01_14");	//А как звали того парня?
	AI_Output(self,other,"DIA_Lutero_JoraHelpDo_EleksirInfo_01_15");	//То ли Граймс, то ли Грим - точно уже не помню.
	AI_Output(other,self,"DIA_Lutero_JoraHelpDo_EleksirInfo_01_16");	//Ясно...(имя кажется знакомым)
	AI_Output(self,other,"DIA_Lutero_JoraHelpDo_EleksirInfo_01_18");	//Не думаю, что тебе удастся найти его - хотя попытаться, конечно, можно.
	AI_Output(self,other,"DIA_Lutero_JoraHelpDo_EleksirInfo_01_24");	//В любом случае удачи тебе.
	B_LogEntry(TOPIC_JORAHELP,"Лютеро немногое смог рассказать о судьбе украденного у него эликсира, но вспомнил небольшую деталь, которая может помочь мне его отыскать. Человек по имени то ли Граймс, то ли Грим знал кое-какие интересные подробности об этой краже. Однако его уже очень давно отправили в Долину Рудников за воровство, и о его судьбе ничего не известно. В любом случае эта единственная ниточка, ведущая к потерянному эликсиру Пламя Элигора.");
	ZURISGIVEMETASKINFO = TRUE;
};


instance DIA_LUTERO_JORAHELPGIVEGOLD(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = dia_lutero_jorahelpgivegold_condition;
	information = dia_lutero_jorahelpgivegold_info;
	permanent = TRUE;
	description = "Насчет денег гильдии...";
};


func int dia_lutero_jorahelpgivegold_condition()
{
	if((MIS_JORAHELP == LOG_Running) && (ZURISTRADEPLACEMEOK == FALSE) && (LUTEROJORAHELPGIVEGOLD == FALSE) && ((ZURISTRADEPLACEYESINFO == TRUE) || (ZURISTRADEPLACEYESCHIPINFO == TRUE)))
	{
		return TRUE;
	};
};

func void dia_lutero_jorahelpgivegold_info()
{
	AI_Output(other,self,"DIA_Lutero_JoraHelpGiveGold_01_00");	//Насчет денег гильдии...
	AI_Output(self,other,"DIA_Lutero_JoraHelpGiveGold_01_01");	//(удивленно) Каких денег?
	AI_Output(other,self,"DIA_Lutero_JoraHelpGiveGold_01_02");	//Денег на сделку с Зурисом!
	AI_Output(other,self,"DIA_Lutero_JoraHelpGiveGold_01_03");	//Кажется, ты говорил, что гильдия готова выделить часть той суммы, которую затребовал Зурис за место Джоры.
	AI_Output(self,other,"DIA_Lutero_JoraHelpGiveGold_01_04");	//А! Ты об этом...(задумчиво) Я же сказал тебе, что сначала достань свою часть, а потом мы поговорим.
	AI_Output(self,other,"DIA_Lutero_JoraHelpGiveGold_01_05");	//У тебя есть эти деньги?
	if((ZURISTRADEPLACEYESINFO == TRUE) && (Npc_HasItems(other,ItMi_Gold) >= 7500))
	{
		AI_Output(other,self,"DIA_Lutero_JoraHelpGiveGold_01_09");	//Вот, смотри - тут ровно семь с половиной тысяч.
		AI_Output(self,other,"DIA_Lutero_JoraHelpGiveGold_01_12");	//Хммм...(задумчиво) Хорошо. Ты убедил меня.
		AI_Output(self,other,"DIA_Lutero_JoraHelpGiveGold_01_13");	//Держи этот кошелек. Тут ровно две с половиной тысячи золотых монет.
		B_GiveInvItems(self,other,itse_lutterobigpocket,1);
		AI_Output(self,other,"DIA_Lutero_JoraHelpGiveGold_01_16");	//И я надеюсь, тебе удастся решить эту проблему.
		LUTEROJORAHELPGIVEGOLD = TRUE;
	}
	else if((ZURISTRADEPLACEYESCHIPINFO == TRUE) && (Npc_HasItems(other,ItMi_Gold) >= 2500))
	{
		AI_Output(other,self,"DIA_Lutero_JoraHelpGiveGold_01_20");	//Вот, смотри - тут ровно две с половиной тысячи.
		AI_Output(self,other,"DIA_Lutero_JoraHelpGiveGold_01_23");	//Хммм...(задумчиво) Хорошо. Ты убедил меня.
		AI_Output(self,other,"DIA_Lutero_JoraHelpGiveGold_01_24");	//Держи этот кошелек. Тут ровно столько же, сколько и у тебя в руках!...(неохотно протягивая)
		B_GiveInvItems(self,other,itse_lutterobigpocket,1);
		AI_Output(self,other,"DIA_Lutero_JoraHelpGiveGold_01_27");	//И я надеюсь, тебе удастся решить эту проблему.
		LUTEROJORAHELPGIVEGOLD = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Lutero_JoraHelpGiveGold_01_28");	//Пока нет.
		AI_Output(self,other,"DIA_Lutero_JoraHelpGiveGold_01_29");	//(раздраженно) Тогда зачем ты тратишь мое время попусту?
		AI_Output(self,other,"DIA_Lutero_JoraHelpGiveGold_01_32");	//Приходи, когда они у тебя будут, тогда и поговорим.
	};
};


instance DIA_LUTERO_CHURCHDEAL(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = dia_lutero_churchdeal_condition;
	information = dia_lutero_churchdeal_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lutero_churchdeal_condition()
{
	if((MEMBERTRADEGUILD == TRUE) && (JORATAKEPACK == TRUE))
	{
		return TRUE;
	};
};

func void dia_lutero_churchdeal_info()
{
	B_GivePlayerXP(200);
	AI_Output(self,other,"DIA_Lutero_ChurchDeal_01_00");	//Хорошо, что ты пришел! Я ждал тебя.
	AI_Output(other,self,"DIA_Lutero_ChurchDeal_01_01");	//Я отдал посылку Джоре.
	AI_Output(self,other,"DIA_Lutero_ChurchDeal_01_02");	//Да, я знаю. Думаю, что я не зря доверил тебе это поручение.
	TRADEGUILDREP = TRADEGUILDREP + 1;
	AI_Output(self,other,"DIA_Lutero_ChurchDeal_01_04");	//И у меня для тебя есть еще одно поручение.
	AI_Output(other,self,"DIA_Lutero_ChurchDeal_01_10");	//Что нужно делать?
	AI_Output(self,other,"DIA_Lutero_ChurchDeal_01_11");	//Всего-то навсего надо забрать партию вина из монастыря у мастера Горакса и доставить ее мне. Об остальном я позабочусь сам.
	AI_Output(self,other,"DIA_Lutero_ChurchDeal_01_12");	//Правда в этом деле могут возникнуть некоторые осложнения.
	AI_Output(other,self,"DIA_Lutero_ChurchDeal_01_13");	//Какие?
	AI_Output(self,other,"DIA_Lutero_ChurchDeal_01_14");	//У меня нет четкой договоренности с Гораксом насчет стоимости этой партии вина.
	AI_Output(self,other,"DIA_Lutero_ChurchDeal_01_15");	//Поэтому тебе придется самому договориться с ним.
	AI_Output(other,self,"DIA_Lutero_ChurchDeal_01_16");	//То есть, выходит, мне придется с ним торговаться?
	AI_Output(self,other,"DIA_Lutero_ChurchDeal_01_17");	//Это решать тебе. Ты можешь принять его условия или можешь постараться выбить из него условия получше.
	AI_Output(other,self,"DIA_Lutero_ChurchDeal_01_18");	//А что я получу с этой сделки?
	AI_Output(self,other,"DIA_Lutero_ChurchDeal_01_19");	//Твоя награда будет зависеть от того, насколько дешево ты сможешь купить у него это вино.
	AI_Output(self,other,"DIA_Lutero_ChurchDeal_01_20");	//Я дам тебе пятьсот золотых монет. Этого вполне должно хватить.
	B_GiveInvItems(self,other,ItMi_Gold,500);
	AI_Output(self,other,"DIA_Lutero_ChurchDeal_01_21");	//Однако ты сам понимаешь, что для гильдии куда более выгодно, если не все эти деньги окажутся у него в кармане.
	AI_Output(self,other,"DIA_Lutero_ChurchDeal_01_23");	//А теперь не теряй времени и отправляйся в монастырь к Гораксу.
	AI_Output(self,other,"DIA_Lutero_ChurchDeal_01_24");	//А я в свою очередь жду тебя с партией вина и с докладом о совершенной сделке.
	MIS_CHURCHDEAL = LOG_Running;
	Log_CreateTopic(TOPIC_CHURCHDEAL,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CHURCHDEAL,LOG_Running);
	B_LogEntry(TOPIC_CHURCHDEAL,"Мне необходимо отправиться в монастырь к мастеру Гораксу и доставить от него небольшую партию монастырского вина. Лютеро предупредил меня, что цена на это вино не обговорена, поэтому мне предстоит самому договариваться с Гораксом о стоимости покупки. На заключение этой сделки Лютеро выделил мне пятьсот золотых монет. Моя же награда будет зависеть от того, насколько выгодно я смогу заключить сделку.");
};


instance DIA_LUTERO_CHURCHDEALDO(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = dia_lutero_churchdealdo_condition;
	information = dia_lutero_churchdealdo_info;
	permanent = FALSE;
	description = "По поводу сделки с Гораксом...";
};


func int dia_lutero_churchdealdo_condition()
{
	if((MIS_CHURCHDEAL == LOG_Running) && ((GORAXSNOTRADEMEWINE == TRUE) || (GORAXSTRADEMEWINE == TRUE)))
	{
		return TRUE;
	};
};

func void dia_lutero_churchdealdo_info()
{
	var int bonuswineindex;
	AI_Output(other,self,"DIA_Lutero_ChurchDealDo_01_00");	//По поводу сделки с Гораксом...
	AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_01");	//Тебе есть, что мне сказать?

	if(GORAXSNOTRADEMEWINE == TRUE)
	{
		AI_Output(other,self,"DIA_Lutero_ChurchDealDo_01_02");	//К сожалению, я не смог договориться о покупке вина.
		AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_03");	//(вне себя) Как?!
		if(GORAXSNOTENOUGHTGOLD == TRUE)
		{
			AI_Output(other,self,"DIA_Lutero_ChurchDealDo_01_04");	//Мне не хватило денег на эту сделку!
			AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_05");	//То есть?! (удивленно) Как ты договаривался на ту сумму, которой у тебя нет?!
			AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_06");	//(вне себя) Ты что, совсем идиот?!	
		}
		else
		{
			AI_Output(other,self,"DIA_Lutero_ChurchDealDo_01_09");	//Ему не подошли те условия, на которых я был согласен купить у него это вино.
			AI_Output(other,self,"DIA_Lutero_ChurchDealDo_01_10");	//А те цены, которые предложил он, были просто абсурдны.
			AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_11");	//Знаешь, я не очень-то склонен верить твоим словам...(гневно)
			AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_12");	//Я хорошо знаю Горакса! Он никогда бы не предложил те условия, которые бы ставили под сомнения его репутацию честного торговца.
			AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_13");	//Видимо, ты сам настолько перегнул палку, что Гораксу просто ничего не оставалось другого, как отказать тебе.
		};
		AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_15");	//И теперь нам придется теперь заплатить ему в два раза дороже обычной цены, если мы хотим все-таки получить эту партию вина.
		AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_16");	//Иначе он просто не станет нас слушать. И все благодаря тебе!...(срываясь на крик)
		AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_17");	//И что еще хуже, он запросто может продать это вино кому-нибудь другому!
		if(MIS_JORAHELP == LOG_FAILED)
		{
			AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_20");	//(разочаровано) Я так рассчитывал на тебя! Видимо, зря я это делал!
			AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_24");	//Ты совершенно не годишься для подобного рода дел!
			AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_25");	//Своими действиями ты приносишь нашей гильдии лишь одни убытки!
			AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_26");	//Поэтому будет правильнее, если мы в дальнейшем откажемся от твоей помощи!
			AI_Output(other,self,"DIA_Lutero_ChurchDealDo_01_27");	//Что это значит?
			AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_28");	//Это значит, что ты больше не член нашей гильдии!
			AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_29");	//(гневно) Таким людям, как ты, не место среди нас!
			AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_31");	//Проваливай! Нам нечего больше обсуждать.
			MIS_CHURCHDEAL = LOG_FAILED;
			Log_SetTopicStatus(TOPIC_CHURCHDEAL,LOG_OBSOLETE);
			MIS_TRADEGUILD = LOG_FAILED;
			LUTEROPISSOFF = TRUE;
			MEMBERTRADEGUILD = FALSE;
			B_LogEntry_Failed(TOPIC_TRADEGUILD);
			AI_StopProcessInfos(self);
		}
		else
		{
			AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_33");	//Видимо я сам виноват - слишком сильно переоценил твои возможности.
			AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_34");	//Надо было поручить это дело кому-нибудь другому!
			AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_35");	//А ты, видимо, еще не готов для таких серьезных дел.
			AI_Output(other,self,"DIA_Lutero_ChurchDealDo_01_36");	//Скорее всего, ты прав.
			AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_37");	//Ладно! Забудем об этом. Я лично отправлюсь в монастырь и поговорю с Гораксом.
			AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_39");	//А что касается тебя - то постарайся больше не совершать таких ошибок!
			AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_40");	//Иначе нашему сотрудничеству в скором времени придет конец.
			AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_43");	//Подожди, те деньги, что я дал тебе на эту сделку, остались при тебе. Где они?
			MIS_CHURCHDEAL = LOG_FAILED;
			Log_SetTopicStatus(TOPIC_CHURCHDEAL,LOG_OBSOLETE);
			if(Npc_HasItems(other,ItMi_Gold) >= 500)
			{
				AI_Output(other,self,"DIA_Lutero_ChurchDealDo_01_44");	//Они у меня.
				AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_45");	//Тогда, чего же ты ждешь - отдавай их обратно! Или ты думал оставить их себе?
				AI_Output(other,self,"DIA_Lutero_ChurchDealDo_01_46");	//Вот, держи.
				B_GiveInvItems(other,self,ItMi_Gold,500);
				AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_47");	//Ну, хоть деньги не потерял, и то радует.
				AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_48");	//Ладно, давай теперь поговорим о другом.
				if(TRADEGUILDREP > 0)
				{
					TRADEGUILDREP = TRADEGUILDREP - 1;
				};
			}
			else
			{
				AI_Output(other,self,"DIA_Lutero_ChurchDealDo_01_49");	//У меня их нет.
				AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_50");	//Что? (возмущенно) И как это понимать?!
				AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_52");	//Ты думаешь, что это вот так вот просто сойдет тебе с рук?
				AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_56");	//Ты можешь более не считать себя членом нашей гильдии!
				AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_57");	//Таким людям, как ты, не место среди нас!
				AI_Output(other,self,"DIA_Lutero_ChurchDealDo_01_60");	//Но я...
				AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_61");	//(перебивая) Проваливай! Нам нечего больше обсуждать!
				MIS_TRADEGUILD = LOG_FAILED;
				LUTEROPISSOFF = TRUE;
				MEMBERTRADEGUILD = FALSE;
				B_LogEntry_Failed(TOPIC_TRADEGUILD);
				AI_StopProcessInfos(self);
			};
		};
	};
	if(GORAXSTRADEMEWINE == TRUE)
	{
		AI_Output(other,self,"DIA_Lutero_ChurchDealDo_01_63");	//Я договорился с Гораксом о цене на партию вина.
		AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_64");	//Отлично! (радостно) Это очень хорошие новости!
		AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_65");	//А где само вино?
		AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_66");	//У тебя по моим подсчетам должно быть не меньше двадцати пяти бутылок.

		if(Npc_HasItems(other,ItFo_Wine) >= 25)
		{
			AI_Output(other,self,"DIA_Lutero_ChurchDealDo_01_67");	//Вот они! Все до одной бутылки - в целости и сохранности.
			B_GiveInvItems(other,self,ItFo_Wine,25);
			Npc_RemoveInvItems(self,ItFo_Wine,25);
			AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_68");	//(радостно) Замечательно!
			AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_69");	//Моя интуиция меня не подвела - я знал, что тебе можно доверить это дело.
			AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_70");	//Теперь же давай обговорим подробности этой сделки.
			AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_71");	//За какую цену Горакс согласился продать тебе это вино?
			TRADEGUILDREP = TRADEGUILDREP + 1;
			MIS_CHURCHDEAL = LOG_SUCCESS;
			Log_SetTopicStatus(TOPIC_CHURCHDEAL,LOG_SUCCESS);
			B_LogEntry(TOPIC_TRADEGUILD,"Я доставил монастырское вино Лютеро.");

			if(GORAXCURRENTPRICE > 500)
			{
				B_GivePlayerXP(100);
				TRADEGUILDREP = TRADEGUILDREP - 2;
				if(TRADEGUILDREP < 0)
				{
					TRADEGUILDREP = 0;
				};
				AI_Output(other,self,"DIA_Lutero_ChurchDealDo_01_72");	//К сожалению, мне не хватило тех денег, которые ты мне дал.
				AI_Output(other,self,"DIA_Lutero_ChurchDealDo_01_75");	//В общем, я заплатил ему чуть больше пятиста монет.
				AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_77");	//Ты меня сильно расстроил...
				AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_78");	//Я думал, что тебе все-таки удастся сбить немного цену на эту партию вина.
				AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_79");	//Ну да ладно! (отмахиваясь)
				AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_80");	//Главное, что ты выполнил мое поручение. А остальное уже не так и важно.
				AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_81");	//В конце концов, мы всегда сможем отыграться на покупателях...(ехидно)
			}
			else if(GORAXCURRENTPRICE == 500)
			{
				B_GivePlayerXP(100);
				TRADEGUILDREP = TRADEGUILDREP - 2;
				if(TRADEGUILDREP < 0)
				{
					TRADEGUILDREP = 0;
				};
				AI_Output(other,self,"DIA_Lutero_ChurchDealDo_01_84");	//Я уложился ровно в пятьсот монет.
				AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_87");	//М-да. Ты меня немного расстроил...
				AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_88");	//Я думал, что тебе все-таки удастся договориться с ним на более выгодных условиях.
				AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_91");	//В конце концов, мы всегда сможем отыграться на покупателях...(ехидно)
			}
			else if(GORAXCURRENTPRICE > 400)
			{
				B_GivePlayerXP(150);
				TRADEGUILDREP = TRADEGUILDREP - 1;
				if(TRADEGUILDREP < 0)
				{
					TRADEGUILDREP = 0;
				};
				AI_Output(other,self,"DIA_Lutero_ChurchDealDo_01_94");	//Я отдал ему чуть больше четырехсот монет.
				AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_97");	//(без эмоций) Что же, неплохо.
				AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_98");	//Хотя я думал, что тебе удастся договориться с ним на чуть более выгодных условиях.
				AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_100");	//Главное, что ты выполнил мое поручение. А остальное уже не так и важно.
			}
			else if(GORAXCURRENTPRICE > 300)
			{
				B_GivePlayerXP(200);
				TRADEGUILDREP = TRADEGUILDREP - 1;
				AI_Output(other,self,"DIA_Lutero_ChurchDealDo_01_101");	//Я заплатил Гораксу чуть больше трехсот монет.
				AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_102");	//Ого! Совсем неплохо.
				AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_103");	//И я честно говоря не ожидал от тебя подобных успехов.
				AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_104");	//Что же, прими мои поздравления! (смеется)
			}
			else if(GORAXCURRENTPRICE > 200)
			{
				B_GivePlayerXP(200);
				AI_Output(other,self,"DIA_Lutero_ChurchDealDo_01_105");	//Мы договорились с ним о цене чуть большей, чем двести монет!
				AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_107");	//Неужели Горакс пошел на это?
				AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_110");	//Ну что же, могу сказать только одно - отличная работа!
			}
			else if(GORAXCURRENTPRICE > 100)
			{
				TRADEGUILDREP = TRADEGUILDREP + 1;
				B_GivePlayerXP(250);
				AI_Output(other,self,"DIA_Lutero_ChurchDealDo_01_111");	//Чуть больше одной сотни монет.
				AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_114");	//Невероятно! (смеется) Поверить не могу, что Горакс принял такие условия!
				AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_116");	//Как я погляжу, ты умеешь добиваться своего. Молодец!
			}
			else if(GORAXCURRENTPRICE > 50)
			{
				TRADEGUILDREP = TRADEGUILDREP + 2;
				B_GivePlayerXP(300);
				AI_Output(other,self,"DIA_Lutero_ChurchDealDo_01_117");	//Все это вино мне обошлось меньше сотни монет!
				AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_120");	//М-да!...(смеется) Бедный Горакс!
				AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_121");	//Выходит, ты его развел просто как маленького мальчика! Кто бы мог подумать.
				AI_Output(other,self,"DIA_Lutero_ChurchDealDo_01_122");	//Что-то не так?
				AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_124");	//До сих пор в голове не укладывается - как у тебя это вышло.
				AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_125");	//Хммм...(задумчиво) Удивил ты меня! Очень сильно удивил!
			}
			else if(GORAXCURRENTPRICE <= 50)
			{
				TRADEGUILDREP = TRADEGUILDREP + 3;
				B_GivePlayerXP(500);

				if(RhetorikSkillValue[1] < 100)
				{
					RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
					AI_Print("Риторика + 1");
				};

				AI_Output(other,self,"DIA_Lutero_ChurchDealDo_01_126");	//Он отдал мне свое вино меньше чем за полсотни монет!
				AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_127");	//Не понял... Горакс что, занялся благотворительностью?
				AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_132");	//Видимо, у бедняги совсем крыша поехала, если он согласился на такие условия. (про себя) Да простит меня Иннос за мои слова.
			};

			AI_Output(other,self,"DIA_Lutero_ChurchDealDo_01_134");	//А что насчет моей доли в этом деле?
			AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_135");	//(ехидно) Твоя доля уже у тебя в кармане.
			AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_136");	//Те деньги, что ты смог выторговать у Горакса, - она самая и есть.
			AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_138");	//А гильдия получила возможность покупать у него вино по более низкой цене.
		}
		else
		{
			AI_Output(other,self,"DIA_Lutero_ChurchDealDo_01_144");	//У меня их нет.
			AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_145");	//Что? (возмущенно) И как это понимать?!
			AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_150");	//Ты думаешь, что это вот так вот просто сойдет тебе с рук?
			AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_154");	//Ты можешь более не считать себя членом нашей гильдии!
			AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_155");	//(гневно) Таким людям, как ты, не место среди нас!
			AI_Output(other,self,"DIA_Lutero_ChurchDealDo_01_158");	//Но я...
			AI_Output(self,other,"DIA_Lutero_ChurchDealDo_01_159");	//(перебивая) Проваливай! Нам нечего больше обсуждать!
			MIS_CHURCHDEAL = LOG_FAILED;
			Log_SetTopicStatus(TOPIC_CHURCHDEAL,LOG_OBSOLETE);
			MIS_TRADEGUILD = LOG_FAILED;
			LUTEROPISSOFF = TRUE;
			MEMBERTRADEGUILD = FALSE;
			B_LogEntry_Failed(TOPIC_TRADEGUILD);
			AI_StopProcessInfos(self);
		};
	};
};


instance DIA_LUTERO_RARETHINGS(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = dia_lutero_rarethings_condition;
	information = dia_lutero_rarethings_info;
	permanent = FALSE;
	description = "Очередное поручение?";
};


func int dia_lutero_rarethings_condition()
{
	if(((MIS_ONARBUSINESS == LOG_SUCCESS) || (MIS_ONARBUSINESS == LOG_FAILED)) && (Kapitel >= 3))
	{
		return TRUE;
	};
};

func void dia_lutero_rarethings_info()
{
	AI_Output(other,self,"DIA_Lutero_RareThings_01_00");	//Очередное поручение?
	AI_Output(self,other,"DIA_Lutero_RareThings_01_02");	//Да, мне действительно требуется твоя помощь в одном несложном деле.
	AI_Output(self,other,"DIA_Lutero_RareThings_01_04");	//Один из моих постоянных покупателей сделал мне заказ на несколько очень редких вещей.
	AI_Output(self,other,"DIA_Lutero_RareThings_01_05");	//Если быть точным - конкретно на три вещи. И я хочу, чтобы именно ты непосредственно занялся их поиском.
	AI_Output(other,self,"DIA_Lutero_RareThings_01_06");	//Почему я?
	AI_Output(self,other,"DIA_Lutero_RareThings_01_07");	//Да потому что ты человек, который нигде и никогда не сидит на одном и том же месте! (смеется)
	AI_Output(self,other,"DIA_Lutero_RareThings_01_10");	//Для поиска этих вещей как раз такой человек и нужен.
	AI_Output(self,other,"DIA_Lutero_RareThings_01_11");	//Поскольку найти их будет совсем непросто. Уж поверь мне.
	AI_Output(other,self,"DIA_Lutero_RareThings_01_12");	//А что ты ищешь?
	AI_Output(self,other,"DIA_Lutero_RareThings_01_13");	//Речь идет о трех драгоценных статуэтках с изображением Инноса, сделанных из черного нордмарского мрамора!
	AI_Output(self,other,"DIA_Lutero_RareThings_01_16");	//Могу сказать, что уже сам по себе этот материал ценится достаточно высоко, поскольку достать его невероятно трудно.
	AI_Output(self,other,"DIA_Lutero_RareThings_01_17");	//А если ему еще придать красивую и изящную форму, например в виде тех же статуэток - то все это уже тянет на целое состояние!
	AI_Output(other,self,"DIA_Lutero_RareThings_01_18");	//И твой покупатель готов выложить за эти статуэтки большие деньги?
	AI_Output(self,other,"DIA_Lutero_RareThings_01_19");	//Я бы сказал просто огромные! Поэтому это заказ очень важен для нас.
	AI_Output(other,self,"DIA_Lutero_RareThings_01_20");	//Я понимаю. И откуда мне стоит начать свои поиски?
	AI_Output(self,other,"DIA_Lutero_RareThings_01_22");	//Насколько мне известно, несколько лет назад эти статуэтки были отправлены в Миненталь, в качестве оплаты баронам большого груза магической руды.
	AI_Output(self,other,"DIA_Lutero_RareThings_01_24");	//Видимо, кто-то из баронов был настоящим ценителем искусства, если решил потребовать у короля Робара именно их. (смеется)
	AI_Output(self,other,"DIA_Lutero_RareThings_01_29");	//Но тогда магическая руда была куда важнее для короля, нежели какие-то дорогие безделушки.
	AI_Output(self,other,"DIA_Lutero_RareThings_01_30");	//Ведь только с ее помощью его паладины могли хоть как-то сдерживать орды орков.
	AI_Output(self,other,"DIA_Lutero_RareThings_01_31");	//Поэтому король без колебаний согласился на эти условия...(нерешительно) Ну, я так думаю.
	AI_Output(other,self,"DIA_Lutero_RareThings_01_32");	//И ты полагаешь, что эти статуэтки до сих пор находятся именно в колонии?
	AI_Output(self,other,"DIA_Lutero_RareThings_01_33");	//Скорее всего. По крайней мере, со времени падения барьера, никто толком о них ничего и не слышал.
	AI_Output(self,other,"DIA_Lutero_RareThings_01_35");	//И запомни - меня интересуют исключительно все три статуэтки!
	AI_Output(self,other,"DIA_Lutero_RareThings_01_37");	//Поэтому возвращайся ко мне только тогда, когда у тебя на руках будут они все.
	AI_Output(other,self,"DIA_Lutero_RareThings_01_40");	//Я постараюсь сделать все, что в моих силах.
	MIS_RARETHINGS = LOG_Running;
	Log_CreateTopic(TOPIC_RARETHINGS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RARETHINGS,LOG_Running);
	B_LogEntry(TOPIC_RARETHINGS,"Один из постоянных покупателей Лютеро заказал ему три драгоценных статуэтки Инноса, сделанных из черного мрамора. Лютеро хочет, чтобы я нашел их и принес ему. Известно, что эти статуэтки в свое время были отправлены рудным баронам в уплату долга за богатый груз магической руды. Вероятно, они до сих пор находятся где-то в Долине Рудников. Думаю, начать поиски стоит с помещений замка.");
};


instance DIA_LUTERO_RARETHINGSDO(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = dia_lutero_rarethingsdo_condition;
	information = dia_lutero_rarethingsdo_info;
	permanent = FALSE;
	description = "Я принес нордмарские статуэтки.";
};


func int dia_lutero_rarethingsdo_condition()
{
	if((MIS_RARETHINGS == LOG_Running) && (Npc_HasItems(hero,itmi_innosmramorstatue) >= 3) && (MIS_RESCUEGOMEZ == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_lutero_rarethingsdo_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Lutero_RareThingsDo_01_00");	//Я принес нордмарские статуэтки. Как ты и просил!
	AI_Output(self,other,"DIA_Lutero_RareThingsDo_01_01");	//Все три?! Покажи...(недоверчиво)
	B_GiveInvItems(other,self,itmi_innosmramorstatue,3);
	Npc_RemoveInvItems(self,itmi_innosmramorstatue,3);
	AI_Output(self,other,"DIA_Lutero_RareThingsDo_01_03");	//Невероятно! (вне себя) У тебя получилось!
	AI_Output(other,self,"DIA_Lutero_RareThingsDo_01_04");	//Да, мне удалось сделать это.
	AI_Output(self,other,"DIA_Lutero_RareThingsDo_01_07");	//Ты очень сильно помог мне!
	AI_Output(self,other,"DIA_Lutero_RareThingsDo_01_10");	//Вот, прими от меня этот небольшой подарок. Думаю, тебе он должен понравиться.
	B_GiveInvItems(self,other,itpo_megapotionskill,1);
	AI_Output(other,self,"DIA_Lutero_RareThingsDo_01_11");	//Что это за эликсир?
	AI_Output(self,other,"DIA_Lutero_RareThingsDo_01_12");	//Выпей и узнаешь. По крайней мере, могу заверить тебя точно, что от него ты не умрешь...(смеется)
	AI_Output(self,other,"DIA_Lutero_RareThingsDo_01_13");	//А в придачу еще тысяча золотых. От этого, думаю, ты тоже не откажешься.
	B_GiveInvItems(self,other,ItMi_Gold,1000);
	TRADEGUILDREP = TRADEGUILDREP + 1;
	MIS_RARETHINGS = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_RARETHINGS,LOG_SUCCESS);
	B_LogEntry(TOPIC_RARETHINGS,"Лютеро был очень доволен моей работой и щедро отблагодарил меня.");
};


instance DIA_LUTERO_RARETHINGSFAIL(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = dia_lutero_rarethingsfail_condition;
	information = dia_lutero_rarethingsfail_info;
	permanent = FALSE;
	description = "Я не смог найти эти статуэтки.";
};


func int dia_lutero_rarethingsfail_condition()
{
	if((MIS_RARETHINGS == LOG_Running) && (MIS_RESCUEGOMEZ == LOG_FAILED))
	{
		return TRUE;
	};
};

func void dia_lutero_rarethingsfail_info()
{
	AI_Output(other,self,"DIA_Lutero_RareThingsFail_01_00");	//Я не смог найти эти статуэтки.
	AI_Output(self,other,"DIA_Lutero_RareThingsFail_01_01");	//Ты в этом уверен?
	AI_Output(other,self,"DIA_Lutero_RareThingsFail_01_02");	//Теперь их вообще никто не найдет.
	AI_Output(self,other,"DIA_Lutero_RareThingsFail_01_03");	//Очень жаль. (печально) А я так рассчитывал на эту сделку...
	if(TRADEGUILDREP > 0)
	{
		TRADEGUILDREP = TRADEGUILDREP - 1;
	};
	MIS_RARETHINGS = LOG_FAILED;
	B_LogEntry_Failed(TOPIC_RARETHINGS);
};


instance DIA_LUTERO_MISSBRENDI(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = dia_lutero_missbrendi_condition;
	information = dia_lutero_missbrendi_info;
	permanent = FALSE;
	description = "Есть еще работенка?";
};


func int dia_lutero_missbrendi_condition()
{
	if(((MIS_RARETHINGS == LOG_SUCCESS) || (MIS_RARETHINGS == LOG_FAILED)) && (Kapitel >= 3))
	{
		return TRUE;
	};
};

func void dia_lutero_missbrendi_info()
{
	AI_Output(other,self,"DIA_Lutero_MissBrendi_01_00");	//Есть еще работа?
	AI_Output(self,other,"DIA_Lutero_MissBrendi_01_01");	//Работы всегда полно! (смеется) Но меня сейчас больше беспокоит немного другой вопрос.
	AI_Output(self,other,"DIA_Lutero_MissBrendi_01_03");	//Недавно я отправил одного своего посыльного - парня по имени Бенчел, в таверну 'Мертвая Гарпия'.
	AI_Output(self,other,"DIA_Lutero_MissBrendi_01_04");	//Он должен был забрать там партию черного бренди, которую для меня подготовил Орлан, хозяин этой таверны.
	AI_Output(other,self,"DIA_Lutero_MissBrendi_01_07");	//И что с этим не так?
	AI_Output(self,other,"DIA_Lutero_MissBrendi_01_08");	//Проблема в том, что от Бенчела до сих пор не поступало вообще никаких вестей.
	AI_Output(self,other,"DIA_Lutero_MissBrendi_01_09");	//Я до сих пор не знаю, где он и где мое бренди.
	AI_Output(self,other,"DIA_Lutero_MissBrendi_01_14");	//Я уже начинаю беспокоиться - а не приключилось ли с Бенчелом чего-нибудь дурного?
	AI_Output(other,self,"DIA_Lutero_MissBrendi_01_16");	//А я могу чем-нибудь тебе помочь в этом деле?
	AI_Output(self,other,"DIA_Lutero_MissBrendi_01_17");	//Конечно можешь. Необходимо как можно скорее отыскать Бенчела и узнать, что случилось.
	AI_Output(self,other,"DIA_Lutero_MissBrendi_01_18");	//И, естественно, доставить мне это черное бренди в количестве пяти бутылок не позднее завтрашнего полудня.
	BLACKBRENDITIMER = Wld_GetDay();
	MIS_BLACKBRENDI = LOG_Running;
	Log_CreateTopic(TOPIC_BLACKBRENDI,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BLACKBRENDI,LOG_Running);
	B_LogEntry(TOPIC_BLACKBRENDI,"Посыльный по имени Бенчел должен был доставить Лютеро пять бутылок дорогого черного бренди, которое подготовил для него Орлан. Но Бенчел куда-то запропастился, и Лютеро очень обеспокоен этим - скоро за ним должен прийти покупатель. Лютеро попросил меня выяснить, что стряслось с Бенчелом и постараться доставить ему пять бутылок этого бренди не позднее завтрашнего полудня.");
	Wld_InsertNpc(vlk_6130_benchel,"NW_BENCHELBANDITS_01");
	Wld_InsertNpc(bdt_9000_bandit,"NW_BENCHELBANDITS_02");
	Wld_InsertNpc(bdt_9001_bandit,"NW_BENCHELBANDITS_03");
	Wld_InsertNpc(bdt_9002_bandit,"NW_BENCHELBANDITS_04");
	Wld_InsertNpc(bdt_9003_bandit,"NW_BENCHELBANDITS_05");
	Wld_InsertNpc(bdt_9004_bandit,"NW_BENCHELBANDITS_06");
};


instance DIA_LUTERO_MISSBRENDIDO(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = dia_lutero_missbrendido_condition;
	information = dia_lutero_missbrendido_info;
	permanent = TRUE;
	description = "Я насчет Бенчела...";
};


func int dia_lutero_missbrendido_condition()
{
	if((MIS_BLACKBRENDI == LOG_Running) && (BENCHELSEE == TRUE))
	{
		return TRUE;
	};
};

func void dia_lutero_missbrendido_info()
{
	var int daynow;
	var int paynow;
	var int solnow;
	daynow = Wld_GetDay();
	AI_Output(other,self,"DIA_Lutero_MissBrendiDo_01_00");	//Я насчет Бенчела...
	AI_Output(self,other,"DIA_Lutero_MissBrendiDo_01_01");	//Да? (оживленно) Есть новости?
	if(Npc_HasItems(hero,itmi_blackbrendi) >= 5)
	{
		paynow = paynow + 1;
		AI_Output(other,self,"DIA_Lutero_MissBrendiDo_01_02");	//Для начала вот - твой бренди.
		B_GiveInvItems(other,self,itmi_blackbrendi,5);
		Npc_RemoveInvItems(self,itmi_blackbrendi,5);
		AI_Output(other,self,"DIA_Lutero_MissBrendiDo_01_03");	//Пять бутылок, как ты и просил.
		MIS_BLACKBRENDI = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_BLACKBRENDI,LOG_SUCCESS);
		if((BLACKBRENDITIMER >= daynow) || ((BLACKBRENDITIMER == (daynow - 1)) && Wld_IsTime(0,1,12,0)))
		{
			paynow = paynow + 1;
			TRADEGUILDREP = TRADEGUILDREP + 1;
			AI_Output(self,other,"DIA_Lutero_MissBrendiDo_01_04");	//Отлично - как раз вовремя. Покупатель здесь будет с минуты на минуту.
			AI_Output(self,other,"DIA_Lutero_MissBrendiDo_01_05");	//Это будет просто отличнейшая сделка. Ты хорошо потрудился.
			B_GiveInvItems(self,other,ItMi_Gold,500);
			AI_Output(other,self,"DIA_Lutero_MissBrendiDo_01_06");	//Спасибо. Теперь насчет того, что касается Бенчела...
			AI_Output(self,other,"DIA_Lutero_MissBrendiDo_01_07");	//Да, кстати, где он?
			B_LogEntry(TOPIC_BLACKBRENDI,"Я принес Лютеро черный бренди в назначенный срок, что очень обрадовало Лютеро.");
		}
		else
		{
			AI_Output(self,other,"DIA_Lutero_MissBrendiDo_01_08");	//Что ж, это совсем неплохо, конечно. Правда, к сожалению, ты опоздал с его доставкой...(печально)
			AI_Output(self,other,"DIA_Lutero_MissBrendiDo_01_09");	//У меня уже побывал покупатель и я, как ты понимаешь, попал в совсем неловкое положение.
			AI_Output(self,other,"DIA_Lutero_MissBrendiDo_01_11");	//И мне придется сделать ему приличную скидку, а иначе этой сделке не бывать.
			AI_Output(self,other,"DIA_Lutero_MissBrendiDo_01_13");	//Ты не особо торопился...(задумчиво) Что-нибудь еще?
			AI_Output(other,self,"DIA_Lutero_MissBrendiDo_01_14");	//Теперь насчет того, что касается Бенчела...
			AI_Output(self,other,"DIA_Lutero_MissBrendiDo_01_15");	//Да, кстати, где он?
			B_LogEntry(TOPIC_BLACKBRENDI,"Я принес Лютеро черный бренди, хоть и с опозданием, чем Лютеро был немного расстроен.");
		};
		if(BENCHELISDEAD == TRUE)
		{
			AI_Output(other,self,"DIA_Lutero_MissBrendiDo_01_16");	//Он мертв.
			AI_Output(self,other,"DIA_Lutero_MissBrendiDo_01_19");	//Кххх... М-да, ты принес совсем плохие новости.
			AI_Output(self,other,"DIA_Lutero_MissBrendiDo_01_20");	//Бенчел был непросто моим посыльным - он был моим помощником.
			AI_Output(other,self,"DIA_Lutero_MissBrendiDo_01_22");	//Мне очень жаль.
			AI_Output(self,other,"DIA_Lutero_MissBrendiDo_01_24");	//Теперь мне даже и представить трудно, как я буду обходиться без его помощи.
			AI_Output(self,other,"DIA_Lutero_MissBrendiDo_01_25");	//Эх, ладно! Теперь уж ничего не поделаешь - придется поискать кого-нибудь другого.
			paynow = paynow + 1;
			Log_AddEntry(TOPIC_BLACKBRENDI,"Я также сообщил ему о смерти его посыльного - Бенчела. Теперь Лютеро придется искать себе нового помощника.");
		}
		else
		{
			AI_Output(other,self,"DIA_Lutero_MissBrendiDo_01_27");	//Парень сейчас накачивает себя пивом в ближайшей таверне.
			AI_Output(self,other,"DIA_Lutero_MissBrendiDo_01_28");	//ЧТО?!  Так этот мерзавец прохлаждался все это время, вместо того чтобы выполнять свою работу?!
			AI_Output(self,other,"DIA_Lutero_MissBrendiDo_01_29");	//Ну, пусть только теперь попробует ко мне заявиться - я его поучу уму разуму! (гневно)
			AI_Output(other,self,"DIA_Lutero_MissBrendiDo_01_30");	//Подожди, он не виноват!
			AI_Output(other,self,"DIA_Lutero_MissBrendiDo_01_32");	//Он сделал все, как ты и велел, но...
			AI_Output(other,self,"DIA_Lutero_MissBrendiDo_01_33");	//...когда он уже возвращался к тебе с твоим бренди - неподалеку от города на него напали бандиты.
			AI_Output(other,self,"DIA_Lutero_MissBrendiDo_01_34");	//И он просто чудом смог избежать гибели!
			AI_Output(self,other,"DIA_Lutero_MissBrendiDo_01_35");	//Хммм, правда? (задумчиво) Что же, тогда это несколько меняет суть дела.
			AI_Output(other,self,"DIA_Lutero_MissBrendiDo_01_41");	//Вот-вот. Так что нет ничего плохого в том, если парень немного расслабится и успокоится.
			AI_Output(self,other,"DIA_Lutero_MissBrendiDo_01_42");	//Согласен... Я был не прав по отношению к нему.
			AI_Output(self,other,"DIA_Lutero_MissBrendiDo_01_43");	//Пусть отдохнет пару дней, ну а после этого вновь примется за работу.
			AI_Output(other,self,"DIA_Lutero_MissBrendiDo_01_44");	//Боюсь, он не вернется.
			AI_Output(other,self,"DIA_Lutero_MissBrendiDo_01_46");	//После всего случившегося, Бенчел решил завязать с работой посыльного.
			AI_Output(self,other,"DIA_Lutero_MissBrendiDo_01_48");	//М-да, этого я никак не ожидал. Его решение очень сильно огорчило меня.
			AI_Output(self,other,"DIA_Lutero_MissBrendiDo_01_50");	//Людей-то много, но только Бенчел был не просто моим посыльным - он был моим помощником.
			AI_Output(self,other,"DIA_Lutero_MissBrendiDo_01_51");	//Да и к тому же отлично разбирался в торговле.
			AI_Output(self,other,"DIA_Lutero_MissBrendiDo_01_58");	//Эх, ладно! Теперь уж ничего не поделаешь - придется поискать кого-нибудь другого.
			Log_AddEntry(TOPIC_BLACKBRENDI,"Я также сообщил ему о решении Бенчела оставить эту работу. Теперь Лютеро придется искать себе нового помощника.");
			paynow = paynow + 2;
		};
		solnow = 150 * paynow;
		B_GivePlayerXP(solnow);
	}
	else
	{
		AI_Output(other,self,"DIA_Lutero_MissBrendiDo_01_59");	//Пока нет.
		AI_Output(self,other,"DIA_Lutero_MissBrendiDo_01_60");	//Очень жаль...(печально) Дай мне знать, если что-то станет известным.
	};
};


instance DIA_LUTERO_TRADEHELPER(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = dia_lutero_tradehelper_condition;
	information = dia_lutero_tradehelper_info;
	permanent = FALSE;
	description = "Ты выглядишь совсем озадаченным.";
};


func int dia_lutero_tradehelper_condition()
{
	if((MIS_BLACKBRENDI == LOG_SUCCESS) && (Kapitel >= 3))
	{
		return TRUE;
	};
};

func void dia_lutero_tradehelper_info()
{
	AI_Output(other,self,"DIA_Lutero_TradeHelper_01_00");	//Ты выглядишь совсем озадаченным.
	AI_Output(self,other,"DIA_Lutero_TradeHelper_01_01");	//Да? (задумчиво) Хммм. Хотя, возможно, ты прав.
	AI_Output(self,other,"DIA_Lutero_TradeHelper_01_03");	//Эх... Теперь, когда Бенчел отказался работать на меня - я один просто не справляюсь с таким объемом работы!
	AI_Output(self,other,"DIA_Lutero_TradeHelper_01_07");	//Да и где мне искать такого человека, который хотя бы немного разбирался в нашем деле.
	AI_Output(other,self,"DIA_Lutero_TradeHelper_01_09");	//Может я смогу помочь тебе?
	AI_Output(self,other,"DIA_Lutero_TradeHelper_01_10");	//Ты? Хммм...(задумчиво) Ну да, ты бы вполне мог помочь мне в этом деле.
	AI_Output(self,other,"DIA_Lutero_TradeHelper_01_11");	//Постарайся найти замену Бенчелу. И пусть это будет достойная замена.
	MIS_TRADEHELPER = LOG_Running;
	Log_CreateTopic(TOPIC_TRADEHELPER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TRADEHELPER,LOG_Running);
	B_LogEntry(TOPIC_TRADEHELPER,"Лютеро ищет человека, который помог бы ему вести торговые дела. Я должен подыскать для Лютеро подходящего кандидата.");
};

var int LuteroDealNow;

instance DIA_LUTERO_TRADEHELPERDONE(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = dia_lutero_tradehelperdone_condition;
	information = dia_lutero_tradehelperdone_info;
	permanent = FALSE;
	description = "Я нашел для тебя человека.";
};

func int dia_lutero_tradehelperdone_condition()
{
	if((MIS_TRADEHELPER == LOG_Running) && ((FINDPERSONONE == TRUE) || (FINDPERSONTWO == TRUE) || (FINDPERSONTHREE == TRUE)))
	{
		return TRUE;
	};
};

func void dia_lutero_tradehelperdone_info()
{
	var C_Npc helperlutero;
	AI_Output(other,self,"DIA_Lutero_TradeHelperDone_01_00");	//Я нашел для тебя человека.
	AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_01");	//Да? (с интересом) И кто же он?

	if(FINDPERSONONE == TRUE)
	{
		B_GivePlayerXP(50);
		GAYVERNNOTHIRED = TRUE;

		if(TRADEGUILDREP > 0)
		{
			TRADEGUILDREP = TRADEGUILDREP - 1;
		};

		MIS_TRADEHELPER = LOG_FAILED;
		B_LogEntry_Failed(TOPIC_TRADEHELPER);
		helperlutero = Hlp_GetNpc(vlk_6132_gayvern);
		helperlutero.aivar[AIV_PARTYMEMBER] = FALSE;
		AI_GotoNpc(helperlutero,self);
		AI_TurnToNPC(helperlutero,self);
		AI_Output(other,self,"DIA_Lutero_TradeHelperDone_01_02");	//Он прямо перед тобой. Познакомься, его зовут Гэйверн.
		AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_03");	//Хммм...(внимательно вглядывается) Ну, хорошо. И что же он умеет делать?
		AI_Output(other,self,"DIA_Lutero_TradeHelperDone_01_04");	//А что он должен уметь?
		AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_05");	//Ну, для начала он хотя бы должен уметь писать и читать.
		AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_06");	//Или как, по-твоему, он собирается вести учетную книгу закупок или те же платежные ведомости?
		AI_Output(other,self,"DIA_Lutero_TradeHelperDone_01_07");	//Нет, этого он не умеет. Но зато этот парень очень крепкий.
		AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_09");	//Если мне понадобятся обыкновенные грузчики или вышибалы - я найму их в портовом квартале.
		AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_11");	//А мне нужен человек, который хотя бы немного разбирается в торговле!
		AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_15");	//Этот человек абсолютно не годится для той работы, которую я хотел бы ему поручить.
		AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_16");	//Таким, как он самое место в порту работать чернорабочим, а не обращаться с торговыми бумагами или распоряжаться складом.
		AI_Output(other,self,"DIA_Lutero_TradeHelperDone_01_17");	//Значит, он тебе не подходит?
		AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_18");	//Нет! Извини меня, но то что ты мне предлагаешь, меня не устраивает.
		AI_Output(other,self,"DIA_Lutero_TradeHelperDone_01_19");	//Может, мне стоит поискать для тебя кого-нибудь еще?
		AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_20");	//Не стоит. Так что лучше забудь о моей просьбе.
		AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_21");	//Я сам займусь этим вопросом и постараюсь подыскать себе нового помощника.

		if((SARAISDEAD == TRUE) || ((SARAFLEE == FALSE) && (Sarah_Ausgeliefert == FALSE)))
		{
			AI_Output(other,self,"DIA_Lutero_TradeHelperDone_01_57");	//Для меня будут еще поручения?
			AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_58");	//(задумчиво) В ближайшее время - вряд ли. Так что можешь заняться другими делами.
			AI_Output(other,self,"DIA_Lutero_TradeHelperDone_01_59");	//Хорошо, как скажешь.
			NEXTQUESTSARAHTOGUILD = TRUE;
			MIS_TRADEGUILD = LOG_SUCCESS;
			Log_SetTopicStatus(TOPIC_TRADEGUILD,LOG_SUCCESS);
			AI_StopProcessInfos(self);
			B_StartOtherRoutine(vlk_6132_gayvern,"BackToDrink");
		}
		else
		{
			if((NEXTQUESTSARAHTOGUILD == FALSE) && (Kapitel >= 4) && ((MIS_TRADEHELPER == LOG_SUCCESS) || (MIS_TRADEHELPER == LOG_FAILED)))
			{
				if((SARAISDEAD == FALSE) && ((SARAFLEE == TRUE) || (Sarah_Ausgeliefert == TRUE)))
				{
					LuteroDealNow = TRUE;
					AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_22");	//А сейчас давай обсудим еще одно важное дело.
					Info_ClearChoices(dia_lutero_tradehelperdone);
					Info_AddChoice(dia_lutero_tradehelperdone,"Хорошо, давай обсудим.",dia_lutero_tradehelperdone_gayvernaway);
				}
				else
				{
					AI_Output(other,self,"DIA_Lutero_TradeHelperDone_01_57");	//Для меня будут еще поручения?
					AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_58");	//(задумчиво) В ближайшее время - вряд ли. Можешь заняться другими делами.
					AI_Output(other,self,"DIA_Lutero_TradeHelperDone_01_59");	//Хорошо, как скажешь.
					NEXTQUESTSARAHTOGUILD = TRUE;
					MIS_TRADEGUILD = LOG_SUCCESS;
					Log_SetTopicStatus(TOPIC_TRADEGUILD,LOG_SUCCESS);
					AI_StopProcessInfos(self);
					B_StartOtherRoutine(vlk_6132_gayvern,"BackToDrink");
				};
			}
			else
			{
				AI_Output(other,self,"DIA_Lutero_TradeHelperDone_01_57");	//Для меня будут еще поручения?
				AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_58");	//(задумчиво) В ближайшее время - вряд ли. Так что можешь заняться другими делами.
				AI_Output(other,self,"DIA_Lutero_TradeHelperDone_01_59");	//Хорошо, как скажешь.
				NEXTQUESTSARAHTOGUILD = TRUE;
				MIS_TRADEGUILD = LOG_SUCCESS;
				Log_SetTopicStatus(TOPIC_TRADEGUILD,LOG_SUCCESS);
				AI_StopProcessInfos(self);
				B_StartOtherRoutine(vlk_6132_gayvern,"BackToDrink");
			};
		};
	}
	else if(FINDPERSONTWO == TRUE)
	{
		B_GivePlayerXP(250);
		MAXIHIRED = TRUE;
		TRADEGUILDREP = TRADEGUILDREP + 1;
		MIS_TRADEHELPER = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_TRADEHELPER,LOG_SUCCESS);
		B_LogEntry(TOPIC_TRADEHELPER,"Лютеро согласился взять к себе в помощники человека, которого я привел к нему, хоть он и не произвел на него особого впечатления.");
		helperlutero = Hlp_GetNpc(vlk_6133_maxi);
		helperlutero.aivar[AIV_PARTYMEMBER] = FALSE;
		AI_GotoNpc(helperlutero,self);
		AI_TurnToNPC(helperlutero,self);
		AI_Output(other,self,"DIA_Lutero_TradeHelperDone_01_23");	//Вот - он прямо перед тобой. Познакомься, его зовут Макси.
		AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_24");	//Хммм...(внимательно вглядывается) Ну, хорошо. И что же он умеет делать?
		AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_25");	//Ну, для начала он хотя бы должен уметь писать и читать.
		AI_Output(other,self,"DIA_Lutero_TradeHelperDone_01_26");	//Судя по всему, немного умеет. Парень раньше работал на одного торговца - был у него посыльным и выполнял некоторые мелкие поручения.
		AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_27");	//Хммм...(задумчиво) Что же, для начала неплохо.
		AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_28");	//Хотя, конечно, я рассчитывал на то, что ты найдешь мне человека более сведущего в торговле.
		AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_29");	//Но в конце концов, всему можно научиться, а главное, что он хотя бы с виду не выглядит совсем непроходимым тупицей.
		AI_Output(other,self,"DIA_Lutero_TradeHelperDone_01_30");	//Так значит, он тебе подходит?
		AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_31");	//Хммм...(задумчиво) Хорошо, я беру его к себе на работу. И надеюсь, я не пожалею о своем решении.
		AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_34");	//Вот, возьми эти деньги в качестве награды за оказанную мне услугу.
		AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_35");	//Думаю, этого вполне должно хватить, чтобы компенсировать твои хлопоты.
		B_GiveInvItems(self,other,ItMi_Gold,500);

		if((SARAISDEAD == TRUE) || ((SARAFLEE == FALSE) && (Sarah_Ausgeliefert == FALSE)))
		{
			AI_Output(other,self,"DIA_Lutero_TradeHelperDone_01_60");	//Благодарю! Для меня еще будут поручения?
			AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_61");	//Хммм...(задумчиво ) В ближайшее время, навряд ли! Так что, можешь заняться другими делами.
			AI_Output(other,self,"DIA_Lutero_TradeHelperDone_01_62");	//Хорошо, как скажешь.
			NEXTQUESTSARAHTOGUILD = TRUE;
			MIS_TRADEGUILD = LOG_SUCCESS;
			Log_SetTopicStatus(TOPIC_TRADEGUILD,LOG_SUCCESS);
			AI_StopProcessInfos(self);
			B_StartOtherRoutine(vlk_6133_maxi,"WorkAgain");
		}
		else
		{
			if((NEXTQUESTSARAHTOGUILD == FALSE) && (Kapitel >= 4) && ((MIS_TRADEHELPER == LOG_SUCCESS) || (MIS_TRADEHELPER == LOG_FAILED)))
			{
				if((SARAISDEAD == FALSE) && ((SARAFLEE == TRUE) || (Sarah_Ausgeliefert == TRUE)))
				{
					LuteroDealNow = TRUE;
					AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_37");	//А теперь давай обсудим еще одно важное дело. Оно не терпит отлагательств!
					Info_ClearChoices(dia_lutero_tradehelperdone);
					Info_AddChoice(dia_lutero_tradehelperdone,"Хорошо, давай обсудим.",dia_lutero_tradehelperdone_maxiaway);
				}
				else
				{
					AI_Output(other,self,"DIA_Lutero_TradeHelperDone_01_60");	//Благодарю. Для меня еще будут поручения?
					AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_61");	//(задумчиво) В ближайшее время - вряд ли. Так что можешь заняться другими делами.
					AI_Output(other,self,"DIA_Lutero_TradeHelperDone_01_62");	//Хорошо, как скажешь.
					NEXTQUESTSARAHTOGUILD = TRUE;
					MIS_TRADEGUILD = LOG_SUCCESS;
					Log_SetTopicStatus(TOPIC_TRADEGUILD,LOG_SUCCESS);
					AI_StopProcessInfos(self);
					B_StartOtherRoutine(vlk_6133_maxi,"WorkAgain");
				};
			}
			else
			{
				AI_Output(other,self,"DIA_Lutero_TradeHelperDone_01_60");	//Благодарю. Для меня еще будут поручения?
				AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_61");	//(задумчиво) В ближайшее время - вряд ли. Можешь заняться другими делами.
				AI_Output(other,self,"DIA_Lutero_TradeHelperDone_01_62");	//Хорошо, как скажешь.
				NEXTQUESTSARAHTOGUILD = TRUE;
				MIS_TRADEGUILD = LOG_SUCCESS;
				Log_SetTopicStatus(TOPIC_TRADEGUILD,LOG_SUCCESS);
				AI_StopProcessInfos(self);
				B_StartOtherRoutine(vlk_6133_maxi,"WorkAgain");
			};
		};
	}
	else if(FINDPERSONTHREE == TRUE)
	{
		B_GivePlayerXP(500);
		VALERANHIRED = TRUE;
		TRADEGUILDREP = TRADEGUILDREP + 2;
		MIS_TRADEHELPER = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_TRADEHELPER,LOG_SUCCESS);
		B_LogEntry(TOPIC_TRADEHELPER,"Лютеро очень понравилась предложенная мной кандидатура на место его помощника.");
		helperlutero = Hlp_GetNpc(vlk_6134_valeran);
		helperlutero.aivar[AIV_PARTYMEMBER] = FALSE;
		AI_GotoNpc(helperlutero,self);
		AI_TurnToNPC(helperlutero,self);
		AI_Output(other,self,"DIA_Lutero_TradeHelperDone_01_38");	//Вот - он прямо перед тобой. Познакомься, его зовут Валеран.
		AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_39");	//Валеран? Хммм...(задумчиво) Постой!
		AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_40");	//Не тот ли это Валеран, который раньше работал у торговца Фернандо?
		AI_Output(other,self,"DIA_Lutero_TradeHelperDone_01_41");	//Тот самый. Теперь, когда Фернандо за решеткой - он ищет себе новую работу.
		AI_Output(other,self,"DIA_Lutero_TradeHelperDone_01_42");	//Вот я и подумал, что его услуги вполне бы могли тебе заинтересовать.
		AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_43");	//Ты поступил очень верно, приведя его ко мне.
		AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_44");	//Я знаю Валерана - он очень умен и отлично разбирается в нашем деле.
		AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_45");	//И я всегда мечтал иметь такого помощника!
		AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_46");	//Я даже предлагал ему перейти работать ко мне, но тогда он отказался - посчитал, что это будет не слишком красиво с его стороны.
		AI_Output(other,self,"DIA_Lutero_TradeHelperDone_01_49");	//Так значит, он тебе подходит?
		AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_50");	//Безусловно! (радостно) Ты сделал максимум того, что мог бы сделать.
		AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_51");	//И я не останусь перед тобой в долгу.
		AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_52");	//Вот, возьми эти деньги в качестве награды за оказанную мне услугу.
		AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_53");	//Думаю, этого вполне должно хватить, чтобы компенсировать твои хлопоты.
		B_GiveInvItems(self,other,ItMi_Gold,1000);

		if((SARAISDEAD == TRUE) || ((SARAFLEE == FALSE) && (Sarah_Ausgeliefert == FALSE)))
		{
			AI_Output(other,self,"DIA_Lutero_TradeHelperDone_01_63");	//Благодарю! Для меня еще будут поручения?
			AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_64");	//Хммм...(задумчиво) В ближайшее время навряд ли. Так что можешь заняться другими делами.
			AI_Output(other,self,"DIA_Lutero_TradeHelperDone_01_65");	//Хорошо, как скажешь.
			NEXTQUESTSARAHTOGUILD = TRUE;
			MIS_TRADEGUILD = LOG_SUCCESS;
			Log_SetTopicStatus(TOPIC_TRADEGUILD,LOG_SUCCESS);
			AI_StopProcessInfos(self);
			B_StartOtherRoutine(vlk_6134_valeran,"WorkAgain");
		}
		else
		{
			if((NEXTQUESTSARAHTOGUILD == FALSE) && (Kapitel >= 4) && ((MIS_TRADEHELPER == LOG_SUCCESS) || (MIS_TRADEHELPER == LOG_FAILED)))
			{
				if((SARAISDEAD == FALSE) && ((SARAFLEE == TRUE) || (Sarah_Ausgeliefert == TRUE)))
				{
					LuteroDealNow = TRUE;
					AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_56");	//И как раз вовремя, поскольку мне необходимо обсудить с тобой одно очень важное дельце, требующее большого внимания.
					Info_ClearChoices(dia_lutero_tradehelperdone);
					Info_AddChoice(dia_lutero_tradehelperdone,"Хорошо, как скажешь.",dia_lutero_tradehelperdone_valeranaway);
				}
				else
				{
					AI_Output(other,self,"DIA_Lutero_TradeHelperDone_01_63");	//Благодарю. Для меня еще будут поручения?
					AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_64");	//(задумчиво) В ближайшее время - вряд ли. Так что можешь заняться другими делами.
					AI_Output(other,self,"DIA_Lutero_TradeHelperDone_01_65");	//Хорошо, как скажешь.
					NEXTQUESTSARAHTOGUILD = TRUE;
					MIS_TRADEGUILD = LOG_SUCCESS;
					Log_SetTopicStatus(TOPIC_TRADEGUILD,LOG_SUCCESS);
					AI_StopProcessInfos(self);
					B_StartOtherRoutine(vlk_6134_valeran,"WorkAgain");
				};
			}
			else
			{
				AI_Output(other,self,"DIA_Lutero_TradeHelperDone_01_63");	//Благодарю. Для меня еще будут поручения?
				AI_Output(self,other,"DIA_Lutero_TradeHelperDone_01_64");	//(задумчиво) В ближайшее время - вряд ли. Так что можешь заняться другими делами.
				AI_Output(other,self,"DIA_Lutero_TradeHelperDone_01_65");	//Хорошо, как скажешь.
				NEXTQUESTSARAHTOGUILD = TRUE;
				MIS_TRADEGUILD = LOG_SUCCESS;
				Log_SetTopicStatus(TOPIC_TRADEGUILD,LOG_SUCCESS);
				AI_StopProcessInfos(self);
				B_StartOtherRoutine(vlk_6134_valeran,"WorkAgain");
			};
		};
	};
};

func void dia_lutero_tradehelperdone_gayvernaway()
{
	AI_Output(other,self,"DIA_Lutero_TradeHelperDone_GayvernAway_01_01");	//Хорошо, давай обсудим.
	B_StartOtherRoutine(vlk_6132_gayvern,"BackToDrink");
};

func void dia_lutero_tradehelperdone_maxiaway()
{
	AI_Output(other,self,"DIA_Lutero_TradeHelperDone_MaxiAway_01_01");	//Хорошо, давай обсудим.
	B_StartOtherRoutine(vlk_6133_maxi,"WorkAgain");
};

func void dia_lutero_tradehelperdone_valeranaway()
{
	AI_Output(other,self,"DIA_Lutero_TradeHelperDone_ValeranAway_01_01");	//Хорошо, как скажешь.
	B_StartOtherRoutine(vlk_6134_valeran,"WorkAgain");
};

instance DIA_LUTERO_SARAHTOGUILD(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = dia_lutero_sarahtoguild_condition;
	information = dia_lutero_sarahtoguild_info;
	permanent = FALSE;
	description = "Что за дело?";
};

func int dia_lutero_sarahtoguild_condition()
{
	if((NEXTQUESTSARAHTOGUILD == FALSE) && (Kapitel >= 4) && ((MIS_TRADEHELPER == LOG_SUCCESS) || (MIS_TRADEHELPER == LOG_FAILED)))
	{
		if((SARAISDEAD == FALSE) && ((SARAFLEE == TRUE) || (Sarah_Ausgeliefert == TRUE)))
		{
			if(LuteroDealNow == TRUE) 
			{
				return TRUE;
			};
		};
	};
};

func void dia_lutero_sarahtoguild_info()
{
	AI_Output(other,self,"DIA_Lutero_SarahToGuild_01_00");	//Что за дело?
	AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_01");	//Дело очень щекотливое и требует предельной аккуратности.
	AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_02");	//Я бы даже сказал - особой тактичности.
	AI_Output(other,self,"DIA_Lutero_SarahToGuild_01_03");	//Что случилось?
	AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_04");	//Скажи, ты встречал на рыночной площади торговку по имени Сара?
	AI_Output(other,self,"DIA_Lutero_SarahToGuild_01_05");	//Да, я ее знаю.
	AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_06");	//Хорошо. Тогда тебе должно быть известно, что недавно она угодила в одну очень неприятную историю.

	if(Sarah_Ausgeliefert == TRUE)
	{
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_07");	//И кстати, некоторые злые языки поговаривают, что именно по твоей вине...(ехидно)
		AI_Output(other,self,"DIA_Lutero_SarahToGuild_01_08");	//А что с ней произошло?
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_09");	//Она обвиняется в том, что продавала оружие людям Онара. Хотя я с трудом в это верю.
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_10");	//Я хорошо знаю Сару и не думаю, что она способна на такое.
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_13");	//Сейчас ополчение держит ее за решеткой - согласись, не самое лучшее место для молодой девушки.
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_14");	//Так вот, я хочу помочь ей. И не просто помочь, а попробовать в корне исправить всю ту ситуацию, в которой она очутилась.
		AI_Output(other,self,"DIA_Lutero_SarahToGuild_01_15");	//А что именно ты хочешь для нее сделать?
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_16");	//Для начала необходимо восстановить ее честное имя - иначе, без этого на карьере торговца можно сразу поставить крест.
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_17");	//Ну а потом, я хочу предложить ей работу в нашей гильдии.
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_18");	//У Сары несомненный талант на поприще торговли, и я хочу, чтобы он приносил пользу не только ей...(ехидно)
		AI_Output(other,self,"DIA_Lutero_SarahToGuild_01_19");	//Да, ты я вижу, своего не упустишь!
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_20");	//Ты правильно меня понял...(смеется) Однако это не значит, что я действую исключительно в корыстных целях.
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_21");	//Я действительно хочу помочь ей, но при этом не забываю и о своей выгоде.
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_23");	//Мне кажется, ты именно тот человек, который мог бы заняться всем этим.
		AI_Output(other,self,"DIA_Lutero_SarahToGuild_01_24");	//Почему я?
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_25");	//Потому что, если начну действовать я - это привлечет слишком много внимания к моей персоне.
		AI_Output(other,self,"DIA_Lutero_SarahToGuild_01_28");	//Хорошо. С чего мне начать?
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_29");	//Прежде всего тебе необходимо вытащить Сару из тюрьмы.
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_33");	//Насколько мне известно, за любого заключенного можно заплатить штраф и тем самым снять с него некоторые обвинения.
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_34");	//И чем больше эта сумма - тем проще договориться с лордом Андрэ.
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_37");	//Так вот - как ты сам понимаешь, Сара девушка небогатая и у нее нет таких больших денег. А свобода стоит очень дорого!
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_38");	//Нам такие расходы вполне по силам.
		AI_Output(other,self,"DIA_Lutero_SarahToGuild_01_39");	//Нам - это тебе и мне?
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_40");	//Да, ты, как член гильдии, тоже ведь должен быть заинтересован в этом деле.
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_42");	//Вот, возьми эти пять сотен монет. Это мой вклад в данное мероприятие. Остальное за тобой.
		B_GiveInvItems(self,other,ItMi_Gold,500);
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_43");	//Думаю, что лорд Андрэ не назначит слишком большой штраф за голову простой торговки.
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_47");	//После того, как Сара выйдет из тюрьмы - попробуй поговорить с ней.
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_48");	//Постарайся ее убедить в том, что работа в нашей гильдии - это самое лучшее, что она сможет найти в этом городе после всего случившегося.
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_52");	//Я буду ждать от тебя новостей.
		SARAHELPYOUANDFREE = TRUE;
		MIS_SARAHTOGUILD = LOG_Running;
		Log_CreateTopic(TOPIC_SARAHTOGUILD,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_SARAHTOGUILD,LOG_Running);
		B_LogEntry(TOPIC_SARAHTOGUILD,"Лютеро хочет помочь одной девушке - торговке Саре. Недавно с ней приключилась неприятная история и ее отправили в тюрьму. Кстати, по моей вине! Теперь я должен отправиться к лорду Андрэ и заплатить штраф за ее освобождение, а потом попытаться уговорить Сару вступить в гильдию торговцев, поскольку Лютеро считает, что она - хорошее подспорье для его бизнеса.");
	}
	else if(SARAFLEE == TRUE)
	{
		AI_Output(other,self,"DIA_Lutero_SarahToGuild_01_55");	//Что с ней случилось?
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_56");	//Я слышал, один торговец по имени Кантар угрожал ей расправой, если она не уступит ему свое место на торговой площади.
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_57");	//Бедная девушка просто в ужасе, и теперь она просто боится ходить туда торговать.
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_58");	//Я знаю этого Кантара - это еще тот мерзавец!
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_59");	//Но у него в этом городе есть очень могучие покровители. А у Сары их нет.
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_60");	//Поэтому он и позволял себе слишком много.

		if(Npc_IsDead(Canthar) == TRUE)
		{
			AI_Output(other,self,"DIA_Lutero_SarahToGuild_01_61");	//Уже нет. Недавно кто-то убил его.
			AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_62");	//Да? Ну что ж - поделом ему.
			AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_63");	//Однако это не меняет сути дела. В городе еще много подонков, которые не хотят вести честную игру.
		};

		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_65");	//В общем, я хочу помочь Саре.
		AI_Output(other,self,"DIA_Lutero_SarahToGuild_01_66");	//Каким образом?
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_67");	//Я хочу предложить ей работу в нашей гильдии и, тем самым, защиту от всяких посягательств разного рода мерзавцев вроде Кантара.
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_69");	//У Сары несомненный талант на поприще торговли, и я хочу, чтобы он приносил пользу не только ей...(ехидно)
		AI_Output(other,self,"DIA_Lutero_SarahToGuild_01_70");	//Да, ты, я вижу, своего не упустишь.
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_72");	//Я действительно хочу помочь ей, но при этом не забываю и о своей выгоде.
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_80");	//Найди Сару и попробуй поговорить с ней.
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_81");	//Постарайся ее убедить в том, что работа в нашей гильдии - это самое лучшее, что она сможет найти в этом городе после всего случившегося.
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_85");	//Я буду ждать от тебя новостей.
		SARAHELPYOU = TRUE;
		MIS_SARAHTOGUILD = LOG_Running;
		Log_CreateTopic(TOPIC_SARAHTOGUILD,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_SARAHTOGUILD,LOG_Running);
		B_LogEntry(TOPIC_SARAHTOGUILD,"Лютеро хочет помочь одной девушке - торговке Саре. Недавно с ней приключилась неприятная история - торговец Кантар угрожал ей расправой, если она не уступит ему свое торговое место на рыночной площади. Лютеро хочет взять бизнес Сары под свою опеку, чтобы помочь ей избежать подобных ситуаций в дальнейшем. Для этого мне необходимо найти Сару и уговорить ее вступить в гильдию торговцев, поскольку Лютеро считает, что она хорошее подспорье для его бизнеса.");
	};
};

instance DIA_LUTERO_SARAHTOGUILD_EX(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = dia_lutero_sarahtoguild_EX_condition;
	information = dia_lutero_sarahtoguild_EX_info;
	permanent = FALSE;
	description = "У тебя есть еще поручения для меня?";
};

func int dia_lutero_sarahtoguild_EX_condition()
{
	if((NEXTQUESTSARAHTOGUILD == FALSE) && (Kapitel >= 4) && ((MIS_TRADEHELPER == LOG_SUCCESS) || (MIS_TRADEHELPER == LOG_FAILED)))
	{
		if((SARAISDEAD == FALSE) && ((SARAFLEE == TRUE) || (Sarah_Ausgeliefert == TRUE)))
		{
			if(LuteroDealNow == FALSE) 
			{
				return TRUE;
			};
		};
	};
};

func void dia_lutero_sarahtoguild_EX_info()
{
	AI_Output(other,self,"DIA_Lutero_JoraHelp_01_00");	//У тебя есть еще поручения для меня?
	AI_Output(self,other,"DIA_Lutero_ChurchDeal_01_00");	//Хорошо, что ты пришел! Я ждал тебя.
	AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_01");	//Дело очень щекотливое и требует предельной аккуратности.
	AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_02");	//Я бы даже сказал - особой тактичности.
	AI_Output(other,self,"DIA_Lutero_SarahToGuild_01_03");	//Что случилось?
	AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_04");	//Скажи, ты встречал на рыночной площади торговку по имени Сара?
	AI_Output(other,self,"DIA_Lutero_SarahToGuild_01_05");	//Да, я ее знаю.
	AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_06");	//Хорошо. Тогда тебе должно быть известно, что недавно она угодила в одну очень неприятную историю.

	if(Sarah_Ausgeliefert == TRUE)
	{
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_07");	//И кстати, некоторые злые языки поговаривают, что именно по твоей вине...(ехидно)
		AI_Output(other,self,"DIA_Lutero_SarahToGuild_01_08");	//А что с ней произошло?
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_09");	//Она обвиняется в том, что продавала оружие людям Онара. Хотя я с трудом в это верю.
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_10");	//Я хорошо знаю Сару и не думаю, что она способна на такое.
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_13");	//Сейчас ополчение держит ее за решеткой - согласись, не самое лучшее место для молодой девушки.
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_14");	//Так вот, я хочу помочь ей. И не просто помочь, а попробовать в корне исправить всю ту ситуацию, в которой она очутилась.
		AI_Output(other,self,"DIA_Lutero_SarahToGuild_01_15");	//А что именно ты хочешь для нее сделать?
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_16");	//Для начала, необходимо восстановить ее честное имя - иначе, без этого на карьере торговца можно сразу поставить крест.
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_17");	//Ну а потом, я хочу предложить ей работу в нашей гильдии.
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_18");	//У Сары несомненный талант на поприще торговли, и я хочу, чтобы он приносил пользу не только ей...(ехидно)
		AI_Output(other,self,"DIA_Lutero_SarahToGuild_01_19");	//Да, ты я вижу, своего не упустишь!
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_20");	//Ты правильно меня понял...(смеется) Однако это не значит, что я действую исключительно в корыстных целях.
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_21");	//Я действительно хочу помочь ей, но при этом не забываю и о своей выгоде.
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_23");	//Мне кажется, ты именно тот человек, который мог бы заняться всем этим.
		AI_Output(other,self,"DIA_Lutero_SarahToGuild_01_24");	//Почему я?
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_25");	//Потому что, если начну действовать я - это привлечет слишком много внимания к моей персоне.
		AI_Output(other,self,"DIA_Lutero_SarahToGuild_01_28");	//Хорошо. С чего мне начать?
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_29");	//Прежде всего тебе необходимо вытащить Сару из тюрьмы.
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_33");	//Насколько мне известно, за любого заключенного можно заплатить штраф и тем самым снять с него некоторые обвинения.
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_34");	//И чем больше эта сумма - тем проще договориться с лордом Андрэ.
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_37");	//Так вот - как ты сам понимаешь, Сара девушка небогатая и у нее нет таких больших денег. А свобода стоит очень дорого!
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_38");	//Нам такие расходы вполне по силам.
		AI_Output(other,self,"DIA_Lutero_SarahToGuild_01_39");	//Нам - это тебе и мне?
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_40");	//Да, ты, как член гильдии, тоже ведь должен быть заинтересован в этом деле.
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_42");	//Вот, возьми эти пять сотен монет. Это мой вклад в данное мероприятие. Остальное за тобой.
		B_GiveInvItems(self,other,ItMi_Gold,500);
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_43");	//Думаю, что лорд Андрэ не назначит слишком большой штраф за голову простой торговки.
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_47");	//После того, как Сара выйдет из тюрьмы - попробуй поговорить с ней.
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_48");	//Постарайся ее убедить в том, что работа в нашей гильдии - это самое лучшее, что она сможет найти в этом городе после всего случившегося.
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_52");	//Я буду ждать от тебя новостей.
		SARAHELPYOUANDFREE = TRUE;
		MIS_SARAHTOGUILD = LOG_Running;
		Log_CreateTopic(TOPIC_SARAHTOGUILD,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_SARAHTOGUILD,LOG_Running);
		B_LogEntry(TOPIC_SARAHTOGUILD,"Лютеро хочет помочь одной девушке - торговке Саре. Недавно с ней приключилась неприятная история и ее отправили в тюрьму. Кстати, по моей вине! Теперь я должен отправиться к лорду Андрэ и заплатить штраф за ее освобождение, а потом попытаться уговорить Сару вступить в гильдию торговцев, поскольку Лютеро считает, что она - хорошее подспорье для его бизнеса.");
	}
	else if(SARAFLEE == TRUE)
	{
		AI_Output(other,self,"DIA_Lutero_SarahToGuild_01_55");	//Что с ней случилось?
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_56");	//Я слышал, один торговец по имени Кантар угрожал ей расправой, если она не уступит ему свое место на торговой площади.
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_57");	//Бедная девушка просто в ужасе, и теперь она просто боится ходить туда торговать.
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_58");	//Я знаю этого Кантара - это еще тот мерзавец!
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_59");	//Но у него в этом городе есть очень могучие покровители. А у Сары их нет.
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_60");	//Поэтому он и позволял себе слишком много.

		if(Npc_IsDead(Canthar) == TRUE)
		{
			AI_Output(other,self,"DIA_Lutero_SarahToGuild_01_61");	//Уже нет. Недавно кто-то убил его.
			AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_62");	//Да? Ну что ж - поделом ему.
			AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_63");	//Однако это не меняет сути дела. В городе еще много подонков, которые не хотят вести честную игру.
		};

		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_65");	//В общем, я хочу помочь Саре.
		AI_Output(other,self,"DIA_Lutero_SarahToGuild_01_66");	//Каким образом?
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_67");	//Я хочу предложить ей работу в нашей гильдии и, тем самым, защиту от всяких посягательств разного рода мерзавцев вроде Кантара.
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_69");	//У Сары несомненный талант на поприще торговли, и я хочу, чтобы он приносил пользу не только ей...(ехидно)
		AI_Output(other,self,"DIA_Lutero_SarahToGuild_01_70");	//Да, ты, я вижу, своего не упустишь.
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_72");	//Я действительно хочу помочь ей, но при этом не забываю и о своей выгоде.
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_80");	//Найди Сару и попробуй поговорить с ней.
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_81");	//Постарайся ее убедить в том, что работа в нашей гильдии - это самое лучшее, что она сможет найти в этом городе после всего случившегося.
		AI_Output(self,other,"DIA_Lutero_SarahToGuild_01_85");	//Я буду ждать от тебя новостей.
		SARAHELPYOU = TRUE;
		MIS_SARAHTOGUILD = LOG_Running;
		Log_CreateTopic(TOPIC_SARAHTOGUILD,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_SARAHTOGUILD,LOG_Running);
		B_LogEntry(TOPIC_SARAHTOGUILD,"Лютеро хочет помочь одной девушке - торговке Саре. Недавно с ней приключилась неприятная история - торговец Кантар угрожал ей расправой, если она не уступит ему свое торговое место на рыночной площади. Лютеро хочет взять бизнес Сары под свою опеку, чтобы помочь ей избежать подобных ситуаций в дальнейшем. Для этого мне необходимо найти Сару и уговорить ее вступить в гильдию торговцев, поскольку Лютеро считает, что она хорошее подспорье для его бизнеса.");
	};
};

instance DIA_LUTERO_SARAHTOGUILDDONE(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = dia_lutero_sarahtoguilddone_condition;
	information = dia_lutero_sarahtoguilddone_info;
	permanent = FALSE;
	description = "Я поговорил с Сарой.";
};

func int dia_lutero_sarahtoguilddone_condition()
{
	if((MIS_SARAHTOGUILD == LOG_Running) && ((SARAPISSOFF == TRUE) || (SARAREFUSEHELPS == TRUE) || (SARAAGREE == TRUE)))
	{
		return TRUE;
	};
};

func void dia_lutero_sarahtoguilddone_info()
{
	AI_Output(other,self,"DIA_Lutero_SarahToGuildDone_01_00");	//Я поговорил с Сарой.
	AI_Output(self,other,"DIA_Lutero_SarahToGuildDone_01_01");	//Да? И что она сказала?

	if((SARAPISSOFF == TRUE) || (SARAREFUSEHELPS == TRUE))
	{
		if(TRADEGUILDREP > 0)
		{
			TRADEGUILDREP = TRADEGUILDREP - 1;
		};
		NEXTQUESTSARAHTOGUILD = TRUE;
		MIS_SARAHTOGUILD = LOG_FAILED;
		B_LogEntry_Failed(TOPIC_SARAHTOGUILD);
		AI_Output(other,self,"DIA_Lutero_SarahToGuildDone_01_02");	//Ничего. Она была просто вне себя, когда я попытался к ней обратиться.
		AI_Output(self,other,"DIA_Lutero_SarahToGuildDone_01_03");	//Хммм... Интересно, почему же Сара так резко отреагировала на тебя?
		AI_Output(other,self,"DIA_Lutero_SarahToGuildDone_01_04");	//Она думает, что это я виноват в том, что с ней произошло.
		AI_Output(self,other,"DIA_Lutero_SarahToGuildDone_01_05");	//(ехидно) Теперь понятно.
		AI_Output(self,other,"DIA_Lutero_SarahToGuildDone_01_06");	//И знаешь, какое-то чувство мне подсказывает - что это именно так и было.
		AI_Output(other,self,"DIA_Lutero_SarahToGuildDone_01_07");	//Ну, если честно признаться - она немного права.
		AI_Output(self,other,"DIA_Lutero_SarahToGuildDone_01_08");	//Вот поэтому и неудивительно, что она не стала с тобой разговаривать.
		AI_Output(self,other,"DIA_Lutero_SarahToGuildDone_01_09");	//Я же тебе говорил, что в этом деле нужно будет проявить особый такт!
		AI_Output(other,self,"DIA_Lutero_SarahToGuildDone_01_11");	//Я сделал все, что смог.
		AI_Output(self,other,"DIA_Lutero_SarahToGuildDone_01_12");	//Эх, ладно. По крайней мере, мы хотя бы немного помогли ей и восстановили некоторую справедливость в этом деле.
		AI_Output(self,other,"DIA_Lutero_SarahToGuildDone_01_14");	//И может быть со временем, когда Сара немного успокоится и забудет старые обиды - я попробую поговорить с ней сам.
		AI_Output(self,other,"DIA_Lutero_SarahToGuildDone_01_15");	//Что же касается тебя - то постарайся больше не забивать этим свою голову. Есть дела и поважнее!
		AI_Output(other,self,"DIA_Lutero_SarahToGuildDone_01_16");	//Хорошо, как скажешь.

		if(TRADEGUILDREP >= 9)
		{
			AI_Output(self,other,"DIA_Lutero_SarahToGuildDone_01_25");	//Вот - возьми эти деньги и в довесок к ним еще эту небольшую вещицу.
			B_GiveInvItems(self,other,ItMi_Gold,500);
			AI_Output(self,other,"DIA_Lutero_SarahToGuildDone_01_26");	//Думаю ее вполне хватит, чтобы окупить все твои хлопоты, связанные с этим делом.
			B_GiveInvItems(self,other,itri_pilligrimring,1);
			AI_Output(other,self,"DIA_Lutero_SarahToGuildDone_01_27");	//Спасибо!
			AI_Output(self,other,"DIA_Lutero_SarahToGuildDone_01_28");	//Не стоит благодарностей - ты по праву заслужил эту честь!
			TRADEGUILDISOVERMASTER = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Lutero_SarahToGuildDone_01_30");	//Вот - возьми эти деньги.
			B_GiveInvItems(self,other,ItMi_Gold,500);
			AI_Output(self,other,"DIA_Lutero_SarahToGuildDone_01_31");	//Думаю их вполне хватит, чтобы окупить все твои хлопоты, связанные с этим делом.
			TRADEGUILDISOVER = TRUE;
			MIS_TRADEGUILD = LOG_SUCCESS;
			Log_SetTopicStatus(TOPIC_TRADEGUILD,LOG_SUCCESS);
		};
	}
	else if(SARAAGREE == TRUE)
	{
		B_GivePlayerXP(500);
		TRADEGUILDREP = TRADEGUILDREP + 1;
		NEXTQUESTSARAHTOGUILD = TRUE;
		SARAHELPYOUDONE = TRUE;
		MIS_SARAHTOGUILD = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_SARAHTOGUILD,LOG_SUCCESS);
		Npc_ExchangeRoutine(VLK_470_Sarah,"Trade");
		B_LogEntry(TOPIC_SARAHTOGUILD,"Лютеро был очень доволен тем, что мне удалось договориться с Сарой.");
		AI_Output(other,self,"DIA_Lutero_SarahToGuildDone_01_17");	//Она согласна с твоим предложением.
		AI_Output(self,other,"DIA_Lutero_SarahToGuildDone_01_18");	//Отлично! Именно это, я и рассчитывал услышать от тебя.
		AI_Output(self,other,"DIA_Lutero_SarahToGuildDone_01_19");	//Теперь можешь более не беспокоить себя этим вопросом - обо всем остальном я позабочусь сам лично.
		AI_Output(self,other,"DIA_Lutero_SarahToGuildDone_01_20");	//Что же касается тебя - то вот, прими от меня этот маленький подарок, в качестве компенсации за свои хлопоты.

		if(TRADEGUILDREP >= 9)
		{
			AI_Output(self,other,"DIA_Lutero_SarahToGuildDone_01_25");	//Вот - возьми эти деньги и в довесок к ним еще эту небольшую вещицу.
			B_GiveInvItems(self,other,ItMi_Gold,500);
			AI_Output(self,other,"DIA_Lutero_SarahToGuildDone_01_26");	//Думаю, ее вполне хватит, чтобы окупить все твои хлопоты, связанные с этим делом.
			B_GiveInvItems(self,other,itri_pilligrimring,1);
			TRADEGUILDISOVERMASTER = TRUE;
			if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDM) || (hero.guild == GIL_KDW) || (hero.guild == GIL_GUR))
			{
				AI_Output(self,other,"DIA_Lutero_SarahToGuildDone_01_34");	//Для уважаемого мага у меня особая награда.
				B_GiveInvItems(self,other,ItPo_Perm_Mana,1);
			}
			else
			{
				AI_Output(self,other,"DIA_Lutero_SarahToGuildDone_01_35");	//Для бравого воина у меня есть специальная награда.
				B_GiveInvItems(self,other,ItPo_Perm_STR,1);
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Lutero_SarahToGuildDone_01_30");	//Вот - возьми эти деньги.
			B_GiveInvItems(self,other,ItMi_Gold,500);
			AI_Output(self,other,"DIA_Lutero_SarahToGuildDone_01_31");	//Думаю, этого вполне должно хватить, чтобы компенсировать твои хлопоты.
			TRADEGUILDISOVER = TRUE;
			MIS_TRADEGUILD = LOG_SUCCESS;
			Log_SetTopicStatus(TOPIC_TRADEGUILD,LOG_SUCCESS);
		};
	};
};


instance DIA_LUTERO_PALADINFOOD(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = dia_lutero_paladinfood_condition;
	information = dia_lutero_paladinfood_info;
	permanent = FALSE;
	description = "Какое у тебя ко мне дело?";
};


func int dia_lutero_paladinfood_condition()
{
	if((MIS_JORAHELP == LOG_FAILED) || (MIS_JORAHELP == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_lutero_paladinfood_info()
{
	AI_Output(other,self,"DIA_Lutero_PaladinFood_01_00");	//Какое у тебя ко мне дело?
	AI_Output(self,other,"DIA_Lutero_PaladinFood_01_02");	//Паладины хотят заключить с нашей гильдией соглашение о поставке для них продовольствия и питьевых припасов.
	AI_Output(self,other,"DIA_Lutero_PaladinFood_01_03");	//Это очень хорошее предложение, и мы не должны упускать его.
	AI_Output(other,self,"DIA_Lutero_PaladinFood_01_04");	//А как же город и близлежащие фермы?
	AI_Output(self,other,"DIA_Lutero_PaladinFood_01_05");	//Они не смогут справиться с их потребностями. А после того, как Онар отказался торговать с городом - ситуация уже выглядит совсем плачевно.
	AI_Output(self,other,"DIA_Lutero_PaladinFood_01_06");	//Да и потом, мало найдется желающих даром отдавать весь свой урожай. Даже если это паладины короля...(смеется)
	AI_Output(other,self,"DIA_Lutero_PaladinFood_01_07");	//Понятно. А что тебе от меня нужно?
	AI_Output(self,other,"DIA_Lutero_PaladinFood_01_08");	//У меня уже есть некоторая устная договоренность с лордом Хагеном по этому вопросу.
	AI_Output(self,other,"DIA_Lutero_PaladinFood_01_09");	//Однако мы до сих пор не знаем точных объемов этих поставок.
	AI_Output(self,other,"DIA_Lutero_PaladinFood_01_11");	//Поэтому отправляйся к лорду Хагену и досконально обсуди с ним эту тему.

	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Lutero_PaladinFood_01_12");	//Конечно то обстоятельство, что ты один из наемников Онара, может немного помешать тебе в этом деле.
		AI_Output(self,other,"DIA_Lutero_PaladinFood_01_13");	//Но думаю, что лорд Хаген все-таки выслушает тебя, если ты будешь с ним немного повежливее.
	};
	AI_Output(other,self,"DIA_Lutero_PaladinFood_01_16");	//А что именно мне должен сообщить лорд Хаген?
	AI_Output(self,other,"DIA_Lutero_PaladinFood_01_17");	//От тебя мне нужны точные сведения о том количестве еды, которое необходимо паладинам.
	AI_Output(self,other,"DIA_Lutero_PaladinFood_01_18");	//И лучше в письменном виде.
	AI_Output(self,other,"DIA_Lutero_PaladinFood_01_26");	//Теперь отправляйся к паладинам и постарайся не наломать дров.
	MIS_PALADINFOOD = LOG_Running;
	Log_CreateTopic(TOPIC_PALADINFOOD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PALADINFOOD,LOG_Running);
	B_LogEntry(TOPIC_PALADINFOOD,"Лютеро направил меня к лорду Хагену, чтобы обсудить с ним объем поставок продовольствия для паладинов, которое им собирается обеспечить гильдия.");
};


instance DIA_LUTERO_PALADINFOODDONE(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = dia_lutero_paladinfooddone_condition;
	information = dia_lutero_paladinfooddone_info;
	permanent = FALSE;
	description = "Я поговорил с Хагеном.";
};


func int dia_lutero_paladinfooddone_condition()
{
	if((MIS_PALADINFOOD == LOG_Running) && (Npc_HasItems(hero,itwr_hagencontent) >= 1))
	{
		return TRUE;
	};
};

func void dia_lutero_paladinfooddone_info()
{
	B_GivePlayerXP(300);
	TRADEGUILDREP = TRADEGUILDREP + 1;
	MIS_PALADINFOOD = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_PALADINFOOD,LOG_SUCCESS);
	Log_AddEntry(TOPIC_PALADINFOOD,"Я доставил список Лютеро.");
	AI_Output(other,self,"DIA_Lutero_PaladinFoodDone_01_00");	//Я поговорил с Хагеном.
	AI_Output(self,other,"DIA_Lutero_PaladinFoodDone_01_01");	//И что он сказал?
	AI_Output(other,self,"DIA_Lutero_PaladinFoodDone_01_02");	//Он дал мне этот список - тут все, что нужно паладинам.
	AI_Output(self,other,"DIA_Lutero_PaladinFoodDone_01_03");	//Хорошо, дай я посмотрю на него.
	B_GiveInvItems(other,self,itwr_hagencontent,1);
	B_UseFakeScroll();
	Npc_RemoveInvItems(self,itwr_hagencontent,1);
	AI_Output(self,other,"DIA_Lutero_PaladinFoodDone_01_05");	//Хммм. Мне кажется лорд Хаген просит слишком много.
	AI_Output(self,other,"DIA_Lutero_PaladinFoodDone_01_07");	//У нашей гильдии просто нет таких огромных запасов продовольствия!
	AI_Output(self,other,"DIA_Lutero_PaladinFoodDone_01_08");	//Максимум, что мы сможем обеспечить - это половина от того, что ему нужно...(растерянно)
	AI_Output(other,self,"DIA_Lutero_PaladinFoodDone_01_09");	//Тогда, думаю, нужно сообщить об этом самому Хагену.
	AI_Output(self,other,"DIA_Lutero_PaladinFoodDone_01_10");	//Нет, не стоит. Если мы это сделаем, то боюсь, тогда этой сделке вообще не состояться!
	AI_Output(self,other,"DIA_Lutero_PaladinFoodDone_01_12");	//Необходимо придумать что-то другое.
	AI_Output(self,other,"DIA_Lutero_PaladinFoodDone_01_15");	//Такими большими запасами продовольствия может располагать только один человек.
	AI_Output(other,self,"DIA_Lutero_PaladinFoodDone_01_16");	//Ты имеешь в виду Онара?
	AI_Output(self,other,"DIA_Lutero_PaladinFoodDone_01_17");	//Да, именно его.
	AI_Output(other,self,"DIA_Lutero_PaladinFoodDone_01_18");	//Но он никогда не станет продавать продовольствие ни паладинам, ни городу.
	AI_Output(self,other,"DIA_Lutero_PaladinFoodDone_01_20");	//Да, это действительно так. Однако Онар все же деловой человек и, к тому же, уж очень любит звук золота.
	AI_Output(self,other,"DIA_Lutero_PaladinFoodDone_01_21");	//Мне кажется, что нам стоит попробовать с ним договориться.
	AI_Output(other,self,"DIA_Lutero_PaladinFoodDone_01_22");	//А если об этом кто-нибудь узнает?
	AI_Output(self,other,"DIA_Lutero_PaladinFoodDone_01_23");	//Безусловно, риск, конечно, большой. Но выгода от этой сделки его вполне оправдывает.
	AI_Output(self,other,"DIA_Lutero_PaladinFoodDone_01_25");	//И я поручаю это дело тебе.
	AI_Output(self,other,"DIA_Lutero_PaladinFoodDone_01_31");	//Так что отправляйся к нему на ферму и попытайся его уговорить продать нам часть продовольствия.
	AI_Output(other,self,"DIA_Lutero_PaladinFoodDone_01_32");	//Я постараюсь сделать это.
	AI_Output(self,other,"DIA_Lutero_PaladinFoodDone_01_34");	//Если тебе все-таки удастся договориться с ним, то не сомневайся - моя благодарность тебе не будет знать границ.
	AI_Output(self,other,"DIA_Lutero_PaladinFoodDone_01_36");	//А теперь ступай и не теряй времени.
	MIS_ONARBUSINESS = LOG_Running;
	Log_CreateTopic(TOPIC_ONARBUSINESS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ONARBUSINESS,LOG_Running);
	B_LogEntry(TOPIC_ONARBUSINESS,"Те объемы провианта, которые запросил лорд Хаген для своих паладинов, оказались просто невыполнимы - Лютеро не сможет поставить все необходимое продовольствие целиком. Однако и упускать из рук выгодную сделку он тоже не хочет. Поэтому он решил попробовать договориться о поставке части продовольствия с мятежным помещиком Онаром. Точнее, договариваться с Онаром он отправил меня, поскольку сам Лютеро слишком заметная фигура для таких дел. Что из этой затеи получится, теперь даже и представить трудно.");
};


instance DIA_LUTERO_ONARBUSINESS(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = dia_lutero_onarbusiness_condition;
	information = dia_lutero_onarbusiness_info;
	permanent = TRUE;
	description = "Насчет этой твоей идеи...";
};


func int dia_lutero_onarbusiness_condition()
{
	if((MIS_ONARBUSINESS == LOG_Running) && ((ONARAGREED == TRUE) || (ONARNOTAGREED == TRUE)))
	{
		return TRUE;
	};
};

func void dia_lutero_onarbusiness_info()
{
	AI_Output(other,self,"DIA_Lutero_OnarBusiness_01_00");	//Насчет этой твоей идеи...
	AI_Output(self,other,"DIA_Lutero_OnarBusiness_01_01");	//Что? Есть новости?
	if(ONARAGREED == TRUE)
	{
		B_GivePlayerXP(300);
		TRADEGUILDREP = TRADEGUILDREP + 1;
		MIS_ONARBUSINESS = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_ONARBUSINESS,LOG_SUCCESS);
		B_LogEntry(TOPIC_ONARBUSINESS,"Лютеро был несказанно рад, что мне удалось договориться с Онаром о поставках продовольствия для гильдии.");
		AI_Output(other,self,"DIA_Lutero_OnarBusiness_01_02");	//Я договорился с Онаром.
		AI_Output(other,self,"DIA_Lutero_OnarBusiness_01_03");	//Он согласился предоставить гильдии часть недостающего провианта.
		AI_Output(other,self,"DIA_Lutero_OnarBusiness_01_04");	//Хотя и отметил, что тебе это обойдется совсем не дешево!
		AI_Output(self,other,"DIA_Lutero_OnarBusiness_01_05");	//Отлично! (восхищенно) Вот уж не думал, что тебе действительно удастся уговорить этого старого борова.
		AI_Output(self,other,"DIA_Lutero_OnarBusiness_01_11");	//Вот! Возьми эту награду. Ты ее полностью заслужил.
		B_GiveInvItems(self,other,itwr_elementarearcanei,1);
	}
	else if(ONARNOTAGREED == TRUE)
	{
		B_GivePlayerXP(250);
		MIS_ONARBUSINESS = LOG_FAILED;
		B_LogEntry_Failed(TOPIC_ONARBUSINESS);
		AI_Output(other,self,"DIA_Lutero_OnarBusiness_01_23");	//К сожалению, я не смог договориться с Онаром.
		AI_Output(self,other,"DIA_Lutero_OnarBusiness_01_24");	//Я так и думал...(расстроенно) А что он сказал?
		AI_Output(other,self,"DIA_Lutero_OnarBusiness_01_25");	//Этот жирный боров даже не стал меня слушать, а просто выставил за дверь.
		AI_Output(self,other,"DIA_Lutero_OnarBusiness_01_26");	//Это очень похоже на него!
		AI_Output(self,other,"DIA_Lutero_OnarBusiness_01_27");	//Ладно, забудем об этом - в конце концов на этот вариант было мало надежды.
		AI_Output(other,self,"DIA_Lutero_OnarBusiness_01_28");	//И что теперь?
		AI_Output(self,other,"DIA_Lutero_OnarBusiness_01_29");	//Теперь нам придется как-то самим найти эту недостающую часть провианта для паладинов.
		AI_Output(self,other,"DIA_Lutero_OnarBusiness_01_34");	//Что же касается тебя - то несмотря на то, что ты не смог выполнить это мое поручение...
		AI_Output(self,other,"DIA_Lutero_OnarBusiness_01_35");	//...я не хочу отпускать тебя с пустыми руками.
		AI_Output(self,other,"DIA_Lutero_OnarBusiness_01_43");	//Вот - возьми эти деньги.
		B_GiveInvItems(self,other,ItMi_Gold,300);
		AI_Output(self,other,"DIA_Lutero_OnarBusiness_01_44");	//Думаю, этого вполне должно хватить, чтобы компенсировать твои хлопоты.
	}
	else
	{
		AI_Output(other,self,"DIA_Lutero_OnarBusiness_01_47");	//Пока нет.
		AI_Output(self,other,"DIA_Lutero_OnarBusiness_01_48");	//Тогда зачем ты попусту тратишь мое время?
		AI_Output(self,other,"DIA_Lutero_OnarBusiness_01_49");	//Иди и поговори с Онаром!
		AI_StopProcessInfos(self);
	};
};

instance DIA_LUTERO_MASTERRING(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 1;
	condition = dia_lutero_masterring_condition;
	information = dia_lutero_masterring_info;
	permanent = FALSE;
	description = "Что это за кольцо, которое ты мне дал?";
};

func int dia_lutero_masterring_condition()
{
	if((TRADEGUILDISOVERMASTER == TRUE) && (Npc_HasItems(hero,itri_pilligrimring) >= 1))
	{
		return TRUE;
	};
};

func void dia_lutero_masterring_info()
{
	Snd_Play("LevelUp");
	hero.exp = hero.exp + 1000;
	AI_NoticePrint(3000,4098,NAME_ADDON_TRADEBONUS);
	TRADEBONUS = TRUE;
	AI_Output(other,self,"DIA_Lutero_MasterRing_01_00");	//Что это за кольцо, которое ты мне дал?
	AI_Output(self,other,"DIA_Lutero_MasterRing_01_01");	//Я знал, что ты поинтересуешься этим...(смеется) Позволь мне тебе кое-что объяснить.
	AI_Output(self,other,"DIA_Lutero_MasterRing_01_02");	//Это кольцо - знак мастера торговой гильдии. Это большая честь, и немногие заслужили ее.
	AI_Output(other,self,"DIA_Lutero_MasterRing_01_03");	//Мастера гильдии торговцев?
	AI_Output(other,self,"DIA_Lutero_MasterRing_01_04");	//Но мне казалось, что им являешься ты.
	AI_Output(self,other,"DIA_Lutero_MasterRing_01_05");	//Это действительно так...(смеется) Однако это не означает, что только я единственный могу носить это звание.
	AI_Output(self,other,"DIA_Lutero_MasterRing_01_08");	//Заметь, надев это кольцо - ты не просто обретешь статус мастера, это еще и даст тебе определенные привилегии!
	AI_Output(other,self,"DIA_Lutero_MasterRing_01_09");	//Что за привилегии?
	AI_Output(self,other,"DIA_Lutero_MasterRing_01_10");	//Те торговцы, которые состоят в нашей гильдии, увидев это кольцо...
	AI_Output(self,other,"DIA_Lutero_MasterRing_01_11");	//...с радостью предложат тебе на продажу свой самый лучший товар, что у них есть.
	AI_Output(self,other,"DIA_Lutero_MasterRing_01_12");	//Просто поговори с любым из них, и ты поймешь, в чем заключается разница...(смеется)
	AI_Output(self,other,"DIA_Lutero_MasterRing_01_13");	//Только не забудь перед этим надеть свое кольцо мастера гильдии - иначе они просто не поймут, кто стоит перед ними.
	AI_Output(other,self,"DIA_Lutero_MasterRing_01_14");	//Хорошо, я это запомню. Спасибо.
	NAME_TRADEMASTERRING = "Это кольцо - знак мастера гильдии торговцев Хориниса...";
	Npc_RemoveInvItems(other,itri_pilligrimring,1);
	CreateInvItems(other,itri_pilligrimring,1);
	MIS_TRADEGUILD = LOG_SUCCESS;
	TRADEMASTERBEGAN = TRUE;
	Log_SetTopicStatus(TOPIC_TRADEGUILD,LOG_SUCCESS);
	B_LogEntry(TOPIC_TRADEGUILD,"Теперь я мастер гильдии торговцев Хориниса!");
};

instance DIA_LUTERO_ENDTRADEGUILD(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 2;
	condition = dia_lutero_endtradeguild_condition;
	information = dia_lutero_endtradeguild_info;
	permanent = TRUE;
	description = "У тебя еще будут для меня поручения?";
};

func int dia_lutero_endtradeguild_condition()
{
	if((MIS_TRADEGUILD != LOG_SUCCESS) && ((TRADEGUILDISOVERMASTER == TRUE) || (TRADEGUILDISOVER == TRUE)))
	{
		return TRUE;
	};
};

func void dia_lutero_endtradeguild_info()
{
	AI_Output(other,self,"DIA_Lutero_EndTradeGuild_01_00");	//У тебя еще будут для меня поручения?

	if(TRADEGUILDISOVERMASTER == TRUE)
	{
		AI_Output(self,other,"DIA_Lutero_EndTradeGuild_01_01");	//Нет, у меня пока больше нет для тебя работы.
		AI_Output(self,other,"DIA_Lutero_EndTradeGuild_01_02");	//Сейчас я слишком занят тем делом с паладинами, чтобы отвлекаться на что-то другое.
		AI_Output(other,self,"DIA_Lutero_EndTradeGuild_01_03");	//Хорошо, как скажешь.

		if(TRADEMASTERBEGAN == TRUE)
		{
			AI_Output(self,other,"DIA_Lutero_EndTradeGuild_01_04");	//Да и потом: ты уже проделал огромную работу и заслужил немного отдохнуть...(смеется)
		};
	}
	else if(TRADEGUILDISOVER == TRUE)
	{
		AI_Output(self,other,"DIA_Lutero_EndTradeGuild_01_08");	//Нет, у меня пока больше нет для тебя работы.
		AI_Output(self,other,"DIA_Lutero_EndTradeGuild_01_09");	//Сейчас я слишком занят тем делом с паладинами, чтобы отвлекаться на что-то другое.
		AI_Output(other,self,"DIA_Lutero_EndTradeGuild_01_10");	//Хорошо, как скажешь.

		if(MIS_TRADEGUILD == LOG_Running)
		{
			MIS_TRADEGUILD = LOG_SUCCESS;
			Log_SetTopicStatus(TOPIC_TRADEGUILD,LOG_SUCCESS);
			B_LogEntry(TOPIC_TRADEGUILD,"У Лютеро больше нет для меня поручений. Думаю, об этом можно на время забыть.");
		};
	};
};


instance DIA_LUTERO_WHOISTRADEGUILD(C_Info)
{
	npc = VLK_404_Lutero;
	nr = 5;
	condition = dia_lutero_whoistradeguild_condition;
	information = dia_lutero_whoistradeguild_info;
	permanent = TRUE;
	description = "Кто состоит в гильдии торговцев?";
};

func int dia_lutero_whoistradeguild_condition()
{
	if((MEMBERTRADEGUILD == TRUE) && (KNOWS_GUILDTRADERS == FALSE))
	{
		return TRUE;
	};
};

func void dia_lutero_whoistradeguild_info()
{
	AI_Output(other,self,"DIA_Lutero_WhoIsTradeGuild_01_00");	//Кто состоит в гильдии торговцев?
	if(TRADEMASTERBEGAN == TRUE)
	{
		B_GivePlayerXP(100);
		AI_Output(self,other,"DIA_Lutero_WhoIsTradeGuild_01_01");	//Поскольку теперь ты также являешься мастером нашей гильдии - я могу тебе рассказать об этом.
		if(MIS_SARAHTOGUILD == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Lutero_WhoIsTradeGuild_01_02");	//С некоторыми ты уже знаком - это Джора и Сара...(ехидно)
			if(KNOWS_GUILDTRADERS == FALSE)
			{
				Log_CreateTopic(TOPIC_GUILDTRADERS,LOG_NOTE);
				B_LogEntry(TOPIC_GUILDTRADERS,"Лютеро назвал мне имена торговцев, состоящих в гильдии. Это Маттео, Саландрил, Джора, Эрол, Найджел и Сара.");
				KNOWS_GUILDTRADERS = TRUE;
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Lutero_WhoIsTradeGuild_01_03");	//С одним ты уже знаком - это торговец Джора.
			if(KNOWS_GUILDTRADERS == FALSE)
			{
				Log_CreateTopic(TOPIC_GUILDTRADERS,LOG_NOTE);
				B_LogEntry(TOPIC_GUILDTRADERS,"Лютеро назвал мне имена торговцев, состоящих в гильдии. Это Маттео, Саландрил, Джора, Эрол и Найджел.");
				KNOWS_GUILDTRADERS = TRUE;
			};
		};
		AI_Output(self,other,"DIA_Lutero_WhoIsTradeGuild_01_04");	//Кроме этого, в нашей гильдии состоят и другие - Маттео, Саландрил, Эрол и Найджел.
		AI_Output(self,other,"DIA_Lutero_WhoIsTradeGuild_01_05");	//Все они, как я уже сказал, будут рады предложить тебе самые лучшие товары, что у них есть.
		AI_Output(self,other,"DIA_Lutero_WhoIsTradeGuild_01_06");	//Только не забудь одеть кольцо.
	}
	else
	{
		AI_Output(self,other,"DIA_Lutero_WhoIsTradeGuild_01_08");	//Тебе пока рано об этом знать.
		AI_Output(self,other,"DIA_Lutero_WhoIsTradeGuild_01_09");	//Прежде чем задавать такие вопросы, для начала нужно кем-то стать в нашей гильдии.
	};
};