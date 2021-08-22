
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
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Potions_01_01");	//Mmm... Sakra načase kámo. A bolest je pryč!
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Potions_01_02");	//Ale jak jsem říkal, to není všechno.
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_Potions_01_03");	//Poslouchám.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Potions_01_04");	//Potřebuji aby si našel můj prsten.
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_Potions_01_05");	//Jaký prsten?
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Potions_01_06");	//Obyčejný stříbrný prsten. Nic speciálního.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Potions_01_07");	//Ale dal mi ho můj otec.
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_Potions_01_08");	//Aha. Takže rodinné dědictví?
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Potions_01_09");	//Jo jo, to si zatraceně uhádl. Jen díky němu jsem přežil celé ty podělané roky tu v tomto dole.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Potions_01_10");	//Když se na něj podívám, tak si vzpomenu, jaké to bylo když všechno bylo jinak. Rodina... (zasněne) A tak...
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Potions_01_11");	//Ale jakmile ho ten podělaný Vakur Shak zahlédl, tak ho sebral pro sebe.
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_Potions_01_12");	//Kdo to je ten Vakur Shak?
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Potions_01_13");	//Jeden z nadřazených skřetů. Chamtivý bastard.
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_Potions_01_14");	//Chceš abych ti od nich ten prsten vyjednal?
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Potions_01_15");	//Je mi jedno jak to uděláš. Ale vidím, že si tu vykračuješ se zbraní.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Potions_01_16");	//Takže by tě aspoň měl vyslechnout.
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_Potions_01_17");	//Uvidím, co se dá dělat.
	RT_Respect = RT_Respect + 1;
	MIS_FerdPotions = LOG_Success;
	Log_SetTopicStatus(TOPIC_FerdPotions,LOG_Success);
	B_LogEntry(TOPIC_FerdPotions,"Donesl jsem Ferdymu ty lektvary.");
	MIS_FerdRing = LOG_Running;
	Log_CreateTopic(TOPIC_FerdRing,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FerdRing,LOG_Running);
	B_LogEntry(TOPIC_FerdRing,"Ferd chce aby jsem mu vrátil jeho rodinný prsten, který mu sebral Vakur Shak - Vyšší strážce otroků.");
};

instance DIA_STRF_8122_Addon_Ferd_Ring(C_Info)
{
	npc = STRF_8122_Addon_Ferd;
	nr = 2;
	condition = DIA_STRF_8122_Addon_Ferd_Ring_condition;
	information = DIA_STRF_8122_Addon_Ferd_Ring_info;
	permanent = FALSE;
	description = "Je to tvůj prsten?";
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
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Ring_01_00");	//Je to tvůj prsten?
	B_GiveInvItems(other,self,ItRi_Ferd,1);
	Npc_RemoveInvItems(self,ItRi_Ferd,1);
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Ring_01_01");	//Ano.
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_Ring_01_02");	//Získat ho nebyla žádná sranda.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Ring_01_03");	//Tak či onak, konečně ho mám zpět. Můj milášek.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Ring_01_04");	//Díky.
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_Ring_01_05");	//Jen si dej pozor, aby ti ho zase nešlohli.
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_Ring_01_06");	//Příště ti ho už nevrátí.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Ring_01_07");	//Tak to si sakra píš.
	RT_Respect = RT_Respect + 1;
	MIS_FerdRing = LOG_Success;
	Log_CreateTopic(TOPIC_FerdRing,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FerdRing,LOG_Success);
	B_LogEntry(TOPIC_FerdRing,"Vrátil jsem Ferdymu jeho prsten.");
};

instance DIA_STRF_8122_Addon_Ferd_EscapeTell(C_Info)
{
	npc = STRF_8122_Addon_Ferd;
	nr = 2;
	condition = DIA_STRF_8122_Addon_Ferd_EscapeTell_condition;
	information = DIA_STRF_8122_Addon_Ferd_EscapeTell_info;
	permanent = FALSE;
	description = "Tak co naše dohoda?";
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
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_EscapeTell_01_00");	//Tak co naša dohoda?
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_EscapeTell_01_01");	//Ja svoje slovo držím.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_EscapeTell_01_02");	//Stalo se to pár roků dozadu... (zamyšleně) Otrok se jménom Bargo naplánoval útěk.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_EscapeTell_01_03");	//Měl naplánovanou vzpouru.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_EscapeTell_01_04");	//A když byl všude zmatek, měl se nepozorovaně přešmyknout okolo stráží.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_EscapeTell_01_05");	//Ve vybraný den se otroci vzbouřili, zabili pár stráží a namířili si to k východu.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_EscapeTell_01_06");	//Ale skřeti to měli vymyšlené. Zablokovali všechny východy z dolu krom jednoho.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_EscapeTell_01_07");	//Takže rebelové neměli na výběr a museli jít jen tam.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_EscapeTell_01_08");	//A, jak už asi víš, tam na ně čakali elití skřetí oddíly, které je rozprášily na 50 odstínů sraček.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_EscapeTell_01_09");	//Takže dále ti to už nemusím vysvětlovat...
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_EscapeTell_01_10");	//Samozřejmě, nikdo to nepřežil.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_EscapeTell_01_11");	//Mnoho lidí ztratilo svoje životy kvůli Bargovi.
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_EscapeTell_01_12");	//A co se stalo Bragovi?
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_EscapeTell_01_13");	//Když si uvědomil, že jeho plán se totálně podělal, tak se zkusil schovat.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_EscapeTell_01_14");	//Ale skřeti ho našli. A potom mu poodsekávali končetiny a jeho hlavu narazili na kůl na výstrahu ostatním.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_EscapeTell_01_15");	//Ještě teď si pamatuji ten křik.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_EscapeTell_01_16");	//Od té doby se už nikdo neodvážil zkusit utéct.
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_EscapeTell_01_17");	//Smutný příběh.
	B_LogEntry(TOPIC_EscapeMine,"Ferd mi pověděl, jak to bylo s tím útěkem otroků.");
};

