
func int C_SnapperDeath()
{
	if(Npc_IsDead(NewMine_Snapper1) && Npc_IsDead(NewMine_Snapper2) && Npc_IsDead(NewMine_Snapper3) && Npc_IsDead(NewMine_Snapper4) && Npc_IsDead(NewMine_Snapper5) && Npc_IsDead(NewMine_Snapper6) && Npc_IsDead(NewMine_Snapper7) && Npc_IsDead(NewMine_Snapper8))
	{
		return TRUE;
	};
	return FALSE;
};


instance DIA_Fajeth_EXIT(C_Info)
{
	npc = PAL_281_Fajeth;
	nr = 999;
	condition = DIA_Fajeth_EXIT_Condition;
	information = DIA_Fajeth_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Fajeth_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Fajeth_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Fajeth_First(C_Info)
{
	npc = PAL_281_Fajeth;
	nr = 2;
	condition = DIA_Fajeth_First_Condition;
	information = DIA_Fajeth_First_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Fajeth_First_Condition()
{
	if(Garond.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Fajeth_First_Info()
{
	AI_Output(self,other,"DIA_Fajeth_First_12_00");	//Кто ты такой и что ты делаешь здесь?
	AI_Output(other,self,"DIA_Fajeth_First_15_01");	//Я пришел по приказу лорда Хагена.
	AI_Output(self,other,"DIA_Fajeth_First_12_02");	//Тогда тебе нужно попытаться добраться до замка. Командующий Гаронд там. Он главнокомандующий этой экспедицией.
	AI_StopProcessInfos(self);
};


instance DIA_Fajeth_Hallo(C_Info)
{
	npc = PAL_281_Fajeth;
	nr = 2;
	condition = DIA_Fajeth_Hallo_Condition;
	information = DIA_Fajeth_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Fajeth_Hallo_Condition()
{
	if((MIS_ScoutMine == LOG_Running) && (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_Fajeth_Hallo_Info()
{
	AI_Output(self,other,"DIA_Fajeth_Hallo_12_00");	//Откуда ты пришел?
	AI_Output(other,self,"DIA_Fajeth_Hallo_15_01");	//Я пришел по приказу Гаронда.
	AI_Output(self,other,"DIA_Fajeth_Hallo_12_02");	//Очень хорошо. Мне очень нужны новые люди.
	AI_Output(other,self,"DIA_Fajeth_Hallo_15_03");	//Я здесь не для того, чтобы помогать тебе.
	AI_Output(self,other,"DIA_Fajeth_Hallo_12_04");	//Нет? Тогда зачем ты пришел?
	AI_Output(other,self,"DIA_Fajeth_Hallo_15_05");	//В мою задачу входит выяснить, сколько руды добыто к настоящему моменту.
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Fajeth_Hallo_12_06");	//О, достопочтенный маг. Твое присутствие вселяет в меня и моих людей уверенность.
		AI_Output(self,other,"DIA_Fajeth_Hallo_12_07");	//Мы были бы очень благодарны, если бы ты смог использовать данную тебе Инносом силу, чтобы помочь нам.
		Info_AddChoice(DIA_Fajeth_Hallo,"Что я могу сделать для тебя?",DIA_Fajeth_Hallo_Tun);
		Info_AddChoice(DIA_Fajeth_Hallo,"Мое задание важнее.",DIA_Fajeth_Hallo_KDFNein);
	}
	else if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Fajeth_Hallo_12_08");	//И в мое поручение входит предпринимать все для содействия перевозки и защиты руды.
		AI_Output(self,other,"DIA_Fajeth_Hallo_12_09");	//В это входит и защита людей. Ты состоишь на службе Инноса, потому ты выполнишь мои приказы.
		Info_AddChoice(DIA_Fajeth_Hallo,"Что я могу для тебя сделать?",DIA_Fajeth_Hallo_Tun);
		Info_AddChoice(DIA_Fajeth_Hallo,"У меня уже есть приказ от Гаронда.",DIA_Fajeth_Hallo_MILNein);
	}
	else if(other.guild == GIL_SLD)
	{
		AI_Output(self,other,"DIA_Fajeth_Hallo_12_10");	//Послушай - я не знаю, зачем Гаронд прислал мне наемника - но должно быть, у него были на то причины.
		AI_Output(self,other,"DIA_Fajeth_Hallo_12_11");	//Но прежде чем я отправлю тебя назад, ты должен выполнить одно задание для меня.
		Info_AddChoice(DIA_Fajeth_Hallo,"Все имеет свою цену.",DIA_Fajeth_Hallo_SLDJa);
		Info_AddChoice(DIA_Fajeth_Hallo,"Нет, у меня нет времени...",DIA_Fajeth_Hallo_SLDNein);
	}
	else if(other.guild == GIL_KDW)
	{
		AI_Output(self,other,"DIA_Fajeth_Hallo_12_12");	//Слушай - я не знаю, почему Гаронд посылает мне мага Воды вместо отряда паладинов - но он наверно знает, что делает.
		AI_Output(self,other,"DIA_Fajeth_Hallo_12_13");	//Однако прежде чем я отправлю тебя назад, ты выполнишь одно дело для меня.
		Info_AddChoice(DIA_Fajeth_Hallo,"Что я могу для тебя сделать?.",DIA_Fajeth_Hallo_Tun);
		Info_AddChoice(DIA_Fajeth_Hallo,"Нет, у меня нет времени...",dia_fajeth_hallo_kdwnein);
	}
	else if(other.guild == GIL_KDM)
	{
		AI_Output(self,other,"DIA_Fajeth_Hallo_12_14");	//Слушай - я не знаю, почему Гаронд посылает мне НЕКРОМАНТА вместо отряда паладинов - но он наверно знает, что делает.
		AI_Output(self,other,"DIA_Fajeth_Hallo_12_15");	//Однако прежде чем я отправлю тебя назад, ты выполнишь одно дело для меня.
		Info_AddChoice(DIA_Fajeth_Hallo,"Что я могу для тебя сделать?.",DIA_Fajeth_Hallo_Tun);
		Info_AddChoice(DIA_Fajeth_Hallo,"Нет, у меня нет времени...",dia_fajeth_hallo_kdmnein);
	}
	else
	{
		AI_Output(self,other,"DIA_Fajeth_Hallo_12_16");	//Слушай - я не знаю, почему Гаронд посылает мне одного тебя вместо отряда паладинов - но он наверно знает, что делает.
		AI_Output(self,other,"DIA_Fajeth_Hallo_12_17");	//Однако прежде чем я отправлю тебя назад, ты выполнишь одно дело для меня.
		Info_AddChoice(DIA_Fajeth_Hallo,"Что я могу для тебя сделать?.",DIA_Fajeth_Hallo_Tun);
		Info_AddChoice(DIA_Fajeth_Hallo,"Нет, у меня нет времени...",dia_fajeth_hallo_seknein);
	};
};

func void DIA_Fajeth_Hallo_Tun()
{
	AI_Output(other,self,"DIA_Fajeth_Hallo_Tun_15_00");	//Что я могу сделать для тебя?
	AI_Output(self,other,"DIA_Fajeth_Hallo_Tun_12_01");	//Вот уже несколько дней, орда снепперов бродит вокруг нашего лагеря. Похоже, они просто выжидают подходящей возможности для нападения.
	AI_Output(self,other,"DIA_Fajeth_Hallo_Tun_12_02");	//Я не знаю, чего они ждут - но пока они здесь, в лагере не будет спокойствия.
	if(Npc_IsDead(Fed) == FALSE)
	{
		AI_Output(self,other,"DIA_Fajeth_Hallo_Tun_12_03");	//Фед, помимо всего прочего, напуган ими до смерти - и сводит с ума остальных каторжников.
	};
	if(Npc_IsDead(Bilgot) == FALSE)
	{
		AI_Output(self,other,"DIA_Fajeth_Hallo_Tun_12_04");	//И кого мне послать? Билгота? Ха - он тоже слабак.
	};
	if(Npc_IsDead(Tengron) == FALSE)
	{
		AI_Output(self,other,"DIA_Fajeth_Hallo_Tun_12_05");	//Тенгрона? Конечно, он умеет сражаться, но он не обладает хитростью охотника.
	};
	AI_Output(self,other,"DIA_Fajeth_Hallo_Tun_12_06");	//Ты единственный, кто может сделать это. Я хочу, чтобы ты выследил этих чертовых тварей и убил их.
	MIS_Fajeth_Kill_Snapper = LOG_Running;
	Log_CreateTopic(TOPIC_FajethKillSnapper,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FajethKillSnapper,LOG_Running);
	B_LogEntry(TOPIC_FajethKillSnapper,"Фаджет поручил мне охотиться на снепперов, которые вот уже в течении нескольких дней бродят вокруг лагеря.");
	AI_StopProcessInfos(self);
	Wld_InsertNpc(NewMine_Snapper7,"OW_PATH_333");
	Wld_InsertNpc(NewMine_Snapper8,"OW_PATH_333");
	Wld_InsertNpc(NewMine_Snapper3,"SPAWN_OW_BLOCKGOBBO_CAVE_DM6");
};

func void DIA_Fajeth_Hallo_KDFNein()
{
	AI_Output(other,self,"DIA_Fajeth_Hallo_KDFNein_15_00");	//Мое задание важнее. Я не могу помочь тебе.
	AI_Output(self,other,"DIA_Fajeth_Hallo_KDFNein_12_01");	//Конечно, о, достопочтенный. Я сообщу тебе все, что ты желаешь знать.
	MIS_Fajeth_Kill_Snapper = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Fajeth_Hallo);
};

func void DIA_Fajeth_Hallo_MILNein()
{
	AI_Output(other,self,"DIA_Fajeth_Hallo_MILNein_15_00");	//У меня уже есть приказ. От Гаронда.
	AI_Output(self,other,"DIA_Fajeth_Hallo_MILNein_12_01");	//И ты выполнишь его. Но только после того, как я отпущу тебя.
	AI_Output(self,other,"DIA_Fajeth_Hallo_MILNein_12_02");	//Единственное, что я хочу слышать от тебя -это 'Что я могу сделать?' Понятно?
};

func void DIA_Fajeth_Hallo_SLDJa()
{
	AI_Output(other,self,"DIA_Fajeth_Hallo_SLDJa_15_00");	//У всего есть своя цена. Если ты заплатишь мне, возможно, я и соглашусь.
	AI_Output(self,other,"DIA_Fajeth_Hallo_SLDJa_12_01");	//Я не привык вести дела с наемниками. Я ненавижу торговаться, чтобы снизить цену.
	AI_Output(self,other,"DIA_Fajeth_Hallo_SLDJa_12_02");	//Но в знак проявления моей доброй воли, я заплачу тебе сто золотых, если ты выполнишь эту работу для меня.
	AI_Output(self,other,"DIA_Fajeth_Hallo_SLDJa_12_03");	//Ну как, по рукам?
	Fajeth_Pay = TRUE;
	Info_ClearChoices(DIA_Fajeth_Hallo);
	Info_AddChoice(DIA_Fajeth_Hallo,"Что я могу сделать для тебя?",DIA_Fajeth_Hallo_Tun);
	Info_AddChoice(DIA_Fajeth_Hallo,"Нет, меня нет времени.",DIA_Fajeth_Hallo_SLDNein);
};

func void DIA_Fajeth_Hallo_SLDNein()
{
	AI_Output(other,self,"DIA_Fajeth_Hallo_SLDNein_15_00");	//Нет, у меня нет времени заботиться о твоей проблеме.
	AI_Output(self,other,"DIA_Fajeth_Hallo_SLDNein_12_01");	//Ты выбиваешь легкие деньги? Я не ожидал этого от наемника.
	AI_Output(self,other,"DIA_Fajeth_Hallo_SLDNein_12_02");	//Так как ты не хочешь помочь нам, задавай вопросы и исчезни.
	MIS_Fajeth_Kill_Snapper = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Fajeth_Hallo);
};

func void dia_fajeth_hallo_kdwnein()
{
	AI_Output(other,self,"DIA_Fajeth_Hallo_KDWNein_15_00");	//Нет, у меня нет времени заботиться о твоей проблеме.
	AI_Output(self,other,"DIA_Fajeth_Hallo_KDWNein_12_01");	//Ну что же! Тогда придется решать проблему самому. Спасибо хотя бы, что выслушал меня.
	MIS_Fajeth_Kill_Snapper = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Fajeth_Hallo);
};

func void dia_fajeth_hallo_kdmnein()
{
	AI_Output(other,self,"DIA_Fajeth_Hallo_KDMNein_15_00");	//Нет, у меня нет времени заботиться о твоей проблеме.
	AI_Output(self,other,"DIA_Fajeth_Hallo_KDMNein_12_01");	//Ну что же! Тогда придется решать проблему самому. Спасибо хотя бы, что выслушал меня.
	MIS_Fajeth_Kill_Snapper = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Fajeth_Hallo);
};

func void dia_fajeth_hallo_seknein()
{
	AI_Output(other,self,"DIA_Fajeth_Hallo_SEKNein_15_00");	//Нет, у меня нет времени заботиться о твоей проблеме.
	AI_Output(self,other,"DIA_Fajeth_Hallo_SEKNein_12_01");	//Ну что же! Тогда придется решать проблему самому. Спасибо хотя бы, что выслушал меня.
	MIS_Fajeth_Kill_Snapper = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Fajeth_Hallo);
};


instance DIA_Fajeth_Leader(C_Info)
{
	npc = PAL_281_Fajeth;
	nr = 2;
	condition = DIA_Fajeth_Leader_Condition;
	information = DIA_Fajeth_Leader_Info;
	permanent = FALSE;
	description = "Я убил вожака стаи.";
};


func int DIA_Fajeth_Leader_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bilgot_KNOWSLEADSNAPPER) && Npc_IsDead(NewMine_LeadSnapper))
	{
		return TRUE;
	};
};

