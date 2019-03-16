
instance DMT_12150_KELIOS_EXIT(C_Info)
{
	npc = dmt_12150_kelios;
	nr = 999;
	condition = dmt_12150_kelios_exit_condition;
	information = dmt_12150_kelios_exit_info;
	important = FALSE;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dmt_12150_kelios_exit_condition()
{
	return TRUE;
};

func void dmt_12150_kelios_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DMT_12150_KELIOS_HELLO(C_Info)
{
	npc = dmt_12150_kelios;
	condition = dmt_12150_kelios_hello_condition;
	information = dmt_12150_kelios_hello_info;
	important = TRUE;
	permanent = TRUE;
};


func int dmt_12150_kelios_hello_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (CHOOSENATUREISDONE == TRUE) && (TELLWELCOMEDONE == FALSE))
	{
		return TRUE;
	};
};

func void dmt_12150_kelios_hello_info()
{
	if(TELLWHATDONE == FALSE)
	{
		TELLWHATDONE = TRUE;
		if(CHOOSEDARK == TRUE)
		{
			AI_Output(self,other,"DMT_12150_Kelios_Hello_01");	//Тебе следует обратится к Хранителю Даготу, адепт!
			AI_Output(self,other,"DMT_12150_Kelios_Hello_02");	//Теперь он будет твоим наставником.
			AI_Output(self,other,"DMT_12150_Kelios_Hello_03");	//Я же ничем тебе более не могу помочь.
			AI_Output(self,other,"DMT_12150_Kelios_Hello_04");	//Теперь ступай!
			AI_StopProcessInfos(self);
		}
		else if(CHOOSESTONE == TRUE)
		{
			AI_Output(self,other,"DMT_12150_Kelios_Hello_05");	//Тебе следует обратится к Хранителю Стонносу, адепт!
			AI_Output(self,other,"DMT_12150_Kelios_Hello_02");	//Теперь он будет твоим наставником.
			AI_Output(self,other,"DMT_12150_Kelios_Hello_03");	//Я же ничем тебе более не могу помочь.
			AI_Output(self,other,"DMT_12150_Kelios_Hello_04");	//Теперь ступай!
			AI_StopProcessInfos(self);
		}
		else if(CHOOSEWATER == TRUE)
		{
			AI_Output(self,other,"DMT_12150_Kelios_Hello_09");	//Тебе следует обратится к Хранителю Вакону, адепт!
			AI_Output(self,other,"DMT_12150_Kelios_Hello_02");	//Теперь он будет твоим наставником.
			AI_Output(self,other,"DMT_12150_Kelios_Hello_03");	//Я же ничем тебе более не могу помочь.
			AI_Output(self,other,"DMT_12150_Kelios_Hello_04");	//Теперь ступай!
			AI_StopProcessInfos(self);
		}
		else if(CHOOSEFIRE == TRUE)
		{
			AI_Output(self,other,"DMT_12150_Kelios_Hello_13");	//Итак, ты здесь...(вкрадчиво) Что же, тогда добро пожаловать в нашу обитель, герой!
			AI_Output(self,other,"DMT_12150_Kelios_Hello_14");	//Как ты уже наверняка понял, с этого момента я буду являться твоим наставником.
			AI_Output(self,other,"DMT_12150_Kelios_Hello_15");	//Остальные Хранители тоже будут внимательно следить за твоей судьбой. Но не более того!
			AI_Output(self,other,"DMT_12150_Kelios_Hello_16");	//Отныне лишь Огонь твой удел, и только ему теперь ты служишь. Запомни это!
			AI_Output(other,self,"DMT_12150_Kelios_Hello_17");	//Да, мастер! Я все понял.
			AI_Output(self,other,"DMT_12150_Kelios_Hello_18");	//Хорошо!...(вкрадчиво)
			TELLWELCOMEDONE = TRUE;
		};
	}
	else if(CHOOSEFIRE == TRUE)
	{
		AI_Output(self,other,"DMT_12150_Kelios_Hello_19");	//Итак, ты здесь...(вкрадчиво) Что же, тогда добро пожаловать в нашу обитель, герой!
		AI_Output(self,other,"DMT_12150_Kelios_Hello_20");	//Как ты уже наверняка понял, с этого момента я буду являться твоим наставником.
		AI_Output(self,other,"DMT_12150_Kelios_Hello_21");	//Остальные Хранители будут тоже внимательно следить за твоей судьбой. Но не более того!
		AI_Output(self,other,"DMT_12150_Kelios_Hello_22");	//Отныне лишь Огонь - твой удел и только ему теперь ты служишь. Запомни это!
		AI_Output(other,self,"DMT_12150_Kelios_Hello_23");	//Да, мастер! Я все понял.
		TELLWELCOMEDONE = TRUE;
	}
	else
	{
		AI_Output(self,other,"DMT_12150_Kelios_Hello_28");	//Ты уже знаешь, что тебе следует делать.
		AI_Output(self,other,"DMT_12150_Kelios_Hello_04");	//Теперь ступай!
		AI_StopProcessInfos(self);
	};
};


