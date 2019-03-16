
instance DIA_Addon_Saturas_ADW_EXIT(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 999;
	condition = DIA_Addon_Saturas_ADW_EXIT_Condition;
	information = DIA_Addon_Saturas_ADW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Saturas_ADW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Saturas_ADW_EXIT_Info()
{
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_EXIT_14_00");	//Пусть Аданос защитит тебя.
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Saturas_ADWStart(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = DIA_Addon_Saturas_ADWStart_Condition;
	information = DIA_Addon_Saturas_ADWStart_Info;
	important = TRUE;
};


func int DIA_Addon_Saturas_ADWStart_Condition()
{
	return TRUE;
};

func void DIA_Addon_Saturas_ADWStart_Info()
{
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_14_00");	//Благодари Аданоса! Наконец-то ты здесь. Мы думали, что ты не появишься снова.
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_15_01");	//Что? Как вы успели ЗДЕСЬ оказаться?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_14_02");	//Ты прошел через портал, мы последовали за тобой. Наша дорога была недолгой.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_14_03");	//Однако тебя там не было. Мы здесь уже несколько дней.
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_15_04");	//НЕСКОЛЬКО ДНЕЙ? Разве это возможно?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_14_05");	//После того как мы не смогли тебя нигде найти, Нефариус решил выяснить, что могло случиться. Казалось, до настоящего момента все его усилия были тщетны.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_14_06");	//Ладно. Теперь ты здесь и можешь приступить к работе.
	Wld_InsertNpc(Giant_Rat,"ADW_PORTALTEMPEL_11");
	Wld_InsertNpc(Giant_Rat,"ADW_PORTALTEMPEL_11");

	if(SBMODE == TRUE)
	{
		Wld_InsertNpc(OrcBiter,"ADW_CANYON_PATH_TO_LIBRARY_31A");
		Wld_InsertNpc(OrcBiter,"ADW_CANYON_PATH_TO_LIBRARY_16A");
		Wld_InsertNpc(Wolf,"ADW_CANYON_PATH_TO_LIBRARY_12A");
		Wld_InsertNpc(Bloodhound,"ADW_CANYON_PATH_TO_MINE2_09");
		Wld_InsertNpc(Giant_DesertRat,"ADW_CANYON_PATH_TO_BANDITS_26");
		Wld_InsertNpc(Giant_DesertRat,"ADW_CANYON_PATH_TO_BANDITS_66");
		Wld_InsertNpc(Minecrawler,"ADW_CANYON_PATH_TO_BANDITS_22");
		Wld_InsertNpc(Minecrawler,"ADW_CANYON_PATH_TO_BANDITS_14");
		Wld_InsertNpc(Gobbo_Black,"ADW_ENTRANCE_2_PIRATECAMP_19");
		Wld_InsertNpc(Gobbo_Black,"ADW_ENTRANCE_2_PIRATECAMP_19");
		Wld_InsertNpc(orcwarrior3,"ADW_CANYON_ORCS_08");
		Wld_InsertNpc(OrcWarrior_Roam,"ADW_CANYON_ORCS_11");
		Wld_InsertNpc(orcwarrior4,"ADW_CANYON_ORCS_01");
		Wld_InsertNpc(orcwarrior3s,"ADW_VALLEY_PATH_035");
	};

	Wld_InsertNpc(CanyonRazor03,"ADW_CANYON_PATH_TO_LIBRARY_07A");
	Wld_InsertNpc(CanyonRazor04,"ADW_CANYON_PATH_TO_LIBRARY_36");
	Wld_InsertNpc(Valley_Troll,"ADW_VALLEY_BIGCAVE_15");
	Wld_InsertItem(itpl_super_herb,"FP_ITEM_VALLEY_05");
	Wld_InsertNpc(MinecrawlerWarrior,"ADW_CANYON_MINE2_09");
	Wld_InsertNpc(MinecrawlerWarrior,"ADW_CANYON_MINE2_09");
	Info_ClearChoices(DIA_Addon_Saturas_ADWStart);
	Info_AddChoice(DIA_Addon_Saturas_ADWStart,"Что произошло за последнее время?",DIA_Addon_Saturas_ADWStart_was);
};

func void DIA_Addon_Saturas_ADWStart_was()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_was_15_00");	//Что происходило тем временем?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_was_14_01");	//Мы узнали много нового.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_was_14_02");	//Землетрясения здесь действительно гораздо сильнее. Сейчас мы находимся не так далеко от их эпицентра.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_was_14_03");	//Мы можем с уверенностью сказать, что строители этих древних сооружений в свое время возвели город на этом месте.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_was_14_04");	//Однако по какой-то причине их культура пришла в упадок.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_was_14_05");	//Но пока мы можем только предполагать, почему это произошло.
	Info_AddChoice(DIA_Addon_Saturas_ADWStart,"Есть какие-нибудь следы пропавших людей?",DIA_Addon_Saturas_ADWStart_missingPeople);
	Info_AddChoice(DIA_Addon_Saturas_ADWStart,"Как насчет Ворона?",DIA_Addon_Saturas_ADWStart_Raven);
};

func void DIA_Addon_Saturas_ADWStart_Raven()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_Raven_15_00");	//Как насчет Ворона?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_Raven_14_01");	//В письме Ворона говорится о храме, в который он пытался проникнуть.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_Raven_14_02");	//Мы едины во мнении, что Ворон ищет способ осквернить храм Аданоса.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_Raven_14_03");	//Очевидно, землетрясение возникает из-за сопротивления могущественного заклинания нечестивым чарам.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_Raven_14_04");	//На воротах храма лежит магическая печать, и именно ее магия оживляет каменных стражей.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_Raven_14_05");	//Храм защищается. Мы должны остановить Ворона до того, как он ворвется в святая святых.
	Info_AddChoice(DIA_Addon_Saturas_ADWStart,"Что дальше?",DIA_Addon_Saturas_ADWStart_wastun);
	Info_AddChoice(DIA_Addon_Saturas_ADWStart,"Ворон всего лишь бывший рудный барон, а не маг.",DIA_Addon_Saturas_ADWStart_RavenOnlyBaron);
	Info_AddChoice(DIA_Addon_Saturas_ADWStart,"Что Ворону нужно в храме?",DIA_Addon_Saturas_ADWStart_RavenAim);
};

func void DIA_Addon_Saturas_ADWStart_RavenAim()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_RavenAim_15_00");	//Что Ворону нужно в храме?
	AI_Output(self,other,"DIA_Addon_Bodo_14_01");	//Мы знаем только, что это касается могущественного артефакта, каким-то образом связанного с Аданосом и Белиаром.
	AI_Output(self,other,"DIA_Addon_Bodo_14_02");	//(мрачно) Естественно, мы не ждем от него ничего хорошего...
};

func void DIA_Addon_Saturas_ADWStart_RavenOnlyBaron()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_RavenOnlyBaron_15_00");	//Ворон всего лишь бывший рудный барон, а не маг. Разве ОН может осуществить подобное?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_RavenOnlyBaron_14_01");	//Возможно, он будет действовать не сам, а наймет какого-нибудь мага-отступника.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_RavenOnlyBaron_14_02");	//Так или иначе, мы ДОЛЖНЫ предотвратить зло.
};

func void DIA_Addon_Saturas_ADWStart_missingPeople()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_missingPeople_15_00");	//Есть какие-нибудь следы пропавших людей?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_missingPeople_14_01");	//Только вчера мы нашли тело рыбака. Оно лежало под развалинами к востоку отсюда.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_missingPeople_14_02");	//Похоже, это был рыбак из Хориниса. Взгляни там.
	Saturas_AboutWilliam = TRUE;
	B_LogEntry(TOPIC_Addon_MissingPeople,LogText_Addon_WilliamLeiche);
};

func void DIA_Addon_Saturas_ADWStart_wastun()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_wastun_15_00");	//Что дальше?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun_14_01");	//Мы останемся здесь и продолжим изучать древнюю культуру.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun_14_02");	//В древних письменах зодчих скрыты многие и многие тайны, которые мы должны разгадать, если хотим понять, что здесь произошло.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun_14_03");	//Тем временем, некоторые вещи для нас должен сделать ты...
	Info_AddChoice(DIA_Addon_Saturas_ADWStart,"Что я должен сделать?",DIA_Addon_Saturas_ADWStart_wastun2);
};

func void DIA_Addon_Saturas_ADWStart_wastun2()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_wastun2_15_00");	//Что я должен сделать?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun2_14_01");	//Ты должен найти Ворона и не дать ему осквернить храм Аданоса.
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_wastun2_15_02");	//То есть я должен буду УБИТЬ его?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun2_14_03");	//Если это будет единственным способом его остановить, то, именем Аданоса, да!
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun2_14_04");	//Собирай все древние реликвии и записи зодчих, которые ты найдешь, и приноси их нам.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun2_14_05");	//Мы должны узнать как можно больше об этих людях и их гибели.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun2_14_06");	//Мы сможем расстроить планы Ворона, только если будем видеть их насквозь.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun2_14_07");	//Кроме того, ты должен найти способ освободить рабов.
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_wastun2_15_08");	//(цинично) И это все? Я сделаю все это одной левой.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun2_14_09");	//(раздраженно) Я знаю, что прошу слишком о многом. Воспринимай это как шанс вернуть мое доверие.
	MIS_ADDON_Saturas_GoToRaven = LOG_Running;
	Log_CreateTopic(TOPIC_Addon_RavenKDW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RavenKDW,LOG_Running);
	B_LogEntry(TOPIC_Addon_RavenKDW,"Ворон оскверняет святой храм Аданоса. Я должен остановить его, даже если мне придется его убить.");
	Log_CreateTopic(TOPIC_Addon_Sklaven,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Sklaven,LOG_Running);
	Log_AddEntry(TOPIC_Addon_Sklaven,"Сатурас хочет, чтобы я освободил рабов.");
	Log_CreateTopic(TOPIC_Addon_Relicts,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Relicts,LOG_Running);
	Log_AddEntry(TOPIC_Addon_Relicts,"Сатурас хочет, чтобы я приносил ему все, что поможет узнать новую информацию о зодчих.");
	Info_AddChoice(DIA_Addon_Saturas_ADWStart,"Тогда я пойду.",DIA_Addon_Saturas_ADWStart_back);
};

func void DIA_Addon_Saturas_ADWStart_back()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_back_15_00");	//Тогда я пойду.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_back_14_01");	//Еще одно... Ворон собрал вокруг себя большую шайку бандитов.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_back_14_02");	//В твое отсутствие к нам прибыл еще один член Кольца Воды.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_back_14_03");	//Мы отправили его на болото. Он не вернулся.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_back_14_04");	//Подозреваем, что бандиты нападают на всех, кто выглядит иначе, чем они.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_back_14_05");	//Поэтому тебе следует обзавестись такими же доспехами, как у них.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_back_14_06");	//Это единственный способ подобраться к ним поближе так, чтобы на тебя сразу же не напали.
	Log_CreateTopic(TOPIC_Addon_BDTRuestung,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BDTRuestung,LOG_Running);
	B_LogEntry(TOPIC_Addon_BDTRuestung,"Бандиты убивают всех, кто не выглядит, как они. Чтобы попасть к ним, мне нужны бандитские доспехи.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};

instance DIA_Addon_Saturas_PoorRanger(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 2;
	condition = DIA_Addon_Saturas_PoorRanger_Condition;
	information = DIA_Addon_Saturas_PoorRanger_Info;
	description = "Кем был тот бедняга, которого вы послали на болото?";
};


func int DIA_Addon_Saturas_PoorRanger_Condition()
{
	return TRUE;
};

func void DIA_Addon_Saturas_PoorRanger_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_PoorRanger_15_00");	//Кем был тот бедняга, которого вы послали на болото?
	AI_Output(self,other,"DIA_Addon_Saturas_PoorRanger_14_01");	//Его звали Ланс.
	AI_Output(self,other,"DIA_Addon_Saturas_PoorRanger_14_02");	//Боюсь, он не ушел далеко.
	Log_CreateTopic(TOPIC_Addon_Lance,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Lance,LOG_Running);
	Log_AddEntry(TOPIC_Addon_Lance,"Сатурас послал на болото человека по имени Ланс. Он боится, что Лансу не удалось далеко уйти.");
};

instance DIA_Addon_Saturas_WhatThink(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 2;
	condition = DIA_Addon_Saturas_WhatThink_Condition;
	information = DIA_Addon_Saturas_WhatThink_Info;
	description = "Что ты думаешь о Вороне?";
};

func int DIA_Addon_Saturas_WhatThink_Condition()
{
	return TRUE;
};

func void DIA_Addon_Saturas_WhatThink_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_WhatThink_01_00");	//Что ты думаешь о Вороне?
	AI_Output(self,other,"DIA_Addon_Saturas_WhatThink_01_01");	//В Старом Лагере он был правой рукой Гомеза и одним из самых влиятельных людей колонии.
	AI_Output(self,other,"DIA_Addon_Saturas_WhatThink_01_02");	//Не знаю, как он вступил на путь зла, но его действия носят очень серьезный характер, и нам необходимо его остановить!
	AI_Output(self,other,"DIA_Addon_Saturas_WhatThink_01_03");	//Правда, мне кажется, что Ворон является лишь исполнителем чужой воли. А истинное зло нам еще не явило своего лица. 
};

instance DIA_Addon_Saturas_Piraten(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = DIA_Addon_Saturas_Piraten_Condition;
	information = DIA_Addon_Saturas_Piraten_Info;
	description = "Где можно найти бандитские доспехи моего размера?";
};


func int DIA_Addon_Saturas_Piraten_Condition()
{
	if((AlligatorJack.aivar[AIV_TalkedToPlayer] == FALSE) && (Greg.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Saturas_Piraten_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_Piraten_15_00");	//Где можно найти бандитские доспехи моего размера?
	AI_Output(self,other,"DIA_Addon_Saturas_Piraten_14_01");	//Кажется, к западу отсюда был лагерь пиратов.
	AI_Output(self,other,"DIA_Addon_Saturas_Piraten_14_02");	//Насколько нам известно, они поддерживают связь с бандитами.
	AI_Output(self,other,"DIA_Addon_Saturas_Piraten_14_03");	//Думаю, что они не нападут на тебя, когда ты подойдешь.
	AI_Output(self,other,"DIA_Addon_Saturas_Piraten_14_04");	//Возможно, они смогут тебе чем-нибудь помочь.
	B_LogEntry(TOPIC_Addon_BDTRuestung,"Сатурас сказал, что пираты могут помочь мне достать доспехи бандитов.");
};


instance DIA_Addon_Saturas_LanceLeiche(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 2;
	condition = DIA_Addon_Saturas_LanceLeiche_Condition;
	information = DIA_Addon_Saturas_LanceLeiche_Info;
	description = "Я нашел тело Ланса.";
};


func int DIA_Addon_Saturas_LanceLeiche_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Saturas_PoorRanger) && (Npc_HasItems(NONE_Addon_114_Lance_ADW,ItRi_LanceRing) == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Saturas_LanceLeiche_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_LanceLeiche_15_00");	//Я нашел тело Ланса.
	AI_Output(self,other,"DIA_Addon_Saturas_LanceLeiche_14_01");	//Да пребудет его душа в царстве Аданоса.
	AI_Output(self,other,"DIA_Addon_Saturas_LanceLeiche_14_02");	//Будь осторожней, сынок. Я не хочу скорбеть об еще одной такой потере.
	TOPIC_End_Lance = TRUE;
	B_GivePlayerXP(XP_Addon_LanceLeiche);
};

instance DIA_Addon_Saturas_LanceChange(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 2;
	condition = DIA_Addon_Saturas_LanceChange_Condition;
	information = DIA_Addon_Saturas_LanceChange_Info;
	permanent = FALSE;
	description = "Кто теперь заменит Ланса?";
};

func int DIA_Addon_Saturas_LanceChange_Condition()
{
	if(TOPIC_End_Lance == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_LanceChange_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_LanceChange_01_00");	//Кто теперь заменит Ланса?
	AI_Output(self,other,"DIA_Addon_Saturas_LanceChange_01_01");	//Даже не знаю. Все остальные братья Кольца Воды сейчас заняты другими важными поручениями.
	AI_Output(other,self,"DIA_Addon_Saturas_LanceChange_01_02");	//На мой взгляд, вам просто не хватает людей.
	AI_Output(self,other,"DIA_Addon_Saturas_LanceChange_01_03");	//Это правда, сын мой...(удрученно) Но мы вряд ли найдем здесь кого-то достойного на место Ланса.
	AI_Output(self,other,"DIA_Addon_Saturas_LanceChange_01_04");	//Ведь кругом только бандиты и пираты.
	MIS_LanceChange = LOG_Running;
	Log_CreateTopic(TOPIC_LanceChange,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LanceChange,LOG_Running);
	B_LogEntry(TOPIC_LanceChange,"Сатурас полагает, что в этой части острова вряд ли найдется человек, который сможет заменить Ланса. Но кто знает, вдруг мне удастся найти такого?");
};

instance DIA_Addon_Saturas_LanceChange_Eremit(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 2;
	condition = DIA_Addon_Saturas_LanceChange_Eremit_Condition;
	information = DIA_Addon_Saturas_LanceChange_Eremit_Info;
	permanent = FALSE;
	description = "Я нашел вам нового помощника.";
};

func int DIA_Addon_Saturas_LanceChange_Eremit_Condition()
{
	if((MIS_LanceChange == LOG_Running) && (EremitAgreed == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_LanceChange_Eremit_Info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Addon_Saturas_LanceChange_Eremit_01_00");	//Я нашел вам нового помощника.
	AI_Output(self,other,"DIA_Addon_Saturas_LanceChange_Eremit_01_01");	//И кто же он?
	AI_Output(other,self,"DIA_Addon_Saturas_LanceChange_Eremit_01_02");	//Его зовут Эрмит. Он отшельник и живет в глубине долины.
	AI_Output(self,other,"DIA_Addon_Saturas_LanceChange_Eremit_01_03");	//Думаешь, он может быть нам полезен?
	AI_Output(other,self,"DIA_Addon_Saturas_LanceChange_Eremit_01_04");	//Более чем. К тому же он кое-что знает о культуре Зодчих и еще умеет читать древние таблички.
	AI_Output(self,other,"DIA_Addon_Saturas_LanceChange_Eremit_01_05");	//Правда? Хммм...(задумчиво) Хорошо, сын мой. Я согласен принять его в наши ряды.
	MIS_LanceChange = LOG_Success;
	Log_SetTopicStatus(TOPIC_LanceChange,LOG_Success);
	B_LogEntry(TOPIC_LanceChange,"Сатурас согласился взять Эрмита в качестве помощника магов. Надо бы сообщить об этом самому Эрмиту.");
};

instance DIA_Addon_Saturas_LanceRing(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = DIA_Addon_Saturas_LanceRing_Condition;
	information = DIA_Addon_Saturas_LanceRing_Info;
	description = "У меня аквамариновое кольцо Ланса.";
};


func int DIA_Addon_Saturas_LanceRing_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Saturas_LanceLeiche) && Npc_HasItems(other,ItRi_LanceRing))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Saturas_LanceRing_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_LanceRing_15_00");	//У меня аквамариновое кольцо Ланса.
	AI_Output(self,other,"DIA_Addon_Saturas_LanceRing_14_01");	//Лучше отдай его мне, чтобы оно не попало в дурные руки.
	B_GiveInvItems(other,self,ItRi_LanceRing,1);
	B_GivePlayerXP(XP_Addon_LanceRing);
};


instance DIA_Addon_Saturas_Tokens(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 10;
	condition = DIA_Addon_Saturas_Tokens_Condition;
	information = DIA_Addon_Saturas_Tokens_Info;
	permanent = TRUE;
	description = "Насчет реликвий...";
};


func int DIA_Addon_Saturas_Tokens_Condition()
{
	if(Saturas_SCBroughtAllToken == FALSE)
	{
		return TRUE;
	};
	return FALSE;
};


var int DIA_Addon_Saturas_Tokens_OneTime;
var int Saturas_SCBroughtAllToken;
var int Saturas_BroughtTokenAmount;
var int ScBroughtToken;
var int Saturas_SCFound_ItMi_Addon_Stone_01;
var int Saturas_SCFound_ItMi_Addon_Stone_02;
var int Saturas_SCFound_ItMi_Addon_Stone_03;
var int Saturas_SCFound_ItMi_Addon_Stone_04;
var int Saturas_SCFound_ItMi_Addon_Stone_05;

func void DIA_Addon_Saturas_Tokens_Info()
{
	var int BroughtToken;
	var int XP_BroughtTokens;
	var int Kohle;
	AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_00");	//Насчет реликвий...
	if((DIA_Addon_Saturas_Tokens_OneTime == FALSE) && (C_ScHasMagicStonePlate() || Npc_HasItems(other,ItWr_StonePlateCommon_Addon)))
	{
		AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_01");	//У меня для тебя кое-что есть.
		AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_02");	//Нам уже известны подобные каменные таблички. От них нам мало прока.
		AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_03");	//Должно же быть что-то еще.
		DIA_Addon_Saturas_Tokens_OneTime = TRUE;
	};
	BroughtToken = 0;
	XP_BroughtTokens = 0;
	if((Npc_HasItems(other,ItMi_Addon_Stone_01) && (Saturas_SCFound_ItMi_Addon_Stone_01 == FALSE)) || (Npc_HasItems(other,ItMi_Addon_Stone_02) && (Saturas_SCFound_ItMi_Addon_Stone_02 == FALSE)) || (Npc_HasItems(other,ItMi_Addon_Stone_03) && (Saturas_SCFound_ItMi_Addon_Stone_03 == FALSE)) || (Npc_HasItems(other,ItMi_Addon_Stone_04) && (Saturas_SCFound_ItMi_Addon_Stone_04 == FALSE)) || (Npc_HasItems(other,ItMi_Addon_Stone_05) && (Saturas_SCFound_ItMi_Addon_Stone_05 == FALSE)))
	{
		AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_04");	//Как насчет ЭТОГО?
		AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_05");	//Выглядит неплохо. Где ты это нашел?
		B_LogEntry(TOPIC_Addon_Relicts,"Я отдал Сатурасу следующие реликвии:");
		if(Npc_HasItems(other,ItMi_Addon_Stone_01) && (Saturas_SCFound_ItMi_Addon_Stone_01 == FALSE))
		{
			B_GiveInvItems(other,self,ItMi_Addon_Stone_01,1);
			Saturas_SCFound_ItMi_Addon_Stone_01 = TRUE;
			BroughtToken = BroughtToken + 1;
			AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_06");	//Бандиты используют эти таблички в качестве денег.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_07");	//На табличках знак Куарходрона, великого воина.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_08");	//Это и есть тот командующий, по вине сына которого, Радемеса, погиб весь город.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_09");	//(презрительно) Бьюсь об заклад, бандиты даже не знают, что они используют вместо денег.
			Log_AddEntry(TOPIC_Addon_Relicts,"Красная каменная табличка. Бандиты используют такие таблички в качестве денег. На ней нанесено имя великого воина Куарходрона.");
		};
		if(Npc_HasItems(other,ItMi_Addon_Stone_02) && (Saturas_SCFound_ItMi_Addon_Stone_02 == FALSE))
		{
			B_GiveInvItems(other,self,ItMi_Addon_Stone_02,1);
			Saturas_SCFound_ItMi_Addon_Stone_02 = TRUE;
			BroughtToken = BroughtToken + 1;
			AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_10");	//Я нашел эту табличку в здании к югу отсюда.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_11");	//A! Табличка стражей мертвых. Вот кто вызвал духов их мертвецов.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_12");	//Зодчие поддерживали очень тесную связь с предками.
			Log_AddEntry(TOPIC_Addon_Relicts,"Фиолетовая каменная табличка из дворца стражей мертвых на юге.");
		};
		if(Npc_HasItems(other,ItMi_Addon_Stone_03) && (Saturas_SCFound_ItMi_Addon_Stone_03 == FALSE))
		{
			B_GiveInvItems(other,self,ItMi_Addon_Stone_03,1);
			Saturas_SCFound_ItMi_Addon_Stone_03 = TRUE;
			BroughtToken = BroughtToken + 1;
			AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_13");	//Я нашел эту табличку в здании к юго-западу отсюда.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_14");	//Судя по табличке, она как-то связана с дворцом городских жрецов.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_15");	//Верховного жреца звали Кардимон. О нем известно немного.
			Log_AddEntry(TOPIC_Addon_Relicts,"Синяя каменная табличка из дворца жрецов на юго-западе.");
		};
		if(Npc_HasItems(other,ItMi_Addon_Stone_04) && (Saturas_SCFound_ItMi_Addon_Stone_04 == FALSE))
		{
			B_GiveInvItems(other,self,ItMi_Addon_Stone_04,1);
			Saturas_SCFound_ItMi_Addon_Stone_04 = TRUE;
			BroughtToken = BroughtToken + 1;
			AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_15");	//Это лежало у здания рядом с огромным болотом.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_16");	//Скорее всего, это был дворец целителей.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_17");	//О них мы знаем немного. Похоже, они исчезли первыми.
			Log_AddEntry(TOPIC_Addon_Relicts,"Зеленая каменная табличка из дворца целителей в южной части болота.");
		};
		if(Npc_HasItems(other,ItMi_Addon_Stone_05) && (Saturas_SCFound_ItMi_Addon_Stone_05 == FALSE))
		{
			B_GiveInvItems(other,self,ItMi_Addon_Stone_05,1);
			Saturas_SCFound_ItMi_Addon_Stone_05 = TRUE;
			BroughtToken = BroughtToken + 1;
			AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_18");	//Эта вещь лежала в большом здании в глубоком ущелье.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_19");	//Это библиотека древнего народа.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_20");	//Предположительно, это табличка ученых.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_80");	//Многие найденные нами письмена ведут к главе касты ученых.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_81");	//Довольно любопытно, что он нигде не оставил своего имени...
			Log_AddEntry(TOPIC_Addon_Relicts,"Желтая каменная табличка из Библиотеки ученых на севере.");
		};
		if(SC_Knows_WeaponInAdanosTempel == TRUE)
		{
		};
		XP_BroughtTokens = XP_Addon_ForOneToken * BroughtToken;
		B_GivePlayerXP(XP_BroughtTokens);
		Saturas_BroughtTokenAmount = Saturas_BroughtTokenAmount + BroughtToken;
		if(Saturas_BroughtTokenAmount < 5)
		{
			if(Ghost_SCKnowsHow2GetInAdanosTempel == FALSE)
			{
				AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_21");	//Очень хорошо. Образ города проясняется, но мы все еще знаем недостаточно.
			};
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_22");	//Всего в этой местности должно быть спрятано пять разных видов табличек.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_23");	//Найди их и принеси мне.
		};
		AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_24");	//Вот немного золота в качестве вознаграждения.
		Kohle = 200 * BroughtToken;
		CreateInvItems(self,ItMi_Gold,Kohle);
		B_GiveInvItems(self,other,ItMi_Gold,Kohle);
		ScBroughtToken = TRUE;
	};
	if(Saturas_BroughtTokenAmount == 5)
	{
		AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_25");	//Теперь мы собрали все необходимые реликвии.
		if(Ghost_SCKnowsHow2GetInAdanosTempel == FALSE)
		{
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_26");	//Ты оказал нам огромную услугу. Благодарю тебя.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_27");	//Благодаря этому мы сделаем в наших исследованиях большой шаг вперед.
		};
		MIS_Saturas_LookingForHousesOfRulers = LOG_SUCCESS;
		Saturas_SCBroughtAllToken = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_28");	//Посмотрим, смогу ли я что-нибудь найти.
		AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_29");	//Хорошо. Но торопись! Время работает против нас.
	};
};


