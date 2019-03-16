
instance DIA_PAL_12_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_PAL_12_EXIT_Condition;
	information = DIA_PAL_12_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_PAL_12_EXIT_Condition()
{
	return TRUE;
};

func void DIA_PAL_12_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_12_JOIN(C_Info)
{
	nr = 4;
	condition = DIA_PAL_12_JOIN_Condition;
	information = DIA_PAL_12_JOIN_Info;
	permanent = TRUE;
	description = "Chci se stát paladinem!";
};


func int DIA_PAL_12_JOIN_Condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_PAL_12_JOIN_Info()
{
	AI_Output(other,self,"DIA_PAL_12_JOIN_15_00");	//Chci se stát paladinem!
	AI_Output(self,other,"DIA_PAL_12_JOIN_12_01");	//Ty? Nenech se vysmát! Ještě nejsi ani členem městských stráží.
	AI_Output(self,other,"DIA_PAL_12_JOIN_12_02");	//Kdybych neviděl, jakej jseš tupej buran, musel bych si myslet, že ses mě pokusil urazit.
	AI_Output(self,other,"DIA_PAL_12_JOIN_12_03");	//Pouze ti nejlepší z nejlepších věrných následovníků krále a našeho Pána Innose se mohou stát paladiny.
};


instance DIA_PAL_12_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_PAL_12_PEOPLE_Condition;
	information = DIA_PAL_12_PEOPLE_Info;
	permanent = TRUE;
	description = "Kdo tomu tady velí?";
};


func int DIA_PAL_12_PEOPLE_Condition()
{
	if(other.guild != GIL_PAL)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_PAL_12_PEOPLE_Info()
{
	AI_Output(other,self,"DIA_PAL_12_PEOPLE_15_00");	//Kdo tomu tady velí?
	AI_Output(self,other,"DIA_PAL_12_PEOPLE_12_01");	//Ctihodný lord Hagen. Ale vše, co se týká prostého lidu, má na starosti lord Andre.
	AI_Output(self,other,"DIA_PAL_12_PEOPLE_12_02");	//Najdeš ho v kasárnách. Možná budeš mít štěstí a věnuje ti pár minut svého drahocenného času.
};


instance DIA_PAL_12_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_PAL_12_LOCATION_Condition;
	information = DIA_PAL_12_LOCATION_Info;
	permanent = TRUE;
	description = "Co děláte vy, paladinové, tady v Khorinisu?";
};


func int DIA_PAL_12_LOCATION_Condition()
{
	if(Kapitel == 1)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_PAL_12_LOCATION_Info()
{
	AI_Output(other,self,"DIA_PAL_12_LOCATION_15_00");	//Co děláte vy, paladinové, tady v Khorinisu?
	AI_Output(self,other,"DIA_PAL_12_LOCATION_12_01");	//Lidi, co mají takovéhle otázky, většinou skončí na šibenici dřív, než si toho stačí všimnout.
	AI_Output(self,other,"DIA_PAL_12_LOCATION_12_02");	//Pokud si lord Andre nemůže něco dovolit, tak vědomí toho, že naše mise byla vyzrazena.
	AI_Output(self,other,"DIA_PAL_12_LOCATION_12_03");	//No, měl by sis dávat větší pozor, na co se ptáš.
};


instance DIA_PAL_12_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_PAL_12_STANDARD_Condition;
	information = DIA_PAL_12_STANDARD_Info;
	permanent = TRUE;
	description = "Jak se vede?";
};


func int DIA_PAL_12_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_PAL_12_STANDARD_Info()
{
	AI_Output(other,self,"DIA_PAL_12_STANDARD_15_00");	//Jak se vede?
	if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
	{
		if(Kapitel <= 4)
		{
			if(MIS_OLDWORLD == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_PAL_12_STANDARD_12_01");	//Teď když víme, že máme co do činění s draky, začne náš velitel určitě brzy něco dělat.
			}
			else
			{
				AI_Output(self,other,"DIA_PAL_12_STANDARD_12_02");	//Ještě stále nemáme žádné zprávy od našich mužů z Hornického údolí. To je velmi znepokojivé.
			};
		};
		if(Kapitel == 5)
		{
			AI_Output(self,other,"DIA_PAL_12_STANDARZ_12_03");	//Díky Innosovi! Dračí hrozba byla zažehnána. Teď už se musíme jen vypořádat s těmi skřety a cesta k rudě je volná.
		};
		if(Kapitel >= 6)
		{
			AI_Output(self,other,"DIA_PAL_12_STANDARD_12_05");	//Musíš se ptát? Chlapče, koukni se kolem sebe!
		};
	}
	else
	{
		AI_Output(self,other,"DIA_PAL_12_STANDARD_12_04");	//Ty ve skutečnosti nechceš, abych ti na tu otázku odpověděl, hochu!
	};
};

func void B_AssignAmbientInfos_PAL_12(var C_Npc slf)
{
	dia_pal_12_exit.npc = Hlp_GetInstanceID(slf);
	dia_pal_12_join.npc = Hlp_GetInstanceID(slf);
	dia_pal_12_people.npc = Hlp_GetInstanceID(slf);
	dia_pal_12_location.npc = Hlp_GetInstanceID(slf);
	dia_pal_12_standard.npc = Hlp_GetInstanceID(slf);
};