func void DIA_Fajeth_Leader_Info()
{
	AI_Output(other,self,"DIA_Fajeth_Leader_15_00");	//Я убил предводителя снепперов.
	AI_Output(self,other,"DIA_Fajeth_Leader_12_01");	//Хорошо. Без предводителя они не так опасны. Я думаю, теперь возможно они не будут больше нападать на нас.
	B_GivePlayerXP(150);
};


instance DIA_Fajeth_SNAPPER_KILLED(C_Info)
{
	npc = PAL_281_Fajeth;
	nr = 9;
	condition = DIA_Fajeth_SNAPPER_KILLED_Condition;
	information = DIA_Fajeth_SNAPPER_KILLED_Info;
	permanent = TRUE;
	description = "Со снепперами покончено.";
};


func int DIA_Fajeth_SNAPPER_KILLED_Condition()
{
	if((MIS_Fajeth_Kill_Snapper == LOG_Running) && (C_SnapperDeath() == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Fajeth_SNAPPER_KILLED_Info()
{
	AI_Output(hero,self,"DIA_Fajeth_SNAPPER_KILLED_15_00");	//Со снепперами покончено.
	AI_Output(self,hero,"DIA_Fajeth_SNAPPER_KILLED_12_01");	//Отлична работа. А с остальными зверями мы сами разберемся.
	if(Fajeth_Pay == TRUE)
	{
		AI_Output(self,hero,"DIA_Fajeth_SNAPPER_KILLED_12_02");	//Ты заработал свое золото - вот 100 монет, как и договаривались.
		B_GiveInvItems(self,other,ItMi_Gold,100);
	};
	Fajeth.flags = 0;
	MIS_Fajeth_Kill_Snapper = LOG_SUCCESS;
	B_GivePlayerXP(XP_FajethKillSnapper);
};


instance DIA_Fajeth_Running(C_Info)
{
	npc = PAL_281_Fajeth;
	nr = 9;
	condition = DIA_Fajeth_Running_Condition;
	information = DIA_Fajeth_Running_Info;
	permanent = TRUE;
	description = "Как настроение у твоих людей?";
};


func int DIA_Fajeth_Running_Condition()
{
	if(MIS_Fajeth_Kill_Snapper == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Fajeth_Running_Info()
{
	AI_Output(other,self,"DIA_Fajeth_Running_15_00");	//Как настроение у твоих людей?
	AI_Output(self,other,"DIA_Fajeth_Running_12_01");	//Ты хочешь узнать, каково настроение моих людей? Да они еле могут работать от страха!
	AI_Output(self,other,"DIA_Fajeth_Running_12_02");	//Разберись с этими снепперами, или кто-нибудь сорвется!
};


instance DIA_Fajeth_BELOHNUNG(C_Info)
{
	npc = PAL_281_Fajeth;
	nr = 3;
	condition = DIA_Fajeth_BELOHNUNG_Condition;
	information = DIA_Fajeth_BELOHNUNG_Info;
	permanent = FALSE;
	description = "Скажи мне, сколько руды удалось вам добыть.";
};


func int DIA_Fajeth_BELOHNUNG_Condition()
{
	if((MIS_Fajeth_Kill_Snapper == LOG_SUCCESS) || (MIS_Fajeth_Kill_Snapper == LOG_OBSOLETE))
	{
		return TRUE;
	};
};

func void DIA_Fajeth_BELOHNUNG_Info()
{
	AI_Output(other,self,"DIA_Fajeth_BELOHNUNG_15_00");	//Скажи мне, сколько руды удалось вам добыть.
	AI_Output(self,other,"DIA_Fajeth_BELOHNUNG_12_01");	//Доложи Гаронду, что мы смогли добыть только ДВА ящика руды.
	AI_Output(self,other,"DIA_Fajeth_BELOHNUNG_12_02");	//Из-за постоянных нападений на нас мы потеряли очень много людей.
	AI_Output(self,other,"DIA_Fajeth_BELOHNUNG_12_03");	//Если Гаронд сможет прислать подкрепление, мы сможем добывать больше руды.
	AI_Output(other,self,"DIA_Fajeth_BELOHNUNG_15_04");	//Понятно. Я так и передам ему.
	AI_Output(self,other,"DIA_Fajeth_BELOHNUNG_12_05");	//Хорошо. Мы надеемся на тебя. И будем удерживать наши позиции до последнего.
	Fajeth_Ore = TRUE;
	B_LogEntry(TOPIC_ScoutMine,"Старатели Фаджета смогли добыть ДВА ящика руды.");
	AI_StopProcessInfos(self);
};


instance DIA_Fajeth_Perm2(C_Info)
{
	npc = PAL_281_Fajeth;
	nr = 9;
	condition = DIA_Fajeth_Perm2_Condition;
	information = DIA_Fajeth_Perm2_Info;
	permanent = TRUE;
	description = "Как идет добыча руды?";
};


func int DIA_Fajeth_Perm2_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Fajeth_BELOHNUNG) && (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_Fajeth_Perm2_Info()
{
	AI_Output(other,self,"DIA_Fajeth_Perm2_15_00");	//Как идет добыча руды?
	AI_Output(self,other,"DIA_Fajeth_Perm2_12_01");	//Плохо. Прогресса почти нет.
	AI_Output(self,other,"DIA_Fajeth_Perm2_12_02");	//Когда мы прибыли сюда, сначала все шло хорошо - но теперь мои парни не добывают почти ничего кроме обломков. Ничего стоящего.
	AI_Output(self,other,"DIA_Fajeth_Perm2_12_03");	//Но мы не отступим - по крайней мере, пока я командую здесь.
};


instance DIA_Fajeth_ERZABBAU(C_Info)
{
	npc = PAL_281_Fajeth;
	nr = 11;
	condition = DIA_Fajeth_ERZABBAU_Condition;
	information = DIA_Fajeth_ERZABBAU_Info;
	permanent = TRUE;
	description = "Как идет добыча руды?";
};


func int DIA_Fajeth_ERZABBAU_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Fajeth_BELOHNUNG) && (Kapitel >= 3))
	{
		return TRUE;
	};
};

func void DIA_Fajeth_ERZABBAU_Info()
{
	AI_Output(other,self,"DIA_Fajeth_ERZABBAU_15_00");	//Как идет добыча руды?
	if(MIS_AllDragonsDead == TRUE)
	{
		AI_Output(self,other,"DIA_Fajeth_ERZABBAU_12_01");	//Здесь стало спокойнее. С чего бы это?
		AI_Output(other,self,"DIA_Fajeth_ERZABBAU_15_02");	//Драконы мертвы.
		AI_Output(self,other,"DIA_Fajeth_ERZABBAU_12_03");	//Ох, тогда я надеюсь, что подкрепления ждать недолго. Я все время теряю своих людей.
	}
	else
	{
		AI_Output(self,other,"DIA_Fajeth_ERZABBAU_12_04");	//Да ты сам это видишь...
	};
};


instance DIA_Fajeth_PICKPOCKET(C_Info)
{
	npc = PAL_281_Fajeth;
	nr = 900;
	condition = DIA_Fajeth_PICKPOCKET_Condition;
	information = DIA_Fajeth_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Fajeth_PICKPOCKET_Condition()
{
	return C_Beklauen(56,95);
};

func void DIA_Fajeth_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Fajeth_PICKPOCKET);
	Info_AddChoice(DIA_Fajeth_PICKPOCKET,Dialog_Back,DIA_Fajeth_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Fajeth_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Fajeth_PICKPOCKET_DoIt);
};

func void DIA_Fajeth_PICKPOCKET_DoIt()
{
	B_Beklauen();
	INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
	Info_ClearChoices(DIA_Fajeth_PICKPOCKET);
};

func void DIA_Fajeth_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Fajeth_PICKPOCKET);
};

