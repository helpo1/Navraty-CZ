
instance DIA_Pal_213_Schiffswache_EXIT(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 999;
	condition = DIA_Pal_213_Schiffswache_EXIT_Condition;
	information = DIA_Pal_213_Schiffswache_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Pal_213_Schiffswache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Pal_213_Schiffswache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


const string Pal_213_Checkpoint = "SHIP_DECK_09";

instance DIA_Pal_213_Schiffswache_FirstWarn(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 1;
	condition = DIA_Pal_213_Schiffswache_FirstWarn_Condition;
	information = DIA_Pal_213_Schiffswache_FirstWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Pal_213_Schiffswache_FirstWarn_Condition()
{
	if((MIS_ShipIsFree == FALSE) && (self.aivar[AIV_Guardpassage_Status] == GP_NONE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_FirstWarn_Info()
{
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_FirstWarn_01_00");	//Стой! Куда это ты идешь?
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_FirstWarn_15_01");	//Я хотел...
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Pal_213_Schiffswache_FirstWarn_01_02");	//Извини. Но тебе сюда нельзя.
	}
	else
	{
		AI_Output(self,other,"DIA_Pal_213_Schiffswache_FirstWarn_01_03");	//Здесь не на что смотреть. Иди своей дорогой.
	};
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,Pal_213_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
};


instance DIA_Pal_213_Schiffswache_SecondWarn(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 2;
	condition = DIA_Pal_213_Schiffswache_SecondWarn_Condition;
	information = DIA_Pal_213_Schiffswache_SecondWarn_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Pal_213_Schiffswache_SecondWarn_Condition()
{
	if((MIS_ShipIsFree == FALSE) && (self.aivar[AIV_Guardpassage_Status] == GP_FirstWarnGiven) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,Pal_213_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_SecondWarn_Info()
{
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Pal_213_Schiffswache_SecondWarn_01_00");	//Ни шагу дальше. Исключений нет ни для кого.
	}
	else
	{
		AI_Output(self,other,"DIA_Pal_213_Schiffswache_SecondWarn_01_01");	//Ты же не хочешь ЗАСТАВИТЬ меня ударить тебя, правда?
	};
	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other,Pal_213_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;
	AI_StopProcessInfos(self);
};


instance DIA_Pal_213_Schiffswache_Attack(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 3;
	condition = DIA_Pal_213_Schiffswache_Attack_Condition;
	information = DIA_Pal_213_Schiffswache_Attack_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Pal_213_Schiffswache_Attack_Condition()
{
	if((MIS_ShipIsFree == FALSE) && (self.aivar[AIV_Guardpassage_Status] == GP_SecondWarnGiven) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,Pal_213_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,1);
};


instance DIA_Pal_213_Schiffswache_GoOnBoard(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 5;
	condition = DIA_Pal_213_Schiffswache_GoOnBoard_Condition;
	information = DIA_Pal_213_Schiffswache_GoOnBoard_Info;
	permanent = FALSE;
	description = "Я хочу попасть на борт корабля.";
};


func int DIA_Pal_213_Schiffswache_GoOnBoard_Condition()
{
	return TRUE;
};

func void DIA_Pal_213_Schiffswache_GoOnBoard_Info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_GoOnBoard_15_00");	//Я хочу попасть на борт корабля.
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_GoOnBoard_01_01");	//Никому не позволено входить на корабль! У меня есть приказ!
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_GoOnBoard_01_02");	//Я должен убить всякого, кто войдет на корабль без соответствующего разрешения.
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_GoOnBoard_01_03");	//Во имя Инноса, я буду защищать этот корабль даже ценой своей жизни.
};


instance DIA_Pal_213_Schiffswache_IAmKDF(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 6;
	condition = DIA_Pal_213_Schiffswache_IAmKDF_Condition;
	information = DIA_Pal_213_Schiffswache_IAmKDF_Info;
	permanent = FALSE;
	description = "Ты сомневаешься в намерениях Мага Огня?";
};


func int DIA_Pal_213_Schiffswache_IAmKDF_Condition()
{
	if((hero.guild == GIL_KDF) && Npc_KnowsInfo(other,DIA_Pal_213_Schiffswache_GoOnBoard))
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_IAmKDF_Info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDF_15_00");	//Ты сомневаешься в намерениях мага Огня?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF_01_01");	//Нет, конечно же, нет...(замявшись) Да простит меня Иннос!
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF_01_02");	//Маги Огня - стражи мудрости Инноса!
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF_01_03");	//Тот, кто сомневается в них, сомневается в Инносе и не заслуживает пощады.
};


instance DIA_Pal_213_Schiffswache_IAmKDF2(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 6;
	condition = DIA_Pal_213_Schiffswache_IAmKDF2_Condition;
	information = DIA_Pal_213_Schiffswache_IAmKDF2_Info;
	permanent = FALSE;
	description = "Что будет, если я взойду на борт?";
};


func int DIA_Pal_213_Schiffswache_IAmKDF2_Condition()
{
	if((hero.guild == GIL_KDF) && Npc_KnowsInfo(other,DIA_Pal_213_Schiffswache_IAmKDF))
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_IAmKDF2_Info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDF2_15_00");	//Что будет, если я взойду на борт?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF2_01_01");	//Я должен убить...(нервно) Я хочу сказать, остановить тебя.
};


instance DIA_Pal_213_Schiffswache_IAmKDF3(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 6;
	condition = DIA_Pal_213_Schiffswache_IAmKDF3_Condition;
	information = DIA_Pal_213_Schiffswache_IAmKDF3_Info;
	permanent = FALSE;
	description = "Ты осмелишься атаковать Мага Огня?";
};


func int DIA_Pal_213_Schiffswache_IAmKDF3_Condition()
{
	if((hero.guild == GIL_KDF) && Npc_KnowsInfo(other,DIA_Pal_213_Schiffswache_IAmKDF2))
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_IAmKDF3_Info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDF3_15_00");	//Ты осмелишься атаковать мага Огня?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF3_01_01");	//Я никогда не подниму руку на мага.
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDF3_15_02");	//Так что ты все-таки будешь делать, если я взойду на борт?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF3_01_03");	//Ничего, господин...(робко) 
};


instance DIA_Pal_213_Schiffswache_IAmKDF4(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 6;
	condition = DIA_Pal_213_Schiffswache_IAmKDF4_Condition;
	information = DIA_Pal_213_Schiffswache_IAmKDF4_Info;
	permanent = FALSE;
	description = "Тогда я сейчас взойду на борт.";
};


func int DIA_Pal_213_Schiffswache_IAmKDF4_Condition()
{
	if((hero.guild == GIL_KDF) && Npc_KnowsInfo(other,DIA_Pal_213_Schiffswache_IAmKDF3))
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_IAmKDF4_Info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDF4_15_00");	//Тогда я сейчас взойду на борт.
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF4_01_01");	//Ты не должен делать этого, приказы лорда Хагена были вполне конкретными.
};


instance DIA_Pal_213_Schiffswache_IAmKDF5(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 6;
	condition = DIA_Pal_213_Schiffswache_IAmKDF5_Condition;
	information = DIA_Pal_213_Schiffswache_IAmKDF5_Info;
	permanent = FALSE;
	description = "Приказы лорда Хагена касаются и меня тоже?";
};


func int DIA_Pal_213_Schiffswache_IAmKDF5_Condition()
{
	if((hero.guild == GIL_KDF) && Npc_KnowsInfo(other,DIA_Pal_213_Schiffswache_IAmKDF4))
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_IAmKDF5_Info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDF5_15_00");	//Приказы лорда Хагена касаются и меня тоже?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF5_01_01");	//Я не знаю.
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDF5_15_02");	//Сам подумай - разве лорд Хаген осмелился бы подозревать мага в воровстве?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF5_01_03");	//Я в это не верю.
};


