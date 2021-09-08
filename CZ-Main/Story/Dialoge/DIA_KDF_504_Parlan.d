/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.01:

func int DIA_Parlan_TEACH_MANA_Condition - upraveny podmínky dialogu
(3x) CanLearnMagicCircleNext_ABCZ - upraveny podmínky učení se magických kruhů (na žádost hráčů)
func int dia_parlan_pickpocket_condition - upraveny podmínky krádeže

*/



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
	AI_Output(self,other,"DIA_Parlan_HAMMER_05_00");	//(přísně) Počkej minutu, synu.
	AI_Output(self,other,"DIA_Parlan_HAMMER_05_01");	//Povídá se, že se 'ztratil' jeden významný artefakt ze svatyně.
	AI_Output(self,other,"DIA_Parlan_HAMMER_05_02");	//Nechci o tom vědět víc – jenom očekávám, že bude zpět na místě.
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
	concatText = "Mágové Ohně mě postavili mimo zákon!";
	AI_Print(concatText);
};

func void dia_parlan_pmschulden_attackmurder()
{
	var string concatText;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_HumanMurderedHuman,0);
	GLOBAL_MAKE_BANDIT_FORMON = 1;
	concatText = "Mágové Ohně mě postavili mimo zákon!";
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
	AI_Output(self,other,"DIA_Parlan_PMSchulden_05_00");	//Porušil jsi pravidla naší komunity.
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
			AI_Output(self,other,"DIA_Parlan_PMSchulden_08_36");	//Varoval jsem tě. Řekl jsem ti, že bys neměl.
			AI_Output(self,other,"DIA_Parlan_PMSchulden_08_37");	//Innos netrpí vrahy! Zabil jsi bratra – už nemůžeš spoléhat na jeho milosrdenství!
			AI_Output(self,other,"DIA_Parlan_PMSchulden_08_38");	//Jeho hněv tě zasáhne dříve, než by sis myslel...
			if(Npc_HasItems(self,ItRu_Pyrokinesis) == 0)
			{
				CreateInvItems(self,ItRu_Pyrokinesis,1);
			};
			B_ReadySpell(self,SPL_Pyrokinesis,SPL_COST_Firestorm);
			AI_Output(self,other,"DIA_Parlan_PMSchulden_08_39");	//Zemři z vůle Innosovy!
		}
		else if(GLOBAL_MONASTERY_ATTACK > 5)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_MONASTERY_ATTACK),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_ATTACKCOUNT2_MONASTERY);
			tsettext3 = ConcatStrings(PRINT_ATTACKCOUNT_MONASTERY,tsettext2);
			AI_Output(self,other,"DIA_Parlan_PMSchulden_08_40");	//Varoval jsem tě. Řekl jsem ti, že bys neměl.
			AI_Output(self,other,"DIA_Parlan_PMSchulden_08_41");	//Zaútočil jsi na své bratry – už nemůžeš spoléhat na Innosovo milosrdenství!
			AI_Output(self,other,"DIA_Parlan_PMSchulden_08_42");	//Jeho hněv tě zasáhne dříve, než by sis myslel...
			if(Npc_HasItems(self,ItRu_Pyrokinesis) == 0)
			{
				CreateInvItems(self,ItRu_Pyrokinesis,1);
			};
			B_ReadySpell(self,SPL_Pyrokinesis,SPL_COST_Firestorm);
			AI_Output(self,other,"DIA_Parlan_PMSchulden_08_43");	//Zemři z vůle Innosovy!
		}
		else if(GLOBAL_MONASTERY_THEFT > 5)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_MONASTERY_THEFT),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_THEFTCOUNT2_MONASTERY);
			tsettext3 = ConcatStrings(PRINT_THEFTCOUNT_MONASTERY,tsettext2);
			AI_Output(self,other,"DIA_Parlan_PMSchulden_08_44");	//Varoval jsem tě. Řekl jsem ti, že bys neměl.
			AI_Output(self,other,"DIA_Parlan_PMSchulden_08_45");	//Okradl jsi své bratry – už nemůžeš spoléhat na Innosovo milosrdenství!
			AI_Output(self,other,"DIA_Parlan_PMSchulden_08_46");	//Jeho hněv tě zasáhne dříve, než by sis myslel...
			if(Npc_HasItems(self,ItRu_Pyrokinesis) == 0)
			{
				CreateInvItems(self,ItRu_Pyrokinesis,1);
			};
			B_ReadySpell(self,SPL_Pyrokinesis,SPL_COST_Firestorm);
			AI_Output(self,other,"DIA_Parlan_PMSchulden_08_47");	//Zemři z vůle Innosovy!
		};
		Log_CreateTopic(TOPIC_DIPLOM,LOG_NOTE);
		B_LogEntry(TOPIC_DIPLOM,"Zkazil jsem si to u mágů Ohně díky svým přečinům. Teď mě považují za zločince!");
		Info_ClearChoices(DIA_Parlan_PMSchulden);
		Info_ClearChoices(DIA_Parlan_PETZMASTER);
		Info_AddChoice(DIA_Parlan_PMSchulden,"Počkej!... (zdržuje)",dia_parlan_pmschulden_attackmurder);
	}
	else
	{
		if(B_GetTotalPetzCounter(self) > Parlan_LastPetzCounter)
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_01");	//A i když jsi už byl obviněn, teď toho máš na triku ještě víc.
			if(Parlan_Schulden < 1000)
			{
				AI_Output(self,other,"DIA_Parlan_PMSchulden_05_02");	//Tvá vina může být smazána jenom velkým darem klášteru.
				AI_Output(other,self,"DIA_Parlan_PMAdd_15_00");	//Kolik?
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
				AI_Output(self,other,"DIA_Parlan_PMSchulden_05_03");	//Kdo si myslíš, že jsi? Modli se k Innosovi, aby ti odpustil tvé hříchy!
				AI_Output(other,self,"DIA_Parlan_PMAdd_15_00A");	//Kolik?
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
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_04");	//Tvá situace se změnila.
			if(Parlan_LastPetzCrime == CRIME_MURDER)
			{
				AI_Output(self,other,"DIA_Parlan_PMSchulden_05_05");	//Už není nikdo, kdo by dosvědčil tvou vraždu!
				GLOBAL_MONASTERY_MURDER = GLOBAL_MONASTERY_MURDER - 1;
				if(GLOBAL_MONASTERY_MURDER < 0)
				{
					GLOBAL_MONASTERY_MURDER = 0;
				};
			};
			if((Parlan_LastPetzCrime == CRIME_THEFT) || ((Parlan_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT)))
			{
				AI_Output(self,other,"DIA_Parlan_PMSchulden_05_06");	//Nikdo již netvrdí, žes kradl!
				GLOBAL_MONASTERY_THEFT = GLOBAL_MONASTERY_THEFT - 1;
				if(GLOBAL_MONASTERY_THEFT < 0)
				{
					GLOBAL_MONASTERY_THEFT = 0;
				};
			};
			if((Parlan_LastPetzCrime == CRIME_ATTACK) || ((Parlan_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK)))
			{
				AI_Output(self,other,"DIA_Parlan_PMSchulden_05_07");	//Nikdo tě už neviní z výtržností!
				GLOBAL_MONASTERY_ATTACK = GLOBAL_MONASTERY_ATTACK - 1;
				if(GLOBAL_MONASTERY_ATTACK < 0)
				{
					GLOBAL_MONASTERY_ATTACK = 0;
				};
			};
			if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
			{
				AI_Output(self,other,"DIA_Parlan_PMSchulden_05_08");	//Všechna tvá obvinění byly zrušena!
			};
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_09");	//Možná mě můžeš oklamat, ale Innos na tvé skutky nezapomněl!
			if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
			{
				AI_Output(self,other,"DIA_Parlan_PMSchulden_05_10");	//Tvé hříchy jsou teď odpuštěny.
				AI_Output(self,other,"DIA_Parlan_PMSchulden_05_11");	//Dávej pozor, aby to tak zůstalo!
				Parlan_Schulden = 0;
				Parlan_LastPetzCounter = 0;
				Parlan_LastPetzCrime = CRIME_NONE;
			}
			else
			{
				AI_Output(self,other,"DIA_Parlan_PMSchulden_05_12");	//Zaplatíš pokutu za své skutky – z vůle Innosovy!
				AI_Output(other,self,"DIA_Parlan_PMAdd_15_00B");	//Kolik?
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
				AI_Output(self,other,"DIA_Parlan_PMSchulden_05_13");	//Osvoboď se od hříchu!
			};
		};
		if(B_GetGreatestPetzCrime(self) != CRIME_NONE)
		{
			Info_ClearChoices(DIA_Parlan_PMSchulden);
			Info_ClearChoices(DIA_Parlan_PETZMASTER);
			Info_AddChoice(DIA_Parlan_PMSchulden,"Nemám dost zlata!",DIA_Parlan_PETZMASTER_PayLater);
			Info_AddChoice(DIA_Parlan_PMSchulden,"Kolik bych měl zaplatit?",DIA_Parlan_PMSchulden_HowMuchAgain);
			if(Npc_HasItems(other,ItMi_Gold) >= Parlan_Schulden)
			{
				Info_AddChoice(DIA_Parlan_PMSchulden,"Chtěl bych zaplatit pokutu.",DIA_Parlan_PETZMASTER_PayNow);
			};
		};
	};
};

