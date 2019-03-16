
instance DIA_PAL_2520_PARCIVAL_EXIT(C_Info)
{
	npc = pal_2520_parcival;
	nr = 999;
	condition = dia_pal_2520_parcival_exit_condition;
	information = dia_pal_2520_parcival_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_2520_parcival_exit_condition()
{
	return TRUE;
};

func void dia_pal_2520_parcival_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_2520_PARCIVAL_PERM(C_Info)
{
	npc = pal_2520_parcival;
	nr = 9;
	condition = dia_pal_2520_parcival_perm_condition;
	information = dia_pal_2520_parcival_perm_info;
	permanent = TRUE;
	description = "Что скажешь?";
};


func int dia_pal_2520_parcival_perm_condition()
{
	return TRUE;
};

func void dia_pal_2520_parcival_perm_info()
{
	AI_Output(other,self,"DIA_PAL_2520_Parcival_Perm_01_00");	//Что скажешь?
	AI_Output(self,other,"DIA_PAL_2520_Parcival_Perm_01_01");	//Да что тут говорить?! Было бы гораздо лучше, если бы вокруг не шныряло такое количество орков.
	AI_Output(self,other,"DIA_PAL_2520_Parcival_Perm_01_02");	//А то они уже начинают действовать мне на нервы...(злобно) Сколько их не убивай, на месте мертвых появляются все новые и новые твари!
	AI_Output(other,self,"DIA_PAL_2520_Parcival_Perm_01_03");	//Что, рука бойца колоть устала?
	AI_Output(self,other,"DIA_PAL_2520_Parcival_Perm_01_04");	//Ха...(ехидно) А ты, значит, у нас сильно умный, да?
	AI_Output(self,other,"DIA_PAL_2520_Parcival_Perm_01_05");	//Не переживай, на твою долю тоже орков хватит. Тогда и посмотрим, как тебе поможет твой длинный язык!
	AI_Output(other,self,"DIA_PAL_2520_Parcival_Perm_01_06");	//Думаю, как-нибудь справлюсь.
	AI_Output(self,other,"DIA_PAL_2520_Parcival_Perm_01_07");	//Ну да, ну да...
	PERCIVALNWPISSOFF = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_PAL_2520_PARCIVAL_FUCKOFF(C_Info)
{
	npc = pal_2520_parcival;
	nr = 10;
	condition = dia_pal_2520_parcival_fuckoff_condition;
	information = dia_pal_2520_parcival_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_pal_2520_parcival_fuckoff_condition()
{
	if((PERCIVALNWPISSOFF == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_pal_2520_parcival_fuckoff_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
};

