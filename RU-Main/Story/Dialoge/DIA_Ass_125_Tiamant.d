instance DIA_Ass_125_Tiamant_EXIT(C_Info)
{
	npc = Ass_125_Tiamant;
	nr = 999;
	condition = dia_Ass_125_Tiamant_exit_condition;
	information = dia_Ass_125_Tiamant_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int dia_Ass_125_Tiamant_exit_condition()
{
	return TRUE;
};

func void dia_Ass_125_Tiamant_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Ass_125_Tiamant_PreHALLO(C_Info)
{
	npc = Ass_125_Tiamant;
	nr = 1;
	condition = dia_Ass_125_Tiamant_PreHALLO_condition;
	information = dia_Ass_125_Tiamant_PreHALLO_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_Ass_125_Tiamant_PreHALLO_condition()
{
	var int Daynow;

	Daynow = Wld_GetDay();

	if((PW_RecoverDeadBodyDay <= (Daynow - 1)) && (MIS_Orc_Pw == LOG_SUCCESS) && (HasimAmuls == TRUE))
	{
		return FALSE;
	}
	else if((MIS_HasimKill == LOG_Running) && (HasimKilled == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return FALSE;
	}
	else if((MIS_OreBugs == LOG_Running) && (Npc_IsInState(self,ZS_Talk)) && (Npc_IsDead(OreBug_Tiamant_01)) && (Npc_IsDead(OreBug_Tiamant_01)) && (Npc_IsDead(OreBug_Tiamant_02)) && (Npc_IsDead(OreBug_Tiamant_03)) && (Npc_IsDead(OreBug_Tiamant_04)) && (Npc_IsDead(OreBug_Tiamant_05)) && (Npc_IsDead(OreBug_Tiamant_06)))
	{
		return FALSE;
	}
	else if(Npc_IsInState(self,ZS_Talk) && (TiamantMurid == FALSE) && (TiamantMeet == TRUE))
	{
		return TRUE;
	};
};

func void dia_Ass_125_Tiamant_PreHALLO_info()
{
	AI_Output(self,other,"DIA_Ass_125_Tiamant_PreHALLO_01_00");	//(раздраженно) Что тебе надо?
};

instance DIA_Ass_125_Tiamant_PreHALLO_Kill(C_Info)
{
	npc = Ass_125_Tiamant;
	nr = 1;
	condition = dia_Ass_125_Tiamant_PreHALLO_Kill_condition;
	information = dia_Ass_125_Tiamant_PreHALLO_Kill_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_Ass_125_Tiamant_PreHALLO_Kill_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (TiamantMurid == FALSE) && (PlayerSendToTiamant == FALSE) && (PlayerIsAssNow == FALSE))
	{
		return TRUE;
	};
};

func void dia_Ass_125_Tiamant_PreHALLO_Kill_info()
{
	PlayerIsPrioratFake = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};


instance DIA_Ass_125_Tiamant_HALLO(C_Info)
{
	npc = Ass_125_Tiamant;
	nr = 1;
	condition = dia_Ass_125_Tiamant_hallo_condition;
	information = dia_Ass_125_Tiamant_hallo_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_Ass_125_Tiamant_hallo_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (PlayerSendToTiamant == TRUE))
	{
		return TRUE;
	};
};

func void dia_Ass_125_Tiamant_hallo_info()
{
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_00");	//Так, значит, это ты тот послушник, что обратил на себя внимание приоров Нрозаса и Осаира?
	AI_Output(other,self,"DIA_Ass_125_Tiamant_HALLO_01_01");	//(молча кивает)
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_02");	//(оценивающе) А ты, кажется, произвел на них впечатление, раз они сделали тебя своим мюридом.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_03");	//И, как я понимаю, еще тебе удалось убить пещерного черного тролля. Так?
	AI_Output(other,self,"DIA_Ass_125_Tiamant_HALLO_01_04");	//(молча кивает)
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_05");	//Что же, похоже, ты действительно чего-то да стоишь. Ладно, для начала этого хватит.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_06");	//Теперь перейдем к делу.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_07");	//Если ты еще не понял, кто стоит перед тобой, то... 
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_08");	//...мое имя Тиамант Кровавый! И я один из четырех приоров нашего священного Братства.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_09");	//Моя основная обязанность здесь - это боевая подготовка наших воинов.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_10");	//И дело не в том, чтобы научить их правильно держать меч и стрелять из лука.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_11");	//Тень Масиафа должна быть искусна во всем. Во всем, что ей сможет помочь выполнить возложенную на нее миссию.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_12");	//Поскольку даже сама мысль о провале является неприемлемой и будет равносильна только смерти!
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_13");	//Но достаточно слов. Я не сторонник долгих речей. Это больше по части Ханиара.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_14");	//Что касается тебя, то теперь ты должен произвести впечатление и на меня.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_15");	//Если, конечно, хочешь чего-то добиться.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_16");	//Так что напряги свой слух и запомни все то, что мне от тебя понадобится.
	AI_Output(other,self,"DIA_Ass_125_Tiamant_HALLO_01_17");	//(молча кивает)
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_18");	//Итак. С пещерным черным троллем ты уже справился.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_19");	//Но теперь тебе нужно будет выследить и убить куда более хитрую и опасную тварь - муритана.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_20");	//Днем этого зверя выследить крайне трудно, поскольку обычно он покидает свое логово только ночью.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_21");	//Тогда же он и охотится. И уж поверь: встреча с ним будет для тебя смертельно опасной.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_22");	//Могу сказать больше. За все время только одному из моих воинов удалось принести мне его голову.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_23");	//Остальным же либо не повезло, либо они и вовсе не вернулись обратно.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_24");	//Так что, если хочешь произвести на меня впечатление, - тебе придется хорошенько потрудиться.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_25");	//Хотя я уверен в том, что другого ты и не ждал.
	AI_Output(other,self,"DIA_Ass_125_Tiamant_HALLO_01_26");	//(молча кивает)
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_27");	//Тогда ступай. Надеюсь, что ты оправдаешь оказанную тебе честь.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_28");	//Да, и еще кое-что...
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_29");	//Если тебе интересно, кому все-таки удалось убить муритана, то того воина зовут Хасим.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_30");	//Кажется, он недавно вернулся с новой партией рабов для Осаира и сейчас отдыхает в главном зале.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HALLO_01_31");	//Так что можешь поговорить с ним об этом.
	AI_Output(other,self,"DIA_Ass_125_Tiamant_HALLO_01_32");	//(молча кивает)
	AI_PlayAni(other,"T_YES");
	TiamantMeet = TRUE;
	MIS_TiamantMuritan = LOG_Running;
	Log_CreateTopic(TOPIC_TiamantMuritan,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TiamantMuritan,LOG_Running);
	B_LogEntry(TOPIC_TiamantMuritan,"Приор Тиамант поручил мне выследить и убить муритана. Этого зверя можно встретить только ночью. И за все время только одному из его воинов, Хасиму, удалось это сделать. Возможно, мне стоит поговорить с ним.");
	AI_StopProcessInfos(self);

	if(HasimInserted == FALSE)
	{
		HasimInserted = TRUE;
		Wld_InsertNpc(Ass_170_Adept,"PW_TEMPLE_HASIM");
	};
};

