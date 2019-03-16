
instance DIA_Addon_Nefarius_ADW_EXIT(C_Info)
{
	npc = KDW_14020_Addon_Nefarius_ADW;
	nr = 999;
	condition = DIA_Addon_Nefarius_ADW_EXIT_Condition;
	information = DIA_Addon_Nefarius_ADW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Nefarius_ADW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Nefarius_ADW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Nefarius_ADWHello(C_Info)
{
	npc = KDW_14020_Addon_Nefarius_ADW;
	nr = 5;
	condition = DIA_Addon_Nefarius_ADWHello_Condition;
	information = DIA_Addon_Nefarius_ADWHello_Info;
	important = TRUE;
};


func int DIA_Addon_Nefarius_ADWHello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Addon_Nefarius_ADWHello_Info()
{
	AI_Output(self,other,"DIA_Addon_Nefarius_ADWHello_05_00");	//Я очень рад, что ты появился здесь целым и невредимым.
	AI_Output(other,self,"DIA_Addon_Nefarius_ADWHello_15_01");	//Как получилось, что вы появились здесь раньше меня?
	AI_Output(self,other,"DIA_Addon_Nefarius_ADWHello_05_02");	//Мы путешествовали через загадочные измерения. Кто знает, какой путь достался тебе...
	AI_Output(other,self,"DIA_Addon_Nefarius_ADWHello_15_03");	//Использовать портал безопасно?
	AI_Output(self,other,"DIA_Addon_Nefarius_ADWHello_05_04");	//Мы сразу же попали сюда. Очевидно, портал работает исправно.
	AI_Output(self,other,"DIA_Addon_Nefarius_ADWHello_05_05");	//Конечно! Если что-нибудь пойдет не так, я обязательно тебе сообщу.
};


instance DIA_Addon_Nefarius_Neues(C_Info)
{
	npc = KDW_14020_Addon_Nefarius_ADW;
	nr = 5;
	condition = DIA_Addon_Nefarius_Neues_Condition;
	information = DIA_Addon_Nefarius_Neues_Info;
	description = "Чем вы здесь занимаетесь?";
};

func int DIA_Addon_Nefarius_Neues_Condition()
{
	if(Ghost_SCKnowsHow2GetInAdanosTempel == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Nefarius_Neues_Info()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_Neues_15_00");	//Чем вы здесь занимаетесь?
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_05_01");	//Я изучаю историю Зодчих и пытаюсь выяснить, почему они закрыли портал.
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_05_02");	//Похоже, что они хотели скрыть затонувший город от всего остального мира.
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_05_03");	//В прошлом здесь случилось что-то ужасное. Ими овладела какая-то злая сила.
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_05_04");	//Если верить записям, разразилась яростная гражданская война, вскоре за которой последовало разрушение города.
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_05_05");	//На объятые пламенем улицы обрушилась вода потопа, принесшего гибель Зодчим.
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_05_06");	//Те немногие, кто пережил этот ад, решили скрыть эту часть острова, чтобы воспрепятствовать распространению хаоса.
	Info_ClearChoices(DIA_Addon_Nefarius_Neues);
	Info_AddChoice(DIA_Addon_Nefarius_Neues,"Как ты думаешь, что мы найдем здесь?",DIA_Addon_Nefarius_Neues_find);
	Info_AddChoice(DIA_Addon_Nefarius_Neues,"А мы, глупцы, вновь открыли портал...",DIA_Addon_Nefarius_Neues_auf);
	Info_AddChoice(DIA_Addon_Nefarius_Neues,"Но в чем провинились Зодчие?",DIA_Addon_Nefarius_Neues_was);
	Info_AddChoice(DIA_Addon_Nefarius_Neues,"Ты сказал, что здесь был потоп?",DIA_Addon_Nefarius_Neues_flut);
};

func void DIA_Addon_Nefarius_Neues_find()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_Neues_find_15_00");	//Как ты думаешь, что мы найдем здесь?
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_find_05_01");	//Пока у меня есть только смутные догадки. Ты должен поговорить с Сатурасом.
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_find_05_02");	//У него есть какие-то определенные мысли на этот счет.
	Log_CreateTopic(TOPIC_Addon_Flut,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Flut,LOG_Running);
	B_LogEntry(TOPIC_Addon_Flut,"Нефариус сказал, что я должен поговорить с Сатурасом о затонувшем городе.");
	NefariusADW_Talk2Saturas = TRUE;
};

func void DIA_Addon_Nefarius_Neues_flut()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_Neues_flut_15_00");	//Ты сказал, что здесь был потоп?
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_flut_05_01");	//Сам Аданос явился Зодчим, чтобы остановить безумие.
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_flut_05_02");	//Он сравнял город с землей.
};

