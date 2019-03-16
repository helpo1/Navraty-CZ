
instance DIA_MiltenOW_EXIT(C_Info)
{
	npc = PC_Mage_OW;
	nr = 999;
	condition = DIA_MiltenOW_EXIT_Condition;
	information = DIA_MiltenOW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_MiltenOW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_MiltenOW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MiltenOW_Hello(C_Info)
{
	npc = PC_Mage_OW;
	nr = TRUE;
	condition = DIA_MiltenOW_Hello_Condition;
	information = DIA_MiltenOW_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_MiltenOW_Hello_Condition()
{
	return TRUE;
};

func void DIA_MiltenOW_Hello_Info()
{
	AI_Output(self,other,"DIA_MiltenOW_Hello_03_00");	//Podívejme, kdo se vrátil! Náš hrdina od bariéry!
	Info_ClearChoices(DIA_MiltenOW_Hello);
	Info_AddChoice(DIA_MiltenOW_Hello,"Rád tě vidím, Miltene.",DIA_MiltenOW_Hello_YES);
	Info_AddChoice(DIA_MiltenOW_Hello,"Měl bych tě znát?",DIA_MiltenOW_Hello_NO);
};

func void B_Milten_GornDiegoLester()
{
	AI_Output(self,other,"DIA_MiltenOW_Hello_NO_03_02");	//Vzpomínáš si na Gorna, Diega a Lestera?
};

func void DIA_MiltenOW_Hello_YES()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_MiltenOW_Hello_YES_15_00");	//Rád tě vidím, Miltene?
	AI_Output(self,other,"DIA_MiltenOW_Hello_YES_03_01");	//Pořád. Co padla bariéra, vstoupil jsem do kláštera mágů Ohně.
	AI_Output(self,other,"DIA_MiltenOW_Hello_YES_03_02");	//Ale jakmile se ukázalo, že sem chtějí přijít paladinové, přišly k duhu moje zkušenosti a znalost okolí.
	AI_Output(self,other,"DIA_MiltenOW_Hello_YES_03_03");	//Rozhodli se tedy, že mě pověří svatým posláním poskytnout této výpravě magickou podporu.
	B_Milten_GornDiegoLester();
	Info_ClearChoices(DIA_MiltenOW_Hello);
	Info_AddChoice(DIA_MiltenOW_Hello,"Samozřejmě, že si kluky pamatuju.",DIA_MiltenOW_Hello_Friends);
	Info_AddChoice(DIA_MiltenOW_Hello,"Ta jména mi vážně nic neříkají.",DIA_MiltenOW_Hello_Forget);
};

func void DIA_MiltenOW_Hello_NO()
{
	AI_Output(other,self,"DIA_MiltenOW_Hello_NO_15_00");	//Měl bych je znát?
	AI_Output(self,other,"DIA_MiltenOW_Hello_NO_03_01");	//Asi toho máš za sebou dost, co?
	B_Milten_GornDiegoLester();
	Info_ClearChoices(DIA_MiltenOW_Hello);
	Info_AddChoice(DIA_MiltenOW_Hello,"Samozřejmě, že si kluky pamatuju.",DIA_MiltenOW_Hello_Friends);
	Info_AddChoice(DIA_MiltenOW_Hello,"Ta jména mi vážně nic neříkají.",DIA_MiltenOW_Hello_Forget);
};

func void DIA_MiltenOW_Hello_Friends()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_MiltenOW_Hello_Friends_15_00");	//Samozřejmě, že si kluky pamatuju.
	AI_Output(self,other,"DIA_MiltenOW_Hello_Friends_03_01");	//No, Gorn a Diego se daleko nedostali. Sebrali je paladinové tady v údolí.
	AI_Output(self,other,"DIA_MiltenOW_Hello_Friends_03_02");	//Ale Lester zmizel - vůbec netuším, kde by se tak mohl flákat.

	if(Npc_KnowsInfo(other,DIA_Lester_Hello))
	{
		AI_Output(other,self,"DIA_MiltenOW_Hello_Friends_15_03");	//S Lesterem jsem se setkal - je teď s Xardasem.
		AI_Output(self,other,"DIA_MiltenOW_Hello_Friends_03_04");	//Aspoň jedna dobrá zpráva.
	};

	AI_Output(self,other,"DIA_MiltenOW_Hello_Friends_03_05");	//No, já žádné dobré zprávy nemám.
	Knows_Diego = TRUE;
	Info_ClearChoices(DIA_MiltenOW_Hello);
};

