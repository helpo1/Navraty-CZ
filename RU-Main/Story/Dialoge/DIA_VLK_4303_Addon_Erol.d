
instance DIA_Addon_Erol_EXIT(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 999;
	condition = DIA_Addon_Erol_EXIT_Condition;
	information = DIA_Addon_Erol_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Erol_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Erol_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_ADDON_EROL_NO_TALK(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 1;
	condition = dia_addon_erol_no_talk_condition;
	information = dia_addon_erol_no_talk_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_addon_erol_no_talk_condition()
{
	if((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST) && Npc_IsInState(self,ZS_Talk) && (EROLRECRUITEDDT == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_erol_no_talk_info()
{
	B_Say(self,other,"$SPAREME");
	B_Say(self,other,"$NEVERENTERROOMAGAIN");
	AI_StopProcessInfos(self);
};

instance DIA_Addon_Erol_PICKPOCKET(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 900;
	condition = DIA_Addon_Erol_PICKPOCKET_Condition;
	information = DIA_Addon_Erol_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Erol_PICKPOCKET_Condition()
{
	return C_Beklauen(43,42);
};

func void DIA_Addon_Erol_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Erol_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Erol_PICKPOCKET,Dialog_Back,DIA_Addon_Erol_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Erol_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Erol_PICKPOCKET_DoIt);
};

func void DIA_Addon_Erol_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Erol_PICKPOCKET);
};

func void DIA_Addon_Erol_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Erol_PICKPOCKET);
};


instance DIA_Addon_Erol_Hallo(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = DIA_Addon_Erol_Hallo_Condition;
	information = DIA_Addon_Erol_Hallo_Info;
	description = "В чем дело?";
};


func int DIA_Addon_Erol_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Addon_Erol_Hallo_Info()
{
	AI_Output(other,self,"DIA_Addon_Erol_Hallo_15_00");	//В чем дело?
	AI_Output(self,other,"DIA_Addon_Erol_Hallo_10_01");	//В чем дело?! (в ярости) Ты только посмотри на этот бардак под мостом!
	AI_Output(self,other,"DIA_Addon_Erol_Hallo_10_02");	//Я такого за всю свою жизнь не встречал! Этих тварей нужно перебить всех до единой.
};


instance DIA_Addon_Erol_what(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = DIA_Addon_Erol_what_Condition;
	information = DIA_Addon_Erol_what_Info;
	description = "Что произошло?";
};


func int DIA_Addon_Erol_what_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Erol_Hallo))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Erol_what_Info()
{
	AI_Output(other,self,"DIA_Addon_Erol_what_15_00");	//Что случилось?
	AI_Output(self,other,"DIA_Addon_Erol_what_10_01");	//Я со своими помощниками спокойно ехал по дороге, и вдруг эти подонки выскочили из засады и убили всех моих людей.
	AI_Output(self,other,"DIA_Addon_Erol_what_10_02");	//Хорошо, что я еще не забыл свой коронный хук справа, иначе я тоже был бы мертв.
	Log_CreateTopic(TOPIC_Addon_Erol,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Erol,LOG_Running);
	B_LogEntry(TOPIC_Addon_Erol,"На торговца Эрола напали бандиты. Они забрали все его товары. Эрол хочет, чтобы я вернул похищенные каменные таблички. Бандиты расположились на мосту неподалеку от таверны 'Мертвая Гарпия'.");
	MIS_Addon_Erol_BanditStuff = LOG_Running;
	Info_ClearChoices(DIA_Addon_Erol_what);
	Info_AddChoice(DIA_Addon_Erol_what,"Так это твои вещи лежат под мостом?",DIA_Addon_Erol_what_dein);
	Info_AddChoice(DIA_Addon_Erol_what,"Что за люди на тебя напали?",DIA_Addon_Erol_what_wer);
};

func void DIA_Addon_Erol_what_back()
{
	Info_ClearChoices(DIA_Addon_Erol_what);
};

func void DIA_Addon_Erol_what_dein()
{
	AI_Output(other,self,"DIA_Addon_Erol_what_dein_15_00");	//Так это твои вещи лежат под мостом?
	AI_Output(self,other,"DIA_Addon_Erol_what_dein_10_01");	//Да. Тележка, товары, все остальное.
	if(Npc_HasItems(other,itmi_erolskelch) > 0)
	{
		AI_Output(other,self,"DIA_Addon_Erol_what_dein_Add_15_00");	//Я кое-что оттуда забрал...
		AI_Output(self,other,"DIA_Addon_Erol_what_dein_Add_10_01");	//Можешь оставить эти вещи себе, ценности они не представляют.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Erol_what_dein_Add_10_02");	//Хотя все это особой ценности не представляет.
	};
	AI_Output(self,other,"DIA_Addon_Erol_what_dein_10_02");	//Но бандиты украли у меня нечто действительно ценное. Три каменные таблички.
	Info_AddChoice(DIA_Addon_Erol_what,Dialog_Back,DIA_Addon_Erol_what_back);
	Info_AddChoice(DIA_Addon_Erol_what,"Каменные таблички?",DIA_Addon_Erol_what_Was);
};

func void DIA_Addon_Erol_what_Was()
{
	AI_Output(other,self,"DIA_Addon_Erol_what_Was_15_00");	//Каменные таблички?
	AI_Output(self,other,"DIA_Addon_Erol_what_Was_10_01");	//Да. Их хотел купить у меня городской маг воды. Я обещал ему, что достану их.
	AI_Output(self,other,"DIA_Addon_Erol_what_Was_10_02");	//Я должен любой ценой вернуть их, иначе пострадает моя репутация.
	Info_AddChoice(DIA_Addon_Erol_what,"Где ты берешь эти таблички?",DIA_Addon_Erol_what_woher);
	Info_AddChoice(DIA_Addon_Erol_what,"Зачем таблички нужны магу воды?",DIA_Addon_Erol_what_KDW);
};

func void DIA_Addon_Erol_what_KDW()
{
	AI_Output(other,self,"DIA_Addon_Erol_what_KDW_15_00");	//Зачем таблички нужны магу воды?
	AI_Output(self,other,"DIA_Addon_Erol_what_KDW_10_01");	//Он сказал, что изучает их, и просил привезти как можно больше.
};

func void DIA_Addon_Erol_what_woher()
{
	AI_Output(other,self,"DIA_Addon_Erol_what_woher_15_00");	//Где ты берешь эти таблички?
	AI_Output(self,other,"DIA_Addon_Erol_what_woher_10_01");	//Нахожу их в древних строениях, например, мавзолеях. А иногда их можно найти в пещерах.
	AI_Output(self,other,"DIA_Addon_Erol_what_woher_10_02");	//Я продал магу воды уже целую кучу табличек.
	AI_Output(self,other,"DIA_Addon_Erol_what_woher_10_03");	//Впрочем, здесь они встречаются довольно редко. Чаще всего я нахожу их на северо-востоке Хориниса.
	Info_AddChoice(DIA_Addon_Erol_what,"Почему бы тебе просто не поискать новые таблички?",DIA_Addon_Erol_what_neue);
};

func void DIA_Addon_Erol_what_neue()
{
	AI_Output(other,self,"DIA_Addon_Erol_what_neue_15_00");	//Почему бы тебе просто не поискать новые таблички?
	AI_Output(self,other,"DIA_Addon_Erol_what_neue_10_01");	//Во время схватки с бандитами я вывихнул лодыжку.
	AI_Output(self,other,"DIA_Addon_Erol_what_neue_10_02");	//С хромой ногой я далеко не уйду.
};

func void DIA_Addon_Erol_what_wer()
{
	AI_Output(other,self,"DIA_Addon_Erol_what_wer_15_00");	//Что за люди на тебя напали?
	AI_Output(self,other,"DIA_Addon_Erol_what_wer_10_01");	//Бандиты, кто еще? Они обосновались на мосту.
	AI_Output(self,other,"DIA_Addon_Erol_what_wer_10_02");	//Грабят каждого, кто пытается пройти.
	AI_Output(self,other,"DIA_Addon_Erol_what_wer_10_03");	//Я знал, что у них там засада, так что решил проехать под мостом.
	AI_Output(self,other,"DIA_Addon_Erol_what_wer_10_04");	//Но похоже, моя тележка показалась им слишком соблазнительной.
	AI_Output(self,other,"DIA_Addon_Erol_what_wer_10_05");	//Эти негодяи просто спрыгнули с моста прямо на нас.
	AI_Output(self,other,"DIA_Addon_Erol_what_wer_10_06");	//Надо было попробовать незаметно проехать ночью...
};


instance DIA_Addon_Erol_FernandosWeapons(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = DIA_Addon_Erol_FernandosWeapons_Condition;
	information = DIA_Addon_Erol_FernandosWeapons_Info;
	description = "Ты что-нибудь знаешь о поставках оружия бандитам?";
};


func int DIA_Addon_Erol_FernandosWeapons_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Erol_what) && (MIS_Vatras_FindTheBanditTrader == LOG_Running))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Erol_FernandosWeapons_Info()
{
	AI_Output(other,self,"DIA_Addon_Erol_FernandosWeapons_15_00");	//Ты что-нибудь знаешь о поставках оружия бандитам?
	AI_Output(self,other,"DIA_Addon_Erol_FernandosWeapons_10_01");	//Поставках оружия? Да, кое-что знаю. Какая-то свинья из города продала им столько оружия, что они еле его увезли.
	AI_Output(self,other,"DIA_Addon_Erol_FernandosWeapons_10_02");	//Часть его хранится на мосту у напавших на меня бандитов.
	AI_Output(self,other,"DIA_Addon_Erol_FernandosWeapons_10_03");	//Часть увезли куда-то в сторону фермы Бенгара на верхних пастбищах.
	AI_Output(self,other,"DIA_Addon_Erol_FernandosWeapons_10_04");	//Возможно, бандиты хотели переправить оружие через проход.
	Info_ClearChoices(DIA_Addon_Erol_FernandosWeapons);
	Info_AddChoice(DIA_Addon_Erol_FernandosWeapons,Dialog_Back,DIA_Addon_Erol_FernandosWeapons_back);
	Info_AddChoice(DIA_Addon_Erol_FernandosWeapons,"Где находятся эти верхние пастбища?",DIA_Addon_Erol_FernandosWeapons_bengar);
};

func void DIA_Addon_Erol_FernandosWeapons_bengar()
{
	AI_Output(other,self,"DIA_Addon_Erol_FernandosWeapons_bengar_15_00");	//Где находятся эти верхние пастбища?
	AI_Output(self,other,"DIA_Addon_Erol_FernandosWeapons_bengar_10_01");	//В центральной части Хориниса находится 'Мертвая Гарпия', таверна Орлана.
	AI_Output(self,other,"DIA_Addon_Erol_FernandosWeapons_bengar_10_02");	//От нее на юг ведет дорога. Она проходит через верхние пастбища к проходу в Долину Рудников.
	Info_ClearChoices(DIA_Addon_Erol_FernandosWeapons);
};

func void DIA_Addon_Erol_FernandosWeapons_back()
{
	Info_ClearChoices(DIA_Addon_Erol_FernandosWeapons);
};


instance DIA_Addon_Erol_Stoneplates(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = DIA_Addon_Erol_Stoneplates_Condition;
	information = DIA_Addon_Erol_Stoneplates_Info;
	permanent = TRUE;
	description = "Насчет этих каменных табличек...";
};


func int DIA_Addon_Erol_Stoneplates_Condition()
{
	if(MIS_Addon_Erol_BanditStuff == LOG_Running)
	{
		return TRUE;
	};
	return FALSE;
};


var int StoneplatesCounter;
const int Addon_ErolsStoneplatesOffer = 10;

func void DIA_Addon_Erol_Stoneplates_Info()
{
	var int StoneplatesCount;
	var int XP_Addon_BringStoneplates;
	var int StoneplatesGeld;

	AI_Output(other,self,"DIA_Addon_Erol_Stoneplates_15_00");	//Насчет этих каменных табличек...

	if(Npc_HasItems(other,ItWr_StonePlateCommon_Addon) >= 1)
	{
		StoneplatesCount = Npc_HasItems(other,ItWr_StonePlateCommon_Addon);

		if(StoneplatesCount == 1)
		{
			AI_Output(other,self,"DIA_Addon_Erol_Stoneplates_15_01");	//У меня есть одна такая.
			B_GivePlayerXP(XP_Addon_BringStoneplate);
			B_GiveInvItems(other,self,ItWr_StonePlateCommon_Addon,1);
			Npc_RemoveInvItems(self,ItWr_StonePlateCommon_Addon,Npc_HasItems(self,ItWr_StonePlateCommon_Addon));
			StoneplatesCounter = StoneplatesCounter + 1;
		}
		else
		{
			AI_Output(other,self,"DIA_Addon_Erol_Stoneplates_15_02");	//У меня есть несколько штук.

			if((StoneplatesCount + StoneplatesCounter) >= 3)
			{
				B_GiveInvItems(other,self,ItWr_StonePlateCommon_Addon,3 - StoneplatesCounter);
				Npc_RemoveInvItems(self,ItWr_StonePlateCommon_Addon,Npc_HasItems(self,ItWr_StonePlateCommon_Addon));
				XP_Addon_BringStoneplates = (3 - StoneplatesCounter) * XP_Addon_BringStoneplate;
				StoneplatesCounter = 3;
			}
			else
			{
				B_GiveInvItems(other,self,ItWr_StonePlateCommon_Addon,StoneplatesCount);
				Npc_RemoveInvItems(self,ItWr_StonePlateCommon_Addon,Npc_HasItems(self,ItWr_StonePlateCommon_Addon));
				XP_Addon_BringStoneplates = StoneplatesCount * XP_Addon_BringStoneplate;
				StoneplatesCounter = StoneplatesCounter + StoneplatesCount;
			};

			B_GivePlayerXP(XP_Addon_BringStoneplates);
		};
		AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_03");	//Спасибо тебе.

		if(StoneplatesCounter == 1)
		{
			AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_04");	//Теперь мне не хватает только двух.
		}
		else if(StoneplatesCounter == 2)
		{
			AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_05");	//Теперь мне не хватает только одной.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_06");	//Этого достаточно. Маг воды получит то, что я обещал, и я смогу, наконец, вернуться домой.
			MIS_Addon_Erol_BanditStuff = LOG_SUCCESS;
			Wld_AssignRoomToGuild("grpwaldhuette01",GIL_PUBLIC);
		};

		AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_07");	//Конечно же, я тебе заплачу.
		StoneplatesGeld = Addon_ErolsStoneplatesOffer * Npc_HasItems(self,ItWr_StonePlateCommon_Addon);
		CreateInvItems(self,ItMi_Gold,StoneplatesGeld);
		B_GiveInvItems(self,other,ItMi_Gold,StoneplatesGeld);
		Npc_RemoveInvItems(self,ItWr_StonePlateCommon_Addon,Npc_HasItems(self,ItWr_StonePlateCommon_Addon));

		if(MIS_Addon_Erol_BanditStuff == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_08");	//Я иду домой! Если хочешь, можешь пойти со мной.
			AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_09");	//Когда мы доберемся до моего дома, я смогу продать тебе некоторые вещи.
			AI_StopProcessInfos(self);
			Npc_ExchangeRoutine(self,"Start");
			Wld_AssignRoomToGuild("grpwaldhuette01",GIL_PUBLIC);
		};
	}
	else if(C_ScHasMagicStonePlate() == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Erol_Stoneplates_15_10");	//Эта табличка подойдет?
		AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_11");	//Нет. Она обладает магической силой.
		AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_12");	//Такие таблички маг воды не покупает.
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Erol_Stoneplates_15_13");	//Сколько тебе нужно табличек?
		AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_14");	//Чтобы спасти мою репутацию, мне нужно передать магу воды три таблички.
	};
};


