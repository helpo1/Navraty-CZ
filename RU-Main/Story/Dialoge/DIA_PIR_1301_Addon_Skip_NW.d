
instance DIA_Addon_Skip_NW_EXIT(C_Info)
{
	npc = PIR_1301_Addon_Skip_NW;
	nr = 999;
	condition = DIA_Addon_Skip_NW_EXIT_Condition;
	information = DIA_Addon_Skip_NW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Skip_NW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Skip_NW_EXIT_Info()
{
	AI_StopProcessInfos(self);
	PlayerTalkedToSkipNW = TRUE;
};

instance DIA_Addon_Skip_NW_PICKPOCKET(C_Info)
{
	npc = PIR_1301_Addon_Skip_NW;
	nr = 900;
	condition = DIA_Addon_Skip_NW_PICKPOCKET_Condition;
	information = DIA_Addon_Skip_NW_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int DIA_Addon_Skip_NW_PICKPOCKET_Condition()
{
	return C_Beklauen(20,43);
};

func void DIA_Addon_Skip_NW_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Skip_NW_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Skip_NW_PICKPOCKET,Dialog_Back,DIA_Addon_Skip_NW_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Skip_NW_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Skip_NW_PICKPOCKET_DoIt);
};

func void DIA_Addon_Skip_NW_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Skip_NW_PICKPOCKET);
};

func void DIA_Addon_Skip_NW_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Skip_NW_PICKPOCKET);
};

instance DIA_Addon_Skip_NW_Hallo(C_Info)
{
	npc = PIR_1301_Addon_Skip_NW;
	nr = 1;
	condition = DIA_Addon_Skip_NW_Hallo_Condition;
	information = DIA_Addon_Skip_NW_Hallo_Info;
	important = TRUE;
};


func int DIA_Addon_Skip_NW_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Addon_Skip_NW_Hallo_Info()
{
	AI_Output(self,other,"DIA_Addon_Skip_NW_Hallo_08_00");	//Ну наконец-то! Сколько тебя можно ждать?
	AI_Output(self,other,"DIA_Addon_Skip_NW_Hallo_08_01");	//Минуточку...(удивленно) Ты же не торговец из города, верно?
	AI_Output(self,other,"DIA_Addon_Skip_NW_Hallo_08_02");	//А где Бальтрам?!
	SkipMeet = TRUE;
};


instance DIA_Addon_Skip_NW_WerBistDu(C_Info)
{
	npc = PIR_1301_Addon_Skip_NW;
	nr = 5;
	condition = DIA_Addon_Skip_NW_WerBistDu_Condition;
	information = DIA_Addon_Skip_NW_WerBistDu_Info;
	description = "Ты кто такой?";
};


func int DIA_Addon_Skip_NW_WerBistDu_Condition()
{
	return TRUE;
};

func void DIA_Addon_Skip_NW_WerBistDu_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_WerBistDu_15_00");	//Ты кто такой?
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_08_01");	//Не знаю, почему это должно тебя касаться. Но если уж тебе так интересно, то меня зовут Скип. Тебе знакомо это имя?
	AI_Output(other,self,"DIA_Addon_Skip_NW_WerBistDu_15_02");	//Как-как тебя зовут?
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_08_03");	//Неужели ты никогда не слышал о Скипе? Ты что, вырос на необитаемом острове, приятель?
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_08_04");	//Я - один из самых опасных преступников Хориниса. Вместе со своими ребятами я наводил ужас на моряков, ходящих в этих водах.
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_08_05");	//Да нет, ты должен был обо мне слышать.
	Info_ClearChoices(DIA_Addon_Skip_NW_WerBistDu);
	Info_AddChoice(DIA_Addon_Skip_NW_WerBistDu,"Ты пират?",DIA_Addon_Skip_NW_WerBistDu_pirat);
	Info_AddChoice(DIA_Addon_Skip_NW_WerBistDu,"Я должен тебя знать?",DIA_Addon_Skip_NW_WerBistDu_keineAhnung);
	Info_AddChoice(DIA_Addon_Skip_NW_WerBistDu,"Ну конечно! Теперь я вспоминаю...",DIA_Addon_Skip_NW_WerBistDu_ja);
};