instance DIA_Pal_213_Schiffswache_IAmKDF6(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 6;
	condition = DIA_Pal_213_Schiffswache_IAmKDF6_Condition;
	information = DIA_Pal_213_Schiffswache_IAmKDF6_Info;
	permanent = FALSE;
	description = "Тогда позволь мне взойти на корабль!";
};


func int DIA_Pal_213_Schiffswache_IAmKDF6_Condition()
{
	if((hero.guild == GIL_KDF) && Npc_KnowsInfo(other,DIA_Pal_213_Schiffswache_IAmKDF5))
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_IAmKDF6_Info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDF6_15_00");	//Тогда позволь мне взойти на корабль!
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF6_01_01");	//Хорошо! Ты можешь пройти на корабль.

	if(RhetorikSkillValue[1] < 100)
	{
		RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
		AI_Print("Риторика + 1");
	};

	MIS_ShipIsFree = TRUE;
	B_StartOtherRoutine(Girion,"WaitForShip");
};


instance DIA_PAL_213_SCHIFFSWACHE_IAMKDW(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 6;
	condition = dia_pal_213_schiffswache_iamkdw_condition;
	information = dia_pal_213_schiffswache_iamkdw_info;
	permanent = FALSE;
	description = "Ты поднимешь свой меч на мага Воды?";
};


