var int FazimRefuseTalk;
var int FazimFirstMeet;


instance DIA_Ass_391_Adept_EXIT(C_Info)
{
	npc = Ass_391_Adept;
	nr = 999;
	condition = DIA_Ass_391_Adept_exit_condition;
	information = DIA_Ass_391_Adept_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Ass_391_Adept_exit_condition()
{
	return TRUE;
};

func void DIA_Ass_391_Adept_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Ass_391_Adept_Hello(C_Info)
{
	npc = Ass_391_Adept;
	nr = 1;
	condition = DIA_Ass_391_Adept_hello_condition;
	information = DIA_Ass_391_Adept_hello_info;
	permanent = FALSE;
	description = "Jmenuješ se Famid?";
};
	
func int DIA_Ass_391_Adept_hello_condition()
{
	if((MIS_CareOsair == LOG_Running) && (FazimAgreed == FALSE))
	{
		return TRUE;
	};
};	
	
func void DIA_Ass_391_Adept_hello_info()
{
	AI_Output(other,self,"DIA_Ass_391_Adept_hello_01_01");	//Jmenuješ se Famid?
	AI_Output(self,other,"DIA_Ass_391_Adept_hello_01_02");	//Ano, bratře. Takové jméno mi dali při narození.
	AI_Output(other,self,"DIA_Ass_391_Adept_hello_01_03");	//Mám pro tebe takovou malou prácičku.
	AI_Output(self,other,"DIA_Ass_391_Adept_hello_01_04");	//A jakou? Povídej.
	AI_Output(other,self,"DIA_Ass_391_Adept_hello_01_05");	//Nechtěl bys trochu pracovat pro mistra Osaira?
	AI_Output(self,other,"DIA_Ass_391_Adept_hello_01_06");	//Mistr Osair má snad málo svých lidí, když mám pro něj pracovat?
	AI_Output(other,self,"DIA_Ass_391_Adept_hello_01_07");	//Má jich dost. Ale další lidi nejsou nikdy na škodu. Zajímá tě to teda?
	AI_Output(self,other,"DIA_Ass_391_Adept_hello_01_08");	//Hmm. Nabídka je velmi zajímavá, vzhledem k tomu, že mě ostatní převorové tolik nemusí...
	AI_Output(self,other,"DIA_Ass_391_Adept_hello_01_09");	//Avšak moje věrnost bude záležet na jeho velkorysosti.
	AI_Output(other,self,"DIA_Ass_391_Adept_hello_01_10");	//Myslíš zlato?
	AI_Output(self,other,"DIA_Ass_391_Adept_hello_01_11");	//Přesně tak. Jediné, co mě v životě zajímá, je zlato. A to v jakékoli formě!
	AI_Output(self,other,"DIA_Ass_391_Adept_hello_01_12");	//Čím více ho mám, tím líp se cítím.
	AI_Output(other,self,"DIA_Ass_391_Adept_hello_01_13");	//Takže moje nabídka tě zajímá a stačí, když se dohodneme na ceně?
	AI_Output(self,other,"DIA_Ass_391_Adept_hello_01_14");	//Přesně tak, bratře.
	FazimFirstMeet = TRUE;
	Info_ClearChoices(DIA_Ass_391_Adept_hello);

	if(Npc_HasItems(other,ItMi_Gold) < 100)
	{
		Info_AddChoice(DIA_Ass_391_Adept_hello,"Promluvíme si o tom později.",DIA_Ass_391_Adept_hello_NoGold);
	};

	if(Npc_HasItems(other,ItMi_Gold) >= 5000)
	{
		Info_AddChoice(DIA_Ass_391_Adept_hello,"Co třeba 5000 zlatých?",DIA_Ass_391_Adept_hello_5000);
	};

	if(Npc_HasItems(other,ItMi_Gold) >= 3000)
	{
		Info_AddChoice(DIA_Ass_391_Adept_hello,"Co třeba 3000 zlatých?",DIA_Ass_391_Adept_hello_3000);
	};

	if(Npc_HasItems(other,ItMi_Gold) >= 1000)
	{
		Info_AddChoice(DIA_Ass_391_Adept_hello,"Co třeba 1000 zlatých?",DIA_Ass_391_Adept_hello_1000);
	};

	if(Npc_HasItems(other,ItMi_Gold) >= 500)
	{
		Info_AddChoice(DIA_Ass_391_Adept_hello,"Co třeba 500 zlatých?",DIA_Ass_391_Adept_hello_500);
	};

	if(Npc_HasItems(other,ItMi_Gold) >= 100)
	{
		Info_AddChoice(DIA_Ass_391_Adept_hello,"Co třeba 100 zlatých?",DIA_Ass_391_Adept_hello_100);
	};
};

func void DIA_Ass_391_Adept_hello_5000()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Ass_391_Adept_hello_5000_01_01");	//Co třeba 5000 zlatých?
	AI_Output(self,other,"DIA_Ass_391_Adept_hello_5000_01_02");	//Och, otče velkorysosti. Samozřejmě, s radostí přijmu tvou nabídku!
	B_GiveInvItems(other,self,ItMi_Gold,5000);
	Npc_RemoveInvItems(self,ItMi_Gold,5000);
	AI_Output(self,other,"DIA_Ass_391_Adept_hello_5000_01_03");	//Takže můžeš říct převorovi, že jsi získal nového, velmi oddaného člověka!
	AI_Output(other,self,"DIA_Ass_391_Adept_hello_5000_01_04");	//Ano, samozřejmě.
	FazimAgreed = TRUE;
	B_LogEntry(TOPIC_CareOsair,"Koupil jsem si věrnost Famida. Teď bude pracovat pro mistra Osaira.");
	AI_StopProcessInfos(self);
};