func void DIA_Parlan_PMSchulden_HowMuchAgain()
{
	var string concatText1;
	var string concatText2;
	var string concattextschulden;
	AI_Output(other,self,"DIA_Parlan_PMSchulden_HowMuchAgain_15_00");	//Kolik bych měl zaplatit?
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
	Info_AddChoice(DIA_Parlan_PMSchulden,"Nemám dost zlata!",DIA_Parlan_PETZMASTER_PayLater);
	Info_AddChoice(DIA_Parlan_PMSchulden,"Kolik bych měl zaplatit?",DIA_Parlan_PMSchulden_HowMuchAgain);
	if(Npc_HasItems(other,ItMi_Gold) >= Parlan_Schulden)
	{
		Info_AddChoice(DIA_Parlan_PMSchulden,"Chtěl bych zaplatit pokutu.",DIA_Parlan_PETZMASTER_PayNow);
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
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_00");	//Ještě jsme si ani nepovídali, a již na sobě neseš břemeno viny!
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
			AI_Output(self,other,"DIA_Parlan_PETZMASTER_08_48");	//Varoval jsem tě. Řekl jsem ti, že bys neměl.
			AI_Output(self,other,"DIA_Parlan_PETZMASTER_08_49");	//Innos netrpí vrahy! Zabil jsi bratra – už nemůžeš spoléhat na jeho milosrdenství!
			AI_Output(self,other,"DIA_Parlan_PETZMASTER_08_50");	//Jeho hněv tě zasáhne dříve, než by sis myslel...
			if(Npc_HasItems(self,ItRu_Pyrokinesis) == 0)
			{
				CreateInvItems(self,ItRu_Pyrokinesis,1);
			};
			B_ReadySpell(self,SPL_Pyrokinesis,SPL_COST_Firestorm);
			AI_Output(self,other,"DIA_Parlan_PETZMASTER_08_51");	//Zemři z vůle Innosovy!
		}
		else if(GLOBAL_MONASTERY_ATTACK > 5)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_MONASTERY_ATTACK),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_ATTACKCOUNT2_MONASTERY);
			tsettext3 = ConcatStrings(PRINT_ATTACKCOUNT_MONASTERY,tsettext2);
			AI_Output(self,other,"DIA_Parlan_PETZMASTER_08_52");	//Varoval jsem tě. Řekl jsem ti, že bys neměl.
			AI_Output(self,other,"DIA_Parlan_PETZMASTER_08_53");	//Zaútočil jsi na své bratry – už nemůžeš spoléhat na Innosovo milosrdenství!
			AI_Output(self,other,"DIA_Parlan_PETZMASTER_08_54");	//Jeho hněv tě zasáhne dříve, než by sis myslel...
			if(Npc_HasItems(self,ItRu_Pyrokinesis) == 0)
			{
				CreateInvItems(self,ItRu_Pyrokinesis,1);
			};
			B_ReadySpell(self,SPL_Pyrokinesis,SPL_COST_Firestorm);
			AI_Output(self,other,"DIA_Parlan_PETZMASTER_08_55");	//Zemři z vůle Innosovy!
		}
		else if(GLOBAL_MONASTERY_THEFT > 5)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_MONASTERY_THEFT),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_THEFTCOUNT2_MONASTERY);
			tsettext3 = ConcatStrings(PRINT_THEFTCOUNT_MONASTERY,tsettext2);
			AI_Output(self,other,"DIA_Parlan_PETZMASTER_08_56");	//Varoval jsem tě. Řekl jsem ti, že bys neměl.
			AI_Output(self,other,"DIA_Parlan_PETZMASTER_08_57");	//Okradl jsi své bratry – už nemůžeš spoléhat na Innosovo milosrdenství!
			AI_Output(self,other,"DIA_Parlan_PETZMASTER_08_58");	//Jeho hněv tě zasáhne dříve, než by sis myslel...
			if(Npc_HasItems(self,ItRu_Pyrokinesis) == 0)
			{
				CreateInvItems(self,ItRu_Pyrokinesis,1);
			};
			B_ReadySpell(self,SPL_Pyrokinesis,SPL_COST_Firestorm);
			AI_Output(self,other,"DIA_Parlan_PETZMASTER_08_59");	//Zemři z vůle Innosovy!
		};
		Log_CreateTopic(TOPIC_DIPLOM,LOG_NOTE);
		B_LogEntry(TOPIC_DIPLOM,"Zkazil jsem si to u mágů Ohně díky svým přečinům. Teď mě považují za zločince!");
		Info_ClearChoices(DIA_Parlan_PMSchulden);
		Info_ClearChoices(DIA_Parlan_PETZMASTER);
		Info_AddChoice(DIA_Parlan_PETZMASTER,"Počkej!... (zdržuje)",dia_parlan_petzmaster_attackmurder);
	}
	else
	{
		if(B_GetGreatestPetzCrime(self) == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_01");	//Jsi vinen z toho nejhoršího zločinu! Vraždy!
			Parlan_Schulden = B_GetTotalPetzCounter(self) * 1500;
			if((PETZCOUNTER_City_Theft + PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
			{
				AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_02");	//A máš toho na triku ještě víc!
			};
			AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_03");	//Kdyby to bylo na mně, byl bys zabit na místě, vrahu!
			AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_04");	//Avšak, když zaplatíš pokutu, zbavím tě viny.
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_THEFT)
		{
			AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_05");	//Krádež je porušení pravidel kláštera!
			if((PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
			{
				AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_06");	//Kromě toho jsi porušil ještě další pravidla.
			};
			AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_07");	//Tyto provinění musí být potrestány. Takový je Innosův zákon.
			AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_08");	//Zaplatíš klášteru pokutu úměrnou tvým skutkům.
			Parlan_Schulden = B_GetTotalPetzCounter(self) * 500;
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
		{
			AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_09");	//V našem kláštere netolerujeme výtržnosti. Takové chování porušuje naše pravidla.
			if(PETZCOUNTER_City_Sheepkiller > 0)
			{
				AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_10");	//A proč nám zabíjíš ovce?
			};
			AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_11");	//Žijeme tady podle našich pravidel a ty platí i pro tebe.
			AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_12");	//Za tvůj přečin nám musíš přinést dar.
			Parlan_Schulden = B_GetTotalPetzCounter(self) * 750;
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER)
		{
			AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_13");	//Zabil jsi nám ovce. Zaplatíš náhradu!
			Parlan_Schulden = 250;
		};
		AI_Output(other,self,"DIA_Parlan_PETZMASTER_15_14");	//Kolik?
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
		Info_AddChoice(DIA_Parlan_PETZMASTER,"Nemám dost zlata!",DIA_Parlan_PETZMASTER_PayLater);
		if(Npc_HasItems(other,ItMi_Gold) >= Parlan_Schulden)
		{
			Info_AddChoice(DIA_Parlan_PETZMASTER,"Chtěl bych zaplatit pokutu.",DIA_Parlan_PETZMASTER_PayNow);
		};
	};
};

func void DIA_Parlan_PETZMASTER_PayNow()
{
	AI_Output(other,self,"DIA_Parlan_PETZMASTER_PayNow_15_00");	//Chtěl bych zaplatit pokutu!
	B_GiveInvItems(other,self,ItMi_Gold,Parlan_Schulden);
	AI_Output(self,other,"DIA_Parlan_PETZMASTER_PayNow_05_01");	//Přijímám tvůj dar. Tvé hříchy jsou ti odpuštěny. Nechť ti Innos dodá moudrost, abys je neopakoval.
	B_GrantAbsolution(LOC_MONASTERY);
	Parlan_Schulden = 0;
	Parlan_LastPetzCounter = 0;
	Parlan_LastPetzCrime = CRIME_NONE;
	Info_ClearChoices(DIA_Parlan_PMSchulden);
	Info_ClearChoices(DIA_Parlan_PETZMASTER);
};

func void DIA_Parlan_PETZMASTER_PayLater()
{
	AI_Output(other,self,"DIA_Parlan_PETZMASTER_PayLater_15_00");	//Nemám dost zlata!
	AI_Output(self,other,"DIA_Parlan_PETZMASTER_PayLater_05_01");	//Na to jsi měl myslet předtím, než ses dopustil těch hříchů.
	AI_Output(self,other,"DIA_Parlan_PETZMASTER_PayLater_05_02");	//Možná ses poučil. Nezpůsobuj další problémy, pak nebudeš muset platit.
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
	AI_Output(self,other,"DIA_Parlan_NoEnter_01_00");	//Stůj! (vztekle) Ještě jsem tě tu neviděl.
	AI_Output(self,other,"DIA_Parlan_NoEnter_01_01");	//Jak se ti sem podařilo dostat?
	Info_ClearChoices(DIA_Parlan_NoEnter);
	Info_AddChoice(DIA_Parlan_NoEnter,"Přelezl jsem přes stěnu.",DIA_Parlan_NoEnter_UpWall);
	Info_AddChoice(DIA_Parlan_NoEnter,"Přišel jsem z hor.",DIA_Parlan_NoEnter_Mount);
	Info_AddChoice(DIA_Parlan_NoEnter,"Novic pedro mě pustil.",DIA_Parlan_NoEnter_Pedro);

	if(RhetorikSkillValue[1] >= 10)
	{
		Info_AddChoice(DIA_Parlan_NoEnter,"A co to je za místo?",DIA_Parlan_NoEnter_NoKill);
	};
};

func void DIA_Parlan_NoEnter_UpWall()
{
	AI_Output(other,self,"DIA_Parlan_NoEnter_UpWall_01_00");	//Přelezl jsem přes stěnu.
	AI_Output(self,other,"DIA_Parlan_NoEnter_UpWall_01_01");	//Hmmm... (rozlobeně) Ano, přelez! A to pro tebe není dobrý.
	AI_Output(self,other,"DIA_Parlan_NoEnter_UpWall_01_02");	//Víš, co je to za místo?!
	AI_Output(other,self,"DIA_Parlan_NoEnter_UpWall_01_03");	//A co?
	AI_Output(self,other,"DIA_Parlan_NoEnter_UpWall_01_04");	//Je to klášter mágů Ohně! (zuřivě) Svaté místo samotného Innose!
	AI_Output(self,other,"DIA_Parlan_NoEnter_UpWall_01_05");	//Pouze mágové a novici zde mohou být.
	AI_Output(self,other,"DIA_Parlan_NoEnter_UpWall_01_06");	//Promiň, ale nedáváš mě na vybranou!
	AI_Output(self,other,"DIA_Parlan_NoEnter_UpWall_01_07");	//Za tuto svatokrádež budeš muset zaplatit svým životem.
	AI_Output(self,other,"DIA_Parlan_PETZMASTER_08_50");		//Hněv Innose tě zničí rychleji, než si to sám uvědomíš...
	Info_ClearChoices(DIA_Parlan_NoEnter);
	Info_AddChoice(DIA_Parlan_NoEnter,"Hej počkej...",DIA_Parlan_NoEnter_Attack);
};

func void DIA_Parlan_NoEnter_Mount()
{
	AI_Output(other,self,"DIA_Parlan_NoEnter_Mount_01_00");	//Přišel jsem z hor.
	AI_Output(self,other,"DIA_Parlan_NoEnter_Mount_01_01");	//Co?! (vztekle) Co to říkáš za nesmysl!
	AI_Output(self,other,"DIA_Parlan_NoEnter_Mount_01_02");	//Víš, co je to za místo?!
	AI_Output(other,self,"DIA_Parlan_NoEnter_Mount_01_03");	//A co?
	AI_Output(self,other,"DIA_Parlan_NoEnter_Mount_01_04");	//Je to klášter mágů Ohně! (zuřivě) Svaté místo samotného Innose!
	AI_Output(self,other,"DIA_Parlan_NoEnter_Mount_01_05");	//Pouze mágové a novici zde mohou být.
	AI_Output(self,other,"DIA_Parlan_NoEnter_Mount_01_06");	//Promiň, ale nedáváš mě na vybranou!
	AI_Output(self,other,"DIA_Parlan_NoEnter_Mount_01_07");	//Za tuto svatokrádež budeš muset zaplatit svým životem.
	AI_Output(self,other,"DIA_Parlan_PETZMASTER_08_50");		//Hněv Innose tě zničí rychleji, než si to sám uvědomíš...
	Info_ClearChoices(DIA_Parlan_NoEnter);
	Info_AddChoice(DIA_Parlan_NoEnter,"Hej počkej...",DIA_Parlan_NoEnter_Attack);
};

func void DIA_Parlan_NoEnter_Pedro()
{
	AI_Output(other,self,"DIA_Parlan_NoEnter_Pedro_01_00");	//Novic Pedro mě pustil.
	AI_Output(self,other,"DIA_Parlan_NoEnter_Pedro_01_01");	//Co?!... (rozhněvaně) Lžeš mě! To on nemohl udělat.
	AI_Output(self,other,"DIA_Parlan_NoEnter_Pedro_01_02");	//Kromě toho jsem tě neviděl projít přes hlavní bránu kláštera.
	AI_Output(other,self,"DIA_Parlan_NoEnter_Pedro_01_03");	//No, a co z toho?
	AI_Output(self,other,"DIA_Parlan_NoEnter_Pedro_01_04");	//Je to klášter mágů Ohně! (zuřivě) Svaté místo samotného Innose!
	AI_Output(self,other,"DIA_Parlan_NoEnter_Pedro_01_05");	//Pouze mágové a novici zde mohou být.
	AI_Output(self,other,"DIA_Parlan_NoEnter_Pedro_01_06");	//Promiň, ale nedáváš mě na vybranou!
	AI_Output(self,other,"DIA_Parlan_NoEnter_Pedro_01_07");	//Za tuto svatokrádež budeš muset zaplatit svým životem.
	AI_Output(self,other,"DIA_Parlan_PETZMASTER_08_50");		//Hněv Innose tě zničí rychleji, než si to sám uvědomíš...
	Info_ClearChoices(DIA_Parlan_NoEnter);
	Info_AddChoice(DIA_Parlan_NoEnter,"Hej počkej...",DIA_Parlan_NoEnter_Attack);
};

func void DIA_Parlan_NoEnter_NoKill()
{
	AI_Output(other,self,"DIA_Parlan_NoEnter_NoKill_01_00");	//A co je to za místo?
	AI_Output(self,other,"DIA_Parlan_NoEnter_NoKill_01_01");	//Co?! (vztekle) Děláš si srandu?!
	AI_Output(other,self,"DIA_Parlan_NoEnter_NoKill_01_02");	//Ale já nemám nejmenší tušení, kam jsem se dostal.
	AI_Output(self,other,"DIA_Parlan_NoEnter_NoKill_01_03");	//Je to klášter mágů Ohně! (zuřivě) Svaté místo samotného Innose!
	AI_Output(self,other,"DIA_Parlan_NoEnter_NoKill_01_04");	//Pouze mágové a novici zde mohou být.
	AI_Output(other,self,"DIA_Parlan_NoEnter_NoKill_01_05");	//Innosův klášter?!
	AI_Output(other,self,"DIA_Parlan_NoEnter_NoKill_01_06");	//Pak si zasloužím pouze smrt, mistře!
	AI_Output(other,self,"DIA_Parlan_NoEnter_NoKill_01_07");	//Zabij mě, protože ani sám jsem nepoznal jak jsem zhřešil, když jsem narušil jeho svatyni.
	AI_Output(self,other,"DIA_Parlan_NoEnter_NoKill_01_08");	//Ty sám přiznáváš svoji vinu a dožaduješ se trestu?!
	AI_Output(self,other,"DIA_Parlan_NoEnter_NoKill_01_09");	//Překvapivé!
	AI_Output(self,other,"DIA_Parlan_NoEnter_NoKill_01_10");	//Dobře, ušetřím tvůj život a dovolím ti zde zůstat.
	AI_Output(self,other,"DIA_Parlan_NoEnter_NoKill_01_11");	//Ale budeš muset pracovat ve prospěch našeho kláštera.
	AI_Output(self,other,"DIA_Parlan_NoEnter_NoKill_01_12");	//A ať tě ani nenapadne zmizet.

	if(RhetorikSkillValue[1] < 100)
	{
		RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
		AI_Print("Rétorika + 1");
	};

	CanEnterKloster = TRUE;
	Info_ClearChoices(DIA_Parlan_NoEnter);
	Info_AddChoice(DIA_Parlan_NoEnter,"Samozřejmě, mistře.",DIA_Parlan_NoEnter_Quest);
};

func void DIA_Parlan_NoEnter_Quest()
{
	AI_Output(other,self,"DIA_Parlan_NoEnter_Quest_01_00");	//Samozřejmě, mistře.
	AI_Output(self,other,"DIA_Parlan_NoEnter_Quest_01_01");	//Nyní, pozorně poslouchej. Tato záležitost je poměrně obtížná.
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_Parlan_NoEnter_Quest_01_02");	//Znáš lichváře Lehmara?


	if(Npc_KnowsInfo(hero,DIA_Lehmar_ENTSCHULDIGUNG) == TRUE)
	{
		AI_Output(other,self,"DIA_Parlan_NoEnter_Quest_01_03");	//Samozřejmě! A o co jde?
	}
	else
	{
		AI_Output(other,self,"DIA_Parlan_NoEnter_Quest_01_04");	//Ne. Já ho neznám.
	};


	AI_Output(self,other,"DIA_Parlan_NoEnter_Quest_01_05");	//Jeden z našich mágů při své naivitě nebo hlouposti, dal k němu do zástavy jednu cennou věc.
	AI_Output(other,self,"DIA_Parlan_NoEnter_Quest_01_06");	//Co to bylo?
	AI_Output(self,other,"DIA_Parlan_NoEnter_Quest_01_07");	//Na tom nezáleží. Důležité je aby byla zase v klášteře. A pokud možno co nejrychleji!
	AI_Output(other,self,"DIA_Parlan_NoEnter_Quest_01_08");	//A v čem je problém?
	AI_Output(self,other,"DIA_Parlan_NoEnter_Quest_01_09");	//Lehmar se rozhodl, že si ji nechá. A odmítá se s námi o tom bavit.
	AI_Output(self,other,"DIA_Parlan_NoEnter_Quest_01_10");	//A jelikož nejsi z kláštera, máš možnost zjistit, kde to skrývá.
	AI_Output(other,self,"DIA_Parlan_NoEnter_Quest_01_11");	//Chceš abych tu věc pro tebe ukradnul?
	AI_Output(self,other,"DIA_Parlan_NoEnter_Quest_01_12");	//Nezajímá mě jak to uděláš, důležité je že bude zpět v klášteře!
	AI_Output(self,other,"DIA_Parlan_NoEnter_Quest_01_13");	//Rozumíš?
	AI_Output(other,self,"DIA_Parlan_NoEnter_Quest_01_14");	//Jak říkáš.
	AI_Output(self,other,"DIA_Parlan_NoEnter_Quest_01_15");	//Pak běž a zařiď to.
	AI_Output(self,other,"DIA_Parlan_NoEnter_Quest_01_16");	//Tady vem si klíč ať nemusíš přelézat zeď.
	B_GiveInvItems(self,other,ItKe_Innos_MIS,1);
	MIS_LemarTheft = LOG_Running;
	Log_CreateTopic(Topic_LemarTheft,LOG_MISSION);
	Log_SetTopicStatus(Topic_LemarTheft,LOG_Running);
	B_LogEntry(Topic_LemarTheft,"Mistr Parlan mě požádal, abych vrátit jednu věc do kláštera. Jeden z mágů ji dal do zástavy lichváři Lehmarovi. A on se rozhodl si ji ponechat. Musím ten problém nějak vyřešit.");
	AI_StopProcessInfos(self);
};

func void DIA_Parlan_NoEnter_Attack()
{
	if(Npc_HasItems(self,ItRu_Pyrokinesis) == 0)
	{
		CreateInvItems(self,ItRu_Pyrokinesis,1);
	};
	AI_Output(self,other,"DIA_Parlan_PETZMASTER_08_59");	//Zemři, taková je vůle Innose!
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

	AI_Output(self,other,"DIA_Parlan_PETZMASTER_08_59");	//Zemři, taková je vůle Innose!
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
	description = "Přinesl jsem ztracenou relikvii.";
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
	AI_Output(other,self,"DIA_Parlan_LemarTheft_01_00");	//Přinesl jsem ztracenou relikvii.
	AI_Output(self,other,"DIA_Parlan_LemarTheft_01_01");	//Opravdu, pak mě ji okamžitě dej!
	AI_Output(other,self,"DIA_Parlan_LemarTheft_01_02");	//Samozřejmě, mistře.
	B_GiveInvItems(other,self,ItMi_ParlanRelic_MIS,1);
	Npc_RemoveInvItems(self,ItMi_ParlanRelic_MIS,1);
	AI_Output(self,other,"DIA_Parlan_LemarTheft_01_03");	//Dobrá. Teď se musím ujistil, že nikdy neopustil zdi kláštera.

	if((hero.guild != GIL_KDF) && (hero.guild != GIL_KDW) && (hero.guild != GIL_NOV) && (hero.guild != GIL_PAL))
	{
		AI_Output(self,other,"DIA_Parlan_LemarTheft_01_04");	//Pokud jde o tebe - přijími mé upřímné poděkování.
		AI_Output(self,other,"DIA_Parlan_LemarTheft_01_05");	//Vidím, že jsem se v tobě nemýlil.
		AI_Output(self,other,"DIA_Parlan_LemarTheft_01_06");	//Nyní tady můžeš zůstat jestli chceš.
		AI_Output(self,other,"DIA_Parlan_LemarTheft_01_07");	//Nezapomeňte však, že přístup do určité části kláštera je pro tebe stále uzavřen.
	}
	else
	{
		AI_Output(self,other,"DIA_Parlan_LemarTheft_01_09");	//Pokud jde o tebe - přijími mé upřímné poděkování.
		AI_Output(self,other,"DIA_Parlan_LemarTheft_01_10");	//Ať ti Innos požehná!
	};

	MIS_LemarTheft = LOG_Success;
	Log_SetTopicStatus(Topic_LemarTheft,LOG_Success);
	B_LogEntry(Topic_LemarTheft,"Parlana potěšilo, že jsem byl schopen získat od Lehmara ztracenou relikvii.");
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
	AI_Output(self,other,"DIA_Parlan_WELCOME_05_09");	//Když to uděláš, promluvíme si o tvé práci zde v kláštere.
};

func void B_DIA_Parlan_WELCOME_BringTribute2Gorax()
{
	AI_Output(self,other,"DIA_Addon_Parlan_WELCOME_05_00");	//Zanes tu sošku přímo Goraxovi! Najde pro ni místo.
};

func void DIA_Parlan_WELCOME_Info()
{
	AI_Output(self,other,"DIA_Parlan_WELCOME_05_00");	//Vítej, nový novici, jsem Parlan.
	AI_Output(other,self,"DIA_Parlan_WELCOME_15_01");	//Já jsem...
	AI_Output(self,other,"DIA_Parlan_WELCOME_05_02");	//(přerušení) ... novic! Není důležité, kdos byl předtím. Teď jsi služebník Innose. Na tom teď záleží.
	AI_Output(self,other,"DIA_Parlan_WELCOME_05_03");	//A s tvým přijetím do bratrstva Ohně jsou ti odpuštěny všechny předešlé hříchy.
	AI_Output(self,other,"DIA_Parlan_WELCOME_05_04");	//Nechť Innos požehná tohoto muže, jež vkládá svůj život do jeho služeb a nechť smyje všechny jeho hříchy.
	AI_Output(other,self,"DIA_Parlan_WELCOME_15_05");	//A co teď?
	AI_Output(self,other,"DIA_Parlan_WELCOME_05_06");	//Zpočátku musíš plnit své povinnosti novice. Budeš pracovat a sloužit bratrstvu.
	B_GrantAbsolution(LOC_ALL);
	Snd_Play("LEVELUP");
	Log_CreateTopic(Topic_Gemeinschaft,LOG_MISSION);
	Log_SetTopicStatus(Topic_Gemeinschaft,LOG_Running);
	B_LogEntry(Topic_Gemeinschaft,"Jako novic jsem povinný pracovat v klášteře.");
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
			AI_Output(self,other,"DIA_Parlan_WELCOME_05_07");	//Ale nejdřív odnes svou ovci Opolosovi. On se o ní postará.
		};
		if(DIA_Gorax_GOLD_perm == FALSE)
		{
			AI_Output(self,other,"DIA_Parlan_WELCOME_05_08");	//Zlato můžeš odevzdat Goraxovi, našemu správcovi. Najdeš ho ve vinici.
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
	description = "Hledám Innosovo oko.";
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
	AI_Output(other,self,"DIA_Parlan_Auge_15_00");	//Hledám Innosovo oko.
	AI_Output(self,other,"DIA_Parlan_Auge_05_01");	//Nevím, kdo ti to řekl, ale tento božský artefakt není zpřístupněn nikomu.
	AI_Output(other,self,"DIA_Parlan_Auge_15_02");	//Kde je Innosovo oko?
	AI_Output(self,other,"DIA_Parlan_Auge_05_03");	//Čím méně lidí o tom ví, tím je Oko víc v bezpečí. Hledej ho a nikdy ho nenajdeš.
};


instance DIA_Parlan_Amulett(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 3;
	condition = DIA_Parlan_Amulett_Condition;
	information = DIA_Parlan_Amulett_Info;
	permanent = FALSE;
	description = "Řekni mi o Innosovu oku.";
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
	AI_Output(other,self,"DIA_Parlan_Amulett_15_00");	//Řekni mi o Innosovu oku.
	AI_Output(self,other,"DIA_Parlan_Amulett_05_01");	//V pořádku. Innosovo oko obsahuje část Innosovy božské moci. Jenom JEDEN vyvolený služebník ho může nosit.
	AI_Output(self,other,"DIA_Parlan_Amulett_05_02");	//Bylo vytvořeno na naší ochranu před Zlem, když nadejde čas.
};


instance DIA_Parlan_Hagen(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 2;
	condition = DIA_Parlan_Hagen_Condition;
	information = DIA_Parlan_Hagen_Info;
	permanent = FALSE;
	description = "Potřebuji mluvit s vůdcem paladinů!";
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
	AI_Output(other,self,"DIA_Parlan_Hagen_15_00");	//Potřebuji mluvit s vůdcem paladinů!
	AI_Output(self,other,"DIA_Parlan_Hagen_05_01");	//Lord Hagen odmítá novice – jenom nám mágům je dovoleno ho vidět.
};

instance DIA_Parlan_WORK(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 2;
	condition = DIA_Parlan_WORK_Condition;
	information = DIA_Parlan_WORK_Info;
	permanent = TRUE;
	description = "Co můžu udělat pro společenství?";
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
	AI_Output(other,self,"DIA_Parlan_WORK_15_00");	//Co můžu udělat pro společenství?
	if((Liesel_Giveaway == FALSE) || (DIA_Gorax_GOLD_perm == FALSE))
	{
		AI_Output(self,other,"DIA_Parlan_WELCOME_05_06");	//Zpočátku musíš plnit své povinnosti novice. Budeš pracovat a sloužit bratrstvu.
		if(Liesel_Giveaway == FALSE)
		{
			AI_Output(self,other,"DIA_Parlan_WELCOME_05_07");	//Ale nejdřív odnes svou ovci Opolosovi. On se o ní postará.
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
				AI_Output(self,other,"DIA_Parlan_WELCOME_05_08");	//Zlato můžeš odevzdat Goraxovi, našemu správcovi. Najdeš ho ve vinici.
				AI_Output(self,other,"DIA_Parlan_WELCOME_05_09");	//Když to uděláš, promluvíme si o tvé práci zde v kláštere.
			};
		};
		AI_StopProcessInfos(self);
	}
	else if(Wld_IsTime(22,0,7,30))
	{
		AI_Output(self,other,"DIA_Parlan_WORK_NIGHT_05_01");	//Je čas odpočinku. Práce noviců začíná ráno a pokračuje až kým nebude tma.
		AI_Output(self,other,"DIA_Parlan_WORK_NIGHT_05_02");	//Měl bys taky jít spát. Vrať se, když bude čas pracovat.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Parlan_WORK_05_03");	//Promluv si s ostatními mágy. Mějí pro tebe úkoly.
		AI_Output(self,other,"DIA_Parlan_WORK_05_04");	//Budu dohlížet na tvou práci a pokud budeš přiměřeně plnit své povinnosti, obdržíš dovolení studovat v knihovně slovo Innosovo.
		DIA_Parlan_WORK_perm = TRUE;
		MIS_KlosterArbeit = LOG_Running;
		B_LogEntry(Topic_Gemeinschaft,"Pokud budu plnit Parlanovy úkoly, dovolí mi studovat rukopisy v knihovně.");
		AI_Output(self,other,"DIA_Parlan_WORK_01_01");	//Jo, a málem bych zapomněl... (reptání) Potřebuješ roucho novice...
		AI_Output(other,self,"DIA_Parlan_WORK_01_02");	//A co s ním... je to nějaký problém.?
		AI_Output(self,other,"DIA_Parlan_WORK_01_03");	//Problém je v tom, že nemáme látku ze které se šili roucha noviců.
		AI_Output(self,other,"DIA_Parlan_WORK_01_04");	//Dlouhá léta jsme ji kupovali od cechu obchodníků z Khorinisu.
		AI_Output(self,other,"DIA_Parlan_WORK_01_05");	//Ale kvůli válce se skřety váznou dodávky z pevniny, a naše zásoby se dostali na nulu.
		AI_Output(other,self,"DIA_Parlan_WORK_01_06");	//A co mám teď dělat?
		AI_Output(self,other,"DIA_Parlan_WORK_01_07");	//Dobrá otázka. No, co! Najdi prodejce Erola a zeptej se ho, jestli mu ještě nějaká látka nezbyla.
		AI_Output(other,self,"DIA_Parlan_WORK_01_08");	//A proč zrovna jeho?
		AI_Output(self,other,"DIA_Parlan_WORK_01_09");	//Erol býval v cechu obchodníků. Byl jedním z největších obchodníků s látkami kolem Khorinisu.
		AI_Output(self,other,"DIA_Parlan_WORK_01_10");	//Už jsme skoušeli i jiné obchodníky, ale všechno marný.
		AI_Output(self,other,"DIA_Parlan_WORK_01_11");	//Takže si s ním promluv.
		Log_CreateTopic(TOPIC_ROBAMATERIAL,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ROBAMATERIAL,LOG_Running);
		MIS_ROBAMATERIAL = LOG_Running;
		B_LogEntry(TOPIC_ROBAMATERIAL,"Mistr Parlan mi nedal roucho novice, protože nemá potřebný materiál pro šití. Měl bych se poptat po vhodné látce u obchodníka Erola.");
	};
};

instance DIA_PARLAN_ROBAMATERIAL(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 1;
	condition = DIA_PARLAN_ROBAMATERIAL_condition;
	information = DIA_PARLAN_ROBAMATERIAL_info;
	permanent = TRUE;
	description = "Přinesl jsem látku na roucho.";
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
	AI_Output(other,self,"DIA_PARLAN_ROBAMATERIAL_01_01");	//Přinesl jsem látku na roucho.
	AI_Output(self,other,"DIA_PARLAN_ROBAMATERIAL_01_02");	//Ukaž ji.
	B_GiveInvItems(other,self,itmi_novmaterial,1);
	AI_Output(self,other,"DIA_PARLAN_ROBAMATERIAL_01_03");	//Ano, to je ona. Zdá se, že tohle množství nám bude stačit na několik let.
	AI_Output(self,other,"DIA_PARLAN_ROBAMATERIAL_01_04");	//Mimochodem, mistr Gorax přehrabal skříň a našel tam roucho novice.
	AI_Output(self,other,"DIA_PARLAN_ROBAMATERIAL_01_05");	//Samozřejmě není nová, ale zatím ti bude stačit. Než bratři ušijí nové.
	B_GiveInvItems(self,other,ItAr_NOV_L,1);
	MIS_ROBAMATERIAL = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_ROBAMATERIAL,LOG_SUCCESS);
	B_LogEntry(TOPIC_ROBAMATERIAL,"Přinesl jsem Parlanovi látku na roucho. A on mě zatím dal staré, které náhodně našel ve skříni.");
};

instance DIA_Parlan_Stand(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 23;
	condition = DIA_Parlan_Stand_Condition;
	information = DIA_Parlan_Stand_Info;
	permanent = TRUE;
	description = "Smím vstoupit do knihovny?";
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
	AI_Output(other,self,"DIA_Parlan_Stand_15_00");	//Smím vstoupit do knihovny?

	if(MIS_NeorasPflanzen == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_01");	//Opatřil jsi ohnivé kopřivy pro Bratra Neorase.
		Kloster_Punkte = Kloster_Punkte + 2;
	};
	if(MIS_NeorasRezept == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_02");	//Našel jsi recept Bratra Neorase.
		Kloster_Punkte = Kloster_Punkte + 2;
	};
	if(MIS_IsgarothWolf == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_03");	//Zahnal jsi černého vlka, který ohrožoval svatyni.
		Kloster_Punkte = Kloster_Punkte + 1;
	};
	if(MIS_ParlanFegen == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_04");	//Našel jsi čtyři novice a vyčistil komnaty.
		Kloster_Punkte = Kloster_Punkte + 3;
	};
	if(MIS_GoraxEssen == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_05");	//Rozdělil jsi jídlo férově, jak ti Bratr Gorax kázal.
		Kloster_Punkte = Kloster_Punkte + 1;
	}
	else if(MIS_GoraxEssen == LOG_FAILED)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_06");	//Gorax nebyl spokojen, protože si jídlo nerozdělil férově.
	};
	if(MIS_GoraxWein == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_07");	//Prodal jsi víno ke Goraxovy spokojenosti.
		Kloster_Punkte = Kloster_Punkte + 1;
	}
	else if(MIS_GoraxWein == LOG_FAILED)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_08");	//Raději pomlčíme o tom vínu...
	};
	if((Kloster_Punkte >= 8) && (MIS_ROBAMATERIAL == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_09");	//Ano, pracoval jsi dostatečně. Teď je čas, abys začal studovat Innosovo učení. V knihovně si promluv s mistrem Hyglasem.
		AI_Output(self,other,"DIA_Parlan_Stand_05_10");	//Odevzdávám ti tak klíč.
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
		AI_Output(self,other,"DIA_Parlan_Stand_05_11");	//Jistě si pracoval, ale je tvou povinností pokračovat v službě společnosti.
	}
	else if((MIS_ROBAMATERIAL != LOG_SUCCESS) && (Kloster_Punkte >= 8))
	{
		AI_Output(self,other,"DIA_Parlan_WORK_99_13");	//Ano udělal si dobrou práci. Nyní je čas pochopit učení Innose. Ale nejdřív musíš dostat roucho novice tak káže zákon Innose.
	}
	else
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_12");	//Na začátek plň své povinnosti. Když je dokončíš, opět si o tom promluvíme.
	};
};


