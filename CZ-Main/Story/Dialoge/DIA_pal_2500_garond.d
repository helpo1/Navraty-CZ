
instance DIA_PAL_2500_GAROND_EXIT(C_Info)
{
	npc = pal_2500_garond;
	nr = 999;
	condition = dia_pal_2500_garond_exit_condition;
	information = dia_pal_2500_garond_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_2500_garond_exit_condition()
{
	return TRUE;
};

func void dia_pal_2500_garond_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_2500_GAROND_EXITNW(C_Info)
{
	npc = pal_2500_garond;
	nr = 1;
	condition = dia_pal_2500_garond_exitnw_condition;
	information = dia_pal_2500_garond_exitnw_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_pal_2500_garond_exitnw_condition()
{
	return TRUE;
};

func void dia_pal_2500_garond_exitnw_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_PAL_2500_Garond_ExitNW_01_00");	//Nějaké problémy?
	AI_Output(self,other,"DIA_PAL_2500_Garond_ExitNW_01_01");	//(zadýchaně) Nemyslel jsem, že cesta z údolí bude tak dobře střežená.
	AI_Output(other,self,"DIA_PAL_2500_Garond_ExitNW_01_02");	//Ano, skřeti jsou teď opravdu všude. Celý ostrov se hemží jejich hlídkami.
	AI_Output(self,other,"DIA_PAL_2500_Garond_ExitNW_01_03");	//Opravdu? (ustaraně) Vypadá to tak, že je to tady ještě horší než v Hornickém údolí. Jak je na tom město?
	AI_Output(other,self,"DIA_PAL_2500_Garond_ExitNW_01_06");	//Khorinis padl! Je v rukách skřetů.
	AI_Output(self,other,"DIA_PAL_2500_Garond_ExitNW_01_07");	//U Innose! To je ta nejhorší zpráva, jakou jsem od tebe mohl slyšet. I když jsem předpokládal, že po útoku na hrad se skřeti jen tak nezastaví...
	AI_Output(other,self,"DIA_PAL_2500_Garond_ExitNW_01_08");	//Co jsem slyšel, tak skřeti vzali město útokem a za jediný den vyvraždili skoro všechny obyvatele.
	AI_Output(other,self,"DIA_PAL_2500_Garond_ExitNW_01_09");	//Unikla jenom část posádky lorda Hagena a pár šťastlivců. Všichni ostatní zemřeli.
	AI_Output(self,other,"DIA_PAL_2500_Garond_ExitNW_01_10");	//(naštvaně) Proklatě! Odporná stvoření! Kolik krve se ještě bude muset prolít, než nastane konec?
	AI_Output(self,other,"DIA_PAL_2500_Garond_ExitNW_01_13");	//Kde je teď lord Hagen a jeho lidé?
	AI_Output(other,self,"DIA_PAL_2500_Garond_ExitNW_01_14");	//Stáhli se do pevnosti Azgan. Myslím, že byste tam taky měli jít.
	AI_Output(self,other,"DIA_PAL_2500_Garond_ExitNW_01_15");	//(podrážděně) No abych byl upřímný, tak ústup z boje není zrovna můj způsob.
	AI_Output(other,self,"DIA_PAL_2500_Garond_ExitNW_01_16");	//Bojím se, že teď nemáte jinou možnost.
	AI_Output(other,self,"DIA_PAL_2500_Garond_ExitNW_01_17");	//Tvoji lidé jsou úplně vyčerpaní. Potřebují alespoň malý odpočinek.
	AI_Output(other,self,"DIA_PAL_2500_Garond_ExitNW_01_19");	//Raději mě poslechni a jdi na Azgan za Hagenem. Potřebujete to.
	AI_Output(self,other,"DIA_PAL_2500_Garond_ExitNW_01_20");	//Tak dobře, možná máš pravdu. Neměli bychom se uspěchat.
	AI_Output(self,other,"DIA_PAL_2500_Garond_ExitNW_01_21");	//I když mám pod svým velením teď ani ne stovku statečných rytířů, ukázal bych těmhle stvůrám, co znamená být paladinem!
	AI_Output(self,other,"DIA_PAL_2500_Garond_ExitNW_01_24");	//(vážně) Ale dobrá. Jdeme do pevnosti! Musíme si odpočinout.
	GARONDGOFORT = TRUE;
	if(MIS_RESCUEGAROND == LOG_Running)
	{
		B_LogEntry(TOPIC_RESCUEGAROND,"Vyvedl jsem paladina Garonda a jeho muže z Hornického údolí. Měl bych jít do pevnosti říct to lordu Hagenovi.");
	};
	AI_StopProcessInfos(self);
};

instance DIA_PAL_2500_GAROND_PERMEXITNW(C_Info)
{
	npc = pal_2500_garond;
	nr = 1;
	condition = dia_pal_2500_garond_permexitnw_condition;
	information = dia_pal_2500_garond_permexitnw_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_pal_2500_garond_permexitnw_condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_2500_garond_exitnw) && Npc_IsInState(self,ZS_Talk) && (HAGENOTHERSAGREED == FALSE) && (MIS_LostPaladins == LOG_Success))
	{
		return TRUE;
	};
};

