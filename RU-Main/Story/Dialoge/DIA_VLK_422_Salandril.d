
instance DIA_Salandril_EXIT(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 999;
	condition = DIA_Salandril_EXIT_Condition;
	information = DIA_Salandril_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Salandril_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Salandril_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Salandril_PICKPOCKET(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 900;
	condition = DIA_Salandril_PICKPOCKET_Condition;
	information = DIA_Salandril_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(Попытаться украсть его ключ) ";
};


var int DIA_Salandril_PICKPOCKET_perm;

func int DIA_Salandril_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) >= 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (DIA_Salandril_PICKPOCKET_perm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Salandril_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Salandril_PICKPOCKET);
	Info_AddChoice(DIA_Salandril_PICKPOCKET,Dialog_Back,DIA_Salandril_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Salandril_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Salandril_PICKPOCKET_DoIt);
};

func void DIA_Salandril_PICKPOCKET_DoIt()
{
	AI_PlayAni(other,"T_STEAL");
	AI_Wait(other,1);

	if((other.attribute[ATR_DEXTERITY] + PickPocketBonusCount) >= Hlp_Random(self.attribute[ATR_DEXTERITY]))
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		}
		else
		{
			GlobalThiefCount += 1;

			if(GlobalThiefCount >= 3)
			{
				INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
				GlobalThiefCount = FALSE;
			};
		};
		CreateInvItems(self,ItKe_Salandril,1);
		B_GiveInvItems(self,other,ItKe_Salandril,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		DIA_Salandril_PICKPOCKET_perm = TRUE;
		B_GivePlayerXP(XP_Ambient);
		Info_ClearChoices(DIA_Salandril_PICKPOCKET);
	}
	else
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		};
		THIEFCATCHER = Hlp_GetNpc(self);
		HERO_CANESCAPEFROMGOTCHA = TRUE;
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		self.vars[0] = TRUE;
	};
};

func void DIA_Salandril_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Salandril_PICKPOCKET);
};


instance DIA_Salandril_Hallo(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 2;
	condition = DIA_Salandril_Hallo_Condition;
	information = DIA_Salandril_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Salandril_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_OLDWORLD != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Salandril_Hallo_Info()
{
	AI_Output(self,other,"DIA_Salandril_PERM_13_00");	//Добро пожаловать, путник. Ищешь хорошее зелье?
	AI_Output(self,other,"DIA_Salandril_PERM_13_01");	//У меня большой выбор и умеренные цены. Мои зелья лучше, чем та отрава, что продает Зурис.
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,"Саландрил торгует зельями. Его лавка находится в верхнем квартале.");
};

instance DIA_Salandril_Trade(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 9;
	condition = DIA_Salandril_Trade_Condition;
	information = DIA_Salandril_Trade_Info;
	permanent = TRUE;
	description = "Покажи мне свои товары.";
	trade = TRUE;
};


func int DIA_Salandril_Trade_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Salandril_KLOSTER) == FALSE) && Wld_IsTime(8,0,22,0))
	{
		return TRUE;
	};
};

func void DIA_Salandril_Trade_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};
	if(Npc_HasItems(self,itpo_anpois) != 3)
	{
		Npc_RemoveInvItems(self,itpo_anpois,Npc_HasItems(self,itpo_anpois));
		CreateInvItems(self,itpo_anpois,3);
	};

	AI_Output(other,self,"DIA_Salandril_Trade_15_00");	//Покажи мне свои товары.

	if((other.guild == GIL_KDF) || (other.guild == GIL_KDW))
	{
		AI_Output(self,other,"DIA_Salandril_Trade_13_01");	//С удовольствием, преподобный брат.
		if(MIS_Serpentes_MinenAnteil_KDF == LOG_Running)
		{
			SC_KnowsProspektorSalandril = TRUE;
		};
	};
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Salandril_Trade_13_02");	//С удовольствием, о, благородный воин.
	};
	if(other.guild == GIL_GUR)
	{
		AI_Output(self,other,"DIA_Salandril_Trade_13_03");	//С удовольствием!
	};

	B_GiveTradeInv(self);
};


