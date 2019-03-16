/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.00:

(2x) RhetorikSkillValue - opraveno navýšení rétoriky nad maximum
func void DIA_BDT_4568_KINJARTS_QuestAgain_IronOre - opraveno pořadí dialogů

*/




instance DIA_Hokurn_EXIT(C_Info)
{
	npc = DJG_712_Hokurn;
	nr = 999;
	condition = DIA_Hokurn_EXIT_Condition;
	information = DIA_Hokurn_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Hokurn_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Hokurn_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Hokurn_Hello(C_Info)
{
	npc = DJG_712_Hokurn;
	nr = 4;
	condition = DIA_Hokurn_Hello_Condition;
	information = DIA_Hokurn_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Hokurn_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (KAPITELORCATC == FALSE) && (HokFirstMeet == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hokurn_Hello_Info()
{
	AI_Output(self,other,"DIA_Hokurn_Hello_01_00");	//Nemáš něco k pití?
	AI_Output(other,self,"DIA_Hokurn_Hello_15_01");	//A asi to nemá být voda, co?
	AI_Output(self,other,"DIA_Hokurn_Hello_01_02");	//To teda ne, ksakru! Potřebuju nějakej alkohol, abych se konečně zbavil toho zatracenýho bolehlavu.
	AI_Output(self,other,"DIA_Hokurn_Hello_01_03");	//Jestli se brzo něčeho nenapiju, nejspíš mi pukne hlava.
	Info_ClearChoices(DIA_Hokurn_Hello);
	Info_AddChoice(DIA_Hokurn_Hello,"Pokusím se něco obstarat.",DIA_Hokurn_Hello_No);

	if((Npc_HasItems(other,ItFo_Beer) >= 1) || (Npc_HasItems(other,ItFo_Addon_Rum) >= 1) || (Npc_HasItems(other,ItFo_Addon_Grog) >= 1) || (Npc_HasItems(other,ItFo_Booze) >= 1) || (Npc_HasItems(other,ItFo_Wine) >= 1))
	{
		Info_AddChoice(DIA_Hokurn_Hello,"Tady, vezmi si tohle.",DIA_Hokurn_Hello_Yes);
	};
};

func void DIA_Hokurn_Hello_No()
{
	AI_Output(other,self,"DIA_Hokurn_Hello_No_15_00");	//Nemám nic, co bych ti mohl dát.
	AI_Output(self,other,"DIA_Hokurn_Hello_No_01_01");	//Tak zmizni!
	Info_ClearChoices(DIA_Hokurn_Hello);
	Info_AddChoice(DIA_Hokurn_Hello,Dialog_Ende,DIA_Hokurn_Hello_END);
	Info_AddChoice(DIA_Hokurn_Hello,"Ještě jedna věc...",DIA_Hokurn_Hello_ASK1);
};

func void DIA_Hokurn_Hello_ASK1()
{
	AI_Output(other,self,"DIA_Hokurn_Hello_ASK1_15_00");	//Ještě jedna věc...
	AI_Output(self,other,"DIA_Hokurn_Hello_ASK1_01_01");	//(povzdech) Tys mi nerozuměl? VYPADNI!
	Info_ClearChoices(DIA_Hokurn_Hello);
	Info_AddChoice(DIA_Hokurn_Hello,Dialog_Ende,DIA_Hokurn_Hello_END);
	Info_AddChoice(DIA_Hokurn_Hello,"Je to důležité.",DIA_Hokurn_Hello_ASK2);
};

func void DIA_Hokurn_Hello_ASK2()
{
	AI_Output(other,self,"DIA_Hokurn_Hello_ASK2_15_00");	//Je to důležité.
	AI_Output(self,other,"DIA_Hokurn_Hello_ASK2_01_01");	//(povzdech) Řekl sis o to.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Hokurn_Hello_END()
{
	AI_StopProcessInfos(self);
};

func void B_Hokurn_Sauf()
{
	AI_Output(self,other,"B_Hokurn_Sauf_01_00");	//(říhnutí) Ha, tohle jsem potřeboval!
	AI_Output(self,other,"B_Hokurn_Sauf_01_01");	//Teď můžu znova myslet s čistou hlavou. Co pro tebe můžu udělat?
};

func void b_hokurn_drinking()
{
	if(Npc_HasItems(other,ItFo_Booze) >= 1)
	{
		B_GiveInvItems(other,self,ItFo_Booze,1);
		B_UseItem(self,ItFo_Booze);
	}
	else if(Npc_HasItems(other,ItFo_Wine) >= 1)
	{
		B_GiveInvItems(other,self,ItFo_Wine,1);
		B_UseItem(self,ItFo_Wine);
	}
	else if(Npc_HasItems(other,ItFo_Beer) >= 1)
	{
		B_GiveInvItems(other,self,ItFo_Beer,1);
		B_UseItem(self,ItFo_Beer);
	}
	else if(Npc_HasItems(other,ItFo_Addon_Rum) >= 1)
	{
		B_GiveInvItems(other,self,ItFo_Addon_Rum,1);
		B_UseItem(self,ItFo_Addon_Rum);
	}
	else if(Npc_HasItems(other,ItFo_Addon_Grog) >= 1)
	{
		B_GiveInvItems(other,self,ItFo_Addon_Grog,1);
		B_UseItem(self,ItFo_Addon_Grog);
	};
	HokurnLastDrink = Wld_GetDay();
	HokurnGetsDrink = TRUE;
};

func void b_hokurn_taking()
{
	if(Npc_HasItems(other,ItFo_Booze) >= 1)
	{
		B_GiveInvItems(other,self,ItFo_Booze,1);
	}
	else if(Npc_HasItems(other,ItFo_Wine) >= 1)
	{
		B_GiveInvItems(other,self,ItFo_Wine,1);
	}
	else if(Npc_HasItems(other,ItFo_Beer) >= 1)
	{
		B_GiveInvItems(other,self,ItFo_Beer,1);
	}
	else if(Npc_HasItems(other,ItFo_Addon_Rum) >= 1)
	{
		B_GiveInvItems(other,self,ItFo_Addon_Rum,1);
	}
	else if(Npc_HasItems(other,ItFo_Addon_Grog) >= 1)
	{
		B_GiveInvItems(other,self,ItFo_Addon_Grog,1);
	};
};

func void DIA_Hokurn_Hello_Yes()
{
	AI_Output(other,self,"DIA_Hokurn_Hello_Yes_15_00");	//Tady, vezmi si tohle.
	b_hokurn_drinking();
	B_Hokurn_Sauf();
	Info_ClearChoices(DIA_Hokurn_Hello);
};


instance DIA_Hokurn_Drink(C_Info)
{
	npc = DJG_712_Hokurn;
	nr = 5;
	condition = DIA_Hokurn_Drink_Condition;
	information = DIA_Hokurn_Drink_Info;
	permanent = TRUE;
	description = "Tady máš něco k pití.";
};


func int DIA_Hokurn_Drink_Condition()
{
	if((KAPITELORCATC == FALSE) && (HokurnGetsDrink == FALSE) && ((Npc_HasItems(other,ItFo_Beer) >= 1) || (Npc_HasItems(other,ItFo_Addon_Rum) >= 1) || (Npc_HasItems(other,ItFo_Addon_Grog) >= 1) || (Npc_HasItems(other,ItFo_Booze) >= 1) || (Npc_HasItems(other,ItFo_Wine) >= 1)))
	{
		return TRUE;
	};
};

func void DIA_Hokurn_Drink_Info()
{
	AI_Output(other,self,"DIA_Hokurn_Drink_15_00");	//Tady máš něco k pití.
	AI_Output(self,other,"DIA_Hokurn_Drink_01_01");	//(dychtivě) Dej to sem!
	b_hokurn_drinking();
	B_Hokurn_Sauf();
};


instance DIA_Hokurn_Question(C_Info)
{
	npc = DJG_712_Hokurn;
	nr = 5;
	condition = DIA_Hokurn_Question_Condition;
	information = DIA_Hokurn_Question_Info;
	permanent = TRUE;
	description = "Potřebuju nějaké informace.";
};


func int DIA_Hokurn_Question_Condition()
{
	if((HokurnGetsDrink == FALSE) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hokurn_Question_Info()
{
	AI_Output(other,self,"DIA_Hokurn_Question_15_00");	//Potřebuju nějaké informace.
	AI_Output(self,other,"DIA_Hokurn_Question_01_01");	//(otráveně) Měl jsem dojem, že jsme si rozuměli. Mluvím jen s přáteli.
	AI_Output(self,other,"DIA_Hokurn_Question_01_02");	//A přátelé ti nabídnou něco k pití. Jasný? Teď odpal!
};


instance DIA_Hokurn_Learn(C_Info)
{
	npc = DJG_712_Hokurn;
	nr = 6;
	condition = DIA_Hokurn_Learn_Condition;
	information = DIA_Hokurn_Learn_Info;
	permanent = FALSE;
	description = "Hledám někoho, kdo by mě mohl něčemu naučit.";
};


func int DIA_Hokurn_Learn_Condition()
{
	if(HokurnGetsDrink == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Hokurn_Learn_Info()
{
	AI_Output(other,self,"DIA_Hokurn_Learn_15_00");	//Hledám někoho, kdo by mě mohl něčemu naučit.
	AI_Output(self,other,"DIA_Hokurn_Learn_01_01");	//Můžu ti ukázat pár věcí. Jsem nejlepší bojovník na míle daleko.
	AI_Output(self,other,"DIA_Hokurn_Learn_01_02");	//Jelikož jsme přátelé, udělám ti zvláštní cenu. 300 zlatých.
	Info_ClearChoices(DIA_Hokurn_Learn);
	Info_AddChoice(DIA_Hokurn_Learn,"To je pro mě moc drahé.",DIA_Hokurn_Learn_TooExpensive);
	if(Npc_HasItems(other,ItMi_Gold) >= 300)
	{
		Info_AddChoice(DIA_Hokurn_Learn,"Dobrá, tady jsou peníze.",DIA_Hokurn_Learn_OK);
	};
};

func void DIA_Hokurn_Learn_TooExpensive()
{
	AI_Output(other,self,"DIA_Hokurn_Learn_TooExpensive_15_00");	//To je pro mě moc drahé.
	AI_Output(self,other,"DIA_Hokurn_Learn_TooExpensive_01_01");	//Moc drahé? To je nejmíň, co by si na mém místě řekl kdokoli jiný.
	AI_Output(self,other,"DIA_Hokurn_Learn_TooExpensive_01_02");	//Přemýšlej o tom.
	Info_ClearChoices(DIA_Hokurn_Learn);
};

func void DIA_Hokurn_Learn_OK()
{
	AI_Output(other,self,"DIA_Hokurn_Learn_OK_15_00");	//Dobrá, tady jsou peníze.
	B_GiveInvItems(other,self,ItMi_Gold,300);
	Hokurn_TeachPlayer = TRUE;
	Info_ClearChoices(DIA_Hokurn_Learn);
};


instance DIA_Hokurn_PayTeacher(C_Info)
{
	npc = DJG_712_Hokurn;
	nr = 6;
	condition = DIA_Hokurn_PayTeacher_Condition;
	information = DIA_Hokurn_PayTeacher_Info;
	permanent = TRUE;
	description = "Tady jsou peníze. Chci, abys mě učil.";
};


func int DIA_Hokurn_PayTeacher_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Hokurn_Learn) && (Npc_HasItems(other,ItMi_Gold) >= 300) && (Hokurn_TeachPlayer == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hokurn_PayTeacher_Info()
{
	AI_Output(other,self,"DIA_Hokurn_PayTeacher_15_00");	//Tady jsou peníze. Chci, abys mě učil.
	AI_Output(self,other,"DIA_Hokurn_PayTeacher_01_01");	//Nebudeš litovat!
	B_GiveInvItems(other,self,ItMi_Gold,300);
	Hokurn_TeachPlayer = TRUE;
};


instance DIA_Hokurn_DrinkAndLearn(C_Info)
{
	npc = DJG_712_Hokurn;
	nr = 7;
	condition = DIA_Hokurn_DrinkAndLearn_Condition;
	information = DIA_Hokurn_DrinkAndLearn_Info;
	permanent = TRUE;
	description = "Tady je pro tebe něco k pití.";
};


func int DIA_Hokurn_DrinkAndLearn_Condition()
{
	if((KAPITELORCATC == FALSE) && (HokurnGetsDrink == TRUE) && ((Npc_HasItems(other,ItFo_Booze) >= 1) || (Npc_HasItems(other,ItFo_Wine) >= 1) || (Npc_HasItems(other,ItFo_Beer) >= 1)))
	{
		return TRUE;
	};
};

func void DIA_Hokurn_DrinkAndLearn_Info()
{
	AI_Output(other,self,"DIA_Hokurn_DrinkAndLearn_15_00");	//Tady je pro tebe něco k pití.
	b_hokurn_drinking();
	AI_Output(self,other,"DIA_Hokurn_DrinkAndLearn_01_01");	//Teď se cítím o hodně lépe.
};


instance DIA_Hokurn_Teach(C_Info)
{
	npc = DJG_712_Hokurn;
	nr = 7;
	condition = DIA_Hokurn_Teach_Condition;
	information = DIA_Hokurn_Teach_Info;
	permanent = TRUE;
	description = "Začněme s tréninkem.";
};


func int DIA_Hokurn_Teach_Condition()
{
	if(Hokurn_TeachPlayer == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Hokurn_Teach_Info()
{
	AI_Output(other,self,"DIA_Hokurn_Teach_15_00");	//Začněme s tréninkem.
	if(HokurnLastDrink < Wld_GetDay())
	{
		AI_Output(self,other,"DIA_Hokurn_Teach_01_01");	//Nejdřív mi přines něco k pití!
	}
	else
	{
		if(hero.guild == GIL_PAL)
		{
			AI_Output(self,other,"DIA_Hokurn_Teach_01_02");	//Pak se uvidí, co můžeme dostat z těch tvejch zatuhlejch paladinskejch kostí, jasný?
		}
		else if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR))
		{
			AI_Output(self,other,"DIA_Hokurn_Teach_01_03");	//Co ty víš. Dokonce i mágové používají chladné zbraně.
		};
		Info_ClearChoices(DIA_Hokurn_Teach);
		Info_AddChoice(DIA_Hokurn_Teach,Dialog_Back,DIA_Hokurn_Teach_Back);
		Info_AddChoice(DIA_Hokurn_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Hokurn_Teach_2H_1);
		Info_AddChoice(DIA_Hokurn_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Hokurn_Teach_2H_5);
		Info_AddChoice(DIA_Hokurn_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Hokurn_Teach_1H_1);
		Info_AddChoice(DIA_Hokurn_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Hokurn_Teach_1H_5);
	};
};

func void DIA_Hokurn_Teach_Back()
{
	Info_ClearChoices(DIA_Hokurn_Teach);
};

func void B_Hokurn_TeachedEnough()
{
	AI_Output(self,other,"B_Hokurn_TeachedEnough_01_00");	//Na tuhle disciplínu už nepotřebuješ žádnýho učitele.
};

func void DIA_Hokurn_Teach_2H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,100);
	if(other.HitChance[NPC_TALENT_2H] >= 100)
	{
		B_Hokurn_TeachedEnough();
	};
	Info_AddChoice(DIA_Hokurn_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Hokurn_Teach_2H_1);
};

func void DIA_Hokurn_Teach_2H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,100);
	if(other.HitChance[NPC_TALENT_2H] >= 100)
	{
		B_Hokurn_TeachedEnough();
	};
	Info_AddChoice(DIA_Hokurn_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Hokurn_Teach_2H_5);
};

func void DIA_Hokurn_Teach_1H_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,100);
	if(other.HitChance[NPC_TALENT_1H] >= 100)
	{
		B_Hokurn_TeachedEnough();
	};
	Info_AddChoice(DIA_Hokurn_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Hokurn_Teach_1H_1);
};

func void DIA_Hokurn_Teach_1H_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,100);
	if(other.HitChance[NPC_TALENT_1H] >= 100)
	{
		B_Hokurn_TeachedEnough();
	};
	Info_AddChoice(DIA_Hokurn_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Hokurn_Teach_1H_5);
};


instance DIA_Hokurn_StayHere(C_Info)
{
	npc = DJG_712_Hokurn;
	nr = 5;
	condition = DIA_Hokurn_StayHere_Condition;
	information = DIA_Hokurn_StayHere_Info;
	permanent = FALSE;
	description = "A co tady vlastně děláš?";
};


