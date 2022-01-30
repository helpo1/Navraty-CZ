
instance DIA_Addon_Rhademes_EXIT(C_Info)
{
	npc = NONE_ADDON_112_Rhademes;
	nr = 999;
	condition = DIA_Addon_Rhademes_EXIT_Condition;
	information = DIA_Addon_Rhademes_EXIT_Info;
	permanent = TRUE;
	description = "Najdu si vlastní cestu! (KONEC)";
};


func int DIA_Addon_Rhademes_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Rhademes_EXIT_Info()
{
	AI_Output(other,self,"DIA_Addon_Rhademes_EXIT_15_00");	//Najdu si vlastní cestu!
	AI_Output(self,other,"DIA_Addon_Rhademes_EXIT_03_01");	//Jak chceš...
	AI_StopProcessInfos(self);
};


var int Rhademes_Understood;

instance DIA_Addon_Rhademes_First(C_Info)
{
	npc = NONE_ADDON_112_Rhademes;
	nr = 1;
	condition = DIA_Addon_Rhademes_First_Condition;
	information = DIA_Addon_Rhademes_First_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Rhademes_First_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Rhademes_Understood == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Rhademes_First_Info()
{
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Rhademes_First_03_00");	//Moje magie byla zadržena na věčné časy.
		AI_Output(self,other,"DIA_Addon_Rhademes_First_03_01");	//Konečně jsem volný. Meč má nového nositele.
		AI_Output(self,other,"DIA_Addon_Rhademes_First_03_02");	//Poslední komnata se otevřela.
		AI_Output(other,self,"DIA_Addon_Rhademes_First_15_03");	//Ale brána vypadá pro mě uzavřena.
		AI_Output(self,other,"DIA_Addon_Rhademes_First_03_04");	//Toto není brána do poslední komnaty.
		AI_Output(self,other,"DIA_Addon_Rhademes_First_03_05");	//TATO brána vede pouze do předsíně.
		AI_Output(self,other,"DIA_Addon_Rhademes_First_03_06");	//Nositel... ji za sebou zavřel.
		Rhademes_Understood = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Rhademes_First_03_07");	//(napjatě) Ghanima en Kandra Adanos?
		B_Say(other,self,"$CANTUNDERSTANDTHIS");
		AI_Output(self,other,"DIA_Addon_Rhademes_First_03_08");	//(zuřivě) Bengla anthani!
		AI_StopProcessInfos(self);
	};
};


instance DIA_Addon_Rhademes_Pforte(C_Info)
{
	npc = NONE_ADDON_112_Rhademes;
	nr = 2;
	condition = DIA_Addon_Rhademes_Pforte_Condition;
	information = DIA_Addon_Rhademes_Pforte_Info;
	permanent = FALSE;
	description = "Jak otevřu bránu?";
};


func int DIA_Addon_Rhademes_Pforte_Condition()
{
	return TRUE;
};

func void DIA_Addon_Rhademes_Pforte_Info()
{
	AI_Output(other,self,"DIA_Addon_Rhademes_Pforte_15_00");	//Jak otevřu bránu?
	AI_Output(self,other,"DIA_Addon_Rhademes_Pforte_03_01");	//Potáhni... jednu z pák.
	AI_Output(other,self,"DIA_Addon_Rhademes_Pforte_15_02");	//Jakoukoli?
	AI_Output(self,other,"DIA_Addon_Rhademes_Pforte_03_03");	//Všechny páky otevřou bránu.
};


instance DIA_Addon_Rhademes_Hebel(C_Info)
{
	npc = NONE_ADDON_112_Rhademes;
	nr = 3;
	condition = DIA_Addon_Rhademes_Hebel_Condition;
	information = DIA_Addon_Rhademes_Hebel_Info;
	permanent = FALSE;
	description = "Ne všechny páky spouštějí past, že?";
};


func int DIA_Addon_Rhademes_Hebel_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Rhademes_Pforte) && !Npc_KnowsInfo(other,DIA_Addon_Rhademes_DeinVater))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Rhademes_Hebel_Info()
{
	AI_Output(other,self,"DIA_Addon_Rhademes_Hebel_15_00");	//Ne všechny páky spouštějí past, že?
	AI_Output(self,other,"DIA_Addon_Rhademes_Hebel_03_01");	//Ano, všechny!
};


