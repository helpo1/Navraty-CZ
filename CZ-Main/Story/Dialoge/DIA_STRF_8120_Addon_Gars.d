
instance DIA_STRF_8120_Addon_Gars_EXIT(C_Info)
{
	npc = STRF_8120_Addon_Gars;
	nr = 999;
	condition = DIA_STRF_8120_Addon_Gars_exit_condition;
	information = DIA_STRF_8120_Addon_Gars_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};
func int DIA_STRF_8120_Addon_Gars_exit_condition()
{
	return TRUE;
};
func void DIA_STRF_8120_Addon_Gars_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_STRF_8120_Addon_Gars_PreHello(C_Info)
{
	npc = STRF_8120_Addon_Gars;
	nr = 2;
	condition = DIA_STRF_8120_Addon_Gars_PreHello_condition;
	information = DIA_STRF_8120_Addon_Gars_PreHello_info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_STRF_8120_Addon_Gars_PreHello_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_STRF_8120_Addon_Gars_PreHello_info()
{
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_PreHello_01_00");	//(mrzutě) A máme tu dalšího skřetího nohsleda.
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_PreHello_01_01");	//A jak jsi na to přišel?
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_PreHello_01_03");	//Na to by přišel každej blbec! Myslíš, že by tě jinak skřeti nechali tady volně poflakovat.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_PreHello_01_04");	//No, tak co... (nasraně) Co ode mně chceš?
};

instance DIA_STRF_8120_Addon_Gars_HELLO(C_Info)
{
	npc = STRF_8120_Addon_Gars;
	nr = 2;
	condition = DIA_STRF_8120_Addon_Gars_hello_condition;
	information = DIA_STRF_8120_Addon_Gars_hello_info;
	permanent = FALSE;
	description = "A ty jsi kdo?";
};

func int DIA_STRF_8120_Addon_Gars_hello_condition()
{
	return TRUE;
};

func void DIA_STRF_8120_Addon_Gars_hello_info()
{
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_Hello_01_00");	//A ty jsi kdo?
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Hello_01_01");	//Říkej mě jednoduše Gars. Sloužím tady skřetům, stejně jako všichni ostatní.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Hello_01_02");	//No pokud nepočítám tebe...
};

instance DIA_STRF_8120_Addon_Gars_NoOrc(C_Info)
{
	npc = STRF_8120_Addon_Gars;
	nr = 2;
	condition = DIA_STRF_8120_Addon_Gars_NoOrc_condition;
	information = DIA_STRF_8120_Addon_Gars_NoOrc_info;
	permanent = FALSE;
	description = "To se mýlíš!";
};

func int DIA_STRF_8120_Addon_Gars_NoOrc_condition()
{
	return TRUE;
};

func void DIA_STRF_8120_Addon_Gars_NoOrc_info()
{
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_NoOrc_01_00");	//To se mýlíš! Nepracuju pro skřety.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_NoOrc_01_01");	//Hmmm... (posměšně) To by mohl říci každý! Já jsem zvyklej věřit činnům, ne slovům.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_NoOrc_01_02");	//Jestli chceš aby ti lidi věřili, tak to musíš nejprve dokázat!
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_NoOrc_01_03");	//Planým řečem a slibům tady už nikdo nevěří.
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_NoOrc_01_04");	//A jak vás mám přesvědčit?
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_NoOrc_01_05");	//Něco mě napadlo.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_NoOrc_01_06");	//Stařešina Ar Dagar má klíč od skladu, kde jsou uloženy veškeré zásoby potravin.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_NoOrc_01_07");	//Přines mě ho! A postarej se aby neměl nejmenší podezření.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_NoOrc_01_08");	//Pak o tobě zmněním mínění. Ale dřív ne.
	MIS_ArDagarKey = LOG_Running;
	Log_CreateTopic(TOPIC_ArDagarKey,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ArDagarKey,LOG_Running);
	B_LogEntry(TOPIC_ArDagarKey,"Aby Gars uvěřil, že nepatřím ke skřetům musím ukrást klíč ke skladišti s potravinama.");
};

instance DIA_STRF_8120_Addon_Gars_ArDagarKey(C_Info)
{
	npc = STRF_8120_Addon_Gars;
	nr = 2;
	condition = DIA_STRF_8120_Addon_Gars_ArDagarKey_condition;
	information = DIA_STRF_8120_Addon_Gars_ArDagarKey_info;
	permanent = FALSE;
	description = "Potřebuješ klíč.";
};

func int DIA_STRF_8120_Addon_Gars_ArDagarKey_condition()
{
	if((MIS_ArDagarKey == LOG_Running) && (Npc_HasItems(other,ItKe_ArDagar) >= 1))
	{
		return TRUE;
	};
};

func void DIA_STRF_8120_Addon_Gars_ArDagarKey_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_ArDagarKey_01_00");	//Potřebuješ klíč.
	B_GiveInvItems(other,self,ItKe_ArDagar,1);
	Npc_RemoveInvItems(self,ItKe_ArDagar,1);
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_ArDagarKey_01_01");	//Hmmm... (váhavě) To je jiná věc, příteli!
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_ArDagarKey_01_02");	//Teď už věřím, že jsi náš člověk.
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_ArDagarKey_01_03");	//A proč jsi ho potřeboval?
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_ArDagarKey_01_04");	//Nemáme to tady zrovna lehké.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_ArDagarKey_01_05");	//Mnozí hladoví. A u skřetů na skladě je spousta jídla.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_ArDagarKey_01_06");	//Ani si nevšimnou, když se nějaké to jídlo ztratí.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_ArDagarKey_01_07");	//A nám kousek toho chleba přijde vhod. Rozumíš?
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_ArDagarKey_01_08");	//Samozřejmě. Hlavně, ať skřeti nic nezjistí.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_ArDagarKey_01_09");	//A jak by to mohli zjistit? (s úšklebkem) Ty se jim přece chlubit nebudeš?
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_ArDagarKey_01_10");	//Samo sebou.
	RT_Respect = RT_Respect + 1;
	MIS_ArDagarKey = LOG_Success;
	Log_SetTopicStatus(TOPIC_ArDagarKey,LOG_Success);
	B_LogEntry(TOPIC_ArDagarKey,"Přinesl jsem Grasovi klíč od skladu.");
};