instance DIA_Parlan_Aufgabe(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 10;
	condition = DIA_Parlan_Aufgabe_Condition;
	information = DIA_Parlan_Aufgabe_Info;
	permanent = FALSE;
	description = "Máš pro mne nějaký úkol?";
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
	AI_Output(other,self,"DIA_Parlan_Aufgabe_15_00");	//Máš pro mne nějaký úkol?
	AI_Output(self,other,"DIA_Parlan_Aufgabe_05_01");	//Hmm... Ano, jistě bys mohl něco udělat.
	AI_Output(self,other,"DIA_Parlan_Aufgabe_05_02");	//Mohl bys zamést komnaty noviců.
	AI_Output(other,self,"DIA_Parlan_Aufgabe_15_03");	//To bude trvat věčnost...
	AI_Output(self,other,"DIA_Parlan_Aufgabe_05_04");	//Měl bys tedy začít hned teď, ne?
	AI_Output(self,other,"DIA_Parlan_Aufgabe_05_05");	//A mimochodem, místnost vedle oltáře by potřebovala pořádně vyčistit.
	MIS_ParlanFegen = LOG_Running;
	Log_CreateTopic(Topic_ParlanFegen,LOG_MISSION);
	Log_SetTopicStatus(Topic_ParlanFegen,LOG_Running);
	B_LogEntry(Topic_ParlanFegen,"Mistr Parlan mi udělil úlohy zamést komnaty noviců. Samému mi to bude trvat věčnost.");
};