instance DMT_12150_KELIOS_WHATTEACH(C_Info)
{
	npc = dmt_12150_kelios;
	condition = dmt_12150_kelios_whatteach_condition;
	information = dmt_12150_kelios_whatteach_info;
	permanent = TRUE;
	description = "Ты можешь обучить меня магии?";
};


func int dmt_12150_kelios_whatteach_condition()
{
	if((CHOOSEFIRE == TRUE) && (TELLWELCOMEDONE == TRUE) && (GUARDIANTEACHMEMAGIC == FALSE) && (GUARDIANTEACHMEWAR == FALSE))
	{
		return TRUE;
	};
};

func void dmt_12150_kelios_whatteach_info()
{
	AI_Output(other,self,"DMT_12150_Kelios_WhatTeach_00");	//Ты можешь обучить меня магии?
	if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR))
	{
		AI_Output(self,other,"DMT_12150_Kelios_WhatTeach_01");	//Поскольку теперь ты мой ученик...(задумчиво) то я смогу обучить тебя магии, дарованной мне моим создателем.
		AI_Output(self,other,"DMT_12150_Kelios_WhatTeach_03");	//Магия Огня...(серьезно).Эти знания священны и мало кто-либо владел ими.
		AI_Output(self,other,"DMT_12150_Kelios_WhatTeach_04");	//Только избранные были допущены к их познанию и если ты пожелаешь, то в вскором времени тоже станешь одним из их числа!
		AI_Output(self,other,"DMT_12150_Kelios_WhatTeach_06");	//Кроме этого, знание магических кругов - также необходимое условия их познания. Но и этому я смогу тебя обучить, если конечно пожелаешь!
		AI_Output(self,other,"DMT_12150_Kelios_WhatTeach_24");	//И еще кое-что...(вкрадчиво) Поскольку ты теперь являешься адептом нашего круга - прими от меня эту магическую робу послушника.
		CreateInvItems(self,itar_haradrimmage,1);
		B_GiveInvItems(self,other,itar_haradrimmage,1);
		GUARDIANTEACHMEMAGIC = TRUE;
		B_LogEntry(TOPIC_GUARDIANS,"Хранитель Келиос сможет научить меня магии Огня. Если я решу начать свое обучение, мне просто стоит поговорить с ним об этом.");
		AI_StopProcessInfos(self);
	}
	else if((hero.guild == GIL_PAL) || (hero.guild == GIL_DJG) || (hero.guild == GIL_SLD) || (hero.guild == GIL_TPL) || (hero.guild == GIL_MIL))
	{
		AI_Output(self,other,"DMT_12150_Kelios_WhatTeach_10");	//Ну, поскольку ты воин...(задумчиво) То я навряд ли смогу обучить тебя магии, дарованной мне моим создателем.
		AI_Output(self,other,"DMT_12150_Kelios_WhatTeach_11");	//Однако ты можешь поговорить с Таринаксом - наставником асгардов, воинов стихий.
		AI_Output(self,other,"DMT_12150_Kelios_WhatTeach_12");	//Думаю, он поможет тебе в твоем обучении.
		AI_Output(other,self,"DMT_12150_Kelios_WhatTeach_13");	//Хорошо, я так и сделаю.
		GUARDIANTEACHMEWAR = TRUE;
		B_LogEntry(TOPIC_GUARDIANS,"Чтобы начать свое обучение, мне стоит поговорить с Таринаксом - наставником асгардов, воинов стихий.");
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DMT_12150_Kelios_WhatTeach_14");	//Пока ничему...(сеьезно) Ты еще не готов познать всю мудрость, дарованную Хранителям!
		AI_Output(self,other,"DMT_12150_Kelios_WhatTeach_15");	//Ты еще слишком слаб! Возвращайся, когда ты будешь готов к этому и я открою тебе наши тайны.
	};
};


instance DMT_12150_KELIOS_HELLOBACK(C_Info)
{
	npc = dmt_12150_kelios;
	condition = dmt_12150_kelios_helloback_condition;
	information = dmt_12150_kelios_helloback_info;
	important = TRUE;
	permanent = TRUE;
};


func int dmt_12150_kelios_helloback_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (TELLWELCOMEDONE == TRUE) && (CHOOSENATUREISDONE == TRUE) && (GUARDIANTEACHMEWAR == TRUE))
	{
		return TRUE;
	};
};

func void dmt_12150_kelios_helloback_info()
{
	AI_Output(self,other,"DMT_12150_Kelios_HelloBack_01");	//Ты уже знаешь, что тебе следует делать.
	AI_Output(self,other,"DMT_12150_Kelios_Hello_04");	//Теперь ступай!
	AI_StopProcessInfos(self);
};