func void DIA_Addon_Nefarius_Neues_was()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_Neues_was_15_00");	//Но в чем провинились Зодчие?
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_was_05_01");	//Один из них посвятил себя злу. Это был великий полководец по имени Куарходрон.
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_was_05_02");	//Именно он открыл злу путь в город.
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_was_05_03");	//Его последователи сходили с ума и начинали сражаться с обычными людьми.
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_was_05_04");	//Последовавшие бедствия стали причиной гибели цивилизации.
};

func void DIA_Addon_Nefarius_Neues_auf()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_Neues_auf_15_00");	//А мы, глупцы, вновь открыли портал...
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_auf_05_01");	//Поверь, я этому тоже совсем не рад.
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_auf_05_02");	//Но был ли у нас выбор?
	AI_Output(self,other,"DIA_Addon_Nefarius_Neues_auf_05_03");	//Если мы не остановим то, что сейчас здесь происходит, весь Хоринис постигнет судьба этого древнего города.
};

instance DIA_Addon_Nefarius_AncientRune(C_Info)
{
	npc = KDW_14020_Addon_Nefarius_ADW;
	nr = 5;
	condition = DIA_Addon_Nefarius_AncientRune_Condition;
	information = DIA_Addon_Nefarius_AncientRune_Info;
	description = "Ты ищещь здесь что-то особенное?";
};

func int DIA_Addon_Nefarius_AncientRune_Condition()
{
	return TRUE;
};

func void DIA_Addon_Nefarius_AncientRune_Info()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_AncientRune_01_00");	//Ты ищещь здесь что-то особенное?
	AI_Output(self,other,"DIA_Addon_Nefarius_AncientRune_01_01");	//Я пытаюсь выяснить, использовали ли Зодчие магию рун.
	AI_Output(self,other,"DIA_Addon_Nefarius_AncientRune_01_02");	//То, что им было знакомо само понятие магии, у меня не вызывает сомнений.
	AI_Output(self,other,"DIA_Addon_Nefarius_AncientRune_01_03");	//В долине расположено множество храмов, в которых наверняка можно найти ответ на этот вопрос.
	AI_Output(self,other,"DIA_Addon_Nefarius_AncientRune_01_04");	//Но, к сожалению, другие мои исследования не оставляют мне времени на поиски.
	AI_Output(other,self,"DIA_Addon_Nefarius_AncientRune_01_05");	//Если я что-нибудь найду, то обязательно дам тебе знать.
	AI_Output(self,other,"DIA_Addon_Nefarius_AncientRune_01_06");	//Очень рассчитываю на это. Подобные знания помогут нам еще глубже изучить их культуру.
	MIS_AncientRune = LOG_Running;
	Log_CreateTopic(TOPIC_AncientRune,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AncientRune,LOG_Running);
	B_LogEntry(TOPIC_AncientRune,"Нефариус ищет доказательства того, что Зодчие использовали магию рун. Он посоветовал мне поискать ответ в храмах, расположенных в этой долине.");
};

instance DIA_Addon_Nefarius_AncientRune_Done(C_Info)
{
	npc = KDW_14020_Addon_Nefarius_ADW;
	nr = 5;
	condition = DIA_Addon_Nefarius_AncientRune_Done_Condition;
	information = DIA_Addon_Nefarius_AncientRune_Done_Info;
	description = "У меня кое-что есть для тебя.";
};

