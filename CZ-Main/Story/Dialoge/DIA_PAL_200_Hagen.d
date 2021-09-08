/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.01:

(8x) MIS_ORcGREATWAR - MIS_ORCGREATWAR (cyrilice -> latinka)


v1.00:

func void dia_lord_hagen_oreismined_trade - přidán obtížnější skill check na rétoriku (ještě vyšší výkupní cena rudy)

*/




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
	AI_Output(self,other,"DIA_Pyrokar_NoEnter_PissOff_01_00");	//Hmmm... (naštvaně)
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
	if(Npc_IsInState(self,ZS_Talk) && (Hagen_Schulden > 0) && (B_GetGreatestPetzCrime(self) <= Hagen_LastPetzCrime) && (MIS_ORCGREATWAR == FALSE))
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
	concatText = "Představitelé města tě označili za psance!";
	AI_Print(concatText);
};

func void dia_hagen_pmschulden_attackmurder()
{
	var string concatText;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_HumanMurderedHuman,0);
	GLOBAL_MAKE_BANDIT_FORCITY = 1;
	concatText = "Představitelé města tě označili za psance!";
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
	AI_Output(self,other,"DIA_Hagen_PMSchulden_04_00");	//Dobře, že jsi přišel. Můžeš hned zaplatit tu pokutu.
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
			AI_Output(self,other,"DIA_Hagen_PMSchulden_08_36");	//Ale bojím se, že zde žádná pokuta nebude nic platná.
			AI_Output(self,other,"DIA_Hagen_PMSchulden_08_37");	//Tvé neustálé vraždy nevinných lidí není možno sledovat a nic neudělat.
			AI_Output(self,other,"DIA_Hagen_PMSchulden_08_38");	//Z moci svěřené mě Innosem a naším králem tě odsuzuji na smrt...
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other,"DIA_Hagen_PMSchulden_08_39");	//Ve jménu Innose! Zemři!
		}
		else if(GLOBAL_CITY_ATTACK > 10)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_CITY_ATTACK),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_ATTACKCOUNT2_CITY);
			tsettext3 = ConcatStrings(PRINT_ATTACKCOUNT_CITY,tsettext2);
			AI_Output(self,other,"DIA_Hagen_PMSchulden_08_40");	//Ale bojím se, že zde žádná pokuta nebude nic platná.
			AI_Output(self,other,"DIA_Hagen_PMSchulden_08_41");	//Tvé neustálé útoky na nevinné lidi není možno sledovat a nic neudělat.
			AI_Output(self,other,"DIA_Hagen_PMSchulden_08_42");	//Z moci svěřené mě Innosem a naším králem tě odsuzuji na smrt...
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other,"DIA_Hagen_PMSchulden_08_43");	//Ve jménu Innose! Zemři!
		}
		else if(GLOBAL_CITY_THEFT > 20)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_CITY_THEFT),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_THEFTCOUNT2_CITY);
			tsettext3 = ConcatStrings(PRINT_THEFTCOUNT_CITY,tsettext2);
			AI_Output(self,other,"DIA_Hagen_PMSchulden_08_44");	//Ale bojím se, že zde žádná pokuta nebude nic platná.
			AI_Output(self,other,"DIA_Hagen_PMSchulden_08_45");	//Ty špinavý zloději! Pro nepoučitelné zloděje jako ty tady máme hezké místo... hřbitov!
			AI_Output(self,other,"DIA_Hagen_PMSchulden_08_46");	//Z moci svěřené mě Innosem a naším králem tě odsuzuji na smrt...
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other,"DIA_Hagen_PMSchulden_08_47");	//Ve jménu Innose! Zemři!
		};
		Log_CreateTopic(TOPIC_DIPLOM,LOG_NOTE);
		B_LogEntry(TOPIC_DIPLOM,"Moje vztahy s paladiny jsou kvůli mým neustálým výstřelkům ve městě na bodu mrazu. Teď mě považují za psance!");
		Info_ClearChoices(DIA_Hagen_PMSchulden);
		Info_ClearChoices(DIA_Hagen_PETZMASTER);
		Info_AddChoice(DIA_Hagen_PMSchulden,"Počkej! (utéct)",dia_hagen_pmschulden_attackmurder);
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
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_01");	//Nebereš zákony města moc vážně, co?
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_02");	//Seznam tvých prohřešků zase narostl.
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_03");	//A neříkej mi, žes to nevěděl!
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_04");	//Zaplatíš maximální pokutu.
			AI_Output(other,self,"DIA_Hagen_PMAdd_15_00A");	//Kolik?
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
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_05");	//No, zdá se, že se situace změnila.
			if(Hagen_LastPetzCrime == CRIME_MURDER)
			{
				AI_Output(self,other,"DIA_Hagen_PMSchulden_04_06");	//Nejsou už žádní svědkové tvých vražd.
				GLOBAL_CITY_MURDER = GLOBAL_CITY_MURDER - 1;
				if(GLOBAL_CITY_MURDER < 0)
				{
					GLOBAL_CITY_MURDER = 0;
				};
			};
			if((Hagen_LastPetzCrime == CRIME_THEFT) || ((Hagen_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT)))
			{
				AI_Output(self,other,"DIA_Hagen_PMSchulden_04_07");	//Nikdo už nemůže dokázat, že tě viděl krást.
				GLOBAL_CITY_THEFT = GLOBAL_CITY_THEFT - 1;
				if(GLOBAL_CITY_THEFT < 0)
				{
					GLOBAL_CITY_THEFT = 0;
				};
			};
			if((Hagen_LastPetzCrime == CRIME_ATTACK) || ((Hagen_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK)))
			{
				AI_Output(self,other,"DIA_Hagen_PMSchulden_04_08");	//Už nezbyli žádní svědci té tvé rvačky.
				GLOBAL_CITY_ATTACK = GLOBAL_CITY_ATTACK - 1;
				if(GLOBAL_CITY_ATTACK < 0)
				{
					GLOBAL_CITY_ATTACK = 0;
				};
			};
			if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
			{
				AI_Output(self,other,"DIA_Hagen_PMSchulden_04_09");	//Všechna obvinění proti tobě byla stažena.
			};
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_10");	//Nevím, co se tam ve městě stalo - a ani to vědět nechci.
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_11");	//Dávej si prostě pozor, aby ses tady nedostal do problémů.
			if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
			{
				AI_Output(self,other,"DIA_Hagen_PMSchulden_04_12");	//Tak nebo tak, rozhodl jsem se prominout ti tvé dluhy.
				AI_Output(self,other,"DIA_Hagen_PMSchulden_04_13");	//Ale dej si pozor, ať se to neopakuje.
				Hagen_Schulden = 0;
				Hagen_LastPetzCounter = 0;
				Hagen_LastPetzCrime = CRIME_NONE;
			}
			else
			{
				AI_Output(self,other,"DIA_Hagen_PMSchulden_04_14");	//Pokutu budeš muset zaplatit v plné výši tak jako tak.
				AI_Output(other,self,"DIA_Hagen_PMAdd_15_00B");	//Kolik?
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
				AI_Output(self,other,"DIA_Hagen_PMSchulden_04_15");	//Tak co, chceš zaplatit?
			};
		};
		if(B_GetGreatestPetzCrime(self) != CRIME_NONE)
		{
			Info_ClearChoices(DIA_Hagen_PMSchulden);
			Info_ClearChoices(DIA_Hagen_PETZMASTER);
			Info_AddChoice(DIA_Hagen_PMSchulden,"Nemám dost peněz!",DIA_Hagen_PETZMASTER_PayLater);
			Info_AddChoice(DIA_Hagen_PMSchulden,"Kolik že to bylo?",DIA_Hagen_PMSchulden_HowMuchAgain);
			if(Npc_HasItems(other,ItMi_Gold) >= Hagen_Schulden)
			{
				Info_AddChoice(DIA_Hagen_PMSchulden,"Chci tu pokutu zaplatit!",DIA_Hagen_PETZMASTER_PayNow);
			};
		};
	};
};

