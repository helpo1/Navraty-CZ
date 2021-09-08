
instance DIA_Parlaf_EXIT(C_Info)
{
	npc = VLK_4107_Parlaf;
	nr = 999;
	condition = DIA_Parlaf_EXIT_Condition;
	information = DIA_Parlaf_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Parlaf_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Parlaf_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Parlaf_HALLO(C_Info)
{
	npc = VLK_4107_Parlaf;
	nr = 1;
	condition = DIA_Parlaf_HALLO_Condition;
	information = DIA_Parlaf_HALLO_Info;
	description = "Hej, jak to jde?";
};


func int DIA_Parlaf_HALLO_Condition()
{
	if(Kapitel < 4)
	{
		return TRUE;
	};
};

func void DIA_Parlaf_HALLO_Info()
{
	AI_Output(other,self,"DIA_Parlaf_HALLO_15_00");	//Hej, jak to jde?
	AI_Output(self,other,"DIA_Parlaf_HALLO_03_01");	//Jak myslíš že by to šlo? Trávím tu celé dny broušením čepelí.
	if(Npc_IsDead(Engor) == FALSE)
	{
		AI_Output(self,other,"DIA_Parlaf_HALLO_03_02");	//A včera Engor znovu zkrátil naše příděly. Jestli to tak půjde dál, brzy začneme hladovět.
		AI_Output(self,other,"DIA_Parlaf_HALLO_03_03");	//A nebo nás všechny sejmou ti bastardi venku, vyjde to nastejno.
	};
};


instance DIA_Parlaf_ENGOR(C_Info)
{
	npc = VLK_4107_Parlaf;
	nr = 2;
	condition = DIA_Parlaf_ENGOR_Condition;
	information = DIA_Parlaf_ENGOR_Info;
	description = "Kdo je Engor?";
};


func int DIA_Parlaf_ENGOR_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Parlaf_HALLO) && (Npc_IsDead(Engor) == FALSE))
	{
		if(Kapitel < 4)
		{
			return TRUE;
		};
	};
};

func void DIA_Parlaf_ENGOR_Info()
{
	AI_Output(other,self,"DIA_Parlaf_ENGOR_15_00");	//Kdo je Engor?
	AI_Output(self,other,"DIA_Parlaf_ENGOR_03_01");	//Engor je provianťák - stará se o příděly a každý týden je zkracuje.
	AI_Output(self,other,"DIA_Parlaf_ENGOR_03_02");	//Také ti něco dá, ale nejsi Garondův voják, takže budeš muset zaplatit.
	AI_Output(other,self,"DIA_Parlaf_ENGOR_15_03");	//Ty nemusíš platit?
	AI_Output(self,other,"DIA_Parlaf_ENGOR_03_04");	//Ne, svůj žold dostávám v potravinách!
	Log_CreateTopic(TOPIC_Trader_OC,LOG_NOTE);
	Log_AddEntry(TOPIC_Trader_OC,"Engor se stará o zásoby na hradě.");
};


instance DIA_Parlaf_Wo(C_Info)
{
	npc = VLK_4107_Parlaf;
	nr = 3;
	condition = DIA_Parlaf_Wo_Condition;
	information = DIA_Parlaf_Wo_Info;
	permanent = FALSE;
	description = "Kde můžu najít toho Engora?";
};


func int DIA_Parlaf_Wo_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Parlaf_ENGOR) && (Npc_IsDead(Engor) == FALSE))
	{
		if(Kapitel < 4)
		{
			return TRUE;
		};
	};
};

func void DIA_Parlaf_Wo_Info()
{
	AI_Output(other,self,"DIA_Parlaf_Wo_15_00");	//Kde můžu najít toho Engora?
	AI_Output(self,other,"DIA_Parlaf_Wo_03_01");	//Nad domem paladinů - hned vedle kovárny je do něj vstup.
};


instance DIA_Parlaf_HUNGRIG(C_Info)
{
	npc = VLK_4107_Parlaf;
	nr = 2;
	condition = DIA_Parlaf_HUNGRIG_Condition;
	information = DIA_Parlaf_HUNGRIG_Info;
	permanent = TRUE;
	description = "Co je nového?";
};


func int DIA_Parlaf_HUNGRIG_Condition()
{
	if((MIS_Engor_BringMeat != LOG_SUCCESS) && Npc_KnowsInfo(hero,DIA_Parlaf_HALLO) && (Npc_IsDead(Engor) == FALSE))
	{
		if(Kapitel < 4)
		{
			return TRUE;
		};
	};
};

func void DIA_Parlaf_HUNGRIG_Info()
{
	AI_Output(other,self,"DIA_Parlaf_HUNGRIG_15_00");	//Co je nového?
	AI_Output(self,other,"DIA_Parlaf_HUNGRIG_03_01");	//Ten zatracený Engor zase zkrátil příděly
};


instance DIA_Parlaf_SATT(C_Info)
{
	npc = VLK_4107_Parlaf;
	nr = 3;
	condition = DIA_Parlaf_SATT_Condition;
	information = DIA_Parlaf_SATT_Info;
	permanent = TRUE;
	description = "Co je nového?";
};