func void DIA_Ass_391_Adept_hello_3000()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Ass_391_Adept_hello_3000_01_01");	//Co třeba 3000 zlatých?
	AI_Output(self,other,"DIA_Ass_391_Adept_hello_3000_01_02");	//Dobře, to je reálná cena za mé služby. Souhlasím, budu pracovat pro mistra Osaira.
	B_GiveInvItems(other,self,ItMi_Gold,3000);
	Npc_RemoveInvItems(self,ItMi_Gold,3000);
	AI_Output(self,other,"DIA_Ass_391_Adept_hello_3000_01_03");	//Můžeš mu to vzkázat.
	FazimAgreed = TRUE;
	B_LogEntry(TOPIC_CareOsair,"Koupil jsem si věrnost Famida. Teď bude pracovat pro mistra Osaira.");
	AI_StopProcessInfos(self);
};

func void DIA_Ass_391_Adept_hello_1000()
{
	AI_Output(other,self,"DIA_Ass_391_Adept_hello_1000_01_01");	//Co třeba 1000 zlatých?
	AI_Output(self,other,"DIA_Ass_391_Adept_hello_1000_01_02");	//To je málo, bratře. To určitě není ta část zlata, se kterou jsem počítal.
	AI_Output(other,self,"DIA_Ass_391_Adept_hello_1000_01_03");	//Vždyť to je celá hora zlata!
	AI_Output(self,other,"DIA_Ass_391_Adept_hello_1000_01_04");	//Promiň, bratře. Ale nemůžu ti s ničím pomoci. 
	AI_StopProcessInfos(self);
};

func void DIA_Ass_391_Adept_hello_500()
{
	AI_Output(other,self,"DIA_Ass_391_Adept_hello_500_01_01");	//Co třeba 500 zlatých?
	AI_Output(self,other,"DIA_Ass_391_Adept_hello_500_01_02");	//(pohrdavě) Hmmm. Za takové peníze můžeš pro mistra Osaira pracovat sám!
	AI_Output(self,other,"DIA_Ass_391_Adept_hello_500_01_03");	//Takže tím je naše jednání u konce.
	FazimRefuseTalk = TRUE;
	B_LogEntry(TOPIC_CareOsair,"Nepovedlo se mi domluvit se s Famidem. Mistr Osair s tím spokojen nebude.");
	AI_StopProcessInfos(self);
};

func void DIA_Ass_391_Adept_hello_100()
{
	AI_Output(other,self,"DIA_Ass_391_Adept_hello_100_01_01");	//Co třeba 100 zlatých? 
	AI_Output(self,other,"DIA_Ass_391_Adept_hello_100_01_02");	//(nahněvaně) Děláš si ze mě srandu, co?
	AI_Output(self,other,"DIA_Ass_391_Adept_hello_100_01_03");	//Jak myslíš bratře, oplatím ti to...
	FazimRefuseTalk = TRUE;
	B_LogEntry(TOPIC_CareOsair,"Nepovedlo se mi domluvit se s Famidem. Navíc jsem ho ještě urazil. Mistr Osair s tím spokojen nebude.");
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};

func void DIA_Ass_391_Adept_hello_NoGold()
{
	AI_Output(other,self,"DIA_Ass_391_Adept_hello_NoGold_01_01");	//Promluvíme si o tom později.
	AI_Output(self,other,"DIA_Ass_391_Adept_hello_NoGold_01_02");	//Jak myslíš, bratře.
	AI_StopProcessInfos(self);
};

