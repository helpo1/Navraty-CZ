/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.01:

(3x) MIS_ORcGREATWAR - MIS_ORCGREATWAR (cyrilice -> latinka)

*/



instance DIA_Kurgan_EXIT(C_Info)
{
	npc = DJG_708_Kurgan;
	nr = 999;
	condition = DIA_Kurgan_EXIT_Condition;
	information = DIA_Kurgan_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Kurgan_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Kurgan_EXIT_Info()
{
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(Biff,400);
};


instance DIA_Kurgan_HELLO(C_Info)
{
	npc = DJG_708_Kurgan;
	condition = DIA_Kurgan_HELLO_Condition;
	information = DIA_Kurgan_HELLO_Info;
	important = TRUE;
};


func int DIA_Kurgan_HELLO_Condition()
{
	if(KAPITELORCATC == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Kurgan_HELLO_Info()
{
	AI_Output(self,other,"DIA_Kurgan_HELLO_01_00");	//Hej, ty! Chlápci jako ty by si měli dávat pozor, kam šlapou!
	AI_Output(other,self,"DIA_Kurgan_HELLO_15_01");	//Co se mi to pokoušíš říct?
	AI_Output(self,other,"DIA_Kurgan_HELLO_01_02");	//Chtěl jsem tím říct, že zdejší ovzduší není prospěšné tvému zdraví. Tahle oblast je teď prolezlá skřety a dalšíma zrůdama.
	AI_Output(self,other,"DIA_Kurgan_HELLO_01_03");	//A to nepočítám draky. Ber to jen jako dobře míněnou radu.
	B_LogEntry(TOPIC_Dragonhunter,"U vchodu do Hornického údolí mě přivítala skupina drakobijců. Byli těžce ozbrojení, ale obávám se, že na draky tím moc velký dojem neudělají.");
};


instance DIA_Kurgan_ELSE(C_Info)
{
	npc = DJG_708_Kurgan;
	condition = DIA_Kurgan_ELSE_Condition;
	information = DIA_Kurgan_ELSE_Info;
	description = "Můžeš mi říct něco, co už bych dávno nevěděl?";
};


func int DIA_Kurgan_ELSE_Condition()
{
	if(KAPITELORCATC == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Kurgan_ELSE_Info()
{
	AI_Output(other,self,"DIA_Kurgan_ELSE_15_00");	//Můžeš mi říct něco, co už bych dávno nevěděl?
	AI_Output(self,other,"DIA_Kurgan_ELSE_01_01");	//Můžu ti dát dobrou radu, a to dokonce zdarma.
	AI_Output(self,other,"DIA_Kurgan_ELSE_01_02");	//Nemůžem tu potřebovat nikoho, kdo se složí ze slaboučkýho dračího prdnutí.
	AI_Output(self,other,"DIA_Kurgan_ELSE_01_03");	//Jdi domů, tohle je práce pro opravdový chlapy.
};


instance DIA_Kurgan_Leader(C_Info)
{
	npc = DJG_708_Kurgan;
	condition = DIA_Kurgan_Leader_Condition;
	information = DIA_Kurgan_Leader_Info;
	description = "Ty jsi tady šéf?";
};


func int DIA_Kurgan_Leader_Condition()
{
	if(KAPITELORCATC == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Kurgan_Leader_Info()
{
	AI_Output(other,self,"DIA_Kurgan_Leader_15_00");	//Ty jsi tady šéf?
	AI_Output(self,other,"DIA_Kurgan_Leader_01_01");	//Vypadám tak? Jasně, že ne. Nepotřebujeme žádnýho nafoukanýho blba, co by nám něco rozkazoval.
	AI_Output(self,other,"DIA_Kurgan_Leader_01_02");	//Když se Sylvio snažil chovat jako náš šéf, ukázali jsme mu i těm jeho kámošům, co si o tom myslíme.
	AI_Output(self,other,"DIA_Kurgan_Leader_01_03");	//Pohádali jsme se. Nakonec sami odešli.
	AI_Output(self,other,"DIA_Kurgan_Leader_01_04");	//Doufám, že Sylvio skončil v kotli s polívkou nějakýho skřeta.
};


instance DIA_Kurgan_KillDragon(C_Info)
{
	npc = DJG_708_Kurgan;
	condition = DIA_Kurgan_KillDragon_Condition;
	information = DIA_Kurgan_KillDragon_Info;
	description = "Tak ty chceš zabít draky?";
};


func int DIA_Kurgan_KillDragon_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Kurgan_Leader) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};


var int Kurgan_KillDragon_Day;

func void DIA_Kurgan_KillDragon_Info()
{
	AI_Output(other,self,"DIA_Kurgan_KillDragon_15_00");	//(posměšně) Tak ty chceš zabít draky?
	AI_Output(self,other,"DIA_Kurgan_KillDragon_01_01");	//Bláznivej osle. Tak ty víš, jak složit draka?
	AI_Output(self,other,"DIA_Kurgan_KillDragon_01_02");	//To si myslíš, že ta bestie si prostě bude jen tak klidně sedět ve svym doupěti a čekat, až jí usekneš hlavu?
	AI_Output(self,other,"DIA_Kurgan_KillDragon_01_03");	//Něco takovýho vyžaduje dobrej plán a ráznou akci.
	AI_Output(other,self,"DIA_Kurgan_KillDragon_15_04");	//Já vím. A jak se s tím hodláte vypořádat vy?
	AI_Output(self,other,"DIA_Kurgan_KillDragon_01_05");	//Nejdřív musíme zjistit, kde tu bestii najdeme.
	AI_Output(self,other,"DIA_Kurgan_KillDragon_01_06");	//Teprve pak si můžeme promyslet, jak tu potvoru zabít.
	Kurgan_KillDragon_Day = Wld_GetDay();
	Info_AddChoice(DIA_Kurgan_KillDragon,"Už budu muset jít.",DIA_Kurgan_KillDragon_weg);
	Info_AddChoice(DIA_Kurgan_KillDragon,"Jak se chcete dostat přes skřety?",DIA_Kurgan_KillDragon_orks);
	Info_AddChoice(DIA_Kurgan_KillDragon,"Mám dojem, že nenajdeš ani slepou ovci.",DIA_Kurgan_KillDragon_spott);
};

func void DIA_Kurgan_KillDragon_spott()
{
	AI_Output(other,self,"DIA_Kurgan_KillDragon_spott_15_00");	//Mám dojem, že nenajdeš ani slepou ovci.
	AI_Output(self,other,"DIA_Kurgan_KillDragon_spott_01_01");	//Co? To chceš, abych ti nějakou vrazil?
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Kurgan_KillDragon_orks()
{
	AI_Output(other,self,"DIA_Kurgan_KillDragon_orks_15_00");	//Jak se chcete dostat přes skřety?
	AI_Output(self,other,"DIA_Kurgan_KillDragon_orks_01_01");	//Na tyhle věci je ještě dost času.
};

func void DIA_Kurgan_KillDragon_weg()
{
	AI_Output(other,self,"DIA_Kurgan_KillDragon_weg_15_00");	//To bych chtěl vidět, ale musím se starat o své věci.
	AI_Output(self,other,"DIA_Kurgan_KillDragon_weg_01_01");	//Měl by ses odsud rychle vytratit. Jinak se ti může stát, že přijdeš o hnátu, možná o dvě.
	AI_StopProcessInfos(self);
};


instance DIA_Kurgan_SEENDRAGON(C_Info)
{
	npc = DJG_708_Kurgan;
	condition = DIA_Kurgan_SEENDRAGON_Condition;
	information = DIA_Kurgan_SEENDRAGON_Info;
	permanent = TRUE;
	description = "Už jsi někdy toho draka viděl?";
};


func int DIA_Kurgan_SEENDRAGON_Condition()
{
	if((Kurgan_KillDragon_Day <= (Wld_GetDay() - 2)) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Kurgan_SEENDRAGON_Info()
{
	AI_Output(other,self,"DIA_Kurgan_SEENDRAGON_15_00");	//Už jsi někdy toho draka viděl?
	AI_Output(self,other,"DIA_Kurgan_SEENDRAGON_01_01");	//Zatím ne. Ale ta bestie se nemůže schovávat věčně.
};


instance DIA_Kurgan_AllDragonsDead(C_Info)
{
	npc = DJG_708_Kurgan;
	nr = 5;
	condition = DIA_Kurgan_AllDragonsDead_Condition;
	information = DIA_Kurgan_AllDragonsDead_Info;
	permanent = FALSE;
	description = "Draci jsou mrtví.";
};


func int DIA_Kurgan_AllDragonsDead_Condition()
{
	if((MIS_AllDragonsDead == TRUE) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Kurgan_AllDragonsDead_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Kurgan_AllDragonsDead_15_00");	//Draci jsou mrtví.
	AI_Output(self,other,"DIA_Kurgan_AllDragonsDead_01_01");	//Ha! A kdo je jako měl zabít? Paladinové?
	AI_Output(other,self,"DIA_Kurgan_AllDragonsDead_15_02");	//Já.
	AI_Output(self,other,"DIA_Kurgan_AllDragonsDead_01_03");	//(smích) Ha. Tomu sám nevěříš. Přestaň si ze mě utahovat.
};


instance DIA_Kurgan_PICKPOCKET(C_Info)
{
	npc = DJG_708_Kurgan;
	nr = 900;
	condition = DIA_Kurgan_PICKPOCKET_Condition;
	information = DIA_Kurgan_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Kurgan_PICKPOCKET_Condition()
{
	return C_Beklauen(34,120);
};

func void DIA_Kurgan_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Kurgan_PICKPOCKET);
	Info_AddChoice(DIA_Kurgan_PICKPOCKET,Dialog_Back,DIA_Kurgan_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Kurgan_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Kurgan_PICKPOCKET_DoIt);
};

func void DIA_Kurgan_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Kurgan_PICKPOCKET);
};

func void DIA_Kurgan_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Kurgan_PICKPOCKET);
};


instance DIA_KURGAN_THANKSFORHELP(C_Info)
{
	npc = DJG_708_Kurgan;
	nr = 1;
	condition = dia_kurgan_thanksforhelp_condition;
	information = dia_kurgan_thanksforhelp_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_kurgan_thanksforhelp_condition()
{
	if(MIS_ORCGREATWAR == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_kurgan_thanksforhelp_info()
{
	B_GivePlayerXP(100);
	AI_Output(self,other,"DIA_Kurgan_ThanksForHelp_01_00");	//Díky za pomoc! Stačilo málo a byl by to náš konec!
	MEETKURGANAFTER = TRUE;
};


instance DIA_KURGAN_WHYHERE(C_Info)
{
	npc = DJG_708_Kurgan;
	nr = 1;
	condition = dia_kurgan_whyhere_condition;
	information = dia_kurgan_whyhere_info;
	permanent = FALSE;
	description = "Proč jsi ještě tady?!";
};


func int dia_kurgan_whyhere_condition()
{
	if(MIS_ORCGREATWAR == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_kurgan_whyhere_info()
{
	AI_Output(other,self,"DIA_Kurgan_WhyHere_01_00");	//Proč jsi ještě tady?!
	AI_Output(self,other,"DIA_Kurgan_WhyHere_01_01");	//A kde bychom asi šli? Všude okolo jsou skřeti!
	AI_Output(self,other,"DIA_Kurgan_WhyHere_01_02");	//Narazili bychom přímo do jedné z jejich patrol.
	AI_Output(self,other,"DIA_Kurgan_WhyHere_01_03");	//Není žádná cesta! Pokusili bychom se jít do hradu, ale skřeti ho kompletně oblehli. Nebo tak jsem to alespoň slyšel.
};


instance DIA_KURGAN_HOWAROUND(C_Info)
{
	npc = DJG_708_Kurgan;
	nr = 2;
	condition = dia_kurgan_howaround_condition;
	information = dia_kurgan_howaround_info;
	permanent = TRUE;
	description = "Jaká je situace?";
};


func int dia_kurgan_howaround_condition()
{
	if((MIS_ORCGREATWAR == LOG_Running) && Npc_KnowsInfo(other,dia_kurgan_whyhere) && (DGJJOINPALADIN == FALSE))
	{
		return TRUE;
	};
};

func void dia_kurgan_howaround_info()
{
	AI_Output(other,self,"DIA_Kurgan_HowAround_01_00");	//Jaká je situace?
	AI_Output(self,other,"DIA_Kurgan_HowAround_01_01");	//Vše je v klidu, skřeti se tu zatím neukázali!
};


instance DIA_KURGAN_GOAWAY(C_Info)
{
	npc = DJG_708_Kurgan;
	nr = 1;
	condition = dia_kurgan_goaway_condition;
	information = dia_kurgan_goaway_info;
	permanent = FALSE;
	description = "Měli byste se připojit k paladinům.";
};


func int dia_kurgan_goaway_condition()
{
	if((MEETNATAN == TRUE) && (MIS_KILLDRAGONHUNTER == FALSE) && Npc_KnowsInfo(other,dia_kurgan_whyhere) && (DGJJOINPALADIN == FALSE))
	{
		return TRUE;
	};
};

func void dia_kurgan_goaway_info()
{
	AI_Output(other,self,"DIA_Kurgan_GoAway_01_00");	//Měli byste se připojit k paladinům.
	AI_Output(self,other,"DIA_Kurgan_GoAway_01_01");	//(udiveně) Co tím myslíš?
	AI_Output(other,self,"DIA_Kurgan_GoAway_01_02");	//Ozbrojená skupina je u východu z údolí. Odsud se k nim lehko dostanete.
	AI_Output(self,other,"DIA_Kurgan_GoAway_01_03");	//Opravdu?! (zamyšleně) Pravděpodobně máš pravdu.
	AI_Output(self,other,"DIA_Kurgan_GoAway_01_04");	//Budeme se cítit lépe, když nás bude více než tady.
	AI_Output(self,other,"DIA_Kurgan_GoAway_01_06");	//Dobrá! Díky za novinky.
	DGJMOVEPALADIN = TRUE;
};


instance DIA_KURGAN_DGJJOINPALADIN(C_Info)
{
	npc = DJG_708_Kurgan;
	nr = 1;
	condition = dia_kurgan_dgjjoinpaladin_condition;
	information = dia_kurgan_dgjjoinpaladin_info;
	permanent = FALSE;
	description = "Paladinové potřebují vaši pomoc.";
};


func int dia_kurgan_dgjjoinpaladin_condition()
{
	if((MIS_STURMCASTLE == LOG_Running) && Npc_KnowsInfo(other,dia_kurgan_whyhere))
	{
		return TRUE;
	};
};

func void dia_kurgan_dgjjoinpaladin_info()
{
	AI_Output(other,self,"DIA_Kurgan_DgjJoinPaladin_01_00");	//Paladinové potřebují vaši pomoc
	AI_Output(self,other,"DIA_Kurgan_DgjJoinPaladin_01_01");	//Ano?! A co po nás potřebují?
	AI_Output(other,self,"DIA_Kurgan_DgjJoinPaladin_01_02");	//Chtějí zaútočit na pevnost a sebrat ji skřetům.
	AI_Output(self,other,"DIA_Kurgan_DgjJoinPaladin_01_03");	//(sarkasticky) Vážně? Když je vše ztracené a na dně, Innosovi sloužící udělají nějakou blbost, aby jejich jména vešla v legendu!
	AI_Output(self,other,"DIA_Kurgan_DgjJoinPaladin_01_07");	//Nejsme tak hloupí, abychom riskovali naše životy.
	AI_Output(other,self,"DIA_Kurgan_DgjJoinPaladin_01_10");	//Určitě se můžeme nějak dohodnout, nemyslíš příteli?
	AI_Output(self,other,"DIA_Kurgan_DgjJoinPaladin_01_11");	//A o čem se chceš dohodnout, příteli?
	B_LogEntry(TOPIC_STURMCASTLE,"Drakobijci přirozeně nebyli zrovna potěšeni! Nechtějí pomoci paladinům napadnout pevnost plnou skřetů. Je nezbytné je přesvědčit o opaku!");
	Info_ClearChoices(dia_kurgan_dgjjoinpaladin);
	Info_AddChoice(dia_kurgan_dgjjoinpaladin,"Ukázalo se, že jste jen obyčejní zbabělci!",dia_kurgan_dgjjoinpaladin_coward);
	Info_AddChoice(dia_kurgan_dgjjoinpaladin,"Myslím, že bych měl skřetům říct o vašem táboře.",dia_kurgan_dgjjoinpaladin_orcs);
	Info_AddChoice(dia_kurgan_dgjjoinpaladin,"Co takhle zlato?",dia_kurgan_dgjjoinpaladin_gold);
};

func void dia_kurgan_dgjjoinpaladin_coward()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Kurgan_DgjJoinPaladin_Coward_01_00");	//Ukázalo se, že jste jen obyčejní zbabělci!
	AI_Output(self,other,"DIA_Kurgan_DgjJoinPaladin_Coward_01_01");	//Ha! (arogantně) A ty si myslíš, že tvé mínění nám nějak vadí, nebo co jako?
	AI_Output(self,other,"DIA_Kurgan_DgjJoinPaladin_Coward_01_02");	//Lépe bude, když ti řeknu já tohle - mazej vodsud, než ti něco uděláme!
	AI_Output(self,other,"DIA_Kurgan_DgjJoinPaladin_Coward_01_03");	//Nepomůžeme paladinům a chytrý chlapec jako ty bys to mohl pochopit.
	AI_Output(self,other,"DIA_Kurgan_DgjJoinPaladin_Coward_01_04");	//Naše konverzace právě skončila, padej!
	B_LogEntry(TOPIC_STURMCASTLE,"Bohužel jsem drakobijce nedokázal přesvědčit! Měl bych to jít říct paladinům.");
	AI_StopProcessInfos(self);
	self.aivar[93] = FALSE;
	DGJREFUSEPALADIN = TRUE;
	INNOSPRAYCOUNT = INNOSPRAYCOUNT + 1;
};

func void dia_kurgan_dgjjoinpaladin_orcs()
{
	AI_Output(other,self,"DIA_Kurgan_DgjJoinPaladin_Orcs_01_00");	//Myslím, že bych měl skřetům říct o vašem táboře.
	AI_Output(self,other,"DIA_Kurgan_DgjJoinPaladin_Orcs_01_01");	//Cože?!... (Vyděšeně) Ale to přece neuděláš!
	AI_Output(other,self,"DIA_Kurgan_DgjJoinPaladin_Orcs_01_02");	//Věř mi, že to udělám!
	AI_Output(self,other,"DIA_Kurgan_DgjJoinPaladin_Orcs_01_03");	//Tak jo, zmetku! A potom si myslíš, že bych chtěl pomoci někomu jako jsi ty?!
	AI_Output(self,other,"DIA_Kurgan_DgjJoinPaladin_Orcs_01_05");	//Arrgh, zatraceně!... Dobrá, pomůžeme paladinům!
	AI_Output(self,other,"DIA_Kurgan_DgjJoinPaladin_Orcs_01_07");	//Jednoho dne se znovu setkáme, mizero! Dej na má slova.
	B_LogEntry(TOPIC_STURMCASTLE,"Přesvědčil jsem ty zbabělce, aby bojovali na naší straně! Nicméně teď už je to jedno, ale Kurgan je na mě pěkně naštvanej.");
	DGJJOINPALADIN = TRUE;
	DGJREVENGEME = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_kurgan_dgjjoinpaladin_gold()
{
	AI_Output(other,self,"DIA_Kurgan_DgjJoinPaladin_Gold_01_00");	//Co takhle zlato?
	AI_Output(self,other,"DIA_Kurgan_DgjJoinPaladin_Gold_01_01");	//Zlato?! (zamyšleně) To by nás opravdu mohlo zajímat.
	AI_Output(self,other,"DIA_Kurgan_DgjJoinPaladin_Gold_01_02");	//Ale muselo by to být tolik zlata, aby to vyvážilo útok na pevnost plnou skřetů!
	AI_Output(self,other,"DIA_Kurgan_DgjJoinPaladin_Gold_01_06");	//Myslím si, že tak... Mno... Padesát tisíc zlatých by nás mohlo přesvědčit.
	Info_ClearChoices(dia_kurgan_dgjjoinpaladin);
	Info_AddChoice(dia_kurgan_dgjjoinpaladin,"Nemám takové množství zlata.",dia_kurgan_dgjjoinpaladin_nogold);
	if(Npc_HasItems(other,ItMi_Gold) >= 50000)
	{
		Info_AddChoice(dia_kurgan_dgjjoinpaladin,"Dobrá, máme dohodu!",dia_kurgan_dgjjoinpaladin_ok);
	};
};

func void dia_kurgan_dgjjoinpaladin_nogold()
{
	AI_Output(other,self,"DIA_Kurgan_DgjJoinPaladin_NoGold_01_00");	//Nemám takové množství zlata.
	AI_Output(self,other,"DIA_Kurgan_DgjJoinPaladin_NoGold_01_01");	//(nespokojeně) Potom ho sežeň.
	B_LogEntry(TOPIC_STURMCASTLE,"Drakobijci se připojí k paladinům, pokud jim ale dám padesát tisíc ve zlatě!");
	DJGAWAITSGOLD = TRUE;
	Info_ClearChoices(dia_kurgan_dgjjoinpaladin);
};

func void dia_kurgan_dgjjoinpaladin_ok()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Kurgan_DgjJoinPaladin_Ok_01_00");	//Tady je tvoje zlato.
	B_GiveInvItems(other,self,ItMi_Gold,50000);
	AI_Output(self,other,"DIA_Kurgan_DgjJoinPaladin_Ok_01_01");	//(spokojeně) Dobrá, kámo. Pomůžeme paladinům!
	B_LogEntry(TOPIC_STURMCASTLE,"Zaplatil jsem drakobijcům smluvenou částku padesáti tisíc zlatých. Souhlasili s připojením k paladinům při útoku na pevnost.");
	self.aivar[93] = FALSE;
	DGJJOINPALADIN = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_KURGAN_DGJJOINPALADINGOLD(C_Info)
{
	npc = DJG_708_Kurgan;
	nr = 1;
	condition = dia_kurgan_dgjjoinpaladingold_condition;
	information = dia_kurgan_dgjjoinpaladingold_info;
	permanent = TRUE;
	description = "Sehnal jsem to zlato.";
};


func int dia_kurgan_dgjjoinpaladingold_condition()
{
	if((MIS_STURMCASTLE == LOG_Running) && (DJGAWAITSGOLD == TRUE) && (DGJJOINPALADIN == FALSE) && (Npc_HasItems(other,ItMi_Gold) >= 50000))
	{
		return TRUE;
	};
};

func void dia_kurgan_dgjjoinpaladingold_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Kurgan_DgjJoinPaladinGold_01_00");	//Sehnal jsem to zlato.
	AI_Output(self,other,"DIA_Kurgan_DgjJoinPaladinGold_01_01");	//Opravdu? Ukaž!
	AI_Output(other,self,"DIA_Kurgan_DgjJoinPaladinGold_01_02");	//Tady je.
	B_GiveInvItems(other,self,ItMi_Gold,50000);
	AI_Output(self,other,"DIA_Kurgan_DgjJoinPaladinGold_01_03");	//(spokojeně) Dobrá, kámo. Pomůžeme paladinům!
	B_LogEntry(TOPIC_STURMCASTLE,"Předal jsem zlato žoldákům, nyní pomůžou paladinům!");
	self.aivar[93] = FALSE;
	DGJJOINPALADIN = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_KURGAN_FUCKOFF(C_Info)
{
	npc = DJG_708_Kurgan;
	nr = 2;
	condition = dia_kurgan_fuckoff_condition;
	information = dia_kurgan_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_kurgan_fuckoff_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (DGJREFUSEPALADIN == TRUE))
	{
		return TRUE;
	};
};

func void dia_kurgan_fuckoff_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
};

