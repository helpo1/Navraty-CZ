
instance DIA_Addon_Nefarius_EXIT(C_Info)
{
	npc = KDW_1402_Addon_Nefarius_NW;
	nr = 999;
	condition = DIA_Addon_Nefarius_EXIT_Condition;
	information = DIA_Addon_Nefarius_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Nefarius_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Nefarius_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Nefarius_Hallo(C_Info)
{
	npc = KDW_1402_Addon_Nefarius_NW;
	nr = 5;
	condition = DIA_Addon_Nefarius_Hallo_Condition;
	information = DIA_Addon_Nefarius_Hallo_Info;
	description = "Как дела?";
};


func int DIA_Addon_Nefarius_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Addon_Nefarius_Hallo_Info()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_Hallo_15_00");	//Как дела?
	AI_Output(self,other,"DIA_Addon_Nefarius_Hallo_05_01");	//А что ТЫ здесь делаешь? Вот это сюрприз!
	AI_Output(self,other,"DIA_Addon_Nefarius_Hallo_05_02");	//Я думал, ты погиб.
	AI_Output(other,self,"DIA_Addon_Nefarius_Hallo_15_03");	//Почти.
	AI_Output(self,other,"DIA_Addon_Nefarius_Hallo_05_04");	//Из-за тебя поднялся большой шум, ты знаешь об этом? Сатураса было не узнать - те события полностью вывели его из себя.
};


instance DIA_Addon_Nefarius_keineahnung(C_Info)
{
	npc = KDW_1402_Addon_Nefarius_NW;
	nr = 5;
	condition = DIA_Addon_Nefarius_keineahnung_Condition;
	information = DIA_Addon_Nefarius_keineahnung_Info;
	description = "Что это за портал?";
};


func int DIA_Addon_Nefarius_keineahnung_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Nefarius_Hallo))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Nefarius_keineahnung_Info()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_keineahnung_15_00");	//Что это за портал?
	AI_Output(self,other,"DIA_Addon_Nefarius_keineahnung_05_01");	//Мы считаем, что он ведет в затерянную долину, в которой находится город древней цивилизации.
	AI_Output(self,other,"DIA_Addon_Nefarius_keineahnung_05_02");	//Но пока за порталом находится лишь многометровая толща камня.
	AI_Output(self,other,"DIA_Addon_Nefarius_keineahnung_05_03");	//Никаких следов магии телепортации нам обнаружить не удалось. Очень загадочно...
};


instance DIA_Addon_Nefarius_WieMechanik(C_Info)
{
	npc = KDW_1402_Addon_Nefarius_NW;
	nr = 5;
	condition = DIA_Addon_Nefarius_WieMechanik_Condition;
	information = DIA_Addon_Nefarius_WieMechanik_Info;
	description = "Ты знаешь, как активировать портал?";
};


func int DIA_Addon_Nefarius_WieMechanik_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Nefarius_keineahnung))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Nefarius_WieMechanik_Info()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_WieMechanik_15_00");	//Ты знаешь, как активировать портал?
	AI_Output(self,other,"DIA_Addon_Nefarius_WieMechanik_05_01");	//Похоже, что пропавшие части орнамента складываются в ключ.
	AI_Output(self,other,"DIA_Addon_Nefarius_WieMechanik_05_03");	//Он-то и нужен нам, чтобы открыть портал.
	AI_Output(self,other,"DIA_Addon_Nefarius_WieMechanik_05_02");	//Ключ должен точно войти в кольцевидное углубление рядом с порталом.
};


instance DIA_Addon_Nefarius_SCbringOrnaments(C_Info)
{
	npc = KDW_1402_Addon_Nefarius_NW;
	nr = 5;
	condition = DIA_Addon_Nefarius_SCbringOrnaments_Condition;
	information = DIA_Addon_Nefarius_SCbringOrnaments_Info;
	description = "Я принес часть орнамента.";
};


