
instance DIA_MiltenNW_EXIT(C_Info)
{
	npc = PC_Mage_NW;
	nr = 999;
	condition = DIA_MiltenNW_EXIT_Condition;
	information = DIA_MiltenNW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_MiltenNW_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MiltenNW_KAP3_EXIT(C_Info)
{
	npc = PC_Mage_NW;
	nr = 999;
	condition = DIA_MiltenNW_KAP3_EXIT_Condition;
	information = DIA_MiltenNW_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_MiltenNW_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MiltenNW_KAP3_Hello(C_Info)
{
	npc = PC_Mage_NW;
	nr = 31;
	condition = DIA_MiltenNW_KAP3_Hello_Condition;
	information = DIA_MiltenNW_KAP3_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_MiltenNW_KAP3_Hello_Condition()
{
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_DJG) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_TPL) || (hero.guild == GIL_GUR))
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_KAP3_Hello_Info()
{
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_00");	//(nevěřícně) Nejde mi to na rozum. Opravdu jsi paladin?
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_01");	//Evidentně.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_02");	//(euforicky) Pokud je mezi paladiny někdo jako ty, měli by se mít Beliarovi pohůnci radši na pozoru.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_03");	//Jestli jsi porazil Spáče, nemělo by ti pár skřetů dělat sebemenší potíže.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_04");	//Ve hře nejsou jenom skřeti.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_05");	//To vím, ale i tak je dobré tě mít na své straně.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_06");	//No dobrá.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_07");	//Co děláš tady v klášteře? Nech mě hádat. Chceš se učit umění magie.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_08");	//Možná.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_09");	//Věděl jsem to - běž si promluvit s Mardukem, on je zodpovědný za vás paladiny. Najdeš ho před kaplí.
	};
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_10");	//Vidím, že ty řeči měly pravdu.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_11");	//Jaké řeči?
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_12");	//Že ses spolčil s těmi drakobijci.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_13");	//No, nikdy jsi nebyl dobrý materiál pro církev. Ať je to ale jak chce, bojuješ za naši věc a to je to, co se počítá.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_14");	//Je to vše?
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_15");	//Mám samozřejmě radost, a vypadáš tak, že se tě musí každý skřet hned leknout.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_16");	//Ve hře nejsou jenom skřeti.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_17");	//To vím, ale i tak s nimi jsou problémy. Jsi velmi důležitý.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_18");	//Porazil jsi Spáče. Možná jednoho dne budeme všichni potřebovat pomoc.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_19");	//No dobrá.
	};
};

instance DIA_MiltenNW_Pashal(C_Info)
{
	npc = PC_Mage_NW;
	nr = 3;
	condition = DIA_MiltenNW_Pashal_Condition;
	information = DIA_MiltenNW_Pashal_Info;
	permanent = FALSE;
	description = "Chtěl bych se tě na něco zeptat.";
};