instance DIA_Addon_Erol_Buerger(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = DIA_Addon_Erol_Buerger_Condition;
	information = DIA_Addon_Erol_Buerger_Info;
	description = "Ты живешь в городе?";
};


func int DIA_Addon_Erol_Buerger_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Erol_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Addon_Erol_Buerger_Info()
{
	AI_Output(other,self,"DIA_Addon_Erol_Buerger_15_00");	//Ты живешь в городе?
	AI_Output(self,other,"DIA_Addon_Erol_Buerger_10_01");	//Я не был там уже много лет, приятель. Меня ничего не удерживает среди этих глупых и жадных свиней, живущих в верхнем квартале.
	AI_Output(self,other,"DIA_Addon_Erol_Buerger_10_02");	//В свое время я был довольно влиятельным горожанином, но это было давно.

	if((MEMBERTRADEGUILD == FALSE) && (MIS_TRADEGUILD != LOG_FAILED) && (NIGELTELLABOUTGUILD == FALSE) && (EROLTELLABOUTGUILD == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Erol_Buerger_10_03");	//Ты и тогда занимался торговлей?!
		AI_Output(self,other,"DIA_Addon_Erol_Buerger_10_04");	//Не просто занимался, а был одним из самым крупных торговцев в городе!
		AI_Output(self,other,"DIA_Addon_Erol_Buerger_10_05");	//А кроме этого, я еще и возглавлял торговую гильдию Хориниса.
		AI_Output(other,self,"DIA_Addon_Erol_Buerger_10_06");	//Торговую гильдию?!
		AI_Output(self,other,"DIA_Addon_Erol_Buerger_10_07");	//Ты что, с луны свалился?!...(удивленно)
		AI_Output(self,other,"DIA_Addon_Erol_Buerger_10_09");	//Хммм...(удивленно) Очень странно!
		AI_Output(self,other,"DIA_Addon_Erol_Buerger_10_10");	//Честно говоря, я еще не встречал людей, которые не слышали об этом!
		AI_Output(self,other,"DIA_Addon_Erol_Buerger_10_11");	//Хотя возможно, сейчас гильдия старается не особо офишировать свой статус.
		AI_Output(self,other,"DIA_Addon_Erol_Buerger_10_12");	//Это и понятно - время нынче неспокойное. Округа просто кишит разного рода бандитами и прочей мразью!
		AI_Output(self,other,"DIA_Addon_Erol_Buerger_10_13");	//Да и сам видишь - занятие торговлей стало очень опасным делом.
		AI_Output(self,other,"DIA_Addon_Erol_Buerger_10_14");	//А вот раньше торговая гильдия Хориниса была одной из самых влиятельных гильдий во всей Миртане!
		AI_Output(self,other,"DIA_Addon_Erol_Buerger_10_15");	//Состоять в ней - было особой честью и удостаивались ее не многие.
		AI_Output(self,other,"DIA_Addon_Erol_Buerger_10_16");	//Э-эх!...(печально)
		EROLTELLABOUTGUILD = TRUE;
	};
};


instance DIA_ADDON_EROL_TRADEGUILD(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = dia_addon_erol_tradeguild_condition;
	information = dia_addon_erol_tradeguild_info;
	permanent = FALSE;
	description = "Я тоже хочу вступить в торговую гильдию.";
};


func int dia_addon_erol_tradeguild_condition()
{
	if((EROLTELLABOUTGUILD == TRUE) && (MEMBERTRADEGUILD == FALSE) && (MIS_TRADEGUILD != LOG_FAILED) && (NIGELTELLABOUTGUILD == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_erol_tradeguild_info()
{
	AI_Output(other,self,"DIA_Addon_Erol_TradeGuild_01_00");	//Я тоже хочу вступить в торговую гильдию. Ты можешь мне в этом помочь?
	AI_Output(self,other,"DIA_Addon_Erol_TradeGuild_01_02");	//Хммм...(задумчиво) я вообще-то уже давно отошел от дел.
	AI_Output(self,other,"DIA_Addon_Erol_TradeGuild_01_03");	//Хотя, несмотря на это, у меня все-таки остались некоторые связи в гильдии.
	AI_Output(other,self,"DIA_Addon_Erol_TradeGuild_01_04");	//Значит, тебе не составит труда мне помочь?
	AI_Output(self,other,"DIA_Addon_Erol_TradeGuild_01_05");	//Ну, хорошо...

	if(MIS_Addon_Erol_BanditStuff != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Erol_Teach_10_01");	//Но ты окажешь мне одну услугу.
		AI_Output(self,other,"DIA_Addon_Erol_Teach_10_02");	//Помоги мне спасти мою репутацию! Принеси мне каменные таблички для мага воды.
		AI_Output(self,other,"DIA_Addon_Erol_TradeGuild_01_06");	//Тогда я помогу тебе вступить в гильдию торговцев.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Erol_TradeGuild_01_07");	//Тем более что ты оказал мне неоценимую услугу, вернув мои таблички.
		AI_Output(self,other,"DIA_Addon_Erol_TradeGuild_01_08");	//А долг, как известно, платежом красен!
		AI_Output(other,self,"DIA_Addon_Erol_TradeGuild_01_09");	//Что мне надо делать?
		AI_Output(self,other,"DIA_Addon_Erol_TradeGuild_01_10");	//Тебе - ровным счетом ничего...(смеется) Я сам обо всем позабочусь.
		AI_Output(self,other,"DIA_Addon_Erol_TradeGuild_01_11");	//Напишу для тебя рекомендательное письмо для одного моего друга.
		AI_Output(self,other,"DIA_Addon_Erol_TradeGuild_01_13");	//Он очень влиятельное лицо в городе, и кроме того - нынешний мастер гильдии торговцев.
		AI_Output(self,other,"DIA_Addon_Erol_TradeGuild_01_14");	//Просто так он тебя и слушать не станет, а с моим письмом - другое дело!
		AI_Output(other,self,"DIA_Addon_Erol_TradeGuild_01_15");	//И что я ему скажу?
		AI_Output(self,other,"DIA_Addon_Erol_TradeGuild_01_16");	//Ничего особенного тебе говорить не надо. Он сам все прочтет в этом письме.
		AI_Output(self,other,"DIA_Addon_Erol_TradeGuild_01_17");	//И уж поверь, я напишу так, что у него не будет ни одной причины не принять тебя в гильдию.
		AI_Output(other,self,"DIA_Addon_Erol_TradeGuild_01_20");	//Ну хорошо. Тогда пиши свое письмо.
		B_UseFakeScroll();
		AI_Output(self,other,"DIA_Addon_Erol_TradeGuild_01_21");	//Вот, возьми его и отнеси господину Лютеро.
		B_GiveInvItems(self,other,itwr_erolletter,1);
		AI_Output(other,self,"DIA_Addon_Erol_TradeGuild_01_22");	//Лютеро?
		AI_Output(self,other,"DIA_Addon_Erol_TradeGuild_01_23");	//Да, ты наверняка уже знаком с ним, и тебе не составит труда найти его.
		AI_Output(other,self,"DIA_Addon_Erol_TradeGuild_01_25");	//Хорошо.
		EROLGIVERECOMENDATION = TRUE;
	};
};


instance DIA_ADDON_EROL_TRADEGUILDHOW(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = dia_addon_erol_tradeguildhow_condition;
	information = dia_addon_erol_tradeguildhow_info;
	permanent = TRUE;
	description = "По поводу торговой гильдии...";
};


func int dia_addon_erol_tradeguildhow_condition()
{
	if(Npc_KnowsInfo(hero,dia_addon_erol_tradeguild) && (EROLTELLABOUTGUILD == TRUE) && (EROLGIVERECOMENDATION == FALSE) && (MEMBERTRADEGUILD == FALSE) && (MIS_TRADEGUILD != LOG_FAILED) && (NIGELTELLABOUTGUILD == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_erol_tradeguildhow_info()
{
	AI_Output(other,self,"DIA_Addon_Erol_TradeGuildHow_01_00");	//По поводу торговой гильдии...
	if(MIS_Addon_Erol_BanditStuff != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Erol_TradeGuildHow_01_01");	//Я же сказал тебе - сначала верни мне мои дощечки!
		AI_Output(self,other,"DIA_Addon_Erol_TradeGuildHow_01_02");	//А уже потом мы поговорим о твоей просьбе.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Erol_TradeGuildHow_01_03");	//Хорошо. Ты помог мне, а я помогу тебе.
		AI_Output(other,self,"DIA_Addon_Erol_TradeGuildHow_01_04");	//Что мне надо делать?
		AI_Output(self,other,"DIA_Addon_Erol_TradeGuildHow_01_05");	//Тебе - ровным счетом ничего...(смеется) Я сам обо всем позабочусь.
		AI_Output(self,other,"DIA_Addon_Erol_TradeGuildHow_01_06");	//Напишу для тебя рекомендательное письмо для одного моего друга.
		AI_Output(self,other,"DIA_Addon_Erol_TradeGuildHow_01_08");	//Он очень влиятельное лицо в городе, и кроме того - нынешний мастер гильдии торговцев.
		AI_Output(self,other,"DIA_Addon_Erol_TradeGuildHow_01_09");	//Просто так он тебя и слушать не станет, а с моим письмом - другое дело.
		AI_Output(other,self,"DIA_Addon_Erol_TradeGuildHow_01_10");	//И что я ему скажу?
		AI_Output(self,other,"DIA_Addon_Erol_TradeGuildHow_01_11");	//Ничего особенного тебе говорить не надо. Он сам все прочтет в этом письме.
		AI_Output(self,other,"DIA_Addon_Erol_TradeGuildHow_01_12");	//И уж поверь, я напишу так, что у него не будет ни одной причины не принять тебя в гильдию.
		AI_Output(other,self,"DIA_Addon_Erol_TradeGuildHow_01_15");	//Ну хорошо. Тогда пиши свое письмо.
		B_UseFakeScroll();
		AI_Output(self,other,"DIA_Addon_Erol_TradeGuildHow_01_16");	//Вот, возьми его и отнеси господину Лютеро.
		B_GiveInvItems(self,other,itwr_erolletter,1);
		AI_Output(other,self,"DIA_Addon_Erol_TradeGuildHow_01_17");	//Лютеро?
		AI_Output(self,other,"DIA_Addon_Erol_TradeGuildHow_01_18");	//Да, ты наверняка уже знаком с ним, и тебе не составит труда найти его.
		AI_Output(other,self,"DIA_Addon_Erol_TradeGuildHow_01_20");	//Хорошо.
		EROLGIVERECOMENDATION = TRUE;
	};
};


instance DIA_Addon_Erol_PreTeach(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = DIA_Addon_Erol_PreTeach_Condition;
	information = DIA_Addon_Erol_PreTeach_Info;
	description = "Ты смог отбиться от бандитов?";
};


func int DIA_Addon_Erol_PreTeach_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Erol_what))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Erol_PreTeach_Info()
{
	AI_Output(other,self,"DIA_Addon_Erol_PreTeach_15_00");	//Ты смог отбиться от бандитов?
	AI_Output(self,other,"DIA_Addon_Erol_PreTeach_10_01");	//Да. Но они все еще сидят на мосту.
	AI_Output(other,self,"DIA_Addon_Erol_PreTeach_15_02");	//Ты можешь научить меня такому удару?
	AI_Output(self,other,"DIA_Addon_Erol_PreTeach_10_03");	//Конечно.
	Erol_Addon_TeachPlayer = TRUE;
	Log_CreateTopic(Topic_OutTeacher,LOG_NOTE);
	B_LogEntry(Topic_OutTeacher,LogText_Addon_Erol_Teach);
};


instance DIA_Addon_Erol_PreTrade(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 100;
	condition = DIA_Addon_Erol_PreTrade_Condition;
	information = DIA_Addon_Erol_PreTrade_Info;
	permanent = TRUE;
	description = "Покажи мне свои товары.";
};


func int DIA_Addon_Erol_PreTrade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Erol_what) && (Npc_GetDistToWP(self,"NW_BIGFARM_HUT_IN_01") > 2000) && (ErolRECRUITEDDT == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Erol_PreTrade_Info()
{
	AI_Output(other,self,"DIA_Elena_TRADE_15_00");	//Покажи мне свои товары.
	AI_Output(self,other,"DIA_Addon_Erol_PreTrade_10_00");	//Я ничего не могу тебе продать. Все мои вещи остались под мостом.
	AI_Output(self,other,"DIA_Addon_Erol_PreTrade_10_01");	//Что-то у меня купить ты сможешь только тогда, когда я доберусь до дома.

	if(MIS_Addon_Erol_BanditStuff != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Erol_PreTrade_10_02");	//Но я не могу вернуться, пока не достану таблички для мага.
	};
};


instance DIA_Addon_Erol_SLD(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = DIA_Addon_Erol_SLD_Condition;
	information = DIA_Addon_Erol_SLD_Info;
	description = "Это и есть твой дом?";
};


func int DIA_Addon_Erol_SLD_Condition()
{
	if(Npc_GetDistToWP(self,"NW_BIGFARM_HUT_IN_01") < 2000)
	{
		return TRUE;
	};
};


var int Erol_IsAtHome;

func void DIA_Addon_Erol_SLD_Info()
{
	AI_Output(other,self,"DIA_Addon_Erol_SLD_15_00");	//(удивленно) Это и есть твой дом?
	AI_Output(self,other,"DIA_Addon_Erol_SLD_10_01");	//Да. А что? Что-нибудь не так?
	AI_Output(other,self,"DIA_Addon_Erol_SLD_15_02");	//У тебя нет проблем с наемниками?
	AI_Output(self,other,"DIA_Addon_Erol_SLD_10_03");	//Пока я не сую нос в их дела, они меня не трогают.
	AI_Output(self,other,"DIA_Addon_Erol_SLD_10_04");	//К тому же, они неплохие покупатели. И я плачу им, чтобы они охраняли мой дом, пока я в отъезде.
	B_GivePlayerXP(XP_Ambient);

	if(Erol_IsAtHome == FALSE)
	{
		Npc_ExchangeRoutine(self,"HOME");
		Erol_IsAtHome = TRUE;
	};
};

var int ErolGiveMat;

instance DIA_Addon_Erol_Trade(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 100;
	condition = DIA_Addon_Erol_Trade_Condition;
	information = DIA_Addon_Erol_Trade_Info;
	trade = TRUE;
	permanent = TRUE;
	description = "Покажи мне свои товары.";
};

func int DIA_Addon_Erol_Trade_Condition()
{
	if((MIS_Addon_Erol_BanditStuff == LOG_SUCCESS) && Wld_IsTime(8,0,22,0) && ((Npc_GetDistToWP(self,"NW_BIGFARM_HUT_IN_01") < 3000) || (ErolRECRUITEDDT == TRUE)))
	{
		return TRUE;
	};
};

var int DIA_Addon_Erol_Trade_OneTime;

func void DIA_Addon_Erol_Trade_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	B_Say(other,self,"$TRADE_2");
	AI_Output(self,other,"DIA_Addon_Erol_Trade_10_00");	//Впрочем, выбора у меня нет.

	if((MIS_ROBAMATERIAL == LOG_Running) && (ErolGiveMat == FALSE))
	{
		CreateInvItems(self,itmi_novmaterial,1);
		ErolGiveMat = TRUE;
	};
	if(Erol_IsAtHome == FALSE)
	{
		Log_CreateTopic(Topic_OutTrader,LOG_NOTE);
		B_LogEntry(Topic_OutTrader,LogText_Addon_ErolTrade);
		Npc_ExchangeRoutine(self,"Home");
		Erol_IsAtHome = TRUE;
	};

	B_GiveTradeInv(self);
};


instance DIA_Addon_Erol_Teach(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 99;
	condition = DIA_Addon_Erol_Teach_Condition;
	information = DIA_Addon_Erol_Teach_Info;
	permanent = TRUE;
	description = "Покажи мне, как сделать удар сильнее.";
};


func int DIA_Addon_Erol_Teach_Condition()
{
	if(Erol_Addon_TeachPlayer == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Erol_Teach_Info()
{
	AI_Output(other,self,"DIA_Addon_Erol_Teach_15_00");	//Покажи мне, как сделать удар сильнее.
	if(MIS_Addon_Erol_BanditStuff != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Erol_Teach_10_01");	//Хорошо, но ты окажешь мне одну услугу.
		AI_Output(self,other,"DIA_Addon_Erol_Teach_10_02");	//Помоги мне сохранить мою репутацию и верни мои дощечки.
		AI_Output(self,other,"DIA_Addon_Erol_Teach_10_03");	//Тогда я покажу тебе, как увеличить твою силу в бою.
	}
	else if(Erol_Bonus == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Erol_Teach_Add_10_00");	//Хорошо. Смотри внимательно. Есть один простой прием.
		AI_Output(self,other,"DIA_Addon_Erol_Teach_Add_10_01");	//Когда ты наносишь удар, используй не силу руки, а силу всего тела.
		AI_Output(self,other,"DIA_Addon_Erol_Teach_Add_10_02");	//В одно и то же время ты должен развернуть бедро, вынести вперед плечо и распрямить руку.
		AI_Output(self,other,"DIA_Addon_Erol_Teach_Add_10_03");	//(смеется) Если ты нанесешь удар правильно, ты это поймешь!
		B_RaiseAttribute_Bonus(other,ATR_STRENGTH,1);
		Erol_Bonus = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Erol_Teach_Add_10_04");	//Если ты хочешь добиться большего, ты должен упорно тренироваться...
		Info_ClearChoices(DIA_Addon_Erol_Teach);
		Info_AddChoice(DIA_Addon_Erol_Teach,Dialog_Back,DIA_Addon_Erol_Teach_Back);
		Info_AddChoice(DIA_Addon_Erol_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Addon_Erol_Teach_STR_1);
		Info_AddChoice(DIA_Addon_Erol_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Addon_Erol_Teach_STR_5);
	};
};

func void DIA_Addon_Erol_Teach_Back()
{
	Info_ClearChoices(DIA_Addon_Erol_Teach);
};

func void DIA_Addon_Erol_Teach_STR_1()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_MAX);
	Info_ClearChoices(DIA_Addon_Erol_Teach);
	Info_AddChoice(DIA_Addon_Erol_Teach,Dialog_Back,DIA_Addon_Erol_Teach_Back);
	Info_AddChoice(DIA_Addon_Erol_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Addon_Erol_Teach_STR_1);
	Info_AddChoice(DIA_Addon_Erol_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Addon_Erol_Teach_STR_5);
};

func void DIA_Addon_Erol_Teach_STR_5()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_MAX);
	Info_ClearChoices(DIA_Addon_Erol_Teach);
	Info_AddChoice(DIA_Addon_Erol_Teach,Dialog_Back,DIA_Addon_Erol_Teach_Back);
	Info_AddChoice(DIA_Addon_Erol_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Addon_Erol_Teach_STR_1);
	Info_AddChoice(DIA_Addon_Erol_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Addon_Erol_Teach_STR_5);
};

instance DIA_ADDON_EROL_LURKER(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 10;
	condition = dia_addon_erol_lurker_condition;
	information = dia_addon_erol_lurker_info;
	permanent = TRUE;
	description = "Как дела?";
};

func int dia_addon_erol_lurker_condition()
{
	if((MIS_Addon_Erol_BanditStuff == LOG_SUCCESS) && (Npc_GetDistToWP(self,"NW_BIGFARM_HUT_IN_01") < 3000))
	{
		return TRUE;
	};
};

func void dia_addon_erol_lurker_info()
{
	AI_Output(other,self,"DIA_VLK_4303_Addon_Erol_Lurker_01_00");	//Как дела?

	if((Kapitel >= 1) && (MIS_RABOGLAV == FALSE) && (MIS_Addon_Erol_BanditStuff == LOG_SUCCESS) && (Npc_GetDistToWP(self,"NW_BIGFARM_HUT_IN_01") < 3000))
	{
		AI_Output(self,other,"DIA_VLK_4303_Addon_Erol_Lurker_01_01");	//(зло) Дерьмово! Вон, посмотри на мой дом - я еле-еле привел его в порядок. 
		AI_Output(other,self,"DIA_VLK_4303_Addon_Erol_Lurker_01_02");	//А что с ним было не так?
		AI_Output(self,other,"DIA_VLK_4303_Addon_Erol_Lurker_01_03");	//Представляешь, какая-то подлая тварь устроила в нем погром! Всю мебель к чертям изломала!
		AI_Output(self,other,"DIA_VLK_4303_Addon_Erol_Lurker_01_04");	//Даже сундук расколола пополам и сожрала все его содержимое.
		AI_Output(self,other,"DIA_VLK_4303_Addon_Erol_Lurker_01_05");	//А он ведь работы Торбена! 
		AI_Output(self,other,"DIA_VLK_4303_Addon_Erol_Lurker_01_06");	//Все стены, весь пол тиной с грязью облепила! Тухлой рыбой несло вообще от всего! Вонь стояла, что аж до сих пор глаза режет!
		AI_Output(other,self,"DIA_VLK_4303_Addon_Erol_Lurker_01_07");	//А на что тебе тогда эти два амбала с топорами, что трутся рядом с твоей хижиной?
		AI_Output(self,other,"DIA_VLK_4303_Addon_Erol_Lurker_01_08");	//Они говорят, что никого не видели... болваны чертовы!
		AI_Output(self,other,"DIA_VLK_4303_Addon_Erol_Lurker_01_09");	//И потом еще смеют деньги у меня клянчить. Гоблинский хвост им в..., а не золото!
		AI_Output(self,other,"DIA_VLK_4303_Addon_Erol_Lurker_01_10");	//Готов поспорить: нажрались шнапсу как обычно и завалились спать, боровы проклятые! 
		AI_Output(self,other,"DIA_VLK_4303_Addon_Erol_Lurker_01_11");	//Кстати, мне до сих пор кажется, что эта тварь где-то рядом шастает. 
		AI_Output(self,other,"DIA_VLK_4303_Addon_Erol_Lurker_01_12");	//Сам бы ее прихлопнул, но после той истории с бандитами у меня что-то сильно нога разболелась.
		AI_Output(self,other,"DIA_VLK_4303_Addon_Erol_Lurker_01_13");	//Подсобишь? Прикончи эту гадину, а я уж за ценой не постою!
		AI_Output(other,self,"DIA_VLK_4303_Addon_Erol_Lurker_01_14");	//Ладно! Если она вдруг попадется мне на глаза, так уж и быть - убью ее для тебя.
		AI_Output(self,other,"DIA_VLK_4303_Addon_Erol_Lurker_01_15");	//Хорошо! Только обязательно принеси ее когти, они, должно быть, редчайшей прочности. Похоже, ими, в основном, тут и орудовала эта гадюка!
		AI_Output(self,other,"DIA_VLK_4303_Addon_Erol_Lurker_01_16");	//Это же надо так было... Сундук и пополам! (смех) Кошмар!
		Wld_InsertNpc(lurker_uniq,"NW_LAKE_GREG_TREASURE_01");
		MIS_RABOGLAV = LOG_Running;
		Log_CreateTopic(TOPIC_RABOGLAV,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_RABOGLAV,LOG_Running);
		B_LogEntry(TOPIC_RABOGLAV,"Эрол рассказал мне о нападении на его дом. Он думает, что это сделала какая-то тварь, воняющая тухлой рыбой. Я согласился разобраться с этой тварью, надо только не забыть срезать с нее трофей.");
	}
	else if(Kapitel == 3)
	{
		AI_Output(self,other,"DIA_VLK_4303_Addon_Erol_Lurker_01_17");	//От этих парней в черных рясах у меня прямо мурашки по коже.
		AI_Output(self,other,"DIA_VLK_4303_Addon_Erol_Lurker_01_18");	//Ходят постоянно тут, что-то вынюхивают...(нервно) Не нравится мне все это!
	}
	else
	{
		AI_Output(self,other,"DIA_VLK_4303_Addon_Erol_Lurker_01_19");	//Пока все нормально.
		AI_Output(self,other,"DIA_VLK_4303_Addon_Erol_Lurker_01_20");	//Если что-то вдруг произойдет, я дам тебе знать.
	};
};

instance DIA_VLK_4303_ADDON_EROL_RABOGLAV(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 1;
	condition = dia_vlk_4303_addon_erol_raboglav_condition;
	information = dia_vlk_4303_addon_erol_raboglav_info;
	permanent = FALSE;
	description = "С той твоей тварью покончено!";
};

func int dia_vlk_4303_addon_erol_raboglav_condition()
{
	if((MIS_RABOGLAV == LOG_Running) && Npc_IsDead(lurker_uniq) && (Npc_HasItems(other,ITAT_LEADERLURKER) >= 1))
	{
		return TRUE;
	};
};

func void dia_vlk_4303_addon_erol_raboglav_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_VLK_4303_Addon_Erol_RABOGLAV_01_00");	//С той тварью покончено! Ею оказался огромный шныг.
	AI_Output(other,self,"DIA_VLK_4303_Addon_Erol_RABOGLAV_01_01");	//А вот и его когти. В общем, все как ты просил.
	B_GiveInvItems(other,self,ITAT_LEADERLURKER,1);
	Npc_RemoveInvItems(self,ITAT_LEADERLURKER,1);

	if(Trophy_LURKERLEADER == TRUE)
	{
		Ext_RemoveFromSlot(other,"BIP01 PELVIS");
		Npc_RemoveInvItems(other,ItUt_LURKERLEADER,Npc_HasItems(other,ItUt_LURKERLEADER));
		Trophy_LURKERLEADER = FALSE;
	};

	AI_Output(self,other,"DIA_VLK_4303_Addon_Erol_RABOGLAV_01_02");	//Ого! Такими можно и голову с одного удара снести!
	AI_Output(self,other,"DIA_VLK_4303_Addon_Erol_RABOGLAV_01_03");	//Небось, пришлось повозиться с ней... с ним?
	AI_Output(other,self,"DIA_VLK_4303_Addon_Erol_RABOGLAV_01_04");	//Да, пришлось немного поднапрячься. Но, надеюсь, что я не зря надрывался.
	AI_Output(self,other,"DIA_VLK_4303_Addon_Erol_RABOGLAV_01_05");	//Конечно нет. Вот, как я и обещал, держи свое вознаграждение.
	B_GiveInvItems(self,other,ItMi_Gold,300);
	AI_Output(self,other,"DIA_VLK_4303_Addon_Erol_RABOGLAV_01_06");	//Не золотые горы, но хватит, я думаю. Сам понимаешь, времена сейчас тяжелые! 
	AI_Output(other,self,"DIA_VLK_4303_Addon_Erol_RABOGLAV_01_07");	//Вполне хватит. Ну, бывай!
	MIS_RABOGLAV = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_RABOGLAV,LOG_SUCCESS);
	B_LogEntry(TOPIC_RABOGLAV,"Эрол был очень удивлен, когда увидел размер когтей насолившего ему шныга.");
};


