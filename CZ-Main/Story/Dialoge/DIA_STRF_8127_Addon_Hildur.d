
instance DIA_STRF_8127_Addon_Hildur_EXIT(C_Info)
{
	npc = STRF_8127_Addon_Hildur;
	nr = 999;
	condition = DIA_STRF_8127_Addon_Hildur_EXIT_Condition;
	information = DIA_STRF_8127_Addon_Hildur_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_STRF_8127_Addon_Hildur_EXIT_Condition()
{
	return TRUE;
};

func void DIA_STRF_8127_Addon_Hildur_EXIT_Info()
{
	AI_StopProcessInfos(self);
};
	
	
instance DIA_STRF_8127_Addon_Hildur_HowYou(C_Info)
{
	npc = STRF_8127_Addon_Hildur;
	nr = 4;
	condition = DIA_STRF_8127_Addon_Hildur_HowYou_Condition;
	information = DIA_STRF_8127_Addon_Hildur_HowYou_Info;
	permanent = FALSE;
	description = "Jsi kovář?";
};

func int DIA_STRF_8127_Addon_Hildur_HowYou_Condition()
{
	return TRUE;
};

func void DIA_STRF_8127_Addon_Hildur_HowYou_Info()
{
	AI_Output(other,self,"DIA_STRF_8127_Addon_Hildur_HowYou_01_00");	//Jsi kovář?
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_HowYou_01_01");	//Ne, jsem jen prostej tavič rudy.
	AI_Output(other,self,"DIA_STRF_8127_Addon_Hildur_HowYou_01_02");	//To znamená, že nemusíš celí den tvrdě pracovat s kladivem v ruce?
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_HowYou_01_03");	//Jak vidíš. Ale nemysli si, že je to lehká práce!
	AI_Output(other,self,"DIA_STRF_8127_Addon_Hildur_HowYou_01_04");	//Věřím?
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_HowYou_01_05");	//Chvilku si to se mnou vyzkoušej a pochopíš.
};	
	
instance DIA_STRF_8127_Addon_Hildur_HowLong(C_Info)
{
	npc = STRF_8127_Addon_Hildur;
	nr = 4;
	condition = DIA_STRF_8127_Addon_Hildur_HowLong_Condition;
	information = DIA_STRF_8127_Addon_Hildur_HowLong_Info;
	permanent = FALSE;
	description = "Jsi tady už dlouho?";
};

func int DIA_STRF_8127_Addon_Hildur_HowLong_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8127_Addon_Hildur_HowYou) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8127_Addon_Hildur_HowLong_Info()
{
	AI_Output(other,self,"DIA_STRF_8127_Addon_Hildur_HowLong_01_00");	//Jsi tady už dlouho?
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_HowLong_01_01");	//Déle, než si dokážeš představit.
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_HowLong_01_02");	//Byl jsem zde v dobách, kdy celé údolí ovládali rudobaroni.
	AI_Output(other,self,"DIA_STRF_8127_Addon_Hildur_HowLong_01_03");	//Jak ses dostal ke skřetům?
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_HowLong_01_04");	//To je dlouhá historie...(zamyšleně) Jednou jsem doprovázel náklad rudy ze starého dolu.
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_HowLong_01_05");	//Když už jsem se skoro dostali k hradu, náhle na nás zaůtočili skřeti.
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_HowLong_01_06");	//Většinu stráží tenkrát zabili, a mě a ještě několik dalších odvlekli s sebou.
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_HowLong_01_07");	//Když skřeti zjistili, že jsem celkem dobrý v tavení rudy tak mě dali sem k peci abych odléval ingoty.
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_HowLong_01_08");	//No a tak jsem tady uvíznul.
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_HowLong_01_09");	//Mám podstatně jednodušší než ostatní chlapci. Mám dokonce svojí vlastní postel.
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_HowLong_01_10");	//Ale jsem stejný otrok jako oni.
	AI_Output(other,self,"DIA_STRF_8127_Addon_Hildur_HowLong_01_11");	//Rozumím.
};	

