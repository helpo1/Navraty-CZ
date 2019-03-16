
instance DMT_12970_STONNOS_EXIT(C_Info)
{
	npc = dmt_12970_stonnos;
	nr = 999;
	condition = dmt_12970_stonnos_exit_condition;
	information = dmt_12970_stonnos_exit_info;
	important = FALSE;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dmt_12970_stonnos_exit_condition()
{
	return TRUE;
};

func void dmt_12970_stonnos_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DMT_12970_STONNOS_HELLO(C_Info)
{
	npc = dmt_12970_stonnos;
	condition = dmt_12970_stonnos_hello_condition;
	information = dmt_12970_stonnos_hello_info;
	important = TRUE;
	permanent = TRUE;
};


func int dmt_12970_stonnos_hello_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (CHOOSENATUREISDONE == TRUE) && (TELLWELCOMEDONE == FALSE) && (ALLGUARDIANSNOLEADERISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dmt_12970_stonnos_hello_info()
{
	if(TELLWHATDONE == FALSE)
	{
		TELLWHATDONE = TRUE;
		if(CHOOSEDARK == TRUE)
		{
			AI_Output(self,other,"DMT_12970_Stonnos_Hello_01");	//Тебе следует обратится к Хранителю Даготу, адепт!
			AI_Output(self,other,"DMT_12970_Stonnos_Hello_02");	//Теперь он будет твоим наставником.
			AI_Output(self,other,"DMT_12970_Stonnos_Hello_03");	//Я же ничем тебе более не могу помочь.
			AI_StopProcessInfos(self);
		}
		else if(CHOOSESTONE == TRUE)
		{
			AI_Output(self,other,"DMT_12970_Stonnos_Hello_05");	//Итак, ты здесь. Добро пожаловать в нашу обитель, герой!
			AI_Output(self,other,"DMT_12970_Stonnos_Hello_06");	//С этого момента я буду твоим наставником.
			AI_Output(self,other,"DMT_12970_Stonnos_Hello_07");	//Остальные Хранители тоже будут внимательно следить за твоей судьбой. Но не более того.
			AI_Output(self,other,"DMT_12970_Stonnos_Hello_08");	//Отныне лишь Скала - твой удел и только ей теперь ты служишь. Запомни это!
			AI_Output(other,self,"DMT_12970_Stonnos_Hello_09");	//Да, мастер! Я все понял.
			TELLWELCOMEDONE = TRUE;
		}
		else if(CHOOSEWATER == TRUE)
		{
			AI_Output(self,other,"DMT_12970_Stonnos_Hello_11");	//Тебе следует обратится к Хранителю Вакону, адепт!
			AI_Output(self,other,"DMT_12970_Stonnos_Hello_02");	//Теперь он будет твоим наставником.
			AI_Output(self,other,"DMT_12970_Stonnos_Hello_03");	//Я же ничем тебе более не могу помочь.
			AI_StopProcessInfos(self);
		}
		else if(CHOOSEFIRE == TRUE)
		{
			AI_Output(self,other,"DMT_12970_Stonnos_Hello_15");	//Тебе следует обратится к Хранителю Келиосу, адепт!
			AI_Output(self,other,"DMT_12970_Stonnos_Hello_02");	//Теперь он будет твоим наставником.
			AI_Output(self,other,"DMT_12970_Stonnos_Hello_03");	//Я же ничем тебе более не могу помочь.
			AI_StopProcessInfos(self);
		};
	}
	else if(CHOOSESTONE == TRUE)
	{
		AI_Output(self,other,"DMT_12970_Stonnos_Hello_19");	//Итак, ты здесь...(вкрадчиво) Добро пожаловать в нашу обитель, герой!
		AI_Output(self,other,"DMT_12970_Stonnos_Hello_20");	//С этого момента я буду твоим наставником.
		AI_Output(self,other,"DMT_12970_Stonnos_Hello_21");	//Остальные Хранители тоже будут внимательно следить за твоей судьбой. Но не более того.
		AI_Output(self,other,"DMT_12970_Stonnos_Hello_22");	//Отныне лишь Скала - твой удел и только ей теперь ты служишь. Запомни это!
		AI_Output(other,self,"DMT_12970_Stonnos_Hello_23");	//Да, мастер! Я все понял.
		TELLWELCOMEDONE = TRUE;
	}
	else
	{
		AI_Output(self,other,"DMT_12970_Stonnos_Hello_28");	//Ты уже знаешь, что тебе следует делать. Ступай.
		AI_StopProcessInfos(self);
	};
};


instance DMT_12970_STONNOS_WHATTEACH(C_Info)
{
	npc = dmt_12970_stonnos;
	condition = dmt_12970_stonnos_whatteach_condition;
	information = dmt_12970_stonnos_whatteach_info;
	permanent = TRUE;
	description = "Чему я смогу научится у тебя?";
};


func int dmt_12970_stonnos_whatteach_condition()
{
	if((CHOOSESTONE == TRUE) && (TELLWELCOMEDONE == TRUE) && (GUARDIANTEACHMEMAGIC == FALSE) && (GUARDIANTEACHMEWAR == FALSE) && (ALLGUARDIANSNOLEADERISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dmt_12970_stonnos_whatteach_info()
{
	AI_Output(other,self,"DMT_12970_Stonnos_WhatTeach_00");	//Ты можешь обучить меня магии?
	if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR))
	{
		AI_Output(self,other,"DMT_12970_Stonnos_WhatTeach_01");	//Поскольку теперь ты мой ученик...(задумчиво) то я смогу обучить тебя магии, дарованной мне моим создателем.
		AI_Output(self,other,"DMT_12970_Stonnos_WhatTeach_03");	//У этой магии нет названия...(серьезно) да это и не важно! Главное, что эти знания священны и мало кто владел ими.
		AI_Output(self,other,"DMT_12970_Stonnos_WhatTeach_04");	//Только избранные были допущены к их познанию, и если ты пожелаешь, то в скором времени тоже станешь одним из их числа!
		AI_Output(self,other,"DMT_12970_Stonnos_WhatTeach_06");	//Кроме того, знание магических кругов - также необходимое условия их познания. Но и этому я смогу тебя обучить, если пожелаешь.
		AI_Output(self,other,"DMT_12970_Stonnos_WhatTeach_24");	//И еще кое-что...(вкрадчиво) Поскольку ты теперь являешься адептом нашего круга - прими от меня эту магическую робу послушника.
		CreateInvItems(self,itar_haradrimmage,1);
		B_GiveInvItems(self,other,itar_haradrimmage,1);
		GUARDIANTEACHMEMAGIC = TRUE;
		B_LogEntry(TOPIC_GUARDIANS,"Хранитель Стоннос сможет научить меня магии Хранителей. Если я решу начать свое обучение, мне просто стоит поговорить с ним об этом.");
		AI_StopProcessInfos(self);
	}
	else if((hero.guild == GIL_PAL) || (hero.guild == GIL_DJG) || (hero.guild == GIL_SLD) || (hero.guild == GIL_TPL) || (hero.guild == GIL_MIL))
	{
		AI_Output(self,other,"DMT_12970_Stonnos_WhatTeach_10");	//Ну, поскольку ты воин...(задумчиво) То я вряд ли смогу обучить тебя магии, дарованной мне моим создателем.
		AI_Output(self,other,"DMT_12970_Stonnos_WhatTeach_11");	//Однако ты можешь поговорить с Таринаксом - наставником асгардов, воинов стихий.
		AI_Output(self,other,"DMT_12970_Stonnos_WhatTeach_12");	//Думаю, он поможет тебе в твоем обучении.
		AI_Output(other,self,"DMT_12970_Stonnos_WhatTeach_13");	//Хорошо, я так и сделаю.
		GUARDIANTEACHMEWAR = TRUE;
		B_LogEntry(TOPIC_GUARDIANS,"Чтобы начать свое обучение, мне стоит поговорить с Таринаксом - наставником асгардов, воинов стихий.");
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DMT_12970_Stonnos_WhatTeach_14");	//Пока ничему...(сеьезно) Ты еще не готов познать всю мудрость, дарованную Хранителям!
		AI_Output(self,other,"DMT_12970_Stonnos_WhatTeach_15");	//Ты еще слишком слаб! Возвращайся, когда будешь готов, и я открою тебе наши тайны.
	};
};


instance DMT_12970_STONNOS_HELLOBACK(C_Info)
{
	npc = dmt_12970_stonnos;
	condition = dmt_12970_stonnos_helloback_condition;
	information = dmt_12970_stonnos_helloback_info;
	important = TRUE;
	permanent = TRUE;
};


func int dmt_12970_stonnos_helloback_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (CHOOSENATUREISDONE == TRUE) && (GUARDIANTEACHMEWAR == TRUE) && (ALLGUARDIANSNOLEADERISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dmt_12970_stonnos_helloback_info()
{
	AI_Output(self,other,"DMT_12970_Stonnos_HelloBack_01");	//Ты уже знаешь, что тебе следует делать. Ступай.
	AI_StopProcessInfos(self);
};


instance DMT_12970_STONNOS_EXPLAINCIRCLES(C_Info)
{
	npc = dmt_12970_stonnos;
	condition = dmt_12970_stonnos_explaincircles_condition;
	information = dmt_12970_stonnos_explaincircles_info;
	permanent = FALSE;
	description = "Объясни мне, в чем смысл магических Кругов?";
};


func int dmt_12970_stonnos_explaincircles_condition()
{
	if((CHOOSESTONE == TRUE) && (TELLWELCOMEDONE == TRUE) && (GUARDIANTEACHMEMAGIC == TRUE) && (ALLGUARDIANSNOLEADERISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dmt_12970_stonnos_explaincircles_info()
{
	AI_Output(other,self,"DMT_12970_Stonnos_EXPLAINCIRCLES_Info_15_01");	//Объясни мне, в чем смысл магических Кругов?
	AI_Output(self,other,"DMT_12970_Stonnos_EXPLAINCIRCLES_Info_14_02");	//Круги символизируют твое понимание магии.
	AI_Output(self,other,"DMT_12970_Stonnos_EXPLAINCIRCLES_Info_14_03");	//Они обозначают уровень твоих знаний и навыков, способность обучаться новым заклинаниям.
	AI_Output(self,other,"DMT_12970_Stonnos_EXPLAINCIRCLES_Info_14_04");	//Каждый Круг необходимо пройти до конца, прежде чем вступить в следующий.
	AI_Output(self,other,"DMT_12970_Stonnos_EXPLAINCIRCLES_Info_14_05");	//Достичь высших Кругов способны лишь избранные.
	AI_Output(self,other,"DMT_12970_Stonnos_EXPLAINCIRCLES_Info_14_06");	//Познавшим же их открываются заклинания невероятной силы!
	AI_Output(self,other,"DMT_12970_Stonnos_EXPLAINCIRCLES_Info_14_07");	//Но чтобы понять их силу, сперва ты должен познать себя.
	EXPLAINCIRCLEMEAN = TRUE;
};


var int dia_dmt_12970_stonnos_circle_noperm;

instance DIA_DMT_12970_STONNOS_CIRCLE(C_Info)
{
	npc = dmt_12970_stonnos;
	nr = 99;
	condition = dia_dmt_12970_stonnos_circle_condition;
	information = dia_dmt_12970_stonnos_circle_info;
	permanent = TRUE;
	description = "Я хочу постигать суть магии.";
};

func int dia_dmt_12970_stonnos_circle_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) <= 6) && (CHOOSESTONE == TRUE) && (ALLGUARDIANSNOLEADERISDEAD == FALSE) && (TELLWELCOMEDONE == TRUE) && (GUARDIANTEACHMEMAGIC == TRUE) && (DIA_DMT_12970_STONNOS_CIRCLE_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_dmt_12970_stonnos_circle_info()
{
	AI_Output(other,self,"DIA_DMT_12970_Stonnos_CIRCLE_15_00");	//Я хочу постигать суть магии.
	Info_ClearChoices(DIA_DMT_12970_STONNOS_CIRCLE);
	Info_AddChoice(DIA_DMT_12970_STONNOS_CIRCLE,Dialog_Back,DIA_DMT_12970_STONNOS_CIRCLE_Back);

	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) < 1)
	{
		Info_AddChoice(DIA_DMT_12970_STONNOS_CIRCLE,"1 Круг магии (Очков обучения: 20)",DIA_DMT_12970_STONNOS_CIRCLE_1);
	}
	else if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 1) && (Kapitel >= 2))
	{
		Info_AddChoice(DIA_DMT_12970_STONNOS_CIRCLE,"2 Круг магии (Очков обучения: 30)",DIA_DMT_12970_STONNOS_CIRCLE_2);
	}
	else if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 2) && (Kapitel >= 3))
	{
		Info_AddChoice(DIA_DMT_12970_STONNOS_CIRCLE,"3 Круг магии (Очков обучения: 40)",DIA_DMT_12970_STONNOS_CIRCLE_3);
	}
	else if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 3) && (MIS_ReadyforChapter4 == TRUE))
	{
		Info_AddChoice(DIA_DMT_12970_STONNOS_CIRCLE,"4 Круг магии (Очков обучения: 60)",DIA_DMT_12970_STONNOS_CIRCLE_4);
	}
	else if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 4) && (Kapitel >= 5))
	{
		Info_AddChoice(DIA_DMT_12970_STONNOS_CIRCLE,"5 Круг магии (Очков обучения: 80)",DIA_DMT_12970_STONNOS_CIRCLE_5);
	}
	else if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 5) && (Kapitel >= 5) && (MIS_DarkOrden == LOG_Success) && (MIS_JarCurse == LOG_Success) && (MIS_URNAZULRAGE == LOG_SUCCESS))
	{
		Info_AddChoice(DIA_DMT_12970_STONNOS_CIRCLE,"6 Круг магии (Очков обучения: 100)",DIA_DMT_12970_STONNOS_CIRCLE_6);
	}
	else
	{
		AI_Output(self,other,"DIA_DMT_12970_Stonnos_CIRCLE_14_42");	//Ты еще не готов к этому! Возвращайся позже.
	};
};

