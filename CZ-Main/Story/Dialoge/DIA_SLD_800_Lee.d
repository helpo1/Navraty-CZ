/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.02:

func void DIA_Lee_PETZMASTER_Info - opraveno nastavení proměnné prvního setkání


v1.01:

(2x) TOPIC_ORcGREATWAR - TOPIC_ORCGREATWAR (cyrilice -> latinka)

*/



instance DIA_Lee_EXIT(C_Info)
{
	npc = SLD_800_Lee;
	nr = 999;
	condition = DIA_Lee_EXIT_Condition;
	information = DIA_Lee_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lee_EXIT_Condition()
{
	if(Kapitel <= 3)
	{
		return TRUE;
	};
};

func void DIA_Lee_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

var int Lee_LastPetzCounter;
var int Lee_LastPetzCrime;

instance DIA_Lee_PMSchulden(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = DIA_Lee_PMSchulden_Condition;
	information = DIA_Lee_PMSchulden_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Lee_PMSchulden_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Lee_Schulden > 0) && (B_GetGreatestPetzCrime(self) <= Lee_LastPetzCrime))
	{
		return TRUE;
	};
};

func void dia_lee_petzmaster_attackmurder()
{
	var string concatText;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_HumanMurderedHuman,0);
	GLOBAL_MAKE_BANDIT_FORFARM = 1;
	concatText = "Žoldáci mě mají za banditu!";
	AI_Print(concatText);
};

func void dia_lee_pmschulden_attackmurder()
{
	var string concatText;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_HumanMurderedHuman,0);
	GLOBAL_MAKE_BANDIT_FORFARM = 1;
	concatText = "Žoldáci mě mají za banditu!";
	AI_Print(concatText);
};

func void DIA_Lee_PMSchulden_Info()
{
	var int diff;
	var string concatText1;
	var string concatText2;
	var string concattextschulden;
	var string tsettext1;
	var string tsettext2;
	var string tsettext3;
	var int temp1;

	AI_Output(self,other,"DIA_Lee_PMSchulden_04_00");	//Přinášíš peníze pro Onara?
	temp1 = 0;
	if(GLOBAL_FARM_MURDER > 2)
	{
		temp1 = 1;
	};
	if(GLOBAL_FARM_THEFT > 5)
	{
		temp1 = 1;
	};
	if(GLOBAL_FARM_ATTACK > 5)
	{
		temp1 = 1;
	};
	if(temp1 == 1)
	{
		if(GLOBAL_FARM_MURDER > 2)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_FARM_MURDER),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_MURDERCOUNT2_FARM);
			tsettext3 = ConcatStrings(PRINT_MURDERCOUNT_FARM,tsettext2);
			AI_Output(self,other,"DIA_Lee_PMSchulden_08_36");	//Už je pozdě...
			AI_Output(self,other,"DIA_Lee_PMSchulden_08_37");	//Měl sis to promyslet, než někoho zabiješ.
			AI_Output(self,other,"DIA_Lee_PMSchulden_08_38");	//Moji chlapi a Onar chtějí tvou smrt...
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other,"DIA_Lee_PMSchulden_08_39");	//Skončím to s tebou tady a teď!
		}
		else if(GLOBAL_FARM_ATTACK > 5)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_FARM_ATTACK),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_ATTACKCOUNT2_FARM);
			tsettext3 = ConcatStrings(PRINT_ATTACKCOUNT_FARM,tsettext2);
			AI_Output(self,other,"DIA_Lee_PMSchulden_08_40");	//Už je pozdě...
			AI_Output(self,other,"DIA_Lee_PMSchulden_08_41");	//Měl sis to promyslet, než někoho napadneš.
			AI_Output(self,other,"DIA_Lee_PMSchulden_08_42");	//Moji chlapi a Onar chtějí tvou smrt...
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other,"DIA_Lee_PMSchulden_08_43");	//Skončím to s tebou tady a teď!
		}
		else if(GLOBAL_FARM_THEFT > 5)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_FARM_THEFT),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_THEFTCOUNT2_FARM);
			tsettext3 = ConcatStrings(PRINT_THEFTCOUNT_FARM,tsettext2);
			AI_Output(self,other,"DIA_Lee_PMSchulden_08_44");	//Už je pozdě...
			AI_Output(self,other,"DIA_Lee_PMSchulden_08_45");	//Měl sis to promyslet, než někoho napadneš.
			AI_Output(self,other,"DIA_Lee_PMSchulden_08_46");	//Moji chlapi a Onar chtějí tvou smrt...
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other,"DIA_Lee_PMSchulden_08_47");	//Skončím to s tebou tady a teď!
		};
		Log_CreateTopic(TOPIC_DIPLOM,LOG_NOTE);
		B_LogEntry(TOPIC_DIPLOM,"Naštval jsem žoldáky a Onara. Na farmě jsem teď bandita. Snad mi někdo pomůže!");
		Info_ClearChoices(DIA_Lee_PMSchulden);
		Info_ClearChoices(DIA_Lee_PETZMASTER);
		Info_AddChoice(DIA_Lee_PMSchulden,"Čekej!... (pohotově)",dia_lee_pmschulden_attackmurder);
	}
	else
	{
		if(B_GetTotalPetzCounter(self) > Lee_LastPetzCounter)
		{
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_01");	//Nedělej tu žádné blbiny.
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_02");	//Onar slyšel, že ses zase překonal.
			if(Lee_Schulden < 1000)
			{
				diff = B_GetTotalPetzCounter(self) - Lee_LastPetzCounter;
				if(diff > 0)
				{
					Lee_Schulden = Lee_Schulden + (diff * 250);
				};
				AI_Output(self,other,"DIA_Lee_PMSchulden_04_03");	//A teď chce víc peněz.
				AI_Output(other,self,"DIA_Lee_PMAdd_15_00");	//Kolik?
				if(Lee_Schulden <= 1000)
				{
					B_Say_Gold(self,other,Lee_Schulden);
				}
				else
				{
					concatText1 = ConcatStrings(IntToString(Lee_Schulden),"");
					concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
					concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
					AI_Print(concattextschulden);
				};
			}
			else
			{
				diff = B_GetTotalPetzCounter(self) - Lee_LastPetzCounter;
				if(diff > 0)
				{
					Lee_Schulden = Lee_Schulden + (diff * 250);
				};
				AI_Output(self,other,"DIA_Lee_PMSchulden_04_04");	//Myslel jsem, že jsi chytřejší.
				AI_Output(other,self,"DIA_Lee_PMAdd_15_00A");	//Kolik?
				if(Lee_Schulden <= 1000)
				{
					B_Say_Gold(self,other,Lee_Schulden);
				}
				else
				{
					concatText1 = ConcatStrings(IntToString(Lee_Schulden),"");
					concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
					concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
					AI_Print(concattextschulden);
				};
			};
		}
		else if(B_GetGreatestPetzCrime(self) < Lee_LastPetzCrime)
		{
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_05");	//Mám pro tebe novinky.
			if(Lee_LastPetzCrime == CRIME_MURDER)
			{
				AI_Output(self,other,"DIA_Lee_PMSchulden_04_06");	//Nakonec není nikdo, kdo by tě viděl zabíjet.
				GLOBAL_FARM_MURDER = GLOBAL_FARM_MURDER - 1;
				if(GLOBAL_FARM_MURDER < 0)
				{
					GLOBAL_FARM_MURDER = 0;
				};
			};
			if((Lee_LastPetzCrime == CRIME_THEFT) || ((Lee_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT)))
			{
				AI_Output(self,other,"DIA_Lee_PMSchulden_04_07");	//Nakonec není nikdo, kdo by tě viděl krást.
				GLOBAL_FARM_THEFT = GLOBAL_FARM_THEFT - 1;
				if(GLOBAL_FARM_THEFT < 0)
				{
					GLOBAL_FARM_THEFT = 0;
				};
			};
			if((Lee_LastPetzCrime == CRIME_ATTACK) || ((Lee_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK)))
			{
				AI_Output(self,other,"DIA_Lee_PMSchulden_04_08");	//Nakonec není nikdo, kdo by tě viděl zmlátit toho rolníka.
				GLOBAL_FARM_ATTACK = GLOBAL_FARM_ATTACK - 1;
				if(GLOBAL_FARM_ATTACK < 0)
				{
					GLOBAL_FARM_ATTACK = 0;
				};
			};
			if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
			{
				AI_Output(self,other,"DIA_Lee_PMSchulden_04_09");	//Všechna obvinění byla stažena.
			};
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_10");	//Je to jeden ze způsobů jak se zbavit problémů.
			if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
			{
				AI_Output(self,other,"DIA_Lee_PMSchulden_04_11");	//Už nemusíš nic platit.
				AI_Output(self,other,"DIA_Lee_PMSchulden_04_12");	//Ale do budoucna si dávej pozor.
				Lee_Schulden = 0;
				Lee_LastPetzCounter = 0;
				Lee_LastPetzCrime = CRIME_NONE;
			}
			else
			{
				AI_Output(self,other,"DIA_Lee_PMSchulden_04_13");	//Jedna věc je jasná: musíš zaplatit v plné výši.
				AI_Output(other,self,"DIA_Lee_PMAdd_15_00B");	//Kolik?
				if(Lee_Schulden <= 1000)
				{
					B_Say_Gold(self,other,Lee_Schulden);
				}
				else
				{
					concatText1 = ConcatStrings(IntToString(Lee_Schulden),"");
					concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
					concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
					AI_Print(concattextschulden);
				};
				AI_Output(self,other,"DIA_Lee_PMSchulden_04_14");	//Takže, co cheš?
			};
		};
		if(B_GetGreatestPetzCrime(self) != CRIME_NONE)
		{
			Info_ClearChoices(DIA_Lee_PMSchulden);
			Info_ClearChoices(DIA_Lee_PETZMASTER);
			Info_AddChoice(DIA_Lee_PMSchulden,"Nemám dost peněz!",DIA_Lee_PETZMASTER_PayLater);
			Info_AddChoice(DIA_Lee_PMSchulden,"Kolik musím zaplatit?",DIA_Lee_PMSchulden_HowMuchAgain);
			if(Npc_HasItems(other,ItMi_Gold) >= Lee_Schulden)
			{
				Info_AddChoice(DIA_Lee_PMSchulden,"Chci zaplatit pokutu.",DIA_Lee_PETZMASTER_PayNow);
			};
		};
	};
};

func void DIA_Lee_PMSchulden_HowMuchAgain()
{
	var string concatText1;
	var string concatText2;
	var string concattextschulden;
	AI_Output(other,self,"DIA_Lee_PMSchulden_HowMuchAgain_15_00");	//Kolik musím zaplatit?
	if(Lee_Schulden <= 1000)
	{
		B_Say_Gold(self,other,Lee_Schulden);
	}
	else
	{
		concatText1 = ConcatStrings(IntToString(Lee_Schulden),"");
		concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
		concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
		AI_Print(concattextschulden);
	};
	Info_ClearChoices(DIA_Lee_PMSchulden);
	Info_ClearChoices(DIA_Lee_PETZMASTER);
	Info_AddChoice(DIA_Lee_PMSchulden,"Nemám dost peněz!",DIA_Lee_PETZMASTER_PayLater);
	Info_AddChoice(DIA_Lee_PMSchulden,"Kolik musím zaplatit?",DIA_Lee_PMSchulden_HowMuchAgain);
	if(Npc_HasItems(other,ItMi_Gold) >= Lee_Schulden)
	{
		Info_AddChoice(DIA_Lee_PMSchulden,"Chci tu pokutu zaplatit!",DIA_Lee_PETZMASTER_PayNow);
	};
};


instance DIA_Lee_PETZMASTER(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = DIA_Lee_PETZMASTER_Condition;
	information = DIA_Lee_PETZMASTER_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Lee_PETZMASTER_Condition()
{
	if(B_GetGreatestPetzCrime(self) > Lee_LastPetzCrime)
	{
		return TRUE;
	};
};

func void DIA_Lee_PETZMASTER_Info()
{
	var string concatText1;
	var string concatText2;
	var string concattextschulden;
	var string tsettext1;
	var string tsettext2;
	var string tsettext3;
	var int temp1;

	Lee_Schulden = 0;
	if(self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_00");	//Co tu k čertu vyvádíš? (překvapen) Proč furt děláš problémy?
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_01");	//Slyšel jsem od Gorna, že jsi naživu a jdeš sem, ale stejně... Achjo.
		LeeMeet = TRUE;
	};
	temp1 = 0;
	if(GLOBAL_FARM_MURDER > 2)
	{
		temp1 = 1;
	};
	if(GLOBAL_FARM_THEFT > 5)
	{
		temp1 = 1;
	};
	if(GLOBAL_FARM_ATTACK > 5)
	{
		temp1 = 1;
	};
	if(temp1 == 1)
	{
		if(GLOBAL_FARM_MURDER > 2)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_FARM_MURDER),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_MURDERCOUNT2_FARM);
			tsettext3 = ConcatStrings(PRINT_MURDERCOUNT_FARM,tsettext2);
			AI_Output(self,other,"DIA_Lee_PETZMASTER_08_48");	//Už je pozdě...
			AI_Output(self,other,"DIA_Lee_PETZMASTER_08_49");	//Měl sis to promyslet, než jsi někoho zabil.
			AI_Output(self,other,"DIA_Lee_PETZMASTER_08_50");	//Moji chlapi a Onar chtějí tvou smrt...
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other,"DIA_Lee_PETZMASTER_08_51");	//Skončím to s tebou tady a teď!
		}
		else if(GLOBAL_FARM_ATTACK > 5)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_FARM_ATTACK),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_ATTACKCOUNT2_FARM);
			tsettext3 = ConcatStrings(PRINT_ATTACKCOUNT_FARM,tsettext2);
			AI_Output(self,other,"DIA_Lee_PETZMASTER_08_52");	//Už je pozdě...
			AI_Output(self,other,"DIA_Lee_PETZMASTER_08_53");	//Měl sis to promyslet, než jsi někoho napadl.
			AI_Output(self,other,"DIA_Lee_PETZMASTER_08_54");	//Moji chlapi a Onar chtějí tvou smrt...
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other,"DIA_Lee_PETZMASTER_08_55");	//Skončím to s tebou tady a teď!
		}
		else if(GLOBAL_FARM_THEFT > 5)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_FARM_THEFT),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_THEFTCOUNT2_FARM);
			tsettext3 = ConcatStrings(PRINT_THEFTCOUNT_FARM,tsettext2);
			AI_Output(self,other,"DIA_Lee_PETZMASTER_08_56");	//Už je pozdě...
			AI_Output(self,other,"DIA_Lee_PETZMASTER_08_57");	//Měl sis to promyslet, než jsi někoho okradl.
			AI_Output(self,other,"DIA_Lee_PETZMASTER_08_58");	//Moji chlapi a Onar chtějí tvou smrt...
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other,"DIA_Lee_PETZMASTER_08_59");	//Skončím to s tebou tady a teď!
		};
		Log_CreateTopic(TOPIC_DIPLOM,LOG_NOTE);
		B_LogEntry(TOPIC_DIPLOM,"Naštval jsem žoldáky a Onara. Na farmě jsem teď bandita. Snad mi někdo pomůže!");
		Info_ClearChoices(DIA_Lee_PMSchulden);
		Info_ClearChoices(DIA_Lee_PETZMASTER);
		Info_AddChoice(DIA_Lee_PETZMASTER,"Čekej!... (pohotově)",dia_lee_petzmaster_attackmurder);
	}
	else
	{
		if(B_GetGreatestPetzCrime(self) == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_Lee_PETZMASTER_04_02");	//Dobře, že jsi přišel brzy. Jinak by se to ještě zhoršilo.
			AI_Output(self,other,"DIA_Lee_PETZMASTER_04_03");	//Žoldáci jsou tuzí chlapi a rolníci taky nejsou choulostiví, ale nemůžeš jen tak chodit kolem a zabíjet lidi.
			Lee_Schulden = B_GetTotalPetzCounter(self) * 1500;
			if((PETZCOUNTER_Farm_Theft + PETZCOUNTER_Farm_Attack + PETZCOUNTER_Farm_Sheepkiller) > 0)
			{
				AI_Output(self,other,"DIA_Lee_PETZMASTER_04_04");	//Nemluvě o dalších věcech.
			};
			AI_Output(self,other,"DIA_Lee_PETZMASTER_04_05");	//Můžu ti pomoci dostat se z toho čistý.
			AI_Output(self,other,"DIA_Lee_PETZMASTER_04_06");	//Ale bude tě to něco stát. Onar je velmi chamtivý člověk.
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_THEFT)
		{
			AI_Output(self,other,"DIA_Lee_PETZMASTER_04_07");	//Dobře, že jsi tady! Prý jsi něco ukradl.
			if(PETZCOUNTER_Farm_Attack > 0)
			{
				AI_Output(self,other,"DIA_Lee_PETZMASTER_04_08");	//A zmlátil pár rolníků.
			};
			if(PETZCOUNTER_Farm_Sheepkiller > 0)
			{
				AI_Output(self,other,"DIA_Lee_PETZMASTER_04_09");	//A zabíjel ovce.
			};
			AI_Output(self,other,"DIA_Lee_PETZMASTER_04_10");	//Onar trvá na tom, že pachatel bude nést zodpovědnost.
			AI_Output(self,other,"DIA_Lee_PETZMASTER_04_11");	//To znamená, že budeš muset zaplatit pokutu.
			Lee_Schulden = B_GetTotalPetzCounter(self) * 500;
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
		{
			AI_Output(self,other,"DIA_Lee_PETZMASTER_04_12");	//Jestli jdeš na čestný duel, je to jedna věc...
			AI_Output(self,other,"DIA_Lee_PETZMASTER_04_13");	//Ale jestli napadneš rolníka, běží hned za Onarem.
			if(PETZCOUNTER_Farm_Sheepkiller > 0)
			{
				AI_Output(self,other,"DIA_Lee_PETZMASTER_04_14");	//Nemluvě o tom, že jsi zabíjel ovce.
			};
			AI_Output(self,other,"DIA_Lee_PETZMASTER_04_15");	//Musíš zaplatit pokutu. Onar požaduje náhradu - je to jediná možnost, jak vyřešit tuhle záležitost.
			Lee_Schulden = B_GetTotalPetzCounter(self) * 750;
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER)
		{
			AI_Output(self,other,"DIA_Lee_PETZMASTER_04_16");	//Onar očekává, že budu chránit jeho farmu. A to i včetně jeho ovcí.
			AI_Output(self,other,"DIA_Lee_PETZMASTER_04_17");	//Budeš muset zaplatit pokutu!
			Lee_Schulden = 250;
		};
		AI_Output(other,self,"DIA_Lee_PETZMASTER_15_18");	//Kolik?
		if(Lee_Schulden <= 1000)
		{
			B_Say_Gold(self,other,Lee_Schulden);
		}
		else
		{
			concatText1 = ConcatStrings(IntToString(Lee_Schulden),"");
			concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
			concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
			AI_Print(concattextschulden);
		};
		Info_ClearChoices(DIA_Lee_PMSchulden);
		Info_ClearChoices(DIA_Lee_PETZMASTER);
		Info_AddChoice(DIA_Lee_PETZMASTER,"Nemám dost zlata!",DIA_Lee_PETZMASTER_PayLater);
		if(Npc_HasItems(other,ItMi_Gold) >= Lee_Schulden)
		{
			Info_AddChoice(DIA_Lee_PETZMASTER,"Chci zaplatit.",DIA_Lee_PETZMASTER_PayNow);
		};
	};
};

func void DIA_Lee_PETZMASTER_PayNow()
{
	AI_Output(other,self,"DIA_Lee_PETZMASTER_PayNow_15_00");	//Chci zaplatit!
	B_GiveInvItems(other,self,ItMi_Gold,Lee_Schulden);
	AI_Output(self,other,"DIA_Lee_PETZMASTER_PayNow_04_01");	//Dobrá! Postarám se o to aby Onar dostal tvé peníze. Můžeš na tento problém zapomenout.
	B_GrantAbsolution(LOC_FARM);
	Lee_Schulden = 0;
	Lee_LastPetzCounter = 0;
	Lee_LastPetzCrime = CRIME_NONE;
	Info_ClearChoices(DIA_Lee_PETZMASTER);
	Info_ClearChoices(DIA_Lee_PMSchulden);
};

func void DIA_Lee_PETZMASTER_PayLater()
{
	AI_Output(other,self,"DIA_Lee_PETZMASTER_PayLater_15_00");	//Nemám dost zlata!
	AI_Output(self,other,"DIA_Lee_PETZMASTER_PayLater_04_01");	//Tak jdi do města a nějaké sežeň.
	AI_Output(self,other,"DIA_Lee_PETZMASTER_PayLater_04_02");	//Hlavně ho neber tady na farmě. Už tak máš problém.
	Lee_LastPetzCounter = B_GetTotalPetzCounter(self);
	Lee_LastPetzCrime = B_GetGreatestPetzCrime(self);
	AI_StopProcessInfos(self);
};


