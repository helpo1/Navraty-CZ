
instance DIA_KREOL_EXIT(C_Info)
{
	npc = none_102_kreol;
	nr = 999;
	condition = dia_kreol_exit_condition;
	information = dia_kreol_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_kreol_exit_condition()
{
	return TRUE;
};

func void dia_kreol_exit_info()
{
	if(MIS_FINDKREOL == LOG_Running)
	{
		B_GivePlayerXP(100);
		Log_SetTopicStatus(TOPIC_FINDKREOL,LOG_SUCCESS);
		MIS_FINDKREOL = LOG_SUCCESS;
	};

	AI_StopProcessInfos(self);
};

func void dia_kreol_hello_ext()
{
	AI_Output(other,self,"DIA_Kreol_Hello_14_67");	//Это мы еще посмотрим, кто из нас умрет!
	KREOL_KILL = TRUE;
	KREOL_WARN = TRUE;
	self.guild = GIL_DMT;
	Npc_SetTrueGuild(self,GIL_DMT);
	Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");

	if((other.guild == GIL_KDF) || (other.guild == GIL_KDW) || (other.guild == GIL_KDM) || (other.guild == GIL_GUR))
	{
		AI_Output(self,other,"DIA_Kreol_DemonLanguage_14_54");	//Из тебя получится отличный маг-скелет!
	}
	else
	{
		AI_Output(self,other,"DIA_Kreol_DemonLanguage_14_55");	//Из тебя получится отличный скелет-воин!
	};

	Snd_Play("MFX_FEAR_CAST");

	if(SBMODE == TRUE)
	{
		Wld_SpawnNpcRange(hero,skeleton_kreol_01,1,500);
		Wld_SpawnNpcRange(hero,skeleton_kreol_02,1,500);
		Wld_SpawnNpcRange(hero,skeleton_kreol_03,1,500);
	}
	else if(SBMODE == 2)
	{
		Wld_SpawnNpcRange(hero,skeleton_kreol_01,1,500);
		Wld_SpawnNpcRange(hero,skeleton_kreol_02,1,500);
	}
	else if(SBMODE == 4)
	{
		Wld_SpawnNpcRange(hero,skeleton_kreol_01,1,500);
	};

	Info_ClearChoices(dia_kreol_hello);
	Info_AddChoice(dia_kreol_hello,"(закончить разговор)",dia_kreol_hello_end_trans);
};

func void dia_kreol_noforever_ext()
{
	KREOL_KILL = TRUE;
	KREOL_WARN = TRUE;
	self.guild = GIL_DMT;
	Npc_SetTrueGuild(self,GIL_DMT);
	Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");

	if((other.guild == GIL_KDF) || (other.guild == GIL_KDW) || (other.guild == GIL_KDM) || (other.guild == GIL_GUR))
	{
		AI_Output(self,other,"DIA_Kreol_DemonLanguage_14_54");	//Из тебя получится отличный маг-скелет!
	}
	else
	{
		AI_Output(self,other,"DIA_Kreol_DemonLanguage_14_55");	//Из тебя получится отличный скелет-воин!
	};

	Snd_Play("MFX_FEAR_CAST");

	if(SBMODE == TRUE)
	{
		Wld_SpawnNpcRange(hero,skeleton_kreol_01,1,500);
		Wld_SpawnNpcRange(hero,skeleton_kreol_02,1,500);
		Wld_SpawnNpcRange(hero,skeleton_kreol_03,1,500);
	}
	else if(SBMODE == 2)
	{
		Wld_SpawnNpcRange(hero,skeleton_kreol_01,1,500);
		Wld_SpawnNpcRange(hero,skeleton_kreol_02,1,500);
	}
	else if(SBMODE == 4)
	{
		Wld_SpawnNpcRange(hero,skeleton_kreol_01,1,500);
	};

	Info_ClearChoices(dia_kreol_hello);
	Info_AddChoice(dia_kreol_hello,"(закончить разговор)",dia_kreol_hello_end_trans);
};

func void dia_kreol_demonlanguage_ext()
{
	AI_Output(other,self,"DIA_Kreol_DemonLanguage_14_53");	//Больно будет сейчас тебе!
	KREOL_KILL = TRUE;
	KREOL_WARN = TRUE;
	self.guild = GIL_DMT;
	Npc_SetTrueGuild(self,GIL_DMT);
	Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");

	if((other.guild == GIL_KDF) || (other.guild == GIL_KDW) || (other.guild == GIL_KDM) || (other.guild == GIL_GUR))
	{
		AI_Output(self,other,"DIA_Kreol_DemonLanguage_14_54");	//Из тебя получится отличный маг-скелет!
	}
	else
	{
		AI_Output(self,other,"DIA_Kreol_DemonLanguage_14_55");	//Из тебя получится отличный скелет-воин!
	};

	Snd_Play("MFX_FEAR_CAST");

	if(SBMODE == TRUE)
	{
		Wld_SpawnNpcRange(hero,skeleton_kreol_01,1,500);
		Wld_SpawnNpcRange(hero,skeleton_kreol_02,1,500);
		Wld_SpawnNpcRange(hero,skeleton_kreol_03,1,500);
	}
	else if(SBMODE == 2)
	{
		Wld_SpawnNpcRange(hero,skeleton_kreol_01,1,500);
		Wld_SpawnNpcRange(hero,skeleton_kreol_02,1,500);
	}
	else if(SBMODE == 4)
	{
		Wld_SpawnNpcRange(hero,skeleton_kreol_01,1,500);
	};

	Info_ClearChoices(dia_kreol_hello);
	Info_AddChoice(dia_kreol_hello,"(закончить разговор)",dia_kreol_hello_end_trans);
};

func void dia_kreol_hello_end_trans()
{
	AI_StopProcessInfos(self);
};

instance DIA_KREOL_HELLO(C_Info)
{
	npc = none_102_kreol;
	nr = 1;
	condition = dia_kreol_hello_condition;
	information = dia_kreol_hello_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_kreol_hello_condition()
{
	return TRUE;
};

func void dia_kreol_hello_info()
{
	Npc_ExchangeRoutine(self,"KreolRoutine");
	AI_Output(self,other,"DIA_Kreol_Hello_14_00");	//КТО ПОСМЕЛ ОТВЛЕЧЬ МЕНЯ ОТ МОИХ ИССЛЕДОВАНИЙ?
	AI_Output(self,other,"DIA_Kreol_Hello_14_03");	//Как ты смог попасть сюда?!
	AI_Output(other,self,"DIA_Kreol_Hello_14_04");	//Не скажу, что это было легко. Это место просто кишело нежитью!
	AI_Output(self,other,"DIA_Kreol_Hello_14_05");	//То были мои слуги, и я очень удивлен, что ты до сих пор жив.
	AI_Output(other,self,"DIA_Kreol_Hello_14_06");	//Ты некромант?
	AI_Output(self,other,"DIA_Kreol_Hello_14_08");	//(раздраженно) Да! Что тебе от меня нужно?

	if(MIS_FINDKREOL == LOG_Running)
	{
		B_GivePlayerXP(100);
		Log_SetTopicStatus(TOPIC_FINDKREOL,LOG_SUCCESS);
		B_LogEntry(TOPIC_FINDKREOL,"Я все-таки отыскал Креола. Похоже, он неплохо обосновался в старой Башне Туманов. Пришлось постараться, чтобы попасть к нему на прием. Похоже, Креол очень ценит свой покой и уединение.");
		MIS_FINDKREOL = LOG_SUCCESS;
	};

	Wld_InsertNpc(Demon,"OW_FOGDUNGEON_36_MOVEMENT2");

	if(XARDASTELLABOUTKREOL == TRUE)
	{
		Info_AddChoice(dia_kreol_hello,"Думаю, наша встреча не случайна.",dia_kreol_hello_prophecy);
	};
	if((TASKFINDDARKSOUL == TRUE) && (MIS_GOLDDRAGONPORTAL == LOG_Running) && (TELLABOUTDS == FALSE))
	{
		Info_AddChoice(dia_kreol_hello,"Мне нужна твоя помощь, некромант.",dia_kreol_hello_mora);
	};
	if(other.guild == GIL_KDM)
	{
		Info_AddChoice(dia_kreol_hello,"Я ищу учителя темной магии, мастер.",dia_kreol_hello_teach);
	};

	Info_AddChoice(dia_kreol_hello,"Я пришел убить тебя!",dia_kreol_hello_kill);
	Info_AddChoice(dia_kreol_hello,"Тебя это мало касается.",dia_kreol_hello_fuckoff);

	if(RhetorikSkillValue[1] >= 40)
	{
		Info_AddChoice(dia_kreol_hello,"Я не хотел помешать твоему уединению.",dia_kreol_hello_sorry);
	};

	Info_AddChoice(dia_kreol_hello,"Я случайно здесь оказался.",dia_kreol_hello_dontknow);
};

func void dia_kreol_hello_mora()
{
	AI_Output(other,self,"DIA_Kreol_Hello_Mora_01_00");	//Мне нужна твоя помощь.
	AI_Output(self,other,"DIA_Kreol_Hello_Mora_01_02");	//Назови хотя бы одну причину, почему я должен помогать тебе...
	AI_Output(self,other,"DIA_Kreol_Hello_Mora_01_03");	//...вместо того, чтобы размазать тебя по стенке, наглый червь!
	AI_Output(other,self,"DIA_Kreol_Hello_Mora_01_04");	//С'эньяк!
	AI_Output(self,other,"DIA_Kreol_Hello_Mora_01_06");	//(задумался) Ну что же, действительно, эта причина могла привести тебя именно ко мне.
	AI_Output(self,other,"DIA_Kreol_Hello_Mora_01_07");	//Хорошо! Задавай свои вопросы.
	Info_ClearChoices(dia_kreol_hello);
};

func void dia_kreol_hello_teach()
{
	AI_Output(other,self,"DIA_Kreol_Hello_Teach_01_00");	//Я ищу учителя темной магии, мастер.
	AI_Output(self,other,"DIA_Kreol_Hello_Teach_01_01");	//Ха ха ха! (смеется)
	AI_Output(self,other,"DIA_Kreol_Hello_Teach_01_02");	//И почему же ты думаешь, что я буду учить тебя?
	AI_Output(other,self,"DIA_Kreol_Hello_Teach_01_03");	//Как видишь, я тоже некромант, но я еще не постиг всей сути темной магии.
	if(Kapitel >= 5)
	{
		AI_Output(other,self,"DIA_Kreol_Hello_Teach_01_04");	//К тому же мой бывший учитель бесследно исчез, и я...
		AI_Output(self,other,"DIA_Kreol_Hello_Teach_01_05");	//(перебивая) А кто был раньше твоим учителем?
	}
	else
	{
		AI_Output(self,other,"DIA_Kreol_Hello_Teach_01_06");	//(перебивая) А кто был раньше твоим учителем?
	};
	AI_Output(other,self,"DIA_Kreol_Hello_Teach_01_08");	//Ксардас!
	AI_Output(self,other,"DIA_Kreol_Hello_Teach_01_09");	//Ксардас...
	AI_Output(self,other,"DIA_Kreol_Hello_Teach_01_10");	//Ну, если Ксардас учил тебя, это уже кое-что значит.
	AI_Output(self,other,"DIA_Kreol_Hello_Teach_01_11");	//Он не берет в ученики кого попало!
	AI_Output(other,self,"DIA_Kreol_Hello_Teach_01_13");	//Так ты будешь моим наставником?
	AI_Output(self,other,"DIA_Kreol_Hello_Teach_01_23");	//Хорошо! Я приму тебя в ученики, и ты будешь обучаться у меня искусству темной магии.
	AI_Output(self,other,"DIA_Kreol_Hello_Teach_01_26");	//Надеюсь, я не пожалею о своем решении.
	AI_Output(self,other,"DIA_Kreol_Hello_Teach_01_27");	//А теперь иди займись чем-нибудь полезным!
	Info_ClearChoices(dia_kreol_hello);
	Log_CreateTopic(TOPIC_ADDON_DMTTEACHER,LOG_NOTE);
	B_LogEntry(TOPIC_ADDON_DMTTEACHER,"Креол научит меня создавать руны некромантов, поможет освоить магические круги и повысит мою магическую силу.");
	KREOL_MYTEACHER = TRUE;
};

func void dia_kreol_hello_prophecy()
{
	AI_Output(other,self,"DIA_Kreol_Hello_14_52");	//Наша встреча не случайна.
	AI_Output(self,other,"DIA_Kreol_Hello_14_55");	//Кто рассказал тебе обо мне?!
	AI_Output(other,self,"DIA_Kreol_Hello_14_56");	//Ксардас!
	AI_Output(self,other,"DIA_Kreol_Hello_14_57");	//Ксардас? Я вспомнил его. Он бывший маг Огня!

	if(other.guild == GIL_KDM)
	{
		AI_Output(other,self,"DIA_Kreol_Hello_14_61");	//Ксардас мой наставник. Как ты заметил, я также принадлежу к кругу темных магов.
		AI_Output(self,other,"DIA_Kreol_Hello_14_63");	//Значит, ты тоже некромант...(вдумчиво) Ты выбрал трудный путь, хотя, возможно, даже и не представляешь, насколько трудный.	
	};

	AI_Output(self,other,"DIA_Kreol_Hello_14_65");	//Но довольно! Хватит пустой болтовни. Если ты встречи со мной, то считай, что ты ее нашел и я перед тобой!
	AI_Output(self,other,"DIA_Kreol_Hello_14_66");	//Говори, что тебе нужно от меня?
	Info_ClearChoices(dia_kreol_hello);
};

func void dia_kreol_hello_kill()
{
	AI_Output(other,self,"DIA_Kreol_Hello_14_10");	//Я пришел убить тебя!

	if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
	{
		if(other.guild == GIL_PAL)
		{
			AI_Output(other,self,"DIA_Kreol_Hello_14_11");	//Как слуги Инноса, моя святая обязанность истреблять порождения Тьмы, подобные тебе!
			AI_Output(self,other,"DIA_Kreol_Hello_14_14");	//Ты посмел бросить вызов МНЕ - одному из избранных Белиара, и это станет твоей последней ошибкой!
			AI_Output(self,other,"DIA_Kreol_Hello_14_15");	//Умри, жалкий червь!
		}
		else
		{
			AI_Output(other,self,"DIA_Kreol_Hello_14_16");	//Как слуги Инноса, моя святая обязанность истреблять порождения Тьмы, подобные тебе!
			AI_Output(self,other,"DIA_Kreol_Hello_14_19");	//Ты посмел бросить вызов МНЕ - одному из избранных Белиара, и это станет твоей последней ошибкой!
			AI_Output(self,other,"DIA_Kreol_Hello_14_20");	//Иннос не поможет тебе! Умри, жалкий червь!
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Kreol_Hello_14_22");	//Ты посмел бросить вызов МНЕ - одному из избранных Белиара, и это станет твоей последней ошибкой!
		AI_Output(self,other,"DIA_Kreol_Hello_14_23");	//Сейчас ты умрешь, и твое тело до скончания времен будет служить мне в виде бездушной нежити!
		AI_Output(self,other,"DIA_Kreol_Hello_14_24");	//Умри, жалкий червь!
	};
	AI_ReadyMeleeWeapon(other);
	Info_ClearChoices(dia_kreol_hello);
	Info_AddChoice(dia_kreol_hello,"Это мы еще посмотрим, кто из нас умрет.",dia_kreol_hello_ext);
};

func void dia_kreol_hello_fuckoff()
{
	AI_Output(other,self,"DIA_Kreol_Hello_14_25");	//Тебя это не касается!
	AI_Output(self,other,"DIA_Kreol_Hello_14_26");	//(злобно) Похоже, ты так и не понял, с кем имеешь дело!
	AI_Output(self,other,"DIA_Kreol_Hello_14_30");	//Сейчас я тебе это объясню. Умри, жалкий червь!
	AI_ReadyMeleeWeapon(other);
	Info_ClearChoices(dia_kreol_hello);
	Info_AddChoice(dia_kreol_hello,"Это мы еще посмотрим, кто из нас умрет.",dia_kreol_hello_ext);
};

func void dia_kreol_hello_dontknow()
{
	AI_Output(other,self,"DIA_Kreol_Hello_14_31");	//Я случайно здесь оказался.
	AI_Output(self,other,"DIA_Kreol_Hello_14_33");	//Я очень ценю свой покой и уединение. И ненавижу, когда в мои владения вторгаются непрошеные гости!
	AI_Output(self,other,"DIA_Kreol_Hello_14_34");	//Сейчас я тебе это объясню. Умри, жалкий червь!
	AI_ReadyMeleeWeapon(other);
	Info_ClearChoices(dia_kreol_hello);
	Info_AddChoice(dia_kreol_hello,"Это мы еще посмотрим, кто из нас умрет.",dia_kreol_hello_ext);
};

func void dia_kreol_hello_sorry()
{
	AI_Output(other,self,"DIA_Kreol_Hello_14_40");	//Я и понятия не имел, что кроме нежити тут кто-то есть.
	AI_Output(self,other,"DIA_Kreol_Hello_14_43");	//Никто не смеет нарушать мой покой и вторгаться сюда без приглашения!
	AI_Output(self,other,"DIA_Kreol_Hello_14_45");	//Но я дам тебе шанс исчезнуть отсюда и сохраню тебе жизнь.
	AI_Output(self,other,"DIA_Kreol_Hello_14_50");	//Так что лучше тебе убраться с глаз моих, пока я передумал!
	AI_Output(self,other,"DIA_Kreol_Hello_14_51");	//И запомни: при следующей нашей встрече я убью тебя! Пошел вон!
	KREOL_WARN = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_KREOL_NOFOREVER(C_Info)
{
	npc = none_102_kreol;
	nr = 5;
	condition = dia_kreol_noforever_condition;
	information = dia_kreol_noforever_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_kreol_noforever_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (KREOL_WARN == TRUE))
	{
		return TRUE;
	};
};

func void dia_kreol_noforever_info()
{
	if((XARDASTELLABOUTKREOL == TRUE) && (KREOL_KILL == FALSE))
	{
		if(other.guild == GIL_KDM)
		{
			AI_Output(self,other,"DIA_Kreol_NoForever_01_00");	//Так-так. Как я вижу, ты стал некромантом! И кто же посвятил тебя в круг темных магов?
			AI_Output(other,self,"DIA_Kreol_NoForever_01_01");	//Ксардас!
		}
		else
		{
			AI_Output(self,other,"DIA_Kreol_NoForever_01_02");	//Ты испытываешь мое терпение! Кажется, я велел тебе убираться отсюда!
			AI_Output(other,self,"DIA_Kreol_NoForever_01_03");	//Меня прислал Ксардас.
		};

		AI_Output(self,other,"DIA_Kreol_NoForever_01_04");	//Ксардас? Я вспомнил его. Он бывший маг Огня!

		if(other.guild == GIL_KDM)
		{
			AI_Output(self,other,"DIA_Kreol_NoForever_01_08");	//Значит, ты тоже некромант...(вдумчиво) Ты выбрал трудный путь, хотя, возможно, даже и не представляешь, насколько трудный.
		};
		AI_Output(self,other,"DIA_Kreol_NoForever_01_10");	//Но хватит об этом! Говори, что теперь тебе нужно от меня?
	}
	else if((TASKFINDDARKSOUL == TRUE) && (MIS_GOLDDRAGONPORTAL == LOG_Running) && (TELLABOUTDS == FALSE) && (XARDASTELLABOUTKREOL == FALSE) && (KREOL_KILL == FALSE))
	{
		AI_Output(self,other,"DIA_Kreol_NoForever_01_13");	//Ты испытываешь мое терпение! Кажется, я велел тебе убираться отсюда!
		AI_Output(other,self,"DIA_Kreol_NoForever_01_14");	//Мне нужна твоя помощь.
		AI_Output(self,other,"DIA_Kreol_NoForever_01_16");	//Назови хотя бы одну причину, почему я должен помогать тебе...
		AI_Output(self,other,"DIA_Kreol_NoForever_01_17");	//...вместо того, чтобы размазать тебя по стенке, жалкий червь!
		AI_Output(other,self,"DIA_Kreol_NoForever_01_18");	//С'эньяк!
		AI_Output(self,other,"DIA_Kreol_NoForever_01_20");	//(задумался) Ну что же, действительно, эта причина могла привести тебя именно ко мне.
		AI_Output(self,other,"DIA_Kreol_NoForever_01_21");	//Хорошо! Задавай свои вопросы.
		Info_ClearChoices(dia_kreol_noforever);
	}
	else if((other.guild == GIL_KDM) && (XARDASTELLABOUTKREOL == FALSE) && (KREOL_KILL == FALSE))
	{
		AI_Output(self,other,"DIA_Kreol_NoForever_01_22");	//Так-так. Как я вижу, ты стал некромантом! И кто же посвятил тебя в круг темных магов?
		AI_Output(other,self,"DIA_Kreol_NoForever_01_22a");	//Ксардас!
		AI_Output(self,other,"DIA_Kreol_NoForever_01_23");	//Ксардас...
		AI_Output(self,other,"DIA_Kreol_NoForever_01_25");	//Он не берет в ученики кого попало!
		AI_Output(other,self,"DIA_Kreol_NoForever_01_26");	//Как видишь, я тоже некромант, но я еще не постиг всей сути темной магии.
		AI_Output(other,self,"DIA_Kreol_NoForever_01_29");	//Ты будешь моим наставником?
		AI_Output(self,other,"DIA_Kreol_NoForever_01_36");	//Хорошо! Я приму тебя в ученики, и ты будешь обучаться у меня искусству темной магии.
		AI_Output(self,other,"DIA_Kreol_NoForever_01_40");	//Надеюсь, я не пожалею о своем решении.
		AI_Output(self,other,"DIA_Kreol_NoForever_01_41");	//А теперь иди займись чем-нибудь полезным!
		Info_ClearChoices(dia_kreol_noforever);
		Log_CreateTopic(TOPIC_ADDON_DMTTEACHER,LOG_NOTE);
		B_LogEntry(TOPIC_ADDON_DMTTEACHER,"Креол научит меня создавать руны некромантов, поможет освоить магические круги и повысит мою магическую силу.");
		KREOL_MYTEACHER = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Kreol_NoForever_01_11");	//Ты испытываешь мое терпение! Кажется, я велел тебе убираться отсюда!
		AI_Output(self,other,"DIA_Kreol_NoForever_01_12");	//Зря ты не последовал моему совету. Теперь ты умрешь!!!
		Info_ClearChoices(dia_kreol_noforever);
		Info_AddChoice(dia_kreol_noforever,"Эй, постой!",dia_kreol_noforever_ext);
	};
};


instance DIA_KREOL_DEMONLANGUAGE(C_Info)
{
	npc = none_102_kreol;
	nr = 5;
	condition = dia_kreol_demonlanguage_condition;
	information = dia_kreol_demonlanguage_info;
	important = FALSE;
	permanent = FALSE;
	description = "Что ты знаешь про язык демонов Лэнга?";
};

func int dia_kreol_demonlanguage_condition()
{
	if(XARDASTELLABOUTKREOL == TRUE)
	{
		return TRUE;
	};
};

func void dia_kreol_demonlanguage_info()
{
	AI_Output(other,self,"DIA_Kreol_DemonLanguage_01_00");	//Что ты знаешь про язык демонов Лэнга?
	AI_Output(self,other,"DIA_Kreol_DemonLanguage_01_01");	//О, это редкий дар! Не многие обладают этим знанием, но те, кто посвящен в эту тайну, могут достичь небывалых для себя высот в познании темной магии.
	AI_Output(self,other,"DIA_Kreol_DemonLanguage_01_03");	//Большинство темных фолиантов и манускриптов написано именно на этом языке.
	AI_Output(self,other,"DIA_Kreol_DemonLanguage_01_04");	//В них содержится мудрость, которую даровал нам Белиар. Но лишь избранные достойны чести постигать эту мудрость!
	AI_Output(self,other,"DIA_Kreol_DemonLanguage_01_05");	//Но скажи мне, почему ты интересуешься этим?
	AI_Output(other,self,"DIA_Kreol_DemonLanguage_01_06");	//Я бы хотел изучить этот древний язык. Ты можешь мне в этом помочь?
	AI_Output(self,other,"DIA_Kreol_DemonLanguage_01_08");	//Назови мне хотя бы одну причину, почему я должен передать тебе эти знания?
	Info_AddChoice(dia_kreol_demonlanguage,"Если ты этого не сделаешь - я убью тебя!",dia_kreol_demonlanguage_kill);
	Info_AddChoice(dia_kreol_demonlanguage,"Ксардас сказал, что ты мне поможешь в этом.",dia_kreol_demonlanguage_xardas);
	Info_AddChoice(dia_kreol_demonlanguage,"Без этого я не смогу пройти испытание Хранителей!",dia_kreol_demonlanguage_guardian);
	Info_AddChoice(dia_kreol_demonlanguage,"Мне очень нужно это.",dia_kreol_demonlanguage_need);
	Info_AddChoice(dia_kreol_demonlanguage,"Хочу убедиться в твоем могуществе.",dia_kreol_demonlanguage_knowledge);
};

func void dia_kreol_demonlanguage_kill()
{
	AI_Output(other,self,"DIA_Kreol_DemonLanguage_01_09");	//Потому, что, если ты этого не сделаешь, - я убью тебя!
	AI_Output(self,other,"DIA_Kreol_DemonLanguage_01_10");	//Как смело и безрассудно! Мне это даже нравится!
	AI_Output(self,other,"DIA_Kreol_DemonLanguage_01_11");	//Но твоя дерзость не может остаться безнаказанной!
	AI_Output(self,other,"DIA_Kreol_DemonLanguage_01_12");	//Приготовься узнать боль, какую еще не испытывал, храбрец!
	AI_ReadyMeleeWeapon(other);
	Info_ClearChoices(dia_kreol_demonlanguage);
	Info_AddChoice(dia_kreol_demonlanguage,"Больно будет сейчас тебе.",dia_kreol_demonlanguage_ext);
};

func void dia_kreol_demonlanguage_xardas()
{
	AI_Output(other,self,"DIA_Kreol_DemonLanguage_01_13");	//Ксардас сказал, что ты мне поможешь в этом.
	AI_Output(self,other,"DIA_Kreol_DemonLanguage_01_14");	//Ксардас?! С каких это пор Ксардас начал отдавать мне приказания?
	AI_Output(self,other,"DIA_Kreol_DemonLanguage_01_15");	//Пусть сам учит тебя!
	AI_Output(self,other,"DIA_Kreol_DemonLanguage_01_17");	//А теперь убирайся с глаз моих и не смей больше появляться здесь!
	KREOL_WARN = TRUE;
	KREOL_KILL = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_kreol_demonlanguage_guardian()
{
	AI_Output(other,self,"DIA_Kreol_DemonLanguage_01_1A");	//Без этого я не смогу пройти испытание Хранителей!
	AI_Output(self,other,"DIA_Kreol_DemonLanguage_01_18");	//Хранителей?
	AI_Output(self,other,"DIA_Kreol_DemonLanguage_01_19");	//Я не стану помогать тому, кто выбрал дорогу Хранителя Стихий!
	AI_Output(self,other,"DIA_Kreol_DemonLanguage_01_20");	//Можешь забыть об этом. Он меня ты не получишь даже и крупицы этих знаний!
	AI_Output(self,other,"DIA_Kreol_DemonLanguage_01_21");	//А теперь убирайся с глаз моих и не смей больше появляться здесь!
	KREOL_WARN = TRUE;
	KREOL_KILL = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_kreol_demonlanguage_need()
{
	AI_Output(other,self,"DIA_Kreol_DemonLanguage_01_22");	//Это для моего друга Мада. Я познакомился с ним в колонии...
	AI_Output(self,other,"DIA_Kreol_DemonLanguage_01_23");	//Что за бред ты несешь?
	AI_Output(self,other,"DIA_Kreol_DemonLanguage_01_27");	//Проваливай! И больше не смей появляться здесь!
	KREOL_WARN = TRUE;
	KREOL_KILL = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_kreol_demonlanguage_knowledge()
{
	AI_Output(other,self,"DIA_Kreol_DemonLanguage_01_28");	//Я хочу убедиться в твоем могуществе.
	AI_Output(other,self,"DIA_Kreol_DemonLanguage_01_29");	//Прав ли был Ксардас, говоря, что только очень могущественный маг вроде тебя смог бы помочь мне обрести эти знания?
	AI_Output(self,other,"DIA_Kreol_DemonLanguage_01_32");	//Жалкий червь, да как ты смеешь, сомневаться в моем могуществе?!
	AI_Output(self,other,"DIA_Kreol_DemonLanguage_01_34");	//(гордо) Я был избран самим Белиаром! В моих жилах течет сила Бога Тьмы!
	AI_Output(other,self,"DIA_Kreol_DemonLanguage_01_35");	//Это все лишь слова - не более того.
	AI_Output(self,other,"DIA_Kreol_DemonLanguage_01_36");	//ЧТО?! Ты все еще сомневаешься в этом? Глупец!
	if(other.guild == GIL_KDM)
	{
		AI_Output(self,other,"DIA_Kreol_DemonLanguage_01_44");	//Хотя чего еще ожидать от ученика этого Ксардаса? (смеется)
	}
	else
	{
		AI_Output(self,other,"DIA_Kreol_DemonLanguage_01_45");	//Еще немного - и ты бы убедился в этом - ценой своей собственной жизни!
	};
	AI_Output(other,self,"DIA_Kreol_DemonLanguage_01_46");	//Так ты научишь меня языку демонов?
	AI_Output(self,other,"DIA_Kreol_DemonLanguage_01_47");	//(думает) Хммм...
	AI_Output(self,other,"DIA_Kreol_DemonLanguage_01_48");	//Хорошо, я открою тебе эту священную тайну! Но только не думай, что я это делаю из-за того, что ты сомневаешься в моем могуществе.
	KREOL_TEACHDEMONLANG = TRUE;
	Info_ClearChoices(dia_kreol_demonlanguage);
};


instance DIA_KREOL_DEMONLANGUAGETELL(C_Info)
{
	npc = none_102_kreol;
	nr = 5;
	condition = dia_kreol_demonlanguagetell_condition;
	information = dia_kreol_demonlanguagetell_info;
	important = FALSE;
	permanent = FALSE;
	description = "Расскажи мне про язык Демонов Лэнга.";
};


func int dia_kreol_demonlanguagetell_condition()
{
	if(KREOL_TEACHDEMONLANG == TRUE)
	{
		return TRUE;
	};
};

func void dia_kreol_demonlanguagetell_info()
{
	AI_Output(other,self,"DIA_Kreol_DemonLanguageTell_01_00");	//Расскажи мне про язык демонов Лэнга.
	AI_Output(self,other,"DIA_Kreol_DemonLanguageTell_01_03");	//Его ценность заключается в том, что самые сокровенные тайны, уходящие своими корнями ко временам создания этого мира, написаны именно на этом языке.
	AI_Output(self,other,"DIA_Kreol_DemonLanguageTell_01_04");	//Каждый из этих текстов - настоящее сокровище, если понять его смысл.
	AI_Output(self,other,"DIA_Kreol_DemonLanguageTell_01_05");	//Кроме того, это язык Темного бога! Все существа, сотворенные Белиаром и подвластные ему, способны понимать этот язык.
	AI_Output(other,self,"DIA_Kreol_DemonLanguageTell_01_07");	//А что такое Лэнг?
	AI_Output(self,other,"DIA_Kreol_DemonLanguageTell_01_08");	//Лэнг это царство демонов. Он является частью Мордрага, обители Темного бога.
	AI_Output(self,other,"DIA_Kreol_DemonLanguageTell_01_09");	//Многие из демонов Лэнга также служат Темному богу. Но есть и такие, над которыми Белиар не имеет власти.
	AI_Output(self,other,"DIA_Kreol_DemonLanguageTell_01_10");	//Как например, легион Элигора, повелителя демонов Лэнга!
};


instance DIA_KREOL_DEMONLANGUAGETEACH(C_Info)
{
	npc = none_102_kreol;
	nr = 5;
	condition = dia_kreol_demonlanguageteach_condition;
	information = dia_kreol_demonlanguageteach_info;
	important = FALSE;
	permanent = TRUE;
	description = "Научи меня языку демонов. (Очки обучения: 10, Цена: 2000 монет)";
};


func int dia_kreol_demonlanguageteach_condition()
{
	if((KREOL_TEACHDEMONLANG == TRUE) && (KNOWDEMENTORLANGUAGE == FALSE))
	{
		return TRUE;
	};
};

func void dia_kreol_demonlanguageteach_info()
{
	AI_Output(other,self,"DIA_Kreol_DemonLanguageTeach_01_00");	//Научи меня языку демонов.

	if(B_TeachPlayerTalentForeignLanguage(self,other,LANGUAGE_4))
	{
		Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
		Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
		Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
		AI_PlayAni(self,"T_PRACTICEMAGIC5");
		AI_Output(self,other,"DIA_Kreol_DemonLanguageTeach_01_01");	//Познай же силу и могущество этого знания!
		AI_Output(self,other,"DIA_Kreol_DemonLanguageTeach_01_02");	//Черпай в нем мудрость, дарованную нам Белиаром - повелителем багровой Тьмы! Овладей тем сокровищем, что доступно лишь избранным.
		AI_Output(self,other,"DIA_Kreol_DemonLanguageTeach_01_03");	//Да будет так!
		KNOWDEMENTORLANGUAGE = TRUE;
	};
};

instance DIA_KREOL_PERM(C_Info)
{
	npc = none_102_kreol;
	nr = 1;
	condition = dia_kreol_perm_condition;
	information = dia_kreol_perm_info;
	permanent = TRUE;
	description = "Как дела на магическом фронте?";
};

func int dia_kreol_perm_condition()
{
	if((KREOLGURD == 0) && (KREOL_KILL == FALSE))
	{
		return TRUE;
	};
};

func void dia_kreol_perm_info()
{
	AI_Output(other,self,"DIA_Kreol_PERM_15_00");	//Как дела на магическом фронте?
	AI_Output(self,other,"DIA_Kreol_PERM_04_01");	//Не твоего ума дело!
};

var int KreolBuyWeap;

instance DIA_KREOL_XARDASMISS(C_Info)
{
	npc = none_102_kreol;
	nr = 5;
	condition = dia_kreol_xardasmiss_condition;
	information = dia_kreol_xardasmiss_info;
	important = FALSE;
	permanent = FALSE;
	description = "Ксардас исчез!";
};

func int dia_kreol_xardasmiss_condition()
{
	if((hero.guild == GIL_KDM) && (XARDAS_MISS == TRUE))
	{
		return TRUE;
	};
};

func void dia_kreol_xardasmiss_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Kreol_XardasMiss_01_00");	//Ксардас исчез!
	AI_Output(self,other,"DIA_Kreol_XardasMiss_01_01");	//Что?! Что еще задумал этот хитрец?
	AI_Output(other,self,"DIA_Kreol_XardasMiss_01_02");	//Я думал, ты знаешь причину.
	AI_Output(self,other,"DIA_Kreol_XardasMiss_01_03");	//Откуда же мне знать это?
	AI_Output(self,other,"DIA_Kreol_XardasMiss_01_04");	//Но его исчезновение - очень, очень странно...
	KreolBuyWeap = TRUE;

	if(KREOL_MYTEACHER == FALSE)
	{
		AI_Output(other,self,"DIA_Kreol_XardasMiss_01_05");	//Теперь я лишился возможности продолжить свое обучение темной магии.
		AI_Output(self,other,"DIA_Kreol_XardasMiss_01_06");	//И что с того?
		AI_Output(other,self,"DIA_Kreol_XardasMiss_01_07");	//Я еще не постиг всей сути темной магии. Ты будешь моим наставником?
		AI_Output(self,other,"DIA_Kreol_XardasMiss_01_08");	//Хм... Хорошо! Я приму тебя в свои ученики и ты будешь обучаться у меня искусству темной магии.
		AI_Output(self,other,"DIA_Kreol_XardasMiss_01_20");	//Надеюсь, я не пожалею о своем решении.
		AI_Output(self,other,"DIA_Xardas_CanBeNecromOk_Yes_01_08");	//И вот еще что. Раз ты теперь мой ученик, прими это кольцо.
		B_GiveInvItems(self,other,ITRI_KREOLPLACE,1);
		AI_Output(self,other,"DIA_Xardas_CanBeNecromOk_Yes_01_09");	//Оно позволит тебе оказаться в этой башне быстрее, чем ты можешь себе представить.
		AI_Output(self,other,"DIA_Kreol_XardasMiss_01_21");	//А теперь иди и займись чем-нибудь полезным!
		Log_CreateTopic(TOPIC_ADDON_DMTTEACHER,LOG_NOTE);
		B_LogEntry(TOPIC_ADDON_DMTTEACHER,"Креол научит меня создавать руны некромантов, поможет освоить магические круги и повысит мою магическую силу.");
		KREOL_MYTEACHER = TRUE;
	};
};

instance DIA_KREOL_TRADE(C_Info)
{
	npc = none_102_kreol;
	nr = 99;
	condition = dia_kreol_trade_condition;
	information = dia_kreol_trade_info;
	trade = TRUE;
	permanent = TRUE;
	description = "Покажи мне свои магические свитки.";
};

func int dia_kreol_trade_condition()
{
	if(KREOL_MYTEACHER == TRUE)
	{
		return TRUE;
	};
	if((CHOOSEDARK == TRUE) && ((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR)))
	{
		return TRUE;
	};
};

func void dia_kreol_trade_info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Kreol_Trade_01_01");	//Покажи мне свои магические свитки.

	if((Kapitel == 5) && (KREOLGIVEFIVECHAPTERSPELLS == FALSE))
	{
		CreateInvItems(self,itwr_addon_runemaking_dmt_circ1,1);
		CreateInvItems(self,itwr_addon_runemaking_dmt_circ2,1);
		CreateInvItems(self,itwr_addon_runemaking_dmt_circ3,1);
		CreateInvItems(self,itwr_addon_runemaking_dmt_circ4,1);
		CreateInvItems(self,itwr_addon_runemaking_dmt_circ5,1);
		CreateInvItems(self,itwr_addon_runemaking_dmt_circ6,1);
		CreateInvItems(self,ItMi_RuneBlank,2);
		CreateInvItems(self,ItSc_SumGobSkel,5);
		CreateInvItems(self,ItSc_SumSkel,2);
		CreateInvItems(self,ItSc_SumDemon,3);
		CreateInvItems(self,ItSc_ArmyOfDarkness,3);
		CreateInvItems(self,itsc_deathbolt,5);
		CreateInvItems(self,ItSc_ManaForLife,3);
		CreateInvItems(self,itsc_sumzombie,2);
		CreateInvItems(self,itsc_swarm,2);
		CreateInvItems(self,itsc_energyball,2);
		CreateInvItems(self,itsc_deathball,1);
		CreateInvItems(self,ItSc_MassDeath,1);
		CreateInvItems(self,itsc_skull,1);
		CreateInvItems(self,ItBE_Addon_KDF_03,1);
		KREOLGIVEFIVECHAPTERSPELLS = TRUE;
	};
	if((Kapitel == 6) && (KREOLGIVESIXCHAPTERSPELLS == FALSE))
	{
		CreateInvItems(self,ItMi_RuneBlank,2);
		CreateInvItems(self,ItSc_SumGobSkel,5);
		CreateInvItems(self,ItSc_SumSkel,2);
		CreateInvItems(self,ItSc_SumDemon,5);
		CreateInvItems(self,ItSc_ArmyOfDarkness,3);
		CreateInvItems(self,itsc_deathbolt,5);
		CreateInvItems(self,ItSc_ManaForLife,3);
		CreateInvItems(self,itsc_sumzombie,2);
		CreateInvItems(self,itsc_swarm,2);
		CreateInvItems(self,itsc_energyball,2);
		CreateInvItems(self,itsc_deathball,1);
		CreateInvItems(self,ItSc_MassDeath,1);
		CreateInvItems(self,itsc_skull,1);
		KREOLGIVESIXCHAPTERSPELLS = TRUE;
	};

	B_GiveTradeInv(self);
};


instance DIA_KREOL_RUNEN(C_Info)
{
	npc = none_102_kreol;
	nr = 5;
	condition = dia_kreol_runen_condition;
	information = dia_kreol_runen_info;
	permanent = TRUE;
	description = "Научи меня создавать руны.";
};


func int dia_kreol_runen_condition()
{
	if((KREOL_MYTEACHER == TRUE) || ((CHOOSEDARK == TRUE) && (Kapitel >= 5)))
	{
		return TRUE;
	};
};

func void dia_kreol_runen_info()
{
	AI_Output(other,self,"DIA_Parlan_TEACH_15_00");	//Обучи меня!
	Info_ClearChoices(dia_kreol_runen);
	Info_AddChoice(dia_kreol_runen,Dialog_Back,dia_kreol_runen_back);

	if((Npc_GetTalentSkill(other,NPC_TALENT_DEMONOLOG) == 1) && (PLAYER_TALENT_RUNES[SPL_SummonDemon] == FALSE))
	{
		Info_AddChoice(dia_kreol_runen,"Руна демонолога",dia_kreol_runen_dem);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 6)
	{
		Info_AddChoice(dia_kreol_runen,"6 Круг магии",dia_kreol_runen_6);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 5)
	{
		Info_AddChoice(dia_kreol_runen,"5 Круг магии",dia_kreol_runen_5);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 4)
	{
		Info_AddChoice(dia_kreol_runen,"4 Круг магии",dia_kreol_runen_4);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3)
	{
		Info_AddChoice(dia_kreol_runen,"3 Круг магии",dia_kreol_runen_3);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2)
	{
		Info_AddChoice(dia_kreol_runen,"2 Круг магии",dia_kreol_runen_2);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 1)
	{
		Info_AddChoice(dia_kreol_runen,"1 Круг магии",dia_kreol_runen_1);
	};
};

func void dia_kreol_runen_back()
{
	Info_ClearChoices(dia_kreol_runen);
};

func void dia_kreol_runen_dem()
{
	Info_ClearChoices(dia_kreol_runen);
	Info_AddChoice(dia_kreol_runen,Dialog_Back,dia_kreol_runen_back);
	if(PLAYER_TALENT_RUNES[SPL_SummonDemon] == FALSE)
	{
		Info_AddChoice(dia_kreol_runen,b_buildlearnstringforrunes(NAME_SPL_SummonDemon,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SummonDemon)),dia_kreol_runen_circle_4_spl_summondemon);
	};
};

func void dia_kreol_runen_1()
{
	Info_ClearChoices(dia_kreol_runen);
	Info_AddChoice(dia_kreol_runen,Dialog_Back,dia_kreol_runen_back);

	if(PLAYER_TALENT_RUNES[SPL_Deathbolt] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_kreol_runen,b_buildlearnstringforrunes(NAME_SPL_Deathbolt,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Deathbolt)),dia_kreol_runen_circle_1_spl_deathbolt);
	};
	if(PLAYER_TALENT_RUNES[SPL_SummonGoblinSkeleton] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_kreol_runen,b_buildlearnstringforrunes(NAME_SPL_SummonGoblinSkeleton,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SummonGoblinSkeleton)),dia_kreol_runen_circle_1_spl_summongoblinskeleton);
	};
	if(PLAYER_TALENT_RUNES[SPL_Rage] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_kreol_runen,b_buildlearnstringforrunes(NAME_SPL_Rage,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Rage)),dia_kreol_runen_circle_1_spl_Rage);
	};
};

