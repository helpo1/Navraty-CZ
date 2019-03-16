
instance DIA_Carl_EXIT(C_Info)
{
	npc = VLK_461_Carl;
	nr = 999;
	condition = DIA_Carl_EXIT_Condition;
	information = DIA_Carl_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Carl_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Carl_EXIT_Info()
{
	Npc_RemoveInvItems(self,ItMw_1H_AssBlade_View,Npc_HasItems(self,ItMw_1H_AssBlade_View));
	AI_StopProcessInfos(self);
};

func void B_CarlSayHallo()
{
	AI_Output(self,other,"DIA_Carl_Hallo_05_00");	//Похоже, в городе есть несколько воров, которые крадут у зажиточных горожан.
	AI_Output(self,other,"DIA_Carl_Hallo_05_01");	//Городская стража недавно перевернула портовый квартал вверх дном, но они ничего не нашли.
};


instance DIA_Carl_PICKPOCKET(C_Info)
{
	npc = VLK_461_Carl;
	nr = 900;
	condition = DIA_Carl_PICKPOCKET_Condition;
	information = DIA_Carl_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Carl_PICKPOCKET_Condition()
{
	return C_Beklauen(34,40);
};

func void DIA_Carl_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Carl_PICKPOCKET);
	Info_AddChoice(DIA_Carl_PICKPOCKET,Dialog_Back,DIA_Carl_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Carl_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Carl_PICKPOCKET_DoIt);
};

func void DIA_Carl_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Carl_PICKPOCKET);
};

func void DIA_Carl_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Carl_PICKPOCKET);
};


