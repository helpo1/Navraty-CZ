
instance DIA_Jesper_EXIT(C_Info)
{
	npc = VLK_446_Jesper;
	nr = 999;
	condition = DIA_Jesper_EXIT_Condition;
	information = DIA_Jesper_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Jesper_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Jesper_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Jesper_PICKPOCKET(C_Info)
{
	npc = VLK_446_Jesper;
	nr = 900;
	condition = DIA_Jesper_PICKPOCKET_Condition;
	information = DIA_Jesper_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Jesper_PICKPOCKET_Condition()
{
	return C_Beklauen(80,180);
};

func void DIA_Jesper_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Jesper_PICKPOCKET);
	Info_AddChoice(DIA_Jesper_PICKPOCKET,Dialog_Back,DIA_Jesper_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Jesper_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Jesper_PICKPOCKET_DoIt);
};

func void DIA_Jesper_PICKPOCKET_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= 30)
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		}
		else
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		};
		B_GiveInvItems(self,other,ItMi_Gold,30);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		BELIARPRAYCOUNT = BELIARPRAYCOUNT + 1;
		B_GiveThiefXP();
	}
	else
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		};
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
};

func void DIA_Jesper_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Jesper_PICKPOCKET);
};


instance DIA_Jesper_Hallo(C_Info)
{
	npc = VLK_446_Jesper;
	nr = 1;
	condition = DIA_Jesper_Hallo_Condition;
	information = DIA_Jesper_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Jesper_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Jesper_Hallo_Info()
{
	AI_Output(self,other,"DIA_Jesper_Hallo_09_00");	//Эй, Что ты тут делаешь? Тебе тут не место!
	AI_Output(self,other,"DIA_Jesper_Hallo_09_01");	//Так что выкладывай, что ты делаешь здесь?
	Info_ClearChoices(DIA_Jesper_Hallo);
	Info_AddChoice(DIA_Jesper_Hallo,"Я пришел убить тебя.",DIA_Jesper_Hallo_Kill);
	Info_AddChoice(DIA_Jesper_Hallo,"Я просто прогуливаюсь здесь.",DIA_Jesper_Hallo_NurSo);

	if(Attila_Key == TRUE)
	{
		Info_AddChoice(DIA_Jesper_Hallo,"Аттила дал мне ключ...",DIA_Jesper_Hallo_Willkommen);
	}
	else
	{
		Info_AddChoice(DIA_Jesper_Hallo,"Я прикончил Аттилу!",DIA_Jesper_Hallo_Umgelegt);
	};

	DG_gefunden = TRUE;
};

func void DIA_Jesper_Hallo_Kill()
{
	AI_Output(other,self,"DIA_Jesper_Hallo_Kill_15_00");	//Я пришел убить тебя.
	AI_Output(self,other,"DIA_Jesper_Hallo_Kill_09_01");	//Чудесная идея! Ты что думаешь, я здесь один? Ах, ладно. Сейчас мы решим этот вопрос.
	AI_StopProcessInfos(self);
	B_StartOtherRoutine(VLK_494_Attila,"ChiefLair");
	Npc_ExchangeRoutine(self,"START");
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Jesper_Hallo_NurSo()
{
	AI_Output(other,self,"DIA_Jesper_Hallo_NurSo_15_00");	//Я просто прогуливаюсь здесь.
	AI_Output(self,other,"DIA_Jesper_Hallo_NurSo_09_01");	//Здесь не стоит гулять. Это слишком опасно, понятно?
	AI_Output(self,other,"DIA_Jesper_Hallo_NurSo_09_02");	//Так что оставь свое оружие на месте и скажи мне, зачем ты здесь?
};

func void DIA_Jesper_Hallo_Willkommen()
{
	AI_Output(other,self,"DIA_Jesper_Hallo_Willkommen_15_00");	//Аттила дал мне ключ. Вот почему я здесь. Так что вам нужно от меня?
	AI_Output(self,other,"DIA_Jesper_Hallo_Willkommen_09_01");	//Разве ты не хочешь узнать это? Не горячись.
	AI_Output(self,other,"DIA_Jesper_Hallo_Willkommen_09_02");	//Иди к Кассии! Тебя ждут.
	AI_StopProcessInfos(self);
	B_StartOtherRoutine(VLK_494_Attila,"ChiefLair");
	Npc_ExchangeRoutine(self,"START");
};

func void DIA_Jesper_Hallo_Umgelegt()
{
	AI_Output(other,self,"DIA_Jesper_Hallo_Umgelegt_15_00");	//Я прикончил Аттилу! При нем был ключ от канализации.
	AI_Output(self,other,"DIA_Jesper_Hallo_Umgelegt_09_01");	//ТЫ убил Аттилу?!...(недоверчиво) А, ладно, он все равно был никчемным псом.
	AI_Output(self,other,"DIA_Jesper_Hallo_Umgelegt_09_02");	//Но я хочу предупредить тебя. Если ты нападешь на МЕНЯ, я тебя убью!
	Info_ClearChoices(DIA_Jesper_Hallo);
	Info_AddChoice(DIA_Jesper_Hallo,"Что ты делаешь здесь?",DIA_Jesper_Hallo_Was);
	Info_AddChoice(DIA_Jesper_Hallo,"Отведи меня к вашему главарю.",DIA_Jesper_Hallo_Anfuehrer);
};

func void DIA_Jesper_Hallo_Was()
{
	AI_Output(other,self,"DIA_Jesper_Hallo_Was_15_00");	//Что ты делаешь в этой темной вонючей дыре?
	AI_Output(self,other,"DIA_Jesper_Hallo_Was_09_01");	//Я живу здесь! Еще один глупый вопрос, и в твоей шкуре появятся дырки.
};

func void DIA_Jesper_Hallo_Anfuehrer()
{
	AI_Output(other,self,"DIA_Jesper_Hallo_Anfuehrer_15_00");	//Отведи меня к вашему главарю.
	AI_Output(self,other,"DIA_Jesper_Hallo_Anfuehrer_09_01");	//К главарю?...(посмеиваясь) Ну да! Я уверен, Кассия захочет поговорить с тобой.
	AI_Output(self,other,"DIA_Jesper_Hallo_Anfuehrer_09_02");	//Иди вперед и не пытайся провести меня.
	AI_StopProcessInfos(self);
	B_StartOtherRoutine(VLK_494_Attila,"ChiefLair");
	Npc_ExchangeRoutine(self,"START");
};

instance DIA_Jesper_Bezahlen(C_Info)
{
	npc = VLK_446_Jesper;
	nr = 1;
	condition = DIA_Jesper_Bezahlen_Condition;
	information = DIA_Jesper_Bezahlen_Info;
	permanent = FALSE;
	description = "Ты можешь научить меня чему-нибудь?";
};

func int DIA_Jesper_Bezahlen_Condition()
{
	if((IS_LOVCACH == TRUE) && (Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jesper_Bezahlen_Info()
{
	AI_Output(other,self,"DIA_Jesper_Bezahlen_15_00");	//Ты можешь меня чему-нибудь научить?
	AI_Output(self,other,"DIA_Jesper_Bezahlen_09_01");	//Конечно! Я даже покажу тебе, как нужно подкрадываться.
	Jesper_TeachSneak = TRUE;
};

instance DIA_Jesper_Schleichen(C_Info)
{
	npc = VLK_446_Jesper;
	nr = 10;
	condition = DIA_Jesper_Schleichen_Condition;
	information = DIA_Jesper_Schleichen_Info;
	permanent = TRUE;
	description = "Научи меня подкрадываться. (Очки обучения: 5)";
};

var int DIA_Jesper_Schleichen_permanent;

func int DIA_Jesper_Schleichen_Condition()
{
	if((Jesper_TeachSneak == TRUE) && (DIA_Jesper_Schleichen_permanent == FALSE) && (Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jesper_Schleichen_Info()
{
	AI_Output(other,self,"DIA_Jesper_Schleichen_15_00");	//Покажи мне искусство подкрадывания.

	if(b_teachthieftalentfree(self,other,NPC_TALENT_SNEAK))
	{
		AI_Output(self,other,"DIA_Jesper_Schleichen_09_01");	//Умение красться очень важно для любого вора. Особенно, если ты ходишь по чужому дому.
		AI_Output(self,other,"DIA_Jesper_Schleichen_09_02");	//Там нельзя топать, как ты это делаешь сейчас. Большинство людей спит очень чутким сном.
		AI_Output(self,other,"DIA_Jesper_Schleichen_09_03");	//Только когда ты крадешься, никто не услышит тебя, и ты сможешь работать беспрепятственно.
		DIA_Jesper_Schleichen_permanent = TRUE;
	};
};

instance DIA_Jesper_Killer(C_Info)
{
	npc = VLK_446_Jesper;
	nr = 2;
	condition = DIA_Jesper_Killer_Condition;
	information = DIA_Jesper_Killer_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Jesper_Killer_Condition()
{
	if(Npc_IsDead(Cassia) || Npc_IsDead(Ramirez))
	{
		return TRUE;
	};
};

func void DIA_Jesper_Killer_Info()
{
	if(Npc_IsDead(Cassia) && Npc_IsDead(Ramirez))
	{
		AI_Output(self,other,"DIA_Jesper_Killer_09_00");	//Ты убил моих друзей. Зачем ты сделал это, убийца?
		AI_Output(self,other,"DIA_Jesper_Killer_09_01");	//Я отправлю тебя в царство Белиара.
	}
	else if(Npc_IsDead(Cassia))
	{
		AI_Output(self,other,"DIA_Jesper_Killer_09_02");	//Убийца! Ты убил Кассию! Но от меня тебе не уйти!
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_KILL,1);
	}
	else if(Npc_IsDead(Ramirez))
	{
		AI_Output(self,other,"DIA_Jesper_Killer_09_03");	//Я давно работаю с Рамирезом и добыл для него больше золота, чем ты можешь себе представить.
		AI_Output(self,other,"DIA_Jesper_Killer_09_04");	//А ты взял и убил его, грязный пес! Но сейчас пришло время расплаты!
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_KILL,1);
	};
};

instance DIA_Jesper_Bogen(C_Info)
{
	npc = VLK_446_Jesper;
	nr = 10;
	condition = DIA_Jesper_Bogen_Condition;
	information = DIA_Jesper_Bogen_Info;
	permanent = FALSE;
	description = "Скажи, ты ничего не знаешь о луке Боспера?";
};

func int DIA_Jesper_Bogen_Condition()
{
	if((Npc_HasItems(other,ItRw_Bow_L_03_MIS) < 1) && (MIS_Bosper_Bogen == LOG_Running) && (IS_LOVCACH == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Jesper_Bogen_Info()
{
	AI_Output(other,self,"DIA_Jesper_Bogen_15_00");	//Скажи, ты ничего не знаешь о луке Боспера?
	AI_Output(self,other,"DIA_Jesper_Bogen_09_01");	//Ты имеешь в виду лук этого ремесленника? Да, я упаковал его в один из сундуков.
	AI_Output(self,other,"DIA_Jesper_Bogen_09_02");	//Но там полно крыс вокруг. Ты можешь забрать его, если не боишься этих тварей.
	AI_Output(self,other,"DIA_Jesper_Bogen_09_03");	//Ох, да, конечно же, этот сундук заперт! Тебе придется взломать замок...(ухмыляется) Надеюсь, у тебя есть отмычки.
	Wld_InsertNpc(Giant_Rat,"NW_CITY_KANAL_ROOM_01_01");
	Wld_InsertNpc(Giant_Rat,"NW_CITY_KANAL_ROOM_01_02");
	Wld_InsertNpc(Giant_Rat,"NW_CITY_KANAL_ROOM_01_03");
};

instance DIA_Jesper_Tuer(C_Info)
{
	npc = VLK_446_Jesper;
	nr = 10;
	condition = DIA_Jesper_Tuer_Condition;
	information = DIA_Jesper_Tuer_Info;
	permanent = FALSE;
	description = "А что за этой закрытой дверью?";
};

func int DIA_Jesper_Tuer_Condition()
{
	if((IS_LOVCACH == TRUE) && (Kapitel >= 1))
	{
		return TRUE;
	};
};

func void DIA_Jesper_Tuer_Info()
{
	AI_Output(other,self,"DIA_Jesper_Tuer_15_00");	//А что за этой закрытой дверью?
	AI_Output(self,other,"DIA_Jesper_Tuer_09_01");	//За ней находится сундук...(ухмыляется) Сундук мастера-медвежатника Фингера!
	AI_Output(self,other,"DIA_Jesper_Tuer_09_02");	//Он поставил такой невероятно сложный замок на него, что до сих пор никому не удалось открыть его.
	AI_Output(self,other,"DIA_Jesper_Tuer_09_03");	//К сожалению, он как-то попался и его засунули за Барьер, где он, вероятно, и умер.
	AI_Output(self,other,"DIA_Jesper_Tuer_09_04");	//Но если ты хочешь попытаться открыть его сундук, вот ключ от этой комнаты.
	B_GiveInvItems(self,other,ItKe_Fingers,1);
};

instance DIA_Jesper_Truhe(C_Info)
{
	npc = VLK_446_Jesper;
	nr = 10;
	condition = DIA_Jesper_Truhe_Condition;
	information = DIA_Jesper_Truhe_Info;
	permanent = FALSE;
	description = "Мне удалось открыть сундук.";
};

func int DIA_Jesper_Truhe_Condition()
{
	if((Mob_HasItems("MOB_FINGERS",ItMi_Gold) < 30) || (Mob_HasItems("MOB_FINGERS",ItMi_SilverCup) < 5) || (Mob_HasItems("MOB_FINGERS",ItMi_CupGold) < 1) || (Mob_HasItems("MOB_FINGERS",ItAm_Strg_01) < 1) || (Mob_HasItems("MOB_FINGERS",ItPo_Perm_DEX) < 1))
	{
		return TRUE;
	};
};

func void DIA_Jesper_Truhe_Info()
{
	B_GivePlayerXP(XP_JesperTruhe);
	AI_Output(other,self,"DIA_Jesper_Truhe_15_00");	//Мне удалось открыть сундук.
	AI_Output(self,other,"DIA_Jesper_Truhe_09_01");	//Это невозможно! Похоже, у нас появился новый мастер-медвежатник.
	AI_Output(self,other,"DIA_Jesper_Truhe_09_02");	//Поздравляю!
	THIEF_REPUTATION = THIEF_REPUTATION + 1;
};

instance DIA_Jesper_Quest(C_Info)
{
	npc = VLK_446_Jesper;
	nr = 1;
	condition = DIA_Jesper_Quest_condition;
	information = DIA_Jesper_Quest_info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Jesper_Quest_condition()
{
	if(Wld_IsTime(10,00,19,00) && (IS_LOVCACH == TRUE) && (MSINEXTREMO == FALSE) && (Npc_GetDistToWP(pir_1397_addon_inextremo_charlotte,"OCR_CHARLOTTE") <= 250) && (Npc_IsDead(pir_1397_addon_inextremo_charlotte) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jesper_Quest_info()
{
	AI_Output(self,other,"DIA_Jesper_Quest_01_00");	//Приятель, сделай еще одно доброе дело.
	AI_Output(other,self,"DIA_Jesper_Quest_01_01");	//Что ты хочешь?
	AI_Output(self,other,"DIA_Jesper_Quest_01_02");	//Сбегай на площадь и попроси, чтобы те парни наверху сыграли что-нибудь веселое!
	AI_Output(self,other,"DIA_Jesper_Quest_01_03");	//А то я тут скоро сдохну от тоски смертной.
	AI_Output(other,self,"DIA_Jesper_Quest_01_04");	//Ладно, так уж и быть, не дам тебе умереть.
	MIS_JESPERMUSIC = LOG_Running;
	Log_CreateTopic(TOPIC_JESPERMUSIC,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_JESPERMUSIC,LOG_Running);
	B_LogEntry(TOPIC_JESPERMUSIC,"Джаспер попросил меня заказать музыку на площади Хориниса. И мне лучше поспешить, пока музыканты наверху не закончили выступление.");
};

instance DIA_Jesper_Quest_Done(C_Info)
{
	npc = VLK_446_Jesper;
	nr = 1;
	condition = DIA_Jesper_Quest_Done_condition;
	information = DIA_Jesper_Quest_Done_info;
	permanent = FALSE;
	description = "Как тебе музыка?";
};

func int DIA_Jesper_Quest_Done_condition()
{
	if((IS_INEXTREMO_PLAYING_DONE == TRUE) && (MIS_JESPERMUSIC == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Jesper_Quest_Done_info()
{
	B_GivePlayerXP(XP_JesperTruhe);
	AI_Output(other,self,"DIA_Jesper_Quest_Done_01_01");	//Как тебе музыка?
	AI_Output(self,other,"DIA_Jesper_Quest_Done_01_02");	//Спасибо, приятель...(довольно) Это было то, что нужно!
	AI_Output(self,other,"DIA_Jesper_Quest_Done_01_03");	//Вот, возьми эти отмычки в качестве награды.
	B_GiveInvItems(self,other,ItKE_lockpick,5);
	THIEF_REPUTATION = THIEF_REPUTATION + 1;
	JesperDanceDay = Wld_GetDay();
	MIS_JESPERMUSIC = LOG_SUCCESS;
	IS_INEXTREMO_PLAYING = FALSE;
	Log_SetTopicStatus(TOPIC_JESPERMUSIC,LOG_SUCCESS);
	B_LogEntry(TOPIC_JESPERMUSIC,"Джасперу пришлась по душе музыка, которая заиграла на площади.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Dance");
};

instance DIA_Jesper_Quest_StopDance(C_Info)
{
	npc = VLK_446_Jesper;
	nr = 1;
	condition = DIA_Jesper_Quest_StopDance_condition;
	information = DIA_Jesper_Quest_StopDance_info;
	permanent = FALSE;
	description = "Эй, с тобой все в порядке?";
};

func int DIA_Jesper_Quest_StopDance_condition()
{
	var int daynow;

	daynow = Wld_GetDay();

	if((MIS_JESPERMUSIC == LOG_SUCCESS) && (JesperDanceDay != FALSE) && (JesperDanceDay == (daynow - 1)))
	{
		return TRUE;
	};
};

func void DIA_Jesper_Quest_StopDance_info()
{
	AI_Output(other,self,"DIA_Jesper_Quest_StopDance_01_00");	//Эй, с тобой все в порядке?! Никто давно не играет, а ты все пляшешь.
	AI_Output(self,other,"DIA_Jesper_Quest_StopDance_01_01");	//Ох, точно...(запыхавшись) А я даже и не заметил!
	AI_Output(self,other,"DIA_Jesper_Quest_StopDance_01_02");	//Пожалуй, мне и правда пора вернуться к своим повседневным делам.
	AI_Output(self,other,"DIA_Jesper_Quest_StopDance_01_03");	//Кстати, у тебя случайно не найдется кружечки холодненького пивка? А то я аж вспотел...
	JesperCalm = TRUE;
	Info_ClearChoices(DIA_Jesper_Quest_StopDance);

	if(Npc_HasItems(hero,ItFo_Beer))
	{
		Info_AddChoice(DIA_Jesper_Quest_StopDance,"Конечно.",DIA_Jesper_Quest_StopDance_yes);
	};

	Info_AddChoice(DIA_Jesper_Quest_StopDance,"К сожалению, нет.",DIA_Jesper_Quest_StopDance_no);
};

func void DIA_Jesper_Quest_StopDance_yes()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Jesper_Quest_StopDance_yes_01_01");	//Конечно. Вот, держи.
	B_GiveInvItems(hero,self,ItFo_Beer,1);
	B_UseItem(self,ItFo_Beer);
	AI_Output(self,other,"DIA_Jesper_Quest_StopDance_yes_01_02");	//О, как вкусно... Спасибо, приятель!
	THIEF_REPUTATION = THIEF_REPUTATION + 1;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};

func void DIA_Jesper_Quest_StopDance_no()
{
	AI_Output(other,self,"DIA_Jesper_Quest_StopDance_no_01_01");	//К сожалению, нет.
	AI_Output(self,other,"DIA_Jesper_Quest_StopDance_no_01_02");	//Ну, нет так нет.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};

instance DIA_Jesper_Armor(C_Info)
{
	npc = VLK_446_Jesper;
	nr = 10;
	condition = DIA_Jesper_Armor_Condition;
	information = DIA_Jesper_Armor_Info;
	permanent = FALSE;
	description = "Где мне найти хорошие доспехи?";
};

func int DIA_Jesper_Armor_Condition()
{
	if(IS_LOVCACH == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Jesper_Armor_Info()
{
	AI_Output(other,self,"DIA_Jesper_Armor_01_00");	//Где мне найти хорошие доспехи?
	AI_Output(self,other,"DIA_Jesper_Armor_01_01");	//Хммм...(ехидно) Ну, раз ты теперь один из нас, думаю, что я смогу тебе помочь в этом.
	AI_Output(self,other,"DIA_Jesper_Armor_01_02");	//У меня есть некоторые вещички, которые наверняка смогут тебя заинтересовать.
	AI_Output(self,other,"DIA_Jesper_Armor_01_03");	//Но, как ты понимаешь, у любой вещи есть цена.
	AI_Output(self,other,"DIA_Jesper_Armor_01_04");	//Просто так я тебе их не отдам.
	Jesper_Armor = TRUE;
	B_LogEntry_Quiet(TOPIC_ThiefTeacher,"Джеспер может продать мне воровские доспехи.");
};

var int BuyThiefArmor_01;
var int BuyThiefArmor_02;
var int BuyThiefArmor_03;
var int BuyThiefArmor_04;
var int BuyThiefArmor_05;
var int BuyThiefArmor_06;
var int BuyThiefArmor_07;

instance DIA_Jesper_TRADE(C_Info)
{
	npc = VLK_446_Jesper;
	nr = 2;
	condition = DIA_Jesper_TRADE_Condition;
	information = DIA_Jesper_TRADE_Info;
	permanent = TRUE;
	description = "Покажи, что у тебя есть.";
};

func int DIA_Jesper_TRADE_Condition()
{
	if(Jesper_Armor == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Jesper_TRADE_Info()
{
	AI_Output(other,self,"DIA_Jesper_TRADE_01_00");	//Покажи, что у тебя есть.
	AI_Output(self,other,"DIA_Jesper_TRADE_01_01");	//Ну что же, смотри. Если ты, конечно, достаточно ловок для них.
	Info_ClearChoices(DIA_Jesper_TRADE);
	Info_AddChoice(DIA_Jesper_TRADE,"Возможно, позже.",DIA_Jesper_TRADE_Back);

	if(BuyThiefHelm_01 == FALSE)
	{
		Info_AddChoice(DIA_Jesper_TRADE,"Шапка вора (Цена: 250 монет)",DIA_Jesper_TRADE_DHM);
	};
	if(BuyThiefArmor_01 == FALSE)
	{
		Info_AddChoice(DIA_Jesper_TRADE,"Доспехи ловкача (Цена: 500 монет, Необходима ловкость: 50)",DIA_Jesper_TRADE_DHT);
	};
	if((Kapitel >= 1) && (hero.guild != GIL_NONE) && (BuyThiefArmor_02 == FALSE))
	{
		Info_AddChoice(DIA_Jesper_TRADE,"Доспехи вора (Цена: 2000 монет, Необходима ловкость: 80)",DIA_Jesper_TRADE_DHT_1);
	};
	if((Kapitel >= 2) && (BuyThiefArmor_03 == FALSE))
	{
		Info_AddChoice(DIA_Jesper_TRADE,"Доспехи призрака (Цена: 3000 монет, Необходима ловкость: 120)",DIA_Jesper_TRADE_DHT_2);
	};
	if((Kapitel >= 2) && (RavenAway == TRUE) && (BuyThiefArmor_04 == FALSE))
	{
		Info_AddChoice(DIA_Jesper_TRADE,"Доспехи ночной тени (Цена: 5000 монет, Необходима ловкость: 150)",DIA_Jesper_TRADE_DHT_3);
	};
	if((Kapitel >= 3) && (BuyThiefArmor_05 == FALSE))
	{
		Info_AddChoice(DIA_Jesper_TRADE,"Доспехи мастера-вора (Цена: 8000 монет, Необходима ловкость: 180)",DIA_Jesper_TRADE_DHT_4);
	};
	if((Kapitel >= 3) && (MEETURNAZUL == TRUE) && (BuyThiefArmor_06 == FALSE))
	{
		Info_AddChoice(DIA_Jesper_TRADE,"Доспехи главаря воров (Цена: 12000 монет, Необходима ловкость: 230)",DIA_Jesper_TRADE_DHT_5);
	};
	if((Kapitel >= 4) && (BuyThiefArmor_07 == FALSE))
	{
		Info_AddChoice(DIA_Jesper_TRADE,"Доспехи короля воров (Цена: 15000 монет, Необходима ловкость: 350)",DIA_Jesper_TRADE_DHT_6);
	};
};

func void DIA_Jesper_TRADE_Back()
{
	AI_Output(other,self,"DIA_Jesper_TRADE_Back_01_00");	//Возможно, позже.
	AI_Output(self,other,"DIA_Jesper_TRADE_Back_01_01");	//Как знаешь.
	Info_ClearChoices(DIA_Jesper_TRADE);
};

func void DIA_Jesper_TRADE_DHT()
{
	AI_Output(other,self,"DIA_Jesper_TRADE_DHT_01_00");	//Дай мне доспехи ловкача.

	if(hero.attribute[ATR_DEXTERITY] >= 50)
	{
		if(B_GiveInvItems(other,self,ItMi_Gold,500))
		{
			Npc_RemoveInvItems(self,ItMi_Gold,500);
			AI_Output(self,other,"DIA_Jesper_TRADE_DHT_01_01");	//Держи! Теперь они твои.
			CreateInvItems(other,ITAR_DHT_END,1);
			BuyThiefArmor_01 = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Jesper_TRADE_DHT_01_02");	//Нет! Сначала я хочу увидеть мое золото, приятель.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Jesper_TRADE_DHT_01_03");	//Ты еще недостаточно ловок для них, приятель.
	};

	Info_ClearChoices(DIA_Jesper_TRADE);
};

func void DIA_Jesper_TRADE_DHM()
{
	AI_Output(other,self,"DIA_Jesper_TRADE_DHM_01_00");	//Дай мне шапку вора.

	if(B_GiveInvItems(other,self,ItMi_Gold,250))
	{
		Npc_RemoveInvItems(self,ItMi_Gold,250);
		AI_Output(self,other,"DIA_Jesper_TRADE_DHM_01_01");	//Держи! Теперь она твоя.
		CreateInvItems(other,ItAr_ThiefHut,1);
		BuyThiefHelm_01 = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Jesper_TRADE_DHM_01_02");	//Нет! Сначала я хочу увидеть мое золото, приятель.
	};

	Info_ClearChoices(DIA_Jesper_TRADE);
};

func void DIA_Jesper_TRADE_DHT_1()
{
	AI_Output(other,self,"DIA_Jesper_TRADE_DHT_1_01_00");	//Дай мне доспехи вора.

	if(hero.attribute[ATR_DEXTERITY] >= 80)
	{
		if(B_GiveInvItems(other,self,ItMi_Gold,2000))
		{
			AI_Output(self,other,"DIA_Jesper_TRADE_DHT_1_01_01");	//Вот! Теперь они твои.
			CreateInvItems(other,ITAR_DHT_END_1,1);
			BuyThiefArmor_02 = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Jesper_TRADE_DHT_1_01_02");	//Сначала я хочу увидеть мое золото, приятель.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Jesper_TRADE_DHT_01_03");	//Ты еще недостаточно ловок для них, приятель.
	};

	Info_ClearChoices(DIA_Jesper_TRADE);
};

func void DIA_Jesper_TRADE_DHT_2()
{
	AI_Output(other,self,"DIA_Jesper_TRADE_DHT_2_01_00");	//Дай мне доспехи призрака.

	if(hero.attribute[ATR_DEXTERITY] >= 120)
	{
		if(B_GiveInvItems(other,self,ItMi_Gold,3000))
		{
			Npc_RemoveInvItems(self,ItMi_Gold,3000);
			AI_Output(self,other,"DIA_Jesper_TRADE_DHT_2_01_01");	//Хороший выбор! Как собственно и сами доспехи.
			CreateInvItems(other,ITAR_DHT_END_2,1);
			BuyThiefArmor_03 = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Jesper_TRADE_DHT_2_01_02");	//Сначала я хочу увидеть мое золото, приятель.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Jesper_TRADE_DHT_01_03");	//Ты еще недостаточно ловок для них, приятель.
	};	

	Info_ClearChoices(DIA_Jesper_TRADE);
};

func void DIA_Jesper_TRADE_DHT_3()
{
	AI_Output(other,self,"DIA_Jesper_TRADE_DHT_3_01_00");	//Дай мне доспехи ночной тени.

	if(hero.attribute[ATR_DEXTERITY] >= 150)
	{
		if(B_GiveInvItems(other,self,ItMi_Gold,5000))
		{
			Npc_RemoveInvItems(self,ItMi_Gold,5000);
			AI_Output(self,other,"DIA_Jesper_TRADE_DHT_3_01_01");	//Отлично! В них ты будешь чувствовать себя куда более защищенным.
			CreateInvItems(other,ITAR_DHT_END_3,1);
			BuyThiefArmor_04 = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Jesper_TRADE_DHT_3_01_02");	//Сначала я хочу увидеть мое золото, приятель.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Jesper_TRADE_DHT_01_03");	//Ты еще недостаточно ловок для них, приятель.
	};

	Info_ClearChoices(DIA_Jesper_TRADE);
};

func void DIA_Jesper_TRADE_DHT_4()
{
	AI_Output(other,self,"DIA_Jesper_TRADE_DHT_4_01_00");	//Дай мне доспехи мастера воров.

	if(hero.attribute[ATR_DEXTERITY] >= 180)
	{
		if(B_GiveInvItems(other,self,ItMi_Gold,8000))
		{
			Npc_RemoveInvItems(self,ItMi_Gold,8000);
			AI_Output(self,other,"DIA_Jesper_TRADE_DHT_4_01_01");	//Превосходный выбор! Такие доспехи придутся в пору не каждому.
			CreateInvItems(other,ITAR_DHT_END_4,1);
			BuyThiefArmor_05 = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Jesper_TRADE_DHT_4_01_02");	//Сначала я хочу увидеть мое золото, приятель.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Jesper_TRADE_DHT_01_03");	//Ты еще недостаточно ловок для них, приятель.
	};

	Info_ClearChoices(DIA_Jesper_TRADE);
};

func void DIA_Jesper_TRADE_DHT_5()
{
	AI_Output(other,self,"DIA_Jesper_TRADE_DHT_5_01_00");	//Дай мне доспехи главаря воров.

	if(hero.attribute[ATR_DEXTERITY] >= 230)
	{
		if(B_GiveInvItems(other,self,ItMi_Gold,12000))
		{
			Npc_RemoveInvItems(self,ItMi_Gold,12000);
			AI_Output(self,other,"DIA_Jesper_TRADE_DHT_5_01_01");	//Не доспехи, а само произведение искусства!
			AI_Output(self,other,"DIA_Jesper_TRADE_DHT_5_01_02");	//Ведь их могут носить только самые опытные воры.
			CreateInvItems(other,ITAR_DHT_END_5,1);
			BuyThiefArmor_06 = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Jesper_TRADE_DHT_5_01_03");	//Сначала я хочу увидеть мое золото, приятель.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Jesper_TRADE_DHT_01_03");	//Ты еще недостаточно ловок для них, приятель.
	};

	Info_ClearChoices(DIA_Jesper_TRADE);
};

func void DIA_Jesper_TRADE_DHT_6()
{
	AI_Output(other,self,"DIA_Jesper_TRADE_DHT_6_01_00");	//Дай мне доспехи короля воров.

	if(hero.attribute[ATR_DEXTERITY] >= 350)
	{
		if(B_GiveInvItems(other,self,ItMi_Gold,15000))
		{
			Npc_RemoveInvItems(self,ItMi_Gold,15000);
			AI_Output(self,other,"DIA_Jesper_TRADE_DHT_5_01_01");	//Не доспехи, а само произведение искусства!
			AI_Output(self,other,"DIA_Jesper_TRADE_DHT_5_01_02");	//Ведь их могут носить только самые опытные воры.
			CreateInvItems(other,ITAR_DHT_END_6,1);
			BuyThiefArmor_07 = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Jesper_TRADE_DHT_5_01_03");	//Сначала я хочу увидеть мое золото, приятель.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Jesper_TRADE_DHT_01_03");	//Ты еще недостаточно ловок для них, приятель.
	};

	Info_ClearChoices(DIA_Jesper_TRADE);
};