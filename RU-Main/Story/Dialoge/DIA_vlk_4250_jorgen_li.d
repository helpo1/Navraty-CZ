
instance DIA_JORGEN_LI_KAP3_EXIT(C_Info)
{
	npc = vlk_4250_jorgen_li;
	nr = 999;
	condition = dia_jorgen_li_kap3_exit_condition;
	information = dia_jorgen_li_kap3_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_jorgen_li_kap3_exit_condition()
{
	return TRUE;
};

func void dia_jorgen_li_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JORGEN_LI_PICKPOCKET(C_Info)
{
	npc = vlk_4250_jorgen_li;
	nr = 900;
	condition = dia_jorgen_li_pickpocket_condition;
	information = dia_jorgen_li_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_jorgen_li_pickpocket_condition()
{
	return C_Beklauen(76,120);
};

func void dia_jorgen_li_pickpocket_info()
{
	Info_ClearChoices(dia_jorgen_li_pickpocket);
	Info_AddChoice(dia_jorgen_li_pickpocket,Dialog_Back,dia_jorgen_li_pickpocket_back);
	Info_AddChoice(dia_jorgen_li_pickpocket,DIALOG_PICKPOCKET,dia_jorgen_li_pickpocket_doit);
};

func void dia_jorgen_li_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_jorgen_li_pickpocket);
};

func void dia_jorgen_li_pickpocket_back()
{
	Info_ClearChoices(dia_jorgen_li_pickpocket);
};


instance DIA_JORGEN_LI_STORM(C_Info)
{
	npc = vlk_4250_jorgen_li;
	nr = 1;
	condition = dia_jorgen_li_storm_condition;
	information = dia_jorgen_li_storm_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_jorgen_li_storm_condition()
{
	return TRUE;
};

func void dia_jorgen_li_storm_info()
{
	AI_Output(self,other,"DIA_Jorgen_LI_Storm_01_01");	//Наконец-то ты пришел в себя! Как себя чувствуешь?
	AI_Output(other,self,"DIA_Jorgen_LI_Storm_01_02");	//Вроде, нормально! Только вот голова раскалывается, как будто по ней ударили чем-то тяжелым.
	AI_Output(self,other,"DIA_Jorgen_LI_Storm_01_03");	//Да уж, приятель...(смеется) тебе прилично досталось!
	AI_Output(other,self,"DIA_Jorgen_LI_Storm_01_04");	//А что случилось?
	AI_Output(self,other,"DIA_Jorgen_LI_Storm_01_05");	//Ах, ну да, ты, видимо, практически ничего не помнишь.
	AI_Output(other,self,"DIA_Jorgen_LI_Storm_01_06");	//Ты прав, не очень много.
	AI_Output(self,other,"DIA_Jorgen_LI_Storm_01_07");	//Хммм...(серьезно) Во время шторма ты помогал мне управляться со штурвалом, и все бы шло хорошо...
	AI_Output(self,other,"DIA_Jorgen_LI_Storm_01_08");	//Но в самый его разгар одна из волн с такой силой обрушилась на наш корабль, что сбила тебя с ног и отбросила на фальшборт!
	AI_Output(self,other,"DIA_Jorgen_LI_Storm_01_09");	//Видимо, ты очень сильно ударился об него головой, поскольку сразу же потерял сознание.
	AI_Output(self,other,"DIA_Jorgen_LI_Storm_01_11");	//Мне с ребятами только чудом удалось вовремя подоспеть к тебе, чтобы оттащить от края.
	AI_Output(self,other,"DIA_Jorgen_LI_Storm_01_12");	//Иначе, следующей же волной твое бесчувственное тело смыло бы за борт.
	AI_Output(self,other,"DIA_Jorgen_LI_Storm_01_13");	//Черт! (вне себя) Да этот шторм вообще чуть не отправил всех нас на тот свет!
	AI_Output(other,self,"DIA_Jorgen_LI_Storm_01_14");	//Но, кажется, все обошлось.
	AI_Output(self,other,"DIA_Jorgen_LI_Storm_01_15");	//Да уж, обошлось... Благодари Инноса, что мы наткнулись на этот остров!
	AI_Output(self,other,"DIA_Jorgen_LI_Storm_01_16");	//Еще бы немного - и наш корабль разломился бы надвое!
	AI_Output(other,self,"DIA_Jorgen_LI_Storm_01_17");	//Думаю, тебе лучше успокоиться. Ведь нам уже ничего не угрожает.
	AI_Output(self,other,"DIA_Jorgen_LI_Storm_01_18");	//Как же! (нервно) Успокоишься тут...
	AI_Output(self,other,"DIA_Jorgen_LI_Storm_01_20");	//Эх, ладно... По крайней мере, одно радует - шторму сюда никогда не дойти.
	AI_Output(self,other,"DIA_Jorgen_LI_Storm_01_21");	//В этой бухте можно чувствовать себя в полной безопасности.
	AI_Output(self,other,"DIA_Jorgen_LI_Storm_01_23");	//Но радоваться еще рано! Теперь надо подумать, как починить наш корабль.
	AI_Output(other,self,"DIA_Jorgen_LI_Storm_01_24");	//А разве он нуждается в ремонте?
	AI_Output(self,other,"DIA_Jorgen_LI_Storm_01_25");	//Еще бы! Шторм его прилично потрепал.
	AI_Output(self,other,"DIA_Jorgen_LI_Storm_01_26");	//Пару дыр залатать, конечно, не проблема, но у нас сломан руль. А без него мы далеко не уплывем!
	AI_Output(other,self,"DIA_Jorgen_LI_Storm_01_27");	//Сколько это, по-твоему, займет времени?
	AI_Output(self,other,"DIA_Jorgen_LI_Storm_01_28");	//Я не знаю... Может, пару дней, а может быть и неделю. Точно не могу сказать.
	AI_Output(other,self,"DIA_Jorgen_LI_Storm_01_29");	//Понятно.
};


instance DIA_JORGEN_LI_REPAIR(C_Info)
{
	npc = vlk_4250_jorgen_li;
	nr = 3;
	condition = dia_jorgen_li_repair_condition;
	information = dia_jorgen_li_repair_info;
	permanent = FALSE;
	description = "Могу ли я чем-то помочь тебе с ремонтом?";
};


func int dia_jorgen_li_repair_condition()
{
	if(Npc_KnowsInfo(hero,dia_jorgen_li_storm))
	{
		return TRUE;
	};
};

func void dia_jorgen_li_repair_info()
{
	AI_Output(other,self,"DIA_Jorgen_LI_Repair_01_01");	//Могу ли я чем-то помочь тебе с ремонтом?
	AI_Output(self,other,"DIA_Jorgen_LI_Repair_01_02");	//Ты?! Хммм... Даже не знаю.
	AI_Output(self,other,"DIA_Jorgen_LI_Repair_01_03");	//Мне для начала надо получше осмотреть повреждения и потом еще придумать, как это можно все исправить.
	AI_Output(self,other,"DIA_Jorgen_LI_Repair_01_04");	//Так что сейчас твоя помощь навряд ли сможет мне пригодиться. Если только позже...
	AI_Output(other,self,"DIA_Jorgen_LI_Repair_01_05");	//Ясно.
	TORLOFLITIMER = Wld_GetDay();
	MIS_REPAIRSHIP = LOG_Running;
	Log_CreateTopic(TOPIC_REPAIRSHIP,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_REPAIRSHIP,LOG_Running);
	B_LogEntry(TOPIC_REPAIRSHIP,"Я предложил Йоргену помочь ему с ремонтом нашего корабля. Но он ответил, что сперва ему нужно осмотреть все повреждения корабля и придумать, как их устранить. Так что пока Йоргену моя помощь особо не нужна. Надо спросить его об этом позже.");
};


instance DIA_JORGEN_LI_REPAIRHELP(C_Info)
{
	npc = vlk_4250_jorgen_li;
	nr = 3;
	condition = dia_jorgen_li_repairhelp_condition;
	information = dia_jorgen_li_repairhelp_info;
	permanent = FALSE;
	description = "Как продвигается ремонт корабля?";
};


func int dia_jorgen_li_repairhelp_condition()
{
	var int daynow;
	daynow = Wld_GetDay();
	if((MIS_REPAIRSHIP == LOG_Running) && (TORLOFLITIMER <= (daynow - 2)))
	{
		return TRUE;
	};
};

func void dia_jorgen_li_repairhelp_info()
{
	AI_Output(other,self,"DIA_Jorgen_LI_RepairHelp_01_01");	//Как продвигается ремонт корабля?
	AI_Output(self,other,"DIA_Jorgen_LI_RepairHelp_01_02");	//Хорошо, что поинтересовался! Похоже, мне все-таки понадобится твоя помощь.
	AI_Output(other,self,"DIA_Jorgen_LI_RepairHelp_01_03");	//Конечно, нет проблем.
	AI_Output(self,other,"DIA_Jorgen_LI_RepairHelp_01_04");	//Тогда сразу перейдем к делу!
	AI_Output(self,other,"DIA_Jorgen_LI_RepairHelp_01_05");	//За эти дни я осмотрел все повреждения на корабле и пришел к выводу, что большинство из них совсем незначительные.
	AI_Output(self,other,"DIA_Jorgen_LI_RepairHelp_01_06");	//С ними я и сам справлюсь. Но у нас есть и одна серьезная проблема - это наш штурвал!
	AI_Output(other,self,"DIA_Jorgen_LI_RepairHelp_01_07");	//А что с ним?
	AI_Output(self,other,"DIA_Jorgen_LI_RepairHelp_01_08");	//Он вообще не работает! Похоже, его полностью сорвало, и теперь эта штука совершенно бесполезная вещь.
	AI_Output(self,other,"DIA_Jorgen_LI_RepairHelp_01_09");	//А без него, как ты сам понимаешь, корабль абсолютно неуправляем!
	AI_Output(other,self,"DIA_Jorgen_LI_RepairHelp_01_10");	//И что будем делать?
	AI_Output(self,other,"DIA_Jorgen_LI_RepairHelp_01_11");	//Мне думается, что вся эта проблема в одной из шестеренок.
	AI_Output(self,other,"DIA_Jorgen_LI_RepairHelp_01_12");	//Видимо, во время шторма у нее сорвало зубья, и по этой причине наш штурвал и потерял управление.
	AI_Output(self,other,"DIA_Jorgen_LI_RepairHelp_01_13");	//Так что если мы сможем найти ей замену - то наверняка решим эту проблему.
	AI_Output(other,self,"DIA_Jorgen_LI_RepairHelp_01_14");	//Но где мы возьмем новую шестеренку?
	AI_Output(self,other,"DIA_Jorgen_LI_RepairHelp_01_15");	//Вот именно этим я и хотел попросить тебя заняться. Может быть, тебе повезет и ты сможешь найти для этого дела какую-нибудь подходящую вещицу!
	AI_Output(other,self,"DIA_Jorgen_LI_RepairHelp_01_16");	//Это будет непросто.
	AI_Output(self,other,"DIA_Jorgen_LI_RepairHelp_01_17");	//Я понимаю, но другого выхода у нас нет... Иначе, мы тут застрянем надолго!
	AI_Output(other,self,"DIA_Jorgen_LI_RepairHelp_01_18");	//Ладно, попробую поискать что-нибудь подходящее.
	AI_Output(self,other,"DIA_Jorgen_LI_RepairHelp_01_19");	//Вот и отлично! А я, чтобы не терять зря времени, пока займусь починкой остальных повреждений.
	AI_Output(other,self,"DIA_Jorgen_LI_RepairHelp_01_20");	//Хорошо.
	B_LogEntry(TOPIC_REPAIRSHIP,"Йорген попросил меня помочь ему со штурвалом, который был сломан во время шторма. У нашего руля сорвало одну из шестеренок и теперь корабль совершенно неуправляем. Йорген попросил меня поискать замену этой детали - какую-нибудь вещь, которая могла бы послужить в качестве шестеренки.");
};


instance DIA_JORGEN_LI_REPAIRHELPDONE(C_Info)
{
	npc = vlk_4250_jorgen_li;
	nr = 3;
	condition = dia_jorgen_li_repairhelpdone_condition;
	information = dia_jorgen_li_repairhelpdone_info;
	permanent = FALSE;
	description = "Я тут нашел кое-что.";
};


func int dia_jorgen_li_repairhelpdone_condition()
{
	var int daynow;
	daynow = Wld_GetDay();
	if((MIS_REPAIRSHIP == LOG_Running) && Npc_KnowsInfo(hero,dia_jorgen_li_repairhelp) && (Npc_HasItems(hero,itmi_stuff_gearwheel_02) >= 1))
	{
		return TRUE;
	};
};

func void dia_jorgen_li_repairhelpdone_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Jorgen_LI_RepairHelpDone_01_01");	//Я тут нашел кое-что.
	AI_Output(self,other,"DIA_Jorgen_LI_RepairHelpDone_01_02");	//Что именно?
	AI_Output(other,self,"DIA_Jorgen_LI_RepairHelpDone_01_03");	//Вот, взгляни.
	B_GiveInvItems(other,self,itmi_stuff_gearwheel_02,1);
	AI_Output(self,other,"DIA_Jorgen_LI_RepairHelpDone_01_04");	//Какая интересная штуковина! (удивленно) Где ты ее откопал?
	AI_Output(other,self,"DIA_Jorgen_LI_RepairHelpDone_01_05");	//Да так - в одной небольшой пирамиде, расположенной на острове.
	AI_Output(self,other,"DIA_Jorgen_LI_RepairHelpDone_01_06");	//Совсем неплохо! Смотрю, ты зря времени не терял.
	AI_Output(other,self,"DIA_Jorgen_LI_RepairHelpDone_01_07");	//Лучше скажи мне, она подойдет в качестве шестеренки?
	AI_Output(self,other,"DIA_Jorgen_LI_RepairHelpDone_01_08");	//Хммм... сейчас поглядим.
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,"SHIP_EXTRO");
	AI_AlignToWP(self);
	AI_PlayAni(self,"T_PLUNDER");
	AI_GotoNpc(self,hero);
	AI_TurnToNPC(self,other);
	AI_LookAtNpc(self,other);
	AI_Output(other,self,"DIA_Jorgen_LI_RepairHelpDone_01_09");	//Ну как?
	AI_Output(self,other,"DIA_Jorgen_LI_RepairHelpDone_01_10");	//Парень, похоже она действительно подходит! (радостно) Я просто глазам своим не верю!
	AI_Output(other,self,"DIA_Jorgen_LI_RepairHelpDone_01_11");	//Значит, наш штурвал теперь в порядке?
	AI_Output(self,other,"DIA_Jorgen_LI_RepairHelpDone_01_12");	//Подожди, одну секундочку... Это надо проверить!
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,"SHIP_EXTRO");
	AI_AlignToWP(self);
	AI_PlayAni(self,"T_PLUNDER");
	AI_GotoNpc(self,hero);
	AI_TurnToNPC(self,other);
	AI_LookAtNpc(self,other);
	AI_Output(other,self,"DIA_Jorgen_LI_RepairHelpDone_01_13");	//И?
	AI_Output(self,other,"DIA_Jorgen_LI_RepairHelpDone_01_14");	//Да! Кажется, все в порядке. Правда управление стало немного туговатым, но это мы как-нибудь переживем.
	AI_Output(self,other,"DIA_Jorgen_LI_RepairHelpDone_01_15");	//Главное, что теперь мы сможем смыться с этого острова!
	AI_Output(other,self,"DIA_Jorgen_LI_RepairHelpDone_01_16");	//Это отличная новость. Когда отчаливаем?
	MIS_REPAIRSHIP = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_REPAIRSHIP,LOG_SUCCESS);
	B_LogEntry(TOPIC_REPAIRSHIP,"Я принес Йоргену найденный мной кусок камня в виде шестеренки. И к его большому удивлению, эта вещь отлично подошла на роль шестеренки для нашего штурвала.");
	if((MIS_LOSTISLAND == LOG_SUCCESS) && (MIS_REPAIRSHIP == LOG_SUCCESS) && (MIS_CHANGECOURSE == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Jorgen_LI_RepairHelpDone_01_17");	//Да хоть прямо сейчас!
		if(((Gorn_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_fighter_li) == FALSE) && (GORNLIHERE == TRUE)) || ((MiltenNW_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_mage_li) == FALSE) && (MILTENLIHERE == TRUE)) || ((Lester_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_psionic_li) == FALSE) && (LESTERLIHERE == TRUE)) || ((Diego_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_thief_li) == FALSE) && (DIEGOLIHERE == TRUE)) || ((Angar_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(djg_705_angar_li) == FALSE) && (ANGARLIHERE == TRUE)))
		{
			AI_Output(self,other,"DIA_Jorgen_LI_RepairHelpDone_01_18");	//Только вначале надо сообщить парням на берегу, что мы снимаемся с якоря.
			AI_Output(self,other,"DIA_Jorgen_LI_RepairHelpDone_01_19");	//Не будем же мы их бросать тут! (смеется)
			AI_Output(other,self,"DIA_Jorgen_LI_RepairHelpDone_01_20");	//Хорошо, я им передам.
			CANAWAYFROMLI = TRUE;
			MIS_GATHERCREW = LOG_Running;
			Log_CreateTopic(TOPIC_GATHERCREW,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_GATHERCREW,LOG_Running);
			Log_AddEntry(TOPIC_GATHERCREW,"Йорген попросил меня сообщить всем парням на берегу, что мы снимаемся с якоря.");
		}
		else
		{
			AI_Output(self,other,"DIA_Jorgen_LI_RepairHelpDone_01_21");	//Так что только скажи - и мы сразу же поднимем паруса.
			AI_Output(other,self,"DIA_Jorgen_LI_RepairHelpDone_01_22");	//Хорошо.
			CANAWAYFROMLI = TRUE;
			NOPEOPLEONLANDLI = TRUE;
		};
	}
	else
	{
		TORLOFLITIMERAWAY = Wld_GetDay();
		AI_Output(self,other,"DIA_Jorgen_LI_RepairHelpDone_01_23");	//Не так быстро, приятель! Штурвал, конечно, теперь в порядке, но это еще не означает, что корабль целиком и полностью готов к отплытию.
		AI_Output(self,other,"DIA_Jorgen_LI_RepairHelpDone_01_24");	//Я еще не успел починить некоторые другие небольшие повреждения, а выходить в море как следует не подготовившись - дело опасное!
		if(MIS_LOSTISLAND == LOG_Running)
		{
			AI_Output(self,other,"DIA_Jorgen_LI_RepairHelpDone_01_25");	//Тем более мы еще до сих пор не знаем - где находимся!
		}
		else if(MIS_CHANGECOURSE == LOG_Running)
		{
			AI_Output(self,other,"DIA_Jorgen_LI_RepairHelpDone_01_26");	//Тем более мы еще до сих не решили - куда нам плыть.
		};
		AI_Output(self,other,"DIA_Jorgen_LI_RepairHelpDone_01_27");	//Так что спешить не будем!
		AI_Output(other,self,"DIA_Jorgen_LI_RepairHelpDone_01_28");	//Ладно, тогда сам скажешь.
		AI_Output(self,other,"DIA_Jorgen_LI_RepairHelpDone_01_29");	//Конечно.
	};
};