instance DIA_STRF_8120_Addon_Gars_Paladin(C_Info)
{
	npc = STRF_8120_Addon_Gars;
	nr = 2;
	condition = DIA_STRF_8120_Addon_Gars_Paladin_condition;
	information = DIA_STRF_8120_Addon_Gars_Paladin_info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_STRF_8120_Addon_Gars_Paladin_condition()
{
	if(MIS_RemoveOrc == LOG_Success)
	{
		return TRUE;
	};
};

func void DIA_STRF_8120_Addon_Gars_Paladin_info()
{
	B_GivePlayerXP(150);
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Paladin_01_00");	//Hej... (drsně) To ty ses chtěl se mnou setkat?
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_Paladin_01_01");	//Ano, to jsem byl já. Jestli jsi opravdu paladin.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Paladin_01_02");	//To jsem! Říkají mě Wenzel.
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_Paladin_01_03");	//Wenzel?! Vypadá to, že jsem se nemýlil.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Paladin_01_04");	//To jsem rád. Tak co ji potřeboval?
	FindVenzel = TRUE;
	self.name[0] = "Wenzel";
	B_LogEntry(TOPIC_LostPaladins,"Našel jsem v dole paladina. Ukázalo se že je to kopáč Gars! Kdo by si to pomyslel...");
};


instance DIA_STRF_8120_Addon_Gars_Name(C_Info)
{
	npc = STRF_8120_Addon_Gars;
	nr = 2;
	condition = DIA_STRF_8120_Addon_Gars_Name_condition;
	information = DIA_STRF_8120_Addon_Gars_Name_info;
	permanent = FALSE;
	description = "Gars to není tvé skutečné jméno?";
};

func int DIA_STRF_8120_Addon_Gars_Name_condition()
{
	if(FindVenzel == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8120_Addon_Gars_Name_info()
{
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_Name_01_00");	//Znamená to že, Gars to není tvé skutečné jméno?
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Name_01_01");	//Ne. Je to prostě jméno, co mě napadlo jako první, když mě skřeti zajali.
};

instance DIA_STRF_8120_Addon_Gars_Back(C_Info)
{
	npc = STRF_8120_Addon_Gars;
	nr = 2;
	condition = DIA_STRF_8120_Addon_Gars_Back_condition;
	information = DIA_STRF_8120_Addon_Gars_Back_info;
	permanent = FALSE;
	description = "Poslal mě Garond.";
};

func int DIA_STRF_8120_Addon_Gars_Back_condition()
{
	if(FindVenzel == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8120_Addon_Gars_Back_info()
{
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_Back_01_00");	//Poslal mě Garond.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Back_01_01");	//Garond?! Ty znáš Garonda?
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_Back_01_02");	//Samozřejmě. Ukrývá se nyní v starém hradě rudobaronů.
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_Back_01_03");	//Jsou kolem dokola obklíčeni skřety, takže žádná sláva.
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_Back_01_04");	//Poslal mě, abych zjistil, co se stalo s tebou a tvým oddílem.
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_Back_01_05");	//A proto jsem teď tady!
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Back_01_06");	//Bojím se, že pro něj nemám dobré zprávy... celej oddíl padnul.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Back_01_07");	//Jen já jsem měl to štěstí a přežil, ale jsem teď zajatcem skřetů.
};

instance DIA_STRF_8120_Addon_Gars_Happen(C_Info)
{
	npc = STRF_8120_Addon_Gars;
	nr = 2;
	condition = DIA_STRF_8120_Addon_Gars_Happen_condition;
	information = DIA_STRF_8120_Addon_Gars_Happen_info;
	permanent = FALSE;
	description = "A jak se to stalo?";
};

func int DIA_STRF_8120_Addon_Gars_Happen_condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8120_Addon_Gars_Back) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8120_Addon_Gars_Happen_info()
{
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_Happen_01_00");	//A jak se to stalo?
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Happen_01_01");	//(plačtivě) Narazili jsme na jednu z jejich patrol... a v tu chvíli nás skřeti napadli ze zálohy!
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Happen_01_02");	//Už po pár minutách boje jsem měl jen polovinu mužů.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Happen_01_03");	//Když jsem viděl jak se situace vyvíjí, nakázal jsem svým mužům ústup směrem k řece.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Happen_01_04");	//Ale bylo už pozdě! Skřetů bylo stále víc a podařilo se jim odříznout nám ústupovou cestu.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Happen_01_05");	//Dostat se přes řeku jsem dokázal jenom já. 
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Happen_01_06");	//Díky Innosovi skřeti mě nepronásledovali, ale byl jsem raněn a silně jsem krvácel.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Happen_01_07");	//Dokonce jsem musel sundat zbroj, protože už jsem nedokázal unést její váhu.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Happen_01_08");	//Jediná naděje byla v tom, jestli se Garondovi podaří zaujmout obranu v hradě.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Happen_01_09");	//A já jsem se tam potřeboval dostat.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Happen_01_10");	//Ale jak vidíš, to se mě nepovedlo... Později mě skřeti stejně zajali a přivlekli sem.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Happen_01_11");	//Teď je ze mně jenom obyčejný otrok, co tady těží rudu.
};

instance DIA_STRF_8120_Addon_Gars_DontKnow(C_Info)
{
	npc = STRF_8120_Addon_Gars;
	nr = 2;
	condition = DIA_STRF_8120_Addon_Gars_DontKnow_condition;
	information = DIA_STRF_8120_Addon_Gars_DontKnow_info;
	permanent = FALSE;
	description = "Skřeti nemají podezření, že jsi paladin?";
};

func int DIA_STRF_8120_Addon_Gars_DontKnow_condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8120_Addon_Gars_Happen) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8120_Addon_Gars_DontKnow_info()
{
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_DontKnow_01_00");	//Skřeti nemají podezření, že jsi paladin?
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_DontKnow_01_01");	//Ne, myslí si že jsem jen obyčejný kopáč.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_DontKnow_01_02");	//Kdyby věděli kdo jsem, byl bych už dávno mrtví.
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_DontKnow_01_03");	//Rozumím.
};

instance DIA_STRF_8120_Addon_Gars_GetOut(C_Info)
{
	npc = STRF_8120_Addon_Gars;
	nr = 2;
	condition = DIA_STRF_8120_Addon_Gars_GetOut_condition;
	information = DIA_STRF_8120_Addon_Gars_GetOut_info;
	permanent = FALSE;
	description = "Potřebuju tě nějakým způsobem odsud dostat!";
};

func int DIA_STRF_8120_Addon_Gars_GetOut_condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8120_Addon_Gars_Back) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8120_Addon_Gars_GetOut_info()
{
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_GetOut_01_00");	//Potřebuju tě nějakým způsobem odsud dostat!
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_GetOut_01_01");	//Zajímavé... (s úšklebkem) A jak to chceš udělat?
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_GetOut_01_02");	//Myslíš, že mě skřeti jen tak propustí?!
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_GetOut_01_03");	//Ne, samozřejmě! Ale jsem si jistý, že něco vymyslím.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_GetOut_01_04");	//Poslouchej mě, příteli... (vážně) Jsem vážně poctěn tím, že jsi kvůli mě podstoupil tak dlouhou cestu.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_GetOut_01_05");	//Ale v tomdle dole jsou i ostatní vězni! Nemůžeme je tady jen tak ponechat jejich osudu.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_GetOut_01_06");	//Když zjistili, že je mezi nima paladin, tak získali naději, že se mohou zachránit.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_GetOut_01_07");	//Proto jsem teď odpovědný za jejich životy. Takže buďto půjdem všichni, nebo nikdo!
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_GetOut_01_08");	//Uvědomuješ si, že nedokážu zachránit všechny z tohodle dolu.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_GetOut_01_09");	//Tak nemá cenu o tom mluvit!
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_GetOut_01_10");	//Nikam odsud nepůjdu, dokud nebudu mít jistotu, že jsou všichni v bezpečí.
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_GetOut_01_11");	//Rozumím.
	VenzelNeedProof = TRUE;
	OrcDoneWalArDagar = TRUE;
	B_LogEntry(TOPIC_LostPaladins,"Dokonce i když najdu způsob, jak zachránit Wenzela, nechce opustit důl dokud se neujistí, že ostatní otroci jsou v bezpečí.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(STRF_8120_Addon_Gars,"Start");
};

