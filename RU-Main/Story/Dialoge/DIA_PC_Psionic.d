
instance DIA_Lester_EXIT(C_Info)
{
	npc = PC_Psionic;
	nr = 999;
	condition = DIA_Lester_EXIT_Condition;
	information = DIA_Lester_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lester_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Lester_EXIT_Info()
{
	AI_StopProcessInfos(self);

	if(self.flags == NPC_FLAG_IMMORTAL)
	{
		self.flags = 0;
	};
};

instance DIA_Lester_PREZHello(C_Info)
{
	npc = PC_Psionic;
	nr = 1;
	condition = DIA_Lester_PREZHello_Condition;
	information = DIA_Lester_PREZHello_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Lester_PREZHello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && ((hero.guild == GIL_SEK) || (hero.guild == GIL_TPL) || (hero.guild == GIL_GUR)))
	{
		return TRUE;
	};
};

func void DIA_Lester_PREZHello_Info()
{
	B_Say_Overlay(self,other,"$SEKGREETINGS");
	AI_PlayAni(self,"T_GREETNOV");
};

instance DIA_Lester_Hello(C_Info)
{
	npc = PC_Psionic;
	nr = 1;
	condition = DIA_Lester_Hello_Condition;
	information = DIA_Lester_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Lester_Hello_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Lester_Hello_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		B_TurnToNpc(self,other);
	};
	self.aivar[AIV_EnemyOverride] = FALSE;
	AI_Output(self,other,"DIA_Lester_Hello_13_00");	//Это ТЫ? - Точно! Ох, как я рад видеть тебя!
	Info_ClearChoices(DIA_Lester_Hello);
	Info_AddChoice(DIA_Lester_Hello,"Я что, знаю тебя?",DIA_Lester_Hello_YouKnowMe);
	Info_AddChoice(DIA_Lester_Hello,"Лестер! Как ты оказался здесь?",DIA_Lester_Hello_Lester);
};

func void DIA_Lester_Hello_Lester()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Lester_Hello_Lester_15_00");	//Лестер! Как ты оказался здесь?
	AI_Output(self,other,"DIA_Lester_Hello_Lester_13_01");	//Это был безумный побег! После того, как Барьер рухнул, я бродил там некоторое время в полном смятении.
	AI_Output(self,other,"DIA_Lester_Hello_Lester_13_02");	//Потом я потратил несколько дней, пробираясь через все эти леса, пока, наконец, не оказался в этой долине.
	AI_Output(self,other,"DIA_Lester_Hello_Lester_13_03");	//Диего, Милтен и Горн еще в Долине Рудников. По крайней мере, я так думаю.
	Info_ClearChoices(DIA_Lester_Hello);
};

func void DIA_Lester_Hello_YouKnowMe()
{
	Info_ClearChoices(DIA_Lester_Hello);
	AI_Output(other,self,"DIA_Lester_Hello_YouKnowMe_15_00");	//Я что, знаю тебя?
	AI_Output(self,other,"DIA_Lester_Hello_YouKnowMe_13_01");	//Эй? У тебя все дома? Я рисковал своей шеей, чтобы ты мог заполучить этот чертов камень.
	AI_Output(self,other,"DIA_Lester_Hello_YouKnowMe_13_02");	//За тобой должок... Ну, уж это-то ты должен помнить.
	AI_Output(self,other,"DIA_Lester_Hello_YouKnowMe_13_03");	//А ты помнишь Диего, Милтена и Горна?
	Info_AddChoice(DIA_Lester_Hello,"Диего, Милтен и КТО?",DIA_Lester_Hello_WhoFourFriends);
	Info_AddChoice(DIA_Lester_Hello,"Конечно. Как они?",DIA_Lester_Hello_KnowFourFriends);
};

func void DIA_Lester_Hello_KnowFourFriends()
{
	Info_ClearChoices(DIA_Lester_Hello);
	AI_Output(other,self,"DIA_Lester_Hello_KnowFourFriends_15_00");	//Конечно. Как они?
	AI_Output(self,other,"DIA_Lester_Hello_KnowFourFriends_13_01");	//Насколько я знаю, они выжили при разрушении барьера.
	AI_Output(self,other,"DIA_Lester_Hello_KnowFourFriends_13_02");	//Но я понятия не имею, где они сейчас - эта троица, вероятно, все еще ошивается в Долине Рудников.
	AI_Output(self,other,"DIA_Lester_Hello_KnowFourFriends_13_03");	//Если ты наткнешься на них, дай мне знать.
};

func void DIA_Lester_Hello_WhoFourFriends()
{
	Info_ClearChoices(DIA_Lester_Hello);
	AI_Output(other,self,"DIA_Lester_Hello_WhoFourFriends_15_00");	//Диего, Милтен и КТО?
	AI_Output(self,other,"DIA_Lester_Hello_WhoFourFriends_13_01");	//Только не говори мне, что ты ничего этого не помнишь. Фокусирующие камни - тролль - огромная куча руды, принадлежащая магам воды?
	AI_Output(other,self,"DIA_Lester_Hello_WhoFourFriends_15_02");	//Я не знаю...
	AI_Output(self,other,"DIA_Lester_Hello_WhoFourFriends_13_03");	//Память к тебе еще вернется. Мне тоже понадобилось некоторое время, чтобы привести свою голову в порядок.
};


instance DIA_Lester_WhatHappened(C_Info)
{
	npc = PC_Psionic;
	nr = 1;
	condition = DIA_Lester_WhatHappened_Condition;
	information = DIA_Lester_WhatHappened_Info;
	permanent = FALSE;
	description = "Что произошло?";
};


func int DIA_Lester_WhatHappened_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lester_Hello) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Lester_WhatHappened_Info()
{
	AI_Output(other,self,"DIA_Lester_WhatHappened_15_00");	//Что произошло?
	AI_Output(self,other,"DIA_Lester_WhatHappened_13_01");	//После того, как Спящий был повержен, все Братство как будто сошло с ума.
	AI_Output(self,other,"DIA_Lester_WhatHappened_13_02");	//Без своего хозяина они стали напоминать пустые оболочки.
	AI_Output(other,self,"DIA_Lester_WhatHappened_15_03");	//А ты? Что насчет тебя?
	AI_Output(self,other,"DIA_Lester_WhatHappened_13_04");	//Со мной тоже не все было ладно. У меня были кошмары, и даже галлюцинации. Но когда в моей голове более-менее прояснилось, я побежал оттуда.
	AI_Output(self,other,"DIA_Lester_WhatHappened_13_05");	//Как-то мне показалось, что я видел, как огромная черная тень налетела на группу беглецов и сожгла их в пепел, накрыв гигантским облаком огня.
	AI_Output(self,other,"DIA_Lester_WhatHappened_13_06");	//Тогда я даже подумал, что это прилетел дракон, чтобы убить меня.
	AI_Output(other,self,"DIA_Lester_WhatHappened_15_07");	//Ты видел что-нибудь еще?
	AI_Output(self,other,"DIA_Lester_WhatHappened_13_08");	//Нет - я вскочил и побежал!
};


instance DIA_Lester_MineColony(C_Info)
{
	npc = PC_Psionic;
	nr = 2;
	condition = DIA_Lester_MineColony_Condition;
	information = DIA_Lester_MineColony_Info;
	permanent = FALSE;
	description = "Сколько ты уже скрываешься в этой долине?";
};


