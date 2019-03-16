
instance DIA_ORC_8524_BUMSHAK_EXIT(C_Info)
{
	npc = orc_8524_bumshak;
	condition = dia_orc_8524_bumshak_exit_condition;
	information = dia_orc_8524_bumshak_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};


func int dia_orc_8524_bumshak_exit_condition()
{
	return TRUE;
};

func void dia_orc_8524_bumshak_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ORC_8524_BUMSHAK_HELLO(C_Info)
{
	npc = orc_8524_bumshak;
	nr = 1;
	condition = dia_orc_8524_bumshak_hello_condition;
	information = dia_orc_8524_bumshak_hello_info;
	important = FALSE;
	permanent = TRUE;
	description = "Кто ты?";
};


func int dia_orc_8524_bumshak_hello_condition()
{
	if(FIRSTTARROK == FALSE)
	{
		return TRUE;
	};
};

func void dia_orc_8524_bumshak_hello_info()
{
	AI_Output(other,self,"DIA_Orc_8524_Bumshak_Hello_Info_18_01");	//Кто ты?
	AI_Output(self,other,"DIA_Orc_8524_Bumshak_Hello_Info_18_03");	//Помощь, помочь!!!
	AI_Output(other,self,"DIA_Orc_8524_Bumshak_Hello_Info_18_04");	//Что случилось?
	AI_Output(self,other,"DIA_Orc_8524_Bumshak_Hello_Info_18_05");	//Таррок нужно помочь. Таррок ранен!
	AI_Output(self,other,"DIA_Orc_8524_Bumshak_Hello_Info_18_07");	//Таррок нужен сильный зелье. А то Таррок умереть!
	AI_Output(self,other,"DIA_Orc_8524_Bumshak_Hello_Info_18_08");	//Таррок был зелье, но потом терять. Таррок не найти...
	FIRSTTARROK = TRUE;
	self.flags = 0;
};


instance DIA_ORC_8524_BUMSHAK_HELLO_2(C_Info)
{
	npc = orc_8524_bumshak;
	nr = 1;
	condition = dia_orc_8524_bumshak_hello_2_condition;
	information = dia_orc_8524_bumshak_hello_2_info;
	important = FALSE;
	permanent = TRUE;
	description = "Ты случайно не друг шамана Ур-Шака?";
};


func int dia_orc_8524_bumshak_hello_2_condition()
{
	if((FIRSTTARROK == TRUE) && (MEETTARROK == FALSE))
	{
		return TRUE;
	};
};

func void dia_orc_8524_bumshak_hello_2_info()
{
	AI_Output(other,self,"DIA_Orc_8524_Bumshak_Hello_2_Info_18_01");	//Ты случайно не друг шамана Ур-Шака?
	AI_Output(self,other,"DIA_Orc_8524_Bumshak_Hello_2_Info_18_02");	//Таррок думать так. Таррок знать Ур-Шак - быть когда-то великий шаман... Таррок уважать Ур-Шак!
	AI_Output(other,self,"DIA_Orc_8524_Bumshak_Hello_2_Info_18_03");	//Твой друг сказал мне, что ты можешь сделать для меня Улу-Мулу...
	AI_Output(self,other,"DIA_Orc_8524_Bumshak_Hello_2_Info_18_04");	//Чужак помогать Таррок - Таррок помогать чужак.
	AI_Output(other,self,"DIA_Orc_8524_Bumshak_Hello_2_Info_18_04А");	//Чем я могу помочь тебе?
	AI_Output(self,other,"DIA_Orc_8524_Bumshak_Hello_2_Info_18_05");	//Таррок очень слабый, нет зелье! Таррок умереть.
	AI_Output(self,other,"DIA_Orc_8524_Bumshak_Hello_2_Info_18_06");	//Чужак принести зелье, а Таррок помогать.
	AI_Output(self,other,"DIA_Orc_8524_Bumshak_Hello_2_Info_18_07");	//Таррок делать Улу-Мулу.
	AI_Output(other,self,"DIA_Orc_8524_Bumshak_Hello_2_Info_18_08");	//Я найду твои лекарства!
	AI_Output(self,other,"DIA_Orc_8524_Bumshak_Hello_2_Info_18_09");	//Таррок слабый очень. Чужак быстрей, а то Таррок умереть.
	AI_StopProcessInfos(self);
	self.aivar[AIV_EnemyOverride] = FALSE;
	Log_CreateTopic(TOPIC_TARROKWOUND,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TARROKWOUND,LOG_Running);
	MEETTARROK = TRUE;
	TARROKHEALTHY = FALSE;
	if(URSHAK_SUCKED == FALSE)
	{
		B_LogEntry(TOPIC_TARROKWOUND,"Я помог одному орку отбиться от напавших на него скелетов. Как оказалось позже, этот орк и есть друг, о котором говорил Ур-Шак. В этой заварушке Таррок был сильно ранен, и я должен поскорее найти для него орочье зелье, чтобы Таррок поправился. Взамен он обещал сделать для меня Улу-Мулу. Остается вопрос: где мне искать это зелье? Может, Ур-Шак поможет мне в моих поисках.");
	}
	else
	{
		B_LogEntry(TOPIC_TARROKWOUND,"Я помог одному орку отбиться от напавших на него скелетов. Как оказалось позже, этот орк и есть друг, о котором говорил Ур-Шак. В этой заварушке Таррок был сильно ранен, и я должен поскорее найти для него орочье зелье, чтобы Таррок поправился. Взамен он обещал сделать для меня Улу-Мулу. Остается вопрос: где мне искать это зелье?");
	};
};


