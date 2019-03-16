var int DIA_Parlan_WORK_perm;

instance DIA_Parlan_Kap1_EXIT(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 999;
	condition = DIA_Parlan_Kap1_EXIT_Condition;
	information = DIA_Parlan_Kap1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Parlan_Kap1_EXIT_Condition()
{
	if(Kapitel <= 1)
	{
		return TRUE;
	};
};

func void DIA_Parlan_Kap1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

var int Parlan_Hammer;

func void B_Parlan_HAMMER()
{
	AI_Output(self,other,"DIA_Parlan_HAMMER_05_00");	//Подожди минутку, сын мой!
	AI_Output(self,other,"DIA_Parlan_HAMMER_05_01");	//Ходят слухи, что ценный артефакт 'исчез' из нашего святилища.
	AI_Output(self,other,"DIA_Parlan_HAMMER_05_02");	//Я не хочу ничего даже слышать об этом - я жду, что он вернется на свое законное место.
	Parlan_Hammer = TRUE;
};


var int Parlan_LastPetzCounter;
var int Parlan_LastPetzCrime;

instance DIA_Parlan_PMSchulden(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 1;
	condition = DIA_Parlan_PMSchulden_Condition;
	information = DIA_Parlan_PMSchulden_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Parlan_PMSchulden_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Parlan_Schulden > 0) && (B_GetGreatestPetzCrime(self) <= Parlan_LastPetzCrime))
	{
		return TRUE;
	};
};

func void dia_parlan_petzmaster_attackmurder()
{
	var string concatText;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_HumanMurderedHuman,0);
	GLOBAL_MAKE_BANDIT_FORMON = 1;
	concatText = "Маги Огня объявили вас вне закона!";
	AI_Print(concatText);
};

func void dia_parlan_pmschulden_attackmurder()
{
	var string concatText;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_HumanMurderedHuman,0);
	GLOBAL_MAKE_BANDIT_FORMON = 1;
	concatText = "Маги Огня объявили вас вне закона!";
	AI_Print(concatText);
};

func void DIA_Parlan_PMSchulden_Info()
{
	var int diff;
	var string concatText1;
	var string concatText2;
	var string concattextschulden;
	var string tsettext1;
	var string tsettext2;
	var string tsettext3;
	var int temp1;

	if((Parlan_Hammer == FALSE) && (Hammer_Taken == TRUE) && (other.guild == GIL_NOV) && (Npc_IsDead(Garwig) == FALSE))
	{
		B_Parlan_HAMMER();
	};
	AI_Output(self,other,"DIA_Parlan_PMSchulden_05_00");	//Ты нарушил законы нашей общины.
	temp1 = 0;
	if(GLOBAL_MONASTERY_MURDER > 2)
	{
		temp1 = 1;
	};
	if(GLOBAL_MONASTERY_THEFT > 5)
	{
		temp1 = 1;
	};
	if(GLOBAL_MONASTERY_ATTACK > 5)
	{
		temp1 = 1;
	};
	if(temp1 == 1)
	{
		if(GLOBAL_MONASTERY_MURDER > 2)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_MONASTERY_MURDER),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_MURDERCOUNT2_MONASTERY);
			tsettext3 = ConcatStrings(PRINT_MURDERCOUNT_MONASTERY,tsettext2);
			AI_Output(self,other,"DIA_Parlan_PMSchulden_08_36");	//Тебе все-таки не следовало это делать. Я тебя предупреждал.
			AI_Output(self,other,"DIA_Parlan_PMSchulden_08_37");	//Иннос не терпит убийц! Убивая на наших братьев, ты более не можешь рассчитывать на его милосердие!
			AI_Output(self,other,"DIA_Parlan_PMSchulden_08_38");	//Его гнев покарает тебя быстрее, чем ты сам это осознаешь...
			if(Npc_HasItems(self,ItRu_Pyrokinesis) == 0)
			{
				CreateInvItems(self,ItRu_Pyrokinesis,1);
			};
			B_ReadySpell(self,SPL_Pyrokinesis,SPL_COST_Firestorm);
			AI_Output(self,other,"DIA_Parlan_PMSchulden_08_39");	//Умри, такова воля Инноса!
		}
		else if(GLOBAL_MONASTERY_ATTACK > 5)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_MONASTERY_ATTACK),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_ATTACKCOUNT2_MONASTERY);
			tsettext3 = ConcatStrings(PRINT_ATTACKCOUNT_MONASTERY,tsettext2);
			AI_Output(self,other,"DIA_Parlan_PMSchulden_08_40");	//Тебе все-таки не следовало это делать. Я тебя предупреждал.
			AI_Output(self,other,"DIA_Parlan_PMSchulden_08_41");	//Постоянно нападая на наших братьев, ты более не можешь рассчитывать на его милосердие!
			AI_Output(self,other,"DIA_Parlan_PMSchulden_08_42");	//Его гнев покарает тебя быстрее, чем ты сам это осознаешь...
			if(Npc_HasItems(self,ItRu_Pyrokinesis) == 0)
			{
				CreateInvItems(self,ItRu_Pyrokinesis,1);
			};
			B_ReadySpell(self,SPL_Pyrokinesis,SPL_COST_Firestorm);
			AI_Output(self,other,"DIA_Parlan_PMSchulden_08_43");	//Умри, такова воля Инноса!
		}
		else if(GLOBAL_MONASTERY_THEFT > 5)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_MONASTERY_THEFT),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_THEFTCOUNT2_MONASTERY);
			tsettext3 = ConcatStrings(PRINT_THEFTCOUNT_MONASTERY,tsettext2);
			AI_Output(self,other,"DIA_Parlan_PMSchulden_08_44");	//Тебе все-таки не следовало это делать. Я тебя предупреждал.
			AI_Output(self,other,"DIA_Parlan_PMSchulden_08_45");	//Постоянно воруя у наших братьев, ты более не можешь рассчитывать на его милосердие!
			AI_Output(self,other,"DIA_Parlan_PMSchulden_08_46");	//Его гнев покарает тебя быстрее, чем ты сам это осознаешь...
			if(Npc_HasItems(self,ItRu_Pyrokinesis) == 0)
			{
				CreateInvItems(self,ItRu_Pyrokinesis,1);
			};
			B_ReadySpell(self,SPL_Pyrokinesis,SPL_COST_Firestorm);
			AI_Output(self,other,"DIA_Parlan_PMSchulden_08_47");	//Умри, такова воля Инноса!
		};
		Log_CreateTopic(TOPIC_DIPLOM,LOG_NOTE);
		B_LogEntry(TOPIC_DIPLOM,"Я испортил свои отношения с Магами Огня, из-за постоянных моих бесчинств в монастыре. Теперь меня там считают бандитом!");
		Info_ClearChoices(DIA_Parlan_PMSchulden);
		Info_ClearChoices(DIA_Parlan_PETZMASTER);
		Info_AddChoice(DIA_Parlan_PMSchulden,"Постой!!!...",dia_parlan_pmschulden_attackmurder);
	}
	else
	{
		if(B_GetTotalPetzCounter(self) > Parlan_LastPetzCounter)
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_01");	//И хотя ты уже был обвинен, ты лишь усугубляешь свою вину.
			if(Parlan_Schulden < 1000)
			{
				AI_Output(self,other,"DIA_Parlan_PMSchulden_05_02");	//Твой грех может быть отпущен только посредством пожертвования большой суммы монастырю.
				AI_Output(other,self,"DIA_Parlan_PMAdd_15_00");	//Сколько?
				diff = B_GetTotalPetzCounter(self) - Parlan_LastPetzCounter;
				if(diff > 0)
				{
					Parlan_Schulden = Parlan_Schulden + (diff * 250);
				};
				if(Parlan_Schulden <= 1000)
				{
					B_Say_Gold(self,other,Parlan_Schulden);
				}
				else
				{
					concatText1 = ConcatStrings(IntToString(Parlan_Schulden),"");
					concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
					concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
					AI_Print(concattextschulden);
				};
			}
			else
			{
				AI_Output(self,other,"DIA_Parlan_PMSchulden_05_03");	//За кого ты себя принимаешь? Молись Инносу, чтобы он даровал прощение твоих грехов!
				AI_Output(other,self,"DIA_Parlan_PMAdd_15_00A");	//Сколько?
				diff = B_GetTotalPetzCounter(self) - Parlan_LastPetzCounter;
				if(diff > 0)
				{
					Parlan_Schulden = Parlan_Schulden + (diff * 250);
				};
				if(Parlan_Schulden <= 1000)
				{
					B_Say_Gold(self,other,Parlan_Schulden);
				}
				else
				{
					concatText1 = ConcatStrings(IntToString(Parlan_Schulden),"");
					concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
					concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
					AI_Print(concattextschulden);
				};
			};
		}
		else if(B_GetGreatestPetzCrime(self) < Parlan_LastPetzCrime)
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_04");	//Твоя ситуация изменилась.
			if(Parlan_LastPetzCrime == CRIME_MURDER)
			{
				AI_Output(self,other,"DIA_Parlan_PMSchulden_05_05");	//Больше нет свидетелей убийства, совершенного тобой!
				GLOBAL_MONASTERY_MURDER = GLOBAL_MONASTERY_MURDER - 1;
				if(GLOBAL_MONASTERY_MURDER < 0)
				{
					GLOBAL_MONASTERY_MURDER = 0;
				};
			};
			if((Parlan_LastPetzCrime == CRIME_THEFT) || ((Parlan_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT)))
			{
				AI_Output(self,other,"DIA_Parlan_PMSchulden_05_06");	//Никто не может засвидетельствовать, что ты воровал!
				GLOBAL_MONASTERY_THEFT = GLOBAL_MONASTERY_THEFT - 1;
				if(GLOBAL_MONASTERY_THEFT < 0)
				{
					GLOBAL_MONASTERY_THEFT = 0;
				};
			};
			if((Parlan_LastPetzCrime == CRIME_ATTACK) || ((Parlan_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK)))
			{
				AI_Output(self,other,"DIA_Parlan_PMSchulden_05_07");	//Никто больше не может засвидетельствовать, что ты принимал участие в драке!
				GLOBAL_MONASTERY_ATTACK = GLOBAL_MONASTERY_ATTACK - 1;
				if(GLOBAL_MONASTERY_ATTACK < 0)
				{
					GLOBAL_MONASTERY_ATTACK = 0;
				};
			};
			if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
			{
				AI_Output(self,other,"DIA_Parlan_PMSchulden_05_08");	//Все обвинения против тебя не находят подтверждения.
			};
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_09");	//Возможно, тебе удастся провести меня, но Иннос все видит!
			if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
			{
				AI_Output(self,other,"DIA_Parlan_PMSchulden_05_10");	//Твои грехи забыты.
				AI_Output(self,other,"DIA_Parlan_PMSchulden_05_11");	//И постарайся, чтобы мы больше не возвращались к этому разговору!
				Parlan_Schulden = 0;
				Parlan_LastPetzCounter = 0;
				Parlan_LastPetzCrime = CRIME_NONE;
			}
			else
			{
				AI_Output(self,other,"DIA_Parlan_PMSchulden_05_12");	//Ты должен заплатить штраф. Такова воля Инноса!
				AI_Output(other,self,"DIA_Parlan_PMAdd_15_00B");	//Сколько?
				if(Parlan_Schulden <= 1000)
				{
					B_Say_Gold(self,other,Parlan_Schulden);
				}
				else
				{
					concatText1 = ConcatStrings(IntToString(Parlan_Schulden),"");
					concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
					concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
					AI_Print(concattextschulden);
				};
				AI_Output(self,other,"DIA_Parlan_PMSchulden_05_13");	//Освободись от своей вины!
			};
		};
		if(B_GetGreatestPetzCrime(self) != CRIME_NONE)
		{
			Info_ClearChoices(DIA_Parlan_PMSchulden);
			Info_ClearChoices(DIA_Parlan_PETZMASTER);
			Info_AddChoice(DIA_Parlan_PMSchulden,"У меня недостаточно золота!",DIA_Parlan_PETZMASTER_PayLater);
			Info_AddChoice(DIA_Parlan_PMSchulden,"Сколько я должен заплатить?",DIA_Parlan_PMSchulden_HowMuchAgain);
			if(Npc_HasItems(other,ItMi_Gold) >= Parlan_Schulden)
			{
				Info_AddChoice(DIA_Parlan_PMSchulden,"Я хочу заплатить штраф.",DIA_Parlan_PETZMASTER_PayNow);
			};
		};
	};
};

