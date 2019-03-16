
instance DIA_Addon_Riordian_ADW_EXIT(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 999;
	condition = DIA_Addon_Riordian_ADW_EXIT_Condition;
	information = DIA_Addon_Riordian_ADW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Riordian_ADW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Riordian_ADW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Riordian_HelloADW(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 5;
	condition = DIA_Addon_Riordian_HelloADW_Condition;
	information = DIA_Addon_Riordian_HelloADW_Info;
	description = "Ты ожидал увидеть здесь ТАКОЕ?";
};


func int DIA_Addon_Riordian_HelloADW_Condition()
{
	return TRUE;
};

func void DIA_Addon_Riordian_HelloADW_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_HelloADW_15_00");	//Ты ожидал увидеть здесь ТАКОЕ?
	AI_Output(self,other,"DIA_Addon_Riordian_HelloADW_10_01");	//Нет, вовсе нет. Я поражен тем, какие размеры должен был иметь этот город.
	AI_Output(self,other,"DIA_Addon_Riordian_HelloADW_10_02");	//Большинство зданий погребено под камнем и землей, но те руины, что избежали этой участи, разбросаны по всей долине.
	AI_Output(self,other,"DIA_Addon_Riordian_HelloADW_10_03");	//Здесь, должно быть, жили тысячи человек.
};


instance DIA_Addon_Riordian_WhatToFind(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 5;
	condition = DIA_Addon_Riordian_WhatToFind_Condition;
	information = DIA_Addon_Riordian_WhatToFind_Info;
	description = "Что вы здесь уже обнаружили?";
};


func int DIA_Addon_Riordian_WhatToFind_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Riordian_HelloADW))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Riordian_WhatToFind_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_WhatToFind_15_00");	//Что вы здесь уже обнаружили?
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_01");	//На востоке раскинулось огромное болото, на котором находится большая крепость.
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_02");	//Насколько мы поняли, в ней обосновались бандиты.
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_03");	//На твоем месте я бы туда не ходил. Там повсюду сторожевые посты и охранники.
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_04");	//Держись от болота подальше, пока не наберешься опыта... или не найдешь способ обмануть бандитов.
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_05");	//На западе располагается пиратский лагерь.
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_06");	//Я точно не уверен, но по-моему, пираты нас тоже уже заметили.
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_07");	//Впрочем, их, похоже, не очень-то беспокоит наше присутствие.
};


instance DIA_Addon_Riordian_Gegend(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 5;
	condition = DIA_Addon_Riordian_Gegend_Condition;
	information = DIA_Addon_Riordian_Gegend_Info;
	permanent = TRUE;
	description = "Расскажи мне об этой местности побольше.";
};


func int DIA_Addon_Riordian_Gegend_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Riordian_WhatToFind) && (Saturas_RiesenPlan == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};


var int DIA_Addon_Riordian_Gegend_Info_OneTime;

func void DIA_Addon_Riordian_Gegend_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_15_00");	//Расскажи мне об этой местности побольше.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_10_01");	//Что ты хочешь узнать?
	Info_ClearChoices(DIA_Addon_Riordian_Gegend);
	Info_AddChoice(DIA_Addon_Riordian_Gegend,Dialog_Back,DIA_Addon_Riordian_Gegend_Back);
	if((DIA_Addon_Riordian_Gegend_Info_OneTime == FALSE) && (Npc_HasItems(other,itwr_map_addonworld_1) == FALSE))
	{
		Info_AddChoice(DIA_Addon_Riordian_Gegend,"Существует ли карта этой местности?",DIA_Addon_Riordian_Gegend_map);
		DIA_Addon_Riordian_Gegend_Info_OneTime = TRUE;
	};
	Info_AddChoice(DIA_Addon_Riordian_Gegend,"Где вы заметили пиратов?",DIA_Addon_Riordian_Gegend_Piraten);
	Info_AddChoice(DIA_Addon_Riordian_Gegend,"Напомни, где обосновались бандиты?",DIA_Addon_Riordian_Gegend_bandits);
	Info_AddChoice(DIA_Addon_Riordian_Gegend,"Вы уже побывали на западе?",DIA_Addon_Riordian_Gegend_west);
	Info_AddChoice(DIA_Addon_Riordian_Gegend,"Что я найду на востоке?",DIA_Addon_Riordian_Gegend_ost);
	Info_AddChoice(DIA_Addon_Riordian_Gegend,"Что расположено на юге?",DIA_Addon_Riordian_Gegend_sued);
	Info_AddChoice(DIA_Addon_Riordian_Gegend,"Что находится на севере?",DIA_Addon_Riordian_Gegend_nord);
};

func void DIA_Addon_Riordian_Gegend_Back()
{
	Info_ClearChoices(DIA_Addon_Riordian_Gegend);
};

func void DIA_Addon_Riordian_Gegend_map()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_map_15_00");	//Существует ли карта этой местности?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_map_10_01");	//Да, Кронос уже нарисовал карту. Обратись к нему.
};

func void DIA_Addon_Riordian_Gegend_bandits()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_bandits_15_00");	//Напомни, где обосновались бандиты?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_bandits_10_01");	//Их крепость и сторожевые посты находятся на востоке.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_bandits_10_02");	//Чтобы добраться до крепости, тебе придется пересечь болото.
};

func void DIA_Addon_Riordian_Gegend_Piraten()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_Piraten_15_00");	//Где вы заметили пиратов?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_Piraten_10_01");	//На западе. Некоторые пираты подходили к этому месту довольно близко.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_Piraten_10_02");	//Думаю, они охотились.
};

func void DIA_Addon_Riordian_Gegend_nord()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_nord_15_00");	//Что находится на севере?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_nord_10_01");	//Если верить записям Зодчих, там расположено большое ущелье, окруженное скалами.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_nord_10_02");	//Ландшафт там составляют песок и растрескавшаяся от засухи земля.
};