func void dia_kreol_runen_2()
{
	Info_ClearChoices(dia_kreol_runen);
	Info_AddChoice(dia_kreol_runen,Dialog_Back,dia_kreol_runen_back);

	if(PLAYER_TALENT_RUNES[SPL_ManaForLife] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_kreol_runen,b_buildlearnstringforrunes(NAME_SPL_ManaForLife,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_ManaForLife)),dia_kreol_runen_circle_2_spl_suckenergy);
	};
	if(PLAYER_TALENT_RUNES[SPL_SummonZombie] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_kreol_runen,b_buildlearnstringforrunes(NAME_SPL_SummonZombie,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SummonZombie)),dia_kreol_runen_circle_2_spl_summonzombie);
	};
	if(PLAYER_TALENT_RUNES[SPL_Lacerate] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_kreol_runen,b_buildlearnstringforrunes(NAME_SPL_Lacerate,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Lacerate)),dia_kreol_runen_circle_2_spl_Lacerate);
	};
};

func void dia_kreol_runen_3()
{
	Info_ClearChoices(dia_kreol_runen);
	Info_AddChoice(dia_kreol_runen,Dialog_Back,dia_kreol_runen_back);

	if(PLAYER_TALENT_RUNES[SPL_Swarm] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_kreol_runen,b_buildlearnstringforrunes(NAME_SPL_Swarm,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Swarm)),dia_kreol_runen_circle_3_spl_swarm);
	};
	if(PLAYER_TALENT_RUNES[SPL_SummonSkeleton] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_kreol_runen,b_buildlearnstringforrunes(NAME_SPL_SummonSkeleton,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SummonSkeleton)),dia_kreol_runen_circle_3_spl_summonskeleton);
	};
	if(PLAYER_TALENT_RUNES[SPL_Energyball] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_kreol_runen,b_buildlearnstringforrunes(NAME_SPL_BeliarsRage,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Energyball)),dia_kreol_runen_circle_3_spl_energyball);
	};
};

func void dia_kreol_runen_4()
{
	Info_ClearChoices(dia_kreol_runen);
	Info_AddChoice(dia_kreol_runen,Dialog_Back,dia_kreol_runen_back);

	if(PLAYER_TALENT_RUNES[SPL_Deathball] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_kreol_runen,b_buildlearnstringforrunes(NAME_SPL_Deathball,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Deathball)),dia_kreol_runen_circle_4_spl_deathball);
	};
};

func void dia_kreol_runen_5()
{
	Info_ClearChoices(dia_kreol_runen);
	Info_AddChoice(dia_kreol_runen,Dialog_Back,dia_kreol_runen_back);

	if(PLAYER_TALENT_RUNES[SPL_ArmyOfDarkness] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_kreol_runen,b_buildlearnstringforrunes(NAME_SPL_ArmyOfDarkness,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_ArmyOfDarkness)),dia_kreol_runen_circle_5_spl_armyofdarkness);
	};
};

func void dia_kreol_runen_6()
{
	Info_ClearChoices(dia_kreol_runen);
	Info_AddChoice(dia_kreol_runen,Dialog_Back,dia_kreol_runen_back);

	if(PLAYER_TALENT_RUNES[SPL_MassDeath] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_kreol_runen,b_buildlearnstringforrunes(NAME_SPL_MassDeath,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_MassDeath)),dia_kreol_runen_circle_6_spl_massdeath);
	};
	if(PLAYER_TALENT_RUNES[SPL_Skull] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_kreol_runen,b_buildlearnstringforrunes(NAME_SPL_Skull,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Skull)),dia_kreol_runen_circle_6_spl_skull);
	};
};