func void DIA_DMT_12970_Stonnos_CIRCLE_Back()
{
	Info_ClearChoices(DIA_DMT_12970_Stonnos_CIRCLE);
};

func void DIA_DMT_12970_Stonnos_CIRCLE_1()
{
	if(B_TeachMagicCircle(self,other,1))
	{
		AI_Output(self,other,"DIA_DMT_12970_Stonnos_CIRCLE_14_0A");	//Готов ли ты вступить в следующий круг магии?
		AI_Output(other,self,"DIA_DMT_12970_Stonnos_CIRCLE_15_01");	//Да, мастер. Я готов.
		AI_Output(self,other,"DIA_DMT_12970_Stonnos_CIRCLE_14_01");	//Хорошо! Вступи же в Первый Круг и тебе откроется тайна простейших рун!
	};
	Info_ClearChoices(DIA_DMT_12970_Stonnos_CIRCLE);
};

func void DIA_DMT_12970_Stonnos_CIRCLE_2()
{
	if(B_TeachMagicCircle(self,other,2))
	{
		AI_Output(self,other,"DIA_DMT_12970_Stonnos_CIRCLE_14_0A");	//Готов ли ты вступить в следующий круг магии?
		AI_Output(other,self,"DIA_DMT_12970_Stonnos_CIRCLE_15_02");	//Да, мастер. Я готов.
		AI_Output(self,other,"DIA_DMT_12970_Stonnos_CIRCLE_14_09");	//Второй Круг откроет тебе доступ к новым боевым заклятиям.
		AI_Output(self,other,"DIA_DMT_12970_Stonnos_CIRCLE_14_10");	//Но для того чтобы познать истинные секреты магии, тебе еще многому предстоит научиться.
	};
	Info_ClearChoices(DIA_DMT_12970_Stonnos_CIRCLE);
};

