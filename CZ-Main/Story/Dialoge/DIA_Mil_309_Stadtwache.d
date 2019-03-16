
instance DIA_Mil_309_Stadtwache_EXIT(C_Info)
{
	npc = Mil_309_Stadtwache;
	nr = 999;
	condition = DIA_Mil_309_Stadtwache_EXIT_Condition;
	information = DIA_Mil_309_Stadtwache_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Mil_309_Stadtwache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Mil_309_Stadtwache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MIL_309_STADTWACHE_TOARMSCITYGATE(C_Info)
{
	npc = Mil_309_Stadtwache;
	nr = 1;
	condition = dia_mil_309_stadtwache_toarmscitygate_condition;
	information = dia_mil_309_stadtwache_toarmscitygate_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_mil_309_stadtwache_toarmscitygate_condition()
{
	if((TOARMSCITYGATE == TRUE) && (CITYGATEACCESSGRANTED == FALSE))
	{
		return TRUE;
	};
};

func void dia_mil_309_stadtwache_toarmscitygate_info()
{
	B_Say(self,other,"$ALARM");
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,1);
	TOARMSCITYGATE = FALSE;
};


instance DIA_Mil_309_Stadtwache_Hallo(C_Info)
{
	npc = Mil_309_Stadtwache;
	nr = 2;
	condition = DIA_Mil_309_Stadtwache_Hallo_Condition;
	information = DIA_Mil_309_Stadtwache_Hallo_Info;
	permanent = TRUE;
	description = "Jak to jde?";
};


func int DIA_Mil_309_Stadtwache_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Mil_309_Stadtwache_Hallo_Info()
{
	AI_Output(other,self,"DIA_Mil_309_Stadtwache_Hallo_15_00");	//Jak to jde?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF) || (hero.guild == GIL_KDW))
	{
		AI_Output(self,other,"DIA_Mil_309_Stadtwache_Hallo_06_01");	//Všechno v pohodě. Měli bychom mít oči na stopkách.
	}
	else if((Stadtwache_310.aivar[AIV_PASSGATE] == FALSE) && (MIl_309_News < 1))
	{
		AI_Output(self,other,"DIA_Mil_309_Stadtwache_Hallo_06_02");	//Teď poslouchej. Nemůžeme tě pustit do města.
		AI_Output(self,other,"DIA_Mil_309_Stadtwache_Hallo_06_03");	//Ale dám ti tip, a to zcela zdarma.
		AI_Output(self,other,"DIA_Mil_309_Stadtwache_Hallo_06_04");	//Drž se dál od toho lesa před námi - potulují se po něm líté bestie.
		MIl_309_News = 1;
	}
	else if((Stadtwache_310.aivar[AIV_PASSGATE] == FALSE) && (MIl_309_News == 1))
	{
		AI_Output(self,other,"DIA_Mil_309_Stadtwache_Hallo_06_05");	//Zalez zpátky pod šutrák, červe!
	};
	if((Stadtwache_310.aivar[AIV_PASSGATE] == TRUE) && (MIl_309_News < 2))
	{
		AI_Output(self,other,"DIA_Mil_309_Stadtwache_Hallo_06_06");	//Poslouchej - teď máš povolen přístup do města. Ale to neznamená, že by sis tady mohl dělat, co se ti zlíbí.
		AI_Output(self,other,"DIA_Mil_309_Stadtwache_Hallo_06_07");	//Když nebudeš dodržovat pravidla, přijdeš o všechna svá práva!
		MIl_309_News = 2;
	}
	else if((Stadtwache_310.aivar[AIV_PASSGATE] == TRUE) && (MIl_309_News == 2))
	{
		AI_Output(self,other,"DIA_Mil_309_Stadtwache_Hallo_06_08");	//Tak běž - padej!
	};
	AI_StopProcessInfos(self);
};