instance DIA_Parlan_Fegen(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 3;
	condition = DIA_Parlan_Fegen_Condition;
	information = DIA_Parlan_Fegen_Info;
	permanent = TRUE;
	description = "Ohledem komnat noviců...";
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
	AI_Output(other,self,"DIA_Parlan_Fegen_15_00");	//Ohledem komnat noviců...
	if(NOV_Helfer >= 5)
	{
		AI_Output(self,other,"DIA_Parlan_Fegen_05_01");	//Zvládl jsi sehnat čtyři novice, aby ti pomohli. Myslím, že teď se můžou vrátit ke své práci.
		AI_Output(self,other,"DIA_Parlan_Fegen_05_02");	//Výborně, novici. Splnil jsi úlohu, kterou jsem ti zadal.
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
		AI_Output(self,other,"DIA_Parlan_Fegen_05_03");	//Bezpochyby to není jednoduchý úkol. S pomocí Innose to ale zvládneš.
	};
};


instance DIA_Parlan_LEARN(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 23;
	condition = DIA_Parlan_LEARN_Condition;
	information = DIA_Parlan_LEARN_Info;
	permanent = FALSE;
	description = "Jak se můžu přiučit umění magie?";
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
	AI_Output(other,self,"DIA_Parlan_LEARN_15_00");	//Jak se můžu přiučit umění magie?
	AI_Output(self,other,"DIA_Parlan_LEARN_05_01");	//Nejsi tu, abys obdržel dar magie – jsi tu, abys sloužil Innosovi.
	AI_Output(self,other,"DIA_Parlan_LEARN_05_02");	//Ale mohu ti ukázat, jak zvýšit svou magickou energii.
	B_LogEntry(Topic_KlosterTeacher,"Mistr Parlan mi může pomoci zvýšit mou magickou energii.");
};