func int DIA_Lester_MineColony_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lester_Hello) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Lester_MineColony_Info()
{
	AI_Output(other,self,"DIA_Lester_ReturnToColony_15_00");	//Сколько ты уже скрываешься в этой долине?
	AI_Output(self,other,"DIA_Lester_ReturnToColony_13_01");	//Точно не знаю. Может, неделю. Но есть еще кое-что:
	AI_Output(self,other,"DIA_Lester_ReturnToColony_13_02");	//Когда я пришел сюда вечером, я взглянул на эту гору - там стояло всего несколько деревьев.
	AI_Output(self,other,"DIA_Lester_ReturnToColony_13_03");	//А когда я посмотрел туда же на следующее утро, там уже стояла эта башня. Я готов поклясться, что раньше ее там не было. И с тех пор я не покидал эту долину.
	AI_Output(other,self,"DIA_Lester_ReturnToColony_15_04");	//Ты имеешь в виду башню Ксардаса? Я знал, что он на многое способен, но создать башню вот так запросто...
	AI_Output(self,other,"DIA_Lester_ReturnToColony_13_05");	//Ксардас, некромант? Он живет в этой башне? Мне это не нравится...
	AI_Output(other,self,"DIA_Lester_ReturnToColony_15_06");	//Не волнуйся, это он спас меня из храма Спящего. Он на нашей стороне.
};

instance DIA_Lester_SEND_XARDAS(C_Info)
{
	npc = PC_Psionic;
	nr = 4;
	condition = DIA_Lester_SEND_XARDAS_Condition;
	information = DIA_Lester_SEND_XARDAS_Info;
	permanent = FALSE;
	description = "Ты должен рассказать Ксардасу об этой тени.";
};