//--------------------CEO----------------------------------------------

instance DIA_ADDON_EROL_RECRDT(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = dia_addon_erol_recrdt_condition;
	information = dia_addon_erol_recrdt_info;
	permanent = FALSE;
	description = "Как торговля?";
};

func int dia_addon_erol_recrdt_condition()
{
	if((MIS_PPL_FOR_TOWER == LOG_Running) && (PasswordSet == TRUE) && (Erol_IsAtHome == TRUE) && (VALERANRECRUITEDDT == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_erol_recrdt_info()
{
	AI_Output(other,self,"DIA_Addon_Erol_RecrDT_15_00");	//Как торговля?
	AI_Output(self,other,"DIA_Addon_Erol_RecrDT_10_01");	//Здравствуй. Да не очень.
	AI_Output(self,other,"DIA_Addon_Erol_RecrDT_10_02");	//Стар я уже ходить туда-сюда с телегами, полными товаров. Да и на дорогах сейчас стало опасней.
	AI_Output(self,other,"DIA_Addon_Erol_RecrDT_10_03");	//Тут бандиты, там монстры, теперь еще эти жутковатые личности в темных плащах взад-вперед шатаются.
	AI_Output(self,other,"DIA_Addon_Erol_RecrDT_10_04");	//Уйти бы на покой, но ведь тогда я помру со скуки.
	AI_Output(other,self,"DIA_Addon_Erol_RecrDT_15_05");	//А ты не хотел бы немного сменить сферу своей деятельности?
	AI_Output(self,other,"DIA_Addon_Erol_RecrDT_10_06");	//Что ты имеешь в виду?
	AI_Output(other,self,"DIA_Addon_Erol_RecrDT_15_07");	//То, что, возможно, у меня есть для тебя работа.
	AI_Output(other,self,"DIA_Addon_Erol_RecrDT_15_08");	//Так получилось, что я теперь владею башней рядом с фермой Онара, в которой собираюсь организовать небольшой лагерь. И я остро нуждаюсь в опытном и хватком управляющем.
	AI_Output(self,other,"DIA_Addon_Erol_RecrDT_10_09");	//Предлагаешь это место мне? Хммм, интересное предложение, но сходу и не дашь ответа.
	AI_Output(self,other,"DIA_Addon_Erol_RecrDT_10_10");	//Понимаешь, я больше торговец. Я хорошо умею втюхивать товары разной паршивости и считать деньги, но большого опыта руководства людьми у меня нет.
	AI_Output(other,self,"DIA_Addon_Erol_RecrDT_15_11");	//С людьми я разберусь сам.
	AI_Output(other,self,"DIA_Addon_Erol_RecrDT_15_12");	//Тебе же, если ты согласишься, нужно будет как раз заниматься деньгами и хозяйством: следить за выплатами, за запасами, за имуществом. Контактировать с поставщиками и уговаривать их сотрудничать на выгодных нам условиях.
	AI_Output(self,other,"DIA_Addon_Erol_RecrDT_10_13");	//Это радует. А что насчет жилья? Я правильно понимаю, что мне придется бросить свой дом и переехать к тебе?
	AI_Output(other,self,"DIA_Addon_Erol_RecrDT_15_14");	//Все верно. Жить тебе придется у меня. Еда тоже за мой счет.
	AI_Output(self,other,"DIA_Addon_Erol_RecrDT_10_15");	//Переезд - это очень серьезное решение... Мне определенно нужно подумать. Приходи завтра, и я дам тебе ответ!
	EROLDECISIONDAY = Wld_GetDay();
};

instance DIA_ADDON_EROL_AGREES_RECRDT(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = dia_addon_erol_agrees_recrdt_condition;
	information = dia_addon_erol_agrees_recrdt_info;
	permanent = FALSE;
	description = "Что насчет моего предложения?";
};

func int dia_addon_erol_agrees_recrdt_condition()
{
	if(Npc_KnowsInfo(hero,dia_addon_erol_recrdt) && (EROLDECISIONDAY < Wld_GetDay()) && (VALERANRECRUITEDDT == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_erol_agrees_recrdt_info()
{
	AI_Output(other,self,"DIA_Addon_Erol_Agrees_RecrDT_15_00");	//Что насчет моего предложения?
	AI_Output(self,other,"DIA_Addon_Erol_Agrees_RecrDT_10_01");	//(Удивленно) Какого еще предложения?
	AI_Output(self,other,"DIA_Addon_Erol_Agrees_RecrDT_10_02");	//Да шучу я, шучу. В общем, я подумал и понял, что для меня это сейчас самый лучший вариант.
	AI_Output(self,other,"DIA_Addon_Erol_Agrees_RecrDT_10_03");	//Кроме того, я никогда не прочь попробовать себя в чем-то новом.
	AI_Output(self,other,"DIA_Addon_Erol_Agrees_RecrDT_10_04");	//Иными словами, я согласен!
	AI_Output(other,self,"DIA_Addon_Erol_Agrees_RecrDT_15_05");	//Блеск! В таком случае собирай вещи и топай в башню, я буду ждать тебя там. И да, чуть не забыл: сколько ты хочешь за свои услуги?
	AI_Output(self,other,"DIA_Addon_Erol_Agrees_RecrDT_10_06");	//Ну, учитывая, что жилье и еда на тебе, сорока золотых в день будет достаточно.
	AI_Output(self,other,"DIA_Addon_Erol_Agrees_RecrDT_10_07");	//Сбережения у меня и так есть, до трактирных пьянок я уже в силу возраста не охоч, а больше здесь деньги тратить и не на что.
	Info_ClearChoices(dia_addon_erol_agrees_recrdt);
	Info_AddChoice(dia_addon_erol_agrees_recrdt,"Отлично. Тогда увидимся в башне.",dia_addon_erol_agrees_recrdt_yes);
	Info_AddChoice(dia_addon_erol_agrees_recrdt,"Сорок золотых? Теперь мне надо подумать...",dia_addon_erol_agrees_recrdt_no);
};

func void dia_addon_erol_agrees_recrdt_yes()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Addon_Erol_Agrees_RecrDT_yes_15_00");	//Отлично. Тогда увидимся в башне. Если у тебя на входе спросят пароль, то им являются 'Драконовы сокровища'.
	AI_Output(self,other,"DIA_Addon_Erol_Agrees_RecrDT_yes_10_01");	//Хорошо, что это лишь пароль, а не размер вступительного взноса. До встречи!
	B_LogEntry(TOPIC_PPL_FOR_TOWER,"Эрол согласился работать моим управляющим.");
	self.npcType = NPCTYPE_FRIEND;
	self.aivar[AIV_ToughGuy] = TRUE;
	self.aivar[AIV_IGNORE_Theft] = TRUE;
	self.aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	self.aivar[AIV_IgnoresArmor] = TRUE;
	EROLRECRUITEDDT = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"TowerCEO");
};

func void dia_addon_erol_agrees_recrdt_no()
{
	AI_Output(other,self,"DIA_Addon_Erol_Agrees_RecrDT_no_15_00");	//Сорок золотых? Извини, мне надо подумать...
	AI_StopProcessInfos(self);
};

instance DIA_ADDON_EROL_ATLAST_RECRDT(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = dia_addon_erol_atlast_recrdt_condition;
	information = dia_addon_erol_atlast_recrdt_info;
	permanent = FALSE;
	description = "Ты принят!";
};

func int dia_addon_erol_atlast_recrdt_condition()
{
	if(Npc_KnowsInfo(hero,dia_addon_erol_agrees_recrdt) && (VALERANRECRUITEDDT == FALSE) && (EROLRECRUITEDDT == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_erol_atlast_recrdt_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_Addon_Erol_Atlast_RecrDT_15_00");	//Ты принят! Если у тебя на входе спросят пароль, то им являются 'Драконовы сокровища'.
	AI_Output(self,other,"DIA_Addon_Erol_Atlast_RecrDT_10_01");	//Не слишком умно делать паролем то, о чем грезит и болтает без умолку каждый второй лодырь, возомнивший себя искателем приключений и не желающий работать. Но не мое дело, - увидимся!
	B_LogEntry(TOPIC_PPL_FOR_TOWER,"Эрол согласился работать моим управляющим.");
	self.npcType = NPCTYPE_FRIEND;
	self.aivar[AIV_ToughGuy] = TRUE;
	self.aivar[AIV_IGNORE_Theft] = TRUE;
	self.aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	self.aivar[AIV_IgnoresArmor] = TRUE;
	EROLRECRUITEDDT = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"TowerCEO");
};

instance DIA_EROL_FIRSTCEO(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = dia_erol_firstceo_condition;
	information = dia_erol_firstceo_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_erol_firstceo_condition()
{
	if((EROLRECRUITEDDT == TRUE) && (Npc_GetDistToWP(self,"NW_CASTLEMINE_HUT_10") < 5000))
	{
		return TRUE;
	};
};

func void dia_erol_firstceo_info()
{
	AI_Output(self,other,"DIA_Erol_FirstCEO_10_00");	//Нет, - я, конечно, ожидал, что здесь не все будет в порядке, но чтобы настолько...
	AI_Output(self,other,"DIA_Erol_FirstCEO_10_01");	//Кровь, пыль, мусор, мебель вся в трещинах. Ну да ладно, с этим разберемся. Теперь к делу.
	AI_Output(self,other,"DIA_Erol_FirstCEO_10_02");	//Ты упоминал, что хочешь устроить здесь что-то вроде лагеря. Я правильно помню?
	AI_Output(other,self,"DIA_Erol_FirstCEO_15_03");	//Да. Лорд Хаген хочет, чтобы я навел порядок в данной области, именно на этих условиях мне была передана башня.
	AI_Output(other,self,"DIA_Erol_FirstCEO_15_04");	//На тех же условиях я договорился с Онаром, чтобы он не препятствовал моему проживанию здесь.
	AI_Output(other,self,"DIA_Erol_FirstCEO_15_05");	//Но так как в одиночку поддерживать эту башню и защищать ее я не могу, мне нужны будут люди. С первыми двумя ты, думаю, уже познакомился.
	AI_Output(self,other,"DIA_Erol_FirstCEO_10_06");	//Мне нравятся твои планы. Пожалуй, даже будет интересно вернуть этому месту цивилизованный вид.
	AI_Output(self,other,"DIA_Erol_FirstCEO_10_07");	//Ну, что ж, прежде всего, тебе надобно оставить мне некоторую сумму денег, из которой я мог бы осуществлять необходимые выплаты.
	AI_Output(other,self,"DIA_Erol_FirstCEO_15_08");	//Сколько?
	AI_Output(self,other,"DIA_Erol_FirstCEO_10_09");	//Пять тысяч золотых, не меньше.
	CEONEEDSFIRSTMONEY = TRUE;
};

instance DIA_EROL_FIRSTCEO_MONEYLATE(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = dia_erol_firstceo_moneylate_condition;
	information = dia_erol_firstceo_moneylate_info;
	permanent = FALSE;
	description = "Вот пять тысяч золотых.";
};

func int dia_erol_firstceo_moneylate_condition()
{
	if((CEONEEDSFIRSTMONEY == TRUE) && (Npc_HasItems(other,ItMi_Gold) >= 5000) && (EROLRECRUITEDDT == TRUE))
	{
		return TRUE;
	};
};

func void dia_erol_firstceo_moneylate_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Erol_FirstCEO_MoneyLate_15_00");	//Вот пять тысяч золотых.
	B_GiveInvItems(other,self,ItMi_Gold,5000);
	Npc_RemoveInvItems(self,ItMi_Gold,5000);
	AI_Output(self,other,"DIA_Erol_FirstCEO_MoneyLate_10_01");	//Отлично! Значит, с деньгами мы на данный момент разобрались, и я немедленно могу начать вести дела.
	AI_Output(self,other,"DIA_Erol_FirstCEO_MoneyLate_10_02");	//Однако, кроме этого, мне и остальным людям необходимо чем-то питаться.
	AI_Output(self,other,"DIA_Erol_FirstCEO_MoneyLate_10_03");	//Думаю, для начала тебе нужно оставить нам хотя бы пятьдесят кусков жареного мяса, двадцать пять рыбин и десять батонов хлеба.
	DT_BUDGET = 5000;
	DT_BUDGETACTIVE = TRUE;
	EVERYDAYDTMONEY = Wld_GetDay();
	CEONEEDSFIRSTMONEY = FALSE;
	CEONEEDSFIRSTFOOD = TRUE;
	B_LogEntry(TOPIC_PPL_FOR_TOWER,"Для проживающих у меня людей нужны начальные запасы еды,а точнее пятьдесят кусков жареного мяса, двадцать пять рыб и десять батонов хлеба.");
};

instance DIA_EROL_FIRSTCEO_FOODLATE(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = dia_erol_firstceo_foodlate_condition;
	information = dia_erol_firstceo_foodlate_info;
	permanent = FALSE;
	description = "Вот вся необходимая еда.";
};

func int dia_erol_firstceo_foodlate_condition()
{
	if((CEONEEDSFIRSTFOOD == TRUE) && (Npc_HasItems(other,ItFo_Bread) >= 10) && (Npc_HasItems(other,ItFoMutton) >= 50) && (Npc_HasItems(other,ItFo_Fish) >= 25) && (EROLRECRUITEDDT == TRUE))
	{
		return TRUE;
	};
};

func void dia_erol_firstceo_foodlate_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Erol_FirstCEO_FoodLate_15_00");	//Вот вся необходимая еда.
	B_GiveInvItems(other,self,ItFoMutton,50);
	Npc_RemoveInvItems(self,ItFoMutton,50);
	B_GiveInvItems(other,self,ItFo_Fish,25);
	Npc_RemoveInvItems(self,ItFo_Fish,25);
	B_GiveInvItems(other,self,ItFo_Bread,10);
	Npc_RemoveInvItems(self,ItFo_Bread,10);
	AI_Output(self,other,"DIA_Erol_FirstCEO_FoodLate_10_01");	//Превосходно! Теперь у меня имеется достаточно денег и запасов еды, чтобы я мог вести хозяйство, не испытывая затруднений.
	AI_Output(self,other,"DIA_Erol_FirstCEO_FoodLate_10_02");	//Но этого хватит лишь на время. Ты же не хочешь, чтобы содержание этой башни разорило тебя?
	AI_Output(other,self,"DIA_Erol_FirstCEO_FoodLate_15_03");	//Разумеется, нет. Что мне необходимо сделать, чтобы этого избежать?
	AI_Output(self,other,"DIA_Erol_FirstCEO_FoodLate_10_04");	//Найди людей, которые согласятся работать на тебя.  	
	AI_Output(self,other,"DIA_Erol_FirstCEO_FoodLate_10_05");	//К примеру, найди охотников, которые будут предоставлять мясо для наших запасов.
	AI_Output(self,other,"DIA_Erol_FirstCEO_FoodLate_10_06");	//Также здесь рядом есть шахта, возможно, в ней еще осталась руда. Тебе стоит это проверить.
	AI_Output(self,other,"DIA_Erol_FirstCEO_FoodLate_10_07");	//Одним словом, думай. Ты больше путешествуешь, чем я, и тебе проще найти людей, готовых присоединиться к тебе.
	AI_Output(other,self,"DIA_Erol_FirstCEO_FoodLate_15_08");	//Хорошо... Думаю, у меня есть несколько человек на примете.
	AI_Output(self,other,"DIA_Erol_FirstCEO_FoodLate_10_09");	//Удачи в поисках. И да, помни, что организация поставок еды и денежных средств на тебе, и что большинство людей питаются 3 раза в день.
	AI_Output(self,other,"DIA_Erol_FirstCEO_FoodLate_10_10");	//Я не могу этим заниматься, поскольку это требует длительного отлучения из башни, и тогда я уже не смогу выполнять свои прямые обязанности - следить за хозяйством и порядком здесь.
	AI_Output(self,other,"DIA_Erol_FirstCEO_FoodLate_10_11");	//Ты не можешь допустить, чтобы в башне закончились деньги или еда.
	B_LogEntry(TOPIC_PPL_FOR_TOWER,"Теперь, когда у меня есть управляющий, я могу подумать о расширении и о поиске людей, готовых работать на меня. При этом я должен помнить, что им надо будет платить деньги и предоставлять трехразовое питание.");
	DT_FOODSTOCK = 120;
	DT_FOODSTOCKACTIVE = TRUE;
	EVERYDAYDTFOOD = Wld_GetDay();
	CEONEEDSFIRSTFOOD = FALSE;
	HURRAYICANHIRE = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_Erol_CanHireCook(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = DIA_Erol_CanHireCook_condition;
	information = DIA_Erol_CanHireCook_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Erol_CanHireCook_condition()
{
	if((ErolRECRUITEDDT == TRUE) && (CanHireCook == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Erol_CanHireCook_info()
{
	AI_Output(self,other,"DIA_Erol_CanHireCook_10_00");	//В лагере начались первые поставки продовольствия. Это хорошие новости!
	AI_Output(self,other,"DIA_Erol_CanHireCook_10_01");	//Однако, встает вопрос по части его хранения. Ведь без должного ухода часть еды просто напросто испортится.
	AI_Output(other,self,"DIA_Erol_CanHireCook_10_02");	//И что ты предлагаешь?
	AI_Output(self,other,"DIA_Erol_CanHireCook_10_03");	//На мой взгляд, лагерю не помешал бы хороший повар, которой смог бы взять решение этой проблемы в свои руки.
	AI_Output(self,other,"DIA_Erol_CanHireCook_10_04");	//Подумай над этим! Это очень важно.
	AI_Output(other,self,"DIA_Erol_CanHireCook_10_05");	//Хорошо, я что-нибудь придумаю.
	EddaNeed = TRUE;
	B_LogEntry(TOPIC_PPL_FOR_TOWER,"В лагере необходим повар, который будет заниматься вопросами хранения еды. Интересно, с кем мне стоит поговорить?");
	AI_StopProcessInfos(self);
};

instance DIA_Erol_CanHireSmith(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = DIA_Erol_CanHireSmith_condition;
	information = DIA_Erol_CanHireSmith_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Erol_CanHireSmith_condition()
{
	if((ErolRECRUITEDDT == TRUE) && (CanHireSmith == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Erol_CanHireSmith_info()
{
	AI_Output(self,other,"DIA_Erol_CanHireSmith_10_00");	//В лагере началась добыча руды.
	AI_Output(self,other,"DIA_Erol_CanHireSmith_10_01");	//Настало время подумать о том, чтобы обзавестись хорошим кузнецом. Тем более, что сама кузня, как видишь, у нас есть.
	AI_Output(other,self,"DIA_Erol_CanHireSmith_10_02");	//И где же я тебе его найду? Хороших кузнецов не так уж и много на этом острове.
	AI_Output(self,other,"DIA_Erol_CanHireSmith_10_03");	//Согласен. Но если ты хочешь, чтобы твой лагерь по-настоящему вырос и окреп, то тебе придется его найти.
	AI_Output(self,other,"DIA_Erol_CanHireSmith_10_04");	//Починить оружие, залатать доспех, возможно, что-то изготовить на продажу из добываемой нами руды, сможет только кузнец.
	AI_Output(self,other,"DIA_Erol_CanHireSmith_10_05");	//Так что лучше поднапряги извилины и подумай, кто бы мог занять это место.
	AI_Output(other,self,"DIA_Erol_CanHireSmith_10_06");	//Ладно, я что-нибудь придумаю.
	CarlNeed = TRUE;
	B_LogEntry(TOPIC_PPL_FOR_TOWER,"Лагерю нужен кузнец. Без этого он не сможет по-настоящему развиваться.");
	AI_StopProcessInfos(self);
};

instance DIA_Erol_CanHireHealer(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = DIA_Erol_CanHireHealer_condition;
	information = DIA_Erol_CanHireHealer_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Erol_CanHireHealer_condition()
{
	var int DayNow;

	DayNow = Wld_GetDay();

	if((ErolRECRUITEDDT == TRUE) && (SagittaIsDead == FALSE) && ((WOLFRECRUITEDDT == TRUE) || (ALRIKRECRUITEDDT == TRUE) || (GAYVERNRECRUITEDDT == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Erol_CanHireHealer_info()
{
	AI_Output(self,other,"DIA_Erol_CanHireHealer_10_00");	//Последние дни в лагере прибавилось охраны.
	AI_Output(self,other,"DIA_Erol_CanHireHealer_10_01");	//Это хорошо, поскольку недавно мы подверглись нападению нескольких хищных тварей.
	AI_Output(self,other,"DIA_Erol_CanHireHealer_10_02");	//Одному из охранников прилично досталось в той схватке, но к счастью для него рана оказалась не слишком серьезной.
	AI_Output(self,other,"DIA_Erol_CanHireHealer_10_03");	//Однако, если так и дальше пойдет, то вскоре мы тут потеряем всех людей.
	AI_Output(other,self,"DIA_Erol_CanHireHealer_10_04");	//На что ты намекаешь?
	AI_Output(self,other,"DIA_Erol_CanHireHealer_10_05");	//Нам нужен целитель. А лучше всего - алхимик, способный варить целебные эликсиры на такие случаи.
	AI_Output(other,self,"DIA_Erol_CanHireHealer_10_06");	//М-да... С этим еще сложнее, чем с кузнецом.
	AI_Output(self,other,"DIA_Erol_CanHireHealer_10_07");	//Я понимаю, что это непростая задача. Но от ее решения зависят судьбы людей, живущих в лагере.
	AI_Output(self,other,"DIA_Erol_CanHireHealer_10_08");	//Поэтому тебе придется с этим что-то сделать.
	AI_Output(other,self,"DIA_Erol_CanHireHealer_10_09");	//Хорошо, я поищу нам лекаря.
	SagittaNeed = TRUE;
	B_LogEntry(TOPIC_PPL_FOR_TOWER,"Лагерю нужен целитель. Без этого люди долго тут не протянут.");
	AI_StopProcessInfos(self);
};

instance DIA_Erol_CanProduceSmith(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = DIA_Erol_CanProduceSmith_condition;
	information = DIA_Erol_CanProduceSmith_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Erol_CanProduceSmith_condition()
{
	var int DayNow;

	DayNow = Wld_GetDay();

	if((ErolRECRUITEDDT == TRUE) && (CARLRECRUITEDDT == TRUE) && (CarlDayHire < DayNow) && (CarlIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Erol_CanProduceSmith_info()
{
	AI_Output(self,other,"DIA_Erol_CanProduceSmith_10_00");	//Карл начал работать в кузнице. Я рад, что у тебя получилось уговорить его присоединиться к нам.
	AI_Output(self,other,"DIA_Erol_CanProduceSmith_10_01");	//Но теперь стоит подумать о главном.
	AI_Output(other,self,"DIA_Erol_CanProduceSmith_10_02");	//Что ты имеешь в виду?
	AI_Output(self,other,"DIA_Erol_CanProduceSmith_10_03");	//Кузня должна приносить доход, иначе толку от нее будет мало.
	AI_Output(other,self,"DIA_Erol_CanProduceSmith_10_04");	//Хорошо. Какие будут предложения?
	AI_Output(self,other,"DIA_Erol_CanProduceSmith_10_05");	//Мы могли бы использовать наши запасы руды для ее дальнейшей переработки в стальные заготовки.
	AI_Output(self,other,"DIA_Erol_CanProduceSmith_10_06");	//Это довольно ходовой товар в нынешнее время, и его продажа позволит нам существенно сократить денежные расходы лагеря.
	AI_Output(other,self,"DIA_Erol_CanProduceSmith_10_07");	//Звучит неплохо.
	AI_Output(self,other,"DIA_Erol_CanProduceSmith_10_08");	//Мне тоже нравится. Так что подумай над этим.
	CanSellOre = TRUE;
	B_LogEntry(TOPIC_PPL_FOR_TOWER,"Эрол предложил использовать запасы руды для изготовления стальных заготовок, которые впоследствии можно будет продать. Это обеспечит лагерь дополнительным доходом.");
	AI_StopProcessInfos(self);
};

instance DIA_Erol_CanProduceWeapon(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = DIA_Erol_CanProduceWeapon_condition;
	information = DIA_Erol_CanProduceWeapon_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Erol_CanProduceWeapon_condition()
{
	var int DayNow;

	DayNow = Wld_GetDay();

	if((ErolRECRUITEDDT == TRUE) && (WOLFRECRUITEDDT == TRUE) && (ALRIKRECRUITEDDT == TRUE) && (GAYVERNRECRUITEDDT == TRUE) && (CARLRECRUITEDDT == TRUE) && (CarlDayHire < DayNow) && (CarlIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Erol_CanProduceWeapon_info()
{
	AI_Output(self,other,"DIA_Erol_CanProduceWeapon_10_01");	//В последнее время в лагере прибавилось людей. Думаю, нам стоит получше вооружить нашу охрану.
	AI_Output(self,other,"DIA_Erol_CanProduceWeapon_10_02");	//Тем более, времена сейчас неспокойные, кругом бродят раличные хищные твари.
	AI_Output(self,other,"DIA_Erol_CanProduceWeapon_10_03");	//Кто-то недавно даже видел неподалеку отсюда настоящего живого орка!
	AI_Output(self,other,"DIA_Erol_CanProduceWeapon_10_04");	//Если мы не позаботимся о нашей безопасности, это место станет легкой добычей для бандитов или для тех же орков.
	AI_Output(other,self,"DIA_Erol_CanProduceWeapon_10_05");	//Что мы можем сделать?
	AI_Output(self,other,"DIA_Erol_CanProduceWeapon_10_06");	//Оружием нас обеспечит Карл. Он, конечно, не мастер-кузнец, но сковать добротный меч вполне сможет.
	AI_Output(self,other,"DIA_Erol_CanProduceWeapon_10_07");	//Но нашим бойцам нужны доспехи получше. Те, что сейчас на них, не спасут даже от укуса обычного кровяного шершня.
	AI_Output(other,self,"DIA_Erol_CanProduceWeapon_10_08");	//И что ты предлагаешь?
	AI_Output(self,other,"DIA_Erol_CanProduceWeapon_10_13");	//Естественно, было бы лучше, если бы мы смогли производить свои собственные доспехи. Но для этого нам потребуются чертежи и схемы их изготовления.
	AI_Output(self,other,"DIA_Erol_CanProduceWeapon_10_14");	//Уверен, ты бываешь в разных местах, и, возможно, тебе уже попадалось на глаза нечто подобное.
	AI_Output(self,other,"DIA_Erol_CanProduceWeapon_10_15");	//Если что, приноси их мне. И я позабочусь о том, чтобы наши парни больше не ходили в лохмотьях.
	CanGiveArmor = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_EROL_CrawlerArmor(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = DIA_EROL_CrawlerArmor_condition;
	information = DIA_EROL_CrawlerArmor_info;
	permanent = FALSE;
	description = "Я принес чертежи доспехов.";
};

func int DIA_EROL_CrawlerArmor_condition()
{
	if((ErolRECRUITEDDT == TRUE) && (CanGiveArmor == TRUE) && (GiveNewArmorDocs == FALSE) && (Npc_HasItems(other,ItWr_ArmorDocs) >= 1))
	{
		return TRUE;
	};
};

func void DIA_EROL_CrawlerArmor_info()
{
	B_GivePlayerXP(1500);
	AI_Output(other,self,"DIA_EROL_CrawlerArmor_15_00");	//Я принес чертежи доспехов.
	B_GiveInvItems(other,self,ItWr_ArmorDocs,1);
	Npc_RemoveInvItems(self,ItWr_ArmorDocs,1);
	AI_Output(self,other,"DIA_EROL_CrawlerArmor_15_01");	//Хорошо! Давай их сюда. Я отдам эти чертежи Карлу, чтобы тот разобрался с ними.
	AI_Output(self,other,"DIA_EROL_CrawlerArmor_15_02");	//Если по ним и вправду можно будет изготовить доспехи, то через пару дней все наши ребята уже будут щеголять в них.
	AI_Output(other,self,"DIA_EROL_CrawlerArmor_15_03");	//Очень надеюсь на это.
	GiveNewArmorDocs = Wld_GetDay();
	CanGiveArmorDocs = TRUE;
};

instance DIA_EROL_ArmorDone(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 5;
	condition = DIA_EROL_ArmorDone_condition;
	information = DIA_EROL_ArmorDone_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_EROL_ArmorDone_condition()
{
	if((ErolRECRUITEDDT == TRUE) && (CanGiveOtherArmor == TRUE))
	{
		return TRUE;
	};
};

func void DIA_EROL_ArmorDone_info()
{
	B_GivePlayerXP(200);
	AI_Output(self,other,"DIA_EROL_ArmorDone_15_00");	//Карл закончил изготовление доспехов, и я сразу же раздал их нашим парням.
	AI_Output(self,other,"DIA_EROL_ArmorDone_15_01");	//Теперь об их снаряжении можно не волноваться. Да и сами доспехи на вид очень прочные.
	AI_Output(self,other,"DIA_EROL_ArmorDone_15_02");	//Вот, держи! Этот экземпляр я оставил специально для тебя. Вдруг они и тебе пригодятся.
	B_GiveInvItems(self,other,ItAr_OldSteelArmor,1);
	AI_Output(other,self,"DIA_EROL_ArmorDone_15_03");	//Благодарю.
};

instance DIA_Erol_BUSINESSACTION(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 21;
	condition = dia_Erol_businessaction_condition;
	information = dia_Erol_businessaction_info;
	permanent = TRUE;
	description = "Мне бы хотелось кое-что сделать...";
};

func int dia_Erol_businessaction_condition()
{
	if((HURRAYICANHIRE == TRUE) && (ErolRECRUITEDDT == TRUE))
	{
		return TRUE;
	};
};

func void dia_Erol_businessaction_info()
{
	AI_Output(other,self,"DIA_Erol_BusinessAction_15_00");	//Мне бы хотелось кое-что сделать.
	AI_Output(self,other,"DIA_Erol_BusinessAction_10_01");	//Что именно?	
	Info_ClearChoices(dia_Erol_businessaction);
	Info_AddChoice(dia_Erol_businessaction,Dialog_Back,dia_Erol_businessaction_back);
	Info_AddChoice(dia_Erol_businessaction,"Забрать деньги из казны лагеря.",dia_Erol_businessaction_budgettake);
	Info_AddChoice(dia_Erol_businessaction,"Внести деньги в казну лагеря.",dia_Erol_businessaction_budgetgive);
	Info_AddChoice(dia_Erol_businessaction,"Продать запасы еды со склада в лагере.",dia_Erol_businessaction_foodsell);
	Info_AddChoice(dia_Erol_businessaction,"Оставить припасы еды на складе в лагере.",dia_Erol_businessaction_foodgive);
	Info_AddChoice(DIA_Erol_businessaction,"Забрать магическую руду со склада в лагере.",DIA_Erol_businessaction_oretake);
	Info_AddChoice(DIA_Erol_businessaction,"Забрать железную руду со склада в лагере.",DIA_Erol_businessaction_irontake);

	if(CanSellOre == TRUE)
	{
		if(DoSellOre == FALSE)
		{
			Info_AddChoice(DIA_Erol_businessaction,"Начать производство стальных заготовок.",DIA_Erol_businessaction_produce_on);
		}
		else
		{
			Info_AddChoice(DIA_Erol_businessaction,"Остановить производство стальных заготовок.",DIA_Erol_businessaction_produce_off);
		};
	};
};

func void dia_Erol_businessaction_oretake()
{
	AI_Output(other,self,"dia_Erol_businessaction_oretake_15_00");	//Я бы хотел забрать магическую руду со склада в лагере.

	if(DT_BUDGET_ORE == FALSE)
	{
		AI_Output(self,other,"dia_Erol_businessaction_oretake_10_01");	//К сожалению, у нас сейчас нет лишних запасов руды.
	}
	else
	{
		AI_Output(self,other,"dia_Erol_businessaction_oretake_10_02");	//Хорошо. Вот тут вся магическая руда, что у нас есть!
		B_GiveInvItems(self,other,ItMi_Nugget,DT_BUDGET_ORE);
		DT_BUDGET_ORE = 0;
	};

	Info_ClearChoices(dia_Erol_businessaction);
	Info_AddChoice(dia_Erol_businessaction,Dialog_Back,dia_Erol_businessaction_back);
	Info_AddChoice(dia_Erol_businessaction,"Забрать деньги из казны лагеря.",dia_Erol_businessaction_budgettake);
	Info_AddChoice(dia_Erol_businessaction,"Внести деньги в казну лагеря.",dia_Erol_businessaction_budgetgive);
	Info_AddChoice(dia_Erol_businessaction,"Продать запасы еды со склада в лагере.",dia_Erol_businessaction_foodsell);
	Info_AddChoice(dia_Erol_businessaction,"Оставить припасы еды на складе в лагере.",dia_Erol_businessaction_foodgive);
	Info_AddChoice(DIA_Erol_businessaction,"Забрать магическую руду со склада в лагере.",DIA_Erol_businessaction_oretake);
	Info_AddChoice(DIA_Erol_businessaction,"Забрать железную руду со склада в лагере.",DIA_Erol_businessaction_irontake);

	if(CanSellOre == TRUE)
	{
		if(DoSellOre == FALSE)
		{
			Info_AddChoice(DIA_Erol_businessaction,"Начать производство стальных заготовок.",DIA_Erol_businessaction_produce_on);
		}
		else
		{
			Info_AddChoice(DIA_Erol_businessaction,"Остановить производство стальных заготовок.",DIA_Erol_businessaction_produce_off);
		};
	};
};

func void dia_Erol_businessaction_irontake()
{
	AI_Output(other,self,"dia_Erol_businessaction_irontake_15_00");	//Я бы хотел забрать железную руду со склада в лагере.

	if(DT_BUDGET_IRON == FALSE)
	{
		AI_Output(self,other,"dia_Erol_businessaction_irontake_10_01");	//К сожалению, у нас сейчас нет лишних запасов руды.
	}
	else
	{
		AI_Output(self,other,"dia_Erol_businessaction_irontake_10_02");	//Хорошо. Вот тут вся железная руда, что у нас есть!
		B_GiveInvItems(self,other,ItMi_SNugget,DT_BUDGET_IRON);
		DT_BUDGET_IRON = 0;
	};

	Info_ClearChoices(dia_Erol_businessaction);
	Info_AddChoice(dia_Erol_businessaction,Dialog_Back,dia_Erol_businessaction_back);
	Info_AddChoice(dia_Erol_businessaction,"Забрать деньги из казны лагеря.",dia_Erol_businessaction_budgettake);
	Info_AddChoice(dia_Erol_businessaction,"Внести деньги в казну лагеря.",dia_Erol_businessaction_budgetgive);
	Info_AddChoice(dia_Erol_businessaction,"Продать запасы еды со склада в лагере.",dia_Erol_businessaction_foodsell);
	Info_AddChoice(dia_Erol_businessaction,"Оставить припасы еды на складе в лагере.",dia_Erol_businessaction_foodgive);
	Info_AddChoice(DIA_Erol_businessaction,"Забрать магическую руду со склада в лагере.",DIA_Erol_businessaction_oretake);
	Info_AddChoice(DIA_Erol_businessaction,"Забрать железную руду со склада в лагере.",DIA_Erol_businessaction_irontake);

	if(CanSellOre == TRUE)
	{
		if(DoSellOre == FALSE)
		{
			Info_AddChoice(DIA_Erol_businessaction,"Начать производство стальных заготовок.",DIA_Erol_businessaction_produce_on);
		}
		else
		{
			Info_AddChoice(DIA_Erol_businessaction,"Остановить производство стальных заготовок.",DIA_Erol_businessaction_produce_off);
		};
	};
};


func void dia_Erol_businessaction_produce_on()
{
	DoSellOre = TRUE;
	Info_ClearChoices(dia_Erol_businessaction);
	Info_AddChoice(dia_Erol_businessaction,Dialog_Back,dia_Erol_businessaction_back);
	Info_AddChoice(dia_Erol_businessaction,"Забрать деньги из казны лагеря.",dia_Erol_businessaction_budgettake);
	Info_AddChoice(dia_Erol_businessaction,"Внести деньги в казну лагеря.",dia_Erol_businessaction_budgetgive);
	Info_AddChoice(dia_Erol_businessaction,"Продать запасы еды со склада в лагере.",dia_Erol_businessaction_foodsell);
	Info_AddChoice(dia_Erol_businessaction,"Оставить припасы еды на складе в лагере.",dia_Erol_businessaction_foodgive);
	Info_AddChoice(DIA_Erol_businessaction,"Забрать магическую руду со склада в лагере.",DIA_Erol_businessaction_oretake);
	Info_AddChoice(DIA_Erol_businessaction,"Забрать железную руду со склада в лагере.",DIA_Erol_businessaction_irontake);

	if(CanSellOre == TRUE)
	{
		if(DoSellOre == FALSE)
		{
			Info_AddChoice(DIA_Erol_businessaction,"Начать производство стальных заготовок.",DIA_Erol_businessaction_produce_on);
		}
		else
		{
			Info_AddChoice(DIA_Erol_businessaction,"Остановить производство стальных заготовок.",DIA_Erol_businessaction_produce_off);
		};
	};
};

func void dia_Erol_businessaction_produce_off()
{
	DoSellOre = FALSE;
	Info_ClearChoices(dia_Erol_businessaction);
	Info_AddChoice(dia_Erol_businessaction,Dialog_Back,dia_Erol_businessaction_back);
	Info_AddChoice(dia_Erol_businessaction,"Забрать деньги из казны лагеря.",dia_Erol_businessaction_budgettake);
	Info_AddChoice(dia_Erol_businessaction,"Внести деньги в казну лагеря.",dia_Erol_businessaction_budgetgive);
	Info_AddChoice(dia_Erol_businessaction,"Продать запасы еды со склада в лагере.",dia_Erol_businessaction_foodsell);
	Info_AddChoice(dia_Erol_businessaction,"Оставить припасы еды на складе в лагере.",dia_Erol_businessaction_foodgive);
	Info_AddChoice(DIA_Erol_businessaction,"Забрать магическую руду со склада в лагере.",DIA_Erol_businessaction_oretake);
	Info_AddChoice(DIA_Erol_businessaction,"Забрать железную руду со склада в лагере.",DIA_Erol_businessaction_irontake);

	if(CanSellOre == TRUE)
	{
		if(DoSellOre == FALSE)
		{
			Info_AddChoice(DIA_Erol_businessaction,"Начать производство стальных заготовок.",DIA_Erol_businessaction_produce_on);
		}
		else
		{
			Info_AddChoice(DIA_Erol_businessaction,"Остановить производство стальных заготовок.",DIA_Erol_businessaction_produce_off);
		};
	};
};

func void dia_Erol_businessaction_back()
{
	Info_ClearChoices(dia_Erol_businessaction);
};

func void dia_Erol_businessaction_budgetgive()
{
	AI_Output(other,self,"DIA_Erol_BusinessAction_BudgetGive_15_00");	//Я бы хотел внести деньги в казну лагеря.
	AI_Output(self,other,"DIA_Erol_BusinessAction_BudgetGive_10_01");	//О какой сумме идет речь?
	Info_ClearChoices(dia_Erol_businessaction);

	if(Npc_HasItems(other,ItMi_Gold) >= 500)
	{
		Info_AddChoice(dia_Erol_businessaction,"Пять сотен золотых монет.",dia_Erol_businessaction_budgetgive_small);
	};
	if(Npc_HasItems(other,ItMi_Gold) >= 1500)
	{
		Info_AddChoice(dia_Erol_businessaction,"Полторы тысячи золотых монет.",dia_Erol_businessaction_budgetgive_medium);
	};
	if(Npc_HasItems(other,ItMi_Gold) >= 2500)
	{
		Info_AddChoice(dia_Erol_businessaction,"Две с половиной тысячи золотых монет.",dia_Erol_businessaction_budgetgive_huge);
	};

	Info_AddChoice(dia_Erol_businessaction,Dialog_Back,dia_Erol_businessaction_back);
};

func void dia_Erol_businessaction_budgetgive_small()
{
	AI_Output(other,self,"DIA_Erol_BusinessAction_BudgetGive_Small_15_00");	//Пять сотен золотых монет.
	B_GiveInvItems(other,self,ItMi_Gold,500);
	DT_BUDGET = DT_BUDGET + 500;
	Npc_RemoveInvItems(self,ItMi_Gold,500);
	Info_ClearChoices(dia_Erol_businessaction);

	if(Npc_HasItems(other,ItMi_Gold) >= 500)
	{
		Info_AddChoice(dia_Erol_businessaction,"Пять сотен золотых монет.",dia_Erol_businessaction_budgetgive_small);
	};
	if(Npc_HasItems(other,ItMi_Gold) >= 1500)
	{
		Info_AddChoice(dia_Erol_businessaction,"Полторы тысячи золотых монет.",dia_Erol_businessaction_budgetgive_medium);
	};
	if(Npc_HasItems(other,ItMi_Gold) >= 2500)
	{
		Info_AddChoice(dia_Erol_businessaction,"Две с половиной тысячи золотых монет.",dia_Erol_businessaction_budgetgive_huge);
	};

	Info_AddChoice(dia_Erol_businessaction,Dialog_Back,dia_Erol_businessaction_back);
};

func void dia_Erol_businessaction_budgetgive_medium()
{
	AI_Output(other,self,"DIA_Erol_BusinessAction_BudgetGive_Medium_15_00");	//Полторы тысячи золотых монет.
	B_GiveInvItems(other,self,ItMi_Gold,1500);
	DT_BUDGET = DT_BUDGET + 1500;
	Npc_RemoveInvItems(self,ItMi_Gold,1500);
	Info_ClearChoices(dia_Erol_businessaction);

	if(Npc_HasItems(other,ItMi_Gold) >= 500)
	{
		Info_AddChoice(dia_Erol_businessaction,"Пять сотен золотых монет.",dia_Erol_businessaction_budgetgive_small);
	};
	if(Npc_HasItems(other,ItMi_Gold) >= 1500)
	{
		Info_AddChoice(dia_Erol_businessaction,"Полторы тысячи золотых монет.",dia_Erol_businessaction_budgetgive_medium);
	};
	if(Npc_HasItems(other,ItMi_Gold) >= 2500)
	{
		Info_AddChoice(dia_Erol_businessaction,"Две с половиной тысячи золотых монет.",dia_Erol_businessaction_budgetgive_huge);
	};

	Info_AddChoice(dia_Erol_businessaction,Dialog_Back,dia_Erol_businessaction_back);
};

func void dia_Erol_businessaction_budgetgive_huge()
{
	AI_Output(other,self,"DIA_Erol_BusinessAction_BudgetGive_Huge_15_00");	//Две с половиной тысячи золотых монет.
	B_GiveInvItems(other,self,ItMi_Gold,2500);
	DT_BUDGET = DT_BUDGET + 2500;
	Npc_RemoveInvItems(self,ItMi_Gold,2500);
	Info_ClearChoices(dia_Erol_businessaction);

	if(Npc_HasItems(other,ItMi_Gold) >= 500)
	{
		Info_AddChoice(dia_Erol_businessaction,"Пять сотен золотых монет.",dia_Erol_businessaction_budgetgive_small);
	};
	if(Npc_HasItems(other,ItMi_Gold) >= 1500)
	{
		Info_AddChoice(dia_Erol_businessaction,"Полторы тысячи золотых монет.",dia_Erol_businessaction_budgetgive_medium);
	};
	if(Npc_HasItems(other,ItMi_Gold) >= 2500)
	{
		Info_AddChoice(dia_Erol_businessaction,"Две с половиной тысячи золотых монет.",dia_Erol_businessaction_budgetgive_huge);
	};

	Info_AddChoice(dia_Erol_businessaction,Dialog_Back,dia_Erol_businessaction_back);
};

func void dia_Erol_businessaction_budgettake()
{
	AI_Output(other,self,"DIA_Erol_BusinessAction_BudgetTake_15_00");	//Я бы хотел забрать деньги из казны лагеря.

	if(DT_BUDGET <= 5000)
	{
		AI_Output(self,other,"DIA_Erol_BusinessAction_BudgetTake_10_01");	//К сожалению, сейчас я не могу выдать тебе деньги, поскольку у меня на руках имеются лишь минимальные средства, необходимые для надежного функционирования лагеря.
		Info_ClearChoices(dia_Erol_businessaction);
	}
	else
	{
		AI_Output(self,other,"DIA_Erol_BusinessAction_BudgetTake_10_02");	//Сколько конкретно?
		Info_ClearChoices(dia_Erol_businessaction);

		if(DT_BUDGET > 5000)
		{
			Info_AddChoice(dia_Erol_businessaction,"Пять сотен золотых монет.",dia_Erol_businessaction_budgettake_small);
		};
		if(DT_BUDGET >= 6000)
		{
			Info_AddChoice(dia_Erol_businessaction,"Полторы тысячи золотых монет.",dia_Erol_businessaction_budgettake_medium);
		};
		if(DT_BUDGET >= 7000)
		{
			Info_AddChoice(dia_Erol_businessaction,"Две с половиной тысячи золотых монет.",dia_Erol_businessaction_budgettake_huge);
		};

		Info_AddChoice(dia_Erol_businessaction,Dialog_Back,dia_Erol_businessaction_back);
	};
};

func void dia_Erol_businessaction_budgettake_small()
{
	AI_Output(other,self,"DIA_Erol_BusinessAction_BudgetTake_Small_15_00");	//Пять сотен золотых монет.
	B_GiveInvItems(self,other,ItMi_Gold,500);
	DT_BUDGET = DT_BUDGET - 500;
	Info_ClearChoices(dia_Erol_businessaction);

	if(DT_BUDGET > 5000)
	{
		Info_AddChoice(dia_Erol_businessaction,"Пять сотен золотых монет.",dia_Erol_businessaction_budgettake_small);
	};
	if(DT_BUDGET >= 6000)
	{
		Info_AddChoice(dia_Erol_businessaction,"Полторы тысячи золотых монет.",dia_Erol_businessaction_budgettake_medium);
	};
	if(DT_BUDGET >= 7000)
	{
		Info_AddChoice(dia_Erol_businessaction,"Две с половиной тысячи золотых монет.",dia_Erol_businessaction_budgettake_huge);
	};

	Info_AddChoice(dia_Erol_businessaction,Dialog_Back,dia_Erol_businessaction_back);
};

func void dia_Erol_businessaction_budgettake_medium()
{
	AI_Output(other,self,"DIA_Erol_BusinessAction_BudgetTake_Medium_15_00");	//Полторы тысячи золотых монет.
	B_GiveInvItems(self,other,ItMi_Gold,1500);
	DT_BUDGET = DT_BUDGET - 1500;
	Info_ClearChoices(dia_Erol_businessaction);

	if(DT_BUDGET > 5000)
	{
		Info_AddChoice(dia_Erol_businessaction,"Пять сотен золотых монет.",dia_Erol_businessaction_budgettake_small);
	};
	if(DT_BUDGET >= 6000)
	{
		Info_AddChoice(dia_Erol_businessaction,"Полторы тысячи золотых монет.",dia_Erol_businessaction_budgettake_medium);
	};
	if(DT_BUDGET >= 7000)
	{
		Info_AddChoice(dia_Erol_businessaction,"Две с половиной тысячи золотых монет.",dia_Erol_businessaction_budgettake_huge);
	};

	Info_AddChoice(dia_Erol_businessaction,Dialog_Back,dia_Erol_businessaction_back);
};

func void dia_Erol_businessaction_budgettake_huge()
{
	var string concatText1;
	var string concatText2;

	AI_Output(other,self,"DIA_Erol_BusinessAction_BudgetTake_Huge_15_00");	//Две с половиной тысячи золотых монет.
	B_GiveInvItems(self,other,ItMi_Gold,2500);
	DT_BUDGET = DT_BUDGET - 2500;
	Info_ClearChoices(dia_Erol_businessaction);

	if(DT_BUDGET > 5000)
	{
		Info_AddChoice(dia_Erol_businessaction,"Пять сотен золотых монет.",dia_Erol_businessaction_budgettake_small);
	};
	if(DT_BUDGET >= 6000)
	{
		Info_AddChoice(dia_Erol_businessaction,"Полторы тысячи золотых монет.",dia_Erol_businessaction_budgettake_medium);
	};
	if(DT_BUDGET >= 7000)
	{
		Info_AddChoice(dia_Erol_businessaction,"Две с половиной тысячи золотых монет.",dia_Erol_businessaction_budgettake_huge);
	};

	Info_AddChoice(dia_Erol_businessaction,Dialog_Back,dia_Erol_businessaction_back);
};

func void dia_Erol_businessaction_foodgive()
{
	AI_Output(other,self,"DIA_Erol_BusinessAction_FoodGive_15_00");	//Я бы хотел оставить припасы еды на складе в лагере.
	AI_Output(self,other,"DIA_Erol_BusinessAction_FoodGive_10_01");	//О каком размере припасов идет речь?
	Info_ClearChoices(dia_Erol_businessaction);

	if(Npc_HasItems(other,ItFoMutton) >= 20)
	{
		Info_AddChoice(dia_Erol_businessaction,"Двадцать кусков жаренного мяса.",dia_Erol_businessaction_foodgive_hmf);
	};
	if(Npc_HasItems(other,ItFoMuttonRaw) >= 20)
	{
		Info_AddChoice(dia_Erol_businessaction,"Двадцать кусков сырого мяса.",dia_Erol_businessaction_foodgive_mf);
	};
	if(Npc_HasItems(other,ItFo_Fish) >= 20)
	{
		Info_AddChoice(dia_Erol_businessaction,"Два десятка свежей рыбы.",dia_Erol_businessaction_foodgive_fb);
	};
	if(Npc_HasItems(other,ItFo_Bread) >= 10)
	{
		Info_AddChoice(dia_Erol_businessaction,"Десять батонов хлеба.",dia_Erol_businessaction_foodgive_bsc);
	};

	Info_AddChoice(dia_Erol_businessaction,Dialog_Back,dia_Erol_businessaction_back);
};

func void dia_Erol_businessaction_foodgive_hmf()
{
	AI_Output(other,self,"DIA_Erol_BusinessAction_FoodGive_MF_15_00");	//Двадцать кусков жаренного мяса.
	B_GiveInvItems(other,self,ItFoMutton,20);
	Npc_RemoveInvItems(self,ItFoMutton,20);
	DT_FOODSTOCK = DT_FOODSTOCK + 20;
	Info_ClearChoices(dia_Erol_businessaction);

	if(Npc_HasItems(other,ItFoMutton) >= 20)
	{
		Info_AddChoice(dia_Erol_businessaction,"Двадцать кусков жаренного мяса.",dia_Erol_businessaction_foodgive_hmf);
	};
	if(Npc_HasItems(other,ItFoMuttonRaw) >= 20)
	{
		Info_AddChoice(dia_Erol_businessaction,"Двадцать кусков сырого мяса.",dia_Erol_businessaction_foodgive_mf);
	};
	if(Npc_HasItems(other,ItFo_Fish) >= 20)
	{
		Info_AddChoice(dia_Erol_businessaction,"Два десятка свежей рыбы.",dia_Erol_businessaction_foodgive_fb);
	};
	if(Npc_HasItems(other,ItFo_Bread) >= 10)
	{
		Info_AddChoice(dia_Erol_businessaction,"Десять батонов хлеба.",dia_Erol_businessaction_foodgive_bsc);
	};

	Info_AddChoice(dia_Erol_businessaction,Dialog_Back,dia_Erol_businessaction_back);
};

func void dia_Erol_businessaction_foodgive_mf()
{
	AI_Output(other,self,"DIA_Erol_BusinessAction_FoodGive_MF_15_00");	//Двадцать кусков сырого мяса.
	B_GiveInvItems(other,self,ItFoMuttonRaw,20);
	Npc_RemoveInvItems(self,ItFoMuttonRaw,20);
	DT_FOODSTOCK = DT_FOODSTOCK + 20;
	Info_ClearChoices(dia_Erol_businessaction);

	if(Npc_HasItems(other,ItFoMutton) >= 20)
	{
		Info_AddChoice(dia_Erol_businessaction,"Двадцать кусков жаренного мяса.",dia_Erol_businessaction_foodgive_hmf);
	};
	if(Npc_HasItems(other,ItFoMuttonRaw) >= 20)
	{
		Info_AddChoice(dia_Erol_businessaction,"Двадцать кусков сырого мяса.",dia_Erol_businessaction_foodgive_mf);
	};
	if(Npc_HasItems(other,ItFo_Fish) >= 20)
	{
		Info_AddChoice(dia_Erol_businessaction,"Два десятка свежей рыбы.",dia_Erol_businessaction_foodgive_fb);
	};
	if(Npc_HasItems(other,ItFo_Bread) >= 10)
	{
		Info_AddChoice(dia_Erol_businessaction,"Десять батонов хлеба.",dia_Erol_businessaction_foodgive_bsc);
	};

	Info_AddChoice(dia_Erol_businessaction,Dialog_Back,dia_Erol_businessaction_back);
};

func void dia_Erol_businessaction_foodgive_fb()
{
	AI_Output(other,self,"DIA_Erol_BusinessAction_FoodGive_FB_15_00");	//Два десятка свежей рыбы.
	B_GiveInvItems(other,self,ItFo_Fish,20);
	Npc_RemoveInvItems(self,ItFo_Fish,20);
	DT_FOODSTOCK = DT_FOODSTOCK + 20;
	Info_ClearChoices(dia_Erol_businessaction);

	if(Npc_HasItems(other,ItFoMutton) >= 20)
	{
		Info_AddChoice(dia_Erol_businessaction,"Двадцать кусков жаренного мяса.",dia_Erol_businessaction_foodgive_hmf);
	};
	if(Npc_HasItems(other,ItFoMuttonRaw) >= 20)
	{
		Info_AddChoice(dia_Erol_businessaction,"Двадцать кусков сырого мяса.",dia_Erol_businessaction_foodgive_mf);
	};
	if(Npc_HasItems(other,ItFo_Fish) >= 20)
	{
		Info_AddChoice(dia_Erol_businessaction,"Два десятка свежей рыбы.",dia_Erol_businessaction_foodgive_fb);
	};
	if(Npc_HasItems(other,ItFo_Bread) >= 10)
	{
		Info_AddChoice(dia_Erol_businessaction,"Десять батонов хлеба.",dia_Erol_businessaction_foodgive_bsc);
	};

	Info_AddChoice(dia_Erol_businessaction,Dialog_Back,dia_Erol_businessaction_back);
};

func void dia_Erol_businessaction_foodgive_bsc()
{
	AI_Output(other,self,"DIA_Erol_BusinessAction_FoodGive_BSC_15_00");	//Десять батонов хлеба.
	B_GiveInvItems(other,self,ItFo_Bread,10);
	Npc_RemoveInvItems(self,ItFo_Bread,10);
	DT_FOODSTOCK = DT_FOODSTOCK + 10;
	Info_ClearChoices(dia_Erol_businessaction);

	if(Npc_HasItems(other,ItFoMutton) >= 20)
	{
		Info_AddChoice(dia_Erol_businessaction,"Двадцать кусков жаренного мяса.",dia_Erol_businessaction_foodgive_hmf);
	};
	if(Npc_HasItems(other,ItFoMuttonRaw) >= 20)
	{
		Info_AddChoice(dia_Erol_businessaction,"Двадцать кусков сырого мяса.",dia_Erol_businessaction_foodgive_mf);
	};
	if(Npc_HasItems(other,ItFo_Fish) >= 20)
	{
		Info_AddChoice(dia_Erol_businessaction,"Два десятка свежей рыбы.",dia_Erol_businessaction_foodgive_fb);
	};
	if(Npc_HasItems(other,ItFo_Bread) >= 10)
	{
		Info_AddChoice(dia_Erol_businessaction,"Десять батонов хлеба.",dia_Erol_businessaction_foodgive_bsc);
	};

	Info_AddChoice(dia_Erol_businessaction,Dialog_Back,dia_Erol_businessaction_back);
};

func void dia_Erol_businessaction_foodsell()
{
	AI_Output(other,self,"DIA_Erol_BusinessAction_FoodSell_15_00");	//Я бы хотел продать запасы еды со склада в лагере.

	if(DT_FOODSTOCK < 130)
	{
		AI_Output(self,other,"DIA_Erol_BusinessAction_FoodSell_10_01");	//К сожалению, это невозможно, ибо запасы на складе минимальны для нормального существования лагеря в ближайшее время.
		Info_ClearChoices(dia_Erol_businessaction);
	}
	else
	{
		AI_Output(self,other,"DIA_Erol_BusinessAction_FoodSell_10_02");	//Это возможно организовать. Сколько конкретно еды ты желаешь продать?
		Info_ClearChoices(dia_Erol_businessaction);

		if(DT_FOODSTOCK >= 130)
		{
			Info_AddChoice(dia_Erol_businessaction,"Десять единиц еды (Доход в казну: 50 золотых монет)",dia_Erol_businessaction_foodsell_small);
		};
		if(DT_FOODSTOCK >= 145)
		{
			Info_AddChoice(dia_Erol_businessaction,"Двадцать пять единиц еды (Доход в казну: 125 золотых монет)",dia_Erol_businessaction_foodsell_medium);
		};
		if(DT_FOODSTOCK >= 170)
		{
			Info_AddChoice(dia_Erol_businessaction,"Пятьдесят единиц еды (Доход в казну: 250 золотых монет)",dia_Erol_businessaction_foodsell_huge);
		};

		Info_AddChoice(dia_Erol_businessaction,Dialog_Back,dia_Erol_businessaction_back);
	};
};

func void dia_Erol_businessaction_foodsell_small()
{
	var string concatText1;
	var string concatText2;

	AI_Output(other,self,"DIA_Erol_BusinessAction_FoodSell_Small_15_00");	//Десять единиц еды.
	DT_BUDGET = DT_BUDGET + 50;
	DT_FOODSTOCK = DT_FOODSTOCK - 10;
	Info_ClearChoices(dia_Erol_businessaction);

	if(DT_FOODSTOCK >= 130)
	{
		Info_AddChoice(dia_Erol_businessaction,"Десять единиц еды (Доход в казну: 50 золотых монет)",dia_Erol_businessaction_foodsell_small);
	};
	if(DT_FOODSTOCK >= 145)
	{
		Info_AddChoice(dia_Erol_businessaction,"Двадцать пять единиц еды (Доход в казну: 125 золотых монет)",dia_Erol_businessaction_foodsell_medium);
	};
	if(DT_FOODSTOCK >= 170)
	{
		Info_AddChoice(dia_Erol_businessaction,"Пятьдесят единиц еды (Доход в казну: 250 золотых монет)",dia_Erol_businessaction_foodsell_huge);
	};

	Info_AddChoice(dia_Erol_businessaction,Dialog_Back,dia_Erol_businessaction_back);
};

func void dia_Erol_businessaction_foodsell_medium()
{
	var string concatText1;
	var string concatText2;

	AI_Output(other,self,"DIA_Erol_BusinessAction_FoodSell_Medium_15_00");	//Двадцать пять единиц еды.
	DT_BUDGET = DT_BUDGET + 125;
	DT_FOODSTOCK = DT_FOODSTOCK - 25;
	Info_ClearChoices(dia_Erol_businessaction);

	if(DT_FOODSTOCK >= 130)
	{
		Info_AddChoice(dia_Erol_businessaction,"Десять единиц еды (Доход в казну: 50 золотых монет)",dia_Erol_businessaction_foodsell_small);
	};
	if(DT_FOODSTOCK >= 145)
	{
		Info_AddChoice(dia_Erol_businessaction,"Двадцать пять единиц еды (Доход в казну: 125 золотых монет)",dia_Erol_businessaction_foodsell_medium);
	};
	if(DT_FOODSTOCK >= 170)
	{
		Info_AddChoice(dia_Erol_businessaction,"Пятьдесят единиц еды (Доход в казну: 250 золотых монет)",dia_Erol_businessaction_foodsell_huge);
	};

	Info_AddChoice(dia_Erol_businessaction,Dialog_Back,dia_Erol_businessaction_back);
};

func void dia_Erol_businessaction_foodsell_huge()
{
	var string concatText1;
	var string concatText2;

	AI_Output(other,self,"DIA_Erol_BusinessAction_FoodSell_Huge_15_00");	//Пятьдесят единиц еды.
	DT_BUDGET = DT_BUDGET + 250;
	DT_FOODSTOCK = DT_FOODSTOCK - 50;
	Info_ClearChoices(dia_Erol_businessaction);

	if(DT_FOODSTOCK >= 130)
	{
		Info_AddChoice(dia_Erol_businessaction,"Десять единиц еды (Доход в казну: 50 золотых монет)",dia_Erol_businessaction_foodsell_small);
	};
	if(DT_FOODSTOCK >= 145)
	{
		Info_AddChoice(dia_Erol_businessaction,"Двадцать пять единиц еды (Доход в казну: 125 золотых монет)",dia_Erol_businessaction_foodsell_medium);
	};
	if(DT_FOODSTOCK >= 170)
	{
		Info_AddChoice(dia_Erol_businessaction,"Пятьдесят единиц еды (Доход в казну: 250 золотых монет)",dia_Erol_businessaction_foodsell_huge);
	};

	Info_AddChoice(dia_Erol_businessaction,Dialog_Back,dia_Erol_businessaction_back);
};

instance DIA_Erol_MONEYCRISIS(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 1;
	condition = dia_Erol_moneycrisis_condition;
	information = dia_Erol_moneycrisis_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_Erol_moneycrisis_condition()
{
	if((DTMONEYCRISIS == TRUE) && (DTFOODCRISIS == FALSE) && (ErolRECRUITEDDT == TRUE))
	{
		return TRUE;
	};
};

func void dia_Erol_moneycrisis_info()
{
	var string concatText1;

	DTMONEYDEBT = 5000 - DT_BUDGET;
	AI_Output(self,other,"DIA_Erol_MoneyCrisis_07_00");	//Наконец-то! В лагере нет денег, мне нечем платить людям зарплату!
	AI_Output(self,other,"DIA_Erol_MoneyCrisis_07_01");	//Мне еле-еле удалось отговорить их от того, чтобы начать расходиться по домам.
	AI_Output(self,other,"DIA_Erol_MoneyCrisis_07_02");	//Нам срочно нужны деньги!
	AI_Output(other,self,"DIA_Erol_MoneyCrisis_15_03");	//Сколько?
	concatText1 = ConcatStrings("Необходимо ",IntToString(DTMONEYDEBT));
	concatText1 = ConcatStrings(concatText1," золотых монет");
	AI_Print(concatText1);
	Info_ClearChoices(dia_Erol_moneycrisis);

	if(Npc_HasItems(other,ItMi_Gold) >= DTMONEYDEBT)
	{
		Info_AddChoice(dia_Erol_moneycrisis,"Вот деньги.",dia_Erol_moneycrisis_yes);
	};

	Info_AddChoice(dia_Erol_moneycrisis,"У меня сейчас нет таких денег.",dia_Erol_moneycrisis_no);
};

func void dia_Erol_moneycrisis_yes()
{
	AI_Output(other,self,"DIA_Erol_MoneyCrisis_Yes_15_00");	//Вот деньги.
	AI_Output(self,other,"DIA_Erol_MoneyCrisis_Yes_07_01");	//Отлично! Я немедленно распоряжусь выплатить долги.
	B_GiveInvItems(other,self,ItMi_Gold,DTMONEYDEBT);
	DT_BUDGET = DT_BUDGET + DTMONEYDEBT;
	Npc_RemoveInvItems(self,ItMi_Gold,DTMONEYDEBT);
	DTMONEYCRISIS = FALSE;
	AI_StopProcessInfos(self);
};

func void dia_Erol_moneycrisis_no()
{
	AI_Output(other,self,"DIA_Erol_MoneyCrisis_No_15_00");	//У меня сейчас нет таких денег.
	AI_Output(self,other,"DIA_Erol_MoneyCrisis_No_07_01");	//Значит найди их! Нельзя быть таким безответственным!
	AI_StopProcessInfos(self);
};

instance DIA_Erol_FOODCRISIS(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 1;
	condition = dia_Erol_foodcrisis_condition;
	information = dia_Erol_foodcrisis_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_Erol_foodcrisis_condition()
{
	if((DTFOODCRISIS == TRUE) && (ErolRECRUITEDDT == TRUE))
	{
		return TRUE;
	};
};

func void dia_Erol_foodcrisis_info()
{
	AI_Output(self,other,"DIA_Erol_FoodCrisis_07_00");	//Наконец-то! В лагере закончилась еда, нам нечего есть!
	AI_Output(self,other,"DIA_Erol_FoodCrisis_07_01");	//Я временно договорился с Онаром о поставках, но у него на носу важный контракт, и он их прекратит, как только его заключит.
	AI_Output(self,other,"DIA_Erol_FoodCrisis_07_02");	//Нам срочно нужна еда! Прежде всего, мясо, рыба, хлеб...
	Info_ClearChoices(dia_Erol_foodcrisis);

	if(Npc_HasItems(other,ItFoMutton) >= 20)
	{
		Info_AddChoice(dia_Erol_foodcrisis,"Вот двадцать кусков жареного мяса.",dia_Erol_foodcrisis_m);
	};
	if(Npc_HasItems(other,ItFoMuttonRaw) >= 20)
	{
		Info_AddChoice(dia_Erol_foodcrisis,"Вот двадцать кусков сырого мяса.",dia_Erol_foodcrisis_rm);
	};
	if(Npc_HasItems(other,ItFo_Fish) >= 20)
	{
		Info_AddChoice(dia_Erol_foodcrisis,"Вот два десятка свежей рыбы.",dia_Erol_foodcrisis_f);
	};
	if(Npc_HasItems(other,ItFo_Bread) >= 10)
	{
		Info_AddChoice(dia_Erol_foodcrisis,"Вот десять батонов хлеба.",dia_Erol_foodcrisis_b);
	};

	Info_AddChoice(dia_Erol_foodcrisis,"У меня нет с собой нужного количества еды.",dia_Erol_foodcrisis_no);
};

func void dia_Erol_foodcrisis_m()
{
	AI_Output(other,self,"DIA_Erol_FoodCrisis_M_15_00");	//Вот двадцать кусков жареного мяса.
	B_GiveInvItems(other,self,ItFoMutton,20);
	Npc_RemoveInvItems(self,ItFoMutton,20);
	DT_FOODSTOCK = DT_FOODSTOCK + 20;

	if(DT_FOODSTOCK >= 120)
	{
		AI_Output(self,other,"DIA_Erol_FoodCrisis_M_07_01");	//Отлично! Этого пока хватит.
		DTFOODCRISIS = FALSE;
		DTFOODDEBT = 0;
		Info_ClearChoices(dia_Erol_foodcrisis);
	}
	else
	{
		AI_Output(self,other,"DIA_Erol_FoodCrisis_M_07_02");	//Еще! Нам нужно больше еды.

		if(Npc_HasItems(other,ItFoMutton) >= 20)
		{
			Info_AddChoice(dia_Erol_foodcrisis,"Вот двадцать кусков жареного мяса.",dia_Erol_foodcrisis_m);
		};
	};
};

func void dia_Erol_foodcrisis_rm()
{
	AI_Output(other,self,"DIA_Erol_FoodCrisis_RM_15_00");	//Вот двадцать кусков сырого мяса.
	B_GiveInvItems(other,self,ItFoMuttonRaw,20);
	Npc_RemoveInvItems(self,ItFoMuttonRaw,20);
	DT_FOODSTOCK = DT_FOODSTOCK + 20;

	if(DT_FOODSTOCK >= 120)
	{
		AI_Output(self,other,"DIA_Erol_FoodCrisis_RM_07_01");	//Отлично! Этого пока хватит.
		DTFOODCRISIS = FALSE;
		DTFOODDEBT = 0;
		Info_ClearChoices(dia_Erol_foodcrisis);
	}
	else
	{
		AI_Output(self,other,"DIA_Erol_FoodCrisis_RM_M_07_02");	//Еще! Нам нужно больше еды.

		if(Npc_HasItems(other,ItFoMuttonRaw) >= 20)
		{
			Info_AddChoice(dia_Erol_foodcrisis,"Вот двадцать кусков сырого мяса.",dia_Erol_foodcrisis_rm);
		};
	};
};

func void dia_Erol_foodcrisis_f()
{
	AI_Output(other,self,"DIA_Erol_FoodCrisis_F_15_00");	//Вот два десятка свежей рыбы.
	B_GiveInvItems(other,self,ItFo_Fish,20);
	Npc_RemoveInvItems(self,ItFo_Fish,20);
	DT_FOODSTOCK = DT_FOODSTOCK + 20;

	if(DT_FOODSTOCK >= 120)
	{
		AI_Output(self,other,"DIA_Erol_FoodCrisis_F_07_01");	//Отлично! Этого пока хватит.
		DTFOODCRISIS = FALSE;
		DTFOODDEBT = 0;
		Info_ClearChoices(dia_Erol_foodcrisis);
	}
	else
	{
		AI_Output(self,other,"DIA_Erol_FoodCrisis_F_07_02");	//Еще! Нам нужно больше еды.

		if(Npc_HasItems(other,ItFo_Fish) >= 20)
		{
			Info_AddChoice(dia_Erol_foodcrisis,"Вот два десятка свежей рыбы.",dia_Erol_foodcrisis_f);
		};
	};
};

func void dia_Erol_foodcrisis_b()
{
	AI_Output(other,self,"DIA_Erol_FoodCrisis_B_15_00");	//Вот десять батонов хлеба.
	B_GiveInvItems(other,self,ItFo_Bread,10);
	Npc_RemoveInvItems(self,ItFo_Bread,10);
	DT_FOODSTOCK = DT_FOODSTOCK + 10;

	if(DT_FOODSTOCK >= 120)
	{
		AI_Output(self,other,"DIA_Erol_FoodCrisis_B_07_01");	//Отлично! Этого пока хватит.
		DTFOODCRISIS = FALSE;
		DTFOODDEBT = 0;
		Info_ClearChoices(dia_Erol_foodcrisis);
	}
	else
	{
		AI_Output(self,other,"DIA_Erol_FoodCrisis_B_07_02");	//Еще! Нам нужно больше еды.

		if(Npc_HasItems(other,ItFo_Bread) >= 10)
		{
			Info_AddChoice(dia_Erol_foodcrisis,"Вот десять батонов хлеба.",dia_Erol_foodcrisis_b);
		};
	};
};

func void dia_Erol_foodcrisis_no()
{
	AI_Output(other,self,"DIA_Erol_FoodCrisis_No_15_00");	//У меня нет с собой нужного количества еды. Я сам живу впроголодь.
	AI_Output(self,other,"DIA_Erol_FoodCrisis_No_07_01");	//О, Иннос! Нельзя же быть таким безответственным! Нам нужна еда!
	AI_StopProcessInfos(self);
};

instance DIA_EROL_IGETTHEFOUTOFHERE(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 15;
	condition = dia_erol_igetthefoutofhere_condition;
	information = dia_erol_igetthefoutofhere_info;
	permanent = FALSE;
	description = "Я собираюсь отплыть на материк.";
};


func int dia_erol_igetthefoutofhere_condition()
{
	if((WHOTRAVELONBIGLAND == TRUE) && (EROLRECRUITEDDT == TRUE))
	{
		return TRUE;
	};
};

func void dia_erol_igetthefoutofhere_info()
{
	AI_Output(other,self,"DIA_Erol_IGetTheFOutOfHere_15_00");	//Я собираюсь отплыть на материк. Ты сможешь присмотреть за башней?
	AI_Output(self,other,"DIA_Erol_IGetTheFOutOfHere_10_01");	//Это неожиданные новости... ты уплываешь навсегда, или же намереваешься вернуться назад через какое-то время?
	AI_Output(other,self,"DIA_Erol_IGetTheFOutOfHere_15_02");	//Боюсь, что нет, я уже не вернусь в Хоринис. Если ты готов и дальше заниматься ведением дел в башне, я оставлю ее тебе.
	AI_Output(self,other,"DIA_Erol_IGetTheFOutOfHere_10_03");	//Эээ... хорошо, как скажешь. Благодаря твоим усилиям мы неплохо здесь обустроились, так что, думаю, сможем и дальше поддерживать этот лагерь.
	AI_Output(self,other,"DIA_Erol_IGetTheFOutOfHere_10_04");	//Теперь, когда твоя башня и ферма Онара стали основным центром сопротивления оркам, мы сможем укрепить отношения с остальными лагерями и совместными усилиями продолжить противостоять этим тварям.
	AI_Output(self,other,"DIA_Erol_IGetTheFOutOfHere_10_05");	//Так что, думаю, ты можешь отплывать, не беспокоясь за благополучие лагеря.
	AI_Output(self,other,"DIA_Erol_IGetTheFOutOfHere_10_06");	//Ты уже сделал для нас все, что мог, и теперь наша очередь приложить усилия. Удачного путешествия!
	AI_Output(other,self,"DIA_Erol_IGetTheFOutOfHere_15_07");	//Спасибо!
	AI_StopProcessInfos(self);
};

instance DIA_EROL_INTOWER(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 22;
	condition = dia_erol_intower_condition;
	information = dia_erol_intower_info;
	permanent = TRUE;
	description = "Как дела в башне?";
};

func int dia_erol_intower_condition()
{
	if((EROLRECRUITEDDT == TRUE) && (KAPITELORCATC == FALSE) && (DTMONEYCRISIS == FALSE) && (DTFOODCRISIS == FALSE) && (CEONEEDSFIRSTMONEY == FALSE) && (CEONEEDSFIRSTFOOD == FALSE) && (Npc_GetDistToWP(self,"NW_CASTLEMINE_TOWER_CAMPFIRE_01") < 12000))
	{
		return TRUE;
	};
};

func void dia_erol_intower_info()
{
	AI_Output(other,self,"DIA_Erol_InTower_15_00");	//Как обстоят дела с хозяйством?
	AI_Output(self,other,"DIA_Erol_InTower_07_01");	//Все в порядке. Тебе не о чем волноваться.
};

instance DIA_EROL_INTOWER_ORCKAP(C_Info)
{
	npc = VLK_4303_Addon_Erol;
	nr = 22;
	condition = dia_erol_intower_orckap_condition;
	information = dia_erol_intower_orckap_info;
	permanent = TRUE;
	description = "Как дела в лагере?";
};

func int dia_erol_intower_orckap_condition()
{
	if((EROLRECRUITEDDT == TRUE) && (KAPITELORCATC == TRUE))
	{
		return TRUE;
	};
};

func void dia_erol_intower_orckap_info()
{
	AI_Output(other,self,"DIA_Erol_InTower_OrcKap_15_00");	//Как дела в лагере?
	AI_Output(self,other,"DIA_Erol_InTower_OrcKap_07_01");	//Денег и еды у нас предостаточно, но вот орки беспокоят...
};
