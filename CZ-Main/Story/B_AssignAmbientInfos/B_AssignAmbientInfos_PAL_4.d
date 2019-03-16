
instance DIA_PAL_4_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_PAL_4_EXIT_Condition;
	information = DIA_PAL_4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_PAL_4_EXIT_Condition()
{
	return TRUE;
};

func void DIA_PAL_4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_4_JOIN(C_Info)
{
	nr = 4;
	condition = DIA_PAL_4_JOIN_Condition;
	information = DIA_PAL_4_JOIN_Info;
	permanent = TRUE;
	description = "Jak bych se mohl stát paladinem?";
};


func int DIA_PAL_4_JOIN_Condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_PAL_4_JOIN_Info()
{
	AI_Output(other,self,"DIA_PAL_4_JOIN_15_00");	//Jak bych se mohl stát paladinem?
	AI_Output(self,other,"DIA_PAL_4_JOIN_04_01");	//Pokud to myslíš vážně, měl bys nejprve vstoupit do jejich služeb.
	AI_Output(self,other,"DIA_PAL_4_JOIN_04_02");	//Zajdi do kasáren a promluv si s lordem Andrem. Nech se přijmout k domobraně.
	AI_Output(self,other,"DIA_PAL_4_JOIN_04_03");	//Pak možná dostaneš šanci ukázat, co v tobě vězí.
};


instance DIA_PAL_4_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_PAL_4_PEOPLE_Condition;
	information = DIA_PAL_4_PEOPLE_Info;
	permanent = TRUE;
	description = "Kdo tomu tady velí?";
};


func int DIA_PAL_4_PEOPLE_Condition()
{
	if(other.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void DIA_PAL_4_PEOPLE_Info()
{
	AI_Output(other,self,"DIA_PAL_4_PEOPLE_15_00");	//Kdo tomu tady velí?
	AI_Output(self,other,"DIA_PAL_4_PEOPLE_04_01");	//Velitelem všech jednotek na ostrově je lord Hagen. Také po celou dobu naší přítomnosti ve městě zastává úřad místodržícího.
	AI_Output(self,other,"DIA_PAL_4_PEOPLE_04_02");	//Ale je velmi zaneprázdněný. Pokud potřebuješ něco zařídit, zajdi do kasáren za lordem Andrem.
};


instance DIA_PAL_4_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_PAL_4_LOCATION_Condition;
	information = DIA_PAL_4_LOCATION_Info;
	permanent = TRUE;
	description = "Co děláte vy, paladinové, tady v Khorinisu?";
};


func int DIA_PAL_4_LOCATION_Condition()
{
	if(Kapitel == 1)
	{
		return TRUE;
	};
};

func void DIA_PAL_4_LOCATION_Info()
{
	AI_Output(other,self,"DIA_PAL_4_LOCATION_15_00");	//Co děláte vy, paladinové, tady v Khorinisu?
	AI_Output(self,other,"DIA_PAL_4_LOCATION_04_01");	//To ti nemůžu říct.
};


instance DIA_PAL_4_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_PAL_4_STANDARD_Condition;
	information = DIA_PAL_4_STANDARD_Info;
	permanent = TRUE;
	description = "Co je nového?";
};


func int DIA_PAL_4_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_PAL_4_STANDARD_Info()
{
	AI_Output(other,self,"DIA_PAL_4_STANDARD_15_00");	//Co je nového?
	if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
	{
		if(Kapitel <= 4)
		{
			if(MIS_OLDWORLD == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_PAL_4_STANDARD_04_01");	//Teď když víme, že máme co do činění s draky, začne náš velitel určitě brzy něco dělat.
			}
			else
			{
				AI_Output(self,other,"DIA_PAL_4_STANDARD_04_02");	//Ještě stále nemáme žádné zprávy od našich mužů z Hornického údolí. To je velmi znepokojivé.
			};
		};
		if(Kapitel == 5)
		{
			AI_Output(self,other,"DIA_PAL_4_STANDARD_04_03");	//Díky Innosovi! Dračí hrozba byla zažehnána. Teď už se musíme jen vypořádat s těmi skřety a cesta k rudě je volná.
		};
		if(Kapitel >= 6)
		{
			AI_Output(self,other,"DIA_PAL_4_STANDARD_04_05");	//Budeme bojovat až do hořkého konce! Nemáme už kam ustoupit.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_PAL_4_STANDARD_04_04");	//Nemám čas.
	};
};

func void B_AssignAmbientInfos_PAL_4(var C_Npc slf)
{
	dia_pal_4_exit.npc = Hlp_GetInstanceID(slf);
	dia_pal_4_join.npc = Hlp_GetInstanceID(slf);
	dia_pal_4_people.npc = Hlp_GetInstanceID(slf);
	dia_pal_4_location.npc = Hlp_GetInstanceID(slf);
	dia_pal_4_standard.npc = Hlp_GetInstanceID(slf);
};

