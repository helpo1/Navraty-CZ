
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
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_Hello_01_00");	//Hmmm...(udiveně)
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_Hello_01_01");	//Co?!
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_Hello_01_02");	//Zde se příliš nesetkávám s osobami klidně si vykračujíc napříč dolem.
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_Hello_01_03");	//Zajímalo by mě jak to že tě skřeti nechají. Nebo snad pro ně pracuješ?!
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_Hello_01_04");	//Ne, jsem tady za sebe.
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_Hello_01_05");	//Tak jsi prostě blázen, všude jsou skřeti!
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_Hello_01_06");	//Nic tady není, kámo! Nic než smrt...
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_Hello_01_07");	//Mimochodem co tě sem přivádí?
};

instance DIA_STRF_8119_Addon_Rollan_Who(C_Info)
{
	npc = STRF_8119_Addon_Rollan;
	nr = 2;
	condition = DIA_STRF_8119_Addon_Rollan_Who_condition;
	information = DIA_STRF_8119_Addon_Rollan_Who_info;
	permanent = FALSE;
	description = "Hledám tady paladina.";
};

func int DIA_STRF_8119_Addon_Rollan_Who_condition()
{
	return TRUE;
};

func void DIA_STRF_8119_Addon_Rollan_Who_info()
{
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_Who_01_00");	//Hledám tady paladina.
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_Who_01_01");	//(Překvapeně) Paladina?
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_Who_01_02");	//Na vašem místě bych byl opatrný s takovými slovy!
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_Who_01_03");	//Pokud skřeti něco takového uslyší tak se zrovna zvláštní rituál konat nebude.
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_Who_01_04");	//To jsou pořádní chlápci! Jen je něco špatně a už vytahují sekyry.
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_Who_01_05");	//V nejlepším případě je to pár zlámaných žeber.
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_Who_01_06");	//No, jestli je hodně rozlobíte, tak vás pošlou na nižší úroveň dolu.
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_Who_01_07");	//A to je jistá smrt! Odtuď se nevrací...
};

instance DIA_STRF_8119_Addon_Rollan_Time(C_Info)
{
	npc = STRF_8119_Addon_Rollan;
	nr = 2;
	condition = DIA_STRF_8119_Addon_Rollan_Time_condition;
	information = DIA_STRF_8119_Addon_Rollan_Time_info;
	permanent = FALSE;
	description = "Pracoval jsi v dole?";
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
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_Time_01_00");	//Pracoval jsi v dole?
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_Time_01_01");	//To je těžké říct...(zamyšleně) Mám-li být upřímný, tak jsem se ztratil.
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_Time_01_02");	//Tady běží čas velmi odlišně, než na povrchu!
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
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_LowLevel_01_01");	//(strach) Hlavně neplač! Jestliže neděláš potíže.
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_LowLevel_01_02");	//Pokial viem, tak dolnú časť dolu skřeti uzavreli.
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_LowLevel_01_03");	//Tam se již dlouho nepracuje.
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_LowLevel_01_04");	//Ale všetkých vinníkov spúšťajú veselo dole.
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_LowLevel_01_05");	//A keď výťah vytiahnu hore, tak je prázdny.
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_LowLevel_01_06");	//Jen kaluže krve! Brrr...
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_LowLevel_01_07");	//Počúvaj, bude lepšie ak zmeníme téma...
};

instance DIA_STRF_8119_Addon_Rollan_TellMore(C_Info)
{
	npc = STRF_8119_Addon_Rollan;
	nr = 2;
	condition = DIA_STRF_8119_Addon_Rollan_TellMore_condition;
	information = DIA_STRF_8119_Addon_Rollan_TellMore_info;
	permanent = FALSE;
	description = "Možeš mi poedať viac o tomto dole?";
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
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_TellMore_01_00");	//Možeš mi poedať viac o tomto dole?
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_TellMore_01_01");	//Jasné. Ale najprv mi dones niečo na jedenie.
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_TellMore_01_02");	//Už som skoro zabudol ako chutí normálne jedlo.
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_TellMore_01_03");	//To čo tu majú skřeti nie je zrovna boh vie čo. Hlavne tie pofiderné hríby...
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_TellMore_01_04");	//A čo by si chcel?
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_TellMore_01_05");	//Nooo... Kúsok masa, syr a nejaké to víno na spláchnutie.
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_TellMore_01_06");	//To by pre začiatok mohlo stačiť.
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_TellMore_01_07");	//Dobre, skúsim ti to splašiť.
	MIS_RollanFood = LOG_Running;
	Log_CreateTopic(TOPIC_RollanFood,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RollanFood,LOG_Running);
	B_LogEntry(TOPIC_RollanFood,"Kopáč Roland chce jesť. Ak mu donesiem kus masa, syr a flašu vína, povie mi viac o tomto dole.");
};