func int DIA_MiltenNW_Pashal_Condition()
{
	if((MIS_PashalQuest == LOG_Running) && (PashalQuestMageStep == TRUE) && (PashalQuestCaveStep == FALSE))
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_Pashal_Info()
{
	AI_Output(other,self,"DIA_MiltenOW_Pashal_01_00");	//Chtěl bych se tě na něco zeptat.
	AI_Output(self,other,"DIA_MiltenOW_Pashal_01_01");	//Na co?
	AI_Output(other,self,"DIA_MiltenOW_Pashal_01_02");	//Už si někdy slyšel o jednom magickém artefaktu, který absorboval veškerou moc tohoto světa?
	AI_Output(self,other,"DIA_MiltenOW_Pashal_01_03");	//Hmmm... (zamyšleně) Ano! Vzpomínám si... můj mistr ze Starého tábora se jednou zmínil.
	AI_Output(self,other,"DIA_MiltenOW_Pashal_01_04");	//Měl dokonce plán, použít ten artefakt ke zničení magické bariéry!
	AI_Output(self,other,"DIA_MiltenOW_Pashal_01_05");	//Protože se ten artefakt nikdy nenašel, tak zůstaly jenom slova.
	AI_Output(other,self,"DIA_MiltenOW_Pashal_01_06");	//Co konkrétně bys mi mohl říct?
	AI_Output(self,other,"DIA_MiltenOW_Pashal_01_07");	//Jak si tak vzpomínám, jeden mág byl poslán aby ho našel.
	AI_Output(self,other,"DIA_MiltenOW_Pashal_01_08");	//Ale nikdy se nevrátil zpátky! A my jsme ho hledaly marně.
	AI_Output(other,self,"DIA_MiltenOW_Pashal_01_09");	//Dobře.
	PashalQuestCaveStep = TRUE;
	PashalQuestCaveStepIns = TRUE;
	B_LogEntry(TOPIC_PashalQuest,"Milten mi řekl že mágové Ohně se ten artefakt snažily najít, dokonce jeden z nich byl pověřen speciálním posláním, bohužel bylo vše marné.");
};

instance DIA_MiltenNW_Monastery(C_Info)
{
	npc = PC_Mage_NW;
	nr = 35;
	condition = DIA_MiltenNW_Monastery_Condition;
	information = DIA_MiltenNW_Monastery_Info;
	permanent = FALSE;
	description = "Jak ses dostal do kláštera tak rychle?";
};


func int DIA_MiltenNW_Monastery_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_Monastery_Info()
{
	AI_Output(other,self,"DIA_MiltenNW_Monastery_15_00");	//Jak ses dostal do kláštera tak rychle?
	AI_Output(self,other,"DIA_MiltenNW_Monastery_03_01");	//Co je to za otázku? Proplížil jsem se průsmykem a namířil si to rovnou do kláštera.
	AI_Output(self,other,"DIA_MiltenNW_Monastery_03_02");	//Přiznávám, že nebylo vždycky snadné proklouznout mezi těmi všemi příšerami, které se zabydlují na téhle straně údolí, ale přece jenom jsem měl míň problémů, než jsem čekal.
};


instance DIA_MiltenNW_FourFriends(C_Info)
{
	npc = PC_Mage_NW;
	nr = 35;
	condition = DIA_MiltenNW_FourFriends_Condition;
	information = DIA_MiltenNW_FourFriends_Info;
	permanent = FALSE;
	description = "Víš, kde jsou ostatní?";
};


func int DIA_MiltenNW_FourFriends_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_FourFriends_Info()
{
	AI_Output(other,self,"DIA_MiltenNW_FourFriends_15_00");	//Víš, kde jsou ostatní?
	if(Npc_IsDead(PC_Fighter_NW_vor_DJG) == FALSE)
	{
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_01");	//Zdá se, že Gorn se vypořádal s pobytem v Garondově vězení docela dobře.
		if(MIS_RescueGorn != LOG_SUCCESS)
		{
			AI_Output(other,self,"DIA_MiltenNW_FourFriends_15_02");	//Jak se dostal ven?
			AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_03");	//Musel jsem Garondovi trochu zalhat, abych ho přesvědčil, že má obvinění stáhnout.
			AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_04");	//Ale bude to jen mezi námi, rozuměno?
		};
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_05");	//Každopádně chtěl jít za Leem a podívat se, co se děje na farmě.
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_06");	//Po tom blivajzu, co dostával ve vězení, se určitě cpe ze všech sil. To bude pro zásoby žoldáků těžká zkouška.
	}
	else
	{
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_07");	//Gorn to nepřežil.
	};
	if(Npc_IsDead(PC_Thief_NW) == FALSE)
	{
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_08");	//Diego mumlal něco o zúčtování. Netuším, co měl na mysli.
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_09");	//Ale řekl bych, že je ve městě. Znáš ho - vždycky se něco najde.
	}
	else
	{
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_10");	//Diego to koupil - zdá se, že ho bariéra přece jenom dostala.
	};
};


instance DIA_MiltenNW_KAP3_Entry(C_Info)
{
	npc = PC_Mage_NW;
	nr = 32;
	condition = DIA_MiltenNW_KAP3_Entry_Condition;
	information = DIA_MiltenNW_KAP3_Entry_Info;
	permanent = TRUE;
	description = "Potřebuji se dostat do kláštera. Je to důležité!";
};


func int DIA_MiltenNW_KAP3_Entry_Condition()
{
	if((Kapitel == 3) && (hero.guild != GIL_KDF) && (MiltenNW_GivesMonasteryKey == FALSE) && !Npc_HasItems(other,ItKe_Innos_MIS))
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_KAP3_Entry_Info()
{
	AI_Output(other,self,"DIA_MiltenNW_KAP3_Entry_15_00");	//Potřebuji se dostat do kláštera. Je to důležité!
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Entry_03_01");	//Yes, sure. Here's the key.
		CreateInvItems(self,ItKe_Innos_MIS,1);
		B_GiveInvItems(self,other,ItKe_Innos_MIS,1);
		MiltenNW_GivesMonasteryKey = TRUE;
		CanEnterKloster = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Entry_03_02");	//Nemůžu tě do kláštera vpustit. Měl bych problémy před Nejvyšší radou.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Entry_03_03");	//Bez povolení mých nadřízených nesmím do kláštera nikoho vpouštět.
		Info_ClearChoices(DIA_MiltenNW_KAP3_Entry);
		Info_AddChoice(DIA_MiltenNW_KAP3_Entry,Dialog_Back,DIA_MiltenNW_KAP3_Entry_BACK);
		Info_AddChoice(DIA_MiltenNW_KAP3_Entry,"Je to důležité!",DIA_MiltenNW_KAP3_Entry_Important);
		if(Npc_HasItems(other,ItWr_PermissionToWearInnosEye_MIS) >= 1)
		{
			Info_AddChoice(DIA_MiltenNW_KAP3_Entry,"Přináším dopis od lorda Hagena.",DIA_MiltenNW_KAP3_Entry_Permit);
		};
	};
};

func void DIA_MiltenNW_KAP3_Entry_BACK()
{
	Info_ClearChoices(DIA_MiltenNW_KAP3_Entry);
};

func void DIA_MiltenNW_KAP3_Entry_Important()
{
	AI_Output(other,self,"DIA_MiltenNW_KAP3_Entry_Important_15_00");	//Je to důležité!
	AI_Output(self,other,"DIA_MiltenNW_KAP3_Entry_Important_03_01");	//To nepůjde. Pyrokar by mi utrhl hlavu.
	Info_ClearChoices(DIA_MiltenNW_KAP3_Entry);
};

