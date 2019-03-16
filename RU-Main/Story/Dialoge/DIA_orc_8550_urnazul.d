
instance DIA_ORC_8550_URNAZUL_EXIT(C_Info)
{
	npc = orc_8550_urnazul;
	condition = dia_orc_8550_urnazul_exit_condition;
	information = dia_orc_8550_urnazul_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};


func int dia_orc_8550_urnazul_exit_condition()
{
	return TRUE;
};

func void dia_orc_8550_urnazul_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ORC_8550_URNAZUL_HIFIRST(C_Info)
{
	npc = orc_8550_urnazul;
	condition = dia_orc_8550_urnazul_hifirst_condition;
	information = dia_orc_8550_urnazul_hifirst_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_orc_8550_urnazul_hifirst_condition()
{
	if(MEETURNAZUL == FALSE)
	{
		return TRUE;
	};
};

func void dia_orc_8550_urnazul_hifirst_info()
{
	B_GivePlayerXP(200);
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Hello_Info_18_01");	//Не верить своим глазам! Человек? Кто пустить тебя?!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Hello_Info_18_02");	//Быть очень смелый или очень глупый, чтобы приходить сюда.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Hello_Info_18_03");	//Фаррок пропустил меня. Я пришел поговорить с тобой, Ур-Тралл.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Hello_Info_18_04");	//Должен быть очень серьезный повод, чтобы Ур-Тралл слушать человек.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Hello_Info_18_05");	//Если не быть - человек умирать сейчас!!! Улу-Мулу не помочь, чужак.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Hello_Info_18_06");	//Теперь человек говорить - Ур-Тралл слушать.
	MEETURNAZUL = TRUE;
};

instance DIA_ORC_8550_URNAZUL_LostPaladins(C_Info)
{
	npc = orc_8550_urnazul;
	condition = dia_orc_8550_urnazul_LostPaladins_condition;
	information = dia_orc_8550_urnazul_LostPaladins_info;
	permanent = FALSE;
	description = "У меня еще один вопрос к тебе.";
};

func int dia_orc_8550_urnazul_LostPaladins_condition()
{
	if((MIS_LostPaladins == LOG_Running) && (KnowVenzelOrcs == TRUE))
	{
		return TRUE;
	};
};

func void dia_orc_8550_urnazul_LostPaladins_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_LostPaladins_01_01");	//У меня к тебе еще один вопрос.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_LostPaladins_01_02");	//Человек может задать его, если хотеть.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_LostPaladins_01_03");	//Твои воины, случайно, не брали недавно в плен какого-нибудь паладина?
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_LostPaladins_01_04");	//(задумчиво) Ур-Тралл думать, что нет. Иначе он бы знать об этом.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_LostPaladins_01_05");	//Паладин быть очень хороший воин и много знать план война люди.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_LostPaladins_01_06");	//Только вряд ли он бы стал тебе что-нибудь рассказывать.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_LostPaladins_01_07");	//(смеется) Человек просто не знать, как братья уметь доставать правда из люди.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_LostPaladins_01_08");	//Если бы он попасть к оркам в плен, то Ур-Тралл обязательно заставить его говорить!
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_LostPaladins_01_09");	//Даже не хочу знать, как вы это делаете.
	B_LogEntry(TOPIC_LostPaladins,"Вождь орков Ур-Тралл ничего не знает про паладинов. Или же просто не догадывается, что кто-то из пленных может быть паладином - иначе бы тому не поздоровилось.");
};

instance DIA_ORC_8550_URNAZUL_KnowVenzelOrcs(C_Info)
{
	npc = orc_8550_urnazul;
	condition = dia_orc_8550_urnazul_KnowVenzelOrcs_condition;
	information = dia_orc_8550_urnazul_KnowVenzelOrcs_info;
	permanent = FALSE;
	description = "А что вы тогда делаете с пленными?";
};

func int dia_orc_8550_urnazul_KnowVenzelOrcs_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Orc_8550_UrNazul_LostPaladins) && (MIS_LostPaladins == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_orc_8550_urnazul_KnowVenzelOrcs_info()
{
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_KnowVenzelOrcs_01_01");	//А что вы тогда делаете с пленными?
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_KnowVenzelOrcs_01_02");	//Если человек быть сильный, то он идти работать в железный шахта.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_KnowVenzelOrcs_01_03");	//А если нет, то братья его просто есть. Тот быть бесполезный для орков.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_KnowVenzelOrcs_01_04");	//У вас есть железная шахта?
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_KnowVenzelOrcs_01_05");	//Человек это удивлять? Или как, он думать, орки делать себе доспех и меч, чтобы сражаться?
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_KnowVenzelOrcs_01_06");	//Выходит, что все пленные работают в вашей железной шахте. А туда можно как-то попасть?
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_KnowVenzelOrcs_01_07");	//Аррргххх...(гневно) Человек задавать слишком много вопросов!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_KnowVenzelOrcs_01_08");	//Он больше ничего не сказать человек. Ур-Тралл не доверять ему.
	B_LogEntry(TOPIC_LostPaladins,"Все пленные попадают либо в железную шахту орков, либо в их желудок. Мне остается только одно - попробовать как-то попасть туда и выяснить, есть ли среди пленных паладин. Однако Ур-Тралл наотрез отказался говорить об этом, поскольку не доверяет мне. Надо как-то исправить это.");
	MustGoInIronMine = TRUE;
};

instance DIA_ORC_8550_URNAZUL_Psicamp(C_Info)
{
	npc = orc_8550_urnazul;
	condition = dia_orc_8550_urnazul_Psicamp_condition;
	information = dia_orc_8550_urnazul_Psicamp_info;
	permanent = FALSE;
	description = "Я хочу поговорить с тобой о храме на болотах.";
};

func int dia_orc_8550_urnazul_Psicamp_condition()
{
	if((MEETURNAZUL == TRUE) && (MIS_PsicampDemon == LOG_Running) && (HoshNarSentMe == TRUE) && (DemonPsicampIsDead == FALSE))
	{
		return TRUE;
	};
};

func void dia_orc_8550_urnazul_Psicamp_info()
{
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Psicamp_01_01");	//Я хочу поговорить с тобой о храме на болотах.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Psicamp_01_02");	//(недовольно) Что человек хотеть сказать Ур-Тралл?!
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Psicamp_01_03");	//Верховный шаман Ур Хаш Нар недавно отправил туда небольшой отряд.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Psicamp_01_04");	//КРОТОК ДЖАБАРТ! (гневно) Он все-таки не послушать меня! Быть очень глупо ему это делать.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Psicamp_01_05");	//Возможно. Но теперь уже слишком поздно причитать.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Psicamp_01_06");	//Старейшина Тор Дал, возглавлявший отряд, потерял почти всех своих воинов.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Psicamp_01_07");	//(гневно) Как так произойти?!
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Psicamp_01_08");	//Их убила нежить, что обосновалась там на болотах.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Psicamp_01_09");	//А в самом храме Братства, похоже, завелось что-то еще более страшное.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Psicamp_01_10");	//Ур-Тралл предвидеть, что так быть... Нельзя было ходить туда.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Psicamp_01_11");	//Нельзя было тревожить мертвых, нельзя было тревожить зло...
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Psicamp_01_12");	//Тор Дал просит прислать ему еще воинов, чтобы он попытался отбить храм.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Psicamp_01_13");	//И я так понимаю, что только ты можешь отдать такой приказ.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Psicamp_01_14");	//Ур-Тралл знать Тор Дал...(с уважением) Быть смелый воин, никогда не отступать перед враг.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Psicamp_01_15");	//Он очень сильно печалиться, если Тор Дал умирать.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Psicamp_01_16");	//Значит, я могу передать ему, что помощь скоро прибудет?
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Psicamp_01_17");	//У меня не быть выбора, человек. Я посылать ему на помощь много сильный воин!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Psicamp_01_18");	//Если человек хотеть, то он может тоже идти к Тор Дал и помогать ему убивать зло в храме.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Psicamp_01_19");	//Я подумаю на этим.
	TorDalMoreWar = TRUE;
	B_LogEntry(TOPIC_PsicampDemon,"Ур-Тралл пошлет на выручку Тор Далу своих воинов. Он также предложил мне поучаствовать в битве за Храм. Думаю, что стоит воспользоваться его предложением. Это поможет немного завоевать расположение вождя орков.");	
};

instance DIA_ORC_8550_URNAZUL_AboutIronMine(C_Info)
{
	npc = orc_8550_urnazul;
	condition = dia_orc_8550_urnazul_AboutIronMine_condition;
	information = dia_orc_8550_urnazul_AboutIronMine_info;
	permanent = FALSE;
	description = "Пропусти меня в шахту.";
};

func int dia_orc_8550_urnazul_AboutIronMine_condition()
{
	if((MIS_LostPaladins == LOG_Running) && (MustGoInIronMine == TRUE) && (CanEnterOrcMine == FALSE))
	{
		return TRUE;
	};
};

func void dia_orc_8550_urnazul_AboutIronMine_info()
{
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMineMore_01_01");	//Пропусти меня в шахту.

	if((MIS_PsicampDemon == LOG_Success) || (DemonPsicampIsDead == TRUE))
	{
		AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMine_01_02");	//Арргххх...(с уважением) Человек сильно помочь Ур-Тралл! Теперь он стать больше доверять ему.
		AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMine_01_04");	//Сначала Ур-Тралл хотеть знать, зачем человеку надо идти туда.
		AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMine_01_05");	//Если Ур-Тралл соглашаться с человек, тогда он пускать его в железный шахта.
		Info_ClearChoices(DIA_Orc_8550_UrNazul_AboutIronMine);
		Info_AddChoice(DIA_Orc_8550_UrNazul_AboutIronMine,"Я просто хочу взглянуть на нее.",DIA_Orc_8550_UrNazul_AboutIronMine_Q1);
		Info_AddChoice(DIA_Orc_8550_UrNazul_AboutIronMine,"Мне нужна железная руда.",DIA_Orc_8550_UrNazul_AboutIronMine_Q2);
		Info_AddChoice(DIA_Orc_8550_UrNazul_AboutIronMine,"Разве это имеет значение?",DIA_Orc_8550_UrNazul_AboutIronMine_Q3);
		Info_AddChoice(DIA_Orc_8550_UrNazul_AboutIronMine,"Мне необходимо поговорить с пленными.",DIA_Orc_8550_UrNazul_AboutIronMine_Q4);
	}
	else
	{
		AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMine_Q1_01_03");	//Ур-Тралл думать, что человеку не стоит ходить туда.
	};
};

func void DIA_Orc_8550_UrNazul_AboutIronMine_Q1()
{
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMine_Q1_01_01");	//Я просто хочу взглянуть на нее.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMine_Q1_01_02");	//Шахта быть очень опасный место! Быть плохое место, чтобы просто смотреть.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMine_Q1_01_03");	//Ур-Тралл думать, что человеку не стоит ходить туда.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMine_Q1_01_04");	//Какая забота...
	Info_ClearChoices(DIA_Orc_8550_UrNazul_AboutIronMine);
};

func void DIA_Orc_8550_UrNazul_AboutIronMine_Q2()
{
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMine_Q2_01_01");	//Мне нужна железная руда.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMine_Q2_01_02");	//Человек хотеть добывать железный руда орков?
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMine_Q2_01_03");	//Тогда Ур-Тралл не может пустить его туда. Руда быть только для орков!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMine_Q2_01_04");	//Или он может отправиться туда, но только как раб и оставаться там навсегда. Человек хотеть этого?
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMine_Q2_01_05");	//Боюсь, что этот вариант мне совсем не подходит.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMine_Q2_01_06");	//Аррргххх...
	Info_ClearChoices(DIA_Orc_8550_UrNazul_AboutIronMine);
};

func void DIA_Orc_8550_UrNazul_AboutIronMine_Q3()
{
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMine_Q3_01_01");	//Разве это имеет значение?
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMine_Q3_01_02");	//Если Ур-Тралл так говорить, значит, иметь.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMine_Q3_01_03");	//Если человек не иметь большой причина, то он не ходить в железный шахта.
	Info_ClearChoices(DIA_Orc_8550_UrNazul_AboutIronMine);
};

func void DIA_Orc_8550_UrNazul_AboutIronMine_Q4()
{
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMine_Q4_01_01");	//Мне необходимо поговорить с пленными.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMine_Q4_01_02");	//И о чем человек говорить с ними?
	Info_ClearChoices(DIA_Orc_8550_UrNazul_AboutIronMine);
	Info_AddChoice(DIA_Orc_8550_UrNazul_AboutIronMine,"Кто-то из них наверняка должен знать про храм Спящего.",DIA_Orc_8550_UrNazul_AboutIronMine_W1);

	if(RhetorikSkillValue[1] >= 50)
	{
		Info_AddChoice(DIA_Orc_8550_UrNazul_AboutIronMine,"У одного из них есть информация про паладинов.",DIA_Orc_8550_UrNazul_AboutIronMine_W2);
	};

	Info_AddChoice(DIA_Orc_8550_UrNazul_AboutIronMine,"Я хочу научиться у них добывать железную руду.",DIA_Orc_8550_UrNazul_AboutIronMine_W3);
	Info_AddChoice(DIA_Orc_8550_UrNazul_AboutIronMine,"Это касается драконов!",DIA_Orc_8550_UrNazul_AboutIronMine_W4);
	Info_AddChoice(DIA_Orc_8550_UrNazul_AboutIronMine,"Просто хочу облегчить их участь.",DIA_Orc_8550_UrNazul_AboutIronMine_W5);
};

func void DIA_Orc_8550_UrNazul_AboutIronMine_W1()
{
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMine_W1_01_01");	//Кто-то из них наверняка должен знать про храм Спящего.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMine_W1_01_02");	//Это не может быть правдой! Храм Крушак строить орки, и только они знать его секрет.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMine_W1_01_03");	//Люди не строить храм, не поклоняться Крушак! Ничего не знать о нем.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMine_W1_01_04");	//Человек пытаться обмануть Ур-Тралл?!
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMine_W1_01_05");	//Да нет, что ты! И в мыслях не было.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMine_W1_01_06");	//Аррргххх...(грозно)
	Info_ClearChoices(DIA_Orc_8550_UrNazul_AboutIronMine);
};

func void DIA_Orc_8550_UrNazul_AboutIronMine_W2()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMine_W2_01_01");	//У одного из них есть информация про паладинов.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMine_W2_01_02");	//А откуда человек знать это?
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMine_W2_01_03");	//Среди рабов наверняка есть те, кто пришел с их отрядом.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMine_W2_01_04");	//Хммм...(задумчиво) Такое быть вполне возможно.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMine_W2_01_05");	//Быть так! Ур-Тралл пустить человек в шахта, если тот принесет ему сведения о враг.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMine_W2_01_06");	//Вот так бы сразу. Договорились! Так как я смогу попасть в шахту?
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMine_W2_01_07");	//Ур-Тралл давать человек ключ, и тот окрывать проход в шахта.
	B_GiveInvItems(self,other,ItKe_OrcOreMine,1);
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMine_W2_01_08");	//Но быть осторожным. Браты шаманы наложить сильная магия на проход.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMine_W2_01_09");	//Оркам не быть вреда от нее. Но если человек прикасаться, то сразу умирать!
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMine_W2_01_10");	//А зачем вы это сделали?
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMine_W2_01_11");	//Чтобы люди навсегда забыть про побег и не смочь выбраться из железный шахта.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMine_W2_01_12");	//Понятно.

	if(RhetorikSkillValue[1] < 100)
	{
		RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
		AI_Print("Риторика + 1");
	};

 	B_LogEntry(TOPIC_LostPaladins,"Мне удалось убедить Ур-Тралла открыть мне проход в железную шахту орков. Надеюсь, что я разузнаю там что-нибудь об отряде Венцеля.");
	CanEnterOrcMine = TRUE;
	Info_ClearChoices(DIA_Orc_8550_UrNazul_AboutIronMine);
};

func void DIA_Orc_8550_UrNazul_AboutIronMine_W3()
{
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMine_W1_03_01");	//Я хочу научиться у них добывать железную руду.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMine_W1_03_02");	//Человек необязательно идти для этого в шахту орков.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMine_W1_03_03");	//Он может научиться этому и у других люди.
	Info_ClearChoices(DIA_Orc_8550_UrNazul_AboutIronMine);
};

func void DIA_Orc_8550_UrNazul_AboutIronMine_W4()
{
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMine_W4_01_01");	//Это касается драконов!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMine_W4_01_02");	//(хохочет) Что могут знать обычный раб про драконов?
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMine_W4_01_03");	//Ур-Тралл думать, что человек говорить глупость. Но это сильно смешить его.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMine_W4_01_04");	//Однако пустить человек в железный шахта он не может.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMine_W4_01_05");	//Человек будет только отвлекать раб от работы!
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMine_W4_01_06");	//Ну да...
	Info_ClearChoices(DIA_Orc_8550_UrNazul_AboutIronMine);
};