func void DIA_Addon_Skip_NW_WerBistDu_ja()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_WerBistDu_ja_15_00");	//Ну конечно! Теперь я вспоминаю...
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_ja_08_01");	//Правда? Ты действительно обо мне слышал?
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_ja_08_02");	//А я-то думал вернуться в город.
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_ja_08_03");	//Хорошо, что я этого не сделал.

	if((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL))
	{
		AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_ja_08_04");	//Меня бы сразу же бросили за решетку.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_ja_08_05");	//Кстати, ты же не арестовывать меня пришел?
		AI_Output(other,self,"DIA_Addon_Skip_NW_WerBistDu_ja_15_06");	//Ну-у...
		AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_ja_08_07");	//Это в твоих же интересах. Свяжись со стариком Скипом - и ты мертвец.
	};
	Info_ClearChoices(DIA_Addon_Skip_NW_WerBistDu);
};

func void DIA_Addon_Skip_NW_WerBistDu_keineAhnung()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_WerBistDu_keineAhnung_15_00");	//Я должен тебя знать?
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_keineAhnung_08_01");	//Следи за своим языком, приятель, иначе старику Скипу придется тебя проучить.
	Info_ClearChoices(DIA_Addon_Skip_NW_WerBistDu);
};

func void DIA_Addon_Skip_NW_WerBistDu_pirat()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_WerBistDu_pirat_15_00");	//Ты пират?
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_pirat_08_01");	//Да, черт возьми. Это же очевидно. Пират, и причем знаменитый.
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_pirat_08_02");	//Но сейчас мне так скучно, что я готов сожрать свою лодку.
	Info_ClearChoices(DIA_Addon_Skip_NW_WerBistDu);
};


instance DIA_Addon_Skip_NW_Baltram(C_Info)
{
	npc = PIR_1301_Addon_Skip_NW;
	nr = 5;
	condition = DIA_Addon_Skip_NW_Baltram_Condition;
	information = DIA_Addon_Skip_NW_Baltram_Info;
	description = "Бальтрам? Ты ждешь торговца?";
};


func int DIA_Addon_Skip_NW_Baltram_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_NW_Hallo))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Skip_NW_Baltram_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_Baltram_15_00");	//Бальтрам? Ты ждешь торговца?
	AI_Output(self,other,"DIA_Addon_Skip_NW_Baltram_08_01");	//Догадливый паренек.

	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		B_TurnToNpc(self,other);
	};

	AI_Output(self,other,"DIA_Addon_Skip_NW_Baltram_08_02");	//Я же только что сам об этом сказал.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Baltram_08_03");	//Этот никчемный торговец всяким хламом, похоже, забыл про нашу встречу.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Baltram_08_04");	//Если бы я только мог до него добраться...
	Log_CreateTopic(TOPIC_Addon_BaltramSkipTrade,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BaltramSkipTrade,LOG_Running);
	B_LogEntry(TOPIC_Addon_BaltramSkipTrade,"Пират Скип сообщил мне, что некий Бальтрам, городской торговец, сотрудничает с пиратами.");
	SCKnowsBaltramAsPirateTrader = TRUE;
};

instance DIA_Addon_Skip_BaltramPaket(C_Info)
{
	npc = PIR_1301_Addon_Skip_NW;
	nr = 5;
	condition = DIA_Addon_Skip_BaltramPaket_Condition;
	information = DIA_Addon_Skip_BaltramPaket_Info;
	description = "У меня для тебя посылка от Бальтрама.";
};

