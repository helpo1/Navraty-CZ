
instance DIA_PAL_25000_GAROND_EXIT(C_Info)
{
	npc = pal_25000_garond;
	nr = 999;
	condition = dia_pal_25000_garond_exit_condition;
	information = dia_pal_25000_garond_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_25000_garond_exit_condition()
{
	return TRUE;
};

func void dia_pal_25000_garond_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_25000_GAROND_EXITNW(C_Info)
{
	npc = pal_25000_garond;
	nr = 1;
	condition = dia_pal_25000_garond_exitnw_condition;
	information = dia_pal_25000_garond_exitnw_info;
	permanent = FALSE;
	description = "Nyní jste v bezpečí.";
};


func int dia_pal_25000_garond_exitnw_condition()
{
	return TRUE;
};

func void dia_pal_25000_garond_exitnw_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_PAL_25000_Garond_ExitNW_01_00");	//Nyní jste v bezpečí.
	AI_Output(self,other,"DIA_PAL_25000_Garond_ExitNW_01_01");	//Ano, ale skřeti stále obléhají Khorinis. Není čas na oslavy.
	AI_Output(self,other,"DIA_PAL_25000_Garond_ExitNW_01_02");	//Musíme něco podniknout a vyhnat je z ostrova, jinak byla naše snaha marná!
	AI_Output(other,self,"DIA_PAL_25000_Garond_ExitNW_01_03");	//Neměj obavy, něco vymyslíme!
	AI_Output(self,other,"DIA_PAL_25000_Garond_ExitNW_01_04");	//To doufám.
};


instance DIA_PAL_25000_GAROND_PERMEXITNW(C_Info)
{
	npc = pal_25000_garond;
	nr = 1;
	condition = dia_pal_25000_garond_permexitnw_condition;
	information = dia_pal_25000_garond_permexitnw_info;
	permanent = TRUE;
	description = "Jak to jde?";
};


func int dia_pal_25000_garond_permexitnw_condition()
{
	return TRUE;
};

func void dia_pal_25000_garond_permexitnw_info()
{
	AI_Output(other,self,"DIA_PAL_25000_Garond_PermExitNW_01_01");	//Jak to jde?
	if(Npc_KnowsInfo(hero,dia_pal_2000_hagen_donejoinothersagreed))
	{
		AI_Output(self,other,"DIA_PAL_25000_Garond_PermExitNW_01_06");	//Už je to lepší. Lord Hagen se konečně rozhodl něco dělat...
		AI_Output(self,other,"DIA_PAL_25000_Garond_PermExitNW_01_07");	//Brzy vyrazíme do bitvy proti skřetům a já při Innosovi přísahám, že s nimi zameteme!
		AI_Output(other,self,"DIA_PAL_25000_Garond_PermExitNW_01_08");	//Doufejme, že ano.
	}
	else
	{
		AI_Output(self,other,"DIA_PAL_25000_Garond_PermExitNW_01_02");	//Hagen se bojí napadnout skřety! Nechápu proč.
		AI_Output(self,other,"DIA_PAL_25000_Garond_PermExitNW_01_03");	//Asi čeká na správný okamžik, ale ten podle mne již dávno přišel!
		AI_Output(other,self,"DIA_PAL_25000_Garond_PermExitNW_01_04");	//Už to dlouho nepotrvá. Věř mi, že paladinové v téhle válce zohrají svoji roli.
		AI_Output(self,other,"DIA_PAL_25000_Garond_PermExitNW_01_05");	//Při Innosovi, to se vsaď, že ano!
	};
};

instance DIA_PAL_25000_Garond_VenzelDone(C_Info)
{
	npc = PAL_25000_Garond;
	nr = 2;
	condition = DIA_PAL_25000_Garond_VenzelDone_condition;
	information = DIA_PAL_25000_Garond_VenzelDone_info;
	permanent = FALSE;
	description = "Zjistil jsem, co se stalo s Wenzelem.";
};

func int DIA_PAL_25000_Garond_VenzelDone_condition()
{
	if((MIS_LostPaladins == LOG_Running) && (MIS_EscapeMine == LOG_Success))
	{
		return TRUE;
	};
};

