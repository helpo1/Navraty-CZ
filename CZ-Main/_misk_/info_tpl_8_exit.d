
instance INFO_TPL_8_EXIT(C_Info)
{
	nr = 999;
	condition = info_tpl_8_exit_condition;
	information = info_tpl_8_exit_info;
	permanent = 1;
	description = Dialog_Ende;
};


func int info_tpl_8_exit_condition()
{
	return TRUE;
};

func void info_tpl_8_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_TPL_8_EINERVONEUCHWERDEN(C_Info)
{
	nr = 4;
	condition = info_tpl_8_einervoneuchwerden_condition;
	information = info_tpl_8_einervoneuchwerden_info;
	permanent = 1;
	description = "Sháníte dobré lidi?";
};


func int info_tpl_8_einervoneuchwerden_condition()
{
	if((other.guild != GIL_TPL) && (other.guild == GIL_SEK))
	{
		return TRUE;
	};
};

func void info_tpl_8_einervoneuchwerden_info()
{
	AI_Output(other,self,"Info_Tpl_8_EinerVonEuchWerden_15_00");	//Sháníte dobré lidi?
	AI_Output(self,other,"Info_Tpl_8_EinerVonEuchWerden_08_01");	//Samozřejmě, dobří lidé jsou vždy potřeba. Ale musíš na sobě ještě hodně pracovat. Jen ti nejlepší to mohou dotáhnout až na templáře.
	AI_Output(self,other,"Info_Tpl_8_EinerVonEuchWerden_08_02");	//To je nejvyšší čest pro následovníky Bratrstva.
};


instance INFO_TPL_8_WICHTIGEPERSONEN(C_Info)
{
	nr = 3;
	condition = info_tpl_8_wichtigepersonen_condition;
	information = info_tpl_8_wichtigepersonen_info;
	permanent = 1;
	description = "Kdo tu velí?";
};


func int info_tpl_8_wichtigepersonen_condition()
{
	return TRUE;
};

func void info_tpl_8_wichtigepersonen_info()
{
	AI_Output(other,self,"Info_Tpl_8_WichtigePersonen_15_00");	//Kdo tu velí?
	AI_Output(self,other,"Info_Tpl_8_WichtigePersonen_08_01");	//Sloužíme Guru. To je naše posvátná povinnost.
	AI_Output(other,self,"Info_Tpl_8_WichtigePersonen_15_02");	//A kdo jsou tihle Guru?
	AI_Output(self,other,"Info_Tpl_8_WichtigePersonen_08_03");	//Nejvyšším Guru je Baal Orun. To jemu se zodpovídají ostatní Guru, stejně jako Gor Na Kosh, vůdce templářů.
};


instance INFO_TPL_8_DASLAGER(C_Info)
{
	nr = 2;
	condition = info_tpl_8_daslager_condition;
	information = info_tpl_8_daslager_info;
	permanent = 1;
	description = "Co mi řekneš o táboře?";
};


func int info_tpl_8_daslager_condition()
{
	if((other.guild != GIL_GUR) && (other.guild != GIL_TPL) && (other.guild != GIL_SEK))
	{
		return TRUE;
	};
};

func void info_tpl_8_daslager_info()
{
	AI_Output(other,self,"Info_Tpl_8_DasLager_15_00");	//Co mi řekneš o táboře?
	AI_Output(self,other,"Info_Tpl_8_DasLager_08_01");	//Jsi tady nový, takže si prozatím můžeš chodit, kam se ti zlíbí. Boje v táboře jsou zakázané.
	AI_Output(self,other,"Info_Tpl_8_DasLager_08_02");	//Pokoušej se neporušovat tahle pravidla. Také nás nevyrušuj při rozjímání.
};


instance INFO_TPL_8_DIELAGE(C_Info)
{
	nr = 1;
	condition = info_tpl_8_dielage_condition;
	information = info_tpl_8_dielage_info;
	permanent = 1;
	description = "Jak se vede?";
};


func int info_tpl_8_dielage_condition()
{
	if((other.guild != GIL_GUR) && (other.guild != GIL_TPL) && (other.guild != GIL_SEK))
	{
		return 1;
	};
};

func void info_tpl_8_dielage_info()
{
	AI_Output(other,self,"Info_Tpl_8_DieLage_15_00");	//Jak se vede?
	AI_Output(self,other,"Info_Tpl_8_DieLage_08_01");	//Varuji tě: neúctu tady nestrpím. Mluvíš s jedním z templářů.
};

func void b_assignambientinfos_tpl_8(var C_Npc slf)
{
	info_tpl_8_exit.npc = Hlp_GetInstanceID(slf);
	info_tpl_8_einervoneuchwerden.npc = Hlp_GetInstanceID(slf);
	info_tpl_8_wichtigepersonen.npc = Hlp_GetInstanceID(slf);
	info_tpl_8_daslager.npc = Hlp_GetInstanceID(slf);
	info_tpl_8_dielage.npc = Hlp_GetInstanceID(slf);
};