func int dia_pal_213_schiffswache_iamkdw_condition()
{
	if((hero.guild == GIL_KDW) && Npc_KnowsInfo(other,DIA_Pal_213_Schiffswache_GoOnBoard))
	{
		return TRUE;
	};
};

func void dia_pal_213_schiffswache_iamkdw_info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDW_15_00");	//Ты поднимешь свой меч на мага Воды?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDW_01_01");	//Нет, конечно нет! (нервно) Аданос простит меня!
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDW_01_02");	//Убийство служителя Воды - жуткое преступление...(нервно) Тот, кто это сделал, заслуживает только смерти!
};


instance DIA_PAL_213_SCHIFFSWACHE_IAMKDW2(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 6;
	condition = dia_pal_213_schiffswache_iamkdw2_condition;
	information = dia_pal_213_schiffswache_iamkdw2_info;
	permanent = FALSE;
	description = "Что случится, если я зайду на борт?";
};


func int dia_pal_213_schiffswache_iamkdw2_condition()
{
	if((hero.guild == GIL_KDW) && Npc_KnowsInfo(other,dia_pal_213_schiffswache_iamkdw))
	{
		return TRUE;
	};
};

func void dia_pal_213_schiffswache_iamkdw2_info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDW2_15_00");	//Что случится, если я поднимусь на борт?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDW2_01_01");	//Я убью тебя...(нервно) я имею в виду - остановлю.
};


instance DIA_PAL_213_SCHIFFSWACHE_IAMKDW3(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 6;
	condition = dia_pal_213_schiffswache_iamkdw3_condition;
	information = dia_pal_213_schiffswache_iamkdw3_info;
	permanent = FALSE;
	description = "И если я взойду, ты возьмешь на себя этот грех?";
};


func int dia_pal_213_schiffswache_iamkdw3_condition()
{
	if((hero.guild == GIL_KDW) && Npc_KnowsInfo(other,dia_pal_213_schiffswache_iamkdw2))
	{
		return TRUE;
	};
};

func void dia_pal_213_schiffswache_iamkdw3_info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDW3_15_00");	//И если я взойду, ты возьмешь на себя этот грех?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDW3_01_01");	//Я никогда бы не поднял руку на мага.
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDW3_15_02");	//Ну, так что ты сделаешь, если я взойду на борт?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDW3_01_03");	//(тихо) Ничего.
};


instance DIA_PAL_213_SCHIFFSWACHE_IAMKDW4(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 6;
	condition = dia_pal_213_schiffswache_iamkdw4_condition;
	information = dia_pal_213_schiffswache_iamkdw4_info;
	permanent = FALSE;
	description = "Тогда я захожу на борт.";
};


func int dia_pal_213_schiffswache_iamkdw4_condition()
{
	if((hero.guild == GIL_KDW) && Npc_KnowsInfo(other,dia_pal_213_schiffswache_iamkdw3))
	{
		return TRUE;
	};
};

func void dia_pal_213_schiffswache_iamkdw4_info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDW4_15_00");	//Тогда я захожу на борт.
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDW4_01_01");	//Хорошо...(обреченно) Но прошу тебя, никому об этом не рассказывай!

	if(RhetorikSkillValue[1] < 100)
	{
		RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
		AI_Print("Риторика + 1");
	};

	MIS_ShipIsFree = TRUE;
	B_StartOtherRoutine(Girion,"WaitForShip");
};