func void DIA_MiltenOW_Hello_Forget()
{
	AI_Output(other,self,"DIA_MiltenOW_Hello_Forget_15_00");	//Ta jména mi vážně nic neříkají.
	AI_Output(self,other,"DIA_MiltenOW_Hello_Forget_03_01");	//Hodně jsi toho zapomněl, co? No, nechme minulost odpočívat v pokoji a věnujme se tomu, co máme před sebou.
	AI_Output(self,other,"DIA_MiltenOW_Hello_Forget_03_02");	//I když nemám nic příjemného, co bych mohl nahlásit.
	Info_ClearChoices(DIA_MiltenOW_Hello);
};

instance DIA_MiltenOW_Bericht(C_Info)
{
	npc = PC_Mage_OW;
	nr = 3;
	condition = DIA_MiltenOW_Bericht_Condition;
	information = DIA_MiltenOW_Bericht_Info;
	permanent = FALSE;
	description = "A co bys rád nahlásil?";
};

func int DIA_MiltenOW_Bericht_Condition()
{
	if(Npc_KnowsInfo(other,DIA_MiltenOW_Hello))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Bericht_Info()
{
	AI_Output(other,self,"DIA_MiltenOW_Bericht_15_00");	//A co bys rád nahlásil?
	AI_Output(self,other,"DIA_MiltenOW_Bericht_03_01");	//Přišli sem paladinové a chtějí odvézt magickou rudu.
	AI_Output(self,other,"DIA_MiltenOW_Bericht_03_02");	//Ale když si vezmu všechny ty draky a skřety, netuším, jak chtějí paladinové rudu dostat a pak se taky dostat pryč.
	AI_Output(self,other,"DIA_MiltenOW_Bericht_03_03");	//Ne, u Innose - cítím přítomnost něčeho temného... roste tu nějaké zlo. Vychází to z tohohle údolí.
	AI_Output(self,other,"DIA_MiltenOW_Bericht_03_04");	//Za zlikvidování Spáče jsme zaplatili vysokou cenu. Pád bariéry poznamenal i tohle místo.
	AI_Output(self,other,"DIA_MiltenOW_Bericht_03_05");	//Budeme mít opravdu velké štěstí, když to přežijeme.
};

instance DIA_MiltenOW_Pashal(C_Info)
{
	npc = PC_Mage_OW;
	nr = 3;
	condition = DIA_MiltenOW_Pashal_Condition;
	information = DIA_MiltenOW_Pashal_Info;
	permanent = FALSE;
	description = "Chtěl bych se tě na něco zeptat.";
};

func int DIA_MiltenOW_Pashal_Condition()
{
	if((MIS_PashalQuest == LOG_Running) && (PashalQuestMageStep == TRUE) && (PashalQuestCaveStep == FALSE))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Pashal_Info()
{
	AI_Output(other,self,"DIA_MiltenOW_Pashal_01_00");	//Chtěl bych se tě na něco zeptat.
	AI_Output(self,other,"DIA_MiltenOW_Pashal_01_01");	//Na co?
	AI_Output(other,self,"DIA_MiltenOW_Pashal_01_02");	//Už si někdy slyšel o jednom magickém artefaktu, který absorboval veškerou moc tohoto světa?
	AI_Output(self,other,"DIA_MiltenOW_Pashal_01_03");	//Hmmm...(zamyšleně) Ano! Vzpomínám si... můj mistr ze Starého tábora se jednou zmínil.
	AI_Output(self,other,"DIA_MiltenOW_Pashal_01_04");	//Měl dokonce plán, použít ten artefakt ke zničení magické bariéry!
	AI_Output(self,other,"DIA_MiltenOW_Pashal_01_05");	//Protože se ten artefakt nikdy nenašel, tak zůstaly jenom slova.
	AI_Output(other,self,"DIA_MiltenOW_Pashal_01_06");	//Co konkrétně bys mi mohl říct?
	AI_Output(self,other,"DIA_MiltenOW_Pashal_01_07");	//Jak si tak vzpomínám, jeden mág byl poslán aby ho našel.
	AI_Output(self,other,"DIA_MiltenOW_Pashal_01_08");	//Ale nikdy se nevrátil zpátky! A my jsme ho hledaly marně.
	AI_Output(other,self,"DIA_MiltenOW_Pashal_01_09");	//Dobře.
	PashalQuestCaveStep = TRUE;
	B_LogEntry(TOPIC_PashalQuest,"Milten mi řekl že mágové Ohně se ten artefakt snažily najít, dokonce jeden z nich byl pověřen speciálním posláním, bohužel bylo vše marné.");
	Wld_InsertNpc(KDF_4569_AlexOne,"OW_ALEXONE");
};

instance DIA_MiltenOW_Erz(C_Info)
{
	npc = PC_Mage_OW;
	nr = 4;
	condition = DIA_MiltenOW_Erz_Condition;
	information = DIA_MiltenOW_Erz_Info;
	permanent = FALSE;
	description = "Kolik rudy jste zatím nashromáždili?";
};


func int DIA_MiltenOW_Erz_Condition()
{
	if(Npc_KnowsInfo(other,DIA_MiltenOW_Bericht))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Erz_Info()
{
	AI_Output(other,self,"DIA_MiltenOW_Erz_15_00");	//Kolik rudy jste zatím nashromáždili?
	AI_Output(self,other,"DIA_MiltenOW_Erz_03_01");	//Kolik rudy...? Ani jedinou bednu! Už před nějakou dobou jsme ztratili kontakt s kopáči.
	AI_Output(self,other,"DIA_MiltenOW_Erz_03_02");	//Vůbec by mě nepřekvapilo, kdyby byli dávno mrtví. A ke všemu na nás útočí draci a oblehli nás skřeti!
	AI_Output(self,other,"DIA_MiltenOW_Erz_03_03");	//Celá tahle expedice je naprostá katastrofa.
};


instance DIA_MiltenOW_Wo(C_Info)
{
	npc = PC_Mage_OW;
	nr = 5;
	condition = DIA_MiltenOW_Wo_Condition;
	information = DIA_MiltenOW_Wo_Info;
	permanent = FALSE;
	description = "Kde jsou teď Gorn a Diego?";
};


func int DIA_MiltenOW_Wo_Condition()
{
	if(Npc_KnowsInfo(other,DIA_MiltenOW_Hello) && (Knows_Diego == TRUE))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Wo_Info()
{
	AI_Output(other,self,"DIA_MiltenOW_Wo_Forget_15_00");	//Kde jsou teď Gorn a Diego?
	AI_Output(self,other,"DIA_MiltenOW_Wo_Forget_03_01");	//Inu, Gorn sedí tady v žaláři - bránil se zatčení.
	AI_Output(self,other,"DIA_MiltenOW_Wo_Forget_03_02");	//Diega přiřadili ke skupině kopáčů - když tak se zeptej paladina Parcivala, ten dával ty skupiny dohromady.
	KnowsAboutGorn = TRUE;
	SearchForDiego = LOG_Running;
};


instance DIA_MiltenOW_Gorn(C_Info)
{
	npc = PC_Mage_OW;
	nr = 5;
	condition = DIA_MiltenOW_Gorn_Condition;
	information = DIA_MiltenOW_Gorn_Info;
	permanent = FALSE;
	description = "Pojďme osvobodit Gorna!";
};


func int DIA_MiltenOW_Gorn_Condition()
{
	if((KnowsAboutGorn == TRUE) && (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Gorn_Info()
{
	AI_Output(other,self,"DIA_MiltenOW_Gorn_15_00");	//Pojďme osvobodit Gorna!
	AI_Output(self,other,"DIA_MiltenOW_Gorn_03_01");	//No, je tady jeden malý problém - Gorn je usvědčený trestanec.
	AI_Output(self,other,"DIA_MiltenOW_Gorn_03_02");	//Ale když budeme mít štěstí, podaří se nám domluvit se s Garondem a vykoupit ho.
	AI_Output(other,self,"DIA_MiltenOW_Gorn_15_03");	//Ano, možná...
	AI_Output(self,other,"DIA_MiltenOW_Gorn_03_04");	//Udržuj mě v obraze.
	Log_CreateTopic(TOPIC_RescueGorn,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RescueGorn,LOG_Running);
	B_LogEntry(TOPIC_RescueGorn,"Velitel Garond nechal Gorna zavřít. Snad tak trochu naletěl, a tak bychom mu měli pomoci z nesnází.");
};


instance DIA_MiltenOW_Preis(C_Info)
{
	npc = PC_Mage_OW;
	nr = 5;
	condition = DIA_MiltenOW_Preis_Condition;
	information = DIA_MiltenOW_Preis_Info;
	permanent = FALSE;
	description = "Garond chce za Gorna 1000 zlatých.";
};


func int DIA_MiltenOW_Preis_Condition()
{
	if((MIS_RescueGorn == LOG_Running) && (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Preis_Info()
{
	AI_Output(other,self,"DIA_MiltenOW_Preis_15_00");	//Garond chce za Gorna 1000 zlatých.
	AI_Output(self,other,"DIA_MiltenOW_Preis_03_01");	//Hezká sumička. Můžu přispět 250 zlatými.
	B_GiveInvItems(self,other,ItMi_Gold,250);
	B_LogEntry(TOPIC_RescueGorn,"Milten mi dal 250 zlatých, abych zaplatil za Gornovo propuštění.");
};


instance DIA_MiltenOW_Mehr(C_Info)
{
	npc = PC_Mage_OW;
	nr = 5;
	condition = DIA_MiltenOW_Mehr_Condition;
	information = DIA_MiltenOW_Mehr_Info;
	permanent = FALSE;
	description = "Pokud mám Gorna vykoupit, budu potřebovat víc zlata.";
};


func int DIA_MiltenOW_Mehr_Condition()
{
	if((MIS_RescueGorn == LOG_Running) && (Kapitel == 2) && (Npc_HasItems(other,ItMi_Gold) < 1000) && Npc_KnowsInfo(other,DIA_MiltenOW_Preis))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Mehr_Info()
{
	AI_Output(other,self,"DIA_MiltenOW_Mehr_15_00");	//Pokud mám Gorna vykoupit, budu potřebovat víc zlata.
	AI_Output(self,other,"DIA_MiltenOW_Mehr_03_01");	//Víc zlata... hm. Diego o takových věcech ví dost - ale ten tady není.
	AI_Output(self,other,"DIA_MiltenOW_Mehr_03_02");	//Možná si Gorn sám schoval nějaké zlato na horší časy - měli bychom se na to podívat.
	AI_Output(self,other,"DIA_MiltenOW_Mehr_03_03");	//Napíšu mu vzkaz. Zkus mu ho nějak propašovat do žaláře.
	B_GiveInvItems(self,other,ItWr_LetterForGorn_MIS,1);
	B_LogEntry(TOPIC_RescueGorn,"Milten mi předal zprávu pro Gorna. Když mu ji nějak propašuji do vězení, může nám prozradit, jestli nemá někde ulité nějaké zlato.");
};


instance DIA_MiltenOW_Equipment(C_Info)
{
	npc = PC_Mage_OW;
	nr = 5;
	condition = DIA_MiltenOW_Equipment_Condition;
	information = DIA_MiltenOW_Equipment_Info;
	permanent = FALSE;
	description = "Mohl bys mi dát nějakou výbavu?";
};


func int DIA_MiltenOW_Equipment_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Garond_Equipment) && (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Equipment_Info()
{
	AI_Output(other,self,"DIA_MiltenOW_Equipmentt_15_00");	//Mohl bys mi dát nějakou výbavu? Garond mě požádal, jestli bych se nevypravil do dolů.
	AI_Output(self,other,"DIA_MiltenOW_Equipment_03_01");	//A kde bych to tak asi měl sehnat? Jediné, co ti můžu dát, je cenný runový kámen.
	B_GiveInvItems(self,other,ItMi_RuneBlank,1);
};


instance DIA_MiltenOW_Versteck(C_Info)
{
	npc = PC_Mage_OW;
	nr = 1;
	condition = DIA_MiltenOW_Versteck_Condition;
	information = DIA_MiltenOW_Versteck_Info;
	permanent = FALSE;
	important = FALSE;
	description = "Mám odpověď od Gorna...";
};


func int DIA_MiltenOW_Versteck_Condition()
{
	if((GornsTreasure == TRUE) && (Npc_HasItems(other,ItMi_GornsTreasure_MIS) <= 0) && (Gorns_Beutel == FALSE) && (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Versteck_Info()
{
	AI_Output(other,self,"DIA_MiltenOW_Versteck_15_00");	//Mám odpověď od Gorna. Říká, že zlato je u jižní brány.
	AI_Output(self,other,"DIA_MiltenOW_Versteck_03_01");	//(trpce) Chtěl jsi říct u bývalé jižní brány. Ten drak z ní udělal hromadu suti.
	AI_Output(other,self,"DIA_MiltenOW_Versteck_15_02");	//Jak se tam dostanu?
	AI_Output(self,other,"DIA_MiltenOW_Versteck_03_03");	//Je to poblíž skřetího beranidla. Jižní brána byla napravo od něj.
	AI_Output(self,other,"DIA_MiltenOW_Versteck_03_04");	//Nebude to nijak snadné - buď opatrný a pospěš si.
	B_LogEntry(TOPIC_RescueGorn,"Bývalá jižní brána leží přímo naproti skřetím zátarasům. Gornovo zlato by mělo být někde tam.");
};


instance DIA_MiltenOW_Frei(C_Info)
{
	npc = PC_Mage_OW;
	nr = 5;
	condition = DIA_MiltenOW_Frei_Condition;
	information = DIA_MiltenOW_Frei_Info;
	permanent = FALSE;
	description = "Osvobodil jsem Gorna.";
};


func int DIA_MiltenOW_Frei_Condition()
{
	if((MIS_RescueGorn == LOG_SUCCESS) && (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Frei_Info()
{
	AI_Output(other,self,"DIA_MiltenOW_Frei_15_00");	//Osvobodil jsem Gorna.
	AI_Output(self,other,"DIA_MiltenOW_Frei_03_01");	//Dobře. Měli bychom si promyslet, co bude dál.
};


instance DIA_MiltenOW_Lehren(C_Info)
{
	npc = PC_Mage_OW;
	nr = 9;
	condition = DIA_MiltenOW_Lehren_Condition;
	information = DIA_MiltenOW_Lehren_Info;
	permanent = FALSE;
	description = "Můžeš mě něčemu naučit?";
};


func int DIA_MiltenOW_Lehren_Condition()
{
	if((other.guild == GIL_KDF) && (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Lehren_Info()
{
	AI_Output(other,self,"DIA_MiltenOW_Lehren_15_00");	//Můžeš mě něčemu naučit?
	AI_Output(self,other,"DIA_MiltenOW_Lehren_03_01");	//Mohu tě naučit trochu magie z druhého kruhu, případně ti také mohu pomoci zvýšit magické síly.
	AI_Output(self,other,"DIA_MiltenOW_Lehren_03_02");	//Jestli jsi připravený na zvýšení magické síly, mohu tě začít učit.
};

instance DIA_MILTENOW_CASSIA(C_Info)
{
	npc = PC_Mage_OW;
	nr = 10;
	condition = dia_miltenow_cassia_condition;
	information = dia_miltenow_cassia_info;
	permanent = FALSE;
	description = "Asi bys nevěděl...";
};

func int dia_miltenow_cassia_condition()
{
	if((MIS_CASSIAGOLDCUP == LOG_Running) && (Npc_HasItems(other,ItKe_OC_Store) == 0))
	{
		return TRUE;
	};
};

func void dia_miltenow_cassia_info()
{
	AI_Output(other,self,"DIA_Milten_Cassia_15_00");	//Asi bys nevěděl, kde je klíč od skladiště paladinů?
	AI_Output(self,other,"DIA_Milten_Cassia_03_01");	//Jsi snad nějaký zloděj? No, stejně bys toho moc neodnesl.
	AI_Output(self,other,"DIA_Milten_Cassia_03_02");	//Jednoho krásného dne se Engor šel projít na čerstvý vzduch a ten klíč ztratil - prostě se vrátil bez něj.
	AI_Output(self,other,"DIA_Milten_Cassia_03_03");	//Myslím, že Garnod dříve nebo později dá ty dveře vyrazit a Engor je bude muset spravit.
	AI_Output(self,other,"DIA_Milten_Cassia_03_04");	//Jo, ještě něco...
	AI_Output(self,other,"DIA_Milten_Cassia_03_05");	//Jestli ten klíč najdeš, hoď ho do Engorova pokoje.
	AI_Output(self,other,"DIA_Milten_Cassia_03_06");	//Bude to tak lepší, když ho najde.
	AI_Output(other,self,"DIA_Milten_Cassia_15_07");	//Jasně.
	B_LogEntry(TOPIC_CASSIAGOLDCUP,"Engor ztratil klíč od skladiště paladinů když se šel projít na čerstvý vzduch.");
	MILTENSAYABOUTOCKEY = TRUE;
};

instance DIA_MiltenOW_TeachCircle2(C_Info)
{
	npc = PC_Mage_OW;
	nr = 91;
	condition = DIA_MiltenOW_TeachCircle2_Condition;
	information = DIA_MiltenOW_TeachCircle2_Info;
	permanent = TRUE;
	description = "Nauč mě druhý kruh magie. (VB: 30)";
};


func int DIA_MiltenOW_TeachCircle2_Condition()
{
	if((other.guild == GIL_KDF) && Npc_KnowsInfo(other,DIA_MiltenOW_Lehren) && (Npc_GetTalentSkill(other,NPC_TALENT_MAGE) < 2))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_TeachCircle2_Info()
{
	AI_Output(other,self,"DIA_Milten_Add_15_00");	//Nauč mě druhý kruh magie!
	AI_Output(self,other,"DIA_Milten_Add_03_01");	//Většinou to je privilegium vyhrazené učitelům našeho řádu.
	AI_Output(self,other,"DIA_Milten_Add_03_02");	//Ale myslím, že v tomto případě můžeme udělat výjimku...

	if(B_TeachMagicCircle(self,other,2))
	{
		AI_Output(self,other,"DIA_Milten_Add_03_03");	//Nevím, jestli si pamatuju ta oficiální slova správně...
		AI_Output(self,other,"DIA_Milten_Add_03_04");	//Vstup nyní do Druhého kruhu. Ehm... Ukáže ti směr - cestu však budou tvořit skutky tvé - nebo tak nějak to bylo...
		AI_Output(self,other,"DIA_Milten_Add_03_05");	//Myslím, že víš, co to má znamenat...
	};
};


instance DIA_MiltenOW_Teach(C_Info)
{
	npc = PC_Mage_OW;
	nr = 90;
	condition = DIA_MiltenOW_Teach_Condition;
	information = DIA_MiltenOW_Teach_Info;
	permanent = TRUE;
	description = "Chci se naučit nějaká nová kouzla.";
};


func int DIA_MiltenOW_Teach_Condition()
{
	if((other.guild == GIL_KDF) && Npc_KnowsInfo(other,DIA_MiltenOW_Lehren) && (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Teach_Info()
{
	AI_Output(other,self,"DIA_MiltenOW_Teach_15_00");	//Chci se naučit nějaká nová kouzla.
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2)
	{
		Info_ClearChoices(DIA_MiltenOW_Teach);
		Info_AddChoice(DIA_MiltenOW_Teach,Dialog_Back,DIA_MiltenOW_Teach_BACK);
		if(PLAYER_TALENT_RUNES[SPL_InstantFireball] == FALSE)
		{
			Info_AddChoice(DIA_MiltenOW_Teach,b_buildlearnstringforrunes(NAME_SPL_InstantFireball,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_InstantFireball)),DIA_MiltenOW_Teach_Feuerball);
		};
		if((PLAYER_TALENT_RUNES[SPL_RapidFirebolt] == FALSE) && (LegoSpells == TRUE))
		{
			Info_AddChoice(DIA_MiltenOW_Teach,b_buildlearnstringforrunes(NAME_SPL_RapidFirebolt,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_RapidFirebolt)),DIA_MiltenOW_Teach_RapidFirebolt);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_MiltenOW_Teach_03_01");	//Ještě jsi nevstoupil do Druhého kruhu magie. Nemůžu tě nic naučit.
	};
};

func void DIA_MiltenOW_Teach_BACK()
{
	Info_ClearChoices(DIA_MiltenOW_Teach);
};

func void DIA_MiltenOW_Teach_Feuerball()
{
	B_TeachPlayerTalentRunes(self,other,SPL_InstantFireball);
};

func void DIA_MiltenOW_Teach_RapidFirebolt()
{
	B_TeachPlayerTalentRunes(self,other,SPL_RapidFirebolt);
};

instance DIA_MiltenOW_Mana(C_Info)
{
	npc = PC_Mage_OW;
	nr = 100;
	condition = DIA_MiltenOW_Mana_Condition;
	information = DIA_MiltenOW_Mana_Info;
	permanent = TRUE;
	description = "Chtěl bych posílit svoji magickou moc.";
};


func int DIA_MiltenOW_Mana_Condition()
{
	if((other.guild == GIL_KDF) && Npc_KnowsInfo(other,DIA_MiltenOW_Lehren) && (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Mana_Info()
{
	AI_Output(other,self,"DIA_MiltenOW_Mana_15_00");	//Chtěl bych posílit svoji magickou moc.
	Info_ClearChoices(DIA_MiltenOW_Mana);
	Info_AddChoice(DIA_MiltenOW_Mana,Dialog_Back,DIA_MiltenOW_Mana_BACK);
	Info_AddChoice(DIA_MiltenOW_Mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_MiltenOW_Mana_1);
	Info_AddChoice(DIA_MiltenOW_Mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_MiltenOW_Mana_5);
};

func void DIA_MiltenOW_Mana_BACK()
{
	if(other.attribute[ATR_MANA_MAX] >= T_MED)
	{
		AI_Output(self,other,"DIA_MiltenOW_Mana_03_00");	//Tvoje magická síla je veliká. Příliš velká na to, abych ti ji mohl pomoci ještě zvýšit.
	};
	Info_ClearChoices(DIA_MiltenOW_Mana);
};

func void DIA_MiltenOW_Mana_1()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,1,T_MED);
	Info_ClearChoices(DIA_MiltenOW_Mana);
	Info_AddChoice(DIA_MiltenOW_Mana,Dialog_Back,DIA_MiltenOW_Mana_BACK);
	Info_AddChoice(DIA_MiltenOW_Mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_MiltenOW_Mana_1);
	Info_AddChoice(DIA_MiltenOW_Mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_MiltenOW_Mana_5);
};

func void DIA_MiltenOW_Mana_5()
{
	B_TeachAttributePoints(self,other,ATR_MANA_MAX,5,T_MED);
	Info_ClearChoices(DIA_MiltenOW_Mana);
	Info_AddChoice(DIA_MiltenOW_Mana,Dialog_Back,DIA_MiltenOW_Mana_BACK);
	Info_AddChoice(DIA_MiltenOW_Mana,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),DIA_MiltenOW_Mana_1);
	Info_AddChoice(DIA_MiltenOW_Mana,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),DIA_MiltenOW_Mana_5);
};


instance DIA_MiltenOW_Perm(C_Info)
{
	npc = PC_Mage_OW;
	nr = 101;
	condition = DIA_MiltenOW_Perm_Condition;
	information = DIA_MiltenOW_Perm_Info;
	permanent = TRUE;
	description = "Co tady máš za úkol?";
};


func int DIA_MiltenOW_Perm_Condition()
{
	if((Kapitel == 2) && (Npc_KnowsInfo(other,DIA_MiltenOW_Frei) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Perm_Info()
{
	AI_Output(other,self,"DIA_MiltenOW_Perm_15_00");	//Co tady máš za úkol?
	AI_Output(self,other,"DIA_MiltenOW_Perm_03_01");	//Původně jsem měl provádět rozbor magické rudy. Zatím jsme jí ale moc nedostali.
	AI_Output(self,other,"DIA_MiltenOW_Perm_03_02");	//Teď se soustřeďuji na studium alchymie.
};


instance DIA_MiltenOW_Plan(C_Info)
{
	npc = PC_Mage_OW;
	nr = 101;
	condition = DIA_MiltenOW_Plan_Condition;
	information = DIA_MiltenOW_Plan_Info;
	permanent = TRUE;
	description = "Co máš v plánu?";
};


func int DIA_MiltenOW_Plan_Condition()
{
	if((Kapitel == 2) && Npc_KnowsInfo(other,DIA_MiltenOW_Frei))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Plan_Info()
{
	AI_Output(other,self,"DIA_MiltenOW_Plan_15_00");	//Co máš v plánu?
	AI_Output(self,other,"DIA_MiltenOW_Plan_03_01");	//Vrátím se. Chvíli ještě počkám, ale teď, když je Gorn na svobodě, můžu vyrazit společně s ním.
	AI_Output(self,other,"DIA_MiltenOW_Plan_03_02");	//Je naprosto nezbytné, aby se Pyrokar dozvěděl, jak to tady vypadá.
	AI_Output(other,self,"DIA_MiltenOW_Plan_15_03");	//Když myslíš.
	AI_Output(self,other,"DIA_MiltenOW_Plan_03_04");	//Doufám, že lord Hagen rozpozná, co za hrozbu vychází z tohoto údolí. Lepší si nepředstavovat, co by se stalo, kdyby skřeti přešli přes průsmyk.
	AI_Output(other,self,"DIA_MiltenOW_Plan_15_05");	//No, v tom případě ti přeju bezpečnou cestu.
};

instance DIA_MiltenOW_Baby(C_Info)
{
	npc = PC_Mage_OW;
	nr = 101;
	condition = DIA_MiltenOW_Baby_Condition;
	information = DIA_MiltenOW_Baby_Info;
	permanent = FALSE;
	description = "Mám pro tebe zvláštní prosbu.";
};

func int DIA_MiltenOW_Baby_Condition()
{
	if((Kapitel < 3) && (MIS_BrutusBaby == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Baby_Info()
{
	AI_Output(other,self,"DIA_MiltenOW_Baby_01_00");	//Mám pro tebe zvláštní prosbu.
	AI_Output(self,other,"DIA_MiltenOW_Baby_01_01");	//Tak mluv, víš pro kamaráda udělám vždy co bude v mích silách.
	AI_Output(other,self,"DIA_MiltenOW_Baby_01_02");	//Jeden chlápek z hradu... mě požádal, abych tě požádal, abys vyčaroval ženu pro něj a jeho kamarády.
	AI_Output(other,self,"DIA_MiltenOW_Baby_01_03");	//No víš co tím myslím.
	AI_Output(self,other,"DIA_MiltenOW_Baby_01_04");	//(zmatený) Po pravdě řečeno bych od tebe nečekal takový zvěrstva.
	AI_Output(other,self,"DIA_MiltenOW_Baby_01_05");	//Takže jim můžeš pomoct?
	AI_Output(self,other,"DIA_MiltenOW_Baby_01_06");	//No... Já jsem v takových případech... ne příliš zkušený. Ale když se ptáš, zkusím něco vymyslet.
	AI_Output(other,self,"DIA_MiltenOW_Baby_01_07");	//Vynikající! Jsem si jistý že kluci budou prostě přešťastný. Kdy to bude?
	AI_Output(self,other,"DIA_MiltenOW_Baby_01_08");	//Myslím že zítra večer, ne dříve. Musím se dobře připravit.
	AI_Output(other,self,"DIA_MiltenOW_Baby_01_09");	//Tak předem děkuju.
	B_LogEntry(TOPIC_BrutusBaby,"Je ironií že Milten souhlasil že pomůže. Podle něj se v odpoledních hodinách zítra připraví a potom vykouzlí krásku.");
	AI_StopProcessInfos(self);
};

instance DIA_MiltenOW_Baby_Done(C_Info)
{
	npc = PC_Mage_OW;
	nr = 101;
	condition = DIA_MiltenOW_Baby_Done_Condition;
	information = DIA_MiltenOW_Baby_Done_Info;
	permanent = FALSE;
	description = "Všechno připraveno?";
};

func int DIA_MiltenOW_Baby_Done_Condition()
{
	if((Kapitel < 3) && (MIS_BrutusBaby == LOG_Running) && (BrutusGoParty == TRUE) && (BrutusGoPartyNever == FALSE) && (Npc_GetDistToWP(self,"OC_DRAGO") <= 500))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Baby_Done_Info()
{
	AI_Output(other,self,"DIA_MiltenOW_Baby_Done_01_00");	//Všechno připraveno?
	AI_Output(self,other,"DIA_MiltenOW_Baby_Done_01_01");	//Ano, všechny přípravky jsou dokončeny. Zbývá jen přečíst kouzlo.
	AI_Output(other,self,"DIA_MiltenOW_Baby_Done_01_02");	//Tak ho přečti.
	AI_Output(self,other,"DIA_MiltenOW_Baby_Done_01_03");	//Je lepší to udělat takhle protože musím udržovat koncentraci během toho všeho.
	AI_Output(self,other,"DIA_MiltenOW_Baby_Done_01_04");	//Tady, vem si tenhle svitek, mluví za vše.
	B_GiveInvItems(self,other,ItWr_MiltenSummon,1);
	AI_Output(other,self,"DIA_MiltenOW_Baby_Done_01_05");	//Dobře, pojď sem.
	Info_ClearChoices(DIA_MiltenOW_Baby_Done);
	Info_AddChoice(DIA_MiltenOW_Baby_Done,"Použít svitek...",DIA_MiltenOW_Baby_Done_Do);
};

func void DIA_MiltenOW_Baby_Done_Do()
{
	B_GivePlayerXP(500);
	Npc_RemoveInvItems(other,ItWr_MiltenSummon,1);
	B_HeroUseFakeScroll();
	MIS_BrutusBaby = LOG_Success;
	Log_SetTopicStatus(TOPIC_BrutusBaby,LOG_Success);
	B_LogEntry(TOPIC_BrutusBaby,"Vypadá to že Milten něco zpackal v kouzle. Místo krásných dívek uprostřed obrovského pentagramu se objevil arcidémon. Nicméně je to neškodné.");
	MiltenSummon = TRUE;
	AI_StopProcessInfos(self);
	Wld_InsertNpc(Demon_Lord_Milten,"OC_MAGE_CENTER");
};
