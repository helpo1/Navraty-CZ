
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
	AI_Output(other,self,"DIA_GorNaBar_Hallo_15_00");	//Hej, já tě znám! Ty jsi byl ve Starém dolu. Ale...
	AI_Output(other,self,"DIA_GorNaBar_Hallo_15_01");	//Jak jsi jse od tamtud dostal, když ho zaplavila voda...
	AI_Output(self,other,"DIA_GorNaBar_Hallo_09_00");	//Á... Ty jsi ten, co tam bojoval s červy.
	AI_Output(self,other,"DIA_GorNaBar_Hallo_09_01");	//To je dlouhá historie. Zničen byl jedině vstup... Všechno ostatní v dole zůstalo zachováno.
	AI_Output(self,other,"DIA_GorNaBar_Hallo_09_02");	//Všude vládla panika...
	AI_Output(self,other,"DIA_GorNaBar_Hallo_09_03");	//Schoval jsem se a modlil se ke všem bohům, které znám i neznám.
	AI_Output(self,other,"DIA_GorNaBar_Hallo_09_04");	//A někdo vyslyšel mé modlitby. Možná, že by Netbek měl tu moc...
	AI_Output(self,other,"DIA_GorNaBar_Hallo_09_05");	//Po zemětřesení jsem cítil silný náraz větru.
	AI_Output(self,other,"DIA_GorNaBar_Hallo_09_06");	//Utvořili se trhliny v průchodu a svitek proměny ve žravou štěnici mi pomohl se jimi protáhnout.
	AI_Output(self,other,"DIA_GorNaBar_Hallo_09_08");	//A kde jsi byl ty celý ten čas?
	AI_Output(other,self,"DIA_GorNaBar_Hallo_15_02");	//No, v celkem hodně bitvách...
	AI_Output(self,other,"DIA_GorNaBar_Hallo_09_09");	//Stejně jako kdysi s těmi červy. (úsměv)
	AI_Output(self,other,"DIA_GorNaBar_Hallo_09_10");	//Vlastně jsem to čekal.
	AI_Output(other,self,"DIA_GorNaBar_Hallo_15_02A");	//A co tu aktuálně děláš?
	AI_Output(self,other,"DIA_GorNaBar_Hallo_09_10A");	//Trénuji se strážemi a hlídám tábor. Jestli budeš mít nějaký problém, přijď za mnou.
	AI_Output(self,other,"DIA_GorNaBar_Hallo_09_10B");	//Také ti můžu prodat něco ze svého zboží.
	AI_Output(other,self,"DIA_GorNaBar_Hallo_15_03");	//Nemáš tu také nějaké svitky v proměnu ve žravou štěnici? V Khorinisu jsem žádné neviděl...
	AI_Output(self,other,"DIA_GorNaBar_Hallo_09_11");	//Možná ano... (úsměv)
	AI_Output(other,self,"DIA_GorNaBar_Hallo_15_04");	//A dá se tu někde stát?
	AI_Output(self,other,"DIA_GorNaBar_Hallo_09_12");	//Ve stanu kousek za mnou je volná postel.
	AI_Output(self,other,"DIA_GorNaBar_Hallo_09_13");	//Můžeš ji využít.
	b_heroknowforestbase();
	Log_CreateTopic(TOPIC_XBS,LOG_NOTE);
	B_LogEntry(TOPIC_XBS,"Gor na Bar - Velitel stráží v Lesním táboře. Může mi prodat nějaké zboží.");
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
	concatText = "V táboře Netbeka jsi byl odsouzen!";
	AI_Print(concatText);
};

