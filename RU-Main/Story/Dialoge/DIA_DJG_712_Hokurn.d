
instance DIA_Hokurn_EXIT(C_Info)
{
	npc = DJG_712_Hokurn;
	nr = 999;
	condition = DIA_Hokurn_EXIT_Condition;
	information = DIA_Hokurn_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hokurn_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Hokurn_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Hokurn_Hello(C_Info)
{
	npc = DJG_712_Hokurn;
	nr = 4;
	condition = DIA_Hokurn_Hello_Condition;
	information = DIA_Hokurn_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Hokurn_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (KAPITELORCATC == FALSE) && (HokFirstMeet == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hokurn_Hello_Info()
{
	AI_Output(self,other,"DIA_Hokurn_Hello_01_00");	//У тебя не найдется чего-нибудь выпить?
	AI_Output(other,self,"DIA_Hokurn_Hello_15_01");	//Полагаю, вода тебе не подойдет.
	AI_Output(self,other,"DIA_Hokurn_Hello_01_02");	//Нет, черт побери!!! Мне нужно что-нибудь алкогольное, чтобы я, наконец, мог избавиться от этой проклятой головной боли.
	AI_Output(self,other,"DIA_Hokurn_Hello_01_03");	//Когда мне долго не удается промочить горло, мой череп раскалывается и мне кажется, что он вот-вот взорвется.
	Info_ClearChoices(DIA_Hokurn_Hello);
	Info_AddChoice(DIA_Hokurn_Hello,"Я ничем не могу помочь тебе.",DIA_Hokurn_Hello_No);

	if((Npc_HasItems(other,ItFo_Beer) >= 1) || (Npc_HasItems(other,ItFo_Addon_Rum) >= 1) || (Npc_HasItems(other,ItFo_Addon_Grog) >= 1) || (Npc_HasItems(other,ItFo_Booze) >= 1) || (Npc_HasItems(other,ItFo_Wine) >= 1))
	{
		Info_AddChoice(DIA_Hokurn_Hello,"Вот, возьми это.",DIA_Hokurn_Hello_Yes);
	};
};

func void DIA_Hokurn_Hello_No()
{
	AI_Output(other,self,"DIA_Hokurn_Hello_No_15_00");	//Я ничем не могу помочь тебе.
	AI_Output(self,other,"DIA_Hokurn_Hello_No_01_01");	//Тогда проваливай!
	Info_ClearChoices(DIA_Hokurn_Hello);
	Info_AddChoice(DIA_Hokurn_Hello,Dialog_Ende,DIA_Hokurn_Hello_END);
	Info_AddChoice(DIA_Hokurn_Hello,"Еще одно...",DIA_Hokurn_Hello_ASK1);
};

func void DIA_Hokurn_Hello_ASK1()
{
	AI_Output(other,self,"DIA_Hokurn_Hello_ASK1_15_00");	//Еще одно...
	AI_Output(self,other,"DIA_Hokurn_Hello_ASK1_01_01");	//(ревет) Ты что, не понял меня? УБИРАЙСЯ!!!
	Info_ClearChoices(DIA_Hokurn_Hello);
	Info_AddChoice(DIA_Hokurn_Hello,Dialog_Ende,DIA_Hokurn_Hello_END);
	Info_AddChoice(DIA_Hokurn_Hello,"Это важно.",DIA_Hokurn_Hello_ASK2);
};

func void DIA_Hokurn_Hello_ASK2()
{
	AI_Output(other,self,"DIA_Hokurn_Hello_ASK2_15_00");	//Это важно.
	AI_Output(self,other,"DIA_Hokurn_Hello_ASK2_01_01");	//(ревет) Ты сам напросился.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Hokurn_Hello_END()
{
	AI_StopProcessInfos(self);
};

func void B_Hokurn_Sauf()
{
	AI_Output(self,other,"B_Hokurn_Sauf_01_00");	//(рыгает) Ох, какое блаженство!
	AI_Output(self,other,"B_Hokurn_Sauf_01_01");	//Теперь я опять могу размышлять здраво. Что я могу сделать для тебя?
};

func void b_hokurn_drinking()
{
	if(Npc_HasItems(other,ItFo_Booze) >= 1)
	{
		B_GiveInvItems(other,self,ItFo_Booze,1);
		B_UseItem(self,ItFo_Booze);
	}
	else if(Npc_HasItems(other,ItFo_Wine) >= 1)
	{
		B_GiveInvItems(other,self,ItFo_Wine,1);
		B_UseItem(self,ItFo_Wine);
	}
	else if(Npc_HasItems(other,ItFo_Beer) >= 1)
	{
		B_GiveInvItems(other,self,ItFo_Beer,1);
		B_UseItem(self,ItFo_Beer);
	}
	else if(Npc_HasItems(other,ItFo_Addon_Rum) >= 1)
	{
		B_GiveInvItems(other,self,ItFo_Addon_Rum,1);
		B_UseItem(self,ItFo_Addon_Rum);
	}
	else if(Npc_HasItems(other,ItFo_Addon_Grog) >= 1)
	{
		B_GiveInvItems(other,self,ItFo_Addon_Grog,1);
		B_UseItem(self,ItFo_Addon_Grog);
	};
	HokurnLastDrink = Wld_GetDay();
	HokurnGetsDrink = TRUE;
};

func void b_hokurn_taking()
{
	if(Npc_HasItems(other,ItFo_Booze) >= 1)
	{
		B_GiveInvItems(other,self,ItFo_Booze,1);
	}
	else if(Npc_HasItems(other,ItFo_Wine) >= 1)
	{
		B_GiveInvItems(other,self,ItFo_Wine,1);
	}
	else if(Npc_HasItems(other,ItFo_Beer) >= 1)
	{
		B_GiveInvItems(other,self,ItFo_Beer,1);
	}
	else if(Npc_HasItems(other,ItFo_Addon_Rum) >= 1)
	{
		B_GiveInvItems(other,self,ItFo_Addon_Rum,1);
	}
	else if(Npc_HasItems(other,ItFo_Addon_Grog) >= 1)
	{
		B_GiveInvItems(other,self,ItFo_Addon_Grog,1);
	};
};

func void DIA_Hokurn_Hello_Yes()
{
	AI_Output(other,self,"DIA_Hokurn_Hello_Yes_15_00");	//У меня есть кое-что.
	b_hokurn_drinking();
	B_Hokurn_Sauf();
	Info_ClearChoices(DIA_Hokurn_Hello);
};


instance DIA_Hokurn_Drink(C_Info)
{
	npc = DJG_712_Hokurn;
	nr = 5;
	condition = DIA_Hokurn_Drink_Condition;
	information = DIA_Hokurn_Drink_Info;
	permanent = TRUE;
	description = "Я принес тебе выпивку.";
};


func int DIA_Hokurn_Drink_Condition()
{
	if((KAPITELORCATC == FALSE) && (HokurnGetsDrink == FALSE) && ((Npc_HasItems(other,ItFo_Beer) >= 1) || (Npc_HasItems(other,ItFo_Addon_Rum) >= 1) || (Npc_HasItems(other,ItFo_Addon_Grog) >= 1) || (Npc_HasItems(other,ItFo_Booze) >= 1) || (Npc_HasItems(other,ItFo_Wine) >= 1)))
	{
		return TRUE;
	};
};

func void DIA_Hokurn_Drink_Info()
{
	AI_Output(other,self,"DIA_Hokurn_Drink_15_00");	//Я принес тебе выпивку.
	AI_Output(self,other,"DIA_Hokurn_Drink_01_01");	//(жадно) Давай сюда!!
	b_hokurn_drinking();
	B_Hokurn_Sauf();
};


instance DIA_Hokurn_Question(C_Info)
{
	npc = DJG_712_Hokurn;
	nr = 5;
	condition = DIA_Hokurn_Question_Condition;
	information = DIA_Hokurn_Question_Info;
	permanent = TRUE;
	description = "Мне нужна кое-какая информация.";
};


func int DIA_Hokurn_Question_Condition()
{
	if((HokurnGetsDrink == FALSE) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hokurn_Question_Info()
{
	AI_Output(other,self,"DIA_Hokurn_Question_15_00");	//Мне нужна кое-какая информация.
	AI_Output(self,other,"DIA_Hokurn_Question_01_01");	//(раздраженно) Я думал, ты меня понял. Я говорю только с друзьями.
	AI_Output(self,other,"DIA_Hokurn_Question_01_02");	//А друзья всегда делятся со мной выпивкой. Понял? Теперь проваливай!
};


instance DIA_Hokurn_Learn(C_Info)
{
	npc = DJG_712_Hokurn;
	nr = 6;
	condition = DIA_Hokurn_Learn_Condition;
	information = DIA_Hokurn_Learn_Info;
	permanent = FALSE;
	description = "Я ищу человека, который мог бы научить меня чему-нибудь.";
};


func int DIA_Hokurn_Learn_Condition()
{
	if(HokurnGetsDrink == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Hokurn_Learn_Info()
{
	AI_Output(other,self,"DIA_Hokurn_Learn_15_00");	//Я ищу человека, который мог бы научить меня чему-нибудь.
	AI_Output(self,other,"DIA_Hokurn_Learn_01_01");	//Я мог бы обучить тебя некоторым вещам. Я лучший боец на многие мили вокруг.
	AI_Output(self,other,"DIA_Hokurn_Learn_01_02");	//Так как мы друзья, я сделаю тебе скидку. Это будет стоить триста золотых монет.
	Info_ClearChoices(DIA_Hokurn_Learn);
	Info_AddChoice(DIA_Hokurn_Learn,"Это слишком дорого.",DIA_Hokurn_Learn_TooExpensive);
	if(Npc_HasItems(other,ItMi_Gold) >= 300)
	{
		Info_AddChoice(DIA_Hokurn_Learn,"В порядке, вот золото.",DIA_Hokurn_Learn_OK);
	};
};

func void DIA_Hokurn_Learn_TooExpensive()
{
	AI_Output(other,self,"DIA_Hokurn_Learn_TooExpensive_15_00");	//Это для меня слишком дорого.
	AI_Output(self,other,"DIA_Hokurn_Learn_TooExpensive_01_01");	//Слишком дорого? Это меньше, чем любой другой запросил бы на моем месте.
	AI_Output(self,other,"DIA_Hokurn_Learn_TooExpensive_01_02");	//Ну, сам подумай.
	Info_ClearChoices(DIA_Hokurn_Learn);
};

func void DIA_Hokurn_Learn_OK()
{
	AI_Output(other,self,"DIA_Hokurn_Learn_OK_15_00");	//Хорошо, вот деньги.
	B_GiveInvItems(other,self,ItMi_Gold,300);
	Hokurn_TeachPlayer = TRUE;
	Info_ClearChoices(DIA_Hokurn_Learn);
};


instance DIA_Hokurn_PayTeacher(C_Info)
{
	npc = DJG_712_Hokurn;
	nr = 6;
	condition = DIA_Hokurn_PayTeacher_Condition;
	information = DIA_Hokurn_PayTeacher_Info;
	permanent = TRUE;
	description = "Вот твои деньги. Я хочу, чтобы ты обучил меня.";
};


func int DIA_Hokurn_PayTeacher_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Hokurn_Learn) && (Npc_HasItems(other,ItMi_Gold) >= 300) && (Hokurn_TeachPlayer == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hokurn_PayTeacher_Info()
{
	AI_Output(other,self,"DIA_Hokurn_PayTeacher_15_00");	//Вот твои деньги. Я хочу, чтобы ты обучил меня.
	AI_Output(self,other,"DIA_Hokurn_PayTeacher_01_01");	//Ты не пожалеешь!
	B_GiveInvItems(other,self,ItMi_Gold,300);
	Hokurn_TeachPlayer = TRUE;
};


instance DIA_Hokurn_DrinkAndLearn(C_Info)
{
	npc = DJG_712_Hokurn;
	nr = 7;
	condition = DIA_Hokurn_DrinkAndLearn_Condition;
	information = DIA_Hokurn_DrinkAndLearn_Info;
	permanent = TRUE;
	description = "Вот, держи выпивку.";
};


func int DIA_Hokurn_DrinkAndLearn_Condition()
{
	if((KAPITELORCATC == FALSE) && (HokurnGetsDrink == TRUE) && ((Npc_HasItems(other,ItFo_Booze) >= 1) || (Npc_HasItems(other,ItFo_Wine) >= 1) || (Npc_HasItems(other,ItFo_Beer) >= 1)))
	{
		return TRUE;
	};
};

func void DIA_Hokurn_DrinkAndLearn_Info()
{
	AI_Output(other,self,"DIA_Hokurn_DrinkAndLearn_15_00");	//Теперь у тебя есть, что выпить.
	b_hokurn_drinking();
	AI_Output(self,other,"DIA_Hokurn_DrinkAndLearn_01_01");	//Мне гораздо лучше.
};


instance DIA_Hokurn_Teach(C_Info)
{
	npc = DJG_712_Hokurn;
	nr = 7;
	condition = DIA_Hokurn_Teach_Condition;
	information = DIA_Hokurn_Teach_Info;
	permanent = TRUE;
	description = "Начнем обучение.";
};


func int DIA_Hokurn_Teach_Condition()
{
	if(Hokurn_TeachPlayer == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Hokurn_Teach_Info()
{
	AI_Output(other,self,"DIA_Hokurn_Teach_15_00");	//Давай начнем обучение.
	if(HokurnLastDrink < Wld_GetDay())
	{
		AI_Output(self,other,"DIA_Hokurn_Teach_01_01");	//Сначала принеси мне что-нибудь выпить!
	}
	else
	{
		if(hero.guild == GIL_PAL)
		{
			AI_Output(self,other,"DIA_Hokurn_Teach_01_02");	//А потом мы посмотрим, что можно выжать из твоих ржавых паладинских костей, ха?
		}
		else if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR))
		{
			AI_Output(self,other,"DIA_Hokurn_Teach_01_03");	//Что ты понимаешь. Даже маги не чуждаются оружия ближнего боя.
		};
		Info_ClearChoices(DIA_Hokurn_Teach);
		Info_AddChoice(DIA_Hokurn_Teach,Dialog_Back,DIA_Hokurn_Teach_Back);
		Info_AddChoice(DIA_Hokurn_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Hokurn_Teach_2H_1);
		Info_AddChoice(DIA_Hokurn_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Hokurn_Teach_2H_5);
		Info_AddChoice(DIA_Hokurn_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Hokurn_Teach_1H_1);
		Info_AddChoice(DIA_Hokurn_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Hokurn_Teach_1H_5);
	};
};

func void DIA_Hokurn_Teach_Back()
{
	Info_ClearChoices(DIA_Hokurn_Teach);
};

func void B_Hokurn_TeachedEnough()
{
	AI_Output(self,other,"B_Hokurn_TeachedEnough_01_00");	//Тебе больше не нужен учитель в этом виде боевого искусства.
};

func void DIA_Hokurn_Teach_2H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,100);
	if(other.HitChance[NPC_TALENT_2H] >= 100)
	{
		B_Hokurn_TeachedEnough();
	};
	Info_AddChoice(DIA_Hokurn_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Hokurn_Teach_2H_1);
};

func void DIA_Hokurn_Teach_2H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,100);
	if(other.HitChance[NPC_TALENT_2H] >= 100)
	{
		B_Hokurn_TeachedEnough();
	};
	Info_AddChoice(DIA_Hokurn_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Hokurn_Teach_2H_5);
};

func void DIA_Hokurn_Teach_1H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,100);
	if(other.HitChance[NPC_TALENT_1H] >= 100)
	{
		B_Hokurn_TeachedEnough();
	};
	Info_AddChoice(DIA_Hokurn_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Hokurn_Teach_1H_1);
};

func void DIA_Hokurn_Teach_1H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,100);
	if(other.HitChance[NPC_TALENT_1H] >= 100)
	{
		B_Hokurn_TeachedEnough();
	};
	Info_AddChoice(DIA_Hokurn_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Hokurn_Teach_1H_5);
};


instance DIA_Hokurn_StayHere(C_Info)
{
	npc = DJG_712_Hokurn;
	nr = 5;
	condition = DIA_Hokurn_StayHere_Condition;
	information = DIA_Hokurn_StayHere_Info;
	permanent = FALSE;
	description = "А что ты вообще здесь делаешь, кстати?";
};


