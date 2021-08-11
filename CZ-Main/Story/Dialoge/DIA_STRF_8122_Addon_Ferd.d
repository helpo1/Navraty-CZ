
instance DIA_STRF_8122_Addon_Ferd_EXIT(C_Info)
{
	npc = STRF_8122_Addon_Ferd;
	nr = 999;
	condition = DIA_STRF_8122_Addon_Ferd_exit_condition;
	information = DIA_STRF_8122_Addon_Ferd_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_STRF_8122_Addon_Ferd_exit_condition()
{
	return TRUE;
};

func void DIA_STRF_8122_Addon_Ferd_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_STRF_8122_Addon_Ferd_PreHello(C_Info)
{
	npc = STRF_8122_Addon_Ferd;
	nr = 2;
	condition = DIA_STRF_8122_Addon_Ferd_PreHello_condition;
	information = DIA_STRF_8122_Addon_Ferd_PreHello_info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_STRF_8122_Addon_Ferd_PreHello_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_STRF_8122_Addon_Ferd_PreHello_info()
{
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_PreHello_01_00");	//Tak jak je?
};

instance DIA_STRF_8122_Addon_Ferd_AfterHello(C_Info)
{
	npc = STRF_8122_Addon_Ferd;
	nr = 2;
	condition = DIA_STRF_8122_Addon_Ferd_AfterHello_condition;
	information = DIA_STRF_8122_Addon_Ferd_AfterHello_info;
	permanent = FALSE;
	description = "Hej, jak to jde?";
};

func int DIA_STRF_8122_Addon_Ferd_AfterHello_condition()
{
	return TRUE;
};

func void DIA_STRF_8122_Addon_Ferd_AfterHello_info()
{
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_AfterHello_01_00");	//Hej, jak to jde?
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_AfterHello_01_01");	//Tvoje otázky jsou jako to, co tu kopu.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_AfterHello_01_02");	//Totální sprostosta! Ještě něco?
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_AfterHello_01_03");	//Den a noc a jediné co dělám je, že kopu v tomto zatraceným dole.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_AfterHello_01_04");	//A za deset roků tu ty sračky budu kopat stále.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_AfterHello_01_05");	//Teda pokud do té doby nechcípnu. (úsměv)
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_AfterHello_01_06");	//Hned mi bylo jasné, že ty budeš optimista!
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_AfterHello_01_07");	//Pokud tu zůstaneš se mnou, stane se z tebe to samé jako ze mne.
};

instance DIA_STRF_8122_Addon_Ferd_HELLO(C_Info)
{
	npc = STRF_8122_Addon_Ferd;
	nr = 2;
	condition = DIA_STRF_8122_Addon_Ferd_hello_condition;
	information = DIA_STRF_8122_Addon_Ferd_hello_info;
	permanent = FALSE;
	description = "Už jsi tu asi dlouhou dobu, co?";
};

func int DIA_STRF_8122_Addon_Ferd_hello_condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8122_Addon_Ferd_AfterHello) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8122_Addon_Ferd_hello_info()
{
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_Hello_01_00");	//Už jsi tu asi dlouhou dobu, co?
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Hello_01_01");	//Déle než si dokážeš představit.
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_Hello_01_02");	//A to je jak dlouho?
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Hello_01_03");	//Poslouchej chlape... Pokud se tak nudíš, tak běž otravovat někoho jiného, dobře?
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Hello_01_04");	//Já musím pracovat, jinak mě skřeti stáhnou z kůže.
	AI_StopProcessInfos(self);
};

instance DIA_STRF_8122_Addon_Ferd_Escape(C_Info)
{
	npc = STRF_8122_Addon_Ferd;
	nr = 2;
	condition = DIA_STRF_8122_Addon_Ferd_Escape_condition;
	information = DIA_STRF_8122_Addon_Ferd_Escape_info;
	permanent = FALSE;
	description = "Co víš o útěku otroků?";
};