func int DIA_Addon_Skip_BaltramPaket_Condition()
{
	if((MIS_Addon_Baltram_Paket4Skip == LOG_Running) && Npc_HasItems(other,ItMi_Packet_Baltram4Skip_Addon))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Skip_BaltramPaket_Info()
{
	B_GivePlayerXP(XP_Addon_Skip_BaltramPaket);
	AI_Output(other,self,"DIA_Addon_Skip_BaltramPaket_15_00");	//У меня для тебя посылка от Бальтрама.
	AI_Output(self,other,"DIA_Addon_Skip_BaltramPaket_08_01");	//Что? Он послал ко мне мальчика на побегушках?
	AI_Output(self,other,"DIA_Addon_Skip_BaltramPaket_08_02");	//Думаю, он просто боится со мной встречаться. Что еще ожидать от этого жалкого скряги?
	B_GiveInvItems(other,self,ItMi_Packet_Baltram4Skip_Addon,1);
	Npc_RemoveInvItems(self,ItMi_Packet_Baltram4Skip_Addon,1);
	AI_Output(other,self,"DIA_Addon_Skip_BaltramPaket_15_03");	//Он сказал, что ему нужны три бутылки рома.
	AI_Output(self,other,"DIA_Addon_Skip_BaltramPaket_08_04");	//(смеется) Ну конечно! Сначала он заставляет меня ждать, потом не приходит на встречу, и у него еще хватает наглости чего-то требовать.
	AI_Output(self,other,"DIA_Addon_Skip_BaltramPaket_08_05");	//Вот, передай ему две бутылки. Хватит с него.
	CreateInvItems(self,ItFo_Addon_Rum,2);
	B_GiveInvItems(self,other,ItFo_Addon_Rum,2);
	B_LogEntry(TOPIC_Addon_BaltramSkipTrade,LogText_Addon_SkipsRumToBaltram);
	Skip_Rum4Baltram = TRUE;
};


instance DIA_Addon_Skip_NW_Woher(C_Info)
{
	npc = PIR_1301_Addon_Skip_NW;
	nr = 5;
	condition = DIA_Addon_Skip_NW_Woher_Condition;
	information = DIA_Addon_Skip_NW_Woher_Info;
	description = "Откуда ты приплыл?";
};

func int DIA_Addon_Skip_NW_Woher_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_NW_WerBistDu))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Skip_NW_Woher_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_Woher_15_00");	//Откуда ты приплыл?
	AI_Output(self,other,"DIA_Addon_Skip_NW_Woher_08_01");	//Ты хочешь знать, где наше убежище?!

	if(hero.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Addon_Skip_NW_Woher_08_02");	//Это последнее, что я сказал бы солдату ополчения.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Skip_NW_Woher_08_03");	//С таким же успехом я могу сам пойти и сдаться ополчению.
	};
	AI_Output(self,other,"DIA_Addon_Skip_NW_Woher_08_04");	//А если ты вдруг захочешь навестить нас, это все равно тебе не поможет.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Woher_08_05");	//Остров Хоринис довольно велик и никто и никогда не попадет туда, куда добрались мы. Если, конечно, они не наймут корабль.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Woher_08_06");	//Потом еще нужно будет пробраться через скалы, а там никто не пройдет, не зная секретного прохода.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Woher_08_07");	//Дорогу знают только два человека, а ты не похож ни на одного из них.
};


instance DIA_Addon_Skip_SCSawGreg(C_Info)
{
	npc = PIR_1301_Addon_Skip_NW;
	nr = 5;
	condition = DIA_Addon_Skip_SCSawGreg_Condition;
	information = DIA_Addon_Skip_SCSawGreg_Info;
	description = "Ты не знаешь никого с повязкой на глазу?";
};


