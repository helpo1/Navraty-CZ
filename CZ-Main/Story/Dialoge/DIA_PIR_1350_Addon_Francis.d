
instance DIA_Addon_Francis_EXIT(C_Info)
{
	npc = PIR_1350_Addon_Francis;
	nr = 999;
	condition = DIA_Addon_Francis_EXIT_Condition;
	information = DIA_Addon_Francis_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Francis_EXIT_Condition()
{
	if(GregIsBack == FALSE)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Francis_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Francis_First(C_Info)
{
	npc = PIR_1350_Addon_Francis;
	nr = 1;
	condition = DIA_Addon_Francis_First_Condition;
	information = DIA_Addon_Francis_First_Info;
	permanent = FALSE;
	description = "To je tvá chatrč?";
};


func int DIA_Addon_Francis_First_Condition()
{
	if((Knows_GregsHut == FALSE) && (Francis_ausgeschissen == FALSE) && Npc_HasItems(self,ITKE_Greg_ADDON_MIS))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Francis_First_Info()
{
	AI_Output(other,self,"DIA_Addon_Francis_GregsHut_15_00");	//To je tvá chatrč?
	AI_Output(self,other,"DIA_Addon_Francis_GregsHut_13_01");	//Ne, patří Gregovi.
	Knows_GregsHut = TRUE;
};


instance DIA_Addon_Francis_LetMeIn(C_Info)
{
	npc = PIR_1350_Addon_Francis;
	nr = 2;
	condition = DIA_Addon_Francis_LetMeIn_Condition;
	information = DIA_Addon_Francis_LetMeIn_Info;
	permanent = FALSE;
	description = "Musím se dostat dovnitř do Gregovy chatrče.";
};


func int DIA_Addon_Francis_LetMeIn_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Addon_Francis_First) || (Knows_GregsHut == TRUE)) && (Francis_ausgeschissen == FALSE) && Npc_HasItems(self,ITKE_Greg_ADDON_MIS))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Francis_LetMeIn_Info()
{
	AI_Output(other,self,"DIA_Addon_Francis_LetMeIn_15_00");	//Musím se dostat dovnitř do Gregovy chatrče.
	AI_Output(self,other,"DIA_Addon_Francis_LetMeIn_13_01");	//Nikdy!
	AI_Output(self,other,"DIA_Addon_Francis_LetMeIn_13_02");	//Greg tu není. Zamkl jsem dveře a ujistil se, že nikdo nedostane nápad se tam vloupat.
	AI_Output(self,other,"DIA_Addon_Francis_LetMeIn_13_03");	//Odejdi nebo nedopadneš dobře.
};


instance DIA_Addon_Francis_AboutGreg(C_Info)
{
	npc = PIR_1350_Addon_Francis;
	nr = 3;
	condition = DIA_Addon_Francis_AboutGreg_Condition;
	information = DIA_Addon_Francis_AboutGreg_Info;
	permanent = FALSE;
	description = "Greg je tvůj šéf?";
};


func int DIA_Addon_Francis_AboutGreg_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Francis_LetMeIn) && (Francis_ausgeschissen == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Francis_AboutGreg_Info()
{
	AI_Output(other,self,"DIA_Addon_Francis_AboutGreg_15_00");	//Greg je tvůj šéf?
	AI_Output(self,other,"DIA_Addon_Francis_AboutGreg_13_01");	//Ano ale nyní tu není.
	AI_Output(self,other,"DIA_Addon_Francis_AboutGreg_13_02");	//Každý námořník, jak říkám, každý suchozemec na tomto ostrově zná strašného kapitána Grega!
	AI_Output(self,other,"DIA_Addon_Francis_AboutGreg_13_03");	//(nadřazeně) Svěřil mi zde velení!
	AI_Output(self,other,"DIA_Addon_Francis_AboutGreg_13_04");	//Jsem zodpovědný za tento tábor, který mi byl svěřen!
	AI_Output(self,other,"DIA_Addon_Francis_AboutGreg_13_05");	//Někteří hoši si myslí, že si mohou dělat, co chtějí, když tu kapitán Greg není.
	AI_Output(self,other,"DIA_Addon_Francis_AboutGreg_13_06");	//Ale budou velice překvapeni, až se Greg vrátí.
	AI_Output(self,other,"DIA_Addon_Francis_AboutGreg_13_07");	//Řeknu mu vše, co se zde stalo, slyšíš?
	AI_Output(self,other,"DIA_Addon_Francis_AboutGreg_13_08");	//A taky věci, jako kdo chce vstoupit do jeho chatrče.
	AI_Output(self,other,"DIA_Addon_Francis_AboutGreg_13_09");	//Tak radši vypadni, jestli je ti život milý.
};


var int Francis_bezahlt;

instance DIA_Addon_Francis_Key(C_Info)
{
	npc = PIR_1350_Addon_Francis;
	nr = 4;
	condition = DIA_Addon_Francis_Key_Condition;
	information = DIA_Addon_Francis_Key_Info;
	permanent = TRUE;
	description = "Dej mi klíč od Gregovy chatrče!";
};


func int DIA_Addon_Francis_Key_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Francis_LetMeIn) && Npc_HasItems(self,ITKE_Greg_ADDON_MIS))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Francis_Key_Info()
{
	AI_Output(other,self,"DIA_Addon_Francis_Key_15_00");	//Dej mi klíč od Gregovy chatrče!
	AI_Output(self,other,"DIA_Addon_Francis_Key_13_01");	//Musíš si dělat legraci!
	Info_ClearChoices(DIA_Addon_Francis_Key);
	Info_AddChoice(DIA_Addon_Francis_Key,"Popřemýšlím o tom...",DIA_Addon_Francis_Key_BACK);
	Info_AddChoice(DIA_Addon_Francis_Key,"Dám ti 2000 zlata!",DIA_Addon_Francis_Key_2000Gold);
	Info_AddChoice(DIA_Addon_Francis_Key,"Dám ti 1000 zlata!",DIA_Addon_Francis_Key_1000Gold);
};