func void DIA_DMT_12970_Stonnos_CIRCLE_3()
{
	if(B_TeachMagicCircle(self,other,3))
	{
		AI_Output(self,other,"DIA_DMT_12970_Stonnos_CIRCLE_14_0A");	//Готов ли ты вступить в следующий круг магии?
		AI_Output(other,self,"DIA_DMT_12970_Stonnos_CIRCLE_15_03");	//Да, мастер. Я готов.
		AI_Output(self,other,"DIA_DMT_12970_Stonnos_CIRCLE_14_16");	//Так тому и быть. Я посвящаю тебя в Третий Круг!
		AI_Output(self,other,"DIA_DMT_12970_Stonnos_CIRCLE_14_17");	//Ты уже преодолел значительный этап на пути магии.
		AI_Output(self,other,"DIA_DMT_12970_Stonnos_CIRCLE_14_18");	//Но не забывай: чем выше твоя сила и возможности, тем осмотрительнее следует использовать руны.
	};
	Info_ClearChoices(DIA_DMT_12970_Stonnos_CIRCLE);
};

func void DIA_DMT_12970_Stonnos_CIRCLE_4()
{
	if(B_TeachMagicCircle(self,other,4))
	{
		AI_Output(self,other,"DIA_DMT_12970_Stonnos_CIRCLE_14_0A");	//Готов ли ты вступить в следующий круг магии?
		AI_Output(other,self,"DIA_DMT_12970_Stonnos_CIRCLE_15_04");	//Да, мастер. Я готов.
		AI_Output(self,other,"DIA_DMT_12970_Stonnos_CIRCLE_14_22");	//Пришло время тебе начать постигать истинные секреты магии.
		AI_Output(self,other,"DIA_DMT_12970_Stonnos_CIRCLE_14_23");	//Отныне тебе подвластен Четвертый Круг магии!
	};
	Info_ClearChoices(DIA_DMT_12970_Stonnos_CIRCLE);
};

