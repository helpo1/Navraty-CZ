var int LokiAnsewrOne;
var int LokiAnsewrTwo;
var int LokiAnsewrThree;

instance DIA_SEK_8049_LOKI_EXIT(C_Info)
{
	npc = SEK_8049_LOKI;
	nr = 999;
	condition = dia_SEK_8049_LOKI_exit_condition;
	information = dia_SEK_8049_LOKI_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int dia_SEK_8049_LOKI_exit_condition()
{
	return TRUE;
};

func void dia_SEK_8049_LOKI_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_SEK_8049_LOKI_GREET(C_Info)
{
	npc = SEK_8049_LOKI;
	nr = 1;
	condition = dia_SEK_8049_LOKI_greet_condition;
	information = dia_SEK_8049_LOKI_greet_info;
	permanent = FALSE;
	description = "Rád bych s tebou pohovořil novici.";
};

func int dia_SEK_8049_LOKI_greet_condition()
{
	return TRUE;
};

func void dia_SEK_8049_LOKI_greet_info()
{
	AI_Output(other,self,"DIA_SEK_8049_LOKI_Greet_01_00");	//Rád bych s tebou pohovořil novici.
	AI_Output(self,other,"DIA_SEK_8049_LOKI_Greet_01_01");	//O čem konkrétně?
	AI_Output(other,self,"DIA_SEK_8049_LOKI_Greet_01_02");	//Rád bych znal podrobnosti o nedávném útoku.
	AI_Output(self,other,"DIA_SEK_8049_LOKI_Greet_01_03");	//Aha, tohle...(nervózně) Snažím se na to zapomenout. Ale jak to vypadá, není mě to souzeno.
	AI_Output(other,self,"DIA_SEK_8049_LOKI_Greet_01_04");	//Chápu, že na to chceš zapomenou.
	AI_Output(other,self,"DIA_SEK_8049_LOKI_Greet_01_05");	//Ale musíš pochopit, že tvoje zázračná záchrana, není garancí klidného života.
	AI_Output(other,self,"DIA_SEK_8049_LOKI_Greet_01_06");	//A ostatní členové Bratrstva stále čelí velkému nebezpečí!
	AI_Output(other,self,"DIA_SEK_8049_LOKI_Greet_01_07");	//Proto mě musíš pomoci.
	AI_Output(self,other,"DIA_SEK_8049_LOKI_Greet_01_08");	//Hmm...(odevzdaně) No dobře, asi máš pravdu. Ptej se na co chceš.
};


instance DIA_SEK_8049_LOKI_Survive(C_Info)
{
	npc = SEK_8049_LOKI;
	nr = 1;
	condition = dia_SEK_8049_LOKI_Survive_condition;
	information = dia_SEK_8049_LOKI_Survive_info;
	permanent = FALSE;
	description = "Jak se ti povedlo přežít?";
};

func int dia_SEK_8049_LOKI_Survive_condition()
{
	if(Npc_KnowsInfo(hero,DIA_SEK_8049_LOKI_Greet))
	{
		return TRUE;
	};
};

func void dia_SEK_8049_LOKI_Survive_info()
{
	AI_Output(other,self,"DIA_SEK_8049_LOKI_Survive_01_00");	//Jak se ti povedlo přežít?
	AI_Output(self,other,"DIA_SEK_8049_LOKI_Survive_01_01");	//Myslím, že jsem měl prostě štěstí...(zmateně) Nenapadá mě nic jiného!
	AI_Output(self,other,"DIA_SEK_8049_LOKI_Survive_01_02");	//Našel jsem ohromnou louku plnou trávy z bažin a tak jsem se zabral do sbírání, ani jsem si nevšimnul, že jsem se vzdálil od našeho tábora.
	AI_Output(self,other,"DIA_SEK_8049_LOKI_Survive_01_03");	//Slyšel jsem zvuky bitvy, tak jsem se schoval v blízkém keři, a čekal až bude po všem.
	AI_Output(self,other,"DIA_SEK_8049_LOKI_Survive_01_04");	//To je vše.
	LokiAnsewrOne = TRUE;
};


instance DIA_SEK_8049_LOKI_Attackers(C_Info)
{
	npc = SEK_8049_LOKI;
	nr = 1;
	condition = dia_SEK_8049_LOKI_Attackers_condition;
	information = dia_SEK_8049_LOKI_Attackers_info;
	permanent = FALSE;
	description = "Jak vypadali útočníci?";
};

func int dia_SEK_8049_LOKI_Attackers_condition()
{
	if(Npc_KnowsInfo(hero,DIA_SEK_8049_LOKI_Greet))
	{
		return TRUE;
	};
};

func void dia_SEK_8049_LOKI_Attackers_info()
{
	AI_Output(other,self,"DIA_SEK_8049_LOKI_Attackers_01_00");	//Jak vypadali útočníci?
	AI_Output(self,other,"DIA_SEK_8049_LOKI_Attackers_01_01");	//Nevím...(zmateně) Všichni měli na tvářích masky.
	AI_Output(self,other,"DIA_SEK_8049_LOKI_Attackers_01_02");	//Jediné na co si vzpomínám, je že jejich těla byla pokryta podivnými kresbami.
	AI_Output(self,other,"DIA_SEK_8049_LOKI_Attackers_01_03");	//Jsou trochu podobné těm, které děláme v táboře Bratrstva.
	AI_Output(other,self,"DIA_SEK_8049_LOKI_Attackers_01_04");	//A říkali něco?
	AI_Output(self,other,"DIA_SEK_8049_LOKI_Attackers_01_05");	//Ne, za celou dobu neřekli ani slovo. 
	LokiAnsewrTwo = TRUE;
};

instance DIA_SEK_8049_LOKI_Other(C_Info)
{
	npc = SEK_8049_LOKI;
	nr = 1;
	condition = dia_SEK_8049_LOKI_Other_condition;
	information = dia_SEK_8049_LOKI_Other_info;
	permanent = FALSE;
	description = "Co se stalo s ostatníma?";
};

func int dia_SEK_8049_LOKI_Other_condition()
{
	if(Npc_KnowsInfo(hero,DIA_SEK_8049_LOKI_Greet))
	{
		return TRUE;
	};
};

func void dia_SEK_8049_LOKI_Other_info()
{
	AI_Output(other,self,"DIA_SEK_8049_LOKI_Other_01_00");	//Co se stalo s ostatníma?
	AI_Output(self,other,"DIA_SEK_8049_LOKI_Other_01_01");	//Všechny novice odvedli sebou. A ty co se bránili na místě zabili.
	AI_Output(self,other,"DIA_SEK_8049_LOKI_Other_01_02");	//Víc toho nevím.
	LokiAnsewrThree = TRUE;
};

instance DIA_SEK_8049_LOKI_Sign(C_Info)
{
	npc = SEK_8049_LOKI;
	nr = 1;
	condition = dia_SEK_8049_LOKI_Sign_condition;
	information = dia_SEK_8049_LOKI_Sign_info;
	permanent = FALSE;
	description = "O tom amuletu co ti ukázal Baal Namib.";
};

func int dia_SEK_8049_LOKI_Sign_condition()
{
	if((LokiAnsewrOne == TRUE) && (LokiAnsewrTwo == TRUE) && (LokiAnsewrThree == TRUE))
	{
		return TRUE;
	};
};

func void dia_SEK_8049_LOKI_Sign_info()
{
	AI_Output(other,self,"DIA_SEK_8049_LOKI_Sign_01_00");	//O tom amuletu co ti ukázal Baal Namib.
	AI_Output(other,self,"DIA_SEK_8049_LOKI_Sign_01_01");	//Víš o něm něco?
	AI_Output(self,other,"DIA_SEK_8049_LOKI_Sign_01_02");	//Ne, nic o něm nevím.
	AI_Output(self,other,"DIA_SEK_8049_LOKI_Sign_01_03");	//Po pravdě... měl jsem pocit, že symbol co je zobrazen v jeho středu jsem už někde viděl.
	AI_Output(self,other,"DIA_SEK_8049_LOKI_Sign_01_04");	//Ale nemohu si vzpomenout kde.
	AI_Output(other,self,"DIA_SEK_8049_LOKI_Sign_01_05");	//Jseš si jistej?
	AI_Output(self,other,"DIA_SEK_8049_LOKI_Sign_01_06");	//Ano, jinak bych tomu symbolu nepřikládal tak velký význam.
	AI_Output(other,self,"DIA_SEK_8049_LOKI_Sign_01_07");	//Ale proč jsi o tom neřekl Baalu Namibovi?!
	AI_Output(self,other,"DIA_SEK_8049_LOKI_Sign_01_08");	//Víš... Byl jsem tenkrát příliš vystrašený a bál jsem se, že se mohu ve svém úsudku mýlit.
	AI_Output(other,self,"DIA_SEK_8049_LOKI_Sign_01_09");	//Nyní musíme zajistit, aby sis na všechno vzpomněl. Může to být velmi důležité!
	AI_Output(self,other,"DIA_SEK_8049_LOKI_Sign_01_10");	//Ale jak to chceš udělat?...(zmateně) Bojím se, že ti v tom nijak nemohu pomoci.
	AI_Output(other,self,"DIA_SEK_8049_LOKI_Sign_01_11");	//Na něco přijdu.
	B_LogEntry(TOPIC_PrioratStart,"Zjistil jsem, že Loki znal symbol, který mu ukázal Baal Namib na amuletu. Nicméně Loki si nemůže vzpomenout kdy a kde to bylo. Je potřeba mu osvěžit paměť. Možná některý z Guru bude znát způsob jak to udělat.");
	LokiNeedMemory = TRUE;
};



instance DIA_SEK_8049_LOKI_SPECIALPOTION(C_Info)
{
	npc = SEK_8049_LOKI;
	nr = 1;
	condition = dia_SEK_8049_LOKI_SPECIALPOTION_condition;
	information = dia_SEK_8049_LOKI_SPECIALPOTION_info;
	permanent = FALSE;
	description = "Tady, vypí tento nápoj.";
};


func int dia_SEK_8049_LOKI_SPECIALPOTION_condition()
{
	if((MIS_PrioratStart == LOG_Running) && (LokiMemoriesAlive == FALSE) && (Npc_HasItems(other,ItPo_Memories) >= 1))
	{
		return TRUE;
	};
};

func void dia_SEK_8049_LOKI_SPECIALPOTION_info()
{
	AI_Output(other,self,"DIA_SEK_8049_LOKI_SPECIALPOTION_01_00");	//Tady, vypí tento nápoj.
	AI_Output(self,other,"DIA_SEK_8049_LOKI_SPECIALPOTION_01_01");	//A co je to?
	AI_Output(other,self,"DIA_SEK_8049_LOKI_SPECIALPOTION_01_02");	//Neboj se, jen ti pomůže vzpomenout si.
	AI_Output(self,other,"DIA_SEK_8049_LOKI_SPECIALPOTION_01_03");	//No, dobře...(nedůvěřivě) dej to sem.
	AI_StopProcessInfos(self);
	B_GiveInvItems(other,self,ItPo_Memories,1);

	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};
	AI_UseItem(self,ItPo_Memories);
	LokiMemoriesAlive = TRUE;
	Npc_SetRefuseTalk(self,5);
	hero.aivar[AIV_INVINCIBLE] = FALSE;
};


