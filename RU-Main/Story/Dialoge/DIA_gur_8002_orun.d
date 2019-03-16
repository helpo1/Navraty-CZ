
instance DIA_BAALORUN_EXIT(C_Info)
{
	npc = gur_8002_orun;
	nr = 999;
	condition = dia_baalorun_exit_condition;
	information = dia_baalorun_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_baalorun_exit_condition()
{
	return TRUE;
};

func void dia_baalorun_exit_info()
{
	if((other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR))
	{
		AI_Output(other,self,"DIA_BaalOrun_exit_01_01");	//До встречи!
		AI_Output(self,other,"DIA_BaalOrun_exit_01_02");	//Да просветит тебя Спящий!
	};

	AI_StopProcessInfos(self);
};

instance DIA_BAALORUN_PICKPOCKET(C_Info)
{
	npc = gur_8002_orun;
	nr = 900;
	condition = DIA_BAALORUN_PICKPOCKET_Condition;
	information = DIA_BAALORUN_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int DIA_BAALORUN_PICKPOCKET_Condition()
{
	return C_Beklauen(49,35);
};

func void DIA_BAALORUN_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_BAALORUN_PICKPOCKET);
	Info_AddChoice(DIA_BAALORUN_PICKPOCKET,Dialog_Back,DIA_BAALORUN_PICKPOCKET_BACK);
	Info_AddChoice(DIA_BAALORUN_PICKPOCKET,DIALOG_PICKPOCKET,DIA_BAALORUN_PICKPOCKET_DoIt);
};

func void DIA_BAALORUN_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_BAALORUN_PICKPOCKET);
};

func void DIA_BAALORUN_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_BAALORUN_PICKPOCKET);
};


var int baalorun_lastpetzcounter;
var int baalorun_lastpetzcrime;

instance DIA_BAALORUN_PMSCHULDEN(C_Info)
{
	npc = gur_8002_orun;
	nr = 1;
	condition = dia_baalorun_pmschulden_condition;
	information = dia_baalorun_pmschulden_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_baalorun_pmschulden_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (BAALORUN_SCHULDEN > 0) && (B_GetGreatestPetzCrime(self) <= BAALORUN_LASTPETZCRIME))
	{
		return TRUE;
	};
};

func void dia_baalorun_petzmaster_attackmurder()
{
	var string concatText;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_HumanMurderedHuman,0);
	GLOBAL_MAKE_BANDIT_FORPSICAMP = 1;
	concatText = "Братство объявило вас вне закона!";
	AI_Print(concatText);
};

func void dia_baalorun_pmschulden_attackmurder()
{
	var string concatText;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_HumanMurderedHuman,0);
	GLOBAL_MAKE_BANDIT_FORPSICAMP = 1;
	concatText = "Братство объявило вас вне закона!";
	AI_Print(concatText);
};

func void dia_baalorun_pmschulden_info()
{
	var int diff;
	var string concatText1;
	var string concatText2;
	var string concattextschulden;
	var string tsettext1;
	var string tsettext2;
	var string tsettext3;
	var int temp1;
	AI_Output(self,other,"DIA_BaalOrun_PMSchulden_10_00");	//Прежде чем что-нибудь обсудить, мы уладим с тобой некоторые вопросы.
	temp1 = 0;
	if(GLOBAL_PSICAMP_MURDER > 2)
	{
		temp1 = 1;
	};
	if(GLOBAL_PSICAMP_THEFT > 5)
	{
		temp1 = 1;
	};
	if(GLOBAL_PSICAMP_ATTACK > 5)
	{
		temp1 = 1;
	};
	if(temp1 == 1)
	{
		if(GLOBAL_PSICAMP_MURDER > 2)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_PSICAMP_MURDER),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_MURDERCOUNT2_PSICAMP);
			tsettext3 = ConcatStrings(PRINT_MURDERCOUNT_PSICAMP,tsettext2);
			AI_Output(self,other,"DIA_BaalOrun_PMSchulden_08_36");	//Точнее он один... этот вопрос.
			AI_Output(self,other,"DIA_BaalOrun_PMSchulden_08_37");	//Всем братьям в лагере надоели твои жестокие убийства.
			AI_Output(self,other,"DIA_BaalOrun_PMSchulden_08_38");	//И единственный вариант прекратить твои безнаказанные выходки - это убить тебя...
			if(Npc_HasItems(self,ItRu_Whirlwind) == 0)
			{
				CreateInvItems(self,ItRu_Whirlwind,1);
			};
			B_ReadySpell(self,SPL_Whirlwind,SPL_Cost_Whirlwind);
			AI_Output(self,other,"DIA_BaalOrun_PMSchulden_08_39");	//Умри, неверный!
		}
		else if(GLOBAL_PSICAMP_ATTACK > 5)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_PSICAMP_ATTACK),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_ATTACKCOUNT2_PSICAMP);
			tsettext3 = ConcatStrings(PRINT_ATTACKCOUNT_PSICAMP,tsettext2);
			AI_Output(self,other,"DIA_BaalOrun_PMSchulden_08_40");	//Точнее он один... этот вопрос.
			AI_Output(self,other,"DIA_BaalOrun_PMSchulden_08_41");	//Всем братьям в лагере надоели твои постоянные драки.
			AI_Output(self,other,"DIA_BaalOrun_PMSchulden_08_42");	//И единственный вариант прекратить твои безнаказанные выходки - это убить тебя...
			if(Npc_HasItems(self,ItRu_Whirlwind) == 0)
			{
				CreateInvItems(self,ItRu_Whirlwind,1);
			};
			B_ReadySpell(self,SPL_Whirlwind,SPL_Cost_Whirlwind);
			AI_Output(self,other,"DIA_BaalOrun_PMSchulden_08_43");	//Умри, неверный!
		}
		else if(GLOBAL_PSICAMP_THEFT > 5)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_PSICAMP_THEFT),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_THEFTCOUNT2_PSICAMP);
			tsettext3 = ConcatStrings(PRINT_THEFTCOUNT_PSICAMP,tsettext2);
			AI_Output(self,other,"DIA_BaalOrun_PMSchulden_08_44");	//Точнее он один... этот вопрос.
			AI_Output(self,other,"DIA_BaalOrun_PMSchulden_08_45");	//В нашем лагере нет места ворам!
			AI_Output(self,other,"DIA_BaalOrun_PMSchulden_08_46");	//И единственный вариант прекратить твои безнаказанные выходки - это убить тебя...
			if(Npc_HasItems(self,ItRu_Whirlwind) == 0)
			{
				CreateInvItems(self,ItRu_Whirlwind,1);
			};
			B_ReadySpell(self,SPL_Whirlwind,SPL_Cost_Whirlwind);
			AI_Output(self,other,"DIA_BaalOrun_PMSchulden_08_47");	//Умри, неверный!
		};
		Log_CreateTopic(TOPIC_DIPLOM,LOG_NOTE);
		B_LogEntry(TOPIC_DIPLOM,"Из-за моих постоянных бесчинств мои отношения с Братством испорчены. Теперь меня там считают бандитом!");
		Info_ClearChoices(dia_baalorun_pmschulden);
		Info_ClearChoices(dia_baalorun_petzmaster);
		Info_AddChoice(dia_baalorun_pmschulden,"Постой... (пора сматываться)",dia_baalorun_pmschulden_attackmurder);
	}
	else
	{
		if(B_GetTotalPetzCounter(self) > BAALORUN_LASTPETZCOUNTER)
		{
			AI_Output(self,other,"DIA_BaalOrun_PMSchulden_10_01");	//За последнее время ты добавил нам проблем.
			diff = B_GetTotalPetzCounter(self) - BAALORUN_LASTPETZCOUNTER;
			if(diff > 0)
			{
				BAALORUN_SCHULDEN = BAALORUN_SCHULDEN + (diff * 250);
			};
			if(BAALORUN_SCHULDEN < 1000)
			{
				AI_Output(self,other,"DIA_BaalOrun_PMSchulden_10_03");	//Но я надеюсь, что ты компенсируешь их все! В целом это...
			}
			else
			{
				AI_Output(self,other,"DIA_BaalOrun_PMSchulden_10_04");	//Я не ожидал такого от тебя. Сумма составляет...
			};
			AI_Output(other,self,"DIA_BaalOrun_PMAdd_15_00");	//Сколько?
			if(BAALORUN_SCHULDEN <= 1000)
			{
				B_Say_Gold(self,other,BAALORUN_SCHULDEN);
			}
			else
			{
				concatText1 = ConcatStrings(IntToString(BAALORUN_SCHULDEN),"");
				concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
				concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
				AI_Print(concattextschulden);
			};
		}
		else if(B_GetGreatestPetzCrime(self) < BAALORUN_LASTPETZCRIME)
		{
			AI_Output(self,other,"DIA_BaalOrun_PMSchulden_10_05");	//Выяснилось несколько новых вещей.

			if(BAALORUN_LASTPETZCRIME == CRIME_MURDER)
			{
				AI_Output(self,other,"DIA_BaalOrun_PMSchulden_10_06");	//Почему-то никто больше не обвиняет тебя в убийстве.
				GLOBAL_PSICAMP_MURDER = GLOBAL_PSICAMP_MURDER - 1;
				if(GLOBAL_PSICAMP_MURDER < 0)
				{
					GLOBAL_PSICAMP_MURDER = 0;
				};
			};
			if((BAALORUN_LASTPETZCRIME == CRIME_THEFT) || ((BAALORUN_LASTPETZCRIME > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT)))
			{
				AI_Output(self,other,"DIA_BaalOrun_PMSchulden_10_07");	//Никто не вспоминает о том, что видел тебя при краже.
				GLOBAL_PSICAMP_THEFT = GLOBAL_PSICAMP_THEFT - 1;
				if(GLOBAL_PSICAMP_THEFT < 0)
				{
					GLOBAL_PSICAMP_THEFT = 0;
				};
			};
			if((BAALORUN_LASTPETZCRIME == CRIME_ATTACK) || ((BAALORUN_LASTPETZCRIME > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK)))
			{
				AI_Output(self,other,"DIA_BaalOrun_PMSchulden_10_08");	//Больше нет ни одного свидетеля твоего участия в драке.
				GLOBAL_PSICAMP_ATTACK = GLOBAL_PSICAMP_ATTACK - 1;
				if(GLOBAL_PSICAMP_ATTACK < 0)
				{
					GLOBAL_PSICAMP_ATTACK = 0;
				};
			};
			if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
			{
				AI_Output(self,other,"DIA_BaalOrun_PMSchulden_10_09");	//По-видимому, ребята простили тебе все то, что ты натворил.
			};
			AI_Output(self,other,"DIA_BaalOrun_PMSchulden_10_10");	//Не заходи больше в своих делах так далеко!
			if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
			{
				AI_Output(self,other,"DIA_BaalOrun_PMSchulden_10_11");	//И не создавай тут неприятностей!
				AI_Output(self,other,"DIA_BaalOrun_PMSchulden_10_12");	//У нас их было достаточно за последнее время.
				BAALORUN_SCHULDEN = 0;
				BAALORUN_LASTPETZCOUNTER = 0;
				BAALORUN_LASTPETZCRIME = CRIME_NONE;
			}
			else
			{
				AI_Output(self,other,"DIA_BaalOrun_PMSchulden_10_13");	//Чтобы было ясно: ты должен заплатить компенсацию в полном размере!
				AI_Output(other,self,"DIA_BaalOrun_PMAdd_15_00A");	//Сколько?
				if(BAALORUN_SCHULDEN <= 1000)
				{
					B_Say_Gold(self,other,BAALORUN_SCHULDEN);
				}
				else
				{
					concatText1 = ConcatStrings(IntToString(BAALORUN_SCHULDEN),"");
					concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
					concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
					AI_Print(concattextschulden);
				};
				AI_Output(self,other,"DIA_BaalOrun_PMSchulden_10_14");	//Итак, что ты решил?
			};
		};
		if(B_GetGreatestPetzCrime(self) != CRIME_NONE)
		{
			Info_ClearChoices(dia_baalorun_pmschulden);
			Info_ClearChoices(dia_baalorun_petzmaster);
			Info_AddChoice(dia_baalorun_pmschulden,"У меня недостаточно золота!",dia_baalorun_petzmaster_paylater);
			Info_AddChoice(dia_baalorun_pmschulden,"Сколько я должен заплатить?",dia_baalorun_pmschulden_howmuchagain);
			if(Npc_HasItems(other,ItMi_Gold) >= BAALORUN_SCHULDEN)
			{
				Info_AddChoice(dia_baalorun_pmschulden,"Я заплачу.",dia_baalorun_petzmaster_paynow);
			};
		};
	};
};

func void dia_baalorun_pmschulden_howmuchagain()
{
	var string concatText1;
	var string concatText2;
	var string concattextschulden;
	AI_Output(other,self,"DIA_BaalOrun_PMSchulden_HowMuchAgain_15_00");	//Сколько я должен заплатить?
	if(BAALORUN_SCHULDEN <= 1000)
	{
		B_Say_Gold(self,other,BAALORUN_SCHULDEN);
	}
	else
	{
		concatText1 = ConcatStrings(IntToString(BAALORUN_SCHULDEN),"");
		concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
		concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
		AI_Print(concattextschulden);
	};
	Info_ClearChoices(dia_baalorun_pmschulden);
	Info_ClearChoices(dia_baalorun_petzmaster);
	Info_AddChoice(dia_baalorun_pmschulden,"У меня недостаточно золота!",dia_baalorun_petzmaster_paylater);
	Info_AddChoice(dia_baalorun_pmschulden,"Сколько я должен заплатить?",dia_baalorun_pmschulden_howmuchagain);
	if(Npc_HasItems(other,ItMi_Gold) >= BAALORUN_SCHULDEN)
	{
		Info_AddChoice(dia_baalorun_pmschulden,"Я заплачу.",dia_baalorun_petzmaster_paynow);
	};
};


instance DIA_BAALORUN_PETZMASTER(C_Info)
{
	npc = gur_8002_orun;
	nr = 1;
	condition = dia_baalorun_petzmaster_condition;
	information = dia_baalorun_petzmaster_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_baalorun_petzmaster_condition()
{
	if(B_GetGreatestPetzCrime(self) > BAALORUN_LASTPETZCRIME)
	{
		return TRUE;
	};
};

func void dia_baalorun_petzmaster_info()
{
	var string concatText1;
	var string concatText2;
	var string concattextschulden;
	var string tsettext1;
	var string tsettext2;
	var string tsettext3;
	var int temp1;
	BAALORUN_SCHULDEN = 0;
	if(self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output(self,other,"DIA_BaalOrun_PetzMaster_10_00");	//Эй, новичок. Зачем ты устроил у нас неприятности? Тебе придется уладить со мной этот вопрос.
	};
	temp1 = 0;
	if(GLOBAL_PSICAMP_MURDER > 2)
	{
		temp1 = 1;
	};
	if(GLOBAL_PSICAMP_THEFT > 5)
	{
		temp1 = 1;
	};
	if(GLOBAL_PSICAMP_ATTACK > 5)
	{
		temp1 = 1;
	};
	if(temp1 == 1)
	{
		if(GLOBAL_PSICAMP_MURDER > 2)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_PSICAMP_MURDER),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_MURDERCOUNT2_PSICAMP);
			tsettext3 = ConcatStrings(PRINT_MURDERCOUNT_PSICAMP,tsettext2);
			AI_Output(self,other,"DIA_BaalOrun_PetzMaster_08_48");	//Точнее он один... этот вопрос.
			AI_Output(self,other,"DIA_BaalOrun_PetzMaster_08_49");	//Всем братьям в лагере надоели твои жестокие убийства.
			AI_Output(self,other,"DIA_BaalOrun_PetzMaster_08_50");	//И единственный вариант прекратить твои безнаказанные выходки - это убить тебя...
			if(Npc_HasItems(self,ItRu_Whirlwind) == 0)
			{
				CreateInvItems(self,ItRu_Whirlwind,1);
			};
			B_ReadySpell(self,SPL_Whirlwind,SPL_Cost_Whirlwind);
			AI_Output(self,other,"DIA_BaalOrun_PetzMaster_08_51");	//Умри, неверный!
		}
		else if(GLOBAL_PSICAMP_ATTACK > 5)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_PSICAMP_ATTACK),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_ATTACKCOUNT2_PSICAMP);
			tsettext3 = ConcatStrings(PRINT_ATTACKCOUNT_PSICAMP,tsettext2);
			AI_Output(self,other,"DIA_BaalOrun_PetzMaster_08_52");	//Точнее он один... этот вопрос.
			AI_Output(self,other,"DIA_BaalOrun_PetzMaster_08_53");	//Всем братьям в лагере надоели твои постоянные драки.
			AI_Output(self,other,"DIA_BaalOrun_PetzMaster_08_54");	//И единственный вариант прекратить твои безнаказанные выходки - это убить тебя...
			if(Npc_HasItems(self,ItRu_Whirlwind) == 0)
			{
				CreateInvItems(self,ItRu_Whirlwind,1);
			};
			B_ReadySpell(self,SPL_Whirlwind,SPL_Cost_Whirlwind);
			AI_Output(self,other,"DIA_BaalOrun_PetzMaster_08_55");	//Умри, неверный!
		}
		else if(GLOBAL_PSICAMP_THEFT > 5)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_PSICAMP_THEFT),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_THEFTCOUNT2_PSICAMP);
			tsettext3 = ConcatStrings(PRINT_THEFTCOUNT_PSICAMP,tsettext2);
			AI_Output(self,other,"DIA_BaalOrun_PetzMaster_08_56");	//Точнее он один... этот вопрос.
			AI_Output(self,other,"DIA_BaalOrun_PetzMaster_08_57");	//В нашем лагере нет места ворам!
			AI_Output(self,other,"DIA_BaalOrun_PetzMaster_08_58");	//И единственный вариант прекратить твои безнаказанные выходки - это убить тебя...
			if(Npc_HasItems(self,ItRu_Whirlwind) == 0)
			{
				CreateInvItems(self,ItRu_Whirlwind,1);
			};
			B_ReadySpell(self,SPL_Whirlwind,SPL_Cost_Whirlwind);
			AI_Output(self,other,"DIA_BaalOrun_PetzMaster_08_59");	//Умри, неверный!
		};
		Log_CreateTopic(TOPIC_DIPLOM,LOG_NOTE);
		B_LogEntry(TOPIC_DIPLOM,"Из-за моих постоянных бесчинств мои отношения с Братством испорчены. Теперь меня там считают бандитом!");
		Info_ClearChoices(dia_baalorun_pmschulden);
		Info_ClearChoices(dia_baalorun_petzmaster);
		Info_AddChoice(dia_baalorun_petzmaster,"Постой... (пора сматываться)",dia_baalorun_petzmaster_attackmurder);
	}
	else
	{
		if(B_GetGreatestPetzCrime(self) == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_BaalOrun_PetzMaster_10_02");	//Убийство - самое это последнее, что мы хотели бы видеть здесь!
			BAALORUN_SCHULDEN = B_GetTotalPetzCounter(self) * 1500;
			if((PETZCOUNTER_PSICAMP_THEFT + PETZCOUNTER_PSICAMP_ATTACK) > 0)
			{
				AI_Output(self,other,"DIA_BaalOrun_PetzMaster_10_04");	//Я даже не вспоминаю об остальных делах, которые ты натворил.
			};
			AI_Output(self,other,"DIA_BaalOrun_PetzMaster_10_06");	//Ты оплатишь похороны наших братьев.
			AI_Output(self,other,"DIA_BaalOrun_PetzMaster_10_07");	//Это не исправит сделанного, и тебе придется отвечать за свое преступление перед богами.
			AI_Output(self,other,"DIA_BaalOrun_PetzMaster_10_08");	//Но это, хотя бы, примирит всех с тем, что ты тут по-прежнему шастаешь.
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_THEFT)
		{
			AI_Output(self,other,"DIA_BaalOrun_PetzMaster_10_09");	//Я слышал, ты занимаешься воровством?
			if(PETZCOUNTER_PSICAMP_ATTACK > 0)
			{
				AI_Output(self,other,"DIA_BaalOrun_PetzMaster_10_10");	//Помимо прочих неприятных дел.
			};
			AI_Output(self,other,"DIA_BaalOrun_PetzMaster_10_11");	//Не нужно было этого делать.
			AI_Output(self,other,"DIA_BaalOrun_PetzMaster_10_12");	//Ты заплатишь штраф за свои преступления!
			BAALORUN_SCHULDEN = B_GetTotalPetzCounter(self) * 500;
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
		{
			AI_Output(self,other,"DIA_BaalOrun_PetzMaster_10_13");	//Никому не нравятся драки - ты знаешь это? Если хочешь помахать кулаками - иди в Хоринис.
			AI_Output(self,other,"DIA_BaalOrun_PetzMaster_10_15");	//Тебе придется оплатить свои преступления! Может, тогда все о них забудут.
			BAALORUN_SCHULDEN = B_GetTotalPetzCounter(self) * 750;
		};
		AI_Output(other,self,"DIA_BaalOrun_PetzMaster_15_18");	//Сколько?
		if(BAALORUN_SCHULDEN <= 1000)
		{
			B_Say_Gold(self,other,BAALORUN_SCHULDEN);
		}
		else
		{
			concatText1 = ConcatStrings(IntToString(BAALORUN_SCHULDEN),"");
			concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
			concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
			AI_Print(concattextschulden);
		};
		Info_ClearChoices(dia_baalorun_pmschulden);
		Info_ClearChoices(dia_baalorun_petzmaster);
		Info_AddChoice(dia_baalorun_petzmaster,"У меня мало золота.",dia_baalorun_petzmaster_paylater);
		if(Npc_HasItems(other,ItMi_Gold) >= BAALORUN_SCHULDEN)
		{
			Info_AddChoice(dia_baalorun_petzmaster,"Я заплачу.",dia_baalorun_petzmaster_paynow);
		};
	};
};