func void DIA_DMT_12970_Stonnos_CIRCLE_5()
{
	if(B_TeachMagicCircle(self,other,5))
	{
		AI_Output(self,other,"DIA_DMT_12970_Stonnos_CIRCLE_14_0A");	//Готов ли ты вступить в следующий круг магии?
		AI_Output(other,self,"DIA_DMT_12970_Stonnos_CIRCLE_15_05");	//Да, мастер. Я готов.
		AI_Output(other,self,"DIA_DMT_12970_Stonnos_CIRCLE_15_5A");	//Да будет так! Я открою тебе истинный смысл Пятого Круга.
		AI_Output(self,other,"DIA_DMT_12970_Stonnos_CIRCLE_14_31");	//Познай предел своих возможностей, и ты познаешь свою истинную силу.
		AI_Output(self,other,"DIA_DMT_12970_Stonnos_CIRCLE_14_32");	//Заклинания, которые ты сможешь изучать, могут быть воистину разрушительными.
		AI_Output(self,other,"DIA_DMT_12970_Stonnos_CIRCLE_14_33");	//Так что знай меру своей силе и остерегайся мании величия.
	};
	Info_ClearChoices(DIA_DMT_12970_Stonnos_CIRCLE);
};

func void DIA_DMT_12970_Stonnos_CIRCLE_6()
{
	if(B_TeachMagicCircle(self,other,6))
	{
		AI_Output(self,other,"DIA_DMT_12970_Stonnos_CIRCLE_14_34");	//Я подниму тебя в Шестой Круг магии.
		AI_Output(self,other,"DIA_DMT_12970_Stonnos_CIRCLE_14_35");	//Заметь, в Шестой Круг могут вступить лишь самые могущественные из магов. Он предназначен для тех, чья жизнь - это знак! Твой знак - Скала.
		AI_Output(self,other,"DIA_DMT_12970_Stonnos_CIRCLE_14_39");	//Шестой Круг позволит тебе использовать магию любой руны.
		AI_Output(self,other,"DIA_DMT_12970_Stonnos_CIRCLE_14_40");	//И не забудь: не захватывать силу, но быть ее источником.
		AI_Output(self,other,"DIA_DMT_12970_Stonnos_CIRCLE_14_41");	//Будь мудр и рассудителен в своих деяниях!
		DIA_DMT_12970_STONNOS_CIRCLE_NOPERM = TRUE;
	};
	Info_ClearChoices(DIA_DMT_12970_Stonnos_CIRCLE);
};

instance DIA_DMT_12970_STONNOS_TEACH_MANA(C_Info)
{
	npc = dmt_12970_stonnos;
	nr = 10;
	condition = dia_dmt_12970_stonnos_teach_mana_condition;
	information = dia_dmt_12970_stonnos_teach_mana_info;
	permanent = TRUE;
	description = "Я хочу увеличить свою магическую энергию.";
};


func int dia_dmt_12970_stonnos_teach_mana_condition()
{
	if((CHOOSESTONE == TRUE) && (TELLWELCOMEDONE == TRUE) && (ALLGUARDIANSNOLEADERISDEAD == FALSE) && (GUARDIANTEACHMEMAGIC == TRUE) && (hero.attribute[ATR_MANA_MAX] < T_MEGA))
	{
		return TRUE;
	};
};

