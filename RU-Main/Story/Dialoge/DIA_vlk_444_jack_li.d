
instance DIA_JACK_LI_KAP3_EXIT(C_Info)
{
	npc = vlk_444_jack_li;
	nr = 999;
	condition = dia_jack_li_kap3_exit_condition;
	information = dia_jack_li_kap3_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_jack_li_kap3_exit_condition()
{
	return TRUE;
};

func void dia_jack_li_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JACK_LI_PICKPOCKET(C_Info)
{
	npc = vlk_444_jack_li;
	nr = 900;
	condition = dia_jack_li_pickpocket_condition;
	information = dia_jack_li_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_jack_li_pickpocket_condition()
{
	return C_Beklauen(76,120);
};

func void dia_jack_li_pickpocket_info()
{
	Info_ClearChoices(dia_jack_li_pickpocket);
	Info_AddChoice(dia_jack_li_pickpocket,Dialog_Back,dia_jack_li_pickpocket_back);
	Info_AddChoice(dia_jack_li_pickpocket,DIALOG_PICKPOCKET,dia_jack_li_pickpocket_doit);
};

func void dia_jack_li_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_jack_li_pickpocket);
};

func void dia_jack_li_pickpocket_back()
{
	Info_ClearChoices(dia_jack_li_pickpocket);
};


instance DIA_JACK_LI_STORM(C_Info)
{
	npc = vlk_444_jack_li;
	nr = 1;
	condition = dia_jack_li_storm_condition;
	information = dia_jack_li_storm_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_jack_li_storm_condition()
{
	return TRUE;
};

func void dia_jack_li_storm_info()
{
	AI_Output(self,other,"DIA_Jack_LI_Storm_01_01");	//Наконец-то ты пришел в себя! Как ты себя чувствуешь?
	AI_Output(other,self,"DIA_Jack_LI_Storm_01_02");	//Голова раскалывается, как будто по ней ударили чем-то тяжелым!
	AI_Output(self,other,"DIA_Jack_LI_Storm_01_03");	//Да уж, приятель...(смеется) Тебе прилично досталось.
	AI_Output(other,self,"DIA_Jack_LI_Storm_01_04");	//Что случилось?
	AI_Output(self,other,"DIA_Jack_LI_Storm_01_07");	//Во время шторма ты помогал мне управляться со штурвалом, и все шло хорошо...
	AI_Output(self,other,"DIA_Jack_LI_Storm_01_08");	//Но в самый его разгар одна из волн с такой силой обрушилась на наш корабль, что сбила тебя с ног и отбросила на фальшборт!
	AI_Output(self,other,"DIA_Jack_LI_Storm_01_09");	//Видимо, ты очень сильно ударился об него головой, поскольку сразу же потерял сознание.
	AI_Output(self,other,"DIA_Jack_LI_Storm_01_11");	//Мне с ребятами только чудом удалось вовремя подоспеть к тебе, чтобы оттащить от края. Иначе следующей же волной твое бесчувственное тело смыло бы за борт.
	AI_Output(self,other,"DIA_Jack_LI_Storm_01_13");	//(вне себя) Черт! Да этот шторм вообще чуть не отправил всех нас на тот свет!
	AI_Output(other,self,"DIA_Jack_LI_Storm_01_14");	//Но, кажется, все обошлось.
	AI_Output(self,other,"DIA_Jack_LI_Storm_01_15");	//Да уж, обошлось. Благодари Инноса, что мы наткнулись на этот остров. Еще немного - и наш корабль разломился бы надвое.
	AI_Output(self,other,"DIA_Jack_LI_Storm_01_20");	//Эх, ладно... По крайней мере, в этой бухте можно чувствовать себя в полной безопасности.
	AI_Output(self,other,"DIA_Jack_LI_Storm_01_23");	//Но радоваться еще рано. Теперь надо подумать, как починить наш корабль.
	AI_Output(other,self,"DIA_Jack_LI_Storm_01_24");	//А разве он нуждается в ремонте?
	AI_Output(self,other,"DIA_Jack_LI_Storm_01_25");	//Еще бы! Шторм его прилично потрепал.
	AI_Output(self,other,"DIA_Jack_LI_Storm_01_26");	//Пару дыр залатать, конечно, не проблема, но у нас сломан руль. А без него мы далеко не уплывем.
	AI_Output(other,self,"DIA_Jack_LI_Storm_01_27");	//Сколько это займет времени?
	AI_Output(self,other,"DIA_Jack_LI_Storm_01_28");	//Может, пару дней, а может, и неделю. Точно не могу сказать.
};


instance DIA_JACK_LI_REPAIR(C_Info)
{
	npc = vlk_444_jack_li;
	nr = 3;
	condition = dia_jack_li_repair_condition;
	information = dia_jack_li_repair_info;
	permanent = FALSE;
	description = "Могу ли я чем-то помочь тебе с ремонтом?";
};


func int dia_jack_li_repair_condition()
{
	if(Npc_KnowsInfo(hero,dia_jack_li_storm))
	{
		return TRUE;
	};
};

func void dia_jack_li_repair_info()
{
	AI_Output(other,self,"DIA_Jack_LI_Repair_01_01");	//Могу ли я чем-то помочь тебе с ремонтом?
	AI_Output(self,other,"DIA_Jack_LI_Repair_01_02");	//(задумчиво) Даже не знаю. Сперва я должен получше осмотреть повреждения, а потом еще придумать, как их поправить.
	AI_Output(self,other,"DIA_Jack_LI_Repair_01_04");	//Так что сейчас твоя помощь вряд ли мне пригодится. Если только позже.
	TORLOFLITIMER = Wld_GetDay();
	MIS_REPAIRSHIP = LOG_Running;
	Log_CreateTopic(TOPIC_REPAIRSHIP,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_REPAIRSHIP,LOG_Running);
	B_LogEntry(TOPIC_REPAIRSHIP,"Я предложил Джеку помочь ему с ремонтом корабля. Он ответил, что вначале ему нужно осмотреть все повреждения и решить, как это можно исправить. Так что пока Джеку моя помощь не нужна. Надо спросить его об этом чуть позже.");
};


instance DIA_JACK_LI_REPAIRHELP(C_Info)
{
	npc = vlk_444_jack_li;
	nr = 3;
	condition = dia_jack_li_repairhelp_condition;
	information = dia_jack_li_repairhelp_info;
	permanent = FALSE;
	description = "Как продвигается ремонт корабля?";
};


func int dia_jack_li_repairhelp_condition()
{
	var int daynow;
	daynow = Wld_GetDay();
	if((MIS_REPAIRSHIP == LOG_Running) && (TORLOFLITIMER <= (daynow - 2)))
	{
		return TRUE;
	};
};

func void dia_jack_li_repairhelp_info()
{
	AI_Output(other,self,"DIA_Jack_LI_RepairHelp_01_01");	//Как продвигается ремонт корабля?
	AI_Output(self,other,"DIA_Jack_LI_RepairHelp_01_02");	//Хорошо, что поинтересовался. Похоже, мне все-таки понадобится твоя помощь.
	AI_Output(other,self,"DIA_Jack_LI_RepairHelp_01_03");	//Конечно, нет проблем.
	AI_Output(self,other,"DIA_Jack_LI_RepairHelp_01_04");	//Тогда сразу перейдем к делу.
	AI_Output(self,other,"DIA_Jack_LI_RepairHelp_01_05");	//За эти дни я осмотрел все повреждения на корабле и пришел к выводу, что большинство из них совсем незначительные.
	AI_Output(self,other,"DIA_Jack_LI_RepairHelp_01_06");	//С ними я и сам справлюсь. Но у нас есть и одна серьезная проблема - это наш штурвал.
	AI_Output(self,other,"DIA_Jack_LI_RepairHelp_01_08");	//Он вообще не работает! Похоже, его полностью сорвало. А без него, как ты понимаешь, корабль абсолютно неуправляем!
	AI_Output(other,self,"DIA_Jack_LI_RepairHelp_01_10");	//И что будем делать?
	AI_Output(self,other,"DIA_Jack_LI_RepairHelp_01_11");	//Мне думается, что вся эта проблема в одной из шестеренок.
	AI_Output(self,other,"DIA_Jack_LI_RepairHelp_01_12");	//Наверное, во время шторма у нее сорвало зубья, и по этой причине наш штурвал и потерял управление.
	AI_Output(self,other,"DIA_Jack_LI_RepairHelp_01_13");	//Так что, если мы сможем найти ей замену, то наверняка решим эту проблему.
	AI_Output(other,self,"DIA_Jack_LI_RepairHelp_01_14");	//Но где мы возьмем новую шестеренку?
	AI_Output(self,other,"DIA_Jack_LI_RepairHelp_01_15");	//Именно этим я и хотел попросить тебя заняться. Может, тебе повезет, и ты сможешь найти подходящую вещицу.
	AI_Output(other,self,"DIA_Jack_LI_RepairHelp_01_16");	//Это будет непросто.
	AI_Output(self,other,"DIA_Jack_LI_RepairHelp_01_17");	//Я понимаю, но другого выхода у нас нет. Иначе мы тут застрянем надолго!
	AI_Output(other,self,"DIA_Jack_LI_RepairHelp_01_18");	//Ладно, попробую поискать что-нибудь подходящее.
	AI_Output(self,other,"DIA_Jack_LI_RepairHelp_01_19");	//Вот и отлично. А я, чтобы не терять времени зря, займусь починкой остальных повреждений.
	B_LogEntry(TOPIC_REPAIRSHIP,"Джек попросил меня помочь ему со штурвалом, который был сломан во время шторма. У него сорвало одну из шестеренок,  и теперь корабль совершенно неуправляем. Джек попросил меня поискать замену этой детали - какую-нибудь вещь, которая могла бы послужить в качестве шестеренки.");
};


instance DIA_JACK_LI_REPAIRHELPDONE(C_Info)
{
	npc = vlk_444_jack_li;
	nr = 3;
	condition = dia_jack_li_repairhelpdone_condition;
	information = dia_jack_li_repairhelpdone_info;
	permanent = FALSE;
	description = "Я тут нашел кое-что.";
};


func int dia_jack_li_repairhelpdone_condition()
{
	var int daynow;
	daynow = Wld_GetDay();
	if((MIS_REPAIRSHIP == LOG_Running) && Npc_KnowsInfo(hero,dia_jack_li_repairhelp) && (Npc_HasItems(hero,itmi_stuff_gearwheel_02) >= 1))
	{
		return TRUE;
	};
};

func void dia_jack_li_repairhelpdone_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Jack_LI_RepairHelpDone_01_01");	//Я тут нашел кое-что.
	AI_Output(self,other,"DIA_Jack_LI_RepairHelpDone_01_02");	//Что именно?
	AI_Output(other,self,"DIA_Jack_LI_RepairHelpDone_01_03");	//Вот, взгляни.
	B_GiveInvItems(other,self,itmi_stuff_gearwheel_02,1);
	AI_Output(self,other,"DIA_Jack_LI_RepairHelpDone_01_04");	//Какая интересная штуковина! Где ты ее откопал?
	AI_Output(other,self,"DIA_Jack_LI_RepairHelpDone_01_05");	//В небольшой пирамиде, расположенной на острове.
	AI_Output(other,self,"DIA_Jack_LI_RepairHelpDone_01_07");	//Она подойдет в качестве шестеренки?
	AI_Output(self,other,"DIA_Jack_LI_RepairHelpDone_01_08");	//Хммм...(задумчиво) Сейчас поглядим.
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,"SHIP_EXTRO");
	AI_AlignToWP(self);
	AI_PlayAni(self,"T_PLUNDER");
	AI_GotoNpc(self,hero);
	AI_TurnToNPC(self,other);
	AI_LookAtNpc(self,other);
	AI_Output(other,self,"DIA_Jack_LI_RepairHelpDone_01_09");	//Ну как?
	AI_Output(self,other,"DIA_Jack_LI_RepairHelpDone_01_10");	//Невероятно! Похоже, она действительно подходит!
	AI_Output(other,self,"DIA_Jack_LI_RepairHelpDone_01_11");	//Значит, наш штурвал теперь в порядке?
	AI_Output(self,other,"DIA_Jack_LI_RepairHelpDone_01_12");	//Подожди, одну секундочку... Это надо проверить.
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,"SHIP_EXTRO");
	AI_AlignToWP(self);
	AI_PlayAni(self,"T_PLUNDER");
	AI_GotoNpc(self,hero);
	AI_TurnToNPC(self,other);
	AI_LookAtNpc(self,other);
	AI_Output(other,self,"DIA_Jack_LI_RepairHelpDone_01_13");	//И?
	AI_Output(self,other,"DIA_Jack_LI_RepairHelpDone_01_14");	//Да. Кажется, все в порядке. Правда, управление стало немного туговатым, но это мы как-нибудь переживем.
	AI_Output(self,other,"DIA_Jack_LI_RepairHelpDone_01_15");	//Главное, что теперь мы сможем смыться с этого острова!
	AI_Output(other,self,"DIA_Jack_LI_RepairHelpDone_01_16");	//Это отличная новость. Когда отчаливаем?
	MIS_REPAIRSHIP = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_REPAIRSHIP,LOG_SUCCESS);
	B_LogEntry(TOPIC_REPAIRSHIP,"Я принес Джеку найденный мной кусок камня в виде шестеренки. И к его большому удивлению, эта вещь отлично подошла на роль шестеренки для нашего штурвала.");

	if((MIS_LOSTISLAND == LOG_SUCCESS) && (MIS_REPAIRSHIP == LOG_SUCCESS) && (MIS_CHANGECOURSE == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Jack_LI_RepairHelpDone_01_17");	//Да хоть прямо сейчас!

		if(((Gorn_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_fighter_li) == FALSE) && (GORNLIHERE == TRUE)) || ((MiltenNW_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_mage_li) == FALSE) && (MILTENLIHERE == TRUE)) || ((Lester_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_psionic_li) == FALSE) && (LESTERLIHERE == TRUE)) || ((Diego_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_thief_li) == FALSE) && (DIEGOLIHERE == TRUE)) || ((Angar_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(djg_705_angar_li) == FALSE) && (ANGARLIHERE == TRUE)))
		{
			AI_Output(self,other,"DIA_Jack_LI_RepairHelpDone_01_18");	//Только вначале надо сообщить парням на берегу, что мы снимаемся с якоря.
			AI_Output(self,other,"DIA_Jack_LI_RepairHelpDone_01_19");	//Не будем же мы их бросать тут! (смеется)
			AI_Output(other,self,"DIA_Jack_LI_RepairHelpDone_01_20");	//Хорошо, я передам им.
			CANAWAYFROMLI = TRUE;
			MIS_GATHERCREW = LOG_Running;
			Log_CreateTopic(TOPIC_GATHERCREW,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_GATHERCREW,LOG_Running);
			Log_AddEntry(TOPIC_GATHERCREW,"Джек попросил меня сообщить всем парням на берегу, что мы снимаемся с якоря.");
		}
		else
		{
			AI_Output(self,other,"DIA_Jack_LI_RepairHelpDone_01_21");	//Так что только скажи - и мы сразу же поднимем паруса.
			AI_Output(other,self,"DIA_Jack_LI_RepairHelpDone_01_22");	//Хорошо.
			CANAWAYFROMLI = TRUE;
			NOPEOPLEONLANDLI = TRUE;
		};
	}
	else
	{
		TORLOFLITIMERAWAY = Wld_GetDay();
		AI_Output(self,other,"DIA_Jack_LI_RepairHelpDone_01_23");	//Не так быстро, приятель! Штурвал, конечно, теперь в порядке, но это еще не означает, что корабль готов к отплытию.
		AI_Output(self,other,"DIA_Jack_LI_RepairHelpDone_01_24");	//Я еще не успел починить кое-какие другие небольшие повреждения, а выходить в море как следует не подготовившись - дело опасное!

		if(MIS_LOSTISLAND == LOG_Running)
		{
			AI_Output(self,other,"DIA_Jack_LI_RepairHelpDone_01_25");	//Тем более мы еще до сих пор не знаем - где находимся!
		}
		else if(MIS_CHANGECOURSE == LOG_Running)
		{
			AI_Output(self,other,"DIA_Jack_LI_RepairHelpDone_01_26");	//Тем более мы еще до сих не решили - куда нам плыть.
		};

		AI_Output(self,other,"DIA_Jack_LI_RepairHelpDone_01_27");	//Так что спешить не будем.
		AI_Output(other,self,"DIA_Jack_LI_RepairHelpDone_01_28");	//Ладно, тогда сам скажешь.
	};
};