func void dia_baalorun_petzmaster_paynow()
{
	AI_Output(other,self,"DIA_BaalOrun_PetzMaster_PayNow_15_00");	//Я заплачу!
	B_GiveInvItems(other,self,ItMi_Gold,BAALORUN_SCHULDEN);
	AI_Output(self,other,"DIA_BaalOrun_PetzMaster_PayNow_10_01");	//Хорошо, тогда я успокою братьев. Но не повторяй подобного снова!
	B_GrantAbsolution(LOC_PSICAMP);
	BAALORUN_SCHULDEN = 0;
	BAALORUN_LASTPETZCOUNTER = 0;
	BAALORUN_LASTPETZCRIME = CRIME_NONE;
	Info_ClearChoices(dia_baalorun_petzmaster);
	Info_ClearChoices(dia_baalorun_pmschulden);
};

func void dia_baalorun_petzmaster_paylater()
{
	AI_Output(other,self,"DIA_BaalOrun_PetzMaster_PayLater_15_00");	//У меня мало золота.
	AI_Output(self,other,"DIA_BaalOrun_PetzMaster_PayLater_10_01");	//Тогда найди его как можно скорее.
	AI_Output(self,other,"DIA_BaalOrun_PetzMaster_PayLater_10_02");	//И не создавай больше проблем - мы собрались тут не для их поиска.
	BAALORUN_LASTPETZCOUNTER = B_GetTotalPetzCounter(self);
	BAALORUN_LASTPETZCRIME = B_GetGreatestPetzCrime(self);
	AI_StopProcessInfos(self);
};


instance DIA_BAALORUN_NOTALK_HI(C_Info)
{
	npc = gur_8002_orun;
	nr = 1;
	condition = dia_baalorun_notalk_hi_condition;
	information = dia_baalorun_notalk_hi_info;
	permanent = FALSE;
	important = FALSE;
	description = "Привет! Я здесь новенький.";
};


func int dia_baalorun_notalk_hi_condition()
{
	if((IDOLORAN_YES == FALSE) && (MIS_ORUNPACKET != LOG_FAILED) && (other.guild == GIL_NONE) && (IDOLORAN_NO == FALSE))
	{
		return TRUE;
	};
};

func void dia_baalorun_notalk_hi_info()
{
	AI_Output(other,self,"DIA_BaalOrun_NoTalk_Hi_15_00");	//Привет! Я здесь новенький!
	AI_Output(self,other,"DIA_BaalOrun_NoTalk_Hi_02_01");	//(вздох)
	AI_StopProcessInfos(self);
};


instance DIA_BAALORUN_NOTALK_SLEEPER(C_Info)
{
	npc = gur_8002_orun;
	nr = 1;
	condition = dia_baalorun_notalk_sleeper_condition;
	information = dia_baalorun_notalk_sleeper_info;
	permanent = FALSE;
	important = FALSE;
	description = "Да пребудет с тобой Спящий!";
};


func int dia_baalorun_notalk_sleeper_condition()
{
	if((IDOLORAN_YES == FALSE) && (MIS_ORUNPACKET != LOG_FAILED) && (other.guild == GIL_NONE) && (IDOLORAN_NO == FALSE))
	{
		return TRUE;
	};
};

func void dia_baalorun_notalk_sleeper_info()
{
	AI_Output(other,self,"DIA_BaalOrun_NoTalk_Sleeper_15_00");	//Да пребудет с тобой Спящий!
	AI_Output(self,other,"DIA_BaalOrun_NoTalk_Sleeper_02_01");	//(вздох)
	AI_StopProcessInfos(self);
};


instance DIA_BAALORUN_NOTALK_IMP(C_Info)
{
	npc = gur_8002_orun;
	nr = 1;
	condition = dia_baalorun_notalk_imp_condition;
	information = dia_baalorun_notalk_imp_info;
	permanent = TRUE;
	important = FALSE;
	description = "Все в порядке, приятель?";
};


func int dia_baalorun_notalk_imp_condition()
{
	if((IDOLORAN_YES == FALSE) && (MIS_ORUNPACKET != LOG_FAILED) && (other.guild == GIL_NONE) && (IDOLORAN_NO == FALSE))
	{
		return TRUE;
	};
};

func void dia_baalorun_notalk_imp_info()
{
	AI_Output(other,self,"DIA_BaalOrun_NoTalk_Imp_15_00");	//Все в порядке, приятель?
	AI_Output(self,other,"DIA_BaalOrun_NoTalk_Imp_02_01");	//(вздох)
	AI_StopProcessInfos(self);
};


instance DIA_BAALORUN_FIRST(C_Info)
{
	npc = gur_8002_orun;
	nr = 1;
	condition = dia_baalorun_first_condition;
	information = dia_baalorun_first_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_baalorun_first_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_ORUNHELPSHIP != LOG_Running) && ((other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR)))
	{
		return TRUE;
	};
};

func void dia_baalorun_first_info()
{
	AI_Output(self,other,"DIA_BaalOrun_FIRST_01_00");	//Что тебе нужно?
};


instance DIA_BAALORUN_AUFGABE(C_Info)
{
	npc = gur_8002_orun;
	nr = 1;
	condition = dia_baalorun_aufgabe_condition;
	information = dia_baalorun_aufgabe_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_baalorun_aufgabe_condition()
{
	var C_Item itm;
	itm = Npc_GetEquippedArmor(other);

	if(Npc_IsInState(self,ZS_Talk) && (hero.guild == GIL_NONE) && ((Hlp_IsItem(itm,itar_sekbed) == TRUE) || (Hlp_IsItem(itm,itar_sekbed_v1) == TRUE)))
	{
		return TRUE;
	};
};

func void dia_baalorun_aufgabe_info()
{
	AI_Output(self,other,"DIA_BaalOrun_Aufgabe_01_00");	//Постой... Откуда у тебя набедренная повязка послушника нашего Братства?
	AI_Output(self,other,"DIA_BaalOrun_Aufgabe_01_01");	//Ты похож на искателя - искателя истинной веры. Разве не ощущаешь ты внутри бушующее пламя - то, что не дает тебе спать по ночам?
	AI_Output(self,other,"DIA_BaalOrun_Aufgabe_01_02");	//Вижу, тебя терзают сомнения - есть ли правда в том, что пытаются навязать тебе прислужники лживых богов?
	AI_Output(self,other,"DIA_BaalOrun_Aufgabe_01_03");	//И ты знаешь, откуда берутся эти сомнения. Они все лгут!
	AI_Output(self,other,"DIA_BaalOrun_Aufgabe_01_04");	//Разве не ощущаешь ты стремление к свободе? Как день ото дня оно становится все сильнее, как направляет оно твой дух? Освободи его!
	AI_Output(other,self,"DIA_BaalOrun_Aufgabe_01_05");	//Ты заговорил со мной. Как я помню, это значит, что теперь и я могу обратиться к тебе?
	AI_Output(self,other,"DIA_BaalOrun_Aufgabe_01_06");	//Ты знаешь наши правила. Это похвально!
	AI_Output(self,other,"DIA_BaalOrun_Aufgabe_01_07");	//Остальные наши братья не станут с тобой разговаривать, пока ты не докажешь то, что тебе можно доверять.
	AI_Output(self,other,"DIA_BaalOrun_Aufgabe_01_08");	//А я заговорил с тобой, дабы дать тебе шанс проявить себя.
	AI_Output(self,other,"DIA_BaalOrun_Aufgabe_01_09");	//Если ты хорошо зарекомендуешь себя в наших глазах, то впоследствии сможешь присоединиться к нашему Братству. Если захочешь, конечно!
	AI_Output(other,self,"DIA_BaalOrun_Aufgabe_01_10");	//Как я могу доказать свою преданность?
	AI_Output(self,other,"DIA_BaalOrun_Aufgabe_01_11");	//У меня есть для тебя одно очень деликатное поручение.
	AI_Output(self,other,"DIA_BaalOrun_Aufgabe_01_12");	//Если ты его выполнишь, то думаю, этого будет достаточно, чтобы мы смогли начать доверять тебе.
	Info_ClearChoices(dia_baalorun_aufgabe);
	Info_AddChoice(dia_baalorun_aufgabe,"Хорошо. Что я должен сделать?",dia_baalorun_aufgabe_yes);
	Info_AddChoice(dia_baalorun_aufgabe,"К сожалению, у меня нет времени на это.",dia_baalorun_aufgabe_no);
};

func void dia_baalorun_aufgabe_no()
{
	AI_Output(other,self,"DIA_BaalOrun_Aufgabe_01_13");	//К сожалению, у меня нет времени на это.
	AI_Output(self,other,"DIA_BaalOrun_Aufgabe_01_14");	//(вздох) Ах!
	IDOLORAN_NO = TRUE;
	Info_ClearChoices(dia_baalorun_aufgabe);
	AI_StopProcessInfos(self);
};

func void dia_baalorun_aufgabe_yes()
{
	AI_Output(other,self,"DIA_BaalOrun_Aufgabe_01_15");	//Хорошо. Что я должен сделать?
	AI_Output(self,other,"DIA_BaalOrun_Aufgabe_01_16");	//Я дам тебе одну вещь. Вот эту посылку. А ты должен доставить ее одному человеку.
	AI_Output(other,self,"DIA_BaalOrun_Aufgabe_01_17");	//Кто этот человек?
	AI_Output(self,other,"DIA_BaalOrun_Aufgabe_01_18_01");	//Его зовут Лариус, он городской глава Хориниса. Хотя, пока паладины находятся в городе, он таковым не является.
	AI_Output(self,other,"DIA_BaalOrun_Aufgabe_01_19");	//Просто передай ему эту посылку - он в курсе всего остального. Ты найдешь его в городской ратуше.
	AI_Output(self,other,"DIA_BaalOrun_Aufgabe_01_22");	//После того, как ты отдашь ему пакет, он должен будет передать тебе кое-что и для меня.
	AI_Output(self,other,"DIA_BaalOrun_Aufgabe_01_23");	//Принеси эту вещь мне. Если сделаешь все как надо, то заслужишь наше доверие к тебе.
	AI_Output(self,other,"DIA_BaalOrun_Aufgabe_01_24");	//И самое главное. Лариус - человек очень подозрительный, и, возможно, даже не станет тебя слушать, если ты вызовешь у него подозрения.
	AI_Output(self,other,"DIA_BaalOrun_Aufgabe_01_25");	//Поэтому постарайся его убедить в том, что ты - именно тот человек, которого прислал я.
	if(PALGUARD == TRUE)
	{
		AI_Output(other,self,"DIA_BaalOrun_Aufgabe_01_26");	//А как мне миновать охрану в ратуше? Паладины не пропустят меня к нему.
		AI_Output(self,other,"DIA_BaalOrun_Aufgabe_01_27");	//Ну, постарайся придумать что-нибудь. Возможно, есть какой-нибудь способ миновать стражу или встретится с Лариусом вне стен ратуши.
		AI_Output(self,other,"DIA_BaalOrun_Aufgabe_01_28");	//Вот, держи пакет. И смотри не потеряй его.
	}
	else
	{
		AI_Output(other,self,"DIA_BaalOrun_Aufgabe_01_29");	//Я все понял.
		AI_Output(self,other,"DIA_BaalOrun_Aufgabe_01_30");	//Вот и хорошо. Держи пакет и смотри не потеряй его.
	};
	B_GiveInvItems(self,other,itmi_drogenpocket,1);
	AI_Output(self,other,"DIA_BaalOrun_Aufgabe_01_31");	//Теперь ступай.
	Info_ClearChoices(dia_baalorun_aufgabe);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(VLK_400_Larius,"Start");
	Log_CreateTopic(TOPIC_ORUNPACKET,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ORUNPACKET,LOG_Running);
	MIS_ORUNPACKET = LOG_Running;
	IDOLORAN_YES = TRUE;
	B_LogEntry(TOPIC_ORUNPACKET,"Я согласился помочь Идолу Орану выполнить для него одно деликатное дело. Мне необходимо доставить посылку городскому советнику Лариусу. И забрать то, что Лариус, в свою очередь, даст мне для Идола Орана.");
};


instance DIA_BAALORUN_ZUSTIMMUNG(C_Info)
{
	npc = gur_8002_orun;
	nr = 5;
	condition = dia_baalorun_zustimmung_condition;
	information = dia_baalorun_zustimmung_info;
	permanent = FALSE;
	description = "Я передал посылку Лариусу.";
};


func int dia_baalorun_zustimmung_condition()
{
	if((Npc_HasItems(other,itmi_lariusgoldpocket) >= 1) && (MIS_ORUNPACKET == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_baalorun_zustimmung_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_BaalOrun_Zustimmung_01_00");	//Я передал посылку Лариусу. Взамен, он попросил передать тебе вот эту сумму.
	B_GiveInvItems(other,self,itmi_lariusgoldpocket,1);
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_BaalOrun_Zustimmung_01_01");	//Я знал, что ты не подведешь меня. Были проблемы?
		AI_Output(other,self,"DIA_BaalOrun_Zustimmung_01_02");	//Да так, ничего существенного.
		AI_Output(self,other,"DIA_BaalOrun_Zustimmung_01_03");	//Хорошо! Ты проявил себя с самой лучшей стороны и доказал, что тебе можно доверять.
		AI_Output(self,other,"DIA_BaalOrun_Zustimmung_01_04");	//Я расскажу о тебе другим нашим братьям!
		AI_Output(self,other,"DIA_BaalOrun_Zustimmung_01_05");	//А если у тебя есть намерение присоединиться к нам, то многие из них не откажутся помочь тебе в этом!
	}
	else
	{
		AI_Output(self,other,"DIA_BaalOrun_Zustimmung_01_01");	//Я знал, что ты не подведешь меня. Были проблемы?
	};
	Log_SetTopicStatus(TOPIC_ORUNPACKET,LOG_SUCCESS);
	Npc_ExchangeRoutine(VLK_400_Larius,"Always");
	B_LogEntry(TOPIC_ORUNPACKET,"Я отдал суму Идолу Орану и тем самым заслужил его благодарность и доверие всего Братства.");
	MIS_ORUNPACKET = LOG_SUCCESS;
};


instance DIA_BAALORUN_NOZUSTIMMUNG(C_Info)
{
	npc = gur_8002_orun;
	nr = 5;
	condition = dia_baalorun_nozustimmung_condition;
	information = dia_baalorun_nozustimmung_info;
	permanent = FALSE;
	description = "Я не смог передать посылку Лариусу.";
};


func int dia_baalorun_nozustimmung_condition()
{
	if(MIS_ORUNPACKET == LOG_FAILED)
	{
		return TRUE;
	};
};

func void dia_baalorun_nozustimmung_info()
{
	AI_Output(other,self,"DIA_BaalOrun_NoZustimmung_01_00");	//Я не смог передать посылку Лариусу.
	AI_Output(self,other,"DIA_BaalOrun_NoZustimmung_01_01");	//Почему?
	if(LARIUSCANCELPACKET > 1)
	{
		AI_Output(other,self,"DIA_BaalOrun_NoZustimmung_01_02");	//Он отказался брать ее, а потом его стражники чуть не сделали из меня отбивную!
	}
	else
	{
		AI_Output(other,self,"DIA_BaalOrun_NoZustimmung_01_02A");	//Эээ... так получилось, что...
	};

	AI_Output(self,other,"DIA_BaalOrun_NoZustimmung_01_03");	//А где мой пакет?

	if(Npc_HasItems(other,itmi_drogenpocket) >= 1)
	{
		AI_Output(other,self,"DIA_BaalOrun_NoZustimmung_01_04");	//А, ну да. Вот, возьми его обратно.
		B_GiveInvItems(other,self,itmi_drogenpocket,1);
		AI_Output(self,other,"DIA_BaalOrun_NoZustimmung_01_05");	//Хоть его ты умудрился не потерять. Как я ошибся, что доверил ТЕБЕ это дело!
		AI_Output(self,other,"DIA_BaalOrun_NoZustimmung_01_06");	//Ты сильно разочаровал меня. Убирайся с глаз моих!
		IDOLORAN_YES = FALSE;
		IDOLORAN_NOFOREVER = TRUE;
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(VLK_400_Larius,"Always");
	}
	else
	{
		AI_Output(other,self,"DIA_BaalOrun_NoZustimmung_01_07");	//У меня его нет. Я... эээ... потерял его.
		AI_Output(self,other,"DIA_BaalOrun_NoZustimmung_01_08");	//ЧТО?
		AI_Output(self,other,"DIA_BaalOrun_NoZustimmung_01_09");	//Ты что, принимаешь меня за идиота?
		AI_Output(self,other,"DIA_BaalOrun_NoZustimmung_01_10");	//Тебе это так не сойдет с рук! Сейчас ты умрешь за свою подлость!
		AI_Output(self,other,"DIA_BaalOrun_NoZustimmung_01_11");	//Умри, неверный!
		IDOLORAN_YES = FALSE;
		IDOLORAN_NOFOREVER = TRUE;
		IDOLORAN_NOFOREVERKILL = TRUE;
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(VLK_400_Larius,"Always");
		B_Attack(self,other,AR_GuardCalledToKill,1);
	};
};

instance DIA_BAALORUN_NOFOREVER(C_Info)
{
	npc = gur_8002_orun;
	nr = 5;
	condition = dia_baalorun_noforever_condition;
	information = dia_baalorun_noforever_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_baalorun_noforever_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (IDOLORAN_NOFOREVER == TRUE))
	{
		return TRUE;
	};
};

func void dia_baalorun_noforever_info()
{
	if(IDOLORAN_NOFOREVERKILL == FALSE)
	{
		AI_Output(self,other,"DIA_BaalOrun_NoForever_01_00");	//Убирайся с глаз моих!
		IDOLORAN_NOFOREVER = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_BaalOrun_NoForever_01_01");	//Умри, неверный!
		IDOLORAN_NOFOREVER = TRUE;
		IDOLORAN_NOFOREVERKILL = TRUE;
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_GuardCalledToKill,1);
	};
};


