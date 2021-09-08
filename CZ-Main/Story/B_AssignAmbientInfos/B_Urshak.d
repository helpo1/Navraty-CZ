/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.01:

(3x) MIS_ORcGREATWAR - MIS_ORCGREATWAR (cyrilice -> latinka)

*/



instance DIA_Urshak_EXIT(C_Info)
{
	npc = NONE_110_Urshak;
	nr = 999;
	condition = DIA_Urshak_EXIT_Condition;
	information = DIA_Urshak_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Urshak_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Urshak_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Urshak_HALLO(C_Info)
{
	npc = NONE_110_Urshak;
	nr = 5;
	condition = DIA_Urshak_HALLO_Condition;
	information = DIA_Urshak_HALLO_Info;
	important = TRUE;
};


func int DIA_Urshak_HALLO_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (URSHAK_SUCKED == FALSE) && (MEETURSHAKALREADY == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Urshak_HALLO_Info()
{
	AI_Output(self,other,"DIA_Urshak_HALLO_18_00");	//(agresivně) KHROTOK JABARTH!
	AI_Output(self,other,"DIA_Urshak_HALLO_18_01");	//Počkej! Já tě znát. Ty přítel člověk s měkký hlas.
	AI_Output(self,other,"DIA_Urshak_HALLO_18_02");	//Přítel zabít zlý démon KRUSHAK.
	B_GivePlayerXP(XP_UrshakFound);
	Log_CreateTopic(TOPIC_Urshak,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Urshak,LOG_Running);
	B_LogEntry(TOPIC_Urshak,"Našel jsem svého starého skřetího přítele Ur-Shaka!");
	Info_ClearChoices(DIA_Urshak_HALLO);
	Info_AddChoice(DIA_Urshak_HALLO,"Co tady děláš?",DIA_Urshak_HALLO_freund);
	Info_AddChoice(DIA_Urshak_HALLO,"Mluvící skřet?!",DIA_Urshak_HALLO_wer);
};

func void DIA_Urshak_HALLO_wer()
{
	AI_Output(other,self,"DIA_Urshak_HALLO_wer_15_00");	//Mluvící skřet?!
	AI_Output(self,other,"DIA_Urshak_HALLO_wer_18_01");	//Ty zapomenout na Ur-Shak? To dělat smutek.
	AI_Output(self,other,"DIA_Urshak_HALLO_wer_18_02");	//Ur-Shak pomoct přítel mnoho dní před tím, než ULU-MULU umožnit jít do moje vesnice. Skřeti si vážit přátel a přítel nezemřít rukou skřeta.
	AI_Output(self,other,"DIA_Urshak_HALLO_wer_18_03");	//Přítel pak jí do podzemní skřetí chrám a zahnat zlý démon. Před mnoho dnů. Ty nepamatovat?
	URSHAKBONUSGOTIKA = TRUE;
};

func void DIA_Urshak_HALLO_freund()
{
	if(URSHAKBONUSGOTIKA == FALSE)
	{
		URSHAKBONUSGOTIKA = TRUE;
		B_GivePlayerXP(50);
	};
	AI_Output(other,self,"DIA_Urshak_HALLO_freund_15_00");	//To sis teda vybral čas k setkání. Málem jsem tě zabil. Co tady děláš?
	AI_Output(self,other,"DIA_Urshak_HALLO_freund_18_01");	//Ur-Shak dávat pozor na zemi a vidět, co se stát zemi a jeho lidem.
	Info_ClearChoices(DIA_Urshak_HALLO);
};

instance DIA_URSHAK_TARROKWOUND(C_Info)
{
	npc = NONE_110_Urshak;
	nr = 6;
	condition = dia_urshak_tarrokwound_condition;
	information = dia_urshak_tarrokwound_info;
	description = "Potřebuji tvoji pomoc.";
};

func int dia_urshak_tarrokwound_condition()
{
	if((MEETTARROK == TRUE) && (TARROKHEALTHY == FALSE) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void dia_urshak_tarrokwound_info()
{
	AI_Output(other,self,"DIA_Urshak_TarrokWound_18_01");	//Potřebuji tvoji pomoc.
	AI_Output(self,other,"DIA_Urshak_TarrokWound_18_02");	//Přítel může přijt vždy a Ur-Shak mu pomůže.
	AI_Output(other,self,"DIA_Urshak_TarrokWound_18_03");	//Potkal jsem tvého přítele, Thurrocka. Bohužel ho napadli kostlivci a ošklivě ho zranili.
	AI_Output(other,self,"DIA_Urshak_TarrokWound_18_04");	//Jestli nemá zemřít, bude potřebovat léčivý elixír, jaký užívají skřeti. Můžeš mi prozradit, kde ho najdu?
	AI_Output(self,other,"DIA_Urshak_TarrokWound_18_05");	//Přítel Ur-Shaka zraněn! Špatné... Přítel udelal správne, že přijít za Ur-Shak.
	AI_Output(self,other,"DIA_Urshak_TarrokWound_18_06");	//Přítel nemusí hledat lektvar. Ur-Shak mu jej dá. Člověk jej zanese Thurrockovi a ten bude zase zdravý jako dřív.
	AI_Output(self,other,"DIA_Urshak_TarrokWound_18_07");	//Tady... Přítel má lektvar, nyní jej zanese.
	B_GiveInvItems(self,other,itpo_xorcpotion,1);
	B_LogEntry(TOPIC_TARROKWOUND,"Ur-Shak mi dal léčivý lektvar pro skřety. Měl bych ho co nejrychleji dopravit za Thurrockem.");
};


instance DIA_URSHAK_HASULUMULU(C_Info)
{
	npc = NONE_110_Urshak;
	nr = 6;
	condition = dia_urshak_hasulumulu_condition;
	information = dia_urshak_hasulumulu_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_urshak_hasulumulu_condition()
{
	if((FINDULUMULU == TRUE) && (URSHAKKNOWULUMULU == FALSE) && (URSHAK_SUCKED == FALSE) && (Npc_HasItems(other,itmw_2h_orcprestige) >= 1))
	{
		return TRUE;
	};
};

func void dia_urshak_hasulumulu_info()
{
	B_GivePlayerXP(200);
	AI_Output(self,other,"DIA_Urshak_HasUlumulu_18_01");	//Přítel našel Ulu-Mulu! (rozčarován) To dobře!
	URSHAKKNOWULUMULU = TRUE;
};


instance DIA_Urshak_WASMACHENORKS(C_Info)
{
	npc = NONE_110_Urshak;
	nr = 6;
	condition = DIA_Urshak_WASMACHENORKS_Condition;
	information = DIA_Urshak_WASMACHENORKS_Info;
	description = "Proč skřeti napadli lidi?";
};


func int DIA_Urshak_WASMACHENORKS_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Urshak_HALLO) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Urshak_WASMACHENORKS_Info()
{
	AI_Output(other,self,"DIA_Urshak_WASMACHENORKS_15_00");	//Proč skřeti napadli lidi?
	AI_Output(self,other,"DIA_Urshak_WASMACHENORKS_18_01");	//Ur-Shak vždycky říkat skřetímu lidu, lidé ne zlí a mnoho dobrých přátel mezi nima.
	AI_Output(self,other,"DIA_Urshak_WASMACHENORKS_18_02");	//Ale šaman neposlouchat Ur-Shak. Ur-Shak pořád u svého lidu v nemilost.
	AI_Output(self,other,"DIA_Urshak_WASMACHENORKS_18_03");	//Tak Ur-Shak ne slyšet moc o velký plán proti lidem.
	B_LogEntry(TOPIC_Urshak,"Ještě stále nepřiměl svůj lid, aby mu naslouchal. Pořád zůstává vyhnancem.");
};


instance DIA_Urshak_SOVIELE(C_Info)
{
	npc = NONE_110_Urshak;
	nr = 7;
	condition = DIA_Urshak_SOVIELE_Condition;
	information = DIA_Urshak_SOVIELE_Info;
	description = "Jak to, že je vás tu najednou tolik?";
};


func int DIA_Urshak_SOVIELE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Urshak_HALLO) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Urshak_SOVIELE_Info()
{
	AI_Output(other,self,"DIA_Urshak_SOVIELE_15_00");	//Jak to, že je vás tu najednou tolik?
	AI_Output(self,other,"DIA_Urshak_SOVIELE_18_01");	//Skřeti přijít z hor, ale další připlout na lodích a postavit velká palisáda.
};


instance DIA_Urshak_ZAUN(C_Info)
{
	npc = NONE_110_Urshak;
	nr = 8;
	condition = DIA_Urshak_ZAUN_Condition;
	information = DIA_Urshak_ZAUN_Info;
	description = "Co je ukryto za tou dlouhou zdí na východě?";
};


func int DIA_Urshak_ZAUN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Urshak_HALLO) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Urshak_ZAUN_Info()
{
	AI_Output(other,self,"DIA_Urshak_ZAUN_15_00");	//Co je ukryto za tou dlouhou zdí na východě?
	AI_Output(self,other,"DIA_Urshak_ZAUN_18_01");	//Skřeti vždycky, když válka, stavět velká palisáda a tábor.
	AI_Output(self,other,"DIA_Urshak_ZAUN_18_02");	//Palisáda dobrá pro válka. Ukrývá síla vojska a chrání skřety.
	AI_Output(self,other,"DIA_Urshak_ZAUN_18_03");	//Nicméně Ur-shak slyšel hrozné a divné veci.
	AI_Output(self,other,"DIA_Urshak_ZAUN_18_04");	//Skřeti říkají, že jiný druh magie schovaný za palisáda! Temný a nečistý!
	AI_Output(self,other,"DIA_Urshak_ZAUN_18_05");	//Skřeti jsou vylekaní! Šamani jsou také vylekaní...
	AI_Output(self,other,"DIA_Urshak_ZAUN_18_06");	//Ani Ur-Shak nikdy předtím nic takového neviděl.
};


instance DIA_Urshak_WASHASTDUVOR(C_Info)
{
	npc = NONE_110_Urshak;
	nr = 9;
	condition = DIA_Urshak_WASHASTDUVOR_Condition;
	information = DIA_Urshak_WASHASTDUVOR_Info;
	description = "Co budeš dělat teď?";
};


func int DIA_Urshak_WASHASTDUVOR_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Urshak_HALLO) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Urshak_WASHASTDUVOR_Info()
{
	AI_Output(other,self,"DIA_Urshak_WASHASTDUVOR_15_00");	//Co budeš dělat teď?
	AI_Output(self,other,"DIA_Urshak_WASHASTDUVOR_18_01");	//Ur-Shak čekat, až skřetí zvěd vzít Ur-Shak k Hosh-Pak.
	AI_Output(other,self,"DIA_Urshak_WASHASTDUVOR_15_02");	//Kdo je Hosh-Pak?
	AI_Output(self,other,"DIA_Urshak_WASHASTDUVOR_18_03");	//Moc mocný šaman. Mít velký vliv na válečníky a dělat pro skřety velké plány.
	B_LogEntry(TOPIC_Urshak,"Ur-Shak má v plánu setkat se se skřetím šamanem Hosh-Pakem a přesvědčit ho, aby ho přijal do rady mezi ostatní šamany.");
	Info_ClearChoices(DIA_Urshak_WASHASTDUVOR);
	Info_AddChoice(DIA_Urshak_WASHASTDUVOR,Dialog_Back,DIA_Urshak_WASHASTDUVOR_weiter);
	Info_AddChoice(DIA_Urshak_WASHASTDUVOR,"Kde najdu toho Hosh-Paka?",DIA_Urshak_WASHASTDUVOR_);
	Info_AddChoice(DIA_Urshak_WASHASTDUVOR,"Tak proč teda za ním nejdeš?",DIA_Urshak_WASHASTDUVOR_hoshpak);
};

func void DIA_Urshak_WASHASTDUVOR_hoshpak()
{
	AI_Output(other,self,"DIA_Urshak_WASHASTDUVOR_hoshpak_15_00");	//Tak proč teda za ním nejdeš?
	AI_Output(self,other,"DIA_Urshak_WASHASTDUVOR_hoshpak_18_01");	//Ur-Shak zkoušet znovu a znovu získat čest a staré místo v šamaní rada.
	AI_Output(self,other,"DIA_Urshak_WASHASTDUVOR_hoshpak_18_02");	//Ale až do teď, Hosh-Pak neposlouchat Ur-Shak. Skřeti zabít Ur-Shak, když jeho vidět bez zvěd. Ur-Shak muset mluvit s Hosh-Pak.
	AI_Output(self,other,"DIA_Urshak_WASHASTDUVOR_hoshpak_18_03");	//Možná dneska štěstí.
};

func void DIA_Urshak_WASHASTDUVOR_()
{
	AI_Output(other,self,"DIA_Urshak_WASHASTDUVOR_Urshak_15_00");	//Kde najdu toho Hosh-Paka?
	AI_Output(self,other,"DIA_Urshak_WASHASTDUVOR_Urshak_18_01");	//Utábořit se, kde vidět skřetí válečníky přes les u velká sopka. Hosh-Pak tak moct ovládat válečníky.
};

func void DIA_Urshak_WASHASTDUVOR_weiter()
{
	Info_ClearChoices(DIA_Urshak_WASHASTDUVOR);
};


instance DIA_URSHAK_TEMPLEDOOR(C_Info)
{
	npc = NONE_110_Urshak;
	nr = 9;
	condition = dia_urshak_templedoor_condition;
	information = dia_urshak_templedoor_info;
	description = "Ty víš co se stalo v Spáčově chrámu?";
};


func int dia_urshak_templedoor_condition()
{
	if((ORCTEMPLEGATEINFO == TRUE) && (ORCTEMPLEGATEOPENED == FALSE) && (BUMSHAKINSERTED == FALSE) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void dia_urshak_templedoor_info()
{
	AI_Output(other,self,"DIA_Urshak_TempleDoor_15_00");	//Ty víš co se stalo v Spáčově chrámu?
	AI_Output(self,other,"DIA_Urshak_TempleDoor_01_01");	//Přítel nemá šanci dostat se do chrámu.
	AI_Output(self,other,"DIA_Urshak_TempleDoor_01_02");	//Skřeti tančili, že volní a šamani zapečetili chrám.
	AI_Output(self,other,"DIA_Urshak_TempleDoor_01_03");	//Ale pak znovu přišel zlomyslná démon. Začal zabíjet mezi bratry. Skřeti zděsili a opustili město.
	AI_Output(self,other,"DIA_Urshak_TempleDoor_01_04");	//Bratři nečekali a nastražit past! Ty přiblížit ke vstupu a zemřít.
	AI_Output(other,self,"DIA_Urshak_TempleDoor_15_03");	//A jak se tam teda dostanu?
	AI_Output(self,other,"DIA_Urshak_TempleDoor_01_06");	//Člověk chce jít do chrámu? To se přítel nebojí zla?!
	AI_Output(other,self,"DIA_Urshak_TempleDoor_15_05");	//Prostě tam potřebuji, můžeš mě tam dostat?
	AI_Output(self,other,"DIA_Urshak_TempleDoor_01_08");	//Bratři zrobit klíč. Klíč ke kouzlu. Ale pak i odnést klíč a dobře schovat.
	AI_Output(other,self,"DIA_Urshak_TempleDoor_15_06");	//Město? Chceš říci, že v kolonii je ješte jiné skřetí město?!
	AI_Output(self,other,"DIA_Urshak_TempleDoor_01_10");	//Město pod skálou. Velké mesto - mnoho bratrů, mnoho válečníků.
	AI_Output(self,other,"DIA_Urshak_TempleDoor_01_11");	//Jestli přítel jít tam, mít s sebou Ulu-Mulu. Pak bratři nedotknout a mluvit s přítel.
	AI_Output(other,self,"DIA_Urshak_TempleDoor_01_12");	//Myslím, že jsem ho ztratil. Kde teď seženu ještě jeden Ulu-Mulu?
	AI_Output(self,other,"DIA_Urshak_TempleDoor_01_13");	//Ur-Shak ti nepomůže, jen válečníci ví jak se dělá. Ur-Shak nebyl válečník, ale šaman... Ale Ur-Shak může povědet kde hledat válečníka.
	AI_Output(self,other,"DIA_Urshak_TempleDoor_01_14");	//Thurrock nesmýšlet špatně o lidech. Být více jako Ur-Shak než ostatní. Pomůže ti k Ulu-Mulu.
	AI_Output(other,self,"DIA_Urshak_TempleDoor_01_15");	//A kde toho Thurrocka najdu?
	AI_Output(self,other,"DIA_Urshak_TempleDoor_01_16");	//Přítel k bažině jít a hledat vež. Nad ní naposled Thurrockův tábor.
	AI_Output(other,self,"DIA_Urshak_TempleDoor_01_17");	//A kde pak najdu město?
	AI_Output(self,other,"DIA_Urshak_TempleDoor_01_18");	//Přítel půjde do hor na severu, tam najít vstup.
	AI_Output(self,other,"DIA_Urshak_TempleDoor_01_19");	//Ale nezapomenout Ulu-Mulu mít v ruce, jinak špatný konec.

	if(ORCPROMISEMAKE == FALSE)
	{
		AI_Output(self,other,"DIA_Urshak_TempleDoor_01_20");	//Jestli přítel dostat do města, možná se zeptá, jestli Ur-Shak může domů... pak by byl konečně doma...
		AI_Output(other,self,"DIA_Urshak_TempleDoor_01_21");	//Položím za tebe slovo - jestli se mnou vůbec budou mluvit.
	};

	AI_Output(other,self,"DIA_Urshak_TempleDoor_01_22");	//Díky za pomoc, kamaráde.
	B_LogEntry(TOPIC_ORCTEMPLE,"Ur-Shak mi řekl, že jediná cesta přes zaklínadlo u vstupu do chrámu je najít klíč. Nicméně si ho odnesli skřeti do svého města. Měl bych se tam podívat a přimět je, aby mi půjčili svůj klíček...");
	B_LogEntry_Quiet(TOPIC_ORCTEMPLE,"S sebou bych ale měl mít Ulu-Mulu, symbol přátelství se skřety. S ním na zádech se mě ani nedotknou. Ur-Shak ho neumí vyrobit, ale odkázal mě na někoho kdo ano. Jmenuje se Thurrock. Pravdepodobně Bude souhlasit a vyrobí mi Ulu-Mulu. Snad... Podle Ur-Shaka měl naposled tábor rozdělán kousek od té nové velké bažiny, nad strážní věží.");

	if(ORCPROMISEMAKE == FALSE)
	{
		B_LogEntry_Quiet(TOPIC_Urshak,"Ur-Shak mě požádal, jestli bych u jeho bratrů nemohl ztratit slovo za jeho návrat.");
	};

	BUMSHAKINSERTED = TRUE;
	AI_StopProcessInfos(self);
	Wld_InsertNpc(orc_8524_bumshak,"OW_PATH_50");
	Wld_InsertNpc(Lesser_Skeleton,"OW_PATH_BUMSHAKSKEL_01");
	Wld_InsertNpc(Lesser_Skeleton,"OW_PATH_BUMSHAKSKEL_02");
	Wld_InsertNpc(Lesser_Skeleton,"OW_PATH_BUMSHAKSKEL_03");
};

instance DIA_Urshak_HOSHPAKDEAD(C_Info)
{
	npc = NONE_110_Urshak;
	nr = 9;
	condition = DIA_Urshak_HOSHPAKDEAD_Condition;
	information = DIA_Urshak_HOSHPAKDEAD_Info;
	description = "Hosh-Pak je mrtvý.";
};

func int DIA_Urshak_HOSHPAKDEAD_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Urshak_WASHASTDUVOR) && Npc_IsDead(Hosh_Pak) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Urshak_HOSHPAKDEAD_Info()
{
	AI_Output(other,self,"DIA_Urshak_HOSHPAKDEAD_15_00");	//Hosh-Pak je mrtvý.
	AI_Output(self,other,"DIA_Urshak_HOSHPAKDEAD_18_01");	//Hosh-Pak mrtvý? RUSHTASOK!
	AI_Output(self,other,"DIA_Urshak_HOSHPAKDEAD_18_02");	//Mé srdce těžké jako kámen. Ur-Shak nikdy nezapomenout velký skřet, co udělat Ur-Shak šaman.
	AI_Output(other,self,"DIA_Urshak_HOSHPAKDEAD_15_03");	//Rozumím, byl tvým učitelem.
	AI_Output(self,other,"DIA_Urshak_HOSHPAKDEAD_18_04");	//Ur-Shak teď muset zbavit zármutku, muset dát Hosh-Pak poslední rituál. Ur-Shak muset jít.
	AI_Output(self,other,"DIA_Urshak_HOSHPAKDEAD_18_05");	//Přítel raděj hned projít průsmyk. Tady moc nebezpečný.
	AI_Output(self,other,"DIA_Urshak_HOSHPAKDEAD_18_06");	//Ur-Shak říct, když přítel člověk umřít.
	B_LogEntry(TOPIC_Urshak,"Hosh-Pak je mrtev. Můj skřetí přítel nyní míří k jeho stanu a oplakává smrt svého mentora. Měl bych ho nechat jít.");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,20);
	Npc_ExchangeRoutine(self,"Start");
	Wld_InsertNpc(OrcWarrior_Rest,"FP_CAMPFIRE_HOSHPAK_01");
	Wld_InsertNpc(OrcWarrior_Rest,"FP_CAMPFIRE_HOSHPAK_02");
};

instance DIA_Urshak_HOSHPAKRACHE(C_Info)
{
	npc = NONE_110_Urshak;
	condition = DIA_Urshak_HOSHPAKRACHE_Condition;
	information = DIA_Urshak_HOSHPAKRACHE_Info;
	important = TRUE;
};


func int DIA_Urshak_HOSHPAKRACHE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Urshak_HOSHPAKDEAD) && (Npc_GetDistToWP(self,"OW_HOSHPAK_04") <= 1000) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Urshak_HOSHPAKRACHE_Info()
{
	AI_Output(self,other,"DIA_Urshak_HOSHPAKRACHE_18_00");	//(agresivně) Khrotok Morra! Já dozvedet ty tady, když Hosh-Pak umřel.
	AI_Output(self,other,"DIA_Urshak_HOSHPAKRACHE_18_04");	//Ur-Shak vidí omyl, když věřil zlému človeku. Ur-Shak lituje, že volal přítel na človeka a nezabil jej.
	AI_Output(self,other,"DIA_Urshak_HOSHPAKRACHE_18_05");	//Nyní opustíš údolí a Ur-Shak tě nechá jít. Čest šamana mu nedovolí te zabít.
	AI_Output(self,other,"DIA_Urshak_HOSHPAKRACHE_18_06");	//Příště ale ne...
	AI_StopProcessInfos(self);
	URSHAK_SUCKED = TRUE;
	B_LogEntry(TOPIC_Urshak,"Ur-Shak byl přijat zpátky do rady skřetích šamanů a ocitl se tedy na straně nepřítele. Radši bych se mu měl vyhýbat, dokud se mi nepodaří tu záležitost se skřety nějak urovnat. To by ho mělo uklidnit.");
	Npc_ExchangeRoutine(self,"PreStart");
};


