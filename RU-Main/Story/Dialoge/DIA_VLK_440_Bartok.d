
instance DIA_Bartok_EXIT(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 999;
	condition = DIA_Bartok_EXIT_Condition;
	information = DIA_Bartok_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bartok_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Bartok_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Bartok_Hallo(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 1;
	condition = DIA_Bartok_Hallo_Condition;
	information = DIA_Bartok_Hallo_Info;
	permanent = FALSE;
	description = "Как дела?";
};


func int DIA_Bartok_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Bartok_Hallo_Info()
{
	AI_Output(other,self,"DIA_Bartok_Hello_15_00");	//Как дела?
	AI_Output(self,other,"DIA_Bartok_Hello_04_01");	//Ты ведь нездешний, да? Ничего - я тоже.
	AI_Output(other,self,"DIA_Bartok_Hello_15_02");	//А откуда ты пришел?
	AI_Output(self,other,"DIA_Bartok_Hello_04_03");	//Из леса! Там я охотился на падальщиков и волков вместе с другими охотниками.
	AI_Output(self,other,"DIA_Bartok_Hello_04_04");	//Но я бросил это занятие! Настали опасные времена. И повсюду шатается всякий сброд...
};


instance DIA_Bartok_Jaeger(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 2;
	condition = DIA_Bartok_Jaeger_Condition;
	information = DIA_Bartok_Jaeger_Info;
	permanent = FALSE;
	description = "Где мне найти других охотников?";
};

func int DIA_Bartok_Jaeger_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bartok_Hallo) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Bartok_Jaeger_Info()
{
	AI_Output(other,self,"DIA_Bartok_Jager_15_00");	//Где я могу найти других охотников?
	AI_Output(self,other,"DIA_Bartok_Jager_01_01");	//Здесь, в городе, ты их точно не найдешь. Тут из всех охотников - только я, да мой друг Трокар.
	AI_Output(self,other,"DIA_Bartok_Jager_01_02");	//Остальные ушли в лагерь, что находится рядом с фермой Онара. Где-то примерно на полпути от таверны 'Мертвая Гарпия'.
	AI_Output(other,self,"DIA_Bartok_Jager_01_03");	//А что это за лагерь?
	AI_Output(self,other,"DIA_Bartok_Jager_01_04");	//Его называют лагерем Вольных Охотников.
	AI_Output(other,self,"DIA_Bartok_Jager_01_05");	//И как тебе?
	AI_Output(self,other,"DIA_Bartok_Jager_01_06");	//По правде говоря, хорошее место, если хочешь стать охотником. И не только...
	AI_Output(other,self,"DIA_Bartok_Jager_01_07");	//Тогда надо бы тоже при случае наведаться туда.
	AI_Output(self,other,"DIA_Bartok_Jager_01_08");	//Что же, юноша, попробуй. Быть может, ты даже станешь одним из них.
	AI_Output(self,other,"DIA_Bartok_Jager_01_09");	//Поверь мне, у тех ребят в лагере ты сможешь многому научиться.
	AI_Output(other,self,"DIA_Bartok_Jager_01_10");	//А что мне для этого нужно сделать?
	AI_Output(self,other,"DIA_Bartok_Jager_01_11");	//(задумчиво) Ну, не знаю! Так сходу и не скажешь.
	AI_Output(self,other,"DIA_Bartok_Jager_01_12");	//Думаю, сперва тебе стоит раздобыть какой-нибудь охотничий доспех.
	AI_Output(self,other,"DIA_Bartok_Jager_01_13");	//А в этом тряпье парни примут тебя за обычного оборванца.
	AI_Output(self,other,"DIA_Bartok_Jager_01_14");	//И никто из них даже не станет с тобой разговаривать.
	AI_Output(other,self,"DIA_Bartok_Jager_01_15");	//И где же мне раздобыть такой доспех?
	AI_Output(self,other,"DIA_Bartok_Jager_01_16");	//Я знаю только одно такое место - у торговца Боспера. Только у него есть доспехи охотника.
	AI_Output(self,other,"DIA_Bartok_Jager_01_17");	//Правда для того, чтобы он дал их тебе, придется поступить к нему в ученики.
	AI_Output(self,other,"DIA_Bartok_Jager_01_18");	//Просто так и неизвестно кому он свои доспехи не раздает.
	AI_Output(self,other,"DIA_Bartok_Jager_01_19");	//А как поступишь в ученики - считай, доспехи у тебя в руках. Кстати, свои я получил таким же образом.
	AI_Output(self,other,"DIA_Bartok_Jager_01_20");	//Но как теперь поступать, решать тебе.
};