instance DIA_BAALORUN_JOINSEKTA(C_Info)
{
	npc = gur_8002_orun;
	nr = 5;
	condition = dia_baalorun_joinsekta_condition;
	information = dia_baalorun_joinsekta_info;
	permanent = FALSE;
	description = "Ты сказал, что я смогу присоединиться к вам.";
};


func int dia_baalorun_joinsekta_condition()
{
	if((hero.guild == GIL_NONE) && (MIS_ORUNPACKET == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_baalorun_joinsekta_info()
{
	AI_Output(other,self,"DIA_BaalOrun_JoinSekta_01_00");	//Ты сказал, что я смогу присоединиться к вам.
	AI_Output(self,other,"DIA_BaalOrun_JoinSekta_01_01");	//Теперь, когда ты помог нам и доказал свою преданность, ты по праву можешь просить об этом.
	AI_Output(other,self,"DIA_BaalOrun_JoinSekta_01_02");	//Тогда прими меня в послушники Братства!
	AI_Output(self,other,"DIA_BaalOrun_JoinSekta_01_03");	//Я считаю, что ты достоин этой чести.
	AI_Output(self,other,"DIA_BaalOrun_JoinSekta_01_04");	//Теперь ты в любой момент можешь присоединиться к нам.
	AI_Output(self,other,"DIA_BaalOrun_JoinSekta_01_05");	//Но запомни: одев робу нашего Братства, ты уже не сможешь ее просто так снять и отказаться от нашей веры.
	AI_Output(self,other,"DIA_BaalOrun_JoinSekta_01_06");	//Поэтому хорошенько подумай, прежде чем принять такое решение!
	Log_CreateTopic(TOPIC_PSICAMPJOIN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PSICAMPJOIN,LOG_Running);
	CANJOINPSI = TRUE;
	B_LogEntry(TOPIC_PSICAMPJOIN,"Идол Оран дал свое согласие на принятие меня в Братство.");
};


instance DIA_BAALORUN_SEKTAADVANTAGE(C_Info)
{
	npc = gur_8002_orun;
	nr = 5;
	condition = dia_baalorun_sektaadvantage_condition;
	information = dia_baalorun_sektaadvantage_info;
	permanent = FALSE;
	description = "А какую выгоду я извлеку, присоединившись к вам?";
};


func int dia_baalorun_sektaadvantage_condition()
{
	if((hero.guild == GIL_NONE) && Npc_KnowsInfo(other,dia_baalorun_joinsekta))
	{
		return TRUE;
	};
};

func void dia_baalorun_sektaadvantage_info()
{
	AI_Output(other,self,"DIA_BaalOrun_SektaAdvantage_01_00");	//А какую выгоду я извлеку для себя, присоединившись к вам?
	AI_Output(self,other,"DIA_BaalOrun_SektaAdvantage_01_01");	//Ты сомневаешься в том, правильный ли делаешь выбор? Позволь, я объясню тебе кое-что.
	AI_Output(self,other,"DIA_BaalOrun_SektaAdvantage_01_02");	//Хотя наше Братство и не обладает уже тем могуществом и влиянием, которое было во времена существования Барьера...
	AI_Output(self,other,"DIA_BaalOrun_SektaAdvantage_01_03");	//...однако мудрость и знания, которые нам в свое время даровал Спящий, мы не только сохранили, но и преумножили!
	AI_Output(self,other,"DIA_BaalOrun_SektaAdvantage_01_04");	//Возможно, ты станешь одним из избранных - Гуру, и получишь возможность познать древнюю магию, открытую когда-то нам Спящим.
	AI_Output(self,other,"DIA_BaalOrun_SektaAdvantage_01_05");	//Или же ты сможешь удостоиться высшей чести - стать Стражем. Только лучшие из воинов могут носить это звание!
	AI_Output(self,other,"DIA_BaalOrun_SektaAdvantage_01_06");	//Если будет на то воля судьбы, ты сможешь даже совместить оба этих занятия: лучшие из Стражей также обладают магическими знаниями.
	AI_Output(self,other,"DIA_BaalOrun_SektaAdvantage_01_07");	//Как видишь, наше Братство предоставит тебе массу возможностей.
	AI_Output(self,other,"DIA_BaalOrun_SektaAdvantage_01_08");	//Подумай о том, что я тебе сказал, прежде чем ты решишь сделать свой выбор.
};


instance DIA_BAALORUN_TELLABOUT(C_Info)
{
	npc = gur_8002_orun;
	nr = 1;
	condition = dia_baalorun_tellabout_condition;
	information = dia_baalorun_tellabout_info;
	permanent = FALSE;
	description = "Расскажи мне о Братстве.";
};


func int dia_baalorun_tellabout_condition()
{
	if((other.guild == GIL_SEK) && Npc_KnowsInfo(other,dia_baalorun_joinsekta))
	{
		return TRUE;
	};
};

func void dia_baalorun_tellabout_info()
{
	AI_Output(other,self,"DIA_BaalOrun_TellAbout_01_01");	//Расскажи мне о Братстве.
	AI_Output(self,other,"DIA_BaalOrun_TellAbout_01_02");	//После того как Спящий - демон, которому мы все ошибочно поклонялись, принимая его за нашего спасителя, был изгнан из этого мира...
	AI_Output(self,other,"DIA_BaalOrun_TellAbout_01_03");	//...Братство оказалось на грани полного уничтожения!
	AI_Output(self,other,"DIA_BaalOrun_TellAbout_01_04");	//Большинство наших братьев либо погибли, либо сошли с ума. Они буквально обезумели, и уже практически не походили на людей!
	AI_Output(self,other,"DIA_BaalOrun_TellAbout_01_05");	//Те же, кто все-таки сумел сохранить свою жизнь и спасти свой разум от безумия, отправились сюда в Хоринис...
	AI_Output(self,other,"DIA_BaalOrun_TellAbout_01_06");	//...в надежде обрести здесь покой и возможность осмыслить все пережитое.
	AI_Output(self,other,"DIA_BaalOrun_TellAbout_01_07");	//Мы основали тут свой небольшой лагерь, и стали проводить время в поисках истинного знания, способного вернуть нам душевное равновесие...
	AI_Output(self,other,"DIA_BaalOrun_TellAbout_01_08");	//...и помочь найти новый путь познания этого мира. И вскоре нам это удалось.
	AI_Output(self,other,"DIA_BaalOrun_TellAbout_01_09");	//Мы извлекли правильные уроки из наших познаний в этой области. Теперь мы пытаемся познать сущность происходящего иным путем.
	AI_Output(self,other,"DIA_BaalOrun_TellAbout_01_10");	//Суть нашего нового учения - это раскрытие потаенных возможностей своего сознания при помощи длительной медитации.
	AI_Output(self,other,"DIA_BaalOrun_TellAbout_01_11");	//Естественно, в этом нам помогает также и воскурение болотной травы.
	AI_Output(self,other,"DIA_BaalOrun_TellAbout_01_12");	//Болотник расслабляет тело и успокаивает сознание, помогает сосредоточиться на главном и способствует познанию истины.
	AI_Output(self,other,"DIA_BaalOrun_TellAbout_01_13");	//К сожалению, в этих местах его найти куда сложнее, чем на тех болотах, где раньше находилось наше Братство.
	AI_Output(self,other,"DIA_BaalOrun_TellAbout_01_14");	//Но мы решили и эту проблему. Оказалось, он неплохо приживается и в этих условиях.
	AI_Output(self,other,"DIA_BaalOrun_TellAbout_01_15");	//Разумеется, прежде чем курить, его нужно обработать должным образом. Этим как раз занимаются наши новые послушники.
	AI_Output(self,other,"DIA_BaalOrun_TellAbout_01_16");	//Верховную гильдию представляем мы - Гуру. В нас живет дух этого лагеря. Мы более опытны в управлении своим подсознанием и обладаем великим знанием истины.
	AI_Output(self,other,"DIA_BaalOrun_TellAbout_01_17");	//Следом идут Стражи. Их сила находит применение в боях. Стражи славятся неукротимой силой духа. БОЙСЯ встать у них на пути!
	AI_Output(self,other,"DIA_BaalOrun_TellAbout_01_18");	//Их возглавляет Гор На Кош - лучший из Стражей нашего Братства.
	AI_Output(other,self,"DIA_BaalOrun_TellAbout_01_19");	//А что насчет Кор Ангара?
	AI_Output(self,other,"DIA_BaalOrun_TellAbout_01_20");	//К сожалению, мы не знаем, где он и что стало с ним. Когда началось то безумие во время падения Барьера, его не было в лагере.
	AI_Output(self,other,"DIA_BaalOrun_TellAbout_01_21");	//Возможно, он еще жив. Возможно - нет. Если вдруг встретишь его, то передай ему, что Братство еще живо и нуждается в его помощи.
	AI_Output(self,other,"DIA_BaalOrun_TellAbout_01_22");	//Остальные наши братья - послушники. Многие из них - те, кого ты, возможно, встречал в нашем лагере на болотах.
	AI_Output(self,other,"DIA_BaalOrun_TellAbout_01_23");	//Но есть и те, кто уже присоединился к нам здесь. Естественно, их не так много.
	AI_Output(self,other,"DIA_BaalOrun_TellAbout_01_24");	//Обычно их направляет сюда Идол Парвез - он постоянно находится в городе в поисках новых рекрутов.
	AI_Output(self,other,"DIA_BaalOrun_TellAbout_01_25");	//Это нелегкая работа - узреть среди толпы человека, способного к самопознанию и готовому разделить с нами нашу веру.
	AI_Output(self,other,"DIA_BaalOrun_TellAbout_01_26");	//Если встретишь его - поговори с ним.
	AI_Output(other,self,"DIA_BaalOrun_TellAbout_01_27");	//А если он не захочет разговаривать со мной?
	AI_Output(self,other,"DIA_BaalOrun_TellAbout_01_28");	//Конечно, он не станет говорить с тобой просто так - он же ничего не знает про тебя и про тот путь, который ты, возможно, изберешь.
	AI_Output(self,other,"DIA_BaalOrun_TellAbout_01_29");	//Просто передай ему от меня этот подарок - думаю, он сделает для тебя исключение.
	B_GiveInvItems(self,other,itmi_specialjoint,1);
	AI_Output(self,other,"DIA_BaalOrun_TellAbout_01_30");	//Вот, возьми. Я думаю, это все, что мог рассказать о нашем Братстве.
	AI_Output(other,self,"DIA_BaalOrun_TellAbout_01_31");	//Спасибо, господин.
	Log_CreateTopic(TOPIC_KORANGARMEET,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KORANGARMEET,LOG_Running);
	MIS_KORANGAR = LOG_Running;
	B_LogEntry(TOPIC_KORANGARMEET,"Идол Оран не знает, что случилось с бывшим лидером Стражей Кор Ангаром. И, если я вдруг его встречу, он попросил передать ему, что Братство живо и нуждается в нем.");
};


instance DIA_BAALORUN_TELLKORANGAR(C_Info)
{
	npc = gur_8002_orun;
	nr = 1;
	condition = dia_baalorun_tellkorangar_condition;
	information = dia_baalorun_tellkorangar_info;
	permanent = FALSE;
	description = "Я нашел Кор Ангара.";
};


func int dia_baalorun_tellkorangar_condition()
{
	if(MIS_KORANGAR == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_baalorun_tellkorangar_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_BaalOrun_TellKorAngar_01_00");	//Я нашел Кор Ангара.
	if((other.guild == GIL_GUR) || (other.guild == GIL_TPL) || (other.guild == GIL_SEK))
	{
		AI_Output(self,other,"DIA_BaalOrun_TellKorAngar_01_01");	//Что с ним?
		if(ANGARISDEAD == TRUE)
		{
			AI_Output(other,self,"DIA_BaalOrun_TellKorAngar_01_02");	//Он мертв.
			AI_Output(self,other,"DIA_BaalOrun_TellKorAngar_01_03");	//(в ужасе) О нет! Этого не может быть!
			AI_Output(self,other,"DIA_BaalOrun_TellKorAngar_01_04");	//Это огромная потеря для Братства и для всех нас...
			AI_Output(self,other,"DIA_BaalOrun_TellKorAngar_01_05");	//Нам будет нелегко свыкнуться с этой мыслью.
		}
		else
		{
			AI_Output(other,self,"DIA_BaalOrun_TellKorAngar_01_06");	//Все в порядке - он жив. Я встретил его в Долине Рудников.
			AI_Output(other,self,"DIA_BaalOrun_TellKorAngar_01_07");	//Я рассказал ему о нашем Братстве, и, думаю, скоро он вновь присоединится к нам.
			AI_Output(self,other,"DIA_BaalOrun_TellKorAngar_01_08");	//Это отличная новость!
			AI_Output(self,other,"DIA_BaalOrun_TellKorAngar_01_09");	//Все братья возрадуются его возвращению!
			AI_Output(self,other,"DIA_BaalOrun_TellKorAngar_01_10");	//Вот, возьми это в качестве вознаграждения за свои труды.
			B_GiveInvItems(self,other,ItMi_Gold,200);
			ANGARCANBACK = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_BaalOrun_TellKorAngar_01_11");	//(вопросительный вздох)
		if(ANGARISDEAD == TRUE)
		{
			AI_Output(other,self,"DIA_BaalOrun_TellKorAngar_01_12");	//Он мертв!
			AI_Output(self,other,"DIA_BaalOrun_TellKorAngar_01_13");	//(печальный вздох)
		}
		else
		{
			AI_Output(other,self,"DIA_BaalOrun_TellKorAngar_01_14");	//И он жив. Я встретил его в Долине Рудников.
			AI_Output(other,self,"DIA_BaalOrun_TellKorAngar_01_15");	//Я рассказал ему о вашем Братстве, и, думаю, скоро он вновь присоединится к вам.
			AI_Output(self,other,"DIA_BaalOrun_TellKorAngar_01_16");	//(вздох с облегчением)
			ANGARCANBACK = TRUE;
		};
	};
};


instance DIA_BAALORUN_TELLPALADIN(C_Info)
{
	npc = gur_8002_orun;
	nr = 1;
	condition = dia_baalorun_tellpaladin_condition;
	information = dia_baalorun_tellpaladin_info;
	permanent = FALSE;
	description = "У меня есть одна проблема.";
};


func int dia_baalorun_tellpaladin_condition()
{
	if(((other.guild == GIL_NONE) || (other.guild == GIL_SEK)) && Npc_KnowsInfo(other,dia_baalorun_tellabout))
	{
		return TRUE;
	};
};

func void dia_baalorun_tellpaladin_info()
{
	AI_Output(other,self,"DIA_BaalOrun_TellPaladin_01_00");	//У меня есть одна проблема.
	AI_Output(self,other,"DIA_BaalOrun_TellPaladin_01_01");	//Какая проблема?
	AI_Output(other,self,"DIA_BaalOrun_TellPaladin_01_02");	//Мне нужно срочно поговорить с главой паладинов в городе. Но стражники вряд ли пропустят меня к лорду Хагену.
	AI_Output(other,self,"DIA_BaalOrun_TellPaladin_01_03");	//Ты сможешь мне помочь в этом?
	AI_Output(self,other,"DIA_BaalOrun_TellPaladin_01_04");	//А зачем тебе это нужно?
	AI_Output(other,self,"DIA_BaalOrun_TellPaladin_01_05");	//У меня есть одно очень важное сообщение для него.
	AI_Output(self,other,"DIA_BaalOrun_TellPaladin_01_06");	//Хмм... Ну, если для тебя это так важно...
	AI_Output(self,other,"DIA_BaalOrun_TellPaladin_01_07");	//Как ты уже понял, Братство обладает некоторым влиянием и связями в высших кругах городской знати.
	AI_Output(self,other,"DIA_BaalOrun_TellPaladin_01_08");	//И, думаю, мы решим эту проблему, если ты станешь одним из нас - Гуру или Стражем Братства.
};


instance DIA_BAALORUN_CANJOINPSI(C_Info)
{
	npc = gur_8002_orun;
	nr = 1;
	condition = dia_baalorun_canjoinpsi_condition;
	information = dia_baalorun_canjoinpsi_info;
	permanent = TRUE;
	description = "Я хочу присоединиться к Братству.";
};


func int dia_baalorun_canjoinpsi_condition()
{
	if((hero.guild == GIL_NONE) && (CANJOINPSI == TRUE) && (MIS_PSICAMPJOIN != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_baalorun_canjoinpsi_info()
{
	AI_Output(other,self,"DIA_BaalOrun_CanJoinPsi_01_01");	//Я хочу присоединиться к Братству.
	AI_Output(self,other,"DIA_BaalOrun_CanJoinPsi_01_02");	//Это твое окончательное решение? Ты точно готов принять нашу веру?
	Info_ClearChoices(dia_baalorun_canjoinpsi);
	Info_AddChoice(dia_baalorun_canjoinpsi,"Я передумал.",dia_baalorun_canjoinpsi_no);
	Info_AddChoice(dia_baalorun_canjoinpsi,"Да, я готов.",dia_baalorun_canjoinpsi_yes);
};

func void dia_baalorun_canjoinpsi_yes()
{
	AI_Output(other,self,"DIA_BaalOrun_CanJoinPsi_Yes_01_00");	//Да, я готов.
	AI_Output(self,other,"DIA_BaalOrun_CanJoinPsi_Yes_01_01");	//Хорошо. Я знал, что ты сделаешь правильный выбор, и ты его сделал.
	AI_Output(self,other,"DIA_BaalOrun_CanJoinPsi_Yes_01_02");	//Добро пожаловать в наше Братство!
	other.guild = GIL_SEK;
	Snd_Play("LEVELUP");
	CheckHeroGuild[0] = TRUE;

	if(CanTeachTownMaster == FALSE)
	{
		MIS_PathFromDown = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_PathFromDown,LOG_SUCCESS);
		CanTeachTownMaster = TRUE;
	};

	AI_Output(self,other,"DIA_BaalOrun_CanJoinPsi_Yes_01_04");	//Теперь ты один из нас, брат.
	AI_Output(self,other,"DIA_BaalOrun_CanJoinPsi_Yes_01_05");	//Как послушник Братства, ты должен будешь выполнять некоторые обязанности в лагере.
	AI_Output(self,other,"DIA_BaalOrun_CanJoinPsi_Yes_01_07");	//Ты также можешь приходить и ко мне, если вдруг понадобится моя помощь.
	AI_Output(self,other,"DIA_BaalOrun_CanJoinPsi_Yes_01_08");	//А теперь ступай и постарайся приносить пользу во имя нашей общей веры!
	SLD_Aufnahme = LOG_OBSOLETE;
	KDF_Aufnahme = LOG_OBSOLETE;
	MIL_Aufnahme = LOG_OBSOLETE;
	MIS_BECOMEKDW = LOG_OBSOLETE;
	MIS_BECOMEKDM = LOG_OBSOLETE;
	MIS_PSICAMPJOIN = LOG_SUCCESS;
	PSI_TALK = TRUE;

	Log_SetTopicStatus(TOPIC_BecomeMIL,LOG_OBSOLETE);
	Log_SetTopicStatus(TOPIC_BecomeSLD,LOG_OBSOLETE);
	Log_SetTopicStatus(TOPIC_BecomeKdF,LOG_OBSOLETE);
	Log_SetTopicStatus(TOPIC_BECOMEKDW,LOG_OBSOLETE);
	Log_SetTopicStatus(TOPIC_BECOMEKDM,LOG_OBSOLETE);

	if(MIS_SLDRESPEKT == LOG_Running)
	{
		MIS_SLDRESPEKT = LOG_OBSOLETE;
		Log_SetTopicStatus(TOPIC_SLDRespekt,LOG_OBSOLETE);
	};

	B_LogEntry(TOPIC_PSICAMPJOIN,"Я вступил в Братство.");
	B_GivePlayerXP(500);
	Info_ClearChoices(dia_baalorun_canjoinpsi);
};

func void dia_baalorun_canjoinpsi_no()
{
	AI_Output(other,self,"DIA_BaalOrun_CanJoinPsi_No_01_00");	//Я передумал.
	AI_Output(self,other,"DIA_BaalOrun_CanJoinPsi_No_01_01");	//Я тебя не тороплю с ответом. Можешь думать об этом столько времени, сколько тебе нужно.
	Info_ClearChoices(dia_baalorun_canjoinpsi);
};


instance DIA_BAALORUN_MAGICSYMBOLS(C_Info)
{
	npc = gur_8002_orun;
	nr = 1;
	condition = dia_baalorun_magicsymbols_condition;
	information = dia_baalorun_magicsymbols_info;
	permanent = FALSE;
	description = "Что это за рисунки у всех членов Братства на теле?";
};


func int dia_baalorun_magicsymbols_condition()
{
	if(other.guild == GIL_SEK)
	{
		return TRUE;
	};
};

func void dia_baalorun_magicsymbols_info()
{
	AI_Output(other,self,"DIA_BaalOrun_MagicSymbols_01_00");	//Что это за рисунки у всех членов Братства на теле?
	AI_Output(self,other,"DIA_BaalOrun_MagicSymbols_01_01");	//Это не рисунки, а магические символы, которые способны защитить их обладателя от магии.
	AI_Output(self,other,"DIA_BaalOrun_MagicSymbols_01_03");	//И поскольку ты теперь один из нас, то сможешь носить их, так же, как и остальные наши братья.
	AI_Output(self,other,"DIA_BaalOrun_MagicSymbols_01_04");	//Обратись к послушнику Вирану. Он поможет тебе с этим.
	CANMAKESYMBOLS = TRUE;
};


instance DIA_BAALORUN_TELLPALADINOK(C_Info)
{
	npc = gur_8002_orun;
	nr = 1;
	condition = dia_baalorun_tellpaladinok_condition;
	information = dia_baalorun_tellpaladinok_info;
	permanent = FALSE;
	description = "Помоги мне попасть к лорду Хагену.";
};


func int dia_baalorun_tellpaladinok_condition()
{
	if(((other.guild == GIL_GUR) || (other.guild == GIL_TPL)) && (Kapitel < 2))
	{
		return TRUE;
	};
};

func void dia_baalorun_tellpaladinok_info()
{
	if(Npc_KnowsInfo(other,dia_baalorun_tellpaladin))
	{
		AI_Output(other,self,"DIA_BaalOrun_TellPaladinOk_01_00");	//Помоги мне попасть к лорду Хагену.
		AI_Output(self,other,"DIA_BaalOrun_TellPaladinOk_01_01");	//Ну, поскольку ты теперь один из братьев, мы попробуем решить твою проблему.
		AI_Output(self,other,"DIA_BaalOrun_TellPaladinOk_01_02");	//Ты уже встречался с городской главой Хориниса. Думаю, он тебя тоже запомнил.
		AI_Output(self,other,"DIA_BaalOrun_TellPaladinOk_01_03");	//Я договорюсь с ним о том, что якобы у тебя с ним назначена встреча в ратуше.
		AI_Output(other,self,"DIA_BaalOrun_TellPaladinOk_01_04");	//Ты думаешь, стражники пустят меня?
		AI_Output(self,other,"DIA_BaalOrun_TellPaladinOk_01_05");	//Думаю, да. Ставить под сомнение слова такого уважаемого и высокопоставленного человека, как Лариус, - просто глупо.
		AI_Output(self,other,"DIA_BaalOrun_TellPaladinOk_01_06");	//А для полной уверенности я сообщу Лариусу некий, так скажем, пароль...
		AI_Output(self,other,"DIA_BaalOrun_TellPaladinOk_01_07");	//...который откроет тебе доступ в саму ратушу. Так стражи поймут, что ты именно тот человек, которого ждет мэр.
		AI_Output(self,other,"DIA_BaalOrun_TellPaladinOk_01_08");	//Думаю, слово 'ЮБЕРИОН' вполне подойдет для этого. Запомни его!
		AI_Output(other,self,"DIA_BaalOrun_TellPaladinOk_01_09");	//Я помню мастера Юбериона - имя такого человека трудно забыть.
		AI_Output(self,other,"DIA_BaalOrun_TellPaladinOk_01_10");	//Хорошо. А теперь ступай - у меня еще много других дел.
	}
	else
	{
		AI_Output(other,self,"DIA_BaalOrun_TellPaladinOk_01_11");	//Помоги мне попасть к лорду Хагену.
		AI_Output(self,other,"DIA_BaalOrun_TellPaladinOk_01_12");	//(удивленно) А зачем тебе это нужно?
		AI_Output(other,self,"DIA_BaalOrun_TellPaladinOk_01_13");	//У меня есть для него одно очень важное сообщение, но стражники вряд ли пропустят меня к нему.
		AI_Output(other,self,"DIA_BaalOrun_TellPaladinOk_01_14");	//Ты сможешь мне помочь в этом?
		AI_Output(self,other,"DIA_BaalOrun_TellPaladinOk_01_15");	//Ну, если для тебя это так важно...
		AI_Output(self,other,"DIA_BaalOrun_TellPaladinOk_01_16");	//Как ты уже понял, Братство обладает некоторым влиянием и связями в высших кругах городской знати.
		AI_Output(self,other,"DIA_BaalOrun_TellPaladinOk_01_17");	//Думаю, мы найдем способ помочь тебе в решении этого вопроса.
		AI_Output(self,other,"DIA_BaalOrun_TellPaladinOk_01_18");	//Ты уже встречался с городской главой Хориниса. Думаю, он тебя тоже запомнил.
		AI_Output(self,other,"DIA_BaalOrun_TellPaladinOk_01_19");	//Я договорюсь с ним о том, что якобы у тебя с ним назначена встреча в ратуше.
		AI_Output(other,self,"DIA_BaalOrun_TellPaladinOk_01_20");	//Ты думаешь, стражники пустят меня?
		AI_Output(self,other,"DIA_BaalOrun_TellPaladinOk_01_21");	//Думаю, да. Ставить под сомнение слова такого уважаемого и высокопоставленного человека, как Лариус, - просто глупо.
		AI_Output(self,other,"DIA_BaalOrun_TellPaladinOk_01_22");	//А для полной уверенности я сообщу Лариусу некий, так скажем, пароль...
		AI_Output(self,other,"DIA_BaalOrun_TellPaladinOk_01_23");	//...который откроет тебе доступ в саму ратушу. Так стражи поймут, что ты именно тот человек, которого ждет мэр.
		AI_Output(self,other,"DIA_BaalOrun_TellPaladinOk_01_24");	//Думаю, слово 'ЮБЕРИОН' вполне подойдет для этого. Запомни его!
		AI_Output(other,self,"DIA_BaalOrun_TellPaladinOk_01_25");	//Я помню мастера Юбериона - имя такого человека трудно забыть.
		AI_Output(self,other,"DIA_BaalOrun_TellPaladinOk_01_26");	//Хорошо. А теперь ступай - у меня еще много других дел.
	};
	LARIUSAWAITS = TRUE;
};


instance DIA_BAALORUN_PALADINWATCH(C_Info)
{
	npc = gur_8002_orun;
	nr = 1;
	condition = dia_baalorun_paladinwatch_condition;
	information = dia_baalorun_paladinwatch_info;
	permanent = FALSE;
	description = "У тебя есть для меня задания?";
};


func int dia_baalorun_paladinwatch_condition()
{
	if((hero.guild == GIL_GUR) || (hero.guild == GIL_TPL))
	{
		return TRUE;
	};
};

func void dia_baalorun_paladinwatch_info()
{
	AI_Output(other,self,"DIA_BaalOrun_PaladinWatch_01_0A");	//У тебя есть поручения для меня?
	AI_Output(self,other,"DIA_BaalOrun_PaladinWatch_01_00");	//Хорошо, что ты спросил.
	AI_Output(self,other,"DIA_BaalOrun_PaladinWatch_01_01");	//У меня есть для тебя одно чрезвычайно важное поручение.
	AI_Output(other,self,"DIA_BaalOrun_PaladinWatch_01_02");	//Что я должен сделать?
	AI_Output(self,other,"DIA_BaalOrun_PaladinWatch_01_04");	//Ты уже знаешь, что недавно в Хоринис прибыл большой отряд паладинов.
	AI_Output(self,other,"DIA_BaalOrun_PaladinWatch_01_05");	//Их возглавляет лорд Хаген - один из самых высокопоставленных генералов их ордена.
	AI_Output(self,other,"DIA_BaalOrun_PaladinWatch_01_06");	//Как ты сам можешь догадываться, появление здесь такой многозначительной фигуры, как лорд Хаген, - достаточно необычная вещь.
	AI_Output(self,other,"DIA_BaalOrun_PaladinWatch_01_07");	//Как утверждают сами паладины, причина их появления на острове объясняется возможной угрозой атаки Хориниса со стороны орков.
	AI_Output(self,other,"DIA_BaalOrun_PaladinWatch_01_08");	//Однако совершено ясно, что тех сил, которыми здесь располагает лорд Хаген, не хватит на то, чтобы обеспечить должную защиту города в случае нападения.
	AI_Output(self,other,"DIA_BaalOrun_PaladinWatch_01_09");	//Кроме того, по слухам, рудниковую колонию наводнили орки. И я не думаю, что тот маленький отряд сможет выбить их оттуда. Скорее всего произойдет обратное.
	AI_Output(self,other,"DIA_BaalOrun_PaladinWatch_01_10");	//Лорд Хаген должен был это понимать, а если так...
	AI_Output(self,other,"DIA_BaalOrun_PaladinWatch_01_11");	//...тогда паладины преследуют на острове совершенно иные цели, нежели те, о которых сами всем говорят.
	AI_Output(self,other,"DIA_BaalOrun_PaladinWatch_01_12");	//В связи с этой непонятной ситуацией, наше Братство не может оставаться в стороне от происходящих здесь событий.
	AI_Output(self,other,"DIA_BaalOrun_PaladinWatch_01_13");	//В конце концов, если вторжение орков в Хоринис действительно не миф, а реальность...
	AI_Output(self,other,"DIA_BaalOrun_PaladinWatch_01_14");	//...то от развития дальнейших событий зависит и наша судьба.
	AI_Output(self,other,"DIA_BaalOrun_PaladinWatch_01_15");	//Поэтому Братству было бы чрезвычайно полезно и необходимо знать точную причину появления паладинов на острове и располагать информацией о возможном вторжении орков в эту часть острова.
	AI_Output(other,self,"DIA_BaalOrun_PaladinWatch_01_16");	//И ты хочешь, чтобы я узнал обо всем об этом побольше?
	AI_Output(self,other,"DIA_BaalOrun_PaladinWatch_01_17");	//Да, именно это я и хочу поручить тебе.
	AI_Output(self,other,"DIA_BaalOrun_PaladinWatch_01_18");	//Мне нужны ответы...
	AI_Output(self,other,"DIA_BaalOrun_PaladinWatch_01_19");	//...ответы на вопросы, от которых зависит наша дальнейшая судьба.
	AI_Output(self,other,"DIA_BaalOrun_PaladinWatch_01_20");	//Я понимаю, что установить истинные причины всего происходящего будет совсем не легкой задачей. Но у нас нет другого выбора.
	AI_Output(self,other,"DIA_BaalOrun_PaladinWatch_01_21");	//Сам понимаешь, кто предупрежден - тот вооружен.
	AI_Output(self,other,"DIA_BaalOrun_PaladinWatch_01_22");	//Итак, меня интересуют три вопроса...
	AI_Output(self,other,"DIA_BaalOrun_PaladinWatch_01_23");	//Первое - зачем паладины прибыли в Хоринис.
	AI_Output(self,other,"DIA_BaalOrun_PaladinWatch_01_34");	//Второе - какова ситуация в Долине Рудников и что слышно он вторжении орков.
	AI_Output(self,other,"DIA_BaalOrun_PaladinWatch_01_25");	//И последнее - что постараются предпринять паладины в случае атаки на Хоринис.
	AI_Output(self,other,"DIA_BaalOrun_PaladinWatch_01_26");	//Я очень рассчитываю на тебя и на твой успех в этом деле.
	AI_Output(self,other,"DIA_BaalOrun_PaladinWatch_01_27");	//На твоем бы месте я попробовал добиться ответов на эти вопросы от самого лорда Хагена.
	AI_Output(self,other,"DIA_BaalOrun_PaladinWatch_01_28");	//Конечно, возможно, он даже и не станет разговаривать с тобой, но все-таки попробовать стоит.
	AI_Output(other,self,"DIA_BaalOrun_PaladinWatch_01_29");	//Хорошо. Я постараюсь узнать все, что смогу.
	AI_Output(self,other,"DIA_BaalOrun_PaladinWatch_01_30");	//Как только тебе станет что-нибудь известно, немедленно сообщи мне.
	Log_CreateTopic(TOPIC_PALADINWATCH,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PALADINWATCH,LOG_Running);
	MIS_PALADINWATCH = LOG_Running;
	B_LogEntry(TOPIC_PALADINWATCH,"Идол Оран хочет знать, почему паладины прибыли в Хоринис. Его настораживает то, что они скрывают истинные причины своего появления здесь. Также Идол Оран интересуется ситуацией в Долине Рудников, где, по слухам, расположилась армия орков.");
};


instance DIA_BAALORUN_SPYBERICHT(C_Info)
{
	npc = gur_8002_orun;
	nr = 1;
	condition = dia_baalorun_spybericht_condition;
	information = dia_baalorun_spybericht_info;
	permanent = TRUE;
	description = "Я подумал, мне стоит доложить о прибытии...";
};


func int dia_baalorun_spybericht_condition()
{
	if(MIS_PALADINWATCH == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_baalorun_spybericht_info()
{
	var int countnews;
	countnews = 0;
	AI_Output(other,self,"DIA_BaalOrun_SpyBericht_01_00");	//Я подумал, мне стоит доложить о прибытии...
	AI_Output(self,other,"DIA_BaalOrun_SpyBericht_01_01");	//Хорошо! Я хочу быть в курсе всего происходящего.
	AI_Output(self,other,"DIA_BaalOrun_SpyBericht_01_02");	//Что ты узнал?
	if((IDOLORANQUESTIONFULLCOMPLETE == TRUE) && (TELLORANQUESTIONONE == FALSE) && (TELLORANQUESTIONTWO == FALSE) && (TELLORANQUESTIONTHREE == FALSE) && (TELLORANQUESTIONFOUR == FALSE) && (TELLORANQUESTIONFIVE == FALSE))
	{
		B_GivePlayerXP(1000);
		AI_Output(other,self,"DIA_BaalOrun_SpyBericht_01_03");	//Мне кое-что удалось узнать о причине появления паладинов в Хоринисе.
		AI_Output(other,self,"DIA_BaalOrun_SpyBericht_01_04");	//Судя по всему, приказ об их прибытии на остров поступил от самого короля Робара...
		AI_Output(other,self,"DIA_BaalOrun_SpyBericht_01_05");	//...и, по словам самого лорда Хагена, их миссия очень важна для судьбы всего королевства.
		AI_Output(self,other,"DIA_BaalOrun_SpyBericht_01_06");	//Продолжай...
		AI_Output(other,self,"DIA_BaalOrun_SpyBericht_01_07");	//Основная причина, по которой паладины прибыли на этот остров, - это магическая руда.
		AI_Output(other,self,"DIA_BaalOrun_SpyBericht_01_08");	//Без достаточного количества оружия из магической руды армия короля не будет иметь ни единого шанса в войне против орков.
		AI_Output(other,self,"DIA_BaalOrun_SpyBericht_01_09");	//Отряд, который лорд Хаген отправил в Долину Рудников, должен был выяснить ситуацию с возможностью добычи руды на острове.
		AI_Output(other,self,"DIA_BaalOrun_SpyBericht_01_10");	//А после этого паладины планировали вернуться обратно на материк.
		AI_Output(other,self,"DIA_BaalOrun_SpyBericht_01_11");	//Тот отряд, что отправился для разъяснения ситуации с рудой, обосновался в старом замке баронов.
		AI_Output(other,self,"DIA_BaalOrun_SpyBericht_01_12");	//И, похоже, их дела обстоят очень плохо.
		AI_Output(other,self,"DIA_BaalOrun_SpyBericht_01_15");	//Ко всему прочему, орки взяли замок в кольцо, окружив паладинов со всех сторон.
		AI_Output(other,self,"DIA_BaalOrun_SpyBericht_01_16");	//А недавно замок был атакован драконами.
		AI_Output(self,other,"DIA_BaalOrun_SpyBericht_01_17");	//Драконами?
		AI_Output(other,self,"DIA_BaalOrun_SpyBericht_01_18");	//Да. Гаронд послал меня с донесением к лорду Хагену, чтобы рассказать обо всем там происходящем.
		AI_Output(self,other,"DIA_BaalOrun_SpyBericht_01_19");	//Ты передал его лорду Хагену?
		AI_Output(other,self,"DIA_BaalOrun_SpyBericht_01_20");	//Да, я доставил письмо. Он был сильно огорчен всем этим.
		AI_Output(other,self,"DIA_BaalOrun_SpyBericht_01_21");	//Теперь у него одна головная боль - как вывести своих людей из окружения.
		AI_Output(other,self,"DIA_BaalOrun_SpyBericht_01_22");	//Пока он этого не сделает, паладины не покинут остров.
		AI_Output(other,self,"DIA_BaalOrun_SpyBericht_01_23");	//Так что, в случае нападения орков, - а, судя по всему, этого осталось ждать недолго...
		AI_Output(other,self,"DIA_BaalOrun_SpyBericht_01_24");	//...паладины останутся на острове и будут защищать Хоринис.
		AI_Output(self,other,"DIA_BaalOrun_SpyBericht_01_25");	//Хорошо! Думаю, того, что ты узнал, вполне достаточно, чтобы прояснить сложившуюся ситуацию.
		AI_Output(self,other,"DIA_BaalOrun_SpyBericht_01_26");	//(задумчиво) Все те новости, что ты принес, вырисовывают достаточно темную картину. Рано или поздно сюда заявятся орки, и тогда...
		AI_Output(self,other,"DIA_BaalOrun_SpyBericht_01_27");	//Радует одно, что паладины не оставят Хоринис на растерзание оркам, хотя и волей случая.
		AI_Output(self,other,"DIA_BaalOrun_SpyBericht_01_28");	//Я должен поблагодарить тебя. Ты оказал Братству неоценимую услугу!
		AI_Output(self,other,"DIA_BaalOrun_SpyBericht_01_30");	//Вот, возьми это в качестве награды за свои труды.
		B_GiveInvItems(self,other,ItPo_Perm_Mana,1);
		Log_SetTopicStatus(TOPIC_PALADINWATCH,LOG_SUCCESS);
		MIS_PALADINWATCH = LOG_SUCCESS;
		IDOLORANTEST = TRUE;
	}
	else
	{
		if((IDOLORANQUESTIONONE == TRUE) && (TELLORANQUESTIONONE == FALSE))
		{
			AI_Output(other,self,"DIA_BaalOrun_SpyBericht_01_36");	//Мне кое-что удалось узнать о причине появления паладинов в Хоринисе.
			AI_Output(other,self,"DIA_BaalOrun_SpyBericht_01_37");	//Судя по всему, приказ об их прибытии на остров поступил от самого короля Робара...
			AI_Output(other,self,"DIA_BaalOrun_SpyBericht_01_38");	//...и, по словам самого лорда Хагена, их миссия очень важна для судьбы всего королевства.
			AI_Output(self,other,"DIA_BaalOrun_SpyBericht_01_39");	//Что-нибудь еще?
			TELLORANQUESTIONONE = TRUE;
			countnews = countnews + 1;
		};
		if((IDOLORANQUESTIONTWO == TRUE) && (TELLORANQUESTIONTWO == FALSE))
		{
			AI_Output(other,self,"DIA_BaalOrun_SpyBericht_01_40");	//Основная причина, по которой паладины прибыли на этот остров, - это магическая руда.
			AI_Output(other,self,"DIA_BaalOrun_SpyBericht_01_41");	//Без достаточного количества оружия из магической руды армия короля не будет иметь ни единого шанса в войне против орков.
			AI_Output(other,self,"DIA_BaalOrun_SpyBericht_01_42");	//Отряд, который лорд Хаген отправил в Долину Рудников, должен был выяснить ситуацию с возможностью добычи руды на острове.
			AI_Output(other,self,"DIA_BaalOrun_SpyBericht_01_43");	//А после этого паладины планировали вернуться обратно на материк.
			AI_Output(self,other,"DIA_BaalOrun_SpyBericht_01_44");	//(встревоженно) Еще есть новости?
			TELLORANQUESTIONTWO = TRUE;
			countnews = countnews + 1;
		};
		if((IDOLORANQUESTIONTHREE == TRUE) && (TELLORANQUESTIONTHREE == FALSE))
		{
			AI_Output(other,self,"DIA_BaalOrun_SpyBericht_01_45");	//Тот отряд, что отправился для разъяснения ситуации с рудой, обосновался в старом замке баронов.
			AI_Output(other,self,"DIA_BaalOrun_SpyBericht_01_46");	//И, похоже, их дела обстоят очень плохо.
			AI_Output(other,self,"DIA_BaalOrun_SpyBericht_01_48");	//Ко всему прочему, орки взяли замок в кольцо, окружив паладинов со всех сторон.
			AI_Output(other,self,"DIA_BaalOrun_SpyBericht_01_49");	//А недавно замок был атакован драконами.
			AI_Output(self,other,"DIA_BaalOrun_SpyBericht_01_50");	//Драконами?
			AI_Output(self,other,"DIA_BaalOrun_SpyBericht_01_52");	//Что еще?
			TELLORANQUESTIONTHREE = TRUE;
			countnews = countnews + 1;
		};
		if((IDOLORANQUESTIONFOUR == TRUE) && (TELLORANQUESTIONFOUR == FALSE))
		{
			AI_Output(other,self,"DIA_BaalOrun_SpyBericht_01_53");	//В общем, экспедиция в Долину Рудников потерпела полный провал.
			AI_Output(other,self,"DIA_BaalOrun_SpyBericht_01_54");	//Те залежи руды, что еще доступны для добычи, - судя по всему, не смогут обеспечить потребности всей королевской армии.
			AI_Output(other,self,"DIA_BaalOrun_SpyBericht_01_55");	//А паладины понесли ужасающие потери в ходе этой экспедиции.
			AI_Output(other,self,"DIA_BaalOrun_SpyBericht_01_56");	//Гаронд послал меня с донесением к лорду Хагену, чтобы рассказать обо всем там происходящем.
			AI_Output(self,other,"DIA_BaalOrun_SpyBericht_01_57");	//Это дело не терпит промедления! Немедленно отправляйся к нему.
			TELLORANQUESTIONFOUR = TRUE;
			countnews = countnews + 1;
		};
		if((IDOLORANQUESTIONFIVE == TRUE) && (TELLORANQUESTIONFIVE == FALSE))
		{
			AI_Output(other,self,"DIA_BaalOrun_SpyBericht_01_58");	//Я доставил письмо лорду Хагену. Он был сильно огорчен всем случившимся!
			AI_Output(other,self,"DIA_BaalOrun_SpyBericht_01_59");	//Теперь у него одна головная боль - как вывести своих людей из окружения.
			AI_Output(other,self,"DIA_BaalOrun_SpyBericht_01_60");	//Пока он этого не сделает, паладины не покинут остров.
			AI_Output(other,self,"DIA_BaalOrun_SpyBericht_01_61");	//Так что, в случае нападения орков, - а, судя по всему, этого осталось ждать недолго...
			AI_Output(other,self,"DIA_BaalOrun_SpyBericht_01_62");	//...паладины останутся на острове и будут защищать Хоринис.
			TELLORANQUESTIONFIVE = TRUE;
			countnews = countnews + 1;
		};
		if((IDOLORANQUESTIONFULLCOMPLETE == TRUE) && (TELLORANQUESTIONONE == TRUE) && (TELLORANQUESTIONTWO == TRUE) && (TELLORANQUESTIONTHREE == TRUE) && (TELLORANQUESTIONFOUR == TRUE) && (TELLORANQUESTIONFIVE == TRUE))
		{
			B_GivePlayerXP(1000);
			AI_Output(self,other,"DIA_BaalOrun_SpyBericht_01_63");	//Хорошо! Думаю, того, что ты узнал, вполне достаточно, чтобы прояснить сложившуюся ситуацию.
			AI_Output(self,other,"DIA_BaalOrun_SpyBericht_01_64");	//(задумчиво) Все те новости, что ты принес, вырисовывают достаточно темную картину. Рано или поздно сюда заявятся орки, и тогда...
			AI_Output(self,other,"DIA_BaalOrun_SpyBericht_01_67");	//Радует одно, что паладины не оставят Хоринис на растерзание оркам, хотя и волей случая.
			AI_Output(self,other,"DIA_BaalOrun_SpyBericht_01_68");	//Я должен поблагодарить тебя. Ты оказал Братству неоценимую услугу!
			AI_Output(self,other,"DIA_BaalOrun_SpyBericht_01_71");	//Вот, возьми это в качестве награды за свои труды.
			B_GiveInvItems(self,other,ItPo_Perm_Mana,1);
			Log_SetTopicStatus(TOPIC_PALADINWATCH,LOG_SUCCESS);
			MIS_PALADINWATCH = LOG_SUCCESS;
			IDOLORANTEST = TRUE;
		}
		else if(countnews >= 1)
		{
			countnews = countnews * 100;
			B_GivePlayerXP(countnews);
			AI_Output(other,self,"DIA_BaalOrun_SpyBericht_01_72");	//Пока это все, что мне удалось узнать.
			AI_Output(self,other,"DIA_BaalOrun_SpyBericht_01_73");	//Хорошо.
			AI_Output(self,other,"DIA_BaalOrun_SpyBericht_01_74");	//Держи меня и далее в курсе дел.
		}
		else
		{
			AI_Output(other,self,"DIA_BaalOrun_SpyBericht_01_75");	//Пока ничего нового.
			AI_Output(self,other,"DIA_BaalOrun_SpyBericht_01_76");	//Тогда зачем ты меня отрываешь от дел?
		};
	};
};


instance DIA_BAALORUN_CANBEGURU(C_Info)
{
	npc = gur_8002_orun;
	nr = 99;
	condition = dia_baalorun_canbeguru_condition;
	information = dia_baalorun_canbeguru_info;
	permanent = FALSE;
	description = "А могу ли я стать Гуру, как ты?";
};

func int dia_baalorun_canbeguru_condition()
{
	if(hero.guild == GIL_SEK)
	{
		return TRUE;
	};
};

func void dia_baalorun_canbeguru_info()
{
	AI_Output(other,self,"DIA_BaalOrun_CanBeGuru_01_00");	//А могу ли я стать гуру, как ты?
	AI_Output(self,other,"DIA_BaalOrun_CanBeGuru_01_01");	//(удивленно) Ты хочешь связать свою линию жизни со священным путем гуру?
	AI_Output(self,other,"DIA_BaalOrun_CanBeGuru_01_02");	//Тебе рано еще об этом думать.
	AI_Output(self,other,"DIA_BaalOrun_CanBeGuru_01_03");	//Чтобы стать одним из нас, мало просто желать этого.
	AI_Output(self,other,"DIA_BaalOrun_CanBeGuru_01_04");	//Носить робу гуру - это величайшая честь, которой могут быть удостоены только избранные братья!
	AI_Output(self,other,"DIA_BaalOrun_CanBeGuru_01_05");	//А ты не входишь в их число.
	AI_Output(other,self,"DIA_BaalOrun_CanBeGuru_01_06");	//А что для этого надо сделать?
	AI_Output(self,other,"DIA_BaalOrun_CanBeGuru_01_07");	//Если ты действительно решил следовать этому пути до конца, то, прежде всего, тебе следует знать несколько вещей.
	AI_Output(self,other,"DIA_BaalOrun_CanBeGuru_01_08");	//Во-первых, ты должен быть тверд в своей вере.
	AI_Output(self,other,"DIA_BaalOrun_CanBeGuru_01_09");	//Тот, кто сомневается в своих убеждениях, - тот слаб духом, а это никак не допустимо в нашем случае.
	AI_Output(self,other,"DIA_BaalOrun_CanBeGuru_01_10");	//Священный Круг Гуру является источником веры для всего нашего Братства.
	AI_Output(self,other,"DIA_BaalOrun_CanBeGuru_01_11");	//Идолы, своей мудростью, несут божественное просвещение в ума наших братьев, и последние никогда не должны сомневаться в их правоте и могуществе!
	AI_Output(self,other,"DIA_BaalOrun_CanBeGuru_01_12");	//Кроме этого, стать Гуру означает быть готовым к самопожертвованию ради Братства.
	AI_Output(self,other,"DIA_BaalOrun_CanBeGuru_01_13");	//Есть и еще несколько моментов, обозначенных священным путем Гуру, но они не столь существенны по сравнению с теми, что я только что перечислил.
	AI_Output(self,other,"DIA_BaalOrun_CanBeGuru_01_14");	//Если ты докажешь ими твердость своих убеждений и силу своего духа, то только тогда ты сможешь вступить в наш священный Круг.
	AI_Output(self,other,"DIA_BaalOrun_CanBeGuru_01_15");	//К сожалению, сейчас ты еще не готов к этому, и твои деяния во славу Братства не столь значимы.
	AI_Output(self,other,"DIA_BaalOrun_CanBeGuru_01_16");	//Но я думаю, такое время может настать, и тогда, будь уверен, мы сможем поговорить об этом.
	AI_Output(other,self,"DIA_BaalOrun_CanBeGuru_01_17");	//Мне все ясно, господин.
	CANBEGURU = TRUE;
};


instance DIA_BAALORUN_FORTUNOBACK(C_Info)
{
	npc = gur_8002_orun;
	nr = 99;
	condition = dia_baalorun_fortunoback_condition;
	information = dia_baalorun_fortunoback_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_baalorun_fortunoback_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && ((hero.guild == GIL_GUR) || (hero.guild == GIL_TPL)) && (FORTUNOBACK == TRUE) && (FORTUNOAWFLAG == TRUE))
	{
		return TRUE;
	};
};

func void dia_baalorun_fortunoback_info()
{
	B_GivePlayerXP(100);
	AI_Output(self,other,"DIA_BaalOrun_FortunoBack_01_00");	//Я слышал, в лагерь вернулся один из наших бывших послушников.
	AI_Output(self,other,"DIA_BaalOrun_FortunoBack_01_01");	//Кажется, его зовут Фортуно.
	AI_Output(self,other,"DIA_BaalOrun_FortunoBack_01_02");	//Он рассказал, что ты сделал для него...
	AI_Output(self,other,"DIA_BaalOrun_FortunoBack_01_03");	//Это было очень правильно с твоей стороны, оказать ему помощь.
	AI_Output(self,other,"DIA_BaalOrun_FortunoBack_01_04");	//Теперь Братство позаботится о нем.
	AI_Output(self,other,"DIA_BaalOrun_FortunoBack_01_05");	//Его дух ослаб, а силы истощены, но мы исправим эту ситуацию. Наша вера поможет ему вновь обрести себя!
	AI_Output(self,other,"DIA_BaalOrun_FortunoBack_01_06");	//С моей же стороны я хочу просто поблагодарить тебя.
};


instance DIA_BAALORUN_HAMMERBACK(C_Info)
{
	npc = gur_8002_orun;
	nr = 99;
	condition = dia_baalorun_hammerback_condition;
	information = dia_baalorun_hammerback_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_baalorun_hammerback_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && ((hero.guild == GIL_GUR) || (hero.guild == GIL_TPL)) && (GORNAKOSHTEST == TRUE))
	{
		return TRUE;
	};
};

func void dia_baalorun_hammerback_info()
{
	B_GivePlayerXP(100);
	AI_Output(self,other,"DIA_BaalOrun_HammerBack_01_00");	//Гор На Кош рассказал мне о том, что ты принес ему Молот Таракота.
	AI_Output(self,other,"DIA_BaalOrun_HammerBack_01_01");	//Я очень удивлен, что тебе удалось это сделать!
	AI_Output(self,other,"DIA_BaalOrun_HammerBack_01_02");	//Братство давно хотело заполучить этот древний артефакт в свое распоряжение.
	AI_Output(self,other,"DIA_BaalOrun_HammerBack_01_03");	//И теперь благодаря тебе он - у нас!
	AI_Output(self,other,"DIA_BaalOrun_HammerBack_01_04");	//Твои поступки делают тебе честь.
	AI_Output(self,other,"DIA_BaalOrun_HammerBack_01_05");	//От имени всего нашего Братства прими мою благодарность!
};


instance DIA_BAALORUN_SEKTEHEILEN(C_Info)
{
	npc = gur_8002_orun;
	nr = 99;
	condition = dia_baalorun_sekteheilen_condition;
	information = dia_baalorun_sekteheilen_info;
	permanent = FALSE;
	description = "Что ты знаешь о людях в черных рясах?";
};


func int dia_baalorun_sekteheilen_condition()
{
	if(((hero.guild == GIL_GUR) || (hero.guild == GIL_TPL)) && (Kapitel >= 3))
	{
		return TRUE;
	};
};

func void dia_baalorun_sekteheilen_info()
{
	AI_Output(other,self,"DIA_BaalOrun_SekteHeilen_01_00");	//Что ты знаешь о людях в черных рясах?
	AI_Output(self,other,"DIA_BaalOrun_SekteHeilen_01_01");	//Не очень много. Судя по всему, все они - темные маги.
	AI_Output(self,other,"DIA_BaalOrun_SekteHeilen_01_02");	//Но их истинное происхождение мне неизвестно.
	AI_Output(self,other,"DIA_BaalOrun_SekteHeilen_01_03");	//Однако иногда мне кажется, что с некоторыми из них у Братства есть какая-то невидимая связь...(задумчиво)
	AI_Output(other,self,"DIA_BaalOrun_SekteHeilen_01_04");	//Что ты имеешь в виду?
	AI_Output(self,other,"DIA_BaalOrun_SekteHeilen_01_05");	//У многих наших братьев начались сильные головные боли.
	AI_Output(self,other,"DIA_BaalOrun_SekteHeilen_01_06");	//Я не могу объяснить, с чем это связано.
	AI_Output(self,other,"DIA_BaalOrun_SekteHeilen_01_07");	//Но, боюсь, что пагубное влияние этих созданий как-то отражается на их подсознании.
	AI_Output(self,other,"DIA_BaalOrun_SekteHeilen_01_08");	//И мне кажется, это все очень сильно смахивает на одержимость.
	AI_Output(self,other,"DIA_BaalOrun_SekteHeilen_01_09");	//Мы можем что-нибудь сделать с этим?
	AI_Output(self,other,"DIA_BaalOrun_SekteHeilen_01_10");	//Мудрость и могущество Идолов пока позволяет нам немного смягчать последствия этих контактов, но неизвестно - насколько долго нас хватит самих.
	AI_Output(self,other,"DIA_BaalOrun_SekteHeilen_01_11");	//Возможно, существует какой-то другой способ избавиться от этого влияния.
	AI_Output(self,other,"DIA_BaalOrun_SekteHeilen_01_12");	//Я слышал, что в монастыре магов Огня существует зелье, которое способно излечить от одержимости.
	AI_Output(other,self,"DIA_BaalOrun_SekteHeilen_01_13");	//Я попробую его достать.
	AI_Output(self,other,"DIA_BaalOrun_SekteHeilen_01_14");	//О, это было бы замечательно!
	AI_Output(self,other,"DIA_BaalOrun_SekteHeilen_01_15");	//Я бы и сам занялся этой проблемой, но все мое свободное время уходит на облегчение участи наших Братьев.
	AI_Output(self,other,"DIA_BaalOrun_SekteHeilen_01_16");	//Прошу тебя, поспеши со своими поисками.
	Log_CreateTopic(TOPIC_SEKTEHEILEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SEKTEHEILEN,LOG_Running);
	MIS_SEKTEHEILEN = LOG_Running;
	B_LogEntry(TOPIC_SEKTEHEILEN,"Идол Оран обеспокоен появлением в Хоринисе магов в черных плащах. Они как-то связаны с Братством. С появлением этих магов послушников начали мучить сильные головные боли. Идол боится, что это первые признаки одержимости. Он попросил меня отправиться в монастырь к магам Огня, где существует средство против этой заразы.");
	AI_StopProcessInfos(self);
};


instance DIA_BAALORUN_SEKTEHEILENGOT(C_Info)
{
	npc = gur_8002_orun;
	nr = 99;
	condition = dia_baalorun_sekteheilengot_condition;
	information = dia_baalorun_sekteheilengot_info;
	permanent = FALSE;
	description = "Я достал это зелье.";
};


func int dia_baalorun_sekteheilengot_condition()
{
	if((Npc_HasItems(other,ItPo_HealObsession_MIS) > 0) && (MIS_SEKTEHEILEN == LOG_Running) && (FIRSTGIVEHEALPOTIONS == TRUE))
	{
		return TRUE;
	};
};

func void dia_baalorun_sekteheilengot_info()
{
	AI_Output(other,self,"DIA_BaalOrun_SekteHeilenGot_01_00");	//Я достал это зелье.
	AI_Output(self,other,"DIA_BaalOrun_SekteHeilenGot_01_01");	//Очень хорошо! Теперь его необходимо раздать всем послушникам.
	AI_Output(self,other,"DIA_BaalOrun_SekteHeilenGot_01_02");	//Но только им! Гор На Кош и его Стражи очень сильны духом. Им не страшна эта зараза, так же, как и нам - Гуру.
	AI_Output(self,other,"DIA_BaalOrun_SekteHeilenGot_01_03");	//И проследи за тем, чтобы лекарства хватило всем.
	AI_Output(self,other,"DIA_BaalOrun_SekteHeilenGot_01_04");	//Когда выполнишь это, приходи ко мне.
	B_LogEntry(TOPIC_SEKTEHEILEN,"Я достал лекарство. Теперь его необходимо раздать всем послушникам.");
	SEKTEHEILENCOUNT = 0;
};


instance DIA_BAALORUN_SEKTEHEILENOK(C_Info)
{
	npc = gur_8002_orun;
	nr = 99;
	condition = dia_baalorun_sekteheilenok_condition;
	information = dia_baalorun_sekteheilenok_info;
	permanent = FALSE;
	description = "Я раздал лекарство, как ты и просил.";
};


func int dia_baalorun_sekteheilenok_condition()
{
	if((MIS_SEKTEHEILEN == LOG_Running) && (SEKTEHEILENCOUNT >= 15))
	{
		return TRUE;
	};
};

func void dia_baalorun_sekteheilenok_info()
{
	B_GivePlayerXP(2150);
	AI_Output(other,self,"DIA_BaalOrun_SekteHeilenOk_01_00");	//Я раздал лекарство, как ты и просил.
	AI_Output(self,other,"DIA_BaalOrun_SekteHeilenOk_01_02");	//Да, очень хорошо. Его действие действительно избавило всех наших братьев от этих ужасных головных болей!
	AI_Output(self,other,"DIA_BaalOrun_SekteHeilenOk_01_03");	//Ты хорошо потрудился! Прими мою благодарность.
	B_GiveInvItems(self,other,ItMi_Gold,2000);
	B_LogEntry(TOPIC_SEKTEHEILEN,"Я раздал лекарство всем послушникам. Теперь братья более не будут страдать от влияния темных магов!");
	Log_SetTopicStatus(TOPIC_SEKTEHEILEN,LOG_SUCCESS);
	MIS_SEKTEHEILEN = LOG_SUCCESS;
};


instance DIA_BAALORUN_BEGURU(C_Info)
{
	npc = gur_8002_orun;
	nr = 99;
	condition = dia_baalorun_beguru_condition;
	information = dia_baalorun_beguru_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_baalorun_beguru_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (hero.guild == GIL_SEK) && (CANBEGURU == TRUE) && (CADARAGREED == TRUE) && (NAMIBAGREED == TRUE) && (PARVEZAGREED == TRUE) && (TYONAGREED == TRUE))
	{
		return TRUE;
	};
};

func void dia_baalorun_beguru_info()
{
	AI_Output(self,other,"DIA_BaalOrun_BeGuru_01_00");	//Ты здесь? Очень хорошо - я должен поговорить с тобой...
	AI_Output(self,other,"DIA_BaalOrun_BeGuru_01_02");	//Своими действиями ты доказал свою преданность идеям нашего Братства, и даже более того.
	AI_Output(self,other,"DIA_BaalOrun_BeGuru_01_03");	//Твои деяния говорят сами за себя: ты тверд духом, верен своим убеждениям и рассудителен в поступках!
	AI_Output(self,other,"DIA_BaalOrun_BeGuru_01_04");	//Поэтому я считаю, что ты достоин чести носить робу Гуру и быть принятым в наш священный Круг!
	AI_Output(self,other,"DIA_BaalOrun_BeGuru_01_05");	//Однако последний выбор за тобой.
	AI_Output(self,other,"DIA_BaalOrun_BeGuru_01_06");	//Ты должен понимать, что, выбрав этот путь, ты уже никогда не сможешь просто так сойти с него.
	AI_Output(self,other,"DIA_BaalOrun_BeGuru_01_07");	//У меня также состоялся разговор с Гор На Кошем, наставником Стражей.
	AI_Output(self,other,"DIA_BaalOrun_BeGuru_01_08");	//Он также хочет видеть тебя в своих рядах!
	AI_Output(self,other,"DIA_BaalOrun_BeGuru_01_09");	//Не спорю, быть Стражем, несомненно, большая честь, но это не идет ни в какое сравнение с посвящением в гуру.
	AI_Output(self,other,"DIA_BaalOrun_BeGuru_01_10");	//Это наивысшая честь, которой может быть удостоен последователь нашей веры!
	AI_Output(self,other,"DIA_BaalOrun_BeGuru_01_11");	//К тому же только для Гуру открыты секреты магии, кои нам даровал Спящий...
	AI_Output(self,other,"DIA_BaalOrun_BeGuru_01_12");	//...и только мы способны использовать эти бесценные знания.
	AI_Output(self,other,"DIA_BaalOrun_BeGuru_01_13");	//Поэтому прежде, чем дать свой окончательный ответ, - подумай хорошенько над всем тем, что я тебе сказал.
	AI_Output(self,other,"DIA_BaalOrun_BeGuru_01_14");	//И дай мне знать о нем, если будешь готов принять посвящение в наш Круг.
	READYBEGURU = TRUE;
};


instance DIA_BAALORUN_BEGURUOK(C_Info)
{
	npc = gur_8002_orun;
	nr = 99;
	condition = dia_baalorun_beguruok_condition;
	information = dia_baalorun_beguruok_info;
	permanent = TRUE;
	description = "Я хочу стать Гуру Братства.";
};

func int dia_baalorun_beguruok_condition()
{
	if((hero.guild == GIL_SEK) && (READYBEGURU == TRUE))
	{
		return TRUE;
	};
};

func void dia_baalorun_beguruok_info()
{
	AI_Output(other,self,"DIA_BaalOrun_BeGuruOk_01_00");	//Я хочу стать Гуру Братства.

	if(CanTeachTownMaster == FALSE)
	{
		MIS_PathFromDown = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_PathFromDown,LOG_SUCCESS);
		CanTeachTownMaster = TRUE;
	};
	if(MIS_CanDoTempler == LOG_Running)
	{
		MIS_CanDoTempler = LOG_OBSOLETE;
	};

	Snd_Play("GUILD_INV");
	hero.guild = GIL_GUR;
	CheckHeroGuild[0] = TRUE;
	SYMBOLSMAKEGURUDONE = TRUE;
	HelmIsUpTemp = FALSE;
	hero.protection[PROT_MAGIC] += 10;
	REALPROTMAGIC += 10;
	AI_PrintClr("Защита от магии + 10",83,152,48);
	Mdl_ApplyOverlayMds(hero,"Humans_Mage.mds");
	AI_Print(NAME_GUR_MAGIC);
	AI_Output(self,other,"DIA_BaalOrun_BeGuruOk_01_01");	//Да будет так!
	AI_Output(self,other,"DIA_BaalOrun_BeGuruOk_01_02");	//Я принимаю тебя в наш священный Круг и наделяю тебя властью Гуру!
	AI_Output(self,other,"DIA_BaalOrun_BeGuruOk_01_03");	//Отныне ты один из нас.
	AI_Output(self,other,"DIA_BaalOrun_BeGuruOk_01_04");	//Возьми эту робу в качестве символа нашего Круга.
	CreateInvItems(self,itar_gur_l,1);
	B_GiveInvItems(self,other,itar_gur_l,1);
	AI_Output(self,other,"DIA_BaalOrun_BeGuruOk_01_05");	//Носи ее с гордостью. Лишь немногие удостаивались такой чести!
	AI_Output(self,other,"DIA_BaalOrun_BeGuruOk_01_06");	//Также прими от меня этот посох. Только нам, Гуру, дарована честь обладать им и распоряжаться его силой!
	CreateInvItems(self,ITMW_2H_G3_STAFFDRUID_01,1);
	B_GiveInvItems(self,other,ITMW_2H_G3_STAFFDRUID_01,1);
	AI_Output(self,other,"DIA_BaalOrun_BeGuruOk_01_07");	//И не забудь, что быть Гуру - это не просто быть посвященным в наш Круг...
	AI_Output(self,other,"DIA_BaalOrun_BeGuruOk_01_08");	//...Это знак! Знак твоей судьбы и твоего выбора.
	AI_Output(self,other,"DIA_BaalOrun_BeGuruOk_01_09");	//Будь верен до конца своим убеждениям, и постарайся быть мудрым и рассудительным в своих деяниях.
	AI_Output(self,other,"DIA_BaalOrun_BeGuruOk_01_10");	//Это все, что я хотел тебе сказать перед тем, как ты продолжишь свой путь.
	AI_StopProcessInfos(self);
};

instance DIA_BAALORUN_PRETEACH(C_Info)
{
	npc = gur_8002_orun;
	nr = 99;
	condition = dia_baalorun_preteach_condition;
	information = dia_baalorun_preteach_info;
	permanent = FALSE;
	description = "Могу ли я теперь познать секреты магии Спящего?";
};


func int dia_baalorun_preteach_condition()
{
	if(hero.guild == GIL_GUR)
	{
		return TRUE;
	};
};

func void dia_baalorun_preteach_info()
{
	AI_Output(other,self,"DIA_BaalOrun_PreTeach_01_00");	//Могу ли я теперь познать секреты магии Спящего?
	AI_Output(self,other,"DIA_BaalOrun_PreTeach_01_01");	//Да. Теперь ты готов к обладанию истинных знаний, которые доступны только Гуру нашего Братства.
	AI_Output(self,other,"DIA_BaalOrun_PreTeach_01_02");	//И, безусловно, тебе понадобится некоторая помощь в постижении последних.
	AI_Output(self,other,"DIA_BaalOrun_PreTeach_01_03");	//Я могу ввести тебя в магические круги, которые необходимы для использования магических рун.
	AI_Output(self,other,"DIA_BaalOrun_PreTeach_01_04");	//Идол Кадар поможет тебе увеличить твою магическую силу.
	AI_Output(self,other,"DIA_BaalOrun_PreTeach_01_05");	//Идол Намиб научит тебя создавать руны с магией Спящего.
	AI_Output(self,other,"DIA_BaalOrun_PreTeach_01_06");	//А Идол Тион продаст тебе магические свитки и необходимые ингредиенты для создания этих рун.
	AI_Output(self,other,"DIA_BaalOrun_PreTeach_01_07");	//Обретя все эти знания, в твоих руках будет сосредоточена огромная сила!
	AI_Output(self,other,"DIA_BaalOrun_PreTeach_01_08");	//Помни об этом и постарайся распоряжаться ею мудро.
	BAALTYON_CANTRADE = TRUE;
	BAALNAMIB_TEACHRUNES = TRUE;
	BAALCADAR_TEACHMANA = TRUE;
	BAALORUN_TEACHCIRCLE = TRUE;
	Log_CreateTopic(TOPIC_ADDON_GURTEACHER,LOG_NOTE);
	B_LogEntry(TOPIC_ADDON_GURTEACHER,"Идол Оран поможет мне освоить магические круги.");
	B_LogEntry(TOPIC_ADDON_GURTEACHER,"Идол Намиб научит меня создавать руны с магией Спящего.");
	B_LogEntry(TOPIC_ADDON_GURTEACHER,"Идол Кадар поможет мне увеличить магическую силу.");
	B_LogEntry(TOPIC_ADDON_GURTEACHER,"Идол Тион продает магические свитки и ингредиенты для создания рун.");
};


instance DIA_BAALORUN_EXPLAINCIRCLES(C_Info)
{
	npc = gur_8002_orun;
	condition = dia_baalorun_explaincircles_condition;
	information = dia_baalorun_explaincircles_info;
	permanent = FALSE;
	description = "Объясни мне, в чем смысл магических Кругов?";
};


func int dia_baalorun_explaincircles_condition()
{
	if((hero.guild == GIL_GUR) && Npc_KnowsInfo(other,dia_baalorun_preteach))
	{
		return TRUE;
	};
};

func void dia_baalorun_explaincircles_info()
{
	AI_Output(other,self,"DIA_BaalOrun_EXPLAINCIRCLES_Info_15_01");	//Объясни мне, в чем смысл магических Кругов?
	AI_Output(self,other,"DIA_BaalOrun_EXPLAINCIRCLES_Info_14_02");	//Круги символизируют твое понимание магии.
	AI_Output(self,other,"DIA_BaalOrun_EXPLAINCIRCLES_Info_14_03");	//Они обозначают уровень твоих знаний и навыков, способность обучаться новым заклинаниям.
	AI_Output(self,other,"DIA_BaalOrun_EXPLAINCIRCLES_Info_14_04");	//Ты должен пройти каждый Круг до конца, прежде чем сможешь вступить в следующий.
	AI_Output(self,other,"DIA_BaalOrun_EXPLAINCIRCLES_Info_14_05");	//Потребуются долгие часы обучения и намного больше опыта, чтобы достичь высших Кругов.
	AI_Output(self,other,"DIA_BaalOrun_EXPLAINCIRCLES_Info_14_06");	//Твои старания каждый раз будут вознаграждаться новыми могущественными заклинаниями. Но в любом случае магические Круги значат куда больше.
	AI_Output(self,other,"DIA_BaalOrun_EXPLAINCIRCLES_Info_14_08");	//Для того чтобы понять их силу, ты должен познать себя.
	EXPLAINCIRCLEMEAN = TRUE;
};


var int dia_baalorun_circle_noperm;

instance DIA_BAALORUN_CIRCLE(C_Info)
{
	npc = gur_8002_orun;
	nr = 99;
	condition = dia_baalorun_circle_condition;
	information = dia_baalorun_circle_info;
	permanent = TRUE;
	description = "Я хочу постигать суть магии.";
};

func int dia_baalorun_circle_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) <= 6) && (BAALORUN_TEACHCIRCLE == TRUE) && (DIA_BAALORUN_CIRCLE_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_baalorun_circle_info()
{
	AI_Output(other,self,"DIA_BaalOrun_CIRCLE_15_00");	//Я хочу постигать суть магии.
	Info_ClearChoices(DIA_BaalOrun_CIRCLE);
	Info_AddChoice(DIA_BaalOrun_CIRCLE,Dialog_Back,DIA_BaalOrun_CIRCLE_Back);

	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) < 1) && (Kapitel >= 1))
	{
		Info_AddChoice(DIA_BaalOrun_CIRCLE,"1 Круг магии (Очков обучения: 20)",DIA_BaalOrun_CIRCLE_1);
	}
	else if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 1) && (Kapitel >= 2))
	{
		Info_AddChoice(DIA_BaalOrun_CIRCLE,"2 Круг магии (Очков обучения: 30)",DIA_BaalOrun_CIRCLE_2);
	}
	else if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 2) && (Kapitel >= 3))
	{
		Info_AddChoice(DIA_BaalOrun_CIRCLE,"3 Круг магии (Очков обучения: 40)",DIA_BaalOrun_CIRCLE_3);
	}
	else if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 3) && (MIS_ReadyforChapter4 == TRUE))
	{
		Info_AddChoice(DIA_BaalOrun_CIRCLE,"4 Круг магии (Очков обучения: 60)",DIA_BaalOrun_CIRCLE_4);
	}
	else if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 4) && (Kapitel >= 5))
	{
		Info_AddChoice(DIA_BaalOrun_CIRCLE,"5 Круг магии (Очков обучения: 80)",DIA_BaalOrun_CIRCLE_5);
	}
	else if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 5) && (Kapitel >= 5) && (MIS_DarkOrden == LOG_Success) && (MIS_JarCurse == LOG_Success) && (MIS_URNAZULRAGE == LOG_SUCCESS))
	{
		Info_AddChoice(DIA_BaalOrun_CIRCLE,"6 Круг магии (Очков обучения: 100)",DIA_BaalOrun_CIRCLE_6);
	}
	else
	{
		AI_Output(self,other,"DIA_BaalOrun_CIRCLE_14_42");	//Еще не время. Возвращайся позже.
	};
};