func void dia_gornabar_pmschulden_attackmurder()
{
	var string concatText;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_HumanMurderedHuman,0);
	GLOBAL_MAKE_BANDIT_FORCOAST = 1;
	concatText = "V táboře Netbeka jsi byl odsouzen!";
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
	AI_Output(self,other,"DIA_GorNabar_PMSchulden_10_00");	//Než budeme pokračovat, zeptal bych se na něco.
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
			AI_Output(self,other,"DIA_GorNabar_PMSchulden_08_37");	//Zajímá mě... Tato otázka.
			AI_Output(self,other,"DIA_GorNabar_PMSchulden_08_38");	//Všichni bratři v táboře si na tebe stěžují, že jsi vrah.
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other,"DIA_GorNabar_PMSchulden_08_39");	//ZEMŘÍÍÍ!
		}
		else if(GLOBAL_COAST_ATTACK > 5)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_COAST_ATTACK),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_ATTACKCOUNT2_COAST);
			tsettext3 = ConcatStrings(PRINT_ATTACKCOUNT_COAST,tsettext2);
			AI_Output(self,other,"DIA_GorNabar_PMSchulden_08_40");	//Zajímá mě... Tato otázka.
			AI_Output(self,other,"DIA_GorNabar_PMSchulden_08_41");	//Nikdo dál nechce snášet tvé útoky.
			AI_Output(self,other,"DIA_GorNabar_PMSchulden_08_42");	//A hodně z nich tě chce zabít...
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other,"DIA_GorNabar_PMSchulden_08_43");	//ZEMŘÍÍÍ!
		}
		else if(GLOBAL_COAST_THEFT > 5)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_COAST_THEFT),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_THEFTCOUNT2_COAST);
			tsettext3 = ConcatStrings(PRINT_THEFTCOUNT_COAST,tsettext2);
			AI_Output(self,other,"DIA_GorNabar_PMSchulden_08_44");	//Zajímá mě... Tato otázka.
			AI_Output(self,other,"DIA_GorNabar_PMSchulden_08_45");	//V lidé našem táboře nestrpí zloděje jako jsi ty!
			AI_Output(self,other,"DIA_GorNabar_PMSchulden_08_46");	//A hodně z nich tě chce zabít...
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other,"DIA_GorNabar_PMSchulden_08_47");	//ZEMŘÍÍÍ!
		};
		Log_CreateTopic(TOPIC_DIPLOM,LOG_NOTE);
		B_LogEntry(TOPIC_DIPLOM,"Porušil jsem pravidla Lesního bratrstva. Nyní je ze mne bandita...");
		Info_ClearChoices(dia_gornabar_pmschulden);
		Info_ClearChoices(dia_gornabar_petzmaster);
		Info_AddChoice(dia_gornabar_pmschulden,"Počkej!",dia_gornabar_pmschulden_attackmurder);
	}
	else
	{
		if(B_GetTotalPetzCounter(self) > GORNABAR_LASTPETZCOUNTER)
		{
			AI_Output(self,other,"DIA_GorNabar_PMSchulden_10_01");	//V poslední době působíš mnoho problémů.
			diff = B_GetTotalPetzCounter(self) - GORNABAR_LASTPETZCOUNTER;
			if(diff > 0)
			{
				GORNABAR_SCHULDEN = GORNABAR_SCHULDEN + (diff * 250);
			};
			if(GORNABAR_SCHULDEN < 1000)
			{
				AI_Output(self,other,"DIA_GorNabar_PMSchulden_10_03");	//Doufám, že je všechny vynahradíš...
			}
			else
			{
				AI_Output(self,other,"DIA_GorNabar_PMSchulden_10_04");	//Budeš to muset zaplatit...
			};
			AI_Output(other,self,"DIA_GorNaBar_PMAdd_15_00");	//Kolik?
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
			AI_Output(self,other,"DIA_GorNabar_PMSchulden_10_05");	//Stalo se něco divného.
			if(GORNABAR_LASTPETZCRIME == CRIME_MURDER)
			{
				AI_Output(self,other,"DIA_GorNabar_PMSchulden_10_06");	//Z nějakého důvodu si na tvé zločiny nemůže nikdo vzpomenout.
				GLOBAL_COAST_MURDER = GLOBAL_COAST_MURDER - 1;
				if(GLOBAL_COAST_MURDER < 0)
				{
					GLOBAL_COAST_MURDER = 0;
				};
			};
			if((GORNABAR_LASTPETZCRIME == CRIME_THEFT) || ((GORNABAR_LASTPETZCRIME > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT)))
			{
				AI_Output(self,other,"DIA_GorNabar_PMSchulden_10_07");	//Z nějakého důvodu si na tvé zločiny nemůže nikdo vzpomenout.
				GLOBAL_COAST_THEFT = GLOBAL_COAST_THEFT - 1;
				if(GLOBAL_COAST_THEFT < 0)
				{
					GLOBAL_COAST_THEFT = 0;
				};
			};
			if((GORNABAR_LASTPETZCRIME == CRIME_ATTACK) || ((GORNABAR_LASTPETZCRIME > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK)))
			{
				AI_Output(self,other,"DIA_GorNabar_PMSchulden_10_08");	//Z nějakého důvodu si na tvé zločiny nemůže nikdo vzpomenout.
				GLOBAL_COAST_ATTACK = GLOBAL_COAST_ATTACK - 1;
				if(GLOBAL_COAST_ATTACK < 0)
				{
					GLOBAL_COAST_ATTACK = 0;
				};
			};
			if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
			{
				AI_Output(self,other,"DIA_GorNabar_PMSchulden_10_09");	//Zřejmě ti to odpustili.
			};
			AI_Output(self,other,"DIA_GorNabar_PMSchulden_10_10");	//Už nikdy tak daleko nezacházej!
			if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
			{
				AI_Output(self,other,"DIA_GorNabar_PMSchulden_10_11");	//A nedělej zde problémy!
				AI_Output(self,other,"DIA_GorNabar_PMSchulden_10_12");	//Nesmí se to opakovat.
				GORNABAR_SCHULDEN = 0;
				GORNABAR_LASTPETZCOUNTER = 0;
				GORNABAR_LASTPETZCRIME = CRIME_NONE;
			}
			else
			{
				AI_Output(self,other,"DIA_GorNabar_PMSchulden_10_13");	//Budeme se věnovat úhradě tvých skutků.
				AI_Output(other,self,"DIA_GorNaBar_PMAdd_15_00A");	//Kolik?
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
				AI_Output(self,other,"DIA_GorNabar_PMSchulden_10_14");	//Zaplatíš hned?
			};
		};
		if(B_GetGreatestPetzCrime(self) != CRIME_NONE)
		{
			Info_ClearChoices(dia_gornabar_pmschulden);
			Info_ClearChoices(dia_gornabar_petzmaster);
			Info_AddChoice(dia_gornabar_pmschulden,"Nemám dost zlata!",dia_gornabar_petzmaster_paylater);
			Info_AddChoice(dia_gornabar_pmschulden,"Kolik to dělá?",dia_gornabar_pmschulden_howmuchagain);
			if(Npc_HasItems(other,ItMi_Gold) >= GORNABAR_SCHULDEN)
			{
				Info_AddChoice(dia_gornabar_pmschulden,"Zaplatím.",dia_gornabar_petzmaster_paynow);
			};
		};
	};
};