instance DIA_Addon_Bartok_MissingPeople(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 5;
	condition = DIA_Addon_Bartok_MissingPeople_Condition;
	information = DIA_Addon_Bartok_MissingPeople_Info;
	description = "А где Трокар сейчас?";
};

func int DIA_Addon_Bartok_MissingPeople_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bartok_Jaeger) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Bartok_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Bartok_MissingPeople_15_00");	//А где Трокар сейчас?
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_04_01");	//Это очень необычная история.
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_04_02");	//Несколько дней назад мы выпивали в таверне Корагона и разговаривали об охоте.
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_04_03");	//Не спрашивай меня, что было дальше. К тому времени я уже изрядно накачался.
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_04_04");	//Я помню как Трокар говорил что-то о том, что собирается добыть несколько косяков из болотной травы. С тех пор я его не видел.
	MIS_Bartok_MissingTrokar = LOG_Running;
	Info_ClearChoices(DIA_Addon_Bartok_MissingPeople);
	Info_AddChoice(DIA_Addon_Bartok_MissingPeople,"А ты не искал его?",DIA_Addon_Bartok_MissingPeople_such);
	Info_AddChoice(DIA_Addon_Bartok_MissingPeople,"А где можно найти косяк из болотной травы?",DIA_Addon_Bartok_MissingPeople_wo);
};

func void DIA_Addon_Bartok_MissingPeople_wo()
{
	AI_Output(other,self,"DIA_Addon_Bartok_MissingPeople_wo_15_00");	//А где можно найти косяк из болотной травы?
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_wo_04_01");	//Здесь, в порту. По крайней мере, мне так говорили.
};

func void DIA_Addon_Bartok_MissingPeople_such()
{
	AI_Output(other,self,"DIA_Addon_Bartok_MissingPeople_such_15_00");	//Ты его искал?
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_such_04_01");	//Нет! Но я сообщил об этом ополчению.
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_such_04_02");	//Они его пока не нашли.
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_such_04_03");	//Надеюсь, его не сожрали волки или еще кто-нибудь похуже.
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_such_04_04");	//Я боюсь, что однажды на охоте я найду его изуродованный труп.
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_such_04_05");	//Я этого не вынесу!
	MIS_TROKARMISS = LOG_Running;
	Log_CreateTopic(TOPIC_TROKARMISS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TROKARMISS,LOG_Running);
	B_LogEntry(TOPIC_TROKARMISS,"У охотника Бартока пропал друг по имени Трокар. Парень сильно переживает по этому поводу. Он даже сообщил об исчезновении городскому ополчению, но их поиски так ничего и не дали.");
	Wld_InsertNpc(vlk_6138_trokar,"NW_FOREST_PATH_04_16_MONSTER2");
	B_KillNpc(vlk_6138_trokar);
	Wld_InsertNpc(orcwarrior2,"FP_ROAM_NW_FOREST_PATH_04_16_MONSTER2_02");
	Wld_InsertNpc(orcwarrior2,"FP_ROAM_NW_FOREST_PATH_04_16_MONSTER2_03");
	Wld_InsertNpc(orcwarrior3,"FP_ROAM_NW_FOREST_PATH_04_16_MONSTER2_04");
};

instance DIA_ADDON_BARTOK_FINDTROKAR(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 1;
	condition = dia_addon_bartok_findtrokar_condition;
	information = dia_addon_bartok_findtrokar_info;
	permanent = FALSE;
	description = "У меня для тебя плохие новости.";
};

func int dia_addon_bartok_findtrokar_condition()
{
	if((MIS_TROKARMISS == LOG_Running) && (Npc_HasItems(hero,itri_trokarring) >= 1))
	{
		return TRUE;
	};
};