func void DIA_Orc_8550_UrNazul_AboutIronMine_W5()
{
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMine_W5_01_01");	//Просто хочу облегчить их участь.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMine_W5_01_02");	//(хохочет) Человек быть слишком добрый, если хотеть сделать это.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMine_W5_01_03");	//Но Ур-Тралл говорить - нет! Человек будет только отвлекать раб от работы.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMine_W5_01_04");	//И они добывать меньше железная руда.
	Info_ClearChoices(DIA_Orc_8550_UrNazul_AboutIronMine);
};

instance DIA_ORC_8550_URNAZUL_AboutIronMineMore(C_Info)
{
	npc = orc_8550_urnazul;
	condition = dia_orc_8550_urnazul_AboutIronMineMore_condition;
	information = dia_orc_8550_urnazul_AboutIronMineMore_info;
	permanent = TRUE;
	description = "Пропусти меня в шахту.";
};

func int dia_orc_8550_urnazul_AboutIronMineMore_condition()
{
	if((Npc_KnowsInfo(hero,DIA_Orc_8550_UrNazul_AboutIronMine) == TRUE) && (MIS_LostPaladins == LOG_Running) && (MustGoInIronMine == TRUE) && (CanEnterOrcMine == FALSE))
	{
		return TRUE;
	};
};

func void dia_orc_8550_urnazul_AboutIronMineMore_info()
{
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMineMore_01_01");	//Пропусти меня в шахту.

	if((MIS_PsicampDemon == LOG_Success) || (DemonPsicampIsDead == TRUE))
	{
		AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMineMore_01_02");	//Ур-Тралл еще хотеть знать, зачем человеку надо идти туда.
		Info_ClearChoices(DIA_Orc_8550_UrNazul_AboutIronMineMore);
		Info_AddChoice(DIA_Orc_8550_UrNazul_AboutIronMineMore,"Я просто хочу взглянуть на нее.",DIA_Orc_8550_UrNazul_AboutIronMineMore_Q1);
		Info_AddChoice(DIA_Orc_8550_UrNazul_AboutIronMineMore,"Мне нужна железная руда!",DIA_Orc_8550_UrNazul_AboutIronMineMore_Q2);
		Info_AddChoice(DIA_Orc_8550_UrNazul_AboutIronMineMore,"Разве это имеет значение?",DIA_Orc_8550_UrNazul_AboutIronMineMore_Q3);
		Info_AddChoice(DIA_Orc_8550_UrNazul_AboutIronMineMore,"Мне необходимо поговорить с пленными.",DIA_Orc_8550_UrNazul_AboutIronMineMore_Q4);
	}
	else
	{
		AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMine_Q1_01_03");	//Ур-Тралл думать, что человеку не стоит ходить туда.
	};
};

func void DIA_Orc_8550_UrNazul_AboutIronMineMore_Q1()
{
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMineMore_Q1_01_01");	//Я просто хочу взглянуть на нее.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMineMore_Q1_01_02");	//Шахта быть очень опасный место! Быть плохое место, чтобы просто смотреть.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMineMore_Q1_01_03");	//Ур-Тралл думать, что человеку не стоит ходить туда.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMineMore_Q1_01_04");	//Какая забота...
	Info_ClearChoices(DIA_Orc_8550_UrNazul_AboutIronMineMore);
};

func void DIA_Orc_8550_UrNazul_AboutIronMineMore_Q2()
{
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMineMore_Q2_01_01");	//Мне нужна железная руда!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMineMore_Q2_01_02");	//Человек хотеть добывать железный руда орков?!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMineMore_Q2_01_03");	//Тогда Ур-Тралл не может пустить его туда. Руда быть только для орков!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMineMore_Q2_01_04");	//Или он может отправиться туда, но только как раб и оставаться там навсегда. Человек хотеть этого?
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMineMore_Q2_01_05");	//Боюсь, что этот вариант мне совсем не подходит.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMineMore_Q2_01_06");	//Арррргххх...
	Info_ClearChoices(DIA_Orc_8550_UrNazul_AboutIronMineMore);
};

func void DIA_Orc_8550_UrNazul_AboutIronMineMore_Q3()
{
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMineMore_Q3_01_01");	//Разве это имеет значение?
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMineMore_Q3_01_02");	//Если Ур-Тралл так говорить, значит иметь.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMineMore_Q3_01_03");	//Если человек не иметь большой причина, то он не ходить в железный шахта.
	Info_ClearChoices(DIA_Orc_8550_UrNazul_AboutIronMineMore);
};

func void DIA_Orc_8550_UrNazul_AboutIronMineMore_Q4()
{
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMineMore_Q4_01_01");	//Мне необходимо поговорить с пленными.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMineMore_Q4_01_02");	//И о чем человек говорить с ними?
	Info_ClearChoices(DIA_Orc_8550_UrNazul_AboutIronMineMore);
	Info_AddChoice(DIA_Orc_8550_UrNazul_AboutIronMineMore,"Кто-то из них наверняка должен знать про Храм Спящего.",DIA_Orc_8550_UrNazul_AboutIronMineMore_W1);

	if(RhetorikSkillValue[1] >= 50)
	{
		Info_AddChoice(DIA_Orc_8550_UrNazul_AboutIronMineMore,"У одного из них есть информация про паладинов.",DIA_Orc_8550_UrNazul_AboutIronMineMore_W2);
	};

	Info_AddChoice(DIA_Orc_8550_UrNazul_AboutIronMineMore,"Я хочу научиться у них добывать железную руду.",DIA_Orc_8550_UrNazul_AboutIronMineMore_W3);
	Info_AddChoice(DIA_Orc_8550_UrNazul_AboutIronMineMore,"Это касается драконов!",DIA_Orc_8550_UrNazul_AboutIronMineMore_W4);
	Info_AddChoice(DIA_Orc_8550_UrNazul_AboutIronMineMore,"Я просто хочу облегчить их участь рабов.",DIA_Orc_8550_UrNazul_AboutIronMineMore_W5);
};

func void DIA_Orc_8550_UrNazul_AboutIronMineMore_W1()
{
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMineMore_W1_01_01");	//Кто-то из них наверняка должен знать про храм Спящего.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMineMore_W1_01_02");	//Это не может быть правдой! Храм Крушак строить орки и только они знать его секрет.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMineMore_W1_01_03");	//Люди не строить храм, не поклоняться Крушак! Ничего не знать о нем.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMineMore_W1_01_04");	//Ур-Тралл думать, что человек просто хотеть его обмануть.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMineMore_W1_01_05");	//Да нет, что ты! И в мыслях не было.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMineMore_W1_01_06");	//Аррргххх...(грозно)
	Info_ClearChoices(DIA_Orc_8550_UrNazul_AboutIronMineMore);
};

func void DIA_Orc_8550_UrNazul_AboutIronMineMore_W2()
{
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMineMore_W2_01_01");	//У одного из них есть информация про паладинов.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMineMore_W2_01_02");	//А откуда человек знать это?
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMineMore_W2_01_03");	//Среди рабов наверняка есть те, кто пришел с их отрядом.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMineMore_W2_01_04");	//Хммм...(задумчиво) Такое быть вполне возможно.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMineMore_W2_01_05");	//Быть так. Ур-Тралл пустить человек в шахта, если тот принесет ему сведения о враг.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMineMore_W2_01_06");	//Вот так бы сразу. Хорошо, договорились! Так как я смогу попасть в шахту?
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMineMore_W2_01_07");	//Ур-Тралл давать человек ключ и тот окрывать проход в железный шахта.
	B_GiveInvItems(self,other,ItKe_OrcOreMine,1);
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMineMore_W2_01_08");	//Но быть осторожным! Браты шаманы наложить сильная магия на проход.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMineMore_W2_01_09");	//Оркам не быть вреда от нее. Но если человек прикасаться, то сразу умирать!
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMineMore_W2_01_10");	//А зачем вы это сделали?
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMineMore_W2_01_11");	//Чтобы люди навсегда забыть про побег и не смочь выбраться из железный шахта.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMineMore_W2_01_12");	//Понятно.

	if(RhetorikSkillValue[1] < 100)
	{
		RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
		AI_Print("Риторика + 1");
	};

	B_LogEntry(TOPIC_LostPaladins,"Мне удалось убедить Ур-Тралла, чтобы тот открыл мне проход в железную шахту орков. Он дал мне ключ, что откроет проход в шахту. Надеюсь, что я найду там ответ на вопрос об отряде Венцеля.");
	CanEnterOrcMine = TRUE;
	Info_ClearChoices(DIA_Orc_8550_UrNazul_AboutIronMineMore);
};

func void DIA_Orc_8550_UrNazul_AboutIronMineMore_W3()
{
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMineMore_W1_03_01");	//Я хочу научиться у них добывать железную руду.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMineMore_W1_03_02");	//Человек не обязательно идти для этого в шахту орков.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMineMore_W1_03_03");	//Он может научиться этому и у других люди.
	Info_ClearChoices(DIA_Orc_8550_UrNazul_AboutIronMineMore);
};

func void DIA_Orc_8550_UrNazul_AboutIronMineMore_W4()
{
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMineMore_W4_01_01");	//Это касается драконов!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMineMore_W4_01_02");	//(хохочет) Что могут знать обычный раб про драконов?
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMineMore_W4_01_03");	//Ур-Тралл думать, что человек говорить глупость. Но это сильно смешить его.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMineMore_W4_01_04");	//Однако пустить человек в железный шахта он не может.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMineMore_W4_01_05");	//Человек будет только отвлекать раб от работы!
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMineMore_W4_01_06");	//Ну да...
	Info_ClearChoices(DIA_Orc_8550_UrNazul_AboutIronMineMore);
};

func void DIA_Orc_8550_UrNazul_AboutIronMineMore_W5()
{
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMineMore_W5_01_01");	//Я просто хочу облегчить их участь рабов.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMineMore_W5_01_02");	//(хохочет) Человек быть слишком добрый, если хотеть сделать это.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMineMore_W5_01_03");	//Но Ур-Тралл говорить нет! Человек будет только отвлекать раб от работы.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMineMore_W5_01_04");	//И они добывать меньше железная руда.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMineMore_W5_01_05");	//Понимаю.
	Info_ClearChoices(DIA_Orc_8550_UrNazul_AboutIronMineMore);
};

instance DIA_ORC_8550_URNAZUL_LowLevel(C_Info)
{
	npc = orc_8550_urnazul;
	condition = dia_orc_8550_urnazul_LowLevel_condition;
	information = dia_orc_8550_urnazul_LowLevel_info;
	permanent = FALSE;
	description = "Меня прислал к тебе Ар Дагар.";
};

func int dia_orc_8550_urnazul_LowLevel_condition()
{
	if((MIS_LowLevel == LOG_Running) && (SendForHelp == TRUE))
	{
		return TRUE;
	};
};

func void dia_orc_8550_urnazul_LowLevel_info()
{
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_LowLevel_01_01");	//Меня прислал к тебе Ар Дагар.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_LowLevel_01_02");	//Что ему быть надо?
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_LowLevel_01_03");	//Он просит тебя прислать ему несколько сильных воинов.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_LowLevel_01_04");	//Зачем Ар Дагар просить это?
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_LowLevel_01_05");	//Чтобы отправить их в глубокую шахту.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_LowLevel_01_06");	//Так Ар Дагар хотеть попытаться вновь убить демон?
	AI_PlayAni(self,"T_NO");
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_LowLevel_01_07");	//Ур-Тралл помнить, что случиться в прошлый раз, когда он попытаться освободить шахта.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_LowLevel_01_08");	//Демон быть очень сильный! Убивать много братов Ур-Тралла.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_LowLevel_01_09");	//Да, но в этот раз с ними пойду я! Во мне-то ты уверен?
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Hello_Info_18_13");	//Человек не бояться демон? Человек ушибить голова!
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Hello_Info_18_14");	//Я стою один в подземном городе орков, и говорю с тобой, их вождем. Как ты думаешь, я ушибить голова?
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Hello_Info_18_15");	//Ур-Тралл думать - да. Но человек с Улу-Мулу быть храбрый и сильный!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_LowLevel_01_13");	//Ур-Тралл думать, что у человек может получиться освободить шахта орков.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_LowLevel_01_14");	//Поэтому он пошлет с человек свой самый лучший воин. Орак Шака, человек!
	OrcHelpLowLevel = TRUE;
	B_LogEntry(TOPIC_LowLevel,"Ур-Тралл согласился отправить Ар Дагару несколько сильных воинов орков.");
};

instance DIA_ORC_8550_URNAZUL_LowLevelFree(C_Info)
{
	npc = orc_8550_urnazul;
	condition = dia_orc_8550_urnazul_LowLevelFree_condition;
	information = dia_orc_8550_urnazul_LowLevelFree_info;
	permanent = FALSE;
	description = "Я освободил глубокую шахту от зла!";
};

func int dia_orc_8550_urnazul_LowLevelFree_condition()
{
	if(MIS_LowLevel == LOG_Success)
	{
		return TRUE;
	};
};

func void dia_orc_8550_urnazul_LowLevelFree_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_LowLevelFree_01_01");	//Я освободил глубокую шахту от зла!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_LowLevelFree_01_02");	//Ур-Тралл знать, что у человек получиться это сделать. Мор Дар быть великий воин!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_LowLevelFree_01_03");	//Он благодарить человек, что тот помог его народ избавиться от этот проклятье.
};

var int TakeIdolKrushak;

instance DIA_ORC_8550_URNAZUL_HELLO(C_Info)
{
	npc = orc_8550_urnazul;
	condition = dia_orc_8550_urnazul_hello_condition;
	information = dia_orc_8550_urnazul_hello_info;
	permanent = TRUE;
	description = "Я пришел поговорить с тобой насчет Храма Спящего.";
};

func int dia_orc_8550_urnazul_hello_condition()
{
	if((MIS_ORCTEMPLE == LOG_Running) && (TakeIdolKrushak == FALSE))
	{
		return TRUE;
	};
};

func void dia_orc_8550_urnazul_hello_info()
{
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Hello_Info_18_07");	//Я пришел поговорить с тобой насчет Храма Спящего. Я слышал, что в Храме появилось новое зло - какой-то злой демон.

	if((MIS_LowLevel == LOG_Success) && ((MIS_PsicampDemon == LOG_Success) || (DemonPsicampIsDead == TRUE)))
	{
		AI_Output(self,other,"DIA_Orc_8550_UrNazul_Hello_Info_18_08");	//Храм Крушак? Демон?! Хммм... Говорить дальше.
		AI_Output(other,self,"DIA_Orc_8550_UrNazul_Hello_Info_18_09");	//Я знаю, что этот демон устроил в Храме настоящую резню, убив много твоих братьев.
		AI_Output(other,self,"DIA_Orc_8550_UrNazul_Hello_Info_18_10");	//Теперь они служат этому демону в обличии нежити.
		AI_Output(other,self,"DIA_Orc_8550_UrNazul_Hello_Info_18_11");	//Также я знаю, что вы, орки, запечатали храм заклятием. Чтоб он не вырвался на свободу.
		AI_Output(other,self,"DIA_Orc_8550_UrNazul_Hello_Info_18_12");	//Я хочу сразиться с этим демоном. Как мне попасть внутрь?
		AI_PlayAni(self,"T_GREETGRD");
		AI_Output(self,other,"DIA_Orc_8550_UrNazul_Complete_Info_18_04");	//Человек быть великий воин. Достоин войти в храм Крушак!
		AI_Output(self,other,"DIA_Orc_8550_UrNazul_Complete_Info_18_05");	//Ур-Трал говорить спасибо и дать ключ-магия — человек открыть вход в храм Крушак.
		B_GiveInvItems(self,other,itmi_idol_01,1);
		AI_Output(other,self,"DIA_Orc_8550_UrNazul_LowLevel_01_15");	//Благодарю тебя, вождь. Это я и хотел от тебя услышать.
		AI_Output(self,other,"DIA_Orc_8550_UrNazul_UrGrom_Info_18_19");	//Человек может идти. Добрый путь!
		TakeIdolKrushak = TRUE;
		B_LogEntry_Quiet(TOPIC_ORCTEMPLE,"Я получил от вождя орков некий магический талисман орков, открывающий проход в Храм Спящего.");
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Orc_8550_UrNazul_Hello_Info_New_18_01");	//Хммм... Это быть не дело человек! Орки сами разобраться со злой демон.
		AI_Output(self,other,"DIA_Orc_8550_UrNazul_Hello_Info_New_18_02");	//Теперь человек лучше идти, пока Ур-Трал сильно не рассердиться на него.
		AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMineMore_Q2_01_05");	//Боюсь, что этот вариант мне совсем не подходит.
		AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMineMore_Q2_01_06");	//Арррргххх...
		AI_StopProcessInfos(self);
	};
};
instance DIA_ORC_8550_URNAZUL_ORCTEMPLEISFREE(C_Info)
{
	npc = orc_8550_urnazul;
	condition = dia_orc_8550_urnazul_ORCTEMPLEISFREE_condition;
	information = dia_orc_8550_urnazul_ORCTEMPLEISFREE_info;
	permanent = FALSE;
	description = "Я уничтожил зло в Храме Спящего.";
};