func int DIA_Addon_Skip_SCSawGreg_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_NW_Woher) && (SC_KnowsConnectionSkipGreg == TRUE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Skip_SCSawGreg_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_SCSawGreg_15_00");	//Ты не знаешь никого с повязкой на глазу?
	AI_Output(self,other,"DIA_Addon_Skip_SCSawGreg_08_01");	//Я знаю много людей, у которых повязка на глазу.
	AI_Output(other,self,"DIA_Addon_Skip_SCSawGreg_15_02");	//Кое-кто путешествует по землям Хориниса и, похоже, неплохо знает тебя.
	AI_Output(self,other,"DIA_Addon_Skip_SCSawGreg_08_03");	//Мне никто не приходит в голову. Я не имею никаких дел с людьми, живущими на суше.
	AI_Output(other,self,"DIA_Addon_Skip_SCSawGreg_15_04");	//Но...
	AI_Output(self,other,"DIA_Addon_Skip_SCSawGreg_08_05");	//Прекрати, мне это не интересно.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Addon_Skip_NW_MissingPeople(C_Info)
{
	npc = PIR_1301_Addon_Skip_NW;
	nr = 2;
	condition = DIA_Addon_Skip_NW_MissingPeople_Condition;
	information = DIA_Addon_Skip_NW_MissingPeople_Info;
	description = "Пропало много людей.";
};


func int DIA_Addon_Skip_NW_MissingPeople_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_NW_Woher) && (MIS_Addon_Vatras_WhereAreMissingPeople == LOG_Running))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Skip_NW_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_MissingPeople_15_00");	//Пропало много людей. И все улики указывают на то, что ты замешан в этом деле.
	AI_Output(self,other,"DIA_Addon_Skip_NW_MissingPeople_08_01");	//Эээ... проклятье, это не то, что ты думаешь.
	AI_Output(self,other,"DIA_Addon_Skip_NW_MissingPeople_08_02");	//Я что, похож на работорговца? Нет, я всего лишь занимаюсь перевозкой товаров. Что это за товары и откуда они берутся - меня совершенно не касается.
	AI_Output(self,other,"DIA_Addon_Skip_NW_MissingPeople_08_03");	//Мы перевозим различные товары для этих свиней.
	AI_Output(self,other,"DIA_Addon_Skip_NW_MissingPeople_08_04");	//Сначала это были обычные товары. Ну, иногда, может быть, немного контрабанды.
	AI_Output(self,other,"DIA_Addon_Skip_NW_MissingPeople_08_05");	//А потом они стали похищать жителей города! Я не имею ни малейшего представления, что они собирались с ними делать.
	AI_Output(self,other,"DIA_Addon_Skip_NW_MissingPeople_08_06");	//Мы всего лишь перевозили их.
};


instance DIA_Addon_Skip_NW_Dexter(C_Info)
{
	npc = PIR_1301_Addon_Skip_NW;
	nr = 2;
	condition = DIA_Addon_Skip_NW_Dexter_Condition;
	information = DIA_Addon_Skip_NW_Dexter_Info;
	description = "О ком ты говоришь?";
};


func int DIA_Addon_Skip_NW_Dexter_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_NW_MissingPeople))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Skip_NW_Dexter_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_Dexter_15_00");	//О ком ты говоришь?
	AI_Output(self,other,"DIA_Addon_Skip_NW_Dexter_08_01");	//О бандитах, конечно. О ком же еще? Мерзкие отбросы, которые хозяйничают по всему острову.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Dexter_08_02");	//И не только здесь, а по всему Хоринису.
};

func void B_Skip_SaysDextersName()
{
	AI_Output(self,other,"DIA_Addon_Skip_SaysDextersName_08_00");	//Я вспомнил, как зовут главаря! Декстер. Да, они звали его Декстер.
	Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_WhoStolePeople,"Людей похищают по приказу предводителя бандитов Декстера. Найти Декстера можно к югу от фермы Онара.");
	SC_KnowsDexterAsKidnapper = TRUE;
	Ranger_SCKnowsDexter = TRUE;
};


instance DIA_Addon_Skip_NW_Name(C_Info)
{
	npc = PIR_1301_Addon_Skip_NW;
	nr = 2;
	condition = DIA_Addon_Skip_NW_Name_Condition;
	information = DIA_Addon_Skip_NW_Name_Info;
	description = "Отговорка 'бандиты' меня не устраивает. Мне нужно имя...";
};