func void DIA_MiltenNW_KAP3_Entry_Permit()
{
	AI_Output(other,self,"DIA_MiltenNW_KAP3_Entry_Permit_15_00");	//Přináším dopis od lorda Hagena.
	AI_Output(self,other,"DIA_MiltenNW_KAP3_Entry_Permit_03_01");	//Ukaž mi ho.
	B_GiveInvItems(other,self,ItWr_PermissionToWearInnosEye_MIS,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_MiltenNW_KAP3_Entry_Permit_03_02");	//(váhavě) Dobrá. Tady je klíč od kláštera. Pyrokar je v chrámu.
	CreateInvItems(self,ItKe_Innos_MIS,1);
	B_GiveInvItems(self,other,ItKe_Innos_MIS,1);
	B_GiveInvItems(self,other,ItWr_PermissionToWearInnosEye_MIS,1);
	MiltenNW_GivesMonasteryKey = TRUE;
	CanEnterKloster = TRUE;
	Info_ClearChoices(DIA_MiltenNW_KAP3_Entry);
};


instance DIA_MiltenNW_KAP3_NovizenChase(C_Info)
{
	npc = PC_Mage_NW;
	nr = 31;
	condition = DIA_MiltenNW_KAP3_NovizenChase_Condition;
	information = DIA_MiltenNW_KAP3_NovizenChase_Info;
	permanent = FALSE;
	description = "Nevíš, kde je Pedro?";
};


func int DIA_MiltenNW_KAP3_NovizenChase_Condition()
{
	if((Kapitel == 3) && (MIS_NovizenChase == LOG_Running) && (MIS_SCKnowsInnosEyeIsBroken == FALSE))
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_KAP3_NovizenChase_Info()
{
	AI_Output(other,self,"DIA_MiltenNW_KAP3_NovizenChase_15_00");	//Nevíš, kde je Pedro?
	AI_Output(self,other,"DIA_MiltenNW_KAP3_NovizenChase_03_01");	//Myslíš, že bych tady jen tak stál, kdybych věděl, kde se ten odpadlík schovává?
	AI_Output(self,other,"DIA_MiltenNW_KAP3_NovizenChase_03_02");	//Musí zaplatit za své činy. Doufám, že se nám podaří dostat Oko zpátky.
	AI_Output(self,other,"DIA_MiltenNW_KAP3_NovizenChase_03_03");	//Musíš nám pomoci. Najdi ho a přines zpět Innosovo oko.
};


instance DIA_MiltenNW_KAP3_Perm(C_Info)
{
	npc = PC_Mage_NW;
	nr = 39;
	condition = DIA_MiltenNW_KAP3_Perm_Condition;
	information = DIA_MiltenNW_KAP3_Perm_Info;
	permanent = FALSE;
	description = "Nevíš něco o těch postavách v kápích?";
};


func int DIA_MiltenNW_KAP3_Perm_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_KAP3_Perm_Info()
{
	AI_Output(other,self,"DIA_MiltenNW_KAP3_Perm_15_00");	//Nevíš něco o těch postavách v kápích?
	AI_Output(self,other,"DIA_MiltenNW_KAP3_Perm_03_01");	//Ne, ale nemám z těch chlapíků dobrý pocit.
	AI_Output(self,other,"DIA_MiltenNW_KAP3_Perm_03_02");	//Pokud na ně narazíš, buď opatrný.
};


instance DIA_MiltenNW_KAP4_EXIT(C_Info)
{
	npc = PC_Mage_NW;
	nr = 999;
	condition = DIA_MiltenNW_KAP4_EXIT_Condition;
	information = DIA_MiltenNW_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_MiltenNW_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MILTENNW_BEFOREDRAGONS(C_Info)
{
	npc = PC_Mage_NW;
	nr = 1;
	condition = dia_miltennw_beforedragons_condition;
	information = dia_miltennw_beforedragons_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_miltennw_beforedragons_condition()
{
	if((Kapitel == 4) && (MIS_RitualInnosEyeRepair == LOG_SUCCESS) && (MIS_AllDragonsDead == FALSE) && (Npc_HasItems(self,itke_miltenkey_nw) > 0))
	{
		return TRUE;
	};
};

func void dia_miltennw_beforedragons_info()
{
	AI_Output(self,other,"DIA_MiltenNW_BeforeDragons_03_00");	//Jdeš na draky?
	AI_Output(other,self,"DIA_MiltenNW_BeforeDragons_15_01");	//Něco na ten způsob.
	AI_Output(self,other,"DIA_MiltenNW_BeforeDragons_03_02");	//Tohle je klíč od truhly na hradě v údolí.
	AI_Output(self,other,"DIA_MiltenNW_BeforeDragons_03_03");	//Myslím, že její obsah by se ti mohl hodit.
	B_GiveInvItems(self,other,itke_miltenkey_nw,1);
	AI_StopProcessInfos(self);
};


instance DIA_MiltenNW_KAP4_PERM(C_Info)
{
	npc = PC_Mage_NW;
	nr = 49;
	condition = DIA_MiltenNW_KAP4_PERM_Condition;
	information = DIA_MiltenNW_KAP4_PERM_Info;
	permanent = TRUE;
	description = "Co je nového?";
};


func int DIA_MiltenNW_KAP4_PERM_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_KAP4_PERM_Info()
{
	AI_Output(other,self,"DIA_MiltenNW_KAP4_PERM_15_00");	//Co je nového?
	AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_01");	//Na to bych se měl zeptat já. Máme tady dost starostí.
	AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_02");	//Nejvyšší rada se snaží zjistit, co nepřítel udělá příště.
	AI_Output(other,self,"DIA_MiltenNW_KAP4_PERM_15_03");	//Něco dalšího?
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_04");	//V poslední době jsou útoky skřetů častější, dokonce i mimo Hornické údolí.
		AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_05");	//Vůbec se mi to nechce líbit - myslím, že už nemáme moc času.
	}
	else if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_06");	//Jeden farmář říkal, že poblíž jeho farmy se objevila nějaká šupinatá stvoření.
		AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_07");	//Nevím, jaký to dává dohromady smysl, ale mám pocit, že nepřítel něco chystá.
	}
	else if(MIS_FindTheObesessed == LOG_Running)
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_08");	//Dostáváme čím dál tím víc zpráv o posedlých lidech. Nepřítel je silný, silnější, než jsme čekali.
	}
	else
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_09");	//Ne, situace je stále vážná. Jediné co můžeme dělat, je věřit v Innose.
	};
};


