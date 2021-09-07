
instance DIA_STRF_8119_Addon_Rollan_EXIT(C_Info)
{
	npc = STRF_8119_Addon_Rollan;
	nr = 999;
	condition = DIA_STRF_8119_Addon_Rollan_exit_condition;
	information = DIA_STRF_8119_Addon_Rollan_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_STRF_8119_Addon_Rollan_exit_condition()
{
	return TRUE;
};

func void DIA_STRF_8119_Addon_Rollan_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_STRF_8119_Addon_Rollan_HELLO(C_Info)
{
	npc = STRF_8119_Addon_Rollan;
	nr = 2;
	condition = DIA_STRF_8119_Addon_Rollan_hello_condition;
	information = DIA_STRF_8119_Addon_Rollan_hello_info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_STRF_8119_Addon_Rollan_hello_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_STRF_8119_Addon_Rollan_hello_info()
{
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_Hello_01_00");	//Hmm... (udiveně)
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_Hello_01_01");	//Co?!
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_Hello_01_02");	//Nesetkávám se často s lidmi, kteří by se jen tak procházeli napříč dolem.
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_Hello_01_03");	//Zajímalo by mě, proč tě sem skřeti vůbec pustili. Nebo snad pro ně pracuješ?!
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_Hello_01_04");	//Ne, jsem tady sám za sebe.
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_Hello_01_05");	//Tak jsi prostě blázen, jít sem dobrovolně!
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_Hello_01_06");	//Nic tady není, kámo! Nic než smrt...
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_Hello_01_07");	//Mimochodem, co tě sem přivedlo?
};

instance DIA_STRF_8119_Addon_Rollan_Who(C_Info)
{
	npc = STRF_8119_Addon_Rollan;
	nr = 2;
	condition = DIA_STRF_8119_Addon_Rollan_Who_condition;
	information = DIA_STRF_8119_Addon_Rollan_Who_info;
	permanent = FALSE;
	description = "Hledám tady jednoho paladina.";
};

func int DIA_STRF_8119_Addon_Rollan_Who_condition()
{
	return TRUE;
};

func void DIA_STRF_8119_Addon_Rollan_Who_info()
{
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_Who_01_00");	//Hledám tady jednoho paladina.
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_Who_01_01");	//(Překvapeně) Paladina?
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_Who_01_02");	//Na tvém místě bych byl s takovými slovy opatrný!
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_Who_01_03");	//Pokud skřeti něco takového uslyší, tak se zrovna zvláštní rituál konat nebude.
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_Who_01_04");	//Jsou to pořádní chlápci! Jen se něco pokazí a už vytahují sekyry.
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_Who_01_05");	//V nejlepším případě to skončí pár zlomenými žebry.
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_Who_01_06");	//Pokud je opravdu hodně rozlobíš, tak tě pošlou na nižší úroveň dolu.
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_Who_01_07");	//A to je jistá smrt! Odtamtud se nikdo nevrátil...
};

instance DIA_STRF_8119_Addon_Rollan_Time(C_Info)
{
	npc = STRF_8119_Addon_Rollan;
	nr = 2;
	condition = DIA_STRF_8119_Addon_Rollan_Time_condition;
	information = DIA_STRF_8119_Addon_Rollan_Time_info;
	permanent = FALSE;
	description = "Pracuješ v dole dlouho?";
};

func int DIA_STRF_8119_Addon_Rollan_Time_condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8119_Addon_Rollan_Who) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8119_Addon_Rollan_Time_info()
{
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_Time_01_00");	//Pracuješ v dole dlouho?
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_Time_01_01");	//Těžko říct... (škrábe se na zátylku) Mám-li být upřímný, ztratil jsem pojem o čase.
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_Time_01_02");	//Tady běží čas úplně jinak než na povrchu!
};

instance DIA_STRF_8119_Addon_Rollan_LowLevel(C_Info)
{
	npc = STRF_8119_Addon_Rollan;
	nr = 2;
	condition = DIA_STRF_8119_Addon_Rollan_LowLevel_condition;
	information = DIA_STRF_8119_Addon_Rollan_LowLevel_info;
	permanent = FALSE;
	description = "CO je ta nižší úroveň dolu?";
};

func int DIA_STRF_8119_Addon_Rollan_LowLevel_condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8119_Addon_Rollan_Who) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8119_Addon_Rollan_LowLevel_info()
{
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_LowLevel_01_00");	//CO je ta nižší úroveň dolu?
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_LowLevel_01_01");	//(strach) Takhle neřvi! Jinak naděláš potíže.
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_LowLevel_01_02");	//Jak vím, tak dolní část dolu skřeti uzavřeli.
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_LowLevel_01_03");	//Nikdo tam už dlouho nepracuje.
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_LowLevel_01_04");	//Ale každý, kdo se něčím proviní, spustí výtahem dolů.
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_LowLevel_01_05");	//Jakmile se výtah vrátí zpět, už je prázdný.
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_LowLevel_01_06");	//Pouze kaluže krve! Brrr...
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_LowLevel_01_07");	//Poslouchej, bude lepší, když změníme téma...
};