func void dia_dmt_12970_stonnos_teach_mana_info()
{
	AI_Output(other,self,"DIA_DMT_12970_Stonnos_TEACH_MANA_15_00");	//Я хочу увеличить свою магическую энергию.
	Info_ClearChoices(dia_dmt_12970_stonnos_teach_mana);
	Info_AddChoice(dia_dmt_12970_stonnos_teach_mana,Dialog_Back,dia_dmt_12970_stonnos_teach_mana_back);
	Info_AddChoice(dia_dmt_12970_stonnos_teach_mana,B_BuildLearnString(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_dmt_12970_stonnos_teach_mana_1);
	Info_AddChoice(dia_dmt_12970_stonnos_teach_mana,B_BuildLearnString(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_dmt_12970_stonnos_teach_mana_5);
};

func void dia_dmt_12970_stonnos_teach_mana_back()
{
	if(other.attribute[ATR_MANA_MAX] >= T_MEGA)
	{
		AI_Output(self,other,"DIA_DMT_12970_Stonnos_TEACH_MANA_05_00");	//Ты на пределе своих возможностей!
	};
	Info_ClearChoices(dia_dmt_12970_stonnos_teach_mana);
};

func void dia_dmt_12970_stonnos_teach_mana_1()
{
	b_teachattributepointstarinaks(self,other,ATR_MANA_MAX,1,T_MEGA);
	Info_ClearChoices(dia_dmt_12970_stonnos_teach_mana);
	Info_AddChoice(dia_dmt_12970_stonnos_teach_mana,Dialog_Back,dia_dmt_12970_stonnos_teach_mana_back);
	Info_AddChoice(dia_dmt_12970_stonnos_teach_mana,B_BuildLearnString(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_dmt_12970_stonnos_teach_mana_1);
	Info_AddChoice(dia_dmt_12970_stonnos_teach_mana,B_BuildLearnString(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_dmt_12970_stonnos_teach_mana_5);
};

func void dia_dmt_12970_stonnos_teach_mana_5()
{
	b_teachattributepointstarinaks(self,other,ATR_MANA_MAX,5,T_MEGA);
	Info_ClearChoices(dia_dmt_12970_stonnos_teach_mana);
	Info_AddChoice(dia_dmt_12970_stonnos_teach_mana,Dialog_Back,dia_dmt_12970_stonnos_teach_mana_back);
	Info_AddChoice(dia_dmt_12970_stonnos_teach_mana,B_BuildLearnString(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_dmt_12970_stonnos_teach_mana_1);
	Info_AddChoice(dia_dmt_12970_stonnos_teach_mana,B_BuildLearnString(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_dmt_12970_stonnos_teach_mana_5);
};


instance DIA_DMT_12970_STONNOS_RUNEN(C_Info)
{
	npc = dmt_12970_stonnos;
	nr = 99;
	condition = dia_dmt_12970_stonnos_runen_condition;
	information = dia_dmt_12970_stonnos_runen_info;
	permanent = TRUE;
	description = "Научи меня своей магии.";
};


func int dia_dmt_12970_stonnos_runen_condition()
{
	if((CHOOSESTONE == TRUE) && (TELLWELCOMEDONE == TRUE) && (GUARDIANTEACHMEMAGIC == TRUE) && (ALLGUARDIANSNOLEADERISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_dmt_12970_stonnos_runen_info()
{
	Info_ClearChoices(dia_dmt_12970_stonnos_runen);
	Info_AddChoice(dia_dmt_12970_stonnos_runen,Dialog_Back,dia_dmt_12970_stonnos_runen_back);

	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 6)
	{
		Info_AddChoice(dia_dmt_12970_stonnos_runen,"6 Круг магии",dia_dmt_12970_stonnos_runen_6);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 5)
	{
		Info_AddChoice(dia_dmt_12970_stonnos_runen,"5 Круг магии",dia_dmt_12970_stonnos_runen_5);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 4)
	{
		Info_AddChoice(dia_dmt_12970_stonnos_runen,"4 Круг магии",dia_dmt_12970_stonnos_runen_4);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3)
	{
		Info_AddChoice(dia_dmt_12970_stonnos_runen,"3 Круг магии",dia_dmt_12970_stonnos_runen_3);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2)
	{
		Info_AddChoice(dia_dmt_12970_stonnos_runen,"2 Круг магии",dia_dmt_12970_stonnos_runen_2);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 1)
	{
		Info_AddChoice(dia_dmt_12970_stonnos_runen,"1 Круг магии",dia_dmt_12970_stonnos_runen_1);
	};
};

func void dia_dmt_12970_stonnos_runen_back()
{
	Info_ClearChoices(dia_dmt_12970_stonnos_runen);
};

func void dia_dmt_12970_stonnos_runen_1()
{
	Info_ClearChoices(dia_dmt_12970_stonnos_runen);
	Info_AddChoice(dia_dmt_12970_stonnos_runen,Dialog_Back,dia_dmt_12970_stonnos_runen_back);
	if(PLAYER_TALENT_RUNES[SPL_Sleep] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_dmt_12970_stonnos_runen,b_buildlearnstringforrunes(NAME_SPL_Sleep,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Sleep)),dia_dmt_12970_stonnos_runen_circle_1_spl_sleep);
	};
	if(PLAYER_TALENT_RUNES[95] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_dmt_12970_stonnos_runen,b_buildlearnstringforrunes(NAME_SPL_BERZERK,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_BERZERK)),dia_dmt_12970_stonnos_runen_circle_3_spl_berzerk);
	};
};

func void dia_dmt_12970_stonnos_runen_2()
{
	Info_ClearChoices(dia_dmt_12970_stonnos_runen);
	Info_AddChoice(dia_dmt_12970_stonnos_runen,Dialog_Back,dia_dmt_12970_stonnos_runen_back);
	if(PLAYER_TALENT_RUNES[SPL_GreenTentacle] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_dmt_12970_stonnos_runen,b_buildlearnstringforrunes(NAME_SPL_GreenTentacle,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_GreenTentacle)),dia_dmt_12970_stonnos_runen_circle_2_spl_greententacle);
	};
	if(PLAYER_TALENT_RUNES[SPL_WindFist] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_dmt_12970_stonnos_runen,b_buildlearnstringforrunes(NAME_SPL_WINDFIST,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_WindFist)),dia_dmt_12970_stonnos_runen_circle_2_spl_windfist);
	};
};

func void dia_dmt_12970_stonnos_runen_3()
{
	Info_ClearChoices(dia_dmt_12970_stonnos_runen);
	Info_AddChoice(dia_dmt_12970_stonnos_runen,Dialog_Back,dia_dmt_12970_stonnos_runen_back);

	if(PLAYER_TALENT_RUNES[SPL_Fear] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_dmt_12970_stonnos_runen,b_buildlearnstringforrunes(NAME_SPL_Fear,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Fear)),dia_dmt_12970_stonnos_runen_circle_3_spl_fear);
	};

	if(PLAYER_TALENT_RUNES[SPL_Charm] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_dmt_12970_stonnos_runen,b_buildlearnstringforrunes(NAME_SPL_Charm,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Charm)),dia_dmt_12970_stonnos_runen_circle_1_spl_charm);
	};

	if(PLAYER_TALENT_RUNES[SPL_Extricate] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_dmt_12970_stonnos_runen,b_buildlearnstringforrunes(NAME_SPL_Extricate,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Extricate)),dia_dmt_12970_stonnos_runen_circle_3_spl_Extricate);
	};
};

