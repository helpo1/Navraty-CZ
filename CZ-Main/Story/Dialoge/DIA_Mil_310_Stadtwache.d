
instance DIA_Mil_310_Stadtwache_EXIT(C_Info)
{
	npc = Mil_310_Stadtwache;
	nr = 999;
	condition = DIA_Mil_310_Stadtwache_EXIT_Condition;
	information = DIA_Mil_310_Stadtwache_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Mil_310_Stadtwache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Mil_310_Stadtwache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


const string Mil_310_Checkpoint = "NW_CITY_ENTRANCE_MAIN";

var int MIL_310_Personal_AbsolutionLevel;

instance DIA_Mil_310_Stadtwache_FirstWarn(C_Info)
{
	npc = Mil_310_Stadtwache;
	nr = 1;
	condition = DIA_Mil_310_Stadtwache_FirstWarn_Condition;
	information = DIA_Mil_310_Stadtwache_FirstWarn_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Mil_310_Stadtwache_FirstWarn_Condition()
{
	if((B_GetGreatestPetzCrime(self) >= CRIME_ATTACK) && (B_GetCurrentAbsolutionLevel(self) == MIL_310_Personal_AbsolutionLevel))
	{
		self.aivar[AIV_PASSGATE] = FALSE;
	}
	else if(Mil_310_schonmalreingelassen == TRUE)
	{
		CITYGATEACCESSGRANTED = TRUE;
		self.aivar[AIV_PASSGATE] = TRUE;
	};
	if((self.aivar[AIV_Guardpassage_Status] == GP_NONE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Mil_310_Stadtwache_FirstWarn_Info()
{
	var C_Item itm;

	AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_00");	//STÁT!

	if(B_GetGreatestPetzCrime(self) >= CRIME_ATTACK)
	{
		AI_Output(other,self,"DIA_Mil_310_Stadtwache_FirstWarn_15_01");	//Co je?
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_02");	//Víš dobře co!
		if(B_GetGreatestPetzCrime(self) == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_03");	//Ve městě jsi hledán pro vraždu!
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_THEFT)
		{
			AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_04");	//Nechceme tady žádné špinavé zloděje!
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
		{
			AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_05");	//V našem městě nepotřebujeme žádné potížisty!
		};
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_06");	//Proč myslíš, že bychom tě měli nechat jít dál?
	}
	else
	{
		itm = Npc_GetEquippedArmor(other);
		if((hero.guild == GIL_NONE) && ((Npc_HasEquippedArmor(other) == FALSE) || Hlp_IsItem(itm,ITAR_Her_M) || Hlp_IsItem(itm,ITAR_prisonel) || Hlp_IsItem(itm,ITAR_Her_N) || Hlp_IsItem(itm,ITAR_Prisoner) || Hlp_IsItem(itm,itar_sekbed)))
		{
			AI_Output(other,self,"DIA_Mil_310_Stadtwache_FirstWarn_15_07");	//Co je?
			AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_08");	//TEBE dovnitř nepustíme, chlapče!
			AI_Output(other,self,"DIA_Mil_310_Stadtwache_FirstWarn_15_09");	//Proč ne?
			AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_10");	//Takový hadrník jako ty určitě bude dělat jenom potíže!
			AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_11");	//Ve městě máme chátry dost. Lidi bez peněz tady nepotřebujeme.
			Log_CreateTopic(TOPIC_City,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_City,LOG_Running);
			B_LogEntry(TOPIC_City,"Aby mě stráže pustily do města, musím vypadat jako boháč - nebo najít nějaký jiný způsob.");
		}
		else if((Hlp_IsItem(itm,ITAR_Bau_L) == TRUE) || (Hlp_IsItem(itm,ITAR_Bau_M) == TRUE))
		{
			if(self.aivar[AIV_TalkedToPlayer] == TRUE)
			{
				AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_12");	//Co chceš tentokrát?
				AI_Output(other,self,"DIA_Mil_310_Stadtwache_FirstWarn_15_13");	//Posílá mě farmář.
				AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_14");	//No a? Máš tentokrát alespoň jeden dobrý důvod, proč jsi tady?
			}
			else
			{
				AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_15");	//Jsi jeden z pracovníků na Lobartově farmě? Nikdy jsem tě tady neviděl!
				AI_Output(other,self,"DIA_Mil_310_Stadtwache_FirstWarn_15_16");	//Nejsem u Lobarta dlouho.
				AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_17");	//Co chceš ve městě?
			};
		}
		else
		{
			AI_Output(other,self,"DIA_Mil_310_Stadtwache_FirstWarn_15_18");	//(tiše) Cože?
			if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_SEK) || (hero.guild == GIL_TPL) || (hero.guild == GIL_GUR))
			{
				AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_19");	//Odpusť mi, ale takové máme rozkazy.
				AI_Output(other,self,"DIA_Mil_310_Stadtwache_FirstWarn_15_20");	//Snažíš se mě zastavit?
				if((hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_SEK) || (hero.guild == GIL_TPL) || (hero.guild == GIL_GUR))
				{
					AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_20A");	//Samozřejmě, že ne.
				}
				else
				{
					AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_21");	//Samozřejmě, že ne. Všichni členové Innosovy církve jsou vítáni.
				};
			}
			else
			{
				AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_22");	//Jen jsem se na tebe chtěl podívat. Zdá se, že máš peníze. Můžeš jít.
			};
			CITYGATEACCESSGRANTED = TRUE;
			self.aivar[AIV_PASSGATE] = TRUE;
			Stadtwache_333.aivar[AIV_PASSGATE] = TRUE;
			Mil_310_schonmalreingelassen = TRUE;
			AI_StopProcessInfos(self);
		};
	};
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,Mil_310_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
};


instance DIA_Mil_310_Stadtwache_SecondWarn(C_Info)
{
	npc = Mil_310_Stadtwache;
	nr = 2;
	condition = DIA_Mil_310_Stadtwache_SecondWarn_Condition;
	information = DIA_Mil_310_Stadtwache_SecondWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Mil_310_Stadtwache_SecondWarn_Condition()
{
	if((self.aivar[AIV_Guardpassage_Status] == GP_FirstWarnGiven) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,Mil_310_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_Mil_310_Stadtwache_SecondWarn_Info()
{
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_SecondWarn_07_00");	//O nic se nepokoušej. Ještě jeden krok a rozsekám tě na kousky!
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,Mil_310_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;
	AI_StopProcessInfos(self);
};


instance DIA_Mil_310_Stadtwache_Attack(C_Info)
{
	npc = Mil_310_Stadtwache;
	nr = 3;
	condition = DIA_Mil_310_Stadtwache_Attack_Condition;
	information = DIA_Mil_310_Stadtwache_Attack_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Mil_310_Stadtwache_Attack_Condition()
{
	if((self.aivar[AIV_Guardpassage_Status] == GP_SecondWarnGiven) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,Mil_310_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_Mil_310_Stadtwache_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Attack_07_00");	//Řekl sis o to...
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,0);
};


instance DIA_Mil_310_Stadtwache_Bribe(C_Info)
{
	npc = Mil_310_Stadtwache;
	nr = 5;
	condition = DIA_Mil_310_Stadtwache_Bribe_Condition;
	information = DIA_Mil_310_Stadtwache_Bribe_Info;
	permanent = TRUE;
	description = "Tady je sto zlatých. Nech mě projít!";
};


func int DIA_Mil_310_Stadtwache_Bribe_Condition()
{
	if(self.aivar[AIV_PASSGATE] == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Mil_310_Stadtwache_Bribe_Info()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Bribe_15_00");	//Tady je sto zlatých. Nech mě projít!
	if(B_GiveInvItems(other,self,ItMi_Gold,100))
	{
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_Bribe_07_01");	//(chamtivě) Sto zlatých zní dobře. Tak běž.
		if(B_GetGreatestPetzCrime(self) >= CRIME_ATTACK)
		{
			AI_Output(self,other,"DIA_Mil_310_Stadtwache_Bribe_07_02");	//A jdi rovnou za lordem Andrem! Jinak tě to bude příště stát dalších sto zlatých!
		};
		CITYGATEACCESSGRANTED = TRUE;
		self.aivar[AIV_PASSGATE] = TRUE;
		Stadtwache_333.aivar[AIV_PASSGATE] = TRUE;
		Mil_310_schonmalreingelassen = TRUE;
		MIL_310_Personal_AbsolutionLevel = B_GetCurrentAbsolutionLevel(self) + 1;
	}
	else
	{
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_Bribe_07_03");	//Co?! Kde?! Nevidím žádných sto zlatých. Zmiz!
	};
	AI_StopProcessInfos(self);
};


instance DIA_Mil_310_Stadtwache_Passierschein(C_Info)
{
	npc = Mil_310_Stadtwache;
	nr = 4;
	condition = DIA_Mil_310_Stadtwache_Passierschein_Condition;
	information = DIA_Mil_310_Stadtwache_Passierschein_Info;
	permanent = FALSE;
	description = "Mám propustku!";
};


func int DIA_Mil_310_Stadtwache_Passierschein_Condition()
{
	if(Npc_HasItems(other,ItWr_Passierschein) && (Mil_310_schonmalreingelassen == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Mil_310_Stadtwache_Passierschein_Info()
{
	var C_Item itm;
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Passierschein_15_00");	//Mám propustku!

	if((hero.guild == GIL_NONE) && ((Npc_HasEquippedArmor(other) == FALSE) || Hlp_IsItem(itm,ITAR_Her_M) || Hlp_IsItem(itm,ITAR_Her_N) || Hlp_IsItem(itm,ITAR_Prisoner) || Hlp_IsItem(itm,itar_sekbed)))
	{
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_Passierschein_07_01");	//Vážně? A koho jsi kvůli ní zamordoval, ty vrahoune?
		AI_Output(other,self,"DIA_Mil_310_Stadtwache_Passierschein_15_02");	//Tak necháte mě projít, nebo ne?
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_Passierschein_07_03");	//No, běž dál, než si to rozmyslím!
	}
	else
	{
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_Passierschein_07_04");	//Zdá se, že to je v pořádku. Tak běž.
	};

	CITYGATEACCESSGRANTED = TRUE;
	self.aivar[AIV_PASSGATE] = TRUE;
	Stadtwache_333.aivar[AIV_PASSGATE] = TRUE;
	Mil_310_schonmalreingelassen = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_Mil_310_Stadtwache_ZumSchmied(C_Info)
{
	npc = Mil_310_Stadtwache;
	nr = 3;
	condition = DIA_Mil_310_Stadtwache_ZumSchmied_Condition;
	information = DIA_Mil_310_Stadtwache_ZumSchmied_Info;
	permanent = FALSE;
	description = "Potřebuji jít za kovářem. Opravit nějaké nástroje.";
};


func int DIA_Mil_310_Stadtwache_ZumSchmied_Condition()
{
	var C_Item itm;
	itm = Npc_GetEquippedArmor(other);

	if(((Hlp_IsItem(itm,ITAR_Bau_L) == TRUE) || (Hlp_IsItem(itm,ITAR_Bau_M) == TRUE)) && Npc_KnowsInfo(other,DIA_Maleth_ToTheCity) && (Mil_310_schonmalreingelassen == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Mil_310_Stadtwache_ZumSchmied_Info()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_ZumSchmied_15_00");	//Potřebuji jít za kovářem. Opravit nějaké nástroje.

	if(Mil_310_Scheisse_erzaehlt == TRUE)
	{
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_ZumSchmied_07_01");	//(rozzlobeně) Fakt? A proč jsi to neřekl rovnou?
		AI_Output(other,self,"DIA_Mil_310_Stadtwache_ZumSchmied_15_02");	//Jen mě zajímalo, jak zareaguješ.
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_ZumSchmied_07_03");	//Cože?! Zkus na mě něco takového ještě jednou a ukážu ti, jak na takové věci reaguji, ty hloupej vtipálku!
	}
	else
	{
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_ZumSchmied_07_04");	//Dobrá, v pořádku, můžeš jít.
	};

	AI_Output(self,other,"DIA_Mil_310_Stadtwache_ZumSchmied_07_05");	//A jestli uvidíš Lobarta, vyřiď mu, že by měl své ovce pořádně krmit, brzy se u něj zase zastavíme!
	CITYGATEACCESSGRANTED = TRUE;
	self.aivar[AIV_PASSGATE] = TRUE;
	Stadtwache_333.aivar[AIV_PASSGATE] = TRUE;
	Mil_310_schonmalreingelassen = TRUE;
	B_GivePlayerXP(XP_Ambient);
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Mil_310_Stadtwache_Constantino(C_Info)
{
	npc = Mil_310_Stadtwache;
	nr = 2;
	condition = DIA_Addon_Mil_310_Stadtwache_Constantino_Condition;
	information = DIA_Addon_Mil_310_Stadtwache_Constantino_Info;
	permanent = TRUE;
	description = "Mám byliny pro Constantina.";
};


func int DIA_Addon_Mil_310_Stadtwache_Constantino_Condition()
{
	if((MIS_Addon_Lester_PickForConstantino == LOG_Running) && (Mil_310_schonmalreingelassen == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Mil_310_Stadtwache_Constantino_Info()
{
	AI_Output(other,self,"DIA_Addon_Mil_310_Stadtwache_Constantino_15_00");	//Mám byliny pro Constantina.

	if((Npc_HasItems(other,ItPl_Mana_Herb_01) > 0) || (Npc_HasItems(other,ItPl_Mana_Herb_02) > 0) || (Npc_HasItems(other,ItPl_Mana_Herb_03) > 0) || (Npc_HasItems(other,ItPl_Health_Herb_01) > 0) || (Npc_HasItems(other,ItPl_Health_Herb_02) > 0) || (Npc_HasItems(other,ItPl_Health_Herb_03) > 0) || (Npc_HasItems(other,ItPl_Dex_Herb_01) > 0) || (Npc_HasItems(other,ItPl_Strength_Herb_01) > 0) || (Npc_HasItems(other,ItPl_Speed_Herb_01) > 0) || (Npc_HasItems(other,ItPl_Temp_Herb) > 0) || (Npc_HasItems(other,ItPl_Perm_Herb) > 0) || (Npc_HasItems(other,ItPl_Beet) > 0))
	{
		AI_Output(self,other,"DIA_Addon_Mil_310_Stadtwache_Constantino_07_01");	//Aha? Pokud je to tak, ukaž mi co neseš.

		if((Npc_HasItems(other,ItPl_Mana_Herb_01) >= MinimumPassagePlants) || (Npc_HasItems(other,ItPl_Mana_Herb_02) >= MinimumPassagePlants) || (Npc_HasItems(other,ItPl_Mana_Herb_03) >= MinimumPassagePlants) || (Npc_HasItems(other,ItPl_Health_Herb_01) >= MinimumPassagePlants) || (Npc_HasItems(other,ItPl_Health_Herb_02) >= MinimumPassagePlants) || (Npc_HasItems(other,ItPl_Health_Herb_03) >= MinimumPassagePlants) || (Npc_HasItems(other,ItPl_Dex_Herb_01) >= MinimumPassagePlants) || (Npc_HasItems(other,ItPl_Strength_Herb_01) >= MinimumPassagePlants) || (Npc_HasItems(other,ItPl_Speed_Herb_01) >= MinimumPassagePlants) || (Npc_HasItems(other,ItPl_Temp_Herb) >= MinimumPassagePlants) || (Npc_HasItems(other,ItPl_Perm_Herb) >= MinimumPassagePlants))
		{
			AI_Output(self,other,"DIA_Addon_Mil_310_Stadtwache_Constantino_07_02");	//Hmm... (souhlasně) Vše v pořádku. Stačí. Můžeš jít dovnitř. Ale nedělej žádné problémy, jasné?

			if(RhetorikSkillValue[1] < 100)
			{
				RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
				AI_Print("Rétorika + 1");
			};

			CITYGATEACCESSGRANTED = TRUE;
			self.aivar[AIV_PASSGATE] = TRUE;
			Stadtwache_333.aivar[AIV_PASSGATE] = TRUE;
			Mil_310_schonmalreingelassen = TRUE;
			MIS_Addon_Lester_PickForConstantino = LOG_SUCCESS;
			B_GivePlayerXP(XP_Addon_PickForConstantino);
			CheckTownPlants = TRUE;
			AI_StopProcessInfos(self);
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Mil_310_Stadtwache_Constantino_07_03");	//Co to? Co je tohle?

			if(Npc_HasItems(other,ItPl_Beet) >= MinimumPassagePlants)
			{
				AI_Output(self,other,"DIA_Addon_Mil_310_Stadtwache_Constantino_07_04");	//Co by alchymista dělal s touhle řepou? Děláš ze mě blbce? Odprejskni!
			}
			else
			{
				AI_Output(self,other,"DIA_Addon_Mil_310_Stadtwache_Constantino_07_05");	//Já toho sice o alchymii moc nevím, ale na tenhle trapný, zašněrovaný balík zeleniny můžeš zapomenout. Táhni!
			};
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Mil_310_Stadtwache_Constantino_07_06");	//Jaké byliny? Ty nemáš žádné byliny! Odpal!
	};

	AI_StopProcessInfos(self);
};


instance DIA_Mil_310_Stadtwache_MilizWerden(C_Info)
{
	npc = Mil_310_Stadtwache;
	nr = 2;
	condition = DIA_Mil_310_Stadtwache_MilizWerden_Condition;
	information = DIA_Mil_310_Stadtwache_MilizWerden_Info;
	permanent = FALSE;
	description = "Přišel jsem, abych vstoupil do domobrany!";
};


func int DIA_Mil_310_Stadtwache_MilizWerden_Condition()
{
	if(Mil_310_schonmalreingelassen == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Mil_310_Stadtwache_MilizWerden_Info()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_MilizWerden_15_00");	//Přišel jsem, abych vstoupil do domobrany!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_MilizWerden_07_01");	//Dobrej vtip! Zkus to u druhé brány - ONI ti to možná spolknou.
	Mil_310_Scheisse_erzaehlt = TRUE;
};


instance DIA_Mil_310_Stadtwache_Paladine(C_Info)
{
	npc = Mil_310_Stadtwache;
	nr = 1;
	condition = DIA_Mil_310_Stadtwache_Paladine_Condition;
	information = DIA_Mil_310_Stadtwache_Paladine_Info;
	permanent = FALSE;
	description = "Potřebuji mluvit s vůdcem paladinů!";
};


func int DIA_Mil_310_Stadtwache_Paladine_Condition()
{
	if(Mil_310_schonmalreingelassen == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Mil_310_Stadtwache_Paladine_Info()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_15_00");	//Potřebuji mluvit s vůdcem paladinů! Mám pro něj důležitou zprávu!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_07_01");	//Vážně? Copak to asi může být za zprávu?
	Mil_310_Scheisse_erzaehlt = TRUE;
	Info_ClearChoices(DIA_Mil_310_Stadtwache_Paladine);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine,"Brzy zaútočí na město!",DIA_Mil_310_Stadtwache_Paladine_AttackSoon);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine,"V khoriniském údolí se shromažďují síly zla!",DIA_Mil_310_Stadtwache_Paladine_EvilArmy);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine,"Přišel jsem si pro Innosovo oko!",DIA_Mil_310_Stadtwache_Paladine_EyeInnos);
};

func void DIA_Mil_310_Stadtwache_Paladine_EyeInnos()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_15_00");	//Přišel jsem si pro Innosovo oko!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_07_01");	//Cože? Nikdy jsem o něčem takovém neslyšel. Co to má být?
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_15_02");	//Je to důležitý artefakt.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_07_03");	//Nevypadáš jako člověk, kterému by někdo svěřoval důležité zprávy. Máš něco, čím by ses mohl prokázat?
	if(!Npc_HasItems(other,ItWr_Passierschein) > 0)
	{
		AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_15_04");	//Ne, nemám!
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_07_05");	//Tak přestaň plýtvat mým časem!
	};
	Info_ClearChoices(DIA_Mil_310_Stadtwache_Paladine);
};

func void DIA_Mil_310_Stadtwache_Paladine_EvilArmy()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_EvilArmy_15_00");	//V Hornickém údolí se shromažďují síly zla!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_EvilArmy_07_01");	//V Hornickém údolí? Přišel jsi odtamtud? Viděl jsi tu armádu?
	Info_ClearChoices(DIA_Mil_310_Stadtwache_Paladine);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine,"Ne - ale posílá mě někdo, kdo ji viděl.",DIA_Mil_310_Stadtwache_Paladine_NoSomeone);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine,"Ne. Ale vím, že tu armádu vedou draci!",DIA_Mil_310_Stadtwache_Paladine_NoDragons);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine,"Ano. Byl jsem v Hornickém údolí. Viděl jsem několik obřích draků!",DIA_Mil_310_Stadtwache_Paladine_YesDragons);
};

func void DIA_Mil_310_Stadtwache_Paladine_AttackSoon()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_AttackSoon_15_00");	//Brzy zaútočí na město!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_AttackSoon_07_01");	//Cože? Kdo? Skřeti? Viděl jsi tu armádu?
	Info_ClearChoices(DIA_Mil_310_Stadtwache_Paladine);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine,"Ne - ale posílá mě někdo, kdo ji viděl.",DIA_Mil_310_Stadtwache_Paladine_NoSomeone);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine,"Ne. Ale vím, že tu armádu vedou draci!",DIA_Mil_310_Stadtwache_Paladine_NoDragons);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine,"Ano. Byl jsem v Hornickém údolí. Viděl jsem několik obřích draků!",DIA_Mil_310_Stadtwache_Paladine_YesDragons);
};

func void DIA_Mil_310_Stadtwache_Paladine_NoDragons()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_NoDragons_15_00");	//Ne. Ale vím, že ji vedou draci!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_NoDragons_07_01");	//Jistě! A moje babička je poradce skřetích generálů.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_NoDragons_07_02");	//Nemysli si, že tě necháme jít za lordem Hagenem s takovými babskými povídačkami!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_NoDragons_07_03");	//Zmiz!
	Player_KnowsLordHagen = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_Mil_310_Stadtwache_Paladine_NoSomeone()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_NoSomeone_15_00");	//Ne - ale posílá mě někdo, kdo ji viděl.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_NoSomeone_07_01");	//(nedůvěřivě) KDO tě posílá?
	Info_ClearChoices(DIA_Mil_310_Stadtwache_Paladine);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine,"Nemám povolení ti ho říct.",DIA_Mil_310_Stadtwache_Paladine_CantTellYou);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine,"Jeden paladin.",DIA_Mil_310_Stadtwache_Paladine_APaladin);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine,"Jeden mág.",DIA_Mil_310_Stadtwache_Paladine_AMage);
};