func void DIA_Addon_Riordian_Gegend_sued()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_sued_15_00");	//Что расположено на юге?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_sued_10_01");	//Местность на юге очень труднопроходимая.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_sued_10_02");	//Ты найдешь там тропинки-серпантины, водопады и скалы причудливых форм.
};

func void DIA_Addon_Riordian_Gegend_ost()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_ost_15_00");	//Что я найду на востоке?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_ost_10_01");	//Огромное болото. Эта местность очень опасна.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_ost_10_02");	//Там можно встретить не только бандитов, но и чрезвычайно опасных животных.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_ost_10_03");	//Будь осторожнее.
};


var int DIA_Addon_Riordian_Gegend_west_OneTime;

func void DIA_Addon_Riordian_Gegend_west()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_west_15_00");	//Вы уже побывали на западе?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_west_10_01");	//Еще нет. Но мы знаем, что там находится берег моря.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_west_10_02");	//Видимо, на этом берегу устроили свой лагерь пираты.
	if((DIA_Addon_Riordian_Gegend_west_OneTime == FALSE) && Npc_HasItems(VLK_4304_Addon_William,ITWr_Addon_William_01))
	{
		AI_Output(self,other,"DIA_Addon_Riordian_Gegend_west_10_03");	//На востоке, недалеко отсюда, мы нашли тело рыбака.
		AI_Output(self,other,"DIA_Addon_Riordian_Gegend_west_10_04");	//Тебе стоит на него взглянуть.
		B_LogEntry(TOPIC_Addon_MissingPeople,LogText_Addon_WilliamLeiche);
		DIA_Addon_Riordian_Gegend_west_OneTime = TRUE;
	};
};


instance DIA_Addon_Riordian_HousesOfRulers(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 5;
	condition = DIA_Addon_Riordian_HousesOfRulers_Condition;
	information = DIA_Addon_Riordian_HousesOfRulers_Info;
	description = "Меня послал Сатурас.";
};


func int DIA_Addon_Riordian_HousesOfRulers_Condition()
{
	if(MIS_Saturas_LookingForHousesOfRulers == LOG_Running)
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Riordian_HousesOfRulers_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_HousesOfRulers_15_00");	//Меня послал Сатурас. Я должен исследовать пять храмов Яркендара.
	AI_Output(self,other,"DIA_Addon_Riordian_HousesOfRulers_10_01");	//На то, чтобы найти сведения об их местонахождении в записях Зодчих, мне понадобилось приличное количество времени.
	AI_Output(self,other,"DIA_Addon_Riordian_HousesOfRulers_10_02");	//Но зато теперь я могу дать тебе точную информацию.
	MIS_Riordian_HousesOfRulers = LOG_Running;
};


instance DIA_Addon_Riordian_WhereAreHouses(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 5;
	condition = DIA_Addon_Riordian_WhereAreHouses_Condition;
	information = DIA_Addon_Riordian_WhereAreHouses_Info;
	description = "Где находятся пять храмов?";
};