func void dia_dmt_12970_stonnos_runen_4()
{
	Info_ClearChoices(dia_dmt_12970_stonnos_runen);
	Info_AddChoice(dia_dmt_12970_stonnos_runen,Dialog_Back,dia_dmt_12970_stonnos_runen_back);

	if(PLAYER_TALENT_RUNES[100] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_dmt_12970_stonnos_runen,b_buildlearnstringforrunes(NAME_SPL_SUMMONSWAMPGOLEM,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SUMMONSWAMPGOLEM)),dia_dmt_12970_stonnos_runen_circle_5_spl_summonswampgolem);
	};
	if(PLAYER_TALENT_RUNES[SPL_Acid] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_dmt_12970_stonnos_runen,b_buildlearnstringforrunes(NAME_SPL_Acid,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Acid)),dia_dmt_12970_stonnos_runen_circle_5_spl_Acid);
	};
	if((PLAYER_TALENT_RUNES[SPL_Elevate] == FALSE) && (LegoSpellElevate == TRUE))
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_dmt_12970_stonnos_runen,b_buildlearnstringforrunes(NAME_SPL_Elevate,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Elevate)),dia_dmt_12970_stonnos_runen_circle_4_spl_Elevate);
	};
};

func void dia_dmt_12970_stonnos_runen_5()
{
	Info_ClearChoices(dia_dmt_12970_stonnos_runen);
	Info_AddChoice(dia_dmt_12970_stonnos_runen,Dialog_Back,dia_dmt_12970_stonnos_runen_back);

	if(PLAYER_TALENT_RUNES[96] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_dmt_12970_stonnos_runen,b_buildlearnstringforrunes(NAME_SPL_SEVEREFETIDITY,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SEVEREFETIDITY)),dia_dmt_12970_stonnos_runen_circle_4_spl_severefetidity);
	};
	if(PLAYER_TALENT_RUNES[SPL_Whirlwind] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_dmt_12970_stonnos_runen,b_buildlearnstringforrunes(NAME_SPL_Whirlwind,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Whirlwind)),dia_dmt_12970_stonnos_runen_circle_4_spl_whirlwind);
	};
};

func void dia_dmt_12970_stonnos_runen_6()
{
	Info_ClearChoices(dia_dmt_12970_stonnos_runen);
	Info_AddChoice(dia_dmt_12970_stonnos_runen,Dialog_Back,dia_dmt_12970_stonnos_runen_back);

	if(HEROKNOWS_RECEPT_GURU == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_dmt_12970_stonnos_runen,b_buildlearnstringforrunes(NAME_SPL_GuruRage,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_GuruWrath)),dia_dmt_12970_stonnos_runen_circle_6_recept_guru);
	};
	if(PLAYER_TALENT_RUNES[SPL_Quake] == FALSE)
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_dmt_12970_stonnos_runen,b_buildlearnstringforrunes(NAME_SPL_Quake,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Quake)),dia_dmt_12970_stonnos_runen_circle_6_spl_Quake);
	};
};

func void dia_dmt_12970_stonnos_runen_circle_3_spl_Extricate()
{
	b_teachplayertalentrunesguardians(self,other,SPL_Extricate);
};

func void dia_dmt_12970_stonnos_runen_circle_4_spl_Elevate()
{
	b_teachplayertalentrunesguardians(self,other,SPL_Elevate);
};

func void dia_dmt_12970_stonnos_runen_circle_5_spl_Acid()
{
	b_teachplayertalentrunesguardians(self,other,SPL_Acid);
};

func void dia_dmt_12970_stonnos_runen_circle_6_spl_Quake()
{
	b_teachplayertalentrunesguardians(self,other,SPL_Quake);
};

func void dia_dmt_12970_stonnos_runen_circle_1_spl_sleep()
{
	b_teachplayertalentrunesguardians(self,other,SPL_Sleep);
};

func void dia_dmt_12970_stonnos_runen_circle_1_spl_charm()
{
	b_teachplayertalentrunesguardians(self,other,SPL_Charm);
};

func void dia_dmt_12970_stonnos_runen_circle_2_spl_greententacle()
{
	b_teachplayertalentrunesguardians(self,other,SPL_GreenTentacle);
};

func void dia_dmt_12970_stonnos_runen_circle_2_spl_windfist()
{
	b_teachplayertalentrunesguardians(self,other,SPL_WindFist);
};

func void dia_dmt_12970_stonnos_runen_circle_3_spl_fear()
{
	b_teachplayertalentrunesguardians(self,other,SPL_Fear);
};

func void dia_dmt_12970_stonnos_runen_circle_3_spl_berzerk()
{
	b_teachplayertalentrunesguardians(self,other,SPL_BERZERK);
};

func void dia_dmt_12970_stonnos_runen_circle_4_spl_severefetidity()
{
	b_teachplayertalentrunesguardians(self,other,SPL_SEVEREFETIDITY);
};

func void dia_dmt_12970_stonnos_runen_circle_4_spl_whirlwind()
{
	b_teachplayertalentrunesguardians(self,other,SPL_Whirlwind);
};

func void dia_dmt_12970_stonnos_runen_circle_5_spl_summonswampgolem()
{
	b_teachplayertalentrunesguardians(self,other,SPL_SUMMONSWAMPGOLEM);
};

func void dia_dmt_12970_stonnos_runen_circle_6_recept_guru()
{
	b_teachplayertalentrunesguardians(self,other,SPL_GuruWrath);
};

