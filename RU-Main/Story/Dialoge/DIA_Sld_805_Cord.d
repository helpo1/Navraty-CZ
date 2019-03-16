instance DIA_Cord_EXIT(C_Info)
{
	npc = Sld_805_Cord;
	nr = 999;
	condition = DIA_Cord_EXIT_Condition;
	information = DIA_Cord_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Cord_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Cord_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Cord_MeetingIsRunning(C_Info)
{
	npc = Sld_805_Cord;
	nr = 1;
	condition = DIA_Addon_Cord_MeetingIsRunning_Condition;
	information = DIA_Addon_Cord_MeetingIsRunning_Info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_Addon_Cord_MeetingIsRunning_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (RangerMeetingRunning == LOG_Running))
	{
		return TRUE;
	};
};

var int DIA_Addon_Cord_MeetingIsRunning_OneTime;

func void DIA_Addon_Cord_MeetingIsRunning_Info()
{
	if(DIA_Addon_Cord_MeetingIsRunning_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cord_MeetingIsRunning_14_00");	//Добро пожаловать в Кольцо Воды, брат.
		DIA_Addon_Cord_MeetingIsRunning_OneTime = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Cord_MeetingIsRunning_14_01");	//Ты должен поговорить с Ватрасом...
	};

	AI_StopProcessInfos(self);
};


instance DIA_Cord_Hallo(C_Info)
{
	npc = Sld_805_Cord;
	nr = 2;
	condition = DIA_Cord_Hallo_Condition;
	information = DIA_Cord_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Cord_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE) && (other.guild == GIL_NONE) && (RangerMeetingRunning != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Cord_Hallo_Info()
{
	AI_Output(self,other,"DIA_Cord_Hallo_14_00");	//Если у тебя проблемы с волками или полевыми хищниками, поговори с одним из наемников помоложе.
	AI_Output(self,other,"DIA_Cord_Hallo_14_01");	//А ко мне ты можешь обратиться, когда появятся паладины.
	if(SC_IsRanger == FALSE)
	{
		AI_Output(other,self,"DIA_Cord_Hallo_15_02");	//Что?
		AI_Output(self,other,"DIA_Cord_Hallo_14_03");	//Когда вы, крестьяне, обращаетесь ко мне, вы всегда просите убить ни в чем не повинных зверей.
		AI_Output(other,self,"DIA_Cord_Hallo_15_04");	//Я не крестьянин.
		AI_Output(self,other,"DIA_Cord_Hallo_14_05");	//Ох...И чего же ты хочешь?
	};
};

var int Cord_SchonmalGefragt;
var int CordAppFT;

instance DIA_Cord_WannaJoin(C_Info)
{
	npc = Sld_805_Cord;
	nr = 5;
	condition = DIA_Cord_WannaJoin_Condition;
	information = DIA_Cord_WannaJoin_Info;
	permanent = TRUE;
	description = "Я хочу стать наемником!";
};


func int DIA_Cord_WannaJoin_Condition()
{
	if((Cord_Approved == FALSE) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void B_Cord_BeBetter()
{
	AI_Output(self,other,"DIA_Cord_WannaJoin_14_14");	//Пока ты едва умеешь обращаться с оружием и тебе здесь не место!
};

func void DIA_Cord_WannaJoin_Info()
{
	AI_Output(other,self,"DIA_Cord_WannaJoin_15_00");	//Я хочу стать наемником!
	if(Cord_SchonmalGefragt == FALSE)
	{
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_01");	//Ты больше похож на того, кто был рожден работать на поле, парень.
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_02");	//Ты умеешь обращаться с оружием?
		Cord_SchonmalGefragt = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_03");	//Ты повысил свои навыки?
	};
	AI_Output(self,other,"DIA_Cord_WannaJoin_14_04");	//Итак, как насчет одноручного оружия?

	if(hero.HitChance[NPC_TALENT_1H] >= 30)
	{
		AI_Output(other,self,"DIA_Cord_WannaJoin_15_05");	//Я не так уж плох в этом.
	}
	else
	{
		AI_Output(other,self,"DIA_Cord_WannaJoin_15_06");	//Что же...(задумчиво)
	};
	AI_Output(self,other,"DIA_Cord_WannaJoin_14_07");	//А что насчет двуручного оружия?

	if(hero.HitChance[NPC_TALENT_2H] >= 30)
	{
		AI_Output(other,self,"DIA_Cord_WannaJoin_15_08");	//Я умею обращаться с ним.
	}
	else
	{
		AI_Output(other,self,"DIA_Cord_WannaJoin_15_09");	//И скоро я стану еще лучше!
	};
	if((hero.HitChance[NPC_TALENT_1H] >= 30) || (hero.HitChance[NPC_TALENT_2H] >= 30))
	{
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_10");	//Ну, по крайней мере, ты не зеленый новичок. Хорошо. Я проголосую за тебя.
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_11");	//Если тебе еще что-то нужно знать, ты можешь спросить у меня.
		Cord_Approved = TRUE;
		B_GivePlayerXP(XP_Cord_Approved);
		B_LogEntry(TOPIC_SLDRespekt,"Голос Корда у меня в кармане.");
		Log_CreateTopic(Topic_SoldierTeacher,LOG_NOTE);
		B_LogEntry_Quiet(Topic_SoldierTeacher,"Корд может обучить меня владению одноручным и двуручным оружием. А также сможет повысить мою выносливость.");
	}
	else
	{
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_12");	//Другими словами, ты зеленый новичок!
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_13");	//Мы наемники, должны быть уверены, что можем всецело положиться на наших товарищей. От этого зависит наша жизнь.
		B_Cord_BeBetter();

		if(CordAppFT == FALSE)
		{
			Log_CreateTopic(TOPIC_CordProve,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_CordProve,LOG_Running);
			B_LogEntry(TOPIC_CordProve,"Корд отдаст свой голос за меня, когда я научусь сражаться лучше. (Требование: навык владения одноручным или двуручным оружием 30 или более)");
			CordAppFT = TRUE;
		};
	};
};

instance DIA_Addon_Cord_YouAreRanger(C_Info)
{
	npc = Sld_805_Cord;
	nr = 2;
	condition = DIA_Addon_Cord_YouAreRanger_Condition;
	information = DIA_Addon_Cord_YouAreRanger_Info;
	description = "Говорят, ты принадлежишь к Кольцу Воды?";
};

func int DIA_Addon_Cord_YouAreRanger_Condition()
{
	if((RangerHelp_gildeSLD == TRUE) && (Cord_SchonmalGefragt == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cord_YouAreRanger_Info()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_15_00");	//Говорят, ты принадлежишь к Кольцу Воды?
	if(SC_IsRanger == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_14_01");	//Что за крыса не смогла удержать на замке свой болтливый рот?

		if(SC_KnowsCordAsRangerFromLee == TRUE)
		{
			AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_15_02");	//Мне сказал Ли.
		};
		if(SC_KnowsCordAsRangerFromLares == TRUE)
		{
			AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_15_03");	//Ларес сказал, что ты поможешь мне, если я скажу, что он взял меня под свое крыло.
		};
	};

	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_14_04");	//Похоже, что теперь мне придется возиться с тобой, так?
	AI_Output(self,other,"DIA_Addon_Cord_Add_14_01");	//Ну хорошо, что тебе нужно?
	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_14_06");	//И хорошо подумай над тем, что ты мне скажешь. Потому что, если мне не понравится то, что я услышу, я с тебя кожу сдеру.
	Info_ClearChoices(DIA_Addon_Cord_YouAreRanger);
	Info_AddChoice(DIA_Addon_Cord_YouAreRanger,"На самом деле, мне ничего не нужно. Я и сам справлюсь.",DIA_Addon_Cord_YouAreRanger_nix);
	Info_AddChoice(DIA_Addon_Cord_YouAreRanger,"Мне нужна твоя броня.",DIA_Addon_Cord_YouAreRanger_ruestung);
	Info_AddChoice(DIA_Addon_Cord_YouAreRanger,"Мне нужно твое оружие!",DIA_Addon_Cord_YouAreRanger_waffe);

	if((Cord_Approved == FALSE) && (hero.guild != GIL_SLD) && (hero.guild != GIL_DJG) && (Cord_RangerHelp_Fight == FALSE))
	{
		Info_AddChoice(DIA_Addon_Cord_YouAreRanger,"Научи меня сражаться!",DIA_Addon_Cord_YouAreRanger_kampf);
	};
	if(hero.guild == GIL_NONE)
	{
		Info_AddChoice(DIA_Addon_Cord_YouAreRanger,"Ты бы мог помочь мне стать наемником.",DIA_Addon_Cord_YouAreRanger_SLDAufnahme);
	};
};


var int Cord_SC_Dreist;

func void B_DIA_Addon_Cord_YouAreRanger_WARN()
{
	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_WARN_14_00");	//И горе тебе, если мне станет известно, что ты распускаешь язык. Предупреждаю первый и единственный раз, понятно?
};

func void B_DIA_Addon_Cord_YouAreRanger_FRESSE()
{
	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_FRESSE_14_00");	//Ну хватит! На этот раз ты зашел слишком далеко. Я выбью из тебя дурь.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
	Cord_RangerHelp_GetSLD = FALSE;
	Cord_RangerHelp_Fight = FALSE;
	TOPIC_End_RangerHelpSLD = TRUE;
};

func void DIA_Addon_Cord_YouAreRanger_ruestung()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_ruestung_15_00");	//Мне нужна твоя броня.
	if(Cord_SC_Dreist == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_ruestung_14_01");	//Повтори это еще раз - и тебе придется собирать свои зубы с земли.
		Cord_SC_Dreist = TRUE;
	}
	else
	{
		B_DIA_Addon_Cord_YouAreRanger_FRESSE();
	};
};

func void DIA_Addon_Cord_YouAreRanger_waffe()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_Add_15_00");	//Мне нужно твое оружие!

	if(Cord_SC_Dreist == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cord_Add_14_03");	//Неужели?...(угрожающе)
		AI_Output(self,other,"DIA_Addon_Cord_Add_14_02");	//Тогда попробуй его забрать!
		Cord_SC_Dreist = TRUE;
	}
	else
	{
		B_DIA_Addon_Cord_YouAreRanger_FRESSE();
	};
};

func void DIA_Addon_Cord_YouAreRanger_weg()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_weg_15_00");	//Уходи отсюда! Я хочу занять твое место на этой ферме.

	if(Cord_SC_Dreist == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_weg_14_01");	//Не шути со мной, малыш, иначе я переломаю тебе все кости.
		Cord_SC_Dreist = TRUE;
	}
	else
	{
		B_DIA_Addon_Cord_YouAreRanger_FRESSE();
	};
};


var int DIA_Addon_Cord_YouAreRanger_SCGotOffer;

func void DIA_Addon_Cord_YouAreRanger_kampf()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_kampf_15_00");	//Научи меня сражаться!
	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_kampf_14_01");	//Хорошо. Что еще?
	Cord_RangerHelp_Fight = TRUE;

	if(DIA_Addon_Cord_YouAreRanger_SCGotOffer == FALSE)
	{
		Info_AddChoice(DIA_Addon_Cord_YouAreRanger,"Это все.",DIA_Addon_Cord_YouAreRanger_reicht);
		DIA_Addon_Cord_YouAreRanger_SCGotOffer = TRUE;
	};
};

func void DIA_Addon_Cord_YouAreRanger_SLDAufnahme()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_SLDAufnahme_15_00");	//Ты бы мог помочь мне стать наемником.
	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_SLDAufnahme_14_01");	//Ха-ха-ха...(смеется) Все понятно. Ладно, я попытаюсь. Что еще?
	Cord_RangerHelp_GetSLD = TRUE;

	if(DIA_Addon_Cord_YouAreRanger_SCGotOffer == FALSE)
	{
		Info_AddChoice(DIA_Addon_Cord_YouAreRanger,"Это все.",DIA_Addon_Cord_YouAreRanger_reicht);
		DIA_Addon_Cord_YouAreRanger_SCGotOffer = TRUE;
	};
};

func void DIA_Addon_Cord_YouAreRanger_Gold()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_Gold_15_00");	//Заплати мне за молчание.
	if(Cord_SC_Dreist == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_Gold_14_01");	//Вот как? Тебе не повезло. Я не тот, кого можно шантажировать, приятель.
		Cord_SC_Dreist = TRUE;
	}
	else
	{
		B_DIA_Addon_Cord_YouAreRanger_FRESSE();
	};
};

func void DIA_Addon_Cord_YouAreRanger_nix()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_nix_15_00");	//На самом деле, мне ничего не нужно. Я и сам справлюсь.
	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_nix_14_01");	//Как скажешь.
	B_DIA_Addon_Cord_YouAreRanger_WARN();
	Info_ClearChoices(DIA_Addon_Cord_YouAreRanger);
};

func void DIA_Addon_Cord_YouAreRanger_reicht()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_reicht_15_00");	//Это все.
	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_reicht_14_01");	//Ну, это не сложно.
	B_DIA_Addon_Cord_YouAreRanger_WARN();
	Info_ClearChoices(DIA_Addon_Cord_YouAreRanger);
};


instance DIA_Addon_Cord_RangerHelp2GetSLD(C_Info)
{
	npc = Sld_805_Cord;
	nr = 2;
	condition = DIA_Addon_Cord_RangerHelp2GetSLD_Condition;
	information = DIA_Addon_Cord_RangerHelp2GetSLD_Info;
	permanent = TRUE;
	description = "Помоги мне стать наемником.";
};

var int DIA_Addon_Cord_RangerHelp2GetSLD_NoPerm;

func int DIA_Addon_Cord_RangerHelp2GetSLD_Condition()
{
	if((Cord_RangerHelp_GetSLD == TRUE) && (hero.guild == GIL_NONE) && (DIA_Addon_Cord_RangerHelp2GetSLD_NoPerm == FALSE))
	{
		return TRUE;
	};
};

func void B_Cord_RangerHelpObsolete()
{
	AI_Output(other,self,"DIA_Addon_Cord_RangerHelpObsolete_15_00");	//Я уже позаботился об этом.
	AI_Output(self,other,"DIA_Addon_Cord_RangerHelpObsolete_14_01");	//В таком случае, я не смогу тебе помочь.
	AI_Output(other,self,"DIA_Addon_Cord_RangerHelpObsolete_15_02");	//Что ты имеешь в виду?
	AI_Output(self,other,"DIA_Addon_Cord_RangerHelpObsolete_14_03");	//Я имею в виду, что не смогу тебе помочь.
	AI_Output(self,other,"DIA_Addon_Cord_RangerHelpObsolete_14_04");	//Или ты хочешь, чтобы я лично убедил бы каждого наемника в том, что ты можешь к нам присоединиться?
	AI_Output(self,other,"DIA_Addon_Cord_RangerHelpObsolete_14_05");	//Этим тебе придется заняться самому.
	DIA_Addon_Cord_RangerHelp2GetSLD_NoPerm = TRUE;
	TOPIC_End_RangerHelpSLD = TRUE;
};