func int DIA_Addon_Riordian_WhereAreHouses_Condition()
{
	if((MIS_Riordian_HousesOfRulers == LOG_Running) && (Saturas_SCBroughtAllToken == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};


var int B_WhreAreHousesOfRulersOneTime;

func void B_WhreAreHousesOfRulers()
{
	AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_00");	//Храм ученых - это огромная библиотека! Она находится далеко на севере.
	AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_01");	//Храм воинов расположен на востоке. Он представляет из себя крепость, окруженную скалами.
	AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_02");	//Храмы жрецов и стражей мертвых расположены недалеко друг от друга. Ты найдешь их на юго-западе.
	AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_03");	//А храм целителей должен быть где-то на юго-востоке.
	if(B_WhreAreHousesOfRulersOneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_04");	//Если эти храмы еще сохранились, ты узнаешь их по особой манере постройки.
		B_WhreAreHousesOfRulersOneTime = TRUE;
	};
	AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_05");	//Все храмы строились на возвышениях. К украшенному колоннами входу в каждый из них вела крутая лестница.
	if(B_WhreAreHousesOfRulersOneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_06");	//Надеюсь, тебе это поможет.
	};
	Log_CreateTopic(TOPIC_Addon_HousesOfRulers,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_HousesOfRulers,LOG_Running);
	B_LogEntry(TOPIC_Addon_HousesOfRulers,"Храм ученых - это огромная библиотека. Она находится где-то на севере.");
	Log_AddEntry(TOPIC_Addon_HousesOfRulers,"Храм воинов - это окруженная скалами крепость на востоке.");
	Log_AddEntry(TOPIC_Addon_HousesOfRulers,"Храмы жрецов и стражей мертвых находятся недалеко друг от друга. Я смогу найти их на юго-западе.");
	Log_AddEntry(TOPIC_Addon_HousesOfRulers,"Храм целителей находится на юго-востоке.");
};

func void DIA_Addon_Riordian_WhereAreHouses_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_WhereAreHouses_15_00");	//Где находятся пять дворцов?
	B_WhreAreHousesOfRulers();
};


instance DIA_Addon_Riordian_FoundHouse(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 5;
	condition = DIA_Addon_Riordian_FoundHouse_Condition;
	information = DIA_Addon_Riordian_FoundHouse_Info;
	permanent = TRUE;
	description = "Насчет храмов...";
};


func int DIA_Addon_Riordian_FoundHouse_Condition()
{
	if((MIS_Riordian_HousesOfRulers == LOG_Running) && Npc_KnowsInfo(other,DIA_Addon_Riordian_WhereAreHouses) && (RiordianHousesFoundCount < 5))
	{
		return TRUE;
	};
	return FALSE;
};

var int foundhouseinfo[6];
const int Library = 1;
const int heiler = 2;
const int Warrior = 3;
const int Priest = 4;
const int Totenw = 5;
var int RiordianHouseNeuigkeit;
var int RiordianHousesFoundCount;

func void DIA_Addon_Riordian_FoundHouse_Info()
{
	var int RiordianHouseXPs;
	RiordianHouseNeuigkeit = 0;
	AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_00");	//Насчет храмов...
	AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_01");	//Да?

	if((SC_COMESINTO_CANYONLIBRARY_FUNC_OneTime == TRUE) && (FOUNDHOUSEINFO[1] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_02");	//Библиотекой ученых, похоже, заинтересовались орки.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_03");	//Ты полагаешь, что они способны прочитать записи на древнем языке?
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_04");	//Нет, я так не думаю, но кто знает...
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_05");	//Ладно, в любом случае тебе лучше от них избавиться.
		FOUNDHOUSEINFO[1] = TRUE;
		RiordianHouseNeuigkeit = RiordianHouseNeuigkeit + 1;
		Log_CreateTopic(TOPIC_Addon_CanyonOrcs,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_CanyonOrcs,LOG_Running);
		B_LogEntry(TOPIC_Addon_CanyonOrcs,"Маг воды Риордиан будет доволен, если я очищу каньон от орков.");
	};
	if((Npc_IsDead(Stoneguardian_Heiler) || Npc_HasItems(other,ItMi_Addon_Stone_04) || (Saturas_SCFound_ItMi_Addon_Stone_04 == TRUE)) && (FOUNDHOUSEINFO[2] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_06");	//Храм целителей находится в центре болота. Его охраняют каменные стражи.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_07");	//Значит, он все еще стоит?
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_08");	//Да, но неизвестно, сколько это еще продлится...
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_09");	//Мне больно видеть разрушение древних строений, свидетелей прошлого...
		FOUNDHOUSEINFO[2] = TRUE;
		RiordianHouseNeuigkeit = RiordianHouseNeuigkeit + 1;
	};
	if((RavenIsInTempel == TRUE) && (FOUNDHOUSEINFO[3] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_10");	//В храме воинов поселился Ворон.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_11");	//Он сделал хороший выбор.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_12");	//Это самая неприступная крепость во всей долине.
		FOUNDHOUSEINFO[3] = TRUE;
		RiordianHouseNeuigkeit = RiordianHouseNeuigkeit + 1;
	};
	if((Npc_IsDead(Minecrawler_Priest) || Npc_HasItems(other,ItMi_Addon_Stone_03) || (Saturas_SCFound_ItMi_Addon_Stone_03 == TRUE)) && (FOUNDHOUSEINFO[4] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_13");	//В храме жрецов было множество ползунов.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_14");	//Но ведь эти животные встречаются здесь очень редко, верно?
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_15");	//Да, ты прав.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_16");	//Странные вещи здесь творятся...
		FOUNDHOUSEINFO[4] = TRUE;
		RiordianHouseNeuigkeit = RiordianHouseNeuigkeit + 1;
	};
	if((Npc_IsDead(MayaZombie04_Totenw) || Npc_HasItems(other,ItMi_Addon_Stone_02) || (Saturas_SCFound_ItMi_Addon_Stone_02 == TRUE)) && (FOUNDHOUSEINFO[5] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_17");	//Храм стражей мертвых защищают силы зла.
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_18");	//Я раньше никогда не встречал такое количество зомби в одном месте.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_19");	//Какая печальная судьба! Стражи мертвых пали жертвой своих же способностей.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_20");	//Их тесная связь с миром мертвых сослужила им злую службу. Надеюсь, ты освободил их от страданий.
		FOUNDHOUSEINFO[5] = TRUE;
		RiordianHouseNeuigkeit = RiordianHouseNeuigkeit + 1;
	};
	if(RiordianHouseNeuigkeit > 0)
	{
		RiordianHouseXPs = XP_Addon_Riordian_FoundHouse * RiordianHouseNeuigkeit;
		B_GivePlayerXP(RiordianHouseXPs);
		RiordianHousesFoundCount = RiordianHousesFoundCount + RiordianHouseNeuigkeit;
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_21");	//Напомни мне, где они находятся?
		B_WhreAreHousesOfRulers();
	};
};

instance DIA_Addon_Riordian_OrksWeg(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 5;
	condition = DIA_Addon_Riordian_OrksWeg_Condition;
	information = DIA_Addon_Riordian_OrksWeg_Info;
	description = "Скоро орки потеряют интерес к этой местности.";
};