func void DIA_Addon_Francis_Key_BACK()
{
	Info_ClearChoices(DIA_Addon_Francis_Key);
};

func void DIA_Addon_Francis_Key_1000Gold()
{
	AI_Output(other,self,"DIA_Addon_Francis_Key_1000Gold_15_00");	//Dám ti 1000 zlata!
	AI_Output(self,other,"DIA_Addon_Francis_Key_1000Gold_13_01");	//To je trochu málo za zradu kapitána, nemyslíš?
	AI_Output(self,other,"DIA_Addon_Francis_Key_1000Gold_13_02");	//Dávej si víc pozor, co říkáš! Jinak bych ti byl nucen dát asi pořádný výprask!
};

func void DIA_Addon_Francis_Key_2000Gold()
{
	AI_Output(other,self,"DIA_Addon_Francis_Key_2000Gold_15_00");	//Dám ti 2000 zlata!
	if(Npc_HasItems(other,ItMi_Gold) >= 2000)
	{
		AI_Output(self,other,"DIA_Addon_Francis_Key_2000Gold_13_01");	//Chlape, ty po mně žádáš vzpouru!
		AI_Output(self,other,"DIA_Addon_Francis_Key_2000Gold_13_02");	//(k sobě) Ale když se nad tím zamyslím...
		AI_Output(self,other,"DIA_Addon_Francis_Key_2000Gold_13_03");	//Ach, ruku na to, nikdo na to nepřijde.
		AI_Output(self,other,"DIA_Addon_Francis_Key_2000Gold_13_04");	//Tu je klíč!
		AI_Output(self,other,"DIA_Addon_Francis_Key_2000Gold_13_05");	//Ale rychle, dokud se Greg nevrátil! A ani slovo ostatním, slyšíš?!
		B_GiveInvItems(other,self,ItMi_Gold,2000);
		B_GiveInvItems(self,other,ITKE_Greg_ADDON_MIS,1);
		Francis_bezahlt = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_FrancisNotEnoughGold_13_05");	//(směje se) Ha! Ty nemáš tolik peněz!
	};
	Info_ClearChoices(DIA_Addon_Francis_Key);
};


instance DIA_Addon_Francis_AufsMaul(C_Info)
{
	npc = PIR_1350_Addon_Francis;
	nr = 5;
	condition = DIA_Addon_Francis_AufsMaul_Condition;
	information = DIA_Addon_Francis_AufsMaul_Info;
	permanent = TRUE;
	description = "Dobře, podíváme se, jak na tom jsi.";
};


