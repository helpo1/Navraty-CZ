
instance DIA_Babera_EXIT(C_Info)
{
	npc = BAU_934_Babera;
	nr = 999;
	condition = DIA_Babera_EXIT_Condition;
	information = DIA_Babera_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Babera_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Babera_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Babera_HALLO(C_Info)
{
	npc = BAU_934_Babera;
	nr = 1;
	condition = DIA_Babera_HALLO_Condition;
	information = DIA_Babera_HALLO_Info;
	description = "Ahoj krásko.";
};


func int DIA_Babera_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Babera_HALLO_Info()
{
	AI_Output(other,self,"DIA_Babera_HALLO_15_00");	//Ahoj krásko.
	AI_Output(self,other,"DIA_Babera_HALLO_16_01");	//Přestaň se na mě lepit. Radši mi hned řekni, co chceš. Nemám čas.
};


instance DIA_Babera_WIESIEHTSAUS(C_Info)
{
	npc = BAU_934_Babera;
	nr = 2;
	condition = DIA_Babera_WIESIEHTSAUS_Condition;
	information = DIA_Babera_WIESIEHTSAUS_Info;
	description = "Jak jde práce na poli?";
};


func int DIA_Babera_WIESIEHTSAUS_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Babera_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Babera_WIESIEHTSAUS_Info()
{
	AI_Output(other,self,"DIA_Babera_WIESIEHTSAUS_15_00");	//Jak jde práce na poli?
	AI_Output(self,other,"DIA_Babera_WIESIEHTSAUS_16_01");	//Podívej se na ty ohromné pole, které je třeba obdělat, a pochopíš sám.
	AI_Output(self,other,"DIA_Babera_WIESIEHTSAUS_16_02");	//Chceš snad pracovat na poli?
	Info_ClearChoices(DIA_Babera_WIESIEHTSAUS);
	if(hero.guild == GIL_NONE)
	{
		Info_AddChoice(DIA_Babera_WIESIEHTSAUS,"To opravdu ne. Já se chci stát žoldákem.",DIA_Babera_WIESIEHTSAUS_Nein);
		Info_AddChoice(DIA_Babera_WIESIEHTSAUS,"Možná že jo.",DIA_Babera_WIESIEHTSAUS_Vielleicht);
	};
};

func void DIA_Babera_WIESIEHTSAUS_Vielleicht()
{
	AI_Output(other,self,"DIA_Babera_WIESIEHTSAUS_Vielleicht_15_00");	//Možná že jo.
	AI_Output(self,other,"DIA_Babera_WIESIEHTSAUS_Vielleicht_16_01");	//Tak to by si si měl promluvit s naším farmářem, Sekobem. Možná by se u něho nějaká práce pro tebe našla.
	AI_Output(self,other,"DIA_Babera_WIESIEHTSAUS_Vielleicht_16_02");	//Nebo se můžeš zkusit podívat po práci na Onarově farmě. Najdeš jí na konci tady té cesty.
	AI_Output(self,other,"DIA_Babera_WIESIEHTSAUS_Vielleicht_16_03");	//Hlavně nebuď drzý na žoldáky. Nemají rádi cizince.
	Info_ClearChoices(DIA_Babera_WIESIEHTSAUS);
};

func void DIA_Babera_WIESIEHTSAUS_Nein()
{
	AI_Output(other,self,"DIA_Babera_WIESIEHTSAUS_Nein_15_00");	//To opravdu ne. Já se chci stát žoldákem.
	AI_Output(self,other,"DIA_Babera_WIESIEHTSAUS_Nein_16_01");	//Tak to si sem přišel zbytečně. Všichni jsou na Onarově farmě.
	Info_ClearChoices(DIA_Babera_WIESIEHTSAUS);
};


instance DIA_Babera_BRONKO(C_Info)
{
	npc = BAU_934_Babera;
	nr = 3;
	condition = DIA_Babera_BRONKO_Condition;
	information = DIA_Babera_BRONKO_Info;
	description = "(zeptat se na Bronka)";
};


func int DIA_Babera_BRONKO_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bronko_HALLO) && Npc_KnowsInfo(other,DIA_Babera_WIESIEHTSAUS))
	{
		return TRUE;
	};
};