func void DIA_Hagen_PMSchulden_HowMuchAgain()
{
	var string concatText1;
	var string concatText2;
	var string concattextschulden;
	AI_Output(other,self,"DIA_Hagen_PMSchulden_HowMuchAgain_15_00");	//Kolik že to bylo?
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
	Info_AddChoice(DIA_Hagen_PMSchulden,"Nemám dost peněz!",DIA_Hagen_PETZMASTER_PayLater);
	Info_AddChoice(DIA_Hagen_PMSchulden,"Kolik že to bylo?",DIA_Hagen_PMSchulden_HowMuchAgain);
	if(Npc_HasItems(other,ItMi_Gold) >= Hagen_Schulden)
	{
		Info_AddChoice(DIA_Hagen_PMSchulden,"Chci tu pokutu zaplatit!",DIA_Hagen_PETZMASTER_PayNow);
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
	if((B_GetGreatestPetzCrime(self) > Hagen_LastPetzCrime) && (MIS_ORCGREATWAR == FALSE))
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
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_00");	//Tvá pověst tě předchází. Porušil jsi zákony města.
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
			AI_Output(self,other,"DIA_Hagen_PETZMASTER_08_48");	//Ale bojím se, že zde žádná pokuta nebude nic platná.
			AI_Output(self,other,"DIA_Hagen_PETZMASTER_08_49");	//Tvé neustálé vraždy nevinných lidí není možno sledovat a nic neudělat.
			AI_Output(self,other,"DIA_Hagen_PETZMASTER_08_50");	//Z moci svěřené mě Innosem a naším králem tě odsuzuji na smrt...
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other,"DIA_Hagen_PETZMASTER_08_51");	//Ve jménu Innose! Zemři!
		}
		else if(GLOBAL_CITY_ATTACK > 10)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_CITY_ATTACK),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_ATTACKCOUNT2_CITY);
			tsettext3 = ConcatStrings(PRINT_ATTACKCOUNT_CITY,tsettext2);
			AI_Output(self,other,"DIA_Hagen_PETZMASTER_08_52");	//Ale bojím se, že zde žádná pokuta nebude nic platná.
			AI_Output(self,other,"DIA_Hagen_PETZMASTER_08_53");	//Tvé neustálé útoky na nevinné lidi není možno sledovat a nic neudělat.
			AI_Output(self,other,"DIA_Hagen_PETZMASTER_08_54");	//Z moci svěřené mě Innosem a naším králem tě odsuzuji na smrt...
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other,"DIA_Hagen_PETZMASTER_08_55");	//Ve jménu Innose! Zemři!
		}
		else if(GLOBAL_CITY_THEFT > 20)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_CITY_THEFT),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_THEFTCOUNT2_CITY);
			tsettext3 = ConcatStrings(PRINT_THEFTCOUNT_CITY,tsettext2);
			AI_Output(self,other,"DIA_Hagen_PETZMASTER_08_56");	//Ale bojím se, že zde žádná pokuta nebude nic platná.
			AI_Output(self,other,"DIA_Hagen_PETZMASTER_08_57");	//Ty špinavý zloději! Pro nepoučitelné zloděje jako ty tady máme hezké místo... hřbitov!
			AI_Output(self,other,"DIA_Hagen_PETZMASTER_08_58");	//Z moci svěřené mě Innosem a naším králem tě odsuzuji na smrt...
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other,"DIA_Hagen_PETZMASTER_08_59");	//Ve jménu Innose! Zemři!
		};
		Log_CreateTopic(TOPIC_DIPLOM,LOG_NOTE);
		B_LogEntry(TOPIC_DIPLOM,"Moje vztahy s paladiny jsou kvůli mým neustálým výstřelkům ve městě na bodu mrazu. Teď mě považují za psance!");
		Info_ClearChoices(DIA_Hagen_PMSchulden);
		Info_ClearChoices(DIA_Hagen_PETZMASTER);
		Info_AddChoice(DIA_Hagen_PETZMASTER,"Počkej! (utéct)",dia_hagen_petzmaster_attackmurder);
	}
	else
	{
		if(B_GetGreatestPetzCrime(self) == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_01");	//Dostal ses do pěkné šlamastyky.
			AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_02");	//Vražda je vážný zločin!
			Hagen_Schulden = B_GetTotalPetzCounter(self) * 1500;
			if((PETZCOUNTER_City_Theft + PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
			{
				AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_03");	//Nemluvě o tvých dalších prohřešcích.
			};
			AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_04");	//Stráže mají příkazy na místě popravit každého vraha.
			AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_05");	//Vražda je v tomto městě nepřípustná. Můžeš však dát svou lítost najevo zaplacením pokuty.
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_THEFT)
		{
			AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_06");	//Jsi obviněn z krádeže!
			if((PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
			{
				AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_07");	//Nemluvě o dalších věcech, které se ke mně donesly.
			};
			AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_08");	//To je porušení městských zákonů. Za to zaplatíš.
			Hagen_Schulden = B_GetTotalPetzCounter(self) * 500;
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
		{
			AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_09");	//Zapletl ses do rvačky. Tím pádem jsi porušil zákon.
			if(PETZCOUNTER_City_Sheepkiller > 0)
			{
				AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_10");	//A co to bylo s tou ovcí?
			};
			AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_11");	//Porušení zákonů města je porušením zákonů samotného Innose.
			AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_12");	//Budeš za to muset zaplatit.
			Hagen_Schulden = B_GetTotalPetzCounter(self) * 750;
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER)
		{
			AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_13");	//Zasedl sis na naše ovce - poprvé jsem tomu ani nechtěl věřit!
			AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_14");	//Proč tyhle prkotiny vůbec děláš?
			AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_15");	//Budeš muset zaplatit náhradu škody!
			Hagen_Schulden = 250;
		};
		AI_Output(other,self,"DIA_Hagen_PETZMASTER_15_16");	//Kolik?
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
		Info_AddChoice(DIA_Hagen_PETZMASTER,"Nemám dost peněz!",DIA_Hagen_PETZMASTER_PayLater);
		if(Npc_HasItems(other,ItMi_Gold) >= Hagen_Schulden)
		{
			Info_AddChoice(DIA_Hagen_PETZMASTER,"Chci tu pokutu zaplatit!",DIA_Hagen_PETZMASTER_PayNow);
		};
	};
};

func void DIA_Hagen_PETZMASTER_PayNow()
{
	AI_Output(other,self,"DIA_Hagen_PETZMASTER_PayNow_15_00");	//Chci tu pokutu zaplatit!
	B_GiveInvItems(other,self,ItMi_Gold,Hagen_Schulden);
	AI_Output(self,other,"DIA_Hagen_PETZMASTER_PayNow_04_01");	//Dobrá! Dohlédnu na to, aby se o tom dozvěděl každý ve městě - to ti alespoň částečně vylepší reputaci.
	B_GrantAbsolution(LOC_CITY);
	Hagen_Schulden = 0;
	Hagen_LastPetzCounter = 0;
	Hagen_LastPetzCrime = CRIME_NONE;
	Info_ClearChoices(DIA_Hagen_PETZMASTER);
	Info_ClearChoices(DIA_Hagen_PMSchulden);
};

func void DIA_Hagen_PETZMASTER_PayLater()
{
	AI_Output(other,self,"DIA_Hagen_PETZMASTER_PayLater_15_00");	//Nemám dost peněz!
	AI_Output(self,other,"DIA_Hagen_PETZMASTER_PayLater_04_01");	//Tak si nějaké co nejrychleji sežeň.
	AI_Output(self,other,"DIA_Hagen_PETZMASTER_PayLater_04_02");	//A varuji tě: jestli se proviníš ještě něčím, jen si to zhoršíš.
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
	AI_Output(self,other,"DIA_Lord_Hagen_Hallo_04_00");	//Už jsem o tobě slyšel.

	if(Npc_KnowsInfo(other,DIA_Lothar_EyeInnos) || (Andre_EyeInnos == TRUE))
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Add_04_03");	//Lothar mi oznámil, že prý se mnou chceš mluvit.
		AI_Output(self,other,"DIA_Lord_Hagen_Hallo_04_01");	//Jsi ten cizinec, který se dožaduje Innosova oka.
	};
	AI_Output(self,other,"DIA_Lord_Hagen_Hallo_04_02");	//Jsem lord Hagen.
	AI_Output(self,other,"DIA_Lord_Hagen_Hallo_04_03");	//Královský paladin, válečník našeho Pána Innose a nejvyšší velitel Khorinisu.
	AI_Output(self,other,"DIA_Lord_Hagen_Hallo_04_04");	//Mám spoustu práce. Takže neplýtvej mým časem - a raději mi řekni, proč tu jsi.
	HagenFTMeet = TRUE;
};


instance DIA_Lord_Hagen_Frieden(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 2;
	condition = DIA_Lord_Hagen_Frieden_Condition;
	information = DIA_Lord_Hagen_Frieden_Info;
	permanent = FALSE;
	description = "Přináším návrh příměří od žoldáků!";
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
	AI_Output(other,self,"DIA_Lord_Hagen_Frieden_15_00");	//Přináším návrh příměří od žoldáků!
	B_GiveInvItems(other,self,ItWr_Passage_MIS,1);
	AI_Output(self,other,"DIA_Lord_Hagen_Frieden_04_01");	//(nevrle) Hmm... Ukaž!
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Lord_Hagen_Frieden_04_02");	//Generála Leeho znám. Vím také o okolnostech, za jakých byl odsouzen k nuceným pracím v kolonii.
	AI_Output(self,other,"DIA_Lord_Hagen_Frieden_04_03");	//Považuji ho za čestného muže. Jsem ochoten mu jeho prohřešky odpustit - ale jenom jemu!
	AI_Output(self,other,"DIA_Lord_Hagen_Frieden_04_04");	//To se netýká jeho mužů. Většina z nich jsou hanební hrdlořezové a svůj trest si plně zasluhují!
	AI_Output(self,other,"DIA_Lord_Hagen_Frieden_04_05");	//Jim rozhodně nic neprominu. Můžeš jim to oznámit.
	Hagen_FriedenAbgelehnt = TRUE;
	if(!Npc_KnowsInfo(other,DIA_Lord_Hagen_Armee))
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Frieden_04_06");	//Je to všechno?
	};
	B_LogEntry(TOPIC_Frieden,"Lord Hagen je ochoten zprostit viny Leeho, ale nikoliv ostatní žoldáky.");
};


instance DIA_LORD_HAGEN_WATERLETTER(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 2;
	condition = dia_lord_hagen_waterletter_condition;
	information = dia_lord_hagen_waterletter_info;
	permanent = FALSE;
	description = "Mám pro tebe dopis od Saturase.";
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
	AI_Output(other,self,"DIA_Lord_Hagen_WaterLetter_04_00");	//Mám pro tebe dopis od Saturase.
	B_GiveInvItems(other,self,itwr_watermageletter,1);
	AI_Output(self,other,"DIA_Lord_Hagen_WaterLetter_04_01");	//(překvapeně) Ano? To je velmi zajímavé...
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Lord_Hagen_WaterLetter_04_02");	//No - nevidím důvod pro odmítnutí prosby takového ctihodného člověka.
	AI_Output(self,other,"DIA_Lord_Hagen_WaterLetter_04_03");	//Okamžitě pošlu několik paladinů na ochranu portálu mágů Vody.
	AI_Output(self,other,"DIA_Lord_Hagen_WaterLetter_04_04");	//Můžeš jim to vyřídit.
	AI_Output(other,self,"DIA_Lord_Hagen_WaterLetter_04_05");	//Dobře, rozumím.
	HAGENTAKELETTER = TRUE;
	B_LogEntry(TOPIC_WATERMAGELETTER,"Doručil jsem Saturasův dopis vůdci paladinů. Lord Hagen souhlasil se žádostí mágů a požádal mě, abych Saturasovi sdělil, že pošle několik mužů střežit portál.");
};


instance DIA_Lord_Hagen_Auge(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 2;
	condition = DIA_Lord_Hagen_Auge_Condition;
	information = DIA_Lord_Hagen_Auge_Info;
	permanent = FALSE;
	description = "Co víš o Innosově oku?";
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
	AI_Output(other,self,"DIA_Lord_Hagen_Auge_15_00");	//Co víš o Innosově oku?
	AI_Output(self,other,"DIA_Lord_Hagen_Auge_04_01");	//Je to posvátný artefakt... (zadumaně) Ve starých proroctvích se říká, že je nějak spojen s draky.
	AI_Output(self,other,"DIA_Lord_Hagen_Auge_04_02");	//V těchto spisech je ale také zmínka o tom, že ho může nosit jen Innosův vyvolený.

	if(other.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Lord_Hagen_Auge_15_03");	//JÁ jsem Innosův vyvolený!
		AI_Output(self,other,"DIA_Lord_Hagen_Auge_04_04");	//Potom možná budeš moci ten amulet nosit.
	};
};


instance DIA_Lord_Hagen_Armee(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 1;
	condition = DIA_Lord_Hagen_Armee_Condition;
	information = DIA_Lord_Hagen_Armee_Info;
	permanent = FALSE;
	description = "Nedaleko se shromažďují zástupy zlých stvůr. V Hornickém údolí.";
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
	AI_Output(other,self,"DIA_Lord_Hagen_Armee_15_00");	//Nedaleko se shromažďují zástupy zlých stvůr. V Hornickém údolí.
	AI_Output(self,other,"DIA_Lord_Hagen_Armee_04_01");	//V Hornickém údolí? Vyslali jsme tam výpravu. Neustále nám docházejí zprávy o tom, že průsmyk okupují skřeti.
	AI_Output(self,other,"DIA_Lord_Hagen_Armee_04_02");	//Ale o armádě Zla se ke mně ještě nic nedoneslo.
	if(Npc_KnowsInfo(other,DIA_Lord_Hagen_Frieden))
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Armee_04_03");	//Není to jen nějaký ubohý trik, který mě má přesvědčit o nezbytnosti spojit síly se žoldáky?
		AI_Output(other,self,"DIA_Lord_Hagen_Armee_15_04");	//Ne.
	};
	AI_Output(self,other,"DIA_Lord_Hagen_Armee_04_05");	//(skepticky) Co to má být za armádu?
	AI_Output(other,self,"DIA_Lord_Hagen_Armee_15_06");	//Armáda draků, která kolem sebe shromáždila zástupy přisluhovačů.
	AI_Output(self,other,"DIA_Lord_Hagen_Armee_04_07");	//Draci? Podle starých spisů to už je několik století, co někdo naposledy viděl draka.
	AI_Output(self,other,"DIA_Lord_Hagen_Armee_04_08");	//Pověz - proč bych měl věřit jedinému tvému slovu?
	AI_Output(other,self,"DIA_Lord_Hagen_Armee_15_09");	//Jenomže otázka není, jestli mi můžeš věřit. Otázka je, jestli si můžeš dovolit mi NEVĚŘIT v případě, že mluvím pravdu.
	AI_Output(self,other,"DIA_Lord_Hagen_Armee_04_10");	//Dokud nebudu mít důkaz, nemohu tam vyslat více mužů.
	AI_Output(other,self,"DIA_Lord_Hagen_Proof_15_00");	//Takže chceš, abych ti přinesl nějaký důkaz.
	AI_Output(self,other,"DIA_Lord_Hagen_Proof_04_01");	//Přesně tak!
	AI_Output(self,other,"DIA_Lord_Hagen_Proof_01_00");	//Jestli jsou tvoje slova pravdivá, jsem připraven ti pomoci.
	AI_Output(other,self,"DIA_Lord_Hagen_Proof_15_04");	//Znamená to, že mi pak dáš Innosovo oko?
	AI_Output(self,other,"DIA_Lord_Hagen_Proof_04_05");	//Innosovo oko? (zadumaně) Dobrá! Souhlasím.
	AI_Output(self,other,"DIA_Lord_Hagen_Armee_01_01");	//Přines mi důkaz a já pak dohlédnu na to, abys směl nosit ten amulet.
	AI_Output(other,self,"DIA_Lord_Hagen_Proof_15_06");	//Mám tedy v tomto ohledu tvoje slovo?
	AI_Output(self,other,"DIA_Lord_Hagen_Proof_04_07");	//Samozřejmě - máš ho mít.
};


instance DIA_Lord_Hagen_Pass(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 1;
	condition = DIA_Lord_Hagen_Pass_Condition;
	information = DIA_Lord_Hagen_Pass_Info;
	permanent = TRUE;
	description = "Jak se mám dostat přes ten průsmyk?";
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
	AI_Output(other,self,"DIA_Lord_Hagen_Pass_15_00");	//Jak se mám dostat přes ten průsmyk?

	if((hero.guild != GIL_NONE) && (MIS_Addon_Vatras_WhereAreMissingPeople == LOG_SUCCESS) && (MIS_Addon_Nefarius_BringMissingOrnaments == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Pass_01_01");	//(vážně) Mám klíč, který ti otevře vrata do průsmyku...

		if(MIS_ONARBUSINESS != LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Lord_Hagen_Pass_01_02");	//Ještě před tím, než ti ho dám, tě však čeká jiný, neméně důležitý úkol.
			AI_Output(other,self,"DIA_Lord_Hagen_Pass_01_03");	//O co jde?
			AI_Output(self,other,"DIA_Lord_Hagen_Pass_01_04");	//Podle zvěstí, které se ke mně dostali, mágové Vody našli nějaký tajemný magický portál. Chci vědět vše o tom, co se děje za ním!
			AI_Output(self,other,"DIA_Lord_Hagen_Pass_01_05");	//Zjisti a udělej pro ně vše, co budeš moci.
			AI_Output(self,other,"DIA_Lord_Hagen_Pass_01_06");	//Potom ti dám ten klíč.
			AI_Output(other,self,"DIA_Lord_Hagen_Pass_01_07");	//Dobrá, udělám, co budu moci.
			AI_Output(self,other,"DIA_Lord_Hagen_Pass_01_08");	//Dobrá, tak jdi!
			MIS_RAVENTHREAT = LOG_Running;
			Log_CreateTopic(TOPIC_RAVENTHREAT,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_RAVENTHREAT,LOG_Running);
			B_LogEntry(TOPIC_RAVENTHREAT,"Než mě lord Hagen pustí do Hornického údolí, musím zjistit vše o magickém portálu, který nedávno nalezli mágové Vody. Chce vědět, co je za ním a jestli se třeba obávat nějaké hrozby.");
		}
		else
		{
			AI_Output(self,other,"DIA_Lord_Hagen_Pass_01_09");	//Pomohl jsi nám se zásobami, takže ti dám na výběr:
			AI_Output(self,other,"DIA_Lord_Hagen_Pass_01_10");	//Můžeš jít přímo do Hornického údolí,
			AI_Output(self,other,"DIA_Lord_Hagen_Pass_01_11");	//Nebo zjistit, co se děje za portálem mágů Vody.
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
			AI_Output(self,other,"DIA_Lord_Hagen_Pass_01_13");	//Nejprve mi dokaž, že se o sebe dovedeš postarat a dokonči svůj úkol.
			AI_Output(self,other,"DIA_Lord_Hagen_Pass_01_14");	//Pomoz mágům Vody s těmi jejich potížemi.
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
	description = "O tvém úkolu...";
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
	AI_Output(other,self,"DIA_Lord_Hagen_Proof_01_01");	//O tvém úkolu...
	AI_Output(self,other,"DIA_Lord_Hagen_Proof_01_02");	//Ano? Zjistil jsi něco?
	AI_Output(other,self,"DIA_Lord_Hagen_Proof_01_05");	//No, portál nalezen mágy Vody vede na neznámou část ostrova.
	AI_Output(other,self,"DIA_Lord_Hagen_Proof_01_06");	//Zdá se, že tam žila prastará civilizace, kterou chránil sám Adanos.
	AI_Output(other,self,"DIA_Lord_Hagen_Proof_01_07");	//Nicméně od těch dávných dob se tam mnoho změnilo a dnes tam kromě banditů a pirátů není ani noha.
	AI_Output(self,other,"DIA_Lord_Hagen_Proof_01_10");	//Hmm... (zamyšleně) To je dost podezřelé! Určitě se na něco chystají.
	AI_Output(other,self,"DIA_Lord_Hagen_Proof_01_11");	//Nemyslím.
	AI_Output(self,other,"DIA_Lord_Hagen_Proof_01_13");	//No, spoléhám na tvá slova.
	AI_Output(self,other,"DIA_Lord_Hagen_Proof_01_16");	//Myslím, že to stačí, abychom mohli kontrolovat celou situaci.
	MIS_RAVENTHREAT = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_RAVENTHREAT,LOG_SUCCESS);
	B_LogEntry(TOPIC_RAVENTHREAT,"Řekl jsem lordu Hagenovi o všem, co jsem zjistil. Myslím, že už můžu jít do Hornického údolí a přinést mu důkazy o přítomnosti draků.");
};


instance DIA_LORD_HAGEN_PROOFGIVEKEY(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 1;
	condition = dia_lord_hagen_proofgivekey_condition;
	information = dia_lord_hagen_proofgivekey_info;
	permanent = FALSE;
	description = "Můžu teď do Hornického údolí?";
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
	AI_Output(other,self,"DIA_Lord_Hagen_ProofGiveKey_01_01");	//Můžu teď do Hornického údolí?
	AI_Output(self,other,"DIA_Lord_Hagen_ProofGiveKey_01_02");	//(vážně) Ano. Teď už můžeš!
	AI_Output(self,other,"DIA_Lord_Hagen_Pass_04_01");	//Dám ti klíč od vrat v průsmyku. Budeš si ale muset najít způsob, jak proklouznout mezi vojskem skřetů.
	CreateInvItems(self,ItKe_Pass_MIS,1);
	B_GiveInvItems(self,other,ItKe_Pass_MIS,1);
	AI_Output(self,other,"DIA_Lord_Hagen_ProofGiveKey_01_03");	//Projdi průsmykem a dostaň se do Hornického údolí. Až tam budeš, najdi mou výpravu - a až se ti to podaří, promluv si s velitelem Garondem.
	AI_Output(self,other,"DIA_Lord_Hagen_Proof_04_02");	//Pokud někdo ví, jaká tam panuje situace, tak je to on.
	AI_Output(self,other,"DIA_Lord_Hagen_Pass_04_02");	//Nechť tě Innos ochraňuje.
	MIS_OLDWORLD = LOG_Running;
	Log_CreateTopic(Topic_MISOLDWORLD,LOG_MISSION);
	Log_SetTopicStatus(Topic_MISOLDWORLD,LOG_Running);
	B_LogEntry(Topic_MISOLDWORLD,"Lord Hagen si žádá důkaz, že armáda zla skutečně existuje. Musím se vydat do Hornického údolí a promluvit si s velitelem Garondem.");
	AI_StopProcessInfos(self);
};


instance DIA_Lord_Hagen_Khorinis(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 2;
	condition = DIA_Lord_Hagen_Khorinis_Condition;
	information = DIA_Lord_Hagen_Khorinis_Info;
	permanent = FALSE;
	description = "Proč jste přišli na Khorinis?";
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
	AI_Output(other,self,"DIA_Lord_Hagen_Khorinis_15_00");	//Proč jste přišli na Khorinis?
	AI_Output(self,other,"DIA_Lord_Hagen_Khorinis_04_01");	//Plníme důležitý úkol ve prospěch království. Naše rozkazy pocházejí přímo od krále Rhobara.
	AI_Output(self,other,"DIA_Lord_Hagen_Khorinis_04_02");	//Řekl jsem ti, že jsme poslali výpravu do Hornického údolí. To je hlavní důvod, proč tady jsme.

	if(((hero.guild == GIL_GUR) || (hero.guild == GIL_TPL)) && (MIS_PALADINWATCH == LOG_Running) && (IDOLORANQUESTIONONE == FALSE))
	{
		IDOLORANQUESTIONONE = TRUE;
		B_LogEntry(TOPIC_PALADINWATCH,"Podařilo se mi zjistit něco z důvodů, proč paladinové přijeli na Khorinis. Lord Hagen a paladinové mají na ostrově poslání od samotného krále Rhobara, které prý může rozhodnout o osudu království.");
	};
};


instance DIA_Lord_Hagen_Minental(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 2;
	condition = DIA_Lord_Hagen_Minental_Condition;
	information = DIA_Lord_Hagen_Minental_Info;
	permanent = TRUE;
	description = "Co dělají vaši muži v Hornickém údolí?";
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
	AI_Output(other,self,"DIA_Lord_Hagen_Minental_15_00");	//Co dělají vaši muži v Hornickém údolí?
	if(Hagen_BringProof == FALSE)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Minental_04_01");	//Nevidím důvod, proč bych ti měl říkat něco takového!
	}
	else
	{
		if(Garond.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			AI_Output(self,other,"DIA_Lord_Hagen_Minental_04_02");	//Byl jsi tam. Měl bys to vědět.
		}
		else
		{
			AI_Output(self,other,"DIA_Lord_Hagen_Minental_04_03");	//Dobrá, protože tam máš tak jako tak namířeno, tak ti to můžu říct.
		};
		AI_Output(self,other,"DIA_Lord_Hagen_Minental_04_04");	//Jde o magickou rudu. Může rozhodnout o výsledku války.
		AI_Output(self,other,"DIA_Lord_Hagen_Minental_04_05");	//Bez dostatku zbraní ukutých z magické rudy nemá královská armáda ani tu nejmenší šanci obstát v boji proti elitním skřetím válečníkům.
		if(other.guild != GIL_SLD)
		{
			AI_Output(self,other,"DIA_Lord_Hagen_Minental_04_06");	//A doly tady na ostrově jsou poslední, ke kterým ještě máme přístup.
		};
		AI_Output(self,other,"DIA_Lord_Hagen_Minental_04_07");	//Jakmile naši loď plně naložíme rudou, vrátíme se zpátky na pevninu.
		KnowsPaladins_Ore = TRUE;
		AI_Output(other,self,"DIA_Lord_Hagen_Minental_15_08");	//Válka se skřety se tedy nevyvíjí moc dobře, co?
		AI_Output(self,other,"DIA_Lord_Hagen_Minental_04_09");	//Už tak jsem toho řekl víc, než je zdrávo.
		if(((hero.guild == GIL_GUR) || (hero.guild == GIL_TPL)) && (MIS_PALADINWATCH == LOG_Running) && (IDOLORANQUESTIONTWO == FALSE))
		{
			IDOLORANQUESTIONTWO = TRUE;
			B_LogEntry(TOPIC_PALADINWATCH,"Zdá se, že hlavní příčinou příchodu paladinů na ostrov je magická ruda. Bez dostatečného množství rudy nebude král mít šanci proti skřetům. Posádka, která přišla do Hornického údolí, má za úkol objasnit situaci ohledně možnosti těžby tady na ostrově. Poté se zřejmě plánují vrátit zpátky na kontinent.");
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
	description = "Hledám mistra meče.";
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
	AI_Output(other,self,"DIA_Hagen_CanTeach_15_00");	//Hledám mistra meče.
	AI_Output(self,other,"DIA_Hagen_CanTeach_04_01");	//Vážně? Jednoho jsi právě našel.
	LordHagen_Teach2H = TRUE;
	B_LogEntry(TOPIC_CityTeacher,"Lord Hagen mě zasvětí do tajů boje s obouručními zbraněmi.");
};


instance DIA_Hagen_Teach(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 100;
	condition = DIA_Hagen_Teach_Condition;
	information = DIA_Hagen_Teach_Info;
	permanent = TRUE;
	description = "Pojďme cvičit.";
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
	AI_Output(other,self,"DIA_Hagen_Teach_15_00");	//Pojďme cvičit.
	Info_ClearChoices(DIA_Hagen_Teach);
	Info_AddChoice(DIA_Hagen_Teach,Dialog_Back,DIA_Hagen_Teach_Back);
	Info_AddChoice(DIA_Hagen_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Hagen_Teach_2H_1);
	Info_AddChoice(DIA_Hagen_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Hagen_Teach_2H_5);
};

func void DIA_Hagen_Teach_Back()
{
	if(other.HitChance[NPC_TALENT_2H] >= 100)
	{
		AI_Output(self,other,"DIA_Hagen_Teach_04_00");	//Jsi zkušený šermíř. Už tě nic nedokážu naučit.
		AI_Output(self,other,"DIA_Hagen_Teach_04_01");	//Nechť tvé další skutky provádí moudrost mistra meče.
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
	description = "Chtěl bych vstoupit do služby řádu.";
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
	AI_Output(other,self,"DIA_Lord_Hagen_Knight_15_00");	//Chtěl bych vstoupit do služby řádu.

	if(MIS_RescueBennet == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Knight_04_01");	//Dobrá, už jsi dokázal, že máš dost odvahy, schopnosti a zkušeností, abys mohl sloužit Innosovi.
		AI_Output(self,other,"DIA_Lord_Hagen_Knight_04_02");	//Tvé skutky jsou dostatečným důkazem čistého srdce.
		AI_Output(self,other,"DIA_Lord_Hagen_Knight_04_03");	//Je-li to tvé přání, vítám tě v našem řádu.
		Info_ClearChoices(DIA_Lord_Hagen_Knight);
		Info_AddChoice(DIA_Lord_Hagen_Knight,"Ještě si nejsem tak úplně jistý.",DIA_Lord_Hagen_Knight_No);
		Info_AddChoice(DIA_Lord_Hagen_Knight,"Jsem připraven!",DIA_Lord_Hagen_Knight_Yes);
	}
	else
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Knight_04_04");	//Být Innosovým válečníkem znamená zasvětit všechny své činy Innosovým záměrům.
		AI_Output(self,other,"DIA_Lord_Hagen_Knight_04_05");	//Do řádu jsou přijati jen nejčestnější a nejstatečnější válečníci.
		AI_Output(self,other,"DIA_Lord_Hagen_Knight_04_06");	//Pokud jsi pevně rozhodnut stát se paladinem, musíš nejprve prokázat, že jsi toho hoden.
	};
	Hagen_GaveInfoKnight = TRUE;
};

func void DIA_Lord_Hagen_Knight_No()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Knight_No_15_00");	//Ještě si nejsem tak úplně jistý.
	AI_Output(self,other,"DIA_Lord_Hagen_Knight_No_04_01");	//Tak jdi a očisti své srdce od pochybností. Vrať se, až budeš připraven.
	Info_ClearChoices(DIA_Lord_Hagen_Knight);
};

func void DIA_Lord_Hagen_Knight_Yes()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Knight_Yes_15_00");	//Jsem připraven!
	AI_Output(self,other,"DIA_Lord_Hagen_Knight_Yes_04_01");	//(triumfálně) Tak budiž dle tvé vůle!
	AI_Output(self,other,"DIA_Lord_Hagen_Knight_Yes_04_02");	//Mnoho mužů se vydalo touto cestou a položili své životy ve jménu Innose.
	AI_Output(self,other,"DIA_Lord_Hagen_Knight_Yes_04_03");	//Přísaháš, že tvé skutky budou dělat jejich smrti čest a budou hlásat slávu Innosovu?
	AI_Output(other,self,"DIA_Lord_Hagen_Knight_Yes_15_04");	//Přísahám!
	AI_Output(self,other,"DIA_Lord_Hagen_Knight_Yes_04_05");	//Od této chvíle tě tedy prohlašuji členem našeho společenstva.
	AI_Output(self,other,"DIA_Lord_Hagen_Knight_Yes_04_06");	//Zároveň tě ustanovuji Innosovým válečníkem.
	AI_Output(self,other,"DIA_Lord_Hagen_Knight_Yes_04_07");	//Dávám ti zbraně a zbroj rytíře. Nos je s hrdostí, rytíři!
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

	AI_Output(self,other,"DIA_Lord_Hagen_Knight_Yes_04_08");	//Dále, na základě tvé hodnosti ti dovoluji přístup do kláštera.
	if(Npc_IsDead(Albrecht) == FALSE)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Knight_Yes_04_09");	//Albrecht tě naučí naší magii, stačí, když za ním půjdeš a promluvíš si s ním.
	};
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_02");	//A jsou ti samozřejmě otevřeny naše ubikace na horním konci města.

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
	description = "Jak mohu dokázat, že jsem toho hoden?";
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
	AI_Output(other,self,"DIA_Lord_Hagen_WhatProof_15_00");	//Jak mohu dokázat, že jsem toho hoden?
	AI_Output(self,other,"DIA_Lord_Hagen_WhatProof_04_01");	//To prokáží tvé skutky.
	AI_Output(self,other,"DIA_Lord_Hagen_WhatProof_04_02");	//Bojujeme v Innosově jménu za svobodu a spravedlnost.
	AI_Output(self,other,"DIA_Lord_Hagen_WhatProof_04_03");	//Bojujeme proti Beliarovi a jeho pohůnkům, kteří chtějí zničit Innosův řád.
	AI_Output(other,self,"DIA_Lord_Hagen_WhatProof_15_04");	//Rozumím.
	AI_Output(self,other,"DIA_Lord_Hagen_WhatProof_04_05");	//Vůbec ničemu nerozumíš! Naše čest je náš život a náš život je Innos.
	AI_Output(self,other,"DIA_Lord_Hagen_WhatProof_04_06");	//Každý paladin vstupuje do bitvy s Innosovým jménem na rtech, a mnozí z nás již položili život na oltář věčného boje dobra a zla.
	AI_Output(self,other,"DIA_Lord_Hagen_WhatProof_04_07");	//My všichni ctíme tuto tradici. Pokud selžeme, znesvětíme památku našich padlých druhů.
	AI_Output(self,other,"DIA_Lord_Hagen_WhatProof_04_08");	//Jen ten, kdo tohle beze zbytku pochopí, je hoden stát se paladinem.
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
	description = "Jak to vypadá?";
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
	AI_Output(other,self,"DIA_Lord_Hagen_KAP3U4_PERM_15_00");	//Jak to vypadá?
	if(MIS_OLDWORLD == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Add_04_04");	//Musím najít způsob, jak tuhle výpravu zachránit.
		AI_Output(self,other,"DIA_Lord_Hagen_Add_04_05");	//Musíme s těmi draky něco udělat.
		if(Hagen_KnowsEyeKaputt == FALSE)
		{
			AI_Output(self,other,"DIA_Lord_Hagen_Add_04_06");	//(k sobě) Možná by nás teď mohlo zachránit Innosovo oko.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Lord_Hagen_KAP3U4_PERM_04_01");	//Asi jsem přišel o rozum. Jsem voják, ne byrokrat.
		AI_Output(self,other,"DIA_Lord_Hagen_KAP3U4_PERM_04_02");	//S tímhle vším papírováním, které mám na krku, si sotva dokážu vzpomenout, jaké to je třímat meč.
	};
};


instance DIA_Lord_Hagen_EyeBroken(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 1;
	condition = DIA_Lord_Hagen_EyeBroken_Condition;
	information = DIA_Lord_Hagen_EyeBroken_Info;
	permanent = FALSE;
	description = "Našel jsem Innosovo oko, ale je rozbité.";
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
	AI_Output(other,self,"DIA_Lord_Hagen_Add_15_07");	//Našel jsem Innosovo oko, ale je rozbité.
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_08");	//COŽE? U Innose! Cos to udělal? To Oko potřebujeme!
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_09");	//Promluv si s Pyrokarem! Musí existovat nějaký způsob, jak ho zase opravit.
	Hagen_KnowsEyeKaputt = TRUE;
};

instance DIA_Lord_Hagen_BACKINTOWN(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 2;
	condition = DIA_Lord_Hagen_BACKINTOWN_Condition;
	information = DIA_Lord_Hagen_BACKINTOWN_Info;
	permanent = FALSE;
	description = "Přináším novinky od Garonda.";
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

	AI_Output(other,self,"DIA_Lord_Hagen_BACKINTOWN_15_00");	//Přináším novinky od Garonda. Dal mi pro tebe tenhle dopis.
	B_GiveInvItems(other,self,ItWr_PaladinLetter_MIS,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Lord_Hagen_BACKINTOWN_04_01");	//Naše postavení je horší, než jsem se obával. Ale podej mi hlášení o situaci v Hornickém údolí.
	AI_Output(other,self,"DIA_Lord_Hagen_BACKINTOWN_15_02");	//Paladinové jsou obklíčeni na hradě v Hornickém údolí, všude kolem jsou skřeti.
	AI_Output(other,self,"DIA_Lord_Hagen_BACKINTOWN_15_03");	//Při dolování byly obrovské ztráty a vytěžilo se jen pár beden rudy.
	AI_Output(other,self,"DIA_Lord_Hagen_BACKINTOWN_15_04");	//No, pokud můžu říct svůj názor, tak když těm chlapíkům nikdo nepomůže, jsou ztraceni. Tak to alespoň vypadá.
	AI_Output(self,other,"DIA_Lord_Hagen_BACKINTOWN_04_05");	//Najdu způsob, jak tu výpravu zachránit. Udělal jsi toho pro nás tolik. Innos se ti odvděčí.
	AI_Output(other,self,"DIA_Lord_Hagen_BACKINTOWN_15_06");	//Nechci jeho vděčnost. Chci jeho Oko.
	AI_Output(self,other,"DIA_Lord_Hagen_BACKINTOWN_04_07");	//Ano, samozřejmě. Plním své sliby. Vezmi si tenhle dopis. Otevře ti brány kláštera.
	B_GiveInvItems(self,other,ItWr_PermissionToWearInnosEye_MIS,1);
	AI_Output(self,other,"DIA_Lord_Hagen_BACKINTOWN_04_08");	//Promluv si s Pyrokarem, nejvyšším mágem Ohně, a prokaž se mu touhle listinou. Zařídí ti přístup k Innosovu oku.

	if(((hero.guild == GIL_GUR) || (hero.guild == GIL_TPL)) && (MIS_PALADINWATCH == LOG_Running) && (IDOLORANQUESTIONFIVE == FALSE))
	{
		IDOLORANQUESTIONFIVE = TRUE;
		IDOLORANQUESTIONFULLCOMPLETE = TRUE;
		B_LogEntry_Quiet(TOPIC_PALADINWATCH,"Další plány lorda Hagena jsou jasné - najít způsob, jak vysvobodit své lidi z obklíčení. Dokud se mu to nepovede, paladinové ostrov neopustí.");
	};

	MIS_OLDWORLD = LOG_SUCCESS;
	CanStartMyCamp = TRUE;
	B_LogEntry(TOPIC_INNOSEYE,"Lord Hagen mi předal zprávu, která přiměje mistra Pyrokara, aby mi v klášteře vydal Innosovo oko.");
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
	description = "Potřeboval bych si s tebou promluvit o Bennetovi.";
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
	AI_Output(other,self,"DIA_Lord_Hagen_RescueBennet_15_00");	//Potřeboval bych si s tebou promluvit o Bennetovi.
	if(Hagen_einmalBennet == FALSE)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_04_01");	//Ale to je přece ten žoldák, co zavraždil jednoho z mých mužů.
		Hagen_einmalBennet = TRUE;
	};
	Info_ClearChoices(DIA_Lord_Hagen_RescueBennet);
	Info_AddChoice(DIA_Lord_Hagen_RescueBennet,Dialog_Back,DIA_Lord_Hagen_RescueBennet_Back);

	if(RecueBennet_KnowsCornelius == FALSE)
	{
		Info_AddChoice(DIA_Lord_Hagen_RescueBennet,"Jak si můžeš být tak jistý, že je vrahem právě Bennet?",DIA_Lord_Hagen_RescueBennet_WhySure);
	};

	Info_AddChoice(DIA_Lord_Hagen_RescueBennet,"Věřím, že Bennet je nevinný.",DIA_Lord_Hagen_RescueBennet_Innoscent);

	if((MIS_RescueBennet == LOG_Running) && (MIS_RitualInnosEyeRepair == LOG_Running) && (Hagen_KnowsEyeKaputt == TRUE))
	{
		Info_AddChoice(DIA_Lord_Hagen_RescueBennet,"Bennet by nám mohl pomoci opravit Innosovo oko.",DIA_Lord_Hagen_RescueBennet_Hilfe);
	};
};

func void DIA_Lord_Hagen_RescueBennet_Hilfe()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Add_15_16");	//Bennet by nám mohl pomoci opravit Innosovo oko.
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_17");	//I kdyby dokázal přitáhnout na zem moc samotného Innose...
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_18");	//Zavraždil paladina. Za to bude popraven!
};

func void DIA_Lord_Hagen_RescueBennet_Back()
{
	Info_ClearChoices(DIA_Lord_Hagen_RescueBennet);
};

func void DIA_Lord_Hagen_RescueBennet_WhySure()
{
	AI_Output(other,self,"DIA_Lord_Hagen_RescueBennet_WhySure_15_00");	//Jak si můžeš být tak jistý, že je vrahem právě Bennet?
	AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_WhySure_04_01");	//Máme svědka.
	AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_WhySure_04_02");	//Jak vidíš, není o vině toho žoldáka žádných pochyb.
	AI_Output(other,self,"DIA_Lord_Hagen_RescueBennet_Witness_15_00");	//Kdo je tím svědkem?
	AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_Witness_04_01");	//Cornelius, tajemník místodržícího. On tu vraždu viděl.
	AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_Witness_04_02");	//Jeho popis padne bez jakýchkoliv pochyb na Benneta. Co se mě týče, věc je vyřízena.
	AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_Witness_04_03");	//Ten žoldák bude viset za velezradu.
	B_LogEntry(TOPIC_RescueBennet,"Svědkem je tajemník místodržícího, Cornelius. Tvrdí, že celou vraždu viděl.");
	RecueBennet_KnowsCornelius = TRUE;
};

func void DIA_Lord_Hagen_RescueBennet_Innoscent()
{
	AI_Output(other,self,"DIA_Lord_Hagen_RescueBennet_Innoscent_15_00");	//Věřím, že Bennet je nevinný.
	AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_Innoscent_04_01");	//Důkazy jsou jasné. Je vinen.
	AI_Output(other,self,"DIA_Lord_Hagen_RescueBennet_Innoscent_15_02");	//A co když je důkaz mylný?
	AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_Innoscent_04_03");	//Dávej pozor, co říkáš. Vznášíš vážné obvinění.
	AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_Innoscent_04_04");	//Pokud mi nemůžeš předložit důkazy o tom, že svědek lhal, raději mlč.
};


instance DIA_Lord_Hagen_Cornelius(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 3;
	condition = DIA_Lord_Hagen_Cornelius_Condition;
	information = DIA_Lord_Hagen_Cornelius_Info;
	permanent = TRUE;
	description = "Cornelius lhal.";
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
	AI_Output(other,self,"DIA_Lord_Hagen_Cornelius_15_00");	//Cornelius lhal.
	AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_01");	//Jak to víš?
	AI_Output(other,self,"DIA_Lord_Hagen_Cornelius_15_02");	//Mám jeho deník. Je v něm všechno.
	B_GiveInvItems(other,self,ItWr_CorneliusTagebuch_Mis,1);
	AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_03");	//(zuřivě) Ten slizký bastard!
	AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_04");	//Pod vahou nových důkazů mi nic jiného nezbývá.
	AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_05");	//Z moci úřadu svěřeného mi králem a církví prohlašuji...
	AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_06");	//... že vězeň Bennet je zbaven všech obvinění a tudíž svobodný člověk.
	AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_07");	//Cornelius bude s okamžitou platností vzat do vazby pro křivopřísežnictví.
	if(Npc_IsDead(Cornelius) == TRUE)
	{
		AI_Output(other,self,"DIA_Lord_Hagen_Cornelius_15_08");	//Ušetři si námahu. Cornelius je mrtvý.
		AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_09");	//V tom případě se mu již dostalo spravedlivého trestu. Dobrá práce.
	}
	else if(CorneliusFlee == TRUE)
	{
		AI_Output(other,self,"DIA_Lord_Hagen_Cornelius_15_10");	//Ukrývá se.
		AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_11");	//Dříve nebo později se objeví. Pak ho zatkneme.
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
		AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_12");	//Tvé skutky nás všechny zachránili od veliké hanby.
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
	description = "Přináším Oko!";
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
	AI_Output(other,self,"DIA_Lord_Hagen_Add_15_10");	//Přináším Oko!
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_11");	//(uctivě) Neseš Oko!
	if(Hagen_KnowsEyeKaputt == TRUE)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Add_04_12");	//A dal jsi ho zpět dohromady!
	};
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_13");	//V tom případě jsi Innosův vyvolený!
	AI_Output(other,self,"DIA_Lord_Hagen_Add_15_14");	//Vyrazím na cestu a zabiji všechny draky v Hornickém údolí!
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_15");	//Nechť tě Innos doprovází a svou mocí zničí Zlo!
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
	description = "Na zemi útočí elitní skřetí válečníci.";
};


func int DIA_Lord_Hagen_ANTIPALADINE_Condition()
{
	if(((TalkedTo_AntiPaladin == TRUE) || Npc_HasItems(other,ItRi_OrcEliteRing)) && (MIS_ReadyforChapter4 == TRUE) && (Hagen_SawOrcRing == FALSE) && (MIS_ORCGREATWAR == FALSE))
	{
		return TRUE;
	};
};


var int Hagen_SawOrcRing;

func void DIA_Lord_Hagen_ANTIPALADINE_Info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_ANTIPALADINE_15_00");	//Na zemi útočí elitní skřetí válečníci.
	Log_CreateTopic(TOPIC_OrcElite,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OrcElite,LOG_Running);
	B_LogEntry(TOPIC_OrcElite,"Zpravil jsem lorda Hagena o postupujících tlupách skřetích nájezdníků.");
	if((TalkedTo_AntiPaladin == TRUE) && (MIS_KillOrkOberst == 0))
	{
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_01");	//Co tě k tomu vede?
		AI_Output(other,self,"DIA_Lord_Hagen_ANTIPALADINE_15_02");	//Mluvil jsem s jedním z nich. Padlo tvoje jméno.
	};
	AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_03");	//Nesmysl. Moji lidé zatím žádnou masivní invazi skřetů nehlásili.
	AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_04");	//Možná se v nedalekých lesích ztratil některý z jejich zvědů.
	if(Npc_HasItems(other,ItRi_OrcEliteRing))
	{
		AI_Output(other,self,"DIA_Lord_Hagen_ANTIPALADINE_15_05");	//Nebyli to žádní zvědové. Jednomu z nich jsem vzal tento prsten.
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_06");	//Ukaž mi ho.
		B_GiveInvItems(other,self,ItRi_OrcEliteRing,1);
		Npc_RemoveInvItems(self,ItRi_OrcEliteRing,Npc_HasItems(self,ItRi_OrcEliteRing));
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_07");	//(zamyšleně) Hmm. Tak to je docela znepokojivé.
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_08");	//Tohle je znamení jejich moci. Takže skřeti opustili své palisády a bojují na otevřeném prostranství.
		AI_Output(other,self,"DIA_Lord_Hagen_ANTIPALADINE_15_09");	//Zatím jsem jich moc neviděl. Hlavně jejich velitele a jen pár válečníků.
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_10");	//Vážně? V tom případě musejí mít za lubem něco jiného. To mi ke skřetům moc nesedne, že by jejich vůdci sami opustili své ochranné palisády.
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_11");	//Mohla by to však být ideální příležitost, jak jim uštědřit citelný úder.
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_12");	//Pokud by přišli o své velitele, spadne jim morálka na bod mrazu.
		if(hero.guild == GIL_PAL)
		{
			AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_13");	//Máš nový úkol, rytíři. Zabij všechny skřetí velitele, které v téhle oblasti najdeš.
		}
		else
		{
			AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_19");	//Máš nový úkol. Zabij všechny skřetí velitele, které v téhle oblasti najdeš.
		};
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_14");	//Přines mi jejich prsteny. To by mohlo skřety srazit na kolena.
		B_LogEntry(TOPIC_OrcElite,"Podařilo se mi přinést lordu Hagenovi důkaz - prsten skřetího vojevůdce. Požádal mě, abych mu přinesl všechny, které najdu.");
		if((Npc_IsDead(Ingmar) == FALSE) && (MIS_KillOrkOberst == 0))
		{
			AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_15");	//Poraď se s Ingmarem. Může ti prozradit pár taktik, které by se ti při bojích se skřetími veliteli mohly hodit.
			AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_16");	//Skřetí elitní válečníci jsou jeho specialita. Měl s nimi často co do činění.
			B_LogEntry(TOPIC_OrcElite,"Elitní skřetí válečníci jsou Ingmarovou specialitou.");
		};
		Hagen_SawOrcRing = TRUE;
		B_GivePlayerXP(XP_PAL_OrcRing);
	}
	else
	{
		if(MIS_KillOrkOberst == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_17");	//Tvoje pouhé tvrzení, že jsi zabil jednoho ze skřetích velitelů, mi nestačí.
		};
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_18");	//Pokud to nemám brát na lehkou váhu, potřebuji nějaký hmatatelnější důkaz.
		B_LogEntry(TOPIC_OrcElite,"Hagen mi pořád nechce věřit. Žádá důkaz, že elitní válečníci skutečně útočí na civilizované kraje. No, spíš by mě překvapilo, kdyby to bylo naopak.");
	};
};