func int DIA_Addon_Nefarius_SCbringOrnaments_Condition()
{
	if(MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Nefarius_SCbringOrnaments_Info()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_SCbringOrnaments_15_00");	//Я принес часть орнамента.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_01");	//Правда? Это замечательно.
	AI_Output(other,self,"DIA_Addon_Nefarius_SCbringOrnaments_15_02");	//Ты знаешь, где остальные части?
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_03");	//Если верить древним письменам, ключ был разделен на четыре части.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_04");	//Эти части все еще находятся на острове...
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_05");	//С помощью Мердариона мне удалось расшифровать некоторые надписи.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_06");	//Они указывают на места, где были спрятаны части орнамента.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_07");	//Эти места я отметил вот на этой карте.
	CreateInvItems(self,itwr_map_newworld_ornaments_addon_1,1);
	B_GiveInvItems(self,other,itwr_map_newworld_ornaments_addon_1,1);
	MIS_Addon_Nefarius_BringMissingOrnaments = LOG_Running;
	Log_CreateTopic(TOPIC_Addon_Ornament,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Ornament,LOG_Running);
	B_LogEntry(TOPIC_Addon_Ornament,"Маги воды нашли портал, который ведет в неизвестную часть Хориниса.");
	B_LogEntry(TOPIC_Addon_Ornament,"Нефариус хочет активировать портал при помощи украшенного кольца. Ему все еще не хватает трех частей этого кольца. Я должен найти их. Он дал мне карту, на которой отмечены места, где я должен искать фрагменты.");
	B_StartOtherRoutine(BAU_4300_Addon_Cavalorn,"OrnamentSteinring");
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_08");	//Ты должен искать части ключа именно там.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_09");	//Обращай внимание на древние постройки. Они могут быть полуразрушенными, но все же легко узнаваемыми.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_10");	//Это может быть что угодно: валун, круг камней, мавзолей или что-нибудь подобное.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_11");	//Но к чему эта болтовня? Ты сам все увидишь. Удачи!
};


instance DIA_Addon_Nefarius_WhyPortalClosed(C_Info)
{
	npc = KDW_1402_Addon_Nefarius_NW;
	nr = 5;
	condition = DIA_Addon_Nefarius_WhyPortalClosed_Condition;
	information = DIA_Addon_Nefarius_WhyPortalClosed_Info;
	description = "Для чего орнамент был разбит?";
};


func int DIA_Addon_Nefarius_WhyPortalClosed_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Nefarius_SCbringOrnaments))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Nefarius_WhyPortalClosed_Info()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_WhyPortalClosed_15_00");	//Для чего орнамент был разбит?
	AI_Output(self,other,"DIA_Addon_Nefarius_WhyPortalClosed_05_01");	//Тот, кто сделал это, не хотел, чтобы портал открыли снова.
	AI_Output(self,other,"DIA_Addon_Nefarius_WhyPortalClosed_05_02");	//Чем больше я изучаю эти надписи, тем больше убеждаюсь, что жрецы этой цивилизации не были дураками.
	AI_Output(self,other,"DIA_Addon_Nefarius_WhyPortalClosed_05_03");	//У них были веские причины закрыть доступ в свою долину.
	AI_Output(self,other,"DIA_Addon_Nefarius_WhyPortalClosed_05_04");	//Мы не знаем, что нас там ждет, но ничем хорошим это точно не окажется...
};


instance DIA_Addon_Nefarius_MissingOrnaments(C_Info)
{
	npc = KDW_1402_Addon_Nefarius_NW;
	nr = 5;
	condition = DIA_Addon_Nefarius_MissingOrnaments_Condition;
	information = DIA_Addon_Nefarius_MissingOrnaments_Info;
	permanent = TRUE;
	description = "Насчет пропавших фрагментов...";
};


func int DIA_Addon_Nefarius_MissingOrnaments_Condition()
{
	if(MIS_Addon_Nefarius_BringMissingOrnaments == LOG_Running)
	{
		return TRUE;
	};
	return FALSE;
};


var int MissingOrnamentsCounter;
const int Addon_NefariussMissingOrnamentsOffer = 100;

