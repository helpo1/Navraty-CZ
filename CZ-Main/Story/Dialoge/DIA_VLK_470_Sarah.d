
instance DIA_Sarah_EXIT(C_Info)
{
	npc = VLK_470_Sarah;
	nr = 999;
	condition = DIA_Sarah_EXIT_Condition;
	information = DIA_Sarah_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Sarah_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Sarah_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Sarah_PICKPOCKET(C_Info)
{
	npc = VLK_470_Sarah;
	nr = 900;
	condition = DIA_Sarah_PICKPOCKET_Condition;
	information = DIA_Sarah_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Sarah_PICKPOCKET_Condition()
{
	return C_Beklauen(57,60);
};

func void DIA_Sarah_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Sarah_PICKPOCKET);
	Info_AddChoice(DIA_Sarah_PICKPOCKET,Dialog_Back,DIA_Sarah_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Sarah_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Sarah_PICKPOCKET_DoIt);
};

func void DIA_Sarah_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Sarah_PICKPOCKET);
};

func void DIA_Sarah_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Sarah_PICKPOCKET);
};


instance DIA_Sarah_Greet(C_Info)
{
	npc = VLK_470_Sarah;
	nr = 1;
	condition = DIA_Sarah_Greet_Condition;
	information = DIA_Sarah_Greet_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Sarah_Greet_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Canthar_Ausgeliefert == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Sarah_Greet_Info()
{
	AI_Output(self,other,"DIA_Sarah_Add_16_07");	//Á! To jsi zase ty!
};


instance DIA_Sarah_HALLO(C_Info)
{
	npc = VLK_470_Sarah;
	condition = DIA_Sarah_HALLO_Condition;
	information = DIA_Sarah_HALLO_Info;
	permanent = FALSE;
	description = "Jak jdou obchody?";
};


func int DIA_Sarah_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Sarah_HALLO_Info()
{
	AI_Output(other,self,"DIA_Sarah_HALLO_15_00");	//Jak jdou obchody?
	AI_Output(self,other,"DIA_Sarah_HALLO_16_01");	//Když dorazili paladinové, nejdřív jsem si myslela, že to je příležitost k dobrým obchodům.
	AI_Output(self,other,"DIA_Sarah_HALLO_16_02");	//Ale pak nechali Harada, aby jim vyráběl zbraně, a ani Hakon ani já jsme od nich neviděli ani zlatku.
	AI_Output(self,other,"DIA_Sarah_HALLO_16_03");	//Navíc farmáři už dál nechtějí zásobovat město potravinami, a všechny ceny tak jdou nahoru.
	AI_Output(self,other,"DIA_Sarah_Add_16_00");	//Že mi paladinové platí hotel, je jen slabou útěchou.
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,"Sarah prodává na tržišti zbraně.");
};


instance DIA_Sarah_Bauern(C_Info)
{
	npc = VLK_470_Sarah;
	nr = 2;
	condition = DIA_Sarah_Bauern_Condition;
	information = DIA_Sarah_Bauern_Info;
	permanent = FALSE;
	description = "Co je s farmáři za problémy?";
};


func int DIA_Sarah_Bauern_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Sarah_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Sarah_Bauern_Info()
{
	AI_Output(other,self,"DIA_Sarah_Bauern_15_00");	//Co je s farmáři za problémy?
	AI_Output(self,other,"DIA_Sarah_Bauern_16_01");	//Odmítají dovážet své zboží.
	AI_Output(self,other,"DIA_Sarah_Bauern_16_02");	//Teď, když už sem nepřiplouvají žádné lodě, je město samozřejmě závislé jen na tom, co poskytnou farmáři.
	AI_Output(self,other,"DIA_Sarah_Bauern_16_03");	//A Onar, ten největší z farmářů, si najal žoldáky, aby chránili jeho farmu před městskou stráží. Jinak by si domobrana všechno zabrala pro sebe.
	AI_Output(self,other,"DIA_Sarah_Add_16_01");	//Ale ti žoldáci nechrání jenom Onarovu farmu.
	AI_Output(self,other,"DIA_Sarah_Add_16_02");	//Zašli tak daleko, že zastrašují i malé farmáře tady u města.
	AI_Output(self,other,"DIA_Sarah_Add_16_03");	//Viděla jsem je, když jsem procházela přes Akilovu farmu. Nechtěla bych teď být v jeho kůži.
};


instance DIA_Sarah_AkilsHof(C_Info)
{
	npc = VLK_470_Sarah;
	nr = 3;
	condition = DIA_Sarah_AkilsHof_Condition;
	information = DIA_Sarah_AkilsHof_Info;
	permanent = FALSE;
	description = "Kde najdu Akilovu farmu?";
};


func int DIA_Sarah_AkilsHof_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Sarah_Bauern))
	{
		return TRUE;
	};
};

func void DIA_Sarah_AkilsHof_Info()
{
	AI_Output(other,self,"DIA_Sarah_AkilsHof_15_00");	//Kde najdu Akilovu farmu?
	AI_Output(self,other,"DIA_Sarah_Add_16_04");	//Pokud odejdeš východní bránou a dáš se cestou napravo, dostaneš se ke schodišti.
	AI_Output(self,other,"DIA_Sarah_Add_16_05");	//To vede nahoru k Akilově farmě.
	AI_Output(self,other,"DIA_Sarah_Add_16_06");	//Ale já bych tam teď nechodila - určitě tam ještě pořád jsou žoldáci.
};


instance DIA_Sarah_Trade(C_Info)
{
	npc = VLK_470_Sarah;
	nr = 99;
	condition = DIA_Sarah_Trade_Condition;
	information = DIA_Sarah_Trade_Info;
	trade = TRUE;
	permanent = TRUE;
	description = "Ukaž mi své zboží.";
};

func int DIA_Sarah_Trade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Sarah_HALLO) && Wld_IsTime(5,15,20,15) && (Sarah_Ausgeliefert == FALSE) && (SARAFLEE == FALSE) && (SARAISDEAD == FALSE))
	{
		return TRUE;
	};
	if((SARAHELPYOUDONE == TRUE) && Wld_IsTime(5,15,20,15))
	{
		return TRUE;
	};
};