instance DIA_JORGEN_LI_AWAY(C_Info)
{
	npc = vlk_4250_jorgen_li;
	nr = 3;
	condition = dia_jorgen_li_away_condition;
	information = dia_jorgen_li_away_info;
	permanent = TRUE;
	description = "Когда отплываем?";
};


func int dia_jorgen_li_away_condition()
{
	var int daynow;
	daynow = Wld_GetDay();
	if((MIS_REPAIRSHIP == LOG_SUCCESS) && (CANAWAYFROMLI == FALSE) && (TORLOFLITIMERAWAY <= (daynow - 1)))
	{
		return TRUE;
	};
};

func void dia_jorgen_li_away_info()
{
	AI_Output(other,self,"DIA_Jorgen_LI_Away_01_00");	//Когда отплываем?
	if((MIS_LOSTISLAND == LOG_SUCCESS) && (MIS_REPAIRSHIP == LOG_SUCCESS) && (MIS_CHANGECOURSE == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Jorgen_LI_Away_01_01");	//Да хоть прямо сейчас!
		if(((Gorn_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_fighter_li) == FALSE) && (GORNLIHERE == TRUE)) || ((MiltenNW_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_mage_li) == FALSE) && (MILTENLIHERE == TRUE)) || ((Lester_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_psionic_li) == FALSE) && (LESTERLIHERE == TRUE)) || ((Diego_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_thief_li) == FALSE) && (DIEGOLIHERE == TRUE)) || ((Angar_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(djg_705_angar_li) == FALSE) && (ANGARLIHERE == TRUE)))
		{
			AI_Output(self,other,"DIA_Jorgen_LI_Away_01_02");	//Только вначале надо сообщить парням на берегу, что мы снимаемся с якоря.
			AI_Output(self,other,"DIA_Jorgen_LI_Away_01_03");	//Не будем же мы их бросать тут! (смеется)
			AI_Output(other,self,"DIA_Jorgen_LI_Away_01_04");	//Хорошо, я им передам.
			CANAWAYFROMLI = TRUE;
			MIS_GATHERCREW = LOG_Running;
			Log_CreateTopic(TOPIC_GATHERCREW,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_GATHERCREW,LOG_Running);
			B_LogEntry(TOPIC_GATHERCREW,"Йорген попросил меня сообщить всем парням на берегу, что мы снимаемся с якоря.");
		}
		else
		{
			AI_Output(self,other,"DIA_Jorgen_LI_Away_01_05");	//Так что только скажи - и мы сразу же поднимем паруса.
			AI_Output(other,self,"DIA_Jorgen_LI_Away_01_06");	//Хорошо.
			CANAWAYFROMLI = TRUE;
			NOPEOPLEONLANDLI = TRUE;
		};
	}
	else if(MIS_LOSTISLAND == LOG_Running)
	{
		AI_Output(self,other,"DIA_Jorgen_LI_Away_01_07");	//Но мы же еще до сих пор не знаем - где находимся!
		AI_Output(self,other,"DIA_Jorgen_LI_Away_01_08");	//Так что об этом пока рано думать.
		AI_Output(other,self,"DIA_Jorgen_LI_Away_01_09");	//Как скажешь.
	}
	else if(MIS_CHANGECOURSE == LOG_Running)
	{
		AI_Output(self,other,"DIA_Jorgen_LI_Away_01_10");	//Но мы же еще до сих пор не решили - куда нам плыть!
		AI_Output(self,other,"DIA_Jorgen_LI_Away_01_11");	//Так что об этом пока рано думать.
		AI_Output(other,self,"DIA_Jorgen_LI_Away_01_12");	//Как скажешь.
	}
	else
	{
		AI_Output(self,other,"DIA_Jorgen_LI_Away_01_13");	//Пока я не закончу с ремонтом корабля, об этом рано думать.
		AI_Output(self,other,"DIA_Jorgen_LI_Away_01_14");	//Так что лучше займись пока каким-нибудь полезным делом.
		AI_Output(other,self,"DIA_Jorgen_LI_Away_01_15");	//Как скажешь.
	};
};


instance DIA_JORGEN_LI_AWAYDONE(C_Info)
{
	npc = vlk_4250_jorgen_li;
	nr = 3;
	condition = dia_jorgen_li_awaydone_condition;
	information = dia_jorgen_li_awaydone_info;
	permanent = TRUE;
	description = "Пора отправляться.";
};