func int DIA_Hokurn_StayHere_Condition()
{
	if((HokurnGetsDrink == TRUE) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hokurn_StayHere_Info()
{
	AI_Output(other,self,"DIA_Hokurn_StayHere_15_00");	//A co tady vlastně děláš?
	AI_Output(self,other,"DIA_Hokurn_StayHere_01_01");	//Nemám tušení, proč jsme sem přišli, nebo kdy to začne.
	AI_Output(self,other,"DIA_Hokurn_StayHere_01_02");	//A dokud mám co pít, ani se o to nestarám.
};


instance DIA_Hokurn_WhereDragon(C_Info)
{
	npc = DJG_712_Hokurn;
	nr = 5;
	condition = DIA_Hokurn_WhereDragon_Condition;
	information = DIA_Hokurn_WhereDragon_Info;
	permanent = TRUE;
	description = "Tak víš, kde ty draci jsou?";
};


func int DIA_Hokurn_WhereDragon_Condition()
{
	if((HokurnGetsDrink == TRUE) && (HokurnTellsDragon == FALSE) && Npc_KnowsInfo(other,DIA_Hokurn_StayHere) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hokurn_WhereDragon_Info()
{
	AI_Output(other,self,"DIA_Hokurn_WhereDragon_15_00");	//Tak víš, kde ty draci jsou?
	AI_Output(self,other,"DIA_Hokurn_WhereDragon_01_01");	//Co z toho budu mít, když ti to řeknu?
	Info_ClearChoices(DIA_Hokurn_WhereDragon);
	Info_AddChoice(DIA_Hokurn_WhereDragon,"Nic, vydám se za nima sám.",DIA_Hokurn_WhereDragon_FindMyself);
	Info_AddChoice(DIA_Hokurn_WhereDragon,"Jsem ochoten ti za tu informaci zaplatit.",DIA_Hokurn_WhereDragon_Gold);
	if((Npc_HasItems(other,ItFo_Beer) >= 1) || (Npc_HasItems(other,ItFo_Booze) >= 1) || (Npc_HasItems(other,ItFo_Wine) >= 1) || (Npc_HasItems(other,ItFo_Addon_Rum) >= 1) || (Npc_HasItems(other,ItFo_Addon_Grog) >= 1))
	{
		Info_AddChoice(DIA_Hokurn_WhereDragon,"Ještě tu mám nějaké pití.",DIA_Hokurn_WhereDragon_Booze);
	};
};

func void DIA_Hokurn_WhereDragon_FindMyself()
{
	AI_Output(other,self,"DIA_Hokurn_WhereDragon_FindMyself_15_00");	//Nic, vydám se za nima sám.
	AI_Output(self,other,"DIA_Hokurn_WhereDragon_FindMyself_01_01");	//Měl by sis dávat pozor. Čeká tě spousta bojů.
	Info_ClearChoices(DIA_Hokurn_WhereDragon);
};

func void DIA_Hokurn_WhereDragon_Gold()
{
	AI_Output(other,self,"DIA_Hokurn_WhereDragon_Gold_15_00");	//Jsem ochoten ti za tu informaci zaplatit.
	AI_Output(self,other,"DIA_Hokurn_WhereDragon_Gold_01_01");	//Zaplatit mi? Hmm. Za 200 zlatých ti to povím.
	Info_ClearChoices(DIA_Hokurn_WhereDragon);
	Info_AddChoice(DIA_Hokurn_WhereDragon,"To je moc.",DIA_Hokurn_WhereDragon_TooMuch);
	if(Npc_HasItems(other,ItMi_Gold) >= 200)
	{
		Info_AddChoice(DIA_Hokurn_WhereDragon,"Tady jsou peníze.",DIA_Hokurn_WhereDragon_OK);
	};
};

func void DIA_Hokurn_WhereDragon_TooMuch()
{
	AI_Output(other,self,"DIA_Hokurn_WhereDragon_TooMuch_15_00");	//To je moc!
	AI_Output(self,other,"DIA_Hokurn_WhereDragon_TooMuch_01_01");	//Pak na to zapomeň.
	Info_ClearChoices(DIA_Hokurn_WhereDragon);
};

func void DIA_Hokurn_WhereDragon_OK()
{
	AI_Output(other,self,"DIA_Hokurn_WhereDragon_OK_15_00");	//Tady jsou peníze.
	B_GiveInvItems(other,self,ItMi_Gold,200);
	HokurnTellsDragon = TRUE;
	Info_ClearChoices(DIA_Hokurn_WhereDragon);
};

func void DIA_Hokurn_WhereDragon_Booze()
{
	AI_Output(other,self,"DIA_Hokurn_WhereDragon_Booze_15_00");	//Ještě tu mám nějaké pití.
	AI_Output(self,other,"DIA_Hokurn_WhereDragon_Booze_01_01");	//Za pořádnou pitku bych zabil všechny draky světa.
	AI_Output(self,other,"DIA_Hokurn_WhereDragon_Booze_01_02");	//Souhlas. Dej sem tu láhev!
	b_hokurn_taking();
	AI_Output(self,other,"DIA_Hokurn_WhereDragon_Booze_01_03");	//Schovám si ji na horší časy.
	HokurnTellsDragon = TRUE;
	Info_ClearChoices(DIA_Hokurn_WhereDragon);
};


instance DIA_Hokurn_Dragon(C_Info)
{
	npc = DJG_712_Hokurn;
	nr = 5;
	condition = DIA_Hokurn_Dragon_Condition;
	information = DIA_Hokurn_Dragon_Info;
	permanent = FALSE;
	description = "Dobrá, tak kde jsou ti draci?";
};


func int DIA_Hokurn_Dragon_Condition()
{
	if((HokurnTellsDragon == TRUE) && (KAPITELORCATC == FALSE) && (MIS_AllDragonsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hokurn_Dragon_Info()
{
	AI_Output(other,self,"DIA_Hokurn_Dragon_15_00");	//Dobrá, tak kde jsou ti draci?
	AI_Output(self,other,"DIA_Hokurn_Dragon_01_01");	//Přirozeně ti to neřeknu úplně přesně, ale slyšel jsem, že by tu měli být celkem čtyři.
	AI_Output(self,other,"DIA_Hokurn_Dragon_01_02");	//V noci jsme zahlédli nad nejvyšší horou rudou záři.
	AI_Output(self,other,"DIA_Hokurn_Dragon_01_03");	//Přísahám na hrob mé matky, pokud hledáš draka, tak když nikde jinde, tam ho určitě najdeš.
};


instance DIA_Hokurn_AllDragonsDead(C_Info)
{
	npc = DJG_712_Hokurn;
	nr = 5;
	condition = DIA_Hokurn_AllDragonsDead_Condition;
	information = DIA_Hokurn_AllDragonsDead_Info;
	permanent = TRUE;
	description = "Zabil jsem všechny draky.";
};


func int DIA_Hokurn_AllDragonsDead_Condition()
{
	if((MIS_AllDragonsDead == TRUE) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hokurn_AllDragonsDead_Info()
{
	AI_Output(other,self,"DIA_Hokurn_AllDragonsDead_15_00");	//Zabil jsem všechny draky.
	AI_Output(self,other,"DIA_Hokurn_AllDragonsDead_01_01");	//Udělej si výlet a vyprávěj své pohádky někomu jinému.
};


instance DIA_Hokurn_PICKPOCKET(C_Info)
{
	npc = DJG_712_Hokurn;
	nr = 900;
	condition = DIA_Hokurn_PICKPOCKET_Condition;
	information = DIA_Hokurn_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Hokurn_PICKPOCKET_Condition()
{
	return C_Beklauen(69,210);
};

func void DIA_Hokurn_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Hokurn_PICKPOCKET);
	Info_AddChoice(DIA_Hokurn_PICKPOCKET,Dialog_Back,DIA_Hokurn_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Hokurn_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Hokurn_PICKPOCKET_DoIt);
};

func void DIA_Hokurn_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Hokurn_PICKPOCKET);
};

func void DIA_Hokurn_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Hokurn_PICKPOCKET);
};


instance DIA_HOKURN_FUCKOFF(C_Info)
{
	npc = DJG_712_Hokurn;
	nr = 2;
	condition = dia_hokurn_fuckoff_condition;
	information = dia_hokurn_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_hokurn_fuckoff_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (DGJREFUSEPALADIN == TRUE))
	{
		return TRUE;
	};
};

func void dia_hokurn_fuckoff_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
};

//----------------------------------------------------------------------------

instance DIA_Hokurn_SLD_EXIT(C_Info)
{
	npc = SLD_849_Hokurn;
	nr = 999;
	condition = DIA_Hokurn_SLD_EXIT_Condition;
	information = DIA_Hokurn_SLD_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Hokurn_SLD_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Hokurn_SLD_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Hokurn_SLD_PICKPOCKET(C_Info)
{
	npc = SLD_849_Hokurn;
	nr = 900;
	condition = DIA_Hokurn_SLD_PICKPOCKET_Condition;
	information = DIA_Hokurn_SLD_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int DIA_Hokurn_SLD_PICKPOCKET_Condition()
{
	return C_Beklauen(69,210);
};

func void DIA_Hokurn_SLD_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Hokurn_SLD_PICKPOCKET);
	Info_AddChoice(DIA_Hokurn_SLD_PICKPOCKET,Dialog_Back,DIA_Hokurn_SLD_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Hokurn_SLD_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Hokurn_SLD_PICKPOCKET_DoIt);
};

func void DIA_Hokurn_SLD_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Hokurn_SLD_PICKPOCKET);
};

func void DIA_Hokurn_SLD_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Hokurn_SLD_PICKPOCKET);
};