func void dia_gornabar_pmschulden_howmuchagain()
{
	var string concatText1;
	var string concatText2;
	var string concattextschulden;
	AI_Output(other,self,"DIA_GorNabar_PMSchulden_HowMuchAgain_15_00");	//Kolik to dělá?
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
	Info_AddChoice(dia_gornabar_pmschulden,"Nemám dost zlata!",dia_gornabar_petzmaster_paylater);
	Info_AddChoice(dia_gornabar_pmschulden,"Kolik to dělá?",dia_gornabar_pmschulden_howmuchagain);
	if(Npc_HasItems(other,ItMi_Gold) >= GORNABAR_SCHULDEN)
	{
		Info_AddChoice(dia_gornabar_pmschulden,"Zaplatím.",dia_gornabar_petzmaster_paynow);
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
		AI_Output(self,other,"DIA_GorNabar_PETZMASTER_10_00");	//Hej nováčku! Co tu děláš za problémy?
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
			AI_Output(self,other,"DIA_GorNabar_PETZMASTER_08_48");	//Zajímá mě... Tato otázka.
			AI_Output(self,other,"DIA_GorNabar_PETZMASTER_08_49");	//Všichni bratři v táboře si na tebe stěžují, že jsi vrah.
			AI_Output(self,other,"DIA_GorNabar_PETZMASTER_08_50");	//A hodně z nich tě chce zabít...
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other,"DIA_GorNabar_PETZMASTER_08_51");	//ZEMŘÍÍÍ!
		}
		else if(GLOBAL_COAST_ATTACK > 5)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_COAST_ATTACK),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_ATTACKCOUNT2_COAST);
			tsettext3 = ConcatStrings(PRINT_ATTACKCOUNT_COAST,tsettext2);
			AI_Output(self,other,"DIA_GorNabar_PETZMASTER_08_52");	//Zajímá mě... Tato otázka.
			AI_Output(self,other,"DIA_GorNabar_PETZMASTER_08_53");	//Lidé z tábora si stěžují, že jsi je napadl...
			AI_Output(self,other,"DIA_GorNabar_PETZMASTER_08_54");	//A hodně z nich tě chce zabít...
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other,"DIA_GorNabar_PETZMASTER_08_55");	//ZEMŘÍÍÍ!
		}
		else if(GLOBAL_COAST_THEFT > 5)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_COAST_THEFT),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_THEFTCOUNT2_COAST);
			tsettext3 = ConcatStrings(PRINT_THEFTCOUNT_COAST,tsettext2);
			AI_Output(self,other,"DIA_GorNabar_PETZMASTER_08_56");	//Zajímá mě... Tato otázka.
			AI_Output(self,other,"DIA_GorNabar_PETZMASTER_08_57");	//V našem táboře si začalo hodně lidí stěžovat, že jsi zloděj.
			AI_Output(self,other,"DIA_GorNabar_PETZMASTER_08_58");	//A hodně z nich tě chce zabít...
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other,"DIA_GorNabar_PETZMASTER_08_59");	//ZEMŘÍÍÍ!
		};
		Log_CreateTopic(TOPIC_DIPLOM,LOG_NOTE);
		B_LogEntry(TOPIC_DIPLOM,"Porušil jsem zákony Lesního bratrstva! Teď je ze mne bandita!");
		Info_ClearChoices(dia_gornabar_pmschulden);
		Info_ClearChoices(dia_gornabar_petzmaster);
		Info_AddChoice(dia_gornabar_petzmaster,"Počkej!",dia_gornabar_petzmaster_attackmurder);
	}
	else
	{
		if(B_GetGreatestPetzCrime(self) == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_GorNabar_PETZMASTER_10_02");	//Vrahy tu nikdo nechce!
			GORNABAR_SCHULDEN = B_GetTotalPetzCounter(self) * 1500;
			if((PETZCOUNTER_COAST_THEFT + PETZCOUNTER_COAST_ATTACK) > 0)
			{
				AI_Output(self,other,"DIA_GorNabar_PETZMASTER_10_04");	//A to vůbec nezmiňuji tvé další zločiny.
			};
			AI_Output(self,other,"DIA_GorNabar_PETZMASTER_10_06");	//Zaplatíš odškodné.
			AI_Output(self,other,"DIA_GorNabar_PETZMASTER_10_07");	//Nebo se budeš zodpovídat bohům.
			AI_Output(self,other,"DIA_GorNabar_PETZMASTER_10_08");	//Ale můžeš se zkusit usmířit zde...
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_THEFT)
		{
			AI_Output(self,other,"DIA_GorNabar_PETZMASTER_10_09");	//Ty jsi kradl?
			if(PETZCOUNTER_COAST_ATTACK > 0)
			{
				AI_Output(self,other,"DIA_GorNabar_PETZMASTER_10_10");	//To ani nezmiňuji další věci...
			};
			AI_Output(self,other,"DIA_GorNabar_PETZMASTER_10_11");	//Neměl jsi to dělat.
			AI_Output(self,other,"DIA_GorNabar_PETZMASTER_10_12");	//Budeš muset zaplatit pokutu!
			GORNABAR_SCHULDEN = B_GetTotalPetzCounter(self) * 500;
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
		{
			AI_Output(self,other,"DIA_GorNabar_PETZMASTER_10_13");	//Nikdy nemá rád boje v našem táboře - jasné?.
			AI_Output(self,other,"DIA_GorNabar_PETZMASTER_10_15");	//Budeš muset zaplatit pokutu!
			GORNABAR_SCHULDEN = B_GetTotalPetzCounter(self) * 750;
		};
		AI_Output(other,self,"DIA_GorNabar_PETZMASTER_15_18");	//Kolik?
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
		Info_AddChoice(dia_gornabar_petzmaster,"Nemám dost zlata!",dia_gornabar_petzmaster_paylater);
		if(Npc_HasItems(other,ItMi_Gold) >= GORNABAR_SCHULDEN)
		{
			Info_AddChoice(dia_gornabar_petzmaster,"Zaplatím!",dia_gornabar_petzmaster_paynow);
		};
	};
};