instance DIA_Urshak_KEINEWAHL(C_Info)
{
	npc = NONE_110_Urshak;
	condition = DIA_Urshak_KEINEWAHL_Condition;
	information = DIA_Urshak_KEINEWAHL_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Urshak_KEINEWAHL_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Urshak_HOSHPAKRACHE) && Npc_IsInState(self,ZS_Talk) && (URSHAK_SUCKED == TRUE) && (URSHAKNOMAGIC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Urshak_KEINEWAHL_Info()
{
	AI_Output(self,other,"DIA_Urshak_KEINEWAHL_18_00");	//Ty jít, já s tebou nemluvit.
	AI_StopProcessInfos(self);
	URSHAK_SUCKED = TRUE;
};


instance DIA_URSHAK_FORGIVEME(C_Info)
{
	npc = NONE_110_Urshak;
	condition = dia_urshak_forgiveme_condition;
	information = dia_urshak_forgiveme_info;
	important = TRUE;
	permanent = TRUE;
};

func int dia_urshak_forgiveme_condition()
{
	if((URSHAKNOMAGIC == TRUE) && (URSHAKENDANGRY == FALSE))
	{
		return TRUE;
	};
};

func void dia_urshak_forgiveme_info()
{
	AI_Output(self,other,"DIA_Urshak_ForgiveMe_01_00");	//Co to člověk delá? Snaží se mi snad ublížit?
	AI_Output(other,self,"DIA_Urshak_ForgiveMe_01_01");	//Konečně se mnou zase mluvíš!...
	AI_Output(self,other,"DIA_Urshak_ForgiveMe_01_02");	//Člověk říká divná slova, Ur-Shak nerozumí...
	AI_Output(self,other,"DIA_Urshak_ForgiveMe_01_03");	//Člověk přece přítel, proč Ur-Shak nemluvit s přítel?!... (nechápave)
	AI_Output(other,self,"DIA_Urshak_ForgiveMe_01_04");	//Už na mě nejsi naštvaný?
	AI_Output(self,other,"DIA_Urshak_ForgiveMe_01_05");	//Ur-Shak nechápat proč být naštvaný na člověka!... (nepochopitelne)
	AI_Output(other,self,"DIA_Urshak_ForgiveMe_01_06");	//Jo, jasně... Nejak mi to dneska nemyslí. Nevím co to se mnou je, zapomeň na to!
	AI_Output(self,other,"DIA_Urshak_ForgiveMe_01_07");	//Ur-Shak myslí, že přítel se chovat divně! Nebýt v něm zlý démon, který se snaží ublížit?
	AI_Output(other,self,"DIA_Urshak_ForgiveMe_01_08");	//Vše je v pořádku, příteli. Prostě na to zapomeň.
	B_LogEntry(TOPIC_Urshak,"Můj nápad užít na Ur-Shaka kouzlo Zapomnění funguje! Ur-Shak zapomněl na svého učitele a znovu se mnou mluví.");
	B_GivePlayerXP(500);
	URSHAKENDANGRY = TRUE;
};

instance DIA_URSHAK_ORCTEMPLEFIXED(C_Info)
{
	npc = NONE_110_Urshak;
	nr = 6;
	condition = dia_urshak_orctemplefixed_condition;
	information = dia_urshak_orctemplefixed_info;
	permanent = FALSE;
	description = "Skončil jsem se zlem v Spáčově chrámu.";
};


func int dia_urshak_orctemplefixed_condition()
{
	if((DARKMAGE_ISDEAD == TRUE) && ((URSHAK_SUCKED == FALSE) || (URSHAKENDANGRY == TRUE)))
	{
		return TRUE;
	};
};

func void dia_urshak_orctemplefixed_info()
{
	AI_Output(other,self,"DIA_Urshak_OrctempleFixed_15_00");	//Skončil jsem se zlem v Spáčově chrámu.
	AI_Output(self,other,"DIA_Urshak_OrctempleFixed_18_01");	//(vítězne) KHROTOK YABART! Jak to človek dokázat?
	AI_Output(other,self,"DIA_Urshak_OrctempleFixed_15_02");	//No, nebylo to zrovna lehké.
	AI_Output(self,other,"DIA_Urshak_OrctempleFixed_18_03");	//Velký respekt od Ur-Shaka, velký respekt.
	B_GivePlayerXP(300);
};


instance DIA_URSHAK_BECOMESHAMAN(C_Info)
{
	npc = NONE_110_Urshak;
	nr = 6;
	condition = dia_urshak_becomeshaman_condition;
	information = dia_urshak_becomeshaman_info;
	permanent = FALSE;
	description = "Ohledně tvého problému.";
};

func int dia_urshak_becomeshaman_condition()
{
	if((ORCPROMISEMAKE == TRUE) && (URSHAKBECOMESHAMAN == FALSE))
	{
		return TRUE;
	};
};

func void dia_urshak_becomeshaman_info()
{
	B_GivePlayerXP(XP_UrshakBecomesShaman);
	AI_Output(other,self,"DIA_Urshak_BecomeShaman_01_00");	//Ohledně tvého problému.
	AI_Output(other,self,"DIA_Urshak_BecomeShaman_01_01");	//Přimluvil jsem se za tebe u skřetího krále.
	AI_Output(self,other,"DIA_Urshak_BecomeShaman_01_02");	//A co ti Velký vůdce říkat?
	AI_Output(other,self,"DIA_Urshak_BecomeShaman_01_03");	//No, můžeš se vrátit za svými bratry!
	AI_Output(self,other,"DIA_Urshak_BecomeShaman_01_04");	//(vítězne) KHROTOK YABART! Jak to človek dokázal?
	AI_Output(other,self,"DIA_Urshak_BecomeShaman_01_05");	//No, výměnou jsem musel prokázat jednu službičku.
	AI_Output(self,other,"DIA_Urshak_BecomeShaman_01_06");	//Ur-Shak velmi potěšen! Ur-Shak velmi dekuje!
	AI_Output(other,self,"DIA_Urshak_BecomeShaman_01_07");	//Jasně, nebylo to tak komplikované.
	AI_Output(self,other,"DIA_Urshak_BecomeShaman_01_08");	//Ur-Sjal nikdy nezapomene co člověk udelal!
	AI_Output(other,self,"DIA_Urshak_BecomeShaman_01_09");	//To je v pohodě, teď musím zase dál.
	AI_Output(self,other,"DIA_Urshak_BecomeShaman_01_10");	//Jdi, příteli. Ur-Shak se připravuje na návrat. Návrat domů. Návrat k bratrům...
	URSHAKBECOMESHAMAN = TRUE;
	MIS_UrshakShaman = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_Urshak,LOG_SUCCESS);
	B_LogEntry(TOPIC_Urshak,"Nyní Ur-Shak znovu patří do kruhu šamanů.");
};