func int dia_jorgen_li_awaydone_condition()
{
	var int daynow;
	daynow = Wld_GetDay();
	if((CANAWAYFROMLI == TRUE) && (CAPITANORDERLIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void dia_jorgen_li_awaydone_info()
{
	var int crewlicountmiss;
	var string concatText;
	var string text;
	var string text2;
	AI_Output(other,self,"DIA_Jorgen_LI_AwayDone_01_00");	//Пора отправляться.
	if(NOPEOPLEONLANDLI == TRUE)
	{
		AI_Output(self,other,"DIA_Jorgen_LI_AwayDone_01_01");	//Хорошо! Снимаемся с якоря.
		AI_Output(self,other,"DIA_Jorgen_LI_AwayDone_01_02");	//А ты пока можешь пойти и отдохнуть у себя в каюте. Небось, набегался за последние дни?
		AI_Output(other,self,"DIA_Jorgen_LI_AwayDone_01_03");	//Есть немного.
		AI_Output(self,other,"DIA_Jorgen_LI_AwayDone_01_04");	//Ну, тогда иди поспи. А мы скоро отправимся!
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
			AI_Output(self,other,"DIA_Jorgen_LI_AwayDone_01_06");	//Хорошо! Вроде бы, все парни на корабле, а значит, можно сниматься с якоря.
			AI_Output(self,other,"DIA_Jorgen_LI_AwayDone_01_07");	//А ты пока можешь пойти и отдохнуть у себя в каюте. Небось, набегался за последние дни?
			AI_Output(other,self,"DIA_Jorgen_LI_AwayDone_01_08");	//Есть немного.
			AI_Output(self,other,"DIA_Jorgen_LI_AwayDone_01_09");	//Ну, тогда иди поспи. А мы скоро отправимся!
			CAPITANORDERLIAWAY = TRUE;
			MIS_GATHERCREW = LOG_SUCCESS;
			Log_SetTopicStatus(TOPIC_GATHERCREW,LOG_SUCCESS);
			B_LogEntry(TOPIC_GATHERCREW,"Вся команда на корабле и теперь можно отправляться в путь.");
			AI_StopProcessInfos(self);
		}
		else
		{
			AI_Output(self,other,"DIA_Jorgen_LI_AwayDone_01_11");	//Но еще же не все парни вернулись с берега! (удивленно) Мы не можем их бросить!
			AI_Output(other,self,"DIA_Jorgen_LI_AwayDone_01_12");	//А кто отсутствует?
			AI_Output(self,other,"DIA_Jorgen_LI_AwayDone_01_13");	//(осматриваясь) Кажется, нет...
			if((Gorn_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_fighter_li) == FALSE) && (GORNLIHERE == TRUE) && (GORNLIONBOARD == FALSE))
			{
				AI_Output(self,other,"DIA_Jorgen_LI_AwayDone_01_14");	//...Горна
				crewlicountmiss = crewlicountmiss + 1;
			};
			if((MiltenNW_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_mage_li) == FALSE) && (MILTENLIHERE == TRUE) && (MILTENLIONBOARD == FALSE))
			{
				if(crewlicountmiss > 0)
				{
					concatText = ConcatStrings(concatText,text2);
				};
				AI_Output(self,other,"DIA_Jorgen_LI_AwayDone_01_15");	//...Милтена
				crewlicountmiss = crewlicountmiss + 1;
			};
			if((Lester_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_psionic_li) == FALSE) && (LESTERLIHERE == TRUE) && (LESTERLIONBOARD == FALSE))
			{
				if(crewlicountmiss > 0)
				{
					concatText = ConcatStrings(concatText,text2);
				};
				AI_Output(self,other,"DIA_Jorgen_LI_AwayDone_01_16");	//...Лестера
				crewlicountmiss = crewlicountmiss + 1;
			};
			if((Diego_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(pc_thief_li) == FALSE) && (DIEGOLIHERE == TRUE) && (DIEGOLIONBOARD == FALSE))
			{
				if(crewlicountmiss > 0)
				{
					concatText = ConcatStrings(concatText,text2);
				};
				AI_Output(self,other,"DIA_Jorgen_LI_AwayDone_01_17");	//...Диего
				crewlicountmiss = crewlicountmiss + 1;
			};
			if((Angar_IsOnBoard == LOG_SUCCESS) && (Npc_IsDead(djg_705_angar_li) == FALSE) && (ANGARLIHERE == TRUE) && (ANGARLIONBOARD == FALSE))
			{
				if(crewlicountmiss > 0)
				{
					concatText = ConcatStrings(concatText,text2);
				};
				AI_Output(self,other,"DIA_Jorgen_LI_AwayDone_01_18");	//...Кор Ангара
				crewlicountmiss = crewlicountmiss + 1;
			};
			AI_Output(self,other,"DIA_Jorgen_LI_AwayDone_01_19");	//Остальные парни вроде бы на месте!
			if(crewlicountmiss >= 2)
			{
				AI_Output(other,self,"DIA_Jorgen_LI_AwayDone_01_20");	//Ладно! Я им передам, чтобы возвращались на корабль.
			}
			else
			{
				AI_Output(other,self,"DIA_Jorgen_LI_AwayDone_01_21");	//Ладно! Я ему передам, чтобы возвращался на корабль.
			};
		};
	};
};


instance DIA_JORGEN_LI_ISLAND(C_Info)
{
	npc = vlk_4250_jorgen_li;
	nr = 1;
	condition = dia_jorgen_li_island_condition;
	information = dia_jorgen_li_island_info;
	permanent = FALSE;
	description = "Где мы и что это за остров?";
};


func int dia_jorgen_li_island_condition()
{
	if(Npc_KnowsInfo(hero,dia_jorgen_li_storm))
	{
		return TRUE;
	};
};

func void dia_jorgen_li_island_info()
{
	AI_Output(other,self,"DIA_Jorgen_LI_Island_01_01");	//Где мы и что это за остров?
	AI_Output(self,other,"DIA_Jorgen_LI_Island_01_02");	//Мне-то почем знать, приятель...(смеется) Я этот остров так же, как и ты вижу впервые в жизни!
	AI_Output(self,other,"DIA_Jorgen_LI_Island_01_03");	//И я абсолютно не имею понятия, где мы сейчас находимся.
	AI_Output(other,self,"DIA_Jorgen_LI_Island_01_04");	//Выходит, мы серьезно заплутали.
	AI_Output(self,other,"DIA_Jorgen_LI_Island_01_05");	//Похоже на то! (печально) Один только Иннос знает, куда нас занесло.
	AI_Output(self,other,"DIA_Jorgen_LI_Island_01_06");	//Конечно, можно было бы поплыть куда-нибудь наугад, но вот только я боюсь, что добром это навряд ли кончится.
	AI_Output(other,self,"DIA_Jorgen_LI_Island_01_07");	//И что будем делать?
	AI_Output(self,other,"DIA_Jorgen_LI_Island_01_08");	//Спросил бы ты что-нибудь полегче...
	AI_Output(other,self,"DIA_Jorgen_LI_Island_01_09");	//Ну, хоть какие-нибудь мысли по этому поводу у тебя есть?
	AI_Output(self,other,"DIA_Jorgen_LI_Island_01_10");	//Хммм... ну, если и есть, то только одна.
	AI_Output(other,self,"DIA_Jorgen_LI_Island_01_11");	//И какая же?
	AI_Output(self,other,"DIA_Jorgen_LI_Island_01_12");	//Самим попробовать разобраться, что тут к чему.
	AI_Output(self,other,"DIA_Jorgen_LI_Island_01_13");	//Если сможем хотя бы приблизительно понять, в какой части океана мы очутились - то запросто сможем вернуться на прежний курс.
	AI_Output(other,self,"DIA_Jorgen_LI_Island_01_14");	//Но как же это сделать?
	AI_Output(self,other,"DIA_Jorgen_LI_Island_01_15");	//Не знаю...(печально) Возможно, стоит прогуляться по самому острову.
	AI_Output(self,other,"DIA_Jorgen_LI_Island_01_16");	//Думаю, если и искать ответы на все наши вопросы, то только там. Здесь их точно нет!
	AI_Output(other,self,"DIA_Jorgen_LI_Island_01_17");	//Неплохая идея.
	AI_Output(self,other,"DIA_Jorgen_LI_Island_01_18");	//Ну да! А там, глядишь, может быть, что-нибудь и прояснится.
	MIS_LOSTISLAND = LOG_Running;
	Log_CreateTopic(TOPIC_LOSTISLAND,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LOSTISLAND,LOG_Running);
	B_LogEntry(TOPIC_LOSTISLAND,"Похоже, что мы основательно заблудились. Наш капитан абсолютно не имеет понятия о том, что это за остров и где мы вообще очутились. Единственное, что нам остается, это попробовать самим во всем разобраться и выяснить, где мы сейчас находимся.");
	Log_AddEntry(TOPIC_LOSTISLAND,"Поговорив с Йоргеном, мы пришли к обоюдному согласию, что для начала стоило бы просто наведаться на этот самый загадочный остров и как-можно тщательней его осмотреть. Возможно, там что-нибудь и удастся выяснить.");
};


instance DIA_JORGEN_LI_ISLANDPROGRESS(C_Info)
{
	npc = vlk_4250_jorgen_li;
	nr = 1;
	condition = dia_jorgen_li_islandprogress_condition;
	information = dia_jorgen_li_islandprogress_info;
	permanent = FALSE;
	description = "Посмотри, я нашел эту плитку.";
};


func int dia_jorgen_li_islandprogress_condition()
{
	if((MIS_LOSTISLAND == LOG_Running) && (Npc_HasItems(hero,itwr_lostislandmap) >= 1))
	{
		return TRUE;
	};
};

func void dia_jorgen_li_islandprogress_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Jorgen_LI_IslandProgress_01_00");	//Посмотри, я нашел эту плитку.
	AI_Output(self,other,"DIA_Jorgen_LI_IslandProgress_01_01");	//Хммм... какая занятная штука!
	AI_Output(self,other,"DIA_Jorgen_LI_IslandProgress_01_02");	//Похоже, тебе везет на подобного рода вещи...(смеется)
	AI_Output(other,self,"DIA_Jorgen_LI_IslandProgress_01_03");	//Возможно! Кстати, на ней изображены какие-то странного рода символы.
	AI_Output(other,self,"DIA_Jorgen_LI_IslandProgress_01_04");	//Что именно они означают, я так и не понял.
	AI_Output(self,other,"DIA_Jorgen_LI_IslandProgress_01_05");	//Дай мне посмотреть...
	AI_Output(other,self,"DIA_Jorgen_LI_IslandProgress_01_06");	//Вот, держи.
	B_GiveInvItems(other,self,itwr_lostislandmap,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Jorgen_LI_IslandProgress_01_07");	//Хммм... действительно, все это очень странно.
	AI_Output(self,other,"DIA_Jorgen_LI_IslandProgress_01_08");	//Хотя если приглядеться получше, то все это очень смахивает на...(нерешительно)
	AI_Output(other,self,"DIA_Jorgen_LI_IslandProgress_01_09");	//На что?
	AI_Output(self,other,"DIA_Jorgen_LI_IslandProgress_01_10");	//Точно не уверен, но это каменная плитка немного напоминает карту.
	AI_Output(other,self,"DIA_Jorgen_LI_IslandProgress_01_11");	//Карту?
	AI_Output(self,other,"DIA_Jorgen_LI_IslandProgress_01_12");	//Да, карту! Вот только что она показывает - этого я не могу сказать.
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Jorgen_LI_IslandProgress_01_13");	//Похоже, тут еще выбиты какие-то цифры. Возможно, они и есть ключ к расшифровке того, что изображено на самой карте!
	AI_Output(other,self,"DIA_Jorgen_LI_IslandProgress_01_14");	//А как нам это понять?
	AI_Output(self,other,"DIA_Jorgen_LI_IslandProgress_01_15");	//Пока не знаю! Хотя... есть тут, конечно, одна идейка.
	AI_Output(self,other,"DIA_Jorgen_LI_IslandProgress_01_17");	//Это всего лишь догадки, но, возможно, эти цифры означают широту и долготу этого острова.
	AI_Output(self,other,"DIA_Jorgen_LI_IslandProgress_01_18");	//Если это действительно окажется именно так, то мы без труда сможем определить - где мы сейчас находимся.
	AI_Output(self,other,"DIA_Jorgen_LI_IslandProgress_01_19");	//Правда для этого мне бы понадобился морской секстант.
	AI_Output(other,self,"DIA_Jorgen_LI_IslandProgress_01_20");	//А это проблема?
	AI_Output(self,other,"DIA_Jorgen_LI_IslandProgress_01_21");	//Да, поскольку у меня его попросту нет...(печально) А без него я не смогу сделать точные расчеты.
	AI_Output(other,self,"DIA_Jorgen_LI_IslandProgress_01_22");	//Хорошо! Я поищу его для тебя.
	AI_Output(self,other,"DIA_Jorgen_LI_IslandProgress_01_23");	//Попробуй, конечно! Хотя и не думаю, что здесь, на острове можно отыскать подобного рода вещь.
	AI_Output(self,other,"DIA_Jorgen_LI_IslandProgress_01_24");	//Но, может быть, тебе опять как всегда повезет...(смеется) и тогда, кто знает!
	CAPNEEDSEXTANT = TRUE;
	B_LogEntry(TOPIC_LOSTISLAND,"Я показал Йоргену каменную плитку, которую нашел в древних развалинах на острове. Он предположил, что на плитке изображена некая таинственная карта. Кроме того, на обратной стороне этой каменной таблички нацарапано несколько цифр, которые вполне могут означать что-то очень важное - например широту и долготу самого острова. Но чтобы проверить эту версию, Йоргену нужен секстант.");
};


