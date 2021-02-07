/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.01:

(19x) MIS_ORcGREATWAR - MIS_ORCGREATWAR (cyrilice -> latinka)

*/



instance DIA_Andre_EXIT(C_Info)
{
	npc = MIL_311_Andre;
	nr = 999;
	condition = DIA_Andre_EXIT_Condition;
	information = DIA_Andre_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Andre_EXIT_Condition()
{
	if(self.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Andre_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Andre_FIRSTEXIT(C_Info)
{
	npc = MIL_311_Andre;
	nr = 999;
	condition = DIA_Andre_FIRSTEXIT_Condition;
	information = DIA_Andre_FIRSTEXIT_Info;
	permanent = FALSE;
	description = Dialog_Ende;
};


func int DIA_Andre_FIRSTEXIT_Condition()
{
	if(self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Andre_FIRSTEXIT_Info()
{
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
	B_StartOtherRoutine(Wulfgar,"START");
};


var int Andre_Steckbrief;

func void B_Andre_Steckbrief()
{
	AI_Output(self,other,"DIA_Andre_Add_08_00");	//Jeden z mých mužů mi řekl, že banditi roznášejí plakáty s vypsanou odměnou a že je na nich tvoje tvář.
	AI_Output(self,other,"DIA_Andre_Add_08_01");	//Také mi řekl, žes to nejdřív popřel.
	AI_Output(self,other,"DIA_Andre_Add_08_02");	//Takže o co tady jde?
	if(DEXTERSAYABOUTKILL == TRUE)
	{
		AI_Output(other,self,"DIA_Andre_Add_15_04");	//Ti chlapi mě chtějí zabít.
		AI_Output(self,other,"DIA_Andre_Add_08_13");	//Většina z těch banditů jsou bývalí vězni z trestanecké kolonie.
		AI_Output(self,other,"DIA_Andre_Add_08_14");	//Tak odkud tě znají?
		AI_Output(other,self,"DIA_Andre_Add_15_05");	//Vatras, mág Vody, to může vysvětlit.
		AI_Output(self,other,"DIA_Andre_Add_08_15");	//Pokud ano, vše je v pořádku.
	}
	else
	{
		AI_Output(other,self,"DIA_Andre_Add_15_03");	//Nevím, proč mě ti lidé hledají...
		AI_Output(self,other,"DIA_Andre_Add_08_04");	//Pro tvoje vlastní dobro doufám, že říkáš pravdu.

		if(other.guild == GIL_MIL)
		{
			AI_Output(self,other,"DIA_Andre_Add_08_05");	//Nechci v domobraně nikoho, kdo nemá čistý rejstřík.
		}
		else
		{
			AI_Output(self,other,"DIA_Andre_Add_08_12");	//Nemůžu zrovna důvěřovat měšťanem, kteří nemají čistý rejstřík.
		};

		AI_Output(self,other,"DIA_Andre_Add_08_06");	//Většina z těch banditů jsou bývalí vězni z trestanecké kolonie.
	};
	AI_Output(self,other,"DIA_Andre_Add_08_07");	//Doufám, že ses s těmi hrdlořezy nijak nezapletl.
	Andre_Steckbrief = TRUE;
};


var int Andre_CantharFalle;

func void B_Andre_CantharFalle()
{
	AI_Output(self,other,"B_Andre_CantharFalle_08_00");	//Byl tady kupec Canthar. Povídal, že jsi uprchlý vězeň z trestanecké kolonie.
	AI_Output(self,other,"B_Andre_CantharFalle_08_01");	//Nevím, jestli to je pravda, a radši bych se tě neptal, ale měl bys to nějak objasnit.
	if(SARAKNOWSABOUTCANTHAR == TRUE)
	{
		B_StartOtherRoutine(Sarah,"InTavern");
		AI_Teleport(Sarah,"NW_TAVERNE_IN_10");
		SARAFLEE = TRUE;
	}
	else
	{
		b_clearjunktradeinvsarah(VLK_470_Sarah);
		B_StartOtherRoutine(Sarah,"Killed");
		AI_Teleport(Sarah,"NW_SARA_KILLED");
		b_killnpc_now(VLK_470_Sarah);
		SARAISDEAD = TRUE;
	};
	B_StartOtherRoutine(Canthar,"MARKTSTAND");
	AI_Teleport(Canthar,"NW_CITY_SARAH");
	if((Canthar_Sperre == FALSE) && (Canthar_Pay == FALSE))
	{
		Canthar_Sperre = TRUE;
	};
	MIS_Canthars_KomproBrief = LOG_OBSOLETE;
	Andre_CantharFalle = TRUE;
};


instance DIA_Andre_CantharFalle(C_Info)
{
	npc = MIL_311_Andre;
	nr = 3;
	condition = DIA_Andre_CantharFalle_Condition;
	information = DIA_Andre_CantharFalle_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Andre_CantharFalle_Condition()
{
	if((MIS_Canthars_KomproBrief == LOG_Running) && (MIS_Canthars_KomproBrief_Day <= (Wld_GetDay() - 2)) && (Andre_CantharFalle == FALSE) && (MIS_ORCGREATWAR == FALSE))
	{
		return TRUE;
	};
	if((Pablo_AndreMelden == TRUE) && !Npc_IsDead(Pablo) && (Andre_Steckbrief == FALSE) && (MIS_ORCGREATWAR == FALSE))
	{
		return TRUE;
	};
};

func int DIA_Andre_CantharFalle_Info()
{
	if(Andre_Steckbrief == FALSE)
	{
		B_Andre_Steckbrief();
		return TRUE;
	};
	if((Andre_CantharFalle == FALSE) && (MIS_Canthars_KomproBrief_Day <= (Wld_GetDay() - 2)))
	{
		B_Andre_CantharFalle();
		return TRUE;
	};
	return FALSE;
};


var int Andre_LastPetzCounter;
var int Andre_LastPetzCrime;

instance DIA_Andre_PMSchulden(C_Info)
{
	npc = MIL_311_Andre;
	nr = 1;
	condition = DIA_Andre_PMSchulden_Condition;
	information = DIA_Andre_PMSchulden_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Andre_PMSchulden_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Andre_Schulden > 0) && (B_GetGreatestPetzCrime(self) <= Andre_LastPetzCrime) && (MIS_ORCGREATWAR == FALSE))
	{
		return TRUE;
	};
};

func void dia_andre_petzmaster_attackmurder()
{
	var string concatText;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_HumanMurderedHuman,0);
	GLOBAL_MAKE_BANDIT_FORCITY = 1;
	concatText = "Představitelé města tě označili za psance!";
	AI_Print(concatText);
};

func void dia_andre_pmschulden_attackmurder()
{
	var string concatText;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_HumanMurderedHuman,0);
	GLOBAL_MAKE_BANDIT_FORCITY = 1;
	concatText = "Khorinis tě označil za psance!";
	AI_Print(concatText);
};

func void DIA_Andre_PMSchulden_Info()
{
	var int diff;
	var string concatText1;
	var string concatText2;
	var string concattextschulden;
	var string tsettext1;
	var string tsettext2;
	var string tsettext3;
	var int temp1;
	AI_Output(self,other,"DIA_Andre_PMSchulden_08_00");	//Přišel jsi zaplatit svou pokutu?
	if((Pablo_AndreMelden == TRUE) && !Npc_IsDead(Pablo) && (Andre_Steckbrief == FALSE))
	{
		B_Andre_Steckbrief();
	};
	if((MIS_Canthars_KomproBrief == LOG_Running) && (MIS_Canthars_KomproBrief_Day <= (Wld_GetDay() - 2)) && (Andre_CantharFalle == FALSE))
	{
		B_Andre_CantharFalle();
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
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_36");	//Tvé neustálé vraždění již naplnilo pohár trpělivosti lidí i samotného Innose.
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_37");	//Pro krvežíznivé bastardy jako jsi ty mezi námi není místo - a proto tě světská spravedlnost bude soudit ještě před tou nebeskou.
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_38");	//A já sám, pro větší slávu Innose, zařídím, abys už déle nemohl škodit lidstvu!
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_39");	//Zemři v míru!
		}
		else if(GLOBAL_CITY_ATTACK > 10)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_CITY_ATTACK),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_ATTACKCOUNT2_CITY);
			tsettext3 = ConcatStrings(PRINT_ATTACKCOUNT_CITY,tsettext2);
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_40");	//Tvé neustálé útoky na nevinné lidi už není možno jen tak sledovat a nic nedělat.
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_41");	//Pro rváče jako jsi ty mezi námi není místo - a proto tě světská spravedlnost bude soudit ještě před tou nebeskou.
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_42");	//A já sám, pro větší slávu Innose, zařídím, abys už déle nemohl škodit lidstvu!
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_43");	//Zemři v míru!
		}
		else if(GLOBAL_CITY_THEFT > 20)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_CITY_THEFT),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_THEFTCOUNT2_CITY);
			tsettext3 = ConcatStrings(PRINT_THEFTCOUNT_CITY,tsettext2);
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_44");	//Krádež - není to ten nejtěžší ze zločinů, ale taky má své meze, a tys je už překročil.
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_45");	//Pro špinavé zloděje jako jsi ty mezi námi není místo - a proto tě světská spravedlnost bude soudit ještě před tou nebeskou.
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_46");	//A já sám, pro větší slávu Innose, zařídím, abys už déle nemohl škodit lidstvu!
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_47");	//Zemři v míru!
		};
		Log_CreateTopic(TOPIC_DIPLOM,LOG_NOTE);
		B_LogEntry(TOPIC_DIPLOM,"Moje vztahy s domobranou a paladiny jsou kvůli mým neustálým výstřelkům ve městě na bodu mrazu. Teď mě považují za psance!");
		Info_ClearChoices(DIA_Andre_PMSchulden);
		Info_ClearChoices(DIA_Andre_PETZMASTER);
		Info_AddChoice(DIA_Andre_PMSchulden,"Počkej! (utéct)",dia_andre_pmschulden_attackmurder);
	}
	else
	{
		if(B_GetTotalPetzCounter(self) > Andre_LastPetzCounter)
		{
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_01");	//Už jsem se sám sebe ptal, jestli budeš mít dost odvahy sem přijít!
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_02");	//Zdá se, že se počet žalob na tebe ještě znásobil!
			if(Andre_Schulden < 1000)
			{
				AI_Output(self,other,"DIA_Andre_PMSchulden_08_03");	//Varoval jsem tě! Pokuta, kterou musíš zaplatit, je ještě vyšší!
				AI_Output(other,self,"DIA_Andre_PMAdd_15_00");	//Kolik?
				diff = B_GetTotalPetzCounter(self) - Andre_LastPetzCounter;
				if(diff > 0)
				{
					Andre_Schulden = Andre_Schulden + (diff * 250);
				};
				if(Andre_Schulden <= 1000)
				{
					B_Say_Gold(self,other,Andre_Schulden);
				}
				else
				{
					concatText1 = ConcatStrings(IntToString(Andre_Schulden),"");
					concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
					concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
					AI_Print(concattextschulden);
				};
			}
			else
			{
				AI_Output(self,other,"DIA_Andre_PMSchulden_08_04");	//Vážně jsi mě zklamal!
				AI_Output(other,self,"DIA_Andre_PMAdd_15_00");	//Kolik?
				diff = B_GetTotalPetzCounter(self) - Andre_LastPetzCounter;
				if(diff > 0)
				{
					Andre_Schulden = Andre_Schulden + (diff * 250);
				};
				if(Andre_Schulden <= 1000)
				{
					B_Say_Gold(self,other,Andre_Schulden);
				}
				else
				{
					concatText1 = ConcatStrings(IntToString(Andre_Schulden),"");
					concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
					concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
					AI_Print(concattextschulden);
				};
			};
		}
		else if(B_GetGreatestPetzCrime(self) < Andre_LastPetzCrime)
		{
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_05");	//Objevilo se pár nových věcí.
			if(Andre_LastPetzCrime == CRIME_MURDER)
			{
				AI_Output(self,other,"DIA_Andre_PMSchulden_08_06");	//Už není nikdo, kdo by tě obviňoval z vraždy.
				GLOBAL_CITY_MURDER = GLOBAL_CITY_MURDER - 1;
				if(GLOBAL_CITY_MURDER < 0)
				{
					GLOBAL_CITY_MURDER = 0;
				};
			};
			if((Andre_LastPetzCrime == CRIME_THEFT) || ((Andre_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT)))
			{
				AI_Output(self,other,"DIA_Andre_PMSchulden_08_07");	//Už si nikdo nevzpomíná, že by tě viděl při krádeži.
				GLOBAL_CITY_THEFT = GLOBAL_CITY_THEFT - 1;
				if(GLOBAL_CITY_THEFT < 0)
				{
					GLOBAL_CITY_THEFT = 0;
				};
			};
			if((Andre_LastPetzCrime == CRIME_ATTACK) || ((Andre_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK)))
			{
				AI_Output(self,other,"DIA_Andre_PMSchulden_08_08");	//Už nejsou žádní svědkové, kteří by tvrdili, že tě viděli účastnit se rvačky.
				GLOBAL_CITY_ATTACK = GLOBAL_CITY_ATTACK - 1;
				if(GLOBAL_CITY_ATTACK < 0)
				{
					GLOBAL_CITY_ATTACK = 0;
				};
			};
			if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
			{
				AI_Output(self,other,"DIA_Andre_PMSchulden_08_09");	//Zdá se, že se všechna obvinění proti tobě nakonec vyjasnila.
			};
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_10");	//Nevím, jak se to stalo, ale varuji tě: nehraj si se mnou.
			if(B_GetGreatestPetzCrime(self) == CRIME_NONE)
			{
				AI_Output(self,other,"DIA_Andre_PMSchulden_08_11");	//Každopádně jsem se rozhodl odpustit ti tvoje dluhy.
				AI_Output(self,other,"DIA_Andre_PMSchulden_08_12");	//Dej si pozor, aby ses nedostal do žádných dalších potíží.
				Andre_Schulden = 0;
				Andre_LastPetzCounter = 0;
				Andre_LastPetzCrime = CRIME_NONE;
			}
			else
			{
				AI_Output(self,other,"DIA_Andre_PMSchulden_08_13");	//Jedno si vyjasněme: tak jako tak budeš muset zaplatit pokutu v plné výši.
				AI_Output(other,self,"DIA_Andre_PMAdd_15_00B");	//Tak kolik to dělá?
				if(Andre_Schulden <= 1000)
				{
					B_Say_Gold(self,other,Andre_Schulden);
				}
				else
				{
					concatText1 = ConcatStrings(IntToString(Andre_Schulden),"");
					concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
					concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
					AI_Print(concattextschulden);
				};
				AI_Output(self,other,"DIA_Andre_PMSchulden_08_14");	//Tak, co?
			};
		};
		if(B_GetGreatestPetzCrime(self) != CRIME_NONE)
		{
			Info_ClearChoices(DIA_Andre_PMSchulden);
			Info_ClearChoices(DIA_Andre_PETZMASTER);
			Info_AddChoice(DIA_Andre_PMSchulden,"Nemám dost peněz!",DIA_Andre_PETZMASTER_PayLater);
			Info_AddChoice(DIA_Andre_PMSchulden,"Kolik že to bylo?",DIA_Andre_PMSchulden_HowMuchAgain);
			if(Npc_HasItems(other,ItMi_Gold) >= Andre_Schulden)
			{
				Info_AddChoice(DIA_Andre_PMSchulden,"Chci tu pokutu zaplatit!",DIA_Andre_PETZMASTER_PayNow);
			};
		};
	};
};

func void DIA_Andre_PMSchulden_HowMuchAgain()
{
	var string concatText1;
	var string concatText2;
	var string concattextschulden;
	AI_Output(other,self,"DIA_Andre_PMSchulden_HowMuchAgain_15_00");	//Kolik že to bylo?
	if(Andre_Schulden <= 1000)
	{
		B_Say_Gold(self,other,Andre_Schulden);
	}
	else
	{
		concatText1 = ConcatStrings(IntToString(Andre_Schulden),"");
		concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
		concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
		AI_Print(concattextschulden);
	};
	Info_ClearChoices(DIA_Andre_PMSchulden);
	Info_ClearChoices(DIA_Andre_PETZMASTER);
	Info_AddChoice(DIA_Andre_PMSchulden,"Nemám dost peněz!",DIA_Andre_PETZMASTER_PayLater);
	Info_AddChoice(DIA_Andre_PMSchulden,"Kolik že to bylo?",DIA_Andre_PMSchulden_HowMuchAgain);
	if(Npc_HasItems(other,ItMi_Gold) >= Andre_Schulden)
	{
		Info_AddChoice(DIA_Andre_PMSchulden,"Chci tu pokutu zaplatit!",DIA_Andre_PETZMASTER_PayNow);
	};
};