instance DIA_STRF_8119_Addon_Rollan_RollanFood(C_Info)
{
	npc = STRF_8119_Addon_Rollan;
	nr = 2;
	condition = DIA_STRF_8119_Addon_Rollan_RollanFood_condition;
	information = DIA_STRF_8119_Addon_Rollan_RollanFood_info;
	permanent = FALSE;
	description = "Mám pre teba nejaké jedlo.";
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
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_RollanFood_01_00");	//Mám pre teba nejaké jedlo.
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_RollanFood_01_01");	//Skvelé... Všetko tak ako som chcel?
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_RollanFood_01_02");	//Jop. Tu máš kus masa, syr a víno.
	B_GiveInvItemsManyThings(other,self);
	Npc_RemoveInvItems(other,ItFoMutton,1);
	Npc_RemoveInvItems(other,ItFo_Cheese,1);
	Npc_RemoveInvItems(other,ItFo_Wine,1);
	CreateInvItems(self,ItFoMutton,1);
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_RollanFood_01_03");	//Konečne sa najem ako človek.
	B_UseItem(self,ItFoMutton);
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_RollanFood_01_04");	//Mmm... Aké chutné! Po tých hubách chutí všetko ako jedlo bohov!
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_RollanFood_01_05");	//Vďaka kámo.
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_RollanFood_01_06");	//Uži si to.
	RT_Respect = RT_Respect + 1;
	MIS_RollanFood = LOG_Success;
	Log_SetTopicStatus(TOPIC_RollanFood,LOG_Success);
	B_LogEntry(TOPIC_RollanFood,"Doniesol som Rollandovi jedlo. Bol šťastný ako malé decko.");
};