func void dia_gornabar_petzmaster_paynow()
{
	AI_Output(other,self,"DIA_GorNabar_PETZMASTER_PayNow_15_00");	//Zaplatím!
	B_GiveInvItems(other,self,ItMi_Gold,GORNABAR_SCHULDEN);
	AI_Output(self,other,"DIA_GorNabar_PETZMASTER_PayNow_10_01");	//Je dobré to slyšet. A ať se tp neopakuje!
	B_GrantAbsolution(LOC_COAST);
	GORNABAR_SCHULDEN = 0;
	GORNABAR_LASTPETZCOUNTER = 0;
	GORNABAR_LASTPETZCRIME = CRIME_NONE;
	Info_ClearChoices(dia_gornabar_petzmaster);
	Info_ClearChoices(dia_gornabar_pmschulden);
};

func void dia_gornabar_petzmaster_paylater()
{
	AI_Output(other,self,"DIA_GorNabar_PETZMASTER_PayLater_15_00");	//Nemám dost zlata!
	AI_Output(self,other,"DIA_GorNabar_PETZMASTER_PayLater_10_01");	//Tak přijď až budeš mít.
	AI_Output(self,other,"DIA_GorNabar_PETZMASTER_PayLater_10_02");	//A mezi tím tu nepůsob další problémy...
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
	description = "Máte tu kováře?";
};