func int DIA_Addon_Nefarius_AncientRune_Done_Condition()
{
	if((MIS_AncientRune == LOG_Running) && ((Npc_HasItems(hero,ItMi_AncientRuneStone) >= 1) || (Npc_HasItems(hero,ItRu_SummonGuardian) >= 1)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Nefarius_AncientRune_Done_Info()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_AncientRune_Done_01_00");	//У меня кое-что есть для тебя.
	AI_Output(self,other,"DIA_Addon_Nefarius_AncientRune_Done_01_01");	//Хммм... Правда?
	
	if(Npc_HasItems(hero,ItRu_SummonGuardian) >= 1)
	{
		B_GivePlayerXP(300);
		AI_Output(other,self,"DIA_Addon_Nefarius_AncientRune_Done_01_02");	//Кажется, ты искал доказательства того, что Зодчие использовали магию рун.
		AI_Output(other,self,"DIA_Addon_Nefarius_AncientRune_Done_01_03");	//Я нашел одну из этих рун!
		B_GiveInvItems(other,self,ItRu_SummonGuardian,1);
		AI_Output(self,other,"DIA_Addon_Nefarius_AncientRune_Done_01_04");	//(удивленно) Невероятно! Где ты ее нашел?
		AI_Output(other,self,"DIA_Addon_Nefarius_AncientRune_Done_01_05");	//В храме Аданоса. По всей видимости, она использовалась для вызова каменных стражей.
		AI_Output(self,other,"DIA_Addon_Nefarius_AncientRune_Done_01_06");	//(разглядывая) Хммм. Вероятнее всего.
		AI_Output(self,other,"DIA_Addon_Nefarius_AncientRune_Done_01_07");	//И, похоже, ее принцип использования ничем не отличается от тех рун, которыми пользуемся мы.
		AI_Output(other,self,"DIA_Addon_Nefarius_AncientRune_Done_01_08");	//Ты оставишь ее себе для изучения?
		AI_Output(self,other,"DIA_Addon_Nefarius_AncientRune_Done_01_09");	//Я хотел бы это сделать, но полагаю, что тебе она еще самому пригодится.
		AI_Output(self,other,"DIA_Addon_Nefarius_AncientRune_Done_01_10");	//Так что возьми ее обратно, а при случае вернешь ее мне.
		B_GiveInvItems(self,other,ItRu_SummonGuardian,1);
		AI_Output(other,self,"DIA_Addon_Nefarius_AncientRune_Done_01_11");	//Как скажешь.
		MIS_AncientRune = LOG_Success;
		Log_SetTopicStatus(TOPIC_AncientRune,LOG_Success);
		B_LogEntry(TOPIC_AncientRune,"Я показал Нефариусу руну Зодчих. Он был крайне доволен этой находкой.");
	}
	else if(Npc_HasItems(hero,ItMi_AncientRuneStone) >= 1)
	{
		B_GivePlayerXP(500);
		AI_Output(other,self,"DIA_Addon_Nefarius_AncientRune_Done_01_12");	//Кажется, ты искал доказательства того, что Зодчие использовали магию рун.
		AI_Output(other,self,"DIA_Addon_Nefarius_AncientRune_Done_01_13");	//Так вот, у меня с собой есть одна такая.
		B_GiveInvItems(other,self,ItMi_AncientRuneStone,1);
		Npc_RemoveInvItems(self,ItMi_AncientRuneStone,1);
		AI_Output(self,other,"DIA_Addon_Nefarius_AncientRune_Done_01_14");	//(удивленно) Невероятно! Где ты ее нашел?
		AI_Output(other,self,"DIA_Addon_Nefarius_AncientRune_Done_01_15");	//В храме Аданоса. По всей видимости, она использовалась для вызова каменных стражей.
		AI_Output(self,other,"DIA_Addon_Nefarius_AncientRune_Done_01_16");	//Хммм. (разглядывая) Вероятнее всего. Однако я не чувствую в ней сейчас никакой магии. 
		AI_Output(other,self,"DIA_Addon_Nefarius_AncientRune_Done_01_17");	//Мне пришлось использовать магию этой руны для своих целей.
		AI_Output(other,self,"DIA_Addon_Nefarius_AncientRune_Done_01_18");	//Но можешь не сомневаться, что она там была!
		AI_Output(self,other,"DIA_Addon_Nefarius_AncientRune_Done_01_19");	//Ладно. По крайней мере, это лучше, чем ничего.
		AI_Output(self,other,"DIA_Addon_Nefarius_AncientRune_Done_01_20");	//Благодарю тебя.
		NoRuneMagic = TRUE;
		MIS_AncientRune = LOG_Success;
		Log_SetTopicStatus(TOPIC_AncientRune,LOG_Success);
		B_LogEntry(TOPIC_AncientRune,"Я отдал Нефариусу рунный камень Зодчих, лишенный магии.");
	};
};

instance DIA_Addon_Nefarius_AncientRune_Ext(C_Info)
{
	npc = KDW_14020_Addon_Nefarius_ADW;
	nr = 5;
	condition = DIA_Addon_Nefarius_AncientRune_Ext_Condition;
	information = DIA_Addon_Nefarius_AncientRune_Ext_Info;
	description = "У меня остался рунный камень Зодчих.";
};

func int DIA_Addon_Nefarius_AncientRune_Ext_Condition()
{
	if((MIS_AncientRune == LOG_Success) && (NoRuneMagic == FALSE) && (Npc_HasItems(hero,ItMi_AncientRuneStone) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Nefarius_AncientRune_Ext_Info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Addon_Nefarius_AncientRune_Ext_01_00");	//У меня остался рунный камень Зодчих.
	AI_Output(other,self,"DIA_Addon_Nefarius_AncientRune_Ext_01_01");	//Правда, он лишен магии. Тебе он нужен?
	AI_Output(self,other,"DIA_Addon_Nefarius_AncientRune_Ext_01_02");	//(задумчиво) Можешь отдать его мне. Возможно, он для чего-нибудь и пригодится.
	AI_Output(other,self,"DIA_Addon_Nefarius_AncientRune_Ext_01_03");	//Хорошо. Вот, держи.
	B_GiveInvItems(other,self,ItMi_AncientRuneStone,1);
	Npc_RemoveInvItems(self,ItMi_AncientRuneStone,1);
};

instance DIA_Addon_Nefarius_PermADW(C_Info)
{
	npc = KDW_14020_Addon_Nefarius_ADW;
	nr = 1;
	condition = DIA_Addon_Nefarius_PermADW_Condition;
	information = DIA_Addon_Nefarius_PermADW_Info;
	important = TRUE;
};

func int DIA_Addon_Nefarius_PermADW_Condition()
{
	if(NoEligorBuy == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Nefarius_PermADW_Info()
{
	AI_Output(self,other,"DIA_Addon_Nefarius_PermADW_05_02");	//Я слышал, что ты собираешься навестить Долину Рудников?
	AI_Output(other,self,"DIA_Addon_Nefarius_PermADW_15_03");	//Да, это так.
	AI_Output(self,other,"DIA_Addon_Nefarius_PermADW_05_04");	//Окажи нам одну услугу - наведайся в Свободную шахту за перевалом. Где-то там остался один рецепт, который может нам пригодиться.
	AI_Output(self,other,"DIA_Addon_Nefarius_PermADW_05_05");	//Вот, возьми ключ.
	CreateInvItems(self,itke_freminekdw,1);
	B_GiveInvItems(self,other,itke_freminekdw,1);
	AI_Output(other,self,"DIA_Addon_Nefarius_PermADW_15_06");	//Хорошо, я поищу его для тебя.
	MIS_NEFARIUS_POTIONADW = LOG_Running;
	Log_CreateTopic(TOPIC_NEFARIUS_POTIONADW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_NEFARIUS_POTIONADW,LOG_Running);
	B_LogEntry(TOPIC_NEFARIUS_POTIONADW,"Нефариусу нужен рецепт из Свободной шахты за перевалом");
};

instance DIA_ADDON_NEFARIUS1_PERMADW(C_Info)
{
	npc = KDW_14020_Addon_Nefarius_ADW;
	nr = 1;
	condition = dia_addon_nefarius1_permadw_condition;
	information = dia_addon_nefarius1_permadw_info;
	description = "Я нашел твой рецепт.";
};

func int dia_addon_nefarius1_permadw_condition()
{
	if((MIS_NEFARIUS_POTIONADW == LOG_Running) && (Npc_HasItems(other,itwr_rezepturen) >= 1))
	{
		return TRUE;
	};
};

func void dia_addon_nefarius1_permadw_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Addon_Nefarius1_PermADW_15_00");	//Я нашел твой рецепт. Правда, он был не в Свободной шахте.
	AI_Output(self,other,"DIA_Addon_Nefarius1_PermADW_05_01");	//(довольно) Это не так важно. Давай его сюда.
	B_GiveInvItems(other,self,itwr_rezepturen,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Addon_Nefarius1_PermADW_05_02");	//Да, отлично! Это он.
	Npc_RemoveInvItems(self,itwr_rezepturen,1);
	AI_Output(other,self,"DIA_Addon_Nefarius1_PermADW_15_03");	//А что это за рецепт?
	AI_Output(self,other,"DIA_Addon_Nefarius1_PermADW_05_99");	//Тут описан способ приготовления очень могущественного зелья. Его называют 'Ледяной покров'.
	AI_Output(other,self,"DIA_Addon_Nefarius1_PermADW_05_98");	//И что оно делает?
	AI_Output(self,other,"DIA_Addon_Nefarius1_PermADW_05_97");	//Оно способно уберечь тебя от воздействия сильной магии.
	AI_Output(other,self,"DIA_Addon_Nefarius1_PermADW_15_05");	//Звучит неплохо. А я могу им воспользоваться?
	AI_Output(self,other,"DIA_Addon_Nefarius1_PermADW_05_06");	//Сам приготовить ты его не сможешь, но в благодарность за найденный рецепт я помогу тебе.
	AI_Output(self,other,"DIA_Addon_Nefarius1_PermADW_05_10");	//Принеси мне два сердца огненного голема, три жемчужины и пять бутылок грога. И тогда я приготовлю тебе это чудесное зелье.
	NEFARIUS_PERMADW = TRUE;
	B_LogEntry(TOPIC_NEFARIUS_POTIONADW,"Нефариус может приготовить зелье 'Ледяной покров'. Для этого ему необходимо: два сердца огненного голема, три жемчужины и пять бутылок грога.");
};

instance DIA_ADDON_NEFARIUS2_PERMADW(C_Info)
{
	npc = KDW_14020_Addon_Nefarius_ADW;
	nr = 1;
	condition = dia_addon_nefarius2_permadw_condition;
	information = dia_addon_nefarius2_permadw_info;
	permanent = FALSE;
	description = "Приготовь мне то зелье.";
};

func int dia_addon_nefarius2_permadw_condition()
{
	if((MIS_NEFARIUS_POTIONADW == LOG_Running) && (NEFARIUS_PERMADW == TRUE) && (Npc_HasItems(other,ItAt_FireGolemHeart) >= 2) && (Npc_HasItems(other,ItMi_Addon_WhitePearl) >= 3) && (Npc_HasItems(other,ItFo_Addon_Grog) >= 5))
	{
		return TRUE;
	};
};

func void dia_addon_nefarius2_permadw_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Addon_Nefarius2_PermADW_15_00");	//Приготовь мне зелье.
	Npc_RemoveInvItems(other,ItAt_FireGolemHeart,2);
	Npc_RemoveInvItems(other,ItMi_Addon_WhitePearl,3);
	Npc_RemoveInvItems(other,ItFo_Addon_Grog,5);
	AI_Output(self,other,"DIA_Addon_Nefarius2_PermADW_15_01");	//Хорошо! Подожди минутку.
	AI_Output(self,other,"DIA_Addon_Nefarius2_PermADW_15_02");	//Вот, держи. Только используй его с умом, ибо в твоих руках воистину настоящее сокровище.
	B_GiveInvItems(self,other,itpo_waterfire,1);
	MIS_NEFARIUS_POTIONADW = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_NEFARIUS_POTIONADW,LOG_SUCCESS);
	B_LogEntry(TOPIC_NEFARIUS_POTIONADW,"Нефариус приготовил мне Щит Воды.");
};

instance DIA_Addon_Nefarius_PreTeach(C_Info)
{
	npc = KDW_14020_Addon_Nefarius_ADW;
	nr = 99;
	condition = DIA_Addon_Nefarius_PreTeach_Condition;
	information = DIA_Addon_Nefarius_PreTeach_Info;
	description = "Ты можешь поделиться со мной своим знанием магии?";
};

func int DIA_Addon_Nefarius_PreTeach_Condition()
{
	if((hero.guild == GIL_KDW) && (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 1) && Npc_KnowsInfo(other,DIA_Addon_Saturas_ADW_PreTeachCircle))
	{
		return TRUE;
	};
};

func void DIA_Addon_Nefarius_PreTeach_Info()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_PreTeach_15_00");	//Ты можешь поделиться со мной своим знанием магии?
	AI_Output(self,other,"DIA_Addon_Nefarius_PreTeach_05_01");	//Я могу научить тебя делать магические руны, а Кронос продаст тебе их формулы.
	AI_Output(self,other,"DIA_Addon_Nefarius_PreTeach_05_02");	//У него всегда с собой его книги рун.
	Nefarius_Addon_TeachRunes = TRUE;
	Log_CreateTopic(TOPIC_Addon_KDWTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_Addon_KDWTeacher,LogText_Addon_NefariusTeach);
};

instance DIA_Addon_Nefarius_ADW_Runen(C_Info)
{
	npc = KDW_14020_Addon_Nefarius_ADW;
	nr = 99;
	condition = DIA_Addon_Nefarius_ADW_Runen_Condition;
	information = DIA_Addon_Nefarius_ADW_Runen_Info;
	permanent = TRUE;
	description = "Научи меня создавать руны.";
};

func int DIA_Addon_Nefarius_ADW_Runen_Condition()
{
	if(Nefarius_Addon_TeachRunes == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Nefarius_ADW_Runen_Info()
{
	AI_Output(other,self,"DIA_Parlan_TEACH_15_00");	//Обучи меня!
	Info_ClearChoices(DIA_Addon_Nefarius_ADW_Runen);
	Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,Dialog_Back,DIA_Addon_Nefarius_ADW_Runen_BACK);

	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 6)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,"6 Круг магии",DIA_Addon_Nefarius_ADW_Runen_6);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 5)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,"5 Круг магии",DIA_Addon_Nefarius_ADW_Runen_5);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 4)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,"4 Круг магии",DIA_Addon_Nefarius_ADW_Runen_4);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,"3 Круг магии",DIA_Addon_Nefarius_ADW_Runen_3);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,"2 Круг магии",DIA_Addon_Nefarius_ADW_Runen_2);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 1)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,"1 Круг магии",DIA_Addon_Nefarius_ADW_Runen_1);
	};
};

