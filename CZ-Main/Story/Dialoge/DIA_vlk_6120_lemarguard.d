
instance DIA_LEMARGUARD_EXIT(C_Info)
{
	npc = vlk_6120_lemarguard;
	nr = 999;
	condition = dia_lemarguard_exit_condition;
	information = dia_lemarguard_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_lemarguard_exit_condition()
{
	return TRUE;
};

func void dia_lemarguard_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LEMARGUARD_PICKPOCKET(C_Info)
{
	npc = vlk_6120_lemarguard;
	nr = 900;
	condition = dia_lemarguard_pickpocket_condition;
	information = dia_lemarguard_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_lemarguard_pickpocket_condition()
{
	return C_Beklauen(93,320);
};

func void dia_lemarguard_pickpocket_info()
{
	Info_ClearChoices(dia_lemarguard_pickpocket);
	Info_AddChoice(dia_lemarguard_pickpocket,Dialog_Back,dia_lemarguard_pickpocket_back);
	Info_AddChoice(dia_lemarguard_pickpocket,DIALOG_PICKPOCKET,dia_lemarguard_pickpocket_doit);
};

func void dia_lemarguard_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_lemarguard_pickpocket);
};

func void dia_lemarguard_pickpocket_back()
{
	Info_ClearChoices(dia_lemarguard_pickpocket);
};


instance DIA_LEMARGUARD_HALLO(C_Info)
{
	npc = vlk_6120_lemarguard;
	nr = 1;
	condition = dia_lemarguard_hallo_condition;
	information = dia_lemarguard_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lemarguard_hallo_condition()
{
	return TRUE;
};

func void dia_lemarguard_hallo_info()
{
	AI_Output(self,other,"DIA_LemarGuard_Hallo_01_00");	//Hej, co tady hledáš?! Co chceš?!
	AI_Output(self,other,"DIA_LemarGuard_Hallo_01_01");	//I když, stůj, já tě znám... (přiblíží se, aby se lépe kouknul)
	AI_Output(self,other,"DIA_LemarGuard_Hallo_01_02");	//Ano, přesně! Ty jseš ten chlápek, co v Starým táboře furt způsoboval problémy.
	AI_Output(self,other,"DIA_LemarGuard_Hallo_01_03");	//He, he! Měl by sis mě taky pamatovat.
	Info_ClearChoices(dia_lemarguard_hallo);
	Info_AddChoice(dia_lemarguard_hallo,"Lituji, neznám tě.",dia_lemarguard_hallo_no);
	Info_AddChoice(dia_lemarguard_hallo,"Jako kdybych na tebe mohl zapomenout!",dia_lemarguard_hallo_yes);
};

func void dia_lemarguard_hallo_no()
{
	AI_Output(other,self,"DIA_LemarGuard_Hallo_No_01_00");	//Lituji, neznám tě.
	AI_Output(self,other,"DIA_LemarGuard_Hallo_No_01_01");	//Hmmm... (překvapeně) Divné! Obyčejně mám dobrou paměť na lidi a netuším, s kým bych si tě mohl pomýlit.
	AI_Output(self,other,"DIA_LemarGuard_Hallo_No_01_03");	//No to je fuk. Pamatuj, drž se dál od Lehmara!
	AI_Output(self,other,"DIA_LemarGuard_Hallo_No_01_04");	//Dokud jsem tady nikdo mu nezkříví ani vlásek, jasné?
	AI_Output(other,self,"DIA_LemarGuard_Hallo_No_01_05");	//Jasně.
	AI_StopProcessInfos(self);
};

func void dia_lemarguard_hallo_yes()
{
	self.name[0] = "Scar, Lehmarův osobní strážce";
	SCARKNOWS = TRUE;
	AI_Output(other,self,"DIA_LemarGuard_Hallo_Yes_01_00");	//Jak bych mohl zapomenout na tvou tvář! Scar!
	AI_Output(self,other,"DIA_LemarGuard_Hallo_Yes_01_01");	//He, he. Pamatuješ si mne.
	AI_Output(other,self,"DIA_LemarGuard_Hallo_Yes_01_02");	//Jak bych mohl zapomenout? Co tady děláš?
	AI_Output(self,other,"DIA_LemarGuard_Hallo_Yes_01_03");	//Lehmar si mne najal.
	AI_Output(self,other,"DIA_LemarGuard_Hallo_Yes_01_04");	//Jako svého osobního strážce.
	AI_Output(self,other,"DIA_LemarGuard_Hallo_Yes_01_05");	//Dokud jsem tady nikdo mu nezkříví ani vlásek, jasné?
	AI_Output(other,self,"DIA_LemarGuard_Hallo_Yes_01_06");	//Jasně.
	AI_StopProcessInfos(self);
};


instance DIA_LEMARGUARD_HALLOEN(C_Info)
{
	npc = vlk_6120_lemarguard;
	nr = 1;
	condition = dia_lemarguard_halloen_condition;
	information = dia_lemarguard_halloen_info;
	permanent = TRUE;
	description = "Jak jde práce?";
};

func int dia_lemarguard_halloen_condition()
{
	return TRUE;
};

func void dia_lemarguard_halloen_info()
{
	AI_Output(other,self,"DIA_LemarGuard_HalloEN_01_00");	//Jak jde práce?
	AI_Output(self,other,"DIA_LemarGuard_HalloEN_01_01");	//No, pořád žiju, ne? He, he.
	AI_StopProcessInfos(self);
};