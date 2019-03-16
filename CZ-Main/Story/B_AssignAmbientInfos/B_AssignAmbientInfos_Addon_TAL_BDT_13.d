
instance DIA_Addon_TAL_BDT_13_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_Addon_TAL_BDT_13_EXIT_Condition;
	information = DIA_Addon_TAL_BDT_13_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_TAL_BDT_13_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_TAL_BDT_13_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_TAL_BDT_13_Hi(C_Info)
{
	nr = 2;
	condition = DIA_Addon_TAL_BDT_13_Hi_Condition;
	information = DIA_Addon_TAL_BDT_13_Hi_Info;
	permanent = TRUE;
	description = "Jak se vede?";
};


func int DIA_Addon_TAL_BDT_13_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_TAL_BDT_13_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_TAL_BDT_13_Hi_15_00");	//Jak se vede?
	AI_Output(self,other,"DIA_Addon_TAL_BDT_13_Hi_13_01");	//Buď tě sežere nějaká potvora, nebo tě sežere nějaká potvora.
	AI_Output(self,other,"DIA_Addon_TAL_BDT_13_Hi_13_02");	//Tahle bažina bude naše smrt...
};


instance DIA_Addon_TAL_BDT_13_Tal(C_Info)
{
	nr = 3;
	condition = DIA_Addon_TAL_BDT_13_Tal_Condition;
	information = DIA_Addon_TAL_BDT_13_Tal_Info;
	permanent = TRUE;
	description = "Co bys mi řekl o tomhle údolí?";
};


func int DIA_Addon_TAL_BDT_13_Tal_Condition()
{
	return TRUE;
};

func void DIA_Addon_TAL_BDT_13_Tal_Info()
{
	AI_Output(other,self,"DIA_Addon_TAL_BDT_13_Tal_15_00");	//Co bys mi řekl o tomhle údolí?
	AI_Output(self,other,"DIA_Addon_TAL_BDT_13_Tal_13_01");	//Je tu spousta starejch krámů. Raven nám nakázal, abychom to nakupili všecko na jednu hromadu.
	AI_Output(self,other,"DIA_Addon_TAL_BDT_13_Tal_13_02");	//Netuším, co s tím chce dělat, ale nikdo, kdo má všech pět pohromadě, by pro pár starejch šutrů neriskoval krk.
};


instance DIA_Addon_TAL_BDT_13_News(C_Info)
{
	nr = 4;
	condition = DIA_Addon_TAL_BDT_13_News_Condition;
	information = DIA_Addon_TAL_BDT_13_News_Info;
	permanent = TRUE;
	description = "Co je nového?";
};


func int DIA_Addon_TAL_BDT_13_News_Condition()
{
	return TRUE;
};

func void DIA_Addon_TAL_BDT_13_News_Info()
{
	AI_Output(other,self,"DIA_Addon_TAL_BDT_13_News_15_00");	//Co je nového?
	AI_Output(self,other,"DIA_Addon_TAL_BDT_13_News_13_01");	//Pěkně ty piráty vodíme za nos.
	AI_Output(self,other,"DIA_Addon_TAL_BDT_13_News_13_02");	//Zásobujou nás vězněma, ale od nás neviděli ještě ani vindru. Nedivím se, že jsou nakrknutý.
	if(BDT_13_einmal == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_TAL_BDT_13_News_13_03");	//Co můžou udělat? Zaútočit na tábor? (smích) HAHAHA.
		BDT_13_einmal = TRUE;
	};
};

func void B_AssignAmbientInfos_Addon_TAL_BDT_13(var C_Npc slf)
{
	DIA_Addon_TAL_BDT_13_EXIT.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_TAL_BDT_13_Hi.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_TAL_BDT_13_Tal.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_TAL_BDT_13_News.npc = Hlp_GetInstanceID(slf);
};