func void DIA_Addon_Nefarius_ADW_Runen_BACK()
{
	Info_ClearChoices(DIA_Addon_Nefarius_ADW_Runen);
};

func void DIA_Addon_Nefarius_ADW_Runen_1()
{
	Info_ClearChoices(DIA_Addon_Nefarius_ADW_Runen);
	Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,Dialog_Back,DIA_Addon_Nefarius_ADW_Runen_BACK);

	if(PLAYER_TALENT_RUNES[SPL_Icebolt] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,b_buildlearnstringforrunes(NAME_SPL_Icebolt,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Icebolt)),dia_addon_nefarius_adw_runen_circle_1_spl_icebolt);
	};
};

func void DIA_Addon_Nefarius_ADW_Runen_2()
{
	Info_ClearChoices(DIA_Addon_Nefarius_ADW_Runen);
	Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,Dialog_Back,DIA_Addon_Nefarius_ADW_Runen_BACK);

	if(PLAYER_TALENT_RUNES[SPL_IceLance] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,b_buildlearnstringforrunes(NAME_SPL_IceLance,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_IceLance)),DIA_Addon_Nefarius_ADW_Runen_Circle_2_SPL_ICELANCE);
	};
	if(PLAYER_TALENT_RUNES[98] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,b_buildlearnstringforrunes(NAME_SPL_SUMMONSHOAL,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SUMMONSHOAL)),dia_addon_nefarius_adw_runen_circle_2_spl_summonshoal);
	};
	if((PLAYER_TALENT_RUNES[SPL_RapidIcebolt] == FALSE) && (LegoSpells == TRUE))
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,b_buildlearnstringforrunes(NAME_SPL_RapidIcebolt,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_RapidIcebolt)),DIA_Addon_Nefarius_ADW_Runen_Circle_2_spl_RapidIcebolt);
	};
};