instance DIA_JACK_LI_AWAY(C_Info)
{
	npc = vlk_444_jack_li;
	nr = 3;
	condition = dia_jack_li_away_condition;
	information = dia_jack_li_away_info;
	permanent = TRUE;
	description = "Когда отплываем?";
};

func int dia_jack_li_away_condition()
{
	var int daynow;
	daynow = Wld_GetDay();

	if((MIS_REPAIRSHIP == LOG_SUCCESS) && (CANAWAYFROMLI == FALSE) && (TORLOFLITIMERAWAY <= (daynow - 1)))
	{
		return TRUE;
	};
};

func void dia_jack_li_away_info()
{
	AI_Output(other,self,"DIA_Jack_LI_Away_01_00");	//Когда отплываем?

	if((MIS_LOSTISLAND == LOG_SUCCESS) && (MIS_REPAIRSHIP == LOG_SUCCESS) && (MIS_CHANGECOURSE == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Jack_LI_Away_01_01");	//Да хоть прямо сейчас!

		if(((Gorn_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_fighter_li) == FALSE) && (GORNLIHERE == TRUE)) || ((MiltenNW_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_mage_li) == FALSE) && (MILTENLIHERE == TRUE)) || ((Lester_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_psionic_li) == FALSE) && (LESTERLIHERE == TRUE)) || ((Diego_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_thief_li) == FALSE) && (DIEGOLIHERE == TRUE)) || ((Angar_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(djg_705_angar_li) == FALSE) && (ANGARLIHERE == TRUE)))
		{
			AI_Output(self,other,"DIA_Jack_LI_Away_01_02");	//Только вначале надо сообщить парням на берегу, что мы снимаемся с якоря.
			AI_Output(self,other,"DIA_Jack_LI_Away_01_03");	//Не будем же мы их бросать тут! (смеется)
			AI_Output(other,self,"DIA_Jack_LI_Away_01_04");	//Хорошо, я им передам.
			CANAWAYFROMLI = TRUE;
			MIS_GATHERCREW = LOG_Running;
			Log_CreateTopic(TOPIC_GATHERCREW,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_GATHERCREW,LOG_Running);
			B_LogEntry(TOPIC_GATHERCREW,"Джек попросил меня сообщить всем парням на берегу, что мы снимаемся с якоря.");
		}
		else
		{
			AI_Output(self,other,"DIA_Jack_LI_Away_01_05");	//Так что только скажи - и мы сразу же поднимем паруса.
			AI_Output(other,self,"DIA_Jack_LI_Away_01_06");	//Хорошо.
			CANAWAYFROMLI = TRUE;
			NOPEOPLEONLANDLI = TRUE;
		};
	}
	else if(MIS_LOSTISLAND == LOG_Running)
	{
		AI_Output(self,other,"DIA_Jack_LI_Away_01_07");	//Но мы же так и не выяснили, где находимся!
		AI_Output(self,other,"DIA_Jack_LI_Away_01_08");	//Так что об этом пока рано думать.
		AI_Output(other,self,"DIA_Jack_LI_Away_01_09");	//Как скажешь.
	}
	else if(MIS_CHANGECOURSE == LOG_Running)
	{
		AI_Output(self,other,"DIA_Jack_LI_Away_01_10");	//Но мы же до сих пор не решили, куда нам плыть!
		AI_Output(self,other,"DIA_Jack_LI_Away_01_11");	//Так что об этом пока рано думать.
		AI_Output(other,self,"DIA_Jack_LI_Away_01_12");	//Как скажешь.
	}
	else
	{
		AI_Output(self,other,"DIA_Jack_LI_Away_01_13");	//Пока я не закончу с ремонтом корабля, об этом рано думать.
		AI_Output(self,other,"DIA_Jack_LI_Away_01_14");	//Так что лучше займись пока каким-нибудь полезным делом.
		AI_Output(other,self,"DIA_Jack_LI_Away_01_15");	//Как скажешь.
	};
};

instance DIA_JACK_LI_AWAYDONE(C_Info)
{
	npc = vlk_444_jack_li;
	nr = 3;
	condition = dia_jack_li_awaydone_condition;
	information = dia_jack_li_awaydone_info;
	permanent = TRUE;
	description = "Пора отправляться.";
};