func void DIA_BaalOrun_CIRCLE_Back()
{
	Info_ClearChoices(DIA_BaalOrun_CIRCLE);
};

func void DIA_BaalOrun_CIRCLE_1()
{
	if(B_TeachMagicCircle(self,other,1))
	{
		AI_Output(self,other,"DIA_BaalOrun_CIRCLE_14_0A");	//Готов ли ты вступить в следующий круг магии?
		AI_Output(other,self,"DIA_BaalOrun_CIRCLE_15_01");	//Да, мастер. Я готов.
		AI_Output(self,other,"DIA_BaalOrun_CIRCLE_14_01");	//Вступив в Первый Круг, ты научишься использовать магические руны.
		AI_Output(self,other,"DIA_BaalOrun_CIRCLE_14_02");	//Каждая руна содержит структуру особого магического заклинания.
		AI_Output(self,other,"DIA_BaalOrun_CIRCLE_14_03");	//Использовав свою собственную магическую силу, ты сможешь высвободить магию руны.
		AI_Output(self,other,"DIA_BaalOrun_CIRCLE_14_04");	//Но в отличие от свитков, которые, по сути, являются магическими формулами, магия рун поддерживает структуру заклинания всегда.
		AI_Output(self,other,"DIA_BaalOrun_CIRCLE_14_05");	//Каждая руна таит в себе магическую силу, которую ты можешь забрать в любой момент.
		AI_Output(self,other,"DIA_BaalOrun_CIRCLE_14_06");	//Так же, как и со свитком, в момент, когда ты используешь руну, расходуется твоя собственная магическая сила.
		AI_Output(self,other,"DIA_BaalOrun_CIRCLE_14_07");	//С каждым новым Кругом ты будешь узнавать о рунах все больше и больше.
		AI_Output(self,other,"DIA_BaalOrun_CIRCLE_14_08");	//Используй их силу, для того чтобы познать себя.
	};
	Info_ClearChoices(DIA_BaalOrun_CIRCLE);
};