func void DIA_Addon_Nefarius_ADW_Runen_3()
{
	Info_ClearChoices(DIA_Addon_Nefarius_ADW_Runen);
	Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,Dialog_Back,DIA_Addon_Nefarius_ADW_Runen_BACK);

	if(PLAYER_TALENT_RUNES[SPL_IceCube] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,b_buildlearnstringforrunes(NAME_SPL_IceCube,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_IceCube)),DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_IceCube);
	};
	if(PLAYER_TALENT_RUNES[SPL_ChargeZap] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,b_buildlearnstringforrunes(NAME_SPL_ChargeZap,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_ChargeZap)),DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_ThunderBall);
	};
};

func void DIA_Addon_Nefarius_ADW_Runen_4()
{
	Info_ClearChoices(DIA_Addon_Nefarius_ADW_Runen);
	Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,Dialog_Back,DIA_Addon_Nefarius_ADW_Runen_BACK);

	if(PLAYER_TALENT_RUNES[SPL_LightningFlash] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,b_buildlearnstringforrunes(NAME_SPL_LightningFlash,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_LightningFlash)),DIA_Addon_Nefarius_ADW_Runen_Circle_4_SPL_LightningFlash);
	};
	if(PLAYER_TALENT_RUNES[89] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,b_buildlearnstringforrunes(NAME_SPL_SUMMONICEGOLEM,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SUMMONICEGOLEM)),dia_addon_nefarius_adw_runen_circle_4_spl_summonicegolem);
	};
};