func int DIA_Addon_Skip_NW_Name_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_NW_Dexter) && (SCKnowsMissingPeopleAreInAddonWorld == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Skip_NW_Name_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_Name_15_00");	//Отговорка 'бандиты' меня не устраивает. Мне нужно имя...
	AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_01");	//Имя? Ты хочешь узнать, кто является предводителем бандитов? Черт, как же звали этого ублюдка...
	AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_02");	//Ммм. Никак не могу вспомнить его имя. Хоть ты тресни.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_03");	//Но я могу показать тебе, где найти человека, который является главарем банды в этой части Хориниса.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_04");	//У тебя есть карта?

	if(Npc_HasItems(other,itwr_map_newworld_1) == FALSE)
	{
		if((Npc_HasItems(other,itwr_map_newworld_ornaments_addon_1) == TRUE) || (Npc_HasItems(other,itwr_map_shrine_mis_1) == TRUE) || (Npc_HasItems(other,itwr_map_caves_mis_1) == TRUE))
		{
			AI_Output(other,self,"DIA_Addon_Skip_NW_Name_15_05");	//Да, есть.
			AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_06");	//Но кто-то уже исписал ее. Зачем портить ее еще больше?
		}
		else
		{
			AI_Output(other,self,"DIA_Addon_Skip_NW_Name_15_07");	//Нет.
		};
		AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_08");	//В таком случае я опишу тебе это место.
		AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_09");	//Далеко на востоке отсюда находится очень большая ферма. Фермера, кажется, зовут Онар.
		AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_10");	//Он владеет обширными землями. К югу от его полей находится небольшая крепость на высокой скале.
		AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_11");	//Там ты и найдешь того, кто тебе нужен.
		B_Skip_SaysDextersName();
	};
};


instance DIA_Addon_Skip_NW_Landkarte(C_Info)
{
	npc = PIR_1301_Addon_Skip_NW;
	nr = 5;
	condition = DIA_Addon_Skip_NW_Landkarte_Condition;
	information = DIA_Addon_Skip_NW_Landkarte_Info;
	description = "Вот. У меня есть карта Хориниса.";
};


func int DIA_Addon_Skip_NW_Landkarte_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_NW_Name) && Npc_HasItems(other,itwr_map_newworld_1) && (SCKnowsMissingPeopleAreInAddonWorld == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Skip_NW_Landkarte_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_Landkarte_15_00");	//Вот! У меня есть карта Хориниса.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Landkarte_08_01");	//Хорошо! Дай я нарисую тебе его местоположение.
	B_GiveInvItems(other,self,itwr_map_newworld_1,1);
	B_Skip_SaysDextersName();
	AI_Output(self,other,"DIA_Addon_Skip_NW_Landkarte_08_02");	//Держи карту.
	Npc_RemoveInvItems(self,itwr_map_newworld_1,1);
	CreateInvItems(self,itwr_map_newworld_dexter_1,1);
	B_GiveInvItems(self,other,itwr_map_newworld_dexter_1,1);
};


instance DIA_Addon_Skip_NW_Wohin(C_Info)
{
	npc = PIR_1301_Addon_Skip_NW;
	nr = 99;
	condition = DIA_Addon_Skip_NW_Wohin_Condition;
	information = DIA_Addon_Skip_NW_Wohin_Info;
	permanent = FALSE;
	description = "Куда вы отвозили этих людей?";
};


func int DIA_Addon_Skip_NW_Wohin_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_NW_Woher) && Npc_KnowsInfo(other,DIA_Addon_Skip_NW_MissingPeople))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_NW_Wohin_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_Wohin_15_00");	//Куда вы отвозили этих людей?
	AI_Output(self,other,"DIA_Addon_Skip_NW_Wohin_08_01");	//Я уже сказал тебе, я не собираюсь рассказывать, где находится наш порт.
};

