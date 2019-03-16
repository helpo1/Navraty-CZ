
instance DIA_Wambo_EXIT(C_Info)
{
	npc = Mil_316_Wambo;
	nr = 999;
	condition = DIA_Wambo_EXIT_Condition;
	information = DIA_Wambo_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Wambo_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Wambo_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Wambo_PICKPOCKET(C_Info)
{
	npc = Mil_316_Wambo;
	nr = 900;
	condition = DIA_Wambo_PICKPOCKET_Condition;
	information = DIA_Wambo_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(zkusit ukrást tento klíč)";
};

func int DIA_Wambo_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) >= 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (Npc_HasItems(self,ItKe_City_Tower_04) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Wambo_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Wambo_PICKPOCKET);
	Info_AddChoice(DIA_Wambo_PICKPOCKET,Dialog_Back,DIA_Wambo_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Wambo_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Wambo_PICKPOCKET_DoIt);
};

func void DIA_Wambo_PICKPOCKET_DoIt()
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

		B_GiveInvItems(self,other,ItKe_City_Tower_04,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Wambo_PICKPOCKET);
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

func void DIA_Wambo_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Wambo_PICKPOCKET);
};


instance DIA_Wambo_Job(C_Info)
{
	npc = Mil_316_Wambo;
	nr = 5;
	condition = DIA_Wambo_Job_Condition;
	information = DIA_Wambo_Job_Info;
	permanent = FALSE;
	description = "Co tady děláš?";
};


func int DIA_Wambo_Job_Condition()
{
	return TRUE;
};

func void DIA_Wambo_Job_Info()
{
	AI_Output(other,self,"DIA_Wambo_Job_15_00");	//Co tady děláš?
	AI_Output(self,other,"DIA_Wambo_Job_03_01");	//Starám se o to, aby nikdo nevešel dovnitř.
	AI_Output(self,other,"DIA_Wambo_Job_03_02");	//Výslovný rozkaz od lorda Hagena. A ani nemysli na to, že by ses tomu rozkazu protivil!
};


instance DIA_Wambo_Situation(C_Info)
{
	npc = Mil_316_Wambo;
	nr = 10;
	condition = DIA_Wambo_Situation_Condition;
	information = DIA_Wambo_Situation_Info;
	permanent = TRUE;
	description = "Jak se vede?";
};


func int DIA_Wambo_Situation_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wambo_Job))
	{
		return TRUE;
	};
};

func void DIA_Wambo_Situation_Info()
{
	AI_Output(other,self,"DIA_Wambo_Situation_15_00");	//Jak se vede?
	AI_Output(self,other,"DIA_Wambo_Situation_03_01");	//V tuhle chvíli je všechno v klidu.
};


instance DIA_Wambo_Ramirez(C_Info)
{
	npc = Mil_316_Wambo;
	nr = 5;
	condition = DIA_Wambo_Ramirez_Condition;
	information = DIA_Wambo_Ramirez_Info;
	permanent = FALSE;
	description = "Přicházím od našeho společného přítele Ramireze.";
};


func int DIA_Wambo_Ramirez_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Ramirez_Viertel))
	{
		return TRUE;
	};
};

func void DIA_Wambo_Ramirez_Info()
{
	AI_Output(other,self,"DIA_Wambo_Ramirez_15_00");	//Přicházím od našeho společného přítele Ramireze.
	AI_Output(self,other,"DIA_Wambo_Ramirez_03_01");	//Cože? Ten Ramirez je pěkná krysa. A není žádný můj přítel. To je jedno. Přinášíš mi něco?
	AI_Output(other,self,"DIA_Wambo_Ramirez_15_02");	//To záleží na tom, co chceš.
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_Wambo_Ramirez_03_03");	//(tiše) Dobrá, řeknu ti, jak to chodí. Zaplatíš 250 zlatých. Pak tady v noci nebudu.
	AI_Output(self,other,"DIA_Wambo_Ramirez_03_04");	//Pokud bys ale byl příliš nápadný a já tady přece jenom byl, tak z obchodu sešlo.
};


instance DIA_Wambo_Deal(C_Info)
{
	npc = Mil_316_Wambo;
	nr = 5;
	condition = DIA_Wambo_Deal_Condition;
	information = DIA_Wambo_Deal_Info;
	permanent = TRUE;
	description = "Mám pro tebe ty peníze.";
};


var int DIA_Wambo_Deal_permanent;

func int DIA_Wambo_Deal_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Wambo_Ramirez) && (DIA_Wambo_Deal_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Wambo_Deal_Info()
{
	AI_Output(other,self,"DIA_Wambo_Deal_15_00");	//Mám pro tebe ty peníze...

	if(B_GiveInvItems(other,self,ItMi_Gold,250))
	{
		AI_Output(self,other,"DIA_Wambo_Deal_03_01");	//Dobrá, tak já na večer zmizím.
		AI_Output(self,other,"DIA_Wambo_Deal_03_02");	//A nezapomeň - kdybys dělal nějaké problémy, tak tě neznám.
		DIA_Wambo_Deal_permanent = TRUE;
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"DRINK");
	}
	else
	{
		AI_Output(other,self,"DIA_Wambo_Deal_15_03");	//... ale ne zrovna u sebe.
		AI_Output(self,other,"DIA_Wambo_Deal_03_04");	//Nesnáším, když ze mě někdo dělá šaška. Tak přines to zlato.
		AI_StopProcessInfos(self);
	};
};


instance DIA_WAMBO_KILL(C_Info)
{
	npc = Mil_316_Wambo;
	nr = 5;
	condition = dia_wambo_kill_condition;
	information = dia_wambo_kill_info;
	permanent = FALSE;
	description = "Zdá se, že máš problém.";
};


func int dia_wambo_kill_condition()
{
	if(MIS_KILLWAMBO == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_wambo_kill_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Wambo_Kill_01_00");	//Zdá se, že máš problém.
	AI_Output(self,other,"DIA_Wambo_Kill_01_01");	//Já? Problém? (směje se)
	AI_Output(other,self,"DIA_Wambo_Kill_01_03");	//Prý okrádáš místní obchodníky. Vymáháš od nich výpalné. Mnoho z nich si stěžovalo!
	AI_Output(self,other,"DIA_Wambo_Kill_01_04");	//(pyšně) Dobrá. A co jako?
	AI_Output(other,self,"DIA_Wambo_Kill_01_07");	//Rozhodl jsem se ti oznámit, že tvé skutky nezůstanou bez trestu. O to se postarám - osobně.
	AI_Output(self,other,"DIA_Wambo_Kill_01_08");	//Opravdu? (směje se) A co uděláš? Poběžíš za lordem Andrem?
	AI_ReadyMeleeWeapon(other);
	AI_Output(other,self,"DIA_Wambo_Kill_01_09");	//Ne. Prostě ti vrazím do břicha svůj meč.
	AI_Output(self,other,"DIA_Wambo_Kill_01_10");	//CO?! Ty mi vyhrožuješ? Ty parchante!
	AI_Output(self,other,"DIA_Wambo_Kill_01_11");	//Jen počkej, teď ti dám lekci...
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,0);
};

