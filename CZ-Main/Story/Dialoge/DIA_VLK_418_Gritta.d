/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.00:

func void dia_gritta_angekommen_info - opraveno AIV_IgnoresArmor

*/




instance DIA_Gritta_EXIT(C_Info)
{
	npc = VLK_418_Gritta;
	nr = 999;
	condition = DIA_Gritta_EXIT_Condition;
	information = DIA_Gritta_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Gritta_EXIT_Condition()
{
	if(Kapitel <= 2)
	{
		return TRUE;
	};
};

func void DIA_Gritta_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Gritta_PICKPOCKET(C_Info)
{
	npc = VLK_418_Gritta;
	nr = 900;
	condition = DIA_Gritta_PICKPOCKET_Condition;
	information = DIA_Gritta_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Gritta_PICKPOCKET_Condition()
{
	return C_Beklauen(20,20);
};

func void DIA_Gritta_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Gritta_PICKPOCKET);
	Info_AddChoice(DIA_Gritta_PICKPOCKET,Dialog_Back,DIA_Gritta_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Gritta_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Gritta_PICKPOCKET_DoIt);
};

func void DIA_Gritta_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Gritta_PICKPOCKET);
};

func void DIA_Gritta_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Gritta_PICKPOCKET);
};


instance DIA_Gritta_Hello(C_Info)
{
	npc = VLK_418_Gritta;
	nr = 10;
	condition = DIA_Gritta_Hello_Condition;
	information = DIA_Gritta_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Gritta_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE) && ((GRITTACANFOUND == FALSE) || (GRITTAISBACK == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Gritta_Hello_Info()
{
	AI_Output(self,other,"DIA_Gritta_Hello_16_00");	//Co chceš, cizinče? Jestli jsi přišel žebrat, pak tě musím zklamat - jsem jenom chudá vdova.
	AI_Output(self,other,"DIA_Gritta_Hello_16_01");	//Jmenuji se Gritta. Od té doby, co mi zemřel manžel, vedu domácnost svému strýci Thorbenovi.
};


instance DIA_Gritta_WantsMoney(C_Info)
{
	npc = VLK_418_Gritta;
	nr = 2;
	condition = DIA_Gritta_WantsMoney_Condition;
	information = DIA_Gritta_WantsMoney_Info;
	permanent = FALSE;
	description = "Posílá mě Matteo, prý mu stále dlužíš nějaké peníze.";
};

func int DIA_Gritta_WantsMoney_Condition()
{
	if((MIS_Matteo_Gold == LOG_Running) && ((GRITTACANFOUND == FALSE) || (GRITTAISBACK == TRUE)))
	{
		return TRUE;
	};
};


var int Gritta_WantPay;
var int Gritta_Threatened;

func void DIA_Gritta_WantsMoney_Info()
{
	AI_Output(other,self,"DIA_Gritta_WantsMoney_15_00");	//Posílá mě Matteo, prý mu stále dlužíš nějaké peníze.
	AI_Output(self,other,"DIA_Gritta_WantsMoney_16_01");	//On chce své peníze? A proč? Zboží, které mi dodal, bylo vadné, špatně utkané a ještě hůře sešité.
	AI_Output(self,other,"DIA_Gritta_WantsMoney_16_02");	//A viděl jsi ty barvy? Vůbec se nepodobaly těm, jaké jsem si objednala! Je to podvod, nic jiného!
	AI_Output(self,other,"DIA_Gritta_WantsMoney_16_03");	//Řeknu ti, že kdyby byl naživu můj muž, Matteo by si nikdy nic takového nedovolil. Ach, můj ubohý manžel...
	Info_ClearChoices(DIA_Gritta_WantsMoney);
	Info_AddChoice(DIA_Gritta_WantsMoney,"Nech toho. Kde jsou ty prachy?",DIA_Gritta_WantsMoney_WhereMoney);
	Info_AddChoice(DIA_Gritta_WantsMoney,"Pokračovat...",DIA_Gritta_WantsMoney_Continue01);
};

func void DIA_Gritta_WantsMoney_Continue01()
{
	AI_Output(self,other,"DIA_Gritta_WantsMoney_continue01_16_00");	//... byl to takový dobrák. Pohledný, pracovitý a džentlmen ze staré školy. Nic nám nechybělo - byli jsme bohatí a šťastní...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_Continue01_16_01");	//... občas nás dokonce zvali i do lepší společnosti. Samé slavnosti, krásné šaty a účesy...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_Continue01_16_02");	//... vybraná jídla a zdvořilá konverzace. Všechno bylo tenkrát lepší. Tehdy by si nikdo nedovolil urážet nebohou vdovu takovými...
	Info_ClearChoices(DIA_Gritta_WantsMoney);
	Info_AddChoice(DIA_Gritta_WantsMoney,"Nech toho. Kde jsou ty prachy?",DIA_Gritta_WantsMoney_WhereMoney);
	Info_AddChoice(DIA_Gritta_WantsMoney,"Pokračovat...",DIA_Gritta_WantsMoney_Continue02);
};

func void DIA_Gritta_WantsMoney_Continue02()
{
	AI_Output(self,other,"DIA_Gritta_WantsMoney_continue02_16_00");	//... směšnými tvrzeními. Co si jen počnu? Moje renta stačí jen taktak na přežití a časy jsou čím dál horší. Je to vidět všude...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_Continue02_16_01");	//... lidé musí šetřit, škudlit a utahovat opasky. Už celé týdny do města nedorazila žádná loď. Můj muž býval kapitánem obchodní lodi - vlastně ji zároveň i vlastnil...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_Continue02_16_02");	//... ze svých cest mi vždycky vozil dárky - nádherné látky z pevniny, vzácné koření z jižních zemí...
	Info_ClearChoices(DIA_Gritta_WantsMoney);
	Info_AddChoice(DIA_Gritta_WantsMoney,"Nech toho. Kde jsou ty prachy?",DIA_Gritta_WantsMoney_WhereMoney);
	Info_AddChoice(DIA_Gritta_WantsMoney,"Pokračovat...",DIA_Gritta_WantsMoney_Continue03);
};

func void DIA_Gritta_WantsMoney_Continue03()
{
	AI_Output(self,other,"DIA_Gritta_WantsMoney_continue03_16_00");	//... většina lidí o podobných věcech nikdy neslyšela. Ale jednoho dne jsem dostala zprávu, že Gritta se potopila - ano, naše loď nesla toto jméno, můj muž tím dával najevo...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_Continue03_16_01");	//... lásku, jakou ke mně choval. Plakala jsem a modlila se, aby můj drahý to neštěstí přežil, každý den jsem doufala, že o něm třeba uslyším, ale má touha byla marná...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_Continue04_16_02");	//... kéž se Innos smiluje nad jeho duší. Ať odpočívá v pokoji. Od té doby tu přebývám v těchto skromných podmínkách, a teď mě ten bezcitný, bezohledný Matteo...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_Continue04_16_03");	//... chce připravit o poslední zbyteček mých celoživotních úspor. Prosím, smiluj se nad ubohou ženou. Kdyby byl naživu můj muž, nikdy by si nic takového nedovolil. Ach, můj ubohý manžel...
	Info_ClearChoices(DIA_Gritta_WantsMoney);
	Info_AddChoice(DIA_Gritta_WantsMoney,"Nech toho. Kde jsou ty prachy?",DIA_Gritta_WantsMoney_WhereMoney);
	Info_AddChoice(DIA_Gritta_WantsMoney,"Pokračovat...",DIA_Gritta_WantsMoney_Continue01);
};

func void DIA_Gritta_WantsMoney_WhereMoney()
{
	AI_Output(other,self,"DIA_Gritta_WantsMoney_WhereMoney_15_00");	//Nech toho. Kde jsou ty prachy?
	AI_Output(self,other,"DIA_Gritta_WantsMoney_WhereMoney_16_01");	//(vzdorovitě) Ale já to zlato nemám, jsem jenom chudá vdova!
	Info_ClearChoices(DIA_Gritta_WantsMoney);
	Info_AddChoice(DIA_Gritta_WantsMoney,"Naval prašule, nebo ti jednu vlepím!",DIA_Gritta_WantsMoney_BeatUp);
	Info_AddChoice(DIA_Gritta_WantsMoney,"Tak to asi budeme muset prodat nějaký tvůj majetek...",DIA_Gritta_WantsMoney_EnoughStuff);
	Info_AddChoice(DIA_Gritta_WantsMoney,"Já tedy tu sumu zaplatím za tebe.",DIA_Gritta_WantsMoney_IWillPay);
};

func void DIA_Gritta_WantsMoney_EnoughStuff()
{
	AI_Output(other,self,"DIA_Gritta_WantsMoney_EnoughStuff_15_00");	//Tak to asi budeme muset prodat nějaký tvůj majetek...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_EnoughStuff_16_01");	//Jak se opovažuješ, ty nevychovanče! No tak dobře, tady máš to zlato.
	B_GiveInvItems(self,other,ItMi_Gold,100);
	AI_Output(other,self,"DIA_Gritta_WantsMoney_EnoughStuff_15_02");	//(úšklebek) Vida, ani to nebolelo.
	AI_Output(self,other,"DIA_Gritta_WantsMoney_EnoughStuff_16_03");	//(jedovatě) A teď prosím odejdi z mého domu.
	Gritta_GoldGiven = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_Gritta_WantsMoney_IWillPay()
{
	AI_Output(other,self,"DIA_Gritta_WantsMoney_IWillPay_15_00");	//Tak já tu sumu zaplatím za tebe.
	AI_Output(self,other,"DIA_Gritta_WantsMoney_IWillPay_16_01");	//Opravdu bys to pro mě udělal? Ach, já věděla, že nejsi takový nenažraný hajzl jako Matteo!
	AI_Output(other,self,"DIA_Gritta_WantsMoney_IWillPay_15_02");	//No jo, to nic.
	AI_Output(self,other,"DIA_Gritta_WantsMoney_IWillPay_16_03");	//Vrať se, až to zařídíš - chci se ti nějak odvděčit.
	Info_ClearChoices(DIA_Gritta_WantsMoney);
	Gritta_WantPay = TRUE;
};

func void DIA_Gritta_WantsMoney_BeatUp()
{
	AI_Output(other,self,"DIA_Gritta_WantsMoney_BeatUp_15_00");	//Naval prašule, nebo ti jednu vlepím!
	AI_Output(self,other,"DIA_Gritta_WantsMoney_BeatUp_16_01");	//(vyzývavě) Jsi jenom prachsprostý lump. Jen pojď, vytas zbraň a já zavolám stráže!
	Gritta_Threatened = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_Gritta_WINE(C_Info)
{
	npc = VLK_418_Gritta;
	nr = 2;
	condition = DIA_Gritta_WINE_Condition;
	information = DIA_Gritta_WINE_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Gritta_WINE_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Gritta_WantPay == TRUE) && (MIS_Matteo_Gold == LOG_SUCCESS) && ((GRITTACANFOUND == FALSE) || (GRITTAISBACK == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Gritta_WINE_Info()
{
	AI_Output(self,other,"DIA_Gritta_WINE_16_00");	//To od tebe bylo opravdu šlechetné, žes to za mě zaplatil. Chtěla bych se ti nějak odměnit.
	AI_Output(self,other,"DIA_Gritta_WINE_16_01");	//Tuhle láhev vína mi manžel - nechť Innos dopřeje pokoj jeho duši - přivezl z jižních ostrovů.
	AI_Output(self,other,"DIA_Gritta_WINE_16_02");	//Také jsem to všude rozhlásila. Aspoň někdo tu má v těle kouska cti.
	AI_Output(other,self,"DIA_Gritta_WINE_15_03");	//No jo, to nic.
	B_GivePlayerXP(XP_PayForGritta);
	B_GiveInvItems(self,other,ItFo_Wine_Gritta,1);
	AI_StopProcessInfos(self);
};

instance DIA_Gritta_PERM(C_Info)
{
	npc = VLK_418_Gritta;
	nr = 3;
	condition = DIA_Gritta_PERM_Condition;
	information = DIA_Gritta_PERM_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Gritta_PERM_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && Npc_KnowsInfo(other,DIA_Gritta_WantsMoney) && (MIS_Matteo_Gold == LOG_Running) && ((GRITTACANFOUND == FALSE) || (GRITTAISBACK == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Gritta_PERM_Info()
{
	if(Gritta_WantPay == TRUE)
	{
		AI_Output(self,other,"DIA_Gritta_PERM_16_00");	//Dokud jsou ve městě muži jako ty, stále mohu v srdci chovat naději, že se vše v dobré obrátí.
		AI_Output(self,other,"DIA_Gritta_PERM_16_01");	//Vrať se, až urovnáš tu záležitost s Matteem.
		AI_StopProcessInfos(self);
	}
	else if(Gritta_Threatened == TRUE)
	{
		AI_Output(self,other,"DIA_Gritta_PERM_16_02");	//Co na mě tak blbě čumíš? Stejně si na mě netroufneš zaútočit!
		AI_StopProcessInfos(self);
	}
	else if(Gritta_GoldGiven == TRUE)
	{
		AI_Output(self,other,"DIA_Gritta_PERM_16_03");	//Co ještě chceš? Moje zlato jsi už dostal, tak vypadni!
		AI_StopProcessInfos(self);
	};
};


instance DIA_Gritta_Kap3_EXIT(C_Info)
{
	npc = VLK_418_Gritta;
	nr = 999;
	condition = DIA_Gritta_Kap3_EXIT_Condition;
	information = DIA_Gritta_Kap3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Gritta_Kap3_EXIT_Condition()
{
	if(Kapitel >= 3)
	{
		return TRUE;
	};
};

func void DIA_Gritta_Kap3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


var int GrittaXP_Once;

instance DIA_Gritta_Perm3U4U5(C_Info)
{
	npc = VLK_418_Gritta;
	nr = 31;
	condition = DIA_Gritta_Perm3U4U5_Condition;
	information = DIA_Gritta_Perm3U4U5_Info;
	permanent = TRUE;
	description = "Jak se vede?";
};


func int DIA_Gritta_Perm3U4U5_Condition()
{
	if((GRITTACANFOUND == FALSE) || (GRITTAISBACK == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Gritta_Perm3U4U5_Info()
{
	AI_Output(other,self,"DIA_Gritta_Perm3U4U5_15_00");	//Jak se vede?
	if(Kapitel == 3)
	{
		if(MIS_RescueBennet != LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Gritta_Perm3U4U5_16_01");	//Všecko jde od desíti k pěti. Ať se podíváš, kam se podíváš, všude vládne zločin a násilí. Jen si představ - dokonce zabili jednoho z paladinů!
			Info_ClearChoices(DIA_Gritta_Perm3U4U5);
			Info_AddChoice(DIA_Gritta_Perm3U4U5,Dialog_Back,DIA_Gritta_Perm3U4U5_BACK);
			Info_AddChoice(DIA_Gritta_Perm3U4U5,"To je válka - takové věci se stávají.",DIA_Gritta_Perm3U4U5_War);
			Info_AddChoice(DIA_Gritta_Perm3U4U5,"To bude v pořádku.",DIA_Gritta_Perm3U4U5_TurnsGood);
			Info_AddChoice(DIA_Gritta_Perm3U4U5,"Co jsi zaslechla?",DIA_Gritta_Perm3U4U5_Rumors);
		}
		else
		{
			AI_Output(self,other,"DIA_Gritta_Perm3U4U5_16_02");	//Ach, lord Hagen toho žoldáka pustil - to mě tak dojalo!
			AI_Output(other,self,"DIA_Gritta_Perm3U4U5_15_03");	//A co to má společného s tebou?
			AI_Output(self,other,"DIA_Gritta_Perm3U4U5_16_04");	//Jen se nad tím zamysli. Věříš, že by žoldáci jen tak stáli a dívali se, jak jim věší kamaráda?
			AI_Output(self,other,"DIA_Gritta_Perm3U4U5_16_05");	//Určitě by se ho pokusili osvobodit, a z toho by koukalo pořádné krveprolití. Mohu tedy pouze děkovat Innosovi.
		};
	}
	else if(Kapitel == 5)
	{
		AI_Output(self,other,"DIA_Gritta_Perm3U4U5_16_06");	//Paladinové jsou připraveni a vypadá to, že se brzy vydají na cestu.
	}
	else
	{
		AI_Output(self,other,"DIA_Gritta_Perm3U4U5_16_07");	//Všechno při starém, ale nechci si stěžovat.
	};
};

func void DIA_Gritta_Perm3U4U5_BACK()
{
	Info_ClearChoices(DIA_Gritta_Perm3U4U5);
};

func void DIA_Gritta_Perm3U4U5_War()
{
	AI_Output(other,self,"DIA_Gritta_Perm3U4U5_War_15_00");	//To je válka - takové věci se stávají.
	AI_Output(self,other,"DIA_Gritta_Perm3U4U5_War_16_01");	//Ano, za všechno může tahle strašná válka. Každý nějak trpí a zajímá ho, jak se s tím vším vypořádají.
	AI_Output(self,other,"DIA_Gritta_Perm3U4U5_War_16_02");	//Občas se ptám sama sebe, zač nás Innos takhle trestá.
};

func void DIA_Gritta_Perm3U4U5_TurnsGood()
{
	AI_Output(other,self,"DIA_Gritta_Perm3U4U5_TurnsGood_15_00");	//To bude v pořádku.
	AI_Output(self,other,"DIA_Gritta_Perm3U4U5_TurnsGood_16_01");	//To je od tebe hezké, že mě chceš povzbudit.
	if(GrittaXP_Once == FALSE)
	{
		B_GivePlayerXP(XP_Ambient);
		GrittaXP_Once = TRUE;
	};
};

func void DIA_Gritta_Perm3U4U5_Rumors()
{
	AI_Output(other,self,"DIA_Gritta_Perm3U4U5_Rumors_15_00");	//Co jsi zaslechla?
	AI_Output(self,other,"DIA_Gritta_Perm3U4U5_Rumors_16_01");	//Jenom to, co si vyprávějí lidé na ulici.
	AI_Output(self,other,"DIA_Gritta_Perm3U4U5_Rumors_16_02");	//Prý už chytli toho vraha, ale neřeknu ti, jestli je to pravda.
};


instance DIA_GRITTA_MIISSBANDITS(C_Info)
{
	npc = VLK_418_Gritta;
	nr = 1;
	condition = dia_gritta_miissbandits_condition;
	information = dia_gritta_miissbandits_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gritta_miissbandits_condition()
{
	if((MIS_MISSGRITTA == LOG_Running) && (GRITTACANFOUND == TRUE) && (GRITTAISBACK == FALSE) && (GRITTACANFOLLOW == FALSE))
	{
		return TRUE;
	};
};

func void dia_gritta_miissbandits_info()
{
	B_GivePlayerXP(100);
	AI_Output(self,other,"DIA_Gritta_MiissBandits_01_00");	//Ty! Co chceš?!... Proč kvůli tobě zemřeli všichni ti krásní lidé?!
	AI_Output(self,other,"DIA_Gritta_MiissBandits_01_02");	//Kdo teď bude prodávat látky za tak dobrou cenu?!
	AI_Output(other,self,"DIA_Gritta_MiissBandits_01_03");	//Ty to nechápeš? Byli to banditi!
	AI_Output(self,other,"DIA_Gritta_MiissBandits_01_04");	//Jací banditi?!... Co to říkáš!
	AI_Output(other,self,"DIA_Gritta_MiissBandits_01_05");	//Rozhlédni se kolem ty hloupá ženo!
	AI_Output(other,self,"DIA_Gritta_MiissBandits_01_06");	//Co by obchodníci dělali v lese a ozbrojeni po zuby?!
	AI_Output(self,other,"DIA_Gritta_MiissBandits_01_07");	//Ale... Co chceš říci?!
	AI_Output(other,self,"DIA_Gritta_MiissBandits_01_08");	//Že jsi byla okradena huso!
	AI_Output(self,other,"DIA_Gritta_MiissBandits_01_10");	//Okradli mě?! Ó můj bože!
	AI_Output(self,other,"DIA_Gritta_MiissBandits_01_12");	//Bože!... Co jsem to za husu!
	AI_Output(self,other,"DIA_Gritta_MiissBandits_01_13");	//A já to nepochopila...
	AI_Output(self,other,"DIA_Gritta_MiissBandits_01_15");	//Ale co teď?
	AI_Output(other,self,"DIA_Gritta_MiissBandits_01_17");	//Vzchop se a jdi do města.
	AI_Output(self,other,"DIA_Gritta_MiissBandits_01_19");	//Ano... Jen mě prosím nezahazuj!
	B_LogEntry(TOPIC_MISSGRITTA,"Našel jsem Grittu. Chtěli ji okrást nějací banditi. Měl bych ji zavést za Thorbenem.");
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	GRITTACANFOLLOW = TRUE;
	Npc_ExchangeRoutine(self,"FOLLOW");
};


instance DIA_GRITTA_ANGEKOMMEN(C_Info)
{
	npc = VLK_418_Gritta;
	nr = 55;
	condition = dia_gritta_angekommen_condition;
	information = dia_gritta_angekommen_info;
	important = TRUE;
};


func int dia_gritta_angekommen_condition()
{
	if((MIS_MISSGRITTA == LOG_Running) && (GRITTACANFOLLOW == TRUE) && (Npc_GetDistToWP(self,"NW_CITY_MERCHANT_SHOP01_FRONT_01") < 6000))
	{
		return TRUE;
	};
};

func void dia_gritta_angekommen_info()
{
	B_GivePlayerXP(200);
	AI_Output(self,other,"DIA_Gritta_ANGEKOMMEN_01_00");	//Díky, dál jdu sama.
	AI_Output(other,self,"DIA_Gritta_ANGEKOMMEN_01_04");	//Neztrácej čas a jdi za Thorbenem!
	B_LogEntry(TOPIC_MISSGRITTA,"Dovedl jsem Grittu do Khorinisu!");
	AI_StopProcessInfos(self);
	self.aivar[AIV_IgnoresArmor] = FALSE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	GRITTAISBACK = TRUE;
	Npc_ExchangeRoutine(self,"Start");
	GRITTASTIMER = Wld_GetDay();
};


instance DIA_GRITTA_FINDLOSTHUSB(C_Info)
{
	npc = VLK_418_Gritta;
	nr = 1;
	condition = dia_gritta_findlosthusb_condition;
	information = dia_gritta_findlosthusb_info;
	permanent = FALSE;
	description = "Vše v pořádku?";
};


func int dia_gritta_findlosthusb_condition()
{
	var int daynow;
	daynow = Wld_GetDay();
	if((MIS_MISSGRITTA == LOG_SUCCESS) && (GRITTASTIMER < (daynow - 2)))
	{
		return TRUE;
	};
};

func void dia_gritta_findlosthusb_info()
{
	AI_Output(other,self,"DIA_Gritta_FindLostHusb_01_00");	//Vše v pořádku?
	AI_Output(self,other,"DIA_Gritta_FindLostHusb_01_01");	//Ano! Vše! Jenom... (začíná smutně)
	AI_Output(self,other,"DIA_Gritta_FindLostHusb_01_03");	//Rozuměj... V noci jsem měla sen, že můj manžel je stále na živu!
	AI_Output(self,other,"DIA_Gritta_FindLostHusb_01_06");	//A teď, když se zdá, že nic se nevrátí na své místo se mi o něm zdálo!
	AI_Output(other,self,"DIA_Gritta_FindLostHusb_01_07");	//A co budeš dělat?!
	AI_Output(self,other,"DIA_Gritta_FindLostHusb_01_08");	//Cokoli budu moci. Asi ho půjdu hledat.
	AI_Output(self,other,"DIA_Gritta_FindLostHusb_01_09");	//Ale po tom s těmi bandity mě Thorben nepustí za hradby.
	AI_Output(other,self,"DIA_Gritta_FindLostHusb_01_11");	//Takže to vypadá na to, že budeš potřebovat pomoc. Přijmula bys ji ode mě?
	AI_Output(self,other,"DIA_Gritta_FindLostHusb_01_14");	//No... Velmi bys mi pomohl, kdybys našel mého manžela.
	Info_ClearChoices(dia_gritta_findlosthusb);
	Info_AddChoice(dia_gritta_findlosthusb,"Jdu na to!",dia_gritta_findlosthusb_help);
	Info_AddChoice(dia_gritta_findlosthusb,"Promiň, ale to je časově velmi náročné a já čas nemám.",dia_gritta_findlosthusb_no);
};

func void dia_gritta_findlosthusb_no()
{
	AI_Output(other,self,"DIA_Gritta_FindLostHusb_No_01_00");	//Promiň, ale to je časově velmi náročné a já čas nemám.
	AI_Output(self,other,"DIA_Gritta_FindLostHusb_No_01_01");	//Rozumím... (smutně)
	Info_ClearChoices(dia_gritta_findlosthusb);
};

func void dia_gritta_findlosthusb_help()
{
	AI_Output(other,self,"DIA_Gritta_FindLostHusb_Help_01_00");	//Jdu na to!
	AI_Output(other,self,"DIA_Gritta_FindLostHusb_Help_01_01");	//Pro začátek bych se mohl někoho zeptat, jestli něco neví.
	AI_Output(self,other,"DIA_Gritta_FindLostHusb_Help_01_04");	//Můj manžel se jmenuje Brendik. Ztratil se na moři.
	AI_Output(self,other,"DIA_Gritta_FindLostHusb_Help_01_07");	//Měl jeden sen. Vzít si hůl, hodit na vše bobek a stát se dobrodruhem.
	AI_Output(self,other,"DIA_Gritta_FindLostHusb_Help_01_08");	//Bitvy, potyčky, oceán otevírající cestu do neznáma, bohatství a sláva. To je to co chtěl.
	AI_Output(other,self,"DIA_Gritta_FindLostHusb_Help_01_09");	//Ohó! Pak je možné, že se dal k pirátům!
	AI_Output(self,other,"DIA_Gritta_FindLostHusb_Help_01_10");	//Pirát? To by mohlo být, protože Brendik chtěl býti pirátem - připadalo mu to romantické!
	AI_Output(self,other,"DIA_Gritta_FindLostHusb_Help_01_16");	//Hmmm... Je pravda, že v mém snu měl Brandik nějaké divné oblečení.
	AI_Output(self,other,"DIA_Gritta_FindLostHusb_Help_01_17");	//Viděla jsem ho i na nějakých ciznicích u moře.
	AI_Output(self,other,"DIA_Gritta_FindLostHusb_Help_01_19");	//Nicméně tomu stejně nemůžu uvěřit...
	AI_Output(other,self,"DIA_Gritta_FindLostHusb_Help_01_22");	//Jestli je opravdu pirát, tak vím, kde ho hledat.
	AI_Output(self,other,"DIA_Gritta_FindLostHusb_Help_01_25");	//Dobře, děkuji ti.
	MIS_FINDLOSTHUSB = LOG_Running;
	Log_CreateTopic(TOPIC_FINDLOSTHUSB,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FINDLOSTHUSB,LOG_Running);
	B_LogEntry(TOPIC_FINDLOSTHUSB,"Gritta mi řekla, že měla sen, kde viděla svého manžela. Jmenuje se Brendik a požádala mě, abych ho našel. Podle toho, co mi řekla, soudím, že se dal k pirátům. Měl bych se poptat u Grega.");
	Info_ClearChoices(dia_gritta_findlosthusb);
};


instance DIA_GRITTA_FINDLOSTHUSBDONE(C_Info)
{
	npc = VLK_418_Gritta;
	nr = 1;
	condition = dia_gritta_findlosthusbdone_condition;
	information = dia_gritta_findlosthusbdone_info;
	permanent = FALSE;
	description = "Tvůj manžel žije.";
};


func int dia_gritta_findlosthusbdone_condition()
{
	if((MIS_FINDLOSTHUSB == LOG_Running) && (BRENDIKNOTBACK == TRUE))
	{
		return TRUE;
	};
};

func void dia_gritta_findlosthusbdone_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Gritta_FindLostHusbDone_01_00");	//Tvůj manžel žije.
	AI_Output(self,other,"DIA_Gritta_FindLostHusbDone_01_01");	//Našel jsi ho? Opravdu?!
	AI_Output(self,other,"DIA_Gritta_FindLostHusbDone_01_03");	//U Innose!... Co se mu stalo a kde je?!
	AI_Output(other,self,"DIA_Gritta_FindLostHusbDone_01_04");	//Brendik se stal pirátem. A zdá se, že mu to svědčí!
	AI_Output(self,other,"DIA_Gritta_FindLostHusbDone_01_05");	//Nemožné, kdo by to řekl!
	AI_Output(self,other,"DIA_Gritta_FindLostHusbDone_01_06");	//Můj sen byl pravda.
	AI_Output(other,self,"DIA_Gritta_FindLostHusbDone_01_07");	//To byl, ale nemyslím si, že se k tobě vrátí...
	AI_Output(self,other,"DIA_Gritta_FindLostHusbDone_01_08");	//No, s tím jsem nepočítala... Je to škoda
	AI_Output(self,other,"DIA_Gritta_FindLostHusbDone_01_09");	//Hlavně, že je v pořádku - to mi stačí ke štěstí.
	AI_Output(self,other,"DIA_Gritta_FindLostHusbDone_01_10");	//Jsem ti vděčná za ty dobré zprávy!
	MIS_FINDLOSTHUSB = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_FINDLOSTHUSB,LOG_SUCCESS);
	B_LogEntry(TOPIC_FINDLOSTHUSB,"Gritta byla šťastná, když slyšela, že její muž žije. Jen ji mrzí, že už ho nikdy neuvidí.");
	if((MIS_LuciasLetter == LOG_SUCCESS) && (ELVRIHMARRYGRITTAFLAG == FALSE))
	{
		ELVRIHMARRYGRITTATIMER = Wld_GetDay();
		ELVRIHMARRYGRITTAFLAG = TRUE;
	};
};


instance DIA_GRITTA_ELVRICHGRITTA(C_Info)
{
	npc = VLK_418_Gritta;
	nr = 1;
	condition = dia_gritta_elvrichgritta_condition;
	information = dia_gritta_elvrichgritta_info;
	permanent = FALSE;
	description = "Už ses poučila?";
};


func int dia_gritta_elvrichgritta_condition()
{
	if(MIS_ELVRIHMARRYGRITTA == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_gritta_elvrichgritta_info()
{
	AI_Output(other,self,"DIA_Gritta_ElvrichGritta_01_00");	//Už ses poučila?
	AI_Output(self,other,"DIA_Gritta_ElvrichGritta_01_03");	//Když byl manžel se mnou, vše bylo jinak.
	AI_Output(other,self,"DIA_Gritta_ElvrichGritta_01_04");	//Rozumím. Nepřemýšlela jsi, že by ses znovu vdala?
	AI_Output(self,other,"DIA_Gritta_ElvrichGritta_01_05");	//Co?! No, abych řekla pravdu, tak ne.
	AI_Output(self,other,"DIA_Gritta_ElvrichGritta_01_06");	//Kdo by mě chtěl...
	AI_Output(other,self,"DIA_Gritta_ElvrichGritta_01_07");	//Pro příklad třeba Elvrich!
	AI_Output(self,other,"DIA_Gritta_ElvrichGritta_01_12");	//Ano... Je velmi krásný a je to sympatický, hodný člověk.
	AI_Output(other,self,"DIA_Gritta_ElvrichGritta_01_13");	//To je zajímavé! Elvrich na tebe nemůže přestat myslet!
	AI_Output(self,other,"DIA_Gritta_ElvrichGritta_01_16");	//Ale... Ale jak je to možné? Proč mi nidy nic neřekl?!
	AI_Output(other,self,"DIA_Gritta_ElvrichGritta_01_17");	//Jen se trochu bojí, jestli by ses mu nevysmála.
	AI_Output(self,other,"DIA_Gritta_ElvrichGritta_01_24");	//Myslím, že ne. Naopak.
	AI_Output(other,self,"DIA_Gritta_ElvrichGritta_01_27");	//Prostě si myslím, že Elvrich ti bude něco chtít říci.
	AI_Output(self,other,"DIA_Gritta_ElvrichGritta_01_28");	//Můj bože, to je jako ve snu! Děkuji ti.
	B_LogEntry(TOPIC_ELVRIHMARRYGRITTA,"Gritta byla šťastná, když jsem jí řekl, co k ní Elvrich cítí.");
	GRITTAAGREEMARRY = TRUE;
	if((ELVRIHAGREEMARRY == TRUE) && (GRITTAAGREEMARRY == TRUE))
	{
		Npc_ExchangeRoutine(VLK_418_Gritta,"GoMarry");
		Npc_ExchangeRoutine(VLK_4302_Addon_Elvrich,"GoMarry");
	};
	AI_StopProcessInfos(self);
};


instance DIA_GRITTA_ELVRIHMARRYGRITTADONE(C_Info)
{
	npc = VLK_418_Gritta;
	nr = 1;
	condition = dia_gritta_elvrihmarrygrittadone_condition;
	information = dia_gritta_elvrihmarrygrittadone_info;
	permanent = FALSE;
	description = "Něco nového?";
};


func int dia_gritta_elvrihmarrygrittadone_condition()
{
	if(MIS_ELVRIHMARRYGRITTA == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_gritta_elvrihmarrygrittadone_info()
{
	AI_Output(other,self,"DIA_Gritta_ElvrihMarryGrittaDone_01_00");	//Něco nového?
	AI_Output(self,other,"DIA_Gritta_ElvrihMarryGrittaDone_01_01");	//Nechce se mi ani věřit, že by to o Elvrichovi byla pravda!
	AI_Output(self,other,"DIA_Gritta_ElvrihMarryGrittaDone_01_02");	//Jsem tak šťastná, děkuji ti.
};