instance DIA_Ass_125_Tiamant_TiamantMuritan(C_Info)
{
	npc = Ass_125_Tiamant;
	nr = 1;
	condition = dia_Ass_125_Tiamant_TiamantMuritan_condition;
	information = dia_Ass_125_Tiamant_TiamantMuritan_info;
	permanent = FALSE;
	description = "(отдать ядовитый клык)";
};

func int dia_Ass_125_Tiamant_TiamantMuritan_condition()
{
	if((MIS_TiamantMuritan == LOG_Running) && (Npc_HasItems(other,ItAt_PW_MuritanTooth) >= 1))
	{
		return TRUE;
	};
};

func void dia_Ass_125_Tiamant_TiamantMuritan_info()
{
	B_GivePlayerXP(1000);
	B_GiveInvItems(other,self,ItAt_PW_MuritanTooth,1);
	Npc_RemoveInvItems(self,ItAt_PW_MuritanTooth,1);

	if(Trophy_MuritanTooth  == TRUE)
	{
		if((Npc_HasItems(other,ItAt_PW_MuritanTooth) == FALSE) && (Npc_HasItems(other,ItAt_BuritanTooth) == FALSE))
		{
			Ext_RemoveFromSlot(other,"BIP01 PELVIS");
			Npc_RemoveInvItems(other,ItUt_MuritanTooth,Npc_HasItems(other,ItUt_MuritanTooth));
			Trophy_MuritanTooth  = FALSE;
		};
	};

	AI_Output(self,other,"DIA_Ass_125_Tiamant_TiamantMuritan_01_00");	//Насколько я понимаю, тебе удалось выследить эту тварь?
	AI_Output(other,self,"DIA_Ass_125_Tiamant_TiamantMuritan_01_01");	//(молча кивает)
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Ass_125_Tiamant_TiamantMuritan_01_02");	//Что же, это достойно уважения, послушник.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_TiamantMuritan_01_03");	//Теперь я точно знаю, что передо мной стоит довольно искусный боец.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_TiamantMuritan_01_04");	//Однако это еще не означает, что я готов сразу сделать тебя своим мюридом.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_TiamantMuritan_01_05");	//Поэтому тебе придется еще немного поработать на меня. И тут как раз есть для тебя еще одно поручение.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_TiamantMuritan_01_06");	//Дело довольно необычное. Дело в том, что недавно в долине появился небольшой отряд орков.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_TiamantMuritan_01_07");	//По всей видимости, они спустились сюда с гор. Иначе в это место просто так не попасть. 
	AI_Output(self,other,"DIA_Ass_125_Tiamant_TiamantMuritan_01_08");	//Обычно мы не воюем с этими зеленокожими созданиями. 
	AI_Output(self,other,"DIA_Ass_125_Tiamant_TiamantMuritan_01_09");	//Однако тут у нас, кажется, могут быть проблемы.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_TiamantMuritan_01_10");	//Я уже отправлял к ним своего посыльного, но тот так и не вернулся до сих пор.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_TiamantMuritan_01_11");	//Поэтому я хочу, чтобы ты отправился к оркам и выяснил их намерения.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_TiamantMuritan_01_12");	//Если эти твари будут вести себя слишком агрессивно, то просто прикончи их всех. 
	AI_Output(self,other,"DIA_Ass_125_Tiamant_TiamantMuritan_01_13");	//Но сделай это аккуратно! Никто не должен знать об этом. 
	AI_Output(self,other,"DIA_Ass_125_Tiamant_TiamantMuritan_01_14");	//Ты меня понял?
	AI_Output(other,self,"DIA_Ass_125_Tiamant_TiamantMuritan_01_15");	//(молча кивает)
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Ass_125_Tiamant_TiamantMuritan_01_16");	//Хорошо. Тогда я жду от тебя вестей. Ступай.
	MIS_Orc_Pw = LOG_Running;
	MIS_TiamantMuritan = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_TiamantMuritan,LOG_SUCCESS);
	Log_CreateTopic(TOPIC_Orc_Pw,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Orc_Pw,LOG_Running);
	B_LogEntry(TOPIC_TiamantMuritan,"Я сообщил Тиаманту, что мне удалось убить муритана, и тем самым, похоже, смог завоевать его уважение.");
	B_LogEntry_Quiet(TOPIC_Orc_Pw,"Тиамант поручил мне найти отряд орков, появившийся в долине, и выяснить их намерения.");
	AI_StopProcessInfos(self);
	Wld_InsertNpc(ORCWARRIOR4_PW_01,"PW_ORC_01");
	Wld_InsertNpc(ORCWARRIOR4_PW_02,"PW_ORC_02");
	Wld_InsertNpc(ORCWARRIOR4_PW_03,"PW_ORC_03");
	Wld_InsertNpc(ORCWARRIOR4_PW_04,"PW_ORC_04");
	Wld_InsertNpc(ORC_PW_SCOUT,"PW_ORC_05");
	Wld_InsertNpc(ORCWARRIOR4_COWARD,"PW_ORC_06");
};


instance DIA_Ass_125_Tiamant_Orc_Pw(C_Info)
{
	npc = Ass_125_Tiamant;
	nr = 1;
	condition = dia_Ass_125_Tiamant_Orc_Pw_condition;
	information = dia_Ass_125_Tiamant_Orc_Pw_info;
	permanent = FALSE;
	description = "(отдать голову послушника)";
};

func int dia_Ass_125_Tiamant_Orc_Pw_condition()
{
	if((MIS_Orc_Pw == LOG_Running) && (Npc_HasItems(other,ItMi_Addon_Masiafadept_Kopf) >= 1) && (Npc_IsDead(ORCWARRIOR4_PW_01)) && (Npc_IsDead(ORCWARRIOR4_PW_02)) && (Npc_IsDead(ORCWARRIOR4_PW_03)) && (Npc_IsDead(ORCWARRIOR4_PW_04)) && (Npc_IsDead(ORC_PW_SCOUT)))
	{
		return TRUE;
	};
};