func void DIA_Addon_Nefarius_ADW_Runen_5()
{
	Info_ClearChoices(DIA_Addon_Nefarius_ADW_Runen);
	Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,Dialog_Back,DIA_Addon_Nefarius_ADW_Runen_BACK);

	if(PLAYER_TALENT_RUNES[SPL_WaterFist] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,b_buildlearnstringforrunes(NAME_SPL_WaterFist,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_WaterFist)),dia_addon_nefarius_adw_runen_circle_5_spl_waterfist);
	};
	if(PLAYER_TALENT_RUNES[SPL_IceWave] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,b_buildlearnstringforrunes(NAME_SPL_IceWave,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_IceWave)),DIA_Addon_Nefarius_ADW_Runen_Circle_5_SPL_IceWave);
	};
};

func void DIA_Addon_Nefarius_ADW_Runen_6()
{
	Info_ClearChoices(DIA_Addon_Nefarius_ADW_Runen);
	Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,Dialog_Back,DIA_Addon_Nefarius_ADW_Runen_BACK);

	if(PLAYER_TALENT_RUNES[SPL_Geyser] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,b_buildlearnstringforrunes(NAME_SPL_Geyser,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Geyser)),dia_addon_nefarius_adw_runen_circle_6_spl_geyser);
	};
	if(PLAYER_TALENT_RUNES[SPL_Thunderstorm] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen,b_buildlearnstringforrunes(NAME_SPL_Thunderstorm,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Thunderstorm)),dia_addon_nefarius_adw_runen_circle_6_spl_thunderstorm);
	};
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_2_spl_RapidIcebolt()
{
	B_TeachPlayerTalentRunes(self,other,SPL_RapidIcebolt);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_1_SPL_Zap()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Zap);
};

