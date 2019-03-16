
instance DIA_Addon_TAL_BDT_1_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_Addon_TAL_BDT_1_EXIT_Condition;
	information = DIA_Addon_TAL_BDT_1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_TAL_BDT_1_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_TAL_BDT_1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_TAL_BDT_1_Hi(C_Info)
{
	nr = 2;
	condition = DIA_Addon_TAL_BDT_1_Hi_Condition;
	information = DIA_Addon_TAL_BDT_1_Hi_Info;
	permanent = TRUE;
	description = "Jak se vede?";
};


func int DIA_Addon_TAL_BDT_1_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_TAL_BDT_1_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_TAL_BDT_1_Hi_15_00");	//Jak se vede?
	AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Hi_01_01");	//Čekám až zažádají o někoho nového a teď je řada na mě.
	if(!Npc_IsDead(Franco))
	{
		AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Hi_01_02");	//Ze všech lidí, kteří jsou tady, jen Franco může dovnitř.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Hi_01_03");	//Teď, když je Franco mrtvý, snad mám větší šanci.
	};
};


instance DIA_Addon_TAL_BDT_1_Lager(C_Info)
{
	nr = 3;
	condition = DIA_Addon_TAL_BDT_1_Lager_Condition;
	information = DIA_Addon_TAL_BDT_1_Lager_Info;
	permanent = TRUE;
	description = "Co mi můžeš říci o táboře?";
};


func int DIA_Addon_TAL_BDT_1_Lager_Condition()
{
	return TRUE;
};

func void DIA_Addon_TAL_BDT_1_Lager_Info()
{
	AI_Output(other,self,"DIA_Addon_TAL_BDT_1_Lager_15_00");	//Co mi můžeš říci o táboře?
	AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Lager_01_01");	//Dej si pozor s kým se zapleteš! Začne-li boj bez důvodu, budeš mít rychle všechny proti sobě!
	AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Lager_01_02");	//Většina z nich se bojí o své zlato a někteří z chlapců sledují jeden druhého.
};


instance DIA_Addon_TAL_BDT_1_Raven(C_Info)
{
	nr = 4;
	condition = DIA_Addon_TAL_BDT_1_Raven_Condition;
	information = DIA_Addon_TAL_BDT_1_Raven_Info;
	permanent = TRUE;
	description = "Co víš o Ravenovi?";
};


func int DIA_Addon_TAL_BDT_1_Raven_Condition()
{
	return TRUE;
};

func void DIA_Addon_TAL_BDT_1_Raven_Info()
{
	AI_Output(other,self,"DIA_Addon_TAL_BDT_1_Raven_15_00");	//Co víš o Ravenovi?
	AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Raven_01_01");	//Je to chlápek, který se zde objevil jako první se svými chlapci.
	AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Raven_01_02");	//To on je vůdce tohohle tábora. Bejt tebou, tak si s ním moc nezahrávám.
	AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Raven_01_03");	//Jednou potřebovali pět novejch chlapů, protože se vzteknul a odkrouhnul vlastní lidi.
};

func void B_AssignAmbientInfos_Addon_TAL_BDT_1(var C_Npc slf)
{
	DIA_Addon_TAL_BDT_1_EXIT.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_TAL_BDT_1_Hi.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_TAL_BDT_1_Lager.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_TAL_BDT_1_Raven.npc = Hlp_GetInstanceID(slf);
};

