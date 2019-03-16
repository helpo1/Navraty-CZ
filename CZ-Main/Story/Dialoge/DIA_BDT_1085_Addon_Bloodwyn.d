
instance DIA_Addon_Bloodwyn_EXIT(C_Info)
{
	npc = BDT_1085_Addon_Bloodwyn;
	nr = 999;
	condition = DIA_Addon_Bloodwyn_EXIT_Condition;
	information = DIA_Addon_Bloodwyn_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Bloodwyn_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Bloodwyn_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Bloodwyn_PICKPOCKET(C_Info)
{
	npc = BDT_1085_Addon_Bloodwyn;
	nr = 900;
	condition = DIA_Addon_Bloodwyn_PICKPOCKET_Condition;
	information = DIA_Addon_Bloodwyn_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Bloodwyn_PICKPOCKET_Condition()
{
	return C_Beklauen(90,250);
};

func void DIA_Addon_Bloodwyn_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Bloodwyn_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Bloodwyn_PICKPOCKET,Dialog_Back,DIA_Addon_Bloodwyn_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Bloodwyn_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Bloodwyn_PICKPOCKET_DoIt);
};

func void DIA_Addon_Bloodwyn_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Bloodwyn_PICKPOCKET);
};

func void DIA_Addon_Bloodwyn_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Bloodwyn_PICKPOCKET);
};