func void DIA_Addon_Nefarius_MissingOrnaments_Info()
{
	var int MissingOrnamentsCount;
	var int XP_Addon_BringMissingOrnaments;
	var int MissingOrnamentsGeld;
	var string concatText;
	AI_Output(other,self,"DIA_Addon_Nefarius_MissingOrnaments_15_00");	//Насчет пропавших фрагментов...
	AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_01");	//Да?
	if(Npc_HasItems(other,ItMi_Ornament_Addon) >= 1)
	{
		MissingOrnamentsCount = Npc_HasItems(other,ItMi_Ornament_Addon);
		if(MissingOrnamentsCount == 1)
		{
			AI_Output(other,self,"DIA_Addon_Nefarius_MissingOrnaments_15_02");	//Я нашел еще один.
			B_GivePlayerXP(XP_Addon_BringMissingOrnament);
			Npc_RemoveInvItems(other,ItMi_Ornament_Addon,1);
			AI_Print(b_formgivestring(other,1));
			MissingOrnamentsCounter = MissingOrnamentsCounter + 1;
		}
		else
		{
			AI_Output(other,self,"DIA_Addon_Nefarius_MissingOrnaments_15_03");	//Я нашел их.
			Npc_RemoveInvItems(other,ItMi_Ornament_Addon,MissingOrnamentsCount);
			concatText = b_formgivestring(other,MissingOrnamentsCount);
			AI_Print(concatText);
			XP_Addon_BringMissingOrnaments = MissingOrnamentsCount * XP_Addon_BringMissingOrnament;
			MissingOrnamentsCounter = MissingOrnamentsCounter + MissingOrnamentsCount;
			B_GivePlayerXP(XP_Addon_BringMissingOrnaments);
		};
		AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_04");	//Отлично!
		if(MissingOrnamentsCounter == 1)
		{
			AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_05");	//Осталось найти еще два. Думаю, ты справишься.
		}
		else if(MissingOrnamentsCounter == 2)
		{
			AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_06");	//Найди еще один, и они будут у нас все.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_07");	//Теперь у нас есть все части. Осталось их собрать.
			AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_08");	//Мы используем наши объединенные силы, чтобы сделать из фрагментов кольцо.
			MIS_Addon_Nefarius_BringMissingOrnaments = LOG_SUCCESS;
		};
		AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_09");	//Вот, возьми в награду это золото.
		MissingOrnamentsGeld = MissingOrnamentsCount * Addon_NefariussMissingOrnamentsOffer;
		CreateInvItems(self,ItMi_Gold,MissingOrnamentsGeld);
		B_GiveInvItems(self,other,ItMi_Gold,MissingOrnamentsGeld);
		if(MIS_Addon_Nefarius_BringMissingOrnaments == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_10");	//Следуй за мной!
			AI_StopProcessInfos(self);
			Npc_ExchangeRoutine(self,"PreRingritual");
			B_StartOtherRoutine(KDW_1400_Addon_Saturas_NW,"PreRingritual");
			B_StartOtherRoutine(KDW_1401_Addon_Cronos_NW,"PreRingritual");
			B_StartOtherRoutine(KDW_1403_Addon_Myxir_NW,"PreRingritual");
			B_StartOtherRoutine(KDW_1404_Addon_Riordian_NW,"PreRingritual");
			B_StartOtherRoutine(KDW_1405_Addon_Merdarion_NW,"PreRingritual");
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Nefarius_MissingOrnaments_15_11");	//Напомни, сколько всего фрагментов?
		AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_12");	//Четыре...
		AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_13");	//Ты найдешь оставшиеся фрагменты в местах, которые я отметил на карте.
	};
};


instance DIA_Addon_Nefarius_Ringritual(C_Info)
{
	npc = KDW_1402_Addon_Nefarius_NW;
	nr = 5;
	condition = DIA_Addon_Nefarius_Ringritual_Condition;
	information = DIA_Addon_Nefarius_Ringritual_Info;
	important = TRUE;
};


