
instance DIA_OUT_7_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_OUT_7_EXIT_Condition;
	information = DIA_OUT_7_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_OUT_7_EXIT_Condition()
{
	return TRUE;
};

func void DIA_OUT_7_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_OUT_7_STANDARD(C_Info)
{
	nr = 2;
	condition = DIA_OUT_7_STANDARD_Condition;
	information = DIA_OUT_7_STANDARD_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_OUT_7_STANDARD_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_OUT_7_STANDARD_Info()
{
	var int randy;
	randy = Hlp_Random(3);
	if(randy == 0)
	{
		AI_Output(self,other,"DIA_OUT_7_STANDARD_07_00");	//Poslední dobou je to tu čím dál tím nebezpečnější. A polní škůdci se stali opravdovou pohromou.
	};
	if(randy == 1)
	{
		AI_Output(self,other,"DIA_OUT_7_STANDARD_07_01");	//Musíme městu zaplatit daně. Když to neuděláme, budeme mít pořádné problémy s paladiny.
	};
	if(randy == 2)
	{
		AI_Output(self,other,"DIA_OUT_7_STANDARD_07_02");	//Onarova vzpoura bude mít vážné následky. Raději bych se do toho nepletl.
	};
	AI_StopProcessInfos(self);
};

func void B_AssignAmbientInfos_OUT_7(var C_Npc slf)
{
	dia_out_7_exit.npc = Hlp_GetInstanceID(slf);
	dia_out_7_standard.npc = Hlp_GetInstanceID(slf);
};

