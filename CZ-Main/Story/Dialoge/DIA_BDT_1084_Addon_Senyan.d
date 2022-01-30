
instance DIA_Addon_Senyan_EXIT(C_Info)
{
	npc = BDT_1084_Addon_Senyan;
	nr = 999;
	condition = DIA_Addon_Senyan_EXIT_Condition;
	information = DIA_Addon_Senyan_EXIT_Info;
	permanent = TRUE;
	description = "Uvidíme.";
};


func int DIA_Addon_Senyan_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Senyan_EXIT_Info()
{
	if(Senyan_Erpressung == LOG_Running)
	{
		AI_Output(self,other,"DIA_Addon_Senyan_EXIT_12_00");	//Víš co dělat...
	};
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Senyan_PICKPOCKET(C_Info)
{
	npc = BDT_1084_Addon_Senyan;
	nr = 900;
	condition = DIA_Addon_Senyan_PICKPOCKET_Condition;
	information = DIA_Addon_Senyan_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Senyan_PICKPOCKET_Condition()
{
	return C_Beklauen(45,88);
};

func void DIA_Addon_Senyan_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Senyan_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Senyan_PICKPOCKET,Dialog_Back,DIA_Addon_Senyan_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Senyan_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Senyan_PICKPOCKET_DoIt);
};

func void DIA_Addon_Senyan_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Senyan_PICKPOCKET);
};

func void DIA_Addon_Senyan_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Senyan_PICKPOCKET);
};