func void dia_addon_bartok_findtrokar_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Addon_Bartok_FindTrokar_01_00");	//У меня для тебя плохие новости.
	AI_Output(self,other,"DIA_Addon_Bartok_FindTrokar_01_01");	//(взволнованно) То есть? Что произошло?
	AI_Output(other,self,"DIA_Addon_Bartok_FindTrokar_01_02");	//Очень не хочу тебя расстраивать, но, боюсь, что твой друг Трокар больше никогда к тебе не вернется.
	AI_Output(self,other,"DIA_Addon_Bartok_FindTrokar_01_03");	//Но почему?
	AI_Output(other,self,"DIA_Addon_Bartok_FindTrokar_01_04");	//Просто дело в том, что... он погиб.
	AI_Output(self,other,"DIA_Addon_Bartok_FindTrokar_01_05");	//Погиб? О, нет! Этого просто не может быть!
	AI_Output(self,other,"DIA_Addon_Bartok_FindTrokar_01_06");	//Но как это могло случиться?
	AI_Output(other,self,"DIA_Addon_Bartok_FindTrokar_01_07");	//Я обнаружил его тело в лесу неподалеку от фермы Акила.
	AI_Output(other,self,"DIA_Addon_Bartok_FindTrokar_01_08");	//Скорее всего, во время своей охоты он наткнулся на небольшой отряд орков, и те попросту разорвали его на куски.
	AI_Output(self,other,"DIA_Addon_Bartok_FindTrokar_01_09");	//Но... Но, может быть, ты ошибся? Может, это был вовсе не Трокар?
	AI_Output(other,self,"DIA_Addon_Bartok_FindTrokar_01_10");	//Сомнений быть не может. При нем было вот это кольцо.
	B_GiveInvItems(other,self,itri_trokarring,1);
	Npc_RemoveInvItems(self,itri_trokarring,1);
	AI_Output(self,other,"DIA_Addon_Bartok_FindTrokar_01_11");	//Да, это действительно его вещь. (обреченно) Выходит, это правда - мой единственный друг Трокар мертв!
	AI_Output(other,self,"DIA_Addon_Bartok_FindTrokar_01_12");	//Мне очень жаль.
	AI_Output(self,other,"DIA_Addon_Bartok_FindTrokar_01_13");	//Эх, ладно...(обреченно) Теперь уже ничего не поделаешь. Значит, такова его судьба.
	AI_Output(self,other,"DIA_Addon_Bartok_FindTrokar_01_14");	//В любом случае - спасибо, что принес мне его кольцо. Я, пожалуй, сохраню его, как память о старом добром друге.
	AI_Output(self,other,"DIA_Addon_Bartok_FindTrokar_01_15");	//Теперь он всегда будет со мной. Хотя, конечно, это вряд ли меня успокоит.
	MIS_TROKARMISS = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_TROKARMISS,LOG_SUCCESS);
	B_LogEntry(TOPIC_TROKARMISS,"Я сообщил Бартоку о смерти его друга Трокара.");
};


instance DIA_Bartok_Bosper(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 3;
	condition = DIA_Bartok_Bosper_Condition;
	information = DIA_Bartok_Bosper_Info;
	permanent = FALSE;
	description = "Боспер говорит, что ты работал на него...";
};