instance DIA_Lord_Hagen_RINGEBRINGEN(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 5;
	condition = DIA_Lord_Hagen_RINGEBRINGEN_Condition;
	information = DIA_Lord_Hagen_RINGEBRINGEN_Info;
	permanent = TRUE;
	description = "Chci podat hlášení ohledně těch skřetích velitelů.";
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

	AI_Output(other,self,"DIA_Lord_Hagen_RINGEBRINGEN_15_00");	//Chci podat hlášení ohledně těch skřetích velitelů.
	AI_Output(self,other,"DIA_Lord_Hagen_RINGEBRINGEN_04_01");	//Tak povídej.

	XP_PAL_OrcRings = 50;
	Ringcount = Npc_HasItems(other,ItRi_OrcEliteRing);

	if(Ringcount == 1)
	{
		AI_Output(other,self,"DIA_Lord_Hagen_RINGEBRINGEN_15_02");	//Mám pro tebe další skřetí prsten.
		B_GivePlayerXP(XP_PAL_OrcRing);
		B_GiveInvItems(other,self,ItRi_OrcEliteRing,1);
		Npc_RemoveInvItems(self,ItRi_OrcEliteRing,Npc_HasItems(self,ItRi_OrcEliteRing));
		OrkRingCounter = OrkRingCounter + 1;
	}
	else
	{
		AI_Output(other,self,"DIA_Lord_Hagen_RINGEBRINGEN_15_03");	//Mám pro tebe další skřetí prsteny.
		B_GiveInvItems(other,self,ItRi_OrcEliteRing,Ringcount);
		Npc_RemoveInvItems(self,ItRi_OrcEliteRing,Npc_HasItems(self,ItRi_OrcEliteRing));
		XP_PAL_OrcRings = Ringcount * XP_PAL_OrcRing;
		OrkRingCounter = OrkRingCounter + Ringcount;
		B_GivePlayerXP(XP_PAL_OrcRings);
	};
	AI_Output(self,other,"DIA_Lord_Hagen_RINGEBRINGEN_04_04");	//Jsem na tebe hrdý. Jen tak dál!

	if(OrkRingCounter <= 10)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_RINGEBRINGEN_04_05");	//Možná tam ještě někde nějaký je.
	}
	else if(OrkRingCounter <= 20)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_RINGEBRINGEN_04_06");	//Už brzy je srazíme na kolena.
	}
	else
	{
		AI_Output(self,other,"DIA_Lord_Hagen_RINGEBRINGEN_04_07");	//Vážně by mě překvapilo, kdyby se jich tu potulovalo o mnoho víc.
		AI_Output(self,other,"DIA_Lord_Hagen_RINGEBRINGEN_04_08");	//Jejich prsteny mi samozřejmě můžeš nosit i nadále, ale myslím, že skřeti už náš vzkaz pochopili.
		TOPIC_END_OrcElite = TRUE;
		Log_SetTopicStatus(TOPIC_OrcElite,LOG_SUCCESS);
		B_LogEntry(TOPIC_OrcElite,"Skupiny skřetích válečníků byly poraženy. Lord Hagen byl potěšen mou prací.");
	};
};

instance DIA_Lord_Hagen_RINGEBRINGENMORE(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 5;
	condition = DIA_Lord_Hagen_RINGEBRINGENMORE_Condition;
	information = DIA_Lord_Hagen_RINGEBRINGENMORE_Info;
	permanent = TRUE;
	description = "Mám pro tebe další skřetí prsteny.";
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
		AI_Output(other,self,"DIA_Lord_Hagen_RINGEBRINGEN_15_02");	//Mám pro tebe další skřetí prsten.
		B_GivePlayerXP(XP_PAL_OrcRing);
		B_GiveInvItems(other,self,ItRi_OrcEliteRing,1);
		Npc_RemoveInvItems(self,ItRi_OrcEliteRing,Npc_HasItems(self,ItRi_OrcEliteRing));
	}
	else
	{
		XP_PAL_OrcRings = Ringcount * XP_PAL_OrcRing;
		B_GivePlayerXP(XP_PAL_OrcRings);
		AI_Output(other,self,"DIA_Lord_Hagen_RINGEBRINGEN_15_03");	//Mám pro tebe další skřetí prsteny.
		B_GiveInvItems(other,self,ItRi_OrcEliteRing,Ringcount);
		Npc_RemoveInvItems(self,ItRi_OrcEliteRing,Npc_HasItems(self,ItRi_OrcEliteRing));
	};

	AI_Output(self,other,"DIA_Lord_Hagen_RINGEBRINGEN_04_04");	//Jsem na tebe hrdý. Jen tak dál!
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
	description = "Draci jsou mrtví.";
};