func void dia_kreol_runen_circle_1_spl_Rage()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Rage);
};

func void dia_kreol_runen_circle_2_spl_Lacerate()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Lacerate);
};

func void dia_kreol_runen_circle_1_spl_deathbolt()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Deathbolt);
};

func void dia_kreol_runen_circle_1_spl_summongoblinskeleton()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SummonGoblinSkeleton);
};

func void dia_kreol_runen_circle_2_spl_suckenergy()
{
	B_TeachPlayerTalentRunes(self,other,SPL_ManaForLife);
};

func void dia_kreol_runen_circle_2_spl_summonzombie()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SummonZombie);
};

func void dia_kreol_runen_circle_3_spl_swarm()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Swarm);
};

func void dia_kreol_runen_circle_3_spl_summonskeleton()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SummonSkeleton);
};

func void dia_kreol_runen_circle_3_spl_energyball()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Energyball);
};

func void dia_kreol_runen_circle_4_spl_summondemon()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SummonDemon);
};

func void dia_kreol_runen_circle_4_spl_deathball()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Deathball);
};

func void dia_kreol_runen_circle_5_spl_armyofdarkness()
{
	B_TeachPlayerTalentRunes(self,other,SPL_ArmyOfDarkness);
};

func void dia_kreol_runen_circle_6_spl_massdeath()
{
	B_TeachPlayerTalentRunes(self,other,SPL_MassDeath);
};

func void dia_kreol_runen_circle_6_spl_skull()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Skull);
};


instance DIA_KREOL_TEACH_MANA(C_Info)
{
	npc = none_102_kreol;
	nr = 10;
	condition = dia_kreol_teach_mana_condition;
	information = dia_kreol_teach_mana_info;
	permanent = TRUE;
	description = "Я хочу увеличить свою магическую энергию.";
};

func int dia_kreol_teach_mana_condition()
{
	if((KREOL_MYTEACHER == TRUE) && ((other.attribute[ATR_MANA_MAX] < T_MEGA) || (VATRAS_TEACHREGENMANA == FALSE)))
	{
		return TRUE;
	};
};

func void dia_kreol_teach_mana_info()
{
	AI_Output(other,self,"DIA_Kreol_TEACH_MANA_15_00");	//Я хочу увеличить свою магическую энергию.
	AI_Output(self,other,"DIA_Kreol_TEACH_MANA_15_01");	//Я могу помочь тебе в этом. Как ты ее используешь, зависит только от тебя.
	Info_ClearChoices(dia_kreol_teach_mana);
	Info_AddChoice(dia_kreol_teach_mana,Dialog_Back,dia_kreol_teach_mana_back);
	Info_AddChoice(dia_kreol_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_kreol_teach_mana_1);
	Info_AddChoice(dia_kreol_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_kreol_teach_mana_5);

	if((Kapitel >= 2) && (hero.guild == GIL_KDM) && (VATRAS_TEACHREGENMANA == FALSE))
	{
		Info_AddChoice(DIA_Kreol_TEACH_MANA,"Регенерация маны (Очки обучения: 10, Цена: 15000 монет)",DIA_Kreol_TEACH_MANA_Regen);
	};
};

func void dia_kreol_teach_mana_back()
{
	if(other.attribute[ATR_MANA_MAX] >= T_MEGA)
	{
		AI_Output(self,other,"DIA_Kreol_TEACH_MANA_05_00");	//Я больше не в силах помочь тебе в этом.
		AI_Output(self,other,"DIA_Kreol_TEACH_MANA_05_01");	//Ты на пределе своих возможностей!
	};

	Info_ClearChoices(dia_kreol_teach_mana);
};

func void DIA_Kreol_TEACH_MANA_Regen()
{
	var int kosten;
	var int money;

	AI_Output(other,self,"DIA_Vatras_Teach_regen_15_05");	//Научи меня регенерации маны.

	kosten = 10;
	money = 15000;

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		AI_StopProcessInfos(self);
	};
	if(Npc_HasItems(hero,ItMi_Gold) < money)
	{
		AI_Print(Print_NotEnoughGold);
		AI_StopProcessInfos(self);
	};
	if((hero.lp >= kosten) && (Npc_HasItems(other,ItMi_Gold) >= money))
	{
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + kosten;
		Npc_RemoveInvItems(other,ItMi_Gold,money);
		AI_Print("Обучение: Регенерация маны");
		VATRAS_TEACHREGENMANA = TRUE;
		Snd_Play("LevelUP");
	};

	Info_ClearChoices(dia_kreol_teach_mana);
	Info_AddChoice(dia_kreol_teach_mana,Dialog_Back,dia_kreol_teach_mana_back);
	Info_AddChoice(dia_kreol_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_kreol_teach_mana_1);
	Info_AddChoice(dia_kreol_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_kreol_teach_mana_5);
};

func void dia_kreol_teach_mana_1()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,1,T_MEGA);
	Info_ClearChoices(dia_kreol_teach_mana);
	Info_AddChoice(dia_kreol_teach_mana,Dialog_Back,dia_kreol_teach_mana_back);
	Info_AddChoice(dia_kreol_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_kreol_teach_mana_1);
	Info_AddChoice(dia_kreol_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_kreol_teach_mana_5);

	if((Kapitel >= 2) && (hero.guild == GIL_KDM) && (VATRAS_TEACHREGENMANA == FALSE))
	{
		Info_AddChoice(DIA_Kreol_TEACH_MANA,"Регенерация маны (Очки обучения: 10, Цена: 15000 монет)",DIA_Kreol_TEACH_MANA_Regen);
	};
};

func void dia_kreol_teach_mana_5()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,5,T_MEGA);
	Info_ClearChoices(dia_kreol_teach_mana);
	Info_AddChoice(dia_kreol_teach_mana,Dialog_Back,dia_kreol_teach_mana_back);
	Info_AddChoice(dia_kreol_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_kreol_teach_mana_1);
	Info_AddChoice(dia_kreol_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_kreol_teach_mana_5);

	if((Kapitel >= 2) && (hero.guild == GIL_KDM) && (VATRAS_TEACHREGENMANA == FALSE))
	{
		Info_AddChoice(DIA_Kreol_TEACH_MANA,"Регенерация маны (Очки обучения: 10, Цена: 15000 монет)",DIA_Kreol_TEACH_MANA_Regen);
	};
};


var int dia_kreol_circle_noperm;

instance DIA_KREOL_CIRCLE(C_Info)
{
	npc = none_102_kreol;
	nr = 99;
	condition = dia_kreol_circle_condition;
	information = dia_kreol_circle_info;
	permanent = TRUE;
	description = "Я хочу постигать суть магии.";
};


func int dia_kreol_circle_condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) <= 6) && (KREOL_MYTEACHER == TRUE) && (DIA_KREOL_CIRCLE_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_kreol_circle_info()
{
	AI_Output(other,self,"DIA_Kreol_CIRCLE_15_00");	//Я хочу постигать суть магии.
	Info_ClearChoices(DIA_Kreol_CIRCLE);
	Info_AddChoice(DIA_Kreol_CIRCLE,Dialog_Back,DIA_Kreol_CIRCLE_Back);

	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) < 1) && (Kapitel >= 1))
	{
		Info_AddChoice(DIA_Kreol_CIRCLE,"1 Круг магии (Очков обучения: 20)",DIA_Kreol_CIRCLE_1);
	}
	else if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 1) && (Kapitel >= 2))
	{
		Info_AddChoice(DIA_Kreol_CIRCLE,"2 Круг магии (Очков обучения: 30)",DIA_Kreol_CIRCLE_2);
	}
	else if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 2) && (Kapitel >= 3))
	{
		Info_AddChoice(DIA_Kreol_CIRCLE,"3 Круг магии (Очков обучения: 40)",DIA_Kreol_CIRCLE_3);
	}
	else if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 3) && (MIS_ReadyforChapter4 == TRUE))
	{
		Info_AddChoice(DIA_Kreol_CIRCLE,"4 Круг магии (Очков обучения: 60)",DIA_Kreol_CIRCLE_4);
	}
	else if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 4) && (Kapitel >= 5))
	{
		Info_AddChoice(DIA_Kreol_CIRCLE,"5 Круг магии (Очков обучения: 80)",DIA_Kreol_CIRCLE_5);
	}
	else if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 5) && (Kapitel >= 5) && (MIS_DarkOrden == LOG_Success) && (MIS_JarCurse == LOG_Success) && (MIS_URNAZULRAGE == LOG_SUCCESS))
	{
		Info_AddChoice(DIA_Kreol_CIRCLE,"6 Круг магии (Очков обучения: 100)",DIA_Kreol_CIRCLE_6);
	}
	else
	{
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_31");	//Еще не время. Возвращайся позже.
	};
};

func void DIA_Kreol_CIRCLE_Back()
{
	Info_ClearChoices(DIA_Kreol_CIRCLE);
};

func void DIA_Kreol_CIRCLE_1()
{
	if(B_TeachMagicCircle(self,other,1))
	{
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_0A");	//Готов ли ты вступить в Первый круг магии?
		AI_Output(other,self,"DIA_Kreol_CIRCLE_15_01");	//Я готов вступить в Первый Круг.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_01");	//Вступив в Первый Круг, ты научишься использовать магические руны.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_02");	//Каждая руна содержит структуру особого магического заклинания.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_03");	//Использовав свою собственную магическую силу, ты сможешь высвободить магию руны.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_04");	//Но в отличие от свитков, которые по сути являются магическими формулами, магия рун поддерживает структуру заклинания всегда.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_05");	//Каждая руна таит в себе магическую силу, которую ты можешь забрать в любой момент.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_06");	//Использование руны, как и использование свитка, требует затрат магической энергии.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_07");	//С каждым новым Кругом ты будешь узнавать о рунах все больше и больше.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_08");	//Направь их силу на то, чтобы познать себя.
	};
	Info_ClearChoices(DIA_Kreol_CIRCLE);
};

func void DIA_Kreol_CIRCLE_2()
{
	if(B_TeachMagicCircle(self,other,2))
	{
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_0B");	//Готов ли ты вступить в следующий круг магии?
		AI_Output(other,self,"DIA_Kreol_CIRCLE_15_02");	//Я готов вступить во Второй Круг.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_09");	//Ты уже научился понимать руны. Пришло время углубить твои познания.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_10");	//Вступив во Второй Круг, ты постигнешь основы мощных боевых заклятий.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_11");	//Но для того чтобы познать истинные секреты магии, тебе предстоит многому научиться.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_12");	//Ты уже знаешь о том, что можешь использовать любую руну бессчетное число раз, но лишь до тех пор, пока не израсходуешь всю магическую силу.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_13");	//Но прежде чем сделать что-либо, подумай о том, есть ли в этом смысл. Ты обладаешь силой, которая позволяет с легкостью сеять смерть и разрушения.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_14");	//Задача темных магов состоит именно в этом, но настоящую пользу Белиару приносят лишь те, кто практикует рациональный подход. Истинная мощь рун заключается в грамотном расчете их использования.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_15");	//Научись оценивать ситуацию и распределять свои силы.
	};
	Info_ClearChoices(DIA_Kreol_CIRCLE);
};

func void DIA_Kreol_CIRCLE_3()
{
	if(B_TeachMagicCircle(self,other,3))
	{
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_0C");	//Готов ли ты вступить в следующий круг магии?
		AI_Output(other,self,"DIA_Kreol_CIRCLE_15_03");	//Какие знания сопутствуют Третьему Кругу?
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_16");	//Третий Круг является одним из важнейших этапов в жизни каждого мага. Достигнув его, ты завершишь свой поиск.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_17");	//Ты уже преодолел значительный этап на пути магии. Ты научился использовать руны.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_18");	//Это знание предусматривает в том, кто им владеет, осмотрительность, рассудительность и решимость. Помни об этом. Также оно послужит основой для следующего этапа.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_19");	//Обладая пониманием сути рунической магии и методами её применения, ты можешь уничтожать врагов с её помощью, а можешь и содержать эти сокровенные знания в закромах своего разума. Оставлять их в состоянии покоя.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_20");	//Но ты должен сделать выбор. Сделав его в пользу применения этой доступной далеко не каждому магии, отбрось все сомнения и во славу Белиара ввергай противников в небытие.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_21");	//Найди свой путь, и тогда ты познаешь силу решения.
	};
	Info_ClearChoices(DIA_Kreol_CIRCLE);
};

func void DIA_Kreol_CIRCLE_4()
{
	if(B_TeachMagicCircle(self,other,4))
	{
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_0D");	//Готов ли ты вступить в следующий круг магии?
		AI_Output(other,self,"DIA_Kreol_CIRCLE_15_04");	//Я готов вступить в Четвертый Круг.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_22");	//Ты завершил первые три Круга. Пришло время тебе постичь секреты магии, освоением которых грезят жаждущие великой силы, непреклонные и несгибаемые, истинные маги. Упрямые и преданные Темному богу.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_23");	//Основа магии рун - камень. Магический камень, добытый из магической руды, добываемой в шахтах.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_24");	//В храмах она наделяется магическими формулами, и там же руны превращаются в орудия нашей силы.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_25");	//Теперь ты обладаешь знаниями всех храмов этого мира.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_27");	//Познай магию, и ты откроешь для себя секрет власти, даруемой нам ею.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_28");	//И еще кое-что. Войдя в четвертый круг магии, ты удостаиваешься чести носить облачение высших темных магов.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_29");	//Немногим удавалось такое. Теперь ты один из избранных бога Тьмы!
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_30");	//Вот, возьми эту робу в знак признания твоего статуса.
		CreateInvItems(other,itar_dmt_h,1);
		AI_EquipArmor(other,itar_dmt_h);
	};
	Info_ClearChoices(DIA_Kreol_CIRCLE);
};

func void DIA_Kreol_CIRCLE_5()
{
	if(B_TeachMagicCircle(self,other,5))
	{
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_0E");	//Готов ли ты вступить в следующий круг магии?
		AI_Output(other,self,"DIA_Kreol_CIRCLE_15_05");	//Я готов вступить в Пятый Круг.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_32");	//Если ты будешь использовать свою силу, не зная механизм ее действия, ты рискуешь своей жизнью.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_33");	//Поэтому запомни мои слова. Их важность ты поймешь со временем.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_34");	//Повсюду в природе нас окружают силы, действие которых не поддается нашему восприятию.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_35");	//Духи природы и элементов составляют малую часть того, о невидимом присутствии которого мы можем только догадываться.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_36");	//То, что воспринимается как твое собственное действие, может быть просто игрой духов.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_37");	//Маг - это тот, кто сам может проникнуть в мир таинственного, кто может понять, что даже в невидимом мире есть собственные законы.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_38");	//Это описание магической картины мира подобно закону, высшей силой высеченному в камне.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_39");	//Запомни его хорошенько.
	};
	Info_ClearChoices(DIA_Kreol_CIRCLE);
};

func void DIA_Kreol_CIRCLE_6()
{
	if(B_TeachMagicCircle(self,other,6))
	{
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_40");	//Я поднимаю тебя в Шестой Круг магии.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_41");	//Заметь, в Шестой Круг могут вступить лишь самые могущественные из магов. Он предназначен для тех, чья жизнь - это знак.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_42");	//Твой знак - багровая Тьма!
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_43");	//Шестой Круг позволит тебе использовать магию любой руны.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_44");	//Не забывай не захватывать силу, но быть ее источником.
		AI_Output(self,other,"DIA_Kreol_CIRCLE_14_45");	//Будь мудр и рассудителен в своих деяниях. Да придаст тебе сил Белиар - Темный бог и повелитель Тьмы!
		DIA_KREOL_CIRCLE_NOPERM = TRUE;
	};
	Info_ClearChoices(DIA_Kreol_CIRCLE);
};

instance DIA_KREOL_FINDDARKSOUL(C_Info)
{
	npc = none_102_kreol;
	nr = 23;
	condition = dia_kreol_finddarksoul_condition;
	information = dia_kreol_finddarksoul_info;
	permanent = FALSE;
	description = "Тебе что-нибудь говорят слова Мора Уларту?";
};


func int dia_kreol_finddarksoul_condition()
{
	if((TASKFINDDARKSOUL == TRUE) && (MIS_GOLDDRAGONPORTAL == LOG_Running) && (TELLABOUTDS == FALSE))
	{
		return TRUE;
	};
};

func void dia_kreol_finddarksoul_info()
{
	AI_Output(other,self,"DIA_Kreol_FindDarkSoul_01_00");	//Тебе что-нибудь говорят слова Мора Уларту?
	AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_01");	//Откуда тебе стало про это известно?
	AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_03");	//Я знаю не очень много, но попытаюсь вкратце объяснить тебе его суть.
	AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_05");	//Мора Уларту - очень древнее могущественное заклинание. Его иногда также называют Темницей Душ.
	AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_06");	//Оно пришло с тех незапамятных времен, когда человечество лишь начинало свой путь в этом мире.
	AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_07");	//Точно неизвестно, каким образом это заклинание попало в наш мир, но, судя по всему, к этому приложил руку сам Белиар!
	AI_Output(other,self,"DIA_Kreol_FindDarkSoul_01_09");	//Скажи, а как мне заполучить Мора Уларту?
	AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_10");	//ЧТО? Зачем тебе это?
	AI_Output(other,self,"DIA_Kreol_FindDarkSoul_01_14");	//Мне нужно это заклинание, чтобы изловить душу одного демона.
	AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_22");	//Проблема заключается в том, что Мора Уларту не просто обычное заклинание.
	AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_23");	//Это дар! Дар Белиара тому, кто, по его мнению, достоин владеть этим сокровенным знанием. Лишь сам Темный бог может даровать его тебе!
	AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_24");	//И не думаю, что он посчитает тебя достойным!
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_25");	//К тому же ты маг Огня, служитель Инноса!
		AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_26");	//Боюсь, у тебя нет на это никаких шансов!
		CHANCEGETDARKSOUL = 1;
	}
	else if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_27");	//К тому же ты паладин Инноса!
		AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_28");	//Боюсь, твои шансы ничтожно малы!
		CHANCEGETDARKSOUL = 5;
	}
	else if(other.guild == GIL_KDW)
	{
		AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_29");	//К тому же ты маг Воды, служитель Аданоса!
		AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_30");	//Хотя между ним и Белиаром нет особой вражды, но, думаю, сильно рассчитывать не стоит!
		CHANCEGETDARKSOUL = 25;
	}
	else if(other.guild == GIL_KDM)
	{
		AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_31");	//Хотя то, что ты темный маг, безусловно, плюс в этом деле.
		AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_32");	//Но, думаю, все равно на это не стоит сильно рассчитывать!
		CHANCEGETDARKSOUL = 50;
	}
	else
	{
		AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_33");	//Хотя, с другой стороны, ты не давал обет другим богам.
		AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_34");	//Возможно, это сможет стать твоим преимуществом в этом деле.
		CHANCEGETDARKSOUL = 75;
	};
	AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_35");	//В любом случае попробовать стоит. Если, конечно, тебя все еще это интересует.
	AI_Output(other,self,"DIA_Kreol_FindDarkSoul_01_39");	//И что мне нужно сделать для того, чтобы Белиар даровал мне Мора Уларту?
	AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_42");	//Для начала тебе необходимо иметь что-то, что заинтересует Темного бога. Есть еще одна вещь, которая могла бы заинтересовать его.
	AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_46");	//Существует один очень могущественный артефакт - Амулет Трирамар.
	AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_47");	//Я точно не знаю, кто был его создателем. Но предполагаю, что это был сам Белиар!
	AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_48");	//Иначе как объяснить, что со времени своего создания и до последнего момента артефакт находился в одном из храмов, посвященных Темному богу.
	AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_51");	//Правда, полвека назад паладины Инноса разрушили этот храм.
	AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_52");	//Они не оставили без внимания и сам артефакт. Не в силах его уничтожить, они надежно сокрыли его от посторонних глаз.
	AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_53");	//А сила Инноса помогла им противостоять гневу Белиара, желавшего вернуть его себе.
	AI_Output(other,self,"DIA_Kreol_FindDarkSoul_01_54");	//А что в нем такого особенного?
	AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_55");	//В нем сокрыта одна из четырех сущностей Темного бога.
	AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_56");	//Для тех, кто служил Белиару, этот артефакт являлся источником их силы...
	AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_57");	//...а для Темного бога он являлся неотъемлемой частью его самого!
	AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_60");	//Помни: Белиар хитер и коварен!
	AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_61");	//Безусловно, он будет рад вернуть себе этот артефакт. Но может оказаться и так, что на этом его благодарность и закончится.
	AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_63");	//Кроме того, если паладины узнают об этом - сам понимаешь, чем это тебе грозит.
	AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_64");	//Но как поступать в этом случае, решать только тебе.
	AI_Output(other,self,"DIA_Kreol_FindDarkSoul_01_65");	//А где паладины хранят этот артефакт?
	AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_66");	//Полагаю, они спрятали его где-то здесь на острове.
	AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_68");	//Скорее всего, это место надежно сокрыто от посторонних глаз, и попасть туда практически невозможно.
	if(Npc_KnowsInfo(other,dia_pal_199_ritter_firstwarn) || Npc_KnowsInfo(other,dia_pal_199_ritter_hagen))
	{
		AI_Output(other,self,"DIA_Kreol_FindDarkSoul_01_69");	//Может, они хранят его в королевском форте Азган?
		AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_70");	//Никогда не слышал о таком!
	};
	AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_72");	//Вряд ли кто-нибудь из паладинов станет говорить с тобой об этом.
	AI_Output(other,self,"DIA_Kreol_FindDarkSoul_01_74");	//А что мне делать, если я все-таки найду способ заполучить этот амулет?
	AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_75");	//Все очень просто! Произнеси молитву Белиару и возложи амулет к подножию его алтаря.
	AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_76");	//Ну а после этого проси его даровать тебе Мора Уларту.
	AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_77");	//Возможно, тебе повезет, и ты получишь то, что искал.
	AI_Output(other,self,"DIA_Kreol_FindDarkSoul_01_78");	//Хорошо, так и сделаю.
	AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_79");	//И еще кое-что...
	AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_80");	//Держи меня в курсе событий. Дай мне знать, если что-то узнаешь про амулет.
	AI_Output(self,other,"DIA_Kreol_FindDarkSoul_01_83");	//Теперь все - можешь идти.
	KREOLLINE = TRUE;
	TELLABOUTDS = TRUE;
	TELLMORAKREOL = TRUE;
	B_LogEntry(TOPIC_GOLDDRAGONPORTAL,"Креол поведал мне о древнем заклинании Мора Уларту - Темнице Душ. Судя по всему, это заклинание может быть даровано только самим Белиаром и мои шансы на это не очень высоки. Однако Креол подсказал мне идею, как возможно заполучить благосклонность Темного Бога. Для этого мне необходимо достать некий Амулет Трирамар - могущественный артефакт, в который Белиар вложил часть своей божественной силы и который был захвачен паладинами во время уничтожения одного из храмов Темного Бога. Креол точно не знает, где паладины прячут этот древний артефакт.");
	B_LogEntry(TOPIC_GOLDDRAGONPORTAL,"Если мне все-таки удастся достать артефакт, о котором говорил Креол - мне следует вознести молитву Темному богу, возложить амулет на его алтарь и просить Белиара даровать за оказанную к нему учтивость нужное мне заклинание. Правда Креол предупредил, что возможно меня постигнет неудача в этом деле - поэтому мне не стоит особо обольщаться.");
};