instance DIA_STRF_8120_Addon_Gars_Teleport(C_Info)
{
	npc = STRF_8120_Addon_Gars;
	nr = 2;
	condition = DIA_STRF_8120_Addon_Gars_Teleport_condition;
	information = DIA_STRF_8120_Addon_Gars_Teleport_info;
	permanent = FALSE;
	description = "Někde tady musí být magický portál.";
};

func int DIA_STRF_8120_Addon_Gars_Teleport_condition()
{
	if(MIS_MineTeleport == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_STRF_8120_Addon_Gars_Teleport_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_Teleport_01_00");	//Někde tady musí být magický portál.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Teleport_01_01");	//Portál? Jak jsi na něco takového přišel?!
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_Teleport_01_02");	//Crow přeložil starou tabulku, kterou Nuts našel v dole.
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_Teleport_01_03");	//Píše se tam o jeho existenci.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Teleport_01_04");	//Hmmm... (zamyšleně) Já bych do toho nevkládal tolik nadějí.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Teleport_01_05");	//Ani nevíme kdo to psal!
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_Teleport_01_06");	//Ale jestli je to pravda, tak je to šance na záchranu.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Teleport_01_07");	//To máš pravdu, příteli. V tom ti nebudu oponovat.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Teleport_01_08");	//Teď musíme získat veškeré informace s tím spojené!
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Teleport_01_09");	//Jestli portál opravdu existuje, tak se určitě nachází v nižších patrech dolu.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Teleport_01_10");	//A tam skřeti nikoho nepouští. Povídá se, že se tam usídlilo strašné zlo.
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_Teleport_01_11");	//Takže, nejdřív vám budu muset vyčistit cestu.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Teleport_01_12");	//To jsi dobře pochopil... (vážně) Ale chápeš, že je to jen na tobě.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Teleport_01_13");	//Nemůžem riskovat životy ostatních lidí.
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_Teleport_01_14");	//Na to si asi budu muset zvyknout.
	B_LogEntry_Quiet(TOPIC_MineTeleport,"Řekl jsem o portálu Wenzelovi. Podle jeho názoru, je portál umístěn v nižších patrech dolu. Teď se tam jen nějak dostat.");	
};

instance DIA_STRF_8120_Addon_Gars_TeleportFind(C_Info)
{
	npc = STRF_8120_Addon_Gars;
	nr = 2;
	condition = DIA_STRF_8120_Addon_Gars_TeleportFind_condition;
	information = DIA_STRF_8120_Addon_Gars_TeleportFind_info;
	permanent = FALSE;
	description = "Byl jsem v nižších patrech dolu.";
};

func int DIA_STRF_8120_Addon_Gars_TeleportFind_condition()
{
	if((MIS_MineTeleport == LOG_Running) && (Npc_HasItems(other,ItMi_PortalCrystal) >= 1))
	{
		return TRUE;
	};
};

func void DIA_STRF_8120_Addon_Gars_TeleportFind_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_TeleportFind_01_00");	//Byl jsem v nižších patrech dolu.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_TeleportFind_01_01");	//Tak co jsi zjistil?
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_TeleportFind_01_02");	//Vypadá to, že se mě opravdu podařilo najít něco jako magický portál.
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_TeleportFind_01_03");	//A u něho tenhle podivný kámen.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_TeleportFind_01_04");	//Hmmm... (zamyšleně) Tento předmět velmi připomíná ohniskový kámen, který obvykle používají mágové.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_TeleportFind_01_05");	//Zkus ho odnést Crowovi! Možná ti o něm něco řekne.
	B_LogEntry_Quiet(TOPIC_MineTeleport,"Řekl jsem Wenzelovi, že jsem v dole objevil něco vzdáleně připomínající portál a podivný kámen. Podle Wenzela ten předmět vypadá jako ohniskový kámen. Doporučil mě abych ho zanesl Crowovi.");	
	SendPortalKrow = TRUE;
};

instance DIA_STRF_8120_Addon_Gars_NeedWeapons(C_Info)
{
	npc = STRF_8120_Addon_Gars;
	nr = 2;
	condition = DIA_STRF_8120_Addon_Gars_NeedWeapons_condition;
	information = DIA_STRF_8120_Addon_Gars_NeedWeapons_info;
	permanent = FALSE;
	description = "Mluvil jsem s Crowem.";
};

func int DIA_STRF_8120_Addon_Gars_NeedWeapons_condition()
{
	if(MIS_MineTeleport == LOG_Success)
	{
		return TRUE;
	};
};

func void DIA_STRF_8120_Addon_Gars_NeedWeapons_info()
{
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_NeedWeapons_01_00");	//Mluvil jsem s Crowem.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_NeedWeapons_01_01");	//(vážně) A co on říkal?
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_NeedWeapons_01_02");	//Popravdě, že jsi měl pravdu. Je to určitě magický aktivátor.
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_NeedWeapons_01_03");	//A jak to tak vypadá, s jeho pomocí bude možné ten portál aktivovat.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_NeedWeapons_01_04");	//To jsou dobré zprávy! Blahopřeju ti, teď máme reálnou šanci všechny zachránit!
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_NeedWeapons_01_05");	//Ale to ještě není všechno. Podle Crowa, portál může vést třeba i na pevninu.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_NeedWeapons_01_06");	//(překvapeně) Na pevninu? Věříš tomu?
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_NeedWeapons_01_07");	//Na samotném ohnisku je signatura královského řádu mágů Ohně.
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_NeedWeapons_01_08");	//Podle toho soudím, že by to tak mohlo být.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_NeedWeapons_01_09");	//Znamená to, na Myrtanu... (zamyšleně) Už jsem si myslel, že ji více neuvidím.
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_NeedWeapons_01_10");	//Tobě se stýská?
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_NeedWeapons_01_11");	//Ne, jakby mohlo... (nostalgicky) Vždyť se tam nachází můj domov. Zrovna tak, jako mnohých těch, co jsem přišli s lordem Hagenem.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_NeedWeapons_01_12");	//No dobře, je pěkné si zavzpomínat, ale na to teď nemáme čas.
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_NeedWeapons_01_13");	//Crow říkal, že budeš vědět, co dělat dál.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_NeedWeapons_01_14");	//Je to jednoduché. Vezmu si organizaci lidí na sebe.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_NeedWeapons_01_15");	//Ale nejdřív se musíme pořádně připravit na útěku.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_NeedWeapons_01_16");	//Potřebujeme normální zbraně a dostatek potravy.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_NeedWeapons_01_17");	//Bez toho, bude naše akce už od začátku odsouzena k neůspěchu.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_NeedWeapons_01_18");	//Kromě toho by bylo dobré, kdybys mi přinesl moji zbroj a meč.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_NeedWeapons_01_19");	//Jestli budem nuceni bojovat, tak to může zachránit nejeden život!
	B_LogEntry(TOPIC_EscapeMine,"Wenzel je připraven vést vzpouru a pomoct uniknout všem vězňům. Chce využít vhodný okamžik a dostat lidi přes magický portál pryč! Ale nejdřív se musíme připravit, pro případ, že budem nuceni bojovat.");
};

