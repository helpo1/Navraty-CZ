
instance DIA_Alvares_EXIT(C_Info)
{
	npc = SLD_840_Alvares;
	nr = 999;
	condition = DIA_Alvares_EXIT_Condition;
	information = DIA_Alvares_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Alvares_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Alvares_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Alvares_HAUAB(C_Info)
{
	npc = SLD_840_Alvares;
	nr = 4;
	condition = DIA_Alvares_HAUAB_Condition;
	information = DIA_Alvares_HAUAB_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Alvares_HAUAB_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Alvares_HAUAB_Info()
{
	Akils_SLDStillthere = TRUE;
	AI_Output(self,other,"DIA_Alvares_HAUAB_11_00");	//Ať už tě sem přivedlo cokoli - zapomeň na to a odejdi.
	Log_CreateTopic(TOPIC_AkilsSLDStillthere,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AkilsSLDStillthere,LOG_Running);
	B_LogEntry(TOPIC_AkilsSLDStillthere,"Akilovu farmu ohrožují žoldáci.");
	AI_StopProcessInfos(self);
};


instance DIA_Alvares_ATTACK(C_Info)
{
	npc = SLD_840_Alvares;
	nr = 6;
	condition = DIA_Alvares_ATTACK_Condition;
	information = DIA_Alvares_ATTACK_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Alvares_ATTACK_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Alvares_HAUAB) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Alvares_ATTACK_Info()
{
	AI_Output(self,other,"DIA_Alvares_ATTACK_11_00");	//Hej, ty jsi ještě tady? Dal jsem ti na výběr, cizinče: buď vypadni, nebo chcípni!
	Info_ClearChoices(DIA_Alvares_ATTACK);
	Info_AddChoice(DIA_Alvares_ATTACK,"Co jste zač? Párek vtipálků?",DIA_Alvares_ATTACK_Kerle);
	Info_AddChoice(DIA_Alvares_ATTACK,"Chci se k vám žoldákům přidat.",DIA_Alvares_ATTACK_Soeldner);
	Info_AddChoice(DIA_Alvares_ATTACK,"Teďka odsud hezky rychle vypadnete!",DIA_Alvares_ATTACK_Witz);
	Info_AddChoice(DIA_Alvares_ATTACK,"Nestojím o žádné problémy.",DIA_Alvares_ATTACK_Aerger);

	if(MIS_Baltram_ScoutAkil == LOG_Running)
	{
		Info_AddChoice(DIA_Alvares_ATTACK,"Jen jsem si přišel něco vyzvednout.",DIA_Alvares_ATTACK_Lieferung);
	};
};

func void DIA_Alvares_ATTACK_Witz()
{
	AI_Output(other,self,"DIA_Alvares_ATTACK_Witz_15_00");	//Hele, kluci, prostě odtuď hnedka zmizíte, jasný?
	AI_Output(self,other,"DIA_Alvares_ATTACK_Witz_11_01");	//A helemese, máme tu nového hrdinu - a je to opravdový blbec.
	AI_Output(self,other,"DIA_Alvares_ATTACK_Witz_11_02");	//Víš, co si myslím?
	AI_Output(other,self,"DIA_Alvares_ATTACK_Witz_15_03");	//Koho zajímá, co si myslíš?
	AI_Output(self,other,"DIA_Alvares_ATTACK_Witz_11_04");	//Myslím, že dobrý hrdina je jedině mrtvý hrdina. Udělej mi teda laskavost - chcípni co nejrychlejc!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
};

func void DIA_Alvares_ATTACK_Kerle()
{
	AI_Output(other,self,"DIA_Alvares_ATTACK_Kerle_15_00");	//Co jste zač? Párek vtipálků?
	AI_Output(self,other,"DIA_Alvares_ATTACK_Kerle_11_01");	//Tos uhodl. Ale pořádně se zasměju, teprve až budeš ležet držkou v blátě.
	AI_Output(self,other,"DIA_Alvares_ATTACK_Kerle_11_02");	//(volá) Engardo, do toho! Ty chytni toho farmáře a já se vypořádám s tímhle šaškem!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
};

func void DIA_Alvares_ATTACK_Aerger()
{
	AI_Output(other,self,"DIA_Alvares_ATTACK_Aerger_15_00");	//Nestojím o žádné problémy
	AI_Output(self,other,"DIA_Alvares_ATTACK_Aerger_11_01");	//To my sme problémy hledali. A už za sebou máme dlouho cestu než sme ho našli.
	AI_Output(self,other,"DIA_Alvares_ATTACK_Aerger_11_02");	//A jak asi víš máme problémy moc rádi. A začneme hned s tebou pokud hned nevypadneš.
	AI_StopProcessInfos(self);
};

func void DIA_Alvares_ATTACK_Lieferung()
{
	AI_Output(other,self,"DIA_Alvares_ATTACK_Lieferung_15_00");	//Jen jsem si přišel něco vyzvednout.
	AI_Output(self,other,"DIA_Alvares_ATTACK_Lieferung_11_01");	//To my taky, a my jsme tu byli první. Takže buď vypadneš, nebo ti budu muset ublížit.
	AI_StopProcessInfos(self);
};

func void DIA_Alvares_ATTACK_Soeldner()
{
	AI_Output(other,self,"DIA_Alvares_ATTACK_Soeldner_15_00");	//Chci se k vám žoldákům přidat.
	AI_Output(self,other,"DIA_Alvares_ATTACK_Soeldner_11_01");	//Ou, vážně? Tak to koukej mazat, nebo už se nikdy k nikomu nepřidáš.
	AI_StopProcessInfos(self);
};


instance DIA_Alvares_Schluss(C_Info)
{
	npc = SLD_840_Alvares;
	nr = 4;
	condition = DIA_Alvares_Schluss_Condition;
	information = DIA_Alvares_Schluss_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Alvares_Schluss_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && Npc_KnowsInfo(other,DIA_Alvares_ATTACK))
	{
		return TRUE;
	};
};

func void DIA_Alvares_Schluss_Info()
{
	AI_Output(self,other,"DIA_Alvares_Schluss_11_00");	//Dostal jsi šanci. Ale vypadá to, že rozumný důvody prostě ignoruješ.
	AI_Output(self,other,"DIA_Alvares_Schluss_11_01");	//Jak chceš - tak to tě prostě teď hned zabiju. (volá) Engardo, oddělej ho!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
};


instance DIA_Alvares_PICKPOCKET(C_Info)
{
	npc = SLD_840_Alvares;
	nr = 900;
	condition = DIA_Alvares_PICKPOCKET_Condition;
	information = DIA_Alvares_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Alvares_PICKPOCKET_Condition()
{
	return C_Beklauen(20,15);
};

func void DIA_Alvares_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Alvares_PICKPOCKET);
	Info_AddChoice(DIA_Alvares_PICKPOCKET,Dialog_Back,DIA_Alvares_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Alvares_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Alvares_PICKPOCKET_DoIt);
};