instance DIA_Salandril_KAP3_EXIT(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 999;
	condition = DIA_Salandril_KAP3_EXIT_Condition;
	information = DIA_Salandril_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Salandril_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Salandril_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Salandril_KLOSTER(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 2;
	condition = DIA_Salandril_KLOSTER_Condition;
	information = DIA_Salandril_KLOSTER_Info;
	description = "Ты должен отправиться в монастырь, чтобы предстать перед судом.";
};

func int DIA_Salandril_KLOSTER_Condition()
{
	if((SC_KnowsProspektorSalandril == TRUE) || (MIS_Serpentes_BringSalandril_SLD == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Salandril_KLOSTER_Info()
{
	AI_Output(other,self,"DIA_Salandril_KLOSTER_15_00");	//Ты должен отправиться в монастырь, чтобы предстать перед судом.
	AI_Output(self,other,"DIA_Salandril_KLOSTER_13_01");	//Что? У тебя крыша поехала? Черта с два! У этих жалких магов нет никаких доказательств против меня.

	if((hero.guild == GIL_KDF) && (SC_KnowsProspektorSalandril == TRUE))
	{
		AI_Output(other,self,"DIA_Salandril_KLOSTER_15_02");	//А как насчет этих фальшивых акций, которыми ты наводнил всю страну? На них твоя подпись. Ты виновен.
	}
	else
	{
		AI_Output(other,self,"DIA_Salandril_KLOSTER_15_03");	//У меня есть приказ, и я выполню его. Так что, либо ты пойдешь сам, либо мне придется заставить тебя.
	};
	AI_Output(self,other,"DIA_Salandril_KLOSTER_13_04");	//Что? Да я протащу тебя через весь город за шиворот, как паршивого щенка, и вышвырну за ворота.
	CreateInvItems(self,ItKe_Salandril,1);
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

instance DIA_Salandril_GehinsKloster(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 2;
	condition = DIA_Salandril_GehinsKloster_Condition;
	information = DIA_Salandril_GehinsKloster_Info;
	description = "Так ты пойдешь в монастырь, или тебя еще раз проучить?";
};

func int DIA_Salandril_GehinsKloster_Condition()
{
	if(((SC_KnowsProspektorSalandril == TRUE) || (MIS_Serpentes_BringSalandril_SLD == LOG_Running)) && (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST) && Npc_KnowsInfo(other,DIA_Salandril_KLOSTER))
	{
		return TRUE;
	};
};

func void DIA_Salandril_GehinsKloster_Info()
{
	AI_Output(other,self,"DIA_Salandril_GehinsKloster_15_00");	//Так ты пойдешь в монастырь, или тебя еще раз проучить?
	AI_Output(self,other,"DIA_Salandril_GehinsKloster_13_01");	//Ты еще пожалеешь об этом. Да, черт тебя побери, я пойду в этот монастырь, но тебе это просто так с рук не сойдет.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"KlosterUrteil");
	MIS_Serpentes_BringSalandril_SLD = LOG_SUCCESS;

	if(MIS_SALANDRILRESECH == LOG_Running)
	{
		MIS_SALANDRILRESECH = LOG_OBSOLETE;
	};
};


instance DIA_Salandril_Verschwinde(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 2;
	condition = DIA_Salandril_Verschwinde_Condition;
	information = DIA_Salandril_Verschwinde_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Salandril_Verschwinde_Condition()
{
	if((MIS_Serpentes_BringSalandril_SLD == LOG_SUCCESS) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Salandril_Verschwinde_Info()
{
	if(MIS_SALANDRILHELP == LOG_Running)
	{
		MIS_SALANDRILHELP = LOG_FAILED;
		B_LogEntry_Failed(TOPIC_SALANDRILHELP);
	};
	B_Verschwinde_Stimme13();
	AI_StopProcessInfos(self);
};


instance DIA_Salandril_KAP4_EXIT(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 999;
	condition = DIA_Salandril_KAP4_EXIT_Condition;
	information = DIA_Salandril_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Salandril_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Salandril_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Salandril_KAP5_EXIT(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 999;
	condition = DIA_Salandril_KAP5_EXIT_Condition;
	information = DIA_Salandril_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Salandril_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Salandril_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Salandril_KAP6_EXIT(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 999;
	condition = DIA_Salandril_KAP6_EXIT_Condition;
	information = DIA_Salandril_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Salandril_KAP6_EXIT_Condition()
{
	if(Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Salandril_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SALANDRIL_RECEPTFORTYON(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 2;
	condition = dia_salandril_receptfortyon_condition;
	information = dia_salandril_receptfortyon_info;
	permanent = FALSE;
	description = "Я слышал про одно редкое зелье...";
};


func int dia_salandril_receptfortyon_condition()
{
	if((MIS_RECEPTFORTYON == LOG_Running) && (KNOWABOUTRECEPTFORTYON == FALSE) && (Npc_HasItems(other,itwr_tyonrecept) < 1))
	{
		return TRUE;
	};
};

func void dia_salandril_receptfortyon_info()
{
	AI_Output(other,self,"DIA_Salandril_ReceptForTyon_01_00");	//Я слышал про одно очень редкое зелье...
	AI_Output(other,self,"DIA_Salandril_ReceptForTyon_01_02");	//Оно некоторым образом способно воздействовать на сознание человека. Не слышал ничего про это?
	AI_Output(self,other,"DIA_Salandril_ReceptForTyon_01_03");	//Нет. Первый раз слышу про подобный эликсир.
	AI_Output(self,other,"DIA_Salandril_ReceptForTyon_01_05");	//Но, может быть, другие алхимики в городе смогут помочь тебе.
};


instance DIA_SALANDRIL_TALIASANLETTER(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 2;
	condition = dia_salandril_taliasanletter_condition;
	information = dia_salandril_taliasanletter_info;
	permanent = FALSE;
	description = "Ты можешь мне помочь?";
};


func int dia_salandril_taliasanletter_condition()
{
	if((MIS_TALIASANHELP == LOG_Running) && (MIS_Serpentes_BringSalandril_SLD != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_salandril_taliasanletter_info()
{
	AI_Output(other,self,"DIA_Salandril_TaliasanLetter_01_00");	//Ты можешь мне помочь?
	AI_Output(self,other,"DIA_Salandril_TaliasanLetter_01_01");	//А в чем дело?
	AI_Output(other,self,"DIA_Salandril_TaliasanLetter_01_02");	//Мне очень необходимо, чтобы ты написал для меня одно рекомендательное письмо.
	AI_Output(self,other,"DIA_Salandril_TaliasanLetter_01_03");	//О! (смеется) Похоже, ты подыскал себе работенку, и там от тебя требуют хороших рекомендаций, да?
	AI_Output(other,self,"DIA_Salandril_TaliasanLetter_01_06");	//Ты меня немного не понял. Мне нужно письмо, в котором буду рекомендован не я, а другой человек.
	AI_Output(self,other,"DIA_Salandril_TaliasanLetter_01_07");	//И кто это, если не секрет?
	AI_Output(other,self,"DIA_Salandril_TaliasanLetter_01_08");	//Этого человека зовут Галлахад.
	AI_Output(self,other,"DIA_Salandril_TaliasanLetter_01_13");	//А кому я должен рекомендовать его?
	AI_Output(other,self,"DIA_Salandril_TaliasanLetter_01_14");	//Письмо должно быть адресовано Лариусу.
	AI_Output(self,other,"DIA_Salandril_TaliasanLetter_01_20");	//(задумался) Ну хорошо, я напишу для Галлахада это письмо.
	AI_Output(self,other,"DIA_Salandril_TaliasanLetter_01_21");	//Однако прежде ты должен будешь оказать мне небольшую услугу.
	AI_Output(self,other,"DIA_Salandril_TaliasanLetter_01_24");	//Достань для меня образец одного редкого зелья - и считай, что письмо у тебя в кармане.
	AI_Output(other,self,"DIA_Salandril_TaliasanLetter_01_32");	//Какое зелье тебе нужно?
	AI_Output(self,other,"DIA_Salandril_TaliasanLetter_01_33");	//Я предполагаю, что этим зельем пользуются орки, чтобы повышать свою силу и выносливость.
	AI_Output(self,other,"DIA_Salandril_TaliasanLetter_01_34");	//Поэтому, думаю, достать его будет можно только у одного из них.
	AI_Output(other,self,"DIA_Salandril_TaliasanLetter_01_38");	//Хорошо, я постараюсь найти этот напиток.
	AI_Output(self,other,"DIA_Salandril_TaliasanLetter_01_39");	//Я тут слышал от одного охотника, что какого-то орка видели недалеко от города. Кажется, в том месте была еще пещера.
	AI_Output(self,other,"DIA_Salandril_TaliasanLetter_01_40");	//Возможно, эта информация будет полезна в твоих поисках.
	Wld_InsertNpc(orcwarrior_salandril,"NW_CITY_SMFOREST_03_M");
	MIS_SALANDRILHELP = LOG_Running;
	Log_CreateTopic(TOPIC_SALANDRILHELP,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SALANDRILHELP,LOG_Running);
	B_LogEntry(TOPIC_SALANDRILHELP,"Саландрил напишет рекомендательное письмо для Галлахада, если я принесу ему орочье зелье. По его словам, недалеко от города видели одного орка. Возможно, у него окажется при себе необходимый мне напиток.");
	AI_StopProcessInfos(self);
};


instance DIA_SALANDRIL_GIVEPOTION(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 2;
	condition = dia_salandril_givepotion_condition;
	information = dia_salandril_givepotion_info;
	permanent = FALSE;
	description = "Я принес тебе орочье зелье.";
};


func int dia_salandril_givepotion_condition()
{
	if((MIS_TALIASANHELP == LOG_Running) && (MIS_SALANDRILHELP == LOG_Running) && (MIS_Serpentes_BringSalandril_SLD != LOG_SUCCESS) && (Npc_HasItems(other,itpo_xorcpotion) >= 1))
	{
		return TRUE;
	};
};

func void dia_salandril_givepotion_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Salandril_GivePotion_01_00");	//Я принес тебе орочье зелье.
	AI_Output(self,other,"DIA_Salandril_GivePotion_01_01");	//Правда? Покажи!
	AI_Output(other,self,"DIA_Salandril_GivePotion_01_02");	//Вот. Как ты и говорил, оно было у одного из орков.
	B_GiveInvItems(other,self,itpo_xorcpotion,1);
	Npc_RemoveInvItems(self,itpo_xorcpotion,1);
	AI_Output(self,other,"DIA_Salandril_GivePotion_01_03");	//Отлично! Наконец-то я смогу изучить его состав!
	AI_Output(other,self,"DIA_Salandril_GivePotion_01_04");	//А что насчет письма?
	AI_Output(self,other,"DIA_Salandril_GivePotion_01_05");	//Ах да. Вот, держи.
	B_GiveInvItems(self,other,itwr_salandrilletter,1);
	AI_Output(self,other,"DIA_Salandril_GivePotion_01_09");	//А теперь мне пора изучать этот эликсир.
	MIS_SALANDRILHELP = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_SALANDRILHELP,LOG_SUCCESS);
	B_LogEntry(TOPIC_SALANDRILHELP,"Я принес Саландрилу орочье зелье. Он был вне себя от счастья, и едва не забыл отдать мне рекомендательное письмо для Галлахада.");
	AI_StopProcessInfos(self);
};

instance DIA_SALANDRIL_ORCRUM(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 2;
	condition = dia_salandril_orcrum_condition;
	information = dia_salandril_orcrum_info;
	permanent = FALSE;
	description = "Посмотри, что у меня есть.";
};

func int dia_salandril_orcrum_condition()
{
	if((MIS_TALIASANHELP == LOG_SUCCESS) && (MIS_SALANDRILHELP == LOG_SUCCESS) && (MIS_Serpentes_BringSalandril_SLD != LOG_SUCCESS) && (Npc_HasItems(other,itfo_addon_orcrum) >= 1))
	{
		return TRUE;
	};
};

func void dia_salandril_orcrum_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Salandril_ORCRUM_01_00");	//Посмотри, что у меня есть. Какое-то орочье пойло. Ты знаешь, что с ним можно сделать?
	B_GiveInvItems(other,self,itfo_addon_orcrum,1);
	Npc_RemoveInvItems(self,itfo_addon_orcrum,1);
	AI_Output(self,other,"DIA_Salandril_ORCRUM_01_01");	//Такого я еще не встречал. Оставь зелье у меня и приходи через пару дней. Мне нужно время на исследования.
	ORCRUMDAY = Wld_GetDay();
	MIS_SALANDRILRESECH = LOG_Running;
	Log_CreateTopic(TOPIC_SALANDRILRESECH,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SALANDRILRESECH,LOG_Running);
	B_LogEntry(TOPIC_SALANDRILRESECH,"Саландрил попробует исследовать орочье пойло на предмет практического применения. Через пару дней будет известен результат.");
};


instance DIA_SALANDRIL_ORCRUM2(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 2;
	condition = dia_salandril_orcrum2_condition;
	information = dia_salandril_orcrum2_info;
	permanent = FALSE;
	description = "Как исследования?";
};

func int dia_salandril_orcrum2_condition()
{
	if((MIS_SALANDRILRESECH == LOG_Running) && (ORCRUMDAY < (Wld_GetDay() - 1)))
	{
		return TRUE;
	};
};

func void dia_salandril_orcrum2_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_Salandril_ORCRUM2_01_00");	//Как исследования?
	AI_Output(self,other,"DIA_Salandril_ORCRUM2_01_01");	//Зелья оказалось очень мало, и мне его хватило только на начальные опыты.
	AI_Output(self,other,"DIA_Salandril_ORCRUM2_01_02");	//Но очевидно, что оно обладает интересными и уникальными свойствами, раскрыть которые можно только продолжив исследования.
	AI_Output(other,self,"DIA_Salandril_ORCRUM2_01_04");	//Ты хочешь сказать, что мне надо принести тебе еще этого пойла для экспериментов?
	AI_Output(self,other,"DIA_Salandril_ORCRUM2_01_05");	//Ты правильно понял. Если принесешь мне десять бутылок этого пойла, я продолжу исследования.
	SALFIRST = TRUE;
	B_LogEntry(TOPIC_SALANDRILRESECH,"Саландрил хочет получить десять бутылок орочьего пойла для исследований.");
};


instance DIA_SALANDRIL_ORCRUM3(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 2;
	condition = dia_salandril_orcrum3_condition;
	information = dia_salandril_orcrum3_info;
	permanent = FALSE;
	description = "Я принес десять бутылок пойла.";
};

func int dia_salandril_orcrum3_condition()
{
	if((MIS_SALANDRILRESECH == LOG_Running) && (SALFIRST == TRUE) && (Npc_HasItems(other,itfo_addon_orcrum) >= 10))
	{
		return TRUE;
	};
};

func void dia_salandril_orcrum3_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Salandril_ORCRUM3_01_00");	//Я принес десять бутылок пойла.
	B_GiveInvItems(other,self,itfo_addon_orcrum,10);
	Npc_RemoveInvItems(self,itfo_addon_orcrum,10);
	AI_Output(self,other,"DIA_Salandril_ORCRUM3_01_01");	//Прекрасно! Значит, я могу продолжить свои исследования.
	AI_Output(self,other,"DIA_Salandril_ORCRUM3_01_03");	//Зайди ко мне как-нибудь потом, может, появятся новости.
	SALANDRILRESECHPOTION = Wld_GetDay();
	B_LogEntry(TOPIC_SALANDRILRESECH,"Саландрил получил десять бутылок пойла для исследований. Пока можно заняться своими делами.");
};


instance DIA_SALANDRIL_ORCRUM4(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 2;
	condition = dia_salandril_orcrum4_condition;
	information = dia_salandril_orcrum4_info;
	permanent = TRUE;
	description = "Как исследования?";
};

func int dia_salandril_orcrum4_condition()
{
	if((MIS_SALANDRILRESECH == LOG_Running) && (SALANDRILRESECHPOTION != FALSE))
	{
		return TRUE;
	};
};

func void dia_salandril_orcrum4_info()
{
	AI_Output(other,self,"DIA_Salandril_ORCRUM4_01_00");	//Как исследования?

	if((Kapitel >= 2) && (SALANDRILRESECHPOTION <= (Wld_GetDay() - 2)))
	{
		B_GivePlayerXP(250);
		AI_Output(self,other,"DIA_Salandril_ORCRUM4_01_01");	//Я сделал открытие...
		AI_Output(self,other,"DIA_Salandril_ORCRUM4_01_02");	//Я могу сделать зелье с очень интересными свойствами из орочьего пойла!
		AI_Output(self,other,"DIA_Salandril_ORCRUM4_01_03");	//Для одной бутылки зелья мне понадобятся десять бутылок орочьего пойла и триста золотых. И учти, что эта цена со скидкой - только для тебя!
		CanMakeSimpleOrcPotion = TRUE;
		MIS_SALANDRILRESECH = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_SALANDRILRESECH,LOG_SUCCESS);
		B_LogEntry(TOPIC_SALANDRILRESECH,"Саландрил закончил свои исследования. Теперь он может приготовить мне новое зелье. Правда, мне понадобится еще десять бутылок этого орочьего пойла и триста золотых за работу.");
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Salandril_ORCRUM4_01_09");	//Лучше не отрывай меня от работы! Зайди через пару дней.
	};
};

instance DIA_SALANDRIL_ORCRUM5(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 2;
	condition = dia_salandril_orcrum5_condition;
	information = dia_salandril_orcrum5_info;
	permanent = FALSE;
	description = "Приготовь мне то зелье. (Цена: 300 монет)";
};

func int dia_salandril_orcrum5_condition()
{
	if((CanMakeSimpleOrcPotion == TRUE) && (Npc_HasItems(other,itfo_addon_orcrum) >= 10) && (SalPotionOneTime == FALSE))
	{
		return TRUE;
	};
};

func void dia_salandril_orcrum5_info()
{
	AI_Output(other,self,"DIA_Salandril_ORCRUM51_01_00");	//Приготовь мне то зелье.

	if(Npc_HasItems(other,ItMi_Gold) >= 300)
	{
		B_GiveInvItems(other,self,itfo_addon_orcrum,10);
		Npc_RemoveInvItems(self,itfo_addon_orcrum,10);
		Npc_RemoveInvItems(other,ItMi_Gold,300);
		AI_Output(self,other,"DIA_Salandril_ORCRUM51_01_01");	//Значит, ты решился попробовать. Отлично! Заходи завтра, зелье будет готово.
		ORCRUMDAY4 = Wld_GetDay();
	}
	else
	{
		AI_Print(Print_NotEnoughGold);
		AI_Output(self,other,"DIA_Salandril_ORCRUM51_03_90");	//У тебя не хватает золота!
		AI_StopProcessInfos(self);
	};
};

instance DIA_SALANDRIL_ORCRUM6(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 2;
	condition = dia_salandril_orcrum6_condition;
	information = dia_salandril_orcrum6_info;
	permanent = FALSE;
	description = "Мое зелье готово?";
};

func int dia_salandril_orcrum6_condition()
{
	var int DaySNow;

	DaySNow = Wld_GetDay();

	if((CanMakeSimpleOrcPotion == TRUE) && (ORCRUMDAY4 < DaySNow) && (ORCRUMDAY4 > 0))
	{
		return TRUE;
	};
};

func void dia_salandril_orcrum6_info()
{
	AI_Output(other,self,"DIA_Salandril_ORCRUM6_01_00");	//Мое зелье готово?
	AI_Output(self,other,"DIA_Salandril_ORCRUM6_01_01");	//Да. Вот, держи.
	B_GiveInvItems(self,other,itfo_addon_orcrumsal,1);
	AI_Output(self,other,"DIA_Salandril_ORCRUM6_01_02");	//Только эффект от его применения может быть довольно необычный. И за последствия я не отвечаю!
	SalPotionOneTime = TRUE;
};

instance DIA_SALANDRIL_MyBrew(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 2;
	condition = dia_salandril_MyBrew_condition;
	information = dia_salandril_MyBrew_info;
	permanent = FALSE;
	description = "Можешь взглянуть на один алхимический рецепт?";
};

func int dia_salandril_MyBrew_condition()
{
	if((MIS_MyBrew == LOG_Running) && (MIS_Serpentes_BringSalandril_SLD != LOG_SUCCESS) && (Npc_HasItems(other,ItWr_ConstRecept) >= 1) && (FTConsPotion == TRUE) && (KnowFakeRecept == FALSE))
	{
		return TRUE;
	};
};

func void dia_salandril_MyBrew_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Salandril_MyBrew_01_00");	//Можешь взглянуть на один алхимический рецепт?
	AI_Output(self,other,"DIA_Salandril_MyBrew_01_01");	//Конечно! Давай его сюда.
	AI_Output(other,self,"DIA_Salandril_MyBrew_01_02");	//Вот, держи.
	B_GiveInvItems(other,self,ItWr_ConstRecept,1);
	AI_Output(self,other,"DIA_Salandril_MyBrew_01_03");	//Так, что тут у нас...
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Salandril_MyBrew_01_04");	//Хммм...(задумчиво) И какой же болван писал это?!
	AI_Output(other,self,"DIA_Salandril_MyBrew_01_05");	//В смысле?
	AI_Output(self,other,"DIA_Salandril_MyBrew_01_06");	//Те ингредиенты, что тут перечислены, абсолютно несовместимы друг с другом.
	AI_Output(self,other,"DIA_Salandril_MyBrew_01_07");	//Мало того, некоторые из них вообще никогда не используются в алхимии. Бред какой-то!
	B_GiveInvItems(self,other,ItWr_ConstRecept,1);
	AI_Output(self,other,"DIA_Salandril_MyBrew_01_08");	//Так кто же это все-таки писал?
	AI_Output(other,self,"DIA_Salandril_MyBrew_01_09");	//Тебе лучше не знать.
	AI_Output(self,other,"DIA_Salandril_MyBrew_01_10");	//Ладно, не хочешь - не говори...(посмеиваясь) Но этому парню точно надо сменить род занятий!
	AI_Output(self,other,"DIA_Salandril_MyBrew_01_11");	//Алхимик из него просто никудышный.
	KnowFakeRecept = TRUE;
	B_LogEntry(TOPIC_MyBrew,"Я показал Саландрилу алхимический рецепт, который дал мне Константино. Похоже, что он просто пытался надуть меня с ним, ибо этот рецепт совершенно бесполезен для настоящего алхимика.");
};

instance DIA_SALANDRIL_PureElixir(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 2;
	condition = dia_salandril_PureElixir_condition;
	information = dia_salandril_PureElixir_info;
	permanent = FALSE;
	description = "Ватрас хочет сделать заказ на эликсиры чистой магической энергии.";
};

func int dia_salandril_PureElixir_condition()
{
	if((MIS_VatrasPotion == LOG_Running) && (Npc_HasItems(other,ItMi_Gold) >= 200))
	{
		return TRUE;
	};
};

func void dia_salandril_PureElixir_info()
{
	AI_Output(other,self,"DIA_Salandril_PureElixir_01_00");	//Ватрас, маг Воды, хочет сделать тебе заказ на эликсиры чистой магической энергии.
	AI_Output(other,self,"DIA_Salandril_PureElixir_01_01");	//Вот двести золотых, которые он передает тебе в качестве аванса за работу.
	B_GiveInvItems(other,self,ItMi_Gold,200);
	Npc_RemoveInvItems(self,ItMi_Gold,200);
	AI_Output(self,other,"DIA_Salandril_PureElixir_01_02");	//Конечно...(с уважением) Для меня большая честь выполнить этот заказ.
	AI_Output(self,other,"DIA_Salandril_PureElixir_01_03");	//Однако формула этого зелья слишком сложна, поэтому на выполнение заказа у меня уйдет не меньше недели.
	AI_Output(self,other,"DIA_Salandril_PureElixir_01_04");	//Мне бы, конечно, не хотелось расстраивать многоуважаемого Ватраса, но, к сожалению, быстрее не получится.
	AI_Output(other,self,"DIA_Salandril_PureElixir_01_05");	//Ладно. Так ему и передам.
	AI_Output(self,other,"DIA_Salandril_PureElixir_01_06");	//Эм-м, погоди немного...(суетливо) Кажется, у меня тут оставались небольшие запасы этого эликсира.
	AI_Output(self,other,"DIA_Salandril_PureElixir_01_07");	//Ах, да, вот они. Тут пара зелий на случай того, если вдруг они у него закончатся.
	B_GiveInvItems(self,other,ItPo_Mana_Addon_04,2);
	AI_Output(self,other,"DIA_Salandril_PureElixir_01_08");	//Передай ему их с моими наилучшими пожеланиями! Не забудешь?
	AI_Output(other,self,"DIA_Salandril_PureElixir_01_09");	//Само собой.
	SalandrilPureElixir = TRUE;
	B_LogEntry(TOPIC_VatrasPotion,"Саландрил принял заказ от Ватраса, однако сказал, что на его выполнение уйдет не меньше недели. Вдобавок он дал мне пару эликсиров из своих запасов, чтобы я передал их Ватрасу.");
};

//------------------------------------------кости-------------------------------------

instance DIA_VLK_422_Salandril_Game(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 3;
	condition = DIA_VLK_422_Salandril_Game_condition;
	information = DIA_VLK_422_Salandril_Game_info;
	description = "Кардиф сказал, что ты играешь в кости.";
};

func int DIA_VLK_422_Salandril_Game_condition()
{
	if(Npc_KnowsInfo(other,DIA_Salandril_Hallo) && (GameOtherPlayers == TRUE))
	{
		return TRUE;
	};
};

func void DIA_VLK_422_Salandril_Game_info()
{
 	AI_Output(other,self,"DIA_VLK_422_Salandril_Game_01_00"); //Кардиф сказал, что ты играешь в кости.
 	AI_Output(self,other,"DIA_VLK_422_Salandril_Game_01_01"); //Да, он прав. Но не с кем попало!
 	AI_Output(other,self,"DIA_VLK_422_Salandril_Game_01_02"); //А со мной станешь играть?
 	AI_Output(self,other,"DIA_VLK_422_Salandril_Game_01_03"); //С тобой? Хочешь сказать, что кое-что смылишь в этом?
 	AI_Output(other,self,"DIA_VLK_422_Salandril_Game_01_04"); //Давай сыграем - и узнаешь.
 	AI_Output(self,other,"DIA_VLK_422_Salandril_Game_01_05"); //Ну хорошо. Будь по-твоему.
	SalandrilPlayResult = 250;
	Menu_WriteInt("AST","SysTimer02",0);
};

instance DIA_VLK_422_Salandril_GamePlay(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 900;
	condition = DIA_VLK_422_Salandril_GamePlay_condition;
	information = DIA_VLK_422_Salandril_GamePlay_info;
	permanent = TRUE;
	description = "Сыграем в кости!";
};

func int DIA_VLK_422_Salandril_GamePlay_condition()
{
	if((Npc_KnowsInfo(other,DIA_VLK_422_Salandril_Game) == TRUE) && (Mount_Up == FALSE) && (FlyCarpetIsOn == FALSE))
	{
		return TRUE;
	};
};

func void DIA_VLK_422_Salandril_GamePlay_info()
{
	var int DayNow;

	DayNow = Wld_GetDay();
	CheckLastGame = Menu_ReadInt("AST","SysTimer02");

	if(CheckLastGame >= SalandrilPlayResult)
	{
		CheckLastSum = CheckLastGame - SalandrilPlayResult;
	};

	AI_Output(other,self,"DIA_VLK_422_Salandril_GamePlay_01_00");	//Сыграем в кости!

	if(SalandrilPlayResult >= CheckLastGame)
	{
		if((SalandrilPlayResult > 0) && (SalandrilDayFlag == FALSE))
		{
			AI_Output(self,other,"DIA_VLK_422_Salandril_GamePlay_01_01");	//Само собой. Начнем!
			PlayPocker(1,self);
		}
		else
		{
			if(SalandrilDayFlag == FALSE)
			{
				AI_Output(self,other,"DIA_VLK_422_Salandril_GamePlay_01_02");	//Нет, довольно! Ты и так обчистил почти весь мой кошелек. 
				SalandrilDayPlay = Wld_GetDay();
				SalandrilDayFlag = TRUE;
			}
			else
			{
				AI_Output(self,other,"DIA_VLK_422_Salandril_GamePlay_01_03");	//Забудь об этом.
			};
		};
	}
	else
	{
		AI_Output(self,other,"DIA_VLK_422_Salandril_GamePlay_01_04");	//В прошлый раз ты не отдал мне мой выигрыш.
		AI_Output(self,other,"DIA_VLK_422_Salandril_GamePlay_01_05");	//Ну же, я жду!
		Info_ClearChoices(DIA_VLK_422_Salandril_GamePlay);

		if(Npc_HasItems(other,ItMi_Gold) >= CheckLastSum)
		{
			Info_AddChoice(DIA_VLK_422_Salandril_GamePlay,"Вот твои деньги.",DIA_VLK_422_Salandril_GamePlay_Here);
		};

		Info_AddChoice(DIA_VLK_422_Salandril_GamePlay,"У меня нет столько денег.",DIA_VLK_422_Salandril_GamePlay_No);
	};
};

func void DIA_VLK_422_Salandril_GamePlay_Here()
{
	Snd_Play("Geldbeutel");
	Npc_RemoveInvItems(hero,ItMi_Gold,CheckLastSum);
	SalandrilPlayResult = CheckLastGame;
	AI_Output(other,self,"DIA_VLK_422_Salandril_GamePlay_Here_01_01");	//Вот твои деньги.
	AI_Output(self,other,"DIA_VLK_422_Salandril_GamePlay_Here_01_02");	//Славно! Теперь можно поиграть...
	PlayPocker(1,self);
};

func void DIA_VLK_422_Salandril_GamePlay_No()
{
	AI_Output(other,self,"DIA_VLK_422_Salandril_GamePlay_No_01_01");	//У меня нет столько денег.
	AI_Output(self,other,"DIA_VLK_422_Salandril_GamePlay_No_01_02");	//Это не мои проблемы.
	Info_ClearChoices(DIA_VLK_422_Salandril_GamePlay);
};

instance DIA_VLK_422_Salandril_GameEnd(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 3;
	condition = DIA_VLK_422_Salandril_GameEnd_condition;
	information = DIA_VLK_422_Salandril_GameEnd_info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_VLK_422_Salandril_GameEnd_condition()
{
	if((MustTellResult_Salandril == TRUE) && ((SalandrilLost == TRUE) || (SalandrilWon == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_VLK_422_Salandril_GameEnd_info()
{
	if(SalandrilLost == TRUE)
	{
		AI_Output(self,other,"DIA_VLK_422_Salandril_GameEnd_00");	//И как это у тебя получается делать? Ума не приложу.
		SalandrilLost = FALSE;
	}
	else if(SalandrilWon == TRUE)
	{
		AI_Output(self,other,"DIA_VLK_422_Salandril_GameEnd_01");	//В этот раз фортуна была на мой стороне, приятель.
		SalandrilWon = FALSE;
	};

	MustTellResult_Salandril = FALSE;
};

instance DIA_Fernando_Minental(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 2;
	condition = DIA_Fernando_Minental_Condition;
	information = DIA_Fernando_Minental_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Fernando_Minental_Condition()
{
	if((MIS_OLDWORLD == LOG_Running) && (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_Fernando_Minental_Info()
{
	AI_Output(self,other,"DIA_Fernando_Minental_14_00");	//Эй, ты - подожди минутку. Ты ведь направляешься в Долину Рудников, да?
	AI_Output(other,self,"DIA_Fernando_Minental_15_01");	//И?
	AI_Output(self,other,"DIA_Fernando_Minental_14_02");	//Я хочу предложить тебе сделку. Ты приносишь мне доклад о том, что там происходит с рудой, а за это я дам тебе...

	if((other.guild == GIL_KDF) || (other.guild == GIL_GUR) || (other.guild == GIL_KDM) || (other.guild == GIL_KDW))
	{
		AI_Output(self,other,"DIA_Fernando_Minental_14_03");	//...рунный камень.
	}
	else
	{
		AI_Output(self,other,"DIA_Fernando_Minental_14_04");	//...кольцо, которое повысит твою жизненную энергию.
	};

	AI_Output(other,self,"DIA_Fernando_Minental_15_05");	//Я посмотрю, что можно сделать.
	MIS_SalandrilOre = LOG_Running;
	Log_CreateTopic(TOPIC_Fernando,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Fernando,LOG_Running);
	B_LogEntry(TOPIC_Fernando,"Алхимик Саландрил хочет знать, как обстоят дела с рудой в Долине Рудников.");
};

instance DIA_Fernando_Success(C_Info)
{
	npc = VLK_422_Salandril;
	nr = 5;
	condition = DIA_Fernando_Success_Condition;
	information = DIA_Fernando_Success_Info;
	permanent = FALSE;
	description = "Я был в Долине Рудников.";
};

func int DIA_Fernando_Success_Condition()
{
	if((MIS_SalandrilOre == LOG_Running) && (MIS_ScoutMine == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Fernando_Success_Info()
{
	B_GivePlayerXP(XP_Ambient);
	AI_Output(other,self,"DIA_Fernando_Success_15_00");	//Я был в Долине Рудников.
	AI_Output(self,other,"DIA_Fernando_Success_14_01");	//И? Как там обстоят дела?
	AI_Output(other,self,"DIA_Fernando_Success_15_02");	//Шахты истощены, там можно добыть всего каких-нибудь несколько ящиков руды. Вряд ли эта овчинка стоит выделки.
	AI_Output(self,other,"DIA_Fernando_Success_14_03");	//Этого не может быть! Это означает, что я разорен...
	AI_Output(other,self,"DIA_Fernando_Success_15_04");	//А как наша сделка?
	AI_Output(self,other,"DIA_Fernando_Success_14_05");	//Ну, что касается вознаграждения...

	if((other.guild == GIL_KDF) || (other.guild == GIL_GUR) || (other.guild == GIL_KDM) || (other.guild == GIL_KDW))
	{
		AI_Output(self,other,"DIA_Fernando_Minental_14_06");	//Вот, держи этот рунный камень.
		B_GiveInvItems(self,other,ItMi_RuneBlank,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Fernando_Minental_14_07");	//Вот твое кольцо.
		B_GiveInvItems(self,other,ItRi_Hp_02,1);
	};

	MIS_SalandrilOre = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_Fernando,LOG_SUCCESS);
	B_LogEntry(TOPIC_Fernando,"Я рассказал о ситуации в Долине Рудников алхимику Саландрилу. Странно, что эти новости его очень огорчили...");
};