func int DIA_Bartok_Bosper_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bosper_Bartok) && Npc_KnowsInfo(other,DIA_Bartok_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Bartok_Bosper_Info()
{
	AI_Output(other,self,"DIA_Bartok_Bosper_15_00");	//Боспер говорит, что ты работал на него...
	AI_Output(self,other,"DIA_Bartok_Bosper_04_01");	//Да, было дело. Но его интересовали только эти чертовы шкуры.
	AI_Output(self,other,"DIA_Bartok_Bosper_04_02");	//Я говорил ему, как опасно стало охотиться. Но он не хотел ничего слушать.
	AI_Output(self,other,"DIA_Bartok_Bosper_04_03");	//Правда, платил он хорошо - грех жаловаться.
	AI_Output(other,self,"DIA_Bartok_Bosper_15_04");	//Ты можешь рассказать что-нибудь о нем?
	AI_Output(self,other,"DIA_Bartok_Bosper_04_05");	//(смеется) У Боспера недавно украли лук. Прямо средь бела дня.
	AI_Output(self,other,"DIA_Bartok_Bosper_04_06");	//Кто-то вломился в его лавку, схватил лук и был таков.
	AI_Output(self,other,"DIA_Bartok_Bosper_04_07");	//Воры наглеют прямо на глазах!

	if(MIS_Bosper_Bogen != LOG_SUCCESS)
	{
		MIS_Bosper_Bogen = LOG_Running;
	};
};

instance DIA_Bartok_WannaLearn(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 4;
	condition = DIA_Bartok_WannaLearn_Condition;
	information = DIA_Bartok_WannaLearn_Info;
	permanent = FALSE;
	description = "Ты можешь научить меня охотиться?";
};

func int DIA_Bartok_WannaLearn_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bartok_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Bartok_WannaLearn_Info()
{
	AI_Output(other,self,"DIA_Bartok_WannaLearn_15_00");	//Ты можешь научить меня охотиться?
	AI_Output(self,other,"DIA_Bartok_WannaLearn_04_01");	//Я могу научить тебя красться и правильно держать лук.
	AI_Output(self,other,"DIA_Bartok_WannaLearn_04_02");	//А также сдирать шкуры с убитых животных. Боспер научил меня и этому.
	Bartok_TeachPlayer = TRUE;
	Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_CityTeacher,"Барток может обучить меня красться, сдирать шкуры и стрелять из лука.");
};

instance DIA_Bartok_TeachFUR(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 900;
	condition = DIA_Bartok_TeachFUR_Condition;
	information = DIA_Bartok_TeachFUR_Info;
	permanent = TRUE;
	description = "Научи меня снимать шкуры с животных.";
};

func int DIA_Bartok_TeachFUR_Condition()
{
	if((Bartok_TeachPlayer == TRUE) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bartok_TeachFUR_Info()
{
	AI_Output(other,self,"DIA_Bosper_TeachFUR_15_00");	//Научи меня снимать шкуры с животных!
	Info_ClearChoices(DIA_Bartok_TeachFUR);
	Info_AddChoice(DIA_Bartok_TeachFUR,Dialog_Back,DIA_Bartok_TeachFUR_Back);
	Info_AddChoice(DIA_Bartok_TeachFUR,b_buildlearnstringforsmithhunt("Содрать шкуру",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Fur)),DIA_Bartok_TeachFUR_Do);
};

func void DIA_Bartok_TeachFUR_Back()
{
	Info_ClearChoices(DIA_Bartok_TeachFUR);
};

func void DIA_Bartok_TeachFUR_Do()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Fur))
	{
		AI_Output(self,other,"DIA_Bartok_TeachFUR_11_01");	//Хорошо. Слушай... это довольно просто.
		AI_Output(self,other,"DIA_Bartok_TeachFUR_11_02");	//Берешь острый нож и разрезаешь брюхо животного. Затем делаешь несколько небольших надрезов на внутренней стороне ног, и снимаешь шкуру.
	};

	Info_ClearChoices(DIA_Bartok_TeachFUR);
};

instance DIA_Bartok_TeachSneak(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 899;
	condition = DIA_Bartok_TeachSneak_Condition;
	information = DIA_Bartok_TeachSneak_Info;
	permanent = TRUE;
	description = "Научи меня красться.";
};

func int DIA_Bartok_TeachSneak_Condition()
{
	if((Bartok_TeachPlayer == TRUE) && (Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) == 0))
	{
		return TRUE;
	};
};

func void DIA_Bartok_TeachSneak_Info()
{
	AI_Output(other,self,"DIA_Bartok_TeachSneak_15_00");	//Научи меня красться.
	Info_ClearChoices(DIA_Bartok_TeachSneak);
	Info_AddChoice(DIA_Bartok_TeachSneak,Dialog_Back,DIA_Bartok_TeachSneak_Back);
	Info_AddChoice(DIA_Bartok_TeachSneak,b_buildlearnstringforthief("Подкрадывание",B_GetLearnCostTalent(other,NPC_TALENT_SNEAK,1)),DIA_Bartok_TeachSneak_SNEAK);
};