func int dia_gornabar_smith_condition()
{
	return TRUE;
};

func void dia_gornabar_smith_info()
{
	AI_Output(other,self,"DIA_GorNaBar_Smith_15_00");	//Máte tu kováře?
	if(Npc_IsDead(darrion) == FALSE)
	{
		AI_Output(self,other,"DIA_GorNaBar_Smith_01_01");	//Ano! Jmenuje se Darrion.
		if(Npc_GetDistToWP(darrion,"WP_COAST_BASE_23") < 500)
		{
			AI_Output(self,other,"DIA_GorNaBar_Smith_01_02");	//Tady je.
		};
		AI_Output(self,other,"DIA_GorNaBar_Smith_01_03");	//Je tu jen večer. Přes den žije a pracuje v horách...
	}
	else
	{
		AI_Output(self,other,"DIA_GorNaBar_Smith_01_04");	//Jindy Darriona, ale teď tu není.
	};
};


instance DIA_GORNABAR_HEADILL(C_Info)
{
	npc = xbs_7508_gornabar;
	nr = 3;
	condition = dia_gornabar_headill_condition;
	information = dia_gornabar_headill_info;
	permanent = FALSE;
	description = "Také trpíš bolestmi hlavy?";
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
	AI_Output(other,self,"DIA_GorNaBar_HeadIll_15_00");	//Také trpíš bolestmi hlavy?
	AI_Output(self,other,"DIA_GorNaBar_HeadIll_01_00");	//Poprvé ano a velmi silně. Myslel jsem, že za to můžou hlavně následky mého úniku z dolu!
	AI_Output(self,other,"DIA_GorNaBar_HeadIll_01_01");	//Pak mi ale Baal Netbek vysvětlil, že je to něčí temná magie.
	AI_Output(self,other,"DIA_GorNaBar_HeadIll_01_02");	//Tady v táboře zmizeli a už mě neotravují.
	AI_StopProcessInfos(self);
};


instance DIA_GORNABAR_SHIP(C_Info)
{
	npc = xbs_7508_gornabar;
	nr = 2;
	condition = dia_gornabar_ship_condition;
	information = dia_gornabar_ship_info;
	permanent = FALSE;
	description = "Nechtěl bys odsud odplout lodí?";
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
	AI_Output(other,self,"DIA_GorNaBar_SHIP_15_00");	//Nechtěl bys odsud odplout lodí?
	AI_Output(self,other,"DIA_GorNaBar_SHIP_01_01");	//Ne! Tady se mi líbí.
	AI_Output(self,other,"DIA_GorNaBar_SHIP_01_02");	//Je to tu nejbezpečnější místo z celé kolonie a je tu hezky.
	AI_Output(self,other,"DIA_GorNaBar_SHIP_01_03");	//Také toto místo musí někdo chránit před sekerami skřetů, kteří by tu chtěli těžit dřevo.
	AI_Output(other,self,"DIA_GorNaBar_SHIP_15_01");	//Pak doufám, že se ti to povede!
	AI_Output(self,other,"DIA_GorNaBar_SHIP_01_04");	//Netbek řekl, že v tady v údolí můžeme přežít válku.
	AI_Output(self,other,"DIA_GorNaBar_SHIP_01_05");	//A jestli je to pravda, zůstanu zde a budu ho chránit svou zbraní.
	AI_Output(self,other,"DIA_GorNaBar_SHIP_01_06");	//Všichni tu zůstaneme.
};


instance DIA_GORNABAR_TRADE(C_Info)
{
	npc = xbs_7508_gornabar;
	nr = 2;
	condition = dia_gornabar_trade_condition;
	information = dia_gornabar_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Ukaž mi své zásoby.";
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

	AI_Output(other,self,"DIA_GorNaBar_TRADE_15_00");	//Ukaž mi své zásoby.

	if(GORNABAR_OW_MAP == FALSE)
	{
		AI_Output(self,other,"DIA_GorNaBar_TRADE_09_02");	//Můžeš u mě najít dobrou mapu...
		GORNABAR_OW_MAP = TRUE;
	};
	if(newscmeatbug == TRUE)
	{
		AI_Output(self,other,"DIA_GorNaBar_TRADE_09_01");	//Dobré zprávy - našel jsem další svitky přeměny vě žravou štěnici!
	};
	if((TplBelt_01 == FALSE) && (hero.guild == GIL_TPL))
	{
		CreateInvItems(self,ItBE_Addon_TPL_01,1);
		TplBelt_01 = TRUE;
	};

	B_GiveTradeInv(self);
};