instance DIA_Parlan_KNOWSJUDGE(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 23;
	condition = DIA_Parlan_KNOWSJUDGE_Condition;
	information = DIA_Parlan_KNOWSJUDGE_Info;
	permanent = FALSE;
	description = "Chci podstoupit Zkoušku Ohně.";
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
	AI_Output(other,self,"DIA_Parlan_KNOWSJUDGE_15_00");	//Chci podstoupit Zkoušku Ohně.
	AI_Output(self,other,"DIA_Parlan_KNOWSJUDGE_05_01");	//Co...? Hm... (důrazně) Trváš na tom?
	AI_Output(other,self,"DIA_Parlan_KNOWSJUDGE_15_02");	//Trvám na to.
	AI_Output(self,other,"DIA_Parlan_KNOWSJUDGE_05_03");	//Jsi vážně neobyčejný novic. V pořádku, pokud to myslíš vážně, promluv si s mistrem Pyrokarem.
	B_LogEntry(TOPIC_FireContest,"Pokud si přeji podstoupit Zkoušku Ohně, měl bych si promluvit s mistrem Pyrokarem.");
};

instance DIA_Parlan_TEACH_MANA(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 10;
	condition = DIA_Parlan_TEACH_MANA_Condition;
	information = DIA_Parlan_TEACH_MANA_Info;
	permanent = TRUE;
	description = "Chtěl bych zvýšit svou magickou energii.";
};