func void dia_addon_nefarius_adw_runen_circle_1_spl_icebolt()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Icebolt);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_2_SPL_ICELANCE()
{
	B_TeachPlayerTalentRunes(self,other,SPL_IceLance);
};

func void dia_addon_nefarius_adw_runen_circle_2_spl_summonshoal()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SUMMONSHOAL);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_IceCube()
{
	B_TeachPlayerTalentRunes(self,other,SPL_IceCube);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_ThunderBall()
{
	B_TeachPlayerTalentRunes(self,other,SPL_ChargeZap);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_4_SPL_LightningFlash()
{
	B_TeachPlayerTalentRunes(self,other,SPL_LightningFlash);
};

func void dia_addon_nefarius_adw_runen_circle_4_spl_summonicegolem()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SUMMONICEGOLEM);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_5_SPL_IceWave()
{
	B_TeachPlayerTalentRunes(self,other,SPL_IceWave);
};

func void dia_addon_nefarius_adw_runen_circle_5_spl_waterfist()
{
	B_TeachPlayerTalentRunes(self,other,SPL_WaterFist);
};

func void dia_addon_nefarius_adw_runen_circle_6_spl_geyser()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Geyser);
};

func void dia_addon_nefarius_adw_runen_circle_6_spl_thunderstorm()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Thunderstorm);
};