instance DIA_URSHAK_ORCORDER(C_Info)
{
	npc = NONE_110_Urshak;
	nr = 6;
	condition = dia_urshak_orcorder_condition;
	information = dia_urshak_orcorder_info;
	permanent = FALSE;
	description = "Nemohl bys mi s něčím pomoct?";
};


func int dia_urshak_orcorder_condition()
{
	if((MIS_ORCORDER == LOG_Running) && (Npc_HasItems(hero,itwr_orcsorder) >= 1) && (PlayerKnowsOrcLanguage == FALSE) && (KNOWSTARANBUILD == FALSE))
	{
		return TRUE;
	};
};

func void dia_urshak_orcorder_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Urshak_OrcOrder_01_00");	//Nemohl bys mi s něčím pomoct?
	AI_Output(self,other,"DIA_Urshak_OrcOrder_01_01");	//Ur-Shak vždy rád pomůže. Co musí udělat?!
	AI_Output(other,self,"DIA_Urshak_OrcOrder_01_02");	//Mám tu dopis psaný ve skřetím jazyce.
	AI_Output(other,self,"DIA_Urshak_OrcOrder_01_03");	//Mohl bys mi ho přečíst?!
	AI_Output(self,other,"DIA_Urshak_OrcOrder_01_04");	//No, dej Ur-Shakovi dopis a poslouchej.
	AI_Output(other,self,"DIA_Urshak_OrcOrder_01_05");	//Tady, to je on.
	B_GiveInvItems(other,self,itwr_orcsorder,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Urshak_OrcOrder_01_06");	//... (kouká na dopis) Píše s tu o válečných plánech proti lidem.
	AI_Output(self,other,"DIA_Urshak_OrcOrder_01_07");	//KHROTOK YABART! Odkud má člověk ten dopis?!... (udivene)
	AI_Output(other,self,"DIA_Urshak_OrcOrder_01_08");	//Našel jsem ho! Raději nepřestávej číst...
	AI_Output(self,other,"DIA_Urshak_OrcOrder_01_09");	//Hmmm... (looks at the letter)
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Urshak_OrcOrder_01_10");	//Skřeti zde píší, že brzy dorazí spousta válečníků válčit proti lidem.
	AI_Output(self,other,"DIA_Urshak_OrcOrder_01_11");	//A brzy zaútočí na lidskou pevnost...
	AI_Output(self,other,"DIA_Urshak_OrcOrder_01_12");	//S pevností v zádech by nemohli napadnout město lidí!
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Urshak_OrcOrder_01_13");	//Chtějí prorazit bránu a zeď.
	AI_Output(self,other,"DIA_Urshak_OrcOrder_01_14");	//Bratři poslali velkou skupinu udělat potřebnou přípravu - vyrobit beranidlo.
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Urshak_OrcOrder_01_15");	//To je vše, co se tu píše...
	AI_Output(other,self,"DIA_Urshak_OrcOrder_01_16");	//Takže chtějí zbudovat nové obléhací stroje?!
	AI_Output(self,other,"DIA_Urshak_OrcOrder_01_17");	//Asi ano...
	AI_Output(other,self,"DIA_Urshak_OrcOrder_01_18");	//Bezva, díky za pomoc.
	B_LogEntry(TOPIC_ORCORDER,"Ur-Shak mi pomohl přečíst dopis. Stojí v něm, že skřeti vyslali skupinu stavitelů, aby sestavili nové beranidlo. Vypadá to, že skupina vyjde z jejich tábora. Musím varovat Alberta.");
	KNOWSTARANBUILD = TRUE;
};


