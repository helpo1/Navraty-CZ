
instance DIA_NIXDOG_EXIT(C_Info)
{
	npc = nixdog;
	nr = 999;
	condition = dia_nixdog_exit_condition;
	information = dia_nixdog_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_nixdog_exit_condition()
{
	return TRUE;
};

func void dia_nixdog_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NIXDOG_HALLO(C_Info)
{
	npc = nixdog;
	nr = 1;
	condition = dia_nixdog_hallo_condition;
	information = dia_nixdog_hallo_info;
	permanent = FALSE;
	description = "Привет, Клык!";
};


func int dia_nixdog_hallo_condition()
{
	return TRUE;
};

func void dia_nixdog_hallo_info()
{
	AI_Output(other,self,"DIA_NixDog_Hallo_01_00");	//Привет, Клык!
	AI_Output(self,other,"DIA_NixDog_Hallo_01_01");	//...(виляет хвостом)
};


instance DIA_NIXDOG_KOMMMIT(C_Info)
{
	npc = nixdog;
	nr = 1;
	condition = dia_nixdog_kommmit_condition;
	information = dia_nixdog_kommmit_info;
	permanent = TRUE;
	description = "Идем со мной...";
};


func int dia_nixdog_kommmit_condition()
{
	var int daynow;
	daynow = Wld_GetDay();
	if((CLAWTIMERCLAWGOHUNT <= (daynow - 1)) && (self.aivar[AIV_PARTYMEMBER] == FALSE) && Npc_KnowsInfo(other,dia_nixdog_hallo) && (self.aivar[AIV_TAPOSITION] == FALSE) && (Npc_GetDistToWP(self,"NW_HUNTERCAMP_CLAW") < 1000))
	{
		return TRUE;
	};
};

func void dia_nixdog_kommmit_info()
{
	AI_Output(other,self,"DIA_NixDog_KommMit_01_00");	//Идем со мной...
	AI_Output(self,other,"DIA_NixDog_KommMit_01_01");	//...(виляет хвостом)
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	self.aivar[AIV_MM_RoamStart] = OnlyRoutine;
	self.aivar[AIV_MM_SleepStart] = 0;
	self.aivar[AIV_MM_SleepEnd] = 0;
	AI_StopProcessInfos(self);
};


instance DIA_NIXDOG_BECLOSE(C_Info)
{
	npc = nixdog;
	nr = 1;
	condition = dia_nixdog_beclose_condition;
	information = dia_nixdog_beclose_info;
	permanent = TRUE;
	description = "Держись рядом, Клык.";
};


func int dia_nixdog_beclose_condition()
{
	var int daynow;
	daynow = Wld_GetDay();
	if((CLAWTIMERCLAWGOHUNT <= (daynow - 1)) && (self.aivar[AIV_PARTYMEMBER] == TRUE) && Npc_KnowsInfo(other,dia_nixdog_hallo) && (self.aivar[AIV_TAPOSITION] == FALSE))
	{
		return TRUE;
	};
};

func void dia_nixdog_beclose_info()
{
	AI_Output(other,self,"DIA_NixDog_BeClose_01_00");	//Держись рядом.
	AI_Output(self,other,"DIA_NixDog_KommMit_01_01");	//...(виляет хвостом)
	self.senses_range = 300;
	AI_StopProcessInfos(self);
};


instance DIA_NIXDOG_ATTACK(C_Info)
{
	npc = nixdog;
	nr = 1;
	condition = dia_nixdog_attack_condition;
	information = dia_nixdog_attack_info;
	permanent = TRUE;
	description = "Вперед, Клык! Охотиться!";
};


func int dia_nixdog_attack_condition()
{
	var int daynow;
	daynow = Wld_GetDay();
	if((CLAWTIMERCLAWGOHUNT <= (daynow - 1)) && (self.aivar[AIV_PARTYMEMBER] == TRUE) && Npc_KnowsInfo(other,dia_nixdog_hallo) && (self.aivar[AIV_TAPOSITION] == FALSE))
	{
		return TRUE;
	};
};

func void dia_nixdog_attack_info()
{
	AI_Output(other,self,"DIA_NixDog_Attack_01_00");	//Вперед, Клык! Охотиться!
	AI_Output(self,other,"DIA_NixDog_KommMit_01_01");	//...(виляет хвостом)
	self.senses_range = 2000;
	AI_StopProcessInfos(self);
};


instance DIA_NIXDOG_WARTEHIER(C_Info)
{
	npc = nixdog;
	nr = 1;
	condition = dia_nixdog_wartehier_condition;
	information = dia_nixdog_wartehier_info;
	permanent = TRUE;
	description = "Оставайся тут.";
};


func int dia_nixdog_wartehier_condition()
{
	var int daynow;
	daynow = Wld_GetDay();

	if((CLAWTIMERCLAWGOHUNT <= (daynow - 1)) && (self.aivar[AIV_PARTYMEMBER] == TRUE) && Npc_KnowsInfo(other,dia_nixdog_hallo) && (self.aivar[AIV_TAPOSITION] == FALSE) && (Npc_GetDistToWP(self,"NW_HUNTERCAMP_CLAW") < 1000))
	{
		return TRUE;
	};
};

func void dia_nixdog_wartehier_info()
{
	AI_Output(other,self,"DIA_NixDog_WarteHier_01_00");	//Жди тут.
	AI_Output(self,other,"DIA_NixDog_WarteHier_01_01");	//...(виляет хвостом)
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	AI_StopProcessInfos(self);
	AI_GotoWP(self,"NW_HUNTERCAMP_CLAW");
	AI_AlignToWP(self);
	self.aivar[AIV_MM_SleepStart] = 1;
	self.aivar[AIV_MM_SleepEnd] = 23;
	self.aivar[AIV_MM_RoamStart] = 23;
	self.aivar[AIV_MM_RoamEnd] = 1;
	self.aivar[AIV_MM_SleepStart] = OnlyRoutine;
};

instance DIA_NIXDOG_GIVEMEAT(C_Info)
{
	npc = nixdog;
	nr = 1;
	condition = dia_nixdog_givemeat_condition;
	information = dia_nixdog_givemeat_info;
	permanent = TRUE;
	description = "(дать кусок мяса)";
};

func int dia_nixdog_givemeat_condition()
{
	var int daynow;
	daynow = Wld_GetDay();

	if((CLAWTIMERCLAWGOHUNT <= (daynow - 1)) && (self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX]) && (Npc_HasItems(hero,ItFoMuttonRaw) >= 1) && (self.aivar[AIV_PARTYMEMBER] == TRUE))
	{
		return TRUE;
	};
};