instance DIA_KREOL_FINDETLU(C_Info)
{
	npc = none_102_kreol;
	nr = 1;
	condition = dia_kreol_findetlu_condition;
	information = dia_kreol_findetlu_info;
	permanent = FALSE;
	description = "Я узнал, где паладины прячут амулет Трирамар.";
};


func int dia_kreol_findetlu_condition()
{
	if((ETLUBEGINS == TRUE) && Npc_KnowsInfo(other,dia_kreol_finddarksoul) && (BEONETLU == FALSE))
	{
		return TRUE;
	};
};

func void dia_kreol_findetlu_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Kreol_FindEtlu_01_00");	//Я узнал, где паладины прячут амулет Трирамар.
	AI_Output(self,other,"DIA_Kreol_FindEtlu_01_01");	//И где же?
	AI_Output(other,self,"DIA_Kreol_FindEtlu_01_02");	//На острове Этлу.
	AI_Output(self,other,"DIA_Kreol_FindEtlu_01_03");	//Этлу? Да, они его хорошенько припрятали.
	AI_Output(other,self,"DIA_Kreol_FindEtlu_01_04");	//И как туда попасть я тоже узнал.
	AI_Output(other,self,"DIA_Kreol_FindEtlu_01_05");	//Здесь на острове есть магический портал, который ведет прямиком на этот остров.
	AI_Output(self,other,"DIA_Kreol_FindEtlu_01_06");	//Портал? Интересно, откуда он взялся?
	AI_Output(other,self,"DIA_Kreol_FindEtlu_01_07");	//Его построили паладины.
	AI_Output(self,other,"DIA_Kreol_FindEtlu_01_09");	//Тогда тебе осталось только найти этот портал.
	AI_Output(self,other,"DIA_Kreol_FindEtlu_01_11");	//Да, и еще кое-что. Думаю, мне стоит сразу предупредить тебя об этом.
	AI_Output(self,other,"DIA_Kreol_FindEtlu_01_13");	//Я почти уверен, что паладины на острове не будут рады твоему визиту.
	AI_Output(self,other,"DIA_Kreol_FindEtlu_01_14");	//Судя по всему, это запретная зона...
	AI_Output(self,other,"DIA_Kreol_FindEtlu_01_15");	//...и каждого, кто заявится туда без приглашения, ожидает только одно.
	AI_Output(self,other,"DIA_Kreol_FindEtlu_01_17");	//Думаю, ты сам понимаешь что!
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Kreol_FindEtlu_01_18");	//Даже несмотря на то, что ты паладин!
		AI_Output(self,other,"DIA_Kreol_FindEtlu_01_19");	//Там на острове твой статус тебя уже не спасет!
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Kreol_FindEtlu_01_20");	//Даже несмотря на то, что ты маг Огня!
		AI_Output(self,other,"DIA_Kreol_FindEtlu_01_21");	//Там на острове твой статус тебя уже не спасет!
	}
	else if(hero.guild == GIL_KDW)
	{
		AI_Output(self,other,"DIA_Kreol_FindEtlu_01_22");	//Даже несмотря на то, что ты маг Воды!
		AI_Output(self,other,"DIA_Kreol_FindEtlu_01_23");	//Там на острове твой статус тебя уже не спасет!
	};
	AI_Output(self,other,"DIA_Kreol_FindEtlu_01_24");	//Поэтому прежде чем туда отправляться, хорошенько подготовься. Тебя ожидает тяжелый бой!
	AI_Output(self,other,"DIA_Kreol_FindEtlu_01_25");	//Паладины будут стоять насмерть, защищая этот артефакт!
	AI_Output(self,other,"DIA_Kreol_FindEtlu_01_26");	//В этом ты можешь не сомневаться.
	AI_Output(self,other,"DIA_Kreol_FindEtlu_01_27");	//И хорошенько запомни - не смей надевать этот амулет!
	AI_Output(self,other,"DIA_Kreol_FindEtlu_01_28");	//Он убьет тебя!
	AI_Output(self,other,"DIA_Kreol_FindEtlu_01_29");	//У тебя просто не хватит сил сопротивляться его мощи!
	AI_Output(self,other,"DIA_Kreol_FindEtlu_01_31");	//Теперь ступай.
	B_LogEntry(TOPIC_GOLDDRAGONPORTAL,"Креол сказал мне о том, что мне не стоит ожидать гостеприимного приема на острове. Видимо, мне придется прорубать себе дорогу мечом. Также он предупредил меня, чтобы я не надевал Амулет Трирамар, если он окажется у меня. А противном случае, я просто погибну.");
};


instance DIA_KREOL_ASKABOUTPEACEWAY(C_Info)
{
	npc = none_102_kreol;
	nr = 1;
	condition = dia_kreol_askaboutpeaceway_condition;
	information = dia_kreol_askaboutpeaceway_info;
	permanent = FALSE;
	description = "Еще один вопрос.";
};


func int dia_kreol_askaboutpeaceway_condition()
{
	if(Npc_KnowsInfo(other,dia_kreol_findetlu) && (MEHASTRIRAVAR == FALSE) && (ASKABOUTPEACEWAY == FALSE) && (other.guild != GIL_PAL) && (other.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_kreol_askaboutpeaceway_info()
{
	AI_Output(other,self,"DIA_Kreol_AskAboutPeaceWay_01_00");	//Еще один вопрос.
	AI_Output(other,self,"DIA_Kreol_AskAboutPeaceWay_01_03");	//Неужели нет способа заполучить у паладинов этот амулет, не сражаясь с ними?
	AI_Output(self,other,"DIA_Kreol_AskAboutPeaceWay_01_04");	//Хммм...(задумчиво) Как я уже сказал, мне это неведомо. Да и сами паладины вряд ли отдадут тебе его просто так.
	if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Kreol_AskAboutPeaceWay_01_05");	//Возможно, на твоем месте я бы попробовал попросить помощи у хозяина амулета - Белиара!
		if(other.guild == GIL_PAL)
		{
			AI_Output(self,other,"DIA_Kreol_AskAboutPeaceWay_01_06");	//Но ты паладин Инноса! Так что он навряд ли станет тебе помогать.
		}
		else
		{
			AI_Output(self,other,"DIA_Kreol_AskAboutPeaceWay_01_07");	//Но ты маг Огня! Так что он навряд ли станет тебе помогать.
		};
		AI_Output(other,self,"DIA_Kreol_AskAboutPeaceWay_01_08");	//Ладно, придумаю что-нибудь сам.
	}
	else
	{
		AI_Output(self,other,"DIA_Kreol_AskAboutPeaceWay_01_09");	//Однако на твоем месте я бы попробовал попросить помощи у самого хозяина амулета.
		AI_Output(other,self,"DIA_Kreol_AskAboutPeaceWay_01_10");	//Ты имеешь в виду Белиара?
		AI_Output(self,other,"DIA_Kreol_AskAboutPeaceWay_01_11");	//Именно его. Обратись к нему с молитвой, и, возможно, у тебя появится шанс.
		B_LogEntry(TOPIC_GOLDDRAGONPORTAL,"Я задал вопрос Креолу о том, существует ли иной способ забрать у паладинов амулет, не устраивая бойни. И он посоветовал мне обратить к самому Белиара! Надеюсь, он услышит мои мольбы.");
	};
	ASKABOUTPEACEWAY = TRUE;
};


instance DIA_KREOL_FINDAMULET(C_Info)
{
	npc = none_102_kreol;
	nr = 23;
	condition = dia_kreol_findamulet_condition;
	information = dia_kreol_findamulet_info;
	permanent = FALSE;
	description = "Я достал амулет Трирамар!";
};


func int dia_kreol_findamulet_condition()
{
	if((Npc_HasItems(other,itmi_triramar) >= 1) && Npc_KnowsInfo(other,dia_kreol_finddarksoul))
	{
		return TRUE;
	};
};

func void dia_kreol_findamulet_info()
{
	B_GivePlayerXP(250);

	if(Npc_HasItems(other,ITKE_SI_SIGN) >= 1)
	{
		Npc_RemoveInvItems(other,ITKE_SI_SIGN,1);
	};
	if(Npc_HasItems(other,ITKE_HAGEN_SECRETKEY) >= 1)
	{
		Npc_RemoveInvItems(other,ITKE_HAGEN_SECRETKEY,1);
	};

	AI_Output(other,self,"DIA_Kreol_FindAmulet_01_00");	//Я достал амулет Трирамар!
	AI_Output(self,other,"DIA_Kreol_FindAmulet_01_01");	//(удивленно) ЧТО?! Неужели тебе это все-таки удалось?
	AI_Output(self,other,"DIA_Kreol_FindAmulet_01_03");	//Да, ты умеешь удивлять! Хотя это уже перестает быть для меня откровением.
	AI_Output(self,other,"DIA_Kreol_FindAmulet_01_07");	//Возможно, ты совершил ошибку - а возможно и нет. Ладно, хватит попусту молоть языком!
	AI_Output(self,other,"DIA_Kreol_FindAmulet_01_08");	//Теперь, чтобы получить Мора Уларту, тебе осталось сделать только одну вещь – совершить церемонию подношения дара Белиару.
	AI_Output(self,other,"DIA_Kreol_FindAmulet_01_09");	//Отправляйся к ближайшему алтарю Темного бога, возложи амулет его к основанию и проси даровать тебе Темницу Душ - обо всем остальном позаботиться сам Белиар!
	AI_Output(self,other,"DIA_Kreol_FindAmulet_01_10");	//Один из таких алтарей ты найдешь в дальней комнате моей башни.
	AI_Output(self,other,"DIA_Kreol_FindAmulet_01_11");	//И помни, что я тебе сказал: Темный бог хитер и коварен!
	AI_Output(self,other,"DIA_Kreol_FindAmulet_01_12");	//Не думай, что если ты отдашь ему амулет, то обязательно получишь свою награду!
	AI_Output(other,self,"DIA_Kreol_FindAmulet_01_13");	//Я надеюсь, что все мои усилия не пропадут даром.
	B_LogEntry(TOPIC_GOLDDRAGONPORTAL,"Я показал амулет Креол - это очень сильно удивило его! Теперь мне следует отправиться к любому алтарю Белиара, возложить амулет к его основанию и просить Темного Бога принять этот амулет и даровать мне Мора Уларту.");
	AI_StopProcessInfos(self);
};


instance DIA_KREOL_GETSUPERBELIARWEAPON(C_Info)
{
	npc = none_102_kreol;
	nr = 23;
	condition = dia_kreol_getsuperbeliarweapon_condition;
	information = dia_kreol_getsuperbeliarweapon_info;
	permanent = FALSE;
	description = "Темный бог даровал мне Мора Уларту!";
};


func int dia_kreol_getsuperbeliarweapon_condition()
{
	if((Npc_HasItems(hero,itru_moraulartu) >= 1) && Npc_KnowsInfo(other,dia_kreol_finddarksoul))
	{
		return TRUE;
	};
};

func void dia_kreol_getsuperbeliarweapon_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Kreol_GetSuperBeliarWeapon_01_00");	//Темный бог даровал мне Мора Уларту!
	AI_Output(self,other,"DIA_Kreol_GetSuperBeliarWeapon_01_01");	//ЧТО?! Неужели тебе это удалось?
	AI_Output(self,other,"DIA_Kreol_GetSuperBeliarWeapon_01_02");	//Ты все больше и больше удивляешь меня!
	AI_Output(self,other,"DIA_Kreol_GetSuperBeliarWeapon_01_07");	//Теперь в твоих руках находится могущественный артефакт, дарующий тебе способность Ловца Душ!
	AI_Output(other,self,"DIA_Kreol_GetSuperBeliarWeapon_01_08");	//Ловца Душ?
	AI_Output(self,other,"DIA_Kreol_GetSuperBeliarWeapon_01_09");	//Именно так называют тех, кто способен использовать этот воистину божественный дар!
	AI_Output(self,other,"DIA_Kreol_GetSuperBeliarWeapon_01_10");	//И скажу тебе честно: не многие владеют этим знанием!
	AI_Output(other,self,"DIA_Kreol_GetSuperBeliarWeapon_01_11");	//А кто именно?
	AI_Output(self,other,"DIA_Kreol_GetSuperBeliarWeapon_01_12");	//В основном это демоны и подобные им существа, которые унаследовали эту способность при рождении, или же им были дарованы эти знания. Правда, не всем, а только самым могущественным из них!
	AI_Output(self,other,"DIA_Kreol_GetSuperBeliarWeapon_01_13");	//Для людей же эти знания практически недоступны, хотя, как оказалось, бывают и исключения.
	AI_Output(other,self,"DIA_Kreol_GetSuperBeliarWeapon_01_14");	//Но зачем нужны души?
	AI_Output(self,other,"DIA_Kreol_GetSuperBeliarWeapon_01_15");	//(смеется) Ты до сих пор не осознаешь, чем теперь владеешь.
	AI_Output(self,other,"DIA_Kreol_GetSuperBeliarWeapon_01_16");	//Душа это самое ценное, что есть у живого существа! Это источник нашей магической силы, или проще говоря - маны, что мы используем для сотворения магии.
	AI_Output(self,other,"DIA_Kreol_GetSuperBeliarWeapon_01_17");	//Ко всему прочему, душа живого существа обладает рядом других необычных свойств. Но о них мне практически ничего не известно.
	AI_Output(self,other,"DIA_Kreol_GetSuperBeliarWeapon_01_19");	//Это ключ к безграничному могуществу!
	AI_Output(other,self,"DIA_Kreol_GetSuperBeliarWeapon_01_20");	//Объясни, как использовать все эти знания?
	AI_Output(self,other,"DIA_Kreol_GetSuperBeliarWeapon_01_21");	//Это не так уж и сложно. У тебя есть Мора Уларту - этого вполне хватит, чтобы не дать душе ускользнуть после смерти ее обладателя.
	AI_Output(self,other,"DIA_Kreol_GetSuperBeliarWeapon_01_22");	//Однако использовать ее силу ты не сможешь.
	AI_Output(self,other,"DIA_Kreol_GetSuperBeliarWeapon_01_24");	//Люди не умеют обращаться с ними так же, как это делают, например, демоны - пожирать их, тем самым увеличивая свою силу и могущество.
	AI_Output(other,self,"DIA_Kreol_GetSuperBeliarWeapon_01_25");	//Тогда что мне с ними делать?
	AI_Output(self,other,"DIA_Kreol_GetSuperBeliarWeapon_01_26");	//Возможно, Темный бог сможет принять пойманные тобой души в качестве дара.
	AI_Output(self,other,"DIA_Kreol_GetSuperBeliarWeapon_01_27");	//А ты сможешь выпросить у него что-либо ценное взамен.
	AI_Output(other,self,"DIA_Kreol_GetSuperBeliarWeapon_01_29");	//Хорошо, мне все ясно.
	KNOWSHOWDEALSOULS = TRUE;
	Log_CreateTopic(TOPIC_SUPERBELIARWEAPON_UPG,LOG_NOTE);
	B_LogEntry(TOPIC_SUPERBELIARWEAPON_UPG,"Полученная мной руна Мора Уларту даровала мне способность Ловца Душ, с помощью которой я смогу пленить и захватывать души любого существа. В свою очередь, собранные души я могу преподнести в дар Темному Богу, естественно не забыв при этом выпросить у него для себя что-нибудь полезное!");
};


instance DIA_KREOL_GETSUPERSOUL(C_Info)
{
	npc = none_102_kreol;
	nr = 23;
	condition = dia_kreol_getsupersoul_condition;
	information = dia_kreol_getsupersoul_info;
	permanent = FALSE;
	description = "У меня есть душа архидемона С'эньяка!";
};


func int dia_kreol_getsupersoul_condition()
{
	if((Npc_HasItems(hero,itmi_stonesoul_senyak) >= 1) && (TELLCANSUPERBELIARWEAPON == FALSE) && (KNOWSHOWDEALSOULS == TRUE))
	{
		return TRUE;
	};
};

func void dia_kreol_getsupersoul_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Kreol_GetSuperSoul_01_00");	//У меня есть душа архидемона С'эньяка!
	AI_Output(self,other,"DIA_Kreol_GetSuperSoul_01_01");	//С'эньяка?! (ехидно) А ты зря времени не терял!
	AI_Output(self,other,"DIA_Kreol_GetSuperSoul_01_02");	//Что же, в твоих руках воистину настоящее сокровище! Но ты, как я вижу, совершенно не знаешь, что с ней делать.
	AI_Output(self,other,"DIA_Kreol_GetSuperSoul_01_05");	//Душа архидемона не похожа на все остальные. Ее магическая сила огромна, и просто так совладать с ней ты не в состоянии.
	AI_Output(self,other,"DIA_Kreol_GetSuperSoul_01_06");	//Но с помощью мощного магического артефакта тебе это может оказаться под силу.
	AI_Output(self,other,"DIA_Kreol_GetSuperSoul_01_07");	//Вложив в этот предмет магическую основу души, ты сможешь увеличить его мощь!
	AI_Output(other,self,"DIA_Kreol_GetSuperSoul_01_08");	//И что это должен быть за предмет?
	AI_Output(self,other,"DIA_Kreol_GetSuperSoul_01_09");	//(задумался) Ну, для начала он должен иметь магическую суть создания, ибо только структура подобных артефактов позволяет заключить в них магическую силу души.
	AI_Output(other,self,"DIA_Kreol_GetSuperSoul_01_10");	//А как насчет Когтя Белиара?
	AI_Output(self,other,"DIA_Kreol_GetSuperSoul_01_11");	//КОГОТЬ?! Думаю, он бы идеально подошел для этого.
	AI_Output(self,other,"DIA_Kreol_GetSuperSoul_01_12");	//Ведь его создателем была магия Тьмы Белиара!
	AI_Output(other,self,"DIA_Kreol_GetSuperSoul_01_14");	//Как мне тогда перенести душу архидемона в этот артефакт?
	AI_Output(self,other,"DIA_Kreol_GetSuperSoul_01_15");	//Подойдет любой магический алтарь Темного бога.
	AI_Output(self,other,"DIA_Kreol_GetSuperSoul_01_16");	//Его аура позволит тебе осуществить ритуал переноса души. Больше от тебя ничего не потребуется.
	AI_Output(self,other,"DIA_Kreol_GetSuperSoul_01_17");	//Кроме благосклонности самого Белиара!
	TELLCANSUPERBELIARWEAPON = TRUE;
	B_LogEntry(TOPIC_SUPERBELIARWEAPON_UPG,"Чтобы использовать силу плененной мной души архидемона С'эньяка - мне необходим артефакт, способный поглотить ее силу. Единственный предмет, который может сгодиться для таких целей - это Коготь Белиара! Чтобы осуществить ритуал переноса души в этот артефакт подойдет магический алтарь Темного Бога. Кроме этого сам Белиар должен одобрить мои действия, иначе никак!");
};


instance DIA_KREOL_NDM_TEACHDEMONOLOG(C_Info)
{
	npc = none_102_kreol;
	nr = 1;
	condition = dia_kreol_ndm_teachdemonolog_condition;
	information = dia_kreol_ndm_teachdemonolog_info;
	permanent = TRUE;
	description = "Обучи меня искусству демонологии.";
};


func int dia_kreol_ndm_teachdemonolog_condition()
{
	if((hero.guild == GIL_KDM) && (KREOL_MYTEACHER == TRUE) && (XARDASTELLABOUTDEMONOLOG == TRUE) && ((XARDASTEACHCASTDEMON_SIMPLE == FALSE) || (XARDASTEACHCASTDEMON_LORD == FALSE)))
	{
		return TRUE;
	};
};

func void dia_kreol_ndm_teachdemonolog_info()
{
	AI_Output(other,self,"DIA_Xardas_NDM_TeachDemonolog_01_00");	//Обучи меня искусству демонологии.
	AI_Output(self,other,"DIA_Kreol_NDM_TeachDemonolog_01_00");	//Если ты считаешь, что готов к этому - я научу тебе все тому, что знаю сам.
	Info_ClearChoices(dia_kreol_ndm_teachdemonolog);
	Info_AddChoice(dia_kreol_ndm_teachdemonolog,Dialog_Back,dia_kreol_ndm_teachdemonolog_back);

	if((XARDASTEACHCASTDEMON_SIMPLE == FALSE) && (XARDASTEACHCASTDEMON_LORD == FALSE))
	{
		Info_AddChoice(dia_kreol_ndm_teachdemonolog,b_buildlearnstringfordemonolog("Изучить демонологию.",B_GetLearnCostTalent(other,NPC_TALENT_DEMONOLOG,1)),dia_kreol_ndm_teachdemonolog_simple);
	};
	if((XARDASTEACHCASTDEMON_SIMPLE == TRUE) && (XARDASTEACHCASTDEMON_LORD == FALSE) && (	DemonologSkill[0] >= 3))
	{
		Info_AddChoice(dia_kreol_ndm_teachdemonolog,b_buildlearnstringfordemonolog("Изучить высшую демонологию.",B_GetLearnCostTalent(other,NPC_TALENT_DEMONOLOG,1)),dia_kreol_ndm_teachdemonolog_high);
	};
};

func void dia_kreol_ndm_teachdemonolog_back()
{
	if(XARDASTEACHCASTDEMON_LORD == TRUE)
	{
		AI_Output(self,other,"DIA_Kreol_NDM_TeachDemonolog_BACK_01_00");	//Теперь в твоей власти призывать самих высших демонов.
		AI_Output(self,other,"DIA_Kreol_NDM_TeachDemonolog_BACK_01_01");	//Но будь осторожен! Помни: подчинить этих созданий невероятно трудно!
		AI_Output(self,other,"DIA_Kreol_NDM_TeachDemonolog_BACK_01_02");	//Ошибка в этом деле равнозначна неминуемой смерти.
	};
	Info_ClearChoices(dia_kreol_ndm_teachdemonolog);
};

func void dia_kreol_ndm_teachdemonolog_simple()
{
	if(b_teachdemonologtalent(self,other,NPC_TALENT_DEMONOLOG))
	{
		XARDASTEACHCASTDEMON_SIMPLE = TRUE;
	};
	Info_ClearChoices(dia_kreol_ndm_teachdemonolog);
	Info_AddChoice(dia_kreol_ndm_teachdemonolog,Dialog_Back,dia_kreol_ndm_teachdemonolog_back);

	if((XARDASTEACHCASTDEMON_SIMPLE == FALSE) && (XARDASTEACHCASTDEMON_LORD == FALSE))
	{
		Info_AddChoice(dia_kreol_ndm_teachdemonolog,b_buildlearnstringfordemonolog("Изучить демонологию.",B_GetLearnCostTalent(other,NPC_TALENT_DEMONOLOG,1)),dia_kreol_ndm_teachdemonolog_simple);
	};
	if((XARDASTEACHCASTDEMON_SIMPLE == TRUE) && (XARDASTEACHCASTDEMON_LORD == FALSE) && (	DemonologSkill[0] >= 3))
	{
		Info_AddChoice(dia_kreol_ndm_teachdemonolog,b_buildlearnstringfordemonolog("Изучить высшую демонологию.",B_GetLearnCostTalent(other,NPC_TALENT_DEMONOLOG,1)),dia_kreol_ndm_teachdemonolog_high);
	};
};

func void dia_kreol_ndm_teachdemonolog_high()
{
	if(b_teachdemonologtalent(self,other,NPC_TALENT_DEMONOLOG))
	{
		AI_Output(self,other,"DIA_Kreol_NDM_TeachDemonolog_High_01_00");	//Познай данную тебе силу, и ты обретешь истинное могущество!
		XARDASTEACHCASTDEMON_LORD = TRUE;
	};
	Info_ClearChoices(dia_kreol_ndm_teachdemonolog);
	Info_AddChoice(dia_kreol_ndm_teachdemonolog,Dialog_Back,dia_kreol_ndm_teachdemonolog_back);
};