func int DIA_STRF_8122_Addon_Ferd_Escape_condition()
{
	if((Npc_KnowsInfo(hero,DIA_STRF_8122_Addon_Ferd_AfterHello) == TRUE) && (MIS_EscapeMine == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_STRF_8122_Addon_Ferd_Escape_info()
{
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_Escape_01_00");	//Co víš o útěku otroků?
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Escape_01_01");	//Zbláznil ses? A nebo chceš aby tě skřeti slyšeli?
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_Escape_01_02");	//Proč se bojíš?
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Escape_01_03");	//Poslouchej, já vím, že život v tomto dole není žádná sranda, ale pokud tě život omrzel, bež se zabít sám a mně nechej na pokoji.
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_Escape_01_04");	//Tak povíš mi to nebo ne?
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Escape_01_05");	//Sakra... Ty mi nedáš pokoj, co?
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Escape_01_06");	//Povím ti všechno co vím, ale ty mi za to pro mě uděláš takovou malou službičku.
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_Escape_01_07");	//A to je?
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Escape_01_08");	//Pro začátek mi dones pár léčivých lektvarů. Pět by mohlo stačit.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Escape_01_09");	//Naposledy jsem měl smůlu a uvolněný kámen mi spadl přímo na ruku a od té doby s ní mám problémy.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Escape_01_10");	//Asi jsem dostal infekci a pár dní dozadu se mi tam objevil i hnis. Pokud všechno půjde doprdele jako tehdy, tak o tu ruku příjdu.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Escape_01_11");	//Nehledě na to, že sotva zvládám kvótu. Naštěstí jsou ti skřeti tupí a ještě si toho nevšimli.
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_Escape_01_12");	//Pro začátek? Takže ještě budeš něco chtít?
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Escape_01_13");	//Dones mi ty lektvary a ostatní si povíme potom.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Escape_01_14");	//A nebo tě ten útěk otroků už nezajímá?
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_Escape_01_15");	//Dobře, uklidni se! Zkusím ti nějaké sehnat.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Escape_01_16");	//Tak šup šup, než tu chcípnu.
	MIS_FerdPotions = LOG_Running;
	Log_CreateTopic(TOPIC_FerdPotions,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FerdPotions,LOG_Running);
	B_LogEntry(TOPIC_FerdPotions,"Ferd po mně chce léčivé lektvary. Dost si zranil ruku a nechce aby si toho skřeti všimli.");
};

instance DIA_STRF_8122_Addon_Ferd_Potions(C_Info)
{
	npc = STRF_8122_Addon_Ferd;
	nr = 2;
	condition = DIA_STRF_8122_Addon_Ferd_Potions_condition;
	information = DIA_STRF_8122_Addon_Ferd_Potions_info;
	permanent = FALSE;
	description = "Tu máš ty lektvary.";
};

func int DIA_STRF_8122_Addon_Ferd_Potions_condition()
{
	if((MIS_FerdPotions == LOG_Running) && (Npc_HasItems(other,ItPo_Health_03) >= 5))
	{
		return TRUE;
	};
};

func void DIA_STRF_8122_Addon_Ferd_Potions_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_Potions_01_00");	//Tu máš ty lektvary.
	B_GiveInvItems(other,self,ItPo_Health_03,5);
	Npc_RemoveInvItems(self,ItPo_Health_03,4);
	AI_PlayAni(self,"T_SEARCH");
	B_UseItem(self,ItPo_Health_03);
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Potions_01_01");	//Mmm... Sakra načase kámo. A bolesť je preč!
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Potions_01_02");	//Ale ako som povedal, to nie je všetko.
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_Potions_01_03");	//Počúvam.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Potions_01_04");	//Potrebujem aby si našiel moj prsteň.
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_Potions_01_05");	//Aký prsteň?
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Potions_01_06");	//Obyčajný strieborný prsteň. Nič špeciálne.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Potions_01_07");	//Ale dal mi ho moj otec.
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_Potions_01_08");	//Aha. Takže rodinné dedičstvo?
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Potions_01_09");	//Jo jo, to si zatraceně uhádol. Len vďaka nemu som prežil celé tie podělané roky tu v tomto dole.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Potions_01_10");	//Keď sa naň pozriem, tak si spomeniem, aké to bolo keď všetko bolo inak. Rodina... (zasnene) A tak...
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Potions_01_11");	//Ale akonáhle ho ten podělaný Vakur Shak zbadal, tak si ulil pre seba.
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_Potions_01_12");	//Kto to je ten Vakur Shak?
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Potions_01_13");	//Jeden z nadriadených skřetů. Chamtivý bastard.
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_Potions_01_14");	//Chceš aby som ti od nich ten prsteň vyjednal?
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Potions_01_15");	//Je mi jedno ako to urobíš. Ale vidím, že si tu vykračuješ so zbraňou.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Potions_01_16");	//Takže by ťa aspoň mal vypočuť.
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_Potions_01_17");	//Uvidím, čo sa dá robiť.
	RT_Respect = RT_Respect + 1;
	MIS_FerdPotions = LOG_Success;
	Log_SetTopicStatus(TOPIC_FerdPotions,LOG_Success);
	B_LogEntry(TOPIC_FerdPotions,"Doniesol som Ferdymu tie lektvary.");
	MIS_FerdRing = LOG_Running;
	Log_CreateTopic(TOPIC_FerdRing,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FerdRing,LOG_Running);
	B_LogEntry(TOPIC_FerdRing,"Ferd chce aby som mu vrátil jeho rodinný prsteň, ktorý mu zobral Vakur Shak - Vyšší strážca otrokov.");
};

