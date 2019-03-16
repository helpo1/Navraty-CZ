
instance DIA_SNAF_NW_EXIT(C_Info)
{
	npc = vlk_6023_snaf;
	nr = 999;
	condition = dia_snaf_nw_exit_condition;
	information = dia_snaf_nw_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_snaf_nw_exit_condition()
{
	return TRUE;
};

func void dia_snaf_nw_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SNAF_NW_PICKPOCKET(C_Info)
{
	npc = vlk_6023_snaf;
	nr = 900;
	condition = dia_snaf_nw_pickpocket_condition;
	information = dia_snaf_nw_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_snaf_nw_pickpocket_condition()
{
	return C_Beklauen(75,150);
};

func void dia_snaf_nw_pickpocket_info()
{
	Info_ClearChoices(dia_snaf_nw_pickpocket);
	Info_AddChoice(dia_snaf_nw_pickpocket,Dialog_Back,dia_snaf_nw_pickpocket_back);
	Info_AddChoice(dia_snaf_nw_pickpocket,DIALOG_PICKPOCKET,dia_snaf_nw_pickpocket_doit);
};

func void dia_snaf_nw_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_snaf_nw_pickpocket);
};

func void dia_snaf_nw_pickpocket_back()
{
	Info_ClearChoices(dia_snaf_nw_pickpocket);
};


instance DIA_SNAF_NW_HI(C_Info)
{
	npc = vlk_6023_snaf;
	nr = 1;
	condition = dia_snaf_nw_hi_condition;
	information = dia_snaf_nw_hi_info;
	important = TRUE;
};


func int dia_snaf_nw_hi_condition()
{
	return TRUE;
};

func void dia_snaf_nw_hi_info()
{
	B_GivePlayerXP(500);
	AI_Output(self,other,"DIA_Snaf_NW_Hi_01_00");	//Так-так. Кто это у нас здесь?
	AI_Output(other,self,"DIA_Snaf_NW_Hi_01_01");	//Снаф, уж не ты ли это?
	AI_Output(self,other,"DIA_Snaf_NW_Hi_01_02");	//Собственной персоной! Удивлен?
	AI_Output(other,self,"DIA_Snaf_NW_Hi_01_03");	//Вообще-то, не ожидал тебя тут встретить.
	AI_Output(self,other,"DIA_Snaf_NW_Hi_01_04");	//Как и я тебя. А ты, вижу, успел за это время далеко пробиться.
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Snaf_NW_Hi_01_05");	//Маг Огня! Ну кто бы мог подумать?
	}
	else if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Snaf_NW_Hi_01_06");	//Паладин короля! Ну кто бы мог подумать?
	}
	else if(other.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Snaf_NW_Hi_01_07");	//Наемник, значит! Ну кто бы мог подумать?
	}
	else if(other.guild == GIL_KDW)
	{
		AI_Output(self,other,"DIA_Snaf_NW_Hi_01_0A");	//Маг Воды! Ну кто бы мог подумать...
	}
	else if(other.guild == GIL_KDM)
	{
		AI_Output(self,other,"DIA_Snaf_NW_Hi_01_0B");	//НЕКРОМАНТ! Ну кто бы мог подумать?
	}
	else if((other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR))
	{
		AI_Output(self,other,"DIA_Snaf_NW_Hi_01_0C");	//Болотник! Ну кто бы мог подумать?
	};
	AI_Output(other,self,"DIA_Snaf_NW_Hi_01_08");	//Что ты тут делаешь?
	AI_Output(self,other,"DIA_Snaf_NW_Hi_01_09");	//А что, разве не видишь? Работаю тут. (смеется)
	AI_Output(other,self,"DIA_Snaf_NW_Hi_01_10");	//Кардиф взял тебя к себе?
	AI_Output(self,other,"DIA_Snaf_NW_Hi_01_11");	//Я поделился с ним одним из моих лучших рецептов - этого хватило, чтобы получить эту работенку.
	AI_Output(self,other,"DIA_Snaf_NW_Hi_01_12");	//А я и не жалуюсь. Как раз мой профиль. Да и Кардифу хлопот поменьше.
	AI_Output(self,other,"DIA_Snaf_NW_Hi_01_13");	//Похоже, он не очень-то жалеет, что взял меня к себе.
	AI_Output(other,self,"DIA_Snaf_NW_Hi_01_14");	//Да, ты хорошо устроился.
	AI_Output(self,other,"DIA_Snaf_NW_Hi_01_15");	//Само собой. Ладно, парень - у меня еще куча дел, а на пустую болтовню у меня времени особо нет. Даже со старым знакомым!
	AI_Output(other,self,"DIA_Snaf_NW_Hi_01_16");	//Ладно, работай. Не буду отвлекать.
	AI_Output(self,other,"DIA_Snaf_NW_Hi_01_17");	//Спасибо тебе.
	AI_Output(other,self,"DIA_Snaf_NW_Hi_01_18");	//Да не за что.
};

