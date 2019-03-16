
instance DIA_GORNABAR_EXIT(C_Info)
{
	npc = xbs_7508_gornabar;
	nr = 999;
	condition = dia_gornabar_exit_condition;
	information = dia_gornabar_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_gornabar_exit_condition()
{
	return TRUE;
};

func void dia_gornabar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GORNABAR_HALLO(C_Info)
{
	npc = xbs_7508_gornabar;
	nr = 2;
	condition = dia_gornabar_hallo_condition;
	information = dia_gornabar_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gornabar_hallo_condition()
{
	if((Npc_GetDistToNpc(self,other) <= ZivilAnquatschDist) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void dia_gornabar_hallo_info()
{
	B_TurnToNpc(other,self);
	AI_Output(other,self,"DIA_GorNaBar_Hallo_15_00");	//Эй! Я тебя знаю! Ты - страж, который добывал слюну ползунов в старой шахте. Но...
	AI_Output(other,self,"DIA_GorNaBar_Hallo_15_01");	//Как ты выбрался из Старой шахты? Помнится, она обрушилась...
	AI_Output(self,other,"DIA_GorNaBar_Hallo_09_00");	//Ааа... я тебя узнаю, борец с ползунами.
	AI_Output(self,other,"DIA_GorNaBar_Hallo_09_01");	//Это долгая история. Обрушился в основном только проход. Нижние уровни остались практически целы.
	AI_Output(self,other,"DIA_GorNaBar_Hallo_09_02");	//А вот разум у многих в шахте пошатнулся так, что обрушился до самого основания. Я не буду рассказывать о том безумии, которое охватило всех в тот момент.
	AI_Output(self,other,"DIA_GorNaBar_Hallo_09_03");	//Я спрятался в глухом углу и молился - всем богам, известным и неизвестным мне.
	AI_Output(self,other,"DIA_GorNaBar_Hallo_09_04");	//И кто-то услышал мои молитвы.
	AI_Output(self,other,"DIA_GorNaBar_Hallo_09_05");	//После того как землетрясение стихло и мне удалось немного прийти в себя, я вдруг почувствовал, что меня обдувает прохладый ветер, доносящийся из узкой расшелины в завале.
	AI_Output(self,other,"DIA_GorNaBar_Hallo_09_06");	//Выбраться через нее из этой клятой шахты мне помог свиток превращения в мясного жука.
	AI_Output(self,other,"DIA_GorNaBar_Hallo_09_08");	//А где ты был все это время?
	AI_Output(other,self,"DIA_GorNaBar_Hallo_15_02");	//По-прежнему в бегах и в сражениях.
	AI_Output(self,other,"DIA_GorNaBar_Hallo_09_09");	//Понятно. В общем, все по-старому, как всегда.
	AI_Output(self,other,"DIA_GorNaBar_Hallo_09_10");	//Если тебе что-то понадобится - обращайся.
	AI_Output(other,self,"DIA_GorNaBar_Hallo_15_02A");	//А собственно, чем ты тут занимаешься?
	AI_Output(self,other,"DIA_GorNaBar_Hallo_09_10A");	//Я отвечаю за Стражей и слежу за порядком здесь в лагере. Если у тебя возникнут проблемы - приходи ко мне.
	AI_Output(self,other,"DIA_GorNaBar_Hallo_09_10B");	//Также я могу продать тебе некоторые товары из наших запасов.
	AI_Output(other,self,"DIA_GorNaBar_Hallo_15_03");	//Может, случайно у тебя имеются и свитки превращения в мясного жука? Я не видел их Хоринисе.
	AI_Output(self,other,"DIA_GorNaBar_Hallo_09_11");	//Есть пара штук.
	AI_Output(other,self,"DIA_GorNaBar_Hallo_15_04");	//А где я смогу здесь поспать?
	AI_Output(self,other,"DIA_GorNaBar_Hallo_09_12");	//В дальней правой палатке есть свободная кровать.
	AI_Output(self,other,"DIA_GorNaBar_Hallo_09_13");	//Можешь отдохнуть там.
	b_heroknowforestbase();
	Log_CreateTopic(TOPIC_XBS,LOG_NOTE);
	B_LogEntry(TOPIC_XBS,"Гор На Бар - командир Стражей в лесном лагере. У него можно купить разные товары.");
	AI_StopProcessInfos(self);
};


var int gornabar_lastpetzcounter;
var int gornabar_lastpetzcrime;

instance DIA_GORNABAR_PMSCHULDEN(C_Info)
{
	npc = xbs_7508_gornabar;
	nr = 1;
	condition = dia_gornabar_pmschulden_condition;
	information = dia_gornabar_pmschulden_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_gornabar_pmschulden_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (GORNABAR_SCHULDEN > 0) && (B_GetGreatestPetzCrime(self) <= GORNABAR_LASTPETZCRIME))
	{
		return TRUE;
	};
};

func void dia_gornabar_petzmaster_attackmurder()
{
	var string concatText;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_HumanMurderedHuman,0);
	GLOBAL_MAKE_BANDIT_FORCOAST = 1;
	concatText = "В лагере Нетбека объявили вас вне закона!";
	AI_Print(concatText);
};

func void dia_gornabar_pmschulden_attackmurder()
{
	var string concatText;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_HumanMurderedHuman,0);
	GLOBAL_MAKE_BANDIT_FORCOAST = 1;
	concatText = "В лагере Нетбека объявили вас вне закона!";
	AI_Print(concatText);
};

func void dia_gornabar_pmschulden_info()
{
	var int diff;
	var string concatText1;
	var string concatText2;
	var string concattextschulden;
	var string tsettext1;
	var string tsettext2;
	var string tsettext3;
	var int temp1;
	AI_Output(self,other,"DIA_GorNabar_PMSchulden_10_00");	//Прежде чем мы обсудим что-нибудь, мы уладим с тобой некоторые вопросы.
	temp1 = 0;
	if(GLOBAL_COAST_MURDER > 2)
	{
		temp1 = 1;
	};
	if(GLOBAL_COAST_THEFT > 5)
	{
		temp1 = 1;
	};
	if(GLOBAL_COAST_ATTACK > 5)
	{
		temp1 = 1;
	};
	if(temp1 == 1)
	{
		if(GLOBAL_COAST_MURDER > 2)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_COAST_MURDER),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_MURDERCOUNT2_COAST);
			tsettext3 = ConcatStrings(PRINT_MURDERCOUNT_COAST,tsettext2);
			AI_Output(self,other,"DIA_GorNabar_PMSchulden_08_37");	//Всем братьям в лагере надоели твои жестокие убийста.
			AI_Output(self,other,"DIA_GorNabar_PMSchulden_08_38");	//И единственный вариант прекратить твои безнаказанные выходки - это убить тебя...
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other,"DIA_GorNabar_PMSchulden_08_39");	//Приготовься умереть!
		}
		else if(GLOBAL_COAST_ATTACK > 5)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_COAST_ATTACK),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_ATTACKCOUNT2_COAST);
			tsettext3 = ConcatStrings(PRINT_ATTACKCOUNT_COAST,tsettext2);
			AI_Output(self,other,"DIA_GorNabar_PMSchulden_08_40");	//Точнее он один... этот вопрос.
			AI_Output(self,other,"DIA_GorNabar_PMSchulden_08_41");	//Всем братьям в лагере надоели твои постоянные драки.
			AI_Output(self,other,"DIA_GorNabar_PMSchulden_08_42");	//И единственный вариант прекратить твои безнаказанные выходки - это убить тебя...
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other,"DIA_GorNabar_PMSchulden_08_43");	//Приготовься умереть!
		}
		else if(GLOBAL_COAST_THEFT > 5)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_COAST_THEFT),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_THEFTCOUNT2_COAST);
			tsettext3 = ConcatStrings(PRINT_THEFTCOUNT_COAST,tsettext2);
			AI_Output(self,other,"DIA_GorNabar_PMSchulden_08_44");	//Точнее он один... этот вопрос.
			AI_Output(self,other,"DIA_GorNabar_PMSchulden_08_45");	//В нашем лагере нет места ворам!
			AI_Output(self,other,"DIA_GorNabar_PMSchulden_08_46");	//И единственный вариант прекратить твои безнаказанные выходки - это убить тебя...
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other,"DIA_GorNabar_PMSchulden_08_47");	//Приготовься умереть!
		};
		Log_CreateTopic(TOPIC_DIPLOM,LOG_NOTE);
		B_LogEntry(TOPIC_DIPLOM,"Я испортил свои отношения с лесными братьями, из-за постоянных моих бесчинств. Теперь меня там считают бандитом!");
		Info_ClearChoices(dia_gornabar_pmschulden);
		Info_ClearChoices(dia_gornabar_petzmaster);
		Info_AddChoice(dia_gornabar_pmschulden,"Постой...(пора сматываться)",dia_gornabar_pmschulden_attackmurder);
	}
	else
	{
		if(B_GetTotalPetzCounter(self) > GORNABAR_LASTPETZCOUNTER)
		{
			AI_Output(self,other,"DIA_GorNabar_PMSchulden_10_01");	//За прошедшее время ты добавил нам проблем.
			diff = B_GetTotalPetzCounter(self) - GORNABAR_LASTPETZCOUNTER;
			if(diff > 0)
			{
				GORNABAR_SCHULDEN = GORNABAR_SCHULDEN + (diff * 250);
			};
			if(GORNABAR_SCHULDEN < 1000)
			{
				AI_Output(self,other,"DIA_GorNabar_PMSchulden_10_03");	//Но я надеюсь, что ты компенсируешь их все! В целом это...
			}
			else
			{
				AI_Output(self,other,"DIA_GorNabar_PMSchulden_10_04");	//Я не ожидал такого от тебя. Сумма составляет...
			};
			AI_Output(other,self,"DIA_GorNaBar_PMAdd_15_00");	//Сколько?
			if(GORNABAR_SCHULDEN <= 1000)
			{
				B_Say_Gold(self,other,GORNABAR_SCHULDEN);
			}
			else
			{
				concatText1 = ConcatStrings(IntToString(GORNABAR_SCHULDEN),"");
				concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
				concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
				AI_Print(concattextschulden);
			};
		}
		else if(B_GetGreatestPetzCrime(self) < GORNABAR_LASTPETZCRIME)
		{
			AI_Output(self,other,"DIA_GorNabar_PMSchulden_10_05");	//Выяснилось несколько новых вещей.
			if(GORNABAR_LASTPETZCRIME == CRIME_MURDER)
			{
				AI_Output(self,other,"DIA_GorNabar_PMSchulden_10_06");	//Почему-то никто больше не обвиняет тебя в убийстве.
				GLOBAL_COAST_MURDER = GLOBAL_COAST_MURDER - 1;
				if(GLOBAL_COAST_MURDER < 0)
				{
					GLOBAL_COAST_MURDER = 0;
				};
			};
			if((GORNABAR_LASTPETZCRIME == CRIME_THEFT) || ((GORNABAR_LASTPETZCRIME > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT)))
			{
				AI_Output(self,other,"DIA_GorNabar_PMSchulden_10_07");	//Никто не вспоминает о том, что видел тебя при краже.
				GLOBAL_COAST_THEFT = GLOBAL_COAST_THEFT - 1;
				if(GLOBAL_COAST_THEFT < 0)
				{
					GLOBAL_COAST_THEFT = 0;
				};
			};
			if((GORNABAR_LASTPETZCRIME == CRIME_ATTACK) || ((GORNABAR_LASTPETZCRIME > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK)))
			{
				AI_Output(self,other,"DIA_GorNabar_PMSchulden_10_08");	//Больше нет ни одного свидетеля твоего участия в драке.
				GLOBAL_COAST_ATTACK = GLOBAL_COAST_ATTACK - 1;
				if(GLOBAL_COAST_ATTACK < 0)
				{
					GLOBAL_COAST_ATTACK = 0;
				};
			};
			if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
			{
				AI_Output(self,other,"DIA_GorNabar_PMSchulden_10_09");	//По-видимому, ребята простили тебе все то, что ты натворил.
			};
			AI_Output(self,other,"DIA_GorNabar_PMSchulden_10_10");	//Не заходи больше в своих делах так далеко!
			if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
			{
				AI_Output(self,other,"DIA_GorNabar_PMSchulden_10_11");	//И не создавай тут неприятностей!
				AI_Output(self,other,"DIA_GorNabar_PMSchulden_10_12");	//У нас их было достаточно за последнее время.
				GORNABAR_SCHULDEN = 0;
				GORNABAR_LASTPETZCOUNTER = 0;
				GORNABAR_LASTPETZCRIME = CRIME_NONE;
			}
			else
			{
				AI_Output(self,other,"DIA_GorNabar_PMSchulden_10_13");	//Чтобы было ясно: ты должен заплатить компенсацию в полном размере.
				AI_Output(other,self,"DIA_GorNaBar_PMAdd_15_00A");	//Сколько?
				if(GORNABAR_SCHULDEN <= 1000)
				{
					B_Say_Gold(self,other,GORNABAR_SCHULDEN);
				}
				else
				{
					concatText1 = ConcatStrings(IntToString(GORNABAR_SCHULDEN),"");
					concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
					concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
					AI_Print(concattextschulden);
				};
				AI_Output(self,other,"DIA_GorNabar_PMSchulden_10_14");	//Итак, что ты решил?
			};
		};
		if(B_GetGreatestPetzCrime(self) != CRIME_NONE)
		{
			Info_ClearChoices(dia_gornabar_pmschulden);
			Info_ClearChoices(dia_gornabar_petzmaster);
			Info_AddChoice(dia_gornabar_pmschulden,"У меня недостаточно золота!",dia_gornabar_petzmaster_paylater);
			Info_AddChoice(dia_gornabar_pmschulden,"Сколько я должен заплатить?",dia_gornabar_pmschulden_howmuchagain);
			if(Npc_HasItems(other,ItMi_Gold) >= GORNABAR_SCHULDEN)
			{
				Info_AddChoice(dia_gornabar_pmschulden,"Я заплачу.",dia_gornabar_petzmaster_paynow);
			};
		};
	};
};