instance DIA_PAL_213_SCHIFFSWACHE_IAMKDM(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 6;
	condition = dia_pal_213_schiffswache_iamkdm_condition;
	information = dia_pal_213_schiffswache_iamkdm_info;
	permanent = FALSE;
	description = "Паладин, ты знаешь, кому я служу?";
};


func int dia_pal_213_schiffswache_iamkdm_condition()
{
	if((hero.guild == GIL_KDM) && Npc_KnowsInfo(other,DIA_Pal_213_Schiffswache_GoOnBoard))
	{
		return TRUE;
	};
};

func void dia_pal_213_schiffswache_iamkdm_info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDM_15_00");	//Паладин, ты знаешь, кому я служу?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDM_01_01");	//Да, я догадываюсь. Ты же некромант, я прав? Прихвостень Белиара! (с презрением)
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDM_01_02");	//И как думаешь, что он сделает, если ты осмелишься поднять свой меч против его слуги?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDM_01_03");	//Что, попытается убить меня? (смеется)
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDM_01_04");	//Я не боюсь его, некромант! Я готов принести свою жизнь во славу Инноса ради его великой цели!
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDM_01_05");	//А готов ли ты принести свою душу в его славу?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDM_01_06");	//Что?!
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDM_01_07");	//Я спрашиваю, готов ли ты пожертвовать своей душой ради этого дела?
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDM_01_08");	//Ты, глупец, подумал, что мой бог решит отнять у тебя твою жизнь. Поверь, она ему не нужна!
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDM_01_09");	//Ты знаешь, что он сделает? Он проклянет тебя, паладин!
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDM_01_10");	//И ты, после своей смерти, станешь его слугой. И не будет твоей душе покоя никогда!
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDM_01_11");	//Или ты никогда не слышал про обращенных паладинов? Как ты думаешь, почему все они после своей смерти стали служить Белиару?
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDM_01_12");	//Да потому что тот, кто покушается на жизнь слуги Темного Бога, не имея на то веской причины - по его воле сам станет таким же!
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDM_01_13");	//И даже твой жалкий бог не сможет тебе помочь!
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDM_01_14");	//Нет...(нервно) Только не это!
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDM_01_15");	//Тогда просто впусти меня на корабль, и будем считать, что инцидент исчерпан.
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDM_01_16");	//(сквозь зубы) Хорошо, ты можешь пройти.
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDM_01_17");	//Спасибо, ты очень любезен.

	if(RhetorikSkillValue[1] < 100)
	{
		RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
		AI_Print("Риторика + 1");
	};

	MIS_ShipIsFree = TRUE;
	B_StartOtherRoutine(Girion,"WaitForShip");
};


instance DIA_Pal_213_Schiffswache_IAmPAL(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 6;
	condition = DIA_Pal_213_Schiffswache_IAmPAL_Condition;
	information = DIA_Pal_213_Schiffswache_IAmPAL_Info;
	permanent = FALSE;
	description = "Ты не доверяешь мне, рыцарь?";
};


func int DIA_Pal_213_Schiffswache_IAmPAL_Condition()
{
	if((hero.guild == GIL_PAL) && Npc_KnowsInfo(other,DIA_Pal_213_Schiffswache_GoOnBoard))
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_IAmPAL_Info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmPAL_15_00");	//Ты не доверяешь мне, рыцарь?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmPAL_01_01");	//Никак нет, я просто выполняю приказ.
};


instance DIA_Pal_213_Schiffswache_IAmPAL2(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 6;
	condition = DIA_Pal_213_Schiffswache_IAmPAL2_Condition;
	information = DIA_Pal_213_Schiffswache_IAmPAL2_Info;
	permanent = FALSE;
	description = "Тогда ты должен знать, кто из нас выше званием.";
};