instance DIA_Addon_Bloodwyn_Dead(C_Info)
{
	npc = BDT_1085_Addon_Bloodwyn;
	nr = 2;
	condition = DIA_Addon_Bloodwyn_Dead_Condition;
	information = DIA_Addon_Bloodwyn_Dead_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Bloodwyn_Dead_Condition()
{
	if(Npc_GetDistToWP(self,"BL_RAVEN_09") <= 1000)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Bloodwyn_Dead_Info()
{
	AI_Output(self,other,"DIA_Addon_Bloodwyn_Dead_04_00");	//Hej, jak ses sem dostal?
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Dead_15_01");	//Skrz vchod.
	AI_Output(self,other,"DIA_Addon_Bloodwyn_Dead_04_02");	//Vtípkuješ? Nesnáším vtipy.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void Bloodwyn_Choices_1()
{
	Info_ClearChoices(DIA_Addon_Bloodwyn_Wait);
	Info_AddChoice(DIA_Addon_Bloodwyn_Wait,PRINT_ADDON_ENOUGHTALK,DIA_Addon_Bloodwyn_Wait_FIGHT);
	Info_AddChoice(DIA_Addon_Bloodwyn_Wait,"A tady jsem myslel, že tě dostanu.",DIA_Addon_Bloodwyn_Wait_GOOD1);
	Info_AddChoice(DIA_Addon_Bloodwyn_Wait,"Všechno má svůj konec.",DIA_Addon_Bloodwyn_Wait_BAD1);
};

func void Bloodwyn_Choices_2()
{
	Info_ClearChoices(DIA_Addon_Bloodwyn_Wait);
	Info_AddChoice(DIA_Addon_Bloodwyn_Wait,PRINT_ADDON_ENOUGHTALK,DIA_Addon_Bloodwyn_Wait_FIGHT);
	Info_AddChoice(DIA_Addon_Bloodwyn_Wait,"A kdo je podle tebe zodpovědný za zničení bariéry?",DIA_Addon_Bloodwyn_Wait_GOOD2);
	Info_AddChoice(DIA_Addon_Bloodwyn_Wait,"Ty a mnoho ostatních chlápků taky...",DIA_Addon_Bloodwyn_Wait_BAD2);
};

func void Bloodwyn_Choices_3()
{
	Info_ClearChoices(DIA_Addon_Bloodwyn_Wait);
	Info_AddChoice(DIA_Addon_Bloodwyn_Wait,PRINT_ADDON_ENOUGHTALK,DIA_Addon_Bloodwyn_Wait_FIGHT);
	Info_AddChoice(DIA_Addon_Bloodwyn_Wait,"Nemyslím, že měl čas být vybíravý...",DIA_Addon_Bloodwyn_Wait_GOOD3);
	Info_AddChoice(DIA_Addon_Bloodwyn_Wait,"Ano, to byla jeho největší chyba...",DIA_Addon_Bloodwyn_Wait_BAD3);
};


instance DIA_Addon_Bloodwyn_Wait(C_Info)
{
	npc = BDT_1085_Addon_Bloodwyn;
	nr = 2;
	condition = DIA_Addon_Bloodwyn_Wait_Condition;
	information = DIA_Addon_Bloodwyn_Wait_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_Bloodwyn_Wait_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Minecrawler_Killed >= 9))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Bloodwyn_Wait_Info()
{
	AI_Output(self,other,"DIA_Addon_Bloodwyn_Wait_04_00");	//Zabils důlní červy? Dobře. Postarám se o zbytek. Ztrať se.
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_15_01");	//Ne tak rychle...
	AI_Output(self,other,"DIA_Addon_Bloodwyn_Wait_04_02");	//Ty tu ještě jsi?
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_15_03");	//Je tu něco, o čem si musíme promluvit.
	Info_ClearChoices(DIA_Addon_Bloodwyn_Wait);
	Info_AddChoice(DIA_Addon_Bloodwyn_Wait,PRINT_ADDON_ENOUGHTALK,DIA_Addon_Bloodwyn_Wait_FIGHT);
	Info_AddChoice(DIA_Addon_Bloodwyn_Wait,"Hledám Ravena.",DIA_Addon_Bloodwyn_Wait_Raven);
};

func void DIA_Addon_Bloodwyn_Wait_Raven()
{
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_Raven_15_00");	//Hledám Ravena.
	AI_Output(self,other,"DIA_Addon_Bloodwyn_Wait_Raven_04_01");	//Ano... a proč by se o TEBE měl Raven zajímat... počkej chviličku... TY jsi... to jsi TY?
	AI_Output(self,other,"DIA_Addon_Bloodwyn_Wait_Raven_04_02");	//Špinavý hajzl, kterého hledáme už celou věčnost. Co tady děláš? Měls být už dávno mrtev!
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_Raven_15_03");	//To není poprvé, co jsem to slyšel.
	AI_Output(self,other,"DIA_Addon_Bloodwyn_Wait_Raven_04_04");	//Všichni tito budižkničemové zklamali... ale ty přes mě neprojdeš. Tentokrát skončím tvou cestu!
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_Raven_15_05");	//Jak už jsem řekl, hledám Ravena, ty mě nezajímáš.
	AI_Output(self,other,"DIA_Addon_Bloodwyn_Wait_Raven_04_06");	//Přišel jsem tě zabít - přežil jsem zatím každý souboj!
	Bloodwyn_Choices_1();
};

func void DIA_Addon_Bloodwyn_Wait_FIGHT()
{
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_Raven_FIGHT_15_00");	//Dost řečí, skončeme to.
	AI_Output(self,other,"DIA_Addon_Bloodwyn_Wait_Raven_FIGHT_04_01");	//(triumfálně) Přišel jsi pozdě! Raven otevřel chrám, zatímco my tady spolu mluvíme. Hahaha - zemři, hrdino!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void Bloodwyn_Lach()
{
	AI_Output(self,other,"DIA_Addon_Bloodwyn_Lach_04_00");	//HAHAHA - stejně zvítězím!
};

func void Bloodwyn_Wut()
{
	AI_Output(self,other,"DIA_Addon_Bloodwyn_Wut_04_00");	//ARRGH! TY synu prasete!
	self.attribute[ATR_STRENGTH] = self.attribute[ATR_STRENGTH] - 5;
	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - 25;
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - 25;
};

func void Bloodwyn_Next_1()
{
	AI_Output(self,other,"DIA_Addon_Bloodwyn_SayChoice_2_04_00");	//A přežil jsem pád bariéry bez sebemenšího škrábnutí!
};

func void Bloodwyn_Next_2()
{
	AI_Output(self,other,"DIA_Addon_Bloodwyn_SayChoice_3_04_00");	//Nemůžeš mě porazit! Jsem Ravenův důvěryhodný společník! Jeho pravá ruka!
};

func void DIA_Addon_Bloodwyn_Wait_GOOD1()
{
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_Raven_GOOD1_15_00");	//A tady jsem tě dostal.
	Bloodwyn_Wut();
	Bloodwyn_Next_1();
	Bloodwyn_Choices_2();
};

func void DIA_Addon_Bloodwyn_Wait_BAD1()
{
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_Raven_BAD1_15_00");	//Vše jednou skončí.
	Bloodwyn_Lach();
	Bloodwyn_Next_1();
	Bloodwyn_Choices_2();
};

func void DIA_Addon_Bloodwyn_Wait_GOOD2()
{
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_Raven_GOOD2_15_00");	//A kdo je podle tebe zodpovědný za pád bariéry?
	Bloodwyn_Wut();
	Bloodwyn_Next_2();
	Bloodwyn_Choices_3();
};

func void DIA_Addon_Bloodwyn_Wait_BAD2()
{
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_Raven_BAD2_15_00");	//Ty a mnoho ostatních chlápků taky...
	Bloodwyn_Lach();
	Bloodwyn_Next_2();
	Bloodwyn_Choices_3();
};

func void DIA_Addon_Bloodwyn_Wait_GOOD3()
{
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_Raven_GOOD3_15_00");	//Nemyslím, že měl čas být vybíravý...
	Bloodwyn_Wut();
	Info_ClearChoices(DIA_Addon_Bloodwyn_Wait);
	Info_AddChoice(DIA_Addon_Bloodwyn_Wait,PRINT_ADDON_ENOUGHTALK,DIA_Addon_Bloodwyn_Wait_FIGHT);
};

func void DIA_Addon_Bloodwyn_Wait_BAD3()
{
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_Raven_BAD3_15_00");	//Ano, to byla jeho největší chyba...
	Bloodwyn_Wut();
	Info_ClearChoices(DIA_Addon_Bloodwyn_Wait);
	Info_AddChoice(DIA_Addon_Bloodwyn_Wait,PRINT_ADDON_ENOUGHTALK,DIA_Addon_Bloodwyn_Wait_FIGHT);
};