instance DIA_Hokurn_NW_Hello(C_Info)
{
	npc = SLD_849_Hokurn;
	nr = 4;
	condition = DIA_Hokurn_NW_Hello_Condition;
	information = DIA_Hokurn_NW_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Hokurn_NW_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (KAPITELORCATC == FALSE) && (HokFirstMeet == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hokurn_NW_Hello_Info()
{
	AI_Output(self,other,"DIA_Hokurn_Hello_01_00");	//Nemáš něco k pití?
	AI_Output(other,self,"DIA_Hokurn_Hello_15_01");	//A asi to nemá být voda, co?
	AI_Output(self,other,"DIA_Hokurn_Hello_01_02");	//To teda ne, ksakru! Potřebuju nějakej alkohol, abych se konečně zbavil toho zatracenýho bolehlavu.
	AI_Output(self,other,"DIA_Hokurn_Hello_01_03");	//Jestli se brzo něčeho nenapiju, nejspíš mi pukne hlava.
	HokFirstMeet = TRUE;
	Info_ClearChoices(DIA_Hokurn_NW_Hello);
	Info_AddChoice(DIA_Hokurn_NW_Hello,"Pokusím se něco obstarat.",DIA_Hokurn_NW_Hello_No);

	if((Npc_HasItems(other,ItFo_Beer) >= 1) || (Npc_HasItems(other,ItFo_Addon_Rum) >= 1) || (Npc_HasItems(other,ItFo_Addon_Grog) >= 1) || (Npc_HasItems(other,ItFo_Booze) >= 1) || (Npc_HasItems(other,ItFo_Wine) >= 1))
	{
		Info_AddChoice(DIA_Hokurn_NW_Hello,"Tady, vezmi si tohle.",DIA_Hokurn_NW_Hello_Yes);
	};
};

func void DIA_Hokurn_NW_Hello_No()
{
	AI_Output(other,self,"DIA_Hokurn_Hello_No_15_00");	//Nemám nic, co bych ti mohl dát.
	AI_Output(self,other,"DIA_Hokurn_Hello_No_01_01");	//Tak zmizni!
	Info_ClearChoices(DIA_Hokurn_NW_Hello);
	Info_AddChoice(DIA_Hokurn_NW_Hello,Dialog_Ende,DIA_Hokurn_NW_Hello_END);
	Info_AddChoice(DIA_Hokurn_NW_Hello,"Ještě jedna věc...",DIA_Hokurn_NW_Hello_ASK1);
};

func void DIA_Hokurn_NW_Hello_ASK1()
{
	AI_Output(other,self,"DIA_Hokurn_Hello_ASK1_15_00");	//Ještě jedna věc...
	AI_Output(self,other,"DIA_Hokurn_Hello_ASK1_01_01");	//(povzdech) Tys mi nerozuměl? VYPADNI!
	Info_ClearChoices(DIA_Hokurn_NW_Hello);
	Info_AddChoice(DIA_Hokurn_NW_Hello,Dialog_Ende,DIA_Hokurn_NW_Hello_END);
	Info_AddChoice(DIA_Hokurn_NW_Hello,"Je to důležité.",DIA_Hokurn_NW_Hello_ASK2);
};

func void DIA_Hokurn_NW_Hello_ASK2()
{
	AI_Output(other,self,"DIA_Hokurn_Hello_ASK2_15_00");	//Je to důležité.
	AI_Output(self,other,"DIA_Hokurn_Hello_ASK2_01_01");	//(povzdech) Řekl sis o to!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Hokurn_NW_Hello_END()
{
	AI_StopProcessInfos(self);
};

func void B_Hokurn_NW_Sauf()
{
	AI_Output(self,other,"B_Hokurn_Sauf_01_00");	//(říhnutí) Ha, tohle jsem potřeboval.
	AI_Output(self,other,"B_Hokurn_Sauf_01_01");	//Teď můžu znova myslet s čistou hlavou. Co pro tebe můžu udělat?
};

func void b_hokurn_NW_drinking()
{
	if(Npc_HasItems(other,ItFo_Booze) >= 1)
	{
		B_GiveInvItems(other,self,ItFo_Booze,1);
		B_UseItem(self,ItFo_Booze);
	}
	else if(Npc_HasItems(other,ItFo_Wine) >= 1)
	{
		B_GiveInvItems(other,self,ItFo_Wine,1);
		B_UseItem(self,ItFo_Wine);
	}
	else if(Npc_HasItems(other,ItFo_Beer) >= 1)
	{
		B_GiveInvItems(other,self,ItFo_Beer,1);
		B_UseItem(self,ItFo_Beer);
	}
	else if(Npc_HasItems(other,ItFo_Addon_Rum) >= 1)
	{
		B_GiveInvItems(other,self,ItFo_Addon_Rum,1);
		B_UseItem(self,ItFo_Addon_Rum);
	}
	else if(Npc_HasItems(other,ItFo_Addon_Grog) >= 1)
	{
		B_GiveInvItems(other,self,ItFo_Addon_Grog,1);
		B_UseItem(self,ItFo_Addon_Grog);
	};
	HokurnLastDrink = Wld_GetDay();
	HokurnGetsDrink = TRUE;
};

func void b_hokurn_NW_taking()
{
	if(Npc_HasItems(other,ItFo_Booze) >= 1)
	{
		B_GiveInvItems(other,self,ItFo_Booze,1);
	}
	else if(Npc_HasItems(other,ItFo_Wine) >= 1)
	{
		B_GiveInvItems(other,self,ItFo_Wine,1);
	}
	else if(Npc_HasItems(other,ItFo_Beer) >= 1)
	{
		B_GiveInvItems(other,self,ItFo_Beer,1);
	}
	else if(Npc_HasItems(other,ItFo_Addon_Rum) >= 1)
	{
		B_GiveInvItems(other,self,ItFo_Addon_Rum,1);
	}
	else if(Npc_HasItems(other,ItFo_Addon_Grog) >= 1)
	{
		B_GiveInvItems(other,self,ItFo_Addon_Grog,1);
	};
};

func void DIA_Hokurn_NW_Hello_Yes()
{
	AI_Output(other,self,"DIA_Hokurn_Hello_Yes_15_00");	//Tady, vezmi si tohle.
	b_hokurn_drinking();
	B_Hokurn_Sauf();
	StartPashalQuest = TRUE;
	Info_ClearChoices(DIA_Hokurn_NW_Hello);
};


instance DIA_Hokurn_NW_Drink(C_Info)
{
	npc = SLD_849_Hokurn;
	nr = 5;
	condition = DIA_Hokurn_NW_Drink_Condition;
	information = DIA_Hokurn_NW_Drink_Info;
	permanent = TRUE;
	description = "Tady máš něco k pití.";
};


func int DIA_Hokurn_NW_Drink_Condition()
{
	if((KAPITELORCATC == FALSE) && (HokurnGetsDrink == FALSE) && ((Npc_HasItems(other,ItFo_Beer) >= 1) || (Npc_HasItems(other,ItFo_Addon_Rum) >= 1) || (Npc_HasItems(other,ItFo_Addon_Grog) >= 1) || (Npc_HasItems(other,ItFo_Booze) >= 1) || (Npc_HasItems(other,ItFo_Wine) >= 1)))
	{
		return TRUE;
	};
};

func void DIA_Hokurn_NW_Drink_Info()
{
	AI_Output(other,self,"DIA_Hokurn_Drink_15_00");	//Tady máš něco k pití.
	AI_Output(self,other,"DIA_Hokurn_Drink_01_01");	//Dej to sem!
	b_hokurn_NW_drinking();
	B_Hokurn_NW_Sauf();
	StartPashalQuest = TRUE;
};

//-----------------------paskhalka-----------------------------------------------

instance DIA_Hokurn_NW_PashalQuest(C_Info)
{
   npc = SLD_849_Hokurn;
   nr = 5;
   condition = DIA_Hokurn_NW_PashalQuest_Condition;
   information = DIA_Hokurn_NW_PashalQuest_Info;
   permanent = FALSE;
   description = "Na této farmě je něco zajímavého?";
};

func int DIA_Hokurn_NW_PashalQuest_Condition()
{
   if((KAPITELORCATC == FALSE) && (Kapitel < 4) && (StartPashalQuest == TRUE))
   {
      return TRUE;
   };
};

func void DIA_Hokurn_NW_PashalQuest_Info()
{
   AI_Output(other,self,"DIA_Hokurn_NW_PashalQuest_01_00");   //Na vaší farmě je něco zajímavého?
   AI_Output(self,other,"DIA_Hokurn_NW_PashalQuest_01_01");   //Zajímavého? Chlapče ty nejsi sám sebou, když kladeš takové otázky
   AI_Output(self,other,"DIA_Hokurn_NW_PashalQuest_01_02");   //Rozhlédni se kolem sebe a uvidíš, že kolem jsou jen tupé ovce a berani.
   AI_Output(self,other,"DIA_Hokurn_NW_PashalQuest_01_03");   //Je to smutný obraz, bohužel a nezmění ze dne na den.
   AI_Output(self,other,"DIA_Hokurn_NW_PashalQuest_01_04");   //Zajímavé věci hledej za hranicema našeho chlívku, tady nic nenajdeš.
   AI_Output(other,self,"DIA_Hokurn_NW_PashalQuest_01_05");   //A ty víš kde mám hledat?
   AI_Output(self,other,"DIA_Hokurn_NW_PashalQuest_01_06");   //(Sarkasticky) No, jak jsem ti řek. Vím, že nic nevím, ale něco jsem slyšel.
   AI_Output(other,self,"DIA_Hokurn_NW_PashalQuest_01_07");   //Slyšel a co?
   AI_Output(self,other,"DIA_Hokurn_NW_PashalQuest_01_08");   //No... (zaváhal) Je to docela starý příběh. A já nevím - jestli je to pravda, nebo ne.
   AI_Output(other,self,"DIA_Hokurn_NW_PashalQuest_01_09");   //Rád si to poslechnu.
   AI_Output(self,other,"DIA_Hokurn_NW_PashalQuest_01_10");   //No, proč ne.
   AI_Output(self,other,"DIA_Hokurn_NW_PashalQuest_01_11");   //Koneckonců, pohostil jsi mě drinkem, tak bych neměl zapomínat na slušné vychování.
   AI_Output(self,other,"DIA_Hokurn_NW_PashalQuest_01_12");   //No tak dobře... Stalo se to v době, když jsem byl za bariérou v Hornickém údolí.
   AI_Output(self,other,"DIA_Hokurn_NW_PashalQuest_01_13");   //Jednoho dne v hospodě v Novém táboře jsem slyšel příběh o určitém artefaktu.
   AI_Output(self,other,"DIA_Hokurn_NW_PashalQuest_01_14");   //Někteří podivíni z tábora v bažinách, kteří nám přinesli další várku trávy, vyprávěli o mocném artefaktu.
   AI_Output(self,other,"DIA_Hokurn_NW_PashalQuest_01_15");   //Mluvili o tom, že existuje předmět, který umožní majiteli získat neomezenou moc nad světem! Umíš si to představit. 
   AI_Output(other,self,"DIA_Hokurn_NW_PashalQuest_01_16");   //A ty jsi mu věřil?
   AI_Output(self,other,"DIA_Hokurn_NW_PashalQuest_01_17");   //No ne tak docela... Bratrstvo z bažin je trochu podivnej spolek, nikdy nevíš co od nich můžeš čekat...
   AI_Output(self,other,"DIA_Hokurn_NW_PashalQuest_01_18");   //Kdo ví jestli je to pravda, nebo blud vytvořený sektáři?
   AI_Output(self,other,"DIA_Hokurn_NW_PashalQuest_01_19");   //Jen jednu věc mohu říct s jistotou - pověsti nevznikají jen tak! To mě můžeš věřit.
   AI_Output(other,self,"DIA_Hokurn_NW_PashalQuest_01_20");   //Ano, neobyčejný příběh. A jak se jmenoval ten vypravěč?
   AI_Output(self,other,"DIA_Hokurn_NW_PashalQuest_01_21");   //Nevím jak se jmenoval, akorát si pamatuju,že byl pořád zhulenej. 
   AI_Output(self,other,"DIA_Hokurn_NW_PashalQuest_01_22");   //A když byl celej zahalenej v kouřu, začal mlátit hlavou o zeď, jako by jí chtěl prorazit.
   AI_Output(self,other,"DIA_Hokurn_NW_PashalQuest_01_23");   //Ano, byl to zábavnej chlapec...(zasměje se)
   AI_Output(other,self,"DIA_Hokurn_NW_PashalQuest_01_24");   //A kde je teď, nevíš?
   AI_Output(self,other,"DIA_Hokurn_NW_PashalQuest_01_25");   //Nemám tušení. Od té doby se už u nás v táboře neobjevil. 
   AI_Output(other,self,"DIA_Hokurn_NW_PashalQuest_01_26");   //No, díky za příběh.
   MIS_PashalQuest = LOG_Running;
   Log_CreateTopic(TOPIC_PashalQuest,LOG_MISSION);
   Log_SetTopicStatus(TOPIC_PashalQuest,LOG_Running);
   B_LogEntry(TOPIC_PashalQuest,"Žoldák Hokurn mi řekl podivný příběh o magickém artefaktu, se kterým získáš neomezenou moc nad celým světem! Tento příběh slyšel od jednoho novice z tábora v bažinách. Hokurn si nedokázal vzpomenout na jeho jméno a neví kde by se teď mohl nacházet. Možná bych měl navštívit nový tábor Bratrstva v Khorinisu. Možná bych tam mohl zajít a zjistit více o tom magickém předmětu.");
   AI_StopProcessInfos(self);
   Wld_InsertNpc(SEK_4567_Unicorn,"NW_PSICAMP_UNICORN");
};

var int UNICORN_FLAG_01;
var int UNICORN_FLAG_02;
var int UNICORNTALK_YES;

instance DIA_SEK_4567_Unicorn_EXIT(C_Info)
{
   npc = SEK_4567_Unicorn;
   nr = 999;
   condition = DIA_SEK_4567_Unicorn_exit_condition;
   information = DIA_SEK_4567_Unicorn_exit_info;
   permanent = TRUE;
   description = Dialog_Ende;
};

func int DIA_SEK_4567_Unicorn_exit_condition()
{
   return TRUE;
};

func void DIA_SEK_4567_Unicorn_exit_info()
{
   AI_StopProcessInfos(self);
};


instance DIA_SEK_4567_Unicorn_NOTALK_SLEEPER(C_Info)
{
   npc = SEK_4567_Unicorn;
   nr = 1;
   condition = DIA_SEK_4567_Unicorn_notalk_sleeper_condition;
   information = DIA_SEK_4567_Unicorn_notalk_sleeper_info;
   permanent = FALSE;
   important = FALSE;
   description = "Spáč s tebou!";
};


func int DIA_SEK_4567_Unicorn_notalk_sleeper_condition()
{
   if(UNICORNTALK_YES == FALSE)
   {
      return TRUE;
   };
};

func void DIA_SEK_4567_Unicorn_notalk_sleeper_info()
{
   AI_Output(other,self,"DIA_SEK_4567_Unicorn_NoTalk_Sleeper_01_00");   //Spáč s tebou!
   AI_Output(self,other,"DIA_SEK_4567_Unicorn_NoTalk_Sleeper_01_01");   //(vzdych)
   UNICORN_FLAG_01 = TRUE;
   AI_StopProcessInfos(self);
};

instance DIA_SEK_4567_Unicorn_NOTALK_IMP(C_Info)
{
   npc = SEK_4567_Unicorn;
   nr = 1;
   condition = DIA_SEK_4567_Unicorn_notalk_imp_condition;
   information = DIA_SEK_4567_Unicorn_notalk_imp_info;
   permanent = TRUE;
   important = FALSE;
   description = "Všechno v pořádku, příteli?";
};

func int DIA_SEK_4567_Unicorn_notalk_imp_condition()
{
   if(UNICORNTALK_YES == FALSE)
   {
      return TRUE;
   };
};

func void DIA_SEK_4567_Unicorn_notalk_imp_info()
{
   AI_Output(other,self,"DIA_SEK_4567_Unicorn_NoTalk_Imp_01_00");   //Všechno v pořádku, příteli?
   AI_Output(self,other,"DIA_SEK_4567_Unicorn_NoTalk_Sleeper_01_01");   //(vzdych)
   UNICORN_FLAG_02 = TRUE;
   AI_StopProcessInfos(self);
};

instance DIA_SEK_4567_Unicorn_HasSmoke(C_Info)
{
   npc = SEK_4567_Unicorn;
   nr = 1;
   condition = DIA_SEK_4567_Unicorn_HasSmoke_condition;
   information = DIA_SEK_4567_Unicorn_HasSmoke_info;
   permanent = FALSE;
   description = "U mě se povaluje spousta trávy z bažin.";
};

func int DIA_SEK_4567_Unicorn_HasSmoke_condition()
{
   if((UNICORNTALK_YES == FALSE) && (UNICORN_FLAG_01 == TRUE) && (UNICORN_FLAG_02 == TRUE) && (Npc_HasItems(other,ItMi_Joint) >= 1))
   {
      return TRUE;
   };
};

func void DIA_SEK_4567_Unicorn_HasSmoke_info()
{
   AI_Output(other,self,"DIA_SEK_4567_Unicorn_HasSmoke_01_00");   //U mě se povaluje spousta trávy z bažin. Máš zájem?
   AI_PlayAni(self,"T_SEARCH");
   AI_Output(self,other,"DIA_SEK_4567_Unicorn_HasSmoke_01_01");   //Hmm...(pokašlává) S tím jsi měl začít! Máš jí hodně?
   AI_Output(other,self,"DIA_SEK_4567_Unicorn_HasSmoke_01_02");   //Nu, ne tak docela.
   AI_Output(self,other,"DIA_SEK_4567_Unicorn_HasSmoke_01_03");   //Dobře, to nevadí...(nervózně) Vemu si všechnu! V poslední době je těžké jí zde sehnat.
   B_GiveInvItems(other,self,ItMi_Joint,Npc_HasItems(other,ItMi_Joint));
   AI_Output(other,self,"DIA_SEK_4567_Unicorn_HasSmoke_01_04");   //Vážně, nevydává Talas novou dávku každý den?
   AI_Output(self,other,"DIA_SEK_4567_Unicorn_HasSmoke_01_05");   //Vydává, ale bohužel to pro mně není dost. Pořád potřebuju kouřit.
   AI_Output(self,other,"DIA_SEK_4567_Unicorn_HasSmoke_01_06");   //Pokud nemám co kouři začne mě strašně bolet hlava. Tak, že s ní o stěnu musím mlátit!
   AI_Output(self,other,"DIA_SEK_4567_Unicorn_HasSmoke_01_07");   //Dřív to pomáhalo, ale teď je to bezvýsledný. Všechno se rozděluje rovným dílem.
   AI_Output(self,other,"DIA_SEK_4567_Unicorn_HasSmoke_01_08");   //Takže potřebuju hodně trsů trávy z bažin, Chápeš?
   UNICORNTALK_YES = TRUE;
};

instance DIA_SEK_4567_Unicorn_HeyYou(C_Info)
{
   npc = SEK_4567_Unicorn;
   nr = 1;
   condition = DIA_SEK_4567_Unicorn_HeyYou_condition;
   information = DIA_SEK_4567_Unicorn_HeyYou_info;
   permanent = FALSE;
   description = "Hej, ty nejseš ten týpek...";
};

func int DIA_SEK_4567_Unicorn_HeyYou_condition()
{
   if((MIS_PashalQuest == LOG_Running) && (UNICORNTALK_YES == TRUE))
   {
      return TRUE;
   };
};

func void DIA_SEK_4567_Unicorn_HeyYou_info()
{
   B_GivePlayerXP(200);
   AI_Output(other,self,"DIA_SEK_4567_Unicorn_HeyYou_01_00");   //Hej, ty nejseš te týpek, co nabízel trávu v Novém táboře?
   AI_Output(self,other,"DIA_SEK_4567_Unicorn_HeyYou_01_01");   //No, ano...(pokašlává) To bylo něco! Nicméně, dlouho jsem tam nepobyl.
   AI_Output(other,self,"DIA_SEK_4567_Unicorn_HeyYou_01_02");   //Proč?
   AI_Output(self,other,"DIA_SEK_4567_Unicorn_HeyYou_01_03");   //No...(provinile) Vykouřil jsem všechnu trávu, co jsem dostal k prodeji.
   AI_Output(self,other,"DIA_SEK_4567_Unicorn_HeyYou_01_04");   //Proto mě Baal Isidro a Kagan poslali zpátky do našeho tábora. 
   AI_Output(other,self,"DIA_SEK_4567_Unicorn_HeyYou_01_05");   //No na tom nezáleží. Mě zajímá něco jiného.
   AI_Output(other,self,"DIA_SEK_4567_Unicorn_HeyYou_01_06");   //Někteří lidé si pamatují, že jsi jim vyprávěl o podivném magickém artefaktu.
   AI_Output(other,self,"DIA_SEK_4567_Unicorn_HeyYou_01_07");   //Údajně může být použit k ovládnutí celého světa.
   AI_Output(self,other,"DIA_SEK_4567_Unicorn_HeyYou_01_08");   //Hmm...(zmateně) Opravdu?! No, možná něco takového proběhlo... co neuděláš pro dobrej špek trávy.
   AI_Output(other,self,"DIA_SEK_4567_Unicorn_HeyYou_01_09");   //Vzpomínáš si na to?
   AI_Output(self,other,"DIA_SEK_4567_Unicorn_HeyYou_01_10");   //Skoro ne. Pamatuju si jen příběh, který jsem sám slyšel.
   AI_Output(other,self,"DIA_SEK_4567_Unicorn_HeyYou_01_11");   //Kde?
   AI_Output(self,other,"DIA_SEK_4567_Unicorn_HeyYou_01_12");   //Ve Starém táboře! Zrovna jsem přines čerstvou várku trávy a náhodou jsem zaslech rozhovor mezi dvěma strážemi.
   AI_Output(self,other,"DIA_SEK_4567_Unicorn_HeyYou_01_13");   //Jeden z nich vyprávěl druhému, o podivném předmětu.
   AI_Output(self,other,"DIA_SEK_4567_Unicorn_HeyYou_01_14");   //Pak mě viděli a popošli dál. A to je všechno.
   AI_Output(other,self,"DIA_SEK_4567_Unicorn_HeyYou_01_15");   //A ty si nevzpomeneš na jména těch stráží?
   AI_Output(self,other,"DIA_SEK_4567_Unicorn_HeyYou_01_16");   //Jejich jména neznám, ale pamatuji se, že jeden z nich měl šedivé vlasy.
   AI_Output(self,other,"DIA_SEK_4567_Unicorn_HeyYou_01_17");   //A to je všechno co vím.
   B_LogEntry(TOPIC_PashalQuest,"Našel jsem chlapa co vyprávěl příběh v Novém táboře. Nic moc mě neřek, kromě toho, že tento příběh sám slyšel z rozhovoru dvou strážných ve Starém táboře. Jestli někdo ví o tom artefaktu něco víc, tak to jsou oni. Ale kde je hledat to nevím...");
   PashalQuestGuardStep = TRUE;
};

instance DIA_BDT_4568_KINJARTS_EXIT(C_Info)
{
   npc = BDT_4568_KINJARTS;
   nr = 999;
   condition = DIA_BDT_4568_KINJARTS_exit_condition;
   information = DIA_BDT_4568_KINJARTS_exit_info;
   permanent = TRUE;
   description = Dialog_Ende;
};

func int DIA_BDT_4568_KINJARTS_exit_condition()
{
   return TRUE;
};

func void DIA_BDT_4568_KINJARTS_exit_info()
{
   AI_StopProcessInfos(self);
};

instance DIA_BDT_4568_KINJARTS_HELLO(C_Info)
{
   npc = BDT_4568_KINJARTS;
   nr = 1;
   condition = DIA_BDT_4568_KINJARTS_HELLO_condition;
   information = DIA_BDT_4568_KINJARTS_HELLO_info;
   permanent = FALSE;
   description = "Zdravím, jak se máte?";
};

func int DIA_BDT_4568_KINJARTS_HELLO_condition()
{
   return TRUE;
};

func void DIA_BDT_4568_KINJARTS_HELLO_info()
{
   AI_Output(other,self,"DIA_BDT_4568_KINJARTS_HELLO_01_00");   //Zdravím, jak se máte?
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_HELLO_01_01");   //(culí se) Kdopak to sem zabloudil?
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_HELLO_01_02");   //Počkej, nic neříkej! Budu hádat... Nové maso na práci ve zlatém dolu?
   AI_Output(other,self,"DIA_BDT_4568_KINJARTS_HELLO_01_03");   //Chybička! Mám jiné důvody.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_HELLO_01_04");   //Nesnaž se mě oklamat, chlapče... (posmívá se)
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_HELLO_01_05");   //Ve svém životě jsem viděl spoustu tlučhubů, jako jsi ty, co mluvili o důležitosti svého poslání. Zvláště ve Starém táboře!
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_HELLO_01_06");   //Zpočátku ze sebe dělali ostřílené hrdiny, co hory dokáží přenášet! A to je to nejmenší...
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_HELLO_01_07");   //A všechny do jednoho práce v dole vyléčila! Pár let s krumpáčem v ruce, ti vyžene chvástání z mladé horké hlavy.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_HELLO_01_08");   //A z tebe to vymlátím taky...
};

var int KinJartsTellUs;
var int KinJartsWannaOre;

instance DIA_BDT_4568_KINJARTS_Quest(C_Info)
{
   npc = BDT_4568_KINJARTS;
   nr = 1;
   condition = DIA_BDT_4568_KINJARTS_Quest_condition;
   information = DIA_BDT_4568_KINJARTS_Quest_info;
   permanent = FALSE;
   description = "Nějak si nevzpomínám na naše setkání ve Starém táboře.";
};

func int DIA_BDT_4568_KINJARTS_Quest_condition()
{
   if(Npc_KnowsInfo(other,DIA_BDT_4568_KINJARTS_HELLO) == TRUE)
   {
      return TRUE;
   };
};

func void DIA_BDT_4568_KINJARTS_Quest_info()
{
   AI_Output(other,self,"DIA_BDT_4568_KINJARTS_Quest_01_00");   //Nějak si nevzpomínám na naše setkání ve Starém táboře.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_01_01");   //(ušklíbá se) Narážíš na to, že jsi také pobýval v kolonii?
   AI_Output(other,self,"DIA_BDT_4568_KINJARTS_Quest_01_02");   //Přesně tak, ale tebe jsem tam neviděl.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_01_03");   //To mě nepřekvapuje. Vzhledem k tomu, že většinu času jsem trávil mimo tábor, doprovodem zboží z vnějšího světa.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_01_04");   //Možná to je důvod, proč se naše cesty nikdy nestřetli.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_01_05");   //Kdybys se zeptal někoho kdo pamatuje staré časy, tak by ti pověděl, kdo jsem.
   AI_Output(other,self,"DIA_BDT_4568_KINJARTS_Quest_01_06");   //Opravdu, možná mě to sám povíš?
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_01_07");   //(ušklíbá se) No, jestli chceš slyšet o starých časech, tak bys měl vědět, že všechno něco stojí.
   AI_Output(other,self,"DIA_BDT_4568_KINJARTS_Quest_01_08"); //Rudu, jako obvykle?
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_01_09"); //Jak jsi to uhod...(smějě se) Ale neboj, nebudu si účtovat přemrštěné ceny, jako místní obchodníci.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_01_10"); //Tak poslouchej, tři kusy rudy mě budou bohatě stačit.
   Info_ClearChoices(DIA_BDT_4568_KINJARTS_Quest);
   Info_AddChoice(DIA_BDT_4568_KINJARTS_Quest,"Popřemýšlím nad tvým návrhem.",DIA_BDT_4568_KINJARTS_Quest_Back);

   if(Npc_HasItems(other,ItMi_Nugget) >= 3)
   {
      Info_AddChoice(DIA_BDT_4568_KINJARTS_Quest,"(dát tři kusy magické rudy)",DIA_BDT_4568_KINJARTS_Quest_MagicOre);
   };
   if((Npc_HasItems(other,ITMI_SNUGGET) >= 3) && (RhetorikSkillValue[1] >= 35))
   {
      Info_AddChoice(DIA_BDT_4568_KINJARTS_Quest,"(dát tři kusy železné rudy)",DIA_BDT_4568_KINJARTS_Quest_IronOre);
   };
};

func void DIA_BDT_4568_KINJARTS_Quest_Back()
{
   AI_Output(other,self,"DIA_BDT_4568_KINJARTS_Quest_Back_01_01");   //Popřemýšlím nad tvým návrhem.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_Back_01_02");   //Nepřemýšlej dlouho! Nebo změním názor.
   KinJartsWannaOre = TRUE;
   Info_ClearChoices(DIA_BDT_4568_KINJARTS_Quest);
};

func void DIA_BDT_4568_KINJARTS_Quest_MagicOre()
{
   AI_Output(other,self,"DIA_BDT_4568_KINJARTS_Quest_MagicOre_01_01");   //Tady máš tři kusy rudy.
   B_GiveInvItems(other,self,ItMi_Nugget,3);
   Npc_RemoveInvItems(self,ItMi_Nugget,3);
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_MagicOre_01_02");   //Dobrá. Teď můžu pokračovat v příběhu.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_MagicOre_01_03");   //Byl jsem v kolonii ještě v době, když odsouzení viděli nad hlavou jasnou oblohu.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_MagicOre_01_04");   //Zpočátku to bylo obtížné. (chmurně) Na vlastní kůži jsem pocítil jak obtížná je práce v dole.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_MagicOre_01_05");   //Nicméně, po vztyčení bariéry a převzetí moci Gomezem, jsem se stal jedním ze strážných a měl jsem na starost nově příchozí do kolonie. 
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_MagicOre_01_06");   //Později mě zastoupil Bullit. A moje známosti s ostatními barony mě umožnily, zaujmout místo hlavního dodavatele a ochránce zboží z vnějšího světa.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_MagicOre_01_07");   //Byla to velmi nebezpečná práce, protože naše transporty byli neustále napadány zloději z Nového tábora.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_MagicOre_01_08");   //Při jedné takové potyčce jsem málem zemřel.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_MagicOre_01_09");   //Ale to je minulost, teď jsem jedním z Thorusových strážných.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_MagicOre_01_10");   //A tadle práce mě vyhovuje!
   KinJartsTellUs = TRUE;
   Info_ClearChoices(DIA_BDT_4568_KINJARTS_Quest);
};