instance DIA_Snaf_NW_Booze(C_Info)
{
	npc = vlk_6023_snaf;
	nr = 3;
	condition = DIA_Snaf_NW_Booze_Condition;
	information = DIA_Snaf_NW_Booze_Info;
	permanent = FALSE;
	description = "Вот твой самогон, приятель.";
};

func int DIA_Snaf_NW_Booze_Condition()
{
	if((Npc_HasItems(other,ItFo_Addon_LousHammer) >= 1) && (MIS_SnafHammer == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Snaf_NW_Booze_Info()
{
	B_GivePlayerXP(XP_Addon_Loushammer);
	AI_Output(other,self,"DIA_Addon_Snaf_Booze_15_00");	//Вот твой самогон, приятель.
	B_GiveInvItems(other,self,ItFo_Addon_LousHammer,1);
	AI_Output(self,other,"DIA_Addon_Snaf_Booze_01_01");	//Прекрасно, позволь мне приготовить соус.
	AI_Output(self,other,"DIA_Addon_Snaf_Booze_01_02");	//Вот, готово! Можешь попробовать прямо сейчас. Силушки-то в ручонках прибавится, спору нет!
	B_GiveInvItems(self,other,ItFo_Addon_FireStew,1);
	MIS_SnafHammer = LOG_SUCCESS;
	Log_SetTopicStatus(Topic_Addon_Hammer,LOG_SUCCESS);
	B_LogEntry(Topic_Addon_Hammer,"Я принес Снафу самогон.");
};

instance DIA_SNAF_NW_CITY(C_Info)
{
	npc = vlk_6023_snaf;
	nr = 2;
	condition = dia_snaf_nw_city_condition;
	information = dia_snaf_nw_city_info;
	permanent = TRUE;
	description = "Есть что-нибудь новенькое?";
};

func int dia_snaf_nw_city_condition()
{
	if(Npc_KnowsInfo(other,dia_snaf_nw_hi))
	{
		return TRUE;
	};
};

func void dia_snaf_nw_city_info()
{
	AI_Output(other,self,"DIA_Snaf_NW_City_01_00");	//Есть что-нибудь новенькое?
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Snaf_NW_City_01_01");	//Нет, ничего такого. Ну, кроме того, что теперь бандитов стали принимать в маги Огня...(смеется)
	}
	else if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Snaf_NW_City_01_02");	//Нет, ничего такого. Ну, кроме того, что бандитов теперь стали брать в паладины...(смеется)
	}
	else if(other.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Snaf_NW_City_01_03");	//Нет, ничего такого. Ну, кроме того, что бандитов теперь стали брать в наемники...(смеется)
	}
	else if(other.guild == GIL_KDW)
	{
		AI_Output(self,other,"DIA_Snaf_NW_City_01_04");	//Нет, ничего такого. Ну, кроме того, что бандитов теперь стали принимать в маги Воды...(смеется)
	}
	else if(other.guild == GIL_KDM)
	{
		AI_Output(self,other,"DIA_Snaf_NW_City_01_05");	//Нет, ничего такого. Ну, кроме того, что бандитов теперь стали принимать в темные маги...(смеется)
	}
	else
	{
		AI_Output(self,other,"DIA_Snaf_NW_City_01_06");	//Нет, ничего такого, что могло бы заинтересовать тебя.
	};
};

instance DIA_Addon_Snaf_NW_TeachCookDone(C_Info)
{
	npc = vlk_6023_snaf;
	nr = 6;
	condition = DIA_Addon_Snaf_NW_TeachCookDone_Condition;
	information = DIA_Addon_Snaf_NW_TeachCookDone_Info;
	permanent = TRUE;
	description = "Научи меня готовить похлебки.";
};

func int DIA_Addon_Snaf_NW_TeachCookDone_Condition()
{
	if((SnafTeachCook == TRUE) && ((Snaf_Meal_01 == FALSE) || (Snaf_Meal_02 == FALSE) || (Snaf_Meal_03 == FALSE)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Snaf_NW_TeachCookDone_Info()
{
	AI_Output(other,self,"DIA_Addon_Snaf_TeachCookDone_01_00");	//Научи меня готовить похлебки.
	AI_Output(self,other,"DIA_Addon_Snaf_TeachCookDone_01_01");	//Хорошо! С чего начнем?
	Info_ClearChoices(DIA_Addon_Snaf_NW_TeachCookDone);
	Info_AddChoice(DIA_Addon_Snaf_NW_TeachCookDone,Dialog_Back,DIA_Addon_Snaf_NW_TeachCookDone_back);

	if(Snaf_Meal_01 == FALSE)
	{
		Info_AddChoice(DIA_Addon_Snaf_NW_TeachCookDone,"Черная грибная похлебка (Цена: 500 монет)",DIA_Addon_Snaf_NW_TeachCookDone_BlackMeal);
	};
	if(Snaf_Meal_02 == FALSE)
	{
		Info_AddChoice(DIA_Addon_Snaf_NW_TeachCookDone,"Матерая грибная похлебка (Цена: 750 монет)",DIA_Addon_Snaf_NW_TeachCookDone_HotMeal);
	};
	if(Snaf_Meal_03 == FALSE)
	{
		Info_AddChoice(DIA_Addon_Snaf_NW_TeachCookDone,"Мясное рагу (Цена: 250 монет)",DIA_Addon_Snaf_NW_TeachCookDone_MeatMeal);
	};
};

func void DIA_Addon_Snaf_NW_TeachCookDone_back()
{
	Info_ClearChoices(DIA_Addon_Snaf_NW_TeachCookDone);
};

func void DIA_Addon_Snaf_NW_TeachCookDone_BlackMeal()
{
	AI_Output(other,self,"DIA_Addon_Snaf_TeachCookDone_BlackMeal_01_00");	//Черная грибная похлебка.

	if(Npc_HasItems(hero,ItMi_Gold) >= 500)
	{
		Npc_RemoveInvItems(hero,ItMi_Gold,500);
		AI_Output(self,other,"DIA_Addon_Snaf_TeachCookDone_BlackMeal_01_01");	//Нет ничего проще. Для начала тебе понадобится примерно полсотни темных грибов.
		AI_Output(self,other,"DIA_Addon_Snaf_TeachCookDone_BlackMeal_01_02");	//Положи их в чан с водой и вари до тех пор, пока вода не приобретет черный цвет.
		AI_Output(self,other,"DIA_Addon_Snaf_TeachCookDone_BlackMeal_01_03");	//Потом добавь лист огненной травы. Это собьет горечь самого супа!
		AI_Output(self,other,"DIA_Addon_Snaf_TeachCookDone_BlackMeal_01_04");	//Вот и все.
		AI_Print("Изучен рецепт готовки еды - 'Черная грибная похлебка'");
		B_LogEntry(TOPIC_COOK,"Теперь я умею готовить черную грибную похлебку. Для этого мне понадобится полсотни темных грибов и лист огненной травы.");
		Snd_Play("LevelUP");
		Snaf_Meal_01 = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Snaf_TeachCookDone_BlackMeal_01_05");	//Ты держишь меня за дурака?
		AI_Output(self,other,"DIA_Addon_Snaf_TeachCookDone_BlackMeal_01_06");	//Я ничему не буду тебя учить, пока не увижу золота.
		Info_ClearChoices(DIA_Addon_Snaf_NW_TeachCookDone);
	};
};

func void DIA_Addon_Snaf_NW_TeachCookDone_HotMeal()
{
	AI_Output(other,self,"DIA_Addon_Snaf_TeachCookDone_HotMeal_01_00");	//Матерая грибная похлебка.

	if(Npc_HasItems(hero,ItMi_Gold) >= 750)
	{
		Npc_RemoveInvItems(hero,ItMi_Gold,750);
		AI_Output(self,other,"DIA_Addon_Snaf_TeachCookDone_HotMeal_01_01");	//Чтобы похлебка получилась наваристая, главное, не жалей для нее грибов.
		AI_Output(self,other,"DIA_Addon_Snaf_TeachCookDone_HotMeal_01_02");	//Кладешь полсотни штук в котел, добавляешь огненный корень для остроты и медленно все это варишь в котле.
		AI_Output(self,other,"DIA_Addon_Snaf_TeachCookDone_HotMeal_01_03");	//Не пройдет и получаса, как похлебка будет готова.
		AI_Print("Изучен рецепт готовки еды - 'Матерая грибная похлебка'");
		B_LogEntry(TOPIC_COOK,"Теперь я умею готовить матерую грибную похлебку. Для этого мне понадобится полсотни мясных грибов и огненный корешок.");
		Snd_Play("LevelUP");
		Snaf_Meal_02 = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Snaf_TeachCookDone_HotMeal_01_04");	//Ты держишь меня за дурака?
		AI_Output(self,other,"DIA_Addon_Snaf_TeachCookDone_HotMeal_01_05");	//Я ничему не буду тебя учить, пока не увижу золота.
		Info_ClearChoices(DIA_Addon_Snaf_NW_TeachCookDone);
	};
};


func void DIA_Addon_Snaf_NW_TeachCookDone_MeatMeal()
{
	AI_Output(other,self,"DIA_Addon_Snaf_TeachCookDone_MeatMeal_01_00");	//Мясное рагу.

	if(Npc_HasItems(hero,ItMi_Gold) >= 250)
	{
		Npc_RemoveInvItems(hero,ItMi_Gold,250);
		AI_Output(self,other,"DIA_Addon_Snaf_TeachCookDone_MeatMeal_01_01");	//Это мой собственный рецепт. (гордо) Ничего лишнего!
		AI_Output(self,other,"DIA_Addon_Snaf_TeachCookDone_MeatMeal_01_02");	//Только пара мясных грибов и мясо жука.
		AI_Output(self,other,"DIA_Addon_Snaf_TeachCookDone_MeatMeal_01_03");	//Бросаешь все в котел, варишь - и получаешь самое вкусное блюдо из всех, что мне доводилось пробовать.
		AI_Print("Изучен рецепт готовки еды - 'Мясное рагу'");
		B_LogEntry(TOPIC_COOK,"Теперь я умею готовить мясное рагу. Для этого мне понадобится пара темных грибов и мясо жука.");
		Snd_Play("LevelUP");
		Snaf_Meal_03 = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Snaf_TeachCookDone_MeatMeal_01_04");	//Ты держишь меня за дурака?
		AI_Output(self,other,"DIA_Addon_Snaf_TeachCookDone_MeatMeal_01_05");	//Я ничему не буду тебя учить, пока не увижу золота.
		Info_ClearChoices(DIA_Addon_Snaf_NW_TeachCookDone);
	};
};