instance DIA_Ass_391_Adept_FazimRefuseTalk(C_Info)
{
	npc = Ass_391_Adept;
	nr = 1;
	condition = DIA_Ass_391_Adept_FazimRefuseTalk_condition;
	information = DIA_Ass_391_Adept_FazimRefuseTalk_info;
	permanent = TRUE;
	important = TRUE;
};
	
func int DIA_Ass_391_Adept_FazimRefuseTalk_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (FazimRefuseTalk == TRUE))
	{
		return TRUE;
	};
};	
	
func void DIA_Ass_391_Adept_FazimRefuseTalk_info()
{
	AI_Output(self,other,"DIA_Ass_391_Adept_FazimRefuseTalk_01_01");	//My dva nemáme o čem diskutovat! Vypadni.
	AI_StopProcessInfos(self);
};

instance DIA_Ass_391_Adept_FazimFirstMeet(C_Info)
{
	npc = Ass_391_Adept;
	nr = 1;
	condition = DIA_Ass_391_Adept_FazimFirstMeet_condition;
	information = DIA_Ass_391_Adept_FazimFirstMeet_info;
	permanent = TRUE;
	description = "Ohledně mé nabídky s prací pro mistra Osaira...";
};
	
func int DIA_Ass_391_Adept_FazimFirstMeet_condition()
{
	if((MIS_CareOsair == LOG_Running) && (FazimAgreed == FALSE) && (FazimRefuseTalk == FALSE) && (FazimFirstMeet == TRUE))
	{
		return TRUE;
	};
};	
	
func void DIA_Ass_391_Adept_FazimFirstMeet_info()
{
	AI_Output(other,self,"DIA_Ass_391_Adept_FazimFirstMeet_01_01");	//Ohledně mé nabídky s prací pro mistra Osaira...
	AI_Output(self,other,"DIA_Ass_391_Adept_FazimFirstMeet_01_02");	//(zaujatě) Ano, ano... Co mi můžeš teda nabídnout?
	Info_ClearChoices(DIA_Ass_391_Adept_FazimFirstMeet);

	if(Npc_HasItems(other,ItMi_Gold) < 100)
	{
		Info_AddChoice(DIA_Ass_391_Adept_FazimFirstMeet,"Promluvíme si o tom později.",DIA_Ass_391_Adept_FazimFirstMeet_NoGold);
	};

	if(Npc_HasItems(other,ItMi_Gold) >= 5000)
	{
		Info_AddChoice(DIA_Ass_391_Adept_FazimFirstMeet,"Co třeba 5000 zlatých?",DIA_Ass_391_Adept_FazimFirstMeet_5000);
	};

	if(Npc_HasItems(other,ItMi_Gold) >= 3000)
	{
		Info_AddChoice(DIA_Ass_391_Adept_FazimFirstMeet,"Co třeba 3000 zlatých?",DIA_Ass_391_Adept_FazimFirstMeet_3000);
	};

	if(Npc_HasItems(other,ItMi_Gold) >= 1000)
	{
		Info_AddChoice(DIA_Ass_391_Adept_FazimFirstMeet,"Co třeba 1000 zlatých?",DIA_Ass_391_Adept_FazimFirstMeet_1000);
	};

	if(Npc_HasItems(other,ItMi_Gold) >= 500)
	{
		Info_AddChoice(DIA_Ass_391_Adept_FazimFirstMeet,"Co třeba 500 zlatých?",DIA_Ass_391_Adept_FazimFirstMeet_500);
	};

	if(Npc_HasItems(other,ItMi_Gold) >= 100)
	{
		Info_AddChoice(DIA_Ass_391_Adept_FazimFirstMeet,"Co třeba 100 zlatých?",DIA_Ass_391_Adept_FazimFirstMeet_100);
	};
};

func void DIA_Ass_391_Adept_FazimFirstMeet_5000()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Ass_391_Adept_FazimFirstMeet_5000_01_01");	//Co třeba 5000 zlatých?
	AI_Output(self,other,"DIA_Ass_391_Adept_FazimFirstMeet_5000_01_02");	//Och, otče velkorysosti. Samozřejmě, s radostí přijmu tvou nabídku!
	B_GiveInvItems(other,self,ItMi_Gold,5000);
	Npc_RemoveInvItems(self,ItMi_Gold,5000);
	AI_Output(self,other,"DIA_Ass_391_Adept_FazimFirstMeet_5000_01_03");	//Takže můžeš říct převorovi, že získal nového, velmi oddaného člověka!
	AI_Output(other,self,"DIA_Ass_391_Adept_FazimFirstMeet_5000_01_04");	//Ano, samozřejmě.
	FazimAgreed = TRUE;
	B_LogEntry(TOPIC_CareOsair,"Koupil jsem si věrnost Famida. Teď bude pracovat pro mistra Osaira.");
	AI_StopProcessInfos(self);
};

