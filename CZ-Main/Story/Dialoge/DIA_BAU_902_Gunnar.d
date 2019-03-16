
instance DIA_Gunnar_EXIT(C_Info)
{
	npc = BAU_902_Gunnar;
	nr = 999;
	condition = DIA_Gunnar_EXIT_Condition;
	information = DIA_Gunnar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Gunnar_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Gunnar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


var int Gunnar_HalloGesagt;

instance DIA_Gunnar_Hallo(C_Info)
{
	npc = BAU_902_Gunnar;
	nr = 1;
	condition = DIA_Gunnar_Hallo_Condition;
	information = DIA_Gunnar_Hallo_Info;
	permanent = TRUE;
	description = "Jak se vede?";
};


func int DIA_Gunnar_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Gunnar_Hallo_Info()
{
	AI_Output(other,self,"DIA_Gunnar_Hallo_15_00");	//Jak se vede?
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Gunnar_Hallo_10_01");	//Od té doby, co Onar veřejně začal najímat žoldáky, se to tady jen tak hemží bandity.
		AI_Output(self,other,"DIA_Gunnar_Hallo_10_02");	//Všechna ta chátra, co neměla odvahu opustit les, se nyní vyrojila z lesů a usídlila se tady.
		AI_Output(self,other,"DIA_Gunnar_Hallo_10_03");	//Ti bastardi vážně vylejzaj snad odevšad.
	};
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Gunnar_Hallo_10_04");	//Tak ty jseš teď taky žoldák, co?
	};
	if((other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Gunnar_Hallo_10_05");	//Ano, Innos s tebou!
	};
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Gunnar_Hallo_10_06");	//Lidé z města tady nejsou vítáni.
	};
	if((other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR))
	{
		AI_Output(self,other,"DIA_Gunnar_Hallo_10_07");	//Ty jsi taky jeden z těch šílených sektářů? I když proti vám vlastně nic nemám...
	};
	if((other.guild == GIL_NDW) || (other.guild == GIL_KDW))
	{
		AI_Output(self,other,"DIA_Gunnar_Hallo_10_08");	//Adanos s tebou! Všechno je v pořádku, díky za optání.
	};
	if((other.guild == GIL_NDM) || (other.guild == GIL_KDM))
	{
		AI_Output(self,other,"DIA_Gunnar_Hallo_10_09");	//(vystrašeně) Ty... ty jsi nekromant, že?
	};
	Gunnar_HalloGesagt = TRUE;
};


instance DIA_Gunnar_Everywhere(C_Info)
{
	npc = BAU_902_Gunnar;
	nr = 2;
	condition = DIA_Gunnar_Everywhere_Condition;
	information = DIA_Gunnar_Everywhere_Info;
	permanent = TRUE;
	description = "Odkud se vzalo tolik žoldáků?";
};


func int DIA_Gunnar_Everywhere_Condition()
{
	if(Gunnar_HalloGesagt == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Gunnar_Everywhere_Info()
{
	AI_Output(other,self,"DIA_Gunnar_Everywhere_15_00");	//Odkud se vzalo tolik žoldáků?
	AI_Output(self,other,"DIA_Gunnar_Everywhere_10_01");	//Většina z nich je z trestanecké kolonie.
	AI_Output(self,other,"DIA_Gunnar_Everywhere_10_02");	//Další skupina žoldáků pochází oněkud z jihu, kde nejspíš lovili skřety.
	AI_Output(self,other,"DIA_Gunnar_Everywhere_10_03");	//A objevilo se tady taky několik banditů z hor - vsadím se, že jen proto, aby se mohli zadarmo najíst!
};


instance DIA_Gunnar_South(C_Info)
{
	npc = BAU_902_Gunnar;
	nr = 3;
	condition = DIA_Gunnar_South_Condition;
	information = DIA_Gunnar_South_Info;
	permanent = TRUE;
	description = "Co víš o těch žoldácích z jihu?";
};


func int DIA_Gunnar_South_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Gunnar_Everywhere))
	{
		return TRUE;
	};
};

func void DIA_Gunnar_South_Info()
{
	AI_Output(other,self,"DIA_Gunnar_South_15_00");	//Co víš o těch žoldácích z jihu?
	AI_Output(self,other,"DIA_Gunnar_South_10_01");	//Nic moc. Co vím, tak tam lovili skřety.
	AI_Output(self,other,"DIA_Gunnar_South_10_02");	//Sylvio je jejich šéf. Pracuje pro něj Bullco, Sentenza, Raoul a několik dalších.
};


instance DIA_Gunnar_Colony(C_Info)
{
	npc = BAU_902_Gunnar;
	nr = 4;
	condition = DIA_Gunnar_Colony_Condition;
	information = DIA_Gunnar_Colony_Info;
	permanent = TRUE;
	description = "Kdo všechno přišel z kolonie?";
};


func int DIA_Gunnar_Colony_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Gunnar_Everywhere))
	{
		return TRUE;
	};
};

func void DIA_Gunnar_Colony_Info()
{
	AI_Output(other,self,"DIA_Gunnar_Colony_15_00");	//Kdo všechno přišel z kolonie?
	AI_Output(self,other,"DIA_Gunnar_Colony_10_01");	//Lee a jeho lidé. Torlof, Cord, Jarvis, Wolf a bůhvíkdo ještě.
};


instance DIA_Gunnar_Bandits(C_Info)
{
	npc = BAU_902_Gunnar;
	nr = 5;
	condition = DIA_Gunnar_Bandits_Condition;
	information = DIA_Gunnar_Bandits_Info;
	permanent = TRUE;
	description = "Co ti banditi, o kterých jsi mluvil?";
};


func int DIA_Gunnar_Bandits_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Gunnar_Everywhere))
	{
		return TRUE;
	};
};

func void DIA_Gunnar_Bandits_Info()
{
	AI_Output(other,self,"DIA_Gunnar_Bandits_15_00");	//Co ti banditi, o kterých jsi mluvil?
	AI_Output(self,other,"DIA_Gunnar_Bandits_10_01");	//Ale, to jen tak. Upřímně, nejsem si tím vůbec jistý.
	AI_Output(self,other,"DIA_Gunnar_Bandits_10_02");	//Na jihu tohohle údolí jsou hory s opuštěnými doly. Ukrývá se tam několik banditů.
	AI_Output(self,other,"DIA_Gunnar_Bandits_10_03");	//Jsou to taky trestanci z kolonie, stejní jako ti na našem statku.
	AI_Output(self,other,"DIA_Gunnar_Bandits_10_04");	//Jedinej rozdíl mezi nima je, že jsou ještě horší. Zabijou každýho, kdo se k nim přiblíží.
};


instance DIA_Gunnar_PICKPOCKET(C_Info)
{
	npc = BAU_902_Gunnar;
	nr = 900;
	condition = DIA_Gunnar_PICKPOCKET_Condition;
	information = DIA_Gunnar_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Gunnar_PICKPOCKET_Condition()
{
	return C_Beklauen(45,70);
};

func void DIA_Gunnar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Gunnar_PICKPOCKET);
	Info_AddChoice(DIA_Gunnar_PICKPOCKET,Dialog_Back,DIA_Gunnar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Gunnar_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Gunnar_PICKPOCKET_DoIt);
};

func void DIA_Gunnar_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Gunnar_PICKPOCKET);
};

func void DIA_Gunnar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Gunnar_PICKPOCKET);
};