func int dia_jack_li_awaydone_condition()
{
	var int daynow;
	daynow = Wld_GetDay();

	if((CANAWAYFROMLI == TRUE) && (CAPITANORDERLIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void dia_jack_li_awaydone_info()
{
	var int crewlicountmiss;
	var string concatText;
	var string text;
	var string text2;
	AI_Output(other,self,"DIA_Jack_LI_AwayDone_01_00");	//Пора отправляться.
	if(NOPEOPLEONLANDLI == TRUE)
	{
		AI_Output(self,other,"DIA_Jack_LI_AwayDone_01_01");	//Хорошо! Снимаемся с якоря.
		AI_Output(self,other,"DIA_Jack_LI_AwayDone_01_02");	//А ты пока можешь пойти и отдохнуть у себя в каюте. Небось, набегался за последние дни?
		AI_Output(other,self,"DIA_Jack_LI_AwayDone_01_03");	//Есть немного.
		AI_Output(self,other,"DIA_Jack_LI_AwayDone_01_04");	//Ну, тогда иди поспи. А мы скоро отправимся.
		CAPITANORDERLIAWAY = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		if((Gorn_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_fighter_li) == FALSE) && (GORNLIONBOARD == TRUE) && (GORNLIHERE == TRUE) && (GORNLIHEREDONE == FALSE))
		{
			Npc_ExchangeRoutine(pc_fighter_li,"RunAway");
			AI_Teleport(pc_fighter_li,"SHIP_DECK_03");
			GORNLIHEREDONE = TRUE;
		};
		if((MiltenNW_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_mage_li) == FALSE) && (MILTENLIONBOARD == TRUE) && (MILTENLIHERE == TRUE) && (MILTENLIHEREDONE == FALSE))
		{
			Npc_ExchangeRoutine(pc_mage_li,"RunAway");
			AI_Teleport(pc_mage_li,"SHIP_CREW_19");
			MILTENLIHEREDONE = TRUE;
		};
		if((Lester_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_psionic_li) == FALSE) && (LESTERLIONBOARD == TRUE) && (LESTERLIHERE == TRUE) && (LESTERLIHEREDONE == FALSE))
		{
			Npc_ExchangeRoutine(pc_psionic_li,"RunAway");
			AI_Teleport(pc_psionic_li,"SHIP_DECK_28");
			LESTERLIHEREDONE = TRUE;
		};
		if((Diego_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_thief_li) == FALSE) && (DIEGOLIONBOARD == TRUE) && (DIEGOLIHERE == TRUE) && (DIEGOLIHEREDONE == FALSE))
		{
			Npc_ExchangeRoutine(pc_thief_li,"RunAway");
			AI_Teleport(pc_thief_li,"SHIP_CREW_04");
			DIEGOLIHEREDONE = TRUE;
		};
		if((Angar_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(djg_705_angar_li) == FALSE) && (ANGARLIONBOARD == TRUE) && (ANGARLIHERE == TRUE) && (ANGARLIHEREDONE == FALSE))
		{
			Npc_ExchangeRoutine(djg_705_angar_li,"RunAway");
			AI_Teleport(djg_705_angar_li,"SHIP_CREW_03");
			ANGARLIHEREDONE = TRUE;
		};
		if(LICREWONBOARD == TRUE)
		{
			B_GivePlayerXP(500);
			AI_Output(self,other,"DIA_Jack_LI_AwayDone_01_06");	//Хорошо. Вроде, все парни на корабле, а значит, можно сниматься с якоря.
			AI_Output(self,other,"DIA_Jack_LI_AwayDone_01_07");	//А ты пока можешь пойти и отдохнуть у себя в каюте. Небось, набегался за последние дни?
			AI_Output(other,self,"DIA_Jack_LI_AwayDone_01_08");	//Есть немного.
			AI_Output(self,other,"DIA_Jack_LI_AwayDone_01_09");	//Ну, тогда иди поспи. А мы скоро отправимся.
			CAPITANORDERLIAWAY = TRUE;
			MIS_GATHERCREW = LOG_SUCCESS;
			Log_SetTopicStatus(TOPIC_GATHERCREW,LOG_SUCCESS);
			B_LogEntry(TOPIC_GATHERCREW,"Вся команда на корабле и теперь можно отправляться в путь!");
			AI_StopProcessInfos(self);
		}
		else
		{
			AI_Output(self,other,"DIA_Jack_LI_AwayDone_01_11");	//Но ведь еще не все парни вернулись с берега! Мы не можем их бросить.
			AI_Output(other,self,"DIA_Jack_LI_AwayDone_01_12");	//А кто отсутствует?
			AI_Output(self,other,"DIA_Jack_LI_AwayDone_01_13");	//Хммм, кажется нет...(осматриваясь)
			if((Gorn_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_fighter_li) == FALSE) && (GORNLIHERE == TRUE) && (GORNLIONBOARD == FALSE))
			{
				AI_Output(self,other,"DIA_Jack_LI_AwayDone_01_14");	//...Горна
				crewlicountmiss = crewlicountmiss + 1;
			};
			if((MiltenNW_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_mage_li) == FALSE) && (MILTENLIHERE == TRUE) && (MILTENLIONBOARD == FALSE))
			{
				if(crewlicountmiss > 0)
				{
					concatText = ConcatStrings(concatText,text2);
				};
				AI_Output(self,other,"DIA_Jack_LI_AwayDone_01_15");	//...Милтена
				crewlicountmiss = crewlicountmiss + 1;
			};
			if((Lester_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_psionic_li) == FALSE) && (LESTERLIHERE == TRUE) && (LESTERLIONBOARD == FALSE))
			{
				if(crewlicountmiss > 0)
				{
					concatText = ConcatStrings(concatText,text2);
				};
				AI_Output(self,other,"DIA_Jack_LI_AwayDone_01_16");	//...Лестера
				crewlicountmiss = crewlicountmiss + 1;
			};
			if((Diego_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_thief_li) == FALSE) && (DIEGOLIHERE == TRUE) && (DIEGOLIONBOARD == FALSE))
			{
				if(crewlicountmiss > 0)
				{
					concatText = ConcatStrings(concatText,text2);
				};
				AI_Output(self,other,"DIA_Jack_LI_AwayDone_01_17");	//...Диего
				crewlicountmiss = crewlicountmiss + 1;
			};
			if((Angar_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(djg_705_angar_li) == FALSE) && (ANGARLIHERE == TRUE) && (ANGARLIONBOARD == FALSE))
			{
				if(crewlicountmiss > 0)
				{
					concatText = ConcatStrings(concatText,text2);
				};
				AI_Output(self,other,"DIA_Jack_LI_AwayDone_01_18");	//...Кор Ангара
				crewlicountmiss = crewlicountmiss + 1;
			};
			AI_Output(self,other,"DIA_Jack_LI_AwayDone_01_19");	//Остальные парни, вроде бы, на месте.
			if(crewlicountmiss >= 2)
			{
				AI_Output(other,self,"DIA_Jack_LI_AwayDone_01_20");	//Я передам им, чтобы возвращались на корабль.
			}
			else
			{
				AI_Output(other,self,"DIA_Jack_LI_AwayDone_01_21");	//Я передам ему, чтобы возвращался на корабль.
			};
		};
	};
};


instance DIA_JACK_LI_ISLAND(C_Info)
{
	npc = vlk_444_jack_li;
	nr = 1;
	condition = dia_jack_li_island_condition;
	information = dia_jack_li_island_info;
	permanent = FALSE;
	description = "Где мы и что это за остров?";
};


func int dia_jack_li_island_condition()
{
	if(Npc_KnowsInfo(hero,dia_jack_li_storm))
	{
		return TRUE;
	};
};

func void dia_jack_li_island_info()
{
	AI_Output(other,self,"DIA_Jack_LI_Island_01_01");	//Где мы и что это за остров?
	AI_Output(self,other,"DIA_Jack_LI_Island_01_02");	//Мне-то почем знать, приятель? (смеется) Я этот остров так же, как и ты, вижу впервые! Не имею представления, где мы находимся.
	AI_Output(other,self,"DIA_Jack_LI_Island_01_04");	//Выходит, мы серьезно заплутали.
	AI_Output(self,other,"DIA_Jack_LI_Island_01_05");	//Похоже на то. Один только Иннос знает, куда нас занесло.
	AI_Output(self,other,"DIA_Jack_LI_Island_01_06");	//Конечно, можно поплыть наугад, но, боюсь, добром это не кончится.
	AI_Output(other,self,"DIA_Jack_LI_Island_01_07");	//И что будем делать?
	AI_Output(self,other,"DIA_Jack_LI_Island_01_13");	//Нам надо понять, в какой части океана мы очутились - тогда мы сможем вернуться на прежний курс.
	AI_Output(other,self,"DIA_Jack_LI_Island_01_14");	//Вот только каким образом?
	AI_Output(self,other,"DIA_Jack_LI_Island_01_15");	//Не знаю... Возможно, стоит прогуляться по самому острову. А там, глядишь, что-нибудь и прояснится.
	MIS_LOSTISLAND = LOG_Running;
	Log_CreateTopic(TOPIC_LOSTISLAND,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LOSTISLAND,LOG_Running);
	B_LogEntry(TOPIC_LOSTISLAND,"Похоже, мы основательно заблудились. Наш капитан абсолютно не имеет понятия о том, что это за остров и где мы очутились. Единственное, что мы можем сделать в этой ситуации, это попробовать самостоятельно во всем разобраться и выяснить, где мы находимся.");
	Log_AddEntry(TOPIC_LOSTISLAND,"Поговорив с Джеком на эту тему, мы пришли к обоюдному согласию, что для начала стоило бы просто наведаться на этот загадочный остров и тщательно его осмотреть. Возможно, там что-нибудь и удастся выяснить.");
};


instance DIA_JACK_LI_ISLANDPROGRESS(C_Info)
{
	npc = vlk_444_jack_li;
	nr = 1;
	condition = dia_jack_li_islandprogress_condition;
	information = dia_jack_li_islandprogress_info;
	permanent = FALSE;
	description = "Посмотри, я нашел эту плитку.";
};


func int dia_jack_li_islandprogress_condition()
{
	if((MIS_LOSTISLAND == LOG_Running) && (Npc_HasItems(hero,itwr_lostislandmap) >= 1))
	{
		return TRUE;
	};
};

