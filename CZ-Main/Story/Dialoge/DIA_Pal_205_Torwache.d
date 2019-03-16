
instance DIA_PAL_205_Torwache_EXIT(C_Info)
{
	npc = Pal_205_Torwache;
	nr = 999;
	condition = DIA_PAL_205_Torwache_EXIT_Condition;
	information = DIA_PAL_205_Torwache_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_PAL_205_Torwache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_PAL_205_Torwache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


const string PAL_205_Checkpoint = "NW_CITY_CITYHALL_IN";

var int PAL_205_schonmalreingelassen;

instance DIA_PAL_205_Torwache_FirstWarn(C_Info)
{
	npc = Pal_205_Torwache;
	nr = 1;
	condition = DIA_PAL_205_Torwache_FirstWarn_Condition;
	information = DIA_PAL_205_Torwache_FirstWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_PAL_205_Torwache_FirstWarn_Condition()
{
	if(Npc_GetDistToWP(other,PAL_205_Checkpoint) <= 550)
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};
	if((B_GetGreatestPetzCrime(self) >= CRIME_ATTACK) && (PAL_205_schonmalreingelassen == TRUE))
	{
		self.aivar[AIV_PASSGATE] = FALSE;
	}
	else if(PAL_205_schonmalreingelassen == TRUE)
	{
		self.aivar[AIV_PASSGATE] = TRUE;
	};
	if((self.aivar[AIV_Guardpassage_Status] == GP_NONE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_PAL_205_Torwache_FirstWarn_Info()
{
	AI_Output(self,other,"DIA_PAL_205_Torwache_FirstWarn_12_00");	//STÁT!
	if(B_GetGreatestPetzCrime(self) >= CRIME_ATTACK)
	{
		if(B_GetGreatestPetzCrime(self) == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_PAL_205_Torwache_FirstWarn_12_01");	//Porušil bych svou svatou povinnost, kdybych nechal vejít vraha.
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_THEFT)
		{
			AI_Output(self,other,"DIA_PAL_205_Torwache_FirstWarn_12_02");	//Jsi obviněn z krádeže. Dokud nařčení trvá, nemužeš vstoupit!
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
		{
			AI_Output(self,other,"DIA_PAL_205_Torwache_FirstWarn_12_03");	//Jsi známý jako rváč. Nepustím tě dovnitř.
		};
		AI_Output(self,other,"DIA_PAL_205_Torwache_FirstWarn_12_04");	//Běž za lordem Andrem a urovnej celou tu záležitost!
	}
	else
	{
		AI_Output(self,other,"DIA_PAL_205_Torwache_FirstWarn_12_05");	//Na radnici mohou vejít jen ti, kdo jsou v královských službách.
		PALGUARD = TRUE;
	};
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,PAL_205_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
};


instance DIA_PAL_205_Torwache_SecondWarn(C_Info)
{
	npc = Pal_205_Torwache;
	nr = 2;
	condition = DIA_PAL_205_Torwache_SecondWarn_Condition;
	information = DIA_PAL_205_Torwache_SecondWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_PAL_205_Torwache_SecondWarn_Condition()
{
	if((self.aivar[AIV_Guardpassage_Status] == GP_FirstWarnGiven) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,PAL_205_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_PAL_205_Torwache_SecondWarn_Info()
{
	AI_Output(self,other,"DIA_PAL_205_Torwache_SecondWarn_12_00");	//Ještě jeden krok a přísahám k Innosovi, že to bude tvůj poslední!
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,PAL_205_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;
	AI_StopProcessInfos(self);
};


instance DIA_PAL_205_Torwache_Attack(C_Info)
{
	npc = Pal_205_Torwache;
	nr = 3;
	condition = DIA_PAL_205_Torwache_Attack_Condition;
	information = DIA_PAL_205_Torwache_Attack_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_PAL_205_Torwache_Attack_Condition()
{
	if((self.aivar[AIV_Guardpassage_Status] == GP_SecondWarnGiven) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,PAL_205_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_PAL_205_Torwache_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,0);
};


instance DIA_PAL_205_Torwache_Hagen(C_Info)
{
	npc = Pal_205_Torwache;
	nr = 2;
	condition = DIA_PAL_205_Torwache_Hagen_Condition;
	information = DIA_PAL_205_Torwache_Hagen_Info;
	permanent = TRUE;
	description = "Musím mluvit s lordem Hagenem!";
};


func int DIA_PAL_205_Torwache_Hagen_Condition()
{
	if(PAL_205_schonmalreingelassen == FALSE)
	{
		return TRUE;
	};
};

func void DIA_PAL_205_Torwache_Hagen_Info()
{
	AI_Output(other,self,"DIA_PAL_205_Torwache_Hagen_15_00");	//Musím mluvit s lordem Hagenem! 
	AI_Output(self,other,"DIA_PAL_205_Torwache_Hagen_12_01");	//Dovnitř nemůžeš. Když to ale přece jenom zkusíš, budu tě muset zabít.
	AI_StopProcessInfos(self);
};


instance DIA_PAL_205_Torwache_PassAsMil(C_Info)
{
	npc = Pal_205_Torwache;
	nr = 3;
	condition = DIA_PAL_205_Torwache_PassAsMil_Condition;
	information = DIA_PAL_205_Torwache_PassAsMil_Info;
	permanent = TRUE;
	description = "Jsem členem domobrany.";
};


func int DIA_PAL_205_Torwache_PassAsMil_Condition()
{
	if((other.guild == GIL_MIL) && (PAL_205_schonmalreingelassen == FALSE) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK))
	{
		return TRUE;
	};
};

func void DIA_PAL_205_Torwache_PassAsMil_Info()
{
	AI_Output(other,self,"DIA_PAL_205_Torwache_PassAsMil_15_00");	//Jsem členem domovrany.
	AI_Output(self,other,"DIA_PAL_205_Torwache_PassAsMil_12_01");	//Tak to mění situaci - můžeš vejít.
	CITYHALLACCESSGRANTED = TRUE;
	PALGUARD = FALSE;
	self.aivar[AIV_PASSGATE] = TRUE;
	PAL_205_schonmalreingelassen = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_PAL_205_Torwache_PassAsMage(C_Info)
{
	npc = Pal_205_Torwache;
	nr = 3;
	condition = DIA_PAL_205_Torwache_PassAsMage_Condition;
	information = DIA_PAL_205_Torwache_PassAsMage_Info;
	permanent = TRUE;
	description = "Jsem mág Ohně.";
};


func int DIA_PAL_205_Torwache_PassAsMage_Condition()
{
	if((other.guild == GIL_KDF) && (PAL_205_schonmalreingelassen == FALSE) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK))
	{
		return TRUE;
	};
};

func void DIA_PAL_205_Torwache_PassAsMage_Info()
{
	AI_Output(other,self,"DIA_PAL_205_Torwache_PassAsMage_15_00");	//Jsem mág Ohně.
	AI_Output(self,other,"DIA_PAL_205_Torwache_PassAsMage_12_01");	//Ano, samozřejmně... Odpusť mágu, konám jen svou povinnost!
	CITYHALLACCESSGRANTED = TRUE;
	PALGUARD = FALSE;
	self.aivar[AIV_PASSGATE] = TRUE;
	PAL_205_schonmalreingelassen = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_PAL_205_Torwache_PassAsSld(C_Info)
{
	npc = Pal_205_Torwache;
	nr = 3;
	condition = DIA_PAL_205_Torwache_PassAsSld_Condition;
	information = DIA_PAL_205_Torwache_PassAsSld_Info;
	permanent = TRUE;
	description = "Pusť mě dovnitř, přináším vzkaz od žoldáků.";
};


func int DIA_PAL_205_Torwache_PassAsSld_Condition()
{
	if((other.guild == GIL_SLD) && (PAL_205_schonmalreingelassen == FALSE) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK))
	{
		return TRUE;
	};
};

func void DIA_PAL_205_Torwache_PassAsSld_Info()
{
	AI_Output(other,self,"DIA_PAL_205_Torwache_PassAsSld_15_00");	//Pusť mě dovnitř, přináším vzkaz od žoldáků.
	AI_Output(self,other,"DIA_PAL_205_Torwache_PassAsSld_12_01");	//Dobrá, ale varuju tě. Jestli něco zkusíš, nebudeš mít ani čas toho litovat.
	CITYHALLACCESSGRANTED = TRUE;
	PALGUARD = FALSE;
	self.aivar[AIV_PASSGATE] = TRUE;
	PAL_205_schonmalreingelassen = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_PAL_205_TORWACHE_PASSASKDW(C_Info)
{
	npc = Pal_205_Torwache;
	nr = 3;
	condition = dia_pal_205_torwache_passaskdw_condition;
	information = dia_pal_205_torwache_passaskdw_info;
	permanent = TRUE;
	description = "Jsem posel mágů Vody.";
};


func int dia_pal_205_torwache_passaskdw_condition()
{
	if(((other.guild == GIL_NDW) || (other.guild == GIL_KDW)) && (PAL_205_schonmalreingelassen == FALSE) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK) && (Npc_HasItems(other,itwr_watermageletter) >= 1))
	{
		return TRUE;
	};
};

func void dia_pal_205_torwache_passaskdw_info()
{
	AI_Output(other,self,"DIA_PAL_205_Torwache_PassAsKDW_15_00");	//Jsem posel mágů Vody. Mám naléhavou zprávu pro lorda Hagena.
	AI_Output(self,other,"DIA_PAL_205_Torwache_PassAsKDW_12_01");	//Dobrá, vejdi, novici. Ale upozorňuji tě: nedělej problémy, nebo se to dozví mistr Saturas!
	CITYHALLACCESSGRANTED = TRUE;
	PALGUARD = FALSE;
	self.aivar[AIV_PASSGATE] = TRUE;
	PAL_205_schonmalreingelassen = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_PAL_205_TORWACHE_PASSASKDM(C_Info)
{
	npc = Pal_205_Torwache;
	nr = 3;
	condition = dia_pal_205_torwache_passaskdm_condition;
	information = dia_pal_205_torwache_passaskdm_info;
	permanent = TRUE;
	description = "Nechceš snad pustit Beliarova kněze?";
};


func int dia_pal_205_torwache_passaskdm_condition()
{
	if((other.guild == GIL_KDM) && (PAL_205_schonmalreingelassen == FALSE) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK))
	{
		return TRUE;
	};
};

func void dia_pal_205_torwache_passaskdm_info()
{
	AI_Output(other,self,"DIA_PAL_205_Torwache_PassAsKDM_15_00");	//Nechceš snad pustit Beliarova kněze?
	AI_Output(self,other,"DIA_PAL_205_Torwache_PassAsKDM_12_01");	//(Nevěřícně) Takže nekromant. Ale varuji tě: jestli budeš dělat potíže, nebudeš mít ani čas k pokání.
	CITYHALLACCESSGRANTED = TRUE;
	PALGUARD = FALSE;
	self.aivar[AIV_PASSGATE] = TRUE;
	PAL_205_schonmalreingelassen = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_PAL_205_TORWACHE_PASSASSEK(C_Info)
{
	npc = Pal_205_Torwache;
	nr = 3;
	condition = dia_pal_205_torwache_passassek_condition;
	information = dia_pal_205_torwache_passassek_info;
	permanent = TRUE;
	description = "Mám schůzku s místodržícím.";
};

func int dia_pal_205_torwache_passassek_condition()
{
	if(((other.guild == GIL_GUR) || (other.guild == GIL_TPL)) && (PAL_205_schonmalreingelassen == FALSE) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK) && (LARIUSAWAITS == TRUE))
	{
		return TRUE;
	};
};

func void dia_pal_205_torwache_passassek_info()
{
	AI_Output(other,self,"DIA_PAL_205_Torwache_PassAsSEK_15_00");	//Mám zde schůzku s místodržícím Lariusem. Měli ti to oznámit!
	AI_Output(self,other,"DIA_PAL_205_Torwache_PassAsSEK_12_01");	//Ano, byl jsem informován. Pro vstuo však musíš znát heslo? Řekni mi ho!
	AI_Output(other,self,"DIA_PAL_205_Torwache_PassAsSEK_15_01");	//Y'Berion!... Můžu teď dovnitř, paladine?!
	AI_Output(self,other,"DIA_PAL_205_Torwache_PassAsSEK_12_02");	//Vstup. Ale varuji tě: Začni dělat problémy a budeš litovat dne, kdy ses narodil.
	CITYHALLACCESSGRANTED = TRUE;
	PALGUARD = FALSE;
	self.aivar[AIV_PASSGATE] = TRUE;
	PAL_205_schonmalreingelassen = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_PAL_205_Torwache_PERM(C_Info)
{
	npc = Pal_205_Torwache;
	nr = 2;
	condition = DIA_PAL_205_Torwache_PERM_Condition;
	information = DIA_PAL_205_Torwache_PERM_Info;
	permanent = TRUE;
	description = "Co máš za povinnosti?";
};

func int DIA_PAL_205_Torwache_PERM_Condition()
{
	if((PAL_205_schonmalreingelassen == TRUE) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK))
	{
		return TRUE;
	};
};

func void DIA_PAL_205_Torwache_PERM_Info()
{
	AI_Output(other,self,"DIA_PAL_205_Torwache_PERM_15_00");	//Co máš za povinnosti?

	if((other.guild == GIL_PAL) || (other.guild == GIL_MIL))
	{
		AI_Output(self,other,"DIA_PAL_205_Torwache_PERM_12_01");	//Máme situaci pod kontrolou.
	}
	else if((other.guild == GIL_KDF) && (other.guild == GIL_KDW))
	{
		AI_Output(self,other,"DIA_PAL_205_Torwache_PERM_12_02");	//Má služba mě plně uspokojuje vznešený mágu.
	}
	else if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_PAL_205_Torwache_PERM_12_03");	//Sklapni a padej.
	}
	else
	{
		AI_Output(self,other,"DIA_PAL_205_Torwache_PERM_12_04");	//Co chceš?
	};

	AI_StopProcessInfos(self);
};

