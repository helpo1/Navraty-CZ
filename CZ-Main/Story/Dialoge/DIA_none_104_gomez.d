
instance DIA_GOMEZ_EXIT(C_Info)
{
	npc = none_104_gomez;
	nr = 999;
	condition = dia_gomez_exit_condition;
	information = dia_gomez_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_gomez_exit_condition()
{
	return TRUE;
};

func void dia_gomez_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GOMEZ_HELLO(C_Info)
{
	npc = none_104_gomez;
	nr = 1;
	condition = dia_gomez_hello_condition;
	information = dia_gomez_hello_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_gomez_hello_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_gomez_hello_info()
{
	AI_Output(self,other,"DIA_Gomez_Hello_01_00");	//Naše cesty se tady znovu setkávají, hrdino. Koho by to jen napadlo.
	AI_Output(self,other,"DIA_Gomez_Hello_01_01");	//Díky za to, žes mě osvobodil od toho prohnilého těla, ve kterém se musela trápit má duše.
	AI_Output(other,self,"DIA_Gomez_Hello_01_02");	//Gomezi?! Ale vždyť tys...
	AI_Output(self,other,"DIA_Gomez_Hello_01_03");	//Mrtvý? To jsi asi chtěl říct, ne?
	AI_Output(self,other,"DIA_Gomez_Hello_01_04");	//Zvednu ti náladu. Nejsi daleko od pravdy - opravdu jsem mrtvý.
	AI_Output(other,self,"DIA_Gomez_Hello_01_05");	//Zasloužíš si to, ty parchante!
	AI_Output(self,other,"DIA_Gomez_Hello_01_06");	//Máš pravdu, svého času jsem udělal opravdu strašné věci.
	AI_Output(other,self,"DIA_Gomez_Hello_01_07");	//Strašné?! Velmi mírně řečeno!
	AI_Output(other,self,"DIA_Gomez_Hello_01_08");	//Například jen ten masakr nevinných mágů Ohně!
	AI_Output(self,other,"DIA_Gomez_Hello_01_09");	//Můžeš si být jistý, že za všechnu tuhle krev mě bohové nechali zaplatit velmi vysokou cenu.
	AI_Output(self,other,"DIA_Gomez_Hello_01_10");	//Mám teď celou věčnost na to, abych přemýšlel a kál se za všechny své skutky...
};


instance DIA_GOMEZ_HAST(C_Info)
{
	npc = none_104_gomez;
	nr = 1;
	condition = dia_gomez_hast_condition;
	information = dia_gomez_hast_info;
	permanent = FALSE;
	description = "Takže jsi prokletý?";
};


func int dia_gomez_hast_condition()
{
	if(Npc_KnowsInfo(hero,dia_gomez_hello))
	{
		return TRUE;
	};
};

func void dia_gomez_hast_info()
{
	AI_Output(other,self,"DIA_Gomez_Hast_01_00");	//Takže jsi prokletý?
	AI_Output(self,other,"DIA_Gomez_Hast_01_03");	//Ano - a když zemřeš, konečně pochopíš, jaká je cena za všechnu tu moc a zlato.
	AI_Output(self,other,"DIA_Gomez_Hast_01_05");	//Byl jsem si jistý, že mohu udělat COKOLI. A taky to tak bylo!
	AI_Output(self,other,"DIA_Gomez_Hast_01_06");	//Ve svých rukách jsem měl takovou moc, že mi jí záviděl i sám král.
	AI_Output(self,other,"DIA_Gomez_Hast_01_07");	//Ale teprve teď jsem pochopil, že to nejcennější, co máme - je naše duše.
	AI_Output(self,other,"DIA_Gomez_Hast_01_08");	//Duše, která už teď nedojde klidu.
};


var int gomezpermonetime;

instance DIA_GOMEZ_CANDO(C_Info)
{
	npc = none_104_gomez;
	nr = 5;
	condition = dia_gomez_cando_condition;
	information = dia_gomez_cando_info;
	permanent = TRUE;
	description = "Co budeš dělat?";
};


func int dia_gomez_cando_condition()
{
	if(Npc_KnowsInfo(hero,dia_gomez_hast) && (MIS_RESCUEGOMEZ != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_gomez_cando_info()
{
	AI_Output(other,self,"DIA_Gomez_CanDo_01_00");	//Co budeš dělat?
	AI_Output(self,other,"DIA_Gomez_CanDo_01_01");	//Odsud se nedostanu.
	AI_Output(self,other,"DIA_Gomez_CanDo_01_02");	//To moře krve, kterou jsem prolil, mě poutá k tomuto místu.
	AI_Output(self,other,"DIA_Gomez_CanDo_01_03");	//Nikdy jsem nemyslel, že budu uvězněn na vlastním hradu.
	if(GOMEZPERMONETIME == FALSE)
	{
		AI_Output(other,self,"DIA_Gomez_CanDo_01_04");	//Takže tady budeš zavřený ještě hodně dlouho.
		AI_Output(self,other,"DIA_Gomez_CanDo_01_05");	//Ano, na celou věčnost.
		AI_Output(self,other,"DIA_Gomez_CanDo_01_06");	//Ale pokud bys mi pomohl dokončit mé pokání a tak uklidnit mou hříšnou duši...
		AI_Output(self,other,"DIA_Gomez_CanDo_01_07");	//Pak bych mohl opustit toto místo a dojít dlouho očekávaného odpočinku.
		AI_Output(other,self,"DIA_Gomez_CanDo_01_08");	//S mojí pomocí tedy rozhodně nepočítej!
		GOMEZPERMONETIME = TRUE;
	};
};


instance DIA_GOMEZ_MRAMORSTATUE(C_Info)
{
	npc = none_104_gomez;
	nr = 1;
	condition = dia_gomez_mramorstatue_condition;
	information = dia_gomez_mramorstatue_info;
	permanent = FALSE;
	description = "Nevíš něco o jistých mramorových soškách?";
};


func int dia_gomez_mramorstatue_condition()
{
	if(Npc_KnowsInfo(hero,dia_gomez_hast) && (MIS_RARETHINGS == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_gomez_mramorstatue_info()
{
	AI_Output(other,self,"DIA_Gomez_MramorStatue_01_00");	//Nevíš něco o jistých mramorových soškách?
	AI_Output(self,other,"DIA_Gomez_MramorStatue_01_01");	//O čem to mluvíš?
	AI_Output(other,self,"DIA_Gomez_MramorStatue_01_02");	//O třech soškách Innose vyrobených z černého nordmarského mramoru.
	AI_Output(other,self,"DIA_Gomez_MramorStatue_01_03");	//Jeden z rudobaronů je chtěl po králi Rhobarovi, jako platbu za dodávku rudy.
	AI_Output(other,self,"DIA_Gomez_MramorStatue_01_04");	//Víš, kde jsou?
	AI_Output(self,other,"DIA_Gomez_MramorStatue_01_05");	//Jistěže! Také jsem přece byl rudobaron a vím, kde si mí předchůdci skrývali své poklady...
	AI_Output(self,other,"DIA_Gomez_MramorStatue_01_06");	//Ale na oplátku bys mi mohl prokázat malou službičku.
	AI_Output(self,other,"DIA_Gomez_MramorStatue_01_08");	//Pomoz mi stát se opět svobodným! Uklidni mou duši a svěřím se ti se všem, co vím.
	AI_Output(self,other,"DIA_Gomez_MramorStatue_01_09");	//To utrpení, ta bolest - jsou prostě příšerné!
	AI_Output(self,other,"DIA_Gomez_MramorStatue_01_10");	//A den ode dne se stávají ještě nesnesitelnějšími.
	AI_Output(self,other,"DIA_Gomez_MramorStatue_01_11");	//Obzvláště když je v tomhle údolí přítomno tak veliké zlo.
	AI_Output(other,self,"DIA_Gomez_MramorStatue_01_12");	//Jak o tom víš?! Vždyť jsi nikdy neopustil hrad, ne?
	AI_Output(self,other,"DIA_Gomez_MramorStatue_01_13");	//Cítím ho!
	AI_Output(self,other,"DIA_Gomez_MramorStatue_01_14");	//Vliv tohoto zla proudí po celém kraji, proniká do každé skulinky a do každé duše. A já nejsem výjimkou!
	AI_Output(other,self,"DIA_Gomez_MramorStatue_01_15");	//Hmm... A co když ti nepomůžu?
	AI_Output(self,other,"DIA_Gomez_MramorStatue_01_16");	//Pak nikdy nenajdeš to, co hledáš.
	AI_Output(other,self,"DIA_Gomez_MramorStatue_01_17");	//Vypadá to, že nemám na výběr.
	B_LogEntry(TOPIC_RARETHINGS,"Na hradě Starého tábora jsem potkal starého známého - rudobarona Gomeze. Přesněji jeho prokletou duši přeměněnou do formy ducha. Celkem nečekané setkání... Využil jsem příležitost a zeptal se ho na ty drahocenné sošky, které mají pro Lutera takový význam. Gomez, řekl, že ví, kde tyhle mramorové sošky jsou a ukáže mi to místo, ale pod jedinou podmínkou - budu mu muset pomoci prolomit prokletí, které vězí na jeho duši. Abych se k těm věcičkám dostal, budu asi muset trochu ubrat ze svých zásad a přeci jen Gomezovi pomoct.");
};


instance DIA_GOMEZ_MRAMORSTATUEHELP(C_Info)
{
	npc = none_104_gomez;
	nr = 1;
	condition = dia_gomez_mramorstatuehelp_condition;
	information = dia_gomez_mramorstatuehelp_info;
	permanent = FALSE;
	description = "Dobrá, pomohu ti.";
};


func int dia_gomez_mramorstatuehelp_condition()
{
	if(Npc_KnowsInfo(hero,dia_gomez_mramorstatue) && (MIS_RARETHINGS == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_gomez_mramorstatuehelp_info()
{
	AI_Output(other,self,"DIA_Gomez_MramorStatueHelp_01_00");	//Dobrá, pomohu ti. Co mám udělat?
	AI_Output(self,other,"DIA_Gomez_MramorStatueHelp_01_01");	//Pro začátek musíš navštívit oltáře všech tří velkých bohů a pomodlit se za můj život.
	AI_Output(self,other,"DIA_Gomez_MramorStatueHelp_01_02");	//Tady v údolí bez problémů najdeš oltáře zasvěcené Innosovi a Beliarovi.
	AI_Output(other,self,"DIA_Gomez_MramorStatueHelp_01_03");	//A co modlitba k Adanovi?
	AI_Output(self,other,"DIA_Gomez_MramorStatueHelp_01_04");	//S tím ti určitě pomohou mágové Vody.
	AI_Output(self,other,"DIA_Gomez_MramorStatueHelp_01_05");	//Požehnání jednoho z nich by mělo bohatě stačit.
	AI_Output(self,other,"DIA_Gomez_MramorStatueHelp_01_11");	//Potom bys měl jít do Starého dolu.
	AI_Output(self,other,"DIA_Gomez_MramorStatueHelp_01_12");	//Tam bys měl vyhledat alespoň deset nepokojných duší těch, kteří pro mne kdysi pracovali.
	AI_Output(self,other,"DIA_Gomez_MramorStatueHelp_01_14");	//Postarej se, aby konečně nalezli mír, po kterém tolik touží.
	AI_Output(other,self,"DIA_Gomez_MramorStatueHelp_01_15");	//A to mám udělat jak?
	AI_Output(self,other,"DIA_Gomez_MramorStatueHelp_01_16");	//Prostě je zabij.
	AI_Output(other,self,"DIA_Gomez_MramorStatueHelp_01_17");	//Zabij?! Hmm... Vidím, že se tvoje metody řešení problémů zrovna moc nezměnily.
	AI_Output(self,other,"DIA_Gomez_MramorStatueHelp_01_18");	//Věř mi, že je to jediný způsob, jak zbavit ty duše prokletí, které na ně bylo uvaleno.
	AI_Output(self,other,"DIA_Gomez_MramorStatueHelp_01_20");	//A pamatuj...
	AI_Output(self,other,"DIA_Gomez_MramorStatueHelp_01_21");	//... než duši sprovodíš z tohohle světa, musíš ji pro mne nejdříve požádat o odpuštění.
	AI_Output(self,other,"DIA_Gomez_MramorStatueHelp_01_22");	//A teprve když ho získáš, tas meč!
	AI_Output(self,other,"DIA_Gomez_MramorStatueHelp_01_23");	//Jinak bude všechna tvá snaha jen plýtvání časem.
	AI_Output(other,self,"DIA_Gomez_MramorStatueHelp_01_24");	//Proč potřebuješ jejich odpuštění?
	AI_Output(self,other,"DIA_Gomez_MramorStatueHelp_01_25");	//Protože to já jsem ty lidi proklel! A právě kvůli mé chybě nemohou jejich duše pořád nalézt v tomto světě mír.
	AI_Output(self,other,"DIA_Gomez_MramorStatueHelp_01_27");	//Když jsem zjistil, že Starý důl byl zatopen, příšerně jsem se rozzuřil a běsnil jsem!
	AI_Output(self,other,"DIA_Gomez_MramorStatueHelp_01_28");	//V tu chvíli jsem měl pocit, že všichni kolem mne jsou zrádci.
	AI_Output(self,other,"DIA_Gomez_MramorStatueHelp_01_29");	//V zoufalých pokusech nějak zachránit situaci mě nenapadlo nic lepšího, než proklít všechny, kteří svou nedbalostí nechali důl zatopit.
	AI_Output(self,other,"DIA_Gomez_MramorStatueHelp_01_30");	//Důl, na kterém závisela veškerá má moc i bohatství!
	AI_Output(other,self,"DIA_Gomez_MramorStatueHelp_01_35");	//Jo, zatím to vypadá jednoduše.
	AI_Output(self,other,"DIA_Gomez_MramorStatueHelp_01_36");	//To ještě není všechno.
	AI_Output(self,other,"DIA_Gomez_MramorStatueHelp_01_37");	//Až se vrátíš ze Starého dolu, musíš se znovu vrátit tady na hrad.
	AI_Output(self,other,"DIA_Gomez_MramorStatueHelp_01_39");	//Jak víš, mým nejvážnějším zločinem byla vražda Corrista a mágů Ohně.
	AI_Output(self,other,"DIA_Gomez_MramorStatueHelp_01_40");	//Proto bude nutné provést rituál, při kterém přivoláš zpět duše mrtvých mágů.
	AI_Output(self,other,"DIA_Gomez_MramorStatueHelp_01_43");	//Ve vrchním patře bývalé svatyně mágů Ohně se dochoval magický pentagram.
	AI_Output(self,other,"DIA_Gomez_MramorStatueHelp_01_44");	//Použij ho! Stoupni si doprostřed magického kruhu a řekni tato slova - FAR AKTUS BEK NOR KAR!
	AI_Output(self,other,"DIA_Gomez_MramorStatueHelp_01_46");	//Tato slova - část prastarého magického zaříkadla - ti pomůžou přivolat duše zemřelých zpátky do tohohle světa...
	AI_Output(self,other,"DIA_Gomez_MramorStatueHelp_01_47");	//... ale, samozřejmě, jak rozumíš - jen na určitý čas.
	AI_Output(self,other,"DIA_Gomez_MramorStatueHelp_01_49");	//Abys tyhle slova nezapomněl, dám ti svitek, na kterém jsou napsána.
	B_GiveInvItems(self,other,itwr_gomezmagicwords,1);
	AI_Output(other,self,"DIA_Gomez_MramorStatueHelp_01_55");	//A co mám dělat pak?
	AI_Output(self,other,"DIA_Gomez_MramorStatueHelp_01_56");	//Promluv s nimi a zařiď, aby mi každý z nich dal své odpuštění. To bude stačit!
	AI_Output(self,other,"DIA_Gomez_MramorStatueHelp_01_58");	//To je všechno. Tak neplýtvej časem a vyraz na cestu.
	AI_Output(self,other,"DIA_Gomez_MramorStatueHelp_01_59");	//Já tu na tebe počkám a budu doufat, že přineseš dobré zprávy.
	MIS_RESCUEGOMEZ = LOG_Running;
	RESCUEGOMEZSTEPONE = TRUE;
	Log_CreateTopic(TOPIC_RESCUEGOMEZ,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RESCUEGOMEZ,LOG_Running);
	B_LogEntry(TOPIC_RESCUEGOMEZ,"Ke zlomení Gomezovy kletby musím udělat tři věci.");
	Log_AddEntry(TOPIC_RESCUEGOMEZ,"Nejprve je nutné pomodlit se za duši rudobarona u všech tří bohů - Innose, Beliara a Adana. K prvním dvěma bohům se mohu pomodlit u jejich oltářů, které snadno najdu i tady v Hornickém údolí. S požehnáním Adana mi mohou pomoci mágové Vody. Jenže, když si vzpomínám na Gomezovu hrůzovládu, kterou za svého života šířil, většina z nich by zřejmě odmítla. Budu muset najít mága, který Gomeze za jeho života neznal.");
	Log_AddEntry(TOPIC_RESCUEGOMEZ,"Až získám souhlas všech tří bohů, musím jít do Starého dolu. Tam bych měl najít alespoň deset duší těch, kteří kdysi pro Gomeze pracovali, a přinést jim žádaný odpočinek - nebo, jinak řečeno, je prostě všechny zabít. Je ale nutné, aby před smrtí tyhle duše ještě daly Gomezovi své odpuštění - což je mimořádně důležitá část mého úkolu.");
	Log_AddEntry(TOPIC_RESCUEGOMEZ,"Nakonec musím uskutečnit rituál, který přivolá duše mágů Ohně zavražděných na Gomezův příkaz ve Starém táboře. Pro tento krok mi dal svitek se slovy starodávného zaklínadla. Rituál musí být proveden ve staré svatyni mágů na hradě, ve vrchním patře na magickém pentagramu. Duše mágů musí také odpustit Gomezovi jeho zlé skutky.");
	Log_AddEntry(TOPIC_RESCUEGOMEZ,"Až splním všechny tyto tři podmínky, musím se vrátit ke Gomezovi.");
};


instance DIA_GOMEZ_ISFREE(C_Info)
{
	npc = none_104_gomez;
	nr = 1;
	condition = dia_gomez_isfree_condition;
	information = dia_gomez_isfree_info;
	permanent = FALSE;
	description = "Jsi volný.";
};


func int dia_gomez_isfree_condition()
{
	if((MIS_RARETHINGS == LOG_Running) && (GOMEZISFREE == TRUE) && (MIS_RESCUEGOMEZ == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_gomez_isfree_info()
{
	B_GivePlayerXP(400);
	GOMEZISFREENOW = TRUE;
	MIS_RESCUEGOMEZ = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_RESCUEGOMEZ,LOG_SUCCESS);
	Log_AddEntry(TOPIC_RESCUEGOMEZ,"Gomezova duše již opustila tento svět.");
	AI_Output(other,self,"DIA_Gomez_IsFree_01_00");	//Jsi volný. Tvé duši bylo odpuštěno!
	AI_Output(self,other,"DIA_Gomez_IsFree_01_01");	//Konečně! Cítím to! Mé utrpení, má bolest - všechno to už skončilo...
	AI_Output(self,other,"DIA_Gomez_IsFree_01_02");	//Tohle prokleté místo mě už dále nedrží. Jsem skutečně svobodný!
	AI_Output(other,self,"DIA_Gomez_IsFree_01_04");	//Co ty vzácné sošky z nordmarského mramoru? Slíbil jsi, že mi řekneš, kde je hledat.
	AI_Output(self,other,"DIA_Gomez_IsFree_01_05");	//Věř mi, že je nemusíš ani hledat - jsou za mnou, v truhle.
	AI_Output(self,other,"DIA_Gomez_IsFree_01_06");	//Dám ti klíč, který ji otevře.
	AI_Output(self,other,"DIA_Gomez_IsFree_01_07");	//Tady, vezmi si ho.
	B_GiveInvItems(self,other,itkey_gomeztreasure,1);
	AI_Output(self,other,"DIA_Gomez_IsFree_01_09");	//A teď už přišel můj čas... Sbohem!
	B_LogEntry(TOPIC_RARETHINGS,"Když jsem pomohl Gomezovi zlomit jeho kletbu, dal mi klíč k truhle, která se nachází tady ve staré věži. V ní jsou prý všechny tři nordmarské sošky.");
	Info_ClearChoices(dia_gomez_isfree);
	Info_AddChoice(dia_gomez_isfree,"Sbohem, rudobarone...",dia_gomez_isfree_ok);
};

func void dia_gomez_isfree_ok()
{
	AI_StopProcessInfos(self);
	GomezSoulAway = TRUE;
};