func int DIA_Lord_Hagen_AllDragonsDead_Condition()
{
	if((Kapitel == 5) && (MIS_ORCGREATWAR == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_AllDragonsDead_Info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_AllDragonsDead_15_00");	//Draci jsou mrtví.
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_19");	//Věděl jsem, že ti Innos dá sílu porazit draky!
	AI_Output(self,other,"DIA_Lord_Hagen_AllDragonsDead_04_02");	//Kde je ruda?
	AI_Output(other,self,"DIA_Lord_Hagen_AllDragonsDead_15_03");	//Skřeti ještě pořád obléhají hrad v Hornickém údolí. Garond nemá žádnou šanci opevnění opustit, dokud obléhání neskončí.
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_20");	//(zuřivě) Zatraceně!
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_21");	//Jestliže Garond nedokáže tu situaci zvládnout, budu se o to muset postarat sám.
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_22");	//Pár skřetů mě nezastaví! Mě ne!
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_23");	//Už jsem informoval své muže. Jsme připraveni k odjezdu.
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_24");	//Pojedeme VŠICHNI. Nechám na lodi jen nezbytnou posádku.
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_25");	//To by mělo stačit na to, abychom s těmi skřety konečně zametli!
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
	description = "Potřebuji loď.";
};


func int DIA_Lord_Hagen_NeedShip_Condition()
{
	if((ItWr_SCReadsHallsofIrdorath == TRUE) && (MIS_ORCGREATWAR == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_NeedShip_Info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_NeedShip_15_00");	//Potřebuji loď.

	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_NeedShip_04_01");	//To hodně lidí, vojáku.
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_NeedShip_04_02");	//To slyším skoro každý den, ctihodnosti. Ale...
	};
	AI_Output(self,other,"DIA_Lord_Hagen_NeedShip_04_03");	//Nemáš dokonce ani kapitána, o posádce nemluvě.
	AI_Output(other,self,"DIA_Lord_Hagen_NeedShip_15_04");	//Co ta loď, která kotví v přístavu?
	AI_Output(self,other,"DIA_Lord_Hagen_NeedShip_04_05");	//Ta je moje a moje také zůstane. Až nadejde čas, odvezeme s ní rudu.
	AI_Output(self,other,"DIA_Lord_Hagen_NeedShip_04_06");	//Ale až to bude za námi, můžeš se mě zeptat znovu.
};


instance DIA_Lord_Hagen_GateOpen(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 5;
	condition = DIA_Lord_Hagen_GateOpen_Condition;
	information = DIA_Lord_Hagen_GateOpen_Info;
	permanent = FALSE;
	description = "Skřeti vtrhli do hradu v Hornickém údolí!";
};

func int DIA_Lord_Hagen_GateOpen_Condition()
{
	if((MIS_OCGateOpen == TRUE) && Npc_KnowsInfo(other,DIA_Lord_Hagen_AllDragonsDead) && (MIS_ORCGREATWAR == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_GateOpen_Info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Add_15_29");	//Skřeti vtrhli do hradu v Hornickém údolí!
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_30");	//U Innose! Co přesně se tam stalo?
	AI_Output(other,self,"DIA_Lord_Hagen_Add_15_31");	//Nějak se musela otevřít brána.
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_32");	//Nějak?! Jak by to bylo možné... Na hradě musí být zrádce!
};


instance DIA_Lord_Hagen_Perm5(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 5;
	condition = DIA_Lord_Hagen_Perm5_Condition;
	information = DIA_Lord_Hagen_Perm5_Info;
	permanent = TRUE;
	description = "Na co čekáte?";
};


func int DIA_Lord_Hagen_Perm5_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lord_Hagen_AllDragonsDead) && (MIS_ORCGREATWAR == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_Perm5_Info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Add_15_33");	//Na co čekáte?
	if(MIS_OCGateOpen == FALSE)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Add_04_26");	//Na výstroj a proviant. Pak vyrazíme!
	}
	else
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Add_04_27");	//Teď, když jsou na hradě skřeti, potřebujeme proviantu ještě víc než předtím.
		AI_Output(self,other,"DIA_Lord_Hagen_Add_04_28");	//To ale náš odchod o moc nezdrží.
	};
};

instance DIA_LORD_HAGEN_PICKPOCKET(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 900;
	condition = dia_lord_hagen_pickpocket_condition;
	information = dia_lord_hagen_pickpocket_info;
	permanent = TRUE;
	description = "(zkusit ukrást klíč)";
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
			B_LogEntry(TOPIC_GOLDDRAGONPORTAL,"Ukradl jsem lordu Hagenovi klíč! Myslím, že bych se měl vrátit za Xardasem o povědět mu o tom.");
		}
		else if(KREOLLINE == TRUE)
		{
			B_LogEntry(TOPIC_GOLDDRAGONPORTAL,"Ukradl jsem lordu Hagenovi klíč! Myslím, že bych se měl vrátit za Creolem o povědět mu o tom.");
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
	description = "Chtěl bych ti o něčem říct...";
};


func int dia_lord_hagen_melhior_condition()
{
	if((MELHIORPISSOFF == TRUE) && (MIS_ORCGREATWAR == FALSE))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_melhior_info()
{
	var C_Npc melhior;
	melhior = Hlp_GetNpc(pal_187_melhior);
	AI_Output(other,self,"DIA_Lord_Hagen_Melhior_01_00");	//Chtěl bych ti o něčem říct...
	if(other.guild == GIL_PAL)
	{
		B_GivePlayerXP(250);
		AI_Output(other,self,"DIA_Lord_Hagen_Melhior_01_02");	//Jeden z paladinů opustil svoji pozici!
		AI_Output(self,other,"DIA_Lord_Hagen_Melhior_01_04");	//(rozhořčeně) Co tím myslíš? Vysvětli mi to!
		AI_Output(other,self,"DIA_Lord_Hagen_Melhior_01_05");	//Během své hlídky opustil svou pozici a místo toho se oddává pití.
		AI_Output(self,other,"DIA_Lord_Hagen_Melhior_01_08");	//CO?! To je urážka našeho řádu!
		AI_Output(self,other,"DIA_Lord_Hagen_Melhior_01_11");	//Jak se jmenuje?
		AI_Output(other,self,"DIA_Lord_Hagen_Melhior_01_12");	//Melchior.
		AI_Output(self,other,"DIA_Lord_Hagen_Melhior_01_13");	//No - postarám se, aby dostal, co si zaslouží. Taková osoba u nás nemá místo!
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
		AI_Output(other,self,"DIA_Lord_Hagen_Melhior_01_17");	//Jeden z paladinů opustil svoji pozici!
		AI_Output(self,other,"DIA_Lord_Hagen_Melhior_01_19");	//(rozhořčeně) Co tím myslíš? Vysvětli mi to!
		AI_Output(other,self,"DIA_Lord_Hagen_Melhior_01_20");	//Během své hlídky opustil svou pozici a místo toho se oddává pití.
		AI_Output(self,other,"DIA_Lord_Hagen_Melhior_01_23");	//CO?! To je urážka našeho řádu!
		AI_Output(self,other,"DIA_Lord_Hagen_Melhior_01_27");	//Jak se jmenuje?
		AI_Output(other,self,"DIA_Lord_Hagen_Melhior_01_28");	//Melchior.
		AI_Output(self,other,"DIA_Lord_Hagen_Melhior_01_29");	//No - postarám se, aby dostal, co si zaslouží. Taková osoba u nás nemá místo!
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
		AI_Output(other,self,"DIA_Lord_Hagen_Melhior_01_33");	//Jeden z paladinů opustil svoji pozici!
		AI_Output(self,other,"DIA_Lord_Hagen_Melhior_01_35");	//(rozhořčeně) Co tím myslíš? Vysvětli mi to!
		AI_Output(other,self,"DIA_Lord_Hagen_Melhior_01_36");	//Během své hlídky opustil svou pozici a místo toho se oddává pití.
		AI_Output(self,other,"DIA_Lord_Hagen_Melhior_01_39");	//CO?! To je urážka našeho řádu!
		AI_Output(self,other,"DIA_Lord_Hagen_Melhior_01_42");	//Jak se jmenuje?
		AI_Output(other,self,"DIA_Lord_Hagen_Melhior_01_43");	//Melchior.
		AI_Output(self,other,"DIA_Lord_Hagen_Melhior_01_44");	//No - postarám se, aby dostal, co si zaslouží. Taková osoba u nás nemá místo!
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
		AI_Output(other,self,"DIA_Lord_Hagen_Melhior_01_48");	//Jeden z paladinů opustil svoji pozici!
		AI_Output(self,other,"DIA_Lord_Hagen_Melhior_01_50");	//(rozhořčeně) Co tím myslíš? Vysvětli mi to!
		AI_Output(other,self,"DIA_Lord_Hagen_Melhior_01_51");	//Během své hlídky opustil svou pozici a místo toho se oddává pití.
		AI_Output(self,other,"DIA_Lord_Hagen_Melhior_01_54");	//CO?! To je urážka našeho řádu!
		AI_Output(self,other,"DIA_Lord_Hagen_Melhior_01_57");	//Jak se jmenuje?
		AI_Output(other,self,"DIA_Lord_Hagen_Melhior_01_58");	//Melchior.
		AI_Output(self,other,"DIA_Lord_Hagen_Melhior_01_59");	//No - postarám se, aby dostal, co si zaslouží. Taková osoba u nás nemá místo!
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
		AI_Output(other,self,"DIA_Lord_Hagen_Melhior_01_63");	//Jeden z paladinů opustil svoji pozici!
		AI_Output(self,other,"DIA_Lord_Hagen_Melhior_01_65");	//(rozhořčeně) Co tím myslíš? Vysvětli mi to!
		AI_Output(other,self,"DIA_Lord_Hagen_Melhior_01_66");	//Během své hlídky opustil svou pozici a místo toho se oddává pití.
		AI_Output(self,other,"DIA_Lord_Hagen_Melhior_01_70");	//Opravdu si myslíš, že ti budu věřit, nekromante?
		AI_Output(self,other,"DIA_Lord_Hagen_Melhior_01_71");	//To, co říkáš, nemůže být pravda! Absolutní nesmysly!
		AI_Output(self,other,"DIA_Lord_Hagen_Melhior_01_72");	//Žádný paladin by tak hluboko nepadl!
		AI_Output(self,other,"DIA_Lord_Hagen_Melhior_01_75");	//Jdi mi z očí, a ať už tě ani nenapadne chodit za mnou s podobnými pomluvami!
		AI_StopProcessInfos(self);
	}
	else if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(other,self,"DIA_Lord_Hagen_Melhior_01_77");	//Jeden z paladinů opustil svoji pozici!
		AI_Output(self,other,"DIA_Lord_Hagen_Melhior_01_79");	//(rozhořčeně) Co tím myslíš? Vysvětli mi to!
		AI_Output(other,self,"DIA_Lord_Hagen_Melhior_01_80");	//Během své hlídky opustil svou pozici a místo toho se oddává pití.
		AI_Output(self,other,"DIA_Lord_Hagen_Melhior_01_84");	//Opravdu si myslíš, že ti budu věřit, ty prašivý žoldáku?
		AI_Output(self,other,"DIA_Lord_Hagen_Melhior_01_85");	//To, co říkáš, nemůže být pravda! Absolutní nesmysly!
		AI_Output(self,other,"DIA_Lord_Hagen_Melhior_01_86");	//Žádný paladin by tak hluboko nepadl!
		AI_Output(self,other,"DIA_Lord_Hagen_Melhior_01_89");	//Jdi mi z očí, a ať už tě ani nenapadne chodit za mnou s podobnými pomluvami!
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(other,self,"DIA_Lord_Hagen_Melhior_01_91");	//Jeden z paladinů opustil svoji pozici!
		AI_Output(self,other,"DIA_Lord_Hagen_Melhior_01_93");	//(rozhořčeně) Co tím myslíš? Vysvětli mi to!
		AI_Output(other,self,"DIA_Lord_Hagen_Melhior_01_94");	//Během své hlídky opustil svou pozici a místo toho se oddává pití.
		AI_Output(self,other,"DIA_Lord_Hagen_Melhior_01_97");	//(sarkasticky) Ano, jasně!
		AI_Output(self,other,"DIA_Lord_Hagen_Melhior_01_98");	//Opravdu si myslíš, že ti budu věřit?
		AI_Output(self,other,"DIA_Lord_Hagen_Melhior_01_99");	//To, co říkáš, nemůže být pravda! Absolutní nesmysly!
		AI_Output(self,other,"DIA_Lord_Hagen_Melhior_01_100");	//Žádný paladin by tak hluboko nepadl!
		AI_Output(self,other,"DIA_Lord_Hagen_Melhior_01_103");	//Jdi mi z očí, a ať už tě ani nenapadne chodit za mnou s podobnými pomluvami!
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
	description = "Posílá mě obchodník Lutero.";
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
	AI_Output(other,self,"DIA_Lord_Hagen_PaladinFood_01_00");	//Posílá mě obchodník Lutero.
	AI_Output(other,self,"DIA_Lord_Hagen_PaladinFood_01_09");	//Chce, abych zjistil, kolik jakého proviantu potřebujete.
	AI_Output(self,other,"DIA_Lord_Hagen_PaladinFood_01_14");	//Hmm... Chápeš, mohu ti dát jen informace ohledně zásob pro paladiny tady na Khorinisu.
	AI_Output(self,other,"DIA_Lord_Hagen_PaladinFood_01_15");	//Ale kromě nás jsou tu i jiné skupiny.
	AI_Output(self,other,"DIA_Lord_Hagen_PaladinFood_01_18");	//Tato výprava byla pro království velmi důležitá, takže na ostrov přišla stovka nejlepších válečníků řádu.
	AI_Output(self,other,"DIA_Lord_Hagen_PaladinFood_01_20");	//Ve městě by pro všechny ale nebyl dostatek místa.
	AI_Output(self,other,"DIA_Lord_Hagen_PaladinFood_01_21");	//Z toho důvodu šla větší část paladinů pod velením lorda Varuse do královské pevnosti Azgan.
	AI_Output(other,self,"DIA_Lord_Hagen_PaladinFood_01_22");	//Královská pevnost? Tady na ostrově?!
	AI_Output(self,other,"DIA_Lord_Hagen_PaladinFood_01_23");	//Ne... Je na malém ostrůvku kousek od Khorinisu.
	AI_Output(self,other,"DIA_Lord_Hagen_PaladinFood_01_24");	//Jediná cesta, jak se tam dostat, je ale zde na Khorinisu.
	AI_Output(self,other,"DIA_Lord_Hagen_PaladinFood_01_25");	//Na východ od města je v horách podzemní průchod. Asi jeden den chůze odsud.
	AI_Output(self,other,"DIA_Lord_Hagen_PaladinFood_01_27");	//Rozumíš tedy, že mé výpočty ohledně rozsahu dodávky by byly značně nepřesné.

	if((MIS_OLDWORLD == LOG_SUCCESS) && (MIS_OCGateOpen == FALSE))
	{
		AI_Output(self,other,"DIA_Lord_Hagen_PaladinFood_01_28");	//Kromě toho nezapomeň ani na Garondův oddíl! Jeho chlapi také potřebují najíst.
		AI_Output(self,other,"DIA_Lord_Hagen_PaladinFood_01_29");	//I když teď, když jsou obležení skřety, jim asi nebude jen tak možno dopravit zásoby.
		AI_Output(self,other,"DIA_Lord_Hagen_PaladinFood_01_30");	//(hrozivě) Ale to již brzy napravíme...
	};

	AI_Output(other,self,"DIA_Lord_Hagen_PaladinFood_01_32");	//A jak mám tedy získat přesné informace o tom proviantu?
	AI_Output(self,other,"DIA_Lord_Hagen_PaladinFood_01_34");	//Můžeme to udělat takhle...
	AI_Output(self,other,"DIA_Lord_Hagen_PaladinFood_01_35");	//Pošlu jednoho muže do pevnosti Azgan za lordem Varusem!
	AI_Output(self,other,"DIA_Lord_Hagen_PaladinFood_01_36");	//Ten připraví seznam zásob, které potřebuje on a jeho lidi.
	AI_Output(self,other,"DIA_Lord_Hagen_PaladinFood_01_37");	//A já zase připravím seznam nezbytných zásob pro paladiny ve městě, kteří jsou pod mým velením.
	AI_Output(self,other,"DIA_Lord_Hagen_PaladinFood_01_38");	//To by nám mělo zajistit celkem přesný obraz toho, kolik jídla naše expedice potřebuje.
	AI_Output(self,other,"DIA_Lord_Hagen_PaladinFood_01_41");	//K Varusovi nicméně nemůžu poslat nikoho z mých lidí.
	AI_Output(self,other,"DIA_Lord_Hagen_PaladinFood_01_43");	//Proto myslím, že nejvhodnějším chlapem na místo poslíčka jsi - ty.
	AI_Output(self,other,"DIA_Lord_Hagen_PaladinFood_01_44");	//Souhlasíš?
	Info_ClearChoices(dia_lord_hagen_paladinfood);
	Info_AddChoice(dia_lord_hagen_paladinfood,"Ne! Pošli někoho jiného.",dia_lord_hagen_paladinfood_no);
	Info_AddChoice(dia_lord_hagen_paladinfood,"Dobrá, souhlasím.",dia_lord_hagen_paladinfood_ok);
};

func void dia_lord_hagen_paladinfood_no()
{
	HAGENFUCKTOVARUS = TRUE;
	AI_Output(other,self,"DIA_Lord_Hagen_PaladinFood_No_01_00");	//Ne! Pošli někoho jiného.

	if((other.guild == GIL_PAL) || (other.guild == GIL_MIL))
	{
		AI_Output(self,other,"DIA_Lord_Hagen_PaladinFood_No_01_01");	//To je rozkaz, vojáku!
		AI_Output(self,other,"DIA_Lord_Hagen_PaladinFood_No_01_02");	//(stroze) A o rozkazech se nediskutuje - rozkazy se plní!
	}
	else
	{
		AI_Output(self,other,"DIA_Lord_Hagen_PaladinFood_No_01_03");	//(naštvaně) Říkal jsem ti přece, že nikoho jiného poslat nemůžu.
		AI_Output(self,other,"DIA_Lord_Hagen_PaladinFood_No_01_04");	//A pak, tenhle obchod s paladiny je pro tvůj cech velikou ctí.
		AI_Output(self,other,"DIA_Lord_Hagen_PaladinFood_No_01_06");	//A tyhle spory jsou absolutně zbytečné.
	};
};

func void dia_lord_hagen_paladinfood_ok()
{
	AI_Output(other,self,"DIA_Lord_Hagen_PaladinFood_Ok_01_00");	//Dobrá, souhlasím.

	if(HAGENFUCKTOVARUS == TRUE)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_PaladinFood_Ok_01_01");	//(naštvaně) Tak, to je už lepší...
	}
	else
	{
		B_GivePlayerXP(150);
		AI_Output(self,other,"DIA_Lord_Hagen_PaladinFood_Ok_01_02");	//(směje se) Jinou odpověď jsem ani nečekal...
	};

	AI_Output(self,other,"DIA_Lord_Hagen_PaladinFood_Ok_01_03");	//Nyní jdi za Varusem. Zatímco budeš pryč, já připravím ten seznam.
	AI_Output(self,other,"DIA_Lord_Hagen_PaladinFood_Ok_01_04");	//Až se vrátíš z Azganu, přijď za mnou a já ti ho odevzdám.
	AI_Output(self,other,"DIA_Lord_Hagen_PaladinFood_Ok_01_09");	//Tady, vezmi si tyhle rozkazy - až je stráže pevnosti uvidí, nechají tě projít.
	AI_Output(self,other,"DIA_Lord_Hagen_PaladinFood_Ok_01_10");	//A teď jdi.
	B_GiveInvItems(self,other,itwr_hagenorderfort,1);
	AI_Output(other,self,"DIA_Lord_Hagen_PaladinFood_Ok_01_11");	//Dobře.
	HAGENSENTTOVARUS = TRUE;
	B_LogEntry(TOPIC_PALADINFOOD,"Promluvil jsem si s lordem Hagenem ohledně zásob pro paladiny. Vypadá to tak, že skupina paladinů, která se usadila ve městě, je jen částí celé jednotky, která byla na ostrov vyslána. Větší část pod velením lorda Varuse odešla do královské pevnosti Azgan, která se nachází na jednom z nedalekých ostrovů. I oni, přirozeně, potřebují proviant, a proto je pro lorda Hagena obtížné říct, kolik zásob potřebují pro celou jednotku. Rozhodl se poslat mě do pevnosti Azgan, aby pro mne Varus osobně sepsal seznam nutných zásob pro své muže. Po návratu na Khorinis bych ještě měl zanést seznam i lordu Hagenovi.");
	Log_AddEntry(TOPIC_PALADINFOOD,"Dostat se do královské pevnosti Azgan je možné jen přes podzemní průchod se vstupem tady na ostrově - na východ od města. Podle lorda Hagena je tenhle průchod do pevnosti velice pečlivě střežen. Dal mi proto písemné rozkazy, které mi umožní projít přes stráž průchodu.");
	Info_ClearChoices(dia_lord_hagen_paladinfood);
};


instance DIA_LORD_HAGEN_PALADINFOODDONE(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 2;
	condition = dia_lord_hagen_paladinfooddone_condition;
	information = dia_lord_hagen_paladinfooddone_info;
	permanent = FALSE;
	description = "Mám seznam od Varuse.";
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
	AI_Output(other,self,"DIA_Lord_Hagen_PaladinFoodDone_01_00");	//Mám seznam od Varuse.
	B_GiveInvItems(other,self,itwr_varuscontent,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Lord_Hagen_PaladinFoodDone_01_03");	//Hmm... Velmi zajímavé...
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Lord_Hagen_PaladinFoodDone_01_04");	//Skvěle! Už je mi vše jasné.
	AI_Output(self,other,"DIA_Lord_Hagen_PaladinFoodDone_01_06");	//Když jsi byl mimo město, připravil jsem seznam nezbytného proviantu pro mé lidi.
	AI_Output(self,other,"DIA_Lord_Hagen_PaladinFoodDone_01_07");	//Teď už jen spojíme obě části seznamu.
	AI_Output(self,other,"DIA_Lord_Hagen_PaladinFoodDone_01_08");	//To by nám mělo ukázat přibližné množství zásob, které potřebujeme.
	AI_Output(self,other,"DIA_Lord_Hagen_PaladinFoodDone_01_09");	//Počkej chvilku...
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Lord_Hagen_PaladinFoodDone_01_10");	//A je to! Tady, zanes tenhle doplněný seznam Luterovi.
	B_GiveInvItems(self,other,itwr_hagencontent,1);
	AI_Output(self,other,"DIA_Lord_Hagen_PaladinFoodDone_01_11");	//Je tam vše, co potřebujeme.
	AI_Output(other,self,"DIA_Lord_Hagen_PaladinFoodDone_01_12");	//Dobře.
	B_LogEntry(TOPIC_PALADINFOOD,"Přinesl jsem lordu Hagenovi seznam zásob, který pro mne napsal lord Varus. Po přečtení ho velitel paladinů doplnil o věci, které potřebují paladinové ve městě, a pak mi seznam zas vrátil. Teď je čas jít za Luterem.");
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
	description = "Jak to jde?";
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
	AI_Output(other,self,"DIA_Lord_Hagen_BeforeBattle_01_00");	//Jak to jde?

	if((STOPBIGBATTLE == TRUE) && (HERONOTJOINBIGBATTLE == FALSE))
	{
		if(ORCSWINSBB == TRUE)
		{
			AI_Output(self,other,"DIA_Lord_Hagen_BeforeBattle_01_01");	//Copak to není jasné? (zatraceně) Je to horší, než zlý sen.
			AI_Output(self,other,"DIA_Lord_Hagen_BeforeBattle_01_02");	//Zase jsme utrpěli zdrcující porážku a skřetům teď už nic nezabrání ovládnout ostrov.
			AI_Output(other,self,"DIA_Lord_Hagen_BeforeBattle_01_04");	//Ale všechno přeci ještě není ztraceno! Musíme bojovat!
			AI_Output(self,other,"DIA_Lord_Hagen_BeforeBattle_01_05");	//Ach, chlapče... (smutně) Na tomto ostrově už nezůstal prakticky nikdo, kdo by se mohl rovnat těmhle stvůrám.
			AI_Output(self,other,"DIA_Lord_Hagen_BeforeBattle_01_06");	//To je nad naše síly.
		}
		else
		{
			AI_Output(self,other,"DIA_Lord_Hagen_BeforeBattle_01_08");	//Nyní, když je hlavní skřetí armáda poražena, si konečně můžeme vydechnout.
			AI_Output(self,other,"DIA_Lord_Hagen_BeforeBattle_01_09");	//(zamračeně) Utrpěli jsme také veliké ztráty, ale bez těch není žádná válka.
			AI_Output(self,other,"DIA_Lord_Hagen_BeforeBattle_01_10");	//Koneckonců, hlavní je, že jsme vyhráli!
		};
	}
	else if(MOVEFORCESCOMPLETE_02 == TRUE)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_BeforeBattle_01_11");	//Dobře.
	}
	else
	{
		AI_Output(self,other,"DIA_Lord_Hagen_BeforeBattle_01_14");	//Žádné změny. (stroze) Pořád se snažíme zjistit, jaký plán si skřeti za těchhle okolností vymyslí.
		AI_Output(self,other,"DIA_Lord_Hagen_BeforeBattle_01_15");	//Pravděpodobně by nás měli napadnout z boků nebo zezadu, ale na to zřejmě nejsou dost chytří.
		AI_Output(self,other,"DIA_Lord_Hagen_BeforeBattle_01_16");	//S největší pravděpodobností budou chtít zaútočit na hlavní linii a spoléhat na svou číselnou převahu.
		AI_Output(self,other,"DIA_Lord_Hagen_BeforeBattle_01_17");	//To jim ale zřejmě nepomůže.
	};
};

instance DIA_LORD_HAGEN_WHOCOMMAND(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 2;
	condition = dia_lord_hagen_whocommand_condition;
	information = dia_lord_hagen_whocommand_info;
	permanent = FALSE;
	description = "Ty tomu tady velíš?";
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
	AI_Output(other,self,"DIA_Lord_Hagen_WhoCommand_01_00");	//Ty tomu tady velíš?
	AI_Output(self,other,"DIA_Lord_Hagen_WhoCommand_01_01");	//Ne, já ne. (vážně) Společným rozhodnutím většiny bylo velení nad celou armádou svěřené schopnostem generála Leeho.
	AI_Output(other,self,"DIA_Lord_Hagen_WhoCommand_01_04");	//A co na to říkají tví lidé?
	AI_Output(self,other,"DIA_Lord_Hagen_WhoCommand_01_05");	//Nic. (vážně) Zcela důvěřuji generálu Leeovi a to jim stačí.
};

instance DIA_LORD_HAGEN_NewsKillDead(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 2;
	condition = dia_lord_hagen_NewsKillDead_condition;
	information = dia_lord_hagen_NewsKillDead_info;
	permanent = FALSE;
	description = "Co je nového?";
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
	AI_Output(other,self,"DIA_Lord_Hagen_NewsKillDead_01_00");	//Co je nového?
	AI_Output(self,other,"DIA_Lord_Hagen_NewsKillDead_01_01");	//Tady nedaleko farmy jsme našli tábor nějakých vrahů.
	AI_Output(self,other,"DIA_Lord_Hagen_NewsKillDead_01_02");	//V tak těžkých časech, jako jsou tyhle, si nemůžeme dovolit, aby nás ještě ke všemu ohrožovali banditi.
	AI_Output(self,other,"DIA_Lord_Hagen_NewsKillDead_01_03");	//Ale mí muži se o to postarali... (vážně) Ti bastardi jsou už tuzí.
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
	AI_Output(self,other,"DIA_Lord_Hagen_LeeCare_01_00");	//Sakra! Co to má znamenat?! (zmateně) Co se stalo?
	AI_Output(other,self,"DIA_Lord_Hagen_LeeCare_01_01");	//Vypadá to tak, že ho v bitvě těžce ranili skřeti. Okamžitě musí na farmu.
	AI_Output(self,other,"DIA_Lord_Hagen_LeeCare_01_02");	//Zatracené bestie! Jako kdyby toho nebylo dost - po takovém vítězství ztratit velitele.
	AI_Output(self,other,"DIA_Lord_Hagen_LeeCare_01_03");	//Dobrá, postarám se o něj osobně! Udělám, co budu moci.
	AI_Output(self,other,"DIA_Lord_Hagen_LeeCare_01_04");	//A taky bych ti chtěl poděkovat za tvůj přínos v bitvě. Tvá pomoc byla neocenitelná.

	if(IAMKILLORCSBB >= 40)
	{
		B_GivePlayerXP(500);
		AI_Output(self,other,"DIA_Lord_Hagen_LeeCare_01_06");	//Sám ses postaral o více než třetinu těch stvůr!
		AI_Output(self,other,"DIA_Lord_Hagen_LeeCare_01_07");	//Řeknu ti to na rovinu - tohle se nepovedlo ani jednomu z mých paladinů!
	};
};

instance DIA_LORD_HAGEN_NEWORDERS(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 1;
	condition = dia_lord_hagen_neworders_condition;
	information = dia_lord_hagen_neworders_info;
	permanent = FALSE;
	description = "Co teď?";
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
	AI_Output(other,self,"DIA_Lord_Hagen_NewOrders_01_01");	//Co teď?
	AI_Output(self,other,"DIA_Lord_Hagen_NewOrders_01_04");	//(zachmuřeně) V boji byly naše ztráty bohužel příliš velké...
	AI_Output(self,other,"DIA_Lord_Hagen_NewOrders_01_05");	//Nemyslím, že zbytek mých mužů by stačil na to, abychom prolomili obléhání kláštera a osvobodili město.
	AI_Output(self,other,"DIA_Lord_Hagen_NewOrders_01_23");	//Zůstanu se zbytkem armády na farmě a budeme ji bránit.
	AI_Output(self,other,"DIA_Lord_Hagen_NewOrders_01_25");	//Nesmíme ji ztratit, protože pak už nebude kam ustoupit.
	AI_Output(other,self,"DIA_Lord_Hagen_NewOrders_01_26");	//Pak se tedy budu muset postarat o zbývající skřetí jednotky!
	AI_Output(self,other,"DIA_Lord_Hagen_NewOrders_01_31");	//No, menší panika v jejich řadách by se hodila.
	AI_Output(self,other,"DIA_Lord_Hagen_NewOrders_01_35");	//Můžeš se samozřejmě pokusit osvobodit Khorinis úplně!
	AI_Output(self,other,"DIA_Lord_Hagen_NewOrders_01_36");	//Ale myslím, že to by bylo dokonce i nad tvé síly.
	AI_Output(self,other,"DIA_Lord_Hagen_NewOrders_01_37");	//Takže prostě zkus udělat, co jsem ti říkal.
	b_againgatherallonbigfarm();
	MIS_KILLTHEMALL = LOG_Running;
	Log_CreateTopic(TOPIC_KILLTHEMALL,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KILLTHEMALL,LOG_Running);
	B_LogEntry(TOPIC_KILLTHEMALL,"Teď, když je velká skřetí armáda poražena, se musíme rozhodnout, co podnikneme. Promluvil jsem si s lordem Hagenem o další strategii. Očividně plánuje vzít zbytek svých lidí na farmu a opevnit se. Podle něj mají skřeti pořád dostatečnou sílu na to, aby kdykoli zaútočili - a pokud bychom přišli o farmu, ztratili bychom poslední útočiště na ostrově.");
	Log_AddEntry(TOPIC_KILLTHEMALL,"Na druhou stranu mě vůdce paladinů požádal, abych se nějakým způsobem postaral o skřety samotné. Samozřejmě, že není ani pomyšlení na přímý útok na Khorinis - ale menší paniku v jejich řadech bychom dovedli vyvolat. Takže čím více skřetů se mi povede zabít - tím líp pro všechny! No, nemůžu s ním zrovna nesouhlasit...");
};


instance DIA_LORD_HAGEN_NEWORDERS_NF(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 1;
	condition = dia_lord_hagen_neworders_NF_condition;
	information = dia_lord_hagen_neworders_NF_info;
	permanent = FALSE;
	description = "Jaká je situace?";
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
	AI_Output(other,self,"DIA_Lord_Hagen_KAP3U4_PERM_15_00");	//Jaká je situace?
	AI_Output(self,other,"DIA_Lord_Hagen_NewOrders_NF_01_40");	//Asi už víš, že za tvé nepřítomnosti jsme se se skřety utkali ve veliké bitvě.
	AI_Output(self,other,"DIA_Lord_Hagen_NewOrders_NF_01_41");	//Jestliže ne, tak tě asi bude zajímat, že jsme nad těmi stvůrami získali převahu!
	AI_Output(self,other,"DIA_Lord_Hagen_NewOrders_NF_01_04");	//(zachmuřeně) V boji byly naše ztráty bohužel příliš velké...
	AI_Output(self,other,"DIA_Lord_Hagen_NewOrders_NF_01_05");	//Nemyslím, že zbytek mých mužů by stačil na to, abychom prolomili obléhání kláštera a osvobodili město.
	AI_Output(other,self,"DIA_Lord_Hagen_NewOrders_NF_01_26");	//Pak se tedy budu muset postarat o zbývající skřetí jednotky!
	AI_Output(self,other,"DIA_Lord_Hagen_NewOrders_NF_01_31");	//No, menší panika v jejich řadách by se hodila.
	AI_Output(self,other,"DIA_Lord_Hagen_NewOrders_NF_01_35");	//Můžeš se samozřejmě pokusit osvobodit Khorinis úplně!
	AI_Output(self,other,"DIA_Lord_Hagen_NewOrders_NF_01_36");	//Ale myslím, že to by bylo dokonce i nad tvé síly.
	AI_Output(self,other,"DIA_Lord_Hagen_NewOrders_NF_01_37");	//Takže prostě zkus udělat, co jsem ti říkal.
	b_againgatherallonbigfarm();
	MIS_KILLTHEMALL = LOG_Running;
	Log_CreateTopic(TOPIC_KILLTHEMALL,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KILLTHEMALL,LOG_Running);
	B_LogEntry(TOPIC_KILLTHEMALL,"Teď, když je velká skřetí armáda poražena, se musíme rozhodnout, co podnikneme. Promluvil jsem si s lordem Hagenem o další strategii. Očividně plánuje vzít zbytek svých lidí na farmu a opevnit se. Podle něj mají skřeti pořád dostatečnou sílu na to, aby kdykoli zaútočili - a pokud bychom přišli o farmu, ztratili bychom poslední útočiště na ostrově.");
	Log_AddEntry(TOPIC_KILLTHEMALL,"Na druhou stranu mě vůdce paladinů požádal, abych se nějakým způsobem postaral o skřety samotné. Samozřejmě, že není ani pomyšlení na přímý útok na Khorinis - ale menší paniku v jejich řadech bychom dovedli vyvolat. Takže čím více skřetů se mi povede zabít - tím líp pro všechny! No, nemůžu s ním zrovna nesouhlasit...");
};

instance DIA_LORD_HAGEN_NEEDHELP(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 1;
	condition = dia_lord_hagen_needhelp_condition;
	information = dia_lord_hagen_needhelp_info;
	permanent = FALSE;
	description = "Potřebuji pomoc!";
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
	AI_Output(other,self,"DIA_Lord_Hagen_NeedHelp_01_01");	//Potřebuji pomoc!
	AI_Output(other,self,"DIA_Lord_Hagen_NeedHelp_01_02");	//Bude velice těžké bojovat proti tolika skřetům sám!
	AI_Output(self,other,"DIA_Lord_Hagen_NeedHelp_01_03");	//Nemám zrovna moc lidí... (vážně) Potřebuji každého muže.
	AI_Output(self,other,"DIA_Lord_Hagen_NeedHelp_01_04");	//Ale můžeš si vzít jakékoliv dobrovolníky.
	HAGENGIVEHELP = TRUE;
	B_LogEntry(TOPIC_KILLTHEMALL,"Jelikož sám bych mohl mít problém porazit všechny skřety, požádal jsem lorda Hagena o pomoc. Souhlasil, abych si vzal pár dobrovolníků.");
};


instance DIA_LORD_HAGEN_RUNEMAGICNOTWORK(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 1;
	condition = dia_lord_hagen_runemagicnotwork_condition;
	information = dia_lord_hagen_runemagicnotwork_info;
	permanent = FALSE;
	description = "Jak je na tom tvá magie?";
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
	AI_Output(other,self,"DIA_Lord_Hagen_RuneMagicNotWork_01_00");	//Jak je na tom tvá magie?
	AI_Output(self,other,"DIA_Lord_Hagen_RuneMagicNotWork_01_01");	//Přestala fungovat, sakra!
	AI_Output(self,other,"DIA_Lord_Hagen_RuneMagicNotWork_01_02");	//Z našich runových kamenů jsou teď jen obyčejné šutry!
	B_LogEntry(TOPIC_RUNEMAGICNOTWORK,"Stejně tak paladinové už své magické runy můžou zahodit.");
	PALADINRUNESNOT = TRUE;
};


instance DIA_LORD_HAGEN_KILLTHEMALLDONE(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 1;
	condition = dia_lord_hagen_killthemalldone_condition;
	information = dia_lord_hagen_killthemalldone_info;
	permanent = FALSE;
	description = "Ohledně těch skřetů...";
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
	AI_Output(other,self,"DIA_Lord_Hagen_KillThemAllDone_01_00");	//Ohledně těch skřetů...
	AI_Output(self,other,"DIA_Lord_Hagen_KillThemAllDone_01_01");	//Ano?! (se zájmem) Můžeš nahlásit něco nového?
	AI_Output(other,self,"DIA_Lord_Hagen_KillThemAllDone_01_02");	//Myslím, že jsem jich už skolil dost na to, abych mezi ně zasel paniku!
	AI_Output(self,other,"DIA_Lord_Hagen_KillThemAllDone_01_03");	//Excelentní! To jsou prostě vynikající zprávy!
	AI_Output(self,other,"DIA_Lord_Hagen_KillThemAllDone_01_04");	//Věřím, že teď nás nechají být. Tedy alespoň na určitou dobu.
	AI_Output(self,other,"DIA_Lord_Hagen_KillThemAllDone_01_05");	//Přijmi mé upřímné poděkování.
};


instance DIA_LORD_HAGEN_BACKTOHOME(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 1;
	condition = dia_lord_hagen_backtohome_condition;
	information = dia_lord_hagen_backtohome_info;
	permanent = FALSE;
	description = "Runová magie byla zničena!";
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
	AI_Output(other,self,"DIA_Lord_Hagen_BackToHome_01_00");	//Runová magie byla zničena!
	AI_Output(self,other,"DIA_Lord_Hagen_BackToHome_01_01");	//Cože?! Jak tomu mám rozumět?!
	AI_Output(other,self,"DIA_Lord_Hagen_BackToHome_01_02");	//Nevzrušuj se! Sám Pyrokar mě požádal, abych ti to řekl.
	AI_Output(self,other,"DIA_Lord_Hagen_BackToHome_01_04");	//Ale, ale... (ohromeně) U milostivého Innose, vážně řekl tohle?
	AI_Output(self,other,"DIA_Lord_Hagen_BackToHome_01_06");	//V tom případě máme vážný problém!
	AI_Output(self,other,"DIA_Lord_Hagen_BackToHome_01_10");	//S runovou magií a magickou rudou měli královští paladinové alespoň malou šanci zabránit invazi skřetích hord do celé Myrtany!
	AI_Output(self,other,"DIA_Lord_Hagen_BackToHome_01_11");	//Ale teď, když magická ruda došla a naše runová magie ztratili svou sílu, už tyhle stvůry nikdo nezastaví!
	AI_Output(self,other,"DIA_Lord_Hagen_BackToHome_01_12");	//Výsledek této války je již předem jistý - a není nám nakloněn.
};


instance DIA_LORD_HAGEN_WHYORE(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 1;
	condition = dia_lord_hagen_whyore_condition;
	information = dia_lord_hagen_whyore_info;
	permanent = FALSE;
	description = "Proč má ruda v této válce tak velkou cenu?";
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
	AI_Output(other,self,"DIA_Lord_Hagen_WhyOre_01_00");	//Proč má ruda v této válce tak velkou cenu?
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_WhyOre_01_01");	//Hmm... (překvapeně) Jako královský paladin bys to už měl vědět!
	}
	else
	{
		AI_Output(self,other,"DIA_Lord_Hagen_WhyOre_01_02");	//Hmm... (sarkasticky) Kdybys byl paladin, už bys věděl proč!
	};
	AI_Output(self,other,"DIA_Lord_Hagen_WhyOre_01_06");	//Hlavní výhodou není ruda samotná, ale magie, kterou obsahuje.
	AI_Output(self,other,"DIA_Lord_Hagen_WhyOre_01_07");	//Zbraně vyrobené z magické rudy dokáží proniknout i tou nejsilnější zbrojí.
	AI_Output(self,other,"DIA_Lord_Hagen_WhyOre_01_09");	//A kromě toho pouze tyhle zbraně můžou projít rituálem posvěcení!
	AI_Output(self,other,"DIA_Lord_Hagen_WhyOre_01_10");	//Sám Innos do takové zbraně vloží část své božské moci a tím jí udělá smrtelně nebezpečnou.
	AI_Output(self,other,"DIA_Lord_Hagen_WhyOre_01_11");	//Samozřejmě, že takto posvětit zbraň může jen paladin... (vážně) Ostatní by totiž nesnesli moc takové čepele.
	AI_Output(self,other,"DIA_Lord_Hagen_WhyOre_01_12");	//A právě proto je pro nás ruda v téhle válce tak důležitá.
	AI_Output(self,other,"DIA_Lord_Hagen_WhyOre_01_13");	//Bez magické rudy královská armáda nikdy nezastaví tuhle zdrcující přesilu skřetů.
};


instance DIA_PAL_200_HAGEN_HIDDENORE(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 2;
	condition = dia_pal_200_hagen_hiddenore_condition;
	information = dia_pal_200_hagen_hiddenore_info;
	permanent = FALSE;
	description = "Mám pro tebe velmi důležitou zprávu!";
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
	AI_Output(other,self,"DIA_PAL_200_Hagen_HiddenOre_01_00");	//Mám pro tebe velmi důležitou zprávu.
	AI_Output(self,other,"DIA_PAL_200_Hagen_HiddenOre_01_01");	//Ano? (pyšně) A čeho se týká?
	AI_Output(other,self,"DIA_PAL_200_Hagen_HiddenOre_01_03");	//Když jsme byli na moři, narazili jsme na pustý ostrov skrz-naskrz prolezlý ložisky magické rudy.
	AI_Output(other,self,"DIA_PAL_200_Hagen_HiddenOre_01_04");	//Napadlo mě, že by o něm paladinové možná chtěli vědět.
	AI_Output(self,other,"DIA_PAL_200_Hagen_HiddenOre_01_05");	//Co?! Myslíš to vážně? (překvapeně) To není možné!
	AI_Output(other,self,"DIA_PAL_200_Hagen_HiddenOre_01_06");	//Věř mi, je to tak. Nalezli jsme magickou rudu. To byl taky jeden z důvodů, proč jsme se vrátili zpět.
	AI_Output(self,other,"DIA_PAL_200_Hagen_HiddenOre_01_07");	//Neuvěřitelné! Ani jsem nevěřil, že by to bylo možné!
	AI_Output(self,other,"DIA_PAL_200_Hagen_HiddenOre_01_08");	//Pokud to, co říkáš, je pravda, je to ta nejlepší zpráva, jakou jsem kdy slyšel!
	AI_Output(self,other,"DIA_PAL_200_Hagen_HiddenOre_01_09");	//A dobré zprávy jsou poslední dobou velká vzácnost.
	AI_Output(self,other,"DIA_PAL_200_Hagen_HiddenOre_01_12");	//Jak je ten ostrov daleko?
	AI_Output(other,self,"DIA_PAL_200_Hagen_HiddenOre_01_13");	//Jen pár dní plavby od Khorinisu. Tady, podívej.
	B_GiveInvItems(other,self,itmi_seamaplostisland,1);
	AI_Output(self,other,"DIA_PAL_200_Hagen_HiddenOre_01_14");	//Co je to?
	AI_Output(other,self,"DIA_PAL_200_Hagen_HiddenOre_01_15");	//Námořní mapa. Můj kapitán tam udělal několik poznámek a vyznačil přesný kurz.
	AI_Output(other,self,"DIA_PAL_200_Hagen_HiddenOre_01_16");	//Takže najít tento ostrov bude pro vás snadné jako facka.
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_PAL_200_Hagen_HiddenOre_01_17");	//(pozorně) Velmi zajímavé!
	AI_Output(self,other,"DIA_PAL_200_Hagen_HiddenOre_01_18");	//Podle téhle mapy jste na dosud neprozkoumané části oceánu našli kousek souše. Jak jste se tam dostali?
	AI_Output(other,self,"DIA_PAL_200_Hagen_HiddenOre_01_19");	//Na cestě jsme se dostali velice silné bouře. To ona nás zavedla na ten ostrov.
	AI_Output(self,other,"DIA_PAL_200_Hagen_HiddenOre_01_20");	//Ano. Cesty Innose jsou vskutku nevyzpytatelné.
	AI_Output(self,other,"DIA_PAL_200_Hagen_HiddenOre_01_21");	//Jsem si jistý, že kdyby tak nechtěl On, rozhodně by se vám to nepodařilo.
	AI_Output(self,other,"DIA_PAL_200_Hagen_HiddenOre_01_23");	//Dobrá. (vážně) Přijmi mé upřímné poděkování ve jménu celého našeho řádu!
	AI_Output(self,other,"DIA_PAL_200_Hagen_HiddenOre_01_24");	//Doufám, že ta nalezená ruda pomůže králi ve válce proti skřetům.
	HAGENTAKESMAPSORE = TRUE;
	if(LIGOFORGOLD == TRUE)
	{
		Info_ClearChoices(dia_pal_200_hagen_hiddenore);
		Info_AddChoice(dia_pal_200_hagen_hiddenore,"Ne tak rychle, paladine!",dia_pal_200_hagen_hiddenore_gold);
	}
	else if(LIGOFORUNKNOWN == TRUE)
	{
		Info_ClearChoices(dia_pal_200_hagen_hiddenore);
		Info_AddChoice(dia_pal_200_hagen_hiddenore,"Ne tak rychle, paladine!",dia_pal_200_hagen_hiddenore_gold);
		Info_AddChoice(dia_pal_200_hagen_hiddenore,"Samo sebou.",dia_pal_200_hagen_hiddenore_nothing);
	}
	else if(LIGOFORFREE == TRUE)
	{
		B_GivePlayerXP(200);
		AI_Output(other,self,"DIA_PAL_200_Hagen_HiddenOre_01_25");	//Samo sebou.
	};
};

func void dia_pal_200_hagen_hiddenore_gold()
{
	AI_Output(other,self,"DIA_PAL_200_Hagen_HiddenOre_Gold_01_01");	//Ne tak rychle, paladine! Obávám se, že pouhá vděčnost je trochu málo.
	AI_Output(self,other,"DIA_PAL_200_Hagen_HiddenOre_Gold_01_02");	//Cože? (překvapeně) Co tím chceš říct?
	AI_Output(other,self,"DIA_PAL_200_Hagen_HiddenOre_Gold_01_03");	//Každá informace něco stojí. A takhle důležité ještě více.
	AI_Output(self,other,"DIA_PAL_200_Hagen_HiddenOre_Gold_01_06");	//(pyšně) O, ano. Přirozeně! Bylo by mi divné, kdybys o tom nezačal.
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_PAL_200_Hagen_HiddenOre_Gold_01_07");	//I když, po pravdě řečeno, bych taková slova od paladina nečekal!
	}
	else if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_PAL_200_Hagen_HiddenOre_Gold_01_08");	//I když, po pravdě řečeno, bych taková slova od ctihodného mága Ohně nečekal!
	}
	else if(other.guild == GIL_KDW)
	{
		AI_Output(self,other,"DIA_PAL_200_Hagen_HiddenOre_Gold_01_09");	//I když, po pravdě řečeno, bych taková slova od ctihodného mága Vody nečekal!
	};
	AI_Output(other,self,"DIA_PAL_200_Hagen_HiddenOre_Gold_01_10");	//Podrobnosti vynech. Raději řekni - kolik si ochoten zaplatit?
	AI_Output(self,other,"DIA_PAL_200_Hagen_HiddenOre_Gold_01_11");	//Hmm... Řekněme deset tisíc zlatých. Co říkáš?
	AI_Output(other,self,"DIA_PAL_200_Hagen_HiddenOre_Gold_01_12");	//Beru. Doufám, že jsem neudělal špatný obchod.
	AI_Output(self,other,"DIA_PAL_200_Hagen_HiddenOre_Gold_01_13");	//O tom rozhoduješ ty! Tady máš, vezmi si své zlato.
	B_GiveInvItems(self,other,ItMi_Gold,10000);
	AI_Output(other,self,"DIA_PAL_200_Hagen_HiddenOre_Gold_01_14");	//Bylo mi potěšením s tebou obchodovat.
	AI_Output(self,other,"DIA_PAL_200_Hagen_HiddenOre_Gold_01_15");	//(nespokojeně) Hmm...
	Info_ClearChoices(dia_pal_200_hagen_hiddenore);
};

