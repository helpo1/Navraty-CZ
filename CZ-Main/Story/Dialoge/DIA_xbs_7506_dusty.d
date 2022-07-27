
instance DIA_DUSTY_EXIT(C_Info)
{
	npc = xbs_7506_dusty;
	nr = 999;
	condition = dia_dusty_exit_condition;
	information = dia_dusty_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_dusty_exit_condition()
{
	return TRUE;
};

func void dia_dusty_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DUSTY_PICKPOCKET(C_Info)
{
	npc = xbs_7506_dusty;
	nr = 900;
	condition = dia_dusty_pickpocket_condition;
	information = dia_dusty_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_dusty_pickpocket_condition()
{
	return C_Beklauen(25,30);
};

func void dia_dusty_pickpocket_info()
{
	Info_ClearChoices(dia_dusty_pickpocket);
	Info_AddChoice(dia_dusty_pickpocket,Dialog_Back,dia_dusty_pickpocket_back);
	Info_AddChoice(dia_dusty_pickpocket,DIALOG_PICKPOCKET,dia_dusty_pickpocket_doit);
};

func void dia_dusty_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_dusty_pickpocket);
};

func void dia_dusty_pickpocket_back()
{
	Info_ClearChoices(dia_dusty_pickpocket);
};


instance DIA_DUSTY_HALLO(C_Info)
{
	npc = xbs_7506_dusty;
	nr = 2;
	condition = dia_dusty_hallo_condition;
	information = dia_dusty_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_dusty_hallo_condition()
{
	if((Npc_GetDistToNpc(self,other) <= ZivilAnquatschDist) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void dia_dusty_hallo_info()
{
	AI_Output(self,other,"DIA_Dusty_Hallo_01_00");	//Myslím, že tě znám.
	AI_Output(self,other,"DIA_Dusty_Hallo_01_01");	//To ty jsi mě přivedl do tábora v bažinách. Vzpomínáš si?
	AI_Output(other,self,"DIA_Dusty_Hallo_15_00");	//Hmmm...
	AI_Output(self,other,"DIA_Dusty_Hallo_01_02");	//Jmenuji se Dusty! Byl jsem ještě kopáč ve Starém táboře.
	AI_Output(other,self,"DIA_Dusty_Hallo_15_01");	//Asi si vzpomínám. Doufám, že nejsi naštvanej, vyhecoval jsem tě do toho.
	AI_Output(self,other,"DIA_Dusty_Hallo_01_03");	//Ne. Je to moje vlastní chyba - dostal jsem se tam, ale časem mě to omrzelo.
	AI_Output(self,other,"DIA_Dusty_Hallo_01_04");	//Aspoň jsem nepropadl jejich hlouposti a naivnosti.
	AI_Output(self,other,"DIA_Dusty_Hallo_01_05");	//Spíš jsem spal než poslouchal. Potom se to nějak vyhrotilo.
	b_heroknowforestbase();
	AI_StopProcessInfos(self);
};