instance DIA_Carl_Hallo(C_Info)
{
	npc = VLK_461_Carl;
	nr = 2;
	condition = DIA_Carl_Hallo_Condition;
	information = DIA_Carl_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Carl_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Carl_Hallo_Info()
{
	AI_Output(self,other,"DIA_Carl_Hallo_05_02");	//Что привело тебя в этот бедный район? Что ты ищешь здесь?
	Info_ClearChoices(DIA_Carl_Hallo);
	Info_AddChoice(DIA_Carl_Hallo,"Я заблудился.",DIA_Carl_Hallo_verlaufen);
	Info_AddChoice(DIA_Carl_Hallo,"Я просто брожу, осматриваю окрестности.",DIA_Carl_Hallo_umsehen);
};

func void DIA_Carl_Hallo_verlaufen()
{
	AI_Output(other,self,"DIA_Carl_Hallo_verlaufen_15_00");	//Я заблудился.
	AI_Output(self,other,"DIA_Carl_Hallo_verlaufen_05_01");	//Тогда смотри, чтобы тебя не ограбили.
	B_CarlSayHallo();
	Info_ClearChoices(DIA_Carl_Hallo);
};

func void DIA_Carl_Hallo_umsehen()
{
	AI_Output(other,self,"DIA_Carl_Hallo_umsehen_15_00");	//Я просто брожу, осматриваю окрестности.
	AI_Output(self,other,"DIA_Carl_Hallo_umsehen_05_01");	//Ага. Смотри, зазеваешься и лишишься кошелька.
	B_CarlSayHallo();
	Info_ClearChoices(DIA_Carl_Hallo);
};

instance DIA_Carl_HelpPath(C_Info)
{
	npc = VLK_461_Carl;
	nr = 3;
	condition = DIA_Carl_HelpPath_Condition;
	information = DIA_Carl_HelpPath_Info;
	permanent = FALSE;
	description = "Могу ли я быть тебе полезен?";
};

func int DIA_Carl_HelpPath_Condition()
{
	if((CanTeachTownMaster == FALSE) && (MIS_PathFromDown == LOG_Running) && (PabloQuestsUp == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Carl_HelpPath_Info()
{
	AI_Output(other,self,"DIA_Carl_HelpPath_01_00");	//Могу ли я быть тебе полезен?
	AI_Output(self,other,"DIA_Carl_HelpPath_01_01");	//(удивленно) А с чего ты взял, что я вообще нуждаюсь в твоей помощи?
	AI_Output(other,self,"DIA_Carl_HelpPath_01_02");	//Я хочу стать подмастерьем, и мне нужно произвести на местных хорошее впечатление. 
	AI_Output(self,other,"DIA_Carl_HelpPath_01_03");	//(ухмыляясь) Теперь мне все понятно. К сожалению, у меня уже есть помощник!
	AI_Output(self,other,"DIA_Carl_HelpPath_01_04");	//Но ты можешь впечатлить меня, если поможешь доставить в мою кузницу материал для работы.
	AI_Output(other,self,"DIA_Carl_HelpPath_01_05");	//Что именно? 
	AI_Output(self,other,"DIA_Carl_HelpPath_01_06");	//Мне нужен уголь. Хотя бы пять кусков!
	AI_Output(self,other,"DIA_Carl_HelpPath_01_07");	//Достань его - и считай, что мое одобрение уже у тебя в кармане.
	AI_Output(other,self,"DIA_Carl_HelpPath_01_08");	//А где я смогу найти его?
	AI_Output(self,other,"DIA_Carl_HelpPath_01_09");	//Уголь можно найти в сгоревших строениях, купить у торговцев или накопать в шахтах.
	AI_Output(other,self,"DIA_Carl_HelpPath_01_10");	//Хорошо. Я постараюсь достать все, о чем ты просил.
	MIS_CarlCoal = LOG_Running;
	Log_CreateTopic(TOPIC_CarlCoal,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CarlCoal,LOG_Running);
	B_LogEntry(TOPIC_CarlCoal,"Кузнец Карл попросил достать для него пять кусков угля. Тогда он замолвит за меня словечко.");
};

instance DIA_Carl_HelpPath_Done(C_Info)
{
	npc = VLK_461_Carl;
	nr = 3;
	condition = DIA_Carl_HelpPath_Done_Condition;
	information = DIA_Carl_HelpPath_Done_Info;
	permanent = FALSE;
	description = "Я принес уголь.";
};

func int DIA_Carl_HelpPath_Done_Condition()
{
	if((MIS_CarlCoal == LOG_Running) && (Npc_HasItems(other,ItMi_Coal) >= 5))
	{
		return TRUE;
	};
};

func void DIA_Carl_HelpPath_Done_Info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_Carl_HelpPath_Done_01_00");	//Я принес уголь.
	AI_Output(self,other,"DIA_Carl_HelpPath_Done_01_01");	//Отлично. (довольно) Давай его сюда. Мои запасы почти на исходе.
	AI_Output(other,self,"DIA_Carl_HelpPath_Done_01_02");	//Конечно, вот он. А что насчет твоего одобрения?
	B_GiveInvItems(other,self,ItMi_Coal,5);
	Npc_RemoveInvItems(self,ItMi_Coal,5);
	AI_Output(self,other,"DIA_Carl_HelpPath_Done_01_03");	//Можешь не переживать...(улыбаясь) Как мы и договаривались!
	AI_Output(self,other,"DIA_Carl_HelpPath_Done_01_04");	//Если вдруг кто-нибудь спросит меня о тебе, то узнает только самое хорошее.
	MIS_CarlCoal = LOG_Success;
	Log_SetTopicStatus(TOPIC_CarlCoal,LOG_Success);
	B_LogEntry(TOPIC_CarlCoal,"Я принес уголь кузнецу Карлу. Теперь он замолвит за меня словечко в квартале ремесленников.");
};

instance DIA_Carl_Diebe(C_Info)
{
	npc = VLK_461_Carl;
	nr = 3;
	condition = DIA_Carl_Diebe_Condition;
	information = DIA_Carl_Diebe_Info;
	permanent = FALSE;
	description = "Что ты знаешь о ворах?";
};

func int DIA_Carl_Diebe_Condition()
{
	return TRUE;
};

func void DIA_Carl_Diebe_Info()
{
	AI_Output(other,self,"DIA_Carl_Diebe_15_00");	//Что ты знаешь о ворах?
	AI_Output(self,other,"DIA_Carl_Diebe_05_01");	//Ничего. Но все горожане напуганы и становятся недоверчивыми - особенно к чужакам.
	AI_Output(self,other,"DIA_Carl_Diebe_05_02");	//Смотри, чтобы тебя не застали в чужом доме. У нас этого не любят.
	AI_Output(self,other,"DIA_Carl_Diebe_05_03");	//Да, ты должен сам защищаться от воров. Хорошая дубинка - лучше всего.
};


instance DIA_Carl_Lernen(C_Info)
{
	npc = VLK_461_Carl;
	nr = 3;
	condition = DIA_Carl_Lernen_Condition;
	information = DIA_Carl_Lernen_Info;
	permanent = FALSE;
	description = "Ты можешь научить меня чему-нибудь?";
};


func int DIA_Carl_Lernen_Condition()
{
	return TRUE;
};

func void DIA_Carl_Lernen_Info()
{
	AI_Output(other,self,"DIA_Carl_Lernen_15_00");	//Ты можешь меня чему-нибудь научить?
	AI_Output(self,other,"DIA_Carl_Lernen_05_01");	//Ах, я кую здесь подковы, гвозди и чиню металлические предметы.
	AI_Output(self,other,"DIA_Carl_Lernen_05_02");	//Но в порту не приобретешь много опыта в кузнечном деле, чтобы было чему учить.
	AI_Output(self,other,"DIA_Carl_Lernen_05_02A");	//Хотя конечно, выковать простой обычный меч - я и сам смог бы и тебя научил бы, как это сделать.
	AI_Output(self,other,"DIA_Carl_Lernen_05_03");	//А если хочешь действительно научиться ковать настоящее оружие - иди к Хараду. Да..., он кует роскошные клинки!
	AI_Output(self,other,"DIA_Carl_Lernen_05_04");	//Но если ты хочешь только чуть-чуть потренировать свои мускулы - могу тебе и в этом помочь.
	Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
	CARL_TEACHSMITH = TRUE;
	B_LogEntry(TOPIC_CityTeacher,"Карл, кузнец в портовом районе, сможет помочь мне стать сильнее и обучить ковке.");
};


instance DIA_Carl_Wieviel(C_Info)
{
	npc = VLK_461_Carl;
	nr = 3;
	condition = DIA_Carl_Wieviel_Condition;
	information = DIA_Carl_Wieviel_Info;
	permanent = FALSE;
	description = "Сколько ты берешь за обучение?";
};

func int DIA_Carl_Wieviel_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Carl_Lernen))
	{
		return TRUE;
	};
};

