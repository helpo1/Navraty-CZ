
instance DIA_TALAS_EXIT(C_Info)
{
	npc = sek_8012_talas;
	nr = 999;
	condition = dia_talas_exit_condition;
	information = dia_talas_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_talas_exit_condition()
{
	return TRUE;
};

func void dia_talas_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TALAS_GREET(C_Info)
{
	npc = sek_8012_talas;
	nr = 1;
	condition = dia_talas_greet_condition;
	information = dia_talas_greet_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_talas_greet_condition()
{
	if(Npc_GetDistToWP(self,"NW_PSICAMP_TALAS") <= 1000)
	{
		return TRUE;
	};
};

func void dia_talas_greet_info()
{
	AI_Output(self,other,"DIA_Talas_Greet_05_00");	//Pojď blíž! Každej nováček ode mě dostane dar.
};


var int talas_rationday;

instance DIA_TALAS_GETGESCHENK(C_Info)
{
	npc = sek_8012_talas;
	nr = 1;
	condition = dia_talas_getgeschenk_condition;
	information = dia_talas_getgeschenk_info;
	permanent = FALSE;
	description = "Jaký dar?";
};


func int dia_talas_getgeschenk_condition()
{
	return TRUE;
};

func void dia_talas_getgeschenk_info()
{
	AI_Output(other,self,"DIA_Talas_GetGeschenk_15_00");	//Jaký dar?
	AI_Output(self,other,"DIA_Talas_GetGeschenk_05_01");	//Tady, tři stébla trávy z bažin. Opatrně, jsou dost silné.
	AI_Output(self,other,"DIA_Talas_GetGeschenk_05_02");	//Můžeš si ode mě vyzvednout drogu každý den, ale pokud budeš chtít víc, než denní příděl, musíš za to zaplatit.
	AI_Output(self,other,"DIA_Talas_GetGeschenk_05_03");	//A pokud ti po cestě padne oko na nějakéh bylinky, nebo na trávu z bažin, tak ji od tebe koupím.
	CreateInvItems(self,ItMi_Joint,3);
	B_GiveInvItems(self,other,ItMi_Joint,3);
	TALAS_RATIONDAY = Wld_GetDay();
	Log_CreateTopic(TOPIC_TRADERPSI,LOG_NOTE);
	B_LogEntry(TOPIC_TRADERPSI,"Talas se stará o příděly drogy. Je hned pod alchymystickou laboratoří Baala Tyona.");
};


instance DIA_TALAS_DAILYRATION(C_Info)
{
	npc = sek_8012_talas;
	nr = 3;
	condition = dia_talas_dailyration_condition;
	information = dia_talas_dailyration_info;
	permanent = 1;
	description = "Přišel jsem si pro denní dávku drogy.";
};


func int dia_talas_dailyration_condition()
{
	if(Npc_KnowsInfo(hero,dia_talas_getgeschenk) && ((hero.guild == GIL_GUR) || (hero.guild == GIL_SEK) || (hero.guild == GIL_NONE) || (other.guild == GIL_TPL)))
	{
		return TRUE;
	};
};

func void dia_talas_dailyration_info()
{
	AI_Output(other,self,"DIA_Talas_DailyRation_15_00");	//Přišel jsem si pro denní dávku drogy.
	if(TALAS_RATIONDAY != Wld_GetDay())
	{
		AI_Output(self,other,"DIA_Talas_DailyRation_05_01");	//Tady, tři stébla. Ale nevykuř je všechny naráz!
		CreateInvItems(self,ItMi_Joint,3);
		B_GiveInvItems(self,other,ItMi_Joint,3);
		TALAS_RATIONDAY = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Talas_DailyRation_05_02");	//Dnes jsi už dostal svou porci. Pokud chceš ještě, přijď zítra, nebo si je můžeš koupit samozřejmě.
	};
};


instance DIA_TALAS_BUYJOINTS(C_Info)
{
	npc = sek_8012_talas;
	nr = 4;
	condition = dia_talas_buyjoints_condition;
	information = dia_talas_buyjoints_info;
	permanent = TRUE;
	description = "Pojďme obchodovat.";
	trade = TRUE;
};


func int dia_talas_buyjoints_condition()
{
	if(Npc_KnowsInfo(hero,dia_talas_getgeschenk) && Wld_IsTime(9,0,20,0))
	{
		return TRUE;
	};
};

func void dia_talas_buyjoints_info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Talas_BuyJoints_15_00");	//Pojďme obchodovat.
	AI_Output(self,other,"DIA_Talas_BuyJoints_05_01");	//Co ode mě potřebuješ? Nebo máš snad ty něco pro mě?
	B_GiveTradeInv(self);
};


instance DIA_TALAS_SEKTEHEILEN(C_Info)
{
	npc = sek_8012_talas;
	nr = 1;
	condition = dia_talas_sekteheilen_condition;
	information = dia_talas_sekteheilen_info;
	permanent = FALSE;
	description = "Napij se! Pomůže ti to od bolestí hlavy.";
};


func int dia_talas_sekteheilen_condition()
{
	if((Npc_HasItems(other,ItPo_HealObsession_MIS) > 0) && (MIS_SEKTEHEILEN == LOG_Running) && Npc_KnowsInfo(hero,dia_baalorun_sekteheilengot))
	{
		return TRUE;
	};
};

func void dia_talas_sekteheilen_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Talas_SekteHeilen_01_00");	//Napij se! Pomůže ti to od bolestí hlavy.
	B_GiveInvItems(other,self,ItPo_HealObsession_MIS,1);
	B_UseItem(self,ItPo_HealObsession_MIS);
	SEKTEHEILENCOUNT = SEKTEHEILENCOUNT + 1;
	AI_Output(self,other,"DIA_Talas_SekteHeilen_01_01");	//Hned se cítím lépe!
	AI_Output(self,other,"DIA_Talas_SekteHeilen_01_02");	//Děkuji ti moc.
};

