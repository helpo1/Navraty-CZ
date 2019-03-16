
instance DIA_ADDON_INEXTREMO_DRPYMONTE_EXIT(C_Info)
{
	npc = PIR_1390_Addon_InExtremo_DrPymonte;
	nr = 999;
	condition = dia_addon_inextremo_drpymonte_exit_condition;
	information = dia_addon_inextremo_drpymonte_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_addon_inextremo_drpymonte_exit_condition()
{
	return TRUE;
};

func void dia_addon_inextremo_drpymonte_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_INEXTREMO_DRPYMONTE_PICKPOCKET(C_Info)
{
	npc = PIR_1390_Addon_InExtremo_DrPymonte;
	nr = 900;
	condition = dia_addon_inextremo_drpymonte_pickpocket_condition;
	information = dia_addon_inextremo_drpymonte_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_addon_inextremo_drpymonte_pickpocket_condition()
{
	return C_Beklauen(80,100);
};

func void dia_addon_inextremo_drpymonte_pickpocket_info()
{
	Info_ClearChoices(dia_addon_inextremo_drpymonte_pickpocket);
	Info_AddChoice(dia_addon_inextremo_drpymonte_pickpocket,Dialog_Back,dia_addon_inextremo_drpymonte_pickpocket_back);
	Info_AddChoice(dia_addon_inextremo_drpymonte_pickpocket,DIALOG_PICKPOCKET,dia_addon_inextremo_drpymonte_pickpocket_doit);
};

func void dia_addon_inextremo_drpymonte_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_addon_inextremo_drpymonte_pickpocket);
};

func void dia_addon_inextremo_drpymonte_pickpocket_back()
{
	Info_ClearChoices(dia_addon_inextremo_drpymonte_pickpocket);
};


instance DIA_ADDON_INEXTREMO_DRPYMONTE_HI(C_Info)
{
	npc = PIR_1390_Addon_InExtremo_DrPymonte;
	nr = 2;
	condition = dia_addon_inextremo_drpymonte_hi_condition;
	information = dia_addon_inextremo_drpymonte_hi_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_addon_inextremo_drpymonte_hi_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_drpymonte_hi_info()
{
	if(BEKILLMASTER == TRUE)
	{
		if(KILLMEMBER1 == FALSE)
		{
			AI_Output(self,other,"DIA_Addon_InExtremo_DrPymonte_Hi_01_00");	//Povedlo se ti zabít Asmala? Jsem překvapen!
			AI_Output(self,other,"DIA_Addon_InExtremo_DrPymonte_Hi_01_01");	//Opravdu jsem si myslel, že se to nikomu nepodaří.
			AI_Output(other,self,"DIA_Addon_InExtremo_DrPymonte_Hi_01_02");	//Zdá se, že ses mýlil.
			AI_Output(self,other,"DIA_Addon_InExtremo_DrPymonte_Hi_01_03");	//Už to tak bude. Nyní jsi naším šéfem ty.
			KILLMEMBER1 = TRUE;
		}
		else if(CharlotteMyAss == TRUE)
		{
			AI_Output(self,other,"DIA_Addon_InExtremo_DrPymonte_Hi_01_77");	//Na všechny otázky se ptej Charlotte.
			AI_Output(self,other,"DIA_Addon_InExtremo_DrPymonte_Hi_01_78");	//Jmenoval jsi ji jako svého zástupce.
			AI_Output(other,self,"DIA_Addon_InExtremo_DrPymonte_Hi_01_79");	//Samozřejmě.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_InExtremo_DrPymonte_Hi_01_04");	//Co říkáš?
		};
	}
	else if(Wld_IsTime(8,0,20,0) && (JOINKILLERS == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_InExtremo_DrPymonte_Hi_01_05");	//Nevyrušuj mě!
		AI_StopProcessInfos(self);
		Npc_SetRefuseTalk(self,300);
	}
	else
	{
		if(JOINKILLERS == TRUE)
		{
			if(CHIEFKILLERISDEAD == FALSE)
			{
				AI_Output(self,other,"DIA_Addon_InExtremo_DrPymonte_Hi_01_06");	//Jestli něco potřebuješ, promluv si s Asmalem.
				AI_StopProcessInfos(self);
				Npc_SetRefuseTalk(self,300);
			}
			else
			{
				B_Say(self,other,"$NOTNOW");
				AI_StopProcessInfos(self);
				Npc_SetRefuseTalk(self,300);
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_InExtremo_DrPymonte_Hi_01_07");	//Nech mě být!
			AI_Output(self,other,"DIA_Addon_InExtremo_DrPymonte_Hi_01_08");	//Pokud něco potřebuješ, promluv si s Gillianem. On je náš šéf.
			AI_StopProcessInfos(self);
			Npc_SetRefuseTalk(self,300);
		};
	};
};

instance DIA_Addon_InExtremo_DrPymonte_Harfe(C_Info)
{
	npc = PIR_1390_Addon_InExtremo_DrPymonte;
	nr = 1;
	condition = DIA_Addon_InExtremo_DrPymonte_Harfe_condition;
	information = DIA_Addon_InExtremo_DrPymonte_Harfe_info;
	permanent = FALSE;
	description = "Pamatuju si, že jsi hrál na harfu, že jo?";
};

func int DIA_Addon_InExtremo_DrPymonte_Harfe_condition()
{
	if((MIS_KASSIAMUSIC == LOG_Running) && (MoveKillNewPlace == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_InExtremo_DrPymonte_Harfe_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Addon_InExtremo_DrPymonte_Harfe_01_01");	//Pamatuju si, že jsi hrál na harfu, že jo?
	AI_Output(self,other,"DIA_Addon_InExtremo_DrPymonte_Harfe_01_02");	//Ano, hrál.
	AI_Output(other,self,"DIA_Addon_InExtremo_DrPymonte_Harfe_01_03");	//Potřebuješ ji ještě?
	AI_Output(self,other,"DIA_Addon_InExtremo_DrPymonte_Harfe_01_04");	//(zamyšleně) A k čemu bych ji tady mohl potřebovat? Akorát zabírá místo...
	AI_Output(self,other,"DIA_Addon_InExtremo_DrPymonte_Harfe_01_05");	//Pokud chceš, můžeš si ji vzít. Já už ji nepotřebuju.
	B_GiveInvItems(self,other,ItMi_IEHarfe,1);
	Npc_RemoveInvItems(self,ItMi_IEHarfe,1);
	AI_Output(other,self,"DIA_Addon_InExtremo_DrPymonte_Harfe_01_06");	//Děkuju.
	B_LogEntry(TOPIC_KASSIAMUSIC,"Pymonte mi dal svou harfu.");
};