/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.00:

func void DIA_Engor_BRINGMEAT_Info - upraveny výpisy

*/




instance DIA_Engor_EXIT(C_Info)
{
	npc = VLK_4108_Engor;
	nr = 999;
	condition = DIA_Engor_EXIT_Condition;
	information = DIA_Engor_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Engor_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Engor_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Engor_HALLO(C_Info)
{
	npc = VLK_4108_Engor;
	nr = 2;
	condition = DIA_Engor_HALLO_Condition;
	information = DIA_Engor_HALLO_Info;
	important = TRUE;
};


func int DIA_Engor_HALLO_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Engor_HALLO_Info()
{
	AI_Output(self,other,"DIA_Engor_HALLO_13_00");	//Á, to ty jsi ten chlapík, který přežil cestu průsmykem.
	AI_Output(other,self,"DIA_Engor_HALLO_15_01");	//Ano, to jsem já.
	AI_Output(self,other,"DIA_Engor_HALLO_13_02");	//Výborně. Já jsem Engor. Mám na starosti zásobování.
	AI_Output(self,other,"DIA_Engor_HALLO_13_03");	//Ale jen si nemysli, že ti dám něco zadarmo!
	AI_Output(self,other,"DIA_Engor_HALLO_13_04");	//Nicméně pokud máš po kapsách zlato, jsem vždy ochoten uzavřít obchod.
	Log_CreateTopic(TOPIC_Trader_OC,LOG_NOTE);
	B_LogEntry(TOPIC_Trader_OC,"Engor se stará o zásobování na hradě a taky trochu obchoduje.");
};


instance DIA_Engor_HANDELN(C_Info)
{
	npc = VLK_4108_Engor;
	nr = 10;
	condition = DIA_Engor_HANDELN_Condition;
	information = DIA_Engor_HANDELN_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "Ukaž mi své zboží.";
};


func int DIA_Engor_HANDELN_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Engor_HALLO))
	{
		return TRUE;
	};
};


var int engorarrowsday;

func void DIA_Engor_HANDELN_Info()
{
	var int daynow;
	var int bolzenamount;

	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	daynow = Wld_GetDay();

	if(ENGORARROWSDAY < daynow)
	{
		if(Wld_IsTime(12,0,23,59) || (ENGORARROWSDAY < (daynow - 1)))
		{
			bolzenamount = (Kapitel * 100) + (10 * (daynow - ENGORARROWSDAY - 1));
			if(bolzenamount > Npc_HasItems(self,ItRw_Bolt))
			{
				CreateInvItems(self,ItRw_Bolt,bolzenamount - Npc_HasItems(self,ItRw_Bolt));
			};
			if(bolzenamount > Npc_HasItems(self,ItRw_Arrow))
			{
				CreateInvItems(self,ItRw_Arrow,bolzenamount - Npc_HasItems(self,ItRw_Arrow));
			};
			ENGORARROWSDAY = daynow;
		};
	};
	if(Npc_HasItems(self,itpo_anpois) != 3)
	{
		Npc_RemoveInvItems(self,itpo_anpois,Npc_HasItems(self,itpo_anpois));
		CreateInvItems(self,itpo_anpois,3);
	};
	if(Npc_HasItems(self,itpo_stamina) != 5)
	{
		Npc_RemoveInvItems(self,itpo_stamina,Npc_HasItems(self,itpo_stamina));
		CreateInvItems(self,itpo_stamina,5);
	};

	AI_Output(other,self,"DIA_Engor_HANDELN_15_00");	//Ukaž mi své zboží.
	B_GiveTradeInv(self);
};


instance DIA_Engor_ABOUTPARLAF(C_Info)
{
	npc = VLK_4108_Engor;
	nr = 2;
	condition = DIA_Engor_ABOUTPARLAF_Condition;
	information = DIA_Engor_ABOUTPARLAF_Info;
	description = "Ty jsi ten, kdo rozdáva přídely?";
};


func int DIA_Engor_ABOUTPARLAF_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Parlaf_ENGOR))
	{
		return TRUE;
	};
};

func void DIA_Engor_ABOUTPARLAF_Info()
{
	AI_Output(other,self,"DIA_Engor_ABOUTPARLAF_15_00");	//Ty jsi ten, kdo rozdává příděly?
	AI_Output(self,other,"DIA_Engor_ABOUTPARLAF_13_01");	//To je pravda. Proč? Mám tě teď taky krmit?
	AI_Output(self,other,"DIA_Engor_ABOUTPARLAF_13_02");	//Pokud něco chceš, zaplať za to stejně jako všichni ostatní.
};