func int dia_orc_8550_urnazul_ORCTEMPLEISFREE_condition()
{
	if((DARKMAGE_ISDEAD == TRUE) && (SleeperInRage == FALSE))
	{
		return TRUE;
	};
};

func void dia_orc_8550_urnazul_ORCTEMPLEISFREE_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_ORCTEMPLEISFREE_01_01");	//Я уничтожил зло в Храме Спящего.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_ORCTEMPLEISFREE_01_02");	//Ур-Тралл рад слышать это! Человек еще раз доказать, что он быть великий воин.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_ORCTEMPLEISFREE_01_03");	//Теперь братья вновь смогут вернуться туда.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_ORCTEMPLEISFREE_01_04");	//Зачем?
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_ORCTEMPLEISFREE_01_05");	//Храм быть священное место для них. Они будут там говорить с духами.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_ORCTEMPLEISFREE_01_06");	//Поэтому Ур-Тралл благодарить человек за его помощь!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_ORCTEMPLEISFREE_01_07");	//Но думать, что только одних слов будет мало для него. 

	if((hero.guild == GIL_KDM) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDF) || (hero.guild == GIL_GUR) || (hero.guild == GIL_NDM) || (hero.guild == GIL_NOV) || (hero.guild == GIL_NDW))
	{
		AI_Output(self,other,"DIA_Orc_8550_UrNazul_ORCTEMPLEISFREE_01_08");	//Я видеть, что ты более любить использовать магия в сражение.
		AI_Output(other,self,"DIA_Orc_8550_UrNazul_ORCTEMPLEISFREE_01_09");	//Да, ты прав.

		if(ShamanArmor == FALSE)
		{
			AI_Output(self,other,"DIA_Orc_8550_UrNazul_ORCTEMPLEISFREE_01_10");	//Хорошо...(с уважением) Тогда человек принять эти робу и посох шамана орков в качестве награда.
			AI_Output(self,other,"DIA_Orc_8550_UrNazul_ORCTEMPLEISFREE_01_11");	//Носить их с гордостью, ибо еще ни один человек еще не удостаиваться подобной честь!
			B_GiveInvItemsManyThings(self,other);
			CreateInvItems(other,ItMw_2h_OrcStab,1);
			CreateInvItems(other,ITAR_SHAMANROBE,1);
			ShamanArmor = TRUE;
		}
		else
		{
			B_GiveInvItems(self,other,ItRu_OrcFireball,1);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Orc_8550_UrNazul_ORCTEMPLEISFREE_01_12");	//Так что человек принять этот доспех и меч воина орков в качестве доказательства моих слов.
		AI_Output(self,other,"DIA_Orc_8550_UrNazul_ORCTEMPLEISFREE_01_13");	//Носить их с гордостью, ибо ни один человек еще не удостаиваться подобной честь!

		if(other.attribute[ATR_STRENGTH] >= other.attribute[ATR_DEXTERITY])
		{
			B_GiveInvItemsManyThings(self,other);
			CreateInvItems(other,ITAR_ORCARMOR,1);
			CreateInvItems(other,Orc_Blade,1);
		}
		else
		{
			B_GiveInvItemsManyThings(self,other);
			CreateInvItems(other,ItPo_Perm_DEX,1);
			CreateInvItems(other,ITAR_ORCARMOR_DEX,1);
			FixOrcArmor = TRUE;
		};
	};

	AI_Output(other,self,"DIA_Orc_8550_UrNazul_ORCTEMPLEISFREE_01_14");	//Спасибо.
	OrcIsBackTemple = TRUE;
};


//---------------------------------------------------------квест Наг-Думгар-------------------------------------------------------------

instance DIA_Orc_8550_UrNazul_Muritan(C_Info)
{
	npc = Orc_8550_UrNazul;
	condition = DIA_Orc_8550_UrNazul_Muritan_condition;
	information = DIA_Orc_8550_UrNazul_Muritan_info;
	important = FALSE;
	permanent = FALSE;
	description = "Я слышал, тебе был нужен клык Муритана.";
};

func int DIA_Orc_8550_UrNazul_Muritan_condition()
{
	if((TakeIdolKrushak == TRUE) && (UrTrallTalkTooth == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8550_UrNazul_Muritan_Info()
{
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Muritan_Info_01_00");	//Я слышал, тебе был нужен клык Муритана.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_Info_01_01");	//Да, быть так.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Muritan_Info_01_02");	//А зачем он тебе понадобился?
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_Info_01_03");	//Человек, может быть, не знать, но его яд способен убить почти любого.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_Info_01_04");	//Ур-Тралл иметь один очень сильный враг, который почти нельзя убить. Но он думать, что яд чудовища может помочь одолеть его.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Muritan_Info_01_06");	//Мне кажется, что у тебя очень много врагов, вождь. И кто на это раз?
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_Info_01_07");	//(серьезно) Его звать Наг-Думгар. Когда-то он быть таким же орком, как и Ур-Тралл.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Muritan_Info_01_08");	//Никогда не слышал этого имени. Может, расскажешь мне о нем?
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_Info_01_09");	//...(задумчиво) Много зим назад братья орки построить храм Спящего.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_Info_01_10");	//Наг-Думгар быть вождь того клана, чьи шаманы призывать злой демон.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_Info_01_11");	//Однако, как человек уже наверняка знать, демон обмануть орков и убить их всех.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Muritan_Info_01_12");	//Да, я знаю, что произошло в храме. Но причем тут Наг-Думгар?
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_Info_01_13");	//Узнав об этом, Наг-Думгар взял с собой много воинов и отправился в храм, чтобы убить демон.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_Info_01_14");	//Но он потерпеть неудачу! Все его воины погибнуть, и только он один почему-то остаться в живых.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_Info_01_15");	//Вернувшись обратно, Наг-Думгар приказать запечатать вход в храм, чтобы злой демон не вырваться наружу.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_Info_01_16");	//...(задумчиво) Однако Наг-Думгар очень сильно измениться после похода в храм.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_Info_01_17");	//Его начала постоянно одолевать какая-то безмерная жажда крови!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_Info_01_18");	//Наг-Думгар стать приносить братьев орков в жертву, говоря, что это оградит клан от гнева и проклятия злой демон.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Muritan_Info_01_19");	//Вот как? Не думаю, что оркам это понравилось.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_Info_01_20");	//Человек быть прав! Орки подумать, что Наг-Думгар сойти с ума и решить убить его.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_Info_01_21");	//Однако, узнав об этом, Наг-Думгар и вовсе обезуметь!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_Info_01_22");	//Он проклянуть свой клан и убить всех тех, кто посметь встать у него на пути.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_Info_01_23");	//Те братья орки, кому все-таки удалось выжить, - клялись, что Наг-Думгар сам превратиться в злой демон!
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Muritan_Info_01_24");	//И что было потом?
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_Info_01_25");	//(задумчиво) Никто не знать этого...
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_Info_01_26");	//После того как Наг-Думгар убить всех своих братьев, он бесследно изчезнуть, и больше никто его не видеть уже много зим.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_Info_01_27");	//Но недавно мои разведчики донести мне, что видеть нечто похожее на Наг-Думгара недалеко от высокой башни, на севере долины.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_Info_01_28");	//Я отправить туда несколько своих лучших воинов, но никто из них не прийти обратно.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Muritan_Info_01_29");	//Думаешь, это его рук дело?
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_Info_01_30");	//Ур-Тралл точно не уверен, но полагать, что это может быть так.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_Info_01_31");	//Недавние события в храме Спящего могли заставить Наг-Думгара вернуться в долину.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_Info_01_32");	//Если так, то он наверняка захотеть отомстить за смерть своего хозяина, и тогда все братья орки находиться в большой опасности.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_Info_01_33");	//Но Ур-Тралл не может допустить того, чтобы Наг-Думгар вновь причинить им зло!
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Muritan_Info_01_34");	//И ты наивно полагаешь, что яд Муритана способен остановить его?!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_Info_01_35");	//Ур-Тралл точно не знать этого! Однако других мыслей насчет того, как можно убить Наг-Думгара, у него нет. Может, они есть у человек?
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Muritan_Info_01_37");	//Если и искать ответ на этот вопрос, то только в самом Храме. Ведь именно там Наг-Думгар стал тем, с кем вы сейчас имеете дело.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_Info_01_39");	//Ур-Тралл не может сейчас идти туда! Но, может, человек смог бы отправиться в Храм и выяснить это?
	Info_ClearChoices(DIA_Orc_8550_UrNazul_Muritan);
	Info_AddChoice(DIA_Orc_8550_UrNazul_Muritan,"У меня нет на это времени.",DIA_Orc_8550_UrNazul_Muritan_No);
	Info_AddChoice(DIA_Orc_8550_UrNazul_Muritan,"Хорошо, я займусь этим.",DIA_Orc_8550_UrNazul_Muritan_Yes);
};

func void DIA_Orc_8550_UrNazul_Muritan_No()
{
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Muritan_No_01_01");	//У меня нет на это времени.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Muritan_No_01_02");	//Тебе придется самому разбираться с этим, вождь.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_No_01_03");	//Хорошо! Ур-Тралл делать все сам. Человек может больше не беспокоиться.
	AI_StopProcessInfos(self);
};

func void DIA_Orc_8550_UrNazul_Muritan_Yes()
{
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Muritan_Yes_01_01");	//Хорошо, я займусь этим.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_Yes_01_02");	//Тогда человек не терять времени! Он отправляться в Храм и узнавать, как убить Наг-Думгара!
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Muritan_Yes_01_03");	//Жди вестей, вождь.
	MIS_NagDumgar = LOG_Running;
	Log_CreateTopic(TOPIC_NagDumgar,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_NagDumgar,LOG_Running);
	B_LogEntry(TOPIC_NagDumgar,"Я поинтересовался у Ур-Тралла, зачем ему понадобился клык с ядом Муритана. Вождь орков полагает, что с его помощью можно сразить Наг-Думгара - некогда могущественного вождя клана орков, построивших Храм Спящего, и который впоследствии превратился в злого демона. Но мне кажется, что даже смертоносный яд будет бессилен перед этим древним проклятием орков. Скорее всего, секрет единственного верного способа убить Наг-Думгара кроется в развалинах самого Храма, и я вызвался отыскать его...");
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8550_UrNazul_XashGor(C_Info)
{
	npc = Orc_8550_UrNazul;
	condition = DIA_Orc_8550_UrNazul_XashGor_condition;
	information = DIA_Orc_8550_UrNazul_XashGor_info;
	important = FALSE;
	permanent = FALSE;
	description = "Что ты знаешь о верховном шамане Хаш-Горе?";
};

func int DIA_Orc_8550_UrNazul_XashGor_condition()
{
	if((MIS_NagDumgar == LOG_Running) && (KnowAboutNagDumgar_P3 == TRUE) && (HashGorIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8550_UrNazul_XashGor_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_XashGor_01_01");	//Что ты знаешь о верховном шамане Хаш-Горе?
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_XashGor_01_02");	//Хммм... Быть очень древний имя...(задумчиво) Насколько Ур-Тралл знать, Хаш-Гор когда-то быть великий шаман орков.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_XashGor_01_03");	//Это я и сам знаю. Что еще можешь сказать о нем?
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_XashGor_01_04");	//Ур-Тралл мало что знать про это, поскольку Хаш-Гор жить очень много зим назад.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_XashGor_01_06");	//И ты понятия не имеешь, где мне его искать?
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_XashGor_01_07");	//Если кто и знает, где сейчас Хаш-Гор, то только тот, кто жил в то время.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_XashGor_01_08");	//А как ты наверно понимать, среди орков сейчас таких нет.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_XashGor_01_09");	//Ясно.
	DeadRabOrkovInsert = TRUE;
	B_LogEntry(TOPIC_NagDumgar,"Как и следовало ожидать, Ур-Тралл ничего не знает о Хаш-Горе. По его словам, о нем может рассказать только тот, кто жил во времена Хаш-Гора. А таких среди орков нет... Если только среди мертвых.");
};

instance DIA_Orc_8550_UrNazul_Muritan_Dagger(C_Info)
{
	npc = Orc_8550_UrNazul;
	condition = DIA_Orc_8550_UrNazul_Muritan_Dagger_condition;
	information = DIA_Orc_8550_UrNazul_Muritan_Dagger_info;
	important = FALSE;
	permanent = FALSE;
	description = "Я выяснил, как можно убить Наг-Думгара!";
};

func int DIA_Orc_8550_UrNazul_Muritan_Dagger_condition()
{
	if((MIS_NagDumgar == LOG_Running) && (KnowAboutNagDumgar_P3 == TRUE) && (Npc_HasItems(other,ItMw_1h_TributeDagger) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Orc_8550_UrNazul_Muritan_Dagger_Info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Muritan_Dagger_Info_01_02");	//Я был в Храме Спящего и выяснил, как можно убить Наг-Думгара!
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Muritan_Dagger_Info_01_04");	//Вот, взгляни на этот предмет.
	B_GiveInvItems(other,self,ItMw_1h_TributeDagger,1);
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_Dagger_Info_01_05");	//Хммм...(задумчиво) Что это?!
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Muritan_Dagger_Info_01_06");	//Судя по древним записям, которые я отыскал в храме, этот кинжал орки использовали для приношения в жертву своих же собратьев.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Muritan_Dagger_Info_01_07");	//Однако жертвы предназначались не Спящему, как они наивно полагали, а самому Наг-Думгару!
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Muritan_Dagger_Info_01_08");	//А точнее - злому духу, который овладел разумом могущественного вождя.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Muritan_Dagger_Info_01_09");	//Именно поэтому Наг-Думгар был взбешен тем, что орки отказались убивать друг друга. Поскольку тогда бы он перестал получать необходимую для него жертвенную кровь.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Muritan_Dagger_Info_01_11");	//И этот кинжал, похоже, способен убить и Наг-Думгара. Осталось лишь отыскать его и вонзить кинжал ему в сердце.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_Dagger_Info_01_13");	//(с уважением) Человек очень удивить Ур-Тралла, что смог узнать все это. Если все оказаться так, как он и говорить, то оркам больше не стоит бояться Наг-Думгара и его проклятия!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_Dagger_Info_01_15");	//Ур-Тралл благодарит человек за помощь. Теперь он сам отправиться искать и убивать Наг-Думгара!
	B_LogEntry(TOPIC_NagDumgar,"Я принес Ур-Траллу жертвенный кинжал, которым можно сразить Наг-Думгара.");
	Info_ClearChoices(DIA_Orc_8550_UrNazul_Muritan_Dagger);
	Info_AddChoice(DIA_Orc_8550_UrNazul_Muritan_Dagger,"Надеюсь, что у тебя все получится.",DIA_Orc_8550_UrNazul_Muritan_Dagger_No);
	Info_AddChoice(DIA_Orc_8550_UrNazul_Muritan_Dagger,"Могу ли я сам убить этого демона?",DIA_Orc_8550_UrNazul_Muritan_Dagger_Yes);
};

func void DIA_Orc_8550_UrNazul_Muritan_Dagger_No()
{
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Muritan_Dagger_No_01_00");	//Надеюсь, что у тебя все получится, вождь.
	MIS_NagDumgar = LOG_Success;
	NagDumgarInsertForUrTrall = TRUE;
	Log_SetTopicStatus(TOPIC_NagDumgar,LOG_SUCCESS);
	B_LogEntry(TOPIC_NagDumgar,"Теперь, обладая мощным оружием, Ур-Тралл сразится с Наг-Думгаром. Мое участие в этой истории подошло к концу...");
	AI_StopProcessInfos(self);

};

func void DIA_Orc_8550_UrNazul_Muritan_Dagger_Yes()
{
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Muritan_Dagger_Yes_01_00");	//Могу ли я сам убить этого демона?
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_Dagger_Yes_01_01");	//(удивленно) Человек хочет сразиться с Наг-Думгаром?!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_Dagger_Yes_01_03");	//Ур-Тралл быть восхищенным смелостью человек...(с уважением) Но должен его предупредить, что Наг-Думгар очень силен и опасен!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_Dagger_Yes_01_04");	//Человек должен понимать, что тот не иметь право на ошибку, иначе тогда погибнуть много братьев.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Muritan_Dagger_Yes_01_05");	//Я понимаю это, и постараюсь тебя не подвести.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_Dagger_Yes_01_06");	//Хорошо...(задумчиво) Ур-Тралл видеть у человека большую увереность в своих силах!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_Dagger_Yes_01_07");	//Поэтому он готов поручить ему убить Наг-Думгара! Вот - человек брать кинжал и теперь идти сражаться с демоном.
	B_GiveInvItems(self,other,ItMw_1h_TributeDagger,1);
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Muritan_Dagger_Yes_01_09");	//Где мне его искать?
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_Dagger_Yes_01_10");	//Как Ур-Тралл уже говорил, последний раз Наг-Думгара видели на севере, вблизи каменного форта в горах. Человек должен искать там.
	NagDumgarInsert = TRUE;
	B_LogEntry(TOPIC_NagDumgar,"Я вызвался самолично сразиться с Наг-Думгаром! Ур-Тралл по достоинству оценил мою смелость, но предупредил, что я не имею права на ошибку. Последний раз Наг-Думгара видели на севере, вблизи каменного форта в горах.");
	Info_ClearChoices(DIA_Orc_8550_UrNazul_Muritan_Dagger);
	Info_AddChoice(DIA_Orc_8550_UrNazul_Muritan_Dagger,Dialog_Ende,DIA_Orc_8550_UrNazul_Muritan_Dagger_Quit);
};