func void dia_gornabar_pmschulden_howmuchagain()
{
	var string concatText1;
	var string concatText2;
	var string concattextschulden;
	AI_Output(other,self,"DIA_GorNabar_PMSchulden_HowMuchAgain_15_00");	//Сколько я должен заплатить?
	if(GORNABAR_SCHULDEN <= 1000)
	{
		B_Say_Gold(self,other,GORNABAR_SCHULDEN);
	}
	else
	{
		concatText1 = ConcatStrings(IntToString(GORNABAR_SCHULDEN),"");
		concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
		concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
		AI_Print(concattextschulden);
	};
	Info_ClearChoices(dia_gornabar_pmschulden);
	Info_ClearChoices(dia_gornabar_petzmaster);
	Info_AddChoice(dia_gornabar_pmschulden,"У меня недостаточно золота!",dia_gornabar_petzmaster_paylater);
	Info_AddChoice(dia_gornabar_pmschulden,"Сколько я должен заплатить?",dia_gornabar_pmschulden_howmuchagain);
	if(Npc_HasItems(other,ItMi_Gold) >= GORNABAR_SCHULDEN)
	{
		Info_AddChoice(dia_gornabar_pmschulden,"Я заплачу.",dia_gornabar_petzmaster_paynow);
	};
};


