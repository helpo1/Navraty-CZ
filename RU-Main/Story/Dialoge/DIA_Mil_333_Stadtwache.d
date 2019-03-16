
instance DIA_Mil_333_Stadtwache_EXIT(C_Info)
{
	npc = Mil_333_Stadtwache;
	nr = 999;
	condition = DIA_Mil_333_Stadtwache_EXIT_Condition;
	information = DIA_Mil_333_Stadtwache_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Mil_333_Stadtwache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Mil_333_Stadtwache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


const string Mil_333_Checkpoint = "NW_CITY_MERCHANT_PATH_29";

var int MIL_333_Personal_AbsolutionLevel;

instance DIA_Mil_333_Stadtwache_FirstWarn(C_Info)
{
	npc = Mil_333_Stadtwache;
	nr = 1;
	condition = DIA_Mil_333_Stadtwache_FirstWarn_Condition;
	information = DIA_Mil_333_Stadtwache_FirstWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Mil_333_Stadtwache_FirstWarn_Condition()
{
	if((B_GetGreatestPetzCrime(self) >= CRIME_ATTACK) && (B_GetCurrentAbsolutionLevel(self) == MIL_333_Personal_AbsolutionLevel))
	{
		self.aivar[AIV_PASSGATE] = FALSE;
	}
	else if(Mil_333_schonmalreingelassen == TRUE)
	{
		CITYGATEACCESSGRANTED = TRUE;
		self.aivar[AIV_PASSGATE] = TRUE;
	};
	if((self.aivar[AIV_Guardpassage_Status] == GP_NONE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Mil_333_Stadtwache_FirstWarn_Info()
{
	var C_Item itm;
	AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_00");	//СТОЙ!

	if(B_GetGreatestPetzCrime(self) >= CRIME_ATTACK)
	{
		AI_Output(other,self,"DIA_Mil_333_Stadtwache_FirstWarn_15_01");	//(вздыхает) Что еще?
		AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_02");	//Ты прекрасно знаешь, что!

		if(B_GetGreatestPetzCrime(self) == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_03");	//Ты разыскиваешься за убийство в городе!
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_THEFT)
		{
			AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_04");	//Мы не потерпим здесь грязных воров!
		};
		if(B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
		{
			AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_05");	//Нам не нужны смутьяны в городе!
		};

		AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_06");	//С чего ты взял, что мы должны впустить тебя?
	}
	else
	{
		itm = Npc_GetEquippedArmor(other);

		if((hero.guild == GIL_NONE) && ((Npc_HasEquippedArmor(other) == FALSE) || Hlp_IsItem(itm,ITAR_Her_M) || Hlp_IsItem(itm,ITAR_prisonel) || Hlp_IsItem(itm,ITAR_Her_N) || Hlp_IsItem(itm,ITAR_Prisoner) || Hlp_IsItem(itm,itar_sekbed)))
		{
			AI_Output(other,self,"DIA_Mil_333_Stadtwache_FirstWarn_15_07");	//Да?
			AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_08");	//Ты похож на нищего! В этом городе нам не нужны люди, у которых нет денег.

			if(Npc_HasItems(other,ItWr_Passierschein))
			{
				AI_Output(other,self,"DIA_Mil_333_Stadtwache_FirstWarn_15_09");	//Но у меня есть пропуск!
				AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_10");	//Он годен только для других ворот!
			};
			if(Npc_KnowsInfo(other,DIA_Mil_310_Stadtwache_MilizWerden))
			{
				AI_Output(other,self,"DIA_Mil_333_Stadtwache_FirstWarn_15_11");	//Но я хочу вступить в городскую стражу!
				AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_12");	//Ха! Не смеши меня! Иди к другим воротам и попробуй рассказать это там.
				AI_Output(other,self,"DIA_Mil_333_Stadtwache_FirstWarn_15_13");	//Я уже был там, они отправили меня сюда.
				AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_14");	//(грязный смех) Ох, парень! Они всегда посылают к нам сливки общества...
			};
		}
		else
		{
			AI_Output(other,self,"DIA_Mil_333_Stadtwache_FirstWarn_15_15");	//(Спокойно) Что?
			AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_16");	//Только хотел тебя рассмотреть. Мда, кажется, у тебя водятся деньги. Проходи!
			CITYGATEACCESSGRANTED = TRUE;
			self.aivar[AIV_PASSGATE] = TRUE;
			Stadtwache_310.aivar[AIV_PASSGATE] = TRUE;
			Mil_333_schonmalreingelassen = TRUE;
			AI_StopProcessInfos(self);
		};
	};

	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,Mil_333_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
};


instance DIA_Mil_333_Stadtwache_SecondWarn(C_Info)
{
	npc = Mil_333_Stadtwache;
	nr = 2;
	condition = DIA_Mil_333_Stadtwache_SecondWarn_Condition;
	information = DIA_Mil_333_Stadtwache_SecondWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Mil_333_Stadtwache_SecondWarn_Condition()
{
	if((self.aivar[AIV_Guardpassage_Status] == GP_FirstWarnGiven) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,Mil_333_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_Mil_333_Stadtwache_SecondWarn_Info()
{
	AI_Output(self,other,"DIA_Mil_333_Stadtwache_SecondWarn_06_00");	//У тебя со слухом все в порядке? Еще один шаг, и ты познакомишься с моим мечом!
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,Mil_333_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;
	AI_StopProcessInfos(self);
};

instance DIA_Mil_333_Stadtwache_Attack(C_Info)
{
	npc = Mil_333_Stadtwache;
	nr = 3;
	condition = DIA_Mil_333_Stadtwache_Attack_Condition;
	information = DIA_Mil_333_Stadtwache_Attack_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Mil_333_Stadtwache_Attack_Condition()
{
	if((self.aivar[AIV_Guardpassage_Status] == GP_SecondWarnGiven) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,Mil_333_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_Mil_333_Stadtwache_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;
	AI_Output(self,other,"DIA_Mil_333_Stadtwache_Attack_06_00");	//Ты сам напросился...
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,0);
};

instance DIA_Mil_333_Stadtwache_PERM(C_Info)
{
	npc = Mil_333_Stadtwache;
	nr = 5;
	condition = DIA_Mil_333_Stadtwache_PERM_Condition;
	information = DIA_Mil_333_Stadtwache_PERM_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Mil_333_Stadtwache_PERM_Condition()
{
	if((self.aivar[AIV_PASSGATE] == TRUE) && (MIS_KILLIGNAZ != LOG_Running) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Mil_333_Stadtwache_PERM_Info()
{
	AI_Output(self,other,"DIA_Mil_333_Stadtwache_PERM_06_00");	//Проходи!
	AI_StopProcessInfos(self);
};

instance DIA_MIL_333_STADTWACHE_KILLIGNAZ(C_Info)
{
	npc = Mil_333_Stadtwache;
	nr = 5;
	condition = dia_mil_333_stadtwache_killignaz_condition;
	information = dia_mil_333_stadtwache_killignaz_info;
	permanent = FALSE;
	description = "Ты тут все замечаешь?";
};

func int dia_mil_333_stadtwache_killignaz_condition()
{
	if((MIS_KILLIGNAZ == LOG_Running) && (READORTEGO == FALSE) && (HELPKILLIGNAZ == TRUE))
	{
		return TRUE;
	};
};

func void dia_mil_333_stadtwache_killignaz_info()
{
	AI_Output(other,self,"DIA_Mil_333_Stadtwache_KillIgnaz_01_00");	//Ты тут все замечаешь?
	AI_Output(self,other,"DIA_Mil_333_Stadtwache_KillIgnaz_01_01");	//Это ты у меня спаршиваешь? Парень, я сюда для того и поставлен, чтобы за всем следить.
	AI_Output(self,other,"DIA_Mil_333_Stadtwache_KillIgnaz_01_02");	//Хотя, по правде говоря, сейчас работы стало совсем мало. Следить особо не за чем.
	AI_Output(other,self,"DIA_Mil_333_Stadtwache_KillIgnaz_01_03");	//Почему?
	AI_Output(self,other,"DIA_Mil_333_Stadtwache_KillIgnaz_01_04");	//Потому, что в последнее время никто особо и не спешит покидать пределы города.
	AI_Output(self,other,"DIA_Mil_333_Stadtwache_KillIgnaz_01_05");	//Нынче снаружи стало слишком опасно! Хотя, бывает, и попадаются смельчаки...(ухмыляясь)
	AI_Output(other,self,"DIA_Mil_333_Stadtwache_KillIgnaz_01_06");	//Кого ты имеешь в виду?
	AI_Output(self,other,"DIA_Mil_333_Stadtwache_KillIgnaz_01_07");	//Да тут вот недавно проходил один какой-то парень. Вышел из города и прямиком направился вон туда, в сторону маяка.
	AI_Output(self,other,"DIA_Mil_333_Stadtwache_KillIgnaz_01_08");	//Кстати, поговаривают, что там нынче обосновались бандиты. Вот я ему не позавидую, если он наткнется на них!
	AI_StopProcessInfos(self);
	Wld_InsertNpc(vlk_6150_ortego,"NW_CITY_SMFOREST_BANDIT_02");
};