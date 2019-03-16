
instance DIA_LESTER_LI_EXIT(C_Info)
{
	npc = pc_psionic_li;
	nr = 999;
	condition = dia_lester_li_exit_condition;
	information = dia_lester_li_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_lester_li_exit_condition()
{
	return TRUE;
};

func void dia_lester_li_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LESTER_LI_HELLO(C_Info)
{
	npc = pc_psionic_li;
	nr = 1;
	condition = dia_lester_li_hello_condition;
	information = dia_lester_li_hello_info;
	permanent = TRUE;
	description = "Nechceš mi něco říct?";
};


func int dia_lester_li_hello_condition()
{
	return TRUE;
};

func void dia_lester_li_hello_info()
{
	AI_Output(other,self,"DIA_Lester_LI_Hello_15_00");	//Nechceš mi něco říct?
	AI_Output(self,other,"DIA_Lester_LI_Hello_13_06");	//Teď nemám co. Možná později.
};


instance DIA_PSIONIC_LI_PICKPOCKET(C_Info)
{
	npc = pc_psionic_li;
	nr = 900;
	condition = dia_psionic_li_pickpocket_condition;
	information = dia_psionic_li_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_psionic_li_pickpocket_condition()
{
	return C_Beklauen(56,25);
};

func void dia_psionic_li_pickpocket_info()
{
	Info_ClearChoices(dia_psionic_li_pickpocket);
	Info_AddChoice(dia_psionic_li_pickpocket,Dialog_Back,dia_psionic_li_pickpocket_back);
	Info_AddChoice(dia_psionic_li_pickpocket,DIALOG_PICKPOCKET,dia_psionic_li_pickpocket_doit);
};

func void dia_psionic_li_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_psionic_li_pickpocket);
};

func void dia_psionic_li_pickpocket_back()
{
	Info_ClearChoices(dia_psionic_li_pickpocket);
};


instance DIA_PSIONIC_LI_REDJOINT(C_Info)
{
	npc = pc_psionic_li;
	nr = 2;
	condition = dia_psionic_li_redjoint_condition;
	information = dia_psionic_li_redjoint_info;
	permanent = FALSE;
	description = "Našel jsem zajímavý model trávy.";
};


func int dia_psionic_li_redjoint_condition()
{
	if(Npc_HasItems(hero,itpl_swampherb_02) >= 1)
	{
		return TRUE;
	};
};

func void dia_psionic_li_redjoint_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Psionic_LI_RedJoint_01_01");	//Našel jsem zajímavý model trávy.
	AI_Output(self,other,"DIA_Psionic_LI_RedJoint_01_02");	//(zaujatě) Zajímavý říkáš? Tak se na to podíváme.
	AI_Output(other,self,"DIA_Psionic_LI_RedJoint_01_03");	//Tady.
	B_GiveInvItems(other,self,itpl_swampherb_02,1);
	AI_Output(self,other,"DIA_Psionic_LI_RedJoint_01_04");	//(podívá se zblízka) Vypadá to na obyčejnou trávu... až na to, že je červená.
	AI_Output(other,self,"DIA_Psionic_LI_RedJoint_01_05");	//Viděl jsi někdy něco takového?
	AI_Output(self,other,"DIA_Psionic_LI_RedJoint_01_06");	//Poprvé v životě, kámo.
	AI_Output(self,other,"DIA_Psionic_LI_RedJoint_01_09");	//Pravděpodobně bude mít mnohem zajímavější účinky než normální, ale nechci se unáhlovat.
	AI_Output(self,other,"DIA_Psionic_LI_RedJoint_01_10");	//Jedno mi je ale jasné - tenhle ostrov je plný překvapení, když se na něm vyskytuje něco takového.
	AI_Output(other,self,"DIA_Psionic_LI_RedJoint_01_11");	//Také si myslím. Ale co budeme dělat s tou trávou?
	AI_Output(self,other,"DIA_Psionic_LI_RedJoint_01_12");	//(zamyslí se) Hmm... Myslím, že bychom tu záhadnou rostlinu měli prvně prozkoumat.
	AI_Output(self,other,"DIA_Psionic_LI_RedJoint_01_13");	//Možná má nějaké užitečné vlastnosti.
	AI_Output(self,other,"DIA_Psionic_LI_RedJoint_01_14");	//Pokud najdeš ještě něco takového - dones mi to.
	MIS_REDJOINT = LOG_Running;
	Log_CreateTopic(TOPIC_REDJOINT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_REDJOINT,LOG_Running);
	B_LogEntry(TOPIC_REDJOINT,"Dal jsem Lesterovi podivuhodnou červenou trávu. Byl zaskočen a řekl mi, že ji prostuduje. Také mě požádal, jestli bych se mu nepoohlédl po dalších rostlinách.");
};