instance DIA_Engor_HELP(C_Info)
{
	npc = VLK_4108_Engor;
	nr = 3;
	condition = DIA_Engor_HELP_Condition;
	information = DIA_Engor_HELP_Info;
	description = "Možná ti můžu nějak pomoci s tvou práci?";
};

func int DIA_Engor_HELP_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Engor_ABOUTPARLAF))
	{
		return TRUE;
	};
};

func void DIA_Engor_HELP_Info()
{
	AI_Output(other,self,"DIA_Engor_HELP_15_00");	//Možná ti můžu nějako pomoci s tvou prací?
	AI_Output(self,other,"DIA_Engor_HELP_13_01");	//Hmm... Jistě, proč ne? Potřeboval bych nějakou pomoc.
	AI_Output(other,self,"DIA_Engor_HELP_15_02");	//Takže co je třeba udělat?
	AI_Output(self,other,"DIA_Engor_HELP_13_03");	//Naše zásoby jídla jsou malé. Především jsme téměř bez masa.
	AI_Output(self,other,"DIA_Engor_HELP_13_04");	//Takže pokud můžeš sehnat nějaké maso, syrové nebo vařené, šunku nebo klobásky, bylo by to přijmuto s velkým nadšením. Co tomu říkáš, pomůžeš nám?
	Info_ClearChoices(DIA_Engor_HELP);
	Info_AddChoice(DIA_Engor_HELP,"Na to nemám čas.",DIA_Engor_HELP_NO);
	Info_AddChoice(DIA_Engor_HELP,"Neměj strach, nějaké maso seženu.",DIA_Engor_HELP_YES);
};

func void DIA_Engor_HELP_NO()
{
	AI_Output(other,self,"DIA_Engor_HELP_NO_15_00");	//Na to nemám čas.
	AI_Output(self,other,"DIA_Engor_HELP_NO_13_01");	//Tak proč mrháš tím mým?
	MIS_Engor_BringMeat = LOG_OBSOLETE;
	AI_StopProcessInfos(self);
};

func void DIA_Engor_HELP_YES()
{
	AI_Output(other,self,"DIA_Engor_HELP_YES_15_00");	//Neměj strach, nějaké maso seženu.
	AI_Output(self,other,"DIA_Engor_HELP_YES_13_01");	//Asi dva tucty pořádných kusů masa by mi pomohlo nasytit nejméně sto hladových krků. Vrať se, až ho seženeš. Teď se musím vrátit ke své práci.
	Log_CreateTopic(TOPIC_BringMeat,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BringMeat,LOG_Running);
	B_LogEntry(TOPIC_BringMeat,"Engor potřebuje spoustu masa, aby mohl dál zásobovat své muže. Nevadí, pujde-li o klobásy, šunku, pečené či syrové maso. Jenom aby chlapi měli co zakousnout. Dva tucty porcí by mělo stačit.");
	MIS_Engor_BringMeat = LOG_Running;
	AI_StopProcessInfos(self);
};


instance DIA_Engor_BRINGMEAT(C_Info)
{
	npc = VLK_4108_Engor;
	nr = 4;
	condition = DIA_Engor_BRINGMEAT_Condition;
	information = DIA_Engor_BRINGMEAT_Info;
	permanent = TRUE;
	description = "Tumáš, něco jsem ti sehnal. (dát maso)";
};


func int DIA_Engor_BRINGMEAT_Condition()
{
	if((MIS_Engor_BringMeat == LOG_Running) && (Meat_Counter < Meat_Amount) && ((Npc_HasItems(hero,ItFo_Bacon) >= 1) || (Npc_HasItems(hero,ItFoMuttonRaw) >= 1) || (Npc_HasItems(hero,ItFoMutton) >= 1) || (Npc_HasItems(hero,ItFo_Sausage) >= 1)))
	{
		return TRUE;
	};
};