func int DIA_Addon_Riordian_OrksWeg_Condition()
{
	if(Npc_IsDead(OrcShaman_Sit_CanyonLibraryKey) && (FOUNDHOUSEINFO[1] == TRUE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Riordian_OrksWeg_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_OrksWeg_15_00");	//Скоро орки потеряют интерес к этой местности.
	AI_Output(self,other,"DIA_Addon_Riordian_OrksWeg_10_01");	//Почему ты так считаешь?
	if(OrcShaman_Sit_CanyonLibraryKey.aivar[AIV_KilledByPlayer] == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Riordian_OrksWeg_15_02");	//Я убил их командира.
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Riordian_OrksWeg_15_03");	//Их предводитель мертв.
	};
	AI_Output(self,other,"DIA_Addon_Riordian_OrksWeg_10_04");	//Будем надеяться, ты прав.
	AI_Output(self,other,"DIA_Addon_Riordian_OrksWeg_10_05");	//Нам сейчас не нужны лишние заботы.
	TOPIC_END_CanyonOrcs = TRUE;
	B_GivePlayerXP(XP_Addon_Riordian_OrksWeg);
};


instance DIA_Addon_Riordian_FoundAllHouses(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 5;
	condition = DIA_Addon_Riordian_FoundAllHouses_Condition;
	information = DIA_Addon_Riordian_FoundAllHouses_Info;
	description = "Я нашел все храмы.";
};


func int DIA_Addon_Riordian_FoundAllHouses_Condition()
{
	if((RiordianHousesFoundCount >= 5) && (MIS_Riordian_HousesOfRulers == LOG_Running))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Riordian_FoundAllHouses_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_FoundAllHouses_15_00");	//Я нашел все храмы.
	AI_Output(self,other,"DIA_Addon_Riordian_FoundAllHouses_10_01");	//Они все находились там, где я указал?
	AI_Output(other,self,"DIA_Addon_Riordian_FoundAllHouses_15_02");	//Ну... более-менее.
	AI_Output(self,other,"DIA_Addon_Riordian_FoundAllHouses_10_03");	//Отлично! Значит, моя работа была не напрасной.
	AI_Output(self,other,"DIA_Addon_Riordian_FoundAllHouses_10_04");	//Благодарю тебя.
	MIS_Riordian_HousesOfRulers = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_FoundAllHouses);
};

instance DIA_Addon_Riordian_SpeedPotion(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 5;
	condition = DIA_Addon_Riordian_SpeedPotion_Condition;
	information = DIA_Addon_Riordian_SpeedPotion_Info;
	description = "Я еще могу чем то помочь?";
};

func int DIA_Addon_Riordian_SpeedPotion_Condition()
{
	if(MIS_Riordian_HousesOfRulers == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Addon_Riordian_SpeedPotion_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_SpeedPotion_01_00");	//Я еще могу чем то помочь?
	AI_Output(self,other,"DIA_Addon_Riordian_SpeedPotion_01_01");	//Возможно...(задумчиво) Недавно мне пришла в голову мысль сделать новый эликсир ускорения.
	AI_Output(other,self,"DIA_Addon_Riordian_SpeedPotion_01_02");	//А чем тебя не устраивает обычный?
	AI_Output(self,other,"DIA_Addon_Riordian_SpeedPotion_01_03");	//Дело в том, что эффект его действия слишком непродолжительный.
	AI_Output(self,other,"DIA_Addon_Riordian_SpeedPotion_01_04");	//Однако я слышал, что в лагере пиратов есть алхимик, который умеет варить особенное зелье скорости.
	AI_Output(self,other,"DIA_Addon_Riordian_SpeedPotion_01_05");	//Причем еще и не такое сложное в изготовлении, как обычный эликсир.
	AI_Output(self,other,"DIA_Addon_Riordian_SpeedPotion_01_06");	//Вот я и подумал, что было бы неплохо как-то заполучить этот рецепт.
	AI_Output(other,self,"DIA_Addon_Riordian_SpeedPotion_01_07");	//Намекаешь на то, чтобы я достал его для тебя?
	AI_Output(self,other,"DIA_Addon_Riordian_SpeedPotion_01_08");	//Ты меня правильно понял. А если все получится, я в долгу не останусь.
	AI_Output(other,self,"DIA_Addon_Riordian_SpeedPotion_01_09");	//Ладно, попробую.
	MIS_SpeedPotion = LOG_Running;
	Log_CreateTopic(TOPIC_SpeedPotion,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SpeedPotion,LOG_Running);
	B_LogEntry(TOPIC_SpeedPotion,"Риордиан хочет, чтобы я принес ему рецепт изготовления зелья ускорения, которое варит алхимик в лагере пиратов.");
};

instance DIA_Addon_Riordian_SpeedPotionDone(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 5;
	condition = DIA_Addon_Riordian_SpeedPotionDone_Condition;
	information = DIA_Addon_Riordian_SpeedPotionDone_Info;
	description = "Я достал нужный тебе рецепт.";
};

func int DIA_Addon_Riordian_SpeedPotionDone_Condition()
{
	if((MIS_SpeedPotion == LOG_Running) && (Npc_HasItems(hero,ITWr_Addon_Piratentod) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Riordian_SpeedPotionDone_Info()
{
	B_GivePlayerXP(400);
	AI_Output(other,self,"DIA_Addon_Riordian_SpeedPotionDone_01_00");	//Я достал нужный тебе рецепт.
	B_GiveInvItems(other,self,ITWr_Addon_Piratentod,1);
	Npc_RemoveInvItems(self,ITWr_Addon_Piratentod,1);
	AI_Output(self,other,"DIA_Addon_Riordian_SpeedPotionDone_01_01");	//Отлично! Тогда давай скорее взглянем на него.
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Addon_Riordian_SpeedPotionDone_01_02");	//Ну, собственно, так я и думал. Он довольно прост в изготовлении.
	AI_Output(self,other,"DIA_Addon_Riordian_SpeedPotionDone_01_03");	//Хорошо. Я благодарю тебя. Возьми эти напитки.
	B_GiveInvItemsManyThings(self,other);
	CreateInvItems(other,ItPo_Health_Addon_04,2);
	CreateInvItems(other,ItPo_Mana_Addon_04,2);
	AI_Output(self,other,"DIA_Addon_Riordian_SpeedPotionDone_01_04");	//Они наверняка пригодятся тебе в твоих странствиях.
	MIS_SpeedPotion = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_SpeedPotion,LOG_SUCCESS);
	B_LogEntry(TOPIC_SpeedPotion,"Я отдал рецепт Риордиану.");
};

instance DIA_Addon_Riordian_ADW_PreTeach(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 5;
	condition = DIA_Addon_Riordian_ADW_PreTeach_Condition;
	information = DIA_Addon_Riordian_ADW_PreTeach_Info;
	permanent = TRUE;
	description = "Ты можешь меня обучить своим умениям?";
};

func int DIA_Addon_Riordian_ADW_PreTeach_Condition()
{
	if((Riordian_ADW_ADDON_TeachAlchemy == FALSE) && (Riordian_ADW_ADDON_TeachWisp == FALSE) && Npc_KnowsInfo(other,DIA_Addon_Saturas_ADW_PreTeachCircle))
	{
		return TRUE;
	};
};

func void DIA_Addon_Riordian_ADW_PreTeach_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_ADW_PreTeach_15_00");	//Ты можешь меня обучить?

	if(hero.guild == GIL_KDW)
	{
		AI_Output(self,other,"DIA_Addon_Riordian_ADW_PreTeach_10_01");	//Я могу тебя обучить искусству алхимии.
		Log_CreateTopic(TOPIC_Addon_KDWTeacher,LOG_NOTE);
		B_LogEntry(TOPIC_Addon_KDWTeacher,LogText_Addon_RiordianTeachAlchemy);
		Riordian_ADW_ADDON_TeachAlchemy = TRUE;
		Riordian_ADW_ADDON_TeachWisp = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Riordian_ADW_PreTeach_10_03");	//Я учу только тех, кто состоит в нашем оредене. А я вижу, что ты не маг Воды!
	};
};

var int DIA_Riordian_ADW_TeachAlchemy_permanent;

instance DIA_Riordian_ADW_TeachAlchemy(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 2;
	condition = DIA_Riordian_ADW_TeachAlchemy_Condition;
	information = DIA_Riordian_ADW_TeachAlchemy_Info;
	permanent = TRUE;
	description = "Научи меня смешивать зелья.";
};

func int DIA_Riordian_ADW_TeachAlchemy_Condition()
{
	if((DIA_Riordian_ADW_TeachAlchemy_permanent == FALSE) && (Riordian_ADW_ADDON_TeachAlchemy == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Riordian_ADW_TeachAlchemy_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_ADW_TeachAlchemy_15_00");	//Научи меня смешивать зелья.

	if(Alchemy_Explain == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_01");	//Магические зелья изготавливаются на алхимическом столе. Мы установили такой стол в одном из зданий наверху.
		AI_Output(self,other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_02");	//Тебе понадобится пустой алхимический сосуд, ингредиенты и, конечно, знание рецепта зелья.
		AI_Output(self,other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_03");	//Рецептам ты можешь научиться у меня. Все остальное тебе придется добыть самому.
		Alchemy_Explain = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_04");	//Какой рецепт ты хочешь выучить?
	};

	Info_ClearChoices(DIA_Riordian_ADW_TeachAlchemy);
	Info_AddChoice(DIA_Riordian_ADW_TeachAlchemy,Dialog_Back,DIA_Riordian_ADW_TeachAlchemy_BACK);

	if((PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] == FALSE))
	{
		if(PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
		{
			Info_AddChoice(DIA_Riordian_ADW_TeachAlchemy,b_buildlearnstringforalchemy("Лечебная эссенция ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_01)),DIA_Riordian_ADW_TeachAlchemy_Health_01);
		};
		if((PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE))
		{
			Info_AddChoice(DIA_Riordian_ADW_TeachAlchemy,b_buildlearnstringforalchemy("Лечебный экстракт ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_02)),DIA_Riordian_ADW_TeachAlchemy_Health_02);
		};
		if(PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
		{
			Info_AddChoice(DIA_Riordian_ADW_TeachAlchemy,b_buildlearnstringforalchemy("Эссенция маны ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_01)),DIA_Riordian_ADW_TeachAlchemy_Mana_01);
		};
		if((PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE))
		{
			Info_AddChoice(DIA_Riordian_ADW_TeachAlchemy,b_buildlearnstringforalchemy("Экстракт маны ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_02)),DIA_Riordian_ADW_TeachAlchemy_Mana_02);
		};
		if((PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE))
		{
			Info_AddChoice(DIA_Riordian_ADW_TeachAlchemy,b_buildlearnstringforalchemy("Эликсир маны ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_03)),DIA_Riordian_ADW_TeachAlchemy_Mana_03);
		};
		if((PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE))
		{
			Info_AddChoice(DIA_Riordian_ADW_TeachAlchemy,b_buildlearnstringforalchemy("Эликсир духа",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_Mana)),DIA_Riordian_ADW_TeachAlchemy_Perm_Mana);
		};
		if(PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] == FALSE)
		{
			Info_AddChoice(DIA_Riordian_ADW_TeachAlchemy,b_buildlearnstringforalchemy("Эликсир ловкости",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_DEX)),DIA_Riordian_ADW_TeachAlchemy_Perm_DEX);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_05");	//Я уже научил тебя всему, что знал сам.
		DIA_Riordian_ADW_TeachAlchemy_permanent = TRUE;
	};
};

func void DIA_Riordian_ADW_TeachAlchemy_BACK()
{
	Info_ClearChoices(DIA_Riordian_ADW_TeachAlchemy);
};

func void DIA_Riordian_ADW_TeachAlchemy_Health_01()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_01);
	Info_ClearChoices(DIA_Riordian_ADW_TeachAlchemy);
};

func void DIA_Riordian_ADW_TeachAlchemy_Health_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_02);
	Info_ClearChoices(DIA_Riordian_ADW_TeachAlchemy);
};

func void DIA_Riordian_ADW_TeachAlchemy_Mana_01()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_01);
	Info_ClearChoices(DIA_Riordian_ADW_TeachAlchemy);
};

func void DIA_Riordian_ADW_TeachAlchemy_Mana_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_02);
	Info_ClearChoices(DIA_Riordian_ADW_TeachAlchemy);
};

func void DIA_Riordian_ADW_TeachAlchemy_Mana_03()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_03);
	Info_ClearChoices(DIA_Riordian_ADW_TeachAlchemy);
};

func void DIA_Riordian_ADW_TeachAlchemy_Perm_Mana()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_Mana);
	Info_ClearChoices(DIA_Riordian_ADW_TeachAlchemy);
};

func void DIA_Riordian_ADW_TeachAlchemy_Perm_DEX()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_DEX);
	Info_ClearChoices(DIA_Riordian_ADW_TeachAlchemy);
};

instance DIA_RIORDIAN_ADW_PRAYFORGOMEZ(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 1;
	condition = dia_riordian_adw_prayforgomez_condition;
	information = dia_riordian_adw_prayforgomez_info;
	permanent = FALSE;
	description = "Мне нужно благословение Аданоса.";
};

func int dia_riordian_adw_prayforgomez_condition()
{
	if((MIS_RESCUEGOMEZ == LOG_Running) && (RESCUEGOMEZSTEPONE == TRUE) && (RESCUEGOMEZSTEPONEDONE == FALSE) && (RESCUEGOMEZPRAYADANOS == FALSE) && (SATURASREFUSEHELPGOMEZ == FALSE) && (SENTTOSATURASGOMEZ == FALSE))
	{
		return TRUE;
	};
};

func void dia_riordian_adw_prayforgomez_info()
{
	AI_Output(other,self,"DIA_Riordian_ADW_PrayForGomez_01_01");	//Мне нужно благословение Аданоса.
	AI_Output(self,other,"DIA_Riordian_ADW_PrayForGomez_01_02");	//Поговори об этом с Сатурасом.
	AI_Output(self,other,"DIA_Riordian_ADW_PrayForGomez_01_03");	//Думаю, он сможет помочь тебе.
	SENTTOSATURASGOMEZ = TRUE;
};

instance DIA_ADDON_RIORDIAN_ADW_TEACHPRE(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 5;
	condition = dia_addon_riordian_ADW_teachpre_condition;
	information = dia_addon_riordian_ADW_teachpre_info;
	description = "Ватрас дал мне этот амулет ищущего огонька...";
};

func int dia_addon_riordian_ADW_teachpre_condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Riordian_HelloADW) && (Riordian_Addon_TeachPlayer == FALSE) && Npc_HasItems(other,ItAm_Addon_WispDetector))
	{
		return TRUE;
	};
};