instance DIA_Addon_Saturas_StonePlateHint(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = DIA_Addon_Saturas_StonePlateHint_Condition;
	information = DIA_Addon_Saturas_StonePlateHint_Info;
	important = TRUE;
};


func int DIA_Addon_Saturas_StonePlateHint_Condition()
{
	if(((Merdarion_GotFocusCount >= 2) || (RavenIsInTempel == TRUE)) && (Saturas_SCBroughtAllToken == FALSE) && (Ghost_SCKnowsHow2GetInAdanosTempel == FALSE) && (RavenAway == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Saturas_StonePlateHint_Info()
{
	AI_Output(self,other,"DIA_Addon_Saturas_StonePlateHint_14_00");	//Хорошо, что ты пришел. Мы хотим поделиться с тобой новыми открытиями.
	AI_Output(other,self,"DIA_Addon_Saturas_StonePlateHint_15_01");	//Рассказывай.
	AI_Output(self,other,"DIA_Addon_Saturas_StonePlateHint_14_02");	//Затонувший город когда-то назывался Яркендар. Его народом совместно управляли пять властителей.
	AI_Output(self,other,"DIA_Addon_Saturas_StonePlateHint_14_03");	//У каждого из этих властителей был дворец, в котором властитель жил и держал свое имущество.
	AI_Output(self,other,"DIA_Addon_Saturas_StonePlateHint_14_04");	//Поэтому в поисках остатков древней культуры тебе важнее всего исследовать эти дворцы.
	MIS_Saturas_LookingForHousesOfRulers = LOG_Running;
	Info_ClearChoices(DIA_Addon_Saturas_StonePlateHint);
	Info_AddChoice(DIA_Addon_Saturas_StonePlateHint,"А что, если от них ничего не осталось?",DIA_Addon_Saturas_StonePlateHint_unter);
	Info_AddChoice(DIA_Addon_Saturas_StonePlateHint,"Где мне искать дворцы?",DIA_Addon_Saturas_StonePlateHint_wo);
};

func void DIA_Addon_Saturas_StonePlateHint_wo()
{
	AI_Output(other,self,"DIA_Addon_Saturas_StonePlateHint_wo_15_00");	//Где мне искать дворцы?
	AI_Output(self,other,"DIA_Addon_Saturas_StonePlateHint_wo_14_01");	//Риордиан изучил устройство зданий в Яркендаре.
	AI_Output(self,other,"DIA_Addon_Saturas_StonePlateHint_wo_14_02");	//Он скажет, где тебе искать эти дворцы.
	Log_CreateTopic(TOPIC_Addon_HousesOfRulers,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_HousesOfRulers,LOG_Running);
	B_LogEntry(TOPIC_Addon_HousesOfRulers,"Сатурас хочет, чтобы я обыскал дворцы зодчих. Риордиан скажет мне, где найти эти строения.");
};

func void DIA_Addon_Saturas_StonePlateHint_unter()
{
	AI_Output(other,self,"DIA_Addon_Saturas_StonePlateHint_unter_15_00");	//А что, если от них ничего не осталось?
	AI_Output(self,other,"DIA_Addon_Saturas_StonePlateHint_unter_14_01");	//Если ты не найдешь их, то скорее всего они утонули вместе с городом.
	AI_Output(self,other,"DIA_Addon_Saturas_StonePlateHint_unter_14_02");	//Однако если они существуют, то их важность для наших исследований невозможно переоценить.
};


instance DIA_Addon_Saturas_SCBroughtAllToken(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = DIA_Addon_Saturas_SCBroughtAllToken_Condition;
	information = DIA_Addon_Saturas_SCBroughtAllToken_Info;
	description = "Зачем вам пять каменных табличек?";
};


func int DIA_Addon_Saturas_SCBroughtAllToken_Condition()
{
	if((ScBroughtToken == TRUE) && (Ghost_SCKnowsHow2GetInAdanosTempel == FALSE) && (RavenAway == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Saturas_SCBroughtAllToken_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_SCBroughtAllToken_15_00");	//Зачем вам пять каменных табличек?
	AI_Output(self,other,"DIA_Addon_Saturas_SCBroughtAllToken_14_01");	//Записи, которые мы смогли найти в развалинах, неполные.
	AI_Output(self,other,"DIA_Addon_Saturas_SCBroughtAllToken_14_02");	//Но в письменах зодчих говорится о пяти властителях, которые управляли городом.
	AI_Output(self,other,"DIA_Addon_Saturas_SCBroughtAllToken_14_03");	//У каждого из них было по одной такой табличке в качестве символа власти.
	AI_Output(self,other,"DIA_Addon_Saturas_SCBroughtAllToken_14_04");	//Думаю, разгадка всех наших вопросов именно в этих табличках.
};


instance DIA_Addon_Saturas_Flut(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = DIA_Addon_Saturas_Flut_Condition;
	information = DIA_Addon_Saturas_Flut_Info;
	description = "Нефариус рассказал мне про потоп...";
};


func int DIA_Addon_Saturas_Flut_Condition()
{
	if((NefariusADW_Talk2Saturas == TRUE) && (RavenAway == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Saturas_Flut_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_Flut_15_00");	//Нефариус рассказал мне про потоп...
	AI_Output(self,other,"DIA_Addon_Saturas_Flut_14_02");	//Написано, что сам Аданос снизошел с небес, чтобы наказать неверных и ввергнуть их в царство мертвых.
	AI_Output(self,other,"DIA_Addon_Saturas_Flut_14_03");	//Объятый святым гневом, он приказал морю обрушиться на строителей города и таким образом стер его с лица земли.
	AI_Output(self,other,"DIA_Addon_Saturas_Flut_14_04");	//Болото к востоку отсюда было свидетелем этих давно минувших событий.
	TOPIC_END_Flut = TRUE;
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Addon_Saturas_AdanosZorn(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = DIA_Addon_Saturas_AdanosZorn_Condition;
	information = DIA_Addon_Saturas_AdanosZorn_Info;
	description = "Что могло так разгневать Аданоса?";
};


func int DIA_Addon_Saturas_AdanosZorn_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Saturas_Flut) && (RavenAway == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Saturas_AdanosZorn_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_AdanosZorn_15_00");	//Что могло так разгневать Аданоса?
	AI_Output(self,other,"DIA_Addon_Saturas_AdanosZorn_14_01");	//В свое время храм этого города был великим и знаменитым сооружением.
	AI_Output(self,other,"DIA_Addon_Saturas_AdanosZorn_14_02");	//Все почитали его и молились нашему богу Аданосу.
	AI_Output(self,other,"DIA_Addon_Saturas_AdanosZorn_14_03");	//Радемес, сын командующего Куарходрона, осквернил храм.
	AI_Output(self,other,"DIA_Addon_Saturas_AdanosZorn_14_04");	//В результате этого жители один за другим пали жертвой зла.
	AI_Output(self,other,"DIA_Addon_Saturas_AdanosZorn_14_05");	//Подозреваю, что Аданос не мог простить этого, и его возмездие обрушилось на весь край.
	AI_Output(self,other,"DIA_Addon_Saturas_AdanosZorn_14_06");	//Именно поэтому так важно остановить Ворона. Он собирается сделать то же самое...
};


instance DIA_Addon_Saturas_RavenInfos(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 9;
	condition = DIA_Addon_Saturas_RavenInfos_Condition;
	information = DIA_Addon_Saturas_RavenInfos_Info;
	permanent = TRUE;
	description = "Насчет Ворона...";
};


var int DIA_Addon_Saturas_RavenInfos_OneTime1;
var int DIA_Addon_Saturas_RavenInfos_OneTime2;
var int DIA_Addon_Saturas_RavenInfos_OneTime3;
var int DIA_Addon_Saturas_RavenInfos_OneTime4;
var int DIA_Addon_Saturas_RavenInfos_OneTime5;
var int Addon_Saturas_Fortuno;

func int DIA_Addon_Saturas_RavenInfos_Condition()
{
	if((MIS_ADDON_Saturas_GoToRaven == LOG_Running) && (RavenAway == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_RavenInfos_Info()
{
	var int RavenNeuigkeit;
	var int XP_RavenNeuigkeit;
	AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_00");	//Насчет Ворона...
	RavenNeuigkeit = 0;
	if((Thorus.aivar[AIV_TalkedToPlayer] == TRUE) && (DIA_Addon_Saturas_RavenInfos_OneTime1 == FALSE) && (RavenIsInTempel == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_01");	//Я побывал в лагере бандитов к востоку отсюда. Ворон - их предводитель.
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_02");	//Но прежде чем оказаться рядом с Вороном, я был вынужден убрать с дороги нескольких бандитов.
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_03");	//Отлично. Удачи. Но не забывай, что тебе нужно действовать быстро.
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_04");	//Ворон ни при каких обстоятельствах не должен достигнуть цели.
		DIA_Addon_Saturas_RavenInfos_OneTime1 = TRUE;
		RavenNeuigkeit = RavenNeuigkeit + 1;
	};
	if((SC_KnowsRavensGoldmine == TRUE) && (DIA_Addon_Saturas_RavenInfos_OneTime2 == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_05");	//Он владеет золотым рудником и заключенными, добывающими золото.
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_06");	//Это на него похоже. Ты должен освободить узников.
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_07");	//(вздыхает) Да, конечно. Я работаю над этим.
		DIA_Addon_Saturas_RavenInfos_OneTime2 = TRUE;
		RavenNeuigkeit = RavenNeuigkeit + 1;
	};
	if((SC_KnowsFortunoInfos == TRUE) && (DIA_Addon_Saturas_RavenInfos_OneTime3 == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_08");	//Один парень из бандитов заявляет, что знает о планах Ворона.
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_09");	//Его зовут Фортуно. Он говорит, что Ворон хочет проникнуть в храм, чтобы завладеть могущественным артефактом.
		AI_Output(self,other,"DIA_Addon_Bodo_14_03");	//И? Знал ли он еще что-нибудь про этот артефакт?
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_11");	//Он рассказал мне только о том, что Ворон вскрыл гробницу жреца Аданоса.
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_12");	//В этой гробнице может быть ключ от храма. Осмотри ее.
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_13");	//Ворон заставил узников раскопать гробницу жреца.
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_14");	//Плохо! Ты должен поторопиться и остановить Ворона.
		Addon_Saturas_Fortuno = TRUE;
		DIA_Addon_Saturas_RavenInfos_OneTime3 = TRUE;
		RavenNeuigkeit = RavenNeuigkeit + 1;
	};
	if((RavenIsInTempel == TRUE) && (DIA_Addon_Saturas_RavenInfos_OneTime4 == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_15");	//Я пробрался в покои Ворона.
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_16");	//И? Что с Вороном?
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_17");	//Я опоздал. Он скрылся в храме Аданоса у меня на глазах.
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_18");	//(взволнованно) Что?! Это КАТАСТРОФА! Почему ты не последовал за ним?!
		DIA_Addon_Saturas_RavenInfos_OneTime4 = TRUE;
		MIS_ADDON_Saturas_GoToRaven = LOG_SUCCESS;
		RavenNeuigkeit = RavenNeuigkeit + 1;
	};
	if(RavenNeuigkeit != 0)
	{
		XP_RavenNeuigkeit = RavenNeuigkeit * XP_Ambient;
		B_GivePlayerXP(XP_RavenNeuigkeit);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_19");	//Ты можешь рассказать что-то новое?
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_20");	//Нет, пока ничего.
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_21");	//Мой тебе совет: не стоит недооценивать Ворона. Запомни это.
	};
};


instance DIA_Addon_Saturas_TuerZu(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = DIA_Addon_Saturas_TuerZu_Condition;
	information = DIA_Addon_Saturas_TuerZu_Info;
	description = "Я не смог последовать за Вороном!";
};


func int DIA_Addon_Saturas_TuerZu_Condition()
{
	if((MIS_ADDON_Saturas_GoToRaven == LOG_SUCCESS) && (RavenAway == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Saturas_TuerZu_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_TuerZu_15_00");	//Я не смог последовать за Вороном. Он закрыл вход изнутри.
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_02");	//Я должен подумать...
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_03");	//Нам нужно понять, как Ворон смог попасть в храм...
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_04");	//Что он делал перед тем, как открыть проход в храм?
	AI_Output(other,self,"DIA_Addon_Saturas_TuerZu_15_05");	//Прочитал перед воротами заклинание.
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_06");	//А до этого?
	AI_Output(other,self,"DIA_Addon_Saturas_TuerZu_15_07");	//Он вскрыл гробницу жреца.
	if(Addon_Saturas_Fortuno == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Saturas_TuerZu_15_09");	//Я же тебе об этом уже говорил...
		AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_10");	//Верно!
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Saturas_TuerZu_15_08");	//Я знаю только то, что он провел там какой-то ритуал...
	};
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_11");	//(задумчиво) Ритуал...
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_12");	//Да! Правильно!
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_13");	//Боюсь, Ворон получил силу стражей мертвых.
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_14");	//Он получил знание о том, как попасть в храм, у духа!
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_15");	//Ты должен рассказать об этом Миксиру!
	Log_CreateTopic(TOPIC_Addon_Quarhodron,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Quarhodron,LOG_Running);
	B_LogEntry(TOPIC_Addon_Quarhodron,"Ворон обрел силу стражей мертвых. Он получил от призрака знания о храме Аданоса. Я должен рассказать об этом Миксиру.");
	Saturas_RiesenPlan = TRUE;
};


instance DIA_Addon_Saturas_GhostQuestions(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = DIA_Addon_Saturas_GhostQuestions_Condition;
	information = DIA_Addon_Saturas_GhostQuestions_Info;
	description = "Я говорил с Куарходроном.";
};


func int DIA_Addon_Saturas_GhostQuestions_Condition()
{
	if((Npc_IsDead(Quarhodron) == FALSE) && (SC_TalkedToGhost == TRUE) && (Ghost_SCKnowsHow2GetInAdanosTempel == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Saturas_GhostQuestions_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_GhostQuestions_15_00");	//Я говорил с Куарходроном.
	AI_Output(self,other,"DIA_Addon_Saturas_GhostQuestions_14_01");	//Что же он тебе сказал?
	AI_Output(other,self,"DIA_Addon_Saturas_GhostQuestions_15_02");	//Что он поможет мне только в том случае, если я отвечу на его вопросы.
	AI_Output(self,other,"DIA_Addon_Saturas_GhostQuestions_14_03");	//И в чем проблема?
	AI_Output(other,self,"DIA_Addon_Saturas_GhostQuestions_15_04");	//Я не знаю правильных ответов.
	AI_Output(self,other,"DIA_Addon_Saturas_GhostQuestions_14_05");	//Хммм...(задумчиво) Нам известно, что на севере отсюда находится библиотека ученых.
	AI_Output(self,other,"DIA_Addon_Saturas_GhostQuestions_14_06");	//Ученые тщательно записывали сведения обо всех важных событиях прошлого.
	AI_Output(self,other,"DIA_Addon_Saturas_GhostQuestions_14_07");	//Возможно, в библиотеке ты найдешь ответы на вопросы Куарходрона.
	B_LogEntry(TOPIC_Addon_Quarhodron,"Сатурас думает, что я смогу найти ответы на вопросы Куарходрона в библиотеке ученых. Она находится далеко на севере.");
};


instance DIA_Addon_Saturas_TalkedToGhost(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = DIA_Addon_Saturas_TalkedToGhost_Condition;
	information = DIA_Addon_Saturas_TalkedToGhost_Info;
	description = "Проблема с воротами храма решена.";
};


func int DIA_Addon_Saturas_TalkedToGhost_Condition()
{
	if((Ghost_SCKnowsHow2GetInAdanosTempel == TRUE) && (RavenAway == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Saturas_TalkedToGhost_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_TalkedToGhost_15_00");	//Проблема с воротами храма решена.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_14_01");	//Дух заговорил?
	AI_Output(other,self,"DIA_Addon_Saturas_TalkedToGhost_15_02");	//Да.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_14_03");	//Значит, ты знаешь, как попасть в храм?
	AI_Output(other,self,"DIA_Addon_Saturas_TalkedToGhost_15_04");	//Именно так. И еще дух рассказал мне, что ждет меня внутри.
	AI_Output(other,self,"DIA_Addon_Saturas_TalkedToGhost_15_05");	//Он говорил о могущественном мече и залах Аданоса.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_14_06");	//О, Аданос! Какие же мы глупцы. Как мы могли быть так слепы?
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_14_07");	//В записях же все сказано...
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_14_08");	//Этот меч - не что иное, как Коготь Белиара.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_14_09");	//Мы должны как можно скорее пройти через Залы Аданоса и забрать меч.
	Info_ClearChoices(DIA_Addon_Saturas_TalkedToGhost);
	Info_AddChoice(DIA_Addon_Saturas_TalkedToGhost,"А что это за Коготь Белиара?",DIA_Addon_Saturas_TalkedToGhost_wasistdas);
	Info_AddChoice(DIA_Addon_Saturas_TalkedToGhost,"Что такое эти Залы Аданоса?",DIA_Addon_Saturas_TalkedToGhost_kammern);
};

func void DIA_Addon_Saturas_TalkedToGhost_wasistdas()
{
	AI_Output(other,self,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_15_00");	//А что это за Коготь Белиара?
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_01");	//Воплощение чистого зла. Белиар своими руками выковал этот меч.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_02");	//Владелец меча получает в свои руки ужасное орудие разрушения.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_03");	//И чем могущественнее владелец, тем больше становится сила Когтя.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_04");	//Только самые непреклонные и сильные духом могут устоять перед ним.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_05");	//Теперь мне понятно, почему зодчие закрыли свою долину.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_06");	//Они впустили в этот мир орудие зла и поддались его темному влиянию.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_07");	//Злоба и жадность заставляла их уничтожать друг друга.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_08");	//Наконец, терпение Аданоса истощилось, и он обрушил на долину свой гнев, затопив ее в море.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_09");	//Создатели портала поступили мудро, спрятав город от остального мира.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_10");	//Какой трагический конец древней культуры!
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_11");	//Теперь ты понимаешь всю важность твоего задания?
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_12");	//Ворон - опытный боец, а жажда власти ослепила его.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_13");	//В его руках Коготь будет неудержимым оружием разрушения.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_14");	//Ворон не должен завладеть когтем, иначе все будет потеряно.
	Log_CreateTopic(TOPIC_Addon_Klaue,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Klaue,LOG_Running);
	B_LogEntry(TOPIC_Addon_Klaue,"В храме Аданоса находится могучее оружие. Оно называется 'Коготь Белиара'. Ворон не должен получить его в свои руки!");
};

func void DIA_Addon_Saturas_TalkedToGhost_kammern()
{
	AI_Output(other,self,"DIA_Addon_Saturas_TalkedToGhost_kammern_15_00");	//Что такое эти Залы Аданоса?
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_kammern_14_01");	//Теперь нам известно, что не только ворота закрывают доступ к тому, что спрятано в глубинах храма.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_kammern_14_02");	//На твоем пути встретятся три зала, каждый из которых предназначен для того, чтобы уничтожить любого непрошеного гостя.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_kammern_14_03");	//Ключ к тому, чтобы разрешить загадки Залов Аданоса - цветные реликвии Зодчих.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_kammern_14_04");	//Когда ты соберешь все реликвии и поймешь, о чем говорят нанесенные на них надписи, ты сможешь попасть во внутреннее святилище храма.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_kammern_14_05");	//Не знаю, смог ли Ворон решить головоломки храма, но если ему это удалось, то у нас начнутся большие неприятности.
	Log_CreateTopic(TOPIC_Addon_Kammern,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Kammern,LOG_Running);
	B_LogEntry(TOPIC_Addon_Kammern,LogText_Addon_Relicts);
	Log_CreateTopic(TOPIC_Addon_Relicts,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Relicts,LOG_Running);
	B_LogEntry_Quiet(TOPIC_Addon_Relicts,LogText_Addon_Relicts);
	Saturas_KnowsHow2GetInTempel = TRUE;
};

instance DIA_Addon_Saturas_RelictsBack(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = DIA_Addon_Saturas_RelictsBack_Condition;
	information = DIA_Addon_Saturas_RelictsBack_Info;
	description = "Как именно реликвии помогут мне в храме?";
};


func int DIA_Addon_Saturas_RelictsBack_Condition()
{
	if((Saturas_SCBroughtAllToken == TRUE) && (Saturas_KnowsHow2GetInTempel == TRUE) && (RavenAway == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Saturas_RelictsBack_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_RelictsBack_15_00");	//Как именно реликвии помогут мне в храме?
	AI_Output(self,other,"DIA_Addon_Saturas_RelictsBack_14_03");	//Мы слишком мало знаем, чтобы я мог сказать тебе это. Надеюсь, что, оказавшись в храме, ты поймешь все сам.
	AI_Output(self,other,"DIA_Addon_Saturas_RelictsBack_14_05");	//Извини, но больше я ничего сказать не могу. Теперь все зависит от тебя.
	AI_Output(self,other,"DIA_Addon_Saturas_RelictsBack_14_06");	//Возьми реликвии и как можно скорее отправляйся в храм.
	CreateInvItems(hero,ItMi_Addon_Stone_01,1);
	CreateInvItems(hero,ItMi_Addon_Stone_02,1);
	CreateInvItems(hero,ItMi_Addon_Stone_03,1);
	CreateInvItems(hero,ItMi_Addon_Stone_04,1);
	CreateInvItems(hero,ItMi_Addon_Stone_05,1);
	B_GiveInvItemsManyThings(self,other);
	B_LogEntry(TOPIC_Addon_Kammern,"Сатурас послал меня с пятью реликвиями в храм Аданоса, чтобы пройти палаты и остановить Ворона.");
	AI_Output(self,other,"DIA_Addon_Saturas_RelictsBack_14_07");	//Да защитит нас милость Аданоса!
	AI_Output(self,other,"DIA_Addon_Saturas_RelictsBack_14_08");	//Возможно, еще не слишком поздно.
};

instance DIA_Addon_Saturas_RavensDead(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 2;
	condition = DIA_Addon_Saturas_RavensDead_Condition;
	information = DIA_Addon_Saturas_RavensDead_Info;
	important = TRUE;
};


func int DIA_Addon_Saturas_RavensDead_Condition()
{
	if(RavenIsDead == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_RavensDead_Info()
{
	B_GivePlayerXP(2000);
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_00");	//Землетрясения прекратились, а ты, как вижу, еще жив.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_01");	//Это значит, что ты сделал то, что должен был сделать?
	AI_Output(other,self,"DIA_Addon_Saturas_RavensDead_15_02");	//Да! Ворон мертв.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_03");	//Значит, все кончено. Слава Аданосу!
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_04");	//Ты сделал славное дело, сын мой. Мы все перед тобой в долгу.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_05");	//Ты вырвал мощное оружие из лап зла и восстановил равновесие в этой части мира.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_06");	//Когда закончились землетрясения, мы обсудили план дальнейших действий и пришли к соглашению.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_07");	//Возьми Коготь Белиара. Отныне - ты его хозяин!
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_08");	//В твоих руках он станет орудием справедливости.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_09");	//Используй его разумно, сын мой. И да поможет тебе Аданос.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_11");	//Мы останемся здесь и восстановим храм во всем его прежнем великолепии.
	MIS_AdanosCrone = LOG_Success;
	Log_SetTopicStatus(TOPIC_AdanosCrone,LOG_Success);
	B_LogEntry(TOPIC_AdanosCrone,"Я сообщил Сатурасу, что Ворон мертв.");
};

instance DIA_Addon_Saturas_MixyrBack(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = DIA_Addon_Saturas_MixyrBack_Condition;
	information = DIA_Addon_Saturas_MixyrBack_Info;
	description = "Ватрасу нужна помощь в городе.";
};

func int DIA_Addon_Saturas_MixyrBack_Condition()
{
	if(MIS_VatrasAbloesung == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_MixyrBack_Info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Addon_Saturas_MixyrBack_01_01");		//Ватрасу нужна помощь в городе.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_12");	//Обратно отправился только Миксир! Он поможет Ватрасу.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_13");	//Слишком долго Ватрас оставался в городе один.
	MyxirIsBack = TRUE;
	B_LogEntry(TOPIC_Addon_VatrasAbloesung,"Миксира послали на помощь Ватрасу.");
	AI_Teleport(KDW_14030_Addon_Myxir_ADW,"TOT");
	Npc_ExchangeRoutine(KDW_14030_Addon_Myxir_ADW,"TOT");
};

instance DIA_Addon_Saturas_FreedMissingPeople(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 2;
	condition = DIA_Addon_Saturas_FreedMissingPeople_Condition;
	information = DIA_Addon_Saturas_FreedMissingPeople_Info;
	description = "Я освободил пленников.";
};

func int DIA_Addon_Saturas_FreedMissingPeople_Condition()
{
	if(MissingPeopleReturnedHome == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_FreedMissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_FreedMissingPeople_15_00");	//Я освободил пленников.
	AI_Output(self,other,"DIA_Addon_Saturas_FreedMissingPeople_14_01");	//Очень хорошо. Надеюсь, они попадут домой в целости и сохранности.
	B_GivePlayerXP(XP_Addon_Saturas_FreedMissingPeople);
};


instance DIA_Addon_Saturas_BeliarsWeapon(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = DIA_Addon_Saturas_BeliarsWeapon_Condition;
	information = DIA_Addon_Saturas_BeliarsWeapon_Info;
	description = "Я забрал Коготь Белиара.";
};

func int DIA_Addon_Saturas_BeliarsWeapon_Condition()
{
	if((RavenIsDead == TRUE) && C_ScHasBeliarsWeapon())
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_BeliarsWeapon_Info()
{
	AI_UnequipWeapons(hero);
	AI_Output(other,self,"DIA_Addon_Saturas_BeliarsWeapon_15_00");	//Я забрал Коготь Белиара.

	if(Npc_HasItems(hero,ItMw_BeliarWeapon_Raven) && (SC_FailedToEquipBeliarsWeapon == TRUE))
	{
		AI_Output(other,self,"DIA_Addon_Saturas_BeliarsWeapon_15_01");	//Но я не могу его использовать!
	};

	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_14_02");	//Коготь Белиара - необычное оружие.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_14_03");	//У него есть свой разум и своя воля.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_14_04");	//Являясь его владельцем, ты становишься его хозяином и повелителем.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_14_05");	//А он становится частью тебя и подстраивается под твои возможности.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_14_06");	//Однако по своей воле он этого делать не станет.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_14_07");	//Лишь сам Белиар может заставить его покориться тебе.
	AI_Output(other,self,"DIA_Addon_Saturas_BeliarsWeapon_besser_15_00");	//А как заставить Белиара помочь мне?
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_besser_14_01");	//Этого можно добиться, помолившись ему.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_besser_14_02");	//Но будь осторожен! Белиар зол и коварен.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_besser_14_03");	//Если ты вызовешь его недовольство, он обрушит на тебя свой гнев.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_besser_14_04");	//Да, и еще кое-что, что тебе следует знать...
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_besser_14_05");	//Не стоит полагать, что Темный бог заставит подчиниться Коготь твоей воле только потому, что ты этого хочешь.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_besser_14_06");	//Если его милость к тебе слишком мала, то он даже и слушать не станет все твои мольбы.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_besser_14_07");	//Только заручившись благосклонностью Темного бога, ты сможешь подчинить себе это оружие!
	Log_CreateTopic(TOPIC_Addon_Klaue,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Klaue,LOG_Running);
	Log_AddEntry(TOPIC_Addon_Klaue,"Чтобы подчинить Коготь своей воле, я должен помолиться Белиару.");
	Info_ClearChoices(DIA_Addon_Saturas_BeliarsWeapon);
	Info_AddChoice(DIA_Addon_Saturas_BeliarsWeapon,"Что же мне делать с этим оружием?",DIA_Addon_Saturas_BeliarsWeapon_wastun);
};

func void DIA_Addon_Saturas_BeliarsWeapon_wastun()
{
	AI_Output(other,self,"DIA_Addon_Saturas_BeliarsWeapon_wastun_15_00");	//Что же мне делать с этим оружием?
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_wastun_14_01");	//Решать тебе. Ты завоевал меч, и ты теперь его хозяин.

	if(TASKFINDCLAW == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_wastun_14_02");	//Я могу лишь дать тебе совет.
		AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_wastun_14_03");	//Ты можешь или отдать его мне, и я прослежу, чтобы он больше никогда не попал в руки зла...
		AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_wastun_14_04");	//...или покорить его силу и использовать меч в сражениях.
		Info_ClearChoices(DIA_Addon_Saturas_BeliarsWeapon);
		Info_AddChoice(DIA_Addon_Saturas_BeliarsWeapon,"Ты можешь сохранить меч?",DIA_Addon_Saturas_BeliarsWeapon_geben);
	};
};

func void DIA_Addon_Saturas_BeliarsWeapon_geben()
{
	AI_Output(other,self,"DIA_Addon_Saturas_BeliarsWeapon_geben_15_00");	//Ты можешь сохранить меч?
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_geben_14_03");	//Если ты отдашь его мне, я лишу меч его сил, и он больше никогда не сможет послужить злу.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_geben_14_04");	//Так что решай. Выбор за тобой.
	SaturasTakeClaw = TRUE;
	B_LogEntry(TOPIC_Addon_Klaue,"Я могу отдать Коготь Белиара Сатурасу или оставить его себе.");
};

instance DIA_Addon_Saturas_PermENDE_ADDON(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = DIA_Addon_Saturas_PermENDE_ADDON_Condition;
	information = DIA_Addon_Saturas_PermENDE_ADDON_Info;
	permanent = TRUE;
	description = "Что бы будете делать дальше?";
};

func int DIA_Addon_Saturas_PermENDE_ADDON_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Saturas_RavensDead) && (AWORCINVASIONSTART == FALSE))
	{
		return TRUE;
	};
};

var int DIA_Addon_Saturas_PermENDE_ADDON_OneTime;

func void DIA_Addon_Saturas_PermENDE_ADDON_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_PermENDE_ADDON_15_00");	//Что бы будете делать дальше?
	AI_Output(self,other,"DIA_Addon_Saturas_PermENDE_ADDON_14_01");	//Мы останемся здесь и вернем храму его былую славу.
	AI_Output(self,other,"DIA_Addon_Saturas_PermENDE_ADDON_14_02");	//Слишком долго он простоял в таком плачевном состоянии.
	if(DIA_Addon_Saturas_PermENDE_ADDON_OneTime == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Saturas_PermENDE_ADDON_14_03");	//Если тебя это интересует, сын мой...
		AI_Output(self,other,"DIA_Addon_Saturas_PermENDE_ADDON_14_04");	//Я рад, что не ошибся в тебе. Ты - истинный Хранитель Равновесия. У меня больше нет в этом сомнений.
		AI_Output(self,other,"DIA_Addon_Saturas_PermENDE_ADDON_14_05");	//Если бы не твоя отвага и сила, весь остров был бы разрушен. Мы благодарим тебя за твое великое дело.
		AI_Output(self,other,"DIA_Addon_Saturas_PermENDE_ADDON_14_06");	//Теперь ты должен посвятить себя другим задачам и вернуть на наши земли мир и равновесие.
		AI_Output(self,other,"DIA_Addon_Saturas_PermENDE_ADDON_14_07");	//Ступай и исполни свое предназначение, Хранитель. Мы будем молиться за тебя.
		DIA_Addon_Saturas_PermENDE_ADDON_OneTime = TRUE;
	};
};

instance DIA_Addon_Saturas_BeliarWeapGeben(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = DIA_Addon_Saturas_BeliarWeapGeben_Condition;
	information = DIA_Addon_Saturas_BeliarWeapGeben_Info;
	description = "Возьми Коготь Белиара и уничтожь его.";
};

func int DIA_Addon_Saturas_BeliarWeapGeben_Condition()
{
	if(C_ScHasBeliarsWeapon() && (RavenIsDead == TRUE) && (SaturasTakeClaw == TRUE) && (TASKFINDCLAW == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_BeliarWeapGeben_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_BeliarWeapGeben_15_00");	//Возьми Коготь Белиара и уничтожь его.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarWeapGeben_14_01");	//Как скажешь, сын мой. Дай мне Коготь.
	B_ClearBeliarsWeapon();
	AI_Print(b_formgivestring(other,1));
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarWeapGeben_14_02");	//Чтобы оно больше никому не причинило зла, я погружу его на дно морское.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarWeapGeben_14_03");	//Мудрость Аданоса будет охранять его.
	TOPIC_END_Klaue = TRUE;
	B_GivePlayerXP(XP_Addon_BeliarsWeaponAbgegeben);
	Saturas_KlaueInsMeer = TRUE;
};


instance DIA_ADDON_SATURAS_BELIARWEAPGEBENBACK(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = dia_addon_saturas_beliarweapgebenback_condition;
	information = dia_addon_saturas_beliarweapgebenback_info;
	permanent = FALSE;
	description = "Коготь еще у тебя?!";
};

func int dia_addon_saturas_beliarweapgebenback_condition()
{
	if((Saturas_KlaueInsMeer == TRUE) && (TASKFINDCLAW == TRUE) && (MIS_GOLDDRAGONPORTAL == LOG_Running) && !Npc_KnowsInfo(other,dia_dragon_gold_whatman))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_beliarweapgebenback_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_BeliarWeapGebenBack_15_00");	//Коготь еще у тебя?
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarWeapGebenBack_14_01");	//Да, он все еще у меня.
	AI_Output(other,self,"DIA_Addon_Saturas_BeliarWeapGebenBack_14_02");	//Ты же собирался его уничтожить.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarWeapGebenBack_14_03");	//Уничтожить Коготь оказалось мне не под силу, и я пока не знаю, каким образом это можно сделать.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarWeapGebenBack_14_04");	//Но мудрость Аданоса подскажет мне, как следует поступить. А почему ты спрашиваешь?
	AI_Output(other,self,"DIA_Addon_Saturas_BeliarWeapGebenBack_14_05");	//Мне он очень нужен. Ты не мог бы мне его вернуть?
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarWeapGebenBack_14_06");	//(удивленно) Но зачем?
	AI_Output(other,self,"DIA_Addon_Saturas_BeliarWeapGebenBack_14_07");	//Поверь, это дело очень большой важности.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarWeapGebenBack_14_08");	//Твои слова звучат странно, однако у меня нет причин не верить тебе.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarWeapGebenBack_14_09");	//Если тебе и вправду он так необходим, то вот, возьми его.
	B_GiveInvItems(self,other,ItMw_BeliarWeapon_Raven,1);
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarWeapGebenBack_14_12");	//Надеюсь, ты знаешь, что делаешь.
};

instance DIA_ADDON_SATURAS_CANBEWATERMAGE(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_canbewatermage_condition;
	information = dia_addon_saturas_canbewatermage_info;
	permanent = FALSE;
	description = "Могу ли я просить робу мага Воды, мастер?";
};

func int dia_addon_saturas_canbewatermage_condition()
{
	if(hero.guild == GIL_NDW)
	{
		return TRUE;
	};
};

func void dia_addon_saturas_canbewatermage_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_CanBeWaterMage_14_00");	//Могу ли я просить робу мага Воды, мастер?

	if(ATR_INTELLECT >= 40)
	{
		AI_Output(self,other,"DIA_Addon_Saturas_CanBeWaterMage_14_01");	//Да! Думаю, время пришло.
		AI_Output(self,other,"DIA_Addon_Saturas_CanBeWaterMage_14_02");	//За все то время, что ты был послушником, ты зарекомендовал себя с лучшей стороны.
		AI_Output(self,other,"DIA_Addon_Saturas_CanBeWaterMage_14_03");	//И доказал, что готов следовать заветам Аданоса даже ценой своей собственной жизни.
		AI_Output(self,other,"DIA_Addon_Saturas_CanBeWaterMage_14_04");	//Я считаю, что ты готов принять этот божественный дар и вступить в Круг магов Воды.
		AI_Output(self,other,"DIA_Addon_Saturas_CanBeWaterMage_14_05");	//Но ты должен понимать обдуманность своего решения и не сомневаться в своем выборе.
		AI_Output(self,other,"DIA_Addon_Saturas_CanBeWaterMage_14_06");	//Думаю, тебе нужно время, чтобы по-настоящему обдумать этот шаг.
		AI_Output(self,other,"DIA_Addon_Saturas_CanBeWaterMage_14_07");	//Никто не ограничивает тебя во времени.
		AI_Output(self,other,"DIA_Addon_Saturas_CanBeWaterMage_14_08");	//А когда окончательно придешь к этому решению, обратись ко мне, и я введу тебя в Священный Круг избранных служителей Аданоса.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Saturas_CanBeWaterMage_14_09");	//Время еще не пришло...
		AI_Output(self,other,"DIA_Addon_Saturas_CanBeWaterMage_14_10");	//Сила твоего ума еще недостаточна для этого.
		Log_CreateTopic(TOPIC_KDW_Accept,LOG_NOTE);
		B_LogEntry(TOPIC_KDW_Accept,"По мнению Сатураса, мне еще не хватает опыта для вступления в Круг магов Воды. (Требование: не менее 40 единиц интеллекта)");
	};
};

instance DIA_ADDON_SATURAS_BEWATERMAGE(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_bewatermage_condition;
	information = dia_addon_saturas_bewatermage_info;
	permanent = TRUE;
	description = "Я готов стать магом Воды.";
};

func int dia_addon_saturas_bewatermage_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_saturas_canbewatermage) && (hero.guild == GIL_NDW))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_bewatermage_info()
{
	if(ATR_INTELLECT < 40)
	{
		AI_Output(self,other,"DIA_Addon_Saturas_CanBeWaterMage_14_09");	//Время еще не пришло...
		AI_Output(self,other,"DIA_Addon_Saturas_CanBeWaterMage_14_10");	//Сила твоего ума еще недостаточна для этого.
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Saturas_BeWaterMage_14_00");	//Я готов стать магом Воды.
		AI_Output(self,other,"DIA_Addon_Saturas_BeWaterMage_14_01");	//Твое решение обдуманно и окончательно?
		AI_Output(other,self,"DIA_Addon_Saturas_BeWaterMage_14_02");	//Да.
		AI_Output(self,other,"DIA_Addon_Saturas_BeWaterMage_14_03");	//Помни, что я тебе говорил, - это выбор не на день или на месяц, а на всю жизнь. Ты понимаешь это?
		AI_Output(other,self,"DIA_Addon_Saturas_BeWaterMage_14_04");	//Да.
		AI_Output(self,other,"DIA_Addon_Saturas_BeWaterMage_14_05");	//Хорошо. Готов ли ты принести клятву?
		AI_Output(other,self,"DIA_Addon_Saturas_BeWaterMage_14_06");	//Я готов.
		AI_Output(self,other,"DIA_Addon_Saturas_BeWaterMage_14_07");	//Тогда приготовься получить благословение Воды и Аданоса!
		AI_Output(self,other,"DIA_Addon_Saturas_BeWaterMage_14_08");	//Повторяй за мной слова клятвы:
		AI_Output(self,other,"DIA_Addon_Saturas_BeWaterMage_14_09");	//Мощью богов я клянусь...
		AI_Output(other,self,"DIA_Addon_Saturas_BeWaterMage_14_10");	//Мощью богов я клянусь...
		AI_Output(self,other,"DIA_Addon_Saturas_BeWaterMage_14_11");	//...и силой священной Воды...
		AI_Output(other,self,"DIA_Addon_Saturas_BeWaterMage_14_12");	//...и силой священной Воды...
		AI_Output(self,other,"DIA_Addon_Saturas_BeWaterMage_14_13");	//...что знания и действия мои будут служить Воде отныне и до скончания веков...
		AI_Output(other,self,"DIA_Addon_Saturas_BeWaterMage_14_14");	//...что знания и действия мои будут служить Воде отныне и до скончания веков...
		AI_Output(self,other,"DIA_Addon_Saturas_BeWaterMage_14_15");	//...до тех пор, пока мое бренное тело не обретет покой в чертогах Белиара и не иссякнет источник моей жизни.
		AI_Output(other,self,"DIA_Addon_Saturas_BeWaterMage_14_16");	//...до тех пор, пока мое бренное тело не обретет покой в чертогах Белиара и не иссякнет источник моей жизни.
		AI_Output(self,other,"DIA_Addon_Saturas_BeWaterMage_14_17");	//Эта клятва дала тебе силу и благословение Воды.
		AI_Output(self,other,"DIA_Addon_Saturas_BeWaterMage_14_18");	//Возьми это одеяние и носи его в знак связи со священной Водой и с Аданосом.
		CreateInvItems(self,ITAR_KDW_L_Addon,1);
		B_GiveInvItems(self,other,ITAR_KDW_L_Addon,1);
		other.guild = GIL_KDW;
		CheckHeroGuild[0] = TRUE;
		Snd_Play("GUILD_INV");
		Mdl_ApplyOverlayMds(hero,"Humans_Mage.mds");
		B_GivePlayerXP(XP_BecomeMage);
		ATR_INTELLECT += 10;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_PrintClr("Интеллект + 10",83,152,48);
		AI_Output(self,other,"DIA_Addon_Saturas_BeWaterMage_14_1A");	//Также прими от меня этот посох. Только нам, магам Воды дарована честь обладать им и распоряжаться его силой.
		CreateInvItems(self,ITMW_2H_G3_STAFFWATER_01,1);
		B_GiveInvItems(self,other,ITMW_2H_G3_STAFFWATER_01,1);
		AI_Output(other,self,"DIA_Addon_Saturas_BeWaterMage_14_19");	//И каковы теперь мои обязанности?
		AI_Output(self,other,"DIA_Addon_Saturas_BeWaterMage_14_20");	//Теперь твоя основная обязанность - нести добро и божественную мудрость Аданоса всему живому.
		AI_Output(self,other,"DIA_Addon_Saturas_BeWaterMage_14_21");	//Будь мудр в своих поступках и помни про ту ответственность, которую на тебя возлагает твой нынешний статус.
		AI_Output(self,other,"DIA_Addon_Saturas_BeWaterMage_14_22");	//Да пребудет с тобой, Аданос, брат.
		AI_StopProcessInfos(self);
	};
};

instance DIA_Addon_Saturas_ADW_PreTeachCircle(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 10;
	condition = DIA_Addon_Saturas_ADW_PreTeachCircle_Condition;
	information = DIA_Addon_Saturas_ADW_PreTeachCircle_Info;
	permanent = FALSE;
	description = "Ты обучить меня Кругам магии?";
};


func int DIA_Addon_Saturas_ADW_PreTeachCircle_Condition()
{
	if(hero.guild == GIL_KDW)
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_ADW_PreTeachCircle_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_PreTeachCircle_15_00");	//Ты обучить меня Кругам магии?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_PreTeachCircle_14_10");	//Поскольку теперь ты являешься магом Воды, то я с превеликим удовольствием введу тебя в магические Круги.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_PreTeachCircle_14_11");	//Кроме того, Нефариус может научить тебя создавать руны нашей стихии, а Мердарион поможет тебе повысить твою магическую силу.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_PreTeachCircle_14_12");	//У Кроноса всегда найдется для тебя пара магических свитков магии Воды. Риордиан же научит тебя варить различные эликсиры.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_PreTeachCircle_14_13");	//И, естественно, ты всегда можешь рассчитывать на нашу помощь, брат.
	Saturas_Addon_TeachCircle = TRUE;
	Log_CreateTopic(TOPIC_Addon_KDWTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_Addon_KDWTeacher,LogText_Addon_SaturasTeach);
};


instance DIA_ADDON_SATURAS_ADW_EXPLAINCIRCLES(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	condition = dia_addon_saturas_adw_explaincircles_condition;
	information = dia_addon_saturas_adw_explaincircles_info;
	important = FALSE;
	permanent = FALSE;
	description = "Объясни мне, в чем смысл магических Кругов?";
};


func int dia_addon_saturas_adw_explaincircles_condition()
{
	if((hero.guild == GIL_KDW) && Npc_KnowsInfo(other,DIA_Addon_Saturas_ADW_PreTeachCircle))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_explaincircles_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_EXPLAINCIRCLES_Info_15_01");	//Объясни мне, в чем смысл магических Кругов?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_EXPLAINCIRCLES_Info_14_02");	//С удовольствием. Круги символизируют твое понимание магии.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_EXPLAINCIRCLES_Info_14_03");	//Они обозначают уровень твоих знаний и навыков, способность обучаться новым заклинаниям.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_EXPLAINCIRCLES_Info_14_04");	//Ты должен пройти каждый Круг до конца, прежде чем сможешь вступить в следующий.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_EXPLAINCIRCLES_Info_14_05");	//Потребуются долгие часы обучения и намного больше опыта, чтобы достичь высших Кругов.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_EXPLAINCIRCLES_Info_14_06");	//Твои старания каждый раз будут вознаграждаться новыми могущественными заклинаниями. Но в любом случае магические Круги значат куда больше.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_EXPLAINCIRCLES_Info_14_07");	//Они - часть твоей жизни. Они всегда будут с тобой. Сделай их частью себя.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_EXPLAINCIRCLES_Info_14_08");	//Для того чтобы понять их силу, ты должен познать себя.
	EXPLAINCIRCLEMEAN = TRUE;
};


instance DIA_ADDON_SATURAS_ADW_TEACHFIRSTCIRCLE(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 10;
	condition = dia_addon_saturas_adw_teachfirstcircle_condition;
	information = dia_addon_saturas_adw_teachfirstcircle_info;
	permanent = TRUE;
	description = "Научи меня первому кругу магии. (Очки обучения: 20)";
};


func int dia_addon_saturas_adw_teachfirstcircle_condition()
{
	if((hero.guild == GIL_KDW) && (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) < 1) && (Saturas_Addon_TeachCircle == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_teachfirstcircle_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_TeachFirstCircle_01_00");	//Научи меня первому кругу магии.

	if(B_TeachMagicCircle(self,other,1))
	{
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_TeachFirstCircle_01_03");	//Вступив в Первый Круг, ты научишься использовать магические руны.
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_TeachFirstCircle_01_04");	//Каждая руна содержит структуру особого магического заклинания.
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_TeachFirstCircle_01_05");	//Использовав свою собственную магическую силу, ты сможешь высвободить магию руны.
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_TeachFirstCircle_01_06");	//Но в отличие от свитков, которые по сути являются магическими формулами, магия рун поддерживает структуру заклинания всегда.
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_TeachFirstCircle_01_07");	//Каждая руна таит в себе магическую силу, которую ты можешь забрать в любой момент.
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_TeachFirstCircle_01_08");	//Так же, как и со свитком, в момент, когда ты используешь руну, расходуется твоя собственная магическая сила.
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_TeachFirstCircle_01_09");	//С каждым новым Кругом ты будешь узнавать о рунах все больше и больше.
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_TeachFirstCircle_01_10");	//Используй их силу, для того чтобы познать себя.
	};
};


instance DIA_Addon_Saturas_ADW_CIRCLE(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 99;
	condition = DIA_Addon_Saturas_ADW_CIRCLE_Condition;
	information = DIA_Addon_Saturas_ADW_CIRCLE_Info;
	permanent = TRUE;
	description = "Я хочу перейти на следующий уровень магии.";
};

var int DIA_Addon_Saturas_ADW_CIRCLE_NoPerm;

func int DIA_Addon_Saturas_ADW_CIRCLE_Condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 1) && (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) <= 6) && (Saturas_Addon_TeachCircle == TRUE) && (DIA_Addon_Saturas_ADW_CIRCLE_NoPerm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_ADW_CIRCLE_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_CIRCLE_15_00");	//Я хочу перейти на следующий уровень магии.
	Info_ClearChoices(DIA_Addon_Saturas_ADW_CIRCLE);
	Info_AddChoice(DIA_Addon_Saturas_ADW_CIRCLE,Dialog_Back,DIA_Addon_Saturas_ADW_CIRCLE_Back);

	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 1) && (Kapitel >= 2))
	{
		Info_AddChoice(DIA_Addon_Saturas_ADW_CIRCLE,"2 Круг магии (Очков обучения: 30)",DIA_Addon_Saturas_ADW_CIRCLE_2);
	}
	else if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 2) && (Kapitel >= 3))
	{
		Info_AddChoice(DIA_Addon_Saturas_ADW_CIRCLE,"3 Круг магии (Очков обучения: 40)",DIA_Addon_Saturas_ADW_CIRCLE_3);
	}
	else if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 3) && (MIS_ReadyforChapter4 == TRUE))
	{
		Info_AddChoice(DIA_Addon_Saturas_ADW_CIRCLE,"4 Круг магии (Очков обучения: 60)",DIA_Addon_Saturas_ADW_CIRCLE_4);
	}
	else if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 4) && (Kapitel >= 5))
	{
		Info_AddChoice(DIA_Addon_Saturas_ADW_CIRCLE,"5 Круг магии (Очков обучения: 80)",DIA_Addon_Saturas_ADW_CIRCLE_5);
	}
	else if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 5) && (Kapitel >= 5) && (MIS_DarkOrden == LOG_Success) && (MIS_JarCurse == LOG_Success) && (MIS_URNAZULRAGE == LOG_SUCCESS))
	{
		Info_AddChoice(DIA_Addon_Saturas_ADW_CIRCLE,"6 Круг магии (Очков обучения: 100)",DIA_Addon_Saturas_ADW_CIRCLE_6);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_12");	//Ты еще не готов к этому! Возвращайся позже.
	};
};

