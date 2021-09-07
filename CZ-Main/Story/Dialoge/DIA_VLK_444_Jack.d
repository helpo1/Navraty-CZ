/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.00:

DIA_Jack_SmokePipe_Done_01_02 - opraveno other/self
DIA_Jack_SmokePipe_Done_01_04 - opraveno other/self

*/




instance DIA_Jack_EXIT(C_Info)
{
	npc = VLK_444_Jack;
	nr = 999;
	condition = DIA_Jack_EXIT_Condition;
	information = DIA_Jack_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Jack_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Jack_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Jack_PICKPOCKET(C_Info)
{
	npc = VLK_444_Jack;
	nr = 900;
	condition = DIA_Jack_PICKPOCKET_Condition;
	information = DIA_Jack_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Jack_PICKPOCKET_Condition()
{
	return C_Beklauen(50,100);
};

func void DIA_Jack_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Jack_PICKPOCKET);
	Info_AddChoice(DIA_Jack_PICKPOCKET,Dialog_Back,DIA_Jack_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Jack_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Jack_PICKPOCKET_DoIt);
};

func void DIA_Jack_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Jack_PICKPOCKET);
};

func void DIA_Jack_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Jack_PICKPOCKET);
};


instance DIA_Jack_GREET(C_Info)
{
	npc = VLK_444_Jack;
	nr = 4;
	condition = DIA_Jack_GREET_Condition;
	information = DIA_Jack_GREET_Info;
	important = TRUE;
};


func int DIA_Jack_GREET_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Jack_GREET_Info()
{
	AI_Output(self,other,"DIA_Jack_GREET_14_00");	//Zdravím, ty suchozemská kryso. Vypadá to, že zůstáváš tady.
	AI_Output(self,other,"DIA_Jack_GREET_14_01");	//Jsi nějakej pobledlej kolem žaber.
	AI_Output(self,other,"DIA_Jack_GREET_14_02");	//Nic si z toho nedělej, kámo. Všechno, co potřebuješ, je dobrý, silný mořský vzduch.
};


instance DIA_Jack_Job(C_Info)
{
	npc = VLK_444_Jack;
	nr = 5;
	condition = DIA_Jack_Job_Condition;
	information = DIA_Jack_Job_Info;
	description = "Co tady děláš?";
};


func int DIA_Jack_Job_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Jack_GREET) && (JackIsCaptain == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jack_Job_Info()
{
	AI_Output(other,self,"DIA_Jack_Job_15_00");	//Co tady děláš?
	AI_Output(self,other,"DIA_Jack_Job_14_01");	//Dřív, když jsem byl ještě mladej, jsem hodně času trávil na moři a prožil spoustu bouří.
	AI_Output(self,other,"DIA_Jack_Job_14_02");	//Před mnoha lety jsem se tu usadil a už pěknou řádku let se starám o khoriniský maják.
	AI_Output(self,other,"DIA_Jack_Job_14_03");	//Žádnej velkej kšeft. Vůbec ne. Ale ta stará věž mi tak přirostla k srdci, že už se v ní cítím jako doma.
	AI_Output(self,other,"DIA_Jack_Job_14_04");	//Už jsem tam nahoře nebyl celou věčnost.
	AI_Output(other,self,"DIA_Jack_Job_15_05");	//Proč ne?
	AI_Output(self,other,"DIA_Jack_Job_14_06");	//Od tý doby, co můj maják obsadili nějací budižkničemové, jsem neměl odvahu se tam dostat blíž než na dvacet stop. Vážně hrozná chátra.
	AI_Output(self,other,"DIA_Jack_Job_14_07");	//Jsou to trestanci z Hornického údolí, však víš.
	AI_Output(self,other,"DIA_Jack_Job_14_08");	//Jednou to na druhý straně hor pořádně bouchlo a pak zamořili celou zem jako kobylky. Teď se ukrývají úplně všude, dokonce i v mým majáku.
	AI_Output(self,other,"DIA_Jack_Job_14_09");	//Mám dojem, že vyhlížej nějakou loď, co by mohli okrást.
	AI_Output(self,other,"DIA_Jack_Job_14_10");	//Ha! Ať to udělaj. Alespoň vypadnou z mojí věže.
	Log_CreateTopic(TOPIC_KillLighthouseBandits,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KillLighthouseBandits,LOG_Running);
	B_LogEntry(TOPIC_KillLighthouseBandits,"Starý mořský vlk Jack se nemůže vrátit na svůj maják, neboť ho obsadili banditi.");
	MIS_Jack_KillLighthouseBandits = LOG_Running;
};

instance DIA_Jack_HauntedLH(C_Info)
{
	npc = VLK_444_Jack;
	nr = 5;
	condition = DIA_Jack_HauntedLH_Condition;
	information = DIA_Jack_HauntedLH_Info;
	description = "Myslíš maják, který je umístěn v moři mimo ostrov?";
};

func int DIA_Jack_HauntedLH_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Jack_Job) == TRUE) && (Kapitel <= 4))
	{
		return TRUE;
	};
};

func void DIA_Jack_HauntedLH_Info()
{
	AI_Output(other,self,"DIA_Jack_HauntedLH_01_00");	//Myslíš maják, který je umístěn v moři mimo ostrov?
	AI_Output(self,other,"DIA_Jack_HauntedLH_01_01");	//Ne, mluvím o tom který je na pevnině, na vysokém svahu nedaleko města.
	AI_Output(self,other,"DIA_Jack_HauntedLH_01_02");	//Ten v moři, velmi starý maják. Už se dlouho nepoužívá.
	AI_Output(other,self,"DIA_Jack_HauntedLH_01_03");	//Jakto?
	AI_Output(self,other,"DIA_Jack_HauntedLH_01_04");	//Ehm... lidé se tam bojí chodit. Říká se, že to tam obývají duchové.
	AI_Output(other,self,"DIA_Jack_HauntedLH_01_05");	//To myslíš vážně?
	AI_Output(self,other,"DIA_Jack_HauntedLH_01_06");	//Říkám, jak to je! Jednoho jsem viděl osobně. Před dlouhou dobou, asi deseti lety.
	AI_Output(other,self,"DIA_Jack_HauntedLH_01_07");	//Zajímavé. Duchové majáku?
   	AI_Output(self,other,"DIA_Jack_HauntedLH_01_08");	//Nevím přesně, co se tam stalo, ale lidé říkají, že maják je prokletý. A za co a proč - nikdo neví.
	MIS_HauntedLighthouse = LOG_Running;
	Log_CreateTopic(TOPIC_HauntedLighthouse,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HauntedLighthouse,LOG_Running);
	B_LogEntry(TOPIC_HauntedLighthouse,"Jak řekl Jack, starý maják který se nachází uprostřed moře u pobřeží Khorinisu je obýván duchy.");
};

