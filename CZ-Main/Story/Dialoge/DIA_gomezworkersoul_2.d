
instance DIA_GOMEZWORKERSOUL_2_EXIT(C_Info)
{
	npc = gomezworkersoul_2;
	nr = 999;
	condition = dia_gomezworkersoul_2_exit_condition;
	information = dia_gomezworkersoul_2_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_gomezworkersoul_2_exit_condition()
{
	return TRUE;
};

func void dia_gomezworkersoul_2_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GOMEZWORKERSOUL_2_HALLO(C_Info)
{
	npc = gomezworkersoul_2;
	nr = 1;
	condition = dia_gomezworkersoul_2_hallo_condition;
	information = dia_gomezworkersoul_2_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gomezworkersoul_2_hallo_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (GOMEZSOULTALK_2 == FALSE) && (RESCUEGOMEZSTEPTWO == TRUE))
	{
		return TRUE;
	};
};

func void dia_gomezworkersoul_2_hallo_info()
{
	self.aivar[AIV_EnemyOverride] = FALSE;
	Snd_Play("MFX_FEAR_CAST");
	B_GivePlayerXP(50);
	AI_Output(self,other,"DIA_GomezWorkerSoul_2_HALLO_01_00");	//SMRTELNÍKU, PROČ VYRUŠUJEŠ PROKLETOU DUŠI?!... (mrtvolně)
	AI_Output(other,self,"DIA_GomezWorkerSoul_2_HALLO_01_01");	//Abych ji osvobodil z tohoto zatracení!
	AI_Output(self,other,"DIA_GomezWorkerSoul_2_HALLO_01_04");	//Aargh!... (mrtvolně) Konečně! Tak dlouho jsem čekal!
	AI_Output(other,self,"DIA_GomezWorkerSoul_2_HALLO_01_05");	//Ale než osvobodím tvou duši, žádám od tebe pomoc.
	AI_Output(self,other,"DIA_GomezWorkerSoul_2_HALLO_01_06");	//Co po mě požaduješ?!... (mrtvolně)
	AI_Output(other,self,"DIA_GomezWorkerSoul_2_HALLO_01_07");	//Požaduji od tebe, abys odpustil jedné z prokletých duší. To je vše!
	AI_Output(self,other,"DIA_GomezWorkerSoul_2_HALLO_01_08");	//KTERÉ DUŠI MÁM DÁT ODPUŠTĚNÍ?!... (mrtvolně)
	AI_Output(other,self,"DIA_GomezWorkerSoul_2_HALLO_01_09");	//Duchu Gomeze, rudobarona pro kterého jsi kdysi pracoval.
	AI_Output(self,other,"DIA_GomezWorkerSoul_2_HALLO_01_10");	//HMMM... (mrtvolně) Tomu, díky kterému jsem prokletý...
	AI_Output(self,other,"DIA_GomezWorkerSoul_2_HALLO_01_11");	//NEZDÁ SE TI, ŽE ŽÁDÁŠ PŘÍLÍŠ MNOHO, SMRTELNÍKU?
	AI_Output(other,self,"DIA_GomezWorkerSoul_2_HALLO_01_12");	//Ani ne, když zvážím, že se jedná i o tvou záchranu.
	AI_Output(other,self,"DIA_GomezWorkerSoul_2_HALLO_01_13");	//Nebo chceš být prokletý navěky?!
	AI_Output(self,other,"DIA_GomezWorkerSoul_2_HALLO_01_14");	//AARGH! NE, JEN TO NE!... TOHLE UTRPENÍ - JE NESNESITELNÉ...
	Info_ClearChoices(dia_gomezworkersoul_2_hallo);
	Info_AddChoice(dia_gomezworkersoul_2_hallo,"Potom stačí, když odpustíš Gomezovi a tvá muka budou u konce.",dia_gomezworkersoul_2_hallo_end);
};

func void dia_gomezworkersoul_2_hallo_end()
{
	Snd_Play("SFX_INNOSEYE");
	AI_Output(other,self,"DIA_GomezWorkerSoul_2_HALLO_End_01_01");	//Potom stačí, když odpustíš Gomezovi a tvá muka budou u konce!
	AI_Output(self,other,"DIA_GomezWorkerSoul_2_HALLO_End_01_02");	//Ano, smrtelníku!... (mrtvolně) Ať je tedy po tvém!
	AI_Output(other,self,"DIA_GomezWorkerSoul_2_HALLO_End_01_03");	//Znamená to, že Gomezovi odpouštíš?!
	AI_Output(self,other,"DIA_GomezWorkerSoul_2_HALLO_End_01_04");	//Ano... (mrtvolně)
	AI_Output(other,self,"DIA_GomezWorkerSoul_2_HALLO_End_01_05");	//Skvěle! Teď duchu můžu dát spásu tvojí duši. Odejdi z tohoto světa!
	AI_Output(self,other,"DIA_GomezWorkerSoul_2_HALLO_End_01_06");	//Konečně! Aargh!... (mrtvolně)
	GOMEZSOULTALK_2 = TRUE;
	AI_StopProcessInfos(self);
};