func void DIA_Parlan_PMSchulden_HowMuchAgain()
{
	var string concatText1;
	var string concatText2;
	var string concattextschulden;
	AI_Output(other,self,"DIA_Parlan_PMSchulden_HowMuchAgain_15_00");	//Сколько я должен заплатить?
	if(Parlan_Schulden <= 1000)
	{
		B_Say_Gold(self,other,Parlan_Schulden);
	}
	else
	{
		concatText1 = ConcatStrings(IntToString(Parlan_Schulden),"");
		concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
		concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
		AI_Print(concattextschulden);
	};
	Info_ClearChoices(DIA_Parlan_PMSchulden);
	Info_ClearChoices(DIA_Parlan_PETZMASTER);
	Info_AddChoice(DIA_Parlan_PMSchulden,"У меня недостаточно золота!",DIA_Parlan_PETZMASTER_PayLater);
	Info_AddChoice(DIA_Parlan_PMSchulden,"Сколько я должен заплатить?",DIA_Parlan_PMSchulden_HowMuchAgain);
	if(Npc_HasItems(other,ItMi_Gold) >= Parlan_Schulden)
	{
		Info_AddChoice(DIA_Parlan_PMSchulden,"Я хочу заплатить штраф.",DIA_Parlan_PETZMASTER_PayNow);
	};
};