instance DIA_KREOL_TEACHSACTANOME(C_Info)
{
	npc = none_102_kreol;
	nr = 99;
	condition = dia_kreol_teachsactanome_condition;
	information = dia_kreol_teachsactanome_info;
	permanent = TRUE;
	description = "Обучи меня искусству Сакта Номен! (Очков опыта: 50, Цена: 50000 монет)";
};


func int dia_kreol_teachsactanome_condition()
{
	if((hero.guild == GIL_KDM) && (XARDAS_TEACHSACTANOME == TRUE) && (XARDAS_KNOWSSACTANOME == FALSE))
	{
		return TRUE;
	};
};

func void dia_kreol_teachsactanome_info()
{
	AI_Output(other,self,"DIA_Kreol_TeachSactaNome_01_00");	//Обучи меня искусству Сакта Номен!
	AI_Output(self,other,"DIA_Kreol_TeachSactaNome_01_01");	//Ты действительно в этом уверен?
	Info_ClearChoices(dia_kreol_teachsactanome);
	Info_AddChoice(dia_kreol_teachsactanome,"Пока нет.",dia_kreol_teachsactanome_no);
	Info_AddChoice(dia_kreol_teachsactanome,"Да, уверен.",dia_kreol_teachsactanome_yes);
};

func void dia_kreol_teachsactanome_no()
{
	AI_Output(other,self,"DIA_Kreol_TeachSactaNome_No_01_00");	//Пока нет.
	AI_Output(self,other,"DIA_Kreol_TeachSactaNome_No_01_01");	//Хорошо, как скажешь.
	Info_ClearChoices(dia_kreol_teachsactanome);
};

func void dia_kreol_teachsactanome_yes()
{
	if((Npc_HasItems(other,ItMi_Gold) >= 50000) && (other.lp >= 50))
	{
		AI_Print(PRINT_SACTANOME);
		Snd_Play("MFX_FEAR_CAST");
		Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
		Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
		Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
		AI_Output(self,other,"DIA_Kreol_TeachSactaNome_Yes_01_01");	//Тогда познай же истинную силу темной магии, и пусть твоя жертва не будет напрасной.
		AI_PlayAni(self,"T_PRACTICEMAGIC5");
		AI_Output(self,other,"DIA_Kreol_TeachSactaNome_Yes_01_02");	//САКТА ШАДАР НОМЕН ТАР МАДАР САТАГ!
		AI_PlayAni(self,"T_PRACTICEMAGIC5");
		AI_Output(self,other,"DIA_Kreol_TeachSactaNome_Yes_01_03");	//Используй полученные тобой знания мудро, и пусть багровая Тьма хранит твой путь!
		other.lp = other.lp - 50;
		RankPoints = RankPoints + 50;
		Npc_RemoveInvItems(other,ItMi_Gold,50000);
		XARDAS_KNOWSSACTANOME = TRUE;
		B_LogEntry(TOPIC_ADDON_DMTTEACHER,"Я обучился искусству Сакта Номен - 'Жертва Крови'.");

		if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR) || (hero.guild == GIL_NDM) || (hero.guild == GIL_NDW) || (hero.guild == GIL_NOV))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(hero,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
		};

		Info_ClearChoices(dia_kreol_teachsactanome);
	}
	else if(other.lp < 50)
	{
		AI_Output(self,other,"DIA_Kreol_TeachSactaNome_01_04");	//Ты еще не готов к тому, чтобы овладеть этими знаниями.
		AI_Output(self,other,"DIA_Kreol_TeachSactaNome_01_05");	//У тебя еще слишком мало опыта! Поговорим об этом позже.
		Info_ClearChoices(dia_kreol_teachsactanome);
	}
	else
	{
		AI_Output(self,other,"DIA_Kreol_TeachSactaNome_01_07");	//У тебя не хватает золота!
		AI_Output(self,other,"DIA_Kreol_TeachSactaNome_01_08");	//Поговорим об этом тогда, когда оно у тебя будет.
		Info_ClearChoices(dia_kreol_teachsactanome);
	};
};

instance DIA_KREOL_Kill_Pals(C_Info)
{
	npc = none_102_kreol;
	nr = 1;
	condition = DIA_KREOL_Kill_Pals_condition;
	information = DIA_KREOL_Kill_Pals_info;
	permanent = FALSE;
	description = "Могу я сделать что-нибудь для Темного бога?";
};

func int DIA_KREOL_Kill_Pals_condition()
{
	if((hero.guild == GIL_KDM) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_KREOL_Kill_Pals_info()
{
	AI_Output(other,self,"DIA_KREOL_Kill_Pals_01_01");	//Могу ли я сделать что-нибудь для Темного бога?
	AI_Output(self,other,"DIA_KREOL_Kill_Pals_01_02");	//(надменно) Это ты можешь спросить у него самого. А вот мне помощь действительно не помешала бы!
	AI_Output(other,self,"DIA_KREOL_Kill_Pals_01_03");	//А о чем идет речь?
	AI_Output(self,other,"DIA_KREOL_Kill_Pals_01_04");	//Дело в том, что я тут решил провести один темный магический ритуал.
	AI_Output(self,other,"DIA_KREOL_Kill_Pals_01_05");	//Но, к сожалению, обнаружил, что мне не хватает для этого определенного материала.
	AI_Output(other,self,"DIA_KREOL_Kill_Pals_01_06");	//Какого именно?
	AI_Output(self,other,"DIA_KREOL_Kill_Pals_01_07");	//Ничего особенного. Всего лишь свежей человеческой плоти!
	AI_Output(other,self,"DIA_KREOL_Kill_Pals_01_08");	//И ты называешь это 'всего лишь'?!
	AI_Output(self,other,"DIA_KREOL_Kill_Pals_01_09");	//Для меня эти жалкие людишки всего лишь материал для опытов и исследований.  
	AI_Output(self,other,"DIA_KREOL_Kill_Pals_01_10");	//А их никчемные жизни меня не интересуют!
	AI_Output(self,other,"DIA_KREOL_Kill_Pals_01_11");	//Так ты поможешь мне решить эту проблему или нет?
	Info_ClearChoices(DIA_KREOL_Kill_Pals);
	Info_AddChoice(DIA_KREOL_Kill_Pals,"Нет, такое не для меня.",DIA_KREOL_Kill_Pals_no);
	Info_AddChoice(DIA_KREOL_Kill_Pals,"Да, конечно.",DIA_KREOL_Kill_Pals_yes);
};

func void DIA_KREOL_Kill_Pals_no()
{
	AI_Output(other,self,"DIA_KREOL_Kill_Pals_no_01_01");	//Нет, такое не для меня.
	AI_Output(self,other,"DIA_KREOL_Kill_Pals_no_01_02");	//Я так и думал, что ты окажешься слабаком...(с презрением) Я вообще не понимаю, как ты смог стать темным магом!
	AI_Output(self,other,"DIA_KREOL_Kill_Pals_no_01_03");	//Твое место скорее всего среди этих неженок, что поклоняются своему огненному лжебогу.
	AI_Output(self,other,"DIA_KREOL_Kill_Pals_no_01_04");	//Так что пошел прочь с глаз моих!
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,30);

};

func void DIA_KREOL_Kill_Pals_yes()
{
	AI_Output(other,self,"DIA_KREOL_Kill_Pals_yes_01_01");	//Да, конечно.
	AI_Output(self,other,"DIA_KREOL_Kill_Pals_yes_01_02");	//Что же. Твое рвение достойно уважения.
	AI_Output(self,other,"DIA_KREOL_Kill_Pals_yes_01_03");	//Тогда слушай! Тут неподалеку есть два небольших лагеря людей.
	AI_Output(self,other,"DIA_KREOL_Kill_Pals_yes_01_04");	//Один находится над обрывом моря, а второй внизу, в расщелине.
	AI_Output(self,other,"DIA_KREOL_Kill_Pals_yes_01_05");	//Я уже пробовал насылать на них моих слуг. Но безрезультатно!
	AI_Output(other,self,"DIA_KREOL_Kill_Pals_yes_01_06");	//А в чем причина?
	AI_Output(self,other,"DIA_KREOL_Kill_Pals_yes_01_07");	//Дело в том, что лагерь, расположенный сверху, защищает какая-то очень сильная магия!
	AI_Output(self,other,"DIA_KREOL_Kill_Pals_yes_01_08");	//Ее природа мне не совсем ясна, и пока я ничего не могу с этим сделать.
	AI_Output(self,other,"DIA_KREOL_Kill_Pals_yes_01_09");	//Но вот лагерь, что находится внизу, мне кажется более беззащитным.
	AI_Output(self,other,"DIA_KREOL_Kill_Pals_yes_01_10");	//Однако проблема в том, что среди них есть паладины!
	AI_Output(self,other,"DIA_KREOL_Kill_Pals_yes_01_11");	//А эти воины Инноса очень легко расправляются с нежитью.
	AI_Output(other,self,"DIA_KREOL_Kill_Pals_yes_01_12");	//И что ты хочешь от меня?
	AI_Output(self,other,"DIA_KREOL_Kill_Pals_yes_01_13");	//Я хочу, чтобы ты воспользовался своими умениями темного мага и уничтожил всех этих ублюдков!
	AI_Output(self,other,"DIA_KREOL_Kill_Pals_yes_01_14");	//А когда паладины падут, остальное довершат мои слуги.
	AI_Output(self,other,"DIA_KREOL_Kill_Pals_yes_01_15");	//Но можешь и сам всех убить. Нюансы меня мало интересуют.
	AI_Output(self,other,"DIA_KREOL_Kill_Pals_yes_01_16");	//Главное, что это даст мне возможность продолжить свою подготовку к моему магическому ритуалу.
	AI_Output(other,self,"DIA_KREOL_Kill_Pals_yes_01_17");	//Хорошо, я позабочусь о паладинах.
	MIS_KILL_PALS = LOG_Running;
	Log_CreateTopic(TOPIC_KILL_PALS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KILL_PALS,LOG_Running);
	B_LogEntry(TOPIC_KILL_PALS,"Креол хочет чтобы я уничтожил лагерь в расщелине, недалеко от его башни. Ему будет достаточно, если я убью всех паладинов. Что же, если уж и быть злом - то быть до конца!");
	AI_StopProcessInfos(self);
};

instance DIA_KREOL_Kill_Pals_Done(C_Info)
{
	npc = none_102_kreol;
	nr = 1;
	condition = DIA_KREOL_Kill_Pals_Done_condition;
	information = DIA_KREOL_Kill_Pals_Done_info;
	permanent = FALSE;
	description = "Паладины мертвы.";
};

func int DIA_KREOL_Kill_Pals_Done_condition()
{
	if((hero.guild == GIL_KDM) && (KAPITELORCATC == FALSE) && (MIS_KILL_PALS == LOG_Running) && (ALBERTISDEAD == TRUE))
	{
		return TRUE;
	};
};


func void DIA_KREOL_Kill_Pals_Done_info()
{
	B_GivePlayerXP(2000);
	AI_Output(other,self,"DIA_KREOL_Kill_Pals_Done_01_01");	//Паладины мертвы.
	AI_Output(self,other,"DIA_KREOL_Kill_Pals_Done_01_02");	//Отлично! Я сейчас же пошлю своих слуг собрать этот урожай смерти.
	AI_Output(self,other,"DIA_KREOL_Kill_Pals_Done_01_03");	//А тебя ждет щедрая награда за твои старания.
	AI_Output(other,self,"DIA_KREOL_Kill_Pals_Done_01_04");	//Надеюсь, действительно щедрая.
	AI_Output(self,other,"DIA_KREOL_Kill_Pals_Done_01_05");	//Можешь не сомневаться. Вот, возьми эти магические зелья.
	AI_Output(self,other,"DIA_KREOL_Kill_Pals_Done_01_06");	//Уверен, ты знаешь что с ними делать.
	B_GiveInvItems(self,other,ITPO_DEMON_POTION,1);
	MIS_KILL_PALS = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_KILL_PALS,LOG_SUCCESS);
	B_LogEntry(TOPIC_KILL_PALS,"Креол остался доволен проделанной мной работой.");
};


instance DIA_KREOL_Kill_Done_Rings(C_Info)
{
	npc = none_102_kreol;
	nr = 1;
	condition = DIA_KREOL_Kill_Done_Rings_condition;
	information = DIA_KREOL_Kill_Done_Rings_info;
	permanent = FALSE;
	description = "У меня есть кольца паладинов.";
};

func int DIA_KREOL_Kill_Done_Rings_condition()
{
	if((hero.guild == GIL_KDM) && (Npc_HasItems(hero,itri_quest_pal_ring) >= 1))
	{
		return TRUE;
	};
};

func void DIA_KREOL_Kill_Done_Rings_info()
{
	var int RingSum;
	var int RingSumXP;
	var int RingSumGold;

	AI_Output(other,self,"DIA_KREOL_Kill_Done_Rings_01_01");	//У меня есть кольца паладинов. Тебя они интересуют?
	AI_Output(self,other,"DIA_KREOL_Kill_Done_Rings_01_03");	//(в бешенстве) Немедленно убери от меня эту гадость! Ты что, сошел с ума, предлагать мне такое?!
	AI_Output(self,other,"DIA_KREOL_Kill_Done_Rings_01_04");	//Хотя постой. Ты говоришь, что они принадлежали паладинам?
	AI_Output(other,self,"DIA_KREOL_Kill_Done_Rings_01_05");	//Да, именно так.
	AI_Output(self,other,"DIA_KREOL_Kill_Done_Rings_01_06");	//Возможно, они мне действительно пригодятся.
	AI_Output(self,other,"DIA_KREOL_Kill_Done_Rings_01_07");	//Я могу превратить их в артефакты тьмы, способные подчинять моей воле их хозяина.
	AI_Output(self,other,"DIA_KREOL_Kill_Done_Rings_01_08");	//(зловеще) И у меня будет своя армия. Армия обращенных паладинов!
	AI_Output(self,other,"DIA_KREOL_Kill_Done_Rings_01_09");	//Так что немедленно давай их сюда!
	AI_Output(other,self,"DIA_KREOL_Kill_Done_Rings_01_10");	//Вот, держи.

	RingSum = Npc_HasItems(hero,itri_quest_pal_ring);
	B_GiveInvItems(other,self,itri_quest_pal_ring,RingSum);
	Npc_RemoveInvItems(self,itri_quest_pal_ring,Npc_HasItems(self,itri_quest_pal_ring));

	if(RingSum == 1)
	{
		RingSumXP = RingSum * 100;
		RingSumGold = RingSum * 100;
		AI_Output(self,other,"DIA_KREOL_Kill_Done_Rings_01_11");	//Как? Одно кольцо? Ты что, издеваешься надо мной?!
		AI_Output(other,self,"DIA_KREOL_Kill_Done_Rings_01_12");	//Извини, но у меня больше нет.
		AI_Output(self,other,"DIA_KREOL_Kill_Done_Rings_01_13");	//Вот, забирай свою награду и проваливай отсюда!
	}
	else if(RingSum <= 3)
	{
		RingSumXP = RingSum * 150;
		RingSumGold = RingSum * 150;
		AI_Output(self,other,"DIA_KREOL_Kill_Done_Rings_01_14");	//Хммм. Не так уж у тебя их и много.
		AI_Output(other,self,"DIA_KREOL_Kill_Done_Rings_01_15");	//Извини, но у меня больше нет.
		AI_Output(self,other,"DIA_KREOL_Kill_Done_Rings_01_16");	//Ладно, вот твоя награда. Хотя ты и этого не заслужил!
	}
	else if(RingSum > 3)
	{
		RingSumXP = RingSum * 200;
		RingSumGold = RingSum * 200;
		AI_Output(self,other,"DIA_KREOL_Kill_Done_Rings_01_17");	//Отлично! Этого количества мне вполне хватит.
		AI_Output(self,other,"DIA_KREOL_Kill_Done_Rings_01_18");	//Вот твоя награда. Ты ее честно заслужил!
	};

	B_GivePlayerXP(RingSumXP);
	B_GiveInvItems(self,other,ItMi_Gold,RingSumGold);
	AI_StopProcessInfos(self);

	if(RingSum <= 1)
	{
		Npc_SetRefuseTalk(self,30);
	};
};

instance DIA_Kreol_MonasterySecret(C_Info)
{
	npc = none_102_kreol;
	nr = 1;
	condition = DIA_Kreol_MonasterySecret_condition;
	information = DIA_Kreol_MonasterySecret_info;
	permanent = FALSE;
	description = "У меня есть один свиток.";
};