func int DIA_Hokurn_StayHere_Condition()
{
	if((HokurnGetsDrink == TRUE) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hokurn_StayHere_Info()
{
	AI_Output(other,self,"DIA_Hokurn_StayHere_15_00");	//Кстати, а что ты вообще здесь делаешь?
	AI_Output(self,other,"DIA_Hokurn_StayHere_01_01");	//Если честно, понятия не имею, что мы делаем здесь и когда все начнется.
	AI_Output(self,other,"DIA_Hokurn_StayHere_01_02");	//И пока у меня есть выпивка, меня это совершенно не волнует.
};


instance DIA_Hokurn_WhereDragon(C_Info)
{
	npc = DJG_712_Hokurn;
	nr = 5;
	condition = DIA_Hokurn_WhereDragon_Condition;
	information = DIA_Hokurn_WhereDragon_Info;
	permanent = TRUE;
	description = "Ты знаешь, где находятся драконы?";
};


func int DIA_Hokurn_WhereDragon_Condition()
{
	if((HokurnGetsDrink == TRUE) && (HokurnTellsDragon == FALSE) && Npc_KnowsInfo(other,DIA_Hokurn_StayHere) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hokurn_WhereDragon_Info()
{
	AI_Output(other,self,"DIA_Hokurn_WhereDragon_15_00");	//Ты знаешь, где находятся драконы?
	AI_Output(self,other,"DIA_Hokurn_WhereDragon_01_01");	//А что я получу за то, что скажу это тебе?
	Info_ClearChoices(DIA_Hokurn_WhereDragon);
	Info_AddChoice(DIA_Hokurn_WhereDragon,"Ничего, я буду искать их сам.",DIA_Hokurn_WhereDragon_FindMyself);
	Info_AddChoice(DIA_Hokurn_WhereDragon,"Я мог бы купить у тебя сведения.",DIA_Hokurn_WhereDragon_Gold);
	if((Npc_HasItems(other,ItFo_Beer) >= 1) || (Npc_HasItems(other,ItFo_Booze) >= 1) || (Npc_HasItems(other,ItFo_Wine) >= 1) || (Npc_HasItems(other,ItFo_Addon_Rum) >= 1) || (Npc_HasItems(other,ItFo_Addon_Grog) >= 1))
	{
		Info_AddChoice(DIA_Hokurn_WhereDragon,"У меня есть еще одна бутылка.",DIA_Hokurn_WhereDragon_Booze);
	};
};

func void DIA_Hokurn_WhereDragon_FindMyself()
{
	AI_Output(other,self,"DIA_Hokurn_WhereDragon_FindMyself_15_00");	//Ничего, я сам их найду.
	AI_Output(self,other,"DIA_Hokurn_WhereDragon_FindMyself_01_01");	//Тебе лучше быть поосторожнее. Впереди тебя ждет много кровопролитных боев.
	Info_ClearChoices(DIA_Hokurn_WhereDragon);
};

func void DIA_Hokurn_WhereDragon_Gold()
{
	AI_Output(other,self,"DIA_Hokurn_WhereDragon_Gold_15_00");	//Я был бы не прочь заплатить тебе за эту информацию.
	AI_Output(self,other,"DIA_Hokurn_WhereDragon_Gold_01_01");	//Заплатить мне? Хорошо, я продам тебе эту информацию за двести золотых монет.
	Info_ClearChoices(DIA_Hokurn_WhereDragon);
	Info_AddChoice(DIA_Hokurn_WhereDragon,"Слишком много.",DIA_Hokurn_WhereDragon_TooMuch);
	if(Npc_HasItems(other,ItMi_Gold) >= 200)
	{
		Info_AddChoice(DIA_Hokurn_WhereDragon,"Согласен, здесь деньги.",DIA_Hokurn_WhereDragon_OK);
	};
};

func void DIA_Hokurn_WhereDragon_TooMuch()
{
	AI_Output(other,self,"DIA_Hokurn_WhereDragon_TooMuch_15_00");	//Это слишком много!
	AI_Output(self,other,"DIA_Hokurn_WhereDragon_TooMuch_01_01");	//Тогда забудь об этом.
	Info_ClearChoices(DIA_Hokurn_WhereDragon);
};

func void DIA_Hokurn_WhereDragon_OK()
{
	AI_Output(other,self,"DIA_Hokurn_WhereDragon_OK_15_00");	//Договорились. Вот твои деньги!
	B_GiveInvItems(other,self,ItMi_Gold,200);
	HokurnTellsDragon = TRUE;
	Info_ClearChoices(DIA_Hokurn_WhereDragon);
};

func void DIA_Hokurn_WhereDragon_Booze()
{
	AI_Output(other,self,"DIA_Hokurn_WhereDragon_Booze_15_00");	//У меня еще есть бутылка!
	AI_Output(self,other,"DIA_Hokurn_WhereDragon_Booze_01_01");	//За хорошую каплю я бы всех драконов на свете убил.
	AI_Output(self,other,"DIA_Hokurn_WhereDragon_Booze_01_02");	//Заметано. Давай сюда!
	b_hokurn_taking();
	AI_Output(self,other,"DIA_Hokurn_WhereDragon_Booze_01_03");	//Я оставлю его до худших времен.
	HokurnTellsDragon = TRUE;
	Info_ClearChoices(DIA_Hokurn_WhereDragon);
};


instance DIA_Hokurn_Dragon(C_Info)
{
	npc = DJG_712_Hokurn;
	nr = 5;
	condition = DIA_Hokurn_Dragon_Condition;
	information = DIA_Hokurn_Dragon_Info;
	permanent = FALSE;
	description = "Хорошо, теперь скажи, где все эти драконы?";
};


func int DIA_Hokurn_Dragon_Condition()
{
	if((HokurnTellsDragon == TRUE) && (KAPITELORCATC == FALSE) && (MIS_AllDragonsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hokurn_Dragon_Info()
{
	AI_Output(other,self,"DIA_Hokurn_Dragon_15_00");	//Хорошо, теперь скажи, где все эти драконы?
	AI_Output(self,other,"DIA_Hokurn_Dragon_01_01");	//Ну, если честно, я не могу сказать тебе ничего определенного, но я слышал, что всего должно быть четыре дракона.
	AI_Output(self,other,"DIA_Hokurn_Dragon_01_02");	//Прошлой ночью над самой высокой горой мы видели багровое свечение.
	AI_Output(self,other,"DIA_Hokurn_Dragon_01_03");	//Готов поклясться свой матерью, что если ты ищешь драконов, одного из них ты найдешь там.
};


instance DIA_Hokurn_AllDragonsDead(C_Info)
{
	npc = DJG_712_Hokurn;
	nr = 5;
	condition = DIA_Hokurn_AllDragonsDead_Condition;
	information = DIA_Hokurn_AllDragonsDead_Info;
	permanent = TRUE;
	description = "Я убил всех драконов.";
};


func int DIA_Hokurn_AllDragonsDead_Condition()
{
	if((MIS_AllDragonsDead == TRUE) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hokurn_AllDragonsDead_Info()
{
	AI_Output(other,self,"DIA_Hokurn_AllDragonsDead_15_00");	//Я убил всех драконов.
	AI_Output(self,other,"DIA_Hokurn_AllDragonsDead_01_01");	//Иди, рассказывай сказки кому-нибудь другому.
};


instance DIA_Hokurn_PICKPOCKET(C_Info)
{
	npc = DJG_712_Hokurn;
	nr = 900;
	condition = DIA_Hokurn_PICKPOCKET_Condition;
	information = DIA_Hokurn_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Hokurn_PICKPOCKET_Condition()
{
	return C_Beklauen(69,210);
};

func void DIA_Hokurn_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Hokurn_PICKPOCKET);
	Info_AddChoice(DIA_Hokurn_PICKPOCKET,Dialog_Back,DIA_Hokurn_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Hokurn_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Hokurn_PICKPOCKET_DoIt);
};

func void DIA_Hokurn_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Hokurn_PICKPOCKET);
};

func void DIA_Hokurn_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Hokurn_PICKPOCKET);
};


instance DIA_HOKURN_FUCKOFF(C_Info)
{
	npc = DJG_712_Hokurn;
	nr = 2;
	condition = dia_hokurn_fuckoff_condition;
	information = dia_hokurn_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_hokurn_fuckoff_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (DGJREFUSEPALADIN == TRUE))
	{
		return TRUE;
	};
};

func void dia_hokurn_fuckoff_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
};

//----------------------------------------------------------------------------

instance DIA_Hokurn_SLD_EXIT(C_Info)
{
	npc = SLD_849_Hokurn;
	nr = 999;
	condition = DIA_Hokurn_SLD_EXIT_Condition;
	information = DIA_Hokurn_SLD_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Hokurn_SLD_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Hokurn_SLD_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Hokurn_SLD_PICKPOCKET(C_Info)
{
	npc = SLD_849_Hokurn;
	nr = 900;
	condition = DIA_Hokurn_SLD_PICKPOCKET_Condition;
	information = DIA_Hokurn_SLD_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int DIA_Hokurn_SLD_PICKPOCKET_Condition()
{
	return C_Beklauen(69,210);
};

func void DIA_Hokurn_SLD_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Hokurn_SLD_PICKPOCKET);
	Info_AddChoice(DIA_Hokurn_SLD_PICKPOCKET,Dialog_Back,DIA_Hokurn_SLD_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Hokurn_SLD_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Hokurn_SLD_PICKPOCKET_DoIt);
};

func void DIA_Hokurn_SLD_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Hokurn_SLD_PICKPOCKET);
};

func void DIA_Hokurn_SLD_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Hokurn_SLD_PICKPOCKET);
};

