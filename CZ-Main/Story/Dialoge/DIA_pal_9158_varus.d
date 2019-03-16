
instance DIA_PAL_9158_VARUS_EXIT(C_Info)
{
	npc = pal_9158_varus;
	nr = 999;
	condition = dia_pal_9158_varus_exit_condition;
	information = dia_pal_9158_varus_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_9158_varus_exit_condition()
{
	return TRUE;
};

func void dia_pal_9158_varus_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_9158_VARUS_HALLO(C_Info)
{
	npc = pal_9158_varus;
	nr = 1;
	condition = dia_pal_9158_varus_hallo_condition;
	information = dia_pal_9158_varus_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_pal_9158_varus_hallo_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_pal_9158_varus_hallo_info()
{
	B_GivePlayerXP(100);
	if((other.guild == GIL_PAL) || (other.guild == GIL_MIL))
	{
		AI_Output(self,other,"DIA_Pal_9158_Varus_HALLO_01_00");	//Hej, chlape! Ty nejsi z mé skupiny!
	}
	else if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Pal_9158_Varus_HALLO_01_02");	//Vítám tě, mágu Ohně!
		AI_Output(self,other,"DIA_Pal_9158_Varus_HALLO_01_03");	//Co nám nese služebník Innose?
	}
	else if(other.guild == GIL_KDW)
	{
		AI_Output(self,other,"DIA_Pal_9158_Varus_HALLO_01_04");	//Vítám tě, mágu Vody!
		AI_Output(self,other,"DIA_Pal_9158_Varus_HALLO_01_05");	//Co nám nese služebník Adana?
	}
	else if(other.guild == GIL_KDM)
	{
		AI_Output(self,other,"DIA_Pal_9158_Varus_HALLO_01_06");	//Nevěřím svým očím! Nekromant v paladinské pevnosti!
		AI_Output(self,other,"DIA_Pal_9158_Varus_HALLO_01_07");	//Kdo tě sem poslal? Co tu chceš?
	}
	else if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Pal_9158_Varus_HALLO_01_08");	//Co to je?! Žoldák je v pevnosti paladinů?
		AI_Output(self,other,"DIA_Pal_9158_Varus_HALLO_01_09");	//Co tu pohledáváš?
	}
	else
	{
		AI_Output(self,other,"DIA_Pal_9158_Varus_HALLO_01_10");	//Hej, kdo jsi?
		AI_Output(self,other,"DIA_Pal_9158_Varus_HALLO_01_11");	//Co tu chceš?
	};

	VarusMeet = TRUE;
};


instance DIA_PAL_9158_VARUS_FORT(C_Info)
{
	npc = pal_9158_varus;
	nr = 1;
	condition = dia_pal_9158_varus_fort_condition;
	information = dia_pal_9158_varus_fort_info;
	permanent = FALSE;
	description = "Toto je paladinská pevnost?";
};


func int dia_pal_9158_varus_fort_condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_9158_varus_hallo))
	{
		return TRUE;
	};
};

func void dia_pal_9158_varus_fort_info()
{
	AI_Output(other,self,"DIA_Pal_9158_Varus_Fort_01_01");	//Toto je paladinská pevnost?
	AI_Output(self,other,"DIA_Pal_9158_Varus_Fort_01_02");	//Co jiného to podle tebe je?
	AI_Output(other,self,"DIA_Pal_9158_Varus_Fort_01_03");	//Jen se ujišťuji.
	AI_Output(self,other,"DIA_Pal_9158_Varus_Fort_01_04");	//Jak drzé, klást mi tyto otázky...
	AI_Output(self,other,"DIA_Pal_9158_Varus_Fort_01_07");	//A nebo řekni, co zde hledáš.
};


instance DIA_PAL_9158_VARUS_MATTER(C_Info)
{
	npc = pal_9158_varus;
	nr = 1;
	condition = dia_pal_9158_varus_matter_condition;
	information = dia_pal_9158_varus_matter_info;
	permanent = FALSE;
	description = "Jsem zde z rozkazu lorda Hagena.";
};


func int dia_pal_9158_varus_matter_condition()
{
	if((MIS_PALADINFOOD == LOG_Running) && (HAGENSENTTOVARUS == TRUE))
	{
		return TRUE;
	};
};