instance DIA_STRF_8127_Addon_Hildur_NeedRest(C_Info)
{
	npc = STRF_8127_Addon_Hildur;
	nr = 4;
	condition = DIA_STRF_8127_Addon_Hildur_NeedRest_Condition;
	information = DIA_STRF_8127_Addon_Hildur_NeedRest_Info;
	permanent = FALSE;
	description = "Můžeš mě naučit tavit rudu?";
};

func int DIA_STRF_8127_Addon_Hildur_NeedRest_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8127_Addon_Hildur_HowYou) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8127_Addon_Hildur_NeedRest_Info()
{
	AI_Output(other,self,"DIA_STRF_8127_Addon_Hildur_NeedRest_01_00");	//Můžeš mě naučit tavit rudu?
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_NeedRest_01_01");	//Promiň, ale nyní na to nemám čas.
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_NeedRest_01_02");	//Skřeti mě pořád hlídají jak pracuju. A když se jim něco nezdá hned začnou hrozit těma svýma sekerama.
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_NeedRest_01_03");	//Zvláště ten skřet co si říká Dabar Shak! Ten ze mě oko nespustí.
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_NeedRest_01_04");	//Kdybys dokázal na chvíli rozptýlit jeho pozornost. Tak bych ti mohl ukázat jak tavit rudu.
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_NeedRest_01_05");	//Ale jen tehdy, jestli máš dost zkušeností.
	AI_Output(other,self,"DIA_STRF_8127_Addon_Hildur_NeedRest_01_06");	//Dobře, zkusím něco vymyslet.
	MIS_NeedRest = LOG_Running;
	Log_CreateTopic(TOPIC_NeedRest,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_NeedRest,LOG_Running);
	B_LogEntry(TOPIC_NeedRest,"Hildur mě může naučit, jak tavit rudu, jestli dokážu nějak rozptýlit skřeta jménem Dabar Shaka, který ho neustále sleduje.");
};	


instance DIA_STRF_8127_Addon_Hildur_NeedRest_Done(C_Info)
{
	npc = STRF_8127_Addon_Hildur;
	nr = 4;
	condition = DIA_STRF_8127_Addon_Hildur_NeedRest_Done_Condition;
	information = DIA_STRF_8127_Addon_Hildur_NeedRest_Done_Info;
	permanent = FALSE;
	description = "Tvůj strážce si dává šlofíka.";
};

func int DIA_STRF_8127_Addon_Hildur_NeedRest_Done_Condition()
{
	if((MIS_NeedRest == LOG_Running) && (DabarShakIsSleep == TRUE))
	{
		return TRUE;
	};
};

func void DIA_STRF_8127_Addon_Hildur_NeedRest_Done_Info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_STRF_8127_Addon_Hildur_NeedRest_Done_01_00");	//Tvůj strážce si dává šlofíka.
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_NeedRest_Done_01_01");	//No konečně teď si můžu aspoň chvíli odpočinout!
	AI_Output(other,self,"DIA_STRF_8127_Addon_Hildur_NeedRest_Done_01_02");	//Tak co, naučíš mě tavit rudu?
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_NeedRest_Done_01_03");	//Proč ne? Ale jen pokud máš dostatek zkušeností.
	AI_Output(other,self,"DIA_STRF_8127_Addon_Hildur_NeedRest_Done_01_04");	//Samo sebou.
	RT_Respect = RT_Respect + 1;
	MIS_NeedRest = LOG_Success;
	Log_SetTopicStatus(TOPIC_NeedRest,LOG_Success);
	B_LogEntry(TOPIC_NeedRest,"Řekl jsem Hildurovi, že Dabar Shak usnul. Teď mě může naučit tavit rudu.");
};	

