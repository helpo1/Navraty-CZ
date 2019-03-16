
instance DIA_Sld_820_EXIT(C_Info)
{
	npc = SLD_820_Soeldner;
	nr = 999;
	condition = DIA_Sld_820_EXIT_Condition;
	information = DIA_Sld_820_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Sld_820_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Sld_820_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Sld_820_Halt(C_Info)
{
	npc = SLD_820_Soeldner;
	nr = 1;
	condition = DIA_Sld_820_Halt_Condition;
	information = DIA_Sld_820_Halt_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Sld_820_Halt_Condition()
{
	if((other.guild != GIL_SLD) && (other.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void DIA_Sld_820_Halt_Info()
{
	AI_Output(self,other,"DIA_Sld_820_Halt_07_00");	//Kam si myslíš že jdeš?
	AI_Output(other,self,"DIA_Sld_820_Halt_15_01");	//Do domu.
	AI_Output(self,other,"DIA_Sld_820_Halt_07_02");	//Onar nám platí, abychom tam nepuštěli lidi jako jsi ty!
	if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Sld_820_Halt_07_03");	//Nechce zde žádnou domobranu!
	};
	AI_Output(other,self,"DIA_Sld_820_Halt_15_04");	//Chci mluvit s Leem!
	AI_Output(self,other,"DIA_Sld_820_Halt_07_05");	//Co mu chceš?
	Info_ClearChoices(DIA_Sld_820_Halt);
	Info_AddChoice(DIA_Sld_820_Halt,"Znám ho už velmi dlouho...",DIA_Sld_820_Halt_KenneLee);
	if(other.guild == GIL_NONE)
	{
		Info_AddChoice(DIA_Sld_820_Halt,"Chci se přidat k žoldákům!",DIA_Sld_820_Halt_WannaJoin);
	};
};

func void B_Sld_820_LeeIsRight()
{
	AI_Output(self,other,"B_Sld_820_LeeIsRight_07_00");	//Lee je v pravém křídle domu. Nikam jinam nechoď!
};

func void DIA_Sld_820_Halt_WannaJoin()
{
	AI_Output(other,self,"DIA_Sld_820_Halt_WannaJoin_15_00");	//Chci se přidat k žoldákům!
	AI_Output(self,other,"DIA_Sld_820_Halt_WannaJoin_07_01");	//Á, čerstvá síla! Jdi dál.
	B_Sld_820_LeeIsRight();
	AI_Output(self,other,"DIA_Sld_820_Halt_WannaJoin_07_02");	//Ale varuji tě: Ale nemluv na Onara bez vyzvání! Nesnáší to hlavně u nováčků.
	AI_StopProcessInfos(self);
};

func void DIA_Sld_820_Halt_KenneLee()
{
	AI_Output(other,self,"DIA_Sld_820_Halt_KenneLee_15_00");	//Znám ho už velmi dlouho...
	AI_Output(self,other,"DIA_Sld_820_Halt_KenneLee_07_01");	//TY ZNÁŠ LEEHO?! Nevěřím ti ani slovo, ale jestli je to pravda, Lee tě pozná. (směje se)
	B_Sld_820_LeeIsRight();
	AI_StopProcessInfos(self);
};


instance DIA_Sld_820_PERM(C_Info)
{
	npc = SLD_820_Soeldner;
	nr = 1;
	condition = DIA_Sld_820_PERM_Condition;
	information = DIA_Sld_820_PERM_Info;
	permanent = TRUE;
	description = "Co je?";
};


func int DIA_Sld_820_PERM_Condition()
{
	return TRUE;
};

func void DIA_Sld_820_PERM_Info()
{
	AI_Output(other,self,"DIA_Sld_820_PERM_15_00");	//Co je?
	AI_Output(self,other,"DIA_Sld_820_PERM_07_01");	//Jdi dovnitř, nebo si to rozmyslím.
	AI_StopProcessInfos(self);
};