func int DIA_Lester_SEND_XARDAS_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lester_WhatHappened) && (LesterGoXar == FALSE) && Npc_KnowsInfo(other,DIA_Lester_MineColony) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Lester_SEND_XARDAS_Info()
{
	AI_Output(other,self,"DIA_Lester_SEND_XARDAS_15_00");	//Ты должен рассказать Ксардасу об этой тени. Это может быть важно.
	AI_Output(self,other,"DIA_Lester_SEND_XARDAS_13_01");	//Ты не думаешь, что мне показалось? Ты хочешь сказать, что это действительно был...
	AI_Output(other,self,"DIA_Lester_SEND_XARDAS_15_02");	//... дракон. Да.
	AI_Output(self,other,"DIA_Lester_SEND_XARDAS_13_03");	//Ты опять лезешь в самое пекло. Я прав?
	AI_Output(other,self,"DIA_Lester_SEND_XARDAS_15_04");	//Не сказал бы, что в самое... пока...
	AI_Output(self,other,"DIA_Lester_SEND_XARDAS_13_05");	//(вздыхает) Хорошо, если это так важно, то я зайду к нему - но не сейчас.
	AI_Output(self,other,"DIA_Lester_SEND_XARDAS_13_06");	//Сейчас я собираюсь отдохнуть. Я все еще измотан после этого бегства из колонии.
	AI_Output(self,other,"DIA_Lester_SEND_XARDAS_13_07");	//Мне кажется, у тебя большие планы. Увидимся позже у Ксардаса.
	LesterCanGoXar = TRUE;
 	LesterCanGoXarDay = Wld_GetDay();
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Lester_STADT(C_Info)
{
	npc = PC_Psionic;
	nr = 1;
	condition = DIA_Addon_Lester_STADT_Condition;
	information = DIA_Addon_Lester_STADT_Info;
	description = "Я направляюсь в Хоринис. Что ты знаешь об этом городе?";
};


func int DIA_Addon_Lester_STADT_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lester_Hello) && (Mil_310_schonmalreingelassen == FALSE) && (Mil_333_schonmalreingelassen == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lester_STADT_Info()
{
	AI_Output(other,self,"DIA_Addon_Lester_STADT_15_00");	//Я направляюсь в Хоринис. Что ты знаешь об этом городе?
	AI_Output(self,other,"DIA_Addon_Lester_STADT_13_01");	//Хоринис? Ну, это довольно большой морской порт.
	AI_Output(self,other,"DIA_Addon_Lester_STADT_13_02");	//А почему ты спрашиваешь?
	AI_Output(other,self,"DIA_Addon_Lester_STADT_15_03");	//Я должен поговорить с паладинами, которые обосновались в городе.
	AI_Output(self,other,"DIA_Addon_Lester_STADT_13_04");	//(смеется) Неужели? Ха, да тебя не пустят даже в сам город, не то, что к паладинам.
};


instance DIA_Addon_Lester_Vorschlag(C_Info)
{
	npc = PC_Psionic;
	nr = 1;
	condition = DIA_Addon_Lester_Vorschlag_Condition;
	information = DIA_Addon_Lester_Vorschlag_Info;
	description = "Может быть, ты знаешь способ, который поможет мне попасть в Хоринис?";
};


func int DIA_Addon_Lester_Vorschlag_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Lester_STADT) && (Mil_310_schonmalreingelassen == FALSE) && (Mil_333_schonmalreingelassen == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lester_Vorschlag_Info()
{
	AI_Output(other,self,"DIA_Addon_Lester_Vorschlag_15_00");	//Может быть, ты знаешь способ, который поможет мне попасть в Хоринис?
	AI_Output(self,other,"DIA_Addon_Lester_Vorschlag_13_01");	//Знаю. Некоторое время назад я работал на старого алхимика по имени Константино.
	AI_Output(self,other,"DIA_Addon_Lester_Vorschlag_13_02");	//Он - довольно влиятельное лицо в городе. Ему удалось добиться того, чтобы стражники пропускали в город каждого, кто приносит ему редкие травы.
	AI_Output(self,other,"DIA_Addon_Lester_Vorschlag_13_03");	//Так что на самом деле все довольно просто. Тебе нужно собрать большую охапку растущих здесь повсюду растений, а затем сказать стражникам, что ты несешь их Константино.
	AI_Output(self,other,"DIA_Addon_Lester_Vorschlag_13_04");	//Но ты не должен собирать разные травы. Стражники не слишком сообразительны и в алхимии не разбираются.
	AI_Output(self,other,"DIA_Addon_Lester_Vorschlag_13_05");	//Чтобы они тебя пропустили, твоя охапка трав должна им понравиться.
	AI_Output(self,other,"DIA_Addon_Lester_Vorschlag_13_06");	//Думаю, десяти одинаковых растений будет достаточно.
	AI_Output(other,self,"DIA_Addon_Lester_Vorschlag_15_07");	//Спасибо за совет.
	Log_CreateTopic(TOPIC_Addon_PickForConstantino,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_PickForConstantino,LOG_Running);
	B_LogEntry(TOPIC_Addon_PickForConstantino,"Лестер говорит, что я могу пройти мимо городской стражи, если у меня будет 10 растений одного вида, и если я скажу им, что они предназначены для алхимика Константино.");
	MIS_Addon_Lester_PickForConstantino = LOG_Running;
};


instance DIA_Addon_Lester_PASSAGEPLANTSSUCCESS(C_Info)
{
	npc = PC_Psionic;
	nr = 5;
	condition = DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_Condition;
	information = DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_Info;
	description = "Все сработало замечательно.";
};


func int DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_Condition()
{
	if((MIS_Addon_Lester_PickForConstantino == LOG_SUCCESS) && (CheckTownPlants == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_Info()
{
	AI_Output(other,self,"DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_15_00");	//Все сработало замечательно. Когда я сказал, что принес травы для Константино, стражники сразу же пропустили меня.
	AI_Output(self,other,"DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_13_01");	//Как я и говорил. Я плохого не посоветую, друг мой.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Lester_Perm(C_Info)
{
	npc = PC_Psionic;
	nr = 99;
	condition = DIA_Lester_Perm_Condition;
	information = DIA_Lester_Perm_Info;
	permanent = FALSE;
	description = "Что ты знаешь об этой местности?";
};


func int DIA_Lester_Perm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lester_Hello) && (Kapitel < 3) && (Npc_GetDistToWP(self,"NW_XARDAS_TOWER_IN1_31") > 1000))
	{
		return TRUE;
	};
};

func void DIA_Lester_Perm_Info()
{
	AI_Output(other,self,"DIA_Lester_Perm_15_00");	//Что ты знаешь о местности?
	AI_Output(self,other,"DIA_Lester_Perm_13_01");	//Если ты пойдешь по этой тропинке, то попадешь на ферму. А еще чуть дальше начинается город.
	AI_Output(self,other,"DIA_Lester_Perm_13_02");	//Но будь осторожен! По дороге тебе могут встретиться не только волки и крысы, но также гоблины и бандиты.

	if(LESTER_TERRAININFO == FALSE)
	{
		AI_Output(self,other,"DIA_Lester_Perm_13_06");	//И вот еще...Возьми эту набедренную повязку послушника!
		AI_Output(self,other,"DIA_Lester_Perm_13_07");	//Я прихватил с собой перед тем, как уйти из лагеря на болотах.
		AI_Output(self,other,"DIA_Lester_Perm_13_08");	//Она мне не к чему, а вот тебе возможно сослужит хорошую службу.
		B_GiveInvItems(self,other,itar_sekbed,1);
		LESTER_TERRAININFO = TRUE;
	};
};

instance DIA_LESTER_GETSMOKE(C_Info)
{
	npc = PC_Psionic;
	nr = 2;
	condition = dia_lester_getsmoke_condition;
	information = dia_lester_getsmoke_info;
	permanent = FALSE;
	description = "Ты все еще чувствуешь себя измотанным?";
};

func int dia_lester_getsmoke_condition()
{
	if((Npc_GetDistToWP(self,"NW_XARDAS_TOWER_IN1_31") <= 500) && (Kapitel < 6))
	{
		return TRUE;
	};
};

func void dia_lester_getsmoke_info()
{
	AI_Output(other,self,"DIA_Lester_Sleep_15_00");	//Ты все еще чувствуешь себя измотанным?
	AI_Output(self,other,"DIA_Lester_Sleep_13_01");	//Еще как. (зевает) Я рассказал Ксардасу все. А теперь я посплю немного. Денек...
	AI_Output(self,other,"DIA_Lester_Sleep_13_02");	//...другой... или даже больше.
	AI_Output(other,self,"DIA_Lester_GetSmoke_01_00");	//Я могу тебе чем-нибудь помочь?
	AI_Output(self,other,"DIA_Lester_GetSmoke_01_01");	//Не думаю, что ты чем-то сможешь помочь мне. Хотя...(задумчиво)
	AI_Output(other,self,"DIA_Lester_GetSmoke_01_02");	//Что?!
	AI_Output(self,other,"DIA_Lester_GetSmoke_01_03");	//Эх!...(ностальгически) Я бы сейчас не отказался от пары затяжек старого доброго болотника, который мы делали раньше в лагере на болотах.
	AI_Output(self,other,"DIA_Lester_GetSmoke_01_04");	//Помнишь, например 'Северный Темный' - эта травка отлично прочищала мозги!
	AI_Output(self,other,"DIA_Lester_GetSmoke_01_05");	//И возможно, она бы смогла ненадолго вернуть меня к жизни.
	AI_Output(other,self,"DIA_Lester_GetSmoke_01_06");	//Если хочешь, я могу поискать ее для тебя?!
	AI_Output(self,other,"DIA_Lester_GetSmoke_01_07");	//Теперь ее не найдешь!...(печально) Я слышал, что даже братья у прохода не делают такой!
	AI_Output(self,other,"DIA_Lester_GetSmoke_01_09");	//Но в любом случае если у тебя будет на это время - то можешь поискать ее для меня.
	AI_Output(other,self,"DIA_Lester_GetSmoke_01_10");	//Хорошо, сделаю все что смогу!
	MIS_LESTERGETSMOKE = LOG_Running;
	Log_CreateTopic(TOPIC_LESTERGETSMOKE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LESTERGETSMOKE,LOG_Running);
	B_LogEntry(TOPIC_LESTERGETSMOKE,"Лестер сказал, что с удовольствием бы выкурил 'Северного Темного', болотник который раньше делали в Братстве Спящего. Если мне попадется на глаза эта травка, надо будет не забыть принести ее Лестеру.");
};

instance DIA_LESTER_SMOKEFOUND(C_Info)
{
	npc = PC_Psionic;
	nr = 2;
	condition = dia_lester_smokefound_condition;
	information = dia_lester_smokefound_info;
	permanent = FALSE;
	description = "У меня тут кое-что есть для тебя.";
};


func int dia_lester_smokefound_condition()
{
	if((MIS_LESTERGETSMOKE == LOG_Running) && (Npc_HasItems(hero,itmi_joint_02) >= 1))
	{
		return TRUE;
	};
};

func void dia_lester_smokefound_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Lester_SmokeFound_01_00");	//У меня тут кое-что есть для тебя.
	AI_Output(self,other,"DIA_Lester_SmokeFound_01_01");	//Хммм...(с интересом) На что это ты намекаешь?!
	AI_Output(self,other,"DIA_Lester_SmokeFound_01_02");	//Хочешь сказать, что тебе удалось достать для меня эту травку?!
	AI_Output(other,self,"DIA_Lester_SmokeFound_01_03");	//Вот, держи - настоящий 'Северный Темный'!
	B_GiveInvItems(other,self,itmi_joint_02,1);
	AI_Output(self,other,"DIA_Lester_SmokeFound_01_04");	//Правда?!...(удивленно) Ну ка, сейчас посмотрим!
	CreateInvItem(self,ItMi_Joint);
	B_UseItem(self,ItMi_Joint);
	AI_Output(self,other,"DIA_Lester_SmokeFound_01_05");	//Ну надо же - это действительно он!
	AI_Output(self,other,"DIA_Lester_SmokeFound_01_07");	//Спасибо, приятель! Ты просто выручил меня.
	MIS_LESTERGETSMOKE = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_LESTERGETSMOKE,LOG_SUCCESS);
	B_LogEntry(TOPIC_LESTERGETSMOKE,"Я принес Лестеру 'Северный Темный'. Он был просто счастлив вновь ощутить любимый вкус! Это вернет его немного к жизни.");
};

