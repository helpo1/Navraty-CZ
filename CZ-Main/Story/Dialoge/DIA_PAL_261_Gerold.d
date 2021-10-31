
instance DIA_Gerold_EXIT(C_Info)
{
	npc = PAL_261_Gerold;
	nr = 999;
	condition = DIA_Gerold_EXIT_Condition;
	information = DIA_Gerold_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Gerold_EXIT_Condition()
{
	if(Kapitel < 4)
	{
		return TRUE;
	};
};

func void DIA_Gerold_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Gerold_Hallo(C_Info)
{
	npc = PAL_261_Gerold;
	nr = 2;
	condition = DIA_Gerold_Hallo_Condition;
	information = DIA_Gerold_Hallo_Info;
	permanent = FALSE;
	description = "Co to hlídáš?";
};


func int DIA_Gerold_Hallo_Condition()
{
	if(Kapitel == 2)
	{
		return TRUE;
	};
};

func void DIA_Gerold_Hallo_Info()
{
	AI_Output(other,self,"DIA_Gerold_Hallo_15_00");	//Co to hlídáš? 
	AI_Output(self,other,"DIA_Gerold_Hallo_12_01");	//Vězně.
	AI_Output(other,self,"DIA_Gerold_Hallo_15_02");	//Kdo tam je?
	AI_Output(self,other,"DIA_Gerold_Hallo_12_03");	//Nějací z trestanců a žoldák Gorn. Dobrej protivník - silnej jako býk.
	AI_Output(self,other,"DIA_Gerold_Hallo_12_04");	//Čtyři chlapi ho nemohli přemoct.
};


instance DIA_Gerold_Jail(C_Info)
{
	npc = PAL_261_Gerold;
	nr = 2;
	condition = DIA_Gerold_Jail_Condition;
	information = DIA_Gerold_Jail_Info;
	permanent = FALSE;
	description = "Pustíš mě do vězení?";
};


func int DIA_Gerold_Jail_Condition()
{
	if((Kapitel == 2) && Npc_KnowsInfo(other,DIA_Gerold_Hallo) && (Garond_Kerkerauf == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Gerold_Jail_Info()
{
	AI_Output(other,self,"DIA_Gerold_Jail_15_00");	//Pustíš mě do vězení?
	AI_Output(self,other,"DIA_Gerold_Jail_12_01");	//Ne. Nikdo nemůže do vězení. To se týká všech. I tebe a Miltena.
	AI_Output(self,other,"DIA_Gerold_Jail_12_02");	//Tohle není žádná hospoda, kde bys mohl jen tak dovnitř a ven. Zapamatuj si to.
	KnowsAboutGorn = TRUE;
};


instance DIA_Gerold_Ausnahme(C_Info)
{
	npc = PAL_261_Gerold;
	nr = 2;
	condition = DIA_Gerold_Ausnahme_Condition;
	information = DIA_Gerold_Ausnahme_Info;
	permanent = FALSE;
	description = "A nemůžeš pro mě udělat výjimku?";
};


func int DIA_Gerold_Ausnahme_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Gerold_Jail) && (Kapitel == 2) && (Garond_Kerkerauf == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Gerold_Ausnahme_Info()
{
	AI_Output(other,self,"DIA_Gerold_Ausnahme_15_00");	//A nemůžeš pro mě udělat výjimku?
	AI_Output(self,other,"DIA_Gerold_Ausnahme_12_01");	//Ne.
};


instance DIA_Gerold_Gold(C_Info)
{
	npc = PAL_261_Gerold;
	nr = 2;
	condition = DIA_Gerold_Gold_Condition;
	information = DIA_Gerold_Gold_Info;
	permanent = FALSE;
	description = "A co kdybych ti šoup nějaký to zlato - čistě hypoteticky?";
};


func int DIA_Gerold_Gold_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Gerold_Ausnahme) && (Kapitel == 2) && (Garond_Kerkerauf == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Gerold_Gold_Info()
{
	AI_Output(other,self,"DIA_Gerold_Gold_15_00");	//A co kdybych ti šoup nějaký to zlato - čistě hypoteticky?
	AI_Output(self,other,"DIA_Gerold_Gold_12_01");	//Hmm... (zamyšleně)
	AI_Output(self,other,"DIA_Gerold_Gold_12_02");	//Kdyby se někdo pokoušel upalatit stráž, musel bych ho zavřít taky - čistě hypoteticky.
};


instance DIA_Gerold_Deal(C_Info)
{
	npc = PAL_261_Gerold;
	nr = 2;
	condition = DIA_Gerold_Deal_Condition;
	information = DIA_Gerold_Deal_Info;
	permanent = FALSE;
	description = "Mám vzkaz pro jednoho vězně.";
};


func int DIA_Gerold_Deal_Condition()
{
	if((MIS_RescueGorn == LOG_Running) && (Npc_HasItems(other,ItWr_LetterForGorn_MIS) >= 1) && (Kapitel == 2) && (Garond_Kerkerauf == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Gerold_Deal_Info()
{
	AI_Output(other,self,"DIA_Gerold_Deal_15_00");	//Mám vzkaz pro jednoho z vězňů. Můžeš ho předat?
	AI_Output(self,other,"DIA_Gerold_Deal_12_01");	//Hmmm... (zamyšleně) V zásadě s tím nemám žádný problém. Pro koho je ten vzkaz?
	AI_Output(other,self,"DIA_Gerold_Deal_15_02");	//Pro Gorna.
	AI_Output(self,other,"DIA_Gerold_Deal_12_03");	//Ten čelí vážným obviněním. Já si nemyslím, že by Garond souhlasil. Ale jestli je to pro tebe tak důležité tak se můžeme nějak dohodnout.
	AI_Output(other,self,"DIA_Gerold_Deal_15_04");	//Co za to chceš?
	AI_Output(self,other,"DIA_Gerold_Deal_12_05");	//Naše příděly potravin jsou stále stejné. A já potřebuji nějakou změnu.
	AI_Output(self,other,"DIA_Gerold_Deal_12_06");	//Přines mě klobásu, bochánek čerstvého chleba a trochu medu.
	AI_Output(self,other,"DIA_Gerold_Deal_12_07");	//A láhev vína abych to všechno mohl zapít. Až to všechno budeš mít vrať se.
	B_LogEntry(TOPIC_RescueGorn,"Když Geroldovi přinesu klobásu, chléb a med s láhví vína, vyřídí Gornovi mou zprávu.");
};


instance DIA_Gerold_Stuff(C_Info)
{
	npc = PAL_261_Gerold;
	nr = 2;
	condition = DIA_Gerold_Stuff_Condition;
	information = DIA_Gerold_Stuff_Info;
	permanent = TRUE;
	description = "Přinesl jsem ti co jsi chtěl.";
};


var int DIA_Gerold_Stuff_permanent;

func int DIA_Gerold_Stuff_Condition()
{
	if((Npc_HasItems(other,ItWr_LetterForGorn_MIS) >= 1) && Npc_KnowsInfo(other,DIA_Gerold_Deal) && (Kapitel == 2) && (DIA_Gerold_Stuff_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Gerold_Stuff_Info()
{
	AI_Output(other,self,"DIA_Gerold_Stuff_15_00");	//Přinesl jsem ti co jsi chtěl.

	if((Npc_HasItems(other,ItFo_Honey) >= 1) && (Npc_HasItems(other,ItFo_Bread) >= 1) && (Npc_HasItems(other,ItFo_Wine) >= 1) && (Npc_HasItems(other,ItFo_Sausage) >= 1))
	{
		B_GiveInvItemsManyThings(other,self);
		Npc_RemoveInvItems(other,ItFo_Honey,1);
		Npc_RemoveInvItems(other,ItFo_Bread,1);
		Npc_RemoveInvItems(other,ItFo_Wine,1);
		Npc_RemoveInvItems(other,ItFo_Sausage,1);
		AI_Output(self,other,"DIA_Gerold_Stuff_12_01");	//Dobře. Máš tu zprávu?
		AI_Output(other,self,"DIA_Gerold_Stuff_15_02");	//Jasně, tady. Pamatuj, je pro Gorna.
		AI_Output(self,other,"DIA_Gerold_Stuff_12_03");	//Vrať se zítra pro odpověď.
		B_GiveInvItems(other,self,ItWr_LetterForGorn_MIS,1);
		DayContactGorn = Wld_GetDay();
		DIA_Gerold_Stuff_permanent = TRUE;
		B_LogEntry(TOPIC_RescueGorn,"Gerold předá můj vzkaz Gornovi. Mám se vrátit zítra pro odpověď.");
	}
	else
	{
		AI_Output(self,other,"DIA_Gerold_Stuff_12_04");	//Vrať se až budeš mít, na čem jsme se domluvili.
	};
};


instance DIA_Gerold_Antwort(C_Info)
{
	npc = PAL_261_Gerold;
	nr = 2;
	condition = DIA_Gerold_Antwort_Condition;
	information = DIA_Gerold_Antwort_Info;
	permanent = TRUE;
	description = "Obdržel Gorn ten dopis?";
};


var int DIA_Gerold_Antwort_permanent;

func int DIA_Gerold_Antwort_Condition()
{
	if((DIA_Gerold_Stuff_permanent == TRUE) && (Kapitel == 2) && (DIA_Gerold_Antwort_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Gerold_Antwort_Info()
{
	AI_Output(other,self,"DIA_Gerold_Antwort_15_00");	//Obdržel Gorn ten dopis?
	if(DayContactGorn < Wld_GetDay())
	{
		AI_Output(self,other,"DIA_Gerold_Antwort_12_01");	//Ano a mám ti vzkázat tohle:
		AI_Output(other,self,"DIA_Gerold_Antwort_15_02");	//No?
		AI_Output(self,other,"DIA_Gerold_Antwort_12_03");	//Je to u bývalé jižní brány.
		AI_Output(other,self,"DIA_Gerold_Antwort_15_04");	//Říkal ještě něco?
		AI_Output(self,other,"DIA_Gerold_Antwort_12_05");	//Ne. A ty víš, co to znamená?
		AI_Output(other,self,"DIA_Gerold_Antwort_15_06");	//Možná, ale ty se tím trápit nemusíš.
		AI_Output(self,other,"DIA_Gerold_Antwort_12_07");	//Ano, možná máš pravdu.
		GornsTreasure = TRUE;
		DIA_Gerold_Antwort_permanent = TRUE;
		B_LogEntry(TOPIC_RescueGorn,"Gorn mi vzkazuje, že zlato je u bývalé jižní brány.");
	}
	else
	{
		AI_Output(self,other,"DIA_Gerold_GornsAnswer_12_08");	//Ještě ne. Přijď později.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Gerold_SetGornFree(C_Info)
{
	npc = PAL_261_Gerold;
	nr = 2;
	condition = DIA_Gerold_SetGornFree_Condition;
	information = DIA_Gerold_SetGornFree_Info;
	permanent = FALSE;
	description = "Pusť Gorna.";
};


func int DIA_Gerold_SetGornFree_Condition()
{
	if((Garond_Kerkerauf == TRUE) && (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_Gerold_SetGornFree_Info()
{
	AI_Output(other,self,"DIA_Gerold_SetGornFree_15_00");	//Pusť Gorna. Rozkaz od Garonda.
	AI_Output(self,other,"DIA_Gerold_SetGornFree_12_01");	//Už jsem to slyšel. Tady je klíč.
	CreateInvItems(self,ItKe_PrisonKey_MIS,1);
	B_GiveInvItems(self,other,ItKe_PrisonKey_MIS,1);
	B_LogEntry(TOPIC_RescueGorn,"Gerold mi dal klíč od Gornovi cely.");
};


instance DIA_Gerold_Perm(C_Info)
{
	npc = PAL_261_Gerold;
	nr = 900;
	condition = DIA_Gerold_Perm_Condition;
	information = DIA_Gerold_Perm_Info;
	permanent = TRUE;
	description = "Ty nikdy nespíš?";
};


func int DIA_Gerold_Perm_Condition()
{
	if((Kapitel < 4) && Npc_KnowsInfo(other,DIA_Gerold_Gold))
	{
		return TRUE;
	};
};

func void DIA_Gerold_Perm_Info()
{
	AI_Output(other,self,"DIA_Gerold_Perm_15_00");	//Ty nikdy nespíš?
	AI_Output(self,other,"DIA_Gerold_Perm_12_01");	//Ne. Innos mě dává sílu abych neusnul.
};


instance DIA_Gerold_KAP4_EXIT(C_Info)
{
	npc = PAL_261_Gerold;
	nr = 999;
	condition = DIA_Gerold_KAP4_EXIT_Condition;
	information = DIA_Gerold_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Gerold_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Gerold_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Gerold_KAP4_ALLESRUHIG(C_Info)
{
	npc = PAL_261_Gerold;
	nr = 30;
	condition = DIA_Gerold_KAP4_ALLESRUHIG_Condition;
	information = DIA_Gerold_KAP4_ALLESRUHIG_Info;
	description = "Všechno v pohodě?";
};


func int DIA_Gerold_KAP4_ALLESRUHIG_Condition()
{
	if(Kapitel >= 4)
	{
		return TRUE;
	};
};

func void DIA_Gerold_KAP4_ALLESRUHIG_Info()
{
	AI_Output(other,self,"DIA_Gerold_KAP4_ALLESRUHIG_15_00");	//Všechno v pohodě?
	AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_12_01");	//V pohodě, ano.
	AI_Output(other,self,"DIA_Gerold_KAP4_ALLESRUHIG_15_02");	//Opravdu?
	AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_12_03");	//Mám pupek přilepenej k páteři. Garond opět snížil příděly.
	AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_12_04");	//Jestli nedostanu pořádné jídlo, tak se asi zakousnu do Garondovy prdele.
	Info_ClearChoices(DIA_Gerold_KAP4_ALLESRUHIG);
	Info_AddChoice(DIA_Gerold_KAP4_ALLESRUHIG,"To není můj problém.",DIA_Gerold_KAP4_ALLESRUHIG_Nein);
	Info_AddChoice(DIA_Gerold_KAP4_ALLESRUHIG,"Možná ti můžu něco dát.",DIA_Gerold_KAP4_ALLESRUHIG_geben);
};

func void DIA_Gerold_KAP4_ALLESRUHIG_geben()
{
	AI_Output(other,self,"DIA_Gerold_KAP4_ALLESRUHIG_geben_15_00");	//Možná ti můžu něco dát.
	AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_geben_12_01");	//Zbláznil ses? Ne tady kde nás může někdo vidět! Tolik přátel najednou nepotřebuju, jestli víš, co tím myslím...
	if(Wld_IsTime(23,10,8,0) == FALSE)
	{
		AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_geben_12_02");	//Až ostatní usnou, budu v chrámu mágů.
	}
	else
	{
		AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_geben_12_03");	//Rychle, pojď do chrámu, nechci čekat na zítra.
	};
	AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_geben_12_04");	//V chrámu teď stejně nikdo není, počkám tam na tebe.
	AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_geben_12_05");	//Ale nepřijď jen se suchým chlebem, že ne?
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Food");
	Log_CreateTopic(TOPIC_GeroldGiveFood,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GeroldGiveFood,LOG_Running);
	B_LogEntry(TOPIC_GeroldGiveFood,"Garond znovu snížil příděly. Měl bych Geroldovi sehnat jídlo, než udělá nějakou blbost. Potkáme se v chrámu mágů Ohně, až ostatní usnou.");
	MIS_GeroldGiveFood = LOG_Running;
};

func void DIA_Gerold_KAP4_ALLESRUHIG_Nein()
{
	AI_Output(other,self,"DIA_Gerold_KAP4_ALLESRUHIG_Nein_15_00");	//To není můj problém.
	AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_Nein_12_01");	//To se ti lehce řekne. Ty se dokážeš dostat skrz skřetí blokádu...
	AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_Nein_12_02");	//I přesto, že to nepřizná, je strašně vyděšenej a vidí v tobě jedinou naději.
	AI_StopProcessInfos(self);
};


var int Gerold_FoodCounter;

instance DIA_Gerold_FOOD(C_Info)
{
	npc = PAL_261_Gerold;
	nr = 31;
	condition = DIA_Gerold_FOOD_Condition;
	information = DIA_Gerold_FOOD_Info;
	important = TRUE;
};


func int DIA_Gerold_FOOD_Condition()
{
	if((Npc_GetDistToWP(self,"OC_MAGE_IN") < 500) && (Kapitel >= 4))
	{
		return TRUE;
	};
};

func void DIA_Gerold_MoreFood()
{
	Info_ClearChoices(DIA_Gerold_FOOD);
	if(Gerold_FoodCounter > 8)
	{
		AI_Output(self,other,"DIA_Gerold_MoreFood_12_00");	//To stačí, to stačí! Díky! Teď zase budu na chvíli v pohodě!
		AI_Output(self,other,"DIA_Gerold_MoreFood_12_01");	//Tady je moje zlato! Tady za něj moc nekoupím, ale tobě by se mohlo hodit až budeš ve městě!
		AI_Output(self,other,"DIA_Gerold_MoreFood_12_02");	//Měli bychom jít, než nás někdo uvidí...
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"Start");
		MIS_GeroldGiveFood = LOG_SUCCESS;
		B_GivePlayerXP(XP_GeroldGiveFood);
		CreateInvItems(self,ItMi_Gold,250);
		B_GiveInvItems(self,other,ItMi_Gold,250);
	}
	else
	{
		if(Gerold_FoodCounter == 0)
		{
			Info_AddChoice(DIA_Gerold_FOOD,"Teď nic nemám.",DIA_Gerold_FOOD_nichts);
		}
		else
		{
			Info_AddChoice(DIA_Gerold_FOOD,"To je všechno co mám.",DIA_Gerold_FOOD_kaese_nichtmehr);
			if(Gerold_FoodCounter < 5)
			{
				AI_Output(self,other,"DIA_Gerold_MoreFood_12_03");	//Samozřejmě. Pojď sem. A co ještě máš?
			}
			else
			{
				AI_Output(self,other,"DIA_Gerold_MoreFood_12_04");	//Ano ještě, ještě!
			};
		};
		if(Npc_HasItems(other,ItFo_FishSoup) || Npc_HasItems(other,ItFo_Stew))
		{
			Info_AddChoice(DIA_Gerold_FOOD,"(dát polévku)",DIA_Gerold_FOOD_Suppe);
		};
		if(Npc_HasItems(other,ItFoMutton))
		{
			Info_AddChoice(DIA_Gerold_FOOD,"(dát maso)",DIA_Gerold_FOOD_fleisch);
		};
		if(Npc_HasItems(other,ItFo_Bacon))
		{
			Info_AddChoice(DIA_Gerold_FOOD,"(dát šunku)",DIA_Gerold_FOOD_schinken);
		};
		if(Npc_HasItems(other,ItFo_Cheese))
		{
			Info_AddChoice(DIA_Gerold_FOOD,"(dát sýr)",DIA_Gerold_FOOD_kaese);
		};
		if(Npc_HasItems(other,ItFo_Sausage))
		{
			Info_AddChoice(DIA_Gerold_FOOD,"(dát klobásu)",DIA_Gerold_FOOD_Wurst);
		};
		Gerold_FoodCounter = Gerold_FoodCounter + 1;
	};
};

func void DIA_Gerold_FOOD_Info()
{
	AI_Output(self,other,"DIA_Gerold_FOOD_12_00");	//Á, tady jsi! Co máš?
	DIA_Gerold_MoreFood();
};

func void DIA_Gerold_FOOD_nichts()
{
	AI_Output(other,self,"DIA_Gerold_FOOD_nichts_15_00");	//Už nic nemám.
	AI_Output(self,other,"DIA_Gerold_FOOD_nichts_12_01");	//Nejprve mě navnadíš a teď se mi vysměješ?
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
	Npc_ExchangeRoutine(self,"Start");
	MIS_GeroldGiveFood = LOG_FAILED;
	B_GivePlayerXP(XP_Ambient);
};

func void DIA_Gerold_FOOD_kaese_nichtmehr()
{
	var int XP_GeroldGiveFoodLow;
	var int Teiler;
	AI_Output(other,self,"DIA_Gerold_FOOD_kaese_nichtmehr_15_00");	//To je vše, co mám.
	AI_Output(self,other,"DIA_Gerold_FOOD_kaese_nichtmehr_12_01");	//A to ti mám věřit? Ale lepší než nic. Děkuji ti. Tu máš něco zlata.
	CreateInvItems(self,ItMi_Gold,50);
	B_GiveInvItems(self,other,ItMi_Gold,50);
	AI_Output(self,other,"DIA_Gerold_FOOD_kaese_nichtmehr_12_02");	//No, vrátím se na své stanoviště.
	AI_StopProcessInfos(self);
	if(Gerold_FoodCounter < 4)
	{
		Teiler = 3;
	}
	else
	{
		Teiler = 2;
	};
	XP_GeroldGiveFoodLow = XP_GeroldGiveFood / Teiler;
	Npc_ExchangeRoutine(self,"Start");
	MIS_GeroldGiveFood = LOG_OBSOLETE;
	B_GivePlayerXP(XP_GeroldGiveFoodLow);
};

func void DIA_Gerold_FOOD_kaese()
{
	AI_Output(other,self,"DIA_Gerold_FOOD_kaese_15_00");	//A co kousek sýra?
	B_GiveInvItems(other,self,ItFo_Cheese,1);
	DIA_Gerold_MoreFood();
};

func void DIA_Gerold_FOOD_Wurst()
{
	AI_Output(other,self,"DIA_Gerold_FOOD_Wurst_15_00");	//A co kousek klobásy?
	B_GiveInvItems(other,self,ItFo_Sausage,1);
	DIA_Gerold_MoreFood();
};

func void DIA_Gerold_FOOD_schinken()
{
	AI_Output(other,self,"DIA_Gerold_FOOD_schinken_15_00");	//Můžu ti dát tuhle šunku.
	B_GiveInvItems(other,self,ItFo_Bacon,1);
	DIA_Gerold_MoreFood();
};

func void DIA_Gerold_FOOD_fleisch()
{
	AI_Output(other,self,"DIA_Gerold_FOOD_fleisch_15_00");	//Kousek masa?
	B_GiveInvItems(other,self,ItFoMutton,1);
	DIA_Gerold_MoreFood();
};

func void DIA_Gerold_FOOD_Suppe()
{
	AI_Output(other,self,"DIA_Gerold_FOOD_Suppe_15_00");	//Dobrá polévka je na místě, ne?
	if(B_GiveInvItems(other,self,ItFo_FishSoup,1))
	{
	}
	else
	{
		B_GiveInvItems(other,self,ItFo_Stew,1);
	};
	DIA_Gerold_MoreFood();
};


instance DIA_Gerold_PERM4(C_Info)
{
	npc = PAL_261_Gerold;
	nr = 41;
	condition = DIA_Gerold_PERM4_Condition;
	information = DIA_Gerold_PERM4_Info;
	permanent = TRUE;
	description = "Máš ještě hlad?";
};


func int DIA_Gerold_PERM4_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Gerold_KAP4_ALLESRUHIG))
	{
		return TRUE;
	};
};

func void DIA_Gerold_PERM4_Info()
{
	AI_Output(other,self,"DIA_Gerold_PERM4_15_00");	//Máš ještě hlad?
	if(MIS_OCGateOpen == TRUE)
	{
		AI_Output(self,other,"DIA_Gerold_PERM4_12_01");	//Pokud zaútočí skřeti, nepomůže mi ani plné břicho...
	}
	else if(MIS_GeroldGiveFood == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Gerold_PERM4_12_02");	//Ty jsi srandista, to byl pěkný výstup. Ještě jednou děkuji.
	}
	else if(MIS_GeroldGiveFood == LOG_OBSOLETE)
	{
		AI_Output(self,other,"DIA_Gerold_PERM4_12_03");	//Ano. Nicméně, díky za pomoc.
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Gerold_PERM4_12_04");	//Všechno v pořádku mistře.
	}
	else
	{
		AI_Output(self,other,"DIA_Gerold_PERM4_12_05");	//Vypadni!
	};
	AI_StopProcessInfos(self);
};


instance DIA_Gerold_KAP5_EXIT(C_Info)
{
	npc = PAL_261_Gerold;
	nr = 999;
	condition = DIA_Gerold_KAP5_EXIT_Condition;
	information = DIA_Gerold_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Gerold_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Gerold_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Gerold_KAP6_EXIT(C_Info)
{
	npc = PAL_261_Gerold;
	nr = 999;
	condition = DIA_Gerold_KAP6_EXIT_Condition;
	information = DIA_Gerold_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Gerold_KAP6_EXIT_Condition()
{
	if(Kapitel >= 6)
	{
		return TRUE;
	};
};

func void DIA_Gerold_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Gerold_PICKPOCKET(C_Info)
{
	npc = PAL_261_Gerold;
	nr = 900;
	condition = DIA_Gerold_PICKPOCKET_Condition;
	information = DIA_Gerold_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Gerold_PICKPOCKET_Condition()
{
	return C_Beklauen(71,170);
};

func void DIA_Gerold_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Gerold_PICKPOCKET);
	Info_AddChoice(DIA_Gerold_PICKPOCKET,Dialog_Back,DIA_Gerold_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Gerold_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Gerold_PICKPOCKET_DoIt);
};

func void DIA_Gerold_PICKPOCKET_DoIt()
{
	B_Beklauen();
	INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
	Info_ClearChoices(DIA_Gerold_PICKPOCKET);
};

func void DIA_Gerold_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Gerold_PICKPOCKET);
};