instance DIA_STRF_8120_Addon_Gars_Weapons(C_Info)
{
	npc = STRF_8120_Addon_Gars;
	nr = 2;
	condition = DIA_STRF_8120_Addon_Gars_Weapons_condition;
	information = DIA_STRF_8120_Addon_Gars_Weapons_info;
	permanent = FALSE;
	description = "Kolik zbraní potřebuješ?";
};

func int DIA_STRF_8120_Addon_Gars_Weapons_condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8120_Addon_Gars_NeedWeapons) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8120_Addon_Gars_Weapons_info()
{
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_Weapons_01_00");	//Kolik zbraní potřebuješ?
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Weapons_01_01");	//Když veme v potaz kolik nás je, tak dva tucty by mohli stačit. Budou stačit obyčejné.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Weapons_01_02");	//Rozdám je mezi vězně těsně než vyrazíme.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Weapons_01_03");	//Dřív by to bylo nebezpečné, skřeti by mohli něco vytušit.
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_Weapons_01_04");	//Rozumím.
	MIS_GarsWeapons = LOG_Running;
	Log_CreateTopic(TOPIC_GarsWeapons,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GarsWeapons,LOG_Running);
	B_LogEntry(TOPIC_GarsWeapons,"Na vyzbrojení vězňů potřebuje Wenzel dva tucty obyčejných zbraní.");
};

instance DIA_STRF_8120_Addon_Gars_WeaponsDone(C_Info)
{
	npc = STRF_8120_Addon_Gars;
	nr = 2;
	condition = DIA_STRF_8120_Addon_Gars_WeaponsDone_condition;
	information = DIA_STRF_8120_Addon_Gars_WeaponsDone_info;
	permanent = FALSE;
	description = "Přinesl jsem ti zbraně.";
};

func int DIA_STRF_8120_Addon_Gars_WeaponsDone_condition()
{
	if((MIS_GarsWeapons == LOG_Running) && (Npc_HasItems(other,ItMw_1H_Common_01) >= 20))
	{
		return TRUE;
	};
};

func void DIA_STRF_8120_Addon_Gars_WeaponsDone_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_WeaponsDone_01_00");	//Přinesl jsem ti zbraně.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_WeaponsDone_01_01");	//(potichu) Potichu, příteli... Jestli nás skřeti uslyší tak přijdem o hlavy!
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_WeaponsDone_01_02");	//Dej to sem. Schovám to tady na tom odlehlém místě.
	B_GiveInvItems(other,self,ItMw_1H_Common_01,20);
	Npc_RemoveInvItems(self,ItMw_1H_Common_01,20);
	MIS_GarsWeapons = LOG_Success;
	Log_SetTopicStatus(TOPIC_GarsWeapons,LOG_Success);
	B_LogEntry(TOPIC_GarsWeapons,"Přinesl jsem Wenzelovi zbraně.");
};

instance DIA_STRF_8120_Addon_Gars_Food(C_Info)
{
	npc = STRF_8120_Addon_Gars;
	nr = 2;
	condition = DIA_STRF_8120_Addon_Gars_Food_condition;
	information = DIA_STRF_8120_Addon_Gars_Food_info;
	permanent = FALSE;
	description = "Kolk jídla bude potřeba?";
};

func int DIA_STRF_8120_Addon_Gars_Food_condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8120_Addon_Gars_NeedWeapons) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8120_Addon_Gars_Food_info()
{
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_Food_01_00");	//Kolk jídla budepotřeba?
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Food_01_01");	//Hmm, popřemýšlím... (vážně) Tak 20 láhví vody a 50 kusů masa by mohlo stačit.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Food_01_02");	//Ale pečeného. Nechci aby v klíčovej moment někdo z lidí dostal křeče do žaludku.
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_Food_01_03");	//A není to málo?
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Food_01_04");	//Ne, je to tak akorát... (přísně) Pro začátek nám to bude stačit. Kromě toho velký náklad by nás zpomaloval.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Food_01_05");	//No a ostatní je už v rukách Innose!
	MIS_GarsFood = LOG_Running;
	Log_CreateTopic(TOPIC_GarsFood,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GarsFood,LOG_Running);
	B_LogEntry(TOPIC_GarsFood,"Jako proviant potřebuje Wenzel 20 láhví vody a 50 kusů pečného masa.");
};

instance DIA_STRF_8120_Addon_Gars_FoodDone(C_Info)
{
	npc = STRF_8120_Addon_Gars;
	nr = 2;
	condition = DIA_STRF_8120_Addon_Gars_FoodDone_condition;
	information = DIA_STRF_8120_Addon_Gars_FoodDone_info;
	permanent = FALSE;
	description = "Přinesl jsem jídlo.";
};

func int DIA_STRF_8120_Addon_Gars_FoodDone_condition()
{
	if((MIS_GarsFood == LOG_Running) && (Npc_HasItems(other,ItFoMutton) >= 50) && (Npc_HasItems(other,ItFo_Water) >= 20))
	{
		return TRUE;
	};
};

func void DIA_STRF_8120_Addon_Gars_FoodDone_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_FoodDone_01_00");	//Přinesl jsem jídlo.
	B_GiveInvItemsManyThings(other,self);
	Npc_RemoveInvItems(other,ItFoMutton,50);
	Npc_RemoveInvItems(other,ItFo_Water,20);
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_FoodDone_01_01");	//Výborně, příteli. Bez něho by to bylo opravdu těžké.
	MIS_GarsFood = LOG_Success;
	Log_SetTopicStatus(TOPIC_GarsFood,LOG_Success);
	B_LogEntry(TOPIC_GarsFood,"Přinesl jsem Wenzelovi potřebné množství potravin.");
};