func int DIA_Pal_213_Schiffswache_IAmPAL2_Condition()
{
	if((hero.guild == GIL_PAL) && Npc_KnowsInfo(other,DIA_Pal_213_Schiffswache_IAmPAL))
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_IAmPAL2_Info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmPAL2_15_00");	//Тогда ты должен знать, кто из нас выше званием.
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmPAL2_01_01");	//Так точно!
};


instance DIA_Pal_213_Schiffswache_IAmPAL3(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 6;
	condition = DIA_Pal_213_Schiffswache_IAmPAL3_Condition;
	information = DIA_Pal_213_Schiffswache_IAmPAL3_Info;
	permanent = FALSE;
	description = "Я приказываю тебе пропустить меня на этот корабль.";
};


func int DIA_Pal_213_Schiffswache_IAmPAL3_Condition()
{
	if((hero.guild == GIL_PAL) && Npc_KnowsInfo(other,DIA_Pal_213_Schiffswache_IAmPAL2))
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_IAmPAL3_Info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmPAL3_15_00");	//И я приказываю тебе пропустить меня на этот корабль.
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmPAL3_01_01");	//Есть, сэр, вы можете взойти на корабль.

	if(RhetorikSkillValue[1] < 100)
	{
		RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
		AI_Print("Риторика + 1");
	};

	MIS_ShipIsFree = TRUE;
	B_StartOtherRoutine(Girion,"WaitForShip");
};


instance DIA_Pal_213_Schiffswache_IAmDJG(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 6;
	condition = DIA_Pal_213_Schiffswache_IAmDJG_Condition;
	information = DIA_Pal_213_Schiffswache_IAmDJG_Info;
	permanent = FALSE;
	description = "А этот вопрос нельзя как-нибудь решить?";
};


func int DIA_Pal_213_Schiffswache_IAmDJG_Condition()
{
	if((hero.guild == GIL_DJG) && Npc_KnowsInfo(other,DIA_Pal_213_Schiffswache_GoOnBoard))
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_IAmDJG_Info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmDJG_15_00");	//А этот вопрос нельзя как-нибудь решить?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmDJG_01_01");	//Я не понимаю.
};


instance DIA_Pal_213_Schiffswache_IAmDJG2(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 6;
	condition = DIA_Pal_213_Schiffswache_IAmDJG2_Condition;
	information = DIA_Pal_213_Schiffswache_IAmDJG2_Info;
	permanent = FALSE;
	description = "Я могу дать тебе денег.";
};