func int DIA_Addon_Francis_AufsMaul_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Francis_LetMeIn) && Npc_HasItems(self,ITKE_Greg_ADDON_MIS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Francis_AufsMaul_Info()
{
	AI_Output(other,self,"DIA_Addon_Francis_AufsMaul_15_00");	//Dobře, podíváme se, jak na tom jsi.
	AI_Output(self,other,"DIA_Addon_Francis_AufsMaul_13_01");	//(pronikavě) Co? Já jsem tady kapitán!
	AI_Output(self,other,"DIA_Addon_Francis_AufsMaul_13_02");	//Já tě naučím způsobům, ty suchozemská kryso!
	FRANCISIGNORME = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Addon_Francis_Buch(C_Info)
{
	npc = PIR_1350_Addon_Francis;
	nr = 5;
	condition = DIA_Addon_Francis_Buch_Condition;
	information = DIA_Addon_Francis_Buch_Info;
	permanent = TRUE;
	description = "Našel jsem tvoje malé doupě...";
};


func int DIA_Addon_Francis_Buch_Condition()
{
	if(Npc_HasItems(other,ITWR_Addon_FrancisAbrechnung_Mis))
	{
		return TRUE;
	};
};

func void DIA_Addon_Francis_Buch_Info()
{
	AI_Output(other,self,"DIA_Addon_Francis_Key_Business_15_03");	//Našel jsem tvoje malé doupě. Tvůj poklad a výplatní listinu. To je tvá knížečka, nebo ne?
	AI_Output(self,other,"DIA_Addon_Francis_Buch_13_01");	//Eh... Nikdy jsem tu knížku neviděl...
	AI_Output(self,other,"DIA_Addon_Francis_Buch_13_02");	//A... eh... a kdyby to bylo moje...
	AI_Output(self,other,"DIA_Addon_Francis_Buch_13_03");	//A ty si skutečně myslíš, že hoši uvěří nějakému zažloutlému kusu papíru?
	AI_Output(other,self,"DIA_Addon_Francis_Key_Business_15_01");	//Ty jsi je ošidil o část jejich podílu!
	AI_Output(self,other,"DIA_Addon_Francis_Buch_13_04");	//Eh... Počkej...
	if(Npc_HasItems(self,ITKE_Greg_ADDON_MIS))
	{
		if(Npc_KnowsInfo(other,DIA_Addon_Francis_LetMeIn))
		{
			AI_Output(self,other,"DIA_Addon_Francis_Buch_13_05");	//(tiše) Nechtěls klíč od Gregovy chatrče...
		};
		AI_Output(self,other,"DIA_Addon_Francis_Buch_13_06");	//Dám ti klíč ke Gregově chatrči!
		AI_Output(self,other,"DIA_Addon_Francis_Buch_13_07");	//Můžeš tam vzít mnoho zajímavých věcí...
		AI_Output(self,other,"DIA_Addon_Francis_Buch_13_08");	//(rozrušeně) Ale dáš mi tu knihu a budeš o tom mlčet, jasné?
		B_GiveInvItems(other,self,ITWR_Addon_FrancisAbrechnung_Mis,1);
		Npc_RemoveInvItems(self,ITWR_Addon_FrancisAbrechnung_Mis,Npc_HasItems(self,ITWR_Addon_FrancisAbrechnung_Mis));
		B_GiveInvItems(self,other,ITKE_Greg_ADDON_MIS,1);
		FRANCISIGNORME = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Francis_Buch_13_09");	//Jen neudělej nic hloupého!

		if((Francis_bezahlt == TRUE) && (Npc_HasItems(self,ItMi_Gold) >= 2000))
		{
			AI_Output(self,other,"DIA_Addon_Francis_Buch_13_10");	//Tady máš 2000 zlata!
			AI_Output(self,other,"DIA_Addon_Francis_Buch_13_11");	//A 500 navíc.
			B_GiveInvItems(self,other,ItMi_Gold,2500);
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Francis_Buch_13_12");	//Tady máš 500 zlata!
			B_GiveInvItems(self,other,ItMi_Gold,500);
		};
		AI_Output(self,other,"DIA_Addon_Francis_Buch_13_13");	//(naštvaně) A nyní mě nech...
		B_GiveInvItems(other,self,ITWR_Addon_FrancisAbrechnung_Mis,1);
		Npc_RemoveInvItems(self,ITWR_Addon_FrancisAbrechnung_Mis,Npc_HasItems(self,ITWR_Addon_FrancisAbrechnung_Mis));
	};
	AI_StopProcessInfos(self);
};


instance DIA_Francis_PICKPOCKET(C_Info)
{
	npc = PIR_1350_Addon_Francis;
	nr = 900;
	condition = DIA_Francis_PICKPOCKET_Condition;
	information = DIA_Francis_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(Ukrást tento klíč bude jednoduché.)";
};


func int DIA_Francis_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) >= 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (Npc_HasItems(self,ITKE_Greg_ADDON_MIS) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Francis_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Francis_PICKPOCKET);
	Info_AddChoice(DIA_Francis_PICKPOCKET,Dialog_Back,DIA_Francis_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Francis_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Francis_PICKPOCKET_DoIt);
};

func void DIA_Francis_PICKPOCKET_DoIt()
{
	AI_PlayAni(other,"T_STEAL");
	AI_Wait(other,1);

	if((other.attribute[ATR_DEXTERITY] + PickPocketBonusCount) >= Hlp_Random(self.attribute[ATR_DEXTERITY]))
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 2;
		}
		else
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		};
		B_GiveInvItems(self,other,ITKE_Greg_ADDON_MIS,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GivePlayerXP(XP_Ambient);
		Info_ClearChoices(DIA_Francis_PICKPOCKET);
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

func void DIA_Francis_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Francis_PICKPOCKET);
};


instance DIA_Francis_Ausgeschissen(C_Info)
{
	npc = PIR_1350_Addon_Francis;
	nr = 900;
	condition = DIA_Francis_Ausgeschissen_Condition;
	information = DIA_Francis_Ausgeschissen_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Francis_Ausgeschissen_Condition()
{
	if((Francis_ausgeschissen == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Francis_Ausgeschissen_Info()
{
	if(!Npc_IsDead(Greg))
	{
		AI_Output(self,other,"DIA_Addon_Francis_Ausgeschissen_13_00");	//(nahlas) Protože by mě Greg jinak nechal kácet stromy do posedního zbylého keříčku!
	};
	AI_Output(self,other,"DIA_Addon_Francis_Ausgeschissen_13_01");	//Ztrať se!
	AI_StopProcessInfos(self);
};