instance DIA_STRF_8120_Addon_Gars_Armor(C_Info)
{
	npc = STRF_8120_Addon_Gars;
	nr = 2;
	condition = DIA_STRF_8120_Addon_Gars_Armor_condition;
	information = DIA_STRF_8120_Addon_Gars_Armor_info;
	permanent = FALSE;
	description = "Kde mám hledat tvoji zbroj a meč?";
};

func int DIA_STRF_8120_Addon_Gars_Armor_condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8120_Addon_Gars_NeedWeapons) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8120_Addon_Gars_Armor_info()
{
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_Armor_01_00");	//Kde mám hledat tvoji zbroj a meč?
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Armor_01_01");	//Než mě skřeti chytili, schoval jsem je v jeskyni pod vodopádem.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Armor_01_02");	//Ne že ji budeš skoušet obléknout!
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_Armor_01_03");	//A to proč?
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Armor_01_04");	//(hrdě) Moje zbroj je posvěcena slzami samotného Innose.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Armor_01_05");	//Když se ji pokusíš obléci, umřeš bolestivou smrtí! A to se týká i meče...
	MIS_GarsArmor = LOG_Running;
	Log_CreateTopic(TOPIC_GarsArmor,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GarsArmor,LOG_Running);
	B_LogEntry(TOPIC_GarsArmor,"Před tím než skřeti zajali Wenzela, ukryl svoji zbroji i meč v jeskyni pod vodopádem.");
};

instance DIA_STRF_8120_Addon_Gars_ArmorDone(C_Info)
{
	npc = STRF_8120_Addon_Gars;
	nr = 2;
	condition = DIA_STRF_8120_Addon_Gars_ArmorDone_condition;
	information = DIA_STRF_8120_Addon_Gars_ArmorDone_info;
	permanent = FALSE;
	description = "Tady máš, svoji zbroj a meč.";
};

func int DIA_STRF_8120_Addon_Gars_ArmorDone_condition()
{
	if((MIS_GarsArmor == LOG_Running) && (Npc_HasItems(other,ItMw_1H_Blessed_Venzel) >= 1) && (Npc_HasItems(other,ITAR_PAL_H_V2_VENZEL) >= 1))
	{
		return TRUE;
	};
};

func void DIA_STRF_8120_Addon_Gars_ArmorDone_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_ArmorDone_01_00");	//Tady máš, svoji zbroj a meč.
	B_GiveInvItemsManyThings(other,self);
	Npc_RemoveInvItems(other,ItMw_1H_Blessed_Venzel,1);
	Npc_RemoveInvItems(other,ITAR_PAL_H_V2_VENZEL,1);
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_ArmorDone_01_01");	//Hmmm... (s respektem) Po pravdě řečeno, nedoufal jsem, že si s tím vším poradíš.
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_ArmorDone_01_02");	//Nebylo to složité. Přece jsi mě popsal, kde je mám hledat.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_ArmorDone_01_03");	//Tak to jsem se strachoval zbytečně.
	MIS_GarsArmor = LOG_Success;
	Log_SetTopicStatus(TOPIC_GarsArmor,LOG_Success);
	B_LogEntry(TOPIC_GarsArmor,"Vrátil jsem Wenzelovi je zbroj a meč.");
};

instance DIA_STRF_8120_Addon_Gars_Buy(C_Info)
{
	npc = STRF_8120_Addon_Gars;
	nr = 2;
	condition = DIA_STRF_8120_Addon_Gars_Buy_condition;
	information = DIA_STRF_8120_Addon_Gars_Buy_info;
	permanent = FALSE;
	description = "Nic víc nepotřebuješ?";
};

func int DIA_STRF_8120_Addon_Gars_Buy_condition()
{
	if((MIS_GarsArmor == LOG_Success) && (MIS_GarsFood == LOG_Success) && (MIS_GarsWeapons == LOG_Success))
	{
		return TRUE;
	};
};

func void DIA_STRF_8120_Addon_Gars_Buy_info()
{
	B_GivePlayerXP(2000);
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_Buy_01_00");	//Nic víc nepotřebuješ?
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Buy_01_01");	//Myslím, že ne... (vážně) Vše potřebné k útěku, už je zařízené.
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_Buy_01_02");	//Dobře, tak co dál?
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Buy_01_03");	//Teď už jen vyčkáme na vhodný okamžik a co nejdřív odsud vypadnem.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Buy_01_04");	//Víš... (zamyšleně) Přemýšlel jsem, že už se možná neuvidíme.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Buy_01_05");	//Proto bych ti chtěl poděkovat, za tvoji pomoc!
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Buy_01_06");	//Pro všechny z nás byla nedocenitelná. 
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Buy_01_07");	//Zachránil jsi mnoho lidských životů, což je cenější než vše ostatní.
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_Buy_01_08");	//Dobře se to poslouch. A co Garond? 
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Buy_01_09");	//Vyřiď mu, že už se nevrátím do Hornického údolí.
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_Buy_01_10");	//A co budeš dělat?
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Buy_01_11");	//Vydám se do Myrtany abych mohl dál bojovat se skřety.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Buy_01_12");	//Koneckonců situace tam není lepší než tady! Král potřebuje každého muže co umí držet meč.
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_Buy_01_13");	//Dobře, tak já mu to vyřídím.
	AI_Output(self,other,"DIA_STRF_8120_Addon_Gars_Buy_01_14");	//Tak sbohem! Ať tě Innos stále doprovází...
	MIS_EscapeMine = LOG_Success;
	Log_SetTopicStatus(TOPIC_EscapeMine,LOG_Success);
	B_LogEntry(TOPIC_EscapeMine,"Teď už mají vězni osud ve vlastních rukou, pomohl jsem ji, jak jen jsem mohl...");
	AI_StopProcessInfos(self);
};

//--------------------------------Khart--------------------------------------