instance DIA_URSHAK_WAKONTEST(C_Info)
{
	npc = NONE_110_Urshak;
	nr = 6;
	condition = dia_urshak_wakontest_condition;
	information = dia_urshak_wakontest_info;
	permanent = FALSE;
	description = "Ahoj, nějako by se mi hodila rada.";
};


func int dia_urshak_wakontest_condition()
{
	if(MIS_WAKONTEST == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_urshak_wakontest_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Urshak_WakonTest_01_00");	//Ahoj, nějako by se mi hodila rada.
	AI_Output(self,other,"DIA_Urshak_WakonTest_01_01");	//A jaká rada to být?
	AI_Output(other,self,"DIA_Urshak_WakonTest_01_02");	//Víš něco o Duchu Vody?
	AI_Output(self,other,"DIA_Urshak_WakonTest_01_03");	//Duchu Vody?! Hmm... (zamyšleně) Obávám se, že Ur-Shak nebýt dostatečne vzdelaný o tomto... Neslyšel o nem!
	AI_Output(self,other,"DIA_Urshak_WakonTest_01_04");	//Nicméně Ur-Shak ví, kdo moci pomoci.
	AI_Output(other,self,"DIA_Urshak_WakonTest_01_05");	//A kdo to je?!
	AI_Output(self,other,"DIA_Urshak_WakonTest_01_06");	//Přítel musí za horskými skřety! Tam najít klan Vysoká skála - velký tábor a velký počet bratří.
	AI_Output(self,other,"DIA_Urshak_WakonTest_01_07");	//Člověk prát tam a nekdo mu pomoci!
	AI_Output(other,self,"DIA_Urshak_WakonTest_01_08");	//Ale jak se tam dostanu?!
	AI_Output(self,other,"DIA_Urshak_WakonTest_01_09");	//Člověk půjde nahoru nad starý Spáčův chrám! Pak stále nahoru až tam, kde i poslední zveř nebývá! A až nahoře je klan Vysoká skála!
	AI_Output(self,other,"DIA_Urshak_WakonTest_01_10");	//Člověk jít do hor a najít tábor.
	AI_Output(other,self,"DIA_Urshak_WakonTest_01_11");	//Dobrá, díky za pomoc!
	AI_Output(self,other,"DIA_Urshak_WakonTest_01_12");	//Ur-Shak vždy rád pomůže.
	URSHAKTELLWATERSOUL = TRUE;
	B_LogEntry(TOPIC_WAKONTEST,"K velké lítosti Ur-Shak nic neví o Duchu Vody. Ale alespoň mi popsal cestu do klanu Vysoké skály, kde mám hledat radu. Snad tam najdu něco, co se mi bude hodit.");
};


instance DIA_URSHAK_MEETINCASTLE(C_Info)
{
	npc = NONE_110_Urshak;
	nr = 1;
	condition = dia_urshak_meetincastle_condition;
	information = dia_urshak_meetincastle_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_urshak_meetincastle_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_ORCGREATWAR == LOG_Running) && (URSHAKBECOMESHAMAN == TRUE) && (PALADINATTACK == FALSE) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void dia_urshak_meetincastle_info()
{
	AI_Output(self,other,"DIA_Urshak_MeetInCastle_01_00");	//Člověk-přítel v hrade! Proč to?!
	AI_Output(other,self,"DIA_Urshak_MeetInCastle_01_01");	//Ty jsi také tady, takové setkání jsem nečekal!
	AI_Output(self,other,"DIA_Urshak_MeetInCastle_01_02");	//Proč je člověk tak překvapen?!... (nechápave)
	AI_Output(self,other,"DIA_Urshak_MeetInCastle_01_03");	//Ur-Shak nyní šaman. Vrátit se k bratrům a bojovat s nimi ve válce.
	AI_Output(self,other,"DIA_Urshak_MeetInCastle_01_04");	//Nicméně to Ur-Shak nechtít a stále říkat bratřím, že to špatné!
	AI_Output(self,other,"DIA_Urshak_MeetInCastle_01_05");	//Ale opět Ur-Shaka neposlouchají, opet se Ur-Shak obává, že se minulost bude opakovat.
	AI_Output(other,self,"DIA_Urshak_MeetInCastle_01_06");	//No, snad budeš mít štěstí.
	MEETURSHAKALREADY = TRUE;
};


instance DIA_URSHAK_ORCSAVEPEOPLE(C_Info)
{
	npc = NONE_110_Urshak;
	nr = 6;
	condition = dia_urshak_orcsavepeople_condition;
	information = dia_urshak_orcsavepeople_info;
	permanent = FALSE;
	description = "Proč skřeti nezabili paladiny?";
};


func int dia_urshak_orcsavepeople_condition()
{
	if(Npc_KnowsInfo(hero,dia_urshak_meetincastle) && (MIS_ORCGREATWAR == LOG_Running) && (URSHAKBECOMESHAMAN == TRUE) && (KNOWABOUTGAROND == TRUE))
	{
		return TRUE;
	};
};

func void dia_urshak_orcsavepeople_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Urshak_OrcSavePeople_01_01");	//Proč skřeti nezabili paladiny?
	AI_Output(self,other,"DIA_Urshak_OrcSavePeople_01_02");	//To díky Ur-Shakovi!
	AI_Output(self,other,"DIA_Urshak_OrcSavePeople_01_03");	//Já promluvit k bratřím a říci, že lidé užiteční.
	AI_Output(self,other,"DIA_Urshak_OrcSavePeople_01_04");	//Protože to nebýt obyčejní lidé, ale paladinové! To silní válečníci.
	AI_Output(other,self,"DIA_Urshak_OrcSavePeople_01_05");	//Ale jak to, že tě slyší?
	AI_Output(self,other,"DIA_Urshak_OrcSavePeople_01_06");	//Ur-Shak být šaman a mluvit s duchy. Duchové říct Ur-shak to, že ti lidé se nedát zabít.
	AI_Output(self,other,"DIA_Urshak_OrcSavePeople_01_07");	//Vůdce pevnosti uznat Ur-Shakovu pravdu, protože duchové neomylní!
	AI_Output(other,self,"DIA_Urshak_OrcSavePeople_01_08");	//Aha... jasně! To se mi nějak nezdá.
	AI_Output(self,other,"DIA_Urshak_OrcSavePeople_01_09");	//Člověk mi neveří? (udivene) Proč?!
	AI_Output(other,self,"DIA_Urshak_OrcSavePeople_01_10");	//Ne, věřím ti. A dejuji za tvou pomoc!
	AI_Output(self,other,"DIA_Urshak_OrcSavePeople_01_11");	//HUTS TAR!... Ur-Shak opravdu mluvit s duchy, příteli.
	URSHAKTELLPALADIN = TRUE;
	if(MIS_NEWSSURVIVERS == LOG_Running)
	{
		B_LogEntry(TOPIC_NEWSSURVIVERS,"Nyní je vše jasné! Paladinové vděčí za svůj život Ur-Shakovi. Prý mluvil jako šaman s duchy a ti řekli, že nesmí lidi zabít. Místní vůdce se řídil touto radou.");
	};
};