func void dia_Ass_125_Tiamant_Orc_Pw_info()
{

	B_GiveInvItems(other,self,ItMi_Addon_Masiafadept_Kopf,1);
	AI_Output(self,other,"DIA_Ass_125_Tiamant_Orc_Pw_01_00");	//(мрачно) Значит, они убили моего послушника. Что же, этого было ожидаемо.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_Orc_Pw_01_01");	//Но ты, я надеюсь, позаботился о том, чтобы эти твари получили по заслугам? И забери бошку обратно, выкинь куда-нибудь в канаву.
	B_GiveInvItems(self,other,ItMi_Addon_Masiafadept_Kopf,1);

	if(Npc_IsDead(ORCWARRIOR4_COWARD))
	{
		B_GivePlayerXP(500);
		AI_Output(other,self,"DIA_Ass_125_Tiamant_Orc_Pw_01_02");	//(молча кивает)
		AI_PlayAni(other,"T_YES");
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Orc_Pw_01_03");	//Хорошо. Значит, можно пока забыть об этой проблеме.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Orc_Pw_01_04");	//Что касается тебя, то можешь немного передохнуть.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Orc_Pw_01_05");	//Я дам знать, когда ты мне снова понадобишься.
		MIS_Orc_Pw = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_Orc_Pw,LOG_SUCCESS);
		B_LogEntry(TOPIC_Orc_Pw,"Я сообщил Тиаманту, что разобрался с орками.");
		AI_StopProcessInfos(self);
	}
	else
	{
		B_GivePlayerXP(250);
		AI_Output(other,self,"DIA_Ass_125_Tiamant_Orc_Pw_01_06");	//(молчать)
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Orc_Pw_01_07");	//Говори же!
		AI_Output(other,self,"DIA_Ass_125_Tiamant_Orc_Pw_01_08");	//К сожалению, одному орку все-таки удалось уйти, мастер.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Orc_Pw_01_09");	//Это не очень хорошая новость, послушник.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Orc_Pw_01_10");	//И теперь, я полагаю, что орки знают о нашем присутствии тут и попытаются нам отомстить.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Orc_Pw_01_11");	//Ну да ладно. Моим бойцам уже давно пора немного размяться.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Orc_Pw_01_12");	//И это будет для них неплохой тренировкой, если орки все-таки решаться напасть на нас.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Orc_Pw_01_13");	//Так что, может быть, оно и к лучшему.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Orc_Pw_01_14");	//Что касается тебя, то можешь немного передохнуть.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Orc_Pw_01_15");	//Я дам знать, когда ты мне снова понадобишься.
		PW_OrcRevengeDay = Wld_GetDay();
		PW_OrcRevenge = TRUE;
		MIS_Orc_Pw = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_Orc_Pw,LOG_SUCCESS);
		B_LogEntry(TOPIC_Orc_Pw,"Я сообщил Тиаманту, что разобрался с орками, упомянув, что одному орку все же удалось уйти.");
		AI_StopProcessInfos(self);
	};
};

instance DIA_Ass_125_Tiamant_HasimKill(C_Info)
{
	npc = Ass_125_Tiamant;
	nr = 1;
	condition = dia_Ass_125_Tiamant_HasimKill_condition;
	information = dia_Ass_125_Tiamant_HasimKill_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_Ass_125_Tiamant_HasimKill_condition()
{
	var int Daynow;

	Daynow = Wld_GetDay();

	if((PW_RecoverDeadBodyDay <= (Daynow - 1)) && (MIS_Orc_Pw == LOG_SUCCESS) && (HasimAmuls == TRUE))
	{
		return TRUE;
	};
};

func void dia_Ass_125_Tiamant_HasimKill_info()
{
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HasimKill_01_00");	//Хорошо, что ты тут, послушник!
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HasimKill_01_01");	//Тут как раз есть для тебя одно очень деликатное поручение.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HasimKill_01_02");	//Дело касается одного из наших бойцов. Его зовут Хасим. Думаю, что ты уже встречался с ним.
	AI_Output(other,self,"DIA_Ass_125_Tiamant_HasimKill_01_03");	//(молча кивает)
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HasimKill_01_04");	//Тогда не будем терять время на лишние разговоры и перейдем сразу к делу.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HasimKill_01_05");	//Все довольно просто: ты должен убить его. И не стоит задаваться вопросом, почему это необходимо.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HasimKill_01_06");	//Но сделать это нужно тихо и подальше от любопытных глаз. Никто не должен узнать об этом!
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HasimKill_01_07");	//Тебе все ясно?
	AI_Output(other,self,"DIA_Ass_125_Tiamant_HasimKill_01_08");	//(молча кивает)
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HasimKill_01_09");	//Отлично! Надеюсь, что ты меня не подведешь. 
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HasimKill_01_10");	//Поскольку во многом от этого будет зависеть твоя собственная судьба.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HasimKill_01_11");	//Теперь все, ступай.
	MIS_HasimKill = LOG_Running;
	Log_CreateTopic(TOPIC_HasimKill,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HasimKill,LOG_Running);
	B_LogEntry(TOPIC_HasimKill,"Тиамант приказал мне убить Тень Хасима. Он не объяснил, зачем это надо, но, похоже, дело серьезное. Сделать это надо подальше от посторонних глаз.");
	AI_StopProcessInfos(self);
};