func void DIA_BDT_4568_KINJARTS_Quest_IronOre()
{
   AI_Output(other,self,"DIA_BDT_4568_KINJARTS_Quest_IronOre_01_01");   //Tady máš tři kusy rudy.
   B_GiveInvItems(other,self,ItMi_SNugget,3);
   Npc_RemoveInvItems(self,ItMi_SNugget,3);
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_IronOre_01_02");   //Co to má jako být?!
   AI_Output(other,self,"DIA_BDT_4568_KINJARTS_Quest_IronOre_01_03");   //Ruda. Vždyť jsi ji chtěl.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_IronOre_01_04");   //Měl jsem na mysli magickou rudu a ne obyčejnou!
   AI_Output(other,self,"DIA_BDT_4568_KINJARTS_Quest_IronOre_01_05");   //Ale to jsi nezmínil, takže vem co ti dávám.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_IronOre_01_06");   //Hmm... Jako za starých časů, vypadá to že jsi mě pěkně napálil. To jsem nečekal!
   AI_Output(other,self,"DIA_BDT_4568_KINJARTS_Quest_IronOre_01_07");   //Takže teď mě řekni něco o sobě a co jsi dělal ve Starém táboře?
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_IronOre_01_08");   //(usmívá se) Samozřejmě. Dohoda je dohoda! Takže...
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_IronOre_01_09");   //Byl jsem v kolonii ještě v době, když odsouzení viděli nad hlavou jasnou oblohu.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_IronOre_01_10");   //Zpočátku to bylo obtížné. (chmurně) Na vlastní kůži jsem pocítil jak obtížná je práce v dole.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_IronOre_01_11");   //Nicméně, po vztyčení bariéry a převzetí moci Gomezem, jsem se stal jedním ze strážných a měl jsem na starost nově příchozí do kolonie.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_IronOre_01_12");   //Později mě zastoupil Bullit. A moje známosti s ostatními barony mě umožnily, zaujmout místo hlavního dodavatele a ochránce zboží z vnějšího světa.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_IronOre_01_13");   //Byla to velmi nebezpečná práce, protože naše transporty byli neustále napadány zloději z Nového tábora.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_IronOre_01_14");   //Při jedné takové potyčce jsem málem zemřel.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_IronOre_01_15");   //Ale to je minulost, teď jsem jedním z Thorusových strážných.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_IronOre_01_16");   //A tadle práce mě vyhovuje!
   KinJartsTellUs = TRUE;
   
   if(RhetorikSkillValue[1] < 100)
   {
      RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
      AI_Print("Rétorika + 1");
   };

   Info_ClearChoices(DIA_BDT_4568_KINJARTS_Quest);
};

instance DIA_BDT_4568_KINJARTS_QuestAgain(C_Info)
{
   npc = BDT_4568_KINJARTS;
   nr = 1;
   condition = DIA_BDT_4568_KINJARTS_QuestAgain_condition;
   information = DIA_BDT_4568_KINJARTS_QuestAgain_info;
   permanent = TRUE;
   description = "Přinesl jsem ti rudu.";
};

func int DIA_BDT_4568_KINJARTS_QuestAgain_condition()
{
   if((KinJartsWannaOre == TRUE) && (KinJartsTellUs == FALSE))
   {
      return TRUE;
   };
};

func void DIA_BDT_4568_KINJARTS_QuestAgain_info()
{
   AI_Output(other,self,"DIA_BDT_4568_KINJARTS_QuestAgain_01_00");   //Přinesl jsem ti rudu.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_QuestAgain_01_01");   //Dobře, dej mi ji!
   Info_ClearChoices(DIA_BDT_4568_KINJARTS_QuestAgain);
   Info_AddChoice(DIA_BDT_4568_KINJARTS_QuestAgain,"Ještě nad tím popřemýšlím.",DIA_BDT_4568_KINJARTS_QuestAgain_Back);

   if(Npc_HasItems(other,ItMi_Nugget) >= 3)
   {
      Info_AddChoice(DIA_BDT_4568_KINJARTS_QuestAgain,"(dát tři kusy magické rudy)",DIA_BDT_4568_KINJARTS_QuestAgain_MagicOre);
   };
   if((Npc_HasItems(other,ITMI_SNUGGET) >= 3) && (RhetorikSkillValue[1] >= 35))
   {
      Info_AddChoice(DIA_BDT_4568_KINJARTS_QuestAgain,"(dát tři kusy železné rudy)",DIA_BDT_4568_KINJARTS_QuestAgain_IronOre);
   };
};

func void DIA_BDT_4568_KINJARTS_QuestAgain_Back()
{
   AI_Output(other,self,"DIA_BDT_4568_KINJARTS_QuestAgain_Back_01_01");   //Ještě nad tím popřemýšlím.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_QuestAgain_Back_01_02");   //Nepřemýšlej dlouho! Nebo změním názor.
   Info_ClearChoices(DIA_BDT_4568_KINJARTS_QuestAgain);
};

func void DIA_BDT_4568_KINJARTS_QuestAgain_MagicOre()
{
   AI_Output(other,self,"DIA_BDT_4568_KINJARTS_Quest_MagicOre_01_01");   //Tady máš tři kusy rudy.
   B_GiveInvItems(other,self,ItMi_Nugget,3);
   Npc_RemoveInvItems(self,ItMi_Nugget,3);
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_MagicOre_01_02");   //Dobrá. Teď můžu pokračovat v příběhu.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_MagicOre_01_03");   //Byl jsem v kolonii ještě v době, když odsouzení viděli nad hlavou jasnou oblohu.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_MagicOre_01_04");   //Zpočátku to bylo obtížné. (chmurně) Na vlastní kůži jsem pocítil jak obtížná je práce v dole.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_MagicOre_01_05");   //Nicméně, po vztyčení bariéry a převzetí moci Gomezem, jsem se stal jedním ze strážných a měl jsem na starost nově příchozí do kolonie.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_MagicOre_01_06");   //Později mě zastoupil Bullit. A moje známosti s ostatními barony mě umožnily, zaujmout místo hlavního dodavatele a ochránce zboží z vnějšího světa.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_MagicOre_01_07");   //Byla to velmi nebezpečná práce, protože naše transporty byli neustále napadány zloději z Nového tábora.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_MagicOre_01_08");   //Při jedné takové potyčce jsem málem zemřel.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_MagicOre_01_09");   //Ale to je minulost, teď jsem jedním z Thorusových strážných.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_MagicOre_01_10");   //A tadle práce mě vyhovuje!
   KinJartsTellUs = TRUE;
   Info_ClearChoices(DIA_BDT_4568_KINJARTS_QuestAgain);
};

func void DIA_BDT_4568_KINJARTS_QuestAgain_IronOre()
{
   AI_Output(other,self,"DIA_BDT_4568_KINJARTS_Quest_IronOre_01_01");   //Tady máš tři kusy rudy.
   B_GiveInvItems(other,self,ItMi_SNugget,3);
   Npc_RemoveInvItems(self,ItMi_SNugget,3);
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_IronOre_01_02");   //Co to má jako být?!
   AI_Output(other,self,"DIA_BDT_4568_KINJARTS_Quest_IronOre_01_03");   //Ruda. Vždyť jsi ji chtěl.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_IronOre_01_04");   //Měl jsem na mysli magickou rudu a ne obyčejnou!
   AI_Output(other,self,"DIA_BDT_4568_KINJARTS_Quest_IronOre_01_05");   //Ale to jsi nezmínil, takže vem co ti dávám.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_IronOre_01_06");   //Hmm... Jako za starých časů, vypadá to že jsi mě pěkně napálil. To jsem nečekal!
   AI_Output(other,self,"DIA_BDT_4568_KINJARTS_Quest_IronOre_01_07");   //Takže teď mě řekni něco o sobě a co jsi dělal ve Starém táboře?
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_IronOre_01_08");   //(usmívá se) Samozřejmě. Dohoda je dohoda! Takže...
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_IronOre_01_09");   //Byl jsem v kolonii ještě v době, když odsouzení viděli nad hlavou jasnou oblohu.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_IronOre_01_10");   //Zpočátku to bylo obtížné. (chmurně) Na vlastní kůži jsem pocítil jak obtížná je práce v dole.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_IronOre_01_11");   //Nicméně, po vztyčení bariéry a převzetí moci Gomezem, jsem se stal jedním ze strážných a měl jsem na starost nově příchozí do kolonie.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_IronOre_01_12");   //Později mě zastoupil Bullit. A moje známosti s ostatními barony mě umožnily, zaujmout místo hlavního dodavatele a ochránce zboží z vnějšího světa.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_IronOre_01_13");   //Byla to velmi nebezpečná práce, protože naše transporty byli neustále napadány zloději z Nového tábora.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_IronOre_01_14");   //Při jedné takové potyčce jsem málem zemřel.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_IronOre_01_15");   //Ale to je minulost, teď jsem jedním z Thorusových strážných.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Quest_IronOre_01_16");   //A tadle práce mě vyhovuje!
   KinJartsTellUs = TRUE;

   if(RhetorikSkillValue[1] < 100)
   {
      RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
      AI_Print("Rétorika + 1");
   };

   Info_ClearChoices(DIA_BDT_4568_KINJARTS_QuestAgain);
};

instance DIA_BDT_4568_KINJARTS_QuestDone(C_Info)
{
   npc = BDT_4568_KINJARTS;
   nr = 1;
   condition = DIA_BDT_4568_KINJARTS_QuestDone_condition;
   information = DIA_BDT_4568_KINJARTS_QuestDone_info;
   permanent = FALSE;
   description = "Vypadá to, že víš hodně o Starém táboře.";
};

func int DIA_BDT_4568_KINJARTS_QuestDone_condition()
{
   if((MIS_PashalQuest == LOG_Running) && (KinJartsTellUs == TRUE))
   {
      return TRUE;
   };
};

func void DIA_BDT_4568_KINJARTS_QuestDone_info()
{
   B_GivePlayerXP(200);
   AI_Output(other,self,"DIA_BDT_4568_KINJARTS_QuestDone_01_00");   //Vypadá to, že víš hodně o Starém táboře.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_QuestDone_01_01");   //Víc než kdokoli jiný! A proč se ptáš?
   AI_Output(other,self,"DIA_BDT_4568_KINJARTS_QuestDone_01_02");   //Protože mám velmi delikátní otázku.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_QuestDone_01_03");   //Hmmm... (se zájmem) Tak se ptej jestli chceš.
   AI_Output(other,self,"DIA_BDT_4568_KINJARTS_QuestDone_01_04");   //Hledám jednoho strážného, který se kdysi zmínil o magickém artefaktu.
   AI_Output(other,self,"DIA_BDT_4568_KINJARTS_QuestDone_01_05");   //Zdá se že je to velmi mocná věc, údajně schopná ovlivnit osud celého světa.
   AI_PlayAni(self,"T_SEARCH");
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_QuestDone_01_06");   //Velmi zajímavé. Teď dovol abych se tě na něco zeptal, odkud to víš?
   AI_Output(other,self,"DIA_BDT_4568_KINJARTS_QuestDone_01_07");   //Vyprávěl mě o tom jeden sektář z tábora v bažinách.
   AI_Output(other,self,"DIA_BDT_4568_KINJARTS_QuestDone_01_08");   //Zaslechl rozhovor mezi dvěma strážemi, kteří o tom artefaktu mluvili.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_QuestDone_01_09");   //(zamyšleně) No to je docela možné.
   AI_Output(other,self,"DIA_BDT_4568_KINJARTS_QuestDone_01_10");   //Co tím myslíš?
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_QuestDone_01_11");   //Chci tím říci, že jak se zdá, jsi s touto otázkou na správné adrese.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_QuestDone_01_12");   //Vzhledem k tomu, že strážný, kterého hledáš jsem já!
   AI_Output(other,self,"DIA_BDT_4568_KINJARTS_QuestDone_01_13");   //Ano! Opravdu?!
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_QuestDone_01_14");   //Vypadám snad jako lhář? (vážně) Nebo budím takoví dojem?
   AI_Output(other,self,"DIA_BDT_4568_KINJARTS_QuestDone_01_15");   //To bych neřek.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_QuestDone_01_16");   //Tak mě věř, synku. Je to všechno pravda!
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_QuestDone_01_17");   //A tenhle sektář, zřejmě, vyslech můj rozhovor s přítelem Scorpiem, když jsem mu o tom vyprávěl.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_QuestDone_01_18");   //Pak mě Scorpio řekl, že je to nesmysl a radil mě abych si tím nezatěžoval hlavu.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_QuestDone_01_19");   //No, ale vypadá to, že jsme všechno pořádně nezvážily.
   AI_Output(other,self,"DIA_BDT_4568_KINJARTS_QuestDone_01_20");   //To znamená, že artefakt opravdu existuje?!
   AI_PlayAni(self,"T_SEARCH");
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_QuestDone_01_21");   //Poslouchej mě příteli, neřekl jsem, že existuje.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_QuestDone_01_22");   //Nicméně o něm tenkrát mluvili mágové Ohně a jejich slovům já věřím. Myslím, že to stále stojí za zvážení. 
   AI_Output(other,self,"DIA_BDT_4568_KINJARTS_QuestDone_01_23");   //Ale všechny mágy Ohně nechal zavraždit Gomez. A co teď?
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_QuestDone_01_24");   //To vím. Ale pokud je mi známo, některým se podařilo přežít.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_QuestDone_01_25");   //Myslím, že ten mág se jmenoval Milten! Možná bys ho měl najít a promluvit s ním o tom artefaktu.
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_QuestDone_01_26");   //Nic dalšího, už ti k tomu nemohu říct.
   AI_Output(other,self,"DIA_BDT_4568_KINJARTS_QuestDone_01_27");   //Rozuměl jsem.
   B_LogEntry(TOPIC_PashalQuest,"Kinjarts byl jeden ze strážných, kteří znali o příběh o artefaktu. Podle něj, jestli někdo může potvrdit jeho existenci, je to mág Ohně ze Starého tábora, který jako jediný unikl smrti, když se Gomez rozhodl mágy Ohně zavraždit. Jmenoval se Milten.");
   PashalQuestMageStep = TRUE;
};

instance DIA_BDT_4568_KINJARTS_Perm(C_Info)
{
   npc = BDT_4568_KINJARTS;
   nr = 1;
   condition = DIA_BDT_4568_KINJARTS_Perm_condition;
   information = DIA_BDT_4568_KINJARTS_Perm_info;
   permanent = TRUE;
   description = "Jaká je situace?";
};

func int DIA_BDT_4568_KINJARTS_Perm_condition()
{
   if(Npc_KnowsInfo(other,DIA_BDT_4568_KINJARTS_QuestDone) == TRUE)
   {
      return TRUE;
   };
};

func void DIA_BDT_4568_KINJARTS_Perm_info()
{
   AI_Output(other,self,"DIA_BDT_4568_KINJARTS_Perm_01_00");   //Jaká je situace?
   AI_Output(self,other,"DIA_BDT_4568_KINJARTS_Perm_01_01");   //Všude je klid, doufám, že to tak i zůstane.
};

instance DIA_KDF_4569_AlexOne_EXIT(C_Info)
{
   npc = KDF_4569_AlexOne;
   nr = 999;
   condition = DIA_KDF_4569_AlexOne_exit_condition;
   information = DIA_KDF_4569_AlexOne_exit_info;
   permanent = TRUE;
   description = Dialog_Ende;
};

func int DIA_KDF_4569_AlexOne_exit_condition()
{
   return TRUE;
};

func void DIA_KDF_4569_AlexOne_exit_info()
{
   AI_StopProcessInfos(self);
};

instance DIA_KDF_4569_AlexOne_HELLO(C_Info)
{
   npc = KDF_4569_AlexOne;
   nr = 1;
   condition = DIA_KDF_4569_AlexOne_HELLO_condition;
   information = DIA_KDF_4569_AlexOne_HELLO_info;
   permanent = FALSE;
   important = TRUE;
};

func int DIA_KDF_4569_AlexOne_HELLO_condition()
{
   return TRUE;
};

func void DIA_KDF_4569_AlexOne_HELLO_info()
{
   AI_Output(self,other,"DIA_KDF_4569_AlexOne_HELLO_01_00");   //Hej! Co tady děláš?
   AI_Output(other,self,"DIA_KDF_4569_AlexOne_HELLO_01_01");   //Chtěl jsem se tě zeptat na stejnou otázku.
   AI_Output(self,other,"DIA_KDF_4569_AlexOne_HELLO_01_02");   //(Pohrdavě) Moje práce se tě netýká.
   AI_Output(self,other,"DIA_KDF_4569_AlexOne_HELLO_01_03");   //Je příliš důležitá, než abych o ni vykládal prvnímu koho potkám!
};

instance DIA_KDF_4569_AlexOne_WhoYou(C_Info)
{
   npc = KDF_4569_AlexOne;
   nr = 1;
   condition = DIA_KDF_4569_AlexOne_WhoYou_condition;
   information = DIA_KDF_4569_AlexOne_WhoYou_info;
   permanent = FALSE;
   description = "Jsi mág Ohně?";
};

func int DIA_KDF_4569_AlexOne_WhoYou_condition()
{
   if(Npc_KnowsInfo(other,DIA_KDF_4569_AlexOne_HELLO) == TRUE)
   {
      return TRUE;
   };
};

