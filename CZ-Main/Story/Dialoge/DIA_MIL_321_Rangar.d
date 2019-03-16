
instance DIA_Rangar_EXIT(C_Info)
{
	npc = MIL_321_Rangar;
	nr = 999;
	condition = DIA_Rangar_EXIT_Condition;
	information = DIA_Rangar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Rangar_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Rangar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Rangar_PICKPOCKET(C_Info)
{
	npc = MIL_321_Rangar;
	nr = 900;
	condition = DIA_Rangar_PICKPOCKET_Condition;
	information = DIA_Rangar_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(zkusit ukrást tento klíč)";
};


func int DIA_Rangar_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) >= 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (Npc_HasItems(self,ItKe_City_Tower_02) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Rangar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Rangar_PICKPOCKET);
	Info_AddChoice(DIA_Rangar_PICKPOCKET,Dialog_Back,DIA_Rangar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Rangar_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Rangar_PICKPOCKET_DoIt);
};

func void DIA_Rangar_PICKPOCKET_DoIt()
{
	AI_PlayAni(other,"T_STEAL");
	AI_Wait(other,1);

	if((other.attribute[ATR_DEXTERITY] + PickPocketBonusCount) >= Hlp_Random(self.attribute[ATR_DEXTERITY]))
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		}
		else
		{
			GlobalThiefCount += 1;

			if(GlobalThiefCount >= 3)
			{
				INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
				GlobalThiefCount = FALSE;
			};
		};
		B_GiveInvItems(self,other,ItKe_City_Tower_02,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Rangar_PICKPOCKET);
	}
	else
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		};
		THIEFCATCHER = Hlp_GetNpc(self);
		HERO_CANESCAPEFROMGOTCHA = TRUE;
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		self.vars[0] = TRUE;
	};
};

func void DIA_Rangar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Rangar_PICKPOCKET);
};


instance DIA_Rangar_Hallo(C_Info)
{
	npc = MIL_321_Rangar;
	nr = 2;
	condition = DIA_Rangar_Hallo_Condition;
	information = DIA_Rangar_Hallo_Info;
	permanent = FALSE;
	description = "Zdar, jak se vede?";
};


