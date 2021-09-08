
instance DIA_CAINE_EXIT(C_Info)
{
	npc = sek_8008_caine;
	nr = 999;
	condition = dia_caine_exit_condition;
	information = dia_caine_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_caine_exit_condition()
{
	return TRUE;
};

func void dia_caine_exit_info()
{
	AI_StopProcessInfos(self);
};

instance dia_caine_PICKPOCKET(C_Info)
{
	npc = sek_8008_caine;
	nr = 900;
	condition = dia_caine_PICKPOCKET_Condition;
	information = dia_caine_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int dia_caine_PICKPOCKET_Condition()
{
	return C_Beklauen(20,43);
};

func void dia_caine_PICKPOCKET_Info()
{
	Info_ClearChoices(dia_caine_PICKPOCKET);
	Info_AddChoice(dia_caine_PICKPOCKET,Dialog_Back,dia_caine_PICKPOCKET_BACK);
	Info_AddChoice(dia_caine_PICKPOCKET,DIALOG_PICKPOCKET,dia_caine_PICKPOCKET_DoIt);
};

func void dia_caine_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(dia_caine_PICKPOCKET);
};

func void dia_caine_PICKPOCKET_BACK()
{
	Info_ClearChoices(dia_caine_PICKPOCKET);
};

instance DIA_CAINE_WHATYOUDO(C_Info)
{
	npc = sek_8008_caine;
	nr = 1;
	condition = dia_caine_whatyoudo_condition;
	information = dia_caine_whatyoudo_info;
	permanent = FALSE;
	important = FALSE;
	description = "Co to děláte?";
};


func int dia_caine_whatyoudo_condition()
{
	if(((other.guild == GIL_NONE) || (other.guild == GIL_SEK)) && (MIS_PLANTSFORBAALCADAR != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_caine_whatyoudo_info()
{
	AI_Output(other,self,"DIA_Caine_WhatYouDo_01_00");	//Co tu děláte?
	AI_Output(self,other,"DIA_Caine_WhatYouDo_01_01");	//Sbíráme drogu z bažin. Naši bratři ji potom zpracují a bude se dát kouřit.
};


instance DIA_CAINE_CAINSENTTOCADAR(C_Info)
{
	npc = sek_8008_caine;
	nr = 1;
	condition = dia_caine_cainsenttocadar_condition;
	information = dia_caine_cainsenttocadar_info;
	permanent = FALSE;
	important = FALSE;
	description = "Chtěl bych se přidat k Bratrstvu. Můžeš mi pomoc?";
};


func int dia_caine_cainsenttocadar_condition()
{
	if(((other.guild == GIL_NONE) || (other.guild == GIL_SEK)) && (PSI_TALK == TRUE) && Npc_KnowsInfo(hero,dia_caine_whatyoudo))
	{
		return TRUE;
	};
};

func void dia_caine_cainsenttocadar_info()
{
	AI_Output(other,self,"DIA_Caine_CainSentToCadar_01_00");	//Chtěl bych se přidat k Bratrstvu. Můžeš mi pomoc?
	AI_Output(self,other,"DIA_Caine_CainSentToCadar_01_01");	//Chceš se k nám přidat? Dobře!
	AI_Output(self,other,"DIA_Caine_CainSentToCadar_01_02");	//Měl by sis uvědomit, že žádný z Guru si s tebou nepřeje mluvit.
	AI_Output(self,other,"DIA_Caine_CainSentToCadar_01_03");	//Abys tohle změnil, musíš na ně udělat dojem!
	AI_Output(other,self,"DIA_Caine_CainSentToCadar_01_04");	//Jak na ně mám udělat dojem?
	AI_Output(self,other,"DIA_Caine_CainSentToCadar_01_05");	//Jednoduše. Buď užitečný.
	AI_Output(other,self,"DIA_Caine_CainSentToCadar_01_06");	//Díky za radu.
};


instance DIA_CAINE_SENTPLANTSTOCADAR(C_Info)
{
	npc = sek_8008_caine;
	nr = 1;
	condition = dia_caine_sentplantstocadar_condition;
	information = dia_caine_sentplantstocadar_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_caine_sentplantstocadar_condition()
{
	if((other.guild == GIL_SEK) && (PSI_TALK == TRUE) && Npc_KnowsInfo(hero,dia_caine_cainsenttocadar) && Wld_IsTime(8,0,21,0))
	{
		return TRUE;
	};
};

func void dia_caine_sentplantstocadar_info()
{
	AI_Output(self,other,"DIA_Caine_SentPlantsToCadar_01_00");	//Počkej chvilku... Ano, myslím, že ti mohu pomoc.
	AI_Output(self,other,"DIA_Caine_SentPlantsToCadar_01_01");	//Udělej něco pro mě.
	AI_Output(other,self,"DIA_Caine_SentPlantsToCadar_01_02");	//Co mám udělat?
	AI_Output(self,other,"DIA_Caine_SentPlantsToCadar_01_03");	//Buď tak hodný a dones tuhle trávu z bažin Baalovi Cadarovi. Jsem si jistý, že už ho nebaví na ni čekat.
	AI_Output(other,self,"DIA_Caine_SentPlantsToCadar_01_04");	//A ty to nemůžeš udělat?
	AI_Output(self,other,"DIA_Caine_SentPlantsToCadar_01_05");	//Jak jsem ti už říkal. Jestli chceš udělat dojem na Guru, buď užitečný. Chápeš?
	AI_Output(self,other,"DIA_Caine_SentPlantsToCadar_01_06");	//Dávám ti šanci dokázat že za něco stojíš před Guru.
	AI_Output(other,self,"DIA_Caine_SentPlantsToCadar_01_07");	//Dobrá, jestli je to tak, dej mi tu drogu!
	AI_Output(self,other,"DIA_Caine_SentPlantsToCadar_01_08");	//Neztrať ji!
	B_GiveInvItems(self,other,ItPl_SwampHerb,50);
	Log_CreateTopic(TOPIC_CAINSENTTOCADAR,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CAINSENTTOCADAR,LOG_Running);
	B_LogEntry(TOPIC_CAINSENTTOCADAR,"Caine mě požádal, abych odnesl drogu Baalovi Cadarovi. Tak mohu být užitečný Bratrstvu.");
	MIS_CAINSENTTOCADAR = LOG_Running;
};


instance DIA_CAINE_SENTPLANTSTOCADAROK(C_Info)
{
	npc = sek_8008_caine;
	nr = 1;
	condition = dia_caine_sentplantstocadarok_condition;
	information = dia_caine_sentplantstocadarok_info;
	permanent = FALSE;
	important = FALSE;
	description = "Odnesl jsem mu drogu.";
};


func int dia_caine_sentplantstocadarok_condition()
{
	if((other.guild == GIL_SEK) && (PSI_TALK == TRUE) && (MIS_CAINSENTTOCADAR == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_caine_sentplantstocadarok_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Caine_SentPlantsToCadarOk_01_00");	//Odnesl jsem mu drogu.
	AI_Output(self,other,"DIA_Caine_SentPlantsToCadarOk_01_01");	//A?... (se zájmem)
	AI_Output(other,self,"DIA_Caine_SentPlantsToCadarOk_01_02");	//Baal Cadar ke mně začal mluvit a dal mi úkol.
	AI_Output(self,other,"DIA_Caine_SentPlantsToCadarOk_01_03");	//Vidíš! Co jsem říkal? Pokračuj takhle dál a zachvíli budeš jedním z nás!
};


instance DIA_CAINE_HOWWORK(C_Info)
{
	npc = sek_8008_caine;
	nr = 1;
	condition = dia_caine_howwork_condition;
	information = dia_caine_howwork_info;
	permanent = TRUE;
	important = FALSE;
	description = "Jak pokračuje sklizeň?";
};


func int dia_caine_howwork_condition()
{
	if((MIS_PLANTSFORBAALCADAR == LOG_SUCCESS) && ((other.guild == GIL_NONE) || (other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR)))
	{
		return TRUE;
	};
};

func void dia_caine_howwork_info()
{
	AI_Output(other,self,"DIA_Caine_HowWork_01_00");	//Jak pokračuje sklizeň?
	AI_Output(self,other,"DIA_Caine_HowWork_01_01");	//Velmi dobře. (smích) Jsem si jistý že Guru pro tebe najde časem mnohem lepší práci.
	AI_Output(self,other,"DIA_Caine_HowWork_01_02");	//A já aspoň nemusím sbírat sklizeň sám.
};

instance DIA_CAINE_SEKTEHEILEN(C_Info)
{
	npc = sek_8008_caine;
	nr = 1;
	condition = dia_caine_sekteheilen_condition;
	information = dia_caine_sekteheilen_info;
	permanent = FALSE;
	description = "Napij se! Zbaví tě bolestí hlavy.";
};


func int dia_caine_sekteheilen_condition()
{
	if((Npc_HasItems(other,ItPo_HealObsession_MIS) > 0) && (MIS_SEKTEHEILEN == LOG_Running) && Npc_KnowsInfo(hero,dia_baalorun_sekteheilengot))
	{
		return TRUE;
	};
};

func void dia_caine_sekteheilen_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Caine_SekteHeilen_01_00");	//Napij se! Zbaví tě bolestí hlavy.
	B_GiveInvItems(other,self,ItPo_HealObsession_MIS,1);
	B_UseItem(self,ItPo_HealObsession_MIS);
	SEKTEHEILENCOUNT = SEKTEHEILENCOUNT + 1;
	AI_Output(self,other,"DIA_Caine_SekteHeilen_01_01");	//Hned je mi lépe!
	AI_Output(self,other,"DIA_Caine_SekteHeilen_01_02");	//Děkuji!
};