func void dia_jack_li_islandprogress_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Jack_LI_IslandProgress_01_00");	//Посмотри, я нашел эту плитку.
	AI_Output(self,other,"DIA_Jack_LI_IslandProgress_01_01");	//Какая занятная штука! Похоже, везет тебе на подобные вещи...(смеется)
	AI_Output(other,self,"DIA_Jack_LI_IslandProgress_01_03");	//На ней изображены какие-то странные символы. Что они означают, я так и не понял.
	AI_Output(self,other,"DIA_Jack_LI_IslandProgress_01_05");	//Дай мне посмотреть.
	AI_Output(other,self,"DIA_Jack_LI_IslandProgress_01_06");	//Вот, держи.
	B_GiveInvItems(other,self,itwr_lostislandmap,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Jack_LI_IslandProgress_01_07");	//Хммм...(задумчиво) Все это очень странно.
	AI_Output(self,other,"DIA_Jack_LI_IslandProgress_01_08");	//Хотя если приглядеться получше, то все это очень смахивает на...(нерешительно)
	AI_Output(other,self,"DIA_Jack_LI_IslandProgress_01_09");	//На что?
	AI_Output(self,other,"DIA_Jack_LI_IslandProgress_01_10");	//Точно не уверен, но это каменная плитка немного напоминает карту.
	AI_Output(other,self,"DIA_Jack_LI_IslandProgress_01_11");	//Карту?
	AI_Output(self,other,"DIA_Jack_LI_IslandProgress_01_12");	//Да! Вот только что она показывает, не совсем понятно.
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Jack_LI_IslandProgress_01_13");	//Похоже, тут еще выбиты какие-то цифры. Возможно, они и есть ключ к расшифровке того, что изображено на самой карте.
	AI_Output(other,self,"DIA_Jack_LI_IslandProgress_01_14");	//А как нам это понять?
	AI_Output(self,other,"DIA_Jack_LI_IslandProgress_01_15");	//Пока не знаю! Хотя... у меня есть подозрение, что эти цифры означают широту и долготу этого острова.
	AI_Output(self,other,"DIA_Jack_LI_IslandProgress_01_18");	//Если окажется именно так, то мы без труда сможем определить - где мы сейчас находимся. Правда для этого мне бы понадобился морской секстант.
	AI_Output(other,self,"DIA_Jack_LI_IslandProgress_01_20");	//А это проблема?
	AI_Output(self,other,"DIA_Jack_LI_IslandProgress_01_21");	//Да, поскольку у меня его попросту нет. А без него я не смогу сделать точные расчеты.
	AI_Output(other,self,"DIA_Jack_LI_IslandProgress_01_22");	//Хорошо. Я попробую найти его.
	AI_Output(self,other,"DIA_Jack_LI_IslandProgress_01_23");	//Попробуй. Хотя и не думаю, что здесь, на острове можно его отыскать. Но, может, тебе как всегда повезет...(смеется)
	CAPNEEDSEXTANT = TRUE;
	B_LogEntry(TOPIC_LOSTISLAND,"Я показал Джеку каменную плитку, которую нашел в древних развалинах на острове. Он внимательно осмотрел ее и предположил, что на плитке изображена некая таинственная карта. Кроме того, на обратной стороне этой таблички нацарапано несколько цифр, которые могут означать что-то очень важное - например, широту и долготу острова. Однако, чтобы проверить эту версию, Джеку нужен секстант, иначе его расчеты будут неточны.");
};


instance DIA_JACK_LI_ISLANDPROGRESSNEXT(C_Info)
{
	npc = vlk_444_jack_li;
	nr = 1;
	condition = dia_jack_li_islandprogressnext_condition;
	information = dia_jack_li_islandprogressnext_info;
	permanent = FALSE;
	description = "У меня есть секстант.";
};


func int dia_jack_li_islandprogressnext_condition()
{
	if((MIS_LOSTISLAND == LOG_Running) && (CAPNEEDSEXTANT == TRUE) && (Npc_HasItems(hero,ItMi_Sextant) >= 1))
	{
		return TRUE;
	};
};

func void dia_jack_li_islandprogressnext_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Jack_LI_IslandProgressNext_01_00");	//У меня есть секстант.
	AI_Output(self,other,"DIA_Jack_LI_IslandProgressNext_01_01");	//(удивленно) Правда? Но откуда он у тебя?
	AI_Output(other,self,"DIA_Jack_LI_IslandProgressNext_01_02");	//Не важно.
	AI_Output(self,other,"DIA_Jack_LI_IslandProgressNext_01_03");	//Ну ладно. Давай его сюда.
	AI_Output(other,self,"DIA_Jack_LI_IslandProgressNext_01_04");	//Вот, держи.
	B_GiveInvItems(other,self,ItMi_Sextant,1);
	AI_Output(self,other,"DIA_Jack_LI_IslandProgressNext_01_05");	//Отлично! Теперь я, наконец-то, смогу заняться расшифровкой тех странных символов.
	AI_Output(other,self,"DIA_Jack_LI_IslandProgressNext_01_06");	//И сколько времени тебе на это понадобится?
	AI_Output(self,other,"DIA_Jack_LI_IslandProgressNext_01_07");	//Думаю, не больше пары дней.
	TORLOFDESCRTIMER = Wld_GetDay();
	TORLOFBEGINSEARCH = TRUE;
	B_LogEntry(TOPIC_LOSTISLAND,"Я достал для Джека секстант, и теперь он может приступить к своим расчетам. По его словам, на это уйдет не более двух дней.");
};


instance DIA_JACK_LI_SEARCH(C_Info)
{
	npc = vlk_444_jack_li;
	nr = 3;
	condition = dia_jack_li_search_condition;
	information = dia_jack_li_search_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_jack_li_search_condition()
{
	var int daynow;
	daynow = Wld_GetDay();
	if((MIS_LOSTISLAND == LOG_Running) && (TORLOFBEGINSEARCH == TRUE) && (TORLOFBEGINSEARCH <= (daynow - 2)))
	{
		return TRUE;
	};
};

func void dia_jack_li_search_info()
{
	B_GivePlayerXP(300);
	AI_Output(self,other,"DIA_Jack_LI_Search_01_00");	//Хорошо, что ты здесь. Я уже закончил свои расчеты.
	AI_Output(other,self,"DIA_Jack_LI_Search_01_01");	//И как успехи?
	AI_Output(self,other,"DIA_Jack_LI_Search_01_04");	//Кажется, мы не ошиблись, полагая, что эти символы действительно кое-что значат.
	AI_Output(self,other,"DIA_Jack_LI_Search_01_05");	//Я сверился по карте с нашим предыдущим курсом и ввел небольшую поправку с учетом возможного отклонения во время шторма.
	AI_Output(self,other,"DIA_Jack_LI_Search_01_06");	//А потом подставил в свои расчеты те цифры, что были нарисованы на обратной стороне найденной тобой каменной плитки. И представляешь, они подошли!
	AI_Output(self,other,"DIA_Jack_LI_Search_01_09");	//Если наложить их на карту в определенной последовательности, то они указывают место, где мы вполне бы могли находиться в данный момент.
	AI_Output(self,other,"DIA_Jack_LI_Search_01_10");	//Конечно, мои расчеты не совсем точные. Но, по крайней мере, это уже дает приблизительное представление о том, что нам делать и куда плыть.
	AI_Output(other,self,"DIA_Jack_LI_Search_01_11");	//Хочешь сказать, что мы сможем убраться с этого острова, когда пожелаем?
	AI_Output(self,other,"DIA_Jack_LI_Search_01_12");	//В точку! (смеется) Как только корабль будет готов к отплытию - можем сниматься с якоря.
	AI_Output(other,self,"DIA_Jack_LI_Search_01_13");	//Тогда не будем терять времени и займемся делами.
	AI_Output(self,other,"DIA_Jack_LI_Search_01_17");	//Да, и еще. Вот, возьми эту карту. На ней отмечен непосредственно сам остров и точный к нему курс.
	B_GiveInvItems(self,other,itmi_seamaplostisland,1);
	AI_Output(self,other,"DIA_Jack_LI_Search_01_18");	//Возможно, эта вещица тебе еще пригодится. А если нет, то все равно пусть пока хранится у тебя.
	MIS_LOSTISLAND = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_LOSTISLAND,LOG_SUCCESS);
	B_LogEntry(TOPIC_LOSTISLAND,"Джек сообщил мне, что закончил свои расчеты. Кажется, они оказались весьма удачными. Та плитка, что я нашел на этом острове, действительно была своеобразной картой, а записи на ней помогли Джеку с большой долей вероятности определить наше текущее местоположение. Так что, как только наш корабль приобретет надлежащий вид, можно будет наконец-то смотаться с этого острова.");
};


instance DIA_JACK_LI_ABOUTISLAND(C_Info)
{
	npc = vlk_444_jack_li;
	nr = 1;
	condition = dia_jack_li_aboutisland_condition;
	information = dia_jack_li_aboutisland_info;
	permanent = FALSE;
	description = "Интересно, на этом острове кто-нибудь живет?";
};


func int dia_jack_li_aboutisland_condition()
{
	if(Npc_KnowsInfo(hero,dia_jack_li_island))
	{
		return TRUE;
	};
};

func void dia_jack_li_aboutisland_info()
{
	AI_Output(other,self,"DIA_Jack_LI_AboutIsland_01_01");	//Интересно, на этом острове кто-нибудь живет?
	AI_Output(self,other,"DIA_Jack_LI_AboutIsland_01_02");	//Навряд ли. Похоже, он вообще необитаем.
	AI_Output(other,self,"DIA_Jack_LI_AboutIsland_01_03");	//Ты в этом уверен?
	AI_Output(self,other,"DIA_Jack_LI_AboutIsland_01_04");	//Эх, парень...(печально) Я сейчас уже ни в чем не уверен.
	AI_Output(self,other,"DIA_Jack_LI_AboutIsland_01_05");	//Но если рассуждать логично, то наше появление тут не могло пройти незамеченным. Если бы тут кто-то жил, то наверняка бы уже дал о себе знать.
	AI_Output(self,other,"DIA_Jack_LI_AboutIsland_01_07");	//А пока что, кроме пары огненных ящериц на берегу, мы так никого и не встретили.
	AI_Output(other,self,"DIA_Jack_LI_AboutIsland_01_08");	//Но все может измениться.
	AI_Output(self,other,"DIA_Jack_LI_AboutIsland_01_09");	//(нервно) Может. Но по мне, так лучше поменьше всяких сюрпризов.
};


instance DIA_JACK_LI_WHEREGUYS(C_Info)
{
	npc = vlk_444_jack_li;
	nr = 2;
	condition = dia_jack_li_whereguys_condition;
	information = dia_jack_li_whereguys_info;
	permanent = FALSE;
	description = "А где все остальные парни?";
};


func int dia_jack_li_whereguys_condition()
{
	if(Npc_KnowsInfo(hero,dia_jack_li_storm))
	{
		return TRUE;
	};
};

func void dia_jack_li_whereguys_info()
{
	AI_Output(other,self,"DIA_Jack_LI_WhereGuys_01_01");	//А где все остальные парни?
	AI_Output(self,other,"DIA_Jack_LI_WhereGuys_01_02");	//Большинство ребят сошло на берег, как только мы причалили к этому острову.
	AI_Output(other,self,"DIA_Jack_LI_WhereGuys_01_03");	//Зачем?
	AI_Output(self,other,"DIA_Jack_LI_WhereGuys_01_04");	//Они сказали, что хотят разведать ближайшие окрестности этого острова.
	AI_Output(self,other,"DIA_Jack_LI_WhereGuys_01_05");	//Хотя, скорее всего, дело в другом.
	AI_Output(other,self,"DIA_Jack_LI_WhereGuys_01_06");	//То есть?
	AI_Output(self,other,"DIA_Jack_LI_WhereGuys_01_07");	//По мне, так они просто напуганы. Вот и не захотели больше оставаться на этом корабле.
	AI_Output(self,other,"DIA_Jack_LI_WhereGuys_01_08");	//Это мне, старому морскому волку, не привыкать к подобным вещам...(смеется) Я видал шторма и посильнее!
	AI_Output(self,other,"DIA_Jack_LI_WhereGuys_01_09");	//А вот остальных он, видимо, прилично напугал.
	AI_Output(self,other,"DIA_Jack_LI_WhereGuys_01_10");	//И после всего пережитого, большинству из них этот клочок суши показался лучшим местом на земле!
	AI_Output(self,other,"DIA_Jack_LI_WhereGuys_01_11");	//По крайней мере, на их лицах это явно читалось.
};