func void DIA_BaalOrun_CIRCLE_2()
{
	if(B_TeachMagicCircle(self,other,2))
	{
		AI_Output(self,other,"DIA_BaalOrun_CIRCLE_14_0A");	//Готов ли ты вступить в следующий Круг магии?
		AI_Output(other,self,"DIA_BaalOrun_CIRCLE_15_02");	//Да, мастер. Я готов.
		AI_Output(self,other,"DIA_BaalOrun_CIRCLE_14_09");	//Ты уже научился понимать руны. Пришло время углубить твои познания.
		AI_Output(self,other,"DIA_BaalOrun_CIRCLE_14_10");	//Вступив во Второй Круг, ты постигнешь основы мощных боевых заклятий.
		AI_Output(self,other,"DIA_BaalOrun_CIRCLE_14_11");	//Но для того чтобы познать истинные секреты магии, тебе предстоит многому научиться.
		AI_Output(self,other,"DIA_BaalOrun_CIRCLE_14_12");	//Ты уже знаешь о том, что можешь использовать любую руну бессчетное число раз, но лишь до тех пор, пока не израсходуешь собственную магическую силу.
		AI_Output(self,other,"DIA_BaalOrun_CIRCLE_14_13");	//Но прежде чем сделать что-либо, подумай о том, есть ли в этом смысл. Ты обладаешь силой, которая позволяет с легкостью сеять смерть и разрушения.
		AI_Output(self,other,"DIA_BaalOrun_CIRCLE_14_14");	//Но истинный маг использует ее лишь по необходимости.
		AI_Output(self,other,"DIA_BaalOrun_CIRCLE_14_15");	//Научись оценивать ситуацию, и ты познаешь истинную силу рун.
	};
	Info_ClearChoices(DIA_BaalOrun_CIRCLE);
};

