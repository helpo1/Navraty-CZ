/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.00:

DIA_Nigel_MoneyNew_01_07 - opraveno other/self

*/




instance DIA_NIGEL_EXIT(C_Info)
{
	npc = vlk_6110_nigel;
	nr = 999;
	condition = dia_nigel_exit_condition;
	information = dia_nigel_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_nigel_exit_condition()
{
	return TRUE;
};

func void dia_nigel_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NIGEL_PICKPOCKET(C_Info)
{
	npc = vlk_6110_nigel;
	nr = 900;
	condition = dia_nigel_pickpocket_condition;
	information = dia_nigel_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_nigel_pickpocket_condition()
{
	return C_Beklauen(30,28);
};

func void dia_nigel_pickpocket_info()
{
	Info_ClearChoices(dia_nigel_pickpocket);
	Info_AddChoice(dia_nigel_pickpocket,Dialog_Back,dia_nigel_pickpocket_back);
	Info_AddChoice(dia_nigel_pickpocket,DIALOG_PICKPOCKET,dia_nigel_pickpocket_doit);
};

func void dia_nigel_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_nigel_pickpocket);
};

func void dia_nigel_pickpocket_back()
{
	Info_ClearChoices(dia_nigel_pickpocket);
};


instance DIA_NIGEL_HALLO(C_Info)
{
	npc = vlk_6110_nigel;
	nr = 2;
	condition = dia_nigel_hallo_condition;
	information = dia_nigel_hallo_info;
	permanent = FALSE;
	description = "Říká se, že jednomu obchodníkovi dlužíš spoustu peněz.";
};


func int dia_nigel_hallo_condition()
{
	if((MIS_KILLTARGET4 == LOG_Running) && (Npc_KnowsInfo(hero,dia_nigel_meetfirst) == TRUE))
	{
		return TRUE;
	};
};

func void dia_nigel_hallo_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Nigel_Hallo_01_00");	//Říká se, že jednomu obchodníkovi dlužíš spoustu peněz a neccheš je vracet.
	AI_Output(self,other,"DIA_Nigel_Hallo_01_01");	//A co ti do toho jako je?!...
	AI_Output(other,self,"DIA_Nigel_Hallo_01_02");	//Poslal mě někdo kdo chce své peníze! To mám chápat tak, že mě jednoduše vyhodíš?!
	AI_Output(self,other,"DIA_Nigel_Hallo_01_03");	//A proč si myslíš že bych se měl s tebou bavit? A vůbec, nevím o čem mluvíš.
	AI_Output(other,self,"DIA_Nigel_Hallo_01_04");	//Ty se jmenuješ Nigel, není to tak?!
	AI_Output(self,other,"DIA_Nigel_Hallo_01_05");	//No, to jsem já.
	AI_Output(other,self,"DIA_Nigel_Hallo_01_06");	//To znamená, že jsem se nemýlil - potřebuji tě. Takže ze sebe přestaň dělat nechápajícího idiota!
	AI_Output(other,self,"DIA_Nigel_Hallo_01_07");	//Zaplať nebo se postarám, abys měl co nejvíc potíží můžeš mít.
	AI_Output(self,other,"DIA_Nigel_Hallo_01_08");	//Dobrá! Ale jak bys mě chtěl dostat do těch potíží?!
	AI_Output(other,self,"DIA_Nigel_Hallo_01_09");	//Jednoduše tě můžu podříznout! A vypadá to, že to bys nechtěl.
	AI_Output(self,other,"DIA_Nigel_Hallo_01_12");	//A ty myslíš, že se bojím?! (nervózně)
	AI_Output(other,self,"DIA_Nigel_Hallo_01_15");	//A riskneš to?!
	AI_Output(self,other,"DIA_Nigel_Hallo_01_16");	//...(přemýšlí)
	AI_Output(other,self,"DIA_Nigel_Hallo_01_17");	//Vidím strach ve tvých očích.
	AI_Output(self,other,"DIA_Nigel_Hallo_01_18");	//Ale já ty peníze nemám!... (naříká)
	Info_ClearChoices(dia_nigel_hallo);
	Info_AddChoice(dia_nigel_hallo,"Pak jsem tvá poslední šance, Nigele.",dia_nigel_hallo_nokill);
	Info_AddChoice(dia_nigel_hallo,"Tak mám důvod tě zabít!",dia_nigel_hallo_kill);
};