instance DIA_Ass_125_Tiamant_HasimKillDone(C_Info)
{
	npc = Ass_125_Tiamant;
	nr = 1;
	condition = dia_Ass_125_Tiamant_HasimKillDone_condition;
	information = dia_Ass_125_Tiamant_HasimKillDone_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_Ass_125_Tiamant_HasimKillDone_condition()
{
	if((MIS_HasimKill == LOG_Running) && (HasimKilled == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_Ass_125_Tiamant_HasimKillDone_info()
{
	B_GivePlayerXP(400);
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HasimKillDone_01_00");	//Что с моим поручением, послушник? Ты уладил дело с Хасимом?
	AI_Output(other,self,"DIA_Ass_125_Tiamant_HasimKillDone_01_01");	//(молча кивает)
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HasimKillDone_01_02");	//Хорошо. Надеюсь, что он не слишком долго мучился.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HasimKillDone_01_03");	//Что же касается тебя, то тут есть еще одно довольно непростое дельце.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HasimKillDone_01_04");	//Недавно приор Осаир прислал мне сообщение о том, что на руднике завелись какие-то твари, которые пожрали всех его рабов.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HasimKillDone_01_05");	//Поставки железной руды очень важны для нас, поскольку из нее мы делаем оружие и доспехи, необходимые нашим бойцам. 
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HasimKillDone_01_06");	//Сам Осаир не может послать своих людей туда, поскольку тогда попросту некому будет следить за остальными рабами.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HasimKillDone_01_07");	//Поэтому он попросил меня разобраться с этой проблемой. А я в свою очередь даю это поручение тебе.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HasimKillDone_01_08");	//Позаботься об этих тварях, чтобы они больше не доставляли нам неприятности.
	AI_Output(other,self,"DIA_Ass_125_Tiamant_HasimKillDone_01_09");	//(молча кивает)
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HasimKillDone_01_10");	//Отлично! Раз ты все понял, тогда все, ступай.
	MIS_OreBugs = LOG_Running;
	B_LogEntry(TOPIC_HasimKill,"Я сообщил Тиаманту, что с Хасимом покончено. Меня удивило, как спокойно он отреагировал на эту новость. Но главное, что работа сделана. Однако мотивы приора пока остаются непонятными.");
	Log_CreateTopic(TOPIC_OreBugs,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OreBugs,LOG_Running);
	B_LogEntry_Quiet(TOPIC_OreBugs,"Мне надо отправиться к руднику и разобраться с тварями, что пожрали там всех рабов. Думаю, стоит поторопиться, поскольку Тиамант не любит ждать.");
	AI_StopProcessInfos(self);
	Wld_InsertNpc(OreBug_Tiamant_01,"PW_CAVEORE_01");
	Wld_InsertNpc(OreBug_Tiamant_02,"PW_CAVEORE_01");
	Wld_InsertNpc(OreBug_Tiamant_03,"PW_CAVEORE_01");
	Wld_InsertNpc(OreBug_Tiamant_04,"PW_CAVEORE_01");
	Wld_InsertNpc(OreBug_Tiamant_05,"PW_CAVEORE_01_TEMP");
	Wld_InsertNpc(OreBug_Tiamant_06,"PW_CAVEORE_02_TEMP");
	B_KillNpc(SEK_179_SLAVEOBSSEK);
	B_KillNpc(SEK_180_SLAVEOBSSEK);
	B_KillNpc(SEK_181_SLAVEOBSSEK);
	B_KillNpc(Ass_182_Adept);
};

instance DIA_Ass_125_Tiamant_OreBugsKilled(C_Info)
{
	npc = Ass_125_Tiamant;
	nr = 1;
	condition = dia_Ass_125_Tiamant_OreBugsKilled_condition;
	information = dia_Ass_125_Tiamant_OreBugsKilled_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_Ass_125_Tiamant_OreBugsKilled_condition()
{
	if((MIS_OreBugs == LOG_Running) && (Npc_IsInState(self,ZS_Talk)) && (Npc_IsDead(OreBug_Tiamant_01)) && (Npc_IsDead(OreBug_Tiamant_01)) && (Npc_IsDead(OreBug_Tiamant_02)) && (Npc_IsDead(OreBug_Tiamant_03)) && (Npc_IsDead(OreBug_Tiamant_04)) && (Npc_IsDead(OreBug_Tiamant_05)) && (Npc_IsDead(OreBug_Tiamant_06)))
	{
		return TRUE;
	};
};

func void dia_Ass_125_Tiamant_OreBugsKilled_info()
{
	B_GivePlayerXP(500);
	AI_Output(self,other,"DIA_Ass_125_Tiamant_OreBugsKilled_01_00");	//Ах, это ты, послушник. Полагаю, что ты сюда пришел не просто так.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_OreBugsKilled_01_01");	//Наверняка хочешь сообщить мне последние новости касательно проблем на руднике? Не так ли?
	AI_Output(other,self,"DIA_Ass_125_Tiamant_OreBugsKilled_01_02");	//(молча кивает)
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Ass_125_Tiamant_OreBugsKilled_01_03");	//Ну, тогда можешь себя не утруждать в этом.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_OreBugsKilled_01_04");	//Осаир уже прислал весточку о том, что рудник снова свободен, и его рабы готовы вернуться к добыче железной руды.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_OreBugsKilled_01_05");	//Что же, ты хорошо поработал. Не зря я тебе доверился.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_OreBugsKilled_01_06");	//Поэтому я хочу тут кое-что сделать для тебя. Тебе это интересно?
	MIS_OreBugs = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_OreBugs,LOG_SUCCESS);
	B_LogEntry(TOPIC_OreBugs,"Тиаманту уже сообщили о том, что я разобрался с проблемой в железном руднике. Он остался этим доволен.");
	Info_ClearChoices(DIA_Ass_125_Tiamant_OreBugsKilled);
	Info_AddChoice(DIA_Ass_125_Tiamant_OreBugsKilled,"...(молча кивнуть)",DIA_Ass_125_Tiamant_OreBugsKilled_Murid);

};

func void DIA_Ass_125_Tiamant_OreBugsKilled_Murid()
{
	AI_Output(self,other,"DIA_Ass_125_Tiamant_OreBugsKilled_Murid_01_01");	//Хорошо. Тогда я тебе так скажу.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_OreBugsKilled_Murid_01_02");	//За все то время, что ты выполнял мои поручения, ты показал себя с лучшей стороны и доказал мне, что способен на многое.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_OreBugsKilled_Murid_01_03");	//И даже более того - ты ни разу меня не подвел. А это ценится куда больше даже, чем звон золотых монет.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_OreBugsKilled_Murid_01_04");	//Поэтому, исходя из всего вышесказанного, я считаю, что ты достоин стать моим мюридом.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_OreBugsKilled_Murid_01_05");	//Думаю, ты понимаешь, что это означает и не подведешь меня в дальнейшем.
	AI_Output(other,self,"DIA_Ass_125_Tiamant_OreBugsKilled_Murid_01_06");	//Благодарю тебя, мастер.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_OreBugsKilled_Murid_01_07");	//Ты заслужил это, а по делам и награда. Слышал, наверное.
	AI_Output(other,self,"DIA_Ass_125_Tiamant_OreBugsKilled_Murid_01_08");	//И что мне теперь делать?
	AI_Output(self,other,"DIA_Ass_125_Tiamant_OreBugsKilled_Murid_01_09");	//Пока ничего. Других поручений для тебя у меня пока нет.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_OreBugsKilled_Murid_01_10");	//Но будь поблизости. Возможно, что они появятся в скором времени.
	TiamantMurid = TRUE;
	Snd_Play("LevelUP");
	B_LogEntry_Quiet(TOPIC_MasiafStory,"Мастер Тиамант посвятил меня в свои мюриды. А значит, дело осталось за малым. И, возможно, в скором времени я смогу стать одним из ассасинов Масиаф. Это сильно развяжет мне руки.");
	AI_StopProcessInfos(self);
};


//---------------------------------------------------------------------


instance DIA_Ass_125_Tiamant_HaniarQuest1(C_Info)
{
	npc = Ass_125_Tiamant;
	nr = 1;
	condition = dia_Ass_125_Tiamant_HaniarQuest1_condition;
	information = dia_Ass_125_Tiamant_HaniarQuest1_info;
	permanent = FALSE;
	description = "Насчет Хасима...";
};

func int dia_Ass_125_Tiamant_HaniarQuest1_condition()
{
	if((GonsalesAdvice == TRUE) && (HaniarKnowKiller == FALSE))
	{
		return TRUE;
	};
};

func void dia_Ass_125_Tiamant_HaniarQuest1_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Ass_125_Tiamant_HaniarQuest1_01_01");	//Я не хотел побеспокоить вас, мастер. Но мне необходимо поговорить с вами насчет... Хасима.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HaniarQuest1_01_02");	//(удивленно) Если мне не изменяет память, то он недавно... умер.
	AI_Output(other,self,"DIA_Ass_125_Tiamant_HaniarQuest1_01_03");	//Так оно и есть. Но в этом как раз и заключается проблема.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HaniarQuest1_01_04");	//Интересно, какая именно?
	AI_Output(other,self,"DIA_Ass_125_Tiamant_HaniarQuest1_01_05");	//Приор Ханиар сильно обеспокоен смертью Хасима, поэтому послал меня разузнать, кто за этим стоит.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HaniarQuest1_01_06");	//Ах, вот в чем дело. Не волнуйся, мюрид! Видимо, это я просто забыл предупредить Ханиара о том... небольшом происшествии.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HaniarQuest1_01_07");	//Но коль это моя вина, я помогу тебе решить эту проблему.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HaniarQuest1_01_08");	//Я сейчас же напишу Ханиару письмо, в котором объясню ему некоторые нюансы этого дела.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HaniarQuest1_01_09");	//А ты отнесешь его. Так. Где тут была моя бумага...
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HaniarQuest1_01_10");	//Ну где же она, черт бы ее побрал? Проклятье Белиара! Видимо, я ее где-то оставил.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HaniarQuest1_01_11");	//Мюрид! Сходи на склад и принеси мне новую пачку бумаги для письма. Не писать же МНЕ на каком-то рванье!
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HaniarQuest1_01_12");	//Да поторопись! Это все-таки и в твоих интересах тоже.
	B_LogEntry(TOPIC_HasimKill,"Я поговорил с Тиамантом. Оказывается, он просто забыл предупредить приоров о необходимости убийства. Теперь мне нужно найти ему бумагу, чтобы Тиамант смог написать записку с объяснениями Ханиару. Думаю, что на этот раз я легко отделался.");
	AI_StopProcessInfos(self);
	Wld_insertitem(ItWr_TiamantPaperBlank,"FP_ITEM_TIAMANT_LETTER");
};