instance DIA_STRF_8127_Addon_Hildur_Plavka(C_Info)
{
	npc = STRF_8127_Addon_Hildur;
	nr = 5;
	condition = DIA_STRF_8127_Addon_Hildur_Plavka_condition;
	information = DIA_STRF_8127_Addon_Hildur_Plavka_info;
	permanent = TRUE;
	description = "Nauč mě tavit železnou rudu. (VB: 3)";
};

func int DIA_STRF_8127_Addon_Hildur_Plavka_condition()
{
	if((MIS_NeedRest == LOG_Success) && (KNOWHOWTOOREFUS == FALSE))
	{
		return TRUE;
	};
};

func void DIA_STRF_8127_Addon_Hildur_Plavka_info()
{
	AI_Output(other,self,"DIA_STRF_8127_Addon_Hildur_Plavka_01_00");	//Nauč mě tavit železnou rudu.

	if(hero.lp < 3)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		B_Say(self,other,"$NOLEARNNOPOINTS");
		AI_StopProcessInfos(self);
	};
	if(hero.lp >= 3)
	{
		AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_Plavka_01_01");	//V tavící peci je to jednoduchý, ale jde to i v obyčejné kovárně.
		AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_Plavka_01_02");	//Potřebuješ 50 kousků rudy. Roztavíš je v peci a pak z nich odléváš ingoty!
		AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_Plavka_01_03");	//A to je veškeré tajemství tavení železné rudy.
		hero.lp = hero.lp - 3;
		RankPoints = RankPoints + 3;
		AI_Print("Naučeno: Tavení železné rudy");
		KNOWHOWTOOREFUS = TRUE;
		DabarShakIsAwake = TRUE;
		Snd_Play("LevelUP");
		B_LogEntry(TOPIC_STEELDRAW,"K přetavení železné rudy na ingot potřebuji výheň a padesát kusů rudy.");
	};
};

instance DIA_STRF_8127_Addon_Hildur_Work(C_Info)
{
	npc = STRF_8127_Addon_Hildur;
	nr = 4;
	condition = DIA_STRF_8127_Addon_Hildur_Work_Condition;
	information = DIA_STRF_8127_Addon_Hildur_Work_Info;
	permanent = FALSE;
	description = "Máš pro mě nějakou práci?";
};

func int DIA_STRF_8127_Addon_Hildur_Work_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8127_Addon_Hildur_HowYou) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8127_Addon_Hildur_Work_Info()
{
	AI_Output(other,self,"DIA_STRF_8127_Addon_Hildur_Work_01_00");	//Máš pro mě nějakou práci?
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_Work_01_01");	//Hmm...(zamyšleně) Velmi bys mi pomohl, kdybys mi někde sehnal uhlí.
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_Work_01_02");	//Tadle pec už je velmi stará a mě vždycky trvá strašně dlouho, než v ní rozdělám oheň.
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_Work_01_03");	//A obyčejné uhlí tady neseženeš! 
	AI_Output(other,self,"DIA_STRF_8127_Addon_Hildur_Work_01_04");	//A kolik ho potřebuješ?
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_Work_01_05");	//Tolik zas ne. Myslím tak deset kousků, to by mě mohlo vystačit na dlouhou dobu.
	AI_Output(other,self,"DIA_STRF_8127_Addon_Hildur_Work_01_06");	//Dobře, zkusím ho pro tebe sehnat.
	MIS_HildurCoal = LOG_Running;
	Log_CreateTopic(TOPIC_HildurCoal,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HildurCoal,LOG_Running);
	B_LogEntry(TOPIC_HildurCoal,"Hildur potřebuje k roztápění své slévárny aspoň deset kousků uhlí.");
};	

instance DIA_STRF_8127_Addon_Hildur_WorkDone(C_Info)
{
	npc = STRF_8127_Addon_Hildur;
	nr = 4;
	condition = DIA_STRF_8127_Addon_Hildur_WorkDone_Condition;
	information = DIA_STRF_8127_Addon_Hildur_WorkDone_Info;
	permanent = FALSE;
	description = "Přinesl jsem ti uhlí.";
};