func void DIA_Orc_8550_UrNazul_Muritan_Dagger_Quit()
{
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8550_UrNazul_Muritan_DaggerDone(C_Info)
{
	npc = Orc_8550_UrNazul;
	condition = DIA_Orc_8550_UrNazul_Muritan_DaggerDone_condition;
	information = DIA_Orc_8550_UrNazul_Muritan_DaggerDone_info;
	permanent = FALSE;
	description = "Наг-Думгар мертв!";
};

func int DIA_Orc_8550_UrNazul_Muritan_DaggerDone_condition()
{
	if((MIS_NagDumgar == LOG_Running) && (NagDumgarIsDead == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8550_UrNazul_Muritan_DaggerDone_Info()
{
	B_GivePlayerXP(2500);
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Muritan_DaggerDone_Info_01_00");	//Наг-Думгар мертв!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_DaggerDone_Info_01_01");	//Аргххх...(с уважением) Человек еще раз доказать, что он быть великий воин!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_DaggerDone_Info_01_02");	//Ур-Тралл благодарить его за то, что он помог братьям. Проклятье Наг-Думгара больше не будет беспокоить нас!
	B_GiveInvItems(self,other,ItPo_UrTrallPotion,1);
	MIS_NagDumgar = LOG_Success;
	Log_SetTopicStatus(TOPIC_NagDumgar,LOG_SUCCESS);
	B_LogEntry(TOPIC_NagDumgar,"Ур-Тралл был рад услышать, что демон-орк Наг-Думгар мертв...");
};

instance DIA_Orc_8550_UrNazul_Muritan_UrTrallPotion(C_Info)
{
	npc = Orc_8550_UrNazul;
	condition = DIA_Orc_8550_UrNazul_Muritan_UrTrallPotion_condition;
	information = DIA_Orc_8550_UrNazul_Muritan_UrTrallPotion_info;
	permanent = FALSE;
	description = "Что за напиток ты мне дал?";
};

func int DIA_Orc_8550_UrNazul_Muritan_UrTrallPotion_condition()
{
	if((MIS_NagDumgar == LOG_Success) && (Npc_HasItems(other,ItPo_UrTrallPotion) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Orc_8550_UrNazul_Muritan_UrTrallPotion_Info()
{
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Muritan_UrTrallPotion_01_01");	//А что еще за напиток ты мне дал?
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_UrTrallPotion_01_02");	//Быть очень древний и очень ценный напиток орков! Ур-Тралл хранить его много зим, но так и не сметь выпить его сам.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_UrTrallPotion_01_03");	//Но человек доказать, что достоин обладать им!
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Muritan_UrTrallPotion_01_04");	//Надеюсь, я им не отравлюсь?
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_UrTrallPotion_01_05");	//Человек может не беспокоиться. Этот напиток не убить его, а сделать только сильней.
};

instance DIA_Orc_8550_UrNazul_Sword(C_Info)
{
	npc = Orc_8550_UrNazul;
	condition = DIA_Orc_8550_UrNazul_Sword_condition;
	information = DIA_Orc_8550_UrNazul_Sword_info;
	permanent = FALSE;
	description = "Кузнец Хаш Тор передает тебе этот меч.";
};

func int DIA_Orc_8550_UrNazul_Sword_condition()
{
	if((MIS_HashTorOre == LOG_Running) && (Npc_HasItems(other,ITMW_2H_ORCSWORD_05) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Orc_8550_UrNazul_Sword_Info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Sword_01_01");	//Кузнец Хаш Тор передает тебе этот меч.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Sword_01_02");	//Дай мне посмотреть на него.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Sword_01_03");	//Вот он.
	B_GiveInvItems(other,self,ITMW_2H_ORCSWORD_05,1);
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Sword_01_04");	//Хммм...(оценивающе)
	AI_UnequipWeapons(self);
	AI_EquipBestMeleeWeapon(self);
	AI_ReadyMeleeWeapon(self);
	AI_PlayAni(self,"T_1HSINSPECT");
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Sword_01_05");	//Быть очень хороший меч! Ур-Траллу он нравиться.
	AI_RemoveWeapon(self);
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Sword_01_06");	//Передай Хаш Тору, что я быть доволен его работа. Он настоящий мастер!
	B_LogEntry(TOPIC_HashTorOre,"Ур-Траллу понравился меч. Надо рассказать об этом Хаш Тору.");	
	UrTrallTakeSword = TRUE;
};

instance DIA_ORC_8550_URNAZUL_AZGALOR(C_Info)
{
	npc = orc_8550_urnazul;
	condition = DIA_ORC_8550_URNAZUL_AZGALOR_condition;
	information = DIA_ORC_8550_URNAZUL_AZGALOR_info;
	permanent = FALSE;
	description = "Для меня будут еще поручения?";
};

func int DIA_ORC_8550_URNAZUL_AZGALOR_condition()
{
	if((DARKMAGE_ISDEAD == TRUE) && (OrcIsBackTemple == TRUE))
	{
		return TRUE;
	};
};

func void DIA_ORC_8550_URNAZUL_AZGALOR_info()
{
	AI_Output(other,self,"DIA_Ass_127_Osair_AssasinGold_01_01");	//Для меня будут еще поручения?
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Hello_Info_18_21");	//Ур-Тралл не знать...(задумчиво) Нет, Ур-Тралл знать!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Hello_Info_18_22");	//Человек идти в старый дом Ур-Тралла, и убивать там Азгалора.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Hello_Info_18_25");	//Азгалор? Кто это?
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Hello_Info_18_33");	//Нет. Азгалор быть большой злой дракон. И он жить, где раньше жить Ур-Тралл.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Hello_Info_18_35");	//Дракон?! Ты хочешь чтобы я убил для тебя дракона? А разве вы не в союзе с ними?
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Hello_Info_18_42");	//Этот дракон другой. Аргххх... Азгалор злой, никого не жалеть!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Hello_Info_18_43");	//Много зим назад, Азгалор призывать демон - большой демон, сильный, звать Кузнец Душ.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Hello_Info_18_44");	//Демон служить Азгалору! Орки служить демону. Если браты хорошо служить, Азгалор обещать сделать братов сильный, чтобы победить врагов.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Hello_Info_18_45");	//Ур-Тралл не хотеть, говорить нельзя делать так! Демон — зло!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Hello_Info_18_46");	//Но браты не слушать Ур-Тралла. Браты пить кровь демона - становиться сильными и служить ему.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Hello_Info_18_47");	//Браты победить свой враг. А демон забирать души врагов и приносить дар Азгалору!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Hello_Info_18_48");	//Но Азгалор хотеть больше и больше душ! Кровь демона не давать покоя разуму и душа братов.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Hello_Info_18_49");	//Но настал момент и браты устать воевать - браты хотеть покой и мир. Они отказаться служить демон и Азгалор.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Hello_Info_18_51");	//Азгалор приказать убить их. Всех орки - Ур-Тралла и братов!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Hello_Info_18_52");	//Демон убивать много братов, забирать их души. Ур-Тралл выйти биться с ним. Позвать с собой брата — Ур-Грома.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Hello_Info_18_55");	//Брат и Ур-Тралл идти в долину - сражаться с демоном... Демон умирать! Брат умирать!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Hello_Info_18_56");	//Ур-Тралл ненавидеть Азгалора! Обещать мстить за смерть брата.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Hello_Info_18_57");	//И ты хочешь, чтобы я свершил месть вместо тебя?
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Hello_Info_18_58");	//Арррргххх...(гневно) Ур-Тралл не мочь вернуться. Ур-Трал проклят!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Hello_Info_18_59");	//Если Ур-Тралл идти домой, то быть сразу мертвый. Восстать и служить Азгалору!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Hello_Info_18_61");	//Служить, а надо убить. Человек понимать?!
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Hello_Info_18_62");	//Человек понимать...(подражая орку) Похоже, выбора у меня особа нету, я согласен. Где находится твой старый дом?
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Hello_Info_18_63");	//Человек понимать правильно! Хорошо. Дом Ур-Тралл быть далеко, ноги не ходить. Ходить магия!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Hello_Info_18_65");	//Ур-Тралл дать два камня. Человек искать внизу в пещере путь магия. Вход закрыт решетка. Человек ставить камень и открывать проход.
	B_GiveInvItems(self,other,itmi_1_orcportalstone,1);
	B_GiveInvItems(self,other,itmi_2_orcportalstone,1);
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Hello_Info_18_68");	//Теперь человек идти, Ур-Тралл ждать, ждать сердце Азголора.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Hello_Info_18_69");	//М-да, чую, придется попотеть! Ну что ж, орк, жди - скоро ты сможешь разорвать его сердце.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Hello_Info_18_70");	//Легкой дороги и удачной охоты тебе, человек.
	MIS_URNAZULRAGE = LOG_Running;
	Log_CreateTopic(TOPIC_URNAZULRAGE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_URNAZULRAGE,LOG_Running);
	B_LogEntry(TOPIC_URNAZULRAGE,"Ур-Трал попросил меня убить Азгалора, могущественного черного дракона! Когда то он напоил орков кровью демона, чтобы усилить их против врагов. Орки стали практически непобедимы, но подвластны демону и дракону, как их рабы. Азгалор и демон использовали орков, чтобы забирать души поверженных ими врагов.");
	B_LogEntry_Quiet(TOPIC_URNAZULRAGE,"Устав от постоянных кровавых войн, орки не захотели больше служить Азгалору и его демону. Дракон приказал демону принести души ослушников. Ур-Тралл с братом Ур-Громом сумели убить демона. Но победа стоила Ур-Грому жизни. Сердце Ур-Тралла жаждет отмщения Азгалору.");
	B_LogEntry_Quiet(TOPIC_URNAZULRAGE,"Черный дракон находится в Долине Теней. Попасть туда можно через телепорт, который находится в одной из пещер города орков. Ур-Тралл дал мне два магических камня, чтобы открыть решетку к порталу.");
	KNOWS_AZGOGLOR_SUMMON = FALSE;
	UrTrallOkShv = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_ORC_8550_URNAZUL_HELLO_2(C_Info)
{
	npc = orc_8550_urnazul;
	condition = dia_orc_8550_urnazul_hello_2_condition;
	information = dia_orc_8550_urnazul_hello_2_info;
	important = TRUE;
	permanent = FALSE;
};

func int dia_orc_8550_urnazul_hello_2_condition()
{
	if((MIS_URNAZULRAGE == LOG_Running) && (BLKDRAGNISDEAD == FALSE) && (GIVEPOTIONURNAZUL == FALSE))
	{
		return TRUE;
	};
};

func void dia_orc_8550_urnazul_hello_2_info()
{
	Snd_Play3d(self,"ORC_AMBIENT_SHORT02");
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Hello_2_Info_18_01");	//Человек, ждать еще. Ур-Тралл дать человек зелье. Человек пить зелье и быть сильный, совсем как орк.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Hello_2_Info_18_03");	//Очень кстати! Это уж точно мне не помешает, когда я буду рубить голову дракону.
	B_GiveInvItems(self,other,ItPo_Perm_STR,1);
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Hello_2_Info_18_04");	//Теперь человек идти.
	GIVEPOTIONURNAZUL = TRUE;
};

instance DIA_ORC_8550_URNAZUL_COMPLETE(C_Info)
{
	npc = orc_8550_urnazul;
	condition = dia_orc_8550_urnazul_complete_condition;
	information = dia_orc_8550_urnazul_complete_info;
	important = FALSE;
	permanent = TRUE;
	description = "Черный дракон Азгалор мертв!";
};

func int dia_orc_8550_urnazul_complete_condition()
{
	if((MIS_URNAZULRAGE == LOG_Running) && (BLKDRAGNISDEAD == TRUE) && (Npc_HasItems(other,itat_blackdragonheart) >= 1) && (AZGOLORCOMPLETE == FALSE))
	{
		return TRUE;
	};
};

func void dia_orc_8550_urnazul_complete_info()
{
	B_GivePlayerXP(2000);
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Complete_Info_18_01");	//Черный дракон Азгалор мертв! Вот его сердце.
	B_GiveInvItems(other,self,itat_blackdragonheart,1);
	Npc_RemoveInvItems(self,itat_blackdragonheart,1);
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Complete_Info_18_03");	//Ур-Тралл видеть, Азгалор умирать! Ур-Тралл отомстить проклятый дракон.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_DaggerDone_Info_01_01");	//Аргххх...(с уважением) Человек еще раз доказать, что он быть великий воин!
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_ORCTEMPLEISFREE_01_14");	//Спасибо.
	AI_PlayAni(self,"T_GREETGRD");
	MIS_URNAZULRAGE = LOG_SUCCESS;
	B_LogEntry(TOPIC_URNAZULRAGE,"Я принес Ур-Траллу сердце черного дракона.");
	Log_SetTopicStatus(TOPIC_URNAZULRAGE,LOG_SUCCESS);
	AZGOLORCOMPLETE = TRUE;
};

instance DIA_ORC_8550_URNAZUL_URGROM(C_Info)
{
	npc = orc_8550_urnazul;
	condition = dia_orc_8550_urnazul_urgrom_condition;
	information = dia_orc_8550_urnazul_urgrom_info;
	important = FALSE;
	permanent = TRUE;
	description = "И еще...";
};

func int dia_orc_8550_urnazul_urgrom_condition()
{
	if((AZGOLORCOMPLETE == TRUE) && (BROTHERCOMPLETE == FALSE) && (MEETURGROM > 0) && (UrGromIsDead == FALSE))
	{
		return TRUE;
	};
};

func void dia_orc_8550_urnazul_urgrom_info()
{
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_UrGrom_Info_18_01");	//И еще... Убив Азгалора, я снял проклятие, висевшее над всем твоими братьями.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_UrGrom_Info_18_02");	//Включая и... твоего брата, Ур-Грома.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_UrGrom_Info_18_03");	//(непонимающе) Ур-Тралл не понимать! Ур-Тралл думать, брат мертв!
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_UrGrom_Info_18_04");	//Твой брат жив, вождь. Именно он помог мне уничтожить эту тварь, чье сердце ты сейчас держишь в руке.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_UrGrom_Info_18_07");	//Собственно, все твои братья-призраки снова обрели материальную сущность. И сейчас живее всех живых.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_UrGrom_Info_18_08");	//Брат... брат.. Ур-Гром!!!...(ошеломленно)
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_UrGrom_Info_18_09");	//Ладно, орк, бывай. Я был рад нашему знакомству!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_UrGrom_Info_18_12");	//Подожди... человек принести новость - Ур-Тралл радоваться очень сильно!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_UrGrom_Info_18_15");	//Ур-Тралл благодарить человека. Надо думать, как.... Человек сам выбирать! Выбирать все, что хотеть.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_UrGrom_Info_18_16");	//Сейчас мне ничего не нужно. Но, возможно, в дальнейшем...
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_UrGrom_Info_18_17");	//Ур-Тралл дать слово, Ур-Тралл не забыть никогда! Человек приходить и просить. Ур-Тралл делать!
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_UrGrom_Info_18_20");	//Спасибо.
	BROTHERCOMPLETE = TRUE;
	ORCPROMISE = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_ORC_8550_URNAZUL_PROMISE(C_Info)
{
	npc = orc_8550_urnazul;
	condition = dia_orc_8550_urnazul_promise_condition;
	information = dia_orc_8550_urnazul_promise_info;
	important = FALSE;
	permanent = TRUE;
	description = "Ты знаешь орка по имени Ур-Шак?";
};

func int dia_orc_8550_urnazul_promise_condition()
{
	if((ORCPROMISE == TRUE) && (ORCPROMISEMAKE == FALSE))
	{
		return TRUE;
	};
};

func void dia_orc_8550_urnazul_promise_info()
{
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Promise_Info_01_00");	//Ты знаешь орка по имени Ур-Шак?
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Promise_Info_01_01");	//Да, быть большой, но странный сын духа, много зим назад. Хотеть дружить с человеки. Зачем он тебе?
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Promise_Info_01_02");	//Я знаю кто он такой, я знаю что именно за это орки и изгнали его.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Promise_Info_01_04");	//Ты обещал выполнить мою просьбу, так я прошу тебя: разреши ему вернуться и вновь стать шаманом, как раньше.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_LowLevel_01_11");		//Хмммм. Ур-Тралл помнить, что человек смог победить злой дракон.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_LowLevel_01_12");		//Тот быть такой же сильный, как и демон в глубокой шахта!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Promise_Info_01_05");	//Ур-Тралл не ждать такой просьба. Но Ур-Тралл сдержать слово!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Promise_Info_01_06");	//Ур-Шак быть прощен - мочь вернуться домой. Снова стать сыном духа!
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_Promise_Info_01_07");	//Спасибо тебе!
	B_LogEntry(TOPIC_Urshak,"Я поговорил с вождем орков об Ур-Шаке. Вождь не забыл о своем обещании и согласился выполнить мою просьбу. Теперь я должен найти Ур-Шака и рассказать ему об этом.");
	ORCPROMISEMAKE = TRUE;
};