instance DIA_Ass_125_Tiamant_HaniarQuest2(C_Info)
{
	npc = Ass_125_Tiamant;
	nr = 1;
	condition = dia_Ass_125_Tiamant_HaniarQuest2_condition;
	information = dia_Ass_125_Tiamant_HaniarQuest2_info;
	permanent = FALSE;
	description = "Вот пачка бумаги для письма.";
};

func int dia_Ass_125_Tiamant_HaniarQuest2_condition()
{
	if(Npc_HasItems(hero,ItWr_TiamantPaperBlank) >= 1)
	{
		return TRUE;
	};
};

func void dia_Ass_125_Tiamant_HaniarQuest2_info()
{
	AI_Output(other,self,"DIA_Ass_125_Tiamant_HaniarQuest2_01_01");	//Вот пачка бумаги для письма, которую вы просили, мастер.
	B_GiveInvItems(other,self,ItWr_TiamantPaperBlank,1);
	Npc_RemoveInvItems(self,ItWr_TiamantPaperBlank,1);
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HaniarQuest2_01_02");	//Отлично, мюрид. Сейчас я напишу письмо. Подожди минутку.
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HaniarQuest2_01_03");	//Так-то лучше. Теперь можешь отнести его Ханиару. Все, ступай!
	B_GiveInvItems(self,other,ItWr_TiamantPaperToHaniar,1);
	AI_StopProcessInfos(self);
};

