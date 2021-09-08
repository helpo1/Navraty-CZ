/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.01:

(4x) MIS_ORcGREATWAR - MIS_ORCGREATWAR (cyrilice -> latinka)

*/



instance DIA_garond_EXIT(C_Info)
{
	npc = PAL_250_Garond;
	nr = 999;
	condition = DIA_Garond_EXIT_Condition;
	information = DIA_Garond_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Garond_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Garond_EXIT_Info()
{
	if((MIS_ScoutMine == LOG_Running) && (KAPITELORCATC == FALSE) && (MIS_LostPaladins == FALSE))
	{
		AI_Output(self,other,"DIA_Garond_SeekPaladin_01_00");	//Počkej...
		AI_Output(self,other,"DIA_Garond_SeekPaladin_01_01");	//Je tady jeden problém, se kterým bys mi mohl pomoct.
		AI_Output(other,self,"DIA_Garond_SeekPaladin_01_02");	//O co jde?
		AI_Output(self,other,"DIA_Garond_SeekPaladin_01_03");	//Když jsme se vydali na hrad, rozdělili jsme se do tří skupin, abychom u skřetů nepřitahovali moc pozornosti.
		AI_Output(self,other,"DIA_Garond_SeekPaladin_01_04");	//První skupinu jsem vedl já. Ostatní dvě paladinové Albert a Wenzel.
		AI_Output(self,other,"DIA_Garond_SeekPaladin_01_05");	//Ale od té doby jsem o nich neslyšel. Nevím, jestli jsou vůbec naživu!
		AI_Output(self,other,"DIA_Garond_SeekPaladin_01_06");	//Proto bych byl rád, kdybys zjistil, co s nimi je.
		AI_Output(other,self,"DIA_Garond_SeekPaladin_01_07");	//V pořádku. Udělám, co můžu.
		AI_Output(self,other,"DIA_Garond_SeekPaladin_01_08");	//Budu očekávat tvůj návrat.
		MIS_LostPaladins = LOG_Running;
		Log_CreateTopic(TOPIC_LostPaladins,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_LostPaladins,LOG_Running);
		B_LogEntry(TOPIC_LostPaladins,"Garond mě požádal, abych zjistil, co se stalo se skupinami, kterým veleli Albert a Wenzel.");
	};

	AI_StopProcessInfos(self);
};

var int Garond_LastPetzCounter;
var int Garond_LastPetzCrime;

instance DIA_Garond_PMSchulden(C_Info)
{
	npc = PAL_250_Garond;
	nr = 1;
	condition = DIA_Garond_PMSchulden_Condition;
	information = DIA_Garond_PMSchulden_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Garond_PMSchulden_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Garond_Schulden > 0) && (B_GetGreatestPetzCrime(self) <= Garond_LastPetzCrime) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void dia_garond_petzmaster_attackmurder()
{
	var string concatText;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_HumanMurderedHuman,0);
	GLOBAL_MAKE_BANDIT_FORCITY = 1;
	GARONDTROUBLE = TRUE;
	concatText = "Paladinové tě označili za psance!";
	AI_Print(concatText);
};

func void dia_garond_pmschulden_attackmurder()
{
	var string concatText;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_HumanMurderedHuman,0);
	GLOBAL_MAKE_BANDIT_FORCITY = 1;
	GARONDTROUBLE = TRUE;
	concatText = "Paladinové tě označili za psance!";
	AI_Print(concatText);
};

func void DIA_Garond_PMSchulden_Info()
{
	var int diff;
	var string concatText1;
	var string concatText2;
	var string concattextschulden;
	var string tsettext1;
	var string tsettext2;
	var string tsettext3;
	var int temp1;
	AI_Output(self,other,"DIA_Garond_PMSchulden_10_00");	//Nemáme se o čem bavit, dokud nezaplatíš pokutu.
	temp1 = 0;
	if(GLOBAL_OLDCAMP_MURDER > 2)
	{
		temp1 = 1;
	};
	if(GLOBAL_OLDCAMP_THEFT > 10)
	{
		temp1 = 1;
	};
	if(GLOBAL_OLDCAMP_ATTACK > 5)
	{
		temp1 = 1;
	};
	if(temp1 == 1)
	{
		if(GLOBAL_OLDCAMP_MURDER > 2)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_OLDCAMP_MURDER),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_MURDERCOUNT2_OLDCAMP);
			tsettext3 = ConcatStrings(PRINT_MURDERCOUNT_OLDCAMP,tsettext2);
			AI_Output(self,other,"DIA_Garond_PMSchulden_08_36");	//Ale když se podívám na tvé nedávné chování...
			AI_Output(self,other,"DIA_Garond_PMSchulden_08_37");	//Jsi vrah! A má svatá povinnost je zbavit svět takových, jako jsi ty!
			AI_Output(self,other,"DIA_Garond_PMSchulden_08_38");	//A věř mi, že tuhle povinnost k lidem a Innosovi splním, ať to stojí, co to stojí!
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other,"DIA_Garond_PMSchulden_08_39");	//Zemři!
		}
		else if(GLOBAL_OLDCAMP_ATTACK > 5)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_OLDCAMP_ATTACK),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_ATTACKCOUNT2_OLDCAMP);
			tsettext3 = ConcatStrings(PRINT_ATTACKCOUNT_OLDCAMP,tsettext2);
			AI_Output(self,other,"DIA_Garond_PMSchulden_08_40");	//Ale když se podívám na tvé nedávné chování...
			AI_Output(self,other,"DIA_Garond_PMSchulden_08_41");	//Jsi bandita a rváč! A má svatá povinnost je zbavit svět takových, jako jsi ty!
			AI_Output(self,other,"DIA_Garond_PMSchulden_08_42");	//A věř mi, že tuhle povinnost k lidem a Innosovi splním, ať to stojí, co to stojí!
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other,"DIA_Garond_PMSchulden_08_43");	//Zemři!
		}
		else if(GLOBAL_OLDCAMP_THEFT > 10)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_OLDCAMP_THEFT),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_THEFTCOUNT2_OLDCAMP);
			tsettext3 = ConcatStrings(PRINT_THEFTCOUNT_OLDCAMP,tsettext2);
			AI_Output(self,other,"DIA_Garond_PMSchulden_08_44");	//Ale když se podívám na tvé nedávné chování...
			AI_Output(self,other,"DIA_Garond_PMSchulden_08_45");	//Jsi zloděj! A má svatá povinnost je zbavit svět takových, jako jsi ty!
			AI_Output(self,other,"DIA_Garond_PMSchulden_08_46");	//A věř mi, že tuhle povinnost k lidem a Innosovi splním, ať to stojí, co to stojí!
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other,"DIA_Garond_PMSchulden_08_47");	//Zemři!
		};
		Log_CreateTopic(TOPIC_DIPLOM,LOG_NOTE);
		B_LogEntry(TOPIC_DIPLOM,"Moje vztahy s paladiny jsou kvůli mým neustálým výstřelkům na hradě na bodu mrazu. Teď mě považují za psance - a to i ve městě!");
		Info_ClearChoices(DIA_Garond_PMSchulden);
		Info_ClearChoices(DIA_Garond_PETZMASTER);
		Info_AddChoice(DIA_Garond_PMSchulden,"Počkej... (utéct)",dia_garond_pmschulden_attackmurder);
	}
	else
	{
		if(B_GetTotalPetzCounter(self) > Garond_LastPetzCounter)
		{
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_01");	//A ta podle posledních obvinění dokonce ještě vzrostla.
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_02");	//Zase ses dostal do dalších potíží.
			diff = B_GetTotalPetzCounter(self) - Garond_LastPetzCounter;
			if(diff > 0)
			{
				Garond_Schulden = Garond_Schulden + (diff * 250);
			};
			if(Garond_Schulden < 1000)
			{
				AI_Output(self,other,"DIA_Garond_PMSchulden_10_03");	//Ale doufám, že teď už konečně tu pokutu zaplatíš. Celkem...
				AI_Output(other,self,"DIA_Garond_PMSchulden_10_03A");	//Kolik?
				if(Garond_Schulden <= 1000)
				{
					B_Say_Gold(self,other,Garond_Schulden);
				}
				else
				{
					concatText1 = ConcatStrings(IntToString(Garond_Schulden),"");
					concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
					concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
					AI_Print(concattextschulden);
				};
			}
			else
			{
				AI_Output(self,other,"DIA_Garond_PMSchulden_10_04");	//Zklamal jsi mě. Ta pokuta je celkem...
				AI_Output(other,self,"DIA_Garond_PMSchulden_10_04A");	//Kolik?
				if(Garond_Schulden <= 1000)
				{
					B_Say_Gold(self,other,Garond_Schulden);
				}
				else
				{
					concatText1 = ConcatStrings(IntToString(Garond_Schulden),"");
					concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
					concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
					AI_Print(concattextschulden);
				};
			};
		}
		else if(B_GetGreatestPetzCrime(self) < Garond_LastPetzCrime)
		{
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_05");	//Zaslechl jsem nějaké novinky.
			if(Garond_LastPetzCrime == CRIME_MURDER)
			{
				AI_Output(self,other,"DIA_Garond_PMSchulden_10_06");	//Najednou tě už nikdo neobviňuje z vraždy.
				GLOBAL_OLDCAMP_MURDER = GLOBAL_OLDCAMP_MURDER - 1;
				if(GLOBAL_OLDCAMP_MURDER < 0)
				{
					GLOBAL_OLDCAMP_MURDER = 0;
				};
			};
			if((Garond_LastPetzCrime == CRIME_THEFT) || ((Garond_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT)))
			{
				AI_Output(self,other,"DIA_Garond_PMSchulden_10_07");	//Nikdo si nepamatuje, že bys byl zloděj.
				GLOBAL_OLDCAMP_THEFT = GLOBAL_OLDCAMP_THEFT - 1;
				if(GLOBAL_OLDCAMP_THEFT < 0)
				{
					GLOBAL_OLDCAMP_THEFT = 0;
				};
			};
			if((Garond_LastPetzCrime == CRIME_ATTACK) || ((Garond_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK)))
			{
				AI_Output(self,other,"DIA_Garond_PMSchulden_10_08");	//Už není nikdo, kdo by tvrdil, že tě viděl zapleteného do nějaké rvačky.
				GLOBAL_OLDCAMP_ATTACK = GLOBAL_OLDCAMP_ATTACK - 1;
				if(GLOBAL_OLDCAMP_ATTACK < 0)
				{
					GLOBAL_OLDCAMP_ATTACK = 0;
				};
			};
			if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
			{
				AI_Output(self,other,"DIA_Garond_PMSchulden_10_09");	//Vypadá to, že svědci svá obvinění stáhli.
			};
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_10");	//Nevím, co se stalo, ale varuji tě! Už to nezkoušej!
			if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
			{
				AI_Output(self,other,"DIA_Garond_PMSchulden_10_11");	//Rozhodl jsem se odpustit ti tvé pokuty.
				AI_Output(self,other,"DIA_Garond_PMSchulden_10_12");	//Ale nedělej už tady na hradě problémy!
				Garond_Schulden = 0;
				Garond_LastPetzCounter = 0;
				Garond_LastPetzCrime = CRIME_NONE;
			}
			else
			{
				AI_Output(self,other,"DIA_Garond_PMSchulden_10_13");	//Abychom si to vyjasnili: pokutu budeš muset zaplatit tak jako tak.
				if(Garond_Schulden <= 1000)
				{
					B_Say_Gold(self,other,Garond_Schulden);
				}
				else
				{
					concatText1 = ConcatStrings(IntToString(Garond_Schulden),"");
					concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
					concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
					AI_Print(concattextschulden);
				};
				AI_Output(self,other,"DIA_Garond_PMSchulden_10_14");	//Takže jak to vyřešíme?
			};
		};
		if(B_GetGreatestPetzCrime(self) != CRIME_NONE)
		{
			Info_ClearChoices(DIA_Garond_PMSchulden);
			Info_ClearChoices(DIA_Garond_PETZMASTER);
			Info_AddChoice(DIA_Garond_PMSchulden,"Nemám tolik zlata!",DIA_Garond_PETZMASTER_PayLater);
			Info_AddChoice(DIA_Garond_PMSchulden,"Kolik mám zaplatit?",DIA_Garond_PMSchulden_HowMuchAgain);
			if(Npc_HasItems(other,ItMi_Gold) >= Garond_Schulden)
			{
				Info_AddChoice(DIA_Garond_PMSchulden,"Zaplatím.",DIA_Garond_PETZMASTER_PayNow);
			};
		};
	};
};

func void DIA_Garond_PMSchulden_HowMuchAgain()
{
	var string concatText1;
	var string concatText2;
	var string concattextschulden;
	AI_Output(other,self,"DIA_Garond_PMSchulden_HowMuchAgain_15_00");	//Kolik mám zaplatit?
	if(Garond_Schulden <= 1000)
	{
		B_Say_Gold(self,other,Garond_Schulden);
	}
	else
	{
		concatText1 = ConcatStrings(IntToString(Garond_Schulden),"");
		concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
		concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
		AI_Print(concattextschulden);
	};
	Info_ClearChoices(DIA_Garond_PMSchulden);
	Info_ClearChoices(DIA_Garond_PETZMASTER);
	Info_AddChoice(DIA_Garond_PMSchulden,"Nemám dost zlata!",DIA_Garond_PETZMASTER_PayLater);
	Info_AddChoice(DIA_Garond_PMSchulden,"Kolik mám zaplatit?",DIA_Garond_PMSchulden_HowMuchAgain);
	if(Npc_HasItems(other,ItMi_Gold) >= Garond_Schulden)
	{
		Info_AddChoice(DIA_Garond_PMSchulden,"Zaplatím.",DIA_Garond_PETZMASTER_PayNow);
	};
};


