instance DIA_SEK_168_SLAVEOBSSEK_What(C_Info)
{
	npc = SEK_168_SLAVEOBSSEK;
	nr = 1;
	condition = DIA_SEK_168_SLAVEOBSSEK_What_Condition;
	information = DIA_SEK_168_SLAVEOBSSEK_What_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_SEK_168_SLAVEOBSSEK_What_Condition()
{
	if((Npc_IsDead(Ass_167_Adept_Convoy) == TRUE) && (PW_WelcomeToHram == FALSE))
	{
		return TRUE;
	};
};

func void DIA_SEK_168_SLAVEOBSSEK_What_Info()
{
	AI_Output(self,other,"DIA_SEK_168_SLAVEOBSSEK_What_01_00");	//Что ты наделал? (в панике) Теперь мы все умрем! Они найдут нас и убьют.
	AI_Output(other,self,"DIA_SEK_168_SLAVEOBSSEK_What_01_01");	//Спокойно! Просто помалкивай о том, что здесь произошло, и все будет хорошо.
	AI_Output(self,other,"DIA_SEK_168_SLAVEOBSSEK_What_01_02");	//Хорошо, как скажешь... только не убивай меня!
	AI_Output(other,self,"DIA_SEK_168_SLAVEOBSSEK_What_01_03");	//Это зависит от тебя самого.
	CreateInvItems(hero,ITAR_ASSASINS_03,1);
	AI_EquipArmor(hero,ITAR_ASSASINS_03);
	AI_Output(other,self,"DIA_SEK_168_SLAVEOBSSEK_What_01_04");	//Теперь я отведу тебя обратно в храм. Иди за мной!
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	PW_WelcomeToHram = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FollowMasiafTemple");
};

instance DIA_SEK_168_SLAVEOBSSEK_STANDARD(C_Info)
{
	npc = SEK_168_SLAVEOBSSEK;
	nr = 2;
	condition = DIA_SEK_168_SLAVEOBSSEK_Condition;
	information = DIA_SEK_168_SLAVEOBSSEK_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_SEK_168_SLAVEOBSSEK_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (PW_WelcomeToHram == TRUE))
	{
		return TRUE;
	};
};

func void DIA_SEK_168_SLAVEOBSSEK_Info()
{
	var int randy;

	randy = Hlp_Random(3);

	if(randy == 0)
	{
		AI_Output(self,other,"DIA_SEK_168_STANDARD_13_00");	//Оставь меня в покое!
	};
	if(randy == 1)
	{
		AI_Output(self,other,"DIA_SEK_168_STANDARD_13_01");	//Что тебе нужно от меня? Оставь меня в покое!
	};
	if(randy == 2)
	{
		AI_Output(self,other,"DIA_SEK_168_STANDARD_13_02");	//Мы все умрем здесь!
	};

	AI_StopProcessInfos(self);
};