func void dia_pal_200_hagen_hiddenore_nothing()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_PAL_200_Hagen_HiddenOre_Nothing_01_01");	//Samo sebou.
	Info_ClearChoices(dia_pal_200_hagen_hiddenore);
};


instance DIA_LORD_HAGEN_OREONMAP(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 1;
	condition = dia_lord_hagen_oreonmap_condition;
	information = dia_lord_hagen_oreonmap_info;
	permanent = FALSE;
	description = "Ta mapa, co jsem ti dal...";
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
	AI_Output(other,self,"DIA_Lord_Hagen_OreOnMap_01_00");	//Ta mapa, co jsem ti dal...
	AI_Output(other,self,"DIA_Lord_Hagen_OreOnMap_01_01");	//Byl na ní vyznačen ostrov s obrovskými ložisky magické rudy.
	AI_Output(other,self,"DIA_Lord_Hagen_OreOnMap_01_02");	//Nebo jsi už snad zapomněl?
	AI_Output(self,other,"DIA_Lord_Hagen_OreOnMap_01_03");	//Ach, ano, tvá mapa... (zamyšleně) Ne, pamatuji si ji!
	AI_Output(other,self,"DIA_Lord_Hagen_OreOnMap_01_04");	//Tak na co ještě čekáš?
	AI_Output(other,self,"DIA_Lord_Hagen_OreOnMap_01_05");	//Využij ji a paladinové opět získají šanci ve válce proti skřetům.
	AI_Output(self,other,"DIA_Lord_Hagen_OreOnMap_01_07");	//V mé pozici je to zatím jen kus papíru, nic víc.
	AI_Output(self,other,"DIA_Lord_Hagen_OreOnMap_01_08");	//Tu mapu musí vidět král! (vážně) Jen on může vyslat další expedici a zajistit převoz rudy.
	AI_Output(other,self,"DIA_Lord_Hagen_OreOnMap_01_09");	//Pak ho o tom musíme co nejrychleji informovat!
	MIS_SALETOBIGLAND = LOG_Running;
	Log_CreateTopic(TOPIC_SALETOBIGLAND,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SALETOBIGLAND,LOG_Running);
	if(HORINISISFREE == TRUE)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_OreOnMap_01_11");	//Nemůžu opustit tento ostrov, dokud se neujistím, že skřeti hrozba je skutečně minulostí!
		AI_Output(self,other,"DIA_Lord_Hagen_OreOnMap_01_14");	//A taky se musím postarat o obnovu a ochranu města.
		CANSALETOBIGLAND = TRUE;
		B_LogEntry(TOPIC_SALETOBIGLAND,"Teď, když už paladinové nemůžou používat runovou magii, zůstává jejich jedinou nadějí ve válce proti skřetům magická ruda. Navrhl jsem lordu Hagenovi, aby co nejdříve odjel na kontinent informovat krále o rudě, kterou jsme nalezli na opuštěném ostrově. On však ale nechce opustit ostrov, dokud nebude situace se skřety vyřešená. Navíc podle něj musí někdo zůstat zabezpečit město a jeho obranu, pokud by se ho skřeti opět pokusili napadnout.");
	}
	else
	{
		AI_Output(self,other,"DIA_Lord_Hagen_OreOnMap_01_16");	//A jak bys to asi chtěl udělat?
		AI_Output(self,other,"DIA_Lord_Hagen_OreOnMap_01_17");	//Jediná loď, která by zvládla plavbu na kontinent, je teď ve městě plném skřetů.
		AI_Output(self,other,"DIA_Lord_Hagen_OreOnMap_01_18");	//Nejdříve musíme osvobodit Khorinis, a až pak se rozhodneme, co dál.
		B_LogEntry(TOPIC_SALETOBIGLAND,"Teď, když už paladinové nemůžou používat runovou magii, zůstává jejich jedinou nadějí ve válce proti skřetům magická ruda. Navrhl jsem lordu Hagenovi, aby co nejdříve odjel na kontinent informovat krále o rudě, kterou jsme nalezli na opuštěném ostrově. Dokud ale skřeti ovládají město, bude to téměř nemožné.");
	};
};