instance DIA_STRF_8122_Addon_Ferd_Ring(C_Info)
{
	npc = STRF_8122_Addon_Ferd;
	nr = 2;
	condition = DIA_STRF_8122_Addon_Ferd_Ring_condition;
	information = DIA_STRF_8122_Addon_Ferd_Ring_info;
	permanent = FALSE;
	description = "Je toto tvoj prsteň?";
};

func int DIA_STRF_8122_Addon_Ferd_Ring_condition()
{
	if((MIS_FerdRing == LOG_Running) && (Npc_HasItems(other,ItRi_Ferd) >= 1))
	{
		return TRUE;
	};
};

func void DIA_STRF_8122_Addon_Ferd_Ring_info()
{
	B_GivePlayerXP(500);
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Ring_01_00");	//Je toto tvoj prsteň?
	B_GiveInvItems(other,self,ItRi_Ferd,1);
	Npc_RemoveInvItems(self,ItRi_Ferd,1);
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Ring_01_01");	//Áno.
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_Ring_01_02");	//Získať ho nebola žiadna sranda.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Ring_01_03");	//Takči tal, konečne mám svoj milášek spať.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Ring_01_04");	//Vďaka.
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_Ring_01_05");	//Len si daj pozor, aby ti ho zasa nešlohli.
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_Ring_01_06");	//Nabudúce ti ho už nevráti.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Ring_01_07");	//Tak to si sakra píš.
	RT_Respect = RT_Respect + 1;
	MIS_FerdRing = LOG_Success;
	Log_CreateTopic(TOPIC_FerdRing,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FerdRing,LOG_Success);
	B_LogEntry(TOPIC_FerdRing,"Vrátil som Ferdymu jeho prsteň.");
};

instance DIA_STRF_8122_Addon_Ferd_EscapeTell(C_Info)
{
	npc = STRF_8122_Addon_Ferd;
	nr = 2;
	condition = DIA_STRF_8122_Addon_Ferd_EscapeTell_condition;
	information = DIA_STRF_8122_Addon_Ferd_EscapeTell_info;
	permanent = FALSE;
	description = "Tak čo naša dohoda?";
};

func int DIA_STRF_8122_Addon_Ferd_EscapeTell_condition()
{
	if(MIS_FerdRing == LOG_Success)
	{
		return TRUE;
	};
};

func void DIA_STRF_8122_Addon_Ferd_EscapeTell_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_EscapeTell_01_00");	//Tak čo naša dohoda?
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_EscapeTell_01_01");	//Ja svoje slovo držím.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_EscapeTell_01_02");	//Stalo sa to pár rokov dozadu... (zamyslene) Otrok menom Bargo naplánocal útek.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_EscapeTell_01_03");	//Mal naplánovanú vzburu.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_EscapeTell_01_04");	//A kým by bol všade zmatok mal sa nepozorovane prešmyknúť okolo stráží.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_EscapeTell_01_05");	//Vo vybraný deň sa otroci vzbúrili, zabili pár stráží a namierili si to k východu.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_EscapeTell_01_06");	//Ale skřeti to mali vymyslené. Zablokovali všetky východy z dolu okrem jedného.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_EscapeTell_01_07");	//Takže rebelovia nemali na výber a museli ísť len tam.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_EscapeTell_01_08");	//A, ako už asi vieš, tam na nich čakali elitné skřetí odiely, ktoré ich rozprášili na 50 odtieňov sračiek.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_EscapeTell_01_09");	//Takže ďalej ti to už nemusím vysvetlovať...
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_EscapeTell_01_10");	//Samozrejme, nikto to neprežil.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_EscapeTell_01_11");	//Mnoho ludí stratilo svoje životy kvoli Bargovi.
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_EscapeTell_01_12");	//A čos a stalo Bragovi?
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_EscapeTell_01_13");	//Keď si uvedomil, že jeho plán sa totálne podělal, tak sa skúsil schovať.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_EscapeTell_01_14");	//Ale skřeti ho našli. A potom mu poodsekávali končatiny a jeho hlavu narazili na kol na výstrahu ostatným.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_EscapeTell_01_15");	//Ešte teraz si pamatám ten krik.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_EscapeTell_01_16");	//Odvtedy už sa nikto neodvážil skúšať ujsť.
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_EscapeTell_01_17");	//Smutný príbeh.
	B_LogEntry(TOPIC_EscapeMine,"Ferd mi povedal, ako to bolo s tým útekom otrokov.");
};

