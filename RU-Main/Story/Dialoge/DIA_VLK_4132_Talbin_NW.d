
instance DIA_Talbin_NW_EXIT(C_Info)
{
	npc = VLK_4132_Talbin_NW;
	nr = 999;
	condition = DIA_Talbin_NW_EXIT_Condition;
	information = DIA_Talbin_NW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Talbin_NW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Talbin_NW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Talbin_NW(C_Info)
{
	npc = VLK_4132_Talbin_NW;
	nr = 15;
	condition = DIA_Talbin_NW_Condition;
	information = DIA_Talbin_NW_Info;
	description = "Этот проход был не таким уж и страшным, правда?";
};

func int DIA_Talbin_NW_Condition()
{
	return TRUE;
};

func void DIA_Talbin_NW_Info()
{
	AI_Output(other,self,"DIA_Talbin_NW_15_00");	//Этот проход был не таким уж и страшным, правда?
	AI_Output(self,other,"DIA_Talbin_NW_07_01");	//Спасибо, что спас меня.
	AI_Output(self,other,"DIA_Talbin_NW_07_02");	//Вот. Я нашел этот камень на перевале. Я думаю, он тебе еще пригодится.

	if((other.guild == GIL_KDF) || (other.guild == GIL_GUR) || (other.guild == GIL_KDM) || (other.guild == GIL_KDW))
	{
		AI_Output(self,other,"DIA_Talbin_NW_07_03");	//Мне кажется, это рунный камень.
		CreateInvItems(self,ItMi_RuneBlank,1);
		B_GiveInvItems(self,other,ItMi_RuneBlank,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Talbin_NW_07_04");	//Мне кажется, это кусок руды.
		CreateInvItems(self,ItMi_Nugget,1);
		B_GiveInvItems(self,other,ItMi_Nugget,1);
	};

	AI_Output(self,other,"DIA_Talbin_NW_07_05");	//Да защитит тебя Иннос.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Farm");
	TOPIC_END_Talbin_Runs = TRUE;
	B_GivePlayerXP(XP_SavedTalbin);
};

instance DIA_Talbin_NW_PERM(C_Info)
{
	npc = VLK_4132_Talbin_NW;
	nr = 15;
	condition = DIA_Talbin_NW_PERM_Condition;
	information = DIA_Talbin_NW_PERM_Info;
	permanent = TRUE;
	description = "Все в порядке?";
};

func int DIA_Talbin_NW_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Talbin_NW))
	{
		return TRUE;
	};
};

func void DIA_Talbin_NW_PERM_Info()
{
	AI_Output(other,self,"DIA_Talbin_NW_PERM_15_00");	//Все в порядке?
	AI_Output(self,other,"DIA_Talbin_NW_PERM_07_01");	//Да, спасибо тебе. А теперь иди. Со мной будет все в порядке.
	AI_StopProcessInfos(self);
};

instance DIA_Talbin_NW_HuntCamp(C_Info)
{
	npc = VLK_4132_Talbin_NW;
	nr = 15;
	condition = DIA_Talbin_NW_HuntCamp_Condition;
	information = DIA_Talbin_NW_HuntCamp_Info;
	permanent = FALSE;
	description = "Ты ведь охотник?";
};

func int DIA_Talbin_NW_HuntCamp_Condition()
{
	if((MIS_NewHunters == LOG_Running) && (TALBINRECRUITEDDT == FALSE) && (Npc_KnowsInfo(other,DIA_Talbin_NW)))
	{
		return TRUE;
	};
};