instance DIA_Hokurn_NW_Hello(C_Info)
{
	npc = SLD_849_Hokurn;
	nr = 4;
	condition = DIA_Hokurn_NW_Hello_Condition;
	information = DIA_Hokurn_NW_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Hokurn_NW_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (KAPITELORCATC == FALSE) && (HokFirstMeet == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hokurn_NW_Hello_Info()
{
	AI_Output(self,other,"DIA_Hokurn_Hello_01_00");	//У тебя не найдется чего-нибудь выпить?
	AI_Output(other,self,"DIA_Hokurn_Hello_15_01");	//Полагаю, вода тебе не подойдет.
	AI_Output(self,other,"DIA_Hokurn_Hello_01_02");	//Нет, черт побери!!! Мне нужно что-нибудь алкогольное, чтобы я, наконец, мог избавиться от этой проклятой головной боли.
	AI_Output(self,other,"DIA_Hokurn_Hello_01_03");	//Когда мне долго не удается промочить горло, мой череп раскалывается и мне кажется, что он вот-вот взорвется.
	HokFirstMeet = TRUE;
	Info_ClearChoices(DIA_Hokurn_NW_Hello);
	Info_AddChoice(DIA_Hokurn_NW_Hello,"Я ничем не могу помочь тебе.",DIA_Hokurn_NW_Hello_No);

	if((Npc_HasItems(other,ItFo_Beer) >= 1) || (Npc_HasItems(other,ItFo_Addon_Rum) >= 1) || (Npc_HasItems(other,ItFo_Addon_Grog) >= 1) || (Npc_HasItems(other,ItFo_Booze) >= 1) || (Npc_HasItems(other,ItFo_Wine) >= 1))
	{
		Info_AddChoice(DIA_Hokurn_NW_Hello,"Вот, возьми это.",DIA_Hokurn_NW_Hello_Yes);
	};
};

func void DIA_Hokurn_NW_Hello_No()
{
	AI_Output(other,self,"DIA_Hokurn_Hello_No_15_00");	//Я ничем не могу помочь тебе.
	AI_Output(self,other,"DIA_Hokurn_Hello_No_01_01");	//Тогда проваливай!
	Info_ClearChoices(DIA_Hokurn_NW_Hello);
	Info_AddChoice(DIA_Hokurn_NW_Hello,Dialog_Ende,DIA_Hokurn_NW_Hello_END);
	Info_AddChoice(DIA_Hokurn_NW_Hello,"Еще одно...",DIA_Hokurn_NW_Hello_ASK1);
};

func void DIA_Hokurn_NW_Hello_ASK1()
{
	AI_Output(other,self,"DIA_Hokurn_Hello_ASK1_15_00");	//Еще одно...
	AI_Output(self,other,"DIA_Hokurn_Hello_ASK1_01_01");	//(ревет)...Ты что, не понял меня? УБИРАЙСЯ!!!
	Info_ClearChoices(DIA_Hokurn_NW_Hello);
	Info_AddChoice(DIA_Hokurn_NW_Hello,Dialog_Ende,DIA_Hokurn_NW_Hello_END);
	Info_AddChoice(DIA_Hokurn_NW_Hello,"Это важно.",DIA_Hokurn_NW_Hello_ASK2);
};

func void DIA_Hokurn_NW_Hello_ASK2()
{
	AI_Output(other,self,"DIA_Hokurn_Hello_ASK2_15_00");	//Это важно.
	AI_Output(self,other,"DIA_Hokurn_Hello_ASK2_01_01");	//(ревет)...Ты сам напросился!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Hokurn_NW_Hello_END()
{
	AI_StopProcessInfos(self);
};

func void B_Hokurn_NW_Sauf()
{
	AI_Output(self,other,"B_Hokurn_Sauf_01_00");	//(рыгает) Ох, какое блаженство!
	AI_Output(self,other,"B_Hokurn_Sauf_01_01");	//Теперь я опять могу размышлять здраво. Что я могу сделать для тебя?
};

func void b_hokurn_NW_drinking()
{
	if(Npc_HasItems(other,ItFo_Booze) >= 1)
	{
		B_GiveInvItems(other,self,ItFo_Booze,1);
		B_UseItem(self,ItFo_Booze);
	}
	else if(Npc_HasItems(other,ItFo_Wine) >= 1)
	{
		B_GiveInvItems(other,self,ItFo_Wine,1);
		B_UseItem(self,ItFo_Wine);
	}
	else if(Npc_HasItems(other,ItFo_Beer) >= 1)
	{
		B_GiveInvItems(other,self,ItFo_Beer,1);
		B_UseItem(self,ItFo_Beer);
	}
	else if(Npc_HasItems(other,ItFo_Addon_Rum) >= 1)
	{
		B_GiveInvItems(other,self,ItFo_Addon_Rum,1);
		B_UseItem(self,ItFo_Addon_Rum);
	}
	else if(Npc_HasItems(other,ItFo_Addon_Grog) >= 1)
	{
		B_GiveInvItems(other,self,ItFo_Addon_Grog,1);
		B_UseItem(self,ItFo_Addon_Grog);
	};
	HokurnLastDrink = Wld_GetDay();
	HokurnGetsDrink = TRUE;
};

func void b_hokurn_NW_taking()
{
	if(Npc_HasItems(other,ItFo_Booze) >= 1)
	{
		B_GiveInvItems(other,self,ItFo_Booze,1);
	}
	else if(Npc_HasItems(other,ItFo_Wine) >= 1)
	{
		B_GiveInvItems(other,self,ItFo_Wine,1);
	}
	else if(Npc_HasItems(other,ItFo_Beer) >= 1)
	{
		B_GiveInvItems(other,self,ItFo_Beer,1);
	}
	else if(Npc_HasItems(other,ItFo_Addon_Rum) >= 1)
	{
		B_GiveInvItems(other,self,ItFo_Addon_Rum,1);
	}
	else if(Npc_HasItems(other,ItFo_Addon_Grog) >= 1)
	{
		B_GiveInvItems(other,self,ItFo_Addon_Grog,1);
	};
};

func void DIA_Hokurn_NW_Hello_Yes()
{
	AI_Output(other,self,"DIA_Hokurn_Hello_Yes_15_00");	//Вот, возьми это.
	b_hokurn_drinking();
	B_Hokurn_Sauf();
	StartPashalQuest = TRUE;
	Info_ClearChoices(DIA_Hokurn_NW_Hello);
};


instance DIA_Hokurn_NW_Drink(C_Info)
{
	npc = SLD_849_Hokurn;
	nr = 5;
	condition = DIA_Hokurn_NW_Drink_Condition;
	information = DIA_Hokurn_NW_Drink_Info;
	permanent = TRUE;
	description = "Я тебе принес немного выпить.";
};


func int DIA_Hokurn_NW_Drink_Condition()
{
	if((KAPITELORCATC == FALSE) && (HokurnGetsDrink == FALSE) && ((Npc_HasItems(other,ItFo_Beer) >= 1) || (Npc_HasItems(other,ItFo_Addon_Rum) >= 1) || (Npc_HasItems(other,ItFo_Addon_Grog) >= 1) || (Npc_HasItems(other,ItFo_Booze) >= 1) || (Npc_HasItems(other,ItFo_Wine) >= 1)))
	{
		return TRUE;
	};
};

func void DIA_Hokurn_NW_Drink_Info()
{
	AI_Output(other,self,"DIA_Hokurn_Drink_15_00");	//Я тебе принес немного выпить.
	AI_Output(self,other,"DIA_Hokurn_Drink_01_01");	//Давай сюда!
	b_hokurn_NW_drinking();
	B_Hokurn_NW_Sauf();
	StartPashalQuest = TRUE;
};

//-----------------------пасхалка-----------------------------------------------

instance DIA_Hokurn_NW_PashalQuest(C_Info)
{
   npc = SLD_849_Hokurn;
   nr = 5;
   condition = DIA_Hokurn_NW_PashalQuest_Condition;
   information = DIA_Hokurn_NW_PashalQuest_Info;
   permanent = FALSE;
   description = "На этой ферме есть что-нибудь интересное?";
};

func int DIA_Hokurn_NW_PashalQuest_Condition()
{
   if((KAPITELORCATC == FALSE) && (Kapitel < 4) && (StartPashalQuest == TRUE))
   {
      return TRUE;
   };
};

func void DIA_Hokurn_NW_PashalQuest_Info()
{
   AI_Output(other,self,"DIA_Hokurn_NW_PashalQuest_01_00");   //На вашей ферме есть что-нибудь интересное?
   AI_Output(self,other,"DIA_Hokurn_NW_PashalQuest_01_01");   //Интересное? Парень, да ты явно не в себе, коли задаешь такие вопросы.
   AI_Output(self,other,"DIA_Hokurn_NW_PashalQuest_01_02");   //Оглянись, - и сам увидишь, что кругом одни тупые бараны да овцы.
   AI_Output(self,other,"DIA_Hokurn_NW_PashalQuest_01_03");   //Сия печальная картина, увы, не меняется день ото дня.
   AI_Output(self,other,"DIA_Hokurn_NW_PashalQuest_01_04");   //Поэтому ищи интересные вещи за пределами нашего свинарника. Здесь ты ничего не найдешь.
   AI_Output(other,self,"DIA_Hokurn_NW_PashalQuest_01_05");   //А ты, похоже, знаешь, где их искать?
   AI_Output(self,other,"DIA_Hokurn_NW_PashalQuest_01_06");   //(ехидно) Ну, как тебе сказать. Знать не знаю, но кое-что слышал.
   AI_Output(other,self,"DIA_Hokurn_NW_PashalQuest_01_07");   //Слышал что?
   AI_Output(self,other,"DIA_Hokurn_NW_PashalQuest_01_08");   //Ну...(замялся) Это довольно старая история. И я даже не знаю, правдива она или нет.
   AI_Output(other,self,"DIA_Hokurn_NW_PashalQuest_01_09");   //Я бы с удовольствием тебя послушал.
   AI_Output(self,other,"DIA_Hokurn_NW_PashalQuest_01_10");   //Эх! Ну да ладно, почему бы и нет.
   AI_Output(self,other,"DIA_Hokurn_NW_PashalQuest_01_11");   //В конце концов, ты угостил меня выпивкой, а я хороших дел не забываю.
   AI_Output(self,other,"DIA_Hokurn_NW_PashalQuest_01_12");   //Ну так вот... Дело было в то время, когда я сидел за Барьером в Долине Рудников.
   AI_Output(self,other,"DIA_Hokurn_NW_PashalQuest_01_13");   //Однажды в таверне Нового лагеря я услышал рассказ о некоем артефакте.
   AI_Output(self,other,"DIA_Hokurn_NW_PashalQuest_01_14");   //Какой-то чудак из Болотного лагеря, который принес нам очередную порцию травы, вещал о могуществе.
   AI_Output(self,other,"DIA_Hokurn_NW_PashalQuest_01_15");   //Он говорил о том, что есть предмет, который позволит владельцу обрести безмерную и безграничную власть над миром! Представляешь?
   AI_Output(other,self,"DIA_Hokurn_NW_PashalQuest_01_16");   //И ты ему поверил?
   AI_Output(self,other,"DIA_Hokurn_NW_PashalQuest_01_17");   //Ну, не то чтобы... Болотные братья - довольно странные ребята, от них чего угодно можно ожидать.
   AI_Output(self,other,"DIA_Hokurn_NW_PashalQuest_01_18");   //Кто знает, рассказ - чистая правда или бредни обкурившихся сектантов?
   AI_Output(self,other,"DIA_Hokurn_NW_PashalQuest_01_19");   //Я лишь одно могу с уверенностью сказать: слухи просто так не рождаются! Уж в этом ты мне поверь.
   AI_Output(other,self,"DIA_Hokurn_NW_PashalQuest_01_20");   //Да, необычная история. А как звали того парня?
   AI_Output(self,other,"DIA_Hokurn_NW_PashalQuest_01_21");   //Я не знаю его имени. Припоминаю только то, что он постоянно курил болотную траву. Целыми днями напролет!
   AI_Output(self,other,"DIA_Hokurn_NW_PashalQuest_01_22");   //А когда вконец обкуривался, начинал долбиться головой об стену. Как будто пытался проткнуть ее насквозь!
   AI_Output(self,other,"DIA_Hokurn_NW_PashalQuest_01_23");   //Да, забавный был парнишка.
   AI_Output(other,self,"DIA_Hokurn_NW_PashalQuest_01_24");   //А где он сейчас, ты не знаешь?
   AI_Output(self,other,"DIA_Hokurn_NW_PashalQuest_01_25");   //Понятия не имею. С тех пор он больше не появлялся в нашем лагере.
   AI_Output(other,self,"DIA_Hokurn_NW_PashalQuest_01_26");   //Ну ладно, спасибо за рассказ.
   MIS_PashalQuest = LOG_Running;
   Log_CreateTopic(TOPIC_PashalQuest,LOG_MISSION);
   Log_SetTopicStatus(TOPIC_PashalQuest,LOG_Running);
   B_LogEntry(TOPIC_PashalQuest,"Наемник Хокурн рассказал мне странную историю о некоем магическом артефакте, дарующем безграничную власть над всем миром! Он услышал ее в колонии от какого-то послушника Братства Спящего, торговавшего болотником в Новом лагере. Возможно, я смогу отыскать этого человека в новом лагере Братства в Хоринисе, чтобы подробнее разузнать об этом магическом предмете.");
   AI_StopProcessInfos(self);
   Wld_InsertNpc(SEK_4567_Unicorn,"NW_PSICAMP_UNICORN");
};

var int UNICORN_FLAG_01;
var int UNICORN_FLAG_02;
var int UNICORNTALK_YES;

instance DIA_SEK_4567_Unicorn_EXIT(C_Info)
{
   npc = SEK_4567_Unicorn;
   nr = 999;
   condition = DIA_SEK_4567_Unicorn_exit_condition;
   information = DIA_SEK_4567_Unicorn_exit_info;
   permanent = TRUE;
   description = Dialog_Ende;
};

func int DIA_SEK_4567_Unicorn_exit_condition()
{
   return TRUE;
};

func void DIA_SEK_4567_Unicorn_exit_info()
{
   AI_StopProcessInfos(self);
};


instance DIA_SEK_4567_Unicorn_NOTALK_SLEEPER(C_Info)
{
   npc = SEK_4567_Unicorn;
   nr = 1;
   condition = DIA_SEK_4567_Unicorn_notalk_sleeper_condition;
   information = DIA_SEK_4567_Unicorn_notalk_sleeper_info;
   permanent = FALSE;
   important = FALSE;
   description = "Да пребудет с тобой Спящий!";
};


func int DIA_SEK_4567_Unicorn_notalk_sleeper_condition()
{
   if(UNICORNTALK_YES == FALSE)
   {
      return TRUE;
   };
};

func void DIA_SEK_4567_Unicorn_notalk_sleeper_info()
{
   AI_Output(other,self,"DIA_SEK_4567_Unicorn_NoTalk_Sleeper_01_00");   //Да пребудет с тобой Спящий!
   AI_Output(self,other,"DIA_SEK_4567_Unicorn_NoTalk_Sleeper_01_01");   //(вздох)
   UNICORN_FLAG_01 = TRUE;
   AI_StopProcessInfos(self);
};

instance DIA_SEK_4567_Unicorn_NOTALK_IMP(C_Info)
{
   npc = SEK_4567_Unicorn;
   nr = 1;
   condition = DIA_SEK_4567_Unicorn_notalk_imp_condition;
   information = DIA_SEK_4567_Unicorn_notalk_imp_info;
   permanent = TRUE;
   important = FALSE;
   description = "Все в порядке, приятель?";
};

func int DIA_SEK_4567_Unicorn_notalk_imp_condition()
{
   if(UNICORNTALK_YES == FALSE)
   {
      return TRUE;
   };
};

func void DIA_SEK_4567_Unicorn_notalk_imp_info()
{
   AI_Output(other,self,"DIA_SEK_4567_Unicorn_NoTalk_Imp_01_00");   //Все в порядке, приятель?
   AI_Output(self,other,"DIA_SEK_4567_Unicorn_NoTalk_Sleeper_01_01");   //(вздох)
   UNICORN_FLAG_02 = TRUE;
   AI_StopProcessInfos(self);
};

instance DIA_SEK_4567_Unicorn_HasSmoke(C_Info)
{
   npc = SEK_4567_Unicorn;
   nr = 1;
   condition = DIA_SEK_4567_Unicorn_HasSmoke_condition;
   information = DIA_SEK_4567_Unicorn_HasSmoke_info;
   permanent = FALSE;
   description = "У меня завалялись косяки из болотной травы.";
};

func int DIA_SEK_4567_Unicorn_HasSmoke_condition()
{
   if((UNICORNTALK_YES == FALSE) && (UNICORN_FLAG_01 == TRUE) && (UNICORN_FLAG_02 == TRUE) && (Npc_HasItems(other,ItMi_Joint) >= 1))
   {
      return TRUE;
   };
};

func void DIA_SEK_4567_Unicorn_HasSmoke_info()
{
   AI_Output(other,self,"DIA_SEK_4567_Unicorn_HasSmoke_01_00");   //У меня завалялись косяки из болотной травы. Тебя они интересуют?
   AI_PlayAni(self,"T_SEARCH");
   AI_Output(self,other,"DIA_SEK_4567_Unicorn_HasSmoke_01_01");   //(покашливая) С этого и надо было начинать! Много их у тебя?
   AI_Output(other,self,"DIA_SEK_4567_Unicorn_HasSmoke_01_02");   //Ну так, не очень.
   AI_Output(self,other,"DIA_SEK_4567_Unicorn_HasSmoke_01_03");   //Ладно, без разницы... Давай их сюда. А то в последнее время их здесь стало трудно достать.
   B_GiveInvItems(other,self,ItMi_Joint,Npc_HasItems(other,ItMi_Joint));
   AI_Output(other,self,"DIA_SEK_4567_Unicorn_HasSmoke_01_04");   //Разве Талас не выдает тебе новую порцию каждый день?
   AI_Output(self,other,"DIA_SEK_4567_Unicorn_HasSmoke_01_05");   //Выдает, но, к сожалению, мне ее мало. Я постоянно хочу курить.
   AI_Output(self,other,"DIA_SEK_4567_Unicorn_HasSmoke_01_06");   //Если я не курю болотник, у меня начинает жутко болеть голова. Хоть об стенку бейся!
   AI_Output(self,other,"DIA_SEK_4567_Unicorn_HasSmoke_01_07");   //Раньше и такое помогало, но сейчас все без толку... Все равно раскалывается.
   AI_Output(self,other,"DIA_SEK_4567_Unicorn_HasSmoke_01_08");   //Поэтому мне нужно очень много косяков из болотной травы! Понимаешь?
   UNICORNTALK_YES = TRUE;
};

instance DIA_SEK_4567_Unicorn_HeyYou(C_Info)
{
   npc = SEK_4567_Unicorn;
   nr = 1;
   condition = DIA_SEK_4567_Unicorn_HeyYou_condition;
   information = DIA_SEK_4567_Unicorn_HeyYou_info;
   permanent = FALSE;
   description = "Эй, а ты часом не тот парень...";
};

func int DIA_SEK_4567_Unicorn_HeyYou_condition()
{
   if((MIS_PashalQuest == LOG_Running) && (UNICORNTALK_YES == TRUE))
   {
      return TRUE;
   };
};

func void DIA_SEK_4567_Unicorn_HeyYou_info()
{
   B_GivePlayerXP(200);
   AI_Output(other,self,"DIA_SEK_4567_Unicorn_HeyYou_01_00");   //Эй, ты часом не тот парень, что толкал болотник в Новом лагере?
   AI_Output(self,other,"DIA_SEK_4567_Unicorn_HeyYou_01_01");   //Ну да. Было дело. Однако я пробыл там совсем недолго.
   AI_Output(other,self,"DIA_SEK_4567_Unicorn_HeyYou_01_02");   //Почему?
   AI_Output(self,other,"DIA_SEK_4567_Unicorn_HeyYou_01_03");   //(виновато) Ну, я скурил весь болотник, который вручили мне на продажу.
   AI_Output(self,other,"DIA_SEK_4567_Unicorn_HeyYou_01_04");   //Поэтому меня быстро сменили Идолы Исидро и Каган. А меня отправили обратно в наш лагерь.
   AI_Output(other,self,"DIA_SEK_4567_Unicorn_HeyYou_01_05");   //Ладно, не суть важно. Меня интересует другой вопрос.
   AI_Output(other,self,"DIA_SEK_4567_Unicorn_HeyYou_01_06");   //Кое-кто помнит, что ты рассказывал о странном магическом артефакте.
   AI_Output(other,self,"DIA_SEK_4567_Unicorn_HeyYou_01_07");   //Якобы с его помощью можно управлять чуть ли не всем миром!
   AI_Output(self,other,"DIA_SEK_4567_Unicorn_HeyYou_01_08");   //Эммм...(растерянно) Правда?! Ну, возможно, что-то такое и было... Чего не сделаешь после хорошей порции болотника.
   AI_Output(other,self,"DIA_SEK_4567_Unicorn_HeyYou_01_09");   //Ты что-нибудь помнишь об этом?
   AI_Output(self,other,"DIA_SEK_4567_Unicorn_HeyYou_01_10");   //Почти ничего. Припоминаю только, что ту историю я и сам случайно услышал.
   AI_Output(other,self,"DIA_SEK_4567_Unicorn_HeyYou_01_11");   //Где?
   AI_Output(self,other,"DIA_SEK_4567_Unicorn_HeyYou_01_12");   //В Старом лагере. Как-то раз, принеся очередную порцию болотника, я случайно стал свидетелем разговора двух стражников.
   AI_Output(self,other,"DIA_SEK_4567_Unicorn_HeyYou_01_13");   //Один из них рассказывал другому о том странном предмете.
   AI_Output(self,other,"DIA_SEK_4567_Unicorn_HeyYou_01_14");   //Потом они увидели меня и отошли дальше. Вот, собственно, и все.
   AI_Output(other,self,"DIA_SEK_4567_Unicorn_HeyYou_01_15");   //А ты не помнишь, как звали тех стражников?
   AI_Output(self,other,"DIA_SEK_4567_Unicorn_HeyYou_01_16");   //Их имен я не знаю. Помню только, что у одного из них были седые волосы.
   AI_Output(self,other,"DIA_SEK_4567_Unicorn_HeyYou_01_17");   //А так, это все, что мне известно.
   B_LogEntry(TOPIC_PashalQuest,"Я нашел парня, который рассказывал эту историю в Новом лагере. Мне он толком ничего не сказал, кроме того, что сам когда-то подслушал эту историю в разговоре двух стражников Старого лагеря. Если кто-то и знает об этом артефакте больше, то только они. И где мне теперь искать этих людей, ума не приложу...");
   PashalQuestGuardStep = TRUE;
};

instance DIA_BDT_4568_KINJARTS_EXIT(C_Info)
{
   npc = BDT_4568_KINJARTS;
   nr = 999;
   condition = DIA_BDT_4568_KINJARTS_exit_condition;
   information = DIA_BDT_4568_KINJARTS_exit_info;
   permanent = TRUE;
   description = Dialog_Ende;
};

func int DIA_BDT_4568_KINJARTS_exit_condition()
{
   return TRUE;
};

func void DIA_BDT_4568_KINJARTS_exit_info()
{
   AI_StopProcessInfos(self);
};

instance DIA_BDT_4568_KINJARTS_HELLO(C_Info)
{
   npc = BDT_4568_KINJARTS;
   nr = 1;
   condition = DIA_BDT_4568_KINJARTS_HELLO_condition;
   information = DIA_BDT_4568_KINJARTS_HELLO_info;
   permanent = FALSE;
   description = "Привет. Как дела?";
};

func int DIA_BDT_4568_KINJARTS_HELLO_condition()
{
   return TRUE;
};

func void DIA_BDT_4568_KINJARTS_HELLO_info()
{
   AI_Output(other,self,"DIA_BDT_4568_KINJARTS_HELLO_01_00");   //Привет. Как дела?
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_HELLO_01_01");   //(ухмыляясь) Кто тут у нас приблудился?
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_HELLO_01_02");   //Хотя не говори ничего! Дай догадаюсь... Небось очередное мясо для забоя в золотой шахте?
   AI_Output(other,self,"DIA_BDT_4568_KINJARTS_HELLO_01_03");   //Ты ошибаешься! Я здесь по другой причине.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_HELLO_01_04");   //Не старайся обмануть меня, мальчик!
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_HELLO_01_05");   //В своей жизни я повидал множество щенков, вроде тебя, которые рассказывали всем о важной миссии. Особенно в Старом лагере!
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_HELLO_01_06");   //Поначалу они выказывали себя бывалыми героями, способными свернуть горы! Если не сказать больше...
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_HELLO_01_07");   //Но всех их вылечила работа в шахте! Пару лет с киркой в руках выбивают дурь и браваду из молодых горячих голов.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_HELLO_01_08");   //И из тебя выбьют...
};

var int KinJartsTellUs;
var int KinJartsWannaOre;

instance DIA_BDT_4568_KINJARTS_Quest(C_Info)
{
   npc = BDT_4568_KINJARTS;
   nr = 1;
   condition = DIA_BDT_4568_KINJARTS_Quest_condition;
   information = DIA_BDT_4568_KINJARTS_Quest_info;
   permanent = FALSE;
   description = "Я что-то не припоминаю нашу встречу в Старом лагере.";
};

func int DIA_BDT_4568_KINJARTS_Quest_condition()
{
   if(Npc_KnowsInfo(other,DIA_BDT_4568_KINJARTS_HELLO) == TRUE)
   {
      return TRUE;
   };
};

func void DIA_BDT_4568_KINJARTS_Quest_info()
{
   AI_Output(other,self,"DIA_BDT_4568_KINJARTS_Quest_01_00");   //Я что-то не припоминаю нашу встречу в Старом лагере.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_01_01");   //(ухмыляясь) Намекаешь на то, что ты тоже побывал в колонии?
   AI_Output(other,self,"DIA_BDT_4568_KINJARTS_Quest_01_02");   //Именно так. Но тебя я там не видел.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_01_03");   //Ну, это и неудивительно. Поскольку большую часть времени я проводил вне лагеря, сопровождая грузы, прибывшие из-за барьера.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_01_04");   //Возможно, именно поэтому наши дороги никогда и не пересекались.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_01_05");   //Вот если бы ты спросил знающих парней про старину Кинжартса, то тебе бы тогда рассказали, кто я такой!
   AI_Output(other,self,"DIA_BDT_4568_KINJARTS_Quest_01_06");   //Правда? Может, тогда сам расскажешь?
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_01_07");   //(ухмыляясь) Ну, если тебе так хочется послушать о тех временах, то ты должен знать, что за все приходится платить.
   AI_Output(other,self,"DIA_BDT_4568_KINJARTS_Quest_01_08"); //Рудой, как обычно?
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_01_09"); //А ты догадлив! Но не волнуйся, я не буду с тебя драть втридорога, как это делают местные торговцы.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_01_10"); //Так что, пожалуй, трех кусков руды мне вполне хватит.
   Info_ClearChoices(DIA_BDT_4568_KINJARTS_Quest);
   Info_AddChoice(DIA_BDT_4568_KINJARTS_Quest,"Я подумаю над твоим предложением.",DIA_BDT_4568_KINJARTS_Quest_Back);

   if(Npc_HasItems(other,ItMi_Nugget) >= 3)
   {
      Info_AddChoice(DIA_BDT_4568_KINJARTS_Quest,"(отдать три куска магической руды)",DIA_BDT_4568_KINJARTS_Quest_MagicOre);
   };
   if((Npc_HasItems(other,ITMI_SNUGGET) >= 3) && (RhetorikSkillValue[1] >= 35))
   {
      Info_AddChoice(DIA_BDT_4568_KINJARTS_Quest,"(отдать три куска железной руды)",DIA_BDT_4568_KINJARTS_Quest_IronOre);
   };
};

func void DIA_BDT_4568_KINJARTS_Quest_Back()
{
   AI_Output(other,self,"DIA_BDT_4568_KINJARTS_Quest_Back_01_01");   //Я подумаю над твоим предложением.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_Back_01_02");   //Только недолго! А то вдруг я передумаю.
   KinJartsWannaOre = TRUE;
   Info_ClearChoices(DIA_BDT_4568_KINJARTS_Quest);
};

func void DIA_BDT_4568_KINJARTS_Quest_MagicOre()
{
   AI_Output(other,self,"DIA_BDT_4568_KINJARTS_Quest_MagicOre_01_01");   //Вот твои три куска руды.
   B_GiveInvItems(other,self,ItMi_Nugget,3);
   Npc_RemoveInvItems(self,ItMi_Nugget,3);
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_MagicOre_01_02");   //Хорошо. Тогда я, пожалуй, продолжу рассказ.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_MagicOre_01_03");   //В колонию я попал в то время, когда каторжане еще видели над своей головой чистое небо.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_MagicOre_01_04");   //Вначале пришлось непросто. Я на своей шкуре прочувствовал всю тяжесть работы в шахте.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_MagicOre_01_05");   //Однако, после появления Барьера и захвата власти Гомезом, он сделал меня одним из стражников и поставил заботиться о новичках, прибывающих в колонию.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_MagicOre_01_06");   //Позже меня сменил Буллит. А нужные знакомства у других баронов позволили мне занять место главного поставщика и сопровождающего грузов.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_MagicOre_01_07");   //Это была очень опасная работа, поскольку на наши обозы постоянно нападали воры из Нового лагеря.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_MagicOre_01_08");   //В одной из таких заварушек я даже было чуть не погиб.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_MagicOre_01_09");   //Но это все в прошлом. Теперь я один из телохранителей Торуса.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_MagicOre_01_10");   //И новое место меня вполне устраивает!
   KinJartsTellUs = TRUE;
   Info_ClearChoices(DIA_BDT_4568_KINJARTS_Quest);
};