instance DIA_ORC_8524_BUMSHAK_POTION(C_Info)
{
	npc = orc_8524_bumshak;
	nr = 1;
	condition = dia_orc_8524_bumshak_potion_condition;
	information = dia_orc_8524_bumshak_potion_info;
	important = FALSE;
	permanent = TRUE;
	description = "Вот, я нашел тебе зелье.";
};


func int dia_orc_8524_bumshak_potion_condition()
{
	if((Npc_HasItems(other,itpo_xorcpotion) >= 1) && (TARROKHEALTHY == FALSE) && (MEETTARROK == TRUE))
	{
		return TRUE;
	};
};

func void dia_orc_8524_bumshak_potion_info()
{
	AI_Output(other,self,"DIA_Orc_8524_Bumshak_Potion_Info_18_01");	//Вот, я нашел тебе зелье.
	B_GiveInvItems(other,self,itpo_xorcpotion,1);
	Npc_RemoveInvItems(self,itpo_xorcpotion,1);
	AI_Output(self,other,"DIA_Orc_8524_Bumshak_Potion_Info_18_02");	//Чужак не плохой, как другой солдат. Чужак хороший!!!
	AI_Output(self,other,"DIA_Orc_8524_Bumshak_Potion_Info_18_03");	//Таррок сказать спасибо.
	TARROKHEALTHY = TRUE;
	SEARCHULUMULU = FALSE;
	B_GivePlayerXP(200);
	Log_SetTopicStatus(TOPIC_TARROKWOUND,LOG_SUCCESS);
	B_LogEntry(TOPIC_TARROKWOUND,"Я принес Тарроку орочье зелье. Теперь он поправится.");
};


instance DIA_ORC_8524_BUMSHAK_ULUMULU(C_Info)
{
	npc = orc_8524_bumshak;
	nr = 1;
	condition = dia_orc_8524_bumshak_ulumulu_condition;
	information = dia_orc_8524_bumshak_ulumulu_info;
	important = FALSE;
	permanent = TRUE;
	description = "Теперь ты можешь дать мне Улу-Мулу?";
};


func int dia_orc_8524_bumshak_ulumulu_condition()
{
	if((TARROKHEALTHY == TRUE) && (SEARCHULUMULU == FALSE))
	{
		return TRUE;
	};
};

func void dia_orc_8524_bumshak_ulumulu_info()
{
	AI_Output(other,self,"DIA_Orc_8524_Bumshak_Ulumulu_Info_18_04");	//Теперь ты можешь дать мне Улу-Мулу?
	AI_Output(self,other,"DIA_Orc_8524_Bumshak_Ulumulu_Info_18_05");	//Чужак помогать Таррок - Таррок помогать чужак.
	AI_Output(self,other,"DIA_Orc_8524_Bumshak_Ulumulu_Info_18_06");	//Чужак надо: КРОТАК, ХОСТАГ, ДВАХТКАР и ОРФАРТАГ!
	AI_Output(self,other,"DIA_Orc_8524_Bumshak_Ulumulu_Info_18_07");	//Чужак принести это и Таррок делать Улу-Мулу.
	AI_Output(other,self,"DIA_Orc_8524_Bumshak_Ulumulu_Info_18_08");	//Что такое КРОТАК?!
	AI_Output(self,other,"DIA_Orc_8524_Bumshak_Ulumulu_Info_18_09");	//Язык огня. Быть язык ящерица огня.
	AI_Output(other,self,"DIA_Orc_8524_Bumshak_Ulumulu_Info_18_10");	//Что значит ХОСТАГ?!
	AI_Output(self,other,"DIA_Orc_8524_Bumshak_Ulumulu_Info_18_11");	//Рог мракорис. Острый как нож, твердый как камень.
	AI_Output(other,self,"DIA_Orc_8524_Bumshak_Ulumulu_Info_18_12");	//ДВАХТКАР?! А что это такое?
	AI_Output(self,other,"DIA_Orc_8524_Bumshak_Ulumulu_Info_18_13");	//Зуб от болотожор. Когда он кусать - никто больше не убегать.
	AI_Output(other,self,"DIA_Orc_8524_Bumshak_Ulumulu_Info_18_14");	//Что такое ОРФАРТАГ?!
	AI_Output(self,other,"DIA_Orc_8524_Bumshak_Ulumulu_Info_18_15");	//Зуб большой тролль. Делать дырка насквозь.
	AI_Output(self,other,"DIA_Orc_8524_Bumshak_Ulumulu_Info_18_16");	//Чужак искать все. Таррок ждать здесь.
	SEARCHULUMULU = TRUE;
	FINDULUMULU = FALSE;
	Log_CreateTopic(TOPIC_ULUMULUFIND,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ULUMULUFIND,LOG_Running);
	B_LogEntry(TOPIC_ULUMULUFIND,"Таррок сделает мне Улу-Мулу, если я ему принесу КРОТАК, ХОСТАГ, ДВАХТКАР и ОРФАРТАГ.");
	B_LogEntry_Quiet(TOPIC_ULUMULUFIND,"Как я понял из слов Таррока: КРОТАК - это язык огненной ящерицы, ХОСТАГ - рог мракориса, ДВАХТКАР - зуб болотожора, а ОРФАРТАГ - клык тролля.");
	B_LogEntry_Quiet(TOPIC_ULUMULUFIND,"Осталось собрать все эти предметы и принести их Тарроку.");
	AI_StopProcessInfos(self);
	self.aivar[AIV_EnemyOverride] = FALSE;
};


