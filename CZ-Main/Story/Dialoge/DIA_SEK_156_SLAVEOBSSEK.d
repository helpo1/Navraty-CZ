instance DIA_SEK_156_SLAVEOBSSEK_EXIT(C_Info)
{
	npc = SEK_156_SLAVEOBSSEK;
	nr = 999;
	condition = dia_SEK_156_SLAVEOBSSEK_exit_condition;
	information = dia_SEK_156_SLAVEOBSSEK_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int dia_SEK_156_SLAVEOBSSEK_exit_condition()
{
	return TRUE;
};

func void dia_SEK_156_SLAVEOBSSEK_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SEK_156_SLAVEOBSSEK_HALLO(C_Info)
{
	npc = SEK_156_SLAVEOBSSEK;
	nr = 1;
	condition = dia_SEK_156_SLAVEOBSSEK_hallo_condition;
	information = dia_SEK_156_SLAVEOBSSEK_hallo_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_SEK_156_SLAVEOBSSEK_hallo_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_SEK_156_SLAVEOBSSEK_hallo_info()
{
	var int randy;

	randy = Hlp_Random(3);

	if((MIS_RebelSlave == LOG_Running) && (FindMistake == FALSE) && (KnowWhoRebels == FALSE))
	{
		AI_Output(self,other,"DIA_SEK_156_SLAVEOBSSEK_HALLO_01_01");	//Jestli se od sud nedostanu, tak brzo zemřu!
		FindMistake = TRUE;
		AI_StopProcessInfos(self);
	}
	else if((MIS_RebelSlave == LOG_Running) && (PW_BetrayFollowMe == FALSE) && (BetrayFound == TRUE))
	{
		AI_Output(other,self,"DIA_SEK_156_SLAVEOBSSEK_HALLO_01_02");	//Hej ty, pojď hnedka za mnou. Chce tě osobně vidět Osair!
		AI_Output(self,other,"DIA_SEK_156_SLAVEOBSSEK_HALLO_01_03");	//(bázlivě) Osair? A mohu vědět proč?
		AI_Output(other,self,"DIA_SEK_156_SLAVEOBSSEK_HALLO_01_04");	//Chtěl ti osobně poděkovat za pomoc při chycení spiklence. 
		AI_Output(other,self,"DIA_SEK_156_SLAVEOBSSEK_HALLO_01_05");	//Až tam budem tak hlavně neotvírej pusu! Nebo tě budu muset osobně umlčet!
		AI_Output(self,other,"DIA_SEK_156_SLAVEOBSSEK_HALLO_01_06");	//Dobře, dobře... už jdu.
		PW_BetrayFollowMe = TRUE;
		self.aivar[AIV_PARTYMEMBER] = TRUE;
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"OsairReady");
	}
	else if((MIS_RebelSlave == LOG_Running) && (PW_BetrayFollowMe == TRUE) && (BetrayFound == TRUE))
	{
		AI_Output(self,other,"DIA_SEK_156_SLAVEOBSSEK_HALLO_01_07");	//Už jdu, už jdu...
		AI_StopProcessInfos(self);
	}
	else if((MIS_RebelSlave == LOG_Running) && (FindMistake == TRUE) && (KnowWhoRebels == FALSE))
	{
		B_GivePlayerXP(150);
		AI_Output(other,self,"DIA_SEK_156_SLAVEOBSSEK_HALLO_01_08");	//Hej! A kdes přišel na to, že odsud vůbec můžeš odejít?
		AI_Output(self,other,"DIA_SEK_156_SLAVEOBSSEK_HALLO_01_09");	//Hmmm... (váhavě) Nevěnuj tomu pozornost. To já jen tak... přemýšlel nahlas.
		AI_Output(other,self,"DIA_SEK_156_SLAVEOBSSEK_HALLO_01_10");	//Dělej, vyklop všechno co víš!
		AI_Output(other,self,"DIA_SEK_156_SLAVEOBSSEK_HALLO_01_11");	//Jinak se postarám aby se o tebe osobně zajímal Osairova ochranka.
		AI_Output(self,other,"DIA_SEK_156_SLAVEOBSSEK_HALLO_01_12");	//Dobře, dobře... (zbaběle) Všechno vyklopím. Hlavně to neříkej strážím.
		AI_Output(self,other,"DIA_SEK_156_SLAVEOBSSEK_HALLO_01_13");	//To všechno Marius! Pořád mluví o tom, že uteče.
		AI_Output(self,other,"DIA_SEK_156_SLAVEOBSSEK_HALLO_01_14");	//A nabádá nás abychom se vzbouřili.
		AI_Output(self,other,"DIA_SEK_156_SLAVEOBSSEK_HALLO_01_15");	//Dokonce se sám nabídl, že bude pracovat v chrámu, aby pro nás mohl získat zbraně.
		AI_Output(self,other,"DIA_SEK_156_SLAVEOBSSEK_HALLO_01_16");	//A víc toho už opravdu nevím...
		AI_Output(other,self,"DIA_SEK_156_SLAVEOBSSEK_HALLO_01_17");	//Doufám, že jsi nelhal, jinak bude zle.
		B_LogEntry(TOPIC_RebelSlave,"Myslím, že jsem na stopě. Jeden ze sloužících prozradil, že otrok Marius připravuje útěk a podněcuje ke vzpouře. Musím nejdřív jeho tvrzení prověřit, než podám Osariovi hlášení.");
		KnowWhoRebels = TRUE;
		MariusIns = TRUE;
		AI_StopProcessInfos(self);
		Wld_InsertNpc(SEK_169_SLAVEOBSSEK,"PW_TEMPLE_MARIUS_01");
	}
	else
	{
		if(randy == 0)
		{
			AI_Output(self,other,"DIA_SEK_156_STANDARD_13_00");	//Nech mě být!
		};
		if(randy == 1)
		{
			AI_Output(self,other,"DIA_SEK_156_STANDARD_13_01");	//Co ode mě chceš! Nech mě být!
		};
		if(randy == 2)
		{
			AI_Output(self,other,"DIA_SEK_156_STANDARD_13_02");	//Všichni tady umřem!
		};

		AI_StopProcessInfos(self);
	};
};