instance DIA_JORGEN_LI_ISLANDPROGRESSNEXT(C_Info)
{
	npc = vlk_4250_jorgen_li;
	nr = 1;
	condition = dia_jorgen_li_islandprogressnext_condition;
	information = dia_jorgen_li_islandprogressnext_info;
	permanent = FALSE;
	description = "У меня есть секстант.";
};


func int dia_jorgen_li_islandprogressnext_condition()
{
	if((MIS_LOSTISLAND == LOG_Running) && (CAPNEEDSEXTANT == TRUE) && (Npc_HasItems(hero,ItMi_Sextant) >= 1))
	{
		return TRUE;
	};
};

func void dia_jorgen_li_islandprogressnext_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Jorgen_LI_IslandProgressNext_01_00");	//У меня есть секстант.
	AI_Output(self,other,"DIA_Jorgen_LI_IslandProgressNext_01_01");	//Правда? (удивленно) Но откуда он у тебя?
	AI_Output(other,self,"DIA_Jorgen_LI_IslandProgressNext_01_02");	//Не важно.
	AI_Output(self,other,"DIA_Jorgen_LI_IslandProgressNext_01_03");	//Ну ладно. Как скажешь, приятель...(смеется) Давай его сюда.
	AI_Output(other,self,"DIA_Jorgen_LI_IslandProgressNext_01_04");	//Вот, держи.
	B_GiveInvItems(other,self,ItMi_Sextant,1);
	AI_Output(self,other,"DIA_Jorgen_LI_IslandProgressNext_01_05");	//Отлично! Теперь я наконец-то смогу заняться расшифровкой тех странных символов.
	AI_Output(other,self,"DIA_Jorgen_LI_IslandProgressNext_01_06");	//И сколько времени тебе на это понадобится?
	AI_Output(self,other,"DIA_Jorgen_LI_IslandProgressNext_01_07");	//Думаю, не больше пары дней.
	AI_Output(other,self,"DIA_Jorgen_LI_IslandProgressNext_01_08");	//Хорошо, тогда подождем.
	TORLOFDESCRTIMER = Wld_GetDay();
	TORLOFBEGINSEARCH = TRUE;
	B_LogEntry(TOPIC_LOSTISLAND,"Я достал для Йоргена секстант. Теперь он сможет приступить к своим расчетам. По его словам, на это уйдет не более двух дней.");
};


instance DIA_JORGEN_LI_SEARCH(C_Info)
{
	npc = vlk_4250_jorgen_li;
	nr = 3;
	condition = dia_jorgen_li_search_condition;
	information = dia_jorgen_li_search_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_jorgen_li_search_condition()
{
	var int daynow;
	daynow = Wld_GetDay();
	if((MIS_LOSTISLAND == LOG_Running) && (TORLOFBEGINSEARCH == TRUE) && (TORLOFBEGINSEARCH <= (daynow - 2)))
	{
		return TRUE;
	};
};

func void dia_jorgen_li_search_info()
{
	B_GivePlayerXP(300);
	AI_Output(self,other,"DIA_Jorgen_LI_Search_01_00");	//Хорошо, что ты здесь! Я уже закончил свои расчеты.
	AI_Output(other,self,"DIA_Jorgen_LI_Search_01_01");	//И как успехи?
	AI_Output(self,other,"DIA_Jorgen_LI_Search_01_02");	//Совсем неплохо! Есть чем порадовать.
	AI_Output(self,other,"DIA_Jorgen_LI_Search_01_04");	//Хмм. Кажется, мы не ошиблись, полагая, что эти символы действительно кое-что значат!
	AI_Output(self,other,"DIA_Jorgen_LI_Search_01_05");	//Я сверился по карте с нашим предыдущим курсом и ввел небольшую поправку с учетом возможного отклонения во время шторма.
	AI_Output(self,other,"DIA_Jorgen_LI_Search_01_06");	//А потом подставил в свои расчеты те цифры, что были нарисованы на обратной стороне найденной тобой каменной плитки.
	AI_Output(self,other,"DIA_Jorgen_LI_Search_01_07");	//И представляешь, они подошли!
	AI_Output(other,self,"DIA_Jorgen_LI_Search_01_08");	//Это как?
	AI_Output(self,other,"DIA_Jorgen_LI_Search_01_09");	//А вот так! Если наложить их на карту в определенной последовательности, то они указывают место, где мы вполне бы могли находиться в данный момент.
	AI_Output(self,other,"DIA_Jorgen_LI_Search_01_10");	//Конечно, мои расчеты не совсем точные...(скептически) Но, по крайней мере, это уже дает приблизительное представление о том, что нам делать и куда плыть!
	AI_Output(other,self,"DIA_Jorgen_LI_Search_01_11");	//Хочешь сказать, что мы сможем убраться с этого острова когда пожелаем?
	AI_Output(self,other,"DIA_Jorgen_LI_Search_01_12");	//В точку! (смеется) Так что, как только корабль будет готов к отплытию, можем сниматься с якоря.
	AI_Output(other,self,"DIA_Jorgen_LI_Search_01_13");	//Это действительно хорошие новости.
	AI_Output(self,other,"DIA_Jorgen_LI_Search_01_14");	//Верно, парень. Мне они тоже по душе!
	AI_Output(other,self,"DIA_Jorgen_LI_Search_01_15");	//Тогда не будем терять времени и займемся делами.
	AI_Output(self,other,"DIA_Jorgen_LI_Search_01_16");	//Согласен! Чем быстрее мы все закончим, тем скорее смоемся отсюда.
	AI_Output(self,other,"DIA_Jorgen_LI_Search_01_17");	//Да, и еще...(серьезно) Вот, возьми эту карту! На ней отмечен непосредственно сам остров и точный к нему курс.
	B_GiveInvItems(self,other,itmi_seamaplostisland,1);
	AI_Output(self,other,"DIA_Jorgen_LI_Search_01_18");	//Возможно, эта вещица тебе еще как-то пригодится. А если нет, то все равно - пусть пока хранится у тебя.
	MIS_LOSTISLAND = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_LOSTISLAND,LOG_SUCCESS);
	B_LogEntry(TOPIC_LOSTISLAND,"Йорген закончил свои расчеты, и они оказались весьма удачными. Плитка, что я нашел на острове, похоже, действительно была своеобразной картой, а записи ней помогли Йоргену с большой долей вероятности определить наше текущее местоположение. Так что, как только наш корабль приобретет надлежащий вид, можно будет наконец-то смотаться с этого острова.");
};


instance DIA_JORGEN_LI_ABOUTISLAND(C_Info)
{
	npc = vlk_4250_jorgen_li;
	nr = 1;
	condition = dia_jorgen_li_aboutisland_condition;
	information = dia_jorgen_li_aboutisland_info;
	permanent = FALSE;
	description = "Интересно, на этом острове кто-нибудь живет?";
};


func int dia_jorgen_li_aboutisland_condition()
{
	if(Npc_KnowsInfo(hero,dia_jorgen_li_island))
	{
		return TRUE;
	};
};

func void dia_jorgen_li_aboutisland_info()
{
	AI_Output(other,self,"DIA_Jorgen_LI_AboutIsland_01_01");	//Интересно, на этом острове кто-нибудь живет?
	AI_Output(self,other,"DIA_Jorgen_LI_AboutIsland_01_02");	//Навряд ли. Похоже на то, что он вообще необитаем.
	AI_Output(other,self,"DIA_Jorgen_LI_AboutIsland_01_03");	//Ты в этом уверен?
	AI_Output(self,other,"DIA_Jorgen_LI_AboutIsland_01_04");	//Эх, парень... Я сейчас уже ни в чем не уверен!
	AI_Output(self,other,"DIA_Jorgen_LI_AboutIsland_01_05");	//Но если рассуждать логично, то наше появление тут не могло пройти незамеченным.
	AI_Output(self,other,"DIA_Jorgen_LI_AboutIsland_01_06");	//Так что, если бы тут кто-то и жил, то наверняка бы уже дал о себе знать.
	AI_Output(self,other,"DIA_Jorgen_LI_AboutIsland_01_07");	//А пока что, кроме пары огненных ящериц на берегу, мы так никого и не встретили.
	AI_Output(other,self,"DIA_Jorgen_LI_AboutIsland_01_08");	//Но все может измениться.
	AI_Output(self,other,"DIA_Jorgen_LI_AboutIsland_01_09");	//Может...(нервно) Но по мне, так лучше поменьше всяких разных сюрпризов. И без того хватает!
};


instance DIA_JORGEN_LI_WHEREGUYS(C_Info)
{
	npc = vlk_4250_jorgen_li;
	nr = 2;
	condition = dia_jorgen_li_whereguys_condition;
	information = dia_jorgen_li_whereguys_info;
	permanent = FALSE;
	description = "А где все остальные парни?!";
};


func int dia_jorgen_li_whereguys_condition()
{
	if(Npc_KnowsInfo(hero,dia_jorgen_li_storm))
	{
		return TRUE;
	};
};

func void dia_jorgen_li_whereguys_info()
{
	AI_Output(other,self,"DIA_Jorgen_LI_WhereGuys_01_01");	//А где все остальные парни?
	AI_Output(self,other,"DIA_Jorgen_LI_WhereGuys_01_02");	//Большинство ребят сошло на берег, как только мы причалили к этому острову.
	AI_Output(other,self,"DIA_Jorgen_LI_WhereGuys_01_03");	//Зачем?
	AI_Output(self,other,"DIA_Jorgen_LI_WhereGuys_01_04");	//Ну...(замялся) Они сказали, что хотят разведать ближайшие окрестности этого острова.
	AI_Output(self,other,"DIA_Jorgen_LI_WhereGuys_01_05");	//Хотя, скорее всего, дело в другом.
	AI_Output(other,self,"DIA_Jorgen_LI_WhereGuys_01_06");	//То есть?
	AI_Output(self,other,"DIA_Jorgen_LI_WhereGuys_01_07");	//Но по мне, так они просто очень сильно напуганы! Вот и не захотели больше оставаться на этом корабле.
	AI_Output(self,other,"DIA_Jorgen_LI_WhereGuys_01_08");	//Это мне, старому морскому волку не привыкать к подобным вещам...(смеется) Я видал шторма и посильнее!
	AI_Output(self,other,"DIA_Jorgen_LI_WhereGuys_01_09");	//А вот остальных он, видимо, очень прилично напугал.
	AI_Output(self,other,"DIA_Jorgen_LI_WhereGuys_01_10");	//Так что после всего пережитого большинству из них этот клочок суши показался самым лучшим местом на земле!
	AI_Output(self,other,"DIA_Jorgen_LI_WhereGuys_01_11");	//По крайней мере, на их лицах это явно читалось.
	AI_Output(other,self,"DIA_Jorgen_LI_WhereGuys_01_12");	//Понятно.
};


instance DIA_JORGEN_LI_WHEREGOLD(C_Info)
{
	npc = vlk_4250_jorgen_li;
	nr = 2;
	condition = dia_jorgen_li_wheregold_condition;
	information = dia_jorgen_li_wheregold_info;
	permanent = FALSE;
	description = "А куда подевалось мое золото?";
};


func int dia_jorgen_li_wheregold_condition()
{
	if(Npc_KnowsInfo(hero,dia_jorgen_li_storm) && (MIS_MISSMYGOLD == LOG_Running) && (BEGINGOLDSEEK == FALSE))
	{
		return TRUE;
	};
};