instance DIA_DMT_12970_STONNOS_GIVEARMORGUARDIANS(C_Info)
{
	npc = dmt_12970_stonnos;
	condition = dia_dmt_12970_stonnos_givearmorguardians_condition;
	information = dia_dmt_12970_stonnos_givearmorguardians_info;
	permanent = FALSE;
	description = "Я отправлюсь в Чертоги Ирдората.";
};

func int dia_dmt_12970_stonnos_givearmorguardians_condition()
{
	if((CHOOSESTONE == TRUE) && (TELLWELCOMEDONE == TRUE) && (ALLGUARDIANSNOLEADERISDEAD == FALSE) && (GUARDIANTEACHMEMAGIC == TRUE) && (MIS_SCKnowsWayToIrdorath == TRUE))
	{
		return TRUE;
	};
};

func void dia_dmt_12970_stonnos_givearmorguardians_info()
{
	AI_Output(other,self,"DIA_DMT_12970_Stonnos_GiveArmorGuardians_01_01");	//Я отправлюсь в Чертоги Ирдората. Я могу рассчитывать на вашу помощь?
	AI_Output(self,other,"DIA_DMT_12970_Stonnos_GiveArmorGuardians_01_02");	//Хранители никогда не вмешиваются в ход божественных распрей. И ты это прекрасно знаешь!
	AI_Output(self,other,"DIA_DMT_12970_Stonnos_GiveArmorGuardians_01_03");	//Однако и на твою судьбу мы не можем взирать безучастно. Ведь ты почти один из нас!
	AI_Output(self,other,"DIA_DMT_12970_Stonnos_GiveArmorGuardians_01_04");	//Поэтому прими от меня в качестве нашей доброй воли этот скромный дар.
	B_GiveInvItems(self,other,ItPo_GuardiansElixir,1);
	AI_Output(other,self,"DIA_DMT_12970_Stonnos_GiveArmorGuardians_01_07");	//Спасибо, мастер.
	AI_Output(self,other,"DIA_DMT_12970_Stonnos_GiveArmorGuardians_01_08");	//Теперь ступай, избранный Стихий! Тебе предстоит еще немало сделать на благо этого мира.
	AI_StopProcessInfos(self);
};

instance DIA_DMT_12970_STONNOS_GIVEELIGORRUNE(C_Info)
{
	npc = dmt_12970_stonnos;
	condition = dia_dmt_12970_stonnos_giveeligorrune_condition;
	information = dia_dmt_12970_stonnos_giveeligorrune_info;
	permanent = FALSE;
	description = "Этому всему я смогу обучиться и у других магов.";
};

func int dia_dmt_12970_stonnos_giveeligorrune_condition()
{
	if((CHOOSESTONE == TRUE) && (DemonologSkill[0] == 6) && (TELLWELCOMEDONE == TRUE) && (ALLGUARDIANSNOLEADERISDEAD == FALSE) && (GUARDIANTEACHMEMAGIC == TRUE) && (Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 4))
	{
		return TRUE;
	};
};

func void dia_dmt_12970_stonnos_giveeligorrune_info()
{
	AI_Output(other,self,"DIA_DMT_12970_Stonnos_GiveEligorRune_01_01");	//Этому всему я смогу обучиться и у других магов.
	AI_Output(self,other,"DIA_DMT_12970_Stonnos_GiveEligorRune_01_02");	//(серьезно) И что же тебе нужно?
	AI_Output(other,self,"DIA_DMT_12970_Stonnos_GiveEligorRune_01_03");	//Неужели это все тайные знания, которые готовы поведать мне Хранители? Я думаю, вы храните и другие секреты.
	AI_Output(self,other,"DIA_DMT_12970_Stonnos_GiveEligorRune_01_04");	//Разумеется, этим наши тайные знания не ограничиваются. Однако даже ты едва ли будешь способен понять некоторые из них.
	AI_Output(self,other,"DIA_DMT_12970_Stonnos_GiveEligorRune_01_05");	//Впрочем, кое-что действительно могло бы заинтересовать тебя.
	AI_Output(self,other,"DIA_DMT_12970_Stonnos_GiveEligorRune_01_06");	//Итак. Каждая из стихий является творцом некоторых различных существ, населяющих пределы этого мира.
	AI_Output(self,other,"DIA_DMT_12970_Stonnos_GiveEligorRune_01_07");	//Эти существа безраздельно и полностью подчиняются воле своих создателей и иногда даже служат им. Нам - Хранителям - тоже подвластна эта сила!
	AI_Output(other,self,"DIA_DMT_12970_Stonnos_GiveEligorRune_01_08");	//А я могу овладеть ей?
	AI_Output(self,other,"DIA_DMT_12970_Stonnos_GiveEligorRune_01_09");	//Возьми эту руну. Она хранит магию, о которой вряд ли знает кто-то кроме нас.
	CreateInvItems(self,itru_eligordemons,1);
	B_GiveInvItems(self,other,itru_eligordemons,1);
	AI_Output(other,self,"DIA_DMT_12970_Stonnos_GiveEligorRune_01_10");	//Что это за руна?
	AI_Output(self,other,"DIA_DMT_12970_Stonnos_GiveEligorRune_01_11");	//С ее помощью ты сможешь призывать в этот мир существ, безраздельно преданных нам и по своей силе не знающих равных.
	AI_Output(other,self,"DIA_DMT_12970_Stonnos_GiveEligorRune_01_12");	//Кто эти существа?
	AI_Output(self,other,"DIA_DMT_12970_Stonnos_GiveEligorRune_01_13");	//Демоны! Демоны пылающего легиона Элигора, повелителя Лэнга!
	AI_Output(self,other,"DIA_DMT_12970_Stonnos_GiveEligorRune_01_14");	//Эти существа на протяжении многих тысячелетий верой и правдой служат нам. Теперь послужат и тебе!
	AI_Output(self,other,"DIA_DMT_12970_Stonnos_GiveEligorRune_01_15");	//Однако помни, что всякому могуществу приходит конец, если им пользоваться неразумно. Это не предостережение, а просто совет.
	AI_StopProcessInfos(self);
};