func void DIA_Mil_310_Stadtwache_Paladine_YesDragons()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_YesDragons_15_00");	//Ano. Byl jsem v khoriniském údolí. Viděl jsem několik obřích draků!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_YesDragons_07_01");	//Lháři! Průsmyk do údolí je z obou stran uzavřený. Nikdo se nedostane skrz!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_YesDragons_07_02");	//Zmiz odsud!
	AI_StopProcessInfos(self);
};

func void DIA_Mil_310_Stadtwache_Paladine_AMage()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_AMage_15_00");	//Jeden mág.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_AMage_07_01");	//Máš zprávy od mágů? Pak jistě máš pečeť jako důkaz!
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_AMage_15_02");	//Ne.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_AMage_07_03");	//Cože? Mágové VŽDYCKY dávají svým poslům pečeť.
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_AMage_15_04");	//Tenhle mág ne.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_AMage_07_05");	//Nevěřím ti. Jestli jsi opravdu posel, tak vybal ty zprávy, nebo zmiz!
	Info_ClearChoices(DIA_Mil_310_Stadtwache_Paladine);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine,"Mohu ten vzkaz předat jen paladinům!",DIA_Mil_310_Stadtwache_Paladine_OnlyPaladins);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine,"Armádu zla vedou draci!",DIA_Mil_310_Stadtwache_Paladine_DepecheDragons);
};