instance DIA_MiltenNW_KAP5_EXIT(C_Info)
{
	npc = PC_Mage_NW;
	nr = 999;
	condition = DIA_MiltenNW_KAP5_EXIT_Condition;
	information = DIA_MiltenNW_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_MiltenNW_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MiltenNW_AllDragonsDead(C_Info)
{
	npc = PC_Mage_NW;
	nr = 900;
	condition = DIA_MiltenNW_AllDragonsDead_Condition;
	information = DIA_MiltenNW_AllDragonsDead_Info;
	permanent = FALSE;
	description = "Pobil jsem všechny draky.";
};


func int DIA_MiltenNW_AllDragonsDead_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_AllDragonsDead_Info()
{
	AI_Output(other,self,"DIA_MiltenNW_AllDragonsDead_15_00");	//Pobil jsem všechny draky.
	AI_Output(self,other,"DIA_MiltenNW_AllDragonsDead_03_01");	//Vážně? Takže naděje přece jenom ještě žije. Teď už zbývá jen useknout Zlu hlavu.
	AI_Output(self,other,"DIA_MiltenNW_AllDragonsDead_03_02");	//Pokud jsi to vážně dokázal, mohli bychom válku vyhrát.
	AI_Output(other,self,"DIA_MiltenNW_AllDragonsDead_15_03");	//Kdo, já?
	AI_Output(self,other,"DIA_MiltenNW_AllDragonsDead_03_04");	//Samozřejmě, že ty. Kdo jiný?

	if(MiltenNW_IsOnBoard == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_MiltenNW_AllDragonsDead_03_05");	//Hej, slyšel jsem, že jsi strávil dlouhý čas v klášterních sklepech. Co jsi zjistil?
	};
};

instance DIA_MiltenNW_KnowWhereEnemy(C_Info)
{
	npc = PC_Mage_NW;
	nr = 55;
	condition = DIA_MiltenNW_KnowWhereEnemy_Condition;
	information = DIA_MiltenNW_KnowWhereEnemy_Info;
	permanent = TRUE;
	description = "Vím, kde se nepřítel ukrývá. Je to malý ostrůvek nedaleko odsud.";
};


func int DIA_MiltenNW_KnowWhereEnemy_Condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && (MiltenNW_IsOnBoard == FALSE) && (CAPITANORDERDIAWAY == FALSE) && (SCGotCaptain == TRUE))
	{
		return TRUE;
	};
};


var int SCToldMiltenHeKnowWhereEnemy;

func void DIA_MiltenNW_KnowWhereEnemy_Info()
{
	AI_Output(other,self,"DIA_MiltenNW_KnowWhereEnemy_15_00");	//Vím, kde se nepřítel ukrývá. Je to malý ostrůvek nedaleko odsud.
	AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_01");	//To je naše velká šance. Musíme okamžitě vyrazit a zničit zlo jednou provždy.
	SCToldMiltenHeKnowWhereEnemy = TRUE;
	Log_CreateTopic(Topic_Crew,LOG_MISSION);
	Log_SetTopicStatus(Topic_Crew,LOG_Running);

	if(Npc_IsDead(DiegoNW) == FALSE)
	{
		AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_02");	//Mluvil jsi o tom s Diegem? Myslím, že by chtěl jet s tebou.
		B_LogEntry(Topic_Crew,"Diego mi může velmi pomoci - nikdy dlouho nepobyl na jednom místě.");
	};
	if(Npc_IsDead(GornNW_nach_DJG) == FALSE)
	{
		AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_03");	//A co Gorn? Promluv si s ním. Slyšel jsem, že se vrátil z Hornického údolí.
		B_LogEntry(Topic_Crew,"Gorn by mi jistě byl také zdatným pomocníkem. Nikdy neuškodí, máš-li po boku zdatného válečníka. Snad by mě mohl trochu vycvičit.");
	};
	if(Npc_IsDead(Lester) == FALSE)
	{
		AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_04");	//A nezapomeň na Lestera. Pokud ho nevytáhneš z toho jeho údolí, tak tam shnije.
		B_LogEntry(Topic_Crew,"Jestli Lestera nevezmu s sebou, nejspíš se z tohoto údolí nikdy nedostane.");
	};

	AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_05");	//Znám také svou vlastní roli, kterou bych měl hrát. Až budeme čelit nepříteli, můžu ti posílit magickou energii a pomáhat ti při vytváření run. Kdy začneme?
	B_LogEntry(Topic_Crew,"Půjde-li Milten se mnou, může mě naučit, jak vyrábět runy a zvýšit si zásoby many.");

	if(Crewmember_Count >= Max_Crew)
	{
		AI_Output(other,self,"DIA_MiltenNW_KnowWhereEnemy_15_06");	//Ne tak rychle, už mám dost lidí.
		AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_07");	//Víš, že bych s tebou šel. Pokud si to rozmyslíš, budu tady na tebe čekat.
		AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_08");	//Hodně štěstí, a ať nad tebou Innos drží ochrannou ruku.
	}
	else
	{
		Info_ClearChoices(DIA_MiltenNW_KnowWhereEnemy);
		Info_AddChoice(DIA_MiltenNW_KnowWhereEnemy,"V tuhle chvíli pro tebe nemám využití.",DIA_MiltenNW_KnowWhereEnemy_No);
		Info_AddChoice(DIA_MiltenNW_KnowWhereEnemy,"Vítej na palubě!",DIA_MiltenNW_KnowWhereEnemy_Yes);
	};
};

func void DIA_MiltenNW_KnowWhereEnemy_Yes()
{
	AI_Output(other,self,"DIA_MiltenNW_KnowWhereEnemy_Yes_15_00");	//Vítej na palubě!
	AI_Output(other,self,"DIA_MiltenNW_KnowWhereEnemy_Yes_15_01");	//Setkáme se v přístavu. Počkej tam na mě.
	AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_Yes_03_02");	//Dobrá. Budu tam, až budeš připraven.
	MiltenNW_IsOnBoard = LOG_SUCCESS;
	B_GivePlayerXP(XP_Crewmember_Success);
	Crewmember_Count = Crewmember_Count + 1;

	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};

	Info_ClearChoices(DIA_MiltenNW_KnowWhereEnemy);
};

func void DIA_MiltenNW_KnowWhereEnemy_No()
{
	AI_Output(other,self,"DIA_MiltenNW_KnowWhereEnemy_No_15_00");	//V tuhle chvíli pro tebe nemám využití.
	AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_No_03_01");	//Víš, že bych to s tebou táhl až do konce. Pokud si to rozmyslíš, budu tady na tebe čekat.
	MiltenNW_IsOnBoard = LOG_OBSOLETE;
	Info_ClearChoices(DIA_MiltenNW_KnowWhereEnemy);
};


instance DIA_MiltenNW_WhereCaptain(C_Info)
{
	npc = PC_Mage_NW;
	nr = 3;
	condition = DIA_MiltenNW_WhereCaptain_Condition;
	information = DIA_MiltenNW_WhereCaptain_Info;
	description = "Kde bych měl hledat kapitána?";
};