instance DIA_Jack_City(C_Info)
{
	npc = VLK_444_Jack;
	nr = 6;
	condition = DIA_Jack_City_Condition;
	information = DIA_Jack_City_Info;
	description = "Přicházíš do města často?";
};


func int DIA_Jack_City_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Jack_Job) && (JackIsCaptain == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jack_City_Info()
{
	AI_Output(other,self,"DIA_Jack_City_15_00");	//Přicházíš do města často?
	AI_Output(self,other,"DIA_Jack_City_14_01");	//Vždycky říkám, že město je tak dobrý, jak dobrej je jeho přístav.
	AI_Output(self,other,"DIA_Jack_City_14_02");	//Přístav je brána do světa. Tady se všichni setkávají a tady všechno začíná.
	AI_Output(self,other,"DIA_Jack_City_14_03");	//Jakmile je přístav v háji, zbytek města dopadne brzo stejně.
};


instance DIA_Jack_Harbor(C_Info)
{
	npc = VLK_444_Jack;
	nr = 70;
	condition = DIA_Jack_Harbor_Condition;
	information = DIA_Jack_Harbor_Info;
	permanent = TRUE;
	description = "Řekni mi něco o přístavu.";
};


func int DIA_Jack_Harbor_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Jack_City) && ((Npc_GetDistToWP(self,"LIGHTHOUSE") < 3000) == FALSE) && (JackIsCaptain == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jack_Harbor_Info()
{
	AI_Output(other,self,"DIA_Jack_Harbor_15_00");	//Řekni mi něco o přístavu.
	AI_Output(self,other,"DIA_Jack_Harbor_14_01");	//Khoriniský přístav už není, co býval.
	AI_Output(self,other,"DIA_Jack_Harbor_14_02");	//Není tu nic než chátra, co se poflakuje kolem. Už sem nepřiplouvají žádné lodě a obchod je mrtvej. Tenhle přístav je odepsanej.
	Info_ClearChoices(DIA_Jack_Harbor);
	Info_AddChoice(DIA_Jack_Harbor,Dialog_Back,DIA_Jack_Harbor_Back);
	Info_AddChoice(DIA_Jack_Harbor,"Proč už sem nepřiplouvají žádné lodě?",DIA_Jack_Harbor_Ships);
	Info_AddChoice(DIA_Jack_Harbor,"Co myslíš tou chátrou?",DIA_Jack_Harbor_Rogue);
	Info_AddChoice(DIA_Jack_Harbor,"Tak proč tedy neodejdeš?",DIA_Jack_Harbor_Leave);
};

func void DIA_Jack_Harbor_Back()
{
	Info_ClearChoices(DIA_Jack_Harbor);
};

func void DIA_Jack_Harbor_Ships()
{
	AI_Output(other,self,"DIA_Jack_Harbor_Ships_15_00");	//Proč sem už nepřiplouvají žádné lodě?
	AI_Output(self,other,"DIA_Jack_Harbor_Ships_14_01");	//Všichni říkají, že až válka skončí, vrátí se všechno do starejch kolejí. Jsou to jenom kecy.
	AI_Output(self,other,"DIA_Jack_Harbor_Ships_14_02");	//Říkám ti, námořník pozná, když to jde s městem z kopce.
	AI_Output(self,other,"DIA_Jack_Harbor_Ships_14_03");	//Námořník to cítí v krvi. A řeknu ti, zapomeň na přístav, ten už to má spočítaný.
};

func void DIA_Jack_Harbor_Rogue()
{
	AI_Output(other,self,"DIA_Jack_Harbor_Rogue_15_00");	//Co myslíš tou chátrou?
	AI_Output(self,other,"DIA_Jack_Harbor_Rogue_14_01");	//Koukni na ně, líná sebranka. Většina z nich vůbec netuší, co je práce. Všechno, co svedou, je chlastat celej den a poslední prachy utratit v bordelu.
	AI_Output(self,other,"DIA_Jack_Harbor_Rogue_14_02");	//Říkám ti, drž se od nich dál.
};

func void DIA_Jack_Harbor_Leave()
{
	AI_Output(other,self,"DIA_Jack_Harbor_Leave_15_00");	//Tak proč tedy neodejdeš?
	AI_Output(self,other,"DIA_Jack_Harbor_Leave_14_01");	//Nikdo si v tuhle dobu nevezme na palubu takovýho starýho mořskýho vlka, jako jsem já.
	AI_Output(self,other,"DIA_Jack_Harbor_Leave_14_02");	//Většina lidí si myslí, že starej Jack má ve svejch prohnilejch kostech dnu.
	AI_Output(other,self,"DIA_Jack_Harbor_Leave_15_03");	//A? Je to pravda?
	AI_Output(self,other,"DIA_Jack_Harbor_Leave_14_04");	//Nesmysl. Jakmile mám palubu pod nohama, cítím se jako nový.
};


instance DIA_Jack_BANDITENWEG(C_Info)
{
	npc = VLK_444_Jack;
	nr = 7;
	condition = DIA_Jack_BANDITENWEG_Condition;
	information = DIA_Jack_BANDITENWEG_Info;
	description = "Ti banditi, co zabrali tvůj maják, jsou pryč.";
};


func int DIA_Jack_BANDITENWEG_Condition()
{
	if(Npc_IsDead(LeuchtturmBandit_1021) && Npc_IsDead(LeuchtturmBandit_1022) && Npc_IsDead(LeuchtturmBandit_1023) && (MIS_Jack_KillLighthouseBandits == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Jack_BANDITENWEG_Info()
{
	AI_Output(other,self,"DIA_Jack_BANDITENWEG_15_00");	//Ti banditi, co zabrali tvůj maják, jsou pryč.
	AI_Output(self,other,"DIA_Jack_BANDITENWEG_14_01");	//Je to vážně pravda? Konečně se můžu vrátit ke svý práci.
	AI_Output(self,other,"DIA_Jack_BANDITENWEG_14_02");	//Pojď se mnou na maják. Nahoře je krásnej výhled na moře.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Lighthouse");
	MIS_Jack_KillLighthouseBandits = LOG_SUCCESS;
	B_GivePlayerXP(XP_KillLighthouseBandits);
};

instance DIA_Jack_LIGHTHOUSEFREE(C_Info)
{
	npc = VLK_444_Jack;
	nr = 8;
	condition = DIA_Jack_LIGHTHOUSEFREE_Condition;
	information = DIA_Jack_LIGHTHOUSEFREE_Info;
	permanent = FALSE;
	description = "Máš tady pěknej maják.";
};

func int DIA_Jack_LIGHTHOUSEFREE_Condition()
{
	if((MIS_Jack_KillLighthouseBandits == LOG_SUCCESS) && (Npc_GetDistToWP(self,"LIGHTHOUSE") < 3000) && (MIS_SCKnowsWayToIrdorath == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jack_LIGHTHOUSEFREE_Info()
{
	AI_Output(other,self,"DIA_Jack_LIGHTHOUSEFREE_15_00");	//Máš tady pěknej maják.
	AI_Output(self,other,"DIA_Jack_LIGHTHOUSEFREE_14_01");	//Díky. Prostě vyjdi po všech těch schodech nahoru a vychutnej si ten nádherný výhled, chlapče. Jako doma.
};

instance DIA_Jack_SmokePipe(C_Info)
{
	npc = VLK_444_Jack;
	nr = 3;
	condition = DIA_Jack_SmokePipe_Condition;
	information = DIA_Jack_SmokePipe_Info;
	permanent = FALSE;
	description = "Nad čím přemýšlíš?";
};

func int DIA_Jack_SmokePipe_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Jack_LIGHTHOUSEFREE) == TRUE) && (Kapitel < 5))
	{
		return TRUE;
	};
};

func void DIA_Jack_SmokePipe_Info()
{
	AI_Output(other,self,"DIA_Jack_SmokePipe_01_00");	//Nad čím přemýšlíš?
	AI_Output(self,other,"DIA_Jack_SmokePipe_01_01");	//Och... Myslím, že teď by byl dobrý nápad pokouřit dobrý tabák.
	AI_Output(other,self,"DIA_Jack_SmokePipe_01_02");	//A v čem je problém?
	AI_Output(self,other,"DIA_Jack_SmokePipe_01_03");	//V tom, že moje stará fajka již není co bývala.
	AI_Output(self,other,"DIA_Jack_SmokePipe_01_04");	//A teď, když přestali přicházet loďe z pevniny...
	AI_Output(other,self,"DIA_Jack_SmokePipe_01_05");	//A co bys chtěl?
	AI_Output(self,other,"DIA_Jack_SmokePipe_01_06");	//Nooo... Jsem zvyklý na dobrý tabák a fajku. Ta stará se mnou byla věčnost a dobře mi sloužila...
	AI_Output(self,other,"DIA_Jack_SmokePipe_01_07");	//Zahřívala mě počas chladných nocí, když jsem stával na vrcholu majáku.
	AI_Output(self,other,"DIA_Jack_SmokePipe_01_08");	//Byla dokonalá...
	AI_Output(other,self,"DIA_Jack_SmokePipe_01_09");	//No, zkusím ti nějakou najít.
	AI_Output(self,other,"DIA_Jack_SmokePipe_01_10");	//Och, to by bylo od tebe velkorysé! Odměna tě nemine...
	MIS_JackSmokePipe = LOG_Running;
	Log_CreateTopic(TOPIC_JackSmokePipe,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_JackSmokePipe,LOG_Running);
	B_LogEntry(TOPIC_JackSmokePipe,"Jackovi by se zišla nová fajka. Dobře mě odmění, když mu ji seženu.");
};

instance DIA_Jack_SmokePipe_Done(C_Info)
{
	npc = VLK_444_Jack;
	nr = 3;
	condition = DIA_Jack_SmokePipe_Done_Condition;
	information = DIA_Jack_SmokePipe_Done_Info;
	permanent = FALSE;
	description = "Mám tu fajku.";
};

func int DIA_Jack_SmokePipe_Done_Condition()
{
	if((MIS_JackSmokePipe == LOG_Running) && (Npc_HasItems(other,ItMi_Smoke_Pipe) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Jack_SmokePipe_Done_Info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Jack_SmokePipe_Done_01_00");	//Mám tu fajku.
	B_GiveInvItems(other,self,ItMi_Smoke_Pipe,1);
	Npc_RemoveInvItems(self,ItMi_Smoke_Pipe,1);
	AI_Output(self,other,"DIA_Jack_SmokePipe_Done_01_01");	//To je přesně to, co potřebuju!
	AI_Output(other,self,"DIA_Jack_SmokePipe_Done_01_02");	//A co moje odměna?
	AI_Output(self,other,"DIA_Jack_SmokePipe_Done_01_03");	//Tady, vem si tohle zlato.
	B_GiveInvItems(self,other,ItMi_Gold,250);
	AI_Output(other,self,"DIA_Jack_SmokePipe_Done_01_04");	//Díky.
	MIS_JackSmokePipe = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_JackSmokePipe,LOG_SUCCESS);
	B_LogEntry(TOPIC_JackSmokePipe,"Donesl jsem Jackovi novou fajku.");
	AI_StopProcessInfos(self);

	if(Kapitel < 5)
	{
		Npc_ExchangeRoutine(self,"LighthouseSmoke");
	};
};

instance DIA_Jack_KAP3_EXIT(C_Info)
{
	npc = VLK_444_Jack;
	nr = 999;
	condition = DIA_Jack_KAP3_EXIT_Condition;
	information = DIA_Jack_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Jack_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Jack_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Jack_KAP4_EXIT(C_Info)
{
	npc = VLK_444_Jack;
	nr = 999;
	condition = DIA_Jack_KAP4_EXIT_Condition;
	information = DIA_Jack_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Jack_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Jack_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Jack_KAP5_EXIT(C_Info)
{
	npc = VLK_444_Jack;
	nr = 999;
	condition = DIA_Jack_KAP5_EXIT_Condition;
	information = DIA_Jack_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Jack_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Jack_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Jack_BEMYCAPTAIN(C_Info)
{
	npc = VLK_444_Jack;
	nr = 51;
	condition = DIA_Jack_BEMYCAPTAIN_Condition;
	information = DIA_Jack_BEMYCAPTAIN_Info;
	permanent = TRUE;
	description = "Nechtěl by ses vrátit na moře?";
};


func int DIA_Jack_BEMYCAPTAIN_Condition()
{
	if((Kapitel == 5) && (MIS_SCKnowsWayToIrdorath == TRUE) && (MIS_Jack_KillLighthouseBandits == LOG_SUCCESS) && (MIS_Jack_NewLighthouseOfficer == 0))
	{
		return TRUE;
	};
};

func void DIA_Jack_BEMYCAPTAIN_Info()
{
	AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN_15_00");	//Nechtěl by ses vrátit na moře?
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_14_01");	//Dal bych pravou ruku za to, kdyby mě ještě jednou někdo najal na velkej škuner.
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_14_02");	//Ale pro takovýho starýho mořskýho vlka to není tak snadný, hochu. A stejně, kdo by se pak staral o maják?
	Info_ClearChoices(DIA_Jack_BEMYCAPTAIN);
	Info_AddChoice(DIA_Jack_BEMYCAPTAIN,"Nevadí. Byl to jen nápad.",DIA_Jack_BEMYCAPTAIN_no);
	Info_AddChoice(DIA_Jack_BEMYCAPTAIN,"Potřebuju tvoje námořnický zkušenosti.",DIA_Jack_BEMYCAPTAIN_seaman);
};

func void DIA_Jack_BEMYCAPTAIN_seaman()
{
	AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN_seaman_15_00");	//Potřebuju tvoje námořnický zkušenosti.
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_seaman_14_01");	//U všech rozvrzanejch fošen. Co máš za lubem, chlapče? Nehodláš si vyzkoušet palubu královský válečný galéry, že ne?
	AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN_seaman_15_02");	//Kdo ví?
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_seaman_14_03");	//(smích) To by mohlo něco znamenat. No dobrá. Nemůžu tu jen tak nechat můj maják. Mmh. Co s tím uděláme?
	Log_CreateTopic(Topic_Captain,LOG_MISSION);
	Log_SetTopicStatus(Topic_Captain,LOG_Running);
	B_LogEntry(Topic_Captain,"Ze starého námořníka Jacka z přístavu může být dobrý kapitán - nejdřív ale musím sehnat někoho, kdo mu ohlídá maják.");
	Info_ClearChoices(DIA_Jack_BEMYCAPTAIN);
	Info_AddChoice(DIA_Jack_BEMYCAPTAIN,"Nevadí. Byl to jen nápad.",DIA_Jack_BEMYCAPTAIN_no);
	Info_AddChoice(DIA_Jack_BEMYCAPTAIN,"Co když ti někoho přivedu...?",DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer);
};

func void DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer()
{
	AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_15_00");	//Co když ti seženu někoho, kdo se zatím o maják postará?
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_01");	//To není špatnej nápad, hochu. A já takovýho člověka znám.
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_02");	//Kovář Harad má učedníka jménem Brian. Už jsem s ním hodněkrát mluvil.
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_03");	//Chtěl bych svůj maják svěřit právě jemu. Myslim, že je pro to ten pravej.
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_04");	//Běž si s ním promluvit. Možná budeme mít štěstí a ten kluk nám pomůže.
	Info_ClearChoices(DIA_Jack_BEMYCAPTAIN);
	MIS_Jack_NewLighthouseOfficer = LOG_Running;
};

func void DIA_Jack_BEMYCAPTAIN_no()
{
	AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN_no_15_00");	//Nevadí. Byl to jen nápad.
	Info_ClearChoices(DIA_Jack_BEMYCAPTAIN);
};


instance DIA_Jack_BEMYCAPTAIN2(C_Info)
{
	npc = VLK_444_Jack;
	nr = 52;
	condition = DIA_Jack_BEMYCAPTAIN2_Condition;
	information = DIA_Jack_BEMYCAPTAIN2_Info;
	description = "Co se týče Briana...";
};


func int DIA_Jack_BEMYCAPTAIN2_Condition()
{
	if((MIS_Jack_NewLighthouseOfficer == LOG_SUCCESS) || ((MIS_Jack_NewLighthouseOfficer == LOG_Running) && Npc_IsDead(Brian)))
	{
		return TRUE;
	};
};

func void DIA_Jack_BEMYCAPTAIN2_Info()
{
	if(Npc_IsDead(Brian))
	{
		AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN2_15_00");	//Brian je mrtvý.
		AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN2_14_01");	//Ach. Tohle jsou strašný časy. A byli jsme tak dobrý kámoši.
		MIS_Jack_NewLighthouseOfficer = LOG_OBSOLETE;
	}
	else
	{
		AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN2_15_02");	//Brian se odteď bude starat o tvůj maják.
		AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN2_14_03");	//Doufal jsem, že to řekneš.
		B_GivePlayerXP(XP_Jack_NewLighthouseOfficer);

		if(SCGotCaptain == FALSE)
		{
			AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN2_14_04");	//Ještě mě pořád potřebuješ?
		}
		else
		{
			AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN2_14_05");	//Podíváme se, jestli je ten kluk k něčemu dobrej
			AI_StopProcessInfos(self);
		};
	};
};


instance DIA_Jack_BEMYCAPTAIN3(C_Info)
{
	npc = VLK_444_Jack;
	nr = 53;
	condition = DIA_Jack_BEMYCAPTAIN3_Condition;
	information = DIA_Jack_BEMYCAPTAIN3_Info;
	description = "Buď mým kapitánem!";
};


func int DIA_Jack_BEMYCAPTAIN3_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Jack_BEMYCAPTAIN2) && (SCGotCaptain == FALSE) && (MIS_Jack_NewLighthouseOfficer == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Jack_BEMYCAPTAIN3_Info()
{
	AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN3_15_00");	//Buď mým kapitánem!
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN3_14_01");	//Proplul jsem sedmero moří, hochu, ale ještě nikdy jsem nebyl kapitánem lodi.
	AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN3_15_02");	//O navigaci nevím vůbec nic. Měl by ses toho ujmout sám.
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN3_14_03");	//Udělám, co bude v mých silách.
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN3_14_04");	//Tak mi ukaž svou loď i s posádkou. A víš ty vůbec, kam máme namířeno? Myslím, jestli máš námořní mapu?
	AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN3_15_05");	//Počkej na mě v přístavu. O zbytek se nestarej.
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN3_14_06");	//Když to říkáš.
	AI_StopProcessInfos(self);
	SCGotCaptain = TRUE;
	JackIsCaptain = TRUE;
	Npc_ExchangeRoutine(self,"WaitForShipCaptain");
	B_GivePlayerXP(XP_Captain_Success);
};


instance DIA_Jack_LOSFAHREN(C_Info)
{
	npc = VLK_444_Jack;
	nr = 59;
	condition = DIA_Jack_LOSFAHREN_Condition;
	information = DIA_Jack_LOSFAHREN_Info;
	permanent = TRUE;
	description = "Dobrá. Tak vyplouváme!";
};


func int DIA_Jack_LOSFAHREN_Condition()
{
	if((JackIsCaptain == TRUE) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jack_LOSFAHREN_Info()
{
	AI_Output(other,self,"DIA_Jack_LOSFAHREN_15_00");	//Dobrá. Tak vyplouváme!

	if(B_CaptainConditions(self) == TRUE)
	{
		AI_Output(self,other,"DIA_Jack_LOSFAHREN_14_01");	//Všechno je v pořádku. Tak mi ukaž tu námořní mapu.
		AI_Output(other,self,"DIA_Jack_LOSFAHREN_14_07");	//Tady je.
		B_GiveInvItems(other,self,ItWr_Seamap_Irdorath,1);
		AI_Output(self,other,"DIA_Jack_LOSFAHREN_14_02");	//To bude pěknej výlet. Doufám, že se tam dostaneme v jednom kuse.
		AI_Output(self,other,"DIA_Jack_LOSFAHREN_14_03");	//Máš opravdu všechno, co potřebuješ? Nebudeme se vracet jen proto, že jsi něco zapomněl.
		AI_Output(self,other,"DIA_Jack_LOSFAHREN_14_04");	//Jestli jseš si jistej, že máme opravdu všechno, běž do kapitánský kajuty a dej si dvacet. Bude se ti to hodit!
		B_GiveInvItems(self,other,ItKe_Ship_Levelchange_MIS,1);
		AI_StopProcessInfos(self);
		B_CaptainCallsAllOnBoard(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Jack_LOSFAHREN_14_05");	//Klídek, chlapče. Ještě jsem ten škopek neviděl. Takhle to nepude.
		AI_Output(self,other,"DIA_Jack_LOSFAHREN_14_06");	//Nejdřív budeš potřebovat kompletní posádku s minimálně pěti chlapama, volný přístup na loď a námořní mapu. Jinak na to zapomeň.
		AI_StopProcessInfos(self);
	};
};

instance DIA_Jack_KAP6_EXIT(C_Info)
{
	npc = VLK_444_Jack;
	nr = 999;
	condition = DIA_Jack_KAP6_EXIT_Condition;
	information = DIA_Jack_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Jack_KAP6_EXIT_Condition()
{
	if(Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Jack_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JACK_NW_KAPITELORCATTACK(C_Info)
{
	npc = VLK_444_Jack;
	nr = 1;
	condition = dia_jack_nw_kapitelorcattack_condition;
	information = dia_jack_nw_kapitelorcattack_info;
	permanent = FALSE;
	description = "Co máte za hlášení kapitáne?";
};


func int dia_jack_nw_kapitelorcattack_condition()
{
	if((MIS_HELPCREW == LOG_Running) && (MOVECREWTOHOME == FALSE) && (JACKBACKNW == TRUE))
	{
		return TRUE;
	};
};

func void dia_jack_nw_kapitelorcattack_info()
{
	AI_Output(other,self,"DIA_Jack_NW_KapitelOrcAttack_01_00");	//Co máte za hlášení kapitáne?
	AI_Output(self,other,"DIA_Jack_NW_KapitelOrcAttack_01_01");	//Ano, zdá se, že je to pravda, co se říká...(smutně) Khorinis obsadili skřeti! Teď odsud nemůžeme vystrčit ani nos!
	AI_Output(other,self,"DIA_Jack_NW_KapitelOrcAttack_01_02");	//Pár chlapů se chce zkusit probojovat skrz město...
	AI_Output(self,other,"DIA_Jack_NW_KapitelOrcAttack_01_04");	//Možná že jo, zkušený voják by to mohl dokázat... ale co mi ostatní?
	AI_Output(self,other,"DIA_Jack_NW_KapitelOrcAttack_01_03");	//Eh, to mi neříkej ani ze srandy!... (vyděšeně) Já ani meč v ruce neudržím, už na to nemám léta, a navíc proti skřetům...
	Info_ClearChoices(dia_jack_nw_kapitelorcattack);

	if(Npc_HasItems(other,ItMi_TeleportTaverne) >= 1)
	{
		Info_AddChoice(dia_jack_nw_kapitelorcattack,"Nabídnout teleportační runu k hostinci.",dia_jack_nw_kapitelorcattack_taverne);
	};
	Info_AddChoice(dia_jack_nw_kapitelorcattack,"Je nezbytné, abys bojoval.",dia_jack_nw_kapitelorcattack_nogiverune);
};

func void dia_jack_nw_kapitelorcattack_taverne()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Jack_NW_KapitelOrcAttack_Taverne_01_01");	//Počkej, uklidni se! Mám tady u sebe teleportační runu k hostinci 'U Mrtvé harpyje'.
	AI_Output(other,self,"DIA_Jack_NW_KapitelOrcAttack_Taverne_01_05");	//Navíc, Vy opravdu nejste schopen čelit tolika skřetům, a rozhodně byste to až k bráně nezvládl.
	AI_Output(self,other,"DIA_Jack_NW_KapitelOrcAttack_Taverne_01_08");	//Dobrá... (značně skepticky) Doufám, že takhle přesvědčíš i ostatní. Vezmu si ji.
	B_GiveInvItems(other,self,ItMi_TeleportTaverne,1);
	Npc_RemoveInvItems(self,ItMi_TeleportTaverne,1);
	AI_Output(self,other,"DIA_Jack_NW_KapitelOrcAttack_Taverne_01_10");	//Eh! Doufám, že po tom cestování nebudu mít kocovinu, jako posledně po těžkým fláku.
	JACKNOBATTLETHROUGTH = TRUE;
	B_LogEntry(TOPIC_HELPCREW,"Dal jsem kapitánovi teleportční runu k hostinci 'U Mrtvé harpyje'. Teď už se o něj nemusím strachovat!");
	PERMCOUNTBACKNW = PERMCOUNTBACKNW + 1;
	b_countbackcrew();
	AI_StopProcessInfos(self);
};

func void dia_jack_nw_kapitelorcattack_nogiverune()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Jack_NW_KapitelOrcAttack_NoGiveRune_01_01");	//Musíš bojovat! Jiná možnost, jak se odtud dostat bohužel není!
	AI_Output(self,other,"DIA_Jack_NW_KapitelOrcAttack_NoGiveRune_01_02");	//Nemyslím si, že to zvládnu... (vydýchne si) ale můžeš vzít jed na to, že to zkusím.
	AI_Output(other,self,"DIA_Jack_NW_KapitelOrcAttack_NoGiveRune_01_03");	//Tak dobrá! Určitě to zvládneš.
	AI_Output(self,other,"DIA_Jack_NW_KapitelOrcAttack_NoGiveRune_01_04");	//Díky.
	B_LogEntry(TOPIC_HELPCREW,"Kapitán se s ostatními pokusí probojovat si cestu skrz město. Ale myslím si, že nemá šanci!");
	JACKBATTLETHROUGTH = TRUE;
	PERMCOUNTBACKNW = PERMCOUNTBACKNW + 1;
	b_countbackcrew();
	AI_StopProcessInfos(self);
};


instance DIA_JACK_NW_AGAINCAPITAN(C_Info)
{
	npc = VLK_444_Jack;
	nr = 1;
	condition = dia_jack_nw_againcapitan_condition;
	information = dia_jack_nw_againcapitan_info;
	permanent = FALSE;
	description = "Potřebuju zase kapitána na moji loď.";
};


func int dia_jack_nw_againcapitan_condition()
{
	if(Npc_KnowsInfo(hero,dia_lord_hagen_needcapitan) && (WHOTRAVELONBIGLAND == FALSE) && (SHIPAGAINACCESS == TRUE))
	{
		return TRUE;
	};
};

func void dia_jack_nw_againcapitan_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Jack_NW_AgainCapitan_01_00");	//Potřebuju zase kapitána na moji loď.
	AI_Output(self,other,"DIA_Jack_NW_AgainCapitan_01_01");	//Hmmm... (podezíravě) A kam se budem plavit tentokrát?
	AI_Output(other,self,"DIA_Jack_NW_AgainCapitan_01_02");	//Na pevninu. Mám velmi důležitou zprávu pro krále! Pomůžeš mi s tím?!
	AI_Output(self,other,"DIA_Jack_NW_AgainCapitan_01_03");	//Na pevninu?! Eh, chlape... (nerozhodně) To tě asi zklamu, já se nechci plavit na pevninu!
	AI_Output(self,other,"DIA_Jack_NW_AgainCapitan_01_04");	//Slyšel jsem, že na pevnině to mají se skřety ještě horší, než jsme měli my.
	AI_Output(self,other,"DIA_Jack_NW_AgainCapitan_01_05");	//Takže by ses měl podívat po někom jiném.
	AI_Output(other,self,"DIA_Jack_NW_AgainCapitan_01_06");	//Tak to je škoda, počítal jsem s tebou.
	B_LogEntry(TOPIC_SALETOBIGLAND,"Jack se se mnou odmítl plavit na pevninu.");
};

instance DIA_JACK_BANDITENWEG1(C_Info)
{
	npc = VLK_444_Jack;
	nr = 2;
	condition = dia_jack_banditenweg1_condition;
	information = dia_jack_banditenweg1_info;
	permanent = FALSE;
	description = "Co víš o pirátech?";
};

func int dia_jack_banditenweg1_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Jack_City))
	{
		return TRUE;
	};
};

func void dia_jack_banditenweg1_info()
{
	AI_Output(other,self,"DIA_Jack_BANDITENWEG_01_01");	//Co víš o pirátech?
	AI_Output(self,other,"DIA_Jack_BANDITENWEG_01_02");	//Noo... všichni piráti jsou stejní - zloději a budižkničemové!
	AI_Output(self,other,"DIA_Jack_BANDITENWEG_01_03");	//Pravda, za jejich krutostí a nelidskostí se někdy skrývá i něco jiného...
	AI_Output(self,other,"DIA_Jack_BANDITENWEG_01_04");	//Například na zabití času mezi loupežemi skládají písně a básně.
	AI_Output(self,other,"DIA_Jack_BANDITENWEG_01_05");	//A často jsou vcelku dobré! Chtěl bys nějakou slyšet?
	Info_ClearChoices(dia_jack_banditenweg1);
	Info_AddChoice(dia_jack_banditenweg1,"Ne, díky.",dia_jack_banditenweg1_no);
	Info_AddChoice(dia_jack_banditenweg1,"Tak to skus!",dia_jack_banditenweg1_yes);
};

func void dia_jack_banditenweg1_no()
{
	AI_Output(other,self,"DIA_Jack_BANDITENWEG_no_01_01");	//Ne, díky.
	AI_Output(self,other,"DIA_Jack_BANDITENWEG_no_01_02");	//Chápu...
	AI_StopProcessInfos(self);
};

func void dia_jack_banditenweg1_yes()
{
	AI_Output(other,self,"DIA_Jack_BANDITENWEG_yes_01_01");	//Tak to skus!
	AI_Output(self,other,"DIA_Jack_BANDITENWEG_yes_01_02");	//Tak poslouchej...
	AI_Output(self,other,"DIA_Jack_BANDITENWEG_yes_01_03");	//Piráti, ta cháska bídná, to už každej ví, 
	AI_Output(self,other,"DIA_Jack_BANDITENWEG_yes_01_04");	//o nich vyprávěj se příběhy, kdy tě až zamrazí.
	AI_Output(self,other,"DIA_Jack_BANDITENWEG_yes_01_05");	//Než se vydáš na moře, černý sny budeš mít,
	AI_Output(self,other,"DIA_Jack_BANDITENWEG_yes_01_06");	//potkáš-li nás piráty, na dně moře budeš hnít.
	AI_Output(self,other,"DIA_Jack_BANDITENWEG_yes_01_07");	//Johohou johohou piráti se rumem nalejou.
	AI_Output(self,other,"DIA_Jack_BANDITENWEG_yes_01_08");	//Johohou johohou potápěj jednu loď za druhou. 
	AI_Output(self,other,"DIA_Jack_BANDITENWEG_yes_01_09");	//Na moře se vydáme a naším cílem jest,
	AI_Output(self,other,"DIA_Jack_BANDITENWEG_yes_01_10");	//potopit pár plachetnic, napakovat se fest. 
	AI_Output(self,other,"DIA_Jack_BANDITENWEG_yes_01_11");	//Až uvidíš černou vlajku, hnáty zkřížený, 
	AI_Output(self,other,"DIA_Jack_BANDITENWEG_yes_01_12");	//odříkej si otčenáš, už máš to spočtený.
	AI_Output(self,other,"DIA_Jack_BANDITENWEG_yes_01_13");	//Johohou johohou piráti se rumem nalejou.
	AI_Output(self,other,"DIA_Jack_BANDITENWEG_yes_01_14");	//Johohou johohou potápěj jednu loď za druhou.
	AI_Output(self,other,"DIA_Jack_BANDITENWEG_yes_01_15");	//Pravá noha dřevěná, na levý ruce hák,
	AI_Output(self,other,"DIA_Jack_BANDITENWEG_yes_01_16");	//tak to je náš kapitán, z lodi udělá vám vrak. 
	AI_Output(self,other,"DIA_Jack_BANDITENWEG_yes_01_17");	//Ať slunce pálí nebo bouře zmítá kajutou
	AI_Output(self,other,"DIA_Jack_BANDITENWEG_yes_01_18");	//My piráti jsme ve svým živlu pějem píseň svou.
	AI_Output(self,other,"DIA_Jack_BANDITENWEG_yes_01_19");	//Hmmm... tak co na to říkáš?
	Info_ClearChoices(dia_jack_banditenweg1);
	Info_AddChoice(dia_jack_banditenweg1,"Nic moc.",dia_jack_banditenweg1_not);
	Info_AddChoice(dia_jack_banditenweg1,"To bylo teda něco!",dia_jack_banditenweg1_yea);
};

func void dia_jack_banditenweg1_not()
{
	AI_Output(other,self,"DIA_Jack_BANDITENWEG_not_01_01");	//Nic moc.
	AI_Output(self,other,"DIA_Jack_BANDITENWEG_not_01_02");	//Co...? (naštvaně) Tak se teda uvidíme později!
	AI_StopProcessInfos(self);
};

func void dia_jack_banditenweg1_yea()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Jack_BANDITENWEG_yea_01_01");	//To bylo teda něco!
	AI_Output(self,other,"DIA_Jack_BANDITENWEG_yea_01_02");	//Věděl jsem, že se ti bude líbit.
	AI_Output(other,self,"DIA_Jack_BANDITENWEG_yea_01_03");	//Ty jsi byl pirát?
	AI_Output(self,other,"DIA_Jack_BANDITENWEG_yea_01_04");	//Kdo! Já? Co tě to napadá... Já jsem jen starý námořník.
	AI_Output(other,self,"DIA_Jack_BANDITENWEG_yea_01_05");	//Samozřejmě...
	AI_StopProcessInfos(self);
};

instance DIA_Jack_DiscoverLH(C_Info)
{
	npc = VLK_444_Jack;
	nr = 5;
	condition = DIA_Jack_DiscoverLH_Condition;
	information = DIA_Jack_DiscoverLH_Info;
	description = "Slyšel jsi už o pirátovi se jménem Kelevra?";
};

func int DIA_Jack_DiscoverLH_Condition()
{
	if((MIS_HauntedLighthouse == LOG_Running) && (KnowStoryDLH == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Jack_DiscoverLH_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Jack_DiscoverLH_01_00");	//Slyšel jsi už o pirátovi se jménem Kelevra?
	AI_Output(self,other,"DIA_Jack_DiscoverLH_01_01");	//Ještě jsem o něm neslyšel.
	AI_Output(self,other,"DIA_Jack_DiscoverLH_01_02");	//A celkově se snažím nemít s piráty nic společného.
	AI_Output(other,self,"DIA_Jack_DiscoverLH_01_03");	//Chápu.
	CanGoGreg = TRUE;
	B_LogEntry(TOPIC_HauntedLighthouse,"Jack o Kelevrovi nic neví. Možná bych se měl zeptat samotných pirátů?");
};

instance DIA_Jack_GotPirate(C_Info)
{
	npc = VLK_444_Jack;
	nr = 5;
	condition = DIA_Jack_GotPirate_Condition;
	information = DIA_Jack_GotPirate_Info;
	description = "Ahoj Jacku.";
};

func int DIA_Jack_GotPirate_Condition()
{
	if((MIS_HauntedLighthouse == LOG_Running) && (GotPirate == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Jack_GotPirate_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Jack_GotPirate_01_00");	//Nebo ti mám říkat Kelevra?
	AI_Output(self,other,"DIA_Jack_GotPirate_01_01");	//Co?
	AI_Output(other,self,"DIA_Jack_GotPirate_01_02");	//Nezkoušej to popřít. Greg mi všechno pověděl.
	AI_Output(self,other,"DIA_Jack_GotPirate_01_03");	//Zatraceně! ... Och... A co?
	AI_Output(other,self,"DIA_Jack_GotPirate_01_04");	//Vypadá to, že nejsi úplně obyčejný muž, jak vypadáš.
	AI_Output(self,other,"DIA_Jack_GotPirate_01_05");	//O co ti jde?
	AI_Output(other,self,"DIA_Jack_GotPirate_01_06");	//Myslím, že vím, kam tím směřujeme. Nakonec, byl jsi to ty, kdo zabil Štěpána, i když ti zachránil život.
	AI_Output(self,other,"DIA_Jack_GotPirate_01_07");	//Jen aby jsi zhořel v plamenech Beliara! Odkud to všechno víš? To ti pověděl Greg?
	AI_Output(other,self,"DIA_Jack_GotPirate_01_08");	//Pověděl mi to správce, kterého jsi zabil jen proto, že ti nechtěl dát loď.
	AI_Output(self,other,"DIA_Jack_GotPirate_01_09");	//Ano, zabil jsem ho! Tak co teď? Zabiješ mě? Do toho! Ještě teď mi to nedává spát.
	AI_Output(self,other,"DIA_Jack_GotPirate_01_10");	//Po tom, co se to stalo, jsem skončil s pirátstvím a usadil jsem se na pobřeží a začal jsem pracovat jako správce majáku.
	AI_Output(other,self,"DIA_Jack_GotPirate_01_11");	//Já tě nezabiju. Mám lepší nápad. Pomůžeš mi zlomit kletbu z majáku.
	AI_Output(self,other,"DIA_Jack_GotPirate_01_12");	//Já?! A co bych měl jako podle tebe udělat? Jít tam zemřít?
	AI_Output(other,self,"DIA_Jack_GotPirate_01_13");	//To hádam nebude nutné. Stačí když požádáš ducha o odpuštění a mělo by to oslabit kletbu.
	AI_Output(other,self,"DIA_Jack_GotPirate_01_14");	//Ale v jedné věci máš pravdu. Budeš tam muset jít.
	AI_Output(self,other,"DIA_Jack_GotPirate_01_15");	//Tak to mě rovnou zabij! Vyjde to na stejno.
	AI_Output(self,other,"DIA_Jack_GotPirate_01_16");	//Jenom... Před tím, než půjdu, nechej mě si zařídit pár věcí tady na pláži. Nevím, jestli se odtamtud vrátím, anebo ne.
	AI_Output(other,self,"DIA_Jack_GotPirate_01_17");	//Dobře. Máš jeden den.
	AI_Output(self,other,"DIA_Jack_GotPirate_01_18");	//Pozítří se teda setkáme u majáku.
	AI_Output(other,self,"DIA_Jack_GotPirate_01_19");	//Uvidíme se. Och, a ješte něco co mi vrtá hlavou... Co znamená tá přezdívka Kelevra?
	AI_Output(self,other,"DIA_Jack_GotPirate_01_20");	//V jazyce asasínů to znamená Zlý pes. Neptej se, jak jsem ho dostal.
	JackGoLH = TRUE;
	JackGoLHDay = Wld_GetDay();
	B_LogEntry(TOPIC_HauntedLighthouse,"Jack se přiznal. Teď s ním půjdů zkusit zlomit kletbu z majáku.");
	AI_StopProcessInfos(self);
};

instance DIA_Jack_OnLH(C_Info)
{
	npc = VLK_444_Jack;
	nr = 5;
	condition = DIA_Jack_OnLH_Condition;
	information = DIA_Jack_OnLH_Info;
	important = TRUE;
};

func int DIA_Jack_OnLH_Condition()
{
	if((MIS_HauntedLighthouse == LOG_Running) && (JackOnLH == TRUE) && (Npc_GetDistToWP(self,"NW_JACK_LH_01") <= 1000))
	{
		return TRUE;
	};
};

func void DIA_Jack_OnLH_Info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_Jack_OnLH_01_00");	//Tak ty jsi přišel.
	AI_Output(self,other,"DIA_Jack_OnLH_01_01");	//Za koho mě máš, chlapče? Když jednou dám svoje slovo, tak ho dodržím.
	AI_Output(other,self,"DIA_Jack_OnLH_01_02");	//Tak pojďme. Nechej mě mluvit.
	AI_Output(self,other,"DIA_Jack_OnLH_01_03");	//Jak si přeješ.
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	JackMeetLHGhost = TRUE;
	B_LogEntry(TOPIC_HauntedLighthouse,"Setkal jsme se s Jackem u majáku a spolu jsme se vydali za Štěpánovým duchem.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FollowLH");
};

instance DIA_Jack_OnLHDone(C_Info)
{
	npc = VLK_444_Jack;
	nr = 5;
	condition = DIA_Jack_OnLHDone_Condition;
	information = DIA_Jack_OnLHDone_Info;
	important = TRUE;
};

func int DIA_Jack_OnLHDone_Condition()
{
	if(FinishStoryLH == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Jack_OnLHDone_Info()
{
	AI_Output(self,other,"DIA_Jack_OnLHDone_01_00");	//Tak to mě podrž! Už jsem si myslel, že jsem mrtvý.
	AI_Output(other,self,"DIA_Jack_OnLHDone_01_01");	//Uklidni se. Všechno je v pohodě.
	AI_Output(self,other,"DIA_Jack_OnLHDone_01_02");	//Po tom všem mám pocit, jako by mi spadl kámen ze srdce.

	if(JackMeetGhost == TRUE)
	{
		B_GivePlayerXP(1000);
		AI_Output(other,self,"DIA_Jack_OnLHDone_01_03");	//A co se ti stalo s okem?
		AI_Output(self,other,"DIA_Jack_OnLHDone_01_04");	//Och, osleplo... Památka na toho ducha.
		AI_Output(other,self,"DIA_Jack_OnLHDone_01_05");	//Máš štěstí, že tě nezabil.
		AI_Output(self,other,"DIA_Jack_OnLHDone_01_06");	//To mi nemusíš říkat. Díky za pomoc. Navždy budu tvým dlužníkem.
		MIS_HauntedLighthouse = LOG_Success;
		Log_SetTopicStatus(TOPIC_HauntedLighthouse,LOG_Success);
		B_LogEntry(TOPIC_HauntedLighthouse,"Zbavil jsem maják kletby.");
	}
	else
	{
		B_GivePlayerXP(500);
		AI_Output(self,other,"DIA_Jack_OnLHDone_01_08");	//Díky za pomoc. Navždy budu tvým dlužníkem.
	};

	AI_StopProcessInfos(self);

	if(JackIsCaptain == TRUE)
	{
		Npc_ExchangeRoutine(self,"WaitForShipCaptain");
	}
	else if(MIS_JackSmokePipe == LOG_SUCCESS)
	{
		Npc_ExchangeRoutine(self,"LighthouseSmoke");
	}
	else
	{
		if(MIS_Jack_KillLighthouseBandits == LOG_SUCCESS)
		{
			Npc_ExchangeRoutine(self,"Lighthouse");
		}
		else
		{
			Npc_ExchangeRoutine(self,"Start");
		};
	};
};