instance DIA_Addon_Skip_NW_Sable(C_Info)
{
	npc = PIR_1301_Addon_Skip_NW;
	nr = 5;
	condition = DIA_Addon_Skip_NW_Sable_Condition;
	information = DIA_Addon_Skip_NW_Sable_Info;
	description = "Ты выглядишь мрачнее тучи, приятель.";
};


func int DIA_Addon_Skip_NW_Sable_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Skip_NW_WerBistDu))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_NW_Sable_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_Sable_01_00");	//Ты выглядишь мрачнее тучи.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Sable_01_01");	//Эх...(удрученно) Есть от чего, приятель.
	AI_Output(other,self,"DIA_Addon_Skip_NW_Sable_01_02");	//Что, какие-то проблемы?
	AI_Output(self,other,"DIA_Addon_Skip_NW_Sable_01_03");	//Просто... Все дело в моем оружии.
	AI_Output(other,self,"DIA_Addon_Skip_NW_Sable_01_04");	//А что с ним не так?
	AI_Output(self,other,"DIA_Addon_Skip_NW_Sable_01_05");	//Да ты сам взгляни. Разве этот ржавый кусок железа можно назвать оружием?
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		B_TurnToNpc(self,other);
	};
	AI_ReadyMeleeWeapon(self);
	AI_PlayAni(self,"T_1HSINSPECT");
	AI_Output(other,self,"DIA_Addon_Skip_NW_Sable_01_06");	//М-да... Пожалуй, я соглашусь с тобой.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Sable_01_07");	//Вот и я о том же.
	AI_RemoveWeapon(self);
	AI_Output(self,other,"DIA_Addon_Skip_NW_Sable_01_08");	//Так уж случилось, что моя старая пиратская сабля не сдюжила во время последнего боя.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Sable_01_09");	//Вот и пришлось вооружаться тем, что первое под руку попадется.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Sable_01_10");	//Отыскал здесь вот эту ржавую железку! 
	AI_Output(self,other,"DIA_Addon_Skip_NW_Sable_01_11");	//По правде говоря, даже не знаю, как с ней обращаться.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Sable_01_12");	//Такое чувство, что при первом же выпаде она треснет, как мачта корабля!
	AI_Output(other,self,"DIA_Addon_Skip_NW_Sable_01_13");	//А почему бы тебе не найти другое оружие?
	AI_Output(self,other,"DIA_Addon_Skip_NW_Sable_01_14");	//Идея, конечно, хорошая...(посмеивается) Вот только в город к торговцам мне не сунуться!
	AI_Output(self,other,"DIA_Addon_Skip_NW_Sable_01_15");	//А приличное оружие просто так на дороге не валяется. Тем более пиратские сабли!
	AI_Output(other,self,"DIA_Addon_Skip_NW_Sable_01_16");	//Да, это действительно проблема.
	MIS_Skip_NW_Sable = LOG_Running;
	Log_CreateTopic(TOPIC_Skip_NW_Sable,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Skip_NW_Sable,LOG_Running);
	B_LogEntry(TOPIC_Skip_NW_Sable,"Скипу нужно хорошее оружие. Полагаю, новая пиратская сабля подойдет ему как нельзя лучше.");
};


instance DIA_Addon_Skip_NW_Sable_Done(C_Info)
{
	npc = PIR_1301_Addon_Skip_NW;
	nr = 5;
	condition = DIA_Addon_Skip_NW_Sable_Done_Condition;
	information = DIA_Addon_Skip_NW_Sable_Done_Info;
	description = "У меня есть для тебя сабля.";
};