func void B_Cord_ComeLaterWhenDone()
{
	AI_Output(self,other,"DIA_Addon_Cord_ComeLaterWhenDone_14_00");	//Так что вперед. Сделаешь это, и возвращайся ко мне.
	AI_StopProcessInfos(self);
};

func void B_Cord_IDoItForYou()
{
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_00");	//Понятно. Что ж, это просто. Возвращайся завтра, и все будет сделано.
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_01");	//Но за это тебе придется кое-что для меня сделать.
	AI_Output(other,self,"DIA_Addon_Cord_IDoItForYou_15_02");	//И что же именно?
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_03");	//Недалеко отсюда, в холмах на юго-востоке, расположен небольшой бандитский лагерь.
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_04");	//Если отсюда ты пойдешь на юго-восток, ты вскорости увидишь их башню.
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_05");	//Один из моих людей, Патрик, несколько дней назад отправился туда, чтобы заключить сделку с этими подонками.
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_06");	//Я говорил ему, что это плохая мысль, но этот идиот меня не послушал.
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_07");	//Думаю, они расправились с ним. Но не уверен.
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_08");	//Ты должен выяснить, что с ним случилось.
	B_LogEntry(TOPIC_Addon_RangerHelpSLD,"Корд готов решить проблему с испытанием Торлофа. Приятель Корда Патрик пропал. Корд Хочет, чтобы я отправился в лагерь бандитов в горах на юго-востоке и выяснил, нет ли там Патрика.");
	Info_ClearChoices(DIA_Addon_Cord_RangerHelp2GetSLD);
	Info_AddChoice(DIA_Addon_Cord_RangerHelp2GetSLD,"Забудь об этом. Это гораздо сложнее, чем задание Торлофа.",B_Cord_IDoItForYou_mist);
	Info_AddChoice(DIA_Addon_Cord_RangerHelp2GetSLD,"А почему ты думаешь, что со мной они не расправятся так же, как с Патриком?",B_Cord_IDoItForYou_Dexter);
	DIA_Addon_Cord_RangerHelp2GetSLD_NoPerm = TRUE;
};

func void B_Cord_IDoItForYou_mist()
{
	AI_Output(other,self,"Dia_Addon_Cord_IDoItForYou_mist_15_00");	//Забудь об этом. Это гораздо сложнее, чем задание Торлофа.
	AI_Output(self,other,"Dia_Addon_Cord_IDoItForYou_mist_14_01");	//Да нет. Такой маленький и безобидный человек, как ты, не вызовет у них интереса.
	AI_Output(self,other,"Dia_Addon_Cord_IDoItForYou_mist_14_02");	//А вот мне туда идти нельзя. Эти парни хватаются за оружие при одном виде наемника.
};

func void B_Cord_IDoItForYou_Dexter()
{
	AI_Output(other,self,"Dia_Addon_Cord_IDoItForYou_Dexter_15_00");	//А почему ты думаешь, что со мной они не расправятся так же, как с Патриком?
	AI_Output(self,other,"Dia_Addon_Cord_IDoItForYou_Dexter_14_01");	//Дело в том, что я знаю имя предводителя бандитов. Его зовут Декстер. Просто скажи им, что ты знаешь этого парня.
	AI_Output(self,other,"Dia_Addon_Cord_IDoItForYou_Dexter_14_02");	//Это должно лишить их желания свернуть тебе шею.
	AI_Output(self,other,"Dia_Addon_Cord_IDoItForYou_Dexter_14_03");	//Конечно, это все довольно опасно.
	AI_Output(self,other,"Dia_Addon_Cord_IDoItForYou_Dexter_14_04");	//Но ты справишься.
	Info_ClearChoices(DIA_Addon_Cord_RangerHelp2GetSLD);
	B_LogEntry(TOPIC_Addon_RangerHelpSLD,"Главаря бандитов зовут Декстер.");
	Log_CreateTopic(TOPIC_Addon_MissingPeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_MissingPeople,"Наемник Корд ищет своего приятеля Патрика.");
	MIS_Addon_Cord_Look4Patrick = LOG_Running;
	Ranger_SCKnowsDexter = TRUE;
};

func void DIA_Addon_Cord_RangerHelp2GetSLD_Info()
{
	AI_Output(other,self,"DIA_Addon_Cord_RangerHelp2GetSLD_15_00");	//Помоги мне стать наемником.
	AI_Output(self,other,"DIA_Addon_Cord_RangerHelp2GetSLD_14_01");	//Надо подумать! Хммм...(задумчиво) Если ты хочешь чего-то здесь добиться, тебе нужно поговорить с Торлофом.
	AI_Output(self,other,"DIA_Addon_Cord_RangerHelp2GetSLD_14_02");	//Ты уже встречался с ним?

	if(Torlof_Go == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_Cord_RangerHelp2GetSLD_15_03");	//Еще нет.
		B_Cord_ComeLaterWhenDone();
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Cord_RangerHelp2GetSLD_15_04");	//Да. Он рассказал мне об испытании и прочем...
		AI_Output(self,other,"DIA_Addon_Cord_RangerHelp2GetSLD_14_05");	//Ага. И какое же задание тебе дали?

		if((Torlof_ProbeBestanden == TRUE) || ((MIS_Torlof_BengarMilizKlatschen == LOG_Running) && Npc_IsDead(Rumbold) && Npc_IsDead(Rick)) || ((MIS_Torlof_HolPachtVonSekob == LOG_Running) && ((Sekob.aivar[AIV_DefeatedByPlayer] == TRUE) || Npc_IsDead(Sekob))))
		{
			B_Cord_RangerHelpObsolete();
		}
		else if(Torlof_Probe == 0)
		{
			AI_Output(other,self,"DIA_Addon_Cord_RangerHelp2GetSLD_15_06");	//Я пока не получил задание.
			B_Cord_ComeLaterWhenDone();
		}
		else if(Torlof_Probe == Probe_Sekob)
		{
			AI_Output(other,self,"DIA_Addon_Cord_RangerHelp2GetSLD_15_07");	//Я должен собрать ренту на ферме Секоба.
			B_Cord_IDoItForYou();
		}
		else if(Torlof_Probe == Probe_Bengar)
		{
			AI_Output(other,self,"DIA_Addon_Cord_RangerHelp2GetSLD_15_08");	//Я должен избавить Бенгара от солдат ополчения.
			B_Cord_IDoItForYou();
		}
		else
		{
			B_Cord_RangerHelpObsolete();
		};
	};
};


instance DIA_Addon_Cord_TalkedToDexter(C_Info)
{
	npc = Sld_805_Cord;
	nr = 5;
	condition = DIA_Addon_Cord_TalkedToDexter_Condition;
	information = DIA_Addon_Cord_TalkedToDexter_Info;
	description = "Я встретился с Декстером.";
};


func int DIA_Addon_Cord_TalkedToDexter_Condition()
{
	if(((BDT_1060_Dexter.aivar[AIV_TalkedToPlayer] == TRUE) || Npc_IsDead(BDT_1060_Dexter)) && (MIS_Addon_Cord_Look4Patrick == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cord_TalkedToDexter_Info()
{
	AI_Output(other,self,"DIA_Addon_Cord_TalkedToDexter_15_00");	//Я встретился с Декстером.
	AI_Output(self,other,"DIA_Addon_Cord_TalkedToDexter_14_01");	//И?
	if(Npc_IsDead(BDT_1060_Dexter))
	{
		AI_Output(other,self,"DIA_Addon_Cord_TalkedToDexter_15_02");	//Он мертв.
	};
	AI_Output(other,self,"DIA_Addon_Cord_TalkedToDexter_15_03");	//Я не нашел следов твоего друга Патрика.
	if(Dexter_KnowsPatrick == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Cord_TalkedToDexter_15_04");	//Декстер его вспомнил, но сказал, что последний раз его видел очень давно.
		AI_Output(self,other,"DIA_Addon_Cord_TalkedToDexter_14_05");	//Ты уверен, что Декстер не лгал?
		AI_Output(other,self,"DIA_Addon_Cord_TalkedToDexter_15_06");	//Не уверен. Но это все, что я могу тебе сказать.
	};
	AI_Output(self,other,"DIA_Addon_Cord_TalkedToDexter_14_07");	//Не понимаю... Не мог же Патрик просто так взять и исчезнуть.
	AI_Output(self,other,"DIA_Addon_Cord_TalkedToDexter_14_08");	//Что ж, ты выполнил условия сделки...
	MIS_Addon_Cord_Look4Patrick = LOG_SUCCESS;
	TOPIC_End_RangerHelpSLD = TRUE;
	B_GivePlayerXP(XP_Addon_Cord_Look4Patrick);
	AI_Output(other,self,"DIA_Addon_Cord_TalkedToDexter_15_09");	//Что насчет задания Торлофа?
	AI_Output(self,other,"DIA_Addon_Cord_TalkedToDexter_14_10");	//Не беспокойся, я обо всем позаботился. Твое задание выполнено, и ты прошел испытание. Можешь поговорить с Торлофом.
	Cord_RangerHelp_TorlofsProbe = TRUE;
	if(Torlof_Probe == Probe_Sekob)
	{
		MIS_Torlof_HolPachtVonSekob = LOG_SUCCESS;
	}
	else if(Torlof_Probe == Probe_Bengar)
	{
		MIS_Torlof_BengarMilizKlatschen = LOG_SUCCESS;
	};
};

instance DIA_Cord_ReturnPatrick(C_Info)
{
	npc = Sld_805_Cord;
	nr = 8;
	condition = DIA_Cord_ReturnPatrick_Condition;
	information = DIA_Cord_ReturnPatrick_Info;
	permanent = FALSE;
	description = "Патрик вернулся.";
};


func int DIA_Cord_ReturnPatrick_Condition()
{
	if((Npc_GetDistToWP(STRF_1123_Addon_Patrick_NW,"NW_BIGFARM_PATRICK") <= 10000) && (MissingPeopleReturnedHome == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Cord_ReturnPatrick_Info()
{
	B_GivePlayerXP(XP_Ambient);
	AI_Output(other,self,"DIA_Addon_Cord_ReturnPatrick_15_00");	//Патрик вернулся.
	AI_Output(self,other,"DIA_Addon_Cord_ReturnPatrick_14_01");	//Отлично! Я уже почти потерял надежду. Ты...
	AI_Output(other,self,"DIA_Addon_Cord_ReturnPatrick_15_02");	//У меня есть одна просьба.
	AI_Output(self,other,"DIA_Addon_Cord_ReturnPatrick_14_03");	//Да?
	AI_Output(other,self,"DIA_Addon_Cord_ReturnPatrick_15_04");	//Давай обойдемся без благодарностей.
	AI_Output(self,other,"DIA_Addon_Cord_ReturnPatrick_14_05");	//Но я и не собирался тебя благодарить.
	AI_Output(other,self,"DIA_Addon_Cord_ReturnPatrick_15_06");	//Что?..
	AI_Output(self,other,"DIA_Addon_Cord_ReturnPatrick_14_07");	//(усмехается) Я собирался сказать тебе, что ты нахальный и скользкий малый.
	AI_Output(self,other,"DIA_Addon_Cord_ReturnPatrick_14_09");	//Продолжай в том же духе!
	AI_StopProcessInfos(self);
};

instance DIA_Cord_ExplainWeapons(C_Info)
{
	npc = Sld_805_Cord;
	nr = 2;
	condition = DIA_Cord_ExplainWeapons_Condition;
	information = DIA_Cord_ExplainWeapons_Info;
	permanent = FALSE;
	description = "Ну, а каковы преимущества одноручного и двуручного оружия?";
};


func int DIA_Cord_ExplainWeapons_Condition()
{
	if((Cord_Approved == TRUE) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (Cord_RangerHelp_Fight == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Cord_ExplainWeapons_Info()
{
	AI_Output(other,self,"DIA_Cord_ExplainWeapons_15_00");	//Ну, а каковы преимущества одноручного и двуручного оружия?
	AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_01");	//Хороший вопрос. Я вижу, что ты размышлял над этим вопросом.
	AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_02");	//Одноручное оружие быстрее, но оно наносит меньший урон врагам.
	AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_03");	//Двуручное оружие наносит больший урон, но им не получится размахивать так же быстро, как одноручным.
	AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_04");	//Также, чтобы владеть двуручным мечом, тебе понадобится больше сил. Это означает необходимость дополнительных тренировок.
	AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_05");	//Чтобы стать настоящим профессионалом, придется затратить много усилий.
};

var int Cord_Merke_1h;
var int Cord_Merke_2h;

instance DIA_Cord_Teach(C_Info)
{
	npc = Sld_805_Cord;
	nr = 3;
	condition = DIA_Cord_Teach_Condition;
	information = DIA_Cord_Teach_Info;
	permanent = TRUE;
	description = "Научи меня сражаться!";
};

func int DIA_Cord_Teach_Condition()
{
	return TRUE;
};

func void B_Cord_Zeitverschwendung()
{
	AI_Output(self,other,"DIA_Cord_Teach_14_03");	//Я не хочу тратить свое время на новичков.
};

func void DIA_Cord_Teach_Info()
{
	AI_Output(other,self,"DIA_Cord_Teach_15_00");	//Научи меня сражаться!

	if((Cord_Approved == TRUE) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (Cord_RangerHelp_Fight == TRUE))
	{
		AI_Output(self,other,"DIA_Cord_Teach_14_01");	//Я могу обучить тебя владению любым оружием - с чего начнем?
		Cord_Merke_1h = hero.HitChance[NPC_TALENT_1H];
		Cord_Merke_2h = hero.HitChance[NPC_TALENT_2H];
		Info_ClearChoices(DIA_Cord_Teach);
		Info_AddChoice(DIA_Cord_Teach,Dialog_Back,DIA_Cord_Teach_Back);
		Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_cord_teach_stamina_1);
		Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_cord_teach_stamina_5);
		Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Cord_Teach_2H_1);
		Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Cord_Teach_2H_5);
		Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Cord_Teach_1H_1);
		Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Cord_Teach_1H_5);

		if((Kapitel >= 2) && (VATRAS_TEACHREGENSTAM == FALSE) && ((other.guild == GIL_SLD) || (other.guild == GIL_DJG))) 
		{
			Info_AddChoice(DIA_Cord_Teach,"Регенерация выносливости (Очки обучения: 5, Цена: 10000 монет)",DIA_Cord_Teach_RegenStam);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Cord_Teach_14_06");	//Я тренирую только наемников и достойных кандидатов!
		B_Cord_Zeitverschwendung();
		B_Cord_BeBetter();
	};
};

func void DIA_Cord_Teach_Back()
{
	if((Cord_Merke_1h < other.HitChance[NPC_TALENT_1H]) || (Cord_Merke_2h < other.HitChance[NPC_TALENT_2H]))
	{
		AI_Output(self,other,"DIA_Cord_Teach_BACK_14_00");	//Ты стал значительно лучше - так держать!
	};

	Info_ClearChoices(DIA_Cord_Teach);
};

func void DIA_Cord_Teach_RegenStam()
{
	var int kosten;
	var int money;

	AI_Output(other,self,"DIA_Vatras_Teach_regen_15_03");	//Научи меня ускоренному восстановлению выносливости.

	kosten = 5;
	money = 10000;

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		AI_StopProcessInfos(self);
	};
	if(Npc_HasItems(other,ItMi_Gold) < money)
	{
		AI_Print(Print_NotEnoughGold);
		AI_StopProcessInfos(self);
	};
	if((hero.lp >= kosten) && (Npc_HasItems(other,ItMi_Gold) >= money))
	{
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + kosten;
		Npc_RemoveInvItems(other,ItMi_Gold,money);
		AI_Print("Обучение: Ускоренная регенерация выносливости");
		VATRAS_TEACHREGENSTAM = TRUE;
		Snd_Play("LevelUP");
	};

	Info_ClearChoices(DIA_Cord_Teach);
	Info_AddChoice(DIA_Cord_Teach,Dialog_Back,DIA_Cord_Teach_Back);

	if((Cord_Approved == TRUE) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (Cord_RangerHelp_Fight == TRUE))
	{
		Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_cord_teach_stamina_1);
		Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_cord_teach_stamina_5);
		Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Cord_Teach_2H_1);
		Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Cord_Teach_2H_5);
		Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Cord_Teach_1H_1);
		Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Cord_Teach_1H_5);
	};
};