func void dia_addon_riordian_ADW_teachpre_info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_TeachPre_15_00");	//Ватрас дал мне этот амулет ищущего огонька...
	AI_Output(self,other,"DIA_Addon_Riordian_TeachPre_10_01");	//Ага! (заинтересованно) Это редкий артефакт... Ты знаешь, что ты можешь обучать своего огонька?
	AI_Output(other,self,"DIA_Addon_Riordian_TeachPre_15_02");	//Ты можешь научить меня этому?
	AI_Output(self,other,"DIA_Addon_Riordian_TeachPre_10_03");	//Да, конечно. Я долгое время занимался этой областью магии.
	Riordian_Addon_TeachPlayer = TRUE;
	Log_CreateTopic(TOPIC_Addon_KDWTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_Addon_KDWTeacher,LogText_Addon_RiordianTeach);
};

instance DIA_ADDON_RIORDIAN_ADW_TEACH(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 90;
	condition = dia_addon_riordian_ADW_teach_condition;
	information = dia_addon_riordian_ADW_teach_info;
	permanent = TRUE;
	description = "(обучение ищущего огонька)";
};

var int dia_addon_riordian_ADW_teach_noperm;

func int dia_addon_riordian_ADW_teach_condition()
{
	if((Riordian_Addon_TeachPlayer == TRUE) && (DIA_ADDON_RIORDIAN_ADW_TEACH_NOPERM == FALSE) && Npc_HasItems(other,ItAm_Addon_WispDetector))
	{
		return TRUE;
	};
};