func void dia_nigel_hallo_kill()
{
	AI_Output(other,self,"DIA_Nigel_Hallo_Kill_01_00");	//Tak mám důvod tě zabít! Prostě jsi mi nedal jinou šanci.
	AI_Output(self,other,"DIA_Nigel_Hallo_Kill_01_01");	//Ty... Takhle jednat nemůžeš!... (panicky)... Jsem nevinen!
	AI_Output(other,self,"DIA_Nigel_Hallo_Kill_01_02");	//To říkej jinejm.
	AI_Output(self,other,"DIA_Nigel_Hallo_Kill_01_03");	//Zrada!... Zrada!... (ubrečeně)
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_ReactToWeapon,0);
};

func void dia_nigel_hallo_nokill()
{
	AI_Output(other,self,"DIA_Nigel_Hallo_NoKill_01_00");	//Pak jsem tvá poslední šance, Nigele.
	AI_Output(other,self,"DIA_Nigel_Hallo_NoKill_01_01");	//Dej mi ty peníze a odejdeš bezbolestně...
	AI_Output(other,self,"DIA_Nigel_Hallo_NoKill_01_03");	//Ale bez prachů neodejdu.
	AI_Output(self,other,"DIA_Nigel_Hallo_Kill_01_03");	//Nemožné!... Nemožné!... (panicky)
	AI_Output(self,other,"DIA_Nigel_Hallo_NoKill_01_08");	//Ale já už je nemám!... (ubrečeně)
	AI_Output(other,self,"DIA_Nigel_Hallo_NoKill_01_09");	//Jak nemáš?!
	AI_Output(self,other,"DIA_Nigel_Hallo_NoKill_01_11");	//Okradli mě! Nemám ty peníze. (ubrečeně)
	AI_Output(other,self,"DIA_Nigel_Hallo_NoKill_01_12");	//Hmm...
	AI_Output(self,other,"DIA_Nigel_Hallo_NoKill_01_13");	//Šel jsem na Onarovu farmu doplnit zásoby, které prodávám ve městě a cestou mě okradli... (nervózně)
	AI_Output(self,other,"DIA_Nigel_Hallo_NoKill_01_14");	//Ale mezi hostincem a městem mě přepadli banditi. Sebrali všechno, včetně toho zlata.
	Info_ClearChoices(dia_nigel_hallo);
	Info_AddChoice(dia_nigel_hallo,"Nevěřím ti.",dia_nigel_hallo_notrust);
	Info_AddChoice(dia_nigel_hallo,"Kde přesně tě okradli?",dia_nigel_hallo_trust);
};

func void dia_nigel_hallo_notrust()
{
	AI_Output(other,self,"DIA_Nigel_Hallo_NoTrust_01_00");	//Nevěřím ti.
	AI_Output(self,other,"DIA_Nigel_Hallo_NoTrust_01_01");	//Ale já říkám jen čistou pravdu!
	AI_Output(other,self,"DIA_Nigel_Hallo_NoTrust_01_02");	//Zajímají mě ty prachy, a ty nemáš.
	AI_Output(other,self,"DIA_Nigel_Hallo_NoTrust_01_03");	//To jsou tvé problémy, ne mé. Prachy nevrátíš? Vrátíš život.	
	AI_Output(self,other,"DIA_Nigel_Hallo_Kill_01_01");	//To nemůžeš!(Panicky) Já... jsem nevinen!
	AI_Output(other,self,"DIA_Nigel_Hallo_Kill_01_02");	//Když to říkáš.	
	AI_Output(self,other,"DIA_Nigel_Hallo_Kill_01_03");	//Zrada!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_ReactToWeapon,0);
};

