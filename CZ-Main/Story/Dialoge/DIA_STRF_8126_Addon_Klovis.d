
instance DIA_STRF_8126_Addon_Klovis_EXIT(C_Info)
{
	npc = STRF_8126_Addon_Klovis;
	nr = 999;
	condition = DIA_STRF_8126_Addon_Klovis_EXIT_Condition;
	information = DIA_STRF_8126_Addon_Klovis_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_STRF_8126_Addon_Klovis_EXIT_Condition()
{
	return TRUE;
};

func void DIA_STRF_8126_Addon_Klovis_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_STRF_8126_Addon_Klovis_Hearing(C_Info)
{
	npc = STRF_8126_Addon_Klovis;
	nr = 2;
	condition = DIA_STRF_8126_Addon_Klovis_Hearing_Condition;
	information = DIA_STRF_8126_Addon_Klovis_Hearing_Info;
	permanent = FALSE;
	description = "Ještě nejsi unavený z kutání, Clovisi?";
};

func int DIA_STRF_8126_Addon_Klovis_Hearing_Condition()
{
	return TRUE;
};

func void DIA_STRF_8126_Addon_Klovis_Hearing_Info()
{
	AI_Output(other,self,"DIA_STRF_8126_Addon_Klovis_Hearing_15_00");	//Ještě nejsi unavený z kutání, Clovisi?
	AI_Output(self,other,"DIA_STRF_8126_Addon_Klovis_Hearing_04_01");	//Co si myslíš? (směje se) Nemám na vybranou.
};

instance DIA_STRF_8126_Addon_Klovis_Ore(C_Info)
{
	npc = STRF_8126_Addon_Klovis;
	nr = 2;
	condition = DIA_STRF_8126_Addon_Klovis_Ore_Condition;
	information = DIA_STRF_8126_Addon_Klovis_Ore_Info;
	permanent = FALSE;
	description = "Možná budete potřebovat pomoc?";
};

func int DIA_STRF_8126_Addon_Klovis_Ore_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8126_Addon_Klovis_Hearing) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8126_Addon_Klovis_Ore_Info()
{
	AI_Output(other,self,"DIA_STRF_8126_Addon_Klovis_Ore_01_00");	//Možná budete potřebovat pomoc?
	AI_Output(self,other,"DIA_STRF_8126_Addon_Klovis_Ore_01_01");	//(sarkasticky) Pomoc? Myslím že ji všichni potřebujem!
	AI_Output(self,other,"DIA_STRF_8126_Addon_Klovis_Ore_01_02");	//Ale musím ti říct že by se mi hodilo, kdybys mi přinesl 50 kusů železné rudy, pak bych si mohl trochu odpočnout.
	AI_Output(self,other,"DIA_STRF_8126_Addon_Klovis_Ore_01_03");	//Kutat železnou žílu není vůbec snadné jak asi sami víte, práce to snadná vůbec není.
	AI_Output(other,self,"DIA_STRF_8126_Addon_Klovis_Ore_01_04");	//Padesát?
	AI_Output(self,other,"DIA_STRF_8126_Addon_Klovis_Ore_01_05");	//To je počet který musíme zvládnout každý den.
	AI_Output(self,other,"DIA_STRF_8126_Addon_Klovis_Ore_01_06");	//Pokud přinesu méně, pak další den musím natěžit o to více.
	AI_Output(self,other,"DIA_STRF_8126_Addon_Klovis_Ore_01_07");	//A tak bez přestávky, jeden ale...
	AI_Output(self,other,"DIA_STRF_8126_Addon_Klovis_Ore_01_08");	//Jeden skřet který kontroluje rudu si občas nevšimne... ach... jak bych to jen řekl, ztráty.
	AI_Output(self,other,"DIA_STRF_8126_Addon_Klovis_Ore_01_09");	//Ale jen pouze tehdy pokud máš zlaté nugety.
	AI_Output(self,other,"DIA_STRF_8126_Addon_Klovis_Ore_01_10");	//A tak je s ním vyměníte.

	if(VakurShakNeedGold == TRUE)
	{
		AI_Output(other,self,"DIA_STRF_8126_Addon_Klovis_Ore_01_11");	//Nech mě hádat: Nejmenuje se ten skřet náhodou Vakur Shak?
		AI_Output(self,other,"DIA_STRF_8126_Addon_Klovis_Ore_01_12");	//Je přátelský... (smích) Hádám, že už ses s ním setkal?
	};

	AI_Output(other,self,"DIA_STRF_8126_Addon_Klovis_Ore_01_13");	//Takže tady se dá těžit zlato?
	AI_Output(self,other,"DIA_STRF_8126_Addon_Klovis_Ore_01_14");	//Ne, jen tu a tam se tu dají najít zlaté žíly.
	AI_Output(self,other,"DIA_STRF_8126_Addon_Klovis_Ore_01_15");	//(vážně) Ale nikomu o tom něříkej! Je to naše malé tajemství.
	AI_Output(self,other,"DIA_STRF_8126_Addon_Klovis_Ore_01_16");	//Protože, jestli se o tom Ar Dagar dozví, je s námi konec.
	AI_Output(self,other,"DIA_STRF_8126_Addon_Klovis_Ore_01_17");	//Tak co přineseš mi tu rudu?
	AI_Output(other,self,"DIA_STRF_8126_Addon_Klovis_Ore_01_18");	//Pokusím se.
	MIS_KlovisOre = LOG_Running;
	Log_CreateTopic(TOPIC_KlovisOre,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KlovisOre,LOG_Running);
	B_LogEntry(TOPIC_KlovisOre,"Clovis po mě chce, abych mu přinesl 50 kusů rudy, takové množství musí kopáči denně skřetům odvádět.");
};