func void DIA_Addon_Saturas_ADW_CIRCLE_Back()
{
	Info_ClearChoices(DIA_Addon_Saturas_ADW_CIRCLE);
};

func void DIA_Addon_Saturas_ADW_CIRCLE_2()
{
	if(B_TeachMagicCircle(self,other,2))
	{
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_01");	//Да, ты готов увеличить свои знания.
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_02");	//Вступи же во Второй Круг магии! Да поможет тебе Аданос мудро распоряжаться дарованными тебе знаниями.
	};
	Info_ClearChoices(DIA_Addon_Saturas_ADW_CIRCLE);
};

func void DIA_Addon_Saturas_ADW_CIRCLE_3()
{
	if(B_TeachMagicCircle(self,other,3))
	{
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_03");	//Время пришло. Вступи же в Третий Круг магии!
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_04");	//Теперь ты сможешь применять более мощные заклинания. Используя их, будь рассудителен.
	};
	Info_ClearChoices(DIA_Addon_Saturas_ADW_CIRCLE);
};

func void DIA_Addon_Saturas_ADW_CIRCLE_4()
{
	if(B_TeachMagicCircle(self,other,4))
	{
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_05");	//Время пришло. Ты готов вступить в Четвертый Круг магии.
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_06");	//Да будут могущественными твои слова и деяния. Но не используй свои силы безрассудно.
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_0A");	//И еще кое-что. Войдя в четвертый круг магии, ты удостаиваешься чести носить облачение высших магов Воды.
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_0B");	//Немногим удавалось такое. Теперь ты - один из избранных Аданоса!
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_0C");	//Вот, возьми эту робу и магический посох.
		CreateInvItems(hero,ItMW_Addon_Stab02,1);
		CreateInvItems(self,itar_kdw_h,1);
		B_GiveInvItems(self,other,itar_kdw_h,1);
	};
	Info_ClearChoices(DIA_Addon_Saturas_ADW_CIRCLE);
};