func void DIA_KDF_4569_AlexOne_WhoYou_info()
{
   AI_Output(other,self,"DIA_KDF_4569_AlexOne_WhoYou_01_00");   //Jsi mág Ohně?
   AI_Output(self,other,"DIA_KDF_4569_AlexOne_WhoYou_01_01");   //Jak vidíš. A co tě na tom překvapuje?
   AI_Output(other,self,"DIA_KDF_4569_AlexOne_WhoYou_01_02");   //Nevzpomínám si, že bych tě znal z Khorinistského kláštera.
   AI_Output(self,other,"DIA_KDF_4569_AlexOne_WhoYou_01_03");   //Vstoupil jsem do kruhu Ohně zde v kolonii. A o klášteru já nic nevím.
   AI_Output(other,self,"DIA_KDF_4569_AlexOne_WhoYou_01_04");   //Zajímavé! A kdo tě přijal do kruhu Ohně?
   AI_Output(self,other,"DIA_KDF_4569_AlexOne_WhoYou_01_05");   //Sám mistr Corristo! (vážně) a z jeho vůle jsem nyní zde.
   AI_Output(other,self,"DIA_KDF_4569_AlexOne_WhoYou_01_06");   //Ale Corristo a další mágové Ohně jsou již dlouho mrtvý! Zabiti na Gomezův rozkaz.
   AI_Output(self,other,"DIA_KDF_4569_AlexOne_WhoYou_01_07");   //O čem to mluvíš?! Jak je to možné? Co jsi, blázen?
   AI_Output(other,self,"DIA_KDF_4569_AlexOne_WhoYou_01_08");   //Ty opravdu o ničem nevíš?
   AI_Output(self,other,"DIA_KDF_4569_AlexOne_WhoYou_01_09");   //A co mám vědět?!
   AI_Output(other,self,"DIA_KDF_4569_AlexOne_WhoYou_01_10");   //Když došlo ke zhroucení dolu, Gomez zuřil a rozhodl se zaútočit na Nový tábor.
   AI_Output(other,self,"DIA_KDF_4569_AlexOne_WhoYou_01_11");   //Mágové Ohně byli proti a tak je nechal jednoduše zabít.
   AI_Output(self,other,"DIA_KDF_4569_AlexOne_WhoYou_01_12");   //O Innos... Je to pravda?
   AI_Output(other,self,"DIA_KDF_4569_AlexOne_WhoYou_01_13");   //O tom nepochybuj. Nyní v hradě Starého tábora sídlí paladinové, ale hrad je obléhán skřety.
   AI_Output(self,other,"DIA_KDF_4569_AlexOne_WhoYou_01_14");   //Jak je to možné?! (Odevzdaně) pravda, nebyl jsem ve Starém táboře už několik let.
   AI_Output(self,other,"DIA_KDF_4569_AlexOne_WhoYou_01_15");   //Za tu dobu se mohlo hodně změnit! Ale co jsem slyšel od tebe, mě zlomilo srdce.
   AI_Output(other,self,"DIA_KDF_4569_AlexOne_WhoYou_01_16");   //Drž se příteli! To není ta nejhorší věc, co se v poslední době udála.
};

instance DIA_KDF_4569_AlexOne_WhatBow(C_Info)
{
   npc = KDF_4569_AlexOne;
   nr = 1;
   condition = DIA_KDF_4569_AlexOne_WhatBow_condition;
   information = DIA_KDF_4569_AlexOne_WhatBow_info;
   permanent = FALSE;
   description = "Proč potřebuješ kuši?";
};

func int DIA_KDF_4569_AlexOne_WhatBow_condition()
{
   if(Npc_KnowsInfo(other,DIA_KDF_4569_AlexOne_WhoYou) == TRUE)
   {
      return TRUE;
   };
};

func void DIA_KDF_4569_AlexOne_WhatBow_info()
{
   AI_Output(other,self,"DIA_KDF_4569_AlexOne_WhatBow_01_00");   //Proč potřebuješ kuši?
   AI_Output(other,self,"DIA_KDF_4569_AlexOne_WhatBow_01_01");   //Jsi mág. Nemáš dost magické síly, aby ses bránil?
   AI_Output(self,other,"DIA_KDF_4569_AlexOne_WhatBow_01_02");   //Ano, jsem mág, ale spíše slovy než činy...
   AI_Output(self,other,"DIA_KDF_4569_AlexOne_WhatBow_01_03");   //Bohužel můj výcvik nebyl dokončen.
   AI_Output(self,other,"DIA_KDF_4569_AlexOne_WhatBow_01_04");   //A protože mé magické schopnosti nejsou tak velké jako u jiných mágů...
   AI_Output(self,other,"DIA_KDF_4569_AlexOne_WhatBow_01_05");   //Na druhou stranu - kuše! Od ranného dětství mě s ní otec učil zacházet.
   AI_Output(self,other,"DIA_KDF_4569_AlexOne_WhatBow_01_06");   //Umím s ní stejně dobře jako, zkušený válečník s mečem nebo mág s holí.
   AI_Output(other,self,"DIA_KDF_4569_AlexOne_WhatBow_01_07");   //Takže, mág - kušiník. To je zábavné.
};

instance DIA_KDF_4569_AlexOne_WhatDeal(C_Info)
{
   npc = KDF_4569_AlexOne;
   nr = 1;
   condition = DIA_KDF_4569_AlexOne_WhatDeal_condition;
   information = DIA_KDF_4569_AlexOne_WhatDeal_info;
   permanent = FALSE;
   description = "Tak co tady máš za práci?";
};

func int DIA_KDF_4569_AlexOne_WhatDeal_condition()
{
   if((MIS_PashalQuest == LOG_Running) && (Npc_KnowsInfo(other,DIA_KDF_4569_AlexOne_WhoYou) == TRUE))
   {
      return TRUE;
   };
};

func void DIA_KDF_4569_AlexOne_WhatDeal_info()
{
   B_GivePlayerXP(300);
   AI_Output(other,self,"DIA_KDF_4569_AlexOne_WhatDeal_01_00");   //Tak co tady máš za práci?
   AI_Output(self,other,"DIA_KDF_4569_AlexOne_WhatDeal_01_01");   //Hmm... Teď už na tom nezáleží.
   AI_Output(other,self,"DIA_KDF_4569_AlexOne_WhatDeal_01_02");   //A přesto... pověz mi o tom?
   AI_Output(self,other,"DIA_KDF_4569_AlexOne_WhatDeal_01_03");   //No dobře. Jestli tě to tak zajímá.
   AI_Output(self,other,"DIA_KDF_4569_AlexOne_WhatDeal_01_04");   //Mistr Corristo mě poslal do tohoto údolí najít informaci o jednom starodávném artefaktu.
   AI_Output(other,self,"DIA_KDF_4569_AlexOne_WhatDeal_01_05");   //Myslíš o tom, s jehož pomocí chtěli zničit magickou bariéru?
   AI_Output(self,other,"DIA_KDF_4569_AlexOne_WhatDeal_01_06");   //(překvapeně) Ano, o něm. A ty odkud o něm víš?
   AI_Output(other,self,"DIA_KDF_4569_AlexOne_WhatDeal_01_07");   //Vyprávěl mě o něm Milten.
   AI_Output(self,other,"DIA_KDF_4569_AlexOne_WhatDeal_01_08");   //Takže už bys měl všechno znát. K tomu nemám co dodat.
   AI_Output(other,self,"DIA_KDF_4569_AlexOne_WhatDeal_01_09");   //No a našel jsi něco?
   AI_Output(self,other,"DIA_KDF_4569_AlexOne_WhatDeal_01_10");   //Samotný artefakt, se mě nalézt nepodařilo.
   AI_Output(self,other,"DIA_KDF_4569_AlexOne_WhatDeal_01_11");   //Ale jsem si jistý, že jsem našel něco, co mě k němu může dovést.
   AI_Output(other,self,"DIA_KDF_4569_AlexOne_WhatDeal_01_12");   //A co je to?
   AI_Output(self,other,"DIA_KDF_4569_AlexOne_WhatDeal_01_13");   //Na druhé straně jezera pod námi se nachází opuštěná krypta...(vážně)
   AI_Output(self,other,"DIA_KDF_4569_AlexOne_WhatDeal_01_14");   //A lze předpokládat, že právě tam se nachází ten artefakt!
   AI_Output(self,other,"DIA_KDF_4569_AlexOne_WhatDeal_01_15");   //Nebo aspoň něco, co nám pomůže určit jeho přesnou polohu.
   AI_Output(other,self,"DIA_KDF_4569_AlexOne_WhatDeal_01_16");   //Co se tam může nacházet?
   AI_Output(self,other,"DIA_KDF_4569_AlexOne_WhatDeal_01_17");   //Pořád se mě vyptávíš, jak kdybych tam už byl.
   AI_Output(other,self,"DIA_KDF_4569_AlexOne_WhatDeal_01_18");   //A proč jsi tam ještě nešel a nezjistil to?
   AI_Output(self,other,"DIA_KDF_4569_AlexOne_WhatDeal_01_19");   //Vchod do hrobky je uzavřen a nevím jak ho otevřít
   AI_Output(other,self,"DIA_KDF_4569_AlexOne_WhatDeal_01_20");   //To dává smysl.
   B_LogEntry(TOPIC_PashalQuest,"Nedaleko od Xardasovy věže jsem potkal mága Ohně - Lexe. To jeho poslal Corristo hledat pradávný artefakt. Lex je přesvědčen, že odpovědi se zkrývají v opuštěné kryptě, která se nachází poblíž. Nicméně vstup do krypty je uzavřen.");
   PashalQuestPentaStep = TRUE;
};

instance DIA_VLK_4570_Avabul_EXIT(C_Info)
{
   npc = VLK_4570_Avabul;
   nr = 999;
   condition = DIA_VLK_4570_Avabul_exit_condition;
   information = DIA_VLK_4570_Avabul_exit_info;
   permanent = TRUE;
   description = Dialog_Ende;
};

func int DIA_VLK_4570_Avabul_exit_condition()
{
   return TRUE;
};

func void DIA_VLK_4570_Avabul_exit_info()
{
   AI_StopProcessInfos(self);
};

instance DIA_VLK_4570_Avabul_HELLO(C_Info)
{
   npc = VLK_4570_Avabul;
   nr = 1;
   condition = DIA_VLK_4570_Avabul_HELLO_condition;
   information = DIA_VLK_4570_Avabul_HELLO_info;
   permanent = FALSE;
   important = TRUE;
};

func int DIA_VLK_4570_Avabul_HELLO_condition()
{
	if((MIS_PashalQuest == LOG_Running) && (AvabulIsUp == TRUE))
	{
		return TRUE;
	};
};

func void DIA_VLK_4570_Avabul_HELLO_info()
{
   B_GivePlayerXP(1000);
   AI_Output(self,other,"DIA_VLK_4570_Avabul_HELLO_01_00");   //Kdo mě přivolal?! Kdo se odváží rušit můj posvátný klid?!
   AI_Output(other,self,"DIA_VLK_4570_Avabul_HELLO_01_01");   //To jsem byl já.
   AI_Output(self,other,"DIA_VLK_4570_Avabul_HELLO_01_02");   //(pohrdavě) No samozřejmě! Další smrtelník, který chce pro sebe získat moc.
   AI_Output(self,other,"DIA_VLK_4570_Avabul_HELLO_01_03");   //Ale věř mi, nebudeš ji potřebovat! Díváš se smrti do tváře, ty ubohý červe...
   AI_Output(other,self,"DIA_VLK_4570_Avabul_HELLO_01_04");   //Hej ne tak rychle, krasavice! Odpověz alespoň na jednu mojí otázku.
   AI_Output(self,other,"DIA_VLK_4570_Avabul_HELLO_01_05");   //Co?! A tobě ještě zbylo tolik drzosti, žádat po mě odpovědi?
   AI_Output(self,other,"DIA_VLK_4570_Avabul_HELLO_01_06");   //I když...(zamyšleně) Proč ne?
   AI_Output(self,other,"DIA_VLK_4570_Avabul_HELLO_01_07");   //Aspoň budu mít to potěšení vidět jak škemráš o svůj ubohý život.
   AI_Output(other,self,"DIA_VLK_4570_Avabul_HELLO_01_08");   //Mýlíš se, chtěl jsem se zeptat na něco jiného.
   AI_Output(self,other,"DIA_VLK_4570_Avabul_HELLO_01_09");   //Opravdu?! A na co?
   AI_Output(other,self,"DIA_VLK_4570_Avabul_HELLO_01_10");   //Na artefakt, sílu, která je schopna měnit tento svět.
   AI_Output(self,other,"DIA_VLK_4570_Avabul_HELLO_01_11");   //(smích) Ach tak, na tohle! No samozřejmě...
   AI_Output(self,other,"DIA_VLK_4570_Avabul_HELLO_01_12");   //Ty, ač jsi nekromant a myslíš si že jsi velký a mocný mág.
   AI_Output(self,other,"DIA_VLK_4570_Avabul_HELLO_01_13");   //Doufáš, že ti povím kde ho máš hledat!
   AI_Output(other,self,"DIA_VLK_4570_Avabul_HELLO_01_14");   //Něco na ten způsob.
   AI_Output(self,other,"DIA_VLK_4570_Avabul_HELLO_01_15");   //Velmi naivní...(směje se) Řekni mi, proč bys ho potřeboval, smrtelníku?
   AI_Output(self,other,"DIA_VLK_4570_Avabul_HELLO_01_16");   //Opravdu si myslíš, že dokážeš zvládnout moc tohoto předmětu?
   AI_Output(other,self,"DIA_VLK_4570_Avabul_HELLO_01_17");   //No, to sám nevím. 
   AI_Output(self,other,"DIA_VLK_4570_Avabul_HELLO_01_18");   //Nevíš co?!
   AI_Output(other,self,"DIA_VLK_4570_Avabul_HELLO_01_19");   //Proč mě přitahuje tento artefakt.
   AI_Output(other,self,"DIA_VLK_4570_Avabul_HELLO_01_20");   //Stalo se to náhodou, zaslechl jsem o něm, a moje  cesta mě dovedla až sem.
   AI_Output(self,other,"DIA_VLK_4570_Avabul_HELLO_01_21");   //Hmm, jak zajímavé!
   AI_Output(self,other,"DIA_VLK_4570_Avabul_HELLO_01_22");   //Víš, je těžké uvěřit, že někdo kdo hledá nejsilnější artefakt světa a neví proč ho potřebuje.
   AI_Output(self,other,"DIA_VLK_4570_Avabul_HELLO_01_23");   //(záhadně) Ale cítím, že mi říkáš pravdu, smrtelníku.
   AI_Output(self,other,"DIA_VLK_4570_Avabul_HELLO_01_24");   //Proto tě ponechám naživu a neproměním tě v bezduchou zombie, jak jsem to udělal s tím nadutým mágem!
   AI_Output(other,self,"DIA_VLK_4570_Avabul_HELLO_01_25");   //Mnohokrát děkuji! Můžu doufat, že mě odpovíš i na moji otázku?
   AI_Output(self,other,"DIA_VLK_4570_Avabul_HELLO_01_26");   //Artefakt který hledáš nese jméno 'Nivram'! Sestrojili ho tvůrci tohoto světa, aby mohli lépe přetvářet tento svět.
   AI_Output(other,self,"DIA_VLK_4570_Avabul_HELLO_01_27");   //Mluvíš o Strážcích?
   AI_Output(self,other,"DIA_VLK_4570_Avabul_HELLO_01_28");   //(se zájmem) Hmmm... Ty o nich víš?
   AI_Output(other,self,"DIA_VLK_4570_Avabul_HELLO_01_29");   //Trochu.
   AI_Output(self,other,"DIA_VLK_4570_Avabul_HELLO_01_30");   //Jsou výjimeční! Aby zabránili použití artefaktu komukoliv cizímu, tak ho bezpečně skryli.
   AI_Output(self,other,"DIA_VLK_4570_Avabul_HELLO_01_31");   //Kde přesně - nikdo neví. Dokonce ani bohové!
   AI_Output(other,self,"DIA_VLK_4570_Avabul_HELLO_01_32");   //Pak není důvod, abych pokračoval ve svém pátrání.
   AI_Output(self,other,"DIA_VLK_4570_Avabul_HELLO_01_33");   //Ano máš pravdu... (posměšně) Pro tebe - to nemá cenu!
   AI_Output(self,other,"DIA_VLK_4570_Avabul_HELLO_01_34");   //Nicméně, můj hostitel po tom artefaktu už dlouho touží.
   AI_Output(self,other,"DIA_VLK_4570_Avabul_HELLO_01_35");   //A on by ti mohl pomoci s jeho nalezení, samozřejmě s tím, že ho s ním vyměníš za moc a slávu, po které vy smrtelníci tolik toužíte!
   AI_Output(other,self,"DIA_VLK_4570_Avabul_HELLO_01_36");   //A proč ho Beliar nehledá sám když ho tolik potřebuje? 
   AI_Output(self,other,"DIA_VLK_4570_Avabul_HELLO_01_37");   //Nechce přitáhnout příliš mnoho pozornosti Strážců.
   AI_Output(self,other,"DIA_VLK_4570_Avabul_HELLO_01_38");   //Proto je lepší, když některé věci dělají obyčejní smrtelníci, jako jsi ty.
   AI_Output(other,self,"DIA_VLK_4570_Avabul_HELLO_01_39");   //Chtěl jsi říct - špinavou práci!
   AI_Output(self,other,"DIA_VLK_4570_Avabul_HELLO_01_40");   //Nezáleží na tom... (panovačně) Důležité je to, co zůstane na konci této cesty. A můj hostitel nabízí mnoho...
   AI_Output(self,other,"DIA_VLK_4570_Avabul_HELLO_01_41");   //Tak co, souhlasíš?!
   AI_Output(other,self,"DIA_VLK_4570_Avabul_HELLO_01_42");   //A pokud nebudu souhlasit? Co pak?
   AI_Output(self,other,"DIA_VLK_4570_Avabul_HELLO_01_43");   //Pak jsi hlupák a já s tebou ztrácím čas!
   AI_Output(other,self,"DIA_VLK_4570_Avabul_HELLO_01_44");   //Dobře, dobře... vídím, že jsi vážená dáma! A navíc máš moc mě ublížit.
   AI_Output(other,self,"DIA_VLK_4570_Avabul_HELLO_01_45");   //Souhlasím!
   AI_Output(self,other,"DIA_VLK_4570_Avabul_HELLO_01_46");   //Výborně! Ale nezapomeň - dal jsi slovo samotnému Beliarovi! A teď se už od něho nemůžeš odvrátit.
   AI_Output(other,self,"DIA_VLK_4570_Avabul_HELLO_01_47");   //Pojďme k věci.
   AI_Output(self,other,"DIA_VLK_4570_Avabul_HELLO_01_48");   //Výborně, smrtelníku! První věcí kterou musíš najít nejstaršího ze starých - kdysi ho nazývali Janus Dvoutvářný!
   AI_Output(self,other,"DIA_VLK_4570_Avabul_HELLO_01_49");   //Možná že si pamatuje něco o tom artefaktu. 
   AI_Output(other,self,"DIA_VLK_4570_Avabul_HELLO_01_50");   //A kde ho mám hledat?
   AI_Output(self,other,"DIA_VLK_4570_Avabul_HELLO_01_51");   //Co vím, tak chrání jednu z relikvií Strážců.
   AI_Output(self,other,"DIA_VLK_4570_Avabul_HELLO_01_52");   //Teď jdi a neztrácej čas zbytečným mluvením.
   B_LogEntry(TOPIC_PashalQuest,"S pomocí mocného démonické lebky jsem byl schopen vyvolat jednu z temných kněžek Beliara - Avabul. Podle ní chce sám Beliar získat artefakt! Nakonec jsem souhlasil, že pomůžu Avabul najít tento artefakt pro Beliara, výměnou za moc a slávu. Teď musím jen najít Januse Dvoutvářného - nejstaršího ze starých, ten by mohl vědět něco o tomto artefaktu. Podle kněžky, Janus chrání jedenu z relikvií Strážců.");
   AI_StopProcessInfos(self);
   PashalQuestJanusStep = TRUE;
};

instance DIA_DMT_4571_Jan_EXIT(C_Info)
{
   npc = DMT_4571_Jan;
   nr = 999;
   condition = DIA_DMT_4571_Jan_exit_condition;
   information = DIA_DMT_4571_Jan_exit_info;
   permanent = TRUE;
   description = Dialog_Ende;
};