instance DIA_Ass_125_Tiamant_HelpWithAssair(C_Info)
{
	npc = Ass_125_Tiamant;
	nr = 1;
	condition = dia_Ass_125_Tiamant_HelpWithAssair_condition;
	information = dia_Ass_125_Tiamant_HelpWithAssair_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_Ass_125_Tiamant_HelpWithAssair_condition()
{
	if((TiamantNeedsSlaves == TRUE) && (PlayerIsAssNow == TRUE))
	{
		return TRUE;
	};
};

func void dia_Ass_125_Tiamant_HelpWithAssair_info()
{
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HelpWithAssair_01_01");	//Ах. Хорошо что ты зашел. Мне нужна твоя помощь!
	AI_Output(other,self,"DIA_Ass_125_Tiamant_HelpWithAssair_01_02");	//Все, что захотите, мастер.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HelpWithAssair_01_03");	//Необходимо сходить к приору Осаиру и передать ему, что он до сих пор не прислал в шахту новых рабов.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HelpWithAssair_01_04");	//Это непозволительно, чтобы она простаивала так долго! Нам нужно как можно больше руды.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HelpWithAssair_01_05");	//К тому же уже сам Ханиар Слепец интересовался делами там. Я не хочу выглядеть в его глазах полным идиотом!
	AI_Output(other,self,"DIA_Ass_125_Tiamant_HelpWithAssair_01_06");	//Я все сделаю, мастер.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_HelpWithAssair_01_07");	//Хорошо. Только поспеши! Это очень срочное и важное дело.
	TiamantSendsToOsair = TRUE;
	B_LogEntry(TOPIC_Intriges,"Тиамант попросил меня напомнить Осаиру о том, что он до сих пор не прислал в шахту новых рабов. Ханиар Слепец лично интересовался делами в рудной шахте, и Тиаманту это не пришлось по душе. Похоже, он очень боится Ханиара.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(Ass_184_Adept,"Osair");
};

instance DIA_Ass_125_Tiamant_WhatTeach(C_Info)
{
	npc = Ass_125_Tiamant;
	nr = 1;
	condition = dia_Ass_125_Tiamant_WhatTeach_condition;
	information = dia_Ass_125_Tiamant_WhatTeach_info;
	permanent = FALSE;
	description = "Могу ли я чему-нибудь научиться у вас, мастер?";
};

func int dia_Ass_125_Tiamant_WhatTeach_condition()
{
	if(PlayerIsAssNow == TRUE)
	{
		return TRUE;
	};
};

func void dia_Ass_125_Tiamant_WhatTeach_info()
{
	AI_Output(other,self,"DIA_Ass_125_Tiamant_WhatTeach_01_01");	//Могу ли я чему-нибудь научиться у вас, мастер?
	AI_Output(self,other,"DIA_Ass_125_Tiamant_WhatTeach_01_02");	//Само собой. Поскольку ты теперь один из нас, то я, безусловно, помогу тебе улучшить твои боевые навыки.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_WhatTeach_01_03");	//Ну, или же обучить тебя более мастерскому владению мечом.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_WhatTeach_01_04");	//Однако для всего этого тебе, естественно, понадобится иметь достаточно опыта.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_WhatTeach_01_05");	//Новичков я не обучаю.
	TiamantTeachMe = TRUE;
	Log_CreateTopic(TOPIC_PrioratTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_PrioratTeacher,"Приор Тиамант поможет мне повысить мою силу и ловкость, а также сможет обучить меня владению мечом.");
};

var int Tiamant_MerkeDEX;
var int Tiamant_MerkeSTR;

instance DIA_Ass_125_Tiamant_Teach(C_Info)
{
	npc = Ass_125_Tiamant;
	nr = 20;
	condition = DIA_Ass_125_Tiamant_Teach_Condition;
	information = DIA_Ass_125_Tiamant_Teach_Info;
	permanent = TRUE;
	description = "Я хочу стать более сильным и ловким.";
};

func int DIA_Ass_125_Tiamant_Teach_Condition()
{
	if(TiamantTeachMe == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Ass_125_Tiamant_Teach_Info()
{
	AI_Output(other,self,"DIA_Ass_125_Tiamant_Teach_15_00");	//Я хочу стать более сильным и ловким.
	Tiamant_MerkeDEX = other.attribute[ATR_DEXTERITY];
	Tiamant_MerkeSTR = other.attribute[ATR_STRENGTH];
	Info_ClearChoices(DIA_Ass_125_Tiamant_Teach);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach,Dialog_Back,DIA_Ass_125_Tiamant_Teach_BACK);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Ass_125_Tiamant_Teach_1);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Ass_125_Tiamant_Teach_5);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Ass_125_Tiamant_TeachSTR_1);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Ass_125_Tiamant_TeachSTR_5);
};

func void DIA_Ass_125_Tiamant_Teach_BACK()
{
	if(other.attribute[ATR_DEXTERITY] > Tiamant_MerkeDEX)
	{
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_BACK_09_00");	//Как видишь, ты уже стал более ловким.
	};
	if(other.attribute[ATR_STRENGTH] > Tiamant_MerkeSTR)
	{
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_BACK_Add_09_00");	//(оценивающе) Очень хорошо. Ты стал куда сильнее.
	};
	Info_ClearChoices(DIA_Ass_125_Tiamant_Teach);
};

func void DIA_Ass_125_Tiamant_Teach_1()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,T_MEGA);
	Info_ClearChoices(DIA_Ass_125_Tiamant_Teach);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach,Dialog_Back,DIA_Ass_125_Tiamant_Teach_BACK);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Ass_125_Tiamant_Teach_1);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Ass_125_Tiamant_Teach_5);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Ass_125_Tiamant_TeachSTR_1);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Ass_125_Tiamant_TeachSTR_5);
};

func void DIA_Ass_125_Tiamant_Teach_5()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,T_MEGA);
	Info_ClearChoices(DIA_Ass_125_Tiamant_Teach);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach,Dialog_Back,DIA_Ass_125_Tiamant_Teach_BACK);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Ass_125_Tiamant_Teach_1);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Ass_125_Tiamant_Teach_5);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Ass_125_Tiamant_TeachSTR_1);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Ass_125_Tiamant_TeachSTR_5);
};

func void DIA_Ass_125_Tiamant_TeachSTR_1()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_MEGA);
	Info_ClearChoices(DIA_Ass_125_Tiamant_Teach);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach,Dialog_Back,DIA_Ass_125_Tiamant_Teach_BACK);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Ass_125_Tiamant_Teach_1);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Ass_125_Tiamant_Teach_5);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Ass_125_Tiamant_TeachSTR_1);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Ass_125_Tiamant_TeachSTR_5);
};

func void DIA_Ass_125_Tiamant_TeachSTR_5()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_MEGA);
	Info_ClearChoices(DIA_Ass_125_Tiamant_Teach);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach,Dialog_Back,DIA_Ass_125_Tiamant_Teach_BACK);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Ass_125_Tiamant_Teach_1);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Ass_125_Tiamant_Teach_5);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Ass_125_Tiamant_TeachSTR_1);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Ass_125_Tiamant_TeachSTR_5);
};

instance DIA_Ass_125_Tiamant_Teach_Weapon(C_Info)
{
	npc = Ass_125_Tiamant;
	nr = 7;
	condition = DIA_Ass_125_Tiamant_Teach_Weapon_Condition;
	information = DIA_Ass_125_Tiamant_Teach_Weapon_Info;
	permanent = TRUE;
	description = "Я хочу научиться искусству обращения с мечом.";
};

func int DIA_Ass_125_Tiamant_Teach_Weapon_Condition()
{
	if(TiamantTeachMe == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Ass_125_Tiamant_Teach_Weapon_Info()
{
	AI_Output(other,self,"DIA_Ass_125_Tiamant_Teach_Weapon_15_00");	//Я хочу научиться искусству обращения с мечом.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_Weapon_15_01");	//Без проблем.
	Info_ClearChoices(DIA_Ass_125_Tiamant_Teach_Weapon);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach_Weapon,Dialog_Back,DIA_Ass_125_Tiamant_Teach_Weapon_Back);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach_Weapon,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Ass_125_Tiamant_Teach_Weapon_2H_1);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach_Weapon,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Ass_125_Tiamant_Teach_Weapon_2H_5);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach_Weapon,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Ass_125_Tiamant_Teach_Weapon_1H_1);
	Info_AddChoice(DIA_Ass_125_Tiamant_Teach_Weapon,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Ass_125_Tiamant_Teach_Weapon_1H_5);
};

var int TiamantTellFirst;