instance DIA_GORNABAR_PETZMASTER(C_Info)
{
	npc = xbs_7508_gornabar;
	nr = 1;
	condition = dia_gornabar_petzmaster_condition;
	information = dia_gornabar_petzmaster_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_gornabar_petzmaster_condition()
{
	if(B_GetGreatestPetzCrime(self) > GORNABAR_LASTPETZCRIME)
	{
		return TRUE;
	};
};

func void dia_gornabar_petzmaster_info()
{
	var string concatText1;
	var string concatText2;
	var string concattextschulden;
	var string tsettext1;
	var string tsettext2;
	var string tsettext3;
	var int temp1;
	GORNABAR_SCHULDEN = 0;
	if(self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output(self,other,"DIA_GorNabar_PETZMASTER_10_00");	//Эй, новичок! Зачем ты устроил у нас неприятности? Тебе придется уладить со мной этот вопрос.
	};
	temp1 = 0;
	if(GLOBAL_COAST_MURDER > 2)
	{
		temp1 = 1;
	};
	if(GLOBAL_COAST_THEFT > 5)
	{
		temp1 = 1;
	};
	if(GLOBAL_COAST_ATTACK > 5)
	{
		temp1 = 1;
	};
	if(temp1 == 1)
	{
		if(GLOBAL_COAST_MURDER > 2)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_COAST_MURDER),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_MURDERCOUNT2_COAST);
			tsettext3 = ConcatStrings(PRINT_MURDERCOUNT_COAST,tsettext2);
			AI_Output(self,other,"DIA_GorNabar_PETZMASTER_08_48");	//Точнее он один... этот вопрос.
			AI_Output(self,other,"DIA_GorNabar_PETZMASTER_08_49");	//Всем братьям в лагере надоели твои жестокие убийста.
			AI_Output(self,other,"DIA_GorNabar_PETZMASTER_08_50");	//И единственный вариант прекратить твои безнаказанные выходки - это убить тебя...
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other,"DIA_GorNabar_PETZMASTER_08_51");	//Приготовься умереть!
		}
		else if(GLOBAL_COAST_ATTACK > 5)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_COAST_ATTACK),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_ATTACKCOUNT2_COAST);
			tsettext3 = ConcatStrings(PRINT_ATTACKCOUNT_COAST,tsettext2);
			AI_Output(self,other,"DIA_GorNabar_PETZMASTER_08_52");	//Точнее он один... этот вопрос.
			AI_Output(self,other,"DIA_GorNabar_PETZMASTER_08_53");	//Всем братьям в лагере надоели твои постоянные драки.
			AI_Output(self,other,"DIA_GorNabar_PETZMASTER_08_54");	//И единственный вариант прекратить твои безнаказанные выходки - это убить тебя...
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other,"DIA_GorNabar_PETZMASTER_08_55");	//Приготовься умереть!
		}
		else if(GLOBAL_COAST_THEFT > 5)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_COAST_THEFT),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_THEFTCOUNT2_COAST);
			tsettext3 = ConcatStrings(PRINT_THEFTCOUNT_COAST,tsettext2);
			AI_Output(self,other,"DIA_GorNabar_PETZMASTER_08_56");	//Точнее он один... этот вопрос.
			AI_Output(self,other,"DIA_GorNabar_PETZMASTER_08_57");	//В нашем лагере нет места ворам!
			AI_Output(self,other,"DIA_GorNabar_PETZMASTER_08_58");	//И единственный вариант прекратить твои безнаказанные выходки - это убить тебя...
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other,"DIA_GorNabar_PETZMASTER_08_59");	//Приготовься умереть!
		};
		Log_CreateTopic(TOPIC_DIPLOM,LOG_NOTE);
		B_LogEntry(TOPIC_DIPLOM,"Я испортил свои отношения с лесными братьями, из-за постоянных моих бесчинств. Теперь меня там считают бандитом!");
		Info_ClearChoices(dia_gornabar_pmschulden);
		Info_ClearChoices(dia_gornabar_petzmaster);
		Info_AddChoice(dia_gornabar_petzmaster,"Постой...(пора сматываться)",dia_gornabar_petzmaster_attackmurder);
	}
	else
	{
		if(B_GetGreatestPetzCrime(self) == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_GorNabar_PETZMASTER_10_02");	//Убийство - самое последнее, что мы хотели бы видеть здесь!
			GORNABAR_SCHULDEN = B_GetTotalPetzCounter(self) * 1500;
			if((PETZCOUNTER_COAST_THEFT + PETZCOUNTER_COAST_ATTACK) > 0)
			{
				AI_Output(self,other,"DIA_GorNabar_PETZMASTER_10_04");	//Я даже не вспоминаю об остальных делах, которые ты натворил.
			};
			AI_Output(self,other,"DIA_GorNabar_PETZMASTER_10_06");	//Ты оплатишь похороны и выпивку ребятам.
			AI_Output(self,other,"DIA_GorNabar_PETZMASTER_10_07");	//Это не исправит сделанного, и тебе придется отвечать за свое преступление перед богами.
			AI_Output(self,other,"DIA_GorNabar_PETZMASTER_10_08");	//Но это хотя бы примирит всех с тем, что ты тут по-прежнему шастаешь.
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_THEFT)
		{
			AI_Output(self,other,"DIA_GorNabar_PETZMASTER_10_09");	//Я слышал, ты занимаешься воровством?
			if(PETZCOUNTER_COAST_ATTACK > 0)
			{
				AI_Output(self,other,"DIA_GorNabar_PETZMASTER_10_10");	//Помимо прочих неприятных дел.
			};
			AI_Output(self,other,"DIA_GorNabar_PETZMASTER_10_11");	//Не нужно было этого делать.
			AI_Output(self,other,"DIA_GorNabar_PETZMASTER_10_12");	//Надо заплатить ребятам кое-какую компенсацию, чтобы исправить содеянное!
			GORNABAR_SCHULDEN = B_GetTotalPetzCounter(self) * 500;
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
		{
			AI_Output(self,other,"DIA_GorNabar_PETZMASTER_10_13");	//Никому не нравятся драки - ты знаешь это? Если хочешь помахать кулаками - иди в Хоринис.
			AI_Output(self,other,"DIA_GorNabar_PETZMASTER_10_15");	//Тебе придется оплатить парням выпивку! Может, тогда они это забудут.
			GORNABAR_SCHULDEN = B_GetTotalPetzCounter(self) * 750;
		};
		AI_Output(other,self,"DIA_GorNabar_PETZMASTER_15_18");	//Сколько?
		if(GORNABAR_SCHULDEN <= 1000)
		{
			B_Say_Gold(self,other,GORNABAR_SCHULDEN);
		}
		else
		{
			concatText1 = ConcatStrings(IntToString(GORNABAR_SCHULDEN),"");
			concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
			concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
			AI_Print(concattextschulden);
		};
		Info_ClearChoices(dia_gornabar_pmschulden);
		Info_ClearChoices(dia_gornabar_petzmaster);
		Info_AddChoice(dia_gornabar_petzmaster,"У меня мало золота!",dia_gornabar_petzmaster_paylater);
		if(Npc_HasItems(other,ItMi_Gold) >= GORNABAR_SCHULDEN)
		{
			Info_AddChoice(dia_gornabar_petzmaster,"Я заплачу.",dia_gornabar_petzmaster_paynow);
		};
	};
};