func void DIA_Carl_Wieviel_Info()
{
	AI_Output(other,self,"DIA_Carl_Wieviel_15_00");	//Сколько ты берешь за обучение?

	if(Npc_KnowsInfo(other,DIA_Edda_Statue))
	{
		B_GivePlayerXP(50);
		AI_Output(self,other,"DIA_Carl_Wieviel_05_01");	//Я слышал, что ты сделал для Эдды. Я буду тренировать тебя бесплатно.
		Carl_TeachSTR = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Carl_Wieviel_05_02");	//Пятьдесят золотых монет - и я помогу тебе стать сильнее.
	};
};

instance DIA_Carl_bezahlen(C_Info)
{
	npc = VLK_461_Carl;
	nr = 3;
	condition = DIA_Carl_bezahlen_Condition;
	information = DIA_Carl_bezahlen_Info;
	permanent = TRUE;
	description = "Я хочу потренироваться с тобой. (Цена: 50 монет)";
};

func int DIA_Carl_bezahlen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Carl_Wieviel) && (Carl_TeachSTR == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Carl_bezahlen_Info()
{
	AI_Output(other,self,"DIA_Carl_bezahlen_15_00");	//Я хочу потренироваться с тобой.

	if(Npc_KnowsInfo(other,DIA_Edda_Statue))
	{
		AI_Output(self,other,"DIA_Carl_bezahlen_05_01");	//Я слышал, что ты сделал для Эдды. Я буду тренировать тебя бесплатно.
		Carl_TeachSTR = TRUE;
	}
	else if(B_GiveInvItems(other,self,ItMi_Gold,50))
	{
		AI_Output(self,other,"DIA_Carl_bezahlen_05_02");	//Хорошо, мы можем начать, как только ты будешь готов.
		Carl_TeachSTR = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Carl_bezahlen_05_03");	//Принеси деньги, тогда начнем обучение.
	};
};

instance DIA_Carl_Teach(C_Info)
{
	npc = VLK_461_Carl;
	nr = 7;
	condition = DIA_Carl_Teach_Condition;
	information = DIA_Carl_Teach_Info;
	permanent = TRUE;
	description = "Я хочу стать сильнее.";
};

func int DIA_Carl_Teach_Condition()
{
	if(Carl_TeachSTR == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Carl_Teach_Info()
{
	AI_Output(other,self,"DIA_Carl_Teach_15_00");	//Я хочу стать сильнее.
	Info_ClearChoices(DIA_Carl_Teach);
	Info_AddChoice(DIA_Carl_Teach,Dialog_Back,DIA_Carl_Teach_Back);
	Info_AddChoice(DIA_Carl_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Carl_Teach_STR_1);
	Info_AddChoice(DIA_Carl_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Carl_Teach_STR_5);
};

func void DIA_Carl_Teach_Back()
{
	Info_ClearChoices(DIA_Carl_Teach);
};

func void DIA_Carl_Teach_STR_1()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_HIGH);
	Info_ClearChoices(DIA_Carl_Teach);
	Info_AddChoice(DIA_Carl_Teach,Dialog_Back,DIA_Carl_Teach_Back);
	Info_AddChoice(DIA_Carl_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Carl_Teach_STR_1);
	Info_AddChoice(DIA_Carl_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Carl_Teach_STR_5);
};

func void DIA_Carl_Teach_STR_5()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_HIGH);
	Info_ClearChoices(DIA_Carl_Teach);
	Info_AddChoice(DIA_Carl_Teach,Dialog_Back,DIA_Carl_Teach_Back);
	Info_AddChoice(DIA_Carl_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Carl_Teach_STR_1);
	Info_AddChoice(DIA_Carl_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Carl_Teach_STR_5);
};