instance DIA_LORD_HAGEN_CANSTURMTOWN(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 1;
	condition = dia_lord_hagen_cansturmtown_condition;
	information = dia_lord_hagen_cansturmtown_info;
	permanent = FALSE;
	description = "Osvobodím město od skřetů.";
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
	AI_Output(other,self,"DIA_Lord_Hagen_CanSturmTown_01_00");	//Osvobodím město od skřetů.
	AI_Output(self,other,"DIA_Lord_Hagen_CanSturmTown_01_01");	//Co?! (ohromeně) Myslíš, že to zvládneš?!
	AI_Output(self,other,"DIA_Lord_Hagen_CanSturmTown_01_03");	//Hmm... (skepticky) Dobře, tak jdi. Ale nepočítej s mojí pomocí.
	AI_Output(self,other,"DIA_Lord_Hagen_CanSturmTown_01_06");	//Moji lidé pořád musí bránit tuto farmu před nájezdy skřetů.
	MIS_HORINISFREE = LOG_Running;
	Log_CreateTopic(TOPIC_HORINISFREE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HORINISFREE,LOG_Running);
	B_LogEntry(TOPIC_HORINISFREE,"Řekl jsem lordu Hagenovi, že osvobodím město od skřetů. Zjevně si myslí, že jsem úplně zešílel. No, uvidíme, kdo má pravdu.");
};


instance DIA_LORD_HAGEN_CANSTURMTOWNDONE(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 1;
	condition = dia_lord_hagen_cansturmtowndone_condition;
	information = dia_lord_hagen_cansturmtowndone_info;
	permanent = FALSE;
	description = "Město je svobodné!";
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
	AI_Output(other,self,"DIA_Lord_Hagen_CanSturmTownDone_01_00");	//Město je svobodné!
	AI_Output(self,other,"DIA_Lord_Hagen_CanSturmTownDone_01_03");	//Děláš si srandu? (ohromeně) To je neuvěřitelné!
	AI_Output(self,other,"DIA_Lord_Hagen_CanSturmTownDone_01_05");	//No... (s respektem) V tom případě se vše začíná měnit k lepšímu!
	AI_Output(self,other,"DIA_Lord_Hagen_CanSturmTownDone_01_06");	//Když bylo město v rukou skřetů, neměli jsme šanci začít jim diktovat podmínky téhle války.
	AI_Output(self,other,"DIA_Lord_Hagen_CanSturmTownDone_01_07");	//Ale teď, díky tobě, je teď iniciativa konečně v našich rukou! Už brzo odtud skřeti nadobro zmizí.
	AI_Output(self,other,"DIA_Lord_Hagen_CanSturmTownDone_01_08");	//Přijmi mé upřímné díky za vše, cos pro nás udělal!
};


instance DIA_LORD_HAGEN_ALLGREATVICTORY(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 1;
	condition = dia_lord_hagen_allgreatvictory_condition;
	information = dia_lord_hagen_allgreatvictory_info;
	permanent = FALSE;
	description = "Skřeti již nejsou hrozbou!";
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
	AI_Output(other,self,"DIA_Lord_Hagen_AllGreatVictory_01_00");	//Skřeti již nejsou hrozbou!
	AI_Output(other,self,"DIA_Lord_Hagen_AllGreatVictory_01_02");	//Povedlo se mi zničit všechny jejich síly v téhle části ostrova.
	AI_Output(other,self,"DIA_Lord_Hagen_AllGreatVictory_01_03");	//A ti, co ještě zůstali, nám už moc neublíží.
	AI_Output(self,other,"DIA_Lord_Hagen_AllGreatVictory_01_04");	//Fantastické! Takže poslední vítězství je naše!
	AI_Output(self,other,"DIA_Lord_Hagen_AllGreatVictory_01_06");	//V tom případě zůstává jen navázat na tenhle úspěch a zničit poslední skřety dříve, než se z toho šoku vzpamatují.
	AI_Output(self,other,"DIA_Lord_Hagen_AllGreatVictory_01_09");	//Teď musíme znovu zaujmout pozice v průsmyku do Hornického údolí.
	AI_Output(self,other,"DIA_Lord_Hagen_AllGreatVictory_01_10");	//Je to poslední místo pořád v rukou skřetů. Alespoň pro tuhle chvíli.
	AI_Output(self,other,"DIA_Lord_Hagen_AllGreatVictory_01_11");	//A my se zatím postaráme o ochranu této části ostrova.
	AI_Output(other,self,"DIA_Lord_Hagen_AllGreatVictory_01_12");	//Chápu. Věřím, že to zvládnete.
	AI_Output(self,other,"DIA_Lord_Hagen_AllGreatVictory_01_13");	//To se vsaď, že ano.
	b_allgohome();
};


instance DIA_LORD_HAGEN_OREONMAPDONE(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 1;
	condition = dia_lord_hagen_oreonmapdone_condition;
	information = dia_lord_hagen_oreonmapdone_info;
	permanent = FALSE;
	description = "Nyní máš znovu svou loď!";
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
	AI_Output(other,self,"DIA_Lord_Hagen_OreOnMapDone_01_00");	//Nyní máš znovu svou loď!
	AI_Output(other,self,"DIA_Lord_Hagen_OreOnMapDone_01_01");	//Můžeš vyplout na kontinent a předat králi zprávu o té rudě.
	AI_Output(self,other,"DIA_Lord_Hagen_OreOnMapDone_01_02");	//Promiň, ale nemůžu opustit tento ostrov, dokud se neujistím, že skřeti hrozba je skutečně minulostí!
	AI_Output(self,other,"DIA_Lord_Hagen_OreOnMapDone_01_04");	//V Hornickém údolí je těchhle stvůr ještě pořád hodně a jen sám Innos ví, co se bude dít.
	AI_Output(self,other,"DIA_Lord_Hagen_OreOnMapDone_01_05");	//Kromě toho se někdo stejně musí postarat o obnovu a ochranu města.
	AI_Output(self,other,"DIA_Lord_Hagen_OreOnMapDone_01_06");	//Takže, jak vidíš, nemám nikoho, koho bych poslal ke králi!
	B_LogEntry(TOPIC_SALETOBIGLAND,"Lord Hagen nechce opustit ostrov, dokud nebude situace se skřety vyřešená. Navíc podle něj musí někdo zůstat zabezpečit město a jeho obranu, pokud by se ho skřeti opět pokusili napadnout.");
	CANSALETOBIGLAND = TRUE;
};


instance DIA_LORD_HAGEN_CANSALETOBIGLAND(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 1;
	condition = dia_lord_hagen_cansaletobigland_condition;
	information = dia_lord_hagen_cansaletobigland_info;
	permanent = FALSE;
	description = "Můžu tu zprávu doručit.";
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
	AI_Output(other,self,"DIA_Lord_Hagen_CanSaleToBigLand_01_00");	//Můžu tu zprávu doručit.
	AI_Output(other,self,"DIA_Lord_Hagen_CanSaleToBigLand_01_01");	//Pokud, samozřejmě, mi svěříš svou loď!
	AI_Output(self,other,"DIA_Lord_Hagen_CanSaleToBigLand_01_02");	//Hmm... (sarkasticky) Upřímně, jsem překvapen, že to říkáš.
	AI_Output(self,other,"DIA_Lord_Hagen_CanSaleToBigLand_01_03");	//Obzvlášť když si vzpomínám, že posledně ses mě na svolení moc neptal a prostě jsi mi ji ukradl.
	AI_Output(self,other,"DIA_Lord_Hagen_CanSaleToBigLand_01_06");	//Ale teď vážně... (rozhodně) Za tímhle účelem bych ti ji skutečně mohl poskytnout.
	AI_Output(self,other,"DIA_Lord_Hagen_CanSaleToBigLand_01_07");	//Paladinové na kontinentu tuhle rudu zoufale potřebují a má svatá povinnost mě zavazuje, abych jim v téhle válce pomohl, jak jen můžu.
	AI_Output(self,other,"DIA_Lord_Hagen_CanSaleToBigLand_01_08");	//(opatrně) Nikdo však nicméně neví, jaká tam teď panuje situace...
	AI_Output(self,other,"DIA_Lord_Hagen_CanSaleToBigLand_01_09");	//V každém případě to ale musíme zjistit.
	AI_Output(self,other,"DIA_Lord_Hagen_CanSaleToBigLand_01_10");	//Takže si můžeš vzít mou loď a co nejdříve vyrazit na kontinent. A pospěš si, každá minuta je teď drahá!
	AI_Output(self,other,"DIA_Lord_Hagen_CanSaleToBigLand_01_11");	//Odevzdej králi tuhle mapu a pověz mu o té rudě, cos našel. Doufejme, že ještě není vše ztraceno!
	B_GiveInvItems(self,other,itmi_seamaplostisland,1);
	AI_Output(other,self,"DIA_Lord_Hagen_CanSaleToBigLand_01_12");	//Dobrá, tak tedy vyrazím!
	B_StartOtherRoutine(SLD_800_Lee,"Start");
	B_StartOtherRoutine(BAU_910_Maria,"Start");
	LEERECOVERED = TRUE;
	SHIPAGAINACCESS = TRUE;
	B_LogEntry(TOPIC_SALETOBIGLAND,"Nabídl jsem lordu Hagenovi, že doručím jeho zprávu králi. Po chvíli přemýšlení souhlasil s mým návrhem a svěřil mi svou loď. Teď musím co nejdříve vyplout na kontinent. Možná pomoc pro paladiny ještě dorazí včas.");
};


instance DIA_LORD_HAGEN_NEEDCAPITAN(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 1;
	condition = dia_lord_hagen_needcapitan_condition;
	information = dia_lord_hagen_needcapitan_info;
	permanent = FALSE;
	description = "Potřebuji kapitána, který zvládne řídit tvou loď.";
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
	AI_Output(other,self,"DIA_Lord_Hagen_NeedCapitan_01_00");	//Potřebuji kapitána, který zvládne řídit tvou loď.
	if((PIR_JOINHAGEN == TRUE) && (Npc_IsDead(pir_13200_addon_greg) == FALSE))
	{
		AI_Output(self,other,"DIA_Lord_Hagen_NeedCapitan_01_01");	//Promluv si s Gregem. Nyní je kapitánem mé lodě on.
		GREGISCAPITAN = TRUE;
		B_LogEntry(TOPIC_SALETOBIGLAND,"Když jsem se ptal po kapitánovi, lord Hagen mě nasměroval za Gregem. Teď je kapitánem lodi on.");
	}
	else
	{
		AI_Output(self,other,"DIA_Lord_Hagen_NeedCapitan_01_05");	//Obávám se, že s tím ti nepomůžu... (vážně) Má loď teď totiž kapitána nemá.
		AI_Output(self,other,"DIA_Lord_Hagen_NeedCapitan_01_07");	//Až donedávna zastával tuhle funkci paladin Lothar, ale jak zřejmě víš, ten byl zbaběle zavražděn.
		AI_Output(self,other,"DIA_Lord_Hagen_NeedCapitan_01_08");	//Nevím o nikom jiném, kdo by ji dokázal řídit.
		AI_Output(other,self,"DIA_Lord_Hagen_NeedCapitan_01_09");	//Hmm... Rozumím. Budu se tedy muset podívat po jiném kapitánovi!
	};
};

instance DIA_Lord_Hagen_Kill_Done_Rings(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 1;
	condition = DIA_Lord_Hagen_Kill_Done_Rings_condition;
	information = DIA_Lord_Hagen_Kill_Done_Rings_info;
	permanent = FALSE;
	description = "Mám tady nějaké paladinské prsteny.";
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

	AI_Output(other,self,"DIA_Lord_Hagen_Kill_Done_Rings_01_01");	//Mám tady nějaké paladinské prsteny.
	AI_Output(self,other,"DIA_Lord_Hagen_Kill_Done_Rings_01_03");	//Kdes je... (zuřivě) Ty snad vraždíš mé muže?!
	AI_Output(other,self,"DIA_Lord_Hagen_Kill_Done_Rings_01_04");	//To tedy ne! Našel jsem je u tvých padlých druhů.
	AI_Output(other,self,"DIA_Lord_Hagen_Kill_Done_Rings_01_05");	//A rozhodl jsem se, že je radši odevzdám tobě, než je nechám skřetům!
	AI_Output(self,other,"DIA_Lord_Hagen_Kill_Done_Rings_01_06");	//Udělal jsi správnou věc, žes mi je přinesl.
	AI_Output(self,other,"DIA_Lord_Hagen_Kill_Done_Rings_01_07");	//Je to památka na ty, kteří položili život v službě Innosovi a králi!
	AI_Output(self,other,"DIA_Lord_Hagen_Kill_Done_Rings_01_09");	//Dej mi je, všechny! Budou mi připomínat, kolik těch zatracených stvůr musí má čepel ještě sprovodit z tohoto světa, abych pomstil své bratry.
	AI_Output(other,self,"DIA_Lord_Hagen_Kill_Done_Rings_01_10");	//Tady je máš.

	RingSum = Npc_HasItems(hero,itri_quest_pal_ring);
	B_GiveInvItems(other,self,itri_quest_pal_ring,RingSum);
	RingSumXP = RingSum * 250;
	B_GivePlayerXP(RingSumXP);

	AI_Output(self,other,"DIA_Lord_Hagen_Kill_Done_Rings_01_11");	//Děkuji ti! Ale byl bych nerad, kdyby se to muselo opakovat.
	AI_Output(other,self,"DIA_Lord_Hagen_Kill_Done_Rings_01_12");	//Rozumím.
};

var int Hagen_PAL_ARMOR_permanent;

instance DIA_Hagen_PAL_ARMOR(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 8;
	condition = DIA_Hagen_PAL_ARMOR_Condition;
	information = DIA_Hagen_PAL_ARMOR_Info;
	permanent = TRUE;
	description = "Koupit zbroj paladina. (cena: 15000 zlatých)";
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
	AI_Output(other,self,"DIA_Hagen_PAL_ARMOR_01_00");	//Prodej mi zbroj paladina.

	if(Npc_HasItems(other,ItMi_Gold) >= 15000)
	{
		B_GiveInvItems(other,self,ItMi_Gold,15000);
		Npc_RemoveInvItems(self,ItMi_Gold,15000);
		AI_Output(self,other,"DIA_Hagen_PAL_ARMOR_01_01");	//Dobrá! Tady, je tvá.
		AI_Output(self,other,"DIA_Hagen_PAL_ARMOR_01_02");	//Nos ji s hrdostí, protože jen někteří dosáhnou takové cti.
		CreateInvItems(self,itar_pal_h,1);
		B_GiveInvItems(self,other,itar_pal_h,1);
		Hagen_PAL_ARMOR_permanent = TRUE;
		SHOW_ITAR_PAL_H = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Hagen_PAL_ARMOR_01_03");	//Nemáš dost zlata.
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
	description = "Koupit helmu paladina. (cena: 5000 zlatých)";
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
	AI_Output(other,self,"DIA_Hagen_PAL_HELM_01_00");	//Prodej mi helmu paladina...
	Info_ClearChoices(DIA_Hagen_PAL_HELM);
	Info_AddChoice(DIA_Hagen_PAL_HELM,"... se zdviženým hledím.",DIA_Hagen_PAL_HELM_OPEN);
	Info_AddChoice(DIA_Hagen_PAL_HELM,"... se spuštěným hledím.",DIA_Hagen_PAL_HELM_CLOSED);
};

func void DIA_Hagen_PAL_HELM_OPEN()
{
	if(Npc_HasItems(other,ItMi_Gold) >= 5000)
	{
		B_GiveInvItems(other,self,ItMi_Gold,5000);
		Npc_RemoveInvItems(self,ItMi_Gold,5000);
		AI_Output(self,other,"DIA_Hagen_PAL_HELM_01_01");	//Dobrá! Tady ji máš.
		AI_Output(self,other,"DIA_Hagen_PAL_HELM_01_02");	//Ochrání tě i v žáru té nejkrutější bitvy, to se můžeš spolehnout.
		CreateInvItems(self,itar_pal_helm_open,1);
		B_GiveInvItems(self,other,itar_pal_helm_open,1);
		Hagen_PAL_HELM_permanent = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Hagen_PAL_HELM_01_03");	//Nemáš dost zlata.
	};

	Info_ClearChoices(DIA_Hagen_PAL_HELM);
};

func void DIA_Hagen_PAL_HELM_CLOSED()
{
	if(Npc_HasItems(other,ItMi_Gold) >= 5000)
	{
		B_GiveInvItems(other,self,ItMi_Gold,5000);
		Npc_RemoveInvItems(self,ItMi_Gold,5000);
		AI_Output(self,other,"DIA_Hagen_PAL_HELM_01_01");	//Dobrá! Tady ji máš.
		AI_Output(self,other,"DIA_Hagen_PAL_HELM_01_02");	//Ochrání tě i v žáru té nejkrutější bitvy, to se můžeš spolehnout.
		CreateInvItems(self,itar_pal_helm,1);
		B_GiveInvItems(self,other,itar_pal_helm,1);
		Hagen_PAL_HELM_permanent = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Hagen_PAL_HELM_01_03");	//Nemáš dost zlata.
	};

	Info_ClearChoices(DIA_Hagen_PAL_HELM);
};

//--------------------------------------------------Temnyy order------------------------------------------

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
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_01_01");	//Dobře, že jsi tady!
	AI_Output(other,self,"DIA_Lord_Hagen_DarkOrden_01_02");	//Co se stalo?
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_01_03");	//Jak to? (překvapeně) Ty o ničem nevíš?
	AI_Output(other,self,"DIA_Lord_Hagen_DarkOrden_01_04");	//Nemám tušení, o čem to mluvíš.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_01_05");	//No... (vážně) Po celém Khorinisu se potulují nemrtví! Nepřejde dne, abychom se nemuseli bránit jejich útokům.
	AI_Output(other,self,"DIA_Lord_Hagen_DarkOrden_01_06");	//A odkud se berou?
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_01_07");	//To nevím... (hrozivě) Jinak by mí muži již dávno trochu 'vyjasnili' situaci!
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_01_08");	//Ale pak by nám nikdo nezůstal na obranu města!
	AI_Output(other,self,"DIA_Lord_Hagen_DarkOrden_01_09");	//No jo. A co s tím mám co dělat já?
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_01_10");	//Hmm... (vážně) Slyšel jsem, že ses postaral o všechny draky v Hornickém údolí.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_01_11");	//Je možné, že tohle všechno jsou jen důsledky tvých činů!
	AI_Output(other,self,"DIA_Lord_Hagen_DarkOrden_01_12");	//Říkáš, že jsem je neměl sprovodit ze světa?
	AI_Output(other,self,"DIA_Lord_Hagen_DarkOrden_01_13");	//Jo, asi jsem je snad měl raději nechat spálit město na popel. A nádavkem vzít i okolní farmy.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_01_14");	//(hrozivě) To jsem neřekl! Samozřejmě, že jsme ti vděčni za to, cos udělal.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_01_15");	//Ale hrozba nemrtvých není o nic méně nebezpečná! Proto ti nařizuji postarat se o tenhle problém.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_01_16");	//Pokud jsi porazil draky i se vší jejich silou, myslím, že bys to měl zvládnout!
	AI_Output(other,self,"DIA_Lord_Hagen_DarkOrden_01_17");	//Chtěl bych mít tvou důvěru.
	MIS_DarkOrden = LOG_Running;
	Log_CreateTopic(TOPIC_DarkOrden,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DarkOrden,LOG_Running);
	B_LogEntry(TOPIC_DarkOrden,"Celý Khorinis je zaplavený nemrtvými! Lord Hagen mě pověřil zjistit, co je příčinou téhle invaze.");
};