func void dia_pal_9158_varus_matter_info()
{
	AI_Output(other,self,"DIA_Pal_9158_Varus_Matter_01_00");	//Jsem zde z rozkazu lorda Hagena.
	AI_Output(self,other,"DIA_Pal_9158_Varus_Matter_01_01");	//Velmi zajímavé...
	AI_Output(self,other,"DIA_Pal_9158_Varus_Matter_01_02");	//A co nám chce?
	AI_Output(other,self,"DIA_Pal_9158_Varus_Matter_01_03");	//Mám sprostředkovat dodávku zásob pro pevnost.
	AI_Output(other,self,"DIA_Pal_9158_Varus_Matter_01_04");	//Chce, abys sestavil seznam.
	AI_Output(self,other,"DIA_Pal_9158_Varus_Matter_01_06");	//Konečně! Už jsem myslel, že na nás zapomněl.
	AI_Output(self,other,"DIA_Pal_9158_Varus_Matter_01_07");	//Dokonce jsem už sám chtěl někoho poslat.
	AI_Output(other,self,"DIA_Pal_9158_Varus_Matter_01_08");	//A co s tím seznamem?
	AI_Output(self,other,"DIA_Pal_9158_Varus_Matter_01_09");	//Neměj obavy, už začínám psát.
	AI_Output(self,other,"DIA_Pal_9158_Varus_Matter_01_10");	//Zabere to celkem dost času...
	AI_Output(self,other,"DIA_Pal_9158_Varus_Matter_01_14");	//Za pár dní.
	AI_Output(self,other,"DIA_Pal_9158_Varus_Matter_01_15");	//Zatím se můžeš projít po pevnosti, případně něco udělat pro mé chlapy...
	AI_Output(other,self,"DIA_Pal_9158_Varus_Matter_01_16");	//Dobrá, uvidím jak to půjde.
	VARUSTIMER = Wld_GetDay();
	B_LogEntry(TOPIC_PALADINFOOD,"Lord Varus mi vydá seznam se zásobami pro jeho lidi. Prvně ho však musí sestavit. To mu zabere pár dní, takže zatím se můžu podívat po pevnosti...");
};


instance DIA_PAL_9158_VARUS_MATTERDONE(C_Info)
{
	npc = pal_9158_varus;
	nr = 1;
	condition = dia_pal_9158_varus_matterdone_condition;
	information = dia_pal_9158_varus_matterdone_info;
	permanent = TRUE;
	description = "Ohledně seznamu...";
};


func int dia_pal_9158_varus_matterdone_condition()
{
	if((MIS_PALADINFOOD == LOG_Running) && Npc_KnowsInfo(hero,dia_pal_9158_varus_matter) && (VARUSSENTTOHAGEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_pal_9158_varus_matterdone_info()
{
	var int daynow;
	daynow = Wld_GetDay();
	AI_Output(other,self,"DIA_Pal_9158_Varus_MatterDone_01_00");	//Ohledně seznamu...
	if(VARUSTIMER <= (daynow - 2))
	{
		B_GivePlayerXP(250);
		VARUSSENTTOHAGEN = TRUE;
		AI_Output(self,other,"DIA_Pal_9158_Varus_MatterDone_01_01");	//Ano, už ho mám.
		AI_Output(self,other,"DIA_Pal_9158_Varus_MatterDone_01_02");	//Zanes ho lordu Hagenovi.
		B_GiveInvItems(self,other,itwr_varuscontent,1);
		AI_Output(other,self,"DIA_Pal_9158_Varus_MatterDone_01_03");	//Úžasné!
		B_LogEntry(TOPIC_PALADINFOOD,"Lord Varus mi vydal seznam se zásobami. Teď ho musím zanést lordu Hagenovi.");
	}
	else
	{
		AI_Output(self,other,"DIA_Pal_9158_Varus_MatterDone_01_04");	//Říkal jsem, že to bude pár dní trvat.
		AI_Output(self,other,"DIA_Pal_9158_Varus_MatterDone_01_05");	//Přijď později.
		AI_Output(other,self,"DIA_Pal_9158_Varus_MatterDone_01_06");	//Dobře.
	};
};


instance DIA_PAL_9158_VARUS_PALCOUNT(C_Info)
{
	npc = pal_9158_varus;
	nr = 1;
	condition = dia_pal_9158_varus_palcount_condition;
	information = dia_pal_9158_varus_palcount_info;
	permanent = FALSE;
	description = "Kolik je v pevnosti paladinů?";
};


func int dia_pal_9158_varus_palcount_condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_9158_varus_fort))
	{
		return TRUE;
	};
};