instance DIA_PSIONIC_LI_REDJOINTMORE(C_Info)
{
	npc = pc_psionic_li;
	nr = 2;
	condition = dia_psionic_li_redjointmore_condition;
	information = dia_psionic_li_redjointmore_info;
	permanent = TRUE;
	description = "Mám další červenou trávu.";
};


func int dia_psionic_li_redjointmore_condition()
{
	if((MIS_REDJOINT == LOG_Running) && (Npc_HasItems(hero,itpl_swampherb_02) >= 1) && (TESTSWAMPHERB == FALSE))
	{
		return TRUE;
	};
};

func void dia_psionic_li_redjointmore_info()
{
	var int redjointcount;
	AI_Output(other,self,"DIA_Psionic_LI_RedJointMore_01_01");	//Mám další červenou trávu.
	AI_Output(self,other,"DIA_Psionic_LI_RedJointMore_01_02");	//Výborně! Dej mi ji.
	redjointcount = Npc_HasItems(other,itpl_swampherb_02);
	GLOBALREDJOINTCOUNT = GLOBALREDJOINTCOUNT + redjointcount;
	B_GiveInvItems(other,self,itpl_swampherb_02,redjointcount);
	redjointcount = redjointcount * 100;
	B_GivePlayerXP(redjointcount);
	if(GLOBALREDJOINTCOUNT >= 5)
	{
		AI_Output(self,other,"DIA_Psionic_LI_RedJointMore_01_04");	//Dobře, myslím, že teď mám dostatek trávy na to, abych mohl zjistit co dokáže.
		AI_Output(self,other,"DIA_Psionic_LI_RedJointMore_01_06");	//Nejsem si jistý, ale myslím, že moc dlouho to trvat nebude.
		B_LogEntry(TOPIC_REDJOINT,"Přinesl jsem Lesterovi dostatek červené trávy, aby mohl zjistit co obsahuje. Teď jen musím chvíli počkat.");
		TESTSWAMPHERB = TRUE;
		TESTSWAMPHERBTIMER = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Psionic_LI_RedJointMore_01_08");	//Dobře, ale myslím si, že budu potřebovat víc pro svůj výzkum.
		AI_Output(self,other,"DIA_Psionic_LI_RedJointMore_01_09");	//Takže jestli najdeš ještě nějaké, tak bych byl rád, kdybys mi je donesl.
	};
};


instance DIA_PSIONIC_LI_REDJOINTDONE(C_Info)
{
	npc = pc_psionic_li;
	nr = 2;
	condition = dia_psionic_li_redjointdone_condition;
	information = dia_psionic_li_redjointdone_info;
	permanent = TRUE;
	description = "Tak co?";
};


func int dia_psionic_li_redjointdone_condition()
{
	if((MIS_REDJOINT == LOG_Running) && (TESTSWAMPHERB == TRUE) && (TESTSWAMPHERBREADY == FALSE))
	{
		return TRUE;
	};
};

func void dia_psionic_li_redjointdone_info()
{
	var int daynow;
	daynow = Wld_GetDay();
	AI_Output(other,self,"DIA_Psionic_LI_RedJointDone_01_00");	//Tak co?
	if(TESTSWAMPHERBTIMER <= (daynow - 1))
	{
		B_GivePlayerXP(100);
		AI_Output(self,other,"DIA_Psionic_LI_RedJointDone_01_01");	//Jsem rád, že se ptáš. (usměje se) Zjistil jsem vlastnosti té trávy.
		AI_Output(self,other,"DIA_Psionic_LI_RedJointDone_01_03");	//Když se bude postupovat správně a chvíli to v sobě podržíš - účinky budou neskutečné.
		AI_Output(self,other,"DIA_Psionic_LI_RedJointDone_01_04");	//Dokonce 'Severní soumrak' se oproti tomuhle může jít zahrabat.
		B_GiveInvItems(self,other,itmi_redjoint,1);
		AI_Output(self,other,"DIA_Psionic_LI_RedJointDone_01_07");	//Myslím, že sám uvidíš, co to umí.
		B_LogEntry(TOPIC_REDJOINT,"Lester dokončil svůj výzkum. Nezasvěcoval mě do detailů výroby, namísto toho mi dal červenou trávu již zpracovanou.");
		TESTSWAMPHERBREADY = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Psionic_LI_RedJointDone_01_09");	//Zatím nic. Vrať se později.
	};
};


