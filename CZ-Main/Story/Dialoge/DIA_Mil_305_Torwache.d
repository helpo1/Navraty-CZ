
instance DIA_Mil_305_Torwache_EXIT(C_Info)
{
	npc = Mil_305_Torwache;
	nr = 999;
	condition = DIA_Mil_305_Torwache_EXIT_Condition;
	information = DIA_Mil_305_Torwache_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Mil_305_Torwache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Mil_305_Torwache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


const string Mil_305_Checkpoint = "NW_CITY_UPTOWN_PATH_02";

instance DIA_Mil_305_Torwache_FirstWarn(C_Info)
{
	npc = Mil_305_Torwache;
	nr = 1;
	condition = DIA_Mil_305_Torwache_FirstWarn_Condition;
	information = DIA_Mil_305_Torwache_FirstWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Mil_305_Torwache_FirstWarn_Condition()
{
	if(Npc_GetDistToWP(other,Mil_305_Checkpoint) <= 700)
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};
	if((B_GetGreatestPetzCrime(self) >= CRIME_ATTACK) && (Mil_305_schonmalreingelassen == TRUE))
	{
		self.aivar[AIV_PASSGATE] = FALSE;
	}
	else if(Mil_305_schonmalreingelassen == TRUE)
	{
		HIGHCITYGATEACCESSGRANTED = TRUE;
		self.aivar[AIV_PASSGATE] = TRUE;
	};
	if((self.aivar[AIV_Guardpassage_Status] == GP_NONE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Mil_305_Torwache_FirstWarn_Info()
{
	AI_Output(self,other,"DIA_Mil_305_Torwache_FirstWarn_03_00");	//STÁT!
	if(B_GetGreatestPetzCrime(self) >= CRIME_ATTACK)
	{
		if(B_GetGreatestPetzCrime(self) == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_Mil_305_Torwache_FirstWarn_03_01");	//Ve městě jsi hledán pro vraždu! Než se to vyřeší, nemohu tě vpustit do horní čtvrti.
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_THEFT)
		{
			AI_Output(self,other,"DIA_Mil_305_Torwache_FirstWarn_03_02");	//Dokud jsi obviněný z krádeže, nesmíš vstoupit do horní čtvrti!
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
		{
			AI_Output(self,other,"DIA_Mil_305_Torwache_FirstWarn_03_03");	//Potížista jako ty nemá v horní čtvrti co pohledávat.
		};
		AI_Output(self,other,"DIA_Mil_305_Torwache_FirstWarn_03_04");	//Běž za lordem Andrem a urovnej celou tu záležitost!
	}
	else
	{
		AI_Output(self,other,"DIA_Mil_305_Torwache_FirstWarn_03_05");	//Do horní čtvrti mají přístup jen občané města a královští vojáci!
	};
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,Mil_305_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
};


instance DIA_Mil_305_Torwache_SecondWarn(C_Info)
{
	npc = Mil_305_Torwache;
	nr = 2;
	condition = DIA_Mil_305_Torwache_SecondWarn_Condition;
	information = DIA_Mil_305_Torwache_SecondWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Mil_305_Torwache_SecondWarn_Condition()
{
	if((self.aivar[AIV_Guardpassage_Status] == GP_FirstWarnGiven) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,Mil_305_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_Mil_305_Torwache_SecondWarn_Info()
{
	AI_Output(self,other,"DIA_Mil_305_Torwache_SecondWarn_03_00");	//Říkám ti to naposledy. Ještě jeden krok a ocitneš se ve světě bolesti.
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,Mil_305_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;
	AI_StopProcessInfos(self);
};


instance DIA_Mil_305_Torwache_Attack(C_Info)
{
	npc = Mil_305_Torwache;
	nr = 3;
	condition = DIA_Mil_305_Torwache_Attack_Condition;
	information = DIA_Mil_305_Torwache_Attack_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Mil_305_Torwache_Attack_Condition()
{
	if((self.aivar[AIV_Guardpassage_Status] == GP_SecondWarnGiven) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,Mil_305_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_Mil_305_Torwache_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;
	AI_Output(self,other,"DIA_Mil_305_Torwache_Attack_03_00");	//Řekl sis o to...
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,0);
};


instance DIA_Mil_305_Torwache_MESSAGE(C_Info)
{
	npc = Mil_305_Torwache;
	nr = 1;
	condition = DIA_Mil_305_Torwache_MESSAGE_Condition;
	information = DIA_Mil_305_Torwache_MESSAGE_Info;
	permanent = FALSE;
	description = "Přináším důležitou zprávu pro lorda Hagena.";
};


func int DIA_Mil_305_Torwache_MESSAGE_Condition()
{
	if((Player_KnowsLordHagen == TRUE) && (LordHagen.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Mil_305_Torwache_MESSAGE_Info()
{
	AI_Output(other,self,"DIA_Mil_305_Torwache_MESSAGE_15_00");	//Přináším důležitou zprávu pro lorda Hagena.
	AI_Output(self,other,"DIA_Mil_305_Torwache_MESSAGE_03_01");	//Polovina města by chtěla mluvit s lordem Hagenem v nějaké důležité záležitosti.
	AI_Output(self,other,"DIA_Mil_305_Torwache_MESSAGE_03_02");	//Kdybychom vpustili každého žadatele, nedělal by nic jiného, než že by vyřizoval podružné záležitosti měšťanů.
};


instance DIA_Mil_305_Torwache_Ausnahme(C_Info)
{
	npc = Mil_305_Torwache;
	nr = 2;
	condition = DIA_Mil_305_Torwache_Ausnahme_Condition;
	information = DIA_Mil_305_Torwache_Ausnahme_Info;
	permanent = TRUE;
	description = "Nešla by udělat výjimka?";
};


func int DIA_Mil_305_Torwache_Ausnahme_Condition()
{
	if(Mil_305_schonmalreingelassen == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Mil_305_Torwache_Ausnahme_Info()
{
	AI_Output(other,self,"DIA_Mil_305_Torwache_Ausnahme_15_00");	//Nešla by udělat výjimka?
	AI_Output(self,other,"DIA_Mil_305_Torwache_Ausnahme_03_01");	//Cože?! V tomhle městě platí určitá pravidla! Pravidla, která se vztahují na každého, bez výjimek!
	AI_Output(self,other,"DIA_Mil_305_Torwache_Ausnahme_03_02");	//Pokud bychom svolili k porušení těchto pravidel, bylo by to nespravedlivé ke všem, kdo se jimi řídí.
};


instance DIA_Mil_305_Torwache_PassAsCitizen(C_Info)
{
	npc = Mil_305_Torwache;
	nr = 2;
	condition = DIA_Mil_305_Torwache_PassAsCitizen_Condition;
	information = DIA_Mil_305_Torwache_PassAsCitizen_Info;
	permanent = TRUE;
	description = "Jsem uznávaný občan Khorinisu! Nechte mě projít!";
};


func int DIA_Mil_305_Torwache_PassAsCitizen_Condition()
{
	if((Mil_305_schonmalreingelassen == FALSE) && (Kapitel <= 1))
	{
		return TRUE;
	};
};

func void DIA_Mil_305_Torwache_PassAsCitizen_Info()
{
	AI_Output(other,self,"DIA_Mil_305_Torwache_PassAsCitizen_15_00");	//Jsem uznávaný občan Khorinisu! Nechte mě projít!
	if(Player_IsApprentice > APP_NONE)
	{
		AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsCitizen_03_01");	//Ať už khoriniské mistry přimělo ke tvému zapsání mezi učedníky cokoliv - nechci to vědět.
		AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsCitizen_03_02");	//Můžeš vstoupit! Ale chovej se slušně! Jinak tě čekají největší trable tvého života!
		HIGHCITYGATEACCESSGRANTED = TRUE;
		self.aivar[AIV_PASSGATE] = TRUE;
		Mil_305_schonmalreingelassen = TRUE;
		AI_StopProcessInfos(self);
	}
	else if((MIS_Matteo_Gold == LOG_SUCCESS) || (MIS_Thorben_GetBlessings == LOG_SUCCESS) || (MIS_Bosper_Bogen == LOG_SUCCESS) || (MIS_Bosper_WolfFurs == LOG_SUCCESS) || (MIS_Harad_Orc == LOG_SUCCESS) || (MIS_HakonBandits == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsCitizen_03_03");	//Možná sis naklonil na svou stranu některé mistry z dolní čtvrti, ale kdybys byl občanem tohoto města, věděl bych o tom!
		AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsCitizen_03_04");	//Nevěš mi bulíky na nos! Varuji tě!
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsCitizen_03_05");	//Jsi jen špína za nehty! Okamžitě zmiz!
		AI_StopProcessInfos(self);
	};
};


instance DIA_Mil_305_Torwache_PassAsMil(C_Info)
{
	npc = Mil_305_Torwache;
	nr = 3;
	condition = DIA_Mil_305_Torwache_PassAsMil_Condition;
	information = DIA_Mil_305_Torwache_PassAsMil_Info;
	permanent = TRUE;
	description = "Patřím k domobraně - nechte mě projít!";
};


func int DIA_Mil_305_Torwache_PassAsMil_Condition()
{
	if((other.guild == GIL_MIL) && (Mil_305_schonmalreingelassen == FALSE) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK))
	{
		return TRUE;
	};
};

func void DIA_Mil_305_Torwache_PassAsMil_Info()
{
	AI_Output(other,self,"DIA_Mil_305_Torwache_PassAsMil_15_00");	//Patřím k domobraně - nechte mě projít!
	AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsMil_03_01");	//Takže Andre tě přijal? V tom případě nakonec asi nebudeš až tak špatný chlap!
	AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsMil_03_02");	//Jsi teď jedním z ochránců města! Tak se k občanům chovej hezky přátelsky!
	HIGHCITYGATEACCESSGRANTED = TRUE;
	self.aivar[AIV_PASSGATE] = TRUE;
	Mil_305_schonmalreingelassen = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_Mil_305_Torwache_PassAsMage(C_Info)
{
	npc = Mil_305_Torwache;
	nr = 3;
	condition = DIA_Mil_305_Torwache_PassAsMage_Condition;
	information = DIA_Mil_305_Torwache_PassAsMage_Info;
	permanent = TRUE;
	description = "Opovažuješ se stát v cestě Innosovu zástupci?";
};

func int DIA_Mil_305_Torwache_PassAsMage_Condition()
{
	if((Mil_305_schonmalreingelassen == FALSE) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK) && ((other.guild == GIL_KDF) || (other.guild == GIL_NOV)))
	{
		return TRUE;
	};
};

func void DIA_Mil_305_Torwache_PassAsMage_Info()
{
	AI_Output(other,self,"DIA_Mil_305_Torwache_PassAsMage_15_00");	//Opovažuješ se stát v cestě Innosovu zástupci?
	AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsMage_03_01");	//Ehm... ne! Samozřejmě, že ne! Innosovým vyvoleným je vstup povolen!
	AI_Output(other,self,"DIA_Mil_305_Torwache_PassAsMage_15_02");	//Modli se k Innosovi, ať ti odpustí tvou troufalost!
	AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsMage_03_03");	//Ano, vyvolený!
	HIGHCITYGATEACCESSGRANTED = TRUE;
	self.aivar[AIV_PASSGATE] = TRUE;
	Mil_305_schonmalreingelassen = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_Mil_305_Torwache_PassAsSld(C_Info)
{
	npc = Mil_305_Torwache;
	nr = 3;
	condition = DIA_Mil_305_Torwache_PassAsSld_Condition;
	information = DIA_Mil_305_Torwache_PassAsSld_Info;
	permanent = TRUE;
	description = "Nesu důležitou zprávu pro lorda Hagena!";
};


func int DIA_Mil_305_Torwache_PassAsSld_Condition()
{
	if((other.guild == GIL_SLD) && (Mil_305_schonmalreingelassen == FALSE) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK))
	{
		return TRUE;
	};
};

func void DIA_Mil_305_Torwache_PassAsSld_Info()
{
	AI_Output(other,self,"DIA_Mil_305_Torwache_PassAsSld_15_00");	//Nesu důležitou zprávu pro lorda Hagena!
	AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsSld_03_01");	//Ty jsi jeden z té žoldácké chátry! Co bys ty mohl od lorda Hagena chtít?
	AI_Output(other,self,"DIA_Mil_305_Torwache_PassAsSld_15_02");	//Přináším nabídku příměří.
	AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsSld_03_03");	//Ha! Takže jste vy mizerové nakonec přece jenom přišli k rozumu. Tak běž za lordem Hagenem, ale chovej se pěkně zdvořile, nebo ti nakopu ten tvůj tlustej blbej... zadek!
	HIGHCITYGATEACCESSGRANTED = TRUE;
	self.aivar[AIV_PASSGATE] = TRUE;
	Mil_305_schonmalreingelassen = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_MIL_305_TORWACHE_PASSASKDW(C_Info)
{
	npc = Mil_305_Torwache;
	nr = 3;
	condition = dia_mil_305_torwache_passaskdw_condition;
	information = dia_mil_305_torwache_passaskdw_info;
	permanent = TRUE;
	description = "Jsem mág Vody!";
};


func int dia_mil_305_torwache_passaskdw_condition()
{
	if((other.guild == GIL_KDW) && (Mil_305_schonmalreingelassen == FALSE) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK))
	{
		return TRUE;
	};
};

func void dia_mil_305_torwache_passaskdw_info()
{
	AI_Output(other,self,"DIA_Mil_305_Torwache_PassAsKdw_15_00");	//Jsem mág Vody!
	AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsKdw_03_01");	//Vždycky rádi posloužíme služebníkům Adana! Můžeš projít.
	HIGHCITYGATEACCESSGRANTED = TRUE;
	self.aivar[AIV_PASSGATE] = TRUE;
	Mil_305_schonmalreingelassen = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_MIL_305_TORWACHE_PASSASNDW(C_Info)
{
	npc = Mil_305_Torwache;
	nr = 3;
	condition = dia_mil_305_torwache_passasndw_condition;
	information = dia_mil_305_torwache_passasndw_info;
	permanent = TRUE;
	description = "Jsem novicem Vody.";
};


func int dia_mil_305_torwache_passasndw_condition()
{
	if((other.guild == GIL_NDW) && (Mil_305_schonmalreingelassen == FALSE) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK) && (Npc_HasItems(other,itwr_watermageletter) >= 1))
	{
		return TRUE;
	};
};

func void dia_mil_305_torwache_passasndw_info()
{
	AI_Output(other,self,"DIA_Mil_305_Torwache_PassAsNDW_15_00");	//Jsem novicem Vody. Mám zprávu pro vůdce paladinů.
	AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsNDW_12_01");	//Dobře, můžeš projít.
	HIGHCITYGATEACCESSGRANTED = TRUE;
	self.aivar[AIV_PASSGATE] = TRUE;
	Mil_305_schonmalreingelassen = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_MIL_305_TORWACHE_PASSASSEK(C_Info)
{
	npc = Mil_305_Torwache;
	nr = 3;
	condition = dia_mil_305_torwache_passassek_condition;
	information = dia_mil_305_torwache_passassek_info;
	permanent = TRUE;
	description = "Mám tady schůzku...";
};


func int dia_mil_305_torwache_passassek_condition()
{
	if(((other.guild == GIL_GUR) || (other.guild == GIL_TPL)) && (Mil_305_schonmalreingelassen == FALSE) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK) && (LARIUSAWAITS == TRUE))
	{
		return TRUE;
	};
};

func void dia_mil_305_torwache_passassek_info()
{
	AI_Output(other,self,"DIA_Mil_305_Torwache_PassAsSek_15_00");	//Mám tady schůzku s Lariusem. Měl bys už o tom vědět.
	AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsSek_03_01");	//Ach, ano! Jistě. Můžeš vejít. Ale nedělej tady problémy.
	HIGHCITYGATEACCESSGRANTED = TRUE;
	self.aivar[AIV_PASSGATE] = TRUE;
	Mil_305_schonmalreingelassen = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_MIL_305_TORWACHE_PASSASKDM(C_Info)
{
	npc = Mil_305_Torwache;
	nr = 3;
	condition = dia_mil_305_torwache_passaskdm_condition;
	information = dia_mil_305_torwache_passaskdm_info;
	permanent = TRUE;
	description = "Ty se odvážíš zadržet mága Temnoty?!";
};


func int dia_mil_305_torwache_passaskdm_condition()
{
	if((other.guild == GIL_KDM) && (Mil_305_schonmalreingelassen == FALSE) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK))
	{
		return TRUE;
	};
};

func void dia_mil_305_torwache_passaskdm_info()
{
	AI_Output(other,self,"DIA_Mil_305_Torwache_PassAsKdm_15_00");	//TY se odvážíš zadržet mága Temnoty?!
	AI_Output(self,other,"DIA_Mil_305_Torwache_PassAsKdm_03_01");	//Hmm... (s nechutí) Dobrá, nekromante, můžeš vstoupit - ale budu tě pozorovat.
	HIGHCITYGATEACCESSGRANTED = TRUE;
	self.aivar[AIV_PASSGATE] = TRUE;
	Mil_305_schonmalreingelassen = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_Mil_305_Torwache_PERM(C_Info)
{
	npc = Mil_305_Torwache;
	nr = 1;
	condition = DIA_Mil_305_Torwache_PERM_Condition;
	information = DIA_Mil_305_Torwache_PERM_Info;
	permanent = TRUE;
	description = "Jak se vede?";
};


func int DIA_Mil_305_Torwache_PERM_Condition()
{
	if((Mil_305_schonmalreingelassen == TRUE) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK))
	{
		return TRUE;
	};
};

func void DIA_Mil_305_Torwache_PERM_Info()
{
	AI_Output(other,self,"DIA_Mil_305_Torwache_PERM_15_00");	//Jak se vede?
	if((other.guild == GIL_PAL) || (other.guild == GIL_MIL))
	{
		AI_Output(self,other,"DIA_Mil_305_Torwache_PERM_03_01");	//Všechno v pohodě, kámo!
	}
	else if((other.guild == GIL_KDF) || (other.guild == GIL_KDW))
	{
		AI_Output(self,other,"DIA_Mil_305_Torwache_PERM_03_02");	//Plníme zde jen svou povinnost. Děkuji, že sis mě všiml, vyvolený!
	}
	else if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Mil_305_Torwache_PERM_03_03");	//Sice tě nechám projít, ale to ještě neznamená, že s tebou chci mluvit!
	}
	else if((other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR))
	{
		AI_Output(self,other,"DIA_Mil_305_Torwache_PERM_03_04");	//Co chceš, sektáři?
	}
	else if(other.guild == GIL_KDM)
	{
		AI_Output(self,other,"DIA_Mil_305_Torwache_PERM_03_05");	//Co chceš, nekromante?
	}
	else
	{
		AI_Output(self,other,"DIA_Mil_305_Torwache_PERM_03_06");	//Přestaň mě otravovat!
	};
	AI_StopProcessInfos(self);
};

