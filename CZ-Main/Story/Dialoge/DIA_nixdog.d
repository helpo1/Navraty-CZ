
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
	description = "Ahoj, Tlamo!";
};


func int dia_nixdog_hallo_condition()
{
	return TRUE;
};

func void dia_nixdog_hallo_info()
{
	AI_Output(other,self,"DIA_NixDog_Hallo_01_00");	//Ahoj, Tlamo!
	AI_Output(self,other,"DIA_NixDog_Hallo_01_01");	//... (vrtí ocasem)
};


instance DIA_NIXDOG_KOMMMIT(C_Info)
{
	npc = nixdog;
	nr = 1;
	condition = dia_nixdog_kommmit_condition;
	information = dia_nixdog_kommmit_info;
	permanent = TRUE;
	description = "Pojď se mnou...";
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
	AI_Output(other,self,"DIA_NixDog_KommMit_01_00");	//Pojď se mnou...
	AI_Output(self,other,"DIA_NixDog_KommMit_01_01");	//... (vrtí ocasem)
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
	description = "Drž se při mně, Tlamo.";
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
	AI_Output(other,self,"DIA_NixDog_BeClose_01_00");	//Drž se při mně, Tlamo.
	AI_Output(self,other,"DIA_NixDog_KommMit_01_01");	//... (vrtí ocasem)
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
	description = "Vpřed, Tlamo! Jdi lovit!";
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
	AI_Output(other,self,"DIA_NixDog_Attack_01_00");	//Vpřed, Tlamo! Jdi lovit!
	AI_Output(self,other,"DIA_NixDog_KommMit_01_01");	//... (vrtí ocasem)
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
	description = "Zůstaň tady.";
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
	AI_Output(other,self,"DIA_NixDog_WarteHier_01_00");	//Zůstaň tady.
	AI_Output(self,other,"DIA_NixDog_WarteHier_01_01");	//... (vrtí ocasem)
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
	description = "(dát kus masa)";
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
	AI_Output(other,self,"DIA_NixDog_GiveMeat_01_00");	//Hej, Tlamo! Zůstaň...
	AI_PlayAni(other,"T_STAND_2_IDROP");
	Npc_RemoveInvItems(other,ItFoMuttonRaw,1);
	AI_Output(self,other,"DIA_NixDog_KommMit_01_01");	//... (vrtí ocasem)
	AI_PlayAni(self,"T_STAND_2_EAT");

	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + 150;

	if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	};
};

//------------------------------oboroten'--------------------------------------

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
	AI_Output(self,other,"DIA_Werewolf_Hallo_01_00");	//Rrrr... (vrčí) Počkat... Já mluvím, já opět mluvím? Neuvěřitelné...
	AI_Output(other,self,"DIA_Werewolf_Hallo_01_01");	//Jak vidíš! Nebo se ti to snad nelíbí?
	AI_Output(self,other,"DIA_Werewolf_Hallo_01_02");	//Hmm... to tedy ne! Tohle je o moc lepší. To neustálé vrčení mě už unavovalo.
	AI_Output(other,self,"DIA_Werewolf_Hallo_01_03");	//Promiň, ale víc toho pro tebe už nemůžeme udělat!
	AI_Output(other,self,"DIA_Werewolf_Hallo_01_04");	//Tvůj návrat do lidské formy by měl naneštěstí jen velmi malou šanci na úspěch.
	AI_Output(self,other,"DIA_Werewolf_Hallo_01_05");	//Zatracený Ignaz... (naštvaně) Za všechno můžou ty jeho experimenty! Žádný nikdy nevyjde.
	AI_Output(other,self,"DIA_Werewolf_Hallo_01_06");	//Ale choď! To se stane každému. Nebo je ti v kůži stínové šelmy opravdu tak špatně?
	AI_Output(self,other,"DIA_Werewolf_Hallo_01_07");	//Jak říkáš... Má to samozřejmě i svoje výhody.
	AI_Output(self,other,"DIA_Werewolf_Hallo_01_08");	//Ale jak se jen zbavit těch zatracených blech! Jinak to zvládám celkem dobře.
};

instance DIA_Werewolf_What(C_Info)
{
	npc = Werewolf;
	nr = 1;
	condition = DIA_Werewolf_What_condition;
	information = DIA_Werewolf_What_info;
	permanent = FALSE;
	description = "Co budeš dělat?";
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
	AI_Output(other,self,"DIA_Werewolf_What_01_00");	//Co budeš dělat?
	AI_Output(self,other,"DIA_Werewolf_What_01_01");	//Zůstanu u Sagitty. Je milá... a dobře mě krmí!
	AI_Output(other,self,"DIA_Werewolf_What_01_02");	//Postarej se o ni.
	AI_Output(self,other,"DIA_Werewolf_What_01_03");	//Samozřejmě. Navíc není zrovna pravděpodobné, že sem někdo vyleze, když ví, že tady žije stínová šelma.
	AI_Output(other,self,"DIA_Werewolf_What_01_04");	//To máš tedy pravdu.
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
	description = "(dát kus masa)";
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