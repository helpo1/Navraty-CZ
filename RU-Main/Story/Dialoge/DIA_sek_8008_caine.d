
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
	description = "Чем ты занимаешься?";
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
	AI_Output(other,self,"DIA_Caine_WhatYouDo_01_00");	//Чем ты занимаешься?
	AI_Output(self,other,"DIA_Caine_WhatYouDo_01_01");	//Мы собираем болотник. После того как наши братья закончат переработку, его можно будет курить.
};


instance DIA_CAINE_CAINSENTTOCADAR(C_Info)
{
	npc = sek_8008_caine;
	nr = 1;
	condition = dia_caine_cainsenttocadar_condition;
	information = dia_caine_cainsenttocadar_info;
	permanent = FALSE;
	important = FALSE;
	description = "Я хотел бы присоединиться к вашему Лагерю. Ты мог бы мне помочь?";
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
	AI_Output(other,self,"DIA_Caine_CainSentToCadar_01_00");	//Я хотел бы присоединиться к вашему лагерю. Ты мог бы мне помочь?
	AI_Output(self,other,"DIA_Caine_CainSentToCadar_01_01");	//Ты хочешь присоединиться к нам? Хорошо!
	AI_Output(self,other,"DIA_Caine_CainSentToCadar_01_02");	//Ты, должно быть, заметил, что никто из Гуру не хочет с тобой разговаривать.
	AI_Output(self,other,"DIA_Caine_CainSentToCadar_01_03");	//Чтобы добиться своего, нужно произвести на них впечатление!
	AI_Output(other,self,"DIA_Caine_CainSentToCadar_01_04");	//Как произвести впечатление на Гуру?
	AI_Output(self,other,"DIA_Caine_CainSentToCadar_01_05");	//Просто постарайся быть полезным.
	AI_Output(other,self,"DIA_Caine_CainSentToCadar_01_06");	//Благодарю за совет.
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
	AI_Output(self,other,"DIA_Caine_SentPlantsToCadar_01_00");	//Постой-ка... Да, думаю, что я смогу тебе помочь.
	AI_Output(self,other,"DIA_Caine_SentPlantsToCadar_01_01");	//Сделай мне одолжение.
	AI_Output(other,self,"DIA_Caine_SentPlantsToCadar_01_02");	//Что я должен сделать?
	AI_Output(self,other,"DIA_Caine_SentPlantsToCadar_01_03");	//Будь добр, отнеси этот сбор болотника Идолу Кадару. Наверняка он его уже заждался.
	AI_Output(other,self,"DIA_Caine_SentPlantsToCadar_01_04");	//А почему ты сам это не сделаешь?
	AI_Output(self,other,"DIA_Caine_SentPlantsToCadar_01_05");	//Я же тебе сказал... Чтобы произвести впечатление на Гуру, ты должен постараться быть полезным. Понимаешь?
	AI_Output(self,other,"DIA_Caine_SentPlantsToCadar_01_06");	//Считай, что я даю тебе шанс проявить себя перед Гуру.
	AI_Output(other,self,"DIA_Caine_SentPlantsToCadar_01_07");	//Хорошо, я передам ему этот болотник.
	AI_Output(self,other,"DIA_Caine_SentPlantsToCadar_01_08");	//Отлично! Только не тяни с этим.
	B_GiveInvItems(self,other,ItPl_SwampHerb,50);
	Log_CreateTopic(TOPIC_CAINSENTTOCADAR,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CAINSENTTOCADAR,LOG_Running);
	B_LogEntry(TOPIC_CAINSENTTOCADAR,"Каин попросил меня отнести очередной сбор болотника Идолу Кадару. Таким образом, я смогу быть полезным Братству.");
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
	description = "Я отнес твой болотник.";
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
	AI_Output(other,self,"DIA_Caine_SentPlantsToCadarOk_01_00");	//Я отнес твой болотник.
	AI_Output(self,other,"DIA_Caine_SentPlantsToCadarOk_01_01");	//И?
	AI_Output(other,self,"DIA_Caine_SentPlantsToCadarOk_01_02");	//Идол Кадар заговорил со мной и дал мне одно поручение.
	AI_Output(self,other,"DIA_Caine_SentPlantsToCadarOk_01_03");	//Вот видишь! Продолжай в том же духе, и скоро ты наверняка станешь одним из нас.
};


instance DIA_CAINE_HOWWORK(C_Info)
{
	npc = sek_8008_caine;
	nr = 1;
	condition = dia_caine_howwork_condition;
	information = dia_caine_howwork_info;
	permanent = TRUE;
	important = FALSE;
	description = "Как сбор урожая?";
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
	AI_Output(other,self,"DIA_Caine_HowWork_01_00");	//Как сбор урожая?
	AI_Output(self,other,"DIA_Caine_HowWork_01_01");	//Да-да, смейся, смейся. Уверен, тебе Гуру доверяют работенку получше.
	AI_Output(self,other,"DIA_Caine_HowWork_01_02");	//По крайней мере, мне не приходится горбатиться самому.
};

instance DIA_CAINE_SEKTEHEILEN(C_Info)
{
	npc = sek_8008_caine;
	nr = 1;
	condition = dia_caine_sekteheilen_condition;
	information = dia_caine_sekteheilen_info;
	permanent = FALSE;
	description = "Выпей напиток! Он помогает от головной боли.";
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
	AI_Output(other,self,"DIA_Caine_SekteHeilen_01_00");	//Выпей напиток! Он помогает от головной боли.
	B_GiveInvItems(other,self,ItPo_HealObsession_MIS,1);
	B_UseItem(self,ItPo_HealObsession_MIS);
	SEKTEHEILENCOUNT = SEKTEHEILENCOUNT + 1;
	AI_Output(self,other,"DIA_Caine_SekteHeilen_01_01");	//Мне уже стало лучше!
	AI_Output(self,other,"DIA_Caine_SekteHeilen_01_02");	//Спасибо тебе!
};
