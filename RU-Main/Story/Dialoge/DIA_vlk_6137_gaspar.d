
instance DIA_VLK_6137_GASPAR_EXIT(C_Info)
{
	npc = vlk_6137_gaspar;
	nr = 999;
	condition = dia_vlk_6137_gaspar_exit_condition;
	information = dia_vlk_6137_gaspar_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_vlk_6137_gaspar_exit_condition()
{
	return TRUE;
};

func void dia_vlk_6137_gaspar_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_VLK_6137_GASPAR_HELLO(C_Info)
{
	npc = vlk_6137_gaspar;
	nr = 5;
	condition = dia_vlk_6137_gaspar_hello_condition;
	information = dia_vlk_6137_gaspar_hello_info;
	permanent = FALSE;
	description = "Эй, какого черта ты здесь делаешь?!";
};


func int dia_vlk_6137_gaspar_hello_condition()
{
	if((MIS_ABIGEILHELPHANNA == LOG_Running) && (HANNAISKNAST == TRUE))
	{
		return TRUE;
	};
};

func void dia_vlk_6137_gaspar_hello_info()
{
	AI_Output(other,self,"DIA_VLK_6137_Gaspar_Hello_01_00");	//Эй, какого черта ты здесь делаешь?! А где Ханна?
	AI_Output(self,other,"DIA_VLK_6137_Gaspar_Hello_01_01");	//Меня зовут Гаспар. Я...
	AI_Output(other,self,"DIA_VLK_6137_Gaspar_Hello_01_02");	//Кажется, я тебя не об этом спросил.
	AI_Output(self,other,"DIA_VLK_6137_Gaspar_Hello_01_03");	//Теперь я тут хозяин, и это моя гостиница.
	AI_Output(self,other,"DIA_VLK_6137_Gaspar_Hello_01_05");	//Пару дней назад Ханну арестовало городское ополчение - ее обвиняют в краже.
	AI_Output(other,self,"DIA_VLK_6137_Gaspar_Hello_01_06");	//В чем ее обвиняют?!
	AI_Output(self,other,"DIA_VLK_6137_Gaspar_Hello_01_07");	//В краже! Она обокрала одного купца и теперь сидит в тюрьме. Думаю, ей там самое место!
	AI_Output(other,self,"DIA_VLK_6137_Gaspar_Hello_01_08");	//Что? Да ты в своем уме, приятель? Этого просто не может быть!
	AI_Output(self,other,"DIA_VLK_6137_Gaspar_Hello_01_09");	//Еще как может! В ее сундуке нашли украденные вещи этого бедолаги.
	AI_Output(self,other,"DIA_VLK_6137_Gaspar_Hello_01_10");	//Так что все доказательства ее вины просто очевидны.
	AI_Output(self,other,"DIA_VLK_6137_Gaspar_Hello_01_12");	//Если тебя интересуют подробности этого дела, то тебе лучше поговорить об этом с самим лордом Андрэ.
	AI_Output(self,other,"DIA_VLK_6137_Gaspar_Hello_01_13");	//А мне тут с тобой болтать некогда!
	KNOWSHANNAINPRISION = TRUE;
	B_LogEntry(TOPIC_ABIGEILHELPHANNA,"По прибытию в Хоринис оказалось, что Ханну арестовали. Ее обвиняют в краже вещей у одного торговца. Вместо нее в гостинице теперь всем заправляет человек по имени Гаспар - мерзкий типчик! Надо бы поговрить с лордом Андрэ и выяснить, что именно здесь произошло.");
};


instance DIA_VLK_6137_GASPAR_INPRISOIN(C_Info)
{
	npc = vlk_6137_gaspar;
	nr = 5;
	condition = dia_vlk_6137_gaspar_inprisoin_condition;
	information = dia_vlk_6137_gaspar_inprisoin_info;
	permanent = FALSE;
	description = "Так это ты тот самый свидетель в деле Ханны";
};


func int dia_vlk_6137_gaspar_inprisoin_condition()
{
	if((MIS_ABIGEILHELPHANNA == LOG_Running) && (KNOWSHANNAINPRISIONHAKON == TRUE))
	{
		return TRUE;
	};
};

func void dia_vlk_6137_gaspar_inprisoin_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_VLK_6137_Gaspar_InPrisoin_01_00");	//Так это ты тот самый свидетель в деле Ханны?
	AI_Output(self,other,"DIA_VLK_6137_Gaspar_InPrisoin_01_01");	//Да, я.
	AI_Output(other,self,"DIA_VLK_6137_Gaspar_InPrisoin_01_02");	//Тогда расскажи мне, что ты видел.
	AI_Output(self,other,"DIA_VLK_6137_Gaspar_InPrisoin_01_03");	//Все, что я видел, я уже рассказал лорду Андрэ. Так что все вопросы к нему.
	AI_Output(other,self,"DIA_VLK_6137_Gaspar_InPrisoin_01_04");	//Почему же ты не хочешь говорить об этом?
	AI_Output(self,other,"DIA_VLK_6137_Gaspar_InPrisoin_01_05");	//Потому что...(нервничает) Потому что это не твоего ума дело!
	AI_Output(other,self,"DIA_VLK_6137_Gaspar_InPrisoin_01_07");	//Думаю, скоро ты окажешься там, где тебе самое место.
	AI_Output(self,other,"DIA_VLK_6137_Gaspar_InPrisoin_01_08");	//Ты что, мне угрожаешь?!
	AI_Output(self,other,"DIA_VLK_6137_Gaspar_InPrisoin_01_10");	//Послушай...(нервничает) Мне начихать на все твои угрозы и предупреждения!
	AI_Output(self,other,"DIA_VLK_6137_Gaspar_InPrisoin_01_11");	//Так что лучше проваливай из моей гостиницы, пока я не позвал стражу.
	B_LogEntry(TOPIC_ABIGEILHELPHANNA,"Мне показалось, что Гаспар явно что-то скрывает в деле Ханны. Думаю, надо побольше узнать об этом пижоне - он явно не чист на руку.");
	AI_StopProcessInfos(self);
};


