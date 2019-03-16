
instance DIA_Peck_EXIT(C_Info)
{
	npc = MIL_324_Peck;
	nr = 999;
	condition = DIA_Peck_EXIT_Condition;
	information = DIA_Peck_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Peck_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Peck_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Peck_PICKPOCKET(C_Info)
{
	npc = MIL_324_Peck;
	nr = 998;
	condition = DIA_Peck_PICKPOCKET_Condition;
	information = DIA_Peck_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(zkusit ukrást tento klíč)";
};

func int DIA_Peck_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) >= 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (Npc_HasItems(self,ItKe_City_Tower_05) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Peck_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Peck_PICKPOCKET);
	Info_AddChoice(DIA_Peck_PICKPOCKET,Dialog_Back,DIA_Peck_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Peck_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Peck_PICKPOCKET_DoIt);
};

func void DIA_Peck_PICKPOCKET_DoIt()
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
		B_GiveInvItems(self,other,ItKe_City_Tower_05,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Peck_PICKPOCKET);
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

func void DIA_Peck_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Peck_PICKPOCKET);
};


instance DIA_Peck_HEY(C_Info)
{
	npc = MIL_324_Peck;
	nr = 2;
	condition = DIA_Peck_HEY_Condition;
	information = DIA_Peck_HEY_Info;
	permanent = TRUE;
	description = "Hej, co tady děláš?";
};


func int DIA_Peck_HEY_Condition()
{
	if((MIS_Andre_Peck != LOG_Running) && (Npc_GetDistToWP(self,"NW_CITY_HABOUR_PUFF_PECK") <= 500))
	{
		return TRUE;
	};
};

func void DIA_Peck_HEY_Info()
{
	AI_Output(other,self,"DIA_Peck_HEY_15_00");	//Hej, co tady děláš?
	AI_Output(self,other,"DIA_Peck_HEY_12_01");	//Hele, mám nějakou práci. Nech mě být.
	AI_StopProcessInfos(self);
};


instance DIA_Peck_FOUND_PECK(C_Info)
{
	npc = MIL_324_Peck;
	nr = 2;
	condition = DIA_Peck_FOUND_PECK_Condition;
	information = DIA_Peck_FOUND_PECK_Info;
	permanent = FALSE;
	description = "Hej, je nejvyšší čas vyrazit.";
};


func int DIA_Peck_FOUND_PECK_Condition()
{
	if((MIS_Andre_Peck == LOG_Running) && (Npc_GetDistToWP(self,"NW_CITY_HABOUR_PUFF_PECK") <= 500))
	{
		return TRUE;
	};
};

func void DIA_Peck_FOUND_PECK_Info()
{
	AI_Output(other,self,"DIA_Peck_FOUND_PECK_15_00");	//Hej, je nejvyšší čas vyrazit.
	AI_Output(self,other,"DIA_Peck_FOUND_PECK_12_01");	//Co chceš? Nevidíš, že mám práci?
	AI_Output(other,self,"DIA_Peck_FOUND_PECK_15_02");	//Potřebuji zbraň, takže se vrať do kasáren.
	AI_Output(self,other,"DIA_Peck_FOUND_PECK_12_03");	//Zatraceně, tvoje zbraň může počkat.
	AI_Output(other,self,"DIA_Peck_FOUND_PECK_15_04");	//Pojď, Andre se už po tobě taky ptal.
	AI_Output(self,other,"DIA_Peck_FOUND_PECK_12_05");	//Hmm... (rozladěně) Dobrá, vždyť už jdu! Ale až budeš Andremu podávat hlášení, neříkej mu, že jsem byl tady.
	PeckOutBordel = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"STORAGE");
	B_StartOtherRoutine(VLK_491_Vanja,"ALONE");
};

instance DIA_Peck_WEAPON(C_Info)
{
	npc = MIL_324_Peck;
	nr = 2;
	condition = DIA_Peck_WEAPON_Condition;
	information = DIA_Peck_WEAPON_Info;
	permanent = TRUE;
	description = "Jdu si pro zbraň.";
};

var int DIA_Peck_WEAPON_perm;