instance DMT_12150_KELIOS_EXPLAINCIRCLES(C_Info)
{
	npc = dmt_12150_kelios;
	condition = dmt_12150_kelios_explaincircles_condition;
	information = dmt_12150_kelios_explaincircles_info;
	permanent = FALSE;
	description = "Пожалуйста, объясни мне, в чем смысл магических Кругов?";
};


func int dmt_12150_kelios_explaincircles_condition()
{
	if((CHOOSEFIRE == TRUE) && (TELLWELCOMEDONE == TRUE) && (GUARDIANTEACHMEMAGIC == TRUE))
	{
		return TRUE;
	};
};

func void dmt_12150_kelios_explaincircles_info()
{
	AI_Output(other,self,"DMT_12150_Kelios_EXPLAINCIRCLES_Info_15_01");	//Объясни мне, в чем смысл магических Кругов?
	AI_Output(self,other,"DMT_12150_Kelios_EXPLAINCIRCLES_Info_14_02");	//Хорошо.Круги символизируют твое понимание магии.
	AI_Output(self,other,"DMT_12150_Kelios_EXPLAINCIRCLES_Info_14_03");	//Они обозначают уровень твоих знаний и навыков, способность обучаться новым заклинаниям.
	AI_Output(self,other,"DMT_12150_Kelios_EXPLAINCIRCLES_Info_14_04");	//Ты должен пройти каждый Круг до конца, прежде чем сможешь вступить в следующий.
	AI_Output(self,other,"DMT_12150_Kelios_EXPLAINCIRCLES_Info_14_05");	//Потребуются долгие часы обучения и намного больше опыта, чтобы достичь высших Кругов.
	AI_Output(self,other,"DMT_12150_Kelios_EXPLAINCIRCLES_Info_14_06");	//Твои старания каждый раз будут вознаграждаться новыми могущественными заклинаниями. Но в любом случае магические Круги значат куда больше.
	AI_Output(self,other,"DMT_12150_Kelios_EXPLAINCIRCLES_Info_14_07");	//Для того чтобы понять их силу, ты должен познать себя.
	EXPLAINCIRCLEMEAN = TRUE;
};


var int dia_dmt_12150_kelios_circle_noperm;

instance DIA_DMT_12150_KELIOS_CIRCLE(C_Info)
{
	npc = dmt_12150_kelios;
	nr = 99;
	condition = dia_dmt_12150_kelios_circle_condition;
	information = dia_dmt_12150_kelios_circle_info;
	permanent = TRUE;
	description = "Я хочу постигать суть магии.";
};


func int dia_dmt_12150_kelios_circle_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) <= 6) && (CHOOSEFIRE == TRUE) && (TELLWELCOMEDONE == TRUE) && (GUARDIANTEACHMEMAGIC == TRUE) && (DIA_DMT_12150_KELIOS_CIRCLE_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_dmt_12150_kelios_circle_info()
{
	AI_Output(other,self,"DIA_DMT_12150_Kelios_CIRCLE_15_00");	//Я хочу постигать суть магии.
	Info_ClearChoices(DIA_DMT_12150_Kelios_CIRCLE);
	Info_AddChoice(DIA_DMT_12150_Kelios_CIRCLE,Dialog_Back,DIA_DMT_12150_Kelios_CIRCLE_Back);

	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) < 1)
	{
		Info_AddChoice(DIA_DMT_12150_Kelios_CIRCLE,"1 Круг магии (Очков обучения: 20)",DIA_DMT_12150_Kelios_CIRCLE_1);
	}
	else if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 1) && (Kapitel >= 2))
	{
		Info_AddChoice(DIA_DMT_12150_Kelios_CIRCLE,"2 Круг магии (Очков обучения: 30)",DIA_DMT_12150_Kelios_CIRCLE_2);
	}
	else if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 2) && (Kapitel >= 3))
	{
		Info_AddChoice(DIA_DMT_12150_Kelios_CIRCLE,"3 Круг магии (Очков обучения: 40)",DIA_DMT_12150_Kelios_CIRCLE_3);
	}
	else if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 3) && (MIS_ReadyforChapter4 == TRUE))
	{
		Info_AddChoice(DIA_DMT_12150_Kelios_CIRCLE,"4 Круг магии (Очков обучения: 60)",DIA_DMT_12150_Kelios_CIRCLE_4);
	}
	else if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 4) && (Kapitel >= 5))
	{
		Info_AddChoice(DIA_DMT_12150_Kelios_CIRCLE,"5 Круг магии (Очков обучения: 80)",DIA_DMT_12150_Kelios_CIRCLE_5);
	}
	else if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 5) && (Kapitel >= 5) && (MIS_DarkOrden == LOG_Success) && (MIS_JarCurse == LOG_Success) && (MIS_URNAZULRAGE == LOG_SUCCESS))
	{
		Info_AddChoice(DIA_DMT_12150_Kelios_CIRCLE,"6 Круг магии (Очков обучения: 100)",DIA_DMT_12150_Kelios_CIRCLE_6);
	}
	else
	{
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_42");	//Ты еще не готов к этому! Возвращайся позже.
	};
};