instance DIA_Lord_Hagen_DarkOrden_WhatDo(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 1;
	condition = DIA_Lord_Hagen_DarkOrden_WhatDo_condition;
	information = DIA_Lord_Hagen_DarkOrden_WhatDo_info;
	permanent = FALSE;
	description = "Kde bych měl začít?";
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
	AI_Output(other,self,"DIA_Lord_Hagen_DarkOrden_WhatDo_01_01");	//Kde bych měl začít?
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_WhatDo_01_02");	//Hmm... (zadumaně) Na tvém místě bych se nejdříve šel poradit s Pyrokarem.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_WhatDo_01_03");	//Není pochyb, že si tě vybral sám Innos!
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_WhatDo_01_04");	//Dal ti tvou sílu porazit draky.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_WhatDo_01_05");	//Náš současný nepřítel, ať je to kdokoli, je ale... jiného druhu.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_WhatDo_01_06");	//A samozřejmě budeš potřebovat moudrého rádce, který ti pomůže všechno pochopit.
	AI_Output(other,self,"DIA_Lord_Hagen_DarkOrden_WhatDo_01_07");	//Takže musím jít do kláštera.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_WhatDo_01_08");	//Dobrá, jdi! Jen mě nezapomeň informovat.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_WhatDo_01_09");	//Jdi s Innosovým požehnáním...
	B_LogEntry(TOPIC_DarkOrden,"Lord Hagen mi poradil, abych šel nejdříve za Pyrokarem. Tak tedy, jde se do kláštera!");
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
	description = "Jaká je situace?";
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
	AI_Output(other,self,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_01");	//Jaká je situace?
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_02");	//Ještě horší, než posledně... Ti nemrtví už vylézají odevšad!
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_03");	//Už teď mám málo lidí na to, abych ubránil město.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_04");	//A nemůžu ani vyslat posla do pevnosti Azgan, ať lord Varus přijde s hlavní částí armády.
	AI_Output(other,self,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_05");	//Pokud chceš, mohu tam tu zprávu zanést! Ale nejprv se tě něco chci zeptat.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_06");	//Co přesně?
	AI_Output(other,self,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_07");	//Ohledně paladinů pohřbených na tomhle ostrově.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_08");	//Jistě, o tomhle... (vážně) Pyrokar píše, žes musel zkontrolovat jejich hrobky.
	AI_Output(other,self,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_09");	//To jsem již udělal! Obešel jsem všechny tři hrobky a postaral se o nemrtvé, které jsem našel.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_10");	//Jak ale vidíš, útoky jsou ještě silnější. Nestačí to!
	AI_Output(other,self,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_11");	//Co tím myslíš?
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_12");	//Nechtěl jsem ti to říkat, ale zjevně nemám na výběr.
	AI_Output(other,self,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_13");	//Cos mi to nechtěl říct?
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_14");	//Víš... V historii našeho řádu jsou i temnější místa! Raději si tyhle příběhy nepamatujeme.
	AI_Output(other,self,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_15");	//Vypadá to tak, že tady o něčem nevím.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_16");	//Ano, něco by tady bylo! Na ostrově se totiž nachází ještě jedna hrobka.
	AI_Output(other,self,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_17");	//Ale, copak! Komu patří?
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_18");	//Za svého života byl znám jako Konrad Ginnok. Většina lidí ho ale zná jako 'Šíleného Křižáka'!
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_19");	//Kdysi to byl mocný válečník a hlava našeho řádu.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_20");	//To on vedl výpravu do jednoho ze čtyř Beliarových chrámů a zničil ho.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_21");	//Ale pak, po té události, se změnil.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_22");	//Nevím přesně, co se tam stalo. A zřejmě to neví ani nikdo jiný.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_23");	//Ale když se vrátil do Myrtany, lidé se ho brzy začali obávat?
	AI_Output(other,self,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_24");	//Proč?
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_25");	//Protože každého, koho Ginnok považoval za nehodného toho, být služebníkem Innose, prostě zavraždil!
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_26");	//Ve své slepé, fanatické víře nedělal rozdíly - ženy, děti, starci...
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_27");	//Nakonec ve svém šílenství pozvedl meč i proti samotnému králi!
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_28");	//Rhobar neměl jinou možnost, než ho dát popravit.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_29");	//V tajnosti byl pohřben na tomhle ostrově.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_30");	//Daleko od krále a od všech, kteří se ho předtím obávali!
	AI_Output(other,self,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_31");	//Zajímavý příběh, cos mi řekl.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_32");	//(zamyšleně) Podle mého názoru Ginnoka zřejmě posedli nějaké temné síly.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_33");	//Zlo, které nikdo z nás nezná.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_34");	//Ale teď, pokud přirozeně chceme zachránit obyvatele města, musíme tenhle příběh objasnit!
	AI_Output(other,self,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_35");	//Předpokládám, že chceš, abych to udělal já.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_36");	//Máš pravdu... (vážně) Získal jsem klíč k jeho hrobce.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_37");	//Byl mi odevzdán jako hlavě paladinského řádu. Svěřím ti ho.
	B_GiveInvItems(self,other,ItKe_Hagen_DarkOrder_Ginnok,1);
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_38");	//Zapřísahám tě při Innosovi - pospěš si! Každá vteřina je nám teď drahá.
	AI_Output(other,self,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_39");	//Rozumím. Kde je ta hrobka?
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_40");	//Když vyrazíš západní městskou branou a půjdeš na jih, uvidíš v skalách malou štěrbinu.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_Ginnok_01_41");	//Tak se dostaneš do jeskyně, ve které se nachází jeho hrobka.
	B_LogEntry(TOPIC_DarkOrden,"To jsou novinky! Lord Hagen zatajil před obyvateli ostrova, že se zde nachází další paladinská hrobka. V ní leží Konrad Ginnok, za svého života známý jako 'Šílený Křižák'. Podle lorda Hagena je to jeden z nejtemnějších příběhů v dějinách Řádu. Ginnok byl velice krutý muž, obzvláště k těm, které považoval za nehodné být služebníky Innose. Nakonec se pokusil sesadit samotného krále Rhobara, kvůli čemu byl nakonec popraven a pohřben v tajnosti tady na ostrově. Lord Hagen mi dal klíč od jeho hrobky. Měl bych se tam zastavit a prozkoumat přítomnost nemrtvých a jiného zla.");
	AI_StopProcessInfos(self);
};

instance DIA_Lord_Hagen_DarkOrden_Done(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 1;
	condition = DIA_Lord_Hagen_DarkOrden_Done_condition;
	information = DIA_Lord_Hagen_DarkOrden_Done_info;
	permanent = FALSE;
	description = "Navštívil jsem Ginnokovu hrobku.";
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
	AI_Output(other,self,"DIA_Lord_Hagen_DarkOrden_Done_01_01");	//Navštívil jsem Ginnokovu hrobku.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_Done_01_02");	//Co jsi tam zjistil?
	AI_Output(other,self,"DIA_Lord_Hagen_DarkOrden_Done_01_03");	//To raději ani nechtěj vědět! Můžu ti ale říct, že za tím byl opravdu Ginnok.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_Done_01_04");	//No... (vzdech) Alespoň je teď město a jeho obyvatelé v bezpečí! To je nejdůležitější.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_Done_01_05");	//Přijmi mé díky i díky nás všech!
	AI_Output(other,self,"DIA_Lord_Hagen_DarkOrden_Done_01_06");	//Hmm...
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_Done_01_07");	//Hmm... (zmateně) Potřebuješ ještě něco?
	AI_Output(other,self,"DIA_Lord_Hagen_DarkOrden_Done_01_08");	//No... nezasloužím si snad nějakou odměnu?
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_Done_01_09");	//Tys to nedělal kvůli bezpečí všech obyvatel Khorinisu? (překvapeně) Takové sobecké myšlenky mě nutí o tobě pochybovat!
	AI_Output(other,self,"DIA_Lord_Hagen_DarkOrden_Done_01_10");	//Dobrá, dobrá, zapomeň, co jsem říkal... (pro sebe) Paladinové...
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_Done_01_11");	//A ještě něco... (vážně) Ptal se po tobě Vatras!
	AI_Output(self,other,"DIA_Lord_Hagen_DarkOrden_Done_01_12");	//Vypadalo to, že s tebou musí probrat něco důležitého.
	HagenSendVat = TRUE;
	MIS_DarkOrden = LOG_Success;
	Log_SetTopicStatus(TOPIC_DarkOrden,LOG_Success);
	B_LogEntry(TOPIC_DarkOrden,"Lord Hagen byl velmi potěšen zprávou, že jsem uložil duši 'Šíleného Křižáka' na odpočinek. Útoky jsou minulostí a Khorinis se už nemusí obávat hrozby nemrtvých.");
};

instance DIA_Lord_Hagen_NeedWorldMap(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 1;
	condition = DIA_Lord_Hagen_NeedWorldMap_condition;
	information = DIA_Lord_Hagen_NeedWorldMap_info;
	permanent = FALSE;
	description = "Kdo je kapitánem 'Esmeraldy'?";
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
	AI_Output(other,self,"DIA_Lord_Hagen_NeedWorldMap_01_01");	//Kdo je kapitánem 'Esmeraldy'?
	AI_Output(self,other,"DIA_Lord_Hagen_NeedWorldMap_01_02");	//To je zvláštní dotaz... (překvapeně) Já, samozřejmě!
	AI_Output(other,self,"DIA_Lord_Hagen_NeedWorldMap_01_03");	//Naviguješ snad loď osobně?
	AI_Output(self,other,"DIA_Lord_Hagen_NeedWorldMap_01_04");	//Ne! To dělá navigátor, samozřejmě.
	AI_Output(other,self,"DIA_Lord_Hagen_NeedWorldMap_01_05");	//Kdo je váš navigátor?
	AI_Output(self,other,"DIA_Lord_Hagen_NeedWorldMap_01_06");	//Jmenuje se Orto. Zrovna je se zbytkem paladinů v pevnosti Azgan.
	AI_Output(self,other,"DIA_Lord_Hagen_NeedWorldMap_01_07");	//(se zájmem) A co přesně po něm potřebuješ?
	AI_Output(other,self,"DIA_Lord_Hagen_NeedWorldMap_01_08");	//Nic, jen mě to tak zajímalo.
	AI_Output(self,other,"DIA_Lord_Hagen_NeedWorldMap_01_09");	//Hmm...

	if(GRANTTOFORT == FALSE)
	{
		B_LogEntry(Topic_SylvioCrew,"Navigátorem paladinské lodi je Orto. Pravděpodobně bude mít mapu, kterou potřebuji. Naneštěstí je ale spolu s ostatními paladiny v pevnosti Azgan, kam se nedostanu. Musím vymyslet něco jiného...");
		Wld_InsertItem(ItWr_Seamap_Mirtana,"FP_ITEM_SHIP_SEAMAP");
	}
	else
	{
		B_LogEntry(Topic_SylvioCrew,"Navigátorem paladinské lodi je Orto. Pravděpodobně bude mít mapu, kterou potřebuji. Právě je spolu s ostatními paladiny v pevnosti Azgan...");
		GotoFortMap = TRUE;
	};

	AI_StopProcessInfos(self);
};


//---------------------------nachalo istorii o znake------------------------------------------------

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
	AI_Output(self,other,"DIA_Lord_Hagen_KILLDMT_04_00");	//Počkej! Je tu ještě něco...
	AI_Output(self,other,"DIA_Lord_Hagen_KILLDMT_04_01");	//Nemůžu si vůbec pomoci, ale všimni si cest na kterých se procházejí podezřelé osoby v černých róbách.
	AI_Output(self,other,"DIA_Lord_Hagen_KILLDMT_04_02");	//Lidé jim přezdívají temní cizinci, jistě uctívají Beliara.
	AI_Output(self,other,"DIA_Lord_Hagen_KILLDMT_04_03");	//Jak jsem se dozvěděl, nedaleko Onarovy farmy se nachází jejich hlavní tábor.
	AI_Output(self,other,"DIA_Lord_Hagen_KILLDMT_04_04");	//Nemyslím si, že by vedli podnikatelské činnosti s žoldáky, ale jejich volba místa mi přivádí vážné obavy. 

	if(Npc_KnowsInfo(hero,DIA_Torlof_DEMENTOREN))
	{
		AI_Output(other,self,"DIA_Lord_Hagen_KILLDMT_15_01");	//Věřte mi, že žoldákům se to nelíbí o nic víc než vám.
		AI_Output(self,other,"DIA_Lord_Hagen_KILLDMT_04_05");	//To je správně. Problém však nemizí.
	};

	AI_Output(other,self,"DIA_Lord_Hagen_KILLDMT_15_02");	//Co to všechno má znamenat pro mě?
	AI_Output(self,other,"DIA_Lord_Hagen_KILLDMT_04_06");	//Chci, abys skoncoval s tou věží, já na takové věci nemám zrovna čas.
	AI_Output(self,other,"DIA_Lord_Hagen_KILLDMT_04_07");	//Nemůžeme dovolit, aby tito Beliarovi zplozenci sužovali Khorinis.
	AI_Output(other,self,"DIA_Lord_Hagen_KILLDMT_15_03");	//Co? Mám s tím vším zatočit?
	AI_Output(self,other,"DIA_Lord_Hagen_KILLDMT_04_08");	//Počkej, nespěchej. Ano, jejich oddíl je silný. Moc silný na dobytí.
	AI_Output(self,other,"DIA_Lord_Hagen_KILLDMT_04_09");	//I když jsem tam poslal své nejlepší muže, krom toho že nemají dobré vztahy se žoldáky - prostě se nevrátily.
	AI_Output(self,other,"DIA_Lord_Hagen_KILLDMT_04_10");	//Naše jediná šance je jednat tajně, také se tam nachází nějaké doly. 
	Info_ClearChoices(dia_lord_hagen_killdmt);
	Info_AddChoice(dia_lord_hagen_killdmt,"No, uvidím co se dá dělat.",dia_lord_hagen_killdmt_yes);
	Info_AddChoice(dia_lord_hagen_killdmt,"Ne, je to příliš nebezpečné. To pro vás neudělám.",dia_lord_hagen_killdmt_no);
};

func void dia_lord_hagen_killdmt_yes()
{
	AI_Output(other,self,"DIA_Lord_Hagen_KILLDMT_Yes_15_00");	//No, uvidím co se dá dělat.
	AI_Output(self,other,"DIA_Lord_Hagen_KILLDMT_Yes_04_01");	//Děkuji. Ty - naše jediná naděje v tomto případě.
	AI_Output(self,other,"DIA_Lord_Hagen_KILLDMT_Yes_04_02");	//Nyní jdi a znič ohnisko zla! Ať tě provází Innos.
	MIS_HAGENKILLDMT = LOG_Running;
	Log_CreateTopic(TOPIC_HAGENKILLDMT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HAGENKILLDMT,LOG_Running);
	B_LogEntry(TOPIC_HAGENKILLDMT,"Lord Hagen chce, abych odstranil všechny temné poutníky v bývalé věži Dextera. Tahle mise se zdá být čistá sebevražda. Navíc se tam vyskytují nějaké doly.");
	AI_StopProcessInfos(self);
};

func void dia_lord_hagen_killdmt_no()
{
	AI_Output(other,self,"DIA_Lord_Hagen_KILLDMT_No_15_00");	//Ne, je to příliš nebezpečné. To pro vás neudělám.
	AI_Output(self,other,"DIA_Lord_Hagen_KILLDMT_No_04_01");	//Je to škoda, spoléhal jsem na tebe. V každém případě chápu a nemám zášť.
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
	AI_Output(self,other,"DIA_Lord_Hagen_DMTAREDEAD_04_00");	//Jsi zpátky! A co mé zakázky? Podařilo se ti vypořádat s nepřítelem?
	AI_Output(other,self,"DIA_Lord_Hagen_DMTAREDEAD_15_01");	//Nemůžu říct, že by to bylo snadné, ale všichni temní poutníci skonali.
	AI_Output(self,other,"DIA_Lord_Hagen_DMTAREDEAD_04_02");	//Chvála Innos! Věděl jsem že se na tebe můžu spolehnout.
	AI_Output(self,other,"DIA_Lord_Hagen_DMTAREDEAD_04_03");	//Tady, vem si malou odměnu za vykonanou práci. Zasloužíš si ji víc než kdokoliv jiný.
	B_LogEntry(TOPIC_HAGENKILLDMT,"Zabil jsem temné cizince a nahlásil vše lordu Hagenovi.");
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

	AI_Output(other,self,"DIA_Lord_Hagen_DMTAREDEAD_15_04");	//Děkuju. Máte pro mě ještě nějakou práci? 
	AI_Output(self,other,"DIA_Lord_Hagen_DMTAREDEAD_04_05");	//Hmmm, záleží na tom co si představuješ. Řekni mi jak ti to jde s bydlením?
	AI_Output(other,self,"DIA_Lord_Hagen_DMTAREDEAD_15_07");	//S bydlením? Nemám se čím chlubit.
	AI_Output(other,self,"DIA_Lord_Hagen_DMTAREDEAD_15_08");	//Nicméně mám, kde se vyspat v noci. Ale proč se ptáte? 
	AI_Output(self,other,"DIA_Lord_Hagen_DMTAREDEAD_04_09");	//Zatímco jsi byl pryč, uvědomil jsem si že máme co do činění s tamtou věží.
	AI_Output(self,other,"DIA_Lord_Hagen_DMTAREDEAD_04_10");	//Za prvé, banditi, potom přisluhovači Temného boha. Kdo je další - skřeti? Nebo draci? 
	AI_Output(self,other,"DIA_Lord_Hagen_DMTAREDEAD_04_11");	//Vypadá to, že je magnetem na špatné hosty a to přináší problémy.
	AI_Output(self,other,"DIA_Lord_Hagen_DMTAREDEAD_04_12");	//Mohu poslat paladiny, ale Onar...
	AI_Output(other,self,"DIA_Lord_Hagen_DMTAREDEAD_15_13");	//Všechno je mi jasné. Nechte mě hádat, ta potíž by se dala shodit mě na ramena?
	AI_Output(self,other,"DIA_Lord_Hagen_DMTAREDEAD_04_14");	//Dalo by se to tak říct. Teda spíše, tu věž a prostor kolem ní. Chci ten zatracenej kus země dát do rukou spolehlivého člověka.
	AI_Output(self,other,"DIA_Lord_Hagen_DMTAREDEAD_04_15");	//Ano, není to tam příliš bezpečné, ale podívej se na to tak: celý majetek připadne do tvého vlastnictvý.
	AI_Output(self,other,"DIA_Lord_Hagen_DMTAREDEAD_04_16");	//O dokumenty se budu starat já. Najdi si jenom lidi, co ti zajistí a ochrání věž. 
	AI_Output(self,other,"DIA_Lord_Hagen_DMTAREDEAD_04_17");	//Kromě toho existuje tam celá řada opuštěných dolů, které již příliš dlouho přitahovaly mou pozornost.
	AI_Output(self,other,"DIA_Lord_Hagen_DMTAREDEAD_04_18");	//Může v nich být stále ruda a my teď potřebujeme každý kousek.
	AI_Output(self,other,"DIA_Lord_Hagen_DMTAREDEAD_04_19");	//Onar mi těžit v dolech nedovolí, na to máme příliš chladné vztahy s žoldáky.
	AI_Output(self,other,"DIA_Lord_Hagen_DMTAREDEAD_04_20");	//Tak co ty na to?
	AI_Output(other,self,"DIA_Lord_Hagen_DMTAREDEAD_15_21");	//Hmm... váš návrh je zajímavý, ale jak zareaguje Onar?
	AI_Output(self,other,"DIA_Lord_Hagen_DMTAREDEAD_04_22");	//A to je - hlavní háček.
	AI_Output(self,other,"DIA_Lord_Hagen_DMTAREDEAD_04_23");	//Starý lakomec by se raději díval na pohled prázdnou, rozpadající se pod vlivem času věž, než že by tam někoho pustil.
	AI_Output(self,other,"DIA_Lord_Hagen_DMTAREDEAD_04_24");	//Kromě toho si myslí, že celá oblast kolem farmy je jeho vlastní a nikdo ji nemůže narušit.
	AI_Output(self,other,"DIA_Lord_Hagen_DMTAREDEAD_04_25");	//Musíš ho nějak přesvědčit, aby nenarušoval naše akce a mohli jsme přivést věž do pořádku.
	Info_ClearChoices(dia_lord_hagen_dmtaredead);
	Info_AddChoice(dia_lord_hagen_dmtaredead,"Dobře, beru to.",dia_lord_hagen_dmtaredead_yes);
	Info_AddChoice(dia_lord_hagen_dmtaredead,"Příliš mnoho zmatků. Myslím že se toho vzdám.",dia_lord_hagen_dmtaredead_no);
};

func void dia_lord_hagen_dmtaredead_yes()
{
	AI_Output(other,self,"DIA_Lord_Hagen_DMTAREDEAD_Yes_15_00");	//Dobře, beru to.
	AI_Output(self,other,"DIA_Lord_Hagen_DMTAREDEAD_Yes_04_01");	//Výborně. Papírové formality, jak jsem řekl pro mě. Kromě toho, tady jsou nějaké peníze napoprvé.
	B_GiveInvItems(self,other,ItMi_Gold,2000);
	AI_Output(self,other,"DIA_Lord_Hagen_DMTAREDEAD_Yes_04_02");	//To znamená, že musíš najít nějakého odborníka co prověří doly. Myslím, že ho budeš potřebovat.
	MIS_MYNEWMANSION = LOG_Running;
	Log_CreateTopic(TOPIC_MYNEWMANSION,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MYNEWMANSION,LOG_Running);
	B_LogEntry(TOPIC_MYNEWMANSION,"Lord Hagen se rozhodl, mi poděkovat za odstranění tmavých lidí a předal mi majetek bývalé věže Dextera. Nicméně, Onar pravděpodobně nebude souhlasit, takže nejprve musím urovnat celou záležitost s ním. Musím najít něco, co ho přesvědčí.");
	MIS_DTOLDNEWMINE = LOG_Running;
	Log_CreateTopic(TOPIC_DTOLDNEWMINE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DTOLDNEWMINE,LOG_Running);
	B_LogEntry_Quiet(TOPIC_DTOLDNEWMINE,"Zdá se, že o rudu ve staré věži je velký zájem ze strany lorda Hagena. Chce vědět, zda tam stále existuje magická ruda nebo ne. Měli bychom najít někoho, kdo bude schopen odhadnout jeho množství a kvality.");
	AI_StopProcessInfos(self);
};

func void dia_lord_hagen_dmtaredead_no()
{
	AI_Output(other,self,"DIA_Lord_Hagen_DMTAREDEAD_No_15_00");	//Příliš mnoho zmatků. Myslím, že se toho vzdám.
	AI_Output(self,other,"DIA_Lord_Hagen_DMTAREDEAD_No_04_01");	//Ty - válečník, ne vládce, to je naprosto zřejmé. Ale podle zákonů obyčejné spravedlnosti, co ti kteří nás nezbavují od zla ve světě? Dobře, nebudu tě k ničemu nutit. Je mou povinností pouze poděkovat za získání nadvlády nad věží.
	AI_StopProcessInfos(self);
};