func void dia_gornabar_petzmaster_paynow()
{
	AI_Output(other,self,"DIA_GorNabar_PETZMASTER_PayNow_15_00");	//Я заплачу!
	B_GiveInvItems(other,self,ItMi_Gold,GORNABAR_SCHULDEN);
	AI_Output(self,other,"DIA_GorNabar_PETZMASTER_PayNow_10_01");	//Хорошо, тогда я успокою парней. Но не повторяй подобного снова!
	B_GrantAbsolution(LOC_COAST);
	GORNABAR_SCHULDEN = 0;
	GORNABAR_LASTPETZCOUNTER = 0;
	GORNABAR_LASTPETZCRIME = CRIME_NONE;
	Info_ClearChoices(dia_gornabar_petzmaster);
	Info_ClearChoices(dia_gornabar_pmschulden);
};

func void dia_gornabar_petzmaster_paylater()
{
	AI_Output(other,self,"DIA_GorNabar_PETZMASTER_PayLater_15_00");	//У меня мало золота!
	AI_Output(self,other,"DIA_GorNabar_PETZMASTER_PayLater_10_01");	//Тогда найди его как можно скорее.
	AI_Output(self,other,"DIA_GorNabar_PETZMASTER_PayLater_10_02");	//И не создавай больше проблем - мы собрались тут не для их поиска.
	GORNABAR_LASTPETZCOUNTER = B_GetTotalPetzCounter(self);
	GORNABAR_LASTPETZCRIME = B_GetGreatestPetzCrime(self);
	AI_StopProcessInfos(self);
};


