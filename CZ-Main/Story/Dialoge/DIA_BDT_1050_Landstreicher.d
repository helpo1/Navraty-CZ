
instance DIA_Landstreicher_EXIT(C_Info)
{
	npc = BDT_1050_Landstreicher;
	nr = 999;
	condition = DIA_Landstreicher_EXIT_Condition;
	information = DIA_Landstreicher_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Landstreicher_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Landstreicher_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Landstreicher_HALLO(C_Info)
{
	npc = BDT_1050_Landstreicher;
	nr = 5;
	condition = DIA_Landstreicher_HALLO_Condition;
	information = DIA_Landstreicher_HALLO_Info;
	important = TRUE;
};


func int DIA_Landstreicher_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Landstreicher_HALLO_Info()
{
	AI_Output(self,other,"DIA_Landstreicher_HALLO_09_00");	//Co se tady děje?
	AI_Output(other,self,"DIA_Landstreicher_HALLO_15_01");	//Co myslíš?
	AI_Output(self,other,"DIA_Landstreicher_HALLO_09_02");	//Jseš už druhý co tu proběhl jakoby ho naháněli krvavé mouchy.
	Info_ClearChoices(DIA_Landstreicher_HALLO);
	Info_AddChoice(DIA_Landstreicher_HALLO,"Měl bych jít dál.",DIA_Landstreicher_HALLO_weg);
	Info_AddChoice(DIA_Landstreicher_HALLO,"Kde je ten první?",DIA_Landstreicher_HALLO_wo);
	Info_AddChoice(DIA_Landstreicher_HALLO,"Kdo je ten další?",DIA_Landstreicher_HALLO_wer);
};

func void DIA_Landstreicher_HALLO_wo()
{
	AI_Output(other,self,"DIA_Landstreicher_HALLO_wo_15_00");	//Kde je ten první?
	AI_Output(self,other,"DIA_Landstreicher_HALLO_wo_09_01");	//Vyběhl tam jako blesk.
};

func void DIA_Landstreicher_HALLO_wer()
{
	AI_Output(other,self,"DIA_Landstreicher_HALLO_wer_15_00");	//Kdo byl ten další?
	AI_Output(self,other,"DIA_Landstreicher_HALLO_wer_09_01");	//Vypadal jako ti chytrolíni novici z kláštera.
	AI_Output(self,other,"DIA_Landstreicher_HALLO_wer_09_02");	//Říkej si co chceš, ale ti chlapi to nemají v hlavě celkem v pořádku.
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Landstreicher_HALLO_wer_09_03");	//Koukni na ty hadry, co nosej. Nechtěl bych, aby mě v nich v noci chytili na ulici. (zasměje se)
		Info_AddChoice(DIA_Landstreicher_HALLO,"Dávej si pozor na jazyk.",DIA_Landstreicher_HALLO_wer_vorsicht);
	};
};

func void DIA_Landstreicher_HALLO_wer_vorsicht()
{
	AI_Output(other,self,"DIA_Landstreicher_HALLO_wer_vorsicht_15_00");	//Dávej si pozor na jazyk. Taky jsem býval novicem.
	AI_Output(self,other,"DIA_Landstreicher_HALLO_wer_vorsicht_09_01");	//(zasměje se) Ubožáku. To rozhodně mnoho vysvětluje.
	AI_Output(self,other,"DIA_Landstreicher_HALLO_wer_vorsicht_09_02");	//Bez urážky. Jdi už. Máš mnoho práce a nechci tě zdržovat.
	Info_AddChoice(DIA_Landstreicher_HALLO,"Měl bych tě naučit slušnému chování.",DIA_Landstreicher_HALLO_wer_vorsicht_Manieren);
};

func void DIA_Landstreicher_HALLO_wer_vorsicht_Manieren()
{
	AI_Output(other,self,"DIA_Landstreicher_HALLO_wer_vorsicht_Manieren_15_00");	//Měl bych tě naučit slušnému chování.
	AI_Output(self,other,"DIA_Landstreicher_HALLO_wer_vorsicht_Manieren_09_01");	//Neurážej se hned. Ale když chceš boj, máš ho mít.
	AI_Output(self,other,"DIA_Landstreicher_HALLO_wer_vorsicht_Manieren_09_02");	//Ukaž mi, co víš, novici.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Landstreicher_HALLO_weg()
{
	AI_Output(other,self,"DIA_Landstreicher_HALLO_weg_15_00");	//Musím jít.
	AI_Output(self,other,"DIA_Landstreicher_HALLO_weg_09_01");	//V pohodě.
	AI_StopProcessInfos(self);
};


instance DIA_Landstreicher_WASMACHSTDU(C_Info)
{
	npc = BDT_1050_Landstreicher;
	nr = 6;
	condition = DIA_Landstreicher_WASMACHSTDU_Condition;
	information = DIA_Landstreicher_WASMACHSTDU_Info;
	permanent = TRUE;
	description = "Co tady hledáš?";
};


func int DIA_Landstreicher_WASMACHSTDU_Condition()
{
	return TRUE;
};

func void DIA_Landstreicher_WASMACHSTDU_Info()
{
	AI_Output(other,self,"DIA_Landstreicher_WASMACHSTDU_15_00");	//Co tady hledáš?
	if(Npc_KnowsInfo(other,DIA_Landstreicher_HALLO))
	{
		AI_Output(self,other,"DIA_Landstreicher_WASMACHSTDU_09_01");	//Na takovou nulu kladeš příliš mnoho otázek.
	};
	AI_Output(self,other,"DIA_Landstreicher_WASMACHSTDU_09_02");	//Vyjmenuj jednu gobliní jeskyni, kterou jsme spolu prolezli a já ti řeknu moje tajemství.
	AI_Output(self,other,"DIA_Landstreicher_WASMACHSTDU_09_03");	//Jinak si jdi po svém.
	AI_StopProcessInfos(self);
};