func void b_carl_teachsmith()
{
	AI_Output(self,other,"DIA_Carl_TeachCommon_12_01");	//Это просто, парень. Достань кусок чистой стали и держи в огне, пока не начнет плавиться.
	AI_Output(self,other,"DIA_Carl_TeachCommon_12_02");	//Потом выкуй на наковальне клинок.
};

func void b_carlsmithchoices()
{
	Info_ClearChoices(dia_carl_teachsmith);
	Info_AddChoice(dia_carl_teachsmith,Dialog_Back,dia_carl_teachsmith_back);
	if(PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	{
		Info_AddChoice(dia_carl_teachsmith,b_buildlearnstringforsmithhunt("Научиться ковать ",B_GetLearnCostTalent(other,NPC_TALENT_SMITH,WEAPON_Common)),dia_carl_teachsmith_common);
	};
};


instance DIA_CARL_TEACHSMITH(C_Info)
{
	npc = VLK_461_Carl;
	nr = 50;
	condition = dia_carl_teachsmith_condition;
	information = dia_carl_teachsmith_info;
	permanent = TRUE;
	description = "Научи меня ковать оружие.";
};


func int dia_carl_teachsmith_condition()
{
	if((PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE) && (CARL_TEACHSMITH == TRUE))
	{
		return TRUE;
	};
};

func void dia_carl_teachsmith_info()
{
	AI_Output(other,self,"DIA_Carl_TeachCommon_15_00");	//Научи меня ковать.
	b_carlsmithchoices();
};

func void dia_carl_teachsmith_back()
{
	Info_ClearChoices(dia_carl_teachsmith);
};

func void dia_carl_teachsmith_common()
{
	if(B_TeachPlayerTalentSmith(self,other,WEAPON_Common))
	{
		b_carl_teachsmith();
		AI_Output(self,other,"DIA_Carl_TeachCommon_12_03");	//Твои первые мечи не будут произведением искусства, но остальное можно и потом выучить.
	};
	b_carlsmithchoices();
};


instance DIA_CARL_ARMORCANTEACH(C_Info)
{
	npc = VLK_461_Carl;
	nr = 5;
	condition = dia_carl_armorcanteach_condition;
	information = dia_carl_armorcanteach_info;
	permanent = TRUE;
	description = "Ты тоже принадлежишь к 'Кольцу Воды'?";
};


func int dia_carl_armorcanteach_condition()
{
	if((CARL_TEACHARMOR == FALSE) && (RANGERCARL == TRUE))
	{
		return TRUE;
	};
};

func void dia_carl_armorcanteach_info()
{
	AI_Output(other,self,"DIA_Carl_ArmorCanTeach_01_00");	//Ты тоже принадлежишь к Кольцу Воды?
	AI_Output(self,other,"DIA_Carl_ArmorCanTeach_01_01");	//К какому Кольцу Воды? Ты о чем это, парень?
	AI_Output(other,self,"DIA_Carl_ArmorCanTeach_01_02");	//Да ладно, не прикидывайся, что не понимаешь, о чем идет речь. Ларес мне все рассказал про тебя.
	AI_Output(self,other,"DIA_Carl_ArmorCanTeach_01_03");	//А, ну, если он так сказал, значит, оно так и есть...(ехидно смеется)
	AI_Output(self,other,"DIA_Carl_ArmorCanTeach_01_04");	//И что же он еще про меня рассказал?
	AI_Output(other,self,"DIA_Carl_ArmorCanTeach_01_05");	//Ларес сказал, что ты сможешь достать для меня доспех получше, чем этот.
	AI_Output(self,other,"DIA_Carl_ArmorCanTeach_01_06");	//А! Вот теперь я точно уверен в том, что перед мной брат по Кольцу. Значит, Ларес так и сказал...
	AI_Output(self,other,"DIA_Carl_ArmorCanTeach_01_07");	//Думаю, он немного погорячился в своих словах. Другого доспеха у меня для тебя нет. Но...
	AI_Output(self,other,"DIA_Carl_ArmorCanTeach_01_08");	//...я мог показать тебе, как улучшить тот доспех, который ты только что мне показал.
	AI_Output(self,other,"DIA_Carl_ArmorCanTeach_01_09");	//Правда, для этого ты должен хотя бы чуть-чуть разбираться в кузнечном деле.

	if(Npc_GetTalentSkill(other,NPC_TALENT_SMITH) > 0)
	{
		AI_Output(other,self,"DIA_Carl_ArmorCanTeach_01_10");	//Я немного разбираюсь в кузнечном деле...
		AI_Output(self,other,"DIA_Carl_ArmorCanTeach_01_11");	//Это хорошо.
		AI_Output(self,other,"DIA_Carl_ArmorCanTeach_01_12");	//Тогда скажи, как будешь готов, и я научу тебя всему, что сам знаю.
	}
	else
	{
		AI_Output(self,other,"DIA_Carl_ArmorCanTeach_01_13");	//А судя по всему, ты даже понятия не имеешь, что это такое.
		AI_Output(self,other,"DIA_Carl_ArmorCanTeach_01_14");	//Поэтому для начала научись ковать. А как научишься, я с радостью научу тебя всему, что сам знаю.
	};

	CARL_TEACHARMOR = TRUE;
	Log_CreateTopic(TOPIC_ARMORTEACHER,LOG_NOTE);
	B_LogEntry(TOPIC_ARMORTEACHER,"Карл может научить меня улучшать доспехи Кольца Воды.");
};

func void b_carl_teacharmor_1()
{
	AI_Output(self,other,"DIA_Carl_TeachArmor_1_01_01");	//Хорошо. Смотри внимательно, как это делается. Все, что тебе нужно, это несколько железных слитков...

	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
	{
		AI_SetWalkMode(self,NPC_WALK);

		if(CARLRECRUITEDDT == FALSE)
		{
			AI_GotoWP(self,"NW_CITY_POOR_SMITH_01");
		}
		else
		{
			AI_GotoWP(self,"NW_CASTLEMINE_TOWER_REP_HUT_SMITH");
		};

		AI_AlignToWP(self);
		AI_UseMob(self,"BSANVIL",5);
		AI_Output(self,other,"DIA_Carl_TeachArmor_1_01_02");	//...самое тяжелое - это сделать элементы кольчужной сетки...
		AI_Output(self,other,"DIA_Carl_TeachArmor_1_01_03");	//...делишь раскаленную заготовку на десяток равных частей, потом отбиваешь нагар, и медленным движением каждой части...
		AI_Output(self,other,"DIA_Carl_TeachArmor_1_01_04");	//...придаешь ровную форму кольца и проковываешь его крепление...
		AI_Output(self,other,"DIA_Carl_TeachArmor_1_01_05");	//...вот так, как это делаю я сейчас...(показывает) ...скрепляешь кольца и крепишь кольчужную сетку на доспех.
		AI_UseMob(self,"BSANVIL",-1);
		B_TurnToNpc(self,other);
		AI_Output(self,other,"DIA_Carl_TeachArmor_1_01_06");	//...вот и все!
		AI_Output(self,other,"DIA_Carl_TeachArmor_1_01_07");	//Попробуй теперь сам. Думаю, у тебя не должно возникнуть больших проблем с этим.
	};
};

func void b_carlarmorchoices()
{
	Info_ClearChoices(dia_carl_armorteach);
	Info_AddChoice(dia_carl_armorteach,Dialog_Back,dia_carl_armorteach_back);

	if(PLAYER_TALENT_SMITH[32] == FALSE)
	{
		Info_AddChoice(dia_carl_armorteach,"Улучшить 'Кольчугу Кольца Воды' (Цена: 500 монет)",dia_carl_armorteach_itar_ranger_addon_v1);
	};
};


instance DIA_CARL_ARMORTEACH(C_Info)
{
	npc = VLK_461_Carl;
	nr = 5;
	condition = dia_carl_armorteach_condition;
	information = dia_carl_armorteach_info;
	permanent = TRUE;
	description = "Научи меня улучшать доспехи.";
};

func int dia_carl_armorteach_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_SMITH) > 0) && (CARL_TEACHARMOR == TRUE) && (RANGERCARL == TRUE))
	{
		if(PLAYER_TALENT_SMITH[32] == FALSE)
		{
			return TRUE;
		};
	};
};

