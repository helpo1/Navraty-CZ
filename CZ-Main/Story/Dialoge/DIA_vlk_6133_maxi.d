
instance DIA_VLK_6133_MAXI_EXIT(C_Info)
{
	npc = vlk_6133_maxi;
	nr = 999;
	condition = dia_vlk_6133_maxi_exit_condition;
	information = dia_vlk_6133_maxi_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_vlk_6133_maxi_exit_condition()
{
	return TRUE;
};

func void dia_vlk_6133_maxi_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_VLK_6133_MAXI_HALLO(C_Info)
{
	npc = vlk_6133_maxi;
	nr = 2;
	condition = dia_vlk_6133_maxi_hallo_condition;
	information = dia_vlk_6133_maxi_hallo_info;
	permanent = FALSE;
	description = "Zdravím!";
};


func int dia_vlk_6133_maxi_hallo_condition()
{
	return TRUE;
};

func void dia_vlk_6133_maxi_hallo_info()
{
	AI_Output(other,self,"DIA_VLK_6133_Maxi_Hallo_01_00");	//Zdravím!
	AI_Output(self,other,"DIA_VLK_6133_Maxi_Hallo_01_01");	//Hej! Co po mě chceš? Nemáš pro mě nějakou práci?
	AI_Output(other,self,"DIA_VLK_6133_Maxi_Hallo_01_02");	//Ne, nic pro tebe nemám.
	AI_Output(self,other,"DIA_VLK_6133_Maxi_Hallo_01_03");	//(vztekle) Tak proč mě otravuješ? Copak nevidíš - jsem zaneprázdněn!
	AI_Output(other,self,"DIA_VLK_6133_Maxi_Hallo_01_04");	//A jak jsi zaneprázdněn?
	AI_Output(self,other,"DIA_VLK_6133_Maxi_Hallo_01_05");	//Stojím tu a snažím se, abych nepropásl moment, až se některému z obchodníků bude hodit někdo, jako já.
	AI_Output(self,other,"DIA_VLK_6133_Maxi_Hallo_01_06");	//A ty se mě ptáš na nějaké kraviny a tím mě rušíš!
};


instance DIA_VLK_6133_MAXI_WHATDO(C_Info)
{
	npc = vlk_6133_maxi;
	nr = 2;
	condition = dia_vlk_6133_maxi_whatdo_condition;
	information = dia_vlk_6133_maxi_whatdo_info;
	permanent = FALSE;
	description = "A na co, že tu ve skutečnosti čekáš?";
};


func int dia_vlk_6133_maxi_whatdo_condition()
{
	if(Npc_KnowsInfo(other,dia_vlk_6133_maxi_hallo))
	{
		return TRUE;
	};
};

func void dia_vlk_6133_maxi_whatdo_info()
{
	AI_Output(other,self,"DIA_VLK_6133_Maxi_WhatDo_01_00");	//Já jen něčemu trochu nerozumím. Na co právě ve skutečnosti čekáš?
	AI_Output(self,other,"DIA_VLK_6133_Maxi_WhatDo_01_01");	//Čekám, až jeden z obchodníků bude potřebovat pomoci.
	AI_Output(self,other,"DIA_VLK_6133_Maxi_WhatDo_01_03");	//Jsem připravený vzít jakoukoliv jejich špinavou prácičku - v tomto oboru se dost dobře vyznám.
	AI_Output(other,self,"DIA_VLK_6133_Maxi_WhatDo_01_04");	//Ty se zabýváš obchodem?
	AI_Output(self,other,"DIA_VLK_6133_Maxi_WhatDo_01_05");	//Samozřejmě! Také umím trochu číst a psát.
	AI_Output(other,self,"DIA_VLK_6133_Maxi_WhatDo_01_06");	//Proč to prostě neřekneš.
	AI_Output(self,other,"DIA_VLK_6133_Maxi_WhatDo_01_08");	//Ano. Pracoval jsem už pro jednoho obchodníka, ale nedávno zkrachoval a já zůstal bez práce.
	AI_Output(self,other,"DIA_VLK_6133_Maxi_WhatDo_01_10");	//A proto hledám někoho nového, kdo by mě zaměstnal.
	AI_Output(other,self,"DIA_VLK_6133_Maxi_WhatDo_01_11");	//Všemu rozumím. Ale já si myslím, že tu budeš stát ještě dlouho.
	AI_Output(self,other,"DIA_VLK_6133_Maxi_WhatDo_01_12");	//Co? Pakuj se odsud! Adanův hněv na tebe.
	AI_StopProcessInfos(self);
};


instance DIA_VLK_6133_MAXI_PERM(C_Info)
{
	npc = vlk_6133_maxi;
	nr = 2;
	condition = dia_vlk_6133_maxi_perm_condition;
	information = dia_vlk_6133_maxi_perm_info;
	permanent = TRUE;
	description = "Jak to jde?";
};


func int dia_vlk_6133_maxi_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_vlk_6133_maxi_whatdo) && (FINDPERSONTWO == FALSE))
	{
		return TRUE;
	};
};

