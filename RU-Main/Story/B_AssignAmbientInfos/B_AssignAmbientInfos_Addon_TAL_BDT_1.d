
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
	description = "Как дела?";
};


func int DIA_Addon_TAL_BDT_1_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_TAL_BDT_1_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_TAL_BDT_1_Hi_15_00");	//Как дела?
	AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Hi_01_01");	//Я жду, пока они им не понадобится кто-нибудь новый и не придет моя очередь.
	if(!Npc_IsDead(Franco))
	{
		AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Hi_01_02");	//Из всех людей, кто снаружи, только Франко мог войти сюда.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Hi_01_03");	//А теперь Франко мертв, и, может быть, у меня появится шанс.
	};
};


instance DIA_Addon_TAL_BDT_1_Lager(C_Info)
{
	nr = 3;
	condition = DIA_Addon_TAL_BDT_1_Lager_Condition;
	information = DIA_Addon_TAL_BDT_1_Lager_Info;
	permanent = TRUE;
	description = "Можешь рассказать мне что-нибудь о лагере.";
};


func int DIA_Addon_TAL_BDT_1_Lager_Condition()
{
	return TRUE;
};

func void DIA_Addon_TAL_BDT_1_Lager_Info()
{
	AI_Output(other,self,"DIA_Addon_TAL_BDT_1_Lager_15_00");	//Можешь рассказать мне что-нибудь о лагере.
	AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Lager_01_01");	//Смотри, с кем связываешься! Если ты начнешь драться без причины, они все очень быстро набросятся на тебя!
	AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Lager_01_02");	//Большинство из них чересчур пекутся о своем золоте и некоторые внимательно следят за другими.
};


instance DIA_Addon_TAL_BDT_1_Raven(C_Info)
{
	nr = 4;
	condition = DIA_Addon_TAL_BDT_1_Raven_Condition;
	information = DIA_Addon_TAL_BDT_1_Raven_Info;
	permanent = TRUE;
	description = "Что тебе известно про Ворона?";
};


func int DIA_Addon_TAL_BDT_1_Raven_Condition()
{
	return TRUE;
};

func void DIA_Addon_TAL_BDT_1_Raven_Info()
{
	AI_Output(other,self,"DIA_Addon_TAL_BDT_1_Raven_15_00");	//Что тебе известно про Ворона?
	AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Raven_01_01");	//Этот человек первым оказался здесь со своими ребятами.
	AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Raven_01_02");	//Он - командир лагеря. Я тебе советую не крутиться вокруг него.
	AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Raven_01_03");	//Однажды им потребовались пять новых бойцов, потому что он сорвал свою злость на своих же людях.
};

func void B_AssignAmbientInfos_Addon_TAL_BDT_1(var C_Npc slf)
{
	DIA_Addon_TAL_BDT_1_EXIT.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_TAL_BDT_1_Hi.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_TAL_BDT_1_Lager.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_TAL_BDT_1_Raven.npc = Hlp_GetInstanceID(slf);
};

