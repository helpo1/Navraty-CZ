
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
	description = "Co říkáš?";
};


func int dia_pal_2520_parcival_perm_condition()
{
	return TRUE;
};

func void dia_pal_2520_parcival_perm_info()
{
	AI_Output(other,self,"DIA_PAL_2520_Parcival_Perm_01_00");	//Co říkáš?
	AI_Output(self,other,"DIA_PAL_2520_Parcival_Perm_01_01");	//Co můžu říci? Bylo by mnohem lepší, kdyby tu nebylo tolik skřetů.
	AI_Output(self,other,"DIA_PAL_2520_Parcival_Perm_01_02");	//Už mi začinají lézt na nervy! (naštvaně)Vždycky když zabijeme pár skřetů přijdou nakonec vždy další!
	AI_Output(other,self,"DIA_PAL_2520_Parcival_Perm_01_03");	//Válečníkova ruka je znavená?
	AI_Output(self,other,"DIA_PAL_2520_Parcival_Perm_01_04");	//Ha...(sarkasticky)Jsi nějakej chytrej co?
	AI_Output(self,other,"DIA_PAL_2520_Parcival_Perm_01_05");	//Neboj se je tu dost skřetů i pro tebe. Pak uvidíme jak nám pomůžeš ty chytráku!
	AI_Output(other,self,"DIA_PAL_2520_Parcival_Perm_01_06");	//Myslím že to zase nějak zvládnu.
	AI_Output(self,other,"DIA_PAL_2520_Parcival_Perm_01_07");	//No, ano, ano...
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