instance DIA_DMT_12970_STONNOS_TASKS(C_Info)
{
	npc = dmt_12970_stonnos;
	condition = dia_dmt_12970_stonnos_tasks_condition;
	information = dia_dmt_12970_stonnos_tasks_info;
	permanent = FALSE;
	description = "У тебя еще будут для меня какие-нибудь поручения?";
};


func int dia_dmt_12970_stonnos_tasks_condition()
{
	if((CHOOSESTONE == TRUE) && (TELLWELCOMEDONE == TRUE) && (ALLGUARDIANSNOLEADERISDEAD == FALSE) && (GUARDIANTEACHMEMAGIC == TRUE))
	{
		return TRUE;
	};
};

func void dia_dmt_12970_stonnos_tasks_info()
{
	AI_Output(other,self,"DIA_DMT_12970_Stonnos_Tasks_01_01");	//У тебя еще будут для меня какие-нибудь поручения?
	AI_Output(self,other,"DIA_DMT_12970_Stonnos_Tasks_01_02");	//Думаю, пока что нет. Все, что ты мог сделать - ты уже сделал!
	AI_Output(self,other,"DIA_DMT_12970_Stonnos_Tasks_01_03");	//Для других же дел ты, к сожалению, еще не готов.
	AI_Output(self,other,"DIA_DMT_12970_Stonnos_Tasks_01_04");	//Однако если нам вновь понадобится твоя помощь, не сомневайся - мы сами тебя призовем.
};

instance DMT_12971_STONNOS_EXIT(C_Info)
{
	npc = dmt_12971_stonnos;
	nr = 999;
	condition = dmt_12971_stonnos_exit_condition;
	information = dmt_12971_stonnos_exit_info;
	important = FALSE;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int dmt_12971_stonnos_exit_condition()
{
	return TRUE;
};

func void dmt_12971_stonnos_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_DMT_12971_STONNOS_ENDGUARDIANS(C_Info)
{
	npc = dmt_12971_stonnos;
	condition = dia_dmt_12971_stonnos_endguardians_condition;
	information = dia_dmt_12971_stonnos_endguardians_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_dmt_12971_stonnos_endguardians_condition()
{
	if(ALLGUARDIANSNOLEADERISDEAD == TRUE)
	{
		return TRUE;
	};
};

func void dia_dmt_12971_stonnos_endguardians_info()
{
	B_GivePlayerXP(500);
	AI_Output(self,other,"DIA_DMT_12970_Stonnos_EndGuardians_01_00");	//(властно) СТОЙ, СМЕРТНЫЙ! Остановись, где стоишь!
	AI_Output(self,other,"DIA_DMT_12970_Stonnos_EndGuardians_01_01");	//Прежде чем обрушить на меня всю свою силу и мощь, ты должен узнать еще кое о чем.
	AI_Output(other,self,"DIA_DMT_12970_Stonnos_EndGuardians_01_02");	//И что же это?!
	AI_Output(self,other,"DIA_DMT_12970_Stonnos_EndGuardians_01_03");	//Тебе уже многое удалось, и я полагаю, боги этого мира не ошиблись, выбрав именно тебя своим защитником.
	AI_Output(self,other,"DIA_DMT_12970_Stonnos_EndGuardians_01_04");	//Однако ты должен понять, что тебе все равно не удастся нас победить. Ибо мы бессмертны!
	AI_Output(other,self,"DIA_DMT_12970_Stonnos_EndGuardians_01_05");	//Я уже почти это сделал! Дело осталось за малым.
	AI_Output(self,other,"DIA_DMT_12970_Stonnos_EndGuardians_01_06");	//(смеется) На самом деле все обстоит несколько иначе.
	AI_Output(self,other,"DIA_DMT_12970_Stonnos_EndGuardians_01_07");	//Безусловно, из-за тебя нам теперь придется покинуть эту обитель и сокрыться в священных Чертогах Вакхана, коими мы были созданы.
	AI_Output(self,other,"DIA_DMT_12970_Stonnos_EndGuardians_01_08");	//Но единственное, чего ты смог этим добиться - лишь немного отсрочить наш приговор этому миру. Поэтому не стоит полагать, что на этом все и закончится!
	AI_Output(self,other,"DIA_DMT_12970_Stonnos_EndGuardians_01_09");	//Когда-нибудь мы вновь вернемся сюда, дабы опять попытаться воплотить великий замысел Творцов, и ты никак не сможешь этому помешать.
	AI_Output(self,other,"DIA_DMT_12970_Stonnos_EndGuardians_01_10");	//Так что, возможно, наша встреча далеко не последняя, как тебе могло показаться. Я знаю точно - мы еще с тобой встретимся, избранный!
	B_LogEntry(TOPIC_GUARDIANS,"Когда победа над Хранителями была уже близка, последний из них - Стоннос - решил вдруг обратиться ко мне. Судя по его словам, даже если мне сейчас удастся одержать верх над ними, это все равно мало что изменит. Когда-нибудь Хранители вновь решат вернуться в этот мир, чтобы попытаться воплотить свой замысел в жизнь. И эта наша встреча с ним далеко не последняя. Правда, произойдет это теперь довольно нескоро.");
	Info_ClearChoices(dia_dmt_12971_stonnos_endguardians);
	Info_AddChoice(dia_dmt_12971_stonnos_endguardians,Dialog_Ende,dia_dmt_12971_stonnos_endguardians_ok);
};

func void dia_dmt_12971_stonnos_endguardians_ok()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_EnemyOverride] = FALSE;
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
};