instance DIA_SEK_8049_LOKI_SPECIALPOTION_OK(C_Info)
{
	npc = SEK_8049_LOKI;
	nr = 1;
	condition = DIA_SEK_8049_LOKI_SPECIALPOTION_OK_condition;
	information = DIA_SEK_8049_LOKI_SPECIALPOTION_OK_info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_SEK_8049_LOKI_SPECIALPOTION_OK_condition()
{
	if(LokiMemoriesAlive == TRUE)
	{
		return TRUE;
	};
};

func void DIA_SEK_8049_LOKI_SPECIALPOTION_OK_info()
{
	B_GivePlayerXP(100);
	AI_Output(self,other,"DIA_SEK_8049_LOKI_SPECIALPOTION_OK_01_00");	//Och...(probírá se) Sakra, co to bylo?!
	AI_Output(other,self,"DIA_SEK_8049_LOKI_SPECIALPOTION_OK_01_01");	//Tak jak se cítíš?
	AI_Output(self,other,"DIA_SEK_8049_LOKI_SPECIALPOTION_OK_01_02");	//Nemůžu říct, že moc dobře...(překvapeně) Ten váš nápoj má dost silné učinky na mozek!
	AI_Output(self,other,"DIA_SEK_8049_LOKI_SPECIALPOTION_OK_01_03");	//Zdá se, že jsem byl v bezvědomí několik minut.
	AI_Output(other,self,"DIA_SEK_8049_LOKI_SPECIALPOTION_OK_01_04");	//To je pravda. A teď k věci.
	AI_Output(other,self,"DIA_SEK_8049_LOKI_SPECIALPOTION_OK_01_05");	//Už sis vzpomněl, kde jsi viděl ten symbol z amuletu?
	AI_Output(self,other,"DIA_SEK_8049_LOKI_SPECIALPOTION_OK_01_06");	//Ano, pamatuji si všechno a ještě víc než bych chtěl.
	AI_Output(other,self,"DIA_SEK_8049_LOKI_SPECIALPOTION_OK_01_07");	//A můžeš mě tam dovést?
	AI_Output(self,other,"DIA_SEK_8049_LOKI_SPECIALPOTION_OK_01_08");	//Myslím, že ano. To místo není daleko od našeho tábora. 
	AI_Output(other,self,"DIA_SEK_8049_LOKI_SPECIALPOTION_OK_01_09");	//Tak nebudem ztrácet čas - veď mě.
	Npc_ExchangeRoutine(self,"GUIDE");
	AI_Output(self,other,"DIA_SEK_8049_LOKI_SPECIALPOTION_OK_01_10");	//Dobře, pojď za mnou.
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	LokiGuide = TRUE;
	Loki_GuideDay = Wld_GetDay();
};


instance DIA_SEK_8049_LOKI_GUIDE(C_Info)
{
	npc = SEK_8049_LOKI;
	nr = 1;
	condition = DIA_SEK_8049_LOKI_GUIDE_Condition;
	information = DIA_SEK_8049_LOKI_GUIDE_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_SEK_8049_LOKI_GUIDE_Condition()
{
	if((LokiGuide == TRUE) && (Npc_GetDistToWP(self,"NW_TO_NEWCAMPPSI_01") <= 1000))
	{
		return TRUE;
	};
};

func void DIA_SEK_8049_LOKI_GUIDE_Info()
{
	B_GivePlayerXP(500);

	if(Loki_GuideDay > (Wld_GetDay() - 2))
	{
		AI_Output(self,other,"DIA_SEK_8049_LOKI_GUIDE_01_00");	//Tak jsme tady.
	}
	else
	{
		AI_Output(self,other,"DIA_SEK_8049_LOKI_GUIDE_01_01");	//Kde jsi byl, už jsem si začínal myslet že tě roztrhali vlci.
	};

	AI_Output(other,self,"DIA_SEK_8049_LOKI_GUIDE_01_02");	//A co tady je?
	AI_Output(self,other,"DIA_SEK_8049_LOKI_GUIDE_01_03");	//...(rozhlíží se) Za mnou je zvláštní kámen a na něm jsem viděl ten symbol co tě zajímal.
	AI_Output(other,self,"DIA_SEK_8049_LOKI_GUIDE_01_04");	//Dobře, podívám se.
	AI_Output(self,other,"DIA_SEK_8049_LOKI_GUIDE_01_05");	//Hele...(nervózně) Radši se vrátím zpět do tábora, vzpomínám, že jsem z toho místa neměl dobrý pocit.
	AI_Output(self,other,"DIA_SEK_8049_LOKI_GUIDE_01_06");	//Uvidíme se později, kamaráde.
	AI_Output(other,self,"DIA_SEK_8049_LOKI_GUIDE_01_07");	//Samo sebou.
	Assasins_Door_Found = TRUE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"PsiCamp");
};