func void dia_pal_9158_varus_palcount_info()
{
	AI_Output(other,self,"DIA_Pal_9158_Varus_PalCount_01_01");	//Kolik je v pevnosti paladinů?
	AI_Output(self,other,"DIA_Pal_9158_Varus_PalCount_01_02");	//Má skupina čítá asi 50 válečníků - proč se ptáš?
	AI_Output(other,self,"DIA_Pal_9158_Varus_PalCount_01_03");	//Zdá se mi, že 50 válečníků by skřety moc nezdrželo, kdyby napadli Khorinis.
	AI_Output(self,other,"DIA_Pal_9158_Varus_PalCount_01_04");	//Pche! Jsou to ti nejlepší válečníci v království!
	AI_Output(self,other,"DIA_Pal_9158_Varus_PalCount_01_05");	//Každý z nich je schopen během okamžiku zabít dva skřety! Někteří i tři!
	AI_Output(self,other,"DIA_Pal_9158_Varus_PalCount_01_06");	//A to doopravdy nejsou planá slova.
	AI_Output(other,self,"DIA_Pal_9158_Varus_PalCount_01_07");	//A co elitní skřeti?
	AI_Output(self,other,"DIA_Pal_9158_Varus_PalCount_01_08");	//Hmmm... To ano, ti jsou vážnými protivníky...
	AI_Output(self,other,"DIA_Pal_9158_Varus_PalCount_01_09");	//Nicméně jejich jedinou výhodou před námi je jejich počet.
	AI_Output(self,other,"DIA_Pal_9158_Varus_PalCount_01_10");	//Početnost nezajistí vítězství.
	AI_Output(self,other,"DIA_Pal_9158_Varus_PalCount_01_11");	//V taktice a strategii skřeti nemůžou předčít naše stratégi!
	AI_Output(self,other,"DIA_Pal_9158_Varus_PalCount_01_12");	//Věř, že jsem prošel mnoha bitvami a vím, jak oni bojují.
	AI_Output(self,other,"DIA_Pal_9158_Varus_PalCount_01_13");	//S nimi nebude zase takový problém.
	AI_Output(other,self,"DIA_Pal_9158_Varus_PalCount_01_14");	//Nebyl bych si tak jistý...
};


instance DIA_PAL_9158_VARUS_PALMORALE(C_Info)
{
	npc = pal_9158_varus;
	nr = 1;
	condition = dia_pal_9158_varus_palmorale_condition;
	information = dia_pal_9158_varus_palmorale_info;
	permanent = FALSE;
	description = "Jaká je morálka tvých lidí?";
};


func int dia_pal_9158_varus_palmorale_condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_9158_varus_fort))
	{
		return TRUE;
	};
};

func void dia_pal_9158_varus_palmorale_info()
{
	AI_Output(other,self,"DIA_Pal_9158_Varus_PalMorale_01_01");	//Jaká je morálka tvých lidí?
	AI_Output(self,other,"DIA_Pal_9158_Varus_PalMorale_01_02");	//Neměj obavy, je s nimi vše v pořádku.
	AI_Output(self,other,"DIA_Pal_9158_Varus_PalMorale_01_03");	//Každý z nich je připraven zemřít v první bitvě, jestli to bude nutnost.
	AI_Output(self,other,"DIA_Pal_9158_Varus_PalMorale_01_04");	//Dívali se smrti rovně do očí! To mi věř!
	AI_Output(other,self,"DIA_Pal_9158_Varus_PalMorale_01_05");	//Nepochybuji o jejich činech - jen o jejich duchu.
	AI_Output(self,other,"DIA_Pal_9158_Varus_PalMorale_01_06");	//Nesmysl!... Paladin si zachovává silného ducha a chladnou hlavu v každé situaci!
	AI_Output(self,other,"DIA_Pal_9158_Varus_PalMorale_01_07");	//Požehnání Innose není jen nějaká prázdná fráze!
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Pal_9158_Varus_PalMorale_01_08");	//Jsi paladin! Tohle bys měl vědět!
	}
	else if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Pal_9158_Varus_PalMorale_01_09");	//Nebo snad ne, vážený mágu Ohně? (zlomyslně)
		AI_Output(other,self,"DIA_Pal_9158_Varus_PalMorale_01_10");	//Samozřejmě.
	}
	else
	{
		AI_Output(self,other,"DIA_Pal_9158_Varus_PalMorale_01_11");	//Ale ty nejsi paladin - tomu ty nemůžeš rozumět.
	};
};