func void dia_jorgen_li_wheregold_info()
{
	AI_Output(other,self,"DIA_Jorgen_LI_WhereGold_01_01");	//А куда подевалось мое золото?
	AI_Output(self,other,"DIA_Jorgen_LI_WhereGold_01_02");	//О чем ты, приятель?
	AI_Output(other,self,"DIA_Jorgen_LI_WhereGold_01_03");	//О большой куче золота, которую мы забрали с острова Ирдорат. Оно находилось в трюме нашего корабля!
	AI_Output(self,other,"DIA_Jorgen_LI_WhereGold_01_04");	//(удивленно) А что с ним?
	AI_Output(other,self,"DIA_Jorgen_LI_WhereGold_01_05");	//Теперь его там нет!
	AI_Output(self,other,"DIA_Jorgen_LI_WhereGold_01_06");	//Правда? Как это нет?
	AI_Output(other,self,"DIA_Jorgen_LI_WhereGold_01_07");	//А вот так! Оно просто исчезло.
	AI_Output(self,other,"DIA_Jorgen_LI_WhereGold_01_08");	//Извини, приятель. Но я и понятия не имею, куда оно подевалось.
	AI_Output(self,other,"DIA_Jorgen_LI_WhereGold_01_09");	//Да и как бы я смог положить к себе в карман такую груду золота? Так что я тут не при чем!
	AI_Output(other,self,"DIA_Jorgen_LI_WhereGold_01_10");	//М-да, тоже верно. И как мне теперь быть?
	AI_Output(self,other,"DIA_Jorgen_LI_WhereGold_01_11");	//Не знаю...(растерянно) Может быть, тебе стоит спросить об этом у других парней - возможно, они что-то знают.
	BEGINGOLDSEEK = TRUE;
	Wld_InsertItem(itmi_misstorlofthing,"FP_ITEM_CAPITANTHING");
	B_LogEntry(TOPIC_MISSMYGOLD,"Йорген сказал, что не знает, куда пропало мое золото. Но он посоветовал мне поспрашивать об этом других ребят.");
};


instance DIA_JORGEN_LI_MISSCOMPAS(C_Info)
{
	npc = vlk_4250_jorgen_li;
	nr = 2;
	condition = dia_jorgen_li_misscompas_condition;
	information = dia_jorgen_li_misscompas_info;
	permanent = FALSE;
	description = "Горн сказал, что ты потерял свой компас.";
};


func int dia_jorgen_li_misscompas_condition()
{
	if((MIS_MISSMYGOLD == LOG_Running) && (GORNTELLABOUTCOMPAS == TRUE) && (Npc_HasItems(hero,itmi_misstorlofthing) == 0))
	{
		return TRUE;
	};
};

func void dia_jorgen_li_misscompas_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_Jorgen_LI_MissCompas_01_01");	//Горн сказал, что ты потерял свой компас.
	AI_Output(self,other,"DIA_Jorgen_LI_MissCompas_01_02");	//(расстроенно) Да, есть такое дело...
	AI_Output(other,self,"DIA_Jorgen_LI_MissCompas_01_03");	//И как это случилось?
	AI_Output(self,other,"DIA_Jorgen_LI_MissCompas_01_04");	//Не знаю! Наверняка во время шторма он случайно выпал у меня из кармана.
	AI_Output(self,other,"DIA_Jorgen_LI_MissCompas_01_05");	//Но я в этом точно не уверен...
	AI_Output(other,self,"DIA_Jorgen_LI_MissCompas_01_06");	//Похоже, что этот компас для тебя много значил.
	AI_Output(self,other,"DIA_Jorgen_LI_MissCompas_01_07");	//Эх... эта вещица была по-настоящему мне дорога - подарок на память от одного моего старого друга!
	AI_Output(self,other,"DIA_Jorgen_LI_MissCompas_01_08");	//Я всегда полагал, что она приносит мне удачу, и поверь мне - так оно и было!
	AI_Output(self,other,"DIA_Jorgen_LI_MissCompas_01_09");	//Но теперь понимаю, что эта самая удача на этот раз отвернулась от меня.
	AI_Output(other,self,"DIA_Jorgen_LI_MissCompas_01_10");	//А ты не пробовал его искать?
	AI_Output(self,other,"DIA_Jorgen_LI_MissCompas_01_11");	//Пробовал, конечно...(печально) Я обшарил всю верхнюю палубу, но все оказалось напрасно - его тут нет!
	AI_Output(self,other,"DIA_Jorgen_LI_MissCompas_01_12");	//Так что, скорее всего, его просто смыло волной за борт, и с этим уже ничего не поделаешь.
	AI_Output(other,self,"DIA_Jorgen_LI_MissCompas_01_13");	//Понятно.
	B_LogEntry(TOPIC_MISSMYGOLD,"Я спросил Йоргена про его компас. Кажется, он действительно сильно расстроен по поводу этой пропажи. Он обыскал всю верхнюю палубу корабля в надежде найти его, но так и не нашел.");
};


instance DIA_JORGEN_LI_WHEREGOLDDONE(C_Info)
{
	npc = vlk_4250_jorgen_li;
	nr = 2;
	condition = dia_jorgen_li_wheregolddone_condition;
	information = dia_jorgen_li_wheregolddone_info;
	permanent = FALSE;
	description = "Это случаем не твоя вещица?";
};


func int dia_jorgen_li_wheregolddone_condition()
{
	if((BEGINGOLDSEEK == TRUE) && (MIS_MISSMYGOLD == LOG_Running) && (Npc_HasItems(hero,itmi_misstorlofthing) >= 1))
	{
		return TRUE;
	};
};

func void dia_jorgen_li_wheregolddone_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Jorgen_LI_WhereGoldDone_01_01");	//Это случаем не твоя вещица?
	AI_Output(self,other,"DIA_Jorgen_LI_WhereGoldDone_01_02");	//(удивленно) Какая еще вещица?
	AI_Output(other,self,"DIA_Jorgen_LI_WhereGoldDone_01_03");	//Вот.
	B_GiveInvItems(other,self,itmi_misstorlofthing,1);
	AI_Output(self,other,"DIA_Jorgen_LI_WhereGoldDone_01_04");	//(восторженно)Приятель... это же мой компас! А я уж думал, что все...
	AI_Output(self,other,"DIA_Jorgen_LI_WhereGoldDone_01_05");	//Как тебе удалось его найти?
	AI_Output(other,self,"DIA_Jorgen_LI_WhereGoldDone_01_06");	//Вопрос в другом - где я его нашел.
	AI_Output(self,other,"DIA_Jorgen_LI_WhereGoldDone_01_07");	//И где же?
	AI_Output(other,self,"DIA_Jorgen_LI_WhereGoldDone_01_08");	//А как раз там, где раньше лежала пропавшая куча моего золота.
	AI_Output(self,other,"DIA_Jorgen_LI_WhereGoldDone_01_09");	//На что это ты намекаешь, приятель?
	AI_Output(other,self,"DIA_Jorgen_LI_WhereGoldDone_01_10");	//На то, что тебе наверняка что-то известно по этому поводу.
	AI_Output(self,other,"DIA_Jorgen_LI_WhereGoldDone_01_11");	//(растерянно) Но я же уже сказал тебе, что понятия не имею, где оно...
	AI_Output(other,self,"DIA_Jorgen_LI_WhereGoldDone_01_12");	//На твоем месте, я бы лучше сказал всю правду.
	AI_Output(self,other,"DIA_Jorgen_LI_WhereGoldDone_01_13");	//Правду? (совсем растерянно) Но...
	AI_Output(other,self,"DIA_Jorgen_LI_WhereGoldDone_01_14");	//Ну?! Говори же!
	AI_Output(self,other,"DIA_Jorgen_LI_WhereGoldDone_01_15");	//Эх, ладно! В общем... к большому сожалению многих членов экипажа, его пришлось выкинуть за борт.
	AI_Output(self,other,"DIA_Jorgen_LI_WhereGoldDone_01_16");	//Но если честно, то по мне жизнь дороже!
	AI_Output(other,self,"DIA_Jorgen_LI_WhereGoldDone_01_17");	//То есть как это выкинуть?
	AI_Output(self,other,"DIA_Jorgen_LI_WhereGoldDone_01_18");	//А вот так! (серьезно) Корабль дал сильный крен, и если бы мы этого не сделали, то все бы пошли на корм рыбам.
	AI_Output(other,self,"DIA_Jorgen_LI_WhereGoldDone_01_19");	//Но неужели надо было выбрасывать все золото?
	AI_Output(self,other,"DIA_Jorgen_LI_WhereGoldDone_01_20");	//Извини, но я как-то забыл тогда об этом подумать...(ехидно) Просто не до того было!
	AI_Output(other,self,"DIA_Jorgen_LI_WhereGoldDone_01_21");	//М-да. Выходит, что и золота у нас теперь тоже нет.
	AI_Output(other,self,"DIA_Jorgen_LI_WhereGoldDone_01_22");	//А почему все это скрывали от меня?
	AI_Output(self,other,"DIA_Jorgen_LI_WhereGoldDone_01_23");	//Мы не хотели говорить тебе об этом, поскольку думали, что ты очень сильно расстроишься.
	AI_Output(self,other,"DIA_Jorgen_LI_WhereGoldDone_01_24");	//Поэтому и делали вид, что ничего не знаем насчет твоего золота.
	AI_Output(other,self,"DIA_Jorgen_LI_WhereGoldDone_01_25");	//Вы оказались правы - я действительно сильно огорчен!
	AI_Output(self,other,"DIA_Jorgen_LI_WhereGoldDone_01_26");	//Приятель! (улыбается) На твоем месте, я бы не очень сильно расстраивался.
	AI_Output(self,other,"DIA_Jorgen_LI_WhereGoldDone_01_27");	//Золото дело наживное, и ты еще успеешь стать богатым!
	AI_Output(self,other,"DIA_Jorgen_LI_WhereGoldDone_01_28");	//Лучше стоит поблагодарить Инноса за то, что он помог нам всем остаться в живых. Это куда важнее!
	AI_Output(other,self,"DIA_Jorgen_LI_WhereGoldDone_01_29");	//Ну да, наверно ты прав.
	AI_Output(self,other,"DIA_Jorgen_LI_WhereGoldDone_01_30");	//А раз так, то давай тогда закончим этот разговор и займемся более важными делами.
	MIS_MISSMYGOLD = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_MISSMYGOLD,LOG_SUCCESS);
	B_LogEntry(TOPIC_MISSMYGOLD,"Теперь все стало ясно - мое золото просто выкинули за борт во время шторма, поскольку из-за большой загруженности наш корабль дал крен и мог опрокинуться. Так что это явилось жизненной необходимостью! Парни не хотели мне вначале говорить всю правду, поскольку думали, что я сильно расстроюсь из-за этого. В принципе, они оказались правы, но я как-нибудь переживу эту потерю.");
};


instance DIA_JORGEN_LI_HALLO(C_Info)
{
	npc = vlk_4250_jorgen_li;
	nr = 4;
	condition = dia_jorgen_li_hallo_condition;
	information = dia_jorgen_li_hallo_info;
	permanent = TRUE;
	description = "Все спокойно?";
};


func int dia_jorgen_li_hallo_condition()
{
	if(Npc_KnowsInfo(hero,dia_jorgen_li_aboutisland) && Npc_KnowsInfo(hero,dia_jorgen_li_whereguys) && Npc_KnowsInfo(hero,dia_jorgen_li_island))
	{
		return TRUE;
	};
};

func void dia_jorgen_li_hallo_info()
{
	AI_Output(other,self,"DIA_Jorgen_LI_Hallo_15_00");	//Все спокойно?
	AI_Output(self,other,"DIA_Jorgen_LI_Hallo_01_01");	//Пока вроде да.
};


instance DIA_JORGEN_LI_BRINGFOODDONE(C_Info)
{
	npc = vlk_4250_jorgen_li;
	nr = 2;
	condition = dia_jorgen_li_bringfooddone_condition;
	information = dia_jorgen_li_bringfooddone_info;
	permanent = FALSE;
	description = "Как у нас дела с провиантом?";
};


func int dia_jorgen_li_bringfooddone_condition()
{
	if((MIS_BRINGFOOD == LOG_Running) && (GORNTELLABOUTMEAT == TRUE) && (Npc_HasItems(hero,ItFoMuttonRaw) >= 24))
	{
		return TRUE;
	};
};