instance DIA_GORNABAR_SMITH(C_Info)
{
	npc = xbs_7508_gornabar;
	nr = 2;
	condition = dia_gornabar_smith_condition;
	information = dia_gornabar_smith_info;
	permanent = FALSE;
	description = "А кузнец у вас тут есть?";
};


func int dia_gornabar_smith_condition()
{
	return TRUE;
};

func void dia_gornabar_smith_info()
{
	AI_Output(other,self,"DIA_GorNaBar_Smith_15_00");	//А кузнец у вас тут есть?
	if(Npc_IsDead(darrion) == FALSE)
	{
		AI_Output(self,other,"DIA_GorNaBar_Smith_01_01");	//Да! Даррион из нашего лагеря.
		if(Npc_GetDistToWP(darrion,"WP_COAST_BASE_23") < 500)
		{
			AI_Output(self,other,"DIA_GorNaBar_Smith_01_02");	//Вот он сидит.
		};
		AI_Output(self,other,"DIA_GorNaBar_Smith_01_03");	//Он здесь только вечерами, а живет и работает в горах - там у него кузня.
	}
	else
	{
		AI_Output(self,other,"DIA_GorNaBar_Smith_01_04");	//Какое-то время кузнецом был Даррион, а сейчас нет ни одного.
	};
};