func void dia_carl_armorteach_info()
{
	AI_Output(other,self,"DIA_Carl_ArmorTeach_01_00");	//Научи меня улучшать доспехи.

	if(Wld_IsTime(6,10,20,0))
	{
		AI_Output(self,other,"DIA_Carl_ArmorTeach_01_01");	//Всегда готов помочь тебе, брат по Кольцу...
		b_carlarmorchoices();
	}
	else
	{
		AI_Output(self,other,"DIA_Carl_ArmorTeach_01_02");	//И как же я, по-твоему, сейчас смогу тебя обучить этому? Или ты видишь тут наковальню с горнилом? (смеется)
		AI_Output(self,other,"DIA_Carl_ArmorTeach_01_03");	//Приходи завтра с утра. Тогда и поговорим.
	};
};

func void dia_carl_armorteach_back()
{
	Info_ClearChoices(dia_carl_armorteach);
};

func void dia_carl_armorteach_itar_ranger_addon_v1()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= 500)
	{
		ARMORTEACHFLAG = TRUE;

		if(B_TeachPlayerTalentSmith_RemakeArmor_NoLP(self,other,WEAPON_ITAR_RANGER_ADDON_V1))
		{
			Npc_RemoveInvItems(hero,ItMi_Gold,500);
			b_carl_teacharmor_1();
		};

		b_carlarmorchoices();
	}
	else
	{
		AI_Print(Print_NotEnoughGold);
		AI_Output(self,other,"DIA_Carl_bezahlen_05_03");	//Принеси деньги, тогда начнем обучение.
		AI_StopProcessInfos(self);
	};
};