func void DIA_DMT_12150_Kelios_CIRCLE_Back()
{
	Info_ClearChoices(DIA_DMT_12150_Kelios_CIRCLE);
};

func void DIA_DMT_12150_Kelios_CIRCLE_1()
{
	if(B_TeachMagicCircle(self,other,1))
	{
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_0A");	//Готов ли ты вступить в следующий круг магии?
		AI_Output(other,self,"DIA_DMT_12150_Kelios_CIRCLE_15_01");	//Да, мастер. Я готов.
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_01");	//Вступив в Первый Круг, ты научишься использовать магические руны.
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_02");	//Каждая руна содержит структуру особого магического заклинания.
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_03");	//Использовав свою собственную магическую силу, ты сможешь высвободить магию руны.
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_04");	//Но в отличие от свитков, которые по сути являются магическими формулами, магия рун поддерживает структуру заклинания всегда.
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_05");	//Каждая руна таит в себе магическую силу, которую ты можешь забрать в любой момент.
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_06");	//Так же, как и со свитком, в момент, когда ты используешь руну, расходуется твоя собственная магическая сила.
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_07");	//С каждым новым Кругом ты будешь узнавать о рунах все больше и больше.
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_08");	//Используй их силу для того, чтобы познать себя.
	};
	Info_ClearChoices(DIA_DMT_12150_Kelios_CIRCLE);
};

func void DIA_DMT_12150_Kelios_CIRCLE_2()
{
	if(B_TeachMagicCircle(self,other,2))
	{
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_0A");	//Готов ли ты вступить в следующий круг магии?
		AI_Output(other,self,"DIA_DMT_12150_Kelios_CIRCLE_15_02");	//Да, мастер. Я готов.
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_09");	//Ты уже научился понимать руны. Пришло время углубить твои познания.
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_10");	//Вступив во Второй Круг, ты постигнешь основы мощных боевых заклятий.
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_11");	//Но для того чтобы познать истинные секреты магии, тебе предстоит многому научиться.
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_12");	//Ты уже знаешь о том, что можешь использовать любую руну бессчетное число раз, но лишь до тех пор, пока не израсходуешь собственную магическую силу.
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_13");	//Но прежде чем сделать что-либо, подумай о том, есть ли в этом смысл. Ты обладаешь силой, которая позволяет с легкостью сеять смерть и разрушения.
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_14");	//Но истинный маг использует ее лишь по необходимости.
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_15");	//Научись оценивать ситуацию, и ты познаешь истинную силу рун.
	};
	Info_ClearChoices(DIA_DMT_12150_Kelios_CIRCLE);
};

func void DIA_DMT_12150_Kelios_CIRCLE_3()
{
	if(B_TeachMagicCircle(self,other,3))
	{
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_0A");	//Готов ли ты вступить в следующий круг магии?
		AI_Output(other,self,"DIA_DMT_12150_Kelios_CIRCLE_15_03");	//Да, мастер. Я готов.
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_16");	//Третий Круг является одним из важнейших этапов в жизни каждого мага. Достигнув его, ты завершаешь свой поиск.
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_17");	//Ты уже преодолел значительный этап на пути магии. Ты научился использовать руны.
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_18");	//Это знание послужит основой для следующего этапа. Используй руны осмотрительно.
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_19");	//Ты можешь использовать их или нет. Но ты должен определиться с выбором.
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_20");	//Сделав выбор, используй свою силу без колебаний.
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_21");	//Найди свой путь, и тогда ты познаешь силу решения.
	};
	Info_ClearChoices(DIA_DMT_12150_Kelios_CIRCLE);
};

func void DIA_DMT_12150_Kelios_CIRCLE_4()
{
	if(B_TeachMagicCircle(self,other,4))
	{
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_0A");	//Готов ли ты вступить в следующий круг магии?
		AI_Output(other,self,"DIA_DMT_12150_Kelios_CIRCLE_15_04");	//Да, мастер. Я готов.
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_22");	//Ты завершил первые три Круга. Пришло время тебе постичь секреты магии.
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_23");	//Основа магии рун - камень. Магический камень, добытый из магической руды.
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_24");	//Это та самая руда, которую добывают в шахтах. В храмах она наделяется магическими формулами, и там же руны превращаются в орудия нашей силы.
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_25");	//Теперь ты обладаешь всеми знаниями, которые были накоплены храмами.
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_27");	//Познай магию, и ты откроешь для себя секрет власти.
	};
	Info_ClearChoices(DIA_DMT_12150_Kelios_CIRCLE);
};