func int DIA_Parlan_TEACH_MANA_Condition()
{
	if((other.guild == GIL_KDF) || (other.guild == GIL_PAL) || (other.guild == GIL_NOV))
	{
		if(((Npc_KnowsInfo(hero,DIA_Parlan_LEARN) == TRUE) || (other.guild == GIL_KDF)) && ((Parlan_Sends == FALSE) || (VATRAS_TEACHREGENMANA == FALSE)))
		{
			return TRUE;
		};
	};
};

func void DIA_Parlan_TEACH_MANA_Info()
{
	AI_Output(other,self,"DIA_Parlan_TEACH_MANA_15_00");	//Chtěl bych zvýšit svou magickou energii.
	Info_ClearChoices(DIA_Parlan_TEACH_MANA);
	Info_AddChoice(DIA_Parlan_TEACH_MANA,Dialog_Back,DIA_Parlan_TEACH_MANA_BACK);
	Info_AddChoice(DIA_Parlan_TEACH_MANA,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_Parlan_TEACH_MANA_1);
	Info_AddChoice(DIA_Parlan_TEACH_MANA,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_Parlan_TEACH_MANA_5);

	if((Kapitel >= 2) && (other.guild == GIL_KDF) && (VATRAS_TEACHREGENMANA == FALSE))
	{
		Info_AddChoice(DIA_Parlan_TEACH_MANA,"Regenerace many (VB: 10, cena: 10000 zlatých)",DIA_Parlan_TEACH_MANA_Regen);
	};
};

