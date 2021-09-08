
instance DIA_VLK_6132_GAYVERN_EXIT(C_Info)
{
	npc = vlk_6132_gayvern;
	nr = 999;
	condition = dia_vlk_6132_gayvern_exit_condition;
	information = dia_vlk_6132_gayvern_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_vlk_6132_gayvern_exit_condition()
{
	return TRUE;
};

func void dia_vlk_6132_gayvern_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_VLK_6132_GAYVERN_HALLO(C_Info)
{
	npc = vlk_6132_gayvern;
	nr = 2;
	condition = dia_vlk_6132_gayvern_hallo_condition;
	information = dia_vlk_6132_gayvern_hallo_info;
	permanent = FALSE;
	description = "Zdravím, kdo jsi?";
};


func int dia_vlk_6132_gayvern_hallo_condition()
{
	return TRUE;
};

func void dia_vlk_6132_gayvern_hallo_info()
{
	AI_Output(other,self,"DIA_VLK_6132_Gayvern_Hallo_01_00");	//Zdravím, kdo jsi?
	AI_Output(self,other,"DIA_VLK_6132_Gayvern_Hallo_01_01");	//Jmenuji se Gayvern. A ty, jestli to dobře chápu, asi budeš ve městě nový.
	AI_Output(other,self,"DIA_VLK_6132_Gayvern_Hallo_01_02");	//Podle čeho soudíš?
	AI_Output(self,other,"DIA_VLK_6132_Gayvern_Hallo_01_03");	//(směje se) V přístavní čtvrti není osoba, kterou bych neznal!
	AI_Output(self,other,"DIA_VLK_6132_Gayvern_Hallo_01_04");	//Ale tebe tady vidím poprvé!
	AI_Output(other,self,"DIA_VLK_6132_Gayvern_Hallo_01_05");	//Co když jsem z jiné části města - například z horní čtvrti?
	AI_Output(self,other,"DIA_VLK_6132_Gayvern_Hallo_01_06");	//KDO?! Ty?!... (směje se) Viděl si jak vypadáš chlape?
	AI_Output(self,other,"DIA_VLK_6132_Gayvern_Hallo_01_07");	//Vypadáš jako otrhanec! (směje se) To je fakt sranda!
	AI_Output(self,other,"DIA_VLK_6132_Gayvern_Hallo_01_08");	//Ne kamaráde - takové jako ty tam oni nepustí.
	AI_Output(self,other,"DIA_VLK_6132_Gayvern_Hallo_01_09");	//Takže se mě nesnaž oklamat mladý. A věř mi: stejně se ti to nepovede.
};


instance DIA_VLK_6132_GAYVERN_WORK(C_Info)
{
	npc = vlk_6132_gayvern;
	nr = 2;
	condition = dia_vlk_6132_gayvern_work_condition;
	information = dia_vlk_6132_gayvern_work_info;
	permanent = FALSE;
	description = "A co tu pohledáváš?";
};


func int dia_vlk_6132_gayvern_work_condition()
{
	if(Npc_KnowsInfo(other,dia_vlk_6132_gayvern_hallo))
	{
		return TRUE;
	};
};

func void dia_vlk_6132_gayvern_work_info()
{
	AI_Output(other,self,"DIA_VLK_6132_Gayvern_Work_01_00");	//A co tu pohledáváš?
	AI_Output(self,other,"DIA_VLK_6132_Gayvern_Work_01_01");	//Kdysi jsem pracoval v přístavu.
	AI_Output(self,other,"DIA_VLK_6132_Gayvern_Work_01_02");	//Ale protože do Khorinisu přestali jezdit obchodní lodě, mám po práci.
	AI_Output(self,other,"DIA_VLK_6132_Gayvern_Work_01_03");	//Už tady sedím skoro šest týdnu bez práce. Zkráceně, nuda!
	AI_Output(other,self,"DIA_VLK_6132_Gayvern_Work_01_04");	//To znamená, že jsi nezaměstnaný?
	AI_Output(self,other,"DIA_VLK_6132_Gayvern_Work_01_07");	//Ne tak docela. Kardif, majítel této krčmy, mi nabídl, že u něj můžu pracovat jako vyhazovač. 
	AI_Output(self,other,"DIA_VLK_6132_Gayvern_Work_01_11");	//Samozřejmě, makat zde není nic příjemnýho, ale je to lepší než tu hladovět.
	AI_Output(self,other,"DIA_VLK_6132_Gayvern_Work_01_12");	//I když, po pravdě řečeno, bych chtěl dělat něco jiného.

	if((MIS_TRADEHELPER != LOG_Running) || (MIS_TRADEHELPER != LOG_SUCCESS) || (MIS_TRADEHELPER != LOG_FAILED))
	{
		AI_Output(self,other,"DIA_VLK_6132_Gayvern_Work_01_14");	//Poslouchej, ty si asi náhodou neslyšel o nějaké vhodně práci pro mě?
		AI_Output(other,self,"DIA_VLK_6132_Gayvern_Work_01_15");	//Zřejmě ne. Ale jestli něco bude - určitě ti dám vědět.
		AI_Output(self,other,"DIA_VLK_6132_Gayvern_Work_01_16");	//Díky chlape. Dlužný ti nezůstanu.
	};
};

instance DIA_VLK_6132_GAYVERN_HOW(C_Info)
{
	npc = vlk_6132_gayvern;
	nr = 2;
	condition = dia_vlk_6132_gayvern_how_condition;
	information = dia_vlk_6132_gayvern_how_info;
	permanent = TRUE;
	description = "Jak to jde?";
};

func int dia_vlk_6132_gayvern_how_condition()
{
	if(Npc_KnowsInfo(other,dia_vlk_6132_gayvern_work) && (GAYVERNRECRUITEDDT == FALSE))
	{
		return TRUE;
	};
};

func void dia_vlk_6132_gayvern_how_info()
{
	AI_Output(other,self,"DIA_VLK_6132_Gayvern_How_01_00");	//Jak to jde?
	AI_Output(self,other,"DIA_VLK_6132_Gayvern_How_01_01");	//Ale, všechno stojí za nic, jako vždy.

	if((GAYVERNRECRUITEDDT == FALSE) && (HURRAYICANHIRE == TRUE))
	{
		AI_Output(self,other,"DIA_VLK_6132_Gayvern_How_01_06");	//A u tebe něco nového?
		AI_Output(other,self,"DIA_VLK_6132_Gayvern_How_01_07");	//Jestli myslíš práci, tak dost možná jeden nápad mám.
		AI_Output(self,other,"DIA_VLK_6132_Gayvern_How_01_08");	//Tak proč to natahuješ - no tak, ven s tím!
	}
	else if((MIS_TRADEHELPER != LOG_Running) || (MIS_TRADEHELPER != LOG_SUCCESS) || (MIS_TRADEHELPER != LOG_FAILED))
	{
		AI_Output(self,other,"DIA_VLK_6132_Gayvern_How_01_02");	//Něco nového u tebe?
		AI_Output(other,self,"DIA_VLK_6132_Gayvern_How_01_03");	//Jestli myslíš ohledně práce, nezměnilo se nic.
		AI_Output(self,other,"DIA_VLK_6132_Gayvern_How_01_04");	//A je to opravdu škoda... (smutný)
		AI_Output(self,other,"DIA_VLK_6132_Gayvern_How_01_05");	//Mno, kdyby něco, víš, kde mě hledat.
	}
	else if((MIS_TRADEHELPER == LOG_Running) && (FINDPERSONONE == FALSE))
	{
		AI_Output(self,other,"DIA_VLK_6132_Gayvern_How_01_06");	//A u tebe něco nového?
		AI_Output(other,self,"DIA_VLK_6132_Gayvern_How_01_07");	//Jestli myslíš práci, tak dost možná jeden nápad mám.
		AI_Output(self,other,"DIA_VLK_6132_Gayvern_How_01_08");	//Tak proč to natahuješ - no tak, ven s tím!
	};
};


instance DIA_VLK_6132_GAYVERN_HIRE(C_Info)
{
	npc = vlk_6132_gayvern;
	nr = 2;
	condition = dia_vlk_6132_gayvern_hire_condition;
	information = dia_vlk_6132_gayvern_hire_info;
	permanent = FALSE;
	description = "Stále potřebuješ práci?";
};


func int dia_vlk_6132_gayvern_hire_condition()
{
	if(Npc_KnowsInfo(other,dia_vlk_6132_gayvern_work) && (MIS_TRADEHELPER == LOG_Running) && (GAYVERNRECRUITEDDT == FALSE))
	{
		return TRUE;
	};
};

func void dia_vlk_6132_gayvern_hire_info()
{
	AI_Output(other,self,"DIA_VLK_6132_Gayvern_Hire_01_00");	//Stále potřebuješ práci?
	AI_Output(self,other,"DIA_VLK_6132_Gayvern_Hire_01_01");	//Ha! On se mě ještě ptá! Samozřejmě, že ji potřebuji!
	AI_Output(self,other,"DIA_VLK_6132_Gayvern_Hire_01_02");	//A co můžeš nabídnout?
	AI_Output(other,self,"DIA_VLK_6132_Gayvern_Hire_01_03");	//Jeden vlivný obchodník z horní čtvrti města hledá člověka na místo jeho pomocníka.
	AI_Output(other,self,"DIA_VLK_6132_Gayvern_Hire_01_04");	//Práce by byla plnit jeho rozkazy a pomoci mu vést obchodní záležitosti.
	AI_Output(other,self,"DIA_VLK_6132_Gayvern_Hire_01_06");	//Tak jsem si myslel, že bys tu práci mohl vzít.
	AI_Output(other,self,"DIA_VLK_6132_Gayvern_Hire_01_07");	//Měl si zájem?
	AI_Output(self,other,"DIA_VLK_6132_Gayvern_Hire_01_08");	//Chlape, jsem připravený dělat jakoukoli práci, ale nebudu tu sedět a nic nedělat.
	AI_Output(other,self,"DIA_VLK_6132_Gayvern_Hire_01_10");	//Dobře! Ale nikam nespěchejme. Prvně bych potřeboval vědět, co umíš.
	AI_Output(other,self,"DIA_VLK_6132_Gayvern_Hire_01_11");	//Řekni, co umíš?!
	AI_Output(self,other,"DIA_VLK_6132_Gayvern_Hire_01_12");	//Nó... (zamyšleně)
	AI_Output(self,other,"DIA_VLK_6132_Gayvern_Hire_01_13");	//Pokud je třeba něco vyložit či naložit, nikdo se mi nevyrovná.
	AI_Output(other,self,"DIA_VLK_6132_Gayvern_Hire_01_14");	//A jsi schopen komunikovat s lidmi?
	AI_Output(self,other,"DIA_VLK_6132_Gayvern_Hire_01_15");	//No jasně! Dělám to každý den... (směje se)
	AI_Output(self,other,"DIA_VLK_6132_Gayvern_Hire_01_16");	//A dokážu přesvědčit lidi, aby nedělali různé blbosti. A budu k tobě upřímný - moje přesvědčovací techniky fungují spolehlivě!
	AI_Output(other,self,"DIA_VLK_6132_Gayvern_Hire_01_17");	//No, o tom nepochybuji!
	AI_Output(self,other,"DIA_VLK_6132_Gayvern_Hire_01_18");	//Věř mi: nebudeš litovat, když mě doporučíš tomu obchodníkovi.
	AI_Output(self,other,"DIA_VLK_6132_Gayvern_Hire_01_19");	//Tak jestli jsem tě zaujal - řekni mi - a já do toho půjdu!
	AI_Output(other,self,"DIA_VLK_6132_Gayvern_Hire_01_20");	//Dobře, budu o tom přemýšlet.
	B_LogEntry(TOPIC_TRADEHELPER,"Mluvil jsem s Gayvernem. Zdá se, že by nebyl proti práci u Lutera. I tak by bylo dobré, podívat se ještě po někom jiném, kdo by se hodil na tuto práci.");
	GAYVERNAGREE = TRUE;
};


instance DIA_VLK_6132_GAYVERN_HIREOK(C_Info)
{
	npc = vlk_6132_gayvern;
	nr = 2;
	condition = dia_vlk_6132_gayvern_hireok_condition;
	information = dia_vlk_6132_gayvern_hireok_info;
	permanent = FALSE;
	description = "Jdeme za obchodníkem.";
};


func int dia_vlk_6132_gayvern_hireok_condition()
{
	if((GAYVERNAGREE == TRUE) && (MIS_TRADEHELPER == LOG_Running) && (FINDPERSONONE == FALSE) && (FINDPERSONTWO == FALSE) && (FINDPERSONTHREE == FALSE) && (GAYVERNRECRUITEDDT == FALSE))
	{
		return TRUE;
	};
};

func void dia_vlk_6132_gayvern_hireok_info()
{
	AI_Output(other,self,"DIA_VLK_6132_Gayvern_HireOk_01_00");	//Jdeme za obchodníkem.
	AI_Output(other,self,"DIA_VLK_6132_Gayvern_HireOk_01_01");	//Myslím si, že jsi zrovna ten člověk, jakého potřebuje.
	AI_Output(self,other,"DIA_VLK_6132_Gayvern_HireOk_01_02");	//Skvěle! Pojďme.
	B_LogEntry(TOPIC_TRADEHELPER,"Rozhodl jsem se pro Gayverna. Doufám, že Lutero ocení mou volbu.");
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	FINDPERSONONE = TRUE;
	Npc_ExchangeRoutine(self,"FOLLOW");
};


instance DIA_VLK_6132_GAYVERN_NEWLIFE(C_Info)
{
	npc = vlk_6132_gayvern;
	nr = 2;
	condition = dia_vlk_6132_gayvern_newlife_condition;
	information = dia_vlk_6132_gayvern_newlife_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_vlk_6132_gayvern_newlife_condition()
{
	if((GAYVERNNOTHIRED == TRUE) && (HURRAYICANHIRE == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_vlk_6132_gayvern_newlife_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
};


instance DIA_VLK_6132_GAYVERN_PICKPOCKET(C_Info)
{
	npc = vlk_6132_gayvern;
	nr = 900;
	condition = dia_vlk_6132_gayvern_pickpocket_condition;
	information = dia_vlk_6132_gayvern_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_vlk_6132_gayvern_pickpocket_condition()
{
	return C_Beklauen(30,60);
};

func void dia_vlk_6132_gayvern_pickpocket_info()
{
	Info_ClearChoices(dia_vlk_6132_gayvern_pickpocket);
	Info_AddChoice(dia_vlk_6132_gayvern_pickpocket,Dialog_Back,dia_vlk_6132_gayvern_pickpocket_back);
	Info_AddChoice(dia_vlk_6132_gayvern_pickpocket,DIALOG_PICKPOCKET,dia_vlk_6132_gayvern_pickpocket_doit);
};

func void dia_vlk_6132_gayvern_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_vlk_6132_gayvern_pickpocket);
};

func void dia_vlk_6132_gayvern_pickpocket_back()
{
	Info_ClearChoices(dia_vlk_6132_gayvern_pickpocket);
};

instance DIA_VLK_6132_GAYVERN_ASKFORDT(C_Info)
{
	npc = vlk_6132_gayvern;
	nr = 6;
	condition = DIA_VLK_6132_GAYVERN_askfordt_condition;
	information = DIA_VLK_6132_GAYVERN_askfordt_info;
	permanent = FALSE;
	description = "Nechtěl bys pro mě pracovat?";
};

func int DIA_VLK_6132_GAYVERN_askfordt_condition()
{
	if(Npc_KnowsInfo(other,dia_vlk_6132_gayvern_work) && (HURRAYICANHIRE == TRUE))
	{
		return TRUE;
	};
};

func void DIA_VLK_6132_GAYVERN_askfordt_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_VLK_6132_GAYVERN_AskforDT_15_00");	//Nechtěl bys pro mě pracovat?
	AI_Output(self,other,"DIA_VLK_6132_GAYVERN_AskforDT_17_01");	//A co bych měl dělat?
	AI_Output(other,self,"DIA_VLK_6132_GAYVERN_AskforDT_17_02");	//No, jseš takovej drsňák. Tak bych tě mohl použít jako stráž mýho tábora.
	AI_Output(self,other,"DIA_VLK_6132_GAYVERN_AskforDT_17_03");	//Ty máš tábor?
	AI_Output(other,self,"DIA_VLK_6132_GAYVERN_AskforDT_17_04");	//Jo, právě jsem to pořešil. Tak co říkáš?
	AI_Output(self,other,"DIA_VLK_6132_GAYVERN_AskforDT_17_05");	//(zaraženě) Stráž? Jak to bude vypadat, bude mít někdo z nás opět náhubek?
	AI_Output(other,self,"DIA_VLK_6132_GAYVERN_AskforDT_17_06");	//Řekl bych že tohle je více rozumný post. Jistě, budete taky muset udržovat pořádek.
	AI_Output(other,self,"DIA_VLK_6132_GAYVERN_AskforDT_17_07");	//Ale ne jenom to, tábor můžou taky napadnout monstra, banditi nebo dokonce skřeti. A chci mít lidi co budou připraveni bránit.
	AI_Output(self,other,"DIA_VLK_6132_GAYVERN_AskforDT_17_08");	//Aha, no... to zní mnohem zajímavěji. Sestra tam bude?
	AI_Output(other,self,"DIA_VLK_6132_GAYVERN_AskforDT_17_09");	//Samozřejmě. Tři jídla denně, malé přístřeší, a pravidelná výplata za ochranu.
	AI_Output(self,other,"DIA_VLK_6132_GAYVERN_AskforDT_17_10");	//Pořád bude výplata? A kolik?
	AI_Output(other,self,"DIA_VLK_6132_GAYVERN_AskforDT_17_11");	//Hmmm... Asi třicet zlatých za den. Dost?
	AI_Output(self,other,"DIA_VLK_6132_GAYVERN_AskforDT_17_12");	//Třicet zlatých mincí?! Jo, jsem trošku bez peněz, nikde moc dlouho nevydržím. Dobře, souhlasím.
	AI_Output(other,self,"DIA_VLK_6132_GAYVERN_AskforDT_17_13");	//To je super. Jdi se sbalit a ráno ať jseš tam.
	AI_Output(other,self,"DIA_VLK_6132_GAYVERN_AskforDT_17_14");	//A mimochodem, heslo pro vstup do tábora zní 'dračí poklad'. Prostě to řekni stráži u vchodu.
	AI_Output(self,other,"DIA_VLK_6132_GAYVERN_AskforDT_17_15");	//Rozumím, ale nejdřív řeknu Kardifovi že končím.
	AI_Output(self,other,"DIA_VLK_6132_GAYVERN_AskforDT_17_16");	//Och... Snad to tam bude dobrý. Sedět celý den v krčmě mě už hrozně nudí. 
	AI_Output(other,self,"DIA_VLK_6132_GAYVERN_AskforDT_17_17");	//Dobře, hlavně tady nezůstaň.
	AI_Output(self,other,"DIA_VLK_6132_GAYVERN_AskforDT_17_18");	//Pokusím se.
	B_LogEntry(TOPIC_PPL_FOR_TOWER,"Gayvern se ke mě připojil.");
	self.npcType = NPCTYPE_FRIEND;
	self.aivar[AIV_ToughGuy] = TRUE;
	self.aivar[AIV_IGNORE_Theft] = TRUE;
	self.aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	self.aivar[AIV_IgnoresArmor] = TRUE;
	GAYVERNRECRUITEDDT = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"InTower");
};

instance DIA_VLK_6132_GAYVERN_INTOWER(C_Info)
{
	npc = vlk_6132_gayvern;
	nr = 22;
	condition = DIA_VLK_6132_GAYVERN_intower_condition;
	information = DIA_VLK_6132_GAYVERN_intower_info;
	permanent = TRUE;
	description = "Všechno v pořádku?";
};

func int DIA_VLK_6132_GAYVERN_intower_condition()
{
	if((GAYVERNRECRUITEDDT == TRUE) && (Npc_GetDistToWP(self,"NW_CASTLEMINE_TOWER_01") < 5000))
	{
		return TRUE;
	};
};

func void DIA_VLK_6132_GAYVERN_intower_info()
{
	AI_Output(other,self,"DIA_VLK_6132_GAYVERN_InTower_OrcKap_15_00");	//Všechno v pořádku?
	AI_Output(self,other,"DIA_VLK_6132_GAYVERN_InTower_OrcKap_01_01");	//Víc to ani nejde.
};