instance DIA_STRF_8146_Hart_EXIT(C_Info)
{
	npc = STRF_8146_Hart;
	nr = 999;
	condition = DIA_STRF_8146_Hart_exit_condition;
	information = DIA_STRF_8146_Hart_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_STRF_8146_Hart_exit_condition()
{
	return TRUE;
};

func void DIA_STRF_8146_Hart_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_STRF_8146_Hart_HELLO(C_Info)
{
	npc = STRF_8146_Hart;
	nr = 2;
	condition = DIA_STRF_8146_Hart_hello_condition;
	information = DIA_STRF_8146_Hart_hello_info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_STRF_8146_Hart_hello_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_STRF_8146_Hart_hello_info()
{
	AI_Output(self,other,"DIA_STRF_8146_Hart_Hello_01_00");	//(udiveně) Hej příteli! Jak ses sem dostal?
	AI_Output(other,self,"DIA_STRF_8146_Hart_Hello_01_01");	//Chcy se tě na něco zeptat.
	AI_Output(self,other,"DIA_STRF_8146_Hart_Hello_01_02");	//Nejsem zde z vlastní vůle. Jak vidíš.
	AI_Output(self,other,"DIA_STRF_8146_Hart_Hello_01_03");	//Ale ty - to je něco jiného. Jaktože tě sem skřeti pustili?
	AI_Output(other,self,"DIA_STRF_8146_Hart_Hello_01_04");	//Na to se jich zeptej sám.
	AI_Output(self,other,"DIA_STRF_8146_Hart_Hello_01_05");	//Myslím, že nezeptám... raději se s nimi nemluvím, když nemusím.
	AI_Output(self,other,"DIA_STRF_8146_Hart_Hello_01_06");	//Jsou velmi nevyzpytatelní! Když se jim něco nelíbí hned sahají po své sekeře.
	AI_Output(self,other,"DIA_STRF_8146_Hart_Hello_01_07");	//A já zbytečné potíže nepotřebuju!
};

instance DIA_STRF_8146_Hart_About(C_Info)
{
	npc = STRF_8146_Hart;
	nr = 2;
	condition = DIA_STRF_8146_Hart_About_condition;
	information = DIA_STRF_8146_Hart_About_info;
	permanent = FALSE;
	description = "Co tady děláš?";
};

func int DIA_STRF_8146_Hart_About_condition()
{
	return TRUE;
};

func void DIA_STRF_8146_Hart_About_info()
{
	AI_Output(other,self,"DIA_STRF_8146_Hart_About_01_00");	//Co tady děláš?
	AI_Output(self,other,"DIA_STRF_8146_Hart_About_01_01");	//Jsem něco jako gladiátor, bojuju tady v aréně pro pobavení skřetů.
	AI_Output(self,other,"DIA_STRF_8146_Hart_About_01_02");	//Téhle cti se mě dostalo tak, že jsem zaprodal vlastní život.
	AI_Output(other,self,"DIA_STRF_8146_Hart_About_01_03");	//Zajímavé. Většinou skřeti nemají lidi příliš v lásce.
	AI_Output(other,self,"DIA_STRF_8146_Hart_About_01_04");	//Proč tě nezabili?
	AI_Output(self,other,"DIA_STRF_8146_Hart_About_01_05");	//To je dlouhá historie... Byl jsem tenkrát osobní strážce jednoho rudobarona.
	AI_Output(self,other,"DIA_STRF_8146_Hart_About_01_06");	//Jednou při lovu jsme padli do léčky těmdle zelenokožců.
	AI_Output(self,other,"DIA_STRF_8146_Hart_About_01_07");	//Bojovali jsme statečně, ale skřetů bylo víc než nás.
	AI_Output(self,other,"DIA_STRF_8146_Hart_About_01_08");	//Předtím než mě přemohli, tak jse jich tucet zabil!
	AI_Output(self,other,"DIA_STRF_8146_Hart_About_01_09");	//(hrdě) Bojoval jsem do samého konce! Zoufalej! S vědomím, že smrt už je nablízku.
	AI_Output(self,other,"DIA_STRF_8146_Hart_About_01_10");	//A když mě úder jednoho ze skřetů srazil k zemi, tak jsem se pomalu loučil se svým životem...
	AI_Output(self,other,"DIA_STRF_8146_Hart_About_01_11");	//... ukázalo se, že si mě všimnul jeden z jejich náčelníků!
	AI_Output(self,other,"DIA_STRF_8146_Hart_About_01_12");	//Skřeti respektují své protivníky, pokud jsou silní a odvážní bojovníci.
	AI_Output(self,other,"DIA_STRF_8146_Hart_About_01_13");	//Ten náčelník se jmenoval Ur Kahn. Přivedl mě sem do skřetího města a udělal ze mně válečníka v aréně.
	AI_Output(self,other,"DIA_STRF_8146_Hart_About_01_14");	//A teď do konce svých dnů jsem povinen splácet mu svůj dluh.
	AI_Output(other,self,"DIA_STRF_8146_Hart_About_01_15");	//A co mu dlužíš?
	AI_Output(self,other,"DIA_STRF_8146_Hart_About_01_16");	//Jak co? Svůj život... (směje se) Jenom ten, příteli!
	AI_Output(other,self,"DIA_STRF_8146_Hart_About_01_17");	//Jasně.
};

instance DIA_STRF_8146_Hart_Arena(C_Info)
{
	npc = STRF_8146_Hart;
	nr = 2;
	condition = DIA_STRF_8146_Hart_Arena_condition;
	information = DIA_STRF_8146_Hart_Arena_info;
	permanent = FALSE;
	description = "Řekni mě něco o aréně.";
};

func int DIA_STRF_8146_Hart_Arena_condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8146_Hart_About) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8146_Hart_Arena_info()
{
	AI_Output(other,self,"DIA_STRF_8146_Hart_Arena_01_00");	//Řekni mě něco o aréně.
	AI_Output(self,other,"DIA_STRF_8146_Hart_Arena_01_01");	//Co chceš vědět? To má na starost Ur Kahn.
	AI_Output(self,other,"DIA_STRF_8146_Hart_Arena_01_02");	//Jestli chceš bojovat tak zajdi za ním.
	AI_Output(self,other,"DIA_STRF_8146_Hart_Arena_01_03");	//V podstatě všichni bojovníci jsou skřeti. Nejsilnější z nich je Umrak!
	AI_Output(self,other,"DIA_STRF_8146_Hart_Arena_01_04");	//Ale nedoporučuju ti s ním bojovat, tenhle černý skřet je čertovsky silnej.
	AI_Output(self,other,"DIA_STRF_8146_Hart_Arena_01_05");	//Někteří říkají, že se ho sám Ur Kahn bojí.
	AI_Output(self,other,"DIA_STRF_8146_Hart_Arena_01_06");	//A to je vše. S ostatním tě seznámí sám Ur Kahn.
	AI_Output(other,self,"DIA_STRF_8146_Hart_Arena_01_07");	//Dobře, díky.
	KnowAboutUmrak = TRUE;
};

instance DIA_STRF_8146_Hart_Escape(C_Info)
{
	npc = STRF_8146_Hart;
	nr = 2;
	condition = DIA_STRF_8146_Hart_Escape_condition;
	information = DIA_STRF_8146_Hart_Escape_info;
	permanent = FALSE;
	description = "Nezkoušel jsi odsud utéct?";
};

func int DIA_STRF_8146_Hart_Escape_condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8146_Hart_About) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8146_Hart_Escape_info()
{
	AI_Output(other,self,"DIA_STRF_8146_Hart_Escape_01_00");	//Nezkoušel jsi odsud utéct?
	AI_Output(self,other,"DIA_STRF_8146_Hart_Escape_01_01");	//Ha! Hrabe ti? (chechtá se) Tady takový kousky neprocházej.
	AI_Output(self,other,"DIA_STRF_8146_Hart_Escape_01_02");	//Tohle je město skřetů, příteli! Zde jsou stráže téměř všude.
	AI_Output(self,other,"DIA_STRF_8146_Hart_Escape_01_03");	//Jediná možnost jak se odsud dostat, je stát se absolutním šampiónem arény.
	AI_Output(self,other,"DIA_STRF_8146_Hart_Escape_01_04");	//To znamená bojovat s Umrakem, a to je skoro jistá smrt!
};