func void DIA_Cord_Teach_2H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,60);
	Info_ClearChoices(DIA_Cord_Teach);
	Info_AddChoice(DIA_Cord_Teach,Dialog_Back,DIA_Cord_Teach_Back);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_cord_teach_stamina_1);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_cord_teach_stamina_5);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Cord_Teach_2H_1);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Cord_Teach_2H_5);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Cord_Teach_1H_1);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Cord_Teach_1H_5);

	if((Kapitel >= 2) && (VATRAS_TEACHREGENSTAM == FALSE) && ((other.guild == GIL_SLD) || (other.guild == GIL_DJG))) 
	{
		Info_AddChoice(DIA_Cord_Teach,"Регенерация выносливости (Очки обучения: 5, Цена: 10000 монет)",DIA_Cord_Teach_RegenStam);
	};
};

func void DIA_Cord_Teach_2H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,60);
	Info_ClearChoices(DIA_Cord_Teach);
	Info_AddChoice(DIA_Cord_Teach,Dialog_Back,DIA_Cord_Teach_Back);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_cord_teach_stamina_1);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_cord_teach_stamina_5);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Cord_Teach_2H_1);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Cord_Teach_2H_5);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Cord_Teach_1H_1);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Cord_Teach_1H_5);

		if((Kapitel >= 2) && (VATRAS_TEACHREGENSTAM == FALSE) && ((other.guild == GIL_SLD) || (other.guild == GIL_DJG))) 
		{
			Info_AddChoice(DIA_Cord_Teach,"Регенерация выносливости (Очки обучения: 5, Цена: 10000 монет)",DIA_Cord_Teach_RegenStam);
		};
};

func void DIA_Cord_Teach_1H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,100);
	Info_ClearChoices(DIA_Cord_Teach);
	Info_AddChoice(DIA_Cord_Teach,Dialog_Back,DIA_Cord_Teach_Back);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_cord_teach_stamina_1);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_cord_teach_stamina_5);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Cord_Teach_2H_1);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Cord_Teach_2H_5);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Cord_Teach_1H_1);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Cord_Teach_1H_5);

	if((Kapitel >= 2) && (VATRAS_TEACHREGENSTAM == FALSE) && ((other.guild == GIL_SLD) || (other.guild == GIL_DJG))) 
	{
		Info_AddChoice(DIA_Cord_Teach,"Регенерация выносливости (Очки обучения: 5, Цена: 10000 монет)",DIA_Cord_Teach_RegenStam);
	};
};

func void DIA_Cord_Teach_1H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,100);
	Info_ClearChoices(DIA_Cord_Teach);
	Info_AddChoice(DIA_Cord_Teach,Dialog_Back,DIA_Cord_Teach_Back);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_cord_teach_stamina_1);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_cord_teach_stamina_5);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Cord_Teach_2H_1);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Cord_Teach_2H_5);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Cord_Teach_1H_1);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Cord_Teach_1H_5);

	if((Kapitel >= 2) && (VATRAS_TEACHREGENSTAM == FALSE) && ((other.guild == GIL_SLD) || (other.guild == GIL_DJG))) 
	{
		Info_AddChoice(DIA_Cord_Teach,"Регенерация выносливости (Очки обучения: 5, Цена: 10000 монет)",DIA_Cord_Teach_RegenStam);
	};
};

func void dia_cord_teach_stamina_1()
{
	b_teachstamina(self,other,NPC_TALENT_STAMINA,1);
	Info_ClearChoices(DIA_Cord_Teach);
	Info_AddChoice(DIA_Cord_Teach,Dialog_Back,DIA_Cord_Teach_Back);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_cord_teach_stamina_1);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_cord_teach_stamina_5);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Cord_Teach_2H_1);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Cord_Teach_2H_5);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Cord_Teach_1H_1);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Cord_Teach_1H_5);

	if((Kapitel >= 2) && (VATRAS_TEACHREGENSTAM == FALSE) && ((other.guild == GIL_SLD) || (other.guild == GIL_DJG))) 
	{
		Info_AddChoice(DIA_Cord_Teach,"Регенерация выносливости (Очки обучения: 5, Цена: 10000 монет)",DIA_Cord_Teach_RegenStam);
	};
};

func void dia_cord_teach_stamina_5()
{
	b_teachstamina(self,other,NPC_TALENT_STAMINA,5);
	Info_ClearChoices(DIA_Cord_Teach);
	Info_AddChoice(DIA_Cord_Teach,Dialog_Back,DIA_Cord_Teach_Back);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_cord_teach_stamina_1);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_cord_teach_stamina_5);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Cord_Teach_2H_1);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Cord_Teach_2H_5);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Cord_Teach_1H_1);
	Info_AddChoice(DIA_Cord_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Cord_Teach_1H_5);

	if((Kapitel >= 2) && (VATRAS_TEACHREGENSTAM == FALSE) && ((other.guild == GIL_SLD) || (other.guild == GIL_DJG))) 
	{
		Info_AddChoice(DIA_Cord_Teach,"Регенерация выносливости (Очки обучения: 5, Цена: 10000 монет)",DIA_Cord_Teach_RegenStam);
	};
};

instance DIA_Cord_PICKPOCKET(C_Info)
{
	npc = Sld_805_Cord;
	nr = 900;
	condition = DIA_Cord_PICKPOCKET_Condition;
	information = DIA_Cord_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int DIA_Cord_PICKPOCKET_Condition()
{
	return C_Beklauen(65,75);
};

func void DIA_Cord_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Cord_PICKPOCKET);
	Info_AddChoice(DIA_Cord_PICKPOCKET,Dialog_Back,DIA_Cord_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Cord_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Cord_PICKPOCKET_DoIt);
};

func void DIA_Cord_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Cord_PICKPOCKET);
};

func void DIA_Cord_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Cord_PICKPOCKET);
};


//----------------------------------------------------Лоа-----------------------------------