instance DIA_Lee_Hallo(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = DIA_Lee_Hallo_Condition;
	information = DIA_Lee_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Lee_Hallo_Condition()
{
	if((self.aivar[AIV_TalkedToPlayer] == FALSE) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lee_Hallo_Info()
{
	AI_Output(self,other,"DIA_Lee_Hallo_04_00");	//Kdo sakra jsi?... Co tady děláš? (překvapeně) Mysleli jsme, že jsi mrtvý!
	AI_Output(other,self,"DIA_Lee_Hallo_15_01");	//Proč sis to myslel?
	AI_Output(self,other,"DIA_Lee_Hallo_04_02");	//Gorn mi řekl, kdo svrhl bariéru.
	AI_Output(other,self,"DIA_Lee_Hallo_15_03");	//Ano, to já.
	AI_Output(self,other,"DIA_Lee_Hallo_04_04");	//Nemyslel bych si, že člověk může něco takového přežít. Co tě sem přivádí? Určitě zde nejsi bez důvodu...
	LeeMeet = TRUE;
};

instance DIA_Lee_BreakBarrier(C_Info)
{
	npc = SLD_800_Lee;
	nr = 3;
	condition = DIA_Lee_BreakBarrier_Condition;
	information = DIA_Lee_BreakBarrier_Info;
	permanent = FALSE;
	description = "Co se stalo po pádu bariéry?";
};

func int DIA_Lee_BreakBarrier_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lee_Hallo) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Lee_BreakBarrier_Info()
{
	AI_Output(other,self,"DIA_Lee_BreakBarrier_01_00");	//Co se stalo po pádu bariéry?
	AI_Output(self,other,"DIA_Lee_BreakBarrier_01_01");	//Většina zlodějů a žoldáků zůstala se mnou, protože jsem byl schopen jim nabídnout cestu ke svobodě. 
	AI_Output(self,other,"DIA_Lee_BreakBarrier_01_02");	//Zbytek se rozutekl do okolí a rozkradl, co se dalo!
	AI_Output(self,other,"DIA_Lee_BreakBarrier_01_03");	//Mágové Vody opustili svůj tábor a šli do Khorinisu. Kde jsou přesně, to teď nevím.
	AI_Output(self,other,"DIA_Lee_BreakBarrier_01_04");	//Ale Lares by o tom mohl něco vědět.
	AI_Output(other,self,"DIA_Lee_BreakBarrier_01_05");	//A co dál?
	AI_Output(self,other,"DIA_Lee_BreakBarrier_01_06");	//Pak jsme přišli sem na farmu.
	AI_Output(self,other,"DIA_Lee_BreakBarrier_01_07");	//Krátce před námi navštívila městská domobrana farmu a celou ju převrátila vzhůru nohama při hledání zlata.
	AI_Output(self,other,"DIA_Lee_BreakBarrier_01_08");	//Ve skutečnosti to byl důvod, proč se Onar vzbouřil králi! Až potom co s námi podepsal smlouvu.
	AI_Output(self,other,"DIA_Lee_BreakBarrier_01_09");	//Moji muži hlídají farmu před královými muži a my za to dostanem jídlo a nějaké zlato.
};

instance DIA_Lee_Paladine(C_Info)
{
	npc = SLD_800_Lee;
	nr = 2;
	condition = DIA_Lee_Paladine_Condition;
	information = DIA_Lee_Paladine_Info;
	permanent = FALSE;
	description = "Musím promluvit naléhavě s paladiny ve městě.";
};

func int DIA_Lee_Paladine_Condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Lee_Paladine_Info()
{
	AI_Output(other,self,"DIA_Lee_Paladine_15_00");	//Musím promluvit naléhavě s paladiny ve městě. Pomůžeš mi?
	AI_Output(self,other,"DIA_Lee_Paladine_04_01");	//Co jim chceš?... (nevěřícně) 
	AI_Output(other,self,"DIA_Lee_Paladine_15_02");	//To je dlouhý příběh!
	AI_Output(self,other,"DIA_Lee_Paladine_04_03");	//Já mám času dost.
	AI_Output(other,self,"DIA_Lee_Paladine_15_04");	//Xardas mě poslal na misi... (povzdech) Mám získat mocný artefakt Innosovo oko!
	AI_Output(self,other,"DIA_Lee_Paladine_04_05");	//Takže ses spojil s nekromantem. Chápu! A paladinové ten amulet mají?
	AI_Output(other,self,"DIA_Lee_Paladine_15_06");	//Dle toho co vím, tak ano.
	AI_Output(self,other,"DIA_Lee_Paladine_04_07");	//Můžu ti pomoci se dostat k paladinům! Ale prvně se musíš stát jedním z nás.
};

instance DIA_Lee_PaladineHOW(C_Info)
{
	npc = SLD_800_Lee;
	nr = 3;
	condition = DIA_Lee_PaladineHOW_Condition;
	information = DIA_Lee_PaladineHOW_Info;
	permanent = FALSE;
	description = "Jak mi můžeš pomoci dostat se k paladinům?";
};


func int DIA_Lee_PaladineHOW_Condition()
{
	if((other.guild == GIL_NONE) && Npc_KnowsInfo(other,DIA_Lee_Paladine))
	{
		return TRUE;
	};
};

func void DIA_Lee_PaladineHOW_Info()
{
	AI_Output(other,self,"DIA_Lee_PaladineHOW_15_00");	//Jak mi můžeš pomoci dostat se k paladinům?
	AI_Output(self,other,"DIA_Lee_PaladineHOW_04_01");	//Věř mi - mám plán a myslím, že ty jsi pro něj ten pravý...
	AI_Output(self,other,"DIA_Lee_PaladineHOW_04_02");	//Dostanu tě k paladinům, ale prvně se musíš přidat mezi žoldáky!
};


instance DIA_Lee_LeesPlan(C_Info)
{
	npc = SLD_800_Lee;
	nr = 4;
	condition = DIA_Lee_LeesPlan_Condition;
	information = DIA_Lee_LeesPlan_Info;
	permanent = FALSE;
	description = "Co přesně tu budeš dělat?";
};


func int DIA_Lee_LeesPlan_Condition()
{
	if(Lee_IsOnBoard == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Lee_LeesPlan_Info()
{
	AI_Output(other,self,"DIA_Lee_LeesPlan_15_00");	//Co přesně tu budeš dělat?
	AI_Output(self,other,"DIA_Lee_LeesPlan_04_01");	//Zajistím, aby se všichni dostali z tohodle ostrova.
	AI_Output(self,other,"DIA_Lee_LeesPlan_04_02");	//Ale Onar nás najal na hlídání farmy, takže zatím budu dělat tohle.
	AI_Output(self,other,"DIA_Lee_LeesPlan_04_03");	//Ale naše odměna je víc než peníze. Pomocí těmto farmářům jsme odřízli město od svých největších farem.
	AI_Output(self,other,"DIA_Lee_LeesPlan_04_04");	//A čím méně toho budou mít paladinové k jídlu, tím více budou zvažovat nabídku míru.

	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Lee_LeesPlan_04_05");	//Škoda, že ze všech lidí ses přidal zrovna k nim.
	};

	AI_Output(other,self,"DIA_Lee_LeesPlan_15_06");	//Jak bude tvá nabídka vypadat?
	AI_Output(self,other,"DIA_Lee_LeesPlan_04_07");	//V podstatě budu požadovat smazání naší minulosti a přístup na pevninu. Brzy se dozvíš více.
};


instance DIA_Lee_WannaJoin(C_Info)
{
	npc = SLD_800_Lee;
	nr = 5;
	condition = DIA_Lee_WannaJoin_Condition;
	information = DIA_Lee_WannaJoin_Info;
	permanent = FALSE;
	description = "Chci se k tobě přidat!";
};

func int DIA_Lee_WannaJoin_Condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Lee_WannaJoin_Info()
{
	AI_Output(other,self,"DIA_Lee_WannaJoin_15_00");	//Chci se k tobě přidat!
	AI_Output(self,other,"DIA_Lee_WannaJoin_04_01");	//Jsem rád, že to říkáš! Potřebuji tu každého schopného muže.
	AI_Output(self,other,"DIA_Lee_WannaJoin_04_02");	//Poslední žoldáci, které jsem přijal, tropí jen potíže!
	AI_Output(self,other,"DIA_Lee_WannaJoin_04_03");	//Můžu tě přijmout hned, jen ještě musíš udělat pár věcí. Ale myslím, že to pro tebe nebude žádný problém...
};


instance DIA_Lee_ClearWhat(C_Info)
{
	npc = SLD_800_Lee;
	nr = 6;
	condition = DIA_Lee_ClearWhat_Condition;
	information = DIA_Lee_ClearWhat_Info;
	permanent = FALSE;
	description = "Co musím udělat, než se budu moci k tobě přidat?";
};

func int DIA_Lee_ClearWhat_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lee_WannaJoin) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Lee_ClearWhat_Info()
{
	AI_Output(other,self,"DIA_Lee_ClearWhat_15_00");	//Co musím udělat, než se budu moci k tobě přidat?
	AI_Output(self,other,"DIA_Lee_ClearWhat_04_01");	//Majitel pozemku je Onar! Můžu tě zaměstnat jen s jeho souhlasem.
	AI_Output(self,other,"DIA_Lee_ClearWhat_04_02");	//A pak jsou tu ostatní žoldáci. Musíš si získat hlasy většiny, než tě mezi sebe přijmou.
	AI_Output(self,other,"DIA_Lee_ClearWhat_04_03");	//Ale nechoď za Onarem než bude důvod tě přijmout - je velmi netrpělivý...
	Log_CreateTopic(TOPIC_BecomeSLD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BecomeSLD,LOG_Running);
	B_LogEntry(TOPIC_BecomeSLD,"Pro přijetí k žoldákům potřebuji Onarův souhlas a hlasy většiny žoldáků.");
};


instance DIA_Lee_OtherSld(C_Info)
{
	npc = SLD_800_Lee;
	nr = 7;
	condition = DIA_Lee_OtherSld_Condition;
	information = DIA_Lee_OtherSld_Info;
	permanent = FALSE;
	description = "Jak mohu přesvědčit žoldáky?";
};


func int DIA_Lee_OtherSld_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lee_WannaJoin) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Lee_OtherSld_Info()
{
	AI_Output(other,self,"DIA_Lee_OtherSld_15_00");	//Jak mohu přesvědčit žoldáky?
	AI_Output(self,other,"DIA_Lee_OtherSld_04_01");	//Dělej to, co se čeká od žoldáka.
	AI_Output(self,other,"DIA_Lee_OtherSld_04_02");	//Promluv s Torlofem. Je před domem. Dá ti test.
	AI_Output(self,other,"DIA_Lee_OtherSld_04_03");	//Jestli ho splníš, můžeš si získat dost hlasů.
	AI_Output(self,other,"DIA_Lee_OtherSld_04_04");	//Řekne ti vše, co budeš potřebovat vědět.
	B_LogEntry(TOPIC_BecomeSLD,"Než se stanu žoldákem, tak musím splnit Torlofův test a získat hlasy většiny žoldáků.");
};


instance DIA_Addon_Lee_Ranger(C_Info)
{
	npc = SLD_800_Lee;
	nr = 2;
	condition = DIA_Addon_Lee_Ranger_Condition;
	information = DIA_Addon_Lee_Ranger_Info;
	description = "Co víš o 'Kruhu Vody'?";
};


func int DIA_Addon_Lee_Ranger_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lee_OtherSld) && (SC_KnowsRanger == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lee_Ranger_Info()
{
	AI_Output(other,self,"DIA_Addon_Lee_Ranger_15_00");	//Co víš o 'Kruhu Vody'?
	AI_Output(self,other,"DIA_Addon_Lee_Ranger_04_01");	//(smích) To jsem si mohl myslet! Ty víš o všem, co se šustne.
	AI_Output(other,self,"DIA_Addon_Lee_Ranger_15_02");	//Ale no tak.
	AI_Output(self,other,"DIA_Addon_Lee_Ranger_04_03");	//Vím jen hodně málo. Je to spolek, který vedou mágové Vody.
	AI_Output(self,other,"DIA_Addon_Lee_Ranger_04_04");	//Po pádu bariéry uzavřeli nějakou dohodu.
	AI_Output(self,other,"DIA_Addon_Lee_Ranger_04_05");	//Samozřejmě ti pomůžu, když budu moci. Ale mám teď hodně jiných problémů.
	AI_Output(self,other,"DIA_Addon_Lee_Ranger_04_06");	//Jestli chceš vědět víc, promluv s Cordem.
	RangerHelp_gildeSLD = TRUE;
	SC_KnowsCordAsRangerFromLee = TRUE;
};


var int Lee_ProbeOK;
var int Lee_StimmenOK;
var int Lee_OnarOK;

instance DIA_Lee_JoinNOW(C_Info)
{
	npc = SLD_800_Lee;
	nr = 8;
	condition = DIA_Lee_JoinNOW_Condition;
	information = DIA_Lee_JoinNOW_Info;
	permanent = TRUE;
	description = "Jsem připraven se k tobě přidat!";
};


func int DIA_Lee_JoinNOW_Condition()
{
	if((other.guild == GIL_NONE) && Npc_KnowsInfo(other,DIA_Lee_OtherSld) && (Lee_OnarOK == FALSE) && (SLD_Aufnahme != LOG_FAILED))
	{
		return TRUE;
	};
};

func void DIA_Lee_JoinNOW_Info()
{
	AI_Output(other,self,"DIA_Lee_JoinNOW_15_00");	//Jsem připraven se k tobě přidat!

	if(Lee_ProbeOK == FALSE)
	{
		if((MIS_Torlof_HolPachtVonSekob != LOG_SUCCESS) && (MIS_Torlof_BengarMilizKlatschen != LOG_SUCCESS))
		{
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_01");	//Ne dříve, než splníš Torlofův test.
		}
		else
		{
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_02");	//Takže jsi splnil Torlofův test?
			AI_Output(other,self,"DIA_Lee_JoinNOW_15_03");	//Ano.
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_04");	//To je dobře.
			Lee_ProbeOK = TRUE;
		};
	};
	if((Lee_ProbeOK == TRUE) && (Lee_StimmenOK == FALSE))
	{
		AI_Output(self,other,"DIA_Lee_JoinNOW_04_05");	//A co říkají ostatní žoldáci?

		if(Torlof_GenugStimmen == FALSE)
		{
			AI_Output(other,self,"DIA_Lee_JoinNOW_15_06");	//Nejsem si zcela jistý, jestli jich je na mé straně dost.
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_07");	//Tak promluv s Torlofem, ten ví vše, co se na farmě děje a říká.
		}
		else
		{
			AI_Output(other,self,"DIA_Lee_JoinNOW_15_08");	//Většina z nich je se mnou.
			Lee_StimmenOK = TRUE;
		};
	};
	if((Lee_StimmenOK == TRUE) && (Lee_OnarOK == FALSE))
	{
		if(Onar_Approved == FALSE)
		{
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_09");	//Dobrá. Jdi za Onarem. Už jsem s ním mluvil.
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_10");	//Jdi s ním projednat svůj žold.
			Lee_SendToOnar = TRUE;
			B_LogEntry(TOPIC_BecomeSLD,"Mám vše, co potřebuji - můžu jít za Onarem.");
		}
		else
		{
			Lee_OnarOK = TRUE;
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_11");	//Mluvil jsi s Onarem?
			AI_Output(other,self,"DIA_Lee_JoinNOW_15_12");	//Ano, souhlasil.
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_13");	//Tak tedy vítej na palubě, kamaráde!
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_14");	//To si vezmi, budeš začínat s obyčejným hadrem.
			CreateInvItems(other,ItAr_Sld_L,1);

			if(CanTeachTownMaster == FALSE)
			{
				MIS_PathFromDown = LOG_SUCCESS;
				Log_SetTopicStatus(Topic_PathFromDown,LOG_SUCCESS);
				CanTeachTownMaster = TRUE;
			};

			hero.guild = GIL_SLD;
			CheckHeroGuild[0] = TRUE;
			Mdl_ApplyOverlayMds(hero,"Humans_Relaxed.mds");
			Npc_ExchangeRoutine(Lothar,"START");
			Snd_Play("GUILD_INV");
			KDF_Aufnahme = LOG_OBSOLETE;
			SLD_Aufnahme = LOG_SUCCESS;
			MIL_Aufnahme = LOG_OBSOLETE;
			MIS_BECOMEKDW = LOG_OBSOLETE;
			MIS_BECOMEKDM = LOG_OBSOLETE;
			MIS_PSICAMPJOIN = LOG_OBSOLETE;
			B_GivePlayerXP(XP_BecomeMercenary);

			Log_SetTopicStatus(TOPIC_BecomeMIL,LOG_OBSOLETE);
			Log_SetTopicStatus(TOPIC_BecomeKdF,LOG_OBSOLETE);
			Log_SetTopicStatus(TOPIC_PSICAMPJOIN,LOG_OBSOLETE);
			Log_SetTopicStatus(TOPIC_BECOMEKDW,LOG_OBSOLETE);
			Log_SetTopicStatus(TOPIC_BECOMEKDM,LOG_OBSOLETE);

			AI_Output(self,other,"DIA_Lee_JoinNOW_04_15");	//Jsem rád, že jsi s námi.
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_16");	//Dám ti tvůj první úkol.
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_17");	//Má to co dočinění s paladiny. Brzy se k nim dostaneš.
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_18");	//Stejně jsi tam chtěl.
		};
	};
};


instance DIA_Lee_KeinSld(C_Info)
{
	npc = SLD_800_Lee;
	nr = 4;
	condition = DIA_Lee_KeinSld_Condition;
	information = DIA_Lee_KeinSld_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Lee_KeinSld_Condition()
{
	if(((other.guild == GIL_MIL) || (other.guild == GIL_PAL) || (other.guild == GIL_NOV) || (other.guild == GIL_KDF) || (other.guild == GIL_NDW) || (other.guild == GIL_KDW) || (other.guild == GIL_NDM) || (other.guild == GIL_KDM) || (other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR)) && (Lee_IsOnBoard == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Lee_KeinSld_Info()
{
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Lee_KeinSld_04_00");	//Vidím, že ses stal sluhou paladinů.
	};
	if((other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Lee_KeinSld_04_01");	//Ty jsi vstoupil do kláštera? (smích) To jsem vážně nečekal.
	};
	if((other.guild == GIL_NDW) || (other.guild == GIL_KDW))
	{
		AI_Output(self,other,"DIA_Lee_KeinSld_04_0A");	//Vidím, že sis vybral cestu mágů Vody. Velmi dobrá volba - gratuluji!
	};
	if((other.guild == GIL_NDM) || (other.guild == GIL_KDM))
	{
		AI_Output(self,other,"DIA_Lee_KeinSld_04_0B");	//Rozhodl ses sloužit Beliarovi?... (udiveně) Chlape, co to s námi hraješ za hru?!
	};
	if((other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR))
	{
		AI_Output(self,other,"DIA_Lee_KeinSld_04_0C");	//Jak vidím, tak ses připojil k Bratrstvu! Chlape - ty nejsi v pořádku.
	};

	AI_Output(self,other,"DIA_Lee_KeinSld_04_02");	//No, už nemůžeš být žoldák.
	AI_Output(self,other,"DIA_Lee_KeinSld_04_03");	//Ale kdo ví, možná pro mě někdy uděláš jednu, nebo dvě věci - nebo já pro tebe.
	AI_Output(self,other,"DIA_Lee_KeinSld_04_04");	//Uvidíme. V každém případě ti přeji vše nejlepší.
};


instance DIA_Lee_ToHagen(C_Info)
{
	npc = SLD_800_Lee;
	nr = 4;
	condition = DIA_Lee_ToHagen_Condition;
	information = DIA_Lee_ToHagen_Info;
	permanent = FALSE;
	description = "Jak se můžu dostat k paladinům?";
};


func int DIA_Lee_ToHagen_Condition()
{
	if(other.guild == GIL_SLD)
	{
		return TRUE;
	};
};

func void DIA_Lee_ToHagen_Info()
{
	AI_Output(other,self,"DIA_Lee_ToHagen_15_00");	//Jak se můžu dostat k paladinům?
	AI_Output(self,other,"DIA_Lee_ToHagen_04_01");	//Velmi jednoduše. Doneseš jim naší nabídku k míru.
	AI_Output(self,other,"DIA_Lee_ToHagen_04_02");	//Znám lorda Hagena. Už od doby mého působení v armádě.
	AI_Output(self,other,"DIA_Lee_ToHagen_04_03");	//Vím jak přemýšlí - nemá dost lidí, takže nabídku přijme.
	AI_Output(self,other,"DIA_Lee_ToHagen_04_04");	//Napsal jsem dopis - tady.
	B_GiveInvItems(self,other,ItWr_Passage_MIS,1);
	AI_Output(self,other,"DIA_Lee_ToHagen_04_05");	//V každém případě se dostaneš k vůdci paladinů.
	MIS_Lee_Friedensangebot = LOG_Running;
	Log_CreateTopic(TOPIC_Frieden,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Frieden,LOG_Running);
	B_LogEntry(TOPIC_Frieden,"Lee mě poslal jako kurýra za lordem Hagenem. Teď se bez potíží dostanu na radnici.");
};

instance DIA_Lee_Fort(C_Info)
{
	npc = SLD_800_Lee;
	nr = 3;
	condition = DIA_Lee_Fort_Condition;
	information = DIA_Lee_Fort_Info;
	permanent = FALSE;
	description = "Co víš o paladinské pevnosti?";
};

func int DIA_Lee_Fort_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lee_ToHagen) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Lee_Fort_Info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Lee_Fort_01_00");	//Co víš o paladinské pevnosti?
	AI_Output(self,other,"DIA_Lee_Fort_01_01");	//Nachází se v blízkosti Khorinisu, z vojenského hlediska je na velmi důležité strategické pozici.
	AI_Output(self,other,"DIA_Lee_Fort_01_02");	//Pokud vím, tak hlavní armáda paladinů je teď v té pevnosti.
	AI_Output(other,self,"DIA_Lee_Fort_01_03");	//A je nějaký způsob jak se dostat kolem stráží?
	AI_Output(self,other,"DIA_Lee_Fort_01_04");	//Nevím. Vím že tam vedla cesta tady z Khorinisu.
	AI_Output(self,other,"DIA_Lee_Fort_01_05");	//Ale tu už dlouho nikdo nepoužívá, protože témeř všechna doprava se teď řídí po moři.
};

instance DIA_Lee_AngebotSuccess(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = DIA_Lee_AngebotSuccess_Condition;
	information = DIA_Lee_AngebotSuccess_Info;
	permanent = FALSE;
	description = "Doručil jsem tvou nabídku lordu Hagenovi.";
};

func int DIA_Lee_AngebotSuccess_Condition()
{
	if(Hagen_FriedenAbgelehnt == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Lee_AngebotSuccess_Info()
{
	B_GivePlayerXP(XP_Ambient);
	AI_Output(other,self,"DIA_Lee_AngebotSuccess_15_00");	//Doručil jsem tvou nabídku lordu Hagenovi.
	AI_Output(self,other,"DIA_Lee_AngebotSuccess_04_01");	//Co říkal?
	AI_Output(other,self,"DIA_Lee_AngebotSuccess_15_02");	//Řekl, že tebe omilostní, ale ne tvé lidi.
	AI_Output(self,other,"DIA_Lee_AngebotSuccess_04_03");	//Zaslepený blázen. O hodně více KRÁLOVÝCH mužů je většími hrdlořezi než mí lidé.
	AI_Output(other,self,"DIA_Lee_AngebotSuccess_15_04");	//Co budeme teď dělat?
	AI_Output(self,other,"DIA_Lee_AngebotSuccess_04_05");	//Musím najít jiný způsob jak odsud. Jestli budu muset, zajmu nějakou loď. Budu o tom přemýšlet.
	AI_Output(self,other,"DIA_Lee_AngebotSuccess_04_06");	//Zachránit si krk a mé lidi tu nechat? Vyloučeno.
	MIS_Lee_Friedensangebot = LOG_SUCCESS;
};


instance DIA_Lee_Background(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = DIA_Lee_Background_Condition;
	information = DIA_Lee_Background_Info;
	permanent = FALSE;
	description = "Proč se chceš dostat na kontinent?";
};


func int DIA_Lee_Background_Condition()
{
	if((MIS_Lee_Friedensangebot == LOG_SUCCESS) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lee_Background_Info()
{
	AI_Output(other,self,"DIA_Lee_Add_15_10");	//Proč se chceš dostat na kontinent?
	AI_Output(self,other,"DIA_Lee_Add_04_11");	//Jak jistě víš, sloužil jsem králi jako generál.
	AI_Output(self,other,"DIA_Lee_Add_04_12");	//Ale jeho patolízalové mě zradili, protože jsem věděl něco, co jsem vědět neměl.
	AI_Output(self,other,"DIA_Lee_Add_04_13");	//Hodili mě do Hornického údolí a král jim to plně schválil.
	AI_Output(self,other,"DIA_Lee_Add_04_14");	//Měl jsem v kolonii hodně času na přemýšlení.
	AI_Output(self,other,"DIA_Lee_Add_04_15");	//A chci se pomstít.
	AI_Output(other,self,"DIA_Lee_Add_15_16");	//Králi?!
	AI_Output(self,other,"DIA_Lee_Add_04_17");	//Králi... (rozhodně) A jeho poskokům! Budou hořce litovat ta to, co mi provedli.
};


instance DIA_Lee_RescueGorn(C_Info)
{
	npc = SLD_800_Lee;
	nr = 2;
	condition = DIA_Lee_RescueGorn_Condition;
	information = DIA_Lee_RescueGorn_Info;
	permanent = FALSE;
	description = "Mám jít do Hornického údolí.";
};


func int DIA_Lee_RescueGorn_Condition()
{
	if((Hagen_BringProof == TRUE) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Lee_RescueGorn_Info()
{
	AI_Output(other,self,"DIA_Lee_RescueGorn_15_00");	//Mám jít do Hornického údolí.
	AI_Output(self,other,"DIA_Lee_RescueGorn_04_01");	//Stejně jsem si nemyslel, že na farmě zůstaneš dlouho.
	AI_Output(self,other,"DIA_Lee_RescueGorn_04_02");	//Jestli půjdeš do kolonie, podívej se po Gornovi. Paladinové ho drží na hradě.
	AI_Output(self,other,"DIA_Lee_RescueGorn_04_03");	//Gorn je dobrý člověk a já ho zde potřebuji, takže jestli budeš mít možnost ho zachránit, využij ji.
	KnowsAboutGorn = TRUE;
};

instance DIA_Lee_RescueDarius(C_Info)
{
	npc = SLD_800_Lee;
	nr = 2;
	condition = DIA_Lee_RescueDarius_Condition;
	information = DIA_Lee_RescueDarius_Info;
	permanent = FALSE;
	description = "Potřebuješ ještě s něčím pomoct?";
};

func int DIA_Lee_RescueDarius_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Lee_RescueGorn) == TRUE) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Lee_RescueDarius_Info()
{
	AI_Output(other,self,"DIA_Lee_RescueDarius_01_00");	//Potřebuješ ještě s něčím pomoct?
	AI_Output(self,other,"DIA_Lee_RescueDarius_01_01");	//(zamyšleně) Ano, něco bych potřeboval. Ale nevím jestli má cenu tě o to žádat.
	AI_Output(other,self,"DIA_Lee_RescueDarius_01_02");	//Tak povídej. O co jde?
	AI_Output(self,other,"DIA_Lee_RescueDarius_01_03");	//Pamatuješ, před pádem bariéry, Gomezovi lidé obsadili rudný důl Nového tábora.
	AI_Output(other,self,"DIA_Lee_RescueDarius_01_04");	//Samozřejmě.
	AI_Output(self,other,"DIA_Lee_RescueDarius_01_05");	//V té době jsem věděl, že může k něčemu takovému dojít a musel jsem přijmout veškerá nezbytná opatření.
	AI_Output(self,other,"DIA_Lee_RescueDarius_01_06");	//Proto jsem poslal malý oddíl žoldáků pod vedením mého přítele - Dariuse.
	AI_Output(self,other,"DIA_Lee_RescueDarius_01_07");	//On a jeho lidi měli posílit ochranu dolu proti případnému útoku.
	AI_Output(self,other,"DIA_Lee_RescueDarius_01_08");	//Nicméně, jak víš, ani toto opatření nestačilo na odražení Gomezova útoku.
	AI_Output(self,other,"DIA_Lee_RescueDarius_01_09");	//Musel nás tenkrát někdo zradit. A díky této zradě zemřelo spoustu dobrých lidí!
	AI_Output(self,other,"DIA_Lee_RescueDarius_01_12");	//Ale mě stále trápí jedna zásadní otázka.
	AI_Output(other,self,"DIA_Lee_RescueDarius_01_13");	//Kdo to byl?
	AI_Output(self,other,"DIA_Lee_RescueDarius_01_14");	//Poté, co jsem získali důl zpátky, jsme vše důkladně prohledali.
	AI_Output(self,other,"DIA_Lee_RescueDarius_01_15");	//Procházeli jsme důl a sbírali těla našich padlých kamarádů, ale Dariusovo tělo se nikdy nenašlo! 
	AI_Output(other,self,"DIA_Lee_RescueDarius_01_16");	//Možná prostě utekl?
	AI_Output(self,other,"DIA_Lee_RescueDarius_01_17");	//To neříkej! Znal jsem toho muže ještě z dob, kdy velel královským vojskům.
	AI_Output(self,other,"DIA_Lee_RescueDarius_01_18");	//Darius nebyl zbabělec a vždycky se na něj dalo spolehnout.
	AI_Output(self,other,"DIA_Lee_RescueDarius_01_19");	//Navíc, ti co přežili, tvrdili, že viděli jak bojuje s Gomezovými strážemi.
	AI_Output(self,other,"DIA_Lee_RescueDarius_01_20");	//Takže se bil až do konce, jako skutečný válečník.
	AI_Output(self,other,"DIA_Lee_RescueDarius_01_21");	//Možná nám tenkrát něco uniklo, ale pochop, nebylo moc času.
	AI_Output(self,other,"DIA_Lee_RescueDarius_01_22");	//Magická bariéra padla a my jsme se nějak museli dostat z toho prokletého údolí.
	AI_Output(self,other,"DIA_Lee_RescueDarius_01_23");	//Samozřejmě všichni na to už se dávno zapomněli. Ale já ne!
	AI_Output(self,other,"DIA_Lee_RescueDarius_01_24");	//Cítím, že ta záležitost pro mě není stále vyřešena a že musím najít svého starého přítele. 
	AI_Output(self,other,"DIA_Lee_RescueDarius_01_25");	//No, nebo alespoň to, co z něj zbylo.
	AI_Output(self,other,"DIA_Lee_RescueDarius_01_26");	//To je důvod, proč tě chci požádat o laskavost. Jestli se v nejbližší době dostaneš do Hornického údolí, zkus najít odpověď na mojí otázku.
	AI_Output(self,other,"DIA_Lee_RescueDarius_01_28");	//Možná, že budeš mít víc štěstí než my. Dobře?
	AI_Output(other,self,"DIA_Lee_RescueDarius_01_29");	//Postarám se o to.
	MIS_MissOldFriend = LOG_Running;
	Log_CreateTopic(TOPIC_MissOldFriend,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MissOldFriend,LOG_Running);
	B_LogEntry(TOPIC_MissOldFriend,"Lee mi pověděl, že před útokem na svobodný důl poslal malou skupinku žoldáků, v čele s jeho přítelem Dariusem, k posílení ochrany dolu. Nikdo neví proč se nepodařilo útok odrazit a co se stalo s Dariem. Lee mě požádal, že až se dostanu do kolonie, jestli bych se nepokusil nalézt odpovědi.");
};

instance DIA_Lee_RescueDarius_Done(C_Info)
{
	npc = SLD_800_Lee;
	nr = 2;
	condition = DIA_Lee_RescueDarius_Done_Condition;
	information = DIA_Lee_RescueDarius_Done_Info;
	permanent = FALSE;
	description = "Tvůj starý přítel Darius se k vám brzo připojí.";
};

func int DIA_Lee_RescueDarius_Done_Condition()
{
	if((MIS_MissOldFriend == LOG_Running) && (DariusNWIns == TRUE) && (DariusIsFree == TRUE) && (DariusNWIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lee_RescueDarius_Done_Info()
{
	B_GivePlayerXP(2000);
	AI_Output(other,self,"DIA_Lee_RescueDarius_Done_01_00");	//Tvůj starý přítel Darius se k vám brzo připojí.
	AI_Output(self,other,"DIA_Lee_RescueDarius_Done_01_01");	//Už to vím, kamaráde. Přišel před pár dny.
	AI_Output(other,self,"DIA_Lee_RescueDarius_Done_01_02");	//Vše v pořádku?
	AI_Output(self,other,"DIA_Lee_RescueDarius_Done_01_03");	//Och, ano! Ale potřebuje trochu času, Aby nasbíral nové síly po těžkém přechodu přes hory.
	AI_Output(self,other,"DIA_Lee_RescueDarius_Done_01_04");	//Mimochodem, už mi vyprávěl o tom, jak dokázal tak dlouho přežít. A jak jsi mu pomohl se z této těžké situace dostat.
	AI_Output(self,other,"DIA_Lee_RescueDarius_Done_01_06");	//Proto, i jménem všech jeho kamarádů, ti děkuju!
	AI_Output(self,other,"DIA_Lee_RescueDarius_Done_01_07");	//A jako důkaz mé vděčnosti, ti chci něco dát.
	B_GiveInvItems(self,other,ItBe_NordmarBelt,1);
	AI_Output(self,other,"DIA_Lee_RescueDarius_Done_01_08");	//Zde, tento opasek! Je vyroben z odolné kůže Nordmardského sněžného lva. Věř mi, takový jinde nenajdeš.
	MIS_MissOldFriend = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_MissOldFriend,LOG_SUCCESS);
	B_LogEntry(TOPIC_MissOldFriend,"Darius se opět přidal k Leemu, ten byl velmi šťastný a daroval mi opasek z Nordmardského sněžného lva.");
};

instance DIA_Lee_Success(C_Info)
{
	npc = SLD_800_Lee;
	nr = 2;
	condition = DIA_Lee_Success_Condition;
	information = DIA_Lee_Success_Info;
	permanent = FALSE;
	description = "Osvobodil jsem Gorna.";
};


func int DIA_Lee_Success_Condition()
{
	if((MIS_RescueGorn == LOG_SUCCESS) && (Kapitel >= 3) && (other.guild == GIL_SLD))
	{
		return TRUE;
	};
};

func void DIA_Lee_Success_Info()
{
	AI_Output(other,self,"DIA_Lee_Success_15_00");	//Osvobodil jsem Gorna.
	AI_Output(self,other,"DIA_Lee_Success_04_01");	//Už se mnou mluvil. Dobrá práce!
	AI_Output(self,other,"DIA_Lee_Success_04_02");	//Je cennější než Sylvio i s jeho bandou dohromady.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Lee_AboutGorn(C_Info)
{
	npc = SLD_800_Lee;
	nr = 5;
	condition = DIA_Lee_AboutGorn_Condition;
	information = DIA_Lee_AboutGorn_Info;
	permanent = FALSE;
	description = "Gorn ti o mě říkal? Co se mu stalo?";
};


func int DIA_Lee_AboutGorn_Condition()
{
	if((Kapitel < 3) && (Npc_KnowsInfo(other,DIA_Lee_RescueGorn) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lee_AboutGorn_Info()
{
	AI_Output(other,self,"DIA_Lee_AboutGorn_15_00");	//Gorn ti o mě říkal? Co se mu stalo?
	AI_Output(self,other,"DIA_Lee_AboutGorn_04_01");	//Pamatuješ si ho, ne?
	Info_ClearChoices(DIA_Lee_AboutGorn);
	Info_AddChoice(DIA_Lee_AboutGorn,"Musím si zavzpomínat...",DIA_Lee_AboutGorn_Who);
	Info_AddChoice(DIA_Lee_AboutGorn,"Jasně.",DIA_Lee_AboutGorn_Yes);
};

func void DIA_Lee_AboutGorn_Yes()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Lee_AboutGorn_Yes_15_00");	//Jasně, že jo.
	AI_Output(self,other,"DIA_Lee_AboutGorn_Yes_04_01");	//Chytli ho paladinové a poslali ho zpět do Hornického údolí.
	AI_Output(self,other,"DIA_Lee_AboutGorn_Yes_04_02");	//Pokud by se cesta nehemžila skřety, už bych pro něj poslal pár kluků.
	AI_Output(self,other,"DIA_Lee_AboutGorn_Yes_04_03");	//Ale teď to nemá smysl. Chudák Gorn.
	Info_ClearChoices(DIA_Lee_AboutGorn);
};

func void DIA_Lee_AboutGorn_Who()
{
	AI_Output(other,self,"DIA_Lee_AboutGorn_Who_15_00");	//Musím se zamyslet...
	AI_Output(self,other,"DIA_Lee_AboutGorn_Who_04_01");	//Velký, černý, silný a s velkou sekerou - dobyl s tebou náš důl, když ho zabral Gomez.
};


instance DIA_Lee_WegenBullco(C_Info)
{
	npc = SLD_800_Lee;
	nr = 6;
	condition = DIA_Lee_WegenBullco_Condition;
	information = DIA_Lee_WegenBullco_Info;
	permanent = FALSE;
	description = "Bullco může za ztrátu Onarových ovcí...";
};


func int DIA_Lee_WegenBullco_Condition()
{
	if((Kapitel < 4) && (MIS_Pepe_KillWolves == LOG_SUCCESS) && (Onar_WegenPepe == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Lee_WegenBullco_Info()
{
	AI_Output(other,self,"DIA_Lee_Add_15_00");	//Bullco může za ztrátu Onarových ovcí...
	AI_Output(self,other,"DIA_Lee_Add_04_01");	//Och, ať jde do prdele. Mám dost problémů.
	if((Bullco_scharf == TRUE) && !Npc_IsDead(Bullco))
	{
		AI_Output(other,self,"DIA_Lee_Add_15_02");	//Já taky. A Bullco má problém i se mnou - chce, abych opustil farmu...
		AI_Output(self,other,"DIA_Lee_Add_04_03");	//A co ty na to?
		AI_Output(self,other,"DIA_Lee_Add_04_04");	//Víš co? Řekni mu, aby se ovládal, nebo mu ty ovce strhnu z žoldu...
	};
};


instance DIA_Lee_Report(C_Info)
{
	npc = SLD_800_Lee;
	nr = 3;
	condition = DIA_Lee_Report_Condition;
	information = DIA_Lee_Report_Info;
	permanent = FALSE;
	description = "Vrátil jsem se z údolí.";
};


func int DIA_Lee_Report_Condition()
{
	if((EnterOW_Kapitel2 == TRUE) && (Kapitel <= 3))
	{
		return TRUE;
	};
};

func void DIA_Lee_Report_Info()
{
	AI_Output(other,self,"DIA_Lee_Add_15_18");	//Vrátil jsem se z údolí. Hrad napadli draci!
	AI_Output(self,other,"DIA_Lee_Add_04_19");	//Takže je to pravda! Lares říkal něco o dracích... Ale nevěřil jsem mu...
	AI_Output(self,other,"DIA_Lee_Add_04_20");	//Co paladinové?
	AI_Output(other,self,"DIA_Lee_Add_15_21");	//Dokonale zdecimováni.

	if(other.guild == GIL_SLD)
	{
		AI_Output(self,other,"DIA_Lee_Add_04_22");	//Alespoň, že tak. Možná teď Hagen znovu zváží mou nabídku...
		AI_Output(self,other,"DIA_Lee_Add_04_23");	//A jestli ne... (houževnatě) Tak já už najdu jinou cestu...
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_Add_04_24");	//Dobrá! Možná se teď Hagen s vojskem přesune do údolí...
		AI_Output(self,other,"DIA_Lee_Add_04_25");	//Moc paladinů tu nezůstane.
	};
};

instance DIA_Lee_ArmorM(C_Info)
{
	npc = SLD_800_Lee;
	nr = 3;
	condition = DIA_Lee_ArmorM_Condition;
	information = DIA_Lee_ArmorM_Info;
	permanent = TRUE;
	description = "Co takhle lepší zbroj?";
};

func int DIA_Lee_ArmorM_Condition()
{
	if((Kapitel < 3) && (other.guild == GIL_SLD))
	{
		return TRUE;
	};
};

func void DIA_Lee_ArmorM_Info()
{
	AI_Output(other,self,"DIA_Lee_ArmorM_15_00");	//Co takhle lepší zbroj?
	AI_Output(self,other,"DIA_Lee_ArmorM_04_02");	//Mám tu nějakou lepší zbroj, ale budeš za ni muset zaplatit.
	Info_ClearChoices(DIA_Lee_ArmorM);
	Info_AddChoice(DIA_Lee_ArmorM,Dialog_Back,DIA_Lee_ArmorM_back);

	if((Lee_SldMGiven == FALSE) && (Kapitel >= 1))
	{
		Info_AddChoice(DIA_Lee_ArmorM,"Zbroj žoldáka (cena: 2000 zlatých)",DIA_Lee_BuyArmorM_Ok);
	};
	if((Lee_SldHGiven == FALSE) && (Kapitel >= 2))
	{
		Info_AddChoice(DIA_Lee_ArmorM,"Těžká zbroj žoldáka (cena: 8000 zlatých)",DIA_Lee_BuyArmorH_Ok);
	};
};

func void DIA_Lee_ArmorM_back()
{
	Info_ClearChoices(DIA_Lee_ArmorM);
};

func void DIA_Lee_BuyArmorM_Ok()
{
	AI_Output(other,self,"DIA_Lee_BuyArmorM_15_00");	//Dej mi tu zbroj.

	if(B_GiveInvItems(other,self,ItMi_Gold,2000))
	{
		AI_Output(self,other,"DIA_Lee_BuyArmorM_04_01");	//Tady máš! Je to dobrá zbroj.
		CreateInvItems(other,itar_sld_M,1);
		AI_EquipArmor(other,itar_sld_M);
		Lee_SldMGiven = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_BuyArmorM_04_02");	//Ale to není dar! Prvně chci vidět zlato!
	};
};

func void DIA_Lee_BuyArmorH_Ok()
{
	AI_Output(other,self,"DIA_Lee_BuyArmorH_15_00");	//Dej mi těžkou zbroj žoldáka.

	if(B_GiveInvItems(other,self,ItMi_Gold,8000))
	{
		AI_Output(self,other,"DIA_Lee_BuyArmorH_04_01");	//Tady máš! Je to velmi dobrá zbroj. Sám ji mám na sobě.
		CreateInvItems(other,ItAr_Sld_H,1);
		AI_EquipArmor(other,ItAr_Sld_H);
		Lee_SldHGiven = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_BuyArmorH_04_02");	//Víš, jak to chodí. Prvně zlato!
	};
};


instance DIA_Lee_Richter(C_Info)
{
	npc = SLD_800_Lee;
	nr = 3;
	condition = DIA_Lee_Richter_Condition;
	information = DIA_Lee_Richter_Info;
	permanent = FALSE;
	description = "Máš pro mě práci?";
};


func int DIA_Lee_Richter_Condition()
{
	if((Kapitel >= 3) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)) && (Npc_IsDead(Richter) == FALSE) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lee_Richter_Info()
{
	AI_Output(other,self,"DIA_Lee_Richter_15_00");	//Máš pro mě práci?
	AI_Output(self,other,"DIA_Lee_Richter_04_01");	//Ty nemáš dost, co? Tak co bys rád?
	AI_Output(other,self,"DIA_Lee_Richter_15_02");	//Další práci. Pořád jsem žoldák, víš?
	AI_Output(self,other,"DIA_Lee_Richter_04_03");	//Dobrá, něco ti dám.
	AI_Output(self,other,"DIA_Lee_Richter_04_04");	//Mám problém se soudcem ve městě. Udělal bych to rád sám.
	AI_Output(self,other,"DIA_Lee_Richter_04_05");	//Ale paladinové mě nepustí do horní čtvrti.
	AI_Output(self,other,"DIA_Lee_Richter_04_06");	//Tak pozorně poslouchej. Půjdeš k soudci a nabídneš mu své služby.
	AI_Output(self,other,"DIA_Lee_Richter_04_07");	//Snaž se získat si jeho důvěru nějakou špinavou prací.
	AI_Output(self,other,"DIA_Lee_Richter_04_08");	//Ta svině určtě nějakou mít bude.
	AI_Output(self,other,"DIA_Lee_Richter_04_09");	//Přines mi něco, s čím budu moci očernit jeho jméno a on skončí v base.
	AI_Output(self,other,"DIA_Lee_Richter_04_10");	//Ale nechci ho zabít. To by bylo moc rychlé. Chci aby trpěl, jasné?
	AI_Output(self,other,"DIA_Lee_Richter_04_11");	//Můžeš to udělat?
	Log_CreateTopic(TOPIC_RichterLakai,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RichterLakai,LOG_Running);
	B_LogEntry(TOPIC_RichterLakai,"Lee chce, abych vyhrabal nějakou špínu na městského soudce. A dostal ho za to do vězení.");
	MIS_Lee_JudgeRichter = LOG_Running;
	Info_ClearChoices(DIA_Lee_Richter);
	Info_AddChoice(DIA_Lee_Richter,"Neudělám to.",DIA_Lee_Richter_nein);
	Info_AddChoice(DIA_Lee_Richter,"Bez problému. Kolik?",DIA_Lee_Richter_wieviel);
};

func void DIA_Lee_Richter_wieviel()
{
	AI_Output(other,self,"DIA_Lee_Richter_wieviel_15_00");	//Bez problému. Kolik?
	AI_Output(self,other,"DIA_Lee_Richter_wieviel_04_01");	//Odměna bude podle toho, co mi přineseš za informace. Tak to zkus.
	Info_ClearChoices(DIA_Lee_Richter);
};

func void DIA_Lee_Richter_nein()
{
	AI_Output(other,self,"DIA_Lee_Richter_nein_15_00");	//Neudělám to. Nechci mít s tím prasetem nic společného.
	AI_Output(self,other,"DIA_Lee_Richter_nein_04_01");	//Když myslíš. Ale byl to on, kdo tě odsoudil k pobytu v bariéře. Pamatuješ?
	AI_Output(self,other,"DIA_Lee_Richter_nein_04_02");	//Dělej jak myslíš, ale doufám, že se rozhodneš správně.
	Info_ClearChoices(DIA_Lee_Richter);
};


instance DIA_Lee_RichterBeweise(C_Info)
{
	npc = SLD_800_Lee;
	nr = 3;
	condition = DIA_Lee_RichterBeweise_Condition;
	information = DIA_Lee_RichterBeweise_Info;
	description = "Mám něco na toho soudce.";
};


func int DIA_Lee_RichterBeweise_Condition()
{
	if((Kapitel >= 3) && (CAPITANORDERDIAWAY == FALSE) && (MIS_Lee_JudgeRichter == LOG_Running) && Npc_HasItems(other,ItWr_RichterKomproBrief_MIS) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void DIA_Lee_RichterBeweise_Info()
{
	AI_Output(other,self,"DIA_Lee_RichterBeweise_15_00");	//Mám něco na toho soudce.
	AI_Output(self,other,"DIA_Lee_RichterBeweise_04_01");	//Opravdu? Co je to?
	AI_Output(other,self,"DIA_Lee_RichterBeweise_15_02");	//Najal několik zločinců, aby okradli místodržícího Khorinisu.
	AI_Output(other,self,"DIA_Lee_RichterBeweise_15_03");	//Brzy poté je nechal zatknout a získal všechno zlato.
	AI_Output(other,self,"DIA_Lee_RichterBeweise_15_04");	//Přinesl jsem ti rozkazy, které jim soudce napsal.
	AI_Output(self,other,"DIA_Lee_RichterBeweise_04_05");	//Ukaž mi to.
	B_GiveInvItems(other,self,ItWr_RichterKomproBrief_MIS,1);
	B_UseFakeScroll();
	if(Npc_IsDead(Richter) == FALSE)
	{
		AI_Output(self,other,"DIA_Lee_RichterBeweise_04_06");	//To by mělo stačit. Jsem ohromen.
		AI_Output(self,other,"DIA_Lee_RichterBeweise_04_07");	//Jsem ochoten ti štědře zaplatit. Zde je tvá odměna.
		CreateInvItems(self,ItMi_Gold,500);
		B_GiveInvItems(self,other,ItMi_Gold,500);
		MIS_Lee_JudgeRichter = LOG_SUCCESS;
		B_GivePlayerXP(XP_JudgeRichter);
		AI_Output(self,other,"DIA_Lee_RichterBeweise_04_08");	//A nikomu ani slova, ano?
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_RichterBeweise_04_09");	//To je sice skvělé, ale věci se vyřešily samy. Soudce je mrtvý.
		AI_Output(self,other,"DIA_Lee_RichterBeweise_04_10");	//Nějakej idiot ho zabil. No jo. Taky dobré.
		AI_Output(self,other,"DIA_Lee_RichterBeweise_04_11");	//Tu máš pár mincí. Jako kompenzaci za čas.
		CreateInvItems(self,ItMi_Gold,250);
		B_GiveInvItems(self,other,ItMi_Gold,250);
		MIS_Lee_JudgeRichter = LOG_FAILED;
		B_GivePlayerXP(XP_Ambient);
	};
};


instance DIA_Lee_TalkAboutBennet(C_Info)
{
	npc = SLD_800_Lee;
	nr = 3;
	condition = DIA_Lee_TalkAboutBennet_Condition;
	information = DIA_Lee_TalkAboutBennet_Info;
	permanent = FALSE;
	description = "Co se stalo s Bennetem?";
};


func int DIA_Lee_TalkAboutBennet_Condition()
{
	if((MIS_RescueBennet == LOG_Running) && (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Lee_TalkAboutBennet_Info()
{
	AI_Output(other,self,"DIA_Lee_TalkAboutBennet_15_00");	//Co se stalo s Bennetem?
	AI_Output(self,other,"DIA_Lee_TalkAboutBennet_04_01");	//Takže jsi o tom slyšel. Ti bastardi ho zavřeli.

	if((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL))
	{
		AI_Output(self,other,"DIA_Lee_TalkAboutBennet_04_02");	//Jako bych neměl problémy se svými lidmi, teď se ještě musím starat o paladiny.
	};
};


instance DIA_Lee_DoAboutBennet(C_Info)
{
	npc = SLD_800_Lee;
	nr = 3;
	condition = DIA_Lee_DoAboutBennet_Condition;
	information = DIA_Lee_DoAboutBennet_Info;
	permanent = FALSE;
	description = "Co bude s Bennetem?";
};


func int DIA_Lee_DoAboutBennet_Condition()
{
	if((MIS_RescueBennet == LOG_Running) && Npc_KnowsInfo(other,DIA_Lee_TalkAboutBennet))
	{
		return TRUE;
	};
};

func void DIA_Lee_DoAboutBennet_Info()
{
	AI_Output(other,self,"DIA_Lee_DoAboutBennet_15_00");	//Co bude s Bennetem?
	AI_Output(self,other,"DIA_Lee_DoAboutBennet_04_01");	//To ještě nevím. Pár chlapů chce vrazit do města a narvat Hagenovi jeho zuby hezky hluboko do krku.
	AI_Output(self,other,"DIA_Lee_DoAboutBennet_04_02");	//Bohužel na to nemáme dost lidí.
	AI_Output(other,self,"DIA_Lee_DoAboutBennet_15_03");	//Takže tu budeš stát a koukat, co se děje?
	AI_Output(self,other,"DIA_Lee_DoAboutBennet_04_04");	//Jasně, že ne.
	B_LogEntry(TOPIC_RescueBennet,"Pokud se neprokáže jeho nevina, Lee nemůže zaručit, že jeho lidé nenapadnou město.");

	if(!Npc_IsDead(Lares))
	{
		AI_Output(self,other,"DIA_Lee_DoAboutBennet_04_05");	//Lares je ve městě a snaží se něco vymyslet.
		AI_Output(self,other,"DIA_Lee_DoAboutBennet_04_06");	//Doufám, že mu to nebude trvat moc dlouho.
	};
	if(!Npc_IsDead(Buster) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		AI_Output(self,other,"DIA_Lee_DoAboutBennet_04_07");	//A ještě něco. Skoro jsem zapomněl... Chce s tebou mluvit Buster. Neřekl mi, o co jde. Možná bys měl za ním zajít.
	};
};


instance DIA_Lee_CanHelpYou(C_Info)
{
	npc = SLD_800_Lee;
	nr = 3;
	condition = DIA_Lee_CanHelpYou_Condition;
	information = DIA_Lee_CanHelpYou_Info;
	permanent = FALSE;
	description = "Můžu ti pomoci s tou věcí kolem Benneta?";
};


func int DIA_Lee_CanHelpYou_Condition()
{
	if((MIS_RescueBennet == LOG_Running) && Npc_KnowsInfo(other,DIA_Lee_DoAboutBennet))
	{
		return TRUE;
	};
};

func void DIA_Lee_CanHelpYou_Info()
{
	AI_Output(other,self,"DIA_Lee_CanHelpYou_15_00");	//Můžu ti pomoci s tou věcí kolem Benneta?
	AI_Output(self,other,"DIA_Lee_CanHelpYou_04_01");	//Přirozeně. Trocha inteligence by byla od věci.
	AI_Output(self,other,"DIA_Lee_CanHelpYou_04_02");	//Innos ví, že tady jsou samí tupci.
	AI_Output(self,other,"DIA_Lee_CanHelpYou_04_03");	//Jdi do města a zkus něco vymyslet.
	AI_Output(self,other,"DIA_Lee_CanHelpYou_04_04");	//Ale pospěš, nevím jak dlouho své chlapy udržím pod kontrolou.
};


var int DIA_Lee_AnyNews_OneTime;

instance DIA_Lee_AnyNews(C_Info)
{
	npc = SLD_800_Lee;
	nr = 3;
	condition = DIA_Lee_AnyNews_Condition;
	information = DIA_Lee_AnyNews_Info;
	permanent = TRUE;
	description = "Něco nového o Bennetovi?";
};


func int DIA_Lee_AnyNews_Condition()
{
	if((MIS_RescueBennet != FALSE) && Npc_KnowsInfo(other,DIA_Lee_DoAboutBennet) && (DIA_Lee_AnyNews_OneTime == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lee_AnyNews_Info()
{
	AI_Output(other,self,"DIA_Lee_AnyNews_15_00");	//Něco nového o Bennetovi?
	if(MIS_RescueBennet == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lee_AnyNews_04_01");	//Nevypadá to, že by ve vězení trpěl.
		AI_Output(self,other,"DIA_Lee_AnyNews_04_02");	//To je dobře.
		if(DIA_Lee_AnyNews_OneTime == FALSE)
		{
			B_GivePlayerXP(XP_Ambient);
			DIA_Lee_AnyNews_OneTime = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_AnyNews_04_03");	//Nic moc nevím.
	};
};


instance DIA_Lee_SYLVIO(C_Info)
{
	npc = SLD_800_Lee;
	nr = 3;
	condition = DIA_Lee_SYLVIO_Condition;
	information = DIA_Lee_SYLVIO_Info;
	description = "Co se zatím stalo?";
};


func int DIA_Lee_SYLVIO_Condition()
{
	if((MIS_ReadyforChapter4 == TRUE) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lee_SYLVIO_Info()
{
	AI_Output(other,self,"DIA_Lee_SYLVIO_15_00");	//Co se zatím stalo?
	AI_Output(self,other,"DIA_Lee_SYLVIO_04_01");	//Ten bastard Sylvio slyšel o dracích v údolí a vyburcoval celou farmu.
	AI_Output(self,other,"DIA_Lee_SYLVIO_04_02");	//Chce chlapy přesvědčit, aby ho následovali do údolí. Slíbil jim slávu, bohatství a Innos ví co ještě.
	AI_Output(self,other,"DIA_Lee_SYLVIO_04_03");	//Moc z nich se nenadchla myšlenka zemřít kvůli Sylviovu blbému nápadu, ale přesto se našlo pár idiotu co mu na to škočilo.
	AI_Output(self,other,"DIA_Lee_SYLVIO_04_04");	//Vzali si vybavení od Benneta a zmizeli.
	AI_Output(self,other,"DIA_Lee_SYLVIO_04_05");	//(s úlevou) Nakonec jsem i rád, že Sylvio opustil farmu.
};


instance DIA_Lee_KAP4_EXIT(C_Info)
{
	npc = SLD_800_Lee;
	nr = 999;
	condition = DIA_Lee_KAP4_EXIT_Condition;
	information = DIA_Lee_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lee_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Lee_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lee_CanTeach(C_Info)
{
	npc = SLD_800_Lee;
	nr = 10;
	condition = DIA_Lee_CanTeach_Condition;
	information = DIA_Lee_CanTeach_Info;
	permanent = TRUE;
	description = "Můžeš mě učit?";
};


func int DIA_Lee_CanTeach_Condition()
{
	if((Kapitel >= 4) && (Lee_TeachPlayer == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lee_CanTeach_Info()
{
	AI_Output(other,self,"DIA_Lee_CanTeach_15_00");	//Můžeš mě učit?
	AI_Output(self,other,"DIA_Lee_CanTeach_04_01");	//Můžu ti ukázat, jak bojovat s obouručákem.
	if(other.HitChance[NPC_TALENT_2H] < 75)
	{
		AI_Output(self,other,"DIA_Lee_CanTeach_04_02");	//Ale nemám čas tě učit základům.
		AI_Output(self,other,"DIA_Lee_CanTeach_04_03");	//Jakmile se procvičíš, vezmu tě do své péče. Zatím si najdi jiného učitele.
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_CanTeach_04_04");	//Slyšel jsem, že už jsi celkem dobrý. Myslím, že ti můžu ukázat trik, nebo dva.
		if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
		{
			Lee_TeachPlayer = TRUE;
			Log_CreateTopic(Topic_SoldierTeacher,LOG_NOTE);
			B_LogEntry(Topic_SoldierTeacher,"Lee mě může cvičit s obouručními zbraněmi.");
		}
		else
		{
			AI_Output(self,other,"DIA_Lee_CanTeach_04_05");	//Jestli budeš chtít něco naučit, tak to bude něco stát.
			AI_Output(other,self,"DIA_Lee_CanTeach_15_06");	//Kolik?
			AI_Output(self,other,"DIA_Lee_CanTeach_04_07");	//1000 zlatých a můžem začít.
			Info_ClearChoices(DIA_Lee_CanTeach);
			Info_AddChoice(DIA_Lee_CanTeach,"Moc drahé.",DIA_Lee_CanTeach_No);
			if(Npc_HasItems(other,ItMi_Gold) >= 1000)
			{
				Info_AddChoice(DIA_Lee_CanTeach,"Souhlasím. Tady máš zlato.",DIA_Lee_CanTeach_Yes);
			};
		};
	};
};

func void DIA_Lee_CanTeach_No()
{
	AI_Output(other,self,"DIA_Lee_CanTeach_No_15_00");	//Moc drahé.
	AI_Output(self,other,"DIA_Lee_CanTeach_No_04_01");	//Přemýšlej o tom. Někoho jako jsem já jen tak nenajdeš.
	Info_ClearChoices(DIA_Lee_CanTeach);
};

func void DIA_Lee_CanTeach_Yes()
{
	AI_Output(other,self,"DIA_Lee_CanTeach_Yes_15_00");	//Souhlasím. Tady máš zlato.
	AI_Output(self,other,"DIA_Lee_CanTeach_Yes_04_01");	//Neboj, stojí to za to.
	B_GiveInvItems(other,self,ItMi_Gold,1000);
	Lee_TeachPlayer = TRUE;
	Info_ClearChoices(DIA_Lee_CanTeach);
	Log_CreateTopic(Topic_SoldierTeacher,LOG_NOTE);
	B_LogEntry(Topic_SoldierTeacher,"Lee mě bude trénovat s obouručními zbraněmi.");
};


instance DIA_Lee_Teach(C_Info)
{
	npc = SLD_800_Lee;
	nr = 10;
	condition = DIA_Lee_Teach_Condition;
	information = DIA_Lee_Teach_Info;
	permanent = TRUE;
	description = "Cvič mě.";
};


func int DIA_Lee_Teach_Condition()
{
	if(Lee_TeachPlayer == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Lee_Teach_Info()
{
	AI_Output(other,self,"DIA_Lee_Teach_15_00");	//Cvič mě.
	Info_ClearChoices(DIA_Lee_Teach);
	Info_AddChoice(DIA_Lee_Teach,Dialog_Back,DIA_Lee_Teach_Back);
	Info_AddChoice(DIA_Lee_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Lee_Teach_2H_1);
	Info_AddChoice(DIA_Lee_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Lee_Teach_2H_5);
};

func void DIA_Lee_Teach_Back()
{
	Info_ClearChoices(DIA_Lee_Teach);
};

func void DIA_Lee_Teach_2H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,100);
	if(other.HitChance[NPC_TALENT_2H] >= 100)
	{
		AI_Output(self,other,"DIA_DIA_Lee_Teach_2H_1_04_00");	//Nyní jsi opravdový mistr.
		AI_Output(self,other,"DIA_DIA_Lee_Teach_2H_1_04_01");	//Už nepotřebuješ učitele.
	};
	Info_ClearChoices(DIA_Lee_Teach);
	Info_AddChoice(DIA_Lee_Teach,Dialog_Back,DIA_Lee_Teach_Back);
	Info_AddChoice(DIA_Lee_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Lee_Teach_2H_1);
	Info_AddChoice(DIA_Lee_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Lee_Teach_2H_5);
};

func void DIA_Lee_Teach_2H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,100);
	if(other.HitChance[NPC_TALENT_2H] >= 100)
	{
		AI_Output(self,other,"DIA_Lee_Teach_2H_5_04_00");	//Nyní jsi opravdový mistr.
		AI_Output(self,other,"DIA_Lee_Teach_2H_5_04_01");	//Už nepotřebuješ učitele.
	};
	Info_ClearChoices(DIA_Lee_Teach);
	Info_AddChoice(DIA_Lee_Teach,Dialog_Back,DIA_Lee_Teach_Back);
	Info_AddChoice(DIA_Lee_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Lee_Teach_2H_1);
	Info_AddChoice(DIA_Lee_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Lee_Teach_2H_5);
};


instance DIA_Lee_DRACHENEI(C_Info)
{
	npc = SLD_800_Lee;
	nr = 4;
	condition = DIA_Lee_DRACHENEI_Condition;
	information = DIA_Lee_DRACHENEI_Info;
	description = "Ještěří lidé roznášejí dračí vejce po celé zemi.";
};


func int DIA_Lee_DRACHENEI_Condition()
{
	if(Npc_HasItems(other,ItAt_DragonEgg_MIS) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lee_DRACHENEI_Info()
{
	AI_Output(other,self,"DIA_Lee_DRACHENEI_15_00");	//Ještěří lidé roznášejí dračí vejce po celé zemi.
	B_GivePlayerXP(XP_Ambient);
	AI_Output(self,other,"DIA_Lee_DRACHENEI_04_01");	//Já vím. Je čas, abychom odsud zmizeli.
	if(hero.guild == GIL_DJG)
	{
		AI_Output(other,self,"DIA_Lee_DRACHENEI_15_02");	//Co s nimi mám dělat?
		AI_Output(self,other,"DIA_Lee_DRACHENEI_04_03");	//Nevím, co myslíš?
		AI_Output(self,other,"DIA_Lee_DRACHENEI_04_04");	//Možná by se skořápky daly použít jako součást štítů, nebo zbrojí, nebo něco na ten způsob.
		AI_Output(self,other,"DIA_Lee_DRACHENEI_04_05");	//Zkus promluvit s Bennetem.
		B_LogEntry(TOPIC_DRACHENEIER,"Lee mě s dračími vejci poslal za Bennetem.");
	};
};


instance DIA_Lee_KAP4_Perm(C_Info)
{
	npc = SLD_800_Lee;
	nr = 49;
	condition = DIA_Lee_KAP4_Perm_Condition;
	information = DIA_Lee_KAP4_Perm_Info;
	permanent = TRUE;
	description = "Jak se ti daří na farmě?";
};


func int DIA_Lee_KAP4_Perm_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Lee_KAP4_Perm_Info()
{
	AI_Output(other,self,"DIA_Lee_KAP4_Perm_15_00");	//Jak se ti daří na farmě?
	AI_Output(self,other,"DIA_Lee_KAP4_Perm_04_01");	//Od té doby, co Sylvio odešel, je tu lépe.
	AI_Output(other,self,"DIA_Lee_KAP4_Perm_15_02");	//To nezní špatně.
	AI_Output(self,other,"DIA_Lee_KAP4_Perm_04_03");	//Bohužel je teď méně lidí na stejné množství práce. Muži si stále více stěžují že musí dělat i za muže co odešli se Silviem.
	AI_Output(self,other,"DIA_Lee_KAP4_Perm_04_04");	//Ale neměj starosti. Zvládnu to.
};


instance DIA_Lee_KAP5_EXIT(C_Info)
{
	npc = SLD_800_Lee;
	nr = 999;
	condition = DIA_Lee_KAP5_EXIT_Condition;
	information = DIA_Lee_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lee_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Lee_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lee_GetShip(C_Info)
{
	npc = SLD_800_Lee;
	nr = 4;
	condition = DIA_Lee_GetShip_Condition;
	information = DIA_Lee_GetShip_Info;
	description = "Máš nápad, jak se dostat na loď paladinů?";
};


func int DIA_Lee_GetShip_Condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lee_GetShip_Info()
{
	AI_Output(other,self,"DIA_Lee_GetShip_15_00");	//Máš nápad jak se dostat na loď paladinů?
	AI_Output(self,other,"DIA_Lee_GetShip_04_01");	//Myslíš, že bych byl ještě tu, kdybych to věděl? Ta je chráněna lépe než dodávky rudy do Starého tábora.
	AI_Output(other,self,"DIA_Lee_GetShip_15_02");	//Musí být cesta jak se dostat na loď.
	AI_Output(self,other,"DIA_Lee_GetShip_04_03");	//Jasně. Jen se dostat na palubu.
	Log_CreateTopic(Topic_Ship,LOG_MISSION);
	Log_SetTopicStatus(Topic_Ship,LOG_Running);
	if((MIS_Lee_JudgeRichter == LOG_SUCCESS) && (Npc_IsDead(Richter) == FALSE))
	{
		AI_Output(self,other,"DIA_Lee_GetShip_04_04");	//Víš, mám soudce po kontrolou. Zajdi za ním ať napíše dopis, který by nám povolil dostat se na loď.
		MIS_RichtersPermissionForShip = LOG_Running;
		B_LogEntry(Topic_Ship,"Lee mi řekl, abych povolení získal od soudce. Ten mi ho ale jen tak dobrovolně nedá.");
	}
	else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Lee_GetShip_04_05");	//Plná moc je zde. S ní nás stráže nechají projít.
		B_LogEntry(Topic_Ship,"Lee má teď padělaný dopis, který nám umožní vstup na paladinskou galéru.");
	};
	AI_Output(self,other,"DIA_Lee_GetShip_04_06");	//Ale to není vše. Budeme potřebovat kapitána, posádku a tak dále.
	AI_Output(self,other,"DIA_Lee_GetShip_04_07");	//K dispozici jich je hodně.
	Log_CreateTopic(Topic_Crew,LOG_MISSION);
	Log_SetTopicStatus(Topic_Crew,LOG_Running);
	Log_CreateTopic(Topic_Captain,LOG_MISSION);
	Log_SetTopicStatus(Topic_Captain,LOG_Running);
	Info_ClearChoices(DIA_Lee_GetShip);
	Info_AddChoice(DIA_Lee_GetShip,Dialog_Back,DIA_Lee_GetShip_back);
	Info_AddChoice(DIA_Lee_GetShip,"Koho bych měl vzít do své posádky?",DIA_Lee_GetShip_crew);
	if(Npc_IsDead(Torlof) == FALSE)
	{
		Info_AddChoice(DIA_Lee_GetShip,"Znáš někoho, kdo umí řídit loď?",DIA_Lee_GetShip_torlof);
	};
};

func void DIA_Lee_GetShip_torlof()
{
	AI_Output(other,self,"DIA_Lee_GetShip_torlof_15_00");	//Znáš někoho, kdo umí řídit loď?
	AI_Output(self,other,"DIA_Lee_GetShip_torlof_04_01");	//Torlof se plavil na moři. Běž se ho zeptat.
	TORLOFCANBECAPITAN = TRUE;
	B_LogEntry(Topic_Captain,"Torlof byl kdysi dobrý kapitán. Možná bych ho mohl přesvědčit!");
};

func void DIA_Lee_GetShip_crew()
{
	AI_Output(other,self,"DIA_Lee_GetShip_crew_15_00");	//Koho bych měl vzít do své posádky?
	AI_Output(self,other,"DIA_Lee_GetShip_crew_04_01");	//To rozhodni ty. Ber lidi, kterým ale můžeš důvěřovat. Na kolik lidí se můžeš spolehnout?
	AI_Output(self,other,"DIA_Lee_GetShip_crew_04_02");	//Jestli potřebuješ kováře, tak Bennet je nelepší, jakého seženeš.
	B_LogEntry(Topic_Crew,"Lee se domnívá, že bych měl vzít jen lidi, kterým věřím. Jestli budu potřebovat dobrého kováře, mám vzít Benneta.");
};

func void DIA_Lee_GetShip_back()
{
	Info_ClearChoices(DIA_Lee_GetShip);
};


instance DIA_Lee_GotRichtersPermissionForShip(C_Info)
{
	npc = SLD_800_Lee;
	nr = 4;
	condition = DIA_Lee_GotRichtersPermissionForShip_Condition;
	information = DIA_Lee_GotRichtersPermissionForShip_Info;
	description = "Mám tu psanou moc. Loď je naše.";
};


func int DIA_Lee_GotRichtersPermissionForShip_Condition()
{
	if((MIS_RichtersPermissionForShip == LOG_SUCCESS) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lee_GotRichtersPermissionForShip_Info()
{
	AI_Output(other,self,"DIA_Lee_GotRichtersPermissionForShip_15_00");	//Mám tu psanou moc. Loď je nyní jen naše.
	AI_Output(self,other,"DIA_Lee_GotRichtersPermissionForShip_04_01");	//Výborně. Takže všechna ponížení co si dělal pro toho bastarda nebyla zbytečná.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Lee_StealShip(C_Info)
{
	npc = SLD_800_Lee;
	nr = 4;
	condition = DIA_Lee_StealShip_Condition;
	information = DIA_Lee_StealShip_Info;
	permanent = FALSE;
	description = "Chci ukrást loď.";
};


func int DIA_Lee_StealShip_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lee_GetShip) && (hero.guild == GIL_DJG) && (MIS_RichtersPermissionForShip == 0) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lee_StealShip_Info()
{
	AI_Output(other,self,"DIA_Lee_StealShip_15_00");	//Chci ukrást loď.
	AI_Output(self,other,"DIA_Lee_StealShip_04_01");	//A jak to chceš udělat?
	AI_Output(other,self,"DIA_Lee_StealShip_15_02");	//Půjdu tam, ukážu tvé papíry a odpluji.
	AI_Output(self,other,"DIA_Lee_StealShip_04_03");	//Dobře, cokoliv řekneš! Doufám, že víš, co děláš.
	B_GiveInvItems(self,other,ITWr_ForgedShipLetter_MIS,1);
};


instance DIA_Lee_KnowWhereEnemy(C_Info)
{
	npc = SLD_800_Lee;
	nr = 4;
	condition = DIA_Lee_KnowWhereEnemy_Condition;
	information = DIA_Lee_KnowWhereEnemy_Info;
	permanent = TRUE;
	description = "Půjdeš se mnou?";
};


func int DIA_Lee_KnowWhereEnemy_Condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && (Lee_IsOnBoard == FALSE) && (CAPITANORDERDIAWAY == FALSE) && (SCGotCaptain == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Lee_KnowWhereEnemy_Info()
{
	AI_Output(other,self,"DIA_Lee_KnowWhereEnemy_15_00");	//Půjdeš se mnou?
	AI_Output(self,other,"DIA_Lee_KnowWhereEnemy_04_01");	//Děláš si legraci? Samozřejmě.
	AI_Output(self,other,"DIA_Lee_KnowWhereEnemy_04_02");	//Můžu tě na cestě naučit obouruční i jednoruční umění s mečem. To může velmi užitečné.
	Log_CreateTopic(Topic_Crew,LOG_MISSION);
	Log_SetTopicStatus(Topic_Crew,LOG_Running);
	B_LogEntry(Topic_Crew,"Lee chce se mnou plout na kontinent. Na cestě mě může učit obouruční i jednoruční umění s mečem.");
	if(Crewmember_Count >= Max_Crew)
	{
		AI_Output(other,self,"DIA_Lee_KnowWhereEnemy_15_03");	//Loď je plná, ale jestli se najde místo, vrátím se pro tebe.
	}
	else
	{
		Info_ClearChoices(DIA_Lee_KnowWhereEnemy);
		Info_AddChoice(DIA_Lee_KnowWhereEnemy,"Jestli tě budu potřebovat, dám ti vědět.",DIA_Lee_KnowWhereEnemy_No);
		Info_AddChoice(DIA_Lee_KnowWhereEnemy,"Zbal si věci!",DIA_Lee_KnowWhereEnemy_Yes);
	};
};

func void DIA_Lee_KnowWhereEnemy_Yes()
{
	AI_Output(other,self,"DIA_Lee_KnowWhereEnemy_Yes_15_00");	//Zbal si věci!
	AI_Output(self,other,"DIA_Lee_KnowWhereEnemy_Yes_04_01");	//Cože? Teď?
	AI_Output(other,self,"DIA_Lee_KnowWhereEnemy_Yes_15_02");	//Ano. Jestli chceš jít se mnou, setkáme se v přístavu.
	AI_Output(self,other,"DIA_Lee_KnowWhereEnemy_Yes_04_03");	//Budu tam.
	B_GivePlayerXP(XP_Crewmember_Success);
	Lee_IsOnBoard = LOG_SUCCESS;
	Crewmember_Count = Crewmember_Count + 1;
	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	Info_ClearChoices(DIA_Lee_KnowWhereEnemy);
};

func void DIA_Lee_KnowWhereEnemy_No()
{
	AI_Output(other,self,"DIA_Lee_KnowWhereEnemy_No_15_00");	//Jestli tě budu potřebovat, dám ti vědět.
	AI_Output(self,other,"DIA_Lee_KnowWhereEnemy_No_04_01");	//Doufám, že víš, co děláš. Ale nezapomeň, moc dobrých chlapů tu nenajdeš.
	AI_Output(self,other,"DIA_Lee_KnowWhereEnemy_No_04_02");	//(šklebí se) Nebuď jen stejný idiot jako Sylvio.
	Lee_IsOnBoard = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Lee_KnowWhereEnemy);
};


instance DIA_Lee_LeaveMyShip(C_Info)
{
	npc = SLD_800_Lee;
	nr = 4;
	condition = DIA_Lee_LeaveMyShip_Condition;
	information = DIA_Lee_LeaveMyShip_Info;
	permanent = TRUE;
	description = "Nemůžu tě vzít s sebou!";
};


func int DIA_Lee_LeaveMyShip_Condition()
{
	if((Lee_IsOnBoard == LOG_SUCCESS) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lee_LeaveMyShip_Info()
{
	AI_Output(other,self,"DIA_Lee_LeaveMyShip_15_00");	//Nemůžu tě vzít s sebou!
	AI_Output(self,other,"DIA_Lee_LeaveMyShip_04_01");	//Cokoliv řekneš. Víš kde mě hledat!
	Lee_IsOnBoard = LOG_OBSOLETE;
	Crewmember_Count = Crewmember_Count - 1;
	Npc_ExchangeRoutine(self,"ShipOff");
};


instance DIA_Lee_StillNeedYou(C_Info)
{
	npc = SLD_800_Lee;
	nr = 4;
	condition = DIA_Lee_StillNeedYou_Condition;
	information = DIA_Lee_StillNeedYou_Info;
	permanent = TRUE;
	description = "Budeš se mi hodit!";
};


func int DIA_Lee_StillNeedYou_Condition()
{
	if(((Lee_IsOnBoard == LOG_OBSOLETE) || (Lee_IsOnBoard == LOG_FAILED)) && (Crewmember_Count < Max_Crew) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lee_StillNeedYou_Info()
{
	AI_Output(other,self,"DIA_Lee_StillNeedYou_15_00");	//Budeš se mi hodit!
	if(Lee_IsOnBoard == LOG_OBSOLETE)
	{
		AI_Output(self,other,"DIA_Lee_StillNeedYou_04_01");	//Věděl jsem to! Uvidíme se na lodi.
		Lee_IsOnBoard = LOG_SUCCESS;
		Crewmember_Count = Crewmember_Count + 1;
		if(MIS_ReadyforChapter6 == TRUE)
		{
			Npc_ExchangeRoutine(self,"SHIP");
		}
		else
		{
			Npc_ExchangeRoutine(self,"WAITFORSHIP");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_StillNeedYou_04_02");	//Víš co? Jdi do hajzlu. Jednou řekneš, že mě bereš, pak že ne, pak jo, pak ne a teď zase jo.
		AI_Output(self,other,"DIA_Lee_StillNeedYou_04_03");	//Najdi si jiného idiota!
		AI_StopProcessInfos(self);
	};
};


instance DIA_Lee_KAP6_EXIT(C_Info)
{
	npc = SLD_800_Lee;
	nr = 999;
	condition = DIA_Lee_KAP6_EXIT_Condition;
	information = DIA_Lee_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lee_KAP6_EXIT_Condition()
{
	if(Kapitel >= 6)
	{
		return TRUE;
	};
};

func void DIA_Lee_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LEE_NW_KAPITELORCATTACK(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = dia_lee_nw_kapitelorcattack_condition;
	information = dia_lee_nw_kapitelorcattack_info;
	permanent = FALSE;
	description = "Máme problém.";
};


func int dia_lee_nw_kapitelorcattack_condition()
{
	if((MIS_HELPCREW == LOG_Running) && (MOVECREWTOHOME == FALSE) && (LEEBACKNW == TRUE))
	{
		return TRUE;
	};
};

func void dia_lee_nw_kapitelorcattack_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Lee_NW_KapitelOrcAttack_01_00");	//Máme problém.
	AI_Output(self,other,"DIA_Lee_NW_KapitelOrcAttack_01_01");	//Jestli je to ohledně skřetů... Tak vše vím. Pyrokar mě informoval.
	AI_Output(self,other,"DIA_Lee_NW_KapitelOrcAttack_01_03");	//Je tu jen jedna možnost - probojovat se městem.
	AI_Output(self,other,"DIA_Lee_NW_KapitelOrcAttack_01_04");	//Také by se hodily teleportační runy. (vážně) Ale ne pro mě!
	AI_Output(self,other,"DIA_Lee_NW_KapitelOrcAttack_01_05");	//Nebyl jsem dlouhá léta generál královské armády, abych teď opustil bojiště jako největší zbabělec.
	if(LARESBACKNW == TRUE)
	{
		AI_Output(self,other,"DIA_Lee_NW_KapitelOrcAttack_01_09");	//Ale nedávej runu ani Laresovi. Chce jít se mnou!
		LEEBATTLETHROUGTH = TRUE;
		LARESBATTLETHROUGTH = TRUE;
		PERMCOUNTBACKNW = PERMCOUNTBACKNW + 2;
		B_LogEntry(TOPIC_HELPCREW,"Lee se chce probojovat městem. To samé se týká i Larese...");
	}
	else
	{
		LEEBATTLETHROUGTH = TRUE;
		PERMCOUNTBACKNW = PERMCOUNTBACKNW + 1;
		B_LogEntry(TOPIC_HELPCREW,"Lee se chce probojovat městem. To samé se týká i Larese!");
	};
	AI_Output(other,self,"DIA_Lee_NW_KapitelOrcAttack_01_12");	//Dobrá. Snad se brzy setkáme.
	AI_Output(self,other,"DIA_Lee_NW_KapitelOrcAttack_01_13");	//S tím počítej, příteli!
	b_countbackcrew();
	AI_StopProcessInfos(self);
};


instance DIA_LEE_NW_ESCAPE(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = dia_lee_nw_escape_condition;
	information = dia_lee_nw_escape_info;
	permanent = FALSE;
	description = "Jsem rád, že tě vidím živého a zdravého!";
};


func int dia_lee_nw_escape_condition()
{
	if((MIS_HELPCREW == LOG_Running) && (REPLACEPLACESCREW == TRUE) && (Lee_IsOnBoard == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_lee_nw_escape_info()
{
	var int countsuv;
	AI_Output(other,self,"DIA_Lee_NW_Escape_01_01");	//Jsem rád, že tě vidím živého a zdravého!
	AI_Output(self,other,"DIA_Lee_NW_Escape_01_02");	//Abych řekl pravdu... (usmívá se) Já také!
	AI_Output(other,self,"DIA_Lee_NW_Escape_01_03");	//Takže ses dostal skrz město?
	if((COUNTCAPTURED > 0) || (COUNTKILLERS > 0))
	{
		countsuv = COUNTSURVIVERS * 100;
		B_GivePlayerXP(countsuv);
		AI_Output(self,other,"DIA_Lee_NW_Escape_01_04");	//Jak vidíš, bylo to možné. Ale ne všichni měli takové štěstí.
		if((COUNTCAPTURED > 0) && (COUNTKILLERS == 0))
		{
			AI_Output(self,other,"DIA_Lee_NW_Escape_01_05");	//Skřeti mnoho z nás zajali!
			B_LogEntry(TOPIC_HELPCREW,"Lee je živ a zdráv na Onarově farmě. To je dobrá zpráva!");
			Log_AddEntry(TOPIC_HELPCREW,"Bohužel některé chlapy skřeti zajali a vězní je ve městě!");
		}
		else if((COUNTCAPTURED > 0) && (COUNTKILLERS > 0))
		{
			AI_Output(self,other,"DIA_Lee_NW_Escape_01_06");	//Mnoho z nás skřeti zajali a také dost zabili!
			B_LogEntry(TOPIC_HELPCREW,"Lee je znovu na Onarově farmě. Živ a zdráv!");
			Log_AddEntry(TOPIC_HELPCREW,"Nakonec se tedy probili městem! Říkal, že se to ale neobešlo beze ztrát.");
		};
		AI_Output(other,self,"DIA_Lee_NW_Escape_01_07");	//To nejsou moc dobré zprávy.
		AI_Output(self,other,"DIA_Lee_NW_Escape_01_08");	//To je zřejmé! S tím ale nic neuděláš.
	}
	else if(COUNTSURVIVERS > 0)
	{
		B_GivePlayerXP(200);
		AI_Output(self,other,"DIA_Lee_NW_Escape_01_10");	//Jak vidíš, povedlo se to všem z lodi.
		AI_Output(other,self,"DIA_Lee_NW_Escape_01_11");	//To jsou jednoduše excelentní zprávy!
		AI_Output(self,other,"DIA_Lee_NW_Escape_01_12");	//(úsměv) Nevím komu mám děkovat za tento zázrak.
		B_LogEntry(TOPIC_HELPCREW,"Na Onarově farmě jsem potkal Leeho a všechny chlapy z lodi! Skřetům se nepovedlo zajmout ani jednoho z nich.");
	};
	MIS_HELPCREW = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_HELPCREW,LOG_SUCCESS);
};


instance DIA_LEE_NW_WHEREWOLF(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = dia_lee_nw_wherewolf_condition;
	information = dia_lee_nw_wherewolf_info;
	permanent = FALSE;
	description = "Kde je žoldák jménem Wolf?!";
};


func int dia_lee_nw_wherewolf_condition()
{
	if((MIS_HUNTERSARMOR == LOG_Running) && (WOLFMEETINPRISON == FALSE) && (WOLFCAPTURED == TRUE) && !Npc_IsDead(SLD_811_Wolf))
	{
		return TRUE;
	};
};

func void dia_lee_nw_wherewolf_info()
{
	AI_Output(other,self,"DIA_Lee_NW_WhereWolf_01_01");	//Kde je žoldák jménem Wolf?
	AI_Output(self,other,"DIA_Lee_NW_WhereWolf_01_02");	//To nevím.
	AI_Output(other,self,"DIA_Lee_NW_WhereWolf_01_03");	//Ale šel se probít městem s tebou, ne?
	AI_Output(self,other,"DIA_Lee_NW_WhereWolf_01_04");	//Ano, ale ztratil jsem přehled, kde kdo byl.
	AI_Output(self,other,"DIA_Lee_NW_WhereWolf_01_05");	//Více o něm nikdo neslyšel.
	B_LogEntry(TOPIC_HUNTERSARMOR,"Wolf není na farmě a Lee neví, kde zmizel, když se chtěli probít městem.");
};


instance DIA_LEE_NW_WHYORKNOT(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = dia_lee_nw_whyorknot_condition;
	information = dia_lee_nw_whyorknot_info;
	permanent = FALSE;
	description = "Proč ještě skřeti nenapadli farmu?!";
};


func int dia_lee_nw_whyorknot_condition()
{
	if((HAGENOTHERSAGREED == TRUE) && (HAGENNOMORETIMEWAIT == FALSE))
	{
		return TRUE;
	};
};

func void dia_lee_nw_whyorknot_info()
{
	AI_Output(other,self,"DIA_Lee_NW_WhyOrkNot_01_01");	//Proč ještě skřeti nenapadli farmu?
	AI_Output(self,other,"DIA_Lee_NW_WhyOrkNot_01_02");	//To nevím. (zamyšleně) Pravděpodobně na něco čekají, nebo něco chystají.
	AI_Output(self,other,"DIA_Lee_NW_WhyOrkNot_01_05");	//Brzy ale přejdou do útoku a bojím se, že my s tím nic nezmůžeme.
};


instance DIA_LEE_NW_WHATABOUTPAL(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = dia_lee_nw_whataboutpal_condition;
	information = dia_lee_nw_whataboutpal_info;
	permanent = FALSE;
	description = "Nesu k tobě nabídku od lorda Hagena!";
};


func int dia_lee_nw_whataboutpal_condition()
{
	if(Npc_KnowsInfo(hero,dia_lee_nw_whyorknot))
	{
		return TRUE;
	};
};

func void dia_lee_nw_whataboutpal_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Lee_NW_WhatAboutPal_01_05");	//Nesu k tobě nabídku od lorda Hagena!
	AI_Output(self,other,"DIA_Lee_NW_WhatAboutPal_01_06");	//(udiveně) A co mi vůdce paladinů chce?
	AI_Output(other,self,"DIA_Lee_NW_WhatAboutPal_01_07");	//Navrhuje spojit všechny síli v boji proti skřetům.
	AI_Output(other,self,"DIA_Lee_NW_WhatAboutPal_01_08");	//Sami nemáme dost lidí, ale s tebou je hned větší šance na úspěch!
	AI_Output(self,other,"DIA_Lee_NW_WhatAboutPal_01_11");	//Abych řekl pravdu, nečekal jsem to.
	AI_Output(self,other,"DIA_Lee_NW_WhatAboutPal_01_13");	//Takže konečně poslechl zdravý rozum.
	AI_Output(other,self,"DIA_Lee_NW_WhatAboutPal_01_15");	//Takže souhlasíš?
	AI_Output(self,other,"DIA_Lee_NW_WhatAboutPal_01_16");	//Myslím, že ano. (důrazně) Věřím, že v dané situaci je to správné rozhodnutí!
	AI_Output(self,other,"DIA_Lee_NW_WhatAboutPal_01_19");	//Moji žoldáci ale nejsou ani početní, kvůli Sylviovi, ani dobře vyzbrojení. Výbava bude v boji se skřety nejdůležitějším faktorem.
	AI_Output(other,self,"DIA_Lee_NW_WhatAboutPal_01_20");	//A co tím myslíš?
	AI_Output(self,other,"DIA_Lee_NW_WhatAboutPal_01_21");	//Kdyby Hagen vyzbrojil mé muže rudnými čepelemi naše šance na výhru by byly mnohem vyšší.
	AI_Output(other,self,"DIA_Lee_NW_WhatAboutPal_01_25");	//Dobře, řeknu mu to.
	AI_Output(self,other,"DIA_Lee_NW_WhatAboutPal_01_26");	//Tak tedy počkám na jeho odpověď.
	SLD_JOINHAGEN = TRUE;
	MIS_OREWEAPONSLD = LOG_Running;
	Log_CreateTopic(TOPIC_OREWEAPONSLD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OREWEAPONSLD,LOG_Running);
	B_LogEntry(TOPIC_OREWEAPONSLD,"Lee chce, abych získal od lorda Hagena rudné meče pro jeho žoldáky. Mohlo by to zvýšit šance proti skřetům.");
	Log_AddEntry(TOPIC_ORCGREATWAR,"Doručil jsem Leemu Hagenovu nabídku na spojení vojska proti skřetům!");
};


instance DIA_LEE_NW_HOWMUCHORESWORD(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = dia_lee_nw_howmuchoresword_condition;
	information = dia_lee_nw_howmuchoresword_info;
	permanent = FALSE;
	description = "Kolik rudných mečů potřebuješ?";
};


func int dia_lee_nw_howmuchoresword_condition()
{
	if((MIS_OREWEAPONSLD == LOG_Running) && (KNOWNORESWORD == TRUE))
	{
		return TRUE;
	};
};

func void dia_lee_nw_howmuchoresword_info()
{
	AI_Output(other,self,"DIA_Lee_NW_HowMuchOreSword_01_01");	//Kolik rudných mečů potřebuješ?
	AI_Output(self,other,"DIA_Lee_NW_HowMuchOreSword_01_02");	//(zamyšleně) Abych vybavil všechny moje muže... tak třicet.
	AI_Output(self,other,"DIA_Lee_NW_HowMuchOreSword_01_05");	//Ale pohni si, skřeti nebudou čekat!
	B_LogEntry(TOPIC_OREWEAPONSLD,"Na vyzbrojení svých lidí bude Lee potřebovat nejméně 30 rudných mečů.");
};


instance DIA_LEE_NW_GETORESWORD(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = dia_lee_nw_getoresword_condition;
	information = dia_lee_nw_getoresword_info;
	permanent = FALSE;
	description = "Mám zbraně, které potřebuješ.";
};


func int dia_lee_nw_getoresword_condition()
{
	if((MIS_OREWEAPONSLD == LOG_Running) && (Npc_KnowsInfo(hero,DIA_Lee_NW_HowMuchOreSword) == TRUE) && (Npc_HasItems(hero,ItMw_1H_Blessed_01) >= 30))
	{
		return TRUE;
	};
};

func void dia_lee_nw_getoresword_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Lee_NW_GetOreSword_01_01");	//Mám zbraně, které potřebuješ.
	AI_Output(self,other,"DIA_Lee_NW_GetOreSword_01_02");	//Výborně. Dej mi je, rozdám je lidem.
	AI_Output(other,self,"DIA_Lee_NW_GetOreSword_01_03");	//Tady to máš.
	B_GiveInvItems(other,self,ItMw_1H_Blessed_01,30);
	Npc_RemoveInvItems(self,ItMw_1H_Blessed_01,30);
	AI_Output(self,other,"DIA_Lee_NW_GetOreSword_01_04");	//Žoldáci jsou nyní připraveni bojovat proti skřetům!
	MIS_OREWEAPONSLD = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_OREWEAPONSLD,LOG_SUCCESS);
	B_LogEntry(TOPIC_OREWEAPONSLD,"Přinesl jsem Leemu rudné zbraně. Žoldáci jsou připraveni bojovat proti skřetům!");
};


instance DIA_LEE_NW_GREATGATHER(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = dia_lee_nw_greatgather_condition;
	information = dia_lee_nw_greatgather_info;
	permanent = FALSE;
	description = "Jaká je situace kolem farmy?";
};


func int dia_lee_nw_greatgather_condition()
{
	if((MOVEFORCESCOMPLETE_01 == TRUE) && (MOVEFORCESCOMPLETE_02 == FALSE))
	{
		return TRUE;
	};
};

func void dia_lee_nw_greatgather_info()
{
	AI_Output(other,self,"DIA_Lee_NW_GreatGather_01_01");	//Jaká je situace kolem farmy?
	AI_Output(self,other,"DIA_Lee_NW_GreatGather_01_02");	//Zatím je všude klid.
	AI_Output(self,other,"DIA_Lee_NW_GreatGather_01_03");	//Myslím ale, že je to klid před bouří. Skřeti něco chystají.
	AI_Output(self,other,"DIA_Lee_NW_GreatGather_01_04");	//Každý den k nim do tábora chodí další jednotky z města.
	AI_Output(self,other,"DIA_Lee_NW_GreatGather_01_07");	//Jsem si jistý, že během několika dní zautočí na farmu.
};


instance DIA_LEE_NW_YOURLEADER(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = dia_lee_nw_yourleader_condition;
	information = dia_lee_nw_yourleader_info;
	permanent = FALSE;
	description = "Nyní tu tomu velíš?";
};


func int dia_lee_nw_yourleader_condition()
{
	if((MOVEFORCESCOMPLETE_01 == TRUE) && (MOVEFORCESCOMPLETE_02 == FALSE) && Npc_KnowsInfo(hero,dia_lord_hagen_whocommand))
	{
		return TRUE;
	};
};

func void dia_lee_nw_yourleader_info()
{
	AI_Output(other,self,"DIA_Lee_NW_YourLeader_01_01");	//Nyní tu tomu velíš?
	AI_Output(self,other,"DIA_Lee_NW_YourLeader_01_02");	//Je to přání všech lidí, kteří sem přišli bojovat proti skřetům.
	AI_Output(self,other,"DIA_Lee_NW_YourLeader_01_05");	//I když sem si myslel, že lord Hagen bude v čele naší armády.
	AI_Output(self,other,"DIA_Lee_NW_YourLeader_01_06");	//Ale chlapi mi svěřili kontrolu!
	AI_Output(self,other,"DIA_Lee_NW_YourLeader_01_09");	//Byl jsem generál královské armády v mnoha bitvách.
	AI_Output(self,other,"DIA_Lee_NW_YourLeader_01_10");	//Bojoval jsem se skřety prakticky ve všech koutech pevniny - od Nordmaru až po Varant!
	AI_Output(self,other,"DIA_Lee_NW_YourLeader_01_13");	//Budu se snažit tentokrát nezklamat svůj lid!
};

instance DIA_LEE_NW_HOWDEFEND(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = dia_lee_nw_howdefend_condition;
	information = dia_lee_nw_howdefend_info;
	permanent = FALSE;
	description = "Jaký je tvůj plán obrany?";
};

func int dia_lee_nw_howdefend_condition()
{
	if((MOVEFORCESCOMPLETE_01 == TRUE) && (MOVEFORCESCOMPLETE_02 == FALSE) && Npc_KnowsInfo(hero,dia_lord_hagen_whocommand) && Npc_KnowsInfo(hero,dia_lee_nw_yourleader))
	{
		return TRUE;
	};
};

func void dia_lee_nw_howdefend_info()
{
	AI_Output(other,self,"DIA_Lee_NW_HowDefend_01_01");	//Jaký je tvůj plán obrany?
	AI_Output(self,other,"DIA_Lee_NW_HowDefend_01_04");	//Budeme čekat, až sami skřeti na nás zaútočí.
	AI_Output(self,other,"DIA_Lee_NW_HowDefend_01_05");	//Dobře znám jejich taktiku! Zaútočí všichni najednou a pokusí se zničit naši obranu.
	AI_Output(self,other,"DIA_Lee_NW_HowDefend_01_06");	//Ale já postavím jednotky tak, aby jim to nebylo nic platné!
	AI_Output(other,self,"DIA_Lee_NW_HowDefend_01_07");	//Jak je postavíš?
	AI_Output(self,other,"DIA_Lee_NW_HowDefend_01_08");	//První řada budou paladinové lorda Hagena, protože jsou to nejzkušenější vojáci v naší armádě. Budou muset udržet první úder skřetů!
	AI_Output(self,other,"DIA_Lee_NW_HowDefend_01_10");	//Za paladiny postavím žoldáky. Jejich úkol je prostý. Jistit boky a záda paladinům a ucpat případné mezery!
	AI_Output(self,other,"DIA_Lee_NW_HowDefend_01_11");	//V opačném případě by na nás skřeti šli ze dvou stran a to by bylo špatné.
	if((TPL_JOINHAGEN == TRUE) && (HUN_JOINHAGEN == TRUE))
	{
		AI_Output(self,other,"DIA_Lee_NW_HowDefend_01_13");	//Na bocích armády budou lesní lovci a stráže.
	};
	if(PIR_JOINHAGEN == TRUE)
	{
		AI_Output(self,other,"DIA_Lee_NW_HowDefend_01_26");	//Pak bude následovat střídaná linie pod vedením lorda Varuse a kapitána Grega.
		AI_Output(self,other,"DIA_Lee_NW_HowDefend_01_27");	//Konečný výsledek nadcházejícího boje bude záležet i na nich!
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_NW_HowDefend_01_33");	//Další linie se bude skládat z jednotek lorda Varuse.
		AI_Output(self,other,"DIA_Lee_NW_HowDefend_01_34");	//Finální fáze bude záviset na nich!
	};
	AI_Output(self,other,"DIA_Lee_NW_HowDefend_01_40");	//Zbytek bude v zadní linii pečovat o zraněné a jistit žoldáky.
	AI_Output(self,other,"DIA_Lee_NW_HowDefend_01_41");	//Mezi nimi bude mnoho začátečníků, takže nepřipadá v úvahu pouštět je do střetu.
	AI_Output(other,self,"DIA_Lee_NW_HowDefend_01_42");	//A co mágové?
	AI_Output(self,other,"DIA_Lee_NW_HowDefend_01_43");	//Všichni mágové budou v zadní linii. Budou sesílat léčivá a útočná kouzla. Pochop, že boj na blízko není pro ně.
	AI_Output(self,other,"DIA_Lee_NW_HowDefend_01_44");	//Všichni se těšíme na jejich magickou podporu. Hlavně kvůli tomu, že nám dá obrovskou výhodu v boji proti skřetům.
};

instance DIA_LEE_NW_JOINBATTLE(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = DIA_LEE_NW_JOINBATTLE_condition;
	information = DIA_LEE_NW_JOINBATTLE_info;
	permanent = FALSE;
	description = "Mohu se zůčastnit této bitvy?";
};

func int DIA_LEE_NW_JOINBATTLE_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Lee_NW_HowDefend) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_LEE_NW_JOINBATTLE_info()
{
	AI_Output(other,self,"DIA_LEE_NW_JOINBATTLE_01_01");	//Mohu se zůčastnit této bitvy?
	AI_Output(self,other,"DIA_LEE_NW_JOINBATTLE_01_02");	//Není problém. I když jsem pro tebe měl jiné plány.
	AI_Output(self,other,"DIA_LEE_NW_JOINBATTLE_01_03");	//Ale samozřejmě, bitvy se zůčastnit můžeš, pokud sám chceš.
	Info_ClearChoices(DIA_LEE_NW_JOINBATTLE);
	Info_AddChoice(DIA_LEE_NW_JOINBATTLE,"Ne, radši budem mluvit o tvých plánech.",DIA_LEE_NW_JOINBATTLE_No);
	Info_AddChoice(DIA_LEE_NW_JOINBATTLE,"Ano, zůčastním se bitvy.",DIA_LEE_NW_JOINBATTLE_Yes);
};

func void DIA_LEE_NW_JOINBATTLE_Yes()
{
	AI_Output(other,self,"DIA_LEE_NW_JOINBATTLE_Yes_01_01");	//Ano, zůčastním se bitvy se skřety.
	AI_Output(self,other,"DIA_LEE_NW_JOINBATTLE_Yes_01_02");	//No dobře, je to tvoje rozhodnutí. Teď musím vymyslet, do které bojové skupiny tě zařadím.
	AI_Output(self,other,"DIA_LEE_NW_JOINBATTLE_Yes_01_03");	//No, nejprve s tebou musím probrat jeden malý problém.
	AI_Output(self,other,"DIA_LEE_NW_JOINBATTLE_Yes_01_05");	//Nemysli si, že mi hrabe, ale podle mne skřetům pomáhá nějaká neznámá síla.
	AI_Output(other,self,"DIA_LEE_NW_JOINBATTLE_Yes_01_06");	//Jsi si jistý?
	AI_Output(self,other,"DIA_LEE_NW_JOINBATTLE_Yes_01_07");	//Nevím, jak to vysvětlit, ale už jsme měli několik potyček s těma tvorama.
	AI_Output(self,other,"DIA_LEE_NW_JOINBATTLE_Yes_01_08");	//A většinu z nich bylo prakticky nemožné zabít!
	AI_Output(self,other,"DIA_LEE_NW_JOINBATTLE_Yes_01_09");	//Jako by se najednou stali nesmrtelní.
	AI_Output(self,other,"DIA_LEE_NW_JOINBATTLE_Yes_01_10");	//S ohledem na blížící se bitvu mě tento fakt velmi znepokojuje.
	AI_Output(self,other,"DIA_LEE_NW_JOINBATTLE_Yes_01_11");	//Takže potřebuju, abys tento problém vyřešil. Pokud možno co nejrychleji.
	AI_Output(other,self,"DIA_LEE_NW_JOINBATTLE_Yes_01_12");	//Dobrá. A kde mám začít?
	AI_Output(self,other,"DIA_LEE_NW_JOINBATTLE_Yes_01_13");	//Promluv si s Pyrokarem, možná ti řekne kde začít s pátráním.
	AI_Output(other,self,"DIA_LEE_NW_JOINBATTLE_Yes_01_14");	//Dobře, jdu za ním.
	MIS_ORCSECRET = LOG_Running;
	Log_CreateTopic(TOPIC_ORCSECRET,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ORCSECRET,LOG_Running);
	B_LogEntry(TOPIC_ORCSECRET,"Rozhodl jsem se zůčastnit bitvy se skřety. Ale je tu ještě jeden nemalý problém. Podle Leeho mají skřeti mocného spojence. Díky němu jsou na bojišti prakticky nezranitelní a to je velmi znepokojující. Musím se s tím problémem vypořádat - Lee mi doporučil promluvit s Pyrokarem.");
	AI_StopProcessInfos(self);
};

func void DIA_LEE_NW_JOINBATTLE_No()
{
	AI_Output(other,self,"DIA_LEE_NW_JOINBATTLE_No_01_01");	//Ne, raději si promluvíme o tvých plánech
	AI_Output(self,other,"DIA_LEE_NW_JOINBATTLE_No_01_02");	//Dobře... (zamyšleně) Teď zapomeň na nadcházející bitvu. S tím si poradíme i bez tvé pomoci.
	AI_Output(self,other,"DIA_LEE_NW_JOINBATTLE_No_01_03");	//Nyní s tebou musím probrat jeden nemalý problém.
	AI_Output(self,other,"DIA_LEE_NW_JOINBATTLE_No_01_05");	//Nemysli, že mi hrabe, ale podle mne skřetům pomáhá nějaká neznámá síla.
	AI_Output(other,self,"DIA_LEE_NW_JOINBATTLE_No_01_06");	//Jsi si jistý?
	AI_Output(self,other,"DIA_LEE_NW_JOINBATTLE_No_01_07");	//Nevím, jak to vysvětlit, ale už jsme měli několik potyček s těma tvorama.
	AI_Output(self,other,"DIA_LEE_NW_JOINBATTLE_No_01_08");	//A většinu z nich bylo prakticky nemožné zabít!
	AI_Output(self,other,"DIA_LEE_NW_JOINBATTLE_No_01_09");	//Jako by se najednou stali nesmrtelní.
	AI_Output(self,other,"DIA_LEE_NW_JOINBATTLE_No_01_10");	//S ohledem na blížící se bitvu mě tento fakt velmi znepokojuje.
	AI_Output(self,other,"DIA_LEE_NW_JOINBATTLE_No_01_11");	//Takže potřebuju, abys tento problém vyřešil. Pokud možno co nejrychleji.
	AI_Output(other,self,"DIA_LEE_NW_JOINBATTLE_No_01_12");	//Dobrá. A kde mám začít?
	AI_Output(self,other,"DIA_LEE_NW_JOINBATTLE_No_01_13");	//Promluv si s Pyrokarem, možná ti řekne kde začít s pátráním.
	AI_Output(other,self,"DIA_LEE_NW_JOINBATTLE_No_01_14");	//Dobře, jdu za ním.
	HERONOTJOINBIGBATTLE = TRUE;
	MIS_ORCSECRET = LOG_Running;
	Log_CreateTopic(TOPIC_ORCSECRET,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ORCSECRET,LOG_Running);
	B_LogEntry(TOPIC_ORCSECRET,"Odmítl jsem se zůčastnit bitvy se skřety. Ale je tu jiný problém. Podle Leeho mají skřeti mocného spojence. Díky němu jsou na bojišti prakticky nezranitelní a to je velmi znepokojující. Musím se s tím problémem vypořádat - Lee mi doporučil promluvit s Pyrokarem.");
	AI_StopProcessInfos(self);
};

instance DIA_Lee_NW_OrcSecret_Done(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = DIA_Lee_NW_OrcSecret_Done_condition;
	information = DIA_Lee_NW_OrcSecret_Done_info;
	permanent = FALSE;
	description = "Vyřešil jsem problém se skřety.";
};

func int DIA_Lee_NW_OrcSecret_Done_condition()
{
	if((MIS_ORCSECRET == LOG_Running) && (ALLGUARDMINIONSISDEAD == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Lee_NW_OrcSecret_Done_info()
{
	B_GivePlayerXP(1500);
	AI_Output(other,self,"DIA_Lee_NW_OrcSecret_Done_01_00");	//Vyřešil jsem problém se skřety.
	AI_Output(self,other,"DIA_Lee_NW_OrcSecret_Done_01_01");	//V jakém smyslu vyřešil? (překvapeně) Co jsi udělal, zabil jsi je všechny?!
	AI_Output(other,self,"DIA_Lee_NW_OrcSecret_Done_01_02");	//Ne! Akorát už nejsou nesmrtelní, jako předtím.
	AI_Output(self,other,"DIA_Lee_NW_OrcSecret_Done_01_03");	//Tak to je dobrá zpráva. (rozpačitě) Ale situace je pořád vážná.
	AI_Output(self,other,"DIA_Lee_NW_OrcSecret_Done_01_04");	//Nemáme dost lidí a skřetům přicházejí stále nové posily.
	AI_Output(self,other,"DIA_Lee_NW_OrcSecret_Done_01_05");	//Vypadá to, že brzy zaútočí.

	if(HERONOTJOINBIGBATTLE == TRUE)
	{
		AI_Output(other,self,"DIA_Lee_NW_OrcSecret_Done_01_06");	//Pak mi povíš, jak to dopadlo.
		AI_Output(self,other,"DIA_Lee_NW_OrcSecret_Done_01_07");	//Jestli to přežiju. (smích)
	}
	else
	{
		AI_Output(other,self,"DIA_Lee_NW_OrcSecret_Done_01_08");	//No, uvidíme, co se dá dělat!
		AI_Output(self,other,"DIA_Lee_NW_OrcSecret_Done_01_09");	//Samosebou.
	};

	MIS_ORCSECRET = LOG_Success;
	Log_SetTopicStatus(TOPIC_ORCSECRET,LOG_Success);
	B_LogEntry(TOPIC_ORCSECRET,"Lee byl rád, když se dozvěděl, že skřeti už nejsou nesmrtelní.");
};

instance DIA_LEE_NW_BIGFIGHTBEGIN(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = dia_lee_nw_bigfightbegin_condition;
	information = dia_lee_nw_bigfightbegin_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_lee_nw_bigfightbegin_condition()
{
	if((KAPITELORCATC == TRUE) && (HERONOTJOINBIGBATTLE == FALSE) && (MOVEFORCESCOMPLETE_01 == TRUE) && (ALLGUARDIANSKILLED == TRUE) && (MOVEFORCESCOMPLETE_02 == TRUE))
	{
		return TRUE;
	};
};

func void dia_lee_nw_bigfightbegin_info()
{
	AI_Output(self,other,"DIA_Lee_NW_BigFightBegin_01_01");	//Dobře, že jsi tu. (vážně) Skřeti se chystají do útoku.
	AI_Output(other,self,"DIA_Lee_NW_BigFightBegin_01_02");	//Je jich hodně?
	AI_Output(self,other,"DIA_Lee_NW_BigFightBegin_01_03");	//Zdá se, že celá armáda! Dost pro každého! (směje se)

	if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_GUR) || (hero.guild == GIL_KDM))
	{
		AI_Output(self,other,"DIA_Lee_NW_BigFightBegin_01_04");	//Mimochodem, jsi mág, měl by ses držet od první linie.
		AI_Output(self,other,"DIA_Lee_NW_BigFightBegin_01_05");	//Postav se nalevo ode mne!
		HEROPLACEISMAGE = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Lee_NW_BigFightBegin_01_08");	//Jsem připraven.
		AI_Output(self,other,"DIA_Lee_NW_BigFightBegin_01_09");	//Super! Pak jdi na svojí pozici. Každou chvíli sem ti zmetci přijdou!
		AI_Output(other,self,"DIA_Lee_NW_BigFightBegin_01_10");	//Kde je mé místo?
		AI_Output(self,other,"DIA_Lee_NW_BigFightBegin_01_11");	//V druhé linii vedle Gorna.
		HEROPLACEISWAR = TRUE;
		b_changename(pal_91220_ritter," ");
		b_changename(pal_91230_ritter," ");
		b_changename(pal_91210_ritter," ");
	};
	B_LogEntry(TOPIC_ORCGREATWAR,"Hodina rozhřešení se skřety přišla! Nyní se rozhodne o osudu ostrova...");
	LEESENTTOTROOPS = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_LEE_NW_BIGFIGHTRESULT(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = dia_lee_nw_bigfightresult_condition;
	information = dia_lee_nw_bigfightresult_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_lee_nw_bigfightresult_condition()
{
	if((STOPBIGBATTLE == TRUE) && (ALLGREATVICTORY == FALSE) && (HERONOTJOINBIGBATTLE == FALSE))
	{
		return TRUE;
	};
};

func void dia_lee_nw_bigfightresult_info()
{
	if(ORCSWINSBB == TRUE)
	{
		AI_Output(self,other,"DIA_Lee_NW_BigFightResult_01_01");	//Sakra! (odsouzeně) Prohráli jsme tuhle bitvu! Byla to naše poslední šance!
		AI_Output(self,other,"DIA_Lee_NW_BigFightResult_01_02");	//Brzy se skřeti stanou vládci ostrova. Pro nás tu nebude místo.
		AI_Output(self,other,"DIA_Lee_NW_BigFightResult_01_03");	//Je konec!
		LEEFUCKOFF = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		B_GivePlayerXP(5000);
		AI_Output(self,other,"DIA_Lee_NW_BigFightResult_01_04");	//Bezva! Vyhráli jsme... (oddechuje) Je rozhodnuto!
		AI_PlayAni(self,"T_STAND_2_SIT");
		AI_Output(other,self,"DIA_Lee_NW_BigFightResult_01_05");	//Co je s tebou? Jsi raněn?!
		AI_Output(self,other,"DIA_Lee_NW_BigFightResult_01_06");	//Hovno! Ti zmetci nemají na někoho jako js... (řve bolestí) Aargh! Prokleté kreatury!
		AI_Output(other,self,"DIA_Lee_NW_BigFightResult_01_07");	//Musíš rychle na farmu! Nebo vykrvácíš.
		AI_PlayAni(self,"T_SIT_2_STAND");
		AI_Output(self,other,"DIA_Lee_NW_BigFightResult_01_08");	//Jsem v pořádku, jen si musím trochu... (ztrácí vědomí)
		AI_Output(other,self,"DIA_Lee_NW_BigFightResult_01_09");	//Lee?!
		BIGBATTLEBACKPOSITION = TRUE;
		Npc_ExchangeRoutine(self,"DRAINED");
		AI_StopProcessInfos(self);
	};
};


instance DIA_LEE_NW_FUCKOFF(C_Info)
{
	npc = SLD_800_Lee;
	nr = 10;
	condition = dia_lee_nw_fuckoff_condition;
	information = dia_lee_nw_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_lee_nw_fuckoff_condition()
{
	if((LEEFUCKOFF == TRUE) && (HERONOTJOINBIGBATTLE == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_lee_nw_fuckoff_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
};

instance DIA_LEE_NW_LEERECOVERED(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = dia_lee_nw_leerecovered_condition;
	information = dia_lee_nw_leerecovered_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_lee_nw_leerecovered_condition()
{
	if((LEERECOVERED == TRUE) && (HERONOTJOINBIGBATTLE == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_lee_nw_leerecovered_info()
{
	AI_Output(other,self,"DIA_Lee_NW_LeeRecovered_01_01");	//Vidím, že si zdravý?
	AI_Output(self,other,"DIA_Lee_NW_LeeRecovered_01_02");	//Ano příteli... Jsem teď v pořádku!
};

instance DIA_LEE_NW_ALLGREATVICTORY(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = dia_lee_nw_allgreatvictory_condition;
	information = dia_lee_nw_allgreatvictory_info;
	permanent = FALSE;
	description = "Skřeti ustupují zpět do Hornického údolí.";
};

func int dia_lee_nw_allgreatvictory_condition()
{
	if(ALLGREATVICTORY == TRUE)
	{
		return TRUE;
	};
};

func void dia_lee_nw_allgreatvictory_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Lee_NW_AllGreatVictory_01_00");	//Skřeti ustupují zpět do Hornického údolí!
	AI_Output(other,self,"DIA_Lee_NW_AllGreatVictory_01_01");	//Tato část ostrova je kompletně volná.
	AI_Output(self,other,"DIA_Lee_NW_AllGreatVictory_01_02");	//To myslíš to vážně? To snad nemůže bát pravda!
	AI_Output(other,self,"DIA_Lee_NW_AllGreatVictory_01_03");	//Jestli nevěříš, zajdi se podívat do jejich tábora, je kousek od farmy.
	AI_Output(self,other,"DIA_Lee_NW_AllGreatVictory_01_08");	//Konečně je po všem. Jen tomu ještě nemůžu uvěřit!
};


instance DIA_LEE_NW_WHATDONOW(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = dia_lee_nw_whatdonow_condition;
	information = dia_lee_nw_whatdonow_info;
	permanent = FALSE;
	description = "Co teď?";
};

func int dia_lee_nw_whatdonow_condition()
{
	if(Npc_KnowsInfo(hero,dia_lee_nw_leerecovered) && ((ALLGREATVICTORY == TRUE) || (HORINISISFREE == TRUE)))
	{
		return TRUE;
	};
};

func void dia_lee_nw_whatdonow_info()
{
	AI_Output(other,self,"DIA_Lee_NW_WhatDoNow_01_00");	//Co teď?
	AI_Output(self,other,"DIA_Lee_NW_WhatDoNow_01_01");	//(zamyšleně) V současné době mám hodně plánů.
	AI_Output(self,other,"DIA_Lee_NW_WhatDoNow_01_02");	//Nicméně se musím dostat na kontinent.
	AI_Output(self,other,"DIA_Lee_NW_WhatDoNow_01_03");	//Však víš, mám tam nedokončenou práci.
	AI_Output(self,other,"DIA_Lee_NW_WhatDoNow_01_04");	//Pokud tam popluješ, vzpomeň si na Leeho!
};


instance DIA_LEE_NW_TRAVELONBIGLAND(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = dia_lee_nw_travelonbigland_condition;
	information = dia_lee_nw_travelonbigland_info;
	permanent = FALSE;
	description = "Nezapomněl jsem na tvé poslání.";
};


func int dia_lee_nw_travelonbigland_condition()
{
	if((WHOTRAVELONBIGLAND == TRUE) && Npc_KnowsInfo(hero,dia_lee_nw_whatdonow))
	{
		return TRUE;
	};
};

func void dia_lee_nw_travelonbigland_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Lee_NW_TravelOnBigLand_01_00");	//Nezapomněl jsem na tvé poslání.
	AI_Output(self,other,"DIA_Lee_NW_TravelOnBigLand_01_01");	//(vážně) Chceš říci, že jdeš na kontinent?
	AI_Output(other,self,"DIA_Lee_NW_TravelOnBigLand_01_02");	//Jasně. Pohni, brzy odplouváme.
	AI_Output(self,other,"DIA_Lee_NW_TravelOnBigLand_01_03");	//Dobrá. Pak neztrácejme čas.
	COUNTTRAVELONBIGLAND = COUNTTRAVELONBIGLAND + 1;
	LEETOBIGLAND = TRUE;
	B_LogEntry(TOPIC_SALETOBIGLAND,"Přirozeně Lee pluje se mnou! Kvůli jeho pomstě králi a jeho poskokům.");
	Npc_ExchangeRoutine(self,"SHIP");
	AI_StopProcessInfos(self);
};

instance DIA_LEE_NW_DarkOrder(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = dia_lee_nw_DarkOrder_condition;
	information = dia_lee_nw_DarkOrder_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_lee_nw_DarkOrder_condition()
{
	if((Kapitel == 5) && (MIS_DarkOrden != LOG_Success))
	{
		return TRUE;
	};
};

func void dia_lee_nw_DarkOrder_info()
{
	B_GivePlayerXP(200);
	AI_Output(self,other,"DIA_Lee_NW_DarkOrder_01_00");	//Aby tě Beliar...! Kde pořád jsi?
	AI_Output(other,self,"DIA_Lee_NW_DarkOrder_01_01");	//Co tě žere?
	AI_Output(self,other,"DIA_Lee_NW_DarkOrder_01_02");	//Proklatě! Nevšimnul sis, že Onarovu farmu napadli nemrtví.
	AI_Output(other,self,"DIA_Lee_NW_DarkOrder_01_03");	//Ano všimnul. Víš o tom něco bližšího?
	AI_Output(self,other,"DIA_Lee_NW_DarkOrder_01_04");	//Jak asi? Ani nevím odkud se tu vzali.
	AI_Output(other,self,"DIA_Lee_NW_DarkOrder_01_05");	//A ti nemrtví napadli pouze Onarovu farmu?
	AI_Output(self,other,"DIA_Lee_NW_DarkOrder_01_06");	//Pokud vím, jsou všude po Khorinisu!

	if(MIS_DarkOrden == LOG_Running)
	{
		AI_Output(self,other,"DIA_Lee_NW_DarkOrder_01_07");	//Musíme něco udělat! Už jsem ztratil pár lidí.
		AI_Output(self,other,"DIA_Lee_NW_DarkOrder_01_08");	//Jestli to tak bude pokračovat, nevím, jestli to ustojíme.
	}
	else if(MIS_DarkOrden == FALSE)
	{
		AI_Output(other,self,"DIA_Lee_NW_DarkOrder_01_09");	//A co se děje ve městě?
		AI_Output(self,other,"DIA_Lee_NW_DarkOrder_01_10");	//Nevím. Ale měl by sis co nejdříve promluvit s lordem Hagenem.
		AI_Output(self,other,"DIA_Lee_NW_DarkOrder_01_11");	//Možná mají paladinové nějaký plán, jak zastavit tu invazi.
	};
};

instance DIA_Lee_NW_LeeLetter(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = DIA_Lee_NW_LeeLetter_condition;
	information = DIA_Lee_NW_LeeLetter_info;
	permanent = FALSE;
	description = "Mám pro tebe dopis od Vatrase.";
};

func int DIA_Lee_NW_LeeLetter_condition()
{
	if((MIS_LeeLetter == LOG_Running) && (Npc_HasItems(hero,ItWr_VatrasLee) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Lee_NW_LeeLetter_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Lee_NW_LeeLetter_01_00");	//Mám pro tebe dopis od Vatrase.
	B_GiveInvItems(other,self,ItWr_VatrasLee,1);
	Npc_RemoveInvItems(self,ItWr_VatrasLee,1);
	AI_Output(self,other,"DIA_Lee_NW_LeeLetter_01_01");	//Dobře. Podívám se, co píše.
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Lee_NW_LeeLetter_01_02");	//(vážně) Jeho prosba je velmi nečekaná.
	AI_Output(self,other,"DIA_Lee_NW_LeeLetter_01_03");	//No co se dá dělat. Popřemýšlím o tom.
	MIS_LeeLetter = LOG_Success;
	Log_SetTopicStatus(TOPIC_LeeLetter,LOG_Success);
	B_LogEntry(TOPIC_LeeLetter,"Předal jsem dopis Leemu.");	
};

instance DIA_Lee_NW_VatrasBusines(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = DIA_Lee_NW_VatrasBusines_condition;
	information = DIA_Lee_NW_VatrasBusines_info;
	permanent = FALSE;
	description = "Co máš za kšefty s Vatrasem?";
};

func int DIA_Lee_NW_VatrasBusines_condition()
{
	if(MIS_LeeLetter == LOG_Success)
	{
		return TRUE;
	};
};

func void DIA_Lee_NW_VatrasBusines_info()
{
	AI_Output(other,self,"DIA_Lee_NW_VatrasBusines_01_00");	//Co máš za kšefty s Vatrasem?
	AI_Output(self,other,"DIA_Lee_NW_VatrasBusines_01_01");	//Nic zvláštního. Jen jsem ho požádal aby zjistil od paladinů, jaká je situace v Myrtaně.
	AI_Output(self,other,"DIA_Lee_NW_VatrasBusines_01_02");	//Ale jeho zprávou jsem nebyl příliš potěšen. Zdá se, že král je na pokraji porážky ve válce se skřety.
	AI_Output(self,other,"DIA_Lee_NW_VatrasBusines_01_03");	//Nicméně mě uklidňuje, že v Nordmaru se jim zvítězit nepodařilo.
	AI_Output(other,self,"DIA_Lee_NW_VatrasBusines_01_04");	//Proč?
	AI_Output(self,other,"DIA_Lee_NW_VatrasBusines_01_05");	//Vyrostl jsem tam... Je to můj domov!
	AI_Output(other,self,"DIA_Lee_NW_VatrasBusines_01_06");	//Takže jsi z Nordmaru? Povíš mi o něm něco?
	AI_Output(self,other,"DIA_Lee_NW_VatrasBusines_01_07");	//Ach, kamaráde. To se nedá popsat slovy.
	AI_Output(self,other,"DIA_Lee_NW_VatrasBusines_01_08");	//Kdybys jen viděl ty majestátní hory, pokryté sněhem a ledem.
	AI_Output(self,other,"DIA_Lee_NW_VatrasBusines_01_09");	//Určitě bys tam chtěl zůstat nastálo. Krajina tam je opravdu fascinující!
	AI_Output(self,other,"DIA_Lee_NW_VatrasBusines_01_10");	//Ale jestli mám mluvit narovinu, život tam je opravdu tvrdý.
	AI_Output(self,other,"DIA_Lee_NW_VatrasBusines_01_11");	//Je tam spousta nebezpečné zvěře a chlad, který ti zaleze až do morku kostí.
	AI_Output(self,other,"DIA_Lee_NW_VatrasBusines_01_12");	//Ale my jsme na to zvyklí. Každý, kdo se narodí v Nordmaru, má přirozenou imunitu vůči chladu.
};

instance DIA_Lee_NW_TeachMeCold(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = DIA_Lee_NW_TeachMeCold_condition;
	information = DIA_Lee_NW_TeachMeCold_info;
	permanent = FALSE;
	description = "Můžeš to naučit i mě?";
};

func int DIA_Lee_NW_TeachMeCold_condition()
{
	if(Npc_KnowsInfo(other,DIA_Lee_NW_VatrasBusines) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Lee_NW_TeachMeCold_info()
{
	AI_Output(other,self,"DIA_Lee_NW_TeachMeCold_01_00");	//Můžeš to naučit i mě?
	AI_Output(self,other,"DIA_Lee_NW_TeachMeCold_01_01");	//To se nedá naučit, s tím se musíš narodit.
	AI_Output(self,other,"DIA_Lee_NW_TeachMeCold_01_02");	//Ale když na to přijde, můžu tě naučit jak se chránit před omrzlinama a nebo jak si zachovat správnou tělesnou teplotu. 
	AI_Output(self,other,"DIA_Lee_NW_TeachMeCold_01_03");	//Ale je třeba mít jisté zkušenosti, abys zvládnul tyto techniky.
	AI_Output(self,other,"DIA_Lee_NW_TeachMeCold_01_04");	//Peníze si od tebe nevezmu. To by nebylo správné.
	AI_Output(other,self,"DIA_Lee_NW_TeachMeCold_01_05");	//Dobře, domluveno.
};

instance DIA_Lee_NW_ColdReduceTeach(C_Info)
{
	npc = SLD_800_Lee;
	nr = 800;
	condition = DIA_Lee_NW_ColdReduceTeach_Condition;
	information = DIA_Lee_NW_ColdReduceTeach_Info;
	permanent = TRUE;
	description = "Nauč mě snášet chlad (VB: 10)";
};

func int DIA_Lee_NW_ColdReduceTeach_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Lee_NW_TeachMeCold) == TRUE) && (ColdReduceKnow == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lee_NW_ColdReduceTeach_Info()
{
	var int kosten;

	AI_Output(other,self,"DIA_Lee_NW_ColdReduceTeach_01_00");	//Nauč mě snášet chlad.

	kosten = 10;

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		AI_Output(self,other,"DIA_Lee_NW_ColdReduceTeach_01_01");	//Je mi líto, ale nemáš dostatek zkušeností!
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_NW_ColdReduceTeach_01_02");	//Víc se pohybuj. To tě zahřeje.
		AI_Output(self,other,"DIA_Lee_NW_ColdReduceTeach_01_03");	//Pohyb musí vycházet z celého těla.
		AI_Output(self,other,"DIA_Lee_NW_ColdReduceTeach_01_04");	//A je potřeba mít nohy vždy v teple!
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + kosten;
		hero.protection[PROT_MAGIC] += 5;
		REALPROTMAGIC += 5;
		AI_Print(PRINT_LEARNPROTCOLD);
		ColdReduceKnow = TRUE;
		Snd_Play("LevelUP");
	};
};

instance DIA_Lee_NW_VatrasDeal(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = DIA_Lee_NW_VatrasDeal_condition;
	information = DIA_Lee_NW_VatrasDeal_info;
	permanent = FALSE;
	description = "A co od tebe chtěl Vatras?";
};

func int DIA_Lee_NW_VatrasDeal_condition()
{
	if(Npc_KnowsInfo(other,DIA_Lee_NW_VatrasBusines) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Lee_NW_VatrasDeal_info()
{
	AI_Output(other,self,"DIA_Lee_NW_VatrasDeal_01_00");	//A co od tebe chtěl Vatras?
	AI_Output(self,other,"DIA_Lee_NW_VatrasDeal_01_01");	//(vážně) Psal o tom, že by bylo potřeba poslat malý oddíl do Hornického údolí. 
	AI_Output(self,other,"DIA_Lee_NW_VatrasDeal_01_02");	//Podle něho je to prosba samotného Saturase.
	AI_Output(other,self,"DIA_Lee_NW_VatrasDeal_01_03");	//Ale proč? Vždyť tam jsou skřeti!
	AI_Output(self,other,"DIA_Lee_NW_VatrasDeal_01_04");	//Mágové Vody zanechali v Novém táboře nějaké dokumenty, které potřebují nutně získat zpět. 
	AI_Output(self,other,"DIA_Lee_NW_VatrasDeal_01_05");	//Saturas žádal, aby to bylo co nejdříve, protože ty věci jsou velmi cenné. 
	AI_Output(self,other,"DIA_Lee_NW_VatrasDeal_01_06");	//Kromě toho ho nemůžu odmítnout, dlužím mu za mnohé, ještě z dob kdy jsem byli za bariérou.
	AI_Output(self,other,"DIA_Lee_NW_VatrasDeal_01_07");	//Ale je tu malý problém - průchod do Hornického údolí střeží paladinové.
	AI_Output(self,other,"DIA_Lee_NW_VatrasDeal_01_08");	//A je nepravděpodobné, že muži lorda Hagena nás pustí, vzhledem k složité situaci v Khorinisu. 
	AI_Output(self,other,"DIA_Lee_NW_VatrasDeal_01_09");	//Kromě toho, velká skupina lidí by určitě upoutala pozornost skřetů.
	AI_Output(self,other,"DIA_Lee_NW_VatrasDeal_01_10");	//A také musíme sehnat dobrovolníky, co do toho půjdou!
};

instance DIA_Lee_NW_WaterMageDocuments(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = DIA_Lee_NW_WaterMageDocuments_condition;
	information = DIA_Lee_NW_WaterMageDocuments_info;
	permanent = FALSE;
	description = "Můžu se tam vydat sám.";
};

func int DIA_Lee_NW_WaterMageDocuments_condition()
{
	if(Npc_KnowsInfo(other,DIA_Lee_NW_VatrasDeal) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Lee_NW_WaterMageDocuments_info()
{
	AI_Output(other,self,"DIA_Lee_NW_WaterMageDocuments_01_00");	//Můžu se tam vydat sám.
	AI_Output(self,other,"DIA_Lee_NW_WaterMageDocuments_01_01");	//Sám? (překvapeně) Zbláznil ses?
	AI_Output(other,self,"DIA_Lee_NW_WaterMageDocuments_01_03");	//Přesně tak! Jednoduše, i lord Hagen chce znát situaci v Hornickém údolí.
	AI_Output(other,self,"DIA_Lee_NW_WaterMageDocuments_01_04");	//Ať chci nebo ne, stejně se tam musím vydat.
	AI_Output(other,self,"DIA_Lee_NW_WaterMageDocuments_01_05");	//Kromě toho, jeden člověk bude méně nápadný než celá jednotka.
	AI_Output(self,other,"DIA_Lee_NW_WaterMageDocuments_01_06");	//Hmm. To dává smysl.
	AI_Output(self,other,"DIA_Lee_NW_WaterMageDocuments_01_07");	//Dobře, pak ti teda předám klíč spolu s jeho dopisem.
	AI_Output(self,other,"DIA_Lee_NW_WaterMageDocuments_01_08");	//Ten klíč je od truhly, kde by měly být ony dokumenty.
	B_GiveInvItems(self,other,ItKe_WaterMageDocuments,1);
	AI_Output(self,other,"DIA_Lee_NW_WaterMageDocuments_01_09");	//Tak se příležitostně můžeš zastavit v Novém táboře. 
	AI_Output(self,other,"DIA_Lee_NW_WaterMageDocuments_01_10");	//Ale buď opatrný, říká se, že si tam udělal doupě jeden z draků.
	AI_Output(other,self,"DIA_Lee_NW_WaterMageDocuments_01_11");	//Chápu.
	AI_Output(self,other,"DIA_Lee_NW_WaterMageDocuments_01_12");	//Doufejme, že ne.
	MIS_WaterMageDocuments = LOG_Running;
	Log_CreateTopic(TOPIC_WaterMageDocuments,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_WaterMageDocuments,LOG_Running);
	B_LogEntry(TOPIC_WaterMageDocuments,"Saturas požádal Leeho, aby poslal do Hornického údolí malou skupinu žoldáků, kteří by donesli cenné dokumenty. Nabídl jsem se, že to zařídím, protože tam mám taky cestu. Lee mi dal klíč od truhly, kde jsou ty cennosti schované.");
};

instance DIA_Lee_NW_NewLager(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = DIA_Lee_NW_NewLager_condition;
	information = DIA_Lee_NW_NewLager_info;
	permanent = FALSE;
	description = "Nový tábor...";
};

func int DIA_Lee_NW_NewLager_condition()
{
	if(Npc_KnowsInfo(other,DIA_Lee_NW_WaterMageDocuments) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Lee_NW_NewLager_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_Lee_NW_NewLager_01_00");	//(zamyšleně) Nový tábor...
	AI_Output(other,self,"DIA_Lee_NW_NewLager_01_01");	//Vždycky mě zajímalo, jak to tenkrát bylo?
	AI_Output(self,other,"DIA_Lee_NW_NewLager_01_02");	//Tábor založili mágové Vody, kteří se oddělili od ostatních mágů na hradě, s cílem zrealizovat svůj vlastní plán.
	AI_Output(self,other,"DIA_Lee_NW_NewLager_01_03");	//Na severní straně údolí našli velkou jeskyni, která jim posloužila jako bezpečné útočiště.
	AI_Output(self,other,"DIA_Lee_NW_NewLager_01_04");	//Vlastně, tak vše začalo.
	AI_Output(self,other,"DIA_Lee_NW_NewLager_01_05");	//Krátce na to, když mě uvrhli do kolonie, jsem se potkal s jedním z těchto mágů. Jeho jméno bylo Saturas.
	AI_Output(self,other,"DIA_Lee_NW_NewLager_01_06");	//Když zjistil, že jsem býval generálem krále Rhobara, nabídl mi, abych se staral o bezpečnost jejich mise.
	AI_Output(self,other,"DIA_Lee_NW_NewLager_01_07");	//Celé údolí se hemžilo skřety a jinou nebezpečnou havětí, takže moje zkušenosti jim přišly vhod.
	AI_Output(self,other,"DIA_Lee_NW_NewLager_01_08");	//No a potom se k nám přidávali další, co už měli plné zuby Gomeze a jeho přisluhovačů.
	AI_Output(self,other,"DIA_Lee_NW_NewLager_01_09");	//A tak jsem začal přijímat nové lidi, z těch co k nám přicházeli.
	AI_Output(self,other,"DIA_Lee_NW_NewLager_01_10");	//Jádro tvořili lidi, co dřív sloužili v armádě pod mým velením. 
	AI_Output(self,other,"DIA_Lee_NW_NewLager_01_11");	//A právě oni vytvořili základ naší malé žoldácké armády.
	AI_Output(self,other,"DIA_Lee_NW_NewLager_01_12");	//Takže, časem jsme vytvořily takovou sílu, se kterou ostaní museli počítat, včetně Gomeze.
	AI_Output(self,other,"DIA_Lee_NW_NewLager_01_13");	//Po čase jsme objevili opuštěný důl, v roklině za táborem.
	AI_Output(self,other,"DIA_Lee_NW_NewLager_01_14");	//Mágové Vody usoudili, že by se dal dobře využít. 
	AI_Output(self,other,"DIA_Lee_NW_NewLager_01_15");	//To samozřejmě rozčílilo rudobarony, zejména Gomeze.
	AI_Output(self,other,"DIA_Lee_NW_NewLager_01_16");	//Do té doby se magická ruda těžila výhradně v jeho dolu.
	AI_Output(self,other,"DIA_Lee_NW_NewLager_01_17");	//Kromě toho naši lidé pravidelně přepadávali karavany se zbožím z vnějšího světa, směřující do Starého tábora.
	AI_Output(self,other,"DIA_Lee_NW_NewLager_01_18");	//Což byla hlavně Laresova práce.
	AI_Output(self,other,"DIA_Lee_NW_NewLager_01_19");	//Tenhle chytrák kolem sebe shromáždil celou skupinu je mu podobných zlodějů.
	AI_Output(self,other,"DIA_Lee_NW_NewLager_01_20");	//A situace se vyvinula tak, že to vyhovovalo všem.
	AI_Output(self,other,"DIA_Lee_NW_NewLager_01_21");	//Zloději přepadávali karavany a dělily se o zboží s námi. A my jsme je na oplátku chránili před strážema od Gomeze.
	AI_Output(self,other,"DIA_Lee_NW_NewLager_01_22");	//Samozřejmě, že to všechno jenom zhoršovalo vztahy mezi Novým a Starým táborem.
	AI_Output(self,other,"DIA_Lee_NW_NewLager_01_23");	//Stali jsme se zapřísáhlými nepřáteli, co si jdou tvrdě po krku.
	AI_Output(self,other,"DIA_Lee_NW_NewLager_01_24");	//A kdo ví jak by to dopadlo, kdyby ses tenkrát neobjevil ty.
};

instance DIA_Lee_NW_WaterMageDocumentsDone(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = DIA_Lee_NW_WaterMageDocumentsDone_condition;
	information = DIA_Lee_NW_WaterMageDocumentsDone_info;
	permanent = FALSE;
	description = "Mám dokumenty mágů Vody.";
};

func int DIA_Lee_NW_WaterMageDocumentsDone_condition()
{
	if((MIS_WaterMageDocuments == LOG_Running) && (Npc_HasItems(hero,ItWr_WaterMageDoc) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Lee_NW_WaterMageDocumentsDone_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Lee_NW_WaterMageDocumentsDone_01_00");	//Mám dokumenty mágů Vody.
	AI_Output(self,other,"DIA_Lee_NW_WaterMageDocumentsDone_01_01");	//Dobře! Ale bude lepší, když je doneseš přímo Saturasovi.
	AI_Output(self,other,"DIA_Lee_NW_WaterMageDocumentsDone_01_02");	//Mně nejsou k ničemu.
	AI_Output(other,self,"DIA_Lee_NW_WaterMageDocumentsDone_01_03");	//Tak dobře.
	B_LogEntry(TOPIC_WaterMageDocuments,"Lee mě požádal, abych donesl dokumenty přímo Saturasovi.");
};

instance DIA_Lee_NW_Seekers(C_Info)
{
	npc = SLD_800_Lee;
	nr = 1;
	condition = DIA_Lee_NW_Seekers_condition;
	information = DIA_Lee_NW_Seekers_info;
	permanent = FALSE;
	description = "Znáš Sagittu?";
};

func int DIA_Lee_NW_Seekers_condition()
{
	if((MIS_SagittaGuard == LOG_Running) && (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Lee_NW_Seekers_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_Lee_NW_Seekers_01_00");	//Znáš Sagittu?
	AI_Output(self,other,"DIA_Lee_NW_Seekers_01_01");	//Samozřejmě. Je to místní léčitelka, každý ji tu zná.
	AI_Output(self,other,"DIA_Lee_NW_Seekers_01_02");	//A proč se ptáš?
	AI_Output(other,self,"DIA_Lee_NW_Seekers_01_03");	//Nedaleko od její jeskyně se objevili Pátrači. A ona je tam sama bez ochrany.
	AI_Output(other,self,"DIA_Lee_NW_Seekers_01_04");	//Kdo ví, co se může stát. Innos jí ochraňuj.
	AI_Output(self,other,"DIA_Lee_NW_Seekers_01_05");	//Tak ať přijde sem na farmu, zde bude v bezpečí.
	AI_Output(other,self,"DIA_Lee_NW_Seekers_01_06");	//Ale ona nechce odejít ze své jeskyně. I když jsem se jí snažil přesvědčit.
	AI_Output(self,other,"DIA_Lee_NW_Seekers_01_07");	//A co navrhuješ?
	AI_Output(other,self,"DIA_Lee_NW_Seekers_01_08");	//Nemohl bys poslat některé ze svých lidí, aby na ní dohlédli?
	AI_Output(self,other,"DIA_Lee_NW_Seekers_01_09");	//Hmm. (zamyšleně) Popravdě, všichni mí lidé už mají svou práci. No když tak naléháš...
	AI_Output(other,self,"DIA_Lee_NW_Seekers_01_10");	//Pěkně prosím?
	AI_Output(self,other,"DIA_Lee_NW_Seekers_01_11");	//(vzdychne) Tak dobře, pár lidí tam pošlu.
	AI_Output(self,other,"DIA_Lee_NW_Seekers_01_12");	//Koneckonců, mnohým zde pomohla. Tak se musíme také odvděčit.
	B_LogEntry(TOPIC_SagittaGuard,"Lee pošle pár svých mužů, aby hlídali jeskyni Sagitty.");
	LeeSendGuard = TRUE;
	AI_StopProcessInfos(self);
	Wld_InsertNpc(SLD_847_SOELDNER,"NW_SAGITTA_CAVE_08");
	Wld_InsertNpc(SLD_848_SOELDNER,"NW_SAGITTA_CAVE_05_99");
};

//-----------------------------------------lineyka nayemnikov---------------------

instance DIA_SLD_853_Bret_EXIT(C_Info)
{
	npc = SLD_853_Bret;
	nr = 999;
	condition = DIA_SLD_853_Bret_EXIT_Condition;
	information = DIA_SLD_853_Bret_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_SLD_853_Bret_EXIT_Condition()
{
	return TRUE;
};

func void DIA_SLD_853_Bret_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_SLD_853_Bret_Hallo(C_Info)
{
	npc = SLD_853_Bret;
	nr = 1;
	condition = DIA_SLD_853_Bret_Hallo_Condition;
	information = DIA_SLD_853_Bret_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_SLD_853_Bret_Hallo_Condition()
{
	if(BretInsert == TRUE)
	{
		return TRUE;
	};
};

func void DIA_SLD_853_Bret_Hallo_Info()
{
	AI_ReadyMeleeWeapon(self);
	AI_Output(self,other,"DIA_SLD_853_Bret_Hallo_01_00");		//Hej, ruce pryč od mého masa!
	AI_Output(other,self,"DIA_SLD_853_Bret_Hallo_01_01");		//Hmm... Myslel jsem, že tady nikdo není. Odkud ses tu vzal?
	B_GiveInvItems(other,self,ItMi_BretMeet,1);
	Npc_RemoveInvItems(self,ItMi_BretMeet,1);
	AI_Output(self,other,"DIA_SLD_853_Bret_Hallo_01_02");		//Na to samé se chci zeptat já tebe - odkud ses tu vzal?!
	AI_Output(other,self,"DIA_SLD_853_Bret_Hallo_01_03");		//Prošel jsem přes průchod ve svobodném dole. 
	AI_Output(other,self,"DIA_SLD_853_Bret_Hallo_01_04");		//Vede přímo do tohohle údolí!
	AI_Output(self,other,"DIA_SLD_853_Bret_Hallo_01_05");		//Hmmm... (s úsměvem) Jsi zřejmě tvrdý chlapík, že jsi šel tak dlouhou a nebezpečnou cestu sám.
	AI_RemoveWeapon(self);
	AI_Output(self,other,"DIA_SLD_853_Bret_Hallo_01_06");		//No, ale snažil ses marně, tady nic není! Teda kromě kurevský zimy a hromady hladových monster.
	AI_Output(self,other,"DIA_SLD_853_Bret_Hallo_01_07");		//A teď vrať, co jsi vzal. Myslím ten kus masa.
	AI_Output(other,self,"DIA_SLD_853_Bret_Hallo_01_08");		//Tady je.
	AI_Output(self,other,"DIA_SLD_853_Bret_Hallo_01_09");		//Dobře! Vidím že i s hlavou je vše vpořádku.
	AI_Output(self,other,"DIA_SLD_853_Bret_Hallo_01_10");		//A proto ti radím, co nejrychleji odsud zmiz.
	AI_Output(self,other,"DIA_SLD_853_Bret_Hallo_01_11");		//Tady na tebe čeká akorát tak smrt.
	AI_StopProcessInfos(self);	
	Npc_ExchangeRoutine(self,"Start");
};

instance DIA_SLD_853_Bret_Who(C_Info)
{
	npc = SLD_853_Bret;
	nr = 1;
	condition = DIA_SLD_853_Bret_Who_Condition;
	information = DIA_SLD_853_Bret_Who_Info;
	permanent = FALSE;
	description = "Kdo jsi?";
};

func int DIA_SLD_853_Bret_Who_Condition()
{
	if(Npc_KnowsInfo(other,DIA_SLD_853_Bret_Hallo) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_SLD_853_Bret_Who_Info()
{
	AI_Output(other,self,"DIA_SLD_853_Bret_Who_01_00");		//Kdo jsi?
	AI_Output(self,other,"DIA_SLD_853_Bret_Who_01_01");		//Jmenuji se Adelhard! A víc znát nemusíš.
};

instance DIA_SLD_853_Bret_You(C_Info)
{
	npc = SLD_853_Bret;
	nr = 1;
	condition = DIA_SLD_853_Bret_You_Condition;
	information = DIA_SLD_853_Bret_You_Info;
	permanent = FALSE;
	description = "Jsi žoldák?";
};

func int DIA_SLD_853_Bret_You_Condition()
{
	if(Npc_KnowsInfo(other,DIA_SLD_853_Bret_Who) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_SLD_853_Bret_You_Info()
{
	AI_Output(other,self,"DIA_SLD_853_Bret_You_01_00");		//Jsi žoldák?
	AI_Output(self,other,"DIA_SLD_853_Bret_You_01_01");		//Hmmm... (nevlídně) Kdysi jsem byl!
	AI_Output(self,other,"DIA_SLD_853_Bret_You_01_02");		//Do té doby, než mě osud zavedl na toto místo Innosem zapomenuté.
	AI_Output(self,other,"DIA_SLD_853_Bret_You_01_03");		//A co tě to vlastně zajímá?
};

instance DIA_SLD_853_Bret_Alone(C_Info)
{
	npc = SLD_853_Bret;
	nr = 1;
	condition = DIA_SLD_853_Bret_Alone_Condition;
	information = DIA_SLD_853_Bret_Alone_Info;
	permanent = FALSE;
	description = "Jsi tu sám?";
};

func int DIA_SLD_853_Bret_Alone_Condition()
{
	if(Npc_KnowsInfo(other,DIA_SLD_853_Bret_Who) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_SLD_853_Bret_Alone_Info()
{
	AI_Output(other,self,"DIA_SLD_853_Bret_Alone_01_00");		//Jsi tu sám?
	AI_Output(self,other,"DIA_SLD_853_Bret_Alone_01_01");		//A ty tady ještě někoho vidíš?
	AI_Output(self,other,"DIA_SLD_853_Bret_Alone_01_02");		//Ano, jsem tady sám! A chtěl bych, aby to tak zůstalo.
	AI_Output(self,other,"DIA_SLD_853_Bret_Alone_01_03");		//Nadbytečný hluk sem jenom přiláká skřety! A pak už žádné modlitby nepomůžou... 
	AI_Output(other,self,"DIA_SLD_853_Bret_Alone_01_04");		//Myslím, že se skřety si poradím.
	AI_Output(self,other,"DIA_SLD_853_Bret_Alone_01_05");		//Ach ano... málem bych zapomněl, že jsi drsňák!
	AI_Output(self,other,"DIA_SLD_853_Bret_Alone_01_06");		//Já to riskovat nehodlám. 
	AI_Output(self,other,"DIA_SLD_853_Bret_Alone_01_07");		//Takže se odsud pakuj a víc se nevracej!
	AI_StopProcessInfos(self);	
};

instance DIA_SLD_853_Bret_NeedInfo(C_Info)
{
	npc = SLD_853_Bret;
	nr = 1;
	condition = DIA_SLD_853_Bret_NeedInfo_Condition;
	information = DIA_SLD_853_Bret_NeedInfo_Info;
	permanent = FALSE;
	description = "Nikam nepůjdu!";
};

func int DIA_SLD_853_Bret_NeedInfo_Condition()
{
	if((Npc_KnowsInfo(other,DIA_SLD_853_Bret_Alone) == TRUE) && (MIS_MissOldFriend == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_SLD_853_Bret_NeedInfo_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_SLD_853_Bret_NeedInfo_01_00");		//Nikam nepůjdu!
	AI_Output(self,other,"DIA_SLD_853_Bret_NeedInfo_01_01");		//(výhružně) Opravdu?!
	AI_Output(other,self,"DIA_SLD_853_Bret_NeedInfo_01_02");		//Ano! Dokud si něco neověřím.
	AI_Output(self,other,"DIA_SLD_853_Bret_NeedInfo_01_03");		//A co jako?
	AI_Output(other,self,"DIA_SLD_853_Bret_NeedInfo_01_04");		//Sháním družstvo žoldáků! Velel jim muž jménem Darius.
	AI_Output(self,other,"DIA_SLD_853_Bret_NeedInfo_01_05");		//Hmm... (chmurně) No, pak jsi ho už našel!
	AI_Output(self,other,"DIA_SLD_853_Bret_NeedInfo_01_06");		//Nicméně jak vidíš, jsem jediný, kdo zůstal.
	AI_Output(self,other,"DIA_SLD_853_Bret_NeedInfo_01_07");		//Zbytek je mrtev, nebo v zajetí skřetů. Nebo ještě hůř...
	AI_Output(other,self,"DIA_SLD_853_Bret_NeedInfo_01_08");		//A co samotný Darius?
	AI_Output(self,other,"DIA_SLD_853_Bret_NeedInfo_01_09");		//Nemám ponětí co se s ním stalo.
	AI_Output(other,self,"DIA_SLD_853_Bret_NeedInfo_01_10");		//Jakto?
	AI_Output(self,other,"DIA_SLD_853_Bret_NeedInfo_01_11");		//Poslední, co si pamatuju je, jak mě ohromný horský skřet udeří do hlavy něčím těžkým!
	AI_Output(self,other,"DIA_SLD_853_Bret_NeedInfo_01_12");		//Pak jsem se poroučel přímo k zemi.
	AI_Output(self,other,"DIA_SLD_853_Bret_NeedInfo_01_13");		//Když jsem se probral, všude okolo byla spousta krve a mrtvá těla kamarádů.
	AI_Output(self,other,"DIA_SLD_853_Bret_NeedInfo_01_14");		//Zřejmě mě měli taky za mrtvého! 
	AI_Output(self,other,"DIA_SLD_853_Bret_NeedInfo_01_15");		//Jak jinak vysvětlit, že jsem přežil ten pekelný mlýnek na maso?
	B_LogEntry(TOPIC_MissOldFriend,"Vysoko v horách jsem potkal žoldáka jménem Adelhard. Řekl mi, že Dariusovu skupinu pobili horští skřeti. Ale o osudu svého velitele nic nevěděl.");
	CanTrailOrcCamp = TRUE;
};

instance DIA_SLD_853_Bret_HistoryBattle(C_Info)
{
	npc = SLD_853_Bret;
	nr = 1;
	condition = DIA_SLD_853_Bret_HistoryBattle_Condition;
	information = DIA_SLD_853_Bret_HistoryBattle_Info;
	permanent = FALSE;
	description = "Jak jste se ocitli v tomhle údolí?";
};

func int DIA_SLD_853_Bret_HistoryBattle_Condition()
{
	if(Npc_KnowsInfo(other,DIA_SLD_853_Bret_NeedInfo) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_SLD_853_Bret_HistoryBattle_Info()
{
	B_GivePlayerXP(400);
	AI_Output(other,self,"DIA_SLD_853_Bret_HistoryBattle_01_00");      //Jak jste se ocitli v tomhle údolí?
	AI_Output(self,other,"DIA_SLD_853_Bret_HistoryBattle_01_01");      //To je dlouhá historie, kamaráde...
	AI_Output(self,other,"DIA_SLD_853_Bret_HistoryBattle_01_02");      //Ale jestli nespěcháš, můžu ti ji povyprávět.
	AI_Output(other,self,"DIA_SLD_853_Bret_HistoryBattle_01_03");      //Dobře, rád si to poslechnu.
	AI_Output(self,other,"DIA_SLD_853_Bret_HistoryBattle_01_04");      //Tak dobře...
	AI_Output(self,other,"DIA_SLD_853_Bret_HistoryBattle_01_05");      //Tušili jsme, že po zřícení starého dolu bude chtít Gomez obsadit svobodný důl.
	AI_Output(self,other,"DIA_SLD_853_Bret_HistoryBattle_01_06");      //Lee to předpokládal a tak poslal družstvo žoldáků pod velením Dariuse, aby posílilo ostrahu dolu.
	AI_Output(self,other,"DIA_SLD_853_Bret_HistoryBattle_01_07");      //Když jsme dorazili, Darius jako první věc nařídil kontrolu samotného dolu!
	AI_Output(self,other,"DIA_SLD_853_Bret_HistoryBattle_01_08");      //Přizpůsobit a upravit slabá místa pro případ, že se budeme muset bránit.
	AI_Output(self,other,"DIA_SLD_853_Bret_HistoryBattle_01_09");      //No... Darius nestihnul vše připravit.
	AI_Output(self,other,"DIA_SLD_853_Bret_HistoryBattle_01_10");      //Když se oddíl přesunul do dolu, Gomezovi lidé napadli tábor zvenčí.
	AI_Output(self,other,"DIA_SLD_853_Bret_HistoryBattle_01_11");      //Samozřejmě jsme to nečekali a byli jsme dost překvapení, když se nám objevili před nosem.
	AI_Output(self,other,"DIA_SLD_853_Bret_HistoryBattle_01_12");      //Po chvilkovém zmatku následoval tuhý boj...
	AI_Output(self,other,"DIA_SLD_853_Bret_HistoryBattle_01_13");      //Zdálo se, že vítězství je nadosah...
	AI_Output(self,other,"DIA_SLD_853_Bret_HistoryBattle_01_14");      //Ale s vojáky Starého tábora přišla spousta kušiníků.
	AI_Output(self,other,"DIA_SLD_853_Bret_HistoryBattle_01_15");      //V úzkých uličkách jsou luky nepraktický, ale kuše představují velkou hrozbu!
	AI_Output(self,other,"DIA_SLD_853_Bret_HistoryBattle_01_16");      //Začali jsme ustupovat do dolu a byli jsme zatlačováni hlouběji a hlouběji.
	AI_Output(self,other,"DIA_SLD_853_Bret_HistoryBattle_01_17");      //Nakonec zbytky naší skupiny zůstaly v jakési hluché šachtě.
	AI_Output(self,other,"DIA_SLD_853_Bret_HistoryBattle_01_18");      //Když už jsme ztráceli naději, kdosi objevil v temnotě úzký průchod!
	AI_Output(self,other,"DIA_SLD_853_Bret_HistoryBattle_01_19");      //Vrhli jsme se do toho průchodu a po dlouhém bloudění jsme se dostali na povrch.
	AI_Output(self,other,"DIA_SLD_853_Bret_HistoryBattle_01_20");      //Když jsme se rozhlédli, zjistili jsme, že se nacházíme v neznámém zasněženém údolí kdesi vysoko v horách.
	AI_Output(self,other,"DIA_SLD_853_Bret_HistoryBattle_01_21");      //Později jsme přišli sem, do tohoto tábora a rozhodli se zde usadit.
	AI_Output(self,other,"DIA_SLD_853_Bret_HistoryBattle_01_22");      //Potřebovali jsme odpočinek. Gomezovi hrdlořezové nás dost zřídili a taky dlouhá cesta bez odpočinku nám na síle nepřidala.
	AI_Output(self,other,"DIA_SLD_853_Bret_HistoryBattle_01_23");      //Ale potíže ne a ne skončit. V noci náš tábor napadli horští skřeti!
	AI_Output(self,other,"DIA_SLD_853_Bret_HistoryBattle_01_24");      //Co se dělo dál už víš.
	AI_Output(other,self,"DIA_SLD_853_Bret_HistoryBattle_01_25");      //Ano, zažili jste těžké časy.
	AI_Output(self,other,"DIA_SLD_853_Bret_HistoryBattle_01_26");      //Ani slovo, můj příteli... ani slovo!
};

instance DIA_SLD_853_Bret_Away(C_Info)
{
	npc = SLD_853_Bret;
	nr = 1;
	condition = DIA_SLD_853_Bret_Away_Condition;
	information = DIA_SLD_853_Bret_Away_Info;
	permanent = FALSE;
	description = "Proč se nevrátíš do Hornického údolí?";
};

func int DIA_SLD_853_Bret_Away_Condition()
{
	if(Npc_KnowsInfo(other,DIA_SLD_853_Bret_NeedInfo) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_SLD_853_Bret_Away_Info()
{
	AI_Output(other,self,"DIA_SLD_853_Bret_Away_01_00");		//Proč se nevrátíš do Hornického údolí?
	AI_Output(self,other,"DIA_SLD_853_Bret_Away_01_01");		//Už jsem o tom přemýšlel...
	AI_Output(self,other,"DIA_SLD_853_Bret_Away_01_02");		//Ale obávám se, že sám se daleko nedostanu!
	AI_Output(self,other,"DIA_SLD_853_Bret_Away_01_03");		//Celá tahle oblast je plná různých potvor, o horských skřetech nemluvě.
	AI_Output(self,other,"DIA_SLD_853_Bret_Away_01_04");		//A jsou mnohem silnější než ti, s kterými jsme se potýkali v Hornickém údolí!
	AI_Output(self,other,"DIA_SLD_853_Bret_Away_01_05");		//Pro mě by to znamenalo jistou smrt.
	AI_Output(self,other,"DIA_SLD_853_Bret_Away_01_06");		//Proto raději zůstávám zde.
	AI_Output(other,self,"DIA_SLD_853_Bret_Away_01_07");		//Tobě tady není zima?
	AI_Output(self,other,"DIA_SLD_853_Bret_Away_01_08");		//Už jsem si zvyknul na mráz a téměř ho ani nevnímám.
	AI_Output(self,other,"DIA_SLD_853_Bret_Away_01_09");		//A jídla mám dost!
	AI_Output(self,other,"DIA_SLD_853_Bret_Away_01_10");		//Pokud nepřilákáš pozornost skřetů, pak se tady dá celkem přežít.
	AI_Output(other,self,"DIA_SLD_853_Bret_Away_01_11");		//Rozumím.
};

instance DIA_SLD_853_Bret_Adept(C_Info)
{
	npc = SLD_853_Bret;
	nr = 1;
	condition = DIA_SLD_853_Bret_Adept_Condition;
	information = DIA_SLD_853_Bret_Adept_Info;
	permanent = FALSE;
	description = "Nejsi moc vybíravý, že?";
};

func int DIA_SLD_853_Bret_Adept_Condition()
{
	if(Npc_KnowsInfo(other,DIA_SLD_853_Bret_Away) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_SLD_853_Bret_Adept_Info()
{
	AI_Output(other,self,"DIA_SLD_853_Bret_Adept_01_00");		//Nejsi moc vybíravý, že?
	AI_Output(self,other,"DIA_SLD_853_Bret_Adept_01_01");		//Tak to je. (ušklíbá se) Není divu, že kluci v Novém táboře mi dali přezdívku Adept!
	AI_Output(self,other,"DIA_SLD_853_Bret_Adept_01_02");		//Hodně jsem viděl, zažil a nikdy mě netrápily drobnosti jako tohle.
	AI_Output(other,self,"DIA_SLD_853_Bret_Adept_01_03");		//No, ano... rozumím.
};

instance DIA_SLD_853_Bret_OrcCamp(C_Info)
{
	npc = SLD_853_Bret;
	nr = 1;
	condition = DIA_SLD_853_Bret_OrcCamp_Condition;
	information = DIA_SLD_853_Bret_OrcCamp_Info;
	permanent = FALSE;
	description = "A kde se nachází skřetí tábor?";
};

func int DIA_SLD_853_Bret_OrcCamp_Condition()
{
	if((Npc_KnowsInfo(other,DIA_SLD_853_Bret_NeedInfo) == TRUE) && (MIS_MissOldFriend == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_SLD_853_Bret_OrcCamp_Info()
{
	AI_Output(other,self,"DIA_SLD_853_Bret_OrcCamp_01_00");		//A kde se nachází skřetí tábor?
	AI_Output(self,other,"DIA_SLD_853_Bret_OrcCamp_01_01");		//Hmm... (šklebí se) Ptáš se mě, jako bych tam už někdy byl.
	AI_Output(self,other,"DIA_SLD_853_Bret_OrcCamp_01_02");		//Já nevím člověče, možná někde tam v horách.
	AI_Output(self,other,"DIA_SLD_853_Bret_OrcCamp_01_03");		//Ale já bych ti moc nedoporučoval ho hledat! Nemyslím, že tě skřeti přátelsky přivítaj.
		AI_Output(other,self,"DIA_SLD_853_Bret_OrcCamp_01_04");		//Uklidni se, mám něco co skřeti respektují a nedovolí jim mě napadnout.
		AI_Output(self,other,"DIA_SLD_853_Bret_OrcCamp_01_05");		//Opravdu! A co toje?
		AI_Output(other,self,"DIA_SLD_853_Bret_OrcCamp_01_06");		//Ulu-Mulu, skřetí totem! Skřeti respektují jeho majitele.
		AI_Output(self,other,"DIA_SLD_853_Bret_OrcCamp_01_07");		//No, možné to je.
		AI_Output(self,other,"DIA_SLD_853_Bret_OrcCamp_01_08");		//No ale co jsem mohl pozorovat, tak horští skřeti jsou úplně jiní než jejich protějšky v Hornickém údolí.
		AI_Output(self,other,"DIA_SLD_853_Bret_OrcCamp_01_09");		//Jsou mnohem silnější a zuřivější. Tak možná to nebude fungovat.
	B_LogEntry(TOPIC_MissOldFriend,"Adelhard se domnívá, že budu potřebovat něco speciálního, aby mě zdejší skřeti nenapadli. Pokud je to vůbec možné...");
	Wld_InsertNpc(ORC_7550_GORKAR,"FP_ROAM_OZPRIDE_01_90");
};

instance DIA_SLD_853_Bret_Perm(C_Info)
{
	npc = SLD_853_Bret;
	nr = 1;
	condition = DIA_SLD_853_Bret_Perm_Condition;
	information = DIA_SLD_853_Bret_Perm_Info;
	permanent = TRUE;
	description = "Jak to jde?";
};

func int DIA_SLD_853_Bret_Perm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_SLD_853_Bret_Adept) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_SLD_853_Bret_Perm_Info()
{
	AI_Output(other,self,"DIA_SLD_853_Bret_Perm_01_00");		//Jak to jde?
	AI_Output(self,other,"DIA_SLD_853_Bret_Perm_01_01");		//Zatím je vše v pořádku.
};

//---------------------------Darius--------------------------------------------

instance DIA_SLD_852_Darius_EXIT(C_Info)
{
	npc = SLD_852_Darius;
	nr = 999;
	condition = DIA_SLD_852_Darius_EXIT_Condition;
	information = DIA_SLD_852_Darius_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_SLD_852_Darius_EXIT_Condition()
{
	return TRUE;
};

func void DIA_SLD_852_Darius_EXIT_Info()
{
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Wait");
};

instance DIA_SLD_852_Darius_Hallo(C_Info)
{
	npc = SLD_852_Darius;
	nr = 1;
	condition = DIA_SLD_852_Darius_Hallo_Condition;
	information = DIA_SLD_852_Darius_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_SLD_852_Darius_Hallo_Condition()
{
	if(DariusInsert == TRUE)
	{
		return TRUE;
	};
};

func void DIA_SLD_852_Darius_Hallo_Info()
{
	B_GivePlayerXP(500);
	AI_Output(self,other,"DIA_SLD_852_Darius_Hallo_01_00");		//Co to je? Nikdy by mě nenapadlo, že ještě někdy uvidím člověka. Kdo jsi?
	AI_Output(other,self,"DIA_SLD_852_Darius_Hallo_01_01");		//To není důležité. Raději mi řekni, kdo jsi ty.
	AI_Output(self,other,"DIA_SLD_852_Darius_Hallo_01_02");		//Jmenuji se Darius. Myslím, že jsme se ještě nepotkali, jinak bych si tě musel pamatovat.
	AI_Output(other,self,"DIA_SLD_852_Darius_Hallo_01_03");		//Darius, konečně se mi podařilo tě najít.
	AI_Output(self,other,"DIA_SLD_852_Darius_Hallo_01_04");		//(udiveně) Hledal jsi mě? A proč?
	AI_Output(other,self,"DIA_SLD_852_Darius_Hallo_01_05");		//Lee mě poslal. Nedokázal zapomenout na svého starého přítele.
	AI_Output(self,other,"DIA_SLD_852_Darius_Hallo_01_06");		//Lee?! Sakra... To potěší, když to slyším!
	AI_Output(other,self,"DIA_SLD_852_Darius_Hallo_01_07");		//Požádal mě, abych zjistil co se stalo s tvojí skupinou, poté co vás poslal chránit důl.
	AI_Output(self,other,"DIA_SLD_852_Darius_Hallo_01_08");		//Neexistuje už žádné moje družstvo. Všichni jsou mrtví a mě se jen se štěstím podařilo vyhnout tomuto osudu.
	AI_Output(self,other,"DIA_SLD_852_Darius_Hallo_01_09");		//Ačkoli nevím co je horší, zemřít v boji, nebo strávit zbytek života v zajetí skřetů.
	B_LogEntry(TOPIC_MissOldFriend,"Našel jsem Dariuse, byl vězněm klanu Ohnivého kamene. To není zrovna dobrá zpráva, ale aspoň je naživu.");
};

instance DIA_SLD_852_Darius_Surv(C_Info)
{
	npc = SLD_852_Darius;
	nr = 1;
	condition = DIA_SLD_852_Darius_Surv_Condition;
	information = DIA_SLD_852_Darius_Surv_Info;
	permanent = FALSE;
	description = "Kdosi je pořád naživu.";
};

func int DIA_SLD_852_Darius_Surv_Condition()
{
	if((Npc_KnowsInfo(other,DIA_SLD_852_Darius_Hallo) == TRUE) && (CanTrailOrcCamp == TRUE))
	{
		return TRUE;
	};
};

func void DIA_SLD_852_Darius_Surv_Info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_SLD_852_Darius_Surv_01_00");		//Kdosi je pořád naživu.
	AI_Output(self,other,"DIA_SLD_852_Darius_Surv_01_01");		//Co tím myslíš?
	AI_Output(other,self,"DIA_SLD_852_Darius_Surv_01_02");		//V opuštěné pevnosti jsem potkal žoldáka jménem Adelhard.
	AI_Output(self,other,"DIA_SLD_852_Darius_Surv_01_03");		//Adelhard? Ano to je jeden z mých lidí.
	AI_Output(self,other,"DIA_SLD_852_Darius_Surv_01_04");		//A jak se mu podařilo přežít to přepadení? Vždyť to byl hotový masakr.
	AI_Output(other,self,"DIA_SLD_852_Darius_Surv_01_05");		//Skřeti ho měli za mrtvého a tak ho tam nechali ležet.
	AI_Output(self,other,"DIA_SLD_852_Darius_Surv_01_06");		//(s úsměvem) Je vidět, že má kliku.
	AI_Output(self,other,"DIA_SLD_852_Darius_Surv_01_07");		//No aspoň něco, to je první dobrá zpráva po několika měsících.
	AlexCanBack = TRUE;
};

instance DIA_SLD_852_Darius_WhyKill(C_Info)
{
	npc = SLD_852_Darius;
	nr = 1;
	condition = DIA_SLD_852_Darius_WhyKill_Condition;
	information = DIA_SLD_852_Darius_WhyKill_Info;
	permanent = FALSE;
	description = "Proč tě skřeti nezabili?";
};

func int DIA_SLD_852_Darius_WhyKill_Condition()
{
	if(Npc_KnowsInfo(other,DIA_SLD_852_Darius_Hallo) == TRUE) 
	{
		return TRUE;
	};
};

func void DIA_SLD_852_Darius_WhyKill_Info()
{
	AI_Output(other,self,"DIA_SLD_852_Darius_WhyKill_01_00");	//Proč tě skřeti nezabili?
	AI_Output(self,other,"DIA_SLD_852_Darius_WhyKill_01_01");	//To je dlouhá historie... (s povzdechem)
	AI_Output(other,self,"DIA_SLD_852_Darius_WhyKill_01_02");	//Rád si ji poslechnu. Zejména proto, že horšťí skřeti jsou mnohem agresivnější než skřeti v Hornickém údolí. Je s podivem, že se tě ani nedotkli.
	AI_Output(self,other,"DIA_SLD_852_Darius_WhyKill_01_03");	//No dobře, když na tom trváš.
	AI_Output(self,other,"DIA_SLD_852_Darius_WhyKill_01_04");	//Když skřeti zaútočili na naše tábořiště, dostal jsem se do těžkého boje.
	AI_Output(self,other,"DIA_SLD_852_Darius_WhyKill_01_05");	//Moji muži byli hodně vyčerpaní, tak jsme jim nedokázali moc vzdorovat. 
	AI_Output(self,other,"DIA_SLD_852_Darius_WhyKill_01_06");	//Většina padla v prvních minutách boje.
	AI_Output(self,other,"DIA_SLD_852_Darius_WhyKill_01_07");	//Bojovali jsme, jak jsme mohli, ale skřetů bylo mnoho. Tak jsme se vzdali.
	AI_Output(self,other,"DIA_SLD_852_Darius_WhyKill_01_08");	//Přeživší skřeti nezabili, ale odvedli sebou do tábora, včetně mě.
	AI_Output(self,other,"DIA_SLD_852_Darius_WhyKill_01_09");	//Po příchodu do tábora nám vypálili značku, zavřeli nás do klecí a drželi nás tu jako prasata.
	AI_Output(self,other,"DIA_SLD_852_Darius_WhyKill_01_10");	//Neuplynulo dne, aby nás skřeti nezbili a nevysmívali se nám.
	AI_Output(self,other,"DIA_SLD_852_Darius_WhyKill_01_11");	//A ještě k tomu jsem se musel dívat na ty opičí ksichty od rána do večera.
	AI_Output(self,other,"DIA_SLD_852_Darius_WhyKill_01_12");	//A jindy zase přišel šaman a ukázal na jednoho z nás.
	AI_Output(self,other,"DIA_SLD_852_Darius_WhyKill_01_13");	//Toho chudáka odvedli kamsi pryč a už se nikdy nevrátil.
	AI_Output(self,other,"DIA_SLD_852_Darius_WhyKill_01_14");	//Jak jsem se později dozvěděl, ti chudáci byli obětováni jejich bohům.
	AI_Output(self,other,"DIA_SLD_852_Darius_WhyKill_01_15");	//Uvědomil jsem si, že můj osud je zpečetěn a rozhodl jsem se, že se pokusím uprchnout. A taky jsem to jednoho krásného dne udělal.
	AI_Output(self,other,"DIA_SLD_852_Darius_WhyKill_01_16");	//Když jsem se dostal na svobodu, dlouho jsem bloudil po těchto horách, hladový a téměř úplně zmrzlý. 
	AI_Output(self,other,"DIA_SLD_852_Darius_WhyKill_01_17");	//Síla mě opustila, když jsem narazil na skřetí hlídku.
	AI_Output(self,other,"DIA_SLD_852_Darius_WhyKill_01_18");	//Ale nevypadali jako ti skřeti, u kterých jsem byl celou tu dobu v zajetí. 
	AI_Output(self,other,"DIA_SLD_852_Darius_WhyKill_01_19");	//Myslel jsem, že už jsem mrtvý. Ale skřeti to se mnou nechtěli skončit. 
 	AI_Output(self,other,"DIA_SLD_852_Darius_WhyKill_01_20");	//Dlouho něco probírali a pak mě odnesli do svého tábora. Matně si vzpomínám, co se dělo dál... (povzdech)
	AI_Output(self,other,"DIA_SLD_852_Darius_WhyKill_01_21");	//Ocitl jsem se v táboře Ohnivého kamene - tak se nazývá jejich klan.
	AI_Output(self,other,"DIA_SLD_852_Darius_WhyKill_01_22");	//Jak se ukázalo, byli ve válce s kmenem, od kterého jsem uprchl.
	AI_Output(self,other,"DIA_SLD_852_Darius_WhyKill_01_23");	//Pak se mě začli vyptávat na všechno, co jsem v táboře viděl, když jsem byl v zajetí. Popsal jsem jim tábor do posledního detailu.
	AI_Output(self,other,"DIA_SLD_852_Darius_WhyKill_01_24");	//Z vděčnosti ušetřili můj život a od té doby žiji zde.
	AI_Output(self,other,"DIA_SLD_852_Darius_WhyKill_01_25");	//Ale pořád jsem jejich vězeň. A vypadá to, že tady zůstanu navždy.
	B_LogEntry(TOPIC_MissOldFriend,"Darius mi vyprávěl, jak byl držen v zajetí jiným klanem skřetů a proč klan Ohnivého kamene ušetřil jeho život.");
};

instance DIA_SLD_852_Darius_Escape(C_Info)
{
	npc = SLD_852_Darius;
	nr = 1;
	condition = DIA_SLD_852_Darius_Escape_Condition;
	information = DIA_SLD_852_Darius_Escape_Info;
	permanent = FALSE;
	description = "A to ses nepokusil znovu utéct?";
};

func int DIA_SLD_852_Darius_Escape_Condition()
{
	if((Npc_KnowsInfo(other,DIA_SLD_852_Darius_WhyKill) == TRUE) && (MIS_MissOldFriend == LOG_Running)) 
	{
		return TRUE;
	};
};

func void DIA_SLD_852_Darius_Escape_Info()
{
	AI_Output(other,self,"DIA_SLD_852_Darius_Escape_01_00");		//A to ses nepokusil znovu utéct?
	AI_Output(self,other,"DIA_SLD_852_Darius_Escape_01_01");		//A co to má za smysl, kamaráde?
	AI_Output(self,other,"DIA_SLD_852_Darius_Escape_01_02");		//Za prvé, vůbec neznám zdejší prostředí.
	AI_Output(self,other,"DIA_SLD_852_Darius_Escape_01_03");		//Nejspíš bych zemřel hlady, nebo bych se stal potravou pro zdejší šelmy, než že bych se odsud dostal živý.
	AI_Output(self,other,"DIA_SLD_852_Darius_Escape_01_04");		//A kdyby se mi útěk nepovedl, pravděpodobně by mě zabili.
	AI_Output(self,other,"DIA_SLD_852_Darius_Escape_01_05");		//Co jsem slyšel, Nový tábor už neexistuje... a nevím kam jinam bych se měl vydat.
	AI_Output(other,self,"DIA_SLD_852_Darius_Escape_01_06");		//Mohl by ses znovu spojit s Leem a jeho lidma.
	AI_Output(self,other,"DIA_SLD_852_Darius_Escape_01_07");		//A kde jsou nyní?
	AI_Output(other,self,"DIA_SLD_852_Darius_Escape_01_08");		//Jeho žoldáci hlídají farmu bohatého statkáře, nedaleko od města Khorinisu.
	AI_Output(self,other,"DIA_SLD_852_Darius_Escape_01_09");		//Kamaráde! Ty nemáš nejmenší představu o tom, kde se nyní nacházíme a kam mě posíláš!
	AI_Output(self,other,"DIA_SLD_852_Darius_Escape_01_10");		//Já nedokážu odsud ujít ani pár kroků abych se neztratil. A ty taky ne...
	AI_Output(self,other,"DIA_SLD_852_Darius_Escape_01_11");		//Bez dobrého průvodce na to můžeš zapomenout! A skřeti mě stejně nepustí.
	AI_Output(other,self,"DIA_SLD_852_Darius_Escape_01_12");		//Dobře, něco vymyslím.
	B_LogEntry(TOPIC_MissOldFriend,"Podle Dariuse nemá žádný smysl utíkat ze zajetí skřetů. Ale stále můžu vyjednávat se skřety o jeho propuštění. I když ho skřeti propustí, tak budem potřebovat průvodce, bez něj Darius nikam nepůjde.");
	NeedDariusFree = TRUE;
};

instance DIA_SLD_852_Darius_IsFree(C_Info)
{
	npc = SLD_852_Darius;
	nr = 1;
	condition = DIA_SLD_852_Darius_IsFree_Condition;
	information = DIA_SLD_852_Darius_IsFree_Info;
	permanent = FALSE;
	description = "Jsi svobodný!";
};

func int DIA_SLD_852_Darius_IsFree_Condition()
{
	if((MIS_FreePrice == LOG_SUCCESS) && (DariusHasPath == TRUE) && (MIS_MissOldFriend == LOG_Running)) 
	{
		return TRUE;
	};
};

func void DIA_SLD_852_Darius_IsFree_Info()
{
	B_GivePlayerXP(2000);	
	AI_Output(other,self,"DIA_SLD_852_Darius_IsFree_01_00");	//Jsi svobodný!
	AI_Output(self,other,"DIA_SLD_852_Darius_IsFree_01_01");	//Co?! Děláš si srandu?
	AI_Output(other,self,"DIA_SLD_852_Darius_IsFree_01_02");	//Koupil jsem ti svobodu od vůdce klanu, za velkou kůži bílého horského trola.
	AI_Output(other,self,"DIA_SLD_852_Darius_IsFree_01_03");	//A také ti dá několik válečníků, kteří tě doprovodí zpět do Khorinisu.
	AI_Output(self,other,"DIA_SLD_852_Darius_IsFree_01_04");	//Neuvěřitelné! Děkuji, příteli, nikdy ti to nezapomenu!
	AI_Output(other,self,"DIA_SLD_852_Darius_IsFree_01_05");	//No myslím, že se potkáme u Leeho.
	DariusIsFree = TRUE;
	B_LogEntry(TOPIC_MissOldFriend,"Řekl jsem Dariusovi, že je volný a že několik skřetích válečníků mu pomůže dostat se z těchto hor, aby se mohl vrátit k Leemu.");
};

instance DIA_SLD_852_Darius_Perm(C_Info)
{
	npc = SLD_852_Darius;
	nr = 1;
	condition = DIA_SLD_852_Darius_Perm_Condition;
	information = DIA_SLD_852_Darius_Perm_Info;
	permanent = TRUE;
	description = "Kdy se vydáš na cestu?";
};

func int DIA_SLD_852_Darius_Perm_Condition()
{
	if((DariusIsFree == TRUE) && (MIS_MissOldFriend == LOG_Running)) 
	{
		return TRUE;
	};
};

func void DIA_SLD_852_Darius_Perm_Info()
{
	AI_Output(other,self,"DIA_SLD_852_Darius_Perm_01_00");		//Kdy se vydáš na cestu?
	AI_Output(self,other,"DIA_SLD_852_Darius_Perm_01_01");		//Brzo, ale nejdřív se musím dobře připravit.
	AI_Output(self,other,"DIA_SLD_852_Darius_Perm_01_02");		//Cesta přes hory nebude procházka růžovým sadem!
};


//---------------------Khorinis Adelkhard--------------------------------------------------

instance DIA_SLD_858_Bret_EXIT(C_Info)
{
	npc = SLD_858_Bret;
	nr = 999;
	condition = DIA_SLD_858_Bret_EXIT_Condition;
	information = DIA_SLD_858_Bret_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_SLD_858_Bret_EXIT_Condition()
{
	return TRUE;
};

func void DIA_SLD_858_Bret_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SLD_858_Bret_Perm(C_Info)
{
	npc = SLD_858_Bret;
	nr = 1;
	condition = DIA_SLD_858_Bret_Perm_Condition;
	information = DIA_SLD_858_Bret_Perm_Info;
	permanent = FALSE;
	description = "Kde ses tu vzal?";
};

func int DIA_SLD_858_Bret_Perm_Condition()
{
	return TRUE;
};

func void DIA_SLD_858_Bret_Perm_Info()
{
	B_GivePlayerXP(100);	
	AI_Output(other,self,"DIA_SLD_858_Bret_Perm_01_00");		//Kde ses tu vzal?
	AI_Output(self,other,"DIA_SLD_858_Bret_Perm_01_01");		//Jak asi... (klidně) Vrátil jsem se společně s Dariusem! Jak jinak?
	AI_Output(self,other,"DIA_SLD_858_Bret_Perm_01_02");		//Zpočátku jsem byl trošku zaskočen, když se objevil v opuštěné pevnosti, obklopený skupinou skřetů.
	AI_Output(self,other,"DIA_SLD_858_Bret_Perm_01_03");		//Ale pak to začalo do sebe zapadat! 
	AI_Output(self,other,"DIA_SLD_858_Bret_Perm_01_04");		//Darius mi vše vysvětlil, sdělil mi, že skřeti jsou naši průvodci a ukážou nám cestu z údolí.
	AI_Output(self,other,"DIA_SLD_858_Bret_Perm_01_05");		//A já ti povím, příteli, je to mnohem lepší, než si nechat mrznout svůj zadek v těch Innosem zapomenutých horách.
	AI_Output(other,self,"DIA_SLD_858_Bret_Perm_01_06");		//O tom nepochybuji.
	AlehardHere = TRUE;
};

instance DIA_SLD_858_Bret_Farm(C_Info)
{
	npc = SLD_858_Bret;
	nr = 1;
	condition = DIA_SLD_858_Bret_Farm_Condition;
	information = DIA_SLD_858_Bret_Farm_Info;
	permanent = FALSE;
	description = "Jak se ti líbí na farmě?";
};

func int DIA_SLD_858_Bret_Farm_Condition()
{
	if(Npc_KnowsInfo(other,DIA_SLD_858_Bret_Perm) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_SLD_858_Bret_Farm_Info()
{
	AI_Output(other,self,"DIA_SLD_858_Bret_Farm_01_00");      //Jak se ti líbí na farmě?
	AI_Output(self,other,"DIA_SLD_858_Bret_Farm_01_01");      //Není to špatné. Aspoň tady není taková nuda jako v tom Innosem zapomenutém kraji, he... he!
	AI_Output(self,other,"DIA_SLD_858_Bret_Farm_01_02");      //A Thekla velmi dobře vaří. I když takového gurmána jako jsem já v kuchyni moc ráda nevidí. (směje se)
	AI_Output(self,other,"DIA_SLD_858_Bret_Farm_01_03");      //Měl jsem příležitost mluvit i s Onarem. Moc toho nenamluví, ale jinak normální chlap.
};

instance DIA_SLD_858_Bret_Perm_Done(C_Info)
{
	npc = SLD_858_Bret;
	nr = 1;
	condition = DIA_SLD_858_Bret_Perm_Done_Condition;
	information = DIA_SLD_858_Bret_Perm_Done_Info;
	permanent = TRUE;
	description = "Co budeš dělat teď?";
};

func int DIA_SLD_858_Bret_Perm_Done_Condition()
{
	if(Npc_KnowsInfo(other,DIA_SLD_858_Bret_Farm) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_SLD_858_Bret_Perm_Done_Info()
{
	AI_Output(other,self,"DIA_SLD_858_Bret_Perm_Done_01_00");		//Co budeš dělat teď?
	AI_Output(self,other,"DIA_SLD_858_Bret_Perm_Done_01_01");		//Nyní se budu snažit trochu ohřát. V těch prokletých horách jsem promrznul až do morku kosti.
	AI_Output(self,other,"DIA_SLD_858_Bret_Perm_Done_01_02");		//A jíst do prasknutí. Tak aby to na mě bylo vidět.
	AI_Output(other,self,"DIA_SLD_858_Bret_Perm_Done_01_03");		//Rozumím.
};

//---------------------Khorinis Darius--------------------------------------------------


instance DIA_SLD_857_Darius_EXIT(C_Info)
{
	npc = SLD_857_Darius;
	nr = 999;
	condition = DIA_SLD_857_Darius_EXIT_Condition;
	information = DIA_SLD_857_Darius_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_SLD_857_Darius_EXIT_Condition()
{
	return TRUE;
};

func void DIA_SLD_857_Darius_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_SLD_857_Darius_Perm(C_Info)
{
	npc = SLD_857_Darius;
	nr = 1;
	condition = DIA_SLD_857_Darius_Perm_Condition;
	information = DIA_SLD_857_Darius_Perm_Info;
	permanent = FALSE;
	description = "Jaká byla cesta přes hory?";
};

func int DIA_SLD_857_Darius_Perm_Condition()
{
	return TRUE;
};

func void DIA_SLD_857_Darius_Perm_Info()
{
	B_GivePlayerXP(100);	
	AI_Output(other,self,"DIA_SLD_857_Darius_Perm_01_00");		//Jaká byla cesta přes hory?
	AI_Output(self,other,"DIA_SLD_857_Darius_Perm_01_01");		//Nebylo to snadné. Setupovali jsme z hor asi dva dny.
	AI_Output(self,other,"DIA_SLD_857_Darius_Perm_01_02");		//Popravdě, myslel jsem, že skřeti mě odvedou někam do Hornického údolí.
	AI_Output(self,other,"DIA_SLD_857_Darius_Perm_01_03");		//Ale z nějakého důvodu mě vzali přímo k průchodu.
	AI_Output(self,other,"DIA_SLD_857_Darius_Perm_01_04");		//V Hornickém údolí je to nyní velmi nebezpečné. Myslím, že o tom věděli a tak mě odvedli až tam.
	AI_Output(self,other,"DIA_SLD_857_Darius_Perm_01_05");		//(usmívá se) Ale to není důležité, hlavně že jsem opět s kamarádama a Leem.
	AI_Output(self,other,"DIA_SLD_857_Darius_Perm_01_06");		//Ještě jednou děkuji, příteli.
};

instance DIA_SLD_857_Darius_Perm_Done(C_Info)
{
	npc = SLD_857_Darius;
	nr = 1;
	condition = DIA_SLD_857_Darius_Perm_Done_Condition;
	information = DIA_SLD_857_Darius_Perm_Done_Info;
	permanent = TRUE;
	description = "Jak to jde?";
};

func int DIA_SLD_857_Darius_Perm_Done_Condition()
{
	if(Npc_KnowsInfo(other,DIA_SLD_857_Darius_Perm) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_SLD_857_Darius_Perm_Done_Info()
{
	AI_Output(other,self,"DIA_SLD_857_Darius_Perm_Done_01_00");		//Jak to jde?
	AI_Output(self,other,"DIA_SLD_857_Darius_Perm_Done_01_01");		//Vše v nejlepším pořádku, příteli.
};

instance DIA_LEE_TOWER(C_Info)
{
	npc = SLD_800_Lee;
	nr = 3;
	condition = dia_lee_tower_condition;
	information = dia_lee_tower_info;
	permanent = FALSE;
	description = "Poslouchej, mám na tebe neobvyklý dotaz.";
};

func int dia_lee_tower_condition()
{
	if((MIS_MYNEWMANSION == LOG_Running) && (DECISION_TOWER_MADE == FALSE))
	{
		return TRUE;
	};
};

func void dia_lee_tower_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Lee_Tower_15_00");	//Poslouchej, mám na tebe neobvyklý dotaz.
	AI_Output(other,self,"DIA_Lee_Tower_15_01");	//Nedaleko na jihu se nachází jedna stará věž. Má s ní Onar nějaké plány?
	AI_Output(self,other,"DIA_Lee_Tower_05_02");	//Co tím myslíš? Onar říkal že věž je jeho, ale neviděl jsem, že by tam něco dělali.
	AI_Output(self,other,"DIA_Lee_Tower_05_03");	//Potom co zemřely ty 'problémy', jsem ho požádal jestli by ji neopravil.
	AI_Output(self,other,"DIA_Lee_Tower_05_04");	//Jenomže měl zrovna špatnou náladu kvůli problémům s nájmem u Sekoba, a neposlouchal mě.
	AI_Output(self,other,"DIA_Lee_Tower_05_05");	//Víc jsem se k tomuhle nevracel. Proč se ptáš?
	AI_Output(other,self,"DIA_Lee_Tower_15_06");	//Víš, nedávno jsem vyčistil tu věž od Beliarových stoupenců.
	AI_Output(other,self,"DIA_Lee_Tower_15_07");	//A lord Hagen se rozhodl mi ji věnovat jako odměnu.
	AI_Output(self,other,"DIA_Lee_Tower_05_08");	//Lord Hagen si myslí, že by mohl disponovat těmahle místníma planinama?!
	AI_Output(self,other,"DIA_Lee_Tower_05_09");	//(zklidnění) Dobře. Aspoň se rozhodl to dát tobě a ne někomu jinému. Co s ní chceš dělat?
	AI_Output(other,self,"DIA_Lee_Tower_15_10");	//Vybavit ji, najmout lidi na ochranu. Možná se pokusím rozvíjet obchod s rudou.
	AI_Output(other,self,"DIA_Lee_Tower_15_11");	//Stručně řečeno, snažím se aby se začala využívat, namísto velké ruiny.
	AI_Output(self,other,"DIA_Lee_Tower_05_12");	//Hmmm... no. Líbí se mi tvůj nápad. Nicméně bez schválení Onara na věž nemůžeš ani sáhnout.
	AI_Output(self,other,"DIA_Lee_Tower_05_13");	//Beru to tak, že chceš abych ten problém vyřešil?
	AI_Output(other,self,"DIA_Lee_Tower_15_14");	//Správně.
	AI_Output(self,other,"DIA_Lee_Tower_05_15");	//Dobře. Promluvím s Onarem. Je to jen o prst k neúspěchu.
	AI_Output(self,other,"DIA_Lee_Tower_05_16");	//Už jsem já osobně unavený z poslouchání stížností rolníků a žoldáků o toto nešťastné území.
	AI_Output(self,other,"DIA_Lee_Tower_05_17");	//Och, a nechtěl bych mu říkat o roli lorda Hagena v tom všem, musíš si nějak poradit.
	LEE_APPROVES_TOWER = TRUE;
	B_LogEntry(TOPIC_MYNEWMANSION,"Lee si popovídá s Onarem o mém podnikání.");
	AI_StopProcessInfos(self);
};