func int DIA_MiltenNW_WhereCaptain_Condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && (SCToldMiltenHeKnowWhereEnemy == TRUE) && (SCGotCaptain == FALSE))
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_WhereCaptain_Info()
{
	AI_Output(other,self,"DIA_MiltenNW_WhereCaptain_15_00");	//Kde bych měl hledat kapitána?
	AI_Output(self,other,"DIA_MiltenNW_WhereCaptain_03_01");	//Zeptej se Jorgena. Je to koneckonců námořník. Měl by být ještě pořád v klášteře.
	AI_Output(self,other,"DIA_MiltenNW_WhereCaptain_03_02");	//Ale jestli ti nebude schopen pomoci, budeš muset hledat někoho, kdo by ti řídil loď, na farmách nebo ve městě.
	AI_Output(self,other,"DIA_MiltenNW_WhereCaptain_03_03");	//Nejlepší asi bude promluvit si s Leem nebo jít do přístavu v Khorinisu. Nic lepšího mě teď nenapadá.
	Log_CreateTopic(Topic_Captain,LOG_MISSION);
	Log_SetTopicStatus(Topic_Captain,LOG_Running);
	B_LogEntry(Topic_Captain,"Snad by se mi mohlo podařit najmout kapitána - Jorgena. Měl by se ještě zdržovat v klášteře. Kromě něho bych měl na statcích či ve městě natrefit i na jiné kandidáty na tuto funkci. Snad bych si mohl promluvit s Leem nebo se poptat po přístavu.");
};


instance DIA_MiltenNW_LeaveMyShip(C_Info)
{
	npc = PC_Mage_NW;
	nr = 55;
	condition = DIA_MiltenNW_LeaveMyShip_Condition;
	information = DIA_MiltenNW_LeaveMyShip_Info;
	permanent = TRUE;
	description = "Nakonec tě přece jenom nemůžu vzít s sebou.";
};


