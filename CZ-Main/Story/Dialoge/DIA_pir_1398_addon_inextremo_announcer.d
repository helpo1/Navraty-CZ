	
instance DIA_ADDON_INEXTREMO_ANNOUNCER_EXIT(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 999;
	condition = dia_addon_inextremo_announcer_exit_condition;
	information = dia_addon_inextremo_announcer_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_addon_inextremo_announcer_exit_condition()
{
	return TRUE;
};

func void dia_addon_inextremo_announcer_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_INEXTREMO_ANNOUNCER_PICKPOCKET(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 900;
	condition = dia_addon_inextremo_announcer_pickpocket_condition;
	information = dia_addon_inextremo_announcer_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_addon_inextremo_announcer_pickpocket_condition()
{
	return C_Beklauen(118,300);
};

func void dia_addon_inextremo_announcer_pickpocket_info()
{
	Info_ClearChoices(dia_addon_inextremo_announcer_pickpocket);
	Info_AddChoice(dia_addon_inextremo_announcer_pickpocket,Dialog_Back,dia_addon_inextremo_announcer_pickpocket_back);
	Info_AddChoice(dia_addon_inextremo_announcer_pickpocket,DIALOG_PICKPOCKET,dia_addon_inextremo_announcer_pickpocket_doit);
};

func void dia_addon_inextremo_announcer_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_addon_inextremo_announcer_pickpocket);
};

func void dia_addon_inextremo_announcer_pickpocket_back()
{
	Info_ClearChoices(dia_addon_inextremo_announcer_pickpocket);
};