func void DIA_Alvares_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Alvares_PICKPOCKET);
};

func void DIA_Alvares_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Alvares_PICKPOCKET);
};

//--------------------------------Kharim-------------------------------------------

instance DIA_Kharim_EXIT(C_Info)
{
	npc = SLD_850_Kharim;
	nr = 999;
	condition = DIA_Kharim_EXIT_Condition;
	information = DIA_Kharim_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Kharim_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Kharim_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Kharim_PICKPOCKET(C_Info)
{
	npc = SLD_850_Kharim;
	nr = 900;
	condition = DIA_Kharim_PICKPOCKET_Condition;
	information = DIA_Kharim_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int DIA_Kharim_PICKPOCKET_Condition()
{
	return C_Beklauen(20,15);
};

func void DIA_Kharim_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Kharim_PICKPOCKET);
	Info_AddChoice(DIA_Kharim_PICKPOCKET,Dialog_Back,DIA_Kharim_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Kharim_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Kharim_PICKPOCKET_DoIt);
};

func void DIA_Kharim_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Kharim_PICKPOCKET);
};

func void DIA_Kharim_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Kharim_PICKPOCKET);
};

instance DIA_Kharim_Hello(C_Info)
{
	npc = SLD_850_Kharim;
	nr = 1;
	condition = DIA_Kharim_Hello_Condition;
	information = DIA_Kharim_Hello_Info;
	permanent = FALSE;
	description = "Jsem rád, že tě vidím, Kharime!";
};

func int DIA_Kharim_Hello_Condition()
{
	return TRUE;
};