func void DIA_BaalOrun_CIRCLE_3()
{
	if(B_TeachMagicCircle(self,other,3))
	{
		AI_Output(self,other,"DIA_BaalOrun_CIRCLE_14_0A");	//Готов ли ты вступить в следующий Круг магии?
		AI_Output(other,self,"DIA_BaalOrun_CIRCLE_15_03");	//Да, мастер. Я готов.
		AI_Output(self,other,"DIA_BaalOrun_CIRCLE_14_16");	//Третий Круг является одним из важнейших этапов в жизни каждого мага. Достигнув его, ты завершаешь свой поиск.
		AI_Output(self,other,"DIA_BaalOrun_CIRCLE_14_17");	//Ты уже преодолел значительный этап на пути магии. Ты научился использовать руны.
		AI_Output(self,other,"DIA_BaalOrun_CIRCLE_14_18");	//Это знание послужит основой для следующего этапа. Используй руны осмотрительно.
		AI_Output(self,other,"DIA_BaalOrun_CIRCLE_14_19");	//Ты можешь использовать их или нет. Но ты должен определиться с выбором.
		AI_Output(self,other,"DIA_BaalOrun_CIRCLE_14_20");	//Сделав выбор, используй свою силу без колебаний.
		AI_Output(self,other,"DIA_BaalOrun_CIRCLE_14_21");	//Найди свой путь, и тогда ты познаешь силу решения.
	};
	Info_ClearChoices(DIA_BaalOrun_CIRCLE);
};