func void dia_nigel_hallo_trust()
{
	AI_Output(other,self,"DIA_Nigel_Hallo_Trust_01_00");	//Kde přesně tě okradli?
	AI_Output(self,other,"DIA_Nigel_Hallo_Trust_01_01");	//Skoro jsem viděl městské zdi.
	AI_Output(self,other,"DIA_Nigel_Hallo_Trust_01_02");	//Nikdy jsem netušil, že by mě mohli napadnout tam... (nervózně)
	AI_Output(other,self,"DIA_Nigel_Hallo_Trust_01_04");	//Jestli lžeš, vrátím se a začnu se sekáním tvého jazyku.
	AI_Output(self,other,"DIA_Nigel_Hallo_Trust_01_03");	//Je to čistá pravda, přísahám!
	AI_Output(other,self,"DIA_Nigel_Hallo_Trust_01_05");	//Kolik banditů tam bylo?
	AI_Output(self,other,"DIA_Nigel_Hallo_Trust_01_06");	//Minimálně tři, nevím přesně, nevšímal jsem si počtu, byl jsem vystrašen... (stydlivě)
	AI_Output(other,self,"DIA_Nigel_Hallo_Trust_01_07");	//... Jasně, mám rád týpky, co se poserou při náznaku nebezpečí...
	AI_Output(other,self,"DIA_Nigel_Hallo_Trust_01_08");	//Modli se ať ty peníze ještě mají.
	AI_Output(self,other,"DIA_Nigel_Hallo_Trust_01_09");	//Budou! Až ho najdeš, dej je tomu obchodníkovi...
	AI_Output(self,other,"DIA_Nigel_Hallo_Trust_01_10");	//Už se tam nechci vracet.
	AI_Output(other,self,"DIA_Nigel_Hallo_Trust_01_11");	//A co mi za to dáš?
	AI_Output(self,other,"DIA_Nigel_Hallo_Trust_01_12");	//No, vrať se tady a něco vymyslíme.
	AI_Output(self,other,"DIA_Nigel_Hallo_Trust_01_13");	//A nebo...
	AI_Output(self,other,"DIA_Nigel_Hallo_Trust_01_15");	//... Jsem docela úspěšný obchodník.
	B_LogEntry(TOPIC_KILLTARGET4,"Nigel říká, že peníze nemá. Přepadli ho banditi nedaleko města. Měl bych je navštívit a vrátit zlato Asmalovi.");
	Info_ClearChoices(dia_nigel_hallo);
	Info_AddChoice(dia_nigel_hallo,"To mě nezajímá.",dia_nigel_hallo_nodeal);
	Info_AddChoice(dia_nigel_hallo,"A co já s tím, že jsi obchodník?",dia_nigel_hallo_deal);
	GRABTARGET4 = TRUE;
};

func void dia_nigel_hallo_nodeal()
{
	AI_Output(other,self,"DIA_Nigel_Hallo_NoDeal_01_00");	//To mě nezajímá.
	AI_Output(self,other,"DIA_Nigel_Hallo_NoDeal_01_01");	//Ale jestli si to rozmyslíš, víš kde mě najít.
	AI_Output(other,self,"DIA_Nigel_Hallo_NoDeal_01_02");	//To se neboj, najdu si tě, jestli tam ty peníze nebudou.
	AI_Output(self,other,"DIA_Nigel_Hallo_NoDeal_01_03");	//Já nelžu...
	AI_Output(self,other,"DIA_Nigel_Hallo_NoDeal_01_06");	//Doufám, že ne...
	AI_StopProcessInfos(self);
	Wld_InsertNpc(bdt_6121_nigelband_01,"NW_CITY_TO_FOREST_04_08");
	Wld_InsertNpc(bdt_6122_nigelband_02,"NW_CITY_TO_FOREST_04_09");
	Wld_InsertNpc(bdt_6123_nigelband_03,"NW_BDT_NIGEL_03");
};