instance DIA_PAL_9158_VARUS_PALTIMEFORT(C_Info)
{
	npc = pal_9158_varus;
	nr = 2;
	condition = dia_pal_9158_varus_paltimefort_condition;
	information = dia_pal_9158_varus_paltimefort_info;
	permanent = FALSE;
	description = "Jak dlouho budeš v pevnosti?";
};


func int dia_pal_9158_varus_paltimefort_condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_9158_varus_fort))
	{
		return TRUE;
	};
};

func void dia_pal_9158_varus_paltimefort_info()
{
	AI_Output(other,self,"DIA_Pal_9158_Varus_PalTimeFort_01_01");	//Jak dlouho budeš v pevnosti?
	AI_Output(self,other,"DIA_Pal_9158_Varus_PalTimeFort_01_02");	//Budeme zde tak dlouho, jak po nás bude žádáno.
	AI_Output(self,other,"DIA_Pal_9158_Varus_PalTimeFort_01_03");	//Nezáleží to na mně, ale na lordu Hagenovi.
	AI_Output(other,self,"DIA_Pal_9158_Varus_PalTimeFort_01_04");	//A co si myslíš ty?
	AI_Output(self,other,"DIA_Pal_9158_Varus_PalTimeFort_01_05");	//Hmm... Zdá se mi to tu jako vynikající strategický bod, kdyby skřeti napadli město.
	AI_Output(self,other,"DIA_Pal_9158_Varus_PalTimeFort_01_06");	//Je tu jen jediná cesta a ta se dobře brání.
};


instance DIA_PAL_9158_VARUS_PALNEWS(C_Info)
{
	npc = pal_9158_varus;
	nr = 3;
	condition = dia_pal_9158_varus_palnews_condition;
	information = dia_pal_9158_varus_palnews_info;
	permanent = TRUE;
	description = "Nějaké novinky?";
};


func int dia_pal_9158_varus_palnews_condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_9158_varus_paltimefort))
	{
		return TRUE;
	};
};

func void dia_pal_9158_varus_palnews_info()
{
	AI_Output(other,self,"DIA_Pal_9158_Varus_PalNews_01_01");	//Nějaké novinky?
	AI_Output(self,other,"DIA_Pal_9158_Varus_PalNews_01_02");	//Nic co bys musel vědět.
};


instance DIA_PAL_9158_VARUS_HUNT(C_Info)
{
	npc = pal_9158_varus;
	nr = 3;
	condition = dia_pal_9158_varus_hunt_condition;
	information = dia_pal_9158_varus_hunt_info;
	permanent = FALSE;
	description = "Mám malý problém...";
};


func int dia_pal_9158_varus_hunt_condition()
{
	if((MIS_ORTOHUNT == LOG_Running) && (VARUSAGREEDHUNT == FALSE))
	{
		return TRUE;
	};
};

func void dia_pal_9158_varus_hunt_info()
{
	AI_Output(other,self,"DIA_Pal_9158_Varus_Hunt_01_01");	//Mám malý problém...
	AI_Output(self,other,"DIA_Pal_9158_Varus_Hunt_01_02");	//Co zase?!...
	AI_Output(other,self,"DIA_Pal_9158_Varus_Hunt_01_03");	//Pár paladinů by chtělo jít lovit na zbytek ostrova.
	AI_Output(self,other,"DIA_Pal_9158_Varus_Hunt_01_04");	//Kvůli čemu?
	AI_Output(other,self,"DIA_Pal_9158_Varus_Hunt_01_05");	//Jednoduše nemají co dělat a nudí se.
	AI_Output(self,other,"DIA_Pal_9158_Varus_Hunt_01_06");	//Hmm... (zamyšleně) nemyslím, že jim to bude něco platné.
	AI_Output(other,self,"DIA_Pal_9158_Varus_Hunt_01_07");	//Věř mi, jsou sžíráni nicneděláním.
	AI_Output(other,self,"DIA_Pal_9158_Varus_Hunt_01_08");	//Měl bys vědět, že klidný život není pro paladiny!
	AI_Output(self,other,"DIA_Pal_9158_Varus_Hunt_01_09");	//Hmm... (zamyšleně) No, vypadá to, že máš pravdu.
	AI_Output(other,self,"DIA_Pal_9158_Varus_Hunt_01_10");	//Takže je pustíš?
	AI_Output(self,other,"DIA_Pal_9158_Varus_Hunt_01_11");	//No...
	AI_Output(self,other,"DIA_Pal_9158_Varus_Hunt_01_12");	//Dobrá! Nakonec, není zde žádné nebezpečí ani povinnosti a o pár kluků méně nevadí...
	AI_Output(self,other,"DIA_Pal_9158_Varus_Hunt_01_13");	//Schvaluji jejich nápad!
	B_LogEntry(TOPIC_ORTOHUNT,"Lord Varus svolil, aby paladinové mohli na lov.");
	VARUSAGREEDHUNT = TRUE;
};