instance DIA_STRF_8119_Addon_Rollan_TellMore(C_Info)
{
	npc = STRF_8119_Addon_Rollan;
	nr = 2;
	condition = DIA_STRF_8119_Addon_Rollan_TellMore_condition;
	information = DIA_STRF_8119_Addon_Rollan_TellMore_info;
	permanent = FALSE;
	description = "Můžeš mi povědět více o tomto dole?";
};

func int DIA_STRF_8119_Addon_Rollan_TellMore_condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8119_Addon_Rollan_LowLevel) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8119_Addon_Rollan_TellMore_info()
{
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_TellMore_01_00");	//Můžeš mi povědět více o tomto dole?
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_TellMore_01_01");	//Jasně. Ale nejdřív mi dones něco k jídlu.
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_TellMore_01_02");	//Už jsem skoro zapomněl, jak chutná normální jídlo.
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_TellMore_01_03");	//To, co tu mají skřeti, není zrovna bůhvíco. Obzvláště ty podivné hřiby...
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_TellMore_01_04");	//A co bys rád?
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_TellMore_01_05");	//Noo... Kousek masa, sýr a nějaké to víno na spláchnutí.
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_TellMore_01_06");	//To by pro začátek mohlo stačit.
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_TellMore_01_07");	//Dobře, pokusím se ti to sehnat.
	MIS_RollanFood = LOG_Running;
	Log_CreateTopic(TOPIC_RollanFood,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RollanFood,LOG_Running);
	B_LogEntry(TOPIC_RollanFood,"Rolland chce něco k jídlu. Pokud mu donesu kus masa, sýr a láhev vína, řekne mi více o tomto dole.");
};

instance DIA_STRF_8119_Addon_Rollan_RollanFood(C_Info)
{
	npc = STRF_8119_Addon_Rollan;
	nr = 2;
	condition = DIA_STRF_8119_Addon_Rollan_RollanFood_condition;
	information = DIA_STRF_8119_Addon_Rollan_RollanFood_info;
	permanent = FALSE;
	description = "Mám pro tebe něco k jídlu.";
};

func int DIA_STRF_8119_Addon_Rollan_RollanFood_condition()
{
	if((MIS_RollanFood == LOG_Running) && (Npc_HasItems(other,ItFoMutton) >= 1) && (Npc_HasItems(other,ItFo_Cheese) >= 1) && (Npc_HasItems(other,ItFo_Wine) >= 1))
	{
		return TRUE;
	};
};

func void DIA_STRF_8119_Addon_Rollan_RollanFood_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_RollanFood_01_00");	//Mám pro tebe něco k jídlu.
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_RollanFood_01_01");	//Skvělé! Máš vše, co jsem chtěl?
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_RollanFood_01_02");	//Jo. Tu máš kus masa, sýr a víno.
	B_GiveInvItemsManyThings(other,self);
	Npc_RemoveInvItems(other,ItFoMutton,1);
	Npc_RemoveInvItems(other,ItFo_Cheese,1);
	Npc_RemoveInvItems(other,ItFo_Wine,1);
	CreateInvItems(self,ItFoMutton,1);
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_RollanFood_01_03");	//Konečně se najím jako člověk!
	B_UseItem(self,ItFoMutton);
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_RollanFood_01_04");	//Mmm... Jak dobré! Po těch houbách chutná vše jako jídlo od samotných bohů!
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_RollanFood_01_05");	//Díky, kámo.
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_RollanFood_01_06");	//Užij si to.
	RT_Respect = RT_Respect + 1;
	MIS_RollanFood = LOG_Success;
	Log_SetTopicStatus(TOPIC_RollanFood,LOG_Success);
	B_LogEntry(TOPIC_RollanFood,"Donesl jsem Rollandovi jídlo. Byl šťastný jako malé dítě.");
};