func void DIA_Parlan_TEACH_MANA_BACK()
{
	if(other.attribute[ATR_MANA_MAX] >= T_MED)
	{
		AI_Output(self,other,"DIA_Parlan_TEACH_MANA_05_00");	//Tvá magická energie narostla. Už ti ji nemohu pomoci zvýšit víc.
		AI_Output(self,other,"DIA_Parlan_TEACH_MANA_05_01");	//Pokud se chceš naučit víc, promluv si s Pyrokarem.
		Parlan_Sends = TRUE;
	};

	Info_ClearChoices(DIA_Parlan_TEACH_MANA);
};

func void DIA_Parlan_TEACH_MANA_Regen()
{
	var int kosten;
	var int money;

	AI_Output(other,self,"DIA_Vatras_Teach_regen_15_05");	//Nauč mě jak regenerovat manu.

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
		AI_Print("Naučeno: Regenerace many");
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
		Info_AddChoice(DIA_Parlan_TEACH_MANA,"Regenerace many (VB: 10, cena: 10000 zlatých)",DIA_Parlan_TEACH_MANA_Regen);
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
		Info_AddChoice(DIA_Parlan_TEACH_MANA,"Regenerace many (VB: 10, cena: 10000 zlatých)",DIA_Parlan_TEACH_MANA_Regen);
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
	AI_Output(self,other,"DIA_Parlan_MAGE_05_00");	//Řekl jsi svou přísahu, Bratře. Vítej v naších řadách.
	AI_Output(self,other,"DIA_Parlan_MAGE_05_01");	//Já tě budu učit kruhy magie, pokud budeš mít dost zkušeností.
	AI_Output(self,other,"DIA_Parlan_MAGE_05_02");	//Seber si tuhle runu na znamení toho, že moc teď leží ve tvých rukách.
	B_GiveInvItems(self,other,ItMi_RuneBlank,1);
	AI_Output(self,other,"DIA_Parlan_MAGE_05_03");	//Můj bratře, na klášteře je potřeba vyměnit střech, a proto tě žádám abys pochopil, že učení pro tebe nebude tak úplně bezplatné...
};


instance DIA_Parlan_CIRCLE1(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 99;
	condition = DIA_Parlan_CIRCLE1_Condition;
	information = DIA_Parlan_CIRCLE1_Info;
	permanent = TRUE;
	description = "Nauč mě první kruh magie. (VB: 20)";
};