func void dia_jorgen_li_bringfooddone_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Jorgen_LI_BringFoodDone_01_01");	//Как у нас дела с провиантом?
	AI_Output(self,other,"DIA_Jorgen_LI_BringFoodDone_01_02");	//Не очень хорошо...(серьезно) Он понемногу начинает подходить к концу.
	AI_Output(self,other,"DIA_Jorgen_LI_BringFoodDone_01_03");	//А почему ты спросил?
	AI_Output(other,self,"DIA_Jorgen_LI_BringFoodDone_01_04");	//Некоторые парни жалуются на то, что ты урезал их дневные нормы еды.
	AI_Output(other,self,"DIA_Jorgen_LI_BringFoodDone_01_05");	//И на мой взгляд, большинству из них эта новость не очень пришлась по душе!
	AI_Output(self,other,"DIA_Jorgen_LI_BringFoodDone_01_06");	//К сожалению, у меня не было другого выхода...
	AI_Output(self,other,"DIA_Jorgen_LI_BringFoodDone_01_07");	//Зная аппетиты некоторых наших парней, то у нас бы уже через пару дней ничего не осталось бы.
	AI_Output(self,other,"DIA_Jorgen_LI_BringFoodDone_01_08");	//Особенно это касается Горна! Если этого троглодита пустить на камбуз, то он сразу же за один присест изничтожит все наши запасы еды!
	AI_Output(self,other,"DIA_Jorgen_LI_BringFoodDone_01_09");	//И что мы потом будем делать? А?
	AI_Output(other,self,"DIA_Jorgen_LI_BringFoodDone_01_10");	//Ничего. Поскольку теперь можно немного расслабиться.
	AI_Output(self,other,"DIA_Jorgen_LI_BringFoodDone_01_11");	//Это почему же?
	AI_Output(other,self,"DIA_Jorgen_LI_BringFoodDone_01_12");	//Потому, что я принес тебе много свежего мяса.
	AI_Output(self,other,"DIA_Jorgen_LI_BringFoodDone_01_13");	//Мяса? (удивленно) Ты что же, ходил на охоту?
	AI_Output(other,self,"DIA_Jorgen_LI_BringFoodDone_01_14");	//Ну да - прогулялся немного по острову, подстрелил пару мерзких тварей.
	AI_Output(self,other,"DIA_Jorgen_LI_BringFoodDone_01_15");	//Теперь все ясно...(смеется) Ну ладно, и сколько же его у тебя?
	AI_Output(other,self,"DIA_Jorgen_LI_BringFoodDone_01_16");	//Пять дюжин кусков.
	AI_Output(self,other,"DIA_Jorgen_LI_BringFoodDone_01_17");	//Ого! Совсем неплохо! Думаю, такого запаса нам на долго хватит.
	AI_Output(other,self,"DIA_Jorgen_LI_BringFoodDone_01_18");	//Тогда, вот - забирай его.
	AI_Output(self,other,"DIA_Jorgen_LI_BringFoodDone_01_19");	//Нет, нет, нет! (ворчливо) Просто так я это мясо у тебя брать не стану.
	AI_Output(other,self,"DIA_Jorgen_LI_BringFoodDone_01_20");	//Как так?
	AI_Output(self,other,"DIA_Jorgen_LI_BringFoodDone_01_21");	//А так, что мне сейчас с ним возиться абсолютно некогда. И так дел по самое горло!
	AI_Output(self,other,"DIA_Jorgen_LI_BringFoodDone_01_22");	//И сырым его оставлять тоже никак нельзя. А то оно быстро испортится, и весь твой труд будет напрасным.
	AI_Output(self,other,"DIA_Jorgen_LI_BringFoodDone_01_23");	//Так что сначала сходи на камбуз и хорошенько прожарь все эти куски.
	AI_Output(self,other,"DIA_Jorgen_LI_BringFoodDone_01_24");	//И только после этого возвращайся ко мне. Все ясно?
	B_LogEntry(TOPIC_BRINGFOOD,"Йорген был удивлен, что мне удалось достать такое большое количество свежего мяса. Однако брать он его отказался, поскольку ему сейчас просто некогда всем этим заниматься. Поэтому он попросил меня сходить на камбуз и для хорошо прожарить каждый кусок, чтобы они не испортились. А потом уже принести это мясо ему.");
};


instance DIA_JORGEN_LI_BRINGFOODDONEEXT(C_Info)
{
	npc = vlk_4250_jorgen_li;
	nr = 2;
	condition = dia_jorgen_li_bringfooddoneext_condition;
	information = dia_jorgen_li_bringfooddoneext_info;
	permanent = FALSE;
	description = "Я пожарил мясо.";
};


func int dia_jorgen_li_bringfooddoneext_condition()
{
	if((MIS_BRINGFOOD == LOG_Running) && Npc_KnowsInfo(hero,dia_jorgen_li_bringfooddone) && (Npc_HasItems(hero,ItFoMutton) >= 24) && (Npc_HasItems(hero,ItFo_Apple) >= 20))
	{
		return TRUE;
	};
};

func void dia_jorgen_li_bringfooddoneext_info()
{
	AI_Output(other,self,"DIA_Jorgen_LI_BringFoodDoneExt_01_01");	//Я пожарил мясо, как ты и просил.
	AI_Output(self,other,"DIA_Jorgen_LI_BringFoodDoneExt_01_02");	//Если так, то давай его сюда.
	Info_ClearChoices(dia_jorgen_li_bringfooddoneext);
	if(GORNTELLABOUTMEAT == TRUE)
	{
		Info_AddChoice(dia_jorgen_li_bringfooddoneext,"Вот, держи...(отдать 14 кусков мяса и яблоки)",dia_jorgen_li_bringfooddoneext_fifty);
	};
	Info_AddChoice(dia_jorgen_li_bringfooddoneext,"Вот держи!",dia_jorgen_li_bringfooddoneext_sixty);
};

func void dia_jorgen_li_bringfooddoneext_fifty()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Jorgen_LI_BringFoodDoneExt_Fifty_01_00");	//Вот, держи.
	B_GiveInvItems(other,self,ItFoMutton,14);
	B_GiveInvItems(other,self,ItFo_Apple,20);
	Npc_RemoveInvItems(self,ItFoMutton,14);
	Npc_RemoveInvItems(self,ItFo_Apple,20);
	AI_Output(self,other,"DIA_Jorgen_LI_BringFoodDoneExt_Fifty_01_01");	//Хм. А где же все остальное?
	AI_Output(self,other,"DIA_Jorgen_LI_BringFoodDoneExt_Fifty_01_02");	//Мне казалось, что у тебя было тогда больше мяса, чем сейчас.
	AI_Output(other,self,"DIA_Jorgen_LI_BringFoodDoneExt_Fifty_01_03");	//Я решил немного подкрепиться.
	AI_Output(self,other,"DIA_Jorgen_LI_BringFoodDoneExt_Fifty_01_04");	//М-да, приятель...(удивленно) Ну и аппетит у тебя!
	AI_Output(self,other,"DIA_Jorgen_LI_BringFoodDoneExt_Fifty_01_05");	//Интересно, ты после этого не лопнул?
	AI_Output(other,self,"DIA_Jorgen_LI_BringFoodDoneExt_Fifty_01_06");	//А что?
	AI_Output(self,other,"DIA_Jorgen_LI_BringFoodDoneExt_Fifty_01_07");	//Ты же умял не меньше десяти кусков!
	AI_Output(other,self,"DIA_Jorgen_LI_BringFoodDoneExt_Fifty_01_08");	//Да нет. Наоборот, в самый раз.
	AI_Output(self,other,"DIA_Jorgen_LI_BringFoodDoneExt_Fifty_01_09");	//Как скажешь. В конце концов, именно ты достал для нас это мясо, а не кто-то другой.
	AI_Output(self,other,"DIA_Jorgen_LI_BringFoodDoneExt_Fifty_01_10");	//Поэтому не думай, что я тебя за это осуждаю.
	AI_Output(self,other,"DIA_Jorgen_LI_BringFoodDoneExt_Fifty_01_11");	//Просто я хотел немного увеличить суточный рацион для всех наших парней. А то они последнее время какие-то вялые совсем!
	AI_Output(self,other,"DIA_Jorgen_LI_BringFoodDoneExt_Fifty_01_12");	//Но, похоже, что в данной ситуации мне этого сделать уже не удастся...
	AI_Output(self,other,"DIA_Jorgen_LI_BringFoodDoneExt_Fifty_01_13");	//Хотя ладно! Чего уж теперь говорить об этом.
	AI_Output(self,other,"DIA_Jorgen_LI_BringFoodDoneExt_Fifty_01_14");	//Но в любом случае спасибо тебе!
	NOTTHANKSTELLALLMEAT = TRUE;
	Info_ClearChoices(dia_jorgen_li_bringfooddoneext);
	MIS_BRINGFOOD = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_BRINGFOOD,LOG_SUCCESS);
	B_LogEntry(TOPIC_BRINGFOOD,"Я отдал Йоргену жареное мясо, при этом не забыв о просьбе Горна. Йорген был немного расстроен, поскольку хотел увеличить суточный рацион для других парней. Но теперь это уже не имеет значения.");
};

func void dia_jorgen_li_bringfooddoneext_sixty()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Jorgen_LI_BringFoodDoneExt_Sixty_01_00");	//Вот, держи.
	B_GiveInvItems(other,self,ItFoMutton,24);
	B_GiveInvItems(other,self,ItFo_Apple,20);
	Npc_RemoveInvItems(self,ItFoMutton,24);
	Npc_RemoveInvItems(self,ItFo_Apple,20);
	AI_Output(self,other,"DIA_Jorgen_LI_BringFoodDoneExt_Sixty_01_01");	//Отлично! Теперь-то у парней уж точно будет чем подкрепиться в ближайшие дни.
	AI_Output(self,other,"DIA_Jorgen_LI_BringFoodDoneExt_Sixty_01_02");	//И к тому же я смогу даже немного увеличить суточный рацион для всех членов нашего экипажа.
	AI_Output(self,other,"DIA_Jorgen_LI_BringFoodDoneExt_Sixty_01_03");	//Наверняка, после нескольких дней небольшой голодовки, для них это будет хорошей новостью.
	AI_Output(self,other,"DIA_Jorgen_LI_BringFoodDoneExt_Sixty_01_04");	//И все это благодаря тебе, приятель!
	Info_ClearChoices(dia_jorgen_li_bringfooddoneext);
	THANKSTELLALLMEAT = TRUE;
	MIS_BRINGFOOD = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_BRINGFOOD,LOG_SUCCESS);
	B_LogEntry(TOPIC_BRINGFOOD,"Я отдал Йоргену все жареное мясо, и теперь он сможет немного увеличить суточный рацион для всех членов экипажа нашего корабля.");
};


instance DIA_JORGEN_LI_FINDMAGICORECAVE(C_Info)
{
	npc = vlk_4250_jorgen_li;
	nr = 2;
	condition = dia_jorgen_li_findmagicorecave_condition;
	information = dia_jorgen_li_findmagicorecave_info;
	permanent = FALSE;
	description = "У меня есть интересные новости.";
};


func int dia_jorgen_li_findmagicorecave_condition()
{
	if((MIS_FINDMAGICORECAVE == LOG_Running) && ((FINDLIORE_CAVE_01 == TRUE) || (FINDLIORE_CAVE_02 == TRUE)))
	{
		return TRUE;
	};
};