func int DIA_MiltenNW_LeaveMyShip_Condition()
{
	if((MiltenNW_IsOnBoard == LOG_SUCCESS) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_LeaveMyShip_Info()
{
	AI_Output(other,self,"DIA_MiltenNW_LeaveMyShip_15_00");	//Nakonec tě přece jenom nemůžu vzít s sebou.
	AI_Output(self,other,"DIA_MiltenNW_LeaveMyShip_03_01");	//Sám musíš nejlíp vědět, koho budeš potřebovat. Pokud si to rozmyslíš, budu na tebe čekat v klášteře.
	MiltenNW_IsOnBoard = LOG_OBSOLETE;
	Crewmember_Count = Crewmember_Count - 1;
	Npc_ExchangeRoutine(self,"ShipOff");
};


instance DIA_MiltenNW_StillNeedYou(C_Info)
{
	npc = PC_Mage_NW;
	nr = 55;
	condition = DIA_MiltenNW_StillNeedYou_Condition;
	information = DIA_MiltenNW_StillNeedYou_Info;
	permanent = TRUE;
	description = "Potřebuji tě.";
};


func int DIA_MiltenNW_StillNeedYou_Condition()
{
	if((MiltenNW_IsOnBoard == LOG_OBSOLETE) && (Crewmember_Count < Max_Crew) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_StillNeedYou_Info()
{
	AI_Output(other,self,"DIA_MiltenNW_StillNeedYou_15_00");	//Potřebuji tě.
	AI_Output(self,other,"DIA_MiltenNW_StillNeedYou_03_01");	//Bude mi ctí. Pojďme, nemáme času nazbyt.
	AI_Output(self,other,"DIA_MiltenNW_StillNeedYou_03_02");	//Jdu do přístavu. Potkáme se tam.
	MiltenNW_IsOnBoard = LOG_SUCCESS;
	Crewmember_Count = Crewmember_Count + 1;

	if(MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};

	AI_StopProcessInfos(self);
};


instance DIA_MiltenNW_Teach(C_Info)
{
	npc = PC_Mage_NW;
	nr = 90;
	condition = DIA_MiltenNW_Teach_Condition;
	information = DIA_MiltenNW_Teach_Info;
	permanent = TRUE;
	description = "Chci se naučit nějaká nová kouzla.";
};


func int DIA_MiltenNW_Teach_Condition()
{
	if(other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_Teach_Info()
{
	AI_Output(other,self,"DIA_MiltenNW_Teach_15_00");	//Chci se naučit nějaká nová kouzla.

	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2)
	{
		Info_ClearChoices(DIA_MiltenNW_Teach);
		Info_AddChoice(DIA_MiltenNW_Teach,Dialog_Back,DIA_MiltenNW_Teach_BACK);

		if(PLAYER_TALENT_RUNES[SPL_InstantFireball] == FALSE)
		{
			Info_AddChoice(DIA_MiltenNW_Teach,b_buildlearnstringforrunes(NAME_SPL_InstantFireball,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_InstantFireball)),DIA_MiltenNW_Teach_Feuerball);
		};
		if((PLAYER_TALENT_RUNES[SPL_RapidFirebolt] == FALSE) && (LegoSpells == TRUE))
		{
			Info_AddChoice(DIA_MiltenNW_Teach,b_buildlearnstringforrunes(NAME_SPL_RapidFirebolt,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_RapidFirebolt)),DIA_MiltenNW_Teach_RapidFirebolt);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_MiltenNW_Teach_03_01");	//Ještě jsi nepostoupil do druhého kruh magie. Není nic, co bych tě mohl naučit.
	};
};

func void DIA_MiltenNW_Teach_BACK()
{
	Info_ClearChoices(DIA_MiltenNW_Teach);
};

func void DIA_MiltenNW_Teach_Feuerball()
{
	B_TeachPlayerTalentRunes(self,other,SPL_InstantFireball);
};

func void DIA_MiltenNW_Teach_RapidFirebolt()
{
	B_TeachPlayerTalentRunes(self,other,SPL_RapidFirebolt);
};

instance DIA_MiltenNW_Mana(C_Info)
{
	npc = PC_Mage_NW;
	nr = 100;
	condition = DIA_MiltenNW_Mana_Condition;
	information = DIA_MiltenNW_Mana_Info;
	permanent = TRUE;
	description = "Chtěl bych posílit svoji magickou moc.";
};


func int DIA_MiltenNW_Mana_Condition()
{
	if(other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_Mana_Info()
{
	AI_Output(other,self,"DIA_MiltenNW_Mana_15_00");	//Chtěl bych posílit svoji magickou moc.
	Info_ClearChoices(DIA_MiltenNW_Mana);
	Info_AddChoice(DIA_MiltenNW_Mana,Dialog_Back,DIA_MiltenNW_Mana_BACK);
	Info_AddChoice(DIA_MiltenNW_Mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_MiltenNW_Mana_1);
	Info_AddChoice(DIA_MiltenNW_Mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_MiltenNW_Mana_5);
};

func void DIA_MiltenNW_Mana_BACK()
{
	if(other.attribute[ATR_MANA_MAX] >= T_MAX)
	{
		AI_Output(self,other,"DIA_MiltenNW_Mana_03_00");	//Tvoje magické síly jsou velké. Moc velké na to, abych ti je pomohl ještě zvýšit.
	};
	Info_ClearChoices(DIA_MiltenNW_Mana);
};

func void DIA_MiltenNW_Mana_1()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,1,T_MAX);
	Info_ClearChoices(DIA_MiltenNW_Mana);
	Info_AddChoice(DIA_MiltenNW_Mana,Dialog_Back,DIA_MiltenNW_Mana_BACK);
	Info_AddChoice(DIA_MiltenNW_Mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_MiltenNW_Mana_1);
	Info_AddChoice(DIA_MiltenNW_Mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_MiltenNW_Mana_5);
};

func void DIA_MiltenNW_Mana_5()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,5,T_MAX);
	Info_ClearChoices(DIA_MiltenNW_Mana);
	Info_AddChoice(DIA_MiltenNW_Mana,Dialog_Back,DIA_MiltenNW_Mana_BACK);
	Info_AddChoice(DIA_MiltenNW_Mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_MiltenNW_Mana_1);
	Info_AddChoice(DIA_MiltenNW_Mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_MiltenNW_Mana_5);
};


instance DIA_MILTENNW_CASSIA(C_Info)
{
	npc = PC_Mage_NW;
	nr = 40;
	condition = dia_miltennw_cassia_condition;
	information = dia_miltennw_cassia_info;
	permanent = FALSE;
	description = "Asi nevíš...";
};


func int dia_miltennw_cassia_condition()
{
	if((MIS_CASSIAGOLDCUP == LOG_Running) && (MILTENSAYABOUTOCKEY == FALSE) && (Npc_HasItems(other,ItKe_OC_Store) == 0) && (CAPITANORDERDIAWAY == FALSE))
	{
		return TRUE;
	};
};

func void dia_miltennw_cassia_info()
{
	AI_Output(other,self,"DIA_MiltenNW_Cassia_15_00");	//Asi nevíš, kde je klíč od skladiště paladinů na hradě?
	AI_Output(self,other,"DIA_MiltenNW_Cassia_03_01");	//Jsi snad zloděj? Nicméně tam toho stejně moc není a klíč se ztratil.
	AI_Output(self,other,"DIA_MiltenNW_Cassia_03_02");	//Jednoho krásného dne se šel Engor projít a vrátil se bez klíče.
	AI_Output(self,other,"DIA_MiltenNW_Cassia_03_03");	//Dříve nebo později dá Garond rozbít dveře a Engor je bude muset opravit.
	B_LogEntry(TOPIC_CASSIAGOLDCUP,"Engor prý při procházce na čerstvém vzduchu ztratil klíč od skladiště. Mohl bych se po něm podívat...");
	MILTENSAYABOUTOCKEY = TRUE;
};


instance DIA_Mage_NW_PICKPOCKET(C_Info)
{
	npc = PC_Mage_NW;
	nr = 900;
	condition = DIA_Mage_NW_PICKPOCKET_Condition;
	information = DIA_Mage_NW_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Mage_NW_PICKPOCKET_Condition()
{
	return C_Beklauen(56,75);
};

func void DIA_Mage_NW_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Mage_NW_PICKPOCKET);
	Info_AddChoice(DIA_Mage_NW_PICKPOCKET,Dialog_Back,DIA_Mage_NW_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Mage_NW_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Mage_NW_PICKPOCKET_DoIt);
};

func void DIA_Mage_NW_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Mage_NW_PICKPOCKET);
};

func void DIA_Mage_NW_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Mage_NW_PICKPOCKET);
};


