
instance DIA_OCVLK_1_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_OCVLK_1_EXIT_Condition;
	information = DIA_OCVLK_1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_OCVLK_1_EXIT_Condition()
{
	return TRUE;
};

func void DIA_OCVLK_1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_OCVLK_1_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_OCVLK_1_PEOPLE_Condition;
	information = DIA_OCVLK_1_PEOPLE_Info;
	permanent = TRUE;
	description = "Kdo tomu tady velí?";
};


func int DIA_OCVLK_1_PEOPLE_Condition()
{
	if((Kapitel <= 4) && (MIS_KilledDragons < 4))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_OCVLK_1_PEOPLE_Info()
{
	AI_Output(other,self,"DIA_OCVLK_1_PEOPLE_15_00");	//Kdo tomu tady velí?
	AI_Output(self,other,"DIA_OCVLK_1_PEOPLE_01_01");	//Velitel Garond. Ale od chvíle, co se tu situace zhoršila, ho nikdo neviděl nikde jinde než v trůnním sálu. Je mi líto, že to vzalo tak špatný konec.
};


instance DIA_OCVLK_1_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_OCVLK_1_LOCATION_Condition;
	information = DIA_OCVLK_1_LOCATION_Info;
	permanent = TRUE;
	description = "Co víš o Hornickém údolí?";
};


func int DIA_OCVLK_1_LOCATION_Condition()
{
	if((Kapitel <= 4) && (MIS_KilledDragons < 4))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_OCVLK_1_LOCATION_Info()
{
	AI_Output(other,self,"DIA_OCVLK_1_LOCATION_15_00");	//Co víš o Hornickém údolí?
	AI_Output(self,other,"DIA_OCVLK_1_LOCATION_01_01");	//Několik z našich hochů je ještě stále v dolech a snaží se těžit. Teda alespoň, co vím.
	AI_Output(self,other,"DIA_OCVLK_1_LOCATION_01_02");	//Nechtěl bych si to s nimi měnit. Celé údolí se hemží skřety. A to se ani nezmiňuju o dracích.
};


instance DIA_OCVLK_1_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_OCVLK_1_STANDARD_Condition;
	information = DIA_OCVLK_1_STANDARD_Info;
	permanent = TRUE;
	description = "Jak se vede?";
};


func int DIA_OCVLK_1_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_OCVLK_1_STANDARD_Info()
{
	AI_Output(other,self,"DIA_OCVLK_1_STANDARD_15_00");	//Jak se vede?
	if(Kapitel <= 3)
	{
		AI_Output(self,other,"DIA_OCVLK_1_STANDARD_01_01");	//Skřeti nás mají přesně tam, kde nás chtěli mít! Bez posil se dlouho neudržíme! Docela mě překvapuje, že nás draci jednoduše nedodělali všechny.
	};
	if(Kapitel == 4)
	{
		if(MIS_KilledDragons < 4)
		{
			AI_Output(self,other,"DIA_OCVLK_1_STANDARD_01_02");	//Tak se konečně přece jen dočkáme posil.
		}
		else
		{
			AI_Output(self,other,"DIA_OCVLK_1_STANDARD_01_03");	//Slyším dobře, že všichni draci byli zabiti? Díky Innosovi!
		};
	};
	if(Kapitel == 5)
	{
		if(MIS_OCGateOpen == FALSE)
		{
			AI_Output(self,other,"DIA_OCVLK_1_STANDARD_01_04");	//Tahle zpropadená ruda. Měli bychom ji všechnu shodit dolů z cimbuří. Pak by nás skřeti možná nechali na pokoji.
		}
		else
		{
			AI_Output(self,other,"DIA_OCVLK_1_STANDARD_01_05");	//Ty směšné bedny, které tak nedbale naházeli před vchod, nemůžou skřetům nijak překazit jejich plány!
		};
	};
	if(Kapitel >= 6)
	{
		AI_Output(self,other,"DIA_OCVLK_1_STANDARD_01_06");	//Ještě hůř než obvykle! Ale budeme bojovat až do konce!
	};
};

func void B_AssignAmbientInfos_OCVLK_1(var C_Npc slf)
{
	dia_ocvlk_1_exit.npc = Hlp_GetInstanceID(slf);
	dia_ocvlk_1_people.npc = Hlp_GetInstanceID(slf);
	dia_ocvlk_1_location.npc = Hlp_GetInstanceID(slf);
	dia_ocvlk_1_standard.npc = Hlp_GetInstanceID(slf);
};