func void DIA_BaalOrun_CIRCLE_4()
{
	if(B_TeachMagicCircle(self,other,4))
	{
		AI_Output(self,other,"DIA_BaalOrun_CIRCLE_14_0A");	//Готов ли ты вступить в следующий Круг магии?
		AI_Output(other,self,"DIA_BaalOrun_CIRCLE_15_04");	//Да, мастер. Я готов.
		AI_Output(self,other,"DIA_BaalOrun_CIRCLE_14_22");	//Ты завершил первые три Круга. Пришло время тебе постичь секреты магии.
		AI_Output(self,other,"DIA_BaalOrun_CIRCLE_14_23");	//Основа магии рун - камень. Магический камень, добытый из магической руды.
		AI_Output(self,other,"DIA_BaalOrun_CIRCLE_14_24");	//Это та самая руда, которую добывают в шахтах. В храмах она наделяется магическими формулами, и там же руны превращаются в орудия нашей силы.
		AI_Output(self,other,"DIA_BaalOrun_CIRCLE_14_25");	//Теперь ты обладаешь всеми знаниями, которые были накоплены храмами.
		AI_Output(self,other,"DIA_BaalOrun_CIRCLE_14_27");	//Познай магию, и ты откроешь для себя секрет власти.
		AI_Output(self,other,"DIA_BaalOrun_CIRCLE_14_28");	//И еще кое-что. Войдя в четвертый Круг магии - ты удостаиваешься чести носить облачение высших Гуру!
		AI_Output(self,other,"DIA_BaalOrun_CIRCLE_14_29");	//Немногим удавалось такое. Теперь ты - один из избранных священного круга!
		AI_Output(self,other,"DIA_BaalOrun_CIRCLE_14_30");	//Вот, возьми эту робу и магический посох в качестве признания твоего статуса.
		CreateInvItems(self,ItMW_Addon_Stab04,1);
		B_GiveInvItems(self,other,ItMW_Addon_Stab04,1);
		CreateInvItems(other,itar_gur_h,1);
	};
	Info_ClearChoices(DIA_BaalOrun_CIRCLE);
};

func void DIA_BaalOrun_CIRCLE_5()
{
	if(B_TeachMagicCircle(self,other,5))
	{
		AI_Output(self,other,"DIA_BaalOrun_CIRCLE_14_0A");	//Готов ли ты вступить в следующий Круг магии?
		AI_Output(other,self,"DIA_BaalOrun_CIRCLE_15_05");	//Да, мастер. Я готов.
		AI_Output(self,other,"DIA_BaalOrun_CIRCLE_15_5A");	//Да будет так. Я открою тебе истинный смысл Пятого Круга.
		AI_Output(self,other,"DIA_BaalOrun_CIRCLE_14_31");	//Познай предел своих возможностей, и ты познаешь свою истинную силу.
		AI_Output(self,other,"DIA_BaalOrun_CIRCLE_14_32");	//Заклинания, которые ты сможешь изучать, могут быть воистину разрушительными.
		AI_Output(self,other,"DIA_BaalOrun_CIRCLE_14_33");	//Так что знай меру своей силе и остерегайся мании величия.
	};
	Info_ClearChoices(DIA_BaalOrun_CIRCLE);
};

func void DIA_BaalOrun_CIRCLE_6()
{
	if(B_TeachMagicCircle(self,other,6))
	{
		AI_Output(self,other,"DIA_BaalOrun_CIRCLE_14_34");	//Я подниму тебя в Шестой Круг магии.
		AI_Output(self,other,"DIA_BaalOrun_CIRCLE_14_35");	//Заметь, в Шестой Круг могут вступить лишь самые могущественные из магов. Он предназначен для тех, чья жизнь это знак.
		AI_Output(self,other,"DIA_BaalOrun_CIRCLE_14_38");	//Твой знак - Скала!
		AI_Output(self,other,"DIA_BaalOrun_CIRCLE_14_39");	//Шестой Круг позволит тебе использовать магию любой руны.
		AI_Output(self,other,"DIA_BaalOrun_CIRCLE_14_40");	//И не забудь: не захватывать силу, но быть ее источником.
		AI_Output(self,other,"DIA_BaalOrun_CIRCLE_14_41");	//Будь мудр и рассудителен в своих деяниях и постарайся использовать свои знания во благо Братства!
		DIA_BAALORUN_CIRCLE_NOPERM = TRUE;
	};
	Info_ClearChoices(DIA_BaalOrun_CIRCLE);
};

instance DIA_BAALORUN_SENDCADAR(C_Info)
{
	npc = gur_8002_orun;
	nr = 99;
	condition = dia_baalorun_sendcadar_condition;
	information = dia_baalorun_sendcadar_info;
	permanent = FALSE;
	description = "Идол Кадар послал меня...";
};


func int dia_baalorun_sendcadar_condition()
{
	if((hero.guild == GIL_GUR) && (BAALORUN_TEACHMANA == TRUE))
	{
		return TRUE;
	};
};

func void dia_baalorun_sendcadar_info()
{
	AI_Output(other,self,"DIA_BaalOrun_SendCadar_15_00");	//Идол Кадар послал меня. Я хочу увеличить свою силу.
	AI_Output(self,other,"DIA_BaalOrun_SendCadar_11_01");	//Я вижу - ты много выучил и твоя сила возросла! Теперь ты будешь учиться у меня.
};

instance DIA_BAALORUN_TEACH_MANA(C_Info)
{
	npc = gur_8002_orun;
	nr = 10;
	condition = dia_baalorun_teach_mana_condition;
	information = dia_baalorun_teach_mana_info;
	permanent = TRUE;
	description = "Я хочу увеличить свою магическую энергию.";
};

func int dia_baalorun_teach_mana_condition()
{
	if((other.guild == GIL_GUR) && (BAALORUN_TEACHMANA == TRUE) && Npc_KnowsInfo(other,DIA_BAALORUN_SENDCADAR) && ((other.attribute[ATR_MANA_MAX] < T_MEGA) || (VATRAS_TEACHREGENMANA == FALSE)))
	{
		return TRUE;
	};
};

func void dia_baalorun_teach_mana_info()
{
	AI_Output(other,self,"DIA_BaalOrun_TEACH_MANA_15_00");	//Я хочу увеличить свою магическую энергию.
	Info_ClearChoices(dia_baalorun_teach_mana);
	Info_AddChoice(dia_baalorun_teach_mana,Dialog_Back,dia_baalorun_teach_mana_back);
	Info_AddChoice(dia_baalorun_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_baalorun_teach_mana_1);
	Info_AddChoice(dia_baalorun_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_baalorun_teach_mana_5);

	if((Kapitel >= 2) && (VATRAS_TEACHREGENMANA == FALSE))
	{
		Info_AddChoice(DIA_BaalOrun_TEACH_MANA,"Регенерация маны (Очки обучения: 5, Цена: 7500 монет)",DIA_BaalOrun_TEACH_MANA_Regen);
	};
};

func void dia_baalorun_teach_mana_back()
{
	if(other.attribute[ATR_MANA_MAX] >= T_MEGA)
	{
		AI_Output(self,other,"DIA_BaalOrun_TEACH_MANA_05_00");	//Ты на пределе своих возможностей - я научил тебя всему, что сам знал!
	};

	Info_ClearChoices(dia_baalorun_teach_mana);
};

func void DIA_BaalOrun_TEACH_MANA_Regen()
{
	var int kosten;
	var int money;

	AI_Output(other,self,"DIA_Vatras_Teach_regen_15_05");	//Научи меня регенерации маны.

	kosten = 5;
	money = 7500;

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

	Info_ClearChoices(dia_baalorun_teach_mana);
	Info_AddChoice(dia_baalorun_teach_mana,Dialog_Back,dia_baalorun_teach_mana_back);
	Info_AddChoice(dia_baalorun_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_baalorun_teach_mana_1);
	Info_AddChoice(dia_baalorun_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_baalorun_teach_mana_5);
};

func void dia_baalorun_teach_mana_1()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,1,T_MEGA);
	Info_ClearChoices(dia_baalorun_teach_mana);
	Info_AddChoice(dia_baalorun_teach_mana,Dialog_Back,dia_baalorun_teach_mana_back);
	Info_AddChoice(dia_baalorun_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_baalorun_teach_mana_1);
	Info_AddChoice(dia_baalorun_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_baalorun_teach_mana_5);

	if((Kapitel >= 2) && (hero.guild == GIL_GUR) && (VATRAS_TEACHREGENMANA == FALSE))
	{
		Info_AddChoice(DIA_BaalOrun_TEACH_MANA,"Регенерация маны (Очки обучения: 10, Цена: 10000 монет)",DIA_BaalOrun_TEACH_MANA_Regen);
	};
};

func void dia_baalorun_teach_mana_5()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,5,T_MEGA);
	Info_ClearChoices(dia_baalorun_teach_mana);
	Info_AddChoice(dia_baalorun_teach_mana,Dialog_Back,dia_baalorun_teach_mana_back);
	Info_AddChoice(dia_baalorun_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_baalorun_teach_mana_1);
	Info_AddChoice(dia_baalorun_teach_mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_baalorun_teach_mana_5);

	if((Kapitel >= 2) && (hero.guild == GIL_GUR) && (VATRAS_TEACHREGENMANA == FALSE))
	{
		Info_AddChoice(DIA_BaalOrun_TEACH_MANA,"Регенерация маны (Очки обучения: 10, Цена: 10000 монет)",DIA_BaalOrun_TEACH_MANA_Regen);
	};
};