instance DIA_STRF_8146_Hart_Duel(C_Info)
{
	npc = STRF_8146_Hart;
	nr = 2;
	condition = DIA_STRF_8146_Hart_Duel_condition;
	information = DIA_STRF_8146_Hart_Duel_info;
	permanent = FALSE;
	description = "Můžu tě vyzvat na souboj?";
};

func int DIA_STRF_8146_Hart_Duel_condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8146_Hart_Arena) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8146_Hart_Duel_info()
{
	AI_Output(other,self,"DIA_STRF_8146_Hart_Duel_01_00");	//Můžu tě vyzvat na souboj?
	AI_Output(self,other,"DIA_STRF_8146_Hart_Duel_01_01");	//Když bude Ur Kahn souhlasit.
	AI_Output(self,other,"DIA_STRF_8146_Hart_Duel_01_02");	//Vše se tu děje s jeho požehnáním. Ne jinak!
};

instance DIA_STRF_8146_Hart_Help(C_Info)
{
	npc = STRF_8146_Hart;
	nr = 2;
	condition = DIA_STRF_8146_Hart_Help_condition;
	information = DIA_STRF_8146_Hart_Help_info;
	permanent = FALSE;
	description = "Můžu ti s něčím pomoct?";
};

func int DIA_STRF_8146_Hart_Help_condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8146_Hart_Escape) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8146_Hart_Help_info()
{
	AI_Output(other,self,"DIA_STRF_8146_Hart_Help_01_00");	//Můžu ti s něčím pomoct?
	AI_Output(self,other,"DIA_STRF_8146_Hart_Help_01_01");	//Hmmm... (zamyšleně) No, šikla by se mě nová zbraň.
	AI_Output(self,other,"DIA_STRF_8146_Hart_Help_01_02");	//Ty skřetí zbraně jsou trochu těžké pro někoho jako jsem já.
	AI_Output(self,other,"DIA_STRF_8146_Hart_Help_01_03");	//Sice jsem se je už naučil používat, ale s našima zbraněma dovedu bojovat o poznání lépe.
	AI_Output(other,self,"DIA_STRF_8146_Hart_Help_01_04");	//Jakou zbraň bys potřeboval?
	AI_Output(self,other,"DIA_STRF_8146_Hart_Help_01_05");	//Ach... (nostalgicky) Kdybys mi tak mohl přinést můj starý meč.
	AI_Output(self,other,"DIA_STRF_8146_Hart_Help_01_06");	//Ukázal bych těm bestiím, jak dokážou bojovat lidi!
	AI_Output(other,self,"DIA_STRF_8146_Hart_Help_01_07");	//A kde ho mám hledat?
	AI_Output(self,other,"DIA_STRF_8146_Hart_Help_01_08");	//Nedokážu říct, příteli... (smutně) Ten den jsem nechal svůj meč místnímu kováři, aby mě ho trochu nabrousil.
	AI_Output(self,other,"DIA_STRF_8146_Hart_Help_01_10");	//A pak jsem se ocitl tady! Co se stalo s mým mečem to ví jen Beliar
	AI_Output(self,other,"DIA_STRF_8146_Hart_Help_01_11");	//Možná že je pořád na hradě, a taky je možné že už si ho někdo přivlastnil.
	AI_Output(self,other,"DIA_STRF_8146_Hart_Help_01_12");	//Byl to opravdu prvotřídní meč!
	MIS_HartSword = LOG_Running;
	Log_CreateTopic(TOPIC_HartSword,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HartSword,LOG_Running);
	B_LogEntry(TOPIC_HartSword,"Hart musí bojovat v aréně se skřetíma zbraněma, šiknul by se mu jeho starý meč. V době kdy ho zajali skřeti, nechal svůj meč u kováře a teď nemá tušení kde může být.");
};

instance DIA_STRF_8146_Hart_HelpDone(C_Info)
{
	npc = STRF_8146_Hart;
	nr = 2;
	condition = DIA_STRF_8146_Hart_HelpDone_condition;
	information = DIA_STRF_8146_Hart_HelpDone_info;
	permanent = FALSE;
	description = "Je to tvůj meč?";
};

func int DIA_STRF_8146_Hart_HelpDone_condition()
{
	if((MIS_HartSword == LOG_Running) && (Npc_HasItems(hero,ItMw_HartSword) >= 1))
	{
		return TRUE;
	};
};

func void DIA_STRF_8146_Hart_HelpDone_info()
{
	B_GivePlayerXP(350);
	AI_Output(other,self,"DIA_STRF_8146_Hart_HelpDone_01_00");	//Je to tvůj meč?
	B_GiveInvItems(other,self,ItMw_HartSword,1);
	AI_Output(self,other,"DIA_STRF_8146_Hart_HelpDone_01_01");	//Nevěřím svým očím! Kde jsi ho našel?
	AI_Output(other,self,"DIA_STRF_8146_Hart_HelpDone_01_02");	//Ve skladě, ve starém hradu rudobaronů.
	AI_Output(other,self,"DIA_STRF_8146_Hart_HelpDone_01_03");	//Podle všeho, si ho tam nikdo nevšimnul.
	AI_Output(self,other,"DIA_STRF_8146_Hart_HelpDone_01_04");	//Cože, tím lépe pro mě... (směje se)
	AI_UnequipWeapons(self);
	Npc_RemoveInvItems(self,ItMw_2H_OrcAxe_01,Npc_HasItems(self,ItMw_2H_OrcAxe_01));
	AI_EquipBestMeleeWeapon(self);
	AI_ReadyMeleeWeapon(self);
	AI_PlayAni(self,"T_1HSINSPECT");
	AI_Output(self,other,"DIA_STRF_8146_Hart_HelpDone_01_05");	//Můj starý příteli! Tvá rukojeť sedí v mé ruce stejně jako tenkrát.
	AI_RemoveWeapon(self);
	AI_Output(self,other,"DIA_STRF_8146_Hart_HelpDone_01_06");	//Děkuji ti, příteli! Ani si nedokážeš představit jak důležité to pro mě je.
	AI_Output(other,self,"DIA_STRF_8146_Hart_HelpDone_01_07");	//No co, rád jsem pomohl.
	AI_Output(self,other,"DIA_STRF_8146_Hart_HelpDone_01_08");	//Víš, nemám nic čím bych se ti mohl odvděčit.
	AI_Output(self,other,"DIA_STRF_8146_Hart_HelpDone_01_09");	//Tak tě aspoň naučím svůj oblíbený trik, ten ti vylepší tvé dovednosti s jednoručními zbraněmi.
	AI_Output(self,other,"DIA_STRF_8146_Hart_HelpDone_01_10");	//Mnozí skočili na ten trik a to je stálo život! No jak to jde?
	MIS_HartSword = LOG_Success;
	Log_SetTopicStatus(TOPIC_HartSword,LOG_Success);
	B_LogEntry(TOPIC_HartSword,"Přinesl jsem Hartovi jeho meč.");
	Info_ClearChoices(DIA_STRF_8146_Hart_HelpDone);
	Info_AddChoice(DIA_STRF_8146_Hart_HelpDone,"Dohodnuto!",DIA_STRF_8146_Hart_HelpDone_Ok);
};