func void dia_nigel_hallo_deal()
{
	AI_Output(other,self,"DIA_Nigel_Hallo_Deal_01_00");	//A co já s tím, že jsi obchodník?
	AI_Output(self,other,"DIA_Nigel_Hallo_Deal_01_01");	//Mohl bych ti vrátit více zlata.
	AI_Output(self,other,"DIA_Nigel_Hallo_Deal_01_03");	//A jak bohatý!... (oživěle) Jaksi obchoduji s Onarem.
	AI_Output(self,other,"DIA_Nigel_Hallo_Deal_01_04");	//Omezil všechny dodávky potravin a obchodníci jako já jsou jediní, s kým obchoduje.
	AI_Output(self,other,"DIA_Nigel_Hallo_Deal_01_05");	//A dá se na tom vydělat.
	AI_Output(self,other,"DIA_Nigel_Hallo_Deal_01_06");	//Nicméně je to riziko, už jen kvůli těm lupičům!
	AI_Output(other,self,"DIA_Nigel_Hallo_Deal_01_07");	//Hmm... A jaký bude můj podíl?
	AI_Output(self,other,"DIA_Nigel_Hallo_Deal_01_08");	//Myslím, že bych ti mohl dát tisíc zlatých.
	AI_Output(self,other,"DIA_Nigel_Hallo_Deal_01_09");	//To je dost, ne?
	Info_ClearChoices(dia_nigel_hallo);
	Info_AddChoice(dia_nigel_hallo,"Dohodnuto.",dia_nigel_hallo_dealyes);
	Info_AddChoice(dia_nigel_hallo,"Není! Je s tebou konec!",dia_nigel_hallo_dealbad);
};

func void dia_nigel_hallo_dealbad()
{
	AI_Output(other,self,"DIA_Nigel_Hallo_DealBad_01_00");	//Příliš málo! Nebudu ztrácet čas na takové maličkosti.
	AI_Output(self,other,"DIA_Nigel_Hallo_NoDeal_01_01");	//Jak myslíš, je to tvoje věc. Pokud si to ale rozmyslíš, víš kde mě najdeš.
	AI_Output(other,self,"DIA_Nigel_Hallo_NoDeal_01_02");	//To si asi nerozmyslím, ale věř mi, že na tebe nezapomenu, zvlášť pokud zjistím, že jsi mi lhal!
	AI_Output(self,other,"DIA_Nigel_Hallo_NoDeal_01_03");	//(Nervozně) Proč bych lhal?
	AI_Output(self,other,"DIA_Nigel_Hallo_NoDeal_01_06");	//Doufám, že se vrátíte zlato...
	AI_StopProcessInfos(self);
	Wld_InsertNpc(bdt_6121_nigelband_01,"NW_CITY_TO_FOREST_04_08");
	Wld_InsertNpc(bdt_6122_nigelband_02,"NW_CITY_TO_FOREST_04_09");
	Wld_InsertNpc(bdt_6123_nigelband_03,"NW_BDT_NIGEL_03");
};

func void dia_nigel_hallo_dealyes()
{
	AI_Output(other,self,"DIA_Nigel_Hallo_DealYes_01_00");	//Dohodnuto.
	AI_Output(self,other,"DIA_Nigel_Hallo_DealYes_01_01");	//Výborně!... (nadějně)
	AI_Output(self,other,"DIA_Nigel_Hallo_DealYes_01_02");	//Nyní to chce jen dorozumět se s těmi bandity.
	AI_Output(self,other,"DIA_Nigel_Hallo_DealYes_01_03");	//Mají u sebe měšec s těmi penězi.
	AI_Output(self,other,"DIA_Nigel_Hallo_DealYes_01_04");	//Dones mi je a já se postarám o zaplacení dluhu a tvůj podíl, ale rychle!
	AI_Output(other,self,"DIA_Nigel_Hallo_DealYes_01_05");	//Bez problému.
	MIS_NIGELMATTER = LOG_Running;
	Log_CreateTopic(TOPIC_NIGELMATTER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_NIGELMATTER,LOG_Running);
	B_LogEntry(TOPIC_NIGELMATTER,"Nigel mi udělal dobrou nabídku, když mu vrátím peníze. Je si jistý, že je dokáže investovat tak, že zaplatí dluh a ještě mi dá tisíc zlatých. Rozhodl jsem se s ním souhlasit a až najdu ty banidity, donesu jejich měšec Nigelovi.");
	AI_StopProcessInfos(self);
	Wld_InsertNpc(bdt_6121_nigelband_01,"NW_CITY_TO_FOREST_04_08");
	Wld_InsertNpc(bdt_6122_nigelband_02,"NW_CITY_TO_FOREST_04_09");
	Wld_InsertNpc(bdt_6123_nigelband_03,"NW_BDT_NIGEL_03");
};