func void dia_jorgen_li_findmagicorecave_info()
{
	AI_Output(other,self,"DIA_Jorgen_LI_FindMagicOreCave_01_01");	//У меня есть интересные новости.
	AI_Output(self,other,"DIA_Jorgen_LI_FindMagicOreCave_01_02");	//И в чем же они заключаются?
	if((FINDLIORE_CAVE_01 == TRUE) && (FINDLIORE_CAVE_02 == TRUE))
	{
		B_GivePlayerXP(1000);
		AI_Output(other,self,"DIA_Jorgen_LI_FindMagicOreCave_01_03");	//Я обнаружил несколько пещер с огромными залежами магической руды.
		AI_Output(self,other,"DIA_Jorgen_LI_FindMagicOreCave_01_04");	//(удивленно) Правда?
		AI_Output(other,self,"DIA_Jorgen_LI_FindMagicOreCave_01_05");	//Сомнений быть не может! Думаю, весь этот остров просто до основания забит ею.
		AI_Output(self,other,"DIA_Jorgen_LI_FindMagicOreCave_01_06");	//Хммм... что же, это действительно довольно необычные новости.
		AI_Output(self,other,"DIA_Jorgen_LI_FindMagicOreCave_01_07");	//Залежи магической руды - очень большая редкость! Тем более, как ты говоришь, в таких огромных размерах.
		AI_Output(self,other,"DIA_Jorgen_LI_FindMagicOreCave_01_08");	//Насколько я знаю, до последнего времени такие запасы были только в Долине Рудников, пока туда не пришли орки.
		AI_Output(self,other,"DIA_Jorgen_LI_FindMagicOreCave_01_09");	//Так что, если ты прав, это поистине великое открытие!
		AI_Output(self,other,"DIA_Jorgen_LI_FindMagicOreCave_01_10");	//Хотя мне все равно до сих пор в это как-то мало верится... Скорее всего, ты перепутал магическую руду просто с обычными камнями.
		AI_Output(other,self,"DIA_Jorgen_LI_FindMagicOreCave_01_11");	//И что же мне нужно сделать, чтобы ты в это поверил?
		AI_Output(self,other,"DIA_Jorgen_LI_FindMagicOreCave_01_12");	//(задумчиво) Возможно, если я сам бы своими глазами увидел эту руду, то это бы полностью прояснило ситуацию!
		AI_Output(other,self,"DIA_Jorgen_LI_FindMagicOreCave_01_13");	//Тогда идем со мной. Я покажу тебе одну из пещер.
		AI_Output(self,other,"DIA_Jorgen_LI_FindMagicOreCave_01_14");	//Не выйдет, приятель...(улыбается) У меня сейчас абсолютно нет на это времени.
		AI_Output(self,other,"DIA_Jorgen_LI_FindMagicOreCave_01_15");	//К тому же я еще не закончил с починкой нашего корабля.
		AI_Output(self,other,"DIA_Jorgen_LI_FindMagicOreCave_01_16");	//Так что, если тебе не трудно, просто принеси мне небольшой кусок той руды, что ты обнаружил на этом острове.
		AI_Output(self,other,"DIA_Jorgen_LI_FindMagicOreCave_01_17");	//Думаю, этого будет вполне достаточно, чтобы полностью удостовериться в твоих словах.
		AI_Output(other,self,"DIA_Jorgen_LI_FindMagicOreCave_01_18");	//Ладно! Постараюсь добыть для тебя один экземпляр.
		LITESTOK = TRUE;
		B_LogEntry(TOPIC_FINDMAGICORECAVE,"Я рассказал Йоргену о том, что обнаружил на острове несколько пещер с огромными залежами магической руды. Он был удивлен этим и в качестве доказательства моих слов попросил принести ему небольшой кусок этой породы.");
	}
	else
	{
		B_GivePlayerXP(500);
		AI_Output(other,self,"DIA_Jorgen_LI_FindMagicOreCave_01_19");	//В одной из пещер на этом острове я обнаружил большие залежи магической руды.
		AI_Output(other,self,"DIA_Jorgen_LI_FindMagicOreCave_01_20");	//Возможно, на этом острове скрываются еще большие ее запасы!
		AI_Output(self,other,"DIA_Jorgen_LI_FindMagicOreCave_01_21");	//Хммм... что ж, это действительно довольно необычные новости.
		AI_Output(self,other,"DIA_Jorgen_LI_FindMagicOreCave_01_22");	//Встретить залежи магической руды - очень большая удача! Тем более, как ты говоришь, в таких больших размерах.
		AI_Output(self,other,"DIA_Jorgen_LI_FindMagicOreCave_01_23");	//Насколько я знаю, до последнего времени такие запасы были только в Долине Рудников, пока туда не пришли орки.
		AI_Output(self,other,"DIA_Jorgen_LI_FindMagicOreCave_01_24");	//Так что, если ты окажещься прав, это будет поистине великое открытие!
		AI_Output(self,other,"DIA_Jorgen_LI_FindMagicOreCave_01_25");	//Хотя мне в это как-то мало верится... Скорее всего, ты перепутал руду просто с обычными камнями.
		AI_Output(self,other,"DIA_Jorgen_LI_FindMagicOreCave_01_26");	//К тому же найденные тобой залежи в этой пещере еще не говорят о том, что здесь ее может быть много.
		AI_Output(self,other,"DIA_Jorgen_LI_FindMagicOreCave_01_27");	//Это может оказаться простой случайностью!
		AI_Output(other,self,"DIA_Jorgen_LI_FindMagicOreCave_01_28");	//И что мне теперь делать?
		AI_Output(self,other,"DIA_Jorgen_LI_FindMagicOreCave_01_29");	//На твоем месте, я бы попробовал более тщательно обследовать этот остров.
		AI_Output(self,other,"DIA_Jorgen_LI_FindMagicOreCave_01_30");	//Возможно, это бы немного прояснило ситуацию с найденной тобою рудой!
		AI_Output(self,other,"DIA_Jorgen_LI_FindMagicOreCave_01_31");	//Так что, когда найдешь еще что-нибудь интересное, тогда и поговорим...(улыбается)
		LIBEFORETESTOK = TRUE;
		B_LogEntry(TOPIC_FINDMAGICORECAVE,"Я сообщил Йоргену о том, что обнаружил на острове одну пещеру с большими залежами магической руды. Он сильно засомневался в моих словах и потому попросил меня более тщательно обследовать остров, чтобы найти еще доказательства присутствия здесь залежей этой породы.");
	};
};


instance DIA_JORGEN_LI_FINDMAGICORECAVEPROGRESS(C_Info)
{
	npc = vlk_4250_jorgen_li;
	nr = 2;
	condition = dia_jorgen_li_findmagicorecaveprogress_condition;
	information = dia_jorgen_li_findmagicorecaveprogress_info;
	permanent = FALSE;
	description = "Я обследовал остров.";
};


func int dia_jorgen_li_findmagicorecaveprogress_condition()
{
	if((MIS_FINDMAGICORECAVE == LOG_Running) && (LIBEFORETESTOK == TRUE) && (FINDLIORE_CAVE_01 == TRUE) && (FINDLIORE_CAVE_02 == TRUE))
	{
		return TRUE;
	};
};

func void dia_jorgen_li_findmagicorecaveprogress_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Jorgen_LI_FindMagicOreCaveProgress_01_01");	//Я обследовал остров...
	AI_Output(self,other,"DIA_Jorgen_LI_FindMagicOreCaveProgress_01_02");	//И?
	AI_Output(other,self,"DIA_Jorgen_LI_FindMagicOreCaveProgress_01_03");	//...и нашел еще одну пещеру. В ней руды даже еще больше, чем в первой!
	AI_Output(self,other,"DIA_Jorgen_LI_FindMagicOreCaveProgress_01_04");	//Хммм... ты в этом точно уверен?
	AI_Output(other,self,"DIA_Jorgen_LI_FindMagicOreCaveProgress_01_05");	//А разве одних моих слов недостаточно?
	AI_Output(self,other,"DIA_Jorgen_LI_FindMagicOreCaveProgress_01_06");	//Конечно, достаточно! (ехидно) Просто мне до сих пор не верится в то, что нам так повезло!
	AI_Output(other,self,"DIA_Jorgen_LI_FindMagicOreCaveProgress_01_07");	//И что же мне нужно сделать, чтобы ты, наконец-то, в это поверил?
	AI_Output(self,other,"DIA_Jorgen_LI_FindMagicOreCaveProgress_01_08");	//(задумчиво) Возможно, если я сам бы своими глазами увидел эту руду, то это бы полностью прояснило ситуацию!
	AI_Output(other,self,"DIA_Jorgen_LI_FindMagicOreCaveProgress_01_09");	//Тогда идем со мной! Я покажу тебе одну из пещер.
	AI_Output(self,other,"DIA_Jorgen_LI_FindMagicOreCaveProgress_01_10");	//Не выйдет, приятель...(улыбается) У меня сейчас абсолютно нет на это времени.
	AI_Output(self,other,"DIA_Jorgen_LI_FindMagicOreCaveProgress_01_11");	//К тому же я еще не закончил с починкой нашего корабля!
	AI_Output(self,other,"DIA_Jorgen_LI_FindMagicOreCaveProgress_01_12");	//Так что, если тебе не трудно, просто принеси мне небольшой кусок той руды, что ты обнаружил на этом острове.
	AI_Output(self,other,"DIA_Jorgen_LI_FindMagicOreCaveProgress_01_13");	//Думаю, этого будет вполне достаточно, чтобы полностью удостовериться в твоих словах.
	AI_Output(other,self,"DIA_Jorgen_LI_FindMagicOreCaveProgress_01_14");	//Ладно! Постараюсь добыть для тебя один экземпляр.
	LITESTOK = TRUE;
	B_LogEntry(TOPIC_FINDMAGICORECAVE,"Я сказал Йоргену, что нашел еще одну пещеру с залежами магической руды. Выслушав меня, он попросил принести ему небольшой кусок этой породы, чтобы окончательно удостовериться в правдивости моих слов.");
};


instance DIA_JORGEN_LI_FINDMAGICORECAVEDONE(C_Info)
{
	npc = vlk_4250_jorgen_li;
	nr = 2;
	condition = dia_jorgen_li_findmagicorecavedone_condition;
	information = dia_jorgen_li_findmagicorecavedone_info;
	permanent = FALSE;
	description = "Я принес тебе кусок той руды.";
};


func int dia_jorgen_li_findmagicorecavedone_condition()
{
	if((MIS_FINDMAGICORECAVE == LOG_Running) && (Npc_HasItems(hero,itmi_testnugget) >= 1))
	{
		return TRUE;
	};
};

func void dia_jorgen_li_findmagicorecavedone_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Jorgen_LI_FindMagicOreCaveDone_01_01");	//Я принес тебе кусок той руды.
	AI_Output(self,other,"DIA_Jorgen_LI_FindMagicOreCaveDone_01_02");	//Отлично! (ехидно) Покажи мне его.
	AI_Output(other,self,"DIA_Jorgen_LI_FindMagicOreCaveDone_01_03");	//Вот, полюбуйся.
	B_GiveInvItems(other,self,itmi_testnugget,1);
	AI_Output(self,other,"DIA_Jorgen_LI_FindMagicOreCaveDone_01_04");	//Хмм... Да, парень, - похоже, ты был прав!
	AI_Output(self,other,"DIA_Jorgen_LI_FindMagicOreCaveDone_01_05");	//Это действительно магическая руда. И судя по виду этого самородка, она еще к тому же и превосходного качества!
	AI_Output(other,self,"DIA_Jorgen_LI_FindMagicOreCaveDone_01_06");	//Теперь-то ты мне веришь?
	AI_Output(self,other,"DIA_Jorgen_LI_FindMagicOreCaveDone_01_07");	//Прости, что сомневался в твоих словах. Просто я привык верить только тому, что сам видел!
	AI_Output(other,self,"DIA_Jorgen_LI_FindMagicOreCaveDone_01_08");	//Понимаю.
	MIS_FINDMAGICORECAVE = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_FINDMAGICORECAVE,LOG_SUCCESS);
	B_LogEntry(TOPIC_FINDMAGICORECAVE,"Я принес Йоргену кусок руды, отколотого мною от магической породы. После этого он не стал сомневаться в моих словах.");
};


instance DIA_JORGEN_LI_CHANGECOURSE(C_Info)
{
	npc = vlk_4250_jorgen_li;
	nr = 2;
	condition = dia_jorgen_li_changecourse_condition;
	information = dia_jorgen_li_changecourse_info;
	permanent = FALSE;
	description = "И что мы теперь будем делать?";
};