func void DIA_BDT_4568_KINJARTS_Quest_IronOre()
{
   AI_Output(other,self,"DIA_BDT_4568_KINJARTS_Quest_IronOre_01_01");   //Вот твои три куска руды.
   B_GiveInvItems(other,self,ItMi_SNugget,3);
   Npc_RemoveInvItems(self,ItMi_SNugget,3);
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_IronOre_01_02");   //Что ты мне здесь суешь?!
   AI_Output(other,self,"DIA_BDT_4568_KINJARTS_Quest_IronOre_01_03");   //Руду. Ты ведь ее хотел.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_IronOre_01_04");   //Я имел в виду магическую руду, а не обычную!
   AI_Output(other,self,"DIA_BDT_4568_KINJARTS_Quest_IronOre_01_05");   //Но ты об этом ни разу не обмолвился. Так что бери то, что дают.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_IronOre_01_06");   //М-да... Похоже, обвел ты старину Кинжартса вокруг пальца. Не ожидал!
   AI_Output(other,self,"DIA_BDT_4568_KINJARTS_Quest_IronOre_01_07");   //Так теперь ты расскажешь мне о себе и о том, чем занимался в Старом лагере?
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_IronOre_01_08");   //(ухмыляясь) Конечно. Уговор есть уговор! Так вот...
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_IronOre_01_09");   //В колонию я попал в то время, когда каторжане еще видели над своей головой чистое небо.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_IronOre_01_10");   //Вначале пришлось непросто. Я на своей шкуре прочувствовал всю тяжесть работы в шахте.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_IronOre_01_11");   //Однако, после появления Барьера и захвата власти Гомезом, он сделал меня одним из стражников и поставил заботиться о новичках, прибывающих в колонию.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_IronOre_01_12");   //Позже меня сменил Буллит. А нужные знакомства у других баронов позволили мне занять место главного поставщика и сопровождающего грузов.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_IronOre_01_13");   //Это была очень опасная работа, поскольку на наши обозы постоянно нападали воры из Нового лагеря.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_IronOre_01_14");   //В одной из таких заварушек я даже было чуть не погиб.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_IronOre_01_15");   //Но это все в прошлом. Теперь я один из телохранителей Торуса.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_IronOre_01_16");   //И новое место меня вполне устраивает!
   KinJartsTellUs = TRUE;
   RhetorikSkillValue[1] += 1;
   AI_Print("Риторика + 1");
   Info_ClearChoices(DIA_BDT_4568_KINJARTS_Quest);
};

instance DIA_BDT_4568_KINJARTS_QuestAgain(C_Info)
{
   npc = BDT_4568_KINJARTS;
   nr = 1;
   condition = DIA_BDT_4568_KINJARTS_QuestAgain_condition;
   information = DIA_BDT_4568_KINJARTS_QuestAgain_info;
   permanent = TRUE;
   description = "Я принес тебе руду.";
};

func int DIA_BDT_4568_KINJARTS_QuestAgain_condition()
{
   if((KinJartsWannaOre == TRUE) && (KinJartsTellUs == FALSE))
   {
      return TRUE;
   };
};

func void DIA_BDT_4568_KINJARTS_QuestAgain_info()
{
   AI_Output(other,self,"DIA_BDT_4568_KINJARTS_QuestAgain_01_00");   //Я принес тебе руду.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_QuestAgain_01_01");   //Хорошо. Давай ее сюда!
   Info_ClearChoices(DIA_BDT_4568_KINJARTS_QuestAgain);
   Info_AddChoice(DIA_BDT_4568_KINJARTS_QuestAgain,"Я еще подумаю на этим.",DIA_BDT_4568_KINJARTS_QuestAgain_Back);

   if(Npc_HasItems(other,ItMi_Nugget) >= 3)
   {
      Info_AddChoice(DIA_BDT_4568_KINJARTS_QuestAgain,"Отдать три куска магической руды.",DIA_BDT_4568_KINJARTS_QuestAgain_MagicOre);
   };
   if((Npc_HasItems(other,ITMI_SNUGGET) >= 3) && (RhetorikSkillValue[1] >= 35))
   {
      Info_AddChoice(DIA_BDT_4568_KINJARTS_QuestAgain,"Отдать три куска железной руды.",DIA_BDT_4568_KINJARTS_QuestAgain_IronOre);
   };
};

func void DIA_BDT_4568_KINJARTS_QuestAgain_Back()
{
   AI_Output(other,self,"DIA_BDT_4568_KINJARTS_QuestAgain_Back_01_01");   //Я еще подумаю на этим.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_QuestAgain_Back_01_02");   //Только недолго! А то вдруг я передумаю.
   Info_ClearChoices(DIA_BDT_4568_KINJARTS_QuestAgain);
};

func void DIA_BDT_4568_KINJARTS_QuestAgain_MagicOre()
{
   AI_Output(other,self,"DIA_BDT_4568_KINJARTS_Quest_MagicOre_01_01");   //Вот твои три куска руды.
   B_GiveInvItems(other,self,ItMi_Nugget,3);
   Npc_RemoveInvItems(self,ItMi_Nugget,3);
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_MagicOre_01_02");   //Хорошо. Тогда я, пожалуй, продолжу рассказ.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_MagicOre_01_03");   //В колонию я попал в то время, когда каторжане еще видели над своей головой чистое небо.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_MagicOre_01_04");   //Вначале пришлось непросто. Я на своей шкуре прочувствовал всю тяжесть работы в шахте.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_MagicOre_01_05");   //Однако, после появления Барьера и захвата власти Гомезом, он сделал меня одним из стражников и поставил заботиться о новичках, прибывающих в колонию.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_MagicOre_01_06");   //Позже меня сменил Буллит. А нужные знакомства у других баронов позволили мне занять место главного поставщика и сопровождающего грузов.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_MagicOre_01_07");   //Это была очень опасная работа, поскольку на наши обозы постоянно нападали воры из Нового лагеря.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_MagicOre_01_08");   //В одной из таких заварушек я даже было чуть не погиб.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_MagicOre_01_09");   //Но это все в прошлом. Теперь я один из телохранителей Торуса.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_MagicOre_01_10");   //И новое место меня вполне устраивает!
   KinJartsTellUs = TRUE;
   Info_ClearChoices(DIA_BDT_4568_KINJARTS_QuestAgain);
};

func void DIA_BDT_4568_KINJARTS_QuestAgain_IronOre()
{
   AI_Output(other,self,"DIA_BDT_4568_KINJARTS_Quest_IronOre_01_01");   //Вот твои три куска руды.
   B_GiveInvItems(other,self,ItMi_SNugget,3);
   Npc_RemoveInvItems(self,ItMi_SNugget,3);
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_IronOre_01_02");   //Что ты мне здесь суешь?!
   AI_Output(other,self,"DIA_BDT_4568_KINJARTS_Quest_IronOre_01_03");   //Руду. Ты ведь ее хотел.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_IronOre_01_04");   //Я имел в виду магическую руду, а не обычную!
   AI_Output(other,self,"DIA_BDT_4568_KINJARTS_Quest_IronOre_01_05");   //Но ты об этом ни разу не обмолвился. Так что бери то, что дают!
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_IronOre_01_06");   //Мда... Похоже, обвел ты старину Кинжартса вокруг пальца. Не ожидал!
   AI_Output(other,self,"DIA_BDT_4568_KINJARTS_Quest_IronOre_01_07");   //Так теперь ты расскажешь мне о себе и о том, чем занимался в Старом лагере?
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_IronOre_01_08");   //(ухмыляясь) Конечно. Уговор есть уговор! Так вот...
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_IronOre_01_09");   //В колонию я попал в то время, когда каторжане еще видели над своей головой чистое небо.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_IronOre_01_10");   //Вначале пришлось непросто. Я на своей шкуре прочувствовал всю тяжесть работы в шахте.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_IronOre_01_12");   //Однако, после появления Барьера и захвата власти Гомезом, он сделал меня одним из стражников и поставил заботиться о новичках, прибывающих в колонию.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_IronOre_01_13");   //Позже меня сменил Буллит. А нужные знакомства у других баронов позволили мне занять место главного поставщика и сопровождающего грузов.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_IronOre_01_14");   //Это была очень опасная работа, поскольку на наши обозы постоянно нападали воры из Нового лагеря.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_IronOre_01_15");   //В одной из таких заварушек я даже было чуть не погиб.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_IronOre_01_16");   //Но это все в прошлом. Теперь я один из телохранителей Торуса.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_IronOre_01_17");   //И новое место меня вполне устраивает!
   KinJartsTellUs = TRUE;
   RhetorikSkillValue[1] += 1;
   AI_Print("Риторика + 1");
   Info_ClearChoices(DIA_BDT_4568_KINJARTS_QuestAgain);
};

instance DIA_BDT_4568_KINJARTS_QuestDone(C_Info)
{
   npc = BDT_4568_KINJARTS;
   nr = 1;
   condition = DIA_BDT_4568_KINJARTS_QuestDone_condition;
   information = DIA_BDT_4568_KINJARTS_QuestDone_info;
   permanent = FALSE;
   description = "Выходит, что ты очень много знаешь про Старый лагерь.";
};

func int DIA_BDT_4568_KINJARTS_QuestDone_condition()
{
   if((MIS_PashalQuest == LOG_Running) && (KinJartsTellUs == TRUE))
   {
      return TRUE;
   };
};

func void DIA_BDT_4568_KINJARTS_QuestDone_info()
{
   B_GivePlayerXP(200);
   AI_Output(other,self,"DIA_BDT_4568_KINJARTS_QuestDone_01_00");   //Выходит, что ты очень много знаешь про Старый лагерь.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_QuestDone_01_01");   //Больше, чем кто-либо! А почему ты спросил?
   AI_Output(other,self,"DIA_BDT_4568_KINJARTS_QuestDone_01_02");   //Просто у меня есть один очень щекотливый вопрос.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_QuestDone_01_03");   //Хммм. Тогда можешь задать его мне, если хочешь.
   AI_Output(other,self,"DIA_BDT_4568_KINJARTS_QuestDone_01_04");   //Я ищу одного стражника, который в свое время пустил слух о некоем магическом артефакте.
   AI_Output(other,self,"DIA_BDT_4568_KINJARTS_QuestDone_01_05");   //Якобы этот могущественный предмет способен даже влиять на судьбу этого мира.
   AI_PlayAni(self,"T_SEARCH");
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_QuestDone_01_06");   //Очень интересно. Тогда позволь мне задать тебе встречный вопрос - откуда тебе это известно?
   AI_Output(other,self,"DIA_BDT_4568_KINJARTS_QuestDone_01_07");   //Об этом мне рассказал один из братьев болотного лагеря.
   AI_Output(other,self,"DIA_BDT_4568_KINJARTS_QuestDone_01_08");   //Он как-то подслушал разговор двух стражников, которые говорили об этом артефакте.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_QuestDone_01_09");   //(задумчиво) Ну да, такое вполне возможно.
   AI_Output(other,self,"DIA_BDT_4568_KINJARTS_QuestDone_01_10");   //Что ты хочешь этим сказать?
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_QuestDone_01_11");   //Я хочу сказать то, что, похоже, с этим вопросом ты обратился по адресу.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_QuestDone_01_12");   //Поскольку тот стражник, которого ты ищешь, - я!
   AI_Output(other,self,"DIA_BDT_4568_KINJARTS_QuestDone_01_13");   //Да ну! Правда?
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_QuestDone_01_14");   //Разве я похож на вруна? Или, может быть, произвожу подобное впечатление?
   AI_Output(other,self,"DIA_BDT_4568_KINJARTS_QuestDone_01_15");   //Я бы так не сказал.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_QuestDone_01_16");   //Тогда поверь мне, сынок. Все это чистая правда!
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_QuestDone_01_17");   //А тот укурок, видимо, подслушал мой разговор с моим приятелем Скорпио, когда я рассказывал ему эту историю.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_QuestDone_01_18");   //Тогда Скорпио сказал, что это полная чушь и посоветовал мне не забивать себе этим голову.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_QuestDone_01_19");   //Но, по всей видимости, не все так посчитали.
   AI_Output(other,self,"DIA_BDT_4568_KINJARTS_QuestDone_01_20");   //Значит, артефакт на самом деле существует?
   AI_PlayAni(self,"T_SEARCH");
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_QuestDone_01_21");   //Послушай меня, приятель. Я не говорил, что он существует.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_QuestDone_01_22");   //Однако о нем в свое время упоминали маги Огня, а к их словам, я полагаю, все-таки стоит прислушаться.
   AI_Output(other,self,"DIA_BDT_4568_KINJARTS_QuestDone_01_23");   //Но все маги Огня были убиты по приказу Гомеза. Как же теперь быть?
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_QuestDone_01_24");   //Я это знаю. Но, насколько мне известно, кое-кому из них все-таки удалось выжить.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_QuestDone_01_25");   //Кажется, этого мага звали Милтен! Возможно, что тебе стоит найти его и поговорить уже с ним об этом артефакте.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_QuestDone_01_26");   //Мне же тебе больше нечего сказать.
   AI_Output(other,self,"DIA_BDT_4568_KINJARTS_QuestDone_01_27");   //Я тебя понял.
   B_LogEntry(TOPIC_PashalQuest,"Кинжартс оказался одним из тех стражников, кто знал о той истории с артефактом. По его словам, подтвердить его существование могут только маги Огня, жившие в Старом лагере. А единственным магом, избежавшим расправы Гомеза, был Милтен.");
   PashalQuestMageStep = TRUE;
};

instance DIA_BDT_4568_KINJARTS_Perm(C_Info)
{
   npc = BDT_4568_KINJARTS;
   nr = 1;
   condition = DIA_BDT_4568_KINJARTS_Perm_condition;
   information = DIA_BDT_4568_KINJARTS_Perm_info;
   permanent = TRUE;
   description = "Как обстановка?";
};

func int DIA_BDT_4568_KINJARTS_Perm_condition()
{
   if(Npc_KnowsInfo(other,DIA_BDT_4568_KINJARTS_QuestDone) == TRUE)
   {
      return TRUE;
   };
};

func void DIA_BDT_4568_KINJARTS_Perm_info()
{
   AI_Output(other,self,"DIA_BDT_4568_KINJARTS_Perm_01_00");   //Как обстановка?
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Perm_01_01");   //Пока все тихо. Надеюсь, так все и останется.
};

instance DIA_KDF_4569_AlexOne_EXIT(C_Info)
{
   npc = KDF_4569_AlexOne;
   nr = 999;
   condition = DIA_KDF_4569_AlexOne_exit_condition;
   information = DIA_KDF_4569_AlexOne_exit_info;
   permanent = TRUE;
   description = Dialog_Ende;
};

func int DIA_KDF_4569_AlexOne_exit_condition()
{
   return TRUE;
};

func void DIA_KDF_4569_AlexOne_exit_info()
{
   AI_StopProcessInfos(self);
};

instance DIA_KDF_4569_AlexOne_HELLO(C_Info)
{
   npc = KDF_4569_AlexOne;
   nr = 1;
   condition = DIA_KDF_4569_AlexOne_HELLO_condition;
   information = DIA_KDF_4569_AlexOne_HELLO_info;
   permanent = FALSE;
   important = TRUE;
};

func int DIA_KDF_4569_AlexOne_HELLO_condition()
{
   return TRUE;
};

func void DIA_KDF_4569_AlexOne_HELLO_info()
{
   AI_Output(self,other,"DIA_KDF_4569_AlexOne_HELLO_01_00");   //Эй! Ты что здесь делаешь?
   AI_Output(other,self,"DIA_KDF_4569_AlexOne_HELLO_01_01");   //Я хотел задать тебе тот же вопрос.
   AI_Output(self,other,"DIA_KDF_4569_AlexOne_HELLO_01_02");   //(пренебрежительно) Мои дела тебя не касаются.
   AI_Output(self,other,"DIA_KDF_4569_AlexOne_HELLO_01_03");   //Они слишком важные, чтобы я стал рассказывать о них первому встречному!
};

instance DIA_KDF_4569_AlexOne_WhoYou(C_Info)
{
   npc = KDF_4569_AlexOne;
   nr = 1;
   condition = DIA_KDF_4569_AlexOne_WhoYou_condition;
   information = DIA_KDF_4569_AlexOne_WhoYou_info;
   permanent = FALSE;
   description = "Ты - маг Огня?";
};

func int DIA_KDF_4569_AlexOne_WhoYou_condition()
{
   if(Npc_KnowsInfo(other,DIA_KDF_4569_AlexOne_HELLO) == TRUE)
   {
      return TRUE;
   };
};

func void DIA_KDF_4569_AlexOne_WhoYou_info()
{
   AI_Output(other,self,"DIA_KDF_4569_AlexOne_WhoYou_01_00");   //Ты - маг Огня?
   AI_Output(self,other,"DIA_KDF_4569_AlexOne_WhoYou_01_01");   //Как видишь. А что, тебя это удивляет?
   AI_Output(other,self,"DIA_KDF_4569_AlexOne_WhoYou_01_02");   //Не припомню, чтобы встречал тебя в монастыре Хориниса.
   AI_Output(self,other,"DIA_KDF_4569_AlexOne_WhoYou_01_03");   //Меня приняли в Круг Огня здесь, в колонии. А про монастырь я ничего не знаю.
   AI_Output(other,self,"DIA_KDF_4569_AlexOne_WhoYou_01_04");   //Интересно! И кто же принял тебя в Круг?
   AI_Output(self,other,"DIA_KDF_4569_AlexOne_WhoYou_01_05");   //(важно) Сам мастер Корристо! И именно по его поручению я сейчас здесь.
   AI_Output(other,self,"DIA_KDF_4569_AlexOne_WhoYou_01_06");   //Но Корристо и другие маги Огня уже давно мертвы! Убиты по приказу Гомеза.
   AI_Output(self,other,"DIA_KDF_4569_AlexOne_WhoYou_01_07");   //Что ты мелешь?! Как такое может быть? Ты что, с ума сошел?
   AI_Output(other,self,"DIA_KDF_4569_AlexOne_WhoYou_01_08");   //Так ты ничего не знаешь?
   AI_Output(self,other,"DIA_KDF_4569_AlexOne_WhoYou_01_09");   //А что я должен знать?!
   AI_Output(other,self,"DIA_KDF_4569_AlexOne_WhoYou_01_10");   //Когда в Старой шахте произошел завал, Гомез пришел в ярость и решил напасть на Новый лагерь.
   AI_Output(other,self,"DIA_KDF_4569_AlexOne_WhoYou_01_11");   //Маги Огня были против этой затеи, и он просто приказал их убить.
   AI_Output(self,other,"DIA_KDF_4569_AlexOne_WhoYou_01_12");   //О Иннос... Неужели это правда?
   AI_Output(other,self,"DIA_KDF_4569_AlexOne_WhoYou_01_13");   //Можешь не сомневаться. А сейчас в замке Старого лагеря расположились паладины, после чего его осадили орки.
   AI_Output(self,other,"DIA_KDF_4569_AlexOne_WhoYou_01_14");   //Как такое возможно?! Хотя я не был в Старом лагере уже несколько лет.
   AI_Output(self,other,"DIA_KDF_4569_AlexOne_WhoYou_01_15");   //Там действительно многое могло поменяться! Но то, что я услышал от тебя, разбивает мне сердце.
   AI_Output(other,self,"DIA_KDF_4569_AlexOne_WhoYou_01_16");   //Держись, приятель! Это не самое худшее, что случилось за последние дни.
};

