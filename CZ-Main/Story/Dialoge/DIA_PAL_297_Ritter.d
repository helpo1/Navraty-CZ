
instance DIA_PAL_297_EXIT(C_Info)
{
	npc = PAL_297_Ritter;
	nr = 999;
	condition = DIA_PAL_297_EXIT_Condition;
	information = DIA_PAL_297_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_PAL_297_EXIT_Condition()
{
	return TRUE;
};

func void DIA_PAL_297_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_297_TRESPAS(C_Info)
{
	npc = PAL_297_Ritter;
	nr = 2;
	condition = DIA_PAL_297_TRESPAS_Condition;
	information = DIA_PAL_297_TRESPAS_Info;
	permanent = TRUE;
	description = "Jak se vede?";
};


func int DIA_PAL_297_TRESPAS_Condition()
{
	return TRUE;
};

func void DIA_PAL_297_TRESPAS_Info()
{
	AI_Output(other,self,"DIA_PAL_297_TRESPAS_15_00");	//Jak se vede?
	if(Kapitel == 1)
	{
		AI_Output(self,other,"DIA_PAL_297_TRESPAS_04_01");	//Tato oblast je velmi nebezpečná - měl bys raději odejít, než se ti něco stane.
	}
	else
	{
		AI_Output(self,other,"DIA_PAL_297_TRESPAS_04_02");	//Jsi velice odvážný, pokud chceš jít do Hornického údolí. Jen si sebou nezapomeň vzít dost léčivých lektvarů.
	};
};


instance DIA_Addon_PAL_297_Rangerbandits(C_Info)
{
	npc = PAL_297_Ritter;
	nr = 5;
	condition = DIA_Addon_PAL_297_Rangerbandits_Condition;
	information = DIA_Addon_PAL_297_Rangerbandits_Info;
	description = "Prošli tudy nedávno banditi?";
};


func int DIA_Addon_PAL_297_Rangerbandits_Condition()
{
	if(MIS_Vatras_FindTheBanditTrader == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_PAL_297_Rangerbandits_Info()
{
	AI_Output(other,self,"DIA_Addon_PAL_297_Rangerbandits_15_00");	//Prošli tudy nedávno banditi?
	AI_Output(self,other,"DIA_Addon_PAL_297_Rangerbandits_04_01");	//Nevím, o čem mluvíš. Od té doby, co jsme na stráži, tudy neprošel nikdo. A už vůbec ne nějací banditi.
	AI_Output(self,other,"DIA_Addon_PAL_297_Rangerbandits_04_02");	//Zeptej se rolníků. Možná něco viděli oni.
};

