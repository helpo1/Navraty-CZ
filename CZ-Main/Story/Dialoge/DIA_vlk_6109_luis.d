
instance DIA_LUIS_EXIT(C_Info)
{
	npc = vlk_6109_luis;
	nr = 999;
	condition = dia_luis_exit_condition;
	information = dia_luis_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_luis_exit_condition()
{
	return TRUE;
};

func void dia_luis_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LUIS_PICKPOCKET(C_Info)
{
	npc = vlk_6109_luis;
	nr = 900;
	condition = dia_luis_pickpocket_condition;
	information = dia_luis_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_luis_pickpocket_condition()
{
	return C_Beklauen(30,28);
};

func void dia_luis_pickpocket_info()
{
	Info_ClearChoices(dia_luis_pickpocket);
	Info_AddChoice(dia_luis_pickpocket,Dialog_Back,dia_luis_pickpocket_back);
	Info_AddChoice(dia_luis_pickpocket,DIALOG_PICKPOCKET,dia_luis_pickpocket_doit);
};

func void dia_luis_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_luis_pickpocket);
};

func void dia_luis_pickpocket_back()
{
	Info_ClearChoices(dia_luis_pickpocket);
};


instance DIA_LUIS_HALLO(C_Info)
{
	npc = vlk_6109_luis;
	nr = 2;
	condition = dia_luis_hallo_condition;
	information = dia_luis_hallo_info;
	permanent = FALSE;
	description = "Ty jsi Luis?";
};


func int dia_luis_hallo_condition()
{
	if(MIS_KILLTARGET1 == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_luis_hallo_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Luis_Hallo_01_00");	//Ty jsi Luis?
	AI_Output(self,other,"DIA_Luis_Hallo_01_01");	//Jo, to jsem já. Něco ode mě chceš?
	AI_Output(other,self,"DIA_Luis_Hallo_01_03");	//Říká se, že příliš mluvíš o věcech, o kterých bys neměl.
	AI_Output(other,self,"DIA_Luis_Hallo_01_04");	//Jak jistě chápeš, někteří lidé s tím nejsou příliš spokojeni.
	AI_Output(self,other,"DIA_Luis_Hallo_01_05");	//CO?!... (uraženě) Víš co, pokud to někomu vadí, je to jejich problém!
	AI_Output(self,other,"DIA_Luis_Hallo_01_06");	//Budu si říkat, co chci!
	AI_Output(other,self,"DIA_Luis_Hallo_01_07");	//Jistě, jistě! Taky mě poslali tenhle problém vyřešit.
	AI_Output(self,other,"DIA_Luis_Hallo_01_08");	//Jo?! (vysmívá se) A co s tím uděláš?
	AI_Output(other,self,"DIA_Luis_Hallo_01_09");	//Velmi jednoduché - postarám se, abys už mlčel navždy.
	AI_Output(self,other,"DIA_Luis_Hallo_01_10");	//CO?! To myslíš vážně?!... (nechápavě)
	AI_ReadyMeleeWeapon(other);
	AI_Output(self,other,"DIA_Luis_Hallo_01_12");	//Můj bože! Ty ses zbláznil!
	AI_Output(self,other,"DIA_Luis_Hallo_01_13");	//Stráže! Pomozte mi někdo... (panikaří) On mě chce zabít!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_ReactToWeapon,0);
};

