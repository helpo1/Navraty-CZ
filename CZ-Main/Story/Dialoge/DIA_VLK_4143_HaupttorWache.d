
instance DIA_Haupttorwache_EXIT(C_Info)
{
	npc = VLK_4143_HaupttorWache;
	nr = 999;
	condition = DIA_Haupttorwache_EXIT_Condition;
	information = DIA_Haupttorwache_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Haupttorwache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Haupttorwache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Haupttorwache_AUFGABE(C_Info)
{
	npc = VLK_4143_HaupttorWache;
	nr = 4;
	condition = DIA_Haupttorwache_AUFGABE_Condition;
	information = DIA_Haupttorwache_AUFGABE_Info;
	permanent = TRUE;
	description = "Co tady děláš?";
};


func int DIA_Haupttorwache_AUFGABE_Condition()
{
	return TRUE;
};

func void DIA_Haupttorwache_AUFGABE_Info()
{
	AI_Output(other,self,"DIA_Haupttorwache_AUFGABE_15_00");	//Co tady děláš?
	AI_Output(self,other,"DIA_Haupttorwache_AUFGABE_13_01");	//Můj úkol je jednoduchý. Mám se ujistit, že skřeti zůstanou více jak třicet stop od brány.
	AI_Output(self,other,"DIA_Haupttorwache_AUFGABE_13_02");	//Jestli se o něco pokusí, spustím poplach - toť vše.
};


instance DIA_Haupttorwache_TOROEFFNEN(C_Info)
{
	npc = VLK_4143_HaupttorWache;
	nr = 5;
	condition = DIA_Haupttorwache_TOROEFFNEN_Condition;
	information = DIA_Haupttorwache_TOROEFFNEN_Info;
	permanent = TRUE;
	description = "Co bych musel udělat, jestli bych chtěl otevřít hlavní bránu?";
};


func int DIA_Haupttorwache_TOROEFFNEN_Condition()
{
	if(Kapitel >= 5)
	{
		return TRUE;
	};
};

func void DIA_Haupttorwache_TOROEFFNEN_Info()
{
	AI_Output(other,self,"DIA_Haupttorwache_TOROEFFNEN_15_00");	//Co bych musel udělat, jestli bych chtěl otevřít hlavní bránu?
	AI_Output(self,other,"DIA_Haupttorwache_TOROEFFNEN_13_01");	//U Innose, proč bys to chtěl vědět?
	self.flags = 0;
	Info_ClearChoices(DIA_Haupttorwache_TOROEFFNEN);
	Info_AddChoice(DIA_Haupttorwache_TOROEFFNEN,"Bojím se o bezpečnost hradu.",DIA_Haupttorwache_TOROEFFNEN_sicherheit);
	Info_AddChoice(DIA_Haupttorwache_TOROEFFNEN,"No, jen jsem se zeptal.",DIA_Haupttorwache_TOROEFFNEN_frage);
};

func void DIA_Haupttorwache_TOROEFFNEN_sicherheit()
{
	AI_Output(other,self,"DIA_Haupttorwache_TOROEFFNEN_sicherheit_15_00");	//Bojím se o bezpečnost hradu.
	AI_Output(self,other,"DIA_Haupttorwache_TOROEFFNEN_sicherheit_13_01");	//To já taky, věř mi.
	AI_Output(self,other,"DIA_Haupttorwache_TOROEFFNEN_sicherheit_13_02");	//Protože jsem spolehlivý strážce, Garond mi dokonce svěřil klíč od brány.
	AI_Output(self,other,"DIA_Haupttorwache_TOROEFFNEN_sicherheit_13_03");	//(pyšně) To je velká zodpovědnost a já svou práci plním tak, jak jsem slíbil Garondovi.
	AI_Output(self,other,"DIA_Haupttorwache_TOROEFFNEN_sicherheit_13_04");	//Ta mříž je dlouho neudržovaná a kdyby ji teď někdo otevřel, ten rezavej krám by se zasekl a nešel by zavřít.
	AI_Output(self,other,"DIA_Haupttorwache_TOROEFFNEN_sicherheit_13_05");	//Nikdo by ji nezavřel! Nesmím myslet na to, co by se stalo. Ještěže klíče mám já.
	AI_StopProcessInfos(self);
};

func void DIA_Haupttorwache_TOROEFFNEN_frage()
{
	AI_Output(other,self,"DIA_Haupttorwache_TOROEFFNEN_frage_15_00");	//No, jen jsem se zeptal.
	AI_Output(self,other,"DIA_Haupttorwache_TOROEFFNEN_frage_13_01");	//Neměl bys takhle mluvit. Můžeš si nadělat problémy. Jsou to pro nás těžké časy. Teď jdi, mám tady hlídat a ne se vybavovat.
	AI_StopProcessInfos(self);
};


instance DIA_Haupttorwache_PICKPOCKET(C_Info)
{
	npc = VLK_4143_HaupttorWache;
	nr = 900;
	condition = DIA_Haupttorwache_PICKPOCKET_Condition;
	information = DIA_Haupttorwache_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(zkusit ukrást tento klíč)";
};

func int DIA_Haupttorwache_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) >= 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (Npc_HasItems(self,itke_oc_maingate_mis) >= 1) && (Kapitel >= 5))
	{
		return TRUE;
	};
};

func void DIA_Haupttorwache_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Haupttorwache_PICKPOCKET);
	Info_AddChoice(DIA_Haupttorwache_PICKPOCKET,Dialog_Back,DIA_Haupttorwache_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Haupttorwache_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Haupttorwache_PICKPOCKET_DoIt);
};

func void DIA_Haupttorwache_PICKPOCKET_DoIt()
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
		B_GiveInvItems(self,other,itke_oc_maingate_mis,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GivePlayerXP(XP_Ambient);
		Info_ClearChoices(DIA_Haupttorwache_PICKPOCKET);
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

func void DIA_Haupttorwache_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Haupttorwache_PICKPOCKET);
};