func int DIA_Addon_Nefarius_Ringritual_Condition()
{
	if((MIS_Addon_Nefarius_BringMissingOrnaments == LOG_SUCCESS) && (Npc_GetDistToWP(self,"NW_TROLLAREA_PORTALTEMPEL_42") < 1000))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Nefarius_Ringritual_Info()
{
	AI_Output(self,other,"DIA_Addon_Nefarius_Ringritual_05_00");	//А теперь отойди назад.
	Npc_SetRefuseTalk(self,60);
	RitualRingRuns = LOG_Running;
	B_LogEntry(TOPIC_Addon_Ornament,"Я принес все части кольца Нефариусу. Теперь маги воды смогут собрать кольцо.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Ringritual");
	B_StartOtherRoutine(KDW_1400_Addon_Saturas_NW,"Ringritual");
	B_StartOtherRoutine(KDW_1401_Addon_Cronos_NW,"Ringritual");
	B_StartOtherRoutine(KDW_1403_Addon_Myxir_NW,"Ringritual");
	B_StartOtherRoutine(KDW_1404_Addon_Riordian_NW,"Ringritual");
	B_StartOtherRoutine(KDW_1405_Addon_Merdarion_NW,"Ringritual");
};


instance DIA_Addon_Nefarius_RingRitualEnds(C_Info)
{
	npc = KDW_1402_Addon_Nefarius_NW;
	nr = 5;
	condition = DIA_Addon_Nefarius_RingRitualEnds_Condition;
	information = DIA_Addon_Nefarius_RingRitualEnds_Info;
	important = TRUE;
};


func int DIA_Addon_Nefarius_RingRitualEnds_Condition()
{
	if((Npc_RefuseTalk(self) == FALSE) && (RitualRingRuns == LOG_Running))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Nefarius_RingRitualEnds_Info()
{
	AI_Output(self,other,"DIA_Addon_Nefarius_RingRitualEnds_05_00");	//Орнамент снова собран.
	AI_Output(self,other,"DIA_Addon_Nefarius_RingRitualEnds_05_01");	//Ты принес нам недостающие фрагменты, поэтому мы удостаиваем тебя чести вставить ключ в портал.
	AI_Output(self,other,"DIA_Addon_Nefarius_RingRitualEnds_05_02");	//Иди к Сатурасу и забери у него кольцо.
	AI_Output(self,other,"DIA_Addon_Nefarius_RingRitualEnds_05_03");	//Надеюсь, портал откроется.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	B_StartOtherRoutine(KDW_1400_Addon_Saturas_NW,"Start");
	B_StartOtherRoutine(KDW_1401_Addon_Cronos_NW,"Start");
	B_StartOtherRoutine(KDW_1403_Addon_Myxir_NW,"Start");
	B_StartOtherRoutine(KDW_1404_Addon_Riordian_NW,"Start");
	B_StartOtherRoutine(KDW_1405_Addon_Merdarion_NW,"Start");
	RitualRingRuns = LOG_SUCCESS;
	B_LogEntry(TOPIC_Addon_Ornament,"Украшенное кольцо восстановлено. Я должен забрать его у Сатураса.");
};

instance DIA_ADDON_NEFARIUS_PRAYFORGOMEZ(C_Info)
{
	npc = KDW_1402_Addon_Nefarius_NW;
	nr = 1;
	condition = dia_addon_nefarius_prayforgomez_condition;
	information = dia_addon_nefarius_prayforgomez_info;
	permanent = FALSE;
	description = "Мне нужно благословение Аданоса.";
};

func int dia_addon_nefarius_prayforgomez_condition()
{
	if((MIS_RESCUEGOMEZ == LOG_Running) && (RESCUEGOMEZSTEPONE == TRUE) && (RESCUEGOMEZSTEPONEDONE == FALSE) && (RESCUEGOMEZPRAYADANOS == FALSE) && (SATURASREFUSEHELPGOMEZ == FALSE) && (SENTTOSATURASGOMEZ == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_nefarius_prayforgomez_info()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_PrayForGomez_01_01");	//Мне нужно благословение Аданоса.
	AI_Output(self,other,"DIA_Addon_Nefarius_PrayForGomez_01_02");	//Поговори об этом с Сатурасом.
	AI_Output(self,other,"DIA_Addon_Nefarius_PrayForGomez_01_03");	//Думаю, он сможет помочь тебе.
	SENTTOSATURASGOMEZ = TRUE;
};


instance DIA_ADDON_NEFARIUS_RUNEMAGICNOTWORK(C_Info)
{
	npc = KDW_1402_Addon_Nefarius_NW;
	nr = 1;
	condition = dia_addon_nefarius_runemagicnotwork_condition;
	information = dia_addon_nefarius_runemagicnotwork_info;
	permanent = FALSE;
	description = "Ты все еще можешь использовать свою рунную магию?";
};


func int dia_addon_nefarius_runemagicnotwork_condition()
{
	if((STOPBIGBATTLE == TRUE) && (MIS_RUNEMAGICNOTWORK == LOG_Running) && (WATERMAGERUNESNOT == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_nefarius_runemagicnotwork_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Addon_Nefarius_RuneMagicNotWork_01_00");	//Ты все еще можешь использовать свою рунную магию?
	AI_Output(self,other,"DIA_Addon_Nefarius_RuneMagicNotWork_01_01");	//Рунной магии больше не существует. Сегодня было доказано ее несовершенство. Наша задача сейчас - не пасть духом и не показать собственную ничтожность.
	AI_Output(self,other,"DIA_Addon_Nefarius_RuneMagicNotWork_01_02");	//На поле боя нам, конечно, грош цена, но мы будем врачевать и словом наставлять наших воинов.
	AI_Output(self,other,"DIA_Addon_Nefarius_RuneMagicNotWork_01_03");	//А стоит войне закончиться, как мы тут же бросимся на поиски другой магии, и я убежден, что мы ее отыщем! 
	AI_Output(other,self,"DIA_Addon_Nefarius_RuneMagicNotWork_01_04");	//Хммм. Все ясно.
	B_LogEntry(TOPIC_RUNEMAGICNOTWORK,"Кажется, маги Воды также потеряли свою способность использовать рунную магию.");
	WATERMAGERUNESNOT = TRUE;
};

instance DIA_Addon_Nefarius_NW_Runen(C_Info)
{
	npc = KDW_1402_Addon_Nefarius_NW;
	nr = 99;
	condition = DIA_Addon_Nefarius_NW_Runen_Condition;
	information = DIA_Addon_Nefarius_NW_Runen_Info;
	permanent = TRUE;
	description = "Научи меня создавать руны.";
};

func int DIA_Addon_Nefarius_NW_Runen_Condition()
{
	if((Nefarius_Addon_TeachRunes == TRUE) && (STOPBIGBATTLE == FALSE) && (KDW_JOINHAGEN == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Nefarius_NW_Runen_Info()
{
	AI_Output(other,self,"DIA_Parlan_TEACH_15_00");	//Обучи меня!
	Info_ClearChoices(DIA_Addon_Nefarius_NW_Runen);
	Info_AddChoice(DIA_Addon_Nefarius_NW_Runen,Dialog_Back,DIA_Addon_Nefarius_NW_Runen_BACK);

	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 6)
	{
		Info_AddChoice(DIA_Addon_Nefarius_NW_Runen,"6 Круг магии",DIA_Addon_Nefarius_NW_Runen_6);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 5)
	{
		Info_AddChoice(DIA_Addon_Nefarius_NW_Runen,"5 Круг магии",DIA_Addon_Nefarius_NW_Runen_5);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 4)
	{
		Info_AddChoice(DIA_Addon_Nefarius_NW_Runen,"4 Круг магии",DIA_Addon_Nefarius_NW_Runen_4);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3)
	{
		Info_AddChoice(DIA_Addon_Nefarius_NW_Runen,"3 Круг магии",DIA_Addon_Nefarius_NW_Runen_3);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2)
	{
		Info_AddChoice(DIA_Addon_Nefarius_NW_Runen,"2 Круг магии",DIA_Addon_Nefarius_NW_Runen_2);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 1)
	{
		Info_AddChoice(DIA_Addon_Nefarius_NW_Runen,"1 Круг магии",DIA_Addon_Nefarius_NW_Runen_1);
	};
};

func void DIA_Addon_Nefarius_NW_Runen_BACK()
{
	Info_ClearChoices(DIA_Addon_Nefarius_NW_Runen);
};

func void DIA_Addon_Nefarius_NW_Runen_1()
{
	Info_ClearChoices(DIA_Addon_Nefarius_NW_Runen);
	Info_AddChoice(DIA_Addon_Nefarius_NW_Runen,Dialog_Back,DIA_Addon_Nefarius_NW_Runen_BACK);

	if(PLAYER_TALENT_RUNES[SPL_Icebolt] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_NW_Runen,b_buildlearnstringforrunes(NAME_SPL_Icebolt,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Icebolt)),dia_addon_nefarius_NW_runen_circle_1_spl_icebolt);
	};
};

func void DIA_Addon_Nefarius_NW_Runen_2()
{
	Info_ClearChoices(DIA_Addon_Nefarius_NW_Runen);
	Info_AddChoice(DIA_Addon_Nefarius_NW_Runen,Dialog_Back,DIA_Addon_Nefarius_NW_Runen_BACK);

	if(PLAYER_TALENT_RUNES[SPL_IceLance] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_NW_Runen,b_buildlearnstringforrunes(NAME_SPL_IceLance,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_IceLance)),DIA_Addon_Nefarius_NW_Runen_Circle_2_SPL_ICELANCE);
	};
	if(PLAYER_TALENT_RUNES[98] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_NW_Runen,b_buildlearnstringforrunes(NAME_SPL_SUMMONSHOAL,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SUMMONSHOAL)),dia_addon_nefarius_NW_runen_circle_2_spl_summonshoal);
	};
	if((PLAYER_TALENT_RUNES[SPL_RapidIcebolt] == FALSE) && (LegoSpells == TRUE))
	{
		Info_AddChoice(DIA_Addon_Nefarius_NW_Runen,b_buildlearnstringforrunes(NAME_SPL_RapidIcebolt,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_RapidIcebolt)),DIA_Addon_Nefarius_NW_Runen_Circle_2_SPL_RapidIcebolt);
	};
};

func void DIA_Addon_Nefarius_NW_Runen_3()
{
	Info_ClearChoices(DIA_Addon_Nefarius_NW_Runen);
	Info_AddChoice(DIA_Addon_Nefarius_NW_Runen,Dialog_Back,DIA_Addon_Nefarius_NW_Runen_BACK);

	if(PLAYER_TALENT_RUNES[SPL_IceCube] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_NW_Runen,b_buildlearnstringforrunes(NAME_SPL_IceCube,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_IceCube)),DIA_Addon_Nefarius_NW_Runen_Circle_3_SPL_IceCube);
	};
	if(PLAYER_TALENT_RUNES[SPL_ChargeZap] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_NW_Runen,b_buildlearnstringforrunes(NAME_SPL_ChargeZap,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_ChargeZap)),DIA_Addon_Nefarius_NW_Runen_Circle_3_SPL_ThunderBall);
	};
};