instance DIA_NIGEL_MONEYBACK(C_Info)
{
	npc = vlk_6110_nigel;
	nr = 2;
	condition = dia_nigel_moneyback_condition;
	information = dia_nigel_moneyback_info;
	permanent = FALSE;
	description = "Tu máš měšec.";
};

func int dia_nigel_moneyback_condition()
{
	if((Npc_HasItems(other,itse_nigelpocket) >= 1) && (MIS_NIGELMATTER == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_nigel_moneyback_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_Nigel_MoneyBack_01_00");	//Tu máš měšec.
	B_GiveInvItems(other,self,itse_nigelpocket,1);
	Npc_RemoveInvItems(self,itse_nigelpocket,Npc_HasItems(self,itse_nigelpocket));
	AI_Output(self,other,"DIA_Nigel_MoneyBack_01_01");	//Jo!... (nadějně) To je on, jak jsi ho dostal?!
	AI_Output(other,self,"DIA_Nigel_MoneyBack_01_02");	//To raději nechtěj vědět.
	AI_Output(self,other,"DIA_Nigel_MoneyBack_01_03");	//No, hlavní je, že je zpět u mě.
	AI_Output(other,self,"DIA_Nigel_MoneyBack_01_04");	//A co naše dohoda?
	AI_Output(self,other,"DIA_Nigel_MoneyBack_01_05");	//Myslíš si, že jsem zapomněl?
	AI_Output(self,other,"DIA_Nigel_MoneyBack_01_07");	//Já držím slovo...
	AI_Output(other,self,"DIA_Nigel_MoneyBack_01_08");	//A kde je tedy mé zlaty?
	AI_Output(self,other,"DIA_Nigel_MoneyBack_01_09");	//Trpělivost, příteli, trpělivost! Nic nejde tak rychle...
	AI_Output(self,other,"DIA_Nigel_MoneyBack_01_10");	//Obchod není tak jednoduchý jak si lidi myslí!
	AI_Output(self,other,"DIA_Nigel_MoneyBack_01_11");	//Myslím, že tak za tři dny se to znovu rozhoupe!
	AI_Output(self,other,"DIA_Nigel_MoneyBack_01_12");	//Pak přijdi vyzvednout podíl pro sebe a toho obchodníka.
	AI_Output(other,self,"DIA_Nigel_MoneyBack_01_15");	//Kde tě za ty tři dny najdu?
	AI_Output(self,other,"DIA_Nigel_MoneyBack_01_16");	//Budu na Onarové farmě.
	AI_Output(self,other,"DIA_Nigel_MoneyBack_01_20");	//Buď vklidu! Dostaneš co si zasloužíš.
	AI_Output(other,self,"DIA_Nigel_MoneyBack_01_21");	//Dobře, uvidíme se za tři dny.
	AI_Output(self,other,"DIA_Nigel_MoneyBack_01_22");	//Za tři dny!
	AI_StopProcessInfos(self);
	B_LogEntry(TOPIC_NIGELMATTER,"Za tři dny mám zajít za Nigelem na Onarovu farmu pro svůj podíl a jeho dluh...");
	NIGELMATTERDAY = Wld_GetDay();
	Npc_ExchangeRoutine(vlk_6110_nigel,"OnarFarm");
};


instance DIA_NIGEL_MONEYNOW(C_Info)
{
	npc = vlk_6110_nigel;
	nr = 2;
	condition = dia_nigel_moneynow_condition;
	information = dia_nigel_moneynow_info;
	permanent = TRUE;
	description = "Co ten můj podíl?";
};


func int dia_nigel_moneynow_condition()
{
	if((MIS_NIGELMATTER == LOG_Running) && Npc_KnowsInfo(hero,dia_nigel_moneyback))
	{
		return TRUE;
	};
};

func void dia_nigel_moneynow_info()
{
	var int daynow;
	daynow = Wld_GetDay();
	AI_Output(other,self,"DIA_Nigel_MoneyNow_01_00");	//Co ten můj podíl?
	if(NIGELMATTERDAY <= (daynow - 3))
	{
		AI_Output(self,other,"DIA_Nigel_MoneyNow_01_01");	//Jak jsme se dohodli.
		AI_Output(self,other,"DIA_Nigel_MoneyNow_01_02");	//To je měšec, jenž jsi mi donesl...
		B_GiveInvItems(self,other,itse_nigelpocket,1);
		AI_Output(self,other,"DIA_Nigel_MoneyNow_01_0A");	//... a k němu ještě těchto tisíc zlatých!
		B_GiveInvItems(self,other,ItMi_Gold,100);
		AI_Output(self,other,"DIA_Nigel_MoneyNow_01_03");	//Jsi spokojen?!
		AI_Output(other,self,"DIA_Nigel_MoneyNow_01_04");	//Ano, jsi opravdu dobrý obchodník!
		AI_Output(self,other,"DIA_Nigel_MoneyNow_01_05");	//To ano...
		AI_Output(self,other,"DIA_Nigel_MoneyNow_01_06");	//... obchod je extrémě výnosný, když víš jak na něj.

		if((MEMBERTRADEGUILD == FALSE) && (MIS_TRADEGUILD != LOG_FAILED) && (NIGELTELLABOUTGUILD == FALSE) && (EROLTELLABOUTGUILD == FALSE))
		{
			AI_Output(self,other,"DIA_Nigel_MoneyNow_01_09");	//Nemyslel jsi někdy na to být obchodníkem?
			AI_Output(other,self,"DIA_Nigel_MoneyNow_01_10");	//To není pro mě.
			AI_Output(self,other,"DIA_Nigel_MoneyNow_01_11");	//Ale jdi, máš talent.
			AI_Output(self,other,"DIA_Nigel_MoneyNow_01_13");	//Chlape, stálo by ti za to to alespoň zkusit.
			AI_Output(other,self,"DIA_Nigel_MoneyNow_01_15");	//A jak s tím mám začít?
			AI_Output(self,other,"DIA_Nigel_MoneyNow_01_16");	//Hmm... Nooo...
			AI_Output(self,other,"DIA_Nigel_MoneyNow_01_19");	//Už jsem napsal dopis pro jednoho mého přítele, který tě zaučí
			AI_Output(self,other,"DIA_Nigel_MoneyNow_01_21");	//Velmi vážený muž, který vede Khoriniský cech obchodníků.
			AI_Output(other,self,"DIA_Nigel_MoneyNow_01_22");	//Cech obchodníků? O tom jsem nikdy neslyšel!
			AI_Output(self,other,"DIA_Nigel_MoneyNow_01_23");	//No, je to tajný spolek.
			AI_Output(other,self,"DIA_Nigel_MoneyNow_01_25");	//A co mu mám teda povědět?!
			AI_Output(self,other,"DIA_Nigel_MoneyNow_01_26");	//Prostě mu dej tento dopis.
			AI_Output(other,self,"DIA_Nigel_MoneyNow_01_28");	//Přijme?!
			AI_Output(self,other,"DIA_Nigel_MoneyNow_01_29");	//A co tě na tom tak překvapuje?...
			AI_Output(self,other,"DIA_Nigel_MoneyNow_01_30");	//Je to nejlepší cesta jak se stát obchodníkem, naučí tě všem základům.
			AI_Output(self,other,"DIA_Nigel_MoneyNow_01_33");	//Ale je to tvé vlastní svobodné rozhodnutí...
			AI_Output(self,other,"DIA_Nigel_MoneyNow_01_34");	//... Jestli však chceš radu, nepromarni tuto šanci!
			B_UseFakeScroll();
			AI_Output(self,other,"DIA_Nigel_MoneyNow_01_35");	//Tady, tento dopis zanes Luterovi.
			B_GiveInvItems(self,other,itwr_nigelletter,1);
			AI_Output(other,self,"DIA_Nigel_MoneyNow_01_36");	//Luterovi?!
			AI_Output(self,other,"DIA_Nigel_MoneyNow_01_37");	//Ano, jemu. Myslím, že víš, kde ho najít!
			AI_Output(self,other,"DIA_Nigel_MoneyNow_01_38");	//Takže ti nezpůsobí žádné potíže jeho hledání.
			AI_Output(other,self,"DIA_Nigel_MoneyNow_01_39");	//Dobrá, tak... Díky!
			AI_Output(self,other,"DIA_Nigel_MoneyNow_01_40");	//Bez problému, spíše bych ti já měl poděkovat za záchranu mého zlata.
			AI_Output(self,other,"DIA_Nigel_MoneyNow_01_41");	//Myslím, že ten dopis ti to vynahradí.
			AI_Output(self,other,"DIA_Nigel_MoneyNow_01_42");	//Je to nejvíc, co bych pro tebe mohl udělat.
			AI_Output(self,other,"DIA_Nigel_MoneyNow_01_46");	//Zatím!
			AI_Output(other,self,"DIA_Nigel_MoneyNow_01_45");	//Zase přijdu.
			NIGELTELLABOUTGUILD = TRUE;
			B_LogEntry(TOPIC_NIGELMATTER,"Nigel nelhal, jeho obchod opravdu vynesl. Navrátil mi měšec s dluhem a ještě mi dal 1000 zlatých navíc!");
			Log_SetTopicStatus(TOPIC_NIGELMATTER,LOG_SUCCESS);
			MIS_NIGELMATTER = LOG_SUCCESS;
			AI_StopProcessInfos(self);
		}
		else
		{
			AI_Output(self,other,"DIA_Nigel_MoneyNow_01_07");	//To věř!
			B_LogEntry(TOPIC_NIGELMATTER,"Nigel nelhal, jeho obchod opravdu vynesl. Navrátil mi měšec s dluhem a ještě mi dal 1000 zlatých navíc!");
			Log_SetTopicStatus(TOPIC_NIGELMATTER,LOG_SUCCESS);
			MIS_NIGELMATTER = LOG_SUCCESS;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Nigel_MoneyNow_01_47");	//Co tím myslíš? Tři dny už uplynuly?!... (překvapeně)
		AI_Output(self,other,"DIA_Nigel_MoneyNow_01_54");	//Takže už mě neruš, ano?!
		AI_StopProcessInfos(self);
	};
};

instance DIA_NIGEL_MONEY_NEW(C_Info)
{
	npc = vlk_6110_nigel;
	nr = 2;
	condition = dia_nigel_money_new_condition;
	information = dia_nigel_money_new_info;
	permanent = FALSE;
	description = "Víš kdo jsem?";
};

func int dia_nigel_money_new_condition()
{
	if((RhetorikSkillValue[1] >= 30) && (MIS_NIGELMATTER == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_nigel_money_new_info()
{
	AI_Output(other,self,"DIA_Nigel_MoneyNew_01_01");	//Víš kdo jsem? Však víš, ten kdo ti zachránil život!
	AI_Output(other,self,"DIA_Nigel_MoneyNew_01_02");	//Myslím že ses mi s těmi 100 zlatými právě vysmál?!
	AI_Output(self,other,"DIA_Nigel_MoneyNew_01_03");	//Ne, tos špatně pochopil...(nervozně) Vážně, jsem ti velice zavázán!
	AI_Output(self,other,"DIA_Nigel_MoneyNew_01_04");	//Pro obchodníka je vždy obtížné se rozloučit se zlaťáky.
	AI_Output(other,self,"DIA_Nigel_MoneyNew_01_05");	//Myslím, že teď nemáš na výběr.
	AI_Output(self,other,"DIA_Nigel_MoneyNew_01_06");	//Ano, samozřejmě... (nervózně) A je to! Doufám, že tohle bude stačit.
	B_GiveInvItems(self,other,ItMi_Gold,500);
	AI_Output(other,self,"DIA_Nigel_MoneyNew_01_07");	//Určitě.
};

instance DIA_NIGEL_MEETFIRST(C_Info)
{
	npc = vlk_6110_nigel;
	nr = 1;
	condition = dia_nigel_meetfirst_condition;
	information = dia_nigel_meetfirst_info;
	permanent = FALSE;
	description = "Zdravím, kdo jsi?";
};

func int dia_nigel_meetfirst_condition()
{
	return TRUE;
};

func void dia_nigel_meetfirst_info()
{
	AI_Output(other,self,"DIA_Nigel_MeetFirst_01_00");	//Zdravím, kdo jsi?
	AI_Output(self,other,"DIA_Nigel_MeetFirst_01_01");	//Mé jméno je Nigel - obchodník.
};


instance DIA_NIGEL_SELLWHAT(C_Info)
{
	npc = vlk_6110_nigel;
	nr = 1;
	condition = dia_nigel_sellwhat_condition;
	information = dia_nigel_sellwhat_info;
	permanent = TRUE;
	description = "Prodáváš něco?";
};


func int dia_nigel_sellwhat_condition()
{
	if((KNOWS_NIGEL == FALSE) && (Npc_KnowsInfo(hero,dia_nigel_meetfirst) || (MASTERTRADEGUILD == TRUE)))
	{
		return TRUE;
	};
};

func void dia_nigel_sellwhat_info()
{
	if((MIS_NIGELMATTER == LOG_SUCCESS) || (MASTERTRADEGUILD == TRUE))
	{
		AI_Output(other,self,"DIA_Nigel_SellWhat_01_00");	//Prodáváš něco?
		AI_Output(self,other,"DIA_Nigel_SellWhat_01_01");	//Ano, nyní všechno co potřebuješ!

		if(KNOWS_NIGEL == FALSE)
		{
			Log_CreateTopic(Topic_OutTrader,LOG_NOTE);
			B_LogEntry(Topic_OutTrader,"Obchodník Nigel se mnou nyní může obchodovat.");
			KNOWS_NIGEL = TRUE;
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Nigel_SellWhat_01_02");	//Prodáváš něco?
		AI_Output(self,other,"DIA_Nigel_SellWhat_01_03");	//Nyní bohužel ne.
		AI_Output(self,other,"DIA_Nigel_SellWhat_01_04");	//Promiň, nemůžu ti pomoci!
	};
};

instance DIA_NIGEL_TRADE(C_Info)
{
	npc = vlk_6110_nigel;
	nr = 800;
	condition = dia_nigel_trade_condition;
	information = dia_nigel_trade_info;
	permanent = TRUE;
	description = "Ukaž mi, co máš na skladě.";
	trade = TRUE;
};

func int dia_nigel_trade_condition()
{
	if((KNOWS_NIGEL == TRUE) && Wld_IsTime(10,0,20,0))
	{
		return TRUE;
	};
};

func void dia_nigel_trade_info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Nigel_TRADE_01_00");	//Ukaž mi, co máš na skladě.
	AI_Output(self,other,"DIA_Nigel_TRADE_01_01");	//Pro tebe - jen to nejlepší!
	B_GiveTradeInv(self);
};