
var int choose_way;

instance DIA_Hagen_EXIT(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 999;
	condition = DIA_Hagen_EXIT_Condition;
	information = DIA_Hagen_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hagen_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Hagen_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Hagen_NoEnter_PissOff(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 1;
	condition = DIA_Hagen_NoEnter_PissOff_Condition;
	information = DIA_Hagen_NoEnter_PissOff_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Hagen_NoEnter_PissOff_Condition()
{
	if((CITYHALLACCESSGRANTED == FALSE) && (self.aivar[AIV_TalkedToPlayer] == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Hagen_NoEnter_PissOff_Info()
{
	AI_Output(self,other,"DIA_Pyrokar_NoEnter_PissOff_01_00");	//Хммм...(сердито)
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuildEnemy,0);
};

var int Hagen_LastPetzCounter;
var int Hagen_LastPetzCrime;

instance DIA_Hagen_PMSchulden(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 1;
	condition = DIA_Hagen_PMSchulden_Condition;
	information = DIA_Hagen_PMSchulden_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Hagen_PMSchulden_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Hagen_Schulden > 0) && (B_GetGreatestPetzCrime(self) <= Hagen_LastPetzCrime) && (MIS_ORсGREATWAR == FALSE))
	{
		return TRUE;
	};
};

func void dia_hagen_petzmaster_attackmurder()
{
	var string concatText;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_HumanMurderedHuman,0);
	GLOBAL_MAKE_BANDIT_FORCITY = 1;
	concatText = "Городские власти объявили вас вне закона!";
	AI_Print(concatText);
};

func void dia_hagen_pmschulden_attackmurder()
{
	var string concatText;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_HumanMurderedHuman,0);
	GLOBAL_MAKE_BANDIT_FORCITY = 1;
	concatText = "Городские власти объявили вас вне закона!";
	AI_Print(concatText);
};

func void DIA_Hagen_PMSchulden_Info()
{
	var int diff;
	var string concatText1;
	var string concatText2;
	var string concattextschulden;
	var string tsettext1;
	var string tsettext2;
	var string tsettext3;
	var int temp1;
	AI_Output(self,other,"DIA_Hagen_PMSchulden_04_00");	//Хорошо, что ты пришел. Ты можешь заплатить штраф прямо сейчас.
	temp1 = 0;
	if(GLOBAL_CITY_MURDER > 5)
	{
		temp1 = 1;
	};
	if(GLOBAL_CITY_THEFT > 20)
	{
		temp1 = 1;
	};
	if(GLOBAL_CITY_ATTACK > 10)
	{
		temp1 = 1;
	};
	if(temp1 == 1)
	{
		if(GLOBAL_CITY_MURDER > 5)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_CITY_MURDER),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_MURDERCOUNT2_CITY);
			tsettext3 = ConcatStrings(PRINT_MURDERCOUNT_CITY,tsettext2);
			AI_Output(self,other,"DIA_Hagen_PMSchulden_08_36");	//Но, боюсь, в данном случае никакой штраф тебя уже не спасет от виселицы.
			AI_Output(self,other,"DIA_Hagen_PMSchulden_08_37");	//Твои постоянные убийства ни в чем неповинных людей не могут продолжаться более безнаказанно.
			AI_Output(self,other,"DIA_Hagen_PMSchulden_08_38");	//И посему властью, данной мне Инносом и Королем, я приговариваю тебя к смерти...
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other,"DIA_Hagen_PMSchulden_08_39");	//Во имя Инноса! Умри!
		}
		else if(GLOBAL_CITY_ATTACK > 10)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_CITY_ATTACK),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_ATTACKCOUNT2_CITY);
			tsettext3 = ConcatStrings(PRINT_ATTACKCOUNT_CITY,tsettext2);
			AI_Output(self,other,"DIA_Hagen_PMSchulden_08_40");	//Но, боюсь, в данном случае никакой штраф тебя уже не спасет от виселицы.
			AI_Output(self,other,"DIA_Hagen_PMSchulden_08_41");	//Твои постоянные нападения на граждан этого города не могут для тебя продолжаться более безнаказанно.
			AI_Output(self,other,"DIA_Hagen_PMSchulden_08_42");	//И посему властью, данной мне Инносом и Королем, я приговариваю тебя к смерти...
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other,"DIA_Hagen_PMSchulden_08_43");	//Во имя Инноса! Умри!
		}
		else if(GLOBAL_CITY_THEFT > 20)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_CITY_THEFT),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_THEFTCOUNT2_CITY);
			tsettext3 = ConcatStrings(PRINT_THEFTCOUNT_CITY,tsettext2);
			AI_Output(self,other,"DIA_Hagen_PMSchulden_08_44");	//Но, боюсь, в данном случае, никакой штраф тебя уже не спасет от виселицы.
			AI_Output(self,other,"DIA_Hagen_PMSchulden_08_45");	//Ты - грязный вор! Таким законченным ворам, как ты там уготовленно отличное место!
			AI_Output(self,other,"DIA_Hagen_PMSchulden_08_46");	//И посему властью, данной мне Инносом и Королем, я приговариваю тебя к смерти...
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other,"DIA_Hagen_PMSchulden_08_47");	//Во имя Инноса! Умри!
		};
		Log_CreateTopic(TOPIC_DIPLOM,LOG_NOTE);
		B_LogEntry(TOPIC_DIPLOM,"Я испортил свои отношения с паладинами, из-за постоянных моих бесчинств в городе. Теперь меня там считают бандитом!");
		Info_ClearChoices(DIA_Hagen_PMSchulden);
		Info_ClearChoices(DIA_Hagen_PETZMASTER);
		Info_AddChoice(DIA_Hagen_PMSchulden,"Постой!...(пора сматываться)",dia_hagen_pmschulden_attackmurder);
	}
	else
	{
		if(B_GetTotalPetzCounter(self) > Hagen_LastPetzCounter)
		{
			diff = B_GetTotalPetzCounter(self) - Hagen_LastPetzCounter;
			if(diff > 0)
			{
				Hagen_Schulden = Hagen_Schulden + (diff * 250);
			};
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_01");	//Ты не очень-то серьезно относишься к законам города, да?
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_02");	//Список твоих преступлений все растет и растет.
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_03");	//И не говори мне, что ты не знал этого...
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_04");	//Ты заплатишь максимальный штраф!
			AI_Output(other,self,"DIA_Hagen_PMAdd_15_00A");	//Сколько?
			if(Hagen_Schulden <= 1000)
			{
				B_Say_Gold(self,other,Hagen_Schulden);
			}
			else
			{
				concatText1 = ConcatStrings(IntToString(Hagen_Schulden),"");
				concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
				concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
				AI_Print(concattextschulden);
			};
		}
		else if(B_GetGreatestPetzCrime(self) < Hagen_LastPetzCrime)
		{
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_05");	//Похоже, ситуация изменилась.
			if(Hagen_LastPetzCrime == CRIME_MURDER)
			{
				AI_Output(self,other,"DIA_Hagen_PMSchulden_04_06");	//Больше нет свидетелей убийства, совершенного тобой.
				GLOBAL_CITY_MURDER = GLOBAL_CITY_MURDER - 1;
				if(GLOBAL_CITY_MURDER < 0)
				{
					GLOBAL_CITY_MURDER = 0;
				};
			};
			if((Hagen_LastPetzCrime == CRIME_THEFT) || ((Hagen_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT)))
			{
				AI_Output(self,other,"DIA_Hagen_PMSchulden_04_07");	//Никто теперь не может подтвердить, что ты воровал.
				GLOBAL_CITY_THEFT = GLOBAL_CITY_THEFT - 1;
				if(GLOBAL_CITY_THEFT < 0)
				{
					GLOBAL_CITY_THEFT = 0;
				};
			};
			if((Hagen_LastPetzCrime == CRIME_ATTACK) || ((Hagen_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK)))
			{
				AI_Output(self,other,"DIA_Hagen_PMSchulden_04_08");	//Больше нет свидетелей твоей драки.
				GLOBAL_CITY_ATTACK = GLOBAL_CITY_ATTACK - 1;
				if(GLOBAL_CITY_ATTACK < 0)
				{
					GLOBAL_CITY_ATTACK = 0;
				};
			};
			if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
			{
				AI_Output(self,other,"DIA_Hagen_PMSchulden_04_09");	//Все обвинения против тебя больше не находят подтверждений.
			};
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_10");	//Я не знаю, что случилось в городе - и не хочу знать.
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_11");	//Просто позаботься, чтобы у тебя не было проблем здесь.
			if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
			{
				AI_Output(self,other,"DIA_Hagen_PMSchulden_04_12");	//Как бы то ни было, я решил простить твои прегрешения.
				AI_Output(self,other,"DIA_Hagen_PMSchulden_04_13");	//Смотри, чтобы этого больше не повторялось.
				Hagen_Schulden = 0;
				Hagen_LastPetzCounter = 0;
				Hagen_LastPetzCrime = CRIME_NONE;
			}
			else
			{
				AI_Output(self,other,"DIA_Hagen_PMSchulden_04_14");	//Ты, тем не менее, заплатишь штраф в полном объеме.
				AI_Output(other,self,"DIA_Hagen_PMAdd_15_00B");	//Сколько?
				if(Hagen_Schulden <= 1000)
				{
					B_Say_Gold(self,other,Hagen_Schulden);
				}
				else
				{
					concatText1 = ConcatStrings(IntToString(Hagen_Schulden),"");
					concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
					concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
					AI_Print(concattextschulden);
				};
				AI_Output(self,other,"DIA_Hagen_PMSchulden_04_15");	//Итак, ты будешь платить?
			};
		};
		if(B_GetGreatestPetzCrime(self) != CRIME_NONE)
		{
			Info_ClearChoices(DIA_Hagen_PMSchulden);
			Info_ClearChoices(DIA_Hagen_PETZMASTER);
			Info_AddChoice(DIA_Hagen_PMSchulden,"У меня недостаточно золота!",DIA_Hagen_PETZMASTER_PayLater);
			Info_AddChoice(DIA_Hagen_PMSchulden,"Сколько я должен заплатить?",DIA_Hagen_PMSchulden_HowMuchAgain);
			if(Npc_HasItems(other,ItMi_Gold) >= Hagen_Schulden)
			{
				Info_AddChoice(DIA_Hagen_PMSchulden,"Я хочу заплатить штраф.",DIA_Hagen_PETZMASTER_PayNow);
			};
		};
	};
};

func void DIA_Hagen_PMSchulden_HowMuchAgain()
{
	var string concatText1;
	var string concatText2;
	var string concattextschulden;
	AI_Output(other,self,"DIA_Hagen_PMSchulden_HowMuchAgain_15_00");	//Сколько там на этот раз?
	if(Hagen_Schulden <= 1000)
	{
		B_Say_Gold(self,other,Hagen_Schulden);
	}
	else
	{
		concatText1 = ConcatStrings(IntToString(Hagen_Schulden),"");
		concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
		concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
		AI_Print(concattextschulden);
	};
	Info_ClearChoices(DIA_Hagen_PMSchulden);
	Info_ClearChoices(DIA_Hagen_PETZMASTER);
	Info_AddChoice(DIA_Hagen_PMSchulden,"У меня нет столько золота!",DIA_Hagen_PETZMASTER_PayLater);
	Info_AddChoice(DIA_Hagen_PMSchulden,"Сколько там нужно?",DIA_Hagen_PMSchulden_HowMuchAgain);
	if(Npc_HasItems(other,ItMi_Gold) >= Hagen_Schulden)
	{
		Info_AddChoice(DIA_Hagen_PMSchulden,"Я хочу заплатить штраф!",DIA_Hagen_PETZMASTER_PayNow);
	};
};