func void DIA_Kharim_Hello_Info()
{
	AI_Output(other,self,"DIA_Kharim_Hello_01_00");	//Jsem rád, že tě vidím, Kharime!
	AI_Output(self,other,"DIA_Kharim_Hello_01_01");	//Co? Kdo jsi?
	AI_Output(other,self,"DIA_Kharim_Hello_01_02");	//Vzpomeň si na Scattyho arénu! Několikrát jsem tam zápasil a s tebou taky.
	AI_Output(self,other,"DIA_Kharim_Hello_01_03");	//(nevěřícně) V aréně bojovalo hodně lidí. Nemůžu si všechny pamatovat.
	AI_Output(self,other,"DIA_Kharim_Hello_01_04");	//Radši mě objasni - jak je možné, že jsi mohl vyzvat mě?
	Info_ClearChoices(DIA_Kharim_Hello);
	Info_AddChoice(DIA_Kharim_Hello,"Řekl jsem, že jsi přišel líbat Gomezovi zadek.",DIA_Kharim_Hello_Ok);
	Info_AddChoice(DIA_Kharim_Hello,"Nazval jsem tě zbabělcem!",DIA_Kharim_Hello_NoTwo);
	Info_AddChoice(DIA_Kharim_Hello,"Vyzval jsem tě na souboj.",DIA_Kharim_Hello_NoOne);
	Info_AddChoice(DIA_Kharim_Hello,"Řekl jsem, že tvůj ksicht je k nerozeznání od tvé prdele!",DIA_Kharim_Hello_NoThree);
	Info_AddChoice(DIA_Kharim_Hello,"Řekl jsem něco o tých ručičkách.",DIA_Kharim_Hello_NoFour);
};