instance DIA_JACK_LI_WHEREGOLD(C_Info)
{
	npc = vlk_444_jack_li;
	nr = 2;
	condition = dia_jack_li_wheregold_condition;
	information = dia_jack_li_wheregold_info;
	permanent = FALSE;
	description = "А куда подевалось мое золото?";
};


func int dia_jack_li_wheregold_condition()
{
	if(Npc_KnowsInfo(hero,dia_jack_li_storm) && (MIS_MISSMYGOLD == LOG_Running) && (BEGINGOLDSEEK == FALSE))
	{
		return TRUE;
	};
};

func void dia_jack_li_wheregold_info()
{
	AI_Output(other,self,"DIA_Jack_LI_WhereGold_01_01");	//А куда подевалось мое золото?
	AI_Output(self,other,"DIA_Jack_LI_WhereGold_01_02");	//О чем ты, приятель?
	AI_Output(other,self,"DIA_Jack_LI_WhereGold_01_03");	//О большой куче золота, которую мы забрали с острова Ирдорат. Оно находилось в трюме нашего корабля!
	AI_Output(self,other,"DIA_Jack_LI_WhereGold_01_04");	//А что с ним?
	AI_Output(other,self,"DIA_Jack_LI_WhereGold_01_05");	//Теперь его там нет!
	AI_Output(self,other,"DIA_Jack_LI_WhereGold_01_08");	//Извини, приятель, но я и понятия не имею, куда оно подевалось.
	AI_Output(self,other,"DIA_Jack_LI_WhereGold_01_09");	//Да и как бы я смог положить к себе в карман такую груду золота?
	AI_Output(other,self,"DIA_Jack_LI_WhereGold_01_10");	//М-да, тоже верно... И как мне теперь быть?
	AI_Output(self,other,"DIA_Jack_LI_WhereGold_01_11");	//Попробуй спросить об этом у других парней - возможно, они что-то знают.
	BEGINGOLDSEEK = TRUE;
	Wld_InsertItem(itmi_misstorlofthing,"FP_ITEM_CAPITANTHING");
	B_LogEntry(TOPIC_MISSMYGOLD,"Джек говорит, что не знает, куда пропало мое золото. Он посоветовал мне поспрашивать об этом других ребят.");
};


instance DIA_JACK_LI_MISSCOMPAS(C_Info)
{
	npc = vlk_444_jack_li;
	nr = 2;
	condition = dia_jack_li_misscompas_condition;
	information = dia_jack_li_misscompas_info;
	permanent = FALSE;
	description = "Горн сказал, что ты потерял свой компас.";
};


func int dia_jack_li_misscompas_condition()
{
	if((MIS_MISSMYGOLD == LOG_Running) && (GORNTELLABOUTCOMPAS == TRUE) && (Npc_HasItems(hero,itmi_misstorlofthing) == 0))
	{
		return TRUE;
	};
};

func void dia_jack_li_misscompas_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_Jack_LI_MissCompas_01_01");	//Горн сказал, что ты потерял свой компас.
	AI_Output(self,other,"DIA_Jack_LI_MissCompas_01_02");	//(расстроенно) Да, есть такое дело! Наверное, он выпал у меня из кармана во время шторма.
	AI_Output(other,self,"DIA_Jack_LI_MissCompas_01_06");	//Похоже, что этот компас для тебя много значил.
	AI_Output(self,other,"DIA_Jack_LI_MissCompas_01_07");	//Эх! (грустно) Эта вещица была по настоящему мне дорога - подарок на память от одного моего старого друга!
	AI_Output(self,other,"DIA_Jack_LI_MissCompas_01_08");	//Я всегда полагал, что она приносит мне удачу, и поверь мне - так оно и было!
	AI_Output(self,other,"DIA_Jack_LI_MissCompas_01_09");	//Но теперь понимаю, что эта самая удача на этот раз отвернулась от меня.
	AI_Output(other,self,"DIA_Jack_LI_MissCompas_01_10");	//А ты не пробовал его искать?
	AI_Output(self,other,"DIA_Jack_LI_MissCompas_01_11");	//Пробовал, конечно. Я обшарил всю верхнюю палубу, но все оказалось напрасно - его тут нет!
	AI_Output(self,other,"DIA_Jack_LI_MissCompas_01_12");	//Так что, скорее всего, его просто смыло волной за борт, и с этим уже ничего не поделаешь.
	B_LogEntry(TOPIC_MISSMYGOLD,"Я спросил Джека про его компас. Кажется, он действительно очень сильно расстроен его пропажей. Он обыскал всю верхнюю палубу в надежде найти его, но все тщетно.");
};


instance DIA_JACK_LI_WHEREGOLDDONE(C_Info)
{
	npc = vlk_444_jack_li;
	nr = 2;
	condition = dia_jack_li_wheregolddone_condition;
	information = dia_jack_li_wheregolddone_info;
	permanent = FALSE;
	description = "Это случайно не твой компас?";
};


func int dia_jack_li_wheregolddone_condition()
{
	if((BEGINGOLDSEEK == TRUE) && (MIS_MISSMYGOLD == LOG_Running) && (Npc_HasItems(hero,itmi_misstorlofthing) >= 1))
	{
		return TRUE;
	};
};

func void dia_jack_li_wheregolddone_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Jack_LI_WhereGoldDone_01_01");	//Это случайно не твой компас?
	B_GiveInvItems(other,self,itmi_misstorlofthing,1);
	AI_Output(self,other,"DIA_Jack_LI_WhereGoldDone_01_04");	//(восторженно) Мой компас! Как тебе удалось его найти?
	AI_Output(other,self,"DIA_Jack_LI_WhereGoldDone_01_06");	//Вопрос в другом - где я его нашел.
	AI_Output(self,other,"DIA_Jack_LI_WhereGoldDone_01_07");	//И где же?
	AI_Output(other,self,"DIA_Jack_LI_WhereGoldDone_01_08");	//Я нашел его там, где раньше лежала куча моего золота.
	AI_Output(self,other,"DIA_Jack_LI_WhereGoldDone_01_09");	//На что это ты намекаешь?
	AI_Output(other,self,"DIA_Jack_LI_WhereGoldDone_01_10");	//На то, что тебе наверняка что-то известно по этому поводу!
	AI_Output(self,other,"DIA_Jack_LI_WhereGoldDone_01_11");	//Но я же уже сказал тебе, что понятия не имею - где оно...(растерянно)
	AI_Output(other,self,"DIA_Jack_LI_WhereGoldDone_01_12");	//На твоем месте, я бы лучше сказал всю правду.
	AI_Output(self,other,"DIA_Jack_LI_WhereGoldDone_01_13");	//Правду? (совсем растерянно) Но...
	AI_Output(self,other,"DIA_Jack_LI_WhereGoldDone_01_15");	//Эх, ладно. В общем...(замялся) К большому сожалению многих членов экипажа, его пришлось выкинуть за борт.
	AI_Output(other,self,"DIA_Jack_LI_WhereGoldDone_01_17");	//То есть как это выкинуть?
	AI_Output(self,other,"DIA_Jack_LI_WhereGoldDone_01_18");	//А вот так! Корабль дал сильный крен, и если бы мы этого не сделали, то все бы пошли на корм рыбам.
	AI_Output(other,self,"DIA_Jack_LI_WhereGoldDone_01_19");	//Вы выбросили ВСЕ золото?!
	AI_Output(self,other,"DIA_Jack_LI_WhereGoldDone_01_20");	//Извини, но я как-то забыл тогда об этом подумать...(ехидно) Не до этого было.
	AI_Output(other,self,"DIA_Jack_LI_WhereGoldDone_01_22");	//А почему все это скрывали от меня?
	AI_Output(self,other,"DIA_Jack_LI_WhereGoldDone_01_23");	//Мы думали, что ты очень расстроишься, поэтому и делали вид, что ничего не знаем насчет твоего золота.
	AI_Output(other,self,"DIA_Jack_LI_WhereGoldDone_01_25");	//Вы оказались правы - я действительно сильно огорчен!
	AI_Output(self,other,"DIA_Jack_LI_WhereGoldDone_01_26");	//Приятель! (улыбается) На твоем месте я бы не очень сильно расстраивался.
	AI_Output(self,other,"DIA_Jack_LI_WhereGoldDone_01_27");	//Золото - дело наживное, и ты еще успеешь стать богатым.
	AI_Output(self,other,"DIA_Jack_LI_WhereGoldDone_01_28");	//Лучше стоит поблагодарить Инноса за то, что он помог нам всем остаться в живых.
	AI_Output(other,self,"DIA_Jack_LI_WhereGoldDone_01_29");	//Ну да, наверное ты прав.
	AI_Output(self,other,"DIA_Jack_LI_WhereGoldDone_01_30");	//Тогда давай закончим болтать и займемся более важными делами.
	MIS_MISSMYGOLD = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_MISSMYGOLD,LOG_SUCCESS);
	B_LogEntry(TOPIC_MISSMYGOLD,"Теперь все стало ясно - мое золото просто выкинули за борт во время шторма, поскольку из-за большой загруженности наш корабль дал крен и мог запросто опрокинуться. Парни не хотели мне говорить всю правду, поскольку думали, что я очень расстроюсь из-за этого. Они оказались правы, но я как-нибудь переживу эту потерю.");
};


instance DIA_JACK_LI_HALLO(C_Info)
{
	npc = vlk_444_jack_li;
	nr = 4;
	condition = dia_jack_li_hallo_condition;
	information = dia_jack_li_hallo_info;
	permanent = TRUE;
	description = "Все спокойно?";
};


func int dia_jack_li_hallo_condition()
{
	if(Npc_KnowsInfo(hero,dia_jack_li_aboutisland) && Npc_KnowsInfo(hero,dia_jack_li_whereguys) && Npc_KnowsInfo(hero,dia_jack_li_island))
	{
		return TRUE;
	};
};

func void dia_jack_li_hallo_info()
{
	AI_Output(other,self,"DIA_Jack_LI_Hallo_15_00");	//Все спокойно?
	AI_Output(self,other,"DIA_Jack_LI_Hallo_01_01");	//Пока вроде да.
};


instance DIA_JACK_LI_BRINGFOODDONE(C_Info)
{
	npc = vlk_444_jack_li;
	nr = 2;
	condition = dia_jack_li_bringfooddone_condition;
	information = dia_jack_li_bringfooddone_info;
	permanent = FALSE;
	description = "Как у нас дела с провиантом?";
};


func int dia_jack_li_bringfooddone_condition()
{
	if((MIS_BRINGFOOD == LOG_Running) && (GORNTELLABOUTMEAT == TRUE) && (Npc_HasItems(hero,ItFoMuttonRaw) >= 24))
	{
		return TRUE;
	};
};