instance DIA_Andre_PETZMASTER(C_Info)
{
	npc = MIL_311_Andre;
	nr = 1;
	condition = DIA_Andre_PETZMASTER_Condition;
	information = DIA_Andre_PETZMASTER_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Andre_PETZMASTER_Condition()
{
	if((B_GetGreatestPetzCrime(self) > Andre_LastPetzCrime) && (MIS_ORCGREATWAR == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Andre_PETZMASTER_Info()
{
	var string concatText1;
	var string concatText2;
	var string concattextschulden;
	var string tsettext1;
	var string tsettext2;
	var string tsettext3;
	var int temp1;
	Andre_Schulden = 0;
	if(self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_00");	//Ty musíš být ten nový chlapík, který tady ve městě dělá tolik problémů.
	};
	if((Pablo_AndreMelden == TRUE) && !Npc_IsDead(Pablo) && (Andre_Steckbrief == FALSE))
	{
		B_Andre_Steckbrief();
	};
	if((MIS_Canthars_KomproBrief == LOG_Running) && (MIS_Canthars_KomproBrief_Day <= (Wld_GetDay() - 2)) && (Andre_CantharFalle == FALSE))
	{
		B_Andre_CantharFalle();
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
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_21");	//Ty ses odvážil sem přijít? To od tebe bylo hloupé.
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_22");	//Tvé neustálé vraždění již naplnilo pohár trpělivosti lidí i samotného Innose.
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_23");	//Pro krvežíznivé bastardy jako jsi ty mezi námi není místo - a proto tě světská spravedlnost bude soudit ještě před tou nebeskou.
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_24");	//A já sám, pro větší slávu Innose, zařídím, abys už déle nemohl škodit lidstvu!
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_25");	//Zemři v míru!
		}
		else if(GLOBAL_CITY_ATTACK > 10)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_CITY_ATTACK),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_ATTACKCOUNT2_CITY);
			tsettext3 = ConcatStrings(PRINT_ATTACKCOUNT_CITY,tsettext2);
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_26");	//Ty ses odvážil sem přijít? To od tebe bylo hloupé.
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_27");	//Tvé neustálé útoky na nevinné lidi už není možno jen tak sledovat a nic nedělat.
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_28");	//Pro rváče jako jsi ty mezi námi není místo - a proto tě světská spravedlnost bude soudit ještě před tou nebeskou.
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_29");	//A já sám, pro větší slávu Innose, zařídím, abys už déle nemohl škodit lidstvu!
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_30");	//Zemři v míru!
		}
		else if(GLOBAL_CITY_THEFT > 20)
		{
			tsettext1 = ConcatStrings(IntToString(GLOBAL_CITY_THEFT),"");
			tsettext2 = ConcatStrings(tsettext1,PRINT_THEFTCOUNT2_CITY);
			tsettext3 = ConcatStrings(PRINT_THEFTCOUNT_CITY,tsettext2);
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_31");	//Ty ses odvážil sem přijít? To od tebe bylo hloupé.
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_32");	//Krádež - není to ten nejtěžší ze zločinů, ale taky má své meze, a tys je už překročil.
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_33");	//Pro špinavé zloděje jako jsi ty mezi námi není místo - a proto tě světská spravedlnost bude soudit ještě před tou nebeskou.
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_34");	//A já sám, pro větší slávu Innose, zařídím, abys už déle nemohl škodit lidstvu!
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_35");	//Zemři v míru!
		};
		Log_CreateTopic(TOPIC_DIPLOM,LOG_NOTE);
		B_LogEntry(TOPIC_DIPLOM,"Moje vztahy s domobranou a paladiny jsou kvůli mým neustálým výstřelkům ve městě na bodu mrazu. Teď mě považují za psance!");
		Info_ClearChoices(DIA_Andre_PMSchulden);
		Info_ClearChoices(DIA_Andre_PETZMASTER);
		Info_AddChoice(DIA_Andre_PETZMASTER,"Počkej! (utéct)",dia_andre_petzmaster_attackmurder);
	}
	else
	{
		if(B_GetGreatestPetzCrime(self) == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_01");	//Dobře, že jsi za mnou přišel, než to začalo být pro tebe ještě horší.
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_02");	//Vražda je vážný zločin!
			Andre_Schulden = B_GetTotalPetzCounter(self) * 1500;
			if((PETZCOUNTER_City_Theft + PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
			{
				AI_Output(self,other,"DIA_Andre_PETZMASTER_08_03");	//A to nemluvím o těch dalších věcech, které jsi napáchal.
			};
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_04");	//Stráže mají rozkazy trestat každého vraha hned na místě.
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_05");	//A většina občanů nehodlá vraždy na území města tolerovat!
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_06");	//Nemám žádný zájem na tom tě pověsit. Jsme ve válce a potřebujeme každého muže.
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_07");	//Ale nebude lehké přesvědčit lidi, aby o tobě smýšleli zase lépe.
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_08");	//Měl bys projevit svou lítost zaplacením pokuty - pochopitelně přiměřeně vysoké.
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_THEFT)
		{
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_09");	//Dobře, že jsi přišel! Jsi obviněný z krádeže! Jsou na to svědci!
			if((PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
			{
				AI_Output(self,other,"DIA_Andre_PETZMASTER_08_10");	//A to nemluvím o dalších věcech, které se mi donesly.
			};
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_11");	//Takové chování nebudu ve městě tolerovat!
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_12");	//Abys odčinil svůj zločin, musíš zaplatit pokutu.
			Andre_Schulden = B_GetTotalPetzCounter(self) * 500;
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
		{
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_13");	//Je něco jiného, když se popereš s lůzou v přístavu...
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_14");	//Ale jakmile zaútočíš na občany nebo královské vojáky, musíš jít před soud.
			if(PETZCOUNTER_City_Sheepkiller > 0)
			{
				AI_Output(self,other,"DIA_Andre_PETZMASTER_08_15");	//A to s tou ovcí bylo také zcela zbytečné.
			};
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_16");	//Kdybych tě nechal odejít jen tak, bude si tady za chvíli každý dělat, co se mu zlíbí.
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_17");	//Takže zaplatíš přiměřenou pokutu - a na celou věc zapomeneme.
			Andre_Schulden = B_GetTotalPetzCounter(self) * 750;
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER)
		{
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_18");	//Slyšel jsem, že sis zasedl na naše ovce.
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_19");	//Uvědom si, že to nemohu nechat být jen tak.
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_20");	//Budeš muset zaplatit náhradu škody!
			Andre_Schulden = 250;
		};
		AI_Output(other,self,"DIA_Andre_PETZMASTER_15_21");	//Kolik?
		if(Andre_Schulden <= 1000)
		{
			B_Say_Gold(self,other,Andre_Schulden);
		}
		else
		{
			concatText1 = ConcatStrings(IntToString(Andre_Schulden),"");
			concatText2 = ConcatStrings(concatText1,PRINT_SHULDEN2);
			concattextschulden = ConcatStrings(PRINT_SHULDEN,concatText2);
			AI_Print(concattextschulden);
		};
		Info_ClearChoices(DIA_Andre_PMSchulden);
		Info_ClearChoices(DIA_Andre_PETZMASTER);
		Info_AddChoice(DIA_Andre_PETZMASTER,"Nemám dost peněz!",DIA_Andre_PETZMASTER_PayLater);
		if(Npc_HasItems(other,ItMi_Gold) >= Andre_Schulden)
		{
			Info_AddChoice(DIA_Andre_PETZMASTER,"Chci tu pokutu zaplatit!",DIA_Andre_PETZMASTER_PayNow);
		};
	};
};

func void DIA_Andre_PETZMASTER_PayNow()
{
	AI_Output(other,self,"DIA_Andre_PETZMASTER_PayNow_15_00");	//Chci tu pokutu zaplatit!
	B_GiveInvItems(other,self,ItMi_Gold,Andre_Schulden);
	AI_Output(self,other,"DIA_Andre_PETZMASTER_PayNow_08_01");	//Dobrá! Postarám se o tom, aby se o tom dozvěděl každý ve městě - tím se tvoje pověst zase trošku vylepší.
	B_GrantAbsolution(LOC_CITY);
	Andre_Schulden = 0;
	Andre_LastPetzCounter = 0;
	Andre_LastPetzCrime = CRIME_NONE;
	Info_ClearChoices(DIA_Andre_PETZMASTER);
	Info_ClearChoices(DIA_Andre_PMSchulden);
};

func void DIA_Andre_PETZMASTER_PayLater()
{
	AI_Output(other,self,"DIA_Andre_PETZMASTER_PayLater_15_00");	//Nemám dost peněz!
	AI_Output(self,other,"DIA_Andre_PETZMASTER_PayLater_08_01");	//Tak si nějaké co nejrychleji sežeň.
	AI_Output(self,other,"DIA_Andre_PETZMASTER_PayLater_08_02");	//A varuji tě: jestli se proviníš ještě něčím, jen si to zhoršíš.
	Andre_LastPetzCounter = B_GetTotalPetzCounter(self);
	Andre_LastPetzCrime = B_GetGreatestPetzCrime(self);
	AI_StopProcessInfos(self);
};


instance DIA_Andre_Hallo(C_Info)
{
	npc = MIL_311_Andre;
	nr = 2;
	condition = DIA_Andre_Hallo_Condition;
	information = DIA_Andre_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Andre_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Andre_Hallo_Info()
{
	AI_Output(self,other,"DIA_Andre_Hallo_08_00");	//Innos tě provázej, cizinče! Co tě ke mně přivádí?
	AndreTakkFT = TRUE;
};


instance DIA_ANDRE_KDFCANTHAR(C_Info)
{
	npc = MIL_311_Andre;
	nr = 1;
	condition = dia_andre_kdfcanthar_condition;
	information = dia_andre_kdfcanthar_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_andre_kdfcanthar_condition()
{
	if((Canthar_WiederRaus == TRUE) && (Npc_IsDead(Canthar) == FALSE) && Npc_KnowsInfo(other,dia_daron_canthar) && (other.guild == GIL_KDF) && (MIS_ORCGREATWAR == FALSE))
	{
		return TRUE;
	};
};

func void dia_andre_kdfcanthar_info()
{
	AI_Output(self,other,"DIA_Andre_KDFCanthar_08_00");	//Ctihodný mistr Daron mě informoval o těch hanebných zvěstech, které o tobě šíří kupec Canthar.
	AI_Output(self,other,"DIA_Andre_KDFCanthar_08_01");	//Podíval jsem se na to a musím přiznat, že byl z vězení opravdu propuštěn nelegálně.
	AI_Output(self,other,"DIA_Andre_KDFCanthar_08_02");	//Nicméně rozhodnout o jeho dalším osudu musíš ty.
	Canthar_Sperre = FALSE;
	Info_ClearChoices(dia_andre_kdfcanthar);
	Info_AddChoice(dia_andre_kdfcanthar,"Nech ho na svobodě.",dia_andre_kdfcanthar_free);
	Info_AddChoice(dia_andre_kdfcanthar,"Myslím, že patří za mříže.",dia_andre_kdfcanthar_prison);
};

func void dia_andre_kdfcanthar_prison()
{
	Info_ClearChoices(dia_andre_kdfcanthar);
	AI_Output(other,self,"DIA_Andre_KDFCanthar_15_03");	//Myslím, že patří za mříže.
	AI_Output(other,self,"DIA_Andre_KDFCanthar_15_04");	//Tam bude mít dost času přemýšlet, co je důležitější - lidský život nebo místo na tržišti.
	AI_Output(self,other,"DIA_Andre_KDFCanthar_08_05");	//Poslechnu tvé rozhodnutí.
	B_StartOtherRoutine(Canthar,"KNAST");
	CANTHAR_AUSGELIEFERT2 = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_andre_kdfcanthar_free()
{
	Info_ClearChoices(dia_andre_kdfcanthar);
	AI_Output(other,self,"DIA_Andre_KDFCanthar_15_06");	//Nech ho na svobodě.
	AI_Output(self,other,"DIA_Andre_KDFCanthar_08_07");	//Nu, jak myslíš, i když s tvým rozhodnutím nesouhlasím.
	AI_StopProcessInfos(self);
};


instance DIA_Andre_Message(C_Info)
{
	npc = MIL_311_Andre;
	nr = 1;
	condition = DIA_Andre_Message_Condition;
	information = DIA_Andre_Message_Info;
	permanent = FALSE;
	description = "Mám důležitou zprávu pro lorda Hagena.";
};


func int DIA_Andre_Message_Condition()
{
	if((Kapitel < 3) && ((hero.guild == GIL_NONE) || (hero.guild == GIL_NOV) || (hero.guild == GIL_NDW) || (hero.guild == GIL_NDM)))
	{
		return TRUE;
	};
};

func void DIA_Andre_Message_Info()
{
	AI_Output(other,self,"DIA_Andre_Message_15_00");	//Mám důležitou zprávu pro lorda Hagena.
	AI_Output(self,other,"DIA_Andre_Message_08_01");	//No, stojíš před jedním z jeho mužů. Čeho se to týká?
	Info_ClearChoices(DIA_Andre_Message);
	Info_AddChoice(DIA_Andre_Message,"To mohu říct jen lordu Hagenovi.",DIA_Andre_Message_Personal);
	Info_AddChoice(DIA_Andre_Message,"Skřetímu vojsku velí DRACI!",DIA_Andre_Message_Dragons);
	Info_AddChoice(DIA_Andre_Message,"Týká se to posvátného artefaktu - Innosova oka.",DIA_Andre_Message_EyeInnos);
};

func void B_Andre_LordHagenNichtZuSprechen()
{
	AI_Output(self,other,"B_Andre_LordHagenNichtZuSprechen_08_00");	//Lord Hagen přijímá jen paladiny a ty, kdo jsou u paladinů ve službě.
	AI_Output(self,other,"B_Andre_LordHagenNichtZuSprechen_08_01");	//Je pod jeho důstojnost ztrácet čas s běžnými lidmi.
};

func void DIA_Andre_Message_EyeInnos()
{
	AI_Output(other,self,"DIA_Andre_Message_EyeInnos_15_00");	//Týká se to posvátného artefaktu - Innosova oka.
	AI_Output(self,other,"DIA_Andre_Message_EyeInnos_08_01");	//Innosovo oko - nikdy jsem o něm neslyšel. Ale to ještě nemusí nic znamenat.
	AI_Output(self,other,"DIA_Andre_Message_EyeInnos_08_02");	//Pokud nějaký artefakt tohoto jména opravdu existuje, stejně o něm vědí jen nejvyšší členové našeho řádu.
	AI_Output(other,self,"DIA_Andre_Message_EyeInnos_15_03");	//Proto si musím promluvit se samotným lordem Hagenem.
	Andre_EyeInnos = TRUE;
	B_Andre_LordHagenNichtZuSprechen();
	Info_ClearChoices(DIA_Andre_Message);
};

func void DIA_Andre_Message_Dragons()
{
	AI_Output(other,self,"DIA_Andre_Message_Dragons_15_00");	//Zástupy skřetů vedou DRA...
	AI_Output(self,other,"DIA_Andre_Message_Dragons_08_01");	//(přeruší tě) JÁ VÍM, že armáda skřetů je čím dál tím silnější.
	AI_Output(self,other,"DIA_Andre_Message_Dragons_08_02");	//Nesnažíš se mi naznačit, že to je TO, co chceš nahlásit lordu Hagenovi.
	AI_Output(self,other,"DIA_Andre_Message_Dragons_08_03");	//Ten by ti utrhl hlavu za to, že mrháš jeho časem takovými historkami.
	AI_Output(self,other,"DIA_Andre_Message_Dragons_08_04");	//A jsem si jistý, že jsi dost chytrý na to, abys to věděl sám.
	AI_Output(self,other,"DIA_Andre_Message_Dragons_08_05");	//Takže o co ve skutečnosti jde?
};

func void DIA_Andre_Message_Personal()
{
	AI_Output(other,self,"DIA_Andre_Message_Personal_15_00");	//To mohu říct jen lordu Hagenovi.
	AI_Output(self,other,"DIA_Andre_Message_Personal_08_01");	//Jak myslíš. Ale jedno bys měl vědět:
	B_Andre_LordHagenNichtZuSprechen();
	Info_ClearChoices(DIA_Andre_Message);
};

instance DIA_Andre_Paladine(C_Info)
{
	npc = MIL_311_Andre;
	nr = 3;
	condition = DIA_Andre_Paladine_Condition;
	information = DIA_Andre_Paladine_Info;
	permanent = FALSE;
	description = "Proč jsou ve městě paladinové?";
};


func int DIA_Andre_Paladine_Condition()
{
	if((other.guild != GIL_MIL) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Andre_Paladine_Info()
{
	AI_Output(other,self,"DIA_Andre_Paladine_15_00");	//Proč jsou ve městě paladinové?
	AI_Output(self,other,"DIA_Andre_Paladine_08_01");	//Cíle naší mise jsou tajné.
	AI_Output(self,other,"DIA_Andre_Paladine_08_02");	//Mohu říct jen to, že občané města nejsou v ohrožení.
	AI_Output(self,other,"DIA_Andre_Paladine_08_03");	//Nemusíš si dělat starosti.
};


instance DIA_Andre_PaladineAgain(C_Info)
{
	npc = MIL_311_Andre;
	nr = 3;
	condition = DIA_Andre_PaladineAgain_Condition;
	information = DIA_Andre_PaladineAgain_Info;
	permanent = FALSE;
	description = "Proč jsou ve městě paladinové?";
};


func int DIA_Andre_PaladineAgain_Condition()
{
	if((other.guild == GIL_MIL) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Andre_PaladineAgain_Info()
{
	if(Npc_KnowsInfo(other,DIA_Andre_Paladine))
	{
		AI_Output(other,self,"DIA_Andre_PaladineAgain_15_00");	//Řekneš mi teď, proč jste vy paladinové přijeli sem do Khorinisu?
	}
	else
	{
		AI_Output(other,self,"DIA_Andre_PaladineAgain_15_01");	//Proč jsou ve městě paladinové?
	};
	AI_Output(self,other,"DIA_Andre_PaladineAgain_08_02");	//Teď patříš k městské stráži, takže jsi také podřízený paladinům.
	AI_Output(self,other,"DIA_Andre_PaladineAgain_08_03");	//Konečně tě tedy mohu zasvětit.
	AI_Output(self,other,"DIA_Andre_PaladineAgain_08_04");	//Přišli jsme sem na rozkaz krále Rhobara. Se zhroucením bariéry ustaly dodávky rudy.
	AI_Output(self,other,"DIA_Andre_PaladineAgain_08_05");	//Proto musíme získat rudu a dopravit ji na pevninu. Z té rudy vykováme nové zbraně a zaženeme skřety zpátky.
	KnowsPaladins_Ore = TRUE;
};


instance DIA_Andre_AskToJoin(C_Info)
{
	npc = MIL_311_Andre;
	nr = 2;
	condition = DIA_Andre_AskToJoin_Condition;
	information = DIA_Andre_AskToJoin_Info;
	permanent = FALSE;
	description = "Chci vstoupit do služby k paladinům!";
};


func int DIA_Andre_AskToJoin_Condition()
{
	if(hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Andre_AskToJoin_Info()
{
	AI_Output(other,self,"DIA_Andre_AskToJoin_15_00");	//Chci vstoupit do služby k paladinům!
	if(Npc_KnowsInfo(other,DIA_Andre_Message))
	{
		AI_Output(self,other,"DIA_Andre_AskToJoin_08_01");	//Dobrá. Hodí se mi každý schopný muž. Nezáleží na důvodech, proč se k nám chce přidat.
		AI_Output(self,other,"DIA_Andre_AskToJoin_08_02");	//Pokud vstoupíš do služby k paladinům, mohl bych ti pomoci zařídit slyšení u lorda Hagena.
	}
	else
	{
		AI_Output(self,other,"DIA_Andre_AskToJoin_08_03");	//Požadavek hodný uznání.
	};
	AI_Output(self,other,"DIA_Andre_AskToJoin_08_04");	//Mám však rozkazy přijímat do domobrany jen občany města.
	AI_Output(self,other,"DIA_Andre_AskToJoin_08_05");	//Můj velitel se bojí, že by se do ní jinak mohli vetřít špehové nebo sabotéři.
	AI_Output(self,other,"DIA_Andre_AskToJoin_08_06");	//Tímhle způsobem chce to riziko minimalizovat.
	AI_Output(self,other,"DIA_Andre_AskToJoin_08_07");	//Nejprve tedy musíš být občanem města - může sice být sporné, jestli tohle pravidlo má smysl nebo ne, ale rozkazy jsou rozkazy.
	Log_CreateTopic(TOPIC_BecomeMIL,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BecomeMIL,LOG_Running);
	B_LogEntry(TOPIC_BecomeMIL,"Chci-li se stát členem městské gardy, musím být nejdřív občanem města.");
};


instance DIA_Andre_AboutMiliz(C_Info)
{
	npc = MIL_311_Andre;
	nr = 5;
	condition = DIA_Andre_AboutMiliz_Condition;
	information = DIA_Andre_AboutMiliz_Info;
	permanent = FALSE;
	description = "Co můžu od služby v domobraně čekat?";
};


func int DIA_Andre_AboutMiliz_Condition()
{
	if((other.guild == GIL_NONE) && Npc_KnowsInfo(other,DIA_Andre_AskToJoin))
	{
		return TRUE;
	};
};

func void DIA_Andre_AboutMiliz_Info()
{
	AI_Output(other,self,"DIA_Andre_AboutMiliz_15_00");	//Co můžu od služby v domobraně čekat?
	AI_Output(self,other,"DIA_Andre_AboutMiliz_08_01");	//Jedno si vyjasněme. Být vojákem v domobraně obnáší mnohem víc, než jen promenádovat se městem v uniformě.
	AI_Output(self,other,"DIA_Andre_AboutMiliz_08_02");	//Je to špinavá a někdy i krvavá práce. Jakmile budeš jedním z nás, bude tě čekat spousta práce.
	AI_Output(self,other,"DIA_Andre_AboutMiliz_08_03");	//Ale stojí to za to. Kromě platu budeš mít také možnost stát se jednoho dne Innosovým svatým válečníkem.
};


instance DIA_Addon_Andre_MartinEmpfehlung(C_Info)
{
	npc = MIL_311_Andre;
	nr = 2;
	condition = DIA_Addon_Andre_MartinEmpfehlung_Condition;
	information = DIA_Addon_Andre_MartinEmpfehlung_Info;
	description = "Mám tady doporučující dopis od tvého proviantmistra.";
};


func int DIA_Addon_Andre_MartinEmpfehlung_Condition()
{
	if(Npc_HasItems(other,ItWr_Martin_MilizEmpfehlung_Addon) && Npc_KnowsInfo(other,DIA_Andre_AskToJoin))
	{
		return TRUE;
	};
};

func void DIA_Addon_Andre_MartinEmpfehlung_Info()
{
	AI_Output(other,self,"DIA_Addon_Andre_MartinEmpfehlung_15_00");	//Mám tady doporučující dopis od tvého proviantmistra.
	AI_Output(self,other,"DIA_Addon_Andre_MartinEmpfehlung_08_01");	//(nevěřícně) Cože? Ukaž mi ho.
	B_GiveInvItems(other,self,ItWr_Martin_MilizEmpfehlung_Addon,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Addon_Andre_MartinEmpfehlung_08_02");	//(překvapeně) No tohle! To ses musel opravdu snažit! Není zrovna jednoduché získat od Martina něco takového.
	AI_Output(self,other,"DIA_Addon_Andre_MartinEmpfehlung_08_03");	//Dobře, přesvědčil jsi mě. Pokud se za tebe Martin zaručí, tak tě přijmu. Řekni mi, až budeš připravený.
	Andre_Knows_MartinEmpfehlung = TRUE;
};


instance DIA_Andre_Alternative(C_Info)
{
	npc = MIL_311_Andre;
	nr = 2;
	condition = DIA_Andre_Alternative_Condition;
	information = DIA_Andre_Alternative_Info;
	permanent = FALSE;
	description = "Není nějaký rychlejší způsob, jak se k vám přidat?";
};


func int DIA_Andre_Alternative_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Andre_AskToJoin) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Andre_Alternative_Info()
{
	AI_Output(other,self,"DIA_Andre_Alternative_15_00");	//Není nějaký rychlejší způsob, jak se k vám přidat?
	AI_Output(self,other,"DIA_Andre_Alternative_08_01");	//Hmm... (zamyšleně) Ty to asi opravdu myslíš vážně, co?
	AI_Output(self,other,"DIA_Andre_Alternative_08_02");	//Dobrá, poslouchej. Mám problém. Když ho za mě vyřešíš, dohlédnu na to, abys byl přijat do řad domobrany.
	AI_Output(self,other,"DIA_Andre_Alternative_08_03");	//Ale je velice důležité, abys o tom nikomu neřekl ani slovo!
};


instance DIA_Andre_GuildOfThieves(C_Info)
{
	npc = MIL_311_Andre;
	nr = 2;
	condition = DIA_Andre_GuildOfThieves_Condition;
	information = DIA_Andre_GuildOfThieves_Info;
	permanent = FALSE;
	description = "Co to máš za problém?";
};

func int DIA_Andre_GuildOfThieves_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Andre_Alternative))
	{
		return TRUE;
	};
};

func void DIA_Andre_GuildOfThieves_Info()
{
	AI_Output(other,self,"DIA_Andre_GuildOfThieves_15_00");	//Co to máš za problém?
	AI_Output(self,other,"DIA_Andre_GuildOfThieves_08_01");	//Poslední dobou se ve městě stalo množství krádeží. Zatím se nám nepodařilo nikoho chytit, ti zloději jsou prostě příliš dobří.
	AI_Output(self,other,"DIA_Andre_GuildOfThieves_08_02");	//Ti bastardi se vyznají. Jsem si jistý, že máme co do činění s organizovanou bandou.
	AI_Output(self,other,"DIA_Andre_GuildOfThieves_08_03");	//Nepřekvapilo by mě, kdyby byl tady v Khorinisu zlodějský cech. Najdi vůdce toho gangu a sejmi ho.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Andre_GuildOfThieves_08_04");	//Já se pak postarám o to, abys byl přijat do domobrany - bez ohledu na to, jestli jsi občanem města, nebo ne.
		AI_Output(self,other,"DIA_Andre_GuildOfThieves_08_05");	//Ale nesmíš se o naší dohodě nikomu zmínit ani slovem!
	};
	MIS_Andre_GuildOfThieves = LOG_Running;
	B_LogEntry(TOPIC_BecomeMIL,"K městské gardě se mohu přidat i jinak, a to tak, že vypátrám a zničím khoriniský zlodějský cech.");
};


instance DIA_Andre_WhereThieves(C_Info)
{
	npc = MIL_311_Andre;
	nr = 2;
	condition = DIA_Andre_WhereThieves_Condition;
	information = DIA_Andre_WhereThieves_Info;
	permanent = FALSE;
	description = "Kde bych měl ty zloděje začít hledat?";
};


func int DIA_Andre_WhereThieves_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Andre_GuildOfThieves) && (MIS_Andre_GuildOfThieves == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Andre_WhereThieves_Info()
{
	AI_Output(other,self,"DIA_Andre_WhereThieves_15_00");	//Kde bych měl ty zloděje začít hledat?
	AI_Output(self,other,"DIA_Andre_WhereThieves_08_01");	//Kdybych to věděl, udělám to sám!
	AI_Output(self,other,"DIA_Andre_WhereThieves_08_02");	//Můžu ti říct jenom tohle: Nedávno jsme obrátili celou přístavní čtvrť vzhůru nohama a nenašli jsme nic, vůbec nic.
	AI_Output(self,other,"DIA_Andre_WhereThieves_08_03");	//Lidé odtamtud nejsou zrovna upovídaní, zvlášť když na sobě máš paladinskou zbroj.
	AI_Output(self,other,"DIA_Andre_WhereThieves_08_04");	//Ale ty nejsi odsud, nebudou k tobě tak nedůvěřiví.
	AI_Output(self,other,"DIA_Andre_WhereThieves_08_05");	//Nejdřív by ses měl poptat po přístavu. Ale buď opatrný. Jestli tamním lidem dojde, že pracuješ pro paladiny, nedozvíš se vůbec NIC!
	B_LogEntry(TOPIC_BecomeMIL,"S pátráním po zlodějském cechu mohu začít v přístavní čtvrti.");
};


instance DIA_Andre_WhatToDo(C_Info)
{
	npc = MIL_311_Andre;
	nr = 3;
	condition = DIA_Andre_WhatToDo_Condition;
	information = DIA_Andre_WhatToDo_Info;
	permanent = FALSE;
	description = "Co mám udělat, až najdu některého z těch zlodějů?";
};


func int DIA_Andre_WhatToDo_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Andre_GuildOfThieves) && (MIS_Andre_GuildOfThieves == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Andre_WhatToDo_Info()
{
	AI_Output(other,self,"DIA_Andre_WhatToDo_15_00");	//Co mám udělat, až najdu některého z těch zlodějů?
	AI_Output(self,other,"DIA_Andre_WhatToDo_08_01");	//Pokud se bude jednat o nějakého poskoka, pomahače nebo malou rybu, bude nejlepší, když to nebudeš hnát na ostří nože.
	AI_Output(self,other,"DIA_Andre_WhatToDo_08_02");	//Spíš přijď za mnou a podej mi o tom zprávu. Já se pak postarám o to, aby ten chlapík skončil za mřížemi.
	AI_Output(self,other,"DIA_Andre_WhatToDo_08_03");	//Do přímého boje by náhodou mohla zakročit městská stráž a těžko bys pak měl příležitost vysvětlovat, o co vlastně jde.
	AI_Output(self,other,"DIA_Andre_WhatToDo_08_04");	//Navíc za každého zmetka, který skončí pod zámkem, dostaneš odměnu.
	AI_Output(self,other,"DIA_Andre_WhatToDo_08_05");	//Ale jestli se ti podaří najít skrýš jejich vůdců - no, pak se boji už asi nevyhneš.
	B_LogEntry(TOPIC_BecomeMIL,"Pokud chytnu některého z přisluhovačů zlodějského cechu, mám ho předvést přímo před lorda Andreho. Jestliže mám ale zničit celý cech, musím zjistit, kde se skrývají.");
};


instance DIA_Andre_Auslieferung(C_Info)
{
	npc = MIL_311_Andre;
	nr = 200;
	condition = DIA_Andre_Auslieferung_Condition;
	information = DIA_Andre_Auslieferung_Info;
	permanent = TRUE;
	description = "Přišel jsem si vybrat odměnu za zločince.";
};

func int DIA_Andre_Auslieferung_Condition()
{
	if((Rengaru_Ausgeliefert == FALSE) || (Halvor_Ausgeliefert == FALSE) || (Nagur_Ausgeliefert == FALSE) || (MIS_Canthars_KomproBrief == LOG_Running) || (Npc_HasItems(hero,ItMi_DexterHead) >= 1) || (Npc_HasItems(hero,ItMi_NestorHead) >= 1) || (Npc_HasItems(hero,ItMi_KriksHead) >= 1) || (Npc_HasItems(hero,ItMi_BartHead) >= 1) || (Npc_HasItems(hero,ItMi_SkironHead) >= 1) || (Npc_HasItems(hero,ItMi_RocksHead) >= 1))
	{
		if(KAPITELORCATC == FALSE)
		{
			return TRUE;
		};
	};
};

func void DIA_Andre_Auslieferung_Info()
{
	AI_Output(other,self,"DIA_Andre_Auslieferung_15_00");	//Přišel jsem si vybrat odměnu za zločince.
	Info_ClearChoices(DIA_Andre_Auslieferung);
	Info_AddChoice(DIA_Andre_Auslieferung,"Vrátím se později.",DIA_Andre_Auslieferung_Back);

	if((Rengaru_InKnast == TRUE) && (Rengaru_Ausgeliefert == FALSE))
	{
		Info_AddChoice(DIA_Andre_Auslieferung,"Rengaru okradl kupce Joru.",DIA_Andre_Auslieferung_Rengaru);
	};
	if((Betrayal_Halvor == TRUE) && (Halvor_Ausgeliefert == FALSE))
	{
		Info_AddChoice(DIA_Andre_Auslieferung,"Halvor prodává kradené zboží.",DIA_Andre_Auslieferung_Halvor);
	};
	if((MIS_Nagur_Bote == LOG_Running) && (Nagur_Ausgeliefert == FALSE))
	{
		Info_AddChoice(DIA_Andre_Auslieferung,"Nagur zabil Baltramova posla.",DIA_Andre_Auslieferung_Nagur);
	};
	if((MIS_Canthars_KomproBrief == LOG_Running) && (MIS_Canthars_KomproBrief_Day > (Wld_GetDay() - 2)))
	{
		Info_AddChoice(DIA_Andre_Auslieferung,"Kupec Canthar se pokouší zbavit Sarah!",DIA_Andre_Auslieferung_Canthar);
	};
	if((MIS_Canthars_KomproBrief == LOG_Running) && (Npc_HasItems(Sarah,ItWr_Canthars_KomproBrief_MIS) >= 1) && (MIS_Canthars_KomproBrief_Day > (Wld_GetDay() - 2)))
	{
		Info_AddChoice(DIA_Andre_Auslieferung,"Sarah prodává zbraně Onarovi.",DIA_Andre_Auslieferung_Sarah);
	};
	if((Npc_HasItems(hero,ItMi_DexterHead) >= 1) && (DexterIsDead == TRUE))
	{
		Info_AddChoice(DIA_Andre_Auslieferung,"Velitel tlupy jménem Dexter je mrtvý.",DIA_Andre_Auslieferung_Dexter);
	};
	if((Npc_HasItems(hero,ItMi_NestorHead) >= 1) && (NestorIsDead == TRUE))
	{
		Info_AddChoice(DIA_Andre_Auslieferung,"Zplozenec zla jménem Nestor je mrtvý.",DIA_Andre_Auslieferung_Nestor);
	};
	if((Npc_HasItems(hero,ItMi_KriksHead) >= 1) && (KriksIsDead == TRUE))
	{
		Info_AddChoice(DIA_Andre_Auslieferung,"Špína jménem Kriks je po smrti.",DIA_Andre_Auslieferung_Kriks);
	};
	if((Npc_HasItems(hero,ItMi_BartHead) >= 1) && (BartIsDead == TRUE))
	{
		Info_AddChoice(DIA_Andre_Auslieferung,"Bandita Bart spí pod drnem.",DIA_Andre_Auslieferung_Bart);
	};
	if((Npc_HasItems(hero,ItMi_SkironHead) >= 1) && (SkironIsDead == TRUE))
	{
		Info_AddChoice(DIA_Andre_Auslieferung,"Bandita Skiron už nedýchá.",DIA_Andre_Auslieferung_Skiron);
	};
	if((Npc_HasItems(hero,ItMi_RocksHead) >= 1) && (RocksIsDead == TRUE))
	{
		Info_AddChoice(DIA_Andre_Auslieferung,"Loupežník jménem Roks už nežije.",DIA_Andre_Auslieferung_Rocks);
	};
};

func void DIA_Andre_Auslieferung_Back()
{
	Info_ClearChoices(DIA_Andre_Auslieferung);
};


func void DIA_Andre_Auslieferung_Dexter()
{
	B_GivePlayerXP(750);
	AI_Output(other,self,"DIA_Andre_Auslieferung_Dexter_01_00");	//Velitel tlupy jménem Dexter je mrtvý.
	B_GiveInvItems(other,self,ItMi_DexterHead,1);
	Npc_RemoveInvItems(self,ItMi_DexterHead,1);
	AI_Output(self,other,"DIA_Andre_Auslieferung_Dexter_01_01");	//Konečně! Ten bývalý trestanec a jeho sebránka držela v šachu celý Khorinis. Nyní budou moci lidé dýchat volněji.
	AI_Output(self,other,"DIA_Andre_Auslieferung_Nagur_08_02");	//Zasloužíte si zlato, a můj respekt.
	B_GiveInvItems(self,other,ItMi_Gold,2500);

	if((MIS_DeadOrAlive == LOG_Running) && (NestorIsDead == TRUE) && (KriksIsDead == TRUE) && (BartIsDead == TRUE) && (SkironIsDead == TRUE) && (RocksIsDead == TRUE) && (DexterIsDead == TRUE))
	{
		MIS_DeadOrAlive = LOG_Success;
		Log_SetTopicStatus(TOPIC_DeadOrAlive,LOG_Success);

		if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
		{
			if(other.HitChance[NPC_TALENT_1H] > other.HitChance[NPC_TALENT_2H])
			{
				B_GiveInvItems(self,other,ItMw_Orkschlaechter,1);
			}
			else
			{
				B_GiveInvItems(self,other,ItMw_Drachenschneide,1);
			};
		};
	};

	Info_ClearChoices(DIA_Andre_Auslieferung);
};

func void DIA_Andre_Auslieferung_Nestor()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Andre_Auslieferung_Nestor_01_00");	//Zplozenec zla jménem Nestor je mrtvý. Snad se mu v příštím životě pomstí.
	B_GiveInvItems(other,self,ItMi_NestorHead,1);
	Npc_RemoveInvItems(self,ItMi_NestorHead,1);
	AI_Output(self,other,"DIA_Andre_Auslieferung_Nestor_01_01");	//Do očí bijící krutost Nestora. Jsem rád, že toto monstrum již není mezi živými.
	AI_Output(self,other,"DIA_Andre_Auslieferung_NestorGold_01_02");	//Nemyslím si, že ten ušlechtilý válečník, stejně jako ty, byl na tom riskantním lovu jen pro peníze. Nejspíš chceš pravděpodobně zbavit obyvatele tohohle ostrova před nebezpečím. Nicméně, tady máš malý příspěvek.
	B_GiveInvItems(self,other,ItMi_Gold,2000);

	if((MIS_DeadOrAlive == LOG_Running) && (NestorIsDead == TRUE) && (KriksIsDead == TRUE) && (BartIsDead == TRUE) && (SkironIsDead == TRUE) && (RocksIsDead == TRUE) && (DexterIsDead == TRUE))
	{
		MIS_DeadOrAlive = LOG_Success;
		Log_SetTopicStatus(TOPIC_DeadOrAlive,LOG_Success);

		if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
		{
			if(other.HitChance[NPC_TALENT_1H] > other.HitChance[NPC_TALENT_2H])
			{
				B_GiveInvItems(self,other,ItMw_Orkschlaechter,1);
			}
			else
			{
				B_GiveInvItems(self,other,ItMw_Drachenschneide,1);
			};
		};
	};

	Info_ClearChoices(DIA_Andre_Auslieferung);
};

func void DIA_Andre_Auslieferung_Kriks()
{
	B_GivePlayerXP(450);
	AI_Output(other,self,"DIA_Andre_Auslieferung_Kriks_01_00");	//Banditská špína jménem Kriks je po smrti.
	B_GiveInvItems(other,self,ItMi_KriksHead,1);
	Npc_RemoveInvItems(self,ItMi_KriksHead,1);
	AI_Output(self,other,"DIA_Andre_Auslieferung_Kriks_01_01");	//Tento parchant nezaslouží žádnou jinou smrt, než tu nejbolestivější. Jsem si jistý, že teď tu bude lépe.
	AI_Output(self,other,"DIA_Andre_Auslieferung_KriksGold_01_02");	//Mou povinností je - předat nějaké zlato.
	B_GiveInvItems(self,other,ItMi_Gold,1500);

	if((MIS_DeadOrAlive == LOG_Running) && (NestorIsDead == TRUE) && (KriksIsDead == TRUE) && (BartIsDead == TRUE) && (SkironIsDead == TRUE) && (RocksIsDead == TRUE) && (DexterIsDead == TRUE))
	{
		MIS_DeadOrAlive = LOG_Success;
		Log_SetTopicStatus(TOPIC_DeadOrAlive,LOG_Success);

		if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
		{
			if(other.HitChance[NPC_TALENT_1H] > other.HitChance[NPC_TALENT_2H])
			{
				B_GiveInvItems(self,other,ItMw_Orkschlaechter,1);
			}
			else
			{
				B_GiveInvItems(self,other,ItMw_Drachenschneide,1);
			};
		};
	};

	Info_ClearChoices(DIA_Andre_Auslieferung);
};

func void DIA_Andre_Auslieferung_Bart()
{
	B_GivePlayerXP(400);
	AI_Output(other,self,"DIA_Andre_Auslieferung_Bart_01_00");	//Touha mnohých v Khorinisu splněna. Bart je mrtvý. Jsem si jistý, že na rakvi ve které opouští svět, moc dřeva nebude.
	B_GiveInvItems(other,self,ItMi_BartHead,1);
	Npc_RemoveInvItems(self,ItMi_BartHead,1);
	AI_Output(self,other,"DIA_Andre_Auslieferung_Bart_01_01");	//Velkolepý pohřeb už nemůže čekat! Stane se hostinou pro vlky!
	AI_Output(self,other,"DIA_Andre_Auslieferung_BartGold_01_02");	//Nemusíš se s nikým dělit. Všechno zlato za jeho hlavu je tvoje.
	B_GiveInvItems(self,other,ItMi_Gold,1250);

	if((MIS_DeadOrAlive == LOG_Running) && (NestorIsDead == TRUE) && (KriksIsDead == TRUE) && (BartIsDead == TRUE) && (SkironIsDead == TRUE) && (RocksIsDead == TRUE) && (DexterIsDead == TRUE))
	{
		MIS_DeadOrAlive = LOG_Success;
		Log_SetTopicStatus(TOPIC_DeadOrAlive,LOG_Success);

		if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
		{
			if(other.HitChance[NPC_TALENT_1H] > other.HitChance[NPC_TALENT_2H])
			{
				B_GiveInvItems(self,other,ItMw_Orkschlaechter,1);
			}
			else
			{
				B_GiveInvItems(self,other,ItMw_Drachenschneide,1);
			};
		};
	};

	Info_ClearChoices(DIA_Andre_Auslieferung);
};

func void DIA_Andre_Auslieferung_Skiron()
{
	B_GivePlayerXP(350);
	AI_Output(other,self,"DIA_Andre_Auslieferung_Skiron_01_00");	//Bandita Skiron už nedýchá.
	B_GiveInvItems(other,self,ItMi_SkironHead,1);
	Npc_RemoveInvItems(self,ItMi_SkironHead,1);
	AI_Output(self,other,"DIA_Andre_Auslieferung_Skiron_01_01");	//Kdysi mocný Skiron. Dnes není víc než jen hnijící mrtvolou zašlé slávy.
	AI_Output(self,other,"DIA_Andre_Auslieferung_SkironGold_01_01");	//Zlato - odměna za tvůj úspěch.
	AI_Output(self,other,"DIA_Andre_Auslieferung_SkironGold_01_02");	//A tvoje pověst, zdá se, se stále zlepšuje nezávisle na státu. To je chvályhodné. Zlato bych ti dal v každém případě, samozřejmě.
	B_GiveInvItems(self,other,ItMi_Gold,1000);

	if((MIS_DeadOrAlive == LOG_Running) && (NestorIsDead == TRUE) && (KriksIsDead == TRUE) && (BartIsDead == TRUE) && (SkironIsDead == TRUE) && (RocksIsDead == TRUE) && (DexterIsDead == TRUE))
	{
		MIS_DeadOrAlive = LOG_Success;
		Log_SetTopicStatus(TOPIC_DeadOrAlive,LOG_Success);

		if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
		{
			if(other.HitChance[NPC_TALENT_1H] > other.HitChance[NPC_TALENT_2H])
			{
				B_GiveInvItems(self,other,ItMw_Orkschlaechter,1);
			}
			else
			{
				B_GiveInvItems(self,other,ItMw_Drachenschneide,1);
			};
		};
	};

	Info_ClearChoices(DIA_Andre_Auslieferung);
};

func void DIA_Andre_Auslieferung_Rocks()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Andre_Auslieferung_Rocks_01_00");	//Roks nemohl uniknout. Nedovedu si představit, kolik lidí už popravil.
	B_GiveInvItems(other,self,ItMi_RocksHead,1);
	Npc_RemoveInvItems(self,ItMi_RocksHead,1);
	AI_Output(self,other,"DIA_Andre_Auslieferung_Rocks_01_01");	//Heh, chlapče. Tady je vidět, že si spravedlivost za všemi hezky doleze.
	AI_Output(self,other,"DIA_Andre_Auslieferung_RocksGold_01_02");	//Nejspíš budu muset ubrat domobráncům. Dobrá práce.
	B_GiveInvItems(self,other,ItMi_Gold,750);

	if((MIS_DeadOrAlive == LOG_Running) && (NestorIsDead == TRUE) && (KriksIsDead == TRUE) && (BartIsDead == TRUE) && (SkironIsDead == TRUE) && (RocksIsDead == TRUE) && (DexterIsDead == TRUE))
	{
		MIS_DeadOrAlive = LOG_Success;
		Log_SetTopicStatus(TOPIC_DeadOrAlive,LOG_Success);

		if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
		{
			if(other.HitChance[NPC_TALENT_1H] > other.HitChance[NPC_TALENT_2H])
			{
				B_GiveInvItems(self,other,ItMw_Orkschlaechter,1);
			}
			else
			{
				B_GiveInvItems(self,other,ItMw_Drachenschneide,1);
			};
		};
	};

	Info_ClearChoices(DIA_Andre_Auslieferung);
};

func void DIA_Andre_Auslieferung_Rengaru()
{
	AI_Teleport(Rengaru,"NW_CITY_HABOUR_KASERN_RENGARU");
	AI_Output(other,self,"DIA_Andre_Auslieferung_Rengaru_15_00");	//Rengaru okradl kupce Joru. Zkusil prásknout do bot, ale chytil jsem ho.
	AI_Output(self,other,"DIA_Andre_Auslieferung_Rengaru_08_01");	//Dobrá, mí muži ho už sebrali. V nejbližší budoucnosti už nikoho okrádat nebude.
	AI_Output(self,other,"DIA_Andre_Auslieferung_Rengaru_08_02");	//Tady máš své peníze.
	B_GiveInvItems(self,other,ItMi_Gold,Kopfgeld);
	Rengaru_Ausgeliefert = TRUE;
	MIS_ThiefGuild_sucked = TRUE;
	B_GivePlayerXP(XP_Andre_Auslieferung);
	Info_ClearChoices(DIA_Andre_Auslieferung);
	B_StartOtherRoutine(Rengaru,"PRISON");
};

func void DIA_Andre_Auslieferung_Halvor()
{
	AI_Teleport(Halvor,"NW_CITY_HABOUR_KASERN_HALVOR");
	AI_Output(other,self,"DIA_Andre_Auslieferung_Halvor_15_00");	//Halvor je překupník. Prodává zboží, které banditi ukradnou kupcům.
	AI_Output(self,other,"DIA_Andre_Auslieferung_Halvor_08_01");	//Takže on za tím vězí. Mí muži ho okamžitě zatknou.
	AI_Output(self,other,"DIA_Andre_Auslieferung_Halvor_08_02");	//Neřekl bych, že bude dělat nějaké problémy. Hned ti dám tvou odměnu.
	B_GiveInvItems(self,other,ItMi_Gold,Kopfgeld);
	B_StartOtherRoutine(Halvor,"PRISON");
	MIS_ThiefGuild_sucked = TRUE;
	Halvor_Ausgeliefert = TRUE;
	B_GivePlayerXP(XP_Andre_Auslieferung);
	Info_ClearChoices(DIA_Andre_Auslieferung);
};

func void DIA_Andre_Auslieferung_Nagur()
{
	AI_Teleport(Nagur,"NW_CITY_HABOUR_KASERN_NAGUR");
	AI_Output(other,self,"DIA_Andre_Auslieferung_Nagur_15_00");	//Nagur zabil Baltramova posla. Pokusil se nastrčit mě jako nového posla, aby zachytil Akilovu zásilku.
	AI_Output(self,other,"DIA_Andre_Auslieferung_Nagur_08_01");	//Na toho chlapíka čeká trest. Okamžitě ho nechám zavřít.
	AI_Output(self,other,"DIA_Andre_Auslieferung_Nagur_08_02");	//Tady máš odměnu, kterou sis po právu zasloužil.
	B_GiveInvItems(self,other,ItMi_Gold,Kopfgeld);
	B_StartOtherRoutine(Nagur,"PRISON");
	MIS_ThiefGuild_sucked = TRUE;
	MIS_Nagur_Bote = LOG_SUCCESS;
	Nagur_Ausgeliefert = TRUE;
	B_GivePlayerXP(XP_Andre_Auslieferung);
	Info_ClearChoices(DIA_Andre_Auslieferung);
};

func void DIA_Andre_Auslieferung_Canthar()
{
	AI_Teleport(Canthar,"NW_CITY_HABOUR_KASERN_RENGARU");
	AI_Output(other,self,"DIA_Andre_Auslieferung_Canthar_15_00");	//Kupec Canthar se pokouší zbavit Sarah!
	AI_Output(self,other,"DIA_Andre_Auslieferung_Canthar_08_01");	//Sarah? Té prodavačky zbraní z tržiště?
	AI_Output(other,self,"DIA_Andre_Auslieferung_Canthar_15_02");	//Měl jsem jí podstrčit falešný dopis, ve kterém se tvrdí, že dodává zbraně Onarovi.
	AI_Output(self,other,"DIA_Andre_Auslieferung_Canthar_08_03");	//Aha. Za toho parchanta ti rád vyplatím odměnu. Jako by už byl za mřížemi.
	B_GiveInvItems(self,other,ItMi_Gold,Kopfgeld);
	B_StartOtherRoutine(Canthar,"KNAST");
	MIS_Canthars_KomproBrief = LOG_SUCCESS;
	Canthar_Ausgeliefert = TRUE;
	B_GivePlayerXP(XP_Andre_Auslieferung);
	Info_ClearChoices(DIA_Andre_Auslieferung);
};

func void DIA_Andre_Auslieferung_Sarah()
{
	AI_Teleport(Sarah,"NW_CITY_HABOUR_KASERN_RENGARU");
	AI_Teleport(Canthar,"NW_CITY_SARAH");
	AI_Output(other,self,"DIA_Andre_Auslieferung_Sarah_15_00");	//Sarah prodává zbraně Onarovi.
	AI_Output(self,other,"DIA_Andre_Auslieferung_Sarah_08_01");	//Sarah? Ta prodavačka zbraní z tržiště? Máš nějaký důkaz?
	AI_Output(other,self,"DIA_Andre_Auslieferung_Sarah_15_02");	//Má ve své kapse dopis, ve kterém jsou podrobnosti o dodávce zbraní k němu.
	AI_Output(self,other,"DIA_Andre_Auslieferung_Sarah_08_03");	//To jí neprojde. Nechám ji zatknout.
	B_GiveInvItems(self,other,ItMi_Gold,Kopfgeld);
	B_StartOtherRoutine(Sarah,"KNAST");
	B_StartOtherRoutine(Canthar,"MARKTSTAND");
	Sarah_Ausgeliefert = TRUE;
	MIS_Canthars_KomproBrief = LOG_SUCCESS;
	B_GivePlayerXP(XP_Andre_Auslieferung);
	Info_ClearChoices(DIA_Andre_Auslieferung);
};


instance DIA_Andre_DGRunning(C_Info)
{
	npc = MIL_311_Andre;
	nr = 4;
	condition = DIA_Andre_DGRunning_Condition;
	information = DIA_Andre_DGRunning_Info;
	permanent = TRUE;
	description = "Co se týče toho cechu zlodějů...";
};


func int DIA_Andre_DGRunning_Condition()
{
	if((MIS_Andre_GuildOfThieves == LOG_Running) && (MIS_ORCGREATWAR == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Andre_DGRunning_Info()
{
	AI_Output(other,self,"DIA_Andre_DGRunning_15_00");	//Co se týče toho cechu zlodějů...
	if(Andre_Diebesgilde_aufgeraeumt == TRUE)
	{
		AI_Output(self,other,"DIA_Andre_DGRunning_08_01");	//Můžeš to pustit z hlavy. Poslal jsem dolů do stok pár chlapů.
		AI_Output(self,other,"DIA_Andre_DGRunning_08_02");	//Cech zlodějů je už jen smutná kapitola v historii tohoto města.
		MIS_Andre_GuildOfThieves = LOG_OBSOLETE;
		if(MIS_CassiaKelche == LOG_Running)
		{
			MIS_CassiaKelche = LOG_OBSOLETE;
		};
		if(MIS_CASSIAGOLDCUP == LOG_Running)
		{
			MIS_CASSIAGOLDCUP = LOG_OBSOLETE;
		};
		if(MIS_RamirezSextant == LOG_Running)
		{
			MIS_RamirezSextant = LOG_OBSOLETE;
		};
		return;
	};
	AI_Output(self,other,"DIA_Andre_DGRunning_08_03");	//Ano?
	Info_ClearChoices(DIA_Andre_DGRunning);
	Info_AddChoice(DIA_Andre_DGRunning,"Pracuji na tom.",DIA_Andre_DGRunning_BACK);
	if(Npc_IsDead(Cassia) && Npc_IsDead(Jesper) && Npc_IsDead(Ramirez))
	{
		Info_AddChoice(DIA_Andre_DGRunning,"Všechny jsem je dostal!",DIA_Andre_DGRunning_Success);
	};
	if(((Cassia.aivar[AIV_TalkedToPlayer] == TRUE) || (Jesper.aivar[AIV_TalkedToPlayer] == TRUE) || (Ramirez.aivar[AIV_TalkedToPlayer] == TRUE)) && (Diebesgilde_Verraten == FALSE))
	{
		Info_AddChoice(DIA_Andre_DGRunning,"Našel jsem úkryt cechu zlodějů!",DIA_Andre_DGRunning_Verrat);
	};
};

func void DIA_Andre_DGRunning_BACK()
{
	AI_Output(other,self,"DIA_Andre_DGRunning_BACK_15_00");	//Pracuji na tom.
	if(Diebesgilde_Verraten == TRUE)
	{
		AI_Output(self,other,"DIA_Andre_DGRunning_BACK_08_01");	//Dobrá. Dám ti na splnění toho úkolu trochu víc času.
	}
	else
	{
		AI_Output(self,other,"DIA_Andre_DGRunning_BACK_08_02");	//Dobrá! Dej mi o všem vědět.
	};
	Info_ClearChoices(DIA_Andre_DGRunning);
};

func void DIA_Andre_DGRunning_Verrat()
{
	AI_Output(other,self,"DIA_Andre_DGRunning_Verrat_15_00");	//Našel jsem úkryt cechu zlodějů!
	AI_Output(self,other,"DIA_Andre_DGRunning_Verrat_08_01");	//Kde?
	AI_Output(other,self,"DIA_Andre_DGRunning_Verrat_15_02");	//Ve stokách pod městem.
	AI_Output(self,other,"DIA_Andre_DGRunning_Verrat_08_03");	//Cože? Všechny kanály jsme zapečetili...
	AI_Output(other,self,"DIA_Andre_DGRunning_Verrat_15_04");	//Zdá se, že jim to nezabránilo v tom, aby se tam dolů nezabydleli.
	AI_Output(self,other,"DIA_Andre_DGRunning_Verrat_08_05");	//Zneškodnil jsi ty kriminálníky?
	Diebesgilde_Verraten = TRUE;
	DG_gefunden = TRUE;
};

func void DIA_Andre_DGRunning_Success()
{
	AI_Output(other,self,"DIA_Andre_DGRunning_Success_15_00");	//Všechny jsem je dostal!
	AI_Output(self,other,"DIA_Andre_DGRunning_Success_08_01");	//Prokázal jsi městu cennou službu.
	DG_gefunden = TRUE;
	MIS_Andre_GuildOfThieves = LOG_SUCCESS;
	B_GivePlayerXP(XP_GuildOfThievesPlatt);
	if(MIS_CassiaKelche == LOG_Running)
	{
		MIS_CassiaKelche = LOG_OBSOLETE;
	};
	if(MIS_CASSIAGOLDCUP == LOG_Running)
	{
		MIS_CASSIAGOLDCUP = LOG_OBSOLETE;
	};
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Andre_DGRunning_Success_08_02");	//Jestli máš pořád zájem o místo v domobraně, stačí říct.
	}
	else if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Andre_DGRunning_Success_08_03");	//Splnil jsi svou povinnost, jak se sluší na Innosova služebníka a královského vojáka.
	};
	AI_Output(self,other,"DIA_Andre_DGRunning_Success_08_04");	//Právem ti náleží odměna za ty bandity. Tady je.
	B_GiveInvItems(self,other,ItMi_Gold,Kopfgeld * 3);
	Info_ClearChoices(DIA_Andre_DGRunning);
};


instance DIA_Andre_JOIN(C_Info)
{
	npc = MIL_311_Andre;
	nr = 100;
	condition = DIA_Andre_JOIN_Condition;
	information = DIA_Andre_JOIN_Info;
	permanent = TRUE;
	description = "Jsem připraven přidat se k domobraně!";
};


func int DIA_Andre_JOIN_Condition()
{
	if((hero.guild == GIL_NONE) && Npc_KnowsInfo(other,DIA_Andre_AskToJoin))
	{
		return TRUE;
	};
};

func void DIA_Andre_JOIN_Info()
{
	AI_Output(other,self,"DIA_Andre_JOIN_15_00");	//Jsem připraven přidat se k domobraně!
	if(Andre_Knows_MartinEmpfehlung == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Andre_JOIN_08_00");	//Proviantmistr Martin se za tebe zaručil a dokonce tě i doporučil. To mi bude stačit.
	}
	else if((MIS_Andre_GuildOfThieves == LOG_SUCCESS) && (Player_IsApprentice == APP_NONE))
	{
		AI_Output(self,other,"DIA_Andre_JOIN_08_01");	//Dodržím svou část úmluvy a přijímám tě do řad domobrany, ačkoliv nejsi občanem města.
		AI_Output(self,other,"DIA_Andre_JOIN_08_02");	//Ale nikomu na světě o tom neřekni ani slovo! Čím méně lidí bude o této výjimce vědět, tím méně to budu muset později obhajovat.
	}
	else if(Player_IsApprentice > APP_NONE)
	{
		AI_Output(self,other,"DIA_Andre_JOIN_08_03");	//Takže ses stal občanem Khorinisu?
		if(Player_IsApprentice == APP_Harad)
		{
			AI_Output(other,self,"DIA_Andre_JOIN_15_04");	//Kovář mě přijal za učedníka.
			AI_Output(self,other,"DIA_Andre_JOIN_08_05");	//Harad? Znám ho. Pracuje pro nás. Je to dobrý chlap.
		};
		if(Player_IsApprentice == APP_Constantino)
		{
			AI_Output(other,self,"DIA_Andre_JOIN_15_06");	//Jsem alchymistův učeň!
			AI_Output(self,other,"DIA_Andre_JOIN_08_07");	//V domobraně nemáme zrovna moc učenců. Možná by se nám mohly tvoje schopnosti hodit.
			AI_Output(self,other,"DIA_Andre_JOIN_08_08");	//Moc toho o tom alchymistovi nevím. Ale lidé říkají, že to je čestný muž.
		};
		if(Player_IsApprentice == APP_Bosper)
		{
			AI_Output(other,self,"DIA_Andre_JOIN_15_09");	//Výrobce luků Bosper mě vzal do učení.
			AI_Output(self,other,"DIA_Andre_JOIN_08_10");	//Takže víš také něco o životě v divočině? To je dobře, protože členové domobrany plní i úkoly mimo okruh městských hradeb.
			AI_Output(self,other,"DIA_Andre_JOIN_08_11");	//Lidé, kteří se vyznají v divočině, se nám budou určitě hodit.
			AI_Output(self,other,"DIA_Andre_JOIN_08_12");	//A ten výrobce luků je pro město velice významný člověk.
		};
		AI_Output(self,other,"DIA_Andre_JOIN_08_13");	//Pokud se za tebe zaručí, nestojí tvému přijetí do domobrany nic v cestě.
		if(MIS_Andre_GuildOfThieves == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Andre_JOIN_08_14");	//Navíc se ti podařilo zbavit nás toho cechu zlodějů. Už jen za to bych tě do domobrany přijal.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Andre_JOIN_08_15");	//To je možné - ale stále nejsi občanem našeho města a já mám své rozkazy.
		return;
	};
	AI_Output(self,other,"DIA_Andre_JOIN_08_16");	//Můžeš se k nám přidat, jestli chceš. Ale tvé rozhodnutí bude konečné.
	AI_Output(self,other,"DIA_Andre_JOIN_08_17");	//Jakmile na sobě budeš mít zbroj domobrany, nebudeš si ji moci jen tak sejmout a přestat patřit mezi nás.
	AI_Output(self,other,"DIA_Andre_JOIN_08_18");	//Jsi připraven společně s námi bojovat za Innose a krále?
	Info_ClearChoices(DIA_Andre_JOIN);
	Info_AddChoice(DIA_Andre_JOIN,"Ještě si nejsem tak úplně jistý.",DIA_Andre_JOIN_No);
	Info_AddChoice(DIA_Andre_JOIN,"Jsem připraven!",DIA_Andre_JOIN_Yes);
};

func void DIA_Andre_JOIN_Yes()
{	
	B_GivePlayerXP(XP_BecomeMiliz);
	AI_Output(other,self,"DIA_Andre_JOIN_Yes_15_00");	//Jsem připraven!
	AI_Output(self,other,"DIA_Andre_JOIN_Yes_08_01");	//Tak budiž. Vítej v domobraně.

	if(CanTeachTownMaster == FALSE)
	{
		MIS_PathFromDown = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_PathFromDown,LOG_SUCCESS);
		CanTeachTownMaster = TRUE;
	};

	other.guild = GIL_MIL;
	Mdl_ApplyOverlayMds(hero,"Humans_Militia.mds");
	CheckHeroGuild[0] = TRUE;
	Snd_Play("GUILD_INV");
	AI_Output(self,other,"DIA_Andre_JOIN_Yes_08_02");	//Tady máš svou zbroj.
	B_GiveInvItems(self,other,ITAR_TOWNGUARD,1);
	AI_Output(self,other,"DIA_Andre_JOIN_Yes_08_03");	//Nos ji hrdě a důstojně.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(Lothar,"START");
	SLD_Aufnahme = LOG_OBSOLETE;
	KDF_Aufnahme = LOG_OBSOLETE;
	MIL_Aufnahme = LOG_SUCCESS;
	MIS_BECOMEKDW = LOG_OBSOLETE;
	MIS_BECOMEKDM = LOG_OBSOLETE;
	MIS_PSICAMPJOIN = LOG_OBSOLETE;

	Log_SetTopicStatus(TOPIC_BecomeSLD,LOG_OBSOLETE);
	Log_SetTopicStatus(TOPIC_BecomeKdF,LOG_OBSOLETE);
	Log_SetTopicStatus(TOPIC_PSICAMPJOIN,LOG_OBSOLETE);
	Log_SetTopicStatus(TOPIC_BECOMEKDW,LOG_OBSOLETE);
	Log_SetTopicStatus(TOPIC_BECOMEKDM,LOG_OBSOLETE);


	if(MIS_SLDRESPEKT == LOG_Running)
	{
		MIS_SLDRESPEKT = LOG_OBSOLETE;
		Log_SetTopicStatus(TOPIC_SLDRespekt,LOG_OBSOLETE);
	};

	Wld_InsertNpc(Mil_362_Miliz,"NW_CITY_HABOUR_KASERN_JOHN_01");
	Wld_InsertNpc(Mil_363_Miliz,"NW_CITY_HABOUR_KASERN_JONNI_01");
	InsertJohnJonni = TRUE;
};

func void DIA_Andre_JOIN_No()
{
	AI_Output(other,self,"DIA_Andre_JOIN_No_15_00");	//Ještě si nejsem tak úplně jistý...
	AI_Output(self,other,"DIA_Andre_JOIN_No_08_01");	//Pokud máš stále nějaké pochyby o svém rozhodnutí, nemohu tě přijmout do řad domobrany.
	Info_ClearChoices(DIA_Andre_JOIN);
};

instance DIA_Andre_PERMJOBPAY(C_Info)
{
	npc = MIL_311_Andre;
	nr = 100;
	condition = DIA_Andre_permjobpay_condition;
	information = DIA_Andre_permjobpay_info;
	permanent = TRUE;
	description = "Co můj plat?";
};

func int DIA_Andre_permjobpay_condition()
{
	if(other.guild == GIL_MIL)
	{
		return TRUE;
	};
};

func void DIA_Andre_permjobpay_info()
{
	var int daynow;
	var int sumpay;

	daynow = Wld_GetDay();
	AI_Output(other,self,"DIA_Andre_PermJobPay_01_00");	//Co se týče mé mzdy...

	if(AndrePAYDAY < daynow)
	{
		AI_Output(self,other,"DIA_Andre_PermJobPay_01_01");	//Samozřejmě. Tady, to je tvoje.
	
		if(AndrePAYDAY > 0)
		{
			sumpay = 50 * (daynow - AndrePAYDAY);
			B_GiveInvItems(self,other,ItMi_Gold,sumpay);
		}
		else
		{
			B_GiveInvItems(self,other,ItMi_Gold,50);
		};

		AndrePAYDAY = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Andre_PermJobPay_01_03");	//Už jsi tu dnes byl. Další dotazy?
	};
};

instance DIA_Andre_LORDHAGEN(C_Info)
{
	npc = MIL_311_Andre;
	nr = 2;
	condition = DIA_Andre_LORDHAGEN_Condition;
	information = DIA_Andre_LORDHAGEN_Info;
	permanent = FALSE;
	description = "Mohu teď jít za lordem Hagenem?";
};

func int DIA_Andre_LORDHAGEN_Condition()
{
	if((other.guild == GIL_MIL) && (Kapitel < 3) && (HagenFTMeet == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Andre_LORDHAGEN_Info()
{
	AI_Output(other,self,"DIA_Andre_LORDHAGEN_15_00");	//Mohu teď jít za lordem Hagenem?
	AI_Output(self,other,"DIA_Andre_LORDHAGEN_08_01");	//Nyní jsi ve službách paladinů. Vpustí tě dovnitř. Ale ve vlastním zájmu bys měl mít na srdci něco opravdu důležitého.
	AI_Output(other,self,"DIA_Andre_LORDHAGEN_15_02");	//To také mám, neměj obavy.
	AI_Output(self,other,"DIA_Andre_LORDHAGEN_08_03");	//Měj na paměti, že budeš mluvit s velitelem paladinů. Chovej se podle toho. Nebudeš tam stát jen za sebe, ale za celou domobranu.
};


instance DIA_Andre_Waffe(C_Info)
{
	npc = MIL_311_Andre;
	nr = 2;
	condition = DIA_Andre_Waffe_Condition;
	information = DIA_Andre_Waffe_Info;
	permanent = FALSE;
	description = "Dostanu také nějakou zbraň?";
};


func int DIA_Andre_Waffe_Condition()
{
	if((other.guild == GIL_MIL) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Andre_Waffe_Info()
{
	AI_Output(other,self,"DIA_Andre_Waffe_15_00");	//Dostanu také nějakou zbraň?
	AI_Output(self,other,"DIA_Andre_Waffe_08_01");	//Samozřejmě. Obvykle se o to stará Peck. Ale zdá se mi, že jsem ho už nějakou dobu neviděl.
	AI_Output(self,other,"DIA_Andre_Waffe_08_02");	//Zjisti, kde se zašívá, a přiveď ho sem. Pak od něj nafasuješ zbraň.
	AI_Output(self,other,"DIA_Andre_Waffe_08_03");	//A pokud bys chtěl spát, můžeš si lehnout na některou z postelí v kasárnách.
	MIS_Andre_Peck = LOG_Running;
	Log_CreateTopic(TOPIC_Peck,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Peck,LOG_Running);
	B_LogEntry(TOPIC_Peck,"Peck se toulá někde po městě. Pokud ho přivedu zpátky do kasáren, mohu od něj dostat zbraň.");
	AI_StopProcessInfos(self);
};

instance DIA_Andre_FOUND_PECK(C_Info)
{
	npc = MIL_311_Andre;
	nr = 2;
	condition = DIA_Andre_FOUND_PECK_Condition;
	information = DIA_Andre_FOUND_PECK_Info;
	permanent = FALSE;
	description = "Podařilo se mi najít Pecka.";
};


func int DIA_Andre_FOUND_PECK_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Peck_FOUND_PECK) && (MIS_Andre_Peck == LOG_Running) && (Npc_IsDead(Peck) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Andre_FOUND_PECK_Info()
{
	AI_Output(other,self,"DIA_Andre_FOUND_PECK_15_00");	//Podařilo se mi najít Pecka.
	AI_Output(self,other,"DIA_Andre_FOUND_PECK_08_01");	//Ano, už je zpět na svém místě a plní své povinnosti. Kde jsi ho našel?
	Info_ClearChoices(DIA_Andre_FOUND_PECK);
	Info_AddChoice(DIA_Andre_FOUND_PECK,"Narazil jsem na něj ve městě.",DIA_Andre_FOUND_PECK_SOMEWHERE);
	Info_AddChoice(DIA_Andre_FOUND_PECK,"Byl u Červené lucerny.",DIA_Andre_FOUND_PECK_REDLIGHT);
};

func void DIA_Andre_FOUND_PECK_SOMEWHERE()
{
	AI_Output(other,self,"DIA_Andre_FOUND_PECK_SOMEWHERE_15_00");	//Narazil jsem na něj ve městě.
	AI_Output(self,other,"DIA_Andre_FOUND_PECK_SOMEWHERE_08_01");	//Dobrá, tak za ním zajdi a vyzvedni si zbraň.
	MIS_Andre_Peck = LOG_SUCCESS;
	B_GivePlayerXP(XP_FoundPeck);
	Info_ClearChoices(DIA_Andre_FOUND_PECK);
};

func void DIA_Andre_FOUND_PECK_REDLIGHT()
{
	AI_Output(other,self,"DIA_Andre_FOUND_PECK_REDLIGHT_15_00");	//Byl u Červené lucerny.
	AI_Output(self,other,"DIA_Andre_FOUND_PECK_REDLIGHT_08_01");	//Aha, takže místo aby se staral o své povinnosti, vysedává s děvčaty.
	AI_Output(self,other,"DIA_Andre_FOUND_PECK_REDLIGHT_08_02");	//Asi s ním budu muset prohodit pár slov.
	B_GivePlayerXP(XP_FoundPeck * 2);
	MIS_Andre_Peck = LOG_SUCCESS;
	PeckCatch = TRUE;
	Info_ClearChoices(DIA_Andre_FOUND_PECK);
};

func void B_AndreSold()
{
	AI_Output(self,other,"DIA_Andre_Sold_08_00");	//Tady máš svůj plat.
	B_GiveInvItems(self,other,ItMi_Gold,Andre_Sold);
};


instance DIA_Andre_FIRSTMISSION(C_Info)
{
	npc = MIL_311_Andre;
	nr = 2;
	condition = DIA_Andre_FIRSTMISSION_Condition;
	information = DIA_Andre_FIRSTMISSION_Info;
	permanent = FALSE;
	description = "Máš pro mě nějaký úkol?";
};


func int DIA_Andre_FIRSTMISSION_Condition()
{
	if(other.guild == GIL_MIL)
	{
		return TRUE;
	};
};

func void DIA_Andre_FIRSTMISSION_Info()
{
	AI_Output(other,self,"DIA_Andre_FIRSTMISSION_15_00");	//Máš pro mě nějaký úkol?
	AI_Output(self,other,"DIA_Andre_FIRSTMISSION_08_01");	//V poslední době stoupl ve městě prodej trávy z bažin.
	AI_Output(self,other,"DIA_Andre_FIRSTMISSION_08_02");	//Nemůžeme dopustit, aby se to tady nějak rozmohlo.
	AI_Output(self,other,"DIA_Andre_FIRSTMISSION_08_03");	//Jinak by každý začal kouřit a nikdo by nebyl schopný pracovat, natož udržet zbraň.
	AI_Output(self,other,"DIA_Andre_FIRSTMISSION_08_04");	//To si nemůžeme dovolit zvlášť teď, když hrozí útok skřetů nebo žoldáků.
	AI_Output(self,other,"DIA_Andre_FIRSTMISSION_08_05");	//Mám podezření, že za tím jsou ti žoldáci. Vsadím se, že to oni přináší to svinstvo do města.
	AI_Output(other,self,"DIA_Andre_FIRSTMISSION_15_06");	//Co je na práci?
	AI_Output(self,other,"DIA_Andre_FIRSTMISSION_08_07");	//Mortis, jeden z našich mužů, v přístavní krčmě zaslechl, že někam do přístavní čtvrti měl dorazit balík trávy z bažin.
	AI_Output(self,other,"DIA_Andre_FIRSTMISSION_08_08");	//Porozhlédni se kolem a ten balík mi dones.
	MIS_Andre_WAREHOUSE = LOG_Running;
	Log_CreateTopic(TOPIC_Warehouse,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Warehouse,LOG_Running);
	B_LogEntry(TOPIC_Warehouse,"Do přístavu dorazil balík trávy z bažin - Mortis se o tom dozvěděl v místní krčmě. Já mám tu zásilku najít a donést lordu Andremu.");

	if(Nadja_GaveLuciaInfo == FALSE)
	{
		Bromor_Pay = FALSE;
		NadjaIsUp = FALSE;
		Nadja_Nacht = FALSE;
	};
};


instance DIA_Andre_FOUND_STUFF(C_Info)
{
	npc = MIL_311_Andre;
	nr = 2;
	condition = DIA_Andre_FOUND_STUFF_Condition;
	information = DIA_Andre_FOUND_STUFF_Info;
	permanent = TRUE;
	description = "Co se toho balíku týče...";
};


func int DIA_Andre_FOUND_STUFF_Condition()
{
	if(MIS_Andre_WAREHOUSE == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Andre_FOUND_STUFF_Info()
{
	AI_Output(other,self,"DIA_Andre_FOUND_STUFF_15_00");	//Co se toho balíku týče...
	AI_Output(self,other,"DIA_Andre_FOUND_STUFF_08_01");	//Našel jsi ho?
	if((Npc_HasItems(other,ItMi_HerbPaket) > 0) || (MIS_Cipher_Paket == LOG_SUCCESS))
	{
		Info_ClearChoices(DIA_Andre_FOUND_STUFF);
		if(Npc_HasItems(other,ItMi_HerbPaket) > 0)
		{
			Info_AddChoice(DIA_Andre_FOUND_STUFF,"Ano, tady je.",DIA_Andre_FOUND_STUFF_Ja);
		};
		Info_AddChoice(DIA_Andre_FOUND_STUFF,"Hodil jsem ho do přístavní zátoky.",DIA_Andre_FOUND_STUFF_Becken);
	}
	else
	{
		AI_Output(other,self,"DIA_Andre_FOUND_STUFF_15_02");	//Zatím ne.
	};
};

func void DIA_Andre_FOUND_STUFF_Ja()
{
	AI_Output(other,self,"DIA_Andre_FOUND_STUFF_Ja_15_00");	//Ano, tady je.
	B_GiveInvItems(other,self,ItMi_HerbPaket,1);
	AI_Output(self,other,"DIA_Andre_FOUND_STUFF_Ja_08_01");	//Dobrá práce. Budeme tu trávu dobře střežit.
	B_AndreSold();
	MIS_Andre_WAREHOUSE = LOG_SUCCESS;
	MIS_Cipher_Paket = LOG_FAILED;
	B_GivePlayerXP(XP_Warehouse_Super * 2);
	Info_ClearChoices(DIA_Andre_FOUND_STUFF);
};

func void DIA_Andre_FOUND_STUFF_Becken()
{
	AI_Output(other,self,"DIA_Andre_FOUND_STUFF_Becken_15_00");	//Hodil jsem ho do přístavní zátoky.
	AI_Output(self,other,"DIA_Andre_FOUND_STUFF_Becken_08_01");	//Vážně? No, hlavně že už nemůže padnout do špatných rukou.
	B_AndreSold();
	MIS_Andre_WAREHOUSE = LOG_SUCCESS;
	B_GivePlayerXP(XP_Warehouse_Super);
	Info_ClearChoices(DIA_Andre_FOUND_STUFF);
};


instance DIA_Andre_FIND_DEALER(C_Info)
{
	npc = MIL_311_Andre;
	nr = 2;
	condition = DIA_Andre_FIND_DEALER_Condition;
	information = DIA_Andre_FIND_DEALER_Info;
	permanent = FALSE;
	description = "Máš pro mě nějakou další práci?";
};


func int DIA_Andre_FIND_DEALER_Condition()
{
	if((MIS_Andre_WAREHOUSE == LOG_SUCCESS) && (Npc_IsDead(Borka) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Andre_FIND_DEALER_Info()
{
	AI_Output(other,self,"DIA_Andre_FIND_DEALER_15_00");	//Máš pro mě nějakou další práci?
	AI_Output(self,other,"DIA_Andre_FIND_DEALER_08_01");	//Stáhl jsi ten balík trávy z oběhu - to je dobře.
	AI_Output(self,other,"DIA_Andre_FIND_DEALER_08_02");	//Rád bych ale zjistil, kdo to rozšiřuje mezi lidi.
	AI_Output(self,other,"DIA_Andre_FIND_DEALER_08_03");	//Musí to být někdo z přístavní čtvrti.
	AI_Output(self,other,"DIA_Andre_FIND_DEALER_08_04");	//Kdyby do města někdo pravidelně přicházel zvenčí, už bychom ho dávno chytili.
	AI_Output(other,self,"DIA_Andre_FIND_DEALER_15_05");	//Co přesně mám udělat?
	AI_Output(self,other,"DIA_Andre_FIND_DEALER_08_06");	//Najdi toho překupníka a nech si od něj nějakou tu trávu prodat. Nebude to snadné, ale jinak ho nemůžeme zatknout.
	AI_Output(self,other,"DIA_Andre_FIND_DEALER_08_07");	//Promluv si s Mortisem, vyzná se v přístavní čtvrti. Možná by ti mohl nějak pomoci.
	MIS_Andre_REDLIGHT = LOG_Running;
	B_StartOtherRoutine(Nadja,"SMOKE");
	Log_CreateTopic(TOPIC_Redlight,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Redlight,LOG_Running);
	B_LogEntry(TOPIC_Redlight,"Mám najít chlápka, co v přístavišti kšeftuje s trávou z bažin. Musím ho přimět, aby mi něco ze svých zásob prodal. Mortis mi v tom může pomoci.");
};


instance DIA_Andre_REDLIGHT_SUCCESS(C_Info)
{
	npc = MIL_311_Andre;
	nr = 2;
	condition = DIA_Andre_REDLIGHT_SUCCESS_Condition;
	information = DIA_Andre_REDLIGHT_SUCCESS_Info;
	permanent = TRUE;
	description = "Co se té trávy týče...";
};


func int DIA_Andre_REDLIGHT_SUCCESS_Condition()
{
	if((MIS_Andre_REDLIGHT == LOG_Running) && (MIS_ORCGREATWAR == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Andre_REDLIGHT_SUCCESS_Info()
{
	AI_Output(other,self,"DIA_Andre_REDLIGHT_SUCCESS_15_00");	//Co se té trávy týče...
	if((Npc_IsDead(Borka) == TRUE) || (Undercover_Failed == TRUE))
	{
		AI_Output(self,other,"DIA_Andre_REDLIGHT_SUCCESS_08_01");	//Nemyslím, že bychom se v přístavní čtvrti něco dozvěděli.
		if(Npc_IsDead(Borka) == TRUE)
		{
			AI_Output(self,other,"DIA_Andre_REDLIGHT_SUCCESS_08_02");	//Ne, když je ten vyhazovač mrtvý.
		};
		if(Nadja_Victim == TRUE)
		{
			AI_Output(self,other,"DIA_Andre_REDLIGHT_SUCCESS_08_03");	//Ta dívka z Červené lucerny, Nadja, je mrtvá. Musela to být nějaká podivná nehoda.
			B_RemoveNpc(Nadja);
		};
		if(Undercover_Failed == TRUE)
		{
			AI_Output(self,other,"DIA_Andre_REDLIGHT_SUCCESS_08_04");	//Nebyl jsi dostatečně opatrný.
		};
		MIS_Andre_REDLIGHT = LOG_FAILED;
	}
	else if(Borka_Deal == 2)
	{
		AI_Output(other,self,"DIA_Andre_REDLIGHT_SUCCESS_15_05");	//Vím, kdo tu trávu ve městě prodává. Je to Borka, vyhazovač od Červené lucerny.
		AI_Output(self,other,"DIA_Andre_REDLIGHT_SUCCESS_08_06");	//Vážně? Máme nějaký důkaz?
		AI_Output(other,self,"DIA_Andre_REDLIGHT_SUCCESS_15_07");	//Trochu té trávy mi prodal.
		AI_Output(self,other,"DIA_Andre_REDLIGHT_SUCCESS_08_08");	//Výborně, to nám stačí. Okamžitě ho nechám zatknout.
		B_StartOtherRoutine(Borka,"PRISON");
		MIS_Andre_REDLIGHT = LOG_SUCCESS;
		B_GivePlayerXP(XP_Redlight);
		B_AndreSold();
		AI_Output(self,other,"DIA_Wulfgar_Bandits_Done_01_04");	//Ve jménu celé domobrany ti děkuji za tvou pomoc!
		AI_Output(self,other,"DIA_Wulfgar_Bandits_Done_01_05");	//A na důkaz mých díků, přijmi ode mne tuhle zbroj.
		B_GiveInvItems(self,other,ItAr_MIL_L,1);
		AI_Output(self,other,"DIA_Wulfgar_Bandits_Done_01_06");	//Zasloužil sis ji, vojáku!
	}
	else
	{
		AI_Output(other,self,"DIA_Andre_REDLIGHT_SUCCESS_15_09");	//... ještě na tom pracuji.
		AI_Output(self,other,"DIA_Andre_REDLIGHT_SUCCESS_08_10");	//Dobrá, a nezapomeň, že musíš toho chlapíka přesvědčit, aby s tebou uzavřel obchod.
	};
};


instance DIA_Andre_HILFBAUERLOBART(C_Info)
{
	npc = MIL_311_Andre;
	nr = 3;
	condition = DIA_Andre_HILFBAUERLOBART_Condition;
	information = DIA_Andre_HILFBAUERLOBART_Info;
	description = "Máš pro mě nějaký další úkol?";
};


func int DIA_Andre_HILFBAUERLOBART_Condition()
{
	if((MIS_Andre_WAREHOUSE == LOG_SUCCESS) && (MIS_ORCGREATWAR == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Andre_HILFBAUERLOBART_Info()
{
	AI_Output(other,self,"DIA_Andre_HILFBAUERLOBART_15_00");	//Máš pro mě nějaký další úkol?
	AI_Output(self,other,"DIA_Andre_HILFBAUERLOBART_08_01");	//Farmář Lobart má na svých polích nějaké problémy.
	AI_Output(self,other,"DIA_Andre_HILFBAUERLOBART_08_02");	//Pokud mu pomůžeme, upevníme jeho vztahy s městem. Zajdi tedy za ním a zjisti, co se děje.
	Log_CreateTopic(TOPIC_Feldraeuber,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Feldraeuber,LOG_Running);
	B_LogEntry(TOPIC_Feldraeuber,"Andre mě poslal na Lobartův statek. Mám mu pomoci ho dát znovu do pořádku.");
	MIS_AndreHelpLobart = LOG_Running;
	Wld_InsertNpc(Lobarts_Giant_Bug1,"NW_FARM1_FIELD_06");
	Wld_InsertNpc(Lobarts_Giant_Bug2,"NW_FARM1_FIELD_06");
	Wld_InsertNpc(Lobarts_Giant_Bug3,"NW_FARM1_FIELD_05");
	Wld_InsertNpc(Lobarts_Giant_Bug4,"NW_FARM1_FIELD_05");
	Wld_InsertNpc(Lobarts_Giant_Bug5,"NW_FARM1_FIELD_04");
	Wld_InsertNpc(Lobarts_Giant_Bug6,"NW_FARM1_FIELD_04");
	Wld_InsertNpc(Lobarts_Giant_Bug7,"NW_FARM1_FIELD_03");
	B_StartOtherRoutine(Vino,"BUGSTHERE");
	B_StartOtherRoutine(LobartsBauer1,"BUGSTHERE");
	B_StartOtherRoutine(LobartsBauer2,"BUGSTHERE");
	if(SNIPSGETNUGGETS == FALSE)
	{
		B_StartOtherRoutine(snipes,"BUGSTHERE");
	};
	AI_StopProcessInfos(self);
};


instance DIA_Andre_LOBART_SUCCESS(C_Info)
{
	npc = MIL_311_Andre;
	condition = DIA_Andre_LOBART_SUCCESS_Condition;
	information = DIA_Andre_LOBART_SUCCESS_Info;
	description = "Pomohl jsem Lobartovi.";
};


func int DIA_Andre_LOBART_SUCCESS_Condition()
{
	if(MIS_AndreHelpLobart == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Andre_LOBART_SUCCESS_Info()
{
	AI_Output(other,self,"DIA_Andre_LOBART_SUCCESS_15_00");	//Pomohl jsem Lobartovi.
	AI_Output(self,other,"DIA_Andre_LOBART_SUCCESS_08_01");	//Výborně. Pokud bude Lobart spokojený, bude městu i nadále prodávat své tuříny.
	B_GivePlayerXP(XP_LobartBugs);
	B_AndreSold();
};


instance DIA_Addon_Andre_MissingPeople(C_Info)
{
	npc = MIL_311_Andre;
	nr = 5;
	condition = DIA_Addon_Andre_MissingPeople_Condition;
	information = DIA_Addon_Andre_MissingPeople_Info;
	description = "A co ti zmizelí lidé?";
};


func int DIA_Addon_Andre_MissingPeople_Condition()
{
	if((MIS_Addon_Vatras_WhereAreMissingPeople == LOG_Running) && (other.guild == GIL_MIL))
	{
		return TRUE;
	};
};

func void DIA_Addon_Andre_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Andre_MissingPeople_15_00");	//A co ti zmizelí lidé?
	AI_Output(self,other,"DIA_Addon_Andre_MissingPeople_08_01");	//Co s nimi?
	AI_Output(other,self,"DIA_Addon_Andre_MissingPeople_15_02");	//Neměli bychom je zkusit najít?
	AI_Output(self,other,"DIA_Addon_Andre_MissingPeople_08_03");	//Lord Hagen mi nakázal chránit město a přilehlé statky.
	AI_Output(self,other,"DIA_Addon_Andre_MissingPeople_08_04");	//To znamená, že se staráme o lidi, kteří jsou ještě TADY.
	AI_Output(self,other,"DIA_Addon_Andre_MissingPeople_08_05");	//V noci hlídkuje na ulicích domobrana. Víc dělat nemohu.
	AI_Output(self,other,"DIA_Addon_Andre_MissingPeople_08_06");	//A TY by sis měl taky hledět hlavně úkolů, které jsem ti zadal, jasné?
	MIS_Addon_Andre_MissingPeople = LOG_Running;
};


instance DIA_Addon_Andre_MissingPeople2(C_Info)
{
	npc = MIL_311_Andre;
	nr = 5;
	condition = DIA_Addon_Andre_MissingPeople2_Condition;
	information = DIA_Addon_Andre_MissingPeople2_Info;
	description = "Co se týče těch zmizelých lidí...";
};


func int DIA_Addon_Andre_MissingPeople2_Condition()
{
	if((MIS_Addon_Vatras_WhereAreMissingPeople == LOG_Running) && (other.guild != GIL_MIL) && (SCKnowsMissingPeopleAreInAddonWorld == FALSE) && (MIS_ORCGREATWAR == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Andre_MissingPeople2_Info()
{
	AI_Output(other,self,"DIA_Addon_Andre_MissingPeople2_15_00");	//Co se týče těch zmizelých lidí...
	AI_Output(self,other,"DIA_Addon_Andre_MissingPeople2_08_01");	//S TÍM už mi dej pokoj! Mám jiné starosti.
	MIS_Addon_Andre_MissingPeople = LOG_Running;
};


instance DIA_Addon_Andre_ReturnedMissingPeople(C_Info)
{
	npc = MIL_311_Andre;
	nr = 5;
	condition = DIA_Addon_Andre_ReturnedMissingPeople_Condition;
	information = DIA_Addon_Andre_ReturnedMissingPeople_Info;
	description = "Podařilo se mi pár těch zmizelých lidí zachránit.";
};


func int DIA_Addon_Andre_ReturnedMissingPeople_Condition()
{
	if((MissingPeopleReturnedHome == TRUE) && (MIS_Addon_Andre_MissingPeople == LOG_Running) && (MIS_ORCGREATWAR == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Andre_ReturnedMissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Andre_ReturnedMissingPeople_15_00");	//Podařilo se mi pár těch zmizelých lidí zachránit.
	if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Addon_Andre_ReturnedMissingPeople_08_01");	//A já si říkal, kde jsi sakra byl tak dlouho!
		AI_Output(self,other,"DIA_Addon_Andre_ReturnedMissingPeople_08_02");	//Jsi členem domobrany! A k ničemu takovému jsi neměl rozkazy!
		AI_Output(other,self,"DIA_Addon_Andre_ReturnedMissingPeople_15_03");	//Ale...
	};
	AI_Output(self,other,"DIA_Addon_Andre_ReturnedMissingPeople_08_04");	//Kolik lidí jsi našel?
	AI_Output(other,self,"DIA_Addon_Andre_ReturnedMissingPeople_15_05");	//Všechny, kteří byli ještě naživu.
	AI_Output(self,other,"DIA_Addon_Andre_ReturnedMissingPeople_08_06");	//VŠECHNY?! Já... Ehm...
	if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Addon_Andre_ReturnedMissingPeople_08_07");	//Jsem na tebe hrdý! A jsem rád, že jsem tě sem přijal.
		B_AndreSold();
	};
	AI_Output(self,other,"DIA_Addon_Andre_ReturnedMissingPeople_08_08");	//To byl hrdinský čin.
	MIS_Addon_Andre_MissingPeople = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_Andre_MissingPeople);
};

func void B_Andre_GotoLordHagen()
{
	AI_Output(self,other,"DIA_Andre_Add_08_11");	//Měl bys jít přímo za ním.
};


instance DIA_Andre_BerichtDrachen(C_Info)
{
	npc = MIL_311_Andre;
	nr = 1;
	condition = DIA_Andre_BerichtDrachen_Condition;
	information = DIA_Andre_BerichtDrachen_Info;
	permanent = FALSE;
	description = "Byl jsem v Hornickém údolí a viděl jsem draky!";
};


func int DIA_Andre_BerichtDrachen_Condition()
{
	if((EnterOW_Kapitel2 == TRUE) && (MIS_OLDWORLD != LOG_SUCCESS) && (MIS_ORCGREATWAR == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Andre_BerichtDrachen_Info()
{
	AI_Output(other,self,"DIA_Andre_Add_15_13");	//Byl jsem v Hornickém údolí a viděl jsem draky!
	if(Npc_HasItems(hero,ItWr_PaladinLetter_MIS) > 0)
	{
		AI_Output(other,self,"DIA_Andre_Add_15_14");	//Mám dopis od velitele Garonda, který má slova potvrzuje.
	};
	AI_Output(self,other,"DIA_Andre_Add_08_10");	//To bude lorda Hagena zajímat!
	B_Andre_GotoLordHagen();
};


instance DIA_Andre_BennetInPrison(C_Info)
{
	npc = MIL_311_Andre;
	condition = DIA_Andre_BennetInPrison_Condition;
	information = DIA_Andre_BennetInPrison_Info;
	permanent = TRUE;
	description = "A co Bennet, ten kovář?";
};


func int DIA_Andre_BennetInPrison_Condition()
{
	if((MIS_RescueBennet == LOG_Running) && (MIS_ORCGREATWAR == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Andre_BennetInPrison_Info()
{
	AI_Output(other,self,"DIA_Andre_BennetInPrison_15_00");	//A co Bennet, ten kovář?
	AI_Output(self,other,"DIA_Andre_BennetInPrison_08_01");	//Myslíš toho žoldáka? Sedí ve vězení, kam patří.
	AI_Output(other,self,"DIA_Andre_BennetInPrison_Talk_15_00");	//Mohu s ním mluvit?
	AI_Output(self,other,"DIA_Andre_BennetInPrison_Talk_08_01");	//Jistě, jak je libo. Ale pokud se pokusíš pomoci mu k útěku, skončíš tam také.
};

var int AndreCatchCorn;

instance DIA_Andre_Cornelius_Liar(C_Info)
{
	npc = MIL_311_Andre;
	condition = DIA_Andre_Cornelius_Liar_Condition;
	information = DIA_Andre_Cornelius_Liar_Info;
	permanent = TRUE;
	description = "Myslím, že Cornelius lže.";
};

func int DIA_Andre_Cornelius_Liar_Condition()
{
	if((Cornelius_ThreatenByMilSC == TRUE) && (CorneliusFlee != TRUE) && (AndreCatchCorn == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Andre_Cornelius_Liar_Info()
{
	AI_Output(other,self,"DIA_Andre_Cornelius_Liar_15_00");	//Myslím, že Cornelius lže.
	AI_Output(self,other,"DIA_Andre_Cornelius_Liar_08_01");	//Jsi si jistý?
	Info_ClearChoices(DIA_Andre_Cornelius_Liar);
	Info_AddChoice(DIA_Andre_Cornelius_Liar,"Ne.",DIA_Andre_Cornelius_Liar_No);
	Info_AddChoice(DIA_Andre_Cornelius_Liar,"Ano.",DIA_Andre_Cornelius_Liar_Yes);
};

func void DIA_Andre_Cornelius_Liar_No()
{
	AI_Output(other,self,"DIA_Andre_Cornelius_Liar_No_15_00");	//Ne.
	AI_Output(self,other,"DIA_Andre_Cornelius_Liar_No_08_01");	//V tom případě bys neměl své podezření tak zeširoka roztrubovat.
	AI_Output(self,other,"DIA_Andre_Cornelius_Liar_No_08_02");	//Cornelius je vlivný muž. Mohl by ti udělat ze života peklo, kdyby chtěl.
	AI_Output(self,other,"DIA_Andre_Cornelius_Liar_No_08_03");	//Pokud nemáš žádný důkaz, nemohu ti pomoci.
	Info_ClearChoices(DIA_Andre_Cornelius_Liar);
};

func void DIA_Andre_Cornelius_Liar_Yes()
{
	AI_Output(other,self,"DIA_Andre_Cornelius_Liar_Yes_15_00");	//Ano.
	AI_Output(self,other,"DIA_Andre_Cornelius_Liar_Yes_08_01");	//Co za důkaz máš?

	if(Cornelius_IsLiar == TRUE)
	{
		AI_Output(other,self,"DIA_Andre_Cornelius_Liar_Yes_15_02");	//Četl jsem jeho deník! Podplatili ho. Všechno je jen snůška lží.
		AI_Output(self,other,"DIA_Andre_Cornelius_Liar_Yes_08_03");	//Pokud to je skutečně tak, musíš jít okamžitě za lordem Hagenem.
		AI_Output(self,other,"DIA_Andre_Cornelius_Liar_Yes_08_04");	//Ukaž mu ten deník. On už se postará o zbytek.
		AndreCatchCorn = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Andre_Cornelius_Liar_Yes_15_05");	//Ehm, no, myslím...
		AI_Output(self,other,"DIA_Andre_Cornelius_Liar_Yes_08_06");	//Potřebuji důkaz, ne podezření. Sežeň důkaz, pak pro tebe budu moci něco udělat.
		AI_Output(self,other,"DIA_Andre_Cornelius_Liar_Yes_08_07");	//Do té doby by sis měl raději dávat pozor na jazyk.
	};

	Info_ClearChoices(DIA_Andre_Cornelius_Liar);
};


instance DIA_Andre_Paladin(C_Info)
{
	npc = MIL_311_Andre;
	condition = DIA_Andre_Paladin_Condition;
	information = DIA_Andre_Paladin_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Andre_Paladin_Condition()
{
	if(other.guild == GIL_PAL)
	{
		return TRUE;
	};
};

func void DIA_Andre_Paladin_Info()
{
	AI_Output(self,other,"DIA_Andre_Paladin_08_00");	//Takže nyní jsi paladin! Gratuluji!
	AI_Output(self,other,"DIA_Andre_Paladin_08_01");	//Už od začátku jsem si myslel, že nezůstaneš u domobrany dlouho.
};


instance DIA_Andre_PERM(C_Info)
{
	npc = MIL_311_Andre;
	nr = 100;
	condition = DIA_Andre_PERM_Condition;
	information = DIA_Andre_PERM_Info;
	permanent = TRUE;
	description = "Jak to vypadá ve městě?";
};


func int DIA_Andre_PERM_Condition()
{
	if((other.guild != GIL_NONE) && (MIS_ORCGREATWAR == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Andre_PERM_Info()
{
	AI_Output(other,self,"DIA_Andre_PERM_15_00");	//Jak to vypadá ve městě?
	AI_Output(self,other,"DIA_Andre_PERM_08_01");	//Všechno je pod kontrolou.
	if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Andre_PERM_08_02");	//Pokračuj ve svém poslání.
	};
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Andre_PERM_08_03");	//Od této chvíle se hlásíš přímo lordu Hagenovi. Běž si s ním promluvit.
	};
};


instance DIA_Andre_BerichtDrachenTot(C_Info)
{
	npc = MIL_311_Andre;
	nr = 1;
	condition = DIA_Andre_BerichtDrachenTot_Condition;
	information = DIA_Andre_BerichtDrachenTot_Info;
	permanent = FALSE;
	description = "Pobil jsem všechny draky v Hornickém údolí!";
};


func int DIA_Andre_BerichtDrachenTot_Condition()
{
	if((Kapitel == 5) && (MIS_ORCGREATWAR == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Andre_BerichtDrachenTot_Info()
{
	AI_Output(other,self,"DIA_Andre_Add_15_15");	//Pobil jsem všechny draky v Hornickém údolí!
	AI_Output(self,other,"DIA_Andre_Add_08_08");	//Pokud to je pravda, musíš o tom říct lordu Hagenovi.
	B_Andre_GotoLordHagen();
};


instance DIA_Andre_BerichtTorAuf(C_Info)
{
	npc = MIL_311_Andre;
	nr = 1;
	condition = DIA_Andre_BerichtTorAuf_Condition;
	information = DIA_Andre_BerichtTorAuf_Info;
	permanent = FALSE;
	description = "Na hrad v Hornickém údolí zaútočili skřeti!";
};


func int DIA_Andre_BerichtTorAuf_Condition()
{
	if((Kapitel == 5) && (MIS_OCGateOpen == TRUE) && Npc_KnowsInfo(other,DIA_Andre_BerichtDrachenTot))
	{
		return TRUE;
	};
};

func void DIA_Andre_BerichtTorAuf_Info()
{
	AI_Output(other,self,"DIA_Andre_Add_15_16");	//Na hrad v Hornickém údolí zaútočili skřeti!
	AI_Output(self,other,"DIA_Andre_Add_08_09");	//Ne! O tom se musí dozvědět lord Hagen.
	B_Andre_GotoLordHagen();
};

instance DIA_ANDRE_GUILDKILL(C_Info)
{
	npc = MIL_311_Andre;
	nr = 1;
	condition = dia_andre_guildkill_condition;
	information = dia_andre_guildkill_info;
	permanent = FALSE;
	description = "Můžu pro tebe něco udělat?";
};

func int dia_andre_guildkill_condition()
{
	if((other.guild == GIL_MIL) && (MIS_Andre_WAREHOUSE == LOG_SUCCESS) && (STARTKILLERWAY == FALSE) && (CHIEFKILLERISDEAD == FALSE) && (CassiaIsDead == FALSE) && (RamirezIsDead == FALSE))
	{
		return TRUE;
	};
};

func void dia_andre_guildkill_info()
{
	AI_Output(other,self,"DIA_Andre_GuildKill_01_00");	//Můžu pro tebe něco udělat?
	AI_Output(self,other,"DIA_Andre_GuildKill_01_01");	//Ano, je tady další problém. A to dost vážný.
	AI_Output(self,other,"DIA_Andre_GuildKill_01_03");	//Znepokojuje mě, jak se poslední dobou šíří zvěsti, že se ve městě objevil cech vrahů.
	AI_Output(self,other,"DIA_Andre_GuildKill_01_06");	//Musíme nějak tenhle problém vyřešit rychleji, než nám přeroste přes hlavu - a čím dříve, tím lépe.
	AI_Output(other,self,"DIA_Andre_GuildKill_01_07");	//Co budeme dělat?
	AI_Output(self,other,"DIA_Andre_GuildKill_01_09");	//O těchhle lidech téměř nic nevíme. Tedy, kromě jména jejich vůdce.
	AI_Output(self,other,"DIA_Andre_GuildKill_01_11");	//Jmenuje se Asmal. Prý je to velice nebezpečný a krvelačný chlápek.
	AI_Output(self,other,"DIA_Andre_GuildKill_01_12");	//Takže pokud se mu dostaneš na stopu, buď opatrný!
	AI_Output(other,self,"DIA_Andre_GuildKill_01_13");	//Až ten cech vrahů najdu?
	AI_Output(self,other,"DIA_Andre_GuildKill_01_14");	//Pokus se získat si jejich důvěru a zjistit o nich více. Nebo se s nimi prostě vypořádej.
	AI_Output(self,other,"DIA_Andre_GuildKill_01_15");	//Pokud si myslíš, že to nezvládneš, jen mi řekni jejich jména a kde je jejich úkryt.
	STARTKILLERWAY_ANDRE = TRUE;
	MIS_GUILDKILL = LOG_Running;
	Log_CreateTopic(TOPIC_GUILDKILL,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GUILDKILL,LOG_Running);
	B_LogEntry(TOPIC_GUILDKILL,"Lord Andre je znepokojen zvěstmi, že se v Khorinisu objevil cech vrahů. Aby předešel nečekaným komplikacím a upokojil občany města, požádal mě, abych tuhle záležitost co nejdříve vyšetřil. Nedovedl mi o tomhle cechu poskytnout moc informací, ale zmínil, že ho vede Asmal - nebezpečný a prohnaný chlápek. V každém případě, pokud mám tyhle lidi dopadnout, lord Andre mi jasně řekl, že se můžu pokusit získat si jejich důvěru a zjistit o nich více, nebo se s nimi prostě vypořádat.");
};


instance DIA_ANDRE_GUILDKILLNEWS(C_Info)
{
	npc = MIL_311_Andre;
	nr = 1;
	condition = dia_andre_guildkillnews_condition;
	information = dia_andre_guildkillnews_info;
	permanent = TRUE;
	description = "Ohledně cechu vrahů...";
};


func int dia_andre_guildkillnews_condition()
{
	if((MIS_GUILDKILL == LOG_Running) && (MIS_ORCGREATWAR == FALSE))
	{
		return TRUE;
	};
};

func void dia_andre_guildkillnews_info()
{
	AI_Output(other,self,"DIA_Andre_GuildKillNews_01_00");	//Ohledně cechu vrahů...
	AI_Output(self,other,"DIA_Andre_GuildKillNews_01_01");	//Ano? Zjistil jsi něco?

	if((CHIEFKILLERISDEAD == TRUE) && (GUILDKILLISDEAD == FALSE))
	{
		AI_Output(other,self,"DIA_Andre_GuildKillNews_01_02");	//Asmal je mrtvý!
		AI_Output(self,other,"DIA_Andre_GuildKillNews_01_03");	//Takže jsi dokázal vystopovat a zabít toho parchanta. To jsou výtečné zprávy!
		AI_Output(self,other,"DIA_Andre_GuildKillNews_01_04");	//To by mělo stačit, aby byli obyvatelé města opět klidní.
		AI_Output(self,other,"DIA_Andre_GuildKillNews_01_05");	//Bez vůdce už tihle lidé nejsou tak nebezpeční.
		AI_Output(self,other,"DIA_Andre_GuildKillNews_01_06");	//Dobrá práce! Tady, vezmi si tohle zlato - zasloužil sis ho!
		B_GiveInvItems(self,other,ItMi_Gold,500);
		MIS_GUILDKILL = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_GUILDKILL,LOG_SUCCESS);
		B_LogEntry(TOPIC_GUILDKILL,"Lord Andre byl potěšen, když slyšel, že jsem se vypořádal s vůdcem cechu vrahů, Asmalem. Věří, že to k uklidnění občanů bude stačit.");
	}
	else if(GUILDKILLISDEAD == TRUE)
	{
		AI_Output(other,self,"DIA_Andre_GuildKillNews_01_07");	//Vyřídil jsem to s nimi. Už na to můžeš zapomenout!
		AI_Output(self,other,"DIA_Andre_GuildKillNews_01_08");	//Takže jsi to dokázal? (překvapeně) To jsou výtečné zprávy!
		AI_Output(self,other,"DIA_Andre_GuildKillNews_01_10");	//Dobrá práce! Tady, vezmi si tohle zlato - zasloužil sis ho!
		B_GiveInvItems(self,other,ItMi_Gold,1000);
		MIS_GUILDKILL = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_GUILDKILL,LOG_SUCCESS);
		B_LogEntry(TOPIC_GUILDKILL,"Lord Andre byl potěšen, když slyšel, že jsem se vypořádal s cechem vrahů.");
	}
	else if(GUILDKILLKNOWNLOC == TRUE)
	{
		if(KILLFINISH == TRUE)
		{
			B_GivePlayerXP(200);
			AI_Output(other,self,"DIA_Andre_GuildKillNews_01_11");	//Zjistil jsem, kdo jsou ti lidé!
			AI_Output(self,other,"DIA_Andre_GuildKillNews_01_12");	//A?
			AI_Output(other,self,"DIA_Andre_GuildKillNews_01_13");	//Potulní muzikanti, kteří přišli do města před několika týdny. Obvykle vystupují na tržišti.
			AI_Output(other,self,"DIA_Andre_GuildKillNews_01_14");	//Muž jménem Gillian není nikdo jiný než samotný Asmal!
			AI_Output(self,other,"DIA_Andre_GuildKillNews_01_15");	//Hmm... (užasle) To bych si nikdy nepomyslel.
			AI_Output(self,other,"DIA_Andre_GuildKillNews_01_17");	//No, v tom případě... Dobře! Okamžitě dám strážím povel k jejich zatčení.
			AI_Output(other,self,"DIA_Andre_GuildKillNews_01_18");	//S tím by mohl být problém.
			AI_Output(self,other,"DIA_Andre_GuildKillNews_01_19");	//Proč myslíš?
			AI_Output(other,self,"DIA_Andre_GuildKillNews_01_20");	//Asmal a jeho lidi opustili město a nemyslím, že se chystají vrátit. Je to pro ně příliš nebezpečné!
			AI_Output(other,self,"DIA_Andre_GuildKillNews_01_22");	//Teď se zabydleli nedaleko Onarovy farmy.
			AI_Output(self,other,"DIA_Andre_GuildKillNews_01_26");	//Dobrá. Hlavní je, že cech vrahů už nebude otravovat občany města.
			AI_Output(self,other,"DIA_Andre_GuildKillNews_01_27");	//A co se tebe týče - dobrá práce! Tady, vezmi si tohle zlato - zasloužil sis ho!
			B_GiveInvItems(self,other,ItMi_Gold,150);
			MIS_GUILDKILL = LOG_SUCCESS;
			Log_SetTopicStatus(TOPIC_GUILDKILL,LOG_SUCCESS);
			B_LogEntry(TOPIC_GUILDKILL,"Řekl jsem lordu Andremu jména členů cechu vrahů a on mi poděkoval za mou pomoc. Byl však poněkud zklamán, že Asmalovi a jeho lidem se povedlo utéct z města. Teď už nebude mít moc příležitostí se s nimi vypořádat.");
		}
		else
		{
			B_GivePlayerXP(150);
			AI_Output(other,self,"DIA_Andre_GuildKillNews_01_28");	//Zjistil jsem, kdo jsou ti lidé!
			AI_Output(self,other,"DIA_Andre_GuildKillNews_01_29");	//A?
			AI_Output(other,self,"DIA_Andre_GuildKillNews_01_30");	//Potulní muzikanti, kteří přišli do města před několika týdny. Obvykle vystupují na tržišti.
			AI_Output(other,self,"DIA_Andre_GuildKillNews_01_31");	//Muž jménem Gillian není nikdo jiný než samotný Asmal!
			AI_Output(other,self,"DIA_Andre_GuildKillNews_01_34");	//Právě teď se všichni ukrývají v opuštěném baráku na nábřeží, nedaleko paladinské lodi.
			AI_Output(self,other,"DIA_Andre_GuildKillNews_01_35");	//No, v tom případě... Dobře! Okamžitě dám strážím povel k jejich zatčení.
			AI_Output(self,other,"DIA_Andre_GuildKillNews_01_36");	//A co se tebe týče - dobrá práce! Tady, vezmi si tohle zlato - zasloužil sis ho!
			B_GiveInvItems(self,other,ItMi_Gold,150);
			MIS_GUILDKILL = LOG_SUCCESS;
			Log_SetTopicStatus(TOPIC_GUILDKILL,LOG_SUCCESS);
			B_LogEntry(TOPIC_GUILDKILL,"Řekl jsem lordu Andremu jména členů cechu vrahů a on mi poděkoval za mou pomoc. Ujistil mě, že zbytek už zařídí domobrana.");
			B_KillNpc(PIR_1390_Addon_InExtremo_DrPymonte);
			B_KillNpc(PIR_1391_Addon_InExtremo_TheFlail);
			B_KillNpc(PIR_1395_Addon_InExtremo_Lutter);
			B_KillNpc(PIR_1396_Addon_InExtremo_Flex);
			B_KillNpc(pir_1397_addon_inextremo_charlotte);
			B_KillNpc(pir_1398_addon_inextremo_announcer);
		};
	}
	else if((MEETKILLLATE == TRUE) && (MEETKILLLATELOG == TRUE))
	{
		AI_Output(other,self,"DIA_Andre_GuildKillNews_01_37");	//Myslím, že jsem ten úkol zpackal.
		AI_Output(self,other,"DIA_Andre_GuildKillNews_01_38");	//CO?! Proč to říkáš?
		AI_Output(other,self,"DIA_Andre_GuildKillNews_01_39");	//Domluvil jsem si schůzku, na které jsem se mohl dozvědět něco o cechu vrahů, ale propásl jsem ji.
		AI_Output(self,other,"DIA_Andre_GuildKillNews_01_41");	//Jak jsi to mohl dopustit? Teď už asi nezjistíš nic dalšího.
		AI_Output(self,other,"DIA_Andre_GuildKillNews_01_42");	//V pořádku. Co už naděláme. Možná najdeme nějaký jiný způsob, jak ty parchanty obelstít, ale pochybuji o tom.
		AI_Output(self,other,"DIA_Andre_GuildKillNews_01_43");	//(naštvaně) Zatraceně!
		MIS_GUILDKILL = LOG_FAILED;
		B_LogEntry_Failed(TOPIC_GUILDKILL);
	}
	else
	{
		AI_Output(other,self,"DIA_Andre_GuildKillNews_01_44");	//Zatím ne.
		AI_Output(self,other,"DIA_Andre_GuildKillNews_01_45");	//Pak mě neruš od mých povinností!
		AI_Output(self,other,"DIA_Andre_GuildKillNews_01_46");	//Vrať se, až budeš něco vědět.
	};
};


instance DIA_ANDRE_SARAHTOGUILD(C_Info)
{
	npc = MIL_311_Andre;
	nr = 1;
	condition = dia_andre_sarahtoguild_condition;
	information = dia_andre_sarahtoguild_info;
	permanent = FALSE;
	description = "Chci zaplatit pokutu za jistého zločince.";
};


func int dia_andre_sarahtoguild_condition()
{
	if((SARAHELPYOUANDFREE == TRUE) && (Sarah_Ausgeliefert == TRUE) && (MIS_SARAHTOGUILD == LOG_Running) && (MIS_ORCGREATWAR == FALSE))
	{
		return TRUE;
	};
};

func void dia_andre_sarahtoguild_info()
{
	AI_Output(other,self,"DIA_Andre_SarahToGuild_01_00");	//Chci zaplatit pokutu za jistého zločince.
	AI_Output(self,other,"DIA_Andre_SarahToGuild_01_01");	//Dobře. A za koho?
	AI_Output(other,self,"DIA_Andre_SarahToGuild_01_02");	//Za obchodnici jménem Sarah.
	AI_Output(self,other,"DIA_Andre_SarahToGuild_01_03");	//Sarah? Hmm... (zamyšleně) Je obviněna, že prodávala zbraně Onarovým žoldákům.
	AI_Output(self,other,"DIA_Andre_SarahToGuild_01_04");	//To je těžký zločin!
	AI_Output(other,self,"DIA_Andre_SarahToGuild_01_05");	//Já vím. Jaká je tedy cena za její svobodu?
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Andre_SarahToGuild_01_06");	//Nech mě přemýšlet... (zamyšleně) Když vezmu v úvahu závažnost jejího zločinu...
		AI_Output(self,other,"DIA_Andre_SarahToGuild_01_07");	//... a fakt, že se za ní přimlouvá ctihodný mág Ohně...
		AI_Output(self,other,"DIA_Andre_SarahToGuild_01_08");	//Myslím, že tři sta zlatých bude za stažení obvinění stačit!
		B_LogEntry(TOPIC_SARAHTOGUILD,"Lord Andre ustanovil pokutu pro obchodnici Sarah na sumu 300 zlatých.");
		SARASHULDEN = 300;
	}
	else if(other.guild == GIL_KDW)
	{
		AI_Output(self,other,"DIA_Andre_SarahToGuild_01_09");	//Nech mě přemýšlet... (zamyšleně) Když vezmu v úvahu závažnost jejího zločinu...
		AI_Output(self,other,"DIA_Andre_SarahToGuild_01_10");	//... a fakt, že se za ní přimlouvá ctihodný mág Vody...
		AI_Output(self,other,"DIA_Andre_SarahToGuild_01_11");	//Myslím, že čtyři sta zlatých bude za stažení obvinění stačit!
		B_LogEntry(TOPIC_SARAHTOGUILD,"Lord Andre ustanovil pokutu pro obchodnici Sarah na sumu 400 zlatých.");
		SARASHULDEN = 400;
	}
	else if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Andre_SarahToGuild_01_12");	//Nech mě přemýšlet... (zamyšleně) Když vezmu v úvahu závažnost jejího zločinu...
		AI_Output(self,other,"DIA_Andre_SarahToGuild_01_13");	//... a fakt, že se za ní přimlouvá paladin, můj bratr...
		AI_Output(self,other,"DIA_Andre_SarahToGuild_01_14");	//Myslím, že tři sta zlatých bude za stažení obvinění stačit!
		B_LogEntry(TOPIC_SARAHTOGUILD,"Lord Andre ustanovil pokutu pro obchodnici Sarah na sumu 300 zlatých.");
		SARASHULDEN = 300;
	}
	else if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Andre_SarahToGuild_01_15");	//Nech mě přemýšlet... (zamyšleně) Když vezmu v úvahu závažnost jejího zločinu...
		AI_Output(self,other,"DIA_Andre_SarahToGuild_01_16");	//... a fakt, že se za ní přimlouvá člověk z městské gardy...
		AI_Output(self,other,"DIA_Andre_SarahToGuild_01_17");	//Myslím, že pět set zlatých bude za stažení obvinění stačit!
		B_LogEntry(TOPIC_SARAHTOGUILD,"Lord Andre ustanovil pokutu pro obchodnici Sarah na sumu 500 zlatých.");
		SARASHULDEN = 500;
	}
	else if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Andre_SarahToGuild_01_18");	//Nech mě přemýšlet... (zamyšleně) Když vezmu v úvahu závažnost jejího zločinu...
		AI_Output(self,other,"DIA_Andre_SarahToGuild_01_19");	//... a fakt, že se za ní přimlouvá žoldák... (šklebí se)
		AI_Output(self,other,"DIA_Andre_SarahToGuild_01_20");	//Myslím, že 1 500 zlatých bude za stažení obvinění stačit!
		AI_Output(other,self,"DIA_Andre_SarahToGuild_01_21");	//Tedy!
		B_LogEntry(TOPIC_SARAHTOGUILD,"Lord Andre ustanovil pokutu pro obchodnici Sarah na sumu 1 500 zlatých.");
		SARASHULDEN = 1500;
	}
	else
	{
		AI_Output(self,other,"DIA_Andre_SarahToGuild_01_22");	//Nech mě přemýšlet... (zamyšleně) Když vezmu v úvahu závažnost jejího zločinu...
		AI_Output(self,other,"DIA_Andre_SarahToGuild_01_23");	//Myslím, že tisíc zlatých bude za stažení obvinění stačit!
		AI_Output(other,self,"DIA_Andre_SarahToGuild_01_24");	//Tedy!
		B_LogEntry(TOPIC_SARAHTOGUILD,"Lord Andre ustanovil pokutu pro obchodnici Sarah na sumu 1 000 zlatých.");
		SARASHULDEN = 1000;
	};
	AI_Output(self,other,"DIA_Andre_SarahToGuild_01_25");	//To je moje rozhodnutí.
	AI_Output(other,self,"DIA_Andre_SarahToGuild_01_26");	//Jasný.
};


instance DIA_ANDRE_SARAHTOGUILDPAY(C_Info)
{
	npc = MIL_311_Andre;
	nr = 1;
	condition = dia_andre_sarahtoguildpay_condition;
	information = dia_andre_sarahtoguildpay_info;
	permanent = TRUE;
	description = "Pusť Sarah.";
};


func int dia_andre_sarahtoguildpay_condition()
{
	if((SARAHELPYOUANDFREE == TRUE) && (Sarah_Ausgeliefert == TRUE) && (SARASHULDEN > 0) && (SARAISFREE == FALSE) && (MIS_SARAHTOGUILD == LOG_Running) && (MIS_ORCGREATWAR == FALSE))
	{
		return TRUE;
	};
};

func void dia_andre_sarahtoguildpay_info()
{
	AI_Output(other,self,"DIA_Andre_SarahToGuildPay_01_00");	//Propusť obchodnici Sarah.
	AI_Output(self,other,"DIA_Andre_SarahToGuildPay_01_01");	//A kde jsou peníze, které máš zaplatit jako pokutu za její zločiny?
	if(Npc_HasItems(other,ItMi_Gold) >= SARASHULDEN)
	{
		B_GivePlayerXP(200);
		Npc_RemoveInvItems(other,ItMi_Gold,SARASHULDEN);
		AI_Output(other,self,"DIA_Andre_SarahToGuildPay_01_02");	//Tady je tvé zlato.
		AI_Output(self,other,"DIA_Andre_SarahToGuildPay_01_03");	//Výtečně! Zařídím, aby byly všechny obvinění na obchodnici Sarah staženy.
		AI_Output(self,other,"DIA_Andre_SarahToGuildPay_01_04");	//Je volná.
		B_LogEntry(TOPIC_SARAHTOGUILD,"Osvobodil jsem Sarah z vězení. Teď bych si s ní měl jít promluvit.");
		SARAISFREE = TRUE;
		Npc_ExchangeRoutine(VLK_470_Sarah,"InTavern");
		AI_Teleport(Sarah,"NW_TAVERNE_IN_10");
	}
	else
	{
		AI_Output(other,self,"DIA_Andre_SarahToGuildPay_01_06");	//Ještě je nemám.
		AI_Output(self,other,"DIA_Andre_SarahToGuildPay_01_07");	//Tak se vrať, až je mít budeš.
	};
};


instance DIA_ANDRE_HANNAINPRISION(C_Info)
{
	npc = MIL_311_Andre;
	nr = 1;
	condition = dia_andre_hannainprision_condition;
	information = dia_andre_hannainprision_info;
	permanent = FALSE;
	description = "Proč jste zatkli Hannu?";
};


func int dia_andre_hannainprision_condition()
{
	if((MIS_ABIGEILHELPHANNA == LOG_Running) && (KNOWSHANNAINPRISION == TRUE) && (MIS_ORCGREATWAR == FALSE))
	{
		return TRUE;
	};
};

func void dia_andre_hannainprision_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Andre_HannaInPrision_01_00");	//Proč jste zatkli Hannu?
	AI_Output(self,other,"DIA_Andre_HannaInPrision_01_01");	//Byla obviněna z krádeže.
	AI_Output(other,self,"DIA_Andre_HannaInPrision_01_02");	//To musí být nějaký omyl!
	AI_Output(self,other,"DIA_Andre_HannaInPrision_01_03");	//(zadumaně) Taky jsem tomu nechtěl uvěřit, ale důkazy naneštěstí říkají něco jiného.
	AI_Output(other,self,"DIA_Andre_HannaInPrision_01_04");	//Jaké důkazy?
	AI_Output(self,other,"DIA_Andre_HannaInPrision_01_07");	//V její truhle byli nalezeny věci obchodníka Hakona a kupec jménem Gaspar ji viděl, jak se mu hrabe v jeho truhle.
	AI_Output(other,self,"DIA_Andre_HannaInPrision_01_08");	//Gaspar?! To je ten svědek?
	AI_Output(other,self,"DIA_Andre_HannaInPrision_01_10");	//Právě on teď totiž vede Hannin hotel.
	AI_Output(other,self,"DIA_Andre_HannaInPrision_01_11");	//To je dost podezřelé!
	AI_Output(self,other,"DIA_Andre_HannaInPrision_01_13");	//Spravedlnost zajímají jenom důkazy a fakta, a ty ukazují na Hannu.
	AI_Output(other,self,"DIA_Andre_HannaInPrision_01_14");	//A pokud získám důkaz o její nevině?
	AI_Output(self,other,"DIA_Andre_HannaInPrision_01_16");	//Dokud ho nemáš...
	KNOWSHANNAINPRISIONHAKON = TRUE;
	B_LogEntry(TOPIC_ABIGEILHELPHANNA,"Andre mi řekl, že byl okraden obchodník jménem Hakon. Klíčovým svědkem není nikdo jiný než Gaspar, nový majitel hotelu. Nejdříve bych si měl si oběma důkladně promluvit.");
	Log_AddEntry(TOPIC_ABIGEILHELPHANNA,"Pokud chci Hannu dostat ven z vězení, musím přinést lordu Andremu důkaz o její nevině.");
	AI_StopProcessInfos(self);
};


instance DIA_ANDRE_HANNAINPRISIONDONE(C_Info)
{
	npc = MIL_311_Andre;
	nr = 1;
	condition = dia_andre_hannainprisiondone_condition;
	information = dia_andre_hannainprisiondone_info;
	permanent = FALSE;
	description = "Mám důkazy proti Gasparovi!";
};


func int dia_andre_hannainprisiondone_condition()
{
	if((MIS_ABIGEILHELPHANNA == LOG_Running) && (Npc_HasItems(other,itri_hakonmissring) >= 1) && (JOTELLSGASPAR == TRUE) && (MIS_ORCGREATWAR == FALSE))
	{
		return TRUE;
	};
};

func void dia_andre_hannainprisiondone_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Andre_HannaInPrisionDone_01_00");	//Mám důkazy proti Gasparovi!
	AI_Output(other,self,"DIA_Andre_HannaInPrisionDone_01_02");	//Tady je prsten, který byl ukraden obchodníkovi Hakonovi.
	AI_Output(other,self,"DIA_Andre_HannaInPrisionDone_01_04");	//Gaspar tímhle prstenem zaplatil chlápkovi jménem Joe.
	AI_Output(other,self,"DIA_Andre_HannaInPrisionDone_01_05");	//Ten parchant ho najmul, aby odlákal Hanninu pozornost.
	AI_Output(other,self,"DIA_Andre_HannaInPrisionDone_01_07");	//Gaspar se mezitím přeplížil do hotelu a okradl Hakona.
	AI_Output(other,self,"DIA_Andre_HannaInPrisionDone_01_08");	//Pak hodil ukradené věci do Hanniny truhly a prsten dal Joeovi jako odměnu.
	AI_Output(self,other,"DIA_Andre_HannaInPrisionDone_01_09");	//Je to pravda?
	AI_Output(other,self,"DIA_Andre_HannaInPrisionDone_01_10");	//Joe ti to potvrdí.
	AI_Output(self,other,"DIA_Andre_HannaInPrisionDone_01_11");	//(vážně) Dobře, přesvědčil jsi mě.
	AI_Output(self,other,"DIA_Andre_HannaInPrisionDone_01_12");	//Gaspara nechám okamžitě zatknout a všechna obvinění proti Hanně budou stažena.
	AI_Output(self,other,"DIA_Andre_HannaInPrisionDone_01_15");	//Teď můžeš jít, já všechno zařídím.
	AI_StopProcessInfos(self);
	B_LogEntry(TOPIC_ABIGEILHELPHANNA,"Lord Andre vzal do úvahy mé důkazy proti Gasparovi a shledal ho vinným z krádeže věcí obchodníka Hakona. Hanna je teď konečně svobodná.");
	GASPARPISSOFF = TRUE;
	HANNAISFREE = TRUE;
	Npc_ExchangeRoutine(VLK_414_Hanna,"Start");
	Npc_ExchangeRoutine(vlk_6137_gaspar,"InPrision");
	AI_Teleport(gaspar,"NW_CITY_HANNA_INPRISION");
	AI_Teleport(hanna,"NW_CITY_HANNA");
};


instance DIA_ANDRE_IGNAZDEAD(C_Info)
{
	npc = MIL_311_Andre;
	nr = 3;
	condition = dia_andre_ignazdead_condition;
	information = dia_andre_ignazdead_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_andre_ignazdead_condition()
{
	if(KILLHAPPENSMADE == TRUE)
	{
		return TRUE;
	};
};

func void dia_andre_ignazdead_info()
{
	AI_Output(self,other,"DIA_Andre_IgnazDead_01_00");	//Počkej... Potřebuji s tebou nutně mluvit.
	AI_Output(self,other,"DIA_Andre_IgnazDead_01_02");	//Za jistých nepochopitelných okolností došlo ve městě ke hrozné vraždě.
	AI_Output(self,other,"DIA_Andre_IgnazDead_01_03");	//Obětí je Ignaz - alchymista, který bydlel v přístavní čtvrti.
	AI_Output(self,other,"DIA_Andre_IgnazDead_01_05");	//Zdá se, že ho někdo otrávil. A mým posvátným posláním je potrestat tenhle zločin.
	AI_Output(other,self,"DIA_Andre_IgnazDead_01_06");	//Co ode mne potřebuješ?
	AI_Output(self,other,"DIA_Andre_IgnazDead_01_10");	//Projdi se po městě, zeptej se lidí - možná někdo něco uviděl, jen se o tom bojí promluvit.
	AI_Output(other,self,"DIA_Andre_IgnazDead_01_14");	//Dobrá! Pokud něco zjistím, řeknu ti to.
	AI_Output(self,other,"DIA_Andre_IgnazDead_01_15");	//Skvělé. Tak už jdi.
	MIS_KILLIGNAZ = LOG_Running;
	Log_CreateTopic(TOPIC_KILLIGNAZ,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KILLIGNAZ,LOG_Running);
	B_LogEntry(TOPIC_KILLIGNAZ,"Lord Andre mě opět požádal o pomoc. Tentokrát mě požádal, abych se podíval na vraždu alchymisty Ignaze. Zřejmě ho někdo otrávil.");
	AI_StopProcessInfos(self);
};


instance DIA_ANDRE_IGNAZFOUNDKILL_V1(C_Info)
{
	npc = MIL_311_Andre;
	nr = 3;
	condition = dia_andre_ignazfoundkill_v1_condition;
	information = dia_andre_ignazfoundkill_v1_info;
	permanent = FALSE;
	description = "Našel jsem vraha.";
};


func int dia_andre_ignazfoundkill_v1_condition()
{
	if((MIS_KILLIGNAZ == LOG_Running) && (CONSTANTINOFUCKOFF == TRUE) && Npc_HasItems(hero,itmi_poisonbottle))
	{
		return TRUE;
	};
};

func void dia_andre_ignazfoundkill_v1_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Andre_IgnazFoundKill_V1_01_00");	//Našel jsem vraha.
	AI_Output(self,other,"DIA_Andre_IgnazFoundKill_V1_01_01");	//A kdo to je?
	AI_Output(other,self,"DIA_Andre_IgnazFoundKill_V1_01_02");	//Městský alchymista Constantino!
	AI_Output(self,other,"DIA_Andre_IgnazFoundKill_V1_01_03");	//Constantino?! (překvapeně) Jsi si jistý?
	AI_Output(other,self,"DIA_Andre_IgnazFoundKill_V1_01_04");	//Tady, v Ignazově domě jsem našel tuhle láhev s jedem, který mu patřil.
	B_GiveInvItems(other,self,itmi_poisonbottle,1);
	AI_Output(self,other,"DIA_Andre_IgnazFoundKill_V1_01_07");	//Pokud máš tedy důkaz jeho viny, okamžitě ho nechám zatknout.
	AI_Output(self,other,"DIA_Andre_IgnazFoundKill_V1_01_08");	//A chci ti poděkovat za tvoji pomoc v téhle záležitosti.
	AI_Output(self,other,"DIA_Andre_IgnazFoundKill_V1_01_09");	//Přijmi tohle zlato jako znak mých díků.
	B_GiveInvItems(self,other,ItMi_Gold,200);
	MIS_KILLIGNAZ = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_KILLIGNAZ,LOG_SUCCESS);
	B_LogEntry(TOPIC_KILLIGNAZ,"Řekl jsem lordu Andremu o svém podezření ohledně Constantina a dal jsem mu nalezenou láhev, takže neměl žádné pochybnosti o tom, kdo zavraždil Ignaze.");
	Npc_ExchangeRoutine(VLK_417_Constantino,"InPrision");
	AI_Teleport(VLK_417_Constantino,"NW_CITY_ALHIMIK_INPRISION");
};


instance DIA_ANDRE_IGNAZFOUNDKILL_V2(C_Info)
{
	npc = MIL_311_Andre;
	nr = 3;
	condition = dia_andre_ignazfoundkill_v2_condition;
	information = dia_andre_ignazfoundkill_v2_info;
	permanent = FALSE;
	description = "Našel jsem vraha.";
};


func int dia_andre_ignazfoundkill_v2_condition()
{
	if((MIS_KILLIGNAZ == LOG_Running) && (KARRASTELLABOUTIGNAZ == TRUE) && Npc_HasItems(hero,itwr_ortegoletter) && (READORTEGO == TRUE))
	{
		return TRUE;
	};
};

func void dia_andre_ignazfoundkill_v2_info()
{
	AI_Output(other,self,"DIA_Andre_IgnazFoundKill_V2_01_00");	//Našel jsem vraha.
	AI_Output(self,other,"DIA_Andre_IgnazFoundKill_V2_01_01");	//Pokud máš pravdu, jsou to skvělé zprávy. A kdo to je?
	AI_Output(other,self,"DIA_Andre_IgnazFoundKill_V2_01_02");	//Jistý chlap jménem Ortego.
	AI_Output(other,self,"DIA_Andre_IgnazFoundKill_V2_01_06");	//Našel jsem u něj tenhle dopis. Všechno je v něm.
	B_GiveInvItems(other,self,itwr_ortegoletter,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Andre_IgnazFoundKill_V2_01_07");	//Zřejmě máš pravdu.
	AI_Output(self,other,"DIA_Andre_IgnazFoundKill_V2_01_08");	//Nicméně, jak jsem z toho dopisu vyčetl, nekonal sám za sebe.
	AI_Output(self,other,"DIA_Andre_IgnazFoundKill_V2_01_09");	//Zjistil jsi, kdo další za tím stojí?
	ConstForgiven = TRUE;
	Info_ClearChoices(dia_andre_ignazfoundkill_v2);
	Info_AddChoice(dia_andre_ignazfoundkill_v2,"Byl to jeden z mágů Ohně!",dia_andre_ignazfoundkill_v2_yes);
	Info_AddChoice(dia_andre_ignazfoundkill_v2,"To nevím.",dia_andre_ignazfoundkill_v2_no);
};

func void dia_andre_ignazfoundkill_v2_yes()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Andre_IgnazFoundKill_V2_Yes_01_01");	//Byl to jeden z mágů Ohně!
	AI_Output(self,other,"DIA_Andre_IgnazFoundKill_V2_Yes_01_02");	//(vykolejeně) Mág Ohně?! To není možné! Co to říkáš?
	AI_Output(other,self,"DIA_Andre_IgnazFoundKill_V2_Yes_01_03");	//Říkám pouze to, co jsem se dozvěděl.
	AI_Output(self,other,"DIA_Andre_IgnazFoundKill_V2_Yes_01_04");	//Hmm... (podrážděně) Dobrá. Řekněme, že máš pravdu.
	AI_Output(self,other,"DIA_Andre_IgnazFoundKill_V2_Yes_01_05");	//Musíš nicméně pochopit, že takové řeči by měli vážné důsledky.
	AI_Output(self,other,"DIA_Andre_IgnazFoundKill_V2_Yes_01_06");	//Pokud by se to lidé dozvěděli, přišli by o víru v mágy Ohně a dokonce i v samotného Innose!
	AI_Output(self,other,"DIA_Andre_IgnazFoundKill_V2_Yes_01_12");	//Ale stejně, řekni mi, který z mágů Ohně je zodpovědný za Ignazovu vraždu?
	AI_Output(other,self,"DIA_Andre_IgnazFoundKill_V2_Yes_01_13");	//Mluvil jsem s Karrasem, nicméně mi řekl, že tohle rozhodnutí podpořilo mnoho z jeho bratrů.
	AI_Output(self,other,"DIA_Andre_IgnazFoundKill_V2_Yes_01_15");	//Dobrá. S tím si už poradím sám.
	AI_Output(self,other,"DIA_Andre_IgnazFoundKill_V2_Yes_01_16");	//Rád bych ti poděkoval za tvoji pomoc v téhle záležitosti.
	AI_Output(self,other,"DIA_Andre_IgnazFoundKill_V2_Yes_01_17");	//Přijmi tohle zlato jako znak mých díků.
	B_GiveInvItems(self,other,ItMi_Gold,250);
	MIS_KILLIGNAZ = LOG_SUCCESS;
	TELLANDRETRUTH = TRUE;
	Log_SetTopicStatus(TOPIC_KILLIGNAZ,LOG_SUCCESS);
	B_LogEntry(TOPIC_KILLIGNAZ,"Řekl jsem lordu Andremu o Ortegovi a ukázal jsem mu jeho dopis. Také jsem zmínil spojení mágů Ohně s vraždou, které ho zneklidnilo. Teď je lord Andre ve velice delikátní situaci, ale řekl, že se s tím už nějak vypořádá.");
	Info_ClearChoices(dia_andre_ignazfoundkill_v2);
};

func void dia_andre_ignazfoundkill_v2_no()
{
	AI_Output(other,self,"DIA_Andre_IgnazFoundKill_V2_No_01_01");	//To nevím.
	AI_Output(self,other,"DIA_Andre_IgnazFoundKill_V2_No_01_02");	//Hmm... (zklamaně) To je škoda.
	AI_Output(self,other,"DIA_Andre_IgnazFoundKill_V2_No_01_03");	//Ale na druhou stranu - hlavní je, že se ti povedlo najít vraha.
	AI_Output(self,other,"DIA_Andre_IgnazFoundKill_V2_No_01_04");	//V každém případě, chci ti poděkovat za tvoji pomoc v téhle záležitosti.
	AI_Output(self,other,"DIA_Andre_IgnazFoundKill_V2_No_01_05");	//Tady, přijmi tohle zlato jako znak mých díků.
	B_GiveInvItems(self,other,ItMi_Gold,50);
	MIS_KILLIGNAZ = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_KILLIGNAZ,LOG_SUCCESS);
	B_LogEntry(TOPIC_KILLIGNAZ,"Řekl jsem lordu Andremu o Ortegovi a ukázal jsem mu jeho dopis. To mu stačilo, aby uzavřel tenhle případ. Myslím, že teď jsou všichni spokojeni - včetně mne.");
	Info_ClearChoices(dia_andre_ignazfoundkill_v2);
};


instance DIA_ANDRE_TOCONVICTS(C_Info)
{
	npc = MIL_311_Andre;
	nr = 3;
	condition = dia_andre_toconvicts_condition;
	information = dia_andre_toconvicts_info;
	permanent = FALSE;
	description = "Musím se jít podívat na vězně.";
};


func int dia_andre_toconvicts_condition()
{
	if((KAPITELORCATC == FALSE) && (PERMTOPRISON == FALSE) && ((hero.guild != GIL_PAL) || (hero.guild != GIL_MIL) || (hero.guild != GIL_KDW) || (hero.guild != GIL_KDF)))
	{
		return TRUE;
	};
};

func void dia_andre_toconvicts_info()
{
	AI_Output(other,self,"DIA_Andre_ToConvicts_01_00");	//Musím se jít podívat na vězně.
	AI_Output(self,other,"DIA_Andre_ToConvicts_01_01");	//Dobře! Můžeš za nimi jít.
	AI_Output(self,other,"DIA_Andre_ToConvicts_01_02");	//Ale pamatuj... (hrozivě) Pokud se pokusíš otevřít mříže, vyhlásím poplach!
	PERMTOPRISON = TRUE;
};