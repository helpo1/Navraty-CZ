
instance DIA_GornDJG_EXIT(C_Info)
{
	npc = PC_Fighter_DJG;
	nr = 999;
	condition = DIA_GornDJG_EXIT_Condition;
	information = DIA_GornDJG_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_GornDJG_EXIT_Condition()
{
	return TRUE;
};

func void DIA_GornDJG_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GornDJG_STARTCAMP(C_Info)
{
	npc = PC_Fighter_DJG;
	condition = DIA_GornDJG_STARTCAMP_Condition;
	information = DIA_GornDJG_STARTCAMP_Info;
	description = "Vidím, že ses přidal k drakobijcům.";
};


func int DIA_GornDJG_STARTCAMP_Condition()
{
	if(Npc_GetDistToWP(self,"OW_DJG_STARTCAMP_01") < 1000)
	{
		return TRUE;
	};
};

func void DIA_GornDJG_STARTCAMP_Info()
{
	AI_Output(other,self,"DIA_GornDJG_STARTCAMP_15_00");	//Vidím, že ses přidal k drakobijcům.
	AI_Output(self,other,"DIA_GornDJG_STARTCAMP_12_01");	//Šel jsem se Sylviem do Hornického údolí, protože se tady vyznám ze všech nejlépe a chtěl jsem si udělat přesnou představu o zdejší situaci.
	AI_Output(self,other,"DIA_GornDJG_STARTCAMP_12_02");	//Jedno ti povím. Něco se tu chystá. Ješte nikdy jsem nevidel tolik skřetů na jednom míste.
	AI_Output(self,other,"DIA_GornDJG_STARTCAMP_12_03");	//Nedivil bych se, kdyby touhle dobou Garond a všichni paladinové z hradu už neutekli nebo nebyli rozsekaní na kousky.
	Info_AddChoice(DIA_GornDJG_STARTCAMP,"Uvidíme se.",DIA_GornDJG_STARTCAMP_By);
	Info_AddChoice(DIA_GornDJG_STARTCAMP,"Co chceš dělat?",DIA_GornDJG_STARTCAMP_Wohin);
};

func void DIA_GornDJG_STARTCAMP_Wohin()
{
	AI_Output(other,self,"DIA_GornDJG_STARTCAMP_Wohin_15_00");	//Co chceš dělat?
	AI_Output(self,other,"DIA_GornDJG_STARTCAMP_Wohin_12_01");	//Nejdřív půjdu tady s chlapci do Hornického údolí a pak někam vyrazím.
	AI_Output(self,other,"DIA_GornDJG_STARTCAMP_Wohin_12_02");	//Rozhodně musím zjistit, co mají skřeti za lubem.
};

func void DIA_GornDJG_STARTCAMP_By()
{
	AI_Output(other,self,"DIA_GornDJG_STARTCAMP_By_15_00");	//Uvidíme se.
	AI_Output(self,other,"DIA_GornDJG_STARTCAMP_By_12_01");	//Dávej na sebe pozor.
	AI_StopProcessInfos(self);
};


instance DIA_GornDJG_HALLO(C_Info)
{
	npc = PC_Fighter_DJG;
	condition = DIA_GornDJG_HALLO_Condition;
	information = DIA_GornDJG_HALLO_Info;
	description = "Takže tady ses zašil!";
};


func int DIA_GornDJG_HALLO_Condition()
{
	if(Npc_GetDistToWP(self,"OW_DJG_ROCKCAMP_01") < 1500)
	{
		return TRUE;
	};
};

func void DIA_GornDJG_HALLO_Info()
{
	AI_Output(other,self,"DIA_GornDJG_HALLO_15_00");	//Takže tady ses zašil!
	AI_Output(self,other,"DIA_GornDJG_HALLO_12_01");	//Není tak snadné se zabít, co?
};


instance DIA_GornDJG_WHATSUP(C_Info)
{
	npc = PC_Fighter_DJG;
	condition = DIA_GornDJG_WHATSUP_Condition;
	information = DIA_GornDJG_WHATSUP_Info;
	description = "Už jsi něco chytil?";
};


func int DIA_GornDJG_WHATSUP_Condition()
{
	if(Npc_KnowsInfo(other,DIA_GornDJG_HALLO))
	{
		return TRUE;
	};
};

func void DIA_GornDJG_WHATSUP_Info()
{
	AI_Output(other,self,"DIA_GornDJG_WHATSUP_15_00");	//Už jsi něco chytil?
	AI_Output(self,other,"DIA_GornDJG_WHATSUP_12_01");	//Pořád čekám. Řekl bych, že tam v těch skalních troskách něco je. V noci se tam svítí a jsou dokonce slyšet nejaké skřeky.
	Info_ClearChoices(DIA_GornDJG_WHATSUP);
	Info_AddChoice(DIA_GornDJG_WHATSUP,"Možná to je Lester?",DIA_GornDJG_WHATSUP_Lester);
	Info_AddChoice(DIA_GornDJG_WHATSUP,"Drak?",DIA_GornDJG_WHATSUP_A_Dragon);
	B_LogEntry(TOPIC_Dragonhunter,"Gorn sedí na plošině před kopcem ke skalní pevnosti. Odtamtud chce sledovat skřety.");
};

func void DIA_GornDJG_WHATSUP_Lester()
{
	AI_Output(other,self,"DIA_GornDJG_WHATSUP_Lester_15_00");	//Možná to je Lester, který se vrátil do svých rozvalin?
	AI_Output(self,other,"DIA_GornDJG_WHATSUP_Lester_12_01");	//To těžko. Co vím, Lester tu už nežije.
};

func void DIA_GornDJG_WHATSUP_A_Dragon()
{
	AI_Output(other,self,"DIA_GornDJG_WHATSUP_A_Dragon_15_00");	//Drak?
	AI_Output(self,other,"DIA_GornDJG_WHATSUP_A_Dragon_12_01");	//Dost možná. Ta planina je střežená jako nějaká mizerná královská pokladnice. Ale je to bohužel jediná cesta k pevnosti.
	AI_Output(self,other,"DIA_GornDJG_WHATSUP_A_Dragon_12_02");	//Jako by nestačilo, že jsou draci dost nepříjemní sami o sobě. Vypadá to, že mají v záloze ještě pár dalších příšer.
	GornDJG_WhatMonsters = TRUE;
	B_LogEntry(TOPIC_Dragonhunter,"Podle Gorna se ve staré kamenné pevnosti usadil drak.");
	Info_ClearChoices(DIA_GornDJG_WHATSUP);
};


instance DIA_GornDJG_WHATMONSTERS(C_Info)
{
	npc = PC_Fighter_DJG;
	condition = DIA_GornDJG_WHATMONSTERS_Condition;
	information = DIA_GornDJG_WHATMONSTERS_Info;
	description = "Jaké příšery to jsou?";
};


func int DIA_GornDJG_WHATMONSTERS_Condition()
{
	if(GornDJG_WhatMonsters == TRUE)
	{
		return TRUE;
	};
};

func void DIA_GornDJG_WHATMONSTERS_Info()
{
	AI_Output(other,self,"DIA_GornDJG_WHATMONSTERS_15_00");	//Jaké příšery to jsou?
	AI_Output(self,other,"DIA_GornDJG_WHATMONSTERS_12_01");	//Nevím to úplně přesně, ale chodí vzpřímeně a mají šupinatou kůži. Pohybují se po skalách jako chňapavci, kteří vycítili obeť.
	AI_Output(self,other,"DIA_GornDJG_WHATMONSTERS_12_02");	//Tady dole je slyším funět a supet. Řekl bych, že zabrali úplně celou planinu.
};


instance DIA_GornDJG_WAHTABOUTORCS(C_Info)
{
	npc = PC_Fighter_DJG;
	condition = DIA_GornDJG_WAHTABOUTORCS_Condition;
	information = DIA_GornDJG_WAHTABOUTORCS_Info;
	description = "A co skřeti?";
};


func int DIA_GornDJG_WAHTABOUTORCS_Condition()
{
	if(Npc_KnowsInfo(other,DIA_GornDJG_HALLO))
	{
		return TRUE;
	};
};

func void DIA_GornDJG_WAHTABOUTORCS_Info()
{
	AI_Output(other,self,"DIA_GornDJG_WAHTABOUTORCS_15_00");	//A co skřeti?
	AI_Output(self,other,"DIA_GornDJG_WAHTABOUTORCS_12_01");	//Chvíli jsem je sledoval. Za tou ohradou dole se musí něco ukrývat. Mám podezření, že se jich tam shromáždil už pěkný zástup.
	if(HEROKNOWFORESTBASE == TRUE)
	{
		AI_Output(other,self,"DIA_GornDJG_WAHTABOUTORCS_15_05");	//Klídek, já už tam byl a tolik jich není.
		AI_Output(self,other,"DIA_GornDJG_WAHTABOUTORCS_12_06");	//Možná jich tam tolik není teď, ale později určitě bude.
	}
	else
	{
		AI_Output(other,self,"DIA_GornDJG_WAHTABOUTORCS_15_02");	//Tím chceš říct, že jich tam je VÍC než tady?
	};
	AI_Output(self,other,"DIA_GornDJG_WAHTABOUTORCS_12_03");	//Nepřekvapilo by mě, kdyby jednoho dne tu palisádu strhli a zaplavili celou zemi. Vůbec se mi to nechce líbit.
	AI_Output(self,other,"DIA_GornDJG_WAHTABOUTORCS_12_04");	//Pokud se to stane, budu se muset vrátit a varovat Leeho. Stejně se chce z ostrova zdekovat. Pak bude nejvyšší čas.
};


instance DIA_GornDJG_HELPKILLDRACONIANS(C_Info)
{
	npc = PC_Fighter_DJG;
	condition = DIA_GornDJG_HELPKILLDRACONIANS_Condition;
	information = DIA_GornDJG_HELPKILLDRACONIANS_Info;
	description = "Můžeš mi pomoci dostat se do pevnosti?";
};


func int DIA_GornDJG_HELPKILLDRACONIANS_Condition()
{
	if(Npc_KnowsInfo(other,DIA_GornDJG_WHATMONSTERS) && Npc_KnowsInfo(other,DIA_GornDJG_WAHTABOUTORCS) && (Npc_IsDead(RockDragon) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_GornDJG_HELPKILLDRACONIANS_Info()
{
	AI_Output(other,self,"DIA_GornDJG_HELPKILLDRACONIANS_15_00");	//Můžeš mi pomoci dostat se do pevnosti?
	AI_Output(self,other,"DIA_GornDJG_HELPKILLDRACONIANS_12_01");	//To vážně nevím. Bojím se, že skřeti zaútočí přesně ve chvíli, kdy je pustím z očí.
	AI_Output(other,self,"DIA_GornDJG_HELPKILLDRACONIANS_15_02");	//To je paranoidní!
	AI_Output(self,other,"DIA_GornDJG_HELPKILLDRACONIANS_12_03");	//Nemůžu si pomoci. Víš, nikdy bych si neodpustil, kdybych přišel pozdě. Na druhou stranu...
	AI_Output(self,other,"DIA_GornDJG_HELPKILLDRACONIANS_12_04");	//Vždyť je to jedno! Proč jinak bych tady byl? Zaútočme na planinu a prosekejme si cestu do pevnosti.
	AI_Output(self,other,"DIA_GornDJG_HELPKILLDRACONIANS_12_05");	//Troška pohybu nám neuškodí. Kromě toho bych se docela rád podíval na ty bestie víc zblízka.
	AI_Output(self,other,"DIA_GornDJG_HELPKILLDRACONIANS_12_06");	//Dej mi vědet, až budeš připraven!
	B_LogEntry(TOPIC_Dragonhunter,"Gorn mi chce pomoci proniknout do kamenné pevnosti na planině.");
};


instance DIA_GornDJG_LOSGEHTS(C_Info)
{
	npc = PC_Fighter_DJG;
	condition = DIA_GornDJG_LOSGEHTS_Condition;
	information = DIA_GornDJG_LOSGEHTS_Info;
	description = "Zaútočme!";
};


func int DIA_GornDJG_LOSGEHTS_Condition()
{
	if(Npc_KnowsInfo(other,DIA_GornDJG_HELPKILLDRACONIANS))
	{
		return TRUE;
	};
};

func void DIA_GornDJG_LOSGEHTS_Info()
{
	AI_Output(other,self,"DIA_GornDJG_LOSGEHTS_15_00");	//Zaútočme!
	AI_Output(self,other,"DIA_GornDJG_LOSGEHTS_12_01");	//Jako za starých časů, co? Ale jedno ti řeknu: tohle je moje bitva. Tentokrát jdu vepředu já!
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"RunToRockRuinBridge");
};


instance DIA_GornDJG_BISHIERHIN(C_Info)
{
	npc = PC_Fighter_DJG;
	condition = DIA_GornDJG_BISHIERHIN_Condition;
	information = DIA_GornDJG_BISHIERHIN_Info;
	important = TRUE;
};


func int DIA_GornDJG_BISHIERHIN_Condition()
{
	if(Npc_GetDistToWP(self,"LOCATION_19_01") < 1000)
	{
		return TRUE;
	};
};

func void DIA_GornDJG_BISHIERHIN_Info()
{
	AI_Output(self,other,"DIA_GornDJG_BISHIERHIN_12_00");	//Byla to hračka. Tak, příteli, o zbytek se už budeš muset postarat ty. Pořádně jim zatop! Já se vrátím a budu zase dávat pozor na skřety.
	AI_Output(other,self,"DIA_GornDJG_BISHIERHIN_15_01");	//Žádný problém. Ještě se uvidíme!
	AI_Output(self,other,"DIA_GornDJG_BISHIERHIN_12_02");	//To doufám!
	B_LogEntry(TOPIC_Dragonhunter,"Gorn se vrátil zpět na své pozorovací stanoviště. Chce i nadále sledovat skřety.");
	B_GivePlayerXP(XP_GornDJGPlateauClear);
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_GornDJG_DRAGONDEAD(C_Info)
{
	npc = PC_Fighter_DJG;
	condition = DIA_GornDJG_DRAGONDEAD_Condition;
	information = DIA_GornDJG_DRAGONDEAD_Info;
	description = "Drak ze skal je mrtvý!";
};


func int DIA_GornDJG_DRAGONDEAD_Condition()
{
	if(Npc_KnowsInfo(other,DIA_GornDJG_WHATSUP) && (Npc_GetDistToWP(self,"OW_DJG_ROCKCAMP_01") < 1000) && (Npc_IsDead(RockDragon) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_GornDJG_DRAGONDEAD_Info()
{
	AI_Output(other,self,"DIA_GornDJG_DRAGONDEAD_15_00");	//Drak ze skal je mrtvý!
	AI_Output(self,other,"DIA_GornDJG_DRAGONDEAD_12_01");	//Neslyším žádné další skřeky! Byl jsi v té skalní pevnosti?
	AI_Output(other,self,"DIA_GornDJG_DRAGONDEAD_15_02");	//Ano!
	AI_Output(self,other,"DIA_GornDJG_DRAGONDEAD_12_03");	//Ha ha! To jsem si domyslel. Kdekoliv se objevíš, nezůstane kámen na kameni.
	AI_Output(other,self,"DIA_GornDJG_DRAGONDEAD_15_04");	//Co budeš dělat dál?
	AI_Output(self,other,"DIA_GornDJG_DRAGONDEAD_12_05");	//Ještě chvíli tu zůstanu a pak se vrátím k Leeovi. Možná se tam zase setkáme!
	AI_Output(self,other,"DIA_GornDJG_DRAGONDEAD_12_06");	//Celá tahle krajina mi začíná lézt na nervy. Už je na čase, abychom odsud vypadli.
	AI_Output(other,self,"DIA_GornDJG_DRAGONDEAD_15_07");	//Uvidíme se později!
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Fighter_DJG_PICKPOCKET(C_Info)
{
	npc = PC_Fighter_DJG;
	nr = 900;
	condition = DIA_Fighter_DJG_PICKPOCKET_Condition;
	information = DIA_Fighter_DJG_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Fighter_DJG_PICKPOCKET_Condition()
{
	return C_Beklauen(10,35);
};

func void DIA_Fighter_DJG_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Fighter_DJG_PICKPOCKET);
	Info_AddChoice(DIA_Fighter_DJG_PICKPOCKET,Dialog_Back,DIA_Fighter_DJG_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Fighter_DJG_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Fighter_DJG_PICKPOCKET_DoIt);
};

func void DIA_Fighter_DJG_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Fighter_DJG_PICKPOCKET);
};

func void DIA_Fighter_DJG_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Fighter_DJG_PICKPOCKET);
};