func void DIA_STRF_8146_Hart_HelpDone_Ok()
{
	var string concatText;

	AI_Output(other,self,"DIA_STRF_8146_Hart_HelpDone_Ok_01_00");	//Dohodnuto!
	AI_Output(self,other,"DIA_STRF_8146_Hart_HelpDone_Ok_01_01");	//Dobře. Teď pozorně poslouchej.
	AI_Output(self,other,"DIA_STRF_8146_Hart_HelpDone_Ok_01_02");	//Při souboji s mečem, zkus využít sílu protivníka ve svůj prospěch.
	AI_Output(self,other,"DIA_STRF_8146_Hart_HelpDone_Ok_01_03");	//Když uskuteční svůj další výpad, nesnaž se ho zablokovat.
	AI_Output(self,other,"DIA_STRF_8146_Hart_HelpDone_Ok_01_04");	//Vyhni se úderu do strany a proveď protiútok.
	AI_Output(self,other,"DIA_STRF_8146_Hart_HelpDone_Ok_01_05");	//Ve skutečnosti nic dalšího dělat nemusíš, tvůj protivník se sám napíchne na tvůj meč.
	AI_Output(self,other,"DIA_STRF_8146_Hart_HelpDone_Ok_01_06");	//No jak, zapamatoval sis to?
	AI_Output(other,self,"DIA_STRF_8146_Hart_HelpDone_Ok_01_07");	//Ano, vše mě je jasné.
	B_RaiseFightTalent_Bonus(other,NPC_TALENT_1H,2);
	concatText = ConcatStrings(PRINT_Learn1H," + ");
	concatText = ConcatStrings(concatText,IntToString(2));
	concatText = ConcatStrings(concatText," (Dovednost: ");
	concatText = ConcatStrings(concatText,IntToString(hero.HitChance[NPC_TALENT_1H]));
	concatText = ConcatStrings(concatText,"%)");
	AI_Print(concatText);
	Snd_Play("Levelup");
};

instance DIA_STRF_8146_Hart_Fight(C_Info)
{
	npc = STRF_8146_Hart;
	condition = DIA_STRF_8146_Hart_Fight_condition;
	information = DIA_STRF_8146_Hart_Fight_info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_STRF_8146_Hart_Fight_condition()
{
	if((ArenaBattle_04 == TRUE) && (ArenaBattle_04_Won == FALSE) && (ArenaBattle_04_Lost == FALSE) && (HartIsFight == FALSE) && (Npc_GetDistToWP(hero,"ORC_CITY_ARENA_HERO") < 150) && (Npc_GetDistToWP(self,"ORC_CITY_ARENA_01") < 200))
	{
		return TRUE;
	};
};

func void DIA_STRF_8146_Hart_Fight_info()
{
	Wld_SendTrigger("EVT_ORCARENA_01");
	AI_ReadyMeleeWeapon(self);
	AI_Output(self,other,"DIA_STRF_8146_Hart_Fight_01_01");	//No, kamaráde... (usměje se) Ukaž mi, co dokážeš!
	HartIsFight = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,0);
};

var int HartTeach;

instance DIA_STRF_8146_Hart_Teach(C_Info)
{
	npc = STRF_8146_Hart;
	nr = 2;
	condition = DIA_STRF_8146_Hart_Teach_condition;
	information = DIA_STRF_8146_Hart_Teach_info;
	permanent = TRUE;
	description = "Můžeš mě něco naučit?";
};

func int DIA_STRF_8146_Hart_Teach_condition()
{
	if((Npc_KnowsInfo(hero,DIA_STRF_8146_Hart_Arena) == TRUE) && (HartTeach == FALSE))
	{
		return TRUE;
	};
};

func void DIA_STRF_8146_Hart_Teach_info()
{
	AI_Output(other,self,"DIA_STRF_8146_Hart_Teach_01_00");	//Můžeš mě něco naučit?

	if((Npc_GetTalentSkill(other,NPC_TALENT_ACROBAT) == FALSE) && (MIS_HartSword == LOG_Success) && (HeroIsMorDar == TRUE))
	{
		AI_Output(self,other,"DIA_ORG_833_Buster3_02_01");	//Můžu tě naučit řídit své tělo. To umění se nazývá akrobacie.
		HartTeach = TRUE;
		Log_CreateTopic(Topic_OutTeacher,LOG_NOTE);
		B_LogEntry(Topic_OutTeacher,"Skřetí žoldák Hart je schopný mě naučit akrobacii.");
	}
	else
	{
		AI_Output(self,other,"DIA_STRF_8146_Hart_Teach_01_01");	//Promiň, příteli. Na to teď nemám čas.
		AI_Output(self,other,"DIA_STRF_8146_Hart_Teach_01_02");	//Mám bojovat s Turukem! A potřebuju se dobře připravit.
	};
};

instance DIA_STRF_8146_Hart_Acrobat(C_Info)
{
	npc = STRF_8146_Hart;
	nr = 10;
	condition = DIA_STRF_8146_Hart_Acrobat_Condition;
	information = DIA_STRF_8146_Hart_Acrobat_Info;
	permanent = TRUE;
	description = "Ukaž mi, jak správně ovládat své tělo. (VB: 10)";
};

func int DIA_STRF_8146_Hart_Acrobat_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_ACROBAT) == FALSE) && (HartTeach == TRUE))
	{
		return TRUE;
	};
};

func void DIA_STRF_8146_Hart_Acrobat_Info()
{
	AI_Output(other,self,"DIA_Cassia_Acrobat_15_00");	//Ukaž mi, jak správně ovládat své tělo.

	if(B_TeachThiefTalentFree(self,other,NPC_TALENT_ACROBAT))
	{
		AI_Output(self,other,"DIA_ORG_833_Buster3_02_02");	//Když ovládneš své svaly a nervy správně. Dovedeš doskočit mnohem dále než by si kdo myslel.
		AI_Output(self,other,"DIA_ORG_833_Buster3_02_03");	//Naučím tě jak přežít pád z výšky, ale neznamená to, že budeš nesmrtelný. 
		AI_Output(self,other,"DIA_ORG_833_Buster3_02_04");	//Akrobacie je velmi užitečná i v boji. Můžeš rychle změnit vzdálenost mezi sebou a nepřítelem!
	};
};