func void DIA_Bartok_TeachSneak_Back()
{
	Info_ClearChoices(DIA_Bartok_TeachSneak);
};

func void DIA_Bartok_TeachSneak_SNEAK()
{
	if(B_TeachThiefTalent(self,other,NPC_TALENT_SNEAK))
	{
		AI_Output(self,other,"DIA_Bartok_TeachSneak_04_01");	//Хорошо - сначала ты должен научиться правильно распределять свой вес.
		AI_Output(self,other,"DIA_Bartok_TeachSneak_04_02");	//Для этого согни ноги в коленях и старайся всегда опускать ногу на пятку.
		AI_Output(self,other,"DIA_Bartok_TeachSneak_04_03");	//Все нагрузка должна приходиться на опорную ногу, пока другая нога не будет твердо стоять на земле.
		AI_Output(self,other,"DIA_Bartok_TeachSneak_04_04");	//К большинству зверей невозможно подкрасться, если только они не спят. Они просто учуют тебя.
		AI_Output(self,other,"DIA_Bartok_TeachSneak_04_05");	//Так что будь внимателен при охоте.
	};

	Info_ClearChoices(DIA_Bartok_TeachSneak);
};

var int Bosper_MerkeBow;

instance DIA_Bartok_Teach(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 4;
	condition = DIA_Bartok_Teach_Condition;
	information = DIA_Bartok_Teach_Info;
	permanent = TRUE;
	description = "Я хочу научиться лучше стрелять из лука!";
};

func int DIA_Bartok_Teach_Condition()
{
	if(Bartok_TeachPlayer == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Bartok_Teach_Info()
{
	AI_Output(other,self,"DIA_Bartok_TeachBow_15_00");	//Я хочу научиться лучше стрелять из лука!
	AI_Output(self,other,"DIA_Bartok_TeachBow_04_01");	//Хорошо, посмотрим, чему я могу тебя научить...
	Bosper_MerkeBow = other.HitChance[NPC_TALENT_BOW];
	Info_ClearChoices(DIA_Bartok_Teach);
	Info_AddChoice(DIA_Bartok_Teach,Dialog_Back,DIA_Bartok_Teach_Back);
	Info_AddChoice(DIA_Bartok_Teach,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_Bartok_Teach_BOW_1);
	Info_AddChoice(DIA_Bartok_Teach,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),DIA_Bartok_Teach_BOW_5);
};

func void DIA_Bartok_Teach_Back()
{
	if(other.HitChance[NPC_TALENT_BOW] >= 60)
	{
		AI_Output(self,other,"DIA_Bartok_TeachBow_BACK_04_00");	//Тебе лучше поискать кого-нибудь, кто знает больше, чем я.
	}
	else if(Bosper_MerkeBow < other.HitChance[NPC_TALENT_BOW])
	{
		AI_Output(self,other,"DIA_Bartok_TeachBow_BACK_04_01");	//Хорошо, ты стал стрелять значительно лучше.
	};
	Info_ClearChoices(DIA_Bartok_Teach);
};

func void DIA_Bartok_Teach_BOW_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,1,60);
	Info_ClearChoices(DIA_Bartok_Teach);
	Info_AddChoice(DIA_Bartok_Teach,Dialog_Back,DIA_Bartok_Teach_Back);
	Info_AddChoice(DIA_Bartok_Teach,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_Bartok_Teach_BOW_1);
	Info_AddChoice(DIA_Bartok_Teach,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),DIA_Bartok_Teach_BOW_5);
};

func void DIA_Bartok_Teach_BOW_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,5,60);
	Info_ClearChoices(DIA_Bartok_Teach);
	Info_AddChoice(DIA_Bartok_Teach,Dialog_Back,DIA_Bartok_Teach_Back);
	Info_AddChoice(DIA_Bartok_Teach,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_Bartok_Teach_BOW_1);
	Info_AddChoice(DIA_Bartok_Teach,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),DIA_Bartok_Teach_BOW_5);
};


var int Bartok_Bereit;
var int Bartok_Later;

instance DIA_Bartok_Zusammen(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 5;
	condition = DIA_Bartok_Zusammen_Condition;
	information = DIA_Bartok_Zusammen_Info;
	permanent = TRUE;
	description = "Почему бы нам не поохотиться вместе?";
};