instance DIA_STRF_8119_Addon_Rollan_Perm(C_Info)
{
	npc = STRF_8119_Addon_Rollan;
	nr = 2;
	condition = DIA_STRF_8119_Addon_Rollan_Perm_condition;
	information = DIA_STRF_8119_Addon_Rollan_Perm_info;
	permanent = TRUE;
	description = "Jak se ti v dole daří?";
};

func int DIA_STRF_8119_Addon_Rollan_Perm_condition()
{
	if(MIS_RollanFood == LOG_Success)
	{
		return TRUE;
	};
};

func void DIA_STRF_8119_Addon_Rollan_Perm_info()
{
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_Perm_01_00");	//Jak se ti v dole daří?
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_Perm_01_01");	//Stále beze změn.
};

var int CountMineAll;
var int RolTellChief;
var int RolTellHowMany;
var int RolTellSlaves;
var int RolTellPal;

instance DIA_STRF_8119_Addon_Rollan_AboutMine(C_Info)
{
	npc = STRF_8119_Addon_Rollan;
	nr = 2;
	condition = DIA_STRF_8119_Addon_Rollan_AboutMine_condition;
	information = DIA_STRF_8119_Addon_Rollan_AboutMine_info;
	permanent = TRUE;
	description = "Pověz mi více o tomto dole.";
};

func int DIA_STRF_8119_Addon_Rollan_AboutMine_condition()
{
	if(MIS_RollanFood == LOG_Success)
	{
		return TRUE;
	};
};

