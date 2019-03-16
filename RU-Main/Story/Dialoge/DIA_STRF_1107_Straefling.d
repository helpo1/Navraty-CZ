
instance DIA_STRF_1107_EXIT(C_Info)
{
	npc = STRF_1107_Straefling;
	nr = 999;
	condition = DIA_STRF_1107_EXIT_Condition;
	information = DIA_STRF_1107_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_STRF_1107_EXIT_Condition()
{
	return TRUE;
};

func void DIA_STRF_1107_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_STRF_1107_FINGER(C_Info)
{
	npc = STRF_1107_Straefling;
	condition = DIA_STRF_1107_FINGER_Condition;
	information = DIA_STRF_1107_FINGER_Info;
	important = TRUE;
};


func int DIA_STRF_1107_FINGER_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_STRF_1107_FINGER_Info()
{
	AI_Output(self,other,"DIA_STRF_1107_FINGER_01_00");	//Руки прочь от моих горшков! Никому не позволено притрагиваться к моим горшкам, понятно?!
	AI_Output(self,other,"DIA_STRF_1107_FINGER_01_01");	//Я отвечаю за пищу, и это означает, что никто другой не лезет в мои дела! Надеюсь, я понятно выражаюсь!
};

instance DIA_STRF_1107_COOK(C_Info)
{
	npc = STRF_1107_Straefling;
	condition = DIA_STRF_1107_COOK_Condition;
	information = DIA_STRF_1107_COOK_Info;
	description = "Кто назначил тебя поваром?";
};

func int DIA_STRF_1107_COOK_Condition()
{
	if(Npc_KnowsInfo(hero,dia_strf_1107_finger))
	{
		return TRUE;
	};
};

func void DIA_STRF_1107_COOK_Info()
{
	AI_Output(other,self,"DIA_STRF_1107_COOK_15_00");	//Кто назначил тебя поваром?
	AI_Output(self,other,"DIA_STRF_1107_COOK_01_01");	//Командующий Гаронд. До того, как я стал заключенным, я был поваром в 'Яростном Кабане'.
	AI_Output(other,self,"DIA_STRF_1107_COOK_15_02");	//Почему ты стал заключенным?
	AI_Output(self,other,"DIA_STRF_1107_COOK_01_03");	//Ну, как-то раз между одним посетителем и мной произошло недоразумение...
};

var int ClifTeachCook;

instance DIA_STRF_1107_WHATCOOK(C_Info)
{
	npc = STRF_1107_Straefling;
	condition = DIA_STRF_1107_WHATCOOK_Condition;
	information = DIA_STRF_1107_WHATCOOK_Info;
	description = "А что ты сейчас готовишь?";
};

func int DIA_STRF_1107_WHATCOOK_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_1107_COOK) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_1107_WHATCOOK_Info()
{
	AI_Output(other,self,"DIA_STRF_1107_WHATCOOK_01_00");	//А что ты сейчас готовишь?
	AI_Output(self,other,"DIA_STRF_1107_WHATCOOK_01_01");	//Что принесут, то и готовлю. Выбирать не приходится.
	AI_Output(self,other,"DIA_STRF_1107_WHATCOOK_01_02");	//Но если на то пошло, то лучше всего у меня получаются компоты.
	AI_Output(self,other,"DIA_STRF_1107_WHATCOOK_01_03");	//(гордо) В них я почти бог, да простит меня Иннос.
	AI_Output(other,self,"DIA_STRF_1107_WHATCOOK_01_04");	//Может, тогда научишь меня их варить?
	AI_Output(self,other,"DIA_STRF_1107_WHATCOOK_01_05");	//Тебя? (сомнительно) А ты что, разбираешься в готовке?
	AI_Output(other,self,"DIA_STRF_1107_WHATCOOK_01_06");	//Ну, немного.
	AI_Output(self,other,"DIA_STRF_1107_WHATCOOK_01_07");	//Хотя ладно. Тут все равно почти нечем заняться.
	AI_Output(self,other,"DIA_STRF_1107_WHATCOOK_01_08");	//Так уж и быть, научу. Но только не думай, что даром.
	AI_Output(self,other,"DIA_STRF_1107_WHATCOOK_01_09");	//За каждый рецепт я возьму с тебя... не меньше пятидесяти кусков магической руды.
	AI_Output(self,other,"DIA_STRF_1107_WHATCOOK_01_10");	//Золото мне тут ни к чему, а вот руда - совсем другое дело. Здесь она товар ходовой!
	AI_Output(self,other,"DIA_STRF_1107_WHATCOOK_01_11");	//Если ты понимаешь, о чем я.
	ClifTeachCook = TRUE;
	Log_CreateTopic(TOPIC_COOK,LOG_NOTE);
	B_LogEntry(TOPIC_COOK,"Клифф может научить меня варить компоты. Но только за небольшой взнос в виде магической руды!");
};

instance DIA_STRF_1107_TeachCookDone(C_Info)
{
	npc = STRF_1107_Straefling;
	nr = 6;
	condition = DIA_STRF_1107_TeachCookDone_Condition;
	information = DIA_STRF_1107_TeachCookDone_Info;
	permanent = TRUE;
	description = "Научи меня варить компоты.";
};

func int DIA_STRF_1107_TeachCookDone_Condition()
{
	if((ClifTeachCook == TRUE) && ((Rezept_Compote_01 == FALSE) || (Rezept_Compote_02 == FALSE)))
	{
		return TRUE;
	};
};

func void DIA_STRF_1107_TeachCookDone_Info()
{
	AI_Output(other,self,"DIA_STRF_1107_TeachCookDone_01_00");	//Научи меня варить компоты.
	AI_Output(self,other,"DIA_STRF_1107_TeachCookDone_01_01");	//Хорошо! Какой именно?
	Info_ClearChoices(DIA_STRF_1107_TeachCookDone);
	Info_AddChoice(DIA_STRF_1107_TeachCookDone,Dialog_Back,DIA_STRF_1107_TeachCookDone_back);

	if(Rezept_Compote_01 == FALSE)
	{
		Info_AddChoice(DIA_STRF_1107_TeachCookDone,"Компот из диких ягод (Цена: 50 кусков руды)",DIA_STRF_1107_TeachCookDone_compote1);
	};
	if(Rezept_Compote_02 == FALSE)
	{
		Info_AddChoice(DIA_STRF_1107_TeachCookDone,"Компот из лесных ягод (Цена: 100 кусков руды)",DIA_STRF_1107_TeachCookDone_compote2);
	};
};

func void DIA_STRF_1107_TeachCookDone_back()
{
	Info_ClearChoices(DIA_STRF_1107_TeachCookDone);
};

func void DIA_STRF_1107_TeachCookDone_compote1()
{
	AI_Output(other,self,"DIA_Edda_TeachCookDone_compote1_01_00");	//Компот из диких ягод.

	if(Npc_HasItems(hero,ItMi_Nugget) >= 50)
	{
		Npc_RemoveInvItems(hero,ItMi_Nugget,50);
		AI_Output(self,other,"DIA_STRF_1107_TeachCookDone_compote1_01_01");	//Главное точно знать, сколько ягод нужно для одной порции.
		AI_Output(self,other,"DIA_STRF_1107_TeachCookDone_compote1_01_02");	//Без этого нормального компота не сваришь. Иначе он будет слишком жидким или вообще похож на джем.
		AI_Output(self,other,"DIA_STRF_1107_TeachCookDone_compote1_01_03");	//Возьми двадцать ягод и брось в котел. Равномерно их помешивай, а потом добавь целебную траву.
		AI_Output(self,other,"DIA_STRF_1107_TeachCookDone_compote1_01_04");	//А как только появится накипь - сливай. Вот и все.
		AI_Print("Изучен рецепт готовки еды - 'Компот из диких ягод'");
		B_LogEntry(TOPIC_COOK,"Теперь я умею готовить компот из диких ягод. Для этого мне нужно двадцать диких ягод и лечебная трава.");
		Snd_Play("LevelUP");
		Rezept_Compote_01 = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_STRF_1107_TeachCookDone_compote1_01_05");	//А где руда?
		Info_ClearChoices(DIA_STRF_1107_TeachCookDone);
	};
};

func void DIA_STRF_1107_TeachCookDone_compote2()
{
	AI_Output(other,self,"DIA_STRF_1107_TeachCookDone_compote2_01_00");	//Компот из лесных ягод.

	if(Npc_HasItems(hero,ItMi_Nugget) >= 100)
	{
		Npc_RemoveInvItems(hero,ItMi_Nugget,100);
		AI_Output(self,other,"DIA_STRF_1107_TeachCookDone_compote1_02_01");	//Это будет непросто. Весь секрет в том, чтобы не переварить ягоды.
		AI_Output(self,other,"DIA_STRF_1107_TeachCookDone_compote1_02_02");	//Иначе сваришь кислую бурду, а не вкусный компот.
		AI_Output(self,other,"DIA_STRF_1107_TeachCookDone_compote1_02_03");	//Возьми тридцать ягод и перетри их с лечебной травой. Потом засыпь это все в котел.
		AI_Output(self,other,"DIA_STRF_1107_TeachCookDone_compote1_02_04");	//Вари его только на определенной температуре. И как только компот закипит, снимай его с огня.
		AI_Output(self,other,"DIA_STRF_1107_TeachCookDone_compote1_02_05");	//Если все сделаешь правильно, получишь отменный напиток!
		AI_Print("Изучен рецепт готовки еды - 'Компот из лесных ягод'");
		B_LogEntry(TOPIC_COOK,"Теперь я умею готовить компот из лесных ягод. Для этого мне нужно тридцать лесных ягод и лечебное растение.");
		Snd_Play("LevelUP");
		Rezept_Compote_02 = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_STRF_1107_TeachCookDone_compote1_02_06");	//А где руда?
		Info_ClearChoices(DIA_STRF_1107_TeachCookDone);
	};
};