func void dia_jack_li_bringfooddone_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Jack_LI_BringFoodDone_01_01");	//Как у нас дела с провиантом?
	AI_Output(self,other,"DIA_Jack_LI_BringFoodDone_01_02");	//Не очень хорошо. Наши запасы уже подходят к концу. А почему ты спросил?
	AI_Output(other,self,"DIA_Jack_LI_BringFoodDone_01_04");	//Некоторые парни жалуются на то, что ты урезал их дневные нормы еды.
	AI_Output(self,other,"DIA_Jack_LI_BringFoodDone_01_06");	//А другого выхода у меня и не было. Зная аппетиты некоторых наших парней, я полагаю, что уже через пару дней у нас ничего бы не осталось.
	AI_Output(self,other,"DIA_Jack_LI_BringFoodDone_01_08");	//Особенно это касается Горна! Если этого троглодита пустить на камбуз, то он за один присест изничтожит все наши запасы еды! И что мы потом будем делать?
	AI_Output(other,self,"DIA_Jack_LI_BringFoodDone_01_12");	//Я принес тебе много свежего мяса. Тут пять дюжин кусков.
	AI_Output(self,other,"DIA_Jack_LI_BringFoodDone_01_13");	//Мяса? Ты что, ходил на охоту?
	AI_Output(other,self,"DIA_Jack_LI_BringFoodDone_01_14");	//Ну да - прогулялся немного по острову, подстрелил пару мерзких тварей. Так что забирай его.
	AI_Output(self,other,"DIA_Jack_LI_BringFoodDone_01_19");	//Нет-нет-нет! (ворчливо) Просто так я это мясо у тебя брать не стану.
	AI_Output(other,self,"DIA_Jack_LI_BringFoodDone_01_20");	//Это почему?
	AI_Output(self,other,"DIA_Jack_LI_BringFoodDone_01_21");	//У меня нет времени возиться с ним. И так дел по самое горло!
	AI_Output(self,other,"DIA_Jack_LI_BringFoodDone_01_22");	//И сырым его оставлять тоже нельзя, иначе оно быстро испортится.
	AI_Output(self,other,"DIA_Jack_LI_BringFoodDone_01_23");	//Сходи на камбуз и хорошенько прожарь все эти куски. А после возвращайся ко мне.
	B_LogEntry(TOPIC_BRINGFOOD,"Джек был удивлен тем, что мне удалось достать такое количество свежего мяса. Однако брать он его отказался - ему сейчас некогда заниматься его заготовкой. Джек попросил меня сходить на камбуз и прожарить каждый кусок, а потом принести их ему.");
};


instance DIA_JACK_LI_BRINGFOODDONEEXT(C_Info)
{
	npc = vlk_444_jack_li;
	nr = 2;
	condition = dia_jack_li_bringfooddoneext_condition;
	information = dia_jack_li_bringfooddoneext_info;
	permanent = FALSE;
	description = "Я пожарил мясо.";
};


func int dia_jack_li_bringfooddoneext_condition()
{
	if((MIS_BRINGFOOD == LOG_Running) && Npc_KnowsInfo(hero,dia_jack_li_bringfooddone) && (Npc_HasItems(hero,ItFoMutton) >= 24) && (Npc_HasItems(hero,ItFo_Apple) >= 20))
	{
		return TRUE;
	};
};

func void dia_jack_li_bringfooddoneext_info()
{
	AI_Output(other,self,"DIA_Jack_LI_BringFoodDoneExt_01_01");	//Я пожарил мясо, как ты и просил.
	AI_Output(self,other,"DIA_Jack_LI_BringFoodDoneExt_01_02");	//Если так, то давай его сюда.
	Info_ClearChoices(dia_jack_li_bringfooddoneext);
	if(GORNTELLABOUTMEAT == TRUE)
	{
		Info_AddChoice(dia_jack_li_bringfooddoneext,"Вот, держи...(отдать 14 кусков мяса и яблоки)",dia_jack_li_bringfooddoneext_fifty);
	};
	Info_AddChoice(dia_jack_li_bringfooddoneext,"Вот, держи.",dia_jack_li_bringfooddoneext_sixty);
};

func void dia_jack_li_bringfooddoneext_fifty()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Jack_LI_BringFoodDoneExt_Fifty_01_00");	//Вот, держи.
	B_GiveInvItems(other,self,ItFoMutton,14);
	B_GiveInvItems(other,self,ItFo_Apple,20);
	Npc_RemoveInvItems(self,ItFoMutton,14);
	Npc_RemoveInvItems(self,ItFo_Apple,20);
	AI_Output(self,other,"DIA_Jack_LI_BringFoodDoneExt_Fifty_01_01");	//Хммм... А где же все остальное? Мне казалось, что у тебя было тогда больше мяса, чем сейчас.
	AI_Output(other,self,"DIA_Jack_LI_BringFoodDoneExt_Fifty_01_03");	//Я решил немного подкрепиться.
	AI_Output(self,other,"DIA_Jack_LI_BringFoodDoneExt_Fifty_01_04");	//М-да, приятель...(удивленно) Ну и аппетит у тебя! Ты же умял не меньше десяти кусков!
	AI_Output(self,other,"DIA_Jack_LI_BringFoodDoneExt_Fifty_01_09");	//Ладно, в конце концов, именно ты достал для нас это мясо.
	AI_Output(self,other,"DIA_Jack_LI_BringFoodDoneExt_Fifty_01_11");	//Просто я хотел немного увеличить суточный рацион для всех наших парней. А то они в последнее время совсем какие-то вялые.
	AI_Output(self,other,"DIA_Jack_LI_BringFoodDoneExt_Fifty_01_13");	//Эх... Но чего уж теперь... В любом случае спасибо.
	NOTTHANKSTELLALLMEAT = TRUE;
	Info_ClearChoices(dia_jack_li_bringfooddoneext);
	MIS_BRINGFOOD = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_BRINGFOOD,LOG_SUCCESS);
	B_LogEntry(TOPIC_BRINGFOOD,"Я отдал Джеку жареное мясо, правда не забыв при этом про просьбу Горна. Джек был слегка расстроен этим, поскольку хотел увеличить суточный рацион для других парней. Но теперь это уже не имеет значения.");
};

func void dia_jack_li_bringfooddoneext_sixty()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Jack_LI_BringFoodDoneExt_Sixty_01_00");	//Вот, держи.
	B_GiveInvItems(other,self,ItFoMutton,24);
	B_GiveInvItems(other,self,ItFo_Apple,20);
	Npc_RemoveInvItems(self,ItFoMutton,24);
	Npc_RemoveInvItems(self,ItFo_Apple,20);
	AI_Output(self,other,"DIA_Jack_LI_BringFoodDoneExt_Sixty_01_01");	//Отлично! Теперь-то у парней уж точно будет чем подкрепиться в ближайшие дни.
	AI_Output(self,other,"DIA_Jack_LI_BringFoodDoneExt_Sixty_01_02");	//И я даже смогу немного увеличить суточный рацион для всех членов нашего экипажа.
	AI_Output(self,other,"DIA_Jack_LI_BringFoodDoneExt_Sixty_01_03");	//После нескольких дней небольшой голодовки, для них это наверняка будет хорошей новостью.
	Info_ClearChoices(dia_jack_li_bringfooddoneext);
	THANKSTELLALLMEAT = TRUE;
	MIS_BRINGFOOD = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_BRINGFOOD,LOG_SUCCESS);
	B_LogEntry(TOPIC_BRINGFOOD,"Я отдал Джеку все жареное мясо, и теперь он сможет немного увеличить суточный рацион для всех членов экипажа нашего корабля.");
};


instance DIA_JACK_LI_FINDMAGICORECAVE(C_Info)
{
	npc = vlk_444_jack_li;
	nr = 2;
	condition = dia_jack_li_findmagicorecave_condition;
	information = dia_jack_li_findmagicorecave_info;
	permanent = FALSE;
	description = "У меня есть интересные новости.";
};


func int dia_jack_li_findmagicorecave_condition()
{
	if((MIS_FINDMAGICORECAVE == LOG_Running) && ((FINDLIORE_CAVE_01 == TRUE) || (FINDLIORE_CAVE_02 == TRUE)))
	{
		return TRUE;
	};
};