func void DIA_Babera_BRONKO_Info()
{
	AI_Output(other,self,"DIA_Babera_BRONKO_15_00");	//Řekni mi, to je co za týpka, co stojí tam...
	AI_Output(self,other,"DIA_Babera_BRONKO_16_01");	//To je Bronko. Proč tě zajímá?
	AI_Output(other,self,"DIA_Babera_BRONKO_15_02");	//To je váš farmář?
	AI_Output(self,other,"DIA_Babera_BRONKO_16_03");	//(směje se) To ti řekl? Náš farmář je Sekob. Bronko je jenom žvanil a povaleč. Ale je silný jako lev.
	AI_Output(self,other,"DIA_Babera_BRONKO_16_04");	//To je proč, nikdo neprotestuje proti tomu, že nic nedělá.
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Babera_BRONKO_16_05");	//Nebojí se nikoho. Jen žoldáků.
	}
	else
	{
		AI_Output(self,other,"DIA_Babera_BRONKO_16_06");	//Pracovat ho donutí jen žoldáci. Hrozně se jich bojí.
	};
	Babera_BronkoKeinBauer = TRUE;
};


instance DIA_Babera_Rosi(C_Info)
{
	npc = BAU_934_Babera;
	nr = 3;
	condition = DIA_Babera_Rosi_Condition;
	information = DIA_Babera_Rosi_Info;
	description = "Kde je Rosi?";
};


func int DIA_Babera_Rosi_Condition()
{
	if((MIS_bringRosiBackToSekob == LOG_Running) && (Kapitel >= 5) && (RosiFoundKap5 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Babera_Rosi_Info()
{
	AI_Output(other,self,"DIA_Babera_Rosi_15_00");	//Kde je Rosi?
	AI_Output(self,other,"DIA_Babera_Rosi_16_01");	//Ona už nezvládala takový život vést a utekla na sever do lesa.
	B_LogEntry(TOPIC_RosisFlucht,"Rosi utekla ze Sekobovy farmy. Babera říkala, že šla někde do lesa na severu.");
	B_LogEntry(TOPIC_bringRosiBackToSekob,"Rosi utekla ze Sekobovy farmy. Babera říkala, že šla někde do lesa na severu.");
};


instance DIA_Babera_DUSTOERST(C_Info)
{
	npc = BAU_934_Babera;
	nr = 10;
	condition = DIA_Babera_DUSTOERST_Condition;
	information = DIA_Babera_DUSTOERST_Info;
	permanent = TRUE;
	description = "A krom toho?";
};


func int DIA_Babera_DUSTOERST_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Babera_BRONKO))
	{
		return TRUE;
	};
};

func void DIA_Babera_DUSTOERST_Info()
{
	AI_Output(other,self,"DIA_Babera_DUSTOERST_15_00");	//A krom toho?
	AI_Output(self,other,"DIA_Babera_DUSTOERST_16_01");	//Nemám čas.
	AI_StopProcessInfos(self);
};


instance DIA_Babera_PICKPOCKET(C_Info)
{
	npc = BAU_934_Babera;
	nr = 900;
	condition = DIA_Babera_PICKPOCKET_Condition;
	information = DIA_Babera_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Babera_PICKPOCKET_Condition()
{
	return C_Beklauen(20,30);
};

func void DIA_Babera_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Babera_PICKPOCKET);
	Info_AddChoice(DIA_Babera_PICKPOCKET,Dialog_Back,DIA_Babera_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Babera_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Babera_PICKPOCKET_DoIt);
};

func void DIA_Babera_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Babera_PICKPOCKET);
};

func void DIA_Babera_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Babera_PICKPOCKET);
};

