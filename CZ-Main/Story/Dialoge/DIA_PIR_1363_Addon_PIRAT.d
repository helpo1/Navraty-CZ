
instance DIA_Addon_BenchPirate_EXIT(C_Info)
{
	npc = PIR_1363_Addon_PIRAT;
	nr = 999;
	condition = DIA_Addon_BenchPirate_EXIT_Condition;
	information = DIA_Addon_BenchPirate_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_BenchPirate_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_BenchPirate_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_BenchPirate_Hello(C_Info)
{
	npc = PIR_1363_Addon_PIRAT;
	nr = 1;
	condition = DIA_Addon_BenchPirate_Hello_Condition;
	information = DIA_Addon_BenchPirate_Hello_Info;
	permanent = TRUE;
	description = "Co se děje?";
};


func int DIA_Addon_BenchPirate_Hello_Condition()
{
	return TRUE;
};

func void DIA_Addon_BenchPirate_Hello_Info()
{
	var int randy;
	AI_Output(other,self,"DIA_Addon_Pir_7_Hello_15_00");	//Co se děje?
	randy = Hlp_Random(3);
	if(GregIsBack == TRUE)
	{
		if(randy == 0)
		{
			AI_Output(self,other,"DIA_Addon_Pir_7_Hello_07_01");	//Greg už je konečně zpátky. Byla to otázka času.
		}
		else if(randy == 1)
		{
			AI_Output(self,other,"DIA_Addon_Pir_7_Hello_07_02");	//Sežeň Francise, aby nám donesl nějaké dřevo na palisádu. On to má na starosti.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Pir_7_Hello_07_03");	//Pro mě za mě, banditi teď můžou klidně přijít. S Gregem na naší straně nás nemůže nic porazit!
		};
	}
	else if(randy == 0)
	{
		AI_Output(self,other,"DIA_Addon_Pir_7_Hello_07_04");	//Francis, šéf tábora, je idiot. Nicméně, nikdo ho nebere vážně.
	}
	else if(randy == 1)
	{
		AI_Output(self,other,"DIA_Addon_Pir_7_Hello_07_05");	//Greg věří Francisovi, protože on je příliš blbý na to, aby ho napálil! Ale dát mu kvůli tomu velení...
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Pir_7_Hello_07_06");	//Jestli se Greg brzo nevrátí a já se nedostanu zase do cviku, bude ze mě suchozemská krysa.
	};
};


instance DIA_Addon_BenchPirate_Anheuern(C_Info)
{
	npc = PIR_1363_Addon_PIRAT;
	nr = 11;
	condition = DIA_Addon_BenchPirate_Anheuern_Condition;
	information = DIA_Addon_BenchPirate_Anheuern_Info;
	permanent = FALSE;
	description = "Měl bys mi pomoct.";
};


func int DIA_Addon_BenchPirate_Anheuern_Condition()
{
	if(MIS_Addon_Greg_ClearCanyon == LOG_Running)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_BenchPirate_Anheuern_Info()
{
	AI_Output(other,self,"DIA_Addon_BenchPirate_Anheuern_15_00");	//Měl bys mi pomoct.
	AI_Output(self,other,"DIA_Addon_BenchPirate_Anheuern_07_01");	//Gregův rozkaz?
	AI_Output(other,self,"DIA_Addon_BenchPirate_Anheuern_15_08");	//Jo, přesně tak.
};


instance DIA_Addon_BenchPirate_ComeOn(C_Info)
{
	npc = PIR_1363_Addon_PIRAT;
	nr = 12;
	condition = DIA_Addon_BenchPirate_ComeOn_Condition;
	information = DIA_Addon_BenchPirate_ComeOn_Info;
	permanent = TRUE;
	description = "Kaňon čeká...";
};


func int DIA_Addon_BenchPirate_ComeOn_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == FALSE) && (MIS_Addon_Greg_ClearCanyon == LOG_Running) && Npc_KnowsInfo(other,DIA_Addon_BenchPirate_Anheuern))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_BenchPirate_ComeOn_Info()
{
	AI_Output(other,self,"DIA_Addon_BenchPirate_ComeOn_15_01");	//Kaňon čeká...
	if(C_GregsPiratesTooFar() == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_BenchPirate_ComeOn_07_02");	//Přesně! Ano, vrátím se TAM zpátky...
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_BenchPirate_ComeOn_07_01");	//Á, Á, kapitán!
		if(C_BodyStateContains(self,BS_SIT))
		{
			AI_Standup(self);
			B_TurnToNpc(self,other);
		};
		AI_StopProcessInfos(self);
		B_Addon_PiratesFollowAgain();
		Npc_ExchangeRoutine(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};


instance DIA_Addon_BenchPirate_GoHome(C_Info)
{
	npc = PIR_1363_Addon_PIRAT;
	nr = 13;
	condition = DIA_Addon_BenchPirate_GoHome_Condition;
	information = DIA_Addon_BenchPirate_GoHome_Info;
	permanent = TRUE;
	description = "Už tě víc nepotřebuji.";
};


func int DIA_Addon_BenchPirate_GoHome_Condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_BenchPirate_GoHome_Info()
{
	AI_Output(other,self,"DIA_Addon_BenchPirate_GoHome_15_00");	//Už tě víc nepotřebuji.
	AI_Output(self,other,"DIA_Addon_BenchPirate_GoHome_07_01");	//Jsem zpět v táboře, kapitáne!
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Addon_BenchPirate_TooFar(C_Info)
{
	npc = PIR_1363_Addon_PIRAT;
	nr = 14;
	condition = DIA_Addon_BenchPirate_TooFar_Condition;
	information = DIA_Addon_BenchPirate_TooFar_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_BenchPirate_TooFar_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (C_GregsPiratesTooFar() == TRUE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_BenchPirate_TooFar_Info()
{
	AI_Output(self,other,"DIA_Addon_BenchPirate_TooFar_07_01");	//Jsme příliš daleko od tábora.
	AI_Output(self,other,"DIA_Addon_BenchPirate_GoHome_07_02");	//Tohle se mi vůbec nelíbí.
	if(C_HowManyPiratesInParty() >= 2)
	{
		AI_Output(self,other,"DIA_Addon_Matt_TooFar_07_02");	//Vrátím se do tábora!
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Matt_TooFar_07_03");	//Já a chlapi se vrátíme do tábora!
	};
	B_Addon_PiratesGoHome();
	AI_StopProcessInfos(self);
};