instance DIA_STRF_8126_Addon_Klovis_OreDone(C_Info)
{
	npc = STRF_8126_Addon_Klovis;
	nr = 2;
	condition = DIA_STRF_8126_Addon_Klovis_OreDone_Condition;
	information = DIA_STRF_8126_Addon_Klovis_OreDone_Info;
	permanent = FALSE;
	description = "Tady je těch 50 kusů rudy.";
};

func int DIA_STRF_8126_Addon_Klovis_OreDone_Condition()
{
	if((MIS_KlovisOre == LOG_Running) && (Npc_HasItems(other,ITMI_SNUGGET) >= 50))
	{
		return TRUE;
	};
};

func void DIA_STRF_8126_Addon_Klovis_OreDone_Info()
{
	B_GivePlayerXP(450);
	AI_Output(other,self,"DIA_STRF_8126_Addon_Klovis_OreDone_01_00");	//Tady je těch 50 kusů rudy.
	B_GiveInvItems(other,self,ITMI_SNUGGET,50);
	Npc_RemoveInvItems(self,ITMI_SNUGGET,50);
	AI_Output(self,other,"DIA_STRF_8126_Addon_Klovis_OreDone_01_01");	//Ok, příteli! S tímhle množstvím rudy teď nemusím nějakou dobu hnout ani prstem.
	AI_Output(self,other,"DIA_STRF_8126_Addon_Klovis_OreDone_01_02");	//Aspoň si budu moct dát 1 nebo dva dny oddech.

	if(HERO_HACKCHANCEORE < 100)
	{
		AI_Output(other,self,"DIA_STRF_8126_Addon_Klovis_OreDone_01_03");	//Nevím, jak ti můžu poděkovat!
		AI_Output(self,other,"DIA_STRF_8126_Addon_Klovis_OreDone_01_04");	//Alespoň ti ukážu jak učiněji těžit. Věř mi v tomhle oboru jsem mistr.
		AI_Output(other,self,"DIA_STRF_8126_Addon_Klovis_OreDone_01_05");	//Vypadám snad jako kopáč?
		AI_Output(self,other,"DIA_STRF_8126_Addon_Klovis_OreDone_01_06");	//Ne... (zmateně) Ale třeba se ti to jednou bude hodit? Nemám jak jinak bych ti poděkoval.
	};

	AI_Output(other,self,"DIA_STRF_8126_Addon_Klovis_OreDone_01_07");	//A co takhle zlatý nuggety?
	AI_Output(self,other,"DIA_STRF_8126_Addon_Klovis_OreDone_01_08");	//Heh... (sarkasticky) Jak mazaný! Nejseš tak jednoduchej, jak se na první pohled zdáš. 
	AI_Output(self,other,"DIA_STRF_8126_Addon_Klovis_OreDone_01_09");	//Okay! Pokud chceš, můžu ti pár kusů dát.
	RT_Respect = RT_Respect + 1;
	MIS_KlovisOre = LOG_Success;
	Log_SetTopicStatus(TOPIC_KlovisOre,LOG_Success);
	B_LogEntry(TOPIC_KlovisOre,"Přinesl jsem Clovisovi 50 kusů rudy.");
	Info_ClearChoices(DIA_STRF_8126_Addon_Klovis_OreDone);

	if(HERO_HACKCHANCEORE < 100)
	{
		Info_AddChoice(DIA_STRF_8126_Addon_Klovis_OreDone,"Nauč mě těžit.",DIA_STRF_8126_Addon_Klovis_OreDone_W1);
	};

	Info_AddChoice(DIA_STRF_8126_Addon_Klovis_OreDone,"Radši si vemu to zlato.",DIA_STRF_8126_Addon_Klovis_OreDone_W2);
};