instance DIA_VLK_6137_GASPAR_INPRISOINAB(C_Info)
{
	npc = vlk_6137_gaspar;
	nr = 5;
	condition = dia_vlk_6137_gaspar_inprisoinab_condition;
	information = dia_vlk_6137_gaspar_inprisoinab_info;
	permanent = TRUE;
	description = "Это ты подставил Ханну!";
};


func int dia_vlk_6137_gaspar_inprisoinab_condition()
{
	if((MIS_ABIGEILHELPHANNA == LOG_Running) && (KNOWSHANNAINPRISIONCARAGON == TRUE) && (GASPARPISSOFF == FALSE))
	{
		return TRUE;
	};
};

func void dia_vlk_6137_gaspar_inprisoinab_info()
{
	AI_Output(other,self,"DIA_VLK_6137_Gaspar_InPrisoinAb_01_00");	//Это ты подставил Ханну!
	AI_Output(self,other,"DIA_VLK_6137_Gaspar_InPrisoinAb_01_01");	//(испуганно) Что?!
	AI_Output(other,self,"DIA_VLK_6137_Gaspar_InPrisoinAb_01_03");	//Ты подсунул украденные вещи Ханне!
	AI_Output(self,other,"DIA_VLK_6137_Gaspar_InPrisoinAb_01_04");	//Кто? Я?! Я тут не причем! Я ничего не знаю!
	AI_Output(other,self,"DIA_VLK_6137_Gaspar_InPrisoinAb_01_05");	//Знаешь! И мне не составит труда это доказать.
	AI_Output(self,other,"DIA_VLK_6137_Gaspar_InPrisoinAb_01_06");	//Ну, что же, попробуй.

	if((Npc_HasItems(other,itri_hakonmissring) >= 1) && (JOTELLSGASPAR == TRUE))
	{
		B_GivePlayerXP(50);
		AI_Output(other,self,"DIA_VLK_6137_Gaspar_InPrisoinAb_01_08");	//Смотри, какое у меня есть красивое колечко.
		AI_Output(other,self,"DIA_VLK_6137_Gaspar_InPrisoinAb_01_09");	//И еще я знаю одного человека, его зовут Джо. Кстати, он тебя тоже знает.
		AI_Output(other,self,"DIA_VLK_6137_Gaspar_InPrisoinAb_01_10");	//Причем знает про тебя столько, что этого хватит чтобы, упрятать тебя за решетку.
		AI_Output(self,other,"DIA_VLK_6137_Gaspar_InPrisoinAb_01_11");	//(бледнея) Что?!
		AI_Output(self,other,"DIA_VLK_6137_Gaspar_InPrisoinAb_01_13");	//Делай, что хочешь - мне уже все равно.
		GASPARPISSOFF = TRUE;
	};
	AI_StopProcessInfos(self);
};


instance DIA_VLK_6137_GASPAR_FUCKOFF(C_Info)
{
	npc = vlk_6137_gaspar;
	nr = 10;
	condition = dia_vlk_6137_gaspar_fuckoff_condition;
	information = dia_vlk_6137_gaspar_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_vlk_6137_gaspar_fuckoff_condition()
{
	if((GASPARPISSOFF == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_vlk_6137_gaspar_fuckoff_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
};