func void dia_jack_li_findmagicorecave_info()
{
	AI_Output(other,self,"DIA_Jack_LI_FindMagicOreCave_01_01");	//У меня есть интересные новости.
	AI_Output(self,other,"DIA_Jack_LI_FindMagicOreCave_01_02");	//И в чем же они заключаются?
	if((FINDLIORE_CAVE_01 == TRUE) && (FINDLIORE_CAVE_02 == TRUE))
	{
		B_GivePlayerXP(1000);
		AI_Output(other,self,"DIA_Jack_LI_FindMagicOreCave_01_03");	//Я обнаружил несколько пещер с огромными залежами магической руды.
		AI_Output(self,other,"DIA_Jack_LI_FindMagicOreCave_01_04");	//(удивленно) Правда?
		AI_Output(other,self,"DIA_Jack_LI_FindMagicOreCave_01_05");	//Думаю, весь этот остров просто до основания забит ею.
		AI_Output(self,other,"DIA_Jack_LI_FindMagicOreCave_01_06");	//(задумчиво) Что ж, это действительно довольно необычные новости.
		AI_Output(self,other,"DIA_Jack_LI_FindMagicOreCave_01_07");	//Залежи магической руды - очень большая редкость! Тем более, как ты говоришь, в таких огромных размерах.
		AI_Output(self,other,"DIA_Jack_LI_FindMagicOreCave_01_08");	//Насколько я знаю, до последнего времени такие запасы были только в Долине Рудников, пока туда не пришли орки.
		AI_Output(self,other,"DIA_Jack_LI_FindMagicOreCave_01_09");	//Так что, если ты прав - это поистине великое открытие!
		AI_Output(self,other,"DIA_Jack_LI_FindMagicOreCave_01_10");	//Хотя мне все равно в это как-то слабо верится...(с сомнением) Скорее всего, ты перепутал магическую руду с обычными камнями.
		AI_Output(other,self,"DIA_Jack_LI_FindMagicOreCave_01_11");	//И что же мне нужно сделать, чтобы ты в это поверил?
		AI_Output(self,other,"DIA_Jack_LI_FindMagicOreCave_01_12");	//(задумчиво) Возможно, если я сам бы своими глазами увидел эту руду, то это бы полностью прояснило ситуацию.
		AI_Output(other,self,"DIA_Jack_LI_FindMagicOreCave_01_13");	//Тогда идем со мной. Я покажу тебе одну из пещер.
		AI_Output(self,other,"DIA_Jack_LI_FindMagicOreCave_01_14");	//Не выйдет, приятель...(улыбается) У меня сейчас абсолютно нет на это времени.
		AI_Output(self,other,"DIA_Jack_LI_FindMagicOreCave_01_15");	//К тому же я еще не закончил с починкой нашего корабля.
		AI_Output(self,other,"DIA_Jack_LI_FindMagicOreCave_01_16");	//Если тебе не трудно, просто принеси мне небольшой кусок той руды, что ты обнаружил на этом острове.
		AI_Output(self,other,"DIA_Jack_LI_FindMagicOreCave_01_17");	//Думаю, этого будет вполне достаточно, чтобы полностью удостовериться в твоих словах.
		AI_Output(other,self,"DIA_Jack_LI_FindMagicOreCave_01_18");	//Хорошо. Я принесу руду.
		LITESTOK = TRUE;
		B_LogEntry(TOPIC_FINDMAGICORECAVE,"Я рассказал Джеку о том, что обнаружил на острове несколько пещер с огромными залежами магической руды. В качестве доказательства моих слов он попросил меня принести ему небольшой кусок этой породы.");
	}
	else
	{
		B_GivePlayerXP(500);
		AI_Output(other,self,"DIA_Jack_LI_FindMagicOreCave_01_19");	//В одной из пещер на этом острове я обнаружил большие залежи магической руды.
		AI_Output(other,self,"DIA_Jack_LI_FindMagicOreCave_01_20");	//Возможно, на этом острове скрываются еще большие запасы.
		AI_Output(self,other,"DIA_Jack_LI_FindMagicOreCave_01_21");	//(задумчиво) Что ж, это действительно довольно необычные новости.
		AI_Output(self,other,"DIA_Jack_LI_FindMagicOreCave_01_22");	//Обнаружить залежи магической руды - очень большая удача! Тем более, как ты говоришь, в таких больших размерах.
		AI_Output(self,other,"DIA_Jack_LI_FindMagicOreCave_01_23");	//Насколько я знаю, до последнего времени такие запасы были только в Долине Рудников, пока туда не пришли орки.
		AI_Output(self,other,"DIA_Jack_LI_FindMagicOreCave_01_24");	//Так что, если ты окажешься прав, - это будет поистине великое открытие!
		AI_Output(self,other,"DIA_Jack_LI_FindMagicOreCave_01_25");	//Хотя мне в это как-то слабо верится...(с сомнением) Скорее всего, ты перепутал руду с обычными камнями.
		AI_Output(self,other,"DIA_Jack_LI_FindMagicOreCave_01_26");	//К тому же найденные тобой залежи в этой пещере еще не говорят о том, что здесь ее может быть много.
		AI_Output(self,other,"DIA_Jack_LI_FindMagicOreCave_01_27");	//Это может оказаться простой случайностью!
		AI_Output(other,self,"DIA_Jack_LI_FindMagicOreCave_01_28");	//И что мне теперь делать?
		AI_Output(self,other,"DIA_Jack_LI_FindMagicOreCave_01_29");	//На твоем месте я бы попробовал более тщательно обследовать этот остров.
		AI_Output(self,other,"DIA_Jack_LI_FindMagicOreCave_01_30");	//Возможно, это немного прояснило бы ситуацию с найденной тобою рудой.
		AI_Output(self,other,"DIA_Jack_LI_FindMagicOreCave_01_31");	//Так что, когда найдешь еще что-нибудь интересное, тогда и поговорим.
		LIBEFORETESTOK = TRUE;
		B_LogEntry(TOPIC_FINDMAGICORECAVE,"Я сообщил Джеку о том, что обнаружил на острове пещеру с большими залежами магической руды. Он сильно засомневался в моих словах и попросил меня тщательнее обследовать остров, чтобы найти еще доказательства присутствия здесь залежей этой породы.");
	};
};


instance DIA_JACK_LI_FINDMAGICORECAVEPROGRESS(C_Info)
{
	npc = vlk_444_jack_li;
	nr = 2;
	condition = dia_jack_li_findmagicorecaveprogress_condition;
	information = dia_jack_li_findmagicorecaveprogress_info;
	permanent = FALSE;
	description = "Я обследовал остров.";
};


func int dia_jack_li_findmagicorecaveprogress_condition()
{
	if((MIS_FINDMAGICORECAVE == LOG_Running) && (LIBEFORETESTOK == TRUE) && (FINDLIORE_CAVE_01 == TRUE) && (FINDLIORE_CAVE_02 == TRUE))
	{
		return TRUE;
	};
};

func void dia_jack_li_findmagicorecaveprogress_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Jack_LI_FindMagicOreCaveProgress_01_01");	//Я обследовал остров...
	AI_Output(self,other,"DIA_Jack_LI_FindMagicOreCaveProgress_01_02");	//И?
	AI_Output(other,self,"DIA_Jack_LI_FindMagicOreCaveProgress_01_03");	//...и нашел еще одну пещеру. В ней руды даже еще больше, чем в первой!
	AI_Output(self,other,"DIA_Jack_LI_FindMagicOreCaveProgress_01_04");	//Ты в этом точно уверен?
	AI_Output(other,self,"DIA_Jack_LI_FindMagicOreCaveProgress_01_05");	//А разве одних моих слов недостаточно?
	AI_Output(self,other,"DIA_Jack_LI_FindMagicOreCaveProgress_01_06");	//Конечно, достаточно! (ехидно) Просто мне до сих пор не верится в то, что нам так повезло!
	AI_Output(other,self,"DIA_Jack_LI_FindMagicOreCaveProgress_01_07");	//И что же мне нужно сделать, чтобы ты, наконец-то, в это поверил?
	AI_Output(self,other,"DIA_Jack_LI_FindMagicOreCaveProgress_01_08");	//(задумчиво) Возможно, если я сам бы своими глазами увидел эту руду, то это бы полностью прояснило ситуацию.
	AI_Output(other,self,"DIA_Jack_LI_FindMagicOreCaveProgress_01_09");	//Тогда идем со мной. Я покажу тебе одну из пещер.
	AI_Output(self,other,"DIA_Jack_LI_FindMagicOreCaveProgress_01_10");	//Не выйдет, приятель. У меня сейчас абсолютно нет на это времени.
	AI_Output(self,other,"DIA_Jack_LI_FindMagicOreCaveProgress_01_11");	//К тому же я еще не закончил с починкой нашего корабля!
	AI_Output(self,other,"DIA_Jack_LI_FindMagicOreCaveProgress_01_12");	//Если тебе не трудно, просто принеси мне небольшой кусок той руды, что ты обнаружил на этом острове.
	AI_Output(self,other,"DIA_Jack_LI_FindMagicOreCaveProgress_01_13");	//Думаю, этого будет вполне достаточно, чтобы полностью удостовериться в твоих словах.
	AI_Output(other,self,"DIA_Jack_LI_FindMagicOreCaveProgress_01_14");	//Хорошо. Я принесу руду.
	LITESTOK = TRUE;
	B_LogEntry(TOPIC_FINDMAGICORECAVE,"Я сказал Джеку, что нашел еще одну пещеру с залежами магической руды. Он спокойно выслушал меня, а потом попросил принести ему небольшой кусок этой породы, чтобы окончательно удостовериться в правдивости моих слов.");
};


instance DIA_JACK_LI_FINDMAGICORECAVEDONE(C_Info)
{
	npc = vlk_444_jack_li;
	nr = 2;
	condition = dia_jack_li_findmagicorecavedone_condition;
	information = dia_jack_li_findmagicorecavedone_info;
	permanent = FALSE;
	description = "Я принес тебе кусок той руды.";
};


func int dia_jack_li_findmagicorecavedone_condition()
{
	if((MIS_FINDMAGICORECAVE == LOG_Running) && (TESTNUGGETGAVE == TRUE) && (Npc_HasItems(hero,itmi_testnugget) >= 1))
	{
		return TRUE;
	};
};

func void dia_jack_li_findmagicorecavedone_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Jack_LI_FindMagicOreCaveDone_01_01");	//Я принес тебе кусок той руды.
	AI_Output(self,other,"DIA_Jack_LI_FindMagicOreCaveDone_01_02");	//(ехидно) Покажи мне его.
	AI_Output(other,self,"DIA_Jack_LI_FindMagicOreCaveDone_01_03");	//Вот, полюбуйся.
	B_GiveInvItems(other,self,itmi_testnugget,1);
	AI_Output(self,other,"DIA_Jack_LI_FindMagicOreCaveDone_01_04");	//(очень удивленно) Да, парень - похоже, ты был прав!
	AI_Output(self,other,"DIA_Jack_LI_FindMagicOreCaveDone_01_05");	//Это действительно магическая руда. И, похоже, еще и превосходного качества!
	AI_Output(other,self,"DIA_Jack_LI_FindMagicOreCaveDone_01_06");	//Теперь-то ты мне веришь?
	AI_Output(self,other,"DIA_Jack_LI_FindMagicOreCaveDone_01_07");	//Прости, что сомневался в твоих словах. Просто я привык верить только тому, что видел сам.
	AI_Output(other,self,"DIA_Jack_LI_FindMagicOreCaveDone_01_08");	//Понимаю.
	MIS_FINDMAGICORECAVE = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_FINDMAGICORECAVE,LOG_SUCCESS);
	B_LogEntry(TOPIC_FINDMAGICORECAVE,"Я принес Джеку кусок руды, отколотого мною от магической породы. После этого он перестал сомневаться в моих словах.");
};


instance DIA_JACK_LI_CHANGECOURSE(C_Info)
{
	npc = vlk_444_jack_li;
	nr = 2;
	condition = dia_jack_li_changecourse_condition;
	information = dia_jack_li_changecourse_info;
	permanent = FALSE;
	description = "И что мы теперь будем делать?";
};


func int dia_jack_li_changecourse_condition()
{
	if(MIS_FINDMAGICORECAVE == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_jack_li_changecourse_info()
{
	AI_Output(other,self,"DIA_Jack_LI_ChangeCourse_01_01");	//И что мы теперь будем делать?
	AI_Output(self,other,"DIA_Jack_LI_ChangeCourse_01_03");	//Конечно, было бы неплохо прибрать всю эту руду к рукам. Мы могли бы выручить за нее на материке просто огромную кучу золота!
	AI_Output(other,self,"DIA_Jack_LI_ChangeCourse_01_05");	//Звучит заманчиво.
	AI_Output(self,other,"DIA_Jack_LI_ChangeCourse_01_06");	//Да...(задумчиво) Вот только как нам это сделать?
	AI_Output(self,other,"DIA_Jack_LI_ChangeCourse_01_07");	//Наш корабль и так набит под завязку. А руда весит немало.
	AI_Output(self,other,"DIA_Jack_LI_ChangeCourse_01_08");	//К тому же ее еще надо как-то добыть, а из нас вряд ли получатся хорошие рудокопы.
	AI_Output(self,other,"DIA_Jack_LI_ChangeCourse_01_09");	//А что насчет тебя? У тебя есть какие-нибудь идеи на этот счет?
	Info_ClearChoices(dia_jack_li_changecourse);
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL) || (other.guild == GIL_KDF) || (other.guild == GIL_KDW))
	{
		Info_AddChoice(dia_jack_li_changecourse,"Думаю, нам стоит сообщить об этой руде лорду Хагену.",dia_jack_li_changecourse_paladin);
	};
	Info_AddChoice(dia_jack_li_changecourse,"Мы можем продать этот остров вместе с рудой.",dia_jack_li_changecourse_sell);
	Info_AddChoice(dia_jack_li_changecourse,"Давай останемся на острове и будем добывать руду.",dia_jack_li_changecourse_here);
};

