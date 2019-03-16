
instance DIA_Addon_Emilio_EXIT(C_Info)
{
	npc = BDT_10015_Addon_Emilio;
	nr = 999;
	condition = DIA_Addon_Emilio_EXIT_Condition;
	information = DIA_Addon_Emilio_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Emilio_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Emilio_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Emilio_PICKPOCKET(C_Info)
{
	npc = BDT_10015_Addon_Emilio;
	nr = 900;
	condition = DIA_Addon_Emilio_PICKPOCKET_Condition;
	information = DIA_Addon_Emilio_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Emilio_PICKPOCKET_Condition()
{
	return C_Beklauen(76,112);
};

func void DIA_Addon_Emilio_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Emilio_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Emilio_PICKPOCKET,Dialog_Back,DIA_Addon_Emilio_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Emilio_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Emilio_PICKPOCKET_DoIt);
};

func void DIA_Addon_Emilio_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Emilio_PICKPOCKET);
};

func void DIA_Addon_Emilio_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Emilio_PICKPOCKET);
};


instance DIA_Addon_BDT_10015_Emilio_Hi(C_Info)
{
	npc = BDT_10015_Addon_Emilio;
	nr = 1;
	condition = DIA_Addon_Emilio_Hi_Condition;
	information = DIA_Addon_Emilio_Hi_Info;
	permanent = FALSE;
	description = "Vypadáš jako kopáč.";
};


func int DIA_Addon_Emilio_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Emilio_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10015_Emilio_Hi_15_00");	//Vypadáš jako kopáč.
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Hi_10_01");	//Já JSEM kopáč. Když jsem byl naposled v dole, namakal jsem se jako kůň.
	if(SC_KnowsRavensGoldmine == FALSE)
	{
		B_LogEntry(TOPIC_Addon_RavenKDW,LogText_Addon_RavensGoldmine);
		B_LogEntry(TOPIC_Addon_Sklaven,LogText_Addon_RavensGoldmine);
		B_LogEntry(TOPIC_Addon_ScoutBandits,Log_Text_Addon_ScoutBandits);
	};
	SC_KnowsRavensGoldmine = TRUE;
};


instance DIA_Addon_BDT_10015_Emilio_Gold(C_Info)
{
	npc = BDT_10015_Addon_Emilio;
	nr = 2;
	condition = DIA_Addon_Emilio_Gold_Condition;
	information = DIA_Addon_Emilio_Gold_Info;
	permanent = FALSE;
	description = "Co se děje se zlatem z dolu?";
};


func int DIA_Addon_Emilio_Gold_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_BDT_10015_Emilio_Hi))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Emilio_Gold_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10015_Emilio_Gold_15_00");	//Co se děje se zlatem z dolu?
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Gold_10_01");	//Thorus ho hlídá a rozděluje ho. Nikdo nemá právo vzít si ho kolik chce.
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Gold_10_02");	//Každý dostává pouze část zlata - tak aby lovci a stráže neodešli s prázdnýma rukama.
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Gold_10_03");	//Řekl bych, že je to v pohodě. Od té doby, co máme tohle pravidlo, je tu méně vražd a kopáči pořád dostávají více než ti, co se tu jen poflakují.
};


instance DIA_Addon_BDT_10015_Emilio_Stein(C_Info)
{
	npc = BDT_10015_Addon_Emilio;
	nr = 3;
	condition = DIA_Addon_Emilio_Stein_Condition;
	information = DIA_Addon_Emilio_Stein_Info;
	permanent = FALSE;
	description = "A ty červené kameny?";
};


func int DIA_Addon_Emilio_Stein_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Emilio_Jetzt))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Emilio_Stein_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10015_Emilio_Stein_15_00");	//A ty červené kameny?
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Stein_10_01");	//To vymyslel Thorus s Estebanem.
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Stein_10_02");	//Thorus řídí rozdělování zlata a Esteban organizuje dělníky v dole.
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Stein_10_03");	//Samožrejmě nechce běhat za Thorusem pokaždé, když pošle někoho do dolu.
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Stein_10_04");	//Takhle mu dá jeden z těch červených kamenů a Thorus ho pustí. Je to jako vstupenka.
};


var int Emilio_Switch;

instance DIA_Addon_Emilio_Attentat(C_Info)
{
	npc = BDT_10015_Addon_Emilio;
	nr = 4;
	condition = DIA_Addon_Emilio_Attentat_Condition;
	information = DIA_Addon_Emilio_Attentat_Info;
	permanent = TRUE;
	description = "Co víš o tom útoku?";
};


func int DIA_Addon_Emilio_Attentat_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Emilio_VonEmilio) && Npc_IsDead(Senyan))
	{
		return FALSE;
	}
	else if(MIS_Judas == LOG_Running)
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
	return FALSE;
};