func void B_Senyan_Attack()
{
	AI_Output(self,other,"DIA_Addon_Senyan_Attack_12_00");	//(podceňuje) Jak mi můžeš být nápomocen, pane k ničemu?
	AI_Output(self,other,"DIA_Addon_Senyan_Attack_12_01");	//(volá) Hej, lidi, podívejte, kohopak to tu máme!
	Senyan_Called = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void B_Senyan_Erpressung()
{
	AI_Output(other,self,"DIA_Addon_Senyan_Erpressung_15_00");	//Kolik chceš?
	AI_Output(self,other,"DIA_Addon_Senyan_Erpressung_12_01");	//(hraje provinilého) Ale ne, prosím. Nikdy by mě nenapadlo tě vydírat. Nikdy.
	AI_Output(other,self,"DIA_Addon_Senyan_Erpressung_15_02");	//Kolik?
	AI_Output(self,other,"DIA_Addon_Senyan_Erpressung_12_03");	//Nedávno se někdo pokusil zabít Estebana. Nicméně byl zabit jeho strážci.
	AI_Output(self,other,"DIA_Addon_Senyan_Erpressung_12_04");	//Jdi k Estebanovi a promluv s ním. Popovídáme si po tom.
	AI_StopProcessInfos(self);
	Log_CreateTopic(Topic_Addon_Senyan,LOG_MISSION);
	Log_SetTopicStatus(Topic_Addon_Senyan,LOG_Running);
	B_LogEntry(Topic_Addon_Senyan,"Senyan mě poznal. Ví kdo jsem. Chce to použít pro své vlastní plány. Plánuje něco a teď chce abych si promluvil s Estebanem.");
};


instance DIA_Addon_BDT_1084_Senyan_Hi(C_Info)
{
	npc = BDT_1084_Addon_Senyan;
	nr = 1;
	condition = DIA_Addon_Senyan_Hi_Condition;
	information = DIA_Addon_Senyan_Hi_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Senyan_Hi_Condition()
{
	return TRUE;
};


var int Senyan_Msg;
var int Senyan_Bad;
var int Senyan_Good;

func void DIA_Addon_Senyan_Hi_Info()
{
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_12_00");	//Á! Podívejme, kdo to je.
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_12_01");	//Dobrá, dobrá, jestlipak to nejsi ty. Mám pro tebe pár dobrých a špatných zpráv.
	Info_ClearChoices(DIA_Addon_BDT_1084_Senyan_Hi);
	Info_AddChoice(DIA_Addon_BDT_1084_Senyan_Hi,"Chci nejdřív slyšet dobré zprávy.",DIA_Addon_BDT_1084_Senyan_Hi_good);
	Info_AddChoice(DIA_Addon_BDT_1084_Senyan_Hi,"Chci nejdřív slyšet špatné zprávy.",DIA_Addon_BDT_1084_Senyan_Hi_bad);
};

func void DIA_Addon_BDT_1084_Senyan_Hi_good()
{
	if(Senyan_Msg == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_BDT_1084_Senyan_Hi_good_15_00");	//Chci nejdřív slyšet dobré zprávy.
		Senyan_Msg = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_BDT_1084_Senyan_Hi_good_15_01");	//A co dobré zprávy?
	};
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_good_12_02");	//Nevím jistě proč, ale buď si jistý, že tu máš vlivné nepřátele.
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_good_12_03");	//Považ sám, že jsi měl štěstí, že jsem tě poznal jako první, a ne někdo jiný.
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_good_12_04");	//Jsem velmi rozumná, chápavá a společenská osoba.
	Senyan_Good = TRUE;
	Info_ClearChoices(DIA_Addon_BDT_1084_Senyan_Hi);
	if(Senyan_Bad == TRUE)
	{
		B_Senyan_Erpressung();
	}
	else
	{
		Info_AddChoice(DIA_Addon_BDT_1084_Senyan_Hi,"A co špatné zprávy?",DIA_Addon_BDT_1084_Senyan_Hi_bad);
	};
};

func void DIA_Addon_BDT_1084_Senyan_Hi_bad()
{
	if(Senyan_Msg == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_BDT_1084_Senyan_Hi_bad_15_00");	//Chci nejdřív slyšet špatné zprávy.
		Senyan_Msg = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_BDT_1084_Senyan_Hi_bad_15_01");	//A co špatné zprávy?
	};
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_bad_12_02");	//Raven tě hledá. Jeho stráže tě hledají. Vlastně, všichni banditi...
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_bad_12_03");	//Zabijí tě, pokud na ně narazíš.
	AI_Output(other,self,"DIA_Addon_BDT_1084_Senyan_Hi_bad_15_04");	//Nebudou první, kdo to zkouší.
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_bad_12_05");	//Tvoje bojové schopnosti jsou pozoruhodné jako tvoje chytrost. Nasadit si jednu z našich zbrojí a přijít k nám do tábora je jako...
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_bad_12_06");	//... když ovce vejde vlkovi přímo do tlamy. Chodíš po tenkém ledě, chlape.
	Senyan_Bad = TRUE;
	Info_ClearChoices(DIA_Addon_BDT_1084_Senyan_Hi);
	if(Senyan_Good == TRUE)
	{
		B_Senyan_Erpressung();
	}
	else
	{
		Info_AddChoice(DIA_Addon_BDT_1084_Senyan_Hi,"A co dobré zprávy?",DIA_Addon_BDT_1084_Senyan_Hi_good);
	};
};


instance DIA_Addon_Senyan_unterwegs(C_Info)
{
	npc = BDT_1084_Addon_Senyan;
	nr = 99;
	condition = DIA_Addon_Senyan_unterwegs_Condition;
	information = DIA_Addon_Senyan_unterwegs_Info;
	permanent = TRUE;
	description = "O Estebanovi...";
};


func int DIA_Addon_Senyan_unterwegs_Condition()
{
	if((MIS_Judas != LOG_Running) && Npc_KnowsInfo(other,DIA_Addon_BDT_1084_Senyan_Hi))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Senyan_unterwegs_Info()
{
	AI_Output(other,self,"DIA_Addon_Senyan_unterwegs_15_00");	//O Estebanovi...
	AI_Output(self,other,"DIA_Addon_Senyan_unterwegs_12_01");	//Už jsi s ním promluvil?
	AI_Output(other,self,"DIA_Addon_Senyan_unterwegs_15_02");	//Ještě ne.
	AI_Output(self,other,"DIA_Addon_Senyan_unterwegs_12_03");	//Dobrá, nečekej příliš dlouho.
};


instance DIA_Addon_Senyan_Attentat(C_Info)
{
	npc = BDT_1084_Addon_Senyan;
	nr = 2;
	condition = DIA_Addon_Senyan_Attentat_Condition;
	information = DIA_Addon_Senyan_Attentat_Info;
	permanent = FALSE;
	description = "Už jsem s ním promluvil.";
};


func int DIA_Addon_Senyan_Attentat_Condition()
{
	if((MIS_Judas == LOG_Running) && Npc_KnowsInfo(other,DIA_Addon_BDT_1084_Senyan_Hi))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Senyan_Attentat_Info()
{
	AI_Output(other,self,"DIA_Addon_Senyan_Attentat_15_00");	//Už jsem s ním promluvil.
	AI_Output(self,other,"DIA_Addon_Senyan_Attentat_12_01");	//Zmínil se o pokuse o vraždu?
	AI_Output(other,self,"DIA_Addon_Senyan_Attentat_15_02");	//Je mým úkolem najít osobu, která je za to zodpovědná. Nevíš o tom něco?
	AI_Output(self,other,"DIA_Addon_Senyan_Attentat_12_03");	//Ne víc než ty. Osobně hledám pachatele. A zajímavá část je...
	AI_Output(other,self,"DIA_Addon_Senyan_Attentat_15_04");	//Ano?
	AI_Output(self,other,"DIA_Addon_Senyan_Attentat_12_05");	//Chci, aby si tu práci udělal ty a pořádně. Chci, abys našel toho zrádce.
	AI_Output(self,other,"DIA_Addon_Senyan_Attentat_12_06");	//(chladně) A jen, co ho najdeš, zabij ho - pro mě.
	AI_Output(self,other,"DIA_Addon_Senyan_Attentat_12_07");	//'Já' budu odměněn.
	AI_Output(self,other,"DIA_Addon_Senyan_Attentat_12_08");	//Měj stále na paměti, že mám tvůj plakát. Udělej svoji práci a udělej ji dobře. Můžeš hádat, co by se jinak stalo.
	Info_ClearChoices(DIA_Addon_Senyan_Attentat);
	Info_AddChoice(DIA_Addon_Senyan_Attentat,"Zřejmě nemám na výběr...",DIA_Addon_Senyan_Attentat_JA);
	Info_AddChoice(DIA_Addon_Senyan_Attentat,"Zapomeň!",DIA_Addon_Senyan_Attentat_NO);
};

func void DIA_Addon_Senyan_Attentat_NO()
{
	AI_Output(other,self,"DIA_Addon_Senyan_Attentat_NO_15_00");	//Zapomeň!
	B_Senyan_Attack();
	Info_ClearChoices(DIA_Addon_Senyan_Attentat);
};

func void DIA_Addon_Senyan_Attentat_JA()
{
	AI_Output(other,self,"DIA_Addon_Senyan_Attentat_JA_15_00");	//Zřejmě nemám na výběr...
	AI_Output(self,other,"DIA_Addon_Senyan_Attentat_JA_12_01");	//Věděl jsem, že budeš souhlasit.
	AI_Output(self,other,"DIA_Addon_Senyan_Attentat_JA_12_02");	//(nevrle) Jestli něco zjistíš o jeho identitě, půjdem zabít toho bastarda společně. A teď se ztrať!
	Senyan_Erpressung = LOG_Running;
	Info_ClearChoices(DIA_Addon_Senyan_Attentat);
	B_LogEntry(Topic_Addon_Senyan,"Senyan chce abych našel a zabil spiklence. Jenom pro něj získat odměnu.");
};


instance DIA_Addon_Senyan_ChangePlan(C_Info)
{
	npc = BDT_1084_Addon_Senyan;
	nr = 3;
	condition = DIA_Addon_Senyan_ChangePlan_Condition;
	information = DIA_Addon_Senyan_ChangePlan_Info;
	permanent = FALSE;
	description = "Ještě jsem si to promyslel. Nechci s tebou dále pracovat!";
};


func int DIA_Addon_Senyan_ChangePlan_Condition()
{
	if((Senyan_Erpressung == LOG_Running) && (Snaf_Tip_Senyan == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Senyan_ChangePlan_Info()
{
	AI_Output(other,self,"DIA_Addon_Senyan_ChangePlan_15_00");	//Ještě jsem si to promyslel. Nechci s tebou dále pracovat!
	B_Senyan_Attack();
	AI_StopProcessInfos(self);
};


instance DIA_Addon_BDT_1084_Senyan_Found(C_Info)
{
	npc = BDT_1084_Addon_Senyan;
	nr = 3;
	condition = DIA_Addon_Senyan_Found_Condition;
	information = DIA_Addon_Senyan_Found_Info;
	permanent = FALSE;
	description = "Našel jsem zrádce. Je to Fisk.";
};


func int DIA_Addon_Senyan_Found_Condition()
{
	if((Senyan_Erpressung == LOG_Running) && (MIS_Judas == LOG_SUCCESS))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Senyan_Found_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_1084_Senyan_Found_15_00");	//Našel jsem zrádce. Je to Fisk.
	B_Senyan_Attack();
};


instance DIA_Addon_BDT_1084_Senyan_derbe(C_Info)
{
	npc = BDT_1084_Addon_Senyan;
	nr = 1;
	condition = DIA_Addon_Senyan_derbe_Condition;
	information = DIA_Addon_Senyan_derbe_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Senyan_derbe_Condition()
{
	if((Senyan_Erpressung == LOG_Running) && (MIS_Judas == LOG_SUCCESS) && (Npc_IsDead(Fisk) || Npc_IsDead(Esteban)))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Senyan_derbe_Info()
{
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_derbe_12_00");	//(naštvaně) Zničil jsi naši dohodu.
	B_Senyan_Attack();
};