instance DIA_MILTENNW_KAP6_EXIT(C_Info)
{
	npc = PC_Mage_NW;
	nr = 999;
	condition = dia_miltennw_kap6_exit_condition;
	information = dia_miltennw_kap6_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_miltennw_kap6_exit_condition()
{
	if(Kapitel >= 6)
	{
		return TRUE;
	};
};

func void dia_miltennw_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MILTENNW_SOONBATTLE(C_Info)
{
	npc = PC_Mage_NW;
	nr = 1;
	condition = dia_miltennw_soonbattle_condition;
	information = dia_miltennw_soonbattle_info;
	permanent = FALSE;
	description = "Víš co se stalo?";
};


func int dia_miltennw_soonbattle_condition()
{
	if((KAPITELORCATC == TRUE) && (STOPBIGBATTLE == FALSE))
	{
		return TRUE;
	};
};

func void dia_miltennw_soonbattle_info()
{
	AI_Output(other,self,"DIA_MiltenNW_SoonBattle_01_00");	//Víš co se stalo?
	AI_Output(self,other,"DIA_MiltenNW_SoonBattle_01_01");	//Ano, Pyrokar mi vše řekl, ale překvapen nejsem...
	AI_Output(self,other,"DIA_MiltenNW_SoonBattle_01_02");	//Dříve nebo později se to stát muselo!
	AI_Output(self,other,"DIA_MiltenNW_SoonBattle_01_03");	//Ale netušil jsem že tak brzy!
	AI_Output(other,self,"DIA_MiltenNW_SoonBattle_01_04");	//Bez obav, něco vymyslím.
};


instance DIA_MILTENNW_SOONBATTLENOW(C_Info)
{
	npc = PC_Mage_NW;
	nr = 1;
	condition = dia_miltennw_soonbattlenow_condition;
	information = dia_miltennw_soonbattlenow_info;
	permanent = FALSE;
	description = "Paladinové potřebují pomoc.";
};


func int dia_miltennw_soonbattlenow_condition()
{
	if((KAPITELORCATC == TRUE) && (KDF_JOINHAGEN == TRUE) && (STOPBIGBATTLE == FALSE))
	{
		return TRUE;
	};
};

func void dia_miltennw_soonbattlenow_info()
{
	AI_Output(other,self,"DIA_MiltenNW_SoonBattleNow_01_00");	//Paladinové potřebují pomoc.
	AI_Output(self,other,"DIA_MiltenNW_SoonBattleNow_01_01");	//Bez obav... Vím o tom!
	AI_Output(self,other,"DIA_MiltenNW_SoonBattleNow_01_02");	//Udělám vše co bude v mých silách.
};


instance DIA_MILTENNW_BATTLEWIN(C_Info)
{
	npc = PC_Mage_NW;
	nr = 1;
	condition = dia_miltennw_battlewin_condition;
	information = dia_miltennw_battlewin_info;
	permanent = FALSE;
	description = "Nepřítel prohrá!";
};


func int dia_miltennw_battlewin_condition()
{
	if((STOPBIGBATTLE == TRUE) && (HUMANSWINSBB == TRUE) && (ALLGREATVICTORY == FALSE))
	{
		return TRUE;
	};
};

func void dia_miltennw_battlewin_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_MiltenNW_BattleWin_01_00");	//Nepřítel prohrál!
	AI_Output(self,other,"DIA_MiltenNW_BattleWin_01_01");	//Nyní už vše bude lepší!

	if(MONASTERYISFREE == FALSE)
	{
		AI_Output(self,other,"DIA_MiltenNW_BattleWin_01_02");	//Ale o vítězství celé války mluvíme moc brzy.
		AI_Output(self,other,"DIA_MiltenNW_BattleWin_01_03");	//Klášter je stále obležen skřety.
		AI_Output(other,self,"DIA_MiltenNW_BattleWin_01_04");	//Bez obav, brzy se s tím vypořádám.
		AI_Output(self,other,"DIA_MiltenNW_BattleWin_01_05");	//Doufám, že máš pravdu.
	};
};


instance DIA_MILTENNW_RUNEMAGICNOTWORK(C_Info)
{
	npc = PC_Mage_NW;
	nr = 1;
	condition = dia_miltennw_runemagicnotwork_condition;
	information = dia_miltennw_runemagicnotwork_info;
	permanent = FALSE;
	description = "Tvé magické runy, pracují?";
};


func int dia_miltennw_runemagicnotwork_condition()
{
	if((STOPBIGBATTLE == TRUE) && (MIS_RUNEMAGICNOTWORK == LOG_Running) && (FIREMAGERUNESNOT == FALSE))
	{
		return TRUE;
	};
};

func void dia_miltennw_runemagicnotwork_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_MiltenNW_RuneMagicNotWork_01_00");	//Tvé magické runy, pracují?
	AI_Output(self,other,"DIA_MiltenNW_RuneMagicNotWork_01_01");	//Vůbec nechápu jak se to mohlo stát! Prostě nefungují!
	AI_Output(other,self,"DIA_MiltenNW_RuneMagicNotWork_01_02");	//A co tvý bratři?!
	AI_Output(self,other,"DIA_MiltenNW_RuneMagicNotWork_01_03");	//Ani ostatní mágové Ohně...
	AI_Output(other,self,"DIA_MiltenNW_RuneMagicNotWork_01_04");	//Jasně...
	B_LogEntry(TOPIC_RUNEMAGICNOTWORK,"Runové kameny ostatních mágů Ohně také ztratili svou moc.");
	FIREMAGERUNESNOT = TRUE;
};


instance DIA_MILTENNW_GOONORKSHUNT(C_Info)
{
	npc = PC_Mage_NW;
	nr = 1;
	condition = dia_miltennw_goonorkshunt_condition;
	information = dia_miltennw_goonorkshunt_info;
	permanent = FALSE;
	description = "Jdu na lov skřetů, jdeš také?";
};


func int dia_miltennw_goonorkshunt_condition()
{
	if((HAGENGIVEHELP == TRUE) && (ALLGREATVICTORY == FALSE) && (MILTENTOBIGLAND == FALSE) && (RUNEMAGICNOTWORK == TRUE) && (ALLDISMISSFROMHUNT == FALSE) && Npc_KnowsInfo(hero,dia_miltennw_battlewin))
	{
		return TRUE;
	};
};

func void dia_miltennw_goonorkshunt_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_MiltenNW_GoOnOrksHunt_01_00");	//Jdu na lov skřetů, jdeš také?
	AI_Output(self,other,"DIA_MiltenNW_GoOnOrksHunt_01_01");	//Rád bych, ale má magie nefunguje.
	AI_Output(self,other,"DIA_MiltenNW_GoOnOrksHunt_01_02");	//A bez ní už nejsem tak silný!
	MILTENJOINMEHUNT = TRUE;
};


instance DIA_MILTENNW_FOLLOWME(C_Info)
{
	npc = PC_Mage_NW;
	nr = 1;
	condition = dia_miltennw_followme_condition;
	information = dia_miltennw_followme_info;
	permanent = TRUE;
	description = "Pojďme!";
};


func int dia_miltennw_followme_condition()
{
	if((MILTENJOINMEHUNT == TRUE) && (self.aivar[AIV_PARTYMEMBER] == FALSE) && (ALLDISMISSFROMHUNT == FALSE) && (MILTENTOBIGLAND == FALSE))
	{
		return TRUE;
	};
};