func void DIA_DMT_12150_Kelios_CIRCLE_5()
{
	if(B_TeachMagicCircle(self,other,5))
	{
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_0A");	//Готов ли ты вступить в следующий круг магии?
		AI_Output(other,self,"DIA_DMT_12150_Kelios_CIRCLE_15_05");	//Да, мастер. Я готов.
		AI_Output(other,self,"DIA_DMT_12150_Kelios_CIRCLE_15_5A");	//Да будет так. Я открою тебе истинный смысл Пятого Круга.
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_31");	//Познай предел своих возможностей, и ты познаешь свою истинную силу.
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_32");	//Заклинания, которые ты сможешь изучать, могут быть воистину разрушительными.
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_33");	//Так что знай меру своей силе и остерегайся мании величия.
	};
	Info_ClearChoices(DIA_DMT_12150_Kelios_CIRCLE);
};

func void DIA_DMT_12150_Kelios_CIRCLE_6()
{
	if(B_TeachMagicCircle(self,other,6))
	{
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_34");	//Я подниму тебя в Шестой Круг магии.
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_35");	//Заметь, в Шестой Круг могут вступить лишь самые могущественные из магов. Он предназначен для тех, чья жизнь - это знак.
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_38");	//Как ты уже знаешь, твой знак - это Скала!
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_39");	//Шестой Круг позволит тебе использовать магию любой руны.
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_40");	//И не забудь: не захватывать силу, но быть ее источником.
		AI_Output(self,other,"DIA_DMT_12150_Kelios_CIRCLE_14_41");	//Будь мудр и рассудителен в своих деяниях!
		DIA_DMT_12150_KELIOS_CIRCLE_NOPERM = TRUE;
	};
	Info_ClearChoices(DIA_DMT_12150_Kelios_CIRCLE);
};

instance DIA_DMT_12150_KELIOS_TEACH_MANA(C_Info)
{
	npc = dmt_12150_kelios;
	nr = 10;
	condition = dia_dmt_12150_kelios_teach_mana_condition;
	information = dia_dmt_12150_kelios_teach_mana_info;
	permanent = TRUE;
	description = "Я хочу увеличить свою магическую энергию.";
};


func int dia_dmt_12150_kelios_teach_mana_condition()
{
	if((CHOOSEFIRE == TRUE) && (TELLWELCOMEDONE == TRUE) && (GUARDIANTEACHMEMAGIC == TRUE) && (hero.attribute[ATR_MANA_MAX] < T_MEGA))
	{
		return TRUE;
	};
};