instance DIA_Parlan_PETZMASTER(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 1;
	condition = DIA_Parlan_PETZMASTER_Condition;
	information = DIA_Parlan_PETZMASTER_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Parlan_PETZMASTER_Condition()
{
	if(B_GetGreatestPetzCrime(self) > Parlan_LastPetzCrime)
	{
		return TRUE;
	};
};

func void DIA_Parlan_PETZMASTER_Info()
{
	var string concatText1;
	var string concatText2;
	var string concattextschulden;
	var string tsettext1;
	var string tsettext2;
	var string tsettext3;
	var int temp1;
	if((Parlan_Hammer == FALSE) && (Hammer_Taken == TRUE) && (other.guild == GIL_NOV) && (Npc_IsDead(Garwig) == FALSE))
	{
		B_Parlan_HAMMER();
	};
	Parlan_Schulden = 0;
	if(self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_00");	//Мы еще не успели даже поговорить, а ты уже взвалил на себя груз вины!
	};
	temp1 = 0;
	if(GLOBAL_MONASTERY_MURDER > 2)
	{
		temp1 = 1;
	};
	if(GLOBAL_MONASTERY_THEFT > 5)
	{
		temp1 = 1;
	};
	if(GLOBAL_MONASTERY_ATTACK > 5)
	{
		temp1 = 1;
	};
	if(temp1 == 1)
	{
		if(GLOBAL_MONASTERY_MURDER > 2)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_MONASTERY_MURDER),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_MURDERCOUNT2_MONASTERY);
			tsettext3 = ConcatStrings(PRINT_MURDERCOUNT_MONASTERY,tsettext2);
			AI_Output(self,other,"DIA_Parlan_PETZMASTER_08_48");	//Тебе все-таки не следовало это делать. Я тебя предупреждал.
			AI_Output(self,other,"DIA_Parlan_PETZMASTER_08_49");	//Иннос не терпит убийц! Убивая на наших братьев, ты более не можешь рассчитывать на его милосердие!
			AI_Output(self,other,"DIA_Parlan_PETZMASTER_08_50");	//Его гнев покарает тебя быстрее, чем ты сам это осознаешь...
			if(Npc_HasItems(self,ItRu_Pyrokinesis) == 0)
			{
				CreateInvItems(self,ItRu_Pyrokinesis,1);
			};
			B_ReadySpell(self,SPL_Pyrokinesis,SPL_COST_Firestorm);
			AI_Output(self,other,"DIA_Parlan_PETZMASTER_08_51");	//Умри, такова воля Инноса!
		}
		else if(GLOBAL_MONASTERY_ATTACK > 5)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_MONASTERY_ATTACK),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_ATTACKCOUNT2_MONASTERY);
			tsettext3 = ConcatStrings(PRINT_ATTACKCOUNT_MONASTERY,tsettext2);
			AI_Output(self,other,"DIA_Parlan_PETZMASTER_08_52");	//Тебе все-таки не следовало это делать. Я тебя предупреждал.
			AI_Output(self,other,"DIA_Parlan_PETZMASTER_08_53");	//Постоянно нападая на наших братьев, ты истощаешь чашу милосердия Инноса!
			AI_Output(self,other,"DIA_Parlan_PETZMASTER_08_54");	//Его гнев покарает тебя быстрее, чем ты сам это осознаешь...
			if(Npc_HasItems(self,ItRu_Pyrokinesis) == 0)
			{
				CreateInvItems(self,ItRu_Pyrokinesis,1);
			};
			B_ReadySpell(self,SPL_Pyrokinesis,SPL_COST_Firestorm);
			AI_Output(self,other,"DIA_Parlan_PETZMASTER_08_55");	//Умри, такова воля нашего владыки!
		}
		else if(GLOBAL_MONASTERY_THEFT > 5)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_MONASTERY_THEFT),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_THEFTCOUNT2_MONASTERY);
			tsettext3 = ConcatStrings(PRINT_THEFTCOUNT_MONASTERY,tsettext2);
			AI_Output(self,other,"DIA_Parlan_PETZMASTER_08_56");	//Тебе все-таки не следовало это делать. Я тебя предупреждал.
			AI_Output(self,other,"DIA_Parlan_PETZMASTER_08_57");	//Постоянно воруя у наших братьев, ты не оставляешь Инносу выбора!
			AI_Output(self,other,"DIA_Parlan_PETZMASTER_08_58");	//Его гнев покарает тебя быстрее, чем ты сам это осознаешь...
			if(Npc_HasItems(self,ItRu_Pyrokinesis) == 0)
			{
				CreateInvItems(self,ItRu_Pyrokinesis,1);
			};
			B_ReadySpell(self,SPL_Pyrokinesis,SPL_COST_Firestorm);
			AI_Output(self,other,"DIA_Parlan_PETZMASTER_08_59");	//Умри, такова воля Инноса!
		};
		Log_CreateTopic(TOPIC_DIPLOM,LOG_NOTE);
		B_LogEntry(TOPIC_DIPLOM,"Я испортил свои отношения с магами Огня своими постоянными бесчинствами в монастыре. Теперь меня там считают бандитом!");
		Info_ClearChoices(DIA_Parlan_PMSchulden);
		Info_ClearChoices(DIA_Parlan_PETZMASTER);
		Info_AddChoice(DIA_Parlan_PETZMASTER,"Постой!...(пора сматываться)",dia_parlan_petzmaster_attackmurder);
	}
	else
	{
		if(B_GetGreatestPetzCrime(self) == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_01");	//Ты обвиняешься в худшем из всех преступлений - убийстве!
			Parlan_Schulden = B_GetTotalPetzCounter(self) * 1500;
			if((PETZCOUNTER_City_Theft + PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
			{
				AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_02");	//И ты взвалил на себя груз новой вины!
			};
			AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_03");	//Если было бы решать мне, - ты был бы проклят на месте! Ты убийца!
			AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_04");	//Но если ты заплатишь штраф за свое преступление. Впрочем...(задумался) Мы простим тебе твои грехи!
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_THEFT)
		{
			AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_05");	//Воровство - нарушение законов монастыря!
			if((PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
			{
				AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_06");	//Кроме того, ты нарушил и другие законы.
			};
			AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_07");	//Эти прегрешения должны быть наказаны. Таков закон Инноса!
			AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_08");	//Ты должен заплатить штраф монастырю!
			Parlan_Schulden = B_GetTotalPetzCounter(self) * 500;
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
		{
			AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_09");	//Мы не терпим драк в монастыре. Такое поведение нарушает наши правила!
			if(PETZCOUNTER_City_Sheepkiller > 0)
			{
				AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_10");	//И зачем ты убил нашу овцу?
			};
			AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_11");	//Мы живем здесь в соответствии с законами. Они касаются и тебя!
			AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_12");	//За твое преступление ты должен сделать пожертвование монастырю.
			Parlan_Schulden = B_GetTotalPetzCounter(self) * 750;
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER)
		{
			AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_13");	//Ты убил нашу овцу. Ты должен заплатить компенсацию за нее!
			Parlan_Schulden = 250;
		};
		AI_Output(other,self,"DIA_Parlan_PETZMASTER_15_14");	//Сколько?
		if(Parlan_Schulden <= 1000)
		{
			B_Say_Gold(self,other,Parlan_Schulden);
		}
		else
		{
			concatText1 = ConcatStrings(IntToString(Parlan_Schulden),"");
			concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
			concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
			AI_Print(concattextschulden);
		};
		Info_ClearChoices(DIA_Parlan_PMSchulden);
		Info_ClearChoices(DIA_Parlan_PETZMASTER);
		Info_AddChoice(DIA_Parlan_PETZMASTER,"У меня недостаточно золота!",DIA_Parlan_PETZMASTER_PayLater);
		if(Npc_HasItems(other,ItMi_Gold) >= Parlan_Schulden)
		{
			Info_AddChoice(DIA_Parlan_PETZMASTER,"Я хочу заплатить штраф.",DIA_Parlan_PETZMASTER_PayNow);
		};
	};
};

func void DIA_Parlan_PETZMASTER_PayNow()
{
	AI_Output(other,self,"DIA_Parlan_PETZMASTER_PayNow_15_00");	//Я хочу заплатить штраф!
	B_GiveInvItems(other,self,ItMi_Gold,Parlan_Schulden);
	AI_Output(self,other,"DIA_Parlan_PETZMASTER_PayNow_05_01");	//Я принимаю твое пожертвование. Твои прегрешения забыты. Я надеюсь, Иннос даст тебе мудрость не совершать больше подобных ошибок.
	B_GrantAbsolution(LOC_MONASTERY);
	Parlan_Schulden = 0;
	Parlan_LastPetzCounter = 0;
	Parlan_LastPetzCrime = CRIME_NONE;
	Info_ClearChoices(DIA_Parlan_PMSchulden);
	Info_ClearChoices(DIA_Parlan_PETZMASTER);
};

func void DIA_Parlan_PETZMASTER_PayLater()
{
	AI_Output(other,self,"DIA_Parlan_PETZMASTER_PayLater_15_00");	//У меня недостаточно золота!
	AI_Output(self,other,"DIA_Parlan_PETZMASTER_PayLater_05_01");	//Тебе стоило подумать об этом до того, как грешить.
	AI_Output(self,other,"DIA_Parlan_PETZMASTER_PayLater_05_02");	//Возможно, это тебя чему-нибудь научит. Не создавай проблем, и тебе не нужно будет платить.
	Parlan_LastPetzCounter = B_GetTotalPetzCounter(self);
	Parlan_LastPetzCrime = B_GetGreatestPetzCrime(self);
	Info_ClearChoices(DIA_Parlan_PMSchulden);
	Info_ClearChoices(DIA_Parlan_PETZMASTER);
	AI_StopProcessInfos(self);
};

var int ParlanPissOff;

instance DIA_Parlan_NoEnter(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 1;
	condition = DIA_Parlan_NoEnter_Condition;
	information = DIA_Parlan_NoEnter_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Parlan_NoEnter_Condition()
{
	if(CanEnterKloster == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Parlan_NoEnter_Info()
{
	AI_GotoNpc(self,other);
	AI_Output(self,other,"DIA_Parlan_NoEnter_01_00");	//(грозно) СТОЙ! Я тебя тут раньше не видел.
	AI_Output(self,other,"DIA_Parlan_NoEnter_01_01");	//Как ты вообще умудрился попасть сюда?
	Info_ClearChoices(DIA_Parlan_NoEnter);
	Info_AddChoice(DIA_Parlan_NoEnter,"Я просто перелез через стену.",DIA_Parlan_NoEnter_UpWall);
	Info_AddChoice(DIA_Parlan_NoEnter,"Я спустился с гор.",DIA_Parlan_NoEnter_Mount);
	Info_AddChoice(DIA_Parlan_NoEnter,"Послушник Педро впустил меня.",DIA_Parlan_NoEnter_Pedro);

	if(RhetorikSkillValue[1] >= 10)
	{
		Info_AddChoice(DIA_Parlan_NoEnter,"А что это за место?",DIA_Parlan_NoEnter_NoKill);
	};
};

func void DIA_Parlan_NoEnter_UpWall()
{
	AI_Output(other,self,"DIA_Parlan_NoEnter_UpWall_01_00");	//Я просто перелез через стену.
	AI_Output(self,other,"DIA_Parlan_NoEnter_UpWall_01_01");	//(гневно) Да, ты перелез! И это очень плохо для тебя.
	AI_Output(self,other,"DIA_Parlan_NoEnter_UpWall_01_02");	//Ты хоть знаешь, что это за место?!
	AI_Output(other,self,"DIA_Parlan_NoEnter_UpWall_01_03");	//И что?
	AI_Output(self,other,"DIA_Parlan_NoEnter_UpWall_01_04");	//(в ярости) Это монастырь магов Огня! Священная обитель самого Инноса!
	AI_Output(self,other,"DIA_Parlan_NoEnter_UpWall_01_05");	//Только маги и послушники этого монастыря могут находиться тут.
	AI_Output(self,other,"DIA_Parlan_NoEnter_UpWall_01_06");	//Извини, но ты не оставляешь мне выбора.
	AI_Output(self,other,"DIA_Parlan_NoEnter_UpWall_01_07");	//За свое святотатство тебе придется заплатить собственной жизнью!
	AI_Output(self,other,"DIA_Parlan_PETZMASTER_08_50");		//Гнев Инноса покарает тебя быстрее, чем ты сам это осознаешь...
	Info_ClearChoices(DIA_Parlan_NoEnter);
	Info_AddChoice(DIA_Parlan_NoEnter,"Эй, постой!..",DIA_Parlan_NoEnter_Attack);
};

func void DIA_Parlan_NoEnter_Mount()
{
	AI_Output(other,self,"DIA_Parlan_NoEnter_Mount_01_00");	//Я спустился с гор.
	AI_Output(self,other,"DIA_Parlan_NoEnter_Mount_01_01");	//(гневно) Что?! Что за бред ты несешь!
	AI_Output(self,other,"DIA_Parlan_NoEnter_Mount_01_02");	//Ты хоть знаешь, что это за место?!
	AI_Output(other,self,"DIA_Parlan_NoEnter_Mount_01_03");	//И что?
	AI_Output(self,other,"DIA_Parlan_NoEnter_Mount_01_04");	//(в ярости) Это монастырь магов Огня! Священная обитель самого Инноса!
	AI_Output(self,other,"DIA_Parlan_NoEnter_Mount_01_05");	//Только маги и послушники этого монастыря могут находиться тут.
	AI_Output(self,other,"DIA_Parlan_NoEnter_Mount_01_06");	//Извини, но ты не оставляешь мне выбора.
	AI_Output(self,other,"DIA_Parlan_NoEnter_Mount_01_07");	//За свое святотатство тебе придется заплатить собственной жизнью!
	AI_Output(self,other,"DIA_Parlan_PETZMASTER_08_50");		//Гнев Инноса покарает тебя быстрее, чем ты сам это осознаешь...
	Info_ClearChoices(DIA_Parlan_NoEnter);
	Info_AddChoice(DIA_Parlan_NoEnter,"Эй, постой!..",DIA_Parlan_NoEnter_Attack);
};

func void DIA_Parlan_NoEnter_Pedro()
{
	AI_Output(other,self,"DIA_Parlan_NoEnter_Pedro_01_00");	//Послушник Педро впустил меня.
	AI_Output(self,other,"DIA_Parlan_NoEnter_Pedro_01_01");	//Что?! (гневно) Ты лжешь мне! Он не мог этого сделать.
	AI_Output(self,other,"DIA_Parlan_NoEnter_Pedro_01_02");	//К тому же я не видел, чтобы ты входил через главные ворота монастыря.
	AI_Output(other,self,"DIA_Parlan_NoEnter_Pedro_01_03");	//Ну и что с того?
	AI_Output(self,other,"DIA_Parlan_NoEnter_Pedro_01_04");	//(в ярости) А то, что это монастырь магов Огня! Священная обитель самого Инноса!
	AI_Output(self,other,"DIA_Parlan_NoEnter_Pedro_01_05");	//Только маги и послушники этого монастыря могут находиться тут.
	AI_Output(self,other,"DIA_Parlan_NoEnter_Pedro_01_06");	//Извини, но ты не оставляешь мне выбора.
	AI_Output(self,other,"DIA_Parlan_NoEnter_Pedro_01_07");	//За свое святотатство тебе придется заплатить собственной жизнью!
	AI_Output(self,other,"DIA_Parlan_PETZMASTER_08_50");		//Гнев Инноса покарает тебя быстрее, чем ты сам это осознаешь...
	Info_ClearChoices(DIA_Parlan_NoEnter);
	Info_AddChoice(DIA_Parlan_NoEnter,"Эй, постой!..",DIA_Parlan_NoEnter_Attack);
};

func void DIA_Parlan_NoEnter_NoKill()
{
	AI_Output(other,self,"DIA_Parlan_NoEnter_NoKill_01_00");	//А что это за место?
	AI_Output(self,other,"DIA_Parlan_NoEnter_NoKill_01_01");	//(гневно) Что?! Ты что, издеваешься надо мной?
	AI_Output(other,self,"DIA_Parlan_NoEnter_NoKill_01_02");	//Но я действительно не имею ни малейшего понятия, куда я попал.
	AI_Output(self,other,"DIA_Parlan_NoEnter_NoKill_01_03");	//(в ярости) Это монастырь магов Огня! Священная обитель самого Инноса!
	AI_Output(self,other,"DIA_Parlan_NoEnter_NoKill_01_04");	//Только маги и послушники этого монастыря могут находиться тут.
	AI_Output(other,self,"DIA_Parlan_NoEnter_NoKill_01_05");	//Монастырь Инноса?
	AI_Output(other,self,"DIA_Parlan_NoEnter_NoKill_01_06");	//Тогда я достоин только смерти, мастер!
	AI_Output(other,self,"DIA_Parlan_NoEnter_NoKill_01_07");	//Убейте меня - ибо, сам не осознавая того, я согрешил, нарушив его закон.
	AI_Output(self,other,"DIA_Parlan_NoEnter_NoKill_01_08");	//Ты сам сознался в своей вине и просишь тебя наказать?
	AI_Output(self,other,"DIA_Parlan_NoEnter_NoKill_01_09");	//Удивительно!
	AI_Output(self,other,"DIA_Parlan_NoEnter_NoKill_01_10");	//Ладно, я сохраню тебе жизнь и позволю находиться здесь.
	AI_Output(self,other,"DIA_Parlan_NoEnter_NoKill_01_11");	//Но за это тебе придется поработать на благо нашего монастыря.
	AI_Output(self,other,"DIA_Parlan_NoEnter_NoKill_01_12");	//И даже не думай легко отделаться.

	if(RhetorikSkillValue[1] < 100)
	{
		RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
		AI_Print("Риторика + 1");
	};

	CanEnterKloster = TRUE;
	Info_ClearChoices(DIA_Parlan_NoEnter);
	Info_AddChoice(DIA_Parlan_NoEnter,"Конечно, мастер.",DIA_Parlan_NoEnter_Quest);
};

func void DIA_Parlan_NoEnter_Quest()
{
	AI_Output(other,self,"DIA_Parlan_NoEnter_Quest_01_00");	//Конечно, мастер.
	AI_Output(self,other,"DIA_Parlan_NoEnter_Quest_01_01");	//Тогда слушай внимательно. Дело довольно непростое.
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_Parlan_NoEnter_Quest_01_02");	//Ты знаешь Лемара, ростовщика?


	if(Npc_KnowsInfo(hero,DIA_Lehmar_ENTSCHULDIGUNG) == TRUE)
	{
		AI_Output(other,self,"DIA_Parlan_NoEnter_Quest_01_03");	//Конечно. А в чем дело?
	}
	else
	{
		AI_Output(other,self,"DIA_Parlan_NoEnter_Quest_01_04");	//Нет. Я его не знаю.
	};


	AI_Output(self,other,"DIA_Parlan_NoEnter_Quest_01_05");	//Один из наших магов, по своей наивности или глупости, заложил у него одну очень ценную вещь.
	AI_Output(other,self,"DIA_Parlan_NoEnter_Quest_01_06");	//Что за вещь?
	AI_Output(self,other,"DIA_Parlan_NoEnter_Quest_01_07");	//Это неважно. Но она во что бы то ни стало должна быть возвращена в монастырь, и как можно скорее!
	AI_Output(other,self,"DIA_Parlan_NoEnter_Quest_01_08");	//А в чем проблема?
	AI_Output(self,other,"DIA_Parlan_NoEnter_Quest_01_09");	//Лемар решил оставить ее себе и наотрез отказался вести с нами какие-либо дела.
	AI_Output(self,other,"DIA_Parlan_NoEnter_Quest_01_10");	//А ты человек не из монастыря. У тебя есть шанс выяснить, где Лемар прячет ее.
	AI_Output(other,self,"DIA_Parlan_NoEnter_Quest_01_11");	//Ты хочешь, чтобы я украл ее для тебя?
	AI_Output(self,other,"DIA_Parlan_NoEnter_Quest_01_12");	//Мне все равно, как ты это сделаешь - главное, чтобы ты вернул ее монастырю!
	AI_Output(self,other,"DIA_Parlan_NoEnter_Quest_01_13");	//Все понятно?
	AI_Output(other,self,"DIA_Parlan_NoEnter_Quest_01_14");	//Вполне.
	AI_Output(self,other,"DIA_Parlan_NoEnter_Quest_01_15");	//Тогда ступай и постарайся не тянуть с этим.
	AI_Output(self,other,"DIA_Parlan_NoEnter_Quest_01_16");	//Вот, возьми этот ключ. Тебе не придется больше лазить по стенам, чтобы попасть сюда.
	B_GiveInvItems(self,other,ItKe_Innos_MIS,1);
	MIS_LemarTheft = LOG_Running;
	Log_CreateTopic(Topic_LemarTheft,LOG_MISSION);
	Log_SetTopicStatus(Topic_LemarTheft,LOG_Running);
	B_LogEntry(Topic_LemarTheft,"Мастер Парлан попросил меня вернуть одну вещь в монастырь. Один из магов монастыря заложил ее у ростовщика Лемара, и тот теперь не хочет возвращать ее обратно. Мне надо как-то уладить этот вопрос.");
	AI_StopProcessInfos(self);
};

func void DIA_Parlan_NoEnter_Attack()
{
	if(Npc_HasItems(self,ItRu_Pyrokinesis) == 0)
	{
		CreateInvItems(self,ItRu_Pyrokinesis,1);
	};
	AI_Output(self,other,"DIA_Parlan_PETZMASTER_08_59");	//Умри, такова воля Инноса!
	ParlanPissOff = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuildEnemy,0);
};

instance DIA_Parlan_NoEnter_PissOff(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 1;
	condition = DIA_Parlan_NoEnter_PissOff_Condition;
	information = DIA_Parlan_NoEnter_PissOff_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Parlan_NoEnter_PissOff_Condition()
{
	if((CanEnterKloster == FALSE) && (ParlanPissOff == TRUE) && (MIS_LemarTheft == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Parlan_NoEnter_PissOff_Info()
{
	if(Npc_HasItems(self,ItRu_Pyrokinesis) == 0)
	{
		CreateInvItems(self,ItRu_Pyrokinesis,1);
	};

	AI_Output(self,other,"DIA_Parlan_PETZMASTER_08_59");	//Умри, такова воля Инноса!
	ParlanPissOff = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuildEnemy,0);
};

instance DIA_Parlan_LemarTheft(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 1;
	condition = DIA_Parlan_LemarTheft_Condition;
	information = DIA_Parlan_LemarTheft_Info;
	permanent = FALSE;
	description = "Я принес утерянную реликвию.";
};


func int DIA_Parlan_LemarTheft_Condition()
{
	if((Npc_HasItems(hero,ItMi_ParlanRelic_MIS) >= 1) && (MIS_LemarTheft == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Parlan_LemarTheft_Info()
{	
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Parlan_LemarTheft_01_00");	//Я принес утерянную реликвию.
	AI_Output(self,other,"DIA_Parlan_LemarTheft_01_01");	//Правда? Тогда немедленно отдай ее мне!
	AI_Output(other,self,"DIA_Parlan_LemarTheft_01_02");	//Конечно, мастер.
	B_GiveInvItems(other,self,ItMi_ParlanRelic_MIS,1);
	Npc_RemoveInvItems(self,ItMi_ParlanRelic_MIS,1);
	AI_Output(self,other,"DIA_Parlan_LemarTheft_01_03");	//Хорошо. Теперь уж я позабочусь о том, чтобы она больше никогда не покинула стен монастыря.

	if((hero.guild != GIL_KDF) && (hero.guild != GIL_KDW) && (hero.guild != GIL_NOV) && (hero.guild != GIL_PAL))
	{
		AI_Output(self,other,"DIA_Parlan_LemarTheft_01_04");	//Что же касается тебя - прими мою искреннюю благодарность.
		AI_Output(self,other,"DIA_Parlan_LemarTheft_01_05");	//Я вижу, что не ошибся в своем выборе.
		AI_Output(self,other,"DIA_Parlan_LemarTheft_01_06");	//Теперь ты можешь оставаться здесь, если захочешь. 
		AI_Output(self,other,"DIA_Parlan_LemarTheft_01_07");	//Однако помни, что доступ в некоторые части монастыря для тебя все так же закрыт.
	}
	else
	{
		AI_Output(self,other,"DIA_Parlan_LemarTheft_01_09");	//Что же касается тебя, то прими мою искреннюю благодарность.
		AI_Output(self,other,"DIA_Parlan_LemarTheft_01_10");	//Да благословит тебя Иннос!
	};

	MIS_LemarTheft = LOG_Success;
	Log_SetTopicStatus(Topic_LemarTheft,LOG_Success);
	B_LogEntry(Topic_LemarTheft,"Парлан был доволен тем, что мне удалось вырвать из рук Лемара реликвию монастыря.");
	AI_StopProcessInfos(self);
};

instance DIA_Parlan_WELCOME(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 1;
	condition = DIA_Parlan_WELCOME_Condition;
	information = DIA_Parlan_WELCOME_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Parlan_WELCOME_Condition()
{
	if(other.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void B_DIA_Parlan_WELCOME_GoForTribute()
{
	AI_Output(self,other,"DIA_Parlan_WELCOME_05_09");	//Когда с этим будет покончено, мы поговорим о твоей работе здесь, в монастыре.
};

func void B_DIA_Parlan_WELCOME_BringTribute2Gorax()
{
	AI_Output(self,other,"DIA_Addon_Parlan_WELCOME_05_00");	//Отнеси свое пожертвование Гораксу. Он им распорядится.
};

func void DIA_Parlan_WELCOME_Info()
{
	AI_Output(self,other,"DIA_Parlan_WELCOME_05_00");	//Добро пожаловать, новый послушник. Я Парлан.
	AI_Output(other,self,"DIA_Parlan_WELCOME_15_01");	//А я...
	AI_Output(self,other,"DIA_Parlan_WELCOME_05_02");	//ПОСЛУШНИК!...(прерывает) Не важно, кем ты был раньше. Теперь ты слуга Инноса. Только это имеет значение.
	AI_Output(self,other,"DIA_Parlan_WELCOME_05_03");	//И с принятием в Братство Огня, все твои предыдущие прегрешения будут забыты.
	AI_Output(self,other,"DIA_Parlan_WELCOME_05_04");	//Да благословит Иннос этого человека, отдавшего свою жизнь служению Ему, и смоет все его грехи.
	AI_Output(other,self,"DIA_Parlan_WELCOME_15_05");	//И что теперь?
	AI_Output(self,other,"DIA_Parlan_WELCOME_05_06");	//Прежде всего, ты должен выполнять свои обязанности послушника. Ты будешь работать и служить Братству.
	B_GrantAbsolution(LOC_ALL);
	Snd_Play("LEVELUP");
	Log_CreateTopic(Topic_Gemeinschaft,LOG_MISSION);
	Log_SetTopicStatus(Topic_Gemeinschaft,LOG_Running);
	B_LogEntry(Topic_Gemeinschaft,"Как послушник, я обязан выполнять работу в монастыре.");
	INNOSCRIMECOUNT = 0;

	if(INNOSPRAYCOUNT < 0)
	{
		INNOSPRAYCOUNT = 0;
	}
	else
	{
		INNOSPRAYCOUNT = INNOSPRAYCOUNT + 5;
	};

	BELIARPRAYCOUNT = BELIARPRAYCOUNT - 5;

	if(Pedro_NOV_Aufnahme_LostInnosStatue_Daron == FALSE)
	{
		if(Liesel_Giveaway == FALSE)
		{
			AI_Output(self,other,"DIA_Parlan_WELCOME_05_07");	//Но сначала отведи свою овцу к Ополосу, он позаботится о ней.
		};
		if(DIA_Gorax_GOLD_perm == FALSE)
		{
			AI_Output(self,other,"DIA_Parlan_WELCOME_05_08");	//Ты можешь отдать все свое золото Гораксу, нашему управляющему. Ты найдешь его в винодельне.
			B_DIA_Parlan_WELCOME_GoForTribute();
		};
	}
	else if(DIA_Gorax_GOLD_perm == FALSE)
	{
		B_DIA_Parlan_WELCOME_BringTribute2Gorax();
		B_DIA_Parlan_WELCOME_GoForTribute();
	};
};


instance DIA_Parlan_Auge(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 2;
	condition = DIA_Parlan_Auge_Condition;
	information = DIA_Parlan_Auge_Info;
	permanent = FALSE;
	description = "Я ищу Глаз Инноса.";
};


func int DIA_Parlan_Auge_Condition()
{
	if(Kapitel <= 2)
	{
		return TRUE;
	};
};

func void DIA_Parlan_Auge_Info()
{
	AI_Output(other,self,"DIA_Parlan_Auge_15_00");	//Я ищу Глаз Инноса.
	AI_Output(self,other,"DIA_Parlan_Auge_05_01");	//Я не знаю, кто сказал тебе о нем, но к этому божественному артефакту никто не смеет прикасаться.
	AI_Output(other,self,"DIA_Parlan_Auge_15_02");	//Где хранится Глаз Инноса?
	AI_Output(self,other,"DIA_Parlan_Auge_05_03");	//Очень немногие знают эту тайну. Попробуй найти его - и тебе это не удастся.
};


instance DIA_Parlan_Amulett(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 3;
	condition = DIA_Parlan_Amulett_Condition;
	information = DIA_Parlan_Amulett_Info;
	permanent = FALSE;
	description = "Расскажи мне о Глазе Инноса.";
};


func int DIA_Parlan_Amulett_Condition()
{
	if((Kapitel <= 2) && Npc_KnowsInfo(other,DIA_Parlan_Auge))
	{
		return TRUE;
	};
};

func void DIA_Parlan_Amulett_Info()
{
	AI_Output(other,self,"DIA_Parlan_Amulett_15_00");	//Расскажи мне о Глазе Инноса.
	AI_Output(self,other,"DIA_Parlan_Amulett_05_01");	//Хорошо. Глаз Инноса содержит частицу божественной силы Инноса. Только ОДИН избранный слуга Инноса может носить этот амулет.
	AI_Output(self,other,"DIA_Parlan_Amulett_05_02");	//Он был создан, чтобы защитить нас от сил Зла, когда придет время.
};


instance DIA_Parlan_Hagen(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 2;
	condition = DIA_Parlan_Hagen_Condition;
	information = DIA_Parlan_Hagen_Info;
	permanent = FALSE;
	description = "Я должен поговорить с командующим паладинами!";
};


func int DIA_Parlan_Hagen_Condition()
{
	if((Kapitel <= 2) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Parlan_Hagen_Info()
{
	AI_Output(other,self,"DIA_Parlan_Hagen_15_00");	//Я должен поговорить с командующим паладинами!
	AI_Output(self,other,"DIA_Parlan_Hagen_05_01");	//Лорд Хаген не принимает послушников - только магам позволено видеть его.
};

instance DIA_Parlan_WORK(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 2;
	condition = DIA_Parlan_WORK_Condition;
	information = DIA_Parlan_WORK_Info;
	permanent = TRUE;
	description = "Чем я могу служить общине?";
};

func int DIA_Parlan_WORK_Condition()
{
	if((Kapitel == 1) && (Npc_KnowsInfo(other,DIA_Parlan_KNOWSJUDGE) == FALSE) && Npc_KnowsInfo(other,DIA_Parlan_WELCOME) && (DIA_Parlan_WORK_perm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Parlan_WORK_Info()
{
	AI_Output(other,self,"DIA_Parlan_WORK_15_00");	//Чем я могу служить общине?
	if((Liesel_Giveaway == FALSE) || (DIA_Gorax_GOLD_perm == FALSE))
	{
		AI_Output(self,other,"DIA_Parlan_WELCOME_05_06");	//Прежде всего, ты должен выполнять свои обязанности послушника. Ты будешь работать и служить Братству.
		if(Liesel_Giveaway == FALSE)
		{
			AI_Output(self,other,"DIA_Parlan_WELCOME_05_07");	//Но сначала отведи свою овцу к Ополосу, он позаботится о ней.
		};
		if(DIA_Gorax_GOLD_perm == FALSE)
		{
			if(Pedro_NOV_Aufnahme_LostInnosStatue_Daron == TRUE)
			{
				B_DIA_Parlan_WELCOME_BringTribute2Gorax();
				B_DIA_Parlan_WELCOME_GoForTribute();
			}
			else
			{
				AI_Output(self,other,"DIA_Parlan_WELCOME_05_08");	//Ты можешь отдать все свое золото Гораксу, нашему управляющему. Ты найдешь его в винодельне.
				AI_Output(self,other,"DIA_Parlan_WELCOME_05_09");	//Когда с этим будет покончено, мы поговорим о твоей работе здесь, в монастыре.
			};
		};
		AI_StopProcessInfos(self);
	}
	else if(Wld_IsTime(22,0,7,30))
	{
		AI_Output(self,other,"DIA_Parlan_WORK_NIGHT_05_01");	//Сейчас время мира. Работа послушников начинается рано утром и продолжается дотемна.
		AI_Output(self,other,"DIA_Parlan_WORK_NIGHT_05_02");	//Ты тоже должен спать. Возвращайся ко мне, когда придет время работы.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Parlan_WORK_05_03");	//Поговори с другими магами. Они дадут тебе поручения.
		AI_Output(self,other,"DIA_Parlan_WORK_05_04");	//Я буду наблюдать за твоей работой, и если ты хорошо будешь справляться с ней, ты получишь позволение войти в библиотеку, чтобы изучать учение Инноса.
		DIA_Parlan_WORK_perm = TRUE;
		MIS_KlosterArbeit = LOG_Running;
		B_LogEntry(Topic_Gemeinschaft,"Если я выполню все задания магов, мне будет даровано право посещать библиотеку.");
		AI_Output(self,other,"DIA_Parlan_WORK_01_01");	//Да, и чуть не забыл...(ворчливо) Тебе ведь нужна роба послушника.
		AI_Output(other,self,"DIA_Parlan_WORK_01_02");	//А что, с этим есть какие-то проблемы?
		AI_Output(self,other,"DIA_Parlan_WORK_01_03");	//Дело в том, что у нас закончилась ткань, из которой твои братья всегда шили одежду для новичков.
		AI_Output(self,other,"DIA_Parlan_WORK_01_04");	//Долгие годы эту ткань мы приобретали у гильдии торговцев Хориниса.
		AI_Output(self,other,"DIA_Parlan_WORK_01_05");	//Но из-за войны с орками поставок с континента не было уже очень давно, а наши запасы подошли к концу.
		AI_Output(other,self,"DIA_Parlan_WORK_01_06");	//И что же теперь делать?
		AI_Output(self,other,"DIA_Parlan_WORK_01_07");	//Хороший вопрос. Вот что! Найди торговца Эрола и спроси его, не осталось ли у него немного товара.
		AI_Output(other,self,"DIA_Parlan_WORK_01_08");	//А почему именно его?
		AI_Output(self,other,"DIA_Parlan_WORK_01_09");	//Эрол сам когда-то состоял в гильдии торговцев. Он был одним из крупнейших торговцев тканями во всем Хоринисе. 
		AI_Output(self,other,"DIA_Parlan_WORK_01_10");	//Мы уже обращались к другим торговцам, но все безрезультатно.
		AI_Output(self,other,"DIA_Parlan_WORK_01_11");	//Так что поговори с ним.
		Log_CreateTopic(TOPIC_ROBAMATERIAL,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ROBAMATERIAL,LOG_Running);
		MIS_ROBAMATERIAL = LOG_Running;
		B_LogEntry(TOPIC_ROBAMATERIAL,"Мастер Парлан не выдал мне робу послушника, так как у него нет нужного материала для ее пошива. Мне стоит узнать, нет ли подходящей ткани у Эрола.");
	};
};

instance DIA_PARLAN_ROBAMATERIAL(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 1;
	condition = DIA_PARLAN_ROBAMATERIAL_condition;
	information = DIA_PARLAN_ROBAMATERIAL_info;
	permanent = TRUE;
	description = "Я принес ткань для роб.";
};

func int DIA_PARLAN_ROBAMATERIAL_condition()
{
	if((MIS_ROBAMATERIAL == LOG_Running) && (Npc_HasItems(other,itmi_novmaterial) >= 1))
	{
		return TRUE;
	};
};

func void DIA_PARLAN_ROBAMATERIAL_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_PARLAN_ROBAMATERIAL_01_01");	//Я принес ткань для роб.
	AI_Output(self,other,"DIA_PARLAN_ROBAMATERIAL_01_02");	//Покажи ее.
	B_GiveInvItems(other,self,itmi_novmaterial,1);
	AI_Output(self,other,"DIA_PARLAN_ROBAMATERIAL_01_03");	//Да, это она. Пожалуй, такого количества нам хватит на пару лет.
	AI_Output(self,other,"DIA_PARLAN_ROBAMATERIAL_01_04");	//Кстати, мастер Горакс порылся в кладовке и отыскал там вот эту робу послушника.
	AI_Output(self,other,"DIA_PARLAN_ROBAMATERIAL_01_05");	//Она, конечно, не новая, но зато тебе в пору. Не ждать же тебе месяц, пока братья сошьют новую.
	B_GiveInvItems(self,other,ItAr_NOV_L,1);
	MIS_ROBAMATERIAL = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_ROBAMATERIAL,LOG_SUCCESS);
	B_LogEntry(TOPIC_ROBAMATERIAL,"Я принес Парлану ткань для робы. А он выдал робу, которую случайно отыскали в кладовой монастыря.");
};

instance DIA_Parlan_Stand(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 23;
	condition = DIA_Parlan_Stand_Condition;
	information = DIA_Parlan_Stand_Info;
	permanent = TRUE;
	description = "Могу я войти в библиотеку?";
};


func int DIA_Parlan_Stand_Condition()
{
	if((MIS_KlosterArbeit == LOG_Running) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Parlan_Stand_Info()
{
	Kloster_Punkte = 0;
	AI_Output(other,self,"DIA_Parlan_Stand_15_00");	//Могу я войти в библиотеку?

	if(MIS_NeorasPflanzen == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_01");	//Ты принес огненную крапиву брату Неорасу.
		Kloster_Punkte = Kloster_Punkte + 2;
	};
	if(MIS_NeorasRezept == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_02");	//Ты нашел рецепт брата Неораса.
		Kloster_Punkte = Kloster_Punkte + 2;
	};
	if(MIS_IsgarothWolf == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_03");	//Ты убил черного волка, терроризировавшего часовню.
		Kloster_Punkte = Kloster_Punkte + 1;
	};
	if(MIS_ParlanFegen == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_04");	//Ты смог найти четырех послушников и подмести кельи.
		Kloster_Punkte = Kloster_Punkte + 3;
	};
	if(MIS_GoraxEssen == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_05");	//Ты честно раздал еду послушникам, как и просил тебя брат Горакс.
		Kloster_Punkte = Kloster_Punkte + 1;
	}
	else if(MIS_GoraxEssen == LOG_FAILED)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_06");	//Горакс неудовлетворен тобой, так как нечестно распределил еду.
	};
	if(MIS_GoraxWein == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_07");	//Ты продал вино, как того и хотел Горакс.
		Kloster_Punkte = Kloster_Punkte + 1;
	}
	else if(MIS_GoraxWein == LOG_FAILED)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_08");	//Чем меньше мы будем говорить о вине, тем лучше...
	};
	if((Kloster_Punkte >= 8) && (MIS_ROBAMATERIAL == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_09");	//Да, ты хорошо поработал. Теперь пришло время начать постигать учение Инноса. Поговори с мастером Хигласом в библиотеке.
		AI_Output(self,other,"DIA_Parlan_Stand_05_10");	//Я выдаю тебе этот ключ.
		Parlan_Erlaubnis = TRUE;
		MIS_KlosterArbeit = LOG_SUCCESS;
		Wld_AssignRoomToGuild("Kloster02",GIL_PUBLIC);
		B_GiveInvItems(self,other,ItKe_KlosterBibliothek,1);
		KlosterKeyGive = TRUE;

		if(MIS_NeorasPflanzen == LOG_Running)
		{
			MIS_NeorasPflanzen = LOG_OBSOLETE;
		};
		if(MIS_NeorasRezept == LOG_Running)
		{
			MIS_NeorasRezept = LOG_OBSOLETE;
		};
		if(MIS_IsgarothWolf == LOG_Running)
		{
			MIS_IsgarothWolf = LOG_OBSOLETE;
		};
		if(MIS_ParlanFegen == LOG_Running)
		{
			MIS_ParlanFegen = LOG_OBSOLETE;
		};
		if(MIS_GoraxEssen == LOG_Running)
		{
			MIS_GoraxEssen = LOG_OBSOLETE;
		};
		if(MIS_GoraxWein == LOG_Running)
		{
			MIS_GoraxWein = LOG_OBSOLETE;
		};
		if(MIS_MardukBeten == LOG_Running)
		{
			MIS_MardukBeten = LOG_OBSOLETE;
		};
	}
	else if(Kloster_Punkte >= 1)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_11");	//Ты работал, конечно, но пока ты должен продолжать служить общине.
	}
	else if((MIS_ROBAMATERIAL != LOG_SUCCESS) && (Kloster_Punkte >= 8))
	{
		AI_Output(self,other,"DIA_Parlan_WORK_99_13");	//Да, ты хорошо поработал. Теперь пришло время начать постигать учение Инноса. Но сначала ты должен получить робу послушника, так гласит закон Инноса!
	}
	else
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_12");	//Сначала выполни свои поручения на благо общины. А когда ты закончишь свою работу, мы вернемся к этому разговору.
	};
};


instance DIA_Parlan_Aufgabe(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 10;
	condition = DIA_Parlan_Aufgabe_Condition;
	information = DIA_Parlan_Aufgabe_Info;
	permanent = FALSE;
	description = "У тебя есть какое-нибудь задание для меня?";
};

func int DIA_Parlan_Aufgabe_Condition()
{
	if(MIS_KlosterArbeit == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Parlan_Aufgabe_Info()
{
	AI_Output(other,self,"DIA_Parlan_Aufgabe_15_00");	//У тебя есть поручения для меня?
	AI_Output(self,other,"DIA_Parlan_Aufgabe_05_01");	//Хмм... Да, ты, действительно можешь сделать кое-что для общины.
	AI_Output(self,other,"DIA_Parlan_Aufgabe_05_02");	//Кельям послушников не помешает хорошая уборка. Позаботься об этом.
	AI_Output(other,self,"DIA_Parlan_Aufgabe_15_03");	//Но это займет целую вечность...
	AI_Output(self,other,"DIA_Parlan_Aufgabe_05_04");	//Тогда тебе лучше не терять время попусту, разве нет?
	AI_Output(self,other,"DIA_Parlan_Aufgabe_05_05");	//И кстати, комната мага недалеко от алтаря Инноса также нуждается в уборке.
	MIS_ParlanFegen = LOG_Running;
	Log_CreateTopic(Topic_ParlanFegen,LOG_MISSION);
	Log_SetTopicStatus(Topic_ParlanFegen,LOG_Running);
	B_LogEntry(Topic_ParlanFegen,"Мастер Парлан хочет, чтобы я подмел кельи четырех послушников. Недалеко от алтаря Инноса есть комната мага, которая также нуждается в уборке. Это займет целую вечность.");
};


instance DIA_Parlan_Fegen(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 3;
	condition = DIA_Parlan_Fegen_Condition;
	information = DIA_Parlan_Fegen_Info;
	permanent = TRUE;
	description = "Насчет келий послушников...";
};


var int DIA_Parlan_Fegen_permanent;

func int DIA_Parlan_Fegen_Condition()
{
	if((MIS_ParlanFegen == LOG_Running) && (DIA_Parlan_Fegen_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Parlan_Fegen_Info()
{
	AI_Output(other,self,"DIA_Parlan_Fegen_15_00");	//Насчет келий послушников...
	if(NOV_Helfer >= 5)
	{
		AI_Output(self,other,"DIA_Parlan_Fegen_05_01");	//Тебе удалось найти четырех послушников себе в помощь. Я думаю, теперь они могут вернуться к своей работе.
		AI_Output(self,other,"DIA_Parlan_Fegen_05_02");	//Отлично, послушник. Ты выполнил мое поручение.
		MIS_ParlanFegen = LOG_SUCCESS;
		B_GivePlayerXP(XP_ParlanFegen);
		DIA_Parlan_Fegen_permanent = TRUE;
		B_StartOtherRoutine(Feger1,"START");
		B_StartOtherRoutine(Feger2,"START");
		B_StartOtherRoutine(Feger3,"START");
		B_StartOtherRoutine(Babo,"START");
	}
	else
	{
		AI_Output(self,other,"DIA_Parlan_Fegen_05_03");	//Бесспорно - это непростая задача. Но с помощью Инноса ты справишься.
	};
};


instance DIA_Parlan_LEARN(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 23;
	condition = DIA_Parlan_LEARN_Condition;
	information = DIA_Parlan_LEARN_Info;
	permanent = FALSE;
	description = "Как мне изучить основы магии?";
};


func int DIA_Parlan_LEARN_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Parlan_Hagen) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Parlan_LEARN_Info()
{
	AI_Output(other,self,"DIA_Parlan_LEARN_15_00");	//Как мне изучить основы магии?
	AI_Output(self,other,"DIA_Parlan_LEARN_05_01");	//Ты здесь не для того, чтобы получить дар магии. Ты здесь, чтобы служить Инносу.
	AI_Output(self,other,"DIA_Parlan_LEARN_05_02");	//Но я могу показать тебе, как повысить твои магические способности.
	B_LogEntry(Topic_KlosterTeacher,"Мастер Парлан может помочь мне повысить мою магическую энергию.");
};


instance DIA_Parlan_KNOWSJUDGE(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 23;
	condition = DIA_Parlan_KNOWSJUDGE_Condition;
	information = DIA_Parlan_KNOWSJUDGE_Info;
	permanent = FALSE;
	description = "Я хочу пройти Испытание Огнем.";
};


func int DIA_Parlan_KNOWSJUDGE_Condition()
{
	if((other.guild == GIL_NOV) && (KNOWS_FIRE_CONTEST == TRUE) && (Npc_KnowsInfo(hero,DIA_Pyrokar_FIRE) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Parlan_KNOWSJUDGE_Info()
{
	AI_Output(other,self,"DIA_Parlan_KNOWSJUDGE_15_00");	//Я хочу пройти Испытание Огнем.
	AI_Output(self,other,"DIA_Parlan_KNOWSJUDGE_05_01");	//Что?.. Хм... (удостоверяясь) Ты это действительно серьезно?
	AI_Output(other,self,"DIA_Parlan_KNOWSJUDGE_15_02");	//Я настаиваю.
	AI_Output(self,other,"DIA_Parlan_KNOWSJUDGE_05_03");	//Ты необычный послушник. Хорошо, если ты настаиваешь, поговори с мастером Пирокаром.
	B_LogEntry(TOPIC_FireContest,"Если я хочу потребовать пройти Испытание Огнем, я должен поговорить с мастером Пирокаром.");
};

instance DIA_Parlan_TEACH_MANA(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 10;
	condition = DIA_Parlan_TEACH_MANA_Condition;
	information = DIA_Parlan_TEACH_MANA_Info;
	permanent = TRUE;
	description = "Я хочу повысить мои магические способности.";
};

func int DIA_Parlan_TEACH_MANA_Condition()
{
	if((other.guild == GIL_KDF) || (other.guild == GIL_PAL) || (other.guild == GIL_NOV))
	{
		if((Npc_KnowsInfo(hero,DIA_Parlan_LEARN) == TRUE) && ((Parlan_Sends == FALSE) || (VATRAS_TEACHREGENMANA == FALSE)))
		{
			return TRUE;
		};
	};
};

func void DIA_Parlan_TEACH_MANA_Info()
{
	AI_Output(other,self,"DIA_Parlan_TEACH_MANA_15_00");	//Я хочу повысить мои магические способности
	Info_ClearChoices(DIA_Parlan_TEACH_MANA);
	Info_AddChoice(DIA_Parlan_TEACH_MANA,Dialog_Back,DIA_Parlan_TEACH_MANA_BACK);
	Info_AddChoice(DIA_Parlan_TEACH_MANA,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Parlan_TEACH_MANA_1);
	Info_AddChoice(DIA_Parlan_TEACH_MANA,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Parlan_TEACH_MANA_5);

	if((Kapitel >= 2) && (other.guild == GIL_KDF) && (VATRAS_TEACHREGENMANA == FALSE))
	{
		Info_AddChoice(DIA_Parlan_TEACH_MANA,"Регенерация маны (Очки обучения: 10, Цена: 10000 монет)",DIA_Parlan_TEACH_MANA_Regen);
	};
};

func void DIA_Parlan_TEACH_MANA_BACK()
{
	if(other.attribute[ATR_MANA_MAX] >= T_MED)
	{
		AI_Output(self,other,"DIA_Parlan_TEACH_MANA_05_00");	//Твоя магическая энергия выросла. Я не могу помочь тебе повысить ее еще больше.
		AI_Output(self,other,"DIA_Parlan_TEACH_MANA_05_01");	//Если ты хочешь научиться большему, поговори с Пирокаром.
		Parlan_Sends = TRUE;
	};

	Info_ClearChoices(DIA_Parlan_TEACH_MANA);
};

func void DIA_Parlan_TEACH_MANA_Regen()
{
	var int kosten;
	var int money;

	AI_Output(other,self,"DIA_Vatras_Teach_regen_15_05");	//Научи меня регенерации маны.

	kosten = 10;
	money = 10000;

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

	Info_ClearChoices(DIA_Parlan_TEACH_MANA);
	Info_AddChoice(DIA_Parlan_TEACH_MANA,Dialog_Back,DIA_Parlan_TEACH_MANA_BACK);
	Info_AddChoice(DIA_Parlan_TEACH_MANA,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Parlan_TEACH_MANA_1);
	Info_AddChoice(DIA_Parlan_TEACH_MANA,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Parlan_TEACH_MANA_5);
};

func void DIA_Parlan_TEACH_MANA_1()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,1,T_MED);
	Info_ClearChoices(DIA_Parlan_TEACH_MANA);
	Info_AddChoice(DIA_Parlan_TEACH_MANA,Dialog_Back,DIA_Parlan_TEACH_MANA_BACK);
	Info_AddChoice(DIA_Parlan_TEACH_MANA,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Parlan_TEACH_MANA_1);
	Info_AddChoice(DIA_Parlan_TEACH_MANA,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Parlan_TEACH_MANA_5);

	if((Kapitel >= 2) && (hero.guild == GIL_KDF) && (VATRAS_TEACHREGENMANA == FALSE))
	{
		Info_AddChoice(DIA_Parlan_TEACH_MANA,"Регенерация маны (Очки обучения: 15, Цена: 5000 монет)",DIA_Parlan_TEACH_MANA_Regen);
	};
};

func void DIA_Parlan_TEACH_MANA_5()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,5,T_MED);
	Info_ClearChoices(DIA_Parlan_TEACH_MANA);
	Info_AddChoice(DIA_Parlan_TEACH_MANA,Dialog_Back,DIA_Parlan_TEACH_MANA_BACK);
	Info_AddChoice(DIA_Parlan_TEACH_MANA,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Parlan_TEACH_MANA_1);
	Info_AddChoice(DIA_Parlan_TEACH_MANA,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Parlan_TEACH_MANA_5);

	if((Kapitel >= 2) && (hero.guild == GIL_KDF) && (VATRAS_TEACHREGENMANA == FALSE))
	{
		Info_AddChoice(DIA_Parlan_TEACH_MANA,"Регенерация маны (Очки обучения: 15, Цена: 5000 монет)",DIA_Parlan_TEACH_MANA_Regen);
	};
};

instance DIA_Parlan_MAGE(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 2;
	condition = DIA_Parlan_MAGE_Condition;
	information = DIA_Parlan_MAGE_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Parlan_MAGE_Condition()
{
	if((other.guild == GIL_KDF) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Parlan_MAGE_Info()
{
	AI_Output(self,other,"DIA_Parlan_MAGE_05_00");	//Ты принес клятву, брат. Добро пожаловать в наши ряды.
	AI_Output(self,other,"DIA_Parlan_MAGE_05_01");	//Я научу тебя первому Кругу магии, когда у тебя будет достаточно опыта.
	AI_Output(self,other,"DIA_Parlan_MAGE_05_02");	//Возьми этот рунный камень в качестве символа силы, которая теперь находится в твоих руках.
	B_GiveInvItems(self,other,ItMi_RuneBlank,1);
	AI_Output(self,other,"DIA_Parlan_MAGE_05_03");	//И, брат мой... у монастыря давно не меняли крышу, а посему прошу тебя с пониманием отнестись к тому, что обучение для тебя будет... кхм... не совсем бесплатным...
};


instance DIA_Parlan_CIRCLE1(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 99;
	condition = DIA_Parlan_CIRCLE1_Condition;
	information = DIA_Parlan_CIRCLE1_Info;
	permanent = TRUE;
	description = "Научи меня первому Кругу магии. (Очков обучения: 20)";
};


func int DIA_Parlan_CIRCLE1_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Parlan_MAGE) && (other.guild == GIL_KDF) && (Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 0))
	{
		return TRUE;
	};
};

func void DIA_Parlan_CIRCLE1_Info()
{
	AI_Output(other,self,"DIA_Parlan_TECH_CIRCLE1_15_00");	//Научи меня первому Кругу магии.

	if(B_TeachMagicCircle(self,other,1))
	{
		AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE1_05_01");	//Первый Круг магии позволит тебе использовать руны, созданные тобой.
		AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE1_05_02");	//Теперь ты достоин узнать формулы заклинаний для создания собственных рун.
	};
};


instance DIA_Parlan_CIRCLE2(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 99;
	condition = DIA_Parlan_CIRCLE2_Condition;
	information = DIA_Parlan_CIRCLE2_Info;
	permanent = TRUE;
	description = "Научи меня второму Кругу магии. (Очков обучения: 30)";
};


func int DIA_Parlan_CIRCLE2_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Parlan_MAGE) && (other.guild == GIL_KDF) && (Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 1))
	{
		return TRUE;
	};
};

func void DIA_Parlan_CIRCLE2_Info()
{
	AI_Output(other,self,"DIA_Parlan_TECH_CIRCLE2_15_00");	//Научи меня второму Кругу магии.

	if(Kapitel >= 2)
	{
		if(B_TeachMagicCircle(self,other,2))
		{
			AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE2_05_01");	//Войди во второй Круг и научись использовать более сильную магию.
			AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE2_05_02");	//Но также помни, что на тебе лежит большой груз ответственности. Не передо мной и Пирокаром - перед Инносом.
			AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE2_05_03");	//Он покажет тебе направление - но путь формируют твои дела.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE2_05_04");	//Время еще не пришло.
	};
};


instance DIA_Parlan_CIRCLE3(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 99;
	condition = DIA_Parlan_CIRCLE3_Condition;
	information = DIA_Parlan_CIRCLE3_Info;
	permanent = TRUE;
	description = "Научи меня третьему Кругу магии. (Очков обучения: 40)";
};


func int DIA_Parlan_CIRCLE3_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Parlan_MAGE) && (other.guild == GIL_KDF) && (Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 2))
	{
		return TRUE;
	};
};

func void DIA_Parlan_CIRCLE3_Info()
{
	AI_Output(other,self,"DIA_Parlan_TECH_CIRCLE3_15_00");	//Научи меня третьему Кругу магии.
	if(Kapitel >= 3)
	{
		if(B_TeachMagicCircle(self,other,3))
		{
			AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE3_05_01");	//Да, время пришло. Войди в третий Круг магии. Тебя ждут новые заклинания.
			AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE3_05_02");	//Они тебе понадобятся - Зло хочет погрузить землю в хаос, и остановить его можно только с помощью силы Инноса.
			AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE3_05_03");	//Я научил тебя всем Кругам, которыми владею сам. Каррас введет тебя в другие Круги.
			B_LogEntry(Topic_KlosterTeacher,"Брат Парлан обучил меня первым трем Кругам. Брат Каррас поможет мне изучить следующие Круги.");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE3_05_04");	//Для изучения третьего Круга еще не пришло время.
	};
};


instance DIA_Parlan_TEACH(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 3;
	condition = DIA_Parlan_TEACH_Condition;
	information = DIA_Parlan_TEACH_Info;
	permanent = TRUE;
	description = "Научи меня создавать руны.";
};


func int DIA_Parlan_TEACH_Condition()
{
	if(other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void DIA_Parlan_TEACH_Info()
{
	var int abletolearn;
	abletolearn = 0;
	AI_Output(other,self,"DIA_Parlan_TEACH_15_00");	//Обучи меня!
	Info_ClearChoices(DIA_Parlan_TEACH);
	Info_AddChoice(DIA_Parlan_TEACH,Dialog_Back,DIA_Parlan_TEACH_BACK);
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2) && (PLAYER_TALENT_RUNES[SPL_InstantFireball] == FALSE))
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(DIA_Parlan_TEACH,b_buildlearnstringforrunes(NAME_SPL_InstantFireball,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_InstantFireball)),dia_parlan_teach_instantfireball);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2) && (PLAYER_TALENT_RUNES[SPL_RapidFirebolt] == FALSE) && (LegoSpells == TRUE))
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(DIA_Parlan_TEACH,b_buildlearnstringforrunes(NAME_SPL_RapidFirebolt,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_RapidFirebolt)),dia_parlan_teach_RapidFirebolt);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3) && (PLAYER_TALENT_RUNES[SPL_Firestorm] == FALSE))
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(DIA_Parlan_TEACH,b_buildlearnstringforrunes(NAME_SPL_Firestorm,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Firestorm)),dia_parlan_teach_firestorm);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3) && (PLAYER_TALENT_RUNES[80] == FALSE))
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(DIA_Parlan_TEACH,b_buildlearnstringforrunes(NAME_SPL_SUMMONFIREGOLEM,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_SUMMONFIREGOLEM)),dia_parlan_teach_summonfiregolem);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3) && (PLAYER_TALENT_RUNES[SPL_MagicCage] == FALSE))
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(DIA_Parlan_TEACH,b_buildlearnstringforrunes(NAME_SPL_MagicCage,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_MagicCage)),dia_parlan_teach_MagicCage);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 4) && (PLAYER_TALENT_RUNES[SPL_ChargeFireball] == FALSE))
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(DIA_Parlan_TEACH,b_buildlearnstringforrunes(NAME_SPL_ChargeFireball,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_ChargeFireball)),dia_parlan_teach_chargefireball);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 4) && (PLAYER_TALENT_RUNES[93] == FALSE))
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(DIA_Parlan_TEACH,b_buildlearnstringforrunes(NAME_SPL_FIRELIGHT,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_FIRELIGHT)),dia_parlan_teach_firelight);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 5) && (PLAYER_TALENT_RUNES[SPL_Pyrokinesis] == FALSE))
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(DIA_Parlan_TEACH,b_buildlearnstringforrunes(NAME_SPL_Pyrokinesis,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Pyrokinesis)),dia_parlan_teach_pyrokinesis);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 5) && (PLAYER_TALENT_RUNES[SPL_Explosion] == FALSE))
	{
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		Info_AddChoice(DIA_Parlan_TEACH,b_buildlearnstringforrunes(NAME_SPL_Explosion,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Explosion)),dia_parlan_teach_Explosion);
		abletolearn = abletolearn + 1;
	};
	if(abletolearn < 1)
	{
		AI_Output(self,other,"DIA_Parlan_TEACH_05_01");	//Пока я ничему не могу научить тебя.
	};
};