instance DIA_Garond_PETZMASTER(C_Info)
{
	npc = PAL_250_Garond;
	nr = 1;
	condition = DIA_Garond_PETZMASTER_Condition;
	information = DIA_Garond_PETZMASTER_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Garond_PETZMASTER_Condition()
{
	if((B_GetGreatestPetzCrime(self) > Garond_LastPetzCrime) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Garond_PETZMASTER_Info()
{
	var string concatText1;
	var string concatText2;
	var string concattextschulden;
	var string tsettext1;
	var string tsettext2;
	var string tsettext3;
	var int temp1;
	Garond_Schulden = 0;
	if(self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_00");	//Takže ty jsi ten chlápek, který nám tu na hradě dělá problémy.
	};
	temp1 = 0;
	if(GLOBAL_OLDCAMP_MURDER > 2)
	{
		temp1 = 1;
	};
	if(GLOBAL_OLDCAMP_THEFT > 10)
	{
		temp1 = 1;
	};
	if(GLOBAL_OLDCAMP_ATTACK > 5)
	{
		temp1 = 1;
	};
	if(temp1 == 1)
	{
		if(GLOBAL_OLDCAMP_MURDER > 2)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_OLDCAMP_MURDER),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_MURDERCOUNT2_OLDCAMP);
			tsettext3 = ConcatStrings(PRINT_MURDERCOUNT_OLDCAMP,tsettext2);
			AI_Output(self,other,"DIA_Garond_PETZMASTER_08_48");	//Ale když se podívám na tvé nedávné chování...
			AI_Output(self,other,"DIA_Garond_PETZMASTER_08_49");	//Pro krvežíznivé bastardy jako jsi ty mezi námi není místo - a proto tě světská spravedlnost bude soudit ještě před tou nebeskou.
			AI_Output(self,other,"DIA_Garond_PETZMASTER_08_50");	//A věř mi, že tuhle povinnost k lidem a Innosovi splním, ať to stojí, co to stojí!
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other,"DIA_Garond_PETZMASTER_08_51");	//Zemři!
		}
		else if(GLOBAL_OLDCAMP_ATTACK > 5)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_OLDCAMP_ATTACK),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_ATTACKCOUNT2_OLDCAMP);
			tsettext3 = ConcatStrings(PRINT_ATTACKCOUNT_OLDCAMP,tsettext2);
			AI_Output(self,other,"DIA_Garond_PETZMASTER_08_52");	//Ale když se podívám na tvé nedávné chování...
			AI_Output(self,other,"DIA_Garond_PETZMASTER_08_53");	//Jsi bandita a rváč! A má svatá povinnost je zbavit svět takových, jako jsi ty!
			AI_Output(self,other,"DIA_Garond_PETZMASTER_08_54");	//A věř mi, že tuhle povinnost k lidem a Innosovi splním, ať to stojí, co to stojí!
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other,"DIA_Garond_PETZMASTER_08_55");	//Zemři!
		}
		else if(GLOBAL_OLDCAMP_THEFT > 10)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_OLDCAMP_THEFT),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_THEFTCOUNT2_OLDCAMP);
			tsettext3 = ConcatStrings(PRINT_THEFTCOUNT_OLDCAMP,tsettext2);
			AI_Output(self,other,"DIA_Garond_PETZMASTER_08_56");	//Ale když se podívám na tvé nedávné chování...
			AI_Output(self,other,"DIA_Garond_PETZMASTER_08_57");	//Jsi zloděj! A má svatá povinnost je zbavit svět takových, jako jsi ty!
			AI_Output(self,other,"DIA_Garond_PETZMASTER_08_58");	//A věř mi, že tuhle povinnost k lidem a Innosovi splním, ať to stojí, co to stojí!
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other,"DIA_Garond_PETZMASTER_08_59");	//Zemři!
		};
		Log_CreateTopic(TOPIC_DIPLOM,LOG_NOTE);
		B_LogEntry(TOPIC_DIPLOM,"Moje vztahy s paladiny jsou kvůli mým neustálým výstřelkům na hradě na bodu mrazu. Teď mě považují za psance - a to i ve městě!");
		Info_ClearChoices(DIA_Garond_PMSchulden);
		Info_ClearChoices(DIA_Garond_PETZMASTER);
		Info_AddChoice(DIA_Garond_PETZMASTER,"Počkej! (utéct)",dia_garond_petzmaster_attackmurder);
	}
	else
	{
		if(B_GetGreatestPetzCrime(self) == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_Garond_PETZMASTER_10_01");	//Sám sebe jsem se ptal, jak dlouho bude trvat, než za mnou přijdeš.
			AI_Output(self,other,"DIA_Garond_PETZMASTER_10_02");	//Vražda je to poslední, co tady potřebujeme.
			AI_Output(self,other,"DIA_Garond_PETZMASTER_10_03");	//Jsem odpovědný za každého svého muže - a teď mám zase o jednoho méně!
			Garond_Schulden = B_GetTotalPetzCounter(self) * 1500;
			if((PETZCOUNTER_City_Theft + PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
			{
				AI_Output(self,other,"DIA_Garond_PETZMASTER_10_04");	//Nemluvě o dalších věcech, cos udělal.
			};
			AI_Output(self,other,"DIA_Garond_PETZMASTER_10_05");	//Dovol mi něco ti vysvětlit. Jsme tu všichni ve stejné pasti.
			AI_Output(self,other,"DIA_Garond_PETZMASTER_10_06");	//A já jsem odpovědný za každého muže - včetně tebe.
			AI_Output(self,other,"DIA_Garond_PETZMASTER_10_07");	//Pokud potřebuješ někoho zabít, vylez před bránu a vybij se na skřetech! Je jich tam dost.
			AI_Output(self,other,"DIA_Garond_PETZMASTER_10_08");	//Dám ti pokutu a ty už nezkoušej tyhle blbosti!
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_THEFT)
		{
			AI_Output(self,other,"DIA_Garond_PETZMASTER_10_09");	//Slyšel jsem, že jsi kradl?
			if((PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
			{
				AI_Output(self,other,"DIA_Garond_PETZMASTER_10_10");	//Nemluvě o těch ostatních věcech, cos udělal...
			};
			AI_Output(self,other,"DIA_Garond_PETZMASTER_10_11");	//Nemůžu ti to dovolit. Zdá se, že podceňuješ vážnost situace.
			AI_Output(self,other,"DIA_Garond_PETZMASTER_10_12");	//Zaplatíš pokutu jako kompenzaci za tvé činy!
			Garond_Schulden = B_GetTotalPetzCounter(self) * 500;
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
		{
			AI_Output(self,other,"DIA_Garond_PETZMASTER_10_13");	//Nerad vidím rvačky mezi mými lidmi.
			if(PETZCOUNTER_City_Sheepkiller > 0)
			{
				AI_Output(self,other,"DIA_Garond_PETZMASTER_10_14");	//A ta věc s ovcemi ti taky zrovna nedělá čest.
			};
			AI_Output(self,other,"DIA_Garond_PETZMASTER_10_15");	//Budeš muset zaplatit pokutu!
			Garond_Schulden = B_GetTotalPetzCounter(self) * 750;
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER)
		{
			AI_Output(self,other,"DIA_Garond_PETZMASTER_10_16");	//Ty zabíjíš naše ovce? Patří přece nám všem.
			AI_Output(self,other,"DIA_Garond_PETZMASTER_10_17");	//Pak zaplatíš za jejich maso.
			Garond_Schulden = 250;
		};
		AI_Output(other,self,"DIA_Garond_PETZMASTER_15_18");	//Kolik?
		if(Garond_Schulden <= 1000)
		{
			B_Say_Gold(self,other,Garond_Schulden);
		}
		else
		{
			concatText1 = ConcatStrings(IntToString(Garond_Schulden),"");
			concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
			concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
			AI_Print(concattextschulden);
		};
		Info_ClearChoices(DIA_Garond_PMSchulden);
		Info_ClearChoices(DIA_Garond_PETZMASTER);
		Info_AddChoice(DIA_Garond_PETZMASTER,"Nemám tolik zlata!",DIA_Garond_PETZMASTER_PayLater);
		if(Npc_HasItems(other,ItMi_Gold) >= Garond_Schulden)
		{
			Info_AddChoice(DIA_Garond_PETZMASTER,"Zaplatím.",DIA_Garond_PETZMASTER_PayNow);
		};
	};
};

func void DIA_Garond_PETZMASTER_PayNow()
{
	AI_Output(other,self,"DIA_Garond_PETZMASTER_PayNow_15_00");	//Zaplatím!
	B_GiveInvItems(other,self,ItMi_Gold,Garond_Schulden);
	AI_Output(self,other,"DIA_Garond_PETZMASTER_PayNow_10_01");	//Dobrá, řeknu to chlapům, aby se uklidnili. Ale ať se to už neopakuje!
	B_GrantAbsolution(LOC_OLDCAMP);
	Garond_Schulden = 0;
	Garond_LastPetzCounter = 0;
	Garond_LastPetzCrime = CRIME_NONE;
	Info_ClearChoices(DIA_Garond_PETZMASTER);
	Info_ClearChoices(DIA_Garond_PMSchulden);
};

func void DIA_Garond_PETZMASTER_PayLater()
{
	AI_Output(other,self,"DIA_Garond_PETZMASTER_PayLater_15_00");	//Nemám dost zlata!
	AI_Output(self,other,"DIA_Garond_PETZMASTER_PayLater_10_01");	//Tak si ho co nejrychleji sežeň.
	AI_Output(self,other,"DIA_Garond_PETZMASTER_PayLater_10_02");	//A varuji tě - pokud nepřestaneš dělat tyhle hlouposti, pokuta ještě poroste!
	Garond_LastPetzCounter = B_GetTotalPetzCounter(self);
	Garond_LastPetzCrime = B_GetGreatestPetzCrime(self);
	AI_StopProcessInfos(self);
};


instance DIA_Garond_Hello(C_Info)
{
	npc = PAL_250_Garond;
	nr = 4;
	condition = DIA_Garond_Hello_Condition;
	information = DIA_Garond_Hello_Info;
	important = TRUE;
	permanent = FALSE;
};


func int DIA_Garond_Hello_Condition()
{
	if((Kapitel == 2) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Garond_Hello_Info()
{
	AI_Output(self,other,"DIA_Garond_Hello_10_00");	//Odkud jsi přišel? Nejsi nikdo z trestanců ani nikdo z mých lidí. Kdo jsi?
	AI_Output(other,self,"DIA_Garond_Hello_15_01");	//Prošel jsem průsmykem.
	AI_Output(self,other,"DIA_Garond_Hello_10_02");	//Průsmykem? Takže to někdo dokázal... U Innose!
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Garond_Hello_10_03");	//Proč jsi vážil tuto cestu, mágu?
	}
	else if(hero.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Garond_Hello_10_04");	//Jaké jsou tvé rozkazy, vojáku?
	}
	else if(hero.guild == GIL_SLD)
	{
		AI_Output(self,other,"DIA_Garond_Hello_10_05");	//Přemýšlím, proč by chtěl žoldák něco takového. Co tady děláš?
	}
	else if(hero.guild == GIL_KDW)
	{
		AI_Output(self,other,"DIA_Garond_Hello_10_06");	//Co tady pohledává úctyhodný mág Vody?
	}
	else if(hero.guild == GIL_KDM)
	{
		AI_Output(self,other,"DIA_Garond_Hello_10_07");	//A jaká síla tu přitáhla nekromanta?
	}
	else if(hero.guild == GIL_SEK)
	{
		AI_Output(self,other,"DIA_Garond_Hello_10_08");	//Podobáš se chlápkům z té sekty, která sídlila v bažinách. Co tady chceš?
	}
	else
	{
		AI_Output(self,other,"DIA_Garond_Hello_10_09");	//Co tady děláš?
	};
};

instance DIA_Garond_NeedProof(C_Info)
{
	npc = PAL_250_Garond;
	nr = 1;
	condition = DIA_Garond_NeedProof_Condition;
	information = DIA_Garond_NeedProof_Info;
	description = "Přicházím od lorda Hagena.";
};


func int DIA_Garond_NeedProof_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Garond_Hello) && (MIS_OLDWORLD == LOG_Running) && (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_Garond_NeedProof_Info()
{
	AI_Output(other,self,"DIA_Garond_NeedProof_15_00");	//Přicházím od lorda Hagena. Chce, abych mu přinesl důkaz o přítomnosti draků.
	AI_Output(self,other,"DIA_Garond_NeedProof_10_01");	//A to jsi přišel jen proto, abys ho sebral a zase zmizel?
	AI_Output(other,self,"DIA_Garond_NeedProof_15_02");	//Přesně to jsem měl v plánu.
	AI_Output(self,other,"DIA_Garond_NeedProof_10_03");	//Takže on chce důkaz? Má ho mít. Ale nemůžu tě poslat zpátky za lordem Hagenem, aniž bych mu řekl o rudě.
	AI_Output(self,other,"DIA_Garond_NeedProof_10_04");	//Poslouchej - lord Hagen se musí bezpodmínečně dozvědět o zdejší situaci a o tom, kolik rudy se nám podařilo vydolovat.
	AI_Output(other,self,"DIA_Garond_NeedProof_15_05");	//Dobrá, co chceš, abych pro tebe udělal?
	AI_Output(self,other,"DIA_Garond_NeedProof_10_06");	//Vyslal jsem tři skupinky kopáčů, ale nedorazil ani nuget.
	AI_Output(self,other,"DIA_Garond_NeedProof_10_07");	//Obejdi všechny doly a nahlas mi, kolik rudy už vytěžili.
	AI_Output(self,other,"DIA_Garond_NeedProof_10_08");	//Pak ti napíšu dopis, který doneseš zpátky lordu Hagenovi.
	AI_Output(other,self,"DIA_Garond_NeedProof_15_09");	//Dobrá. Zdá se, že nemám na výběr.
	if(((hero.guild == GIL_GUR) || (hero.guild == GIL_TPL)) && (MIS_PALADINWATCH == LOG_Running) && (IDOLORANQUESTIONTWO == FALSE))
	{
		IDOLORANQUESTIONTWO = TRUE;
		B_LogEntry(TOPIC_PALADINWATCH,"Zdá se, že hlavní příčinou příchodu paladinů na ostrov je magická ruda. Bez dostatečného množství rudy nebude král mít šanci proti skřetům. Posádka, která přišla do Hornického údolí, má za úkol objasnit situaci ohledně možnosti těžby tady na ostrově. Poté se zřejmě plánují vrátit zpátky na kontinent.");
	};
	if(((hero.guild == GIL_GUR) || (hero.guild == GIL_TPL)) && (MIS_PALADINWATCH == LOG_Running) && (IDOLORANQUESTIONTHREE == FALSE))
	{
		IDOLORANQUESTIONTHREE = TRUE;
		B_LogEntry(TOPIC_PALADINWATCH,"Skupina paladinů, kterou lord Hagen poslal do údolí se opevnila na starém hradě rudobaronů. Nejsou na tom dobře. Podle Garonda pořád nemají zprávy o rudě a navíc skřeti rozbili kolem hradu ležení. Na optimismu jim určitě nepřidávají ani nedávné útoky draků.");
	};
	MIS_ScoutMine = LOG_Running;
	B_StartOtherRoutine(Jergan,"FAJETH");
	B_LogEntry(Topic_MISOLDWORLD,"Než mi Garond dá důkazy, chce, abych našel jeho tři jednotky, které poslal těžit rudu, a řekl mu, kolik rudy vytěžili.");
	Log_CreateTopic(TOPIC_ScoutMine,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ScoutMine,LOG_Running);
	B_LogEntry_Quiet(TOPIC_ScoutMine,"Velitel Garond mi dal za úkol najít tři skupiny kopáčů, kteří šli těžit rudu. Zatím o nich nebyly žádné zprávy.");
	B_LogEntry_Quiet(TOPIC_ScoutMine,"Mám najít ty kopáče a zjistit, kolik rudy mají.");
};

instance DIA_Garond_WhyNot(C_Info)
{
	npc = PAL_250_Garond;
	nr = 1;
	condition = DIA_Garond_WhyNot_Condition;
	information = DIA_Garond_WhyNot_Info;
	description = "Proč jsi neposlal lidi do ostatních dolů?";
};

func int DIA_Garond_WhyNot_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Garond_NeedProof) == TRUE) && (Kapitel <= 5))
	{
		return TRUE;
	};
};

func void DIA_Garond_WhyNot_Info()
{
	AI_Output(other,self,"DIA_Garond_WhyNot_01_00");	//Proč jsi neposlal lidi do Starého dolu?
	AI_Output(self,other,"DIA_Garond_WhyNot_01_01");	//(vážně) Pokud je mi známo, Starý důl byl zasypán.
	AI_Output(self,other,"DIA_Garond_WhyNot_01_02");	//Je nepravděpodobné, že bychom tam mohli úspěšně těžit.
	AI_Output(self,other,"DIA_Garond_WhyNot_01_03");	//A navíc tam teď určitě bude i plno nemrtvých.
	AI_Output(self,other,"DIA_Garond_WhyNot_01_04");	//A já nebudu posílat své lidi na jistou smrt! Už i tak jich mám málo...
	AI_Output(other,self,"DIA_Garond_WhyNot_01_05");	//Existuje taky důl v Novém táboře.
	AI_Output(self,other,"DIA_Garond_WhyNot_01_06");	//Důl v Novém táboře? Nějaký další?
	AI_Output(other,self,"DIA_Garond_WhyNot_01_07");	//Tys o něm nevěděl?
	AI_Output(self,other,"DIA_Garond_WhyNot_01_08");	//Myslím, že jeden z trestanců říkal něco podobného, ale nevěnoval jsem mu moc pozornosti.
	AI_Output(other,self,"DIA_Garond_WhyNot_01_09");	//Mágové Vody tam těžili magickou rudu pro své experimenty.
	AI_Output(self,other,"DIA_Garond_WhyNot_01_10");	//Pokud ano... (zamyšleně) Měli bychom to prověřit.
	AI_Output(self,other,"DIA_Garond_WhyNot_01_11");	//Udělej to! Zjisti, v jakém stavu se důl nachází a jestli se tam dá těžit.
	MIS_ScoutNewMine = LOG_Running;
	Log_CreateTopic(TOPIC_ScoutNewMine,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ScoutNewMine,LOG_Running);
	B_LogEntry(TOPIC_ScoutNewMine,"Garond byl překvapen zprávou o dolu v Novém táboře. Mám zjistit, jaká je v dolu situace.");
};

var int SFRM_01;
var int SFRM_02;

instance DIA_Garond_ScoutNewMine(C_Info)
{
	npc = PAL_250_Garond;
	nr = 1;
	condition = DIA_Garond_ScoutNewMine_Condition;
	information = DIA_Garond_ScoutNewMine_Info;
	permanent = TRUE;
	description = "Ohledně dolu v Novém táboře...";
};

func int DIA_Garond_ScoutNewMine_Condition()
{
	if((MIS_ScoutNewMine == LOG_Running) && ((ScoutFreeMine == TRUE) || (ScoutFreeLager == TRUE) || (FreeMineGeneralIsDead == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Garond_ScoutNewMine_Info()
{
	var int sumqx;

	sumqx = FALSE;

	AI_Output(other,self,"DIA_Garond_ScoutNewMine_01_00");	//Ohledně dolu v Novém táboře...
	AI_Output(self,other,"DIA_Garond_ScoutNewMine_01_01");	//Poslouchám.

	if(FreeMineGeneralIsDead == FALSE)
	{
		if((ScoutFreeLager == TRUE) && (SFRM_01 == FALSE))
		{
			sumqx = sumqx + 200;
			AI_Output(other,self,"DIA_Garond_ScoutNewMine_01_02");	//Skřeti ovládají všechny přístupové cesty vedoucí do dolu.
			AI_Output(other,self,"DIA_Garond_ScoutNewMine_01_03");	//Je jich tam opravdu hodně.
			AI_Output(self,other,"DIA_Garond_ScoutNewMine_01_04");	//To mě ani nepřekvapuje. To by si tyhle stvůry nenechali ujít.
			SFRM_01 = TRUE;
		};
		if((ScoutFreeMine == TRUE) && (SFRM_02 == FALSE))
		{
			sumqx = sumqx + 200;
			AI_Output(other,self,"DIA_Garond_ScoutNewMine_01_05");	//Podařilo se mi dostat i do samotného dolu. I ten je plný skřetů!
			AI_Output(self,other,"DIA_Garond_ScoutNewMine_01_06");	//Ano, je logické, že ho nenechají bez obrany.
			AI_Output(self,other,"DIA_Garond_ScoutNewMine_01_07");	//Abychom mohli začít s těžbou, je potřeba je odtud vyhnat!
			SFRM_02 = TRUE;
		};
		if(sumqx > 0)
		{
			B_GivePlayerXP(sumqx);
		};

		AI_Output(other,self,"DIA_Garond_ScoutNewMine_01_08");	//Jinak nic nového.
		AI_Output(self,other,"DIA_Garond_ScoutNewMine_01_09");	//Dobře! Dej mi vědět, pokud se situace nějak změní.
	}
	else
	{
		if((SFRM_01 == FALSE) && (SFRM_02 == FALSE))
		{
			B_GivePlayerXP(500);
		}
		else
		{
			B_GivePlayerXP(1000);
		};

		AI_Output(other,self,"DIA_Garond_ScoutNewMine_01_10");	//Postaral jsem je o ty skřety. Důl je teď volný.
		AI_Output(self,other,"DIA_Garond_ScoutNewMine_01_11");	//To myslíš vážně? Upřímně, to jsem od tebe nečekal.
		AI_Output(self,other,"DIA_Garond_ScoutNewMine_01_12");	//Dobře! Jakmile se postaráme o to ležení kolem hradu, pošlu tam skupinku mých lidí.
		AI_Output(self,other,"DIA_Garond_ScoutNewMine_01_13");	//Podívají se na zásoby magické rudy.
		AI_Output(self,other,"DIA_Garond_ScoutNewMine_01_14");	//Tady máš nějaké zlato jako odměnu.
		B_GiveInvItems(self,other,ItMi_Gold,1500);
		MIS_ScoutNewMine = LOG_Success;
		Log_SetTopicStatus(TOPIC_ScoutNewMine,LOG_Success);
		B_LogEntry(TOPIC_ScoutNewMine,"Garond měl ohromnou radost, že se mi podařilo vyčistit důl v Novém táboře od skřetů.");
		AI_StopProcessInfos(self);
	};
};

var int AlbertGroupDone;
var int VenzelGroupDone;

instance DIA_GAROND_GROUP4(C_Info)
{
	npc = PAL_250_Garond;
	nr = 2;
	condition = dia_garond_group4_condition;
	information = dia_garond_group4_info;
	permanent = FALSE;
	description = "Našel jsem oddíl paladina Alberta.";
};

func int dia_garond_group4_condition()
{
	if((MIS_LostPaladins == LOG_Running) && (KAPITELORCATC == FALSE) && (AlbertGroup == TRUE))
	{
		return TRUE;
	};
};

func void dia_garond_group4_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Garond_Group4_15_01");	//Našel jsem oddíl paladina Alberta.
	AI_Output(self,other,"DIA_Garond_Group4_10_00");	//Jak jsou na tom?
	AI_Output(other,self,"DIA_Garond_Group4_15_02");	//Uchýlili se do jeskyně za skřetí palisádou.
	AI_Output(other,self,"DIA_Garond_Group4_15_03");	//Ptá se, co má dělat.
	AI_Output(self,other,"DIA_Garond_Group4_10_01");	//Innos nám dnes poslal dobré zprávy!
	AI_Output(self,other,"DIA_Garond_Group4_10_02");	//Pokud se ti znovu podaří se s nimi spojit, odevzdej jim mé rozkazy - ať tam zůstanou, než přijde do údolí lord Hagen a jeho muži.
	AI_Output(self,other,"DIA_Garond_Group4_10_04");	//Pak ať udeří na skřety zezadu!
	AI_Output(self,other,"DIA_Garond_Group4_10_05");	//Jestli se nám podaří zaútočit od Khorinisu, hradu a moře najednou, zasejeme mezi skřety paniku.
	AI_Output(self,other,"DIA_Garond_Group4_10_06");	//Pak budeme mít mnohem větší šanci.
	B_LogEntry(TOPIC_LostPaladins,"Informoval jsem Garonda o nalezení skupiny paladinů, kterou poslal k moři.");

	if(MIS_EscapeMine == LOG_Success)
	{
		MIS_LostPaladins = LOG_Success;
		Log_SetTopicStatus(TOPIC_LostPaladins,LOG_Success);
	};

	MIS_FINDEDOCGROUP = LOG_Running;
	Log_CreateTopic(TOPIC_FINDEDOCGROUP,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FINDEDOCGROUP,LOG_Running);
	B_LogEntry_Quiet(TOPIC_FINDEDOCGROUP,"Garond mě požádal, abych vzkázal Albertovi, ať zůstane na místě a počká na příjezd posil lorda Hagena.");
};

instance DIA_GAROND_Venzel(C_Info)
{
	npc = PAL_250_Garond;
	nr = 2;
	condition = dia_garond_Venzel_condition;
	information = dia_garond_Venzel_info;
	permanent = FALSE;
	description = "Pokud jde o skupinu paladina Wenzela...";
};

func int dia_garond_Venzel_condition()
{
	if((MIS_LostPaladins == LOG_Running) && (KAPITELORCATC == FALSE) && (HintVenzelOrcs_01 == TRUE) && (HintVenzelOrcs_02 == TRUE))
	{
		return TRUE;
	};
};

func void dia_garond_Venzel_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Garond_Venzel_01_01");	//Pokud jde o skupinu paladina Wenzela...
	AI_Output(self,other,"DIA_Garond_Venzel_01_02");	//Poslouchám.
	AI_Output(other,self,"DIA_Garond_Venzel_01_03");	//Před pár dny jeden z lovců viděl zraněného paladina u břehu řeky.
	AI_Output(other,self,"DIA_Garond_Venzel_01_04");	//Možná to byl někdo z Wenzelovy skupiny.
	AI_Output(self,other,"DIA_Garond_Venzel_01_05");	//Zajímavé... Nic jiného jsi už nezjistil?
	AI_Output(other,self,"DIA_Garond_Venzel_01_06");	//Zvěd Jergan nedávno zpozoroval, jak skupina skřetů vedla zajatce do svého tábora.
	AI_Output(other,self,"DIA_Garond_Venzel_01_07");	//Bohužel je nebyl schopný rozpoznat.
	AI_Output(other,self,"DIA_Garond_Venzel_01_08");	//Proto si zatím nemůžeme být jisti.
	AI_Output(self,other,"DIA_Garond_Venzel_01_09");	//Pokud jsou stále naživu a zajatci skřetů, musíme se je nějak snažit dostat z jejich spárů.
	AI_Output(self,other,"DIA_Garond_Venzel_01_10");	//(důrazně) Kde jsou teď?
	AI_Output(other,self,"DIA_Garond_Venzel_01_11");	//Obávám se, že tohle nebude vědět nikdo jiný než samotní skřeti.
	AI_Output(self,other,"DIA_Garond_Venzel_01_12");	//Víš, je mi jedno, jak to uděláš... (vážně) Ale musíš zjistit, co je to za lidi!
	AI_Output(self,other,"DIA_Garond_Venzel_01_13");	//A pokud někteří z nich budou mí bratři ve zbroji, pokus se je zachránit.
	AI_Output(self,other,"DIA_Garond_Venzel_01_14");	//Dokonči tenhle úkol, a já ti, při Innosovi, odpovím na vše, co budeš chtít vědět.
	AI_Output(other,self,"DIA_Garond_Venzel_01_15");	//No, jestli je to pro tebe tak důležité...
	B_LogEntry(TOPIC_LostPaladins,"Řekl jsem Garondovi o Wenzelově situaci. Samozřejmě, nepotěšilo ho to. Naléhal, abych zjistil, co se stalo s lidmi, které skřeti vzali do hor a popřípadě je zachránil. Víc budou vědět asi jen skřeti.");
	KnowVenzelOrcs = TRUE;
};

instance DIA_PAL_250_Garond_VenzelDone(C_Info)
{
	npc = PAL_250_Garond;
	nr = 2;
	condition = DIA_PAL_250_Garond_VenzelDone_condition;
	information = DIA_PAL_250_Garond_VenzelDone_info;
	permanent = FALSE;
	description = "Zjistil jsem, co se stalo s Wenzelem.";
};

func int DIA_PAL_250_Garond_VenzelDone_condition()
{
	if((MIS_LostPaladins == LOG_Running) && (MIS_EscapeMine == LOG_Success))
	{
		return TRUE;
	};
};

func void DIA_PAL_250_Garond_VenzelDone_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_PAL_250_Garond_VenzelDone_01_01");	//Zjistil jsem, co se stalo s Wenzelem.
	AI_Output(self,other,"DIA_PAL_250_Garond_VenzelDone_01_02");	//Tak mluv, rychle. Je naživu?
	AI_Output(other,self,"DIA_PAL_250_Garond_VenzelDone_01_03");	//Žije, ale byl zajat skřety. Poslali ho do dolu těžit železnou rudu.
	AI_Output(self,other,"DIA_PAL_250_Garond_VenzelDone_01_04");	//Chvála Innosovi... (ulehčeně) Takže ještě není všechno ztraceno! Musíme ho dostat ven.
	AI_Output(other,self,"DIA_PAL_250_Garond_VenzelDone_01_05");	//Není třeba. V skřetím dole jsem našel magický portál.
	AI_Output(other,self,"DIA_PAL_250_Garond_VenzelDone_01_06");	//Wenzel a ostatní otroci ho použili, aby utekli.
	AI_Output(other,self,"DIA_PAL_250_Garond_VenzelDone_01_07");	//Nicméně ten portál pravděpodobně vede přímo na pevninu.
	AI_Output(other,self,"DIA_PAL_250_Garond_VenzelDone_01_08");	//Proto ti Wenzel vzkazuje, že se už na Khorinis asi nevrátí.
	AI_Output(self,other,"DIA_PAL_250_Garond_VenzelDone_01_09");	//Nu, budiž. Hlavně, že bude v pořádku.
	AI_Output(other,self,"DIA_PAL_250_Garond_VenzelDone_01_10");	//Říkal, že se vrátí do Myrtany a bude tam bojovat se skřety.
	AI_Output(other,self,"DIA_PAL_250_Garond_VenzelDone_01_11");	//Vypadá to, že měl pravdu, když říkal, že král je na tom stejně špatně jako vy.
	AI_Output(self,other,"DIA_PAL_250_Garond_VenzelDone_01_12");	//Ti zatracení skřeti... (nahněvaně) Zamořili tuhle krajinu jako kobylky!
	AI_Output(self,other,"DIA_PAL_250_Garond_VenzelDone_01_13");	//Ale my budeme bojovat do posledního muže! Nenecháme se jimi zlomit!
	AI_Output(self,other,"DIA_PAL_250_Garond_VenzelDone_01_14");	//A ohledně kontinentu... (neochotně) Nebudu ti lhát. Je to tak.
	AI_Output(self,other,"DIA_PAL_250_Garond_VenzelDone_01_15");	//Král se z posledních sil snaží zadržet hordy skřetů z Nordmaru.
	AI_Output(self,other,"DIA_PAL_250_Garond_VenzelDone_01_16");	//Ale nepovede se mu to. Skřetů je příliš mnoho a král nemá dost vojáků ani zbraní.
	AI_Output(self,other,"DIA_PAL_250_Garond_VenzelDone_01_17");	//My jsme nyní jedinou nadějí. Magická ruda by možná dokázala otočit průběh války.
	AI_Output(self,other,"DIA_PAL_250_Garond_VenzelDone_01_18");	//Ale, jak vidíš, i my máme plno práce s odrážením skřetů.
	AI_Output(self,other,"DIA_PAL_250_Garond_VenzelDone_01_19");	//Nejsem zvyklý vzdávat se, ale... (odevzdaně) Tahle válka je už zřejmě nadobro prohraná.
	AI_Output(self,other,"DIA_PAL_250_Garond_VenzelDone_01_20");	//Ale ať tě ani nenapadne to někomu říkat!
	AI_Output(self,other,"DIA_PAL_250_Garond_VenzelDone_01_21");	//Nedovolím, aby mí muži ztratili morálku jen kvůli nějakým hloupým dohadům.
	AI_Output(other,self,"DIA_PAL_250_Garond_VenzelDone_01_22");	//Samo sebou.
	MIS_LostPaladins = LOG_Success;
	Log_SetTopicStatus(TOPIC_LostPaladins,LOG_Success);
	B_LogEntry(TOPIC_LostPaladins,"Řekl jsem Garondovi o Wenzelově osudu.");
};

instance DIA_Garond_Why(C_Info)
{
	npc = PAL_250_Garond;
	nr = 4;
	condition = DIA_Garond_Why_Condition;
	information = DIA_Garond_Why_Info;
	permanent = FALSE;
	description = "Ale proč zrovna já?";
};

func int DIA_Garond_Why_Condition()
{
	if((MIS_ScoutMine == LOG_Running) && (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_Garond_Why_Info()
{
	AI_Output(other,self,"DIA_Garond_Why_15_00");	//Ale proč zrovna já?
	AI_Output(self,other,"DIA_Garond_Why_10_01");	//Protože víš, jak proklouznout mezi skřety. Moji chlapci by tam byli beznadějně ztracení.
	AI_Output(self,other,"DIA_Garond_Why_10_02");	//Ty jsi mezi nimi ale už jednou prošel - to je nejlepší důkaz, že jsi pro tenhle úkol ten pravý.
};

instance DIA_Garond_Equipment(C_Info)
{
	npc = PAL_250_Garond;
	nr = 4;
	condition = DIA_Garond_Equipment_Condition;
	information = DIA_Garond_Equipment_Info;
	permanent = FALSE;
	description = "Potřebuji nějaké vybavení.";
};


func int DIA_Garond_Equipment_Condition()
{
	if((MIS_ScoutMine == LOG_Running) && (Kapitel == 2) && ((other.guild == GIL_KDF) || (other.guild == GIL_MIL)))
	{
		return TRUE;
	};
};

func void DIA_Garond_Equipment_Info()
{
	AI_Output(other,self,"DIA_Garond_Equipment_15_00");	//Potřebuji nějaké vybavení.
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Garond_Equipment_10_01");	//Promluv si s mágem Miltenem, je tady na hradě. On bude vědět, co by se ti mohlo hodit.
	};
	if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Garond_Equipment_10_02");	//Promluv si o tom s Tandorem. Dá ti všechno, co budeš potřebovat.
		Log_CreateTopic(TOPIC_Trader_OC,LOG_NOTE);
		B_LogEntry(TOPIC_Trader_OC,"Tandor na hradě prodává zbraně.");
	};
};


instance DIA_Garond_zahlen(C_Info)
{
	npc = PAL_250_Garond;
	nr = 4;
	condition = DIA_Garond_zahlen_Condition;
	information = DIA_Garond_zahlen_Info;
	permanent = FALSE;
	description = "Kolik mi za to zaplatíš?";
};


func int DIA_Garond_zahlen_Condition()
{
	if((MIS_ScoutMine == LOG_Running) && (Kapitel == 2) && (other.guild == GIL_SLD))
	{
		return TRUE;
	};
};

func void DIA_Garond_zahlen_Info()
{
	AI_Output(other,self,"DIA_Garond_zahlen_15_00");	//Kolik mi za to zaplatíš?
	AI_Output(self,other,"DIA_Garond_zahlen_10_01");	//Nejsem zvyklý vyjednávat s vámi žoldáky.
	AI_Output(self,other,"DIA_Garond_zahlen_10_02");	//Ale zřejmě nemám na výběr. Když splníš tenhle úkol, dám ti pět set zlatých.
};


instance DIA_Garond_Wo(C_Info)
{
	npc = PAL_250_Garond;
	nr = 4;
	condition = DIA_Garond_Wo_Condition;
	information = DIA_Garond_Wo_Info;
	permanent = FALSE;
	description = "Kde můžu najít stanoviště kopáčů?";
};


func int DIA_Garond_Wo_Condition()
{
	if((MIS_ScoutMine == LOG_Running) && (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_Garond_Wo_Info()
{
	AI_Output(other,self,"DIA_Garond_Wo_15_00");	//Kde můžu najít stanoviště kopáčů?
	AI_Output(self,other,"DIA_Garond_Wo_10_01");	//Vezmi si tuhle mapu. Jsou na ní zakreslené dvě oblasti, ve kterých jsou doly.
	CreateInvItems(self,itwr_map_oldworld_oremines_mis_1,1);
	B_GiveInvItems(self,other,itwr_map_oldworld_oremines_mis_1,1);
	AI_Output(self,other,"DIA_Garond_Wo_10_02");	//Jestli máš ještě nějaké další otázky, promluv s Parcivalem. Řekne ti vše, co potřebuješ vědět.
	B_LogEntry(TOPIC_ScoutMine,"Paladin Parcival mi může poskytnout další informace o kopáčích.");
};

func void B_Garond_OreCounter3()
{
	AI_Output(self,other,"B_Garond_OreCounter3_10_00");	//Zatraceně, to nás přišel vyhladit samotný Beliar?
	AI_Output(self,other,"B_Garond_OreCounter3_10_01");	//Moji muži jsou téměř všichni mrtví a s tou trochou rudy, co máme, bychom nezastavili JEDINÉHO SKŘETA, NATOŽ CELOU ARMÁDU!
	AI_Output(self,other,"B_Garond_OreCounter3_10_02");	//Tato výprava je odsouzena k záhubě.
};


instance DIA_Garond_Fajeth(C_Info)
{
	npc = PAL_250_Garond;
	nr = 2;
	condition = DIA_Garond_Fajeth_Condition;
	information = DIA_Garond_Fajeth_Info;
	permanent = FALSE;
	description = "Mluvil jsem s Fajethem.";
};


func int DIA_Garond_Fajeth_Condition()
{
	if((MIS_ScoutMine == LOG_Running) && (Kapitel == 2) && (Fajeth_Ore == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Garond_Fajeth_Info()
{
	AI_Output(other,self,"DIA_Garond_Fajeth_15_00");	//Mluvil jsem s Fajethem.
	AI_Output(self,other,"DIA_Garond_Fajeth_10_01");	//Co má na srdci?
	AI_Output(other,self,"DIA_Garond_Fajeth_15_02");	//Jeho lidé vydolovali dvě bedny rudy.
	AI_Output(self,other,"DIA_Garond_Fajeth_10_03");	//Hmm... dvě bedny? Nepotřebuji dvě bedny - potřebuji DVĚ STOVKY!
	AI_Output(other,self,"DIA_Garond_Fajeth_15_04");	//Mám ti vyřídit, že potřebuje víc mužů.
	AI_Output(self,other,"DIA_Garond_Fajeth_10_05");	//Cože? To mám poslat další lidi na jistou smrt? Na to může zapomenout.
	Ore_Counter = Ore_Counter + 1;
	B_GivePlayerXP(XP_Fajeth_Ore);
	if(Ore_Counter >= 3)
	{
		B_Garond_OreCounter3();
	};
};


instance DIA_Garond_Silvestro(C_Info)
{
	npc = PAL_250_Garond;
	nr = 2;
	condition = DIA_Garond_Silvestro_Condition;
	information = DIA_Garond_Silvestro_Info;
	permanent = FALSE;
	description = "Co se Silvestrova dolu týče...";
};


func int DIA_Garond_Silvestro_Condition()
{
	if((MIS_ScoutMine == LOG_Running) && (Kapitel == 2) && (Silvestro_Ore == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Garond_Silvestro_Info()
{
	AI_Output(other,self,"DIA_Garond_Silvestro_15_00");	//Co se Silvestrova dolu týče...
	AI_Output(self,other,"DIA_Garond_Silvestro_10_01");	//Mluvil jsi s ním?
	AI_Output(other,self,"DIA_Garond_Silvestro_15_02");	//Celá skupina je mrtvá. Překvapili je důlní červi.
	AI_Output(self,other,"DIA_Garond_Silvestro_10_03");	//A co ruda? Kolik vydolovali?
	AI_Output(other,self,"DIA_Garond_Silvestro_15_04");	//Podařilo se jim zajistit několik beden. Jsou v jeskyni poblíž cesty mezi hradem a dolem.
	AI_Output(self,other,"DIA_Garond_Silvestro_10_05");	//Zatraceně! Byli to vážně dobří chlapi - Innos měj slitování nad jejich dušemi.
	Ore_Counter = Ore_Counter + 1;
	B_GivePlayerXP(XP_Silvestro_Ore);
	if(Ore_Counter >= 3)
	{
		B_Garond_OreCounter3();
	};
};


instance DIA_Garond_Marcos(C_Info)
{
	npc = PAL_250_Garond;
	nr = 2;
	condition = DIA_Garond_Marcos_Condition;
	information = DIA_Garond_Marcos_Info;
	permanent = FALSE;
	description = "Potkal jsem Markose.";
};


func int DIA_Garond_Marcos_Condition()
{
	if((MIS_ScoutMine == LOG_Running) && (Kapitel == 2) && (Marcos_Ore == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Garond_Marcos_Info()
{
	AI_Output(other,self,"DIA_Garond_Marcos_15_00");	//Potkal jsem Markose.
	AI_Output(self,other,"DIA_Garond_Marcos_10_01");	//A? Co hlásí? Kolik má rudy?
	AI_Output(other,self,"DIA_Garond_Marcos_15_02");	//Čtyři bedny. Musel opustit důl, aby je dostal do bezpečí.
	AI_Output(other,self,"DIA_Garond_Marcos_15_03");	//Nyní je střeží v malém údolíčku za skřetími liniemi. Potřebuje posily.
	AI_Output(self,other,"DIA_Garond_Marcos_10_04");	//Jen čtyři bedny a opustil důl? Sakra, to není dobré.
	AI_Output(self,other,"DIA_Garond_Marcos_10_05");	//A teď chce ještě další muže? No dobrá, pošlu mu dva chlapy.
	Marcos_Guard1.flags = 0;
	Marcos_Guard2.flags = 0;
	B_StartOtherRoutine(Marcos_Guard1,"MARCOS");
	B_StartOtherRoutine(Marcos_Guard2,"MARCOS");
	AI_Teleport(Marcos_Guard1,"OW_STAND_GUARDS");
	AI_Teleport(Marcos_Guard1,"OW_STAND_GUARDS");
	Ore_Counter = Ore_Counter + 1;
	MIS_Marcos_Jungs = LOG_SUCCESS;
	B_GivePlayerXP(XP_Marcos_Ore);
	if(Ore_Counter >= 3)
	{
		B_Garond_OreCounter3();
	};
};


instance DIA_Garond_Success(C_Info)
{
	npc = PAL_250_Garond;
	nr = 4;
	condition = DIA_Garond_Success_Condition;
	information = DIA_Garond_Success_Info;
	permanent = FALSE;
	description = "A co ten dopis pro lorda Hagena?";
};


func int DIA_Garond_Success_Condition()
{
	if((MIS_ScoutMine == LOG_Running) && (Kapitel == 2) && (Ore_Counter >= 3))
	{
		return TRUE;
	};
};

func void DIA_Garond_Success_Info()
{
	AI_Output(other,self,"DIA_Garond_Success_15_00");	//A co ten dopis pro lorda Hagena?
	AI_Output(self,other,"DIA_Garond_Success_10_01");	//Máme dohromady deset beden rudy - a ztratili jsme dvakrát tolik dobrých mužů.
	AI_Output(self,other,"DIA_Garond_Success_10_02");	//Dostaneš svůj dopis. Lord Hagen se o tom MUSÍ dozvědět. Tohle údolí je prokleté...
	CreateInvItems(self,ItWr_PaladinLetter_MIS,1);
	B_GiveInvItems(self,other,ItWr_PaladinLetter_MIS,1);
	KnowsPaladins_Ore = TRUE;

	if(((hero.guild == GIL_GUR) || (hero.guild == GIL_TPL)) && (MIS_PALADINWATCH == LOG_Running) && (IDOLORANQUESTIONFOUR == FALSE))
	{
		IDOLORANQUESTIONFOUR = TRUE;
		B_LogEntry(TOPIC_PALADINWATCH,"Podle Garonda je výprava ztracena. V dolech není dost rudy na zásobování celé královské armády a další doly obsadili skřeti. Dal mi dopis pro Hagena, ve kterém žádá o posily.");
	};

	B_LogEntry(Topic_MISOLDWORLD,"Garond mi předal dopis s důkazem pro lorda Hagena. Měl bych mu ho doručit.");
	MIS_ScoutMine = LOG_SUCCESS;
	B_GivePlayerXP(XP_ScoutMine);
	MIS_ReadyForChapter3 = TRUE;
	B_NPC_IsAliveCheck(OldWorld_Zen);
};


instance DIA_Garond_SLD(C_Info)
{
	npc = PAL_250_Garond;
	nr = 4;
	condition = DIA_Garond_SLD_Condition;
	information = DIA_Garond_SLD_Info;
	permanent = FALSE;
	description = "A co můj žold?";
};


func int DIA_Garond_SLD_Condition()
{
	if((MIS_ScoutMine == LOG_SUCCESS) && (other.guild == GIL_SLD) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Garond_SLD_Info()
{
	AI_Output(other,self,"DIA_Garond_SLD_15_00");	//A co můj žold?
	AI_Output(self,other,"DIA_Garond_SLD_10_01");	//Ach, ano, jistě. Ještě ti vlastně dlužím nějaké zlato. Tady je tvoje odměna.
	B_GiveInvItems(self,other,ItMi_Gold,500);
};


instance DIA_Garond_Running(C_Info)
{
	npc = PAL_250_Garond;
	nr = 10;
	condition = DIA_Garond_Running_Condition;
	information = DIA_Garond_Running_Info;
	permanent = TRUE;
	description = "Jak to vypadá?";
};


func int DIA_Garond_Running_Condition()
{
	if((MIS_ScoutMine == LOG_Running) && (Kapitel == 2) && (Ore_Counter < 3))
	{
		return TRUE;
	};
};

func void DIA_Garond_Running_Info()
{
	AI_Output(other,self,"DIA_Garond_Running_15_00");	//Jak to vypadá?
	if(Ore_Counter == 2)
	{
		AI_Output(self,other,"DIA_Garond_Running_10_01");	//Teď už jen čekám na zprávy z posledního dolu - a doufám, že to budou dobré zprávy.
	}
	else if(Ore_Counter == 1)
	{
		AI_Output(self,other,"DIA_Garond_Running_10_02");	//Potřebuji zprávy o tom, jak to vypadá v dalších dvou dolech. Pak se uvidí.
	}
	else
	{
		AI_Output(self,other,"DIA_Garond_Running_10_03");	//Měl by ses vydat hledat ty doly. Zoufale potřebuji zprávy o tom, jak to vypadá s dobýváním rudy.
	};
};


instance DIA_Garond_Gorn(C_Info)
{
	npc = PAL_250_Garond;
	nr = 4;
	condition = DIA_Garond_Gorn_Condition;
	information = DIA_Garond_Gorn_Info;
	permanent = FALSE;
	description = "Chci, abys pustil Gorna.";
};


func int DIA_Garond_Gorn_Condition()
{
	if(Npc_KnowsInfo(other,DIA_MiltenOW_Gorn) && (Kapitel == 2) && Npc_KnowsInfo(other,DIA_Garond_NeedProof))
	{
		return TRUE;
	};
};

func void DIA_Garond_Gorn_Info()
{
	AI_Output(other,self,"DIA_Garond_Gorn_15_00");	//Chci, abys pustil Gorna.
	AI_Output(self,other,"DIA_Garond_Gorn_10_01");	//Nemůžu ho propustit. Spáchal mnoho zločinů, za které musí pykat.
	AI_Output(other,self,"DIA_Garond_Gorn_15_02");	//Můžu za něj zaplatit jeho pokutu?
	AI_Output(self,other,"DIA_Garond_Gorn_10_03");	//To by možná šlo - ale rozhodně to nebude levné. Za Gorna budu chtít tisíc zlatých.
	AI_Output(other,self,"DIA_Garond_Gorn_15_04");	//To je hodně peněz.
	AI_Output(self,other,"DIA_Garond_Gorn_10_05");	//Gorn taky není žádný neviňátko. Přines mi ty peníze a já Gorna propustím.
	MIS_RescueGorn = LOG_Running;
	B_LogEntry(TOPIC_RescueGorn,"Garond chce za Gornovu svobodu 1000 zlatých.");
};


instance DIA_Garond_Pay(C_Info)
{
	npc = PAL_250_Garond;
	nr = 4;
	condition = DIA_Garond_Pay_Condition;
	information = DIA_Garond_Pay_Info;
	permanent = TRUE;
	description = "Chtěl bych vykoupit Gorna. (Zaplatit 1000 zlatých)";
};


func int DIA_Garond_Pay_Condition()
{
	if((MIS_RescueGorn == LOG_Running) && (Kapitel == 2) && (Garond_Kerkerauf == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Garond_Pay_Info()
{
	AI_Output(other,self,"DIA_Garond_Pay_15_00");	//Chtěl bych vykoupit Gorna.
	if(B_GiveInvItems(other,self,ItMi_Gold,1000))
	{
		AI_Output(self,other,"DIA_Garond_Pay_10_01");	//Dobrá. Běž za Geroldem a řekni mu, ať na můj rozkaz Gorna propustí.
		Garond_Kerkerauf = TRUE;
		B_LogEntry(TOPIC_RescueGorn,"Zaplatil jsem Garondovi. Teď se Gorn může dostat z lochu - strážce Gerold ho pustí.");
	}
	else
	{
		AI_Output(self,other,"DIA_Garond_Pay_10_02");	//V tom případě mi přines tisíc zlatých.
	};
};


instance DIA_Garond_Perm2(C_Info)
{
	npc = PAL_250_Garond;
	nr = 9;
	condition = DIA_Garond_Perm2_Condition;
	information = DIA_Garond_Perm2_Info;
	permanent = TRUE;
	description = "Co budeš dělat teď?";
};


func int DIA_Garond_Perm2_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Garond_Success) && (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_Garond_Perm2_Info()
{
	AI_Output(other,self,"DIA_Garond_Perm2_15_00");	//Co budeš dělat teď?
	AI_Output(self,other,"DIA_Garond_Perm2_10_01");	//Mám už všeho dost. Moje jediná naděje jsi teď ty - a že mi lord Hagen pošle posily.
	AI_Output(self,other,"DIA_Garond_Perm2_10_02");	//Budeme stát pevně jako skála a modlit se k Innosovi, aby nás v této temné hodině nenechal klesnout na mysli.
};


instance DIA_Garond_KAP3_EXIT(C_Info)
{
	npc = PAL_250_Garond;
	nr = 999;
	condition = DIA_Garond_KAP3_EXIT_Condition;
	information = DIA_Garond_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Garond_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Garond_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Garond_WASGIBTSNEUES(C_Info)
{
	npc = PAL_250_Garond;
	nr = 30;
	condition = DIA_Garond_WASGIBTSNEUES_Condition;
	information = DIA_Garond_WASGIBTSNEUES_Info;
	permanent = TRUE;
	description = "Co je nového?";
};


func int DIA_Garond_WASGIBTSNEUES_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Garond_WASGIBTSNEUES_Info()
{
	AI_Output(other,self,"DIA_Garond_WASGIBTSNEUES_15_00");	//Co je nového?
	AI_Output(self,other,"DIA_Garond_WASGIBTSNEUES_10_01");	//Zatraceně. Co se tady flákáš? Potřebuji ty zatracené posily!
	AI_Output(self,other,"DIA_Garond_WASGIBTSNEUES_10_02");	//Dokonce i Milten opustil hrad. Ale já nepotřebuji míň lidí - potřebuji jich víc!
};


instance DIA_Garond_KAP4_EXIT(C_Info)
{
	npc = PAL_250_Garond;
	nr = 999;
	condition = DIA_Garond_KAP4_EXIT_Condition;
	information = DIA_Garond_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Garond_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Garond_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Garond_BACKINKAP4(C_Info)
{
	npc = PAL_250_Garond;
	nr = 12;
	condition = DIA_Garond_BACKINKAP4_Condition;
	information = DIA_Garond_BACKINKAP4_Info;
	permanent = FALSE;
	description = "Jsem zpět.";
};


func int DIA_Garond_BACKINKAP4_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Garond_BACKINKAP4_Info()
{
	AI_Output(other,self,"DIA_Garond_BACKINKAP4_15_00");	//Jsem zpět.
	AI_Output(self,other,"DIA_Garond_BACKINKAP4_10_01");	//No to vidím. Kde jsou ty posily?
	AI_Output(other,self,"DIA_Garond_BACKINKAP4_15_02");	//Lord Hagen přijde, jakmile vyřídí všechny nezbytné záležitosti. Hodně se toho stalo.
	AI_Output(self,other,"DIA_Garond_BACKINKAP4_10_03");	//To mě nezajímá. Mě zajímají vojáci. Skřetů je čím dál tím víc a moc dlouho se už neudržíme.
	AI_Output(self,other,"DIA_Garond_BACKINKAP4_10_04");	//Muži jsou unavení a dochází nám proviant.
	AI_Output(other,self,"DIA_Garond_BACKINKAP4_15_05");	//Přijelo pár dobrovolníků.
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Garond_BACKINKAP4_10_06");	//Myslíš sebe a těch tvých pár drakobijců, co? Můžete nám sice pomoci, ale pořád vás není dost.
	}
	else
	{
		AI_Output(self,other,"DIA_Garond_BACKINKAP4_10_07");	//Myslíš ty drakobijce na dvoře? Ti nám sice mohou pomoci, ale pořád jich není dost.
	};
	AI_Output(self,other,"DIA_Garond_BACKINKAP4_10_08");	//Jestli Hagen co nejdřív nepošle nějaké muže, pak za nic neručím.
	B_InitNpcGlobals();
	AI_Teleport(DJG_Angar,"OW_DJG_WATCH_STONEHENGE_01");
	B_StartOtherRoutine(DJG_Angar,"Start");
	DJG_Angar_SentToStones = TRUE;
	B_StartOtherRoutine(Kjorn,"START");
	B_StartOtherRoutine(Godar,"START");
	B_StartOtherRoutine(Hokurn,"START");
	B_StartOtherRoutine(PC_Fighter_DJG,"START");
	B_StartOtherRoutine(Kurgan,"START");
	if(DJG_BiffParty == FALSE)
	{
		B_StartOtherRoutine(Biff,"START");
	};
};


instance DIA_Garond_DragonPlettBericht(C_Info)
{
	npc = PAL_250_Garond;
	nr = 11;
	condition = DIA_Garond_DragonPlettBericht_Condition;
	information = DIA_Garond_DragonPlettBericht_Info;
	permanent = TRUE;
	description = "Ohledně draků...";
};


var int DIA_Garond_DragonPlettBericht_NoPerm;

func int DIA_Garond_DragonPlettBericht_Condition()
{
	if((Kapitel >= 4) && Npc_KnowsInfo(other,DIA_Garond_BACKINKAP4) && (DIA_Garond_DragonPlettBericht_NoPerm == FALSE) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};


var int Garond_DragonCounter;
var int Garond_SwampdragonKilled_OneTime;
var int Garond_RockdragonKilled_OneTime;
var int Garond_FireDragonKilled_OneTime;
var int Garond_IcedragonKilled_OneTime;
var int Garond_OricExperte_OneTime;

func void DIA_Garond_DragonPlettBericht_Info()
{
	var int CurrentDragonCount;
	var int Drachengeld;
	var int XP_LocalGarond;
	B_LogEntry(TOPIC_DRACHENJAGD,"Garond se pravděpodobně velmi zajímá o tu věc s draky, ale navenek se jí nijak neúčastní.");
	if(Garond_DragonCounter < MIS_KilledDragons)
	{
		AI_Output(other,self,"DIA_Garond_DragonPlettBericht_15_00");	//Ohledně draků...
		AI_Output(self,other,"DIA_Garond_DragonPlettBericht_10_01");	//Mluv!
		CurrentDragonCount = 0;
		if(Npc_IsDead(SwampDragon) && (Garond_SwampdragonKilled_OneTime == FALSE))
		{
			AI_Output(other,self,"DIA_Garond_DragonPlettBericht_15_02");	//Zabil jsem draka v bažině na východ odsud.
			Garond_SwampdragonKilled_OneTime = TRUE;
			CurrentDragonCount = CurrentDragonCount + 1;
			if((SLD_Rod_is_alive == TRUE) && !Npc_IsDead(DJG_702_Rod))
			{
				Npc_ExchangeRoutine(DJG_702_Rod,"ONDCamp");
				AI_Teleport(DJG_702_Rod,"OW_MOVEMENT_LURKER_NEARBGOBBO03");
			};
			if((SLD_Cipher_is_alive == TRUE) && !Npc_IsDead(DJG_703_Cipher))
			{
				Npc_ExchangeRoutine(DJG_703_Cipher,"ONDCamp");
				AI_Teleport(DJG_703_Cipher,"VORPOSTEN");
			};
		};
		if(Npc_IsDead(RockDragon) && (Garond_RockdragonKilled_OneTime == FALSE))
		{
			AI_Output(other,self,"DIA_Garond_DragonPlettBericht_15_03");	//Drak ve skalní pevnosti na jihu je mrtvý.
			Garond_RockdragonKilled_OneTime = TRUE;
			CurrentDragonCount = CurrentDragonCount + 1;
		};
		if(Npc_IsDead(FireDragon) && (Garond_FireDragonKilled_OneTime == FALSE))
		{
			AI_Output(other,self,"DIA_Garond_DragonPlettBericht_15_04");	//Ohnivý drak v sopce na jihu už nebude tropit žádné potíže.
			Garond_FireDragonKilled_OneTime = TRUE;
			CurrentDragonCount = CurrentDragonCount + 1;
		};
		if(Npc_IsDead(IceDragon) && (Garond_IcedragonKilled_OneTime == FALSE))
		{
			AI_Output(other,self,"DIA_Garond_DragonPlettBericht_15_05");	//Vydal jsem se do zmrzlé oblasti na západě a zlikvidoval tamního draka.
			Garond_IcedragonKilled_OneTime = TRUE;
			CurrentDragonCount = CurrentDragonCount + 1;
		};
		AI_Output(self,other,"DIA_Garond_DragonPlettBericht_10_06");	//To jsou dobré zprávy. Tady. Vezmi si nějaké peníze na doplnění výbavy.
		Drachengeld = CurrentDragonCount * Garond_KilledDragonGeld;
		XP_LocalGarond = CurrentDragonCount * XP_Garond_KilledDragon;
		B_GivePlayerXP(XP_LocalGarond);
		CreateInvItems(self,ItMi_Gold,Drachengeld);
		B_GiveInvItems(self,other,ItMi_Gold,Drachengeld);
		Garond_DragonCounter = MIS_KilledDragons;
		if(MIS_AllDragonsDead == TRUE)
		{
			DIA_Garond_DragonPlettBericht_NoPerm = TRUE;
		};
	};
	if((Garond_OricExperte_OneTime == FALSE) && (Npc_IsDead(Oric) == FALSE) && (MIS_AllDragonsDead == FALSE))
	{
		AI_Output(other,self,"DIA_Garond_DragonPlettBericht_15_07");	//Můžeš mi dát nějaké další informace o dracích?
		AI_Output(self,other,"DIA_Garond_DragonPlettBericht_10_08");	//Vrásky mi teď dělají jiné věci. Oric, můj důstojník přes strategické věci, ti o tom řekne víc.
		B_LogEntry(TOPIC_DRACHENJAGD,"Garond mi řekl, že jeho poradce Oric má informace o dracích.");
		Garond_OricExperte_OneTime = TRUE;
	}
	else if(MIS_AllDragonsDead == FALSE)
	{
		AI_Output(other,self,"DIA_Garond_DragonPlettBericht_15_09");	//Provedli draci mezitím nějaký další útok?
		AI_Output(self,other,"DIA_Garond_DragonPlettBericht_10_10");	//Naštěstí ne. Prozatím se drží zpátky.
	};
};


instance DIA_Garond_AllDragonDead(C_Info)
{
	npc = PAL_250_Garond;
	nr = 12;
	condition = DIA_Garond_AllDragonDead_Condition;
	information = DIA_Garond_AllDragonDead_Info;
	permanent = FALSE;
	description = "Všichni draci jsou mrtví.";
};


func int DIA_Garond_AllDragonDead_Condition()
{
	if((MIS_AllDragonsDead == TRUE) && (DIA_Garond_DragonPlettBericht_NoPerm == TRUE) && (Kapitel >= 4) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Garond_AllDragonDead_Info()
{
	B_GivePlayerXP(1500);
	AI_Output(other,self,"DIA_Garond_AllDragonDead_15_00");	//Všichni draci jsou mrtví.
	AI_Output(self,other,"DIA_Garond_AllDragonDead_10_01");	//(nevěřícně) Všichni? Takže zlo bylo navždy zažehnáno?
	AI_Output(other,self,"DIA_Garond_AllDragonDead_15_02");	//Ne, to bohužel ne. Ještě pořád zbývá jejich vůdce.
	AI_Output(self,other,"DIA_Garond_AllDragonDead_10_03");	//Copak nebyli draci veliteli skřetů?
	AI_Output(other,self,"DIA_Garond_AllDragonDead_15_04");	//Ano, to ano, ale mají svého vlastního pána. Toho se musíme také zbavit.
	AI_Output(self,other,"DIA_Garond_AllDragonDead_10_05");	//Zatraceně, do toho jít nemůžu. Musím hlídat rudu, a ještě navíc tu jsou pořád ti skřeti.
	AI_Output(self,other,"DIA_Garond_AllDragonDead_10_06");	//Budeš se o to muset postarat sám. Nemůžu ti pomoci.
	AI_Output(self,other,"DIA_Garond_AllDragonDead_10_07");	//Nechť tě Innos ochraňuje.
	OWDragonsDeadIsDead = TRUE;
};

instance DIA_Garond_JanBecomeSmith(C_Info)
{
	npc = PAL_250_Garond;
	nr = 12;
	condition = DIA_Garond_JanBecomeSmith_Condition;
	information = DIA_Garond_JanBecomeSmith_Info;
	permanent = TRUE;
	description = "Máme problém s kovářem.";
};


func int DIA_Garond_JanBecomeSmith_Condition()
{
	if((MIS_JanBecomesSmith == LOG_Running) && (Kapitel >= 4) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Garond_JanBecomeSmith_Info()
{
	AI_Output(other,self,"DIA_Garond_JanBecomeSmith_15_00");	//Máme problém s kovářem.
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_10_01");	//Jakým kovářem? Před několika dny přece zmizel.
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_10_02");	//On se vrátil? V tom případě mu řekni...
	AI_Output(other,self,"DIA_Garond_JanBecomeSmith_15_03");	//Ne, já mluvím o Janovi.
	if(hero.guild == GIL_DJG)
	{
		AI_Output(other,self,"DIA_Garond_JanBecomeSmith_15_04");	//Je to drakobijec jako já, a je to dobrý kovář.
	}
	else
	{
		AI_Output(other,self,"DIA_Garond_JanBecomeSmith_15_05");	//Jeden z drakobijců. Je to kovář.
	};
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_10_06");	//To je dobře. Náš předchozí kovář zmizel, zbabělec.
	AI_Output(other,self,"DIA_Garond_JanBecomeSmith_15_07");	//Jan se o kovárnu rád postará.
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_10_08");	//Říkáš, že bych mu měl věřit?
	AI_Output(other,self,"DIA_Garond_JanBecomeSmith_15_09");	//Ano.
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_10_10");	//Pokud si jsi tak jistý, můžeš se za něj zaručit.
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_10_11");	//Jestliže bude dělat nějaké potíže, budeš se za to zodpovídat ty. Souhlasíš?
	DobarOut = TRUE;
	Info_ClearChoices(DIA_Garond_JanBecomeSmith);
	Info_AddChoice(DIA_Garond_JanBecomeSmith,"Budu o tom přemýšlet.",DIA_Garond_JanBecomeSmith_No);
	Info_AddChoice(DIA_Garond_JanBecomeSmith,"Zaručím se za Jana.",DIA_Garond_JanBecomeSmith_Yes);
};

func void DIA_Garond_JanBecomeSmith_No()
{
	AI_Output(other,self,"DIA_Garond_JanBecomeSmith_No_15_00");	//Budu o tom přemýšlet.
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_No_10_01");	//Jak mu mám věřit já, když mu nedůvěřuješ ani ty sám?
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_No_10_02");	//Než se za něj někdo zaručí, bude muset držet ruce od kovárny.
	Info_ClearChoices(DIA_Garond_JanBecomeSmith);
};

func void DIA_Garond_JanBecomeSmith_Yes()
{
	AI_Output(other,self,"DIA_Garond_JanBecomeSmith_Yes_15_00");	//Zaručím se za Jana.
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_Yes_10_01");	//Dobrá. V tom případě může kovárnu používat. Samozřejmě také bude muset udělat meče pro mé muže.
	Info_ClearChoices(DIA_Garond_JanBecomeSmith);
	MIS_JanBecomesSmith = LOG_SUCCESS;
	B_GivePlayerXP(XP_Ambient);
};

instance DIA_Garond_DobarOut(C_Info)
{
	npc = PAL_250_Garond;
	nr = 12;
	condition = DIA_Garond_DobarOut_Condition;
	information = DIA_Garond_DobarOut_Info;
	permanent = FALSE;
	description = "Řekl jste, že váš kovář unikl.";
};

func int DIA_Garond_DobarOut_Condition()
{
	if((DobarOut == TRUE) && (Npc_IsDead(VLK_4107_Parlaf) == FALSE) && (ParlafIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Garond_DobarOut_Info()
{
	B_GivePlayerXP(1500);
	AI_Output(other,self,"DIA_Garond_DobarOut_01_00");	//Řekl jste, že váš kovář unikl.
	AI_Output(self,other,"DIA_Garond_DobarOut_01_01");	//Ano, a ne sám, ale společně se svým asistentem. Nicméně, si nemyslím, že by mohli dojít daleko.
	AI_Output(self,other,"DIA_Garond_DobarOut_01_02");	//V posledních dnech v údolí je ještě více skřetů a všelijaké jiné havěti a oni dva nebyli dobří bojovníci.
	AI_Output(self,other,"DIA_Garond_DobarOut_01_03");	//Víš, ať ti mizerní zbabělci utečou, ale Innos s nimi. V každém případě, není to nejhorší - mám na mysli, když skřeti ovládnou hrad - to by byl konec.
	AI_Output(other,self,"DIA_Garond_DobarOut_01_04");	//Možná, bych se po nich šel podívat.

	if(MIS_JanBecomesSmith == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Garond_DobarOut_01_05");	//Chcete-li mou upřímnost, v současné situaci, je mi to jedno. Kováře už máme.
	}
	else
	{
		AI_Output(self,other,"DIA_Garond_DobarOut_01_06");	//Chcete-li mou upřímnost, v současné situaci, je mi to jedno.
	};

	AI_Output(self,other,"DIA_Garond_DobarOut_01_07");	//Ale zas to nepřeháněj s tím běháním po údolí, jednou tě chytí a zničíš tím sám sebe.
	AI_Output(other,self,"DIA_Garond_DobarOut_01_08");	//Rozumím.
	DayParlafDead = Wld_GetDay();
	MIS_DobarOut = LOG_Running;
	Log_CreateTopic(TOPIC_DobarOut,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DobarOut,LOG_Running);
	B_LogEntry(TOPIC_DobarOut,"Během mé nepřítomnosti na hradě došlo k mnoha změnám, to platí nejenom s drakobijci. Kovář Dobar a jeho asistent Parlaf se rozhodli pro útěk z hradu. Budu se muset na ně podívat.");
};

instance DIA_Garond_DobarOut_Done(C_Info)
{
	npc = PAL_250_Garond;
	nr = 2;
	condition = DIA_Garond_DobarOut_Done_Condition;
	information = DIA_Garond_DobarOut_Done_Info;
	permanent = FALSE;
	description = "Našel jsem Parlafa.";
};

func int DIA_Garond_DobarOut_Done_Condition()
{
	if((MIS_DobarOut == LOG_Running) && ((ParlafOnPlace == TRUE) || (ParlafOnPlaceDead == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Garond_DobarOut_Done_Info()
{
	AI_Output(other,self,"DIA_Garond_DobarOut_Done_01_00");	//Našel jsem Parlafa.
	AI_Output(self,other,"DIA_Garond_DobarOut_Done_01_01");	//Kde bylo to štěně?

	if(ParlafNoExcort == TRUE)
	{
		B_GivePlayerXP(100);
		AI_Output(other,self,"DIA_Garond_DobarOut_Done_01_02");	//Schoval se v jeskyni nedaleko hradu.
		AI_Output(other,self,"DIA_Garond_DobarOut_Done_01_03");	//Požádal mě, abych ho doprovodil zpátky do hradu, ale bohužel se mi nadobro ztratil.
		AI_Output(self,other,"DIA_Garond_DobarOut_Done_01_04");	//No... aspoň se mu podařilo utéct.
		AI_Output(self,other,"DIA_Garond_DobarOut_Done_01_05");	//Nemůžu říct, že by mi nějak chyběl.
		B_LogEntry(TOPIC_DobarOut,"Řekl jsem Garondovi, že živého sem Parlafa nikdy nedostanu.");
		GarondKnowParlaf = TRUE;

		if(GarondKnowDobar == TRUE)
		{
			MIS_DobarOut = LOG_SUCCESS;
			Log_SetTopicStatus(TOPIC_DobarOut,LOG_SUCCESS);
			B_LogEntry_Quiet(TOPIC_DobarOut,"Domnívám se, že moje hledání je u konce.");
		};
	}
	else if(ParlafOnPlaceDead == TRUE)
	{
		AI_Output(other,self,"DIA_Garond_DobarOut_Done_01_06");	//Schoval se v jeskyni nedaleko hradu, bohužel než jsem se k němu stihl dostat, zemřel už hlady.
		AI_Output(self,other,"DIA_Garond_DobarOut_Done_01_07");	//(sarkasticky) Cože, tam není jídlo lepší než tady? Zatracení fňukalové...
		AI_Output(other,self,"DIA_Garond_DobarOut_Done_01_08");	//Není na místě urážet mrtvé.
		AI_Output(self,other,"DIA_Garond_DobarOut_Done_01_09");	//Och, Innosi. VŠICHNI jsme na půl mrtví! Čekáš, že projevím lítost za zbabělého dezertéra?
		AI_Output(other,self,"DIA_Garond_DobarOut_Done_01_10");	//Nic vám nevnucuju.
		B_LogEntry(TOPIC_DobarOut,"Ohlásil jsem Garondovy Parlafovu smrt. Zdá se, že na něj moc nezapůsobyla.");
		GarondKnowParlaf = TRUE;

		if(GarondKnowDobar == TRUE)
		{
			MIS_DobarOut = LOG_SUCCESS;
			Log_SetTopicStatus(TOPIC_DobarOut,LOG_SUCCESS);
			B_LogEntry_Quiet(TOPIC_DobarOut,"Parlaf je zpátky.");
		};
	}
	else if(ParlafOnPlace == TRUE)
	{
		B_GivePlayerXP(250);
		AI_Output(other,self,"DIA_Garond_DobarOut_Done_01_11");	//Schoval se v jeskyni vedle hradu. Jen díky mně se mu podařilo přežít.
		AI_Output(other,self,"DIA_Garond_DobarOut_Done_01_12");	//Požádal mě, abych ho doprovodil zpátky do hradu. Myslím, že si uvědomí, že udělal chybu.
		AI_Output(self,other,"DIA_Garond_DobarOut_Done_01_13");	//No... v takové situaci bych ho hodil do vězení. Ale jestliže si uvědomil pošetilost svého činu, nebudu to dělat.
		AI_Output(self,other,"DIA_Garond_DobarOut_Done_01_14");	//Kromě toho je to poučení pro něj - ať pomůže tomu drakobijci jménem Jan v kovárně.
		AI_Output(other,self,"DIA_Garond_DobarOut_Done_01_15");	//Dobře, řeknu mu to.
		B_LogEntry(TOPIC_DobarOut,"Dovedl jsem Parlafa zpět do hradu za Garondem a ten mu přikázal, aby šel pomáhat do kovárny.");
		GarondKnowParlaf = TRUE;
 
		if(GarondKnowDobar == TRUE)
		{
			MIS_DobarOut = LOG_SUCCESS;
			Log_SetTopicStatus(TOPIC_DobarOut,LOG_SUCCESS);
			B_LogEntry_Quiet(TOPIC_DobarOut,"Hádám, že moje hledání je u konce.");
		};
	};
};

instance DIA_Garond_DobarOut_Xone(C_Info)
{
	npc = PAL_250_Garond;
	nr = 2;
	condition = DIA_Garond_DobarOut_Xone_Condition;
	information = DIA_Garond_DobarOut_Xone_Info;
	permanent = FALSE;
	description = "Našel jsem Dobara.";
};

func int DIA_Garond_DobarOut_Xone_Condition()
{
	if((MIS_DobarOut == LOG_Running) && (DobarOnPlace == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Garond_DobarOut_Xone_Info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_Garond_DobarOut_Xone_01_00");	//Našel jsem Dobara.
	AI_Output(self,other,"DIA_Garond_DobarOut_Xone_01_01");	//Co se mu stalo?
	AI_Output(other,self,"DIA_Garond_DobarOut_Xone_01_02");	//Je mrtvý. 
	AI_Output(self,other,"DIA_Garond_DobarOut_Xone_01_03");	//Nejsem vůbec překvapen touto zprávou. Ano, byl to dobrý kovář, ale plakat určitě nebudu.
	GarondKnowDobar = TRUE;
	B_LogEntry(TOPIC_DobarOut,"Řekl jsem Garondovi, že Dobar je mrtvý.");

	if(GarondKnowParlaf == TRUE)
	{
		MIS_DobarOut = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_DobarOut,LOG_SUCCESS);
		B_LogEntry_Quiet(TOPIC_DobarOut,"Hádám, že moje hledání je u konce.");
	};
};

instance DIA_Garond_KAP5_EXIT(C_Info)
{
	npc = PAL_250_Garond;
	nr = 999;
	condition = DIA_Garond_KAP5_EXIT_Condition;
	information = DIA_Garond_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Garond_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Garond_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Garond_PERM5(C_Info)
{
	npc = PAL_250_Garond;
	nr = 59;
	condition = DIA_Garond_PERM5_Condition;
	information = DIA_Garond_PERM5_Info;
	permanent = TRUE;
	description = "Jak to vypadá?";
};


func int DIA_Garond_PERM5_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Garond_PERM5_Info()
{
	AI_Output(other,self,"DIA_Garond_PERM5_15_00");	//Jak to vypadá?
	if(MIS_OCGateOpen == TRUE)
	{
		AI_Output(self,other,"DIA_Garond_PERM5_10_01");	//Zatraceně! Nějaký parchant nechal hlavní bránu otevřenou. Teď je z nás žrádlo pro vlky.
		AI_Output(self,other,"DIA_Garond_PERM5_10_02");	//Až dostanu toho zrádce do rukou...
	}
	else
	{
		AI_Output(self,other,"DIA_Garond_PERM5_10_03");	//Pokud Hagen nepřijde co nejdřív, pochcípáme tady jako mouchy.
	};
};


instance DIA_Garond_KAP6_EXIT(C_Info)
{
	npc = PAL_250_Garond;
	nr = 999;
	condition = DIA_Garond_KAP6_EXIT_Condition;
	information = DIA_Garond_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Garond_KAP6_EXIT_Condition()
{
	if(Kapitel >= 6)
	{
		return TRUE;
	};
};

func void DIA_Garond_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GAROND_MADERZ(C_Info)
{
	npc = PAL_250_Garond;
	nr = 1;
	condition = dia_garond_maderz_condition;
	information = dia_garond_maderz_info;
	permanent = FALSE;
	description = "Mám pro tebe novinky.";
};


func int dia_garond_maderz_condition()
{
	if((MIS_MADERZ == LOG_Running) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void dia_garond_maderz_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Garond_MadErz_01_00");	//Mám pro tebe novinky.
	AI_Output(other,self,"DIA_Garond_MadErz_01_04");	//Nedaleko ruin starého skřetího města jsem našel skladiště rudy. Je tam minimálně kolem dvaceti beden!
	AI_Output(self,other,"DIA_Garond_MadErz_01_05");	//Ne! Je to pravda?
	AI_Output(self,other,"DIA_Garond_MadErz_01_07");	//Nevěřím svým uším! To jsou jednoduše vynikající zprávy!
	AI_Output(self,other,"DIA_Garond_MadErz_01_08");	//Dvacet beden je dvakrát více, než máme!
	AI_Output(self,other,"DIA_Garond_MadErz_01_10");	//Ale nesmíme se radovat předčasně.
	AI_Output(self,other,"DIA_Garond_MadErz_01_12");	//Měli bychom vyřešit, co s tou nalezenou rudou.
	AI_Output(other,self,"DIA_Garond_MadErz_01_13");	//Myslím, že pro začátek bys tam měl poslat pár lidí.
	AI_Output(self,other,"DIA_Garond_MadErz_01_14");	//To je pravda, pošlu tam nějaké rytíře. Koneckonců je to jediná věc, kterou mohu udělat.
	AI_Output(self,other,"DIA_Garond_MadErz_01_21");	//A ty - ty si zasloužíš odměnu.
	AI_Output(self,other,"DIA_Garond_MadErz_01_22");	//Vyber si, co potřebuješ!
	MIS_MADERZ = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_MADERZ,LOG_SUCCESS);
	B_LogEntry(TOPIC_MADERZ,"Informoval jsem Garonda o rudě nalezené poblíž ruin skřetího města. Byl velice rád. Poslal tam pár lidí, kteří rudu přepraví na hrad.");
	Info_ClearChoices(dia_garond_maderz);
	Info_AddChoice(dia_garond_maderz,"Zlato.",dia_garond_maderz_gold);
	Info_AddChoice(dia_garond_maderz,"Elixír many.",dia_garond_maderz_mana);
	Info_AddChoice(dia_garond_maderz,"Elixír života.",dia_garond_maderz_health);
	Info_AddChoice(dia_garond_maderz,"Elixír obratnosti.",dia_garond_maderz_dex);
	Info_AddChoice(dia_garond_maderz,"Elixír síly.",dia_garond_maderz_str);
};

func void dia_garond_maderz_gold()
{
	AI_Output(other,self,"DIA_Garond_MadErz_Gold_01_00");	//Zlato neuškodí.
	AI_Output(self,other,"DIA_Garond_MadErz_Gold_01_01");	//Dobrá! Tady máš tisíc zlatých.
	B_GiveInvItems(self,other,ItMi_Gold,1000);
	AI_Output(self,other,"DIA_Garond_MadErz_Gold_01_02");	//Doufám, že je utratíš za rozumnou věc.
	Info_ClearChoices(dia_garond_maderz);
	Wld_InsertNpc(pal_9165_ritter,"WP_ORCTEMPLEORE_01");
	Wld_InsertNpc(pal_9166_ritter,"WP_ORCTEMPLEORE_02");
	Wld_InsertNpc(pal_9167_ritter,"WP_ORCTEMPLEORE_03");
};

func void dia_garond_maderz_mana()
{
	AI_Output(other,self,"DIA_Garond_MadErz_Mana_01_00");	//Dej mi elixír many.
	AI_Output(self,other,"DIA_Garond_MadErz_Mana_01_01");	//Tady je.
	B_GiveInvItems(self,other,ItPo_Perm_Mana,1);
	AI_Output(self,other,"DIA_Garond_MadErz_Mana_01_02");	//Doufám, že ti pomůže.
	Info_ClearChoices(dia_garond_maderz);
	Wld_InsertNpc(pal_9165_ritter,"WP_ORCTEMPLEORE_01");
	Wld_InsertNpc(pal_9166_ritter,"WP_ORCTEMPLEORE_02");
	Wld_InsertNpc(pal_9167_ritter,"WP_ORCTEMPLEORE_03");
};

func void dia_garond_maderz_str()
{
	AI_Output(other,self,"DIA_Garond_MadErz_Str_01_00");	//Dej mi elixír síly.
	AI_Output(self,other,"DIA_Garond_MadErz_Str_01_01");	//Tady je.
	B_GiveInvItems(self,other,ItPo_Perm_STR,1);
	AI_Output(self,other,"DIA_Garond_MadErz_Str_01_02");	//Doufám, že ti pomůže.
	Info_ClearChoices(dia_garond_maderz);
	Wld_InsertNpc(pal_9165_ritter,"WP_ORCTEMPLEORE_01");
	Wld_InsertNpc(pal_9166_ritter,"WP_ORCTEMPLEORE_02");
	Wld_InsertNpc(pal_9167_ritter,"WP_ORCTEMPLEORE_03");
};

func void dia_garond_maderz_dex()
{
	AI_Output(other,self,"DIA_Garond_MadErz_Dex_01_00");	//Dej mi elixír obratnosti.
	AI_Output(self,other,"DIA_Garond_MadErz_Dex_01_01");	//Tady je.
	B_GiveInvItems(self,other,ItPo_Perm_DEX,1);
	AI_Output(self,other,"DIA_Garond_MadErz_Dex_01_02");	//Doufám, že ti pomůže.
	Info_ClearChoices(dia_garond_maderz);
	Wld_InsertNpc(pal_9165_ritter,"WP_ORCTEMPLEORE_01");
	Wld_InsertNpc(pal_9166_ritter,"WP_ORCTEMPLEORE_02");
	Wld_InsertNpc(pal_9167_ritter,"WP_ORCTEMPLEORE_03");
};

func void dia_garond_maderz_health()
{
	AI_Output(other,self,"DIA_Garond_MadErz_Health_01_00");	//Dej mi elixír života.
	AI_Output(self,other,"DIA_Garond_MadErz_Health_01_01");	//Tady je.
	B_GiveInvItems(self,other,ItPo_Perm_Health,1);
	AI_Output(self,other,"DIA_Garond_MadErz_Health_01_02");	//Doufám, že ti pomůže.
	Info_ClearChoices(dia_garond_maderz);
	Wld_InsertNpc(pal_9165_ritter,"WP_ORCTEMPLEORE_01");
	Wld_InsertNpc(pal_9166_ritter,"WP_ORCTEMPLEORE_02");
	Wld_InsertNpc(pal_9167_ritter,"WP_ORCTEMPLEORE_03");
};


instance DIA_GAROND_CAPTURED(C_Info)
{
	npc = PAL_250_Garond;
	nr = 12;
	condition = dia_garond_captured_condition;
	information = dia_garond_captured_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_garond_captured_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_ORCGREATWAR == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_garond_captured_info()
{
	B_GivePlayerXP(300);
	AI_Output(self,other,"DIA_Garond_Captured_01_00");	//Jsi to ty? Jak ses sem dostal?
	AI_Output(other,self,"DIA_Garond_Captured_01_94");	//To je vlastně jedno. Radši mi řekni - co se to tady stalo?
	AI_Output(self,other,"DIA_Garond_Captured_01_05");	//Nevím! Poslední věc, kterou si pamatuji, je rána do hlavy, po které jsem ztratil vědomí.
	AI_Output(self,other,"DIA_Garond_Captured_01_06");	//Probudil jsem se až tady spolu s ostatními chlapy.
	KNOWABOUTGAROND = TRUE;

	if(MIS_RESCUEGAROND == LOG_Running)
	{
		B_LogEntry(TOPIC_RESCUEGAROND,"Lord Hagen se určitě rád dozví, že Garond a jeho lidé žijí. Teď bych jim však měl z téhle zapeklité situace pomoci.");
	};
	if(MIS_NEWSSURVIVERS == LOG_Running)
	{
		B_LogEntry(TOPIC_NEWSSURVIVERS,"Dostal jsem se na hrad, který obsadili skřeti. Zpočátku jsem ani nevěřil svým očím, když jsem viděl Garonda a jeho lidi živé a zdravé. Z nějakého důvodu je skřeti jenom zajali. Měl bych je odsud nějak dostat.");
	};
	if(MIS_STURMCASTLE == LOG_Running)
	{
		B_LogEntry(TOPIC_STURMCASTLE,"Zpočátku jsem ani nevěřil svým očím, když jsem viděl Garonda a jeho lidi živé a zdravé. Z nějakého důvodu je skřeti jenom zajali. Měl bych je odsud nějak dostat. Nejlehčí by zřejmě bylo vyklidit hrad od skřetů.");
	};
	if(DGJMOVEPALADIN == TRUE)
	{
		b_readydgjmove();
	};
};

instance DIA_GAROND_ABOUTSLAVE(C_Info)
{
	npc = PAL_250_Garond;
	nr = 12;
	condition = DIA_GAROND_ABOUTSLAVE_condition;
	information = DIA_GAROND_ABOUTSLAVE_info;
	permanent = FALSE;
	description = "A kde jsou ostatní vězni?";
};

func int DIA_GAROND_ABOUTSLAVE_condition()
{
	if((MIS_ORCGREATWAR == LOG_Running) && (PALADINCASTELFREE == FALSE) && (CASTLEISFREE == FALSE))
	{
		return TRUE;
	};
};

func void DIA_GAROND_ABOUTSLAVE_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_GAROND_ABOUTSLAVE_01_00");	//A kde jsou ostatní vězni?
	AI_Output(self,other,"DIA_GAROND_ABOUTSLAVE_01_01");	//Skřeti je někam odvedli, ale nevím kam.
	AI_Output(self,other,"DIA_GAROND_ABOUTSLAVE_01_02");	//Možná je drží v nějakém skřetím dolu.
	AI_Output(self,other,"DIA_GAROND_ABOUTSLAVE_01_03");	//Nebo hůř, prostě je zmasakrovali.
};

instance DIA_GAROND_FINDAWAY(C_Info)
{
	npc = PAL_250_Garond;
	nr = 12;
	condition = dia_garond_findaway_condition;
	information = dia_garond_findaway_info;
	permanent = FALSE;
	description = "Musíte se odsud nějak dostat!";
};

func int dia_garond_findaway_condition()
{
	if((MIS_ORCGREATWAR == LOG_Running) && (PALADINCASTELFREE == FALSE) && (CASTLEISFREE == FALSE))
	{
		return TRUE;
	};
};

func void dia_garond_findaway_info()
{
	AI_Output(other,self,"DIA_Garond_FindAway_01_00");	//Musíte se odsud nějak dostat!
	AI_Output(self,other,"DIA_Garond_FindAway_01_01");	//A co asi tak navrhuješ?
	AI_Output(self,other,"DIA_Garond_FindAway_01_02");	//Hrad padl a je plný skřetů! Než se dostaneme k bráně, je po nás.
	AI_Output(other,self,"DIA_Garond_FindAway_01_04");	//Něco vymyslím.
	AI_Output(self,other,"DIA_Garond_FindAway_01_05");	//To doufám. V každém případě mě napadá jen jedna možnost.
	AI_Output(self,other,"DIA_Garond_FindAway_01_09");	//Zabít všechny skřety a osvobodit hrad.
	AI_Output(self,other,"DIA_Garond_FindAway_01_10");	//Nicméně pochybuji, že by to kdokoli dokázal - včetně tebe.
};


instance DIA_GAROND_PALADINFREE(C_Info)
{
	npc = PAL_250_Garond;
	nr = 1;
	condition = dia_garond_paladinfree_condition;
	information = dia_garond_paladinfree_info;
	permanent = FALSE;
	description = "Pohyb! Jste volní.";
};


func int dia_garond_paladinfree_condition()
{
	if((MIS_ORCGREATWAR == LOG_Running) && ((CANFREEPALADIN == TRUE) || (CASTLEISFREE == TRUE)))
	{
		return TRUE;
	};
};

func void dia_garond_paladinfree_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Garond_PaladinFree_01_00");	//Pohyb! Jste volní.
	AI_Output(self,other,"DIA_Garond_PaladinFree_01_01");	//Co? (zmateně) Ty jsi to dokázal?
	if(CASTLEISFREE == TRUE)
	{
		AI_Output(other,self,"DIA_Garond_PaladinFree_01_02");	//Hrad jsme znovu obsadili my!
		AI_Output(self,other,"DIA_Garond_PaladinFree_01_03");	//Opravdu?! Opravdu si porazil skřety v pevnosti?
		AI_Output(self,other,"DIA_Garond_PaladinFree_01_05");	//Neuvěřitelné! Nemohu tomu uvěřit!
		AI_Output(self,other,"DIA_Garond_PaladinFree_01_09");	//Ale pro začátek pusť mě a mé chlapy z těch zatracených cel.
		PALADINCASTELFREE = TRUE;
		if(MIS_NEWSSURVIVERS == LOG_Running)
		{
			MIS_NEWSSURVIVERS = LOG_SUCCESS;
			Log_SetTopicStatus(TOPIC_NEWSSURVIVERS,LOG_SUCCESS);
		};
		if(MIS_STURMCASTLE == LOG_Running)
		{
			MIS_STURMCASTLE = LOG_SUCCESS;
			Log_SetTopicStatus(TOPIC_STURMCASTLE,LOG_SUCCESS);
		};
		if(MIS_RESCUEGAROND == LOG_Running)
		{
			B_LogEntry(TOPIC_RESCUEGAROND,"Osvobodil jsem Garonda a jeho lidi. Teď se musíme co nejrychleji dostat z údolí.");
		};
		AI_StopProcessInfos(self);
		if(DGJMOVEPALADIN == TRUE)
		{
			b_readydgjmove();
		};
	}
	else if(CANFREEPALADIN == TRUE)
	{
		AI_Output(other,self,"DIA_Garond_PaladinFree_01_12");	//Musíme se dostat co nejrychleji ven!
		AI_Output(self,other,"DIA_Garond_PaladinFree_01_13");	//Ha! A kde asi tak půjdeme? Všude jsou skřeti.
		AI_Output(other,self,"DIA_Garond_PaladinFree_01_17");	//Dojednal jsem s jejich vůdcem vaše propuštění.
		AI_Output(other,self,"DIA_Garond_PaladinFree_01_18");	//Takže pokud tady neplánujete čekat, až skřeti změní názor, měli byste se pohnout.
		AI_Output(self,other,"DIA_Garond_PaladinFree_01_19");	//Hmmm... Když to říkáš.
		AI_Output(self,other,"DIA_Garond_PaladinFree_01_20");	//Ale pro začátek pusť mě a mé chlapy z těch zatracených cel.
		PALADINCASTELFREE = TRUE;
		SAFEFLAGPALADIN = TRUE;
		if(MIS_NEWSSURVIVERS == LOG_Running)
		{
			MIS_NEWSSURVIVERS = LOG_SUCCESS;
			Log_SetTopicStatus(TOPIC_NEWSSURVIVERS,LOG_SUCCESS);
		};
		if(MIS_STURMCASTLE == LOG_Running)
		{
			MIS_STURMCASTLE = LOG_SUCCESS;
			Log_SetTopicStatus(TOPIC_STURMCASTLE,LOG_SUCCESS);
		};
		if(MIS_RESCUEGAROND == LOG_Running)
		{
			B_LogEntry(TOPIC_RESCUEGAROND,"Osvobodil jsem Garonda a jeho lidi. Teď se musíme co nejrychleji dostat z údolí.");
		};
		AI_StopProcessInfos(self);
		if(DGJMOVEPALADIN == TRUE)
		{
			b_readydgjmove();
		};
	};
};


instance DIA_GAROND_WHATWAIT(C_Info)
{
	npc = PAL_250_Garond;
	nr = 1;
	condition = dia_garond_whatwait_condition;
	information = dia_garond_whatwait_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_garond_whatwait_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (PALADINCASTELFREE == TRUE) && ((OLDCAMDGATEOPEN_01 == FALSE) || (OLDCAMDGATEOPEN_02 == FALSE) || (OLDCAMDGATEOPEN_03 == FALSE)))
	{
		return TRUE;
	};
};

func void dia_garond_whatwait_info()
{
	AI_Output(self,other,"DIA_Garond_WhatWait_01_00");	//Necháš nás tu sedět ještě dlouho? Na co čekáš?
	AI_Output(self,other,"DIA_Garond_WhatWait_01_01");	//No tak, pospěš si!
	AI_StopProcessInfos(self);
};


instance DIA_GAROND_PEOPLEFREE(C_Info)
{
	npc = PAL_250_Garond;
	nr = 1;
	condition = dia_garond_peoplefree_condition;
	information = dia_garond_peoplefree_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_garond_peoplefree_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (PALADINCASTELFREE == TRUE) && (OLDCAMDGATEOPEN_01 == TRUE) && (OLDCAMDGATEOPEN_02 == TRUE) && (OLDCAMDGATEOPEN_03 == TRUE))
	{
		return TRUE;
	};
};

func void dia_garond_peoplefree_info()
{
	AI_Output(self,other,"DIA_Garond_PeopleFree_01_00");	//Bezva! O moc lepší!
	AI_Output(other,self,"DIA_Garond_PeopleFree_01_01");	//Teď mizíme!
	if(CANFREEPALADIN == TRUE)
	{
		AI_Output(other,self,"DIA_Garond_PeopleFree_01_02");	//Musíme se dostat ke skupině paladinů, která čeká při východu z údolí.
		AI_Output(self,other,"DIA_Garond_PeopleFree_01_03");	//Dobrá, pak neztrácejme čas. Veď nás.
		ALLAWAYFROMCASTLE = TRUE;
		Info_ClearChoices(dia_garond_peoplefree);
		Info_AddChoice(dia_garond_peoplefree,"Jdeme!",dia_garond_peoplefree_go);
	}
	else if(CASTLEISFREE == TRUE)
	{
		AI_Output(other,self,"DIA_Garond_PeopleFree_01_05");	//Musíme okamžitě zmizet.
		AI_Output(self,other,"DIA_Garond_PeopleFree_01_06");	//Ale proč?
		AI_Output(other,self,"DIA_Garond_PeopleFree_01_07");	//Skřeti sem brzy pošlou své jednotky, a pak budeme mít problémy.
		AI_Output(self,other,"DIA_Garond_PeopleFree_01_14");	//Hmmm... (zamyšleně) No dobrá.
		AI_Output(self,other,"DIA_Garond_PeopleFree_01_15");	//Pak neztrácejme čas a honem odsud!
		ALLAWAYFROMCASTLE = TRUE;
		Info_ClearChoices(dia_garond_peoplefree);
		Info_AddChoice(dia_garond_peoplefree,"Jdeme!",dia_garond_peoplefree_go);
	};
};

func void dia_garond_peoplefree_go()
{
	AI_Output(other,self,"DIA_Garond_PeopleFree_Go_01_01");	//Jdeme!
	AI_StopProcessInfos(self);
	b_paladinawayone();
};


instance DIA_GAROND_PEOPLEAWAY(C_Info)
{
	npc = PAL_250_Garond;
	nr = 1;
	condition = dia_garond_peopleaway_condition;
	information = dia_garond_peopleaway_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_garond_peopleaway_condition()
{
	if((ALLAWAYFROMCASTLE == TRUE) && (GARONDARRIVESEXIT == TRUE))
	{
		return TRUE;
	};
};

func void dia_garond_peopleaway_info()
{
	B_GivePlayerXP(200);
	AI_Output(self,other,"DIA_Garond_PeopleAway_01_00");	//Tak jsme tady! Myslím, že tu jsme už v bezpečí.
	AI_Output(other,self,"DIA_Garond_PeopleAway_01_03");	//Ale pořád musíme dál. Každá minuta je drahá!
	AI_Output(self,other,"DIA_Garond_PeopleAway_01_04");	//Souhlasím. Tak projdi průsmykem, budeme hned za tebou.
	AI_Output(other,self,"DIA_Garond_PeopleAway_01_05");	//Dobře. Potkáme se na druhé straně.
	ALLAWAYFROMPLACE = TRUE;
	AI_StopProcessInfos(self);
	b_paladinawaytwo();
};


instance DIA_GAROND_WHATWAITAGAIN(C_Info)
{
	npc = PAL_250_Garond;
	nr = 1;
	condition = dia_garond_whatwaitagain_condition;
	information = dia_garond_whatwaitagain_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_garond_whatwaitagain_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (ALLAWAYFROMPLACE == TRUE))
	{
		return TRUE;
	};
};

func void dia_garond_whatwaitagain_info()
{
	AI_Output(self,other,"DIA_Garond_WhatWaitAgain_01_00");	//No tak, jdi! Jsme hned za tebou.
	AI_StopProcessInfos(self);
};

instance DIA_Garond_OrcTraitor(C_Info)
{
	npc = PAL_250_Garond;
	nr = 1;
	condition = DIA_Garond_OrcTraitor_Condition;
	information = DIA_Garond_OrcTraitor_Info;
	permanent = FALSE;
	description = "Mám něco pro tebe.";
};

func int DIA_Garond_OrcTraitor_Condition()
{
	if((MIS_HeroOrcJoin_T2 == LOG_Running) && (Npc_HasItems(other,ItWr_UrKarrasLetter) >= 1) && (OrcClanBossLetterDeliver == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Garond_OrcTraitor_Info()
{
	var int RanGonezPlace;

	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Garond_OrcTraitor_01_00");	//Mám něco pro tebe.
	AI_Output(self,other,"DIA_Garond_OrcTraitor_01_01");	//Doufám, že je to něco opravdu důležitého a ne nějaká prkotina.
	AI_Output(other,self,"DIA_Garond_OrcTraitor_01_02");	//Tady, podívej.
	B_GiveInvItems(other,self,ItWr_UrKarrasLetter,1);
	AI_Output(self,other,"DIA_Garond_OrcTraitor_01_03");	//Co to je?
	AI_Output(other,self,"DIA_Garond_OrcTraitor_01_04");	//Zpráva skřetího generála jednomu z vůdců horských kmenů. Už máš zájem?
	AI_Output(self,other,"DIA_Garond_OrcTraitor_01_05");	//(se zájmem) No tak, nech mě podívat...
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Garond_OrcTraitor_01_06");	//Ale tato zpráva je psána skřetím jazykem!
	AI_Output(other,self,"DIA_Garond_OrcTraitor_01_07");	//Samozřejmě, že ano, vždyť ji psal skřet! Potřebuješ tlumočníka?
	AI_Output(self,other,"DIA_Garond_OrcTraitor_01_08");	//Ne, přečtu to. (rozezleně) Za ty dlouhé roky, které už s těmi stvůrami válčím, jsem pochytil kousek z jejich jazyka.
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Garond_OrcTraitor_01_09");	//Nevěřím svým očím! Tohle, cos přinesl - to jsou vskutku velice důležité informace!
	AI_Output(other,self,"DIA_Garond_OrcTraitor_01_10");	//Co se tam píše?
	AI_Output(self,other,"DIA_Garond_OrcTraitor_01_11");	//Skřeti se prý chystají k útoku na hrad a shromažďují veškeré zálohy.
	AI_Output(self,other,"DIA_Garond_OrcTraitor_01_12");	//Chtějí nás překvapit útokem ze všech stran. Nu, teď se jim to rozhodně nepovede.
	AI_Output(self,other,"DIA_Garond_OrcTraitor_01_13");	//Zdvojnásobíme stráže a dobudujeme naše opevnění.
	AI_Output(other,self,"DIA_Garond_OrcTraitor_01_14");	//Máš na to dost mužů?
	AI_Output(self,other,"DIA_Garond_OrcTraitor_01_15");	//Zatím ano. Naše situace není nejlepší, ale máme dostatek lidí, abychom ubránili hrad z více stran.
	AI_Output(self,other,"DIA_Garond_OrcTraitor_01_16");	//Samozřejmě, že bez dodatečných opatření by to pro nás bylo složitější.
	AI_Output(self,other,"DIA_Garond_OrcTraitor_01_17");	//Ale naštěstí teď máme dost času, abychom se na útok dobře připravili.
	AI_Output(other,self,"DIA_Garond_OrcTraitor_01_18");	//Jsem rád, že ti tahle informace pomohla.
	AI_Output(self,other,"DIA_Garond_OrcTraitor_01_19");	//Tvoje pomoc v téhle záležitosti byla neocenitelná. Děkuji ti jménem všech paladinů v pevnosti.
	AI_Output(self,other,"DIA_Garond_OrcTraitor_01_20");	//Tady, vezmi si tohle jako odměnu...
 	B_GiveInvItems(self,other,ItPo_Perm_Health,1);
	AI_Output(self,other,"DIA_Garond_OrcTraitor_01_21");	//Sám víš, že naše zásoby jsou velice omezené.
	AI_Output(self,other,"DIA_Garond_OrcTraitor_01_22");	//Ale prostě bych ti nemohl nepoděkovat za to, cos pro nás udělal.
	OrcTraitor = TRUE;
	B_LogEntry(TOPIC_HeroOrcJoin_T2,"Místo toho, abych předal Ur-Karrasovu zprávu vůdci klanu Vysoké skály jsem ji odnesl lidem na hradu. Z dopisu vyplynulo, že skřeti se připravují na další útok a shromažďují posily od ostatních klanů. Jak jsem předpokládal, tahle informace byla pro paladiny velmi důležitá. Po téhle zradě bych se už však raději neměl vracet do Skřetího města. Skřeti si určitě všimli moji přítomnost na hradě a vyšlou k Ur-Karrasovi posla, aby mu o mé zradě řekl. Jestli se mi nepovede toho posla zastavit, určitě to Ur-Karrasovi ohlásí. Měl bych si pospíšit, protože mi zřejmě zůstává jen velmi málo času...");

	RanGonezPlace = Hlp_Random(100);
	DayGonezStart = Wld_GetDay();

	if(RanGonezPlace >= 60)
	{
		Wld_InsertNpc(OrkElite_Addon2_Gonez,"FP_ROAM_URKARRAS_GONEZ_01");
	}
	else if(RanGonezPlace >= 30)
	{
		Wld_InsertNpc(OrkElite_Addon2_Gonez,"FP_ROAM_URKARRAS_GONEZ_02");
	}
	else if(RanGonezPlace >= 0)
	{
		Wld_InsertNpc(OrkElite_Addon2_Gonez,"FP_ROAM_URKARRAS_GONEZ_03");
	};
};

instance DIA_Garond_PICKPOCKET(C_Info)
{
	npc = PAL_250_Garond;
	nr = 900;
	condition = DIA_Garond_pickpocket_condition;
	information = DIA_Garond_pickpocket_info;
	permanent = TRUE;
	description = "(Pokusit se ukrást jeho klíč)";
};

func int DIA_Garond_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) >= 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Garond_pickpocket_info()
{
	Info_ClearChoices(DIA_Garond_pickpocket);
	Info_AddChoice(DIA_Garond_pickpocket,Dialog_Back,DIA_Garond_pickpocket_back);
	Info_AddChoice(DIA_Garond_pickpocket,DIALOG_PICKPOCKET,DIA_Garond_pickpocket_doit);
};

func void DIA_Garond_pickpocket_doit()
{
	AI_PlayAni(other,"T_STEAL");
	AI_Wait(other,1);

	if((other.attribute[ATR_DEXTERITY] + PickPocketBonusCount) >= 150)
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
		B_GiveInvItems(self,other,ItKe_Garond,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Garond_pickpocket);
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

func void DIA_Garond_pickpocket_back()
{
	Info_ClearChoices(DIA_Garond_pickpocket);
};