func void DIA_Addon_Saturas_ADW_CIRCLE_5()
{
	if(B_TeachMagicCircle(self,other,5))
	{
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_07");	//Ты удостоен чести вступить в Пятый Круг магии.
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_08");	//Заклинания, которые тебе откроются, обладают огромной разрушительной мощью.
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_09");	//Держи себя под контролем! Не дай мании величия овладеть тобой.
	};
	Info_ClearChoices(DIA_Addon_Saturas_ADW_CIRCLE);
};

func void DIA_Addon_Saturas_ADW_CIRCLE_6()
{
	if(B_TeachMagicCircle(self,other,6))
	{
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_13");	//Прошло много времени с тех пор, как ты выбрал путь Аданоса. Ты многому научился и познал много тайн!
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_14");	//Пришло время овладеть последним знанием, которое дарует нам наш покровитель.
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_15");	//Ты переходишь в Шестой Круг - с ним ты овладеешь самыми могущественными заклинаниями магов Воды.
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_16");	//Заметь, в Шестой Круг могут вступить лишь самые могущественные из магов. Он предназначен для тех, чья жизнь - это знак.
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_17");	//Твой знак - Вода!
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_18");	//Шестой Круг позволит тебе использовать магию любой руны.
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_19");	//И не забудь: не захватывать силу, но быть ее источником.
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_20");	//Будь мудр и рассудителен в своих деяниях и постарайся использовать свои знания во благо света и Аданоса!
		DIA_Addon_Saturas_ADW_CIRCLE_NoPerm = TRUE;
	};
	Info_ClearChoices(DIA_Addon_Saturas_ADW_CIRCLE);
};

instance DIA_ADDON_SATURAS_MAXROBE(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 2;
	condition = dia_addon_saturas_MAXROBE_condition;
	information = dia_addon_saturas_MAXROBE_info;
	permanent = FALSE;
	description = "Как насчет робы получше?";
};