func void dia_addon_riordian_ADW_teach_info()
{
	B_DIA_Addon_Riordian_Teach_15_00();

	if((player_talent_wispdetector[WISPSKILL_NF] == FALSE) || (player_talent_wispdetector[WISPSKILL_FF] == FALSE) || (player_talent_wispdetector[WISPSKILL_NONE] == FALSE) || (player_talent_wispdetector[WISPSKILL_RUNE] == FALSE) || (player_talent_wispdetector[WISPSKILL_MAGIC] == FALSE) || (player_talent_wispdetector[WISPSKILL_FOOD] == FALSE) || (player_talent_wispdetector[WISPSKILL_POTIONS] == FALSE))
	{
		Info_ClearChoices(dia_addon_riordian_ADW_teach);
		Info_AddChoice(dia_addon_riordian_ADW_teach,Dialog_Back,dia_addon_riordian_ADW_teach_back);
		B_DIA_Addon_Riordian_Teach_10_01();

		if(player_talent_wispdetector[WISPSKILL_FF] == FALSE)
		{
			Info_AddChoice(dia_addon_riordian_ADW_teach,"Поиск оружие дальнего боя, стрел и болтов (Требуется: 10 кусков магической руды)",dia_addon_riordian_ADW_teach_wispskill_ff);
		};
		if(player_talent_wispdetector[WISPSKILL_NONE] == FALSE)
		{
			Info_AddChoice(dia_addon_riordian_ADW_teach,"Поиск золота и различной утвари (Требуется: 20 кусков магической руды)",dia_addon_riordian_ADW_teach_wispskill_none);
		};
		if(player_talent_wispdetector[WISPSKILL_RUNE] == FALSE)
		{
			Info_AddChoice(dia_addon_riordian_ADW_teach,"Поиск магических свитков (Требуется: 30 кусков магической руды)",dia_addon_riordian_ADW_teach_wispskill_rune);
		};
		if(player_talent_wispdetector[WISPSKILL_FOOD] == FALSE)
		{
			Info_AddChoice(dia_addon_riordian_ADW_teach,"Поиск еды и растений (Требуется: 50 кусков магической руды)",dia_addon_riordian_ADW_teach_wispskill_food);
		};
		if(player_talent_wispdetector[WISPSKILL_MAGIC] == FALSE)
		{
			Info_AddChoice(dia_addon_riordian_ADW_teach,"Поиск магических колец и амулетов (Требуется: 75 кусков магической руды)",dia_addon_riordian_ADW_teach_wispskill_magic);
		};
		if(player_talent_wispdetector[WISPSKILL_POTIONS] == FALSE)
		{
			Info_AddChoice(dia_addon_riordian_ADW_teach,"Поиск магических зелий (Требуется: 100 кусков магической руды)",dia_addon_riordian_ADW_teach_wispskill_potions);
		};
	}
	else
	{
		B_DIA_Addon_Riordian_Teach_10_08();
		DIA_ADDON_RIORDIAN_ADW_TEACH_NOPERM = TRUE;
	};
};

func void dia_addon_riordian_ADW_teach_wispskill_x()
{
	B_DIA_Addon_Riordian_Teach_WISPSKILL_X_10_00();
};

func void dia_addon_riordian_ADW_teach_back()
{
	Info_ClearChoices(dia_addon_riordian_ADW_teach);
};

func void dia_addon_riordian_ADW_teach_wispskill_ff()
{
	if(b_teachplayertalentwispdetector(self,other,WISPSKILL_FF,10))
	{
		dia_addon_riordian_ADW_teach_wispskill_x();
	};

	Info_ClearChoices(dia_addon_riordian_ADW_teach);
};

