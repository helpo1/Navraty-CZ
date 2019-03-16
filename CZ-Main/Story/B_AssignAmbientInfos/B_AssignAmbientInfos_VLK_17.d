
instance DIA_VLK_17_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_VLK_17_EXIT_Condition;
	information = DIA_VLK_17_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_VLK_17_EXIT_Condition()
{
	return TRUE;
};

func void DIA_VLK_17_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_VLK_17_JOIN(C_Info)
{
	nr = 4;
	condition = DIA_VLK_17_JOIN_Condition;
	information = DIA_VLK_17_JOIN_Info;
	permanent = TRUE;
	description = "Co musím udělat, abych se mohl stát občanem města?";
};


func int DIA_VLK_17_JOIN_Condition()
{
	if((hero.guild == GIL_NONE) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_VLK_17_JOIN_Info()
{
	AI_Output(other,self,"DIA_VLK_17_JOIN_15_00");	//Co musím udělat, abych se mohl stát občanem města?
	AI_Output(self,other,"DIA_VLK_17_JOIN_17_01");	//Mistři řemeslníci z dolní čtvrti mají v Khorinisu velký vliv. Měl by sis promluvit s jedním z nich.
};


instance DIA_VLK_17_PEOPLE(C_Info)
{
	nr = 3;
	condition = DIA_VLK_17_PEOPLE_Condition;
	information = DIA_VLK_17_PEOPLE_Info;
	permanent = TRUE;
	description = "Kdo v tomhle městě požívá největší vážnosti?";
};


func int DIA_VLK_17_PEOPLE_Condition()
{
	return TRUE;
};

func void DIA_VLK_17_PEOPLE_Info()
{
	AI_Output(other,self,"DIA_VLK_17_PEOPLE_15_00");	//Kdo v tomhle městě požívá největší vážnosti?
	AI_Output(self,other,"DIA_VLK_17_PEOPLE_17_01");	//Od té doby co sem přišli paladinové, jsou to oni, kdo převzal kontrolu nad celým městem.
	AI_Output(self,other,"DIA_VLK_17_PEOPLE_17_02");	//Lord Andre tu představuje zákon. Najdeš ho v kasárnách.
	AI_Output(self,other,"DIA_VLK_17_PEOPLE_17_03");	//Ale smysl k němu má chodit jen tehdy, pokud se dostaneš do konfliktu se zákonem nebo se budeš chtít přidat k domobraně.
};


instance DIA_VLK_17_LOCATION(C_Info)
{
	nr = 2;
	condition = DIA_VLK_17_LOCATION_Condition;
	information = DIA_VLK_17_LOCATION_Info;
	permanent = TRUE;
	description = "Co je tady v Khorinisu nejzajímavější?";
};


func int DIA_VLK_17_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_VLK_17_LOCATION_Info()
{
	AI_Output(other,self,"DIA_VLK_17_LOCATION_15_00");	//Co je tady v Khorinisu nejzajímavější?
	AI_Output(self,other,"DIA_VLK_17_LOCATION_17_01");	//(smích) Možná by ses na to měl raději zeptat nějakého chlapa. Pokud máš na mysli zábavu, zkus se podívat do přístavu.
	AI_Output(self,other,"DIA_VLK_17_LOCATION_17_02");	//Ale pokud chceš něco koupit, zajdi na tržiště u východní brány nebo do dolní čtvrti.
};


instance DIA_VLK_17_STANDARD(C_Info)
{
	nr = 1;
	condition = DIA_VLK_17_STANDARD_Condition;
	information = DIA_VLK_17_STANDARD_Info;
	permanent = TRUE;
	description = "Co je nového?";
};


func int DIA_VLK_17_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_VLK_17_STANDARD_Info()
{
	AI_Output(other,self,"DIA_VLK_17_STANDARD_15_00");	//Co je nového?
	if((Kapitel == 1) || (Kapitel == 2))
	{
		AI_Output(self,other,"DIA_VLK_17_STANDARD_17_01");	//Zajímalo by mě, proč tady ti paladinové vůbec jsou. Zabrali radnici, kasárna i přístav, ale doposud neudělali ještě nic užitečného.
		AI_Output(self,other,"DIA_VLK_17_STANDARD_17_02");	//Kdyby tady byli kvůli skřetům nebo banditům, už by s tím něco udělali před jakou dobou. Musí mít ještě nějaký jiný důvod.
	};
	if(Kapitel == 3)
	{
		AI_Output(self,other,"DIA_VLK_17_STANDARD_17_03");	//Už mi došlo, proč tady ti paladinové jsou - nejspíš jen kvůli rudě. Udělali by líp, kdyby místo toho raději bránili naše město.
	};
	if(Kapitel == 4)
	{
		AI_Output(self,other,"DIA_VLK_17_STANDARD_17_04");	//Doufám, že je něco pravdy na těch povídačkách o dracích. Pak lord Hagen nebude mít jinou možnost, než s tím něco konečně dělat. Nemůže nás tu jen tak nechat na pospas drakům.
	};
	if(Kapitel == 5)
	{
		AI_Output(self,other,"DIA_VLK_17_STANDARD_17_05");	//Teď, když jsou ti draci mrtví, zatočí paladinové snadno i ostatním neřádstvem.
	};
	if(Kapitel >= 6)
	{
		AI_Output(self,other,"DIA_VLK_17_STANDARD_17_06");	//Ten masakr ve městě, co skřeti provedli - ještě teď mě to děsí ve snech! Bože, opravdu tady musíme všichni umřít?
	};
};

func void B_AssignAmbientInfos_VLK_17(var C_Npc slf)
{
	dia_vlk_17_exit.npc = Hlp_GetInstanceID(slf);
	dia_vlk_17_join.npc = Hlp_GetInstanceID(slf);
	dia_vlk_17_people.npc = Hlp_GetInstanceID(slf);
	dia_vlk_17_location.npc = Hlp_GetInstanceID(slf);
	dia_vlk_17_standard.npc = Hlp_GetInstanceID(slf);
};