func void dia_dmt_12150_kelios_teach_mana_info()
{
	AI_Output(other,self,"DIA_DMT_12150_Kelios_TEACH_MANA_15_00");	//Я хочу увеличить свою магическую энергию.
	Info_ClearChoices(dia_dmt_12150_kelios_teach_mana);
	Info_AddChoice(dia_dmt_12150_kelios_teach_mana,Dialog_Back,dia_dmt_12150_kelios_teach_mana_back);
	Info_AddChoice(dia_dmt_12150_kelios_teach_mana,B_BuildLearnString(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_dmt_12150_kelios_teach_mana_1);
	Info_AddChoice(dia_dmt_12150_kelios_teach_mana,B_BuildLearnString(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_dmt_12150_kelios_teach_mana_5);
};

func void dia_dmt_12150_kelios_teach_mana_back()
{
	if(other.attribute[ATR_MANA_MAX] >= T_MEGA)
	{
		AI_Output(self,other,"DIA_DMT_12150_Kelios_TEACH_MANA_05_00");	//Ты на пределе своих возможностей!
	};
	Info_ClearChoices(dia_dmt_12150_kelios_teach_mana);
};

func void dia_dmt_12150_kelios_teach_mana_1()
{
	b_teachattributepointstarinaks(self,other,ATR_MANA_MAX,1,T_MEGA);
	Info_ClearChoices(dia_dmt_12150_kelios_teach_mana);
	Info_AddChoice(dia_dmt_12150_kelios_teach_mana,Dialog_Back,dia_dmt_12150_kelios_teach_mana_back);
	Info_AddChoice(dia_dmt_12150_kelios_teach_mana,B_BuildLearnString(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_dmt_12150_kelios_teach_mana_1);
	Info_AddChoice(dia_dmt_12150_kelios_teach_mana,B_BuildLearnString(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_dmt_12150_kelios_teach_mana_5);
};

func void dia_dmt_12150_kelios_teach_mana_5()
{
	b_teachattributepointstarinaks(self,other,ATR_MANA_MAX,5,T_MEGA);
	Info_ClearChoices(dia_dmt_12150_kelios_teach_mana);
	Info_AddChoice(dia_dmt_12150_kelios_teach_mana,Dialog_Back,dia_dmt_12150_kelios_teach_mana_back);
	Info_AddChoice(dia_dmt_12150_kelios_teach_mana,B_BuildLearnString(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_dmt_12150_kelios_teach_mana_1);
	Info_AddChoice(dia_dmt_12150_kelios_teach_mana,B_BuildLearnString(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_dmt_12150_kelios_teach_mana_5);
};


instance DIA_DMT_12150_KELIOS_TEACH(C_Info)
{
	npc = dmt_12150_kelios;
	nr = 3;
	condition = dia_dmt_12150_kelios_teach_condition;
	information = dia_dmt_12150_kelios_teach_info;
	permanent = TRUE;
	description = "Научи меня создавать руны Огня.";
};


func int dia_dmt_12150_kelios_teach_condition()
{
	if((CHOOSEFIRE == TRUE) && (TELLWELCOMEDONE == TRUE) && (GUARDIANTEACHMEMAGIC == TRUE))
	{
		return TRUE;
	};
};

func void dia_dmt_12150_kelios_teach_info()
{
	AI_Output(other,self,"DIA_DMT_12150_Kelios_TEACH_15_00");	//Научи меня создавать руны Огня.
	AI_Output(self,other,"DIA_DMT_12150_Kelios_TEACH_15_01");	//Хорошо! Что ты именно хочешь узнать?
	Info_ClearChoices(dia_dmt_12150_kelios_teach);
	Info_AddChoice(dia_dmt_12150_kelios_teach,Dialog_Back,dia_dmt_12150_kelios_teach_back);

	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 1) && (PLAYER_TALENT_RUNES[SPL_Firebolt] == FALSE))
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_dmt_12150_kelios_teach,B_BuildLearnString(NAME_SPL_Firebolt,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Firebolt)),dia_dmt_12150_kelios_teach_firebolt);
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2) && (PLAYER_TALENT_RUNES[SPL_InstantFireball] == FALSE))
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_dmt_12150_kelios_teach,B_BuildLearnString(NAME_SPL_InstantFireball,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_InstantFireball)),dia_dmt_12150_kelios_teach_instantfireball);
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2) && (PLAYER_TALENT_RUNES[SPL_RapidFirebolt] == FALSE) && (LegoSpells == TRUE))
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_dmt_12150_kelios_teach,B_BuildLearnString(NAME_SPL_RapidFirebolt,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_RapidFirebolt)),dia_dmt_12150_kelios_teach_RapidFirebolt);
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3) && (PLAYER_TALENT_RUNES[SPL_Firestorm] == FALSE))
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_dmt_12150_kelios_teach,B_BuildLearnString(NAME_SPL_Firestorm,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Firestorm)),dia_dmt_12150_kelios_teach_firestorm);
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3) && (PLAYER_TALENT_RUNES[80] == FALSE))
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_dmt_12150_kelios_teach,B_BuildLearnString(NAME_SPL_SUMMONFIREGOLEM,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SUMMONFIREGOLEM)),dia_dmt_12150_kelios_teach_summonfiregolem);
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3) && (PLAYER_TALENT_RUNES[SPL_MagicCage] == FALSE))
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_dmt_12150_kelios_teach,B_BuildLearnString(NAME_SPL_MagicCage,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_MagicCage)),dia_dmt_12150_kelios_teach_MagicCage);
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 4) && (PLAYER_TALENT_RUNES[SPL_ChargeFireball] == FALSE))
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_dmt_12150_kelios_teach,B_BuildLearnString(NAME_SPL_ChargeFireball,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_ChargeFireball)),dia_dmt_12150_kelios_teach_chargefireball);
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 4) && (PLAYER_TALENT_RUNES[93] == FALSE))
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_dmt_12150_kelios_teach,B_BuildLearnString(NAME_SPL_FIRELIGHT,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_FIRELIGHT)),dia_dmt_12150_kelios_teach_firelight);
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 5) && (PLAYER_TALENT_RUNES[SPL_Pyrokinesis] == FALSE))
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_dmt_12150_kelios_teach,B_BuildLearnString(NAME_SPL_Pyrokinesis,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Pyrokinesis)),dia_dmt_12150_kelios_teach_pyrokinesis);
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 5) && (PLAYER_TALENT_RUNES[SPL_Explosion] == FALSE))
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_dmt_12150_kelios_teach,B_BuildLearnString(NAME_SPL_Explosion,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Explosion)),dia_dmt_12150_kelios_teach_Explosion);
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 6) && (PLAYER_TALENT_RUNES[SPL_Firerain] == FALSE))
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_dmt_12150_kelios_teach,B_BuildLearnString(NAME_SPL_Firerain,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Firerain)),dia_dmt_12150_kelios_teach_firerain);
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 6) && (PLAYER_TALENT_RUNES[SPL_FireMeteor] == FALSE))
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(dia_dmt_12150_kelios_teach,B_BuildLearnString(NAME_SPL_FireMeteor,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_FireMeteor)),dia_dmt_12150_kelios_teach_firemeteor);
	};
};