func int DIA_Peck_WEAPON_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Andre_FOUND_PECK) && (Npc_GetDistToWP(self,"NW_CITY_ARMORY_PECK") <= 1000) && (Kapitel < 3) && (DIA_Peck_WEAPON_perm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Peck_WEAPON_Info()
{
	AI_Output(other,self,"DIA_Peck_WEAPON_15_00");	//Jdu si pro zbraň.

	if(MIS_Andre_Peck == LOG_Running)
	{
		AI_Output(self,other,"DIA_Peck_WEAPON_12_01");	//Nejdřív jdi za Andrem a podej mu hlášení.
	}
	else if(MIS_Andre_Peck == LOG_SUCCESS)
	{
		if(PeckCatch == FALSE)
		{
			AI_Output(self,other,"DIA_Peck_WEAPON_12_02");	//No, podívejme, kdo tady je. Náš nový kolegáček. A chce zbraň.
			AI_Output(self,other,"DIA_Peck_WEAPON_12_03");	//Neřekl jsi Andremu, že jsem byl v Červené lucerně. Jsi docela fajn. Na, tady máš meč.
			AI_Output(self,other,"DIA_Peck_Add_12_00");	//Je to nejlepší, jaký tady mám.
			B_GiveInvItems(self,hero,ItMw_1h_Mil_Sword,1);
		}
		else
		{
			AI_Output(self,other,"DIA_Peck_WEAPON_12_04");	//Nezapomněl jsem na tebe. Kdo napráskal Andremu, že jsem byl v Červené lucerně?
			AI_Output(self,other,"DIA_Peck_WEAPON_12_05");	//A teď ode mne ještě chceš meč... dobrá, tady jeden máš. Vezmi si ho. A teď zmiz.
			B_GiveInvItems(self,hero,ItMw_ShortSword1,1);
		};

		DIA_Peck_WEAPON_perm = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Peck_WEAPON_12_06");	//Jestli chceš lepší zbraň, jdi na tržiště ke kupcům.
	};

	AI_StopProcessInfos(self);
};

func void B_Peck_LeckMich()
{
	AI_Output(self,other,"DIA_Peck_Add_12_07");	//Polib mi! A s rozběhem!
};

instance DIA_Peck_WEAPON2(C_Info)
{
	npc = MIL_324_Peck;
	nr = 2;
	condition = DIA_Peck_WEAPON2_Condition;
	information = DIA_Peck_WEAPON2_Info;
	permanent = TRUE;
	description = "Neměl bys pro mě lepší zbraň?";
};

var int DIA_Peck_WEAPON2_perm;

func int DIA_Peck_WEAPON2_Condition()
{
	if((other.guild == GIL_MIL) && (Npc_GetDistToWP(self,"NW_CITY_ARMORY_PECK") <= 1000) && (EnterOW_Kapitel2 == TRUE) && (DIA_Peck_WEAPON_perm == TRUE) && (DIA_Peck_WEAPON2_perm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Peck_WEAPON2_Info()
{
	AI_Output(other,self,"DIA_Peck_Add_15_01");	//Neměl bys pro mě lepší zbraň?

	if(MIS_Andre_Peck == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Peck_Add_12_06");	//Nezapomněl jsem, žes mě prásknul lordu Andremu.
		B_Peck_LeckMich();
	}
	else if(Kapitel < 3)
	{
		AI_Output(self,other,"DIA_Peck_Add_12_02");	//Teď zrovna ne.
	}
	else
	{
		AI_Output(self,other,"DIA_Peck_Add_12_03");	//Dobře že se ptáš. Od Onarových žoldáků máme pár opravdu slušných kousků.
		AI_Output(self,other,"DIA_Peck_Add_12_04");	//Jim samotným už nebudou k ničemu... (ošklivě se směje)
		AI_Output(self,other,"DIA_Peck_Add_12_05");	//Na, vem si tenhle.
		B_GiveInvItems(self,other,ItMw_Rubinklinge,1);
		DIA_Peck_WEAPON2_perm = TRUE;
	};
};

instance DIA_Peck_PERM(C_Info)
{
	npc = MIL_324_Peck;
	nr = 998;
	condition = DIA_Peck_PERM_Condition;
	information = DIA_Peck_PERM_Info;
	permanent = TRUE;
	description = "Jsi v pořádku?";
};

func int DIA_Peck_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Peck_WEAPON) || ((other.guild != GIL_MIL) && (Npc_GetDistToWP(self,"NW_CITY_ARMORY_PECK") <= 1000)))
	{
		return TRUE;
	};
};

func void DIA_Peck_PERM_Info()
{
	AI_Output(other,self,"DIA_Peck_PERM_15_00");	//Jsi v pořádku?
	if(MIS_Andre_Peck == LOG_SUCCESS)
	{
		B_Peck_LeckMich();
	}
	else if(Kapitel != 3)
	{
		AI_Output(self,other,"DIA_Peck_PERM_12_01");	//Jo, a ty?
	}
	else if(Kapitel == 3)
	{
		if(MIS_RescueBennet != LOG_SUCCESS)
		{
			if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
			{
				AI_Output(self,other,"DIA_Peck_PERM_12_02");	//Ne tak docela. Dělají mi starosti ti žoldáci. Konkrétně to, že se teď určitě pokusí vysvobodit svého kamaráda z vězení.
				AI_Output(self,other,"DIA_Peck_PERM_12_03");	//Moc by mě nepotěšilo, kdybych se musel postavit bandě zkušených rváčů.
			}
			else if(hero.guild == GIL_KDF)
			{
				AI_Output(self,other,"DIA_Peck_PERM_12_04");	//No samozřejmě! Všichni máme oči otevřené. Mágové mohou být ujištěni, že vězeň nemá žádnou šanci uniknout.
			}
			else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
			{
				AI_Output(self,other,"DIA_Peck_PERM_12_05");	//Vím, co máš v plánu, ale dostat vězně na svobodu se ti nepodaří.
			}
			else
			{
				AI_Output(self,other,"DIA_Peck_PERM_12_05A");	//Všechno je v pořádku. Samozřejmě nebýt vraždy Lothara bylo by lépe.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Peck_PERM_12_06");	//Jsem rád, že se celá ta záležitost kolem vraždy vyjasnila.
			AI_Output(other,self,"DIA_Peck_PERM_15_07");	//Proč?
			AI_Output(self,other,"DIA_Peck_PERM_12_08");	//Ti žoldáci by asi jen tak bez boje nepřihlíželi, jak jednoho z nich pověsíme na šibenici.
			AI_Output(self,other,"DIA_Peck_PERM_12_09");	//V nejhorším případě by na nás zaútočili. Raději si ani nechci představit, co by se stalo potom.
		};
	};
};

instance DIA_Peck_FuckOff(C_Info)
{
	npc = MIL_324_Peck;
	nr = 2;
	condition = DIA_Peck_FuckOff_Condition;
	information = DIA_Peck_FuckOff_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Peck_FuckOff_Condition()
{
	if((MIS_WulfgarBandits == LOG_Success) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Peck_FuckOff_Info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
};