instance DIA_LORD_HAGEN_ONARSUCCS(C_Info)
{
	npc = PAL_200_Hagen;
	nr = 27;
	condition = dia_lord_hagen_onarsuccs_condition;
	information = dia_lord_hagen_onarsuccs_info;
	permanent = FALSE;
	description = "Povedlo se mi urovnat tu záležitost s Onarem.";
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
	AI_Output(other,self,"DIA_Lord_Hagen_OnarSuccs_15_00");	//Povedlo se mi urovnat tu záležitost s Onarem. Od teď nebude zasahovat do našeho podnikání ve věži.
	AI_Output(self,other,"DIA_Lord_Hagen_OnarSuccs_04_01");	//Zdá se, že váš diplomat není horší než jako voják či infiltrátor.
	AI_Output(self,other,"DIA_Lord_Hagen_OnarSuccs_04_02");	//Já se mezitím postaral o dokumenty. Nyní věž, nedaleké doly a les spadají oficiálně pod nás. Blahopřeji! 
	B_GiveInvItems(self,other,ItWr_HagenLoanDocs,1);
	AI_Output(self,other,"DIA_Lord_Hagen_OnarSuccs_04_03");	//Ještě zbývá zajistit správu pro tvé podnikání. Můžu ti už jen poradit, aby sis našel dobrého správce, který povede hospodářství v době tvé nepřítomnosti.
	AI_Output(self,other,"DIA_Lord_Hagen_OnarSuccs_04_04");	//Také se pokus najímat lidi, ruce ber z míst kterým důvěřuješ.
	AI_Output(other,self,"DIA_Lord_Hagen_OnarSuccs_15_05");	//Díky za radu. Mohu jít, teď?
	AI_Output(self,other,"DIA_Lord_Hagen_OnarSuccs_04_06");	//Můžeš. Ach, ano, ještě poslední věc. Vyhledám lorda Andreho a pošlu ti pár dobrovolníků na pomoc. Zbytek lidí si najdeš sám.
	AI_Output(other,self,"DIA_Lord_Hagen_OnarSuccs_15_07");	//Nemyslím si, že by domobrana ve věži potěšila Onara.
	AI_Output(self,other,"DIA_Lord_Hagen_OnarSuccs_04_08");	//Z tohohle důvodu, nezoufej. Jim budu muset nařídit změnu uniformy. Ujišťuji tě, že z nich odstraním poznamenání státem, ztratí odlišnosti od vesničanů a stanou se jedním z nich.
	MIS_MYNEWMANSION = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_MYNEWMANSION,LOG_SUCCESS);
	MIS_PPL_FOR_TOWER = LOG_Running;
	Log_CreateTopic(TOPIC_PPL_FOR_TOWER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PPL_FOR_TOWER,LOG_Running);
	B_LogEntry(TOPIC_PPL_FOR_TOWER,"Zdá se, že nyní v mém vlastnictví existuje značný prostor. Je zřejmé, že jsem dostal všechnu správu, což znamená, že musím mít lidi, kteří jsou připraveni se připojit do mého malého tábora. Možná bych měl začít zkoumat své nové majetky, a dávat pokyny k ochraně tábora. A pak začít hledat lidi. Najít dobrého správce - to je hned první!");
	B_LogEntry_Quiet(TOPIC_PPL_FOR_TOWER,"Lord Hagen mi přislíbil pár dobrovolníků na pomoc.");
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
	description = "Prohledal jsem důl vedle věže.";
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
	AI_Output(other,self,"DIA_Lord_Hagen_OreIsMined_15_00");	//Prohledal jsem důl vedle věže.
	AI_Output(self,other,"DIA_Lord_Hagen_OreIsMined_04_01");	//A? Co si o tom myslíš?
	AI_Output(other,self,"DIA_Lord_Hagen_OreIsMined_15_02");	//Tu a tam je ještě magická ruda. Podle předběžných odhadů jí tam je hodně!
	AI_Output(self,other,"DIA_Lord_Hagen_OreIsMined_04_04");	//Vynikající! Pak bych byl rád, aby byla dodávána paladinům do pevnosti vedle věže.
	AI_Output(self,other,"DIA_Lord_Hagen_OreIsMined_04_05");	//Oni se už postarají, aby se dostala do města.
	AI_Output(self,other,"DIA_Lord_Hagen_OreIsMined_04_06");	//Pro každou dodávku z dolu, jsem ochoten zaplatit sto zlatých. 
	AI_Output(self,other,"DIA_Lord_Hagen_OreIsMined_04_07");	//A mimochodem, když už mluvíme o těch dodávkách. Každá by měla obsahovat alespoň sto kusů toho cenného materiálu. Je to jasné?
	Info_ClearChoices(dia_lord_hagen_oreismined);
	Info_AddChoice(dia_lord_hagen_oreismined,"Vyjednáno!",dia_lord_hagen_oreismined_agree);

	if(RhetorikSkillValue[1] >= 50)
	{
		Info_AddChoice(dia_lord_hagen_oreismined,"... (Smlouvat)",dia_lord_hagen_oreismined_trade);
	};
};

func void dia_lord_hagen_oreismined_agree()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Lord_Hagen_OreIsMined_Agree_15_00");	//Vyjednáno!
	AI_Output(self,other,"DIA_Lord_Hagen_OreIsMined_Agree_04_01");	//Pak souhlasíme. Gratuluji, vykonal si úžasnou práci.
	AI_Output(self,other,"DIA_Lord_Hagen_OreIsMined_Agree_04_02");	//Budu se dívat a čekat na první dodávky.
	MIS_DTOLDNEWMINE = LOG_SUCCESS;
	SendHagenOre = TRUE;
	HagenOreBuy = 100;
	B_LogEntry(TOPIC_DTOLDNEWMINE,"Pro každou dodávku o počtu sta kusů magické rudy mi lord Hagen zaplatí sto zlatých.");
	Log_SetTopicStatus(TOPIC_DTOLDNEWMINE,LOG_SUCCESS);
	AI_StopProcessInfos(self);
};

func void dia_lord_hagen_oreismined_trade()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Lord_Hagen_OreIsMined_Trade_15_00");	//Stovku zlatých? Ale já nemám tábor na to abych prodělával!
	AI_Output(other,self,"DIA_Lord_Hagen_OreIsMined_Trade_15_01");	//Mysli na to, že musím zaplatit mzdy zaměstnancům, to co budou jíst, pít a za ochranu.
	AI_Output(other,self,"DIA_Lord_Hagen_OreIsMined_Trade_15_02");	//Musím platit obrovské nájemné Onarovi, protože to byl jediný způsob jak ho přesvědčit, aby mi vydal věž.
	AI_Output(other,self,"DIA_Lord_Hagen_OreIsMined_Trade_15_03");	//Stovka zlatých nestačí pro pokrytí všech těhlech nákladů.
	AI_Output(other,self,"DIA_Lord_Hagen_OreIsMined_Trade_15_04");	//A to nepočítám opravy, které jsem plně uhradil z mé kapsy.
	AI_Output(self,other,"DIA_Lord_Hagen_OreIsMined_Trade_04_02");	//Dobře, nebuď tak upovídaný. U každé dodávky rudy dostaneš dvě sta zlatých.

	if(RhetorikSkillValue[1] >= 75)
	{
		AI_Output(other,self,"DIA_Lord_Hagen_OreIsMined_Trade_15_10_EvenMore");	//Poslyš, děláš si snad ze mne blázny?!
		AI_Output(other,self,"DIA_Lord_Hagen_OreIsMined_Trade_15_11_EvenMore");	//Zřejmě úplně nerozumíš, co ti tady říkám!
		AI_Output(other,self,"DIA_Lord_Hagen_OreIsMined_Trade_15_12_EvenMore");	//Už teď jsem do toho podniku musel vrazit o několik tisíc zlatých více jen na ty nejnutnější opravy.
		AI_Output(other,self,"DIA_Lord_Hagen_OreIsMined_Trade_15_13_EvenMore");	//Polovinu z toho, co nabízíš, po mně Onar požaduje denně jako nájem.
		AI_Output(other,self,"DIA_Lord_Hagen_OreIsMined_Trade_15_14_EvenMore");	//Pak budu muset najmout alespoň tři nebo čtyři kopáče, správce, půl tuctu stráží, několik dalších řemeslníků...
		AI_Output(self,other,"DIA_Lord_Hagen_OreIsMined_Trade_04_11_EvenMore");	//Podívej...
		AI_Output(other,self,"DIA_Lord_Hagen_OreIsMined_Trade_15_15_EvenMore");	//Navíc všichni tito lidé taky chtějí třikrát denně něco jíst.
		AI_Output(other,self,"DIA_Lord_Hagen_OreIsMined_Trade_15_16_EvenMore");	//Za to, co nabízíš, jim mohu koupit akorát tak basu piva!
		AI_Output(other,self,"DIA_Lord_Hagen_OreIsMined_Trade_15_17_EvenMore");	//Nevypadá to zrovna, jako by byla těžba magické rudy pro krále nejvyšší prioritou.
		AI_Output(other,self,"DIA_Lord_Hagen_OreIsMined_Trade_15_18_EvenMore");	//Slyšel jsem, že prý ještě i v kolonii byla cennější, a tehdy se jí těžili desítky beden!
		AI_Output(other,self,"DIA_Lord_Hagen_OreIsMined_Trade_15_19_EvenMore");	//Pak bys ještě měl zvážit, že...
		AI_Output(self,other,"DIA_Lord_Hagen_OreIsMined_Trade_04_12_EvenMore");	//Buď už zticha! (přísně) Dám ti čtyři sta, to je moje poslední nabídka.
		AI_Output(self,other,"DIA_Lord_Hagen_OreIsMined_Trade_04_13_EvenMore");	//I kdybych chtěl, více zlata ti už prostě z královské pokladnice vydat nemůžu.
		AI_Output(self,other,"DIA_Lord_Hagen_OreIsMined_Trade_04_14_EvenMore");	//Doufám, že dodávky začnou v nejbližších dnech.
		AI_Output(other,self,"DIA_Lord_Hagen_OreIsMined_Trade_15_19_EvenMore");	//Radost s tebou obchodovat.
		AI_Output(self,other,"DIA_Lord_Hagen_OreIsMined_Trade_04_15_EvenMore");	//(pro sebe) Ó, Innosi, proč mě takhle zkoušíš...
		HagenOreBuy = 400;
		B_LogEntry(TOPIC_DTOLDNEWMINE,"Pro každou dodávku o počtu sta kusů magické rudy mi lord Hagen zaplatí čtyři sta zlatých.");
	}

	else
	{
		AI_Output(self,other,"DIA_Lord_Hagen_OreIsMined_Trade_04_03");	//A já doufám, že začnou v nejbližších dnech.
		HagenOreBuy = 200;
		B_LogEntry(TOPIC_DTOLDNEWMINE,"Pro každou dodávku o počtu sta kusů magické rudy mi lord Hagen zaplatí dvě stě zlatých.");
	};

	MIS_DTOLDNEWMINE = LOG_SUCCESS;
	SendHagenOre = TRUE;
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
	AI_Output(self,other,"DIA_Lord_Hagen_DarkWeb_01_00");	//(zarputile) Počkej... Mám pro tebe ještě jednu věc.
	AI_Output(other,self,"DIA_Lord_Hagen_DarkWeb_01_01");	//Co je to?
	AI_Output(self,other,"DIA_Lord_Hagen_DarkWeb_01_02");	//Hmm... Vraťme se k vraždě paladina Lothara.
	AI_Output(other,self,"DIA_Lord_Hagen_DarkWeb_01_03");	//Ale vždyť už jsme to vyřešily.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkWeb_01_04");	//Ano, víme že kovář ho nezabil! Ale kdo byl skutečný vrah jsme nezjistily.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkWeb_01_05");	//To je důvod proč ti chci zadat další práci - najdi toho parchanta, který nožem zezadu probodl Lothara! 
	AI_Output(other,self,"DIA_Lord_Hagen_DarkWeb_01_06");	//A vy jste nemohl tento úkol svěřit někomu jinému?
	AI_Output(self,other,"DIA_Lord_Hagen_DarkWeb_01_07");	//Proč? Již jsi prokázal že jsi schopen dojít daleko. A moji lidé mají zase jiné starosti.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkWeb_01_08");	//Kromě toho musíš pochopit, že je to taky otázka cti pro paladiny.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkWeb_01_09");	//Nemůžeme jen zavřit oči před tímto incidentem.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkWeb_01_10");	//Musíme najít toho vraha a veřejně ho potrestat za smrt našeho přítele a věrného služebníka Innose. 
	AI_Output(self,other,"DIA_Lord_Hagen_DarkWeb_01_11");	//Je to velmi důležité, pro mě i celý Řád! Odměna bude nemalá.
	Info_ClearChoices(DIA_Lord_Hagen_DarkWeb);
	Info_AddChoice(DIA_Lord_Hagen_DarkWeb,"Ne, radši se do toho všeho už nebudu míchat.",DIA_Lord_Hagen_DarkWeb_No);
	Info_AddChoice(DIA_Lord_Hagen_DarkWeb,"Dobře, pomůžu vám.",DIA_Lord_Hagen_DarkWeb_Yes);
};

func void DIA_Lord_Hagen_DarkWeb_No()
{
	AI_Output(other,self,"DIA_Lord_Hagen_DarkWeb_No_01_00");	//Ne, radši se do toho všeho už nebudu míchat.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkWeb_No_01_01");	//Pak se mi kliď z očí. A ať už tě nevidím.
	AI_StopProcessInfos(self);
};

func void DIA_Lord_Hagen_DarkWeb_Yes()
{
	AI_Output(other,self,"DIA_Lord_Hagen_DarkWeb_Yes_01_00");	//Dobře, pomůžu ti. Ale potřebuji více informací!
	AI_Output(self,other,"DIA_Lord_Hagen_DarkWeb_Yes_01_01");	//Řeknu vám všechno, co vím. 
	AI_Output(other,self,"DIA_Lord_Hagen_DarkWeb_Yes_01_02");	//Můžete začít.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkWeb_Yes_01_03");	//Hmmm... Nedlouho před vraždou, do města přijeli dva Onarovy žoldáci. 
	AI_Output(self,other,"DIA_Lord_Hagen_DarkWeb_Yes_01_04");	//Prý podle nich, přišli na nákup nářadí. A potom jsem jim přestal přikládat na důležitosti.
	AI_Output(other,self,"DIA_Lord_Hagen_DarkWeb_Yes_01_05");	//Jaké jsou jména?
	AI_Output(self,other,"DIA_Lord_Hagen_DarkWeb_Yes_01_06");	//Jeden byl kovář, Bennet. Neznám jméno druhého, když se mu nějak podařilo vyklouznout lordu Andremu.
	AI_Output(other,self,"DIA_Lord_Hagen_DarkWeb_Yes_01_07");	//Jasně. A co místo činu?
	AI_Output(self,other,"DIA_Lord_Hagen_DarkWeb_Yes_01_08");	//Zjistily jsme že Lotharovo tělo leží u jižní brány města.
	AI_Output(other,self,"DIA_Lord_Hagen_DarkWeb_Yes_01_09");	//Co tam dělal?
	AI_Output(self,other,"DIA_Lord_Hagen_DarkWeb_Yes_01_10");	//Obvykle, v těch momentech prováděl večerní prohlídky města. Zdá se, že tam narazil na vraha.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkWeb_Yes_01_11");	//Ale jsem z toho stejně v rozpacích. Na místě činu nebylo ani památky po boji!
	AI_Output(self,other,"DIA_Lord_Hagen_DarkWeb_Yes_01_12");	//Lothar byl nejlepší válečník ve svém oddílu, určitě by nepříteli kladl značný odpor.
	AI_Output(other,self,"DIA_Lord_Hagen_DarkWeb_Yes_01_13");	//Zajímalo by mě, kdo mohl zabít paladina, že není ani stopy po boji.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkWeb_Yes_01_14");	//Takže mě to zajímá. A ty budeš muset nají odpověď.
	AI_Output(other,self,"DIA_Lord_Hagen_DarkWeb_Yes_01_15");	//Dobře, půjdu se podívat co se dá dělat.
	MIS_DarkWeb = LOG_Running;
	Log_CreateTopic(TOPIC_DarkWeb,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DarkWeb,LOG_Running);
	B_LogEntry(TOPIC_DarkWeb,"Rozhodl jsem se pomoci lordu Hagenovi najít skutečného vraha paladina Lothara. Pravdivých informací o tomto případu je extrémně málo. Za prvé, byl jsem schopen přijít na to, že Lothar během vraždy dorazil do městských bran se dvěma žoldáky, z nichž jeden byl sám Bennet. Jmenovat druhého žoldáka lord Hagen nezná. Budeme se muset zeptat samotného Benneta. Navíc si myslím, že budu muset prozkoumat místo činu sám - v blízkosti hotelu, vedle jižní brány Khorinisu. Prý se tam nenašly ani stopy po boji. To vše je poněkud zvláštní, s ohledem na skutečnost, že oběť byla nejlepším válečníkem z oddílu.");
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
	description = "Chytil jsem vraha paladina Lothara.";
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
	AI_Output(other,self,"DIA_Lord_Hagen_DarkWeb_Done_01_00");	//Chytil jsem vraha paladina Lothara.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkWeb_Done_01_02");	//Kdo to byl?
	AI_Output(other,self,"DIA_Lord_Hagen_DarkWeb_Done_01_03");	//Jeden docela silný mág, který sloužil Beliarovy. Tady je jeho hlava.
	B_GiveInvItems(other,self,ItMi_Ituseld_Kopf,1);
	Npc_RemoveInvItems(self,ItMi_Ituseld_Kopf,1);
	AI_Output(self,other,"DIA_Lord_Hagen_DarkWeb_Done_01_04");	//Hmmm... (znechucený) Vím, jaký mág!
	AI_Output(other,self,"DIA_Lord_Hagen_DarkWeb_Done_01_05");	//Takže jste ho znal?
	AI_Output(self,other,"DIA_Lord_Hagen_DarkWeb_Done_01_06");	//Osobně ne. Ale tvář temných mágů poznám i se zavřenýma očima!
	AI_Output(self,other,"DIA_Lord_Hagen_DarkWeb_Done_01_07");	//Toto je mocný služebník Temného boha, ačkoli jeden z mála soupeřů, proti nimž jsem kdysi bojoval.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkWeb_Done_01_08");	//Pravdou je, že kdysi dávno během výpravy do Ir'Hirrat - jeden ze čtyř chrámů Beliara, který byl srovnán se zemí, jsem takových mágů potkal mnoho.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkWeb_Done_01_09");	//No, teď už aspoň vím, že Lothar neměl žádnou šanci uniknout naživu.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkWeb_Done_01_10");	//Pokud jde o tebe, odvedl jsi dobrou práci. K tomu dostaneš zvláštní ocenění.
	AI_Output(self,other,"DIA_Lord_Hagen_DarkWeb_Done_01_11");	//Stačí se rozhodnout, co bys chtěl dostat...
	MIS_DarkWeb = LOG_Success;
	Log_SetTopicStatus(TOPIC_DarkWeb,LOG_Success);
	B_LogEntry(TOPIC_DarkWeb,"Řekl jsem lordu Hagenovy, kdo byl Lotharovým vrahem. Jako důkaz jsem mu přinesl hlavu toho mága. Lord Hagen ocenil mou pomoc.");
	Info_ClearChoices(DIA_Lord_Hagen_DarkWeb_Done);
	Info_AddChoice(DIA_Lord_Hagen_DarkWeb_Done,"Meč 'Rhobarova vůle'",DIA_Lord_Hagen_DarkWeb_Done_Gift_00);
	Info_AddChoice(DIA_Lord_Hagen_DarkWeb_Done,"Helma paladina",DIA_Lord_Hagen_DarkWeb_Done_Gift_01);
	Info_AddChoice(DIA_Lord_Hagen_DarkWeb_Done,"Štít paladina",DIA_Lord_Hagen_DarkWeb_Done_Gift_02);
	Info_AddChoice(DIA_Lord_Hagen_DarkWeb_Done,"Recept na posvěcené šípy",DIA_Lord_Hagen_DarkWeb_Done_Gift_03);
	Info_AddChoice(DIA_Lord_Hagen_DarkWeb_Done,"Runa 'Svatý šíp'",DIA_Lord_Hagen_DarkWeb_Done_Gift_04);
	Info_AddChoice(DIA_Lord_Hagen_DarkWeb_Done,"5000 zlatých",DIA_Lord_Hagen_DarkWeb_Done_Gift_05);
};

func void DIA_Lord_Hagen_DarkWeb_Done_Gift_00()
{
	B_GiveInvItems(self,other,ITMW_2H_KMR_RHOBAR_01,1);
	AI_Output(self,other,"DIA_Lord_Hagen_DarkWeb_Done_Gift_01_00");	//Dobrá volba.
	AI_StopProcessInfos(self);
};

func void DIA_Lord_Hagen_DarkWeb_Done_Gift_01()
{
	B_GiveInvItems(self,other,ItAr_Pal_Helm,1);
	AI_Output(self,other,"DIA_Lord_Hagen_DarkWeb_Done_Gift_01_00");	//Dobrá volba.
	AI_StopProcessInfos(self);
};

func void DIA_Lord_Hagen_DarkWeb_Done_Gift_02()
{
	B_GiveInvItems(self,other,ItAr_Shield_07,1);
	AI_Output(self,other,"DIA_Lord_Hagen_DarkWeb_Done_Gift_01_00");	//Dobrá volba.
	AI_StopProcessInfos(self);
};

func void DIA_Lord_Hagen_DarkWeb_Done_Gift_03()
{
	B_GiveInvItems(self,other,ItWr_HolyArrows,1);
	AI_Output(self,other,"DIA_Lord_Hagen_DarkWeb_Done_Gift_01_00");	//Dobrá volba.
	AI_StopProcessInfos(self);
};

func void DIA_Lord_Hagen_DarkWeb_Done_Gift_04()
{
	B_GiveInvItems(self,other,ItRu_PalHolyBolt,1);
	AI_Output(self,other,"DIA_Lord_Hagen_DarkWeb_Done_Gift_01_00");	//Dobrá volba.
	HagenGift = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_Lord_Hagen_DarkWeb_Done_Gift_05()
{
	B_GiveInvItems(self,other,ItMi_Gold,5000);
	AI_Output(self,other,"DIA_Lord_Hagen_DarkWeb_Done_Gift_01_00");	//Dobrá volba.
	AI_StopProcessInfos(self);
};