func void DIA_Addon_Emilio_Attentat_Info()
{
	AI_Output(other,self,"DIA_Addon_Emilio_Attentat_15_00");	//Co víš o tom útoku?
	if(Emilio_Switch == 0)
	{
		AI_Output(self,other,"DIA_Addon_Emilio_Attentat_10_01");	//(úzkostlivě) Hej, já s tím nic nemám!
		Emilio_Switch = 1;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Emilio_Attentat_10_02");	//(úzkostlivě) VŮBEC NIC!
		Emilio_Switch = 0;
	};
};


instance DIA_Addon_BDT_10015_Emilio_Senyan(C_Info)
{
	npc = BDT_10015_Addon_Emilio;
	nr = 1;
	condition = DIA_Addon_Emilio_Senyan_Condition;
	information = DIA_Addon_Emilio_Senyan_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Emilio_Senyan_Condition()
{
	if(Npc_IsDead(Senyan))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Emilio_Senyan_Info()
{
	if(Senyan_Called == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Senyan_10_00");	//(tázavě) Řekni mi PROČ Senyan volal: 'Podívejme se kohopak to tu máme'?
		AI_Output(other,self,"DIA_Addon_BDT_10015_Emilio_Senyan_15_01");	//(drsně) Nevyřízené účty.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Senyan_10_02");	//Tys zabil Senyana!
	};
	AI_Output(other,self,"DIA_Addon_BDT_10015_Emilio_Senyan_15_03");	//A máš s tím nějaký problém?
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Senyan_10_04");	//(uspěchaně) Ne, chlape, žádný problém s tím nemám.
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Senyan_10_05");	//Na druhou stranu. (sarkasticky) Je to kus práce pro Estebana.
	Senyan_CONTRA = LOG_SUCCESS;
	B_LogEntry(Topic_Addon_Esteban,"Emilio není na Estebanově straně.");
};


instance DIA_Addon_Emilio_Jetzt(C_Info)
{
	npc = BDT_10015_Addon_Emilio;
	nr = 5;
	condition = DIA_Addon_Emilio_Jetzt_Condition;
	information = DIA_Addon_Emilio_Jetzt_Info;
	permanent = FALSE;
	description = "Proč nejsi v dole?";
};


func int DIA_Addon_Emilio_Jetzt_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_BDT_10015_Emilio_Hi))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Emilio_Jetzt_Info()
{
	AI_Output(other,self,"DIA_Addon_Emilio_Jetzt_15_00");	//Proč nejsi v dole?
	AI_Output(self,other,"DIA_Addon_Emilio_Jetzt_10_01");	//(Nejistě) Byl jsem v dole dost dlouho. Nyní si potřebuji pár dnů odpočinout.
	AI_Output(self,other,"DIA_Addon_Emilio_Jetzt_10_02");	//(Povzdechne si) Tedy dokud nedostanu další červený kámen.
};


instance DIA_Addon_Emilio_VonEmilio(C_Info)
{
	npc = BDT_10015_Addon_Emilio;
	nr = 6;
	condition = DIA_Addon_Emilio_VonEmilio_Condition;
	information = DIA_Addon_Emilio_VonEmilio_Info;
	permanent = FALSE;
	description = "Lennar mi o tobě něco řekl...";
};


func int DIA_Addon_Emilio_VonEmilio_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Emilio_Jetzt) && Npc_KnowsInfo(other,DIA_Addon_Lennar_Attentat))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Emilio_VonEmilio_Info()
{
	AI_Output(other,self,"DIA_Addon_Emilio_VonEmilio_15_00");	//Lennar mi o tobě něco řekl...
	AI_Output(self,other,"DIA_Addon_Emilio_VonEmilio_10_01");	//Lennar? Ten chlap je idiot! To musíš uznat.
	AI_Output(other,self,"DIA_Addon_Emilio_VonEmilio_15_02");	//Řekl žes nebyl v dole od toho pokusu o atentát.
	AI_Output(self,other,"DIA_Addon_Emilio_VonEmilio_10_03");	//(vystrašeně) Já... nic nevím!
	if(!Npc_IsDead(Senyan))
	{
		AI_Output(self,other,"DIA_Addon_Emilio_VonEmilio_10_04");	//Pracuješ s Senyanem, nebo ne!
		AI_Output(self,other,"DIA_Addon_Emilio_VonEmilio_10_05");	//Oba jste se spojili s Estebanem. Slyšel jsem, co jste si povídali!
		AI_Output(self,other,"DIA_Addon_Emilio_VonEmilio_10_06");	//Dosud jsem s Estebanem neměl nic společnýho. Proč bych měl věřit jeho lidem.
		AI_Output(self,other,"DIA_Addon_Emilio_VonEmilio_10_07");	//Nech mě o samotě!
		AI_StopProcessInfos(self);
	};
	B_LogEntry(Topic_Addon_Esteban,"Emilio si myslí, že Lennar je idiot.");
};