func void dia_jack_li_changecourse_paladin()
{
	AI_Output(other,self,"DIA_Jack_LI_ChangeCourse_Paladin_01_01");	//Думаю, нам стоит сообщить об этой руде лорду Хагену.
	AI_Output(self,other,"DIA_Jack_LI_ChangeCourse_Paladin_01_02");	//(озадаченно) Что? Отдать эту руду паладинам?
	AI_Output(other,self,"DIA_Jack_LI_ChangeCourse_Paladin_01_03");	//Без нее у них нет ни единого шанса выиграть эту войну.
	AI_Output(self,other,"DIA_Jack_LI_ChangeCourse_Paladin_01_04");	//И что с того? Возможно, они уже ее и так проиграли!
	AI_Output(self,other,"DIA_Jack_LI_ChangeCourse_Paladin_01_05");	//И мы даже точно не знаем, как обстоят дела на материке. Но, по слухам, там уже вовсю хозяйничают орки!
	AI_Output(other,self,"DIA_Jack_LI_ChangeCourse_Paladin_01_06");	//Если так, то нам эта руда будет и вовсе без надобности.
	AI_Output(self,other,"DIA_Jack_LI_ChangeCourse_Paladin_01_07");	//Эх... Ладно, пусть будет по-твоему.
	AI_Output(self,other,"DIA_Jack_LI_ChangeCourse_Paladin_01_08");	//Но ведь нам тогда придется вернуться обратно в Хоринис. Не думаю, что большинству парней придется по душе эта идея...
	AI_Output(other,self,"DIA_Jack_LI_ChangeCourse_Paladin_01_10");	//Я попробую их уговорить.
	AI_Output(self,other,"DIA_Jack_LI_ChangeCourse_Paladin_01_11");	//Как скажешь. Тогда дай знать, если тебе это удастся.
	AI_Output(self,other,"DIA_Jack_LI_ChangeCourse_Paladin_01_12");	//В любом случае этот вопрос решать остальным парням. Как решит большинство из них, так и будет!
	AI_Output(other,self,"DIA_Jack_LI_ChangeCourse_Paladin_01_13");	//Конечно.
	MIS_CHANGECOURSE = LOG_Running;
	Log_CreateTopic(TOPIC_CHANGECOURSE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CHANGECOURSE,LOG_Running);
	B_LogEntry(TOPIC_CHANGECOURSE,"Теперь нам необходимо решить, что делать с той рудой, которую мы нашли на этом загадочном острове. Я предложил Джеку вернуться в Хоринис и рассказать о ней паладинам, но эта идея не очень пришлась ему по душе. Мы пришли к выводу, что сперва надо узнать мнение других членов нашей команды. А там, как решит большинство из них - так и будет.");
	Info_ClearChoices(dia_jack_li_changecourse);
};

func void dia_jack_li_changecourse_sell()
{
	AI_Output(other,self,"DIA_Jack_LI_ChangeCourse_Sell_01_01");	//Мы можем продать этот остров вместе с рудой!
	AI_Output(self,other,"DIA_Jack_LI_ChangeCourse_Sell_01_02");	//Интересно...(с сомнением) И кто же его у нас купит?
	AI_Output(other,self,"DIA_Jack_LI_ChangeCourse_Sell_01_04");	//Может быть, паладины?
	AI_Output(self,other,"DIA_Jack_LI_ChangeCourse_Sell_01_05");	//Хммм...(задумчиво) А что, идея совсем неплоха.
	AI_Output(self,other,"DIA_Jack_LI_ChangeCourse_Sell_01_06");	//Учитывая их ситуацию, они наверняка с радостью ухватятся за это предложение.
	AI_Output(self,other,"DIA_Jack_LI_ChangeCourse_Sell_01_07");	//Вот только кто из паладинов сможет принять наши условия?
	AI_Output(other,self,"DIA_Jack_LI_ChangeCourse_Sell_01_08");	//Возможно, нам стоит обратится с этим к лорду Хагену.
	AI_Output(self,other,"DIA_Jack_LI_ChangeCourse_Sell_01_10");	//Да, пожалуй, ты прав. Но тогда нам придется вернуться в Хоринис. Не думаю, что большинству парней придется по душе эта идея.
	AI_Output(other,self,"DIA_Jack_LI_ChangeCourse_Sell_01_13");	//Я попробую их уговорить.
	AI_Output(self,other,"DIA_Jack_LI_ChangeCourse_Sell_01_14");	//Ладно. Тогда дай знать, если тебе это удастся.
	AI_Output(self,other,"DIA_Jack_LI_ChangeCourse_Sell_01_15");	//В любом случае этот вопрос решать остальным парням. Как решит большинство из них, так и будет!
	AI_Output(other,self,"DIA_Jack_LI_ChangeCourse_Sell_01_16");	//Конечно.
	MIS_CHANGECOURSE = LOG_Running;
	Log_CreateTopic(TOPIC_CHANGECOURSE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CHANGECOURSE,LOG_Running);
	B_LogEntry(TOPIC_CHANGECOURSE,"Теперь нам необходимо решить, что делать с той рудой, которую мы нашли на этом загадочном острове. Я предложил Джеку продать эту руду паладинам, и эта идея пришлась ему по душе. Но для этого нам придется вернуться в Хоринис, а значит, сперва надо узнать мнение других членов нашей команды. А там, как решит большинство из них - так и будет.");
	Info_ClearChoices(dia_jack_li_changecourse);
};

func void dia_jack_li_changecourse_here()
{
	AI_Output(other,self,"DIA_Jack_LI_ChangeCourse_Here_01_01");	//Давай останемся на острове и будем добывать руду.
	AI_Output(self,other,"DIA_Jack_LI_ChangeCourse_Here_01_02");	//Не думаю, что это хорошая идея.
	AI_Output(other,self,"DIA_Jack_LI_ChangeCourse_Here_01_03");	//Почему?
	AI_Output(self,other,"DIA_Jack_LI_ChangeCourse_Here_01_04");	//Да потому, что, даже если мы начнем здесь вкалывать с утра до ночи с киркой в руках, - нам это все равно ничего не даст.
	AI_Output(self,other,"DIA_Jack_LI_ChangeCourse_Here_01_05");	//На то, чтобы добыть достаточное количество руды, потребуются годы!
	AI_Output(self,other,"DIA_Jack_LI_ChangeCourse_Here_01_06");	//К тому же я не собираюсь проводить остаток своей жизни на этом поганом островке. Он мне и так уже порядком поднадоел!
	AI_Output(self,other,"DIA_Jack_LI_ChangeCourse_Here_01_08");	//А потому будет лучше, если ты выбросишь эту идею из головы.
};


instance DIA_JACK_LI_CHANGECOURSEDONE(C_Info)
{
	npc = vlk_444_jack_li;
	nr = 2;
	condition = dia_jack_li_changecoursedone_condition;
	information = dia_jack_li_changecoursedone_info;
	permanent = FALSE;
	description = "Я поговорил со всеми парнями.";
};


func int dia_jack_li_changecoursedone_condition()
{
	if((MIS_FINDMAGICORECAVE == LOG_SUCCESS) && (READYCHANGECOURSE == TRUE))
	{
		return TRUE;
	};
};

func void dia_jack_li_changecoursedone_info()
{
	AI_Output(other,self,"DIA_Jack_LI_ChangeCourseDone_01_01");	//Я поговорил со всеми парнями.
	AI_Output(self,other,"DIA_Jack_LI_ChangeCourseDone_01_02");	//И что они сказали?
	if(CREWAGREEAWAYBACKPAL > CREWAGREEAWAYBACKSELL)
	{
		B_GivePlayerXP(500);
		AI_Output(other,self,"DIA_Jack_LI_ChangeCourseDone_01_03");	//Большинство из них согласно плыть в Хоринис, чтобы помочь паладинам.
		AI_Output(self,other,"DIA_Jack_LI_ChangeCourseDone_01_05");	//Ну ладно... Если так решило большинство - значит, тому и быть!
		AI_Output(self,other,"DIA_Jack_LI_ChangeCourseDone_01_06");	//Остается только надеяться, что лорду Хагену и его людям все это действительно поможет.
		B_LogEntry(TOPIC_CHANGECOURSE,"В итоге, с учетом мнения большинства членов команды, было решено отправиться обратно в Хоринис, чтобы сообщить паладинам о найденной нами на острове магической руде.");
		LIGOFORFREE = TRUE;
	}
	else if(CREWAGREEAWAYBACKPAL < CREWAGREEAWAYBACKSELL)
	{
		B_GivePlayerXP(450);
		AI_Output(other,self,"DIA_Jack_LI_ChangeCourseDone_01_10");	//Большинству из них пришлась по вкусу идея потребовать с паладинов приличную сумму золота за найденную нами руду.
		AI_Output(self,other,"DIA_Jack_LI_ChangeCourseDone_01_12");	//Вот это другое дело! Если честно, иного я и не ожидал.
		AI_Output(other,self,"DIA_Jack_LI_ChangeCourseDone_01_13");	//Откуда такая уверенность?
		AI_Output(self,other,"DIA_Jack_LI_ChangeCourseDone_01_14");	//Просто все понимают, ради чего стоит рисковать жизнью, а ради чего - нет.
		B_LogEntry(TOPIC_CHANGECOURSE,"Большинству членов команды пришлась по вкусу идея потребовать с паладинов золото за найденную нами руду. Так что наш курс лежит обратно на Хоринис.");
		LIGOFORGOLD = TRUE;
	}
	else
	{
		B_GivePlayerXP(500);
		AI_Output(other,self,"DIA_Jack_LI_ChangeCourseDone_01_16");	//Мнения разделились. Половина за то, чтобы помочь паладинам, остальные - против.
		AI_Output(self,other,"DIA_Jack_LI_ChangeCourseDone_01_17");	//(задумчиво) Непростая ситуация.
		AI_Output(other,self,"DIA_Jack_LI_ChangeCourseDone_01_18");	//И что будем делать?
		AI_Output(self,other,"DIA_Jack_LI_ChangeCourseDone_01_19");	//Не знаю. Наверное, нам все-таки стоит вернуться на остров. А там - будь что будет!
		AI_Output(other,self,"DIA_Jack_LI_ChangeCourseDone_01_20");	//Хорошо! Так и сделаем.
		B_LogEntry(TOPIC_CHANGECOURSE,"В итоге мнения команды разделились. Половина выступила за то, чтобы помочь паладинам, остальные против. Но несмотря на это, мы с Джеком приняли решение все-таки вернуться обратно в Хоринис и уже там решить, как поступить с найденной нами на острове рудой.");
		LIGOFORUNKNOWN = TRUE;
	};
	MIS_CHANGECOURSE = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_CHANGECOURSE,LOG_SUCCESS);
};