func int DIA_DMT_4571_Jan_exit_condition()
{
   return TRUE;
};

func void DIA_DMT_4571_Jan_exit_info()
{
   AI_StopProcessInfos(self);
};

instance DIA_DMT_4571_Jan_HELLO(C_Info)
{
   npc = DMT_4571_Jan;
   nr = 1;
   condition = DIA_DMT_4571_Jan_HELLO_condition;
   information = DIA_DMT_4571_Jan_HELLO_info;
   permanent = FALSE;
   important = TRUE;
};

func int DIA_DMT_4571_Jan_HELLO_condition()
{
	return TRUE;
};

func void DIA_DMT_4571_Jan_HELLO_info()
{
   AI_Output(self,other,"DIA_DMT_4571_Jan_HELLO_01_00");   //Stůj, smrtelníku! (důrazně) dál pro tebe cesta nevede!
   AI_Output(other,self,"DIA_DMT_4571_Jan_HELLO_01_01");   //A to jako proč?
   AI_Output(self,other,"DIA_DMT_4571_Jan_HELLO_01_02");   //Pouze vyvolení mohou vstoupit! A ty k nim nepatříš...
   AI_Output(self,other,"DIA_DMT_4571_Jan_HELLO_01_03");   //Tak se vrať zpátky, jestli si ceníš svého života.
   AI_Output(other,self,"DIA_DMT_4571_Jan_HELLO_01_04");   //A když tě neposlechnu?
   AI_Output(self,other,"DIA_DMT_4571_Jan_HELLO_01_05");   //Pak zemřeš... Stejně jako ti další co se sem pokoušeli dostat.
};

instance DIA_DMT_4571_Jan_WRATH(C_Info)
{
   npc = DMT_4571_Jan;
   nr = 1;
   condition = DIA_DMT_4571_Jan_WRATH_condition;
   information = DIA_DMT_4571_Jan_WRATH_info;
   permanent = FALSE;
   description = "Myslíš si, že to neudělám?";
};