func void DIA_Addon_Nefarius_NW_Runen_4()
{
	Info_ClearChoices(DIA_Addon_Nefarius_NW_Runen);
	Info_AddChoice(DIA_Addon_Nefarius_NW_Runen,Dialog_Back,DIA_Addon_Nefarius_NW_Runen_BACK);

	if(PLAYER_TALENT_RUNES[SPL_LightningFlash] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_NW_Runen,b_buildlearnstringforrunes(NAME_SPL_LightningFlash,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_LightningFlash)),DIA_Addon_Nefarius_NW_Runen_Circle_4_SPL_LightningFlash);
	};
	if(PLAYER_TALENT_RUNES[89] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_NW_Runen,b_buildlearnstringforrunes(NAME_SPL_SUMMONICEGOLEM,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SUMMONICEGOLEM)),dia_addon_nefarius_NW_runen_circle_4_spl_summonicegolem);
	};
};

func void DIA_Addon_Nefarius_NW_Runen_5()
{
	Info_ClearChoices(DIA_Addon_Nefarius_NW_Runen);
	Info_AddChoice(DIA_Addon_Nefarius_NW_Runen,Dialog_Back,DIA_Addon_Nefarius_NW_Runen_BACK);

	if(PLAYER_TALENT_RUNES[SPL_WaterFist] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_NW_Runen,b_buildlearnstringforrunes(NAME_SPL_WaterFist,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_WaterFist)),dia_addon_nefarius_NW_runen_circle_5_spl_waterfist);
	};
	if(PLAYER_TALENT_RUNES[SPL_IceWave] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_NW_Runen,b_buildlearnstringforrunes(NAME_SPL_IceWave,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_IceWave)),DIA_Addon_Nefarius_NW_Runen_Circle_5_SPL_IceWave);
	};
};