func void DIA_Talbin_NW_HuntCamp_Info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Talbin_NW_HuntCamp_01_00");	//Ты ведь охотник?
	AI_Output(self,other,"DIA_Talbin_NW_HuntCamp_01_01");	//Теперь даже не знаю. Я собирался бросить это занятие.
	AI_Output(other,self,"DIA_Talbin_NW_HuntCamp_01_02");	//Почему?
	AI_Output(self,other,"DIA_Talbin_NW_HuntCamp_01_03");	//Да, как сказать... Я никак не могу прийти в себя после всего, что мне пришлось пережить в Долине Рудников.
	AI_Output(other,self,"DIA_Talbin_NW_HuntCamp_01_04");	//Мне кажется, тебе просто надо расслабиться и заняться любимым делом. Это отвлечет тебя от дурных мыслей!
	AI_Output(self,other,"DIA_Talbin_NW_HuntCamp_01_06");	//Я бы с радостью...(печально) Но для охоты одного желания мало!
	AI_Output(other,self,"DIA_Talbin_NW_HuntCamp_01_07");	//А что же еще нужно?
	AI_Output(self,other,"DIA_Talbin_NW_HuntCamp_01_08");	//Для начала хорошее оружие и доспехи, чтобы не стать кормом для всяких тварей. А где мне все это раздобыть, я ума не приложу!
	AI_Output(other,self,"DIA_Talbin_NW_HuntCamp_01_10");	//Ну, например, в лагере охотников, что находится неподалеку от фермы Онара.
	AI_Output(self,other,"DIA_Talbin_NW_HuntCamp_01_11");	//В лагере охотников? (с надеждой) Я уже слышал про него. Хотя и подумал, что это всего лишь сказки.
	AI_Output(other,self,"DIA_Talbin_NW_HuntCamp_01_12");	//Нет, лагерь действительно существует и как раз сейчас остро нуждается в таких опытных людях, как ты.
	AI_Output(self,other,"DIA_Talbin_NW_HuntCamp_01_13");	//Ты не шутишь, приятель?
	AI_Output(other,self,"DIA_Talbin_NW_HuntCamp_01_14");	//Какие шутки! Можешь сам сходить и убедиться в этом.
	AI_Output(self,other,"DIA_Talbin_NW_HuntCamp_01_15");	//Тогда, пожалуй, не буду терять времени. Сразу отправлюсь туда!
	B_LogEntry(TOPIC_NewHunters,"Тальбин очень заинтересовался лагерем охотников.");
	TalbinBecameHunt = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GoHuntCamp");
};


instance DIA_TALBIN_RECRUITDT(C_Info)
{
	npc = VLK_4132_Talbin_NW;
	nr = 15;
	condition = dia_talbin_recruitdt_condition;
	information = dia_talbin_recruitdt_info;
	permanent = FALSE;
	description = "Где ты теперь будешь жить?";
};

func int dia_talbin_recruitdt_condition()
{
	if(Npc_KnowsInfo(other,DIA_Talbin_NW) && (TalbinBecameHunt == FALSE) && (HURRAYICANHIRE == TRUE))
	{
		return TRUE;
	};
};