instance DIA_Addon_Rhademes_DontBelieve(C_Info)
{
	npc = NONE_ADDON_112_Rhademes;
	nr = 4;
	condition = DIA_Addon_Rhademes_DontBelieve_Condition;
	information = DIA_Addon_Rhademes_DontBelieve_Info;
	permanent = FALSE;
	description = "Nevěřím ti!";
};


func int DIA_Addon_Rhademes_DontBelieve_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Rhademes_Pforte) && !Npc_KnowsInfo(other,DIA_Addon_Rhademes_DeinVater))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Rhademes_DontBelieve_Info()
{
	AI_Output(other,self,"DIA_Addon_Rhademes_DontBelieve_15_00");	//Nevěřím ti!
	AI_Output(self,other,"DIA_Addon_Rhademes_DontBelieve_03_01");	//Přesto... mluvím pouze pravdu.
};


instance DIA_Addon_Rhademes_DeinVater(C_Info)
{
	npc = NONE_ADDON_112_Rhademes;
	nr = 5;
	condition = DIA_Addon_Rhademes_DeinVater_Condition;
	information = DIA_Addon_Rhademes_DeinVater_Info;
	permanent = FALSE;
	description = "Tvůj otec postavil tuto past, jak můžeš vědět, jak funguje?!";
};


func int DIA_Addon_Rhademes_DeinVater_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Rhademes_Pforte) && (Npc_HasItems(other,ItMi_Addon_Stone_04) >= 1))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Rhademes_DeinVater_Info()
{
	AI_Output(other,self,"DIA_Addon_Rhademes_DeinVater_15_00");	//Tvůj otec postavil tuto past, jak můžeš vědět, jak funguje?!
	AI_Output(self,other,"DIA_Addon_Rhademes_DeinVater_03_01");	//QUARHODRON! Pořád slyším bušení kladiv... na druhé straně brány... po tak dlouhé době...
	AI_Output(self,other,"DIA_Addon_Rhademes_DeinVater_03_02");	//Meč... mi ukázal... pomstu... za mé selhání...
	AI_Output(other,self,"DIA_Addon_Rhademes_DeinVater_15_03");	//Takže jsi viděl, která páka je ta správná?
	AI_Output(self,other,"DIA_Addon_Rhademes_DeinVater_03_04");	//Už jsem to dávno zapomněl.
	Info_ClearChoices(DIA_Addon_Rhademes_DeinVater);
	Info_AddChoice(DIA_Addon_Rhademes_DeinVater,"Pak hádej!",DIA_Addon_Rhademes_DeinVater_Guess);
	Info_AddChoice(DIA_Addon_Rhademes_DeinVater,"Zkus si vzpomenout.",DIA_Addon_Rhademes_DeinVater_Remember);
	Info_AddChoice(DIA_Addon_Rhademes_DeinVater,"Přemýšlej!",DIA_Addon_Rhademes_DeinVater_Think);
};


var int Rhademes_fertig;

func void B_Addon_Rhademes_Lever(var int Choice)
{
	AI_Output(self,other,"DIA_Addon_Rhademes_Lever_03_00");	//Bylo to tak dávno...
	AI_StopProcessInfos(self);
	if(Choice <= 1)
	{
		AI_GotoWP(self,"ADW_ADANOSTEMPEL_RHADEMES_04");
	}
	else if(Choice == 2)
	{
		AI_GotoWP(self,"ADW_ADANOSTEMPEL_RHADEMES_04");
	}
	else
	{
		AI_GotoWP(self,"ADW_ADANOSTEMPEL_RHADEMES_04");
	};
	AI_UseMob(self,"LEVER",1);
	Rhademes_fertig = TRUE;
};

func void DIA_Addon_Rhademes_DeinVater_Think()
{
	AI_Output(other,self,"DIA_Addon_Rhademes_DeinVater_Think_15_00");	//Přemýšlej!
	B_Addon_Rhademes_Lever(1);
};

func void DIA_Addon_Rhademes_DeinVater_Remember()
{
	AI_Output(other,self,"DIA_Addon_Rhademes_DeinVater_Remember_15_00");	//Zkus si vzpomenout.
	B_Addon_Rhademes_Lever(2);
};