func void DIA_Mil_310_Stadtwache_Paladine_APaladin()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_APaladin_15_00");	//Jeden paladin.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_APaladin_07_01");	//Hm, to by mohla být pravda - paladinové drží průsmyk do Hornického údolí.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_APaladin_07_02");	//Dej mi ten vzkaz a já tě ohlásím.
	Info_ClearChoices(DIA_Mil_310_Stadtwache_Paladine);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine,"Mohu ten vzkaz předat jen paladinům!",DIA_Mil_310_Stadtwache_Paladine_OnlyPaladins);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine,"Armádu zla vedou draci!",DIA_Mil_310_Stadtwache_Paladine_DepecheDragons);
};

func void DIA_Mil_310_Stadtwache_Paladine_CantTellYou()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_CantTellYou_15_00");	//Nemám povolení ti ho říct.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_CantTellYou_07_01");	//Takhle se ke mně nechovej, chlapče! Jsem členem městské stráže.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_CantTellYou_07_02");	//Můžeš mi říct VŠECHNO. Takže - kdo tě posílá?
};

func void DIA_Mil_310_Stadtwache_Paladine_DepecheDragons()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_DepecheDragons_15_00");	//Armádu zla vedou draci!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_DepecheDragons_07_01");	//Cože? To nemůže být pravda. A já už tě málem pustil dál.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_DepecheDragons_07_02");	//Kdybys přišel za lordem Hagenem s TAKOVOUHLE pohádkou, utrhnul by mi hlavu.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_DepecheDragons_07_03");	//Odpal!
	Player_KnowsLordHagen = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_Mil_310_Stadtwache_Paladine_OnlyPaladins()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_OnlyPaladins_15_00");	//Mohu ten vzkaz předat jen paladinům!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_OnlyPaladins_07_01");	//Takhle by to nešlo, chlapče!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_OnlyPaladins_07_02");	//Jak bych tě asi tak mohl pustit za lordem Hagenem, když si nemůžu být jistý, že nebudeš plýtvat jeho drahocenným časem?
	Player_KnowsLordHagen = TRUE;
	Info_ClearChoices(DIA_Mil_310_Stadtwache_Paladine);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine,"Ne. Ten vzkaz je VÝHRADNĚ pro paladiny.",DIA_Mil_310_Stadtwache_Paladine_Only2);
	Info_AddChoice(DIA_Mil_310_Stadtwache_Paladine,"Armádu zla vedou draci!",DIA_Mil_310_Stadtwache_Paladine_DepecheDragons);
};