instance DIA_GORNABAR_HEADILL(C_Info)
{
	npc = xbs_7508_gornabar;
	nr = 3;
	condition = dia_gornabar_headill_condition;
	information = dia_gornabar_headill_info;
	permanent = FALSE;
	description = "А у тебя были головные боли?";
};


func int dia_gornabar_headill_condition()
{
	if(Kapitel >= 3)
	{
		return TRUE;
	};
};

func void dia_gornabar_headill_info()
{
	AI_Output(other,self,"DIA_GorNaBar_HeadIll_15_00");	//У тебя были головные боли?
	AI_Output(self,other,"DIA_GorNaBar_HeadIll_01_00");	//Первое время да, и очень сильные. Я списывал это на последствия пребывания в шахте.
	AI_Output(self,other,"DIA_GorNaBar_HeadIll_01_01");	//Но Нетбек объяснил мне, что это чье-то темное колдовство.
	AI_Output(self,other,"DIA_GorNaBar_HeadIll_01_02");	//Тут, в лагере, они пропали и больше меня не беспокоили.
	AI_StopProcessInfos(self);
};


instance DIA_GORNABAR_SHIP(C_Info)
{
	npc = xbs_7508_gornabar;
	nr = 2;
	condition = dia_gornabar_ship_condition;
	information = dia_gornabar_ship_info;
	permanent = FALSE;
	description = "Ты не хотел бы убраться отсюда на корабле?";
};