func void dia_dmt_12150_kelios_teach_back()
{
	Info_ClearChoices(dia_dmt_12150_kelios_teach);
};

func void dia_dmt_12150_kelios_teach_firebolt()
{
	b_teachplayertalentrunesguardians(self,other,SPL_Firebolt);
};

func void dia_dmt_12150_kelios_teach_instantfireball()
{
	b_teachplayertalentrunesguardians(self,other,SPL_InstantFireball);
};

func void dia_dmt_12150_kelios_teach_RapidFirebolt()
{
	b_teachplayertalentrunesguardians(self,other,SPL_RapidFirebolt);
};

func void dia_dmt_12150_kelios_teach_Explosion()
{
	b_teachplayertalentrunesguardians(self,other,SPL_Explosion);
};

func void dia_dmt_12150_kelios_teach_MagicCage()
{
	b_teachplayertalentrunesguardians(self,other,SPL_MagicCage);
};

func void dia_dmt_12150_kelios_teach_chargefireball()
{
	b_teachplayertalentrunesguardians(self,other,SPL_ChargeFireball);
};

func void dia_dmt_12150_kelios_teach_firelight()
{
	CreateInvItems(self,itwr_firelight,1);
	B_GiveInvItems(self,other,itwr_firelight,1);
	b_teachplayertalentrunesguardians(self,other,SPL_FIRELIGHT);
};

func void dia_dmt_12150_kelios_teach_pyrokinesis()
{
	b_teachplayertalentrunesguardians(self,other,SPL_Pyrokinesis);
};

func void dia_dmt_12150_kelios_teach_firestorm()
{
	b_teachplayertalentrunesguardians(self,other,SPL_Firestorm);
};

func void dia_dmt_12150_kelios_teach_summonfiregolem()
{
	b_teachplayertalentrunesguardians(self,other,SPL_SUMMONFIREGOLEM);
};

func void dia_dmt_12150_kelios_teach_firerain()
{
	b_teachplayertalentrunesguardians(self,other,SPL_Firerain);
};

func void dia_dmt_12150_kelios_teach_firemeteor()
{
	b_teachplayertalentrunesguardians(self,other,SPL_FireMeteor);
};


instance DIA_DMT_12150_KELIOS_GIVEARMORGUARDIANS(C_Info)
{
	npc = dmt_12150_kelios;
	condition = dia_dmt_12150_kelios_givearmorguardians_condition;
	information = dia_dmt_12150_kelios_givearmorguardians_info;
	permanent = FALSE;
	description = "Я отправлюсь в Чертоги Ирдората.";
};


func int dia_dmt_12150_kelios_givearmorguardians_condition()
{
	if((CHOOSEFIRE == TRUE) && (TELLWELCOMEDONE == TRUE) && (ALLGUARDIANSNOLEADERISDEAD == FALSE) && (GUARDIANTEACHMEMAGIC == TRUE) && (MIS_SCKnowsWayToIrdorath == TRUE))
	{
		return TRUE;
	};
};

func void dia_dmt_12150_kelios_givearmorguardians_info()
{
	AI_Output(other,self,"DIA_DMT_12150_Kelios_GiveArmorGuardians_01_01");	//Я отправлюсь в Чертоги Ирдората. Я могу рассчитывать на вашу помощь?
	AI_Output(self,other,"DIA_DMT_12150_Kelios_GiveArmorGuardians_01_02");	//Хммм...(задумчиво) Хранители обычно никогда не вмешиваются в ход божественных распрей. И ты это прекрасно знаешь!
	AI_Output(self,other,"DIA_DMT_12150_Kelios_GiveArmorGuardians_01_03");	//Однако и на твою судьбу мы все тоже не можем взирать безучастно. Ведь ты почти один из нас!
	AI_Output(self,other,"DIA_DMT_12150_Kelios_GiveArmorGuardians_01_04");	//Поэтому прими от меня в качестве нашей доброй воли этот скромный дар.
	B_GiveInvItems(self,other,ItPo_GuardiansElixir,1);
	AI_Output(self,other,"DIA_DMT_12150_Kelios_GiveArmorGuardians_01_06");	//Это не много из того, что мы можем тебе предложить, но и не мало. Остальное зависит только от тебя!
	AI_Output(other,self,"DIA_DMT_12150_Kelios_GiveArmorGuardians_01_07");	//Спасибо, мастер.
	AI_Output(self,other,"DIA_DMT_12150_Kelios_GiveArmorGuardians_01_08");	//Теперь ступай, избранный Стихий! Тебе предстоит еще немало сделать на благо этого мира.
	AI_StopProcessInfos(self);
};