func void DIA_Mil_310_Stadtwache_Paladine_Only2()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_Only2_15_00");	//Ne. Ten vzkaz je VÝHRADNĚ pro paladiny.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_Only2_07_01");	//V tom případě tady tvoje cesta končí, cizinče.
	AI_StopProcessInfos(self);
};


instance DIA_Mil_310_Stadtwache_PERM(C_Info)
{
	npc = Mil_310_Stadtwache;
	nr = 5;
	condition = DIA_Mil_310_Stadtwache_PERM_Condition;
	information = DIA_Mil_310_Stadtwache_PERM_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Mil_310_Stadtwache_PERM_Condition()
{
	if((self.aivar[AIV_PASSGATE] == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Mil_310_Stadtwache_PERM_Info()
{
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_PERM_07_00");	//Mazej!
	AI_StopProcessInfos(self);
};


instance DIA_MIL_310_STADTWACHE_KILLIGNAZ(C_Info)
{
	npc = Mil_310_Stadtwache;
	nr = 5;
	condition = dia_mil_310_stadtwache_killignaz_condition;
	information = dia_mil_310_stadtwache_killignaz_info;
	permanent = FALSE;
	description = "Nevšiml sis v poslední době něčeho neobvyklého?";
};


func int dia_mil_310_stadtwache_killignaz_condition()
{
	if((MIS_KILLIGNAZ == LOG_Running) && (READORTEGO == FALSE) && (HELPKILLIGNAZ == TRUE))
	{
		return TRUE;
	};
};

func void dia_mil_310_stadtwache_killignaz_info()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_KillIgnaz_01_00");	//Nevšiml sis v poslední době něčeho neobvyklého?
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_KillIgnaz_01_01");	//Ne, ani ne... (lenivě) Je tu klid!
	AI_StopProcessInfos(self);
};

