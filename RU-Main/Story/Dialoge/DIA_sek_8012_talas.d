
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
	AI_Output(self,other,"DIA_Talas_Greet_05_00");	//Подойди поближе! Здесь каждый новичок получает от меня подарок.
};


var int talas_rationday;

instance DIA_TALAS_GETGESCHENK(C_Info)
{
	npc = sek_8012_talas;
	nr = 1;
	condition = dia_talas_getgeschenk_condition;
	information = dia_talas_getgeschenk_info;
	permanent = FALSE;
	description = "Какой подарок?";
};


func int dia_talas_getgeschenk_condition()
{
	return TRUE;
};

func void dia_talas_getgeschenk_info()
{
	AI_Output(other,self,"DIA_Talas_GetGeschenk_15_00");	//Какой подарок?
	AI_Output(self,other,"DIA_Talas_GetGeschenk_05_01");	//Здесь три сигареты с болотником. Очень сильная вещь!
	AI_Output(self,other,"DIA_Talas_GetGeschenk_05_02");	//Ты сможешь брать у меня болотник каждый день, но если захочешь получить больше обычной порции, придется заплатить.
	AI_Output(self,other,"DIA_Talas_GetGeschenk_05_03");	//А если на дороге тебе попадутся какие-нибудь травы или ягоды, приноси их сюда. Я тебе заплачу.
	CreateInvItems(self,ItMi_Joint,3);
	B_GiveInvItems(self,other,ItMi_Joint,3);
	TALAS_RATIONDAY = Wld_GetDay();
	Log_CreateTopic(TOPIC_TRADERPSI,LOG_NOTE);
	B_LogEntry(TOPIC_TRADERPSI,"Таллас занимается скупкой ягод и трав, а также выдачей ежедневных порций болотника. Его прилавок стоит под алхимической лабораторией идола Тиона.");
};


instance DIA_TALAS_DAILYRATION(C_Info)
{
	npc = sek_8012_talas;
	nr = 3;
	condition = dia_talas_dailyration_condition;
	information = dia_talas_dailyration_info;
	permanent = 1;
	description = "Я пришел за своей дневной порцией болотника.";
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
	AI_Output(other,self,"DIA_Talas_DailyRation_15_00");	//Я пришел за своей дневной порцией болотника.
	if(TALAS_RATIONDAY != Wld_GetDay())
	{
		AI_Output(self,other,"DIA_Talas_DailyRation_05_01");	//Вот, возьми. Три сигареты с болотником - но не кури их все сразу!
		CreateInvItems(self,ItMi_Joint,3);
		B_GiveInvItems(self,other,ItMi_Joint,3);
		TALAS_RATIONDAY = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Talas_DailyRation_05_02");	//Сегодня ты уже получил свою порцию. Если хочешь еще, приходи завтра или купи что-нибудь.
	};
};


instance DIA_TALAS_BUYJOINTS(C_Info)
{
	npc = sek_8012_talas;
	nr = 4;
	condition = dia_talas_buyjoints_condition;
	information = dia_talas_buyjoints_info;
	permanent = TRUE;
	description = "Давай меняться.";
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

	AI_Output(other,self,"DIA_Talas_BuyJoints_15_00");	//Давай меняться.
	AI_Output(self,other,"DIA_Talas_BuyJoints_05_01");	//Что тебе от меня нужно? Или ты хочешь мне что-то продать?
	B_GiveTradeInv(self);
};


instance DIA_TALAS_SEKTEHEILEN(C_Info)
{
	npc = sek_8012_talas;
	nr = 1;
	condition = dia_talas_sekteheilen_condition;
	information = dia_talas_sekteheilen_info;
	permanent = FALSE;
	description = "Выпей напиток! Он помогает от головной боли.";
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
	AI_Output(other,self,"DIA_Talas_SekteHeilen_01_00");	//Выпей напиток! Он помогает от головной боли.
	B_GiveInvItems(other,self,ItPo_HealObsession_MIS,1);
	B_UseItem(self,ItPo_HealObsession_MIS);
	SEKTEHEILENCOUNT = SEKTEHEILENCOUNT + 1;
	AI_Output(self,other,"DIA_Talas_SekteHeilen_01_01");	//Я, кажется, стал чувствовать себя намного лучше!
	AI_Output(self,other,"DIA_Talas_SekteHeilen_01_02");	//Большое спасибо!
};