func int dia_gornabar_ship_condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && Npc_KnowsInfo(other,dia_gornabar_hallo))
	{
		return TRUE;
	};
};

func void dia_gornabar_ship_info()
{
	AI_Output(other,self,"DIA_GorNaBar_SHIP_15_00");	//Ты не хотел бы убраться отсюда на корабле?
	AI_Output(self,other,"DIA_GorNaBar_SHIP_01_01");	//Теперь нет! Мне начинает нравиться это место.
	AI_Output(self,other,"DIA_GorNaBar_SHIP_01_02");	//Думаю, что лес скоро займет всю рудниковую долину.
	AI_Output(self,other,"DIA_GorNaBar_SHIP_01_03");	//И тогда орки уйдут отсюда, побросав все свои топоры.
	AI_Output(other,self,"DIA_GorNaBar_SHIP_15_01");	//Очень на это надеюсь!
	AI_Output(self,other,"DIA_GorNaBar_SHIP_01_04");	//Нетбек сказал, что хватит вести войны - в нашей долине будет мир!
	AI_Output(self,other,"DIA_GorNaBar_SHIP_01_05");	//И когда устанешь носиться с мечом - возвращайся сюда.
	AI_Output(self,other,"DIA_GorNaBar_SHIP_01_06");	//Мы всегда тебе здесь рады.
};