func void B_TiamantTellFirst()
{
	if(TiamantTellFirst == FALSE)
	{
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_Desc_01_00");	//Сильный воин с мечом не просто бьет по своему противнику.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_Desc_01_01");	//Он угадывает позицию врага! Используй колебания всего тела, а не только руки.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_Desc_01_02");	//Постоянно держи противника в поле зрения.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_Desc_01_03");	//Одни удары можно блокировать, другие нет.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_Desc_01_04");	//Научись видеть разницу. Тогда ты сможешь уклониться от удара или даже предвосхитить его.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_Desc_01_05");	//Запомни это и используй в бою. Тогда проживешь подольше.
		TiamantTellFirst = TRUE;
	};
};

func void DIA_Ass_125_Tiamant_Teach_Weapon_Back()
{
	Info_ClearChoices(DIA_Ass_125_Tiamant_Teach_Weapon);
};

func void DIA_Ass_125_Tiamant_Teach_Weapon_1H_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,100))
	{
		if(TiamantTellFirst == FALSE)
		{
			B_TiamantTellFirst();
		};

		Info_ClearChoices(DIA_Ass_125_Tiamant_Teach_Weapon);
		Info_AddChoice(DIA_Ass_125_Tiamant_Teach_Weapon,Dialog_Back,DIA_Ass_125_Tiamant_Teach_Weapon_Back);
		Info_AddChoice(DIA_Ass_125_Tiamant_Teach_Weapon,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Ass_125_Tiamant_Teach_Weapon_2H_1);
		Info_AddChoice(DIA_Ass_125_Tiamant_Teach_Weapon,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Ass_125_Tiamant_Teach_Weapon_2H_5);
		Info_AddChoice(DIA_Ass_125_Tiamant_Teach_Weapon,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Ass_125_Tiamant_Teach_Weapon_1H_1);
		Info_AddChoice(DIA_Ass_125_Tiamant_Teach_Weapon,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Ass_125_Tiamant_Teach_Weapon_1H_5);
	};
};

func void DIA_Ass_125_Tiamant_Teach_Weapon_1H_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,100))
	{
		if(TiamantTellFirst == FALSE)
		{
			B_TiamantTellFirst();
		};

		Info_ClearChoices(DIA_Ass_125_Tiamant_Teach_Weapon);
		Info_AddChoice(DIA_Ass_125_Tiamant_Teach_Weapon,Dialog_Back,DIA_Ass_125_Tiamant_Teach_Weapon_Back);
		Info_AddChoice(DIA_Ass_125_Tiamant_Teach_Weapon,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Ass_125_Tiamant_Teach_Weapon_2H_1);
		Info_AddChoice(DIA_Ass_125_Tiamant_Teach_Weapon,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Ass_125_Tiamant_Teach_Weapon_2H_5);
		Info_AddChoice(DIA_Ass_125_Tiamant_Teach_Weapon,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Ass_125_Tiamant_Teach_Weapon_1H_1);
		Info_AddChoice(DIA_Ass_125_Tiamant_Teach_Weapon,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Ass_125_Tiamant_Teach_Weapon_1H_5);
	};
};

func void DIA_Ass_125_Tiamant_Teach_Weapon_2H_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,100))
	{
		if(TiamantTellFirst == FALSE)
		{
			B_TiamantTellFirst();
		};

		Info_ClearChoices(DIA_Ass_125_Tiamant_Teach_Weapon);
		Info_AddChoice(DIA_Ass_125_Tiamant_Teach_Weapon,Dialog_Back,DIA_Ass_125_Tiamant_Teach_Weapon_Back);
		Info_AddChoice(DIA_Ass_125_Tiamant_Teach_Weapon,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Ass_125_Tiamant_Teach_Weapon_2H_1);
		Info_AddChoice(DIA_Ass_125_Tiamant_Teach_Weapon,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Ass_125_Tiamant_Teach_Weapon_2H_5);
		Info_AddChoice(DIA_Ass_125_Tiamant_Teach_Weapon,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Ass_125_Tiamant_Teach_Weapon_1H_1);
		Info_AddChoice(DIA_Ass_125_Tiamant_Teach_Weapon,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Ass_125_Tiamant_Teach_Weapon_1H_5);
	};
};

func void DIA_Ass_125_Tiamant_Teach_Weapon_2H_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,100))
	{
		if(TiamantTellFirst == FALSE)
		{
			B_TiamantTellFirst();
		};

		Info_ClearChoices(DIA_Ass_125_Tiamant_Teach_Weapon);
		Info_AddChoice(DIA_Ass_125_Tiamant_Teach_Weapon,Dialog_Back,DIA_Ass_125_Tiamant_Teach_Weapon_Back);
		Info_AddChoice(DIA_Ass_125_Tiamant_Teach_Weapon,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Ass_125_Tiamant_Teach_Weapon_2H_1);
		Info_AddChoice(DIA_Ass_125_Tiamant_Teach_Weapon,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Ass_125_Tiamant_Teach_Weapon_2H_5);
		Info_AddChoice(DIA_Ass_125_Tiamant_Teach_Weapon,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Ass_125_Tiamant_Teach_Weapon_1H_1);
		Info_AddChoice(DIA_Ass_125_Tiamant_Teach_Weapon,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Ass_125_Tiamant_Teach_Weapon_1H_5);
	};
};

instance DIA_Ass_125_Tiamant_WhatAbout2X2(C_Info)
{
	npc = Ass_125_Tiamant;
	nr = 1;
	condition = dia_Ass_125_Tiamant_WhatAbout2X2_condition;
	information = dia_Ass_125_Tiamant_WhatAbout2X2_info;
	permanent = FALSE;
	description = "А могу ли я научиться чему-то особенному?";
};

func int dia_Ass_125_Tiamant_WhatAbout2X2_condition()
{
	if((TiamantTeachMe == TRUE) && ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (hero.guild == GIL_TPL)))
	{
		return TRUE;
	};
};

func void dia_Ass_125_Tiamant_WhatAbout2X2_info()
{
	AI_Output(other,self,"DIA_Ass_125_Tiamant_WhatAbout2X2_01_01");	//А могу ли я научиться чему-то особенному?
	AI_Output(self,other,"DIA_Ass_125_Tiamant_WhatAbout2X2_01_02");	//Да, конечно. Еще я могу показать тебе, как сражаться парным оружием.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_WhatAbout2X2_01_03");	//Однако сразу хочу предупредить, что овладение этой техникой боя потребует от тебя куда больше опыта и умений.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_WhatAbout2X2_01_04");	//Ибо только истинные мастера меча достойны обучаться ей!
	TiamantTeachMe2X2 = TRUE;
	Log_CreateTopic(TOPIC_PrioratTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_PrioratTeacher,"Приор Тиамант также может показать мне технику боя парным оружием, если я буду этого достоин.");
};