func void DIA_Sarah_Trade_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Sarah_Trade_15_00");	//Ukaž mi své zboží.
	B_GiveTradeInv(self);
	Sarah_WaffenGesehen = TRUE;
};


instance DIA_Sarah_IMKNAST(C_Info)
{
	npc = VLK_470_Sarah;
	nr = 99;
	condition = DIA_Sarah_IMKNAST_Condition;
	information = DIA_Sarah_IMKNAST_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Sarah_IMKNAST_Condition()
{
	if((Sarah_Ausgeliefert == TRUE) && Npc_IsInState(self,ZS_Talk) && (SARAISFREE == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sarah_IMKNAST_Info()
{
	AI_Output(self,other,"DIA_Sarah_IMKNAST_16_00");	//Ty! Ty máš tu drzost tady ještě ukázat svůj ksicht! Nemůžu to dokázat, ale vsadím se, že jsi namočenej do pěkně špinavý hry.
	AI_Output(self,other,"DIA_Sarah_IMKNAST_16_01");	//Je to tvoje chyba, že jsem tady. Tvoje a toho zatracenýho Canthara - ať vás Innos ztrestá!
	Npc_RemoveInvItems(self,ItWr_Canthars_KomproBrief_MIS,Npc_HasItems(self,ItWr_Canthars_KomproBrief_MIS));
	AI_StopProcessInfos(self);
};


instance DIA_Sarah_Success(C_Info)
{
	npc = VLK_470_Sarah;
	nr = 4;
	condition = DIA_Sarah_Success_Condition;
	information = DIA_Sarah_Success_Info;
	permanent = FALSE;
	description = "Canthar se tě snažil obelstít...";
};


func int DIA_Sarah_Success_Condition()
{
	if((Canthar_Ausgeliefert == TRUE) && (Canthar_WiederRaus == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sarah_Success_Info()
{
	AI_Output(other,self,"DIA_Sarah_Success_15_00");	//Canthar se tě pokusil podvést a získat tvůj stánek pro sebe. Ale já jsem ho předhodil městským strážím.
	AI_Output(self,other,"DIA_Sarah_Success_16_01");	//Tak to sis znepřátelil nebezpečného muže. Znám toho bastarda už pěkně dlouho, a vždycky chtěl můj stánek pro sebe.
	AI_Output(self,other,"DIA_Sarah_Success_16_02");	//Vezmi si tuhle zbraň jako vyjádření mé vděčnosti.
	B_GivePlayerXP(XP_CantharImKnast);
	B_GiveInvItems(self,other,ItMw_Piratensaebel,1);
	SARAKNOWSABOUTCANTHAR = TRUE;
};


instance DIA_SARAH_FLEE(C_Info)
{
	npc = VLK_470_Sarah;
	nr = 4;
	condition = dia_sarah_flee_condition;
	information = dia_sarah_flee_info;
	permanent = FALSE;
	description = "Jsi v pořádku?";
};

func int dia_sarah_flee_condition()
{
	if(SARAFLEE == TRUE)
	{
		return TRUE;
	};
};

func void dia_sarah_flee_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Sarah_Flee_15_00");	//Jsi v pořádku?
	AI_Output(self,other,"DIA_Sarah_Flee_16_01");	//Je dobře, že jsi mě minule varoval. Už bych nemusela žít!
	AI_Output(self,other,"DIA_Sarah_Flee_16_02");	//Canthar byl z vězení propuštěn a tak jsem vzala nohy na ramena. Teď už mám plné zuby města.
	AI_Output(self,other,"DIA_Sarah_Flee_16_03");	//Akorát nevím, co mám dělat. Tady se obchodu nedaří.
	AI_Output(self,other,"DIA_Sarah_Flee_16_04");	//V každém případě ti patří mé díky.
};

instance DIA_SARAH_RETURN(C_Info)
{
	npc = VLK_470_Sarah;
	nr = 4;
	condition = dia_sarah_return_condition;
	information = dia_sarah_return_info;
	permanent = FALSE;
	description = "Můžeš se vrátit na tržiště.";
};

func int dia_sarah_return_condition()
{
	if((SARAFLEE == TRUE) && (SARAAGREE == FALSE) && (Npc_IsDead(Canthar) == TRUE) && (SARAHELPYOU == FALSE))
	{
		return TRUE;
	};
};

func void dia_sarah_return_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Sarah_Return_01_00");	//Můžeš se vrátit na tržiště.
	AI_Output(self,other,"DIA_Sarah_Return_01_01");	//Ale... ale jako hned vedle Canthara?!... (nechápavě) Pokud mě zmerčí... Nedokážu si představit, co se mnou udělá!
	AI_Output(other,self,"DIA_Sarah_Return_01_02");	//O Canthara se nestarej. Měl menší nehodu.
	AI_Output(other,self,"DIA_Sarah_Return_01_03");	//Teď je tvé místo znovu volné.
	AI_Output(self,other,"DIA_Sarah_Return_01_04");	//Opravdu?!... (nevěřícně) To mu patří parchantovi. Zaslouží si to bastard jeden!
	AI_Output(self,other,"DIA_Sarah_Return_01_05");	//Nicméně tady raději zůstanu. Mám z tržiště husí kůži.
	AI_Output(self,other,"DIA_Sarah_Return_01_07");	//Tak jako tak, děkuju ti, žes mě potěšil. Tohle se nestává často...
};


instance DIA_SARAH_AFTERIMKNAST(C_Info)
{
	npc = VLK_470_Sarah;
	nr = 99;
	condition = dia_sarah_afterimknast_condition;
	information = dia_sarah_afterimknast_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_sarah_afterimknast_condition()
{
	if((SARAHELPYOUANDFREE == TRUE) && (SARAISFREE == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_sarah_afterimknast_info()
{
	AI_Output(self,other,"DIA_Sarah_AfterImKnast_01_00");	//Áh! To jsi ty, parchante?!
	AI_Output(self,other,"DIA_Sarah_AfterImKnast_01_01");	//Ty můžeš za to, že mě zavřeli. Ty a ten proradný Canthar!... 
	AI_Output(self,other,"DIA_Sarah_AfterImKnast_01_02");	//Teď si všichni lidé okolo myslí, že jsem hnusná zlodějka, ne poctivá obchodnice.
	AI_Output(self,other,"DIA_Sarah_AfterImKnast_01_04");	//Nechci s tebou mluvit, ty hovado!
	AI_Output(other,self,"DIA_Sarah_AfterImKnast_01_05");	//Ale zadrž... Alespoň mě vyslechni!
	AI_Output(self,other,"DIA_Sarah_AfterImKnast_01_06");	//A co mi chceš říct, než ti začnu plivat do ksichtu?!... 
	AI_Output(other,self,"DIA_Sarah_AfterImKnast_01_07");	//Pro začátek bys měla vědět, že jsem to byl já, kdo tě vytáhl z vězení!
	AI_Output(self,other,"DIA_Sarah_AfterImKnast_01_08");	//COŽE?! Tak tos byl ty?!... 
	AI_Output(other,self,"DIA_Sarah_AfterImKnast_01_09");	//Zaplatil jsem za tebe pokutu a lord Andre tě propustil.
	AI_Output(self,other,"DIA_Sarah_AfterImKnast_01_12");	//Nejdřív mě necháš odvést do vězení a pak mě od tamtud vytáhneš? Zbláznil ses?!
	AI_Output(self,other,"DIA_Sarah_AfterImKnast_01_14");	//Co má tohle všechno znamenat?
	Npc_RemoveInvItems(self,ItWr_Canthars_KomproBrief_MIS,Npc_HasItems(self,ItWr_Canthars_KomproBrief_MIS));
	Info_ClearChoices(dia_sarah_afterimknast);
	Info_AddChoice(dia_sarah_afterimknast,"Nemám ti co říct.",dia_sarah_afterimknast_unknown);
	Info_AddChoice(dia_sarah_afterimknast,"Omlouvám se ti za, to co jsem udělal.",dia_sarah_afterimknast_sorry);
	Info_AddChoice(dia_sarah_afterimknast,"Pochop, neměl jsem na výběr.",dia_sarah_afterimknast_nochoice);
};

func void dia_sarah_afterimknast_unknown()
{
	AI_Output(other,self,"DIA_Sarah_AfterImKnast_Unknown_01_00");	//Nemám ti co říct.
	AI_Output(self,other,"DIA_Sarah_AfterImKnast_Unknown_01_01");	//Věděla jsem to!...
	AI_Output(self,other,"DIA_Sarah_AfterImKnast_Unknown_01_03");	//Takoví lidé jako ty jednoduše nemají co říct. Tak a je to jasné!
	AI_Output(self,other,"DIA_Sarah_AfterImKnast_Unknown_01_04");	//Takže bude lepší, když se mi sklidíš z očí!...
	B_LogEntry(TOPIC_SARAHTOGUILD,"Pokusil jsem se promluvit se Sarah, ale nechtěla mě poslouchat. Asi bych se měl vrátit k Luterovi a probrat to s ním.");
	SARAPISSOFF = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_sarah_afterimknast_sorry()
{
	AI_Output(other,self,"DIA_Sarah_AfterImKnast_Sorry_01_00");	//Omlouvám se ti za, to co jsem udělal.
	AI_Output(other,self,"DIA_Sarah_AfterImKnast_Sorry_01_02");	//Věř mi, je mi velmi líto, že se to stalo a chci se omluvit.
	AI_Output(self,other,"DIA_Sarah_AfterImKnast_Sorry_01_03");	//Opravdu?! Hmmm... (nevěřícně) Jsem překvapena, že to dokážeš vůbec přiznat.
	AI_Output(self,other,"DIA_Sarah_AfterImKnast_Sorry_01_05");	//Dobrá! Tentokrát ti budu věřit a přijmu tvou omluvu.
	AI_Output(self,other,"DIA_Sarah_AfterImKnast_Sorry_01_06");	//Nicméně to neznamená, že jsem přátelé. Doufám, že tomu rozumíš!
	B_LogEntry(TOPIC_SARAHTOGUILD,"Zkusil jsem mluvit se Sarah a navázat s ní dobré vztahy. Myslím, že se to trochu povedlo. Mám však dojem, že budu muset s Luterovou nabídkou chvíli počkat, než Sarah přijde k rozumu. Po tom všem, co se stalo, se zdá, že mi pořád ještě nedůvěřuje. Asi bych si měl nejdřív získat její důvěru.");
	SARAPROOFBEFRIEND = TRUE;
	SARAHELPYOU = TRUE;
	Info_ClearChoices(dia_sarah_afterimknast);
};

func void dia_sarah_afterimknast_nochoice()
{
	AI_Output(other,self,"DIA_Sarah_AfterImKnast_NoChoice_01_00");	//Pochop, neměl jsem na výběr. Canthar mě vydíral!
	AI_Output(self,other,"DIA_Sarah_AfterImKnast_NoChoice_01_02");	//A proto ses rozhodl, že bude lepší předat jí mě... (naštvaně) No ty jsi darebák!
	AI_Output(self,other,"DIA_Sarah_AfterImKnast_NoChoice_01_03");	//Víš, co ti na to řeknu? Jsi člověk, který nemá žádnou čest ani důstojnost!
	AI_Output(self,other,"DIA_Sarah_AfterImKnast_NoChoice_01_04");	//Jsem překvapena, že ještě máš svědomí zaplatiti za mě pokutu.
	AI_Output(self,other,"DIA_Sarah_AfterImKnast_NoChoice_01_05");	//No, myslím, že ani to ne. Asi ode mně něco chceš.
	AI_Output(self,other,"DIA_Sarah_AfterImKnast_NoChoice_01_06");	//Nemám pravdu?
	Info_ClearChoices(dia_sarah_afterimknast);
	Info_AddChoice(dia_sarah_afterimknast,"Ne! Prostě jsem se rozhodl napravit svou chybu.",dia_sarah_afterimknast_no);
	Info_AddChoice(dia_sarah_afterimknast,"No, vlastně ano. Něco bych potřeboval.",dia_sarah_afterimknast_yes);
};

func void dia_sarah_afterimknast_yes()
{
	AI_Output(other,self,"DIA_Sarah_AfterImKnast_Yes_01_00");	//No, vlastně ano. Něco bych potřeboval.
	AI_Output(self,other,"DIA_Sarah_AfterImKnast_Yes_01_02");	//Ale víš, co ti na to povím? Nebudu se paktovat s darebákem, jako jsi ty!
	AI_Output(self,other,"DIA_Sarah_AfterImKnast_Yes_01_03");	//Takže se mi kliď z očí! 
	B_LogEntry(TOPIC_SARAHTOGUILD,"Zkusil jsem promluvit si se Sarah, ale nechce mě poslouchat. Asi bych se měl vrátit za Luterem a sdělit mu to.");
	SARAPISSOFF = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_sarah_afterimknast_no()
{
	AI_Output(other,self,"DIA_Sarah_AfterImKnast_No_01_00");	//Ne! Prostě jsem se rozhodl napravit svou chybu.
	AI_Output(other,self,"DIA_Sarah_AfterImKnast_No_01_01");	//Věř mi. Mrzí mě, že to takhle dopadlo a chci se ti omluvit.
	AI_Output(self,other,"DIA_Sarah_AfterImKnast_No_01_03");	//Tentokrát ti budu věřit a omluvu přijímám.
	AI_Output(self,other,"DIA_Sarah_AfterImKnast_No_01_04");	//Ale to pořád neznamená, že jsem přátelé. Doufám, žes tomu rozuměl!
	B_LogEntry(TOPIC_SARAHTOGUILD,"Zkusil jsem mluvit se Sarah a navázat s ní dobré vztahy. Myslím, že se to trochu povedlo. Mám však dojem, že budu muset s Luterovou nabídkou chvíli počkat, než Sarah přijde k rozumu. Po tom všem, co se stalo, se zdá, že mi pořád ještě nedůvěřuje. Asi bych si měl nejdřív získat její důvěru.");
	SARAPROOFBEFRIEND = TRUE;
	SARAHELPYOU = TRUE;
	Info_ClearChoices(dia_sarah_afterimknast);
};


instance DIA_SARAH_FUCKOFF(C_Info)
{
	npc = VLK_470_Sarah;
	nr = 10;
	condition = dia_sarah_fuckoff_condition;
	information = dia_sarah_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_sarah_fuckoff_condition()
{
	if((SARAPISSOFF == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_sarah_fuckoff_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
};


instance DIA_SARAH_SARAHELPSONE(C_Info)
{
	npc = VLK_470_Sarah;
	nr = 4;
	condition = dia_sarah_sarahelpsone_condition;
	information = dia_sarah_sarahelpsone_info;
	permanent = FALSE;
	description = "Vypadáš sklesle.";
};


func int dia_sarah_sarahelpsone_condition()
{
	if((MIS_SARAHTOGUILD == LOG_Running) && (SARAPROOFBEFRIEND == TRUE) && (SARAREFUSEHELPS == FALSE))
	{
		return TRUE;
	};
};

func void dia_sarah_sarahelpsone_info()
{
	AI_Output(other,self,"DIA_Sarah_SaraHelpsOne_01_00");	//Vypadáš sklesle.
	AI_Output(self,other,"DIA_Sarah_SaraHelpsOne_01_01");	//To je možné... (smutně) Celý den jsem nejedla a mám strašný hlad!
	AI_Output(self,other,"DIA_Sarah_SaraHelpsOne_01_03");	//Ráda bych, ale nemám na jídlo peníze.
	AI_Output(self,other,"DIA_Sarah_SaraHelpsOne_01_05");	//Takže krom toho, že pořád nemám žádnou práci, budu muset hladovět.
	Info_ClearChoices(dia_sarah_sarahelpsone);
	Info_AddChoice(dia_sarah_sarahelpsone,"Na tohle nemám čas.",dia_sarah_sarahelpsone_no);
	Info_AddChoice(dia_sarah_sarahelpsone,"Přinesu ti něco k jídlu.",dia_sarah_sarahelpsone_yes);
};

func void dia_sarah_sarahelpsone_no()
{
	AI_Output(other,self,"DIA_Sarah_SaraHelpsOne_No_01_00");	//Na tohle nemám čas.
	Info_ClearChoices(dia_sarah_sarahelpsone);
	B_LogEntry(TOPIC_SARAHTOGUILD,"Myslím, že Sarah se mnou nechce mluvit o Luterově nabídce.");
	SARAREFUSEHELPS = TRUE;
};

func void dia_sarah_sarahelpsone_yes()
{
	AI_Output(other,self,"DIA_Sarah_SaraHelpsOne_Yes_01_01");	//Přinesu ti něco k jídlu.
	AI_Output(self,other,"DIA_Sarah_SaraHelpsOne_Yes_01_02");	//Děkuju!... (usmívá se)
	AI_Output(self,other,"DIA_Sarah_SaraHelpsOne_Yes_01_03");	//Myslím, že dva kousky pečeného masa a láhev mléka mi budou stačit.
	Info_ClearChoices(dia_sarah_sarahelpsone);
	MIS_SARAHELPSONE = LOG_Running;
	Log_CreateTopic(TOPIC_SARAHELPSONE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SARAHELPSONE,LOG_Running);
	B_LogEntry(TOPIC_SARAHELPSONE,"Sarah je velmi hladová a tak jsem se rozhodl, že ji pomohu a přinesu ji nějaké jídlo. Chce dva kusy pečeného masa a láhev mléka.");
};


instance DIA_SARAH_SARAHELPSONEDONE(C_Info)
{
	npc = VLK_470_Sarah;
	nr = 4;
	condition = dia_sarah_sarahelpsonedone_condition;
	information = dia_sarah_sarahelpsonedone_info;
	permanent = FALSE;
	description = "Něco jsem ti přinesl.";
};


func int dia_sarah_sarahelpsonedone_condition()
{
	if((MIS_SARAHELPSONE == LOG_Running) && (SARAPROOFBEFRIEND == TRUE) && (Npc_HasItems(hero,ItFoMutton) >= 2) && (Npc_HasItems(hero,ItFo_Milk) >= 1))
	{
		return TRUE;
	};
};

func void dia_sarah_sarahelpsonedone_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Sarah_SaraHelpsOneDone_01_00");	//Něco jsem ti přinesl. Tady, ber!
	AI_Output(self,other,"DIA_Sarah_SaraHelpsOneDone_01_01");	//Děkuju ti! 
	Npc_RemoveInvItems(other,ItFoMutton,2);
	Npc_RemoveInvItems(other,ItFo_Milk,1);
	CreateInvItems(self,ItFoMutton,2);
	CreateInvItems(self,ItFo_Milk,1);
	AI_Output(self,other,"DIA_Sarah_SaraHelpsOneDone_01_02");	//Tohle jídlo mi na nějakou chvíli stačí.
	B_UseItem(self,ItFoMutton);
	AI_Output(self,other,"DIA_Sarah_SaraHelpsOneDone_01_03");	//Mmmm... (s potěšením) A je tak dobré!
	B_UseItem(self,ItFo_Milk);
	AI_Output(self,other,"DIA_Sarah_SaraHelpsOneDone_01_04");	//Po těch odporných jídlech ve vězení mi připadá, že tohle je jídlo bohů!
	MIS_SARAHELPSONE = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_SARAHELPSONE,LOG_SUCCESS);
	B_LogEntry(TOPIC_SARAHELPSONE,"Přinesl jsem Sarah trochu jídla.");
	SARAHELPSONEDONE = TRUE;
	if((MIS_SARAHTOGUILD == LOG_Running) && (SARAHELPSONEDONE == TRUE) && (SARAHELPSTWODONE == TRUE) && (SARAHELPSTHREEDONE == TRUE) && (SARABEFRIEND == FALSE))
	{
		AI_Output(self,other,"DIA_Sarah_SaraHelpsOneDone_01_06");	//Víš, po tom všem, co jsi pro mě udělal... Myslím, že ti mohu důvěřovat.
		AI_Output(self,other,"DIA_Sarah_SaraHelpsOneDone_01_07");	//Koneckonců, parchant jako je Canthar, by takhle nikdy nejednal. A ty jsi mi pomohl v této těžké situaci!
		AI_Output(self,other,"DIA_Sarah_SaraHelpsOneDone_01_08");	//Jsi dobrý člověk, takže na ten incident zapomeneme.
		SARABEFRIEND = TRUE;
		Log_AddEntry(TOPIC_SARAHTOGUILD,"Vypadá to, že Sarah mi už teď věří a myslí si, že jsem dobrá osoba. Myslím, že je načase si s ní pohovořit o návrhu od Lutera.");
	};
};


instance DIA_SARAH_SARAHELPSTWO(C_Info)
{
	npc = VLK_470_Sarah;
	nr = 4;
	condition = dia_sarah_sarahelpstwo_condition;
	information = dia_sarah_sarahelpstwo_info;
	permanent = FALSE;
	description = "Něco tě znepokojuje?";
};


func int dia_sarah_sarahelpstwo_condition()
{
	if((MIS_SARAHTOGUILD == LOG_Running) && (SARAPROOFBEFRIEND == TRUE) && (SARAREFUSEHELPS == FALSE))
	{
		return TRUE;
	};
};

func void dia_sarah_sarahelpstwo_info()
{
	AI_Output(other,self,"DIA_Sarah_SaraHelpsTwo_01_00");	//Něco tě znepokojuje?
	AI_Output(self,other,"DIA_Sarah_SaraHelpsTwo_01_03");	//Měla jsem sebou jednu věc - vzácný rodinný prsten, který mi dali rodiče na památku.
	AI_Output(self,other,"DIA_Sarah_SaraHelpsTwo_01_04");	//Ale když jsem byla ve vězení, jeden z domobránců mi ho vzal!
	AI_Output(self,other,"DIA_Sarah_SaraHelpsTwo_01_05");	//Parchant! Ještě teď si pamatuju, jak mi ten ksindl ten prsten strhl z mého prstu! 
	AI_Output(self,other,"DIA_Sarah_SaraHelpsTwo_01_13");	//A stejně si nemyslím, že by mi ten prsten vrátil.
	Info_ClearChoices(dia_sarah_sarahelpstwo);
	Info_AddChoice(dia_sarah_sarahelpstwo,"Nemám na tohle čas.",dia_sarah_sarahelpstwo_no);
	Info_AddChoice(dia_sarah_sarahelpstwo,"Přinesu ti ten prsten.",dia_sarah_sarahelpstwo_yes);
};

func void dia_sarah_sarahelpstwo_no()
{
	AI_Output(other,self,"DIA_Sarah_SaraHelpsOne_No_01_00");	//Na tohle nemám čas.
	Info_ClearChoices(dia_sarah_sarahelpstwo);
	B_LogEntry(TOPIC_SARAHTOGUILD,"Myslím, že Sarah se mnou nebude chtít mluvit o Luterově nabídce.");
	SARAREFUSEHELPS = TRUE;
};

func void dia_sarah_sarahelpstwo_yes()
{
	AI_Output(other,self,"DIA_Sarah_SaraHelpsTwo_Yes_01_00");	//Přinesu ti ten prsten.
	AI_Output(self,other,"DIA_Sarah_SaraHelpsTwo_Yes_01_01");	//Opravdu?!... (usmívá se) To by bylo od tebe velmi laskavé!
	AI_Output(self,other,"DIA_Sarah_SaraHelpsTwo_Yes_01_02");	//Myslím, že domobránce, který mi ten prsten vzal, se jmenoval Boltan.
	AI_Output(self,other,"DIA_Sarah_SaraHelpsTwo_Yes_01_03");	//Jen buď opatrný. Pořád je to hovado.
	Info_ClearChoices(dia_sarah_sarahelpstwo);
	MIS_SARAHELPSTWO = LOG_Running;
	Log_CreateTopic(TOPIC_SARAHELPSTWO,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SARAHELPSTWO,LOG_Running);
	B_LogEntry(TOPIC_SARAHELPSTWO,"Sarah je velmi smutná. Jeden z domobránců jménem Boltan ji vzal rodinný prsten, který kdysi dostala od svých rodičů. Sarah by ho moc ráda chtěla zpět. Souhlasil jsem, že ji pomohu.");
};


instance DIA_SARAH_SARAHELPSTWODONE(C_Info)
{
	npc = VLK_470_Sarah;
	nr = 4;
	condition = dia_sarah_sarahelpstwodone_condition;
	information = dia_sarah_sarahelpstwodone_info;
	permanent = FALSE;
	description = "Přinesl jsem ti tvůj prsten!";
};


func int dia_sarah_sarahelpstwodone_condition()
{
	if((MIS_SARAHELPSTWO == LOG_Running) && (SARAPROOFBEFRIEND == TRUE) && (Npc_HasItems(hero,itri_sarafamilyring) >= 1))
	{
		return TRUE;
	};
};

func void dia_sarah_sarahelpstwodone_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Sarah_SaraHelpsTwoDone_01_00");	//Přinesl jsem ti tvůj prsten!
	B_GiveInvItems(other,self,itri_sarafamilyring,1);
	AI_Output(self,other,"DIA_Sarah_SaraHelpsTwoDone_01_03");	//Innosi! Jsem ti tak vděčná!
	AI_Output(self,other,"DIA_Sarah_SaraHelpsTwoDone_01_04");	//Nicméně nevím, jak ti mám poděkovat... 
	AI_Output(self,other,"DIA_Sarah_SaraHelpsTwoDone_01_06");	//Děkuju ti!
	MIS_SARAHELPSTWO = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_SARAHELPSTWO,LOG_SUCCESS);
	B_LogEntry(TOPIC_SARAHELPSTWO,"Přinesl jsem Sarah rodinný prsten. Byla šťastná.");
	SARAHELPSTWODONE = TRUE;
	if((MIS_SARAHTOGUILD == LOG_Running) && (SARAHELPSONEDONE == TRUE) && (SARAHELPSTWODONE == TRUE) && (SARAHELPSTHREEDONE == TRUE) && (SARABEFRIEND == FALSE))
	{
		AI_Output(self,other,"DIA_Sarah_SaraHelpsTwoDone_01_07");	//Víš, po tom všem, co jsi pro mě udělal... Myslím, že ti mohu důvěřovat.
		AI_Output(self,other,"DIA_Sarah_SaraHelpsTwoDone_01_08");	//Koneckonců, parchant jako je Canthar, by takhle nikdy nejednal. A ty jsi mi pomohl v této těžké situaci!
		AI_Output(self,other,"DIA_Sarah_SaraHelpsTwoDone_01_09");	//Jsi dobrý člověk, takže na ten incident zapomeneme.
		SARABEFRIEND = TRUE;
		Log_AddEntry(TOPIC_SARAHTOGUILD,"Vypadá to, že Sarah mi už teď věří a myslí si, že jsem dobrá osoba. Myslím, že je načase si s ní pohovořit o návrhu od Lutera.");
	};
};


instance DIA_SARAH_SARAHELPSTHREE(C_Info)
{
	npc = VLK_470_Sarah;
	nr = 4;
	condition = dia_sarah_sarahelpsthree_condition;
	information = dia_sarah_sarahelpsthree_info;
	permanent = FALSE;
	description = "Můžu ještě s něčím pomoct?";
};


func int dia_sarah_sarahelpsthree_condition()
{
	if((MIS_SARAHTOGUILD == LOG_Running) && (SARAREFUSEHELPS == FALSE) && (SARAPROOFBEFRIEND == TRUE) && ((SARAHELPSTWODONE == TRUE) || (SARAHELPSONEDONE == TRUE)))
	{
		return TRUE;
	};
};

func void dia_sarah_sarahelpsthree_info()
{
	AI_Output(other,self,"DIA_Sarah_SaraHelpsThree_01_00");	//Můžu ještě s něčím pomoct?
	AI_Output(self,other,"DIA_Sarah_SaraHelpsThree_01_05");	//Myslím, že ještě pořád dlužím Haradovi nějaké peníze za poslední zásilku zbraní.
	AI_Output(self,other,"DIA_Sarah_SaraHelpsThree_01_06");	//Jenže pak nebyl čas na splacení dluhu. Navíc teď nemám ani zlaťák.
	AI_Output(self,other,"DIA_Sarah_SaraHelpsThree_01_08");	//Jistě, Harad je dobrý člověk a rozumí problémům druhých, ale mě to nijak nepomůže.
	AI_Output(self,other,"DIA_Sarah_SaraHelpsThree_01_09");	//Jsem zvyklá vykonávat vše čestně a vždy včas splatit dluh!
	AI_Output(other,self,"DIA_Sarah_SaraHelpsThree_01_10");	//Jasně, rozumím ti. A co teda mám udělat?
	AI_Output(self,other,"DIA_Sarah_SaraHelpsThree_01_11");	//No, pokud bys mohl za mě splatit Haradovi chybějící částku, byla bych ti opravdu vděčná!
	AI_Output(other,self,"DIA_Sarah_SaraHelpsThree_01_12");	//A kolik ještě dlužíš Haradovi?
	AI_Output(self,other,"DIA_Sarah_SaraHelpsThree_01_13");	//Ta částka není málá - dva tísíce zlatých.
	Info_ClearChoices(dia_sarah_sarahelpsthree);
	Info_AddChoice(dia_sarah_sarahelpsthree,"Promiň, ale to je pro mě moc drahé.",dia_sarah_sarahelpsthree_no);
	Info_AddChoice(dia_sarah_sarahelpsthree,"Vše je v pořádku! Vyrovnám se s tím.",dia_sarah_sarahelpsthree_yes);
};

func void dia_sarah_sarahelpsthree_no()
{
	AI_Output(other,self,"DIA_Sarah_SaraHelpsThree_No_01_00");	//Promiň, ale to je pro mě moc drahé.
	AI_Output(self,other,"DIA_Sarah_SaraHelpsThree_No_01_01");	//Rozumím ti a neobviňuju tě za to.
	Info_ClearChoices(dia_sarah_sarahelpsthree);
	B_LogEntry(TOPIC_SARAHTOGUILD,"Myslím, že Sarah se mnou nebude chtít mluvit o Luterově nabídce.");
	SARAREFUSEHELPS = TRUE;
};

func void dia_sarah_sarahelpsthree_yes()
{
	AI_Output(other,self,"DIA_Sarah_SaraHelpsThree_Yes_01_00");	//Vše je v pořádku! Vyrovnám se s tím.
	AI_Output(self,other,"DIA_Sarah_SaraHelpsThree_Yes_01_01");	//Opravdu to uděláš?!
	AI_Output(self,other,"DIA_Sarah_SaraHelpsThree_Yes_01_03");	//Žehnej ti Innos! Co bych si bez tebe počala?
	AI_Output(other,self,"DIA_Sarah_SaraHelpsThree_Yes_01_05");	//Přecejen se to všechno stalo kvůli mě. Tak to všechno vyřeším.
	AI_Output(self,other,"DIA_Sarah_SaraHelpsThree_Yes_01_06");	//No jak myslíš. Nicméně ti ještě jednou děkuji za tvou pomoc!
	Info_ClearChoices(dia_sarah_sarahelpsthree);
	MIS_SARAHELPSTHREE = LOG_Running;
	Log_CreateTopic(TOPIC_SARAHELPSTHREE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SARAHELPSTHREE,LOG_Running);
	B_LogEntry(TOPIC_SARAHELPSTHREE,"Sarah dluží kováři Haradovi trochu peněz. Nabídl jsem se, že vyřeším ten problém... Za cenu dvou tisíc zlatých!");
};


instance DIA_SARAH_SARAHELPSTHREEDONE(C_Info)
{
	npc = VLK_470_Sarah;
	nr = 4;
	condition = dia_sarah_sarahelpsthreedone_condition;
	information = dia_sarah_sarahelpsthreedone_info;
	permanent = FALSE;
	description = "Splatil jsem Haradovi tvůj dluh.";
};


func int dia_sarah_sarahelpsthreedone_condition()
{
	if((MIS_SARAHELPSTHREE == LOG_Running) && (SARAPROOFBEFRIEND == TRUE) && (SARADOBTPAYED == TRUE))
	{
		return TRUE;
	};
};

func void dia_sarah_sarahelpsthreedone_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Sarah_SaraHelpsThreeDone_01_00");	//Splatil jsem Haradovi tvůj dluh.
	AI_Output(self,other,"DIA_Sarah_SaraHelpsThreeDone_01_01");	//Děkuji. Teď se mu konečně mohu podívat do očí bez studu či bez lítosti.
	AI_Output(self,other,"DIA_Sarah_SaraHelpsThreeDone_01_02");	//Děkuju ti!
	MIS_SARAHELPSTHREE = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_SARAHELPSTHREE,LOG_SUCCESS);
	B_LogEntry(TOPIC_SARAHELPSTHREE,"Sarah mi poděkovala, že jsem Haradovi splatil její dluh.");
	SARAHELPSTHREEDONE = TRUE;
	if((MIS_SARAHTOGUILD == LOG_Running) && (SARAHELPSONEDONE == TRUE) && (SARAHELPSTWODONE == TRUE) && (SARAHELPSTHREEDONE == TRUE) && (SARABEFRIEND == FALSE))
	{
		AI_Output(self,other,"DIA_Sarah_SaraHelpsThreeDone_01_04");	//Víš, po tom všem, co jsi pro mě udělal... Myslím, že ti mohu důvěřovat.
		AI_Output(self,other,"DIA_Sarah_SaraHelpsThreeDone_01_05");	//Koneckonců, parchant jako je Canthar, by takhle nikdy nejednal. A ty jsi mi pomohl v této těžké situaci!
		AI_Output(self,other,"DIA_Sarah_SaraHelpsThreeDone_01_06");	//Jsi dobrý člověk, takže na ten incident zapomeneme.
		SARABEFRIEND = TRUE;
		Log_AddEntry(TOPIC_SARAHTOGUILD,"Vypadá to, že Sarah mi už teď věří a myslí si, že jsem dobrá osoba. Myslím, že je načase si s ní pohovořit o návrhu od Lutera.");
	};
};


instance DIA_SARAH_SARAHTOGUILD(C_Info)
{
	npc = VLK_470_Sarah;
	nr = 4;
	condition = dia_sarah_sarahtoguild_condition;
	information = dia_sarah_sarahtoguild_info;
	permanent = TRUE;
	description = "Mám tu ještě jednu věc.";
};


func int dia_sarah_sarahtoguild_condition()
{
	if((MIS_SARAHTOGUILD == LOG_Running) && (SARAHELPYOU == TRUE) && (SARAAGREE == FALSE) && (SARAREFUSEHELPS == FALSE))
	{
		return TRUE;
	};
};

func void dia_sarah_sarahtoguild_info()
{
	AI_Output(other,self,"DIA_Sarah_SarahToGuild_01_00");	//Mám tu ještě jednu věc.
	if(SARAPROOFBEFRIEND == TRUE)
	{
		if(SARABEFRIEND == TRUE)
		{
			B_GivePlayerXP(250);
			AI_Output(self,other,"DIA_Sarah_SarahToGuild_01_01");	//A o co jde?
			AI_Output(other,self,"DIA_Sarah_SarahToGuild_01_02");	//Teď poslouchej. Znáš obchodníka Lutera?
			AI_Output(self,other,"DIA_Sarah_SarahToGuild_01_03");	//Samozřejmě!... (usmívá se) Kdo by ho neznal? Vždyť je to jeden z největších obchodníků v Khorinisu.
			AI_Output(other,self,"DIA_Sarah_SarahToGuild_01_04");	//No a tenhle Lutero ti nabízí práci, přesneji chce aby ses přidala do cechu obchodníků.
			AI_Output(self,other,"DIA_Sarah_SarahToGuild_01_13");	//Hmmm... (zamyšleně) Dobře, souhlasím!
			AI_Output(self,other,"DIA_Sarah_SarahToGuild_01_14");	//Možná mi to opravdu vrátí můj život. Pokud mi k tomu ještě nic neřekneš!
			AI_Output(other,self,"DIA_Sarah_SarahToGuild_01_15");	//To je dobré! Pak tedy dám Luterovi vědět, že jsi nabídku přijala.
			SARAAGREE = TRUE;
			B_LogEntry(TOPIC_SARAHTOGUILD,"Sarah souhlasila s nabídkou od Lutera. Teď bych se měl k němu vrátit a sdělit mu novinky.");
			AI_StopProcessInfos(self);
		}
		else if((SARAHELPSONEDONE == FALSE) && (SARAHELPSONEDONE == FALSE) && (SARAHELPSONEDONE == FALSE))
		{
			AI_Output(self,other,"DIA_Sarah_SarahToGuild_01_28");	//Promiň, ale o obchodu s lidmi, kterým nedůvěřuji, nemluvím.
			AI_Output(self,other,"DIA_Sarah_SarahToGuild_01_31");	//Takže ztrácíš čas. Nechci mít s tebou nic společného, dokud ti nebudu důvěřovat.
			AI_StopProcessInfos(self);
		}
		else
		{
			AI_Output(self,other,"DIA_Sarah_SarahToGuild_01_35");	//Promiň, ale nevěřím ti zas tolik, abych s tebou mohla probrat tvoje věci.
			AI_Output(other,self,"DIA_Sarah_SarahToGuild_01_36");	//A ještě pořád jsi mi neprokázal, že ti mohu věřit!
			AI_Output(self,other,"DIA_Sarah_SarahToGuild_01_37");	//No, ale... (nedůvěřivě)
			if((SARAHELPSONEDONE == TRUE) && (SARAHELPSTWODONE == FALSE) && (SARAHELPSTHREEDONE == FALSE))
			{
				AI_Output(self,other,"DIA_Sarah_SarahToGuild_01_38");	//Samozřejmě jsem ti vděčná za to, že jsi mi přinesl nějaké jídlo a nenechal mě umřít hlady.
			}
			else if((SARAHELPSONEDONE == FALSE) && (SARAHELPSTWODONE == TRUE) && (SARAHELPSTHREEDONE == FALSE))
			{
				AI_Output(self,other,"DIA_Sarah_SarahToGuild_01_39");	//Samozřejmě, že bylo od tebe pěkné, žes mi vrátil můj prsten... (usmívá se)
			}
			else if((SARAHELPSONEDONE == TRUE) && (SARAHELPSTWODONE == TRUE) && (SARAHELPSTHREEDONE == FALSE))
			{
				AI_Output(self,other,"DIA_Sarah_SarahToGuild_01_40");	//Samozřejmě jsem ti vděčná za to, že jsi mi přinesl nějaké jídlo a nenechal mě umřít hlady.
				AI_Output(self,other,"DIA_Sarah_SarahToGuild_01_41");	//A samozřejmě, že bylo od tebe pěkné, žes mi vrátil můj prsten... (usmívá se)
			}
			else if((SARAHELPSONEDONE == TRUE) && (SARAHELPSTWODONE == FALSE) && (SARAHELPSTHREEDONE == TRUE))
			{
				AI_Output(self,other,"DIA_Sarah_SarahToGuild_01_42");	//Samozřejmě jsem ti vděčná za to, že jsi mi přinesl nějaké jídlo a nenechal mě umřít hlady.
				AI_Output(self,other,"DIA_Sarah_SarahToGuild_01_43");	//A, že jsi vzal na sebe můj dluh u Harada. To jasně mluví ve tvůj prospěch.
			}
			else if((SARAHELPSONEDONE == FALSE) && (SARAHELPSTWODONE == TRUE) && (SARAHELPSTHREEDONE == TRUE))
			{
				AI_Output(self,other,"DIA_Sarah_SarahToGuild_01_44");	//Samozřejmě, že bylo od tebe pěkné, žes mi vrátil můj prsten... (usmívá se)
				AI_Output(self,other,"DIA_Sarah_SarahToGuild_01_45");	//A, že jsi vzal na sebe můj dluh u Harada. To jasně mluví ve tvůj prospěch.
			};
			AI_Output(self,other,"DIA_Sarah_SarahToGuild_01_46");	//Ale pořád to není dost, abych ti mohla věřit!
			AI_Output(self,other,"DIA_Sarah_SarahToGuild_01_47");	//Pochop mě. Mám jen strach, abys mě zase nenamočil do nějaké ohavnosti.
		};
	}
	else
	{
		B_GivePlayerXP(500);
		AI_Output(self,other,"DIA_Sarah_SarahToGuild_01_50");	//A o co jde?
		AI_Output(other,self,"DIA_Sarah_SarahToGuild_01_51");	//Teď poslouchej. Znáš obchodníka Lutera?
		AI_Output(self,other,"DIA_Sarah_SarahToGuild_01_52");	//Samozřejmě!... (usmívá se) Kdo by ho neznal? Vždyť je to jeden z největších obchodníků v Khorinisu.
		AI_Output(other,self,"DIA_Sarah_SarahToGuild_01_53");	//No a tenhle Lutero ti nabízí práci, přesneji chce aby ses přidala do cechu obchodníků.
		AI_Output(self,other,"DIA_Sarah_SarahToGuild_01_54");	//Hmmm... (zamyšleně) Dobře, souhlasím!
		AI_Output(self,other,"DIA_Sarah_SarahToGuild_01_58");	//Možná mi to opravdu vrátí můj život. Pokud mi k tomu ještě nic neřekneš!
		AI_Output(other,self,"DIA_Sarah_SarahToGuild_01_60");	//To je dobré! Pak tedy dám Luterovi vědět, že jsi nabídku přijala.
		SARAAGREE = TRUE;
		B_LogEntry(TOPIC_SARAHTOGUILD,"Sarah souhlasila s nabídkou od Lutera. Teď bych se měl k němu vrátit a sdělit mu novinky.");
		AI_StopProcessInfos(self);
	};
};


instance DIA_SARAH_SARAHELPYOUDONE(C_Info)
{
	npc = VLK_470_Sarah;
	nr = 4;
	condition = dia_sarah_sarahelpyoudone_condition;
	information = dia_sarah_sarahelpyoudone_info;
	permanent = TRUE;
	description = "Jak se ti líbí nové místo?";
};

func int dia_sarah_sarahelpyoudone_condition()
{
	if(SARAHELPYOUDONE == TRUE)
	{
		return TRUE;
	};
};

func void dia_sarah_sarahelpyoudone_info()
{
	AI_Output(other,self,"DIA_Sarah_SaraHelpYouDone_01_00");	//Jak se ti líbí nové místo?
	AI_Output(self,other,"DIA_Sarah_SaraHelpYouDone_01_01");	//Děkuju ti za všechno, co jsi pro mě udělal!
};