instance DIA_STRF_8119_Addon_Rollan_Perm(C_Info)
{
	npc = STRF_8119_Addon_Rollan;
	nr = 2;
	condition = DIA_STRF_8119_Addon_Rollan_Perm_condition;
	information = DIA_STRF_8119_Addon_Rollan_Perm_info;
	permanent = TRUE;
	description = "No, jak se vám daří v dole?";
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
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_Perm_01_00");	//No, jak se vám daří v dole?
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
	description = "Povedz mi viac o tomto dole.";
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
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_AboutMine_01_00");	//Povedz mi viac o tomto dole.

	if(CountMineAll == FALSE)
	{
		AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_01_01");	//A čo by si chcel vedieť?
		Info_ClearChoices(DIA_STRF_8119_Addon_Rollan_AboutMine);
		Info_AddChoice(DIA_STRF_8119_Addon_Rollan_AboutMine,Dialog_Back,DIA_STRF_8119_Addon_Rollan_AboutMine_Back);

		
		if(RolTellChief == FALSE)
		{
			Info_AddChoice(DIA_STRF_8119_Addon_Rollan_AboutMine,"Kto tu tomu velí?",DIA_STRF_8119_Addon_Rollan_AboutMine_Chief);
		};
		if(RolTellHowMany == FALSE)
		{
			Info_AddChoice(DIA_STRF_8119_Addon_Rollan_AboutMine,"Je tu vela skřetů?",DIA_STRF_8119_Addon_Rollan_AboutMine_HowMany);
		};
		if(RolTellSlaves == FALSE)
		{
			Info_AddChoice(DIA_STRF_8119_Addon_Rollan_AboutMine,"Kolko je tu kopáčov ako ty?",DIA_STRF_8119_Addon_Rollan_AboutMine_Slaves);
		};
		if((MIS_TrustMe == FALSE) && (RolTellPal == FALSE))
		{
			Info_AddChoice(DIA_STRF_8119_Addon_Rollan_AboutMine,"Tak ako s tým paladinom?",DIA_STRF_8119_Addon_Rollan_AboutMine_Paladin);
		};
		if(MIS_LowLevel == FALSE)
		{
			Info_AddChoice(DIA_STRF_8119_Addon_Rollan_AboutMine,"Čo je v dolnej časti dolu?",DIA_STRF_8119_Addon_Rollan_AboutMine_LowLev);
		};
		if(MIS_EscapeMine == FALSE)
		{
			Info_AddChoice(DIA_STRF_8119_Addon_Rollan_AboutMine,"Pokúšal si sa odtialto dostať?",DIA_STRF_8119_Addon_Rollan_AboutMine_Escape);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_01_02");	//Povedal som ti už všetko čo som vedel.
	};
};

func void DIA_STRF_8119_Addon_Rollan_AboutMine_Back()
{
	Info_ClearChoices(DIA_STRF_8119_Addon_Rollan_AboutMine);
};

func void DIA_STRF_8119_Addon_Rollan_AboutMine_Chief()
{
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_AboutMine_Chief_01_01");	//Kto tu tomu velí?
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_Chief_01_02");	//Jeden skřet menom Ar Dagar. Hotový netvor!
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_Chief_01_03");	//Ale radšej by si sa mu mal vyhýbať. Neznáša ludí.
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_AboutMine_Chief_01_04");	//Aha.
	RolTellChief = TRUE;

	if((RolTellChief == TRUE) && (RolTellPal == TRUE) && (RolTellSlaves == TRUE) && (RolTellHowMany == TRUE) && (MIS_LowLevel != FALSE) && (MIS_EscapeMine != FALSE))
	{
		CountMineAll = TRUE;
	};
};

func void DIA_STRF_8119_Addon_Rollan_AboutMine_HowMany()
{
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_AboutMine_HowMany_01_01");	//Je tu vela skřetů?
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_HowMany_01_02");	//Och chlape... (krúti hlavou) To hádam nemyslíš vážne.
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_HowMany_01_03");	//Samozrejme, nemám ich spočítaných, ale asi tak dva tucty.
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_HowMany_01_04");	//Ak nie viac.
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_AboutMine_HowMany_01_05");	//Jasné.
	RolTellHowMany = TRUE;

	if((RolTellChief == TRUE) && (RolTellPal == TRUE) && (RolTellSlaves == TRUE) && (RolTellHowMany == TRUE) && (MIS_LowLevel != FALSE) && (MIS_EscapeMine != FALSE))
	{
		CountMineAll = TRUE;
	};
};

func void DIA_STRF_8119_Addon_Rollan_AboutMine_Slaves()
{
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_AboutMine_Slaves_01_01");	//Kolko je tu kopáčov ako ty?
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_Slaves_01_02");	//Povráva sa, že nás tu bývalo hodne. Pokial sa skřeti držali na uzde samozrejme.
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_AboutMine_Slaves_01_03");	//Čo sa stalo?
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_Slaves_01_04");	//To všetko Ar Dagar! Ten bastard zaviedol také kvóty na ťaženie, že to vela ludí nezvládlo. Hajzl!
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_Slaves_01_05");	//Myslím, že teraz nás je tak okolo 50. Ale číslo sa s každým dňom znižuje.
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_AboutMine_Slaves_01_06");	//Aha.
	RolTellSlaves = TRUE;

	if((RolTellChief == TRUE) && (RolTellPal == TRUE) && (RolTellSlaves == TRUE) && (RolTellHowMany == TRUE) && (MIS_LowLevel != FALSE) && (MIS_EscapeMine != FALSE))
	{
		CountMineAll = TRUE;
	};
};

func void DIA_STRF_8119_Addon_Rollan_AboutMine_Paladin()
{
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_AboutMine_Paladin_01_01");	//Tak ako s tým paladinom?
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_Paladin_01_02");	//Poviem ti toto... Aj keby tu bol, tak by ti to nikto nepovedal.
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_AboutMine_Paladin_01_03");	//Prečo?
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_Paladin_01_04");	//Je to jednoduché. Za prvé, si tu nový a nikto ťa nepozná.
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_Paladin_01_05");	//Za druhé, očividne máš niečo spoločné so skřety inak by ťa tu len tak nepustili.
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_Paladin_01_06");	//A to vedie ku všelijakým myšlienkam.
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_Paladin_01_07");	//Takže pokým ti vacsina z nás neverí tak nemá zmysel sa tu niečo také pýtať.
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_AboutMine_Paladin_01_08");	//A ako si získam vašu doveru?
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_Paladin_01_09");	//Ako, ako... Skús sa popýtať chlapov, či nepotrebujú z niečím pomocť.
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_Paladin_01_10");	//Dokáž, že si chlap a že je na teba spolah!
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_Paladin_01_11");	//Potom to už príde samo.
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_AboutMine_Paladin_01_12");	//Viem čo myslíš.
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_Paladin_01_13");	//Tak to je super.
	RolTellPal = TRUE;
	B_LogEntry(TOPIC_LostPaladins,"Pokým som si nezískal u otrokov doveru, tak možem na paladina zabudnúť.");

	if((RolTellChief == TRUE) && (RolTellPal == TRUE) && (RolTellSlaves == TRUE) && (RolTellHowMany == TRUE) && (MIS_LowLevel != FALSE) && (MIS_EscapeMine != FALSE))
	{
		CountMineAll = TRUE;
	};
};

func void DIA_STRF_8119_Addon_Rollan_AboutMine_LowLev()
{
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_AboutMine_LowLev_01_01");	//Čo je v dolnej časti dolu?
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_LowLev_01_02");	//Nikdy som sa moc nepohol od srdca dolu, takže ti o tom moc nepoviem.
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_LowLev_01_03");	//Skús sa na to spýtať Hildura, on by o tom mal vedieť viac.
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_AboutMine_LowLev_01_04");	//A kto je Hildur?
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_LowLev_01_05");	//Náš tavič rudy. Nájdeš ho na spodu, pri sklade.
	MIS_LowLevel = LOG_Running;
	Log_CreateTopic(TOPIC_LowLevel,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LowLevel,LOG_Running);
	B_LogEntry(TOPIC_LowLevel,"Podla Rollanda je dolná časť dolu strašidelné miesto kde skřeti posielajú previnilcov. Hildur by o tom mohol vedieť viac.");

	if((RolTellChief == TRUE) && (RolTellPal == TRUE) && (RolTellSlaves == TRUE) && (RolTellHowMany == TRUE) && (MIS_LowLevel != FALSE) && (MIS_EscapeMine != FALSE))
	{
		CountMineAll = TRUE;
	};
};

func void DIA_STRF_8119_Addon_Rollan_AboutMine_Escape()
{
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_AboutMine_Escape_01_01");	//Pokúšal si sa odtialto dostať?
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_Escape_01_02");	//Robíš si prdel?
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_Escape_01_03");	//My by sme nemali ani šancu na to dostať sa von z dolu, skřeti by nás všetkých pobili.
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_Escape_01_04");	//Hlavne tí s kušami. Videl si, čo sa stane z človekom, keď ho trafí šípka z kuše?
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_AboutMine_Escape_01_05");	//Noo...
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_Escape_01_06");	//Dobre, že to nevieš...(vystrašene) Vidok by ti vedel povedať, nič pekné.
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_Escape_01_07");	//A navyše nemáme žiadne zbrane. Pokial teda nečakáš, že na ich sekery nabehneme s pasťami.
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_AboutMine_Escape_01_08");	//A nikto sa nikdy nepokúsil zorganizovať útek?
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_Escape_01_09");	//Hmm... Spomínam si, že niekto sa o niečo podobné pokúšal.
	AI_Output(self,other,"DIA_STRF_8119_Addon_Rollan_AboutMine_Escape_01_10");	//Ale to by si sa mal spýtať skor Ferda. On to všetko videl na vlastné oči.
	AI_Output(other,self,"DIA_STRF_8119_Addon_Rollan_AboutMine_Escape_01_11");	//Dobre, pokecám s ním.
	MIS_EscapeMine = LOG_Running;
	Log_CreateTopic(TOPIC_EscapeMine,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_EscapeMine,LOG_Running);
	B_LogEntry(TOPIC_EscapeMine,"Očividne otroci ani len nepomyslia na útek. Nemajú zbrane a žiadnu túžbu bojovať s elitnými skřety. Podla Rollanda Ferd by o tom mal vedieť viac.");

	if((RolTellChief == TRUE) && (RolTellPal == TRUE) && (RolTellSlaves == TRUE) && (RolTellHowMany == TRUE) && (MIS_LowLevel != FALSE) && (MIS_EscapeMine != FALSE))
	{
		CountMineAll = TRUE;
	};
};