
instance DIA_ALEF_SOUL_EXIT(C_Info)
{
	npc = alef_soul;
	nr = 999;
	condition = dia_alef_soul_exit_condition;
	information = dia_alef_soul_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_alef_soul_exit_condition()
{
	return TRUE;
};

func void dia_alef_soul_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ALEF_SOUL_HALLO(C_Info)
{
	npc = alef_soul;
	nr = 1;
	condition = dia_alef_soul_hallo_condition;
	information = dia_alef_soul_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_alef_soul_hallo_condition()
{
	if((TALKTOALEF == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_alef_soul_hallo_info()
{
	Snd_Play("MFX_FEAR_CAST");
	B_GivePlayerXP(100);
	AI_Output(self,other,"DIA_Alef_Soul_HALLO_01_00");	//(mrtvolně) Proč rušíš mrtvou duši, smrtelníku? Co po mrtvém chceš?
	AI_Output(other,self,"DIA_Alef_Soul_HALLO_01_01");	//Rád bych ti položil pár otázek, duchu.
	AI_Output(self,other,"DIA_Alef_Soul_HALLO_01_02");	//Mrtví se nemají co zodpovídat živým... Nic se ode mě nedozvíš!
	AI_Output(other,self,"DIA_Alef_Soul_HALLO_01_03");	//Odpovíš na moje otázky, ať chceš nebo ne! Jinak tvá duše bude zatracena. Určitě si to dokážeš představit!
	AI_Output(self,other,"DIA_Alef_Soul_HALLO_01_04");	//Arrgh! Ptej se.
	AI_Output(other,self,"DIA_Alef_Soul_HALLO_01_06");	//Během života ses jmenoval Aleph a byl jsi kopáč ve Starém dole, že?
	AI_Output(self,other,"DIA_Alef_Soul_HALLO_01_07");	//Ano, to je pravda.
	AI_Output(other,self,"DIA_Alef_Soul_HALLO_01_08");	//Pak by sis měl pamatovat své přátele Snipese a Vipera. Vzpomínáš si na ně?
	AI_Output(other,self,"DIA_Alef_Soul_HALLO_01_10");	//Jednou se vám třem stalo něco zvláštního - dostali jste do svých rukou množství magické rudy, kterou jste měli donést do Starého tábora.
	AI_Output(other,self,"DIA_Alef_Soul_HALLO_01_11");	//A potom jste se rozhodli schovat tu rudu na lepší časy. A tys byl ten, kdo šel kopat místo pro rudu do jeskyně ve chvíli, kdy zkolabovala bariéra.
	AI_Output(self,other,"DIA_Alef_Soul_HALLO_01_14");	//Ano... Ale jak o tom všem víš?
	AI_Output(other,self,"DIA_Alef_Soul_HALLO_01_15");	//Na tom nezáleží. Odpověz mi na poslední otázku - kde jsi tu rudu schoval?
	AI_Output(self,other,"DIA_Alef_Soul_HALLO_01_16");	//... najdi most přes řeku... poblíž jeskyně, plné vody - uvnitř najdeš, co hledáš...
	AI_Output(self,other,"DIA_Alef_Soul_HALLO_01_17");	//Arrgh!
	AI_Output(self,other,"DIA_Alef_Soul_HALLO_01_20");	//Čas vypršel, smrtelníku! Žádné kouzlo už mě nedrží!
	AI_Output(self,other,"DIA_Alef_Soul_HALLO_01_22");	//Za svou drzost nyní zemřeš!...
	TALKTOALEF = TRUE;
	B_LogEntry(TOPIC_VIPERNUGGETS,"Xardas přivolal Alephovu duši. Ten nebyl zrovna rád, že ho někdo vyrušuje. Ale alespoň odpověděl na mé otázky ohledně rudy. Podle něj je ruda v jeskyni poblíž mostu. Jeskyně není zvlášť viditelná a je skoro celá zatopená vodou. Přesné místo se mi nepodařilo zjistit, protože čas vypršel.");
	Info_ClearChoices(dia_alef_soul_hallo);
	Info_AddChoice(dia_alef_soul_hallo,"To uvidíme!",dia_alef_soul_hallo_end);
};

func void dia_alef_soul_hallo_end()
{
	AI_Output(other,self,"DIA_Alef_Soul_Hallo_End_01_00");	//To uvidíme!
	AI_Output(self,other,"DIA_Alef_Soul_Hallo_End_01_01");	//Arrgh! Zemři, smrtelníku!
	self.flags = NPC_FLAG_NONE;
	AI_StopProcessInfos(self);
};