func int DIA_Addon_Skip_NW_Sable_Done_Condition()
{
	if((MIS_Skip_NW_Sable == LOG_Running) && (Npc_HasItems(other,ItMw_Piratensaebel) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_NW_Sable_Done_Info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Addon_Skip_NW_Sable_Done_01_00");	//У меня есть для тебя сабля.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Sable_Done_01_01");	//Ты шутишь?
	AI_Output(other,self,"DIA_Addon_Skip_NW_Sable_Done_01_02");	//Нет, конечно. Вот, держи свою новую подругу.
	B_GiveInvItems(other,self,ItMw_Piratensaebel,1);
	AI_Output(self,other,"DIA_Addon_Skip_NW_Sable_Done_01_03");	//Ну, спасибо, приятель. Вот это другое дело! Настоящее оружие для настоящего пирата.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Sable_Done_01_05");	//За такой щедрый подарок и самого дорогого не жалко.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Sable_Done_01_06");	//Так что возьми эту бутылку рома.
	B_GiveInvItems(self,other,ItFo_Addon_Rum_Skip,1);
	AI_Output(self,other,"DIA_Addon_Skip_NW_Sable_Done_01_07");	//Такого ты нигде не отыщешь! Уж поверь мне.
	MIS_Skip_NW_Sable = LOG_Success;
	Log_SetTopicStatus(TOPIC_Skip_NW_Sable,LOG_Success);
	B_LogEntry(TOPIC_Skip_NW_Sable,"Скип был счастлив, обзаведясь новой пиратской саблей.");
	AI_StopProcessInfos(self);
	AI_EquipBestMeleeWeapon(self);
};

instance DIA_Addon_Skip_About_Drink(C_Info)
{
	npc = PIR_1301_Addon_Skip_NW;
	nr = 1;
	condition = DIA_Addon_Skip_About_Drink_Condition;
	information = DIA_Addon_Skip_About_Drink_Info;
	permanent = FALSE;
	description = "А у тебя есть еще пойло?";
};

func int DIA_Addon_Skip_About_Drink_Condition()
{
	if(Skip_Rum4Baltram == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_About_Drink_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_About_Drink_01_01");	//А у тебя есть еще пойло?
	AI_Output(self,other,"DIA_Addon_Skip_About_Drink_01_02");	//Что именно тебя интересует? Грог, ром или что-нибудь покрепче?
	AI_Output(other,self,"DIA_Addon_Skip_About_Drink_01_03");	//Лучше что-нибудь покрепче.
	AI_Output(self,other,"DIA_Addon_Skip_About_Drink_01_04");	//Хммм...(задумчиво) У меня тут осталась последняя бутылка совершенно невероятного напитка.
	AI_Output(self,other,"DIA_Addon_Skip_About_Drink_01_05");	//Называется 'Быстрая селедка'! Ее делает один мой старый знакомый.
	AI_Output(self,other,"DIA_Addon_Skip_About_Drink_01_06");	//Но как ты понимаешь, я не расстанусь с ней просто так.
	AI_Output(other,self,"DIA_Addon_Skip_About_Drink_01_07");	//И сколько ты хочешь?
	AI_Output(self,other,"DIA_Addon_Skip_About_Drink_01_08");	//В данном случае - золото меня мало интересует...
	AI_Output(other,self,"DIA_Addon_Skip_About_Drink_01_09");	//Тогда что тебе нужно?
	AI_Output(self,other,"DIA_Addon_Skip_About_Drink_01_10");	//Хммм...(задумчиво) Я хочу девку! Настоящую портовую шлюху, разрази меня гром!
	AI_Output(self,other,"DIA_Addon_Skip_About_Drink_01_11");	//Я слишком долго был в море, и сейчас это именно то, что мне нужно.
	AI_Output(self,other,"DIA_Addon_Skip_About_Drink_01_12");	//Но я не могу сам пойти в бордель. Ополчение вздернет меня на первом же суку.
	AI_Output(self,other,"DIA_Addon_Skip_About_Drink_01_13");	//Так что приведи ее сюда. Вот тогда и получишь свое пойло. 
	AI_Output(self,other,"DIA_Addon_Skip_About_Drink_01_14");	//Только сразу договорись о том, что она пробудет тут не меньше трех дней.
	AI_Output(other,self,"DIA_Addon_Skip_About_Drink_01_15");	//Ладно! Я постараюсь это устроить.
	MIS_WomanForSkip = LOG_Running;
	Log_CreateTopic(TOPIC_WomanForSkip,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_WomanForSkip,LOG_Running);
	B_LogEntry(TOPIC_WomanForSkip,"У Скипа осталась одна бутылка исключительно крепкого самогона. Он отдаст ее мне, если я приведу к нему девицу из портового борделя.");
	AI_StopProcessInfos(self);
};

instance DIA_Addon_Skip_About_Drink_Done(C_Info)
{
	npc = PIR_1301_Addon_Skip_NW;
	nr = 1;
	condition = DIA_Addon_Skip_About_Drink_Done_Condition;
	information = DIA_Addon_Skip_About_Drink_Done_Info;
	permanent = FALSE;
	description = "Я привел тебе Соню.";
};

func int DIA_Addon_Skip_About_Drink_Done_Condition()
{
	var int daynow;
	var C_Npc Sonja;

	daynow = Wld_GetDay();
	Sonja = Hlp_GetNpc(VLK_436_Sonja);

	if((MIS_WomanForSkip == LOG_Running) && (Npc_GetDistToWP(VLK_436_Sonja,"NW_CITY_PIRATESCAMP_04") <= 1000) && (Sonja.aivar[AIV_PARTYMEMBER] == TRUE) && (SonyaGoWithMe == TRUE) && (SonyaJob == FALSE) && (SonyaJobDone == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_About_Drink_Done_Info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_Addon_Skip_About_Drink_Done_01_00");	//Я привел тебе Соню.
	AI_Output(self,other,"DIA_Addon_Skip_About_Drink_Done_01_01");	//Хммм...(оценивающе) А она вообще как? Ну, ты понимаешь...
	AI_Output(other,self,"DIA_Addon_Skip_About_Drink_Done_01_02");	//Понятия не имею.
	AI_Output(self,other,"DIA_Addon_Skip_About_Drink_Done_01_03");	//Кммм... Ну ладно! Вот, держи свой самогон.
	B_GiveInvItems(self,other,ItFo_Addon_SchnellerHering_Ext,1);
	SkipGetWoman = TRUE;
	B_LogEntry(TOPIC_WomanForSkip,"Я привел Соню к Скипу, а он отдал мне бутыль с самогоном. Нужно не забыть вернуться сюда через три дня и привести Соню обратно к Бромору. А то как бы чего не вышло...");
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Skip_About_Drink_None(C_Info)
{
	npc = PIR_1301_Addon_Skip_NW;
	nr = 1;
	condition = DIA_Addon_Skip_About_Drink_None_Condition;
	information = DIA_Addon_Skip_About_Drink_None_Info;
	permanent = FALSE;
	description = "Боюсь, с твоей просьбой ничего не выйдет.";
};

func int DIA_Addon_Skip_About_Drink_None_Condition()
{
	if(MIS_WomanForSkip == LOG_Running) 
	{
		if(SonyaNoGoWithMe == TRUE)
		{
			return TRUE;
		}
		else if((Npc_IsDead(VLK_436_Sonja) == TRUE) && (SonyaGoWithMe == TRUE))
		{
			return TRUE;
		};
	};

	return FALSE;
};

func void DIA_Addon_Skip_About_Drink_None_Info()
{
	AI_Output(other,self,"DIA_Addon_Skip_About_Drink_None_01_00");	//Боюсь, с твоей просьбой ничего не выйдет.
	AI_Output(self,other,"DIA_Addon_Skip_About_Drink_None_01_01");	//Проклятье! Тогда и о выпивке забудь.
	MIS_WomanForSkip = LOG_FAILED;
	B_LogEntry_Failed(TOPIC_WomanForSkip);
	AI_StopProcessInfos(self);
};