func void DIA_Ass_391_Adept_FazimFirstMeet_3000()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Ass_391_Adept_FazimFirstMeet_3000_01_01");	//Co třeba 3000 zlatých?
	AI_Output(self,other,"DIA_Ass_391_Adept_FazimFirstMeet_3000_01_02");	//Dobře, to je reálná cena za moje služby. Souhlasím, budu pracovat pro mistra Osaira.
	B_GiveInvItems(other,self,ItMi_Gold,3000);
	Npc_RemoveInvItems(self,ItMi_Gold,3000);
	AI_Output(self,other,"DIA_Ass_391_Adept_FazimFirstMeet_3000_01_03");	//Můžeš mu to vzkázat.
	FazimAgreed = TRUE;
	B_LogEntry(TOPIC_CareOsair,"Koupil jsem si věrnost Famida. Teď bude pracovat pro mistra Osaira.");
	AI_StopProcessInfos(self);
};

func void DIA_Ass_391_Adept_FazimFirstMeet_1000()
{
	AI_Output(other,self,"DIA_Ass_391_Adept_FazimFirstMeet_1000_01_01");	//Co třeba 1000 zlatých?
	AI_Output(self,other,"DIA_Ass_391_Adept_FazimFirstMeet_1000_01_02");	//Nepochopil jsi to napoprvé, co? Velká škoda!
	FazimRefuseTalk = TRUE;
	B_LogEntry(TOPIC_CareOsair,"Nepovedlo se mi domluvit se s Famidem. Mistr Osair s tím spokojen nebude.");
	AI_StopProcessInfos(self);
};

func void DIA_Ass_391_Adept_FazimFirstMeet_500()
{
	AI_Output(other,self,"DIA_Ass_391_Adept_FazimFirstMeet_500_01_01");	//Co třeba 500 zlatých?
	AI_Output(self,other,"DIA_Ass_391_Adept_FazimFirstMeet_500_01_02");	//(pohrdavě) Hmmm. Za takové peníze můžeš pro mistra Osaira pracovat sám!
	AI_Output(self,other,"DIA_Ass_391_Adept_FazimFirstMeet_500_01_03");	//Takže tím je naše jednání u konce.
	FazimRefuseTalk = TRUE;
	B_LogEntry(TOPIC_CareOsair,"Nepovedlo se mi domluvit se s Famidem. Mistr Osair s tím spokojen nebude.");
	AI_StopProcessInfos(self);
};

func void DIA_Ass_391_Adept_FazimFirstMeet_100()
{
	AI_Output(other,self,"DIA_Ass_391_Adept_FazimFirstMeet_100_01_01");	//Co třeba 100 zlatých?
	AI_Output(self,other,"DIA_Ass_391_Adept_FazimFirstMeet_100_01_02");	//(nahněvaně) Si ze mě zkoušíš dělat srandu, co?
	AI_Output(self,other,"DIA_Ass_391_Adept_FazimFirstMeet_100_01_03");	//Jak myslíš bratře, oplatím ti to...
	FazimRefuseTalk = TRUE;
	B_LogEntry(TOPIC_CareOsair,"Nepovedlo se mi domluvit se s Famidem. Navíc jsem ho ještě urazil. Mistr Osair s tím spokojen nebude.");
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};

func void DIA_Ass_391_Adept_FazimFirstMeet_NoGold()
{
	AI_Output(other,self,"DIA_Ass_391_Adept_FazimFirstMeet_NoGold_01_01");	//Promluvíme si o tom později.
	AI_Output(self,other,"DIA_Ass_391_Adept_FazimFirstMeet_NoGold_01_02");	//Jak myslíš, bratře.
	AI_StopProcessInfos(self);
};

instance DIA_Ass_391_Adept_FazimAgreed(C_Info)
{
	npc = Ass_391_Adept;
	nr = 1;
	condition = DIA_Ass_391_Adept_FazimAgreed_condition;
	information = DIA_Ass_391_Adept_FazimAgreed_info;
	permanent = TRUE;
	important = TRUE;
};
	
func int DIA_Ass_391_Adept_FazimAgreed_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (FazimAgreed == TRUE))
	{
		return TRUE;
	};
};	
	
func void DIA_Ass_391_Adept_FazimAgreed_info()
{
	AI_Output(self,other,"DIA_Ass_391_Adept_FazimAgreed_01_01");	//Promluvíme si později, bratře.
	AI_StopProcessInfos(self);
};