func int DIA_Bartok_Zusammen_Condition()
{
	if((Bartok_Bereit == FALSE) && Npc_KnowsInfo(other,DIA_Bartok_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Bartok_Zusammen_Info()
{
	if(Bartok_Later == FALSE)
	{
		AI_Output(other,self,"DIA_Bartok_Zusammen_15_00");	//Почему бы нам не поохотиться вместе?
		AI_Output(self,other,"DIA_Bartok_Zusammen_04_01");	//Хммм... Вдвоем охотиться не так-то опасно, это точно!
		AI_Output(self,other,"DIA_Bartok_Zusammen_04_02");	//А что ты знаешь об охоте, а?
		AI_Output(self,other,"DIA_Bartok_Zusammen_04_03");	//Я имею в виду, ты знаешь, как снимать шкуры с животных?
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == TRUE)
	{
		if(Bartok_Later == TRUE)
		{
			AI_Output(self,other,"DIA_Bartok_HuntNOW_04_01");	//У тебя есть полсотни монет?
		}
		else
		{
			AI_Output(other,self,"DIA_Bartok_Zusammen_15_04");	//Да.
			AI_Output(self,other,"DIA_Bartok_Zusammen_04_05");	//Хорошо, я хочу получить пятьдесят золотых монет. А ты можешь забирать себе шкуры и продавать их Босперу.
			AI_Output(self,other,"DIA_Bartok_Zusammen_04_06");	//Это будет честно, правда?
		};
		Info_ClearChoices(DIA_Bartok_Zusammen);
		Info_AddChoice(DIA_Bartok_Zusammen,"Позже...",DIA_Bartok_Zusammen_Later);
		Info_AddChoice(DIA_Bartok_Zusammen,"Вот они...",DIA_Bartok_Zusammen_Pay);
	}
	else
	{
		AI_Output(other,self,"DIA_Bartok_Zusammen_15_07");	//Нет.
		AI_Output(self,other,"DIA_Bartok_Zusammen_04_08");	//Тогда овчинка выделки не стоит.
		AI_Output(self,other,"DIA_Bartok_Zusammen_04_09");	//Возвращайся, когда научишься чему-нибудь.
	};
};

func void DIA_Bartok_Zusammen_Later()
{
	AI_Output(other,self,"DIA_Bartok_HuntNOW_Later_15_00");	//Позже...
	Bartok_Later = TRUE;
	Info_ClearChoices(DIA_Bartok_Zusammen);
};

func void DIA_Bartok_Zusammen_Pay()
{
	Info_ClearChoices(DIA_Bartok_Zusammen);
	if(B_GiveInvItems(other,self,ItMi_Gold,50))
	{
		AI_Output(other,self,"DIA_Bartok_HuntNOW_GO_15_00");	//Вот, держи...
		Bartok_Bereit = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Bartok_HuntNOW_GO_04_03");	//Где? Не вижу! У тебя нет золота.
	};
};


var int Bartok_Los;

instance DIA_Bartok_HuntNOW(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 5;
	condition = DIA_Bartok_HuntNOW_Condition;
	information = DIA_Bartok_HuntNOW_Info;
	permanent = FALSE;
	description = "Пойдем охотиться!";
};


func int DIA_Bartok_HuntNOW_Condition()
{
	if(Bartok_Bereit == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Bartok_HuntNOW_Info()
{
	AI_Output(other,self,"DIA_Bartok_HuntNOW_15_00");	//Пойдем охотиться!
	AI_Output(self,other,"DIA_Bartok_HuntNOW_GO_04_01");	//Хорошо, пошли за мной. За южными воротами начинается лес. Там водится более чем достаточно всяких тварей.
	AI_Output(self,other,"DIA_Bartok_HuntNOW_GO_04_02");	//(себе под нос) Даже больше, чем хотелось бы...
	Bartok_Los = TRUE;
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"GUIDEMITTE");
	Wld_InsertNpc(Wolf,"NW_FARM1_CITYWALL_FOREST_02");
	Wld_InsertNpc(Wolf,"NW_FARM1_CITYWALL_FOREST_02");
	Wld_InsertNpc(Wolf,"NW_FARM1_CITYWALL_FOREST_02");
};


var int Bartok_OrkStillThere;

instance DIA_Bartok_ImWald(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 1;
	condition = DIA_Bartok_ImWald_Condition;
	information = DIA_Bartok_ImWald_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Bartok_ImWald_Condition()
{
	if((Bartok_Los == TRUE) && (Bartok_Ende == FALSE) && (Npc_GetDistToWP(self,"NW_FARM1_CITYWALL_FOREST_03") < 500))
	{
		return TRUE;
	};
};

func void DIA_Bartok_ImWald_Info()
{
	AI_Output(self,other,"DIA_Bartok_ImWald_04_00");	//Как ты думаешь, стоит нам углубиться в лес или нет?
	Info_ClearChoices(DIA_Bartok_ImWald);
	Info_AddChoice(DIA_Bartok_ImWald,"Пойдем назад!",DIA_Bartok_ImWald_NachHause);
	Info_AddChoice(DIA_Bartok_ImWald,"Стоит.",DIA_Bartok_ImWald_Weiter);
};

func void DIA_Bartok_ImWald_NachHause()
{
	AI_Output(other,self,"DIA_Bartok_ImWald_NachHause_15_00");	//Пойдем назад!
	AI_Output(self,other,"DIA_Bartok_ImWald_NachHause_04_01");	//Я тоже так думаю. А то мы так попадем прямо в объятия орка.
	Info_ClearChoices(DIA_Bartok_ImWald);
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;

	if(MIS_CoragonFixBeer == LOG_Success)
	{
		Npc_ExchangeRoutine(self,"Coragon");
	}
	else
	{
		Npc_ExchangeRoutine(self,"Start");
	};
};

func void DIA_Bartok_ImWald_Weiter()
{
	AI_Output(other,self,"DIA_Bartok_ImWald_Weiter_15_00");	//Стоит.
	AI_Output(self,other,"DIA_Bartok_ImWald_Weiter_04_01");	//Хорошо. (по себя) Будем надеяться, что нам повезет...

	if(OrcWarriorHaradIsDead == FALSE)
	{
		Bartok_OrkStillThere = TRUE;
	};

	Info_ClearChoices(DIA_Bartok_ImWald);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GUIDEENDE");
};

instance DIA_Bartok_Angekommen(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 1;
	condition = DIA_Bartok_Angekommen_Condition;
	information = DIA_Bartok_Angekommen_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Bartok_Angekommen_Condition()
{
	if((Bartok_Los == TRUE) && (Bartok_Ende == FALSE) && (Npc_GetDistToWP(self,"NW_FARM1_CITYWALL_FOREST_07") < 500))
	{
		return TRUE;
	};
};

func void DIA_Bartok_Angekommen_Info()
{
	AI_Output(self,other,"DIA_Bartok_Angekommen_04_00");	//Все! Я думаю, нам нужно вернуться в город.
	AI_Output(self,other,"DIA_Bartok_Angekommen_04_01");	//Здесь для меня слишком опасно! И даже для нас двоих.

	if(Bartok_OrkStillThere == TRUE)
	{
		B_Bartok_ShitAnOrc();
		Bartok_OrkGesagt = TRUE;
	};
	AI_Output(self,other,"DIA_Bartok_Angekommen_04_03");	//Еще увидимся!
	AI_Output(self,other,"DIA_Bartok_Angekommen_04_04");	//Ты можешь продать шкуры Босперу.
	Bartok_Ende = TRUE;
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;

	if(MIS_CoragonFixBeer == LOG_Success)
	{
		Npc_ExchangeRoutine(self,"Coragon");
	}
	else
	{
		Npc_ExchangeRoutine(self,"Start");
	};
};

var int BartokCanGoHuntCamp;

instance DIA_Bartok_PERM(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 1;
	condition = DIA_Bartok_PERM_Condition;
	information = DIA_Bartok_PERM_Info;
	permanent = TRUE;
	description = "Все в порядке?";
};

func int DIA_Bartok_PERM_Condition()
{
	if(Bartok_Los == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Bartok_PERM_Info()
{
	AI_Output(other,self,"DIA_Bartok_PERM_15_00");	//Все в порядке?

	if(BartokBecameHunt == TRUE)
	{
		AI_Output(self,other,"DIA_Bartok_PERM_04_03");	//Конечно. Давай прикончим еще парочку зверей!
	}
	else if(Bartok_Ende == TRUE)
	{
		AI_Output(self,other,"DIA_Bartok_PERM_04_01");	//Да. Но я больше не выйду из города. По крайней мере, в ближайшее время.

		if(Bartok_OrkGesagt == TRUE)
		{
			AI_Output(self,other,"DIA_Bartok_PERM_04_02");	//У меня все еще поджилки трясутся от одной мысли об этом орке.
		};
		
		BartokCanGoHuntCamp = TRUE;
		AI_StopProcessInfos(self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;

		if(MIS_CoragonFixBeer == LOG_Success)
		{
			Npc_ExchangeRoutine(self,"Coragon");
		}
		else
		{
			Npc_ExchangeRoutine(self,"Start");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Bartok_PERM_04_03");	//Конечно. Давай прикончим еще парочку зверей!
	};
};

instance DIA_Bartok_HuntCamp(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 1;
	condition = DIA_Bartok_HuntCamp_Condition;
	information = DIA_Bartok_HuntCamp_Info;
	permanent = FALSE;
	description = "Ты хочешь стать, наконец, настоящим охотником?";
};

func int DIA_Bartok_HuntCamp_Condition()
{
	if((MIS_NewHunters == LOG_Running) && (BartokCanGoHuntCamp == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Bartok_HuntCamp_Info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_Bartok_HuntCamp_01_00");	//Ты хочешь стать, наконец, настоящим охотником?
	AI_Output(self,other,"DIA_Bartok_HuntCamp_01_01");	//Интересно. А я кто, по-твоему?
	AI_Output(other,self,"DIA_Bartok_HuntCamp_01_02");	//Какой же ты охотник, если боишься даже нос высунуть из городских ворот.
	AI_Output(self,other,"DIA_Bartok_HuntCamp_01_03");	//Что? Я не боюсь! Просто... просто зачем рисковать понапрасну?
	AI_Output(other,self,"DIA_Bartok_HuntCamp_01_04");	//Тогда докажи это.
	AI_Output(self,other,"DIA_Bartok_HuntCamp_01_05");	//И что я, по-твоему, должен сделать?
	AI_Output(other,self,"DIA_Bartok_HuntCamp_01_06");	//Ну, например, присоединиться к другим охотникам, а не сидеть тут сложа руки.
	AI_Output(other,self,"DIA_Bartok_HuntCamp_01_07");	//Скажи, тебе ведь нравится охотиться?
	AI_Output(self,other,"DIA_Bartok_HuntCamp_01_08");	//Конечно. Считай, что это самое любимое мое занятие.
	AI_Output(other,self,"DIA_Bartok_HuntCamp_01_09");	//Тем более. А старшему охотнику Фальку как раз нужны новые люди.
	AI_Output(self,other,"DIA_Bartok_HuntCamp_01_11");	//Ох, а я и забыл про лагерь Вольных охотников.
	AI_Output(self,other,"DIA_Bartok_HuntCamp_01_12");	//Хммм... Во всяком случае, мне хотя бы не придется охотиться в одиночку.
	AI_Output(self,other,"DIA_Bartok_HuntCamp_01_13");	//Так ты говоришь, им нужны новые люди?
	AI_Output(other,self,"DIA_Bartok_HuntCamp_01_14");	//Если не веришь, можешь сам прямо сейчас отравиться к Фальку и спросить его.
	AI_Output(self,other,"DIA_Bartok_HuntCamp_01_15");	//Ну, если так, то, пожалуй, я действительно воспользуюсь твоим предложением.
	AI_Output(other,self,"DIA_Bartok_HuntCamp_01_16");	//Давай. И поспеши, пока кто-нибудь другой не занял твое место.
	B_LogEntry(TOPIC_NewHunters,"Я уговорил Бартока отправиться в лагерь охотников.");
	BartokBecameHunt = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GoHuntCamp");
};