func int dia_addon_saturas_MAXROBE_condition()
{
	if((hero.guild == GIL_KDW) && (Kapitel >= 5) && (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 6) && (LastRobeKDW == FALSE) && (MAXROBE_Permanent == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_MAXROBE_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_MAXROBE_01_00");	//Как насчет робы получше?
	AI_Output(self,other,"DIA_Addon_Saturas_MAXROBE_01_01");	//Поскольку ты владеешь всеми шестью Кругами магии, ты достоин носить робу архимага Воды.
	AI_Output(self,other,"DIA_Addon_Saturas_MAXROBE_01_02");	//Однако тебе придется за нее заплатить. Она слишком дорогая в изготовлении, чтобы мы отдавали ее даром.
	AI_Output(other,self,"DIA_Addon_Saturas_MAXROBE_01_03");	//Понимаю.
	LastRobeKDW = TRUE;
};

instance DIA_ADDON_SATURAS_MAXROBE_Buy(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 2;
	condition = dia_addon_saturas_MAXROBE_Buy_condition;
	information = dia_addon_saturas_MAXROBE_Buy_info;
	permanent = TRUE;
	description = "Продай мне робу архимага Воды. (Цена: 20000 монет)";
};

func int dia_addon_saturas_MAXROBE_Buy_condition()
{
	if((hero.guild == GIL_KDW) && (LastRobeKDW == TRUE) && (MAXROBE_Permanent == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_MAXROBE_Buy_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_MAXROBE_Buy_01_00");	//Продай мне робу архимага Воды.

	if(Npc_HasItems(hero,ItMi_Gold) >= 20000)
	{
		B_GiveInvItems(other,self,ItMi_Gold,20000);
		Npc_RemoveInvItems(self,ItMi_Gold,20000);
		AI_Output(self,other,"DIA_Addon_Saturas_MAXROBE_Buy_01");	//Хорошо! Держи ее.
		AI_Output(self,other,"DIA_Addon_Saturas_MAXROBE_Buy_02");	//Это огромная честь! Помни об этом.
		CreateInvItems(self,itar_kdw_sh,1);
		B_GiveInvItems(self,other,itar_kdw_sh,1);
		MAXROBE_Permanent = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Saturas_MAXROBE_Buy_01_03");	//У тебя недостаточно золота.
	};
};

instance DIA_ADDON_SATURAS_KAPITEL3(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 2;
	condition = dia_addon_saturas_kapitel3_condition;
	information = dia_addon_saturas_kapitel3_info;
	permanent = FALSE;
	description = "Как обстоят дела с изучением города?";
};

func int dia_addon_saturas_kapitel3_condition()
{
	if((Kapitel == 3) && (RavenAway == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_kapitel3_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_Kapitel3_15_00");	//Как обстоят дела с изучением города?
	AI_Output(self,other,"DIA_Addon_Saturas_Kapitel3_14_01");	//Работа продвигается медленно.
	AI_Output(self,other,"DIA_Addon_Saturas_Kapitel3_14_02");	//Нам очень мешают бандиты на болоте.
	AI_Output(self,other,"DIA_Addon_Saturas_Kapitel3_14_03");	//Из-за них мы пока не можем приступить к изучению храма Аданоса.
};


instance DIA_ADDON_SATURAS_KAPITEL4(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 2;
	condition = dia_addon_saturas_kapitel4_condition;
	information = dia_addon_saturas_kapitel4_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_saturas_kapitel4_condition()
{
	if((Kapitel >= 4) && (RavenAway == TRUE) && (AWORCINVASIONSTART == FALSE) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_kapitel4_info()
{
	AI_Output(self,other,"DIA_Addon_Saturas_Kapitel4_01_01");	//Слава Аданосу - ты пришел!
 	AI_Output(self,other,"DIA_Addon_Saturas_Kapitel4_01_02");	//За последнее время здесь произошли просто ужасные вещи.
 	AI_Output(self,other,"DIA_Addon_Saturas_Kapitel4_01_04");	//В священную землю Аданоса вторглись орки!
	AI_Output(other,self,"DIA_Addon_Saturas_Kapitel4_01_05");	//Орки? Здесь?
	AI_Output(self,other,"DIA_Addon_Saturas_Kapitel4_01_06");	//Да, и очень много. Похоже, они приплыли сюда на кораблях.
	AI_Output(self,other,"DIA_Addon_Saturas_Kapitel4_01_09");	//Они заполонили практически всю долину. И это вопрос времени, когда они доберутся и сюда.
	AI_Output(self,other,"DIA_Addon_Saturas_Kapitel4_01_11");	//А если они обнаружат портал в Хоринис... я даже не представляю, что может произойти!
	AI_Output(self,other,"DIA_Addon_Saturas_Kapitel4_01_13");	//Ты должен помочь нам.
	AI_Output(other,self,"DIA_Addon_Saturas_Kapitel4_01_14");	//Что я могу сделать?
	AI_Output(self,other,"DIA_Addon_Saturas_Kapitel4_01_15");	//Те орки, которые появились тут, не похожи на обычные разведывательные группы.
	AI_Output(self,other,"DIA_Addon_Saturas_Kapitel4_01_16");	//Скорее всего, это полностью боеспособная армия. А действия каждой армии должны кем-то координироваться.
	AI_Output(other,self,"DIA_Addon_Saturas_Kapitel4_01_17");	//К чему ты клонишь?
	AI_Output(self,other,"DIA_Addon_Saturas_Kapitel4_01_18");	//Лучший способ справиться с монстром - отрубить ему голову!
	AI_Output(self,other,"DIA_Addon_Saturas_Kapitel4_01_23");	//Несколько дней назад мы видели пару отрядов, которые направились в развалинам древних храмов, на запад.
	AI_Output(self,other,"DIA_Addon_Saturas_Kapitel4_01_24");	//Еще один очень большой отряд орков направился по направлению к лагерю бандитов.
	AI_Output(self,other,"DIA_Addon_Saturas_Kapitel4_01_25");	//Это все, что я знаю.
	AI_Output(other,self,"DIA_Addon_Saturas_Kapitel4_01_26");	//Я посмотрю, что можно сделать.
	AI_Output(self,other,"DIA_Addon_Saturas_Kapitel4_01_27");	//Да благословит тебя Аданос, сын мой.
	AWORCINVASIONSTART = TRUE;
	MIS_ADW_ORCINVASION = LOG_Running;
	Log_CreateTopic(TOPIC_ADW_ORCINVASION,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADW_ORCINVASION,LOG_Running);
	B_LogEntry(TOPIC_ADW_ORCINVASION,"Сатурас сообщил мне ужасную новость. В долину пришли орки - практически целая армия. Маги Воды опасаются, что вскоре они узнают про портал, ведущий в Хоринис, что никак нельзя допустить. Сатурас попросил меня о помощи. Поскольку тягаться с целой армией - самоубийство, он придумал план, из которого мне надлежит найти и прикончить главарей орды.");
	Log_AddEntry(TOPIC_ADW_ORCINVASION,"Сатурас сказал мне, что видел, как пара отрядов ушли по направлению к древним развалинам на запад, и еще один ушел на восток по направлению к лагерю бандитов.");
	AI_StopProcessInfos(self);
	B_RemoveNpc(BDT_1091_Addon_Lucia);
	B_KillNpc(BDT_1095_Addon_Crimson);
	B_KillNpc(BDT_10023_Addon_Wache);
	B_KillNpc(BDT_10024_Addon_Garaz);
	B_KillNpc(STRF_1131_Addon_Sklave);
	B_KillNpc(STRF_1132_Addon_Sklave);
	B_KillNpc(STRF_1133_Addon_Sklave);
	B_KillNpc(STRF_1134_Addon_Sklave);
	B_KillNpc(STRF_1135_Addon_Sklave);
	B_KillNpc(STRF_1128_Addon_Sklave);
	B_KillNpc(STRF_1129_Addon_Sklave);
	B_KillNpc(STRF_1130_Addon_Sklave);
	B_KillNpc(STRF_1136_Addon_Sklave);
	B_KillNpc(STRF_1137_Addon_Sklave);
	B_KillNpc(STRF_1138_Addon_Sklave);
	B_KillNpc(STRF_1139_Addon_Sklave);
	B_KillNpc(STRF_1140_Addon_Sklave);
	B_KillNpc(BDT_10025_Addon_Wache);
	B_KillNpc(BDT_10026_Addon_Wache);
	B_KillNpc(BDT_10027_Addon_Buddler);
	B_KillNpc(BDT_10028_Addon_Buddler);
	B_KillNpc(BDT_10029_Addon_Buddler);
	B_KillNpc(BDT_10030_Addon_Buddler);
	B_KillNpc(BDT_1093_Addon_Franco);
	B_KillNpc(BDT_10011_Addon_Bandit);
	B_KillNpc(BDT_10012_Addon_Bandit);
	B_KillNpc(BDT_1076_Addon_Bandit);
	B_KillNpc(BDT_1077_Addon_Bandit);
	B_KillNpc(BDT_1073_Addon_Sancho);
	B_KillNpc(BDT_1087_Addon_Bandit);
	B_KillNpc(BDT_1072_Addon_Logan);
	B_KillNpc(BDT_1074_Addon_Edgor);
	B_KillNpc(BDT_1078_Addon_Bandit);
	B_KillNpc(BDT_1071_Addon_Ramon);
	B_KillNpc(BDT_10004_Addon_Finn);
	B_KillNpc(BDT_1088_Addon_Torwache);
	B_KillNpc(BDT_1083_Addon_Esteban);
	B_KillNpc(BDT_1081_Addon_Wache_01);
	B_KillNpc(BDT_10005_Addon_Wache_02);
	B_KillNpc(BDT_1099_Addon_Huno);
	B_KillNpc(BDT_1070_Addon_Paul);
	B_KillNpc(BDT_1082_Addon_Skinner);
	B_KillNpc(BDT_1075_Addon_Fortuno);
	B_KillNpc(BDT_1084_Addon_Senyan);
	B_KillNpc(BDT_10015_Addon_Emilio);
	B_KillNpc(BDT_1096_Addon_Lennar);
	B_KillNpc(BDT_1079_Addon_Carlos);
	B_KillNpc(BDT_10031_Addon_Wache);
	B_KillNpc(STRF_1141_Addon_Sklave);
	B_KillNpc(STRF_1142_Addon_Sklave);
	B_KillNpc(STRF_1143_Addon_Sklave);
	B_KillNpc(STRF_1144_Addon_Sklave);
	B_KillNpc(BDT_10001_Addon_Bandit_L);
	B_KillNpc(BDT_10002_Addon_Bandit_M);
	B_KillNpc(BDT_10003_Addon_Bandit_H);
	B_KillNpc(BDT_10006_Addon_Bandit);
	B_KillNpc(BDT_10007_Addon_Bandit);
	B_KillNpc(BDT_10008_Addon_Bandit);
	B_KillNpc(BDT_10009_Addon_Bandit);
	B_KillNpc(BDT_10010_Addon_Bandit);
	B_KillNpc(BDT_10018_Addon_Torwache);
	B_KillNpc(BDT_10019_Addon_Wache);
	B_KillNpc(BDT_10020_Addon_Wache);
	B_KillNpc(BDT_10021_Addon_Wache);

	if(Npc_IsDead(BDT_10022_Addon_Miguel) == FALSE)
	{
		AI_Teleport(BDT_10022_Addon_Miguel,"ADW_PIRATECAMP_CAVE3_92");
		Npc_ExchangeRoutine(BDT_10022_Addon_Miguel,"OrcInvasion");
		MIGUEL_TP = TRUE;
	};
	if(Npc_IsDead(BDT_1097_Addon_Fisk) == FALSE)
	{
		AI_Teleport(BDT_1097_Addon_Fisk,"ADW_PIRATECAMP_CAVE3_91");
		Npc_ExchangeRoutine(BDT_1097_Addon_Fisk,"OrcInvasion");
		FISK_TP = TRUE;
	};
	if(Npc_IsDead(BDT_1080_Addon_Tom) == FALSE)
	{
		AI_Teleport(BDT_1080_Addon_Tom,"ADW_PIRATECAMP_CAVE3_90");
		Npc_ExchangeRoutine(BDT_1080_Addon_Tom,"OrcInvasion");
		TOM_TP = TRUE;
	};
	if(Npc_IsDead(BDT_10014_Addon_Thorus) == FALSE)
	{
		AI_Teleport(BDT_10014_Addon_Thorus,"ADW_PIRATECAMP_CAVE3_01");
		Npc_ExchangeRoutine(BDT_10014_Addon_Thorus,"OrcInvasion");
		THORUS_TP = TRUE;
	};
	if(Npc_IsDead(BDT_1086_Addon_Scatty) == FALSE)
	{
		AI_Teleport(BDT_1086_Addon_Scatty,"ADW_PIRATECAMP_CAVE3_03");
		Npc_ExchangeRoutine(BDT_1086_Addon_Scatty,"OrcInvasion");
		SCATTY_TP = TRUE;
	};
	if(Npc_IsDead(BDT_1098_Addon_Snaf) == FALSE)
	{
		AI_Teleport(BDT_1098_Addon_Snaf,"ADW_PIRATECAMP_CAVE3_04");
		Npc_ExchangeRoutine(BDT_1098_Addon_Snaf,"OrcInvasion");
		SNAF_TP = TRUE;
	};
	if((Npc_IsDead(BDT_4568_KINJARTS) == FALSE) && (KinjartsIns == TRUE))
	{
		AI_Teleport(BDT_4568_KINJARTS,"ADW_PIRATECAMP_CAVE3_01");
		Npc_ExchangeRoutine(BDT_4568_KINJARTS,"Invasion");
	};

	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ORKINCAMP_01");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ORKINCAMP_03");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ORKINCAMP_05");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ORKINCAMP_07");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ORKINCAMP_09");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ORKINCAMP_11");
	Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ORKINCAMP_12");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ORKINCAMP_14");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ORKINCAMP_16");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ORKINCAMP_18");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ORKINCAMP_20");
	Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ORKINCAMP_22");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ORKINCAMP_24");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ORKINCAMP_26");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ORKINCAMP_28");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ORKINCAMP_30");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ORKINCAMP_32");
	Wld_InsertNpc(orkelite_addon3,"FP_ROAM_ORKINCAMP_35");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ORKINCAMP_37");
	Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ORKINCAMP_39");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ORKINCAMP_41");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ORKINCAMP_43");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ORKINCAMP_45");
	Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ORKINCAMP_47");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ORKINCAMP_49");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ORKINCAMP_51");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ORKINCAMP_53");
	Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ORKINCAMP_55");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ORKINCAMP_57");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ORKINCAMP_59");
	Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ENTRANCEORCGUARD_01");
	Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ENTRANCEORCGUARD_03");
	Wld_InsertNpc(orkelite_bowmenroam,"FP_ROAM_ENTRANCEORCGUARD_05");
	Wld_InsertNpc(orkelite_bowmenroam,"FP_ROAM_ENTRANCEORCGUARD_07");
	Wld_InsertNpc(orkelite_bowmenroam,"FP_ROAM_ENTRANCEORCGUARD_09");
	Wld_InsertNpc(OrcShaman_Sit,"FP_CAMPFIRE_ORKINCAMP_01");
	Wld_InsertNpc(OrcShaman_Sit,"FP_CAMPFIRE_ORKINCAMP_03");
	Wld_InsertNpc(OrcShaman_Sit,"FP_CAMPFIRE_ORKINCAMP_05");
	Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_SWAMP_01");
	Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_VP1_02");
	Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ORCINADANOS_01");
	Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ORCINADANOS_03");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ORCINADANOS_05");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ZOBIE_01");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ZOBIE_03");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ZOBIE_05");
	Wld_InsertNpc(orkelite_addon3,"FP_ROAM_ELITEORCSHAMANGUARD_03");
	Wld_InsertNpc(orkelite_addon3,"FP_ROAM_ELITEORCSHAMANGUARD_04");
	Wld_InsertNpc(orcshaman_leader4,"FP_CAMPFIRE_ELITEORCSHAMAN_04");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ENTRANCEORCGUARD_19");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ENTRANCEORCGUARD_21");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ENTRANCEORCGUARD_23");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ENTRANCEORCGUARD_25");
	Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ENTRANCEORCGUARD_27");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ENTRANCEORCGUARD_29");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ENTRANCEORCGUARD_31");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_ADANOSTEMPEL_RHADEMES_DEADBDT_01");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_ADANOSTEMPEL_RHADEMES_DEADBDT_02");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_ADANOSTEMPEL_RHADEMES");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_ADANOSTEMPEL_ENTRANCE_17");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_ADANOSTEMPEL_ENTRANCE_20");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_ADANOSTEMPEL_ENTRANCE_13");
	Wld_InsertNpc(orkelite_addon1,"ADW_ADANOSTEMPEL_TREASUREPITS_05A");
	Wld_InsertNpc(orkelite_addon1,"ADW_ADANOSTEMPEL_TREASUREPITS_05C");
	Wld_InsertNpc(orkelite_addon1,"ADW_ADANOSTEMPEL_TREASUREPITS_05E");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_ADANOSTEMPEL_TREASUREPITS_09A");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_ADANOSTEMPEL_TREASUREPITS_09C");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_ADANOSTEMPEL_TREASUREPITS_09E");
	Wld_InsertNpc(orkelite_addon1,"ADW_ADANOSTEMPEL_RHADEMES_14A");
	Wld_InsertNpc(orkelite_addon1,"ADW_ADANOSTEMPEL_RHADEMES_14C");
	Wld_InsertNpc(orkelite_addon1,"ADW_ADANOSTEMPEL_RHADEMES_14E");
	Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ADANOSTEMPEL_ORC_01");
	Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ADANOSTEMPEL_ORC_03");
	Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ADANOSTEMPEL_ORC_05");
	Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ADANOSTEMPEL_ORC_07");
	Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ADANOSTEMPEL_ORC_09");
	Wld_InsertNpc(orkelite_adw_leader,"FP_CAMPFIRE_ADANOSTEMPEL_ORC_08");
	Wld_InsertNpc(orkelite_bowmenroam,"FP_ROAM_ENTRANCEORCGUARD_11");
	Wld_InsertNpc(orkelite_bowmenroam,"FP_ROAM_ENTRANCEORCGUARD_13");
	Wld_InsertNpc(orkelite_bowmenroam,"FP_ROAM_ENTRANCEORCGUARD_15");
	Wld_InsertNpc(orkelite_bowmenroam,"FP_ROAM_ENTRANCEORCGUARD_17");
	Wld_InsertNpc(orkelite_addon2,"ADW_CANYON_LIBRARY_04");
	Wld_InsertNpc(orkelite_addon2,"ADW_CANYON_LIBRARY_LEFT_08");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_CANYON_LIBRARY_LEFT_07");
	Wld_InsertNpc(orkelite_addon2,"ADW_CANYON_LIBRARY_RIGHT_07");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_CANYON_LIBRARY_RIGHT_13");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_CANYON_LIBRARY_STONIE_01");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_CANYON_LIBRARY_STONIE_05");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_CANYON_ORCS_08");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_CANYON_PATH_TO_LIBRARY_14");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_CANYON_PATH_TO_LIBRARY_19");
	Wld_InsertNpc(orkelite_addon2,"ADW_CANYON_PATH_TO_LIBRARY_20");
	Wld_InsertNpc(orkelite_addon2,"ADW_CANYON_ORCS_05");
	Wld_InsertNpc(orkelite_addon2,"ADW_CANYON_ORCS_02");
	Wld_InsertNpc(OrcShaman_Sit,"ADW_CANYON_ORCS_02");
	Wld_InsertNpc(orcshaman_leader5,"FP_CAMPFIRE_ELITEORCSHAMAN_05");
	Wld_InsertNpc(orkelite_addon3,"FP_ROAM_ELITEORCSHAMANGUARD_06");
	Wld_InsertNpc(orkelite_addon2,"ADW_SENAT_SIDE_01");
	Wld_InsertNpc(orkelite_addon2,"ADW_SENAT_SIDE_03");
	Wld_InsertNpc(orkelite_addon3,"ADW_SENAT_GUARDIAN_01");
	Wld_InsertNpc(orkelite_addon3,"ADW_SENAT_GUARDIAN_03");
	Wld_InsertNpc(orcshaman_leader3,"FP_CAMPFIRE_ELITEORCSHAMAN_03");
	Wld_InsertNpc(orkelite_addon3,"FP_ROAM_ELITEORCSHAMANGUARD_02");
	Wld_InsertNpc(OrcWarrior_Roam,"STRAND");
	Wld_InsertNpc(orkelite_addon2,"ADW_VALLEY_PATH_131");
	Wld_InsertNpc(orkelite_addon3,"ADW_VALLEY_PATH_132_A");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_VALLEY_PATH_134");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_VALLEY_PATH_135");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_VALLEY_PATH_135");
	Wld_InsertNpc(orcshaman_leader2,"FP_CAMPFIRE_ELITEORCSHAMAN_02");
	Wld_InsertNpc(orkelite_addon3,"FP_ROAM_ELITEORCSHAMANGUARD_07");
	Wld_InsertNpc(orkelite_addon3,"FP_ROAM_ELITEORCSHAMANGUARD_08");
	Wld_InsertNpc(orkelite_addon2,"ADW_VALLEY_PATH_064_A");
	Wld_InsertNpc(orkelite_addon2,"ADW_VALLEY_PATH_072");
	Wld_InsertNpc(orkelite_addon3,"ADW_VALLEY_PATH_073");
	Wld_InsertNpc(orcshaman_leader1,"FP_CAMPFIRE_ELITEORCSHAMAN_01");
	Wld_InsertNpc(orkelite_addon3,"FP_ROAM_ELITEORCSHAMANGUARD_09");
	Wld_InsertNpc(orkelite_addon3,"FP_ROAM_ELITEORCSHAMANGUARD_10");
	Wld_InsertNpc(orkelite_addon1,"ADW_CANYON_TELEPORT_PATH_09");
	Wld_InsertNpc(orkelite_addon1,"ADW_CANYON_TELEPORT_PATH_09");
	Wld_InsertNpc(orkelite_addon1,"ADW_ENTRANCE_PATH2BANDITS_10");
	Wld_InsertNpc(orkelite_addon1,"ADW_ENTRANCE_PATH2BANDITS_03");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_PORTALTEMPEL_08A");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_PORTALTEMPEL_08B");
	Wld_InsertNpc(orkelite_addon1,"ADW_BL_FLIES_03");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_BL_FLIES_06");
	Wld_InsertNpc(orkelite_addon1,"ADW_LITTLE_HILL_03");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_LITTLE_HILL_04");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_SWAMP_04");
	Wld_InsertNpc(orkelite_addon1,"ADW_SWAMP_05");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_SWAMP_LITTLE_SEA_01");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_SWAMP_LITTLE_SEA_02");
	Wld_InsertNpc(orkelite_addon1,"ADW_SWAMP_LITTLE_SEA_03");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_SWAMP_12");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_SWAMP_13");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_PATH_TO_BL_09");
	Wld_InsertNpc(orkelite_addon1,"ADW_PATH_TO_BL_10");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_PATH_TO_LOCH_01");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_PATH_TO_LOCH_01");
	Wld_InsertNpc(orkelite_addon1,"ADW_SWAMP_10");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_SWAMP_05");
	Wld_InsertNpc(orkelite_addon1,"ADW_SENAT_MONSTER_03");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_SENAT_MONSTER_04");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_SWAMP_HILLS_DOWN_06");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_SWAMP_HILLS_DOWN_03");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_SWAMP_LOCH_05");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_SWAMP_TO_BIGSEA_01");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_PIRATECAMP_LONEBEACH_11");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_PIRATECAMP_LONEBEACH_10");
	Wld_InsertNpc(orkelite_addon2,"DAW_PIRTECAMP_LONEBEACH_07");
	Wld_InsertNpc(orkelite_addon2,"ADW_PIRATECAMP_LONEBEACH_08");
	Wld_InsertNpc(orkelite_addon2,"ADW_PIRATECAMP_LONEBEACH_04");
	Wld_InsertNpc(orkelite_addon3,"ADW_PIRATECAMP_LONEBEACH_CAVE_03");
	Wld_InsertNpc(orkelite_addon1,"ADW_PIRATECAMP_LONEBEACH_CAVE_03");
	Wld_InsertNpc(orkelite_addon1,"ADW_PIRATCAMP_PLAIN_05");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_PIRATCAMP_PLAIN_05");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_VALLEY_PATH_033_A");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_VALLEY_PATH_035");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_VALLEY_PATH_036");
	Wld_InsertNpc(orkelite_addon1,"ADW_VALLEY_BIGCAVE_06");
	Wld_InsertNpc(orkelite_addon3,"ADW_VALLEY_BIGCAVE_15");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_VALLEY_PATH_110");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_VALLEY_PATH_020");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_VALLEY_PATH_048_A");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_VALLEY_PATH_047_G");
	Wld_InsertNpc(orkelite_addon1,"ADW_VALLEY_PATH_017");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_VALLEY_SHOWCASE1_02");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_VALLEY_SHOWCASE1_03");
	Wld_InsertNpc(orkelite_bowmenroam,"FP_ROAM_ADWENTRANCEHRAM_02");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ADWENTRANCEHRAM_04");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ADWENTRANCEHRAM_06");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ADWENTRANCEHRAM_08");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ADWENTRANCEHRAM_10");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ADWENTRANCEHRAM_12");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ADWENTRANCEHRAM_14");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ADWENTRANCEHRAM_16");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ADWENTRANCEHRAM_18");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ADWENTRANCEHRAM_20");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ADWENTRANCEHRAM_22");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ADWENTRANCEHRAM_24");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ADWENTRANCEHRAM_26");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ADWENTRANCEHRAM_30");
	Wld_InsertNpc(orkelite_bowmenroam,"FP_ROAM_ADWENTRANCEHRAM_31");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ADWENTRANCEHRAM_32");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ADWENTRANCEHRAM_34");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ADWENTRANCEHRAM_36");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_GOLDSHAHT_02");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_GOLDSHAHT_04");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_GOLDSHAHT_06");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_GOLDSHAHT_08");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_GOLDSHAHT_10");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_GOLDSHAHT_12");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_GOLDSHAHT_14");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_GOLDSHAHT_16");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_GOLDSHAHT_18");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_GOLDSHAHT_20");
};


instance DIA_ADDON_SATURAS_ORCLEADERDS(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 2;
	condition = dia_addon_saturas_orcleaderds_condition;
	information = dia_addon_saturas_orcleaderds_info;
	permanent = TRUE;
	description = "По поводу орков...";
};