func int DIA_Parlaf_SATT_Condition()
{
	if(((MIS_Engor_BringMeat == LOG_SUCCESS) || Npc_IsDead(Engor)) && Npc_KnowsInfo(hero,DIA_Parlaf_HALLO))
	{
		if(Kapitel < 4)
		{
			return TRUE;
		};
	};
};


var int DIA_Parlaf_SATT_OneTime;

func void DIA_Parlaf_SATT_Info()
{
	AI_Output(other,self,"DIA_Parlaf_SATT_15_00");	//Co je nového?

	if((DIA_Parlaf_SATT_OneTime == FALSE) && (Npc_IsDead(Engor) == FALSE))
	{
		AI_Output(self,other,"DIA_Parlaf_SATT_03_01");	//Engor nám zkrátil příděl masa.
		DIA_Parlaf_SATT_OneTime = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Parlaf_SATT_03_02");	//Tvůj příchod, jinak nic.
	};
};

instance DIA_Parlaf_DobarOut(C_Info)
{
	npc = VLK_4107_Parlaf;
	nr = 1;
	condition = DIA_Parlaf_DobarOut_Condition;
	information = DIA_Parlaf_DobarOut_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Parlaf_DobarOut_Condition()
{
	if(MIS_DobarOut == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Parlaf_DobarOut_Info()
{
	B_GivePlayerXP(300);
	AI_Output(self,other,"DIA_Parlaf_DobarOut_01_00");	//(strach) Kdo je tam? Ach, to jsi ty...
	AI_Output(other,self,"DIA_Parlaf_DobarOut_01_01");	//Tak tady se ukrýváš. Co tě sem přivedlo?
	AI_Output(self,other,"DIA_Parlaf_DobarOut_01_02");	//(deprese) Jednou v noci mě Dobar probudil a nabídl útěk z hradu. A já blázen ho poslechl.
	AI_Output(self,other,"DIA_Parlaf_DobarOut_01_03");	//Ale nevím jak by se dalo z tohodle údolí dostat živý... (tiše) No, možná právě tobě se to podaří.
	AI_Output(other,self,"DIA_Parlaf_DobarOut_01_04");	//K věci, kde je Dobar a proč jseš tady?
	AI_Output(self,other,"DIA_Parlaf_DobarOut_01_05");	//A-ah... ano, dobře, dobře. Další noc jsme sešli dolů bez povšimnutí po beranidlu - Zrovna se střídala hlídka a my využili příležitosti.
	AI_Output(self,other,"DIA_Parlaf_DobarOut_01_06");	//Už jsme skoro opustily kruh obležení kolem hradu, viděli jsme spousty skřetích skupin.
	AI_Output(self,other,"DIA_Parlaf_DobarOut_01_07");	//Nevzpomínám si přesně jak - rozběhly jsme se do různých směrů. 
	AI_Output(self,other,"DIA_Parlaf_DobarOut_01_08");	//Běžel jsem bez ohlédnutí podél útesu, dokud jsem si nevšiml římsy a pak vylezl sem.
	AI_Output(other,self,"DIA_Parlaf_DobarOut_01_09");	//A ty potvory neviděly jak se sem škrábeš?
	AI_Output(self,other,"DIA_Parlaf_DobarOut_01_10");	//Jsem velmi překvapen že jsem stále naživu. Nemohli, nevidí... (drbe se na hlavě)
	AI_Output(self,other,"DIA_Parlaf_DobarOut_01_11");	//Myslím že oni ví, že nemám kam jít odsuď. A tak si raději ze mě dělají srandu protože tady brzo umřu hlady.
	AI_Output(self,other,"DIA_Parlaf_DobarOut_01_12");	//Mám ale jiný nápad.
	AI_Output(other,self,"DIA_Parlaf_DobarOut_01_13");	//Kam běžel Dobar?
	AI_Output(self,other,"DIA_Parlaf_DobarOut_01_14");	//Já nevím... Jak říkám všechno se stalo tak náhle. Ale neběžel zrovna v tomhle směru.
	AI_Output(other,self,"DIA_Parlaf_DobarOut_01_15");	//Vidím... A co s tebou mám dělat chlape?
	AI_Output(self,other,"DIA_Parlaf_DobarOut_01_16");	//B... Byl bych velmi vděčný, jestli... bys mě vzal zpátky do hradu
	AI_Output(self,other,"DIA_Parlaf_DobarOut_01_17");	//Jenom... Bojím se představy reakce Garonda na mou dezerci...
	AI_Output(other,self,"DIA_Parlaf_DobarOut_01_18");	//Nemyslím si že tě bude přísně trestat. Mluvil jsem s ním a zjistil že má plné ruce práce.
	AI_Output(other,self,"DIA_Parlaf_DobarOut_01_19");	//Tak mi řekni jedno - dovedete mě na hrad, nebo ne?
	AI_Output(self,other,"DIA_Parlaf_DobarOut_01_20");	//Ale, no tak co... půjdu s tebou.
	AI_Output(other,self,"DIA_Parlaf_DobarOut_01_21");	//Tak jdeme.
	AI_Output(self,other,"DIA_Parlaf_DobarOut_01_22");	//Dobře, veď.
	B_LogEntry(TOPIC_DobarOut,"Musím vzít Parlafa zpátky do hradu.");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	ParlafFind = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FollowMe");
};

instance DIA_Parlaf_DobarOut_Come(C_Info)
{
	npc = VLK_4107_Parlaf;
	nr = 1;
	condition = DIA_Parlaf_DobarOut_Come_Condition;
	information = DIA_Parlaf_DobarOut_Come_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Parlaf_DobarOut_Come_Condition()
{
	if((MIS_DobarOut == LOG_Running) && (ParlafFind == TRUE) && (Npc_GetDistToWP(self,"OC_RAMP_08") <= 500))
	{
		return TRUE;
	};
};

func void DIA_Parlaf_DobarOut_Come_Info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Parlaf_DobarOut_Come_01_00");	//Tak jsme tu.
	AI_Output(self,other,"DIA_Parlaf_DobarOut_Come_01_01");	//Díky, kámo. Zachránils můj zadek! Obávám se ale že nemám nic abych ti dost poděkoval. Je to...

	if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR) || (hero.guild == GIL_NDM) || (hero.guild == GIL_NDW) || (hero.guild == GIL_NOV))
	{
		AI_Output(self,other,"DIA_Parlaf_DobarOut_Come_01_02");	//Jednou při procházce do kaple, našel jsem runový kámen. Pravděpodobně někoho z mágů, myslím že se ti to bude hodit.
		B_GiveInvItems(self,other,ItMi_HighRuneBlank,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Parlaf_DobarOut_Come_01_03");	//Mám několik kusů oceli. Myslím že se ti to bude hodit.
		B_GiveInvItems(self,other,ItMiSwordraw,3);
	};

	AI_Output(other,self,"DIA_Parlaf_DobarOut_Come_01_04");	//Děkuju.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	ParlafOnPlace = TRUE;
	B_LogEntry(TOPIC_DobarOut,"Přivedl jsem zpátky do hradu Parlafa. Myslím že bych měl informovat Garonda.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"StartNew");
};

instance DIA_Parlaf_DobarDead(C_Info)
{
	npc = VLK_4107_Parlaf;
	nr = 3;
	condition = DIA_Parlaf_DobarDead_Condition;
	information = DIA_Parlaf_DobarDead_Info;
	permanent = FALSE;
	description = "Zjistil jsem že Dobar nedaleko hradu, skončil.";
};

func int DIA_Parlaf_DobarDead_Condition()
{
	if((ParlafOnPlace == TRUE) && (DobarOnPlace == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Parlaf_DobarDead_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Parlaf_DobarDead_01_00");	//Zjistil jsem že Dobar nedaleko hradu, skončil.
	AI_Output(self,other,"DIA_Parlaf_DobarDead_01_01");	//Eh... nestačilo stále běhat. Sundaly ho dolů.
};

instance DIA_Parlaf_WorkAgain(C_Info)
{
	npc = VLK_4107_Parlaf;
	nr = 3;
	condition = DIA_Parlaf_WorkAgain_Condition;
	information = DIA_Parlaf_WorkAgain_Info;
	permanent = FALSE;
	description = "Garond se rozhodl že tě neztrestá.";
};

func int DIA_Parlaf_WorkAgain_Condition()
{
	if(MIS_DobarOut == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Parlaf_WorkAgain_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Parlaf_WorkAgain_01_00");	//Garond se rozhodl že tě neztrestá.
	AI_Output(other,self,"DIA_Parlaf_WorkAgain_01_01");	//Budeš muset, stejně jako dříve ostřit nože.
	AI_Output(self,other,"DIA_Parlaf_WorkAgain_01_02");	//Ó, obával jsem se nejhoršího...
	AI_Output(self,other,"DIA_Parlaf_WorkAgain_01_03");	//Ale teď nechci vytáhnout ani paty z hradu. Alespoň do doby, kdy je kolem živo.
	AI_Output(self,other,"DIA_Parlaf_WorkAgain_01_04");	//Děkuji moc!
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};

instance DIA_Parlaf_PICKPOCKET(C_Info)
{
	npc = VLK_4107_Parlaf;
	nr = 900;
	condition = DIA_Parlaf_PICKPOCKET_Condition;
	information = DIA_Parlaf_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int DIA_Parlaf_PICKPOCKET_Condition()
{
	return C_Beklauen(34,12);
};

func void DIA_Parlaf_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Parlaf_PICKPOCKET);
	Info_AddChoice(DIA_Parlaf_PICKPOCKET,Dialog_Back,DIA_Parlaf_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Parlaf_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Parlaf_PICKPOCKET_DoIt);
};

func void DIA_Parlaf_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Parlaf_PICKPOCKET);
};

func void DIA_Parlaf_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Parlaf_PICKPOCKET);
};