func int DIA_DMT_4571_Jan_WRATH_condition()
{
	if(Npc_KnowsInfo(other,DIA_DMT_4571_Jan_HELLO) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_DMT_4571_Jan_WRATH_info()
{
   AI_Output(other,self,"DIA_DMT_4571_Jan_WRATH_01_00");   //Myslíš si, že to neudělám?
   AI_Output(self,other,"DIA_DMT_4571_Jan_WRATH_01_01");   //(smích) Můžeš to vyzkoušet smrtelníku!
   AI_Output(self,other,"DIA_DMT_4571_Jan_WRATH_01_02");   //Ale jen ztratíš čas a taky život, v ubohém pokusu mě porazit.
   AI_Output(self,other,"DIA_DMT_4571_Jan_WRATH_01_03");   //Ty co mě svěřili ochranu této cesty, mě obdařili ohromnou silou a mocí.
   AI_Output(self,other,"DIA_DMT_4571_Jan_WRATH_01_04");   //A tak stvořili jednoho ze strážců věčnosti!
   AI_Output(self,other,"DIA_DMT_4571_Jan_WRATH_01_05");   //Ale takovému bídnému červu jako jsi ty, to stejně nic neříká. 
   AI_Output(self,other,"DIA_DMT_4571_Jan_WRATH_01_06");   //Tak co se radši vrátit!
   AI_Output(self,other,"DIA_DMT_4571_Jan_WRATH_01_07");   //Zde nenajdeš nic jiného než vlastní smrt.
};

instance DIA_DMT_4571_Jan_Pashal(C_Info)
{
   npc = DMT_4571_Jan;
   nr = 1;
   condition = DIA_DMT_4571_Jan_Pashal_condition;
   information = DIA_DMT_4571_Jan_Pashal_info;
   permanent = FALSE;
   description = "Takže ty jsi Janus Dvoutvářný?";
};

func int DIA_DMT_4571_Jan_Pashal_condition()
{
	if((Npc_KnowsInfo(other,DIA_DMT_4571_Jan_HELLO) == TRUE) && (MIS_PashalQuest == LOG_Running) && (PashalQuestJanusStep == TRUE))
	{
		return TRUE;
	};
};

func void DIA_DMT_4571_Jan_Pashal_info()
{
   B_GivePlayerXP(1500);
   AI_Output(other,self,"DIA_DMT_4571_Jan_Pashal_01_00");   //Takže ty jsi Janus Dvoutvářný? A tebe právě hledám!
   AI_Output(self,other,"DIA_DMT_4571_Jan_Pashal_01_01");   //Ty jsi mě hledal, smrtelníku?! (hrdě) Ale proč, to mě pověz?
   AI_Output(other,self,"DIA_DMT_4571_Jan_Pashal_01_02");   //Poslala mě za tebou Beliarova kněžka jménem Avabul. 
   AI_Output(other,self,"DIA_DMT_4571_Jan_Pashal_01_03");   //Podle ni víš o osudu jednoho z nejstarších artefaktů.
   AI_Output(other,self,"DIA_DMT_4571_Jan_Pashal_01_04");   //Nazývá se Nivram. Už jsi o něm slyšel?
   AI_Output(self,other,"DIA_DMT_4571_Jan_Pashal_01_05");   //(zamyšleně) Nikdy bych nepomyslel, že jednoho dne dostanu tuto otázku od obyčejného člověka.
   AI_Output(self,other,"DIA_DMT_4571_Jan_Pashal_01_06");   //Je zřejmé, že jsi Beliarův vyslanec, když tě poslala sama Avabul!
   AI_Output(other,self,"DIA_DMT_4571_Jan_Pashal_01_07");   //A mění to něco?
   AI_Output(self,other,"DIA_DMT_4571_Jan_Pashal_01_08");   //Ne, absolutně nic...
   AI_Output(self,other,"DIA_DMT_4571_Jan_Pashal_01_09");   //No, ale když ti mocní tohoto světa důvěřují, že uchráníš takové tajemství, tak to není jen tak. 
   AI_Output(other,self,"DIA_DMT_4571_Jan_Pashal_01_10");   //Pak bys mě možná, mohl něco povědět o tom artefaktu?
   AI_Output(self,other,"DIA_DMT_4571_Jan_Pashal_01_11");   //Vyprávění bude krátké... Neboť odpověď na tvoji otázku se skrývá za těmito dveřmi!
   AI_Output(self,other,"DIA_DMT_4571_Jan_Pashal_01_12");   //Nicméně, jak jsem už řekl, ty těmi dveřmi neprojdeš, pokud se já nerozhodnu, že tě pustím.
   B_LogEntry(TOPIC_PashalQuest,"Našel jsem Januse Dvoutvářného jak mě řekla Avabul! Podle něj je odpověď na mojí otázku za velkou bránou, kterou střeží. Pravdou je, že nemůžu tou bránou projít, dokud mě to sám Janus nedovolí.");
};

instance DIA_DMT_4571_Jan_Dual(C_Info)
{
   npc = DMT_4571_Jan;
   nr = 2;
   condition = DIA_DMT_4571_Jan_Dual_condition;
   information = DIA_DMT_4571_Jan_Dual_info;
   permanent = FALSE;
   description = "Proč tě nazývají Dvoutvářný?";
};

func int DIA_DMT_4571_Jan_Dual_condition()
{
	if(Npc_KnowsInfo(other,DIA_DMT_4571_Jan_Pashal) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_DMT_4571_Jan_Dual_info()
{
	AI_Output(other,self,"DIA_DMT_4571_Jan_Dual_01_00");   //Proč tě nazývají Dvoutvářný?
	AI_Output(self,other,"DIA_DMT_4571_Jan_Dual_01_01");   //Jak sis už určitě všimnul, smrtelníku, nosím zlatou masku.
	AI_Output(self,other,"DIA_DMT_4571_Jan_Dual_01_02");   //Aby skryla mou pravou tvář před lidmi.
	AI_Output(other,self,"DIA_DMT_4571_Jan_Dual_01_03");   //Proč?
	AI_Output(self,other,"DIA_DMT_4571_Jan_Dual_01_04");   //To mělo několik důvodů! Ale právě pro to, mě nazývají Dvoutvářný.
	AI_Output(self,other,"DIA_DMT_4571_Jan_Dual_01_05");   //Pravda, to co skrývá nyní už se jen těžko dá nazvat tváří.
	AI_Output(self,other,"DIA_DMT_4571_Jan_Dual_01_06");   //(ironicky) No, jak vidíš, zvyk nosit masku mě zůstal do teď!
};

instance DIA_DMT_4571_Jan_His(C_Info)
{
   npc = DMT_4571_Jan;
   nr = 2;
   condition = DIA_DMT_4571_Jan_His_condition;
   information = DIA_DMT_4571_Jan_His_info;
   permanent = FALSE;
   description = "A čím jsi byl během svého života?";
};

func int DIA_DMT_4571_Jan_His_condition()
{
	if(Npc_KnowsInfo(other,DIA_DMT_4571_Jan_Pashal) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_DMT_4571_Jan_His_info()
{
	AI_Output(other,self,"DIA_DMT_4571_Jan_His_01_00");   //A čím jsi byl během svého života?
	AI_Output(self,other,"DIA_DMT_4571_Jan_His_01_01");   //(odevzdaně) Byl jsem lovec draků...
	AI_Output(other,self,"DIA_DMT_4571_Jan_His_01_02");   //Bojovla jsi s draky?!
	AI_Output(self,other,"DIA_DMT_4571_Jan_His_01_03");   //A více než jednou, v době když jsem žil, nebyli draci takovou vzácností jako nyní.
	AI_Output(self,other,"DIA_DMT_4571_Jan_His_01_04");   //V jednom takovém souboji jsem dokonce zemřel.
	AI_Output(self,other,"DIA_DMT_4571_Jan_His_01_05");   //Nicméně jak vidíš, má pouť na tomto světě neskončila. Teď jsem strážce brány!
	AI_Output(other,self,"DIA_DMT_4571_Jan_His_01_06");   //A co je za ní skryto?
	AI_Output(self,other,"DIA_DMT_4571_Jan_His_01_07");   //Sám se to dozvíš, jestli se ukáže, že jsi hoden této cti.
};

instance DIA_DMT_4571_Jan_Proof(C_Info)
{
   npc = DMT_4571_Jan;
   nr = 1;
   condition = DIA_DMT_4571_Jan_Proof_condition;
   information = DIA_DMT_4571_Jan_Proof_info;
   permanent = FALSE;
   description = "Co bych měl udělat, abych tě přesvědčil?";
};

func int DIA_DMT_4571_Jan_Proof_condition()
{
	if((Npc_KnowsInfo(other,DIA_DMT_4571_Jan_Pashal) == TRUE) && (MIS_PashalQuest == LOG_Running) && (PashalQuestJanusStep == TRUE))
	{
		return TRUE;
	};
};

func void DIA_DMT_4571_Jan_Proof_info()
{
	AI_Output(other,self,"DIA_DMT_4571_Jan_Proof_01_00");   //Co bych měl udělat, abych tě přesvědčil?
	AI_Output(self,other,"DIA_DMT_4571_Jan_Proof_01_01");   //(zamyšleně) Budeš muset projít mojí zkouškou! Ale bude to dost obtížné.
	AI_Output(self,other,"DIA_DMT_4571_Jan_Proof_01_02");   //Jseš si opravdu jistý, že jsi na to připravený?
	AI_Output(other,self,"DIA_DMT_4571_Jan_Proof_01_03");   //Rozhodně, tak mluv - o co jde?
	AI_Output(self,other,"DIA_DMT_4571_Jan_Proof_01_04");   //Dobře... Jelikož jsi zřejmě Beliarův posel, žádám tě abys mi přinesl duši jeho oblíbence!
	AI_Output(self,other,"DIA_DMT_4571_Jan_Proof_01_05");   //Duši toho kdo reprezentuje jeho sílu a moc na tomto světě.
	AI_Output(self,other,"DIA_DMT_4571_Jan_Proof_01_06");   //No, pokud Temný bůh tolik touží po tomto artefaktu, bude muset draze zapltit.
	AI_Output(self,other,"DIA_DMT_4571_Jan_Proof_01_07");   //Jinak se ty dveře před tebou niky neotevřou.

	if(UndeadDragonIsDead == FALSE)
	{
		AI_Output(other,self,"DIA_DMT_4571_Jan_Proof_01_08");   //Dobře, kde ho mám hledat?
		AI_Output(self,other,"DIA_DMT_4571_Jan_Proof_01_09");   //V jednom z nejposvátnějších chrámů Beliara, kde jinde...
		AI_Output(self,other,"DIA_DMT_4571_Jan_Proof_01_10");   //Ale pochybuju, že získáš přístup, byť jen do jednoho z nich.
		AI_Output(other,self,"DIA_DMT_4571_Jan_Proof_01_11");   //Tak sleduj. Dokázal jsem to.
		AI_Output(self,other,"DIA_DMT_4571_Jan_Proof_01_12");   //Co, po pravdě řečeno, velmi jsi mě překvapil...
		AI_Output(self,other,"DIA_DMT_4571_Jan_Proof_01_13");   //Nicméně, nevypadáš jako někdo, kdo by dokázal porazit, jednoho z nejsilnějších tvorů na tomto světě.
		AI_Output(self,other,"DIA_DMT_4571_Jan_Proof_01_14");   //A nezměním názor do té doby, dokud neuvidím před sebou duši toho tvora.
	};

	B_LogEntry(TOPIC_PashalQuest,"Janus mně otevře bránu, pokud mu přinesu duši Beliarova vyvoleného!");
};

instance DIA_DMT_4571_Jan_ProofDone(C_Info)
{
   npc = DMT_4571_Jan;
   nr = 1;
   condition = DIA_DMT_4571_Jan_ProofDone_condition;
   information = DIA_DMT_4571_Jan_ProofDone_info;
   permanent = FALSE;
   description = "Zde je duše Beliarova vyvoleného!";
};

func int DIA_DMT_4571_Jan_ProofDone_condition()
{
	if((Npc_KnowsInfo(other,DIA_DMT_4571_Jan_Proof) == TRUE) && (MIS_PashalQuest == LOG_Running) && (PashalQuestJanusStep == TRUE) && (Npc_HasItems(other,ItAt_UndeadDragonSoulStone) >= 1))
	{
		return TRUE;
	};
};

func void DIA_DMT_4571_Jan_ProofDone_info()
{
	B_GivePlayerXP(2000);
	AI_Output(other,self,"DIA_DMT_4571_Jan_ProofDone_01_00");   //Zde je duše Beliarova vyvoleného!
	AI_Output(self,other,"DIA_DMT_4571_Jan_ProofDone_01_01");   //Opravdu to je ona... Skláním se před tebou velký válečníku!
	AI_Output(other,self,"DIA_DMT_4571_Jan_ProofDone_01_02");   //A teď mě pustíš?
	AI_Output(self,other,"DIA_DMT_4571_Jan_ProofDone_01_03");   //Jak jsem slíbil! Stačí položit duši co jsi přines na oltář za tvými zády.
	AI_Output(self,other,"DIA_DMT_4571_Jan_ProofDone_01_04");   //Poté se ti dvře otevřou a ty můžeš vstoupit.
	B_LogEntry(TOPIC_PashalQuest,"Přinesl jsem Janusovi duši. Nyní je potřeba umístit ji na oltář, který je poblíž a pak by se dveře měli otevřít.");
	PashalQuestEgezartStep = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_DMT_4572_Trazege_EXIT(C_Info)
{
   npc = DMT_4572_Trazege;
   nr = 999;
   condition = DIA_DMT_4572_Trazege_exit_condition;
   information = DIA_DMT_4572_Trazege_exit_info;
   permanent = TRUE;
   description = Dialog_Ende;
};

func int DIA_DMT_4572_Trazege_exit_condition()
{
   return TRUE;
};

func void DIA_DMT_4572_Trazege_exit_info()
{
   AI_StopProcessInfos(self);
};

instance DIA_DMT_4572_Trazege_HELLO(C_Info)
{
   npc = DMT_4572_Trazege;
   nr = 1;
   condition = DIA_DMT_4572_Trazege_HELLO_condition;
   information = DIA_DMT_4572_Trazege_HELLO_info;
   permanent = FALSE;
   important = TRUE;
};

func int DIA_DMT_4572_Trazege_HELLO_condition()
{
	if(XranFregIsDead == TRUE)
	{
		return TRUE;
	};
};

func void DIA_DMT_4572_Trazege_HELLO_info()
{
	AI_Output(self,other,"DIA_DMT_4572_Trazege_HELLO_01_00");   //Co tady děláš?! A jak ses sem dostal?
	AI_Output(other,self,"DIA_DMT_4572_Trazege_HELLO_01_01");   //Prostřednictvím magického portálu.
	AI_Output(self,other,"DIA_DMT_4572_Trazege_HELLO_01_02");   //(s úsměvem) To mě napadlo taky chytráku.
	AI_Output(self,other,"DIA_DMT_4572_Trazege_HELLO_01_03");   //Mě zajímá jiná věc - koho to k čertu to sem Janus pustil?!
	AI_Output(other,self,"DIA_DMT_4572_Trazege_HELLO_01_04");   //Prošel jsem jeho zkouškou a dokázal, že jsem toho hoden.
	AI_Output(self,other,"DIA_DMT_4572_Trazege_HELLO_01_05");   //Hoden?! A co jsi udělal, hrdino?
	AI_Output(other,self,"DIA_DMT_4572_Trazege_HELLO_01_06");   //Zabil jsem Beliarova vyvoleného! Je to málo?
	AI_Output(self,other,"DIA_DMT_4572_Trazege_HELLO_01_07");   //Hmmm...(nedbale) Po pravdě řečeno, není to zas tak působivé.
	AI_Output(other,self,"DIA_DMT_4572_Trazege_HELLO_01_08");   //Proč?
	AI_Output(self,other,"DIA_DMT_4572_Trazege_HELLO_01_09");   //Už jsem si zvykl na to, že jeho vyvolení nežíjí dlouho na tomto světě.
	AI_Output(self,other,"DIA_DMT_4572_Trazege_HELLO_01_10");   //Vždycky se najde někdo, kdo je trvale pošle zpět ke svému pánovi do říše temnoty!
	AI_Output(self,other,"DIA_DMT_4572_Trazege_HELLO_01_11");   //Takže nejsi první ani poslední, kdo to udělal.
	AI_Output(self,other,"DIA_DMT_4572_Trazege_HELLO_01_12");   //A sám Beliar si jistě už našel nějakou náhradu. Tak, to vidíš - historie se opakuje!
	AI_Output(other,self,"DIA_DMT_4572_Trazege_HELLO_01_13");   //A kdo je teď jeho vyvolený?
	AI_Output(self,other,"DIA_DMT_4572_Trazege_HELLO_01_14");   //Pokud je mi známo, Xardas - mocný temný čaroděj! 
	AI_Output(self,other,"DIA_DMT_4572_Trazege_HELLO_01_15");   //No... (směje se) Uvidíme, jak dlouho vydrží.
	AI_Output(self,other,"DIA_DMT_4572_Trazege_HELLO_01_16");   //Ale dost už řečí! Jestli jsi chtěl získat moji pozornost, tak ji máš.
	AI_Output(self,other,"DIA_DMT_4572_Trazege_HELLO_01_17");   //A teď mě odpověz - proč jsi sem přišel?
};

instance DIA_DMT_4572_Trazege_GiveMePower(C_Info)
{
   npc = DMT_4572_Trazege;
   nr = 1;
   condition = DIA_DMT_4572_Trazege_GiveMePower_condition;
   information = DIA_DMT_4572_Trazege_GiveMePower_info;
   permanent = FALSE;
   description = "Hledám jeden artefakt.";
};

func int DIA_DMT_4572_Trazege_GiveMePower_condition()
{
	if(Npc_KnowsInfo(other,DIA_DMT_4572_Trazege_HELLO) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_DMT_4572_Trazege_GiveMePower_info()
{
	B_GivePlayerXP(5000);
	AI_Output(other,self,"DIA_DMT_4572_Trazege_GiveMePower_01_00");   //Hledám jeden artefakt. Nazývá se Nivram.
	AI_Output(other,self,"DIA_DMT_4572_Trazege_GiveMePower_01_01");   //Co vím, s jeho pomocí...
	AI_Output(self,other,"DIA_DMT_4572_Trazege_GiveMePower_01_02");   //Nemusíš dál pokračovat... Už jsem to pochopil.
	AI_Output(self,other,"DIA_DMT_4572_Trazege_GiveMePower_01_03");   //Zřejmě jsi jeden z těch, co s jeho pomocí chtějí získat neomezenou moc a vládu nad tímto světem.
	AI_Output(other,self,"DIA_DMT_4572_Trazege_GiveMePower_01_04");   //No, ne tak docela. Ten artefakt chce získat Beliar.
	AI_Output(self,other,"DIA_DMT_4572_Trazege_GiveMePower_01_05");   //(smích) Kdo si myslí, že je, ten ubohý bůžek!
	AI_Output(self,other,"DIA_DMT_4572_Trazege_GiveMePower_01_06");   //Nikdo, ani on, ani jeho bratr Innos nikdy nedostanou artefakt.
	AI_Output(self,other,"DIA_DMT_4572_Trazege_GiveMePower_01_07");   //Jsou příliš chamtiví a pyšní, než aby mohli vládnout jeho neomezenou mocí.
	AI_Output(self,other,"DIA_DMT_4572_Trazege_GiveMePower_01_08");   //Možná bych ho mohl darovat Adanovi, ale je příliš moudrý než aby tento dar přijal.
	AI_Output(self,other,"DIA_DMT_4572_Trazege_GiveMePower_01_09");   //Takže jestli ti to nebude vadit, nechám si ho u sebe!
	AI_Output(other,self,"DIA_DMT_4572_Trazege_GiveMePower_01_10");   //A tobě je k čemu?
	AI_Output(self,other,"DIA_DMT_4572_Trazege_GiveMePower_01_12");   //S pomocí tohoto artefaktu zajišťuji rovnováhu tohoto světa a napravuji chyby všech těch rádoby bohů.
	AI_Output(self,other,"DIA_DMT_4572_Trazege_GiveMePower_01_13");   //Jsem ten díky komu tento svět ještě žije a dýchá! A ty také.
	AI_Output(self,other,"DIA_DMT_4572_Trazege_GiveMePower_01_14");   //Proto zůstane tam kde je, než příde doba zničit tento svět a poté ho znovu vzkřísit. 
	AI_Output(self,other,"DIA_DMT_4572_Trazege_GiveMePower_01_15");   //A věř mi, tak to bude!
	B_LogEntry(TOPIC_PashalQuest,"V chrámu jsem se setkal s Egezartem, strážcem artefaktu který jsem hledal. Jak se dalo očekávat nechtěl mě artefak přenechat.");
};

instance DIA_DMT_4572_Trazege_NoAtAll(C_Info)
{
   npc = DMT_4572_Trazege;
   nr = 1;
   condition = DIA_DMT_4572_Trazege_NoAtAll_condition;
   information = DIA_DMT_4572_Trazege_NoAtAll_info;
   permanent = FALSE;
   description = "A když si ho vezmu silou?";
};

func int DIA_DMT_4572_Trazege_NoAtAll_condition()
{
	if(Npc_KnowsInfo(other,DIA_DMT_4572_Trazege_GiveMePower) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_DMT_4572_Trazege_NoAtAll_info()
{
	AI_Output(other,self,"DIA_DMT_4572_Trazege_NoAtAll_01_00");   //A když si ho vezmu silou?
	AI_Output(self,other,"DIA_DMT_4572_Trazege_NoAtAll_01_01");   //(smích) hlupáku!
	AI_Output(self,other,"DIA_DMT_4572_Trazege_NoAtAll_01_02");   //Myslíš si, že tvé zbraně nebo magie mě může ublížit?
	AI_Output(self,other,"DIA_DMT_4572_Trazege_NoAtAll_01_03");   //Mně stačí jen pomyslet, a ty tady zemřeš ve strašných mukách.
	AI_PlayAni(hero,"T_INSANE");
	AI_Output(self,other,"DIA_DMT_4572_Trazege_NoAtAll_01_04");   //(hrdě) No co, už chápeš marnost svého nápadu. 
	AI_Output(other,self,"DIA_DMT_4572_Trazege_NoAtAll_01_05");   //Dobře, pochopil jsem! Nemusíš pokračovat.
	B_LogEntry(TOPIC_PashalQuest,"Chtěl jsem si vzít moc artefaktu silou, ale pochopil jsem, že tento boj nemohu vyhrát.");
};

instance DIA_DMT_4572_Trazege_BuyGift(C_Info)
{
   npc = DMT_4572_Trazege;
   nr = 1;
   condition = DIA_DMT_4572_Trazege_BuyGift_condition;
   information = DIA_DMT_4572_Trazege_BuyGift_info;
   permanent = FALSE;
   description = "A co mám teď dělat?";
};

func int DIA_DMT_4572_Trazege_BuyGift_condition()
{
	if(Npc_KnowsInfo(other,DIA_DMT_4572_Trazege_NoAtAll) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_DMT_4572_Trazege_BuyGift_info()
{
	AI_Output(other,self,"DIA_DMT_4572_Trazege_BuyGift_01_00");   //A co mám teď dělat?
	AI_Output(self,other,"DIA_DMT_4572_Trazege_BuyGift_01_01");   //Raději odejdi a nikdy se nevracej.
	AI_Output(self,other,"DIA_DMT_4572_Trazege_BuyGift_01_02");   //Artefakt, co jsi hledal, tu zůstane navždy!
	AI_Output(self,other,"DIA_DMT_4572_Trazege_BuyGift_01_03");   //No, nebo alespoň tak dlouho, než jeho tvůrci, rozhodnou o jeho dalším osudu.
	AI_Output(self,other,"DIA_DMT_4572_Trazege_BuyGift_01_04");   //Co se týče tebe... Překonal jsi dlouhou a nebezpečnou cestu!
	AI_Output(self,other,"DIA_DMT_4572_Trazege_BuyGift_01_05");   //To vše zaslouží respekt, proto tě nepustím s prázdnou.
	AI_Output(self,other,"DIA_DMT_4572_Trazege_BuyGift_01_06");   //Vyber si svoji odměnu, smrtelníku... A buď moudrý ve svém výběru!
	B_LogEntry(TOPIC_PashalQuest,"Přijal jsem skutečnost, že jsem nikdy neměl získat tento předmět. Zůstane vždy v tomto chrámu. Nicméně nevrátil jsem se s prázdnýma rukama - Egezart mě obdaroval, za to, že jsem se dokázal dostat až tak daleko. Myslím, že zde by měl tento příběh skončit...");
   	Info_ClearChoices(DIA_DMT_4572_Trazege_BuyGift);
   	Info_AddChoice(DIA_DMT_4572_Trazege_BuyGift,"Daruj mě život a výdrž!",DIA_DMT_4572_Trazege_BuyGift_Hp);
   	Info_AddChoice(DIA_DMT_4572_Trazege_BuyGift,"Dej mě moudrost a znalosti!",DIA_DMT_4572_Trazege_BuyGift_Mana);
   	Info_AddChoice(DIA_DMT_4572_Trazege_BuyGift,"Udělej mě nezkonale chytrým a obratným!",DIA_DMT_4572_Trazege_BuyGift_Dex);
   	Info_AddChoice(DIA_DMT_4572_Trazege_BuyGift,"Dej mi ohromnou sílu!",DIA_DMT_4572_Trazege_BuyGift_Str);
};

func void DIA_DMT_4572_Trazege_BuyGift_Str()
{
	AI_Output(other,self,"DIA_DMT_4572_Trazege_BuyGift_Str_01_00");   //Dej mi ohromnou sílu!
	B_RaiseAttribute_Bonus(other,ATR_STRENGTH,50);
	AI_Output(self,other,"DIA_DMT_4572_Trazege_BuyGift_Str_01_01");   //Jak chceš... Užij si svojí volbu! Nyní, nashledanou.
	MIS_PashalQuest = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_PashalQuest,LOG_SUCCESS);
	AI_StopProcessInfos(self);
};

func void DIA_DMT_4572_Trazege_BuyGift_Dex()
{
	AI_Output(other,self,"DIA_DMT_4572_Trazege_BuyGift_Dex_01_00");   //Udělej mě nezkonale chytrým a obratným!
	B_RaiseAttribute_Bonus(other,ATR_DEXTERITY,50);
	AI_Output(self,other,"DIA_DMT_4572_Trazege_BuyGift_Dex_01_01");   //Jak chceš... Užij si svojí volbu! Nyní, nashledanou.
	MIS_PashalQuest = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_PashalQuest,LOG_SUCCESS);
	AI_StopProcessInfos(self);
};

func void DIA_DMT_4572_Trazege_BuyGift_Mana()
{
	AI_Output(other,self,"DIA_DMT_4572_Trazege_BuyGift_Mana_01_00");   //Dej mě moudrost a znalosti!
	B_RaiseAttribute_Bonus(other,ATR_MANA_MAX,150);
	Npc_ChangeAttribute(other,ATR_MANA,150);
	ATR_INTELLECT += 20;
	Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
	AI_Output(self,other,"DIA_DMT_4572_Trazege_BuyGift_Mana_01_01");   //Jak chceš... Užij si svojí volbu! Nyní, nashledanou.
	MIS_PashalQuest = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_PashalQuest,LOG_SUCCESS);
	AI_StopProcessInfos(self);
};

func void DIA_DMT_4572_Trazege_BuyGift_Hp()
{
	var int TempStaminaMax;

	AI_Output(other,self,"DIA_DMT_4572_Trazege_BuyGift_Hp_01_00");   //Daruj mě život a výdrž!
	B_RaiseAttribute(other,ATR_HITPOINTS_MAX,500);
	Npc_ChangeAttribute(other,ATR_HITPOINTS,500);

	if(ATR_STAMINA_MAX[0] <= 90)
	{
		ATR_STAMINA_MAX[0] = ATR_STAMINA_MAX[0] + 10;
		Npc_SetTalentSkill(hero,NPC_TALENT_STAMINA,ATR_STAMINA_MAX[0]);
	}
	else
	{
		TempStaminaMax = 100 - ATR_STAMINA_MAX[0];
		ATR_STAMINA_MAX[0] = ATR_STAMINA_MAX[0] + TempStaminaMax;
		Npc_SetTalentSkill(hero,NPC_TALENT_STAMINA,ATR_STAMINA_MAX[0]);
	};

	AI_Output(self,other,"DIA_DMT_4572_Trazege_BuyGift_Hp_01_01");   //Jak chceš... Užij si svojí volbu! Nyní, na shledanou.
	MIS_PashalQuest = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_PashalQuest,LOG_SUCCESS);
	AI_StopProcessInfos(self);
};

instance DIA_KDW_4573_Oddler_EXIT(C_Info)
{
   npc = KDW_4573_Oddler;
   nr = 999;
   condition = DIA_KDW_4573_Oddler_exit_condition;
   information = DIA_KDW_4573_Oddler_exit_info;
   permanent = TRUE;
   description = Dialog_Ende;
};

func int DIA_KDW_4573_Oddler_exit_condition()
{
   return TRUE;
};

func void DIA_KDW_4573_Oddler_exit_info()
{
   AI_StopProcessInfos(self);
};

instance DIA_KDW_4573_Oddler_HELLO(C_Info)
{
   npc = KDW_4573_Oddler;
   nr = 1;
   condition = DIA_KDW_4573_Oddler_HELLO_condition;
   information = DIA_KDW_4573_Oddler_HELLO_info;
   permanent = FALSE;
   important = TRUE;
};

func int DIA_KDW_4573_Oddler_HELLO_condition()
{
   return TRUE;
};

func void DIA_KDW_4573_Oddler_HELLO_info()
{
   AI_Output(self,other,"DIA_KDW_4573_Oddler_HELLO_01_00");   //Zdravím tě poutníku. Ztratil ses?
   AI_Output(other,self,"DIA_KDW_4573_Oddler_HELLO_01_01");   //Z čeho tak usuzuješ?
   AI_Output(self,other,"DIA_KDW_4573_Oddler_HELLO_01_02");   //(vzdych) Toto místo je příliš nebezpečné na procházky.
   AI_Output(self,other,"DIA_KDW_4573_Oddler_HELLO_01_03");   //Nikdo se zdravím rozumem by se sem nevydal.
   AI_Output(self,other,"DIA_KDW_4573_Oddler_HELLO_01_04");   //Takže ses buď ztratil, nebo... možná, něco hledáš.
   AI_Output(self,other,"DIA_KDW_4573_Oddler_HELLO_01_05");   //A co je pro tebe tak důležité, že jsi pro to ochoten riskovat svůj život.
};

instance DIA_KDW_4573_Oddler_WhoYou(C_Info)
{
   npc = KDW_4573_Oddler;
   nr = 1;
   condition = DIA_KDW_4573_Oddler_WhoYou_condition;
   information = DIA_KDW_4573_Oddler_WhoYou_info;
   permanent = FALSE;
   description = "A ty tady děláš co?";
};

func int DIA_KDW_4573_Oddler_WhoYou_condition()
{
   if(Npc_KnowsInfo(other,DIA_KDW_4573_Oddler_HELLO) == TRUE)
   {
      return TRUE;
   };
};

func void DIA_KDW_4573_Oddler_WhoYou_info()
{
  AI_Output(other,self,"DIA_KDW_4573_Oddler_WhoYou_01_00");   //A ty tady děláš co?
   AI_Output(self,other,"DIA_KDW_4573_Oddler_WhoYou_01_01");   //Jak můžeš vidět, žiju. (klidně) Pro mě je to, to nejlepší místo.
   AI_Output(self,other,"DIA_KDW_4573_Oddler_WhoYou_01_02");   //Klidné místo - to je vše co potřebuji. A co je nejdůležitější, daleko od lidí! 
   AI_Output(other,self,"DIA_KDW_4573_Oddler_WhoYou_01_03");   //A tebe netrápí, že všude okolo je spousta skřetů a dalších šelem?
   AI_Output(self,other,"DIA_KDW_4573_Oddler_WhoYou_01_04");   //Skřeti tady nejsou, jejich tábory se nacházejí v jiné části hor.
   AI_Output(self,other,"DIA_KDW_4573_Oddler_WhoYou_01_05");   //A co se týče toho ostatního s tím si nějak poradím.
   AI_Output(self,other,"DIA_KDW_4573_Oddler_WhoYou_01_06");   //I přesto, že jsem mág (usmívá se)
};

instance DIA_KDW_4573_Oddler_Mage(C_Info)
{
   npc = KDW_4573_Oddler;
   nr = 1;
   condition = DIA_KDW_4573_Oddler_Mage_condition;
   information = DIA_KDW_4573_Oddler_Mage_info;
   permanent = FALSE;
   description = "Ty jsi také mág?";
};

func int DIA_KDW_4573_Oddler_Mage_condition()
{
   if(Npc_KnowsInfo(other,DIA_KDW_4573_Oddler_WhoYou) == TRUE)
   {
      return TRUE;
   };
};

func void DIA_KDW_4573_Oddler_Mage_info()
{
   AI_Output(other,self,"DIA_KDW_4573_Oddler_Mage_01_00");   //Ty jsi také mág?
   AI_Output(self,other,"DIA_KDW_4573_Oddler_Mage_01_01");   //Mág Vody, abych byl přesný.
   AI_Output(other,self,"DIA_KDW_4573_Oddler_Mage_01_02");   //Z Nového tábora?
   AI_Output(self,other,"DIA_KDW_4573_Oddler_Mage_01_03");   //Hmmm. (zamyšleně) Co je to Nový tábor?
   AI_Output(other,self,"DIA_KDW_4573_Oddler_Mage_01_04");   //Ten v Hornickém údolí, samozřejmě.
   AI_Output(self,other,"DIA_KDW_4573_Oddler_Mage_01_05");   //Omlouvám se, ale nikdy jsem o něm neslyšel.
   AI_Output(other,self,"DIA_KDW_4573_Oddler_Mage_01_06");   //Takže, odkud jsi?
   AI_Output(self,other,"DIA_KDW_4573_Oddler_Mage_01_07");   //Pocházím ze Sildenu. (klidně) Je to malé městečko v Myrtaně.
   AI_Output(other,self,"DIA_KDW_4573_Oddler_Mage_01_08");   //A jak ses dostal do Khorinisu?
   AI_Output(self,other,"DIA_KDW_4573_Oddler_Mage_01_09");   //Připlul jsem na lodi, jak jinak.
   AI_Output(other,self,"DIA_KDW_4573_Oddler_Mage_01_10");   //Proč?
   AI_Output(self,other,"DIA_KDW_4573_Oddler_Mage_01_11");   //Měl jsem zprávu pro vrchního mága kruhu Ohně Corrista.
   AI_Output(self,other,"DIA_KDW_4573_Oddler_Mage_01_12");   //Byl mentorem v klášteře Innose, který se nachází na tomto ostrově.
   AI_Output(self,other,"DIA_KDW_4573_Oddler_Mage_01_13");   //Je pravda, že to bylo dávno. Od té doby uplynulo více než deset let.
   AI_Output(other,self,"DIA_KDW_4573_Oddler_Mage_01_14");   //No, dobře. A jak ses dostal sem?
   AI_Output(self,other,"DIA_KDW_4573_Oddler_Mage_01_15");   //Spolu s mágy Ohně jsem se zůčastnil, jedné z výzkumných expedic.
   AI_Output(self,other,"DIA_KDW_4573_Oddler_Mage_01_16");   //Chtěli jsme lépe prozkoumat tyto hory, a možná najít něco zajímavého.
   AI_Output(self,other,"DIA_KDW_4573_Oddler_Mage_01_17");   //Místo toho jsem se dostal do zajetí skřetů.
   AI_Output(self,other,"DIA_KDW_4573_Oddler_Mage_01_18");   //Nebýt mágem tak mě zabili! Ale jejich nejvyšší šaman se zajímal o moji magii.
   AI_Output(self,other,"DIA_KDW_4573_Oddler_Mage_01_19");   //To mě zachránilo život. (povzdech)
   AI_Output(self,other,"DIA_KDW_4573_Oddler_Mage_01_20");   //O několik let později se mi podařilo uniknout z jejich tábora.
   AI_Output(self,other,"DIA_KDW_4573_Oddler_Mage_01_21");   //Při putování po horách jsem narzil na toto místo a teď zde žiju.
   AI_Output(self,other,"DIA_KDW_4573_Oddler_Mage_01_22");   //To je celý můj příběh.
};

instance DIA_KDW_4573_Oddler_Blind(C_Info)
{
   npc = KDW_4573_Oddler;
   nr = 1;
   condition = DIA_KDW_4573_Oddler_Blind_condition;
   information = DIA_KDW_4573_Oddler_Blind_info;
   permanent = FALSE;
   description = "Ty máš zavázané oči.";
};

func int DIA_KDW_4573_Oddler_Blind_condition()
{
   if(Npc_KnowsInfo(other,DIA_KDW_4573_Oddler_Mage) == TRUE)
   {
      return TRUE;
   };
};

func void DIA_KDW_4573_Oddler_Blind_info()
{
   AI_Output(other,self,"DIA_KDW_4573_Oddler_Blind_01_00");   //Ty máš zavázané oči. Jsi slepý?
   AI_Output(self,other,"DIA_KDW_4573_Oddler_Blind_01_01");   //Ano. (s povzdechem) Jak vidíš.
   AI_Output(other,self,"DIA_KDW_4573_Oddler_Blind_01_02");   //Jak se to stalo?
   AI_Output(self,other,"DIA_KDW_4573_Oddler_Blind_01_03");   //Aby mě skřeti odradili od pouhé myšlenky na útěk, tak mě vypálili oči.
   AI_Output(self,other,"DIA_KDW_4573_Oddler_Blind_01_04");   //Zpočátku to bylo velmi těžké, nedokázal jsem ujít dva metry bez cizí pomoci.
   AI_Output(self,other,"DIA_KDW_4573_Oddler_Blind_01_05");   //Ale postupem času se zbystřily mé další smysly - sluch a nebo čich.
   AI_Output(self,other,"DIA_KDW_4573_Oddler_Blind_01_06");   //A to vše mi pomohlo přežít. Teď nepotřebuji vidět, abych věděl, kdo stojí přede mnou.
   AI_Output(self,other,"DIA_KDW_4573_Oddler_Blind_01_07");   //Mimochodem, ty ses právě chystal vylézt tuto horu a já už věděl, že jsem někdo jde.
};

instance DIA_KDW_4573_Oddler_Away(C_Info)
{
   npc = KDW_4573_Oddler;
   nr = 1;
   condition = DIA_KDW_4573_Oddler_Away_condition;
   information = DIA_KDW_4573_Oddler_Away_info;
   permanent = FALSE;
   description = "Ty se odsud nechceš dostat?";
};

func int DIA_KDW_4573_Oddler_Away_condition()
{
   if(Npc_KnowsInfo(other,DIA_KDW_4573_Oddler_Mage) == TRUE)
   {
      return TRUE;
   };
};

func void DIA_KDW_4573_Oddler_Away_info()
{
   AI_Output(other,self,"DIA_KDW_4573_Oddler_Getout_01_00");   //Ty se odsud nechceš dostat?
   AI_Output(self,other,"DIA_KDW_4573_Oddler_Getout_01_01");   //Ne. (klidně) Líbí se mě tady! Je to klidný a tichý místo.
   AI_Output(self,other,"DIA_KDW_4573_Oddler_Getout_01_02");   //Mimo to přechod přes hory bude extrémě nebezpečný.
   AI_Output(self,other,"DIA_KDW_4573_Oddler_Getout_01_03");   //A bez dobré přípravy můžeš lehce zemřít.
   AI_Output(self,other,"DIA_KDW_4573_Oddler_Getout_01_04");   //Nebo ještě hůř, chytí tě skřeti.
   AI_Output(self,other,"DIA_KDW_4573_Oddler_Getout_01_05");   //Takové myšlenky mě napadají čím dál tím méně.
};

instance DIA_KDW_4573_Oddler_Mount(C_Info)
{
   npc = KDW_4573_Oddler;
   nr = 1;
   condition = DIA_KDW_4573_Oddler_Mount_condition;
   information = DIA_KDW_4573_Oddler_Mount_info;
   permanent = FALSE;
   description = "Co je tady v horách zajímavé?";
};

func int DIA_KDW_4573_Oddler_Mount_condition()
{
   if(Npc_KnowsInfo(other,DIA_KDW_4573_Oddler_Mage) == TRUE)
   {
      return TRUE;
   };
};

func void DIA_KDW_4573_Oddler_Mount_info()
{
   AI_Output(other,self,"DIA_KDW_4573_Oddler_Mount_01_00");   //Co je tady v horách zajímavé?
   AI_Output(self,other,"DIA_KDW_4573_Oddler_Mount_01_01");   //Nic zvláštního. (klidně)
   AI_Output(self,other,"DIA_KDW_4573_Oddler_Mount_01_02");   //Někde dole se musí nacházet malá pevnost. 
   AI_Output(self,other,"DIA_KDW_4573_Oddler_Mount_01_03");   //Byla postavena paladiny, kteří nás doprovázeli na té nešťastné expedici.
   AI_Output(self,other,"DIA_KDW_4573_Oddler_Mount_01_04");   //Nedaleko od ní se nachází starodávná svatyně skřetů. Tam mě drželi v zajetí!
   AI_Output(other,self,"DIA_KDW_4573_Oddler_Mount_01_05");   //A kde je jejich tábor?
   AI_Output(self,other,"DIA_KDW_4573_Oddler_Mount_01_06");   //Daleko od tud, na druhé straně hor.
   AI_Output(self,other,"DIA_KDW_4573_Oddler_Mount_01_07");   //Ale neradím ti tam chodit, jestli nechceš sdílet můj osud.
   AI_Output(other,self,"DIA_KDW_4573_Oddler_Mount_01_08");   //Rozumím, ještě něco?
   AI_Output(self,other,"DIA_KDW_4573_Oddler_Mount_01_09");   //To je vše co vím (klidně) Nic jiného mě nenapadá.
   AI_Output(other,self,"DIA_KDW_4573_Oddler_Mount_01_10");   //Dobře, děkuji.
};

instance DIA_KDW_4573_Oddler_Work(C_Info)
{
   npc = KDW_4573_Oddler;
   nr = 1;
   condition = DIA_KDW_4573_Oddler_Work_condition;
   information = DIA_KDW_4573_Oddler_Work_info;
   permanent = FALSE;
   description = "Co tady děláš?";
};

func int DIA_KDW_4573_Oddler_Work_condition()
{
   if(Npc_KnowsInfo(other,DIA_KDW_4573_Oddler_Blind) == TRUE)
   {
      return TRUE;
   };
};

func void DIA_KDW_4573_Oddler_Work_info()
{
   AI_Output(other,self,"DIA_KDW_4573_Oddler_Work_01_00");   //Co tady děláš?
   AI_Output(self,other,"DIA_KDW_4573_Oddler_Work_01_01");   //A ty co, jsi taky slepý? (zasměje se) Copak nevidíš?
   AI_Output(self,other,"DIA_KDW_4573_Oddler_Work_01_02");   //Stavím si chatu.
   AI_Output(other,self,"DIA_KDW_4573_Oddler_Work_01_03");   //Proč, v jeskyni se ti nelíbí?
   AI_Output(self,other,"DIA_KDW_4573_Oddler_Work_01_04");   //No, je v ní teplo, ale nedokáže tě ochránit proti zdejším mrazů.
   AI_Output(self,other,"DIA_KDW_4573_Oddler_Work_01_05");   //Nicméně, mám akutní nedostatek nástrojů. Rezavá pila - to je jediný nástroj, který jsem zde našel.
   AI_Output(self,other,"DIA_KDW_4573_Oddler_Work_01_06");   //A s ní toho moc neuděláš.
};

instance DIA_KDW_4573_Oddler_WorkDo(C_Info)
{
   npc = KDW_4573_Oddler;
   nr = 1;
   condition = DIA_KDW_4573_Oddler_WorkDo_condition;
   information = DIA_KDW_4573_Oddler_WorkDo_info;
   permanent = FALSE;
   description = "Mohu ti získat nějaké nástroje.";
};

func int DIA_KDW_4573_Oddler_WorkDo_condition()
{
   if(Npc_KnowsInfo(other,DIA_KDW_4573_Oddler_Blind) == TRUE)
   {
      return TRUE;
   };
};

func void DIA_KDW_4573_Oddler_WorkDo_info()
{
	AI_Output(other,self,"DIA_KDW_4573_Oddler_WorkDo_01_00");   //Mohu ti sehnat nějaké nástroje.
	AI_Output(self,other,"DIA_KDW_4573_Oddler_WorkDo_01_01");   //Opravdu? (překvapeně): No, tak to asi vaši pomoc neodmítnu.
	AI_Output(self,other,"DIA_KDW_4573_Oddler_WorkDo_01_02");   //Potřebuji kladivo, pilu a nový krumpáč. Abych opracoval kameny.
	AI_Output(self,other,"DIA_KDW_4573_Oddler_WorkDo_01_03");   //Pokud se ti podaří tohle všechno získat, byl bych ti velmi vděčný.
	AI_Output(other,self,"DIA_KDW_4573_Oddler_WorkDo_01_04");   //Souhlasím.
	MIS_OddlerlTools = LOG_Running;
	Log_CreateTopic(TOPIC_OddlerlTools,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OddlerlTools,LOG_Running);
	B_LogEntry(TOPIC_OddlerlTools,"Oddler potřebuje nové nástroje na stavbu chatrče. Poprosil mě jestli bych mu nepřines kladivo, novou pilu a krumpáč.");
};

instance DIA_KDW_4573_Oddler_Done(C_Info)
{
	npc = KDW_4573_Oddler;
	nr = 99;
	condition = DIA_KDW_4573_Oddler_Done_Condition;
	information = DIA_KDW_4573_Oddler_Done_Info;
	description = "Zde jsou nové nástroje.";
};

func int DIA_KDW_4573_Oddler_Done_Condition()
{
	if((MIS_OddlerlTools == LOG_Running) && (Npc_HasItems(other,ItMi_Hammer) >= 1) && (Npc_HasItems(other,ItMi_Saw) >= 1) && (Npc_HasItems(other,ItMw_2H_Axe_L_01) >= 1))
	{
		return TRUE;
	};
};

func void DIA_KDW_4573_Oddler_Done_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_KDW_4573_Oddler_Done_01_00");	//Zde jsou nové nástroje.
	B_GiveInvItemsManyThings(other,self);
	Npc_RemoveInvItems(hero,ItMi_Hammer,1);
	Npc_RemoveInvItems(hero,ItMi_Saw,1);
	Npc_RemoveInvItems(hero,ItMw_2H_Axe_L_01,1);
	AI_Output(self,other,"DIA_KDW_4573_Oddler_Done_01_01");	//Děkuju, nyní půjde stavba chatrče mnohem rychleji.
	AI_Output(self,other,"DIA_KDW_4573_Oddler_Done_01_02");	//Na tady, vem si ten magický svitek, na znamení mé vděčnosti.
	B_GiveInvItems(self,other,ItSc_Shrink,1);
	MIS_OddlerlTools = LOG_Success;
	Log_SetTopicStatus(TOPIC_OddlerlTools,LOG_Success);
	B_LogEntry(TOPIC_OddlerlTools,"Přinesl jsem Oddlerovi potřebné nástroje.");
};

instance DIA_KDW_4573_Oddler_XRANFREG(C_Info)
{
   npc = KDW_4573_Oddler;
   nr = 1;
   condition = DIA_KDW_4573_Oddler_XRANFREG_condition;
   information = DIA_KDW_4573_Oddler_XRANFREG_info;
   permanent = FALSE;
   description = "Řekni mi něco o expedici.";
};

func int DIA_KDW_4573_Oddler_XRANFREG_condition()
{
   if((Npc_KnowsInfo(other,DIA_KDW_4573_Oddler_Mage) == TRUE) && (MIS_XRANFREG == LOG_Running))
   {
      return TRUE;
   };
};

func void DIA_KDW_4573_Oddler_XRANFREG_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_KDW_4573_Oddler_XRANFREG_01_00");   //Řekni mi něco o expedici.
	AI_Output(self,other,"DIA_KDW_4573_Oddler_XRANFREG_01_01");   //Ach. To bylo dávno!
	AI_Output(self,other,"DIA_KDW_4573_Oddler_XRANFREG_01_02");   //Zůčastnilo se jí jen několik mágů Ohně a paladinové co se přihlásili dobrovolně jako doprovod.
	AI_Output(self,other,"DIA_KDW_4573_Oddler_XRANFREG_01_03");   //Mistr Corristo mě pozval abych šel s nima a pomohl jim prozkoumat, neznámou část ostrova.
	AI_Output(self,other,"DIA_KDW_4573_Oddler_XRANFREG_01_04");   //Zpočátku jsem se chtěl vrátit z této nebezpečné výpravy.
	AI_Output(self,other,"DIA_KDW_4573_Oddler_XRANFREG_01_05");   //Ale Corristo mě přesvědčil o nutnosti mé přítomnosti, a tak jsem se rozhodl zůstat.
	AI_Output(self,other,"DIA_KDW_4573_Oddler_XRANFREG_01_06");   //Přes hory jsme přešli poměrně lehko. (zamyšleně)
	AI_Output(self,other,"DIA_KDW_4573_Oddler_XRANFREG_01_07");   //Když jsme se sem dostali, Corristo nechal postavit malý tábor.
	AI_Output(self,other,"DIA_KDW_4573_Oddler_XRANFREG_01_08");   //Později část mágů odešla na sever, zatímco ostatní včetně mě se rozhodli prozkoumat východní část země.
	AI_Output(self,other,"DIA_KDW_4573_Oddler_XRANFREG_01_09");   //Tak jsme nalezli opuštěnou svatyni skřetů.
	AI_Output(self,other,"DIA_KDW_4573_Oddler_XRANFREG_01_10");   //Přesněji, jenom vypadala opuštěně, ale skutečnost byla jiná!
	AI_Output(self,other,"DIA_KDW_4573_Oddler_XRANFREG_01_11");   //Jednoho krásného dne, když jsem studoval oltář ve starověké svatyni, přišli skřeti.
	AI_Output(self,other,"DIA_KDW_4573_Oddler_XRANFREG_01_12");   //Ačkoli jsem měl jako doprovod několik paladinů, výsledek bitvy byl už předem předurčen.
	AI_Output(self,other,"DIA_KDW_4573_Oddler_XRANFREG_01_13");   //Paladiny skřeti okamžitě zabili. Když viděli, že jsem mág, rozhodli se mě odvést do tábora.
	AI_Output(self,other,"DIA_KDW_4573_Oddler_XRANFREG_01_14");   //A to je celí můj příběh o účasti v této expedici.
	B_LogEntry(TOPIC_XRANFREG,"Zdá se, že Oddler je jedním z těch co se podíleli na expedici mágů Ohně. Podle něj je na východě starobylá svatyně skřetů. Měl bych se tam příležitostně podívat.");
};

instance DIA_VLK_5570_Avabul_EXIT(C_Info)
{
   npc = VLK_5570_Avabul;
   nr = 999;
   condition = DIA_VLK_5570_Avabul_exit_condition;
   information = DIA_VLK_5570_Avabul_exit_info;
   permanent = TRUE;
   description = Dialog_Ende;
};

func int DIA_VLK_5570_Avabul_exit_condition()
{
   return TRUE;
};

func void DIA_VLK_5570_Avabul_exit_info()
{
   AI_StopProcessInfos(self);
};

instance DIA_VLK_5570_Avabul_HELLO(C_Info)
{
   npc = VLK_5570_Avabul;
   nr = 1;
   condition = DIA_VLK_5570_Avabul_HELLO_condition;
   information = DIA_VLK_5570_Avabul_HELLO_info;
   permanent = FALSE;
   important = TRUE;
};

func int DIA_VLK_5570_Avabul_HELLO_condition()
{
	if(MIS_PashalQuest == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_VLK_5570_Avabul_HELLO_info()
{
	AI_Output(self,other,"DIA_VLK_5570_Avabul_HELLO_01_00");   //Smrtelníku...(chmurně) máš artefakt, který hledá můj pán
	AI_Output(other,self,"DIA_VLK_5570_Avabul_HELLO_01_01");   //Obávám se, že tě zklamu.
	AI_Output(self,other,"DIA_VLK_5570_Avabul_HELLO_01_02");   //Co jsi říkal?!
	AI_Output(other,self,"DIA_VLK_5570_Avabul_HELLO_01_03");   //Co jsi ohluchla? Řekl jsem, že ho nemám. Jeho součesný majitel se s ním nechtěl rozloučit.
	AI_Output(self,other,"DIA_VLK_5570_Avabul_HELLO_01_04");   //To mě nezajímá...(povíšeně) Měl jsi ho přinést byla to součást naší dohody...
	AI_Output(other,self,"DIA_VLK_5570_Avabul_HELLO_01_05");   //Tak to si ty a tvůj hostitel budete muset nechat zajít chuť. Artefakt zůstane uvnitř tohoto chrámu, takže zapomeň na naší dohodu.
	AI_Output(self,other,"DIA_VLK_5570_Avabul_HELLO_01_06");   //(pro sebe) Jak se opovažuješ? Bídný červe! Nyní zemřeš pro svou drzost.
	AI_Output(self,other,"DIA_VLK_5570_Avabul_HELLO_01_07");   //A až se to stane, budu si hrát s tvojí duší, jako s loutkou.
	Info_ClearChoices(DIA_VLK_5570_Avabul_HELLO);
	Info_AddChoice(DIA_VLK_5570_Avabul_HELLO,Dialog_Ende,DIA_VLK_5570_Avabul_HELLO_End);
};

func void DIA_VLK_5570_Avabul_HELLO_End()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_EnemyOverride] = FALSE;
	self.flags = 0;
	Snd_Play("MFX_FEAR_CAST");
	Wld_PlayEffect("SPELLFX_MASSDEATH_EXPLOSION",self,other,0,250,DAM_MAGIC,TRUE);
};