func void dia_nixdog_givemeat_info()
{
	AI_Output(other,self,"DIA_NixDog_GiveMeat_01_00");	//Эй, Клык! Держи...
	AI_PlayAni(other,"T_STAND_2_IDROP");
	Npc_RemoveInvItems(other,ItFoMuttonRaw,1);
	AI_Output(self,other,"DIA_NixDog_KommMit_01_01");	//...(виляет хвостом)
	AI_PlayAni(self,"T_STAND_2_EAT");

	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + 150;

	if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	};
};

//------------------------------оборотень--------------------------------------

instance DIA_Werewolf_EXIT(C_Info)
{
	npc = Werewolf;
	nr = 999;
	condition = DIA_Werewolf_exit_condition;
	information = DIA_Werewolf_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Werewolf_exit_condition()
{
	return TRUE;
};

func void DIA_Werewolf_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Werewolf_Hallo(C_Info)
{
	npc = Werewolf;
	nr = 1;
	condition = DIA_Werewolf_Hallo_condition;
	information = DIA_Werewolf_Hallo_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Werewolf_Hallo_condition()
{
	if(WereWolfIsHuman == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Werewolf_Hallo_info()
{
	B_GivePlayerXP(100);
	AI_Output(self,other,"DIA_Werewolf_Hallo_01_00");	//Рррр...(рычит) Погоди-ка... Я что, снова могу говорить? Невероятно...
	AI_Output(other,self,"DIA_Werewolf_Hallo_01_01");	//Как видишь! Или тебя это не устраивает?
	AI_Output(self,other,"DIA_Werewolf_Hallo_01_02");	//Кммм... Да нет! Так даже лучше. А то я уже устал от этого постоянного рыка.
	AI_Output(other,self,"DIA_Werewolf_Hallo_01_03");	//Извини, но это единственное, чем мы можем тебе помочь!
	AI_Output(other,self,"DIA_Werewolf_Hallo_01_04");	//К сожалению, вернуть тебе обратно человеческий облик уже вряд ли получится. 
	AI_Output(self,other,"DIA_Werewolf_Hallo_01_05");	//Проклятый Игнац...(злобно) Это все его эксперименты! Будь они неладны.
	AI_Output(other,self,"DIA_Werewolf_Hallo_01_06");	//Ну ладно тебе, с кем не бывает. Или тебе так плохо в шкуре мракориса?
	AI_Output(self,other,"DIA_Werewolf_Hallo_01_07");	//Да как сказать... В этом, конечно, есть свои плюсы.
	AI_Output(self,other,"DIA_Werewolf_Hallo_01_08");	//Вот только чертовы блохи достают. А так - вполне терпимо.
};

instance DIA_Werewolf_What(C_Info)
{
	npc = Werewolf;
	nr = 1;
	condition = DIA_Werewolf_What_condition;
	information = DIA_Werewolf_What_info;
	permanent = FALSE;
	description = "Что будешь делать?";
};

func int DIA_Werewolf_What_condition()
{
	if(Npc_KnowsInfo(other,DIA_Werewolf_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Werewolf_What_info()
{
	AI_Output(other,self,"DIA_Werewolf_What_01_00");	//Что будешь делать?
	AI_Output(self,other,"DIA_Werewolf_What_01_01");	//Пока поживу у Сагитты. Она хорошая... и кормит неплохо!
	AI_Output(other,self,"DIA_Werewolf_What_01_02");	//Ты только береги ее.
	AI_Output(self,other,"DIA_Werewolf_What_01_03");	//Конечно. Да и вряд ли кто-то полезет сюда, зная, что тут живет мракорис.
	AI_Output(other,self,"DIA_Werewolf_What_01_04");	//Это точно.
};

//-----------------------------------------------------------------------------------------

instance DIA_Crait_EXIT(C_Info)
{
	npc = Crait;
	nr = 999;
	condition = dia_Crait_exit_condition;
	information = dia_Crait_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int dia_Crait_exit_condition()
{
	return TRUE;
};

func void dia_Crait_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Crait_GIVEMEAT(C_Info)
{
	npc = Crait;
	nr = 1;
	condition = dia_Crait_givemeat_condition;
	information = dia_Crait_givemeat_info;
	permanent = TRUE;
	description = "(дать кусок мяса)";
};

func int dia_Crait_givemeat_condition()
{
	var int daynow;

	daynow = Wld_GetDay();

	if((self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX]) && (Npc_HasItems(hero,ItFoMuttonRaw) >= 1) && (self.aivar[AIV_PARTYMEMBER] == TRUE))
	{
		return TRUE;
	};
};

func void dia_Crait_givemeat_info()
{
	AI_PlayAni(other,"T_STAND_2_IDROP");
	Npc_RemoveInvItems(other,ItFoMuttonRaw,1);
	AI_PlayAni(self,"T_STAND_2_EAT");

	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + 300;

	if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	};
};