instance DIA_PAL_9158_VARUS_HELPRAYNE(C_Info)
{
	npc = pal_9158_varus;
	nr = 3;
	condition = dia_pal_9158_varus_helprayne_condition;
	information = dia_pal_9158_varus_helprayne_info;
	permanent = FALSE;
	description = "Paladin Rayne potřebuje pomoc.";
};

func int dia_pal_9158_varus_helprayne_condition()
{
	if((MIS_RAYNEHELP == LOG_Running) && (MAYTALKVARUSRAYNE == TRUE))
	{
		return TRUE;
	};
};

func void dia_pal_9158_varus_helprayne_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Pal_9158_Varus_HelpRayne_01_00");	//Paladin Rayne potřebuje pomoc.
	AI_Output(self,other,"DIA_Pal_9158_Varus_HelpRayne_01_01");	//S čím?!... Jakou pomoc?!
	AI_Output(other,self,"DIA_Pal_9158_Varus_HelpRayne_01_02");	//Prostě sám nestačí na práci ve skladišti.
	AI_Output(other,self,"DIA_Pal_9158_Varus_HelpRayne_01_03");	//Můžeš mu někoho poslat?
	AI_Output(self,other,"DIA_Pal_9158_Varus_HelpRayne_01_04");	//Pro tuto práci tu nikoho nemám.
	AI_Output(self,other,"DIA_Pal_9158_Varus_HelpRayne_01_05");	//Nemůžu nikoho jiného nechat u našich zásob.
	AI_Output(other,self,"DIA_Pal_9158_Varus_HelpRayne_01_06");	//Když to říkáš.
	AI_Output(other,self,"DIA_Pal_9158_Varus_HelpRayne_01_07");	//Jednoduše nestíhá hlídat potraviny ve skladu a něco by mohlo zmizet...
	AI_Output(self,other,"DIA_Pal_9158_Varus_HelpRayne_01_12");	//Hmm... Tak dobře, tak dobře!
	AI_Output(self,other,"DIA_Pal_9158_Varus_HelpRayne_01_13");	//Někoho mu přidělím...
	AI_Output(self,other,"DIA_Pal_9158_Varus_HelpRayne_01_15");	//To bys měl...
	B_LogEntry(TOPIC_RAYNEHELP,"Lord Varus souhlasil, že někoho přidělí na pomoc ve skladišti. Rayne by mohl být spokojený.");
	FINDHELPERRAYNE = TRUE;
};

instance DIA_Pal_9158_Varus_MissKey(C_Info)
{
	npc = pal_9158_varus;
	nr = 4;
	condition = DIA_Pal_9158_Varus_MissKey_condition;
	information = DIA_Pal_9158_Varus_MissKey_info;
	permanent = FALSE;
	description = "U tebe je klíč od skladu?";
};