func void dia_pal_2500_garond_permexitnw_info()
{
	AI_Output(self,other,"DIA_PAL_2500_Garond_PermExitNW_01_01");	//Uvidíme se v pevnosti, příteli!
	AI_Output(other,self,"DIA_PAL_2500_Garond_PermExitNW_01_02");	//Jistě.
	AI_StopProcessInfos(self);
};


instance DIA_PAL_2500_Garond_VenzelDone(C_Info)
{
	npc = PAL_2500_Garond;
	nr = 2;
	condition = DIA_PAL_2500_Garond_VenzelDone_condition;
	information = DIA_PAL_2500_Garond_VenzelDone_info;
	permanent = FALSE;
	description = "Zjistil jsem, co se stalo s Wenzelem.";
};

func int DIA_PAL_2500_Garond_VenzelDone_condition()
{
	if((MIS_LostPaladins == LOG_Running) && (MIS_EscapeMine == LOG_Success))
	{
		return TRUE;
	};
};

func void DIA_PAL_2500_Garond_VenzelDone_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_PAL_2500_Garond_VenzelDone_01_01");	//Zjistil jsem, co se stalo s Wenzelem.
	AI_Output(self,other,"DIA_PAL_2500_Garond_VenzelDone_01_02");	//Tak mluv, rychle. Je naživu?
	AI_Output(other,self,"DIA_PAL_2500_Garond_VenzelDone_01_03");	//Žije, ale byl zajat skřety. Poslali ho do dolu těžit železnou rudu.
	AI_Output(self,other,"DIA_PAL_2500_Garond_VenzelDone_01_04");	//Chvála Innosovi... (ulehčeně) Takže ještě není všechno ztraceno! Musíme ho dostat ven.
	AI_Output(other,self,"DIA_PAL_2500_Garond_VenzelDone_01_05");	//Není třeba. V skřetím dole jsem našel magický portál.
	AI_Output(other,self,"DIA_PAL_2500_Garond_VenzelDone_01_06");	//Wenzel a ostatní otroci ho použili, aby utekli.
	AI_Output(other,self,"DIA_PAL_2500_Garond_VenzelDone_01_07");	//Nicméně ten portál pravděpodobně vede přímo na pevninu.
	AI_Output(other,self,"DIA_PAL_2500_Garond_VenzelDone_01_08");	//Proto ti Wenzel vzkazuje, že se už na Khorinis asi nevrátí.
	AI_Output(self,other,"DIA_PAL_2500_Garond_VenzelDone_01_09");	//Nu, budiž. Hlavně, že bude v pořádku.
	AI_Output(other,self,"DIA_PAL_2500_Garond_VenzelDone_01_10");	//Říkal, že se vrátí do Myrtany a bude tam bojovat se skřety.
	AI_Output(other,self,"DIA_PAL_2500_Garond_VenzelDone_01_11");	//Vypadá to, že měl pravdu, když říkal, že král je na tom stejně špatně jako vy.
	AI_Output(self,other,"DIA_PAL_2500_Garond_VenzelDone_01_12");	//Ti zatracení skřeti... (nahněvaně) Zamořili tuhle krajinu jako kobylky!
	AI_Output(self,other,"DIA_PAL_2500_Garond_VenzelDone_01_13");	//Ale my budeme bojovat do posledního muže! Nenecháme se jimi zlomit!
	AI_Output(self,other,"DIA_PAL_2500_Garond_VenzelDone_01_14");	//A ohledně kontinentu... (neochotně) Nebudu ti lhát. Je to pravda.
	AI_Output(self,other,"DIA_PAL_2500_Garond_VenzelDone_01_15");	//Král se z posledních sil snaží zadržet hordy skřetů z Nordmaru.
	AI_Output(self,other,"DIA_PAL_2500_Garond_VenzelDone_01_16");	//Ale nepovede se mu to. Skřetů je příliš mnoho a král nemá dost vojáků ani zbraní.
	AI_Output(self,other,"DIA_PAL_2500_Garond_VenzelDone_01_17");	//My jsme nyní jedinou nadějí. Magická ruda by možná dokázala otočit průběh války.
	AI_Output(self,other,"DIA_PAL_2500_Garond_VenzelDone_01_18");	//Ale, jak vidíš, i my máme plno práce s odrážením skřetů.
	AI_Output(self,other,"DIA_PAL_2500_Garond_VenzelDone_01_19");	//Nejsem zvyklý vzdávat se, ale... (odevzdaně) Tahle válka je už zřejmě nadobro prohraná.
	AI_Output(self,other,"DIA_PAL_2500_Garond_VenzelDone_01_20");	//Ale ať tě ani nenapadne o tom někomu říkat!
	AI_Output(self,other,"DIA_PAL_2500_Garond_VenzelDone_01_21");	//Nedovolím, aby mí muži ztratili morálku jen kvůli nějakým hloupým dohadům.
	AI_Output(other,self,"DIA_PAL_2500_Garond_VenzelDone_01_22");	//Samo sebou.
	MIS_LostPaladins = LOG_Success;
	Log_SetTopicStatus(TOPIC_LostPaladins,LOG_Success);
	B_LogEntry(TOPIC_LostPaladins,"Řekl jsem Garondovi o Wenzelově osudu.");
};