instance DIA_Addon_Emilio_HilfMir(C_Info)
{
	npc = BDT_10015_Addon_Emilio;
	nr = 7;
	condition = DIA_Addon_Emilio_HilfMir_Condition;
	information = DIA_Addon_Emilio_HilfMir_Info;
	permanent = FALSE;
	description = "Pomoz mi najít lidi, co mají něco společného s atentátem na Estebana!";
};


func int DIA_Addon_Emilio_HilfMir_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Emilio_VonEmilio) && Npc_IsDead(Senyan))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Emilio_HilfMir_Info()
{
	AI_Output(other,self,"DIA_Addon_Emilio_HilfMir_15_00");	//Pomoz mi najít lidi, co mají něco společného s atentátem na Estebana!
	AI_Output(self,other,"DIA_Addon_Emilio_HilfMir_10_01");	//Ne! Nechci s tím nic mít!
	AI_Output(other,self,"DIA_Addon_Emilio_HilfMir_15_02");	//Jestli idiot jako Lennar zjistí něco o tvém podivném chování, nebude to dlouho trvat a Esteban to zjistí taky.
	AI_Output(self,other,"DIA_Addon_Emilio_HilfMir_10_03");	//(překvapeně) Já... doprdele! Řeknu pouze jméno. Nic víc.
	AI_Output(other,self,"DIA_Addon_Emilio_HilfMir_15_04");	//Poslouchám.
	AI_Output(self,other,"DIA_Addon_Emilio_HilfMir_10_05");	//Huno... běž za Hunem. Měl by něco vědět.
	Emilio_TellAll = TRUE;
	B_LogEntry(Topic_Addon_Esteban,"Z Emilia nakonec vypadlo ještě jedno jméno - Huno.");
};


instance DIA_Addon_Emilio_GegenEsteban(C_Info)
{
	npc = BDT_10015_Addon_Emilio;
	nr = 8;
	condition = DIA_Addon_Emilio_GegenEsteban_Condition;
	information = DIA_Addon_Emilio_GegenEsteban_Info;
	permanent = FALSE;
	description = "Co máš proti Estebanovi?";
};


func int DIA_Addon_Emilio_GegenEsteban_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_BDT_10015_Emilio_Senyan))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Emilio_GegenEsteban_Info()
{
	AI_Output(other,self,"DIA_Addon_Emilio_GegenEsteban_15_00");	//Co máš proti Estebanovi?
	AI_Output(self,other,"DIA_Addon_Emilio_GegenEsteban_10_01");	//To prase myslí jen na peníze.
	AI_Output(self,other,"DIA_Addon_Emilio_GegenEsteban_10_02");	//Každý den je někdo sežrán důlními červy.
	AI_Output(self,other,"DIA_Addon_Emilio_GegenEsteban_10_03");	//Ale Esteban nechce poslat do dolu íky.
	AI_Output(self,other,"DIA_Addon_Emilio_GegenEsteban_10_04");	//A proč? Protože chlapi jsou součástí 'Ravenovy stráže' a on se bojí jim něco přikázat.
	AI_Output(self,other,"DIA_Addon_Emilio_GegenEsteban_10_05");	//Namísto toho nás raději nechají všechny chcípnout.
};


instance DIA_Addon_BDT_10015_Emilio_Mine(C_Info)
{
	npc = BDT_10015_Addon_Emilio;
	nr = 9;
	condition = DIA_Addon_Emilio_Mine_Condition;
	information = DIA_Addon_Emilio_Mine_Info;
	permanent = FALSE;
	description = DIALOG_ADDON_MINE_DESCRIPTION;
};


func int DIA_Addon_Emilio_Mine_Condition()
{
	if((MIS_Send_Buddler == LOG_Running) && (Player_SentBuddler < 3) && (Npc_HasItems(other,ItMi_Addon_Stone_01) >= 1))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Emilio_Mine_Info()
{
	B_Say(other,self,"$MINE_ADDON_DESCRIPTION");
	B_GiveInvItems(other,self,ItMi_Addon_Stone_01,1);
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Mine_10_00");	//Tak, nyní jsi tu šéf ty. Dobrá, pak to udělám po tvém.
	Player_SentBuddler = Player_SentBuddler + 1;
	B_GivePlayerXP(XP_Addon_MINE);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"MINE");
};


instance DIA_Addon_Emilio_Hacker(C_Info)
{
	npc = BDT_10015_Addon_Emilio;
	nr = 9;
	condition = DIA_Addon_Emilio_Hacker_Condition;
	information = DIA_Addon_Emilio_Hacker_Info;
	permanent = TRUE;
	description = "Co je nového?";
};


func int DIA_Addon_Emilio_Hacker_Condition()
{
	if(Npc_GetDistToWP(self,"ADW_MINE_09_PICK") <= 500)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Emilio_Hacker_Info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10004_Emilio_Hacker_15_00");	//Co je nového?
	AI_Output(self,other,"DIA_Addon_BDT_10004_Emilio_Hacker_10_01");	//Pracuju opravdu tvrdě. No, nejdůležitější věc je, že se nestanu žrádlem pro červy.
};