func void dia_addon_riordian_ADW_teach_wispskill_none()
{
	if(b_teachplayertalentwispdetector(self,other,WISPSKILL_NONE,20))
	{
		dia_addon_riordian_ADW_teach_wispskill_x();
	};

	Info_ClearChoices(dia_addon_riordian_ADW_teach);
};

func void dia_addon_riordian_ADW_teach_wispskill_rune()
{
	if(b_teachplayertalentwispdetector(self,other,WISPSKILL_RUNE,30))
	{
		dia_addon_riordian_ADW_teach_wispskill_x();
	};

	Info_ClearChoices(dia_addon_riordian_ADW_teach);
};

func void dia_addon_riordian_ADW_teach_wispskill_magic()
{
	if(b_teachplayertalentwispdetector(self,other,WISPSKILL_MAGIC,75))
	{
		dia_addon_riordian_ADW_teach_wispskill_x();
	};

	Info_ClearChoices(dia_addon_riordian_ADW_teach);
};

func void dia_addon_riordian_ADW_teach_wispskill_food()
{
	if(b_teachplayertalentwispdetector(self,other,WISPSKILL_FOOD,50))
	{
		dia_addon_riordian_ADW_teach_wispskill_x();
	};

	Info_ClearChoices(dia_addon_riordian_ADW_teach);
};

func void dia_addon_riordian_ADW_teach_wispskill_potions()
{
	if(b_teachplayertalentwispdetector(self,other,WISPSKILL_POTIONS,100))
	{
		dia_addon_riordian_ADW_teach_wispskill_x();
	};

	Info_ClearChoices(dia_addon_riordian_ADW_teach);
};

instance DIA_Addon_Riordian_LostPower(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 1;
	condition = DIA_Addon_Riordian_LostPower_Condition;
	information = DIA_Addon_Riordian_LostPower_Info;
	important = TRUE;
};

func int DIA_Addon_Riordian_LostPower_Condition()
{
	var int DayNow;

	DayNow = Wld_GetDay();

	if((MIS_LostPower == LOG_Running) && (SaturasKnowPortalOpenDay > 0) && (SaturasKnowPortalOpenDay < DayNow))
	{
		return TRUE;
	};
};

func void DIA_Addon_Riordian_LostPower_Info()
{
	AI_Output(self,other,"DIA_Addon_Riordian_LostPower_01_00");	//Эй, постой! Я слышал, что тебе удалось открыть магический портал, ведущий в неизвестную область.
	AI_Output(self,other,"DIA_Addon_Riordian_LostPower_01_03");	//Сатурас говорит, что там может находиться священная вотчина самого Аданоса!
	AI_Output(self,other,"DIA_Addon_Riordian_LostPower_01_04");	//Исходя из этих соображений, он запрещает нам предпринимать какие-либо попытки ее изучения.
	AI_Output(self,other,"DIA_Addon_Riordian_LostPower_01_05");	//Но, пожалуй, на тебя запрет Сатураса не распространяется.
	AI_Output(other,self,"DIA_Addon_Riordian_LostPower_01_06");	//Что ты хочешь этим сказать?
	AI_Output(self,other,"DIA_Addon_Riordian_LostPower_01_07");	//Ты бы мог сам исследовать эту область и принести мне какие-нибудь документальные свидетельства, связывающие бытность народа Зодчих с тем местом.
	AI_Output(self,other,"DIA_Addon_Riordian_LostPower_01_08");	//Это помогло бы нам лучше понять, как развивалась их цивилизация, пока они не заселили эту долину.
	AI_Output(other,self,"DIA_Addon_Riordian_LostPower_01_09");	//Но, может, это были вовсе не Зодчие?
	AI_Output(self,other,"DIA_Addon_Riordian_LostPower_01_10");	//Да, этого мы не знаем. Но я уверен, что портал был построен именно ими. А значит, они должны были знать, куда он ведет.
	AI_Output(other,self,"DIA_Addon_Riordian_LostPower_01_11");	//Хорошо, я ведь все равно собираюсь идти туда.
	AI_Output(self,other,"DIA_Addon_Riordian_LostPower_01_12");	//Чудесно! Только не говори об этом Сатурасу, иначе он будет в ярости!
	B_LogEntry(TOPIC_LostPower,"Риордиан хочет, чтобы я поискал в найденной мною священной земле Аданоса какие-нибудь документальные свидетельства о цивилизации народа Зодчих.");
};

instance DIA_Addon_Riordian_LostPower_Done(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 2;
	condition = DIA_Addon_Riordian_LostPower_Done_Condition;
	information = DIA_Addon_Riordian_LostPower_Done_Info;
	permanent = TRUE;
	description = "Насчет твоей просьбы...";
};