func void DIA_Engor_BRINGMEAT_Info()
{
	var string ConcatRaw;
	var string ConcatMutton;
	var string ConcatBacon;
	var string ConcatSausage;
	var string GesamtFleisch;
	AI_Output(other,self,"DIA_Engor_BRINGMEAT_15_00");	//Tumáš, něco jsem ti sehnal.
	if(Npc_HasItems(hero,ItFoMuttonRaw) >= 1)
	{
		if((Npc_HasItems(hero,ItFoMuttonRaw) >= Meat_Amount) && (Meat_Counter < Meat_Amount))
		{
			B_GiveInvItems(hero,self,ItFoMuttonRaw,Meat_Amount - Meat_Counter);
			Meat_Counter = Meat_Counter + (Meat_Amount - Meat_Counter);
		}
		else if((Npc_HasItems(hero,ItFoMuttonRaw) < Meat_Amount) && (Meat_Counter < Meat_Amount))
		{
			Meat_Counter = Meat_Counter + Npc_HasItems(hero,ItFoMuttonRaw);
			ConcatRaw = IntToString(Npc_HasItems(other,ItFoMuttonRaw));
			ConcatRaw = ConcatStrings(ConcatRaw,"(dát syrové maso)");
			AI_Print(ConcatRaw);
			Npc_RemoveInvItems(other,ItFoMuttonRaw,Npc_HasItems(other,ItFoMuttonRaw));
		};
	};
	if(Npc_HasItems(hero,ItFoMutton) >= 1)
	{
		if((Npc_HasItems(hero,ItFoMutton) >= Meat_Amount) && (Meat_Counter < Meat_Amount))
		{
			B_GiveInvItems(hero,self,ItFoMutton,Meat_Amount - Meat_Counter);
			Meat_Counter = Meat_Counter + (Meat_Amount - Meat_Counter);
		}
		else if((Npc_HasItems(hero,ItFoMutton) < Meat_Amount) && (Meat_Counter < Meat_Amount))
		{
			Meat_Counter = Meat_Counter + Npc_HasItems(hero,ItFoMutton);
			ConcatMutton = IntToString(Npc_HasItems(other,ItFoMutton));
			ConcatMutton = ConcatStrings(ConcatMutton,"(dát pečené maso)");
			AI_Print(ConcatMutton);
			Npc_RemoveInvItems(other,ItFoMutton,Npc_HasItems(other,ItFoMutton));
		};
	};
	if(Npc_HasItems(hero,ItFo_Bacon) >= 1)
	{
		if((Npc_HasItems(hero,ItFo_Bacon) >= Meat_Amount) && (Meat_Counter < Meat_Amount))
		{
			B_GiveInvItems(hero,self,ItFo_Bacon,Meat_Amount - Meat_Counter);
			Meat_Counter = Meat_Counter + (Meat_Amount - Meat_Counter);
		}
		else if((Npc_HasItems(hero,ItFo_Bacon) < Meat_Amount) && (Meat_Counter < Meat_Amount))
		{
			Meat_Counter = Meat_Counter + Npc_HasItems(hero,ItFo_Bacon);
			ConcatBacon = IntToString(Npc_HasItems(other,ItFo_Bacon));
			ConcatBacon = ConcatStrings(ConcatBacon,"(dát šunku)");
			AI_Print(ConcatBacon);
			Npc_RemoveInvItems(other,ItFo_Bacon,Npc_HasItems(other,ItFo_Bacon));
		};
	};
	if(Npc_HasItems(hero,ItFo_Sausage) >= 1)
	{
		if((Npc_HasItems(hero,ItFo_Sausage) >= Meat_Amount) && (Meat_Counter < Meat_Amount))
		{
			B_GiveInvItems(hero,self,ItFo_Sausage,Meat_Amount - Meat_Counter);
			Meat_Counter = Meat_Counter + (Meat_Amount - Meat_Counter);
		}
		else if((Npc_HasItems(hero,ItFo_Sausage) < Meat_Amount) && (Meat_Counter < Meat_Amount))
		{
			Meat_Counter = Meat_Counter + Npc_HasItems(hero,ItFo_Sausage);
			ConcatSausage = IntToString(Npc_HasItems(other,ItFo_Sausage));
			ConcatSausage = ConcatStrings(ConcatSausage,"(dát klobásu)");
			AI_Print(ConcatSausage);
			Npc_RemoveInvItems(other,ItFo_Sausage,Npc_HasItems(other,ItFo_Sausage));
		};
	};
	if(Meat_Amount > Meat_Counter)
	{
		AI_Output(self,other,"DIA_Engor_BRINGMEAT_13_01");	//Pro začátek to není špatné, ale potřebuji víc.
		GesamtFleisch = IntToString(Meat_Counter);
		GesamtFleisch = ConcatStrings("Celkem předáno ",GesamtFleisch);
		GesamtFleisch = ConcatStrings(GesamtFleisch," kusů masa");
		AI_Print(GesamtFleisch);
	};
	if(Meat_Counter >= Meat_Amount)
	{
		B_GivePlayerXP(XP_BringMeat);
		AI_Output(self,other,"DIA_Engor_BRINGMEAT_13_02");	//Výborně, přinesl jsi dostatek masa. Nějakou dobu to vydrží.
		AI_Output(self,other,"DIA_Engor_BRINGMEAT_13_03");	//Ale nemysli si, že ti teď dám něco zadarmo!
		MIS_Engor_BringMeat = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_BringMeat,LOG_SUCCESS);
		B_LogEntry(TOPIC_BringMeat,"Engor už dostal maso a postará se, aby dostal každý svůj díl.");
	};
};