//--------------------------------------Черная руда--------------------------------------------------------------

instance DIA_ORC_8550_URNAZUL_BLACKORE(C_Info)
{
	npc = orc_8550_urnazul;
	condition = dia_orc_8550_urnazul_blackore_condition;
	information = dia_orc_8550_urnazul_blackore_info;
	permanent = FALSE;
	description = "Поговаривают, будто вы, орки, знаете, где искать черную руду.";
};

func int dia_orc_8550_urnazul_blackore_condition()
{
	if((MIS_URNAZULRAGE == LOG_SUCCESS) && (FINDOREALREADY == FALSE) && Npc_KnowsInfo(hero,xbs_7513_darrion_blackore) && (RhetorikSkillValue[1] >= 75))
	{
		return TRUE;
	};
};

func void dia_orc_8550_urnazul_blackore_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_BlackOre_01_01");	//Поговаривают, будто вы, орки, знаете, где искать черную руду.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_BlackOre_01_02");	//Человек быть нужна черная руда?!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_BlackOre_01_04");	//Хммм...(задумчиво) Когда Ур-Тралл давно жить далеко с братами — находить много черной руды и делать крепкий доспех, убивать всех враг.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_BlackOre_01_05");	//Человек снова идти в долину, где жил Ур-Тралл, и искать руду там.
	B_LogEntry(TOPIC_GUARDIANS,"Даррион оказался прав. Ур-Тралл сказал мне, где можно найти драгоценную черную руду. Мне следует отправиться в Долину Теней и искать там.");
};

//-----------------------------------------------------Хаг-Тар------------------------------------------------

instance DIA_ORC_8550_URNAZUL_URHAN(C_Info)
{
	npc = orc_8550_urnazul;
	condition = dia_orc_8550_urnazul_urhan_condition;
	information = dia_orc_8550_urnazul_urhan_info;
	permanent = FALSE;
	description = "У меня есть к тебе одно дело.";
};

func int dia_orc_8550_urnazul_urhan_condition()
{
	if(MIS_KILLURTRALL == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_orc_8550_urnazul_urhan_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_UrHan_01_04");	//У меня есть к тебе одно дело. Ты знаешь орка по имени Хаг-Тар?
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_UrHan_01_05");	//Да, он быть один из моих самый лучший воин.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_UrHan_01_06");	//Ур-Тралл посылать его на войну с люди в большую долину, чтобы брать крепость.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_UrHan_01_07");	//И Хаг-Тар уже сделать это. Ур-Тралл уважать Хаг-Тар!
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_UrHan_01_08");	//Конечно, само собой! Вот только ты не знаешь, что этот твой генерал теперь хочет убить тебя.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_UrHan_01_09");	//Что?! Хаг-Тар хотеть смерти Ур-Тралл?
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_UrHan_01_10");	//Да, именно так! Поскольку намеревается сам стать вождем, вместо тебя.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_UrHan_01_11");	//ХАТАГ БАТ НАР!...(грозно) Если человек лгать — то человек умирать. Долго умирать. Быть много боль.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_UrHan_01_12");	//Я говорю правду. Хаг-Тар предложил мне убить тебя, пообещав взамен освободить захваченных в плен паладинов.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_UrHan_01_16");	//Если не веришь мне спроси Ур-Шака, он может подтвердить мои слова.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_UrHan_01_17");	//Сын духа говорить и человек говорить, значит быть правда. Ур-Тралл верить.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_UrHan_01_22");	//Но Ур-Тралл не понимать, почему человек рассказать мне?
	Info_ClearChoices(dia_orc_8550_urnazul_urhan);
	Info_AddChoice(dia_orc_8550_urnazul_urhan,"Просто не люблю убивать не предупредив!",dia_orc_8550_urnazul_urhan_killyou);

	if((CANFREEPALADIN == FALSE) && (CASTLEISFREE == FALSE))
	{
		Info_AddChoice(dia_orc_8550_urnazul_urhan,"У меня на то есть причина.",dia_orc_8550_urnazul_urhan_helpyou);
	};
};

func void dia_orc_8550_urnazul_urhan_killyou()
{
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_UrHan_KillYou_01_01");	//Просто не люблю убивать не предупредив!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_UrHan_KillYou_01_02");	//ХРОТОК ЯБАРТ!...(гневно) Так значит, ты все-таки решить бросить мне вызов?!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_UrHan_KillYou_01_06");	//Человек быть глупый, я разорвать человек на куски! Улу-Мулу не помочь. Арррррррг!!!
	URNAZULFUCKOFF = TRUE;
	ULUMULUISEQUIP_NO = TRUE;
	ULUMULUISEQUIP = FALSE;
	AI_StopProcessInfos(self);
	self.aivar[AIV_EnemyOverride] = FALSE;
};

func void dia_orc_8550_urnazul_urhan_helpyou()
{
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_UrHan_HelpYou_01_03");	//У меня на то есть причина. Я хочу, чтобы ты освободил плененных Хаг-Таром паладинов в крепости.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_UrHan_HelpYou_01_04");	//ХРОТОК ЯБАРТ! (гневно) Нет! Люди быть враги! Враги проиграть — должны умирать.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_UrHan_HelpYou_01_05");	//Вождь, жизнь нескольких людей в обмен на твою.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_UrHan_HelpYou_01_06");	//Хаг-Тар нанесет удар, не сегодня, так завтра. Не я, так кто-то из орков.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_UrHan_HelpYou_01_09");	//Аррргх... Ладно! Ур-Тралл отпустить людей, менять жизнь. Но не на свой, а на жизнь Хаг-Тар!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_UrHan_HelpYou_01_12");	//Человек убивать предателя - Ур-Тралл отпускать людей!
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_UrHan_HelpYou_01_13");	//Что?! И как я это сделаю? Он окружен нижними чинами.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_UrHan_HelpYou_01_14");	//Ни один орк в крепости не станет смотреть, как убивают его генерала.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_UrHan_HelpYou_01_15");	//(властно) Об этом человек может не волноваться!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_UrHan_HelpYou_01_16");	//Человек быть прав.... Ур-Тралл дать человек свой талисман - Тотем Сила! Он есть символ власти Ур-Тралл.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_UrHan_HelpYou_01_17");	//Ни один орк не посметь напасть на человек, если он его носить с собой.
	Info_ClearChoices(dia_orc_8550_urnazul_urhan);
	Info_AddChoice(dia_orc_8550_urnazul_urhan,"Я тебе не верю.",dia_orc_8550_urnazul_urhan_no);
	Info_AddChoice(dia_orc_8550_urnazul_urhan,"Ну хорошо! Я согласен.",dia_orc_8550_urnazul_urhan_Ок);
};

func void dia_orc_8550_urnazul_urhan_no()
{
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_UrHan_No_01_01");	//Я что, похож на идиота? Решил избавиться и от соперника, и от убийцы одни махом?
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_UrHan_No_01_02");	//Хммм...(задумчиво) Тогда человек не оставлять выбора Ур-Тралл!
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_UrHan_No_01_03");	//Я приказать своим воинам убивать человек, делать его мертвый.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_UrHan_No_01_04");	//Посмотрим, кто кого!
	URNAZULFUCKOFF = TRUE;
	ULUMULUISEQUIP_NO = TRUE;
	ULUMULUISEQUIP = FALSE;
	AI_StopProcessInfos(self);
	self.aivar[AIV_EnemyOverride] = FALSE;
};

func void dia_orc_8550_urnazul_urhan_Ок()
{
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_UrHan_Ок_01_01");	//Ну хорошо! Я согласен.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_UrHan_Ок_01_02");	//Тогда - вот, человек брать талисман и идти убивать Хаг-Тар!
	B_GiveInvItems(self,other,itmi_orcmaintotem,1);
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_UrHan_Ок_01_04");	//Само собой.
	URNAZULGIVETASK = TRUE;
	B_LogEntry(TOPIC_KILLURTRALL,"Я решил не торопить события и в начале поговорить с самим Ур-Траллом. Выслушав меня, верховный вождь дал мне другое поручение - убить самого предателя Хаг-Тара. Если мне удастся это сделать, он отпустит из плена Гаронда и его людей. Ур-Тралл дал мне свой талиснам - Тотем Силы, знак его власти. По его словам, орки не посмеют напасть на меня, если я брошу Хаг-Тару вызов.");
	AI_StopProcessInfos(self);
};

instance DIA_ORC_8550_URNAZUL_URHANKILLDONE(C_Info)
{
	npc = orc_8550_urnazul;
	condition = dia_orc_8550_urnazul_urhankilldone_condition;
	information = dia_orc_8550_urnazul_urhankilldone_info;
	permanent = FALSE;
	description = "Хаг-Тар мертв.";
};

func int dia_orc_8550_urnazul_urhankilldone_condition()
{
	if((MIS_KILLURTRALL == LOG_Running) && (KILLHAGTARURTRALL == TRUE))
	{
		return TRUE;
	};
};

func void dia_orc_8550_urnazul_urhankilldone_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_UrHanKillDone_01_01");	//Хаг-Тар мертв.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_UrHanKillDone_01_02");	//Быть хороший новость. Ур-Тралл быть доволен человек!
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_UrHanKillDone_01_03");	//Что насчет нашего уговора - ты отпустишь пленных паладинов?
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_UrHanKillDone_01_04");	//Сначала человек вернуть талисман силы. Потом говорить о люди.
	MIS_KILLURTRALL = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_KILLURTRALL,LOG_SUCCESS);
	B_LogEntry(TOPIC_KILLURTRALL,"Я сообщил Ур-Траллу о смерти Хаг-Тара. Думаю, теперь он отпустит паладинов.");
	Info_ClearChoices(dia_orc_8550_urnazul_urhankilldone);
	Info_AddChoice(dia_orc_8550_urnazul_urhankilldone,"Я оставлю его себе.",dia_orc_8550_urnazul_urhankilldone_no);

	if(Npc_HasItems(hero,itmi_orcmaintotem) >= 1)
	{
		Info_AddChoice(dia_orc_8550_urnazul_urhankilldone,"Вот, возьми его.",dia_orc_8550_urnazul_urhankilldone_Ок);
	};
};

func void dia_orc_8550_urnazul_urhankilldone_no()
{
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_UrHanKillDone_No_01_01");	//Зачем? Я оставлю его себе, полезная вещь.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_UrHanKillDone_No_01_02");	//Что?!...(гневно) Наглый человек! ХРОТОК ДЖАБАРТ!!!
	if(MIS_NEWSSURVIVERS == LOG_Running)
	{
		B_LogEntry(TOPIC_NEWSSURVIVERS,"Боюсь, теперь я вряд ли смогу договориться с орками, чтобы они отпустили Гаронда и его людей.");
	};
	BOGNARREFUSETALK = TRUE;
	Kurgan.aivar[93] = TRUE;
	URNAZULFUCKOFF = TRUE;
	ULUMULUISEQUIP_NO = TRUE;
	ULUMULUISEQUIP = FALSE;
	AI_StopProcessInfos(self);
	self.aivar[AIV_EnemyOverride] = FALSE;
};

func void dia_orc_8550_urnazul_urhankilldone_Ок()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_UrHanKillDone_Ок_01_01");	//Вот.
	B_GiveInvItems(other,self,itmi_orcmaintotem,1);
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_UrHanKillDone_Ок_01_02");	//Хорошо! Ур-Тралл тогда отпускать люди, как и обещать.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_UrHanKillDone_Ок_01_04");	//Спасибо, вождь.
	CANFREEPALADIN = TRUE;
	if(MIS_NEWSSURVIVERS == LOG_Running)
	{
		B_LogEntry(TOPIC_NEWSSURVIVERS,"Паладины теперь свободны! Надо сообщить им об этом.");
	};
	Info_ClearChoices(dia_orc_8550_urnazul_urhankilldone);
};

//---------------------------Гор Кар-------------------------------