func void DIA_Parlan_TEACH_BACK()
{
	Info_ClearChoices(DIA_Parlan_TEACH);
};

func void dia_parlan_teach_instantfireball()
{
	B_TeachPlayerTalentRunes(self,other,SPL_InstantFireball);
};

func void dia_parlan_teach_RapidFirebolt()
{
	B_TeachPlayerTalentRunes(self,other,SPL_RapidFirebolt);
};

func void dia_parlan_teach_MagicCage()
{
	B_TeachPlayerTalentRunes(self,other,SPL_MagicCage);
};

func void dia_parlan_teach_Explosion()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Explosion);
};

func void dia_parlan_teach_chargefireball()
{
	B_TeachPlayerTalentRunes(self,other,SPL_ChargeFireball);
};

func void dia_parlan_teach_firelight()
{
	B_TeachPlayerTalentRunes(self,other,SPL_FIRELIGHT);
};

func void dia_parlan_teach_pyrokinesis()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Pyrokinesis);
};

func void dia_parlan_teach_firestorm()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Firestorm);
};

func void dia_parlan_teach_summonfiregolem()
{
	B_TeachPlayerTalentRunes(self,other,SPL_SUMMONFIREGOLEM);
};


instance DIA_Parlan_Kap2_EXIT(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 999;
	condition = DIA_Parlan_Kap2_EXIT_Condition;
	information = DIA_Parlan_Kap2_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Parlan_Kap2_EXIT_Condition()
{
	if(Kapitel == 2)
	{
		return TRUE;
	};
};

func void DIA_Parlan_Kap2_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

func void B_Parlan_Exit()
{
	AI_Output(self,other,"DIA_Parlan_EXIT_05_00");	//Да защитит тебя Иннос.
};


instance DIA_Parlan_Kap3_EXIT(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 999;
	condition = DIA_Parlan_Kap3_EXIT_Condition;
	information = DIA_Parlan_Kap3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Parlan_Kap3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Parlan_Kap3_EXIT_Info()
{
	if((other.guild == GIL_PAL) || (other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		B_Parlan_Exit();
	};
	AI_StopProcessInfos(self);
};

instance DIA_Parlan_IAmParlan(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 39;
	condition = DIA_Parlan_IAmParlan_Condition;
	information = DIA_Parlan_IAmParlan_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Parlan_IAmParlan_Condition()
{
	if((Kapitel >= 3) && Npc_IsInState(self,ZS_Talk) && ((other.guild != GIL_NOV) && (other.guild != GIL_KDF)))
	{
		return TRUE;
	};
};

func void DIA_Parlan_IAmParlan_Info()
{
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Parlan_IAmParlan_05_00");	//Я вижу, ты решил сражаться на нашей стороне. Я рад.
		AI_Output(self,other,"DIA_Parlan_IAmParlan_05_01");	//Нам нужны каждые сильные руки. Ты должен поговорить с Мардуком, он отвечает за вас, паладинов.
	}
	else
	{
		AI_Output(self,other,"DIA_Parlan_IAmParlan_05_02");	//Я не знаю, почему тебя пустили в монастырь. Я Парлан, и я отвечаю за наших послушников.
		AI_Output(self,other,"DIA_Parlan_IAmParlan_05_03");	//Я не хочу, чтобы ты отрывал их от работы своими дурацкими вопросами. Надеюсь, это ясно?
		Parlan_DontTalkToNovice = LOG_Running;
		Info_ClearChoices(DIA_Parlan_IAmParlan);
		Info_AddChoice(DIA_Parlan_IAmParlan,"Я буду делать то, что сочту нужным.",DIA_Parlan_IAmParlan_MyChoice);
		Info_AddChoice(DIA_Parlan_IAmParlan,"Конечно.",DIA_Parlan_IAmParlan_OK);
	};
};

func void DIA_Parlan_IAmParlan_MyChoice()
{
	AI_Output(other,self,"DIA_Parlan_IAmParlan_MyChoice_15_00");	//Я буду делать то, что сочту нужным.
	AI_Output(self,other,"DIA_Parlan_IAmParlan_MyChoice_05_01");	//Возможно, тому, что тебя терпят здесь, есть причины, но предел есть всему.
	AI_Output(self,other,"DIA_Parlan_IAmParlan_MyChoice_05_02");	//Если ты будешь создавать проблемы, ты ответишь за это. Так что лучше держись подальше от послушников.
	Info_ClearChoices(DIA_Parlan_IAmParlan);
};

func void DIA_Parlan_IAmParlan_OK()
{
	AI_Output(other,self,"DIA_Parlan_IAmParlan_OK_15_00");	//Конечно.
	AI_Output(self,other,"DIA_Parlan_IAmParlan_OK_05_01");	//Очень надеюсь на это.
	Info_ClearChoices(DIA_Parlan_IAmParlan);
};


instance DIA_Parlan_Bibliothek(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 40;
	condition = DIA_Parlan_Bibliothek_Condition;
	information = DIA_Parlan_Bibliothek_Info;
	permanent = FALSE;
	description = "У тебя есть что-нибудь для меня?";
};


func int DIA_Parlan_Bibliothek_Condition()
{
	if((other.guild != GIL_KDF) && (Kapitel >= 3))
	{
		return TRUE;
	};
};

func void DIA_Parlan_Bibliothek_Info()
{
	AI_Output(other,self,"DIA_Parlan_Bibliothek_15_00");	//У тебя есть что-нибудь для меня?
	AI_Output(self,other,"DIA_Parlan_Bibliothek_05_01");	//Да! Как читателю библиотеки, тебе выдается ключ от нее. Там ты найдешь братьев Карраса и Хигласа.
	AI_Output(self,other,"DIA_Parlan_Bibliothek_05_02");	//Если хочешь, ты можешь поговорить с ними.

	if(other.guild != GIL_PAL)
	{
		AI_Output(self,other,"DIA_Parlan_DontDisturb_05_03");	//Но оставь в покое послушников!
	};

	B_GiveInvItems(self,other,ItKe_KlosterBibliothek,1);
	KlosterKeyGive = TRUE;
};


instance DIA_Parlan_DontDisturb(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 39;
	condition = DIA_Parlan_DontDisturb_Condition;
	information = DIA_Parlan_DontDisturb_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Parlan_DontDisturb_Condition()
{
	if((Parlan_DontTalkToNovice == LOG_SUCCESS) && (B_GetGreatestPetzCrime(self) == CRIME_NONE) && ((other.guild != GIL_PAL) || (other.guild != GIL_NOV) || (other.guild != GIL_KDF)))
	{
		return TRUE;
	};
};

func void DIA_Parlan_DontDisturb_Info()
{
	AI_Output(self,other,"DIA_Parlan_DontDisturb_05_00");	//(угрожающе) Я не люблю повторять. Оставь послушников в покое!
	AI_Output(self,other,"DIA_Parlan_DontDisturb_05_01");	//Они должны очищать свой дух физическим трудом и готовить себя к жизни в монастыре.
	AI_Output(self,other,"DIA_Parlan_DontDisturb_05_02");	//Я не потерплю вмешательства в их работу!
	Parlan_DontTalkToNovice = LOG_Running;
};

instance DIA_Parlan_Kap3U4U5_PERM(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 39;
	condition = DIA_Parlan_Kap3U4U5_PERM_Condition;
	information = DIA_Parlan_Kap3U4U5_PERM_Info;
	permanent = TRUE;
	description = "Где мне найти...";
};

func int DIA_Parlan_Kap3U4U5_PERM_Condition()
{
	if((CanEnterKloster == TRUE) && (other.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Parlan_Kap3U4U5_PERM_Info()
{
	AI_Output(other,self,"DIA_Parlan_Kap3_PERM_15_00");	//Где мне найти...
	Info_ClearChoices(DIA_Parlan_Kap3U4U5_PERM);
	Info_AddChoice(DIA_Parlan_Kap3U4U5_PERM,Dialog_Back,DIA_Parlan_Kap3U4U5_PERM_Back);
	Info_AddChoice(DIA_Parlan_Kap3U4U5_PERM,"...церковь?",DIA_Parlan_Kap3U4U5_PERM_Church);
	Info_AddChoice(DIA_Parlan_Kap3U4U5_PERM,"...библиотеку? ",DIA_Parlan_Kap3U4U5_PERM_Library);
	Info_AddChoice(DIA_Parlan_Kap3U4U5_PERM,"...часовню? ",DIA_Parlan_Kap3U4U5_PERM_Chapel);
	Info_AddChoice(DIA_Parlan_Kap3U4U5_PERM,"...подвал?",DIA_Parlan_Kap3U4U5_PERM_Cellar);
};


instance DIA_PARLAN_SOULRIVER(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 39;
	condition = dia_parlan_soulriver_condition;
	information = dia_parlan_soulriver_info;
	permanent = TRUE;
	description = "Я интересуюсь одной книгой.";
};


func int dia_parlan_soulriver_condition()
{
	if((READ_SOULRIVER == FALSE) && (MORIUS_MEET == TRUE) && (PARLAN_SOULRIVER == FALSE))
	{
		return TRUE;
	};
};

func void dia_parlan_soulriver_info()
{
	AI_Output(other,self,"DIA_Parlan_SoulRiver_00");	//Я слышал, в монастыре можно найти книгу, где говорится об освобождении плененных душ.
	AI_Output(other,self,"DIA_Parlan_SoulRiver_01");	//Не знаешь, где я могу ее найти?

	if((other.guild == GIL_KDF) || (other.guild == GIL_NOV))
	{
		AI_Output(self,other,"DIA_Parlan_SoulRiver_02");	//Да. Я припоминаю, что-то у нас было. Да, точно - 'Жертвенные Души', так она называлась.
		AI_Output(self,other,"DIA_Parlan_SoulRiver_03");	//Она хранится в подвальной библиотеке. Но Таламон тебя туда не пропустит.
		AI_Output(self,other,"DIA_Parlan_SoulRiver_04");	//Туда имеют доступ только члены Высшего Совета монастыря. Ты к ним не относишься.
		AI_Output(other,self,"DIA_Parlan_SoulRiver_05");	//А могу я получить разрешение у кого-нибудь из магов, чтобы мне дали доступ к этой библиотеке?
		AI_Output(self,other,"DIA_Parlan_SoulRiver_06");	//Мой совет - даже и не пытайся. И закончим об этом.
	}
	else
	{
		AI_Output(self,other,"DIA_Parlan_SoulRiver_07");	//Ты же не маг Огня, и даже не послушник нашего монастыря!
		AI_Output(self,other,"DIA_Parlan_SoulRiver_08");	//И тебе хватает наглости спрашивать меня об этом!
		AI_Output(self,other,"DIA_Parlan_SoulRiver_09");	//То, что у нас хранится, тебя не касается. Тебе ясно?
	};
	PARLAN_SOULRIVER = TRUE;
};

func void DIA_Parlan_Kap3U4U5_PERM_Back()
{
	Info_ClearChoices(DIA_Parlan_Kap3U4U5_PERM);
};

func void DIA_Parlan_Kap3U4U5_PERM_Church()
{
	AI_Output(other,self,"DIA_Parlan_Kap3U4U5_PERM_Church_15_00");	//...церковь?
	AI_Output(self,other,"DIA_Parlan_Add_05_00");	//О, господи! Неужели Иннос ослепил тебя?!
	AI_Output(self,other,"DIA_Parlan_Add_05_01");	//(цинично) Где церковь? Ох, боже, и куда же она подевалась?!
};

func void DIA_Parlan_Kap3U4U5_PERM_Library()
{
	AI_Output(other,self,"DIA_Parlan_Kap3U4U5_PERM_Library_15_00");	//...библиотеку?
	AI_Output(self,other,"DIA_Parlan_Add_05_02");	//Библиотека находится в конце колоннады слева, прямо напротив церкви.
};

func void DIA_Parlan_Kap3U4U5_PERM_Chapel()
{
	AI_Output(other,self,"DIA_Parlan_Kap3U4U5_PERM_Chapel_15_00");	//...часовню?
	AI_Output(self,other,"DIA_Parlan_Add_05_03");	//Часовня находится в комнате посередине левой колоннады. Там паладины молятся Инносу.
};

func void DIA_Parlan_Kap3U4U5_PERM_Cellar()
{
	AI_Output(other,self,"DIA_Parlan_Kap3U4U5_PERM_Cellar_15_00");	//...подвал?
	AI_Output(self,other,"DIA_Parlan_Add_05_04");	//Вход в подвал находится посередине колоннады справа.
};


instance DIA_Parlan_Kap4_EXIT(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 999;
	condition = DIA_Parlan_Kap4_EXIT_Condition;
	information = DIA_Parlan_Kap4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Parlan_Kap4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Parlan_Kap4_EXIT_Info()
{
	if((other.guild == GIL_PAL) || (other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		B_Parlan_Exit();
	};
	AI_StopProcessInfos(self);
};


instance DIA_Parlan_Kap5_EXIT(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 999;
	condition = DIA_Parlan_Kap5_EXIT_Condition;
	information = DIA_Parlan_Kap5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Parlan_Kap5_EXIT_Condition()
{
	if(Kapitel >= 5)
	{
		return TRUE;
	};
};

func void DIA_Parlan_Kap5_EXIT_Info()
{
	if((other.guild == GIL_PAL) || (other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		B_Parlan_Exit();
	};
	AI_StopProcessInfos(self);
};


instance DIA_PARLAN_PICKPOCKET(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 900;
	condition = dia_parlan_pickpocket_condition;
	information = dia_parlan_pickpocket_info;
	permanent = TRUE;
	description = "(Попробовать украсть его ключ)";
};


func int dia_parlan_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) >= 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (MIS_XARDASNDMTASKSONE == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_parlan_pickpocket_info()
{
	Info_ClearChoices(dia_parlan_pickpocket);
	Info_AddChoice(dia_parlan_pickpocket,Dialog_Back,dia_parlan_pickpocket_back);
	Info_AddChoice(dia_parlan_pickpocket,DIALOG_PICKPOCKET,dia_parlan_pickpocket_doit);
};

func void dia_parlan_pickpocket_doit()
{
	if((other.attribute[ATR_DEXTERITY] + PickPocketBonusCount) >= 40)
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		}
		else
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		};

		B_GiveInvItems(self,other,ItKe_KlosterBibliothek,1);
		KlosterKeyGive = TRUE;
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		BELIARPRAYCOUNT = BELIARPRAYCOUNT + 1;
		B_GiveThiefXP();
		Info_ClearChoices(dia_parlan_pickpocket);
	}
	else
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		};
		THIEFCATCHER = Hlp_GetNpc(self);
		HERO_CANESCAPEFROMGOTCHA = TRUE;
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
	};
};

func void dia_parlan_pickpocket_back()
{
	Info_ClearChoices(dia_parlan_pickpocket);
};


instance DIA_PARLAN_RUNEMAGICNOTWORK(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 1;
	condition = dia_parlan_runemagicnotwork_condition;
	information = dia_parlan_runemagicnotwork_info;
	permanent = FALSE;
	description = "Твои магические руны - они все еще работают?";
};


func int dia_parlan_runemagicnotwork_condition()
{
	if((STOPBIGBATTLE == TRUE) && (MIS_RUNEMAGICNOTWORK == LOG_Running) && (FIREMAGERUNESNOT == FALSE))
	{
		return TRUE;
	};
};

func void dia_parlan_runemagicnotwork_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Parlan_RuneMagicNotWork_01_00");	//Твои магические руны - они все еще работают?
	AI_Output(self,other,"DIA_Parlan_RuneMagicNotWork_01_01");	//Нет!
	AI_Output(other,self,"DIA_Parlan_RuneMagicNotWork_01_02");	//А что насчет остальных?
	AI_Output(self,other,"DIA_Parlan_RuneMagicNotWork_01_03");	//И у них не работают.
	AI_Output(other,self,"DIA_Parlan_RuneMagicNotWork_01_04");	//Понятно.
	B_LogEntry(TOPIC_RUNEMAGICNOTWORK,"Рунические камни остальных магов Огня тоже потеряли свою силу.");
	FIREMAGERUNESNOT = TRUE;
};

instance DIA_PARLAN_TREVIUS(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 1;
	condition = dia_parlan_trevius_condition;
	information = dia_parlan_trevius_info;
	permanent = FALSE;
	description = "Я ищу старые рукописи Ксардаса.";
};

func int dia_parlan_trevius_condition()
{
	if((MIS_XARDASNDMTASKSONE == LOG_Running) && (RUK3 == TRUE))
	{
		return TRUE;
	};
};

func void dia_parlan_trevius_info()
{
	AI_Output(other,self,"DIA_Parlan_TREVIUS_01_00");	//Я ищу старые рукописи Ксардаса.
	AI_Output(other,self,"DIA_Parlan_TREVIUS_01_01");	//Ты что-нибудь знаешь о них?
	AI_Output(self,other,"DIA_Parlan_TREVIUS_01_02");	//Мне не известно, какие у тебя дела с этим предателем.
	AI_Output(self,other,"DIA_Parlan_TREVIUS_01_03");	//Но одно мне известно точно - я ничего не скажу тебе.
	COUNT_TREVIUS_DIALOG = TRUE;
	B_LogEntry(TOPIC_XARDASNDMTASKSONE,"Парлан ничего мне не сказал о рукописях - надо спросить еще кого-нибудь. Черт, ну и зануды все-таки эти маги Огня. Неудивительно, что Ксардас от них сбежал.");
	AI_StopProcessInfos(self);
};