instance DIA_Hagen_PETZMASTER(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 1;
	condition = DIA_Hagen_PETZMASTER_Condition;
	information = DIA_Hagen_PETZMASTER_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Hagen_PETZMASTER_Condition()
{
	if((B_GetGreatestPetzCrime(self) > Hagen_LastPetzCrime) && (MIS_ORсGREATWAR == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hagen_PETZMASTER_Info()
{
	var string concatText1;
	var string concatText2;
	var string concattextschulden;
	var string tsettext1;
	var string tsettext2;
	var string tsettext3;
	var int temp1;
	Hagen_Schulden = 0;
	if(self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_00");	//Твоя слава опережает тебя. Ты нарушил законы города!
	};
	temp1 = 0;
	if(GLOBAL_CITY_MURDER > 5)
	{
		temp1 = 1;
	};
	if(GLOBAL_CITY_THEFT > 20)
	{
		temp1 = 1;
	};
	if(GLOBAL_CITY_ATTACK > 10)
	{
		temp1 = 1;
	};
	if(temp1 == 1)
	{
		if(GLOBAL_CITY_MURDER > 5)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_CITY_MURDER),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_MURDERCOUNT2_CITY);
			tsettext3 = ConcatStrings(PRINT_MURDERCOUNT_CITY,tsettext2);
			AI_Output(self,other,"DIA_Hagen_PETZMASTER_08_48");	//Но, боюсь, в данном случае никакой штраф тебя уже не спасет от виселицы.
			AI_Output(self,other,"DIA_Hagen_PETZMASTER_08_49");	//Твои постоянные убийства ни в чем неповинных людей не могут продолжаться более безнаказанно.
			AI_Output(self,other,"DIA_Hagen_PETZMASTER_08_50");	//И посему властью, данной мне Инносом и Королем, я приговариваю тебя к смерти...
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other,"DIA_Hagen_PETZMASTER_08_51");	//Во имя Инноса! Умри!
		}
		else if(GLOBAL_CITY_ATTACK > 10)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_CITY_ATTACK),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_ATTACKCOUNT2_CITY);
			tsettext3 = ConcatStrings(PRINT_ATTACKCOUNT_CITY,tsettext2);
			AI_Output(self,other,"DIA_Hagen_PETZMASTER_08_52");	//Но, боюсь, в данном случае никакой штраф тебя уже не спасет от виселицы.
			AI_Output(self,other,"DIA_Hagen_PETZMASTER_08_53");	//Твои постоянные нападения на граждан этого города не могут для тебя продолжаться более безнаказанно.
			AI_Output(self,other,"DIA_Hagen_PETZMASTER_08_54");	//И посему властью, данной мне Инносом и Королем, я приговариваю тебя к смерти...
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other,"DIA_Hagen_PETZMASTER_08_55");	//Во имя Инноса! Умри!
		}
		else if(GLOBAL_CITY_THEFT > 20)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_CITY_THEFT),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_THEFTCOUNT2_CITY);
			tsettext3 = ConcatStrings(PRINT_THEFTCOUNT_CITY,tsettext2);
			AI_Output(self,other,"DIA_Hagen_PETZMASTER_08_56");	//Но, боюсь, в данном случае никакой штраф тебя уже не спасет от виселицы.
			AI_Output(self,other,"DIA_Hagen_PETZMASTER_08_57");	//Ты - грязный вор! Таким законченным ворам, как ты, там уготовленно отличное место!
			AI_Output(self,other,"DIA_Hagen_PETZMASTER_08_58");	//И посему властью, данной мне Инносом и Королем, я приговариваю тебя к смерти...
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other,"DIA_Hagen_PETZMASTER_08_59");	//Во имя Инноса! Умри!
		};
		Log_CreateTopic(TOPIC_DIPLOM,LOG_NOTE);
		B_LogEntry(TOPIC_DIPLOM,"Я испортил свои отношения с паладинами, из-за постоянных моих бесчинств в городе. Теперь меня там считают бандитом!");
		Info_ClearChoices(DIA_Hagen_PMSchulden);
		Info_ClearChoices(DIA_Hagen_PETZMASTER);
		Info_AddChoice(DIA_Hagen_PETZMASTER,"Постой!...(пора сматываться)",dia_hagen_petzmaster_attackmurder);
	}
	else
	{
		if(B_GetGreatestPetzCrime(self) == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_01");	//Ты влип в дерьмо по уши!
			AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_02");	//Убийство - серьезное преступление!
			Hagen_Schulden = B_GetTotalPetzCounter(self) * 1500;
			if((PETZCOUNTER_City_Theft + PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
			{
				AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_03");	//Не говоря уже о других обвинениях!
			};
			AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_04");	//Страже приказано казнить убийц на месте.
			AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_05");	//Убийства неприемлемы в этом городе, но ты можешь подтвердить свое раскаяние, заплатив штраф!
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_THEFT)
		{
			AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_06");	//Ты обвинен в краже!
			if((PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
			{
				AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_07");	//Не говоря уже о других преступлениях, о которых я слышал.
			};
			AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_08");	//Это нарушение законов города. Ты должен заплатить штраф.
			Hagen_Schulden = B_GetTotalPetzCounter(self) * 500;
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
		{
			AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_09");	//Ты ввязался в драку. Таким образом, ты нарушил закон.
			if(PETZCOUNTER_City_Sheepkiller > 0)
			{
				AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_10");	//А что там еще с овцой?
			};
			AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_11");	//Нарушение законов города - это нарушение законов Инноса.
			AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_12");	//Следовательно, ты должен заплатить за это.
			Hagen_Schulden = B_GetTotalPetzCounter(self) * 750;
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER)
		{
			AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_13");	//Ты убил нашу овцу - я сначала даже не поверил в это!
			AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_14");	//Зачем ты делаешь все это?
			AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_15");	//Ты должен заплатить компенсацию!
			Hagen_Schulden = 250;
		};
		AI_Output(other,self,"DIA_Hagen_PETZMASTER_15_16");	//Сколько?
		if(Hagen_Schulden <= 1000)
		{
			B_Say_Gold(self,other,Hagen_Schulden);
		}
		else
		{
			concatText1 = ConcatStrings(IntToString(Hagen_Schulden),"");
			concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
			concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
			AI_Print(concattextschulden);
		};
		Info_ClearChoices(DIA_Hagen_PMSchulden);
		Info_ClearChoices(DIA_Hagen_PETZMASTER);
		Info_AddChoice(DIA_Hagen_PETZMASTER,"У меня недостаточно золота!",DIA_Hagen_PETZMASTER_PayLater);
		if(Npc_HasItems(other,ItMi_Gold) >= Hagen_Schulden)
		{
			Info_AddChoice(DIA_Hagen_PETZMASTER,"Я хочу заплатить штраф.",DIA_Hagen_PETZMASTER_PayNow);
		};
	};
};

func void DIA_Hagen_PETZMASTER_PayNow()
{
	AI_Output(other,self,"DIA_Hagen_PETZMASTER_PayNow_15_00");	//Я хочу заплатить штраф!
	B_GiveInvItems(other,self,ItMi_Gold,Hagen_Schulden);
	AI_Output(self,other,"DIA_Hagen_PETZMASTER_PayNow_04_01");	//Хорошо! Я позабочусь, чтобы все в городе узнали об этом. Это в некоторой степени восстановит твою репутацию.
	B_GrantAbsolution(LOC_CITY);
	Hagen_Schulden = 0;
	Hagen_LastPetzCounter = 0;
	Hagen_LastPetzCrime = CRIME_NONE;
	Info_ClearChoices(DIA_Hagen_PETZMASTER);
	Info_ClearChoices(DIA_Hagen_PMSchulden);
};

func void DIA_Hagen_PETZMASTER_PayLater()
{
	AI_Output(other,self,"DIA_Hagen_PETZMASTER_PayLater_15_00");	//У меня нет столько золота!
	AI_Output(self,other,"DIA_Hagen_PETZMASTER_PayLater_04_01");	//Тогда позаботься о том, чтобы раздобыть это золото как можно быстрее.
	AI_Output(self,other,"DIA_Hagen_PETZMASTER_PayLater_04_02");	//И я предупреждаю тебя: если ты при этом усугубишь свою вину, на пощаду не рассчитывай.
	Hagen_LastPetzCounter = B_GetTotalPetzCounter(self);
	Hagen_LastPetzCrime = B_GetGreatestPetzCrime(self);
	AI_StopProcessInfos(self);
};


instance DIA_Lord_Hagen_Hallo(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 2;
	condition = DIA_Lord_Hagen_Hallo_Condition;
	information = DIA_Lord_Hagen_Hallo_Info;
	important = TRUE;
	permanent = FALSE;
};


func int DIA_Lord_Hagen_Hallo_Condition()
{
	if((hero.guild != GIL_NONE) && (self.aivar[AIV_TalkedToPlayer] == FALSE) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_Hallo_Info()
{
	AI_Output(self,other,"DIA_Lord_Hagen_Hallo_04_00");	//Я уже слышал о тебе.

	if(Npc_KnowsInfo(other,DIA_Lothar_EyeInnos) || (Andre_EyeInnos == TRUE))
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Add_04_03");	//Лотар докладывал, что ты хочешь поговорить со мной.
		AI_Output(self,other,"DIA_Lord_Hagen_Hallo_04_01");	//Ты чужеземец, который требует Глаз Инноса.
	};
	AI_Output(self,other,"DIA_Lord_Hagen_Hallo_04_02");	//Я лорд Хаген.
	AI_Output(self,other,"DIA_Lord_Hagen_Hallo_04_03");	//Паладин короля, воин нашего владыки Инноса и главнокомандующий Хориниса.
	AI_Output(self,other,"DIA_Lord_Hagen_Hallo_04_04");	//Я очень занятой человек. Поэтому не трать мое время попусту. А теперь скажи, зачем ты здесь.
	HagenFTMeet = TRUE;
};


instance DIA_Lord_Hagen_Frieden(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 2;
	condition = DIA_Lord_Hagen_Frieden_Condition;
	information = DIA_Lord_Hagen_Frieden_Info;
	permanent = FALSE;
	description = "Я принес предложение мира от наемников!";
};


func int DIA_Lord_Hagen_Frieden_Condition()
{
	if((MIS_Lee_Friedensangebot == LOG_Running) && (Npc_HasItems(other,ItWr_Passage_MIS) > 0))
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_Frieden_Info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Frieden_15_00");	//Я принес предложение мира от наемников!
	B_GiveInvItems(other,self,ItWr_Passage_MIS,1);
	AI_Output(self,other,"DIA_Lord_Hagen_Frieden_04_01");	//(раздражительно) Хм... покажи!
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Lord_Hagen_Frieden_04_02");	//Я знаю генерала Ли. Мне также известно об обстоятельствах, при которых он был приговорен к исправительным работам в колонии.
	AI_Output(self,other,"DIA_Lord_Hagen_Frieden_04_03");	//Я считаю его благородным человеком. Я готов даровать ему помилование - но только ему!
	AI_Output(self,other,"DIA_Lord_Hagen_Frieden_04_04");	//Это не касается его людей, впрочем. Большинство из них - отъявленные головорезы и заслуживают наказания!
	AI_Output(self,other,"DIA_Lord_Hagen_Frieden_04_05");	//Я ни за что не помилую их. Можешь так и передать Ли.
	Hagen_FriedenAbgelehnt = TRUE;
	if(!Npc_KnowsInfo(other,DIA_Lord_Hagen_Armee))
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Frieden_04_06");	//Это все?
	};
	B_LogEntry(TOPIC_Frieden,"Лорд Хаген готов даровать прощение Ли, но не другим наемникам.");
};


instance DIA_LORD_HAGEN_WATERLETTER(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 2;
	condition = dia_lord_hagen_waterletter_condition;
	information = dia_lord_hagen_waterletter_info;
	permanent = FALSE;
	description = "Я принес письмо от Сатураса.";
};


func int dia_lord_hagen_waterletter_condition()
{
	if((MIS_WATERMAGELETTER == LOG_Running) && (Npc_HasItems(other,itwr_watermageletter) >= 1))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_waterletter_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_WaterLetter_04_00");	//Я принес письмо от Сатураса.
	B_GiveInvItems(other,self,itwr_watermageletter,1);
	AI_Output(self,other,"DIA_Lord_Hagen_WaterLetter_04_01");	//(удивленно) Да? Очень интересно...
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Lord_Hagen_WaterLetter_04_02");	//Ну что же, я не вижу ни одной причины, почему бы мне стоило отказать этому благородному человеку.
	AI_Output(self,other,"DIA_Lord_Hagen_WaterLetter_04_03");	//Я немедленно распоряжусь, чтобы несколько паладинов отправились к магам Воды для охраны портала.
	AI_Output(self,other,"DIA_Lord_Hagen_WaterLetter_04_04");	//Ты же можешь передать это ему на словах.
	AI_Output(other,self,"DIA_Lord_Hagen_WaterLetter_04_05");	//Хорошо, я все понял.
	HAGENTAKELETTER = TRUE;
	B_LogEntry(TOPIC_WATERMAGELETTER,"Я передал письмо Сатураса главе паладинов. Лорд Хаген согласился выполнить просьбу мага и попросил меня передать ему, что пришлет несколько человек для охраны портала.");
};


instance DIA_Lord_Hagen_Auge(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 2;
	condition = DIA_Lord_Hagen_Auge_Condition;
	information = DIA_Lord_Hagen_Auge_Info;
	permanent = FALSE;
	description = "Что ты знаешь о Глазе Инноса? ";
};


func int DIA_Lord_Hagen_Auge_Condition()
{
	if(KAPITELORCATC == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_Auge_Info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Auge_15_00");	//Что ты знаешь о Глазе Инноса?
	AI_Output(self,other,"DIA_Lord_Hagen_Auge_04_01");	//Это божественный артефакт...(задумчиво) В древних пророчествах он упоминается в связи с драконами.
	AI_Output(self,other,"DIA_Lord_Hagen_Auge_04_02");	//Однако писания также говорят, что его может носить только избранный Инноса.

	if(other.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Lord_Hagen_Auge_15_03");	//Я и есть - избранный Инноса!
		AI_Output(self,other,"DIA_Lord_Hagen_Auge_04_04");	//Тогда, возможно, ты действительно достоин получить этот амулет.
	};
};


instance DIA_Lord_Hagen_Armee(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 1;
	condition = DIA_Lord_Hagen_Armee_Condition;
	information = DIA_Lord_Hagen_Armee_Info;
	permanent = FALSE;
	description = "Силы зла собираются очень близко отсюда!";
};


func int DIA_Lord_Hagen_Armee_Condition()
{
	if(KAPITELORCATC == FALSE)
	{
		if((Hagen_FriedenAbgelehnt == TRUE) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
		{
			return TRUE;
		};
		if((hero.guild == GIL_NDW) || (hero.guild == GIL_KDF) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR) || (hero.guild == GIL_TPL) || (hero.guild == GIL_MIL))
		{
			return TRUE;
		};
	};
};

func void DIA_Lord_Hagen_Armee_Info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Armee_15_00");	//Силы зла собираются очень близко отсюда. В Долине Рудников!
	AI_Output(self,other,"DIA_Lord_Hagen_Armee_04_01");	//В Долине Рудников? Мы отправили туда экспедицию. До нас также доходили сведения, что Проход оккупирован орками.
	AI_Output(self,other,"DIA_Lord_Hagen_Armee_04_02");	//Но до сего момента до меня не доходило никаких сведений об армии Зла.
	if(Npc_KnowsInfo(other,DIA_Lord_Hagen_Frieden))
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Armee_04_03");	//Это, что, такая уловка, чтобы я поверил, что мне необходимо заключить союз с наемниками?
		AI_Output(other,self,"DIA_Lord_Hagen_Armee_15_04");	//Нет.
	};
	AI_Output(self,other,"DIA_Lord_Hagen_Armee_04_05");	//И что это за армия?...(скептически)
	AI_Output(other,self,"DIA_Lord_Hagen_Armee_15_06");	//Армия драконов, которые собрали вокруг себя орды прислужников.
	AI_Output(self,other,"DIA_Lord_Hagen_Armee_04_07");	//Драконы?! Согласно старинным писаниям, драконов не видели уже много веков.
	AI_Output(self,other,"DIA_Lord_Hagen_Armee_04_08");	//Скажи мне - почему я должен верить тому, что ты говоришь?
	AI_Output(other,self,"DIA_Lord_Hagen_Armee_15_09");	//Вопрос не в том, должен ли ты мне верить. Вопрос в том, можешь ли ты себе позволить НЕ поверить мне в случае, если я говорю правду.
	AI_Output(self,other,"DIA_Lord_Hagen_Armee_04_10");	//Пока я не получу доказательств, я не могу позволить себе послать еще людей туда.
	AI_Output(other,self,"DIA_Lord_Hagen_Proof_15_00");	//То есть, ты хочешь, чтобы я принес тебе доказательства?
	AI_Output(self,other,"DIA_Lord_Hagen_Proof_04_01");	//Совершенно верно!
	AI_Output(self,other,"DIA_Lord_Hagen_Proof_01_00");	//Если твои слова подтвердятся, тогда я готов помочь тебе.
	AI_Output(other,self,"DIA_Lord_Hagen_Proof_15_04");	//Значит ли это, что бы отдашь мне 'Глаз Инноса'?
	AI_Output(self,other,"DIA_Lord_Hagen_Proof_04_05");	//Глаз Инноса...(задумчиво)
	AI_Output(self,other,"DIA_Lord_Hagen_Armee_01_01");	//Принеси мне доказательства и я распоряжусь, чтобы тебе было позволено надеть этот амулет.
	AI_Output(other,self,"DIA_Lord_Hagen_Proof_15_06");	//То есть, я могу считать, что ты дал слово?
	AI_Output(self,other,"DIA_Lord_Hagen_Proof_04_07");	//Можешь! Так как я действительно дал его!
};


instance DIA_Lord_Hagen_Pass(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 1;
	condition = DIA_Lord_Hagen_Pass_Condition;
	information = DIA_Lord_Hagen_Pass_Info;
	permanent = TRUE;
	description = "Как я пройду через проход?";
};


func int DIA_Lord_Hagen_Pass_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lord_Hagen_Armee) && (Hagen_BringProof == FALSE) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_Pass_Info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Pass_15_00");	//Как я пройду через проход?

	if((hero.guild != GIL_NONE) && (MIS_Addon_Vatras_WhereAreMissingPeople == LOG_SUCCESS) && (MIS_Addon_Nefarius_BringMissingOrnaments == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Pass_01_01");	//У меня есть ключ, который откроет тебе ворота, ведущие в долину...(серьезно)

		if(MIS_ONARBUSINESS != LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Lord_Hagen_Pass_01_02");	//Однако, прежде чем я тебе его дам, ты должен будешь выполнить для меня другое, не менее важное поручение.
			AI_Output(other,self,"DIA_Lord_Hagen_Pass_01_03");	//В чем дело?
			AI_Output(self,other,"DIA_Lord_Hagen_Pass_01_04");	//По дошедшим до меня слухам, маги Воды нашли какой-то странный магический портал. Я хочу знать, что за ним скрывается!
			AI_Output(self,other,"DIA_Lord_Hagen_Pass_01_05");	//Выясни все, что сможешь. Заодно и посмотрим, на что ты способен.
			AI_Output(self,other,"DIA_Lord_Hagen_Pass_01_06");	//Ну а после этого я отдам тебе этот ключ.
			AI_Output(other,self,"DIA_Lord_Hagen_Pass_01_07");	//Я посмотрю что можно сделать.
			AI_Output(self,other,"DIA_Lord_Hagen_Pass_01_08");	//Тогда не теряй времени!
			MIS_RAVENTHREAT = LOG_Running;
			Log_CreateTopic(TOPIC_RAVENTHREAT,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_RAVENTHREAT,LOG_Running);
			B_LogEntry(TOPIC_RAVENTHREAT,"Прежде чем отправить меня в Долину Рудников, лорд Хаген хочет, чтобы я выяснил все о магическом портале, который недавно нашли маги Воды. Он хочет знать, что скрывается за всем этим и нет ли в этом какой-либо угрозы.");
		}
		else
		{
			AI_Output(self,other,"DIA_Lord_Hagen_Pass_01_09");	//Ты очень помог нам с провизией, и я дам тебе выбор:
			AI_Output(self,other,"DIA_Lord_Hagen_Pass_01_10");	//Или отправиться сразу в Долину Рудников...
			AI_Output(self,other,"DIA_Lord_Hagen_Pass_01_11");	//...или выяснить, что скрывается за порталом магов Воды.
			CHOOSE_WAY = TRUE;
		};

		Hagen_BringProof = TRUE;
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(VLK_418_Gritta,"TOT");
		AI_Teleport(Gritta,"TOT");
		B_Kapitelwechsel(2,NEWWORLD_ZEN);

		if(Fernando_ImKnast == FALSE)
		{
			B_StartOtherRoutine(Fernando,"WAIT");
		};

		Wld_InsertNpc(BDT_1020_Bandit_L,"NW_TROLLAREA_PATH_47");
	}
	else
	{
		if((MIS_Addon_Vatras_WhereAreMissingPeople != LOG_SUCCESS) || (MIS_Addon_Nefarius_BringMissingOrnaments != LOG_SUCCESS))
		{
			AI_Output(self,other,"DIA_Lord_Hagen_Pass_01_13");	//Вначале докажи, что ты сможешь за себя постоять и выполнить поручение.
			AI_Output(self,other,"DIA_Lord_Hagen_Pass_01_14");	//Помоги магам Воды решить их проблемы.
		}
		else if((hero.guild == GIL_NOV) || (hero.guild == GIL_NDM))
		{
			AI_Print(PRINT_Addon_GuildNeeded_NOV);
		}
		else
		{
			AI_Print(PRINT_Addon_GuildNeeded);
		};
	};
};


instance DIA_Lord_Hagen_Proof(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 2;
	condition = DIA_Lord_Hagen_Proof_Condition;
	information = DIA_Lord_Hagen_Proof_Info;
	permanent = FALSE;
	description = "Насчет твоего поручения...";
};


func int DIA_Lord_Hagen_Proof_Condition()
{
	if((MIS_RAVENTHREAT == LOG_Running) && (RavenAway == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_Proof_Info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Lord_Hagen_Proof_01_01");	//Насчет твоего поручения...
	AI_Output(self,other,"DIA_Lord_Hagen_Proof_01_02");	//Да? Тебе что-нибудь удалось выснить?
	AI_Output(other,self,"DIA_Lord_Hagen_Proof_01_05");	//Портал, найденный магами Воды, ведет в неизвестную нам часть острова.
	AI_Output(other,self,"DIA_Lord_Hagen_Proof_01_06");	//Судя по всему, когда-то там жил один очень древний народ, которому являл свое покровительство сам Аданос!
	AI_Output(other,self,"DIA_Lord_Hagen_Proof_01_07");	//Однако, по всей видимости, с тех давних времен прошло уже очень много лет и сейчас, кроме пиратов и бандитов, там больше никого нет.
	AI_Output(self,other,"DIA_Lord_Hagen_Proof_01_10");	//(задумчиво) Все это как-то подозрительно! Наверняка они что-то затевают.
	AI_Output(other,self,"DIA_Lord_Hagen_Proof_01_11");	//Не думаю.
	AI_Output(self,other,"DIA_Lord_Hagen_Proof_01_13");	//Ну, хорошо. Смотри, я полагаюсь на твои слова.
	AI_Output(self,other,"DIA_Lord_Hagen_Proof_01_16");	//Думаю, что этого пока будет вполне достаточно, чтобы контролировать общую ситуацию.
	MIS_RAVENTHREAT = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_RAVENTHREAT,LOG_SUCCESS);
	B_LogEntry(TOPIC_RAVENTHREAT,"Я рассказал лорду Хагену об всем, что мне удалось выяснить. Думаю, теперь я смогу отправиться в Долину Рудников, чтобы принести ему доказательства существования драконов.");
};


instance DIA_LORD_HAGEN_PROOFGIVEKEY(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 1;
	condition = dia_lord_hagen_proofgivekey_condition;
	information = dia_lord_hagen_proofgivekey_info;
	permanent = FALSE;
	description = "Теперь я могу отправиться в Долину Рудников?";
};


func int dia_lord_hagen_proofgivekey_condition()
{
	if((MIS_RAVENTHREAT == LOG_SUCCESS) || (CHOOSE_WAY == TRUE))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_proofgivekey_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_ProofGiveKey_01_01");	//Теперь я могу отправиться в Долину Рудников?
	AI_Output(self,other,"DIA_Lord_Hagen_ProofGiveKey_01_02");	//(серьезно) Да. Теперь можешь.
	AI_Output(self,other,"DIA_Lord_Hagen_Pass_04_01");	//Я дам тебе ключ от ворот прохода. Однако тебе самому придется решать, как пробраться через толпы орков.
	CreateInvItems(self,ItKe_Pass_MIS,1);
	B_GiveInvItems(self,other,ItKe_Pass_MIS,1);
	AI_Output(self,other,"DIA_Lord_Hagen_ProofGiveKey_01_03");	//Пройди через проход в Долину Рудников. Когда ты будешь там, найди нашу экспедицию, а когда ты найдешь их - поговори с командующим Гарондом.
	AI_Output(self,other,"DIA_Lord_Hagen_Proof_04_02");	//Вряд ли кто-то лучше его знает ситуацию там.
	AI_Output(self,other,"DIA_Lord_Hagen_Pass_04_02");	//Да защитит тебя Иннос!
	MIS_OLDWORLD = LOG_Running;
	Log_CreateTopic(Topic_MISOLDWORLD,LOG_MISSION);
	Log_SetTopicStatus(Topic_MISOLDWORLD,LOG_Running);
	B_LogEntry(Topic_MISOLDWORLD,"Лорд Хаген хочет, чтобы я принес ему доказательства присутствия армии Зла. Мне необходимо отправиться в Долину Рудников и поговорить с командующим Гарондом.");
	AI_StopProcessInfos(self);
};


instance DIA_Lord_Hagen_Khorinis(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 2;
	condition = DIA_Lord_Hagen_Khorinis_Condition;
	information = DIA_Lord_Hagen_Khorinis_Info;
	permanent = FALSE;
	description = "Зачем вы пришли в Хоринис?";
};


func int DIA_Lord_Hagen_Khorinis_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lord_Hagen_Armee) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_Khorinis_Info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Khorinis_15_00");	//Зачем вы пришли в Хоринис?
	AI_Output(self,other,"DIA_Lord_Hagen_Khorinis_04_01");	//Мы выполняем важное задание королевства. Приказы нам исходят непосредственно от короля Робара.
	AI_Output(self,other,"DIA_Lord_Hagen_Khorinis_04_02");	//Я говорил тебе, что мы отправили экспедицию в Долину Рудников. Это главная причина нашего присутствия здесь!

	if(((hero.guild == GIL_GUR) || (hero.guild == GIL_TPL)) && (MIS_PALADINWATCH == LOG_Running) && (IDOLORANQUESTIONONE == FALSE))
	{
		IDOLORANQUESTIONONE = TRUE;
		B_LogEntry(TOPIC_PALADINWATCH,"Мне удалось узнать кое-что о причине появления паладинов в Хоринисе. Приказ об их прибытии на остров поступил от самого короля Робара. По словам лорда Хагена, их миссия очень важна для судьбы королевства.");
	};
};


instance DIA_Lord_Hagen_Minental(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 2;
	condition = DIA_Lord_Hagen_Minental_Condition;
	information = DIA_Lord_Hagen_Minental_Info;
	permanent = TRUE;
	description = "А что ваши люди делают в Долине Рудников?";
};


func int DIA_Lord_Hagen_Minental_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lord_Hagen_Khorinis) && (KnowsPaladins_Ore == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_Minental_Info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Minental_15_00");	//А что ваши люди делают в Долине Рудников?
	if(Hagen_BringProof == FALSE)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Minental_04_01");	//Я не вижу причин рассказывать тебе об этом!
	}
	else
	{
		if(Garond.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			AI_Output(self,other,"DIA_Lord_Hagen_Minental_04_02");	//Ты был там. Ты должен знать.
		}
		else
		{
			AI_Output(self,other,"DIA_Lord_Hagen_Minental_04_03");	//Хорошо, так как ты все равно идешь туда, я все же расскажу тебе.
		};
		AI_Output(self,other,"DIA_Lord_Hagen_Minental_04_04");	//Причиной всему - магическая руда. Она может решить исход этой войны.
		AI_Output(self,other,"DIA_Lord_Hagen_Minental_04_05");	//Без достаточного количества оружия из магической руды у королевской армии нет ни единого шанса против элитных воинов орков.
		if(other.guild != GIL_SLD)
		{
			AI_Output(self,other,"DIA_Lord_Hagen_Minental_04_06");	//А шахты с магической рудой, находящиеся на острове, - последние, к которым у нас еще есть доступ.
		};
		AI_Output(self,other,"DIA_Lord_Hagen_Minental_04_07");	//Как только наш корабль будет загружен рудой, мы отправимся назад, на материк.
		KnowsPaladins_Ore = TRUE;
		AI_Output(other,self,"DIA_Lord_Hagen_Minental_15_08");	//Значит, война против орков идет плохо, да?
		AI_Output(self,other,"DIA_Lord_Hagen_Minental_04_09");	//Я и так сказал тебе слишком много.
		if(((hero.guild == GIL_GUR) || (hero.guild == GIL_TPL)) && (MIS_PALADINWATCH == LOG_Running) && (IDOLORANQUESTIONTWO == FALSE))
		{
			IDOLORANQUESTIONTWO = TRUE;
			B_LogEntry(TOPIC_PALADINWATCH,"Основной причиной, по которой паладины прибыли на этот остров, явилась магическая руда. Без достаточного количества оружия из магической руды армия короля не будет иметь ни единого шанса в войне против орков. Отряд, отправившийся в Долину Рудников, должен выяснить ситуацию с возможностью добычи руды на острове. После этого паладины планируют вернуться обратно на материк.");
		};
	};
};


instance DIA_Hagen_CanTeach(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 5;
	condition = DIA_Hagen_CanTeach_Condition;
	information = DIA_Hagen_CanTeach_Info;
	permanent = FALSE;
	description = "Я ищу мастера-мечника.";
};


func int DIA_Hagen_CanTeach_Condition()
{
	if((LordHagen_Teach2H == FALSE) && (other.guild == GIL_PAL) && (other.aivar[REAL_TALENT_2H] >= 90) && (other.aivar[REAL_TALENT_2H] < 100))
	{
		return TRUE;
	};
};

func void DIA_Hagen_CanTeach_Info()
{
	AI_Output(other,self,"DIA_Hagen_CanTeach_15_00");	//Я ищу мастера-мечника.
	AI_Output(self,other,"DIA_Hagen_CanTeach_04_01");	//Да? Считай, что ты нашел его.
	LordHagen_Teach2H = TRUE;
	B_LogEntry(TOPIC_CityTeacher,"Лорд Хаген может обучить меня сражаться двуручным оружием.");
};


instance DIA_Hagen_Teach(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 100;
	condition = DIA_Hagen_Teach_Condition;
	information = DIA_Hagen_Teach_Info;
	permanent = TRUE;
	description = "Давайте начнем тренировку.";
};


func int DIA_Hagen_Teach_Condition()
{
	if((LordHagen_Teach2H == TRUE) && (DIA_Hagen_Teach_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hagen_Teach_Info()
{
	AI_Output(other,self,"DIA_Hagen_Teach_15_00");	//Приступим к обучению!
	Info_ClearChoices(DIA_Hagen_Teach);
	Info_AddChoice(DIA_Hagen_Teach,Dialog_Back,DIA_Hagen_Teach_Back);
	Info_AddChoice(DIA_Hagen_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Hagen_Teach_2H_1);
	Info_AddChoice(DIA_Hagen_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Hagen_Teach_2H_5);
};

func void DIA_Hagen_Teach_Back()
{
	if(other.HitChance[NPC_TALENT_2H] >= 100)
	{
		AI_Output(self,other,"DIA_Hagen_Teach_04_00");	//Ты стал великолепным мечником! Мне больше нечему учить тебя.
		AI_Output(self,other,"DIA_Hagen_Teach_04_01");	//Да ведет твою руку в будущих свершениях мудрость мастера-мечника.
		DIA_Hagen_Teach_permanent = TRUE;
	};
	Info_ClearChoices(DIA_Hagen_Teach);
};

func void DIA_Hagen_Teach_2H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,100);
	Info_ClearChoices(DIA_Hagen_Teach);
	Info_AddChoice(DIA_Hagen_Teach,Dialog_Back,DIA_Hagen_Teach_Back);
	Info_AddChoice(DIA_Hagen_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Hagen_Teach_2H_1);
	Info_AddChoice(DIA_Hagen_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Hagen_Teach_2H_5);
};

func void DIA_Hagen_Teach_2H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,100);
	Info_ClearChoices(DIA_Hagen_Teach);
	Info_AddChoice(DIA_Hagen_Teach,Dialog_Back,DIA_Hagen_Teach_Back);
	Info_AddChoice(DIA_Hagen_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Hagen_Teach_2H_1);
	Info_AddChoice(DIA_Hagen_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Hagen_Teach_2H_5);
};


instance DIA_Lord_Hagen_Knight(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 990;
	condition = DIA_Lord_Hagen_Knight_Condition;
	information = DIA_Lord_Hagen_Knight_Info;
	permanent = TRUE;
	description = "Я хочу поступить на службу в орден.";
};

func int DIA_Lord_Hagen_Knight_Condition()
{
	if(other.guild == GIL_MIL)
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_Knight_Info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Knight_15_00");	//Я хочу поступить на службу в орден.

	if(MIS_RescueBennet == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Knight_04_01");	//Хорошо, ты доказал, что у тебя есть мужество, опыт и знания, чтобы служить Инносу.
		AI_Output(self,other,"DIA_Lord_Hagen_Knight_04_02");	//Твои дела свидетельствуют о том, что у тебя чистое сердце.
		AI_Output(self,other,"DIA_Lord_Hagen_Knight_04_03");	//Если таково твое желание, наш орден с радостью примет тебя.
		Info_ClearChoices(DIA_Lord_Hagen_Knight);
		Info_AddChoice(DIA_Lord_Hagen_Knight,"Я еще не совсем уверен.",DIA_Lord_Hagen_Knight_No);
		Info_AddChoice(DIA_Lord_Hagen_Knight,"Я готов!",DIA_Lord_Hagen_Knight_Yes);
	}
	else
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Knight_04_04");	//Стать воином Инноса означает полностью посвятить себя служению Инносу.
		AI_Output(self,other,"DIA_Lord_Hagen_Knight_04_05");	//Только самые благородные и мужественные воины могут быть приняты в орден.
		AI_Output(self,other,"DIA_Lord_Hagen_Knight_04_06");	//Если ты твердо решил стать паладином, ты должен доказать, что достоин этого.
	};
	Hagen_GaveInfoKnight = TRUE;
};

func void DIA_Lord_Hagen_Knight_No()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Knight_No_15_00");	//Я еще не совсем уверен.
	AI_Output(self,other,"DIA_Lord_Hagen_Knight_No_04_01");	//Тогда иди и освободи свое сердце от сомнений. Возвращайся, когда будешь готов.
	Info_ClearChoices(DIA_Lord_Hagen_Knight);
};

func void DIA_Lord_Hagen_Knight_Yes()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Knight_Yes_15_00");	//Я готов!
	AI_Output(self,other,"DIA_Lord_Hagen_Knight_Yes_04_01");	//(торжественно) Тогда так тому и быть!
	AI_Output(self,other,"DIA_Lord_Hagen_Knight_Yes_04_02");	//Много людей вступило на этот путь и отдало свои жизни во имя Инноса.
	AI_Output(self,other,"DIA_Lord_Hagen_Knight_Yes_04_03");	//Ты клянешься, что твои дела не опозорят их честь и будут прославлять Инноса?
	AI_Output(other,self,"DIA_Lord_Hagen_Knight_Yes_15_04");	//Клянусь!
	AI_Output(self,other,"DIA_Lord_Hagen_Knight_Yes_04_05");	//Тогда отныне ты принадлежишь к нашему братству.
	AI_Output(self,other,"DIA_Lord_Hagen_Knight_Yes_04_06");	//Я произвожу тебя в воины Инноса.
	AI_Output(self,other,"DIA_Lord_Hagen_Knight_Yes_04_07");	//Я даю тебе оружие и доспехи рыцаря. Носи их с гордостью, рыцарь!
	CreateInvItems(self,ItAr_PAL_M,1);
	B_GiveInvItems(self,other,ItAr_PAL_M,1);

	if(other.HitChance[NPC_TALENT_2H] >= other.HitChance[NPC_TALENT_1H])
	{
		CreateInvItems(self,ItMw_2h_Pal_Sword,1);
		B_GiveInvItems(self,other,ItMw_2h_Pal_Sword,1);
	}
	else
	{
		CreateInvItems(self,ItMw_1h_Pal_Sword,1);
		B_GiveInvItems(self,other,ItMw_1h_Pal_Sword,1);
	};

	AI_Output(self,other,"DIA_Lord_Hagen_Knight_Yes_04_08");	//С этого времени благодаря твоему рангу ты будешь иметь доступ в монастырь.
	if(Npc_IsDead(Albrecht) == FALSE)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Knight_Yes_04_09");	//Альбрехт научит тебя магии, иди и поговори с ним.
	};
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_02");	//И, конечно же, наши казармы в верхней части города всегда открыты для тебя.

	if(CanTeachTownMaster == FALSE)
	{
		MIS_PathFromDown = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_PathFromDown,LOG_SUCCESS);
		CanTeachTownMaster = TRUE;
	};

	hero.guild = GIL_PAL;
	CheckHeroGuild[0] = TRUE;
	Snd_Play("GUILD_INV");
	Info_ClearChoices(DIA_Lord_Hagen_Knight);
};

instance DIA_Lord_Hagen_WhatProof(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 991;
	condition = DIA_Lord_Hagen_WhatProof_Condition;
	information = DIA_Lord_Hagen_WhatProof_Info;
	permanent = FALSE;
	description = "Как я могу доказать, что достоин?";
};