func void DIA_Addon_Nefarius_NW_Runen_6()
{
	Info_ClearChoices(DIA_Addon_Nefarius_NW_Runen);
	Info_AddChoice(DIA_Addon_Nefarius_NW_Runen,Dialog_Back,DIA_Addon_Nefarius_NW_Runen_BACK);

	if(PLAYER_TALENT_RUNES[SPL_Geyser] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_NW_Runen,b_buildlearnstringforrunes(NAME_SPL_Geyser,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Geyser)),dia_addon_nefarius_NW_runen_circle_6_spl_geyser);
	};
	if(PLAYER_TALENT_RUNES[SPL_Thunderstorm] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_NW_Runen,b_buildlearnstringforrunes(NAME_SPL_Thunderstorm,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Thunderstorm)),dia_addon_nefarius_NW_runen_circle_6_spl_thunderstorm);
	};
};


func void DIA_Addon_Nefarius_NW_Runen_Circle_2_SPL_RapidIcebolt()
{
	B_TeachPlayerTalentRunes(self,other,SPL_RapidIcebolt);
};

func void DIA_Addon_Nefarius_NW_Runen_Circle_1_SPL_Zap()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Zap);
};

func void dia_addon_nefarius_NW_runen_circle_1_spl_icebolt()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Icebolt);
};

