instance DIA_Ass_394_Adept_EXIT(C_Info)
{
	npc = Ass_394_Adept;
	nr = 999;
	condition = DIA_Ass_394_Adept_exit_condition;
	information = DIA_Ass_394_Adept_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Ass_394_Adept_exit_condition()
{
	return TRUE;
};

func void DIA_Ass_394_Adept_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Ass_394_Adept_Hello(C_Info)
{
	npc = Ass_394_Adept;
	nr = 1;
	condition = DIA_Ass_394_Adept_hello_condition;
	information = DIA_Ass_394_Adept_hello_info;
	permanent = FALSE;
	description = "Ty jsi Kudir?";
};
	
func int DIA_Ass_394_Adept_hello_condition()
{
	if(MIS_CareOsair == LOG_Running)
	{
		return TRUE;
	};
};	
	
func void DIA_Ass_394_Adept_hello_info()
{
	AI_Output(other,self,"DIA_Ass_394_Adept_hello_01_01");	//Ty jsi Kudir?
	AI_Output(self,other,"DIA_Ass_394_Adept_hello_01_02");	//Ano, jsem to já. Co tě ke mně přivedlo, bratře?
	AI_Output(other,self,"DIA_Ass_394_Adept_hello_01_03");	//Hledal jsem tě snad všude.
	AI_Output(self,other,"DIA_Ass_394_Adept_hello_01_04");	//O tom nepochybuji. Máš štěstí, že se ti podařilo mě tady přistihnout. Málokdy bývám v chrámu.
	AI_Output(other,self,"DIA_Ass_394_Adept_hello_01_05");	//Čím se tedy zabýváš?

	if(NrozasIsDead == FALSE)
	{
		AI_Output(self,other,"DIA_Ass_394_Adept_hello_01_06");	//Většinou sbírám vzácné byliny a ingredience pro mistra Nrozase.
		AI_Output(self,other,"DIA_Ass_394_Adept_hello_01_07");	//Bohužel se v tomto údolí nenachází tolik velmi vzácných exemplářů.
		AI_Output(self,other,"DIA_Ass_394_Adept_hello_01_08");	//Proto většinu času cestuji po celém ostrově.
		AI_Output(self,other,"DIA_Ass_394_Adept_hello_01_09");	//Proč jsi mě vlastně hledal?
		AI_Output(other,self,"DIA_Ass_394_Adept_hello_01_10");	//Mám pro tebe jednu nabídku.
		AI_Output(self,other,"DIA_Ass_394_Adept_hello_01_11");	//Zajímavé, jakou?
		AI_Output(other,self,"DIA_Ass_394_Adept_hello_01_12");	//Mistr Osair hledá nové lidi. Myslel jsem, že by tě to mohlo zajímat.
		AI_Output(self,other,"DIA_Ass_394_Adept_hello_01_13");	//(arogantně) Mistr Osair? Hmmm. Bojím se, že jsi na špatné adrese, bratře.
		AI_Output(self,other,"DIA_Ass_394_Adept_hello_01_14");	//Už pracuji pro mistra Nrozase. A zatím mi to u něj vyhovuje.
		AI_Output(other,self,"DIA_Ass_394_Adept_hello_01_15");	//Můžu tě nějakým způsobem přesvědčit?
		AI_Output(self,other,"DIA_Ass_394_Adept_hello_01_16");	//Hmmm. Umíš zaujmout lidi, co?
		AI_Output(self,other,"DIA_Ass_394_Adept_hello_01_17");	//Když tak přemýšlím, je tu jedna věc, kterou bych chtěl.
		AI_Output(self,other,"DIA_Ass_394_Adept_hello_01_18");	//Jestli ji pro mě získáš, tak jsme domluveni.
		AI_Output(other,self,"DIA_Ass_394_Adept_hello_01_19");	//Co je to za věc?
		AI_Output(self,other,"DIA_Ass_394_Adept_hello_01_20");	//Jedna velmi cenná rostlina. Jmenuje se trolí bobule.
		AI_Output(self,other,"DIA_Ass_394_Adept_hello_01_21");	//Zkoušel jsem ji najít sám, ale bezúspěšně.
		AI_Output(self,other,"DIA_Ass_394_Adept_hello_01_22");	//Podle jména by se měla nacházet na místě, kde jsou trolové.
		AI_Output(self,other,"DIA_Ass_394_Adept_hello_01_23");	//Nejsem však padlej na hlavu, abych si s nimi zahrával. Už tak mi stačí, když vím, že je někde poblíž!
		AI_Output(self,other,"DIA_Ass_394_Adept_hello_01_24");	//Můžeš to zkusit. Teda jestli chceš, abych přijal nabídku mistra Osaira.
		AI_Output(other,self,"DIA_Ass_394_Adept_hello_01_25");	//Dobře, zkusím to.
		KudirNeedTrollPlant = TRUE;
		B_LogEntry(TOPIC_CareOsair,"Kudir mě požádal abych našel jednu velmi vzácnou rostlinu - trolí bobuli. Jestli se mi to povede, bude souhlasit s prací pro mistra Osaira.");
		AI_StopProcessInfos(self);
		Wld_InsertItem(ITPL_SUPER_HERB,"FP_ITEMSPAWN_KUDIR_PLANT");
	}
	else
	{
		AI_Output(self,other,"DIA_Ass_394_Adept_hello_01_26");	//Do nedávna jsem sbíral vzácné byliny a ingredience pro mistra Nrozase.
		AI_Output(self,other,"DIA_Ass_394_Adept_hello_01_27");	//Ale teď pracuju pro mistra Haniara. Plním pro něj různé práce.
		AI_Output(self,other,"DIA_Ass_394_Adept_hello_01_28");	//Proč jsi mě vlastně hledal?
		AI_Output(other,self,"DIA_Ass_394_Adept_hello_01_29");	//Mám pro tebe jednu nabídku.
		AI_Output(self,other,"DIA_Ass_394_Adept_hello_01_30");	//Zajímavé, jakou?
		AI_Output(other,self,"DIA_Ass_394_Adept_hello_01_31");	//Mistr Osair hledá nové lidi. Myslel jsem, že by tě to mohlo zajímat.
		AI_Output(self,other,"DIA_Ass_394_Adept_hello_01_32");	//(arogantně) Mistr Osair? Hmmm. Bojím se, že jsi na špatné adrese, bratře.
		AI_Output(self,other,"DIA_Ass_394_Adept_hello_01_33");	//Je to ta poslední věc, která mě na tomhle světě zajímá.
		AI_Output(other,self,"DIA_Ass_394_Adept_hello_01_34");	//Jak to?
		AI_Output(self,other,"DIA_Ass_394_Adept_hello_01_35");	//Protože nikdy nevíš, co od něj můžeš očekávat. Je dost chytrý a nepředvídatelný.
		AI_Output(self,other,"DIA_Ass_394_Adept_hello_01_36");	//Nikdy jsem mu nevěřil - ani tobě to nedoporučuju.
		KudirPissOff = TRUE;
		B_LogEntry(TOPIC_CareOsair,"Kudir teď pracuje pro mistra Haniara. Vypadá to, že s mou nabídkou nesouhlasí.");
		AI_StopProcessInfos(self);
	};

};

instance DIA_Ass_394_Adept_GetPlant(C_Info)
{
	npc = Ass_394_Adept;
	nr = 1;
	condition = DIA_Ass_394_Adept_GetPlant_condition;
	information = DIA_Ass_394_Adept_GetPlant_info;
	permanent = FALSE;
	description = "Přinesl jsem ti trolí bobuli.";
};
	
func int DIA_Ass_394_Adept_GetPlant_condition()
{
	if((MIS_CareOsair == LOG_Running) && (KudirNeedTrollPlant == TRUE) && (Npc_HasItems(other,ITPL_SUPER_HERB) >= 1))
	{
		return TRUE;
	};
};	
	
func void DIA_Ass_394_Adept_GetPlant_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Ass_394_Adept_GetPlant_01_01");	//Přinesl jsem ti trolí bobuli.
	AI_Output(self,other,"DIA_Ass_394_Adept_GetPlant_01_02");	//To se ti ji opravdu podařilo najít?
	AI_Output(other,self,"DIA_Ass_394_Adept_GetPlant_01_03");	//Jak vidíš. Tady.
	B_GiveInvItems(other,self,ITPL_SUPER_HERB,1);
	Npc_RemoveInvItems(self,ITPL_SUPER_HERB,1);
	AI_Output(self,other,"DIA_Ass_394_Adept_GetPlant_01_04");	//Skvěle! Splnil jsi svou část obchodu.
	AI_Output(self,other,"DIA_Ass_394_Adept_GetPlant_01_05");	//Teď zbývá, abych já vyplnil tu mou.
	AI_Output(self,other,"DIA_Ass_394_Adept_GetPlant_01_06");	//Proto můžeš říct mistru Osairovi, že od nyní jsem jeho člověk.
	KudirGetTrollPlant = TRUE;
	B_LogEntry(TOPIC_CareOsair,"Přinesl jsem Kudirovi trolí bobuli. Od této doby je člověk mistra Osaira.");
	AI_StopProcessInfos(self);
};


instance DIA_Ass_394_Adept_KadirPissOff(C_Info)
{
	npc = Ass_394_Adept;
	nr = 1;
	condition = DIA_Ass_394_Adept_KadirPissOff_condition;
	information = DIA_Ass_394_Adept_KadirPissOff_info;
	permanent = TRUE;
	important = TRUE;
};
	
func int DIA_Ass_394_Adept_KadirPissOff_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (KudirPissOff == TRUE))
	{
		return TRUE;
	};
};	
	
func void DIA_Ass_394_Adept_KadirPissOff_info()
{
	AI_Output(self,other,"DIA_Ass_394_Adept_KadirPissOff_01_01");	//Promiň, bratře. Jsem zaneprázdněn.
	AI_StopProcessInfos(self);
};
