
func int b_assignetluconditions(var C_Npc wache)
{
	if((PALADINATTACK == FALSE) && (Npc_RefuseTalk(self) == FALSE) && (other.guild < GIL_SEPERATOR_HUM) && (PLAYERISTRANSFER == TRUE))
	{
		return TRUE;
	};
	return FALSE;
};

func void b_assignetlutalk(var C_Npc wache)
{
	var int randy;
	randy = Hlp_Random(125);

	if(randy > ATR_INTELLECT)
	{
		if(PALADINWARNING > 4)
		{
			B_Say(self,other,"$ALARM");
			PALADINATTACK = TRUE;
		}
		else if(PALADINWARNING > 3)
		{
			AI_Output(self,other,"DIA_SIPAL_WARNING_01_00");	//Salentine! (hrozivě) Pokud nevypadneš budeme tě muset zabít!
			AI_Output(self,other,"DIA_SIPAL_WARNING_01_01");	//Nenuť nás k tomu...
			PALADINWARNING = PALADINWARNING + 1;
		}
		else if(PALADINWARNING > 2)
		{
			AI_Output(self,other,"DIA_SIPAL_WARNING_01_02");	//Co potřebuješ? Víš že zde nemůžeš dlouho zůstat!
			AI_Output(self,other,"DIA_SIPAL_WARNING_01_03");	//Takže, nezkoušej naši trpělivost a okamžiť opusťte tábor.
			PALADINWARNING = PALADINWARNING + 1;
		}
		else if(PALADINWARNING > 1)
		{
			AI_Output(self,other,"DIA_SIPAL_WARNING_01_04");	//Co tady pohledáváš? (rozlobeně)
			AI_Output(self,other,"DIA_SIPAL_WARNING_01_05");	//Vrať se do své podělané chatrče a neotravuj.
			PALADINWARNING = PALADINWARNING + 1;
		}
		else if(PALADINWARNING > 0)
		{
			AI_Output(self,other,"DIA_SIPAL_WARNING_01_06");	//Salentine, co tady hledáš? (vážně)
			AI_Output(self,other,"DIA_SIPAL_WARNING_01_07");	//Raději jdi chytat ryby.
			PALADINWARNING = PALADINWARNING + 1;
		}
		else
		{
			AI_Output(self,other,"DIA_SIPAL_WARNING_01_08");	//Salentine, přinesl jsi ryby? Pokud ano, odnes je kuchaři.
			AI_Output(self,other,"DIA_SIPAL_WARNING_01_09");	//Ale nezůstávej dlouho v táboře, znáš pravidla.
			PALADINWARNING = PALADINWARNING + 1;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_SIPAL_WARNING_01_10");	//Salentine! Co tu hledáš?
		AI_Output(self,other,"DIA_SIPAL_WARNING_01_11");	//Měl by ses vrátit do své chatrče!
	};
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(pal_6050_ritter,45);
	Npc_SetRefuseTalk(pal_6051_ritter,45);
	Npc_SetRefuseTalk(pal_6052_ritter,45);
	Npc_SetRefuseTalk(pal_6053_ritter,45);
	Npc_SetRefuseTalk(pal_6054_ritter,45);
	Npc_SetRefuseTalk(pal_6055_ritter,45);
	Npc_SetRefuseTalk(pal_6056_ritter,45);
	Npc_SetRefuseTalk(pal_6057_ritter,45);
	Npc_SetRefuseTalk(pal_6058_ritter,45);
	Npc_SetRefuseTalk(pal_6059_ritter,45);
	Npc_SetRefuseTalk(pal_6060_ritter,45);
	Npc_SetRefuseTalk(pal_6061_ritter,45);
	Npc_SetRefuseTalk(pal_6062_ritter,45);
	Npc_SetRefuseTalk(pal_6063_ritter,45);
	Npc_SetRefuseTalk(pal_6064_ritter,45);
	Npc_SetRefuseTalk(pal_6065_ritter,45);
	Npc_SetRefuseTalk(pal_6066_ritter,45);
	Npc_SetRefuseTalk(pal_6067_ritter,45);
	Npc_SetRefuseTalk(pal_6068_ritter,45);
	Npc_SetRefuseTalk(pal_6069_ritter,45);
	Npc_SetRefuseTalk(pal_6070_ritter,45);
	Npc_SetRefuseTalk(pal_6071_ritter,45);
	Npc_SetRefuseTalk(pal_6072_ritter,45);
	Npc_SetRefuseTalk(pal_6073_ritter,45);
	Npc_SetRefuseTalk(pal_6074_ritter,45);
	Npc_SetRefuseTalk(pal_6075_ritter,45);
	Npc_SetRefuseTalk(pal_6076_ritter,45);
	Npc_SetRefuseTalk(pal_6077_ritter,45);
	Npc_SetRefuseTalk(pal_6078_ritter,45);
	Npc_SetRefuseTalk(pal_6079_ritter,45);
	Npc_SetRefuseTalk(pal_6080_ritter,45);
	Npc_SetRefuseTalk(pal_6081_ritter,45);
	Npc_SetRefuseTalk(pal_6082_ritter,45);
	Npc_SetRefuseTalk(pal_6083_ritter,45);
	Npc_SetRefuseTalk(pal_6084_ritter,45);
	Npc_SetRefuseTalk(pal_6085_ritter,45);
	Npc_SetRefuseTalk(pal_6086_ritter,45);
	Npc_SetRefuseTalk(pal_6087_ritter,45);
	Npc_SetRefuseTalk(pal_6088_ritter,45);
	Npc_SetRefuseTalk(pal_6089_ritter,45);
	Npc_SetRefuseTalk(pal_6090_ritter,45);
	Npc_SetRefuseTalk(pal_6091_ritter,45);
	Npc_SetRefuseTalk(pal_6092_ritter,45);
	Npc_SetRefuseTalk(pal_6093_ritter,45);
	Npc_SetRefuseTalk(pal_6094_ritter,45);
	Npc_SetRefuseTalk(pal_6095_ritter,45);
	Npc_SetRefuseTalk(pal_6096_ritter,45);
	Npc_SetRefuseTalk(pal_6097_ritter,45);
	Npc_SetRefuseTalk(pal_6098_ritter,45);
	Npc_SetRefuseTalk(pal_6099_ritter,45);
	Npc_SetRefuseTalk(pal_6100_ritter,45);
	Npc_SetRefuseTalk(pal_6101_ritter,45);
	Npc_SetRefuseTalk(pal_6102_ritter,45);
	Npc_SetRefuseTalk(pal_6103_ritter,45);
	Npc_SetRefuseTalk(pal_6104_ritter,45);
	Npc_SetRefuseTalk(pal_6105_ritter,45);
	Npc_SetRefuseTalk(pal_6106_ritter,45);
	Npc_SetRefuseTalk(pal_6107_ritter,45);

	if(PALADINATTACK == TRUE)
	{
		B_Attack(self,other,AR_GuardCalledToKill,0);
	};
};


instance DIA_PAL_6050_RITTER_EXIT(C_Info)
{
	npc = pal_6050_ritter;
	nr = 999;
	condition = dia_pal_6050_ritter_exit_condition;
	information = dia_pal_6050_ritter_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_6050_ritter_exit_condition()
{
	return TRUE;
};

func void dia_pal_6050_ritter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_6050_RITTER_WARNING(C_Info)
{
	npc = pal_6050_ritter;
	nr = 1;
	condition = dia_pal_6050_ritter_warning_condition;
	information = dia_pal_6050_ritter_warning_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_pal_6050_ritter_warning_condition()
{
	return b_assignetluconditions(self);
};

func void dia_pal_6050_ritter_warning_info()
{
	b_assignetlutalk(self);
};


instance DIA_PAL_6051_RITTER_EXIT(C_Info)
{
	npc = pal_6051_ritter;
	nr = 999;
	condition = dia_pal_6051_ritter_exit_condition;
	information = dia_pal_6051_ritter_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_6051_ritter_exit_condition()
{
	return TRUE;
};

func void dia_pal_6051_ritter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_6051_RITTER_WARNING(C_Info)
{
	npc = pal_6051_ritter;
	nr = 1;
	condition = dia_pal_6051_ritter_warning_condition;
	information = dia_pal_6051_ritter_warning_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_pal_6051_ritter_warning_condition()
{
	return b_assignetluconditions(self);
};

func void dia_pal_6051_ritter_warning_info()
{
	b_assignetlutalk(self);
};


instance DIA_PAL_6052_RITTER_EXIT(C_Info)
{
	npc = pal_6052_ritter;
	nr = 999;
	condition = dia_pal_6052_ritter_exit_condition;
	information = dia_pal_6052_ritter_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_6052_ritter_exit_condition()
{
	return TRUE;
};

func void dia_pal_6052_ritter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_6052_RITTER_WARNING(C_Info)
{
	npc = pal_6052_ritter;
	nr = 1;
	condition = dia_pal_6052_ritter_warning_condition;
	information = dia_pal_6052_ritter_warning_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_pal_6052_ritter_warning_condition()
{
	return b_assignetluconditions(self);
};

func void dia_pal_6052_ritter_warning_info()
{
	b_assignetlutalk(self);
};


instance DIA_PAL_6053_RITTER_EXIT(C_Info)
{
	npc = pal_6053_ritter;
	nr = 999;
	condition = dia_pal_6053_ritter_exit_condition;
	information = dia_pal_6053_ritter_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_6053_ritter_exit_condition()
{
	return TRUE;
};

func void dia_pal_6053_ritter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_6053_RITTER_WARNING(C_Info)
{
	npc = pal_6053_ritter;
	nr = 1;
	condition = dia_pal_6053_ritter_warning_condition;
	information = dia_pal_6053_ritter_warning_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_pal_6053_ritter_warning_condition()
{
	return b_assignetluconditions(self);
};

func void dia_pal_6053_ritter_warning_info()
{
	b_assignetlutalk(self);
};


instance DIA_PAL_6054_RITTER_EXIT(C_Info)
{
	npc = pal_6054_ritter;
	nr = 999;
	condition = dia_pal_6054_ritter_exit_condition;
	information = dia_pal_6054_ritter_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_6054_ritter_exit_condition()
{
	return TRUE;
};

func void dia_pal_6054_ritter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_6054_RITTER_WARNING(C_Info)
{
	npc = pal_6054_ritter;
	nr = 1;
	condition = dia_pal_6054_ritter_warning_condition;
	information = dia_pal_6054_ritter_warning_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_pal_6054_ritter_warning_condition()
{
	return b_assignetluconditions(self);
};

func void dia_pal_6054_ritter_warning_info()
{
	b_assignetlutalk(self);
};


instance DIA_PAL_6055_RITTER_EXIT(C_Info)
{
	npc = pal_6055_ritter;
	nr = 999;
	condition = dia_pal_6055_ritter_exit_condition;
	information = dia_pal_6055_ritter_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_6055_ritter_exit_condition()
{
	return TRUE;
};

func void dia_pal_6055_ritter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_6055_RITTER_WARNING(C_Info)
{
	npc = pal_6055_ritter;
	nr = 1;
	condition = dia_pal_6055_ritter_warning_condition;
	information = dia_pal_6055_ritter_warning_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_pal_6055_ritter_warning_condition()
{
	return b_assignetluconditions(self);
};

func void dia_pal_6055_ritter_warning_info()
{
	b_assignetlutalk(self);
};


instance DIA_PAL_6056_RITTER_EXIT(C_Info)
{
	npc = pal_6056_ritter;
	nr = 999;
	condition = dia_pal_6056_ritter_exit_condition;
	information = dia_pal_6056_ritter_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_6056_ritter_exit_condition()
{
	return TRUE;
};

func void dia_pal_6056_ritter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_6056_RITTER_WARNING(C_Info)
{
	npc = pal_6056_ritter;
	nr = 1;
	condition = dia_pal_6056_ritter_warning_condition;
	information = dia_pal_6056_ritter_warning_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_pal_6056_ritter_warning_condition()
{
	return b_assignetluconditions(self);
};

func void dia_pal_6056_ritter_warning_info()
{
	b_assignetlutalk(self);
};


instance DIA_PAL_6057_RITTER_EXIT(C_Info)
{
	npc = pal_6057_ritter;
	nr = 999;
	condition = dia_pal_6057_ritter_exit_condition;
	information = dia_pal_6057_ritter_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_6057_ritter_exit_condition()
{
	return TRUE;
};

func void dia_pal_6057_ritter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_6057_RITTER_WARNING(C_Info)
{
	npc = pal_6057_ritter;
	nr = 1;
	condition = dia_pal_6057_ritter_warning_condition;
	information = dia_pal_6057_ritter_warning_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_pal_6057_ritter_warning_condition()
{
	return b_assignetluconditions(self);
};

func void dia_pal_6057_ritter_warning_info()
{
	b_assignetlutalk(self);
};


instance DIA_PAL_6058_RITTER_EXIT(C_Info)
{
	npc = pal_6058_ritter;
	nr = 999;
	condition = dia_pal_6058_ritter_exit_condition;
	information = dia_pal_6058_ritter_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_6058_ritter_exit_condition()
{
	return TRUE;
};

func void dia_pal_6058_ritter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_6058_RITTER_WARNING(C_Info)
{
	npc = pal_6058_ritter;
	nr = 1;
	condition = dia_pal_6058_ritter_warning_condition;
	information = dia_pal_6058_ritter_warning_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_pal_6058_ritter_warning_condition()
{
	return b_assignetluconditions(self);
};

func void dia_pal_6058_ritter_warning_info()
{
	b_assignetlutalk(self);
};


instance DIA_PAL_6059_RITTER_EXIT(C_Info)
{
	npc = pal_6059_ritter;
	nr = 999;
	condition = dia_pal_6059_ritter_exit_condition;
	information = dia_pal_6059_ritter_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_6059_ritter_exit_condition()
{
	return TRUE;
};

func void dia_pal_6059_ritter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_6059_RITTER_WARNING(C_Info)
{
	npc = pal_6059_ritter;
	nr = 1;
	condition = dia_pal_6059_ritter_warning_condition;
	information = dia_pal_6059_ritter_warning_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_pal_6059_ritter_warning_condition()
{
	return b_assignetluconditions(self);
};

func void dia_pal_6059_ritter_warning_info()
{
	b_assignetlutalk(self);
};


instance DIA_PAL_6060_RITTER_EXIT(C_Info)
{
	npc = pal_6060_ritter;
	nr = 999;
	condition = dia_pal_6060_ritter_exit_condition;
	information = dia_pal_6060_ritter_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_6060_ritter_exit_condition()
{
	return TRUE;
};

func void dia_pal_6060_ritter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_6060_RITTER_WARNING(C_Info)
{
	npc = pal_6060_ritter;
	nr = 1;
	condition = dia_pal_6060_ritter_warning_condition;
	information = dia_pal_6060_ritter_warning_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_pal_6060_ritter_warning_condition()
{
	return b_assignetluconditions(self);
};

func void dia_pal_6060_ritter_warning_info()
{
	b_assignetlutalk(self);
};


instance DIA_PAL_6061_RITTER_EXIT(C_Info)
{
	npc = pal_6061_ritter;
	nr = 999;
	condition = dia_pal_6061_ritter_exit_condition;
	information = dia_pal_6061_ritter_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_6061_ritter_exit_condition()
{
	return TRUE;
};

func void dia_pal_6061_ritter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_6061_RITTER_WARNING(C_Info)
{
	npc = pal_6061_ritter;
	nr = 1;
	condition = dia_pal_6061_ritter_warning_condition;
	information = dia_pal_6061_ritter_warning_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_pal_6061_ritter_warning_condition()
{
	return b_assignetluconditions(self);
};

func void dia_pal_6061_ritter_warning_info()
{
	b_assignetlutalk(self);
};


instance DIA_PAL_6062_RITTER_EXIT(C_Info)
{
	npc = pal_6062_ritter;
	nr = 999;
	condition = dia_pal_6062_ritter_exit_condition;
	information = dia_pal_6062_ritter_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_6062_ritter_exit_condition()
{
	return TRUE;
};

func void dia_pal_6062_ritter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_6062_RITTER_WARNING(C_Info)
{
	npc = pal_6062_ritter;
	nr = 1;
	condition = dia_pal_6062_ritter_warning_condition;
	information = dia_pal_6062_ritter_warning_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_pal_6062_ritter_warning_condition()
{
	return b_assignetluconditions(self);
};

func void dia_pal_6062_ritter_warning_info()
{
	b_assignetlutalk(self);
};


instance DIA_PAL_6063_RITTER_EXIT(C_Info)
{
	npc = pal_6063_ritter;
	nr = 999;
	condition = dia_pal_6063_ritter_exit_condition;
	information = dia_pal_6063_ritter_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_6063_ritter_exit_condition()
{
	return TRUE;
};

func void dia_pal_6063_ritter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_6063_RITTER_WARNING(C_Info)
{
	npc = pal_6063_ritter;
	nr = 1;
	condition = dia_pal_6063_ritter_warning_condition;
	information = dia_pal_6063_ritter_warning_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_pal_6063_ritter_warning_condition()
{
	return b_assignetluconditions(self);
};

func void dia_pal_6063_ritter_warning_info()
{
	b_assignetlutalk(self);
};


instance DIA_PAL_6064_RITTER_EXIT(C_Info)
{
	npc = pal_6064_ritter;
	nr = 999;
	condition = dia_pal_6064_ritter_exit_condition;
	information = dia_pal_6064_ritter_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_6064_ritter_exit_condition()
{
	return TRUE;
};

func void dia_pal_6064_ritter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_6064_RITTER_WARNING(C_Info)
{
	npc = pal_6064_ritter;
	nr = 1;
	condition = dia_pal_6064_ritter_warning_condition;
	information = dia_pal_6064_ritter_warning_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_pal_6064_ritter_warning_condition()
{
	return b_assignetluconditions(self);
};

func void dia_pal_6064_ritter_warning_info()
{
	b_assignetlutalk(self);
};


instance DIA_PAL_6065_RITTER_EXIT(C_Info)
{
	npc = pal_6065_ritter;
	nr = 999;
	condition = dia_pal_6065_ritter_exit_condition;
	information = dia_pal_6065_ritter_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_6065_ritter_exit_condition()
{
	return TRUE;
};

func void dia_pal_6065_ritter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_6065_RITTER_WARNING(C_Info)
{
	npc = pal_6065_ritter;
	nr = 1;
	condition = dia_pal_6065_ritter_warning_condition;
	information = dia_pal_6065_ritter_warning_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_pal_6065_ritter_warning_condition()
{
	return b_assignetluconditions(self);
};

func void dia_pal_6065_ritter_warning_info()
{
	b_assignetlutalk(self);
};


instance DIA_PAL_6066_RITTER_EXIT(C_Info)
{
	npc = pal_6066_ritter;
	nr = 999;
	condition = dia_pal_6066_ritter_exit_condition;
	information = dia_pal_6066_ritter_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_6066_ritter_exit_condition()
{
	return TRUE;
};

func void dia_pal_6066_ritter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_6066_RITTER_WARNING(C_Info)
{
	npc = pal_6066_ritter;
	nr = 1;
	condition = dia_pal_6066_ritter_warning_condition;
	information = dia_pal_6066_ritter_warning_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_pal_6066_ritter_warning_condition()
{
	return b_assignetluconditions(self);
};

func void dia_pal_6066_ritter_warning_info()
{
	b_assignetlutalk(self);
};


instance DIA_PAL_6067_RITTER_EXIT(C_Info)
{
	npc = pal_6067_ritter;
	nr = 999;
	condition = dia_pal_6067_ritter_exit_condition;
	information = dia_pal_6067_ritter_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_6067_ritter_exit_condition()
{
	return TRUE;
};

func void dia_pal_6067_ritter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_6067_RITTER_WARNING(C_Info)
{
	npc = pal_6067_ritter;
	nr = 1;
	condition = dia_pal_6067_ritter_warning_condition;
	information = dia_pal_6067_ritter_warning_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_pal_6067_ritter_warning_condition()
{
	return b_assignetluconditions(self);
};

func void dia_pal_6067_ritter_warning_info()
{
	b_assignetlutalk(self);
};


instance DIA_PAL_6068_RITTER_EXIT(C_Info)
{
	npc = pal_6068_ritter;
	nr = 999;
	condition = dia_pal_6068_ritter_exit_condition;
	information = dia_pal_6068_ritter_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_6068_ritter_exit_condition()
{
	return TRUE;
};

func void dia_pal_6068_ritter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_6068_RITTER_WARNING(C_Info)
{
	npc = pal_6068_ritter;
	nr = 1;
	condition = dia_pal_6068_ritter_warning_condition;
	information = dia_pal_6068_ritter_warning_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_pal_6068_ritter_warning_condition()
{
	return b_assignetluconditions(self);
};

func void dia_pal_6068_ritter_warning_info()
{
	b_assignetlutalk(self);
};


instance DIA_PAL_6069_RITTER_EXIT(C_Info)
{
	npc = pal_6069_ritter;
	nr = 999;
	condition = dia_pal_6069_ritter_exit_condition;
	information = dia_pal_6069_ritter_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_6069_ritter_exit_condition()
{
	return TRUE;
};

func void dia_pal_6069_ritter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_6069_RITTER_WARNING(C_Info)
{
	npc = pal_6069_ritter;
	nr = 1;
	condition = dia_pal_6069_ritter_warning_condition;
	information = dia_pal_6069_ritter_warning_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_pal_6069_ritter_warning_condition()
{
	return b_assignetluconditions(self);
};

func void dia_pal_6069_ritter_warning_info()
{
	b_assignetlutalk(self);
};


instance DIA_PAL_6070_RITTER_EXIT(C_Info)
{
	npc = pal_6070_ritter;
	nr = 999;
	condition = dia_pal_6070_ritter_exit_condition;
	information = dia_pal_6070_ritter_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_6070_ritter_exit_condition()
{
	return TRUE;
};

func void dia_pal_6070_ritter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_6070_RITTER_WARNING(C_Info)
{
	npc = pal_6070_ritter;
	nr = 1;
	condition = dia_pal_6070_ritter_warning_condition;
	information = dia_pal_6070_ritter_warning_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_pal_6070_ritter_warning_condition()
{
	return b_assignetluconditions(self);
};

func void dia_pal_6070_ritter_warning_info()
{
	b_assignetlutalk(self);
};


instance DIA_PAL_6071_RITTER_EXIT(C_Info)
{
	npc = pal_6071_ritter;
	nr = 999;
	condition = dia_pal_6071_ritter_exit_condition;
	information = dia_pal_6071_ritter_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_6071_ritter_exit_condition()
{
	return TRUE;
};

func void dia_pal_6071_ritter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_6071_RITTER_WARNING(C_Info)
{
	npc = pal_6071_ritter;
	nr = 1;
	condition = dia_pal_6071_ritter_warning_condition;
	information = dia_pal_6071_ritter_warning_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_pal_6071_ritter_warning_condition()
{
	return b_assignetluconditions(self);
};

func void dia_pal_6071_ritter_warning_info()
{
	b_assignetlutalk(self);
};


instance DIA_PAL_6072_RITTER_EXIT(C_Info)
{
	npc = pal_6072_ritter;
	nr = 999;
	condition = dia_pal_6072_ritter_exit_condition;
	information = dia_pal_6072_ritter_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_6072_ritter_exit_condition()
{
	return TRUE;
};

func void dia_pal_6072_ritter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_6072_RITTER_WARNING(C_Info)
{
	npc = pal_6072_ritter;
	nr = 1;
	condition = dia_pal_6072_ritter_warning_condition;
	information = dia_pal_6072_ritter_warning_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_pal_6072_ritter_warning_condition()
{
	return b_assignetluconditions(self);
};

func void dia_pal_6072_ritter_warning_info()
{
	b_assignetlutalk(self);
};


instance DIA_PAL_6073_RITTER_EXIT(C_Info)
{
	npc = pal_6073_ritter;
	nr = 999;
	condition = dia_pal_6073_ritter_exit_condition;
	information = dia_pal_6073_ritter_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_6073_ritter_exit_condition()
{
	return TRUE;
};

func void dia_pal_6073_ritter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_6073_RITTER_WARNING(C_Info)
{
	npc = pal_6073_ritter;
	nr = 1;
	condition = dia_pal_6073_ritter_warning_condition;
	information = dia_pal_6073_ritter_warning_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_pal_6073_ritter_warning_condition()
{
	return b_assignetluconditions(self);
};

func void dia_pal_6073_ritter_warning_info()
{
	b_assignetlutalk(self);
};


instance DIA_PAL_6074_RITTER_EXIT(C_Info)
{
	npc = pal_6074_ritter;
	nr = 999;
	condition = dia_pal_6074_ritter_exit_condition;
	information = dia_pal_6074_ritter_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_6074_ritter_exit_condition()
{
	return TRUE;
};

func void dia_pal_6074_ritter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_6074_RITTER_WARNING(C_Info)
{
	npc = pal_6074_ritter;
	nr = 1;
	condition = dia_pal_6074_ritter_warning_condition;
	information = dia_pal_6074_ritter_warning_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_pal_6074_ritter_warning_condition()
{
	return b_assignetluconditions(self);
};

func void dia_pal_6074_ritter_warning_info()
{
	b_assignetlutalk(self);
};


instance DIA_PAL_6075_RITTER_EXIT(C_Info)
{
	npc = pal_6075_ritter;
	nr = 999;
	condition = dia_pal_6075_ritter_exit_condition;
	information = dia_pal_6075_ritter_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_6075_ritter_exit_condition()
{
	return TRUE;
};

func void dia_pal_6075_ritter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_6075_RITTER_WARNING(C_Info)
{
	npc = pal_6075_ritter;
	nr = 1;
	condition = dia_pal_6075_ritter_warning_condition;
	information = dia_pal_6075_ritter_warning_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_pal_6075_ritter_warning_condition()
{
	return b_assignetluconditions(self);
};

func void dia_pal_6075_ritter_warning_info()
{
	b_assignetlutalk(self);
};


instance DIA_PAL_6076_RITTER_EXIT(C_Info)
{
	npc = pal_6076_ritter;
	nr = 999;
	condition = dia_pal_6076_ritter_exit_condition;
	information = dia_pal_6076_ritter_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_6076_ritter_exit_condition()
{
	return TRUE;
};

func void dia_pal_6076_ritter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_6076_RITTER_WARNING(C_Info)
{
	npc = pal_6076_ritter;
	nr = 1;
	condition = dia_pal_6076_ritter_warning_condition;
	information = dia_pal_6076_ritter_warning_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_pal_6076_ritter_warning_condition()
{
	return b_assignetluconditions(self);
};

func void dia_pal_6076_ritter_warning_info()
{
	b_assignetlutalk(self);
};


instance DIA_PAL_6077_RITTER_EXIT(C_Info)
{
	npc = pal_6077_ritter;
	nr = 999;
	condition = dia_pal_6077_ritter_exit_condition;
	information = dia_pal_6077_ritter_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_6077_ritter_exit_condition()
{
	return TRUE;
};

func void dia_pal_6077_ritter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_6077_RITTER_WARNING(C_Info)
{
	npc = pal_6077_ritter;
	nr = 1;
	condition = dia_pal_6077_ritter_warning_condition;
	information = dia_pal_6077_ritter_warning_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_pal_6077_ritter_warning_condition()
{
	return b_assignetluconditions(self);
};

func void dia_pal_6077_ritter_warning_info()
{
	b_assignetlutalk(self);
};


instance DIA_PAL_6078_RITTER_EXIT(C_Info)
{
	npc = pal_6078_ritter;
	nr = 999;
	condition = dia_pal_6078_ritter_exit_condition;
	information = dia_pal_6078_ritter_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_6078_ritter_exit_condition()
{
	return TRUE;
};

func void dia_pal_6078_ritter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_6078_RITTER_WARNING(C_Info)
{
	npc = pal_6078_ritter;
	nr = 1;
	condition = dia_pal_6078_ritter_warning_condition;
	information = dia_pal_6078_ritter_warning_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_pal_6078_ritter_warning_condition()
{
	return b_assignetluconditions(self);
};

func void dia_pal_6078_ritter_warning_info()
{
	b_assignetlutalk(self);
};


instance DIA_PAL_6079_RITTER_EXIT(C_Info)
{
	npc = pal_6079_ritter;
	nr = 999;
	condition = dia_pal_6079_ritter_exit_condition;
	information = dia_pal_6079_ritter_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_6079_ritter_exit_condition()
{
	return TRUE;
};

func void dia_pal_6079_ritter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_6079_RITTER_WARNING(C_Info)
{
	npc = pal_6079_ritter;
	nr = 1;
	condition = dia_pal_6079_ritter_warning_condition;
	information = dia_pal_6079_ritter_warning_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_pal_6079_ritter_warning_condition()
{
	return b_assignetluconditions(self);
};

func void dia_pal_6079_ritter_warning_info()
{
	b_assignetlutalk(self);
};


instance DIA_PAL_6080_RITTER_EXIT(C_Info)
{
	npc = pal_6080_ritter;
	nr = 999;
	condition = dia_pal_6080_ritter_exit_condition;
	information = dia_pal_6080_ritter_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_6080_ritter_exit_condition()
{
	return TRUE;
};

func void dia_pal_6080_ritter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_6080_RITTER_WARNING(C_Info)
{
	npc = pal_6080_ritter;
	nr = 1;
	condition = dia_pal_6080_ritter_warning_condition;
	information = dia_pal_6080_ritter_warning_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_pal_6080_ritter_warning_condition()
{
	return b_assignetluconditions(self);
};

func void dia_pal_6080_ritter_warning_info()
{
	b_assignetlutalk(self);
};


instance DIA_PAL_6081_RITTER_EXIT(C_Info)
{
	npc = pal_6081_ritter;
	nr = 999;
	condition = dia_pal_6081_ritter_exit_condition;
	information = dia_pal_6081_ritter_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_6081_ritter_exit_condition()
{
	return TRUE;
};

func void dia_pal_6081_ritter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_6081_RITTER_WARNING(C_Info)
{
	npc = pal_6081_ritter;
	nr = 1;
	condition = dia_pal_6081_ritter_warning_condition;
	information = dia_pal_6081_ritter_warning_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_pal_6081_ritter_warning_condition()
{
	return b_assignetluconditions(self);
};

func void dia_pal_6081_ritter_warning_info()
{
	b_assignetlutalk(self);
};


instance DIA_PAL_6082_RITTER_EXIT(C_Info)
{
	npc = pal_6082_ritter;
	nr = 999;
	condition = dia_pal_6082_ritter_exit_condition;
	information = dia_pal_6082_ritter_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_6082_ritter_exit_condition()
{
	return TRUE;
};

func void dia_pal_6082_ritter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_6082_RITTER_WARNING(C_Info)
{
	npc = pal_6082_ritter;
	nr = 1;
	condition = dia_pal_6082_ritter_warning_condition;
	information = dia_pal_6082_ritter_warning_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_pal_6082_ritter_warning_condition()
{
	return b_assignetluconditions(self);
};

func void dia_pal_6082_ritter_warning_info()
{
	b_assignetlutalk(self);
};


instance DIA_PAL_6083_RITTER_EXIT(C_Info)
{
	npc = pal_6083_ritter;
	nr = 999;
	condition = dia_pal_6083_ritter_exit_condition;
	information = dia_pal_6083_ritter_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_6083_ritter_exit_condition()
{
	return TRUE;
};

func void dia_pal_6083_ritter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_6083_RITTER_WARNING(C_Info)
{
	npc = pal_6083_ritter;
	nr = 1;
	condition = dia_pal_6083_ritter_warning_condition;
	information = dia_pal_6083_ritter_warning_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_pal_6083_ritter_warning_condition()
{
	return b_assignetluconditions(self);
};

func void dia_pal_6083_ritter_warning_info()
{
	b_assignetlutalk(self);
};


instance DIA_PAL_6084_RITTER_EXIT(C_Info)
{
	npc = pal_6084_ritter;
	nr = 999;
	condition = dia_pal_6084_ritter_exit_condition;
	information = dia_pal_6084_ritter_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_6084_ritter_exit_condition()
{
	return TRUE;
};

func void dia_pal_6084_ritter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_6084_RITTER_WARNING(C_Info)
{
	npc = pal_6084_ritter;
	nr = 1;
	condition = dia_pal_6084_ritter_warning_condition;
	information = dia_pal_6084_ritter_warning_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_pal_6084_ritter_warning_condition()
{
	return b_assignetluconditions(self);
};

func void dia_pal_6084_ritter_warning_info()
{
	b_assignetlutalk(self);
};


instance DIA_PAL_6085_RITTER_EXIT(C_Info)
{
	npc = pal_6085_ritter;
	nr = 999;
	condition = dia_pal_6085_ritter_exit_condition;
	information = dia_pal_6085_ritter_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_6085_ritter_exit_condition()
{
	return TRUE;
};

func void dia_pal_6085_ritter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_6085_RITTER_WARNING(C_Info)
{
	npc = pal_6085_ritter;
	nr = 1;
	condition = dia_pal_6085_ritter_warning_condition;
	information = dia_pal_6085_ritter_warning_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_pal_6085_ritter_warning_condition()
{
	return b_assignetluconditions(self);
};

func void dia_pal_6085_ritter_warning_info()
{
	b_assignetlutalk(self);
};


instance DIA_PAL_6086_RITTER_EXIT(C_Info)
{
	npc = pal_6086_ritter;
	nr = 999;
	condition = dia_pal_6086_ritter_exit_condition;
	information = dia_pal_6086_ritter_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_6086_ritter_exit_condition()
{
	return TRUE;
};

func void dia_pal_6086_ritter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_6086_RITTER_WARNING(C_Info)
{
	npc = pal_6086_ritter;
	nr = 1;
	condition = dia_pal_6086_ritter_warning_condition;
	information = dia_pal_6086_ritter_warning_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_pal_6086_ritter_warning_condition()
{
	return b_assignetluconditions(self);
};

func void dia_pal_6086_ritter_warning_info()
{
	b_assignetlutalk(self);
};


instance DIA_PAL_6087_RITTER_EXIT(C_Info)
{
	npc = pal_6087_ritter;
	nr = 999;
	condition = dia_pal_6087_ritter_exit_condition;
	information = dia_pal_6087_ritter_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_6087_ritter_exit_condition()
{
	return TRUE;
};

func void dia_pal_6087_ritter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_6087_RITTER_WARNING(C_Info)
{
	npc = pal_6087_ritter;
	nr = 1;
	condition = dia_pal_6087_ritter_warning_condition;
	information = dia_pal_6087_ritter_warning_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_pal_6087_ritter_warning_condition()
{
	return b_assignetluconditions(self);
};

func void dia_pal_6087_ritter_warning_info()
{
	b_assignetlutalk(self);
};


instance DIA_PAL_6088_RITTER_EXIT(C_Info)
{
	npc = pal_6088_ritter;
	nr = 999;
	condition = dia_pal_6088_ritter_exit_condition;
	information = dia_pal_6088_ritter_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_6088_ritter_exit_condition()
{
	return TRUE;
};

func void dia_pal_6088_ritter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_6088_RITTER_WARNING(C_Info)
{
	npc = pal_6088_ritter;
	nr = 1;
	condition = dia_pal_6088_ritter_warning_condition;
	information = dia_pal_6088_ritter_warning_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_pal_6088_ritter_warning_condition()
{
	return b_assignetluconditions(self);
};

func void dia_pal_6088_ritter_warning_info()
{
	b_assignetlutalk(self);
};


instance DIA_PAL_6089_RITTER_EXIT(C_Info)
{
	npc = pal_6089_ritter;
	nr = 999;
	condition = dia_pal_6089_ritter_exit_condition;
	information = dia_pal_6089_ritter_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_6089_ritter_exit_condition()
{
	return TRUE;
};

func void dia_pal_6089_ritter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_6089_RITTER_WARNING(C_Info)
{
	npc = pal_6089_ritter;
	nr = 1;
	condition = dia_pal_6089_ritter_warning_condition;
	information = dia_pal_6089_ritter_warning_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_pal_6089_ritter_warning_condition()
{
	return b_assignetluconditions(self);
};

func void dia_pal_6089_ritter_warning_info()
{
	b_assignetlutalk(self);
};


instance DIA_PAL_6090_RITTER_EXIT(C_Info)
{
	npc = pal_6090_ritter;
	nr = 999;
	condition = dia_pal_6090_ritter_exit_condition;
	information = dia_pal_6090_ritter_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_6090_ritter_exit_condition()
{
	return TRUE;
};

func void dia_pal_6090_ritter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_6090_RITTER_WARNING(C_Info)
{
	npc = pal_6090_ritter;
	nr = 1;
	condition = dia_pal_6090_ritter_warning_condition;
	information = dia_pal_6090_ritter_warning_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_pal_6090_ritter_warning_condition()
{
	return b_assignetluconditions(self);
};

func void dia_pal_6090_ritter_warning_info()
{
	b_assignetlutalk(self);
};


instance DIA_PAL_6091_RITTER_EXIT(C_Info)
{
	npc = pal_6091_ritter;
	nr = 999;
	condition = dia_pal_6091_ritter_exit_condition;
	information = dia_pal_6091_ritter_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_6091_ritter_exit_condition()
{
	return TRUE;
};

func void dia_pal_6091_ritter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_6091_RITTER_WARNING(C_Info)
{
	npc = pal_6091_ritter;
	nr = 1;
	condition = dia_pal_6091_ritter_warning_condition;
	information = dia_pal_6091_ritter_warning_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_pal_6091_ritter_warning_condition()
{
	return b_assignetluconditions(self);
};

func void dia_pal_6091_ritter_warning_info()
{
	b_assignetlutalk(self);
};


instance DIA_PAL_6092_RITTER_EXIT(C_Info)
{
	npc = pal_6092_ritter;
	nr = 999;
	condition = dia_pal_6092_ritter_exit_condition;
	information = dia_pal_6092_ritter_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_6092_ritter_exit_condition()
{
	return TRUE;
};

func void dia_pal_6092_ritter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_6092_RITTER_WARNING(C_Info)
{
	npc = pal_6092_ritter;
	nr = 1;
	condition = dia_pal_6092_ritter_warning_condition;
	information = dia_pal_6092_ritter_warning_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_pal_6092_ritter_warning_condition()
{
	return b_assignetluconditions(self);
};

func void dia_pal_6092_ritter_warning_info()
{
	b_assignetlutalk(self);
};


instance DIA_PAL_6093_RITTER_EXIT(C_Info)
{
	npc = pal_6093_ritter;
	nr = 999;
	condition = dia_pal_6093_ritter_exit_condition;
	information = dia_pal_6093_ritter_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_6093_ritter_exit_condition()
{
	return TRUE;
};

func void dia_pal_6093_ritter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_6093_RITTER_WARNING(C_Info)
{
	npc = pal_6093_ritter;
	nr = 1;
	condition = dia_pal_6093_ritter_warning_condition;
	information = dia_pal_6093_ritter_warning_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_pal_6093_ritter_warning_condition()
{
	return b_assignetluconditions(self);
};

func void dia_pal_6093_ritter_warning_info()
{
	b_assignetlutalk(self);
};


instance DIA_PAL_6094_RITTER_EXIT(C_Info)
{
	npc = pal_6094_ritter;
	nr = 999;
	condition = dia_pal_6094_ritter_exit_condition;
	information = dia_pal_6094_ritter_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_6094_ritter_exit_condition()
{
	return TRUE;
};

func void dia_pal_6094_ritter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_6094_RITTER_WARNING(C_Info)
{
	npc = pal_6094_ritter;
	nr = 1;
	condition = dia_pal_6094_ritter_warning_condition;
	information = dia_pal_6094_ritter_warning_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_pal_6094_ritter_warning_condition()
{
	return b_assignetluconditions(self);
};

func void dia_pal_6094_ritter_warning_info()
{
	b_assignetlutalk(self);
};


instance DIA_PAL_6095_RITTER_EXIT(C_Info)
{
	npc = pal_6095_ritter;
	nr = 999;
	condition = dia_pal_6095_ritter_exit_condition;
	information = dia_pal_6095_ritter_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_6095_ritter_exit_condition()
{
	return TRUE;
};

func void dia_pal_6095_ritter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_6095_RITTER_WARNING(C_Info)
{
	npc = pal_6095_ritter;
	nr = 1;
	condition = dia_pal_6095_ritter_warning_condition;
	information = dia_pal_6095_ritter_warning_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_pal_6095_ritter_warning_condition()
{
	return b_assignetluconditions(self);
};

func void dia_pal_6095_ritter_warning_info()
{
	b_assignetlutalk(self);
};


instance DIA_PAL_6096_RITTER_EXIT(C_Info)
{
	npc = pal_6096_ritter;
	nr = 999;
	condition = dia_pal_6096_ritter_exit_condition;
	information = dia_pal_6096_ritter_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_6096_ritter_exit_condition()
{
	return TRUE;
};

func void dia_pal_6096_ritter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_6096_RITTER_WARNING(C_Info)
{
	npc = pal_6096_ritter;
	nr = 1;
	condition = dia_pal_6096_ritter_warning_condition;
	information = dia_pal_6096_ritter_warning_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_pal_6096_ritter_warning_condition()
{
	return b_assignetluconditions(self);
};

func void dia_pal_6096_ritter_warning_info()
{
	b_assignetlutalk(self);
};


instance DIA_PAL_6097_RITTER_EXIT(C_Info)
{
	npc = pal_6097_ritter;
	nr = 999;
	condition = dia_pal_6097_ritter_exit_condition;
	information = dia_pal_6097_ritter_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_6097_ritter_exit_condition()
{
	return TRUE;
};

func void dia_pal_6097_ritter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_6097_RITTER_WARNING(C_Info)
{
	npc = pal_6097_ritter;
	nr = 1;
	condition = dia_pal_6097_ritter_warning_condition;
	information = dia_pal_6097_ritter_warning_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_pal_6097_ritter_warning_condition()
{
	return b_assignetluconditions(self);
};

func void dia_pal_6097_ritter_warning_info()
{
	b_assignetlutalk(self);
};


instance DIA_PAL_6098_RITTER_EXIT(C_Info)
{
	npc = pal_6098_ritter;
	nr = 999;
	condition = dia_pal_6098_ritter_exit_condition;
	information = dia_pal_6098_ritter_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_6098_ritter_exit_condition()
{
	return TRUE;
};

func void dia_pal_6098_ritter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_6098_RITTER_WARNING(C_Info)
{
	npc = pal_6098_ritter;
	nr = 1;
	condition = dia_pal_6098_ritter_warning_condition;
	information = dia_pal_6098_ritter_warning_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_pal_6098_ritter_warning_condition()
{
	return b_assignetluconditions(self);
};

func void dia_pal_6098_ritter_warning_info()
{
	b_assignetlutalk(self);
};


instance DIA_PAL_6099_RITTER_EXIT(C_Info)
{
	npc = pal_6099_ritter;
	nr = 999;
	condition = dia_pal_6099_ritter_exit_condition;
	information = dia_pal_6099_ritter_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_6099_ritter_exit_condition()
{
	return TRUE;
};

func void dia_pal_6099_ritter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_6099_RITTER_WARNING(C_Info)
{
	npc = pal_6099_ritter;
	nr = 1;
	condition = dia_pal_6099_ritter_warning_condition;
	information = dia_pal_6099_ritter_warning_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_pal_6099_ritter_warning_condition()
{
	return b_assignetluconditions(self);
};

func void dia_pal_6099_ritter_warning_info()
{
	b_assignetlutalk(self);
};


instance DIA_PAL_6100_RITTER_EXIT(C_Info)
{
	npc = pal_6100_ritter;
	nr = 999;
	condition = dia_pal_6100_ritter_exit_condition;
	information = dia_pal_6100_ritter_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_6100_ritter_exit_condition()
{
	return TRUE;
};

func void dia_pal_6100_ritter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_6100_RITTER_WARNING(C_Info)
{
	npc = pal_6100_ritter;
	nr = 1;
	condition = dia_pal_6100_ritter_warning_condition;
	information = dia_pal_6100_ritter_warning_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_pal_6100_ritter_warning_condition()
{
	return b_assignetluconditions(self);
};

func void dia_pal_6100_ritter_warning_info()
{
	b_assignetlutalk(self);
};


instance DIA_PAL_6101_RITTER_EXIT(C_Info)
{
	npc = pal_6101_ritter;
	nr = 999;
	condition = dia_pal_6101_ritter_exit_condition;
	information = dia_pal_6101_ritter_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_6101_ritter_exit_condition()
{
	return TRUE;
};

func void dia_pal_6101_ritter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_6101_RITTER_WARNING(C_Info)
{
	npc = pal_6101_ritter;
	nr = 1;
	condition = dia_pal_6101_ritter_warning_condition;
	information = dia_pal_6101_ritter_warning_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_pal_6101_ritter_warning_condition()
{
	return b_assignetluconditions(self);
};

func void dia_pal_6101_ritter_warning_info()
{
	b_assignetlutalk(self);
};


instance DIA_PAL_6102_RITTER_EXIT(C_Info)
{
	npc = pal_6102_ritter;
	nr = 999;
	condition = dia_pal_6102_ritter_exit_condition;
	information = dia_pal_6102_ritter_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_6102_ritter_exit_condition()
{
	return TRUE;
};

func void dia_pal_6102_ritter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_6102_RITTER_WARNING(C_Info)
{
	npc = pal_6102_ritter;
	nr = 1;
	condition = dia_pal_6102_ritter_warning_condition;
	information = dia_pal_6102_ritter_warning_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_pal_6102_ritter_warning_condition()
{
	return b_assignetluconditions(self);
};

func void dia_pal_6102_ritter_warning_info()
{
	b_assignetlutalk(self);
};


instance DIA_PAL_6103_RITTER_EXIT(C_Info)
{
	npc = pal_6103_ritter;
	nr = 999;
	condition = dia_pal_6103_ritter_exit_condition;
	information = dia_pal_6103_ritter_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_6103_ritter_exit_condition()
{
	return TRUE;
};

func void dia_pal_6103_ritter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_6103_RITTER_WARNING(C_Info)
{
	npc = pal_6103_ritter;
	nr = 1;
	condition = dia_pal_6103_ritter_warning_condition;
	information = dia_pal_6103_ritter_warning_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_pal_6103_ritter_warning_condition()
{
	return b_assignetluconditions(self);
};

func void dia_pal_6103_ritter_warning_info()
{
	b_assignetlutalk(self);
};


instance DIA_PAL_6104_RITTER_EXIT(C_Info)
{
	npc = pal_6104_ritter;
	nr = 999;
	condition = dia_pal_6104_ritter_exit_condition;
	information = dia_pal_6104_ritter_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_6104_ritter_exit_condition()
{
	return TRUE;
};

func void dia_pal_6104_ritter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_6104_RITTER_WARNING(C_Info)
{
	npc = pal_6104_ritter;
	nr = 1;
	condition = dia_pal_6104_ritter_warning_condition;
	information = dia_pal_6104_ritter_warning_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_pal_6104_ritter_warning_condition()
{
	return b_assignetluconditions(self);
};

func void dia_pal_6104_ritter_warning_info()
{
	b_assignetlutalk(self);
};


instance DIA_PAL_6105_RITTER_EXIT(C_Info)
{
	npc = pal_6105_ritter;
	nr = 999;
	condition = dia_pal_6105_ritter_exit_condition;
	information = dia_pal_6105_ritter_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_6105_ritter_exit_condition()
{
	return TRUE;
};

func void dia_pal_6105_ritter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_6105_RITTER_WARNING(C_Info)
{
	npc = pal_6105_ritter;
	nr = 1;
	condition = dia_pal_6105_ritter_warning_condition;
	information = dia_pal_6105_ritter_warning_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_pal_6105_ritter_warning_condition()
{
	return b_assignetluconditions(self);
};

func void dia_pal_6105_ritter_warning_info()
{
	b_assignetlutalk(self);
};


instance DIA_PAL_6106_RITTER_EXIT(C_Info)
{
	npc = pal_6106_ritter;
	nr = 999;
	condition = dia_pal_6106_ritter_exit_condition;
	information = dia_pal_6106_ritter_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_6106_ritter_exit_condition()
{
	return TRUE;
};

func void dia_pal_6106_ritter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_6106_RITTER_WARNING(C_Info)
{
	npc = pal_6106_ritter;
	nr = 1;
	condition = dia_pal_6106_ritter_warning_condition;
	information = dia_pal_6106_ritter_warning_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_pal_6106_ritter_warning_condition()
{
	return b_assignetluconditions(self);
};

func void dia_pal_6106_ritter_warning_info()
{
	b_assignetlutalk(self);
};


instance DIA_PAL_6107_RITTER_EXIT(C_Info)
{
	npc = pal_6107_ritter;
	nr = 999;
	condition = dia_pal_6107_ritter_exit_condition;
	information = dia_pal_6107_ritter_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_6107_ritter_exit_condition()
{
	return TRUE;
};

func void dia_pal_6107_ritter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_6107_RITTER_WARNING(C_Info)
{
	npc = pal_6107_ritter;
	nr = 1;
	condition = dia_pal_6107_ritter_warning_condition;
	information = dia_pal_6107_ritter_warning_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_pal_6107_ritter_warning_condition()
{
	return b_assignetluconditions(self);
};

func void dia_pal_6107_ritter_warning_info()
{
	b_assignetlutalk(self);
};