func int DIA_Pal_9158_Varus_MissKey_condition()
{
	if((KNOWSVARUSKEY == TRUE) && (FingersIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Pal_9158_Varus_MissKey_info()
{
	AI_Output(other,self,"DIA_Pal_9158_Varus_MissKey_01_00");	//U tebe je klíč od skladu?
	AI_Output(self,other,"DIA_Pal_9158_Varus_MissKey_01_01");	//(nespokojeně) Ještě nedávno u mě byl!
	AI_Output(self,other,"DIA_Pal_9158_Varus_MissKey_01_02");	//Ale teď u mě není a to je velký problém.
	AI_Output(other,self,"DIA_Pal_9158_Varus_MissKey_01_03");	//Ty jsi ho ztratil?
	AI_Output(self,other,"DIA_Pal_9158_Varus_MissKey_01_04");	//Ztratil, nebo ho ukradli, jaký je v tom rozdíl? Hlavní je, že už ho nemám.
	AI_Output(self,other,"DIA_Pal_9158_Varus_MissKey_01_05");	//A kvůli tomu se nemůžeme dostat do skladu.
	AI_Output(other,self,"DIA_Pal_9158_Varus_MissKey_01_06");	//Tak udělejte nový klíč!
	AI_Output(self,other,"DIA_Pal_9158_Varus_MissKey_01_07");	//To není tak jednoduché. (mrzutě) Zámek od dveří je hodně složitý.
	AI_Output(self,other,"DIA_Pal_9158_Varus_MissKey_01_08");	//A rozbít dveře jen tak nemůžeme.
	AI_Output(other,self,"DIA_Pal_9158_Varus_MissKey_01_09");	//A čirou náhodou, nemáte někoho, kdo se vyzná v páčení zámků? 
	AI_Output(self,other,"DIA_Pal_9158_Varus_MissKey_01_10");	//Jak jsi bystrý...(hrozivě) My jsme paladinové! A ne zloději.
	AI_Output(self,other,"DIA_Pal_9158_Varus_MissKey_01_11");	//A bez mistra zámků se zřejmě neobejdeme.
	MIS_FingersOpenDoor = LOG_Running;
	Log_CreateTopic(Topic_FingersOpenDoor,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FingersOpenDoor,LOG_Running);
	B_LogEntry(TOPIC_FingersOpenDoor,"Lord Varus ztratil klíč od skladu v pevnosti paladinů. Abych mohl otevřít dveře, potřebuju najít pravého mistra páčení!");
};

instance DIA_Pal_9158_Varus_MissKey_Ok(C_Info)
{
	npc = pal_9158_varus;
	nr = 5;
	condition = DIA_Pal_9158_Varus_MissKey_Ok_condition;
	information = DIA_Pal_9158_Varus_MissKey_Ok_info;
	permanent = FALSE;
	description = "Našel jsem někoho, kdo si poradí se zámkem.";
};

func int DIA_Pal_9158_Varus_MissKey_Ok_condition()
{
	if((MIS_FingersOpenDoor == LOG_Running) && (FingersAgree == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Pal_9158_Varus_MissKey_Ok_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_Pal_9158_Varus_MissKey_Ok_01_00");	//Našel jsem někoho, kdo si poradí se zámkem.
	AI_Output(self,other,"DIA_Pal_9158_Varus_MissKey_Ok_01_01");	//Opravdu?! (udiveně) A kdo to je?
	AI_Output(other,self,"DIA_Pal_9158_Varus_MissKey_Ok_01_02");	//Bývalý trestanec z kolonie. Je odsud nedaleko, odpočívá na pláži.
	AI_Output(other,self,"DIA_Pal_9158_Varus_MissKey_Ok_01_03");	//A pomůže vám, no jen za podmínky, že se ho nedotknete.
	AI_Output(self,other,"DIA_Pal_9158_Varus_MissKey_Ok_01_04");	//Hmmm... (hrozivě) Myslel jsem si, že to bude nějaký z těch bastardů.
	AI_Output(self,other,"DIA_Pal_9158_Varus_MissKey_Ok_01_05");	//No... jenže já potřebuji ten zatracený sklad!
	AI_Output(self,other,"DIA_Pal_9158_Varus_MissKey_Ok_01_06");	//Proto mu můžeš říct, že souhlasím s jeho podmínkou.
	AI_Output(self,other,"DIA_Pal_9158_Varus_MissKey_Ok_01_07");	//Může sem přijít. Mí lidé se ho nedotknou. Přísahám při Innosovi.
	AI_Output(self,other,"DIA_Pal_9158_Varus_MissKey_Ok_01_08");	//No jestli tu zkusí něco ukrást, okamžitě ho dám na šibenici!
	AI_Output(self,other,"DIA_Pal_9158_Varus_MissKey_Ok_01_09");	//(hrozivě) Je to jasné?!
	AI_Output(other,self,"DIA_Pal_9158_Varus_MissKey_Ok_01_10");	//Samozřejmě.
	VarusFingersAgree = TRUE;
	B_LogEntry(TOPIC_FingersOpenDoor,"Lord Varus souhlasil s podmínkou Fingerse a dal mi slovo, že se ho nedotkne.");
};


instance DIA_Pal_9158_Varus_MissKey_Finish(C_Info)
{
	npc = pal_9158_varus;
	nr = 6;
	condition = DIA_Pal_9158_Varus_MissKey_Finish_condition;
	information = DIA_Pal_9158_Varus_MissKey_Finish_info;
	permanent = FALSE;
	description = "Jak to jde se zámkem?";
};

func int DIA_Pal_9158_Varus_MissKey_Finish_condition()
{
	if((MIS_FingersOpenDoor == LOG_Running) && (FingersInFort == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Pal_9158_Varus_MissKey_Finish_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Pal_9158_Varus_MissKey_Finish_01_00");	//Jak to jde se zámkem?
	AI_Output(self,other,"DIA_Pal_9158_Varus_MissKey_Finish_01_01");	//(chvályhodně) Tvůj přítel se jeví jako užitečný člověk.
	AI_Output(self,other,"DIA_Pal_9158_Varus_MissKey_Finish_01_02");	//Poprvé vidím takového zručného zloděje.
	AI_Output(self,other,"DIA_Pal_9158_Varus_MissKey_Finish_01_03");	//Myslím, že by se nám mohl v budoucnu hodit.
	AI_Output(self,other,"DIA_Pal_9158_Varus_MissKey_Finish_01_04");	//Co se týče tebe, tak si zasloužíš nevelkou odměnu za tvoji pomoc.
	AI_Output(self,other,"DIA_Pal_9158_Varus_MissKey_Finish_01_05");	//Tady, vem si toto zlato!
	B_GiveInvItems(self,other,ItMi_Gold,500);
	AI_Output(self,other,"DIA_Pal_9158_Varus_MissKey_Finish_01_07");	//(arogantně) No nic víc ode mě nechtěj.
	AI_Output(other,self,"DIA_Pal_9158_Varus_MissKey_Finish_01_08");	//Děkuji ti.
	MIS_FingersOpenDoor = LOG_Success;
	Log_SetTopicStatus(TOPIC_FingersOpenDoor,LOG_Success);
	B_LogEntry(TOPIC_FingersOpenDoor,"Lord Varus byl rád, že paladinové znovu mají přístup do skladu.");
};

instance DIA_PAL_9158_VARUS_PICKPOCKET(C_Info)
{
	npc = pal_9158_varus;
	nr = 800;
	condition = dia_pal_9158_varus_pickpocket_condition;
	information = dia_pal_9158_varus_pickpocket_info;
	permanent = TRUE;
	description = "(Ukrást klíč...)";
};

func int dia_pal_9158_varus_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) >= 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (KNOWSVARUSKEY == TRUE) && (FingersTellKey == TRUE))
	{
		return TRUE;
	};
};

func void dia_pal_9158_varus_pickpocket_info()
{
	Info_ClearChoices(dia_pal_9158_varus_pickpocket);
	Info_AddChoice(dia_pal_9158_varus_pickpocket,Dialog_Back,dia_pal_9158_varus_pickpocket_back);
	Info_AddChoice(dia_pal_9158_varus_pickpocket,DIALOG_PICKPOCKET,dia_pal_9158_varus_pickpocket_doit);
};

func void dia_pal_9158_varus_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 175)
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		}
		else
		{
			GlobalThiefCount += 1;

			if(GlobalThiefCount >= 3)
			{
				INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
				GlobalThiefCount = FALSE;
			};
		};
		B_GiveInvItems(self,other,itke_varuskey,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		HavePalSkladMeKey = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(dia_pal_9158_varus_pickpocket);
	}
	else
	{
		Print("Potřebná obratnost: 175");

		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		};
		THIEFCATCHER = Hlp_GetNpc(self);
		HERO_CANESCAPEFROMGOTCHA = TRUE;
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		self.vars[0] = TRUE;
	};
};

func void dia_pal_9158_varus_pickpocket_back()
{
	Info_ClearChoices(dia_pal_9158_varus_pickpocket);
};