instance DIA_KDF_4569_AlexOne_WhatBow(C_Info)
{
   npc = KDF_4569_AlexOne;
   nr = 1;
   condition = DIA_KDF_4569_AlexOne_WhatBow_condition;
   information = DIA_KDF_4569_AlexOne_WhatBow_info;
   permanent = FALSE;
   description = "Зачем тебе арбалет?";
};

func int DIA_KDF_4569_AlexOne_WhatBow_condition()
{
   if(Npc_KnowsInfo(other,DIA_KDF_4569_AlexOne_WhoYou) == TRUE)
   {
      return TRUE;
   };
};

func void DIA_KDF_4569_AlexOne_WhatBow_info()
{
   AI_Output(other,self,"DIA_KDF_4569_AlexOne_WhatBow_01_00");   //Зачем тебе арбалет?
   AI_Output(other,self,"DIA_KDF_4569_AlexOne_WhatBow_01_01");   //Ты же маг. Разве тебе недостаточно сил магических рун, чтобы защитить себя?
   AI_Output(self,other,"DIA_KDF_4569_AlexOne_WhatBow_01_02");   //Да, я маг, но больше на словах, чем на деле...
   AI_Output(self,other,"DIA_KDF_4569_AlexOne_WhatBow_01_03");   //К сожалению, мое обучение так и не было завершено.
   AI_Output(self,other,"DIA_KDF_4569_AlexOne_WhatBow_01_04");   //А потому мои магические способности не столь велики, как у других магов.
   AI_Output(self,other,"DIA_KDF_4569_AlexOne_WhatBow_01_05");   //Другое дело - арбалет! С раннего детства отец учил меня обращаться с ним.
   AI_Output(self,other,"DIA_KDF_4569_AlexOne_WhatBow_01_06");   //С ним я обращаюсь не хуже, чем умелый воин с мечом или маг с посохом.
   AI_Output(other,self,"DIA_KDF_4569_AlexOne_WhatBow_01_07");   //Значит, маг-арбалетчик. Да, забавно.
};

instance DIA_KDF_4569_AlexOne_WhatDeal(C_Info)
{
   npc = KDF_4569_AlexOne;
   nr = 1;
   condition = DIA_KDF_4569_AlexOne_WhatDeal_condition;
   information = DIA_KDF_4569_AlexOne_WhatDeal_info;
   permanent = FALSE;
   description = "Так что у тебя здесь за дела?";
};

func int DIA_KDF_4569_AlexOne_WhatDeal_condition()
{
   if((MIS_PashalQuest == LOG_Running) && (Npc_KnowsInfo(other,DIA_KDF_4569_AlexOne_WhoYou) == TRUE))
   {
      return TRUE;
   };
};

func void DIA_KDF_4569_AlexOne_WhatDeal_info()
{
   B_GivePlayerXP(300);
   AI_Output(other,self,"DIA_KDF_4569_AlexOne_WhatDeal_01_00");   //Так что у тебя здесь за дела?
   AI_Output(self,other,"DIA_KDF_4569_AlexOne_WhatDeal_01_01");   //Эх... Теперь это уже вряд ли имеет значение.
   AI_Output(other,self,"DIA_KDF_4569_AlexOne_WhatDeal_01_02");   //И все-таки, может быть, расскажешь?
   AI_Output(self,other,"DIA_KDF_4569_AlexOne_WhatDeal_01_03");   //Ну хорошо. Если тебе это так интересно.
   AI_Output(self,other,"DIA_KDF_4569_AlexOne_WhatDeal_01_04");   //Мастер Корристо послал меня найти в этой долине какую-либо информацию об одном древнем артефакте.
   AI_Output(other,self,"DIA_KDF_4569_AlexOne_WhatDeal_01_05");   //Уж не тот ли, с помощью которого они собирались разрушить магический барьер?
   AI_Output(self,other,"DIA_KDF_4569_AlexOne_WhatDeal_01_06");   //(удивленно) Да, о нем! А ты откуда об этом знаешь?
   AI_Output(other,self,"DIA_KDF_4569_AlexOne_WhatDeal_01_07");   //Мне рассказал об этом Милтен.
   AI_Output(self,other,"DIA_KDF_4569_AlexOne_WhatDeal_01_08");   //Тогда тебе и так должно быть все известно. Мне больше нечего добавить.
   AI_Output(other,self,"DIA_KDF_4569_AlexOne_WhatDeal_01_09");   //Но ты нашел что-нибудь?
   AI_Output(self,other,"DIA_KDF_4569_AlexOne_WhatDeal_01_10");   //Самого артефакта мне, конечно, найти не удалось.
   AI_Output(self,other,"DIA_KDF_4569_AlexOne_WhatDeal_01_11");   //Но я уверен, что напал на след, который может меня к нему привести.
   AI_Output(other,self,"DIA_KDF_4569_AlexOne_WhatDeal_01_12");   //И что это?
   AI_Output(self,other,"DIA_KDF_4569_AlexOne_WhatDeal_01_13");   //На другом берегу этого пруда, что под нами, находится заброшенный склеп.
   AI_Output(self,other,"DIA_KDF_4569_AlexOne_WhatDeal_01_14");   //Могу предположить, что именно там может находиться этот артефакт!
   AI_Output(self,other,"DIA_KDF_4569_AlexOne_WhatDeal_01_15");   //Ну, или по крайней мере то, что позволит определить его точное местоположение.
   AI_Output(other,self,"DIA_KDF_4569_AlexOne_WhatDeal_01_16");   //Что там может находиться?
   AI_Output(self,other,"DIA_KDF_4569_AlexOne_WhatDeal_01_17");   //Ты так меня спрашиваешь, как будто я уже там побывал.
   AI_Output(other,self,"DIA_KDF_4569_AlexOne_WhatDeal_01_18");   //Тогда почему бы тебе просто не сходить туда и выяснить это?
   AI_Output(self,other,"DIA_KDF_4569_AlexOne_WhatDeal_01_19");   //Вход в склеп закрыт! А как его открыть, я не знаю.
   AI_Output(other,self,"DIA_KDF_4569_AlexOne_WhatDeal_01_20");   //Понятно.
   B_LogEntry(TOPIC_PashalQuest,"Недалеко от башни Ксардаса я встретил мага Огня Лекса. Он и есть тот человек, которого Корристо послал на поиски артефакта. Лекс уверен, что разгадка местоположения этого предмета сокрыта в заброшенном склепе, что находится неподалеку, однако вход в склеп закрыт.");
   PashalQuestPentaStep = TRUE;
};

instance DIA_VLK_4570_Avabul_EXIT(C_Info)
{
   npc = VLK_4570_Avabul;
   nr = 999;
   condition = DIA_VLK_4570_Avabul_exit_condition;
   information = DIA_VLK_4570_Avabul_exit_info;
   permanent = TRUE;
   description = Dialog_Ende;
};

func int DIA_VLK_4570_Avabul_exit_condition()
{
   return TRUE;
};

func void DIA_VLK_4570_Avabul_exit_info()
{
   AI_StopProcessInfos(self);
};

instance DIA_VLK_4570_Avabul_HELLO(C_Info)
{
   npc = VLK_4570_Avabul;
   nr = 1;
   condition = DIA_VLK_4570_Avabul_HELLO_condition;
   information = DIA_VLK_4570_Avabul_HELLO_info;
   permanent = FALSE;
   important = TRUE;
};

func int DIA_VLK_4570_Avabul_HELLO_condition()
{
	if((MIS_PashalQuest == LOG_Running) && (AvabulIsUp == TRUE))
	{
		return TRUE;
	};
};

func void DIA_VLK_4570_Avabul_HELLO_info()
{
   B_GivePlayerXP(1000);
   AI_Output(self,other,"DIA_VLK_4570_Avabul_HELLO_01_00");   //Кто воззвал ко мне?! Кто посмел потревожить мой священный покой?!
   AI_Output(other,self,"DIA_VLK_4570_Avabul_HELLO_01_01");   //Это был я.
   AI_Output(self,other,"DIA_VLK_4570_Avabul_HELLO_01_02");   //(пренебрежительно) Ну конечно! Очередной смертный, который ищет для себя власти и могущества.
   AI_Output(self,other,"DIA_VLK_4570_Avabul_HELLO_01_03");   //Но поверь мне, они тебе абсолютно не нужны! Смерть куда вам более к лицу, жалкие вы черви...
   AI_Output(other,self,"DIA_VLK_4570_Avabul_HELLO_01_04");   //Эй, не так быстро, красавица! Ответь хотя бы на один мой вопрос.
   AI_Output(self,other,"DIA_VLK_4570_Avabul_HELLO_01_05");   //Что?! И тебе еще хватает наглости просить меня об этом?
   AI_Output(self,other,"DIA_VLK_4570_Avabul_HELLO_01_06");   //Хотя... почему бы и нет.
   AI_Output(self,other,"DIA_VLK_4570_Avabul_HELLO_01_07");   //Мне доставит удовольствие увидеть твои жалкие мольбы сохранить тебе твою ничтожную жизнь.
   AI_Output(other,self,"DIA_VLK_4570_Avabul_HELLO_01_08");   //Ты ошибаешься! Я хотел спросить совсем о другом.
   AI_Output(self,other,"DIA_VLK_4570_Avabul_HELLO_01_09");   //Правда?! И о чем же?
   AI_Output(other,self,"DIA_VLK_4570_Avabul_HELLO_01_10");   //Об артефакте, сила которого способна управлять этим миром.
   AI_Output(self,other,"DIA_VLK_4570_Avabul_HELLO_01_11");   //(смеется) Ах вот оно что! Ну конечно...
   AI_Output(self,other,"DIA_VLK_4570_Avabul_HELLO_01_12");   //Ты, как и тот некромант, возомнил себя великим и могущественным магом.
   AI_Output(self,other,"DIA_VLK_4570_Avabul_HELLO_01_13");   //И надеешься, что я скажу тебе, где его искать!
   AI_Output(other,self,"DIA_VLK_4570_Avabul_HELLO_01_14");   //Что-то вроде того.
   AI_Output(self,other,"DIA_VLK_4570_Avabul_HELLO_01_15");   //Сама наивность...(хохочет) Ответь мне, зачем тебе он понадобился, смертный?
   AI_Output(self,other,"DIA_VLK_4570_Avabul_HELLO_01_16");   //Неужели ты действительно думаешь, что сможешь совладать с могуществом этого предмета?
   AI_Output(other,self,"DIA_VLK_4570_Avabul_HELLO_01_17");   //Ну, я и сам пока этого не знаю. 
   AI_Output(self,other,"DIA_VLK_4570_Avabul_HELLO_01_18");   //Не знаешь что?
   AI_Output(other,self,"DIA_VLK_4570_Avabul_HELLO_01_19");   //Зачем мне вообще сдался этот артефакт.
   AI_Output(other,self,"DIA_VLK_4570_Avabul_HELLO_01_20");   //Просто так уж получилось, что я прослышал о нем, и мой путь привел меня сюда.
   AI_Output(self,other,"DIA_VLK_4570_Avabul_HELLO_01_21");   //Хммм. Как интересно!
   AI_Output(self,other,"DIA_VLK_4570_Avabul_HELLO_01_22");   //Знаешь, в это сложно поверить, что человек, который ищет самую могущественную реликвию этого мира, совершенно не знает, для чего она ему нужна.
   AI_Output(self,other,"DIA_VLK_4570_Avabul_HELLO_01_23");   //(загадочно) Но я чувствую, что ты говоришь мне правду, смертный.
   AI_Output(self,other,"DIA_VLK_4570_Avabul_HELLO_01_24");   //Так что я сохраню тебе жизнь и не стану превращать в бесчувственную нежить, как я это сделала с тем магом-выскочкой!
   AI_Output(other,self,"DIA_VLK_4570_Avabul_HELLO_01_25");   //Премного благодарен! Может быть, заодно и на вопрос мой ответишь?
   AI_Output(self,other,"DIA_VLK_4570_Avabul_HELLO_01_26");   //Артефакт, который ты ищешь, носит имя Ниврам! Его создали творцы этого мира, дабы им было сподручнее управлять им.
   AI_Output(other,self,"DIA_VLK_4570_Avabul_HELLO_01_27");   //Ты говоришь о Хранителях?
   AI_Output(self,other,"DIA_VLK_4570_Avabul_HELLO_01_28");   //(с интересом) Ты и о них знаешь?
   AI_Output(other,self,"DIA_VLK_4570_Avabul_HELLO_01_29");   //Немного.
   AI_Output(self,other,"DIA_VLK_4570_Avabul_HELLO_01_30");   //Они самые! Чтобы исключить возможность использования этого артефакта кем-либо посторонним, они надежно спрятали его.
   AI_Output(self,other,"DIA_VLK_4570_Avabul_HELLO_01_31");   //Но где именно, никто не знает. Даже боги.
   AI_Output(other,self,"DIA_VLK_4570_Avabul_HELLO_01_32");   //Тогда нет смысла продолжать его поиски.
   AI_Output(self,other,"DIA_VLK_4570_Avabul_HELLO_01_33");   //Да, ты прав. Для тебя - абсолютно никакого.
   AI_Output(self,other,"DIA_VLK_4570_Avabul_HELLO_01_34");   //Однако мой хозяин уже давно хочет заполучить этот предмет.
   AI_Output(self,other,"DIA_VLK_4570_Avabul_HELLO_01_35");   //И он мог бы помочь тебе в его поисках. Естественно, в обмен на власть и могущество, которое вы, смертные, всегда так жаждете обрести!
   AI_Output(other,self,"DIA_VLK_4570_Avabul_HELLO_01_36");   //А почему бы Белиару самому не поискать этот артефакт, если ему он так нужен? 
   AI_Output(self,other,"DIA_VLK_4570_Avabul_HELLO_01_37");   //Он не хочет привлекать к себе лишнего внимания Хранителей.
   AI_Output(self,other,"DIA_VLK_4570_Avabul_HELLO_01_38");   //Поэтому лучше, когда некоторые вещи делаются простыми смертными, вроде тебя.
   AI_Output(other,self,"DIA_VLK_4570_Avabul_HELLO_01_39");   //Ты хотела сказать - грязную работу.
   AI_Output(self,other,"DIA_VLK_4570_Avabul_HELLO_01_40");   //(властно) Это не важно.  Важно только то, с чем ты останешься в конце этого пути. А мой хозяин предлагает немало!
   AI_Output(self,other,"DIA_VLK_4570_Avabul_HELLO_01_41");   //Ну так что, ты согласен?
   AI_Output(other,self,"DIA_VLK_4570_Avabul_HELLO_01_42");   //А если я не соглашусь, что тогда?
   AI_Output(self,other,"DIA_VLK_4570_Avabul_HELLO_01_43");   //Тогда ты просто глупец, а я сейчас теряю с тобой время!
   AI_Output(other,self,"DIA_VLK_4570_Avabul_HELLO_01_44");   //Ладно, ладно... Вижу, ты дама серьезная. Да и лишнее могущество мне не помешает.
   AI_Output(other,self,"DIA_VLK_4570_Avabul_HELLO_01_45");   //Я согласен!
   AI_Output(self,other,"DIA_VLK_4570_Avabul_HELLO_01_46");   //Отлично! Только запомни: ты дал слово самому Белиару! И просто так от него ты теперь не сможешь отказаться.
   AI_Output(other,self,"DIA_VLK_4570_Avabul_HELLO_01_47");   //Давай ближе к делу.
   AI_Output(self,other,"DIA_VLK_4570_Avabul_HELLO_01_48");   //Хорошо, смертный. Первым делом тебе необходимо найти древнейшего из древних. Когда-его звали Янус Двуликий.
   AI_Output(self,other,"DIA_VLK_4570_Avabul_HELLO_01_49");   //Возможно, он что-то помнит об этом артефакте. 
   AI_Output(other,self,"DIA_VLK_4570_Avabul_HELLO_01_50");   //И где мне его искать?
   AI_Output(self,other,"DIA_VLK_4570_Avabul_HELLO_01_51");   //Насколько мне известно, он охраняет одну из реликвий самих Хранителей.
   AI_Output(self,other,"DIA_VLK_4570_Avabul_HELLO_01_52");   //А теперь ступай! Не стоит более терять времени на разговоры.
   B_LogEntry(TOPIC_PashalQuest,"С помощью черепа могущественного демона мне удалось вызвать одну из темных жриц Белиара - Авабюл. По ее словам, даже сам Белиар желает заполучить этот артефакт! В конце концов я согласился помочь Авабюл отыскать этот артефакт для Белиара, в обмен на предложенную им власть и могущество. Теперь мне надо найти Януса Двуликого - древнейшего из древних, того, кто может что-то помнить об этом артефакте. По словам жрицы, Янус охраняет одну из реликвий Хранителей.");
   AI_StopProcessInfos(self);
   PashalQuestJanusStep = TRUE;
};

instance DIA_DMT_4571_Jan_EXIT(C_Info)
{
   npc = DMT_4571_Jan;
   nr = 999;
   condition = DIA_DMT_4571_Jan_exit_condition;
   information = DIA_DMT_4571_Jan_exit_info;
   permanent = TRUE;
   description = Dialog_Ende;
};