func int DIA_Parlan_CIRCLE1_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Parlan_MAGE) && (other.guild == GIL_KDF) && (Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 0) && (CanLearnMagicCircleNext_ABCZ(1) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Parlan_CIRCLE1_Info()
{
	AI_Output(other,self,"DIA_Parlan_TECH_CIRCLE1_15_00");	//Nauč mě první kruh magie.

	if(B_TeachMagicCircle(self,other,1))
	{
		AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE1_05_01");	//První kruh magie ti umožňuje použít runy, které sis vyrobil.
		AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE1_05_02");	//Teď se můžeš učit různé magické formulky, aby sis mohl vytvořit vlastní runy.
	};
};


instance DIA_Parlan_CIRCLE2(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 99;
	condition = DIA_Parlan_CIRCLE2_Condition;
	information = DIA_Parlan_CIRCLE2_Info;
	permanent = TRUE;
	description = "Nauč mě druhý kruh magie. (VB: 30)";
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
	AI_Output(other,self,"DIA_Parlan_TECH_CIRCLE2_15_00");	//Nauč mě druhý kruh magie.

	if(CanLearnMagicCircleNext_ABCZ(2) == TRUE)
	{
		if(B_TeachMagicCircle(self,other,2))
		{
			AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE2_05_01");	//Teď vstupuješ do druhého kruhu magie a učíš se pracovat s mocnější magií.
			AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE2_05_02");	//Avšak taktéž si pamatuj, že neseš odpovědnost. Ne ke mně nebo Pyrokarovi, ale k Innosovi.
			AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE2_05_03");	//On ti ukáže směr, ale cesta závisí od tebe.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE2_05_04");	//Ještě ne.
	};
};


instance DIA_Parlan_CIRCLE3(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 99;
	condition = DIA_Parlan_CIRCLE3_Condition;
	information = DIA_Parlan_CIRCLE3_Info;
	permanent = TRUE;
	description = "Nauč mě třetí kruh magie. (VB: 40)";
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
	AI_Output(other,self,"DIA_Parlan_TECH_CIRCLE3_15_00");	//Nauč mě třetí kruh magie.
	if(CanLearnMagicCircleNext_ABCZ(3) == TRUE)
	{
		if(B_TeachMagicCircle(self,other,3))
		{
			AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE3_05_01");	//Ano, čas nadešel. Teď vstup do třetího kruhu magie. Čekají tě nová kouzla.
			AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE3_05_02");	//Budeš je potřebovat, protože Zlo je blízko a může být poraženo jenom sílou Innose.
			AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE3_05_03");	//Naučil jsem tě všechny kruhy, které můžu. Výš tě bude trénovat Karras.
			B_LogEntry(Topic_KlosterTeacher,"Bratr Parlan mě naučil první tři kruhy magie. Dál mě bude trénovat Bratr Karras.");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE3_05_04");	//Ještě není čas, aby ses naučil třetí kruh magie.
	};
};


instance DIA_Parlan_TEACH(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 3;
	condition = DIA_Parlan_TEACH_Condition;
	information = DIA_Parlan_TEACH_Info;
	permanent = TRUE;
	description = "Nauč mě vytvářet runy.";
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
	AI_Output(other,self,"DIA_Parlan_TEACH_15_00");	//Nauč mě!
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
		AI_Output(self,other,"DIA_Parlan_TEACH_05_01");	//Momentálně tě nemůžu naučit víc kouzel.
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
	AI_Output(self,other,"DIA_Parlan_EXIT_05_00");	//Nechť tě Innos chrání.
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
		AI_Output(self,other,"DIA_Parlan_IAmParlan_05_00");	//Vidím, že ses rozhodl bojovat za naší stranu. Jsem rád.
		AI_Output(self,other,"DIA_Parlan_IAmParlan_05_01");	//Každý muž je užitečný. Měl bys jít přímo za Mardukem, on je odpovědný za vás paladiny.
	}
	else
	{
		AI_Output(self,other,"DIA_Parlan_IAmParlan_05_02");	//Netuším, proč ti je dovoleno vstoupit do kláštera, ale jsem Parlan a jsem odpovědný za naše novice.
		AI_Output(self,other,"DIA_Parlan_IAmParlan_05_03");	//Nechci, abys je zdržoval od práce svými stupidními otázkami. Je to jasné?
		Parlan_DontTalkToNovice = LOG_Running;
		Info_ClearChoices(DIA_Parlan_IAmParlan);
		Info_AddChoice(DIA_Parlan_IAmParlan,"Budu dělat, co se mi zlíbí.",DIA_Parlan_IAmParlan_MyChoice);
		Info_AddChoice(DIA_Parlan_IAmParlan,"Chápu.",DIA_Parlan_IAmParlan_OK);
	};
};

func void DIA_Parlan_IAmParlan_MyChoice()
{
	AI_Output(other,self,"DIA_Parlan_IAmParlan_MyChoice_15_00");	//Budu dělat, co se mi zlíbí
	AI_Output(self,other,"DIA_Parlan_IAmParlan_MyChoice_05_01");	//Musí být nějaký důvod, proč tě tady tolerujeme, ale všechno má své hranice.
	AI_Output(self,other,"DIA_Parlan_IAmParlan_MyChoice_05_02");	//Pokud způsobíš problémy, zaplatíš za to. Drž se tedy dál od noviců.
	Info_ClearChoices(DIA_Parlan_IAmParlan);
};

func void DIA_Parlan_IAmParlan_OK()
{
	AI_Output(other,self,"DIA_Parlan_IAmParlan_OK_15_00");	//Chápu.
	AI_Output(self,other,"DIA_Parlan_IAmParlan_OK_05_01");	//V to doufám.
	Info_ClearChoices(DIA_Parlan_IAmParlan);
};


instance DIA_Parlan_Bibliothek(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 40;
	condition = DIA_Parlan_Bibliothek_Condition;
	information = DIA_Parlan_Bibliothek_Info;
	permanent = FALSE;
	description = "Ještě něco?";
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
	AI_Output(other,self,"DIA_Parlan_Bibliothek_15_00");	//Ještě něco?
	AI_Output(self,other,"DIA_Parlan_Bibliothek_05_01");	//Ano. Jako členovi ti dávám klíč od knihovny. Najdeš tam bratry Karrase a Hyglase.
	AI_Output(self,other,"DIA_Parlan_Bibliothek_05_02");	//Můžeš si tam s nimi promluvit.

	if(other.guild != GIL_PAL)
	{
		AI_Output(self,other,"DIA_Parlan_DontDisturb_05_03");	//Ale nech mé novice na pokoji!
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
	AI_Output(self,other,"DIA_Parlan_DontDisturb_05_00");	//(výhružně) Ještě jednou – nech mé novice na pokoji!
	AI_Output(self,other,"DIA_Parlan_DontDisturb_05_01");	//Mají pozdvihnout svého ducha fyzickou prací a připravit se na život v kláštere.
	AI_Output(self,other,"DIA_Parlan_DontDisturb_05_02");	//Nebudu tolerovat zásahy do jejich práce!
	Parlan_DontTalkToNovice = LOG_Running;
};

instance DIA_Parlan_Kap3U4U5_PERM(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 39;
	condition = DIA_Parlan_Kap3U4U5_PERM_Condition;
	information = DIA_Parlan_Kap3U4U5_PERM_Info;
	permanent = TRUE;
	description = "Kde najdu...";
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
	AI_Output(other,self,"DIA_Parlan_Kap3_PERM_15_00");	//Kde najdu...
	Info_ClearChoices(DIA_Parlan_Kap3U4U5_PERM);
	Info_AddChoice(DIA_Parlan_Kap3U4U5_PERM,Dialog_Back,DIA_Parlan_Kap3U4U5_PERM_Back);
	Info_AddChoice(DIA_Parlan_Kap3U4U5_PERM,"... chrám?",DIA_Parlan_Kap3U4U5_PERM_Church);
	Info_AddChoice(DIA_Parlan_Kap3U4U5_PERM,"... knihovnu?",DIA_Parlan_Kap3U4U5_PERM_Library);
	Info_AddChoice(DIA_Parlan_Kap3U4U5_PERM,"... kapli?",DIA_Parlan_Kap3U4U5_PERM_Chapel);
	Info_AddChoice(DIA_Parlan_Kap3U4U5_PERM,"... sklep?",DIA_Parlan_Kap3U4U5_PERM_Cellar);
};


instance DIA_PARLAN_SOULRIVER(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 39;
	condition = dia_parlan_soulriver_condition;
	information = dia_parlan_soulriver_info;
	permanent = TRUE;
	description = "Zajímá mě jedna kniha.";
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
	AI_Output(other,self,"DIA_Parlan_SoulRiver_00");	//Slyšel jsem, že v kláštere je možné najít knihu, která se zaobírá očištěním posedlých duší.
	AI_Output(other,self,"DIA_Parlan_SoulRiver_01");	//Nevíš, kde bych jí mohl najít?

	if((other.guild == GIL_KDF) || (other.guild == GIL_NOV))
	{
		AI_Output(self,other,"DIA_Parlan_SoulRiver_02");	//Ano... Pamatuji se, že tady je. Ano, přesně – jmenovala se Duševní očista.
		AI_Output(self,other,"DIA_Parlan_SoulRiver_03");	//Je uložena v podzemní knižnici. Ale Talamon tě tam nepustí!
		AI_Output(self,other,"DIA_Parlan_SoulRiver_04");	//Můžou tam vstoupit jenom členové nejvyššího Kruhu Ohně. A ty ním nejsi.
		AI_Output(other,self,"DIA_Parlan_SoulRiver_05");	//A mohl by mi to dovolit někdo z ostatních mágů?
		AI_Output(self,other,"DIA_Parlan_SoulRiver_06");	//Ani se o to nepokoušej. Měli bychom skončit tuto diskuzi...
	}
	else
	{
		AI_Output(self,other,"DIA_Parlan_SoulRiver_07");	//Nejsi mágem Ohně a dokonce ani novicem!
		AI_Output(self,other,"DIA_Parlan_SoulRiver_08");	//A máš dost drzosti zeptat se mě na to...
		AI_Output(self,other,"DIA_Parlan_SoulRiver_09");	//Není to tvoje věc. Je to jasné?
	};
	PARLAN_SOULRIVER = TRUE;
};

func void DIA_Parlan_Kap3U4U5_PERM_Back()
{
	Info_ClearChoices(DIA_Parlan_Kap3U4U5_PERM);
};

func void DIA_Parlan_Kap3U4U5_PERM_Church()
{
	AI_Output(other,self,"DIA_Parlan_Kap3U4U5_PERM_Church_15_00");	//... chrám?
	AI_Output(self,other,"DIA_Parlan_Add_05_00");	//Proboha! Copak tě Innos oslepil?
	AI_Output(self,other,"DIA_Parlan_Add_05_01");	//(cynicky) Kdepak jen je chrám? Ó, bože, kde by mohl být?
};

func void DIA_Parlan_Kap3U4U5_PERM_Library()
{
	AI_Output(other,self,"DIA_Parlan_Kap3U4U5_PERM_Library_15_00");	//... knihovna?
	AI_Output(self,other,"DIA_Parlan_Add_05_02");	//Knihovna je na konci kolonády celkem nalevo, přímo naproti chrámu.
};

func void DIA_Parlan_Kap3U4U5_PERM_Chapel()
{
	AI_Output(other,self,"DIA_Parlan_Kap3U4U5_PERM_Chapel_15_00");	//... kaple?
	AI_Output(self,other,"DIA_Parlan_Add_05_03");	//Kaple je místnost v středě levé kolonády. Paladinové se tam modlí k Innosovi.
};

func void DIA_Parlan_Kap3U4U5_PERM_Cellar()
{
	AI_Output(other,self,"DIA_Parlan_Kap3U4U5_PERM_Cellar_15_00");	//... sklep?
	AI_Output(self,other,"DIA_Parlan_Add_05_04");	//Vstup do sklepa leží v středě kolonády napravo.
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
	description = "(Pokusit se ukrást klíč.)";
};


func int dia_parlan_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) >= 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && ((MIS_XARDASNDMTASKSONE == LOG_Running) || ((other.guild != GIL_KDF) && (Kapitel == 2))))
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
	description = "Tvé magické runy - stále fungují?";
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
	AI_Output(other,self,"DIA_Parlan_RuneMagicNotWork_01_00");	//Tvé magické runy - stále fungují?
	AI_Output(self,other,"DIA_Parlan_RuneMagicNotWork_01_01");	//Ne!
	AI_Output(other,self,"DIA_Parlan_RuneMagicNotWork_01_02");	//A co ostatní?!
	AI_Output(self,other,"DIA_Parlan_RuneMagicNotWork_01_03");	//Pravděpodobně to postihlo všechny!
	AI_Output(other,self,"DIA_Parlan_RuneMagicNotWork_01_04");	//Očividně.
	B_LogEntry(TOPIC_RUNEMAGICNOTWORK,"Runové kameny ostatních mágů Ohně také ztratili svou moc.");
	FIREMAGERUNESNOT = TRUE;
};

instance DIA_PARLAN_TREVIUS(C_Info)
{
	npc = KDF_504_Parlan;
	nr = 1;
	condition = dia_parlan_trevius_condition;
	information = dia_parlan_trevius_info;
	permanent = FALSE;
	description = "Hledám staré rukopisy Xardase.";
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
	AI_Output(other,self,"DIA_Parlan_TREVIUS_01_00");	//Hledám staré rukopisy Xardase.
	AI_Output(other,self,"DIA_Parlan_TREVIUS_01_01");	//Co o nich víš?
	AI_Output(self,other,"DIA_Parlan_TREVIUS_01_02");	//Nevím, co máš společného s tím zrádcem.
	AI_Output(self,other,"DIA_Parlan_TREVIUS_01_03");	//Ale jedno vím - neřeknu ti nic.
	COUNT_TREVIUS_DIALOG = TRUE;
	B_LogEntry(TOPIC_XARDASNDMTASKSONE,"Parlan mi neřekne nic o rukopisu, musím se zeptat někoho jiného. Zatracený mágové Ohně jsou tak omezený, nedivím se že od nich Xardas utekl...");
	AI_StopProcessInfos(self);
};