instance DIA_GORNABAR_TRADE(C_Info)
{
	npc = xbs_7508_gornabar;
	nr = 2;
	condition = dia_gornabar_trade_condition;
	information = dia_gornabar_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Покажи свои запасы.";
};


func int dia_gornabar_trade_condition()
{
	return TRUE;
};


var int gornabar_ow_map;
var int gornabararrowsday;

func void dia_gornabar_trade_info()
{
	var int newscmeatbug;
	var int daynow;
	var int bolzenamount;

	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};
	if((Kapitel >= 3) && (GORNABAR_ITEMSGIVEN_CHAPTER_3 == FALSE) && ((GORNABAR_ITEMSGIVEN_CHAPTER_2 == TRUE) || (GORNABAR_ITEMSGIVEN_CHAPTER_1 == TRUE)))
	{
		newscmeatbug = TRUE;
	};
	if(Npc_HasItems(self,itpo_anpois) != 3)
	{
		Npc_RemoveInvItems(self,itpo_anpois,Npc_HasItems(self,itpo_anpois));
		CreateInvItems(self,itpo_anpois,3);
	};

	daynow = Wld_GetDay();

	if(GORNABARARROWSDAY < daynow)
	{
		if(Wld_IsTime(12,0,23,59) || (GORNABARARROWSDAY < (daynow - 1)))
		{
			bolzenamount = (Kapitel * 100) + (10 * (daynow - GORNABARARROWSDAY - 1));
			if(bolzenamount > Npc_HasItems(self,ItRw_Bolt))
			{
				CreateInvItems(self,ItRw_Bolt,bolzenamount - Npc_HasItems(self,ItRw_Bolt));
			};
			if(bolzenamount > Npc_HasItems(self,ItRw_Arrow))
			{
				CreateInvItems(self,ItRw_Arrow,bolzenamount - Npc_HasItems(self,ItRw_Arrow));
			};
			GORNABARARROWSDAY = daynow;
		};
	};

	AI_Output(other,self,"DIA_GorNaBar_TRADE_15_00");	//Покажи свои запасы.

	if(GORNABAR_OW_MAP == FALSE)
	{
		AI_Output(self,other,"DIA_GorNaBar_TRADE_09_02");	//Можешь купить у меня хорошую карту - она точнее тех, что есть в замке.
		GORNABAR_OW_MAP = TRUE;
	};
	if(newscmeatbug == TRUE)
	{
		AI_Output(self,other,"DIA_GorNaBar_TRADE_09_01");	//Хорошая новость - я случайно нашел еще один свиток превращения в мясного жука.
	};
	if((TplBelt_01 == FALSE) && (hero.guild == GIL_TPL))
	{
		CreateInvItems(self,ItBE_Addon_TPL_01,1);
		TplBelt_01 = TRUE;
	};

	B_GiveTradeInv(self);
};