instance DIA_DMT_12150_KELIOS_GIVEELIGORRUNE(C_Info)
{
	npc = dmt_12150_kelios;
	condition = dia_dmt_12150_kelios_giveeligorrune_condition;
	information = dia_dmt_12150_kelios_giveeligorrune_info;
	permanent = FALSE;
	description = "Этому всему я смогу обучиться и у других магов.";
};


func int dia_dmt_12150_kelios_giveeligorrune_condition()
{
	if((CHOOSEFIRE == TRUE) && (DemonologSkill[0] == 6) && (TELLWELCOMEDONE == TRUE) && (ALLGUARDIANSNOLEADERISDEAD == FALSE) && (GUARDIANTEACHMEMAGIC == TRUE) && (Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 4))
	{
		return TRUE;
	};
};

func void dia_dmt_12150_kelios_giveeligorrune_info()
{
	AI_Output(other,self,"DIA_DMT_12150_Kelios_GiveEligorRune_01_01");	//Этому всему я смогу обучиться и у других магов.
	AI_Output(self,other,"DIA_DMT_12150_Kelios_GiveEligorRune_01_02");	//И что же тебе нужно?
	AI_Output(other,self,"DIA_DMT_12150_Kelios_GiveEligorRune_01_03");	//Неужели это все тайные знания, которые готовы поведать мне Хранители? Я думаю, вы храните и другие секреты.
	AI_Output(self,other,"DIA_DMT_12150_Kelios_GiveEligorRune_01_06");	//Первое, что тебе надо понять, - это то, что каждая из стихий является творцом некоторых различных существ, населяющих пределы этого мира.
	AI_Output(self,other,"DIA_DMT_12150_Kelios_GiveEligorRune_01_07");	//Эти существа безраздельно и полностью подчиняются воле своих создателей и иногда даже служат им. Нам, Хранителям, тоже подвластна эта сила!
	AI_Output(other,self,"DIA_DMT_12150_Kelios_GiveEligorRune_01_08");	//А я могу овладеть ей?
	AI_Output(self,other,"DIA_DMT_12150_Kelios_GiveEligorRune_01_09");	//Вот, возьми эту руну! Она хранит магию, о которой навряд ли знает кто-то еще, кроме нас.
	CreateInvItems(self,itru_eligordemons,1);
	B_GiveInvItems(self,other,itru_eligordemons,1);
	AI_Output(other,self,"DIA_DMT_12150_Kelios_GiveEligorRune_01_10");	//Что это за руна?
	AI_Output(self,other,"DIA_DMT_12150_Kelios_GiveEligorRune_01_11");	//С ее помощью ты сможешь призывать в этот мир существ, безраздельно преданных нам и по своей силе незнающих равных.
	AI_Output(other,self,"DIA_DMT_12150_Kelios_GiveEligorRune_01_12");	//Кто эти существа?!
	AI_Output(self,other,"DIA_DMT_12150_Kelios_GiveEligorRune_01_13");	//Демоны! Демоны пылающего легиона Элигора, повелителя Лэнга!
	AI_Output(self,other,"DIA_DMT_12150_Kelios_GiveEligorRune_01_14");	//Эти существа на протяжении многих тысячелетий верой и правдой служат нам. Теперь послужат и тебе!
	AI_Output(self,other,"DIA_DMT_12150_Kelios_GiveEligorRune_01_15");	//Однако помни, что всякому могуществу приходит конец, если им пользоваться неразумно. Это, так скажем, не предостережение, а просто совет.
	AI_StopProcessInfos(self);
};


instance DMT_12150_KELIOS_TASKS(C_Info)
{
	npc = dmt_12150_kelios;
	condition = dmt_12150_kelios_tasks_condition;
	information = dmt_12150_kelios_tasks_info;
	permanent = FALSE;
	description = "У тебя еще будут для меня какие-нибудь поручения?";
};


func int dmt_12150_kelios_tasks_condition()
{
	if((CHOOSEFIRE == TRUE) && (TELLWELCOMEDONE == TRUE) && (GUARDIANTEACHMEMAGIC == TRUE))
	{
		return TRUE;
	};
};

func void dmt_12150_kelios_tasks_info()
{
	AI_Output(other,self,"DMT_12150_Kelios_Tasks_01_01");	//У тебя еще будут для меня какие-нибудь поручения?
	AI_Output(self,other,"DMT_12150_Kelios_Tasks_01_02");	//Думаю, пока что нет...(серьезно) Все, что ты мог - ты уже сделал!
	AI_Output(self,other,"DMT_12150_Kelios_Tasks_01_03");	//Для других же дел, ты к сожалению еще не готов.
	AI_Output(self,other,"DMT_12150_Kelios_Tasks_01_04");	//Однако если нам вновь вдруг понадобится твоя помощь, не сомневайся - мы тебя призовем сами.
};