func void DIA_Addon_Rhademes_DeinVater_Guess()
{
	AI_Output(other,self,"DIA_Addon_Rhademes_DeinVater_Guess_15_00");	//Pak hádej!
	B_Addon_Rhademes_Lever(3);
};


instance DIA_Addon_Rhademes_PERM(C_Info)
{
	npc = NONE_ADDON_112_Rhademes;
	nr = 2;
	condition = DIA_Addon_Rhademes_PERM_Condition;
	information = DIA_Addon_Rhademes_PERM_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Rhademes_PERM_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Rhademes_fertig == TRUE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Rhademes_PERM_Info()
{
	AI_Output(self,other,"DIA_Addon_Rhademes_PERM_03_00");	//Pokud máš sílu... potop ho... do hlubin moře...
	SC_TookRhademesTrap = TRUE;
	SC_TalkedToRhademAfter = TRUE;
	AI_StopProcessInfos(self);
};

//---------------------------------Radames novyy---------------------


instance DIA_NONE_ADDON_1159_Rhademes_EXIT(C_Info)
{
	npc = NONE_ADDON_1159_Rhademes;
	nr = 999;
	condition = DIA_NONE_ADDON_1159_Rhademes_EXIT_Condition;
	information = DIA_NONE_ADDON_1159_Rhademes_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_NONE_ADDON_1159_Rhademes_EXIT_Condition()
{
	return TRUE;
};

func void DIA_NONE_ADDON_1159_Rhademes_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_NONE_ADDON_1159_Rhademes_Why(C_Info)
{
	npc = NONE_ADDON_1159_Rhademes;
	nr = 4;
	condition = DIA_NONE_ADDON_1159_Rhademes_Why_Condition;
	information = DIA_NONE_ADDON_1159_Rhademes_Why_Info;
	permanent = FALSE;
	description = "Rhademesi? Co tady děláš?";
};

func int DIA_NONE_ADDON_1159_Rhademes_Why_Condition()
{
	return TRUE;
};

func void DIA_NONE_ADDON_1159_Rhademes_Why_Info()
{
	AI_Output(other,self,"DIA_NONE_ADDON_1159_Rhademes_Why_01_00");	//Rhademesi? Co tady děláš?
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_Why_01_01");	//(chladně) Přišel jsem si promluvit s Ashtarem.
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_Why_01_02");	//Můj duch stále nemůže najít svou cestu do světa předků.
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_Why_01_03");	//Možná by mi mohl pomoci.

	if(DragonGoldIsDead == TRUE)
	{
		AI_Output(other,self,"DIA_NONE_ADDON_1159_Rhademes_Why_01_04");	//Ale Ashtar je mrtvý!
		AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_Why_01_05");	//Vidím. Moje duše je naplněna ještě větším smutkem.
		AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_Why_01_06");	//Se vší pravděpodobností, nikdy nenajdu míru na tomto světě.
	};
};

instance DIA_NONE_ADDON_1159_Rhademes_Father(C_Info)
{
	npc = NONE_ADDON_1159_Rhademes;
	nr = 4;
	condition = DIA_NONE_ADDON_1159_Rhademes_Father_Condition;
	information = DIA_NONE_ADDON_1159_Rhademes_Father_Info;
	permanent = FALSE;
	description = "Kde je tvůj otec?";
};

func int DIA_NONE_ADDON_1159_Rhademes_Father_Condition()
{
	if((MIS_JarCurse == LOG_Running) && (Npc_KnowsInfo(other,DIA_NONE_ADDON_1159_Rhademes_Why) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_ADDON_1159_Rhademes_Father_Info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_NONE_ADDON_1159_Rhademes_Father_01_00");	//Kde je tvůj otec?
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_Father_01_01");	//Quarhodron? Proč se ptáš?
	AI_Output(other,self,"DIA_NONE_ADDON_1159_Rhademes_Father_01_02");	//Pokud sis nevšiml, Jharkendar obsadili nemrtví!
	AI_Output(other,self,"DIA_NONE_ADDON_1159_Rhademes_Father_01_03");	//A to ohrožuje nejen Jharkendar, ale i jiný části ostrova.
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_Father_01_04");	//Temné časy dorazí na tento svět...
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_Father_01_05");	//Adanovy děti se již nemůžou dívat na to, jak živé ničí jejich útočiště, a poskvrňují starověké chrámy našich předků.
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_Father_01_06");	//Proto se bouřili, aby nesly břemeno pomsty za něj! Oni zničí každého, kdo se odváží postavit proti vůli Adana.
	AI_Output(other,self,"DIA_NONE_ADDON_1159_Rhademes_Father_01_07");	//Pochybuji, že je do toho zapojený Adanos.
	AI_Output(other,self,"DIA_NONE_ADDON_1159_Rhademes_Father_01_08");	//S největší pravděpodobností jsou předmětem zlé vůle démonů, či snad dokonce Beliara!
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_Father_01_09");	//Ty moc nevíš, člověče... (studeně) Ale je to jak můj otec řekl.
	AI_Output(other,self,"DIA_NONE_ADDON_1159_Rhademes_Father_01_10");	//Zajímalo by mě, co to má co dělat s ním?
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_Father_01_11");	//To můj otec zavolal své bratry, aby mu pomohli dosáhnout Adanovy vůle.
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_Father_01_12");	//Když byl velký vojevůdce mých lidí. Mnozí si ho zapamatovali a jsou ochotni mu sloužit i po smrti.
	AI_Output(other,self,"DIA_NONE_ADDON_1159_Rhademes_Father_01_13");	//Takže, na vině všechny neduhy je Quarhodron?! Kdo by si pomyslel...
	B_LogEntry(TOPIC_JarCurse,"Potkal jsem Rhademese v blízkosti chrámu Ashtara. Zdá se jak Saturas myslel, že znesvěcení chrámů mělo dalekosáhlé důsledky, není daleko od pravdy. To jeho otec, Quarhodron velký válečník a jeden ze Stavitelů, šel bojovat se svými bratry, aby se pomstil pro jejich svatokrádež.");
};

instance DIA_NONE_ADDON_1159_Rhademes_SeekFath(C_Info)
{
	npc = NONE_ADDON_1159_Rhademes;
	nr = 4;
	condition = DIA_NONE_ADDON_1159_Rhademes_SeekFath_Condition;
	information = DIA_NONE_ADDON_1159_Rhademes_SeekFath_Info;
	permanent = FALSE;
	description = "Prosím, kde ho najdu?";
};

func int DIA_NONE_ADDON_1159_Rhademes_SeekFath_Condition()
{
	if((MIS_JarCurse == LOG_Running) && (Npc_KnowsInfo(other,DIA_NONE_ADDON_1159_Rhademes_Father) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_ADDON_1159_Rhademes_SeekFath_Info()
{
	AI_Output(other,self,"DIA_NONE_ADDON_1159_Rhademes_SeekFath_01_00");	//Prosím, kde ho najdu?
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_SeekFath_01_01");	//Nyní je na místě, kde kdysi došlo k velké bitvě Khar Aram.
	AI_Output(other,self,"DIA_NONE_ADDON_1159_Rhademes_SeekFath_01_02");	//To zní skvěle. Ale mohl bys být trochu přesnější?
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_SeekFath_01_03");	//Je mi líto, nepamatuji se kde to místo je.
	AI_Output(other,self,"DIA_NONE_ADDON_1159_Rhademes_SeekFath_01_04");	//To je velmi špatné.
	B_LogEntry(TOPIC_JarCurse,"Na otázku kde je Quarhodron, Rhademes mluvil o místě kde se kdysi odehrála velká bitva Khar Aram. Nicméně si nepamatuje kde to přesně bylo.");		
};

instance DIA_NONE_ADDON_1159_Rhademes_Near(C_Info)
{
	npc = NONE_ADDON_1159_Rhademes;
	nr = 4;
	condition = DIA_NONE_ADDON_1159_Rhademes_Near_Condition;
	information = DIA_NONE_ADDON_1159_Rhademes_Near_Info;
	permanent = FALSE;
	description = "Proč teď nejsi s ním?";
};

func int DIA_NONE_ADDON_1159_Rhademes_Near_Condition()
{
	if((MIS_JarCurse == LOG_Running) && (Npc_KnowsInfo(other,DIA_NONE_ADDON_1159_Rhademes_Father) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_ADDON_1159_Rhademes_Near_Info()
{
	AI_Output(other,self,"DIA_NONE_ADDON_1159_Rhademes_Near_01_00");	//Proč teď nejsi s ním?
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_Near_01_01");	//(studeně) Nemohu se vrátit k otci...
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_Near_01_02");	//Proklínal mě za to co jsem udělal i dlouho poté. Od té doby mě můj otec nechce vidět.
	AI_Output(other,self,"DIA_NONE_ADDON_1159_Rhademes_Near_01_03");	//Za celou tu dobu on nezapomněl?
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_Near_01_04");	//Nevím. Nemluvil jsem s ním už po mnoho staletí.
	AI_Output(other,self,"DIA_NONE_ADDON_1159_Rhademes_Near_01_05");	//Pak by stál za to pokus?
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_Near_01_06");	//Mám spoustu času přemýšlet o tom. Ale pokud mě nebude poslouchat?
	AI_Output(other,self,"DIA_NONE_ADDON_1159_Rhademes_Near_01_07");	//No, aspoň to bude lepší, než se donekonečna hádat.
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_Near_01_08");	//(zamyšleně) Ano, možná máš pravdu.
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_Near_01_09");	//Nicméně, zatímco starověká kletba z mých lidí neopadne. Nepodívá se mi do očí.
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_Near_01_10");	//Koneckonců byl jsem příčinou všech našich neštěstí.
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_Near_01_11");	//A tuhle situaci potřebuji já vyřešit.
};

instance DIA_NONE_ADDON_1159_Rhademes_Priest(C_Info)
{
	npc = NONE_ADDON_1159_Rhademes;
	nr = 4;
	condition = DIA_NONE_ADDON_1159_Rhademes_Priest_Condition;
	information = DIA_NONE_ADDON_1159_Rhademes_Priest_Info;
	permanent = FALSE;
	description = "Takže Quarhodron řídí tuto armádu nemrtvých?";
};

func int DIA_NONE_ADDON_1159_Rhademes_Priest_Condition()
{
	if((MIS_JarCurse == LOG_Running) && (Npc_KnowsInfo(other,DIA_NONE_ADDON_1159_Rhademes_Father) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_ADDON_1159_Rhademes_Priest_Info()
{
	AI_Output(other,self,"DIA_NONE_ADDON_1159_Rhademes_Priest_01_00");	//Takže Quarhodron řídí tuto armádu nemrtvých?
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_Priest_01_01");	//(studeně) Otec vedl armádu pouze válečníků...
	AI_Output(other,self,"DIA_NONE_ADDON_1159_Rhademes_Priest_01_02");	//A co kněží?
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_Priest_01_03");	//Poslouchají vůli Khardimona, velekněze našich lidí.
	AI_Output(other,self,"DIA_NONE_ADDON_1159_Rhademes_Priest_01_04");	//Slyšel jsem to jméno. 
	AI_Output(other,self,"DIA_NONE_ADDON_1159_Rhademes_Priest_01_05");	//To je duch, kterého Raven povolal do tohoto světa aby mohl proniknout do Adanova chrámu.
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_Priest_01_06");	//Nechápu co říkáš, člověče.
	AI_Output(other,self,"DIA_NONE_ADDON_1159_Rhademes_Priest_01_07");	//No to je jedno. Jen mi řekni kde najdu Khardimona?
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_Priest_01_08");	//Jeho duch musí přebývat ve velkém chrámu, na severovýchodě údolí.
	MIS_Qvardemon = LOG_Running;
	Log_CreateTopic(TOPIC_Qvardemon,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Qvardemon,LOG_Running);
	B_LogEntry(TOPIC_Qvardemon,"Quarhodron ovládá pouze válečníky nemrtvých. Kněží poslouchají Khardimona, velekněze Stavitelů. Zdá se, že se s tím budu muset vypořádat. Podle Rhademese duch Khardimona přebývá v ruinách chrámu na severovýchodě údolí.");	
	Wld_InsertNpc(Skeleton_Shadow_Priest,"FP_ROAM_ENTRANCEORCGUARD_18");
	Wld_InsertNpc(Skeleton_Mage_AV_Elite,"FP_ROAM_ENTRANCEORCGUARD_17");
	Wld_InsertNpc(Skeleton_Shadow_Priest,"ADW_CANYON_LIBRARY_02");
	Wld_InsertNpc(Skeleton_Mage_AV_Elite,"ADW_CANYON_LIBRARY_LEFT_01");
	Wld_InsertNpc(Skeleton_Shadow_Priest,"ADW_CANYON_LIBRARY_RIGHT_01");
	Wld_InsertNpc(Skeleton_Mage_AV_Elite,"ADW_CANYON_LIBRARY_LEFT_07");
	Wld_InsertNpc(Skeleton_Shadow_Priest,"ADW_CANYON_LIBRARY_LEFT_04");
	Wld_InsertNpc(Skeleton_Mage_AV_Elite,"ADW_CANYON_LIBRARY_LEFT_08");
	Wld_InsertNpc(Skeleton_Shadow_Priest,"ADW_CANYON_LIBRARY_RIGHT_03");
	Wld_InsertNpc(Skeleton_Mage_AV_Elite,"ADW_CANYON_LIBRARY_RIGHT_06");
	Wld_InsertNpc(Skeleton_Shadow_Priest,"ADW_CANYON_LIBRARY_RIGHT_07");
	Wld_InsertNpc(Skeleton_Mage_AV_Elite,"ADW_CANYON_LIBRARY_RIGHT_09");
	Wld_InsertNpc(Skeleton_Shadow_Priest,"FP_STAND_QUARDIMON_GUARD_02");
	Wld_InsertNpc(Skeleton_Mage_AV_Elite,"FP_STAND_QUARDIMON_GUARD_01");
	Wld_InsertNpc(Skeleton_Shadow_Priest_Quardimon,"ADW_CANYON_LIBRARY_RIORDIAN");
};

instance DIA_NONE_ADDON_1159_Rhademes_SeekFathDone(C_Info)
{
	npc = NONE_ADDON_1159_Rhademes;
	nr = 4;
	condition = DIA_NONE_ADDON_1159_Rhademes_SeekFathDone_Condition;
	information = DIA_NONE_ADDON_1159_Rhademes_SeekFathDone_Info;
	permanent = FALSE;
	description = "A co ti pomůže si vzpomenout?";
};

func int DIA_NONE_ADDON_1159_Rhademes_SeekFathDone_Condition()
{
	if((MIS_JarCurse == LOG_Running) && (Npc_KnowsInfo(other,DIA_NONE_ADDON_1159_Rhademes_SeekFath) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_ADDON_1159_Rhademes_SeekFathDone_Info()
{
	AI_Output(other,self,"DIA_NONE_ADDON_1159_Rhademes_SeekFathDone_01_00");	//A co ti pomůže si vzpomenout?
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_SeekFathDone_01_01");	//(povzdech) Prokletí mých lidí mi nedává možnost se vrátit do minulosti.
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_SeekFathDone_01_02");	//Kéž bych mohl se toho zbavit, pak možná by se mi obnovily vzpomínky.
	AI_Output(other,self,"DIA_NONE_ADDON_1159_Rhademes_SeekFathDone_01_03");	//Co můžu udělat?
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_SeekFathDone_01_04");	//Nevím... (studeně) Adanos neslyší moje modlitby, bez ohledu na to jak moc jsem se na něho upínal.
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_SeekFathDone_01_05");	//A pokud je toho někdo schopný, pak pouze Adanos.
	MIS_CurseAncient = LOG_Running;
	Log_CreateTopic(TOPIC_CurseAncient,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CurseAncient,LOG_Running);
	B_LogEntry(TOPIC_CurseAncient,"Musím najít způsob, jak zbavit Rhademese a jeho lid z pradávné kletby. Podle něj je toho schopen pouze Adanos.");	
};

instance DIA_NONE_ADDON_1159_Rhademes_CurseAncientDone(C_Info)
{
	npc = NONE_ADDON_1159_Rhademes;
	nr = 4;
	condition = DIA_NONE_ADDON_1159_Rhademes_CurseAncientDone_Condition;
	information = DIA_NONE_ADDON_1159_Rhademes_CurseAncientDone_Info;
	permanent = FALSE;
	description = "Adanos očistil od prokletí tvůj lid.";
};

func int DIA_NONE_ADDON_1159_Rhademes_CurseAncientDone_Condition()
{
	if((MIS_CurseAncient == LOG_Running) && (CurseAncientRemove == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_ADDON_1159_Rhademes_CurseAncientDone_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_NONE_ADDON_1159_Rhademes_CurseAncientDone_01_00");	//Adanos očistil od prokletí tvůj lid.
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_CurseAncientDone_01_01");	//Ano, cítil jsem to... (povzdech) Teď jsem konečně volný.
	AI_Output(other,self,"DIA_NONE_ADDON_1159_Rhademes_CurseAncientDone_01_02");	//Takže se ti vrátila paměť, a teď mi řekni kde hledat tvého otce.
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_CurseAncientDone_01_03");	//Jak jsem již řekl dříve, nyní je tam kde kdysi došlo k velké bitvě Khar Aram.
	AI_Output(other,self,"DIA_NONE_ADDON_1159_Rhademes_CurseAncientDone_01_04");	//Už vím. Ale kde to přesně je?
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_CurseAncientDone_01_05");	//Podívej se na to v posvátných zemích Adana. To je tam, kde můj otec shromažďuje svou armádu, která se pomstí lidem.
	AI_Output(other,self,"DIA_NONE_ADDON_1159_Rhademes_CurseAncientDone_01_06");	//A přesněji? Tahle země je rozsáhlá.
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_CurseAncientDone_01_07");	//Hmmm... (zamyšleně) V blízkosti toho místa je obrovský balvan.
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_CurseAncientDone_01_08");	//Pokud si vzpomínám, z něj byl kdysi nádherný výhled na téměř celé údolí.
	AI_Output(other,self,"DIA_NONE_ADDON_1159_Rhademes_CurseAncientDone_01_09");	//No, alespoň něco. Jinak bych musel asi věčnost putovat v divočině.
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_CurseAncientDone_01_10");	//Počkej, to není všechno...
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_CurseAncientDone_01_11");	//Pokud se opravdu chceš setkat s mým otcem, pak musíš nejprve počkat na noc.
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_CurseAncientDone_01_12");	//Uvidíš ho jen v odrazu měsíčního světla.
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_CurseAncientDone_01_13");	//Ale pozor. Bývá obklopen zástupy nemrtvých válečníků.
	AI_Output(other,self,"DIA_NONE_ADDON_1159_Rhademes_CurseAncientDone_01_14");	//Prvně se budeš muset vypořádat s nimi.
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_CurseAncientDone_01_15");	//Nedotknou se tě když budou vědět, že sloužíš Adanovi.
	AI_Output(other,self,"DIA_NONE_ADDON_1159_Rhademes_CurseAncientDone_01_16");	//Dobře, cením si toho.
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_CurseAncientDone_01_17");	//Nyní sbohem. Už se spolu neuvidíme...
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_CurseAncientDone_01_18");	//A děkuji za záchranu mého lidu!
	AI_Output(other,self,"DIA_NONE_ADDON_1159_Rhademes_CurseAncientDone_01_19");	//Nashledanou.
	MIS_CurseAncient = LOG_Success;
	Log_SetTopicStatus(TOPIC_CurseAncient,LOG_Success);
	B_LogEntry(TOPIC_JarCurse,"Myslím, že budu muset jít na náhorní plošinu - do Adanovy země. Quarhodron si tam pěstuje armádů nemrtvých, zničí veškerý život na tomto ostrově. Rhademes řekl, že poblíž místa, kde bych mohl najít Quarhodrona je obrovský balvan. Nicméně musím počkat na noc, protože jen v měsíčním světle se můžu setkat s jeho otcem. Taky mě varoval, že Quarhodrona střeží obrovské množství válečníků Stavitelů. Ale jestli jim nějak dokážu, že sloužím Adanovi, nebudou na mě útočit, jinak budu muset bojovat s armádou.");
	B_LogEntry_Quiet(TOPIC_CurseAncient,"Duše Rhademese je volná, stejně jako všichni jeho lidé. Zdá se, že příběh dávného prokletí je u konce.");
	AI_StopProcessInfos(self);
};