func int dia_addon_saturas_orcleaderds_condition()
{
	if((Kapitel >= 4) && (RavenAway == TRUE) && (AWORCINVASIONSTART == TRUE) && (AWORCINVASIONSTOP == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_orcleaderds_info()
{
	var int OrcCountXP;

	OrcCountXP = FALSE;
	AI_Output(other,self,"DIA_Addon_Saturas_OrcLeaderds_01_01");	//По поводу орков...
	AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_02");	//Что нового ты можешь мне поведать?

	if((ORCSHAMAN1ISDEAD == FALSE) && (Npc_IsDead(orcshaman_leader1) == TRUE))
	{
		OrcCountXP = OrcCountXP + 100;
		AI_Output(other,self,"DIA_Addon_Saturas_OrcLeaderds_01_03");	//Один из отрядов орков, что направился на запад долины, расположился в Доме Жрецов. Хорошее местечко они выбрали, нечего сказать.
		AI_Output(other,self,"DIA_Addon_Saturas_OrcLeaderds_01_04");	//Судя по всему, его возглавлял один из верховных шаманов орды - Варраг-Шатан. Но теперь он не опасен, также как и его воины.
		AI_Output(other,self,"DIA_Addon_Saturas_OrcLeaderds_01_05");	//Правда, если честно, мне пришлось изрядно попотеть, чтобы выбить их оттуда.
		AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_06");	//Хвала Аданосу! Хоть какая-то хорошая новость за прошедшие дни...
		ORCSHAMAN1ISDEAD = TRUE;
	};
	if((ORCSHAMAN2ISDEAD == FALSE) && (Npc_IsDead(orcshaman_leader2) == TRUE))
	{
		OrcCountXP = OrcCountXP + 100;
		AI_Output(other,self,"DIA_Addon_Saturas_OrcLeaderds_01_07");	//Похоже, орки большие поклонники древности.
		AI_Output(other,self,"DIA_Addon_Saturas_OrcLeaderds_01_08");	//В храме Стражей Мертвых я наткнулся на один из отрядов орков, которые отправились на запад долины. Пришлось немного повоевать с ними.
		AI_Output(other,self,"DIA_Addon_Saturas_OrcLeaderds_01_09");	//Судя по всему, их возглавлял один из верховных шаманов орды - Варраг-Казорг. Теперь он мертв, также как и все орки, что были вместе с ним.
		AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_10");	//Хорошая работа, сын мой!
		ORCSHAMAN2ISDEAD = TRUE;
	};
	if((ORCSHAMAN3ISDEAD == FALSE) && (Npc_IsDead(orcshaman_leader3) == TRUE))
	{
		OrcCountXP = OrcCountXP + 100;
		AI_Output(other,self,"DIA_Addon_Saturas_OrcLeaderds_01_12");	//В Доме Целителей, что на болотах, я обнаружил еще один отряд орков. Они разбили там небольшой лагерь.
		AI_Output(other,self,"DIA_Addon_Saturas_OrcLeaderds_01_13");	//Один из верховных шаманов орды - Варраг-Хашор, был их командиром. Теперь от этого отряда больше ничего не осталось.
		AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_15");	//Это отличные новости! Продолжай в том же духе.
		ORCSHAMAN3ISDEAD = TRUE;
	};
	if((ORCSHAMAN5ISDEAD == FALSE) && (Npc_IsDead(orcshaman_leader5) == TRUE))
	{
		OrcCountXP = OrcCountXP + 100;
		AI_Output(other,self,"DIA_Addon_Saturas_OrcLeaderds_01_16");	//На севере в каньоне, недалеко от Дома Ученых, расположился еще один отряд орков.
		AI_Output(other,self,"DIA_Addon_Saturas_OrcLeaderds_01_17");	//Верховный шаман орды - Варраг-Хаташ - судя по всему, руководил его действиями.
		AI_Output(other,self,"DIA_Addon_Saturas_OrcLeaderds_01_18");	//Теперь в каньоне нет ни одного орка.
		AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_19");	//Отлично!
		ORCSHAMAN5ISDEAD = TRUE;
	};
	if((ORCSHAMAN4ISDEAD == FALSE) && (Npc_IsDead(orcshaman_leader4) == TRUE))
	{
		OrcCountXP = OrcCountXP + 100;
		AI_Output(other,self,"DIA_Addon_Saturas_OrcLeaderds_01_20");	//Орки атаковали лагерь бандитов. Я попал в самый разгар боя.
		AI_Output(other,self,"DIA_Addon_Saturas_OrcLeaderds_01_21");	//Мне пришлось сильно постараться, чтобы прикончить всех этих тварей.
		AI_Output(other,self,"DIA_Addon_Saturas_OrcLeaderds_01_22");	//В том числе и одного из верховных шаманов орды - Варраг-Назула. Думаю, именно он руководил той группой, которая атаковала лагерь.
		AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_23");	//Замечательно. Это еще больше ослабит орков!
		ORCSHAMAN4ISDEAD = TRUE;
	};
	if((ORKELITELEADERISDEAD == FALSE) && (Npc_IsDead(orkelite_adw_leader) == TRUE))
	{
		OrcCountXP = OrcCountXP + 100;
		AI_Output(other,self,"DIA_Addon_Saturas_OrcLeaderds_01_24");	//В храме Аданоса орки устроили некое подобие своего штаба. Там все просто кишело этими тварями!
		AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_25");	//О, всемогущий Аданос! Эти проклятые твари осквернили его храм! Ты что-нибудь предпринял?
		AI_Output(other,self,"DIA_Addon_Saturas_OrcLeaderds_01_26");	//Я расправился со всеми орками в храме и убил их предводителя. Бой был нелегким, но теперь все позади.
		AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_27");	//Кто это был?
		AI_Output(other,self,"DIA_Addon_Saturas_OrcLeaderds_01_28");	//Один из клана вождей орды - Ур-Катан.
		AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_29");	//Судя по всему, орки готовили что-то серьезное, если их возглавлял один из элиты командования.
		AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_30");	//Ты на правильном пути! Продолжай в том же духе, и скоро мы сломим их волю.
		ORKELITELEADERISDEAD = TRUE;
	};
	if((ORCSHAMAN1ISDEAD == TRUE) && (ORCSHAMAN2ISDEAD == TRUE) && (ORCSHAMAN3ISDEAD == TRUE) && (ORCSHAMAN4ISDEAD == TRUE) && (ORCSHAMAN5ISDEAD == TRUE) && (ORKELITELEADERISDEAD == TRUE))
	{
		OrcCountXP = OrcCountXP + 500;
		B_GivePlayerXP(OrcCountXP);
		AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_31");	//Думаю, того, что ты сделал, вполне достаточно. Ты отлично справился с этим заданием!
		AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_32");	//Без своих вождей орки вряд ли предпримут какие-то серьезные шаги. И наверняка скоро покинут эту долину.
		AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_34");	//...я все думаю, чтобы бы мы делали без тебя? Воистину, ты посланник богов!
		MIS_ADW_ORCINVASION = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_ADW_ORCINVASION,LOG_SUCCESS);
		B_LogEntry(TOPIC_ADW_ORCINVASION,"Я уничтожил всех главарей орков, вторгшихся в Яркендар. Теперь, без своих лидеров, орки потеряют интерес к этому месту и покинут его.");

		if(other.guild == GIL_KDF)
		{
			AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_36");	//В честь твоих деяний на благо этого мира, прими от меня этот небольшой подарок.
			B_GiveInvItems(self,other,ItPo_Perm_Mana,1);
			AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_37");	//Естественно, твои деяния несоизмеримо больше, чем эта награда. Но это самое ценное, что у меня есть.
			AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_39");	//А теперь продолжай свой путь. В этом мире есть еще много зла, с которым все мы должны бороться.
			AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_40");	//Прощай.
			DIA_Addon_Saturas_ADW_EXIT_Info();
		}
		else if(other.guild == GIL_PAL)
		{
			AI_Output(other,self,"DIA_Addon_Saturas_OrcLeaderds_01_41");	//Это моя святая обязанность - бороться со злом. Иннос дает мне силы!
			AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_42");	//Тогда, благородный паладин, в честь твоих деяний на благо этого мира, прими от меня этот небольшой подарок.
			B_GiveInvItems(self,other,ItPo_Perm_Health,2);
			AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_43");	//Естественно, твои деяния несоизмеримо больше, чем эта награда. Но и это поможет тебе в твоей борьбе против зла!
			AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_45");	//А теперь ты должен продолжать свой путь. В этом мире еще есть места, где нужна твоя помощь.
			AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_46");	//Прощай.
			DIA_Addon_Saturas_ADW_EXIT_Info();
		}
		else if(other.guild == GIL_DJG)
		{
			AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_48");	//В честь твоих деяний на благо этого мира, прими от меня этот небольшой подарок.
			B_GiveInvItems(self,other,ItPo_Perm_STR,1);
			AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_49");	//Естественно, твои деяния несоизмеримо больше, чем эта награда. Но, надеюсь, для тебя это будет достаточным.
			AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_51");	//А теперь ты должен продолжать свой путь. Наверняка твой меч еще ни раз придет на помощь этому миру в борьбе со злом!
			AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_52");	//Прощай.
			DIA_Addon_Saturas_ADW_EXIT_Info();
		}
		else if((other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR))
		{
			AI_Output(other,self,"DIA_Addon_Saturas_OrcLeaderds_01_53");	//Ты же сам понимаешь, что мы в Братстве не слишком верим во все эти дела. Наш путь далек от вас и ваших богов!
			AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_54");	//Тогда, болотник, в честь твоих деяний на благо этого мира, прими от меня этот небольшой подарок.
			if((other.guild == GIL_SEK) || (other.guild == GIL_TPL))
			{
				B_GiveInvItems(self,other,ItPo_Perm_STR,1);
			}
			else
			{
				B_GiveInvItems(self,other,ItPo_Perm_Mana,1);
			};
			AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_55");	//Естественно, твои деяния несоизмеримо больше, чем эта награда. Но, надеюсь, для тебя это будет достаточным.
			AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_57");	//А теперь, ты должен продолжать свой путь. Наверняка ты еще не раз придешь на помощь этому миру в борьбе со злом!
			AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_58");	//Прощай.
			DIA_Addon_Saturas_ADW_EXIT_Info();
		}
		else if(other.guild == GIL_KDW)
		{
			AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_60");	//В честь твоих деяний на благо этого мира, прими от меня этот небольшой подарок.
			B_GiveInvItems(self,other,itpo_perm_mana,1);
			AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_61");	//Естественно, твои деяния несоизмеримо больше, чем эта награда. Но, надеюсь, для тебя это будет достаточным.
			AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_63");	//А теперь, ты должен продолжать свой путь. Наверняка ты еще не раз придешь на помощь этому миру в борьбе со злом!
			AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_64");	//Прощай.
			DIA_Addon_Saturas_ADW_EXIT_Info();
		}
		else if(other.guild == GIL_KDM)
		{
			AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_66");	//В честь твоих деяний на благо этого мира, прими от меня этот небольшой подарок.
			B_GiveInvItems(self,other,ItPo_Perm_Mana,1);
			AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_67");	//Естественно, твои деяния несоизмеримо больше, чем эта награда. Но, надеюсь, для тебя это будет достаточным.
			AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_69");	//А теперь ты должен продолжать свой путь. Надеюсь, это будет не единственный твой поступок во имя Света!
			AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_70");	//Прощай.
			DIA_Addon_Saturas_ADW_EXIT_Info();
		};
		AWORCINVASIONSTOP = TRUE;
	}
	else
	{
		B_GivePlayerXP(OrcCountXP);
		AI_Output(other,self,"DIA_Addon_Saturas_OrcLeaderds_01_71");	//Пока ничего.
		AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_72");	//Очень жаль. Я ожидал услышать более обнадеживающие новости.
	};
};


instance DIA_ADDON_SATURAS_ADW_UNKNOWNPORTAL(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 99;
	condition = dia_addon_saturas_adw_unknownportal_condition;
	information = dia_addon_saturas_adw_unknownportal_info;
	permanent = FALSE;
	description = "В храме Аданоса я обнаружил этот странный камень.";
};

func int dia_addon_saturas_adw_unknownportal_condition()
{
	if((Npc_HasItems(other,ITMI_DRAGONGOLDFOCUS) >= 1) && (DRAGONGOLDMEET == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_unknownportal_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_UnknownPortal_01_00");	//В храме Аданоса я обнаружил этот странный камень.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_UnknownPortal_01_01");	//Дай мне взглянуть на него.
	B_GiveInvItems(other,self,ITMI_DRAGONGOLDFOCUS,1);
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_UnknownPortal_01_02");	//Да, очень интересный артефакт.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_UnknownPortal_01_04");	//Он напоминает магические кристаллы, которые мы использовали для активации порталов.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_UnknownPortal_01_06");	//Но мне даже в голову не приходит, для какого портала предназначен данный кристалл.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_UnknownPortal_01_07");	//Значит, его можно как-то использовать.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_UnknownPortal_01_08");	//Скорее всего. Но меня больше волнует другое - где ты его нашел?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_UnknownPortal_01_09");	//Если ты обнаружил этот артефакт в храме Аданоса, он наверняка представлял огромную ценность для зодчих.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_UnknownPortal_01_10");	//Или наоборот - огромную угрозу, если его так хорошо припрятали.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_UnknownPortal_01_11");	//В любом случае будь осторожен, если поймешь, как его использовать. Последствия могут быть непредсказуемы!
	B_GiveInvItems(self,other,ITMI_DRAGONGOLDFOCUS,1);
	Log_CreateTopic(TOPIC_GOLDDRAGONPORTAL,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GOLDDRAGONPORTAL,LOG_Running);
	B_LogEntry(TOPIC_GOLDDRAGONPORTAL,"Я показал Сатурасу странный камень, который обнаружил в храме Аданоса. Он не смог определить предназначение этого предмета, отметив лишь его сходство с магическими кристаллами, служащими для активации порталов. Возможно, стоит попытаться поискать в долине нечто похожее на портал.");
	MIS_GOLDDRAGONPORTAL = LOG_Running;
};

instance DIA_ADDON_SATURAS_ADW_UNKNOWNPORTALKNOWN(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 98;
	condition = dia_addon_saturas_adw_unknownportalknown_condition;
	information = dia_addon_saturas_adw_unknownportalknown_info;
	permanent = FALSE;
	description = "Я активировал портал с помощью магического кристалла.";
};

func int dia_addon_saturas_adw_unknownportalknown_condition()
{
	if(DRAGONGOLDMEET == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_unknownportalknown_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_UnknownPortalKnown_01_00");	//Я активировал портал с помощью магического кристалла, что нашел в храме Аданоса.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_UnknownPortalKnown_01_01");	//Да? Невероятно!
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_UnknownPortalKnown_01_02");	//Где ты его обнаружил?
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_UnknownPortalKnown_01_03");	//В развалинах старого храма, что неподалеку отсюда.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_UnknownPortalKnown_01_07");	//И куда ведет этот портал?
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_UnknownPortalKnown_01_08");	//По ту сторону портала скрывается небольшая долина.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_UnknownPortalKnown_01_12");	//Там я встретил дракона!
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_UnknownPortalKnown_01_13");	//(в ужасе) ДРАКОНА?! О Аданос всемогущий!
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_UnknownPortalKnown_01_15");	//Тогда, боюсь, нам всем грозит большая опасность!
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_UnknownPortalKnown_01_16");	//Никакой опасности нет. Аш'Тар не является слугой зла.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_UnknownPortalKnown_01_17");	//Аш'Тар?
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_UnknownPortalKnown_01_18");	//Да, Аш'Тар - золотой дракон. Он не похож на тех драконов, что появились в Долине Рудников.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_UnknownPortalKnown_01_22");	//Хорошо. Раз ты так в этом уверен...
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_UnknownPortalKnown_01_25");	//При исследовании острова и храмов зодчих мы иногда натыкались на древние фрески, изображающие непонятное существо...
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_UnknownPortalKnown_01_26");	//...очень похожее на дракона. Возможно, это и был он.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_UnknownPortalKnown_01_35");	//Думаю, мне просто необходимо пойти в ту долину и поговорить с ним.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_UnknownPortalKnown_01_36");	//Уверен, что он сможет многое поведать нам о событиях, произошедших здесь ранее.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_UnknownPortalKnown_01_38");	//Думаю, вам будет что обсудить.
	B_LogEntry(TOPIC_GOLDDRAGONPORTAL,"Я рассказал Сатурасу о драконе. Он был потрясен этой новостью и проявил большой интерес к моей находке.");
	AI_StopProcessInfos(self);
	SATURASKNOWSASHTAR = TRUE;
	self.aivar[AIV_EnemyOverride] = TRUE;
};


instance DIA_ADDON_SATURAS_ADW_ARCHDEMON(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 97;
	condition = dia_addon_saturas_adw_archdemon_condition;
	information = dia_addon_saturas_adw_archdemon_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_saturas_adw_archdemon_condition()
{
	if((TASKFINDSPHERE == TRUE) && Npc_KnowsInfo(hero,dia_addon_saturas_adw_unknownportalknown) && (Npc_GetDistToWP(self,"ADW_SATURAS_2_GOLDDRAGON") < 500) && (AshtarLastWarn == FALSE) && (SenyakIsDead == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_archdemon_info()
{
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_ArchDemon_01_00");	//(взволнованно) Аш'Тар рассказал мне о С'эньяке!
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_ArchDemon_01_01");	//Если дракон прав, то этому миру грозит большая опасность! И этого никак нельзя допустить!
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_ArchDemon_01_02");	//Ты должен действовать без промедления. Иди и найди сферы, о которых говорил тебе дракон.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_ArchDemon_01_03");	//Ступай, сын мой. Дорога каждая минута!
	AI_StopProcessInfos(self);
};

instance DIA_ADDON_SATURAS_ADW_PRAYFORGOMEZ(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_adw_prayforgomez_condition;
	information = dia_addon_saturas_adw_prayforgomez_info;
	permanent = FALSE;
	description = "Мне нужно благословение Аданоса.";
};


func int dia_addon_saturas_adw_prayforgomez_condition()
{
	if((MIS_RESCUEGOMEZ == LOG_Running) && (RESCUEGOMEZSTEPONE == TRUE) && (RESCUEGOMEZSTEPONEDONE == FALSE) && (RESCUEGOMEZPRAYADANOS == FALSE) && (SATURASREFUSEHELPGOMEZ == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_prayforgomez_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_PrayForGomez_01_01");	//Мне нужно благословение Аданоса.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_PrayForGomez_01_02");	//(удивленно) Тебе нужно благословение Воды?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_PrayForGomez_01_03");	//И что же ты опять такого натворил, если просишь его?
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_PrayForGomez_01_04");	//Я хотел, чтобы Аданос даровал прощение одной из неупокоенных в этом мире душ.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_PrayForGomez_01_10");	//Это душа бывшего рудного барона Гомеза.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_PrayForGomez_01_11");	//(разгневанно) ГОМЕЗА?! Этого убийцы и палача?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_PrayForGomez_01_12");	//(вне себя) Да как ты вообще посмел обратиться ко мне с такой просьбой?!
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_PrayForGomez_01_14");	//Этот ублюдок заслужил своей участи!
	B_LogEntry(TOPIC_RESCUEGOMEZ,"Сатурас и другие маги Воды отказались помогать мне.");
	SATURASREFUSEHELPGOMEZ = TRUE;
};


instance DIA_ADDON_SATURAS_ADW_TELLABORKS(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_adw_tellaborks_condition;
	information = dia_addon_saturas_adw_tellaborks_info;
	permanent = FALSE;
	description = "У меня плохие новости.";
};


func int dia_addon_saturas_adw_tellaborks_condition()
{
	if((HAGENOTHERSAGREED == FALSE) && (MIS_BEWAREWATERMAGE == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_tellaborks_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_TellAbOrks_01_01");	//У меня плохие новости.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_TellAbOrks_01_02");	//О чем ты, сын мой?
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_TellAbOrks_01_03");	//Орки вторглись в Хоринис!
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_TellAbOrks_01_04");	//(потрясенно) Что? Но этого не может быть!
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_TellAbOrks_01_06");	//За несколько дней этим тварям удалось превратить долину практически в сущий ад.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_TellAbOrks_01_07");	//И я пришел сюда, чтобы предупредить вас об этой опасности.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_TellAbOrks_01_08");	//А что с самим городом?
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_TellAbOrks_01_09");	//Орки сумели овладеть им без особого труда. Паладины были просто бессильны что-либо сделать.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_TellAbOrks_01_10");	//О Аданос!
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_TellAbOrks_01_11");	//Если даже паладины бессильны перед лицом этого зла, тогда надежды практически нет.
	BEWAREWATERMAGE = TRUE;
	MIS_BEWAREWATERMAGE = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_BEWAREWATERMAGE,LOG_SUCCESS);
	B_LogEntry(TOPIC_BEWAREWATERMAGE,"Мне удалось сообщить магам Воды о случившемся.");
};


instance DIA_ADDON_SATURAS_ADW_GATHERARMY(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_adw_gatherarmy_condition;
	information = dia_addon_saturas_adw_gatherarmy_info;
	permanent = FALSE;
	description = "Паладинам нужна ваша помощь!";
};


func int dia_addon_saturas_adw_gatherarmy_condition()
{
	if((HAGENOTHERSAGREED == TRUE) && (HAGENNOMORETIMEWAIT == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_gatherarmy_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_GatherArmy_01_01");	//Паладинам нужна ваша помощь!
	if((MIS_BEWAREWATERMAGE == LOG_Running) || (MIS_BEWAREWATERMAGE == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_GatherArmy_01_02");	//И зачем же она им понадобилась?
		AI_Output(other,self,"DIA_Addon_Saturas_ADW_GatherArmy_01_05");	//Орки вторглись в Хоринис!
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_GatherArmy_01_06");	//(потрясенно) Что? Но этого не может быть!
		AI_Output(other,self,"DIA_Addon_Saturas_ADW_GatherArmy_01_08");	//За несколько дней этим тварям удалось превратить долину практически в сущий ад.
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_GatherArmy_01_09");	//А что с самим городом?
		AI_Output(other,self,"DIA_Addon_Saturas_ADW_GatherArmy_01_10");	//Орки смогли овладеть им без особого труда. Паладины были просто бессильны что-либо сделать.
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_GatherArmy_01_11");	//О Аданос!
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_GatherArmy_01_12");	//Если даже паладины бессильны перед лицом этого зла, тогда надежды практически нет.
		AI_Output(other,self,"DIA_Addon_Saturas_ADW_GatherArmy_01_13");	//Лорду Хагену нужна ваша помощь.
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_GatherArmy_01_14");	//Хорошо! Мы готовы помочь ему всем, чем сможем.
		BEWAREWATERMAGE = TRUE;
		if(MIS_BEWAREWATERMAGE == LOG_Running)
		{
			B_GivePlayerXP(1000);
			MIS_BEWAREWATERMAGE = LOG_SUCCESS;
			Log_SetTopicStatus(TOPIC_BEWAREWATERMAGE,LOG_SUCCESS);
			Log_AddEntry(TOPIC_BEWAREWATERMAGE,"Мне удалось сообщить магам Воды о случившемся.");
		}
		else
		{
			B_GivePlayerXP(500);
		};
	}
	else
	{
		B_GivePlayerXP(500);
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_GatherArmy_01_22");	//(решительно) Хорошо! Мы готовы помочь им всем, чем сможем.
	};
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_GatherArmy_01_23");	//Однако перед тем, как мы покинем эту долину и отправимся на помощь паладинам, нам надо закончить здесь одно очень важное дело.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_GatherArmy_01_24");	//Твое дело не может подождать?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_GatherArmy_01_25");	//Боюсь, что нет. Поскольку от него зависит дальнейшая судьба этой части острова.
	B_LogEntry(TOPIC_ORсGREATWAR,"Маги Воды согласны помочь лорду Хагену и его паладинам. Однако перед тем, как отправиться в Хоринис, они должны закончить здесь какое-то срочное дело. Похоже, мне придется помочь им, чтобы ускорить этот процесс.");
};


instance DIA_ADDON_SATURAS_ADW_ISTOK(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_adw_istok_condition;
	information = dia_addon_saturas_adw_istok_info;
	permanent = FALSE;
	description = "Тогда расскажи, в чем дело.";
};


func int dia_addon_saturas_adw_istok_condition()
{
	if(Npc_KnowsInfo(hero,dia_addon_saturas_adw_gatherarmy))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_istok_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_Istok_01_01");	//Тогда расскажи, в чем дело.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_Istok_01_02");	//Как ты знаешь, мы уже довольно долгое время изучаем культуру древнего народа.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_Istok_01_03");	//Нам удалось постичь уже большое количество сокрытых здесь тайн, которые хранят мудрость их создателей.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_Istok_01_04");	//Однако, несмотря на все это, нас всегда интересовал немного другой вопрос.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_Istok_01_05");	//Мы хотели понять изначальную причину, которая впоследствии вызвала ход дальнейших печальных событий.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_Istok_01_06");	//А разве Коготь Белиара не был той самой причиной?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_Istok_01_08");	//Артефакт Белиара действительно принес ужасное зло в эту долину.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_Istok_01_09");	//Но этого никогда бы не случилось, если бы сам Аданос не оставил без своего благословения это место.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_Istok_01_12");	//Свидетельство тому - записи, найденные нами в одном из древних манускриптов, что хранились в храме Аданоса.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_Istok_01_13");	//Судя по всему, это священное место было осквернено еще до того, как зодчие нашли Коготь.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_Istok_01_15");	//Мы хотим исправить эту ситуацию, дабы Аданос вновь благословил эту землю.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_Istok_01_19");	//И что мы можем сделать?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_Istok_01_20");	//После небольших раздумий мы приняли решение провести ритуал освящения.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_Istok_01_21");	//Это должно вернуть храму его былую мощь и величие. А вместе с этим и само благословение Аданоса.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_Istok_01_22");	//А я могу вам чем-то с этим помочь?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_Istok_01_23");	//Возможно. У меня такое чувство, что кто-то захочет помешать нам.
	MIS_RESTOREHRAM = LOG_Running;
	Log_CreateTopic(TOPIC_RESTOREHRAM,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RESTOREHRAM,LOG_Running);
	B_LogEntry(TOPIC_RESTOREHRAM,"По словам Сатураса, маги Воды, наконец, поняли истинную причину забвения цивилизации Древних. Судя по всему, сам Аданос лишил их благословения за осквернение своего храма. И теперь необходимо вернуть этой части острова его покровительство. Для этого маги Воды решили освятить оскверненный храм, проведя в нем какой-то таинственный ритуал. Однако Сатурас предупредил меня, что этому могут помешать. Интересно - кто именно?");
};


instance DIA_ADDON_SATURAS_ADW_FINDRIORDAN(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_adw_findriordan_condition;
	information = dia_addon_saturas_adw_findriordan_info;
	permanent = FALSE;
	description = "Когда вы планируете провести этот ритуал?";
};


func int dia_addon_saturas_adw_findriordan_condition()
{
	if(MIS_RESTOREHRAM == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_findriordan_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_FindRiordan_01_01");	//Когда вы планируете провести этот ритуал?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_FindRiordan_01_02");	//Уже скоро. Но прежде нам надо дождаться Риордиана.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_FindRiordan_01_04");	//Пару дней назад я отправил его в старые развалины храма, что находятся на севере этой долины.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_FindRiordan_01_05");	//Судя по древним записям, там должен храниться один из тех артефактов, который Зодчие использовали для своих ритуалов в храме Аданоса.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_FindRiordan_01_06");	//Нам он крайне необходим, чтобы провести свой ритуал.
	Wld_InsertNpc(riordian_zombie,"ADW_CANYON_LIBRARY_RIGHT_13");
	B_LogEntry(TOPIC_RESTOREHRAM,"Сатурас ждет возвращения Риордиана. Он должен был принести из храма на севере какой-то древний артефакт. Зодчие использовали его для проведения церемоний в храме Аданоса.");
};


instance DIA_ADDON_SATURAS_ADW_FINDRIORDANDONE(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_adw_findriordandone_condition;
	information = dia_addon_saturas_adw_findriordandone_info;
	permanent = FALSE;
	description = "Я встретил Риордиана.";
};


func int dia_addon_saturas_adw_findriordandone_condition()
{
	if((MIS_RESTOREHRAM == LOG_Running) && (RIORDANEVILDEAD == TRUE) && (Npc_HasItems(hero,itmi_adanosamulet) >= 1))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_findriordandone_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_FindRiordanDone_01_01");	//Я встретил Риордиана.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_FindRiordanDone_01_02");	//Хорошо. Но почему он не пришел вместе с тобой?
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_FindRiordanDone_01_03");	//Потому, что он мертв. Неодолимое зло завладело им, и он чуть было не убил меня.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_FindRiordanDone_01_05");	//О Аданос...(потрясенно) Это огромная и невосполнимая потеря для всех магов Воды! Я не должен был этого допустить.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_FindRiordanDone_01_07");	//Ладно...(приходя в себя) Тогда нам нельзя больше медлить!
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_FindRiordanDone_01_08");	//По всей видимости, зло уже близко, и в любой момент оно может завладеть каждым из нас.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_FindRiordanDone_01_09");	//Ах да, тебе удалось найти тот артефакт, который был должен принести Риордиан?
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_FindRiordanDone_01_10");	//Да, вот он.
	B_GiveInvItems(other,self,itmi_adanosamulet,1);
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_FindRiordanDone_01_11");	//Отлично! Тогда мы немедленно отправляемся в храм Аданоса, чтобы совершить этот священный ритуал.
	READYWATERRITUAL = TRUE;
	B_LogEntry(TOPIC_RESTOREHRAM,"Сатурас был потрясен смертью Риордиана. Теперь магам Воды ничего не остается, как отправляться в храм Аданоса и совершить священный ритуал, пока зло, погубившее Риордиана, окончательно не завладело остальными.");
	AI_StopProcessInfos(self);
	B_StartOtherRoutine(KDW_14000_Addon_Saturas_ADW,"WaitTempel");
	B_StartOtherRoutine(KDW_14020_Addon_Nefarius_ADW,"WaitTempel");
	B_StartOtherRoutine(KDW_14010_Addon_Cronos_ADW,"WaitTempel");
	B_StartOtherRoutine(KDW_14050_Addon_Merdarion_ADW,"WaitTempel");
};