instance DIA_ADDON_INEXTREMO_ANNOUNCER_HI(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_hi_condition;
	information = dia_addon_inextremo_announcer_hi_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_inextremo_announcer_hi_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && Wld_IsTime(8,0,20,0) && (JOINKILLERS == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_hi_info()
{
	AI_Output(self,other,"DIA_pir_1398_Hi_01_00");	//Co chceš? Nevidíš, že máme práci?!
	AI_Output(self,other,"DIA_pir_1398_Hi_01_01");	//Promluvíme si později!
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
};


instance DIA_ADDON_INEXTREMO_ANNOUNCER_HALLO(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_hallo_condition;
	information = dia_addon_inextremo_announcer_hallo_info;
	permanent = FALSE;
	description = "Kdo jsi?";
};


func int dia_addon_inextremo_announcer_hallo_condition()
{
	if((JOINKILLERS == FALSE) && (Npc_GetDistToWP(self,"OCR_ANNOUNCER") <= 1000))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_hallo_info()
{
	AI_Output(other,self,"DIA_pir_1398_Hallo_01_00");	//Kdo jsi?
	AI_Output(self,other,"DIA_pir_1398_Hallo_01_03");	//Copak to nevidíš? (smích) Jsme kočovní hudebníci a kejklíři, bavíme publikum.
	AI_Output(other,self,"DIA_pir_1398_Hallo_01_04");	//Jak dlouho už jste tady?
	AI_Output(self,other,"DIA_pir_1398_Hallo_01_05");	//Několik měsíců. Většinou se snažíme, abychom nezůstávali na jednom místě příliš dlouho, ale...
	AI_Output(self,other,"DIA_pir_1398_Hallo_01_06");	//... do místního přístavu doposud nepřiplula žádná loď. Samozřejmě pokud nepočítáme galéru s paladiny, která přijela před pár týdny.
	AI_Output(self,other,"DIA_pir_1398_Hallo_01_09");	//I když nám vlastně ani moc nezáleží na tom, kde zrovna hrajeme.
	MEETSTID = TRUE;
};


instance DIA_ADDON_INEXTREMO_ANNOUNCER_HALLOTWO(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_hallotwo_condition;
	information = dia_addon_inextremo_announcer_hallotwo_info;
	permanent = FALSE;
	description = "Jaký to je život?";
};


func int dia_addon_inextremo_announcer_hallotwo_condition()
{
	if(Npc_KnowsInfo(hero,dia_addon_inextremo_announcer_hallo) && (CHECKFLAGKILLSMEET == FALSE) && (JOINKILLERS == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_hallotwo_info()
{
	AI_Output(other,self,"DIA_pir_1398_HalloTwo_01_00");	//Jaký to je život?
	AI_Output(self,other,"DIA_pir_1398_HalloTwo_01_01");	//Nemůžem si stěžovat.
	AI_Output(self,other,"DIA_pir_1398_HalloTwo_01_02");	//Kromě vlastních věcí nepotřebujeme mnoho. Pár zlatých na jídlo a někdy pivo.
	AI_Output(self,other,"DIA_pir_1398_HalloTwo_01_03");	//Samozřejmě, že je těžké se zavděčit všem, ale většině obyvatel, jak se zdá, se naše představení líbí.
};


instance DIA_ADDON_INEXTREMO_ANNOUNCER_MENTION(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_mention_condition;
	information = dia_addon_inextremo_announcer_mention_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_inextremo_announcer_mention_condition()
{
	if(Npc_KnowsInfo(hero,dia_addon_inextremo_announcer_hallotwo) && (CHECKFLAGKILLSMEET == FALSE) && (Npc_GetDistToWP(self,"OCR_ANNOUNCER") <= 1000))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_mention_info()
{
	AI_Output(self,other,"DIA_pir_1398_Mention_01_00");	//Jo... A ještě něco...
	AI_Output(self,other,"DIA_pir_1398_Mention_01_02");	//Chci tě požádat - neobtěžuj ostatní.
	AI_Output(self,other,"DIA_pir_1398_Mention_01_03");	//Většinou celý den vystupujeme. A po těžkém dni si snad zasloužíme trochu klidu a oddechu.
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_INEXTREMO_ANNOUNCER_TELLABOUTKILLERS(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_tellaboutkillers_condition;
	information = dia_addon_inextremo_announcer_tellaboutkillers_info;
	permanent = FALSE;
	description = "Víš něco o cechu vrahů?";
};


func int dia_addon_inextremo_announcer_tellaboutkillers_condition()
{
	if(Npc_KnowsInfo(hero,dia_addon_inextremo_announcer_hallo) && (CANCOMPLETEGUILDKILL == FALSE) && Npc_KnowsInfo(hero,dia_ramirez_guildkill) && (KILLCANJOIN == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_tellaboutkillers_info()
{
	AI_Output(other,self,"DIA_pir_1398_TellAboutKillers_01_00");	//Víš něco o cechu vrahů?
	AI_Output(self,other,"DIA_pir_1398_TellAboutKillers_01_01");	//COŽE?!
	AI_Output(self,other,"DIA_pir_1398_TellAboutKillers_01_04");	//Kdo ti řekl, že o nich něco vím?
	Info_ClearChoices(dia_addon_inextremo_announcer_tellaboutkillers);
	Info_AddChoice(dia_addon_inextremo_announcer_tellaboutkillers,"Řekl mi to Ramirez.",dia_addon_inextremo_announcer_tellaboutkillers_ramirez);
	Info_AddChoice(dia_addon_inextremo_announcer_tellaboutkillers,"Na tom nezáleží.",dia_addon_inextremo_announcer_tellaboutkillers_nomatter);
};

func void dia_addon_inextremo_announcer_tellaboutkillers_ramirez()
{
	AI_Output(other,self,"DIA_pir_1398_TellAboutKillers_Ramirez_01_00");	//Řekl mi to Ramirez.
	AI_Output(self,other,"DIA_pir_1398_TellAboutKillers_Ramirez_01_01");	//Tak Ramirez, říkáš... (zamyšleně)
	AI_Output(self,other,"DIA_pir_1398_TellAboutKillers_Ramirez_01_02");	//Hmm... Mám dojem, že někdo má příliš dlouhý jazyk.
	AI_Output(self,other,"DIA_pir_1398_TellAboutKillers_Ramirez_01_05");	//Takže chceš vědět něco o cechu vrahů. Proč se o ně zajímáš?
	AI_Output(other,self,"DIA_pir_1398_TellAboutKillers_Ramirez_01_06");	//Chtěl bych s nimi vyřídit jeden menší obchod.
	AI_Output(other,self,"DIA_pir_1398_TellAboutKillers_Ramirez_01_10");	//Lepší bude, když mi řekneš, co o nich víš a kde je můžu najít.
	AI_Output(self,other,"DIA_pir_1398_TellAboutKillers_Ramirez_01_13");	//Hmm... (dívá se upřeně)
	AI_Output(self,other,"DIA_pir_1398_TellAboutKillers_Ramirez_01_14");	//No dobře! Máš-li chuť hrát si se smrtí, zařídím ti schůzku.
	AI_Output(self,other,"DIA_pir_1398_TellAboutKillers_Ramirez_01_15");	//Zítra kolem půlnoci přijď do opuštěného domu na molu. Tam najdeš toho, koho hledáš.
	AI_Output(self,other,"DIA_pir_1398_TellAboutKillers_Ramirez_01_16");	//Hlavně nepřijď pozdě, další šanci mít nebudeš.
	B_LogEntry(TOPIC_GUILDKILL,"Gillian mi zařídí schůzku s cechem vrahů. Mám přijít kolem půlnoci do opuštěného domu na molu.");
	KILLSMEET = TRUE;
	THIEFKILLS = TRUE;
	MIS_KILLSMEET_DAY = Wld_GetDay();
	AI_StopProcessInfos(self);
};

func void dia_addon_inextremo_announcer_tellaboutkillers_nomatter()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_pir_1398_TellAboutKillers_NoMatter_01_00");	//Na tom nezáleží. Říká se, že...
	AI_Output(self,other,"DIA_pir_1398_TellAboutKillers_NoMatter_01_01");	//Hmm... (dívá se pozorně) To, co se říká, je pravda.
	AI_Output(self,other,"DIA_pir_1398_TellAboutKillers_NoMatter_01_03");	//Takže ty chceš vědět něco o cechu vrahů. Proč se o ně zajímáš?
	AI_Output(other,self,"DIA_pir_1398_TellAboutKillers_NoMatter_01_04");	//Chtěl bych s nimi vyřídit jeden menší obchod.
	AI_Output(other,self,"DIA_pir_1398_TellAboutKillers_NoMatter_01_08");	//Lepší bude, když mi řekneš, co o nich víš a kde je můžu najít.
	AI_Output(self,other,"DIA_pir_1398_TellAboutKillers_NoMatter_01_11");	//Hmm... (dívá se upřeně)
	AI_Output(self,other,"DIA_pir_1398_TellAboutKillers_NoMatter_01_12");	//No dobře! Máš-li chuť hrát si se smrtí, zařídím ti schůzku.
	AI_Output(self,other,"DIA_pir_1398_TellAboutKillers_NoMatter_01_13");	//Zítra kolem půlnoci přijď do opuštěného domu na molu. Tam najdeš toho, koho hledáš.
	AI_Output(self,other,"DIA_pir_1398_TellAboutKillers_NoMatter_01_14");	//Hlavně nepřijď pozdě, další šanci mít nebudeš.
	B_LogEntry(TOPIC_GUILDKILL,"Gillian mi zařídí schůzku s cechem vrahů. Mám přijít kolem půlnoci do opuštěného domu na molu.");
	KILLSMEET = TRUE;
	MIS_KILLSMEET_DAY = Wld_GetDay();
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_INEXTREMO_ANNOUNCER_MEETINHOUSE(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_meetinhouse_condition;
	information = dia_addon_inextremo_announcer_meetinhouse_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_inextremo_announcer_meetinhouse_condition()
{
	if((KILLSMEET == TRUE) && (CHECKFLAGKILLSMEET == TRUE) && (JOINKILLERS == FALSE) && Npc_IsInState(self,ZS_Talk) && (MIS_GUILDKILL == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_meetinhouse_info()
{
	B_GivePlayerXP(250);
	self.guild = GIL_VLK;
	Npc_SetTrueGuild(self,GIL_VLK);
	AI_Output(self,other,"DIA_pir_1398_MeetInHouse_01_00");	//Takže jsi přišel. (smích) To jsem tedy nečekal.
	AI_Output(other,self,"DIA_pir_1398_MeetInHouse_01_01");	//Gillian?!
	AI_Output(self,other,"DIA_pir_1398_MeetInHouse_01_02");	//Překvapen? Nebuď tak udivený, stejně ses chtěl sejít.
	AI_Output(other,self,"DIA_pir_1398_MeetInHouse_01_03");	//Takže ty jsi jedním z cechu vrahů.
	AI_Output(self,other,"DIA_pir_1398_MeetInHouse_01_04");	//Stejně jako všichni kolem, které tady vidíš.
	AI_Output(other,self,"DIA_pir_1398_MeetInHouse_01_05");	//Hmm... Takže tomuhle se kočovní hudebníci věnují ve volném čase.
	AI_Output(self,other,"DIA_pir_1398_MeetInHouse_01_06");	//Každý vydělává tak, jak nejlépe umí. (smích)
	AI_Output(self,other,"DIA_pir_1398_MeetInHouse_01_07");	//Ale dost klábosení, nemáme moc času.
	AI_Output(self,other,"DIA_pir_1398_MeetInHouse_01_08");	//Teď mi řekni, co od nás chceš?
	AI_Output(self,other,"DIA_pir_1398_MeetInHouse_01_09");	//Doufám, že tvůj důvod stojí za to, abychom tě poslouchali.
	AI_Output(self,other,"DIA_pir_1398_MeetInHouse_01_10");	//V opačném případě tento rozhovor skončí stejně rychle, jako tvůj život! (smích)
	GUILDKILLKNOWNLOC = TRUE;
	B_LogEntry(TOPIC_GUILDKILL,"Přišel jsem na setkání. Čekal tam na mne Gillian se skupinou kočovných hudebníků, kteří přišli před pár měsíci do města. Většina lidí z cechu děsí obyvatele Khorinisu. Musím se odtud dostat. A pokud možno živý!");
	Info_ClearChoices(dia_addon_inextremo_announcer_meetinhouse);
	Info_AddChoice(dia_addon_inextremo_announcer_meetinhouse,"Přišel jsem tě zabít.",dia_addon_inextremo_announcer_meetinhouse_kill);
	Info_AddChoice(dia_addon_inextremo_announcer_meetinhouse,"Chci se k vám přidat.",dia_addon_inextremo_announcer_meetinhouse_join);
	Info_AddChoice(dia_addon_inextremo_announcer_meetinhouse,"Hledám muže jménem Asmal.",dia_addon_inextremo_announcer_meetinhouse_asmal);
};

func void dia_addon_inextremo_announcer_meetinhouse_asmal()
{
	AI_Output(other,self,"DIA_pir_1398_MeetInHouse_Asmal_01_00");	//Hledám muže jménem Asmal.
	AI_Output(self,other,"DIA_pir_1398_MeetInHouse_Asmal_01_01");	//Asmal? Hledáš Asmala? (směje se)
	AI_Output(self,other,"DIA_pir_1398_MeetInHouse_Asmal_01_02");	//Pak jsi ho už našel. Já jsem Asmal.
	AI_Output(self,other,"DIA_pir_1398_MeetInHouse_Asmal_01_03");	//Co dál?
	B_LogEntry(TOPIC_GUILDKILL,"Gillian, jak se ukázalo, je vlastně Asmal! Tohle přiznání od něj nebylo příliš prozíravé, ale kdo ví. Možná je to poslední věc, co o tom všem zjistím.");
	self.name[0] = "Asmal";
	KNOWSASMAL = TRUE;
};

func void dia_addon_inextremo_announcer_meetinhouse_kill()
{
	AI_Output(other,self,"DIA_pir_1398_MeetInHouse_Kill_01_00");	//Přišel jsem tě zabít.
	AI_Output(self,other,"DIA_pir_1398_MeetInHouse_Kill_01_01");	//COŽE? (směje se) Opravdu si myslíš, že jsi takový drsňák a zvládneš to?
	AI_Output(self,other,"DIA_pir_1398_MeetInHouse_Kill_01_02");	//No, ty jsi ale hlupák! (směje se)
	B_LogEntry(TOPIC_GUILDKILL,"Otočil jsem svou kartu. Řekl jsem Asmalovi, že jsem ho přišel zabít. Byl trochu překvapený z mého odvážného prohlášení. Jsem ale opravdu dostatečně silný, abych si poradil s celou jeho bandou?");
	if((THIEFKILLS == TRUE) && !(Npc_IsDead(Cassia) || !Npc_IsDead(Jesper) || !Npc_IsDead(Ramirez)))
	{
		AI_Output(self,other,"DIA_pir_1398_MeetInHouse_Kill_01_05");	//Skončíme to! Stejně jako s tvými kamarády ze zlodějského cechu, oni také měli dlouhý jazyk.
		AI_Output(other,self,"DIA_pir_1398_MeetInHouse_Kill_01_06");	//COŽE?!
		AI_Output(self,other,"DIA_pir_1398_MeetInHouse_Kill_01_07");	//Slyšel jsi dobře! Nebo sis myslel, že nechám takové, jako je Ramirez, vykecávat všechno všude kolem?
		B_LogEntry(TOPIC_GUILDKILL,"Asmal mi řekl, že se sešel s cechem zlodějů. Nelíbilo se mu, že někteří z nich mluví, místo toho, aby drželi jazyk za zuby. Zdá se, že můžu za jejich smrt, když jsem mluvil s Asmalem a práskl Ramireze. Jak bezohledně jsem se zachoval...");
		B_KillNpc(VLK_447_Cassia);
		B_KillNpc(VLK_446_Jesper);
		B_KillNpc(VLK_445_Ramirez);
		B_KillNpc(VLK_494_Attila);
	};
	AI_Output(self,other,"DIA_pir_1398_MeetInHouse_Kill_01_08");	//Své nadšení jsi měl využít na něco jiného, nyní je pozdě - připrav se na smrt.
	AI_Output(other,self,"DIA_pir_1398_MeetInHouse_Kill_01_10");	//Pak bychom neměli ztrácet čas.
	AI_Output(self,other,"DIA_pir_1398_MeetInHouse_Kill_01_11");	//Tak pojď, ty hrdino!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,0);
};

func void dia_addon_inextremo_announcer_meetinhouse_join()
{
	AI_Output(other,self,"DIA_pir_1398_MeetInHouse_Join_01_00");	//Chci se k vám přidat.
	AI_Output(self,other,"DIA_pir_1398_MeetInHouse_Join_01_01");	//(zmateně) Cože? Hmm... Ten kluk má ale drzost!
	AI_Output(self,other,"DIA_pir_1398_MeetInHouse_Join_01_02");	//Přijít sem, kvůli takové nabídce! Hahaha! Chlapi, slyšeli jste to?
	AI_Output(self,other,"DIA_pir_1398_MeetInHouse_Join_01_04");	//No, řekni mi, proč si myslíš, že by ses nám hodil?
	AI_Output(other,self,"DIA_pir_1398_MeetInHouse_Join_01_05");	//Jsem ve službě u lorda Andreho jako městská stráž...
	AI_Output(other,self,"DIA_pir_1398_MeetInHouse_Join_01_08");	//Myslel jsem, že by se vám hodila osoba, která má v těchto místech kontakty.
	AI_Output(other,self,"DIA_pir_1398_MeetInHouse_Join_01_09");	//Vyřešilo by to spoustu vašich problémů s domobranou.
	AI_Output(self,other,"DIA_pir_1398_MeetInHouse_Join_01_10");	//Hmm... (přemýšlí) Pravda! Takový člověk se může hodit.
	AI_Output(self,other,"DIA_pir_1398_MeetInHouse_Join_01_11");	//A jak si můžeme být jistí, že po této schůzce nepoběžíš rovnou za lordem Andrem a nevyžvaníš mu vše, co jsi zde viděl?
	AI_Output(self,other,"DIA_pir_1398_MeetInHouse_Join_01_12");	//Kromě toho vůbec nechápu, co z toho získáš TY?!
	B_LogEntry(TOPIC_GUILDKILL,"Řekl jsem Asmalovi, že se k nim chci přidat. Byl velmi překvapen a chtěl znát důvody, které mě k tomu přiměly.");
	Info_ClearChoices(dia_addon_inextremo_announcer_meetinhouse);
	Info_AddChoice(dia_addon_inextremo_announcer_meetinhouse,"Slyšel jsem, že vrahové dobře vydělávají.",dia_addon_inextremo_announcer_meetinhouse_money);
	Info_AddChoice(dia_addon_inextremo_announcer_meetinhouse,"To se tě netýká!",dia_addon_inextremo_announcer_meetinhouse_notyours);
	Info_AddChoice(dia_addon_inextremo_announcer_meetinhouse,"Je to tak důležité?",dia_addon_inextremo_announcer_meetinhouse_donttell);
};

func void dia_addon_inextremo_announcer_meetinhouse_money()
{
	AI_Output(other,self,"DIA_pir_1398_MeetInHouse_Money_01_00");	//Slyšel jsem, že vrahové dobře vydělávají.
	AI_Output(self,other,"DIA_pir_1398_MeetInHouse_Money_01_01");	//Máš rád zlato, co?
	AI_Output(other,self,"DIA_pir_1398_MeetInHouse_Money_01_02");	//Jistě, kdo ne?
	AI_Output(self,other,"DIA_pir_1398_MeetInHouse_Money_01_04");	//Pokud vím, lord Andre o své lidi pečuje docela dobře.
	AI_Output(self,other,"DIA_pir_1398_MeetInHouse_Money_01_06");	//A to mi naznačuje, že nejsi příliš spolehlivý člověk!
	AI_Output(self,other,"DIA_pir_1398_MeetInHouse_Money_01_07");	//Mám z tebe dojem, že za pěknou kupu zlaťáků bys nás klidně zaprodal.
	AI_Output(self,other,"DIA_pir_1398_MeetInHouse_Money_01_08");	//Je mi líto, ale takové lidi mezi sebou nechceme.
	AI_Output(other,self,"DIA_pir_1398_MeetInHouse_Money_01_10");	//Počkej chvíli...
	AI_Output(self,other,"DIA_pir_1398_MeetInHouse_Money_01_11");	//Hej, chlapi! Pojďme dát tomuhle bastardovi příučku!
	B_LogEntry(TOPIC_GUILDKILL,"Nebyl jsem schopen udělat dojem na Asmala a jeho společníky. Teď mám dvě možnosti: buď je všechny zabiju, nebo se pokusím odtud dostat živý a vše říct lordu Andremu.");
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,0);
};

func void dia_addon_inextremo_announcer_meetinhouse_notyours()
{
	AI_Output(other,self,"DIA_pir_1398_MeetInHouse_NotYours_01_00");	//To se tě netýká!
	AI_Output(self,other,"DIA_pir_1398_MeetInHouse_NotYours_01_01");	//Ó, to se hluboce mýlíš!
	AI_Output(self,other,"DIA_pir_1398_MeetInHouse_NotYours_01_02");	//Myslím, že ani sám nevíš, co vlastně chceš.
	AI_Output(self,other,"DIA_pir_1398_MeetInHouse_NotYours_01_03");	//A to vždy vede k velmi podezřelým myšlenkám.
	AI_Output(self,other,"DIA_pir_1398_MeetInHouse_NotYours_01_04");	//S takovými, jako jsi ty, je lepší hned skoncovat.
	AI_Output(other,self,"DIA_pir_1398_MeetInHouse_NotYours_01_07");	//Počkej chvíli...
	AI_Output(self,other,"DIA_pir_1398_MeetInHouse_NotYours_01_08");	//Hej, chlapi! Pojďme dát tomuhle bastardovi příučku!
	B_LogEntry(TOPIC_GUILDKILL,"Nebyl jsem schopen udělat dojem na Asmala a jeho společníky. Teď mám dvě možnosti: buď je všechny zabiju, nebo se pokusím odtud dostat živý a vše říct lordu Andremu.");
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,0);
};

func void dia_addon_inextremo_announcer_meetinhouse_donttell()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_pir_1398_MeetInHouse_DontTell_01_00");	//Je to tak důležité?
	AI_Output(other,self,"DIA_pir_1398_MeetInHouse_DontTell_01_01");	//Už tak dost riskuju, když jsem sem přišel. Pokud se to někdo dozví, jsem mrtvý.
	AI_Output(other,self,"DIA_pir_1398_MeetInHouse_DontTell_01_02");	//Takže si rovnou můžeš být jistý, že mé důvody jsou vážné.
	AI_Output(self,other,"DIA_pir_1398_MeetInHouse_DontTell_01_04");	//To znamená, že se vážně chceš stát jedním z nás...
	AI_Output(self,other,"DIA_pir_1398_MeetInHouse_DontTell_01_05");	//No dobře! Zdá se, že jsi mě přesvědčil.
	AI_Output(other,self,"DIA_pir_1398_MeetInHouse_DontTell_01_06");	//Takže teď jsem členem cechu?
	AI_Output(self,other,"DIA_pir_1398_MeetInHouse_DontTell_01_07");	//Ano. Teď jsi jedním z nás.
	AI_Output(self,other,"DIA_pir_1398_MeetInHouse_DontTell_01_08");	//Ale zatím na moc nespoléhej.
	AI_Output(self,other,"DIA_pir_1398_MeetInHouse_DontTell_01_11");	//Pořád ještě musíš dokázat, že umíš i něco jiného, než jen mluvit.
	AI_Output(self,other,"DIA_pir_1398_MeetInHouse_DontTell_01_13");	//Doufám, že víš, co tím myslím.
	AI_Output(other,self,"DIA_pir_1398_MeetInHouse_DontTell_01_17");	//Jistě.
	if(KNOWSASMAL == FALSE)
	{
		AI_Output(self,other,"DIA_pir_1398_MeetInHouse_DontTell_01_19");	//A ještě jedna věc...
		AI_Output(self,other,"DIA_pir_1398_MeetInHouse_DontTell_01_20");	//Gillian - to není moje pravé jméno.
		AI_Output(self,other,"DIA_pir_1398_MeetInHouse_DontTell_01_22");	//Všichni ví, že ve skutečnosti se jmenuju Asmal. Můžeš mi teď říkat stejně.
		self.name[0] = "Asmal";
		KNOWSASMAL = TRUE;
	};
	Info_ClearChoices(dia_addon_inextremo_announcer_meetinhouse);
	B_LogEntry(TOPIC_GUILDKILL,"Povedlo se mi ohromit Asmala a jeho společníky. Souhlasil, že mě vezme do cechu. Sice za poměrně přísných podmínek, ale neměl jsem moc na vybranou.");
	if(JOINKILLERS == FALSE)
	{
		MIS_KILLWAY = LOG_Running;
		Log_CreateTopic(TOPIC_KILLWAY,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_KILLWAY,LOG_Running);
		B_LogEntry(TOPIC_KILLWAY,"Asmal mě přijal do cechu vrahů. Zatím ale jenom na zkoušku, dokud mu nedokážu, že jsem si místo v cechu zasloužil.");
		JOINKILLERS = TRUE;
	};
};


instance DIA_ADDON_INEXTREMO_ANNOUNCER_MEETKILLERS(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_meetkillers_condition;
	information = dia_addon_inextremo_announcer_meetkillers_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_inextremo_announcer_meetkillers_condition()
{
	if((MIS_GERBRANDTHELP == LOG_Running) && (MEETCHIEFKILLERSLAIT == FALSE) && Npc_IsInState(self,ZS_Talk) && (APEARKILLER == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_meetkillers_info()
{
	self.guild = GIL_VLK;
	Npc_SetTrueGuild(self,GIL_VLK);

	if(MEETSTID == TRUE)
	{
		AI_Output(self,other,"DIA_pir_1398_MeetKillers_01_00");	//Hej, ty! Co tu chceš?
		AI_Output(other,self,"DIA_pir_1398_MeetKillers_01_01");	//No... Mám se tu s někým sejít.
		AI_Output(self,other,"DIA_pir_1398_MeetKillers_01_02");	//Opravdu? Hmmm...
		AI_Output(self,other,"DIA_pir_1398_MeetKillers_01_03");	//Pak mám dojem, že tvé setkání již proběhlo... (pozorně tě sleduje)
		AI_Output(other,self,"DIA_pir_1398_MeetKillers_01_04");	//Proč si mě tak prohlížíš?
		AI_Output(self,other,"DIA_pir_1398_MeetKillers_01_05");	//Hmmm... Tvá tvář je mi nějak povědomá. Nesetkali jsme se už někdy?...
		AI_Output(self,other,"DIA_pir_1398_MeetKillers_01_08");	//Ale to teď není důležité!
		AI_Output(self,other,"DIA_pir_1398_MeetKillers_01_10");	//Takže to znamená, že jsi mě hledal?
		B_LogEntry(TOPIC_GERBRANDTHELP,"Setkal jsem se s osobou, o níž mluvil Gerbrandt, přesně jak bylo dohodnuto. Ukázalo se, že je jeden z kočovných hudebníků - Gillian. Pravda, nebyl tak laskavý, jako při našem prvním setkání.");
	}
	else
	{
		AI_Output(self,other,"DIA_pir_1398_MeetKillers_01_11");	//Hej ty, ty se chceš se mnou setkat?!
		B_LogEntry(TOPIC_GERBRANDTHELP,"Setkal jsem se s osobou, o níž mluvil Gerbrandt, přesně jak bylo dohodnuto.");
	};

	MEETCHIEFKILLERS = TRUE;
	Info_ClearChoices(dia_addon_inextremo_announcer_meetkillers);
	Info_AddChoice(dia_addon_inextremo_announcer_meetkillers,"Ano, to já.",dia_addon_inextremo_announcer_meetkillers_me);
	Info_AddChoice(dia_addon_inextremo_announcer_meetkillers,"No, ne zrovna já...",dia_addon_inextremo_announcer_meetkillers_notme);
};

func void dia_addon_inextremo_announcer_meetkillers_notme()
{
	STIDKILLME = TRUE;
	AI_Output(other,self,"DIA_pir_1398_MeetKillers_NotMe_01_00");	//No, ne zrovna já...
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_NotMe_01_01");	//Co tím chceš říct?!
	AI_Output(other,self,"DIA_pir_1398_MeetKillers_NotMe_01_02");	//Jeden člověk mě sem poslal, abych si s tebou promluvil.
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_NotMe_01_03");	//A kdo?!
	AI_Output(other,self,"DIA_pir_1398_MeetKillers_NotMe_01_04");	//To ti nepovím. Chtěl, abych jeho jméno neprozrazoval.
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_NotMe_01_05");	//Hmm... No dobře.
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_NotMe_01_06");	//A co ode mě chce?
	Info_ClearChoices(dia_addon_inextremo_announcer_meetkillers);
	if((Npc_HasItems(other,itse_gerbrandpocket) >= 1) && ((Npc_HasItems(other,itwr_gerbrandseclet) >= 1) || (Npc_HasItems(other,itwr_gerbrandseclet_open) >= 1)))
	{
		Info_AddChoice(dia_addon_inextremo_announcer_meetkillers,"Vem si tento měšec a dopis.",dia_addon_inextremo_announcer_meetkillers_giveger);
	};
	Info_AddChoice(dia_addon_inextremo_announcer_meetkillers,"Nemám tušení.",dia_addon_inextremo_announcer_meetkillers_dontknow);
};

func void dia_addon_inextremo_announcer_meetkillers_me()
{
	AI_Output(other,self,"DIA_pir_1398_MeetKillers_Me_01_00");	//Ano, to já.
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_Me_01_01");	//Dobře. A co tedy ode mě chceš?
	Info_ClearChoices(dia_addon_inextremo_announcer_meetkillers);
	if((Npc_HasItems(other,itse_gerbrandpocket) >= 1) && ((Npc_HasItems(other,itwr_gerbrandseclet) >= 1) || (Npc_HasItems(other,itwr_gerbrandseclet_open) >= 1)))
	{
		Info_AddChoice(dia_addon_inextremo_announcer_meetkillers,"Vem si tento měšec a dopis.",dia_addon_inextremo_announcer_meetkillers_giveger);
	};
	Info_AddChoice(dia_addon_inextremo_announcer_meetkillers,"Nemám tušení.",dia_addon_inextremo_announcer_meetkillers_dontknow);
};

func void dia_addon_inextremo_announcer_meetkillers_dontknow()
{
	AI_Output(other,self,"DIA_pir_1398_MeetKillers_DontKnow_01_00");	//Nemám tušení.
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_DontKnow_01_01");	//Ty jsi ale vtipálek... (smích)
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_DontKnow_01_03");	//Dovol, abych ti vysvětlil pár věcí.
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_DontKnow_01_04");	//Můj čas stojí peníze!
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_DontKnow_01_08");	//Takže ty jsi teď mým dlužníkem. (tichý smích)
	AI_Output(other,self,"DIA_pir_1398_MeetKillers_DontKnow_01_09");	//Já ti nic nedlužím!
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_DontKnow_01_11");	//Řeknu ti to upřímně. Nemám soucit s dlužníky, a co je důležitější - vždy dostanu to, co mi náleží.
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_DontKnow_01_12");	//Víš co...
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_DontKnow_01_14");	//... rozhodl jsem se, že tvůj dluh si vezmu právě teď! (hrozivě)
	Npc_SetTempAttitude(self,ATT_HOSTILE);
	B_LogEntry(TOPIC_GERBRANDTHELP,"Teď, když jsem to tak podělal, už doporučení od Gerbrandta určitě nedostanu. Během setkání nastaly jisté komplikace...");
	MEETCHIEFKILLERSMISSTIME = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,0);
};

func void dia_addon_inextremo_announcer_meetkillers_giveger()
{
	AI_Output(other,self,"DIA_pir_1398_MeetKillers_GiveGer_01_00");	//Vem si tento měšec...
	B_GiveInvItems(other,self,itse_gerbrandpocket,1);
	Npc_RemoveInvItems(self,itse_gerbrandpocket,1);
	AI_Output(other,self,"DIA_pir_1398_MeetKillers_GiveGer_01_01");	//... a ještě dopis. To je vše, co potřebuješ.
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_GiveGer_01_02");	//Hmm... tak se na to podívejme.
	if(Npc_HasItems(other,itwr_gerbrandseclet) >= 1)
	{
		B_GiveInvItems(other,self,itwr_gerbrandseclet,1);
		Npc_RemoveInvItems(self,itwr_gerbrandseclet,1);
		B_UseFakeScroll();

		if(STIDKILLME == TRUE)
		{
			AI_Output(self,other,"DIA_pir_1398_MeetKillers_GiveGer_01_03");	//Dobře, všemu rozumím. Myslím, že tato záležitost nezpůsobí velké problémy.
			AI_Output(other,self,"DIA_pir_1398_MeetKillers_GiveGer_01_04");	//Skvěle. Myslím, že náš rozhovor můžeme považovat za úplný...
			AI_Output(self,other,"DIA_pir_1398_MeetKillers_GiveGer_01_05");	//Ne tak rychle, příteli! (úsměv) Ne, tak rychle.
			AI_Output(self,other,"DIA_pir_1398_MeetKillers_GiveGer_01_09");	//Potřebuji znát jméno osoby, která tě ke mně poslala.
			AI_Output(other,self,"DIA_pir_1398_MeetKillers_GiveGer_01_10");	//Jak už jsem ti řekl, to se tě netýká!
			AI_Output(self,other,"DIA_pir_1398_MeetKillers_GiveGer_01_11");	//Nejsi ty nějaký drzý?! Asi tě budu muset naučit slušnému chování.
			AI_Output(self,other,"DIA_pir_1398_MeetKillers_GiveGer_01_12");	//Pokud mi neřekneš to jméno, nenechám tě odejít.
			AI_Output(self,other,"DIA_pir_1398_MeetKillers_GiveGer_01_13");	//Musím vědět, s kým obchoduju.
			AI_Output(self,other,"DIA_pir_1398_MeetKillers_GiveGer_01_14");	//V opačném případě je to pro mne moc velký risk.
			AI_Output(self,other,"DIA_pir_1398_MeetKillers_GiveGer_01_15");	//Takže mi musíš říct jeho jméno.
			AI_Output(self,other,"DIA_pir_1398_MeetKillers_GiveGer_01_16");	//Jinak...
			AI_Output(self,other,"DIA_pir_1398_MeetKillers_GiveGer_01_18");	//... tě zabiju.
			AI_Output(other,self,"DIA_pir_1398_MeetKillers_GiveGer_01_20");	//Hej, počkej chvíli...
			AI_Output(other,self,"DIA_pir_1398_MeetKillers_GiveGer_01_22");	//Když ti řeknu to jméno, co potom?!
			AI_Output(self,other,"DIA_pir_1398_MeetKillers_GiveGer_01_23");	//Hmmm... pak budeš moci bezpečně odejít.
			AI_Output(self,other,"DIA_pir_1398_MeetKillers_GiveGer_01_24");	//Tak jak ses rozhodl?
			Info_ClearChoices(dia_addon_inextremo_announcer_meetkillers);
			Info_AddChoice(dia_addon_inextremo_announcer_meetkillers,"Hrozbami ze mě nic nedostaneš.",dia_addon_inextremo_announcer_meetkillers_donttell);
			Info_AddChoice(dia_addon_inextremo_announcer_meetkillers,"Dobře, dobře. Tak já ti to jméno povím.",dia_addon_inextremo_announcer_meetkillers_tell);
		}
		else
		{
			AI_Output(self,other,"DIA_pir_1398_MeetKillers_GiveGer_01_25");	//Dobře, všemu rozumím. Myslím, že tato záležitost nezpůsobí velké problémy.
			AI_Output(self,other,"DIA_pir_1398_MeetKillers_GiveGer_01_26");	//Můžeš být v klidu, tvůj problém bude rychle vyřešen.
			AI_Output(other,self,"DIA_pir_1398_MeetKillers_GiveGer_01_27");	//Skvěle. Myslím, že náš rozhovor můžeme považovat za úplný.
			AI_Output(self,other,"DIA_pir_1398_MeetKillers_GiveGer_01_3A");	//Ještě se uvidíme.
			B_LogEntry(TOPIC_GERBRANDTHELP,"Udělal jsem vše, co mi Gerbrandt řekl. Teď stačí, abych se k němu vrátil a vyzvednul si odměnu.");
			MEETCHIEFKILLERSOK = TRUE;
			AI_StopProcessInfos(self);
			Npc_SetRefuseTalk(self,400);
			Wld_InsertNpc(Wolf,"FP_ROAM_CITY_TO_FOREST_21");
			Wld_InsertNpc(Wolf,"FP_ROAM_CITY_TO_FOREST_23");
		};
	}
	else
	{
		B_GiveInvItems(other,self,itwr_gerbrandseclet_open,1);
		Npc_RemoveInvItems(self,itwr_gerbrandseclet_open,1);
		B_UseFakeScroll();
		if(STIDKILLME == TRUE)
		{
			AI_Output(self,other,"DIA_pir_1398_MeetKillers_GiveGer_01_31");	//Dobře, všemu rozumím. Myslím, že tato záležitost nezpůsobí velké problémy.
			AI_Output(self,other,"DIA_pir_1398_MeetKillers_GiveGer_01_32");	//Nicméně, pečeť dopisu byla zlomena ještě předtím, než jsem si ho přečetl!
			AI_Output(other,self,"DIA_pir_1398_MeetKillers_GiveGer_01_33");	//Jen jsem chtěl...
			AI_Output(self,other,"DIA_pir_1398_MeetKillers_GiveGer_01_34");	//Vím, cos chtěl.
			AI_Output(self,other,"DIA_pir_1398_MeetKillers_GiveGer_01_35");	//Tohle vše mi naznačuje, že nejsi příliš spolehlivý člověk!
			AI_Output(self,other,"DIA_pir_1398_MeetKillers_GiveGer_01_39");	//Dovol mi, abych ti vysvětlil pár věcí.
			AI_Output(self,other,"DIA_pir_1398_MeetKillers_GiveGer_01_40");	//Jak vidíš, v naší branži není nic horšího než lidi, na které se nelze spolehnout.
			AI_Output(self,other,"DIA_pir_1398_MeetKillers_GiveGer_01_43");	//Asi jsi už pochopil, že tě jen tak nenechám odejít.
			AI_Output(other,self,"DIA_pir_1398_MeetKillers_GiveGer_01_44");	//Co tím myslíš?
			AI_Output(self,other,"DIA_pir_1398_MeetKillers_GiveGer_01_45");	//Tím myslím, že takového blbce, jako jsi ty, je třeba se co nejrychleji zbavit!
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other,"DIA_pir_1398_MeetKillers_GiveGer_01_47");	//Chápej, nic osobního, ale nemám na výběr...
			Npc_SetTempAttitude(self,ATT_HOSTILE);
			B_LogEntry(TOPIC_GERBRANDTHELP,"Udělal jsem všechno, co mi Gerbrandt řekl. Během setkání však nastaly jisté komplikace...");
			MEETCHIEFKILLERSNOTOK = TRUE;
			MEETCHIEFKILLERSOK = TRUE;
			AI_StopProcessInfos(self);
			B_Attack(self,other,AR_GuardStopsIntruder,0);
		}
		else
		{
			AI_Output(self,other,"DIA_pir_1398_MeetKillers_GiveGer_01_48");	//Dobře, všemu rozumím. Myslím, že tato záležitost nezpůsobí velké problémy.
			AI_Output(self,other,"DIA_pir_1398_MeetKillers_GiveGer_01_49");	//Nicméně, pečeť dopisu byla zlomena ještě předtím, než jsem si ho přečetl!
			AI_Output(self,other,"DIA_pir_1398_MeetKillers_GiveGer_01_50");	//Znamená to, žes ses rozhodl si znovu přečíst svůj vlastní dopis, což je dost divné...
			AI_Output(self,other,"DIA_pir_1398_MeetKillers_GiveGer_01_51");	//... nebo to psal někdo jiný.
			AI_Output(other,self,"DIA_pir_1398_MeetKillers_GiveGer_01_52");	//Já...
			AI_Output(self,other,"DIA_pir_1398_MeetKillers_GiveGer_01_53");	//Hmm... nemusíš mi nic vysvětlovat, všemu rozumím.
			AI_Output(self,other,"DIA_pir_1398_MeetKillers_GiveGer_01_54");	//Tohle vše mi naznačuje, že nejsi příliš spolehlivý člověk!
			AI_Output(self,other,"DIA_pir_1398_MeetKillers_GiveGer_01_55");	//A nejsmutnější na tom je, že jsi mi lhal.
			AI_Output(self,other,"DIA_pir_1398_MeetKillers_GiveGer_01_56");	//Myslím, že ten, co tě poslal chtěl, abys mi dal dopis a měšec.
			AI_Output(self,other,"DIA_pir_1398_MeetKillers_GiveGer_01_59");	//Dovol mi, abych ti vysvětlil pár věcí.
			AI_Output(self,other,"DIA_pir_1398_MeetKillers_GiveGer_01_60");	//Jak vidíš, v naší branži není nic horšího než lidi, na které se nelze spolehnout.
			AI_Output(self,other,"DIA_pir_1398_MeetKillers_GiveGer_01_63");	//Asi jsi už pochopil, že tě jen tak nenechám odejít.
			AI_Output(other,self,"DIA_pir_1398_MeetKillers_GiveGer_01_64");	//Co tím myslíš?
			AI_Output(self,other,"DIA_pir_1398_MeetKillers_GiveGer_01_65");	//Tím myslím, že takového blbce, jako jsi ty, je třeba se co nejrychleji zbavit!
			AI_Output(self,other,"DIA_pir_1398_MeetKillers_GiveGer_01_66");	//Čím dříve, tím lépe pro všechny.
			AI_ReadyMeleeWeapon(self);
			AI_Output(self,other,"DIA_pir_1398_MeetKillers_GiveGer_01_67");	//Chápej, nic osobního, ale nemám na výběr...
			Npc_SetTempAttitude(self,ATT_HOSTILE);
			B_LogEntry(TOPIC_GERBRANDTHELP,"Udělal jsem všechno, co mi Gerbrandt řekl. Během setkání však nastaly jisté komplikace...");
			MEETCHIEFKILLERSNOTOK = TRUE;
			MEETCHIEFKILLERSOK = TRUE;
			AI_StopProcessInfos(self);
			B_Attack(self,other,AR_GuardStopsIntruder,0);
		};
	};
};

func void dia_addon_inextremo_announcer_meetkillers_donttell()
{
	AI_Output(other,self,"DIA_pir_1398_MeetKillers_DontTell_01_00");	//Hrozbami ze mě nic nedostaneš.
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_DontTell_01_01");	//Hmmm... Takže raději zemřeš. To je z tvé strany docela pošetilé! (smích)
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_DontTell_01_02");	//Nebo ses rozhodl vyjednávat?!
	Info_ClearChoices(dia_addon_inextremo_announcer_meetkillers);
	Info_AddChoice(dia_addon_inextremo_announcer_meetkillers,"Pošetilé nebo ne, vyřeší to boj!",dia_addon_inextremo_announcer_meetkillers_fight);
	Info_AddChoice(dia_addon_inextremo_announcer_meetkillers,"Vyjednávat? Hmm, proč ne?",dia_addon_inextremo_announcer_meetkillers_torg);
};

func void dia_addon_inextremo_announcer_meetkillers_tell()
{
	AI_Output(other,self,"DIA_pir_1398_MeetKillers_Tell_01_00");	//Dobře, dobře. Tak já ti to jméno povím...
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_Tell_01_01");	//Poslouchám...
	AI_Output(other,self,"DIA_pir_1398_MeetKillers_Tell_01_02");	//Jeho jméno je Gerbrandt.
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_Tell_01_03");	//Kde bydlí?
	AI_Output(other,self,"DIA_pir_1398_MeetKillers_Tell_01_04");	//V horní čtvrti. To je vše, co vím.
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_Tell_01_05");	//Že to trvalo!
	AI_ReadyMeleeWeapon(self);
	AI_Output(other,self,"DIA_pir_1398_MeetKillers_Tell_01_06");	//Hej! Slíbil jsi to!
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_Tell_01_07");	//Neměl bys věřit všemu, co kdo říká.
	AI_Output(other,self,"DIA_pir_1398_MeetKillers_Tell_01_09");	//Ale dohodli jsme se!
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_Tell_01_10");	//Dovol mi, abych ti vysvětlil pár věcí.
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_Tell_01_11");	//Jak vidíš, v naší branži není nic horšího než lidi, na které se nelze spolehnout.
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_Tell_01_13");	//Řekl jsi mi jméno toho, kdo tě poslal. Co ti dál k tomu mám říct.
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_Tell_01_14");	//O naší schůzce se nesmí nikdo dozvědět - a to já nemohu riskovat!
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_Tell_01_15");	//Nedal jsi mi na výběr...
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_Tell_01_16");	//Dnes budeš muset zemřít!
	Npc_SetTempAttitude(self,ATT_HOSTILE);
	B_LogEntry(TOPIC_GERBRANDTHELP,"Udělal jsem všechno, co mi Gerbrandt řekl. Během setkání však nastaly jisté komplikace. Kromě toho jsem vyzradil Gerbrandta. Nemyslím si, že bude rád...");
	MEETCHIEFKILLERSNOTOK = TRUE;
	MEETCHIEFKILLERSOK = TRUE;
	MEETCHIEFKILLERSTELLSGER = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,0);
};

func void dia_addon_inextremo_announcer_meetkillers_fight()
{
	AI_Output(other,self,"DIA_pir_1398_MeetKillers_Fight_01_00");	//Pošetilé nebo ne, vyřeší to boj!
	AI_ReadyMeleeWeapon(self);
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_Fight_01_01");	//Ha! Silná slova, chlapče.
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_Fight_01_03");	//Mohl bych tě poslat na jiný svět, ale... (zamyšleně)
	AI_RemoveWeapon(self);
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_Fight_01_04");	//... ale neudělám to.
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_Fight_01_05");	//Respektuju lidi, jako jsi ty. A jak vidím, umíš držet jazyk za zuby.
	AI_Output(other,self,"DIA_pir_1398_MeetKillers_Fight_01_06");	//Co tím myslíš?
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_Fight_01_07");	//Tím myslím, že náš rozhovor je u konce. Tomu, kdo tě poslal, vyřiď, že se o ten problém postarám.

	if(RhetorikSkillValue[1] < 100)
	{
		RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
		AI_Print("Rétorika + 1");
	};

	B_LogEntry(TOPIC_GERBRANDTHELP,"Udělal jsem všechno, co mi Gerbrandt řekl. Během setkání nastaly jisté komplikace, ale Gerbrandta jsem nevyzradil. Teď se k němu vrátím a vyzvednu si odměnu.");
	MEETCHIEFKILLERSOK = TRUE;
	MEETCHIEFKILLERSDANGER = TRUE;
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,400);
	Wld_InsertNpc(Wolf,"FP_ROAM_CITY_TO_FOREST_21");
	Wld_InsertNpc(Wolf,"FP_ROAM_CITY_TO_FOREST_21");
	Wld_InsertNpc(Wolf,"FP_ROAM_CITY_TO_FOREST_23");
};

func void dia_addon_inextremo_announcer_meetkillers_torg()
{
	AI_Output(other,self,"DIA_pir_1398_MeetKillers_Torg_01_00");	//Vyjednávat? Hmm, proč ne?
	AI_Output(other,self,"DIA_pir_1398_MeetKillers_Torg_01_01");	//Každá informace něco stojí.
	AI_Output(other,self,"DIA_pir_1398_MeetKillers_Torg_01_06");	//Obzvlášť ty cenné!
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_Torg_01_07");	//Á, jak vidím, jsi obchodník! Dám ti tedy 300 zlatých. Teď mi vše řekni!
	AI_Output(other,self,"DIA_pir_1398_MeetKillers_Torg_01_08");	//Jmenuje se Gerbrandt.
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_Torg_01_09");	//Kde žije?
	AI_Output(other,self,"DIA_pir_1398_MeetKillers_Torg_01_10");	//V horní čtvrti, první dům napravo.
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_Torg_01_11");	//Hmmm... to mi stačí.
	AI_ReadyMeleeWeapon(self);
	AI_Output(other,self,"DIA_pir_1398_MeetKillers_Torg_01_12");	//HEJ! Slíbil jsi mi to! A co moje peníze?!
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_Torg_01_13");	//Neměl bys věřit všemu, co kdo říká.
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_Torg_01_14");	//Opravdu si myslíš, že jsem takový hlupák, abych ti platil?
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_Torg_01_16");	//Dovol mi, abych ti vysvětlil pár věcí.
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_Torg_01_17");	//Jak vidíš, v naší branži není nic horšího než lidi, na které se nelze spolehnout.
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_Torg_01_19");	//Zvláště pak ti, co prodají vše, aby měli nadité kapsy penězmi.
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_Torg_01_20");	//Ty taky zřejmě patříš do stejné kategorie lidí. Řekl jsi mi jméno toho, kdo tě poslal. Co na to říct?
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_Torg_01_21");	//O naší schůzce se nesmí nikdo dozvědět - a to já nemohu riskovat!
	AI_Output(self,other,"DIA_pir_1398_MeetKillers_Torg_01_22");	//Nedal jsi mi na výběr...
	Npc_SetTempAttitude(self,ATT_HOSTILE);
	B_LogEntry(TOPIC_GERBRANDTHELP,"Udělal jsem všechno, co mi Gerbrandt řekl. Během setkání však nastaly jisté komplikace. Kromě toho jsem vyzradil Gerbrandta. Nemyslím si, že bude rád...");
	MEETCHIEFKILLERSNOTOK = TRUE;
	MEETCHIEFKILLERSOK = TRUE;
	MEETCHIEFKILLERSTELLSGER = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,0);
};

instance DIA_ADDON_INEXTREMO_ANNOUNCER_TELLABOUTWAMBO(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_tellaboutwambo_condition;
	information = dia_addon_inextremo_announcer_tellaboutwambo_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_addon_inextremo_announcer_tellaboutwambo_condition()
{
	if((KILLCANJOIN == TRUE) && (Npc_GetDistToWP(self,"NW_CITY_KILLWAMBO_01") <= 1500))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_tellaboutwambo_info()
{
	B_GivePlayerXP(100);
	MEETSTIDGERBRANT = TRUE;
	self.guild = GIL_VLK;
	Npc_SetTrueGuild(self,GIL_VLK);
	Npc_ExchangeRoutine(self,"Start");
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_01_0A");	//Zase ty! Hmm... Tak jsme se znovu setkali.
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_01_0B");	//Nevybral sis zrovna vhodné místo ani dobu.
	if(MEETSTID == TRUE)
	{
		AI_Output(other,self,"DIA_pir_1398_TellAboutWambo_01_0C");	//No, abych byl upřímný, já sám jsem nečekal, že tě uvidím.
		AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_01_0D");	//Nicméně se tak stalo.
	}
	else
	{
		AI_Output(other,self,"DIA_pir_1398_TellAboutWambo_01_0E");	//My se známe? Počkej, nejsi ty ten muž z hostince?
		AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_01_0F");	//Vidím, že si mě pamatuješ dobře. Stejně jako já tebe.
	};
	AI_Output(other,self,"DIA_pir_1398_TellAboutWambo_01_00");	//Zdá se, že máš problém s domobranou.
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_01_01");	//Já? (smích) Co tím myslíš?
	AI_Output(other,self,"DIA_pir_1398_TellAboutWambo_01_02");	//Vypadá to, že jsi právě zabil člověka.
	AI_Output(other,self,"DIA_pir_1398_TellAboutWambo_01_03");	//Mám dojem, že kvůli tomu budeš mít velké problémy.
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_01_0H");	//Mýlíš se, příteli, velmi se mýlíš.
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_01_05");	//Koneckonců nejsou žádní svědci... (smích)
	AI_Output(other,self,"DIA_pir_1398_TellAboutWambo_01_06");	//A co já? Já tě viděl, jak...
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_01_07");	//... tím hůř pro tebe!
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_01_09");	//Nevybral sis zrovna nejvhodnější okamžik, abys mi zkřížil cestu.
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_01_10");	//Nemám ti to za zlé - možná ses sem dostal absolutní náhodou.
	AI_Output(other,self,"DIA_pir_1398_TellAboutWambo_01_12");	//Ty mi vyhrožuješ?
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_01_13");	//Jistěže ne. Hrozby jsou ztrátou času.
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_01_14");	//Akce přináší mnohem větší užitek.
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_01_15");	//Rozumíš mi, nic proti tobě nemám, ale...
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_01_18");	//Nedáváš mi jinou možnost.
	if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_01_35");	//O to víc, když i ty sám patříš k domobraně.
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_GuardStopsIntruder,0);
	}
	else if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_01_36");	//O to víc, když jsi paladin.
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_GuardStopsIntruder,0);
	}
	else if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_01_37");	//O to víc, když jsi mág Ohně, podlejzač paladinů.
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_GuardStopsIntruder,0);
	}
	else if(other.guild == GIL_NOV)
	{
		AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_01_38");	//O to víc, když jsi novic mágů Ohně.
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_GuardStopsIntruder,0);
	};
	AI_Output(other,self,"DIA_pir_1398_TellAboutWambo_01_19");	//Počkej, pojď si raději promluvit.
	AI_Output(other,self,"DIA_pir_1398_TellAboutWambo_01_20");	//Můžeme to přeci nějak vyřešit.
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_01_25");	//Hmm... Možná... (zamyšleně)
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_01_30");	//Možná mi budeš užitečný, samozřejmě pokud... (pečlivě zvažuje)
	AI_Output(other,self,"DIA_pir_1398_TellAboutWambo_01_31");	//Co tím chceš říct?
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_01_32");	//Myslím si, že mi přijde vhod člověk, jako jsi ty.
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_01_33");	//Všiml jsem si, že jsi trochu jiný - nepříliš hovorný a vůbec ne arogantní.
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_01_34");	//Mám tedy pro tebe návrh.
	Info_ClearChoices(dia_addon_inextremo_announcer_tellaboutwambo);
	Info_AddChoice(dia_addon_inextremo_announcer_tellaboutwambo,"Jaký?",dia_addon_inextremo_announcer_tellaboutwambo_tellme);
	Info_AddChoice(dia_addon_inextremo_announcer_tellaboutwambo,"Tvůj návrh mě nezajímá.",dia_addon_inextremo_announcer_tellaboutwambo_refuse);
};

func void dia_addon_inextremo_announcer_tellaboutwambo_refuse()
{
	AI_Output(other,self,"DIA_pir_1398_TellAboutWambo_Refuse_01_00");	//Tvůj návrh mě nezajímá.
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_Refuse_01_01");	//Odmítl jsi mě, aniž bys mě vyslechl.
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_Refuse_01_04");	//V takovém případě je čas zemřít, příteli.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,0);
};

func void dia_addon_inextremo_announcer_tellaboutwambo_tellme()
{
	CANCOMPLETEGUILDKILL = TRUE;
	AI_Output(other,self,"DIA_pir_1398_TellAboutWambo_TellMe_01_00");	//Jaký?
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_TellMe_01_01");	//Nejprve ti něco vysvětlím...
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_TellMe_01_02");	//Pravděpodobně už asi víš, že nejsem tak obyčejný člověk, jak se na první pohled zdá.
	AI_Output(other,self,"DIA_pir_1398_TellAboutWambo_TellMe_01_03");	//Správně. Nevypadáš jako obyčejný člověk.
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_TellMe_01_05");	//Kromě toho moje povolání není obyčejné.
	AI_Output(other,self,"DIA_pir_1398_TellAboutWambo_TellMe_01_06");	//Čím se zabýváš?
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_TellMe_01_08");	//Mé povolání je pomáhat lidem ne zcela legálními prostředky.
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_TellMe_01_11");	//Mé skutečné jméno je Asmal. Říká ti to něco?
	AI_Output(other,self,"DIA_pir_1398_TellAboutWambo_TellMe_01_13");	//Nikdy jsem o tobě neslyšel.
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_TellMe_01_14");	//Hmm... (usmívá se) Možná je to tak lepší.
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_TellMe_01_16");	//Pochop to takhle - nijak mě netěší zabíjet lidi, ale každý si vydělává na chleba tak, jak umí.
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_TellMe_01_17");	//Ten, kterého jsem zabil před chvílí, byl jen zkorumpovaným domobráncem, který způsoboval místním obchodníkům spoustu problémů.
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_TellMe_01_18");	//Mám dojem, že svět jeho smrtí více získá, než ztratí.
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_TellMe_01_19");	//Mimochodem - to ty jsi podepsal rozsudek jeho smrti, když jsi mi předal ten vzkaz s penězi v hospodě. (směje se)
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_TellMe_01_20");	//Ale teď už na tom nezáleží. Vrátíme se nyní opět k tobě.
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_TellMe_01_21");	//Určitě by bylo jednodušší na místě tě zabít...
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_TellMe_01_22");	//Tím by byl problém vyřešen. Ale - chci ti dát šanci.
	AI_Output(other,self,"DIA_pir_1398_TellAboutWambo_TellMe_01_23");	//Co tím myslíš?
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_TellMe_01_24");	//Nabízím ti šanci stát se jedním z nás.
	AI_Output(other,self,"DIA_pir_1398_TellAboutWambo_TellMe_01_25");	//Jedním z vás? Chceš abych se stal vrahem?
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_TellMe_01_26");	//Jistě. Nabízím ti možnost připojit se k naší společnosti - přesněji cechu vrahů.
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_TellMe_01_27");	//Buď mou nabídku přijmeš nebo ne.
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_TellMe_01_29");	//Takže, co říkáš?
	Info_ClearChoices(dia_addon_inextremo_announcer_tellaboutwambo);
	Info_AddChoice(dia_addon_inextremo_announcer_tellaboutwambo,"Nebudu pracovat s vrahy!",dia_addon_inextremo_announcer_tellaboutwambo_becomeno);
	Info_AddChoice(dia_addon_inextremo_announcer_tellaboutwambo,"Přidám se k vám!",dia_addon_inextremo_announcer_tellaboutwambo_becomeyes);
};

func void dia_addon_inextremo_announcer_tellaboutwambo_becomeno()
{
	self.name[0] = "Asmal";
	AI_Output(other,self,"DIA_pir_1398_TellAboutWambo_BecomeNo_01_00");	//Nebudu pracovat s vrahy!
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_BecomeNo_01_03");	//V tom případě je náš rozhovor u konce.
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_BecomeNo_01_04");	//Nyní je čas zemřít!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,0);
};

func void dia_addon_inextremo_announcer_tellaboutwambo_becomeyes()
{
	self.name[0] = "Asmal";
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_pir_1398_TellAboutWambo_BecomeYes_01_00");	//Přidám se k vám!
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_BecomeYes_01_01");	//Věděl jsem, že budeš souhlasit.
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_BecomeYes_01_02");	//Rozhodl ses dobře, jinak bys byl mrtvý.
	AI_Output(other,self,"DIA_pir_1398_TellAboutWambo_BecomeYes_01_03");	//A co teď?
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_BecomeYes_01_04");	//Teď jsi jedním z nás.
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_BecomeYes_01_07");	//Řeknu ti, nejdřív se musíš trochu ukázat.
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_BecomeYes_01_08");	//Musíš prokázat, že umíš nejen mluvit, ale také dělat něco... vážnějšího.
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_BecomeYes_01_10");	//Doufám, že víš, co tím myslím.
	AI_Output(other,self,"DIA_pir_1398_TellAboutWambo_BecomeYes_01_15");	//Jistě.
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_BecomeYes_01_16");	//A ještě jedna věc. Město Khorinis začíná být trochu neklidné.
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_BecomeYes_01_18");	//Proto je lepší být na nějakém klidnějším místě.
	AI_Output(self,other,"DIA_pir_1398_TellAboutWambo_BecomeYes_01_20");	//Pokud mě budeš hledat, přijď do opuštěného domu na molu.

	if(JOINKILLERS == FALSE)
	{
		MIS_KILLWAY = LOG_Running;
		Log_CreateTopic(TOPIC_KILLWAY,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_KILLWAY,LOG_Running);
		B_LogEntry(TOPIC_KILLWAY,"Asmal mě vzal do cechu vrahů. Musím dokázat svými činy, že jsem toho hoden.");
		JOINKILLERS = TRUE;
	};

	CHANGELOCATIONASMAL = TRUE;
	CHECKFLAGKILLSJOIN = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Logovo");
	B_StartOtherRoutine(vlk_6028_buerger,"TOT");
	//B_StartOtherRoutine(vlk_6029_buergerin,"TOT");
	B_StartOtherRoutine(vlk_6030_buerger,"TOT");
	//B_StartOtherRoutine(vlk_6031_buergerin,"TOT");
	//B_StartOtherRoutine(vlk_6032_buergerin,"TOT");
	B_StartOtherRoutine(vlk_6033_buerger,"TOT");
	//B_StartOtherRoutine(vlk_6034_buergerin,"TOT");
	B_StartOtherRoutine(PIR_1390_Addon_InExtremo_DrPymonte,"Logovo");
	B_StartOtherRoutine(PIR_1395_Addon_InExtremo_Lutter,"Logovo");
	B_StartOtherRoutine(PIR_1396_Addon_InExtremo_Flex,"Logovo");
	B_StartOtherRoutine(PIR_1391_Addon_InExtremo_TheFlail,"Logovo");
	B_StartOtherRoutine(pir_1397_addon_inextremo_charlotte,"Logovo");
	B_StartOtherRoutine(pir_1398_addon_inextremo_announcer,"Logovo");
};

instance DIA_ADDON_INEXTREMO_ANNOUNCER_KILLARMOR(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_killarmor_condition;
	information = dia_addon_inextremo_announcer_killarmor_info;
	permanent = FALSE;
	description = "Co to máš za zbroj?";
};

func int dia_addon_inextremo_announcer_killarmor_condition()
{
	if(JOINKILLERS == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_killarmor_info()
{
	AI_Output(other,self,"DIA_pir_1398_KillArmor_01_00");	//Co to máš za zbroj?
	AI_Output(self,other,"DIA_pir_1398_KillArmor_01_01");	//Co myslíš? Vsadím svou levou ruku, žes tuhle zbroj nikdy neviděl... (smích)
	AI_Output(self,other,"DIA_pir_1398_KillArmor_01_03");	//Tuhle zbroj nosí jen ti, co mají čestná místa v našem cechu.
	AI_Output(other,self,"DIA_pir_1398_KillArmor_01_04");	//Aha! A jak ji mohu získat?
	AI_Output(other,self,"DIA_pir_1398_KillArmor_01_05");	//Nyní už jsem taky jedním z vás, tak bych ji...
	AI_Output(self,other,"DIA_pir_1398_KillArmor_01_06");	//... hej! Kam se ženeš! To už si myslíš, že jsi toho udělal pro cech hodně?
	AI_Output(self,other,"DIA_pir_1398_KillArmor_01_07");	//Chceš-li se ukázat, budeš muset splnit pár úkolů. A pak možná...
	B_LogEntry(TOPIC_KILLWAY,"Asmal mi řekl, že nejsem zatím hoden nosit zbroj vrahů. Prý si tu čest mám nejdříve zasloužit svými skutky.");
};

instance DIA_ADDON_INEXTREMO_ANNOUNCER_CANTEACH(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_canteach_condition;
	information = dia_addon_inextremo_announcer_canteach_info;
	permanent = FALSE;
	description = "Můžeš mě něco naučit?";
};

func int dia_addon_inextremo_announcer_canteach_condition()
{
	if((JOINKILLERS == TRUE) && (ANNOUNCERCANTEACH == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_canteach_info()
{
	self.name[0] = "Asmal";
	AI_Output(other,self,"DIA_Addon_InExtremo_Announcer_CanTeach_01_00");	//Můžeš mě něco naučit?
	AI_Output(self,other,"DIA_Addon_InExtremo_Announcer_CanTeach_01_01");	//Obávám se, že se toho moc naučit nemůžeš. Normálně nikoho neučím.
	AI_Output(self,other,"DIA_Addon_InExtremo_Announcer_CanTeach_01_02");	//Ale možná bych tě mohl naučit pár technik šermu.
	AI_Output(self,other,"DIA_Addon_InExtremo_Announcer_CanTeach_01_03");	//Přeci jen, úspěch naší práce je v naší branži velmi důležitý.
	AI_Output(self,other,"DIA_Addon_InExtremo_Announcer_CanTeach_01_04");	//Pokud chceš vědět, jak lépe držet meč, stačí říct.
	ANNOUNCERCANTEACH = TRUE;
};

instance DIA_ADDON_INEXTREMO_ANNOUNCER_TEACH(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_teach_condition;
	information = dia_addon_inextremo_announcer_teach_info;
	permanent = TRUE;
	description = "Začněme s tréninkem.";
};

func int dia_addon_inextremo_announcer_teach_condition()
{
	if((JOINKILLERS == TRUE) && (ANNOUNCERCANTEACH == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_teach_info()
{
	self.name[0] = "Asmal";
	Info_ClearChoices(dia_addon_inextremo_announcer_teach);
	Info_AddChoice(dia_addon_inextremo_announcer_teach,Dialog_Back,dia_addon_inextremo_announcer_teach_back);
	Info_AddChoice(dia_addon_inextremo_announcer_teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_addon_inextremo_announcer_teach_1h_1);
	Info_AddChoice(dia_addon_inextremo_announcer_teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_addon_inextremo_announcer_teach_1h_5);
};

func void dia_addon_inextremo_announcer_teach_back()
{
	Info_ClearChoices(dia_addon_inextremo_announcer_teach);
};

func void dia_addon_inextremo_announcer_teach_1h_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,100))
	{
		Info_ClearChoices(dia_addon_inextremo_announcer_teach);
		Info_AddChoice(dia_addon_inextremo_announcer_teach,Dialog_Back,dia_addon_inextremo_announcer_teach_back);
		Info_AddChoice(dia_addon_inextremo_announcer_teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_addon_inextremo_announcer_teach_1h_1);
		Info_AddChoice(dia_addon_inextremo_announcer_teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_addon_inextremo_announcer_teach_1h_5);
	};
};

func void dia_addon_inextremo_announcer_teach_1h_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,100))
	{
		Info_ClearChoices(dia_addon_inextremo_announcer_teach);
		Info_AddChoice(dia_addon_inextremo_announcer_teach,Dialog_Back,dia_addon_inextremo_announcer_teach_back);
		Info_AddChoice(dia_addon_inextremo_announcer_teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_addon_inextremo_announcer_teach_1h_1);
		Info_AddChoice(dia_addon_inextremo_announcer_teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_addon_inextremo_announcer_teach_1h_5);
	};
};


instance DIA_ADDON_INEXTREMO_ANNOUNCER_KILLWORK0(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_killwork0_condition;
	information = dia_addon_inextremo_announcer_killwork0_info;
	permanent = FALSE;
	description = "Máš pro mě nějakou práci?";
};


func int dia_addon_inextremo_announcer_killwork0_condition()
{
	if((JOINKILLERS == TRUE) && (WAMBOISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_killwork0_info()
{
	self.name[0] = "Asmal";
	self.guild = GIL_VLK;
	Npc_SetTrueGuild(self,GIL_VLK);
	AI_Output(other,self,"DIA_pir_1398_KillWork0_01_00");	//Máš pro mě nějakou práci?
	AI_Output(self,other,"DIA_pir_1398_KillWork0_01_01");	//Ha! Chceš se rychle ukázat v akci, jo? Hmm...
	AI_Output(self,other,"DIA_pir_1398_KillWork0_01_02");	//Možná bych tu něco měl.
	AI_Output(other,self,"DIA_pir_1398_KillWork0_01_03");	//Co mám udělat?
	AI_Output(self,other,"DIA_pir_1398_KillWork0_01_04");	//Jeden chlápek z domobrany trápí některé vlivné obchodníky v horní čtvrti.
	AI_Output(self,other,"DIA_pir_1398_KillWork0_01_05");	//Zdá se, že ten chlap dělá velké problémy, proto se nás rozhodli kontaktovat.
	AI_Output(self,other,"DIA_pir_1398_KillWork0_01_06");	//Podle jejich slov tohoto strážce trápí příliš dlouhé prsty a chuť po penězích.
	AI_Output(self,other,"DIA_pir_1398_KillWork0_01_08");	//Chci, aby ses na toho strážce podíval. Čím dříve to uděláš, tím lépe.
	AI_Output(other,self,"DIA_pir_1398_KillWork0_01_09");	//To ho mám zabít?
	AI_Output(self,other,"DIA_pir_1398_KillWork0_01_10");	//Správně. Jsi chytrá hlavička.
	AI_Output(other,self,"DIA_pir_1398_KillWork0_01_11");	//Kdo je ten chlap?
	AI_Output(self,other,"DIA_pir_1398_KillWork0_01_12");	//Jmenuje se Wambo. Možná jsi ho už potkal. Takže neztrácej čas!
	AI_Output(self,other,"DIA_pir_1398_KillWork0_01_13");	//Vrať se, jakmile bude hotovo. Možná budu vědět o něčem dalším.
	AI_Output(self,other,"DIA_pir_1398_KillWork0_01_14");	//A doufám, že ti nemusím připomínat, že vše musí být provedeno bez svědků.
	AI_Output(self,other,"DIA_pir_1398_KillWork0_01_15");	//Ber to na vědomí. Nepotřebujeme mít problém s domobranou.
	MIS_KILLWAMBO = LOG_Running;
	Log_CreateTopic(TOPIC_KILLWAMBO,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KILLWAMBO,LOG_Running);
	B_LogEntry(TOPIC_KILLWAMBO,"Asmal mi dal úkol: mám zabít domobránce Wamba, který prý dělá problémy místním obchodníkům z horní čtvrti.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(Mil_316_Wambo,"WaitFight2");
};


instance DIA_ADDON_INEXTREMO_ANNOUNCER_KILLWORK0DONE(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_killwork0done_condition;
	information = dia_addon_inextremo_announcer_killwork0done_info;
	permanent = FALSE;
	description = "Wambo to má za sebou.";
};


func int dia_addon_inextremo_announcer_killwork0done_condition()
{
	if((MIS_KILLWAMBO == LOG_Running) && (WAMBOISDEAD == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_killwork0done_info()
{
	self.name[0] = "Asmal";
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_pir_1398_KillWork0Done_01_00");	//Wambo to má za sebou.
	AI_Output(self,other,"DIA_pir_1398_KillWork0Done_01_03");	//Hmm... Myslím, že zákazníci budou spokojeni.
	AI_Output(self,other,"DIA_pir_1398_KillWork0Done_01_04");	//Zdá se, že jsi opravdu užitečný.
	AI_Output(self,other,"DIA_pir_1398_KillWork0Done_01_05");	//Tady, vem si tento měšec jako podíl vykonané práce.
	B_GiveInvItems(self,other,ItSe_GoldPocket100,1);
	MIS_KILLWAMBO = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_KILLWAMBO,LOG_SUCCESS);
	B_LogEntry(TOPIC_KILLWAMBO,"Asmal byl spokojený s mou prací.");
};


instance DIA_ADDON_INEXTREMO_ANNOUNCER_KILLWORK1(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_killwork1_condition;
	information = dia_addon_inextremo_announcer_killwork1_info;
	permanent = FALSE;
	description = "Máš pro mě nějakou práci?";
};


func int dia_addon_inextremo_announcer_killwork1_condition()
{
	if((JOINKILLERS == TRUE) && (KILLTARGET1 == FALSE) && (WAMBOISDEAD == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_killwork1_info()
{
	var C_Npc slf;
	self.name[0] = "Asmal";
	AI_Output(other,self,"DIA_pir_1398_KillWork1_01_00");	//Máš pro mě nějakou práci?
	AI_Output(self,other,"DIA_pir_1398_KillWork1_01_01");	//Hmmm... Jedna maličkost. Není příliš složitá, myslím, že to zvládneš.
	AI_Output(other,self,"DIA_pir_1398_KillWork1_01_02");	//Co mám udělat?
	AI_Output(self,other,"DIA_pir_1398_KillWork1_01_03");	//Chci, aby ses postaral o chlápka jménem Luis. Najdeš ho tady ve městě.
	AI_Output(other,self,"DIA_pir_1398_KillWork1_01_04");	//Mám ho zabít?
	AI_Output(self,other,"DIA_pir_1398_KillWork1_01_05");	//Jasně! Ten chlap je hrůza, mluví o věcech, o kterých by měl mlčet.
	AI_Output(self,other,"DIA_pir_1398_KillWork1_01_06");	//Měl by být okamžitě zprovozen z tohoto světa, protože by mohl udělat nějakou velkou chybu.
	AI_Output(self,other,"DIA_pir_1398_KillWork1_01_07");	//Snaž se to udělat bez zbytečných afér. Víš sám moc dobře, jak záleží na naší pověsti.
	AI_Output(self,other,"DIA_pir_1398_KillWork1_01_08");	//Až tu záležitost doděláš, vrať se, mám pro tebe další úkol.
	AI_StopProcessInfos(self);
	MIS_KILLTARGET1 = LOG_Running;
	Log_CreateTopic(TOPIC_KILLTARGET1,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KILLTARGET1,LOG_Running);
	B_LogEntry(TOPIC_KILLTARGET1,"Asmal mě poslal zabít chlapa jménem Luis. Tento muž může svými řečmi dostat někoho do nemilé situace. Budu to muset udělat bez zbytečných afér.");
	Wld_InsertNpc(vlk_6109_luis,"NW_CITY_LUIS");
	if(Npc_IsDead(Canthar) == TRUE)
	{
		KILLTARGET3 = TRUE;
	};
	if(Npc_IsDead(Lehmar) == TRUE)
	{
		KILLTARGET2 = TRUE;
	};
	if(Npc_IsDead(vlk_6110_nigel) == TRUE)
	{
		MISSION4COMPLETE = TRUE;
	};
};


instance DIA_ADDON_INEXTREMO_ANNOUNCER_KILLWORK1DONE(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_killwork1done_condition;
	information = dia_addon_inextremo_announcer_killwork1done_info;
	permanent = FALSE;
	description = "Na problém s Luisem můžeš zapomenout.";
};


func int dia_addon_inextremo_announcer_killwork1done_condition()
{
	if((MIS_KILLTARGET1 == LOG_Running) && (KILLTARGET1 == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_killwork1done_info()
{
	self.name[0] = "Asmal";
	AI_Output(other,self,"DIA_pir_1398_KillWork1Done_01_00");	//Na problém s Luisem můžeš zapomenout.
	AI_Output(self,other,"DIA_pir_1398_KillWork1Done_01_01");	//Jsi si jistý, že už nic neřekne?
	AI_Output(other,self,"DIA_pir_1398_KillWork1Done_01_02");	//Ano. Ten chlap mlčí jako leklá ryba.
	AI_Output(self,other,"DIA_pir_1398_KillWork1Done_01_03");	//Dobře, dobře! Děláš pokroky. Tvoje úspěchy budu vždy podporovat.
	AI_Output(self,other,"DIA_pir_1398_KillWork1Done_01_05");	//Tady máš svůj podíl.
	B_GiveInvItems(self,other,ItMi_Gold,250);
	MIS_KILLTARGET1 = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_KILLTARGET1,LOG_SUCCESS);
	B_LogEntry(TOPIC_KILLTARGET1,"Asmala potěšilo, že jsem to s Luisem vyřídil.");
	if(Npc_IsDead(Canthar) == TRUE)
	{
		KILLTARGET3 = TRUE;
	};
	if(Npc_IsDead(Lehmar) == TRUE)
	{
		KILLTARGET2 = TRUE;
	};
	if(Npc_IsDead(vlk_6110_nigel) == TRUE)
	{
		MISSION4COMPLETE = TRUE;
	};
};


instance DIA_ADDON_INEXTREMO_ANNOUNCER_KILLWORK2(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_killwork2_condition;
	information = dia_addon_inextremo_announcer_killwork2_info;
	permanent = FALSE;
	description = "Mluvil jsi o dalším úkolu.";
};


func int dia_addon_inextremo_announcer_killwork2_condition()
{
	if((JOINKILLERS == TRUE) && (KILLTARGET2 == FALSE) && (KILLTARGET1 == TRUE) && (WAMBOISDEAD == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_killwork2_info()
{
	self.name[0] = "Asmal";
	AI_Output(other,self,"DIA_pir_1398_KillWork2_01_00");	//Mluvil jsi o dalším úkolu.
	AI_Output(self,other,"DIA_pir_1398_KillWork2_01_01");	//Ano. Ten problém musíš vyřešit hned.
	AI_Output(other,self,"DIA_pir_1398_KillWork2_01_02");	//Tak o co jde?
	AI_Output(self,other,"DIA_pir_1398_KillWork2_01_03");	//Jde o Lehmara. Znáš ho?
	AI_Output(other,self,"DIA_pir_1398_KillWork2_01_04");	//Ano. Co udělal?
	AI_Output(self,other,"DIA_pir_1398_KillWork2_01_05");	//To se tě netýká. Jediné, co potřebuješ vědět je, že nám kdysi udělal jednu neocenitelnou službu.
	AI_Output(self,other,"DIA_pir_1398_KillWork2_01_06");	//Jeho pomoc nám usnadnila život ve městě, ale poplatek za jeho služby byl poměrně vysoký.
	AI_Output(self,other,"DIA_pir_1398_KillWork2_01_07");	//Myslím si, že od samotného začátku věděl, kdo jsme a co děláme.
	AI_Output(self,other,"DIA_pir_1398_KillWork2_01_08");	//Především ho zajímalo zlato, takže nekladl žádné zbytečné otázky - ale to se změnilo.
	AI_Output(self,other,"DIA_pir_1398_KillWork2_01_09");	//Teď ten bastard zašel příliš daleko!
	AI_Output(other,self,"DIA_pir_1398_KillWork2_01_10");	//Co udělal?
	AI_Output(self,other,"DIA_pir_1398_KillWork2_01_11");	//Pokud je mi známo, jde to s ním špatně.
	AI_Output(self,other,"DIA_pir_1398_KillWork2_01_12");	//Má příliš mnoho dlužníků, ale jen málokdo mu peníze vrátí. Proto se umanul, že si vydělá peníze jiným způsobem.
	AI_Output(self,other,"DIA_pir_1398_KillWork2_01_14");	//Začal nás vydírat! Pokud prý nechceme, aby o nás někdo věděl...
	AI_Output(self,other,"DIA_pir_1398_KillWork2_01_15");	//Pokud odmítneme, řekne vše lordu Andremu a domobraně.
	AI_Output(other,self,"DIA_pir_1398_KillWork2_01_17");	//Proč jsi už někoho na Lehmara neposlal?
	AI_Output(self,other,"DIA_pir_1398_KillWork2_01_20");	//Není to tak jednoduché, jak se může zdát. Stačí, aby u svého domu zahlédl jednoho z nás a poběží rovnou za lordem Andrem.
	AI_Output(self,other,"DIA_pir_1398_KillWork2_01_21");	//Lehmar není žádný hlupák, ví, že si to s ním můžeme kdykoli vyřídit. Navíc zná tvář všech našich lidí.
	AI_Output(self,other,"DIA_pir_1398_KillWork2_01_23");	//Kromě toho si nedávno najal osobního strážce. Slyšel jsem o něm, že je skvělý bojovník, bude těžké se s ním jen tak vypořádat.
	AI_Output(other,self,"DIA_pir_1398_KillWork2_01_24");	//Hmm... Mluvíš, jako by Lehmar byl vševědoucí.
	AI_Output(self,other,"DIA_pir_1398_KillWork2_01_25");	//A taky že téměř je, až na jednu věc...
	AI_Output(other,self,"DIA_pir_1398_KillWork2_01_26");	//Jakou?
	AI_Output(self,other,"DIA_pir_1398_KillWork2_01_27");	//Neví nic o tobě! Ten chlápek neví, že i ty jsi jedním z nás. Dokážu si představit jeho výraz, jakmile to zjistí. (směje se)
	AI_Output(self,other,"DIA_pir_1398_KillWork2_01_30");	//Tak neztrácej čas! Skoncuj s tím bastardem.
	AI_Output(other,self,"DIA_pir_1398_KillWork2_01_31");	//A co ten osobní strážce?
	AI_Output(self,other,"DIA_pir_1398_KillWork2_01_32");	//O něj se taky musíš postarat! Bude to těžké, ale nemáme na výběr.
	AI_Output(other,self,"DIA_pir_1398_KillWork2_01_33");	//Hmm... Ale kolem jeho domu je vždy hodně lidí! Když ho tam zabiju, domobrana mě hned chytí!
	AI_Output(self,other,"DIA_pir_1398_KillWork2_01_35");	//Setkej se s ním někde, kde bude méně lidí.
	AI_Output(self,other,"DIA_pir_1398_KillWork2_01_37");	//Slyšel jsem, že Lehmar často chodí večer do přístavu. Zdá se, že má rád čerstvý mořský vzduch.
	AI_Output(self,other,"DIA_pir_1398_KillWork2_01_38");	//Obvykle tam nikdo nebývá.
	AI_Output(self,other,"DIA_pir_1398_KillWork2_01_45");	//Těsně před smrtí mu vyřiď naše pozdravy. (smích)
	MIS_KILLTARGET2 = LOG_Running;
	Log_CreateTopic(TOPIC_KILLTARGET2,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KILLTARGET2,LOG_Running);
	B_LogEntry(TOPIC_KILLTARGET2,"Asmal mi dal další práci, mám zabít Lehmara. Lehmar vydírá cech zlodějů. Je tu ale problém - Lehmar má osobního strážce. Asmal říkal, že je to dobrý bojovník. Bude to obtížné, ale ve večerních hodinách najdu Lehmara v přístavu. To by mi mělo pomoct.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(VLK_484_Lehmar,"CanKill");
	Wld_InsertNpc(vlk_6120_lemarguard,"NW_CITY_LEMAR_KILL_GUARD");

	if(Npc_IsDead(Canthar) == TRUE)
	{
		KILLTARGET3 = TRUE;
	};
	if(Npc_IsDead(vlk_6110_nigel) == TRUE)
	{
		MISSION4COMPLETE = TRUE;
	};
};


instance DIA_ADDON_INEXTREMO_ANNOUNCER_KILLWORK2DONE(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_killwork2done_condition;
	information = dia_addon_inextremo_announcer_killwork2done_info;
	permanent = FALSE;
	description = "Pozdravuje tě Lemhar.";
};


func int dia_addon_inextremo_announcer_killwork2done_condition()
{
	if((MIS_KILLTARGET2 == LOG_Running) && (KILLTARGET2 == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_killwork2done_info()
{
	self.name[0] = "Asmal";
	AI_Output(other,self,"DIA_pir_1398_KillWork2Done_01_00");	//Pozdravuje tě Lehmar.
	AI_Output(self,other,"DIA_pir_1398_KillWork2Done_01_01");	//Jo?! A co říkal?
	AI_Output(other,self,"DIA_pir_1398_KillWork2Done_01_02");	//Nic, protože je mrtvý.
	AI_Output(self,other,"DIA_pir_1398_KillWork2Done_01_03");	//Vynikající! To prase si to zaslouží! Mnozí lidé se jeho smrti potěší.
	AI_Output(self,other,"DIA_pir_1398_KillWork2Done_01_05");	//Nikdo ho moc neměl rád.
	AI_Output(self,other,"DIA_pir_1398_KillWork2Done_01_06");	//Pokud jde o tebe, odvedl jsi skvělou práci.
	AI_Output(self,other,"DIA_pir_1398_KillWork2Done_01_07");	//Tady máš odměnu za to, co jsi udělal.
	B_GiveInvItems(self,other,ItMi_Gold,500);
	MIS_KILLTARGET2 = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_KILLTARGET2,LOG_SUCCESS);
	B_LogEntry(TOPIC_KILLTARGET2,"Asmala potěšilo, že jsem to s Lehmarem vyřídil.");
	if(Npc_IsDead(Canthar) == TRUE)
	{
		KILLTARGET3 = TRUE;
	};
	if(Npc_IsDead(vlk_6110_nigel) == TRUE)
	{
		MISSION4COMPLETE = TRUE;
	};
};

instance DIA_ADDON_INEXTREMO_ANNOUNCER_KILLREWARD(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_killreward_condition;
	information = dia_addon_inextremo_announcer_killreward_info;
	permanent = FALSE;
	description = "Doufám, že teď jsem hoden nosit zbroj vrahů.";
};

func int dia_addon_inextremo_announcer_killreward_condition()
{
	if((MIS_KILLTARGET2 == LOG_SUCCESS) && Npc_KnowsInfo(hero,dia_addon_inextremo_announcer_killarmor))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_killreward_info()
{
	self.name[0] = "Asmal";
	AI_Output(other,self,"DIA_pir_1398_KillReward_01_00");	//Doufám, že teď jsem hoden nosit zbroj vrahů.
	AI_Output(self,other,"DIA_pir_1398_KillReward_01_01");	//Tak ty o to máš pořád zájem... Hmm... to bych nečekal.
	AI_Output(self,other,"DIA_pir_1398_KillReward_01_03");	//Hmm... (zamyšleně) Podle mého názoru - ano, jsi hoden.
	AI_Output(self,other,"DIA_pir_1398_KillReward_01_04");	//Dokázal jsi, že jsi hoden nosit zbroj vrahů a mnohem více.
	AI_Output(self,other,"DIA_pir_1398_KillReward_01_05");	//Věděl jsem, že budeš výjimečný!
	AI_Output(self,other,"DIA_pir_1398_KillReward_01_06");	//Je pravda, že jsem nečekal, že k tomu dojde takhle rychle. Máš opravdu talent.
	AI_Output(self,other,"DIA_pir_1398_KillReward_01_08");	//Takže přijmi tuto zbroj.
	AI_Output(self,other,"DIA_pir_1398_KillReward_01_09");	//Doufám, že rozumíš, že je to čest.
	AI_Output(self,other,"DIA_pir_1398_KillReward_01_10");	//Tato zbroj všem řekne, kdo jsi a čeho jsi schopen.
	B_GiveInvItems(self,other,itar_kil_sl,1);
	B_LogEntry(TOPIC_KILLWAY,"Asmal řekl, že už jsem hoden nosit hodnost vraha a být nazýván plnohodnotným členem cechu.");
};

instance DIA_ADDON_INEXTREMO_ANNOUNCER_KILLWORK3(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_killwork3_condition;
	information = dia_addon_inextremo_announcer_killwork3_info;
	permanent = FALSE;
	description = "Ještě něco?";
};


func int dia_addon_inextremo_announcer_killwork3_condition()
{
	if((JOINKILLERS == TRUE) && (KILLTARGET3 == FALSE) && (KILLTARGET1 == TRUE) && (KILLTARGET2 == TRUE) && (WAMBOISDEAD == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_killwork3_info()
{
	self.name[0] = "Asmal";
	AI_Output(other,self,"DIA_pir_1398_KillWork3_01_00");	//Ještě něco?
	AI_Output(self,other,"DIA_pir_1398_KillWork3_01_01");	//Mám přímo pro tebe jednu specifickou práci.
	AI_Output(other,self,"DIA_pir_1398_KillWork3_01_02");	//Kdo tentokrát?
	AI_Output(self,other,"DIA_pir_1398_KillWork3_01_03");	//Canthar, obchodník na tržišti.
	AI_Output(other,self,"DIA_pir_1398_KillWork3_01_04");	//Canthar? Komu tak ublížil?
	AI_Output(self,other,"DIA_pir_1398_KillWork3_01_07");	//Canthar je velmi úspěšný obchodník, což by mohlo představovat hrozbu.
	AI_Output(self,other,"DIA_pir_1398_KillWork3_01_09");	//Lidé nemají rádi velké štěstí. Kromě toho se ukázalo jak Canthar hraje.
	AI_Output(self,other,"DIA_pir_1398_KillWork3_01_11");	//Má jistá spojení ve vyšších kruzích a využívá jich, aby odstranil své protivníky.
	AI_Output(self,other,"DIA_pir_1398_KillWork3_01_15");	//Nezklam lidi, kteří potřebují tvou pomoc.
	AI_Output(self,other,"DIA_pir_1398_KillWork3_01_16");	//Jdi - splň přání spoluobčanů.
	AI_StopProcessInfos(self);
	MIS_KILLTARGET3 = LOG_Running;
	Log_CreateTopic(TOPIC_KILLTARGET3,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KILLTARGET3,LOG_Running);
	B_LogEntry(TOPIC_KILLTARGET3,"Asmal mě poslal na další misi. Mám zprovodit ze světa obchodníka Canthara. Myslím, že to nebude problém.");

	if(Npc_GetDistToWP(VLK_468_Canthar,"NW_CITY_HABOUR_KASERN_RENGARU") <= 1000)
	{
		Npc_ExchangeRoutine(VLK_468_Canthar,"CanKill");
	};
	if(Npc_IsDead(vlk_6110_nigel) == TRUE)
	{
		MISSION4COMPLETE = TRUE;
	};
};


instance DIA_ADDON_INEXTREMO_ANNOUNCER_KILLWORK3DONE(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_killwork3done_condition;
	information = dia_addon_inextremo_announcer_killwork3done_info;
	permanent = FALSE;
	description = "Canthar už není hrozbou.";
};


func int dia_addon_inextremo_announcer_killwork3done_condition()
{
	if((MIS_KILLTARGET3 == LOG_Running) && (KILLTARGET3 == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_killwork3done_info()
{
	self.name[0] = "Asmal";
	AI_Output(other,self,"DIA_pir_1398_KillWork3Done_01_00");	//Canthar už není hrozbou.
	AI_Output(self,other,"DIA_pir_1398_KillWork3Done_01_03");	//To je dobře! Zákazníci budou spokojeni.
	AI_Output(self,other,"DIA_pir_1398_KillWork3Done_01_04");	//Tady máš svůj podíl za odvedenou práci.
	B_GiveInvItems(self,other,ItMi_Gold,750);
	MIS_KILLTARGET3 = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_KILLTARGET3,LOG_SUCCESS);
	B_LogEntry(TOPIC_KILLTARGET3,"Asmal byl rád, že jsem splnil své poslání.");
	if(Npc_IsDead(vlk_6110_nigel) == TRUE)
	{
		MISSION4COMPLETE = TRUE;
	};
};


instance DIA_ADDON_INEXTREMO_ANNOUNCER_KILLWORK4(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_killwork4_condition;
	information = dia_addon_inextremo_announcer_killwork4_info;
	permanent = FALSE;
	description = "Kdo je další v pořadí?";
};


func int dia_addon_inextremo_announcer_killwork4_condition()
{
	if((JOINKILLERS == TRUE) && (MISSION4COMPLETE == FALSE) && (KILLTARGET1 == TRUE) && (KILLTARGET2 == TRUE) && (KILLTARGET3 == TRUE) && (WAMBOISDEAD == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_killwork4_info()
{
	self.name[0] = "Asmal";
	AI_Output(other,self,"DIA_pir_1398_KillWork4_01_00");	//Kdo je další v pořadí?
	AI_Output(self,other,"DIA_pir_1398_KillWork4_01_03");	//No dobře... Mám tu něco pro tebe.
	AI_Output(self,other,"DIA_pir_1398_KillWork4_01_05");	//Jeden chlap jménem Nigel dluží jednomu obchodníkovi spousty peněz.
	AI_Output(self,other,"DIA_pir_1398_KillWork4_01_06");	//Jak vím, ten dluh činí kolem 2000 zlatých.
	AI_Output(self,other,"DIA_pir_1398_KillWork4_01_08");	//Ano, je docela vysoký. Nigel se rozhodl, že nejlepší bude, když na svůj dluh zapomene.
	AI_Output(other,self,"DIA_pir_1398_KillWork4_01_09");	//Co ode mě potřebuješ?
	AI_Output(self,other,"DIA_pir_1398_KillWork4_01_10");	//Najdi toho bastarda a pokus se mu domluvit. Pokud to nepůjde, zabij ho.
	AI_Output(self,other,"DIA_pir_1398_KillWork4_01_11");	//Samozřejmě, že první možnost by byla pohodlnější...
	AI_Output(self,other,"DIA_pir_1398_KillWork4_01_12");	//Ale pokud to nepůjde, dej mu co proto.
	AI_Output(other,self,"DIA_pir_1398_KillWork4_01_13");	//Kde ho najdu?
	AI_Output(self,other,"DIA_pir_1398_KillWork4_01_14");	//Říká se, že ho hodně lidí vidělo v hostinci u Orlana.
	AI_Output(self,other,"DIA_pir_1398_KillWork4_01_16");	//Teď jdi! Víš, co máš dělat.
	MIS_KILLTARGET4 = LOG_Running;
	Log_CreateTopic(TOPIC_KILLTARGET4,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KILLTARGET4,LOG_Running);
	B_LogEntry(TOPIC_KILLTARGET4,"Mám najít muže jménem Nigel a připomenout mu jeho povinnost. Pokud nezaplatí, mám ho zabít. Najdu ho v hostinci u Orlana.");
};


instance DIA_ADDON_INEXTREMO_ANNOUNCER_KILLWORK4DONE(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_killwork4done_condition;
	information = dia_addon_inextremo_announcer_killwork4done_info;
	permanent = FALSE;
	description = "Domluvil jsem Nigelovi.";
};


func int dia_addon_inextremo_announcer_killwork4done_condition()
{
	if((MIS_KILLTARGET4 == LOG_Running) && ((KILLTARGET4 == TRUE) || ((GRABTARGET4 == TRUE) && (NIGELBANDITISDEAD == TRUE) && (KILLTARGET4 == FALSE) && ((Npc_HasItems(other,ItMi_Gold) >= 2000) || (Npc_HasItems(other,itse_nigelpocket) >= 1)))))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_killwork4done_info()
{
	self.name[0] = "Asmal";
	AI_Output(other,self,"DIA_pir_1398_KillWork4Done_01_00");	//Domluvil jsem Nigelovi.
	AI_Output(self,other,"DIA_pir_1398_KillWork4Done_01_01");	//Dal ti peníze?
	if((GRABTARGET4 == TRUE) && (NIGELBANDITISDEAD == TRUE) && (KILLTARGET4 == FALSE) && ((Npc_HasItems(other,ItMi_Gold) >= 2000) || (Npc_HasItems(other,itse_nigelpocket) >= 1)))
	{
		AI_Output(other,self,"DIA_pir_1398_KillWork4Done_01_02");	//Dá se říct, že dal. Bylo to sice trochu složité, ale zvládl jsem to.
		AI_Output(self,other,"DIA_pir_1398_KillWork4Done_01_03");	//Kde jsou ty peníze?
		if(Npc_HasItems(other,itse_nigelpocket) >= 1)
		{
			B_GiveInvItems(other,self,itse_nigelpocket,1);
			AI_Output(other,self,"DIA_pir_1398_KillWork4Done_01_04A");	//Tady, vem si tento měšec.
			Npc_RemoveInvItems(self,itse_nigelpocket,1);

			if(MIS_NIGELMATTER == LOG_Running)
			{
				MIS_NIGELMATTER = LOG_FAILED;
				Log_SetTopicStatus(TOPIC_NIGELMATTER,LOG_OBSOLETE);
			};
		}
		else
		{
			B_GiveInvItems(other,self,ItMi_Gold,2000);
			AI_Output(other,self,"DIA_pir_1398_KillWork4Done_01_04B");	//Tady to je - 2000 zlatých.
			Npc_RemoveInvItems(self,ItMi_Gold,2000);
		};
		AI_Output(self,other,"DIA_pir_1398_KillWork4Done_01_05");	//Vynikající! Náš klient bude spokojen.
		AI_Output(self,other,"DIA_pir_1398_KillWork4Done_01_09");	//Tady je tvůj podíl.
		AI_Output(self,other,"DIA_pir_1398_KillWork4Done_01_10");	//Je to velká hromada peněz. Využij je s rozumem.
		AI_Output(other,self,"DIA_pir_1398_KillWork4Done_01_11");	//O tom nepochybuj.
		B_GiveInvItems(self,other,ItMi_Gold,1000);
		MIS_KILLTARGET4 = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_KILLTARGET4,LOG_SUCCESS);
		B_LogEntry(TOPIC_KILLTARGET4,"Asmal byl potěšen, že jsem od Nigela získal zpátky dlužnou částku.");
	}
	else if(KILLTARGET4 == TRUE)
	{
		AI_Output(other,self,"DIA_pir_1398_KillWork4Done_01_12");	//Bohužel ne. Ten chlap nebral vážně mé argumenty a peníze neměl.
		AI_Output(other,self,"DIA_pir_1398_KillWork4Done_01_13");	//Takže jsem s ním musel skoncovat.
		AI_Output(self,other,"DIA_pir_1398_KillWork4Done_01_14");	//To je škoda, ale počítal jsem s tím.
		AI_Output(self,other,"DIA_pir_1398_KillWork4Done_01_15");	//V každém případě, práci jsi odvedl.
		AI_Output(self,other,"DIA_pir_1398_KillWork4Done_01_16");	//Tady vem si to. Poplatek za potíže.
		B_GiveInvItems(self,other,ItMi_Gold,500);
		MIS_KILLTARGET4 = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_KILLTARGET4,LOG_SUCCESS);
		B_LogEntry(TOPIC_KILLTARGET4,"Asmala mrzelo, že se mi nepovedlo získat zpátky Nigelův dluh vyjednáváním. Ale co, práci jsem odvedl.");
	};
	MISSION4COMPLETE = TRUE;
};


instance DIA_ADDON_INEXTREMO_ANNOUNCER_KILLWORK5(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_killwork5_condition;
	information = dia_addon_inextremo_announcer_killwork5_info;
	permanent = FALSE;
	description = "Máš pro mě další práci?";
};


func int dia_addon_inextremo_announcer_killwork5_condition()
{
	if((JOINKILLERS == TRUE) && (KILLTARGET5 == FALSE) && (KILLTARGET1 == TRUE) && (KILLTARGET2 == TRUE) && (KILLTARGET3 == TRUE) && (MISSION4COMPLETE == TRUE) && (WAMBOISDEAD == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_killwork5_info()
{
	self.name[0] = "Asmal";
	AI_Output(other,self,"DIA_pir_1398_KillWork5_01_00");	//Máš pro mě další práci?
	AI_Output(self,other,"DIA_pir_1398_KillWork5_01_01");	//Možná. Je tu něco, co je potřeba vyřešit.
	AI_Output(self,other,"DIA_pir_1398_KillWork5_01_05");	//Nedávno jsem se v Orlanově hospodě setkal s jedním mužem - starý známý.
	AI_Output(self,other,"DIA_pir_1398_KillWork5_01_07");	//Kdysi býval členem cechu vrahů.
	AI_Output(self,other,"DIA_pir_1398_KillWork5_01_10");	//Ale pak se ten idiot nechal chytit a málem vzal všechny z cechu s sebou.
	AI_Output(self,other,"DIA_pir_1398_KillWork5_01_11");	//Nakonec byl odsouzen pracovat v dolech, ale podařilo se mu utéct.
	AI_Output(self,other,"DIA_pir_1398_KillWork5_01_13");	//Nic jsem o něm neslyšel, až donedávna.
	AI_Output(other,self,"DIA_pir_1398_KillWork5_01_17");	//V čem je problém?
	AI_Output(self,other,"DIA_pir_1398_KillWork5_01_18");	//Problém je, že toho o nás ví příliš.
	AI_Output(self,other,"DIA_pir_1398_KillWork5_01_19");	//Stále nás obviňuje, že jsme mu tehdy nepomohli uprchnout.
	AI_Output(self,other,"DIA_pir_1398_KillWork5_01_20");	//A vzhledem k tomu, že jsme se znovu setkali, mám dojem, že si nenechá ujít příležitost předat nás domobraně.
	AI_Output(self,other,"DIA_pir_1398_KillWork5_01_21");	//Bohužel s ním cinkání zlaťáků nic nedělá.
	AI_Output(other,self,"DIA_pir_1398_KillWork5_01_22");	//Vždyť je to trestanec, nikdo mu neuvěří.
	AI_Output(self,other,"DIA_pir_1398_KillWork5_01_23");	//Možná, ale nebudem to riskovat.
	AI_Output(self,other,"DIA_pir_1398_KillWork5_01_24");	//Je mi známo, že slouží jako jeden z žoldáků na Onarově farmě.
	AI_Output(self,other,"DIA_pir_1398_KillWork5_01_27");	//Musíme to vyřešit co nejdřív.
	AI_Output(other,self,"DIA_pir_1398_KillWork5_01_30");	//Jakže se to jmenuje?
	AI_Output(self,other,"DIA_pir_1398_KillWork5_01_31");	//Jeho jméno je Rudar. Říká ti to něco?
	AI_Output(other,self,"DIA_pir_1398_KillWork5_01_32");	//Jistě, už teď je mrtvý.
	MIS_KILLTARGET5 = LOG_Running;
	Log_CreateTopic(TOPIC_KILLTARGET5,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KILLTARGET5,LOG_Running);
	B_LogEntry(TOPIC_KILLTARGET5,"Asmal potkal svého starého známého. Býval to člen cechu vrahů, ale prý může vyzradit cech. Jmenuje se Rudar a je jedním z žoldáků na Onarově farmě. Mám se o něj postarat.");
	Wld_InsertNpc(sld_6111_rudar,"NW_BIGFARM_RUDAR");
};


instance DIA_ADDON_INEXTREMO_ANNOUNCER_KILLWORK5DONE(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_killwork5done_condition;
	information = dia_addon_inextremo_announcer_killwork5done_info;
	permanent = FALSE;
	description = "Rudar je mrtvý.";
};


func int dia_addon_inextremo_announcer_killwork5done_condition()
{
	if((MIS_KILLTARGET5 == LOG_Running) && (KILLTARGET5 == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_killwork5done_info()
{
	self.name[0] = "Asmal";
	AI_Output(other,self,"DIA_pir_1398_KillWork5Done_01_00");	//Rudar je mrtvý.
	AI_Output(self,other,"DIA_pir_1398_KillWork5Done_01_03");	//Hmm... Dobrá práce, konečně na to můžeme zapomenout.
	AI_Output(self,other,"DIA_pir_1398_KillWork5Done_01_04");	//Jsem upřímně překvapen, že jsi ho zvládl sám.
	AI_Output(self,other,"DIA_pir_1398_KillWork5Done_01_05");	//Rudar byl vždy dobrý bojovník a navíc dokonale ovládá meč. Narozdíl odě mě vždy upřednostňoval meč místo rapíru.
	AI_Output(self,other,"DIA_pir_1398_KillWork5Done_01_06");	//Ale to už není důležité... Nejdůležitější teď je, že už nepromluví.
	AI_Output(self,other,"DIA_pir_1398_KillWork5Done_01_07");	//Tady je tvá odměna. To je to nejlepší, co ti teď můžu dát.
	AI_Output(other,self,"DIA_pir_1398_KillWork5Done_01_08");	//Díky.
	B_GiveInvItems(self,other,ItMi_Gold,1000);
	MIS_KILLTARGET5 = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_KILLTARGET5,LOG_SUCCESS);
	B_LogEntry(TOPIC_KILLTARGET5,"Asmal byl potěšen, když zjistil, že je Rudar mrtvý. Zřejmě to byl velmi děsivý muž. Ale tohle už je minulostí.");
};


instance DIA_ADDON_INEXTREMO_ANNOUNCER_KILLWORKFINAL(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_killworkfinal_condition;
	information = dia_addon_inextremo_announcer_killworkfinal_info;
	permanent = FALSE;
	description = "Máš pro mě nějaký další úkol?";
};


func int dia_addon_inextremo_announcer_killworkfinal_condition()
{
	if((JOINKILLERS == TRUE) && (KILLTARGETFINAL == FALSE) && (KILLTARGET1 == TRUE) && (KILLTARGET2 == TRUE) && (KILLTARGET3 == TRUE) && (MISSION4COMPLETE == TRUE) && (KILLTARGET5 == TRUE) && (WAMBOISDEAD == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_killworkfinal_info()
{
	self.name[0] = "Asmal";
	AI_Output(other,self,"DIA_pir_1398_KillWorkFinal_01_00");	//Máš pro mě nějaký další úkol?
	AI_Output(self,other,"DIA_pir_1398_KillWorkFinal_01_01");	//Hmm... Ano.
	AI_Output(self,other,"DIA_pir_1398_KillWorkFinal_01_05");	//Asi už víš, že je v Khorinisu v poslední době více banditů.
	AI_Output(self,other,"DIA_pir_1398_KillWorkFinal_01_07");	//Jakmile tito lidé uvidí příležitost, jsou připraveni udělat cokoli, jen aby dostali to, co chtějí.
	AI_Output(self,other,"DIA_pir_1398_KillWorkFinal_01_08");	//Okradou a zabijí každého, koho se jim zamane. Jsou hrozně brutální...
	AI_Output(other,self,"DIA_pir_1398_KillWorkFinal_01_09");	//Co s tím? Co to má společného s cechem vrahů?
	AI_Output(self,other,"DIA_pir_1398_KillWorkFinal_01_12");	//Hodně lidem ve městě se to nelíbí. Většinou se jedná o obchodníky, jejichž obchodní činnost trpí právě díky nim.
	AI_Output(self,other,"DIA_pir_1398_KillWorkFinal_01_13");	//Nedávno byl jeden obchodník napaden právě těmito bandity. Měl u sebe cenné zboží a podle něj i slušné množství zlata.
	AI_Output(other,self,"DIA_pir_1398_KillWorkFinal_01_14");	//(s obdivem) Zřejmě se jednalo o schopného obchodníka!
	AI_Output(self,other,"DIA_pir_1398_KillWorkFinal_01_15");	//Ano, měl zatracené štěstí - byl schopen z toho vyjít živý. Nyní chce získat své zboží a zlato zpátky.
	AI_Output(other,self,"DIA_pir_1398_KillWorkFinal_01_16");	//Pak se tedy měl obrátit na domobranu.
	AI_Output(self,other,"DIA_pir_1398_KillWorkFinal_01_17");	//COŽE? K těm zbabělcům? Vždyť oni se bojí vystrčit nos z bran města! Natož aby se vypořádali s celým gangem banditů! (smích)
	AI_Output(self,other,"DIA_pir_1398_KillWorkFinal_01_18");	//Maximálně řeší problémy s farmáři, kvůli daním. Proto se tedy obrátili na nás.
	AI_Output(self,other,"DIA_pir_1398_KillWorkFinal_01_21");	//Ten, co si nás objednal, nám udělal nabídku a naznačil, že mluví jménem mnoha vlivných lidí z města.
	AI_Output(self,other,"DIA_pir_1398_KillWorkFinal_01_22");	//Zjevně měl podporu dalších obchodníků. Přeci jen, je to v jejich zájmu.
	AI_Output(other,self,"DIA_pir_1398_KillWorkFinal_01_23");	//A ty jsi souhlasil?
	AI_Output(self,other,"DIA_pir_1398_KillWorkFinal_01_24");	//Samozřejmě, dá nám za to spousty peněz.
	AI_Output(other,self,"DIA_pir_1398_KillWorkFinal_01_2A");	//Kolik nám dá každý z nich?
	AI_Output(self,other,"DIA_pir_1398_KillWorkFinal_01_2B");	//To nevím, ale bude to hodně. O tom není pochyb.
	AI_Output(other,self,"DIA_pir_1398_KillWorkFinal_01_28");	//Aha. Co tedy uděláme?
	AI_Output(self,other,"DIA_pir_1398_KillWorkFinal_01_29");	//Poslal jsem Luttera a Flaila, aby o těch bastardech něco zjistili.
	AI_Output(other,self,"DIA_pir_1398_KillWorkFinal_01_30");	//Zjistili už něco?
	AI_Output(self,other,"DIA_pir_1398_KillWorkFinal_01_31");	//Něco málo. Vůdce těch banditů, kteří napadli našeho obchodníka, si říká Hans. Ještě jsem o něm neslyšel.
	AI_Output(self,other,"DIA_pir_1398_KillWorkFinal_01_32");	//Kromě něho je v gangu ještě asi sedm dalších banditů. Usadili se někde poblíž Onarovy farmy.
	AI_Output(self,other,"DIA_pir_1398_KillWorkFinal_01_37");	//Jakmile jsem zjistil, kde se ti bastardi skrývají, poslal jsem na ně pár našich kluků.
	AI_Output(self,other,"DIA_pir_1398_KillWorkFinal_01_41");	//Ale tak jednoduché to není...
	AI_Output(self,other,"DIA_pir_1398_KillWorkFinal_01_42");	//Kluci nakonec vzali nohy na ramena, naštěstí nikdo nepřišel o život.
	AI_Output(other,self,"DIA_pir_1398_KillWorkFinal_01_44");	//Hmm... Zdá se, že jsme narazili na tuhé bojovníky.
	AI_Output(self,other,"DIA_pir_1398_KillWorkFinal_01_45");	//Bohužel máš pravdu. Hansova banda je opravdu tvrdý oříšek. Ale vyřídíme je, i kdybychom je měli umlátit holýma rukama!
	AI_Output(other,self,"DIA_pir_1398_KillWorkFinal_01_46");	//Co tedy uděláme?
	AI_Output(self,other,"DIA_pir_1398_KillWorkFinal_01_47");	//V každém případě naše práce musí být provedena a nezáleží na tom, zda zabijeme pouze jednu osobu nebo rovnou celý gang.
	AI_Output(other,self,"DIA_pir_1398_KillWorkFinal_01_48");	//Chceš jít na ně sám?
	AI_Output(self,other,"DIA_pir_1398_KillWorkFinal_01_49");	//Ne, samozřejmě... (smích) Rozumu mi ještě neubylo!
	AI_Output(self,other,"DIA_pir_1398_KillWorkFinal_01_50");	//Půjdeme tam všichni společně. Myslím, že budeme tak mít větší šanci porazit Hanse a jeho chlapy.
	AI_Output(other,self,"DIA_pir_1398_KillWorkFinal_01_54");	//Kdy se vydáme?
	AI_Output(self,other,"DIA_pir_1398_KillWorkFinal_01_55");	//Právě těď. Postupně vyjdem z města jeden po druhém, abychom neupoutali pozornost stráží.
	AI_Output(self,other,"DIA_pir_1398_KillWorkFinal_01_58");	//Sejdeme se v lese poblíž Onarovy farmy.
	AI_Output(self,other,"DIA_pir_1398_KillWorkFinal_01_60");	//Podle Luttera poblíž chová ovce nějaký pastýř.
	AI_Output(other,self,"DIA_pir_1398_KillWorkFinal_01_62");	//Dobře, budu tam.
	MIS_KILLTARGETFINAL = LOG_Running;
	Log_CreateTopic(TOPIC_KILLTARGETFINAL,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KILLTARGETFINAL,LOG_Running);
	B_LogEntry(TOPIC_KILLTARGETFINAL,"Asmal se chce vypořádat s gangem banditů v blízkosti Onarovy farmy. Jejich vůdce se jmenuje Hans a zdá se, že on a jeho chlapi budou docela tvrdý oříšek. Asmala tato práce zajímá, protože bude velmi dobře zaplacená. Mám se s Asmalem a ostatními z cechu setkat v blízkosti Onarovy farmy, poblíž místa, kde chová ovce nějaký pastýř. Pak začneme s naší špinavou prací.");
	AI_StopProcessInfos(self);
	b_killmeetinghans();
	Wld_InsertNpc(bdt_6112_hans,"NW_BDT_HANS_S");
	Wld_InsertNpc(bdt_6113_hansband_01,"NW_BDT_HANS_01_S");
	Wld_InsertNpc(bdt_6114_hansband_02,"NW_BDT_HANS_02_S");
	Wld_InsertNpc(bdt_6115_hansband_03,"NW_BDT_HANS_03_S");
	Wld_InsertNpc(bdt_6116_hansband_04,"NW_BDT_HANS_04_S");
	Wld_InsertNpc(bdt_6117_hansband_05,"NW_BDT_HANS_05_S");
	Wld_InsertNpc(bdt_6118_hansband_06,"NW_BDT_HANS_06_S");
	Wld_InsertNpc(bdt_6119_hansband_07,"NW_BDT_HANS_07_S");
};


instance DIA_ADDON_INEXTREMO_ANNOUNCER_KILLWORKFINALREADYFORFIGHT(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_killworkfinalreadyforfight_condition;
	information = dia_addon_inextremo_announcer_killworkfinalreadyforfight_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_inextremo_announcer_killworkfinalreadyforfight_condition()
{
	if((Npc_GetDistToWP(self,"NW_HANSLAGER") < 500) && (MIS_KILLTARGETFINAL == LOG_Running) && (KILLTARGETFINAL == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_killworkfinalreadyforfight_info()
{
	self.name[0] = "Asmal";
	AI_Output(self,other,"DIA_pir_1398_KillWorkFinalReadyForFight_01_00");	//Kdes byl tak dlouho?! (nervózně)
	AI_Output(self,other,"DIA_pir_1398_KillWorkFinalReadyForFight_01_02");	//To je jedno... Nemáme moc času.
	AI_Output(self,other,"DIA_pir_1398_KillWorkFinalReadyForFight_01_03");	//Vidíš za mnou záblesk z ohniště? To je Hansův tábor.
	AI_Output(self,other,"DIA_pir_1398_KillWorkFinalReadyForFight_01_05");	//Musíme jednat. Moment překvapení nám dá na začátku bitvy určitou výhodu.
	GuideGuildsToCamp = TRUE;
	Info_ClearChoices(dia_addon_inextremo_announcer_killworkfinalreadyforfight);
	Info_AddChoice(dia_addon_inextremo_announcer_killworkfinalreadyforfight,"Jdeme!",dia_addon_inextremo_announcer_killworkfinalreadyforfight_figth);
};

func void dia_addon_inextremo_announcer_killworkfinalreadyforfight_figth()
{
	AI_StopProcessInfos(self);
	b_killgotohans();
	b_changeguild(PIR_1390_Addon_InExtremo_DrPymonte,GIL_NONE);
	b_changeguild(PIR_1391_Addon_InExtremo_TheFlail,GIL_NONE);
	b_changeguild(PIR_1395_Addon_InExtremo_Lutter,GIL_NONE);
	b_changeguild(PIR_1396_Addon_InExtremo_Flex,GIL_NONE);
	b_changeguild(pir_1397_addon_inextremo_charlotte,GIL_NONE);
	b_changeguild(pir_1398_addon_inextremo_announcer,GIL_NONE);
};


instance DIA_ADDON_INEXTREMO_ANNOUNCER_KILLWORKFINALDONE(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_killworkfinaldone_condition;
	information = dia_addon_inextremo_announcer_killworkfinaldone_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_inextremo_announcer_killworkfinaldone_condition()
{
	if((MIS_KILLTARGETFINAL == LOG_Running) && (KILLTARGETFINAL == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_killworkfinaldone_info()
{
	var int countlost;
	var int countsharlotte;
	self.name[0] = "Asmal";
	b_changeguild(PIR_1390_Addon_InExtremo_DrPymonte,GIL_OUT);
	b_changeguild(PIR_1391_Addon_InExtremo_TheFlail,GIL_OUT);
	b_changeguild(PIR_1395_Addon_InExtremo_Lutter,GIL_OUT);
	b_changeguild(PIR_1396_Addon_InExtremo_Flex,GIL_OUT);
	b_changeguild(pir_1397_addon_inextremo_charlotte,GIL_OUT);
	b_changeguild(pir_1398_addon_inextremo_announcer,GIL_OUT);
	AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_00");	//(udýchaně) Nyní už Hans a jeho muži nejsou nebezpeční.
	AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_02");	//Tihle parchanti byli opravdu tvrdí hoši.
	MIS_KILLTARGETFINAL = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_KILLTARGETFINAL,LOG_SUCCESS);
	B_LogEntry(TOPIC_KILLTARGETFINAL,"S Hansovou partou jsme skončili. Všichni jsou mrtví.");

	if((CHARLOTTEISDEADX == TRUE) || (FLEXISDEADX == TRUE) || (LUTTERISDEADX == TRUE) || (THEFLAILISDEADX == TRUE) || (DRPYMONTEISDEADX == TRUE))
	{
		AI_PlayAni(self,"T_SEARCH");
		AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_04");	//Hmm... Touto prací jsme hodně dokázali.
		if(CHARLOTTEISDEADX == TRUE)
		{
			AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_05");	//Charlotte...
			countsharlotte = 1;
			countlost = countlost + 1;
		};
		if(FLEXISDEADX == TRUE)
		{
			AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_06");	//Flex...
			countlost = countlost + 1;
		};
		if(LUTTERISDEADX == TRUE)
		{
			AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_07");	//Lutter...
			countlost = countlost + 1;
		};
		if(THEFLAILISDEADX == TRUE)
		{
			AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_08");	//Flail...
			countlost = countlost + 1;
		};
		if(DRPYMONTEISDEADX == TRUE)
		{
			AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_09");	//Pymonte...
			countlost = countlost + 1;
		};
		if(countlost > 1)
		{
			AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_10");	//... všichni jsou mrtví! (smutně) Budou mi velmi chybět!
			AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_12");	//No... Už se o tom nebavme, teď už to nezměníme.
			AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_13");	//Naše práce je hotová, a to je to nejdůležitější!
		}
		else
		{
			if(countsharlotte == 1)
			{
				AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_14");	//... je mrtvá! Chudák holka... (smutně)
			}
			else
			{
				AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_16");	//... je mrtvý! Všem nám bude velmi chybět.
			};
			AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_18");	//No... Už se o tom nebavme, teď už to nezměníme.
			AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_19");	//Naše práce je hotová, a to je to nejdůležitější!
		};
	}
	else
	{
		AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_20");	//Tak a máme to - zdá se, že jsme všichni v pořádku.
		AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_22");	//Banditi jsou mrtví, to je důležité. Úkol splněn.
	};

	AI_Output(other,self,"DIA_pir_1398_KillWorkFinalDone_01_23");	//A co to zlato?
	AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_24");	//Ach, ano. Nyní každý z nás dostane slušné peníze. Naší odměnou je prý všechno zlato, které banditi vzali tomu obchodníkovi.

	if(HANSKILL == 0)
	{
		AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_25");	//No, moc jsi nám v tomhle zmatku nepomohl, ale přesto jsi riskoval svůj život, proto si zasloužíš svůj podíl.
		AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_26");	//Tady máš - 500 zlatých.
		AI_Output(other,self,"DIA_pir_1398_KillWorkFinalDone_01_27");	//Co?! Tak málo?
		AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_28");	//Nezabil jsi ani jednoho banditu a to chceš víc?
		AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_29");	//Radím ti, přestaň fňukat a spokoj se s tím, co máš!
		AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_30");	//Měl by ses raději více činit, pokud chceš, aby tvůj podíl byl větší, než tohle...
		AI_Output(other,self,"DIA_pir_1398_KillWorkFinalDone_01_31");	//Tak to se mi tedy nelíbí!
		AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_32");	//To je tvůj problém.
		Info_ClearChoices(dia_addon_inextremo_announcer_killworkfinaldone);
		Info_AddChoice(dia_addon_inextremo_announcer_killworkfinaldone,"Dobře, tak mi je dej...",dia_addon_inextremo_announcer_killworkfinaldone_ok);
		Info_AddChoice(dia_addon_inextremo_announcer_killworkfinaldone,"Okamžitě mi zaplať víc, nebo tě zabiju!",dia_addon_inextremo_announcer_killworkfinaldone_refuse);
	}
	else
	{
		AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_34");	//Pokud jde o tebe, jsi pěkný otrava!
		MIS_KILLTARGETFINAL = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_KILLTARGETFINAL,LOG_SUCCESS);
		B_LogEntry(TOPIC_KILLTARGETFINAL,"S Hansovou partou jsme skončili. Všichni jsou mrtví.");

		if(HANSKILL == 1)
		{
			AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_35");	//Sundal jsi jednoho z těch bastardů. To nebyla vůbec špatná práce, člověče!
			AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_36");	//Tady máš 1000 zlatých.
			AI_Output(other,self,"DIA_pir_1398_KillWorkFinalDone_01_37");	//No, to není vůbec špatné.
			B_GiveInvItems(self,other,ItMi_Gold,1000);
		}
		else if(HANSKILL == 2)
		{
			AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_39");	//Sundal jsi dva z těch bastardů. Dobrá práce, člověče!
			AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_40");	//Tady máš 1500 zlatých.
			AI_Output(other,self,"DIA_pir_1398_KillWorkFinalDone_01_41");	//No, to není vůbec špatné.
			B_GiveInvItems(self,other,ItMi_Gold,1500);
		}
		else if(HANSKILL == 3)
		{
			AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_43");	//Sundal jsi tři bastardy z Hansovy party. Dobrá práce, člověče!
			AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_44");	//Tady máš 2000 zlatých.
			AI_Output(other,self,"DIA_pir_1398_KillWorkFinalDone_01_45");	//No, to není vůbec špatné.
			B_GiveInvItems(self,other,ItMi_Gold,2000);
		}
		else if(HANSKILL == 4)
		{
			AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_47");	//Sundal jsi čtyři bastardy z Hansovy party. Dobrá práce, člověče!
			AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_48");	//Tady máš 2500 zlatých.
			AI_Output(other,self,"DIA_pir_1398_KillWorkFinalDone_01_49");	//No, to není vůbec špatné.
			B_GiveInvItems(self,other,ItMi_Gold,2500);
		}
		else if(HANSKILL == 5)
		{
			AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_51");	//Sundal jsi pět bastardů z Hansovy party. Dobrá práce, člověče!
			AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_52");	//Tady máš 3000 zlatých.
			AI_Output(other,self,"DIA_pir_1398_KillWorkFinalDone_01_53");	//No, to není vůbec špatné.
			B_GiveInvItems(self,other,ItMi_Gold,3000);
		}
		else if(HANSKILL == 6)
		{
			AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_55");	//Sundal jsi jich šest! Ještě jsem nikdy neviděl člověka, který by měl takovou kuráž!
			AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_56");	//Tady máš 3500 zlatých.
			AI_Output(other,self,"DIA_pir_1398_KillWorkFinalDone_01_57");	//No, to není vůbec špatné.
			B_GiveInvItems(self,other,ItMi_Gold,3500);
		}
		else if(HANSKILL == 7)
		{
			AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_59");	//Ty jsi tedy zvíře, sedm už jich nikdy nepromluví!
			AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_60");	//Banditi si zřejmě neuvědomili, s kým mají tu čest.
			AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_61");	//Tady máš 4000 zlatých. To jsou velmi slušné peníze, více než odpovídající za tvé zásluhy.
			AI_Output(other,self,"DIA_pir_1398_KillWorkFinalDone_01_62");	//No, to není vůbec špatné.
			B_GiveInvItems(self,other,ItMi_Gold,4000);
		}
		else if(HANSKILL == 8)
		{
			AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_64");	//Dodělal jsi všechny bandity! Hans je nejspíš v rozpacích!
			AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_65");	//Myslím, že kdydy Hans věděl o tom, jaký jsi, hned by tě chtěl mít v partě.
			AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_01_67");	//Tady máš 5000 zlatých. To jsou velmi slušné peníze, více než odpovídající za tvé zásluhy.
			AI_Output(other,self,"DIA_pir_1398_KillWorkFinalDone_01_68");	//No, to není vůbec špatné.
			B_GiveInvItems(self,other,ItMi_Gold,5000);
		};
	};
};

func void dia_addon_inextremo_announcer_killworkfinaldone_ok()
{
	AI_Output(other,self,"DIA_pir_1398_KillWorkFinalDone_Ok_01_00");	//Dobře, tak mi je dej...
	AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_Ok_01_01");	//To je lepší. Tady máš svůj podíl.
	AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_Ok_01_02");	//Hlavně už mi tu nefňukej!
	B_GiveInvItems(self,other,ItMi_Gold,500);
	AI_StopProcessInfos(self);
};

func void dia_addon_inextremo_announcer_killworkfinaldone_refuse()
{
	AI_Output(other,self,"DIA_pir_1398_KillWorkFinalDone_Refuse_01_00");	//Okamžitě mi zaplať víc, nebo tě zabiju!
	AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_Refuse_01_01");	//COŽE? Ty mi vyhrožuješ?! Co to jsi za člověka!
	AI_Output(self,other,"DIA_pir_1398_KillWorkFinalDone_Refuse_01_02");	//Musím tě naučit dobrým mravům! Ty chamtivý bastarde!
	TROUBLEWITHASMAL = TRUE;
	AI_StopProcessInfos(self);
	b_changeguild(pir_1398_addon_inextremo_announcer,GIL_OUT);
	B_Attack(self,other,AR_GuardStopsIntruder,0);
};


instance DIA_ADDON_INEXTREMO_ANNOUNCER_KILLAFTERDO(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_killafterdo_condition;
	information = dia_addon_inextremo_announcer_killafterdo_info;
	permanent = FALSE;
	description = "Co teď budeš dělat?";
};


func int dia_addon_inextremo_announcer_killafterdo_condition()
{
	if(MIS_KILLTARGETFINAL == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_killafterdo_info()
{
	self.name[0] = "Asmal";
	AI_Output(other,self,"DIA_pir_1398_KillAfterDo_01_00");	//Co teď budeš dělat?
	AI_Output(self,other,"DIA_pir_1398_KillAfterDo_01_01");	//Myslím, že už zůstanu tady.
	AI_Output(self,other,"DIA_pir_1398_KillAfterDo_01_03");	//U toho tučného prasete Onara a jeho žoldáků se cítím bezpečně.
	AI_Output(other,self,"DIA_pir_1398_KillAfterDo_01_07");	//Chápu.
	KILLFINISH = TRUE;
};

instance DIA_ADDON_INEXTREMO_ANNOUNCER_KILLCANBEMASTER(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_killcanbemaster_condition;
	information = dia_addon_inextremo_announcer_killcanbemaster_info;
	permanent = FALSE;
	description = "Jak můžu získat stejnou zbroj, jako máš ty?";
};


func int dia_addon_inextremo_announcer_killcanbemaster_condition()
{
	if(Npc_KnowsInfo(hero,dia_addon_inextremo_announcer_killreward))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_killcanbemaster_info()
{
	self.name[0] = "Asmal";
	AI_Output(other,self,"DIA_pir_1398_KillCanBeMaster_01_00");	//Jak můžu získat stejnou zbroj, jako máš ty?
	AI_Output(self,other,"DIA_pir_1398_KillCanBeMaster_01_01");	//Obávám se, že nijak! (směje se)
	AI_Output(self,other,"DIA_pir_1398_KillCanBeMaster_01_03");	//Tohle je zbroj vůdce cechu vrahů a může ji nosit jen ten, kdo něco znamená.
	AI_Output(self,other,"DIA_pir_1398_KillCanBeMaster_01_04");	//Slouží zároveň jako důkaz, že jsem v cechu nejvýše postavený muž.
	AI_Output(other,self,"DIA_pir_1398_KillCanBeMaster_01_07");	//A jak se mám stát nejvýše postaveným v cechu vrahů?
	AI_Output(self,other,"DIA_pir_1398_KillCanBeMaster_01_08");	//Hmm... (přemýšlí) Naznačuješ, že chceš vést cech vrahů?
	AI_Output(self,other,"DIA_pir_1398_KillCanBeMaster_01_10");	//Ty vážně riskuješ! Tuhle otázku mi už dlouho nikdo nepoložil. Hodně lidí jsem od toho také odradil.
	AI_Output(self,other,"DIA_pir_1398_KillCanBeMaster_01_11");	//Ale ty jsi tu nový, takže mi dovol, abych ti to vysvětlil.
	AI_Output(self,other,"DIA_pir_1398_KillCanBeMaster_01_12");	//Cech má pouze jednoho vůdce - a to jsem já!
	AI_Output(self,other,"DIA_pir_1398_KillCanBeMaster_01_13");	//Pokud se chceš stát vůdcem, musíš počkat, až rezignuji. Nebo...
	AI_Output(self,other,"DIA_pir_1398_KillCanBeMaster_01_14");	//... nebo mě můžeš vyzvat! (směje se)
	AI_Output(self,other,"DIA_pir_1398_KillCanBeMaster_01_15");	//Abych byl upřímný, zajímalo by mě, jestli to uděláš.
	AI_Output(self,other,"DIA_pir_1398_KillCanBeMaster_01_16");	//Proti mně nemáš žádnou šanci! (směje se)
	AI_Output(other,self,"DIA_pir_1398_KillCanBeMaster_01_17");	//Myslíš?
	AI_Output(self,other,"DIA_pir_1398_KillCanBeMaster_01_18");	//Jsem si tím jistý! Nebo si myslíš, že budeš první, kdo to kdy zkusil?
	AI_Output(self,other,"DIA_pir_1398_KillCanBeMaster_01_19");	//Ti, co to zkoušeli, byli sice odvážní jako ty, ale stejně skončili jako krmivo pro krysy.
	AI_Output(self,other,"DIA_pir_1398_KillCanBeMaster_01_21");	//Takže na tvém místě se té myšlenky zbavím co nejdřív - bude to pro tebe tak lepší.
	AI_Output(other,self,"DIA_pir_1398_KillCanBeMaster_01_23");	//Popřemýšlím o tom.
	AI_Output(self,other,"DIA_pir_1398_KillCanBeMaster_01_24");	//Správně - pořádně si to promysli, než začneš jednat!
	B_LogEntry(TOPIC_KILLWAY,"Asmal řekl, že pokud chci získat zbroj, jako má on, musím se stát vůdcem cechu. Nynějším vůdcem je Asmal a jediný způsob, jak ho sesadit, je zvítězit nad ním v boji. Podle mého názoru je dobrý bojovník a nebude jen tak snadné ho porazit.");
};

instance DIA_ADDON_INEXTREMO_ANNOUNCER_KILLBEOUT(C_Info)
{
	npc = pir_1398_addon_inextremo_announcer;
	nr = 1;
	condition = dia_addon_inextremo_announcer_killbeout_condition;
	information = dia_addon_inextremo_announcer_killbeout_info;
	permanent = FALSE;
	description = "Chci tě vyzvat.";
};

func int dia_addon_inextremo_announcer_killbeout_condition()
{
	if(Npc_KnowsInfo(hero,dia_addon_inextremo_announcer_killcanbemaster))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_announcer_killbeout_info()
{
	self.name[0] = "Asmal";
	AI_Output(other,self,"DIA_pir_1398_KillBeOut_01_00");	//Chci tě vyzvat.
	AI_Output(self,other,"DIA_pir_1398_KillBeOut_01_01");	//Takže ses rozhodl. (směje se)
	AI_Output(self,other,"DIA_pir_1398_KillBeOut_01_02");	//Odvážný krok, ale podle mého názoru velmi hloupý.
	AI_Output(other,self,"DIA_pir_1398_KillBeOut_01_03");	//To už vyřeší náš boj.
	AI_Output(other,self,"DIA_pir_1398_KillBeOut_01_04");	//Tak či tak, pokud je to jediná možnost, jak se stát vůdcem cechu, můžeš si být jistý, že tak udělám!
	AI_Output(self,other,"DIA_pir_1398_KillBeOut_01_05");	//Ubohý červe! (smích) Tak to se podíváme!
	AI_Output(self,other,"DIA_pir_1398_KillBeOut_01_06");	//Skončím to s tebou rychle.
	CANBEKILLMASTER = TRUE;
	B_LogEntry(TOPIC_KILLWAY,"Vyzval jsem Asmala. Teď už jen souboj rozhodne, kdo z nás je hoden být vůdcem cechu.");
	AI_StopProcessInfos(self);
	b_changeguild(pir_1398_addon_inextremo_announcer,GIL_NONE);
	B_Attack(self,other,AR_GuardStopsIntruder,0);
};