instance DIA_URSHAK_HELPSAVEPEOPLE(C_Info)
{
	npc = NONE_110_Urshak;
	nr = 6;
	condition = dia_urshak_helpsavepeople_condition;
	information = dia_urshak_helpsavepeople_info;
	permanent = FALSE;
	description = "Můžeš mi pomoci osvobodit paladiny?";
};


func int dia_urshak_helpsavepeople_condition()
{
	if(Npc_KnowsInfo(hero,dia_urshak_meetincastle) && (MIS_ORCGREATWAR == LOG_Running) && (URSHAKBECOMESHAMAN == TRUE) && (KNOWABOUTGAROND == TRUE) && (CASTLEISFREE == FALSE) && (PALADINCASTELFREE == FALSE) && (BOGNARTALK == FALSE) && (MIS_STURMCASTLE == FALSE) && (ORCLEADERISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_urshak_helpsavepeople_info()
{
	AI_Output(other,self,"DIA_Urshak_HelpSavePeople_01_01");	//Můžeš mi pomoci osvobodit paladiny?
	AI_Output(self,other,"DIA_Urshak_HelpSavePeople_01_02");	//Ur-Shak nemoci udělat to.
	AI_Output(self,other,"DIA_Urshak_HelpSavePeople_01_03");	//Jestli Ur-Shak toto udělat, bratři zabít. Ur-Shak stát mrtvý.
	AI_Output(self,other,"DIA_Urshak_HelpSavePeople_01_04");	//Ur-Shak nechce být zabit bratry.
	AI_Output(other,self,"DIA_Urshak_HelpSavePeople_01_05");	//Jasně, tomu rozumím.
	AI_Output(self,other,"DIA_Urshak_HelpSavePeople_01_06");	//Nerozumí! Člověk nemůže osvobodit lidi s Ur-Shak, ale může OSVOBODIT LIDI.
	AI_Output(self,other,"DIA_Urshak_HelpSavePeople_01_07");	//Ale sám. Ur-Shak nesmět pomoci!
	AI_Output(other,self,"DIA_Urshak_HelpSavePeople_01_08");	//Ty máš nápad? A jaký?!
	AI_Output(self,other,"DIA_Urshak_HelpSavePeople_01_09");	//Člověk by mel mluvit s vůdce pevnosti! Človek moci přesvedčit vůdce, aby pustit lidi.
	if(Npc_KnowsInfo(other,dia_orc_8566_urhan_hello))
	{
		AI_Output(other,self,"DIA_Urshak_HelpSavePeople_01_10");	//Ano, toho už jsem potkal. Co bych mu měl říci?!
	}
	else
	{
		AI_Output(other,self,"DIA_Urshak_HelpSavePeople_01_11");	//Kdo to je?!
		AI_Output(self,other,"DIA_Urshak_HelpSavePeople_01_12");	//Přece zdejší vůdce! Říkat bratrům co smět a co ne...
		AI_Output(other,self,"DIA_Urshak_HelpSavePeople_01_13");	//A co bych mu měl říci?!
	};
	AI_Output(self,other,"DIA_Urshak_HelpSavePeople_01_14");	//To, co chce slyšet, Ur-Shak nevědet.
	AI_Output(other,self,"DIA_Urshak_HelpSavePeople_01_15");	//Můžeš mi o něm říci neco více?!
	AI_Output(self,other,"DIA_Urshak_HelpSavePeople_01_16");	//Noo! Ur-Shak slyšet, že vůdce chtít vždy být skřetí král.
	AI_Output(self,other,"DIA_Urshak_HelpSavePeople_01_17");	//Pak by bratři nazývali jeho za největšího válečníka!
	AI_Output(self,other,"DIA_Urshak_HelpSavePeople_01_18");	//Jestli král zemřít, vůdce pevnosti uplatnit nárok Velkého Válečníka!
	AI_Output(self,other,"DIA_Urshak_HelpSavePeople_01_19");	//Ale on ví, že jsou tu o mnoho silnější než je on!
	AI_Output(other,self,"DIA_Urshak_HelpSavePeople_01_20");	//Takže ty chceš, abych za něj zabil krále skřetů?!
	AI_Output(self,other,"DIA_Urshak_HelpSavePeople_01_21");	//Ano! Ur-Shak myslet, že pak lidi svobodní.
	AI_Output(self,other,"DIA_Urshak_HelpSavePeople_01_22");	//Ale dobře rozmyslet, co udělat...
	AI_Output(other,self,"DIA_Urshak_HelpSavePeople_01_23");	//Jasně... A díky!
	URSHAKTELLSSECRET = TRUE;

	if(MIS_NEWSSURVIVERS == LOG_Running)
	{
		B_LogEntry(TOPIC_NEWSSURVIVERS,"Ur-Shak mi řekl jednu velmi zajímavou věc. Hag-Tar je hlavní velitel pevnosti, vždycky se chtěl stát vůdcem skřetů, ale už mají vůdce - Ur-Thralla a zatímco on je naživu, Hag-Tara nikdy nepovýší. Možná když Hag-Tarovi pomůžu v této záležitosti - později bude souhlasit s propuštěním zajatých paladinů.");
	};
};

instance DIA_Urshak_OrcLanguage(C_Info)
{
	npc = NONE_110_Urshak;
	condition = DIA_Urshak_OrcLanguage_condition;
	information = DIA_Urshak_OrcLanguage_info;
	permanent = FALSE;
	description = "Můžeš mě naučit jazyk skřetů?";
};

func int DIA_Urshak_OrcLanguage_condition()
{
	if((PlayerKnowsOrcLanguage == FALSE) && (NeedKnowOrcLang == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Urshak_OrcLanguage_info()
{
	AI_Output(other,self,"DIA_Urshak_OrcLanguage_01_01");	//Můžeš mě naučit jazyk skřetů?
	AI_Output(self,other,"DIA_Urshak_OrcLanguage_01_02");	//Hmm... (překvapen) Ale proč člověk chtít znát náš jazyk?
	AI_Output(other,self,"DIA_Urshak_OrcLanguage_01_03");	//Musím mluvit s jedním skřetem, ale nechápu vůbec jak.
	AI_Output(self,other,"DIA_Urshak_OrcLanguage_01_04");	//Ur-Shak muset pochopit lidi... Naučím přítel mluvit jazyk skřetů.
	AI_Output(self,other,"DIA_Urshak_OrcLanguage_01_05");	//Jestli mít dost zkušenosti.
};

instance DIA_Urshak_OrcLanguageTeach(C_Info)
{
	npc = NONE_110_Urshak;
	condition = DIA_Urshak_OrcLanguageTeach_condition;
	information = DIA_Urshak_OrcLanguageTeach_info;
	permanent = TRUE;
	description = "Nauč mě skřetí jazyk. (VB: 10)";
};

func int DIA_Urshak_OrcLanguageTeach_condition()
{
	if(Npc_KnowsInfo(other,DIA_Urshak_OrcLanguage) && (PlayerKnowsOrcLanguage == FALSE) && (NeedKnowOrcLang == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Urshak_OrcLanguageTeach_info()
{
	AI_Output(other,self,"DIA_Urshak_OrcLanguageTeach_01_01");	//Nauč mě skřetí jazyk.

	if(other.lp >= 10)
	{
		other.lp = other.lp - 10;
		AI_Output(self,other,"DIA_Urshak_OrcLanguageTeach_01_02");	//Dobře... Pak člověk poslouchat, co Ur-Shak říkat.
		AI_Output(self,other,"DIA_Urshak_OrcLanguageTeach_01_07");	//Skřetí jazyk nebýt moc přátelský.
		AI_Output(self,other,"DIA_Urshak_OrcLanguageTeach_01_08");	//Je to mnohem starší a krasavější.
		AI_Output(self,other,"DIA_Urshak_OrcLanguageTeach_01_09");	//Najít zde moc malých slov a málo dlouhých.
		AI_Output(self,other,"DIA_Urshak_OrcLanguageTeach_01_10");	//Každý slovo znamenat něco jiného! Když říct hodně slov, domýšlet obraz příběhu.
		AI_Output(self,other,"DIA_Urshak_OrcLanguageTeach_01_04");	//To vše, co člověk potřebovat vědět!
		AI_Output(self,other,"DIA_Urshak_OrcLanguageTeach_01_05");	//Teď moct číst a dorozumět se s námi.
		AI_Output(other,self,"DIA_Urshak_OrcLanguageTeach_01_06");	//Skvělé!
		PlayerKnowsOrcLanguage = TRUE;
		AI_Print("Naučeno: Skřetí jazyk");
		Snd_Play("LevelUP");
		Log_CreateTopic(TOPIC_Language,LOG_NOTE);
		B_LogEntry(TOPIC_Language,"Mluvím skřetím jazykem.");
	}
	else
	{
		AI_Output(self,other,"DIA_Urshak_OrcLanguageTeach_01_07");	//Chcete to provést, chybí zkušenost, člověk!
		AI_Output(self,other,"DIA_Urshak_OrcLanguageTeach_01_08");	//Vracet se později.
	};
};