instance DIA_ADDON_SATURAS_ADW_BEFORERITUAL(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_adw_beforeritual_condition;
	information = dia_addon_saturas_adw_beforeritual_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_saturas_adw_beforeritual_condition()
{
	if((MIS_RESTOREHRAM == LOG_Running) && (READYWATERRITUAL == TRUE) && (Npc_GetDistToWP(self,"ADW_ADANOSTEMPEL_RAVEN_01") <= 2000))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_beforeritual_info()
{
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_BeforeRitual_01_01");	//Итак, ты здесь. Тогда начнем.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_BeforeRitual_01_03");	//Все, что от тебя требуется, - это не дать кому-либо помешать нам, чтобы мы смогли закончить начатый нами ритуал.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_BeforeRitual_01_04");	//Когда он начнется, мы окажемся совершенно беззащитными перед малейшей угрозой!
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_BeforeRitual_01_05");	//Поэтому, если что-то пойдет не так, вся наша надежда останется только на тебя.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_BeforeRitual_01_06");	//Я все понял.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_BeforeRitual_01_07");	//Тогда приступим. И да хранит нас Аданос!
	B_LogEntry(TOPIC_RESTOREHRAM,"Маги Воды начали свой ритуал освящения. Я должен следить за тем, чтобы никто не смог помешать им.");
	BEGINWATERRITUAL = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"WaterRitual");
	B_StartOtherRoutine(KDW_14020_Addon_Nefarius_ADW,"WaterRitual");
	B_StartOtherRoutine(KDW_14010_Addon_Cronos_ADW,"WaterRitual");
	B_StartOtherRoutine(KDW_14050_Addon_Merdarion_ADW,"WaterRitual");
};

instance DIA_ADDON_SATURAS_ADW_DURINGRITUAL(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_adw_duringritual_condition;
	information = dia_addon_saturas_adw_duringritual_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_saturas_adw_duringritual_condition()
{
	if((MIS_RESTOREHRAM == LOG_Running) && (BEGINWATERRITUAL == TRUE) && (STOPWATERRITUAL == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_duringritual_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_SATURAS_ADW_AFTERRITUAL(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_adw_afterritual_condition;
	information = dia_addon_saturas_adw_afterritual_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_saturas_adw_afterritual_condition()
{
	if((MIS_RESTOREHRAM == LOG_Running) && (STOPWATERRITUAL == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_afterritual_info()
{
	B_GivePlayerXP(1000);
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_AfterRitual_01_01");	//Отлично! Кажется, у нас все получилось.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_AfterRitual_01_04");	//Кто-то явно не хотел свершения задуманного нами.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_AfterRitual_01_06");	//Но теперь я уже чувствую, как это место наполняется благословением самого Аданоса!
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_AfterRitual_01_09");	//Оно вновь стало священным, и отныне будет хранить эти земли, как когда-то уже хранило их.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_AfterRitual_01_11");	//Благодарю тебя за твою помощь. Она оказалась бесценной.
	MIS_RESTOREHRAM = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_RESTOREHRAM,LOG_SUCCESS);
	B_LogEntry(TOPIC_RESTOREHRAM,"С моей помощью магам Воды все-таки удалось совершить свой ритуал. Храм Аданоса был очищен от скверны и вернул свое былое могущество. Теперь ничто не угрожает этим землям, ибо сам Аданос хранит их.");
};


instance DIA_ADDON_SATURAS_ADW_GATHERARMYDONE(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_adw_gatherarmydone_condition;
	information = dia_addon_saturas_adw_gatherarmydone_info;
	permanent = FALSE;
	description = "Теперь вы готовы отправиться на помощь к лорду Хагену?";
};


func int dia_addon_saturas_adw_gatherarmydone_condition()
{
	if(MIS_RESTOREHRAM == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_gatherarmydone_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_GatherArmyDone_01_01");	//Теперь вы готовы отправиться на помощь к лорду Хагену?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_GatherArmyDone_01_03");	//Передай главе паладинов, что мы придем по первому же его зову.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_GatherArmyDone_01_04");	//И да поможет нам Аданос пережить это нелегкое время!
	KDW_JOINHAGEN = TRUE;
	B_LogEntry(TOPIC_ORсGREATWAR,"Надо сообщить лорду Хагену о том, что маги Воды ждут его дальнейших распоряжений относительно предстоящего сражения с орками.");
};


instance DIA_ADDON_SATURAS_ADW_RAVENAWAY(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_adw_RAVENAWAY_condition;
	information = dia_addon_saturas_adw_RAVENAWAY_info;
	permanent = FALSE;
	description = "Ворон сбежал!";
};

func int dia_addon_saturas_adw_RAVENAWAY_condition()
{
	if(RavenAway == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_RAVENAWAY_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_RAVENAWAY_01_01");	//Ворон сбежал!
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_RAVENAWAY_01_02");	//(непонимающе) Что?  То есть как сбежал?
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_RAVENAWAY_01_03");	//Я настиг его во внутреннем святилище храма. Между нами завязался бой.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_RAVENAWAY_01_04");	//Но в последний момент он использовал какую-то неизвестную мне магию и просто исчез.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_RAVENAWAY_01_05");	//Хммм...(задумчиво) Я даже не знаю, что тебе сказать.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_RAVENAWAY_01_06");	//Может быть, теперь он больше не так опасен?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_RAVENAWAY_01_07");	//Я так не думаю. Здесь по-прежнему ощущается присутствие огромного зла!
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_RAVENAWAY_01_08");	//И пока мы не убьем Ворона, это не прекратится.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_RAVENAWAY_01_09");	//Тогда где мне его искать?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_RAVENAWAY_01_10");	//Если бы я знал, то давно бы отправил тебя по его следу. Мне нужно время, чтобы все обдумать.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_RAVENAWAY_01_12");	//Тогда, может быть, я буду готов ответить тебе на этот вопрос.
	B_LogEntry(TOPIC_Addon_RavenKDW,"Сатурас был в замешательстве, узнав, что Ворон сбежал от меня. Теперь ему нужно время, чтобы обдумать наши дальнейшие действия.");
	RavenAwayDone = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_Addon_Kammern,LOG_SUCCESS);
};

instance DIA_ADDON_SATURAS_ADW_ADANOSVALLEY(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_adw_ADANOSVALLEY_condition;
	information = dia_addon_saturas_adw_ADANOSVALLEY_info;
	permanent = FALSE;
	description = "Что ты можешь сказать об этой древней табличке?";
};

func int dia_addon_saturas_adw_ADANOSVALLEY_condition()
{
	if((Npc_HasItems(hero,ItWr_CroneAdanos) >= 1) && (KnowsTextAdanos == FALSE) && (MIS_AdanosCrone == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_ADANOSVALLEY_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_ADANOSVALLEY_01_01");	//Что ты можешь сказать об этой древней табличке?
	B_GiveInvItems(other,self,ItWr_CroneAdanos,1);
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_ADANOSVALLEY_01_02");	//(удивленно) Она совсем не похожа на те скрижали, которые мы находили здесь ранее.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_ADANOSVALLEY_01_03");	//Где ты отыскал ее?
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_ADANOSVALLEY_01_04");	//В одном из внутренних святилищ храма Аданоса.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_ADANOSVALLEY_01_05");	//По всей видимости, она представляла огромную ценность, если древние хранили ее там.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_ADANOSVALLEY_01_06");	//А ты можешь прочесть, что на ней написано?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_ADANOSVALLEY_01_07");	//Боюсь, что нет. Символы, изображенные на ней, мне совершенно не знакомы.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_ADANOSVALLEY_01_08");	//Похоже, что все они сделаны на каком-то очень древнем языке. А на его изучение могут уйти целые годы.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_ADANOSVALLEY_01_10");	//Так долго я ждать не могу.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_ADANOSVALLEY_01_11");	//Тогда найди того, кто владеет им. Иного выхода я не вижу.
	B_GiveInvItems(self,other,ItWr_CroneAdanos,1);
	B_LogEntry(TOPIC_AdanosCrone,"Сатураса очень заинтересовала древняя табличка, которую я обнаружил в храме, однако он не смог ее прочесть. Похоже, надписи сделаны на каком-то очень древнем языке.");
};

instance DIA_ADDON_SATURAS_ADW_ABOUTANTIENTGUARDS(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_adw_aboutantientguards_condition;
	information = dia_addon_saturas_adw_aboutantientguards_info;
	permanent = FALSE;
	description = "Тебе что-нибудь известно о каменных стражах?";
};

func int dia_addon_saturas_adw_aboutantientguards_condition()
{
	if((KnowAboutAdVal == TRUE) && (RavenIsDead == FALSE) && (StoneBossIsDead == FALSE) && (TellAboutAdanosWeapon == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_aboutantientguards_info()
{
	var int randomplace;

	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_AboutAntientGuards_01_01");	//Тебе что-нибудь известно о каменных стражах?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_AboutAntientGuards_01_04");	//В древних записях говорится, что эти создания, будучи творением самого Аданоса, являются стражниками его вотчины.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_AboutAntientGuards_01_05");	//Они очень сильны, и даже опытному воину будет нелегко с ними справиться.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_AboutAntientGuards_01_06");	//Однако, как нам удалось понять, существовало некое оружие, с помощью которого древние усмиряли этих стражей.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_AboutAntientGuards_01_07");	//Что это за оружие?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_AboutAntientGuards_01_08");	//Я не знаю. Тебе придется самому найти ответ на этот вопрос.

	if(DragonGoldIsDead == TRUE)
	{
		if(TellAboutAdanosWeapon == FALSE)
		{
			randomplace = Hlp_Random(4);

			if(randomplace == 0)
			{
				Wld_InsertItem(itmw_adanosmolot,"FP_ITEM_ADANOSMOLOT_01");
			}
			else if(randomplace == 1)
			{
				Wld_InsertItem(itmw_adanosmolot,"FP_ITEM_ADANOSMOLOT_02");
			}
			else if(randomplace == 2)
			{
				Wld_InsertItem(itmw_adanosmolot,"FP_ITEM_ADANOSMOLOT_03");
			}
			else
			{
				Wld_InsertItem(itmw_adanosmolot,"FP_ITEM_ADANOSMOLOT_04");
			};

			TELLABOUTSTONEGUARD = TRUE;
			TellAboutAdanosWeapon = TRUE;
		};
	};
};

instance DIA_ADDON_SATURAS_ADW_AncientAltar(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_adw_AncientAltar_condition;
	information = dia_addon_saturas_adw_AncientAltar_info;
	permanent = FALSE;
	description = "Ты знаешь, как можно вернуть магию древнему алтарю?";
};

func int dia_addon_saturas_adw_AncientAltar_condition()
{
	if((TaskHram_04 == TRUE) && (ANCIENTALTARSIsAwake == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_AncientAltar_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_AncientAltar_01_01");	//Ты знаешь, как можно вернуть магию какому-нибудь древнему алтарю?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_AncientAltar_01_02");	//Довольно необычный вопрос. Уж не знаю, зачем тебе это понадобилось.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_AncientAltar_01_03");	//Однако, на мой взгляд, это можно сделать с помощью фокусирующего кристалла.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_AncientAltar_01_04");	//Ты говоришь о юниторе?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_AncientAltar_01_05");	//Да. Обычно он имеет свойство притягивать к себе магическую энергию и в свою очередь передавать часть этой энергии тому месту, где находится сам.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_AncientAltar_01_06");	//Понимаю. А у тебя, случайно, не завалялась лишняя парочка этих кристаллов?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_AncientAltar_01_07");	//С этим тебе стоит обратиться к Мердариону. Все юниторы, что у меня были, я отдал ему.
	AltarToMerdarion = TRUE;
};

instance DIA_ADDON_SATURAS_ADW_Tree(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_adw_Tree_condition;
	information = dia_addon_saturas_adw_Tree_info;
	permanent = FALSE;
	description = "Ты разбираешься в деревьях?";
};

func int dia_addon_saturas_adw_Tree_condition()
{
	if((LastAdanosTask == TRUE) && (RootIsUp == FALSE) && (LastAdanosTaskDone == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_Tree_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_Tree_01_01");	//Ты разбираешься в деревьях?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_Tree_01_02");	//(удивленно) Что? Ты начинаешь все чаще задавать очень странные вопросы.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_Tree_01_03");	//Зачем тебе это?
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_Tree_01_04");	//Все просто. Есть мертвое дерево и его необходимо вернуть к жизни.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_Tree_01_05");	//Но почему ты решил обратиться именно ко мне?
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_Tree_01_06");	//Ну, ты же маг. Я подумал, ты знаешь способ, как это можно сделать.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_Tree_01_07");	//Даже если я маг, это не означает, что мне под силу любые вещи в этом мире.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_Tree_01_08");	//Что, неужели мудрый Сатурас ничего не сможет мне подсказать?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_Tree_01_09");	//Боюсь, что в этот раз ничего.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_Tree_01_10");	//Хотя...(задумчиво) Единственное, на мой взгляд, что может помочь тебе в этом деле, - это магия друидов.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_Tree_01_11");	//Магия друидов? Никогда о ней не слышал.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_Tree_01_12");	//Я и сам о ней почти уже ничего не помню. Тем не менее она действительно существует.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_Tree_01_13");	//Когда я был так же молод, как ты, мне доводилось встречаться с некоторыми из друидов.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_Tree_01_14");	//Они - как и мы, маги Воды - чтут священные заповеди Аданоса. Но свою магическую силу они черпают из его творений - деревьев и растений.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_Tree_01_15");	//То есть мне нужно найти друида, так?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_Tree_01_16");	//Да. Однако я сомневаюсь, что тебе удастся отыскать кого-либо из них на этом острове.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_Tree_01_17");	//Насколько я помню, все они жили в лесах Миртаны на материке. Правда, есть еще кое-что.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_Tree_01_18");	//Если мне не изменяет память, один из магов, прибывших на этот остров для возведения магического барьера, неплохо разбирался в ней.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_Tree_01_19");	//И кто же это?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_Tree_01_20");	//(ворчливо) Ксардас! В свое время он частенько возился с различными магическими формулами, отдаленно напоминавшими магию друидов.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_Tree_01_21");	//Больше я ничем не могу помочь тебе в этом вопросе.
	XarDruid = TRUE;

	if(Kapitel < 5)
	{
		B_LogEntry(TOPIC_AdanosCrone,"Сатурас обмолвился о магии друидов, которая могла бы помочь мне оживить Великое древо. По его словам, кое-что о ней может знать Ксардас. Думаю, пора навестить старика. Или же отыскать кого-то еще, кто разбирается в магии друидов.");
	}
	else
	{
		B_LogEntry(TOPIC_AdanosCrone,"Сатурас обмолвился о магии друидов, которая могла бы помочь мне оживить Великое древо. Мне надо отыскать того, кто в ней разбирается.");
	};
};

instance DIA_ADDON_SATURAS_ADW_JarCurse(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_adw_JarCurse_condition;
	information = dia_addon_saturas_adw_JarCurse_info;
	permanent = FALSE;
	description = "У вас тут все в порядке?";
};

func int dia_addon_saturas_adw_JarCurse_condition()
{
	if((MIS_JarCurse == LOG_Running) && (MyxirSendSaturas == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_JarCurse_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_JarCurse_01_01");	//У вас тут все в порядке?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_JarCurse_01_02");	//Нет, как видишь. Похоже, что осквернение храма Аданоса имело далеко идущие последствия!
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_JarCurse_01_03");	//Что ты имеешь в виду?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_JarCurse_01_04");	//(ворчливо) Ты что, ослеп? Огромные орды нежити заполонили эти земли!
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_JarCurse_01_05");	//Какая-то неведомая нам древняя сила заставила их восстать из небытия.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_JarCurse_01_06");	//И теперь они готовы обрушить свой гнев на всех, кто посмеет встать у них на пути.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_JarCurse_01_07");	//Полагаешь, во всем этом виноват Ворон?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_JarCurse_01_08");	//Скорее всего. Его святотатство и осквернение древних святынь наверняка не прошло незамеченным.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_JarCurse_01_09");	//Нам остается только молиться, чтобы это было единственное бедствие, которое нас ожидает в дальнейшем.
	MeetSaturasOkPortal = TRUE;
	B_LogEntry(TOPIC_JarCurse,"Ситуация в Яркендаре не лучше, чем в Хоринисе. Какие-то неведомые древние силы подняли огромную армию нежити. По всей видимости, нежить, прорвавшаяся через портал в Хоринис, была лишь малой частью того, что ожидает всех нас.");	
};

instance DIA_ADDON_SATURAS_ADW_JarCurseUndead(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_adw_JarCurseUndead_condition;
	information = dia_addon_saturas_adw_JarCurseUndead_info;
	permanent = FALSE;
	description = "Эта нежить не похожа на обычную?";
};

func int dia_addon_saturas_adw_JarCurseUndead_condition()
{
	if((MIS_JarCurse == LOG_Running) && (Npc_KnowsInfo(other,DIA_Addon_Saturas_ADW_JarCurse) == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_JarCurseUndead_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_JarCurseUndead_01_01");	//Эта нежить не похожа на обычную?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_JarCurseUndead_01_02");	//Нет! И в этом самая большая проблема. Наша магия практически бессильна против них.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_JarCurseUndead_01_03");	//По всей видимости, это воины и жрецы древнего народа, которых в свое время постигло погубившее их проклятие.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_JarCurseUndead_01_04");	//И теперь они восстали, дабы отомстить за свою гибель и за осквернения этих земель прислужниками Белиара!
};

instance DIA_ADDON_SATURAS_ADW_JarCurseDo(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_adw_JarCurseDo_condition;
	information = dia_addon_saturas_adw_JarCurseDo_info;
	permanent = FALSE;
	description = "И что мы можем сделать?";
};

func int dia_addon_saturas_adw_JarCurseDo_condition()
{
	if((MIS_JarCurse == LOG_Running) && (Npc_KnowsInfo(other,DIA_Addon_Saturas_ADW_JarCurseUndead) == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_JarCurseDo_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_JarCurseDo_01_01");	//И что мы можем сделать?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_JarCurseDo_01_02");	//Молиться Аданосу, чтобы он пощадил всех нас!
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_JarCurseDo_01_03");	//А если серьезно?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_JarCurseDo_01_04");	//(задумчиво) Я точно не знаю. Но у меня есть подозрение, что вся эта нежить - вовсе не бездумное стадо мертвецов.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_JarCurseDo_01_06");	//Их всех наверняка направляет чья-то злая воля! Но чья?
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_JarCurseDo_01_07");	//У тебя есть какие-нибудь мысли на этот счет?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_JarCurseDo_01_08");	//Как и у любого народа, у Зодчих были свои лидеры и вожди. Те, кого они уважали и почитали.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_JarCurseDo_01_09");	//Возможно, за всем этим стоит именно кто-то из них!
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_JarCurseDo_01_10");	//Может, Куарходрон? Он был великим полководцем зодчих.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_JarCurseDo_01_11");	//Тогда единственное, что мы можем сейчас предпринять, так это спросить у него о случившемся.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_JarCurseDo_01_14");	//Только будь осторожен! По моим данным, все дороги от большого храма в этой долине сейчас контролирует нежить.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_JarCurseDo_01_15");	//Да и камни телепортации также наверняка небезопасны.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_JarCurseDo_01_16");	//Так что, если сможешь, позаботься о том, чтобы обезопасить и их.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_JarCurseDo_01_17");	//Я постараюсь.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_JarCurseDo_01_18");	//Тогда поторопись! Для нас сейчас дорога каждая минута.
	MIS_FreeTeleport = LOG_Running;
	Log_CreateTopic(TOPIC_FreeTeleport,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FreeTeleport,LOG_Running);
	B_LogEntry(TOPIC_FreeTeleport,"Сатурас попросил меня избавить все телепорты в долине от присутствия нежити.");	
	B_LogEntry_Quiet(TOPIC_JarCurse,"По мнению Сатураса, армию нежити направляет чья-то злая воля. Мне необходимо отыскать Куарходрона. Возможно, он что-то знает об этом.");	
	AI_StopProcessInfos(self);
	Wld_InsertNpc(NONE_ADDON_1159_Rhademes,"ADW_SATURAS_2_GOLDDRAGON");
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"FP_ROAM_VALLEY_037");
	Wld_InsertNpc(Ancient_Warrior_01,"FP_ROAM_VALLEY_036");
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"ADW_VALLEY_PATH_032");
	Wld_InsertNpc(Ancient_Warrior_02,"ADW_VALLEY_PATH_031");
	Wld_InsertNpc(Skeleton_Shadow_Priest_ADW_01,"ADW_SOUTHWEST_TELEPORTSTATION");
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"ADW_PORTALTEMPEL_05");
	Wld_InsertNpc(Ancient_Warrior_01,"ADW_PORTALTEMPEL_06");
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"ADW_PORTALTEMPEL_08B");
	Wld_InsertNpc(Ancient_Warrior_02,"ADW_PORTALTEMPEL_08A");
	Wld_InsertNpc(Skeleton_Shadow_Priest_ADW_02,"ADW_PORTALTEMPEL_TELEPORTSTATION");
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"FP_ROAM_TELEPORT_03_01");
	Wld_InsertNpc(Ancient_Warrior_01,"FP_ROAM_TELEPORT_03_02");
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"FP_ROAM_TELEPORT_03_03");
	Wld_InsertNpc(Ancient_Warrior_02,"FP_ROAM_TELEPORT_03_04");
	Wld_InsertNpc(Skeleton_Shadow_Priest_ADW_03,"FP_ROAM_TELEPORT_03_05");
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"FP_ROAM_CANYON_MONSTER_32");
	Wld_InsertNpc(Ancient_Warrior_01,"FP_ROAM_CANYON_MONSTER_31");
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"ADW_CANYON_TELEPORT_PATH_02");
	Wld_InsertNpc(Ancient_Warrior_02,"FP_ROAM_CANYON_MONSTER_33");
	Wld_InsertNpc(Skeleton_Shadow_Priest_ADW_04,"ADW_CANYON_TELEPORT_PATH_01");
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"BL_UP_PLACE_06");
	Wld_InsertNpc(Ancient_Warrior_01,"FP_ROAM_ORKINCAMP_51");
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"FP_ROAM_ENTRANCEORCGUARD_10");
	Wld_InsertNpc(Ancient_Warrior_02,"BL_UP_PLACE_03");
	Wld_InsertNpc(Skeleton_Shadow_Priest_ADW_05,"ADW_ADANOSTEMPEL_TELEPORTSTATION");
};