func void DIA_Kharim_Hello_NoTwo()
{
	AI_Output(other,self,"DIA_Kharim_Hello_NoTwo_01_00");	//Nazval jsem tě zbabělcem!
	AI_Output(self,other,"DIA_Kharim_Hello_NoTwo_01_01");	//Nic takového si nepamatuju...
	AI_Output(self,other,"DIA_Kharim_Hello_NoTwo_01_02");	//Věř mi, pleteš se příteli.
	KharimPissOff = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_Kharim_Hello_NoOne()
{
	AI_Output(other,self,"DIA_Kharim_Hello_NoOne_01_00");	//Vyzval jsem tě na souboj.
	AI_Output(self,other,"DIA_Kharim_Hello_NoOne_01_01");	//Hmmm... Nemyslím si, že to tak mohlo být.
	AI_Output(self,other,"DIA_Kharim_Hello_NoOne_01_02");	//Zřejmě jsi byl pouze obyčejný kopáč, co viděl moje zápasy.
	AI_Output(self,other,"DIA_Kharim_Hello_NoOne_01_03");	//Tak to jsme se sotva znali. Promiň!
	KharimPissOff = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_Kharim_Hello_NoThree()
{
	AI_Output(other,self,"DIA_Kharim_Hello_NoThree_01_00");	//Řekl jsem, že tvůj ksicht je k nerozeznání od tvé prdele!
	AI_Output(self,other,"DIA_Kharim_Hello_NoThree_01_01");	//(Zamyšleně): Na něco si vzpomínám, ale ne to se nestalo.
	AI_Output(self,other,"DIA_Kharim_Hello_NoThree_01_02");	//Věř mi, pleteš se příteli.
	AI_Output(self,other,"DIA_Kharim_Hello_NoThree_01_03");	//Tak to jsme se sotva znali. Promiň!
	KharimPissOff = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_Kharim_Hello_NoFour()
{
	AI_Output(other,self,"DIA_Kharim_Hello_NoFour_01_00");	//Řekl jsem něco o tých ručičkách.
	AI_Output(self,other,"DIA_Kharim_Hello_NoFour_01_01");	//(Zamyšleně): Na něco si vzpomínám.
	AI_Output(self,other,"DIA_Kharim_Hello_NoFour_01_02");	//Věř mi, pleteš se příteli.
	AI_Output(self,other,"DIA_Kharim_Hello_NoFour_01_03");	//Tak to jsme se sotva znali. Promiň!
	KharimPissOff = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_Kharim_Hello_Ok()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Kharim_Hello_Ok_01_00");	//Řekl jsem, že jsi přišel líbat Gomezovi zadek.
	AI_ReadyMeleeWeapon(self);
	AI_Output(self,other,"DIA_Kharim_Hello_Ok_01_01");	//Co?! Zopakuj to!
	AI_Output(other,self,"DIA_Kharim_Hello_Ok_01_02");	//Soudě podle tvé reakce, není pochyb o tom že se známe. 
	AI_Output(self,other,"DIA_Kharim_Hello_Ok_01_03");	//O ano...(šklebí se) Teď už si na tebe vzpomínám!
	AI_RemoveWeapon(self);
	AI_Output(other,self,"DIA_Kharim_Hello_Ok_01_04");	//A ten souboj nás rozsoudil.
	AI_Output(self,other,"DIA_Kharim_Hello_Ok_01_05");	//Samozřejmě. A jak to vždycky bývá, ten horší zůstal ležet.
	AI_Output(self,other,"DIA_Kharim_Hello_Ok_01_06");	//Dobře! Necháme minulost - minulostí...
	AI_Output(self,other,"DIA_Kharim_Hello_Ok_01_07");	//(Usmívá se) A mimochodem - Jsem také rád, že tě vidím, kamaráde!
	Info_ClearChoices(DIA_Kharim_Hello);
};

instance DIA_Kharim_HAUAB(C_Info)
{
	npc = SLD_850_Kharim;
	nr = 4;
	condition = DIA_Kharim_HAUAB_Condition;
	information = DIA_Kharim_HAUAB_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Kharim_HAUAB_Condition()
{
	if((Npc_IsInState(self,ZS_Talk)) && (KharimPissOff == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Kharim_HAUAB_Info()
{
	AI_Output(self,other,"DIA_Kharim_HAUAB_01_00");	//(rozmrzele) Hej, vypadni...
	KharimPissOff = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_Kharim_Escape(C_Info)
{
	npc = SLD_850_Kharim;
	nr = 1;
	condition = DIA_Kharim_Escape_Condition;
	information = DIA_Kharim_Escape_Info;
	permanent = FALSE;
	description = "Jak ses dostal ze Starého tábora?";
};

func int DIA_Kharim_Escape_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Kharim_Hello) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Kharim_Escape_Info()
{
	AI_Output(other,self,"DIA_Kharim_Escape_01_00");	//Jak ses dostal ze Starého tábora?
	AI_Output(self,other,"DIA_Kharim_Escape_01_01");	//Scatty se nějak dozvěděl co Gomez chystá a přišel nás včas varovat. 
	AI_Output(self,other,"DIA_Kharim_Escape_01_02");	//Jen zázrakem jsem stihnul proběhnout bránou! Jeden ze strážných dokonce po mě stihnul vystřeli.
	AI_Output(self,other,"DIA_Kharim_Escape_01_03");	//Ale díky bohu byl ještě pěkně pod parou a tak nemířil přesně.
};

instance DIA_Kharim_Cup(C_Info)
{
	npc = SLD_850_Kharim;
	nr = 1;
	condition = DIA_Kharim_Cup_Condition;
	information = DIA_Kharim_Cup_Info;
	permanent = FALSE;
	description = "Vypadáš pěkně podrážděně, když na to vzpomínáš.";
};

func int DIA_Kharim_Cup_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Kharim_Escape) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Kharim_Cup_Info()
{
	AI_Output(other,self,"DIA_Kharim_Cup_01_00");	//Vypadáš pěkně podrážděně, když na to vzpomínáš.
	AI_Output(self,other,"DIA_Kharim_Cup_01_01");	//Ano... Je to kvůli mému zlatému poháru.
	AI_Output(self,other,"DIA_Kharim_Cup_01_02");	//Tak rychle jsem se snažil zmizet ze Starého tábora, že jsem na něj zapomněl.
	AI_Output(other,self,"DIA_Kharim_Cup_01_03");	//Co je to za pohár?
	AI_Output(self,other,"DIA_Kharim_Cup_01_04");	//Je to cena pro nejlepšího bojovníka v aréně!
	AI_Output(self,other,"DIA_Kharim_Cup_01_05");	//I když mě ho předával Gomez, byla to pro mě ta nejcenější věc.
	AI_Output(self,other,"DIA_Kharim_Cup_01_06");	//Připomínal mě moje předešlá vítězství.
	AI_Output(self,other,"DIA_Kharim_Cup_01_07");	//A mimo to je ten pohár z ryzího zlata, takže má pořád velkou cenu.
	AI_Output(other,self,"DIA_Kharim_Cup_01_08");	//A proč se pro něj nevrátíš?
	AI_Output(self,other,"DIA_Kharim_Cup_01_09");	//Nevím jestli tam pořád ještě je. Je to drahá věc co přitahuje pozornost.
	AI_Output(self,other,"DIA_Kharim_Cup_01_10");	//Kromě toho průchod do Hornického údolí je střežen paladiny a od Leeho mám nařízeno střežit farmu.
	AI_Output(self,other,"DIA_Kharim_Cup_01_11");	//Takže, jen tak nemohu odejít.
	AI_Output(self,other,"DIA_Kharim_Cup_01_12");	//Kdyby se našel někdo kdo by mě s tím pomohl, byl bych mu vděčný z celého srdce.
	MIS_KharimCup = LOG_Running;
	Log_CreateTopic(TOPIC_KharimCup,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KharimCup,LOG_Running);
	B_LogEntry(TOPIC_KharimCup,"Kharim zapomněl ve Starém táboře svůj zlatý pohár. Byl to symbol jeho úspěchů v aréně, darovaný Gomezem. Kharim by ho chtěl získat zpět.");
};

instance DIA_Kharim_Cup_Done(C_Info)
{
	npc = SLD_850_Kharim;
	nr = 1;
	condition = DIA_Kharim_Cup_Done_Condition;
	information = DIA_Kharim_Cup_Done_Info;
	permanent = FALSE;
	description = "Myslím, že jsem našel tvůj pohár.";
};

func int DIA_Kharim_Cup_Done_Condition()
{
	if((MIS_KharimCup == LOG_Running) && (Npc_HasItems(other,ItMi_HarimCup) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Kharim_Cup_Done_Info()
{
	B_GivePlayerXP(400);
	AI_Output(other,self,"DIA_Kharim_Cup_Done_01_00");	//Myslím, že jsem našel tvůj pohár.
	AI_Output(self,other,"DIA_Kharim_Cup_Done_01_01");	//Tak ukaž, ať se podívám...
	B_GiveInvItems(other,self,ItMi_HarimCup,1);
	Npc_RemoveInvItems(self,ItMi_HarimCup,1);
	AI_Output(self,other,"DIA_Kharim_Cup_Done_01_02");	//Ano sakra, to je on! Nikdy nezapomenu na boj, po kterém jsem ho dostal.
	AI_Output(other,self,"DIA_Kharim_Cup_Done_01_03");	//Teď jsi spokojený?
	AI_Output(self,other,"DIA_Kharim_Cup_Done_01_04");	//To se nedá popstat. To je vše, xo jsem potřeboval ke štěstí.
	AI_Output(other,self,"DIA_Kharim_Cup_Done_01_05");	//A co ta slibovaná odměna?
	AI_Output(self,other,"DIA_Kharim_Cup_Done_01_06");	//Samozřejmě! Tady, vezmi si tento prut rudy.
	B_GiveInvItems(self,other,ItMi_OreStuck,1);
	AI_Output(self,other,"DIA_Kharim_Cup_Done_01_07");	//Bennet mě ho vytvořil ze zbytků magické rudy, které jsem si přines z kolonie.
	AI_Output(self,other,"DIA_Kharim_Cup_Done_01_08");	//A kdo ví, možná pro tebe bude mnohem cenější než zlato.
	MIS_KharimCup = LOG_Success;
	Log_SetTopicStatus(TOPIC_KharimCup,LOG_Success);
	B_LogEntry(TOPIC_KharimCup,"Kharim byl rád, že dostal zpět svůj pohár.");
};

//--------------------------------Rosko-------------------------------------------

instance DIA_Roscoe_EXIT(C_Info)
{
	npc = SLD_851_Roscoe;
	nr = 999;
	condition = DIA_Roscoe_EXIT_Condition;
	information = DIA_Roscoe_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Roscoe_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Roscoe_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Roscoe_PICKPOCKET(C_Info)
{
	npc = SLD_851_Roscoe;
	nr = 900;
	condition = DIA_Roscoe_PICKPOCKET_Condition;
	information = DIA_Roscoe_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int DIA_Roscoe_PICKPOCKET_Condition()
{
	return C_Beklauen(20,15);
};

func void DIA_Roscoe_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Roscoe_PICKPOCKET);
	Info_AddChoice(DIA_Roscoe_PICKPOCKET,Dialog_Back,DIA_Roscoe_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Roscoe_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Roscoe_PICKPOCKET_DoIt);
};

func void DIA_Roscoe_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Roscoe_PICKPOCKET);
};

func void DIA_Roscoe_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Roscoe_PICKPOCKET);
};

instance DIA_Roscoe_HAUAB(C_Info)
{
	npc = SLD_851_Roscoe;
	nr = 4;
	condition = DIA_Roscoe_HAUAB_Condition;
	information = DIA_Roscoe_HAUAB_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Roscoe_HAUAB_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Roscoe_HAUAB_Info()
{
	AI_Output(self,other,"DIA_Roscoe_HAUAB_01_00");	//(podrážděně) Co?
};

instance DIA_Roscoe_Hello(C_Info)
{
	npc = SLD_851_Roscoe;
	nr = 1;
	condition = DIA_Roscoe_Hello_Condition;
	information = DIA_Roscoe_Hello_Info;
	permanent = FALSE;
	description = "Hej! Jak se máš, Roscoe?";
};

func int DIA_Roscoe_Hello_Condition()
{
	return TRUE;
};

func void DIA_Roscoe_Hello_Info()
{
	AI_Output(other,self,"DIA_Roscoe_Hello_01_00");	//Hej! Jak se máš, Roscoe?
	AI_Output(self,other,"DIA_Roscoe_Hello_01_01");	//(nedůvěřivě) A my se jako známe?
	AI_Output(other,self,"DIA_Roscoe_Hello_01_02");	//Co tě praštil trol, že si nevzpomínáš. 
	AI_Output(self,other,"DIA_Roscoe_Hello_01_03");	//Ach, no ano...(zírá) teď už si na tebe vzpomínám.
	AI_Output(self,other,"DIA_Roscoe_Hello_01_04");	//Ty jsi ten mladík, co se tak vehementně snažil dostat v Novém táboře k Laresovi.
	AI_Output(other,self,"DIA_Roscoe_Hello_01_05");	//Ještě pro něj pracuješ?
	AI_Output(self,other,"DIA_Roscoe_Hello_01_06");	//Samozřejmě! Byl jsem jeho osobní strážce v kolonii a vždycky jsme spolu dobře vycházeli.
	AI_Output(self,other,"DIA_Roscoe_Hello_01_07");	//A pak s Laresem jsou dobré kšefty. Vždycky ví víc, než kolik přizná. 
};

instance DIA_Roscoe_WhatDo(C_Info)
{
	npc = SLD_851_Roscoe;
	nr = 1;
	condition = DIA_Roscoe_WhatDo_Condition;
	information = DIA_Roscoe_WhatDo_Info;
	permanent = FALSE;
	description = "A co tady děláš?";
};

func int DIA_Roscoe_WhatDo_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Roscoe_Hello) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Roscoe_WhatDo_Info()
{
	AI_Output(other,self,"DIA_Roscoe_WhatDo_01_00");	//A co tady děláš?
	AI_Output(self,other,"DIA_Roscoe_WhatDo_01_01");	//No tak...(zaváhá) sleduju vše co se děje kolem.
	AI_Output(other,self,"DIA_Roscoe_WhatDo_01_02");	//Proč?
	AI_Output(self,other,"DIA_Roscoe_WhatDo_01_03");	//(ušklíbá se) Ty vole, vidíš tímle místem prochází všechny cesty, vedoucí do Hornického údolí a do středu ostrova.
	AI_Output(self,other,"DIA_Roscoe_WhatDo_01_04");	//Zde mám přehled o paladinech a městské stráži, odkud a kam mají namířeno.
	AI_Output(self,other,"DIA_Roscoe_WhatDo_01_05");	//Kromě toho, dostávám užitečné informace od Larese pro Leeho, přes místního barmana.
	AI_Output(other,self,"DIA_Roscoe_WhatDo_01_06");	//Rozumím.
};

instance DIA_Roscoe_News(C_Info)
{
	npc = SLD_851_Roscoe;
	nr = 1;
	condition = DIA_Roscoe_News_Condition;
	information = DIA_Roscoe_News_Info;
	permanent = TRUE;
	description = "Jaká je situace?";
};

func int DIA_Roscoe_News_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Roscoe_WhatDo) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Roscoe_News_Info()
{
	AI_Output(other,self,"DIA_Roscoe_News_01_00");	//Jaká je situace?

 	if(Kapitel < 3)
	{
		AI_Output(self,other,"DIA_Roscoe_News_01_01");	//Všechno je pod kontrolou, příteli.
	}
	else if(MIS_RoscoeMage == FALSE)
	{
		AI_Output(self,other,"DIA_Roscoe_News_01_02");	//Ne tak docela. Pořád tady pobíhají ty maníci v černých róbách.
		AI_Output(self,other,"DIA_Roscoe_News_01_03");	//Zjevně někoho hledají. Ale já nevím koho!
		AI_Output(other,self,"DIA_Roscoe_News_01_04");	//A prošlo jich tudy hodně?
		AI_Output(self,other,"DIA_Roscoe_News_01_05");	//Viděl jsem jen jednoho. (Nervózně) Myslím, že šel ke starému hřbitovu, který se nachází nedaleko odtud, v lese.
		AI_Output(self,other,"DIA_Roscoe_News_01_06");	//Snažím se držet dál od toho místa.
		AI_Output(self,other,"DIA_Roscoe_News_01_07");	//Mám z těch lidí husí kůži, pokud to ovšem jsou lidé.
		MIS_RoscoeMage = LOG_Running;
		Log_CreateTopic(TOPIC_RoscoeMage,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_RoscoeMage,LOG_Running);
		B_LogEntry(TOPIC_RoscoeMage,"Rosco je vystrašený z lidí v černých róbách. Podle něj jeden z nich šel ke starému hřbitovu v lese.");
		AI_StopProcessInfos(self);
		Wld_InsertNpc(DMT_1812_Dementor,"NW_FARM2_TO_TAVERN_09_MONSTER4");
		Wld_InsertNpc(SKELETON_DARK,"FP_ROAM_NW_FARM2_TO_TAVERN_09_MONSTER4_04");
		Wld_InsertNpc(SKELETON_DARK,"FP_ROAM_NW_FARM2_TO_TAVERN_09_MONSTER4_03");
		Wld_InsertNpc(SKELETON_DARK,"FP_ROAM_NW_FARM2_TO_TAVERN_09_MONSTER4_02");
		Wld_InsertNpc(SKELETON_DARK,"FP_ROAM_NW_FARM2_TO_TAVERN_09_MONSTER4_01");
	}
	else
	{
		AI_Output(self,other,"DIA_Roscoe_News_01_09");	//Bylo i lépe, kamaráde.
	};
};

instance DIA_Roscoe_RoscoeMage(C_Info)
{
	npc = SLD_851_Roscoe;
	nr = 1;
	condition = DIA_Roscoe_RoscoeMage_Condition;
	information = DIA_Roscoe_RoscoeMage_Info;
	permanent = FALSE;
	description = "Zabil jsem toho mága v černé róbě.";
};

func int DIA_Roscoe_RoscoeMage_Condition()
{
	if((MIS_RoscoeMage == LOG_Running) && (RoscoeDMTIsDead == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Roscoe_RoscoeMage_Info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Roscoe_RoscoeMage_01_01");	//Zabil jsem toho mága v černé róbě.
	AI_Output(self,other,"DIA_Roscoe_RoscoeMage_01_02");	//Dobře, ať je mu zem lehká!
	AI_Output(self,other,"DIA_Roscoe_RoscoeMage_01_03");	//A já jsem mnohem klidnější při té myšlence.
	AI_Output(self,other,"DIA_Roscoe_RoscoeMage_01_04");	//Tady, vem za svoji námahu.
	B_GiveInvItems(self,other,ItMi_Gold,350);
	AI_Output(other,self,"DIA_Roscoe_RoscoeMage_01_05");	//Díky.
	MIS_RoscoeMage = LOG_Success;
	Log_SetTopicStatus(TOPIC_RoscoeMage,LOG_Success);
	B_LogEntry(TOPIC_RoscoeMage,"Roscoeovi se ulevilo, když zjistil, že temný mág je mrtvý.");
};