instance DIA_BAALORUN_GATHERARMY(C_Info)
{
	npc = gur_8002_orun;
	nr = 1;
	condition = dia_baalorun_gatherarmy_condition;
	information = dia_baalorun_gatherarmy_info;
	permanent = FALSE;
	description = "Нам нужно срочно поговорить!";
};


func int dia_baalorun_gatherarmy_condition()
{
	if((HAGENOTHERSAGREED == TRUE) && (HAGENNOMORETIMEWAIT == FALSE))
	{
		return TRUE;
	};
};

func void dia_baalorun_gatherarmy_info()
{
	B_GivePlayerXP(400);
	AI_Output(other,self,"DIA_BaalOrun_GatherArmy_01_00");	//Нам нужно срочно поговорить!
	if((other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR))
	{
		AI_Output(self,other,"DIA_BaalOrun_GatherArmy_01_01");	//О чем именно, брат?
	}
	else
	{
		AI_Output(self,other,"DIA_BaalOrun_GatherArmy_01_02");	//(вздох)
		AI_Output(other,self,"DIA_BaalOrun_GatherArmy_01_03");	//Послушай, скоро сюда нагрянут орки!
		AI_Output(self,other,"DIA_BaalOrun_GatherArmy_01_04");	//Орки?! Хммм... С чего ты это взял?
	};
	AI_Output(other,self,"DIA_BaalOrun_GatherArmy_01_05");	//Я пришел с предложением от лорда Хагена, главы ордена паладинов.
	AI_Output(self,other,"DIA_BaalOrun_GatherArmy_01_06");	//Да? И в чем оно заключается?
	AI_Output(other,self,"DIA_BaalOrun_GatherArmy_01_07");	//Он просит вашей помощи в войне с этими зеленокожими тварями.
	AI_Output(self,other,"DIA_BaalOrun_GatherArmy_01_08");	//Так, значит, лорд Хаген хочет в открытую выступить против орков?
	AI_Output(other,self,"DIA_BaalOrun_GatherArmy_01_09");	//Да, - правда, сейчас у него слишком мало людей, чтобы дать им открытый бой.
	AI_Output(other,self,"DIA_BaalOrun_GatherArmy_01_10");	//Но он полагает, что с вашей помощью у него будет шанс выиграть эту битву.
	AI_Output(self,other,"DIA_BaalOrun_GatherArmy_01_11");	//Мне нужно некоторое время для раздумий...
	AI_Output(other,self,"DIA_BaalOrun_GatherArmy_01_12");	//Но орки уже и так прибрали к рукам большую часть острова! Еще немного - и они завладеют им целиком.
	AI_Output(other,self,"DIA_BaalOrun_GatherArmy_01_13");	//Орки там никого не пощадили, устроив всем его жителям кровавую резню. Поэтому вряд ли они будут к вам более благосклонны.
	AI_Output(self,other,"DIA_BaalOrun_GatherArmy_01_14");	//(решительно) Ну хорошо! Считай, что ты смог убедить меня в необходимости подобного союза.
	AI_Output(self,other,"DIA_BaalOrun_GatherArmy_01_15");	//Братство поможет паладинам, ибо по всей видимости теперь это стало нашим общим делом.
	AI_Output(other,self,"DIA_BaalOrun_GatherArmy_01_16");	//Хорошо, я передам твои слова лорду Хагену. Когда вы выступаете?
	AI_Output(self,other,"DIA_BaalOrun_GatherArmy_01_17");	//Это уже решать не мне. Думаю, будет лучше, если ты поговоришь об этом с Гор На Кошем.
	AI_Output(self,other,"DIA_BaalOrun_GatherArmy_01_18");	//Именно он сейчас возглавляет священный Круг стражей.
	AI_Output(other,self,"DIA_BaalOrun_GatherArmy_01_19");	//А как же вы - Гуру?
	AI_Output(self,other,"DIA_BaalOrun_GatherArmy_01_20");	//Все, что касается аспектов ведения войны - это удел воинов Братства! И в этом мы полностью полагаемся на них.
	AI_Output(self,other,"DIA_BaalOrun_GatherArmy_01_21");	//Конечно, наши познания в области магии, дарованной нам когда-то Спящим, безусловно, могли бы помочь нам в предстоящей битве.
	AI_Output(self,other,"DIA_BaalOrun_GatherArmy_01_22");	//Однако ты должен понять, что Гуру - это прежде всего духовные наставники Братства, а не его воины.
	AI_Output(self,other,"DIA_BaalOrun_GatherArmy_01_23");	//Так что иди к Гор На Кошу и передай мои слова. Все остальное он решит сам.
	AI_Output(other,self,"DIA_BaalOrun_GatherArmy_01_24");	//Хорошо, так и сделаю.
	B_LogEntry(TOPIC_ORсGREATWAR,"Я смог убедить Идола Орана в необходимости сражаться на стороне паладинов. Теперь мне необходимо поговорить с Гор На Кошем - наставником круга стражей и узнать, когда его воины готовы выступить в поход.");
};


instance DIA_BAALORUN_GETSHIP(C_Info)
{
	npc = gur_8002_orun;
	nr = 1;
	condition = dia_baalorun_getship_condition;
	information = dia_baalorun_getship_info;
	description = "Мне нужно попасть на корабль паладинов.";
};


func int dia_baalorun_getship_condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && (KAPITELORCATC == FALSE) && ((hero.guild == GIL_SEK) || (hero.guild == GIL_TPL) || (hero.guild == GIL_GUR)))
	{
		return TRUE;
	};
};

func void dia_baalorun_getship_info()
{
	AI_Output(other,self,"DIA_BaalOrun_GetShip_01_00");	//Мне нужно попасть на корабль паладинов. Ты можешь мне в этом помочь?
	AI_Output(self,other,"DIA_BaalOrun_GetShip_01_01");	//Хммм... И зачем тебе это только понадобилось?
	AI_Output(other,self,"DIA_BaalOrun_GetShip_01_02");	//Я узнал, где скрывается наш главный враг. И мне необходим корабль, чтобы добраться туда.
	AI_Output(self,other,"DIA_BaalOrun_GetShip_01_03");	//В таком случае я знаю, как нам лучше всего поступить.
	AI_Output(self,other,"DIA_BaalOrun_GetShip_01_04");	//Полагаю, тебе хорошо известно, что у нас довольно неплохие связи с некоторыми влиятельными людьми в городе.
	AI_Output(self,other,"DIA_BaalOrun_GetShip_01_05");	//И наверняка кое-кому из них будет вполне по силам решить эту проблему. Думаю, нам стоит обратиться именно к ним!
	AI_Output(other,self,"DIA_BaalOrun_GetShip_01_06");	//И что мне для этого нужно сделать?
	AI_Output(self,other,"DIA_BaalOrun_GetShip_01_07");	//Не волнуйся. Я сам обо всем позабочусь.
	AI_Output(self,other,"DIA_BaalOrun_GetShip_01_08");	//Однако хочу тебя сразу предупредить, что услуги подобного рода обойдутся тебе не слишком дешево!
	AI_Output(self,other,"DIA_BaalOrun_GetShip_01_09");	//Не говоря уже о времени, которое понадобится, чтобы утрясти все формальности в этом вопросе.
	AI_Output(self,other,"DIA_BaalOrun_GetShip_01_10");	//Заходи ко мне через пару дней. Возможно, что у меня будут для тебя новости на этот счет.
	DAYORUNHELP = Wld_GetDay();
	MIS_ORUNHELPSHIP = LOG_Running;
	Log_CreateTopic(TOPIC_ORUNHELPSHIP,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ORUNHELPSHIP,LOG_Running);
	B_LogEntry(TOPIC_ORUNHELPSHIP,"Идол Оран обещал мне помочь с кораблем. Однако это будет стоить мне огромной кучи золота! Мне стоит заглянуть к нему через пару дней.");
};


instance DIA_BAALORUN_GETSHIPDONE(C_Info)
{
	npc = gur_8002_orun;
	nr = 1;
	condition = dia_baalorun_getshipdone_condition;
	information = dia_baalorun_getshipdone_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_baalorun_getshipdone_condition()
{
	var int daynow;
	daynow = Wld_GetDay();
	if((MIS_ORUNHELPSHIP == LOG_Running) && (DAYORUNHELP <= (daynow - 2)))
	{
		return TRUE;
	};
};

func void dia_baalorun_getshipdone_info()
{
	AI_Output(self,other,"DIA_BaalOrun_GetShipDone_01_00");	//Хорошо, что ты зашел. У меня появились некоторые новости относительно твоей недавней просьбы.
	AI_Output(other,self,"DIA_BaalOrun_GetShipDone_01_01");	//Какие именно?
	AI_Output(self,other,"DIA_BaalOrun_GetShipDone_01_02");	//Мне удалось достать для тебя письменное разрешение на доступ к кораблю паладинов.
	AI_Output(self,other,"DIA_BaalOrun_GetShipDone_01_03");	//Однако, как я уже ранее говорил, тебе за него придется заплатить.
	AI_Output(self,other,"DIA_BaalOrun_GetShipDone_01_05");	//Всего-навсего две тысячи золотых монет. Итак, что скажешь?
	Info_ClearChoices(dia_baalorun_getshipdone);
	Info_AddChoice(dia_baalorun_getshipdone,"У меня сейчас с собой недостаточно золота.",dia_baalorun_getshipdone_paylater);
	if(Npc_HasItems(other,ItMi_Gold) >= 2000)
	{
		Info_AddChoice(dia_baalorun_getshipdone,"Хорошо, вот твои деньги.",dia_baalorun_getshipdone_money);
	};
};

func void dia_baalorun_getshipdone_paylater()
{
	AI_Output(other,self,"DIA_BaalOrun_GetShipDone_PayLater_01_00");	//У меня сейчас с собой недостаточно золота.
	AI_Output(self,other,"DIA_BaalOrun_GetShipDone_PayLater_01_01");	//Тогда поговорим об этом, когда оно у тебя будет.
	AI_Output(other,self,"DIA_BaalOrun_GetShipDone_PayLater_01_02");	//Само собой.
	ORUNCANGIVEMEPASS = TRUE;
	B_LogEntry(TOPIC_ORUNHELPSHIP,"Мне нужно заплатить две тысячи золотых, после чего Идол Оран согласится отдать мне письменное разрешение на доступ к кораблю.");
	Info_ClearChoices(dia_baalorun_getshipdone);
};

func void dia_baalorun_getshipdone_money()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_BaalOrun_GetShipDone_Money_01_00");	//Хорошо, вот твои деньги.
	B_GiveInvItems(other,self,ItMi_Gold,2000);
	AI_Output(self,other,"DIA_BaalOrun_GetShipDone_Money_01_01");	//Отлично! В таком случае можешь забрать его у меня.
	B_GiveInvItems(self,other,ITWr_ForgedShipLetter_MIS,1);
	AI_Output(self,other,"DIA_BaalOrun_GetShipDone_Money_01_02");	//И надеюсь, что оно тебе поможет.
	AI_Output(other,self,"DIA_BaalOrun_GetShipDone_Money_01_03");	//Можешь в этом не сомневаться.
	MIS_ORUNHELPSHIP = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_ORUNHELPSHIP,LOG_SUCCESS);
	B_LogEntry(TOPIC_ORUNHELPSHIP,"Идол Оран дал мне письменное разрешение, с помощью которого я смогу теперь подняться на борт Эсмеральды.");
	Info_ClearChoices(dia_baalorun_getshipdone);
};


instance DIA_BAALORUN_GETSHIPDONEAGAIN(C_Info)
{
	npc = gur_8002_orun;
	nr = 1;
	condition = dia_baalorun_getshipdoneagain_condition;
	information = dia_baalorun_getshipdoneagain_info;
	permanent = TRUE;
	description = "Дай мне это письменное разрешение.";
};


func int dia_baalorun_getshipdoneagain_condition()
{
	if((MIS_ORUNHELPSHIP == LOG_Running) && (ORUNCANGIVEMEPASS == TRUE))
	{
		return TRUE;
	};
};

func void dia_baalorun_getshipdoneagain_info()
{
	AI_Output(other,self,"DIA_BaalOrun_GetShipDoneAgain_01_00");	//Дай мне это письменное разрешение.
	AI_Output(self,other,"DIA_BaalOrun_GetShipDoneAgain_01_01");	//А деньги?
	Info_ClearChoices(dia_baalorun_getshipdoneagain);
	Info_AddChoice(dia_baalorun_getshipdoneagain,"У меня сейчас с собой недостаточно золота.",dia_baalorun_getshipdoneagain_paylater);
	if(Npc_HasItems(other,ItMi_Gold) >= 2000)
	{
		Info_AddChoice(dia_baalorun_getshipdoneagain,"Хорошо, вот твое золото.",dia_baalorun_getshipdoneagain_money);
	};
};

func void dia_baalorun_getshipdoneagain_paylater()
{
	AI_Output(other,self,"DIA_BaalOrun_GetShipDoneAgain_PayLater_01_00");	//У меня недостаточно золота.
	AI_Output(self,other,"DIA_BaalOrun_GetShipDoneAgain_PayLater_01_01");	//Тогда поговорим об этом, когда оно у тебя будет.
	Info_ClearChoices(dia_baalorun_getshipdoneagain);
};

func void dia_baalorun_getshipdoneagain_money()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_BaalOrun_GetShipDoneAgain_Money_01_00");	//Хорошо, вот твое золото.
	B_GiveInvItems(other,self,ItMi_Gold,2000);
	AI_Output(self,other,"DIA_BaalOrun_GetShipDoneAgain_Money_01_01");	//Отлично! В таком случае можешь забрать его у меня.
	B_GiveInvItems(self,other,ITWr_ForgedShipLetter_MIS,1);
	AI_Output(self,other,"DIA_BaalOrun_GetShipDoneAgain_Money_01_02");	//И надеюсь, что оно тебе поможет.
	AI_Output(other,self,"DIA_BaalOrun_GetShipDoneAgain_Money_01_03");	//Можешь в этом не сомневаться.
	MIS_ORUNHELPSHIP = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_ORUNHELPSHIP,LOG_SUCCESS);
	B_LogEntry(TOPIC_ORUNHELPSHIP,"Идол Оран дал мне письменное разрешение, с помощью которого я смогу теперь подняться на борт Эсмеральды.");
	Info_ClearChoices(dia_baalorun_getshipdoneagain);
};


instance DIA_BAALORUN_RUNEMAGICNOTWORK(C_Info)
{
	npc = gur_8002_orun;
	nr = 1;
	condition = dia_baalorun_runemagicnotwork_condition;
	information = dia_baalorun_runemagicnotwork_info;
	permanent = FALSE;
	description = "Как обстоят дела с вашей магией?";
};


func int dia_baalorun_runemagicnotwork_condition()
{
	if((STOPBIGBATTLE == TRUE) && (MIS_RUNEMAGICNOTWORK == LOG_Running) && (GURUMAGERUNESNOT == FALSE))
	{
		return TRUE;
	};
};

func void dia_baalorun_runemagicnotwork_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_BaalOrun_RuneMagicNotWork_01_00");	//Как обстоят дела с вашей магией?
	AI_Output(self,other,"DIA_BaalOrun_RuneMagicNotWork_01_01");	//Наши магические руны ослабли и более не способны творить заклинания!
	AI_Output(self,other,"DIA_BaalOrun_RuneMagicNotWork_01_02");	//Мы все крайне удивлены этому обстоятельству, но ничего не можем сделать.
	AI_Output(self,other,"DIA_BaalOrun_RuneMagicNotWork_01_03");	//Все это довольно странно.
	B_LogEntry(TOPIC_RUNEMAGICNOTWORK,"Гуру Братства также лишились власти над магией рун!");
	GURUMAGERUNESNOT = TRUE;
};

instance DIA_BaalOrun_MAXROBE(C_Info)
{
	npc = gur_8002_orun;
	nr = 2;
	condition = DIA_BaalOrun_MAXROBE_condition;
	information = DIA_BaalOrun_MAXROBE_info;
	permanent = FALSE;
	description = "Как насчет робы получше?";
};

func int DIA_BaalOrun_MAXROBE_condition()
{
	if((hero.guild == GIL_GUR) && (Kapitel >= 5) && (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 6) && (LastRobeGUR == FALSE) && (MAXROBEGUR_Permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_BaalOrun_MAXROBE_info()
{
	AI_Output(other,self,"DIA_BaalOrun_MAXROBE_01_00");	//Как насчет робы получше?
	AI_Output(self,other,"DIA_BaalOrun_MAXROBE_01_01");	//Поскольку ты владеешь всеми шестью кругами магии, ты достоин носить робу верховного Гуру!
	AI_Output(self,other,"DIA_BaalOrun_MAXROBE_01_02");	//Однако тебе придется за нее заплатить. Ее изготовление обходится нам недешево, поэтому мы не можем отдать ее даром.
	LastRobeGUR = TRUE;
};

instance DIA_BaalOrun_MAXROBE_Buy(C_Info)
{
	npc = gur_8002_orun;
	nr = 2;
	condition = DIA_BaalOrun_MAXROBE_Buy_condition;
	information = DIA_BaalOrun_MAXROBE_Buy_info;
	permanent = TRUE;
	description = "Продай мне робу верховного Гуру. (Цена: 25000 монет)";
};

func int DIA_BaalOrun_MAXROBE_Buy_condition()
{
	if((hero.guild == GIL_GUR) && (LastRobeGUR == TRUE) && (MAXROBEGUR_Permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_BaalOrun_MAXROBE_Buy_info()
{
	AI_Output(other,self,"DIA_BaalOrun_MAXROBE_Buy_01_00");	//Продай мне робу верховного Гуру.

	if(Npc_HasItems(hero,ItMi_Gold) >= 25000)
	{
		B_GiveInvItems(other,self,ItMi_Gold,25000);
		Npc_RemoveInvItems(self,ItMi_Gold,25000);
		AI_Output(self,other,"DIA_BaalOrun_MAXROBE_Buy_01");	//Хорошо! Вот, держи ее.
		AI_Output(self,other,"DIA_BaalOrun_MAXROBE_Buy_02");	//Это огромная честь носить подобное одеяние. Помни об этом!
		CreateInvItems(self,ITAR_GUR_TOP,1);
		B_GiveInvItems(self,other,ITAR_GUR_TOP,1);
		MAXROBEGUR_Permanent = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_BaalOrun_MAXROBE_Buy_01_03");	//У тебя недостаточно золота.
	};
};