instance DIA_Loa_EXIT(C_Info)
{
	npc = SLD_10920_Loa;
	nr = 999;
	condition = DIA_Loa_EXIT_Condition;
	information = DIA_Loa_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Loa_EXIT_Condition()
{
	if((LoaOnParty == FALSE) || (LoaOverParty == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Loa_EXIT_Info()
{
	if((LoaBonus_01 == TRUE) && (LoaBonus_02 == TRUE) && (LoaBonus_03 == TRUE) && (MIS_LoaRomance != LOG_Success))
	{
		MIS_LoaRomance = LOG_Success;
		Log_SetTopicStatus(TOPIC_LoaRomance,LOG_Success);

		if((KAPITELORCATC == FALSE) && (LoaLover == FALSE) && (LoaAntiBonus == FALSE))
		{
			LoaLover = TRUE;
		};
	};

	AI_StopProcessInfos(self);
};

instance DIA_Loa_Hello(C_Info)
{
	npc = SLD_10920_Loa;
	nr = 1;
	condition = DIA_Loa_Hello_Condition;
	information = DIA_Loa_Hello_Info;
	permanent = FALSE;
	description = "Твое лицо мне кажется знакомым.";
};

func int DIA_Loa_Hello_Condition()
{
	return TRUE;
};

func void DIA_Loa_Hello_Info()
{
	AI_Output(other,self,"DIA_Loa_Hello_01_01");	//Твое лицо мне кажется знакомым.
	AI_Output(self,other,"DIA_Loa_Hello_01_02");	//Хммм...(оценивающе) Да, вроде бы я тоже тебя припоминаю.
	AI_Output(self,other,"DIA_Loa_Hello_01_03");	//Ах, ну да, теперь вспомнила.
	Info_ClearChoices(DIA_Loa_Hello);
	Info_AddChoice(DIA_Loa_Hello,"Эмм... не напомнишь?",DIA_Loa_Hello_Later);
};

func void DIA_Loa_Hello_Later()
{
	PlayVideo("RET2_LoaMeet.bik");
	AI_Output(self,other,"DIA_Loa_Hello_Later_01_01");	//Ну как? Припоминаешь?
	AI_Output(other,self,"DIA_Loa_Hello_Later_01_02");	//Еще бы! Да уж, здорово ты мне тогда врезала.
	AI_Output(other,self,"DIA_Loa_Hello_Later_01_03");	//Похоже, долго я тогда пробыл в отключке. А когда очнулся, тебя уже не было рядом.
	AI_Output(self,other,"DIA_Loa_Hello_Later_01_04");	//Извини. Но тогда я не знала, можно ли тебе доверять.
	AI_Output(other,self,"DIA_Loa_Hello_Later_01_05");	//А теперь знаешь?
	AI_Output(self,other,"DIA_Loa_Hello_Later_01_06");	//Теперь тоже не знаю! Но, пожалуй, что в этот раз пожалею твою рожу. 
	AI_Output(other,self,"DIA_Loa_Hello_Later_01_07");	//Очень на это надеюсь.
};

instance DIA_Loa_MineTale(C_Info)
{
	npc = SLD_10920_Loa;
	nr = 2;
	condition = DIA_Loa_MineTale_Condition;
	information = DIA_Loa_MineTale_Info;
	permanent = FALSE;
	description = "Ты тоже была в Долине Рудников?";
};

func int DIA_Loa_MineTale_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Loa_Hello))
	{
		return TRUE;
	};
};

func void DIA_Loa_MineTale_Info()
{
	AI_Output(other,self,"DIA_Loa_MineTale_01_01");	//Ты тоже была в Долине Рудников?
	AI_Output(self,other,"DIA_Loa_MineTale_01_02");	//Да...(печально) К несчастью, мне тоже пришлось там побывать. 
	AI_Output(self,other,"DIA_Loa_MineTale_01_03");	//Но теперь все в прошлом! Так что не стоит об этом вспоминать.
};

instance DIA_Loa_WhatNew(C_Info)
{
	npc = SLD_10920_Loa;
	nr = 1;
	condition = DIA_Loa_WhatNew_Condition;
	information = DIA_Loa_WhatNew_Info;
	permanent = TRUE;
	description = "Что нового?";
};

func int DIA_Loa_WhatNew_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Loa_Hello) && (LoveBonus == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Loa_WhatNew_Info()
{
	AI_Output(other,self,"DIA_Loa_WhatNew_01_01");	//Что нового?
	AI_Output(self,other,"DIA_Loa_WhatNew_01_02");	//Вместо того, чтобы мучать меня глупыми вопросами, лучше займись чем-нибудь полезным. 
	AI_Output(other,self,"DIA_Loa_WhatNew_01_03");	//Ладно, извини.
};

//---------------романтик--------------------------------

instance DIA_Loa_Romantic(C_Info)
{
	npc = SLD_10920_Loa;
	nr = 2;
	condition = DIA_Loa_Romantic_Condition;
	information = DIA_Loa_Romantic_Info;
	permanent = FALSE;
	description = "Мне очень понравился твой танец!";
};

func int DIA_Loa_Romantic_Condition()
{
	if((ConcertLoaBonus == TRUE) && (Npc_KnowsInfo(other,DIA_Loa_Hello) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Loa_Romantic_Info()
{
	AI_Output(other,self,"DIA_Loa_Romantic_01_01");	//Мне очень понравился твой танец!
	AI_Output(self,other,"DIA_Loa_Romantic_01_02");	//Не подлизывайся! Если ты думаешь тем самым затащить меня в постель, то зря стараешься. Я не из таких!
	AI_Output(self,other,"DIA_Loa_Romantic_01_03");	//Так что лучше тебе отправиться прямиком в бордель. 
	AI_Output(other,self,"DIA_Loa_Romantic_01_04");	//Что ты! Я просто хотел выразить свое восхищение твоими талантами. 
	AI_Output(self,other,"DIA_Loa_Romantic_01_05");	//Поначалу все так говорят, а потом пристают со всякими глупостями. Думаю, и ты не исключение!
	AI_Output(self,other,"DIA_Loa_Romantic_01_06");	//Но я предупреждаю, если полезешь - схлопочешь по роже! Как и в тот раз, на пристани. Или забыл?
	AI_Output(other,self,"DIA_Loa_Romantic_01_07");	//Такое вряд ли забудешь.
};

instance DIA_Loa_HowGetYou(C_Info)
{
	npc = SLD_10920_Loa;
	nr = 2;
	condition = DIA_Loa_HowGetYou_Condition;
	information = DIA_Loa_HowGetYou_Info;
	permanent = FALSE;
	description = "Мне кажется, что ты слишком сурова с мужчинами.";
};

func int DIA_Loa_HowGetYou_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Loa_Romantic))
	{
		return TRUE;
	};
};

func void DIA_Loa_HowGetYou_Info()
{
	AI_Output(other,self,"DIA_Loa_HowGetYou_01_01");	//Мне кажется, что ты слишком сурова с мужчинами.
	AI_Output(self,other,"DIA_Loa_HowGetYou_01_02");	//А как с вами еще? Что ты, что эти неотесанные чурбаны вокруг меня, - даже не знаете, как можно произвести впечатление на приличную девушку.
	AI_Output(self,other,"DIA_Loa_HowGetYou_01_03");	//Кого ни возьми - у всех только одно на уме и ничего более.
	AI_Output(other,self,"DIA_Loa_HowGetYou_01_04");	//Может, тогда поделишься секретом, как можно произвести на вас хорошее впечатление?
	AI_Output(self,other,"DIA_Loa_HowGetYou_01_05");	//О Иннос! Да как угодно! Главное, чтобы девушке это понравилось, и чтобы после этого она почувствовала себя особенной! Понимаешь?
	AI_Output(other,self,"DIA_Loa_HowGetYou_01_06");	//Пока не очень. А поконкретнее?
	AI_Output(self,other,"DIA_Loa_HowGetYou_01_07");	//Ну... возможно, написать для нее стихи, преподнести ей какое-нибудь красивое украшение, ну или просто подарить цветы.
	AI_Output(self,other,"DIA_Loa_HowGetYou_01_08");	//Только не те сорняки, что растут за амбаром Теклы. Они должны быть по-настоящему прекрасны!
	MIS_LoaRomance = LOG_Running;
	Log_CreateTopic(TOPIC_LoaRomance,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LoaRomance,LOG_Running);
	B_LogEntry(TOPIC_LoaRomance,"Если я хочу добиться расположения Лоа, я должен произвести на нее впечатление галантным способом.");
	Info_ClearChoices(DIA_Loa_Hello);
	Info_AddChoice(DIA_Loa_HowGetYou,"А какие цветы нравятся тебе?",DIA_Loa_Hello_Flower);
	Info_AddChoice(DIA_Loa_HowGetYou,"У тебя есть на примете такое особенное украшение?",DIA_Loa_Hello_Pearl);
	Info_AddChoice(DIA_Loa_HowGetYou,"Сомневаюсь, что среди наемников найдутся поэты.",DIA_Loa_Hello_Stihi);
};

func void DIA_Loa_Hello_Flower()
{
	AI_Output(other,self,"DIA_Loa_Hello_Flower_01_01");	//А какие цветы нравятся тебе?
	AI_Output(self,other,"DIA_Loa_Hello_Flower_01_02");	//Трудно сказать. Все цветы по-своему прекрасны.
	AI_Output(other,self,"DIA_Loa_Hello_Flower_01_03");	//Может, есть какие-нибудь особенные?
	AI_Output(self,other,"DIA_Loa_Hello_Flower_01_04");	//Хммм... Возможно, среди прочих это... голубые мальвы.
	AI_Output(self,other,"DIA_Loa_Hello_Flower_01_05");	//Они росли возле нашего дома в Сильдене и всегда напоминали мне о самых счастливых годах моей жизни.
	AI_Output(other,self,"DIA_Loa_Hello_Flower_01_06");	//Хочешь я принесу тебе букетик этих цветов?
	AI_Output(self,other,"DIA_Loa_Hello_Flower_01_07");	//Это было бы очень мило с твоей стороны. Но боюсь, в этой части архипелага ты их вряд ли встретишь.
	AI_Output(self,other,"DIA_Loa_Hello_Flower_01_08");	//Отец говорил, что они растут только на материке, и то не везде. 
	AI_Output(other,self,"DIA_Loa_Hello_Flower_01_09");	//Ну, я что-нибудь придумаю.
	AI_Output(self,other,"DIA_Loa_Hello_Flower_01_10");	//Хорошо, я буду ждать.
	LoaCase_01 = TRUE;
	B_LogEntry(TOPIC_LoaRomance,"Лоа будет счастлива, если я принесу ей букет голубых мальв.");
	Info_ClearChoices(DIA_Loa_Hello);

	if((LoaCase_01 == TRUE) && (LoaCase_02 == TRUE) && (LoaCase_03 == TRUE))
	{
		Info_AddChoice(DIA_Loa_HowGetYou,"Мне пора.",DIA_Loa_Hello_Buy);		
	};
};

func void DIA_Loa_Hello_Pearl()
{
	AI_Output(other,self,"DIA_Loa_Hello_Pearl_01_01");	//У тебя есть на примете такое особенное украшение?
	AI_Output(self,other,"DIA_Loa_Hello_Pearl_01_02");	//Не знаю, как другим, а мне всегда хотелось иметь ожерелье из черного жемчуга!
	AI_Output(self,other,"DIA_Loa_Hello_Pearl_01_03");	//Глубина его цвета порой настолько завораживает, что от него просто невозможно оторвать глаз.
	AI_Output(self,other,"DIA_Loa_Hello_Pearl_01_04");	//Эх... Когда-то у меня была одна такая жемчужина. Я хранила ее долгие годы и всегда носила с собой как талисман, приносящий удачу.
	AI_Output(self,other,"DIA_Loa_Hello_Pearl_01_05");	//Но, к сожалению, стражники короля забрали ее у меня, когда отправляли в Долину Рудников.
	AI_Output(other,self,"DIA_Loa_Hello_Pearl_01_06");	//А что тебе мешает найти себе другую?
	AI_Output(self,other,"DIA_Loa_Hello_Pearl_01_07");	//Это не так просто! Черный жемчуг очень редкий, и найти одну такую жемчужину уже считается огромной удачей.
	AI_Output(self,other,"DIA_Loa_Hello_Pearl_01_08");	//А уж чтобы набрать их на целое ожерелье...
	LoaCase_02 = TRUE;
	B_LogEntry(TOPIC_LoaRomance,"Лоа всегда мечтала об ожерелье из черного жемчуга. Думаю, мне стоит попробовать найти такое, если я хочу завоевать ее внимание.");
	Info_ClearChoices(DIA_Loa_Hello);

	if((LoaCase_01 == TRUE) && (LoaCase_02 == TRUE) && (LoaCase_03 == TRUE))
	{
		Info_AddChoice(DIA_Loa_HowGetYou,"Мне пора.",DIA_Loa_Hello_Buy);	
	};
};

func void DIA_Loa_Hello_Stihi()
{
	AI_Output(other,self,"DIA_Loa_Hello_Stihi_01_01");	//Сомневаюсь, что среди наемников найдутся поэты.
	AI_Output(self,other,"DIA_Loa_Hello_Stihi_01_02");	//Тут ты прав! Для этого нужно быть довольно утонченной натурой и обладать острым умом.
	AI_Output(self,other,"DIA_Loa_Hello_Stihi_01_03");	//А эти бездари даже пары слов связать не могут, особенно после того, как переберут со шнапсом.
	AI_Output(self,other,"DIA_Loa_Hello_Stihi_01_04");	//Хотя чего еще взять с бывших каторжников.
	LoaCase_03 = TRUE;
	B_LogEntry(TOPIC_LoaRomance,"Лоа любит красивые стихи. Мне стоит поискать нечто подобное, если я хочу произвести на нее впечатление.");
	Info_ClearChoices(DIA_Loa_Hello);

	if((LoaCase_01 == TRUE) && (LoaCase_02 == TRUE) && (LoaCase_03 == TRUE))
	{
		Info_AddChoice(DIA_Loa_HowGetYou,"Мне пора.",DIA_Loa_Hello_Buy);	
	};
};

func void DIA_Loa_Hello_Buy()
{
	AI_Output(other,self,"DIA_Loa_Hello_Buy_01_01");	//Мне пора.
	AI_Output(self,other,"DIA_Loa_Hello_Buy_01_02");	//До встречи.
	AI_StopProcessInfos(self);
};

instance DIA_Loa_Give_Flower(C_Info)
{
	npc = SLD_10920_Loa;
	nr = 2;
	condition = DIA_Loa_Give_Flower_Condition;
	information = DIA_Loa_Give_Flower_Info;
	permanent = FALSE;
	description = "Взгляни, что я тебе принес.";
};

func int DIA_Loa_Give_Flower_Condition()
{
	if((MIS_LoaRomance == LOG_Running) && (LoaCase_01 == TRUE) && (LoaCase_01_Done == FALSE) && (Npc_HasItems(other,ItPl_ExBlueMalve) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Loa_Give_Flower_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Loa_Give_Flower_01_01");	//Взгляни, что я тебе принес.
	B_GiveInvItems(other,self,ItPl_ExBlueMalve,1);
	Npc_RemoveInvItems(self,ItPl_ExBlueMalve,1);
	AI_Output(self,other,"DIA_Loa_Give_Flower_01_02");	//Невероятно! Где тебе удалось их найти?
	AI_Output(other,self,"DIA_Loa_Give_Flower_01_03");	//Долго рассказывать. Надеюсь, что они тебя хоть как-то порадуют.
	AI_Output(self,other,"DIA_Loa_Give_Flower_01_04");	//Не то слово! Ты просто не представляешь, насколько я счастлива вновь увидеть эти цветы и ощутить их аромат.
	AI_Output(self,other,"DIA_Loa_Give_Flower_01_05");	//Хотя, по правде говоря, я не ожидала от тебя такого.
	AI_Output(self,other,"DIA_Loa_Give_Flower_01_06");	//Вот - хочу, чтоб ты взял это золото. Здесь его все равно не на что потратить.
	LoaCase_01_Done = TRUE;
	B_LogEntry(TOPIC_LoaRomance,"Я принес Лоа голубую мальву. Она была просто в неописуемом восторге!");
	Info_ClearChoices(DIA_Loa_Give_Flower);
	Info_AddChoice(DIA_Loa_Give_Flower,"Не стоит!",DIA_Loa_Give_Flower_No);
	Info_AddChoice(DIA_Loa_Give_Flower,"Благодарю!",DIA_Loa_Give_Flower_Yes);
};

func void DIA_Loa_Give_Flower_No()
{
	AI_Output(other,self,"DIA_Loa_Give_Flower_No_01_01");	//Не стоит! Простых слов вполне достаточно.
	LoaBonus_01 = TRUE;
	Info_ClearChoices(DIA_Loa_Give_Flower);
};

func void DIA_Loa_Give_Flower_Yes()
{
	AI_Output(other,self,"DIA_Loa_Give_Flower_Yes_01_01");	//Благодарю! Лишнее золото никогда не помешает.
	B_GiveInvItems(self,other,ItMi_Gold,300);
	LoaBonus_01 = TRUE;
	LoaAntiBonus = TRUE;
	Info_ClearChoices(DIA_Loa_Give_Flower);
};

instance DIA_Loa_Give_Pearl(C_Info)
{
	npc = SLD_10920_Loa;
	nr = 2;
	condition = DIA_Loa_Give_Pearl_Condition;
	information = DIA_Loa_Give_Pearl_Info;
	permanent = FALSE;
	description = "Вот, примерь это ожерелье.";
};

func int DIA_Loa_Give_Pearl_Condition()
{
	if((MIS_LoaRomance == LOG_Running) && (LoaCase_02 == TRUE) && (LoaCase_02_Done == FALSE) && (Npc_HasItems(other,ItMi_BlackPearlNeckle) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Loa_Give_Pearl_Info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Loa_Give_Pearl_01_01");	//Вот, примерь это ожерелье.
	B_GiveInvItems(other,self,ItMi_BlackPearlNeckle,1);
	Npc_RemoveInvItems(self,ItMi_BlackPearlNeckle,1);
	AI_Output(self,other,"DIA_Loa_Give_Pearl_01_02");	//Но... но как тебе удалось собрать столько жемчуга?
	AI_Output(other,self,"DIA_Loa_Give_Pearl_01_03");	//Признаюсь, это было нелегко. Пришлось побегать по всему Хоринису и не только.
	AI_Output(self,other,"DIA_Loa_Give_Pearl_01_04");	//А сами жемчужины... неужели они действительно все настоящие?
	AI_Output(other,self,"DIA_Loa_Give_Pearl_01_05");	//Конечно! Да сама взгляни. Смотри как они играют на свету.
	AI_Output(self,other,"DIA_Loa_Give_Pearl_01_06");	//Невероятно! Ты и вправду меня удивил. Никогда бы не подумала, что ты воспримешь мои слова всерьез.
	AI_Output(other,self,"DIA_Loa_Give_Pearl_01_07");	//Как видишь, именно так я и сделал.
	AI_Output(self,other,"DIA_Loa_Give_Pearl_01_08");	//Ну, что же... Тогда прими мою искреннюю благодарность за этот подарок! Он воистину прекрасен.
	AI_Output(self,other,"DIA_Loa_Give_Pearl_01_09");	//И вот это кольцо. В свое время оно мне досталось от отца, но теперь оно твое.
	LoaCase_02_Done = TRUE;
	B_LogEntry(TOPIC_LoaRomance,"Я принес Лоа ожерелье из черного жемчуга. Оно ей очень понравилось.");
	Info_ClearChoices(DIA_Loa_Give_Pearl);
	Info_AddChoice(DIA_Loa_Give_Pearl,"Я не могу его принять!",DIA_Loa_Give_Pearl_No);
	Info_AddChoice(DIA_Loa_Give_Pearl,"Это очень кстати.",DIA_Loa_Give_Pearl_Yes);
};

func void DIA_Loa_Give_Pearl_No()
{
	AI_Output(other,self,"DIA_Loa_Give_Pearl_No_01_01");	//Я не могу его принять! Уверен, что тебе самой будет жалко с ним расстаться.
	AI_Output(self,other,"DIA_Loa_Give_Pearl_No_01_02");	//Ты прав...(вздыхая) Оно мне дорого как память! Но мне просто больше нечем тебя отблагодарить.
	AI_Output(other,self,"DIA_Loa_Give_Pearl_No_01_03");	//Это и не обязательно. Так что лучше оставь его у себя.
	AI_Output(self,other,"DIA_Loa_Give_Pearl_No_01_04");	//Ну, хорошо. Будь по-твоему.
	LoaBonus_02 = TRUE;
	Info_ClearChoices(DIA_Loa_Give_Pearl);
};

func void DIA_Loa_Give_Pearl_Yes()
{
	AI_Output(other,self,"DIA_Loa_Give_Pearl_Yes_01_01");	//Это очень кстати. Благодарю!
	B_GiveInvItems(self,other,ItRi_Loa,1);
	AI_Output(self,other,"DIA_Loa_Give_Pearl_Yes_01_02");	//Не за что.
	LoaBonus_02 = TRUE;
	LoaAntiBonus = TRUE;
	Info_ClearChoices(DIA_Loa_Give_Pearl);
};

instance DIA_Loa_Give_Stihi(C_Info)
{
	npc = SLD_10920_Loa;
	nr = 2;
	condition = DIA_Loa_Give_Stihi_Condition;
	information = DIA_Loa_Give_Stihi_Info;
	permanent = FALSE;
	description = "Я по поводу стихов.";
};

func int DIA_Loa_Give_Stihi_Condition()
{
	if((MIS_LoaRomance == LOG_Running) && (LoaCase_03 == TRUE) && (LoaCase_03_Done == FALSE) && (Npc_HasItems(other,MYRTANAS_LYRIK) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Loa_Give_Stihi_Info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Loa_Give_Stihi_01_01");	//Я по поводу стихов.
	AI_Output(self,other,"DIA_Loa_Give_Stihi_01_02");	//Что, решил удивить меня своими поэтическими познаниями?
	AI_Output(other,self,"DIA_Loa_Give_Stihi_01_03");	//Нет, просто подумал, что тебе будет интересно взглянуть на это.
	B_GiveInvItems(other,self,MYRTANAS_LYRIK,1);
	Npc_RemoveInvItems(self,MYRTANAS_LYRIK,1);
	AI_Output(self,other,"DIA_Loa_Give_Stihi_01_04");	//(читая) Довольно интересная книга! Не столь красиво написано, но это куда лучше, чем слушать невыносимый бред пьяных наемников.
	AI_Output(other,self,"DIA_Loa_Give_Stihi_01_05");	//Можешь оставить ее себе.
	AI_Output(self,other,"DIA_Loa_Give_Stihi_01_06");	//Правда? Тогда, пожалуй, я воспользуюсь твоим предложением.
	AI_Output(self,other,"DIA_Loa_Give_Stihi_01_07");	//Она, безусловно, скрасит мои скучные вечера на этой ферме. Благодарю тебя!
	LoaCase_03_Done = TRUE;
	B_LogEntry(TOPIC_LoaRomance,"Я принес Лоа книгу со стихами. Кажется, ей она понравилась.");
	Info_ClearChoices(DIA_Loa_Give_Stihi);
	Info_AddChoice(DIA_Loa_Give_Stihi,"Наслаждайся!",DIA_Loa_Give_Stihi_No);
	Info_AddChoice(DIA_Loa_Give_Stihi,"А я думал, что мне причитается какая-нибудь награда.",DIA_Loa_Give_Stihi_Yes);
};

func void DIA_Loa_Give_Stihi_No()
{
	AI_Output(other,self,"DIA_Loa_Give_Stihi_No_01_01");	//Наслаждайся!
	AI_Output(self,other,"DIA_Loa_Give_Stihi_No_01_02");	//Спасибо.
	LoaBonus_03 = TRUE;
	Info_ClearChoices(DIA_Loa_Give_Stihi);
};

func void DIA_Loa_Give_Stihi_Yes()
{
	AI_Output(other,self,"DIA_Loa_Give_Stihi_Yes_01_01");	//А я думал, что мне причитается какая-нибудь награда.
	B_GiveInvItems(self,other,ItFo_Wine_Loa,1);
	AI_Output(self,other,"DIA_Loa_Give_Stihi_Yes_01_02");	//Конечно! Вот, возьми эту бутылку вина.
	AI_Output(self,other,"DIA_Loa_Give_Stihi_Yes_01_03");	//Уверена, что вы с ней быстро найдете общий язык.
	AI_Output(other,self,"DIA_Loa_Give_Stihi_Yes_01_04");	//Можешь не сомневаться.
	LoaBonus_03 = TRUE;
	LoaAntiBonus = TRUE;
	Info_ClearChoices(DIA_Loa_Give_Stihi);
};

instance DIA_Loa_Give_Lover(C_Info)
{
	npc = SLD_10920_Loa;
	nr = 2;
	condition = DIA_Loa_Give_Lover_Condition;
	information = DIA_Loa_Give_Lover_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Loa_Give_Lover_Condition()
{
	if((LoaLover == TRUE) && (LoaLoverDay == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Loa_Give_Lover_Info()
{
	AI_Output(self,other,"DIA_Loa_Give_Lover_01_01");	//Постой! 
	AI_Output(other,self,"DIA_Loa_Give_Lover_01_02");	//Да, я слушаю.
	AI_Output(self,other,"DIA_Loa_Give_Lover_01_03");	//Знаешь, ты для меня так много сделал, а я до сих пор тебя так ничем и не отблагодарила.
	AI_Output(other,self,"DIA_Loa_Give_Lover_01_04");	//Это вовсе не обязательно.
	AI_Output(self,other,"DIA_Loa_Give_Lover_01_05");	//И все же... Знаешь, приходи завтра к полуночи на маяк, что неподалеку от города.
	AI_Output(other,self,"DIA_Loa_Give_Lover_01_06");	//Зачем?
	AI_Output(self,other,"DIA_Loa_Give_Lover_01_07");	//Скажем, я хочу тебе кое-что показать. Только не волнуйся! Тебе это наверняка понравится.
	AI_Output(other,self,"DIA_Loa_Give_Lover_01_08");	//Ладно, я подумаю над твоим предложением.
	AI_Output(self,other,"DIA_Loa_Give_Lover_01_09");	//Хорошо, только думай быстрее.
	LoaLoverDay = Wld_GetDay();
	AI_StopProcessInfos(self);
};

instance DIA_Loa_ComeLH(C_Info)
{
	npc = SLD_10920_Loa;
	nr = 2;
	condition = DIA_Loa_ComeLH_Condition;
	information = DIA_Loa_ComeLH_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Loa_ComeLH_Condition()
{
	if((MIS_LoaRomance == LOG_Success) && (LoaInLH == TRUE) && (Npc_IsInState(self,ZS_Talk) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Loa_ComeLH_Info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Loa_ComeLH_01_01");	//Я пришел, как ты и просила.
	AI_Output(self,other,"DIA_Loa_ComeLH_01_02");	//Вижу! И ты даже не опоздал...(улыбаясь)
	AI_Output(other,self,"DIA_Loa_ComeLH_01_03");	//Когда об этом просит такая девушка, как ты, я всегда стараюсь быть пунктуальным.
	AI_Output(self,other,"DIA_Loa_ComeLH_01_04");	//Не сомневаюсь. Хотя у меня были кое-какие сомнения на этот счет.
	AI_Output(other,self,"DIA_Loa_ComeLH_01_05");	//Приду я или нет?
	AI_Output(self,other,"DIA_Loa_ComeLH_01_06");	//Да. Но тогда ты бы многое потерял.
	AI_Output(other,self,"DIA_Loa_ComeLH_01_07");	//Хммм... Например?
	AI_Output(self,other,"DIA_Loa_ComeLH_01_08");	//Например... возможностью полюбоваться здешними красотами, которые открываются с высоты этого маяка. 
	AI_Output(self,other,"DIA_Loa_ComeLH_01_09");	//Кстати, как тебе вид отсюда?
	LoaTellInLH = TRUE;
	Info_ClearChoices(DIA_Loa_ComeLH);
	Info_AddChoice(DIA_Loa_ComeLH,"Это производит впечатление!",DIA_Loa_ComeLH_S_03);
	Info_AddChoice(DIA_Loa_ComeLH,"Уверен, тут есть виды и получше.",DIA_Loa_ComeLH_S_02);
	Info_AddChoice(DIA_Loa_ComeLH,"Может, лучше сразу перейдем к делу?",DIA_Loa_ComeLH_S_01);
};

func void DIA_Loa_ComeLH_S_03()
{
	AI_Output(other,self,"DIA_Loa_ComeLH_S_03_01");	//Это производит впечатление!
	AI_Output(self,other,"DIA_Loa_ComeLH_S_03_02");	//Ты прав...(вздыхая) Тут очень красиво! Я часто прихожу сюда. Смотрю на звезды, на море...
	AI_Output(self,other,"DIA_Loa_ComeLH_S_03_03");	//В них что-то есть такое, что наполняет твой внутренний мир чем-то особенным.
	AI_Output(self,other,"DIA_Loa_ComeLH_S_03_04");	//И в то же время успокаивает, помогая забыть о прошлых невзгодах.
	AI_Output(self,other,"DIA_Loa_ComeLH_S_03_05");	//А о чем ты думаешь?
	Info_ClearChoices(DIA_Loa_ComeLH);
	Info_AddChoice(DIA_Loa_ComeLH,"Примерно о том же, что и ты.",DIA_Loa_ComeLH_M_01);
	Info_AddChoice(DIA_Loa_ComeLH,"Ни о чем.",DIA_Loa_ComeLH_M_02);
	Info_AddChoice(DIA_Loa_ComeLH,"Извини, но у меня нет на это времени.",DIA_Loa_ComeLH_M_03);
};

func void DIA_Loa_ComeLH_S_02()
{
	AI_Output(other,self,"DIA_Loa_ComeLH_S_02_01");	//Уверен, тут есть виды и получше.
	AI_Output(self,other,"DIA_Loa_ComeLH_S_02_02");	//Ты это о чем?
	AI_Output(other,self,"DIA_Loa_ComeLH_S_02_03");	//О тебе! Твой вид на меня производит куда более приятное впечатление, чем все эти здешние красоты.
	AI_Output(self,other,"DIA_Loa_ComeLH_S_02_04");	//Это что, комплимент?
	AI_Output(other,self,"DIA_Loa_ComeLH_S_02_05");	//Почему бы и нет? В конце концов, у каждого свои представления о прекрасном!
	AI_Output(self,other,"DIA_Loa_ComeLH_S_02_06");	//И ты верно полагаешь, что после этого я конечно же брошусь к тебе на шею. 
	AI_Output(other,self,"DIA_Loa_ComeLH_S_02_07");	//Это хорошая идея.
	AI_Output(self,other,"DIA_Loa_ComeLH_S_02_08");	//О Иннос! Ты, как и все мужчины, всегда думаешь только об одном.
	AI_Output(self,other,"DIA_Loa_ComeLH_S_02_09");	//Интересно, у тебя когда-нибудь бывают другие мысли в голове?
	Info_ClearChoices(DIA_Loa_ComeLH);
	Info_AddChoice(DIA_Loa_ComeLH,"Обычно, их куда больше.",DIA_Loa_ComeLH_H_03);
	Info_AddChoice(DIA_Loa_ComeLH,"Само собой.",DIA_Loa_ComeLH_H_02);
	Info_AddChoice(DIA_Loa_ComeLH,"Сейчас у меня только одна мысль.",DIA_Loa_ComeLH_H_01);
};

func void DIA_Loa_ComeLH_S_01()
{
	AI_Output(other,self,"DIA_Loa_ComeLH_S_01_01");	//Может, лучше сразу перейдем к делу?
	AI_Output(self,other,"DIA_Loa_ComeLH_S_01_02");	//Ты это о чем?!
	AI_Output(other,self,"DIA_Loa_ComeLH_S_01_03");	//Уверен, ты позвала меня сюда не для того, чтобы видом с маяка полюбоваться.
	AI_Output(other,self,"DIA_Loa_ComeLH_S_01_04");	//Так что давай уже, раздевайся.
	AI_Output(self,other,"DIA_Loa_ComeLH_S_01_05");	//(возмущенно) Что?!
	AI_Output(other,self,"DIA_Loa_ComeLH_S_01_06");	//Что слышала! Или я не ясно выражаюсь?
	AI_ReadyMeleeWeapon(self);
	AI_Output(self,other,"DIA_Loa_ComeLH_S_01_07");	//Только попробуй тронуть меня пальцем, ублюдок!
	AI_Output(self,other,"DIA_Loa_ComeLH_S_01_08");	//Я уж подумала, что ты не такой конченый подонок, как остальные.
	AI_Output(self,other,"DIA_Loa_ComeLH_S_01_09");	//Но, видимо, я ошиблась!
	AI_Output(self,other,"DIA_Loa_ComeLH_S_01_10");	//Так что проваливай отсюда, пока твоя рожа еще цела!
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	LoaPissOff[1] = TRUE;
};

func void DIA_Loa_ComeLH_M_01()
{
	AI_Output(other,self,"DIA_Loa_ComeLH_M_01_01");	//Примерно о том же, что и ты.
	AI_Output(self,other,"DIA_Loa_ComeLH_M_01_02");	//Правда?
	AI_Output(other,self,"DIA_Loa_ComeLH_M_01_03");	//Знаешь, иногда так от всего устаешь, что хочется просто побыть в тишине и посмотреть на закат уходящего солнца.
	AI_Output(other,self,"DIA_Loa_ComeLH_M_01_04");	//В такие моменты понимаешь, что жизнь состоит не только из постоянных сражений и борьбы за выживание.
	AI_Output(other,self,"DIA_Loa_ComeLH_M_01_05");	//В ней есть и много такого, что вселяет в тебя веру и позволяет увидеть куда больше, чем кажется на первый взгляд.
	AI_Output(self,other,"DIA_Loa_ComeLH_M_01_06");	//Никогда бы не подумала, что способен на такие мысли!
	AI_Output(other,self,"DIA_Loa_ComeLH_M_01_07");	//Это почему?
	AI_Output(self,other,"DIA_Loa_ComeLH_M_01_08");	//Потому что с виду ты похож больше на...
	AI_Output(other,self,"DIA_Loa_ComeLH_M_01_09");	//...неотесанного чурбана. Знаю.
	AI_Output(other,self,"DIA_Loa_ComeLH_M_01_10");	//Но иногда приятно осознавать, что кто-то все-таки разглядел в тебе нечто большее.
	AI_Output(self,other,"DIA_Loa_ComeLH_M_01_11");	//Как я тебя понимаю...
	AI_Output(self,other,"DIA_Loa_ComeLH_M_01_12");	//Знаешь, я редко встречала людей, вроде тебя.
	AI_Output(self,other,"DIA_Loa_ComeLH_M_01_13");	//Большинство из них интересовало во мне только одно. И при этом им было абсолютно плевать, что я сама чувствую.
	Info_ClearChoices(DIA_Loa_ComeLH);
	Info_AddChoice(DIA_Loa_ComeLH,"Я не из их числа.",DIA_Loa_ComeLH_F_02);
	Info_AddChoice(DIA_Loa_ComeLH,"Я их понимаю.",DIA_Loa_ComeLH_F_01);
};

func void DIA_Loa_ComeLH_M_02()
{
	AI_Output(other,self,"DIA_Loa_ComeLH_M_02_01");	//Ни о чем.
	AI_Output(other,self,"DIA_Loa_ComeLH_M_02_03");	//Когда я вижу тебя рядом с собой, то ни о чем другом думать не могу.
	AI_Output(self,other,"DIA_Loa_ComeLH_M_02_04");	//О чем это ты?
	AI_Output(other,self,"DIA_Loa_ComeLH_M_02_05");	//О том, что пора заканчивать весь этот спектакль.
	AI_Output(other,self,"DIA_Loa_ComeLH_M_02_06");	//Уверен, ты позвала меня сюда не для того, чтобы видом с маяка полюбоваться.
	AI_Output(self,other,"DIA_Loa_ComeLH_M_02_07");	//Ах, ну да... конечно! Что еще я могла ожидать от тебя в подобной ситуации?
	AI_Output(self,other,"DIA_Loa_ComeLH_M_02_08");	//Но боюсь, мне нечего тебе предложить.
	AI_Output(other,self,"DIA_Loa_ComeLH_M_02_09");	//Ты в этом уверена?
	AI_Output(self,other,"DIA_Loa_ComeLH_M_02_10");	//Можешь не сомневаться. Так что лучше ступай в бордель!
	AI_Output(self,other,"DIA_Loa_ComeLH_M_02_11");	//Там тебя ждут виды ненамного хуже, чем здесь.
	AI_Output(self,other,"DIA_Loa_ComeLH_M_02_12");	//А мне уже пора возвращаться. Прощай!
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};

func void DIA_Loa_ComeLH_M_03()
{
	AI_Output(other,self,"DIA_Loa_ComeLH_M_03_01");	//Извини, но у меня нет на это времени.
	AI_Output(self,other,"DIA_Loa_ComeLH_M_03_02");	//О чем это ты?!
	AI_Output(other,self,"DIA_Loa_ComeLH_M_03_03");	//Уверен, ты позвала меня сюда не для того, чтобы видом с маяка полюбоваться.
	AI_Output(other,self,"DIA_Loa_ComeLH_M_03_04");	//Так что давай наконец займемся делом.
	AI_Output(self,other,"DIA_Loa_ComeLH_M_03_05");	//Никаким 'делом' я с тобой заниматься не буду!
	AI_Output(self,other,"DIA_Loa_ComeLH_M_03_06");	//А если попробуешь хоть пальцем меня тронуть, - схлопочешь по своей наглой роже.
	AI_Output(self,other,"DIA_Loa_ComeLH_M_03_07");	//Все! Разговор окончен!
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	LoaPissOff[1] = TRUE;
};

func void DIA_Loa_ComeLH_H_03()
{
	AI_Output(other,self,"DIA_Loa_ComeLH_H_03_01");	//Обычно, их куда больше.
	AI_Output(other,self,"DIA_Loa_ComeLH_H_03_02");	//Но если говорить начистоту, то...
	AI_Output(self,other,"DIA_Loa_ComeLH_H_03_03");	//Что?
	AI_Output(other,self,"DIA_Loa_ComeLH_H_03_04");	//Просто ты мне очень нравишься!
	AI_Output(other,self,"DIA_Loa_ComeLH_H_03_05");	//Правда, это не значит, что я на что-то рассчитываю. Ведь скорее всего, ты пошлешь меня куда подальше!
	AI_Output(other,self,"DIA_Loa_ComeLH_H_03_06");	//Но лучше я скажу это сейчас, чем буду потом жалеть об этом всю оставшуюся жизнь.
	AI_Output(other,self,"DIA_Loa_ComeLH_H_03_07");	//Безусловно, мне и самому порой бывает приятно побыть в тишине и поразмышлять, глядя на закат уходящего солнца.
	AI_Output(other,self,"DIA_Loa_ComeLH_H_03_08");	//В такие моменты понимаешь, что жизнь состоит не только из постоянных сражений и борьбы за выживание.
	AI_Output(other,self,"DIA_Loa_ComeLH_H_03_09");	//В нем есть и много такого, что вселяет в тебя веру и позволяет увидеть куда больше, чем кажется на первый взгляд.
	AI_Output(other,self,"DIA_Loa_ComeLH_H_03_10");	//Но в этот раз моя голова занята исключительно мыслями о тебе.
	AI_Output(other,self,"DIA_Loa_ComeLH_H_03_11");	//Так что извини, если не оправдал твоих надежд. Но лучше уж правда, чем сладкая ложь.
	AI_Output(self,other,"DIA_Loa_ComeLH_H_03_12");	//Хммм...(вглядываясь) Звучит как признание в любви.
	AI_Output(other,self,"DIA_Loa_ComeLH_H_03_13");	//Что-то вроде того.
	AI_Output(self,other,"DIA_Loa_ComeLH_H_03_14");	//Знаешь, ты мне тоже очень нравишься.
	AI_Output(self,other,"DIA_Loa_ComeLH_H_03_15");	//Но думаю, это еще не повод доводить дело до крайности.
	AI_Output(self,other,"DIA_Loa_ComeLH_H_03_16");	//Так что, пожалуй, лучше закончим этот разговор. Возможно, когда-нибудь у нас еще будет возможность вернуться к нему.
	AI_Output(self,other,"DIA_Loa_ComeLH_H_03_17");	//Но не сейчас...
	AI_Output(self,other,"DIA_Loa_ComeLH_H_03_18");	//Уже светает... мне пора возвращаться. Удачи!
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};

func void DIA_Loa_ComeLH_H_02()
{
	AI_Output(other,self,"DIA_Loa_ComeLH_H_02_01");	//Само собой.
	AI_Output(self,other,"DIA_Loa_ComeLH_H_02_02");	//Правда, сводятся они всегда к одному. Я угадала?
	AI_Output(other,self,"DIA_Loa_ComeLH_H_02_03");	//Почти.
	AI_Output(self,other,"DIA_Loa_ComeLH_H_02_04");	//Это и не удивительно... Ты только взгляни на себя!
	AI_Output(self,other,"DIA_Loa_ComeLH_H_02_05");	//Так напрягся, что сейчас сам из штанов выпрыгнешь.
	AI_Output(self,other,"DIA_Loa_ComeLH_H_02_06");	//Знаешь что, ты мне нравишься. Но, думаю, это еще не повод доводить дело до крайности.
	AI_Output(self,other,"DIA_Loa_ComeLH_H_02_07");	//Так что лучше успокойся и ступай. Думаю, когда-нибудь у нас еще будет возможность вернуться к этому разговору.
	AI_Output(self,other,"DIA_Loa_ComeLH_H_02_08");	//А мне уже пора возвращаться... Прощай!
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};

func void DIA_Loa_ComeLH_H_01()
{
	AI_Output(other,self,"DIA_Loa_ComeLH_H_01_01");	//Сейчас у меня только одна мысль.
	AI_Output(self,other,"DIA_Loa_ComeLH_H_01_02");	//Можешь даже не говорить, какая!
	AI_Output(self,other,"DIA_Loa_ComeLH_H_01_03");	//Вот только вряд ли ей суждено сбыться. По крайней мере, сегодня!
	AI_Output(self,other,"DIA_Loa_ComeLH_H_01_04");	//Так что лучше ступай откуда пришел.
	AI_Output(self,other,"DIA_Loa_ComeLH_H_01_05");	//Да и мне уже пора возвращаться... Прощай!
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};

func void DIA_Loa_ComeLH_F_01()
{
	AI_Output(other,self,"DIA_Loa_ComeLH_F_01_01");	//Я их понимаю.
	AI_Output(self,other,"DIA_Loa_ComeLH_F_01_02");	//Что ты хочешь этим сказать?
	AI_Output(other,self,"DIA_Loa_ComeLH_F_01_03");	//Мне ты тоже очень нравишься.
	AI_Output(other,self,"DIA_Loa_ComeLH_F_01_04");	//Правда, это не значит, что я на что-то рассчитываю. Ведь скорее всего, ты пошлешь меня куда подальше!
	AI_Output(other,self,"DIA_Loa_ComeLH_F_01_05");	//Но лучше я скажу это сейчас, чем буду потом жалеть об этом всю оставшуюся жизнь.
	AI_Output(other,self,"DIA_Loa_ComeLH_F_01_06");	//Безусловно, мне и самому порой бывает приятно побыть в тишине и поразмышлять, глядя на закат уходящего солнца.
	AI_Output(other,self,"DIA_Loa_ComeLH_F_01_07");	//В такие моменты понимаешь, что жизнь состоит не только из постоянных сражений и борьбы за выживание.
	AI_Output(other,self,"DIA_Loa_ComeLH_F_01_08");	//В нем есть и много такого, что вселяет в тебя веру и позволяет увидеть куда больше, чем кажется на первый взгляд.
	AI_Output(other,self,"DIA_Loa_ComeLH_F_01_09");	//Но в этот раз моя голова занята исключительно мыслями о тебе.
	AI_Output(other,self,"DIA_Loa_ComeLH_F_01_10");	//Так что извини, если не оправдал твоих надежд. Но лучше уж правда, чем сладкая ложь.
	AI_Output(self,other,"DIA_Loa_ComeLH_F_01_11");	//Хммм...(вглядываясь) Звучит как признание в любви.
	AI_Output(other,self,"DIA_Loa_ComeLH_F_01_12");	//Похоже, это оно и есть.
	AI_Output(self,other,"DIA_Loa_ComeLH_F_01_13");	//Знаешь, ты мне тоже очень нравишься.
	AI_Output(self,other,"DIA_Loa_ComeLH_F_01_14");	//Но, думаю, это еще не повод доводить дело до крайности.
	AI_Output(self,other,"DIA_Loa_ComeLH_F_01_15");	//Так что, пожалуй, лучше закончим этот разговор. Думаю, когда-нибудь у нас еще будет возможность вернуться к нему.
	AI_Output(self,other,"DIA_Loa_ComeLH_F_01_16");	//Но не сейчас... Тем более уже светает.
	AI_Output(self,other,"DIA_Loa_ComeLH_F_01_17");	//И мне пора возвращаться! Прощай.

	if(RhetorikSkillValue[1] < 100)
	{
		RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
		AI_Print("Риторика + 1");
	};

	CanSayLoaStay = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"PreLoveScene");
};

func void DIA_Loa_ComeLH_F_02()
{
	AI_Output(other,self,"DIA_Loa_ComeLH_F_02_01");	//Я не из их числа.
	AI_Output(self,other,"DIA_Loa_ComeLH_F_02_02");	//Я это уже поняла.
	AI_Output(self,other,"DIA_Loa_ComeLH_F_02_03");	//Ладно, уже светает. Пора возвращаться! Удачи.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};

instance DIA_Loa_PissOff(C_Info)
{
	npc = SLD_10920_Loa;
	nr = 2;
	condition = DIA_Loa_PissOff_Condition;
	information = DIA_Loa_PissOff_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Loa_PissOff_Condition()
{
	if((LoaPissOff[1] == TRUE) && (Npc_IsInState(self,ZS_Talk) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Loa_PissOff_Info()
{
	B_Say(self,other,"$HandsOff");
	AI_StopProcessInfos(self);
};

instance DIA_Loa_LoveScene(C_Info)
{
	npc = SLD_10920_Loa;
	nr = 2;
	condition = DIA_Loa_LoveScene_Condition;
	information = DIA_Loa_LoveScene_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Loa_LoveScene_Condition()
{
	if((CanSayLoaStay == TRUE) && (LoaLoveScene == TRUE) && (LoaLoveSceneNoBonus == FALSE) && (LoaLoveSceneFailed == FALSE) && (Npc_GetDistToWP(self,"NW_LIGHTHOUSE_IN_LOA_LOVE_01") <= 1000))
	{
		return TRUE;
	};
};

func void DIA_Loa_LoveScene_Info()
{
	AI_Output(self,other,"DIA_Loa_LoveScene_Do_01_01");	//Теперь мне пора...
	AI_Output(self,other,"DIA_Loa_LoveScene_Do_01_02");	//Я никогда не забуду, что ты для меня сделал и того, что у нас было.
	Info_ClearChoices(DIA_Loa_LoveScene);
	Info_AddChoice(DIA_Loa_LoveScene,"И я...",DIA_Loa_LoveScene_Done);
};

func void DIA_Loa_LoveScene_Done()
{
	AI_Output(other,self,"DIA_Loa_LoveScene_Done_01_01");	//И я...не забуду.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");

	if(LoveBonus == FALSE)
	{
		Snd_Play("LevelUp");
		hero.lp = hero.lp + 10;
		AI_NoticePrint(3000,4098,NAME_Addon_LoveBonus);
		LoveBonus = TRUE;
		LoveBonusDay = Wld_GetDay();

	};
};

//-------------------------------------------------Лоа эпик квест---------------------------------------------

instance DIA_Loa_EpicQuest(C_Info)
{
	npc = SLD_10920_Loa;
	nr = 2;
	condition = DIA_Loa_EpicQuest_Condition;
	information = DIA_Loa_EpicQuest_Info;
	permanent = FALSE;
	description = "Ты в порядке?";
};

func int DIA_Loa_EpicQuest_Condition()
{
	var int DayNow;

	DayNow = Wld_GetDay();

	if((LoveBonus == TRUE) && (LoveBonusDay < DayNow))
	{
		return TRUE;
	};
};

func void DIA_Loa_EpicQuest_Info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Loa_EpicQuest_01_01");	//Ты в порядке?
	AI_Output(self,other,"DIA_Loa_EpicQuest_01_02");	//Да. А почему ты спрашиваешь?
	AI_Output(other,self,"DIA_Loa_EpicQuest_01_03");	//Я... я просто беспокоюсь за тебя.
	AI_Output(other,self,"DIA_Loa_EpicQuest_01_04");	//Знаешь, после той встречи на маяке, я чувствую некоторую отвественность за твою судьбу.
	AI_Output(self,other,"DIA_Loa_EpicQuest_01_05");	//Это приятно слышать. Но мне сейчас ничто не угрожает, если ты об этом.
	AI_Output(other,self,"DIA_Loa_EpicQuest_01_06");	//Надеюсь. Кстати, а как ты попала к наемникам?
	AI_Output(self,other,"DIA_Loa_EpicQuest_01_07");	//Это долгая история. 
	AI_Output(other,self,"DIA_Loa_EpicQuest_01_08");	//Ты бы могла мне ее рассказать. А то я так мало знаю о тебе самой.
	AI_Output(self,other,"DIA_Loa_EpicQuest_01_09");	//Я не слишком люблю это вспоминать. Но тебе... так уж и быть, расскажу.
	AI_Output(self,other,"DIA_Loa_EpicQuest_01_10");	//В общем, когда меня выбросило на берег Хориниса, в Долине Рудников, я была тяжело ранена.
	AI_Output(self,other,"DIA_Loa_EpicQuest_01_11");	//Арбалетный болт, выпущеный королевским приставом, пробил мой правый бок почти насквозь.
	AI_Output(self,other,"DIA_Loa_EpicQuest_01_12");	//Я сильно истекала кровью и думала, что это конец. 
	AI_Output(self,other,"DIA_Loa_EpicQuest_01_13");	//Но к счатью для меня неподалеку проходил небольшой отряд наемников.
	AI_Output(self,other,"DIA_Loa_EpicQuest_01_14");	//Полагаю, они только что ограбили очередной караван людей Гомеза и возвращались в Новый лагерь.
	AI_Output(self,other,"DIA_Loa_EpicQuest_01_15");	//Они подобрали меня и увезли к себе. Собственно там я и жила, до тех пор, пока не рухнул барьер. 
	AI_Output(self,other,"DIA_Loa_EpicQuest_01_16");	//А после, Ли и большинство его парней пришли сюда и стали работать на Онара. Ну и я вместе с ними.
	AI_Output(self,other,"DIA_Loa_EpicQuest_01_17");	//(улыбаясь) Вот такая вот история.
	LoaEpicStory = TRUE;
};

instance DIA_Loa_EpicQuest_Next(C_Info)
{
	npc = SLD_10920_Loa;
	nr = 2;
	condition = DIA_Loa_EpicQuest_Next_Condition;
	information = DIA_Loa_EpicQuest_Next_Info;
	permanent = FALSE;
	description = "Надеюсь, никто из них тебя там не обижал?";
};

func int DIA_Loa_EpicQuest_Next_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Loa_EpicQuest) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Loa_EpicQuest_Next_Info()
{
	AI_Output(other,self,"DIA_Loa_EpicQuest_Next_01_01");	//Надеюсь, никто из них тебя там не обижал?
	AI_Output(self,other,"DIA_Loa_EpicQuest_Next_01_02");	//Нет, ничего такого.
	AI_Output(self,other,"DIA_Loa_EpicQuest_Next_01_03");	//К тому же, Корд с Торлофом сразу предупредили - что тот, кто хотя бы пальцем меня тронет, будет иметь дело с ними.
	AI_Output(self,other,"DIA_Loa_EpicQuest_Next_01_04");	//Сам понимаешь, после таких слов желающих меня трогать особо не было.
	AI_Output(self,other,"DIA_Loa_EpicQuest_Next_01_05");	//Да, я и сама, если что, могу за себя постоять. И ты об этом прекрасно знаешь.
	AI_Output(other,self,"DIA_Loa_EpicQuest_Next_01_06");	//Забудешь тут! Ты каждый раз мне об этом напоминаешь.
	AI_Output(self,other,"DIA_Loa_EpicQuest_Next_01_07");	//Не сердись... Я не со зла.
};

instance DIA_Loa_EpicQuest_Judge(C_Info)
{
	npc = SLD_10920_Loa;
	nr = 2;
	condition = DIA_Loa_EpicQuest_Judge_Condition;
	information = DIA_Loa_EpicQuest_Judge_Info;
	permanent = FALSE;
	description = "Так ты сбежала от королевских приставов?";
};

func int DIA_Loa_EpicQuest_Judge_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Loa_EpicQuest) == TRUE) && (LoaEpicStory == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Loa_EpicQuest_Judge_Info()
{
	AI_Output(other,self,"DIA_Loa_EpicQuest_Judge_01_01");	//Так ты сбежала от королевских приставов?
	AI_Output(self,other,"DIA_Loa_EpicQuest_Judge_01_02");	//От них и от судьи, который зачитывал мне приговор.
	AI_Output(self,other,"DIA_Loa_EpicQuest_Judge_01_03");	//Я знала, что это был мой последний шанс на спасение. Так что воспользовалась им без раздумия.
	AI_Output(other,self,"DIA_Loa_EpicQuest_Judge_01_04");	//И в чем заключалось твоя вина? Ты что-то украла или быть может убила кого-то?
	AI_Output(self,other,"DIA_Loa_EpicQuest_Judge_01_05");	//Ни то и ни другое. Хотя я бы с большим удовольствием поквиталась с одним типом.
	AI_Output(self,other,"DIA_Loa_EpicQuest_Judge_01_06");	//Но к сожалению, он ускользнул от меня, а я очутилась в руках королевского правосудия.
	AI_Output(other,self,"DIA_Loa_EpicQuest_Judge_01_07");	//И что это был за тип?
	AI_Output(self,other,"DIA_Loa_EpicQuest_Judge_01_08");	//Мне кажется ты задаешь слишком много вопросов. Какое тебе вообще до этого дело?
	AI_Output(other,self,"DIA_Loa_EpicQuest_Judge_01_09");	//Возможно, я бы смог помочь тебе в этом деле.
	AI_Output(self,other,"DIA_Loa_EpicQuest_Judge_01_10");	//Помочь? В чем? Слушай, это случилось так давно и я бы не хотела к этому возвращаться.
	AI_Output(other,self,"DIA_Loa_EpicQuest_Judge_01_11");	//Ладно, как скажешь.
	MIS_LoaSecret = LOG_Running;
	Log_CreateTopic(TOPIC_LoaSecret,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LoaSecret,LOG_Running);
	B_LogEntry(TOPIC_LoaSecret,"Кажется, случайно, я наступил Лоа на больную мозоль, затронув эту тему с ее побегом от королевских приставов. По всей видимости, она не очень хочет об этом вспоминать. Но судя по ее лицу, ее постоянно что-то гложет. Просто так она не станет со мной говорить об этом. Думаю, мне стоит придумать что-то особенное, чтобы у нее у самой возникло желание все мне рассказать.");
};

instance DIA_Loa_EpicQuest_Party(C_Info)
{
	npc = SLD_10920_Loa;
	nr = 2;
	condition = DIA_Loa_EpicQuest_Party_Condition;
	information = DIA_Loa_EpicQuest_Party_Info;
	permanent = FALSE;
	description = "А почему бы нам не организовать что-нибудь вроде пикника?";
};

func int DIA_Loa_EpicQuest_Party_Condition()
{
	if((MIS_LoaSecret == LOG_Running) && (RhetorikSkillValue[1] >= 70))
	{
		return TRUE;
	};
};

func void DIA_Loa_EpicQuest_Party_Info()
{
	AI_Output(other,self,"DIA_Loa_EpicQuest_Party_01_01");	//А почему бы нам не организовать что-нибудь вроде пикника?
	AI_Output(other,self,"DIA_Loa_EpicQuest_Party_01_02");	//Красивая природа, вкусная еда, отличное вино - что скажешь?
	AI_Output(self,other,"DIA_Loa_EpicQuest_Party_01_03");	//Хммм... Звучит заманчиво! А сюрпризы будут? 
	AI_Output(other,self,"DIA_Loa_EpicQuest_Party_01_04");	//Конечно!
	AI_Output(self,other,"DIA_Loa_EpicQuest_Party_01_05");	//(игриво) Тогда, я за.
	AI_Output(other,self,"DIA_Loa_EpicQuest_Party_01_06");	//Ну раз так, то тогда я пожалуй займусь этим.
	AI_Output(self,other,"DIA_Loa_EpicQuest_Party_01_07");	//Буду ждать!
	MakeLoaParty = TRUE;
	B_LogEntry(TOPIC_LoaSecret,"Я предложил Лоа организовать нечто вроде пикника и она согласилась. Теперь надо найти подходящее место для нашего отдыха, немного вкусной еды и пару бутылок дорогого вина. Возможно немного расслабившись, она будет более открытой в разговоре.");
	AI_StopProcessInfos(self);
};

instance DIA_Loa_EpicQuest_Party_Go(C_Info)
{
	npc = SLD_10920_Loa;
	nr = 2;
	condition = DIA_Loa_EpicQuest_Party_Go_Condition;
	information = DIA_Loa_EpicQuest_Party_Go_Info;
	permanent = FALSE;
	description = "Все готово!";
};

func int DIA_Loa_EpicQuest_Party_Go_Condition()
{
	if((MIS_LoaSecret == LOG_Running) && (MakeLoaParty == TRUE) && (LoaPartyWine == TRUE) && (LoaPartyFood == TRUE) && (Npc_HasItems(other,ItMi_LoaWine) >= 2) && (Npc_HasItems(other,ItMi_LoaPartyFood) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Loa_EpicQuest_Party_Go_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Loa_EpicQuest_Party_Go_01_01");	//Все готово! Вкусная еда, изысканое вино... Осталось только найти подходящее место. 
	AI_Output(self,other,"DIA_Loa_EpicQuest_Party_Go_01_02");	//Кажется, я знаю такое. Оно как раз находится в лесу, за этой фермой. Ступай за мной!
	LoaGoParty = TRUE;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	B_LogEntry(TOPIC_LoaSecret,"Я сообщил Лоа, что приготовил все для пикника. Нам осталось только найти подходящее место. На этот счет у Лоа появилась одна мысль и она предложила прогуляться в лес, за ферму.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Guide");
};

instance DIA_Loa_PartyInPlace(C_Info)
{
	npc = SLD_10920_Loa;
	nr = 2;
	condition = DIA_Loa_PartyInPlace_Condition;
	information = DIA_Loa_PartyInPlace_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Loa_PartyInPlace_Condition()
{
	if((MIS_LoaSecret == LOG_Running) && (Npc_GetDistToWP(self,"NW_DARKFOREST_IN_01_56") <= 500) && (LoaGoParty == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Loa_PartyInPlace_Info()
{
	AI_Output(self,other,"DIA_Loa_PartyInPlace_01_01");	//Вот мы и на месте. И как тебе тут?
	AI_Output(other,self,"DIA_Loa_PartyInPlace_01_02");	//Довольно мило.
	AI_Output(self,other,"DIA_Loa_PartyInPlace_01_03");	//Я знала, что тебе понравится. Тогда здесь и остановимся.
	AI_Output(self,other,"DIA_Loa_PartyInPlace_01_04");	//Ну...(улыбаясь) Что там насчет изызсканого вина, про которое ты говорил?
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	B_LogEntry(TOPIC_LoaSecret,"Мы добрались до места, которое нашла Лоа. Думаю, теперь можно немного расслабится...");
	Info_ClearChoices(DIA_Loa_PartyInPlace);
	Info_AddChoice(DIA_Loa_PartyInPlace,"Сейчас все будет...",DIA_Loa_PartyInPlace_Done);
};

func void DIA_Loa_PartyInPlace_Done()
{
	Wld_SendTrigger("EVT_LOAPARTY_CAM");
	AI_SetWalkMode(self,NPC_WALK);
	AI_SetWalkMode(other,NPC_WALK);
	AI_GotoWP(self,"NW_DARKFOREST_IN_LOA_PARTY");
	AI_GotoWP(other,"NW_DARKFOREST_IN_HERO_PARTY");
	B_TurnToNpc(self,other);
	B_TurnToNpc(other,self);
	AI_PlayAni(self,"T_STAND_2_SIT");
	AI_PlayAni(other,"T_STAND_2_SIT");
	Npc_RemoveInvItems(other,ItMi_LoaWine,Npc_HasItems(other,ItMi_LoaWine));
	Npc_RemoveInvItems(other,ItMi_LoaPartyFood,Npc_HasItems(other,ItMi_LoaPartyFood));
	Info_ClearChoices(DIA_Loa_PartyInPlace);
	Info_AddChoice(DIA_Loa_PartyInPlace,"...(продолжить)",DIA_Loa_PartyInPlace_Exit);
};

func void DIA_Loa_PartyInPlace_Exit()
{
	Wld_SendTrigger("EVT_PARTYPLACE_01");
	PlayVideo("RET2_BlackScreen.bik");
	LoaOnParty = TRUE;
	AI_NoticePrint(500,7000,"Два часа спустя...");
	AI_Output(self,other,"DIA_Loa_PartyTalk_01_00");	//Чего ты встал? Куда то уходишь?
	AI_Output(other,self,"DIA_Loa_PartyTalk_01_01");	//Да нет, просто спина затекла. Так что там было дальше?
	AI_Output(self,other,"DIA_Loa_PartyTalk_01_02");	//Ну вот... а я ему говорю, найдешь лошадь, тогда и приходи!
	AI_Output(self,other,"DIA_Loa_PartyTalk_01_03");	//Вот так он и ушел. Видимо так до сих пор ее и ищет...(заливаясь со смеху)
	AI_Output(other,self,"DIA_Loa_PartyTalk_01_04");	//Да уж, забавная история.
	AI_Output(self,other,"DIA_Loa_PartyTalk_01_05");	//Знаешь...(задумчиво) Я очень рада, что тебе пришла в голову мысль устроить для нас этот небольшой отдых.
	AI_Output(self,other,"DIA_Loa_PartyTalk_01_06");	//Посреди серой и тоскливой обыдености здешней жизни, он оказался для меня как глоток свежего воздуха. Спасибо тебе за это!
	AI_Output(other,self,"DIA_Loa_PartyTalk_01_07");	//Да, не за что. Хотя я заметил, что тебя все равно что-то тревожит.
	AI_Output(self,other,"DIA_Loa_PartyTalk_01_08");	//Я просто вспомнила, что когда-то любила проводить время в лесу, наслаждаясь его тишиной и спокойствием.
	AI_Output(self,other,"DIA_Loa_PartyTalk_01_09");	//Но это было очень давно, когда я была маленькой. Когда еще были живы мои родители...
};

instance DIA_Loa_PartyTalk_Ext(C_Info)
{
	npc = SLD_10920_Loa;
	nr = 2;
	condition = DIA_Loa_PartyTalk_Ext_Condition;
	information = DIA_Loa_PartyTalk_Ext_Info;
	permanent = FALSE;
	description = "Так, это за них ты хотела поквитаться с тем типом, которого преследовала?";
};

func int DIA_Loa_PartyTalk_Ext_Condition()
{
	if((MIS_LoaSecret == LOG_Running) && (LoaOnParty == TRUE) && (Npc_GetDistToWP(self,"NW_DARKFOREST_IN_LOA_PARTY") <= 500))
	{
		return TRUE;
	};
};

func void DIA_Loa_PartyTalk_Ext_Info()
{
	AI_Output(other,self,"DIA_Loa_PartyTalk_Ext_01_01");	//Так, это за них ты хотела поквитаться с тем типом, которого преследовала?
	AI_Output(self,other,"DIA_Loa_PartyTalk_Ext_01_02");	//...(замявшись) Я не хотела об этом говорить. Но... ты прав.
	AI_Output(self,other,"DIA_Loa_PartyTalk_Ext_01_03");	//Это именно из-за него погибли мои родные и я сама была на волосок от смерти.
	AI_Output(other,self,"DIA_Loa_PartyTalk_Ext_01_04");	//Кем же был этот ублюдок?
	AI_Output(self,other,"DIA_Loa_PartyTalk_Ext_01_05");	//Эх...(вздыхая) Точно не знаю. Мне было не больше десяти лет, когда это все случилось. Но я на всю жизнь запомнила это имя. Ротгриф!
	AI_Output(self,other,"DIA_Loa_PartyTalk_Ext_01_06");	//И каждый раз, когда я произношу это имя, мне постоянно становится не по себе от той мысли, что этот мерзавец до сих пор спокойно гуляет на свободе живой и непридимый.
	AI_Output(other,self,"DIA_Loa_PartyTalk_Ext_01_07");	//Поверь, это легко поправить. Не думаю, что отыскать этого подонка составит большого труда. Где ты последний раз его видела?
	AI_Output(self,other,"DIA_Loa_PartyTalk_Ext_01_08");	//В Дракии. Поговаривали, он обосновался там на службе у местного барона. Но мне так и не удалось это проверить.
	AI_Output(self,other,"DIA_Loa_PartyTalk_Ext_01_09");	//По всей видимости, кто то шепнул Ротгрифу о том, что я в городе и пытаюсь разузнать о нем. 
	AI_Output(self,other,"DIA_Loa_PartyTalk_Ext_01_10");	//После чего меня тут же арестовали. Ну, а продолжение истории ты уже и сам знаешь. Порт... помнишь?
	AI_Output(other,self,"DIA_Loa_PartyTalk_Ext_01_11");	//Опять ты это вспомнила! Видимо, так всю жизнь и будешь мне напоминать об этом.
	AI_Output(self,other,"DIA_Loa_PartyTalk_Ext_01_12");	//Извини, но ты сам захотел это услышать.
	AI_Output(other,self,"DIA_Loa_PartyTalk_Ext_01_13");	//Ладно, забудем об этом. Ты сказала - Дракия. Значит, именно там мы познакомились. 
	AI_Output(self,other,"DIA_Loa_PartyTalk_Ext_01_14");	//Ты там бывал?
	AI_Output(other,self,"DIA_Loa_PartyTalk_Ext_01_15");	//Выходит, что бывал. Хотя абсолютно не ничего не помню про это место. Придется это исправить.
	AI_Output(self,other,"DIA_Loa_PartyTalk_Ext_01_16");	//Постой! Ты что, сам собрался отомстить за меня?
	AI_Output(other,self,"DIA_Loa_PartyTalk_Ext_01_17");	//Да. А ты что, против?
	AI_Output(self,other,"DIA_Loa_PartyTalk_Ext_01_18");	//Нет, не в этом дело. Послушай, не пойми меня неправильно... я не против твоей помощи. Но...
	AI_Output(other,self,"DIA_Loa_PartyTalk_Ext_01_19");	//Что но?
	AI_Output(self,other,"DIA_Loa_PartyTalk_Ext_01_20");	//...это должна сделать только я сама! И никто другой. 
	AI_Output(self,other,"DIA_Loa_PartyTalk_Ext_01_21");	//Я хочу заглянуть этой жирной свинье в глаза и увидеть, что он при этом чувствует. Раскаянье, презрение... или страх!
	AI_Output(self,other,"DIA_Loa_PartyTalk_Ext_01_22");	//В ином случае этот кошмар никогда не оставит меня в покое. 
	AI_Output(other,self,"DIA_Loa_PartyTalk_Ext_01_23");	//Хорошо, я тебя понимаю. Но все таки постараюсь тебе помочь.
	AI_Output(self,other,"DIA_Loa_PartyTalk_Ext_01_24");	//Ох...(закатывая глаза) Тебе еще никто не говорил, что ты ужасно упрямый? 
	AI_Output(other,self,"DIA_Loa_PartyTalk_Ext_01_25");	//Нет. Но меня мало интересует то, что обо мне говорят.
	AI_Output(self,other,"DIA_Loa_PartyTalk_Ext_01_26");	//И почему то меня это не удивляет. Ладно, давай сменим тему. В конце концов, у нас все таки праздник.
	AI_Output(other,self,"DIA_Loa_PartyTalk_Ext_01_27");	//Как скажешь.
	KnowAboutRotgrif = TRUE;
	B_LogEntry(TOPIC_LoaSecret,"Я выяснил, что так беспокоило Лоа. В попытке поквитаться за смерть своих родителей, она сама чуть не погибла. По ее словам, того человека, которого она искала звали Ротгриф. Он служил у местного барона, в Дракии. Хотя я и не слышал раньше об этом месте, но я все таки решил помочь Лоа в ее поисках. Думаю при первой же возможности надо выяснить более подробно об этом месте.");
};

instance DIA_Loa_PartyTalk_Over(C_Info)
{
	npc = SLD_10920_Loa;
	nr = 2;
	condition = DIA_Loa_PartyTalk_Over_Condition;
	information = DIA_Loa_PartyTalk_Over_Info;
	permanent = FALSE;
	description = "Тебе налить еще вина?";
};

func int DIA_Loa_PartyTalk_Over_Condition()
{
	if((MIS_LoaSecret == LOG_Running) && (KnowAboutRotgrif == TRUE) && (Npc_GetDistToWP(self,"NW_DARKFOREST_IN_LOA_PARTY") <= 500))
	{
		return TRUE;
	};
};

func void DIA_Loa_PartyTalk_Over_Info()
{
	AI_Output(other,self,"DIA_Loa_PartyTalk_Over_01_01");	//Тебе налить еще вина?
	AI_Output(self,other,"DIA_Loa_PartyTalk_Over_01_02");	//Не откажусь. Лей до краев!
	AI_Output(other,self,"DIA_Loa_PartyTalk_Over_01_03");	//Постой, ты ничего не слышала?
	AI_Output(self,other,"DIA_Loa_PartyTalk_Over_01_04");	//Эммм... Что ты имеешь ввиду?
	LoaOverParty = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_Loa_PartyTalk_Home(C_Info)
{
	npc = SLD_10920_Loa;
	nr = 2;
	condition = DIA_Loa_PartyTalk_Home_Condition;
	information = DIA_Loa_PartyTalk_Home_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Loa_PartyTalk_Home_Condition()
{
	if((LoaOverParty == TRUE) && (ShadowbeastLoa01 == TRUE) && (ShadowbeastLoa02 == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Loa_PartyTalk_Home_Info()
{
	AI_Output(self,other,"DIA_Loa_PartyTalk_Home_01_01");	//А вот и обещаный сюрприз...
	AI_Output(other,self,"DIA_Loa_PartyTalk_Home_01_02");	//Черт, тут становится опасно! Нам пора возвращаться.
	AI_Output(self,other,"DIA_Loa_PartyTalk_Home_01_03");	//Тогда проводи меня обратно на ферму.
	AI_Output(other,self,"DIA_Loa_PartyTalk_Home_01_04");	//Хорошо, идем.
	LoaBackToFarm = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Follow");
};

instance DIA_Loa_BackToFarm(C_Info)
{
	npc = SLD_10920_Loa;
	nr = 2;
	condition = DIA_Loa_BackToFarm_Condition;
	information = DIA_Loa_BackToFarm_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Loa_BackToFarm_Condition()
{
	if((MIS_LoaSecret == LOG_Running) && (LoaBackToFarm == TRUE) && (Npc_GetDistToWP(self,"NW_BIGFARM_TORLOF") <= 3000))
	{
		return TRUE;
	};
};

func void DIA_Loa_BackToFarm_Info()
{
	B_GivePlayerXP(1000);
	AI_Output(self,other,"DIA_Loa_BackToFarm_01_01");	//Спасибо, что проводил меня.
	AI_Output(self,other,"DIA_Loa_BackToFarm_01_02");	//Но теперь мне надо заняться своими делами. Увидимся позже.
	AI_Output(other,self,"DIA_Loa_BackToFarm_01_03");	//Конечно...
	LoaBackToFarmDone = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};

instance DIA_Loa_GoDrakia(C_Info)
{
	npc = SLD_10920_Loa;
	nr = 2;
	condition = DIA_Loa_GoDrakia_Condition;
	information = DIA_Loa_GoDrakia_Info;
	permanent = FALSE;
	description = "Я отправляюсь в Дракию. Ты поедешь со мной?";
};

func int DIA_Loa_GoDrakia_Condition()
{
	if((MIS_LoaSecret == LOG_Running) && (KnowAboutRotgrif == TRUE) && (MIS_OldElza == LOG_SUCCESS) && (SailAwayDrakia == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Loa_GoDrakia_Info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Loa_GoDrakia_01_01");	//Я отправляюсь в Дракию. Ты поедешь со мной?
	AI_Output(self,other,"DIA_Loa_GoDrakia_01_02");	//В Дракию?! Ты шутишь? И каким же образом ты собираешься отправиться туда?
	AI_Output(other,self,"DIA_Loa_GoDrakia_01_03");	//Мне в этом помогут пираты. Их корабль отплывает туда примерно через пару дней.
	AI_Output(self,other,"DIA_Loa_GoDrakia_01_04");	//Пираты?! Хммм...(удивленно) Вот уж не думала, что ты имеешь с ними какие-то общие дела.
	AI_Output(self,other,"DIA_Loa_GoDrakia_01_05");	//Тем более, насколько мне известно, у них сейчас нет корабля, поскольку его потопили паладины, недавно прибывшие в Хоринис.
	AI_Output(other,self,"DIA_Loa_GoDrakia_01_06");	//А я смотрю, ты неплохо осведомлена о происходящем для обычной наемницы.
	AI_Output(self,other,"DIA_Loa_GoDrakia_01_07");	//Поверь, это не так трудно, если ты умеешь слушать.
	AI_Output(other,self,"DIA_Loa_GoDrakia_01_08");	//Вообщем, они починили свой старый. И теперь хотят отвезти все свое барахло на продажу в Дракию.
	AI_Output(self,other,"DIA_Loa_GoDrakia_01_09");	//Вполне разумно с их стороны.
	AI_Output(other,self,"DIA_Loa_GoDrakia_01_10");	//Так что, ты поедешь со мной?
	AI_Output(self,other,"DIA_Loa_GoDrakia_01_11");	//Ну, если все в действительности обстоит также, как ты и говоришь... то, конечно поеду. Ведь это будет отличным шансом поквитаться с Ротгрифом.
	AI_Output(other,self,"DIA_Loa_GoDrakia_01_12");	//Тогда, лучше не терять времени и отправиться туда прямо сейчас.
	AI_Output(self,other,"DIA_Loa_GoDrakia_01_13");	//Эй, эй... Не так быстро! Я не могу просто так вот все взять тут и бросить.
	AI_Output(self,other,"DIA_Loa_GoDrakia_01_14");	//К тому же, мне нужно некоторое время на сборы. Поэтому, давай встретимся уже на месте.
	AI_Output(other,self,"DIA_Loa_GoDrakia_01_15");	//Но ты же не знаешь, где находится лагерь пиратов?!
	AI_Output(self,other,"DIA_Loa_GoDrakia_01_16");	//Не волнуйся! Я как-нибудь разберусь с этим. А тебе мой совет - тоже хорошенько подготовиться к предстоящему путешествию.
	AI_Output(self,other,"DIA_Loa_GoDrakia_01_17");	//Дракия место опасное и теплого приема там точно не жди. 
	AI_Output(other,self,"DIA_Loa_GoDrakia_01_18");	//И почему меня все это не удивляет. Ладно, как скажешь.
	LoaGoDrakia = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"TOT");
};

//---------------------------Лоа в Ярике------------------------------------

instance DIA_SLD_10921_Loa_ADW_EXIT(C_Info)
{
	npc = SLD_10921_Loa_ADW;
	nr = 999;
	condition = DIA_SLD_10921_Loa_ADW_EXIT_Condition;
	information = DIA_SLD_10921_Loa_ADW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_SLD_10921_Loa_ADW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_SLD_10921_Loa_ADW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_SLD_10921_Loa_ADW_Hello(C_Info)
{
	npc = SLD_10921_Loa_ADW;
	nr = 1;
	condition = DIA_SLD_10921_Loa_ADW_Hello_Condition;
	information = DIA_SLD_10921_Loa_ADW_Hello_Info;
	permanent = FALSE;
	description = "Невероятно! Ты уже здесь.";
};

func int DIA_SLD_10921_Loa_ADW_Hello_Condition()
{
	return TRUE;
};

func void DIA_SLD_10921_Loa_ADW_Hello_Info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_SLD_10921_Loa_ADW_Hello_01_01");	//Невероятно! Ты уже здесь.
	AI_Output(self,other,"DIA_SLD_10921_Loa_ADW_Hello_01_02");	//Как видишь...(раздраженно) Только, похоже я напрасно так спешила.
	AI_Output(other,self,"DIA_SLD_10921_Loa_ADW_Hello_01_03");	//Кажется, ты явно не в себе. Что случилось?
	AI_Output(self,other,"DIA_SLD_10921_Loa_ADW_Hello_01_04");	//Что, что... Эта скотина Грэг не разрешает мне плыть вместе с вами.
	AI_Output(other,self,"DIA_SLD_10921_Loa_ADW_Hello_01_05");	//Почему?
	AI_Output(self,other,"DIA_SLD_10921_Loa_ADW_Hello_01_06");	//Говорит, что мол женщина на корабле - к беде. А для него очень важно, чтобы его корабль доплыл до Дракии без всяких неприятностей.
	AI_Output(self,other,"DIA_SLD_10921_Loa_ADW_Hello_01_07");	//Я ему конечно попыталась объяснить, что все это старые глупые предрассудки.
	AI_Output(self,other,"DIA_SLD_10921_Loa_ADW_Hello_01_08");	//Но он даже и слушать меня не стал. А просто выставил за дверь своей хибары!
	AI_Output(other,self,"DIA_SLD_10921_Loa_ADW_Hello_01_09");	//Не переживай так! Я попробую сам с ним поговорить.
	AI_Output(self,other,"DIA_SLD_10921_Loa_ADW_Hello_01_10");	//Сомневаюсь, что у тебя что-то получится. Этот болван упрямее осла!
	AI_Output(self,other,"DIA_SLD_10921_Loa_ADW_Hello_01_11");	//Там будет видно.
	MIS_OldRumors = LOG_Running;
	Log_CreateTopic(TOPIC_OldRumors,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OldRumors,LOG_Running);
	B_LogEntry(TOPIC_OldRumors,"У Лоа возникла небольшая проблема с Грегом. Тот абсолютно против того, чтобы она поплыла на его корабле в Дракию. По его словам - женщины на корабле приносит одни неприятности. А для него очень важно, чтобы с кораблем ничего не случилось во время его плавания.");
};

instance DIA_SLD_10921_Loa_ADW_CanSail(C_Info)
{
	npc = SLD_10921_Loa_ADW;
	nr = 1;
	condition = DIA_SLD_10921_Loa_ADW_CanSail_Condition;
	information = DIA_SLD_10921_Loa_ADW_CanSail_Info;
	permanent = FALSE;
	description = "Ты можешь подняться на борт корабля.";
};

func int DIA_SLD_10921_Loa_ADW_CanSail_Condition()
{
	return TRUE;
};

func void DIA_SLD_10921_Loa_ADW_CanSail_Info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_SLD_10921_Loa_ADW_CanSail_01_01");	//Ты можешь подняться на борт корабля.
	AI_Output(self,other,"DIA_SLD_10921_Loa_ADW_CanSail_01_02");	//Что ты имеешь вввиду?
	AI_Output(other,self,"DIA_SLD_10921_Loa_ADW_CanSail_01_03");	//Только то, что Грэг согласился взять тебя в Дракию.
	AI_Output(self,other,"DIA_SLD_10921_Loa_ADW_CanSail_01_04");	//Хммм... Интересно, и что же заставило его передумать?
	AI_Output(other,self,"DIA_SLD_10921_Loa_ADW_CanSail_01_05");	//Ну скажем, я просто знаю к нему определенный подход.
	AI_Output(other,self,"DIA_SLD_10921_Loa_ADW_CanSail_01_06");	//Хотя было лучше, больше не допускать подобных ситуаций. Иначе, подходы могут очень...кммм...резко закончаться такими темпами.
	AI_Output(self,other,"DIA_SLD_10921_Loa_ADW_CanSail_01_07");	//Благодарю тебя! Ты опять оказал мне неоценимую услугу. И чтобы я без тебя делала.
	AI_Output(other,self,"DIA_SLD_10921_Loa_ADW_CanSail_01_08");	//Лучше пообщай мне, что больше не будешь злить Грэга. Хотя бы до того момента, пока мы не окажемся в Дракии.
	AI_Output(self,other,"DIA_SLD_10921_Loa_ADW_CanSail_01_09");	//Хорошо, я буду тише воды.
	AI_Output(other,self,"DIA_SLD_10921_Loa_ADW_CanSail_01_10");	//Вот и славно.
	LoaInsDrakia = TRUE;
	AI_StopProcessInfos(self);
};