func int DIA_STRF_8127_Addon_Hildur_WorkDone_Condition()
{
	if((MIS_HildurCoal == LOG_Running) && (Npc_HasItems(hero,ItMi_Coal) >= 10))
	{
		return TRUE;
	};
};

func void DIA_STRF_8127_Addon_Hildur_WorkDone_Info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_STRF_8127_Addon_Hildur_WorkDone_01_00");	//Přinesl jsem ti uhlí.
	B_GiveInvItems(other,self,ItMi_Coal,10);
	Npc_RemoveInvItems(self,ItMi_Coal,10);
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_WorkDone_01_01");	//Výborně kamaráde. Teď je konec mému trápení!
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_WorkDone_01_02");	//Bohužel se ti nemám čím odvděčit.
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_WorkDone_01_03");	//Možná nějakou tou železnou rudou.
	B_GiveInvItems(self,other,ItMi_SNugget,2);
	AI_Output(other,self,"DIA_STRF_8127_Addon_Hildur_WorkDone_01_04");	//Lepší než nic.
	RT_Respect = RT_Respect + 1;
	MIS_HildurCoal = LOG_Success;
	Log_SetTopicStatus(TOPIC_HildurCoal,LOG_Success);
	B_LogEntry(TOPIC_HildurCoal,"Přinesl jsem Hildurovi uhlí.");
};
	
instance DIA_STRF_8127_Addon_Hildur_LowLevel(C_Info)
{
	npc = STRF_8127_Addon_Hildur;
	nr = 4;
	condition = DIA_STRF_8127_Addon_Hildur_LowLevel_Condition;
	information = DIA_STRF_8127_Addon_Hildur_LowLevel_Info;
	permanent = FALSE;
	description = "Co víš o spodní části dolu?";
};