func void DIA_PAL_25000_Garond_VenzelDone_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_PAL_25000_Garond_VenzelDone_01_01");	//Zjistil jsem, co se stalo s Wenzelem.
	AI_Output(self,other,"DIA_PAL_25000_Garond_VenzelDone_01_02");	//Tak mluv, rychle. Je naživu?
	AI_Output(other,self,"DIA_PAL_25000_Garond_VenzelDone_01_03");	//Žije, ale byl zajat skřety. Poslali ho do dolu těžit železnou rudu.
	AI_Output(self,other,"DIA_PAL_25000_Garond_VenzelDone_01_04");	//Chvála Innosovi... (ulehčeně) Takže ještě není vše ztraceno! Musíme ho dostat ven.
	AI_Output(other,self,"DIA_PAL_25000_Garond_VenzelDone_01_05");	//Není třeba. V skřetím dole jsem našel magický portál.
	AI_Output(other,self,"DIA_PAL_25000_Garond_VenzelDone_01_06");	//Wenzel a ostatní otroci ho použili, aby utekli.
	AI_Output(other,self,"DIA_PAL_25000_Garond_VenzelDone_01_07");	//Nicméně ten portál pravděpodobně vede přímo na pevninu.
	AI_Output(other,self,"DIA_PAL_25000_Garond_VenzelDone_01_08");	//Proto ti Wenzel vzkazuje, že se už na Khorinis asi nevrátí.
	AI_Output(self,other,"DIA_PAL_25000_Garond_VenzelDone_01_09");	//Nu, budiž. Hlavně, že bude v pořádku.
	AI_Output(other,self,"DIA_PAL_25000_Garond_VenzelDone_01_10");	//Říkal, že se vrátí do Myrtany a bude tam bojovat se skřety.
	AI_Output(other,self,"DIA_PAL_25000_Garond_VenzelDone_01_11");	//Vypadá to, že měl pravdu, když říkal, že král je na tom stejně špatně jako vy.
	AI_Output(self,other,"DIA_PAL_25000_Garond_VenzelDone_01_12");	//Ti zatracení skřeti... (nahněvaně) Zamořili tuhle krajinu jako kobylky!
	AI_Output(self,other,"DIA_PAL_25000_Garond_VenzelDone_01_13");	//Ale my budeme bojovat do posledního muže! Nenecháme se jimi zlomit!
	AI_Output(self,other,"DIA_PAL_25000_Garond_VenzelDone_01_14");	//A ohledně kontinentu... (neochotně) Nebudu ti lhát. Je to pravda.
	AI_Output(self,other,"DIA_PAL_25000_Garond_VenzelDone_01_15");	//Král se z posledních sil snaží zadržet hordy skřetů z Nordmaru.
	AI_Output(self,other,"DIA_PAL_25000_Garond_VenzelDone_01_16");	//Ale nepovede se mu to. Skřetů je příliš mnoho a král nemá dost vojáků ani zbraní.
	AI_Output(self,other,"DIA_PAL_25000_Garond_VenzelDone_01_17");	//My jsme nyní jedinou nadějí. Magická ruda by možná dokázala otočit průběh války.
	AI_Output(self,other,"DIA_PAL_25000_Garond_VenzelDone_01_18");	//Ale, jak vidíš, i my máme plno práce s odrážením skřetů.
	AI_Output(self,other,"DIA_PAL_25000_Garond_VenzelDone_01_19");	//Nejsem zvyklý vzdávat se, ale... (odevzdaně) Tahle válka je už zřejmě nadobro prohraná.
	AI_Output(self,other,"DIA_PAL_25000_Garond_VenzelDone_01_20");	//Ale ať tě ani nenapadne o tom někomu říkat!
	AI_Output(self,other,"DIA_PAL_25000_Garond_VenzelDone_01_21");	//Nedovolím, aby mí muži ztratili morálku jen kvůli nějakým hloupým dohadům.
	AI_Output(other,self,"DIA_PAL_25000_Garond_VenzelDone_01_22");	//Samo sebou.
	MIS_LostPaladins = LOG_Success;
	Log_SetTopicStatus(TOPIC_LostPaladins,LOG_Success);
	B_LogEntry(TOPIC_LostPaladins,"Řekl jsem Garondovi o Wenzelově osudu.");
};