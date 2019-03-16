instance DIA_Ass_392_Adept_EXIT(C_Info)
{
	npc = Ass_392_Adept;
	nr = 999;
	condition = DIA_Ass_392_Adept_exit_condition;
	information = DIA_Ass_392_Adept_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Ass_392_Adept_exit_condition()
{
	return TRUE;
};

func void DIA_Ass_392_Adept_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Ass_392_Adept_Hello(C_Info)
{
	npc = Ass_392_Adept;
	nr = 1;
	condition = DIA_Ass_392_Adept_hello_condition;
	information = DIA_Ass_392_Adept_hello_info;
	permanent = FALSE;
	description = "Kdo jsi?";
};
	
func int DIA_Ass_392_Adept_hello_condition()
{
	return TRUE;
};	
	
func void DIA_Ass_392_Adept_hello_info()
{
	AI_Output(other,self,"DIA_Ass_392_Adept_hello_01_01");	//Kdo jsi?
	AI_Output(self,other,"DIA_Ass_392_Adept_hello_01_02");	//Jmenuji se Rafat, bratře.
	AI_Output(other,self,"DIA_Ass_392_Adept_hello_01_03");	//Neviděl jsem tě předtím v chrámu.
	AI_Output(self,other,"DIA_Ass_392_Adept_hello_01_04");	//To mě nepřekvapuje. Koneckonců téměř všechen svůj čas trávím v modlitbách u Beliarova oltáře v údolí.
	AI_Output(other,self,"DIA_Ass_392_Adept_hello_01_05");	//A proč se nemodlíš v chrámu?
	AI_Output(self,other,"DIA_Ass_392_Adept_hello_01_06");	//Ech... to je docela dlouhý příběh, bratře.
	AI_Output(other,self,"DIA_Ass_392_Adept_hello_01_07");	//Rád si ho vyslechnu.
	AI_Output(self,other,"DIA_Ass_392_Adept_hello_01_08");	//Abych to zkrátil, prostě se tam nemohu jít modlit!
	AI_Output(other,self,"DIA_Ass_392_Adept_hello_01_09");	//Ale proč?
	AI_Output(self,other,"DIA_Ass_392_Adept_hello_01_10");	//Protože mi to mistr Haniar zakázal, dokud můj duch nebude plný síly a odhodlání.
	AI_Output(other,self,"DIA_Ass_392_Adept_hello_01_11");	//Vypadá to tak, že ses něčím vůči němu provinil.
	AI_Output(self,other,"DIA_Ass_392_Adept_hello_01_12");	//Ano, máš pravdu. Ale nechci o tom mluvit.
};

instance DIA_Ass_392_Adept_Deal(C_Info)
{
	npc = Ass_392_Adept;
	nr = 1;
	condition = DIA_Ass_392_Adept_Deal_condition;
	information = DIA_Ass_392_Adept_Deal_info;
	permanent = FALSE;
	description = "Pracuješ pro mistra Haniara?";
};
	
func int DIA_Ass_392_Adept_Deal_condition()
{
	if(Npc_KnowsInfo(other,DIA_Ass_392_Adept_hello) && (MIS_CareOsair == LOG_Running))
	{
		return TRUE;
	};
};	
	
func void DIA_Ass_392_Adept_Deal_info()
{
	AI_Output(other,self,"DIA_Ass_392_Adept_Deal_01_01");	//Pracuješ pro mistra Haniara?
	AI_Output(self,other,"DIA_Ass_392_Adept_Deal_01_02");	//Ne tak docela. Haniar je jen můj duchovní vůdce.
	AI_Output(self,other,"DIA_Ass_392_Adept_Deal_01_03");	//I když jsem to popravdě již několikrát olitoval. Zvláště po tom případu s Hasimem.
	AI_Output(other,self,"DIA_Ass_392_Adept_Deal_01_04");	//A nepřemýšlel jsi nad změnou svého mentora?
	AI_Output(self,other,"DIA_Ass_392_Adept_Deal_01_05");	//Nemyslím, že by mě některý z převorů chtěl vzít pod svou ochranu.
	AI_Output(self,other,"DIA_Ass_392_Adept_Deal_01_06");	//A navíc by Haniar začal zuřit, až by se o tom dověděl.
	AI_Output(other,self,"DIA_Ass_392_Adept_Deal_01_07");	//Slyšel jsem, že mistr Osair hledá věrné lidi, jako jsi ty.
	AI_Output(self,other,"DIA_Ass_392_Adept_Deal_01_08");	//Myslíš to vážně? Nebo jen zkoušíš mou trpělivost?
	AI_Output(other,self,"DIA_Ass_392_Adept_Deal_01_09");	//Jen jsem ti to chtěl říct, abys nepropásl tuhle příležitost.
	AI_Output(other,self,"DIA_Ass_392_Adept_Deal_01_10");	//A pak možná opět dostaneš svolení modlit se v chrámu.
	AI_Output(self,other,"DIA_Ass_392_Adept_Deal_01_11");	//Hmm... (zamyšleně) To by bylo skvělé!
	AI_Output(self,other,"DIA_Ass_392_Adept_Deal_01_12");	//Ale dokud nebudu mít jistotu, takový krok raději neučiním.
	AI_Output(other,self,"DIA_Ass_392_Adept_Deal_01_13");	//A pokud si promluvím s Osairem a on ti to svolení dá?
	AI_Output(self,other,"DIA_Ass_392_Adept_Deal_01_14");	//Pak ho možná požádám, aby se stal mým mentorem.
	AI_Output(self,other,"DIA_Ass_392_Adept_Deal_01_15");	//Ale určitě to neudělám, dokud nedostanu jeho souhlas.
	AI_Output(other,self,"DIA_Ass_392_Adept_Deal_01_16");	//Dobrá, rozumím ti.
	RafatNeedPermission = TRUE;
	B_LogEntry(TOPIC_CareOsair,"Rafat se chce opět modlit v chrámu, ale dokud nedostane svolení některého převora, má smůlu. Musím si o tom promluvit s Osairem.");
};

instance DIA_Ass_392_Adept_Deal_Done(C_Info)
{
	npc = Ass_392_Adept;
	nr = 1;
	condition = DIA_Ass_392_Adept_Deal_Done_condition;
	information = DIA_Ass_392_Adept_Deal_Done_info;
	permanent = FALSE;
	description = "Můžeš opět modlit v chrámu.";
};
	
func int DIA_Ass_392_Adept_Deal_Done_condition()
{
	if((MIS_CareOsair == LOG_Running) && (RafatGetPermission == TRUE))
	{
		return TRUE;
	};
};	
	
func void DIA_Ass_392_Adept_Deal_Done_info()
{
	B_GivePlayerXP(400);
	AI_Output(other,self,"DIA_Ass_392_Adept_Deal_Done_01_01");	//Už se můžeš opět modlit v chrámu.
	AI_Output(self,other,"DIA_Ass_392_Adept_Deal_Done_01_02");	//(nedůvěřivě) Opravdu?
	AI_Output(other,self,"DIA_Ass_392_Adept_Deal_Done_01_03");	//Mistr Osair ti dal svůj souhlas. Nemusíš se už ničeho obávat.
	AI_Output(self,other,"DIA_Ass_392_Adept_Deal_Done_01_04");	//Pak bych mu to zřejmě měl oplatit.
	B_LogEntry(TOPIC_CareOsair,"Rafat se po Osairově souhlasu může opět modlit v chrámu. A řady lidí věrných Osairovi se znovu o něco rozšíří.");
	RafatAgreed = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"PrayInHram");
};