func void DIA_STRF_8119_Addon_Rollan_AboutMine_info()
{
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_AboutMine_01_00");	//Pověz mi více o tomto dole.

	if(CountMineAll == FALSE)
	{
		AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_01_01");	//Co bys chtěl vědět?
		Info_ClearChoices(DIA_STRF_8119_Addon_Rollan_AboutMine);
		Info_AddChoice(DIA_STRF_8119_Addon_Rollan_AboutMine,Dialog_Back,DIA_STRF_8119_Addon_Rollan_AboutMine_Back);

		
		if(RolTellChief == FALSE)
		{
			Info_AddChoice(DIA_STRF_8119_Addon_Rollan_AboutMine,"Kdo tomu tady velí?",DIA_STRF_8119_Addon_Rollan_AboutMine_Chief);
		};
		if(RolTellHowMany == FALSE)
		{
			Info_AddChoice(DIA_STRF_8119_Addon_Rollan_AboutMine,"Kolik je tu skřetů?",DIA_STRF_8119_Addon_Rollan_AboutMine_HowMany);
		};
		if(RolTellSlaves == FALSE)
		{
			Info_AddChoice(DIA_STRF_8119_Addon_Rollan_AboutMine,"Kolik je tu otroků, jako ty?",DIA_STRF_8119_Addon_Rollan_AboutMine_Slaves);
		};
		if((MIS_TrustMe == FALSE) && (RolTellPal == FALSE))
		{
			Info_AddChoice(DIA_STRF_8119_Addon_Rollan_AboutMine,"Nevíš něco o tom paladinovi?",DIA_STRF_8119_Addon_Rollan_AboutMine_Paladin);
		};
		if(MIS_LowLevel == FALSE)
		{
			Info_AddChoice(DIA_STRF_8119_Addon_Rollan_AboutMine,"Co je v té dolní časti dolu?",DIA_STRF_8119_Addon_Rollan_AboutMine_LowLev);
		};
		if(MIS_EscapeMine == FALSE)
		{
			Info_AddChoice(DIA_STRF_8119_Addon_Rollan_AboutMine,"Zkoušel jsi se odtud dostat?",DIA_STRF_8119_Addon_Rollan_AboutMine_Escape);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_01_02");	//Řekl jsem ti už vše, co vím.
	};
};

func void DIA_STRF_8119_Addon_Rollan_AboutMine_Back()
{
	Info_ClearChoices(DIA_STRF_8119_Addon_Rollan_AboutMine);
};

func void DIA_STRF_8119_Addon_Rollan_AboutMine_Chief()
{
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_AboutMine_Chief_01_01");	//Kdo tomu tady velí?
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_Chief_01_02");	//Jeden skřet jménem Ar Dagar. Úplný netvor!
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_Chief_01_03");	//Ale radši bys se mu měl vyhýbat. Nesnáší lidi.
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_AboutMine_Chief_01_04");	//Aha.
	RolTellChief = TRUE;

	if((RolTellChief == TRUE) && (RolTellPal == TRUE) && (RolTellSlaves == TRUE) && (RolTellHowMany == TRUE) && (MIS_LowLevel != FALSE) && (MIS_EscapeMine != FALSE))
	{
		CountMineAll = TRUE;
	};
};

func void DIA_STRF_8119_Addon_Rollan_AboutMine_HowMany()
{
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_AboutMine_HowMany_01_01");	//Kolik je tu skřetů?
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_HowMany_01_02");	//Kámo... (kroutí hlavou) To snad nemyslíš vážně.
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_HowMany_01_03");	//Samozřejmě jsem je nepočítal, ale věřím, že nejméně dva tucty.
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_HowMany_01_04");	//Pokud ne více...
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_AboutMine_HowMany_01_05");	//Jasně.
	RolTellHowMany = TRUE;

	if((RolTellChief == TRUE) && (RolTellPal == TRUE) && (RolTellSlaves == TRUE) && (RolTellHowMany == TRUE) && (MIS_LowLevel != FALSE) && (MIS_EscapeMine != FALSE))
	{
		CountMineAll = TRUE;
	};
};

func void DIA_STRF_8119_Addon_Rollan_AboutMine_Slaves()
{
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_AboutMine_Slaves_01_01");	//Kolik je tu otroků, jako ty?
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_Slaves_01_02");	//Říká se, že jich tu bývalo hodně, dokud se skřeti drželi na uzdě.
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_AboutMine_Slaves_01_03");	//Co se stalo?
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_Slaves_01_04");	//To všechno Ar Dagar! Ten bastard zavedl tak šílené kvóty na těžbu, že to spousta otroků nezvládla.
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_Slaves_01_05");	//Myslím, že nás více než padesát nebude. Bohužel se číslo každým dnem snižuje.
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_AboutMine_Slaves_01_06");	//Chápu.
	RolTellSlaves = TRUE;

	if((RolTellChief == TRUE) && (RolTellPal == TRUE) && (RolTellSlaves == TRUE) && (RolTellHowMany == TRUE) && (MIS_LowLevel != FALSE) && (MIS_EscapeMine != FALSE))
	{
		CountMineAll = TRUE;
	};
};

func void DIA_STRF_8119_Addon_Rollan_AboutMine_Paladin()
{
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_AboutMine_Paladin_01_01");	//Nevíš něco o tom paladinovi?
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_Paladin_01_02");	//Řeknu ti toto... I kdyby tady pořád byl, nikdo ti o něm nic neřekne.
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_AboutMine_Paladin_01_03");	//Proč?
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_Paladin_01_04");	//Jednoduše. Za prvé, jsi tu nový a nikdo tě nezná.
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_Paladin_01_05");	//Za druhé, očividně máš něco společného se skřety, jinak by tě tu jen tak nepustili.
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_Paladin_01_06");	//A to vede ke všelijakým myšlenkám.
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_Paladin_01_07");	//Takže dokud ti většina z nás nevěří, nemá smysl se na něco takového ptát.
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_AboutMine_Paladin_01_08");	//Jak si získám vaši důvěru?
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_Paladin_01_09");	//Jak, jak... Zeptej se kluků kolem, jestli nepotřebují s něčím pomoct.
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_Paladin_01_10");	//Dokáž, na čí straně jsi a že je na tebe spoleh!
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_Paladin_01_11");	//Pak už to půjde samo.
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_AboutMine_Paladin_01_12");	//Ano, vím, co tím myslíš.
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_Paladin_01_13");	//To je dobře, teď už se o tom bavit nebudem.
	RolTellPal = TRUE;
	B_LogEntry(TOPIC_LostPaladins,"Dokud si nezískám u otroků důvěru, tak můžu na paladina rovnou zapomenout.");

	if((RolTellChief == TRUE) && (RolTellPal == TRUE) && (RolTellSlaves == TRUE) && (RolTellHowMany == TRUE) && (MIS_LowLevel != FALSE) && (MIS_EscapeMine != FALSE))
	{
		CountMineAll = TRUE;
	};
};

func void DIA_STRF_8119_Addon_Rollan_AboutMine_LowLev()
{
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_AboutMine_LowLev_01_01");	//Co je v té dolní části dolu?
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_LowLev_01_02");	//Moc ti o tom nepovím, vlastně skoro vůbec neopouštím svou žílu.
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_LowLev_01_03");	//Zkus se zeptat Hildura, on by měl vědět víc.
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_AboutMine_LowLev_01_04");	//Kdo je Hildur?
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_LowLev_01_05");	//Náš tavič rudy. Najdeš ho v přízemí, kousek od skladiště.
	MIS_LowLevel = LOG_Running;
	Log_CreateTopic(TOPIC_LowLevel,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LowLevel,LOG_Running);
	B_LogEntry(TOPIC_LowLevel,"Podle Rollanda je dolní část dolu strašidelné místo, kde skřeti posílají provinilce. Hildur by mi o tom mohl říct víc.");

	if((RolTellChief == TRUE) && (RolTellPal == TRUE) && (RolTellSlaves == TRUE) && (RolTellHowMany == TRUE) && (MIS_LowLevel != FALSE) && (MIS_EscapeMine != FALSE))
	{
		CountMineAll = TRUE;
	};
};

func void DIA_STRF_8119_Addon_Rollan_AboutMine_Escape()
{
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_AboutMine_Escape_01_01");	//Zkoušel jsi se odtud dostat?
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_Escape_01_02");	//Děláš si ze mě srandu?
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_Escape_01_03");	//Neměli bychom ani šanci dostat se ven z dolu, skřeti by nás všechny pozabíjeli.
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_Escape_01_04");	//Obzvláště ti s kušemi. Viděl jsi někdy co se stane s člověkem, kterého střelí šipka ze skřetí kuše?
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_AboutMine_Escape_01_05");	//Noo...
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_Escape_01_06");	//Buď rád... (vystrašeně) Pohled na takovou ránu, upřímně řečeno, není vůbec příjemný!
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_Escape_01_07");	//Navíc, nemáme žádné zbraně. Pokud teda nečekáš, že na jejich sekery naběhneme s pěstmi.
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_AboutMine_Escape_01_08");	//Už se někdo pokusil o útěk?
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_Escape_01_09");	//Hmm... (zamyšleně) Vzpomínám si, že někdo se už o útěk pokoušel.
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_Escape_01_10");	//Ale to by jsi se měl zeptat spíše Ferda. On to tehdá viděl na vlastní oči.
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_AboutMine_Escape_01_11");	//Dobře, promluvím si s ním.
	MIS_EscapeMine = LOG_Running;
	Log_CreateTopic(TOPIC_EscapeMine,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_EscapeMine,LOG_Running);
	B_LogEntry(TOPIC_EscapeMine,"Očividně otroci ani nepomyšlejí nad útěkem. Nemají zbraně ani žádnou touhu bojovat s elitními skřety. Podle Rollanda by Ferd mohl vědět více o původním pokusu o útěk.");

	if((RolTellChief == TRUE) && (RolTellPal == TRUE) && (RolTellSlaves == TRUE) && (RolTellHowMany == TRUE) && (MIS_LowLevel != FALSE) && (MIS_EscapeMine != FALSE))
	{
		CountMineAll = TRUE;
	};
};