func void dia_miltennw_followme_info()
{
	AI_Output(other,self,"DIA_MiltenNW_FollowMe_01_00");	//Pojďme!
	AI_Output(self,other,"DIA_MiltenNW_FollowMe_01_01");	//Konečně! Jsem připraven.

	if(Npc_HasItems(self,ItMw_1h_Nov_Mace) < 1)
	{
		CreateInvItems(self,ItMw_1h_Nov_Mace,1);
	};

	EquipItem(self,ItMw_1h_Nov_Mace);
	Npc_ExchangeRoutine(self,"Follow");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_MILTENNW_STOPHERE(C_Info)
{
	npc = PC_Mage_NW;
	nr = 1;
	condition = dia_miltennw_stophere_condition;
	information = dia_miltennw_stophere_info;
	permanent = TRUE;
	description = "Počkej zde!";
};


func int dia_miltennw_stophere_condition()
{
	if((MILTENJOINMEHUNT == TRUE) && (self.aivar[AIV_PARTYMEMBER] == TRUE) && (ALLDISMISSFROMHUNT == FALSE) && (MILTENTOBIGLAND == FALSE))
	{
		return TRUE;
	};
};

func void dia_miltennw_stophere_info()
{
	AI_Output(other,self,"DIA_MiltenNW_StopHere_01_00");	//Počkej zde!

	if(MONASTERYISFREE == FALSE)
	{
		AI_Output(self,other,"DIA_MiltenNW_StopHere_01_01");	//Dobrá, jdu zpět na farmu.
		AI_Output(self,other,"DIA_MiltenNW_StopHere_01_02");	//Najdeš mě tam.
		Npc_ExchangeRoutine(self,"CampOn");
	}
	else
	{
		AI_Output(self,other,"DIA_MiltenNW_StopHere_01_03");	//Dobrá, jdu zpět do kláštera.
		AI_Output(self,other,"DIA_MiltenNW_StopHere_01_04");	//Najdeš mě tam.
		Npc_ExchangeRoutine(self,"OrcAtcNW");
	};

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	AI_StopProcessInfos(self);
};


instance DIA_MILTENNW_ALLGREATVICTORY(C_Info)
{
	npc = PC_Mage_NW;
	nr = 1;
	condition = dia_miltennw_allgreatvictory_condition;
	information = dia_miltennw_allgreatvictory_info;
	permanent = FALSE;
	description = "Unaven?";
};


func int dia_miltennw_allgreatvictory_condition()
{
	if(ALLGREATVICTORY == TRUE)
	{
		return TRUE;
	};
};

func void dia_miltennw_allgreatvictory_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_MiltenNW_AllGreatVictory_01_00");	//Unaven?
	AI_Output(self,other,"DIA_MiltenNW_AllGreatVictory_01_01");	//Jen trochu... Poslední dny mě zmohly.
	AI_Output(self,other,"DIA_MiltenNW_AllGreatVictory_01_02");	//Nicméně lepší než stále žít ve strachu co bude!
};


instance DIA_MILTENNW_WHATDONOW(C_Info)
{
	npc = PC_Mage_NW;
	nr = 1;
	condition = dia_miltennw_whatdonow_condition;
	information = dia_miltennw_whatdonow_info;
	permanent = FALSE;
	description = "Půjdeš do kláštera?";
};


func int dia_miltennw_whatdonow_condition()
{
	if((ALLGREATVICTORY == TRUE) && (MILTENTOBIGLAND == FALSE))
	{
		return TRUE;
	};
};

func void dia_miltennw_whatdonow_info()
{
	AI_Output(other,self,"DIA_MiltenNW_WhatDoNow_01_00");	//Půjdeš do kláštera?
	AI_Output(self,other,"DIA_MiltenNW_WhatDoNow_01_01");	//Pravděpodobně... Nemyslím, že bych teď měl chodit jinam!
	AI_Output(self,other,"DIA_MiltenNW_WhatDoNow_01_02");	//Mám tam nějakou práci.
	AI_Output(other,self,"DIA_MiltenNW_WhatDoNow_01_03");	//A jakou?!
	AI_Output(self,other,"DIA_MiltenNW_WhatDoNow_01_04");	//Hmm... Už dlouho jsem chtěl najít tajnou knihovnu.
};


instance DIA_MILTENNW_TRAVELONBIGLAND(C_Info)
{
	npc = PC_Mage_NW;
	nr = 1;
	condition = dia_miltennw_travelonbigland_condition;
	information = dia_miltennw_travelonbigland_info;
	permanent = FALSE;
	description = "Popluješ se mnou na kontinent?";
};


func int dia_miltennw_travelonbigland_condition()
{
	if(WHOTRAVELONBIGLAND == TRUE)
	{
		return TRUE;
	};
};

func void dia_miltennw_travelonbigland_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_MiltenNW_TravelOnBigLand_01_00");	//Popluješ se mnou na kontinent?
	AI_Output(self,other,"DIA_MiltenNW_TravelOnBigLand_01_01");	//Hmm... Tvá nabídka je zajímavá.
	AI_Output(self,other,"DIA_MiltenNW_TravelOnBigLand_01_02");	//Abych řekl tady, ostrov mě trochu nudí a v Nordmaru je slavná knihovna našeho řádu.
	AI_Output(self,other,"DIA_MiltenNW_TravelOnBigLand_01_04");	//Eh... (úsměv) Dobrá, tak teda jdu s tebou!
	AI_Output(other,self,"DIA_MiltenNW_TravelOnBigLand_01_05");	//Potkáme se na lodi.
	COUNTTRAVELONBIGLAND = COUNTTRAVELONBIGLAND + 1;
	MILTENTOBIGLAND = TRUE;
	B_LogEntry(TOPIC_SALETOBIGLAND,"Milten jde se mnou na kontinent!");
	Npc_ExchangeRoutine(self,"SHIP");
	AI_StopProcessInfos(self);
};

