var int FirstMeet;

instance DIA_TPL_8014_TEMPLER_EXIT(C_Info)
{
	npc = tpl_8014_templer;
	nr = 999;
	condition = dia_tpl_8014_templer_exit_condition;
	information = dia_tpl_8014_templer_exit_info;
	permanent = 1;
	description = Dialog_Ende;
};


func int dia_tpl_8014_templer_exit_condition()
{
	return TRUE;
};

func void dia_tpl_8014_templer_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TPL_8014_TEMPLER_FIRST(C_Info)
{
	npc = tpl_8014_templer;
	nr = 2;
	condition = dia_tpl_8014_templer_first_condition;
	information = dia_tpl_8014_templer_first_info;
	permanent = 0;
	important = 1;
};


func int dia_tpl_8014_templer_first_condition()
{
	if((STARTBIGBATTLE == FALSE) && (BIGBATTLEBACKPOSITION == FALSE))
	{
		return TRUE;
	};
};

func void dia_tpl_8014_templer_first_info()
{
	AI_Output(self,other,"DIA_TPL_8014_Templer_First_13_00");	//Vítám tě, cizinče!
	AI_Output(self,other,"DIA_TPL_8014_Templer_First_13_01");	//Právě jsi vstoupil na posvátnou půdu. Zde žije Bratrstvo Spáče.
	AI_Output(self,other,"DIA_TPL_8014_Templer_First_13_02");	//Co tě sem přivádí?
	FirstMeet = TRUE;
	Info_ClearChoices(dia_tpl_8014_templer_first);
	Info_AddChoice(dia_tpl_8014_templer_first,"Jsem nováček. Přál bych si prohlédnout si váš tábor.",dia_tpl_8014_templer_first_justlooking);
	if(other.guild == GIL_NONE)
	{
		Info_AddChoice(dia_tpl_8014_templer_first,"Chtěl bych se k vám přidat.",dia_tpl_8014_templer_first_join);
	};
};

func void dia_tpl_8014_templer_first_join()
{
	AI_Output(other,self,"DIA_TPL_8014_Templer_First_Join_15_00");	//Slyšel jsem, že potřebujete nové lidi. Chtěl bych se k vám přidat.
	AI_Output(self,other,"DIA_TPL_8014_Templer_First_Join_13_01");	//Vítej! Bratrstvo s potěšením přijme každého, kdo je připraven následovat Spáče.
	AI_Output(self,other,"DIA_TPL_8014_Templer_First_Join_13_02");	//Jestli to myslíš vážně, měl by ses pokusit zaujmout pozornost Baal Namiba. Najdeš ho na plácku hned za bránou.
	AI_Output(self,other,"DIA_TPL_8014_Templer_First_Join_13_04");	//Ale nemluv na něj. On sám na tebe musí promluvit.
	Info_ClearChoices(dia_tpl_8014_templer_first);
};

func void dia_tpl_8014_templer_first_justlooking()
{
	AI_Output(other,self,"DIA_TPL_8014_Templer_First_JustLooking_15_00");	//Jsem nováček. Přál bych si prohlédnout si váš tábor.
	AI_Output(self,other,"DIA_TPL_8014_Templer_First_JustLooking_13_01");	//Vždy jsme rádi, když k nám dojdou návštěvníci.
	AI_Output(self,other,"DIA_TPL_8014_Templer_First_JustLooking_13_02");	//Ale musíš respektovat naše pravidla. Jsou zde místa, k němž ti je přístup odepřen.
	Info_ClearChoices(dia_tpl_8014_templer_first);
};


instance DIA_TPL_8014_TEMPLER_SIT(C_Info)
{
	npc = tpl_8014_templer;
	nr = 2;
	condition = dia_tpl_8014_templer_sit_condition;
	information = dia_tpl_8014_templer_sit_info;
	permanent = 1;
	description = "Jak to jde v táboře?";
};


func int dia_tpl_8014_templer_sit_condition()
{
	if((STARTBIGBATTLE == FALSE) && (BIGBATTLEBACKPOSITION == FALSE))
	{
		return TRUE;
	};
};

func void dia_tpl_8014_templer_sit_info()
{
	AI_Output(other,self,"DIA_TPL_8014_Templer_Sit_15_00");	//Jak to jde v táboře?
	AI_Output(self,other,"DIA_TPL_8014_Templer_Sit_13_01");	//Vše je v pohodě. Vstup.
};

instance DIA_TPL_8014_TEMPLER_PrioratStart(C_Info)
{
	npc = tpl_8014_templer;
	nr = 2;
	condition = dia_tpl_8014_templer_PrioratStart_condition;
	information = dia_tpl_8014_templer_PrioratStart_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_tpl_8014_templer_PrioratStart_condition()
{
	if((STARTBIGBATTLE == FALSE) && (BIGBATTLEBACKPOSITION == FALSE) && (Kapitel >= 3) && (FirstMeet == TRUE))
	{
		return TRUE;
	};
};

func void dia_tpl_8014_templer_PrioratStart_info()
{
	if((hero.guild == GIL_SEK) || (hero.guild == GIL_GUR) || (hero.guild == GIL_TPL))
	{
		if(hero.guild == GIL_SEK)
		{
			AI_Output(self,other,"DIA_TPL_8014_Templer_PrioratStart_01_00");	//Počkej novici!
			AI_Output(other,self,"DIA_TPL_8014_Templer_PrioratStart_01_01");	//Co?
			AI_Output(self,other,"DIA_TPL_8014_Templer_PrioratStart_01_02");	//Baal Namib s tebou chce mluvit, tak jdi hned za ním.
		}
		else if(hero.guild == GIL_GUR)
		{
			AI_Output(self,other,"DIA_TPL_8014_Templer_PrioratStart_01_05");	//Odpusť mi mistře...
			AI_Output(other,self,"DIA_TPL_8014_Templer_PrioratStart_01_06");	//Poslouchám...
			AI_Output(self,other,"DIA_TPL_8014_Templer_PrioratStart_01_07");	//Baal Namib s tebou chce urgentně mluvit.
		}
		else if(hero.guild == GIL_TPL)
		{
			AI_Output(self,other,"DIA_TPL_8014_Templer_PrioratStart_01_10");	//Počkej bratře.
			AI_Output(other,self,"DIA_TPL_8014_Templer_PrioratStart_01_11");	//Co?
			AI_Output(self,other,"DIA_TPL_8014_Templer_PrioratStart_01_12");	//Baal Namib s tebou chce mluvit, tak jdi hned za ním.
		};

	}
	else
	{
		AI_Output(self,other,"DIA_TPL_8014_Templer_PrioratStart_01_15");	//Počkej cizinče, jeden z našich spirituálních vůdců by s tebou chtěl mluvit.
		AI_Output(other,self,"DIA_TPL_8014_Templer_PrioratStart_01_18");	//A co po mě chce?
		AI_Output(self,other,"DIA_TPL_8014_Templer_PrioratStart_01_19");	//Tak to netuším, jestli tě to zajíma, běž se ho zeptat.
		AI_Output(self,other,"DIA_TPL_8014_Templer_PrioratStart_01_21");	//Je to Baal Namib, asi ho najdeš meditovat kousek vpravo od vchodu do tábora.
	};

	PrioratPreStart = TRUE;
	AI_StopProcessInfos(self);
};