func void dia_talbin_recruitdt_info()
{
	AI_Output(other,self,"Dia_Talbin_RecruitDT_15_00");	//Где ты теперь будешь жить?
	AI_Output(self,other,"Dia_Talbin_RecruitDT_07_01");	//Я остановлюсь на ферме Акила. Я там жил до Долины Рудников.
	AI_Output(self,other,"Dia_Talbin_RecruitDT_07_02");	//Если не сильно углубляться в лес, то там вполне неплохие охотничьи угодья.
	AI_Output(other,self,"Dia_Talbin_RecruitDT_15_03");	//Ну да. Если только ты не наткнешься на орков.
	AI_Output(self,other,"Dia_Talbin_RecruitDT_07_04");	//О-о-орков? Каких еще орков?
	AI_Output(other,self,"Dia_Talbin_RecruitDT_15_05");	//Некоторое время тому назад как раз в лесу у фермы Акила бродил отряд орков.
	AI_Output(self,other,"Dia_Talbin_RecruitDT_07_06");	//(В отчаянии) Нееет, только не снова эти чертовы орки! Неужели они уже и до Хориниса добрались?
	AI_Output(other,self,"Dia_Talbin_RecruitDT_15_07");	//Боюсь, что да.
	AI_Output(self,other,"Dia_Talbin_RecruitDT_07_08");	//Проклятье! Где же мне тогда теперь охотиться?
	AI_Output(other,self,"Dia_Talbin_RecruitDT_15_09");	//Ты можешь остановиться у меня, в башне рядом с фермой Онара. Поблизости как раз есть лес.
	AI_Output(other,self,"Dia_Talbin_RecruitDT_15_10");	//Там рядом и наемники, и форт паладинов. Орки туда не сунутся.
	AI_Output(self,other,"Dia_Talbin_RecruitDT_07_11");	//Да? Я радостью приму твое предложение. Спасибо! Только что ты за это хочешь?
	AI_Output(other,self,"Dia_Talbin_RecruitDT_15_12");	//Мне нужен охотник, который добывал бы мясо для моего лагеря.

	if(NICLASRECRUITEDDT == TRUE)
	{
		AI_Output(other,self,"Dia_Talbin_RecruitDT_15_13");	//Одного я уже нашел, его зовут Никлас. Но он хочет напарника.
		AI_Output(self,other,"Dia_Talbin_RecruitDT_07_14");	//Никлас? Хороший охотник! Я был бы непрочь вновь с ним поохотиться.
	};

	AI_Output(self,other,"Dia_Talbin_RecruitDT_07_15");	//Я согласен на твои условия.
	AI_Output(other,self,"Dia_Talbin_RecruitDT_15_16");	//Отлично. Сколько ты хочешь, чтобы я тебе платил за это?
	AI_Output(self,other,"Dia_Talbin_RecruitDT_07_17");	//(Удивленно) Деньги? Да нисколько. Ты мне - безопасный дом, я тебе - мясо. Кроме того, я с охоты себе наберу массу трофеев для продажи.
	AI_Output(other,self,"Dia_Talbin_RecruitDT_15_18");	//Тогда договорились. И да, чтобы тебя пустили в башню, назови пароль - "Драконовы сокровища".
	AI_Output(self,other,"Dia_Talbin_RecruitDT_07_19");	//Хорошо. Говоришь, башня что у фермы Онара? Ну тогда увидимся там.
	B_GivePlayerXP(300);
	B_LogEntry(TOPIC_PPL_FOR_TOWER,"Охотник Тальбин присоединился к лагерю.");
	self.npcType = NPCTYPE_FRIEND;
	self.aivar[AIV_ToughGuy] = TRUE;
	self.aivar[AIV_IGNORE_Theft] = TRUE;
	self.aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	self.aivar[AIV_IgnoresArmor] = TRUE;
	TALBINRECRUITEDDT = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(VLK_4132_Talbin_NW,"InCastle");
};

instance DIA_TALBIN_INTOWER(C_Info)
{
	npc = VLK_4132_Talbin_NW;
	nr = 22;
	condition = dia_talbin_intower_condition;
	information = dia_talbin_intower_info;
	permanent = TRUE;
	description = "Как охота?";
};

func int dia_talbin_intower_condition()
{
	if((TALBINRECRUITEDDT == TRUE) && (KAPITELORCATC == FALSE) && (Npc_GetDistToWP(self,"NW_CASTLEMINE_TOWER_CAMPFIRE_01") < 2000))
	{
		return TRUE;
	};
};

func void dia_talbin_intower_info()
{
	AI_Output(other,self,"DIA_Talbin_InTower_15_00");	//Как охота?
	AI_Output(self,other,"DIA_Talbin_InTower_01_01");	//Хорошо, спасибо. Орков здесь действительно нет, а это – главное.
};

instance DIA_TALBIN_INTOWER_ORCKAP(C_Info)
{
	npc = VLK_4132_Talbin_NW;
	nr = 22;
	condition = dia_talbin_intower_orckap_condition;
	information = dia_talbin_intower_orckap_info;
	permanent = TRUE;
	description = "Ты в порядке?";
};

func int dia_talbin_intower_orckap_condition()
{
	if((TALBINRECRUITEDDT == TRUE) && (KAPITELORCATC == TRUE))
	{
		return TRUE;
	};
};

func void dia_talbin_intower_orckap_info()
{
	AI_Output(other,self,"DIA_Talbin_InTower_OrcKap_15_00");	//Ты в порядке?
	AI_Output(self,other,"DIA_Talbin_InTower_OrcKap_01_01");	//Одно слово - орки. Слишком. Много. Орков.
};