func int DIA_Lord_Hagen_WhatProof_Condition()
{
	if((Hagen_GaveInfoKnight == TRUE) && (MIS_RescueBennet != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_WhatProof_Info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_WhatProof_15_00");	//Как я могу доказать, что достоин?
	AI_Output(self,other,"DIA_Lord_Hagen_WhatProof_04_01");	//Твои дела покажут, достоин ты или нет.
	AI_Output(self,other,"DIA_Lord_Hagen_WhatProof_04_02");	//Мы сражаемся за свободу и справедливость во имя Инноса.
	AI_Output(self,other,"DIA_Lord_Hagen_WhatProof_04_03");	//Мы сражаемся против Белиара и его приспешников, которые жаждут уничтожить орден Инноса.
	AI_Output(other,self,"DIA_Lord_Hagen_WhatProof_15_04");	//Я понимаю.
	AI_Output(self,other,"DIA_Lord_Hagen_WhatProof_04_05");	//Ты ничего не понимаешь! Наша честь - наша жизнь, а наша жизнь - Иннос.
	AI_Output(self,other,"DIA_Lord_Hagen_WhatProof_04_06");	//Паладин идет в бой с именем Инноса на устах, и многие из нас положили свою жизнь на алтарь вечной борьбы Добра со Злом.
	AI_Output(self,other,"DIA_Lord_Hagen_WhatProof_04_07");	//Все мы как один посвятили себя этой борьбе. Если мы потерпим поражение, мы оскверним память наших павших товарищей.
	AI_Output(self,other,"DIA_Lord_Hagen_WhatProof_04_08");	//Только тот, кто сердцем понимает это, достоин быть паладином.
};


instance DIA_Lord_Hagen_KAP3_EXIT(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 999;
	condition = DIA_Lord_Hagen_KAP3_EXIT_Condition;
	information = DIA_Lord_Hagen_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lord_Hagen_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


var int Hagen_KnowsEyeKaputt;

instance DIA_Lord_Hagen_KAP3U4_PERM(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 998;
	condition = DIA_Lord_Hagen_KAP3U4_PERM_Condition;
	information = DIA_Lord_Hagen_KAP3U4_PERM_Info;
	permanent = TRUE;
	description = "Как ситуация?";
};


func int DIA_Lord_Hagen_KAP3U4_PERM_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_KAP3U4_PERM_Info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_KAP3U4_PERM_15_00");	//Как ситуация?
	if(MIS_OLDWORLD == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Add_04_04");	//Я должен найти способ спасти эту экспедицию.
		AI_Output(self,other,"DIA_Lord_Hagen_Add_04_05");	//Мы должны сделать что-то с драконами.
		if(Hagen_KnowsEyeKaputt == FALSE)
		{
			AI_Output(self,other,"DIA_Lord_Hagen_Add_04_06");	//(себе под нос) Возможно, Глаз Инноса может спасти нас всех...
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Lord_Hagen_KAP3U4_PERM_04_01");	//Я с ума сойду здесь. Я солдат, а не бюрократ.
		AI_Output(self,other,"DIA_Lord_Hagen_KAP3U4_PERM_04_02");	//Из-за всей этой бумажной работы, что я должен делать, я уже почти забыл ощущение от клинка в руке.
	};
};


instance DIA_Lord_Hagen_EyeBroken(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 1;
	condition = DIA_Lord_Hagen_EyeBroken_Condition;
	information = DIA_Lord_Hagen_EyeBroken_Info;
	permanent = FALSE;
	description = "Глаз у меня, но он поврежден.";
};


func int DIA_Lord_Hagen_EyeBroken_Condition()
{
	if((Kapitel == 3) && (MIS_ReadyforChapter4 == FALSE) && (Npc_HasItems(other,ItMi_InnosEye_Broken_Mis) || (MIS_SCKnowsInnosEyeIsBroken == TRUE)) && (MIS_Bennet_InnosEyeRepairedSetting != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_EyeBroken_Info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Add_15_07");	//Глаз у меня, но он поврежден.
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_08");	//ЧТО? О, Иннос! Что ты наделал? Нам нужен этот Глаз!
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_09");	//Поговори с Пирокаром! Должен быть способ восстановить его.
	Hagen_KnowsEyeKaputt = TRUE;
};

instance DIA_Lord_Hagen_BACKINTOWN(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 2;
	condition = DIA_Lord_Hagen_BACKINTOWN_Condition;
	information = DIA_Lord_Hagen_BACKINTOWN_Info;
	permanent = FALSE;
	description = "Я принес тебе новости от Гаронда.";
};

func int DIA_Lord_Hagen_BACKINTOWN_Condition()
{
	if((MIS_OLDWORLD == LOG_Running) && (Npc_HasItems(hero,ItWr_PaladinLetter_MIS) >= 1) && (Kapitel == 3) && (MeetDarkRavenSpeaker == TRUE) && (DarkPathStart == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_BACKINTOWN_Info()
{
	var int rnd;

	AI_Output(other,self,"DIA_Lord_Hagen_BACKINTOWN_15_00");	//Я принес тебе новости от Гаронда. Вот, он начертал эти строки для тебя.
	B_GiveInvItems(other,self,ItWr_PaladinLetter_MIS,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Lord_Hagen_BACKINTOWN_04_01");	//Наша ситуация хуже, чем я опасался. Но доложи мне о ситуации в Долине Рудников.
	AI_Output(other,self,"DIA_Lord_Hagen_BACKINTOWN_15_02");	//Паладины заперты в замке Долины Рудников, окруженном орками.
	AI_Output(other,self,"DIA_Lord_Hagen_BACKINTOWN_15_03");	//Они потеряли много людей в старательских операциях и добыли очень мало руды.
	AI_Output(other,self,"DIA_Lord_Hagen_BACKINTOWN_15_04");	//И, должен добавить, без помощи извне им всем скоро придет конец. Вот такие дела.
	AI_Output(self,other,"DIA_Lord_Hagen_BACKINTOWN_04_05");	//Я должен найти способ спасти эту экспедицию. Ты многое сделал для нас. Иннос благодарит тебя...
	AI_Output(other,self,"DIA_Lord_Hagen_BACKINTOWN_15_06");	//Мне не интересна его благодарность. Мне нужен его глаз.
	AI_Output(self,other,"DIA_Lord_Hagen_BACKINTOWN_04_07");	//Да, конечно. Я держу свое слово. Возьми это письмо. Оно откроет перед тобой монастырские врата.
	B_GiveInvItems(self,other,ItWr_PermissionToWearInnosEye_MIS,1);
	AI_Output(self,other,"DIA_Lord_Hagen_BACKINTOWN_04_08");	//Поговори с Пирокаром, высшим магом Огня, и покажи ему это письмо с полномочиями. Он предоставит тебе доступ к Глазу Инноса.

	if(((hero.guild == GIL_GUR) || (hero.guild == GIL_TPL)) && (MIS_PALADINWATCH == LOG_Running) && (IDOLORANQUESTIONFIVE == FALSE))
	{
		IDOLORANQUESTIONFIVE = TRUE;
		IDOLORANQUESTIONFULLCOMPLETE = TRUE;
		B_LogEntry_Quiet(TOPIC_PALADINWATCH,"Дальнейшие действия лорда Хагена ясны - он будет думать о том, как вывести своих людей из окружения. Пока он этого не сделает, паладины не покинут остров.");
	};

	MIS_OLDWORLD = LOG_SUCCESS;
	CanStartMyCamp = TRUE;
	B_LogEntry(TOPIC_INNOSEYE,"Лорд Хаген дал мне записку. Она заставит мастера Пирокара в монастыре отдать мне Глаз Инноса.");
	AI_StopProcessInfos(self);
	Wld_InsertNpc(PC_Mage_NW,"NW_MONASTERY_ENTRY_01");

	if(DarkPathStart == FALSE)
	{
		MIS_InnosEyeStolen = TRUE;
		B_StartOtherRoutine(NOV_600_Pedro,"TOT");
		Wld_InsertNpc(VLK_4250_Jorgen,"NW_MONASTERY_BRIDGE_01");
		Wld_InsertNpc(BDT_1050_Landstreicher,"NW_TROLLAREA_NOVCHASE_01");
		Wld_InsertNpc(BDT_1051_Wegelagerer,"NW_TROLLAREA_RITUALFOREST_09");
		Wld_InsertNpc(BDT_1052_Wegelagerer,"NW_TROLLAREA_RITUALFOREST_09");
		Wld_InsertNpc(DMT_1200_Dementor,"NW_TROLLAREA_RITUALPATH_01");
		Wld_InsertNpc(DMT_1202_Dementor,"NW_TROLLAREA_RITUAL_01");
		Wld_InsertNpc(DMT_1204_Dementor,"NW_TROLLAREA_RITUAL_03");
		Wld_InsertNpc(DMT_1206_Dementor,"NW_TROLLAREA_RITUAL_05");
		Wld_InsertNpc(DMT_1207_Dementor,"NW_TROLLAREA_RITUALPATH_01");
		Wld_InsertNpc(DMT_1209_Dementor,"NW_TROLLAREA_RITUALPATH_01");
		Wld_InsertNpc(DMT_1210_Dementor,"NW_TROLLAREA_RITUALPATH_01");
		Wld_InsertNpc(DMT_1211_Dementor,"NW_TROLLAREA_RITUALPATH_01");
		B_KillNpc(BDT_1020_Bandit_L);
		Wld_InsertNpc(NOV_650_ToterNovize,"NW_TROLLAREA_RITUALPATH_01");
		B_KillNpc(NOV_650_ToterNovize);
		Wld_InsertNpc(NOV_651_ToterNovize,"NW_TROLLAREA_RITUALPATH_01");
		B_KillNpc(NOV_651_ToterNovize);
		Wld_InsertNpc(NOV_652_ToterNovize,"NW_TROLLAREA_RITUALPATH_01");
		B_KillNpc(NOV_652_ToterNovize);
		Wld_InsertNpc(NOV_653_ToterNovize,"NW_TROLLAREA_RITUALPATH_01");
		B_KillNpc(NOV_653_ToterNovize);
		Wld_InsertNpc(NOV_654_ToterNovize,"NW_TROLLAREA_RITUALPATH_01");
		B_KillNpc(NOV_654_ToterNovize);
		Wld_InsertNpc(NOV_655_ToterNovize,"NW_TROLLAREA_RITUALPATH_01");
		B_KillNpc(NOV_655_ToterNovize);
		Wld_InsertNpc(NOV_656_ToterNovize,"NW_TROLLAREA_RITUALPATH_01");
		B_KillNpc(NOV_656_ToterNovize);
		TEXT_Innoseye_Setting = TEXT_Innoseye_Setting_Broken;
		Wld_InsertItem(ItMi_InnosEye_Broken_Mis,"FP_TROLLAREA_RITUAL_ITEM");
		rnd = Hlp_Random(65);

		if(rnd <= 10)
		{
			CreateInvItems(DMT_1209_Dementor,itri_ritualplace,1);
		}
		else if(rnd <= 20)
		{
			Wld_InsertItem(itri_ritualplace,"NW_TROLLAREA_RITUALPATH_08");
		}
		else if(rnd <= 30)
		{
			Wld_InsertItem(itri_ritualplace,"NW_TROLLAREA_RITUALPATH_11");
		}
		else if(rnd <= 40)
		{
			CreateInvItems(DMT_1200_Dementor,itri_ritualplace,1);
		}
		else if(rnd <= 50)
		{
			CreateInvItems(DMT_1204_Dementor,itri_ritualplace,1);
		}
		else
		{
			Wld_InsertItem(itri_ritualplace,"NW_TROLLAREA_RITUALPATH_07");
		};

		Wld_InsertNpc(DMT_1270_Dementor,"NW_DARKMASTER_01");
		Wld_InsertNpc(SKELETON_WARRIOR_DARK_SHIELD_MASTER,"NW_DARKMASTER_01_01");
		Wld_InsertNpc(SKELETON_WARRIOR_DARK_SHIELD_MASTER,"NW_DARKMASTER_01_02");
		Wld_InsertNpc(DMT_1271_Dementor,"NW_DARKMASTER_02");
		Wld_InsertNpc(SKELETON_WARRIOR_DARK_SHIELD_MASTER,"NW_DARKMASTER_02_01");
		Wld_InsertNpc(SKELETON_WARRIOR_DARK_SHIELD_MASTER,"NW_DARKMASTER_02_02");
		Wld_InsertNpc(SKELETON_WARRIOR_DARK_SHIELD_MASTER,"NW_DARKMASTER_02_03");
		Wld_InsertNpc(SKELETON_WARRIOR_DARK_SHIELD_MASTER,"NW_DARKMASTER_02_04");
		Wld_InsertNpc(DMT_1272_Dementor,"NW_DARKMASTER_03");
		Wld_InsertNpc(SKELETON_WARRIOR_DARK_SHIELD_MASTER,"NW_DARKMASTER_03_01");
		Wld_InsertNpc(SKELETON_WARRIOR_DARK_SHIELD_MASTER,"NW_DARKMASTER_03_02");
		DarkPathStartEnd = TRUE;
	}
	else
	{
		DarkPathStartPyr = TRUE;
	};
};


var int Hagen_einmalBennet;

instance DIA_Lord_Hagen_RescueBennet(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 3;
	condition = DIA_Lord_Hagen_RescueBennet_Condition;
	information = DIA_Lord_Hagen_RescueBennet_Info;
	permanent = TRUE;
	description = "Мне нужно поговорить с тобой о Беннете.";
};

func int DIA_Lord_Hagen_RescueBennet_Condition()
{
	if((MIS_RescueBennet == LOG_Running) && (Cornelius_IsLiar == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_RescueBennet_Info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_RescueBennet_15_00");	//Мне нужно поговорить с тобой о Беннете.
	if(Hagen_einmalBennet == FALSE)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_04_01");	//Но этот наемник убил одного их моих людей.
		Hagen_einmalBennet = TRUE;
	};
	Info_ClearChoices(DIA_Lord_Hagen_RescueBennet);
	Info_AddChoice(DIA_Lord_Hagen_RescueBennet,Dialog_Back,DIA_Lord_Hagen_RescueBennet_Back);

	if(RecueBennet_KnowsCornelius == FALSE)
	{
		Info_AddChoice(DIA_Lord_Hagen_RescueBennet,"Почему ты так уверен, что убийца именно Беннет?",DIA_Lord_Hagen_RescueBennet_WhySure);
	};

	Info_AddChoice(DIA_Lord_Hagen_RescueBennet,"Я верю, что Беннет невиновен.",DIA_Lord_Hagen_RescueBennet_Innoscent);

	if((MIS_RescueBennet == LOG_Running) && (MIS_RitualInnosEyeRepair == LOG_Running) && (Hagen_KnowsEyeKaputt == TRUE))
	{
		Info_AddChoice(DIA_Lord_Hagen_RescueBennet,"Беннет мог бы помочь нам починить Глаз Инноса.",DIA_Lord_Hagen_RescueBennet_Hilfe);
	};
};

func void DIA_Lord_Hagen_RescueBennet_Hilfe()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Add_15_16");	//Беннет мог бы помочь нам починить Глаз Инноса.
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_17");	//Даже если бы он мог вызвать самого Инноса на землю...
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_18");	//Он убил паладина. За это он будет казнен!
};

func void DIA_Lord_Hagen_RescueBennet_Back()
{
	Info_ClearChoices(DIA_Lord_Hagen_RescueBennet);
};

func void DIA_Lord_Hagen_RescueBennet_WhySure()
{
	AI_Output(other,self,"DIA_Lord_Hagen_RescueBennet_WhySure_15_00");	//Почему ты так уверен, что убийца именно Беннет?
	AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_WhySure_04_01");	//У нас есть свидетель.
	AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_WhySure_04_02");	//Как видишь, нет никаких сомнений в виновности этого наемника.
	AI_Output(other,self,"DIA_Lord_Hagen_RescueBennet_Witness_15_00");	//Кто этот свидетель?
	AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_Witness_04_01");	//Корнелиус, секретарь главы города, видел, как произошло убийство.
	AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_Witness_04_02");	//Его описание подходит к Беннету, в этом нет никаких сомнений. По моему мнению, это достаточное доказательство.
	AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_Witness_04_03");	//Этот наемник будет повешен за измену.
	B_LogEntry(TOPIC_RescueBennet,"Корнелиус, секретарь главы города, является свидетелем. Он утверждает, что был свидетелем убийства.");
	RecueBennet_KnowsCornelius = TRUE;
};

func void DIA_Lord_Hagen_RescueBennet_Innoscent()
{
	AI_Output(other,self,"DIA_Lord_Hagen_RescueBennet_Innoscent_15_00");	//Я верю, что Беннет невиновен.
	AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_Innoscent_04_01");	//Доказательства налицо. Он виновен.
	AI_Output(other,self,"DIA_Lord_Hagen_RescueBennet_Innoscent_15_02");	//А что если доказательства неверны?
	AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_Innoscent_04_03");	//Выбирай слова. Ты выдвигаешь серьезное обвинение.
	AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_Innoscent_04_04");	//Если ты не можешь представить доказательство того, что свидетель солгал, тебе лучше попридержать язык.
};


instance DIA_Lord_Hagen_Cornelius(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 3;
	condition = DIA_Lord_Hagen_Cornelius_Condition;
	information = DIA_Lord_Hagen_Cornelius_Info;
	permanent = TRUE;
	description = "Корнелиус солгал.";
};

func int DIA_Lord_Hagen_Cornelius_Condition()
{
	if((Npc_HasItems(other,ItWr_CorneliusTagebuch_Mis) >= 1) && (Cornelius_IsLiar == TRUE) && (MIS_RescueBennet == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_Cornelius_Info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Cornelius_15_00");	//Корнелиус солгал.
	AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_01");	//Откуда тебе это известно?
	AI_Output(other,self,"DIA_Lord_Hagen_Cornelius_15_02");	//Вот, у меня его дневник. Все в нем.
	B_GiveInvItems(other,self,ItWr_CorneliusTagebuch_Mis,1);
	AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_03");	//(в ярости) Ах, гнусная мразь!
	AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_04");	//Перед лицом новых доказательств мне не остается ничего другого.
	AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_05");	//Властью, данной мне королем и церковью, я провозглашаю...
	AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_06");	//...что с заключенного Беннета снимаются все обвинения и он подлежит освобождению.
	AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_07");	//Корнелиус должен быть немедленно посажен под арест за лжесвидетельство.
	if(Npc_IsDead(Cornelius) == TRUE)
	{
		AI_Output(other,self,"DIA_Lord_Hagen_Cornelius_15_08");	//Можешь не беспокоиться. Корнелиус мертв.
		AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_09");	//Значит, он уже понес заслуженное наказание. Отлично.
	}
	else if(CorneliusFlee == TRUE)
	{
		AI_Output(other,self,"DIA_Lord_Hagen_Cornelius_15_10");	//Он сбежал.
		AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_11");	//Рано или поздно, он объявится. И тогда мы арестуем его.
		B_StartOtherRoutine(Cornelius,"FLED");
	}
	else
	{
		B_StartOtherRoutine(Cornelius,"PRISON");
	};

	MIS_RescueBennet = LOG_SUCCESS;
	B_GivePlayerXP(XP_RescueBennet);

	if(hero.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_12");	//Твои дела спасли нас от бесчестья.
	};

	AI_StopProcessInfos(self);
	B_StartOtherRoutine(SLD_809_Bennet,"START");
	B_StartOtherRoutine(BAU_908_Hodges,"START");
};

instance DIA_Lord_Hagen_AugeAmStart(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 4;
	condition = DIA_Lord_Hagen_AugeAmStart_Condition;
	information = DIA_Lord_Hagen_AugeAmStart_Info;
	permanent = FALSE;
	description = "Я надел Глаз!";
};

func int DIA_Lord_Hagen_AugeAmStart_Condition()
{
	if((Kapitel <= 4) && (MIS_ReadyforChapter4 == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_AugeAmStart_Info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Add_15_10");	//Я надел Глаз!
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_11");	//(благоговейно) Ты носишь Глаз!
	if(Hagen_KnowsEyeKaputt == TRUE)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Add_04_12");	//И ты восстановил его!
	};
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_13");	//Значит, ты - Избранный Инноса!
	AI_Output(other,self,"DIA_Lord_Hagen_Add_15_14");	//Я должен отправляться в путь и убить всех драконов в Долине Рудников!
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_15");	//Иди с Инносом и уничтожь Зло с его помощью!
};


instance DIA_Lord_Hagen_KAP4_EXIT(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 999;
	condition = DIA_Lord_Hagen_KAP4_EXIT_Condition;
	information = DIA_Lord_Hagen_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lord_Hagen_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lord_Hagen_ANTIPALADINE(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 3;
	condition = DIA_Lord_Hagen_ANTIPALADINE_Condition;
	information = DIA_Lord_Hagen_ANTIPALADINE_Info;
	permanent = TRUE;
	description = "Элитные воины орков нападают на наши земли.";
};


func int DIA_Lord_Hagen_ANTIPALADINE_Condition()
{
	if(((TalkedTo_AntiPaladin == TRUE) || Npc_HasItems(other,ItRi_OrcEliteRing)) && (MIS_ReadyforChapter4 == TRUE) && (Hagen_SawOrcRing == FALSE) && (MIS_ORсGREATWAR == FALSE))
	{
		return TRUE;
	};
};


var int Hagen_SawOrcRing;

func void DIA_Lord_Hagen_ANTIPALADINE_Info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_ANTIPALADINE_15_00");	//Элитные воины орков нападают на наши земли.
	Log_CreateTopic(TOPIC_OrcElite,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OrcElite,LOG_Running);
	B_LogEntry(TOPIC_OrcElite,"Я рассказал лорду Хагену о приближающихся ордах предводителей орков.");
	if((TalkedTo_AntiPaladin == TRUE) && (MIS_KillOrkOberst == 0))
	{
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_01");	//Откуда у тебя такая информация?
		AI_Output(other,self,"DIA_Lord_Hagen_ANTIPALADINE_15_02");	//Я говорил с одним из них. Твое имя также упоминалось.
	};
	AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_03");	//Чушь. Мои люди не докладывали о массированном вторжении орков.
	AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_04");	//Возможно, какие-то их разведчики заблудились в близлежащих лесах.
	if(Npc_HasItems(other,ItRi_OrcEliteRing))
	{
		AI_Output(other,self,"DIA_Lord_Hagen_ANTIPALADINE_15_05");	//Это не разведчики. Я взял это кольцо с трупа одного из них.
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_06");	//Покажи.
		B_GiveInvItems(other,self,ItRi_OrcEliteRing,1);
		Npc_RemoveInvItems(self,ItRi_OrcEliteRing,Npc_HasItems(self,ItRi_OrcEliteRing));
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_07");	//(задумчиво) Это действительно неприятно.
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_08");	//Это знак их силы! Значит, орки выбрались из-за своих частоколов и сражаются в открытом поле.
		AI_Output(other,self,"DIA_Lord_Hagen_ANTIPALADINE_15_09");	//Я не видел, чтобы их было много. В основном, это их предводители и всего несколько бойцов.
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_10");	//Да?! Значит, они замышляют что-то еще. Это не похоже на орков, чтобы их лидеры в одиночку покидали свои защитные частоколы.
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_11");	//Но, впрочем, это может стать хорошей возможностью нанести им чувствительный удар.
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_12");	//Если они потеряют своих лидеров, их боевой дух резко снизится.
		if(hero.guild == GIL_PAL)
		{
			AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_13");	//У тебя новое задание, рыцарь. Иди и убей всех лидеров орков, каких найдешь в прилежащих землях!
		}
		else
		{
			AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_19");	//У тебя новое задание. Иди и убей всех лидеров орков, каких найдешь в прилежащих землях!
		};
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_14");	//Принеси мне их кольца! Это будет серьезный удар по оркам.
		B_LogEntry(TOPIC_OrcElite,"Я должен принести лорду Хагену кольцо военачальников орков, как доказательство их присутствия. Я должен приносить ему все кольца, которые я смогу найти.");
		if((Npc_IsDead(Ingmar) == FALSE) && (MIS_KillOrkOberst == 0))
		{
			AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_15");	//Поговори с Ингмаром. Он может дать тебе несколько тактических советов по сражению с лидерами орков.
			AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_16");	//Элитные воины орков - его специализация. Ему часто приходилось иметь с ними дело.
			B_LogEntry(TOPIC_OrcElite,"Ингмар очень много знает об элитных воинах орков.");
		};
		Hagen_SawOrcRing = TRUE;
		B_GivePlayerXP(XP_PAL_OrcRing);
	}
	else
	{
		if(MIS_KillOrkOberst == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_17");	//Одного твоего слова, что ты убил полководца орков, недостаточно для меня.
		};
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_18");	//Мне нужны вещественные доказательства, чтобы я мог принять меры.
		B_LogEntry(TOPIC_OrcElite,"Хаген отказывается верить мне. Он требует доказательств того, что элитные воины орков нападают на цивилизованные земли. Ну, меня бы удивило, если бы он повел себя по-другому.");
	};
};

instance DIA_Lord_Hagen_RINGEBRINGEN(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 5;
	condition = DIA_Lord_Hagen_RINGEBRINGEN_Condition;
	information = DIA_Lord_Hagen_RINGEBRINGEN_Info;
	permanent = TRUE;
	description = "Я могу еще кое-что сообщить о предводителях орков.";
};

func int DIA_Lord_Hagen_RINGEBRINGEN_Condition()
{
	if((Hagen_SawOrcRing == TRUE) && (Npc_HasItems(other,ItRi_OrcEliteRing) >= 1) && (TOPIC_END_OrcElite == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_RINGEBRINGEN_Info()
{
	var int Ringcount;
	var int XP_PAL_OrcRings;

	AI_Output(other,self,"DIA_Lord_Hagen_RINGEBRINGEN_15_00");	//Я могу еще кое-что сообщить о предводителях орков.
	AI_Output(self,other,"DIA_Lord_Hagen_RINGEBRINGEN_04_01");	//Рассказывай.

	XP_PAL_OrcRings = 50;
	Ringcount = Npc_HasItems(other,ItRi_OrcEliteRing);

	if(Ringcount == 1)
	{
		AI_Output(other,self,"DIA_Lord_Hagen_RINGEBRINGEN_15_02");	//Я могу дать тебе еще одно кольцо орков.
		B_GivePlayerXP(XP_PAL_OrcRing);
		B_GiveInvItems(other,self,ItRi_OrcEliteRing,1);
		Npc_RemoveInvItems(self,ItRi_OrcEliteRing,Npc_HasItems(self,ItRi_OrcEliteRing));
		OrkRingCounter = OrkRingCounter + 1;
	}
	else
	{
		AI_Output(other,self,"DIA_Lord_Hagen_RINGEBRINGEN_15_03");	//Я могу дать тебе еще несколько колец орков.
		B_GiveInvItems(other,self,ItRi_OrcEliteRing,Ringcount);
		Npc_RemoveInvItems(self,ItRi_OrcEliteRing,Npc_HasItems(self,ItRi_OrcEliteRing));
		XP_PAL_OrcRings = Ringcount * XP_PAL_OrcRing;
		OrkRingCounter = OrkRingCounter + Ringcount;
		B_GivePlayerXP(XP_PAL_OrcRings);
	};
	AI_Output(self,other,"DIA_Lord_Hagen_RINGEBRINGEN_04_04");	//Я горжусь тобой. Так держать!

	if(OrkRingCounter <= 10)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_RINGEBRINGEN_04_05");	//Возможно, еще не все предводители орков уничтожены.
	}
	else if(OrkRingCounter <= 20)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_RINGEBRINGEN_04_06");	//Но скоро мы поставим их на колени.
	}
	else
	{
		AI_Output(self,other,"DIA_Lord_Hagen_RINGEBRINGEN_04_07");	//Я удивлюсь, если ты еще их повстречаешь.
		AI_Output(self,other,"DIA_Lord_Hagen_RINGEBRINGEN_04_08");	//Ты можешь приносить мне их кольца, но я думаю, орки уже получили хороший урок.
		TOPIC_END_OrcElite = TRUE;
		Log_SetTopicStatus(TOPIC_OrcElite,LOG_SUCCESS);
		B_LogEntry(TOPIC_OrcElite,"Отряды элитных орков разбиты! Лорд Хаген остался доволен проделанной мной работой.");
	};
};

instance DIA_Lord_Hagen_RINGEBRINGENMORE(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 5;
	condition = DIA_Lord_Hagen_RINGEBRINGENMORE_Condition;
	information = DIA_Lord_Hagen_RINGEBRINGENMORE_Info;
	permanent = TRUE;
	description = "Я могу дать тебе еще несколько колец орков.";
};

func int DIA_Lord_Hagen_RINGEBRINGENMORE_Condition()
{
	if((Npc_HasItems(other,ItRi_OrcEliteRing) >= 1) && (TOPIC_END_OrcElite == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_RINGEBRINGENMORE_Info()
{
	var int Ringcount;
	var int XP_PAL_OrcRings;

	XP_PAL_OrcRings = 50;
	Ringcount = Npc_HasItems(other,ItRi_OrcEliteRing);

	if(Ringcount == 1)
	{
		AI_Output(other,self,"DIA_Lord_Hagen_RINGEBRINGEN_15_02");	//Я могу дать тебе еще одно кольцо орков.
		B_GivePlayerXP(XP_PAL_OrcRing);
		B_GiveInvItems(other,self,ItRi_OrcEliteRing,1);
		Npc_RemoveInvItems(self,ItRi_OrcEliteRing,Npc_HasItems(self,ItRi_OrcEliteRing));
	}
	else
	{
		XP_PAL_OrcRings = Ringcount * XP_PAL_OrcRing;
		B_GivePlayerXP(XP_PAL_OrcRings);
		AI_Output(other,self,"DIA_Lord_Hagen_RINGEBRINGEN_15_03");	//Я могу дать тебе еще несколько колец орков.
		B_GiveInvItems(other,self,ItRi_OrcEliteRing,Ringcount);
		Npc_RemoveInvItems(self,ItRi_OrcEliteRing,Npc_HasItems(self,ItRi_OrcEliteRing));
	};

	AI_Output(self,other,"DIA_Lord_Hagen_RINGEBRINGEN_04_04");	//Я горжусь тобой. Так держать!
};

instance DIA_Lord_Hagen_KAP5_EXIT(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 999;
	condition = DIA_Lord_Hagen_KAP5_EXIT_Condition;
	information = DIA_Lord_Hagen_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lord_Hagen_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lord_Hagen_AllDragonsDead(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 4;
	condition = DIA_Lord_Hagen_AllDragonsDead_Condition;
	information = DIA_Lord_Hagen_AllDragonsDead_Info;
	permanent = FALSE;
	description = "Драконы мертвы.";
};


func int DIA_Lord_Hagen_AllDragonsDead_Condition()
{
	if((Kapitel == 5) && (MIS_ORсGREATWAR == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_AllDragonsDead_Info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_AllDragonsDead_15_00");	//Драконы мертвы.
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_19");	//Я знал, что Иннос даст тебе силы, чтобы победить драконов!
	AI_Output(self,other,"DIA_Lord_Hagen_AllDragonsDead_04_02");	//Как там с рудой?
	AI_Output(other,self,"DIA_Lord_Hagen_AllDragonsDead_15_03");	//Орки все еще осаждают замок в Долине Рудников. Гаронд не сможет покинуть замок, пока осада не снята.
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_20");	//(в ярости) Черт!
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_21");	//Если Гаронд не способен справиться с ситуацией, я должен взять управление в свои руки.
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_22");	//Кучка орков не остановит меня! Только не меня!
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_23");	//Я уже отдал приказ своим людям. Мы готовимся выступать.
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_24");	//Мы ВСЕ отправимся туда. Я оставлю только минимальную охрану на корабле.
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_25");	//Этого должно быть достаточно, чтобы, наконец, разделаться с этими орками!
	MIS_SCvisitShip = LOG_Running;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"ShipFree");
};


instance DIA_Lord_Hagen_NeedShip(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 4;
	condition = DIA_Lord_Hagen_NeedShip_Condition;
	information = DIA_Lord_Hagen_NeedShip_Info;
	permanent = FALSE;
	description = "Мне нужен корабль.";
};


func int DIA_Lord_Hagen_NeedShip_Condition()
{
	if((ItWr_SCReadsHallsofIrdorath == TRUE) && (MIS_ORсGREATWAR == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_NeedShip_Info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_NeedShip_15_00");	//Мне нужен корабль.

	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_NeedShip_04_01");	//Он много кому нужен, солдат.
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_NeedShip_04_02");	//Я слышу это чуть ли не каждый день, дорогой. Но...
	};
	AI_Output(self,other,"DIA_Lord_Hagen_NeedShip_04_03");	//У тебя даже нет капитана, не говоря уже о команде.
	AI_Output(other,self,"DIA_Lord_Hagen_NeedShip_15_04");	//Как насчет корабля, стоящего в гавани?
	AI_Output(self,other,"DIA_Lord_Hagen_NeedShip_04_05");	//Он принадлежит мне, и точка. Мы должны перевозить руду на этом корабле.
	AI_Output(self,other,"DIA_Lord_Hagen_NeedShip_04_06");	//Когда мы покончим с этим, ты можешь обратиться ко мне опять.
};


instance DIA_Lord_Hagen_GateOpen(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 5;
	condition = DIA_Lord_Hagen_GateOpen_Condition;
	information = DIA_Lord_Hagen_GateOpen_Info;
	permanent = FALSE;
	description = "Орки ворвались в замок в Долине Рудников!";
};

func int DIA_Lord_Hagen_GateOpen_Condition()
{
	if((MIS_OCGateOpen == TRUE) && Npc_KnowsInfo(other,DIA_Lord_Hagen_AllDragonsDead) && (MIS_ORсGREATWAR == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_GateOpen_Info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Add_15_29");	//Орки ворвались в замок в Долине Рудников!
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_30");	//О, Иннос! Что именно там произошло?
	AI_Output(other,self,"DIA_Lord_Hagen_Add_15_31");	//Почему-то ворота оказались открытыми...
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_32");	//Почему-то?! Но как это возможно... В замке наверняка есть предатель!
};


instance DIA_Lord_Hagen_Perm5(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 5;
	condition = DIA_Lord_Hagen_Perm5_Condition;
	information = DIA_Lord_Hagen_Perm5_Info;
	permanent = TRUE;
	description = "Чего ты ждешь?";
};


func int DIA_Lord_Hagen_Perm5_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lord_Hagen_AllDragonsDead) && (MIS_ORсGREATWAR == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_Perm5_Info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Add_15_33");	//Чего ты ждешь?
	if(MIS_OCGateOpen == FALSE)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Add_04_26");	//Мы ждем наше снаряжение и продовольственное снабжение. Затем мы двинемся в путь!
	}
	else
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Add_04_27");	//Теперь, когда замок атакован, нам нужно больше запасов.
		AI_Output(self,other,"DIA_Lord_Hagen_Add_04_28");	//Но наш отъезд уже давно откладывается из-за этого.
	};
};

instance DIA_LORD_HAGEN_PICKPOCKET(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 900;
	condition = dia_lord_hagen_pickpocket_condition;
	information = dia_lord_hagen_pickpocket_info;
	permanent = TRUE;
	description = "(Попытаться украсть его ключ)";
};

func int dia_lord_hagen_pickpocket_condition()
{
	if((self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (ETLUBEGINS == TRUE))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_pickpocket_info()
{
	Info_ClearChoices(dia_lord_hagen_pickpocket);
	Info_AddChoice(dia_lord_hagen_pickpocket,Dialog_Back,dia_lord_hagen_pickpocket_back);
	Info_AddChoice(dia_lord_hagen_pickpocket,DIALOG_PICKPOCKET,dia_lord_hagen_pickpocket_doit);
};

func void dia_lord_hagen_pickpocket_doit()
{
	AI_PlayAni(other,"T_STEAL");
	AI_Wait(other,1);

	if((other.attribute[ATR_DEXTERITY] + PickPocketBonusCount) >= 100)
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		}
		else
		{
			GlobalThiefCount += 1;

			if(GlobalThiefCount >= 3)
			{
				INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
				GlobalThiefCount = FALSE;
			};
		};
		B_GiveInvItems(self,other,itke_hagen_secretkey,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		if(XARDASLINE == TRUE)
		{
			B_LogEntry(TOPIC_GOLDDRAGONPORTAL,"Я выкрал ключ у лорда Хагена! Думаю, теперь мне стоит вернуться к Ксардасу и рассказать ему обо всем.");
		}
		else if(KREOLLINE == TRUE)
		{
			B_LogEntry(TOPIC_GOLDDRAGONPORTAL,"Я выкрал ключ у лорда Хагена! Думаю, теперь мне стоит вернуться к Креолу и рассказать ему обо всем.");
		};
		B_GiveThiefXP();
		Info_ClearChoices(dia_lord_hagen_pickpocket);
	}
	else
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		};
		THIEFCATCHER = Hlp_GetNpc(self);
		HERO_CANESCAPEFROMGOTCHA = TRUE;
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
	};
};

func void dia_lord_hagen_pickpocket_back()
{
	Info_ClearChoices(dia_lord_hagen_pickpocket);
};


instance DIA_LORD_HAGEN_MELHIOR(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 5;
	condition = dia_lord_hagen_melhior_condition;
	information = dia_lord_hagen_melhior_info;
	permanent = FALSE;
	description = "Я хочу кое-что сообщить...";
};


func int dia_lord_hagen_melhior_condition()
{
	if((MELHIORPISSOFF == TRUE) && (MIS_ORсGREATWAR == FALSE))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_melhior_info()
{
	var C_Npc melhior;
	melhior = Hlp_GetNpc(pal_187_melhior);
	AI_Output(other,self,"DIA_Lord_Hagen_Melhior_01_00");	//Я хочу кое-что сообщить...
	if(other.guild == GIL_PAL)
	{
		B_GivePlayerXP(250);
		AI_Output(other,self,"DIA_Lord_Hagen_Melhior_01_02");	//Один из паладинов ведет себя неподобающе своему положению.
		AI_Output(self,other,"DIA_Lord_Hagen_Melhior_01_04");	//(возмущенно) Как это понимать? Объясни!
		AI_Output(other,self,"DIA_Lord_Hagen_Melhior_01_05");	//Он отсутствовал на посту во время своего дежурства, а кроме этого, еще был в стельку пьян.
		AI_Output(self,other,"DIA_Lord_Hagen_Melhior_01_08");	//ЧТО?! Это возмутительно...
		AI_Output(self,other,"DIA_Lord_Hagen_Melhior_01_11");	//Как его имя?
		AI_Output(other,self,"DIA_Lord_Hagen_Melhior_01_12");	//Его зовут Мельхиор.
		AI_Output(self,other,"DIA_Lord_Hagen_Melhior_01_13");	//Хорошо - я прослежу, чтобы он получил по заслугам. Такому человеку не место в наших рядах!
		Npc_ExchangeRoutine(melhior,"Gotcha");
		melhior.guild = GIL_NONE;
		Npc_SetTrueGuild(melhior,GIL_NONE);
		AI_UnequipArmor(melhior);
		AI_UnequipWeapons(melhior);
		Npc_RemoveInvItems(melhior,ItAr_PAL_M,1);
		Npc_RemoveInvItems(melhior,ItMw_1h_Pal_Sword,1);
		CreateInvItems(melhior,ITAR_Bau_L,1);
		AI_EquipArmor(melhior,ITAR_Bau_L);
	}
	else if(other.guild == GIL_MIL)
	{
		B_GivePlayerXP(250);
		AI_Output(other,self,"DIA_Lord_Hagen_Melhior_01_17");	//Один из паладинов ведет себя неподобающе своему положению.
		AI_Output(self,other,"DIA_Lord_Hagen_Melhior_01_19");	//(возмущенно) Как это понимать? Объясни!
		AI_Output(other,self,"DIA_Lord_Hagen_Melhior_01_20");	//Он отсутствовал на посту во время своего дежурства, а кроме этого, еще был в стельку пьян.
		AI_Output(self,other,"DIA_Lord_Hagen_Melhior_01_23");	//ЧТО?! Это возмутительно...
		AI_Output(self,other,"DIA_Lord_Hagen_Melhior_01_27");	//Как его имя?
		AI_Output(other,self,"DIA_Lord_Hagen_Melhior_01_28");	//Его зовут Мельхиор.
		AI_Output(self,other,"DIA_Lord_Hagen_Melhior_01_29");	//Хорошо - я прослежу, чтобы он получил по заслугам. Такому человеку не место в наших рядах!
		Npc_ExchangeRoutine(melhior,"Gotcha");
		melhior.guild = GIL_NONE;
		Npc_SetTrueGuild(melhior,GIL_NONE);
		AI_UnequipArmor(melhior);
		AI_UnequipWeapons(melhior);
		Npc_RemoveInvItems(melhior,ItAr_PAL_M,1);
		Npc_RemoveInvItems(melhior,ItMw_1h_Pal_Sword,1);
		CreateInvItems(melhior,ITAR_Bau_L,1);
		AI_EquipArmor(melhior,ITAR_Bau_L);
	}
	else if(other.guild == GIL_KDF)
	{
		B_GivePlayerXP(250);
		AI_Output(other,self,"DIA_Lord_Hagen_Melhior_01_33");	//Один из паладинов ведет себя неподобающе своему положению.
		AI_Output(self,other,"DIA_Lord_Hagen_Melhior_01_35");	//(возмущенно) Как это понимать? Объясни!
		AI_Output(other,self,"DIA_Lord_Hagen_Melhior_01_36");	//Он отсутствовал на посту во время своего дежурства, а кроме этого еще был в стельку пьян!
		AI_Output(self,other,"DIA_Lord_Hagen_Melhior_01_39");	//ЧТО?! Это возмутительно...
		AI_Output(self,other,"DIA_Lord_Hagen_Melhior_01_42");	//Как его имя?
		AI_Output(other,self,"DIA_Lord_Hagen_Melhior_01_43");	//Его зовут Мельхиор.
		AI_Output(self,other,"DIA_Lord_Hagen_Melhior_01_44");	//Хорошо - я прослежу, чтобы он получил по заслугам. Такому человеку не место в наших рядах!
		Npc_ExchangeRoutine(melhior,"Gotcha");
		melhior.guild = GIL_NONE;
		Npc_SetTrueGuild(melhior,GIL_NONE);
		AI_UnequipArmor(melhior);
		AI_UnequipWeapons(melhior);
		Npc_RemoveInvItems(melhior,ItAr_PAL_M,1);
		Npc_RemoveInvItems(melhior,ItMw_1h_Pal_Sword,1);
		CreateInvItems(melhior,ITAR_Bau_L,1);
		AI_EquipArmor(melhior,ITAR_Bau_L);
	}
	else if(other.guild == GIL_KDW)
	{
		B_GivePlayerXP(250);
		AI_Output(other,self,"DIA_Lord_Hagen_Melhior_01_48");	//Один из паладинов ведет себя неподобающе своему положению.
		AI_Output(self,other,"DIA_Lord_Hagen_Melhior_01_50");	//(возмущенно) Как это понимать? Объясни!
		AI_Output(other,self,"DIA_Lord_Hagen_Melhior_01_51");	//Он отсутствовал на посту во время своего дежурства, а кроме этого еще был в стельку пьян!
		AI_Output(self,other,"DIA_Lord_Hagen_Melhior_01_54");	//ЧТО?! Это возмутительно...
		AI_Output(self,other,"DIA_Lord_Hagen_Melhior_01_57");	//Как его имя?
		AI_Output(other,self,"DIA_Lord_Hagen_Melhior_01_58");	//Его зовут Мельхиор.
		AI_Output(self,other,"DIA_Lord_Hagen_Melhior_01_59");	//Хорошо - я прослежу, чтобы он получил по заслугам. Такому человеку не место в наших рядах!
		Npc_ExchangeRoutine(melhior,"Gotcha");
		melhior.guild = GIL_NONE;
		Npc_SetTrueGuild(melhior,GIL_NONE);
		AI_UnequipArmor(melhior);
		AI_UnequipWeapons(melhior);
		Npc_RemoveInvItems(melhior,ItAr_PAL_M,1);
		Npc_RemoveInvItems(melhior,ItMw_1h_Pal_Sword,1);
		CreateInvItems(melhior,ITAR_Bau_L,1);
		AI_EquipArmor(melhior,ITAR_Bau_L);
	}
	else if(other.guild == GIL_KDM)
	{
		AI_Output(other,self,"DIA_Lord_Hagen_Melhior_01_63");	//Один из паладинов ведет себя неподобающе своему положению.
		AI_Output(self,other,"DIA_Lord_Hagen_Melhior_01_65");	//(возмущенно) Как это понимать? Объясни!
		AI_Output(other,self,"DIA_Lord_Hagen_Melhior_01_66");	//Он отсутствовал на посту во время своего дежурства, а кроме этого еще был в стельку пьян!
		AI_Output(self,other,"DIA_Lord_Hagen_Melhior_01_70");	//И неужели ты думаешь, что я поверю хотя бы одному твоему слову, некромант?
		AI_Output(self,other,"DIA_Lord_Hagen_Melhior_01_71");	//То, что ты говоришь, не может быть правдой! Это полная чушь!
		AI_Output(self,other,"DIA_Lord_Hagen_Melhior_01_72");	//Паладин не может так низко пасть!
		AI_Output(self,other,"DIA_Lord_Hagen_Melhior_01_75");	//А теперь убирайся, и не смей более обращаться ко мне с подобными жалобами!
		AI_StopProcessInfos(self);
	}
	else if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(other,self,"DIA_Lord_Hagen_Melhior_01_77");	//Один из паладинов ведет себя неподобающе своему положению.
		AI_Output(self,other,"DIA_Lord_Hagen_Melhior_01_79");	//(возмущенно) Как это понимать? Объясни!
		AI_Output(other,self,"DIA_Lord_Hagen_Melhior_01_80");	//Он отсутствовал на посту во время своего дежурства, а кроме этого еще был в стельку пьян!
		AI_Output(self,other,"DIA_Lord_Hagen_Melhior_01_84");	//И неужели ты думаешь, что я поверю хотя бы одному твоему слову, грязный наемник?
		AI_Output(self,other,"DIA_Lord_Hagen_Melhior_01_85");	//То, что ты говоришь, не может быть правдой! Это полная чушь!
		AI_Output(self,other,"DIA_Lord_Hagen_Melhior_01_86");	//Паладин не может так низко пасть!
		AI_Output(self,other,"DIA_Lord_Hagen_Melhior_01_89");	//А теперь убирайся, и не смей более обращаться ко мне с подобными жалобами!
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(other,self,"DIA_Lord_Hagen_Melhior_01_91");	//Один из паладинов ведет себя неподобающе своему положению!
		AI_Output(self,other,"DIA_Lord_Hagen_Melhior_01_93");	//(возмущенно) Как это понимать? Объясни!
		AI_Output(other,self,"DIA_Lord_Hagen_Melhior_01_94");	//Он отсутствовал на посту во время своего дежурства, а кроме этого еще был в стельку пьян!
		AI_Output(self,other,"DIA_Lord_Hagen_Melhior_01_97");	//(ехидно) Да ну?
		AI_Output(self,other,"DIA_Lord_Hagen_Melhior_01_98");	//И неужели ты думаешь, что я поверю хотя бы одному твоему слову?
		AI_Output(self,other,"DIA_Lord_Hagen_Melhior_01_99");	//То, что ты говоришь, не может быть правдой! Это полная чушь!
		AI_Output(self,other,"DIA_Lord_Hagen_Melhior_01_100");	//Паладин не может так низко пасть!
		AI_Output(self,other,"DIA_Lord_Hagen_Melhior_01_103");	//А теперь убирайся, и не смей более обращаться ко мне с подобными жалобами!
		AI_StopProcessInfos(self);
	};
};


instance DIA_LORD_HAGEN_PALADINFOOD(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 2;
	condition = dia_lord_hagen_paladinfood_condition;
	information = dia_lord_hagen_paladinfood_info;
	permanent = FALSE;
	description = "Меня прислал торговец Лютеро.";
};

func int dia_lord_hagen_paladinfood_condition()
{
	if(MIS_PALADINFOOD == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_lord_hagen_paladinfood_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_PaladinFood_01_00");	//Меня прислал торговец Лютеро.
	AI_Output(other,self,"DIA_Lord_Hagen_PaladinFood_01_09");	//Он просит тебя предоставить ему точные объемы этих продовольственных поставок.
	AI_Output(self,other,"DIA_Lord_Hagen_PaladinFood_01_14");	//Хмм... Понимаешь, я могу лишь предоставить тебе сведения по продовольствию для тех паладинов, которые находятся здесь в Хоринисе.
	AI_Output(self,other,"DIA_Lord_Hagen_PaladinFood_01_15");	//Однако кроме них существуют и другие отряды.
	AI_Output(self,other,"DIA_Lord_Hagen_PaladinFood_01_18");	//Эта экспедиция была очень важна для короля, поэтому в Хоринис прибыло не менее сотни лучших бойцов ордена.
	AI_Output(self,other,"DIA_Lord_Hagen_PaladinFood_01_20");	//Но в городе было слишком мало места, чтобы разместить их всех.
	AI_Output(self,other,"DIA_Lord_Hagen_PaladinFood_01_21");	//По этой причине большая часть паладинов под командованием лорда Варуса и отправилась в королевский форт Азган.
	AI_Output(other,self,"DIA_Lord_Hagen_PaladinFood_01_22");	//Королевский форт? Здесь на острове?
	AI_Output(self,other,"DIA_Lord_Hagen_PaladinFood_01_23");	//Нет. Он находится на одном из маленьких островков рядом с самим Хоринисом.
	AI_Output(self,other,"DIA_Lord_Hagen_PaladinFood_01_24");	//Просто единственный путь, который ведет в этот форт, находится на этом острове.
	AI_Output(self,other,"DIA_Lord_Hagen_PaladinFood_01_25");	//Подземный проход в горах, к востоку от самого города. Всего день пути - и ты уже на месте.
	AI_Output(self,other,"DIA_Lord_Hagen_PaladinFood_01_27");	//Вот поэтому мои расчеты относительно объемов этих поставок могут быть неточными.

	if((MIS_OLDWORLD == LOG_SUCCESS) && (MIS_OCGateOpen == FALSE))
	{
		AI_Output(self,other,"DIA_Lord_Hagen_PaladinFood_01_28");	//Кроме этого, не забывай и про отряд Гаронда. Его люди также нуждаются в еде.
		AI_Output(self,other,"DIA_Lord_Hagen_PaladinFood_01_29");	//Правда, пока орки осаждают замок в Долине Рудников, доставить им продовольствие не представляется возможным.
		AI_Output(self,other,"DIA_Lord_Hagen_PaladinFood_01_30");	//Но скоро мы исправим эту ситуацию...(грозно)
	};

	AI_Output(other,self,"DIA_Lord_Hagen_PaladinFood_01_32");	//И как мне получить точные сведения о продовольствии?
	AI_Output(self,other,"DIA_Lord_Hagen_PaladinFood_01_34");	//Думаю, мы можем поступить следующим образом...
	AI_Output(self,other,"DIA_Lord_Hagen_PaladinFood_01_35");	//Я отправлю человека в форт Азган к командующему Варусу.
	AI_Output(self,other,"DIA_Lord_Hagen_PaladinFood_01_36");	//Он подготовит список всех тех припасов, которые нужны ему и его людям.
	AI_Output(self,other,"DIA_Lord_Hagen_PaladinFood_01_37");	//А я в свою очередь подготовлю такой же перечень необходимой провизии, но только для тех паладинов, что находятся под моим командованием.
	AI_Output(self,other,"DIA_Lord_Hagen_PaladinFood_01_38");	//Думаю, это даст вполне точную картину тех объемов продовольствия, которые необходимы всей нашей экспедиции.
	AI_Output(self,other,"DIA_Lord_Hagen_PaladinFood_01_41");	//Однако я не могу послать к Варусу никого из моих людей.
	AI_Output(self,other,"DIA_Lord_Hagen_PaladinFood_01_43");	//Поэтому, мне кажется, что самая подходящая кандидатура на роль такого посыльного - это ты.
	AI_Output(self,other,"DIA_Lord_Hagen_PaladinFood_01_44");	//Согласен?
	Info_ClearChoices(dia_lord_hagen_paladinfood);
	Info_AddChoice(dia_lord_hagen_paladinfood,"Нет! Пошли кого-нибудь другого.",dia_lord_hagen_paladinfood_no);
	Info_AddChoice(dia_lord_hagen_paladinfood,"Хорошо, я согласен.",dia_lord_hagen_paladinfood_ok);
};

func void dia_lord_hagen_paladinfood_no()
{
	HAGENFUCKTOVARUS = TRUE;
	AI_Output(other,self,"DIA_Lord_Hagen_PaladinFood_No_01_00");	//Нет! Пошли кого-нибудь другого.

	if((other.guild == GIL_PAL) || (other.guild == GIL_MIL))
	{
		AI_Output(self,other,"DIA_Lord_Hagen_PaladinFood_No_01_01");	//Считай, что это приказ, солдат!
		AI_Output(self,other,"DIA_Lord_Hagen_PaladinFood_No_01_02");	//А приказы не обсуждают...(грозно) Их выполняют!
	}
	else
	{
		AI_Output(self,other,"DIA_Lord_Hagen_PaladinFood_No_01_03");	//(сердито) Но я же тебе объяснил, что не могу никого туда послать!
		AI_Output(self,other,"DIA_Lord_Hagen_PaladinFood_No_01_04");	//Да и потом - паладины оказали большую честь вашей гильдии, что согласились на эти поставки.
		AI_Output(self,other,"DIA_Lord_Hagen_PaladinFood_No_01_06");	//И оставим эти ненужные никому споры!
	};
};

func void dia_lord_hagen_paladinfood_ok()
{
	AI_Output(other,self,"DIA_Lord_Hagen_PaladinFood_Ok_01_00");	//Хорошо, я согласен.

	if(HAGENFUCKTOVARUS == TRUE)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_PaladinFood_Ok_01_01");	//(сердито) Так-то лучше.
	}
	else
	{
		B_GivePlayerXP(150);
		AI_Output(self,other,"DIA_Lord_Hagen_PaladinFood_Ok_01_02");	//Другого ответа я от тебя и не ожидал.
	};

	AI_Output(self,other,"DIA_Lord_Hagen_PaladinFood_Ok_01_03");	//Теперь отправляйся к Варусу. А я, за время твоего отсутствия, подготовлю свой список.
	AI_Output(self,other,"DIA_Lord_Hagen_PaladinFood_Ok_01_04");	//После того как вернешься из Азгана, зайдешь ко мне и заберешь его.
	AI_Output(self,other,"DIA_Lord_Hagen_PaladinFood_Ok_01_09");	//Вот, возьми этот приказ, - увидев его, стражники тебя пропустят в форт.
	AI_Output(self,other,"DIA_Lord_Hagen_PaladinFood_Ok_01_10");	//Теперь можешь идти.
	B_GiveInvItems(self,other,itwr_hagenorderfort,1);
	AI_Output(other,self,"DIA_Lord_Hagen_PaladinFood_Ok_01_11");	//Хорошо.
	HAGENSENTTOVARUS = TRUE;
	B_LogEntry(TOPIC_PALADINFOOD,"Поговорив с лордом Хагеном, я узнал, что паладины, расположившиеся в Хоринисе - не весь корпус экспедиции, прибывшей на остров. Большинство из них под командованием лорда Варуса отправилось в форт Азган, расположенный на одном из близлежащих к Хоринису островков. Для них также предполагается наладить поставки продовольствия, и чтобы назвать их точные объемы, лорд Хаген решил отправить меня в форт к Варусу, чтобы тот в свою очередь составил список необходимого для его людей провианта. А в это время лорд Хаген подготовит такой же список для своих паладинов.");
	Log_AddEntry(TOPIC_PALADINFOOD,"Попасть в форт можно только через подземный проход, вход в который находится здесь на острове - к востоку от самого города. Лорд Хаген дал мне приказ, который позволит мне миновать охрану прохода.");
	Info_ClearChoices(dia_lord_hagen_paladinfood);
};


instance DIA_LORD_HAGEN_PALADINFOODDONE(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 2;
	condition = dia_lord_hagen_paladinfooddone_condition;
	information = dia_lord_hagen_paladinfooddone_info;
	permanent = FALSE;
	description = "У меня есть список от Варуса.";
};


func int dia_lord_hagen_paladinfooddone_condition()
{
	if((MIS_PALADINFOOD == LOG_Running) && (VARUSSENTTOHAGEN == TRUE) && (Npc_HasItems(hero,itwr_varuscontent) >= 1))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_paladinfooddone_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Lord_Hagen_PaladinFoodDone_01_00");	//У меня есть список от Варуса.
	B_GiveInvItems(other,self,itwr_varuscontent,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Lord_Hagen_PaladinFoodDone_01_03");	//Хммм... очень интересно...
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Lord_Hagen_PaladinFoodDone_01_04");	//Отлично! Мне все ясно.
	AI_Output(self,other,"DIA_Lord_Hagen_PaladinFoodDone_01_06");	//Пока ты отсутствовал, я подготовил перечень необходимого продовольствия для своих людей.
	AI_Output(self,other,"DIA_Lord_Hagen_PaladinFoodDone_01_07");	//Теперь мы просто объединим оба этих списка.
	AI_Output(self,other,"DIA_Lord_Hagen_PaladinFoodDone_01_08");	//Думаю, это даст точное представление о требуемых объемах поставки продовольствия.
	AI_Output(self,other,"DIA_Lord_Hagen_PaladinFoodDone_01_09");	//Подожди минутку...
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Lord_Hagen_PaladinFoodDone_01_10");	//Готово! Вот, возьми этот дополненный список и отнеси его Лютеро.
	B_GiveInvItems(self,other,itwr_hagencontent,1);
	AI_Output(self,other,"DIA_Lord_Hagen_PaladinFoodDone_01_11");	//В нем все, что нам нужно.
	AI_Output(other,self,"DIA_Lord_Hagen_PaladinFoodDone_01_12");	//Хорошо.
	B_LogEntry(TOPIC_PALADINFOOD,"Я принес лорду Хагену список провианта, составленный лордом Варусом. Ознакомившись с ним, глава паладинов дополнил этот список тем, что необходимо непосредственно для паладинов в городе и отдал его мне. Самое время идти к Лютеро.");
};


instance DIA_LORD_HAGEN_KAP6_EXIT(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 999;
	condition = dia_lord_hagen_kap6_exit_condition;
	information = dia_lord_hagen_kap6_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_lord_hagen_kap6_exit_condition()
{
	if(Kapitel >= 6)
	{
		return TRUE;
	};
};

func void dia_lord_hagen_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LORD_HAGEN_BEFOREBATTLE(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 2;
	condition = dia_lord_hagen_beforebattle_condition;
	information = dia_lord_hagen_beforebattle_info;
	permanent = TRUE;
	description = "Как обстоят дела?";
};

func int dia_lord_hagen_beforebattle_condition()
{
	if((MOVEFORCESCOMPLETE_01 == TRUE) && (ALLGREATVICTORY == FALSE))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_beforebattle_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_BeforeBattle_01_00");	//Как обстоят дела?

	if((STOPBIGBATTLE == TRUE) && (HERONOTJOINBIGBATTLE == FALSE))
	{
		if(ORCSWINSBB == TRUE)
		{
			AI_Output(self,other,"DIA_Lord_Hagen_BeforeBattle_01_01");	//А разве это не ясно? (обреченно) Хуже даже в страшном сне не придумаешь!
			AI_Output(self,other,"DIA_Lord_Hagen_BeforeBattle_01_02");	//Мы потерпели сокрушительное поражение в этой битве, и теперь оркам ничто не помешает безраздельно властвовать на этом острове.
			AI_Output(other,self,"DIA_Lord_Hagen_BeforeBattle_01_04");	//Но еще не все потеряно! Нам надо продолжать сражаться.
			AI_Output(self,other,"DIA_Lord_Hagen_BeforeBattle_01_05");	//Эх, парень, было бы кем...(печально) На этом острове уже практически не осталось никого, кто бы мог бросить вызов этим тварям.
			AI_Output(self,other,"DIA_Lord_Hagen_BeforeBattle_01_06");	//Может быть, только это тебе под силу.
		}
		else
		{
			AI_Output(self,other,"DIA_Lord_Hagen_BeforeBattle_01_08");	//Теперь, когда огромная армия орков уничтожена, нам можно будет вздохнуть куда более спокойно.
			AI_Output(self,other,"DIA_Lord_Hagen_BeforeBattle_01_09");	//Конечно, в этой битве мы понесли просто ужасающие потери...(мрачно) Но иначе, по всей видимости, было просто нельзя.
			AI_Output(self,other,"DIA_Lord_Hagen_BeforeBattle_01_10");	//В конце концов, мы все-таки победили. А сейчас это главное!
		};
	}
	else if(MOVEFORCESCOMPLETE_02 == TRUE)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_BeforeBattle_01_11");	//Хорошо.
	}
	else
	{
		AI_Output(self,other,"DIA_Lord_Hagen_BeforeBattle_01_14");	//Пока никаких изменений. Однако мы все же пытаемся понять, каким образом орки собираются действовать дальше, чтобы выработать собственный план действий на этот случай.
		AI_Output(self,other,"DIA_Lord_Hagen_BeforeBattle_01_15");	//Возможно, они захотят обойти нас с флангов или с тыла. Но, полагаю, что на это у них просто не хватит мозгов.
		AI_Output(self,other,"DIA_Lord_Hagen_BeforeBattle_01_16");	//Так что, скорее всего, они просто решат ударить по центру, надеясь на свое численное превосходство!
		AI_Output(self,other,"DIA_Lord_Hagen_BeforeBattle_01_17");	//Но оно им вряд ли поможет.
	};
};

instance DIA_LORD_HAGEN_WHOCOMMAND(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 2;
	condition = dia_lord_hagen_whocommand_condition;
	information = dia_lord_hagen_whocommand_info;
	permanent = FALSE;
	description = "Ты сейчас здесь командуешь?";
};


func int dia_lord_hagen_whocommand_condition()
{
	if((MOVEFORCESCOMPLETE_01 == TRUE) && (MOVEFORCESCOMPLETE_02 == FALSE))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_whocommand_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_WhoCommand_01_00");	//Ты сейчас здесь командуешь?
	AI_Output(self,other,"DIA_Lord_Hagen_WhoCommand_01_01");	//Нет, не я...(серьезно) По общему решению большинства, командование над всей нашей армией было передано в компетенцию генерала Ли.
	AI_Output(other,self,"DIA_Lord_Hagen_WhoCommand_01_04");	//А что на это скажут твои люди?
	AI_Output(self,other,"DIA_Lord_Hagen_WhoCommand_01_05");	//Ничего. Поскольку я целиком и полностью доверяю Ли. А им этого вполне достаточно.
};

instance DIA_LORD_HAGEN_NewsKillDead(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 2;
	condition = dia_lord_hagen_NewsKillDead_condition;
	information = dia_lord_hagen_NewsKillDead_info;
	permanent = FALSE;
	description = "Есть еще новости?";
};

func int dia_lord_hagen_NewsKillDead_condition()
{
	if((MOVEFORCESCOMPLETE_01 == TRUE) && (Npc_KnowsInfo(other,DIA_Lord_Hagen_WhoCommand) == TRUE) && (NewsKillDead == TRUE))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_NewsKillDead_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Lord_Hagen_NewsKillDead_01_00");	//Есть еще новости?
	AI_Output(self,other,"DIA_Lord_Hagen_NewsKillDead_01_01");	//Тут недалеко от фермы промышляла какая-то странная банда.
	AI_Output(self,other,"DIA_Lord_Hagen_NewsKillDead_01_02");	//Мы не можем допустить, чтобы в такое непростое время нам еще и угрожали бандиты.
	AI_Output(self,other,"DIA_Lord_Hagen_NewsKillDead_01_03");	//Но мои люди уже с этим разобрались. Теперь все эти ублюдки мертвы!
};

instance DIA_LORD_HAGEN_LEECARE(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 1;
	condition = dia_lord_hagen_leecare_condition;
	information = dia_lord_hagen_leecare_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_lord_hagen_leecare_condition()
{
	if((BIGBATTLEBACKPOSITION == TRUE) && (ALLGREATVICTORY == FALSE) && (HERONOTJOINBIGBATTLE == FALSE))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_leecare_info()
{
	AI_Output(self,other,"DIA_Lord_Hagen_LeeCare_01_00");	//Черт! Что такое?! Что с Ли?
	AI_Output(other,self,"DIA_Lord_Hagen_LeeCare_01_01");	//Кажется, орки сильно ранили его в бою. Ему срочно нужно на ферму.
	AI_Output(self,other,"DIA_Lord_Hagen_LeeCare_01_02");	//Проклятые твари! Только этого нам еще не хватало - после такой победы потерять нашего командира.
	AI_Output(self,other,"DIA_Lord_Hagen_LeeCare_01_03");	//Ладно, я сам лично позабочусь о нем! Сделаю все, что в моих силах.
	AI_Output(self,other,"DIA_Lord_Hagen_LeeCare_01_04");	//Тебя же хочу поблагодарить за твою помощь в этой битве. Она оказалась просто неоценимой.

	if(IAMKILLORCSBB >= 40)
	{
		B_GivePlayerXP(500);
		AI_Output(self,other,"DIA_Lord_Hagen_LeeCare_01_06");	//Ты собственноручно прикончил больше трети этих тварей!
		AI_Output(self,other,"DIA_Lord_Hagen_LeeCare_01_07");	//И могу тебе сказать прямо: ни одному моему паладину такое не под силу!
	};
};

instance DIA_LORD_HAGEN_NEWORDERS(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 1;
	condition = dia_lord_hagen_neworders_condition;
	information = dia_lord_hagen_neworders_info;
	permanent = FALSE;
	description = "Что нам делать дальше?";
};

func int dia_lord_hagen_neworders_condition()
{
	if((BIGBATTLEBACKPOSITION == TRUE) && Npc_KnowsInfo(hero,dia_lord_hagen_leecare) && (ALLGREATVICTORY == FALSE) && (HERONOTJOINBIGBATTLE == FALSE))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_neworders_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_NewOrders_01_01");	//Что нам делать дальше?
	AI_Output(self,other,"DIA_Lord_Hagen_NewOrders_01_04");	//В этом бою наши потери оказались слишком велики...(мрачно)
	AI_Output(self,other,"DIA_Lord_Hagen_NewOrders_01_05");	//Поэтому не думаю, что оставшихся моих людей хватит на то, чтобы снять осаду с монастыря и освободить город.
	AI_Output(self,other,"DIA_Lord_Hagen_NewOrders_01_23");	//Остатки своих людей я отведу обратно на ферму и займу там оборону.
	AI_Output(self,other,"DIA_Lord_Hagen_NewOrders_01_25");	//Ее никак нельзя потерять, поскольку тогда нам просто некуда будет отступать.
	AI_Output(other,self,"DIA_Lord_Hagen_NewOrders_01_26");	//Тогда я займусь оставшимися отрядами орков.
	AI_Output(self,other,"DIA_Lord_Hagen_NewOrders_01_31");	//Хорошо, внеси небольшую панику в их ряды.
	AI_Output(self,other,"DIA_Lord_Hagen_NewOrders_01_35");	//Ты, конечно, бы мог попробовать освободить весь Хоринис целиком.
	AI_Output(self,other,"DIA_Lord_Hagen_NewOrders_01_36");	//Но полагаю, что даже тебе такое будет не под силу.
	AI_Output(self,other,"DIA_Lord_Hagen_NewOrders_01_37");	//Так что просто сделай то, о чем я тебе сказал ранее.
	b_againgatherallonbigfarm();
	MIS_KILLTHEMALL = LOG_Running;
	Log_CreateTopic(TOPIC_KILLTHEMALL,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KILLTHEMALL,LOG_Running);
	B_LogEntry(TOPIC_KILLTHEMALL,"Теперь, когда огромная армия орков разбита, нам надо решить, что делать дальше. Поговорив с лордом Хагеном, который принял командование на себя, мне удалось выяснить его дальнейшие планы. Судя по всему, он планирует отвести остаток своих людей на ферму и вновь занять там оборону. По его мнению, орки все еще сильны и, следовательно, могут атаковать нас в любой момент. А потеряв ферму, мы лишимся последнего рубежа обороны.");
	Log_AddEntry(TOPIC_KILLTHEMALL,"В свою очередь, глава паладинов попросил меня по возможности позаботиться некоторым образом о самих орках. Конечно, о штурме Хориниса речи пока не идет, но внести небольшую панику в их ряды нам вполне по силам. Чем больше орков я смогу убить, тем будет лучше для всех нас.");
};


instance DIA_LORD_HAGEN_NEWORDERS_NF(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 1;
	condition = dia_lord_hagen_neworders_NF_condition;
	information = dia_lord_hagen_neworders_NF_info;
	permanent = FALSE;
	description = "Как ситуация?";
};

func int dia_lord_hagen_neworders_NF_condition()
{
	if((BIGBATTLEBACKPOSITION == TRUE) && (ALLGREATVICTORY == FALSE) && (HERONOTJOINBIGBATTLE == TRUE))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_neworders_NF_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_KAP3U4_PERM_15_00");	//Как ситуация?
	AI_Output(self,other,"DIA_Lord_Hagen_NewOrders_NF_01_40");	//Ты ведь наверняка уже знаешь, что, пока тебя не было, у нас произошло крупное сражение с орками.
	AI_Output(self,other,"DIA_Lord_Hagen_NewOrders_NF_01_41");	//Если нет, то тебе будет интересно узнать, что мы одержали верх над этими тварями!
	AI_Output(self,other,"DIA_Lord_Hagen_NewOrders_NF_01_04");	//Однако в этом бою наши потери оказались слишком велики...(мрачно)
	AI_Output(self,other,"DIA_Lord_Hagen_NewOrders_NF_01_05");	//Поэтому не думаю, что оставшихся моих людей хватит на то, чтобы снять осаду с монастыря и освободить город.
	AI_Output(other,self,"DIA_Lord_Hagen_NewOrders_NF_01_26");	//Тогда я займусь оставшимися отрядами орков.
	AI_Output(self,other,"DIA_Lord_Hagen_NewOrders_NF_01_31");	//Хорошо, внеси небольшую панику в их ряды.
	AI_Output(self,other,"DIA_Lord_Hagen_NewOrders_NF_01_35");	//Ты, конечно, бы мог попробовать освободить весь Хоринис целиком.
	AI_Output(self,other,"DIA_Lord_Hagen_NewOrders_NF_01_36");	//Но полагаю, что даже тебе такое будет не под силу.
	AI_Output(self,other,"DIA_Lord_Hagen_NewOrders_NF_01_37");	//Так что просто сделай то, о чем я тебе сказал ранее.
	b_againgatherallonbigfarm();
	MIS_KILLTHEMALL = LOG_Running;
	Log_CreateTopic(TOPIC_KILLTHEMALL,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KILLTHEMALL,LOG_Running);
	B_LogEntry(TOPIC_KILLTHEMALL,"Теперь, когда огромная армия орков разбита, нам надо решить - что делать дальше. Поговорив с лордом Хагеном, который принял командование на себя, мне удалось выяснить его дальнейшие планы. Судя по всему, он планирует отвести остаток своих людей на ферму и вновь занять там оборону. По его мнению, орки все еще сильны и, следовательно, могут атаковать нас в любой момент. А потеряв ферму, мы лишимся последнего рубежа обороны.");
	Log_AddEntry(TOPIC_KILLTHEMALL,"В свою очередь, глава паладинов попросил меня по возможности позаботиться некоторым образом о самих орках. Конечно, о штурме Хориниса речи пока не идет, но внести небольшую панику в их ряды нам вполне по силам. Чем больше орков я смогу убить, тем будет лучше для всех нас.");
};

instance DIA_LORD_HAGEN_NEEDHELP(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 1;
	condition = dia_lord_hagen_needhelp_condition;
	information = dia_lord_hagen_needhelp_info;
	permanent = FALSE;
	description = "Мне понадобится помощь!";
};

func int dia_lord_hagen_needhelp_condition()
{
	if((MIS_KILLTHEMALL == LOG_Running) && (ALLGREATVICTORY == FALSE))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_needhelp_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_NeedHelp_01_01");	//Мне понадобится помощь!
	AI_Output(other,self,"DIA_Lord_Hagen_NeedHelp_01_02");	//В одиночку будет достаточно сложно сражаться с таким количеством орков.
	AI_Output(self,other,"DIA_Lord_Hagen_NeedHelp_01_03");	//(серьезно) У меня не так много людей. Каждый человек сейчас на счету.
	AI_Output(self,other,"DIA_Lord_Hagen_NeedHelp_01_04");	//Но можешь взять себе в помощь несколько добровольцев, кто не откажется помочь тебе в этом.
	HAGENGIVEHELP = TRUE;
	B_LogEntry(TOPIC_KILLTHEMALL,"Полагаю, сражаться одному против такого количества орков будет нелегко. Я могу взять с собой несколько добровольцев, готовых мне в этом помочь.");
};


instance DIA_LORD_HAGEN_RUNEMAGICNOTWORK(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 1;
	condition = dia_lord_hagen_runemagicnotwork_condition;
	information = dia_lord_hagen_runemagicnotwork_info;
	permanent = FALSE;
	description = "Что с вашей магией?";
};


func int dia_lord_hagen_runemagicnotwork_condition()
{
	if((STOPBIGBATTLE == TRUE) && (MIS_RUNEMAGICNOTWORK == LOG_Running) && (PALADINRUNESNOT == FALSE))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_runemagicnotwork_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Lord_Hagen_RuneMagicNotWork_01_00");	//Что с вашей магией?
	AI_Output(self,other,"DIA_Lord_Hagen_RuneMagicNotWork_01_01");	//Она перестала работать! Черт...
	AI_Output(self,other,"DIA_Lord_Hagen_RuneMagicNotWork_01_02");	//Теперь все наши магические руны превратились лишь в жалкие куски никчемного камня!
	B_LogEntry(TOPIC_RUNEMAGICNOTWORK,"Паладины также не могут больше использовать свои магические руны.");
	PALADINRUNESNOT = TRUE;
};


instance DIA_LORD_HAGEN_KILLTHEMALLDONE(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 1;
	condition = dia_lord_hagen_killthemalldone_condition;
	information = dia_lord_hagen_killthemalldone_info;
	permanent = FALSE;
	description = "По поводу орков...";
};


func int dia_lord_hagen_killthemalldone_condition()
{
	if((MIS_KILLTHEMALL == LOG_SUCCESS) && (ALLGREATVICTORY == FALSE))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_killthemalldone_info()
{
	B_GivePlayerXP(2000);
	AI_Output(other,self,"DIA_Lord_Hagen_KillThemAllDone_01_00");	//По поводу орков...
	AI_Output(self,other,"DIA_Lord_Hagen_KillThemAllDone_01_01");	//Да? Тебе есть что сообщить?
	AI_Output(other,self,"DIA_Lord_Hagen_KillThemAllDone_01_02");	//Думаю, я убил достаточно этих тварей, чтобы посеять панику в их ряды.
	AI_Output(self,other,"DIA_Lord_Hagen_KillThemAllDone_01_03");	//Превосходно! Это просто отличные новости.
	AI_Output(self,other,"DIA_Lord_Hagen_KillThemAllDone_01_04");	//Теперь, полагаю, что орки не станут нам досаждать. По крайней мере в ближайшее время.
	AI_Output(self,other,"DIA_Lord_Hagen_KillThemAllDone_01_05");	//Так что прими от меня мою сердечную благодарность по этому поводу.
};


instance DIA_LORD_HAGEN_BACKTOHOME(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 1;
	condition = dia_lord_hagen_backtohome_condition;
	information = dia_lord_hagen_backtohome_info;
	permanent = FALSE;
	description = "Рунная магия уничтожена!";
};


func int dia_lord_hagen_backtohome_condition()
{
	if(MIS_RUNEMAGICNOTWORK == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_lord_hagen_backtohome_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Lord_Hagen_BackToHome_01_00");	//Рунная магия уничтожена!
	AI_Output(self,other,"DIA_Lord_Hagen_BackToHome_01_01");	//ЧТО? Да ты в своем уме? Как это понимать?!
	AI_Output(other,self,"DIA_Lord_Hagen_BackToHome_01_02");	//Не горячись. Сам Пирокар попросил меня передать тебе эту новость.
	AI_Output(self,other,"DIA_Lord_Hagen_BackToHome_01_04");	//Но... но как? О милосердный Иннос! Неужели он так и сказал?
	AI_Output(self,other,"DIA_Lord_Hagen_BackToHome_01_06");	//Тогда, в таком случае, у всех нас серьезные проблемы!
	AI_Output(self,other,"DIA_Lord_Hagen_BackToHome_01_10");	//Пока у нас была рунная магия и магическая руда, у паладинов короля был шанс сдерживать орды орков, заполонивших все окрестности Миртаны.
	AI_Output(self,other,"DIA_Lord_Hagen_BackToHome_01_11");	//Но теперь, когда руда полностью иссякла, а наши магические руны потеряли свою силу, этих тварей ничто не остановит!
	AI_Output(self,other,"DIA_Lord_Hagen_BackToHome_01_12");	//Исход этой войны практически предрешен, и он далеко не в нашу пользу.
};


instance DIA_LORD_HAGEN_WHYORE(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 1;
	condition = dia_lord_hagen_whyore_condition;
	information = dia_lord_hagen_whyore_info;
	permanent = FALSE;
	description = "Почему руда имеет такое важное значение в этой войне?";
};


func int dia_lord_hagen_whyore_condition()
{
	if(Npc_KnowsInfo(hero,dia_lord_hagen_backtohome))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_whyore_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_WhyOre_01_00");	//Почему руда имеет такое важное значение в этой войне?
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_WhyOre_01_01");	//(удивленно) Как паладин короля, ты должен сам знать об этом!
	}
	else
	{
		AI_Output(self,other,"DIA_Lord_Hagen_WhyOre_01_02");	//(ехидно) Был бы ты паладином - сам бы знал об этом!
	};
	AI_Output(self,other,"DIA_Lord_Hagen_WhyOre_01_06");	//Главное ее преимущество заключается не в этом, а в самой магии, которую она содержит!
	AI_Output(self,other,"DIA_Lord_Hagen_WhyOre_01_07");	//Оружие из нее способно пробивать самую прочную броню.
	AI_Output(self,other,"DIA_Lord_Hagen_WhyOre_01_09");	//Ну, и кроме того, только рудный клинок может быть предан церемонии освящения.
	AI_Output(self,other,"DIA_Lord_Hagen_WhyOre_01_10");	//Сам Иннос вкладывает в него частицу своей божественной силы и делает его воистину смертоносным оружием!
	AI_Output(self,other,"DIA_Lord_Hagen_WhyOre_01_11");	//Конечно, для этого ты должен быть прежде всего паладином, иначе просто не сможешь совладать с силой этого клинка.
	AI_Output(self,other,"DIA_Lord_Hagen_WhyOre_01_12");	//Вот именно поэтому магическая руда так и важна для нас в этой войне.
	AI_Output(self,other,"DIA_Lord_Hagen_WhyOre_01_13");	//А без нее нам никогда не остановить орков, имеющих подавляющее численное преимущество перед армией короля.
};


instance DIA_PAL_200_HAGEN_HIDDENORE(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 2;
	condition = dia_pal_200_hagen_hiddenore_condition;
	information = dia_pal_200_hagen_hiddenore_info;
	permanent = FALSE;
	description = "У меня есть для тебя одно очень важное сообщение!";
};


func int dia_pal_200_hagen_hiddenore_condition()
{
	if(Npc_KnowsInfo(hero,dia_lord_hagen_backtohome) && (Npc_HasItems(hero,itmi_seamaplostisland) >= 1) && (HAGENTAKESMAPSORE == FALSE))
	{
		return TRUE;
	};
};

func void dia_pal_200_hagen_hiddenore_info()
{
	AI_Output(other,self,"DIA_PAL_200_Hagen_HiddenOre_01_00");	//У меня есть для тебя одно очень важное сообщение!
	AI_Output(self,other,"DIA_PAL_200_Hagen_HiddenOre_01_01");	//Да? И в чем же оно заключается?
	AI_Output(other,self,"DIA_PAL_200_Hagen_HiddenOre_01_03");	//Когда мы были в море, то случайно наткнулись на один необитаемый остров, доверху набитый залежами магической руды.
	AI_Output(other,self,"DIA_PAL_200_Hagen_HiddenOre_01_04");	//Вот я и решил, что, возможно, паладинам было бы интересно узнать об этом.
	AI_Output(self,other,"DIA_PAL_200_Hagen_HiddenOre_01_05");	//Что? Ты серьезно? Но этого просто быть не может!
	AI_Output(other,self,"DIA_PAL_200_Hagen_HiddenOre_01_06");	//Поверь мне, это так. Найденная нами магическая руда и была одной из тех причин, по которой мы вернулись обратно.
	AI_Output(self,other,"DIA_PAL_200_Hagen_HiddenOre_01_07");	//Невероятно! Я и представить себе не мог, что такое возможно.
	AI_Output(self,other,"DIA_PAL_200_Hagen_HiddenOre_01_08");	//Если все, что ты говоришь, - правда, то это самая лучшая новость, которую я только мог услышать!
	AI_Output(self,other,"DIA_PAL_200_Hagen_HiddenOre_01_09");	//А то в последнее время они стали уж слишком большой редкостью.
	AI_Output(self,other,"DIA_PAL_200_Hagen_HiddenOre_01_12");	//А как далеко отсюда находится этот остров?
	AI_Output(other,self,"DIA_PAL_200_Hagen_HiddenOre_01_13");	//Всего лишь в нескольких днях плавания от Хориниса! Вот, взгляни сам.
	B_GiveInvItems(other,self,itmi_seamaplostisland,1);
	AI_Output(self,other,"DIA_PAL_200_Hagen_HiddenOre_01_14");	//Что это?
	AI_Output(other,self,"DIA_PAL_200_Hagen_HiddenOre_01_15");	//Это морская карта. Мой капитан сделал на ней пару отметин и проложил точный курс.
	AI_Output(other,self,"DIA_PAL_200_Hagen_HiddenOre_01_16");	//Так что найти этот остров теперь будет для вас не очень трудно.
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_PAL_200_Hagen_HiddenOre_01_17");	//Хммм...(внимательно разглядывая) Да, очень интересно.
	AI_Output(self,other,"DIA_PAL_200_Hagen_HiddenOre_01_18");	//Судя по этой карте, найденный вами клочок суши находится в неизведанной нами доселе части океана. Как вас туда занесло?
	AI_Output(other,self,"DIA_PAL_200_Hagen_HiddenOre_01_19");	//По дороге мы угодили в очень сильный шторм. Он-то нас и вывел к этому острову.
	AI_Output(self,other,"DIA_PAL_200_Hagen_HiddenOre_01_20");	//Да уж... И вправду говорят, что пути Инноса неисповедимы!
	AI_Output(self,other,"DIA_PAL_200_Hagen_HiddenOre_01_21");	//Уверен, что без его воли тут уж точно не обошлось.
	AI_Output(self,other,"DIA_PAL_200_Hagen_HiddenOre_01_23");	//Ну, что же...Тогда от имени всего нашего ордена прими мою искреннюю благодарность!
	AI_Output(self,other,"DIA_PAL_200_Hagen_HiddenOre_01_24");	//Будем надеяться, что найденная вами руда еще сможет помочь королю в войне против орков.
	HAGENTAKESMAPSORE = TRUE;
	if(LIGOFORGOLD == TRUE)
	{
		Info_ClearChoices(dia_pal_200_hagen_hiddenore);
		Info_AddChoice(dia_pal_200_hagen_hiddenore,"Не так быстро, паладин!",dia_pal_200_hagen_hiddenore_gold);
	}
	else if(LIGOFORUNKNOWN == TRUE)
	{
		Info_ClearChoices(dia_pal_200_hagen_hiddenore);
		Info_AddChoice(dia_pal_200_hagen_hiddenore,"Не так быстро, паладин!",dia_pal_200_hagen_hiddenore_gold);
		Info_AddChoice(dia_pal_200_hagen_hiddenore,"Само собой.",dia_pal_200_hagen_hiddenore_nothing);
	}
	else if(LIGOFORFREE == TRUE)
	{
		B_GivePlayerXP(200);
		AI_Output(other,self,"DIA_PAL_200_Hagen_HiddenOre_01_25");	//Само собой.
	};
};

func void dia_pal_200_hagen_hiddenore_gold()
{
	AI_Output(other,self,"DIA_PAL_200_Hagen_HiddenOre_Gold_01_01");	//Не так быстро, паладин! Боюсь, одной твоей благодарности будет маловато.
	AI_Output(self,other,"DIA_PAL_200_Hagen_HiddenOre_Gold_01_02");	//(удивленно) То есть? Что ты хочешь этим сказать?
	AI_Output(other,self,"DIA_PAL_200_Hagen_HiddenOre_Gold_01_03");	//Каждая информация всегда чего-то стоит. Тем более, такая ценная.
	AI_Output(self,other,"DIA_PAL_200_Hagen_HiddenOre_Gold_01_06");	//Ах, ну да...(надменно) Естественно! Было бы странно, если бы ты не заговорил со мной об этом.
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_PAL_200_Hagen_HiddenOre_Gold_01_07");	//Хотя, по правде говоря, я никак не ожидал таких слов от паладина!
	}
	else if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_PAL_200_Hagen_HiddenOre_Gold_01_08");	//Хотя, по правде говоря, я никак не ожидал таких слов от достопочтенного мага Огня!
	}
	else if(other.guild == GIL_KDW)
	{
		AI_Output(self,other,"DIA_PAL_200_Hagen_HiddenOre_Gold_01_09");	//Хотя, по правде говоря, я никак не ожидал таких слов от достопочтенного мага Воды!
	};
	AI_Output(other,self,"DIA_PAL_200_Hagen_HiddenOre_Gold_01_10");	//Давай оставим подробности. Лучше скажи, сколько ты мне заплатишь?
	AI_Output(self,other,"DIA_PAL_200_Hagen_HiddenOre_Gold_01_11");	//Хммм...(задумчиво) Ну, скажем, десять тысяч золотых монет. Тебя это устроит?
	AI_Output(other,self,"DIA_PAL_200_Hagen_HiddenOre_Gold_01_12");	//Вполне. Надеюсь, что я не продешевил.
	AI_Output(self,other,"DIA_PAL_200_Hagen_HiddenOre_Gold_01_13");	//Тебе решать! Вот, возьми свои деньги.
	B_GiveInvItems(self,other,ItMi_Gold,10000);
	AI_Output(other,self,"DIA_PAL_200_Hagen_HiddenOre_Gold_01_14");	//С тобой приятно иметь дело.
	AI_Output(self,other,"DIA_PAL_200_Hagen_HiddenOre_Gold_01_15");	//Хммм...(недовольно)
	Info_ClearChoices(dia_pal_200_hagen_hiddenore);
};

func void dia_pal_200_hagen_hiddenore_nothing()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_PAL_200_Hagen_HiddenOre_Nothing_01_01");	//Само собой.
	Info_ClearChoices(dia_pal_200_hagen_hiddenore);
};


instance DIA_LORD_HAGEN_OREONMAP(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 1;
	condition = dia_lord_hagen_oreonmap_condition;
	information = dia_lord_hagen_oreonmap_info;
	permanent = FALSE;
	description = "Та карта, что я тебе дал...";
};


func int dia_lord_hagen_oreonmap_condition()
{
	if((HAGENTAKESMAPSORE == TRUE) && Npc_KnowsInfo(hero,dia_lord_hagen_backtohome))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_oreonmap_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_OreOnMap_01_00");	//Та карта, что я тебе дал...
	AI_Output(other,self,"DIA_Lord_Hagen_OreOnMap_01_01");	//На ней был отмечен остров с огромными залежами магической руды.
	AI_Output(other,self,"DIA_Lord_Hagen_OreOnMap_01_02");	//Или быть может ты забыл об этом?
	AI_Output(self,other,"DIA_Lord_Hagen_OreOnMap_01_03");	//Ах да, твоя карта...(задумчиво) Нет, я о ней помню.
	AI_Output(other,self,"DIA_Lord_Hagen_OreOnMap_01_04");	//Тогда чего ты ждешь?
	AI_Output(other,self,"DIA_Lord_Hagen_OreOnMap_01_05");	//Воспользуйся этим - и у паладинов вновь появится шанс противостоять оркам.
	AI_Output(self,other,"DIA_Lord_Hagen_OreOnMap_01_07");	//В моей ситуации это лишь просто кусок бумаги и более ничего.
	AI_Output(self,other,"DIA_Lord_Hagen_OreOnMap_01_08");	//(серьезно) Эта карта нужна королю! Чтобы он отправил туда свою новую экспедицию и наладил поставки с рудой.
	AI_Output(other,self,"DIA_Lord_Hagen_OreOnMap_01_09");	//Тогда необходимо как можно скорее сообщить ему об этом!
	MIS_SALETOBIGLAND = LOG_Running;
	Log_CreateTopic(TOPIC_SALETOBIGLAND,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SALETOBIGLAND,LOG_Running);
	if(HORINISISFREE == TRUE)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_OreOnMap_01_11");	//Я не могу покинуть этот остров, пока не буду полностью уверенным в том, что угроза со стороны орков окончательно миновала!
		AI_Output(self,other,"DIA_Lord_Hagen_OreOnMap_01_14");	//Я должен буду позаботиться и о восстановлении города, не говоря про его защиту.
		CANSALETOBIGLAND = TRUE;
		B_LogEntry(TOPIC_SALETOBIGLAND,"Теперь, когда у паладинов больше не осталось рунной магии, их единственная надежда в войне против орков - это магическая руда. Я предложил лорду Хагену отплыть на материк, чтобы как можно скорее сообщить королю о руде, обнаруженную нами на необитаемом острове. Но лорд Хаген не намерен покидать остров и будет защищать город, пока ситуация с орками не прояснится до конца.");
	}
	else
	{
		AI_Output(self,other,"DIA_Lord_Hagen_OreOnMap_01_16");	//И как же это сделать?
		AI_Output(self,other,"DIA_Lord_Hagen_OreOnMap_01_17");	//Единственный корабль, что может туда отплыть, сейчас находится в городе, доверху набитый орками.
		AI_Output(self,other,"DIA_Lord_Hagen_OreOnMap_01_18");	//Так что сначала необходимо освободить сам Хоринис, а уже потом думать, что делать дальше.
		B_LogEntry(TOPIC_SALETOBIGLAND,"Теперь, когда у паладинов больше не осталось рунной магии, их единственная надежда в войне против орков - это магическая руда. Я предложил лорду Хагену отплыть на материк, чтобы как можно скорее сообщить королю о руде, обнаруженную нами на необитаемом острове. Но пока орки контролируют город, сделать это будет практически невозможно.");
	};
};


instance DIA_LORD_HAGEN_CANSTURMTOWN(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 1;
	condition = dia_lord_hagen_cansturmtown_condition;
	information = dia_lord_hagen_cansturmtown_info;
	permanent = FALSE;
	description = "Я освобожу город от орков.";
};


func int dia_lord_hagen_cansturmtown_condition()
{
	if((HORINISISFREE == FALSE) && Npc_KnowsInfo(hero,dia_lord_hagen_oreonmap))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_cansturmtown_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_CanSturmTown_01_00");	//Я освобожу город от орков.
	AI_Output(self,other,"DIA_Lord_Hagen_CanSturmTown_01_01");	//ЧТО? И ты полагаешь, что справишься с этим?
	AI_Output(self,other,"DIA_Lord_Hagen_CanSturmTown_01_03");	//Хммм...(скептически) Ну что же, раз так, тогда действуй! Однако на мою помощь в этом деле можешь не рассчитывать.
	AI_Output(self,other,"DIA_Lord_Hagen_CanSturmTown_01_06");	//Мне еще понадобятся мои люди, чтобы защищать эту ферму от орков.
	MIS_HORINISFREE = LOG_Running;
	Log_CreateTopic(TOPIC_HORINISFREE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HORINISFREE,LOG_Running);
	B_LogEntry(TOPIC_HORINISFREE,"Я сообщил лорду Хагену о том, что собираюсь освободить Хоринис от орков. И, судя по всему, он воспринял эту идею не иначе как безумство с моей стороны. Что же, посмотрим, кто окажется прав.");
};


instance DIA_LORD_HAGEN_CANSTURMTOWNDONE(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 1;
	condition = dia_lord_hagen_cansturmtowndone_condition;
	information = dia_lord_hagen_cansturmtowndone_info;
	permanent = FALSE;
	description = "Город освобожден!";
};


func int dia_lord_hagen_cansturmtowndone_condition()
{
	if((HORINISISFREE == TRUE) && (ALLGREATVICTORY == FALSE))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_cansturmtowndone_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Lord_Hagen_CanSturmTownDone_01_00");	//Город освобожден!
	AI_Output(self,other,"DIA_Lord_Hagen_CanSturmTownDone_01_03");	//Невероятно! Я просто не могу в это поверить!
	AI_Output(self,other,"DIA_Lord_Hagen_CanSturmTownDone_01_05");	//(с уважением) Ну, что же, в таком случае ситуация изменилась для нас в лучшую сторону.
	AI_Output(self,other,"DIA_Lord_Hagen_CanSturmTownDone_01_06");	//Пока город оставался в лапах орков, у нас не было возможности диктовать им свои условия в этой войне.
	AI_Output(self,other,"DIA_Lord_Hagen_CanSturmTownDone_01_07");	//Но теперь благодаря тебе инициатива перешла в наши руки. Еще немного - и от орков не останется здесь и следа.
	AI_Output(self,other,"DIA_Lord_Hagen_CanSturmTownDone_01_08");	//Так что прими от меня мою искреннюю благодарность за все, что ты для нас сделал!
};


instance DIA_LORD_HAGEN_ALLGREATVICTORY(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 1;
	condition = dia_lord_hagen_allgreatvictory_condition;
	information = dia_lord_hagen_allgreatvictory_info;
	permanent = FALSE;
	description = "Орки больше не угроза!";
};


func int dia_lord_hagen_allgreatvictory_condition()
{
	if(ALLGREATVICTORY == TRUE)
	{
		return TRUE;
	};
};

func void dia_lord_hagen_allgreatvictory_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Lord_Hagen_AllGreatVictory_01_00");	//Орки больше не угроза!
	AI_Output(other,self,"DIA_Lord_Hagen_AllGreatVictory_01_02");	//Мне удалось уничтожить все их отряды в этой части острова.
	AI_Output(other,self,"DIA_Lord_Hagen_AllGreatVictory_01_03");	//А те, что остались, не представляют существенной угрозы.
	AI_Output(self,other,"DIA_Lord_Hagen_AllGreatVictory_01_04");	//Превосходно! Значит, окончательная победа осталась все же за нами. По крайней мере, здесь.
	AI_Output(self,other,"DIA_Lord_Hagen_AllGreatVictory_01_06");	//Ну что же, в таком случае теперь только осталось закрепить этот успех и не дать оркам опомниться от полученного ими удара.
	AI_Output(self,other,"DIA_Lord_Hagen_AllGreatVictory_01_09");	//Теперь нужно организовать наши оборонительные укрепления на выходе из Долины Рудников.
	AI_Output(self,other,"DIA_Lord_Hagen_AllGreatVictory_01_10");	//Судя по всему, она пока что останется под контролем орков. По крайне мере, на неопределенное время.
	AI_Output(self,other,"DIA_Lord_Hagen_AllGreatVictory_01_11");	//А мы в свою очередь должны будем позаботиться о защите этой части острова.
	AI_Output(other,self,"DIA_Lord_Hagen_AllGreatVictory_01_12");	//Понятно. Уверен, что у тебя все получится.
	AI_Output(self,other,"DIA_Lord_Hagen_AllGreatVictory_01_13");	//Можешь в этом не сомневаться.
	b_allgohome();
};


instance DIA_LORD_HAGEN_OREONMAPDONE(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 1;
	condition = dia_lord_hagen_oreonmapdone_condition;
	information = dia_lord_hagen_oreonmapdone_info;
	permanent = FALSE;
	description = "Теперь у тебя снова есть корабль!";
};


func int dia_lord_hagen_oreonmapdone_condition()
{
	if((HORINISISFREE == TRUE) && (CANSALETOBIGLAND == FALSE) && (MIS_SALETOBIGLAND == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_oreonmapdone_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Lord_Hagen_OreOnMapDone_01_00");	//Теперь у тебя снова есть корабль.
	AI_Output(other,self,"DIA_Lord_Hagen_OreOnMapDone_01_01");	//И ты можешь отплыть на материк, чтобы передать королю сообщение о руде.
	AI_Output(self,other,"DIA_Lord_Hagen_OreOnMapDone_01_02");	//Извини, но я не могу покинуть этот остров, пока не буду полностью уверенным в том, что угроза со стороны орков окончательно миновала!
	AI_Output(self,other,"DIA_Lord_Hagen_OreOnMapDone_01_04");	//В Долине Рудников этих тварей еще предостаточно! И только сам Иннос знает, как эта ситуация будет развиваться в дальнейшем.
	AI_Output(self,other,"DIA_Lord_Hagen_OreOnMapDone_01_05");	//К тому же кто-то должен будет позаботиться и о восстановлении города, не говоря про его защиту.
	AI_Output(self,other,"DIA_Lord_Hagen_OreOnMapDone_01_06");	//Так что, как видишь, мне сейчас некого послать к королю.
	B_LogEntry(TOPIC_SALETOBIGLAND,"Лорд Хаген не намерен покидать остров, пока ситуация с орками не прояснится до конца. Он позаботится о городе и его обороне на случай того, если орки вновь попытаются его атаковать.");
	CANSALETOBIGLAND = TRUE;
};


instance DIA_LORD_HAGEN_CANSALETOBIGLAND(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 1;
	condition = dia_lord_hagen_cansaletobigland_condition;
	information = dia_lord_hagen_cansaletobigland_info;
	permanent = FALSE;
	description = "Я могу доставить сообщение королю.";
};


func int dia_lord_hagen_cansaletobigland_condition()
{
	if((MIS_SALETOBIGLAND == LOG_Running) && (CANSALETOBIGLAND == TRUE))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_cansaletobigland_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_CanSaleToBigLand_01_00");	//Я могу доставить сообщение королю.
	AI_Output(other,self,"DIA_Lord_Hagen_CanSaleToBigLand_01_01");	//Если, конечно, ты доверишь мне свой корабль.
	AI_Output(self,other,"DIA_Lord_Hagen_CanSaleToBigLand_01_02");	//Хммм...(ехидно) По правде говоря, мне очень странно слышать от тебя подобные слова.
	AI_Output(self,other,"DIA_Lord_Hagen_CanSaleToBigLand_01_03");	//Помнится, что в прошлый раз ты абсолютно не спрашивал моего разрешения, а просто взял и украл его у меня.
	AI_Output(self,other,"DIA_Lord_Hagen_CanSaleToBigLand_01_06");	//Однако, если говорить серьезно, то для этой цели я действительно мог бы предоставить корабль в твое распоряжение.
	AI_Output(self,other,"DIA_Lord_Hagen_CanSaleToBigLand_01_07");	//Паладины на материке очень нуждаются в этой руде, и мой священный долг просто обязывает меня сделать все возможное, чтобы помочь моим братьям в этой войне.
	AI_Output(self,other,"DIA_Lord_Hagen_CanSaleToBigLand_01_08");	//(неуверенно) Правда, никто не знает, какова там сейчас ситуация.
	AI_Output(self,other,"DIA_Lord_Hagen_CanSaleToBigLand_01_09");	//Но нам в любом случае необходимо это выяснить.
	AI_Output(self,other,"DIA_Lord_Hagen_CanSaleToBigLand_01_10");	//Так что забирай мой корабль и немедленно отправляйся на материк...(решительно) И не теряй времени, поскольку нам сейчас дорога каждая минута!
	AI_Output(self,other,"DIA_Lord_Hagen_CanSaleToBigLand_01_11");	//Передай королю эту карту и расскажи ему о найденной тобой магической руде. Будем надеяться, что еще не все потеряно!
	B_GiveInvItems(self,other,itmi_seamaplostisland,1);
	AI_Output(other,self,"DIA_Lord_Hagen_CanSaleToBigLand_01_12");	//Хорошо! Тогда я отправляюсь.
	B_StartOtherRoutine(SLD_800_Lee,"Start");
	B_StartOtherRoutine(BAU_910_Maria,"Start");
	LEERECOVERED = TRUE;
	SHIPAGAINACCESS = TRUE;
	B_LogEntry(TOPIC_SALETOBIGLAND,"Я вызвался помочь лорду Хагену передать сообщение королю. Подумав, он согласился с моим предложением и предоставил в мое распоряжение свой корабль. Теперь мне необходимо как можно скорее отплыть на материк! Возможно, наша помощь паладинам подоспеет вовремя.");
};


instance DIA_LORD_HAGEN_NEEDCAPITAN(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 1;
	condition = dia_lord_hagen_needcapitan_condition;
	information = dia_lord_hagen_needcapitan_info;
	permanent = FALSE;
	description = "Мне нужен капитан, чтобы управлять этим судном.";
};


func int dia_lord_hagen_needcapitan_condition()
{
	if((MIS_SALETOBIGLAND == LOG_Running) && (SHIPAGAINACCESS == TRUE))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_needcapitan_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_NeedCapitan_01_00");	//Мне нужен капитан, чтобы управлять этим судном.
	if((PIR_JOINHAGEN == TRUE) && (Npc_IsDead(pir_13200_addon_greg) == FALSE))
	{
		AI_Output(self,other,"DIA_Lord_Hagen_NeedCapitan_01_01");	//Поговори с Грэгом! Именно он сейчас исполняет обязанность капитана нашего корабля.
		GREGISCAPITAN = TRUE;
		B_LogEntry(TOPIC_SALETOBIGLAND,"На мой вопрос о капитане лорд Хаген посоветовал мне обратиться к Грэгу.");
	}
	else
	{
		AI_Output(self,other,"DIA_Lord_Hagen_NeedCapitan_01_05");	//Боюсь, что, к сожалению, я ничем тебе помочь не смогу...(серьезно) У моего корабля сейчас нет капитана.
		AI_Output(self,other,"DIA_Lord_Hagen_NeedCapitan_01_07");	//До недавнего времени эту обязанность исполнял паладин Лотар. Но, как ты уже наверняка знаешь, его подло убили.
		AI_Output(self,other,"DIA_Lord_Hagen_NeedCapitan_01_08");	//Иного человека, который бы мог управлять кораблем, у меня пока нет.
		AI_Output(other,self,"DIA_Lord_Hagen_NeedCapitan_01_09");	//М-да... понятно. Придется искать другого капитана.
	};
};

instance DIA_Lord_Hagen_Kill_Done_Rings(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 1;
	condition = DIA_Lord_Hagen_Kill_Done_Rings_condition;
	information = DIA_Lord_Hagen_Kill_Done_Rings_info;
	permanent = FALSE;
	description = "У меня есть с собой кольца паладинов.";
};

func int DIA_Lord_Hagen_Kill_Done_Rings_condition()
{
	if(Npc_HasItems(hero,itri_quest_pal_ring) >= 1)
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_Kill_Done_Rings_info()
{
	var int RingSum;
	var int RingSumXP;
	var int RingSumGold;

	AI_Output(other,self,"DIA_Lord_Hagen_Kill_Done_Rings_01_01");	//У меня есть с собой кольца паладинов.
	AI_Output(self,other,"DIA_Lord_Hagen_Kill_Done_Rings_01_03");	//(грозно) Откуда они у тебя? Ты что, убиваешь моих людей?!
	AI_Output(other,self,"DIA_Lord_Hagen_Kill_Done_Rings_01_04");	//Нет, что ты! Я просто обнаружил их на телах твоих павших товарищей.
	AI_Output(other,self,"DIA_Lord_Hagen_Kill_Done_Rings_01_05");	//И решил, что лучше они будут у тебя, чем достанутся оркам.
	AI_Output(self,other,"DIA_Lord_Hagen_Kill_Done_Rings_01_06");	//Ты правильно сделал, что принес их мне.
	AI_Output(self,other,"DIA_Lord_Hagen_Kill_Done_Rings_01_07");	//Это память о тех, кто отдал свою жизнь во благо служения Инносу и королю!
	AI_Output(self,other,"DIA_Lord_Hagen_Kill_Done_Rings_01_09");	//Отдай мне их все! И я буду знать, сколько мне придется проткнуть этих зеленокожих тварей, чтобы отомстить за моих товарищей.
	AI_Output(other,self,"DIA_Lord_Hagen_Kill_Done_Rings_01_10");	//Вот, держи.

	RingSum = Npc_HasItems(hero,itri_quest_pal_ring);
	B_GiveInvItems(other,self,itri_quest_pal_ring,RingSum);
	RingSumXP = RingSum * 250;
	B_GivePlayerXP(RingSumXP);

	AI_Output(self,other,"DIA_Lord_Hagen_Kill_Done_Rings_01_11");	//Благодарю тебя! Однако ничего подобного я больше видеть не желаю.
	AI_Output(other,self,"DIA_Lord_Hagen_Kill_Done_Rings_01_12");	//Я тебя понял.
};

var int Hagen_PAL_ARMOR_permanent;

instance DIA_Hagen_PAL_ARMOR(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 8;
	condition = DIA_Hagen_PAL_ARMOR_Condition;
	information = DIA_Hagen_PAL_ARMOR_Info;
	permanent = TRUE;
	description = "Купить доспех паладина. (Цена: 15000 монет)";
};

func int DIA_Hagen_PAL_ARMOR_Condition()
{
	if((Hagen_PAL_ARMOR_permanent == FALSE) && (hero.guild == GIL_PAL) && (Kapitel >= 4))
	{
		return TRUE;
	};
};

func void DIA_Hagen_PAL_ARMOR_Info()
{
	AI_Output(other,self,"DIA_Hagen_PAL_ARMOR_01_00");	//Продай мне доспехи паладина.

	if(Npc_HasItems(other,ItMi_Gold) >= 15000)
	{
		B_GiveInvItems(other,self,ItMi_Gold,15000);
		Npc_RemoveInvItems(self,ItMi_Gold,15000);
		AI_Output(self,other,"DIA_Hagen_PAL_ARMOR_01_01");	//Хорошо! Теперь они твои.
		AI_Output(self,other,"DIA_Hagen_PAL_ARMOR_01_02");	//Носи их с гордостью, ибо далеко не все удостаиваются подобной чести.
		CreateInvItems(self,itar_pal_h,1);
		B_GiveInvItems(self,other,itar_pal_h,1);
		Hagen_PAL_ARMOR_permanent = TRUE;
		SHOW_ITAR_PAL_H = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Hagen_PAL_ARMOR_01_03");	//У тебя недостаточно золота.
	};
};

var int Hagen_PAL_HELM_permanent;

instance DIA_Hagen_PAL_HELM(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 8;
	condition = DIA_Hagen_PAL_HELM_Condition;
	information = DIA_Hagen_PAL_HELM_Info;
	permanent = TRUE;
	description = "Купить шлем паладина. (Цена: 5000 монет)";
};

func int DIA_Hagen_PAL_HELM_Condition()
{
	if((Hagen_PAL_HELM_permanent == FALSE) && (hero.guild == GIL_PAL) && (Kapitel >= 4))
	{
		return TRUE;
	};
};

func void DIA_Hagen_PAL_HELM_Info()
{
	AI_Output(other,self,"DIA_Hagen_PAL_HELM_01_00");	//Продай мне шлем паладина.
	Info_ClearChoices(DIA_Hagen_PAL_HELM);
	Info_AddChoice(DIA_Hagen_PAL_HELM,"...с открытым забралом.",DIA_Hagen_PAL_HELM_OPEN);
	Info_AddChoice(DIA_Hagen_PAL_HELM,"...с закрытым забралом.",DIA_Hagen_PAL_HELM_CLOSED);
};

func void DIA_Hagen_PAL_HELM_OPEN()
{
	if(Npc_HasItems(other,ItMi_Gold) >= 5000)
	{
		B_GiveInvItems(other,self,ItMi_Gold,5000);
		Npc_RemoveInvItems(self,ItMi_Gold,5000);
		AI_Output(self,other,"DIA_Hagen_PAL_HELM_01_01");	//Хорошо! Вот, держи.
		AI_Output(self,other,"DIA_Hagen_PAL_HELM_01_02");	//Он надежно защитит тебя от бою.
		CreateInvItems(self,itar_pal_helm_open,1);
		B_GiveInvItems(self,other,itar_pal_helm_open,1);
		Hagen_PAL_HELM_permanent = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Hagen_PAL_HELM_01_03");	//У тебя недостаточно золота.
	};

	Info_ClearChoices(DIA_Hagen_PAL_HELM);
};

func void DIA_Hagen_PAL_HELM_CLOSED()
{
	if(Npc_HasItems(other,ItMi_Gold) >= 5000)
	{
		B_GiveInvItems(other,self,ItMi_Gold,5000);
		Npc_RemoveInvItems(self,ItMi_Gold,5000);
		AI_Output(self,other,"DIA_Hagen_PAL_HELM_01_01");	//Хорошо! Вот, держи.
		AI_Output(self,other,"DIA_Hagen_PAL_HELM_01_02");	//Он надежно защитит тебя от бою.
		CreateInvItems(self,itar_pal_helm,1);
		B_GiveInvItems(self,other,itar_pal_helm,1);
		Hagen_PAL_HELM_permanent = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Hagen_PAL_HELM_01_03");	//У тебя недостаточно золота.
	};

	Info_ClearChoices(DIA_Hagen_PAL_HELM);
};

//--------------------------------------------------Темный ордер------------------------------------------

instance DIA_Lord_Hagen_DarkOrden(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 1;
	condition = DIA_Lord_Hagen_DarkOrden_condition;
	information = DIA_Lord_Hagen_DarkOrden_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Lord_Hagen_DarkOrden_condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_DarkOrden_info()
{
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_01_01");	//Хорошо, что ты тут!
	AI_Output(other,self,"DIA_Lord_Hagen_DarkOrden_01_02");	//Что случилось?
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_01_03");	//(удивленно) Как что? Неужели ты еще ничего не знаешь?
	AI_Output(other,self,"DIA_Lord_Hagen_DarkOrden_01_04");	//Понятия не имею.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_01_05");	//Весь Хоринис просто кишит нежитью! Не проходит и дня, чтобы мы не отражали ее атаки!
	AI_Output(other,self,"DIA_Lord_Hagen_DarkOrden_01_06");	//А откуда она взялась?
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_01_07");	//Этого мне не известно. Иначе я бы давно послал своих людей выяснить это.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_01_08");	//Но тогда некому будет защищать этот город!
	AI_Output(other,self,"DIA_Lord_Hagen_DarkOrden_01_09");	//Ну хорошо. А при чем тут я?
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_01_10");	//Ведь это ты убил всех драконов в Долине Рудников.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_01_11");	//Так что, возможно, все это - последствия именно твоих действий!
	AI_Output(other,self,"DIA_Lord_Hagen_DarkOrden_01_12");	//Хочешь сказать, что мне не стоило убивать этих тварей?
	AI_Output(other,self,"DIA_Lord_Hagen_DarkOrden_01_13");	//Надо было позволить им сжечь этот город дотла вместе с близлежащими фермами?
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_01_14");	//Я этого не говорил! Все мы, конечно, благодарны тебе за то, что ты сделал.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_01_15");	//Но и угроза со стороны нежити не менее опасна! Поэтому именно тебе я поручаю разобраться с этой проблемой.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_01_16");	//Раз уж тебе оказались под силу даже драконы, то и с этим, я думаю, ты справишься!
	AI_Output(other,self,"DIA_Lord_Hagen_DarkOrden_01_17");	//Мне бы твою уверенность.
	MIS_DarkOrden = LOG_Running;
	Log_CreateTopic(TOPIC_DarkOrden,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DarkOrden,LOG_Running);
	B_LogEntry(TOPIC_DarkOrden,"Весь Хоринис наводнила нежить. Лорд Хаген поручил мне разобраться, в чем кроется причина этого нашествия.");
};

instance DIA_Lord_Hagen_DarkOrden_WhatDo(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 1;
	condition = DIA_Lord_Hagen_DarkOrden_WhatDo_condition;
	information = DIA_Lord_Hagen_DarkOrden_WhatDo_info;
	permanent = FALSE;
	description = "С чего мне стоит начать?";
};

func int DIA_Lord_Hagen_DarkOrden_WhatDo_condition()
{
	if(MIS_DarkOrden == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_DarkOrden_WhatDo_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_DarkOrden_WhatDo_01_01");	//С чего мне стоит начать?
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_WhatDo_01_02");	//(задумчиво) На твоем месте я бы вначале поговорил с Пирокаром.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_WhatDo_01_03");	//Вне всякого сомнения, ты являешься человеком, которого выбрал сам Иннос!
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_WhatDo_01_04");	//Он дал тебе свою силу для того, чтобы уничтожить драконов.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_WhatDo_01_05");	//Но наш нынешний противник, кто бы он ни был, полагаю, несколько... иного рода.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_WhatDo_01_06");	//И я думаю, что тебе потребуется мудрый совет для того, чтобы разобраться во всем этом.
	AI_Output(other,self,"DIA_Lord_Hagen_DarkOrden_WhatDo_01_07");	//Тогда я прямо сейчас отправляюсь в монастырь.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_WhatDo_01_08");	//Хорошо, ступай. Только держи меня в курсе событий.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_WhatDo_01_09");	//И да хранит тебя Иннос...
	B_LogEntry(TOPIC_DarkOrden,"Лорд Хаген посоветовал мне поговорить об этом с Пирокаром.");
	DO_SendToPyro = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_Lord_Hagen_DarkOrden_Ginnok(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 1;
	condition = DIA_Lord_Hagen_DarkOrden_Ginnok_condition;
	information = DIA_Lord_Hagen_DarkOrden_Ginnok_info;
	permanent = FALSE;
	description = "Как обстановка?";
};

func int DIA_Lord_Hagen_DarkOrden_Ginnok_condition()
{
	if((MIS_DarkOrden == LOG_Running) && (DO_SendToHagen == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_DarkOrden_Ginnok_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_01");	//Как обстановка?
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_02");	//Ситуация еще более ухудшилась. Нежить лезет изо всех щелей!
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_03");	//У меня уже не хватает людей для защиты города.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_04");	//А я даже не могу отправить гонца в форт Азган, чтобы лорд Варус выступил оттуда с нашими основными силами.
	AI_Output(other,self,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_05");	//Если хочешь, я могу доставить это письмо. Но сперва я хотел бы спросить тебя кое о чем.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_06");	//О чем именно?
	AI_Output(other,self,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_07");	//О тех паладинах, что были похоронены тут на острове.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_08");	//Ах, ты об этом...(серьезно) Пирокар уже писал мне в письме о том, что ты должен был проверить их усыпальницы.
	AI_Output(other,self,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_09");	//Ну, я так и сделал. Проверил все три гробницы и позаботился о всей нежити, что только смог там обнаружить.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_10");	//Однако, как видишь, ее нападения только участились. Этого оказалось мало!
	AI_Output(other,self,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_11");	//К чему ты клонишь?
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_12");	//Я не хотел говорить тебе об этом, но, по всей видимости, у меня не осталось выбора.
	AI_Output(other,self,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_13");	//А в чем, собственно, дело?
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_14");	//Понимаешь... Это черное пятно в истории ордена. Поэтому мы обычно предпочитаем не вспоминать эту историю.
	AI_Output(other,self,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_15");	//Выходит, что я знаю не все?
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_16");	//Да, не все. Так уж случилось, что на острове существует еще одна усыпальница.
	AI_Output(other,self,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_17");	//И кто там похоронен?
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_18");	//При жизни этого человека звали Конрад Гиннок. Но многие знали его по прозвищу 'Безумный Крестоносец'.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_19");	//Когда-то он был могучим воином и главой нашего ордена.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_20");	//Это именно он возглавил поход в один из четырех храмов Белиара и полностью уничтожил его.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_21");	//Однако после того случая он сильно изменился.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_22");	//Я не знаю, что именно произошло там. Да и навряд ли кто-то другой знает об этом.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_23");	//Но после того как он вернулся в Миртану, одно его имя уже нагоняло ужас на многих людей.
	AI_Output(other,self,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_24");	//Почему?
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_25");	//Дело в том, что всех, кого Гиннок считал недостойным быть слугой Инноса, он просто убивал!
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_26");	//Ради своей слепой и фанатичной веры он не щадил никого - ни женщин, ни стариков, ни детей.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_27");	//В конце концов, он настолько обезумел, что даже поднял меч против короля!
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_28");	//Поэтому Робару ничего не оставалось, как только отдать приказ о его казни.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_29");	//В итоге в тайне ото всех он был похоронен здесь, на этом острове. 
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_30");	//Подальше от короля и всех тех людей, которые его так боялись!
	AI_Output(other,self,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_31");	//Да, веселенькую историю ты мне рассказал.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_32");	//По моему глубокому убеждению, скорее всего, Гинноком завладело некое зло...(задумчиво) 
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_33");	//Зло, о котором мы, конечно, ничего не знаем.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_34");	//Но именно нам придется пролить свет на всю эту историю. Если, конечно, мы хотим сохранить жизнь людям этого города!
	AI_Output(other,self,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_35");	//Намекаешь на то, что именно мне придется наведаться туда?
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_36");	//Ты все правильно понял...(серьезно) Ключ от той гробницы сейчас находится у меня.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_37");	//Как главе ордена паладинов, только мне доверено хранить его. Но я отдаю его тебе.
	B_GiveInvItems(self,other,ItKe_Hagen_DarkOrder_Ginnok,1);
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_38");	//Только заклинаю тебя Инносом - не мешкай! Ибо, возможно, сейчас дорога каждая секунда.
	AI_Output(other,self,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_39");	//Я тебя понял. А где находится сама гробница?
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_40");	//Если ты выйдешь из западных ворот города и отправишься на юг, то вскоре увидишь небольшую лощину среди скал.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_41");	//Там должна быть пещера, в которой и находится его усыпальница.
	B_LogEntry(TOPIC_DarkOrden,"Вот так новость! Лорд Хаген утаил ото всех, что на острове есть еще одна усыпальница паладинов. В ней похоронен некий Конрад Гиннок, который при жизни носил прозвище 'Безумный крестоносец'. Гиннок был крайне жестоким человеком, особенно по отношению к тем, кого считал недостойным быть слугой Инноса. В итоге он даже попытался попрать власть короля Робара, за что и бы казнен и похоронен здесь на острове. Хаген дал мне ключ от его усыпальницы. Мне следует наведаться туда и проверить ее на наличие нежити и прочего зла.");
	AI_StopProcessInfos(self);
};

instance DIA_Lord_Hagen_DarkOrden_Done(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 1;
	condition = DIA_Lord_Hagen_DarkOrden_Done_condition;
	information = DIA_Lord_Hagen_DarkOrden_Done_info;
	permanent = FALSE;
	description = "Я побывал в усыпальнице Гиннока.";
};

func int DIA_Lord_Hagen_DarkOrden_Done_condition()
{
	if((MIS_DarkOrden == LOG_Running) && (KillDeadPal_Ginnok == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_DarkOrden_Done_info()
{
	B_GivePlayerXP(2000);
	AI_Output(other,self,"DIA_Lord_Hagen_DarkOrden_Done_01_01");	//Я побывал в усыпальнице Гиннока.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_Done_01_02");	//И что ты там нашел?
	AI_Output(other,self,"DIA_Lord_Hagen_DarkOrden_Done_01_03");	//Тебе лучше не знать! Но нет сомнений: за всем этим стоял именно Гиннок.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_Done_01_04");	//Хорошо. По крайней мере, теперь город и его жители в безопасности. А это самое главное.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_Done_01_05");	//Так что прими благодарность от всех нас и от меня лично!
	AI_Output(other,self,"DIA_Lord_Hagen_DarkOrden_Done_01_06");	//Кммм...
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_Done_01_07");	//(непонимающе) Ты еще чего-то ждешь?
	AI_Output(other,self,"DIA_Lord_Hagen_DarkOrden_Done_01_08");	//Ну... неужели я даже не заслужил какой-либо награды?
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_Done_01_09");	//(удивленно) А разве ты это сделал не просто на благо людей? Твои корыстные помыслы заставляют меня сомневаться в тебе!
	AI_Output(other,self,"DIA_Lord_Hagen_DarkOrden_Done_01_10");	//Ладно, забудь о том, что я сказал...
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_Done_01_11");	//И еще кое-что...(серьезно) Тебя хотел видеть Ватрас.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_Done_01_12");	//Кажется, у него было срочное дело для тебя.
	HagenSendVat = TRUE;
	MIS_DarkOrden = LOG_Success;
	Log_SetTopicStatus(TOPIC_DarkOrden,LOG_Success);
	B_LogEntry(TOPIC_DarkOrden,"Лорда Хагена обрадовала весть о том, что я упокоил душу Безумного Крестоносца. Нападения нежити прекратились, и Хоринису она больше не угрожает.");
};

instance DIA_Lord_Hagen_NeedWorldMap(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 1;
	condition = DIA_Lord_Hagen_NeedWorldMap_condition;
	information = DIA_Lord_Hagen_NeedWorldMap_info;
	permanent = FALSE;
	description = "Кто является капитаном 'Эсмеральды'?";
};

func int DIA_Lord_Hagen_NeedWorldMap_condition()
{
	if((MIS_SylvioCrew == LOG_Running) && (Npc_KnowsInfo(hero,DIA_Brahim_NeedWorldMap) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_NeedWorldMap_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_Lord_Hagen_NeedWorldMap_01_01");	//Кто является капитаном 'Эсмеральды'?
	AI_Output(self,other,"DIA_Lord_Hagen_NeedWorldMap_01_02");	//Странный вопрос... Я, конечно!
	AI_Output(other,self,"DIA_Lord_Hagen_NeedWorldMap_01_03");	//И ты сам стоишь за штурвалом?
	AI_Output(self,other,"DIA_Lord_Hagen_NeedWorldMap_01_04");	//Нет. Для этого у нас есть свой штурман.
	AI_Output(other,self,"DIA_Lord_Hagen_NeedWorldMap_01_05");	//И кто же он?
	AI_Output(self,other,"DIA_Lord_Hagen_NeedWorldMap_01_06");	//Его зовут Орто. Но сейчас он находится вместе с остальными паладинами в форте Азган.
	AI_Output(self,other,"DIA_Lord_Hagen_NeedWorldMap_01_07");	//А что именно тебе от него нужно?
	AI_Output(other,self,"DIA_Lord_Hagen_NeedWorldMap_01_08");	//Ничего. Просто стало интересно.
	AI_Output(self,other,"DIA_Lord_Hagen_NeedWorldMap_01_09");	//Хммм...

	if(GRANTTOFORT == FALSE)
	{
		B_LogEntry(Topic_SylvioCrew,"Штурмана паладинов зовут Орто. Возможно, у него есть та самая карта. Правда, он находится в форте Азган, куда у меня нет доступа. Надо придумать что-то иное...");
		Wld_InsertItem(ItWr_Seamap_Mirtana,"FP_ITEM_SHIP_SEAMAP");
	}
	else
	{
		B_LogEntry(Topic_SylvioCrew,"Штурмана паладинов зовут Орто. Возможно, у него есть та самая карта. Сейчас он находится вместе с остальными паладинами в форте Азган.");
		GotoFortMap = TRUE;
	};

	AI_StopProcessInfos(self);
};


//---------------------------начало истории о знаке------------------------------------------------

instance DIA_LORD_HAGEN_KILLDMT(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 27;
	condition = dia_lord_hagen_killdmt_condition;
	information = dia_lord_hagen_killdmt_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_lord_hagen_killdmt_condition()
{
	if((CanStartMyCamp == TRUE) && (MeetDarkRavenSpeaker == TRUE) && (DarkPathStart == FALSE))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_killdmt_info()
{
	AI_Output(self,other,"DIA_Lord_Hagen_KILLDMT_04_00");	//Стой! Есть еще кое-что...
	AI_Output(self,other,"DIA_Lord_Hagen_KILLDMT_04_01");	//Ты не мог не заметить, что на дорогах появились подозрительные личности в черных одеждах. 
	AI_Output(self,other,"DIA_Lord_Hagen_KILLDMT_04_02");	//Люди называют их темными странниками, и наверняка они поклоняются Белиару.
	AI_Output(self,other,"DIA_Lord_Hagen_KILLDMT_04_03");	//Мне стало известно, что в башне рядом с фермой Онара находится их основной лагерь.
	AI_Output(self,other,"DIA_Lord_Hagen_KILLDMT_04_04");	//Не думаю, что они ведут какие-либо дела с наемниками, но все же этот их выбор места вызывает серьезные опасения.

	if(Npc_KnowsInfo(hero,DIA_Torlof_DEMENTOREN))
	{
		AI_Output(other,self,"DIA_Lord_Hagen_KILLDMT_15_01");	//Поверь, наемникам это нравится не больше, чем тебе.
		AI_Output(self,other,"DIA_Lord_Hagen_KILLDMT_04_05");	//Это радует. Тем не менее, проблема остается.
	};

	AI_Output(other,self,"DIA_Lord_Hagen_KILLDMT_15_02");	//Как это все касается меня?
	AI_Output(self,other,"DIA_Lord_Hagen_KILLDMT_04_06");	//Я хочу, чтобы ты расправился с отрядом в башне, пока он не успел причинить нам ущерба.
	AI_Output(self,other,"DIA_Lord_Hagen_KILLDMT_04_07");	//Нельзя допускать, чтобы это мерзкое белиарово отродье спокойно разгуливало по Хоринису.
	AI_Output(other,self,"DIA_Lord_Hagen_KILLDMT_15_03");	//Что? И как я должен в одиночку со всем этим справиться?
	AI_Output(self,other,"DIA_Lord_Hagen_KILLDMT_04_08");	//Погоди, не кипятись. Да, их отряд силен. Слишком силен для лобовой атаки.
	AI_Output(self,other,"DIA_Lord_Hagen_KILLDMT_04_09");	//Даже если я пошлю туда своих лучших людей, что к тому же непременно вызовет недовольство наемников, - они просто погибнут.
	AI_Output(self,other,"DIA_Lord_Hagen_KILLDMT_04_10");	//Единственный наш шанс - действовать скрытно, а ты своим походом в Долину Рудников доказал, что тебе нет равных в этом деле.
	Info_ClearChoices(dia_lord_hagen_killdmt);
	Info_AddChoice(dia_lord_hagen_killdmt,"Хорошо, я посмотрю, что смогу сделать.",dia_lord_hagen_killdmt_yes);
	Info_AddChoice(dia_lord_hagen_killdmt,"Нет, это слишком опасно. Я за это не возьмусь.",dia_lord_hagen_killdmt_no);
};

func void dia_lord_hagen_killdmt_yes()
{
	AI_Output(other,self,"DIA_Lord_Hagen_KILLDMT_Yes_15_00");	//Хорошо, я посмотрю, что смогу сделать.
	AI_Output(self,other,"DIA_Lord_Hagen_KILLDMT_Yes_04_01");	//Спасибо. Ты - наша единственная надежда в этом деле. 
	AI_Output(self,other,"DIA_Lord_Hagen_KILLDMT_Yes_04_02");	//Теперь ступай и уничтожь этот рассадник зла! И да пребудет с тобой Иннос.
	MIS_HAGENKILLDMT = LOG_Running;
	Log_CreateTopic(TOPIC_HAGENKILLDMT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HAGENKILLDMT,LOG_Running);
	B_LogEntry(TOPIC_HAGENKILLDMT,"Лорд Хаген хочет, чтобы я устранил всех темных странников в бывшей башне Декстера. Эта миссия кажется чистым самоубийством. Впрочем, не меньшим, чем одиночный поход в Долину Рудников.");
	AI_StopProcessInfos(self);
};

func void dia_lord_hagen_killdmt_no()
{
	AI_Output(other,self,"DIA_Lord_Hagen_KILLDMT_No_15_00");	//Нет, это слишком опасно. Я за это не возьмусь.
	AI_Output(self,other,"DIA_Lord_Hagen_KILLDMT_No_04_01");	//Очень жаль, а я на тебя рассчитывал. В любом случае я все понимаю и обиды не держу.
	AI_StopProcessInfos(self);
};

instance DIA_LORD_HAGEN_DMTAREDEAD(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 27;
	condition = dia_lord_hagen_dmtaredead_condition;
	information = dia_lord_hagen_dmtaredead_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_lord_hagen_dmtaredead_condition()
{
	if((MIS_HAGENKILLDMT == LOG_Running) && (CastlemineDMTIsDead == TRUE) && (CastlemineDMTMasterIsDead == TRUE))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_dmtaredead_info()
{
	B_GivePlayerXP(2000);
	AI_Output(self,other,"DIA_Lord_Hagen_DMTAREDEAD_04_00");	//Ты вернулся! Что насчет моего поручения? Тебе удалось расправиться с врагом?
	AI_Output(other,self,"DIA_Lord_Hagen_DMTAREDEAD_15_01");	//Не скажу, что было просто, но все темные странники в башне мертвы.
	AI_Output(self,other,"DIA_Lord_Hagen_DMTAREDEAD_04_02");	//Хвала Инносу! Я знал, что могу положиться на тебя.
	AI_Output(self,other,"DIA_Lord_Hagen_DMTAREDEAD_04_03");	//Вот, прими от меня небольшую награду за свои труды. Ты ее более чем заслуживаешь.
	B_LogEntry(TOPIC_HAGENKILLDMT,"Я расправился с темными странниками и доложил о проделанной работе лорду Хагену.");
	MIS_HAGENKILLDMT = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_HAGENKILLDMT,LOG_SUCCESS);
	B_GiveInvItems(self,other,ItMi_Gold,1500);

	if((other.guild == GIL_KDM) || (other.guild == GIL_KDW) || (other.guild == GIL_KDF) || (other.guild == GIL_GUR))
	{
		B_GiveInvItems(self,other,ItPo_Perm_Mana,1);
	}
	else
	{
		if(other.attribute[ATR_STRENGTH] >= other.attribute[ATR_DEXTERITY])
		{
			B_GiveInvItems(self,other,ItPo_Perm_STR,1);
		}
		else
		{
			B_GiveInvItems(self,other,ItPo_Perm_DEX,1);
		};
	};

	AI_Output(other,self,"DIA_Lord_Hagen_DMTAREDEAD_15_04");	//Спасибо. У тебя есть еще какие-либо задания для меня?
	AI_Output(self,other,"DIA_Lord_Hagen_DMTAREDEAD_04_05");	//Хммм, смотря что подразумевать под заданием. Скажи, как у тебя обстоят дела с жильем?
	AI_Output(other,self,"DIA_Lord_Hagen_DMTAREDEAD_15_07");	//С жильем? Не могу сказать, что чудесно.
	AI_Output(other,self,"DIA_Lord_Hagen_DMTAREDEAD_15_08");	//Впрочем, у меня есть, где поспать ночью. Но к чему этот вопрос?
	AI_Output(self,other,"DIA_Lord_Hagen_DMTAREDEAD_04_09");	//Пока тебя не было, я понял, что нам что-то надо делать с этой башней.
	AI_Output(self,other,"DIA_Lord_Hagen_DMTAREDEAD_04_10");	//Сначала бандиты, затем прихвостни темного бога. Кто дальше - орки? Или драконы?
	AI_Output(self,other,"DIA_Lord_Hagen_DMTAREDEAD_04_11");	//Похоже, она просто притягивает дурных постояльцев и сопутствующие им неприятности.
	AI_Output(self,other,"DIA_Lord_Hagen_DMTAREDEAD_04_12");	//Я бы мог отправить туда паладинов, но Онар...
	AI_Output(other,self,"DIA_Lord_Hagen_DMTAREDEAD_15_13");	//Все ясно. Дай угадаю: эти неприятности ты считаешь необходимым взвалить на мои плечи?
	AI_Output(self,other,"DIA_Lord_Hagen_DMTAREDEAD_04_14");	//Можно сказать и так. Я хочу передать тебе эту башню и территорию вокруг нее. Я хочу, чтоб этот проклятый клочок земли контролировался надежным человеком. 
	AI_Output(self,other,"DIA_Lord_Hagen_DMTAREDEAD_04_15");	//Да, там не слишком безопасно, но взгляни на это с другой стороны: у тебя появится целое небольшое поместье в личном распоряжении.
	AI_Output(self,other,"DIA_Lord_Hagen_DMTAREDEAD_04_16");	//О документах я позабочусь. Ты же найди людей, восстанови башню, организуй охрану.
	AI_Output(self,other,"DIA_Lord_Hagen_DMTAREDEAD_04_17");	//Кроме того, рядом есть заброшенные шахты, которые давно привлекли мое внимание.
	AI_Output(self,other,"DIA_Lord_Hagen_DMTAREDEAD_04_18");	//В них еще может быть немного руды, а нам сейчас важен каждый кусок.
	AI_Output(self,other,"DIA_Lord_Hagen_DMTAREDEAD_04_19");	//Онар меня к шахтам на пушечный выстрел не подпустит, ты же не в столь холодных отношениях с наемниками.
	AI_Output(self,other,"DIA_Lord_Hagen_DMTAREDEAD_04_20");	//Итак, что скажешь?
	AI_Output(other,self,"DIA_Lord_Hagen_DMTAREDEAD_15_21");	//Хмм… твое предложение интересно, но как к этому отнесется Онар?
	AI_Output(self,other,"DIA_Lord_Hagen_DMTAREDEAD_04_22");	//А вот это - основная загвоздка.
	AI_Output(self,other,"DIA_Lord_Hagen_DMTAREDEAD_04_23");	//Старому скряге куда спокойнее смотреть на пустующую, рушащуюся под влиянием времени башню, чем на неугодных ему ее обитателей.
	AI_Output(self,other,"DIA_Lord_Hagen_DMTAREDEAD_04_24");	//Кроме того, он привык считать, что вся местность вокруг его фермы - его собственность, на которую никто не может посягать.
	AI_Output(self,other,"DIA_Lord_Hagen_DMTAREDEAD_04_25");	//Тебе придется как-то убедить его не препятствовать твоим действиям по приведению башни в порядок.
	Info_ClearChoices(dia_lord_hagen_dmtaredead);
	Info_AddChoice(dia_lord_hagen_dmtaredead,"Хорошо, я возьмусь за это.",dia_lord_hagen_dmtaredead_yes);
	Info_AddChoice(dia_lord_hagen_dmtaredead,"Слишком много мороки. Пожалуй, я откажусь.",dia_lord_hagen_dmtaredead_no);
};

func void dia_lord_hagen_dmtaredead_yes()
{
	AI_Output(other,self,"DIA_Lord_Hagen_DMTAREDEAD_Yes_15_00");	//Хорошо, я возьмусь за это.
	AI_Output(self,other,"DIA_Lord_Hagen_DMTAREDEAD_Yes_04_01");	//Отлично. Бумажные формальности, как я уже сказал, за мной. Кроме того, вот тебе немного денег на первое время.
	B_GiveInvItems(self,other,ItMi_Gold,2000);
	AI_Output(self,other,"DIA_Lord_Hagen_DMTAREDEAD_Yes_04_02");	//Так сказать, первичные инвестиции, на языке торговцев. Думаю, они тебе понадобятся.
	MIS_MYNEWMANSION = LOG_Running;
	Log_CreateTopic(TOPIC_MYNEWMANSION,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MYNEWMANSION,LOG_Running);
	B_LogEntry(TOPIC_MYNEWMANSION,"Лорд Хаген решил отблагодарить меня за устранение темных странников, передав мне во владение бывшую башню Декстера. Однако, Онару наверняка это не понравится, так что придется сначала уладить это дело с ним. Мне надо найти что-то такое, что позволит его убедить.");
	MIS_DTOLDNEWMINE = LOG_Running;
	Log_CreateTopic(TOPIC_DTOLDNEWMINE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DTOLDNEWMINE,LOG_Running);
	B_LogEntry_Quiet(TOPIC_DTOLDNEWMINE,"Похоже, рудная шахта у старой башни очень сильно заинтересовала лорда Хагена. Он хочет знать, осталась ли там еще магическая руда или нет. Надо бы найти кого-то, кто сможет оценить ее количество и качество.");
	AI_StopProcessInfos(self);
};

func void dia_lord_hagen_dmtaredead_no()
{
	AI_Output(other,self,"DIA_Lord_Hagen_DMTAREDEAD_No_15_00");	//Слишком много мороки. Я за это не возьмусь.
	AI_Output(self,other,"DIA_Lord_Hagen_DMTAREDEAD_No_04_01");	//Ты - воин, а не владетель, это абсолютно очевидно. Но, по законам обыкновенной справедливости, кому, как не тебе обладать освобожденной тобой от зла землей? Ладно, я не намерен ни к чему тебя принуждать. Считаю своим долгом лишь ещё раз поблагодарить тебя за уничтожение темных странников.
	AI_StopProcessInfos(self);
};

instance DIA_LORD_HAGEN_ONARSUCCS(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 27;
	condition = dia_lord_hagen_onarsuccs_condition;
	information = dia_lord_hagen_onarsuccs_info;
	permanent = FALSE;
	description = "Мне удалось уладить вопрос с Онаром.";
};

func int dia_lord_hagen_onarsuccs_condition()
{
	if((MIS_MYNEWMANSION == LOG_Running) && (DECISION_TOWER_MADE == TRUE))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_onarsuccs_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Lord_Hagen_OnarSuccs_15_00");	//Мне удалось уладить вопрос с Онаром. Он не будет мешать моим делам в башне.
	AI_Output(self,other,"DIA_Lord_Hagen_OnarSuccs_04_01");	//Кажется, дипломат из тебя не хуже, чем воин или лазутчик.
	AI_Output(self,other,"DIA_Lord_Hagen_OnarSuccs_04_02");	//Я же тем временем позаботился о документах. Теперь башня, близлежащие шахты и лес под ней официально принадлежат тебе. Поздравляю!
	B_GiveInvItems(self,other,ItWr_HagenLoanDocs,1);
	AI_Output(self,other,"DIA_Lord_Hagen_OnarSuccs_04_03");	//Как ты ими распорядишься - твое дело. Могу лишь посоветовать найти хорошего управляющего, который будет вести там хозяйство во время твоего отсутствия.
	AI_Output(self,other,"DIA_Lord_Hagen_OnarSuccs_04_04");	//Также постарайся набрать людей, у которых руки растут откуда надо, и которым ты доверяешь.
	AI_Output(other,self,"DIA_Lord_Hagen_OnarSuccs_15_05");	//Спасибо за совет. Я могу идти?
	AI_Output(self,other,"DIA_Lord_Hagen_OnarSuccs_04_06");	//Можешь. Ах, да, последнее. Я распоряжусь, чтобы лорд Андрэ отправил тебе пару ополченцев в помощь. Остальных же людей тебе придется искать самому.
	AI_Output(other,self,"DIA_Lord_Hagen_OnarSuccs_15_07");	//Не думаю, что появление ополчения в башне обрадует Онара.
	AI_Output(self,other,"DIA_Lord_Hagen_OnarSuccs_04_08");	//На этот счет не волнуйся. Я прикажу им сменить шкурку. Уверяю, стоит им снять казенное, как они тут же утратят все отличия от бродяг и праздных обывателей.
	MIS_MYNEWMANSION = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_MYNEWMANSION,LOG_SUCCESS);
	MIS_PPL_FOR_TOWER = LOG_Running;
	Log_CreateTopic(TOPIC_PPL_FOR_TOWER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PPL_FOR_TOWER,LOG_Running);
	B_LogEntry(TOPIC_PPL_FOR_TOWER,"Похоже, теперь в моем владении имеется значительная территория. Очевидно, что в одиночку контролировать ее у меня не получится, а это значит, что мне нужны люди, готовые присоединиться к моему небольшому лагерю. Пожалуй, для начала мне стоит осмотреть свои новые владения и дать инструкции охране лагеря. А потом уже начинать поиски людей. Найти хорошего управляющего - вот дело первостепенной важности!");
	B_LogEntry_Quiet(TOPIC_PPL_FOR_TOWER,"Лорд Хаген пообещал отправить мне в помощь пару ополченцев.");
	AI_StopProcessInfos(self);
	Wld_InsertNpc(Mil_360_Miliz,"NW_CASTLEMINE_PATH_HUT_02");
	Wld_InsertNpc(Mil_361_Miliz,"NW_CASTLEMINE_PATH_HUT_02");
};

instance DIA_LORD_HAGEN_OREISMINED(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 27;
	condition = dia_lord_hagen_oreismined_condition;
	information = dia_lord_hagen_oreismined_info;
	permanent = FALSE;
	description = "Я обследовал шахту, что рядом с башней.";
};

func int dia_lord_hagen_oreismined_condition()
{
	if((MIS_DTOLDNEWMINE == LOG_Running) && (HURRAYICANHIRE == TRUE) && ((HUNTYGRIMESRECRUITEDDT == TRUE) || (SearchOreMine == TRUE)))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_oreismined_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_OreIsMined_15_00");	//Я обследовал шахту, что рядом с башней.
	AI_Output(self,other,"DIA_Lord_Hagen_OreIsMined_04_01");	//И? Что скажешь?
	AI_Output(other,self,"DIA_Lord_Hagen_OreIsMined_15_02");	//Там все еще есть магическая руда. И по предварительной оценке ее там немало!
	AI_Output(self,other,"DIA_Lord_Hagen_OreIsMined_04_04");	//Великолепно! Тогда мне бы хотелось, чтобы ты переправлял ее в форт паладинов, что рядом с твоей башней.
	AI_Output(self,other,"DIA_Lord_Hagen_OreIsMined_04_05");	//А они уже сами позаботятся о том, чтобы доставить ее в город.
	AI_Output(self,other,"DIA_Lord_Hagen_OreIsMined_04_06");	//За каждую партию магической руды из этой шахты я готов платить тебе по сто золотых монет.
	AI_Output(self,other,"DIA_Lord_Hagen_OreIsMined_04_07");	//И кстати, говоря о партии, я ожидаю заполучить не менее сотни кусков этой ценной породы. Это ясно?
	Info_ClearChoices(dia_lord_hagen_oreismined);
	Info_AddChoice(dia_lord_hagen_oreismined,"По рукам!",dia_lord_hagen_oreismined_agree);

	if(RhetorikSkillValue[1] >= 50)
	{
		Info_AddChoice(dia_lord_hagen_oreismined,"...(Торговаться)",dia_lord_hagen_oreismined_trade);
	};
};

func void dia_lord_hagen_oreismined_agree()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Lord_Hagen_OreIsMined_Agree_15_00");	//По рукам!
	AI_Output(self,other,"DIA_Lord_Hagen_OreIsMined_Agree_04_01");	//Тогда договорились. Поздравляю, ты проделал изумительную работу!
	AI_Output(self,other,"DIA_Lord_Hagen_OreIsMined_Agree_04_02");	//Я с нетерпением буду ждать первых поставок.
	MIS_DTOLDNEWMINE = LOG_SUCCESS;
	SendHagenOre = TRUE;
	HagenOreBuy = 100;
	B_LogEntry(TOPIC_DTOLDNEWMINE,"За каждую партию магической руды лорд Хаген будет платить мне по сто золотых монет. Каждая партия должна составлять не менее сотни кусков руды.");
	Log_SetTopicStatus(TOPIC_DTOLDNEWMINE,LOG_SUCCESS);
	AI_StopProcessInfos(self);
};

func void dia_lord_hagen_oreismined_trade()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Lord_Hagen_OreIsMined_Trade_15_00");	//Сотню золотых? Но я не могу содержать лагерь на такие деньги!
	AI_Output(other,self,"DIA_Lord_Hagen_OreIsMined_Trade_15_01");	//Сам подумай: мне нужно платить работникам, платить за их еду, платить за их охрану. 	
	AI_Output(other,self,"DIA_Lord_Hagen_OreIsMined_Trade_15_02");	//Мне нужно платить огромную ренту Онару, ибо это был единственный способ уговорить его допустить меня к башне.
	AI_Output(other,self,"DIA_Lord_Hagen_OreIsMined_Trade_15_03");	//Сотни золотых недостаточно, чтобы покрыть все эти расходы.
	AI_Output(other,self,"DIA_Lord_Hagen_OreIsMined_Trade_15_04");	//И это все не считая ремонта, который я полностью оплатил из своего кошелька. 	
	AI_Output(self,other,"DIA_Lord_Hagen_OreIsMined_Trade_04_02");	//Хорошо, не стоит так разглагольствовать. Я все понял. За каждую партию руды ты будешь получать по две сотни золотых монет.
	AI_Output(self,other,"DIA_Lord_Hagen_OreIsMined_Trade_04_03");	//И я очень надеюсь, что поставки начнутся уже в ближайшие дни.
	MIS_DTOLDNEWMINE = LOG_SUCCESS;
	SendHagenOre = TRUE;
	HagenOreBuy = 200;
	B_LogEntry(TOPIC_DTOLDNEWMINE,"За каждую партию магической руды лорд Хаген будет платить мне по двести золотых монет. Каждая партия должна составлять не менее сотни кусков руды.");
	Log_SetTopicStatus(TOPIC_DTOLDNEWMINE,LOG_SUCCESS);
	AI_StopProcessInfos(self);
};

instance DIA_Lord_Hagen_DarkWeb(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 3;
	condition = DIA_Lord_Hagen_DarkWeb_Condition;
	information = DIA_Lord_Hagen_DarkWeb_Info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_Lord_Hagen_DarkWeb_Condition()
{
	if(MIS_RescueBennet == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_DarkWeb_Info()
{
	AI_Output(self,other,"DIA_Lord_Hagen_DarkWeb_01_00");	//(мрачно) Погоди... У меня к тебе есть еще одно дело.
	AI_Output(other,self,"DIA_Lord_Hagen_DarkWeb_01_01");	//Что такое?
	AI_Output(self,other,"DIA_Lord_Hagen_DarkWeb_01_02");	//Хмм... Давай вернемся к вопросу об убийстве паладина Лотара.
	AI_Output(other,self,"DIA_Lord_Hagen_DarkWeb_01_03");	//Но мы вроде уже все решили.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkWeb_01_04");	//Да, мы знаем, что этот кузнец не убивал его! Но кто был настоящим убийцей мы так и не узнали.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkWeb_01_05");	//Именно поэтому я и хочу дать тебе еще одно поручение - найти того ублюдка, кто всадил нож в спину Лотара!
	AI_Output(other,self,"DIA_Lord_Hagen_DarkWeb_01_06");	//А ты не мог бы поручить это задание кому-нибудь другому?
	AI_Output(self,other,"DIA_Lord_Hagen_DarkWeb_01_07");	//Зачем? Ты уже доказал, что способен на многое. А мои люди только наделают лишнего шума.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkWeb_01_08");	//К тому же, ты должен понимать, что для нас паладинов это дело чести.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkWeb_01_09");	//Мы не можем просто так закрыть глаза на этот инциндент. 
	AI_Output(self,other,"DIA_Lord_Hagen_DarkWeb_01_10");	//Мы должны найти этого убийцу и прилюдно покарать его за смерть нашего товарища и преданного слуги Инноса.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkWeb_01_11");	//Это чрезвычайно важно для меня и для всего ордена! А награда не заставит себя ждать.
	Info_ClearChoices(DIA_Lord_Hagen_DarkWeb);
	Info_AddChoice(DIA_Lord_Hagen_DarkWeb,"Нет уж, я лучше не стану вмешиваться во все это.",DIA_Lord_Hagen_DarkWeb_No);
	Info_AddChoice(DIA_Lord_Hagen_DarkWeb,"Ну хорошо, я помогу тебе.",DIA_Lord_Hagen_DarkWeb_Yes);
};

func void DIA_Lord_Hagen_DarkWeb_No()
{
	AI_Output(other,self,"DIA_Lord_Hagen_DarkWeb_No_01_00");	//Нет уж, я лучше не стану вмешиваться во все это.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkWeb_No_01_01");	//Тогда убирайся с глаз моих! И чтобы я тебя тут больше не видел.
	AI_StopProcessInfos(self);
};

func void DIA_Lord_Hagen_DarkWeb_Yes()
{
	AI_Output(other,self,"DIA_Lord_Hagen_DarkWeb_Yes_01_00");	//Ну хорошо, я помогу тебе. Но мне нужно больше информации!
	AI_Output(self,other,"DIA_Lord_Hagen_DarkWeb_Yes_01_01");	//Я расскажу все, что знаю. 
	AI_Output(other,self,"DIA_Lord_Hagen_DarkWeb_Yes_01_02");	//Можешь начинать.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkWeb_Yes_01_03");	//Хммм... Не задолго до убийства, в город прибыли двое наемников, с фермы Онара. 
	AI_Output(self,other,"DIA_Lord_Hagen_DarkWeb_Yes_01_04");	//По их словам, они прибыли за покупкой инструментов. Но тогда я не придал этому значения.
	AI_Output(other,self,"DIA_Lord_Hagen_DarkWeb_Yes_01_05");	//Как их звали?
	AI_Output(self,other,"DIA_Lord_Hagen_DarkWeb_Yes_01_06");	//Одним был этот кузнец, Беннет. Имя второго мне неизвестно, поскольку ему как-то удалось ускользнуть от людей лорда Андрэ. 
	AI_Output(other,self,"DIA_Lord_Hagen_DarkWeb_Yes_01_07");	//Плохо. А что насчет места преступления?
	AI_Output(self,other,"DIA_Lord_Hagen_DarkWeb_Yes_01_08");	//Мы нашли тело Лотара недалеко от южных ворот города. 
	AI_Output(other,self,"DIA_Lord_Hagen_DarkWeb_Yes_01_09");	//Что он там делал?
	AI_Output(self,other,"DIA_Lord_Hagen_DarkWeb_Yes_01_10");	//Обычно, в это время, он совершал вечерний обход постов городского ополчения. По всей видимости, в тот момент убийца и настиг его.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkWeb_Yes_01_11");	//Но меня смущает другое. На месте преступления не было обнаружено никаких следов боя!
	AI_Output(self,other,"DIA_Lord_Hagen_DarkWeb_Yes_01_12");	//Лотар был лучшим паладином в моем отряде и уж точно оказал бы достойное сопротивление врагу.
	AI_Output(other,self,"DIA_Lord_Hagen_DarkWeb_Yes_01_13");	//Интересно, кто мог убить паладина, даже не вступая с ним в бой?
	AI_Output(self,other,"DIA_Lord_Hagen_DarkWeb_Yes_01_14");	//Вот и мне это интересно. Придется тебе найти самому ответ на этот вопрос.
	AI_Output(other,self,"DIA_Lord_Hagen_DarkWeb_Yes_01_15");	//Ладно, посмотрим что можно сделать.
	MIS_DarkWeb = LOG_Running;
	Log_CreateTopic(TOPIC_DarkWeb,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DarkWeb,LOG_Running);
	B_LogEntry(TOPIC_DarkWeb,"Я решил помочь лорду Хагену найти настоящего убийцу паладина Лотара. Правда сведений касательно этого дела крайне мало. Во-первых, мне удалось выяснить, что до убийства Лотара в город прибыли два наемника, одним из которых был сам Беннет. Имя второго наемника лорду Хагену неизвестно. Придется поинтересоваться об этом у самого Беннета. Кроме этого, думаю стоит осмотреть само место преступления - окрестность, рядом с южными воротами Хориниса, где было обнаружено дело Лотара. Хотя по словам самого лорда Хагена, следов борьбы там обнаружено не было. Все это довольно странно, учитывая тот факт, что убитый был лучшим паладином из отряда Хагена...");
	AI_StopProcessInfos(self);
	Wld_InsertItem(ItMi_LotarRing,"FP_ITEM_LOTARRING_01");
};

instance DIA_Lord_Hagen_DarkWeb_Done(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 3;
	condition = DIA_Lord_Hagen_DarkWeb_Done_Condition;
	information = DIA_Lord_Hagen_DarkWeb_Done_Info;
	permanent = FALSE;
	description = "Я настиг убийцу паладина Лотара.";
};

func int DIA_Lord_Hagen_DarkWeb_Done_Condition()
{
	if((MIS_DarkWeb == LOG_Running) && (ItuseldIsDead == TRUE) && (Npc_HasItems(hero,ItMi_Ituseld_Kopf) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_DarkWeb_Done_Info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_DarkWeb_Done_01_00");	//Я настиг убийцу паладина Лотара.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkWeb_Done_01_02");	//Кто это был?
	AI_Output(other,self,"DIA_Lord_Hagen_DarkWeb_Done_01_03");	//Один довольно могущественный маг, служивший Белиару. Вот его голова.
	B_GiveInvItems(other,self,ItMi_Ituseld_Kopf,1);
	Npc_RemoveInvItems(self,ItMi_Ituseld_Kopf,1);
	AI_Output(self,other,"DIA_Lord_Hagen_DarkWeb_Done_01_04");	//Хммм...(с отвращением) Я знаю, что это за маг!
	AI_Output(other,self,"DIA_Lord_Hagen_DarkWeb_Done_01_05");	//Так ты его знал?
	AI_Output(self,other,"DIA_Lord_Hagen_DarkWeb_Done_01_06");	//Лично нет. Но лик темных мастеров я узнаю даже с закрытыми глазами!
	AI_Output(self,other,"DIA_Lord_Hagen_DarkWeb_Done_01_07");	//Это могущественные слуги бога Тьмы, хотя и достойнейшие из противников, против коих я когда-то сражался.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkWeb_Done_01_08");	//Правда это было очень давно, во время экспедиции в Ир'Хиррат - один из четырех храмов Белиара, который был нами разрушен до основания.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkWeb_Done_01_09");	//Что же, теперь я понимаю, что у Лотара почти не было шансов уйти живым.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkWeb_Done_01_10");	//Что касается тебя, то ты хорошо потрудился. За это тебе полагается особенная награда.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkWeb_Done_01_11");	//Выбирай сам, что ты хочешь получить...
	MIS_DarkWeb = LOG_Success;
	Log_SetTopicStatus(TOPIC_DarkWeb,LOG_Success);
	B_LogEntry(TOPIC_DarkWeb,"Я сообщил лорду Хагену, что настиг убийцу Лотара. В доказательство я принес ему голову, убитого мною мага. Лорд Хаген по достоинству оценил мою помощь в этом деле.");
	Info_ClearChoices(DIA_Lord_Hagen_DarkWeb_Done);
	Info_AddChoice(DIA_Lord_Hagen_DarkWeb_Done,"Меч 'Воля Робара'",DIA_Lord_Hagen_DarkWeb_Done_Gift_00);
	Info_AddChoice(DIA_Lord_Hagen_DarkWeb_Done,"Шлем паладина",DIA_Lord_Hagen_DarkWeb_Done_Gift_01);
	Info_AddChoice(DIA_Lord_Hagen_DarkWeb_Done,"Щит паладина",DIA_Lord_Hagen_DarkWeb_Done_Gift_02);
	Info_AddChoice(DIA_Lord_Hagen_DarkWeb_Done,"Рецепт освященных стрел",DIA_Lord_Hagen_DarkWeb_Done_Gift_03);
	Info_AddChoice(DIA_Lord_Hagen_DarkWeb_Done,"Руна 'Святая стрела'",DIA_Lord_Hagen_DarkWeb_Done_Gift_04);
	Info_AddChoice(DIA_Lord_Hagen_DarkWeb_Done,"Пять тысяч золотых монет",DIA_Lord_Hagen_DarkWeb_Done_Gift_05);
};

func void DIA_Lord_Hagen_DarkWeb_Done_Gift_00()
{
	B_GiveInvItems(self,other,ITMW_2H_KMR_RHOBAR_01,1);
	AI_Output(self,other,"DIA_Lord_Hagen_DarkWeb_Done_Gift_01_00");	//Хороший выбор.
	AI_StopProcessInfos(self);
};

func void DIA_Lord_Hagen_DarkWeb_Done_Gift_01()
{
	B_GiveInvItems(self,other,ItAr_Pal_Helm,1);
	AI_Output(self,other,"DIA_Lord_Hagen_DarkWeb_Done_Gift_01_00");	//Хороший выбор.
	AI_StopProcessInfos(self);
};

func void DIA_Lord_Hagen_DarkWeb_Done_Gift_02()
{
	B_GiveInvItems(self,other,ItAr_Shield_07,1);
	AI_Output(self,other,"DIA_Lord_Hagen_DarkWeb_Done_Gift_01_00");	//Хороший выбор.
	AI_StopProcessInfos(self);
};

func void DIA_Lord_Hagen_DarkWeb_Done_Gift_03()
{
	B_GiveInvItems(self,other,ItWr_HolyArrows,1);
	AI_Output(self,other,"DIA_Lord_Hagen_DarkWeb_Done_Gift_01_00");	//Хороший выбор.
	AI_StopProcessInfos(self);
};

func void DIA_Lord_Hagen_DarkWeb_Done_Gift_04()
{
	B_GiveInvItems(self,other,ItRu_PalHolyBolt,1);
	AI_Output(self,other,"DIA_Lord_Hagen_DarkWeb_Done_Gift_01_00");	//Хороший выбор.
	HagenGift = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_Lord_Hagen_DarkWeb_Done_Gift_05()
{
	B_GiveInvItems(self,other,ItMi_Gold,5000);
	AI_Output(self,other,"DIA_Lord_Hagen_DarkWeb_Done_Gift_01_00");	//Хороший выбор.
	AI_StopProcessInfos(self);
};