func void DIA_STRF_8126_Addon_Klovis_OreDone_W1()
{
	if(KNOWHOWPICKORE == FALSE)
	{
		Npc_SetTalentSkill(hero,NPC_TALENT_ERZWORK,1);
		AI_Print(PRINT_LEARNPICKORE);
		HERO_HACKCHANCEORE = HERO_HACKCHANCEORE + 10;

		if(HERO_HACKCHANCEORE > 100)
		{
			HERO_HACKCHANCEORE = 100;
		};

		KNOWHOWPICKORE = TRUE;
		Npc_SetTalentValue(hero,NPC_TALENT_ERZWORK,HERO_HACKCHANCEORE);
		Snd_Play("Levelup");

		if(ORE_TOPIC_EXIST == TRUE)
		{
			B_LogEntry(TOPIC_MAGICORE,"Nyní vím, jak těžit rudu.");
		}
		else
		{
			Log_CreateTopic(TOPIC_MAGICORE,LOG_NOTE);
			B_LogEntry(TOPIC_MAGICORE,"Nyní vím, jak těžit rudu.");
			ORE_TOPIC_EXIST = TRUE;
		};
	}
	else
	{
		AI_Print(PRINT_LEARNPICKORE);
		HERO_HACKCHANCEORE = HERO_HACKCHANCEORE + 10;

		if(HERO_HACKCHANCEORE > 100)
		{
			HERO_HACKCHANCEORE = 100;
		};
		if(HERO_HACKCHANCEORE >= 90)
		{
			Npc_SetTalentSkill(hero,NPC_TALENT_ERZWORK,4);
		}
		else if(HERO_HACKCHANCEORE >= 60)
		{
			Npc_SetTalentSkill(hero,NPC_TALENT_ERZWORK,3);
		}
		else if(HERO_HACKCHANCEORE >= 30)
		{
			Npc_SetTalentSkill(hero,NPC_TALENT_ERZWORK,2);
		}
		else
		{
			Npc_SetTalentSkill(hero,NPC_TALENT_ERZWORK,1);
		};

		Npc_SetTalentValue(hero,NPC_TALENT_ERZWORK,HERO_HACKCHANCEORE);
		Snd_Play("Levelup");
	};

	AI_Output(other,self,"DIA_STRF_8126_Addon_Klovis_OreDone_W1_01_00");	//Nauč mě těžit.
	AI_Output(self,other,"DIA_STRF_8126_Addon_Klovis_OreDone_W1_01_01");	//OK, dobře mě poslouchej, základ je správně držet krumpáč.
	AI_Output(self,other,"DIA_STRF_8126_Addon_Klovis_OreDone_W1_01_02");	//Drž to těsně pod stňedem, oběma rukama.
	AI_Output(self,other,"DIA_STRF_8126_Addon_Klovis_OreDone_W1_01_03");	//To ti umožní kriticky zasáhnout stňed žíly.
	AI_Output(self,other,"DIA_STRF_8126_Addon_Klovis_OreDone_W1_01_04");	//Pokračuj zásahy do stejného místa, budeš si to pamatovat?
	AI_Output(other,self,"DIA_STRF_8126_Addon_Klovis_OreDone_W1_01_05");	//Jo, jasně.
	Info_ClearChoices(DIA_STRF_8126_Addon_Klovis_OreDone);
};

func void DIA_STRF_8126_Addon_Klovis_OreDone_W2()
{
	AI_Output(other,self,"DIA_STRF_8126_Addon_Klovis_OreDone_W2_01_00");	//Radši si vemu to zlato.
	AI_Output(self,other,"DIA_STRF_8126_Addon_Klovis_OreDone_W2_01_01");	//OK tady to máš!
	B_GiveInvItems(self,other,ItMi_Addon_GoldNugget,3);
	Info_ClearChoices(DIA_STRF_8126_Addon_Klovis_OreDone);
};