func int DIA_DMT_4571_Jan_exit_condition()
{
   return TRUE;
};

func void DIA_DMT_4571_Jan_exit_info()
{
   AI_StopProcessInfos(self);
};

instance DIA_DMT_4571_Jan_HELLO(C_Info)
{
   npc = DMT_4571_Jan;
   nr = 1;
   condition = DIA_DMT_4571_Jan_HELLO_condition;
   information = DIA_DMT_4571_Jan_HELLO_info;
   permanent = FALSE;
   important = TRUE;
};

func int DIA_DMT_4571_Jan_HELLO_condition()
{
	return TRUE;
};

func void DIA_DMT_4571_Jan_HELLO_info()
{
   AI_Output(self,other,"DIA_DMT_4571_Jan_HELLO_01_00");   //Остановись, смертный! Дальше для тебя дороги нет!
   AI_Output(other,self,"DIA_DMT_4571_Jan_HELLO_01_01");   //Это почему?
   AI_Output(self,other,"DIA_DMT_4571_Jan_HELLO_01_02");   //Только избранным дозволено входить сюда. А ты не из их числа!
   AI_Output(self,other,"DIA_DMT_4571_Jan_HELLO_01_03");   //Так что поворачивай назад, если тебе дорога твоя жизнь.
   AI_Output(other,self,"DIA_DMT_4571_Jan_HELLO_01_04");   //А если я этого не сделаю?
   AI_Output(self,other,"DIA_DMT_4571_Jan_HELLO_01_05");   //Тогда ты умрешь. Как и остальные, кто пытался проникнуть сюда.
};

instance DIA_DMT_4571_Jan_WRATH(C_Info)
{
   npc = DMT_4571_Jan;
   nr = 1;
   condition = DIA_DMT_4571_Jan_WRATH_condition;
   information = DIA_DMT_4571_Jan_WRATH_info;
   permanent = FALSE;
   description = "Полагаешь, что я с тобой не справлюсь?";
};

