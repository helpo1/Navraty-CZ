
instance INFO_TPL_13_EXIT(C_Info)
{
	nr = 999;
	condition = info_tpl_13_exit_condition;
	information = info_tpl_13_exit_info;
	permanent = 1;
	description = Dialog_Ende;
};


func int info_tpl_13_exit_condition()
{
	return TRUE;
};

func void info_tpl_13_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_TPL_13_EINERVONEUCHWERDEN(C_Info)
{
	nr = 4;
	condition = info_tpl_13_einervoneuchwerden_condition;
	information = info_tpl_13_einervoneuchwerden_info;
	permanent = 1;
	description = "Chtěl bych se stát templářem jako ty.";
};


func int info_tpl_13_einervoneuchwerden_condition()
{
	if((other.guild != GIL_TPL) && (other.guild == GIL_SEK))
	{
		return TRUE;
	};
};

func void info_tpl_13_einervoneuchwerden_info()
{
	AI_Output(other,self,"Info_Tpl_13_EinerVonEuchWerden_15_00");	//Chtěl bych se stát templářem jako ty.
	AI_Output(self,other,"Info_Tpl_13_EinerVonEuchWerden_13_01");	//Víš, kolika věcí jsem se musel zříct, aby se mohl nazývat strážcem míru a ochráncem vyvolených našeho Bratrstva?
	AI_Output(self,other,"Info_Tpl_13_EinerVonEuchWerden_13_02");	//Nemysli si, že se můžeš jen tak stát templářem a získat tomu přislouchající úctu a respekt.
	AI_Output(self,other,"Info_Tpl_13_EinerVonEuchWerden_13_03");	//Nejprve by ses měl pořádně seznámit s naším učením.
	AI_Output(self,other,"Info_Tpl_13_EinerVonEuchWerden_13_04");	//To ti zabere nějaký čas.
};


instance INFO_TPL_13_WICHTIGEPERSONEN(C_Info)
{
	nr = 3;
	condition = info_tpl_13_wichtigepersonen_condition;
	information = info_tpl_13_wichtigepersonen_info;
	permanent = 1;
	description = "Kdo tomu tady velí?";
};


func int info_tpl_13_wichtigepersonen_condition()
{
	return TRUE;
};

func void info_tpl_13_wichtigepersonen_info()
{
	AI_Output(other,self,"Info_Tpl_13_WichtigePersonen_15_00");	//Kdo tomu tady velí?
	AI_Output(self,other,"Info_Tpl_13_WichtigePersonen_13_01");	//Naši Guru a vybraní templáři. Naše víra utváří náš osud a Guru nám slouží jako proroci.
};


instance INFO_TPL_13_DIELAGE(C_Info)
{
	nr = 1;
	condition = info_tpl_13_dielage_condition;
	information = info_tpl_13_dielage_info;
	permanent = 1;
	description = "Jak je?";
};


func int info_tpl_13_dielage_condition()
{
	if((other.guild != GIL_GUR) && (other.guild != GIL_TPL) && (other.guild != GIL_SEK))
	{
		return TRUE;
	};
};

func void info_tpl_13_dielage_info()
{
	AI_Output(other,self,"Info_Tpl_13_DieLage_15_00");	//Jak je?
	AI_Output(self,other,"Info_Tpl_13_DieLage_13_01");	//Od té doby, co mě vybrali za templáře, se cítím jako nikdy předtím.
	AI_Output(other,self,"Info_Tpl_13_DieLage_15_02");	//To zní zajímavě...
	AI_Output(self,other,"Info_Tpl_13_DieLage_13_03");	//Ty nejsi věřící, tomu nemůžeš rozumět.
};

func void b_assignambientinfos_tpl_13(var C_Npc slf)
{
	info_tpl_13_exit.npc = Hlp_GetInstanceID(slf);
	info_tpl_13_einervoneuchwerden.npc = Hlp_GetInstanceID(slf);
	info_tpl_13_wichtigepersonen.npc = Hlp_GetInstanceID(slf);
	info_tpl_13_dielage.npc = Hlp_GetInstanceID(slf);
};