func int DIA_Pal_213_Schiffswache_IAmDJG2_Condition()
{
	if((hero.guild == GIL_DJG) && Npc_KnowsInfo(other,DIA_Pal_213_Schiffswache_IAmDJG) && (MIS_ShipIsFree == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_IAmDJG2_Info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmDJG2_15_00");	//Я могу дать тебе денег. За то, что ты будешь смотреть в другую сторону.
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmDJG2_01_01");	//Меня нельзя подкупить, и если ты сейчас не исчезнешь, я сочту это оскорблением.
};


instance DIA_Pal_213_Schiffswache_IAmDJG3(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 6;
	condition = DIA_Pal_213_Schiffswache_IAmDJG3_Condition;
	information = DIA_Pal_213_Schiffswache_IAmDJG3_Info;
	permanent = FALSE;
	description = "У меня письменное разрешение.";
};

func int DIA_Pal_213_Schiffswache_IAmDJG3_Condition()
{
	if(hero.guild == GIL_DJG)
	{
		if(Npc_KnowsInfo(other,DIA_Pal_213_Schiffswache_IAmDJG) && (Npc_HasItems(other,ITWr_ForgedShipLetter_MIS) >= 1))
		{
			return TRUE;
		};
	};
	if((hero.guild == GIL_SEK) || (hero.guild == GIL_TPL) || (hero.guild == GIL_GUR))
	{
		if(Npc_KnowsInfo(other,DIA_Pal_213_Schiffswache_GoOnBoard) && (Npc_HasItems(other,ITWr_ForgedShipLetter_MIS) >= 1))
		{
			return TRUE;
		};
	};
};

func void DIA_Pal_213_Schiffswache_IAmDJG3_Info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmDJG3_15_00");	//У меня письменное разрешение. Я уполномочен взойти на этот корабль.
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmDJG3_01_01");	//Дай я взгляну.
	B_GiveInvItems(other,self,ITWr_ForgedShipLetter_MIS,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmDJG3_01_02");	//Все правильно, ты можешь пройти.
	MIS_ShipIsFree = TRUE;
	B_StartOtherRoutine(Girion,"WaitForShip");
};

instance DIA_Pal_213_Schiffswache_Rats(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 6;
	condition = DIA_Pal_213_Schiffswache_Rats_Condition;
	information = DIA_Pal_213_Schiffswache_Rats_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Pal_213_Schiffswache_Rats_Condition()
{
	if((MIS_ShipIsFree == TRUE) && ((Npc_IsDead(Ship_Rat_01) == FALSE) || (Npc_IsDead(Ship_Rat_02) == FALSE) || (Npc_IsDead(Ship_Rat_03) == FALSE) || (Npc_IsDead(Ship_Rat_04) == FALSE) || (Npc_IsDead(Ship_Rat_05) == FALSE) || (Npc_IsDead(Ship_Rat_06) == FALSE)))
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_Rats_Info()
{
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_Rats_01_00");	//Постой! Раз уж ты прошел на корабль, то у меня к тебе будет одна просьба.
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_Rats_01_01");	//Что еще такое?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_Rats_01_02");	//Эти чертовы крысы просто сводят меня с ума.
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_Rats_01_03");	//Крысы?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_Rats_01_04");	//Да, крысы. (раздраженно) Обыкновенные корабельные крысы!
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_Rats_01_05");	//Каждую ночь эти маленькие паразиты, ползая в трюме корабля, создают жуткий шум и возню.
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_Rats_01_06");	//Мы тут с напарником стоим на посту, а дело это совсем не легкое.
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_Rats_01_07");	//В особенности, когда ты постоянно в напряжении от каждого шороха.
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_Rats_01_08");	//А эти крысы, будь они прокляты, мешают нам сосредоточится!
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_Rats_01_09");	//Будь добр, позаботься о них.
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_Rats_01_10");	//А почему бы тебе не сделать это самому?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_Rats_01_11");	//Я тебе уже сказал, что стою на посту. И покидать его я не имею права!
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_Rats_01_12");	//Другое дело - ты. (серьезно) Что скажешь?
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_Rats_01_13");	//Ладно, я загляну в трюм.
	MIS_SchiffswacheRats = LOG_Running;
	Log_CreateTopic(TOPIC_SchiffswacheRats,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SchiffswacheRats,LOG_Running);
	B_LogEntry(TOPIC_SchiffswacheRats,"Охранник корабля пожаловался, что каждую ночь крысы внутри трюма создают слишком много шума. Он попросил меня разделаться с ними.");
};

instance DIA_Pal_213_Schiffswache_Rats_Done(C_Info)
{
	npc = PAL_213_Schiffswache;
	nr = 6;
	condition = DIA_Pal_213_Schiffswache_Rats_Done_Condition;
	information = DIA_Pal_213_Schiffswache_Rats_Done_Info;
	permanent = FALSE;
	description = "С крысами покончено.";
};

func int DIA_Pal_213_Schiffswache_Rats_Done_Condition()
{
	if((MIS_SchiffswacheRats == LOG_Running) && (Npc_IsDead(Ship_Rat_01) == TRUE) && (Npc_IsDead(Ship_Rat_02) == TRUE) && (Npc_IsDead(Ship_Rat_03) == TRUE) && (Npc_IsDead(Ship_Rat_04) == TRUE) && (Npc_IsDead(Ship_Rat_05) == TRUE) && (Npc_IsDead(Ship_Rat_06) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Pal_213_Schiffswache_Rats_Done_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_Rats_Done_01_00");	//С крысами покончено.
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_Rats_Done_01_01");	//Надеюсь, ты их всех перебил?
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_Rats_Done_01_02");	//Всех до единой.
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_Rats_Done_01_03");	//Хорошо. (вздыхая) Наконец-то ночью будет тихо. Благодарю тебя!
	MIS_SchiffswacheRats = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_SchiffswacheRats,LOG_SUCCESS);
};