func int dia_jorgen_li_changecourse_condition()
{
	if(MIS_FINDMAGICORECAVE == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_jorgen_li_changecourse_info()
{
	AI_Output(other,self,"DIA_Jorgen_LI_ChangeCourse_01_01");	//И что мы теперь будем делать?
	AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourse_01_02");	//(растерянно) Понятия не имею!
	AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourse_01_03");	//Конечно, было бы неплохо прибрать всю эту руду к рукам.
	AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourse_01_04");	//На материке за нее мы бы смогли выручить просто огромную кучу золота!
	AI_Output(other,self,"DIA_Jorgen_LI_ChangeCourse_01_05");	//Звучит заманчиво!
	AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourse_01_06");	//Да... вот только как нам это сделать?
	AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourse_01_07");	//Наш корабль и так набит под завязку. А сама руда весит немало!
	AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourse_01_08");	//К тому же ее еще надо как-то добыть, а из нас навряд ли получаться хорошие рудокопы.
	AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourse_01_09");	//Так что...(грустно) У тебя-то самого есть какие-нибудь идеи на этот счет?
	Info_ClearChoices(dia_jorgen_li_changecourse);
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL) || (other.guild == GIL_KDF) || (other.guild == GIL_KDW))
	{
		Info_AddChoice(dia_jorgen_li_changecourse,"Думаю, нам стоит сообщить об этой руде лорду Хагену.",dia_jorgen_li_changecourse_paladin);
	};
	Info_AddChoice(dia_jorgen_li_changecourse,"Мы можем кому-нибудь продать этот остров вместе с рудой!",dia_jorgen_li_changecourse_sell);
	Info_AddChoice(dia_jorgen_li_changecourse,"Давай останемся на острове и начнем потихоньку добывать эту руду.",dia_jorgen_li_changecourse_here);
};

func void dia_jorgen_li_changecourse_paladin()
{
	AI_Output(other,self,"DIA_Jorgen_LI_ChangeCourse_Paladin_01_01");	//Думаю, нам стоит сообщить об этой руде лорду Хагену.
	AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourse_Paladin_01_02");	//Что? Отдать эту руду паладинам?
	AI_Output(other,self,"DIA_Jorgen_LI_ChangeCourse_Paladin_01_03");	//Она им нужнее, чем нам! Без нее у них нет ни единого шанса выиграть эту войну.
	AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourse_Paladin_01_04");	//И что с того? Возможно, они уже ее и так проиграли!
	AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourse_Paladin_01_05");	//Мы еще, конечно, не знаем, как обстоят дела на самом материке. Но по слухам, там уже вовсю хозяйничают орки!
	AI_Output(other,self,"DIA_Jorgen_LI_ChangeCourse_Paladin_01_06");	//Если так, то нам эта руда будет и вовсе без надобности.
	AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourse_Paladin_01_07");	//Эх... ладно, пусть будет по-твоему.
	AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourse_Paladin_01_08");	//Правда нам тогда придется вернуться обратно в Хоринис.
	AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourse_Paladin_01_09");	//Не думаю, что большинству парней придется по душе эта идея...
	AI_Output(other,self,"DIA_Jorgen_LI_ChangeCourse_Paladin_01_10");	//Я попробую их уговорить. Возможно, они согласятся с моими доводами.
	AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourse_Paladin_01_11");	//Как скажешь! Тогда дай знать, если тебе это удастся...(ехидно)
	AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourse_Paladin_01_12");	//В любом случае этот вопрос решать остальным парням. Как решит большинство из них, так и будет!
	AI_Output(other,self,"DIA_Jorgen_LI_ChangeCourse_Paladin_01_13");	//Конечно.
	MIS_CHANGECOURSE = LOG_Running;
	Log_CreateTopic(TOPIC_CHANGECOURSE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CHANGECOURSE,LOG_Running);
	B_LogEntry(TOPIC_CHANGECOURSE,"Теперь нам необходимо решить, что делать с найденной на острове рудой. Я предложил Йоргену вернуться в Хоринис и рассказать о ней паладинам, но ему эта идея не пришлась по душе. В итоге мы решили узнать мнение других членов нашей команды. А уж там, как большинство из них решит - так и будет.");
	Info_ClearChoices(dia_jorgen_li_changecourse);
};

func void dia_jorgen_li_changecourse_sell()
{
	AI_Output(other,self,"DIA_Jorgen_LI_ChangeCourse_Sell_01_01");	//Мы можем кому-нибудь продать этот остров вместе с рудой!
	AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourse_Sell_01_02");	//Интересно...(с сомнением) И кто же его у нас купит?
	AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourse_Sell_01_03");	//Кому нужен просто остров, даже если он доверху набит магической рудой?
	AI_Output(other,self,"DIA_Jorgen_LI_ChangeCourse_Sell_01_04");	//Не знаю. Может быть, паладинам? Им-то она точно нужна.
	AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourse_Sell_01_05");	//Хмм. А что, идея совсем неплоха!
	AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourse_Sell_01_06");	//Учитывая их ситуацию, они наверняка с радостью ухватятся за это предложение.
	AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourse_Sell_01_07");	//Вот только кому его сделать? Кто из паладинов сможет принять наши условия?
	AI_Output(other,self,"DIA_Jorgen_LI_ChangeCourse_Sell_01_08");	//Возможно, нам стоит обратится с этим к лорду Хагену.
	AI_Output(other,self,"DIA_Jorgen_LI_ChangeCourse_Sell_01_09");	//Меня-то он уж точно выслушает...
	AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourse_Sell_01_10");	//Скорее всего, ты прав. После того, что ты сделал, в этом можно точно не сомневаться!
	AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourse_Sell_01_11");	//Правда тогда нам придется вернуться обратно в Хоринис.
	AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourse_Sell_01_12");	//Не думаю, что большинству парней придется по душе эта идея...
	AI_Output(other,self,"DIA_Jorgen_LI_ChangeCourse_Sell_01_13");	//Я попробую их уговорить. Возможно, они согласятся с моими доводами.
	AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourse_Sell_01_14");	//Ладно! Тогда дай знать, если тебе это удастся.
	AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourse_Sell_01_15");	//В любом случае этот вопрос решать остальным парням. Как решит большинство из них, так и будет!
	AI_Output(other,self,"DIA_Jorgen_LI_ChangeCourse_Sell_01_16");	//Конечно.
	MIS_CHANGECOURSE = LOG_Running;
	Log_CreateTopic(TOPIC_CHANGECOURSE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CHANGECOURSE,LOG_Running);
	B_LogEntry(TOPIC_CHANGECOURSE,"Теперь нам необходимо решить, что делать с найденной на острове рудой. Я подкинул Йоргену идею, что можно было бы продать эту руду паладинам. Она ему пришлась по душе. Правда для этого нам, видимо, придется вернуться в Хоринис, поэтому для начала надо узнать мнение других членов нашей команды. А там уж, как большинство из них решит - так и будет.");
	Info_ClearChoices(dia_jorgen_li_changecourse);
};

func void dia_jorgen_li_changecourse_here()
{
	AI_Output(other,self,"DIA_Jorgen_LI_ChangeCourse_Here_01_01");	//Давай останемся на острове и начнем потихоньку добывать эту руду.
	AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourse_Here_01_02");	//Хмм. Не думаю, что это хорошая идея.
	AI_Output(other,self,"DIA_Jorgen_LI_ChangeCourse_Here_01_03");	//Почему?
	AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourse_Here_01_04");	//Да потому, что даже если мы начнем здесь вкалывать с утра до ночи с киркой в руках - нам это все равно ничего не даст.
	AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourse_Here_01_05");	//На то, чтобы добыть более или менее достаточное количество руды, потребуются годы. Если не больше!
	AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourse_Here_01_06");	//К тому же я не собираюсь проводить остаток своей жизни на этом поганом островке.
	AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourse_Here_01_07");	//(ворчливо) Он мне и так уже порядком поднадоел!
	AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourse_Here_01_08");	//Так что, будет лучше, если ты выбросишь эту идею из своей головы.
};


instance DIA_JORGEN_LI_CHANGECOURSEDONE(C_Info)
{
	npc = vlk_4250_jorgen_li;
	nr = 2;
	condition = dia_jorgen_li_changecoursedone_condition;
	information = dia_jorgen_li_changecoursedone_info;
	permanent = FALSE;
	description = "Я поговорил со всеми парнями.";
};


func int dia_jorgen_li_changecoursedone_condition()
{
	if((MIS_FINDMAGICORECAVE == LOG_SUCCESS) && (READYCHANGECOURSE == TRUE))
	{
		return TRUE;
	};
};

func void dia_jorgen_li_changecoursedone_info()
{
	AI_Output(other,self,"DIA_Jorgen_LI_ChangeCourseDone_01_01");	//Я поговорил со всеми парнями.
	AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourseDone_01_02");	//И что они сказали?
	if(CREWAGREEAWAYBACKPAL > CREWAGREEAWAYBACKSELL)
	{
		B_GivePlayerXP(500);
		AI_Output(other,self,"DIA_Jorgen_LI_ChangeCourseDone_01_03");	//Большинство из них согласно плыть в Хоринис, чтобы помочь паладинам.
		AI_Output(other,self,"DIA_Jorgen_LI_ChangeCourseDone_01_04");	//Так что делай выводы.
		AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourseDone_01_05");	//Ну ладно... Если так решило большинство - значит, тому и быть!
		AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourseDone_01_06");	//Остается только надеяться, что лорду Хагену и его людям все это действительно поможет.
		AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourseDone_01_07");	//Хотя бы не за зря проделаем обратный путь!
		AI_Output(other,self,"DIA_Jorgen_LI_ChangeCourseDone_01_08");	//Не волнуйся. Все будет так, как надо.
		AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourseDone_01_09");	//(ехидно) Спасибо, успокоил...
		B_LogEntry(TOPIC_CHANGECOURSE,"В итоге, с учетом мнения большинства членов команды, было решено отправиться обратно в Хоринис, чтобы сообщить паладинам о найденной нами на острове магической руде.");
		LIGOFORFREE = TRUE;
	}
	else if(CREWAGREEAWAYBACKPAL < CREWAGREEAWAYBACKSELL)
	{
		B_GivePlayerXP(450);
		AI_Output(other,self,"DIA_Jorgen_LI_ChangeCourseDone_01_10");	//Большинству из них пришлась по вкусу идея стребовать с паладинов приличную сумму золота за найденную нами руду.
		AI_Output(other,self,"DIA_Jorgen_LI_ChangeCourseDone_01_11");	//Так что делай выводы.
		AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourseDone_01_12");	//Вот это другое дело. Если честно, иного я и не ожидал!
		AI_Output(other,self,"DIA_Jorgen_LI_ChangeCourseDone_01_13");	//Откуда такая уверенность?
		AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourseDone_01_14");	//Просто все понимают - ради чего стоит рисковать жизнью, а ради чего нет!
		B_LogEntry(TOPIC_CHANGECOURSE,"Большинству членов команды пришлась по вкусу идея стребовать с паладинов приличную сумму золота за найденную нами руду. Наш курс лежит обратно на Хоринис.");
		LIGOFORGOLD = TRUE;
	}
	else
	{
		B_GivePlayerXP(500);
		AI_Output(other,self,"DIA_Jorgen_LI_ChangeCourseDone_01_16");	//Мнения разделились! Половина за то, чтобы помочь паладинам - остальные против.
		AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourseDone_01_17");	//(задумчиво) непростая ситуация.
		AI_Output(other,self,"DIA_Jorgen_LI_ChangeCourseDone_01_18");	//И что будем делать?
		AI_Output(self,other,"DIA_Jorgen_LI_ChangeCourseDone_01_19");	//Не знаю. В любом случае нам, наверное, все-таки стоит вернуться на остров. А там, будь что будет!
		AI_Output(other,self,"DIA_Jorgen_LI_ChangeCourseDone_01_20");	//Хорошо! Так и сделаем.
		B_LogEntry(TOPIC_CHANGECOURSE,"Мнения команды разделились. Половина выступила за то, чтобы помочь паладинам - остальные против. Но мы с Йоргеном приняли решение вернуться обратно в Хоринис. А уже там решить, как поступить с найденной нами на острове рудой.");
		LIGOFORUNKNOWN = TRUE;
	};
	MIS_CHANGECOURSE = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_CHANGECOURSE,LOG_SUCCESS);
};