instance DIA_ADDON_NEFARIUS_ADW_PRAYFORGOMEZ(C_Info)
{
	npc = KDW_14020_Addon_Nefarius_ADW;
	nr = 1;
	condition = dia_addon_nefarius_adw_prayforgomez_condition;
	information = dia_addon_nefarius_adw_prayforgomez_info;
	permanent = FALSE;
	description = "Мне нужно благословение Аданоса.";
};


func int dia_addon_nefarius_adw_prayforgomez_condition()
{
	if((MIS_RESCUEGOMEZ == LOG_Running) && (RESCUEGOMEZSTEPONE == TRUE) && (RESCUEGOMEZSTEPONEDONE == FALSE) && (RESCUEGOMEZPRAYADANOS == FALSE) && (SATURASREFUSEHELPGOMEZ == FALSE) && (SENTTOSATURASGOMEZ == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_nefarius_adw_prayforgomez_info()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_ADW_PrayForGomez_01_01");	//Мне нужно благословение Аданоса.
	AI_Output(self,other,"DIA_Addon_Nefarius_ADW_PrayForGomez_01_02");	//Поговори об этом с Сатурасом.
	AI_Output(self,other,"DIA_Addon_Nefarius_ADW_PrayForGomez_01_03");	//Думаю, он сможет помочь тебе.
	SENTTOSATURASGOMEZ = TRUE;
};


instance DIA_ADDON_NEFARIUS_ADW_DURINGRITUAL(C_Info)
{
	npc = KDW_14020_Addon_Nefarius_ADW;
	nr = 1;
	condition = dia_addon_nefarius_adw_duringritual_condition;
	information = dia_addon_nefarius_adw_duringritual_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_nefarius_adw_duringritual_condition()
{
	if((MIS_RESTOREHRAM == LOG_Running) && (BEGINWATERRITUAL == TRUE) && (STOPWATERRITUAL == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_addon_nefarius_adw_duringritual_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
};