instance DIA_Carl_PrioratBlade(C_Info)
{
	npc = VLK_461_Carl;
	nr = 1;
	condition = DIA_Carl_PrioratBlade_condition;
	information = DIA_Carl_PrioratBlade_info;
	permanent = FALSE;
	description = "Мне нужна твоя помощь.";
};


func int DIA_Carl_PrioratBlade_condition()
{
	if((MIS_PrioratStart == LOG_Running) && (BladePrioratSeek == TRUE) && (Npc_HasItems(other,ItMw_1H_AssBlade) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Carl_PrioratBlade_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Carl_PrioratBlade_01_01");	//Мне нужна твоя помощь.
	AI_Output(self,other,"DIA_Carl_PrioratBlade_01_02");	//А в чем дело?
	AI_Output(other,self,"DIA_Carl_PrioratBlade_01_03");	//У меня с собой есть очень необычный клинок.
	AI_Output(other,self,"DIA_Carl_PrioratBlade_01_04");	//И мне необходимо узнать, откуда он и кто его сделал.
	AI_Output(self,other,"DIA_Carl_PrioratBlade_01_05");	//(с интересом) Ну ладно. Покажи мне его.
	AI_Output(other,self,"DIA_Carl_PrioratBlade_01_06");	//Вот, держи.
	CreateInvItems(other,ItMw_1H_AssBlade_View,1);
	B_GiveInvItems(other,self,ItMw_1H_AssBlade_View,1);
	AI_UnequipWeapons(self);
	AI_EquipBestMeleeWeapon(self);
	AI_ReadyMeleeWeapon(self);
	AI_PlayAni(self,"T_1HSINSPECT");
	AI_RemoveWeapon(self);
	AI_UnequipWeapons(self);
	AI_Output(self,other,"DIA_Carl_PrioratBlade_01_07");	//(озадаченно) Такое оружие мне еще не приходилось держать в руках.
	AI_Output(self,other,"DIA_Carl_PrioratBlade_01_08");	//Возьми его обратно. Боюсь, я ничем не могу тебе помочь.
	B_LogEntry(TOPIC_PrioratStart,"Кузнец Карл ничего не смог сказать про загадочный клинок.");
};

instance DIA_Carl_FatherNews(C_Info)
{
	npc = VLK_461_Carl;
	nr = 3;
	condition = DIA_Carl_FatherNews_Condition;
	information = DIA_Carl_FatherNews_Info;
	permanent = FALSE;
	description = "У меня есть для тебя весточка от Моригана.";
};

func int DIA_Carl_FatherNews_Condition()
{
	if(MIS_FatherNews == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Carl_FatherNews_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Carl_FatherNews_01_00");	//У меня для тебя весточка от Моригана.
	AI_Output(self,other,"DIA_Carl_FatherNews_01_01");	//(остолбенев) От кого?
	AI_Output(other,self,"DIA_Carl_FatherNews_01_02");	//От Моригана, твоего сына!
	AI_PlayAni(self,"T_STAND_2_SIT");
	AI_Output(self,other,"DIA_Carl_FatherNews_01_03");	//О Иннос! (ошарашенно) Неужели ты услышал мои молитвы?
	AI_PlayAni(self,"T_SIT_2_STAND");
	AI_Output(self,other,"DIA_Carl_FatherNews_01_04");	//Что с ним? Расскажи мне все!
	AI_Output(other,self,"DIA_Carl_FatherNews_01_05");	//Он до сих пор жив, но находится в плену у орков.
	AI_Output(self,other,"DIA_Carl_FatherNews_01_06");	//Проклятье...(с досадой) Не сказать, что это слишком хорошие новости.
	AI_Output(self,other,"DIA_Carl_FatherNews_01_07");	//Но, по крайней мере, у меня все еще остается хоть какая-то надежда увидеть его вновь.
	AI_Output(self,other,"DIA_Carl_FatherNews_01_08");	//Теперь я буду молится каждый день, чтобы Иннос помог мне в этом.
	AI_Output(self,other,"DIA_Carl_FatherNews_01_09");	//Благодарю от всей души! Порадовал старика...
	AI_Output(other,self,"DIA_Carl_FatherNews_01_10");	//Да не за что.
	RT_Respect = RT_Respect + 1;
	MIS_FatherNews = LOG_Success;
	Log_SetTopicStatus(TOPIC_FatherNews,LOG_Success);
	B_LogEntry(TOPIC_FatherNews,"Я передал весточку отцу Моригана. Старик был просто вне себя от счастья, узнав, что его сын до сих пор жив.");
};

instance DIA_Carl_DoCrossBow(C_Info)
{
	npc = VLK_461_Carl;
	nr = 1;
	condition = DIA_Carl_DoCrossBow_condition;
	information = DIA_Carl_DoCrossBow_info;
	permanent = FALSE;
	description = "Ты умеешь делать арбалеты?";
};

func int DIA_Carl_DoCrossBow_condition()
{
	if((MIS_TagNorGrHunWeap == LOG_Running) && (FindSmithTeacherCrBow == TRUE) && (CrossBowNeedPlotnik == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Carl_DoCrossBow_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Carl_DoCrossBow_01_01");	//Ты умеешь делать арбалеты?
	AI_Output(self,other,"DIA_Carl_DoCrossBow_01_02");	//Арбалеты? (удивленно) Ты что - нет, конечно.
	AI_Output(self,other,"DIA_Carl_DoCrossBow_01_03");	//Тебе нужен хороший плотник или столяр.
	AI_Output(self,other,"DIA_Carl_DoCrossBow_01_04");	//Возможно, он сможет помочь тебе в этом деле.
	AI_Output(other,self,"DIA_Carl_DoCrossBow_01_05");	//Понял.
	CrossBowNeedPlotnik = TRUE;
	B_LogEntry(TOPIC_TagNorGrHunWeap,"Делать арбалеты меня сможет научить только плотник или столяр. И где же мне найти такого?");
};

instance DIA_Carl_MySmith(C_Info)
{
	npc = VLK_461_Carl;
	nr = 6;
	condition = DIA_Carl_MySmith_condition;
	information = DIA_Carl_MySmith_info;
	permanent = FALSE;
	description = "Мне нужен кузнец.";
};

func int DIA_Carl_MySmith_condition()
{
	if((HURRAYICANHIRE == TRUE) && (MIS_CarlCoal == LOG_Success) && (CarlNeed == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Carl_MySmith_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Carl_MySmith_01_00");	//Мне нужен кузнец.
	AI_Output(self,other,"DIA_Carl_MySmith_01_01");	//А я, по-твоему, кто?
	AI_Output(other,self,"DIA_Carl_MySmith_01_02");	//Ты не понял. Мне нужен кузнец в моем лагере!
	AI_Output(self,other,"DIA_Carl_MySmith_01_03");	//У тебя есть лагерь?!
	AI_Output(other,self,"DIA_Carl_MySmith_01_04");	//Да, недалеко от фермы Онара, в старой башне.
	AI_Output(self,other,"DIA_Carl_MySmith_01_05");	//Хммм... Неплохо для того, кто сам только недавно бегал в поисках работы.
	AI_Output(self,other,"DIA_Carl_MySmith_01_06");	//Предложение, конечно, заманчивое. Но что мне оно даст?
	AI_Output(other,self,"DIA_Carl_MySmith_01_07");	//Ну ты сам посуди. Какие у тебя тут перспективы? Работы у тебя мало, денег тоже.
	AI_Output(other,self,"DIA_Carl_MySmith_01_08");	//А если учитывать тот факт, что в городе работает такой кузнец, как Харад, то у тебя вообще нет никаких шансов подняться.
	AI_Output(other,self,"DIA_Carl_MySmith_01_09");	//Я же тебе предлагаю кров, пищу и стабильный заработок.
	AI_Output(self,other,"DIA_Carl_MySmith_01_10");	//Тут ты прав. В золоте я, конечно, не купаюсь, но на жизнь пока хватало.
	AI_Output(self,other,"DIA_Carl_MySmith_01_11");	//Ладно, в конце концов, хуже уже не будет. Если вдруг что-то не понравится - вернусь обратно в город.
	AI_Output(self,other,"DIA_Carl_MySmith_01_12");	//И сколько же ты готов мне платить за мою работу?
	AI_Output(other,self,"DIA_Carl_MySmith_01_13");	//Скажем, восемьдесят золотых монет в день. Уверен, ты и половину этой суммы не набирал здесь.
	AI_Output(self,other,"DIA_Carl_MySmith_01_14");	//Какое щедрое предложение с твоей стороны! Хорошо, - считай, что у тебя в лагере появился кузнец. Только дай мне время собраться.
	AI_Output(other,self,"DIA_Carl_MySmith_01_15");	//Тогда увидимся в лагере. Да, и кстати, - паролем для входа туда является фраза 'Драконовы сокровища'.
	AI_Output(self,other,"DIA_Carl_MySmith_01_16");	//Хорошо, я запомню. До встречи!
	B_LogEntry(TOPIC_PPL_FOR_TOWER,"Карл теперь будет работать в моей кузне.");
	self.npcType = NPCTYPE_FRIEND;
	self.aivar[AIV_ToughGuy] = TRUE;
	self.aivar[AIV_IGNORE_Theft] = TRUE;
	self.aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	self.aivar[AIV_IgnoresArmor] = TRUE;
	CARLRECRUITEDDT = TRUE;
	CarlDayHire = Wld_GetDay();
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"InTower");
};

instance DIA_Carl_InTower(C_Info)
{
	npc = VLK_461_Carl;
	nr = 22;
	condition = DIA_Carl_InTower_condition;
	information = DIA_Carl_InTower_info;
	permanent = TRUE;
	description = "Как работается?";
};

func int DIA_Carl_InTower_condition()
{
	if((CARLRECRUITEDDT == TRUE) && (KAPITELORCATC == FALSE) && (Npc_GetDistToWP(self,"NW_CASTLEMINE_TOWER_01") < 5000))
	{
		return TRUE;
	};
};

func void DIA_Carl_InTower_info()
{
	AI_Output(other,self,"DIA_Carl_InTower_15_00");	//Как работается?
	AI_Output(self,other,"DIA_Carl_InTower_01_01");	//Отлично! Жаловаться не на что.
};

instance DIA_Carl_SharpKnife(C_Info)
{
	npc = VLK_461_Carl;
	nr = 1;
	condition = DIA_Carl_SharpKnife_Condition;
	information = DIA_Carl_SharpKnife_Info;
	permanent = TRUE;
	description = "Мне нужно, чтобы ты заточил этот нож.";
};

func int DIA_Carl_SharpKnife_Condition()
{
	if((MIS_Hilda_SharpKnife == LOG_Running) && Wld_IsTime(6,10,19,55) && (HildaSharpKnife == FALSE) && (Npc_HasItems(other,ItMi_HildaKnife) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Carl_SharpKnife_Info()
{
	AI_Output(other,self,"DIA_Carl_SharpKnife_15_00");	//Мне нужно, чтобы ты заточил этот нож.
	AI_Output(self,other,"DIA_Carl_SharpKnife_04_01");	//Конечно. Но это будет стоить тебе пять золотых.
	Info_ClearChoices(DIA_Carl_SharpKnife);

	if(Npc_HasItems(other,ItMi_Gold) >= 5)
	{
		Info_AddChoice(DIA_Carl_SharpKnife,"Вот золото.",DIA_Carl_SharpKnife_Ok);
	};

	Info_AddChoice(DIA_Carl_SharpKnife,"У меня нет таких денег.",DIA_Carl_SharpKnife_No);

};

func void DIA_Carl_SharpKnife_Ok()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Carl_SharpKnife_Ok_15_00");	//Вот золото.
	B_GiveInvItems(other,self,ItMi_Gold,5);
	Npc_RemoveInvItems(self,ItMi_Gold,5);
	AI_Output(self,other,"DIA_Carl_SharpKnife_Ok_04_01");	//Хорошо! Подожди минутку...
	AI_Output(self,other,"DIA_Carl_SharpKnife_Ok_04_02");	//...ну, вот и все. Теперь этот нож острее бритвы!
	HildaSharpKnife = TRUE;
	B_LogEntry(TOPIC_Hilda_SharpKnife,"Кузнец Карл заточил для меня нож Хильды.");
	Info_ClearChoices(DIA_Carl_SharpKnife);
};

func void DIA_Carl_SharpKnife_No()
{
	AI_Output(other,self,"DIA_Carl_SharpKnife_No_15_00");	//У меня нет таких денег.
	AI_Output(self,other,"DIA_Carl_SharpKnife_No_04_01");	//Извини, тогда ничем не могу помочь.
	Info_ClearChoices(DIA_Carl_SharpKnife);
};