instance DIA_ORC_7550_GORKAR_EXIT(C_Info)
{
	npc = ORC_7550_GORKAR;
	condition = dia_ORC_7550_GORKAR_exit_condition;
	information = dia_ORC_7550_GORKAR_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int dia_ORC_7550_GORKAR_exit_condition()
{
	return TRUE;
};

func void dia_ORC_7550_GORKAR_exit_info()
{
	AI_StopProcessInfos(self);
};

var int GorKarFM;

instance DIA_ORC_7550_GORKAR_NOHIFIRST(C_Info)
{
	npc = ORC_7550_GORKAR;
	condition = dia_ORC_7550_GORKAR_nohifirst_condition;
	information = dia_ORC_7550_GORKAR_nohifirst_info;
	important = TRUE;
	permanent = FALSE;
};

func int dia_ORC_7550_GORKAR_nohifirst_condition()
{
	if(PlayerKnowsOrcLanguage == FALSE)
	{
		return TRUE;
	};
};

func void dia_ORC_7550_GORKAR_nohifirst_info()
{
	if(GorKarFM == FALSE)
	{
		AI_Output(self,other,"DIA_Orc_7550_GorKar_NoHiFirst_01_01");	//КУТАР ГОР ДАР ДРАК! 
		AI_Output(self,other,"DIA_Orc_7550_GorKar_NoHiFirst_01_02");	//КРАТ БУР ШАР ДИР?
		AI_Output(other,self,"DIA_Orc_7550_GorKar_NoHiFirst_01_03");	//Эммм... Что ты говоришь?
		AI_Output(self,other,"DIA_Orc_7550_GorKar_NoHiFirst_01_04");	//МОРРА ТУП ДУР...(качает головой) ГОРКАР СТАР КАР ОР...
		GorKarFM = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Orc_7550_GorKar_NoHiFirst_01_05");	//МОРРА ГОР! ГОРКАР РАТ...
	};

	AI_StopProcessInfos(self);
};

instance DIA_ORC_7550_GORKAR_HIFIRST(C_Info)
{
	npc = ORC_7550_GORKAR;
	condition = dia_ORC_7550_GORKAR_hifirst_condition;
	information = dia_ORC_7550_GORKAR_hifirst_info;
	important = TRUE;
	permanent = TRUE;
};

func int dia_ORC_7550_GORKAR_hifirst_condition()
{
	if((PlayerKnowsOrcLanguage == TRUE) && (GorKarInv == FALSE))
	{
		return TRUE;
	};
};

func void dia_ORC_7550_GORKAR_hifirst_info()
{
	var C_Item itm;

	itm = Npc_GetEquippedArmor(other);

	if((Hlp_IsItem(itm,ITAR_ORCARMOR) == TRUE) || (Hlp_IsItem(itm,ITAR_ORCARMOR_DEX) == TRUE) || (Hlp_IsItem(itm,ITAR_SHAMANROBE) == TRUE))
	{
		if(GorKarFM == FALSE)
		{
			AI_Output(self,other,"DIA_Orc_7550_GorKar_HiFirst_01_01");	//(злобно) Что тебе здесь нужно, морра? Ты пришел сюда найти свой смерть?
		}
		else
		{
			AI_Output(self,other,"DIA_Orc_7550_GorKar_HiFirst_01_02");	//(злобно) Опять ты, морра. Ты все ищешь здесь свой смерть?
		};

		AI_Output(other,self,"DIA_Orc_7550_GorKar_HiFirst_01_03");	//Меня привело сюда несколько иное дело.
		AI_Output(self,other,"DIA_Orc_7550_GorKar_HiFirst_01_04");	//(удивленно) ХРОТ ДАР! Морра понимать язык орков?! ХАР ТУР РАТ...
		AI_Output(other,self,"DIA_Orc_7550_GorKar_HiFirst_01_05");	//Тебя это так удивляет?
		AI_Output(self,other,"DIA_Orc_7550_GorKar_HiFirst_01_06");	//Гор Кар еще никогда не встречать человек, который бы понимать его.
		AI_Output(self,other,"DIA_Orc_7550_GorKar_HiFirst_01_07");	//Но больше он удивляться тому, что тот носить доспех орочьей работы. Откуда он, морра?
		AI_Output(other,self,"DIA_Orc_7550_GorKar_HiFirst_01_08");	//Мне его дал Ур-Тралл, вождь одного орочьего клана. Слышал о таком?
		AI_Output(self,other,"DIA_Orc_7550_GorKar_HiFirst_01_09");	//ГРАТ, ГРАТ...(одобрительно кивает) Я знать большого вождя Ур-Тралла!
		AI_Output(self,other,"DIA_Orc_7550_GorKar_HiFirst_01_10");	//Он жить глубоко в гора и быть очень сильный воин.
		AI_Output(self,other,"DIA_Orc_7550_GorKar_HiFirst_01_11");	//Но Гор Кар не понимать, почему великий вождь подарить ему такой доспех.
		AI_Output(other,self,"DIA_Orc_7550_GorKar_HiFirst_01_12");	//Это долгая история, орк. Но если вкратце, то я просто помог Ур-Траллу в одном очень непростом деле.
		AI_Output(other,self,"DIA_Orc_7550_GorKar_HiFirst_01_14");	//И в знак своего уважения и благодарности он дал мне эти доспехи.
		AI_Output(self,other,"DIA_Orc_7550_GorKar_HiFirst_01_15");	//НУР ДАР...(растерянно) Гор Кар никогда не слышать подобного!
		AI_Output(self,other,"DIA_Orc_7550_GorKar_HiFirst_01_16");	//Люди всегда быть ему враг, а браты всегда их убивать и потом есть.
		AI_Output(self,other,"DIA_Orc_7550_GorKar_HiFirst_01_17");	//Но если сам великий вождь под горой уважать человек, Гор Кар не будет убивать морра.
		AI_Output(self,other,"DIA_Orc_7550_GorKar_HiFirst_01_18");	//Если тот не сделать ему ничего плохого.
		GorKarInv = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Orc_7550_GorKar_HiFirst_01_01");	//(злобно) Что тебе здесь нужно, морра? Ты пришел сюда найти свой смерть?
		AI_StopProcessInfos(self);
	};
};

instance DIA_ORC_7550_GORKAR_NoArmor(C_Info)
{
	npc = ORC_7550_GORKAR;
	condition = dia_ORC_7550_GORKAR_NoArmor_condition;
	information = dia_ORC_7550_GORKAR_NoArmor_info;
	permanent = FALSE;
	description = "А если бы на мне не было этих доспехов?";
};

func int dia_ORC_7550_GORKAR_NoArmor_condition()
{
	if(GorKarInv == TRUE)
	{
		return TRUE;
	};
};

func void dia_ORC_7550_GORKAR_NoArmor_info()
{
	AI_Output(other,self,"DIA_Orc_7550_GorKar_NoArmor_01_01");	//А если бы на мне не было этих доспехов?
	AI_Output(self,other,"DIA_Orc_7550_GorKar_NoArmor_01_02");	//Тогда Гор Кар убивать морра...(злобно) Все люди быть ему враг!
	AI_Output(other,self,"DIA_Orc_7550_GorKar_NoArmor_01_03");	//Выходит, что только из-за них ты со мной заговорил?
	AI_Output(self,other,"DIA_Orc_7550_GorKar_NoArmor_01_04");	//ХАР РАТ...(качая головой) Нет! Гор Кар просто стать интересно, кто быть морра и почему он носить доспех орков. 
	AI_Output(self,other,"DIA_Orc_7550_GorKar_NoArmor_01_05");	//Если бы Гор Кар быть это не интересно, то доспех не спасать человек от смерть.
	AI_Output(self,other,"DIA_Orc_7550_GorKar_NoArmor_01_06");	//И другие браты тоже убивать морра, если увидеть его!
	AI_Output(other,self,"DIA_Orc_7550_GorKar_NoArmor_01_07");	//Значит, мне просто повезло.
};

instance DIA_ORC_7550_GORKAR_Ulumulu(C_Info)
{
	npc = ORC_7550_GORKAR;
	condition = dia_ORC_7550_GORKAR_Ulumulu_condition;
	information = dia_ORC_7550_GORKAR_Ulumulu_info;
	permanent = FALSE;
	description = "У меня есть Улу-Мулу.";
};

func int dia_ORC_7550_GORKAR_Ulumulu_condition()
{
	if((Npc_KnowsInfo(other,DIA_Orc_7550_GorKar_NoArmor) == TRUE) && (Npc_HasItems(other,ITMW_2H_ORCPRESTIGE) >= 1))
	{
		return TRUE;
	};
};

func void dia_ORC_7550_GORKAR_Ulumulu_info()
{
	AI_Output(other,self,"DIA_Orc_7550_GorKar_Ulumulu_01_01");	//У меня есть Улу-Мулу.
	AI_Output(self,other,"DIA_Orc_7550_GorKar_Ulumulu_01_02");	//ГОР АХ, КУТУ...(с интересом) Что это быть?!
	AI_Output(other,self,"DIA_Orc_7550_GorKar_Ulumulu_01_03");	//Как?! Разве ты не знаешь?
	AI_Output(other,self,"DIA_Orc_7550_GorKar_Ulumulu_01_04");	//Это же знак силы орков! Его обладателя орки обычно не трогают.
	AI_Output(self,other,"DIA_Orc_7550_GorKar_Ulumulu_01_05");	//Гор Кар не знать, что за вещь человек показывать ему.
	AI_Output(self,other,"DIA_Orc_7550_GorKar_Ulumulu_01_06");	//Он видеть, что это тоже быть сделано орками. Но он не знать, для чего оно быть нужно!
	AI_Output(other,self,"DIA_Orc_7550_GorKar_Ulumulu_01_07");	//Как интересно. Выходит, что вы не похожи на других орков, если ничего не знаете про Улу-Мулу.
	AI_Output(self,other,"DIA_Orc_7550_GorKar_Ulumulu_01_09");	//АР ГАР...(кивая) Браты Гор Кара быть другие, чем те, что жить в большой долине.
	AI_Output(self,other,"DIA_Orc_7550_GorKar_Ulumulu_01_10");	//Орки жить в этих горах уже очень давно! У нас быть свой враг и свои обычаи.
};

instance DIA_ORC_7550_GORKAR_Difference(C_Info)
{
	npc = ORC_7550_GORKAR;
	condition = dia_ORC_7550_GORKAR_Difference_condition;
	information = dia_ORC_7550_GORKAR_Difference_info;
	permanent = FALSE;
	description = "У вас есть тут враг?!";
};

func int dia_ORC_7550_GORKAR_Difference_condition()
{
	if(Npc_KnowsInfo(other,DIA_Orc_7550_GorKar_Ulumulu) == TRUE)
	{
		return TRUE;
	};
};

func void dia_ORC_7550_GORKAR_Difference_info()
{
	AI_Output(other,self,"DIA_Orc_7550_GorKar_Difference_01_01");	//У вас есть тут враг?!
	AI_Output(self,other,"DIA_Orc_7550_GorKar_Difference_01_02");	//На севере этих гор находится большой клан Ледяного Ветра! Это быть наш самый грозный враг.
	AI_Output(self,other,"DIA_Orc_7550_GorKar_Difference_01_03");	//Гор Кар и его братья сражаться с их воинами уже очень много зим.
	AI_Output(other,self,"DIA_Orc_7550_GorKar_Difference_01_04");	//А как называется твой клан?
	AI_Output(self,other,"DIA_Orc_7550_GorKar_Difference_01_05");	//Огненный Камень! Сам Гор Кар жить там.
	AI_Output(other,self,"DIA_Orc_7550_GorKar_Difference_01_06");	//Ясно. И что же вы не поделили?
	AI_Output(self,other,"DIA_Orc_7550_GorKar_Difference_01_07");	//Браты всегда сражаться за руда магия! У кого руда больше, тот клан и сильней.
	AI_Output(other,self,"DIA_Orc_7550_GorKar_Difference_01_08");	//Так вы сражаетесь за магическую руду? Но зачем?!
	AI_Output(self,other,"DIA_Orc_7550_GorKar_Difference_01_09");	//Руда магия быть очень могущественная! Шаманы брать из нее силу, чтобы говорить с духами.
	AI_Output(self,other,"DIA_Orc_7550_GorKar_Difference_01_10");	//Сила руда защищать клан от разный беда. Поэтому ее надо очень много!
	AI_Output(self,other,"DIA_Orc_7550_GorKar_Difference_01_11");	//Наш враг тоже иметь очень много руда магия!
	AI_Output(self,other,"DIA_Orc_7550_GorKar_Difference_01_12");	//Если у них будет ее больше, то они становиться сильней и быстро побеждать нас.
	AI_Output(other,self,"DIA_Orc_7550_GorKar_Difference_01_13");	//Хммм... Как у вас все серьезно.
};

instance DIA_ORC_7550_GORKAR_WhatDo(C_Info)
{
	npc = ORC_7550_GORKAR;
	condition = dia_ORC_7550_GORKAR_WhatDo_condition;
	information = dia_ORC_7550_GORKAR_WhatDo_info;
	permanent = FALSE;
	description = "Что ты тут делаешь?";
};

func int dia_ORC_7550_GORKAR_WhatDo_condition()
{
	if(Npc_KnowsInfo(other,DIA_Orc_7550_GorKar_NoArmor) == TRUE)
	{
		return TRUE;
	};
};

func void dia_ORC_7550_GORKAR_WhatDo_info()
{
	AI_Output(other,self,"DIA_Orc_7550_GorKar_WhatDo_01_01");	//Что ты тут делаешь?
	AI_Output(self,other,"DIA_Orc_7550_GorKar_WhatDo_01_02");	//Гор Кар искать новое место для святилища братов! Это быть очень долгий и сложный дело.
	AI_Output(other,self,"DIA_Orc_7550_GorKar_WhatDo_01_03");	//А что случилось со старым?
	AI_Output(self,other,"DIA_Orc_7550_GorKar_WhatDo_01_04");	//На старое святилище нападать воины Ледяного Ветра! Много братов Гор Кара тогда было убито.
	AI_Output(self,other,"DIA_Orc_7550_GorKar_WhatDo_01_05");	//Теперь все они там мертвые и больше никого не пускают в храм. 
	AI_Output(self,other,"DIA_Orc_7550_GorKar_WhatDo_01_06");	//Орки больше не могут ходить туда говорить с духами.
};

instance DIA_ORC_7550_GORKAR_TrailOrcCamp(C_Info)
{
	npc = ORC_7550_GORKAR;
	condition = dia_ORC_7550_GORKAR_TrailOrcCamp_condition;
	information = dia_ORC_7550_GORKAR_TrailOrcCamp_info;
	permanent = FALSE;
	description = "У меня к тебе есть один вопрос.";
};

func int dia_ORC_7550_GORKAR_TrailOrcCamp_condition()
{
	if((Npc_KnowsInfo(other,DIA_Orc_7550_GorKar_Difference) == TRUE) && (CanTrailOrcCamp == TRUE) && (MIS_MissOldFriend == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_ORC_7550_GORKAR_TrailOrcCamp_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Orc_7550_GorKar_TrailOrcCamp_01_01");	//У меня есть к тебе один вопрос.
	AI_Output(self,other,"DIA_Orc_7550_GorKar_TrailOrcCamp_01_02");	//Что человек хотеть узнать у Гор Кара?
	AI_Output(other,self,"DIA_Orc_7550_GorKar_TrailOrcCamp_01_03");	//Я ищу здесь небольшой отряд людей. В последний раз он располагался в небольшом форте неподалеку отсюда.
	AI_Output(other,self,"DIA_Orc_7550_GorKar_TrailOrcCamp_01_04");	//Ты что-нибудь знаешь об этом?
	AI_Output(self,other,"DIA_Orc_7550_GorKar_TrailOrcCamp_01_05");	//ГРАТ ТАР...(качая головой) Гор Кару ничего неизвестно! Он не видеть никого из людей здесь уже очень давно.
	AI_Output(self,other,"DIA_Orc_7550_GorKar_TrailOrcCamp_01_06");	//Если кто-то и может знать о них, то только Грум Лок.
	AI_Output(other,self,"DIA_Orc_7550_GorKar_TrailOrcCamp_01_07");	//Грум Лок? Кто это?
	AI_Output(self,other,"DIA_Orc_7550_GorKar_TrailOrcCamp_01_08");	//Быть вождь нашего клана, быть самый сильный воин братов Гор Кара!
	AI_Output(other,self,"DIA_Orc_7550_GorKar_TrailOrcCamp_01_09");	//Что ж, придется мне наведаться к нему в гости.
	AI_Output(self,other,"DIA_Orc_7550_GorKar_TrailOrcCamp_01_10");	//Если человек просто придти в лагерь Гор Кара, орки убивать его. Они не станут говорить с ним без видимой на то причины.
	AI_Output(other,self,"DIA_Orc_7550_GorKar_TrailOrcCamp_01_11");	//И что же мне делать?
	AI_Output(self,other,"DIA_Orc_7550_GorKar_TrailOrcCamp_01_12");	//Морра должен принести братам то, ради чего они будут готовы тебя выслушать. 
	AI_Output(self,other,"DIA_Orc_7550_GorKar_TrailOrcCamp_01_13");	//Например то, что помогать им сражаться с их враг!
	AI_Output(other,self,"DIA_Orc_7550_GorKar_TrailOrcCamp_01_14");	//Хммм... Намекаешь на магическую руду?
	AI_Output(self,other,"DIA_Orc_7550_GorKar_TrailOrcCamp_01_15");	//Гор Кар думать, что за много кусков руда магия браты действительно не станут убивать человек.
	AI_Output(other,self,"DIA_Orc_7550_GorKar_TrailOrcCamp_01_16");	//'Много' это сколько?
	AI_Output(self,other,"DIA_Orc_7550_GorKar_TrailOrcCamp_01_17");	//Гор Кар думать, что не меньше сотни кусков. Или больше!
	AI_Output(other,self,"DIA_Orc_7550_GorKar_TrailOrcCamp_01_18");	//Но это же почти целая гора руды!
	AI_Output(self,other,"DIA_Orc_7550_GorKar_TrailOrcCamp_01_19");	//НУР ГАР...(качая головой) Меньше братам будет мало! Но человек уже сам решать, сколько стоит его жизнь.
	AI_Output(other,self,"DIA_Orc_7550_GorKar_TrailOrcCamp_01_20");	//Ладно, я тебя понял.
	B_LogEntry(TOPIC_MissOldFriend,"В горах я встретил орочьего шамана Гор Кара. Он не стал проявлять ко мне враждебность, поскольку его заинтересовали мои доспехи, подаренные мне Ур-Траллом. После разговора с ним я узнал, что о судьбе отряда Дариуса может знать вождь его клана - Грум Лок. Однако орки не станут со мной говорить, если я не принесу им то, что развяжет им языки. По мнению Гор Кара, это смогла бы сделать сотня кусков магической руды. Что же, придется немного погнуть спину в шахте, если я хочу заслужить внимания их вождя.");
	GorKarShowMe = TRUE;
};

instance DIA_ORC_7550_GORKAR_Perm(C_Info)
{
	npc = ORC_7550_GORKAR;
	condition = dia_ORC_7550_GORKAR_Perm_condition;
	information = dia_ORC_7550_GORKAR_Perm_info;
	permanent = TRUE;
	description = "Ну как, уже нашел подходящее место?";
};

func int dia_ORC_7550_GORKAR_Perm_condition()
{
	if(Npc_KnowsInfo(other,DIA_Orc_7550_GorKar_WhatDo) == TRUE)
	{
		return TRUE;
	};
};

func void dia_ORC_7550_GORKAR_Perm_info()
{
	AI_Output(other,self,"DIA_Orc_7550_GorKar_Perm_01_01");	//Ну как, уже нашел подходящее место?
	AI_Output(self,other,"DIA_Orc_7550_GorKar_Perm_01_02");	//Гор Кар все еще искать его. Человек не мешать!
	AI_StopProcessInfos(self);
};

//---------------------------Страж лагеря-------------------------------

instance DIA_GorkCampGuard_EXIT(C_Info)
{
	npc = GorkCampGuard;
	condition = DIA_GorkCampGuard_exit_condition;
	information = DIA_GorkCampGuard_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int DIA_GorkCampGuard_exit_condition()
{
	return TRUE;
};

func void DIA_GorkCampGuard_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_GorkCampGuard_Hello(C_Info)
{
	npc = GorkCampGuard;
	condition = DIA_GorkCampGuard_Hello_condition;
	information = DIA_GorkCampGuard_Hello_info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_GorkCampGuard_Hello_condition()
{
	if((PlayerKnowsOrcLanguage == TRUE) && (GorKarShowMe == TRUE))
	{
		return TRUE;
	};
};

func void DIA_GorkCampGuard_Hello_info()
{
	AI_Output(self,other,"DIA_GorkCampGuard_Hello_01_01");	//(удивленно) КРАТ ДАР! Первый раз видеть, чтобы еда сама приходить к братам!
	AI_Output(self,other,"DIA_GorkCampGuard_Hello_01_02");	//Наверно, духи сегодня быть очень добрый, если посылать ее нам.
	AI_Output(self,other,"DIA_GorkCampGuard_Hello_01_03");	//Сейчас морра быстро умирать! А браты его потом есть... У него быть вкусный мясо.
	AI_Output(other,self,"DIA_GorkCampGuard_Hello_01_04");	//Постой, орк! Может, сначала выслушаешь меня?
	AI_Output(self,other,"DIA_GorkCampGuard_Hello_01_05");	//(удивленно) ГОРА ДАР!!! Еда еще и уметь говорить по-орочьи?!
	AI_Output(other,self,"DIA_GorkCampGuard_Hello_01_06");	//Хватит уже удивляться! Я пришел, чтобы поговорить с вашим вождем Грум Локом.
	AI_Output(self,other,"DIA_GorkCampGuard_Hello_01_07");	//Морра знать о Грум Лок?! (растерянно) Зачем морра хотеть видеть вождь?
	Info_ClearChoices(DIA_GorkCampGuard_Hello);
	Info_AddChoice(DIA_GorkCampGuard_Hello,"Это тебя не касается, орк.",DIA_GorkCampGuard_Hello_No);

	if(Npc_HasItems(hero,ItMi_Nugget) >= 100)
	{
		Info_AddChoice(DIA_GorkCampGuard_Hello,"(показать магическую руду)",DIA_GorkCampGuard_Hello_Оre);
	};
};

func void DIA_GorkCampGuard_Hello_Оre()
{
	AI_Output(other,self,"DIA_GorkCampGuard_Ore_01_01");	//Вот - здесь ровно сто кусков магической руды.
	AI_Output(other,self,"DIA_GorkCampGuard_Ore_01_02");	//Я хочу передать ее вашему вождю в качестве небольшого подарка.
	AI_Output(self,other,"DIA_GorkCampGuard_Ore_01_03");	//БАР ТАК...(довольно) Руда магия! Много руда! Быть хорошо, братам нужно много руда магия.
	AI_Output(other,self,"DIA_GorkCampGuard_Ore_01_04");	//Так я могу пройти?
	AI_Output(self,other,"DIA_GorkCampGuard_Ore_01_05");	//Морра может идти к вождь, браты его не трогать.
	AI_Output(other,self,"DIA_GorkCampGuard_Ore_01_06");	//А где я смогу найти Грум Лока?
	AI_Output(self,other,"DIA_GorkCampGuard_Ore_01_07");	//Человек идти дальше и искать посередине горы большой пещера - вождь быть там.
	PassGrumLok = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_GorkCampGuard_Hello_No()
{
	AI_Output(other,self,"DIA_GorkCampGuard_Hello_No_01_01");	//Это тебя не касается, орк.
	AI_Output(self,other,"DIA_GorkCampGuard_Hello_No_01_02");	//Тогда браты убивать морра!
	FinishSTLSD = TRUE;
	AI_StopProcessInfos(self);
};

//---------------------------Вождь горных орков-------------------------------

instance DIA_GorkOrcBoss_EXIT(C_Info)
{
	npc = GorkOrcBoss_Rest;
	condition = DIA_GorkOrcBoss_exit_condition;
	information = DIA_GorkOrcBoss_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int DIA_GorkOrcBoss_exit_condition()
{
	return TRUE;
};

func void DIA_GorkOrcBoss_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_GorkOrcBoss_Hello(C_Info)
{
	npc = GorkOrcBoss_Rest;
	condition = DIA_GorkOrcBoss_Hello_condition;
	information = DIA_GorkOrcBoss_Hello_info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_GorkOrcBoss_Hello_condition()
{
	return TRUE;
};

func void DIA_GorkOrcBoss_Hello_info()
{
	AI_Output(self,other,"DIA_GorkOrcBoss_Hello_01_01");	//ДАР ТУК! (гневно) Кто пускать сюда морра?!
	AI_Output(other,self,"DIA_GorkOrcBoss_Hello_01_02");	//Я принес тебе подарок, вождь.
	AI_Output(self,other,"DIA_GorkOrcBoss_Hello_01_03");	//УР МОРА ДАР...(с интересом) Морра приносить подарок Грум Лок? Что это быть?
	Info_ClearChoices(DIA_GorkOrcBoss_Hello);
	Info_AddChoice(DIA_GorkOrcBoss_Hello,"Боюсь, у меня нет его с собой.",DIA_GorkOrcBoss_Hello_No);

	if(Npc_HasItems(other,ItMi_Nugget) >= 100)
	{
		Info_AddChoice(DIA_GorkOrcBoss_Hello,"Тут сто кусков магической руды для тебя.",DIA_GorkOrcBoss_Hello_Ore);
	};
};

func void DIA_GorkOrcBoss_Hello_No()
{
	AI_Output(other,self,"DIA_GorkOrcBoss_Hello_No_01_01");	//Боюсь, у меня нет его с собой.
	AI_Output(self,other,"DIA_GorkOrcBoss_Hello_No_01_02");	//Тогда морра сейчас умирать!
	FinishSTLSD = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_GorkOrcBoss_Hello_Ore()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_GorkOrcBoss_Hello_Ore_01_01");	//Тут сто кусков магической руды для тебя.
	B_GiveInvItems(other,self,ItMi_Nugget,100);
	Npc_RemoveInvItems(self,ItMi_Nugget,100);
	AI_Output(self,other,"DIA_GorkOrcBoss_Hello_Yes_01_02");	//Морра приносить Грум Лок руда магия?! Быть хорошо... очень хорошо.
	AI_Output(self,other,"DIA_GorkOrcBoss_Hello_Yes_01_03");	//Грум Лок нравиться подарок морра! Теперь он его не убивать.
	AI_Output(self,other,"DIA_GorkOrcBoss_Hello_Yes_01_04");	//Однако он до сих пор не понимать, зачем человек это делать.
	AI_Output(self,other,"DIA_GorkOrcBoss_Hello_Yes_01_05");	//И зачем приходить сюда?!
	GrumLokAgreed = TRUE;
	Info_ClearChoices(DIA_GorkOrcBoss_Hello);
};

instance DIA_GorkOrcBoss_Talk(C_Info)
{
	npc = GorkOrcBoss_Rest;
	condition = DIA_GorkOrcBoss_Talk_condition;
	information = DIA_GorkOrcBoss_Talk_info;
	permanent = FALSE;
	description = "Я ищу здесь небольшой отряд людей.";
};

func int DIA_GorkOrcBoss_Talk_condition()
{
	if((GrumLokAgreed == TRUE) && (MIS_MissOldFriend == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_GorkOrcBoss_Talk_info()
{
	AI_Output(other,self,"DIA_GorkOrcBoss_Talk_01_04");	//Я ищу здесь небольшой отряд людей. В последний раз он располагался в небольшом форте, на востоке.
	AI_Output(other,self,"DIA_GorkOrcBoss_Talk_01_05");	//Ты что-нибудь знаешь об этом?
	AI_Output(self,other,"DIA_GorkOrcBoss_Talk_01_06");	//Хммм...(задумчиво) Так значит, морра искать свой люди, раз приходить сюда.
	AI_Output(self,other,"DIA_GorkOrcBoss_Talk_01_07");	//Грум Лок немного знать об этом. Но он ничего не будет говорить человек!
	AI_Output(other,self,"DIA_GorkOrcBoss_Talk_01_08");	//Но почему?! Разве руды, которую я принес, недостаточно, чтобы развязать тебе язык?
	AI_Output(self,other,"DIA_GorkOrcBoss_Talk_01_09");	//Руда быть хорошо! Но быть очень мало...(качая головой)
	AI_Output(self,other,"DIA_GorkOrcBoss_Talk_01_10");	//Человек всегда быть враг Грум Лок! Поэтому тот должен убедиться, что человек можно доверять.
	AI_Output(self,other,"DIA_GorkOrcBoss_Talk_01_11");	//Морра должен принести Грум Лок доказательство! Тогда Грум Лок помогать человек.
	AI_Output(other,self,"DIA_GorkOrcBoss_Talk_01_12");	//И какое же доказательство тебе нужно?
	AI_Output(self,other,"DIA_GorkOrcBoss_Talk_01_13");	//Человек приносить голова его враг! Голова одного из старейшин клана Ледяного Ветра.
	AI_Output(self,other,"DIA_GorkOrcBoss_Talk_01_14");	//Тогда он верить человек и говорить с ним про люди.
	AI_Output(other,self,"DIA_GorkOrcBoss_Talk_01_15");	//Ну, хорошо! И где мне найти их старейшину?
	AI_Output(self,other,"DIA_GorkOrcBoss_Talk_01_16");	//Ходить в клан Ледяного Ветра и убивать старейшина там быть плохой идея.
	AI_Output(self,other,"DIA_GorkOrcBoss_Talk_01_17");	//Морра может погибнуть! Быть много сильный воин у врага.
	AI_Output(self,other,"DIA_GorkOrcBoss_Talk_01_18");	//Грум Лок знать, что на север у них быть небольшой лагерь.
	AI_Output(self,other,"DIA_GorkOrcBoss_Talk_01_19");	//Человек может ступать туда и искать старейшина там.
	AI_Output(other,self,"DIA_GorkOrcBoss_Talk_01_20");	//Ладно, попробую.
	MIS_GrumLockProve = LOG_Running;
	Log_CreateTopic(TOPIC_GrumLockProve,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GrumLockProve,LOG_Running);
	B_LogEntry(TOPIC_GrumLockProve,"Я поговорил с вождем, Грум Локом. Если я хочу узнать что-то о судьбе отряда Дариуса, мне в начале надо заручиться доверием вождя. Он попросил принести меня военный трофей - голову одного из старейшин клана 'Ледяного Ветра'. Только тогда Грум ЛОк скажет, что ему известно о людях.");
};

instance DIA_GorkOrcBoss_TalkGood(C_Info)
{
	npc = GorkOrcBoss_Rest;
	condition = DIA_GorkOrcBoss_TalkGood_condition;
	information = DIA_GorkOrcBoss_TalkGood_info;
	permanent = FALSE;
	description = "Вот голова орка-старейшины!";
};

func int DIA_GorkOrcBoss_TalkGood_condition()
{
	if((MIS_GrumLockProve == LOG_Running) && (Npc_HasItems(other,ItAt_OlderHead) >= 1))
	{
		return TRUE;
	};
};

func void DIA_GorkOrcBoss_TalkGood_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_GorkOrcBoss_TalkGood_01_01");	//Вот голова орка-старейшины!
	B_GiveInvItems(other,self,ItAt_OlderHead,1);
	Npc_RemoveInvItems(self,ItAt_OlderHead,1);
	AI_Output(self,other,"DIA_GorkOrcBoss_TalkGood_01_02");	//ГРАТ ГРАТ...(с уважением) Человек не соврать! Он действительно принести голова враг Грум Лок.
	AI_Output(self,other,"DIA_GorkOrcBoss_TalkGood_01_03");	//Он знать этот старейшина - его звать Морк Ут. Тот убивать много братов Грум Лок.
	AI_Output(self,other,"DIA_GorkOrcBoss_TalkGood_01_04");	//Теперь они быть отомщены! Теперь Грум Лок уважать человек и доверять ему.
	MIS_GrumLockProve = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_GrumLockProve,LOG_SUCCESS);
	B_LogEntry(TOPIC_GrumLockProve,"Я принес Грум Локу голову старейшины клана Ледяного Ветра. Думаю, теперь он станет посговорчивей.");
}; 

instance DIA_GorkOrcBoss_Darius(C_Info)
{
	npc = GorkOrcBoss_Rest;
	condition = DIA_GorkOrcBoss_Darius_condition;
	information = DIA_GorkOrcBoss_Darius_info;
	permanent = FALSE;
	description = "Так что насчет людей?";
};

func int DIA_GorkOrcBoss_Darius_condition()
{
	if((MIS_GrumLockProve == LOG_SUCCESS) && (MIS_MissOldFriend == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_GorkOrcBoss_Darius_info()
{
	AI_Output(other,self,"DIA_GorkOrcBoss_Darius_01_01");	//Так что насчет людей?
	AI_Output(self,other,"DIA_GorkOrcBoss_Darius_01_02");	//Грум Лок обещать человек, Грум Лок держать свой слово...
	AI_StopProcessInfos(self);
	DariusInsert = TRUE;
	Wld_InsertNpc(SLD_852_Darius,"ORC_DARIUS");

};

instance DIA_GorkOrcBoss_Clans(C_Info)
{
	npc = GorkOrcBoss_Rest;
	condition = DIA_GorkOrcBoss_Clans_condition;
	information = DIA_GorkOrcBoss_Clans_info;
	permanent = FALSE;
	description = "Тут есть еще другие кланы орков?";
};

func int DIA_GorkOrcBoss_Clans_condition()
{
	if(MIS_GrumLockProve == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_GorkOrcBoss_Clans_info()
{
	AI_Output(other,self,"DIA_GorkOrcBoss_Clans_01_01");	//Тут есть еще другие кланы орков?
	AI_Output(self,other,"DIA_GorkOrcBoss_Clans_01_02");	//Далеко в горах быть еще много кланов братов.
	AI_Output(self,other,"DIA_GorkOrcBoss_Clans_01_03");	//Но они не ходить сюда! Быть очень длинная дорога через горы.
};

instance DIA_GorkOrcBoss_War(C_Info)
{
	npc = GorkOrcBoss_Rest;
	condition = DIA_GorkOrcBoss_War_condition;
	information = DIA_GorkOrcBoss_War_info;
	permanent = FALSE;
	description = "Почему вы воюете с кланом 'Ледяного Ветра'?";
};

func int DIA_GorkOrcBoss_War_condition()
{
	if(MIS_GrumLockProve == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_GorkOrcBoss_War_info()
{
	AI_Output(other,self,"DIA_GorkOrcBoss_War_01_01");	//Почему вы воюете с кланом Ледяного Ветра?
	AI_Output(self,other,"DIA_GorkOrcBoss_War_01_02");	//Они хотеть захватить наш земля! Грум Лок и браты защищать ее.
	AI_Output(other,self,"DIA_GorkOrcBoss_War_01_03");	//А почему вы уверены, что она ваша?
	AI_Output(self,other,"DIA_GorkOrcBoss_War_01_04");	//Мой клан первый заселить эти горы, жить тут много зим, строить много святилищ предков.
	AI_Output(self,other,"DIA_GorkOrcBoss_War_01_05");	//Потом сюда придти клан Ледяного Ветра! Они стать убивать моих братов и уничтожать наш жертвенный алтарь. 
	AI_Output(self,other,"DIA_GorkOrcBoss_War_01_06");	//Грум Лок гневаться, браты гневаться! Дать клятва уничтожить их всех.
	AI_Output(self,other,"DIA_GorkOrcBoss_War_01_07");	//Теперь они быть его кровный враг. Грум Лок желать их смерть больше всех!
	AI_Output(other,self,"DIA_GorkOrcBoss_War_01_08");	//Понятно.
};

instance DIA_GorkOrcBoss_WarDo(C_Info)
{
	npc = GorkOrcBoss_Rest;
	condition = DIA_GorkOrcBoss_WarDo_condition;
	information = DIA_GorkOrcBoss_WarDo_info;
	permanent = FALSE;
	description = "Почему вы не нападете на их лагерь?";
};

func int DIA_GorkOrcBoss_WarDo_condition()
{
	if(Npc_KnowsInfo(hero,DIA_GorkOrcBoss_War) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_GorkOrcBoss_WarDo_info()
{
	AI_Output(other,self,"DIA_GorkOrcBoss_WarDo_01_01");	//Почему вы не нападете на их лагерь?
	AI_Output(self,other,"DIA_GorkOrcBoss_WarDo_01_02");	//Быть очень опасно...(качая головой) Если мы атаковать, шаман Ледяного Ветра использовать сила руда магия.
	AI_Output(self,other,"DIA_GorkOrcBoss_WarDo_01_03");	//Враг иметь очень много руда магия! Много братов Грум Лока тогда погибать.
	AI_Output(other,self,"DIA_GorkOrcBoss_WarDo_01_04");	//А каким образом они используют магическую руду?
	AI_Output(self,other,"DIA_GorkOrcBoss_WarDo_01_05");	//Их шаман заклинать духов, чтобы наделять наш враг огромная сила, если быть рядом с руда магия.
	AI_Output(self,other,"DIA_GorkOrcBoss_WarDo_01_06");	//Враг становиться очень злой и очень сильный! Браты Грум Лока не победить их.
	AI_Output(self,other,"DIA_GorkOrcBoss_WarDo_01_07");	//Человек тоже не ходить туда. Иначе становиться быстро мертвый!
};

instance DIA_GorkOrcBoss_Ruda(C_Info)
{
	npc = GorkOrcBoss_Rest;
	condition = DIA_GorkOrcBoss_Ruda_condition;
	information = DIA_GorkOrcBoss_Ruda_info;
	permanent = FALSE;
	description = "У твоего клана тоже есть целая гора руды!";
};

func int DIA_GorkOrcBoss_Ruda_condition()
{
	if(Npc_KnowsInfo(hero,DIA_GorkOrcBoss_WarDo) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_GorkOrcBoss_Ruda_info()
{
	AI_Output(other,self,"DIA_GorkOrcBoss_Ruda_01_01");	//У твоего клана тоже есть целая гора руды!
	AI_Output(self,other,"DIA_GorkOrcBoss_Ruda_01_02");	//Но наш шаман не знать ее секрет...(качая головой) Мы не знать, как использовать сила руда магия.
	AI_Output(self,other,"DIA_GorkOrcBoss_Ruda_01_03");	//Правда, враг думать иначе! Он не знать этого и бояться приходить сюда.
	AI_Output(other,self,"DIA_GorkOrcBoss_Ruda_01_04");	//Ах, вот оно как.
};

instance DIA_GorkOrcBoss_WhatDo(C_Info)
{
	npc = GorkOrcBoss_Rest;
	condition = DIA_GorkOrcBoss_WhatDo_condition;
	information = DIA_GorkOrcBoss_WhatDo_info;
	permanent = FALSE;
	description = "И как же победить их?";
};

func int DIA_GorkOrcBoss_WhatDo_condition()
{
	if(Npc_KnowsInfo(hero,DIA_GorkOrcBoss_WarDo) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_GorkOrcBoss_WhatDo_info()
{
	AI_Output(other,self,"DIA_GorkOrcBoss_WhatDo_01_01");	//И как же тогда победить их?
	AI_Output(self,other,"DIA_GorkOrcBoss_WhatDo_01_02");	//Надо забрать магия из руда! Тогда браты Грум Лока смогут одолеть свой враг.
	AI_Output(self,other,"DIA_GorkOrcBoss_WhatDo_01_03");	//Но Грум Лок не знать, как это сделать. Может быть у человек это получиться?
	AI_Output(self,other,"DIA_GorkOrcBoss_WhatDo_01_04");	//Грум Лок давать морра самое ценное, если тот помогать ему уничтожить гора руда магия у враг!
	AI_Output(other,self,"DIA_GorkOrcBoss_WhatDo_01_05");	//А самое ценное - это что?
	AI_Output(self,other,"DIA_GorkOrcBoss_WhatDo_01_06");	//Черный руда, очень редкий руда, много черный руда!
	AI_Output(self,other,"DIA_GorkOrcBoss_WhatDo_01_07");	//Или он потом может сам выбрать свой награда.
	AI_Output(other,self,"DIA_GorkOrcBoss_WhatDo_01_08");	//Я подумаю над твоим предложением.
	MIS_ClansWar = LOG_Running;
	Log_CreateTopic(TOPIC_ClansWar,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ClansWar,LOG_Running);
	B_LogEntry(TOPIC_ClansWar,"Грум Лок пообещал мне щедрую награду, если я помогу ему одолеть клан Ледяного Ветра. Проблема в том, что воинов враждебного клана защищает магия руды. Если мне удастся лишить их этого преимущества, Грум Лок сможет послать своих воинов на бой с ними.");
};

instance DIA_GorkOrcBoss_WhatDoDone(C_Info)
{
	npc = GorkOrcBoss_Rest;
	condition = DIA_GorkOrcBoss_WhatDoDone_condition;
	information = DIA_GorkOrcBoss_WhatDoDone_info;
	permanent = FALSE;
	description = "Твой враг лишился силы магической руды.";
};

func int DIA_GorkOrcBoss_WhatDoDone_condition()
{
	if((MIS_ClansWar == LOG_Running) && (MagicPlace05 == TRUE))
	{
		return TRUE;
	};
};

func void DIA_GorkOrcBoss_WhatDoDone_info()
{
	B_GivePlayerXP(2500);
	AI_Output(other,self,"DIA_GorkOrcBoss_WhatDoDone_01_01");	//Твой враг в скором времени лишится силы магической руды.
	AI_Output(self,other,"DIA_GorkOrcBoss_WhatDoDone_01_02");	//Морра быть точно уверен в этом?!
	AI_Output(other,self,"DIA_GorkOrcBoss_WhatDoDone_01_03");	//Можешь отправить туда своих воинов и проверить это. 
	AI_Output(other,self,"DIA_GorkOrcBoss_WhatDoDone_01_04");	//И лучше не терять времени, пока те вновь не насобирали новую!
	AI_Output(self,other,"DIA_GorkOrcBoss_WhatDoDone_01_05");	//Хммм...(задумчиво) Тогда Грум Лок думать, что лучшего момента для атака у братов не быть.
	AI_Output(self,other,"DIA_GorkOrcBoss_WhatDoDone_01_06");	//Он сейчас же посылать туда свой самый лучший воин!
	AI_Output(self,other,"DIA_GorkOrcBoss_WhatDoDone_01_07");	//Если хотеть, человек тоже может поучаствовать в битва. Помочь братам Грум Лока одолеть их враг.
	AI_Output(other,self,"DIA_GorkOrcBoss_WhatDoDone_01_08");	//Именно это я и собирался сделать.
	AI_Output(self,other,"DIA_GorkOrcBoss_WhatDoDone_01_09");	//Тогда морра не терять времени! Ступать и помогать братам Грум Лок.
	B_LogEntry(TOPIC_ClansWar,"Я сообщил Грум Локу о том, что мне удалось забрать всю силу магической руды у клана Ледяного Ветра. Теперь необходимо отправиться туда с его воинами и уничтожить вражеский лагерь.");
	LessMagicPower = TRUE;
	AI_StopProcessInfos(self);
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_LOA_ORCCAMP_01");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_LOA_ORCCAMP_02");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_CAMP_02_10");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_CAMP_02_11");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_LOA_ORCCAMP_07");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_LOA_ORCCAMP_07_01");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_LOA_ORCCAMP_06");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_CAMP_02_21");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_CAMP_02_23");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_CAMP_02_22");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_ORCWARRIOR_01");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_CAMP_02_12");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_CAMP_02_01");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_ORCWARRIOR_03");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_CAMP_02_13");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_CAMP_02_14");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_CAMP_02_15");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_CAMP_02_02");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_CAMP_02_04");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_ORC_HIGHGUARD_01");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_CAMP_02_07");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_ORCPWARRIOR_01");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_ORC_HIGHGUARD_03");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_CAMP_02_03");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_CAMP_02_06");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_CAMP_02_05");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_CAMP_02_19");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_CAMP_02_20");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_CAMP_02_09");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_CAMP_02_18");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_CAMP_02_16");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_CAMP_02_17");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_LOA_ORCCAMP_03");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_CAMP_02_08");
};

instance DIA_GorkOrcBoss_WarWin(C_Info)
{
	npc = GorkOrcBoss_Rest;
	condition = DIA_GorkOrcBoss_WarWin_condition;
	information = DIA_GorkOrcBoss_WarWin_info;
	permanent = FALSE;
	description = "Вождь клана Ледяного Ветра мертв.";
};

func int DIA_GorkOrcBoss_WarWin_condition()
{
	if((MIS_ClansWar == LOG_Running) && (LessMagicPower == TRUE) && (MorkOrcBossIsDead == TRUE))
	{
		return TRUE;
	};
};

func void DIA_GorkOrcBoss_WarWin_info()
{
	B_GivePlayerXP(2500);
	AI_Output(other,self,"DIA_GorkOrcBoss_WarWin_01_01");	//Вождь клана Ледяного Ветра мертв.
	AI_Output(self,other,"DIA_GorkOrcBoss_WarWin_01_02");	//ХРОБОР ЯРАТ...(довольно) Быть самый лучший новость для Грум Лок!
	AI_Output(self,other,"DIA_GorkOrcBoss_WarWin_01_03");	//Его враг быть мертвый, и теперь весь этот земля снова быть наша.
	AI_Output(self,other,"DIA_GorkOrcBoss_WarWin_01_04");	//Грум Лок отомстить за своих братов и благодарить морра, что тот ему помогать.
	AI_Output(self,other,"DIA_GorkOrcBoss_WarWin_01_05");	//НУР ГАТ...(с уважением)
	AI_PlayAni(self,"T_GREETGRD");
	MIS_ClansWar = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_ClansWar,LOG_SUCCESS);
	B_LogEntry(TOPIC_ClansWar,"Я сообщик Грум Локу о том, что его враг повержен. Вождь радовался как ребенок, которому подарили игрушку.");

};

instance DIA_GorkOrcBoss_FreeDar(C_Info)
{
	npc = GorkOrcBoss_Rest;
	condition = DIA_GorkOrcBoss_FreeDar_condition;
	information = DIA_GorkOrcBoss_FreeDar_info;
	permanent = FALSE;
	description = "Что ты хочешь за жизнь пленника?";
};

func int DIA_GorkOrcBoss_FreeDar_condition()
{
	if((NeedDariusFree == TRUE) && (MIS_MissOldFriend == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_GorkOrcBoss_FreeDar_info()
{
	AI_Output(other,self,"DIA_GorkOrcBoss_FreeDar_01_01");	//Что ты хочешь за жизнь твоего пленника?
	AI_Output(self,other,"DIA_GorkOrcBoss_FreeDar_01_02");	//ГРОК ТАР...(задумчиво) Грум Лок думать, что жизнь человек-раб стоить очень дорого.
	AI_Output(self,other,"DIA_GorkOrcBoss_FreeDar_01_03");	//Морра должен давать Грум Лок очень ценный вещь, чтобы тот согласиться отпустить его.
	AI_Output(other,self,"DIA_GorkOrcBoss_FreeDar_01_04");	//Я должен принести тебе еще магической руды?
	AI_Output(self,other,"DIA_GorkOrcBoss_FreeDar_01_05");	//Нет. Грум Лок она пока не нужна.
	AI_Output(self,other,"DIA_GorkOrcBoss_FreeDar_01_06");	//На этот раз морра приносить Грум Лок большой шкура белый горный тролль.
	AI_Output(self,other,"DIA_GorkOrcBoss_FreeDar_01_07");	//Этот зверь быть очень редкий, а шкура быть очень ценный!
	AI_Output(self,other,"DIA_GorkOrcBoss_FreeDar_01_08");	//Морра приносить ее Грум Лок, а он тогда отпускать человек-раб.
	AI_Output(other,self,"DIA_GorkOrcBoss_FreeDar_01_09");	//А где живет этот тролль?
	AI_Output(self,other,"DIA_GorkOrcBoss_FreeDar_01_10");	//Большой зверь жить в огромный пещера, там где быть высокий гора.
	AI_Output(other,self,"DIA_GorkOrcBoss_FreeDar_01_11");	//Мы и так в горах. Может, скажешь поточнее?
	AI_Output(self,other,"DIA_GorkOrcBoss_FreeDar_01_12");	//Грум Лок говорить о гора, который быть недалеко у старый лагерь люди.
	AI_Output(self,other,"DIA_GorkOrcBoss_FreeDar_01_13");	//Человек должен искать зверя там! Гора быть большой, морра найти ее быстро.
	MIS_FreePrice = LOG_Running;
	Log_CreateTopic(TOPIC_FreePrice,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FreePrice,LOG_Running);
	B_LogEntry(TOPIC_FreePrice,"Грум Лок согласился отпустить Дариуса в обмен на большую шкуру горного белого тролля.");
};

instance DIA_GorkOrcBoss_FreeDarius(C_Info)
{
	npc = GorkOrcBoss_Rest;
	condition = DIA_GorkOrcBoss_FreeDarius_condition;
	information = DIA_GorkOrcBoss_FreeDarius_info;
	permanent = FALSE;
	description = "Вот твоя шкура.";
};

func int DIA_GorkOrcBoss_FreeDarius_condition()
{
	if((MIS_FreePrice == LOG_Running) && (Npc_HasItems(other,ItAt_WhiteTroll) >= 1))
	{
		return TRUE;
	};
};

func void DIA_GorkOrcBoss_FreeDarius_info()
{
	B_GivePlayerXP(1500);
	AI_Output(other,self,"DIA_GorkOrcBoss_FreeDarius_01_01");	//Вот твоя шкура.
	B_GiveInvItems(other,self,ItAt_WhiteTroll,1);
	Npc_RemoveInvItems(self,ItAt_WhiteTroll,1);
	AI_Output(other,self,"DIA_GorkOrcBoss_FreeDarius_01_02");	//Теперь ты отпустишь Дариуса?
	AI_Output(self,other,"DIA_GorkOrcBoss_FreeDarius_01_03");	//Хорошо...(серьезно) Человек-раб теперь быть свободен!
	AI_Output(self,other,"DIA_GorkOrcBoss_FreeDarius_01_04");	//Он может идти обратно в свой клан.
	AI_Output(other,self,"DIA_GorkOrcBoss_FreeDarius_01_05");	//Благодарю тебя, вождь.
	MIS_FreePrice = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_FreePrice,LOG_SUCCESS);
	B_LogEntry(TOPIC_FreePrice,"Я принес Грум Локу шкуру белого тролля, и он согласился отпустить Дариуса. Теперь старый друг Ли свободен...");
};

instance DIA_GorkOrcBoss_Perm(C_Info)
{
	npc = GorkOrcBoss_Rest;
	condition = DIA_GorkOrcBoss_Perm_condition;
	information = DIA_GorkOrcBoss_Perm_info;
	permanent = TRUE;
	description = "Как дела, вождь?";
};

func int DIA_GorkOrcBoss_Perm_condition()
{
	if(MIS_FreePrice == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_GorkOrcBoss_Perm_info()
{
	AI_Output(other,self,"DIA_GorkOrcBoss_Perm_01_01");	//Как дела, вождь?

	if(MIS_ClansWar == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_GorkOrcBoss_Perm_01_02");	//Все быть хорошо, морра!
	}
	else
	{
		AI_Output(self,other,"DIA_GorkOrcBoss_Perm_01_03");	//Пока враг быть жив, все быть очень плохо. 
	};
};

instance DIA_GorkOrcBoss_NeedPathDarius(C_Info)
{
	npc = GorkOrcBoss_Rest;
	condition = DIA_GorkOrcBoss_NeedPathDarius_condition;
	information = DIA_GorkOrcBoss_NeedPathDarius_info;
	permanent = FALSE;
	description = "Ему понадобится проводник.";
};

func int DIA_GorkOrcBoss_NeedPathDarius_condition()
{
	if((MIS_FreePrice == LOG_SUCCESS) && (MIS_MissOldFriend == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_GorkOrcBoss_NeedPathDarius_info()
{
	AI_Output(other,self,"DIA_GorkOrcBoss_NeedPathDarius_01_01");	//Ему понадобится проводник.

	if(MIS_ClansWar == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_GorkOrcBoss_NeedPathDarius_01_02");	//Морра помогать Грум Лок победить его самый главный враг!
		AI_Output(self,other,"DIA_GorkOrcBoss_NeedPathDarius_01_03");	//Он дать человек несколько воин, чтобы те показать морра, как спускаться с гор.
		AI_Output(other,self,"DIA_GorkOrcBoss_NeedPathDarius_01_04");	//Спасибо.
		DariusHasPath = TRUE;
		B_LogEntry(TOPIC_MissOldFriend,"Вождь Грум Лок согласился дать Дариусу несколько воинов в качестве проводников. Те помогут ему спуститься с гор. Пора поговорить с самим Дариусом.");
	}
	else
	{
		AI_PlayAni(self,"T_NO");
		AI_Output(self,other,"DIA_GorkOrcBoss_NeedPathDarius_01_05");	//Грум Лок не будет помогать морра...(качая головой)
		AI_Output(self,other,"DIA_GorkOrcBoss_NeedPathDarius_01_06");	//Он не может сейчас дать свой воин, чтобы показать человек дорога.
		AI_Output(self,other,"DIA_GorkOrcBoss_NeedPathDarius_01_07");	//Если враг нападать, Грум Локу нужен будет много воин, чтобы защищать лагерь!
		AI_Output(self,other,"DIA_GorkOrcBoss_NeedPathDarius_01_08");	//Когда он победить свой враг, тогда Грум Лок их дать.
		AI_Output(other,self,"DIA_GorkOrcBoss_NeedPathDarius_01_09");	//Понятно.
		B_LogEntry(TOPIC_MissOldFriend,"Вождь Грум Лок даст проводников только в том случае, если враждебный клан Ледяного Ветра будет уничтожен.");
		NeedDeastoyWind = TRUE;
	};
};

instance DIA_GorkOrcBoss_NeedPathDariusDone(C_Info)
{
	npc = GorkOrcBoss_Rest;
	condition = DIA_GorkOrcBoss_NeedPathDariusDone_condition;
	information = DIA_GorkOrcBoss_NeedPathDariusDone_info;
	permanent = FALSE;
	description = "Теперь ты дашь проводников?";
};

func int DIA_GorkOrcBoss_NeedPathDariusDone_condition()
{
	if((NeedDeastoyWind == TRUE) && (MIS_MissOldFriend == LOG_Running) && (MIS_ClansWar == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_GorkOrcBoss_NeedPathDariusDone_info()
{
	AI_Output(other,self,"DIA_GorkOrcBoss_NeedPathDariusDone_01_01");	//Теперь ты дашь проводников?
	AI_Output(self,other,"DIA_GorkOrcBoss_NeedPathDariusDone_01_02");	//Морра помогать Грум Лок победить его самый главный враг!
	AI_Output(self,other,"DIA_GorkOrcBoss_NeedPathDariusDone_01_03");	//Он дать человек несколько воин, чтобы те показать морра, как спускаться с гор.
	AI_Output(other,self,"DIA_GorkOrcBoss_NeedPathDariusDone_01_04");	//Спасибо.
	DariusHasPath = TRUE;
	B_LogEntry(TOPIC_MissOldFriend,"Вождь Грум Лок согласился дать Дариусу несколько воинов в качестве проводников. Те помогут ему спуститься с гор. Пора поговорить с самим Дариусом.");
};