func int DIA_DMT_4571_Jan_WRATH_condition()
{
	if(Npc_KnowsInfo(other,DIA_DMT_4571_Jan_HELLO) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_DMT_4571_Jan_WRATH_info()
{
   AI_Output(other,self,"DIA_DMT_4571_Jan_WRATH_01_00");   //Полагаешь, что я с тобой не справлюсь?
   AI_Output(self,other,"DIA_DMT_4571_Jan_WRATH_01_01");   //(смеется) Ты можешь попробовать, смертный!
   AI_Output(self,other,"DIA_DMT_4571_Jan_WRATH_01_02");   //Но ты только потеряешь свое время и жизнь в жалких попытках одолеть меня.
   AI_Output(self,other,"DIA_DMT_4571_Jan_WRATH_01_03");   //Те, кто поставил меня хранить этот путь, наделили меня огромной силой и могуществом.
   AI_Output(self,other,"DIA_DMT_4571_Jan_WRATH_01_04");   //И сделали одним из бессмертных Стражей Вечности!
   AI_Output(self,other,"DIA_DMT_4571_Jan_WRATH_01_05");   //Однако такому жалкому червю, как ты, это наверняка ни о чем не говорит. 
   AI_Output(self,other,"DIA_DMT_4571_Jan_WRATH_01_06");   //Так что лучше поворачивай назад!
   AI_Output(self,other,"DIA_DMT_4571_Jan_WRATH_01_07");   //Здесь ты не найдешь ничего, кроме своей собственной смерти.
};

instance DIA_DMT_4571_Jan_Pashal(C_Info)
{
   npc = DMT_4571_Jan;
   nr = 1;
   condition = DIA_DMT_4571_Jan_Pashal_condition;
   information = DIA_DMT_4571_Jan_Pashal_info;
   permanent = FALSE;
   description = "Так ты и есть Янус Двуликий?";
};

func int DIA_DMT_4571_Jan_Pashal_condition()
{
	if((Npc_KnowsInfo(other,DIA_DMT_4571_Jan_HELLO) == TRUE) && (MIS_PashalQuest == LOG_Running) && (PashalQuestJanusStep == TRUE))
	{
		return TRUE;
	};
};

func void DIA_DMT_4571_Jan_Pashal_info()
{
   B_GivePlayerXP(1500);
   AI_Output(other,self,"DIA_DMT_4571_Jan_Pashal_01_00");   //Так ты и есть Янус Двуликий? А я ведь искал тебя!
   AI_Output(self,other,"DIA_DMT_4571_Jan_Pashal_01_01");   //Ты искал меня, смертный? Но зачем, позволь узнать?
   AI_Output(other,self,"DIA_DMT_4571_Jan_Pashal_01_02");   //Мне рассказала про тебя жрица Белиара по имени Авабюл.
   AI_Output(other,self,"DIA_DMT_4571_Jan_Pashal_01_03");   //По ее словам, ты можешь знать про судьбу одного из древнейших артефактов.
   AI_Output(other,self,"DIA_DMT_4571_Jan_Pashal_01_04");   //Его называют Ниврам. Ты что-нибудь слышал о нем?
   AI_Output(self,other,"DIA_DMT_4571_Jan_Pashal_01_05");   //Никогда бы не подумал, что когда-нибудь услышу подобный вопрос от обычного человека.
   AI_Output(self,other,"DIA_DMT_4571_Jan_Pashal_01_06");   //Выходит, что ты посланник Белиара, раз тебя прислала сама Авабюл.
   AI_Output(other,self,"DIA_DMT_4571_Jan_Pashal_01_07");   //А разве это что-то меняет?
   AI_Output(self,other,"DIA_DMT_4571_Jan_Pashal_01_08");   //Нет, абсолютно ничего.
   AI_Output(self,other,"DIA_DMT_4571_Jan_Pashal_01_09");   //Но раз сильные мира сего доверяют тебе хранить подобные тайны, то, по всей видимости, это не просто так.
   AI_Output(other,self,"DIA_DMT_4571_Jan_Pashal_01_10");   //Тогда, может быть, расскажешь мне про этот артефакт?
   AI_Output(self,other,"DIA_DMT_4571_Jan_Pashal_01_11");   //Рассказ будет коротким. Ибо ответ на твой вопрос находится за этими дверьми.
   AI_Output(self,other,"DIA_DMT_4571_Jan_Pashal_01_12");   //Однако, как я уже сказал, ты не войдешь в них до тех пор, пока я сам не решу впустить тебя.
   B_LogEntry(TOPIC_PashalQuest,"Я отыскал Януса Двуликого. Он сказал, что ответ на интересующий меня вопрос находится за огромными вратами, которые он охраняет. Правда, я не смогу пройти через них до тех пор, пока сам Янус не разрешит мне сделать это.");
};

instance DIA_DMT_4571_Jan_Dual(C_Info)
{
   npc = DMT_4571_Jan;
   nr = 2;
   condition = DIA_DMT_4571_Jan_Dual_condition;
   information = DIA_DMT_4571_Jan_Dual_info;
   permanent = FALSE;
   description = "Почему тебя называют Двуликим?";
};

func int DIA_DMT_4571_Jan_Dual_condition()
{
	if(Npc_KnowsInfo(other,DIA_DMT_4571_Jan_Pashal) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_DMT_4571_Jan_Dual_info()
{
	AI_Output(other,self,"DIA_DMT_4571_Jan_Dual_01_00");   //Почему тебя называют Двуликим?
	AI_Output(self,other,"DIA_DMT_4571_Jan_Dual_01_01");   //Как ты, наверное, уже заметил, смертный, я ношу золотую маску.
	AI_Output(self,other,"DIA_DMT_4571_Jan_Dual_01_02");   //На протяжении всей моей жизни она скрывала мое истинное лицо от людей.
	AI_Output(other,self,"DIA_DMT_4571_Jan_Dual_01_03");   //Зачем?
	AI_Output(self,other,"DIA_DMT_4571_Jan_Dual_01_04");   //На то были свои причины. Однако именно поэтому меня и прозвали Двуликим.
	AI_Output(self,other,"DIA_DMT_4571_Jan_Dual_01_05");   //Правда, то, что оно скрывает сейчас, уже трудно назвать лицом.
	AI_Output(self,other,"DIA_DMT_4571_Jan_Dual_01_06");   //Но, как видишь, привычка носить маску осталась до сих пор.
};

instance DIA_DMT_4571_Jan_His(C_Info)
{
   npc = DMT_4571_Jan;
   nr = 2;
   condition = DIA_DMT_4571_Jan_His_condition;
   information = DIA_DMT_4571_Jan_His_info;
   permanent = FALSE;
   description = "А кем ты был при жизни?";
};

func int DIA_DMT_4571_Jan_His_condition()
{
	if(Npc_KnowsInfo(other,DIA_DMT_4571_Jan_Pashal) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_DMT_4571_Jan_His_info()
{
	AI_Output(other,self,"DIA_DMT_4571_Jan_His_01_00");   //А кем ты был при жизни?
	AI_Output(self,other,"DIA_DMT_4571_Jan_His_01_01");   //Я был охотником на драконов.
	AI_Output(other,self,"DIA_DMT_4571_Jan_His_01_02");   //Ты сражался с драконами?
	AI_Output(self,other,"DIA_DMT_4571_Jan_His_01_03");   //И не один раз. В те времена, когда я жил, драконы не были такой уж редкостью, как сейчас.
	AI_Output(self,other,"DIA_DMT_4571_Jan_His_01_04");   //В одном из таких сражений я и погиб.
	AI_Output(self,other,"DIA_DMT_4571_Jan_His_01_05");   //Правда, как видишь, мое пребывание в этом мире на этом не закончилось. Теперь я страж этих врат.
	AI_Output(other,self,"DIA_DMT_4571_Jan_His_01_06");   //А что сокрыто за ними?
	AI_Output(self,other,"DIA_DMT_4571_Jan_His_01_07");   //Ты сам об этом узнаешь, - если, конечно, окажешься достоин этой чести.
};

instance DIA_DMT_4571_Jan_Proof(C_Info)
{
   npc = DMT_4571_Jan;
   nr = 1;
   condition = DIA_DMT_4571_Jan_Proof_condition;
   information = DIA_DMT_4571_Jan_Proof_info;
   permanent = FALSE;
   description = "Что я должен сделать, чтобы убедить тебя?";
};

func int DIA_DMT_4571_Jan_Proof_condition()
{
	if((Npc_KnowsInfo(other,DIA_DMT_4571_Jan_Pashal) == TRUE) && (MIS_PashalQuest == LOG_Running) && (PashalQuestJanusStep == TRUE))
	{
		return TRUE;
	};
};

func void DIA_DMT_4571_Jan_Proof_info()
{
	AI_Output(other,self,"DIA_DMT_4571_Jan_Proof_01_00");   //Что я должен сделать, чтобы убедить тебя?
	AI_Output(self,other,"DIA_DMT_4571_Jan_Proof_01_01");   //Ты должен будешь пройти мое испытание. Но это будет довольно непросто.
	AI_Output(self,other,"DIA_DMT_4571_Jan_Proof_01_02");   //Ты действительно уверен в том, что готов к нему?
	AI_Output(other,self,"DIA_DMT_4571_Jan_Proof_01_03");   //Абсолютно! Давай, говори уже, - в чем оно заключается?
	AI_Output(self,other,"DIA_DMT_4571_Jan_Proof_01_04");   //Хорошо. Поскольку ты являешься посланником Белиара, я попрошу тебя принести мне душу его Избранного!
	AI_Output(self,other,"DIA_DMT_4571_Jan_Proof_01_05");   //Душу того, кто являет собой его суть, его силу и его власть в этом мире.
	AI_Output(self,other,"DIA_DMT_4571_Jan_Proof_01_06");   //Уж если Темный бог так хочет заполучить этот артефакт, то ему придется дорого заплатить за это.
	AI_Output(self,other,"DIA_DMT_4571_Jan_Proof_01_07");   //В ином случае эти двери никогда не откроются перед тобой.

	if(UndeadDragonIsDead == FALSE)
	{
		AI_Output(other,self,"DIA_DMT_4571_Jan_Proof_01_08");   //Хорошо. Где мне его искать?
		AI_Output(self,other,"DIA_DMT_4571_Jan_Proof_01_09");   //В одном из священных храмов самого Белиара, конечно! Где же еще.
		AI_Output(self,other,"DIA_DMT_4571_Jan_Proof_01_10");   //Но я сомневаюсь, что тебе удастся добраться хотя бы до одного из них.
		AI_Output(other,self,"DIA_DMT_4571_Jan_Proof_01_11");   //Ну, это мы еще посмотрим. Сюда ведь я как-то добрался.
		AI_Output(self,other,"DIA_DMT_4571_Jan_Proof_01_12");   //Что, по правде говоря, меня очень сильно удивляет.
		AI_Output(self,other,"DIA_DMT_4571_Jan_Proof_01_13");   //Однако ты не производишь впечатление того, кто способен одолеть одно из самых могущественных созданий этого мира.
		AI_Output(self,other,"DIA_DMT_4571_Jan_Proof_01_14");   //И изменю я свое мнение только тогда, когда увижу перед собой душу этого существа.
	};

	B_LogEntry(TOPIC_PashalQuest,"Янус пропустит меня, если я принесу ему душу Избранного самого Белиара!");
};

instance DIA_DMT_4571_Jan_ProofDone(C_Info)
{
   npc = DMT_4571_Jan;
   nr = 1;
   condition = DIA_DMT_4571_Jan_ProofDone_condition;
   information = DIA_DMT_4571_Jan_ProofDone_info;
   permanent = FALSE;
   description = "Вот душа Избранного Белиара!";
};

func int DIA_DMT_4571_Jan_ProofDone_condition()
{
	if((Npc_KnowsInfo(other,DIA_DMT_4571_Jan_Proof) == TRUE) && (MIS_PashalQuest == LOG_Running) && (PashalQuestJanusStep == TRUE) && (Npc_HasItems(other,ItAt_UndeadDragonSoulStone) >= 1))
	{
		return TRUE;
	};
};

func void DIA_DMT_4571_Jan_ProofDone_info()
{
	B_GivePlayerXP(2000);
	AI_Output(other,self,"DIA_DMT_4571_Jan_ProofDone_01_00");   //Вот душа Избранного Белиара!
	AI_Output(self,other,"DIA_DMT_4571_Jan_ProofDone_01_01");   //Воистину это она. Я преклоняюсь перед тобой, о великий воин!
	AI_Output(other,self,"DIA_DMT_4571_Jan_ProofDone_01_02");   //Теперь ты пропустишь меня?
	AI_Output(self,other,"DIA_DMT_4571_Jan_ProofDone_01_03");   //Как и обещал. Просто возложи принесенную тобой душу на алтарь, что позади тебя.
	AI_Output(self,other,"DIA_DMT_4571_Jan_ProofDone_01_04");   //После этого двери откроются, и ты сможешь пройти.
	B_LogEntry(TOPIC_PashalQuest,"Я принес Янусу душу. Теперь нужно возложить ее на алтарь, что находится рядом, и после этого двери должны открыться.");
	PashalQuestEgezartStep = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_DMT_4572_Trazege_EXIT(C_Info)
{
   npc = DMT_4572_Trazege;
   nr = 999;
   condition = DIA_DMT_4572_Trazege_exit_condition;
   information = DIA_DMT_4572_Trazege_exit_info;
   permanent = TRUE;
   description = Dialog_Ende;
};

func int DIA_DMT_4572_Trazege_exit_condition()
{
   return TRUE;
};

func void DIA_DMT_4572_Trazege_exit_info()
{
   AI_StopProcessInfos(self);
};

instance DIA_DMT_4572_Trazege_HELLO(C_Info)
{
   npc = DMT_4572_Trazege;
   nr = 1;
   condition = DIA_DMT_4572_Trazege_HELLO_condition;
   information = DIA_DMT_4572_Trazege_HELLO_info;
   permanent = FALSE;
   important = TRUE;
};

func int DIA_DMT_4572_Trazege_HELLO_condition()
{
	if(XranFregIsDead == TRUE)
	{
		return TRUE;
	};
};

func void DIA_DMT_4572_Trazege_HELLO_info()
{
	AI_Output(self,other,"DIA_DMT_4572_Trazege_HELLO_01_00");   //Что тебе здесь надо?! И как ты вообще попал сюда?
	AI_Output(other,self,"DIA_DMT_4572_Trazege_HELLO_01_01");   //Через магический портал.
	AI_Output(self,other,"DIA_DMT_4572_Trazege_HELLO_01_02");   //(ухмыляясь) Об этом я уже и сам догадался, умник.
	AI_Output(self,other,"DIA_DMT_4572_Trazege_HELLO_01_03");   //Меня интересует другое - какого дьявола Янус впустил тебя сюда?!
	AI_Output(other,self,"DIA_DMT_4572_Trazege_HELLO_01_04");   //Я выполнил его испытание и тем самым доказал, что достоин этого.
	AI_Output(self,other,"DIA_DMT_4572_Trazege_HELLO_01_05");   //Достоин? И что же ты сделал, герой?
	AI_Output(other,self,"DIA_DMT_4572_Trazege_HELLO_01_06");   //Я убил Избранного самого Белиара! Разве этого мало?
	AI_Output(self,other,"DIA_DMT_4572_Trazege_HELLO_01_07");   //(небрежно) По правде говоря, меня это не особо впечатляет.
	AI_Output(other,self,"DIA_DMT_4572_Trazege_HELLO_01_08");   //Почему?
	AI_Output(self,other,"DIA_DMT_4572_Trazege_HELLO_01_09");   //Я уже привык к тому, что его избранники не особо-то и долго живут в этом мире.
	AI_Output(self,other,"DIA_DMT_4572_Trazege_HELLO_01_10");   //Обязательно находится тот, кто с завидным постоянством отправляет их обратно к своему хозяину в царство Тьмы!
	AI_Output(self,other,"DIA_DMT_4572_Trazege_HELLO_01_11");   //Так что ты не первый и не последний, кто сделал это.
	AI_Output(self,other,"DIA_DMT_4572_Trazege_HELLO_01_12");   //А сам Белиар уже давно подыскал себе новую замену. Так что видишь - история повторяется вновь!
	AI_Output(other,self,"DIA_DMT_4572_Trazege_HELLO_01_13");   //И кто же теперь его избранный?
	AI_Output(self,other,"DIA_DMT_4572_Trazege_HELLO_01_14");   //Насколько мне известно, Ксардас, могущественный темный маг.
	AI_Output(self,other,"DIA_DMT_4572_Trazege_HELLO_01_15");   //Что же. Посмотрим, на сколько его хватит.
	AI_Output(self,other,"DIA_DMT_4572_Trazege_HELLO_01_16");   //Но хватит уже пустой болтовни! Если ты хотел заслужить мое внимание, то ты это сделал.
	AI_Output(self,other,"DIA_DMT_4572_Trazege_HELLO_01_17");   //А теперь отвечай немедленно, зачем ты пожаловал сюда?
};

instance DIA_DMT_4572_Trazege_GiveMePower(C_Info)
{
   npc = DMT_4572_Trazege;
   nr = 1;
   condition = DIA_DMT_4572_Trazege_GiveMePower_condition;
   information = DIA_DMT_4572_Trazege_GiveMePower_info;
   permanent = FALSE;
   description = "Я ищу один артефакт.";
};

func int DIA_DMT_4572_Trazege_GiveMePower_condition()
{
	if(Npc_KnowsInfo(other,DIA_DMT_4572_Trazege_HELLO) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_DMT_4572_Trazege_GiveMePower_info()
{
	B_GivePlayerXP(5000);
	AI_Output(other,self,"DIA_DMT_4572_Trazege_GiveMePower_01_00");   //Я ищу один артефакт. Его называют Ниврам.
	AI_Output(other,self,"DIA_DMT_4572_Trazege_GiveMePower_01_01");   //Насколько я знаю, с его помощью...
	AI_Output(self,other,"DIA_DMT_4572_Trazege_GiveMePower_01_02");   //Можешь дальше не продолжать. Я уже и так все понял.
	AI_Output(self,other,"DIA_DMT_4572_Trazege_GiveMePower_01_03");   //Ты, видимо, один из тех, кто с помощью него хочет заполучить безграничную власть и могущество в этом мире.
	AI_Output(other,self,"DIA_DMT_4572_Trazege_GiveMePower_01_04");   //Ну, не совсем. Его хочет заполучить Белиар.
	AI_Output(self,other,"DIA_DMT_4572_Trazege_GiveMePower_01_05");   //(смеется) Кем возомнил себя этот жалкий божок!
	AI_Output(self,other,"DIA_DMT_4572_Trazege_GiveMePower_01_06");   //Никто - ни он, ни его брат Иннос никогда не получат этот артефакт.
	AI_Output(self,other,"DIA_DMT_4572_Trazege_GiveMePower_01_07");   //Они слишком алчны и самолюбивы, чтобы обладать его безграничной властью.
	AI_Output(self,other,"DIA_DMT_4572_Trazege_GiveMePower_01_08");   //Возможно, я бы отдал его Аданосу, но он слишком мудр, чтобы принять этот дар.
	AI_Output(self,other,"DIA_DMT_4572_Trazege_GiveMePower_01_09");   //Поэтому, если ты не возражаешь, я оставлю его себе.
	AI_Output(other,self,"DIA_DMT_4572_Trazege_GiveMePower_01_10");   //А тебе он зачем?
	AI_Output(self,other,"DIA_DMT_4572_Trazege_GiveMePower_01_12");   //С помощью этого артефакта я слежу за балансом этого мира, исправляя ошибки все тех же богов.
	AI_Output(self,other,"DIA_DMT_4572_Trazege_GiveMePower_01_13");   //Я тот, благодаря кому этот мир еще живет и дышит! И ты в том числе.
	AI_Output(self,other,"DIA_DMT_4572_Trazege_GiveMePower_01_14");   //Поэтому он останется здесь до тех пор, пока не придет время разрушить этот мир и возродить его заново.
	AI_Output(self,other,"DIA_DMT_4572_Trazege_GiveMePower_01_15");   //И уж поверь мне, так оно и будет!
	B_LogEntry(TOPIC_PashalQuest,"Внутри храма я встретил Эгезарта, стража интересующего меня артефакта. Как и ожидалось, он не захотел мне его отдавать.");
};

instance DIA_DMT_4572_Trazege_NoAtAll(C_Info)
{
   npc = DMT_4572_Trazege;
   nr = 1;
   condition = DIA_DMT_4572_Trazege_NoAtAll_condition;
   information = DIA_DMT_4572_Trazege_NoAtAll_info;
   permanent = FALSE;
   description = "А если я заберу его у тебя силой?";
};

func int DIA_DMT_4572_Trazege_NoAtAll_condition()
{
	if(Npc_KnowsInfo(other,DIA_DMT_4572_Trazege_GiveMePower) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_DMT_4572_Trazege_NoAtAll_info()
{
	AI_Output(other,self,"DIA_DMT_4572_Trazege_NoAtAll_01_00");   //А если я заберу его у тебя силой?
	AI_Output(self,other,"DIA_DMT_4572_Trazege_NoAtAll_01_01");   //(смеется) Глупец!
	AI_Output(self,other,"DIA_DMT_4572_Trazege_NoAtAll_01_02");   //Неужели ты полагаешь, что твое оружие или магия способны причинить мне вред?
	AI_Output(self,other,"DIA_DMT_4572_Trazege_NoAtAll_01_03");   //Мне же достаточно только подумать, и ты прямо тут умрешь в ужасных муках.
	AI_PlayAni(hero,"T_INSANE");
	AI_Output(self,other,"DIA_DMT_4572_Trazege_NoAtAll_01_04");   //Ну как, теперь ты понимаешь всю нелепость своей идеи?
	AI_Output(other,self,"DIA_DMT_4572_Trazege_NoAtAll_01_05");   //Хорошо, я все понял! Только больше так не делай.
	B_LogEntry(TOPIC_PashalQuest,"Я собирался силой отобрать артефакт у Эгезарта, но вовремя понял, что этот бой мне не выиграть никогда.");
};

instance DIA_DMT_4572_Trazege_BuyGift(C_Info)
{
   npc = DMT_4572_Trazege;
   nr = 1;
   condition = DIA_DMT_4572_Trazege_BuyGift_condition;
   information = DIA_DMT_4572_Trazege_BuyGift_info;
   permanent = FALSE;
   description = "И что мне теперь делать?";
};

func int DIA_DMT_4572_Trazege_BuyGift_condition()
{
	if(Npc_KnowsInfo(other,DIA_DMT_4572_Trazege_NoAtAll) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_DMT_4572_Trazege_BuyGift_info()
{
	AI_Output(other,self,"DIA_DMT_4572_Trazege_BuyGift_01_00");   //И что мне теперь делать?
	AI_Output(self,other,"DIA_DMT_4572_Trazege_BuyGift_01_01");   //Тебе лучше уйти и больше никогда сюда не возвращаться!
	AI_Output(self,other,"DIA_DMT_4572_Trazege_BuyGift_01_02");   //Артефакт, что ты искал, останется тут навсегда.
	AI_Output(self,other,"DIA_DMT_4572_Trazege_BuyGift_01_03");   //Ну или, по крайней мере, до тех пор, пока его Создатели сами не решат его дальнейшую судьбу.
	AI_Output(self,other,"DIA_DMT_4572_Trazege_BuyGift_01_04");   //Что же касается тебя... То ты наверняка за все это время проделал очень долгий и опасный путь.
	AI_Output(self,other,"DIA_DMT_4572_Trazege_BuyGift_01_05");   //Все это, безусловно, заслуживает уважения. Поэтому с пустыми руками я тебя не отпущу.
	AI_Output(self,other,"DIA_DMT_4572_Trazege_BuyGift_01_06");   //Выбирай свою награду, смертный. И будь мудр в своем решении.
	B_LogEntry(TOPIC_PashalQuest,"Я смирился с тем, что мне никогда не заполучить этот предмет. Он навсегда останется тут, внутри этого храма. Однако я не ушел оттуда с пустыми руками - Эгезарт преподнес мне дар за то, что я смог добраться до него. Думаю, на этом стоит закончить эту историю.");
   	Info_ClearChoices(DIA_DMT_4572_Trazege_BuyGift);
   	Info_AddChoice(DIA_DMT_4572_Trazege_BuyGift,"Даруй мне жизнь и выносливость!",DIA_DMT_4572_Trazege_BuyGift_Hp);
   	Info_AddChoice(DIA_DMT_4572_Trazege_BuyGift,"Даруй мне мудрость и знания!",DIA_DMT_4572_Trazege_BuyGift_Mana);
   	Info_AddChoice(DIA_DMT_4572_Trazege_BuyGift,"Сделай меня невероятно ловким!",DIA_DMT_4572_Trazege_BuyGift_Dex);
   	Info_AddChoice(DIA_DMT_4572_Trazege_BuyGift,"Надели меня огромной силой!",DIA_DMT_4572_Trazege_BuyGift_Str);
};

func void DIA_DMT_4572_Trazege_BuyGift_Str()
{
	AI_Output(other,self,"DIA_DMT_4572_Trazege_BuyGift_Str_01_00");   //Надели меня огромной силой!
	B_RaiseAttribute_Bonus(other,ATR_STRENGTH,50);
	AI_Output(self,other,"DIA_DMT_4572_Trazege_BuyGift_Str_01_01");   //Как скажешь. Ты сделал свой выбор! Теперь прощай.
	MIS_PashalQuest = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_PashalQuest,LOG_SUCCESS);
	AI_StopProcessInfos(self);
};

func void DIA_DMT_4572_Trazege_BuyGift_Dex()
{
	AI_Output(other,self,"DIA_DMT_4572_Trazege_BuyGift_Dex_01_00");   //Сделай меня невероятно ловким!
	B_RaiseAttribute_Bonus(other,ATR_DEXTERITY,50);
	AI_Output(self,other,"DIA_DMT_4572_Trazege_BuyGift_Dex_01_01");   //Как скажешь. Ты сделал свой выбор! Теперь прощай.
	MIS_PashalQuest = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_PashalQuest,LOG_SUCCESS);
	AI_StopProcessInfos(self);
};

func void DIA_DMT_4572_Trazege_BuyGift_Mana()
{
	AI_Output(other,self,"DIA_DMT_4572_Trazege_BuyGift_Mana_01_00");   //Даруй мне мудрость и знания!
	B_RaiseAttribute_Bonus(other,ATR_MANA_MAX,150);
	Npc_ChangeAttribute(other,ATR_MANA,150);
	ATR_INTELLECT += 20;
	Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
	AI_Output(self,other,"DIA_DMT_4572_Trazege_BuyGift_Mana_01_01");   //Как скажешь. Ты сделал свой выбор! Теперь прощай.
	MIS_PashalQuest = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_PashalQuest,LOG_SUCCESS);
	AI_StopProcessInfos(self);
};

func void DIA_DMT_4572_Trazege_BuyGift_Hp()
{
	var int TempStaminaMax;

	AI_Output(other,self,"DIA_DMT_4572_Trazege_BuyGift_Hp_01_00");   //Даруй мне жизнь и выносливость!
	B_RaiseAttribute(other,ATR_HITPOINTS_MAX,500);
	Npc_ChangeAttribute(other,ATR_HITPOINTS,500);

	if(ATR_STAMINA_MAX[0] <= 90)
	{
		ATR_STAMINA_MAX[0] = ATR_STAMINA_MAX[0] + 10;
		Npc_SetTalentSkill(hero,NPC_TALENT_STAMINA,ATR_STAMINA_MAX[0]);
	}
	else
	{
		TempStaminaMax = 100 - ATR_STAMINA_MAX[0];
		ATR_STAMINA_MAX[0] = ATR_STAMINA_MAX[0] + TempStaminaMax;
		Npc_SetTalentSkill(hero,NPC_TALENT_STAMINA,ATR_STAMINA_MAX[0]);
	};

	AI_Output(self,other,"DIA_DMT_4572_Trazege_BuyGift_Hp_01_01");   //Как скажешь. Ты сделал свой выбор! Теперь прощай.
	MIS_PashalQuest = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_PashalQuest,LOG_SUCCESS);
	AI_StopProcessInfos(self);
};

instance DIA_KDW_4573_Oddler_EXIT(C_Info)
{
   npc = KDW_4573_Oddler;
   nr = 999;
   condition = DIA_KDW_4573_Oddler_exit_condition;
   information = DIA_KDW_4573_Oddler_exit_info;
   permanent = TRUE;
   description = Dialog_Ende;
};

func int DIA_KDW_4573_Oddler_exit_condition()
{
   return TRUE;
};

func void DIA_KDW_4573_Oddler_exit_info()
{
   AI_StopProcessInfos(self);
};

instance DIA_KDW_4573_Oddler_HELLO(C_Info)
{
   npc = KDW_4573_Oddler;
   nr = 1;
   condition = DIA_KDW_4573_Oddler_HELLO_condition;
   information = DIA_KDW_4573_Oddler_HELLO_info;
   permanent = FALSE;
   important = TRUE;
};

func int DIA_KDW_4573_Oddler_HELLO_condition()
{
   return TRUE;
};

func void DIA_KDW_4573_Oddler_HELLO_info()
{
   AI_Output(self,other,"DIA_KDW_4573_Oddler_HELLO_01_00");   //Приветствую тебя, путник. Ты заблудился?
   AI_Output(other,self,"DIA_KDW_4573_Oddler_HELLO_01_01");   //С чего ты взял?
   AI_Output(self,other,"DIA_KDW_4573_Oddler_HELLO_01_02");   //Это место слишком опасно для обычных прогулок.
   AI_Output(self,other,"DIA_KDW_4573_Oddler_HELLO_01_03");   //Никто, будучи в здравом уме, просто так не решится прийти сюда.
   AI_Output(self,other,"DIA_KDW_4573_Oddler_HELLO_01_04");   //Следовательно, ты либо заблудился, либо, возможно, что-то ищешь.
   AI_Output(self,other,"DIA_KDW_4573_Oddler_HELLO_01_05");   //И это что-то настолько важно для тебя, что ты готов рискнуть своей жизнью ради этого.
};

instance DIA_KDW_4573_Oddler_WhoYou(C_Info)
{
   npc = KDW_4573_Oddler;
   nr = 1;
   condition = DIA_KDW_4573_Oddler_WhoYou_condition;
   information = DIA_KDW_4573_Oddler_WhoYou_info;
   permanent = FALSE;
   description = "А ты что тут делаешь?";
};

func int DIA_KDW_4573_Oddler_WhoYou_condition()
{
   if(Npc_KnowsInfo(other,DIA_KDW_4573_Oddler_HELLO) == TRUE)
   {
      return TRUE;
   };
};

func void DIA_KDW_4573_Oddler_WhoYou_info()
{
  AI_Output(other,self,"DIA_KDW_4573_Oddler_WhoYou_01_00");   //А ты что тут делаешь?
   AI_Output(self,other,"DIA_KDW_4573_Oddler_WhoYou_01_01");   //Как видишь, живу. По мне лучше места просто не найти.
   AI_Output(self,other,"DIA_KDW_4573_Oddler_WhoYou_01_02");   //Тишина и спокойствие - это все, что мне нужно. И, самое главное, подальше от людей.
   AI_Output(other,self,"DIA_KDW_4573_Oddler_WhoYou_01_03");   //И тебя абсолютно не беспокоит то, что кругом может быть полно орков или других хищных тварей?
   AI_Output(self,other,"DIA_KDW_4573_Oddler_WhoYou_01_04");   //Орков тут нет. Их лагеря находятся в другой части этих гор.
   AI_Output(self,other,"DIA_KDW_4573_Oddler_WhoYou_01_05");   //А что касается всего остального, то с этим я как-нибудь справлюсь.
   AI_Output(self,other,"DIA_KDW_4573_Oddler_WhoYou_01_06");   //(улыбаясь) Я же все-таки маг.
};

instance DIA_KDW_4573_Oddler_Mage(C_Info)
{
   npc = KDW_4573_Oddler;
   nr = 1;
   condition = DIA_KDW_4573_Oddler_Mage_condition;
   information = DIA_KDW_4573_Oddler_Mage_info;
   permanent = FALSE;
   description = "Так ты еще и маг?";
};

func int DIA_KDW_4573_Oddler_Mage_condition()
{
   if(Npc_KnowsInfo(other,DIA_KDW_4573_Oddler_WhoYou) == TRUE)
   {
      return TRUE;
   };
};

func void DIA_KDW_4573_Oddler_Mage_info()
{
   AI_Output(other,self,"DIA_KDW_4573_Oddler_Mage_01_00");   //Так ты еще и маг?
   AI_Output(self,other,"DIA_KDW_4573_Oddler_Mage_01_01");   //Маг Воды, если быть более точным.
   AI_Output(other,self,"DIA_KDW_4573_Oddler_Mage_01_02");   //Из Нового лагеря?
   AI_Output(self,other,"DIA_KDW_4573_Oddler_Mage_01_03");   //(задумчиво) Хммм. Что еще за Новый лагерь?
   AI_Output(other,self,"DIA_KDW_4573_Oddler_Mage_01_04");   //Тот, что в Долине Рудников, конечно.
   AI_Output(self,other,"DIA_KDW_4573_Oddler_Mage_01_05");   //Извини, но я никогда не слышал о нем. 
   AI_Output(other,self,"DIA_KDW_4573_Oddler_Mage_01_06");   //Тогда откуда ты?
   AI_Output(self,other,"DIA_KDW_4573_Oddler_Mage_01_07");   //Сам я родом из Сильдена. Это небольшой городок в Миртане.
   AI_Output(other,self,"DIA_KDW_4573_Oddler_Mage_01_08");   //А как ты оказался в Хоринисе?
   AI_Output(self,other,"DIA_KDW_4573_Oddler_Mage_01_09");   //Приплыл сюда на корабле, как же еще.
   AI_Output(other,self,"DIA_KDW_4573_Oddler_Mage_01_10");   //Зачем?
   AI_Output(self,other,"DIA_KDW_4573_Oddler_Mage_01_11");   //У меня было послание для верховного мага Огня Корристо.
   AI_Output(self,other,"DIA_KDW_4573_Oddler_Mage_01_12");   //Он был наставником в монастыре Инноса, который находился на этом острове.
   AI_Output(self,other,"DIA_KDW_4573_Oddler_Mage_01_13");   //Правда, это было очень давно. С тех пор прошел не один десяток лет.
   AI_Output(other,self,"DIA_KDW_4573_Oddler_Mage_01_14");   //Ну хорошо. А как ты попал сюда?
   AI_Output(self,other,"DIA_KDW_4573_Oddler_Mage_01_15");   //Вместе с остальными магами Огня я принимал участие в одной из исследовательских экспедиций.
   AI_Output(self,other,"DIA_KDW_4573_Oddler_Mage_01_16");   //Мы хотели получше изучить эти горы и, возможно, найти тут что-нибудь интересное.
   AI_Output(self,other,"DIA_KDW_4573_Oddler_Mage_01_17");   //В итоге вместо этого я угодил в плен к оркам.
   AI_Output(self,other,"DIA_KDW_4573_Oddler_Mage_01_18");   //Они бы меня убили, не будь я магом! Но их верховный шаман почему-то заинтересовался моей магией.
   AI_Output(self,other,"DIA_KDW_4573_Oddler_Mage_01_19");   //Это и спасло мою жизнь.
   AI_Output(self,other,"DIA_KDW_4573_Oddler_Mage_01_20");   //Через несколько лет мне удалось бежать из их лагеря.
   AI_Output(self,other,"DIA_KDW_4573_Oddler_Mage_01_21");   //Скитаясь по горам, я набрел на это место. И теперь живу тут.
   AI_Output(self,other,"DIA_KDW_4573_Oddler_Mage_01_22");   //Вот, собственно, и вся история.
};

instance DIA_KDW_4573_Oddler_Blind(C_Info)
{
   npc = KDW_4573_Oddler;
   nr = 1;
   condition = DIA_KDW_4573_Oddler_Blind_condition;
   information = DIA_KDW_4573_Oddler_Blind_info;
   permanent = FALSE;
   description = "У тебя повязка на глазах.";
};

func int DIA_KDW_4573_Oddler_Blind_condition()
{
   if(Npc_KnowsInfo(other,DIA_KDW_4573_Oddler_Mage) == TRUE)
   {
      return TRUE;
   };
};

func void DIA_KDW_4573_Oddler_Blind_info()
{
   AI_Output(other,self,"DIA_KDW_4573_Oddler_Blind_01_00");   //У тебя повязка на глазах. Ты слепой?
   AI_Output(self,other,"DIA_KDW_4573_Oddler_Blind_01_01");   //(вздыхая) Да. Как видишь.
   AI_Output(other,self,"DIA_KDW_4573_Oddler_Blind_01_02");   //Как же это случилось?
   AI_Output(self,other,"DIA_KDW_4573_Oddler_Blind_01_03");   //Чтобы сделать невозможной для меня саму мысль о побеге, орки выкололи мне глаза.
   AI_Output(self,other,"DIA_KDW_4573_Oddler_Blind_01_04");   //Поначалу, конечно, было невыносимо тяжело. Я не мог пройти даже и двух метров без чьей-либо помощи.
   AI_Output(self,other,"DIA_KDW_4573_Oddler_Blind_01_05");   //Но со временем у меня обострились другие мои чувства, - например, слух или обоняние.
   AI_Output(self,other,"DIA_KDW_4573_Oddler_Blind_01_06");   //Все это помогло мне тут выжить. Теперь мне необязательно быть зрячим, чтобы понять, кто стоит передо мной.
   AI_Output(self,other,"DIA_KDW_4573_Oddler_Blind_01_07");   //Кстати, ты только поднимался на эту гору, а я уже знал, что сюда кто-то идет.
};

instance DIA_KDW_4573_Oddler_Away(C_Info)
{
   npc = KDW_4573_Oddler;
   nr = 1;
   condition = DIA_KDW_4573_Oddler_Away_condition;
   information = DIA_KDW_4573_Oddler_Away_info;
   permanent = FALSE;
   description = "Ты не хотел бы убраться отсюда?";
};

func int DIA_KDW_4573_Oddler_Away_condition()
{
   if(Npc_KnowsInfo(other,DIA_KDW_4573_Oddler_Mage) == TRUE)
   {
      return TRUE;
   };
};

func void DIA_KDW_4573_Oddler_Away_info()
{
   AI_Output(other,self,"DIA_KDW_4573_Oddler_Getout_01_00");   //Ты не хотел бы убраться отсюда?
   AI_Output(self,other,"DIA_KDW_4573_Oddler_Getout_01_01");   //Нет. Мне здесь нравится! Здесь тихо и спокойно.
   AI_Output(self,other,"DIA_KDW_4573_Oddler_Getout_01_02");   //К тому же переход через горы будет крайне опасным делом.
   AI_Output(self,other,"DIA_KDW_4573_Oddler_Getout_01_03");   //Без должной подготовки можно легко погибнуть.
   AI_Output(self,other,"DIA_KDW_4573_Oddler_Getout_01_04");   //Или, что еще хуже, попасть в плен к оркам.
   AI_Output(self,other,"DIA_KDW_4573_Oddler_Getout_01_05");   //Так что подобные мысли меня посещают все реже и реже.
};

instance DIA_KDW_4573_Oddler_Mount(C_Info)
{
   npc = KDW_4573_Oddler;
   nr = 1;
   condition = DIA_KDW_4573_Oddler_Mount_condition;
   information = DIA_KDW_4573_Oddler_Mount_info;
   permanent = FALSE;
   description = "Что тут есть интересного в горах?";
};

func int DIA_KDW_4573_Oddler_Mount_condition()
{
   if(Npc_KnowsInfo(other,DIA_KDW_4573_Oddler_Mage) == TRUE)
   {
      return TRUE;
   };
};

func void DIA_KDW_4573_Oddler_Mount_info()
{
   AI_Output(other,self,"DIA_KDW_4573_Oddler_Mount_01_00");   //Что тут есть интересного в горах?
   AI_Output(self,other,"DIA_KDW_4573_Oddler_Mount_01_01");   //Ничего особенного.
   AI_Output(self,other,"DIA_KDW_4573_Oddler_Mount_01_02");   //Где-то внизу должен располагаться небольшой форт. 
   AI_Output(self,other,"DIA_KDW_4573_Oddler_Mount_01_03");   //Его построили паладины, которые сопровождали нас в той злосчастной экспедиции.
   AI_Output(self,other,"DIA_KDW_4573_Oddler_Mount_01_04");   //Недалеко от него находится древнее святилище орков. Там они меня и взяли в плен.
   AI_Output(other,self,"DIA_KDW_4573_Oddler_Mount_01_05");   //А где сам их лагерь?
   AI_Output(self,other,"DIA_KDW_4573_Oddler_Mount_01_06");   //Далеко отсюда. На другом конце этих гор.
   AI_Output(self,other,"DIA_KDW_4573_Oddler_Mount_01_07");   //Но я тебе туда ходить не советую, если ты, конечно, не хочешь разделить мою участь.
   AI_Output(other,self,"DIA_KDW_4573_Oddler_Mount_01_08");   //Понятно. Больше ничего?
   AI_Output(self,other,"DIA_KDW_4573_Oddler_Mount_01_09");   //Это все, что я знаю. Больше мне нечего добавить.
   AI_Output(other,self,"DIA_KDW_4573_Oddler_Mount_01_10");   //Ладно, благодарю тебя.
};

instance DIA_KDW_4573_Oddler_Work(C_Info)
{
   npc = KDW_4573_Oddler;
   nr = 1;
   condition = DIA_KDW_4573_Oddler_Work_condition;
   information = DIA_KDW_4573_Oddler_Work_info;
   permanent = FALSE;
   description = "Что ты тут строишь?";
};

func int DIA_KDW_4573_Oddler_Work_condition()
{
   if(Npc_KnowsInfo(other,DIA_KDW_4573_Oddler_Blind) == TRUE)
   {
      return TRUE;
   };
};

func void DIA_KDW_4573_Oddler_Work_info()
{
   AI_Output(other,self,"DIA_KDW_4573_Oddler_Work_01_00");   //Что ты тут строишь?
   AI_Output(self,other,"DIA_KDW_4573_Oddler_Work_01_01");   //Ты что, тоже слепой? Разве не видно?
   AI_Output(self,other,"DIA_KDW_4573_Oddler_Work_01_02");   //Я строю для себя хижину.
   AI_Output(other,self,"DIA_KDW_4573_Oddler_Work_01_03");   //Зачем? Разве тебе в пещере не уютно?
   AI_Output(self,other,"DIA_KDW_4573_Oddler_Work_01_04");   //В ней, конечно, тепло, но и она не всегда спасает от здешних морозов.
   AI_Output(self,other,"DIA_KDW_4573_Oddler_Work_01_05");   //Правда, мне чертовски не хватает инструментов. Ржавая пила - это единственное, что мне удалось тут отыскать.
   AI_Output(self,other,"DIA_KDW_4573_Oddler_Work_01_06");   //А с ней одной немного-то и сделаешь.
};

instance DIA_KDW_4573_Oddler_WorkDo(C_Info)
{
   npc = KDW_4573_Oddler;
   nr = 1;
   condition = DIA_KDW_4573_Oddler_WorkDo_condition;
   information = DIA_KDW_4573_Oddler_WorkDo_info;
   permanent = FALSE;
   description = "Я могу достать для тебя инструменты.";
};

func int DIA_KDW_4573_Oddler_WorkDo_condition()
{
   if(Npc_KnowsInfo(other,DIA_KDW_4573_Oddler_Blind) == TRUE)
   {
      return TRUE;
   };
};

func void DIA_KDW_4573_Oddler_WorkDo_info()
{
	AI_Output(other,self,"DIA_KDW_4573_Oddler_WorkDo_01_00");   //Я могу достать для тебя инструменты.
	AI_Output(self,other,"DIA_KDW_4573_Oddler_WorkDo_01_01");   //Правда? Ну, тогда, пожалуй, я не буду отказываться от твоей помощи.
	AI_Output(self,other,"DIA_KDW_4573_Oddler_WorkDo_01_02");   //Мне нужен молоток, новая пила и кирка, чтобы обтесывать камни.
	AI_Output(self,other,"DIA_KDW_4573_Oddler_WorkDo_01_03");   //Если сможешь все это для меня достать, я буду очень признателен.
	AI_Output(other,self,"DIA_KDW_4573_Oddler_WorkDo_01_04");   //Договорились.
	MIS_OddlerlTools = LOG_Running;
	Log_CreateTopic(TOPIC_OddlerlTools,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OddlerlTools,LOG_Running);
	B_LogEntry(TOPIC_OddlerlTools,"Оддлеру нужны новые инструменты для постройки хижины. Он попросил принести ему молоток, новую пилу и кирку.");
};

instance DIA_KDW_4573_Oddler_Done(C_Info)
{
	npc = KDW_4573_Oddler;
	nr = 99;
	condition = DIA_KDW_4573_Oddler_Done_Condition;
	information = DIA_KDW_4573_Oddler_Done_Info;
	description = "Вот новые инструменты.";
};

func int DIA_KDW_4573_Oddler_Done_Condition()
{
	if((MIS_OddlerlTools == LOG_Running) && (Npc_HasItems(other,ItMi_Hammer) >= 1) && (Npc_HasItems(other,ItMi_Saw) >= 1) && (Npc_HasItems(other,ItMw_2H_Axe_L_01) >= 1))
	{
		return TRUE;
	};
};

func void DIA_KDW_4573_Oddler_Done_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_KDW_4573_Oddler_Done_01_00");	//Вот новые инструменты.
	B_GiveInvItemsManyThings(other,self);
	Npc_RemoveInvItems(hero,ItMi_Hammer,1);
	Npc_RemoveInvItems(hero,ItMi_Saw,1);
	Npc_RemoveInvItems(hero,ItMw_2H_Axe_L_01,1);
	AI_Output(self,other,"DIA_KDW_4573_Oddler_Done_01_01");	//Спасибо! Теперь постройка хижины пойдет намного быстрей.
	AI_Output(self,other,"DIA_KDW_4573_Oddler_Done_01_02");	//Вот, возьми этот магический свиток в знак моей благодарности.
	B_GiveInvItems(self,other,ItSc_Shrink,1);
	MIS_OddlerlTools = LOG_Success;
	Log_SetTopicStatus(TOPIC_OddlerlTools,LOG_Success);
	B_LogEntry(TOPIC_OddlerlTools,"Я принес Оддлеру нужные ему инструменты.");
};

instance DIA_KDW_4573_Oddler_XRANFREG(C_Info)
{
   npc = KDW_4573_Oddler;
   nr = 1;
   condition = DIA_KDW_4573_Oddler_XRANFREG_condition;
   information = DIA_KDW_4573_Oddler_XRANFREG_info;
   permanent = FALSE;
   description = "Расскажи мне о той экспедиции.";
};

func int DIA_KDW_4573_Oddler_XRANFREG_condition()
{
   if((Npc_KnowsInfo(other,DIA_KDW_4573_Oddler_Mage) == TRUE) && (MIS_XRANFREG == LOG_Running))
   {
      return TRUE;
   };
};

func void DIA_KDW_4573_Oddler_XRANFREG_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_KDW_4573_Oddler_XRANFREG_01_00");   //Расскажи мне о той экспедиции.
	AI_Output(self,other,"DIA_KDW_4573_Oddler_XRANFREG_01_01");   //Эх. Давно это было!
	AI_Output(self,other,"DIA_KDW_4573_Oddler_XRANFREG_01_02");   //В ней принимали участие только маги Огня и несколько паладинов, которые вызвались в качестве сопровождения.
	AI_Output(self,other,"DIA_KDW_4573_Oddler_XRANFREG_01_03");   //Мастер Корристо предложил мне отправиться вместе с ними, дабы помочь им исследовать эту неизвестную часть острова.
	AI_Output(self,other,"DIA_KDW_4573_Oddler_XRANFREG_01_04");   //Поначалу я думал отказаться от этой опасной затеи.
	AI_Output(self,other,"DIA_KDW_4573_Oddler_XRANFREG_01_05");   //Но Корристо смог убедить меня в необходимости моего присутствия, и я решил согласиться.
	AI_Output(self,other,"DIA_KDW_4573_Oddler_XRANFREG_01_06");   //Переход через горы нам дался довольно легко.
	AI_Output(self,other,"DIA_KDW_4573_Oddler_XRANFREG_01_07");   //Когда мы попали сюда, Корристо распорядился построить тут небольшой лагерь, где мы все и обосновались.
	AI_Output(self,other,"DIA_KDW_4573_Oddler_XRANFREG_01_08");   //Позже часть магов ушла на север, а остальные, в том числе и я, решили осмотреть восточную часть этих земель.
	AI_Output(self,other,"DIA_KDW_4573_Oddler_XRANFREG_01_09");   //Так мы натолкнулись на заброшенное святилище орков.
	AI_Output(self,other,"DIA_KDW_4573_Oddler_XRANFREG_01_10");   //Точнее, оно выглядело как заброшенное, но на самом деле все оказалось иначе.
	AI_Output(self,other,"DIA_KDW_4573_Oddler_XRANFREG_01_11");   //В один прекрасный день, когда я занимался тем, что изучал древние алтари святилища, туда пришли орки.
	AI_Output(self,other,"DIA_KDW_4573_Oddler_XRANFREG_01_12");   //Хотя меня и сопровождало несколько паладинов, но исход боя был уже предрешен.
	AI_Output(self,other,"DIA_KDW_4573_Oddler_XRANFREG_01_13");   //Паладинов орки убили сразу. А меня, увидев, что я маг, решили отвести в лагерь.
	AI_Output(self,other,"DIA_KDW_4573_Oddler_XRANFREG_01_14");   //На этом моя история участия в этой экспедиции заканчивается.
	B_LogEntry(TOPIC_XRANFREG,"Оддлер - один из тех, кто принимал участие в экспедиции магов Огня. По его словам, на востоке находится древнее святилище орков. Надо бы наведаться туда при случае.");
};

instance DIA_VLK_5570_Avabul_EXIT(C_Info)
{
   npc = VLK_5570_Avabul;
   nr = 999;
   condition = DIA_VLK_5570_Avabul_exit_condition;
   information = DIA_VLK_5570_Avabul_exit_info;
   permanent = TRUE;
   description = Dialog_Ende;
};

func int DIA_VLK_5570_Avabul_exit_condition()
{
   return TRUE;
};

func void DIA_VLK_5570_Avabul_exit_info()
{
   AI_StopProcessInfos(self);
};

instance DIA_VLK_5570_Avabul_HELLO(C_Info)
{
   npc = VLK_5570_Avabul;
   nr = 1;
   condition = DIA_VLK_5570_Avabul_HELLO_condition;
   information = DIA_VLK_5570_Avabul_HELLO_info;
   permanent = FALSE;
   important = TRUE;
};

func int DIA_VLK_5570_Avabul_HELLO_condition()
{
	if(MIS_PashalQuest == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_VLK_5570_Avabul_HELLO_info()
{
	AI_Output(self,other,"DIA_VLK_5570_Avabul_HELLO_01_00");   //Смертный! Ты достал артефакт, который ищет мой господин?
	AI_Output(other,self,"DIA_VLK_5570_Avabul_HELLO_01_01");   //Боюсь огорчить тебя, но его у меня нет.
	AI_Output(self,other,"DIA_VLK_5570_Avabul_HELLO_01_02");   //Что ты сказал?!
	AI_Output(other,self,"DIA_VLK_5570_Avabul_HELLO_01_03");   //Ты что, оглохла? Я сказал, что у меня его нет. Его настоящий владелец не захотел с ним расставаться.
	AI_Output(self,other,"DIA_VLK_5570_Avabul_HELLO_01_04");   //Меня это не волнует. Ты должен был принести его мне! Это была часть нашего договора!
	AI_Output(other,self,"DIA_VLK_5570_Avabul_HELLO_01_05");   //Тогда тебе и твоему хозяину придется немного поумерить свои аппетиты. Артефакт навсегда останется внутри этого храма, так что забудь о нашем соглашении.
	AI_Output(self,other,"DIA_VLK_5570_Avabul_HELLO_01_06");   //Да как ты смеешь?! Жалкий червяк! За свою наглость ты сейчас умрешь!
	AI_Output(self,other,"DIA_VLK_5570_Avabul_HELLO_01_07");   //А когда это случится, я вдоволь наиграюсь с твоей душой, словно с куклой!
	Info_ClearChoices(DIA_VLK_5570_Avabul_HELLO);
	Info_AddChoice(DIA_VLK_5570_Avabul_HELLO,Dialog_Ende,DIA_VLK_5570_Avabul_HELLO_End);
};

func void DIA_VLK_5570_Avabul_HELLO_End()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_EnemyOverride] = FALSE;
	self.flags = 0;
	Snd_Play("MFX_FEAR_CAST");
	Wld_PlayEffect("SPELLFX_MASSDEATH_EXPLOSION",self,other,0,250,DAM_MAGIC,TRUE);
};