instance DIA_STRF_8122_Addon_Ferd_NoEscape(C_Info)
{
	npc = STRF_8122_Addon_Ferd;
	nr = 2;
	condition = DIA_STRF_8122_Addon_Ferd_NoEscape_condition;
	information = DIA_STRF_8122_Addon_Ferd_NoEscape_info;
	permanent = FALSE;
	description = "Nikdy se z tohoto dolu nedostaneš.";
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
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_NoEscape_01_00");	//Nikdy se z tohto dolu nedostaneš.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_NoEscape_01_01");	//Ty tomu věříš, ha?
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_NoEscape_01_02");	//Ne. Ja chci jen říct, že hlavní šachta vede do Skřetího města.
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_NoEscape_01_03");	//A tam už nebudou jen obyčejné stráže.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_NoEscape_01_05");	//To si nedokážu ani představit.
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_NoEscape_01_06");	//Tak teď už víš.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_NoEscape_01_07");	//Tak to abychom všechni přijali svůj zatracený osud, he?
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_NoEscape_01_08");	//Pravděpodobně tu zůstaneme kopat do konca světa.
};

instance DIA_STRF_8122_Addon_Ferd_Bunt(C_Info)
{
	npc = STRF_8122_Addon_Ferd;
	nr = 2;
	condition = DIA_STRF_8122_Addon_Ferd_Bunt_condition;
	information = DIA_STRF_8122_Addon_Ferd_Bunt_info;
	permanent = FALSE;
	description = "Co by vyvolalo další vzpouru?";
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
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_Bunt_01_00");	//Co by vyvolalo další vzpouru?
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Bunt_01_01");	//Tak to je sakra nemožné... Lidi si serou do gatí jen co se na ně nějaký skřet podívá.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Bunt_01_02");	//Nemají ani víru ani sílu.
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_Bunt_01_03");	//Potřebujete jen silného vůdce.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Bunt_01_04");	//Jasně. Že mě to nenapadlo dřív! Pojďme následovat dalšího kokota do záhuby... Ale teď vážně.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Bunt_01_05");	//Tu jsou hlavně jen obyčejní kopáči, co už po rocích kopání ani nevědí kolík mají vajec.
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_Bunt_01_06");	//Slyšel jsem, že tu mezi vámi je paladin.
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Bunt_01_07");	//Paladin? Tu? Si děláš prdel, ne?
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_Bunt_01_08");	//Ani já jsem to nevěděl, proto jsem tu.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Bunt_01_09");	//To jsou mi novinky...
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Bunt_01_10");	//I kdyby to byla pravda, tak je velmi nepraděpodobné, že by se jen tak ukázal.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Bunt_01_11");	//Skřeti by ho pořádně zmalovali, pokud by zjistili, kdo to je.
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_Bunt_01_12");	//A ty nemáš tušení, kdo by to mohl být?
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Bunt_01_13");	//A jak? Však jsi mi to teď řekl...
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_Bunt_01_14");	//A kdo by to mohl vědět?
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Bunt_01_15");	//Tak to je zatraceně dobrá otázka.
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Bunt_01_16");	//Ale kdybych ho měl začít hledat, zkusil bych pokecat s Crowem.
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_Bunt_01_17");	//Je to někdo speciální?
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Bunt_01_18");	//Ne. Prostě je z nás nejmenší kokot. Kdysi byl mág nebo možná alchymista.
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Bunt_01_19");	//Už jsem to zapoměl. Kdo si to má sakra pamatovat...
	AI_Output(self,other,"DIA_STRF_8122_Addon_Ferd_Bunt_01_20");	//Možná se něco dozvíš.
	AI_Output(other,self,"DIA_STRF_8122_Addon_Ferd_Bunt_01_21");	//Dobře, to udělám.
	AskKrow = TRUE;
	B_LogEntry(TOPIC_LostPaladins,"Ferd netuší, kdo by mohl být paladin. Ale prý bych měl pokecat s Crowem.");
};