instance DIA_ORC_8524_BUMSHAK_FINDULUMULU(C_Info)
{
	npc = orc_8524_bumshak;
	nr = 1;
	condition = dia_orc_8524_bumshak_findulumulu_condition;
	information = dia_orc_8524_bumshak_findulumulu_info;
	important = FALSE;
	permanent = TRUE;
	description = "Я принес то, что ты просил для Улу-Мулу.";
};


func int dia_orc_8524_bumshak_findulumulu_condition()
{
	if((Npc_HasItems(other,ItAt_WaranFiretongue) >= 1) && (Npc_HasItems(other,ItAt_ShadowHorn) >= 1) && (Npc_HasItems(other,ItAt_SharkTeeth) >= 1) && (Npc_HasItems(other,ItAt_TrollTooth) >= 1) && (FINDULUMULU == FALSE) && (SEARCHULUMULU == TRUE))
	{
		return TRUE;
	};
};

func void dia_orc_8524_bumshak_findulumulu_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Orc_8524_Bumshak_FindUlumulu_Info_18_01");	//Теперь у меня есть все, что нужно для Улу-Мулу.
	b_giveinvitemsmanythings(other,self);
	Npc_RemoveInvItems(other,ItAt_WaranFiretongue,1);
	Npc_RemoveInvItems(other,ItAt_ShadowHorn,1);
	Npc_RemoveInvItems(other,ItAt_SharkTeeth,1);
	Npc_RemoveInvItems(other,ItAt_TrollTooth,1);
	AI_Output(self,other,"DIA_Orc_8524_Bumshak_FindUlumulu_Info_18_02");	//(восхищенно) Чужак сильный солдат! Дать мне вещи - Таррок делать Улу-Мулу.
	AI_Output(self,other,"DIA_Orc_8524_Bumshak_FindUlumulu_Info_18_03");	//Вот. Чужак нести Улу-Мулу и быть гордый. Таррок теперь спать.
	B_GiveInvItems(self,other,itmw_2h_orcprestige,1);
	AI_Output(other,self,"DIA_Orc_8524_Bumshak_FindUlumulu_Info_18_04");	//Спасибо, а теперь мне нужно уходить.
	AI_Output(self,other,"DIA_Orc_8524_Bumshak_FindUlumulu_Info_18_05");	//Хорошая дорога, чужак.
	FINDULUMULU = TRUE;
	URSHAKKNOWULUMULU = FALSE;
	Log_SetTopicStatus(TOPIC_ULUMULUFIND,LOG_SUCCESS);
	B_LogEntry(TOPIC_ULUMULUFIND,"Я принес Тарроку все необходимое и он сделал мне Улу-Мулу. Теперь я могу отправиться в город орков и попытаться узнать у них, как открыть решетку у входа в храм Спящего.");
};


instance DIA_ORC_8524_BUMSHAK_AFTER(C_Info)
{
	npc = orc_8524_bumshak;
	nr = 1;
	condition = dia_orc_8524_bumshak_after_condition;
	information = dia_orc_8524_bumshak_after_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_orc_8524_bumshak_after_condition()
{
	if((FINDULUMULU == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_orc_8524_bumshak_after_info()
{
	AI_Output(self,other,"DIA_Orc_8524_Bumshak_After_Info_18_00");	//Чужак идти еще.
	AI_StopProcessInfos(self);
	FINDULUMULU = TRUE;
};