func int DIA_Addon_Riordian_LostPower_Done_Condition()
{
	if((MIS_LostPower == LOG_Running) && (Npc_HasItems(other,ItMi_LP_StonePlate_01) >= 1) && (Npc_KnowsInfo(other,DIA_Addon_Riordian_LostPower) == TRUE) && (RiordianDayStory == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Riordian_LostPower_Done_Info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_LostPower_Done_01_00");	//Насчет твоей просьбы...
	AI_Output(self,other,"DIA_Addon_Riordian_LostPower_Done_01_01");	//Да? Тебе удалось найти что-нибудь интересное?
	Info_ClearChoices(DIA_Addon_Riordian_LostPower_Done);
	Info_AddChoice(DIA_Addon_Riordian_LostPower_Done,Dialog_Back,DIA_Addon_Riordian_LostPower_Done_Back);

	if(Npc_HasItems(other,ItMi_LP_StonePlate_01) >= 1)
	{
		Info_AddChoice(DIA_Addon_Riordian_LostPower_Done,"Отдать найденные каменные таблички.",DIA_Addon_Riordian_LostPower_Done_StnAll);
	};
};

func void DIA_Addon_Riordian_LostPower_Done_Back()
{
	Info_ClearChoices(DIA_Addon_Riordian_LostPower_Done);
};

func void DIA_Addon_Riordian_LostPower_Done_StnAll()
{
	var int TakeStonePlate;

	TakeStonePlate = Npc_HasItems(other,ItMi_LP_StonePlate_01);
	B_GiveInvItems(other,self,ItMi_LP_StonePlate_01,TakeStonePlate);
	Npc_RemoveInvItems(self,ItMi_LP_StonePlate_01,TakeStonePlate);
	B_GivePlayerXP(TakeStonePlate * 100);

	if(TakeStonePlate > 1)
	{
		AI_Output(other,self,"DIA_Addon_Riordian_LostPower_Done_StnAll_01_00");	//Держи эти каменные таблички. Наверняка ты найдешь в них что-нибудь полезное.
		AI_Output(self,other,"DIA_Addon_Riordian_LostPower_Done_StnAll_01_01");	//Хорошо. Я внимательно их изучу.
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Riordian_LostPower_Done_StnAll_01_02");	//Держи эту каменную табличку. Наверняка ты найдешь в ней что-нибудь полезное.
		AI_Output(self,other,"DIA_Addon_Riordian_LostPower_Done_StnAll_01_03");	//Хорошо. Я внимательно ее изучу.
	};

	AllTakeStonePlate = AllTakeStonePlate + TakeStonePlate;

	if(AllTakeStonePlate >= 15)
	{
		RiordianDayStory = TRUE;
	};
};

instance DIA_Addon_Riordian_LostPower_Know(C_Info)
{
	npc = KDW_14040_Addon_Riordian_ADW;
	nr = 3;
	condition = DIA_Addon_Riordian_LostPower_Know_Condition;
	information = DIA_Addon_Riordian_LostPower_Know_Info;
	permanent = FALSE;
	description = "Что тебе удалось выяснить из всего, что я тебе принес?";
};

func int DIA_Addon_Riordian_LostPower_Know_Condition()
{
	if((MIS_LostPower == LOG_Running) && (RiordianDayStory == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Riordian_LostPower_Know_Info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Addon_Riordian_LostPower_Know_01_00");	//Что тебе удалось выяснить из всего, что я тебе принес?
	AI_Output(self,other,"DIA_Addon_Riordian_LostPower_Know_01_01");	//Немногое. Большинство из этих каменных табличек оказались бесполезным хламом. 
	AI_Output(self,other,"DIA_Addon_Riordian_LostPower_Know_01_02");	//Например, среди них мне попался один очень странный кулинарный рецепт приготовления блюда из мяса глорха.
	AI_Output(self,other,"DIA_Addon_Riordian_LostPower_Know_01_03");	//А другая табличка вообще оказалась любовной запиской. Представляешь?
	AI_Output(other,self,"DIA_Addon_Riordian_LostPower_Know_01_04");	//Значит, все оказалось напрасно?
	AI_Output(self,other,"DIA_Addon_Riordian_LostPower_Know_01_05");	//Не совсем. Были и те, которые помогли прояснить ситуацию, произошедшую на Плато Древних.
	AI_Output(self,other,"DIA_Addon_Riordian_LostPower_Know_01_06");	//(задумчиво) Плато Древних!.. Какое необычное название. Именно так Зодчие называли ту местность, куда вел портал.
	AI_Output(other,self,"DIA_Addon_Riordian_LostPower_Know_01_07");	//Я знаю. Но что же там все-таки произошло?
	AI_Output(self,other,"DIA_Addon_Riordian_LostPower_Know_01_08");	//Какое-то страшное проклятие постигло этот народ. Правда, чем оно вызвано, в найденных тобой записях не указано.
	AI_Output(self,other,"DIA_Addon_Riordian_LostPower_Know_01_09");	//Но очевидно, что за короткий промежуток времени все их земли наводнили жуткие монстры и орды нежити. Люди были в панике и не знали, что делать.
	AI_Output(self,other,"DIA_Addon_Riordian_LostPower_Know_01_10");	//Тогда Куарходрон, великий военачальник Зодчих, собрал огромную армию и попытался уничтожить зло одним решительным ударом.
	AI_Output(self,other,"DIA_Addon_Riordian_LostPower_Know_01_11");	//Битва произошла рядом с местом, именуемом Кхар Арам. К несчастью, Куарходрон и его воины потерпели поражение. Слишком силен был их враг.
	AI_Output(self,other,"DIA_Addon_Riordian_LostPower_Know_01_12");	//С остатками войска и другими жителями долины они укрылись тут, в Яркендаре. А проход, ведущий на плато, запечатали сильной магией.
	AI_Output(other,self,"DIA_Addon_Riordian_LostPower_Know_01_13");	//Интересная история. Только непонятно, кто был их враг?
	AI_Output(self,other,"DIA_Addon_Riordian_LostPower_Know_01_14");	//Мне и самому интересно. И главное - почему Аданос не помог им? Ведь именно ему этот народ поклонялся на протяжении веков.
	AI_Output(other,self,"DIA_Addon_Riordian_LostPower_Know_01_15");	//Может, проклятие наслал сам Аданос?
	AI_Output(self,other,"DIA_Addon_Riordian_LostPower_Know_01_16");	//Нет, скорее, загадка кроется в другом... В некоем артефакте, о котором написано в этих табличках.
	AI_Output(self,other,"DIA_Addon_Riordian_LostPower_Know_01_17");	//Только его название в записях умалчивается. Однако там сказано, что сам Аданос сокрыл его в этой долине от взора своего брата Белиара.
	AI_Output(other,self,"DIA_Addon_Riordian_LostPower_Know_01_18");	//(про себя) Артефакт Белиара... Неужто Коготь?
	MIS_LostPower = LOG_Success;
	Log_SetTopicStatus(TOPIC_LostPower,LOG_Success);
	B_LogEntry(TOPIC_LostPower,"Я принес Риордиану достаточное количество документальных свидетельств о развитии цивилизации Зодчих на плато.");
};