func void dia_vlk_6133_maxi_perm_info()
{
	AI_Output(other,self,"DIA_VLK_6133_Maxi_Perm_01_00");	//Jak to jde?
	AI_Output(self,other,"DIA_VLK_6133_Maxi_Perm_01_01");	//A proč se zajímáš?
	AI_Output(other,self,"DIA_VLK_6133_Maxi_Perm_01_02");	//Možná mám pro tebe práci.
	AI_Output(self,other,"DIA_VLK_6133_Maxi_Perm_01_03");	//Stejný obor? A jakou?
	AI_Output(other,self,"DIA_VLK_6133_Maxi_Perm_01_04");	//Dobrá otázka. Budu o tom přemýšlet...
	AI_Output(self,other,"DIA_VLK_6133_Maxi_Perm_01_05");	//Dej si odchod. Co jsem ti udělal, že mi musíš neustále lézt na nervy?
	AI_StopProcessInfos(self);
};


instance DIA_VLK_6133_MAXI_HIRE(C_Info)
{
	npc = vlk_6133_maxi;
	nr = 2;
	condition = dia_vlk_6133_maxi_hire_condition;
	information = dia_vlk_6133_maxi_hire_info;
	permanent = FALSE;
	description = "Mám pro tebe práci.";
};


func int dia_vlk_6133_maxi_hire_condition()
{
	if(Npc_KnowsInfo(other,dia_vlk_6133_maxi_whatdo) && (MIS_TRADEHELPER == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_vlk_6133_maxi_hire_info()
{
	AI_Output(other,self,"DIA_VLK_6133_Maxi_Hire_01_00");	//Mám pro tebe práci.
	AI_Output(self,other,"DIA_VLK_6133_Maxi_Hire_01_01");	//Jo? A co mi můžeš nabídnout?
	AI_Output(other,self,"DIA_VLK_6133_Maxi_Hire_01_03");	//Jeden vlivný obchodník v horní čtvrti hledá člověka na pozici jeho pomocníka.
	AI_Output(other,self,"DIA_VLK_6133_Maxi_Hire_01_04");	//Práce spočívá v tom, dělat pro něj různou těžkou práci a pomáhat mu vést obchod.
	AI_Output(self,other,"DIA_VLK_6133_Maxi_Hire_01_05");	//Ohó! To fakt nezní špatně!
	AI_Output(other,self,"DIA_VLK_6133_Maxi_Hire_01_06");	//Myslel jsem, že by se mu tvoje pomoc mohla hodit.
	AI_Output(self,other,"DIA_VLK_6133_Maxi_Hire_01_07");	//To je vyníkající nabídka! Můžeš počítat, že máš můj souhlas v kapse.
	AI_Output(other,self,"DIA_VLK_6133_Maxi_Hire_01_08");	//Dobře! Ale pro začátek mi řekni, co umíš?
	AI_Output(self,other,"DIA_VLK_6133_Maxi_Hire_01_09");	//Jak už jsem ti říkal, pracoval jsem pro jednoho obchodníka a celkově byl s mou prací spokojen.
	AI_Output(self,other,"DIA_VLK_6133_Maxi_Hire_01_10");	//Umím trochu číst a psát a v tomto oboru to mnoho značí!
	AI_Output(self,other,"DIA_VLK_6133_Maxi_Hire_01_11");	//Mimo to, se nestydím ani špinavější prácičky dělníka nebo poslíčka. Můžu dělat vše!
	AI_Output(other,self,"DIA_VLK_6133_Maxi_Hire_01_12");	//To fakt nezní špatně.
	AI_Output(other,self,"DIA_VLK_6133_Maxi_Hire_01_14");	//Ještě si to promyslím, ale s největší pravděpodobností se za tebou vrátím.
	AI_Output(self,other,"DIA_VLK_6133_Maxi_Hire_01_15");	//Dobře, ale nepřemýšlej dlouho. Takových pracovníků jako já, na cestě nenajdeš.
	B_LogEntry(TOPIC_TRADEHELPER,"Maxi souhlasil s prací Luterova pomocníka. I když, možná ještě někdo jiný přistoupí na tuto práci.");
	MAXIAGREE = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_VLK_6133_MAXI_HIREOK(C_Info)
{
	npc = vlk_6133_maxi;
	nr = 2;
	condition = dia_vlk_6133_maxi_hireok_condition;
	information = dia_vlk_6133_maxi_hireok_info;
	permanent = FALSE;
	description = "Pojďme za tím obchodníkem.";
};


func int dia_vlk_6133_maxi_hireok_condition()
{
	if((MAXIAGREE == TRUE) && (MIS_TRADEHELPER == LOG_Running) && (FINDPERSONONE == FALSE) && (FINDPERSONTWO == FALSE) && (FINDPERSONTHREE == FALSE))
	{
		return TRUE;
	};
};

func void dia_vlk_6133_maxi_hireok_info()
{
	AI_Output(other,self,"DIA_VLK_6133_Maxi_HireOk_01_00");	//Pojďme za tím obchodníkem.
	AI_Output(other,self,"DIA_VLK_6133_Maxi_HireOk_01_01");	//Myslím, že ty jsi ta osoba, kterou ten obchodník potřebuje.
	AI_Output(self,other,"DIA_VLK_6133_Maxi_HireOk_01_02");	//Výborně! Jdeme!
	B_LogEntry(TOPIC_TRADEHELPER,"Rozhodl jsem se vybrat Maxiho. Docela se vyzná v práci, která mu bude nabídnuta. Doufám, že Lutero ocení můj výběr.");
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	FINDPERSONTWO = TRUE;
	Npc_ExchangeRoutine(self,"FOLLOW");
};


instance DIA_VLK_6133_MAXI_THANKS(C_Info)
{
	npc = vlk_6133_maxi;
	nr = 2;
	condition = dia_vlk_6133_maxi_thanks_condition;
	information = dia_vlk_6133_maxi_thanks_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_vlk_6133_maxi_thanks_condition()
{
	if(MAXIHIRED == TRUE)
	{
		return TRUE;
	};
};

func void dia_vlk_6133_maxi_thanks_info()
{
	AI_Output(self,other,"DIA_VLK_6133_Maxi_Thanks_01_00");	//Chtěl bych ti poděkovat, že jsi mi pomohl sehnat tuhle práci!
	AI_Output(other,self,"DIA_VLK_6133_Maxi_Thanks_01_01");	//Doufám, že mi nedáš důvod přemýšlet, že jsem udělal chybu, když jsem tě Luterovi navrhl.
	AI_Output(self,other,"DIA_VLK_6133_Maxi_Thanks_01_02");	//Ne, co si myslíš! Budu svou práci dělat tak dobře jak jen dovedu...
	AI_StopProcessInfos(self);
};


instance DIA_VLK_6133_MAXI_NEWLIFE(C_Info)
{
	npc = vlk_6133_maxi;
	nr = 2;
	condition = dia_vlk_6133_maxi_newlife_condition;
	information = dia_vlk_6133_maxi_newlife_info;
	permanent = TRUE;
	description = "Jak to jde?";
};


func int dia_vlk_6133_maxi_newlife_condition()
{
	if(MAXIHIRED == TRUE)
	{
		return TRUE;
	};
};

func void dia_vlk_6133_maxi_newlife_info()
{
	AI_Output(other,self,"DIA_VLK_6133_Maxi_NewLife_01_00");	//Jak to jde?
	AI_Output(self,other,"DIA_VLK_6133_Maxi_NewLife_01_01");	//Výborně! Všichni jsou spokojení.
	AI_StopProcessInfos(self);
};


instance DIA_VLK_6133_MAXI_PICKPOCKET(C_Info)
{
	npc = vlk_6133_maxi;
	nr = 900;
	condition = dia_vlk_6133_maxi_pickpocket_condition;
	information = dia_vlk_6133_maxi_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_vlk_6133_maxi_pickpocket_condition()
{
	return C_Beklauen(60,90);
};

func void dia_vlk_6133_maxi_pickpocket_info()
{
	Info_ClearChoices(dia_vlk_6133_maxi_pickpocket);
	Info_AddChoice(dia_vlk_6133_maxi_pickpocket,Dialog_Back,dia_vlk_6133_maxi_pickpocket_back);
	Info_AddChoice(dia_vlk_6133_maxi_pickpocket,DIALOG_PICKPOCKET,dia_vlk_6133_maxi_pickpocket_doit);
};

func void dia_vlk_6133_maxi_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_vlk_6133_maxi_pickpocket);
};

func void dia_vlk_6133_maxi_pickpocket_back()
{
	Info_ClearChoices(dia_vlk_6133_maxi_pickpocket);
};