func int DIA_Rangar_Hallo_Condition()
{
	if(((Npc_GetDistToWP(self,"NW_CITY_PALCAMP_15") < 500) == FALSE) && ((Npc_GetDistToWP(self,"NW_CITY_WAY_TO_SHIP_03") < 500) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Rangar_Hallo_Info()
{
	AI_Output(other,self,"DIA_Rangar_Hallo_15_00");	//Zdar, jak se vede?
	AI_Output(self,other,"DIA_Rangar_Hallo_07_01");	//Než mi paladinové dají nějaké další příkazy, můžu si tady v klidu dát několik piv. Co víc by si jeden mohl přát? (šklebí se)
	AI_Output(other,self,"DIA_Rangar_Hallo_15_02");	//Pracuješ pro paladiny?
	AI_Output(self,other,"DIA_Rangar_Hallo_07_03");	//Jo, podávám jim hlášení o dění ve městě. Momentálně je tady docela klid.
};


instance DIA_Rangar_Ork(C_Info)
{
	npc = MIL_321_Rangar;
	nr = 3;
	condition = DIA_Rangar_Ork_Condition;
	information = DIA_Rangar_Ork_Info;
	permanent = FALSE;
	description = "Jak to vypadá se skřety?";
};


func int DIA_Rangar_Ork_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rangar_Hallo) && ((Npc_GetDistToWP(self,"NW_CITY_PALCAMP_15") < 500) == FALSE) && ((Npc_GetDistToWP(self,"NW_CITY_WAY_TO_SHIP_03") < 500) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Rangar_Ork_Info()
{
	AI_Output(other,self,"DIA_Rangar_Ork_15_00");	//Jak to vypadá se skřety?
	AI_Output(self,other,"DIA_Rangar_Ork_07_01");	//Není důvod si dělat těžkou hlavu - my z městské stráže a paladinové máme všechno pod kontrolou.
	AI_Output(self,other,"DIA_Rangar_Ork_07_02");	//Běž domů a nech nás dělat naši práci. Dohlížíme na město a jeho občany. -ŠKYT-
};


instance DIA_Rangar_Bier(C_Info)
{
	npc = MIL_321_Rangar;
	nr = 4;
	condition = DIA_Rangar_Bier_Condition;
	information = DIA_Rangar_Bier_Info;
	permanent = TRUE;
	description = "Dal by sis ještě pivo?";
};


func int DIA_Rangar_Bier_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rangar_Hallo) && ((Npc_GetDistToWP(self,"NW_CITY_PALCAMP_15") < 500) == FALSE) && ((Npc_GetDistToWP(self,"NW_CITY_WAY_TO_SHIP_03") < 500) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Rangar_Bier_Info()
{
	AI_Output(other,self,"DIA_Rangar_Bier_15_00");	//Dal by sis ještě pivo?

	if(B_GiveInvItems(other,self,ItFo_Beer,1))
	{
		if(Knows_Paladins == FALSE)
		{
			AI_Output(self,other,"DIA_Rangar_Bier_07_01");	//Ááá - nic se nevyrovná správně vychlazenýmu pivku.
			CreateInvItems(self,ItFo_Booze,1);
			B_UseItem(self,ItFo_Booze);
			AI_Output(other,self,"DIA_Rangar_Bier_15_02");	//Chystal ses říct něco o skřetech.
			AI_Output(self,other,"DIA_Rangar_Bier_07_03");	//Jo, no jo, jasně. Skřeti nepředstavují pro město vůbec žádnou hrozbu.
			AI_Output(self,other,"DIA_Rangar_Bier_07_04");	//Obsadili Hornické údolí. A průsmyk drží paladinové.
			AI_Output(self,other,"DIA_Rangar_Bier_07_05");	//Neproklouzne kolem nich ani myš.
			Knows_Paladins = 1;
			Info_ClearChoices(DIA_Rangar_Bier);
		}
		else if((Knows_Paladins == 1) && (Knows_Ork == TRUE))
		{
			AI_Output(self,other,"DIA_Rangar_Bier_07_06");	//Pořádnou pintu rozhodně neodmítnu.
			CreateInvItems(self,ItFo_Booze,1);
			B_UseItem(self,ItFo_Booze);
			AI_Output(other,self,"DIA_Rangar_Bier_15_07");	//Dokonce viděli skřeta hned za městem.
			AI_Output(self,other,"DIA_Rangar_Bier_07_08");	//No jo, jasně, nebezpečný skřet za městem. Opravdu příšerný skřet. Určitě co nevidět zaútočí na město.
			AI_Output(self,other,"DIA_Rangar_Bier_07_09");	//Poslouchej, toho tlustýho skřeta nakopeme do toho jeho tlustýho zadku ve chvíli, kdy se moc přiblíží k městu. Jasan?
			AI_Output(other,self,"DIA_Rangar_Bier_15_10");	//Aha.
			Knows_Paladins = 2;

			if(RhetorikSkillValue[1] < 100)
			{
				RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
				AI_Print("Rétorika + 1");
			};

			Info_ClearChoices(DIA_Rangar_Bier);
		}
		else
		{
			AI_Output(self,other,"DIA_Rangar_Bier_07_11");	//Dobrý hořký pivko je to nejlepší, co může být.
			CreateInvItems(self,ItFo_Booze,1);
			B_UseItem(self,ItFo_Booze);
			AI_Output(self,other,"DIA_Rangar_Bier_07_12");	//Víš, nenarazíš často na někoho, kdo by tě pozval na pivo. Jsi docela fajn.
			Info_ClearChoices(DIA_Rangar_Bier);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Rangar_Bier_07_13");	//Jasně, že si ještě dám pivo. Jedno pro mě.
		AI_StopProcessInfos(self);
	};
};


instance DIA_Addon_Rangar_Erwischt(C_Info)
{
	npc = MIL_321_Rangar;
	nr = 5;
	condition = DIA_Addon_Rangar_Erwischt_Condition;
	information = DIA_Addon_Rangar_Erwischt_Info;
	description = "Co tady děláš?";
};


var int DIA_Addon_Rangar_Erwischt_OneTime;

func int DIA_Addon_Rangar_Erwischt_Condition()
{
	if((Npc_GetDistToWP(self,"NW_CITY_PALCAMP_15") < 500) && (DIA_Addon_Rangar_Erwischt_OneTime == FALSE) && (MIS_Addon_Martin_GetRangar == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Rangar_Erwischt_Info()
{
	AI_Output(other,self,"DIA_Addon_Rangar_Erwischt_15_00");	//Co tady děláš?
	AI_Output(self,other,"DIA_Addon_Rangar_Erwischt_07_01");	//Uhm... (vystrašeně) Já... To tě nemusí zajímat! Ztrať se!
	AI_Output(other,self,"DIA_Addon_Rangar_Erwischt_15_02");	//Martin bude rád, až mu povím, kdo se šťoural v jeho věcech mezi tím, co byl pryč.
	AI_Output(self,other,"DIA_Addon_Rangar_Erwischt_07_03");	//Dělej si, co chceš. Já jdu pryč.
	B_GivePlayerXP(XP_Addon_Martin_GotRangar);
	AI_StopProcessInfos(self);

	if(MIS_CoragonFixBeer == LOG_Success)
	{
		Npc_ExchangeRoutine(self,"Coragon");
	}
	else
	{
		Npc_ExchangeRoutine(self,"Start");
	};
	SC_GotRangar = TRUE;
};


instance DIA_Addon_Rangar_nachhaken(C_Info)
{
	npc = MIL_321_Rangar;
	nr = 2;
	condition = DIA_Addon_Rangar_nachhaken_Condition;
	information = DIA_Addon_Rangar_nachhaken_Info;
	permanent = TRUE;
	description = "Opravdu si myslíš, že tě nechám uniknout trestu?";
};


func int DIA_Addon_Rangar_nachhaken_Condition()
{
	if((SC_GotRangar == TRUE) && (MIS_Addon_Martin_GetRangar == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_Rangar_nachhaken_Info()
{
	AI_Output(other,self,"DIA_Addon_Rangar_nachhaken_15_00");	//Opravdu si myslíš, že tě nechám uniknout trestu?
	AI_Output(self,other,"DIA_Addon_Rangar_nachhaken_07_01");	//(lhostejně) Nedělej takový randál kvůli trošce zásob a potravin.
};