instance DIA_ADDON_SATURAS_ADW_JarCurseDone(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_adw_JarCurseDone_condition;
	information = dia_addon_saturas_adw_JarCurseDone_info;
	permanent = FALSE;
	description = "Я зачистил местность рядом с камнями телепортации.";
};

func int dia_addon_saturas_adw_JarCurseDone_condition()
{
	if((MIS_FreeTeleport == LOG_Running) && (Npc_IsDead(Skeleton_Shadow_Priest_ADW_01) == TRUE) && (Npc_IsDead(Skeleton_Shadow_Priest_ADW_02) == TRUE) && (Npc_IsDead(Skeleton_Shadow_Priest_ADW_03) == TRUE) && (Npc_IsDead(Skeleton_Shadow_Priest_ADW_04) == TRUE) && (Npc_IsDead(Skeleton_Shadow_Priest_ADW_05) == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_JarCurseDone_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_JarCurseDone_01_01");	//Я зачистил местность рядом с камнями телепортации.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_JarCurseDone_01_02");	//Хорошо! По крайней мере, нам больше не придется ждать удара в спину.
	MIS_FreeTeleport = LOG_Success;
	Log_SetTopicStatus(TOPIC_FreeTeleport,LOG_Success);
	B_LogEntry(TOPIC_FreeTeleport,"Я сообщил Сатурасу, что расчистил телепорты от нежити.");	
};

instance DIA_ADDON_SATURAS_ADW_Qvardemon(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_adw_Qvardemon_condition;
	information = dia_addon_saturas_adw_Qvardemon_info;
	permanent = FALSE;
	description = "Мне нужен твой совет.";
};

func int dia_addon_saturas_adw_Qvardemon_condition()
{
	if((MIS_Qvardemon == LOG_Running) && (FTDamageQvardemon == TRUE) && (QvardemonIsDead == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_Qvardemon_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_Qvardemon_01_01");	//Мне нужен твой совет.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_Qvardemon_01_02");	//Конечно, сын мой. Какой именно?
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_Qvardemon_01_03");	//В одном из храмов я обнаружил дух верховного жреца Зодчих - Кардимона.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_Qvardemon_01_04");	//Именно его злая воля направляет нежить, атаковавшую нас. Правда, только магов и жрецов древних, как и он сам.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_Qvardemon_01_05");	//Хммм...(задумчиво) Тогда, полагаю, что его нужно немедленно уничтожить.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_Qvardemon_01_06");	//Я пытался, но безуспешно. Мое оружие бессильно против него. У тебя есть идеи на этот счет?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_Qvardemon_01_08");	//Не хочу тебя огорчать, но, боюсь, наших познаний будет недостаточно для решения этой проблемы.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_Qvardemon_01_09");	//Но не исключено, что в этом мире существует какой-нибудь могущественный артефакт, способный разрушить чары древнего жреца.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_Qvardemon_01_10");	//Правда, для этого он должен обладать воистину божественной силой! Силой, которой тебя мог бы наделить только сам Аданос.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_Qvardemon_01_11");	//Но это лишь мои догадки. Я не могу тебе сказать, где искать подобный артефакт.
	B_LogEntry(TOPIC_Qvardemon,"Сатурас сказал, что в битве с Кардимоном мне может помочь только артефакт, обладающий силой самих богов и способный сокрушить его защитные чары. Однако это всего лишь предположение.");	
};

instance DIA_ADDON_SATURAS_ADW_QvardemonDead(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_adw_QvardemonDead_condition;
	information = dia_addon_saturas_adw_QvardemonDead_info;
	permanent = FALSE;
	description = "Я уничтожил Кардимона!";
};

func int dia_addon_saturas_adw_QvardemonDead_condition()
{
	if(MIS_Qvardemon == LOG_Success)
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_QvardemonDead_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_QvardemonDead_01_01");	//Я уничтожил Кардимона!
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_QvardemonDead_01_02");	//Это хорошие новости, сын мой. Да благословит тебя Аданос!
};

instance DIA_ADDON_SATURAS_ADW_CurseAncient(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_adw_CurseAncient_condition;
	information = dia_addon_saturas_adw_CurseAncient_info;
	permanent = FALSE;
	description = "Что ты знаешь о проклятии древнего народа?";
};

func int dia_addon_saturas_adw_CurseAncient_condition()
{
	if((MIS_CurseAncient == LOG_Running) && (CurseAncientRemove == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_CurseAncient_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_CurseAncient_01_01");	//Что ты знаешь о проклятии древнего народа?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_CurseAncient_01_02");	//Не очень много. А почему ты спрашиваешь?
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_CurseAncient_01_03");	//Нам необходимо как можно скорее избавить от него эту землю.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_CurseAncient_01_04");	//Мой внутренний голос подсказывает мне, что только так мы сможем остановить наступление нежити.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_CurseAncient_01_05");	//Хммм... Но откуда у тебя такая уверенность?
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_CurseAncient_01_06");	//Слишком долго рассказывать. Просто скажи, что мы можем сделать?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_CurseAncient_01_07");	//Насколько я знаю, проклятье Зодчих очень древнее и могущественное.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_CurseAncient_01_08");	//Обычному человеку едва ли будет под силу его разрушить.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_CurseAncient_01_09");	//А что насчет Аданоса? Он бы смог?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_CurseAncient_01_10");	//Он же бог! Все в его власти. Но, боюсь, что обычные молитвы тебе вряд ли здесь помогут.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_CurseAncient_01_11");	//Мне даже представить трудно, что может заставить Аданоса сотворить подобное чудо.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_CurseAncient_01_12");	//Это должно быть что-то очень особенное! То, ради чего он будет готов снизослать свое благословение на этот проклятый народ. 
	B_LogEntry(TOPIC_CurseAncient,"Сатурас не знает, что может заставить Аданоса снять проклятие с древнего народа. Чувствую, ответы мне необходимо искать в другом месте.");	
};

instance DIA_ADDON_SATURAS_ADW_CurseAncientDone(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_adw_CurseAncientDone_condition;
	information = dia_addon_saturas_adw_CurseAncientDone_info;
	permanent = FALSE;
	description = "Древняя нежить больше не потревожит вас.";
};

func int dia_addon_saturas_adw_CurseAncientDone_condition()
{
	if(MIS_JarCurse == LOG_Success)
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_CurseAncientDone_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_CurseAncientDone_01_01");	//Древняя нежить больше не потревожит вас.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_CurseAncientDone_01_02");	//А ту, что еще осталась, для вас не составит труда перебить.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_CurseAncientDone_01_03");	//Ты в этом уверен, сын мой? Неужели мы все должны благодарить тебя за наше спасение?
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_CurseAncientDone_01_04");	//Благодарите лучше Аданоса. А я лишь просто исполнил его волю.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_CurseAncientDone_01_05");	//Ну что же, в таком случае я буду каждый день обращаться к нему в молитвах и благодарить за наше спасение.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_CurseAncientDone_01_06");	//Однако я все-таки полагаю, что и ты приложил для этого немало усилий!
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_CurseAncientDone_01_07");	//Возьми этот эликсир. Это лучшее из того, что я могу тебе предложить.
	B_GiveInvItems(self,other,ITPO_MEGAPOTIONSKILL,1);
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_CurseAncientDone_01_08");	//Благодарю.
};

instance DIA_ADDON_SATURAS_ADW_WaterMageDocumentsDone(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_adw_WaterMageDocumentsDone_condition;
	information = dia_addon_saturas_adw_WaterMageDocumentsDone_info;
	permanent = FALSE;
	description = "Кажется, это принадлежит вам.";
};

func int dia_addon_saturas_adw_WaterMageDocumentsDone_condition()
{
	if((MIS_WaterMageDocuments == LOG_Running) && (Npc_HasItems(hero,ItWr_WaterMageDoc) >= 1))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_WaterMageDocumentsDone_info()
{
	B_GivePlayerXP(1500);
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_WaterMageDocumentsDone_01_01");	//Кажется, это принадлежит вам.
	B_GiveInvItems(other,self,ItWr_WaterMageDoc,1);
	Npc_RemoveInvItems(self,ItWr_WaterMageDoc,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_WaterMageDocumentsDone_01_02");	//(удивленно) Довольно неожиданно, что Ли дал это поручение именно тебе.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_WaterMageDocumentsDone_01_03");	//А разве имеет большое значение, кто принес вам эти записи?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_WaterMageDocumentsDone_01_04");	//Нет, просто я рассчитывал на то, что он пошлет в Долину Рудников большой отряд наемников.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_WaterMageDocumentsDone_01_05");	//А ты, выходит, справился с этим в одиночку.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_WaterMageDocumentsDone_01_06");	//И тебя это удивляет?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_WaterMageDocumentsDone_01_07");	//Немного. Но в любом случае мы все очень благодарны тебе за помощь.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_WaterMageDocumentsDone_01_08");	//Думаю, ты найдешь достойное применение этим свиткам.
	B_GiveInvItemsManyThings(self,other);
	CreateInvItems(other,ItSc_IceWave,2);
	CreateInvItems(other,ItSc_LightningFlash,1);
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_WaterMageDocumentsDone_01_09");	//Благодарю.
	MIS_WaterMageDocuments = LOG_Success;
	Log_SetTopicStatus(TOPIC_WaterMageDocuments,LOG_Success);
	B_LogEntry(TOPIC_WaterMageDocuments,"Я принес Сатурасу записи магов Воды, оставленные ими в Долине Рудников.");	
};

instance DIA_ADDON_SATURAS_ADW_SendNorolas(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_adw_SendNorolas_condition;
	information = dia_addon_saturas_adw_SendNorolas_info;
	permanent = FALSE;
	description = "А о чем эти записи, которые я принес?";
};

func int dia_addon_saturas_adw_SendNorolas_condition()
{
	if(MIS_WaterMageDocuments == LOG_Success)
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_SendNorolas_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_SendNorolas_01_01");	//А о чем эти записи, которые я принес?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_SendNorolas_01_02");	//Это все наши труды, собранные за долгие годы, проведенные в Долине Рудников.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_SendNorolas_01_03");	//Большая их часть посвящена существовавшему тогда Братству Спящего.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_SendNorolas_01_04");	//Если точнее, нас очень интересовала магия, которую использовали их духовные лидеры - гуру.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_SendNorolas_01_06");	//Она довольно уникальна по своей сути. Мы так до сих пор и не поняли, откуда они черпали свою магическую энергию и возможность использовать руны.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_SendNorolas_01_08");	//Если нам, магам Воды, эти знания доступны благодаря воле Аданоса, то кто является их покровителем?
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_SendNorolas_01_09");	//Разве это был не Спящий?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_SendNorolas_01_10");	//Да, поначалу мы тоже так считали. Но, насколько мне известно, Гуру, уцелевшие после исчезновения Барьера, до сих пор имеют возможность использовать ее.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_SendNorolas_01_12");	//Поэтому тут должно быть какое-то другое объяснение.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_SendNorolas_01_13");	//А почему бы просто не пойти и поговорить с ними об этом?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_SendNorolas_01_14");	//Боюсь, они вряд ли станут раскрывать свои секреты.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_SendNorolas_01_15");	//И что ты предлагаешь?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_SendNorolas_01_16");	//Недавно я принял решение послать одного из наших магов-послушников в старый храм Братства, что на болотах.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_SendNorolas_01_17");	//Скорее всего, ответы на наши вопросы мы можем отыскать только там.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_SendNorolas_01_18");	//Но ведь это довольно опасно. Ты не боишься, что его поймают орки или сожрут какие-нибудь злобные твари?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_SendNorolas_01_20");	//Уверен, что он справится. Он очень хорошо подготовлен! Хотя лишняя помощь еще никогда и никому не помешала.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_SendNorolas_01_21");	//Если хочешь, можешь отправиться вслед за ним и помочь ему в наших поисках.
	MIS_SendNorolas = LOG_Running;
	Log_CreateTopic(TOPIC_SendNorolas,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SendNorolas,LOG_Running);
	B_LogEntry(TOPIC_SendNorolas,"Сатурас послал начинающего мага в храм Братства Спящего, что на болотах в Долине Рудников. Я мог бы ему помочь. Сатурас ищет то, что каким-то образом было связано с магией Гуру.");
};

var int SaturasReadDay;
var int SaturasReadGuru;

instance DIA_ADDON_SATURAS_ADW_SendNorolas_Done(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_adw_SendNorolas_Done_condition;
	information = dia_addon_saturas_adw_SendNorolas_Done_info;
	permanent = FALSE;
	description = "Я принес дневник Ю'бериона.";
};

func int dia_addon_saturas_adw_SendNorolas_Done_condition()
{
	if((MIS_SendNorolas == LOG_Success) && (Npc_HasItems(hero,ItWr_UberionBook) >= 1))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_SendNorolas_Done_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_SendNorolas_Done_01_01");	//Я принес дневник Ю'бериона.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_SendNorolas_Done_01_02");	//Это очень хорошие новости, сын мой. Дай мне взглянуть на него.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_SendNorolas_Done_01_03");	//Вот.
	B_GiveInvItems(other,self,ItWr_UberionBook,1);
	Npc_RemoveInvItems(self,ItWr_UberionBook,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_SendNorolas_Done_01_04");	//Хммм... Да, очень интересные мысли посещали этого человека.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_SendNorolas_Done_01_05");	//Теперь, я надеюсь, мы точно сможем узнать, каким образом Гуру удавалось использовать магию рун.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_SendNorolas_Done_01_06");	//Тебя же я хочу поблагодарить за помощь, оказанную Нороласу. Кстати, где он сам?
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_SendNorolas_Done_01_07");	//Он остался в Долине Рудников. Его заинтересовал местный лагерь бывших послушников Братства.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_SendNorolas_Done_01_10");	//Судя по всему, их предводитель не кто иной, как самый настоящий друид.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_SendNorolas_Done_01_11");	//Друид? Хммм... последний раз я о них слышал на материке... это было очень давно.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_SendNorolas_Done_01_12");	//Ну да ладно. Честно говоря, нам сейчас не до этого друида. 
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_SendNorolas_Done_01_13");	//Но за твою самоотверженную помощь я хочу дать тебе несколько ценных свитков и зелий.
	B_GiveInvItemsManyThings(self,other);
	CreateInvItems(other,ItSc_Waterfist,1);
	CreateInvItems(other,ItPo_Perm_Health,1);
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_SendNorolas_Done_01_15");	//Спасибо.
	SaturasReadGuru = TRUE;
	SaturasReadDay = Wld_GetDay();
};

instance DIA_Addon_Saturas_ADW_SwampSecret(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = DIA_Addon_Saturas_ADW_SwampSecret_condition;
	information = DIA_Addon_Saturas_ADW_SwampSecret_info;
	important = TRUE;
};

func int DIA_Addon_Saturas_ADW_SwampSecret_condition()
{
	var int DayNow;

	DayNow = Wld_GetDay();

	if((SaturasReadGuru == TRUE) && (SaturasReadDay < DayNow))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_ADW_SwampSecret_info()
{
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_SwampSecret_01_01");	//Хорошо, что ты здесь, сын мой! Я ждал тебя.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_SwampSecret_01_02");	//Что случилось?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_SwampSecret_01_03");	//Некоторое время назад ты принес мне дневник Ю'Бериона, за что я тебе очень признателен.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_SwampSecret_01_04");	//Но, боюсь, что этого оказалось недостаточно. В нем нет объяснения тому, каким образом Гуру научились использовать магию.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_SwampSecret_01_05");	//Однако, мы уверены, что их магия была дарована им не Спящим!
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_SwampSecret_01_06");	//В своем дневнике Ю'Берион упоминает, что он использовал обычную болотную траву для увеличения своей магической силы.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_SwampSecret_01_07");	//И, остается полагать, что это - единственная зацепка, которая может привести нас к разгадке этой тайны.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_SwampSecret_01_08");	//Поэтому прежде всего нам необходимо узнать немного больше об этом растении. И в этом я очень надеюсь на твою помощь.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_SwampSecret_01_09");	//Само собой, старче, - я постараюсь что-нибудь выяснить для тебя.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_SwampSecret_01_10");	//Благодарю тебя... сынок.
	MIS_SwampSecret = LOG_Running;
	Log_CreateTopic(TOPIC_SwampSecret,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SwampSecret,LOG_Running);
	B_LogEntry(TOPIC_SwampSecret,"Сатурас полагает, что с магией Гуру как-то связана болотная трава. Возможно, мне стоит поспрашивать о ней кого-нибудь из тех, кто намного лучше других разбирается в травах.");
};

instance DIA_Addon_Saturas_ADW_SwampSecret_Done(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = DIA_Addon_Saturas_ADW_SwampSecret_Done_condition;
	information = DIA_Addon_Saturas_ADW_SwampSecret_Done_info;
	permanent = FALSE;
	description = "Я выяснил, откуда гуру черпают свою магическую силу.";
};

func int DIA_Addon_Saturas_ADW_SwampSecret_Done_condition()
{
	if((MIS_SwampSecret == LOG_Running) && (Npc_HasItems(hero,ItWr_StonePower) >= 1) && (StonePower == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_ADW_SwampSecret_Done_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_SwampSecret_Done_01_01");	//Кажется, я выяснил, откуда Гуру черпают свою магическую силу.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_SwampSecret_Done_01_02");	//Расскажи мне все, что тебе удалось узнать.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_SwampSecret_Done_01_03");	//Ты был прав - все дело в болотной траве.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_SwampSecret_Done_01_04");	//Ты это серьезно?
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_SwampSecret_Done_01_05");	//Абсолютно. Каждая травинка несет в себе магическую силу стихии Земли и Скалы. 
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_SwampSecret_Done_01_06");	//Только эта магия разделена между каждым растением, которое произрастает в этом мире.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_SwampSecret_Done_01_07");	//И если человек достаточно силен духом, он может при помощи этой травы изменить свое сознание и научиться использовать магию этой стихии.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_SwampSecret_Done_01_08");	//Невероятно! Я и представить себе не мог ничего подобного. Но как ты узнал об этом?
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_SwampSecret_Done_01_09");	//Я прочитал об этом в одной из древних скрижалей. Вот, - можешь взять ее, кстати.
	B_GiveInvItems(other,self,ItWr_StonePower,1);
	Npc_RemoveInvItems(self,ItWr_StonePower,1);
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_SwampSecret_Done_01_10");	//Как интересно! Надо будет внимательно ее изучить.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_SwampSecret_Done_01_11");	//Тебя же я благодарю за помощь в этом деле. Вот, возьми - тебе еще пригодятся эти свитки.
	B_GiveInvItems(self,other,ItSc_IceWave,2);
	MIS_SwampSecret = LOG_Success;
	Log_SetTopicStatus(TOPIC_SwampSecret,LOG_Success);
	B_LogEntry(TOPIC_SwampSecret,"Я отдал Сатурасу древнюю скрижаль, в которой описывались магические свойства болотной травы. Думаю, в остальном он разберется сам.");
};

instance DIA_Addon_Saturas_ADW_OpenPortal(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = DIA_Addon_Saturas_ADW_OpenPortal_condition;
	information = DIA_Addon_Saturas_ADW_OpenPortal_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Addon_Saturas_ADW_OpenPortal_condition()
{
	if(AdanosPortalOpen == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_ADW_OpenPortal_info()
{
	B_GivePlayerXP(200);
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_OpenPortal_01_01");	//(недоумевающе) Сын мой, что это было?!
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_OpenPortal_01_02");	//Ты о чем?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_OpenPortal_01_03");	//Я говорю о яркой вспышке света, которая озарила небо на севере-востоке долины. 
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_OpenPortal_01_04");	//А после этого пошел настоящий дождь, хотя на небе не было ни единого облака.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_OpenPortal_01_05");	//Думаю, все это из-за магического портала. Я активировал его с помощью древней магии Зодчих.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_OpenPortal_01_06");	//Невероятно! Но что это за портал и куда он ведет?
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_OpenPortal_01_07");	//Я пока не знаю. Но собираюсь в скором времени это выяснить.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_OpenPortal_01_08");	//На твоем месте я был бы крайне осторожен. Возможно, за этим порталом сокрыто то, что нам лучше обходить стороной!
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_OpenPortal_01_10");	//Хотя, полагаю, что мои слова тебя вряд ли остановят.
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_OpenPortal_01_11");	//Ты хорошо меня знаешь.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_OpenPortal_01_12");	//(вздыхая) Ладно. Но помни, последствия могут быть непредсказуемы!
	SaturasKnowPortalOpenDay = Wld_GetDay();
	MIS_LostPower = LOG_Running;
	Log_CreateTopic(TOPIC_LostPower,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LostPower,LOG_Running);
	B_LogEntry(TOPIC_LostPower,"Я рассказал Сатурасу о том, что открыл на северо-востоке долины странный магический портал. Он попросил меня держаться от него подальше, опасаясь того, что может быть сокрыто на другой его стороне. По крайней мере, пока что.");
	AI_StopProcessInfos(self);
};