func void DIA_Addon_Nefarius_NW_Runen_Circle_2_SPL_ICELANCE()
{
	B_TeachPlayerTalentRunes(self,other,SPL_IceLance);
};

func void dia_addon_nefarius_NW_runen_circle_2_spl_summonshoal()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SUMMONSHOAL);
};

func void DIA_Addon_Nefarius_NW_Runen_Circle_3_SPL_IceCube()
{
	B_TeachPlayerTalentRunes(self,other,SPL_IceCube);
};

func void DIA_Addon_Nefarius_NW_Runen_Circle_3_SPL_ThunderBall()
{
	B_TeachPlayerTalentRunes(self,other,SPL_ChargeZap);
};

func void DIA_Addon_Nefarius_NW_Runen_Circle_4_SPL_LightningFlash()
{
	B_TeachPlayerTalentRunes(self,other,SPL_LightningFlash);
};

func void dia_addon_nefarius_NW_runen_circle_4_spl_summonicegolem()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SUMMONICEGOLEM);
};

func void DIA_Addon_Nefarius_NW_Runen_Circle_5_SPL_IceWave()
{
	B_TeachPlayerTalentRunes(self,other,SPL_IceWave);
};

func void dia_addon_nefarius_NW_runen_circle_5_spl_waterfist()
{
	B_TeachPlayerTalentRunes(self,other,SPL_WaterFist);
};

func void dia_addon_nefarius_NW_runen_circle_6_spl_geyser()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Geyser);
};

func void dia_addon_nefarius_NW_runen_circle_6_spl_thunderstorm()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Thunderstorm);
};