func int DIA_Kreol_MonasterySecret_condition()
{
	if((MonasterySecretLeadOW == TRUE) && (MIS_MonasterySecret == LOG_Running) && (Npc_HasItems(hero,ITWr_MonasterySecretLeadOW) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Kreol_MonasterySecret_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Kreol_MonasterySecret_01_01");	//У меня есть один свиток.
	AI_Output(self,other,"DIA_Kreol_MonasterySecret_01_02");	//(пренебрежительно) И почему это должно интересовать меня?
	AI_Output(other,self,"DIA_Kreol_MonasterySecret_01_03");	//Потому что в нем упоминается твое имя.
	AI_Output(self,other,"DIA_Kreol_MonasterySecret_01_04");	//Правда? Хорошо, дай мне взглянуть на него.
	B_GiveInvItems(other,self,ITWr_MonasterySecretLeadOW,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Kreol_MonasterySecret_01_05");	//Хммм...(задумчиво) Откуда он у тебя?
	AI_Output(other,self,"DIA_Kreol_MonasterySecret_01_06");	//Я нашел его в башне Амон Шен.
	AI_Output(self,other,"DIA_Kreol_MonasterySecret_01_07");	//В старой башне некроманта Нергала?!
	AI_Output(other,self,"DIA_Kreol_MonasterySecret_01_08");	//Ну, судя по всему, да. Именно там.
	AI_Output(self,other,"DIA_Kreol_MonasterySecret_01_09");	//Так значит, этот безумец до конца своих дней мечтал заполучить этот артефакт!
	AI_Output(other,self,"DIA_Kreol_MonasterySecret_01_10");	//Ты говоришь о предмете, способным управлять живым драконом?
	AI_Output(self,other,"DIA_Kreol_MonasterySecret_01_11");	//Именно о нем!
	AI_Output(other,self,"DIA_Kreol_MonasterySecret_01_12");	//И что ты о нем знаешь?
	AI_Output(self,other,"DIA_Kreol_MonasterySecret_01_13");	//(ехидно) Немного. Одно мне известно точно: выглядит он как магический жезл, в основании которого находится огненный глаз дракона.
	AI_Output(self,other,"DIA_Kreol_MonasterySecret_01_14");	//Маг, который создал этот артефакт, перед смертью разбил жезл на четыре равные части и спрятал их на этом острове!
	AI_Output(other,self,"DIA_Kreol_MonasterySecret_01_15");	//Но откуда тебе все это известно?
	AI_Output(self,other,"DIA_Kreol_MonasterySecret_01_16");	//Один из кусков этого жезла находится у меня! Но тебе его никогда не заполучить, даже и не мечтай.
	AI_Output(self,other,"DIA_Kreol_MonasterySecret_01_17");	//К тому же без трех остальных частей это всего лишь груда металлолома, не более.
	AI_Output(other,self,"DIA_Kreol_MonasterySecret_01_18");	//А если я принесу тебе оставшиеся части, что тогда?
	AI_Output(self,other,"DIA_Kreol_MonasterySecret_01_19");	//Вот тогда и продолжим этот разговор! Ясно?
	AI_Output(other,self,"DIA_Kreol_MonasterySecret_01_20");	//Вполне.
	MonasterySecret_Kreol = TRUE;
	B_LogEntry(TOPIC_MonasterySecret,"Креол рассказал мне об артефакте, которым я заинтересовался. Оказывается выглядит он, как магический жезл в основании которого вставлен настоящий драконий глаз! Однако маг, который создал этот предмет, перед своей смертью разделил жезл на четыре равные части и спрятал их где-то на острове. Одна часть находится у самого Креола, а вот другие по всей видимости мне предстоит найти самому. Если конечно я хочу услышать продолжение этой истории.");
};

instance DIA_Kreol_MonasterySecret_Done(C_Info)
{
	npc = none_102_kreol;
	nr = 1;
	condition = DIA_Kreol_MonasterySecret_Done_condition;
	information = DIA_Kreol_MonasterySecret_Done_info;
	permanent = FALSE;
	description = "Я принес все недостающие куски жезла.";
};

func int DIA_Kreol_MonasterySecret_Done_condition()
{
	if((Kapitel < 6) && (MonasterySecret_Kreol == TRUE) && (MIS_MonasterySecret == LOG_Running) && (Npc_HasItems(hero,ItMi_DragonStaffPiece_01) >= 1) && (Npc_HasItems(hero,ItMi_DragonStaffPiece_03) >= 1) && (Npc_HasItems(hero,ItMi_DragonStaffPiece_04) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Kreol_MonasterySecret_Done_info()
{
	B_GivePlayerXP(2000);
	AI_Output(other,self,"DIA_Kreol_MonasterySecret_Two_01_01");	//Я принес все недостающие куски жезла.
	AI_Output(self,other,"DIA_Kreol_MonasterySecret_Two_01_02");	//(надменно) Не поверю, пока не увижу их собственными глазами!
	AI_Output(other,self,"DIA_Kreol_MonasterySecret_Two_01_03");	//Вот, смотри.
	B_GiveInvItemsManyThings(other,self);
	Npc_RemoveInvItems(other,ItMi_DragonStaffPiece_01,1);
	Npc_RemoveInvItems(other,ItMi_DragonStaffPiece_03,1);
	Npc_RemoveInvItems(other,ItMi_DragonStaffPiece_04,1);
	AI_Output(self,other,"DIA_Kreol_MonasterySecret_Two_01_04");	//Да, похоже, это действительно они! Никогда бы не подумал, что кому-то удастся это сделать.
	AI_Output(other,self,"DIA_Kreol_MonasterySecret_Two_01_05");	//Ты обещал рассказать мне больше об этом артефакте.
	AI_Output(self,other,"DIA_Kreol_MonasterySecret_Two_01_06");	//(властно) Конечно. Я сдержу свое слово!
	AI_Output(self,other,"DIA_Kreol_MonasterySecret_Two_01_07");	//Ты уже знаешь, что с помощью этого жезла можно призвать в этот мир настоящего дракона.
	AI_Output(self,other,"DIA_Kreol_MonasterySecret_Two_01_08");	//По своей силе он, конечно, уступит тем древним созданиям, что обитали здесь, в Долине Рудников.
	AI_Output(self,other,"DIA_Kreol_MonasterySecret_Two_01_09");	//Однако это не означает, что он будет абсолютно бесполезен для своего хозяина!
	AI_Output(self,other,"DIA_Kreol_MonasterySecret_Two_01_10");	//Но для того, чтобы придать жезлу его полную силу, необходима еще одна вещь.
	AI_Output(other,self,"DIA_Kreol_MonasterySecret_Two_01_11");	//Что еще нужно?
	AI_Output(self,other,"DIA_Kreol_MonasterySecret_Two_01_12");	//Глаз дракона! Эти железки бесполезны, если не наполнены силой настоящего ока этого древнего существа.
	AI_Output(self,other,"DIA_Kreol_MonasterySecret_Two_01_13");	//Именно с его помощью хозяин контролирует призываемое существо. В ином случае оно просто не подчинится его воле.
	AI_Output(self,other,"DIA_Kreol_MonasterySecret_Two_01_14");	//К сожалению, ты убил всех драконов в этой Долине.
	AI_Output(self,other,"DIA_Kreol_MonasterySecret_Two_01_15");	//Поэтому можешь оставить этот мусор себе!
	B_GiveInvItemsManyThings(self,other);
	CreateInvItems(other,ItMi_DragonStaffPiece_01,1);
	CreateInvItems(other,ItMi_DragonStaffPiece_02,1);
	CreateInvItems(other,ItMi_DragonStaffPiece_03,1);
	CreateInvItems(other,ItMi_DragonStaffPiece_04,1);
	AI_Output(other,self,"DIA_Kreol_MonasterySecret_Two_01_16");	//Неужели ничего нельзя сделать?
	AI_Output(self,other,"DIA_Kreol_MonasterySecret_Two_01_17");	//(ворчливо) А ты видишь вокруг себя целые стаи древних созданий?!
	AI_Output(other,self,"DIA_Kreol_MonasterySecret_Two_01_18");	//Но если я все-таки повстречаю дракона, как можно будет воссоздать этот артефакт?
	AI_Output(self,other,"DIA_Kreol_MonasterySecret_Two_01_19");	//Ты упрям как осел! Но если ты и впрямь считаешь, что тебе еще представиться шанс встретить одного из них...
	AI_Output(self,other,"DIA_Kreol_MonasterySecret_Two_01_20");	//...то нужно будет просто сковать все части жезла воедино и вставить око в его основание!
	AI_Output(self,other,"DIA_Kreol_MonasterySecret_Two_01_21");	//Сила жезла оживит глаз, и после этого можно будет использовать сам жезл.
	AI_Output(other,self,"DIA_Kreol_MonasterySecret_Two_01_22");	//С оком все ясно. А что насчет костей?
	AI_Output(self,other,"DIA_Kreol_MonasterySecret_Two_01_23");	//Тебе понадобится четыре драконьих черепа для изготовления крепежа. Ни больше, ни меньше!
	MIS_MonasterySecret = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_MonasterySecret,LOG_SUCCESS);
	B_LogEntry(TOPIC_MonasterySecret,"Для создания жезла мне понадобится еще несколько предметов - четыре драконьих черепа и глаз дракона!");
};

var int EligorNoSword;
var int EligorNoBow;
var int EligorNoStaff;
var int CanTellSleeperAgain;

instance DIA_Kreol_Sleeper(C_Info)
{
	npc = none_102_kreol;
	nr = 1;
	condition = DIA_Kreol_Sleeper_condition;
	information = DIA_Kreol_Sleeper_info;
	permanent = FALSE;
	description = "Что ты знаешь о Спящем?";
};

func int DIA_Kreol_Sleeper_condition()
{
	if((SleeperOldIsDead == FALSE) && (NeedDemonolog == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Kreol_Sleeper_info()
{
	B_GivePlayerXP(2000);
	AI_Output(other,self,"DIA_Kreol_Sleeper_01_01");	//Что ты знаешь о Спящем?
	AI_Output(self,other,"DIA_Kreol_Sleeper_01_02");	//(задумчиво) Он древнейший из демонов еще тех времен, когда этот мир только зарождался.
	AI_Output(self,other,"DIA_Kreol_Sleeper_01_03");	//Именно его присутствие в этой части острова заставило меня появиться здесь.
	AI_Output(other,self,"DIA_Kreol_Sleeper_01_04");	//А зачем он вообще тебе понадобился?
	AI_Output(self,other,"DIA_Kreol_Sleeper_01_05");	//Я хотел более тщательно исследовать демоническую ауру этого существа, его магические свойства.
	AI_Output(self,other,"DIA_Kreol_Sleeper_01_06");	//Но, к сожалению, один местный олух каким-то образом смог изгнать этого демона из мира людей.
	AI_Output(self,other,"DIA_Kreol_Sleeper_01_07");	//И многие годы моих исследований пошли прахом!
	AI_Output(other,self,"DIA_Kreol_Sleeper_01_08");	//Ты ошибаешься! Спящий вернулся.
	AI_Output(self,other,"DIA_Kreol_Sleeper_01_09");	//(недоверчиво) Что? Откуда тебе это известно?
	AI_Output(other,self,"DIA_Kreol_Sleeper_01_10");	//Потому что я и есть тот олух, что тогда изгнал его.
	AI_Output(self,other,"DIA_Kreol_Sleeper_01_11");	//Ты?! (пристально вглядываясь) Хотя да, ты вполне мог это сделать!
	AI_Output(self,other,"DIA_Kreol_Sleeper_01_12");	//Если тебе удалось уничтожить Аватара самого Белиара, то и со Спящим у тебя могло получиться.
	AI_Output(other,self,"DIA_Kreol_Sleeper_01_13");	//Как мне в этот раз одолеть его?
	AI_Output(other,self,"DIA_Kreol_Sleeper_01_14");	//Может, великий темный маг и избранный самого Белиара подскажет мне, как это сделать?
	AI_Output(self,other,"DIA_Kreol_Sleeper_01_15");	//Хммм...(довольно) И что же тебе мешает сделать это снова?
	AI_Output(other,self,"DIA_Kreol_Sleeper_01_16");	//Его магия! Она сводит меня с ума.
	AI_Output(self,other,"DIA_Kreol_Sleeper_01_17");	//Ну конечно! Это и неудивительно!
	AI_Output(self,other,"DIA_Kreol_Sleeper_01_18");	//Ведь ты лишь простой смертный! А он древнейший из демонов...
	AI_Output(other,self,"DIA_Kreol_Sleeper_01_19");	//Так ты мне дашь совет или нет?
	AI_Output(self,other,"DIA_Kreol_Sleeper_01_20");	//Ну хорошо. Мы поступим так! Давай заключим сделку.
	AI_Output(self,other,"DIA_Kreol_Sleeper_01_21");	//Я расскажу тебе, как можно противостоять его ментальным атакам, а ты в свою очередь принесешь мне его сердце!
	AI_Output(self,other,"DIA_Kreol_Sleeper_01_22");	//Этого мне вполне хватит для моих исследований. Ну как, договорились?
	AI_Output(other,self,"DIA_Kreol_Sleeper_01_23");	//У меня нет выбора. Так что я согласен.
	AI_Output(self,other,"DIA_Kreol_Sleeper_01_24");	//Хорошо. Тогда слушай меня внимательно.
	AI_Output(self,other,"DIA_Kreol_Sleeper_01_25");	//Тебе нужен артефакт, способный защитить твой разум от влияния демона.
	AI_Output(self,other,"DIA_Kreol_Sleeper_01_26");	//Его называют Венцом Демонов! Он был создан самим Белиаром и преподнесен в дар самому могущественному демону этого мира.
	AI_Output(other,self,"DIA_Kreol_Sleeper_01_27");	//Интересно, кто это?
	AI_Output(self,other,"DIA_Kreol_Sleeper_01_28");	//Элигор, повелитель Лэнга - обители демонов...(с уважением) Но просто так он тебе его не отдаст!
	AI_Output(self,other,"DIA_Kreol_Sleeper_01_29");	//Ведь это то же самое, что корона на голове у короля.
	AI_Output(self,other,"DIA_Kreol_Sleeper_01_30");	//И я даже представить боюсь, что он может потребовать от тебя взамен.
	AI_Output(self,other,"DIA_Kreol_Sleeper_01_31");	//Хммм...(пристально вглядываясь) А что ты вообще можешь предложить?
	Info_ClearChoices(DIA_Kreol_Sleeper);
	Info_AddChoice(DIA_Kreol_Sleeper,"К сожалению, ничего равного.",DIA_Kreol_Sleeper_No);

	if((Npc_HasItems(hero,ITMI_HELMSLEEPER) >= 1) || (Npc_HasItems(hero,ITMI_HELMSLEEPER_MIS) >= 1))
	{
		Info_AddChoice(DIA_Kreol_Sleeper,"Вот маска Спящего!",DIA_Kreol_Sleeper_Mask);
	};
	if(hero.guild != GIL_KDW)
	{
		if(Npc_HasItems(hero,G3_ARMOR_HELMET_CRONE) >= 1)
		{
			Info_AddChoice(DIA_Kreol_Sleeper,"У меня есть Корона Льда!",DIA_Kreol_Sleeper_Adanos);
		};
	};
	if((EligorNoSword == FALSE) && (Npc_HasItems(hero,ITMW_2H_DRAGONMASTER) >= 1))
	{
		Info_AddChoice(DIA_Kreol_Sleeper,"(предложить меч Повелитель драконов)",DIA_Kreol_Sleeper_Sword);
	};
	if((EligorNoBow == FALSE) && (Npc_HasItems(hero,ITRW_G3_DEMON_BOW_01) >= 1))
	{
		Info_AddChoice(DIA_Kreol_Sleeper,"(предложить лук Цвет Смерти)",DIA_Kreol_Sleeper_Bow);
	};
	if((EligorNoStaff == FALSE) && (Npc_HasItems(hero,ITMW_2H_KMR_DAEMONSTAFF_01) >= 1))
	{
		Info_AddChoice(DIA_Kreol_Sleeper,"(предложить посох Гаситель Душ)",DIA_Kreol_Sleeper_Staff);
	};
	if((hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
	{
		if((Npc_HasItems(hero,ItMi_InnosEye_MIS) >= 1) || (Npc_HasItems(hero,ItMi_InnosEye_Discharged_Mis) >= 1))
		{
			Info_AddChoice(DIA_Kreol_Sleeper,"(предложить Глаз Инноса)",DIA_Kreol_Sleeper_Innos);
		};
	};
};

func void DIA_Kreol_Sleeper_No()
{
	AI_Output(other,self,"DIA_Kreol_Sleeper_No_01_01");	//К сожалению, ничего стоящего.
	AI_Output(self,other,"DIA_Kreol_Sleeper_No_01_02");	//Тогда нам нечего обсуждать.
	CanTellSleeperAgain = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_Kreol_Sleeper_Mask()
{
	AI_Output(other,self,"DIA_Kreol_Sleeper_Mask_01_01");	//У меня есть маска Спящего!
	AI_Output(self,other,"DIA_Kreol_Sleeper_Mask_01_02");	//Да, это довольно ценная вещь!
	AI_Output(self,other,"DIA_Kreol_Sleeper_Mask_01_03");	//И она вполне бы могла заинтересовать Элигора.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Mask_01_04");	//Думаю, мы поступим так...(задумчиво) Ты сейчас отдашь ее мне.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Mask_01_05");	//А я в свою очередь подготовлю все необходимое для ритуала вызова демона.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Mask_01_06");	//Согласен?
	AI_Output(other,self,"DIA_Kreol_Sleeper_Mask_01_07");	//Ладно, держи ее.

	if(Npc_HasItems(hero,ITMI_HELMSLEEPER) >= 1)
	{
		B_GiveInvItems(other,self,ITMI_HELMSLEEPER,1);
		Npc_RemoveInvItems(self,ITMI_HELMSLEEPER,1);
	}
	else
	{
		B_GiveInvItems(other,self,ITMI_HELMSLEEPER_MIS,1);
		Npc_RemoveInvItems(self,ITMI_HELMSLEEPER_MIS,1);
	};

	AI_Output(self,other,"DIA_Kreol_Sleeper_Mask_01_08");	//Отлично! Попробуй заглянуть ко мне через пару дней.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Mask_01_09");	//Этого времени мне хватит, чтобы уладить вопрос с самим Элигором.
	AI_Output(other,self,"DIA_Kreol_Sleeper_Mask_01_10");	//Хорошо! Но только не вздумай меня обмануть.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Mask_01_11");	//(надменно) Не беспокойся. Сделка есть сделка!
	B_LogEntry(TOPIC_SLEEPERBACK,"Я отдал Креолу маску Спящего в надежде заполучить могущественный артефакт, называемый 'Венцом Демонов'! Только с его помощью я смогу противостоять магии Спящего. Его нынешний владелец - Элигор, самый могущественный демон этого мира. Через пару дней мне стоит вновь заглянуть к Креолу, чтобы получить последние инструкции...");
	DemonCrownRitualDay = Wld_GetDay();
	HasSleeperDefence = 1;
	AI_StopProcessInfos(self);
};

func void DIA_Kreol_Sleeper_Adanos()
{
	AI_Output(other,self,"DIA_Kreol_Sleeper_Adanos_01_01");	//У меня есть Корона Льда!
	AI_Output(self,other,"DIA_Kreol_Sleeper_Adanos_01_02");	//Древнейший артефакт, созданный самим Аданосом?
	AI_Output(self,other,"DIA_Kreol_Sleeper_Adanos_01_03");	//Да, это вполне бы могло заинтересовать Элигора.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Adanos_01_04");	//Думаю, мы поступим так...(задумчиво) Ты сейчас отдашь ее мне.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Adanos_01_05");	//А я в свою очередь подготовлю все необходимое для ритуала вызова демона.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Adanos_01_06");	//Согласен?
	AI_Output(other,self,"DIA_Kreol_Sleeper_Adanos_01_07");	//Ладно, держи корону.
	B_GiveInvItems(other,self,G3_ARMOR_HELMET_CRONE,1);
	Npc_RemoveInvItems(self,G3_ARMOR_HELMET_CRONE,1);
	AI_Output(self,other,"DIA_Kreol_Sleeper_Adanos_01_08");	//Отлично! Тогда, попробуй заглянуть ко мне через пару дней.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Adanos_01_09");	//Этого времени мне хватит, чтобы уладить вопрос с самим Элигором.
	AI_Output(other,self,"DIA_Kreol_Sleeper_Adanos_01_10");	//Хорошо! Но только не вздумай меня обмануть.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Adanos_01_11");	//(надменно) Не беспокойся. Сделка есть сделка!
	B_LogEntry(TOPIC_SLEEPERBACK,"Я отдал Креолу 'Корона Льда' в надежде заполучить могущественный артефакт, называемый 'Венцом Демонов'! Только с его помощью я смогу противостоять магии Спящего. Его нынешний владелец - Элигор, самый могущественный демон этого мира. Через пару дней мне стоит вновь заглянуть к Креолу, чтобы получить последние инструкции...");
	DemonCrownRitualDay = Wld_GetDay();
	HasSleeperDefence = 2;
	AI_StopProcessInfos(self);
};

func void DIA_Kreol_Sleeper_Sword()
{
	AI_Output(other,self,"DIA_Kreol_Sleeper_Sword_01_01");	//У меня есть меч Повелитель драконов!
	AI_Output(self,other,"DIA_Kreol_Sleeper_Sword_01_02");	//Хммм...(задумчиво) Хорошее оружие! Но вряд ли оно заинтересует Элигора.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Sword_01_03");	//Попробуй предложить что-нибудь еще.
	EligorNoSword = TRUE;
};

func void DIA_Kreol_Sleeper_Bow()
{
	AI_Output(other,self,"DIA_Kreol_Sleeper_Bow_01_01");	//У меня есть лук Цвет Смерти!
	AI_Output(self,other,"DIA_Kreol_Sleeper_Bow_01_02");	//Нет, это все не то.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Bow_01_03");	//Нужно что-то действительно ценное, чтобы произвести впечатление на Элигора!
	EligorNoBow = TRUE;
};

func void DIA_Kreol_Sleeper_Staff()
{
	AI_Output(other,self,"DIA_Kreol_Sleeper_Staff_01_01");	//У меня есть посох Гаситель Душ!
	AI_Output(self,other,"DIA_Kreol_Sleeper_Staff_01_02");	//(презрительно) И зачем он владыке демонов?
	AI_Output(self,other,"DIA_Kreol_Sleeper_Staff_01_03");	//Лучше хорошенько подумай, прежде чем предлагать ему всякий мусор.
	EligorNoStaff = TRUE;
};

func void DIA_Kreol_Sleeper_Innos()
{
	AI_Output(other,self,"DIA_Kreol_Sleeper_Innos_01_01");	//У меня есть Глаз Инноса!
	AI_Output(self,other,"DIA_Kreol_Sleeper_Innos_01_02");	//Хммм...(задумчиво) Древнейший артефакт паладинов?
	AI_Output(self,other,"DIA_Kreol_Sleeper_Innos_01_03");	//Да, это вполне бы могло заинтересовать Элигора.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Innos_01_04");	//Думаю, мы поступим так...(задумчиво) Ты сейчас отдашь его мне.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Innos_01_05");	//А я в свою очередь подготовлю все необходимое для ритуала вызова демона.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Innos_01_06");	//Согласен?
	AI_Output(other,self,"DIA_Kreol_Sleeper_Innos_01_07");	//Ладно, держи амулет.

	if(Npc_HasItems(hero,ItMi_InnosEye_MIS) >= 1)
	{
		B_GiveInvItems(other,self,ItMi_InnosEye_MIS,1);
		Npc_RemoveInvItems(self,ItMi_InnosEye_MIS,1);
	}
	else
	{
		B_GiveInvItems(other,self,ItMi_InnosEye_Discharged_Mis,1);
		Npc_RemoveInvItems(self,ItMi_InnosEye_Discharged_Mis,1);
	};

	AI_Output(self,other,"DIA_Kreol_Sleeper_Innos_01_08");	//Отлично! Попробуй заглянуть ко мне через пару дней.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Innos_01_09");	//Этого времени мне хватит, чтобы уладить вопрос с самим Элигором.
	AI_Output(other,self,"DIA_Kreol_Sleeper_Innos_01_10");	//Хорошо! Но только не вздумай меня обмануть.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Innos_01_11");	//(надменно) Не беспокойся. Сделка есть сделка!
	B_LogEntry(TOPIC_SLEEPERBACK,"Я отдал Креолу 'Глаз Инноса' в надежде заполучить могущественный артефакт, называемый 'Венцом Демонов'! Только с его помощью я смогу противостоять магии Спящего. Его нынешний владелец - Элигор, самый могущественный демон этого мира. Через пару дней мне стоит вновь заглянуть к Креолу, чтобы получить последние инструкции...");
	DemonCrownRitualDay = Wld_GetDay();
	HasSleeperDefence = 3;
	AI_StopProcessInfos(self);
};

instance DIA_Kreol_Sleeper_Again(C_Info)
{
	npc = none_102_kreol;
	nr = 1;
	condition = DIA_Kreol_Sleeper_Again_condition;
	information = DIA_Kreol_Sleeper_Again_info;
	permanent = TRUE;
	description = "По поводу нашего последнего разговора...";
};

func int DIA_Kreol_Sleeper_Again_condition()
{
	if((SleeperOldIsDead == FALSE) && (CanTellSleeperAgain == TRUE) && (HasSleeperDefence == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Kreol_Sleeper_Again_info()
{
	AI_Output(other,self,"DIA_Kreol_Sleeper_Again_01_01");	//По поводу нашего последнего разговора...
	AI_Output(self,other,"DIA_Kreol_Sleeper_Again_01_02");	//Что? Принес мне кое-что интересное?
	Info_ClearChoices(DIA_Kreol_Sleeper_Again);
	Info_AddChoice(DIA_Kreol_Sleeper_Again,"К сожалению, ничего стоящего.",DIA_Kreol_Sleeper_Again_No);

	if((Npc_HasItems(hero,ITMI_HELMSLEEPER) >= 1) || (Npc_HasItems(hero,ITMI_HELMSLEEPER_MIS) >= 1))
	{
		Info_AddChoice(DIA_Kreol_Sleeper,"Вот маска Спящего!",DIA_Kreol_Sleeper_Mask);
	};
	if(hero.guild != GIL_KDW)
	{
		if(Npc_HasItems(hero,G3_ARMOR_HELMET_CRONE) >= 1)
		{
			Info_AddChoice(DIA_Kreol_Sleeper_Again,"У меня есть Корона Льда!",DIA_Kreol_Sleeper_Again_Adanos);
		};
	};
	if((EligorNoSword == FALSE) && (Npc_HasItems(hero,ITMW_2H_DRAGONMASTER) >= 1))
	{
		Info_AddChoice(DIA_Kreol_Sleeper_Again,"(предложить меч Повелитель драконов)",DIA_Kreol_Sleeper_Again_Sword);
	};
	if((EligorNoBow == FALSE) && (Npc_HasItems(hero,ITRW_G3_DEMON_BOW_01) >= 1))
	{
		Info_AddChoice(DIA_Kreol_Sleeper_Again,"(предложить лук Цвет Смерти)",DIA_Kreol_Sleeper_Again_Bow);
	};
	if((EligorNoStaff == FALSE) && (Npc_HasItems(hero,ITMW_2H_KMR_DAEMONSTAFF_01) >= 1))
	{
		Info_AddChoice(DIA_Kreol_Sleeper_Again,"(предложить отдать посох Гаситель Душ)",DIA_Kreol_Sleeper_Again_Staff);
	};
	if((hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
	{
		if((Npc_HasItems(hero,ItMi_InnosEye_MIS) >= 1) || (Npc_HasItems(hero,ItMi_InnosEye_Discharged_Mis) >= 1))
		{
			Info_AddChoice(DIA_Kreol_Sleeper_Again,"(предложить Глаз Инноса)",DIA_Kreol_Sleeper_Again_Innos);
		};
	};
};

func void DIA_Kreol_Sleeper_Again_No()
{
	AI_Output(other,self,"DIA_Kreol_Sleeper_No_01_01");	//К сожалению, ничего стоящего.
	AI_Output(self,other,"DIA_Kreol_Sleeper_No_01_02");	//Тогда нам нечего обсуждать. И хватит тратить мое время попусту!
	CanTellSleeperAgain = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_Kreol_Sleeper_Again_Mask()
{
	AI_Output(other,self,"DIA_Kreol_Sleeper_Mask_01_01");	//У меня есть маска Спящего.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Mask_01_02");	//Да, это довольно ценная вещь.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Mask_01_03");	//И она вполне бы могла заинтересовать Элигора.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Mask_01_04");	//Думаю, мы поступим так...(задумчиво) Ты сейчас отдашь ее мне.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Mask_01_05");	//А я в свою очередь подготовлю все необходимое для ритуала вызова демона.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Mask_01_06");	//Согласен?
	AI_Output(other,self,"DIA_Kreol_Sleeper_Mask_01_07");	//Ладно, держи ее.

	if(Npc_HasItems(hero,ITMI_HELMSLEEPER) >= 1)
	{
		B_GiveInvItems(other,self,ITMI_HELMSLEEPER,1);
		Npc_RemoveInvItems(self,ITMI_HELMSLEEPER,1);
	}
	else
	{
		B_GiveInvItems(other,self,ITMI_HELMSLEEPER_MIS,1);
		Npc_RemoveInvItems(self,ITMI_HELMSLEEPER_MIS,1);
	};

	AI_Output(self,other,"DIA_Kreol_Sleeper_Mask_01_08");	//Отлично! Тогда, попробуй заглянуть ко мне через пару дней.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Mask_01_09");	//Этого времени мне хватит, чтобы уладить вопрос с самим Элигором.
	AI_Output(other,self,"DIA_Kreol_Sleeper_Mask_01_10");	//Хорошо! Но только не вздумай меня обмануть.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Mask_01_11");	//(надменно) Не беспокойся. Сделка есть сделка!
	B_LogEntry(TOPIC_SLEEPERBACK,"Я отдал Креолу маску Спящего в надежде заполучить могущественный артефакт, называемый 'Венцом Демонов'! Только с его помощью я смогу противостоять магии Спящего. Его нынешний владелец - Элигор, самый могущественный демон этого мира. Через пару дней мне стоит вновь заглянуть к Креолу, чтобы получить последние инструкции...");
	DemonCrownRitualDay = Wld_GetDay();
	HasSleeperDefence = 1;
	AI_StopProcessInfos(self);
};

func void DIA_Kreol_Sleeper_Again_Adanos()
{
	AI_Output(other,self,"DIA_Kreol_Sleeper_Adanos_01_01");	//У меня есть Корона Льда!
	AI_Output(self,other,"DIA_Kreol_Sleeper_Adanos_01_02");	//Хммм...(задумчиво) Древнейший артефакт, созданный самим Аданосом?
	AI_Output(self,other,"DIA_Kreol_Sleeper_Adanos_01_03");	//Да, это вполне бы могло заинтересовать Элигора.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Adanos_01_04");	//Думаю, мы поступим так...(задумчиво) Ты сейчас отдашь ее мне.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Adanos_01_05");	//А я в свою очередь подготовлю все необходимое для ритуала вызова демона.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Adanos_01_06");	//Согласен?
	AI_Output(other,self,"DIA_Kreol_Sleeper_Adanos_01_07");	//Ладно, держи корону.
	B_GiveInvItems(other,self,G3_ARMOR_HELMET_CRONE,1);
	Npc_RemoveInvItems(self,G3_ARMOR_HELMET_CRONE,1);
	AI_Output(self,other,"DIA_Kreol_Sleeper_Adanos_01_08");	//Отлично! Тогда, попробуй заглянуть ко мне через пару дней.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Adanos_01_09");	//Этого времени мне хватит, чтобы уладить вопрос с самим Элигором.
	AI_Output(other,self,"DIA_Kreol_Sleeper_Adanos_01_10");	//Хорошо! Но только не вздумай меня обмануть.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Adanos_01_11");	//(надменно) Не беспокойся. Сделка есть сделка!
	B_LogEntry(TOPIC_SLEEPERBACK,"Я отдал Креолу 'Корона Льда' в надежде заполучить могущественный артефакт, называемый 'Венцом Демонов'! Только с его помощью я смогу противостоять магии Спящего. Его нынешний владелец - Элигор, самый могущественный демон этого мира. Через пару дней мне стоит вновь заглянуть к Креолу, чтобы получить последние инструкции...");
	DemonCrownRitualDay = Wld_GetDay();
	HasSleeperDefence = 2;
	AI_StopProcessInfos(self);
};

func void DIA_Kreol_Sleeper_Again_Sword()
{
	AI_Output(other,self,"DIA_Kreol_Sleeper_Sword_01_01");	//У меня есть меч Повелитель драконов!
	AI_Output(self,other,"DIA_Kreol_Sleeper_Sword_01_02");	//Хммм...(задумчиво) Хорошее оружие! Но оно вряд ли заинтересует Элигора.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Sword_01_03");	//Попробуй предложить что-нибудь еще.
	EligorNoSword = TRUE;
};

func void DIA_Kreol_Sleeper_Again_Bow()
{
	AI_Output(other,self,"DIA_Kreol_Sleeper_Bow_01_01");	//У меня есть лук Цвет Смерти!
	AI_Output(self,other,"DIA_Kreol_Sleeper_Bow_01_02");	//Нет, это все не то.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Bow_01_03");	//Нужно что-то действительно ценное, чтобы произвести впечатление на Элигора!
	EligorNoBow = TRUE;
};

func void DIA_Kreol_Sleeper_Again_Staff()
{
	AI_Output(other,self,"DIA_Kreol_Sleeper_Staff_01_01");	//У меня есть посох Гаситель Душ!
	AI_Output(self,other,"DIA_Kreol_Sleeper_Staff_01_02");	//(презрительно) И к чему он владыке демонов, а?
	AI_Output(self,other,"DIA_Kreol_Sleeper_Staff_01_03");	//Лучше хорошенько подумай, прежде чем предлагать ему всякий мусор.
	EligorNoStaff = TRUE;
};

func void DIA_Kreol_Sleeper_Again_Innos()
{
	AI_Output(other,self,"DIA_Kreol_Sleeper_Innos_01_01");	//У меня есть Глаз Инноса!
	AI_Output(self,other,"DIA_Kreol_Sleeper_Innos_01_02");	//Хммм...(задумчиво) Древнейший артефакт паладинов?
	AI_Output(self,other,"DIA_Kreol_Sleeper_Innos_01_03");	//Да, это вполне бы могло заинтересовать Элигора.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Innos_01_04");	//Думаю, мы поступим так...(задумчиво) Ты сейчас отдашь его мне.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Innos_01_05");	//А я в свою очередь подготовлю все необходимое для ритуала вызова демона.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Innos_01_06");	//Согласен?
	AI_Output(other,self,"DIA_Kreol_Sleeper_Innos_01_07");	//Ладно, держи амулет.

	if(Npc_HasItems(hero,ItMi_InnosEye_MIS) >= 1)
	{
		B_GiveInvItems(other,self,ItMi_InnosEye_MIS,1);
		Npc_RemoveInvItems(self,ItMi_InnosEye_MIS,1);
	}
	else
	{
		B_GiveInvItems(other,self,ItMi_InnosEye_Discharged_Mis,1);
		Npc_RemoveInvItems(self,ItMi_InnosEye_Discharged_Mis,1);
	};

	AI_Output(self,other,"DIA_Kreol_Sleeper_Innos_01_08");	//Отлично! Тогда, попробуй заглянуть ко мне через пару дней.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Innos_01_09");	//Этого времени мне хватит, чтобы уладить вопрос с самим Элигором.
	AI_Output(other,self,"DIA_Kreol_Sleeper_Innos_01_10");	//Хорошо! Но только не вздумай меня обмануть.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Innos_01_11");	//(надменно) Не беспокойся. Сделка есть сделка!
	B_LogEntry(TOPIC_SLEEPERBACK,"Я отдал Креолу Глаз Инноса в надежде заполучить могущественный артефакт, называемый 'Венцом Демонов'! Только с его помощью я смогу противостоять магии Спящего. Его нынешний владелец - Элигор, самый могущественный демон этого мира. Через пару дней мне стоит вновь заглянуть к Креолу, чтобы получить последние инструкции...");
	DemonCrownRitualDay = Wld_GetDay();
	HasSleeperDefence = 3;
	AI_StopProcessInfos(self);
};

instance DIA_Kreol_Sleeper_MaskTrade(C_Info)
{
	npc = none_102_kreol;
	nr = 1;
	condition = DIA_Kreol_Sleeper_MaskTrade_condition;
	information = DIA_Kreol_Sleeper_MaskTrade_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Kreol_Sleeper_MaskTrade_condition()
{
	var int daynow;

	daynow = Wld_GetDay();

	if((SleeperOldIsDead == FALSE) && (Npc_IsInState(self,ZS_Talk) == TRUE) && (DemonCrownRitualDay != FALSE) && (DemonCrownRitualDay < (daynow - 1)))
	{
		return TRUE;
	};
};

func void DIA_Kreol_Sleeper_MaskTrade_info()
{
	B_GivePlayerXP(500);
	AI_Output(self,other,"DIA_Kreol_Sleeper_MaskTrade_01_01");	//Ты уже здесь? Хммм...(небрежно) Хорошо! У меня уже практически все готово.
	AI_Output(other,self,"DIA_Kreol_Sleeper_MaskTrade_01_02");	//Это насчет нашей договоренности?
	AI_Output(self,other,"DIA_Kreol_Sleeper_MaskTrade_01_03");	//Само собой...(властно) Вот, возьми эту руну! С ее помощью ты сможешь призвать в этот мир самого Элигора.
	B_GiveInvItems(self,other,ItRu_EligorSummon,1);
	AI_Output(self,other,"DIA_Kreol_Sleeper_MaskTrade_01_04");	//Но не думай, что это можно сделать там, где тебе вздумается.
	AI_Output(self,other,"DIA_Kreol_Sleeper_MaskTrade_01_05");	//Отправляйся в старую башню Ксардаса, что в Долине Рудников.
	AI_Output(self,other,"DIA_Kreol_Sleeper_MaskTrade_01_06");	//Используй там магическую пентаграмму для ритуала вызова.
	AI_Output(self,other,"DIA_Kreol_Sleeper_MaskTrade_01_07");	//Об остальном ты узнаешь уже у самого Элигора!
	AI_Output(other,self,"DIA_Kreol_Sleeper_MaskTrade_01_08");	//Но ты же говорил, что...
	AI_Output(self,other,"DIA_Kreol_Sleeper_MaskTrade_01_09");	//Хватит уже глупых вопросов! Ступай, и не забудь принести мне сердце Спящего, когда убьешь его.
	ReadyToSumEligor = TRUE;
	B_LogEntry(TOPIC_SLEEPERBACK,"Креол дал мне руну, чтобы я смог вызвать Элигора в этот мир. Место ритуала - магическая пентаграмма в старой башне Ксардаса.");
	AI_StopProcessInfos(self);
};

instance DIA_Kreol_Sleeper_Dead(C_Info)
{
	npc = none_102_kreol;
	nr = 1;
	condition = DIA_Kreol_Sleeper_Dead_condition;
	information = DIA_Kreol_Sleeper_Dead_info;
	permanent = FALSE;
	description = "Я убил Спящего!";
};

func int DIA_Kreol_Sleeper_Dead_condition()
{
	if(SleeperOldIsDead == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Kreol_Sleeper_Dead_info()
{
	B_GivePlayerXP(1500);
	AI_Output(other,self,"DIA_Kreol_Sleeper_Dead_01_01");	//Я убил Спящего!
	AI_Output(self,other,"DIA_Kreol_Sleeper_Dead_01_02");	//Хорошо. Надеюсь, его темный кристалл души при тебе?
	AI_Output(other,self,"DIA_Kreol_Sleeper_Dead_01_03");	//Это не имеет значения! Я тебе все равно его не отдал бы.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Dead_01_04");	//Глупец! Ну что же, тогда ты сам выбрал свою судьбу.
	AI_Output(self,other,"DIA_Kreol_Sleeper_Dead_01_05");	//Вместо его сердца я заберу твое!
	Info_ClearChoices(DIA_Kreol_Sleeper_Dead);
	Info_AddChoice(DIA_Kreol_Sleeper_Dead,"Можешь так не стараться!",DIA_Kreol_Sleeper_Dead_Ext);
};

func void DIA_Kreol_Sleeper_Dead_Ext()
{
	Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	Snd_Play("MFX_FEAR_CAST");
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(other,self,"DIA_Kreol_Sleeper_Dead_Ext_01_01");	//Можешь так не стараться! Никто тебе не поможет.
	AI_Output(other,self,"DIA_Kreol_Sleeper_Dead_Ext_01_02");	//Сегодня ты умрешь, ибо такова воля самого Инноса!
	AI_Output(self,other,"DIA_Kreol_Sleeper_Dead_Ext_01_03");	//(усмехаясь) Так значит, это он прислал тебя. Да, теперь я чувствую в тебе его силу!
	AI_Output(self,other,"DIA_Kreol_Sleeper_Dead_Ext_01_04");	//Но тебе это не поможет! Я и один способен с легкостью сокрушить тебя, жалкий червь.
	CanKillKreol = TRUE;
	KREOL_KILL = TRUE;
	KREOL_WARN = TRUE;
	self.guild = GIL_DMT;
	Npc_SetTrueGuild(self,GIL_DMT);
	Info_ClearChoices(DIA_Kreol_Sleeper_Dead);
	Info_AddChoice(DIA_Kreol_Sleeper_Dead,"(закончить разговор)",DIA_Kreol_Sleeper_Dead_End);
};

func void DIA_Kreol_Sleeper_Dead_End()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_EnemyOverride] = FALSE;
	B_Attack(self,other,AR_KILL,1);
};

instance DIA_Kreol_Hromanin(C_Info)
{
	npc = none_102_kreol;
	nr = 1;
	condition = DIA_Kreol_Hromanin_condition;
	information = DIA_Kreol_Hromanin_info;
	permanent = FALSE;
	description = "Что тебе известно о Хроманине?";
};

func int DIA_Kreol_Hromanin_condition()
{
	if((MIS_DarkOrden == LOG_Running) && (DO_SendToKriol == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Kreol_Hromanin_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Kreol_Hromanin_01_01");	//Что тебе известно о Хроманине?
	AI_Output(self,other,"DIA_Kreol_Hromanin_01_02");	//Твои вопросы не перестают меня удивлять. Однако я все же отвечу тебе на этот вопрос.
	AI_Output(self,other,"DIA_Kreol_Hromanin_01_03");	//Слово 'хроманин' на языке древних означает сущность любого живого существа. Если точнее – его душу.
	AI_Output(other,self,"DIA_Kreol_Hromanin_01_04");	//А если им называют, скажем, какой-то определенный предмет?
	AI_Output(self,other,"DIA_Kreol_Hromanin_01_05");	//Совершенно неважно, как выглядит сам Хроманин! Им может быть любой предмет.
	AI_Output(self,other,"DIA_Kreol_Hromanin_01_06");	//Главное, что этот артефакт имеет одно очень ценное свойство.
	AI_Output(other,self,"DIA_Kreol_Hromanin_01_07");	//Какое?
	AI_Output(self,other,"DIA_Kreol_Hromanin_01_08");	//Хроманин порабощает души всех тех, кто осмелился завладеть им.
	AI_Output(self,other,"DIA_Kreol_Hromanin_01_09");	//Не сразу, конечно, постепенно...(зловеще) Изо дня в день он сводит своего обладателя с ума!
	AI_Output(self,other,"DIA_Kreol_Hromanin_01_10");	//И приходит время, когда тот готов отдать все, лишь бы избавиться от этого проклятия.
	AI_Output(self,other,"DIA_Kreol_Hromanin_01_11");	//Тогда появляется истинный хозяин артефакта и забирает душу безумца!
	AI_Output(other,self,"DIA_Kreol_Hromanin_01_12");	//А кто его хозяин?
	AI_Output(self,other,"DIA_Kreol_Hromanin_01_13");	//У каждого Хроманина он свой! Я не могу тебе точно сказать, как он выглядит.
	AI_Output(self,other,"DIA_Kreol_Hromanin_01_14");	//Мне все еще дорога своя собственная душа.
	AI_Output(self,other,"DIA_Kreol_Hromanin_01_15");	//Кстати, а почему ты интересуешься этим?
	AI_Output(other,self,"DIA_Kreol_Hromanin_01_16");	//Хоринис наводнила нежить! Маги Огня полагают, что всему виной именно Хроманин.
	AI_Output(self,other,"DIA_Kreol_Hromanin_01_17");	//Глупцы! Какие же они глупцы! Не видят дальше своего носа.
	AI_Output(other,self,"DIA_Kreol_Hromanin_01_18");	//А ты, видимо, знаешь, что явилось тому причиной?
	AI_Output(self,other,"DIA_Kreol_Hromanin_01_19");	//Естественно! Еще бы я этого не знал. Вот только не думай, что я открою тебе эту тайну.
	AI_Output(other,self,"DIA_Kreol_Hromanin_01_20");	//Но у каждой тайны есть и своя цена. Какова твоя?
	AI_Output(self,other,"DIA_Kreol_Hromanin_01_21");	//А торговаться ты умеешь, как я погляжу. Но в данном случае она будет тебе не по карману!
	AI_Output(other,self,"DIA_Kreol_Hromanin_01_22");	//Сначала назови ее, а потом уже делай выводы.
	AI_Output(self,other,"DIA_Kreol_Hromanin_01_23");	//Ну что же...(зловеще) Если ты так настаиваешь.
	AI_Output(self,other,"DIA_Kreol_Hromanin_01_24");	//Мы с тобой начали этот разговор с вопроса о Хроманине. Вот это, пожалуй, и будет моей ценой!
	AI_Output(other,self,"DIA_Kreol_Hromanin_01_25");	//Ты хочешь, чтобы я достал его для тебя?
	AI_Output(self,other,"DIA_Kreol_Hromanin_01_26");	//(властно) Да, именно этого я и хочу.
	AI_Output(self,other,"DIA_Kreol_Hromanin_01_27");	//Мне стало известно, что на этом острове существует один из подобных артефактов.
	AI_Output(self,other,"DIA_Kreol_Hromanin_01_28");	//Принеси мне его! Только не вздумай отдать его мне, не избавившись от его хранителя!
	AI_Output(self,other,"DIA_Kreol_Hromanin_01_29");	//Я еще окончательно не выжил из ума, чтобы проститься со своей душой.
	AI_Output(other,self,"DIA_Kreol_Hromanin_01_30");	//А мою тебе, значит, не жалко.
	AI_Output(self,other,"DIA_Kreol_Hromanin_01_31");	//Ну, ты ведь сам просил назвать тебе цену. Или она тебя не устраивает?
	Info_ClearChoices(DIA_Kreol_Hromanin);
	Info_AddChoice(DIA_Kreol_Hromanin,"Нет, это для меня слишком.",DIA_Kreol_Hromanin_No);
	Info_AddChoice(DIA_Kreol_Hromanin,"Хорошо! Считай, что мы договорились.",DIA_Kreol_Hromanin_Yes);
};

func void DIA_Kreol_Hromanin_No()
{
	AI_Output(other,self,"DIA_Kreol_Hromanin_No_01_01");	//Нет, это для меня слишком.
	AI_Output(self,other,"DIA_Kreol_Hromanin_No_01_02");	//Так я и думал. Тогда нам с тобой больше не о чем разговаривать.
	MIS_DarkOrden = LOG_Failed;
	B_LogEntry_Failed(TOPIC_DarkOrden);
	AI_StopProcessInfos(self);
};

func void DIA_Kreol_Hromanin_Yes()
{
	AI_Output(other,self,"DIA_Kreol_Hromanin_Yes_01_01");	//Хорошо! Считай, что мы договорились.
	AI_Output(self,other,"DIA_Kreol_Hromanin_Yes_01_02");	//Отлично! Тогда не теряй времени! Ступай и принеси мне этот артефакт.
	AI_Output(self,other,"DIA_Kreol_Hromanin_Yes_01_03");	//Да, и вот еще что...
	AI_Output(self,other,"DIA_Kreol_Hromanin_Yes_01_04");	//Перед тем как умереть, оставь мне какую-нибудь весточку о том, где потом искать твое бездыханное тело.
	AI_Output(self,other,"DIA_Kreol_Hromanin_Yes_01_05");	//Думаю, из тебя получится отличный скелет-слуга! В меру исполнительный и в меру глупый.
	AI_Output(other,self,"DIA_Kreol_Hromanin_Yes_01_06");	//Даже не думай об этом!
	AI_Output(self,other,"DIA_Kreol_Hromanin_Yes_01_07");	//(посмеивается)
	KreolOpenHromaninSaga = TRUE;
	B_LogEntry(TOPIC_DarkOrden,"Я согласился на сделку с Креолом, и теперь мне надо будет отыскать для него этот Хроманин. Тогда он расскажет, почему Хоринис наводнила нежить.");
	AI_StopProcessInfos(self);
};

instance DIA_Kreol_HromaninDone(C_Info)
{
	npc = none_102_kreol;
	nr = 1;
	condition = DIA_Kreol_HromaninDone_condition;
	information = DIA_Kreol_HromaninDone_info;
	permanent = FALSE;
	description = "Я принес тебе Хроманин.";
};

func int DIA_Kreol_HromaninDone_condition()
{
	if((MIS_DarkOrden == LOG_Running) && (Npc_HasItems(hero,ITWR_HROMANIN) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Kreol_HromaninDone_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Kreol_HromaninDone_01_01");	//Я принес тебе Хроманин.
	AI_Output(self,other,"DIA_Kreol_HromaninDone_01_02");	//Дай мне взглянуть на него!
	AI_Output(other,self,"DIA_Kreol_HromaninDone_01_03");	//Вот, держи.
	B_GiveInvItems(other,self,ITWR_HROMANIN,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Kreol_HromaninDone_01_04");	//Хммм...(оценивающе) Так значит, это всего лишь обычная книга!
	AI_Output(self,other,"DIA_Kreol_HromaninDone_01_05");	//И судя по тому, что я чувствую, глядя в нее - ее хранитель уже мертв.
	AI_Output(other,self,"DIA_Kreol_HromaninDone_01_06");	//Да, я убил его.
	AI_Output(self,other,"DIA_Kreol_HromaninDone_01_07");	//Признаться, я немного удивлен, что тебе удалось остаться в живых.
	AI_Output(self,other,"DIA_Kreol_HromaninDone_01_08");	//Хотя это могло оказаться всего лишь случайным стечением обстоятельств.
	AI_Output(self,other,"DIA_Kreol_HromaninDone_01_09");	//В любом случае ты заслужил свою награду.
	DO_KreolTell = TRUE;
	B_LogEntry(TOPIC_DarkOrden,"Я принес Хроманин Креолу.");
};

instance DIA_Kreol_TellDarkOrden(C_Info)
{
	npc = none_102_kreol;
	nr = 1;
	condition = DIA_Kreol_TellDarkOrden_condition;
	information = DIA_Kreol_TellDarkOrden_info;
	permanent = FALSE;
	description = "Пришла пора ответить на мой вопрос.";
};

func int DIA_Kreol_TellDarkOrden_condition()
{
	if((MIS_DarkOrden == LOG_Running) && (DO_KreolTell == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Kreol_TellDarkOrden_info()
{
	AI_Output(other,self,"DIA_Kreol_TellDarkOrden_01_01");	//Пришла пора ответить на мой вопрос.
	AI_Output(self,other,"DIA_Kreol_TellDarkOrden_01_02");	//(небрежно) Как скажешь. Во всем виноваты паладины! Такой ответ тебя устроит?
	AI_Output(other,self,"DIA_Kreol_TellDarkOrden_01_03");	//Паладины?!
	AI_Output(self,other,"DIA_Kreol_TellDarkOrden_01_04");	//Да, именно они. Тебя это очень сильно удивляет?
	AI_Output(other,self,"DIA_Kreol_TellDarkOrden_01_05");	//Еще как. Может объяснишь, что ты имел в виду?
	AI_Output(self,other,"DIA_Kreol_TellDarkOrden_01_06");	//(смеется) Без меня тебе никогда не понять суть происходящего. Не так ли?
	AI_Output(self,other,"DIA_Kreol_TellDarkOrden_01_07");	//Но так уж и быть, сжалюсь над тобой и немного приоткрою завесу этой тайны.
	AI_Output(self,other,"DIA_Kreol_TellDarkOrden_01_08");	//Слушай внимательно! Повторять дважды я не стану.
	AI_Output(self,other,"DIA_Kreol_TellDarkOrden_01_09");	//Как ты, наверное, знаешь, орден паладинов Инноса насчитывает уже не одну тысячу лет.
	AI_Output(self,other,"DIA_Kreol_TellDarkOrden_01_10");	//И на протяжении всего этого времени они только и делают, что выполняют любой каприз их божка!
	AI_Output(self,other,"DIA_Kreol_TellDarkOrden_01_11");	//Однако некоторые из них были настолько фанатичны и преданны своему богу, что порой даже не отличали добра от зла.
	AI_Output(self,other,"DIA_Kreol_TellDarkOrden_01_12");	//Они творили ужасные вещи от имени Инноса! И не было этому конца...
	AI_Output(self,other,"DIA_Kreol_TellDarkOrden_01_13");	//Глядя на них и на все происходящее вокруг, Иннос не мог больше терпеть этих бесчинств.
	AI_Output(self,other,"DIA_Kreol_TellDarkOrden_01_14");	//Поэтому он лишил этих паладинов своей божественной силы и оставил их наедине только лишь с одной их верой.
	AI_Output(self,other,"DIA_Kreol_TellDarkOrden_01_15");	//Многие из тех паладинов были похоронены на этом острове. Со славой и почестями, как и полагается воинам ордена.
	AI_Output(self,other,"DIA_Kreol_TellDarkOrden_01_16");	//Однако после смерти они восстали в виде могущественной нежити.
	AI_Output(self,other,"DIA_Kreol_TellDarkOrden_01_17");	//И теперь они полководцы бесчисленной армии мертвых, которые ведут свои легионы во славу Белиара!
	AI_Output(self,other,"DIA_Kreol_TellDarkOrden_01_18");	//Теперь тебе понятно?
	AI_Output(other,self,"DIA_Kreol_TellDarkOrden_01_19");	//Значит, эти мертвые паладины и есть причина, по которой нежить атаковала Хоринис?
	AI_Output(self,other,"DIA_Kreol_TellDarkOrden_01_20");	//Именно так! И эти нападения не прекратятся до тех пор, пока кто-нибудь не упокоит души этих проклятых воинов.
	DO_KnowAboutDO = TRUE;
	B_LogEntry(TOPIC_DarkOrden,"Креол рассказал мне историю про паладинов, которые при жизни были настолько фанатично преданы Инносу, что порой творили просто ужасающие вещи от его имени. Иннос не мог этого позволить и лишил их своей силы и покровительства. Многие из этих паладинов были похоронены именно на этом острове. Но после своей смерти они восстали в виде могущественной нежити и теперь ведут легионы мертвых в бой во славу Белиара! Пока их души не будут упокоены, нападения нежити на Хоринис не прекратятся.");
};

instance DIA_Kreol_MAXROBE(C_Info)
{
	npc = none_102_kreol;
	nr = 2;
	condition = DIA_Kreol_MAXROBE_condition;
	information = DIA_Kreol_MAXROBE_info;
	permanent = FALSE;
	description = "Как насчет робы получше?";
};

func int DIA_Kreol_MAXROBE_condition()
{
	if((hero.guild == GIL_KDM) && (Kapitel >= 5) && (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 6) && (LastRobeKDM == FALSE) && (MAXROBE_Permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Kreol_MAXROBE_info()
{
	AI_Output(other,self,"DIA_Kreol_MAXROBE_01_00");	//Как насчет робы получше?
	AI_Output(self,other,"DIA_Kreol_MAXROBE_01_01");	//Поскольку ты владеешь всеми шестью кругами магии, ты достоин носить робу архимага Тьмы!
	AI_Output(self,other,"DIA_Kreol_MAXROBE_01_02");	//Однако тебе придется за нее заплатить!
	AI_Output(other,self,"DIA_Kreol_MAXROBE_01_03");	//Понимаю.
	LastRobeKDM = TRUE;
};

instance DIA_Kreol_MAXROBE_Buy(C_Info)
{
	npc = none_102_kreol;
	nr = 2;
	condition = DIA_Kreol_MAXROBE_Buy_condition;
	information = DIA_Kreol_MAXROBE_Buy_info;
	permanent = TRUE;
	description = "Продай мне робу архимага Тьмы. (Цена: 30000 монет)";
};

func int DIA_Kreol_MAXROBE_Buy_condition()
{
	if((hero.guild == GIL_KDM) && (LastRobeKDM == TRUE) && (MAXROBE_Permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Kreol_MAXROBE_Buy_info()
{
	AI_Output(other,self,"DIA_Kreol_MAXROBE_Buy_01_00");	//Продай мне робу архимага Тьмы!

	if(Npc_HasItems(hero,ItMi_Gold) >= 30000)
	{
		B_GiveInvItems(other,self,ItMi_Gold,30000);
		Npc_RemoveInvItems(self,ItMi_Gold,30000);
		AI_Output(self,other,"DIA_Kreol_MAXROBE_Buy_01");	//Хорошо! Держи ее.
		AI_Output(self,other,"DIA_Kreol_MAXROBE_Buy_02");	//Это огромная честь носить подобное одеяние. Помни об этом!
		CreateInvItems(self,itar_kdm_sh,1);
		B_GiveInvItems(self,other,itar_kdm_sh,1);
		MAXROBE_Permanent = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Kreol_MAXROBE_Buy_01_03");	//У тебя недостаточно золота!
	};
};

instance DIA_Kreol_Nergal(C_Info)
{
	npc = none_102_kreol;
	nr = 2;
	condition = DIA_Kreol_Nergal_condition;
	information = DIA_Kreol_Nergal_info;
	permanent = FALSE;
	description = "Ты случайно не знаешь, как можно попасть в башню Нергала?";
};

func int DIA_Kreol_Nergal_condition()
{
	if((MIS_XARDASTASKSFOUR == LOG_Running) && (RITUALNERGALTIMER == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Kreol_Nergal_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Kreol_Nergal_01_00");	//Ты случайно не знаешь, как попасть в башню Нергала?
	AI_Output(self,other,"DIA_Kreol_Nergal_01_01");	//(надменно) Конечно, знаю. Через дверь! Вот только она заперта.
	AI_Output(other,self,"DIA_Kreol_Nergal_01_02");	//А где мне взять ключ?
	AI_Output(self,other,"DIA_Kreol_Nergal_01_03");	//Ключ от той двери находится у меня.
	AI_Output(self,other,"DIA_Kreol_Nergal_01_04");	//Если хочешь, я могу отдать его тебе. Только там тебя ничего не ждет, кроме смерти.
	AI_Output(other,self,"DIA_Kreol_Nergal_01_05");	//Просто дай его мне. Хорошо?
	AI_Output(self,other,"DIA_Kreol_Nergal_01_06");	//(презрительно) Ладно, если тебе не терпится умереть - возьми его!
	B_GiveInvItems(self,other,itke_darktower_01,1);
	KreolGiveKey = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_Kreol_DarkMageBuySwords(C_Info)
{
	npc = none_102_kreol;
	nr = 3;
	condition = DIA_Kreol_DarkMageBuySwords_condition;
	information = DIA_Kreol_DarkMageBuySwords_info;
	permanent = FALSE;
	description = "Тебя могло бы заинтересовать это оружие?";
};

func int DIA_Kreol_DarkMageBuySwords_condition()
{
	if((Npc_HasItems(hero,ITMW_FAKESWORD_01) >= 1) && (DarkMageBuySwords == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Kreol_DarkMageBuySwords_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Kreol_DarkMageBuySwords_01_00");	//Тебя могло бы заинтересовать это оружие?
	AI_Output(self,other,"DIA_Kreol_DarkMageBuySwords_01_01");	//(с интересом) Дай мне взглянуть на него.
	AI_Output(other,self,"DIA_Kreol_DarkMageBuySwords_01_02");	//Вот, держи.
	B_GiveInvItems(other,self,ITMW_FAKESWORD_01,1);
	Npc_RemoveInvItems(self,ITMW_FAKESWORD_01,1);
	AI_Output(self,other,"DIA_Kreol_DarkMageBuySwords_01_03");	//Так-так...(разглядывая) Да, это интересная вещица!
	AI_Output(self,other,"DIA_Kreol_DarkMageBuySwords_01_04");	//Я ощущаю в ней легкое присутствие темной магии Белиара.
	AI_Output(self,other,"DIA_Kreol_DarkMageBuySwords_01_05");	//Ты правильно поступил, что принес его именно мне! В неумелых руках подобные вещи могут быть смертельно опасными.
	AI_Output(other,self,"DIA_Kreol_DarkMageBuySwords_01_06");	//Ну хорошо. И что дальше?
	AI_Output(self,other,"DIA_Kreol_DarkMageBuySwords_01_07");	//Все очень просто! Этот клинок я оставлю у себя для дальнейшего изучения его свойств.
	AI_Output(self,other,"DIA_Kreol_DarkMageBuySwords_01_08");	//А если вдруг ты найдешь еще что-нибудь подобное, приноси мне!
	AI_Output(self,other,"DIA_Kreol_DarkMageBuySwords_01_09");	//И можешь не переживать насчет своей награды! Я щедро отблагодарю тебя за это.
	B_LogEntry(Topic_OutTrader,"Креол купит у меня все ритуальное оружие Масиаф, что я принесу ему.");
	KreolBuyMasiafSwrods = TRUE;
};

instance DIA_Kreol_DarkMageBuySwordsDone(C_Info)
{
	npc = none_102_kreol;
	nr = 3;
	condition = DIA_Kreol_DarkMageBuySwordsDone_condition;
	information = DIA_Kreol_DarkMageBuySwordsDone_info;
	permanent = TRUE;
	description = "Я принес тебе еще ритуального оружия.";
};

func int DIA_Kreol_DarkMageBuySwordsDone_condition()
{
	if((Npc_HasItems(hero,ITMW_FAKESWORD_01) >= 1) && (KreolBuyMasiafSwrods == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Kreol_DarkMageBuySwordsDone_info()
{
	var int SummSword;

	SummSword = FALSE;
	SummSword = Npc_HasItems(hero,ITMW_FAKESWORD_01);

	AI_Output(other,self,"DIA_Kreol_DarkMageBuySwordsDone_01_00");	//Я принес тебе еще ритуального оружия.
	AI_Output(self,other,"DIA_Kreol_DarkMageBuySwordsDone_01_01");	//Отлично! Давай его сюда.
	B_GiveInvItems(other,self,ITMW_FAKESWORD_01,Npc_HasItems(other,ITMW_FAKESWORD_01));
	Npc_RemoveInvItems(self,ITMW_FAKESWORD_01,Npc_HasItems(self,ITMW_FAKESWORD_01));
	AI_Output(other,self,"DIA_Kreol_DarkMageBuySwordsDone_01_03");	//А как насчет обещанной награды?
	AI_Output(self,other,"DIA_Kreol_DarkMageBuySwordsDone_01_04");	//Не волнуйся... Вот, возьми это золото!
	B_GiveInvItems(self,other,ItMi_Gold,SummSword * 500);
	AI_Output(self,other,"DIA_Kreol_DarkMageBuySwordsDone_01_05");	//Оно будет для тебя самой подходящей наградой.
	AI_Output(self,other,"DIA_Kreol_DarkMageBuySwordsDone_01_06");	//А теперь можешь идти. У меня нет времени на болтовню.
	AI_StopProcessInfos(self);
};

instance DIA_Kreol_BuyWeapons(C_Info)
{
	npc = none_102_kreol;
	nr = 600;
	condition = DIA_Kreol_BuyWeapons_condition;
	information = DIA_Kreol_BuyWeapons_info;
	permanent = TRUE;
	description = "У меня есть для тебя проклятое оружие.";
};

func int DIA_Kreol_BuyWeapons_condition()
{
	if((Npc_KnowsInfo(hero,DIA_Xardas_Mechi) == TRUE) && (KreolBuyWeap == TRUE))
	{
		if((Npc_HasItems(hero,ItMw_1H_ChelDrak_Left) > 0) || (Npc_HasItems(hero,ItMw_1H_ChelDrak_Right) > 0) || (Npc_HasItems(hero,ItMw_2H_ShadowBlade_Xert) > 0) || (Npc_HasItems(hero,ITMW_SHADOWPRIEST_Elair) > 0) || (Npc_HasItems(hero,ITMW_SHADOWPRIEST_Ober) > 0) || (Npc_HasItems(hero,ItMw_PlagueStaff) > 0) || (Npc_HasItems(hero,ItMw_SoulKeeperStaff) > 0) || (Npc_HasItems(hero,ITMW_1H_DoomSpeer_Elite) > 0) || (Npc_HasItems(hero,ITMW_2H_DOOMAXE) > 0) || (Npc_HasItems(hero,ITMW_2H_HAOSHAND) > 0) || (Npc_HasItems(hero,ITMW_2H_RAVENELITE) > 0) || (Npc_HasItems(hero,ITMW_1H_GHOSTSWORD) > 0) || (Npc_HasItems(hero,ItMw_Doom_OldPiratensaebel) > 0) || (Npc_HasItems(hero,ItAr_Shield_01_Damn) > 0) || (Npc_HasItems(hero,ItAr_Shield_02_Damn) > 0) || (Npc_HasItems(hero,ItAr_Shield_03_Damn) > 0) || (Npc_HasItems(hero,ITMW_1H_DOOMSPEER) > 0) || (Npc_HasItems(hero,ITMW_1H_DOOMSWORD) > 0) || (Npc_HasItems(hero,ITMW_2H_DRACONSWORD_DEAD) > 0) || (Npc_HasItems(hero,ITMW_1H_DOOMSWORD_Elite) > 0) || (Npc_HasItems(hero,ITMW_2H_DOOMSWORD) > 0) || (Npc_HasItems(hero,ITMW_2H_DOOMSWORD_PreElite) > 0) || (Npc_HasItems(hero,ITMW_SHADOWPRIEST_Elite) > 0) || (Npc_HasItems(hero,ITMW_SHADOWPRIEST) > 0) || (Npc_HasItems(hero,ItRw_Crossbow_Undead) > 0) || (Npc_HasItems(hero,ItRw_Undead) > 0) || (Npc_HasItems(hero,ITMW_2H_DOOMSWORD_Elite) > 0))
		{
			return TRUE;
		};
	};
};

func void DIA_Kreol_BuyWeapons_info()
{
	var int countexp;
	var int goldplus;
	var int goldplus_all;

	goldplus = FALSE;
	goldplus_all = FALSE;

	AI_Output(other,self,"DIA_Xardas_BuyWeapons_01_00");	//У меня есть для тебя проклятое оружие.

	if(Npc_HasItems(hero,ItMw_1H_ChelDrak_Left) > 0)
	{
		goldplus = Npc_HasItems(other,ItMw_1H_ChelDrak_Left);
		Npc_RemoveInvItems(hero,ItMw_1H_ChelDrak_Left,Npc_HasItems(hero,ItMw_1H_ChelDrak_Left));
		goldplus_all = goldplus_all + (goldplus * 100);
	};
	if(Npc_HasItems(hero,ItMw_1H_ChelDrak_Right) > 0)
	{
		goldplus = Npc_HasItems(other,ItMw_1H_ChelDrak_Right);
		Npc_RemoveInvItems(hero,ItMw_1H_ChelDrak_Right,Npc_HasItems(hero,ItMw_1H_ChelDrak_Right));
		goldplus_all = goldplus_all + (goldplus * 100);
	};
	if(Npc_HasItems(hero,ItMw_2H_ShadowBlade_Xert) > 0)
	{
		goldplus = Npc_HasItems(other,ItMw_2H_ShadowBlade_Xert);
		Npc_RemoveInvItems(hero,ItMw_2H_ShadowBlade_Xert,Npc_HasItems(hero,ItMw_2H_ShadowBlade_Xert));
		goldplus_all = goldplus_all + (goldplus * 100);
	};
	if(Npc_HasItems(hero,ITMW_SHADOWPRIEST_Elair) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_SHADOWPRIEST_Elair);
		Npc_RemoveInvItems(hero,ITMW_SHADOWPRIEST_Elair,Npc_HasItems(hero,ITMW_SHADOWPRIEST_Elair));
		goldplus_all = goldplus_all + (goldplus * 100);
	};
	if(Npc_HasItems(hero,ITMW_SHADOWPRIEST_Ober) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_SHADOWPRIEST_Ober);
		Npc_RemoveInvItems(hero,ITMW_SHADOWPRIEST_Ober,Npc_HasItems(hero,ITMW_SHADOWPRIEST_Ober));
		goldplus_all = goldplus_all + (goldplus * 100);
	};
	if(Npc_HasItems(hero,ItMw_PlagueStaff) > 0)
	{
		goldplus = Npc_HasItems(other,ItMw_PlagueStaff);
		Npc_RemoveInvItems(hero,ItMw_PlagueStaff,Npc_HasItems(hero,ItMw_PlagueStaff));
		goldplus_all = goldplus_all + (goldplus * 100);
	};
	if(Npc_HasItems(hero,ItMw_SoulKeeperStaff) > 0)
	{
		goldplus = Npc_HasItems(other,ItMw_SoulKeeperStaff);
		Npc_RemoveInvItems(hero,ItMw_SoulKeeperStaff,Npc_HasItems(hero,ItMw_SoulKeeperStaff));
		goldplus_all = goldplus_all + (goldplus * 100);
	};
	if(Npc_HasItems(hero,ITMW_1H_DoomSpeer_Elite) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_1H_DoomSpeer_Elite);
		Npc_RemoveInvItems(hero,ITMW_1H_DoomSpeer_Elite,Npc_HasItems(hero,ITMW_1H_DoomSpeer_Elite));
		goldplus_all = goldplus_all + (goldplus * 10);
	};
	if(Npc_HasItems(hero,ITMW_2H_DOOMAXE) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_2H_DOOMAXE);
		Npc_RemoveInvItems(hero,ITMW_2H_DOOMAXE,Npc_HasItems(hero,ITMW_2H_DOOMAXE));
		goldplus_all = goldplus_all + (goldplus * 10);
	};
	if(Npc_HasItems(hero,ITMW_2H_HAOSHAND) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_2H_HAOSHAND);
		Npc_RemoveInvItems(hero,ITMW_2H_HAOSHAND,Npc_HasItems(hero,ITMW_2H_HAOSHAND));
		goldplus_all = goldplus_all + (goldplus * 10);
	};
	if(Npc_HasItems(hero,ITMW_2H_RAVENELITE) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_2H_RAVENELITE);
		Npc_RemoveInvItems(hero,ITMW_2H_RAVENELITE,Npc_HasItems(hero,ITMW_2H_RAVENELITE));
		goldplus_all = goldplus_all + (goldplus * 10);
	};
	if(Npc_HasItems(hero,ITMW_2H_DRACONSWORD_DEAD) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_2H_DRACONSWORD_DEAD);
		Npc_RemoveInvItems(hero,ITMW_2H_DRACONSWORD_DEAD,Npc_HasItems(hero,ITMW_2H_DRACONSWORD_DEAD));
		goldplus_all = goldplus_all + (goldplus * 5);
	};
	if(Npc_HasItems(hero,ItMw_Doom_OldPiratensaebel) > 0)
	{
		goldplus = Npc_HasItems(other,ItMw_Doom_OldPiratensaebel);
		Npc_RemoveInvItems(hero,ItMw_Doom_OldPiratensaebel,Npc_HasItems(hero,ItMw_Doom_OldPiratensaebel));
		goldplus_all = goldplus_all + (goldplus * 5);
	};
	if(Npc_HasItems(hero,ITMW_SHADOWPRIEST) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_SHADOWPRIEST);
		Npc_RemoveInvItems(hero,ITMW_SHADOWPRIEST,Npc_HasItems(hero,ITMW_SHADOWPRIEST));
		goldplus_all = goldplus_all + (goldplus * 20);
	};
	if(Npc_HasItems(hero,ITMW_SHADOWPRIEST_Elite) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_SHADOWPRIEST_Elite);
		Npc_RemoveInvItems(hero,ITMW_SHADOWPRIEST_Elite,Npc_HasItems(hero,ITMW_SHADOWPRIEST_Elite));
		goldplus_all = goldplus_all + (goldplus * 20);
	};
	if(Npc_HasItems(hero,ITMW_2H_DOOMSWORD) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_2H_DOOMSWORD);
		Npc_RemoveInvItems(hero,ITMW_2H_DOOMSWORD,Npc_HasItems(hero,ITMW_2H_DOOMSWORD));
		goldplus_all = goldplus_all + (goldplus * 10);
	};
	if(Npc_HasItems(hero,ITMW_2H_DOOMSWORD_PREELITE) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_2H_DOOMSWORD_PREELITE);
		Npc_RemoveInvItems(hero,ITMW_2H_DOOMSWORD_PREELITE,Npc_HasItems(hero,ITMW_2H_DOOMSWORD_PREELITE));
		goldplus_all = goldplus_all + (goldplus * 10);
	};
	if(Npc_HasItems(hero,ITMW_2H_DOOMSWORD_ELITE) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_2H_DOOMSWORD_ELITE);
		Npc_RemoveInvItems(hero,ITMW_2H_DOOMSWORD_ELITE,Npc_HasItems(hero,ITMW_2H_DOOMSWORD_ELITE));
		goldplus_all = goldplus_all + (goldplus * 10);
	};
	if(Npc_HasItems(hero,ITMW_1H_DOOMSWORD) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_1H_DOOMSWORD);
		Npc_RemoveInvItems(hero,ITMW_1H_DOOMSWORD,Npc_HasItems(hero,ITMW_1H_DOOMSWORD));
		goldplus_all = goldplus_all + (goldplus * 5);
	};
	if(Npc_HasItems(hero,ITMW_1H_GHOSTSWORD) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_1H_GHOSTSWORD);
		Npc_RemoveInvItems(hero,ITMW_1H_GHOSTSWORD,Npc_HasItems(hero,ITMW_1H_GHOSTSWORD));
		goldplus_all = goldplus_all + (goldplus * 15);
	};
	if(Npc_HasItems(hero,ITMW_1H_DOOMSPEER) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_1H_DOOMSPEER);
		Npc_RemoveInvItems(hero,ITMW_1H_DOOMSPEER,Npc_HasItems(hero,ITMW_1H_DOOMSPEER));
		goldplus_all = goldplus_all + (goldplus * 5);
	};
	if(Npc_HasItems(hero,ITMW_1H_DOOMSWORD_Elite) > 0)
	{
		goldplus = Npc_HasItems(other,ITMW_1H_DOOMSWORD_Elite);
		Npc_RemoveInvItems(hero,ITMW_1H_DOOMSWORD_Elite,Npc_HasItems(hero,ITMW_1H_DOOMSWORD_Elite));
		goldplus_all = goldplus_all + (goldplus * 5);
	};
	if(Npc_HasItems(hero,ItRw_Undead) > 0)
	{
		goldplus = Npc_HasItems(other,ItRw_Undead);
		Npc_RemoveInvItems(hero,ItRw_Undead,Npc_HasItems(hero,ItRw_Undead));
		goldplus_all = goldplus_all + (goldplus * 5);
	};
	if(Npc_HasItems(hero,ItRw_Crossbow_Undead) > 0)
	{
		goldplus = Npc_HasItems(other,ItRw_Crossbow_Undead);
		Npc_RemoveInvItems(hero,ItRw_Crossbow_Undead,Npc_HasItems(hero,ItRw_Crossbow_Undead));
		goldplus_all = goldplus_all + (goldplus * 10);
	};
	if(Npc_HasItems(hero,ItAr_Shield_01_Damn) > 0)
	{
		goldplus = Npc_HasItems(other,ItAr_Shield_01_Damn);
		Npc_RemoveInvItems(hero,ItAr_Shield_01_Damn,Npc_HasItems(hero,ItAr_Shield_01_Damn));
		goldplus_all = goldplus_all + (goldplus * 10);
	};
	if(Npc_HasItems(hero,ItAr_Shield_02_Damn) > 0)
	{
		goldplus = Npc_HasItems(other,ItAr_Shield_02_Damn);
		Npc_RemoveInvItems(hero,ItAr_Shield_02_Damn,Npc_HasItems(hero,ItAr_Shield_02_Damn));
		goldplus_all = goldplus_all + (goldplus * 10);
	};
	if(Npc_HasItems(hero,ItAr_Shield_03_Damn) > 0)
	{
		goldplus = Npc_HasItems(other,ItAr_Shield_03_Damn);
		Npc_RemoveInvItems(hero,ItAr_Shield_03_Damn,Npc_HasItems(hero,ItAr_Shield_03_Damn));
		goldplus_all = goldplus_all + (goldplus * 10);
	};

	AI_Output(self,other,"DIA_KREOL_Kill_Done_Rings_01_13");	//Вот, забирай свою награду и проваливай отсюда!
	B_GiveInvItems(self,other,ItMi_Gold,goldplus_all);
};