
instance DIA_PAL_270_EXIT(C_Info)
{
	npc = PAL_270_Ritter;
	nr = 999;
	condition = DIA_PAL_270_EXIT_Condition;
	information = DIA_PAL_270_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_PAL_270_EXIT_Condition()
{
	return TRUE;
};

func void DIA_PAL_270_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Ritter_OUT(C_Info)
{
	npc = PAL_270_Ritter;
	condition = DIA_Ritter_OUT_Condition;
	information = DIA_Ritter_OUT_Info;
	important = TRUE;
	permanent = TRUE;
};


var int DIA_Ritter_OUT_NoPerm;

func int DIA_Ritter_OUT_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Ritter_OUT_Info()
{
	if(DIA_Ritter_OUT_NoPerm == FALSE)
	{
		AI_Output(self,other,"DIA_Ritter_OUT_06_00");	//Přišel jsi z Khorinisu že? Až to skončí, také se tam vrátím.
		DIA_Ritter_OUT_NoPerm = TRUE;
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Ritter_OUT_06_01");	//Jsem rád, že tu jsi.
	}
	else
	{
		AI_Output(self,other,"DIA_Ritter_OUT_06_02");	//Musíme si pospíšit. Dostaneme rudu do Khorinisu a budou nás nosit na rukách.
	};
};

