
instance DIA_Mil_333_Stadtwache_EXIT(C_Info)
{
	npc = Mil_333_Stadtwache;
	nr = 999;
	condition = DIA_Mil_333_Stadtwache_EXIT_Condition;
	information = DIA_Mil_333_Stadtwache_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Mil_333_Stadtwache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Mil_333_Stadtwache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


const string Mil_333_Checkpoint = "NW_CITY_MERCHANT_PATH_29";

var int MIL_333_Personal_AbsolutionLevel;

instance DIA_Mil_333_Stadtwache_FirstWarn(C_Info)
{
	npc = Mil_333_Stadtwache;
	nr = 1;
	condition = DIA_Mil_333_Stadtwache_FirstWarn_Condition;
	information = DIA_Mil_333_Stadtwache_FirstWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Mil_333_Stadtwache_FirstWarn_Condition()
{
	if((B_GetGreatestPetzCrime(self) >= CRIME_ATTACK) && (B_GetCurrentAbsolutionLevel(self) == MIL_333_Personal_AbsolutionLevel))
	{
		self.aivar[AIV_PASSGATE] = FALSE;
	}
	else if(Mil_333_schonmalreingelassen == TRUE)
	{
		CITYGATEACCESSGRANTED = TRUE;
		self.aivar[AIV_PASSGATE] = TRUE;
	};
	if((self.aivar[AIV_Guardpassage_Status] == GP_NONE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Mil_333_Stadtwache_FirstWarn_Info()
{
	var C_Item itm;
	AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_00");	//STÁT!

	if(B_GetGreatestPetzCrime(self) >= CRIME_ATTACK)
	{
		AI_Output(other,self,"DIA_Mil_333_Stadtwache_FirstWarn_15_01");	//(vzdechne si) Co je?
		AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_02");	//Moc dobře víš co!

		if(B_GetGreatestPetzCrime(self) == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_03");	//Po městě jsi hledaný pro vraždu!
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_THEFT)
		{
			AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_04");	//Nechceme tady žádný prašivý zloděje!
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
		{
			AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_05");	//Pro potížisty není ve městě místo!
		};

		AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_06");	//Proč myslíš, že bychom tě měli nechat jít dál?
	}
	else
	{
		itm = Npc_GetEquippedArmor(other);

		if((hero.guild == GIL_NONE) && ((Npc_HasEquippedArmor(other) == FALSE) || Hlp_IsItem(itm,ITAR_Her_M) || Hlp_IsItem(itm,ITAR_prisonel) || Hlp_IsItem(itm,ITAR_Her_N) || Hlp_IsItem(itm,ITAR_Prisoner) || Hlp_IsItem(itm,itar_sekbed)))
		{
			AI_Output(other,self,"DIA_Mil_333_Stadtwache_FirstWarn_15_07");	//Ano?
			AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_08");	//Vypadáš jako naprostý somrák. V tomhle městě nemáme místo pro lidi bez peněz.

			if(Npc_HasItems(other,ItWr_Passierschein))
			{
				AI_Output(other,self,"DIA_Mil_333_Stadtwache_FirstWarn_15_09");	//Ale já mám propustku!
				AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_10");	//Tahle platí jenom pro tu druhou bránu!
			};
			if(Npc_KnowsInfo(other,DIA_Mil_310_Stadtwache_MilizWerden))
			{
				AI_Output(other,self,"DIA_Mil_333_Stadtwache_FirstWarn_15_11");	//Ale já se chci přidat k městské stráži!
				AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_12");	//Haha! Nechtěj mě rozesmát! Běž ke druhé bráně a zkus věšet bulíky na nos zase JIM.
				AI_Output(other,self,"DIA_Mil_333_Stadtwache_FirstWarn_15_13");	//Tam už jsem byl - a oni mě poslali sem.
				AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_14");	//(ošklivě se směje) No potěš! Že oni nám sem posílají vždycky samou smetánku.
			};
		}
		else
		{
			AI_Output(other,self,"DIA_Mil_333_Stadtwache_FirstWarn_15_15");	//(tiše) Cože?
			AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_16");	//Jen jsem se chtěl na tebe podívat. Tak dobrá, zdá se, že nějaké ty peníze máš. Můžeš jít.
			CITYGATEACCESSGRANTED = TRUE;
			self.aivar[AIV_PASSGATE] = TRUE;
			Stadtwache_310.aivar[AIV_PASSGATE] = TRUE;
			Mil_333_schonmalreingelassen = TRUE;
			AI_StopProcessInfos(self);
		};
	};

	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,Mil_333_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
};


instance DIA_Mil_333_Stadtwache_SecondWarn(C_Info)
{
	npc = Mil_333_Stadtwache;
	nr = 2;
	condition = DIA_Mil_333_Stadtwache_SecondWarn_Condition;
	information = DIA_Mil_333_Stadtwache_SecondWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Mil_333_Stadtwache_SecondWarn_Condition()
{
	if((self.aivar[AIV_Guardpassage_Status] == GP_FirstWarnGiven) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,Mil_333_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_Mil_333_Stadtwache_SecondWarn_Info()
{
	AI_Output(self,other,"DIA_Mil_333_Stadtwache_SecondWarn_06_00");	//Máš snad něco s ušima? Ještě jeden krok a ochutnáš můj meč!
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,Mil_333_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;
	AI_StopProcessInfos(self);
};

instance DIA_Mil_333_Stadtwache_Attack(C_Info)
{
	npc = Mil_333_Stadtwache;
	nr = 3;
	condition = DIA_Mil_333_Stadtwache_Attack_Condition;
	information = DIA_Mil_333_Stadtwache_Attack_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Mil_333_Stadtwache_Attack_Condition()
{
	if((self.aivar[AIV_Guardpassage_Status] == GP_SecondWarnGiven) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,Mil_333_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_Mil_333_Stadtwache_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;
	AI_Output(self,other,"DIA_Mil_333_Stadtwache_Attack_06_00");	//Řekl sis o to...
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,0);
};

instance DIA_Mil_333_Stadtwache_PERM(C_Info)
{
	npc = Mil_333_Stadtwache;
	nr = 5;
	condition = DIA_Mil_333_Stadtwache_PERM_Condition;
	information = DIA_Mil_333_Stadtwache_PERM_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Mil_333_Stadtwache_PERM_Condition()
{
	if((self.aivar[AIV_PASSGATE] == TRUE) && (MIS_KILLIGNAZ != LOG_Running) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Mil_333_Stadtwache_PERM_Info()
{
	AI_Output(self,other,"DIA_Mil_333_Stadtwache_PERM_06_00");	//Jdi!
	AI_StopProcessInfos(self);
};

instance DIA_MIL_333_STADTWACHE_KILLIGNAZ(C_Info)
{
	npc = Mil_333_Stadtwache;
	nr = 5;
	condition = dia_mil_333_stadtwache_killignaz_condition;
	information = dia_mil_333_stadtwache_killignaz_info;
	permanent = FALSE;
	description = "Všímáš si tady toho hodně?";
};

func int dia_mil_333_stadtwache_killignaz_condition()
{
	if((MIS_KILLIGNAZ == LOG_Running) && (READORTEGO == FALSE) && (HELPKILLIGNAZ == TRUE))
	{
		return TRUE;
	};
};

func void dia_mil_333_stadtwache_killignaz_info()
{
	AI_Output(other,self,"DIA_Mil_333_Stadtwache_KillIgnaz_01_00");	//Všímáš si tady toho hodně?
	AI_Output(self,other,"DIA_Mil_333_Stadtwache_KillIgnaz_01_01");	//To se ptáš MNE? Chlape, hlídat tady je moje práce.
	AI_Output(self,other,"DIA_Mil_333_Stadtwache_KillIgnaz_01_02");	//Ale, upřímně, v téhle době to není nijak těžké. Stejně není co sledovat.
	AI_Output(other,self,"DIA_Mil_333_Stadtwache_KillIgnaz_01_03");	//Proč?
	AI_Output(self,other,"DIA_Mil_333_Stadtwache_KillIgnaz_01_04");	//Protože v posledních dnech se nikdo zrovna nežene ven z města.
	AI_Output(self,other,"DIA_Mil_333_Stadtwache_KillIgnaz_01_05");	//Venku je to teď prostě příliš nebezpečné! I když, jednou za čas přeci jen někdo najde odvahu... (šklebí se)
	AI_Output(other,self,"DIA_Mil_333_Stadtwache_KillIgnaz_01_06");	//Koho tím myslíš?
	AI_Output(self,other,"DIA_Mil_333_Stadtwache_KillIgnaz_01_07");	//No, nedávno tudy prošel jeden chlápek. Vyšel z města a namířil si to přímo tamtím směrem, k majáku.
	AI_Output(self,other,"DIA_Mil_333_Stadtwache_KillIgnaz_01_08");	//Mimochodem, říká se, že se tam usadili nějací banditi. Nechtěl bych být na jeho místě, pokud na ně natrefí.
	AI_StopProcessInfos(self);
	Wld_InsertNpc(vlk_6150_ortego,"NW_CITY_SMFOREST_BANDIT_02");
};