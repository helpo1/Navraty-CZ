
instance DIA_BRENDIK_EXIT(C_Info)
{
	npc = pir_6145_brendik;
	nr = 999;
	condition = dia_brendik_exit_condition;
	information = dia_brendik_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_brendik_exit_condition()
{
	return TRUE;
};

func void dia_brendik_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BRENDIK_HELLO(C_Info)
{
	npc = pir_6145_brendik;
	nr = 8;
	condition = dia_brendik_hello_condition;
	information = dia_brendik_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_brendik_hello_condition()
{
	return TRUE;
};

func void dia_brendik_hello_info()
{
	AI_ReadyMeleeWeapon(self);
	AI_Output(self,other,"DIA_Brendik_Hello_01_00");	//Эй, ты - а ну стой!!!
	AI_Output(other,self,"DIA_Brendik_Hello_01_01");	//Кто? Я?
	AI_Output(self,other,"DIA_Brendik_Hello_01_02");	//А ты что, здесь кого-то еще видишь?
	AI_Output(self,other,"DIA_Brendik_Hello_01_04");	//Говори - что тебе тут нужно и кто ты вообще такой?!
	AI_Output(other,self,"DIA_Brendik_Hello_01_05");	//Да я так - просто прогуливаюсь тут.
	AI_Output(self,other,"DIA_Brendik_Hello_01_06");	//Умник, да? А ты, случаем, не бандит?!
	AI_Output(other,self,"DIA_Brendik_Hello_01_07");	//Конечно нет! Разве я похож на него?
	AI_Output(self,other,"DIA_Brendik_Hello_01_08");	//Хммм...(внимательно разглядывает) Ну ладно. Но смотри у меня - если что, я тебе живо башку снесу! Понял?
	AI_RemoveWeapon(self);
	AI_Output(other,self,"DIA_Brendik_Hello_01_10");	//Понял.
	MEETBRENDIK = TRUE;
};


instance DIA_BRENDIK_FINDLOSTHUSB(C_Info)
{
	npc = pir_6145_brendik;
	nr = 8;
	condition = dia_brendik_findlosthusb_condition;
	information = dia_brendik_findlosthusb_info;
	permanent = FALSE;
	description = "Это тебя зовут Брендик?";
};


func int dia_brendik_findlosthusb_condition()
{
	if(MIS_FINDLOSTHUSB == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_brendik_findlosthusb_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Brendik_FindLostHusb_01_00");	//Это тебя зовут Брендик?
	AI_Output(self,other,"DIA_Brendik_FindLostHusb_01_01");	//Ну, допустим...(недоверчиво) А что надо?
	AI_Output(other,self,"DIA_Brendik_FindLostHusb_01_02");	//Меня послала твоя жена, Гритта. Ты ее помнишь?
	AI_Output(self,other,"DIA_Brendik_FindLostHusb_01_03");	//ЧТО?! МОЯ ЖЕНА?! (в панике) О нет! Только не это!
	AI_Output(other,self,"DIA_Brendik_FindLostHusb_01_04");	//Не понял?!
	AI_Output(self,other,"DIA_Brendik_FindLostHusb_01_05");	//Послушай, я хочу жить нормальной жизнью, так что лучше убей меня!
	AI_Output(other,self,"DIA_Brendik_FindLostHusb_01_06");	//Ты боишься своей жены больше черта, а вроде она очень милая женщина...
	AI_Output(self,other,"DIA_Brendik_FindLostHusb_01_07");	//Она же просто невыносима: у нее всегда на уме были только деньги, да шмотки.
	AI_Output(self,other,"DIA_Brendik_FindLostHusb_01_08");	//'Брендик, купи мне новое платье!', 'Брендик, я хочу эту шляпку!', 'Брендик, купи мне сапожки из кожи остера'... Ты представляешь себе, сколько стоят такие вещи?!
	AI_Output(self,other,"DIA_Brendik_FindLostHusb_01_09");	//Я вкалывал как вол, а она только и делала, что требовала денег, а потом жаловалась, что сделала ошибку, выйдя за меня замуж.
	AI_Output(other,self,"DIA_Brendik_FindLostHusb_01_10");	//Сказать по правде, она не сильно изменилась. Я и познакомился с ней из-за того, что она задолжала деньги одному торговцу.
	AI_Output(other,self,"DIA_Brendik_FindLostHusb_01_11");	//Но также я могу сказать, что она очень скучает, потому как не знает, жив ты или мертв.
	AI_Output(self,other,"DIA_Brendik_FindLostHusb_01_12");	//(с издевкой) А, ну конечно, ее дядюшка Торбен небось не потакает всем её прихотям.
	AI_Output(self,other,"DIA_Brendik_FindLostHusb_01_13");	//Послушай, даже если она скучает просто по мне, а не по возможности попить мою кровь, я не буду проверять это.
	AI_Output(self,other,"DIA_Brendik_FindLostHusb_01_14");	//В Хоринисе я был никем, тряпкой, а здесь я Человек!!! Меня уважают ребята в лагере, ко мне прислушивается Грэг.
	AI_Output(self,other,"DIA_Brendik_FindLostHusb_01_15");	//Ни за что я не вернусь к старой жизни!
	AI_Output(self,other,"DIA_Brendik_FindLostHusb_01_16");	//Передай ей, что я жив, здоров - и точка!
	AI_Output(other,self,"DIA_Brendik_FindLostHusb_01_17");	//Как хочешь, мне все равно.
	AI_Output(self,other,"DIA_Brendik_FindLostHusb_01_18");	//Вот и отлично!
	B_LogEntry(TOPIC_FINDLOSTHUSB,"Я нашел Брендика. Он был не в восторге, узнав, что его разыскивает жена, и возвращаться к ней не собирается. Осталось рассказать об этом Гритте.");
	BRENDIKNOTBACK = TRUE;
};


instance DIA_BRENDIK_WHATDO(C_Info)
{
	npc = pir_6145_brendik;
	nr = 8;
	condition = dia_brendik_whatdo_condition;
	information = dia_brendik_whatdo_info;
	permanent = FALSE;
	description = "Что ты тут делаешь?";
};


func int dia_brendik_whatdo_condition()
{
	return TRUE;
};

func void dia_brendik_whatdo_info()
{
	AI_Output(other,self,"DIA_Brendik_WhatDo_01_00");	//Что ты тут делаешь?
	AI_Output(self,other,"DIA_Brendik_WhatDo_01_01");	//Слежу за бандитами - приказ Грэга!
	AI_Output(other,self,"DIA_Brendik_WhatDo_01_02");	//А почему именно в этом месте?
	AI_Output(self,other,"DIA_Brendik_WhatDo_01_03");	//Отсюда сверху, вход в их лагерь просматривается, как на ладони!
	AI_Output(self,other,"DIA_Brendik_WhatDo_01_04");	//Да и к тому же на болотах слишком много опасных тварей, а сюда они попросту не доберутся.
	AI_Output(other,self,"DIA_Brendik_WhatDo_01_05");	//Понятно.
};


instance DIA_BRENDIK_GOTOGREG(C_Info)
{
	npc = pir_6145_brendik;
	nr = 8;
	condition = dia_brendik_gotogreg_condition;
	information = dia_brendik_gotogreg_info;
	permanent = FALSE;
	description = "Ты нужен Грэгу!";
};


func int dia_brendik_gotogreg_condition()
{
	if(MEETBRENDIKGREG == TRUE)
	{
		return TRUE;
	};
};

func void dia_brendik_gotogreg_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Brendik_GoToGreg_01_00");	//Ты нужен Грэгу!
	AI_Output(self,other,"DIA_Brendik_GoToGreg_01_01");	//Это еще зачем?!
	AI_Output(other,self,"DIA_Brendik_GoToGreg_01_02");	//Он передает тебе, чтобы ты возвращался в лагерь.
	AI_Output(other,self,"DIA_Brendik_GoToGreg_01_03");	//Кажется, у него есть для тебя еще одно какое-то поручение.
	AI_Output(self,other,"DIA_Brendik_GoToGreg_01_04");	//Хорошо, я все понял. Наконец-то я уберусь с этого проклятого болота!
	BRENDIKGOCAMP = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_BRENDIK_HOW(C_Info)
{
	npc = pir_6145_brendik;
	nr = 8;
	condition = dia_brendik_how_condition;
	information = dia_brendik_how_info;
	permanent = TRUE;
	description = "Как дела?";
};


func int dia_brendik_how_condition()
{
	if(BRENDIKNOTBACK == TRUE)
	{
		return TRUE;
	};
};

func void dia_brendik_how_info()
{
	AI_Output(other,self,"DIA_Brendik_How_01_01");	//Как дела?
	AI_Output(self,other,"DIA_Brendik_How_01_02");	//Все нормально. Только скучновато немного.
	AI_Output(self,other,"DIA_Brendik_How_01_03");	//Эх...(печально) Если бы только у нас был наш корабль! Мы бы уж точно не сидели тут без дела.
};


instance DIA_BRENDIK_PICKPOCKET(C_Info)
{
	npc = pir_6145_brendik;
	nr = 900;
	condition = dia_brendik_pickpocket_condition;
	information = dia_brendik_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_brendik_pickpocket_condition()
{
	return C_Beklauen(105,350);
};

func void dia_brendik_pickpocket_info()
{
	Info_ClearChoices(dia_brendik_pickpocket);
	Info_AddChoice(dia_brendik_pickpocket,Dialog_Back,dia_brendik_pickpocket_back);
	Info_AddChoice(dia_brendik_pickpocket,DIALOG_PICKPOCKET,dia_brendik_pickpocket_doit);
};

func void dia_brendik_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_brendik_pickpocket);
};

func void dia_brendik_pickpocket_back()
{
	Info_ClearChoices(dia_brendik_pickpocket);
};