instance DIA_Engor_Business(C_Info)
{
	npc = VLK_4108_Engor;
	nr = 1;
	condition = DIA_Engor_Business_Condition;
	information = DIA_Engor_Business_Info;
	permanent = FALSE;
	description = "Jak jdou obchody?";
};


func int DIA_Engor_Business_Condition()
{
	if((Kapitel >= 4) && (MIS_Engor_BringMeat == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Engor_Business_Info()
{
	AI_Output(other,self,"DIA_Engor_Business_15_00");	//Jak jdou obchody?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Engor_Business_13_01");	//Jen tak tak. Doufám, že drakobijci mají tolik zlata, jako keců.
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Engor_Business_13_02");	//Všiváci! Paladinové právě teď nic nekupují.
	};
	AI_Output(self,other,"DIA_Engor_Business_13_03");	//Co ty, chceš něco koupit?
};

instance DIA_Engor_StoreKey(C_Info)
{
	npc = VLK_4108_Engor;
	nr = 1;
	condition = DIA_Engor_StoreKey_Condition;
	information = DIA_Engor_StoreKey_Info;
	permanent = FALSE;
	description = "Mám tvuj klíč.";
};

func int DIA_Engor_StoreKey_Condition()
{
	if(Npc_HasItems(hero,ItKe_OC_Store) >= 1)
	{
		return TRUE;
	};
};

func void DIA_Engor_StoreKey_Info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Engor_StoreKey_01_00");	//Mám tvuj klíč.
	AI_Output(self,other,"DIA_Engor_StoreKey_01_01");	//Tys ho našel?
	AI_Output(other,self,"DIA_Engor_StoreKey_01_02");	//Uhodl jsi! Na a zkus ho už neztratit.
	B_GiveInvItems(other,self,ItKe_OC_Store,1);
	Npc_RemoveInvItems(self,ItKe_OC_Store,1);
	AI_Output(self,other,"DIA_Engor_StoreKey_01_03");	//Díky kámo! Nevíš si představit jak jsi mi pomohl.
	AI_Output(self,other,"DIA_Engor_StoreKey_01_04");	//Garond by mě sežral i s ušima kvůli tomu klíči.
	AI_Output(self,other,"DIA_Engor_StoreKey_01_05");	//Za odměnu si vezmi tenhle lektvar. Alespoň něco za tvou námahu.
	B_GiveInvItems(self,other,ItPo_Health_02,3);
};

instance DIA_Engor_Ruestung(C_Info)
{
	npc = VLK_4108_Engor;
	nr = 2;
	condition = DIA_Engor_Ruestung_Condition;
	information = DIA_Engor_Ruestung_Info;
	permanent = FALSE;
	description = "Máš na prodej něco zaujímavého?";
};

func int DIA_Engor_Ruestung_Condition()
{
	if((other.guild == GIL_MIL) && ((SBMode == TRUE) || (RealMode[2] == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Engor_Ruestung_Info()
{
	AI_Output(other,self,"DIA_Engor_Ruestung_15_00");	//Máš na prodej něco zajímavého?
	AI_Output(self,other,"DIA_Engor_Ruestung_13_01");	//Mám na prodej nějakou zbroj, pokud tě to zajímá.
	AI_Output(self,other,"DIA_Engor_Ruestung_13_02");	//Samozřejmě není zadarmo. Dones mi dostatek zlata a je tvoje.
};

instance DIA_Engor_RSkaufen(C_Info)
{
	npc = VLK_4108_Engor;
	nr = 2;
	condition = DIA_Engor_RSkaufen_Condition;
	information = DIA_Engor_RSkaufen_Info;
	permanent = TRUE;
	description = "Koupit zbroj zbrojnoše (cena: 4000 zlatých)";
};

var int DIA_Engor_RSkaufen_perm;

func int DIA_Engor_RSkaufen_Condition()
{
	if((other.guild == GIL_MIL) && Npc_KnowsInfo(other,DIA_Engor_Ruestung) && (DIA_Engor_RSkaufen_perm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Engor_RSkaufen_Info()
{
	if(B_GiveInvItems(other,self,ItMi_Gold,4000))
	{
		AI_Output(other,self,"DIA_Engor_RSkaufen_15_00");	//Dej mi tu zbroj.
		AI_Output(self,other,"DIA_Engor_RSkaufen_13_01");	//Tu máš, spolehlivě tě ochrání - je to zatraceně dobrá zbroj.
		B_GiveInvItems(self,other,ItAr_PAL_L,1);
		DIA_Engor_RSkaufen_perm = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Engor_RSkaufen_13_02");	//Nejdříve sežeň zlato.
	};
};