instance DIA_STRF_8122_Addon_Ferd_NoEscape(C_Info)
{
	npc = STRF_8122_Addon_Ferd;
	nr = 2;
	condition = DIA_STRF_8122_Addon_Ferd_NoEscape_condition;
	information = DIA_STRF_8122_Addon_Ferd_NoEscape_info;
	permanent = FALSE;
	description = "Nikdy sa z tohto dolu nedostaneš.";
};

func int DIA_STRF_8122_Addon_Ferd_NoEscape_condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8122_Addon_Ferd_EscapeTell) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8122_Addon_Ferd_NoEscape_info()
{
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_NoEscape_01_00");	//Nikdy sa z tohto dolu nedostaneš.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_NoEscape_01_01");	//Ty tomu veríš ha?
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_NoEscape_01_02");	//Nie. Ja len, že hlavná šachta vedie do Skřetího mesta.
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_NoEscape_01_03");	//A tam už nebudú len obyčajné stráže.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_NoEscape_01_05");	//To si nedokážem ani predstaviť.
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_NoEscape_01_06");	//Tak teraz už vieš.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_NoEscape_01_07");	//Tak to aby sme všetci prijali svoj zatracený osud he?
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_NoEscape_01_08");	//Pravdepodobne tu zostaneme kopať do konca sveta.
};

instance DIA_STRF_8122_Addon_Ferd_Bunt(C_Info)
{
	npc = STRF_8122_Addon_Ferd;
	nr = 2;
	condition = DIA_STRF_8122_Addon_Ferd_Bunt_condition;
	information = DIA_STRF_8122_Addon_Ferd_Bunt_info;
	permanent = FALSE;
	description = "Čo by vyvolalo ďalšiu vzburu?";
};

func int DIA_STRF_8122_Addon_Ferd_Bunt_condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8122_Addon_Ferd_EscapeTell) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8122_Addon_Ferd_Bunt_info()
{
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_Bunt_01_00");	//Čo by vyvolalo ďalšiu vzburu?
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Bunt_01_01");	//Tak to je sakra nemožné... Ludia si serú do gatí len sa na nich nejaký skřet pozrie.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Bunt_01_02");	//Nemajú ani vieru ani silu.
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_Bunt_01_03");	//Potrebujete len silného vodcu.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Bunt_01_04");	//Jasné. že ma to nenapadlo skor! Poďme nasledovať ďalšieho kokota do záhuby... Ale teraz vážne.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Bunt_01_05");	//Tu sú hlavne len obyčajní kopáči, čo už po rokoch kopania ani nevedia kolko majú vajec.
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_Bunt_01_06");	//Počul som, že tu medzi vami je paladin.
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Bunt_01_07");	//Paladin? Tu? Si robíš prdel nie?
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_Bunt_01_08");	//Ani ja som to nevedel, preto som tu.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Bunt_01_09");	//To sú mi novinky...
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Bunt_01_10");	//Aj keby to bola pravda, tak je velmi nepradepodobné, že by sa len tak ukázal.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Bunt_01_11");	//Skřeti by poriadne zmalovali ak by zistili, kto to je.
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_Bunt_01_12");	//A ty nemáš tušenie, kto by to mohol byť?
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Bunt_01_13");	//A ako? Šak si mi to teraz povedal...
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_Bunt_01_14");	//A kto by to mohol vedieť?
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Bunt_01_15");	//Tak to je zatraceně dobrá otázka.
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Bunt_01_16");	//Ale ak by som ho mal začať hladať, skúsil by som pokecať s Crowom.
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_Bunt_01_17");	//Je to niekto špeciálny?
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Bunt_01_18");	//Nie. Proste je z nás najmenší kokot. Kedysi bol mág alebo možno alchymista.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Bunt_01_19");	//Už som zabudol, kto si to má sakra pamatať...
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Bunt_01_20");	//Možno sa niečo dozvieš.
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_Bunt_01_21");	//Dobre, to urobím.
	AskKrow = TRUE;
	B_LogEntry(TOPIC_LostPaladins,"Ferd netuší kto by mohol byť ten paladin. Ale vraj by som mal pokecať s Crowom.");
};