instance DIA_PSIONIC_LI_REDJOINTDONEEXT(C_Info)
{
	npc = pc_psionic_li;
	nr = 2;
	condition = dia_psionic_li_redjointdoneext_condition;
	information = dia_psionic_li_redjointdoneext_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_psionic_li_redjointdoneext_condition()
{
	if(MIS_REDJOINT == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_psionic_li_redjointdoneext_info()
{
	AI_Output(self,other,"DIA_Psionic_LI_RedJointDoneExt_01_01");	//Tak co, chutnalo?
	AI_Output(other,self,"DIA_Psionic_LI_RedJointDoneExt_01_02");	//Jak jsi říkal - bylo to neskutečné. Akorát jsem teď nějaký nesvůj.
	AI_Output(self,other,"DIA_Psionic_LI_RedJointDoneExt_01_03");	//Samozřejmě, to není obyčejná tráva.
	AI_Output(self,other,"DIA_Psionic_LI_RedJointDoneExt_01_04");	//Měl by ses jít prospat. Mělo by se to zlepšit.
};


instance DIA_PSIONIC_LI_REDJOINTDONEEXTMORE(C_Info)
{
	npc = pc_psionic_li;
	nr = 2;
	condition = dia_psionic_li_redjointdoneextmore_condition;
	information = dia_psionic_li_redjointdoneextmore_info;
	permanent = FALSE;
	description = "Máš ještě nějakou trávu?";
};


func int dia_psionic_li_redjointdoneextmore_condition()
{
	if((MIS_REDJOINT == LOG_SUCCESS) && Npc_KnowsInfo(hero,dia_psionic_li_redjointdoneext))
	{
		return TRUE;
	};
};

func void dia_psionic_li_redjointdoneextmore_info()
{
	AI_Output(other,self,"DIA_Psionic_LI_RedJointDoneExtMore_01_01");	//Máš ještě nějakou trávu?
	AI_Output(self,other,"DIA_Psionic_LI_RedJointDoneExtMore_01_02");	//Chutnala, co? (směje se) Nedivím se, je fakt dobrá.
	AI_Output(self,other,"DIA_Psionic_LI_RedJointDoneExtMore_01_03");	//Na druhou stranu, raději bych to nepřeháněl.
	AI_Output(self,other,"DIA_Psionic_LI_RedJointDoneExtMore_01_05");	//Protože nevíme, co se stane po delší době užívání.
	AI_Output(self,other,"DIA_Psionic_LI_RedJointDoneExtMore_01_06");	//Pravděpodobně má nějaké vedlejší účinky. Takže bych to raději neriskoval.
};


instance DIA_PSIONIC_LI_MISSMYGOLD(C_Info)
{
	npc = pc_psionic_li;
	nr = 2;
	condition = dia_psionic_li_missmygold_condition;
	information = dia_psionic_li_missmygold_info;
	permanent = FALSE;
	description = "Nevíš něco o mém zlatě?";
};


func int dia_psionic_li_missmygold_condition()
{
	if((BEGINGOLDSEEK == TRUE) && (MIS_MISSMYGOLD == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_psionic_li_missmygold_info()
{
	AI_Output(other,self,"DIA_Psionic_LI_MissMyGold_01_01");	//Nevíš něco o mém zlatě?
	AI_Output(self,other,"DIA_Psionic_LI_MissMyGold_01_02");	//Ne, co s ním?
	AI_Output(other,self,"DIA_Psionic_LI_MissMyGold_01_03");	//Zmizelo.
	AI_Output(self,other,"DIA_Psionic_LI_MissMyGold_01_04");	//(zmateně) Zmizelo? Jak mohlo zmizet?
	AI_Output(other,self,"DIA_Psionic_LI_MissMyGold_01_05");	//No právě.
	AI_Output(self,other,"DIA_Psionic_LI_MissMyGold_01_06");	//Promiň, příteli, ale asi ti nemohu pomoct.
	B_LogEntry(TOPIC_MISSMYGOLD,"Lester mi nepomůže. Ani o tom nevěděl.");
};


instance DIA_PSIONIC_LI_AWAY(C_Info)
{
	npc = pc_psionic_li;
	nr = 3;
	condition = dia_psionic_li_away_condition;
	information = dia_psionic_li_away_info;
	permanent = FALSE;
	description = "Měl by ses vrátit.";
};


func int dia_psionic_li_away_condition()
{
	if((MIS_GATHERCREW == LOG_Running) && (LESTERLIONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_psionic_li_away_info()
{
	var int countpeopple;
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Psionic_LI_Away_01_01");	//Měl by ses vrátit.
	AI_Output(self,other,"DIA_Psionic_LI_Away_01_02");	//(udiveně) Cože? Proč?
	AI_Output(other,self,"DIA_Psionic_LI_Away_01_03");	//Protože s příštím přílivem odplouváme.
	AI_Output(self,other,"DIA_Psionic_LI_Away_01_04");	//(vesele) Konečně!
	AI_Output(self,other,"DIA_Psionic_LI_Away_01_05");	//Tenhle ostrov mi začínal lézt na mozek.
	B_LogEntry(TOPIC_GATHERCREW,"Lester byl rád, když jsem mu řekl, že opouštíme ostrov.");
	LESTERLIONBOARD = TRUE;
	if((GORNLIHERE == TRUE) && (GORNLIONBOARD == TRUE))
	{
		countpeopple = countpeopple + 1;
	};
	if((MILTENLIONBOARD == TRUE) && (MILTENLIHERE == TRUE))
	{
		countpeopple = countpeopple + 1;
	};
	if((LESTERLIONBOARD == TRUE) && (LESTERLIHERE == TRUE))
	{
		countpeopple = countpeopple + 1;
	};
	if((DIEGOLIONBOARD == TRUE) && (DIEGOLIHERE == TRUE))
	{
		countpeopple = countpeopple + 1;
	};
	if((ANGARLIONBOARD == TRUE) && (ANGARLIHERE == TRUE))
	{
		countpeopple = countpeopple + 1;
	};
	if((COUNTPEOPLEONBEACH <= countpeopple) && (LICREWONBOARD == FALSE))
	{
		LICREWONBOARD = TRUE;
	};
	AI_StopProcessInfos(self);
};


instance DIA_PSIONIC_LI_FINDMAGICORECAVE(C_Info)
{
	npc = pc_psionic_li;
	nr = 2;
	condition = dia_psionic_li_findmagicorecave_condition;
	information = dia_psionic_li_findmagicorecave_info;
	permanent = FALSE;
	description = "Našel jsem jeskyni s ložisky magické rudy.";
};


func int dia_psionic_li_findmagicorecave_condition()
{
	if((MIS_FINDMAGICORECAVE == LOG_Running) && (LIBEFORETESTOK == FALSE) && (LITESTOK == FALSE) && (GOTOORECAPITAN == FALSE))
	{
		return TRUE;
	};
};

func void dia_psionic_li_findmagicorecave_info()
{
	AI_Output(other,self,"DIA_Psionic_LI_FindMagicOreCave_01_01");	//Našel jsem jeskyni s ložisky magické rudy.
	AI_Output(self,other,"DIA_Psionic_LI_FindMagicOreCave_01_02");	//Vážně? Měl bys to říct kapitánovi.
	AI_Output(self,other,"DIA_Psionic_LI_FindMagicOreCave_01_03");	//Myslím, že ho tahle novinka bude zajímat.
	GOTOORECAPITAN = TRUE;
};


instance DIA_PSIONIC_LI_CHANGECOURSE(C_Info)
{
	npc = pc_psionic_li;
	nr = 2;
	condition = dia_psionic_li_changecourse_condition;
	information = dia_psionic_li_changecourse_info;
	permanent = FALSE;
	description = "Mám jeden dotaz.";
};


func int dia_psionic_li_changecourse_condition()
{
	if(MIS_CHANGECOURSE == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_psionic_li_changecourse_info()
{
	AI_Output(other,self,"DIA_Psionic_LI_ChangeCourse_01_02");	//Co kdybychom se vrátili na Khorinis?
	AI_Output(self,other,"DIA_Psionic_LI_ChangeCourse_01_03");	//Abych byl upřímný, to jsem nečekal.
	AI_Output(self,other,"DIA_Psionic_LI_ChangeCourse_01_04");	//Proč vlastně, mohu-li se zeptat.
	Info_ClearChoices(dia_psionic_li_changecourse);
	Info_AddChoice(dia_psionic_li_changecourse,"Jde o magickou rudu.",dia_psionic_li_changecourse_ore);
	Info_AddChoice(dia_psionic_li_changecourse,"Kvůli zlatu.",dia_psionic_li_changecourse_gold);
};

func void dia_psionic_li_changecourse_ore()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Psionic_LI_ChangeCourse_Ore_01_01");	//Jde o tu magickou rudu, kterou jsme tu našli.
	AI_Output(other,self,"DIA_Psionic_LI_ChangeCourse_Ore_01_02");	//Myslím, že bychom to měli oznámit paladinům - třeba díky tomu neprohrají válku se skřety.
	AI_Output(self,other,"DIA_Psionic_LI_ChangeCourse_Ore_01_03");	//To bychom asi měli. Ale myslím, že je to zbytečné.
	AI_Output(self,other,"DIA_Psionic_LI_ChangeCourse_Ore_01_05");	//Nemyslím si, že by jakékoliv množství rudy mohlo změnit celou válku.
	AI_Output(self,other,"DIA_Psionic_LI_ChangeCourse_Ore_01_06");	//Podle mě je už dávno prohraná a naše snaha bude k ničemu.
	AI_Output(self,other,"DIA_Psionic_LI_ChangeCourse_Ore_01_07");	//(vážně) Aspoň jsem to tak slyšel ze zvěstí na kontinentě.
	AI_Output(other,self,"DIA_Psionic_LI_ChangeCourse_Ore_01_08");	//No a? Měli bychom udělat všechno co je v našich silách.
	AI_Output(self,other,"DIA_Psionic_LI_ChangeCourse_Ore_01_10");	//Dobře... Ať se rozhodneš jakkoliv, budu stát při tobě.
	AI_Output(self,other,"DIA_Psionic_LI_ChangeCourse_Ore_01_11");	//Je jedno jak absurdní se mi tvé rozhodnutí zdá - vždycky se totiž ukáže, že jsi měl pravdu.
	B_LogEntry(TOPIC_CHANGECOURSE,"Ačkoliv se Lesterovi moc nechtělo, rozhodl že se vrátí na ostrov.");
	CREWAGREEAWAYBACKPAL = CREWAGREEAWAYBACKPAL + 1;
	COUNTPEOPLEDECIDEPRG = COUNTPEOPLEDECIDEPRG + 1;
	if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
	{
		READYCHANGECOURSE = TRUE;
		Log_AddEntry(TOPIC_CHANGECOURSE,"Vypadá to, že jsem mluvil již se všemi. Teď bych měl informovat kapitána.");
	};
	Info_ClearChoices(dia_psionic_li_changecourse);
};

func void dia_psionic_li_changecourse_gold()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Psionic_LI_ChangeCourse_Gold_01_01");	//Kvůli zlatu.
	AI_Output(other,self,"DIA_Psionic_LI_ChangeCourse_Gold_01_03");	//Tentokrát ne. Paladinové určitě zaplatí spoustu zlata za tu magickou rudu, kteoru jsme zde našli.
	AI_Output(self,other,"DIA_Psionic_LI_ChangeCourse_Gold_01_04");	//Hm... I kdyby, tak si myslím, že je to zbytečně riskantní.
	AI_Output(self,other,"DIA_Psionic_LI_ChangeCourse_Gold_01_06");	//Již když jsme odplouvali, tak byl Khorinis v ohrožení napadení skřety.
	AI_Output(self,other,"DIA_Psionic_LI_ChangeCourse_Gold_01_08");	//Skřeti už nejspíš ovládli celý ostrov. A nechce se mi přesvědčovat se osobně.
	AI_Output(self,other,"DIA_Psionic_LI_ChangeCourse_Gold_01_10");	//Dobře... Ať se rozhodneš jakkoliv, budu stát při tobě.
	AI_Output(self,other,"DIA_Psionic_LI_ChangeCourse_Gold_01_11");	//Je jedno jak absurdní se mi tvé rozhodnutí zdá - vždycky se totiž ukáže, že jsi měl pravdu.
	B_LogEntry(TOPIC_CHANGECOURSE,"Ačkoliv se Lesterovi moc nechtělo, rozhodl že se vrátí na ostrov.");
	COUNTPEOPLEDECIDEPRG = COUNTPEOPLEDECIDEPRG + 1;
	if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
	{
		READYCHANGECOURSE = TRUE;
		Log_AddEntry(TOPIC_CHANGECOURSE,"Vypadá to, že jsem mluvil již se všemi. Teď bych měl informovat kapitána.");
	};
	Info_ClearChoices(dia_psionic_li_changecourse);
};