var int ClifCookMe;
var int FirstKliffCookOne;

instance DIA_STRF_1107_COOKME(C_Info)
{
	npc = STRF_1107_Straefling;
	condition = DIA_STRF_1107_COOKME_Condition;
	information = DIA_STRF_1107_COOKME_Info;
	permanent = FALSE;
	description = "А ты сам можешь приготовить мне эти компоты?";
};

func int DIA_STRF_1107_COOKME_Condition()
{
	if(ClifTeachCook == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_1107_COOKME_Info()
{
	AI_Output(other,self,"DIA_STRF_1107_COOKME_01_01");	//А ты сам можешь приготовить мне эти компоты?
	AI_Output(self,other,"DIA_STRF_1107_COOKME_01_02");	//Конечно. Если принесешь все необходимые для этого ингредиенты.
	AI_Output(self,other,"DIA_STRF_1107_COOKME_01_03");	//Но тебе все равно придется заплатить за это магической рудой.
	AI_Output(self,other,"DIA_STRF_1107_COOKME_01_04");	//Просто так тратить на это свое время я не стану.
	ClifCookMe = TRUE;
	Log_CreateTopic(TOPIC_COOK,LOG_NOTE);
	B_LogEntry(TOPIC_COOK,"Клифф может cварить мне компоты, если я принесу ему нужные ингредиенты. За каждую порцию компота он берет по 5 кусков магической руды.");
};

instance DIA_STRF_1107_COOKMEDONE(C_Info)
{
	npc = STRF_1107_Straefling;
	condition = DIA_STRF_1107_COOKMEDONE_Condition;
	information = DIA_STRF_1107_COOKMEDONE_Info;
	permanent = TRUE;
	description = "Приготовь мне компот.";
};

func int DIA_STRF_1107_COOKMEDONE_Condition()
{
	if((ClifCookMe == TRUE) && (DayCliffCookFor == FALSE) && (DayCliffCookPortionFor == FALSE) && (DayCliffCook == FALSE) && (DayCliffCookPortion == FALSE))
	{
		return TRUE;
	};
};

func void DIA_STRF_1107_COOKMEDONE_Info()
{
	AI_Output(other,self,"DIA_STRF_1107_COOKMEDONE_01_01");	//Приготовь мне компот.
	AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_01_02");	//Какой именно?
	Info_ClearChoices(DIA_STRF_1107_COOKMEDONE);
	Info_AddChoice(DIA_STRF_1107_COOKMEDONE,Dialog_Back,DIA_STRF_1107_COOKMEDONE_back);
	Info_AddChoice(DIA_STRF_1107_COOKMEDONE,"Компот из диких ягод",DIA_STRF_1107_COOKMEDONE_Planeberry);
	Info_AddChoice(DIA_STRF_1107_COOKMEDONE,"Компот из лесных ягод (30 лесных ягод, лечебное растение)",DIA_STRF_1107_COOKMEDONE_Forestberry);
};

func void DIA_STRF_1107_COOKMEDONE_back()
{
	Info_ClearChoices(DIA_STRF_1107_COOKMEDONE);
};

func void DIA_STRF_1107_COOKMEDONE_Planeberry()
{
	AI_Output(other,self,"DIA_STRF_1107_COOKMEDONE_Planeberry_01_01");	//Компот из диких ягод.

	if((Npc_HasItems(hero,ItPl_Planeberry) >= 20) && (Npc_HasItems(hero,ItPl_Health_Herb_03) >= 1))
	{
		AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_01_02");	//Хорошо. Давай посмотрим, есть ли у тебя все необходимые ингредиенты.
		AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_01_03");	//Так...(оценивающе) Да, вроде кое-что у тебя имеется.
		AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_01_04");	//Ну и сколько порций тебе сварить?
		Info_ClearChoices(DIA_STRF_1107_COOKMEDONE);
		Info_AddChoice(DIA_STRF_1107_COOKMEDONE,Dialog_Back,DIA_STRF_1107_COOKMEDONE_back);

		if((Npc_HasItems(hero,ItPl_Planeberry) >= 20) && (Npc_HasItems(hero,ItPl_Health_Herb_03) >= 1) && (Npc_HasItems(hero,ItMi_Nugget) >= 5))
		{
			Info_AddChoice(DIA_STRF_1107_COOKMEDONE,"1 порцию (20 диких ягод, лечебный корень, 5 кусков руды)",DIA_STRF_1107_COOKMEDONE_Planeberry_V1);
		};
		if((Npc_HasItems(hero,ItPl_Planeberry) >= 100) && (Npc_HasItems(hero,ItPl_Health_Herb_03) >= 5) && (Npc_HasItems(hero,ItMi_Nugget) >= 25))
		{
			Info_AddChoice(DIA_STRF_1107_COOKMEDONE,"5 порций (100 диких ягод, 5 лечебных корней, 25 кусков руды)",DIA_STRF_1107_COOKMEDONE_Planeberry_V5);
		};
		if((Npc_HasItems(hero,ItPl_Planeberry) >= 200) && (Npc_HasItems(hero,ItPl_Health_Herb_03) >= 10) && (Npc_HasItems(hero,ItMi_Nugget) >= 50))
		{
			Info_AddChoice(DIA_STRF_1107_COOKMEDONE,"10 порций (200 диких ягод, 10 лечебных корней, 50 кусков руды)",DIA_STRF_1107_COOKMEDONE_Planeberry_V10);
		};
		if((Npc_HasItems(hero,ItPl_Planeberry) >= 400) && (Npc_HasItems(hero,ItPl_Health_Herb_03) >= 20) && (Npc_HasItems(hero,ItMi_Nugget) >= 100))
		{
			Info_AddChoice(DIA_STRF_1107_COOKMEDONE,"20 порций (400 диких ягод, 20 лечебных корней, 100 кусков руды)",DIA_STRF_1107_COOKMEDONE_Planeberry_V20);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_01_05");	//Но у тебя же не хватает для этого ингредиентов!
		AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_01_06");	//Сперва собери все необходимое, а потом уже приходи.
		AI_StopProcessInfos(self);
	};
};

func void DIA_STRF_1107_COOKMEDONE_Planeberry_V1()
{
	AI_Output(other,self,"DIA_STRF_1107_COOKMEDONE_Planeberry_V1_01_01");	//Свари мне одну порцию.

	if((Npc_HasItems(hero,ItPl_Planeberry) >= 20) && (Npc_HasItems(hero,ItPl_Health_Herb_03) >= 1) && (Npc_HasItems(hero,ItMi_Nugget) >= 5))
	{
		AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_V1_01_02");	//Хорошо. Давай все сюда.
		B_GiveInvItemsManyThings(other,self);
		Npc_RemoveInvItems(hero,ItPl_Planeberry,20);
		Npc_RemoveInvItems(hero,ItPl_Health_Herb_03,1);
		Npc_RemoveInvItems(hero,ItMi_Nugget,5);
		DayCliffCook = Wld_GetDay();
		DayCliffCookPortion = 1;
		AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_V1_01_03");	//К завтрашнему дню твой компот будет готов.

		if(FirstKliffCookOne == FALSE)
		{
			AI_Output(other,self,"DIA_STRF_1107_COOKMEDONE_Planeberry_V1_01_04");	//Только завтра?! Я думал, что ты сваришь его прямо сейчас.
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_V1_01_05");	//Ну да...(посмеиваясь) Сейчас брошу все свои дела и займусь твоим компотом!
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_V1_01_06");	//Вообще-то у меня тут и другая работенка имеется.
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_V1_01_07");	//Так что перестань действовать мне на нервы, и просто приходи завтра.
			FirstKliffCookOne = TRUE;
		};

		AI_StopProcessInfos(self);
	}
	else
	{
		if(Npc_HasItems(hero,ItMi_Nugget) < 5)
		{
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_01_08");	//А где руда? Нет, так не пойдет, приятель.
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_01_09");	//Сначала найди для меня руду, а потом приходи.
		}
		else
		{
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_01_05");	//Но у тебя же не хватает для этого ингредиентов!
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_01_06");	//Сперва собери все необходимое, а потом уже приходи.
		};

		AI_StopProcessInfos(self);
	};
};

func void DIA_STRF_1107_COOKMEDONE_Planeberry_V5()
{
	AI_Output(other,self,"DIA_STRF_1107_COOKMEDONE_Planeberry_V5_01_01");	//Свари мне пять порций.

	if((Npc_HasItems(hero,ItPl_Planeberry) >= 100) && (Npc_HasItems(hero,ItPl_Health_Herb_03) >= 5) && (Npc_HasItems(hero,ItMi_Nugget) >= 25))
	{
		AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_V5_01_02");	//Хорошо. Давай все сюда.
		B_GiveInvItemsManyThings(other,self);
		Npc_RemoveInvItems(hero,ItPl_Planeberry,100);
		Npc_RemoveInvItems(hero,ItPl_Health_Herb_03,5);
		Npc_RemoveInvItems(hero,ItMi_Nugget,25);
		DayCliffCook = Wld_GetDay();
		DayCliffCookPortion = 5;
		AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_V5_01_03");	//К завтрашнему дню твой компот будет готов.

		if(FirstKliffCookOne == FALSE)
		{
			AI_Output(other,self,"DIA_STRF_1107_COOKMEDONE_Planeberry_V5_01_04");	//Только завтра?! Я думал, что сваришь его прямо сейчас.
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_V5_01_05");	//Ну да...(посмеиваясь) Сейчас брошу все свои дела и займусь твоим компотом!
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_V5_01_06");	//Вообще-то у меня тут и другая работенка имеется.
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_V5_01_07");	//Так что перестань действовать мне на нервы, и просто приходи завтра.
			FirstKliffCookOne = TRUE;
		};

		AI_StopProcessInfos(self);
	}
	else
	{
		if(Npc_HasItems(hero,ItMi_Nugget) < 25)
		{
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_01_08");	//А где руда? Нет, так не пойдет, приятель.
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_01_09");	//Сначала найди для меня руду, а потом приходи.
		}
		else
		{
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_01_05");	//Но у тебя же не хватает для этого ингредиентов!
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_01_06");	//Сперва собери все необходимое, а потом уже приходи.
		};

		AI_StopProcessInfos(self);
	};
};

func void DIA_STRF_1107_COOKMEDONE_Planeberry_V10()
{
	AI_Output(other,self,"DIA_STRF_1107_COOKMEDONE_Planeberry_V10_01_01");	//Свари мне десять порций.

	if((Npc_HasItems(hero,ItPl_Planeberry) >= 200) && (Npc_HasItems(hero,ItPl_Health_Herb_03) >= 10) && (Npc_HasItems(hero,ItMi_Nugget) >= 50))
	{
		AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_V10_01_02");	//Хорошо. Давай все сюда.
		B_GiveInvItemsManyThings(other,self);
		Npc_RemoveInvItems(hero,ItPl_Planeberry,200);
		Npc_RemoveInvItems(hero,ItPl_Health_Herb_03,10);
		Npc_RemoveInvItems(hero,ItMi_Nugget,50);
		DayCliffCook = Wld_GetDay();
		DayCliffCookPortion = 10;
		AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_V10_01_03");	//К завтрашнему дню твой компот будет готов.

		if(FirstKliffCookOne == FALSE)
		{
			AI_Output(other,self,"DIA_STRF_1107_COOKMEDONE_Planeberry_V10_01_04");	//Только завтра?! Я думал, что сваришь его прямо сейчас.
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_V10_01_05");	//Ну да...(посмеиваясь) Сейчас брошу все свои дела и займусь твоим компотом!
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_V10_01_06");	//Да и на то, чтобы сварить десять порций, мне понадобится больше времени.
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_V10_01_07");	//Так что перестань действовать мне на нервы, и просто приходи завтра.
			FirstKliffCookOne = TRUE;
		};

		AI_StopProcessInfos(self);
	}
	else
	{
		if(Npc_HasItems(hero,ItMi_Nugget) < 50)
		{
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_01_08");	//А где руда? Нет, так не пойдет, приятель.
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_01_09");	//Сначала найди для меня руду, а потом приходи.
		}
		else
		{
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_01_05");	//Но у тебя же не хватает для этого ингредиентов!
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_01_06");	//Сперва собери все необходимое, а потом уже приходи.
		};

		AI_StopProcessInfos(self);
	};
};

func void DIA_STRF_1107_COOKMEDONE_Planeberry_V20()
{
	AI_Output(other,self,"DIA_STRF_1107_COOKMEDONE_Planeberry_V20_01_01");	//Свари мне двадцать порций.

	if((Npc_HasItems(hero,ItPl_Planeberry) >= 400) && (Npc_HasItems(hero,ItPl_Health_Herb_03) >= 20) && (Npc_HasItems(hero,ItMi_Nugget) >= 100))
	{
		AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_V20_01_02");	//(удивленно) Сколько? Ох, ладно. Давай все сюда.
		B_GiveInvItemsManyThings(other,self);
		Npc_RemoveInvItems(hero,ItPl_Planeberry,400);
		Npc_RemoveInvItems(hero,ItPl_Health_Herb_03,20);
		Npc_RemoveInvItems(hero,ItMi_Nugget,100);
		DayCliffCook = Wld_GetDay();
		DayCliffCookPortion = 20;
		AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_V20_01_03");	//Постараюсь управиться к завтрашнему дню.

		if(FirstKliffCookOne == FALSE)
		{
			AI_Output(other,self,"DIA_STRF_1107_COOKMEDONE_Planeberry_V20_01_04");	//Уж постарайся, приятель.
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_V20_01_05");	//Ну да...(посмеиваясь) Сейчас брошу все свои дела и займусь твоим компотом!
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_V20_01_06");	//(смеется) И пусть Гаронд жрет недоваренную похлебку!
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_V20_01_07");	//Парень, не действуй мне на нервы, и просто потерпи до завтра.
			FirstKliffCookOne = TRUE;
		};

		AI_StopProcessInfos(self);
	}
	else
	{
		if(Npc_HasItems(hero,ItMi_Nugget) < 100)
		{
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_01_08");	//А где руда? Нет, так не пойдет, приятель.
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_01_09");	//Сначала найди для меня руду, а потом приходи.
		}
		else
		{
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_01_05");	//Но у тебя же не хватает для этого ингредиентов!
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_01_06");	//Сперва собери все необходимое, а потом уже приходи.
		};

		AI_StopProcessInfos(self);
	};
};

instance DIA_STRF_1107_COOKMETAKE_Planeberry(C_Info)
{
	npc = STRF_1107_Straefling;
	condition = DIA_STRF_1107_COOKMETAKE_Planeberry_Condition;
	information = DIA_STRF_1107_COOKMETAKE_Planeberry_Info;
	permanent = TRUE;
	description = "Как поживает мой компот?";
};

func int DIA_STRF_1107_COOKMETAKE_Planeberry_Condition()
{
	var int daynow;

	daynow = Wld_GetDay();

	if((ClifCookMe == TRUE) && (DayCliffCook < daynow) && (DayCliffCookPortion >= 1))
	{
		return TRUE;
	};
};

func void DIA_STRF_1107_COOKMETAKE_Planeberry_Info()
{
	AI_Output(other,self,"DIA_STRF_1107_COOKMETAKE_Planeberry_01_01");	//Как поживает мой компот?
	AI_Output(self,other,"DIA_STRF_1107_COOKMETAKE_Planeberry_01_02");	//Он готов. Вот, держи.
	B_GiveInvItems(self,other,itfo_compote_01,DayCliffCookPortion);
	AI_Output(self,other,"DIA_STRF_1107_COOKMETAKE_Planeberry_01_03");	//Спасибо.
	DayCliffCookPortion = FALSE;
	DayCliffCook = FALSE;
};

func void DIA_STRF_1107_COOKMEDONE_Forestberry()
{
	AI_Output(other,self,"DIA_STRF_1107_COOKMEDONE_Forestberry_01_01");	//Компот из лесных ягод.

	if((Npc_HasItems(hero,ItPl_Forestberry) >= 30) && (Npc_HasItems(hero,ItPl_Health_Herb_02) >= 1))
	{
		AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Forestberry_01_02");	//Хорошо. Давай посмотрим, есть ли у тебя все необходимые ингредиенты.	
		AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Forestberry_01_03");	//Так...(оценивающе) Да, вроде кое-что у тебя имеется.
		AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Forestberry_01_04");	//Ну и сколько порций тебе сварить?
		Info_ClearChoices(DIA_STRF_1107_COOKMEDONE);
		Info_AddChoice(DIA_STRF_1107_COOKMEDONE,Dialog_Back,DIA_STRF_1107_COOKMEDONE_back);

		if((Npc_HasItems(hero,ItPl_Forestberry) >= 30) && (Npc_HasItems(hero,ItPl_Health_Herb_02) >= 1) && (Npc_HasItems(hero,ItMi_Nugget) >= 5))
		{
			Info_AddChoice(DIA_STRF_1107_COOKMEDONE,"1 порцию (20 лесных ягод, лечебное растение, 5 кусков руды)",DIA_STRF_1107_COOKMEDONE_Forestberry_V1);
		};
		if((Npc_HasItems(hero,ItPl_Forestberry) >= 150) && (Npc_HasItems(hero,ItPl_Health_Herb_02) >= 5) && (Npc_HasItems(hero,ItMi_Nugget) >= 25))
		{
			Info_AddChoice(DIA_STRF_1107_COOKMEDONE,"5 порций (100 лесных ягод, 5 лечебных растений, 25 кусков руды)",DIA_STRF_1107_COOKMEDONE_Forestberry_V5);
		};
		if((Npc_HasItems(hero,ItPl_Forestberry) >= 300) && (Npc_HasItems(hero,ItPl_Health_Herb_02) >= 10) && (Npc_HasItems(hero,ItMi_Nugget) >= 50))
		{
			Info_AddChoice(DIA_STRF_1107_COOKMEDONE,"10 порций (200 лесных ягод, 10 лечебных растений, 50 кусков руды)",DIA_STRF_1107_COOKMEDONE_Forestberry_V10);
		};
		if((Npc_HasItems(hero,ItPl_Forestberry) >= 600) && (Npc_HasItems(hero,ItPl_Health_Herb_02) >= 20) && (Npc_HasItems(hero,ItMi_Nugget) >= 100))
		{
			Info_AddChoice(DIA_STRF_1107_COOKMEDONE,"20 порций (400 лесных ягод, 20 лечебных растений, 100 кусков руды)",DIA_STRF_1107_COOKMEDONE_Forestberry_V20);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_01_05");	//Но у тебя же не хватает для этого ингредиентов!
		AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Planeberry_01_06");	//Сперва собери все необходимое, а потом уже приходи.
		AI_StopProcessInfos(self);
	};
};

func void DIA_STRF_1107_COOKMEDONE_Forestberry_V1()
{
	AI_Output(other,self,"DIA_STRF_1107_COOKMEDONE_Forestberry_V1_01_01");	//Свари мне одну порцию.

	if((Npc_HasItems(hero,ItPl_Forestberry) >= 30) && (Npc_HasItems(hero,ItPl_Health_Herb_02) >= 1) && (Npc_HasItems(hero,ItMi_Nugget) >= 5))
	{
		AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Forestberry_V1_01_02");	//Хорошо. Давай все сюда.
		B_GiveInvItemsManyThings(other,self);
		Npc_RemoveInvItems(hero,ItPl_Forestberry,30);
		Npc_RemoveInvItems(hero,ItPl_Health_Herb_02,1);
		Npc_RemoveInvItems(hero,ItMi_Nugget,5);
		DayCliffCookFor = Wld_GetDay();
		DayCliffCookPortionFor = 1;
		AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Forestberry_V1_01_03");	//К завтрашнему дню твой компот будет готов.

		if(FirstKliffCookOne == FALSE)
		{
			AI_Output(other,self,"DIA_STRF_1107_COOKMEDONE_Forestberry_V1_01_04");	//Только завтра?! Я думал, что сваришь его прямо сейчас.
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Forestberry_V1_01_05");	//Ну да...(посмеиваясь) Сейчас брошу все свои дела и займусь твоим компотом!
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Forestberry_V1_01_06");	//Вообще-то у меня тут и другая работенка имеется.
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Forestberry_V1_01_07");	//Так что перестань действовать мне на нервы, и просто приходи завтра.
			FirstKliffCookOne = TRUE;
		};

		AI_StopProcessInfos(self);
	}
	else
	{
		if(Npc_HasItems(hero,ItMi_Nugget) < 5)
		{
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Forestberry_01_08");	//А где руда? Нет, так не пойдет, приятель.
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Forestberry_01_09");	//Сначала найди для меня руду, а потом приходи.
		}
		else
		{
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Forestberry_01_05");	//Но у тебя же не хватает для этого ингредиентов!
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Forestberry_01_06");	//Сперва собери все необходимое, а потом уже приходи.
		};

		AI_StopProcessInfos(self);
	};
};

func void DIA_STRF_1107_COOKMEDONE_Forestberry_V5()
{
	AI_Output(other,self,"DIA_STRF_1107_COOKMEDONE_Forestberry_V5_01_01");	//Свари мне пять порций.

	if((Npc_HasItems(hero,ItPl_Forestberry) >= 150) && (Npc_HasItems(hero,ItPl_Health_Herb_02) >= 5) && (Npc_HasItems(hero,ItMi_Nugget) >= 25))
	{
		AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Forestberry_V5_01_02");	//Хорошо. Давай все сюда.
		B_GiveInvItemsManyThings(other,self);
		Npc_RemoveInvItems(hero,ItPl_Forestberry,150);
		Npc_RemoveInvItems(hero,ItPl_Health_Herb_02,5);
		Npc_RemoveInvItems(hero,ItMi_Nugget,25);
		DayCliffCookFor = Wld_GetDay();
		DayCliffCookPortionFor = 5;
		AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Forestberry_V5_01_03");	//К завтрашнему дню твой компот будет готов.

		if(FirstKliffCookOne == FALSE)
		{
			AI_Output(other,self,"DIA_STRF_1107_COOKMEDONE_Forestberry_V5_01_04");	//Только завтра?! Я думал, что сваришь его прямо сейчас.
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Forestberry_V5_01_05");	//Ну да...(посмеиваясь) Сейчас брошу все свои дела и займусь твоим компотом!
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Forestberry_V5_01_06");	//Вообще-то у меня тут и другая работенка имеется.
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Forestberry_V5_01_07");	//Так что перестань действовать мне на нервы, и просто приходи завтра.
			FirstKliffCookOne = TRUE;
		};

		AI_StopProcessInfos(self);
	}
	else
	{
		if(Npc_HasItems(hero,ItMi_Nugget) < 25)
		{
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Forestberry_01_08");	//А где руда? Нет, так не пойдет, приятель.
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Forestberry_01_09");	//Сначала найди для меня руду, а потом приходи.
		}
		else
		{
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Forestberry_01_05");	//Но у тебя же не хватает для этого ингредиентов!
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Forestberry_01_06");	//Сперва собери все необходимое, а потом уже приходи.
		};

		AI_StopProcessInfos(self);
	};
};

func void DIA_STRF_1107_COOKMEDONE_Forestberry_V10()
{
	AI_Output(other,self,"DIA_STRF_1107_COOKMEDONE_Forestberry_V10_01_01");	//Свари мне десять порций.

	if((Npc_HasItems(hero,ItPl_Forestberry) >= 300) && (Npc_HasItems(hero,ItPl_Health_Herb_02) >= 10) && (Npc_HasItems(hero,ItMi_Nugget) >= 50))
	{
		AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Forestberry_V10_01_02");	//Хорошо. Давай все сюда.
		B_GiveInvItemsManyThings(other,self);
		Npc_RemoveInvItems(hero,ItPl_Forestberry,300);
		Npc_RemoveInvItems(hero,ItPl_Health_Herb_02,10);
		Npc_RemoveInvItems(hero,ItMi_Nugget,50);
		DayCliffCookFor = Wld_GetDay();
		DayCliffCookPortionFor = 10;
		AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Forestberry_V10_01_03");	//К завтрашнему дню твой компот будет готов.

		if(FirstKliffCookOne == FALSE)
		{
			AI_Output(other,self,"DIA_STRF_1107_COOKMEDONE_Forestberry_V10_01_04");	//Только завтра?! Я думал, что сваришь его прямо сейчас.
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Forestberry_V10_01_05");	//Ну да...(посмеиваясь) Сейчас брошу все свои дела и займусь твоим компотом!
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Forestberry_V10_01_06");	//Да и на то, чтобы сварить десять порций, мне понадобится больше времени.
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Forestberry_V10_01_07");	//Так что перестань действовать мне на нервы, и просто приходи завтра.
			FirstKliffCookOne = TRUE;
		};

		AI_StopProcessInfos(self);
	}
	else
	{
		if(Npc_HasItems(hero,ItMi_Nugget) < 50)
		{
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Forestberry_01_08");	//А где руда? Нет, так не пойдет, приятель.
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Forestberry_01_09");	//Сначала найди для меня руду, а потом приходи.
		}
		else
		{
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Forestberry_01_05");	//Но у тебя же не хватает для этого ингредиентов!
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Forestberry_01_06");	//Сперва собери все необходимое, а потом уже приходи.
		};

		AI_StopProcessInfos(self);
	};
};

func void DIA_STRF_1107_COOKMEDONE_Forestberry_V20()
{
	AI_Output(other,self,"DIA_STRF_1107_COOKMEDONE_Forestberry_V20_01_01");	//Свари мне двадцать порций.

	if((Npc_HasItems(hero,ItPl_Forestberry) >= 600) && (Npc_HasItems(hero,ItPl_Health_Herb_02) >= 20) && (Npc_HasItems(hero,ItMi_Nugget) >= 100))
	{
		AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Forestberry_V20_01_02");	//(удивленно) Сколько? Ох, ладно. Давай все сюда.
		B_GiveInvItemsManyThings(other,self);
		Npc_RemoveInvItems(hero,ItPl_Forestberry,600);
		Npc_RemoveInvItems(hero,ItPl_Health_Herb_02,20);
		Npc_RemoveInvItems(hero,ItMi_Nugget,100);
		DayCliffCookFor = Wld_GetDay();
		DayCliffCookPortionFor = 20;
		AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Forestberry_V20_01_03");	//Постараюсь управиться к завтрашнему дню.

		if(FirstKliffCookOne == FALSE)
		{
			AI_Output(other,self,"DIA_STRF_1107_COOKMEDONE_Forestberry_V20_01_04");	//Уж постарайся, приятель.
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Forestberry_V20_01_05");	//Ну да...(посмеиваясь) Прям сейчас брошу все свои дела и займусь твоим компотом!
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Forestberry_V20_01_06");	//(смеется)...И пусть Гаронд жрет недоваренную похлебку.
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Forestberry_V20_01_07");	//Парень, не действуй мне на нервы, и просто потерпи до завтра.
			FirstKliffCookOne = TRUE;
		};

		AI_StopProcessInfos(self);
	}
	else
	{
		if(Npc_HasItems(hero,ItMi_Nugget) < 100)
		{
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Forestberry_01_08");	//А где руда? Нет, так не пойдет, приятель.
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Forestberry_01_09");	//Сначала найди для меня руду, а потом приходи.
		}
		else
		{
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Forestberry_01_05");	//Но у тебя же не хватает для этого ингредиентов!
			AI_Output(self,other,"DIA_STRF_1107_COOKMEDONE_Forestberry_01_06");	//Сперва собери все необходимое, а потом уже приходи.
		};

		AI_StopProcessInfos(self);
	};
};

instance DIA_STRF_1107_COOKMETAKE_Forestberry(C_Info)
{
	npc = STRF_1107_Straefling;
	condition = DIA_STRF_1107_COOKMETAKE_Forestberry_Condition;
	information = DIA_STRF_1107_COOKMETAKE_Forestberry_Info;
	permanent = TRUE;
	description = "Как поживает мой компот?";
};

func int DIA_STRF_1107_COOKMETAKE_Forestberry_Condition()
{
	var int daynow;

	daynow = Wld_GetDay();

	if((ClifCookMe == TRUE) && (DayCliffCookFor < daynow) && (DayCliffCookPortionFor >= 1))
	{
		return TRUE;
	};
};

func void DIA_STRF_1107_COOKMETAKE_Forestberry_Info()
{
	AI_Output(other,self,"DIA_STRF_1107_COOKMETAKE_Forestberry_01_01");	//Как поживает мой компот?
	AI_Output(self,other,"DIA_STRF_1107_COOKMETAKE_Forestberry_01_02");	//Он готов. Вот, держи.
	B_GiveInvItems(self,other,itfo_compote_00,DayCliffCookPortionFor);
	AI_Output(self,other,"DIA_STRF_1107_COOKMETAKE_Forestberry_01_03");	//Спасибо.
	DayCliffCookPortionFor = FALSE;
	DayCliffCookFor = FALSE;
};

instance DIA_STRF_1107_PERM(C_Info)
{
	npc = STRF_1107_Straefling;
	nr = 900;
	condition = DIA_STRF_1107_PERM_Condition;
	information = DIA_STRF_1107_PERM_Info;
	permanent = TRUE;
	description = "Есть что-нибудь новенькое?";
};

func int DIA_STRF_1107_PERM_Condition()
{
	if(Npc_KnowsInfo(hero,dia_strf_1107_finger))
	{
		return TRUE;
	};
};

func void DIA_STRF_1107_PERM_Info()
{
	var int daynow;
	AI_Output(other,self,"DIA_STRF_1107_PERM_15_00");	//Есть что-нибудь новенькое?
	if(MIS_OCCOOKFLEE == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_STRF_1107_PERM_01_21");	//Спроси у ребят. Я тут просто отдыхаю. Сплю и ем.
		AI_Output(self,other,"DIA_STRF_1107_PERM_01_22");	//Ну, иногда хожу на охоту.
		AI_StopProcessInfos(self);
	}
	else if(COOK1107_GOBASE == TRUE)
	{
		AI_Output(self,other,"DIA_STRF_1107_PERM_01_25");	//Новости будут, когда мы дойдем до места. Не отвлекайся.
		AI_StopProcessInfos(self);
	}
	else if(COOK1107_DAY <= 0)
	{
		AI_Output(self,other,"DIA_STRF_1107_PERM_01_01");	//Спроси у паладинов. Я просто повар-пленник.
		if(COOK1107_DAY == 0)
		{
			AI_Output(other,self,"DIA_STRF_1107_PERM_15_01");	//Не смотри на меня волком, я этот замок знаю получше тебя. Догадываешься, почему?
			AI_Output(self,other,"DIA_STRF_1107_PERM_01_02");	//Брось, ты не похож на бывшего заключенного.
			AI_Output(other,self,"DIA_STRF_1107_PERM_15_02");	//Как знаешь. Но если нужна будет помощь, обращайся.
			COOK1107_DAY = Wld_GetDay() + 7;
		};
	}
	else
	{
		daynow = Wld_GetDay();
		if(COOK1107_DAY == (daynow + 1))
		{
			AI_Output(self,other,"DIA_STRF_1107_PERM_01_04");	//Похлебка. Она у нас каждый день новая.
			AI_Output(self,other,"DIA_STRF_1107_PERM_01_26");	//Приходи завтра - будут тебе новости.
			AI_StopProcessInfos(self);
		}
		else if(((COOK1107_DAY - 3) <= daynow) && (COOK1107_DAY > daynow))
		{
			AI_Output(self,other,"DIA_STRF_1107_PERM_01_23");	//Какой ты нетерпеливый. Еще и недели не прошло.
			AI_StopProcessInfos(self);
		}
		else if(COOK1107_DAY > daynow)
		{
			AI_Output(self,other,"DIA_STRF_1107_PERM_01_05");	//Пока нет.
		}
		else if(COOK1107_DAY == (daynow + 7))
		{
			AI_Output(self,other,"DIA_STRF_1107_PERM_01_27");	//У нас новости ходят медленно. Приходи через неделю.
		}
		else
		{
			AI_Output(self,other,"DIA_STRF_1107_PERM_01_07");	//Парни говорят, что тебе можно доверять...
			AI_Output(self,other,"DIA_STRF_1107_PERM_01_08");	//Слушай, мне надо отсюда удрать!
			AI_Output(self,other,"DIA_STRF_1107_PERM_01_09");	//В Хоринис я не собираюсь, мне нужно какое-то тихое место, чтобы пересидеть все эти бури.
			AI_Output(self,other,"DIA_STRF_1107_PERM_01_10");	//В накладе не останешься. Может, ты уже видел сундук на верхней площадке высокой башни?
			AI_Output(self,other,"DIA_STRF_1107_PERM_01_11");	//Замок там хороший - без ключа не открыть. В нем пять или шесть кусков руды.
			AI_Output(self,other,"DIA_STRF_1107_PERM_01_12");	//Если поможешь - я скажу тебе место, где спрятан ключ.
			AI_Output(self,other,"DIA_STRF_1107_PERM_01_14");	//Ну что, ты в деле?
			COOK1107_DAY = -1;
			Info_ClearChoices(dia_strf_1107_perm);
			Info_AddChoice(dia_strf_1107_perm,"И как это сделать?",dia_strf_1107_perm_ok);
			Info_AddChoice(dia_strf_1107_perm,"Да ты в своем уме? Ищи другого самоубийцу.",dia_strf_1107_perm_no);
		};
	};
};

func void dia_strf_1107_perm_no()
{
	AI_Output(other,self,"DIA_STRF_1107_PERM_15_05");	//Да ты в своем уме?
	AI_Output(other,self,"DIA_STRF_1107_PERM_15_06");	//Ты хочешь, чтобы я провел тебя через замок, набитый паладинами?
	AI_Output(other,self,"DIA_STRF_1107_PERM_15_07");	//А потом через орды орков?
	AI_Output(self,other,"DIA_STRF_1107_PERM_01_15");	//Я ошибся в тебе...
	Info_ClearChoices(dia_strf_1107_perm);
	AI_StopProcessInfos(self);
};

func void dia_strf_1107_perm_ok()
{
	AI_Output(other,self,"DIA_STRF_1107_PERM_15_08");	//Ты хочешь, чтобы я провел тебя через замок, набитый паладинами?
	AI_Output(other,self,"DIA_STRF_1107_PERM_15_09");	//А потом через орды орков?
	AI_Output(other,self,"DIA_STRF_1107_PERM_15_10");	//А другого ненормального ты не мог найти? Тебе нужен был именно я?
	MIS_OCCOOKFLEE = LOG_Running;
	Log_CreateTopic(TOPIC_OCCOOKFLEE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OCCOOKFLEE,LOG_Running);
	B_LogEntry(TOPIC_OCCOOKFLEE,"Повар Клифф в замке рудниковой долины хочет оттуда удрать.");
	B_LogEntry(TOPIC_OCCOOKFLEE,"Он обещает сказать мне, где находится ключ от сундука с несколькими кусками руды. ");
	AI_Output(self,other,"DIA_STRF_1107_PERM_01_16");	//Ты сам вызвался.
	AI_Output(self,other,"DIA_STRF_1107_PERM_01_17");	//Теперь послушай. Мне нужна одежда, которая не вызовет подозрений у паладинов в замке.
	AI_Output(self,other,"DIA_STRF_1107_PERM_01_18");	//И какое-нибудь оружие.
	B_LogEntry(TOPIC_OCCOOKFLEE,"Клифф говорит, что ему нужна одежда, не выделяющаяся в замке, и какое-нибудь оружие.");
	AI_Output(self,other,"DIA_STRF_1107_PERM_01_20");	//И самое главное - нет ли у тебя на примете спокойного места тут, в Долине Рудников?
	B_LogEntry(TOPIC_OCCOOKFLEE,"Но сначала мне надо найти спокойное место в Долине Рудников.");
	Info_ClearChoices(dia_strf_1107_perm);
};


instance DIA_STRF_1107_FLEEINFO(C_Info)
{
	npc = STRF_1107_Straefling;
	nr = 2;
	condition = dia_strf_1107_fleeinfo_condition;
	information = dia_strf_1107_fleeinfo_info;
	permanent = FALSE;
	description = "Кажется, я нашел спокойное место для тебя.";
};

func int dia_strf_1107_fleeinfo_condition()
{
	if((MIS_OCCOOKFLEE == LOG_Running) && (HEROKNOWFORESTBASE == TRUE))
	{
		return TRUE;
	};
};

func void dia_strf_1107_fleeinfo_info()
{
	AI_Output(other,self,"DIA_STRF_1107_FleeInfo_15_00");	//Кажется, я нашел спокойное место для тебя.
	AI_Output(self,other,"DIA_STRF_1107_FleeInfo_01_01");	//И где оно?
	AI_Output(other,self,"DIA_STRF_1107_FleeInfo_15_01");	//За забором орков сейчас вырос большой лес.
	AI_Output(other,self,"DIA_STRF_1107_FleeInfo_15_02");	//Этому способствовала магия какого-то бога, с которым общается один парень из бывшего Болотного лагеря.
	AI_Output(other,self,"DIA_STRF_1107_FleeInfo_15_03");	//В этом лесу лагерь, в котором достаточно спокойно.
	AI_Output(other,self,"DIA_STRF_1107_FleeInfo_15_04");	//Ни один орк теперь не рискует зайти туда.
	AI_Output(self,other,"DIA_STRF_1107_FleeInfo_01_02");	//Предлагаешь мне жить вместе с этими психами?
	AI_Output(self,other,"DIA_STRF_1107_FleeInfo_15_05");	//У них там с головой не в порядке.
	AI_Output(other,self,"DIA_STRF_1107_FleeInfo_15_07");	//Не нравится - ищи сам.
	AI_Output(self,other,"DIA_STRF_1107_FleeInfo_01_03");	//Ну ладно, ладно - пойдет на первое время.
	AI_Output(self,other,"DIA_STRF_1107_FleeInfo_01_04");	//Теперь мне надо одежду и меч - но это прямо перед побегом.
	AI_Output(self,other,"DIA_STRF_1107_FleeInfo_01_05");	//Сейчас мне их негде прятать.
	B_LogEntry(TOPIC_OCCOOKFLEE,"Клифф согласился отправиться в Лесной лагерь.");
};


instance DIA_STRF_1107_FLEENOW(C_Info)
{
	npc = STRF_1107_Straefling;
	nr = 4;
	condition = dia_strf_1107_fleenow_condition;
	information = dia_strf_1107_fleenow_info;
	permanent = TRUE;
	description = "Ты готов?";
};

func int dia_strf_1107_fleenow_condition()
{
	if(Npc_KnowsInfo(hero,dia_strf_1107_fleeinfo) && (COOK1107_GOBASE == FALSE))
	{
		return TRUE;
	};
};

func void dia_strf_1107_fleenow_info()
{
	if(Wld_IsTime(23,0,4,0))
	{
		AI_Output(self,other,"DIA_STRF_1107_FleeNow_01_02");	//А как насчет одежды?
		AI_Output(other,self,"DIA_STRF_1107_FleeNow_15_01");	//Сейчас гляну, что у меня есть, не вызывающее подозрения...
		Info_ClearChoices(dia_strf_1107_fleenow);
		Info_AddChoice(dia_strf_1107_fleenow,Dialog_Back,dia_strf_1107_fleenow_back);

		if(Npc_HasItems(other,itar_djg_l) > 0)
		{
			Info_AddChoice(dia_strf_1107_fleenow,"Дать легкие доспехи драконоборца",dia_strf_1107_fleenow_djg_l);
		};
		if(Npc_HasItems(other,itar_djg_l_v1) > 0)
		{
			Info_AddChoice(dia_strf_1107_fleenow,"Дать легкие кованные доспехи драконоборца",dia_strf_1107_fleenow_djg_l_v1);
		};
		if(Npc_HasItems(other,itar_djg_m) > 0)
		{
			Info_AddChoice(dia_strf_1107_fleenow,"Дать доспехи драконоборца",dia_strf_1107_fleenow_djg_m);
		};
		if(Npc_HasItems(other,itar_djg_m_v1) > 0)
		{
			Info_AddChoice(dia_strf_1107_fleenow,"Дать кованные доспехи драконоборца",dia_strf_1107_fleenow_djg_m_v1);
		};
		if(Npc_HasItems(other,itar_djg_h) > 0)
		{
			Info_AddChoice(dia_strf_1107_fleenow,"Дать тяжелые доспехи драконоборца",dia_strf_1107_fleenow_djg_h);
		};
		if(Npc_HasItems(other,itar_djg_h_v1) > 0)
		{
			Info_AddChoice(dia_strf_1107_fleenow,"Дать тяжелые кованные доспехи драконоборца",dia_strf_1107_fleenow_djg_h_v1);
		};
		if(Npc_HasItems(other,ITAR_Mil_L) > 0)
		{
			Info_AddChoice(dia_strf_1107_fleenow,"Дать доспехи ополчения",dia_strf_1107_fleenow_mil_l);
		};
		if(Npc_HasItems(other,itar_mil_l_v1) > 0)
		{
			Info_AddChoice(dia_strf_1107_fleenow,"Дать кованые доспехи ополчения",dia_strf_1107_fleenow_mil_l_v1);
		};
		if(Npc_HasItems(other,ItAr_MIL_M) > 0)
		{
			Info_AddChoice(dia_strf_1107_fleenow,"Дать тяжелые доспехи ополчения",dia_strf_1107_fleenow_mil_m);
		};
		if(Npc_HasItems(other,itar_mil_m_v1) > 0)
		{
			Info_AddChoice(dia_strf_1107_fleenow,"Дать тяжелые кованные доспехи ополчения",dia_strf_1107_fleenow_mil_m_v1);
		};
		if(Npc_HasItems(other,ItAr_PAL_M) > 0)
		{
			Info_AddChoice(dia_strf_1107_fleenow,"Дать доспехи паладина",dia_strf_1107_fleenow_pal_m);
		};
		if(Npc_HasItems(other,itar_pal_m_v1) > 0)
		{
			Info_AddChoice(dia_strf_1107_fleenow,"Дать рудные доспехи паладина",dia_strf_1107_fleenow_pal_m_v1);
		};
		if(Npc_HasItems(other,ItAr_PAl_H) > 0)
		{
			Info_AddChoice(dia_strf_1107_fleenow,"Дать тяжелые доспехи паладина",dia_strf_1107_fleenow_pal_h);
		};
		if(Npc_HasItems(other,ITAR_DJG_Crawler) > 0)
		{
			Info_AddChoice(dia_strf_1107_fleenow,"Дать доспехи из панцирей ползунов",dia_strf_1107_fleenow_pal_h_v1);
		};
		if(Npc_HasItems(other,ITAR_Leather_L) > 0)
		{
			Info_AddChoice(dia_strf_1107_fleenow,"Дать кожаный доспех",dia_strf_1107_fleenow_pal_h_v2);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_STRF_1107_FleeNow_01_01");	//Прямо посреди белого дня? У тебя как с головой?! Приходи ночью.
		AI_StopProcessInfos(self);
	};
};

func void dia_strf_1107_fleenow_back()
{
	AI_Output(self,other,"DIA_STRF_1107_FleeNow_01_05");	//Проклятье! Ну что это за подготовка?
	AI_StopProcessInfos(self);
};

func void dia_strf_1107_fleenow_tatsache()
{
	AI_EquipBestArmor(self);
	AI_Output(self,other,"DIA_STRF_1107_FleeNow_01_03");	//В самый раз!
	B_GivePlayerXP(100);
	AI_Output(self,other,"DIA_STRF_1107_FleeNow_01_04");	//А что у нас с оружием?
	Info_ClearChoices(dia_strf_1107_fleenow);

	if(Npc_HasItems(other,ItMw_Schwert) > 0)
	{
		Info_AddChoice(dia_strf_1107_fleenow,"Обычный меч",dia_strf_1107_fleenow_ItMw_Schwert);
	};
	if(Npc_HasItems(other,ItMw_1h_Sld_Sword_New) > 0)
	{
		Info_AddChoice(dia_strf_1107_fleenow,"Грубый меч",dia_strf_1107_fleenow_ItMw_1h_Sld_Sword_New);
	};
	if(Npc_HasItems(other,ItMw_Schwert2) > 0)
	{
		Info_AddChoice(dia_strf_1107_fleenow,"Длинный меч",dia_strf_1107_fleenow_ItMw_Schwert2);
	};
	if(Npc_HasItems(other,ItMw_1H_Common_01) > 0)
	{
		Info_AddChoice(dia_strf_1107_fleenow,"Самокованный меч",dia_strf_1107_fleenow_ItMw_1H_Common_01);
	};
	if(Npc_HasItems(other,ItMw_ShortSword1) > 0)
	{
		Info_AddChoice(dia_strf_1107_fleenow,"Короткий меч ополчения",dia_strf_1107_fleenow_itmw_2h_orcsword_01);
	};
	if(Npc_HasItems(other,ItMw_1h_Mil_Sword) > 0)
	{
		Info_AddChoice(dia_strf_1107_fleenow,"Грубый широкий меч",dia_strf_1107_fleenow_itmw_2h_orcsword_02);
	};
	if(Npc_HasItems(other,ItMw_Schwert) > 0)
	{
		Info_AddChoice(dia_strf_1107_fleenow,"Грубый длинный меч",dia_strf_1107_fleenow_itmw_2h_orcaxe_04);
	};
	if(Npc_HasItems(other,ItMw_1h_Pal_Sword) > 0)
	{
		Info_AddChoice(dia_strf_1107_fleenow,"Клинок рыцаря",dia_strf_1107_fleenow_itmw_2h_orcaxe_03);
	};
	if(Npc_HasItems(other,ItMw_2h_Pal_Sword) > 0)
	{
		Info_AddChoice(dia_strf_1107_fleenow,"Двуручник рыцаря",dia_strf_1107_fleenow_itmw_2h_orcaxe_02);
	};
	if(Npc_HasItems(other,ItMw_Zweihaender1) > 0)
	{
		Info_AddChoice(dia_strf_1107_fleenow,"Легкий двуручник",dia_strf_1107_fleenow_itmw_2h_orcaxe_01);
	};

	Info_AddChoice(dia_strf_1107_fleenow,"Я не нашел ничего подходящего.",dia_strf_1107_fleenow_nosword);
};

func void dia_strf_1107_fleenow_axegiven()
{
	B_GivePlayerXP(50);
	AI_EquipBestMeleeWeapon(self);
	Info_ClearChoices(dia_strf_1107_fleenow);
	AI_Output(self,other,"DIA_STRF_1107_FleeNow_01_08");	//Отлично!
	AI_Output(self,other,"DIA_STRF_1107_FleeNow_01_09");	//Теперь можно идти!
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	COOK1107_GOBASE = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GoForestBase");
};

func void dia_strf_1107_fleenow_djg_lcr()
{
	B_GiveInvItems(other,self,ITAR_DJG_Crawler,1);
	dia_strf_1107_fleenow_tatsache();
};

func void dia_strf_1107_fleenow_djg_l()
{
	B_GiveInvItems(other,self,itar_djg_l,1);
	dia_strf_1107_fleenow_tatsache();
};

func void dia_strf_1107_fleenow_djg_l_v1()
{
	B_GiveInvItems(other,self,itar_djg_l_v1,1);
	dia_strf_1107_fleenow_tatsache();
};

func void dia_strf_1107_fleenow_djg_m()
{
	B_GiveInvItems(other,self,itar_djg_m,1);
	dia_strf_1107_fleenow_tatsache();
};

func void dia_strf_1107_fleenow_djg_m_v1()
{
	B_GiveInvItems(other,self,itar_djg_m_v1,1);
	dia_strf_1107_fleenow_tatsache();
};

func void dia_strf_1107_fleenow_djg_h()
{
	B_GiveInvItems(other,self,itar_djg_h,1);
	dia_strf_1107_fleenow_tatsache();
};

func void dia_strf_1107_fleenow_djg_h_v1()
{
	B_GiveInvItems(other,self,itar_djg_h_v1,1);
	dia_strf_1107_fleenow_tatsache();
};

func void dia_strf_1107_fleenow_mil_l()
{
	B_GiveInvItems(other,self,ITAR_Mil_L,1);
	dia_strf_1107_fleenow_tatsache();
};

func void dia_strf_1107_fleenow_mil_m()
{
	B_GiveInvItems(other,self,ItAr_MIL_M,1);
	dia_strf_1107_fleenow_tatsache();
};

func void dia_strf_1107_fleenow_mil_l_v1()
{
	B_GiveInvItems(other,self,itar_mil_l_v1,1);
	dia_strf_1107_fleenow_tatsache();
};

func void dia_strf_1107_fleenow_mil_m_v1()
{
	B_GiveInvItems(other,self,itar_mil_m_v1,1);
	dia_strf_1107_fleenow_tatsache();
};

func void dia_strf_1107_fleenow_pal_m()
{
	B_GiveInvItems(other,self,ItAr_PAL_M,1);
	dia_strf_1107_fleenow_tatsache();
};

func void dia_strf_1107_fleenow_pal_h()
{
	B_GiveInvItems(other,self,ItAr_PAl_H,1);
	dia_strf_1107_fleenow_tatsache();
};

func void dia_strf_1107_fleenow_pal_m_v1()
{
	B_GiveInvItems(other,self,itar_pal_m_v1,1);
	dia_strf_1107_fleenow_tatsache();
};

func void dia_strf_1107_fleenow_pal_h_v1()
{
	B_GiveInvItems(other,self,ITAR_DJG_Crawler,1);
	dia_strf_1107_fleenow_tatsache();
};

func void dia_strf_1107_fleenow_pal_h_v2()
{
	B_GiveInvItems(other,self,ITAR_Leather_L,1);
	dia_strf_1107_fleenow_tatsache();
};

func void dia_strf_1107_fleenow_itmw_2h_orcsword_01()
{
	B_GiveInvItems(other,self,ItMw_ShortSword1,1);
	dia_strf_1107_fleenow_axegiven();
};

func void dia_strf_1107_fleenow_itmw_2h_orcsword_02()
{
	B_GiveInvItems(other,self,ItMw_1h_Mil_Sword,1);
	dia_strf_1107_fleenow_axegiven();
};

func void dia_strf_1107_fleenow_itmw_2h_orcaxe_04()
{
	B_GiveInvItems(other,self,ItMw_Schwert,1);
	dia_strf_1107_fleenow_axegiven();
};

func void dia_strf_1107_fleenow_itmw_2h_orcaxe_03()
{
	B_GiveInvItems(other,self,ItMw_1h_Pal_Sword,1);
	dia_strf_1107_fleenow_axegiven();
};

func void dia_strf_1107_fleenow_itmw_2h_orcaxe_02()
{
	B_GiveInvItems(other,self,ItMw_2h_Pal_Sword,1);
	dia_strf_1107_fleenow_axegiven();
};

func void dia_strf_1107_fleenow_itmw_2h_orcaxe_01()
{
	B_GiveInvItems(other,self,ItMw_Zweihaender1,1);
	dia_strf_1107_fleenow_axegiven();
};

func void dia_strf_1107_fleenow_ItMw_Schwert()
{
	B_GiveInvItems(other,self,ItMw_Schwert,1);
	dia_strf_1107_fleenow_axegiven();
};

func void dia_strf_1107_fleenow_ItMw_1h_Sld_Sword_New()
{
	B_GiveInvItems(other,self,ItMw_1h_Sld_Sword_New,1);
	dia_strf_1107_fleenow_axegiven();
};

func void dia_strf_1107_fleenow_ItMw_Schwert2()
{
	B_GiveInvItems(other,self,ItMw_Schwert2,1);
	dia_strf_1107_fleenow_axegiven();
};

func void dia_strf_1107_fleenow_ItMw_1H_Common_01()
{
	B_GiveInvItems(other,self,ItMw_1H_Common_01,1);
	dia_strf_1107_fleenow_axegiven();
};

func void dia_strf_1107_fleenow_nosword()
{
	AI_Output(other,self,"DIA_STRF_1107_FleeNow_15_02");	//Я не нашел ничего подходящего.
	AI_Output(self,other,"DIA_STRF_1107_FleeNow_01_06");	//Ты не добыл никакого орочьего оружия?
	AI_Output(self,other,"DIA_STRF_1107_FleeNow_01_07");	//Я начинаю сомневаться, что мы дойдем до места.
	AI_Output(self,other,"DIA_STRF_1107_FleeNow_01_10");	//Ну ладно, поздно спорить! Пошли отсюда.
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	COOK1107_GOBASE = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GoForestBase");
};

instance DIA_STRF_1107_ARRIVEDBASE(C_Info)
{
	npc = STRF_1107_Straefling;
	nr = 1;
	condition = dia_strf_1107_arrivedbase_condition;
	information = dia_strf_1107_arrivedbase_info;
	important = TRUE;
};

func int dia_strf_1107_arrivedbase_condition()
{
	if((Npc_GetDistToWP(self,"WP_COAST_FOREST_58") <= 1000) && (self.aivar[AIV_PARTYMEMBER] == TRUE))
	{
		return TRUE;
	};
};

func void dia_strf_1107_arrivedbase_info()
{
	B_GivePlayerXP(500);
	AI_Output(self,other,"DIA_STRF_1107_ArrivedBase_01_00");	//Это ведь то самое место? Хммм...(оглядываясь) Мне тут уже нравится!
	AI_Output(other,self,"DIA_STRF_1107_ArrivedBase_01_01");	//Я рад за тебя. А что насчет моей обещанной награды?
	AI_Output(self,other,"DIA_STRF_1107_ArrivedBase_01_02");	//Само собой. (улыбаясь) Слушай меня внимательно, приятель.
	AI_Output(self,other,"DIA_STRF_1107_ArrivedBase_01_03");	//Когда я сидел в камере, то познакомился с один парнем из Нового лагеря.
	AI_Output(self,other,"DIA_STRF_1107_ArrivedBase_01_04");	//Бедолага попался паладинам, когда пытался выбраться из Долины Рудников.
	AI_Output(self,other,"DIA_STRF_1107_ArrivedBase_01_05");	//Так вот, тот парень утверждал, что в замке есть сундук, доверху набитый рудой.
	AI_Output(self,other,"DIA_STRF_1107_ArrivedBase_01_06");	//Но, самое главное, он знает, где находится ключ от этого сундука!
	AI_Output(self,other,"DIA_STRF_1107_ArrivedBase_01_07");	//Тогда я ему, конечно, не поверил... (вздыхая) Но знаешь, чем Белиар не шутит...
	AI_Output(self,other,"DIA_STRF_1107_ArrivedBase_01_08");	//К сожалению, тот парень умер! Но перед своей смертью он отдал мне ключ от своих пожитков в Новом лагере.
	AI_Output(self,other,"DIA_STRF_1107_ArrivedBase_01_09");	//И сказал, что там я найду то, что сделает меня сказочно богатым.
	B_GiveInvItems(self,other,itke_nc_cookchest,1);
	AI_Output(self,other,"DIA_STRF_1107_ArrivedBase_01_10");	//Вот, возьми его. Я уже точно туда не сунусь, ну а ты можешь попробовать.
	AI_Output(self,other,"DIA_STRF_1107_ArrivedBase_01_11");	//Это все. Ну как, интересно?
	AI_Output(other,self,"DIA_STRF_1107_ArrivedBase_01_12");	//Ладно, посмотрим, не соврал ли твой друг.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	MIS_OCCOOKFLEE = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_OCCOOKFLEE,LOG_SUCCESS);
	B_LogEntry(TOPIC_OCCOOKFLEE,"Я довел Клиффа до Лесного лагеря, и он, как и обещал, отдал мне ключ от сундука в Новом лагере. По его словам, он откроет путь к сказочным богатствам.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"STAYINCAMP");
};

var int CliffTellCassia;

instance DIA_STRF_1107_CASSIA(C_Info)
{
	npc = STRF_1107_Straefling;
	nr = 4;
	condition = dia_strf_1107_cassia_condition;
	information = dia_strf_1107_cassia_info;
	permanent = TRUE;
	description = "А ты не знаешь случайно...";
};

func int dia_strf_1107_cassia_condition()
{
	if(((MIS_CASSIAGOLDCUP == LOG_Running) && (CliffTellCassia == FALSE) && (Npc_HasItems(other,ITKE_TWOSTORE) == 0) && ((MIS_OCCOOKFLEE == LOG_SUCCESS) || (MIS_OCCOOKFLEE == LOG_Running))) || ((MIS_RARETHINGS == LOG_Running) && (Npc_KnowsInfo(hero,dia_gomez_hello) == FALSE)))
	{
		return TRUE;
	};
};

func void dia_strf_1107_cassia_info()
{
	Info_ClearChoices(dia_strf_1107_cassia);
	Info_AddChoice(dia_strf_1107_cassia,Dialog_Back,dia_strf_1107_cassia_back);

	if((MIS_RARETHINGS == LOG_Running) && (Npc_KnowsInfo(hero,dia_gomez_hello) == FALSE))
	{
		Info_AddChoice(dia_strf_1107_cassia,"О статуэтках Инноса из черного мрамора?",dia_strf_1107_cassia_rarethings);
	};
	if((MIS_CASSIAGOLDCUP != LOG_SUCCESS) && (MIS_CASSIAGOLDCUP == LOG_Running) && (Npc_HasItems(other,ITKE_TWOSTORE) == 0) && ((MIS_OCCOOKFLEE == LOG_SUCCESS) || (MIS_OCCOOKFLEE == LOG_Running)))
	{
		Info_AddChoice(dia_strf_1107_cassia,"О чаше Рудного Барона?",dia_strf_1107_cassia_goldcup);
	};
};

func void dia_strf_1107_cassia_goldcup()
{
	AI_Output(other,self,"DIA_STRF_1107_Cassia_15_00");	//А ты не знаешь случайно, где может находится чаша Рудного Барона?
	AI_Output(self,other,"DIA_STRF_1107_Cassia_01_01");	//Ха, вот теперь я действительно верю, что ты бывший каторжник из колонии. Я слышал об этой штуке.
	AI_Output(self,other,"DIA_STRF_1107_Cassia_01_02");	//Скорее всего, она где-то на складе. Только вот ключ от него Энгор потерял.
	AI_Output(self,other,"DIA_STRF_1107_Cassia_01_03");	//Но даже если ты его найдешь, внутри есть второе помещение, ключ от которого у паладинов - либо у Орика, либо у Парсиваля.
	AI_Output(self,other,"DIA_STRF_1107_Cassia_01_04");	//Тут тебе придется тяжело - надо быть очень ловким парнем, чтобы украсть что-нибудь у них.

	if(MILTENSAYABOUTOCKEY == FALSE)
	{
		B_LogEntry(TOPIC_CASSIAGOLDCUP,"Чаша Рудного Барона может находиться во внутреннем помещении склада паладинов, ключ от которого у Орика или Парсиваля. Ключ от самого склада Энгор потерял.");
	}
	else
	{
		B_LogEntry(TOPIC_CASSIAGOLDCUP,"Чаша Рудного Барона может находиться во внутреннем помещении склада паладинов, ключ от которого у Орика или Парсиваля.");
	};

	CliffTellCassia = TRUE;
};

func void dia_strf_1107_cassia_rarethings()
{
	AI_Output(other,self,"DIA_STRF_1107_Cassia_15_01");	//Ты ничего не знаешь о статуэтках Инноса из черного мрамора?
	AI_Output(self,other,"DIA_STRF_1107_Cassia_01_05");	//Когда-то у Гомеза были какие-то черные статуэтки, которыми он очень гордился.
	AI_Output(self,other,"DIA_STRF_1107_Cassia_01_06");	//Скорее всего, они остались где-то в замке. Посмотри в комнатах паладинов или старых покоях Гомеза.
	AI_Output(self,other,"DIA_STRF_1107_Cassia_01_07");	//Ну а ключи от комнат ищи в карманах паладинов или комнатах замка.
	B_LogEntry(TOPIC_RARETHINGS,"Нужные Лютеро статуэтки все еще находятся в какой-то комнате в замке и под замком. Ключи придется поискать.");
};

func void dia_strf_1107_cassia_back()
{
	Info_ClearChoices(dia_strf_1107_cassia);
	AI_StopProcessInfos(self);
};

instance DIA_STRF_1107_Straefling_Ship(C_Info)
{
	npc = STRF_1107_Straefling;
	nr = 1;
	condition = DIA_STRF_1107_Straefling_Ship_condition;
	information = DIA_STRF_1107_Straefling_Ship_info;
	permanent = FALSE;
	description = "Не хочешь убраться с этого острова?";
};

func int DIA_STRF_1107_Straefling_Ship_condition()
{
	if((MIS_SylvioCrew == LOG_Running) && (MIS_OCCOOKFLEE == LOG_SUCCESS) && (MoveDracarBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_STRF_1107_Straefling_Ship_info()
{
	B_GivePlayerXP(400);
	AI_Output(other,self,"DIA_STRF_1107_Straefling_Ship_01_00");	//Не хочешь убраться с этого острова?
	AI_Output(self,other,"DIA_STRF_1107_Straefling_Ship_01_01");	//Еще бы...(ухмыляясь) Конечно, хочу! А то он для меня уже как кость в глотке.
	AI_Output(other,self,"DIA_STRF_1107_Straefling_Ship_01_02");	//Тогда у тебя появился шанс сделать это.
	AI_Output(self,other,"DIA_STRF_1107_Straefling_Ship_01_03");	//Шутишь что ли, не пойму? (недоверчиво)
	AI_Output(other,self,"DIA_STRF_1107_Straefling_Ship_01_04");	//Какие шутки! Мне нужен повар на корабль.
	AI_Output(other,self,"DIA_STRF_1107_Straefling_Ship_01_05");	//Точнее не мне, а одному наемнику по имени Сильвио.
	AI_Output(self,other,"DIA_STRF_1107_Straefling_Ship_01_06");	//Ну, ты это... Ты ведь знаешь, как я вкусно готовлю!
	AI_Output(other,self,"DIA_STRF_1107_Straefling_Ship_01_07");	//Да успокойся ты! Кроме тебя тут кандидатур и нет. Просто скажи - ты в деле?
	AI_Output(self,other,"DIA_STRF_1107_Straefling_Ship_01_09");	//Ты еще спрашиваешь? (радостно) Конечно, я в деле!
	AI_Output(self,other,"DIA_STRF_1107_Straefling_Ship_01_10");	//Единственное, что меня смущает - есть ли у этого парня корабль?
	AI_Output(other,self,"DIA_STRF_1107_Straefling_Ship_01_11");	//Конечно! Он совсем недалеко отсюда.
	AI_Output(self,other,"DIA_STRF_1107_Straefling_Ship_01_12");	//(удивленно) Странно! Я тут видел только дракар орков.
	AI_Output(other,self,"DIA_STRF_1107_Straefling_Ship_01_13");	//Так это он и есть!
	AI_Output(self,other,"DIA_STRF_1107_Straefling_Ship_01_14");	//Что?! Он что, отбил его у орков?
	AI_Output(other,self,"DIA_STRF_1107_Straefling_Ship_01_15");	//Ну он или я. Какая разница? Главное, теперь он наш.
	AI_Output(other,self,"DIA_STRF_1107_Straefling_Ship_01_16");	//Так что лучше отправляйся туда и жди Сильвио. 
	AI_Output(self,other,"DIA_STRF_1107_Straefling_Ship_01_17");	//Хорошо, так и сделаю. Только сначала немного передохну.
	ClifAgree = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_STRF_1107_Straefling_Drakar_Perm(C_Info)
{
	npc = STRF_1107_Straefling;
	nr = 1;
	condition = DIA_STRF_1107_Straefling_Drakar_Perm_condition;
	information = DIA_STRF_1107_Straefling_Drakar_Perm_info;
	permanent = TRUE;
	description = "Что готовим?";
};

func int DIA_STRF_1107_Straefling_Drakar_Perm_condition()
{
	if((MoveDracarBoard == TRUE) && (CliffOnBoard == TRUE))
	{
		return TRUE;
	};
};

func void DIA_STRF_1107_Straefling_Drakar_Perm_info()
{
	AI_Output(other,self,"DIA_STRF_1107_Straefling_Drakar_Perm_01_00");	//Что готовим?
	AI_Output(self,other,"DIA_STRF_1107_Straefling_Drakar_Perm_01_01");	//Все, что под руку попадется.
	AI_Output(self,other,"DIA_STRF_1107_Straefling_Drakar_Perm_01_02");	//Сам понимаешь, сейчас выбирать не приходится.
	AI_Output(self,other,"DIA_STRF_1107_Straefling_Drakar_Perm_01_03");	//Но кладовые у орков тут богатые! Все трюмы под завязку забиты солониной.
	AI_Output(self,other,"DIA_STRF_1107_Straefling_Drakar_Perm_01_04");	//Так что с голоду мы точно не умрем.
};