func int DIA_STRF_8127_Addon_Hildur_LowLevel_Condition()
{
	if((Npc_KnowsInfo(hero,DIA_STRF_8127_Addon_Hildur_HowYou) == TRUE) && (MIS_LowLevel == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_STRF_8127_Addon_Hildur_LowLevel_Info()
{
	AI_Output(other,self,"DIA_STRF_8127_Addon_Hildur_LowLevel_01_00");	//Co víš o spodní části dolu?
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_LowLevel_01_01");	//Hmm...(udiveně) A proč se na to ptáš?!
	AI_Output(other,self,"DIA_STRF_8127_Addon_Hildur_LowLevel_01_02");	//Podle toho co říkal Rolland, tak něco víš.
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_LowLevel_01_03");	//Aha, takže to ti nakukal Rolland? Ten jeden žvanil!
	AI_Output(other,self,"DIA_STRF_8127_Addon_Hildur_LowLevel_01_04");	//Znamená to, že měl pravdu. Možná mě teď povíš, co víš o spodní části dolu?
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_LowLevel_01_05");	//Ach! No, dobře...(povzdechne si) Víš nerad o tom mluvím.
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_LowLevel_01_06");	//Po pravdě, dřív se v spodní části také těžila ruda.
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_LowLevel_01_07");	//Ale ne železná, ale magická! Byla tam velmi bohatá žíla.
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_LowLevel_01_08");	//A všechno šlo lhce do doby, než skřeti vykopali něco co neměli.
	AI_Output(other,self,"DIA_STRF_8127_Addon_Hildur_LowLevel_01_09");	//Co konkrétně tam našli?
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_LowLevel_01_10");	//To nevím kamaráde. V té době jsem už pracoval tady, u pece. Takže jsem se už nemohl moc vzdalovat.
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_LowLevel_01_11");	//Ale jedno vím jistě...
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_LowLevel_01_12");	//... od té doby byl průchod do nižší úrovně uzavřen a už nikdy ho neotevřeli!
	AI_Output(other,self,"DIA_STRF_8127_Addon_Hildur_LowLevel_01_13");	//Znamená to, že nikdo nezná důvod proč skřeti tu šachtu uzavřeli?
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_LowLevel_01_14");	//Jestli to někdo ví, tak samotní skřeti.
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_LowLevel_01_15");	//A z těch kdo tu tenkrát byli zůstal už jenom jeden skřet a to Grok. Starej skřetí strážce, co stojí vedle lanovky.
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_LowLevel_01_16");	//Můžeš s nim zkusit promluvit, jestli tě ovšem bude poslouchat.
	AI_Output(other,self,"DIA_STRF_8127_Addon_Hildur_LowLevel_01_17");	//Dobře, já to zkusím.
	KnowGrok = TRUE;
	B_LogEntry(TOPIC_LowLevel,"Mluvil jsem s Hildurem o spodní části dolu. Zdá se, že skřeti tam narazili na něco, čeho se strašně bojí. Co přesně to je, to Hildur nevěděl. Něco by o tom mohl vědět starý skřetí strážce.");
};	

instance DIA_STRF_8127_Addon_Hildur_Perm(C_Info)
{
	npc = STRF_8127_Addon_Hildur;
	nr = 2;
	condition = DIA_STRF_8127_Addon_Hildur_Perm_Condition;
	information = DIA_STRF_8127_Addon_Hildur_Perm_Info;
	permanent = TRUE;
	description = "Jak to jde?";
};

func int DIA_STRF_8127_Addon_Hildur_Perm_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8127_Addon_Hildur_HowLong) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8127_Addon_Hildur_Perm_Info()
{
	AI_Output(other,self,"DIA_STRF_8127_Addon_Hildur_Perm_01_00");	//Jak to jde?
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_Perm_01_01");	//Všechno při starém...(povzdech) celý den jen odlévám ocelové ingoty.
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_Perm_01_02");	//Ale lepší než s krumpáčem v dole.
	AI_Output(other,self,"DIA_STRF_8127_Addon_Hildur_Perm_01_03");	//To jsi trefil.
};	

instance DIA_STRF_8127_Addon_Hildur_ElkKirka(C_Info)
{
	npc = STRF_8127_Addon_Hildur;
	nr = 2;
	condition = DIA_STRF_8127_Addon_Hildur_ElkKirka_Condition;
	information = DIA_STRF_8127_Addon_Hildur_ElkKirka_Info;
	permanent = FALSE;
	description = "Nevíš náhodou kde zde mohu získat slušný krumpáč?";
};

func int DIA_STRF_8127_Addon_Hildur_ElkKirka_Condition()
{
	if((MIS_ElkKirka == LOG_Running) && (ElkNeedNewKirka == TRUE) && (Npc_KnowsInfo(hero,DIA_STRF_8127_Addon_Hildur_HowYou) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_STRF_8127_Addon_Hildur_ElkKirka_Info()
{
	AI_Output(other,self,"DIA_STRF_8127_Addon_Hildur_ElkKirka_01_00");	//Nevíš náhodou kde zde mohu získat slušný krumpáč?
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_ElkKirka_01_01");	//Veškeré nářadí tady má na starost Vakur Shak.
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_ElkKirka_01_02");	//Ale jestli nemáš zlato, tak to ani nezkoušej.
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_ElkKirka_01_03");	//To prase je příliš chamtivý na skřeta! Ale to na tom nic nemění...
	AI_Output(other,self,"DIA_STRF_8127_Addon_Hildur_ElkKirka_01_04");	//A odkud otroci berou zlato?
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_ElkKirka_01_05");	//Někdy se v žíle železné rudy najdou drobné žilky zlata.
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_ElkKirka_01_06");	//Když na takovou žílu narazíš, pak jsi šťastlivec,
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_ElkKirka_01_07");	//Za zlato si zde můžeš koupit cokoliv, i různé nástroje.
	AI_Output(self,other,"DIA_STRF_8127_Addon_Hildur_ElkKirka_01_08");	//A takle tu žijem!
	AI_Output(other,self,"DIA_STRF_8127_Addon_Hildur_ElkKirka_01_09");	//Jasně.
	ElkNeedNewKirka = 2;
};	