instance DIA_Lester_KAP3_EXIT(C_Info)
{
	npc = PC_Psionic;
	nr = 999;
	condition = DIA_Lester_KAP3_EXIT_Condition;
	information = DIA_Lester_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lester_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Lester_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lester_BACKINTOWN(C_Info)
{
	npc = PC_Psionic;
	nr = 2;
	condition = DIA_Lester_BACKINTOWN_Condition;
	information = DIA_Lester_BACKINTOWN_Info;
	important = TRUE;
};

func int DIA_Lester_BACKINTOWN_Condition()
{
	if((NoDarkInsMe == TRUE) && (Kapitel == 3) && (XarMeetPsi == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lester_BACKINTOWN_Info()
{
	AI_Output(self,other,"DIA_Lester_BACKINTOWN_13_00");	//Эй, ты вернулся, наконец! Ты должен немедленно увидеться с Ксардасом. Возникли проблемы.
	AI_Output(other,self,"DIA_Lester_BACKINTOWN_15_01");	//В это я готов поверить.
	AI_Output(self,other,"DIA_Lester_BACKINTOWN_13_02");	//После того, как ты ушел, здесь начался ад кромешный.
	AI_Output(self,other,"DIA_Lester_BACKINTOWN_13_03");	//Поговори с Ксардасом, он ждет тебя!
	AI_StopProcessInfos(self);
};

instance DIA_Lester_PERM3(C_Info)
{
	npc = PC_Psionic;
	nr = 900;
	condition = DIA_Lester_PERM3_Condition;
	information = DIA_Lester_PERM3_Info;
	permanent = TRUE;
	description = "Ты не очень-то хорошо выглядишь.";
};

func int DIA_Lester_PERM3_Condition()
{
	if((Kapitel >= 3) && (Lester_IsOnBoard != LOG_SUCCESS) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};


var int DIA_Lester_PERM3_OneTime;

func void DIA_Lester_PERM3_Info()
{
	AI_Output(other,self,"DIA_Lester_PERM3_15_00");	//Ты не очень-то хорошо выглядишь.

	if(hero.guild == GIL_KDF)
	{
		if(DIA_Lester_PERM3_OneTime == FALSE)
		{
			AI_Output(self,other,"DIA_Lester_PERM3_13_01");	//Я и чувствую себя не очень хорошо. Я совершенно обессилен, и еще эти постоянные головные боли...
			AI_Output(self,other,"DIA_Lester_PERM3_13_02");	//Каждый раз, когда один из этих парней в черных рясах появляется здесь, они только усиливаются.
			if(SC_KnowsMadPsi == TRUE)
			{
				AI_Output(other,self,"DIA_Lester_PERM3_15_03");	//И я могу сказать тебе почему.
				AI_Output(self,other,"DIA_Lester_PERM3_13_04");	//Да? Боюсь, я не хочу этого знать.
				AI_Output(other,self,"DIA_Lester_PERM3_15_05");	//Люди в черных рясах или темные странники, как мы, маги, называем их - были последователями сильного архидемона. Тебе это ни о чем не говорит?
				AI_Output(self,other,"DIA_Lester_PERM3_13_06");	//Ммм. Нет. Если только ты не хочешь сказать мне, что...
				AI_Output(other,self,"DIA_Lester_PERM3_15_07");	//Да, именно. Темные странники были последователями Спящего. Безумцы из секты отступников из Болотного Лагеря.
				AI_Output(other,self,"DIA_Lester_PERM3_15_08");	//Это твои люди, Лестер. Бывшее Братство Спящего. Теперь они просто бездушные приспешники зла.
				AI_Output(self,other,"DIA_Lester_PERM3_13_09");	//У меня были подозрения, но я надеялся, что это не так. Ты хочешь сказать, он вернулся? Спящий опять здесь?
				AI_Output(other,self,"DIA_Lester_PERM3_15_10");	//Хороший вопрос. Я знаю наверняка, только что я должен остановить их до того, как они станут слишком сильны.
				AI_Output(self,other,"DIA_Lester_PERM3_13_11");	//Мне это не нравится, но я думаю, ты прав. Мне очень жаль, но с моей головой творится такое...
				B_LogEntry(TOPIC_DEMENTOREN,"Мои подозрения подтвердились. Даже у Лестера нет сомнений, что темные странники - это последователи Спящего из старого лагеря в болотах.");
				B_GivePlayerXP(XP_Lester_KnowsMadPsi);
				DIA_Lester_PERM3_OneTime = TRUE;
			};
		};
	}
	else if(Lester_IsOnBoard == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lester_PERM3_13_12");	//Головные боли все еще мучают меня, но я надеюсь, эта проблема скоро будет решена.
		AI_Output(self,other,"DIA_Lester_PERM3_13_13");	//Так или иначе.
	}
	else if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Lester_PERM3_13_14");	//Мои головные боли стали просто невыносимыми. А теперь еще эти люди-ящеры постоянно нападают на меня. Я задаю себе вопрос - откуда они все взялись.
	}
	else
	{
		AI_Output(self,other,"DIA_Lester_PERM3_13_15");	//Эти головные боли все не прекращаются. Грядет что-то ужасное.
	};
	AI_Output(self,other,"DIA_Lester_PERM3_13_16");	//(вздыхает) Я думаю, мне лучше отдохнуть.
};


instance DIA_Lester_KAP4_EXIT(C_Info)
{
	npc = PC_Psionic;
	nr = 999;
	condition = DIA_Lester_KAP4_EXIT_Condition;
	information = DIA_Lester_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lester_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Lester_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lester_KAP5_EXIT(C_Info)
{
	npc = PC_Psionic;
	nr = 999;
	condition = DIA_Lester_KAP5_EXIT_Condition;
	information = DIA_Lester_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lester_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Lester_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lester_XARDASWEG(C_Info)
{
	npc = PC_Psionic;
	nr = 2;
	condition = DIA_Lester_XARDASWEG_Condition;
	information = DIA_Lester_XARDASWEG_Info;
	description = "Где Ксардас?";
};


func int DIA_Lester_XARDASWEG_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Lester_XARDASWEG_Info()
{
	AI_Output(other,self,"DIA_Lester_XARDASWEG_15_00");	//Где Ксардас?
	AI_Output(self,other,"DIA_Lester_XARDASWEG_13_01");	//Он ушел, а его башню заняли эти демонические создания.
	AI_Output(self,other,"DIA_Lester_XARDASWEG_13_02");	//Я думаю, он просто не хочет, чтобы кто-нибудь шарил в башне в его отсутствие.
	AI_Output(other,self,"DIA_Lester_XARDASWEG_15_03");	//Куда он отправился?
	AI_Output(self,other,"DIA_Lester_XARDASWEG_13_04");	//Он не сказал. Он только попросил меня передать тебе это письмо.
	CreateInvItems(self,ItWr_XardasLetterToOpenBook_MIS,1);
	B_GiveInvItems(self,other,ItWr_XardasLetterToOpenBook_MIS,1);
	AI_Output(self,other,"DIA_Lester_XARDASWEG_13_05");	//Я прочел его. Извини. Мне просто было любопытно.
	AI_Output(other,self,"DIA_Lester_XARDASWEG_15_06");	//И?
	AI_Output(self,other,"DIA_Lester_XARDASWEG_13_07");	//Не знаю, я ничего не понял. Но мне ясно одно: Ксардаса мы теперь увидим нескоро.
	AI_Output(self,other,"DIA_Lester_XARDASWEG_13_08");	//Я думаю, здесь стало слишком жарко для него, и он направился в горы.
	XARDAS_MISS = TRUE;
	B_LogEntry(TOPIC_BuchHallenVonIrdorath,"Ксардас исчез. Лестер передал мне письмо Ксардаса, которое тот оставил для меня.");
};


instance DIA_Lester_KnowWhereEnemy(C_Info)
{
	npc = PC_Psionic;
	nr = 2;
	condition = DIA_Lester_KnowWhereEnemy_Condition;
	information = DIA_Lester_KnowWhereEnemy_Info;
	permanent = TRUE;
	description = "Я узнал, где скрывается враг.";
};


func int DIA_Lester_KnowWhereEnemy_Condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && (Lester_IsOnBoard == FALSE) && (CAPITANORDERDIAWAY == FALSE) && (SCGotCaptain == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Lester_KnowWhereEnemy_Info()
{
	AI_Output(other,self,"DIA_Lester_KnowWhereEnemy_15_00");	//Я узнал, где скрывается враг.
	AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_13_01");	//Не спрашивай меня, почему я так думаю, но мне кажется, я должен отправиться с тобой.
	AI_Output(other,self,"DIA_Lester_KnowWhereEnemy_15_02");	//Что ты хочешь этим сказать?
	AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_13_03");	//Я не могу объяснить этого, но я знаю, что смогу получить ответ, только если отправлюсь с тобой.
	if(Crewmember_Count >= Max_Crew)
	{
		AI_Output(other,self,"DIA_Lester_KnowWhereEnemy_15_04");	//Извини, но корабль уже полон.
		AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_13_05");	//Может так и нужно. Может, моя судьба ничего не значит по сравнению с событиями, что ждут нас впереди.
		AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_13_06");	//Ты знаешь, что тебе нужно делать. Сражайся со злом - а обо мне не волнуйся.
		AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_13_07");	//Моя судьба не важна.
	}
	else
	{
		Info_ClearChoices(DIA_Lester_KnowWhereEnemy);
		Info_AddChoice(DIA_Lester_KnowWhereEnemy,"Я не могу взять тебя с собой.",DIA_Lester_KnowWhereEnemy_No);
		Info_AddChoice(DIA_Lester_KnowWhereEnemy,"Тогда пойдем со мной, и получишь ответы на свои вопросы!",DIA_Lester_KnowWhereEnemy_Yes);
	};
};

func void DIA_Lester_KnowWhereEnemy_Yes()
{
	B_GivePlayerXP(XP_Crewmember_Success);
	AI_Output(other,self,"DIA_Lester_KnowWhereEnemy_Yes_15_00");	//Тогда отправляемся вместе, и найди свои ответы!
	AI_Output(other,self,"DIA_Lester_KnowWhereEnemy_Yes_15_01");	//Мы встретимся в порту. Когда я буду готов, я приду туда.
	AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_Yes_13_02");	//Поторопись, у нас мало времени.
	Lester_IsOnBoard = LOG_SUCCESS;
	Crewmember_Count = Crewmember_Count + 1;
	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	Info_ClearChoices(DIA_Lester_KnowWhereEnemy);
};

func void DIA_Lester_KnowWhereEnemy_No()
{
	AI_Output(other,self,"DIA_Lester_KnowWhereEnemy_No_15_00");	//Я не могу взять тебя с собой.
	AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_No_13_01");	//Понимаю. Я, вероятно, действительно мало чем смогу помочь тебе.
	AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_No_13_02");	//Не важно, кого ты возьмешь с собой - главное, чтобы ты доверял им.
	AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_No_13_03");	//И береги себя.
	Lester_IsOnBoard = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Lester_KnowWhereEnemy);
};


instance DIA_Lester_LeaveMyShip(C_Info)
{
	npc = PC_Psionic;
	nr = 4;
	condition = DIA_Lester_LeaveMyShip_Condition;
	information = DIA_Lester_LeaveMyShip_Info;
	permanent = TRUE;
	description = "У меня все же нет места для тебя.";
};


func int DIA_Lester_LeaveMyShip_Condition()
{
	if((Lester_IsOnBoard == LOG_SUCCESS) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lester_LeaveMyShip_Info()
{
	AI_Output(other,self,"DIA_Lester_LeaveMyShip_15_00");	//У меня все же нет места для тебя.
	AI_Output(self,other,"DIA_Lester_LeaveMyShip_13_01");	//Понимаю. Я, вероятно, сделал бы то же самое на твоем месте.
	AI_Output(self,other,"DIA_Lester_LeaveMyShip_13_02");	//Но если я понадоблюсь тебе, я буду рад помочь. Ты знаешь, где найти меня.
	Lester_IsOnBoard = LOG_OBSOLETE;
	Crewmember_Count = Crewmember_Count - 1;
	Npc_ExchangeRoutine(self,"ShipOff");
};


instance DIA_Lester_StillNeedYou(C_Info)
{
	npc = PC_Psionic;
	nr = 4;
	condition = DIA_Lester_StillNeedYou_Condition;
	information = DIA_Lester_StillNeedYou_Info;
	permanent = TRUE;
	description = "Мне нужен друг, всегда готовый помочь.";
};


func int DIA_Lester_StillNeedYou_Condition()
{
	if(((Lester_IsOnBoard == LOG_OBSOLETE) || (Lester_IsOnBoard == LOG_FAILED)) && (Crewmember_Count < Max_Crew) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lester_StillNeedYou_Info()
{
	AI_Output(other,self,"DIA_Lester_StillNeedYou_15_00");	//Мне нужен друг, всегда готовый помочь.
	if(Lester_IsOnBoard == LOG_OBSOLETE)
	{
		AI_Output(self,other,"DIA_Lester_StillNeedYou_13_01");	//Я это знал, мы пройдем это вместе, как и раньше.
		AI_Output(self,other,"DIA_Lester_StillNeedYou_13_02");	//Зло должно бояться, так, как мы следуем за ним вплотную.
		Lester_IsOnBoard = LOG_SUCCESS;
		Crewmember_Count = Crewmember_Count + 1;
		if(MIS_ReadyforChapter6 == TRUE)
		{
			Npc_ExchangeRoutine(self,"SHIP");
		}
		else
		{
			Npc_ExchangeRoutine(self,"WAITFORSHIP");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Lester_StillNeedYou_13_03");	//Я думаю, будет лучше, если я все же останусь здесь. Удачи.
		AI_StopProcessInfos(self);
	};
};


instance DIA_Lester_KAP6_EXIT(C_Info)
{
	npc = PC_Psionic;
	nr = 999;
	condition = DIA_Lester_KAP6_EXIT_Condition;
	information = DIA_Lester_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lester_KAP6_EXIT_Condition()
{
	if(Kapitel >= 6)
	{
		return TRUE;
	};
};

func void DIA_Lester_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PC_Psionic_PICKPOCKET(C_Info)
{
	npc = PC_Psionic;
	nr = 900;
	condition = DIA_PC_Psionic_PICKPOCKET_Condition;
	information = DIA_PC_Psionic_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_PC_Psionic_PICKPOCKET_Condition()
{
	return C_Beklauen(76,20);
};

func void DIA_PC_Psionic_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_PC_Psionic_PICKPOCKET);
	Info_AddChoice(DIA_PC_Psionic_PICKPOCKET,Dialog_Back,DIA_PC_Psionic_PICKPOCKET_BACK);
	Info_AddChoice(DIA_PC_Psionic_PICKPOCKET,DIALOG_PICKPOCKET,DIA_PC_Psionic_PICKPOCKET_DoIt);
};

func void DIA_PC_Psionic_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_PC_Psionic_PICKPOCKET);
};

func void DIA_PC_Psionic_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_PC_Psionic_PICKPOCKET);
};

instance DIA_LESTER_OTHERBROTHER(C_Info)
{
	npc = PC_Psionic;
	nr = 1;
	condition = dia_lester_otherbrother_condition;
	information = dia_lester_otherbrother_info;
	permanent = FALSE;
	description = "Значит, все остальные твои братья погибли?";
};


func int dia_lester_otherbrother_condition()
{
	if(Npc_KnowsInfo(other,DIA_Lester_WhatHappened) && (Kapitel < 6))
	{
		return TRUE;
	};
};

func void dia_lester_otherbrother_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Lester_OtherBrother_01_00");	//Значит, все остальные твои братья погибли?
	AI_Output(self,other,"DIA_Lester_OtherBrother_01_01");	//Нет. Как оказалось - были и те, кому все-таки удалось пережить это безумие.
	AI_Output(other,self,"DIA_Lester_OtherBrother_01_02");	//Откуда ты это знаешь?!
	AI_Output(self,other,"DIA_Lester_OtherBrother_01_03");	//Об этом мне рассказал один парень, которого я его встретил недалеко от подгорного прохода, там наверху.
	AI_Output(other,self,"DIA_Lester_OtherBrother_01_04");	//Кто это был?!
	AI_Output(self,other,"DIA_Lester_OtherBrother_01_05");	//Если мне не изменяет память, его звали - Кавалорн.
	AI_Output(self,other,"DIA_Lester_OtherBrother_01_06");	//Ты должен его помнить - он был одним из призраков Гомеза в колонии.
	AI_Output(other,self,"DIA_Lester_OtherBrother_01_07");	//Кажется, что-то припоминаю. И что же он сказал?!
	AI_Output(self,other,"DIA_Lester_OtherBrother_01_08");	//Ну...(задумчиво) сказал, что несколько оставшихся в живых гуру Братства недавно организовали небольшой лагерь, недалеко от прохода в Долину Рудников.
	AI_Output(self,other,"DIA_Lester_OtherBrother_01_09");	//Правда, по его собственным словам - теперь эти парни проповедуют какую-то иную веру и больше не поклоняются Спящему!
	AI_Output(other,self,"DIA_Lester_OtherBrother_01_12");	//Тогда может быть, тебе бы стоило наведаться туда?
	AI_Output(self,other,"DIA_Lester_OtherBrother_01_13");	//Нет, приятель - хватит с меня всего этого! Мне и тут неплохо!
	AI_Output(other,self,"DIA_Lester_OtherBrother_01_14");	//Ну ладно, как скажешь.
};


instance DIA_LESTER_NW_KAPITELORCATTACK(C_Info)
{
	npc = PC_Psionic;
	nr = 1;
	condition = dia_lester_nw_kapitelorcattack_condition;
	information = dia_lester_nw_kapitelorcattack_info;
	permanent = FALSE;
	description = "И как теперь будем выкручиваться?";
};


func int dia_lester_nw_kapitelorcattack_condition()
{
	if((MIS_HELPCREW == LOG_Running) && (MOVECREWTOHOME == FALSE) && (PSIONICBACKNW == TRUE))
	{
		return TRUE;
	};
};

func void dia_lester_nw_kapitelorcattack_info()
{
	AI_Output(other,self,"DIA_Lester_NW_KapitelOrcAttack_01_00");	//Как теперь будем выкручиваться?
	AI_Output(self,other,"DIA_Lester_NW_KapitelOrcAttack_01_01");	//Уверен, что для тебя это точно не проблема...(смеется) Наверняка ты уже что-нибудь придумал!
	AI_Output(self,other,"DIA_Lester_NW_KapitelOrcAttack_01_03");	//Тебе всегда удавалось выходить сухим из воды.
	AI_Output(other,self,"DIA_Lester_NW_KapitelOrcAttack_01_05");	//А что ты будешь делать?!
	AI_Output(self,other,"DIA_Lester_NW_KapitelOrcAttack_01_06");	//Пока не знаю...(задумчиво) Единственное, что мне приходит в голову - прорываться с боем через город!
	AI_Output(other,self,"DIA_Lester_NW_KapitelOrcAttack_01_07");	//Мне кажется, это не самое лучшее решение.
	AI_Output(self,other,"DIA_Lester_NW_KapitelOrcAttack_01_08");	//А что нам остается делать...(печально) Или у тебя есть предложение получше?!
	Info_ClearChoices(dia_lester_nw_kapitelorcattack);

	if(Npc_HasItems(other,ItMi_TeleportPsicamp) >= 1)
	{
		Info_AddChoice(dia_lester_nw_kapitelorcattack,"Предложить руну телепортации в лагерь Братства.",dia_lester_nw_kapitelorcattack_psicamp);
	};
	Info_AddChoice(dia_lester_nw_kapitelorcattack,"Нет.",dia_lester_nw_kapitelorcattack_nogiverune);
};

func void dia_lester_nw_kapitelorcattack_psicamp()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Lester_NW_KapitelOrcAttack_PsiCamp_01_01");	//У меня есть с собой руна телепортации в лагерь Братства. Ты бы мог ей воспользоваться!
	AI_Output(self,other,"DIA_Lester_NW_KapitelOrcAttack_PsiCamp_01_02");	//Руна телепортации?! Хммм...(задумчиво)
	B_GiveInvItems(other,self,ItMi_TeleportPsicamp,1);
	Npc_RemoveInvItems(self,ItMi_TeleportPsicamp,1);
	AI_Output(self,other,"DIA_Lester_NW_KapitelOrcAttack_PsiCamp_01_04");	//Ну что же, спасибо...(удивленно) Тогда я пожалуй не буду терять времени и сейчас же отправлюсь туда.
	PSIONICNOBATTLETHROUGTH = TRUE;
	B_LogEntry(TOPIC_HELPCREW,"Я отдал Лестеру руну телепортации в Болотный лагерь! Думаю, теперь он без проблем сможет уйти из гавани, минуя патрули орков.");
	PERMCOUNTBACKNW = PERMCOUNTBACKNW + 1;
	b_countbackcrew();
	AI_StopProcessInfos(self);
};

func void dia_lester_nw_kapitelorcattack_nogiverune()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Lester_NW_KapitelOrcAttack_NoGiveRune_01_00");	//Нет.
	AI_Output(self,other,"DIA_Lester_NW_KapitelOrcAttack_NoGiveRune_01_01");	//Вот видишь...(печально) Другого выхода у нас нет!
	B_LogEntry(TOPIC_HELPCREW,"Лестер решил поступить также, как и большинство других парней. Судя по всему, им предстоит пробивать себе дорогу мечом через многочисленные ряды орков. Думаю, у него вполне неплохие шансы осуществить задуманное!");
	PSIONICBATTLETHROUGTH = TRUE;
	PERMCOUNTBACKNW = PERMCOUNTBACKNW + 1;
	b_countbackcrew();
	AI_StopProcessInfos(self);
};


instance DIA_LESTER_NW_ESCAPE(C_Info)
{
	npc = PC_Psionic;
	nr = 1;
	condition = dia_lester_nw_escape_condition;
	information = dia_lester_nw_escape_info;
	permanent = FALSE;
	description = "Рад тебя видеть живым и здоровым!";
};


func int dia_lester_nw_escape_condition()
{
	if((MIS_HELPCREW == LOG_Running) && (REPLACEPLACESCREW == TRUE) && (Lester_IsOnBoard == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_lester_nw_escape_info()
{
	var int countsuv;
	AI_Output(other,self,"DIA_Lester_NW_Escape_01_01");	//Эй, Лестер, рад тебя видеть живым и здоровым!
	AI_Output(self,other,"DIA_Lester_NW_Escape_01_02");	//По правде говоря...(улыбаясь) я тебя тоже!
	AI_Output(other,self,"DIA_Lester_NW_Escape_01_03");	//Так значит вам удалось прорваться через город?!
	if((COUNTCAPTURED > 0) || (COUNTKILLERS > 0))
	{
		countsuv = COUNTSURVIVERS * 100;
		B_GivePlayerXP(countsuv);
		AI_Output(self,other,"DIA_Lester_NW_Escape_01_04");	//Мне как видишь удалось! Однако не всем так повезло.
		if((COUNTCAPTURED > 0) && (COUNTKILLERS == 0))
		{
			AI_Output(self,other,"DIA_Lester_NW_Escape_01_05");	//Многих из нас орки взяли в плен...(печально) Что теперь они с ними сделают одному только Инносу известно!
			B_LogEntry(TOPIC_HELPCREW,"В лагере Братства я повстречался с Лестером - живым и здоровым. Это хорошая новость!");
			Log_AddEntry(TOPIC_HELPCREW,"Правда не обошлось и без плохих! Он рассказал мне о том, что многие парни были захвачены в плен орками во время прорыва через город. Надеюсь они еще живы!");
		}
		else if((COUNTCAPTURED > 0) && (COUNTKILLERS > 0))
		{
			AI_Output(self,other,"DIA_Lester_NW_Escape_01_06");	//Многих из нас орки взяли в плен...(печально) Есть и те, кто погиб сражаясь с ними!
			B_LogEntry(TOPIC_HELPCREW,"В лагере Братства я повстречался с Лестером - живым и здоровым. Это хорошая новость!");
			Log_AddEntry(TOPIC_HELPCREW,"Правда не обошлось и без плохих! Он рассказал мне о том, что многие парни были захвачены в плен орками во время прорыва через город. Есть и те, кто погиб.");
		};
		AI_Output(other,self,"DIA_Lester_NW_Escape_01_07");	//Да, это не очень хорошие новости.
		AI_Output(self,other,"DIA_Lester_NW_Escape_01_08");	//Теперь с этим ничего уже не поделаешь.
		AI_Output(other,self,"DIA_Lester_NW_Escape_01_09");	//Понимаю.
	}
	else if(COUNTSURVIVERS > 0)
	{
		B_GivePlayerXP(200);
		AI_Output(self,other,"DIA_Lester_NW_Escape_01_10");	//Как видишь! И насколько мне известно - это удалось всем, кто тогда был тогда на корабле.
		AI_Output(other,self,"DIA_Lester_NW_Escape_01_11");	//Да это просто отличные новости!
		AI_Output(self,other,"DIA_Lester_NW_Escape_01_12");	//Я с тобой согласен...(улыбаясь) Даже теперь и не знаю кого благодарить за столь чудесное спасение!
		B_LogEntry(TOPIC_HELPCREW,"В лагере Братства я повстречался с Лестером - живым и здоровым. Это хорошая новость! Как и то, что всем остальным парням удалось также выбраться из города.");
	};
	MIS_HELPCREW = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_HELPCREW,LOG_SUCCESS);
};


instance DIA_LESTER_NW_SOONBATTLE(C_Info)
{
	npc = PC_Psionic;
	nr = 1;
	condition = dia_lester_nw_soonbattle_condition;
	information = dia_lester_nw_soonbattle_info;
	permanent = FALSE;
	description = "Как дела в лагере?";
};


func int dia_lester_nw_soonbattle_condition()
{
	if((MIS_HELPCREW == LOG_SUCCESS) && (STOPBIGBATTLE == FALSE))
	{
		return TRUE;
	};
};

func void dia_lester_nw_soonbattle_info()
{
	AI_Output(other,self,"DIA_Lester_NW_SoonBattle_01_00");	//Как дела в лагере?
	AI_Output(self,other,"DIA_Lester_NW_SoonBattle_01_01");	//Вроде нормально...(спокойно) Хотя все только и говорят, что об орках!
	AI_Output(other,self,"DIA_Lester_NW_SoonBattle_01_03");	//А они уже пытались вас атаковать?!
	AI_Output(self,other,"DIA_Lester_NW_SoonBattle_01_04");	//Нет! Даже близко не подходили.
	AI_Output(self,other,"DIA_Lester_NW_SoonBattle_01_05");	//По всей видимости, главной их целью был все-таки сам город. А до нас им пока и дела нет!
};


instance DIA_LESTER_NW_SOONBATTLENOW(C_Info)
{
	npc = PC_Psionic;
	nr = 1;
	condition = dia_lester_nw_soonbattlenow_condition;
	information = dia_lester_nw_soonbattlenow_info;
	permanent = FALSE;
	description = "Ты пойдешь сражаться с орками?";
};


func int dia_lester_nw_soonbattlenow_condition()
{
	if((KAPITELORCATC == TRUE) && (TPL_JOINHAGEN == TRUE) && (STOPBIGBATTLE == FALSE))
	{
		return TRUE;
	};
};

func void dia_lester_nw_soonbattlenow_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Lester_NW_SoonBattleNow_01_00");	//Ты пойдешь сражаться с орками?
	AI_Output(self,other,"DIA_Lester_NW_SoonBattleNow_01_01");	//Конечно...(улыбаясь) Куда же я денусь! Ведь теперь это и наша война тоже.
	AI_Output(self,other,"DIA_Lester_NW_SoonBattleNow_01_02");	//Ко всему прочему, наверняка многие из моих друзей также будут принимать во всем этом участие.
	AI_Output(self,other,"DIA_Lester_NW_SoonBattleNow_01_03");	//А это может означать только лишь одно - мое место рядом с ними!
	AI_Output(other,self,"DIA_Lester_NW_SoonBattleNow_01_05");	//Рад это слышать.
};


instance DIA_LESTER_NW_BATTLEWIN(C_Info)
{
	npc = PC_Psionic;
	nr = 1;
	condition = dia_lester_nw_battlewin_condition;
	information = dia_lester_nw_battlewin_info;
	permanent = FALSE;
	description = "Сражение осталось за нами!";
};


func int dia_lester_nw_battlewin_condition()
{
	if((STOPBIGBATTLE == TRUE) && (HUMANSWINSBB == TRUE) && (ALLGREATVICTORY == FALSE))
	{
		return TRUE;
	};
};

func void dia_lester_nw_battlewin_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Lester_NW_BattleWin_01_00");	//Сражение осталось за нами!
	AI_Output(self,other,"DIA_Lester_NW_BattleWin_01_01");	//Да, мы преподали оркам хороший урок...(довольно) Так что, теперь они навряд ли сюда больше сунутся!
	if(HORINISISFREE == FALSE)
	{
		AI_Output(self,other,"DIA_Lester_NW_BattleWin_01_02");	//Однако не стоит слишком переоценивать значимость этой победы.
		AI_Output(self,other,"DIA_Lester_NW_BattleWin_01_03");	//Наш враг все еще достаточно силен и наверняка попробует изменить теперешнюю ситуацию в свою пользу.
		AI_Output(other,self,"DIA_Lester_NW_BattleWin_01_04");	//Тогда надо остановить его!
		AI_Output(self,other,"DIA_Lester_NW_BattleWin_01_05");	//Само собой...(спокойно) Но слишком спешить с этим, думаю тоже не стоит! Ведь неизвестно, как все еще сложится.
	};
};


instance DIA_LESTER_NW_GOONORKSHUNT(C_Info)
{
	npc = PC_Psionic;
	nr = 1;
	condition = dia_lester_nw_goonorkshunt_condition;
	information = dia_lester_nw_goonorkshunt_info;
	permanent = FALSE;
	description = "Лорд Хаген дал мне поручение.";
};


func int dia_lester_nw_goonorkshunt_condition()
{
	if((HAGENGIVEHELP == TRUE) && (ALLGREATVICTORY == FALSE) && (LESTERTOBIGLAND == FALSE) && (ALLDISMISSFROMHUNT == FALSE) && Npc_KnowsInfo(hero,dia_lester_nw_battlewin))
	{
		return TRUE;
	};
};

func void dia_lester_nw_goonorkshunt_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Lester_NW_GoOnOrksHunt_01_00");	//Лорд Хаген дал мне поручение.
	AI_Output(self,other,"DIA_Lester_NW_GoOnOrksHunt_01_01");	//И в чем оно заключается?...(серьезно)
	AI_Output(other,self,"DIA_Lester_NW_GoOnOrksHunt_01_02");	//Дело касается орков! Надо прикончить парочку этих тварей, чтобы другим было неповадно совать сюда свой нос.
	AI_Output(self,other,"DIA_Lester_NW_GoOnOrksHunt_01_03");	//Это будет не просто! Тебе понадобится помощь.
	AI_Output(other,self,"DIA_Lester_NW_GoOnOrksHunt_01_04");	//Как раз об этом, я и хотел тебя спросить.
	AI_Output(self,other,"DIA_Lester_NW_GoOnOrksHunt_01_05");	//Ну, что касается меня...(задумчиво) То я всегда готов помочь старому другу!
	AI_Output(self,other,"DIA_Lester_NW_GoOnOrksHunt_01_06");	//Только скажи, когда мы выступаем. И я с радостью помогу тебе в этом!
	LESTERJOINMEHUNT = TRUE;
};


instance DIA_LESTER_NW_FOLLOWME(C_Info)
{
	npc = PC_Psionic;
	nr = 1;
	condition = dia_lester_nw_followme_condition;
	information = dia_lester_nw_followme_info;
	permanent = TRUE;
	description = "Иди за мной!";
};


func int dia_lester_nw_followme_condition()
{
	if((LESTERJOINMEHUNT == TRUE) && (self.aivar[AIV_PARTYMEMBER] == FALSE) && (ALLDISMISSFROMHUNT == FALSE) && (LESTERTOBIGLAND == FALSE))
	{
		return TRUE;
	};
};

func void dia_lester_nw_followme_info()
{
	AI_Output(other,self,"DIA_Lester_NW_FollowMe_01_00");	//Иди за мной!
	AI_Output(self,other,"DIA_Lester_NW_FollowMe_01_01");	//Да! Покажем этим тварям.
	Npc_ExchangeRoutine(self,"Follow");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_LESTER_NW_STOPHERE(C_Info)
{
	npc = PC_Psionic;
	nr = 1;
	condition = dia_lester_nw_stophere_condition;
	information = dia_lester_nw_stophere_info;
	permanent = TRUE;
	description = "Жди тут!";
};


func int dia_lester_nw_stophere_condition()
{
	if((LESTERJOINMEHUNT == TRUE) && (self.aivar[AIV_PARTYMEMBER] == TRUE) && (ALLDISMISSFROMHUNT == FALSE) && (LESTERTOBIGLAND == FALSE))
	{
		return TRUE;
	};
};

func void dia_lester_nw_stophere_info()
{
	AI_Output(other,self,"DIA_Lester_NW_StopHere_01_00");	//Жди тут!
	AI_Output(self,other,"DIA_Lester_NW_StopHere_01_01");	//Как скажешь! Хотя мне кажется, что отдыхать пока рановато.
	Npc_ExchangeRoutine(self,"CampOn");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	AI_StopProcessInfos(self);
};


instance DIA_LESTER_NW_ALLGREATVICTORY(C_Info)
{
	npc = PC_Psionic;
	nr = 1;
	condition = dia_lester_nw_allgreatvictory_condition;
	information = dia_lester_nw_allgreatvictory_info;
	permanent = FALSE;
	description = "Как дела?";
};


func int dia_lester_nw_allgreatvictory_condition()
{
	if(ALLGREATVICTORY == TRUE)
	{
		return TRUE;
	};
};

func void dia_lester_nw_allgreatvictory_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Lester_NW_AllGreatVictory_01_00");	//Как дела?
	AI_Output(self,other,"DIA_Lester_NW_AllGreatVictory_01_01");	//Орков вокруг больше нет, а это уже неплохо!
	AI_Output(self,other,"DIA_Lester_NW_AllGreatVictory_01_02");	//Все вокруг начинает потихоньку возвращаться на свои места и в скором времени, никто даже и не вспомнит о том, что здесь произошло.
};


instance DIA_LESTER_NW_WHATDONOW(C_Info)
{
	npc = PC_Psionic;
	nr = 1;
	condition = dia_lester_nw_whatdonow_condition;
	information = dia_lester_nw_whatdonow_info;
	permanent = FALSE;
	description = "Чем займешься?";
};


func int dia_lester_nw_whatdonow_condition()
{
	if((ALLGREATVICTORY == TRUE) && (LESTERTOBIGLAND == FALSE))
	{
		return TRUE;
	};
};

func void dia_lester_nw_whatdonow_info()
{
	AI_Output(other,self,"DIA_Lester_NW_WhatDoNow_01_00");	//Чем займешься?
	AI_Output(self,other,"DIA_Lester_NW_WhatDoNow_01_01");	//Я пока останусь в лагере и буду помогать Идолу Орану...(уверенно)
	AI_Output(self,other,"DIA_Lester_NW_WhatDoNow_01_02");	//Ведь кто-то должен будет позаботиться о наших новых послушниках!
	AI_Output(self,other,"DIA_Lester_NW_WhatDoNow_01_03");	//К тому же в нем так тихо и спокойно, что лучшего места для жизни мне навряд ли удастся найти!
};


instance DIA_LESTER_NW_TRAVELONBIGLAND(C_Info)
{
	npc = PC_Psionic;
	nr = 1;
	condition = dia_lester_nw_travelonbigland_condition;
	information = dia_lester_nw_travelonbigland_info;
	permanent = FALSE;
	description = "У меня есть для тебя новость.";
};


func int dia_lester_nw_travelonbigland_condition()
{
	if(WHOTRAVELONBIGLAND == TRUE)
	{
		return TRUE;
	};
};

func void dia_lester_nw_travelonbigland_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Lester_NW_TravelOnBigLand_01_00");	//У меня есть для тебя новость.
	AI_Output(self,other,"DIA_Lester_NW_TravelOnBigLand_01_01");	//Интересно...(лукаво) Что же на этот раз ты задумал?!
	AI_Output(other,self,"DIA_Lester_NW_TravelOnBigLand_01_05");	//Я хотел предложить тебе отправиться вместе со мной на материк.
	AI_Output(self,other,"DIA_Lester_NW_TravelOnBigLand_01_06");	//Зачем?!
	AI_Output(other,self,"DIA_Lester_NW_TravelOnBigLand_01_07");	//У меня есть послание для короля! Поверь, это очень важно.
	AI_Output(self,other,"DIA_Lester_NW_TravelOnBigLand_01_08");	//Хммм...(задумчиво) Причина довольно серьезная! И тебе наверняка опять потребуется помощь твоих старых друзей.
	AI_Output(self,other,"DIA_Lester_NW_TravelOnBigLand_01_09");	//Так что, как мне не жаль расставаться со всей этой красотой, я собираюсь приянть твое предложение.
	AI_Output(other,self,"DIA_Lester_NW_TravelOnBigLand_01_11");	//Хорошо! Тогда я жду тебя на корабле.
	AI_Output(self,other,"DIA_Lester_NW_TravelOnBigLand_01_12");	//Я скоро буду там.
	COUNTTRAVELONBIGLAND = COUNTTRAVELONBIGLAND + 1;
	LESTERTOBIGLAND = TRUE;
	B_LogEntry(TOPIC_SALETOBIGLAND,"Лестер поплывет со мной на материк! Полагаю, что он просто не может себе позволить отпустить меня туда одного.");
	Npc_ExchangeRoutine(self,"SHIP");
	AI_StopProcessInfos(self);
};