var int RuleTwoHands1H;
var int RuleTwoHands2H;
var int RuleTwoHandsDex;
var int RuleTwoHandsStr;

instance DIA_Ass_125_Tiamant_Teach_2X2(C_Info)
{
	npc = Ass_125_Tiamant;
	nr = 20;
	condition = DIA_Ass_125_Tiamant_Teach_2X2_Condition;
	information = DIA_Ass_125_Tiamant_Teach_2X2_Info;
	permanent = TRUE;
	description = "Я хочу научиться сражаться парным оружием.";
};

func int DIA_Ass_125_Tiamant_Teach_2X2_Condition()
{
	if((TiamantTeachMe2X2 == TRUE) && (TiamantTeachMe2X2_Done == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Ass_125_Tiamant_Teach_2X2_Info()
{
	AI_Output(other,self,"DIA_Ass_125_Tiamant_Teach_2X2_15_00");	//Я хочу научиться сражаться парным оружием.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_01");	//Хорошо. Но давай для начала посмотрим, что ты умеешь.

	if(other.attribute[ATR_DEXTERITY] >= 150)
	{
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_02");	//(оценивающе) Что же, ты действительно достоин овладеть этим знанием.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_03");	//Твои боевые умения и навыки вызывают во мне только чувство глубокого уважения.
		AI_Output(other,self,"DIA_Ass_125_Tiamant_Teach_2X2_15_04");	//Тогда научите меня!
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_05");	//(важно) Хорошо. Слушай меня внимательно.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_06");	//Секрет владения парным оружием кроется, прежде всего, в идеальном балансе.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_07");	//Это касается всего - твоего оружия, твоих движений, твоего стиля ведения боя.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_08");	//Но пойдем по порядку. Для начала надо уяснить, что не всякое оружие сгодится для парного боя.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_09");	//Твой меч в одной руке должен стать плавным продолжением меча в другой.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_10");	//Именно поэтому парные клинки, прежде всего, должны быть сродни друг другу как два брата-близнеца. 
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_11");	//Причем, надо отметить, что у каждого воина это чувство баланса свое.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_12");	//А следовательно, не ты должен подстраиваться под оружие, а оружие должно быть создано под тебя.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_13");	//Тем самым твои движения получаются более быстрыми и точными.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_14");	//Инерция удара одного меча влечет за собой обратную инерцию другого, что делает его удар еще более сильным.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_15");	//И что, в свою очередь, позволяет почти молниеносно проводить серию смертоносных ударов.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_16");	//Что же касается стиля ведения боя, то это вообще отдельная тема.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_17");	//Сражение парным оружием больше похоже на танец, нежели чем на какие-то отдельные движения.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_18");	//Одно следует из другого, что в свою очередь плавно перетекает в следующее движение. И так дальше.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_19");	//Вот, собственно, и все, что тебе следует знать о бое с парным оружием.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_20");	//Если ты сможешь соединить воедино все, о чем я только что тебе рассказал...
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_21");	//...то ты не будешь знать себе равных на поле боя!
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_22");	//А в довершении моих слов - вот, возьми этот свиток.
		B_GiveInvItems(self,other,ItWr_DualFight,1);
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_23");	//Тут ты найдешь последние пояснения для овладения этим искусством боя.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_24");	//Ну а дальше все зависит от тебя.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_25");	//Благодарю, мастер.
		TiamantTeachMe2X2_Done = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_26");	//(оценивающе) Нет! Ты еще не готов к этому.
		AI_Output(other,self,"DIA_Ass_125_Tiamant_Teach_2X2_15_27");	//Но почему, мастер?
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_28");	//Ты еще не так ловок, как следовало бы.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_32");	//Этого тебе достаточно?
		AI_Output(other,self,"DIA_Ass_125_Tiamant_Teach_2X2_15_33");	//Вполне.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_34");	//Вот-вот. Так что лучше ступай тренироваться.
		AI_Output(self,other,"DIA_Ass_125_Tiamant_Teach_2X2_15_35");	//Ибо только упорными тренировками ты сможешь овладеть этим знанием.

		if(RuleTwoHandsDex == FALSE)
		{
			B_LogEntry_Quiet(TOPIC_PrioratTeacher,"Я не слишком ловок для обучения боя парным оружием. (Требуется: 150 или более ловкости)");
			RuleTwoHandsDex = TRUE;
		};
	};
};

instance DIA_Ass_125_Tiamant_DualWeapon(C_Info)
{
	npc = Ass_125_Tiamant;
	nr = 20;
	condition = DIA_Ass_125_Tiamant_DualWeapon_Condition;
	information = DIA_Ass_125_Tiamant_DualWeapon_Info;
	permanent = FALSE;
	description = "Где мне найти парное оружие?";
};

func int DIA_Ass_125_Tiamant_DualWeapon_Condition()
{
	if(TiamantTeachMe2X2_Done == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Ass_125_Tiamant_DualWeapon_Info()
{
	AI_Output(other,self,"DIA_Ass_125_Tiamant_DualWeapon_01_00");	//Где мне найти парное оружие?
	AI_Output(self,other,"DIA_Ass_125_Tiamant_DualWeapon_01_01");	//У каждого мастера двух клинков оно свое. И тебе оно вряд ли подойдет.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_DualWeapon_01_02");	//Поэтому ты должен будешь сделать свое собственное оружие.
	AI_Output(other,self,"DIA_Ass_125_Tiamant_DualWeapon_01_03");	//Каким образом?
	AI_Output(self,other,"DIA_Ass_125_Tiamant_DualWeapon_01_04");	//Хммм... Извини, но этого я тебе подсказать не смогу.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_DualWeapon_01_05");	//Однако я слышал, что у приора Осаира есть один очень редкий рецепт изготовления легендарных лунных клинков.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_DualWeapon_01_06");	//Возможно, он поделится с тобой этим секретом.
	AI_Output(self,other,"DIA_Ass_125_Tiamant_DualWeapon_01_07");	//Если, конечно, ты будешь достаточно убедителен.
	MIS_MoonBlades = LOG_Running;
	Log_CreateTopic(TOPIC_MoonBlades,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MoonBlades,LOG_Running);
	B_LogEntry(TOPIC_MoonBlades,"Тиамант упомянул, что у приора Осаира есть редкие чертежи легендарного парного оружия - лунных клинков.");
};