
instance DIA_VLK_989_REINAR_EXIT(C_Info)
{
	npc = vlk_989_reinar;
	nr = 999;
	condition = dia_vlk_989_reinar_exit_condition;
	information = dia_vlk_989_reinar_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_vlk_989_reinar_exit_condition()
{
	return TRUE;
};

func void dia_vlk_989_reinar_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_REINAR_PICKPOCKET(C_Info)
{
	npc = vlk_989_reinar;
	nr = 998;
	condition = DIA_REINAR_PICKPOCKET_Condition;
	information = DIA_REINAR_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int DIA_REINAR_PICKPOCKET_Condition()
{
	return C_Beklauen(18,10);
};

func void DIA_REINAR_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_REINAR_PICKPOCKET);
	Info_AddChoice(DIA_REINAR_PICKPOCKET,Dialog_Back,DIA_REINAR_PICKPOCKET_BACK);
	Info_AddChoice(DIA_REINAR_PICKPOCKET,DIALOG_PICKPOCKET,DIA_REINAR_PICKPOCKET_DoIt);
};

func void DIA_REINAR_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_REINAR_PICKPOCKET);
};

func void DIA_REINAR_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_REINAR_PICKPOCKET);
};

instance DIA_VLK_989_REINAR_NO_TALK(C_Info)
{
	npc = vlk_989_reinar;
	nr = 1;
	condition = dia_vlk_989_reinar_no_talk_condition;
	information = dia_vlk_989_reinar_no_talk_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_vlk_989_reinar_no_talk_condition()
{
	if((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_vlk_989_reinar_no_talk_info()
{
	B_Say(self,other,"$SPAREME");
	B_Say(self,other,"$NEVERENTERROOMAGAIN");
	AI_StopProcessInfos(self);
};


instance DIA_VLK_989_REINAR_MEET(C_Info)
{
	npc = vlk_989_reinar;
	nr = 1;
	condition = dia_vlk_989_reinar_meet_condition;
	information = dia_vlk_989_reinar_meet_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_vlk_989_reinar_meet_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_vlk_989_reinar_meet_info()
{
	AI_Output(self,other,"DIA_VLK_989_Reinar_Meet_01_00");	//Эй, молодой человек! Вы что-то ищете?
	AI_Output(self,other,"DIA_VLK_989_Reinar_Meet_01_01");	//Если да, то тогда вы обратились по адресу! Я именно тот человек, который вам нужен.
};


instance DIA_VLK_989_REINAR_HELLO(C_Info)
{
	npc = vlk_989_reinar;
	nr = 2;
	condition = dia_vlk_989_reinar_hello_condition;
	information = dia_vlk_989_reinar_hello_info;
	permanent = FALSE;
	description = "Кто ты?";
};


func int dia_vlk_989_reinar_hello_condition()
{
	return TRUE;
};

func void dia_vlk_989_reinar_hello_info()
{
	AI_Output(other,self,"DIA_VLK_989_Reinar_Hello_01_00");	//Кто ты?
	AI_Output(self,other,"DIA_VLK_989_Reinar_Hello_01_01");	//Мое имя Рейнар и я, как вы, конечно, уже догадались, немного подзарабатываю на перепродаже оружия паладинам.
	AI_Output(self,other,"DIA_VLK_989_Reinar_Hello_01_02");	//Правда, я занимаюсь только исключительно редкими и крайне дорогими экземплярами, а не тем хламом, что продают на торговой площади.
	AI_Output(other,self,"DIA_VLK_989_Reinar_Hello_01_03");	//Ты покупаешь оружие?
	AI_Output(self,other,"DIA_VLK_989_Reinar_Hello_01_04");	//Конечно! Так что если вдруг молодой человек найдет какой-нибудь редкий меч или кинжал - приносите его, пожалуйста, мне.
	AI_Output(self,other,"DIA_VLK_989_Reinar_Hello_01_05");	//Не сомневайтесь, я дам за него самую хорошую цену!
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader,"Рейнар покупает редкие и уникальные виды холодного оружия для паладинов по хорошей цене.");
};


instance DIA_VLK_989_REINAR_SELLWEAPON(C_Info)
{
	npc = vlk_989_reinar;
	nr = 1;
	condition = dia_vlk_989_reinar_sellweapon_condition;
	information = dia_vlk_989_reinar_sellweapon_info;
	permanent = TRUE;
	description = "У меня есть редкое оружие на продажу.";
};

func int dia_vlk_989_reinar_sellweapon_condition()
{
	if((c_schasrareweapons() == TRUE) && Npc_KnowsInfo(other,dia_vlk_989_reinar_hello))
	{
		return TRUE;
	};
};

func void dia_vlk_989_reinar_sellweapon_info()
{
	var C_Item EquipWeap;
	EquipWeap = Npc_GetEquippedMeleeWeapon(other);
	AI_Output(other,self,"DIA_VLK_989_Reinar_SellWeapon_01_00");	//У меня есть редкое оружие на продажу.
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_01");	//Отлично! Тогда давайте посмотрим на него.
	Info_ClearChoices(dia_vlk_989_reinar_sellweapon);
	Info_AddChoice(dia_vlk_989_reinar_sellweapon,Dialog_Back,dia_vlk_989_reinar_sellweapon_back);

	if((Hlp_IsItem(EquipWeap,ItMw_Morgenstern) == FALSE) && (Npc_HasItems(other,ItMw_Morgenstern) >= 1))
	{
		Info_AddChoice(dia_vlk_989_reinar_sellweapon,"'Утренняя звезда' - 150 монет",dia_vlk_989_reinar_sellweapon_Morgenstern);
	};
	if((Hlp_IsItem(EquipWeap,ItMw_Inquisitor) == FALSE) && (Npc_HasItems(other,ItMw_Inquisitor) >= 1))
	{
		Info_AddChoice(dia_vlk_989_reinar_sellweapon,"'Инквизитор' - 200 монет",dia_vlk_989_reinar_sellweapon_Inquisitor);
	};
	if((Hlp_IsItem(EquipWeap,ItMw_Rabenschnabel) == FALSE) && (Npc_HasItems(other,ItMw_Rabenschnabel) >= 1))
	{
		Info_AddChoice(dia_vlk_989_reinar_sellweapon,"'Ночь ворона' - 200 монет",dia_vlk_989_reinar_sellweapon_Rabenschnabel);
	};
	if((Hlp_IsItem(EquipWeap,ITMW_2H_MACE_107) == FALSE) && (Npc_HasItems(other,ITMW_2H_MACE_107) >= 1))
	{
		Info_AddChoice(dia_vlk_989_reinar_sellweapon,"'Крушитель' - 250 монет",dia_vlk_989_reinar_sellweapon_Crusher);
	};
	if((Hlp_IsItem(EquipWeap,ItMw_2H_Volebir) == FALSE) && (Npc_HasItems(other,ItMw_2H_Volebir) >= 1))
	{
		Info_AddChoice(dia_vlk_989_reinar_sellweapon,"'Дробильщик костей' - 400 монет",dia_vlk_989_reinar_sellweapon_Volebir);
	};
	if((Hlp_IsItem(EquipWeap,ItMw_2H_IceHammer) == FALSE) && (Npc_HasItems(other,ItMw_2H_IceHammer) >= 1))
	{
		Info_AddChoice(dia_vlk_989_reinar_sellweapon,"'Ледяной молот' - 700 монет",dia_vlk_989_reinar_sellweapon_IceHammer);
	};
	if((Hlp_IsItem(EquipWeap,ItMw_1H_MolagBarMace) == FALSE) && (Npc_HasItems(other,ItMw_1H_MolagBarMace) >= 1))
	{
		Info_AddChoice(dia_vlk_989_reinar_sellweapon,"'Годендар' - 250 монет",dia_vlk_989_reinar_sellweapon_MolagBarMace);
	};
	if((Hlp_IsItem(EquipWeap,ItMw_2H_SharpTeeth) == FALSE) && (Npc_HasItems(other,ItMw_2H_SharpTeeth) >= 1))
	{
		Info_AddChoice(dia_vlk_989_reinar_sellweapon,"'Острошип' - 500 монет",dia_vlk_989_reinar_sellweapon_SharpTeeth);
	};
	if((Hlp_IsItem(EquipWeap,ItMw_Drakesaebel) == FALSE) && (Npc_HasItems(other,ItMw_Drakesaebel) >= 1))
	{
		Info_AddChoice(dia_vlk_989_reinar_sellweapon,"'Сабля капитана Дрейка' - 300 монет",dia_vlk_989_reinar_sellweapon_Drake);
	};
	if((Hlp_IsItem(EquipWeap,ITMW_1H_SWORD_LONG_05) == FALSE) && (Npc_HasItems(other,ITMW_1H_SWORD_LONG_05) >= 1))
	{
		Info_AddChoice(dia_vlk_989_reinar_sellweapon,"'Смерторуб' - 300 монет",dia_vlk_989_reinar_sellweapon_Deathruff);
	};
	if((Hlp_IsItem(EquipWeap,ItMw_Sturmbringer) == FALSE) && (Npc_HasItems(other,ItMw_Sturmbringer) >= 1))
	{
		Info_AddChoice(dia_vlk_989_reinar_sellweapon,"'Судьбоносная сталь' - 200 монет",dia_vlk_989_reinar_sellweapon_Sturmbringer);
	};
	if((Hlp_IsItem(EquipWeap,itmw_1h_Сrest) == FALSE) && (Npc_HasItems(other,itmw_1h_Сrest) >= 1))
	{
		Info_AddChoice(dia_vlk_989_reinar_sellweapon,"'Крест Судьбы' - 200 монет",dia_vlk_989_reinar_sellweapon_Сrest);
	};
	if((Hlp_IsItem(EquipWeap,ItMw_Orkschlaechter) == FALSE) && (Npc_HasItems(other,ItMw_Orkschlaechter) >= 1))
	{
		Info_AddChoice(dia_vlk_989_reinar_sellweapon,"'Миротворец' - 250 монет",dia_vlk_989_reinar_sellweapon_orkschlaechter);
	};
	if((Hlp_IsItem(EquipWeap,ITMW_FEARUND) == FALSE) && (Npc_HasItems(other,ITMW_FEARUND) >= 1))
	{
		Info_AddChoice(dia_vlk_989_reinar_sellweapon,"'Укротитель нежити' - 200 монет",dia_vlk_989_reinar_sellweapon_Fearund);
	};
	if((Hlp_IsItem(EquipWeap,ITMW_1H_KMR_SNAKESWORD_01) == FALSE) && (Npc_HasItems(other,ITMW_1H_KMR_SNAKESWORD_01) >= 1))
	{
		Info_AddChoice(dia_vlk_989_reinar_sellweapon,"'Змеевик' - 250 монет",dia_vlk_989_reinar_sellweapon_SnakeSword);
	};
	if((Hlp_IsItem(EquipWeap,itmw_normardsword) == FALSE) && (Npc_HasItems(other,itmw_normardsword) >= 1))
	{
		Info_AddChoice(dia_vlk_989_reinar_sellweapon,"'Серебряный нордмарский меч' - 350 монет",dia_vlk_989_reinar_sellweapon_normardsword);
	};
	if((Hlp_IsItem(EquipWeap,ITMW_1H_BLACKSWORD) == FALSE) && (Npc_HasItems(other,ITMW_1H_BLACKSWORD) >= 1))
	{
		Info_AddChoice(dia_vlk_989_reinar_sellweapon,"'Черное сердце' - 500 монет",dia_vlk_989_reinar_sellweapon_BlackHeart);
	};
	if((Hlp_IsItem(EquipWeap,ITMW_1H_G3A_DAEMONBLADE_01) == FALSE) && (Npc_HasItems(other,ITMW_1H_G3A_DAEMONBLADE_01) >= 1))
	{
		Info_AddChoice(dia_vlk_989_reinar_sellweapon,"'Поборник душ' - 700 монет",dia_vlk_989_reinar_sellweapon_DemonBlade);
	};
	if((Hlp_IsItem(EquipWeap,ItMw_1H_GinnokSword) == FALSE) && (Npc_HasItems(other,ItMw_1H_GinnokSword) >= 1))
	{
		Info_AddChoice(dia_vlk_989_reinar_sellweapon,"'Меч Безумного Крестоносца' - 700 монет",dia_vlk_989_reinar_sellweapon_GinnokSword);
	};
	if((Hlp_IsItem(EquipWeap,ItMw_Schlachtaxt) == FALSE) && (Npc_HasItems(other,ItMw_Schlachtaxt) >= 1))
	{
		Info_AddChoice(dia_vlk_989_reinar_sellweapon,"'Кулак варвара' - 300 монет",dia_vlk_989_reinar_sellweapon_schlachtaxt);
	};
	if((Hlp_IsItem(EquipWeap,ITMW_2H_KMR_SOULSWORD_01) == FALSE) && (Npc_HasItems(other,ITMW_2H_KMR_SOULSWORD_01) >= 1))
	{
		Info_AddChoice(dia_vlk_989_reinar_sellweapon,"'Темный обет' - 250 монет",dia_vlk_989_reinar_sellweapon_SoulSword);
	};
	if((Hlp_IsItem(EquipWeap,ItMw_Drachenschneide) == FALSE) && (Npc_HasItems(other,ItMw_Drachenschneide) >= 1))
	{
		Info_AddChoice(dia_vlk_989_reinar_sellweapon,"'Вершитель правосудия' - 500 монет",dia_vlk_989_reinar_sellweapon_drachenschneide);
	};
	if((Hlp_IsItem(EquipWeap,ItMw_RuneAxeAncient) == FALSE) && (Npc_HasItems(other,ItMw_RuneAxeAncient) >= 1))
	{
		Info_AddChoice(dia_vlk_989_reinar_sellweapon,"'Рунный топор Древних' - 500 монет",dia_vlk_989_reinar_sellweapon_RuneAxeAncient);
	};
	if((Hlp_IsItem(EquipWeap,ITMW_2H_KMR_RHOBAR_01) == FALSE) && (Npc_HasItems(other,ITMW_2H_KMR_RHOBAR_01) >= 1))
	{
		Info_AddChoice(dia_vlk_989_reinar_sellweapon,"'Воля Робара' - 700 монет",dia_vlk_989_reinar_sellweapon_RobarWill);
	};
	if((Hlp_IsItem(EquipWeap,ItMw_DemonHand) == FALSE) && (Npc_HasItems(other,ItMw_DemonHand) >= 1))
	{
		Info_AddChoice(dia_vlk_989_reinar_sellweapon,"'Длань демонов' - 700 монет",dia_vlk_989_reinar_sellweapon_DemonHand);
	};
	if((Hlp_IsItem(EquipWeap,itmw_2h_urizel) == FALSE) && (Npc_HasItems(other,itmw_2h_urizel) >= 1))
	{
		Info_AddChoice(dia_vlk_989_reinar_sellweapon,"'Уризель' - 700 монет",dia_vlk_989_reinar_sellweapon_urizel);
	};
	if((Hlp_IsItem(EquipWeap,itmw_2h_urizel_nomagic) == FALSE) && (Npc_HasItems(other,itmw_2h_urizel_nomagic) >= 1))
	{
		Info_AddChoice(dia_vlk_989_reinar_sellweapon,"'Уризель' - 500 монет",dia_vlk_989_reinar_sellweapon_urizel_nomagic);
	};
	if((Hlp_IsItem(EquipWeap,itmw_2h_weltenspalter) == FALSE) && (Npc_HasItems(other,itmw_2h_weltenspalter) >= 1))
	{
		Info_AddChoice(dia_vlk_989_reinar_sellweapon,"'Проклятье Азгалора' - 2000 монет",dia_vlk_989_reinar_sellweapon_weltenspalter);
	};
};

func void dia_vlk_989_reinar_sellweapon_back()
{
	Info_ClearChoices(dia_vlk_989_reinar_sellweapon);
};


func void dia_vlk_989_reinar_sellweapon_Morgenstern()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItMw_Morgenstern,1);
	AI_Output(other,self,"DIA_VLK_989_Reinar_SellWeapon_01_02");	//Ну, и как тебе?
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_03");	//Хммм...(оценивающе) Что же, действительно прекрасное и по-настоящему редкое оружие!
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_04");	//Так что я, наверное, возьму его у вас. Вот, пожалуйста, возьмите это золото!
	B_GiveInvItems(self,other,ItMi_Gold,150);
	Npc_RemoveInvItems(self,ItMw_Morgenstern,1);
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_05");	//И будьте уверены, это хорошая цена. Больше за него вам не даст ни один торговец!
};

func void dia_vlk_989_reinar_sellweapon_Inquisitor()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItMw_Inquisitor,1);
	AI_Output(other,self,"DIA_VLK_989_Reinar_SellWeapon_01_02");	//Ну, и как тебе?
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_03");	//Хммм...(оценивающе) Что же, действительно прекрасное и по-настоящему редкое оружие!
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_04");	//Так что я, наверное, возьму его у вас. Вот, пожалуйста, возьмите это золото!
	B_GiveInvItems(self,other,ItMi_Gold,200);
	Npc_RemoveInvItems(self,ItMw_Inquisitor,1);
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_05");	//И будьте уверены, это хорошая цена. Больше за него вам не даст ни один торговец!
};

func void dia_vlk_989_reinar_sellweapon_Rabenschnabel()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItMw_Rabenschnabel,1);
	AI_Output(other,self,"DIA_VLK_989_Reinar_SellWeapon_01_02");	//Ну, и как тебе?
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_03");	//Хммм...(оценивающе) Что же, действительно прекрасное и по-настоящему редкое оружие!
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_04");	//Так что я, наверное, возьму его у вас. Вот, пожалуйста, возьмите это золото!
	B_GiveInvItems(self,other,ItMi_Gold,200);
	Npc_RemoveInvItems(self,ItMw_Rabenschnabel,1);
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_05");	//И будьте уверены, это хорошая цена. Больше за него вам не даст ни один торговец!
};

func void dia_vlk_989_reinar_sellweapon_Crusher()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITMW_2H_MACE_107,1);
	AI_Output(other,self,"DIA_VLK_989_Reinar_SellWeapon_01_02");	//Ну, и как тебе?
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_03");	//Хммм...(оценивающе) Что же, действительно прекрасное и по-настоящему редкое оружие!
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_04");	//Так что я, наверное, возьму его у вас. Вот, пожалуйста, возьмите это золото!
	B_GiveInvItems(self,other,ItMi_Gold,250);
	Npc_RemoveInvItems(self,ITMW_2H_MACE_107,1);
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_05");	//И будьте уверены, это хорошая цена. Больше за него вам не даст ни один торговец!
};

func void dia_vlk_989_reinar_sellweapon_Volebir()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItMw_2H_Volebir,1);
	AI_Output(other,self,"DIA_VLK_989_Reinar_SellWeapon_01_02");	//Ну, и как тебе?
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_03");	//Хммм...(оценивающе) Что же, действительно прекрасное и по-настоящему редкое оружие!
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_04");	//Так что я, наверное, возьму его у вас. Вот, пожалуйста, возьмите это золото!
	B_GiveInvItems(self,other,ItMi_Gold,400);
	Npc_RemoveInvItems(self,ItMw_2H_Volebir,1);
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_05");	//И будьте уверены, это хорошая цена. Больше за него вам не даст ни один торговец!
};

func void dia_vlk_989_reinar_sellweapon_IceHammer()
{
	B_GivePlayerXP(200);
	B_GiveInvItems(other,self,ItMw_2H_IceHammer,1);
	AI_Output(other,self,"DIA_VLK_989_Reinar_SellWeapon_01_02");	//Ну, и как тебе?
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_03");	//Хммм...(оценивающе) Что же, действительно прекрасное и по-настоящему редкое оружие!
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_04");	//Так что я, наверное, возьму его у вас. Вот, пожалуйста, возьмите это золото!
	B_GiveInvItems(self,other,ItMi_Gold,700);
	Npc_RemoveInvItems(self,ItMw_2H_IceHammer,1);
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_05");	//И будьте уверены, это хорошая цена. Больше за него вам не даст ни один торговец!
};

func void dia_vlk_989_reinar_sellweapon_MolagBarMace()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItMw_1H_MolagBarMace,1);
	AI_Output(other,self,"DIA_VLK_989_Reinar_SellWeapon_01_02");	//Ну, и как тебе?
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_03");	//Хммм...(оценивающе) Что же, действительно прекрасное и по-настоящему редкое оружие!
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_04");	//Так что я, наверное, возьму его у вас. Вот, пожалуйста, возьмите это золото!
	B_GiveInvItems(self,other,ItMi_Gold,250);
	Npc_RemoveInvItems(self,ItMw_1H_MolagBarMace,1);
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_05");	//И будьте уверены, это хорошая цена. Больше за него вам не даст ни один торговец!
};

func void dia_vlk_989_reinar_sellweapon_SharpTeeth()
{
	B_GivePlayerXP(200);
	B_GiveInvItems(other,self,ItMw_2H_SharpTeeth,1);
	AI_Output(other,self,"DIA_VLK_989_Reinar_SellWeapon_01_02");	//Ну, и как тебе?
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_03");	//Хммм...(оценивающе) Что же, действительно прекрасное и по-настоящему редкое оружие!
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_04");	//Так что я, наверное, возьму его у вас. Вот, пожалуйста, возьмите это золото!
	B_GiveInvItems(self,other,ItMi_Gold,500);
	Npc_RemoveInvItems(self,ItMw_2H_SharpTeeth,1);
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_05");	//И будьте уверены, это хорошая цена. Больше за него вам не даст ни один торговец!
};

func void dia_vlk_989_reinar_sellweapon_drake()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItMw_Drakesaebel,1);
	AI_Output(other,self,"DIA_VLK_989_Reinar_SellWeapon_01_02");	//Ну, и как тебе?
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_03");	//Хммм...(оценивающе) Что же, действительно прекрасное и по-настоящему редкое оружие!
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_04");	//Так что я, наверное, возьму его у вас. Вот, пожалуйста, возьмите это золото!
	B_GiveInvItems(self,other,ItMi_Gold,300);
	Npc_RemoveInvItems(self,ItMw_Drakesaebel,1);
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_05");	//И будьте уверены, это хорошая цена. Больше за него вам не даст ни один торговец!
};

func void dia_vlk_989_reinar_sellweapon_Deathruff()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITMW_1H_SWORD_LONG_05,1);
	AI_Output(other,self,"DIA_VLK_989_Reinar_SellWeapon_01_02");	//Ну, и как тебе?
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_03");	//Хммм...(оценивающе) Что же, действительно прекрасное и по-настоящему редкое оружие!
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_04");	//Так что я, наверное, возьму его у вас. Вот, пожалуйста, возьмите это золото!
	B_GiveInvItems(self,other,ItMi_Gold,300);
	Npc_RemoveInvItems(self,ITMW_1H_SWORD_LONG_05,1);
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_05");	//И будьте уверены, это хорошая цена. Больше за него вам не даст ни один торговец!
};

func void dia_vlk_989_reinar_sellweapon_sturmbringer()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItMw_Sturmbringer,1);
	AI_Output(other,self,"DIA_VLK_989_Reinar_SellWeapon_01_02");	//Ну, и как тебе?
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_03");	//Хммм...(оценивающе) Что же, действительно прекрасное и по-настоящему редкое оружие!
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_04");	//Так что я, наверное, возьму его у вас. Вот, пожалуйста, возьмите это золото!
	B_GiveInvItems(self,other,ItMi_Gold,200);
	Npc_RemoveInvItems(self,ItMw_Sturmbringer,1);
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_05");	//И будьте уверены, это хорошая цена. Больше за него вам не даст ни один торговец!
};

func void dia_vlk_989_reinar_sellweapon_Сrest()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,itmw_1h_Сrest,1);
	AI_Output(other,self,"DIA_VLK_989_Reinar_SellWeapon_01_02");	//Ну, и как тебе?
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_03");	//Хммм...(оценивающе) Что же, действительно прекрасное и по-настоящему редкое оружие!
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_04");	//Так что я, наверное, возьму его у вас. Вот, пожалуйста, возьмите это золото!
	B_GiveInvItems(self,other,ItMi_Gold,200);
	Npc_RemoveInvItems(self,itmw_1h_Сrest,1);
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_05");	//И будьте уверены, это хорошая цена. Больше за него вам не даст ни один торговец!
};

func void dia_vlk_989_reinar_sellweapon_orkschlaechter()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItMw_Orkschlaechter,1);
	AI_Output(other,self,"DIA_VLK_989_Reinar_SellWeapon_01_02");	//Ну, и как тебе?
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_03");	//Хммм...(оценивающе) Что же, действительно прекрасное и по-настоящему редкое оружие!
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_04");	//Так что я, наверное, возьму его у вас. Вот, пожалуйста, возьмите это золото!
	B_GiveInvItems(self,other,ItMi_Gold,250);
	Npc_RemoveInvItems(self,ItMw_Orkschlaechter,1);
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_05");	//И будьте уверены, это хорошая цена. Больше за него вам не даст ни один торговец!
};

func void dia_vlk_989_reinar_sellweapon_Fearund()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITMW_FEARUND,1);
	AI_Output(other,self,"DIA_VLK_989_Reinar_SellWeapon_01_02");	//Ну, и как тебе?
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_03");	//Хммм...(оценивающе) Что же, действительно прекрасное и по-настоящему редкое оружие!
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_04");	//Так что я, наверное, возьму его у вас. Вот, пожалуйста, возьмите это золото!
	B_GiveInvItems(self,other,ItMi_Gold,200);
	Npc_RemoveInvItems(self,ITMW_FEARUND,1);
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_05");	//И будьте уверены, это хорошая цена. Больше за него вам не даст ни один торговец!
};

func void dia_vlk_989_reinar_sellweapon_SnakeSword()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITMW_1H_KMR_SNAKESWORD_01,1);
	AI_Output(other,self,"DIA_VLK_989_Reinar_SellWeapon_01_02");	//Ну, и как тебе?
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_03");	//Хммм...(оценивающе) Что же, действительно прекрасное и по-настоящему редкое оружие!
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_04");	//Так что я, наверное, возьму его у вас. Вот, пожалуйста, возьмите это золото!
	B_GiveInvItems(self,other,ItMi_Gold,250);
	Npc_RemoveInvItems(self,ITMW_1H_KMR_SNAKESWORD_01,1);
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_05");	//И будьте уверены, это хорошая цена. Больше за него вам не даст ни один торговец!
};

func void dia_vlk_989_reinar_sellweapon_normardsword()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,itmw_normardsword,1);
	AI_Output(other,self,"DIA_VLK_989_Reinar_SellWeapon_01_02");	//Ну, и как тебе?
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_03");	//Хммм...(оценивающе) Что же, действительно прекрасное и по-настоящему редкое оружие!
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_04");	//Так что я, наверное, возьму его у вас. Вот, пожалуйста, возьмите это золото!
	B_GiveInvItems(self,other,ItMi_Gold,350);
	Npc_RemoveInvItems(self,itmw_normardsword,1);
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_05");	//И будьте уверены, это хорошая цена. Больше за него вам не даст ни один торговец!
};

func void dia_vlk_989_reinar_sellweapon_BlackHeart()
{
	B_GivePlayerXP(200);
	B_GiveInvItems(other,self,ITMW_1H_BLACKSWORD,1);
	AI_Output(other,self,"DIA_VLK_989_Reinar_SellWeapon_01_02");	//Ну, и как тебе?
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_03");	//Хммм...(оценивающе) Что же, действительно прекрасное и по-настоящему редкое оружие!
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_04");	//Так что я, наверное, возьму его у вас. Вот, пожалуйста, возьмите это золото!
	B_GiveInvItems(self,other,ItMi_Gold,500);
	Npc_RemoveInvItems(self,ITMW_1H_BLACKSWORD,1);
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_05");	//И будьте уверены, это хорошая цена. Больше за него вам не даст ни один торговец!
};

func void dia_vlk_989_reinar_sellweapon_DemonBlade()
{
	B_GivePlayerXP(300);
	B_GiveInvItems(other,self,ITMW_1H_G3A_DAEMONBLADE_01,1);
	AI_Output(other,self,"DIA_VLK_989_Reinar_SellWeapon_01_02");	//Ну, и как тебе?
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_03");	//Хммм...(оценивающе) Что же, действительно прекрасное и по-настоящему редкое оружие!
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_04");	//Так что я, наверное, возьму его у вас. Вот, пожалуйста, возьмите это золото!
	B_GiveInvItems(self,other,ItMi_Gold,700);
	Npc_RemoveInvItems(self,ITMW_1H_G3A_DAEMONBLADE_01,1);
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_05");	//И будьте уверены, это хорошая цена. Больше за него вам не даст ни один торговец!
};

func void dia_vlk_989_reinar_sellweapon_GinnokSword()
{
	B_GivePlayerXP(300);
	B_GiveInvItems(other,self,ItMw_1H_GinnokSword,1);
	AI_Output(other,self,"DIA_VLK_989_Reinar_SellWeapon_01_02");	//Ну, и как тебе?
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_03");	//Хммм...(оценивающе) Что же, действительно прекрасное и по-настоящему редкое оружие!
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_04");	//Так что я, наверное, возьму его у вас. Вот, пожалуйста, возьмите это золото!
	B_GiveInvItems(self,other,ItMi_Gold,700);
	Npc_RemoveInvItems(self,ItMw_1H_GinnokSword,1);
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_05");	//И будьте уверены, это хорошая цена. Больше за него вам не даст ни один торговец!
};

func void dia_vlk_989_reinar_sellweapon_schlachtaxt()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItMw_Schlachtaxt,1);
	AI_Output(other,self,"DIA_VLK_989_Reinar_SellWeapon_01_02");	//Ну, и как тебе?
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_03");	//Хммм...(оценивающе) Что же, действительно прекрасное и по-настоящему редкое оружие!
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_04");	//Так что я, наверное, возьму его у вас. Вот, пожалуйста, возьмите это золото!
	B_GiveInvItems(self,other,ItMi_Gold,300);
	Npc_RemoveInvItems(self,ItMw_Schlachtaxt,1);
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_05");	//И будьте уверены, это хорошая цена. Больше за него вам не даст ни один торговец!
};

func void dia_vlk_989_reinar_sellweapon_SoulSword()
{
	B_GivePlayerXP(300);
	B_GiveInvItems(other,self,ITMW_2H_KMR_SOULSWORD_01,1);
	AI_Output(other,self,"DIA_VLK_989_Reinar_SellWeapon_01_02");	//Ну, и как тебе?
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_03");	//Хммм...(оценивающе) Что же, действительно прекрасное и по-настоящему редкое оружие!
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_04");	//Так что я, наверное, возьму его у вас. Вот, пожалуйста, возьмите это золото!
	B_GiveInvItems(self,other,ItMi_Gold,250);
	Npc_RemoveInvItems(self,ITMW_2H_KMR_SOULSWORD_01,1);
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_05");	//И будьте уверены, это хорошая цена. Больше за него вам не даст ни один торговец!
};

func void dia_vlk_989_reinar_sellweapon_drachenschneide()
{
	B_GivePlayerXP(200);
	B_GiveInvItems(other,self,ItMw_Drachenschneide,1);
	AI_Output(other,self,"DIA_VLK_989_Reinar_SellWeapon_01_02");	//Ну, и как тебе?
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_03");	//Хммм...(оценивающе) Что же, действительно прекрасное и по-настоящему редкое оружие!
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_04");	//Так что я, наверное, возьму его у вас. Вот, пожалуйста, возьмите это золото!
	B_GiveInvItems(self,other,ItMi_Gold,500);
	Npc_RemoveInvItems(self,ItMw_Drachenschneide,1);
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_05");	//И будьте уверены, это хорошая цена. Больше за него вам не даст ни один торговец!
};

func void dia_vlk_989_reinar_sellweapon_RuneAxeAncient()
{
	B_GivePlayerXP(200);
	B_GiveInvItems(other,self,ItMw_RuneAxeAncient,1);
	AI_Output(other,self,"DIA_VLK_989_Reinar_SellWeapon_01_02");	//Ну, и как тебе?
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_03");	//Хммм...(оценивающе) Что же, действительно прекрасное и по-настоящему редкое оружие!
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_04");	//Так что я, наверное, возьму его у вас. Вот, пожалуйста, возьмите это золото!
	B_GiveInvItems(self,other,ItMi_Gold,500);
	Npc_RemoveInvItems(self,ItMw_RuneAxeAncient,1);
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_05");	//И будьте уверены, это хорошая цена. Больше за него вам не даст ни один торговец!
};

func void dia_vlk_989_reinar_sellweapon_RobarWill()
{
	B_GivePlayerXP(300);
	B_GiveInvItems(other,self,ITMW_2H_KMR_RHOBAR_01,1);
	AI_Output(other,self,"DIA_VLK_989_Reinar_SellWeapon_01_02");	//Ну, и как тебе?
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_03");	//Хммм...(оценивающе) Что же, действительно прекрасное и по-настоящему редкое оружие!
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_04");	//Так что я, наверное, возьму его у вас. Вот, пожалуйста, возьмите это золото!
	B_GiveInvItems(self,other,ItMi_Gold,700);
	Npc_RemoveInvItems(self,ITMW_2H_KMR_RHOBAR_01,1);
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_05");	//И будьте уверены, это хорошая цена. Больше за него вам не даст ни один торговец!
};

func void dia_vlk_989_reinar_sellweapon_DemonHand()
{
	B_GivePlayerXP(300);
	B_GiveInvItems(other,self,ItMw_DemonHand,1);
	AI_Output(other,self,"DIA_VLK_989_Reinar_SellWeapon_01_02");	//Ну, и как тебе?
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_03");	//Хммм...(оценивающе) Что же, действительно прекрасное и по-настоящему редкое оружие!
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_04");	//Так что я, наверное, возьму его у вас. Вот, пожалуйста, возьмите это золото!
	B_GiveInvItems(self,other,ItMi_Gold,700);
	Npc_RemoveInvItems(self,ItMw_DemonHand,1);
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_05");	//И будьте уверены, это хорошая цена. Больше за него вам не даст ни один торговец!
};

func void dia_vlk_989_reinar_sellweapon_urizel()
{
	B_GivePlayerXP(400);
	B_GiveInvItems(other,self,itmw_2h_urizel,1);
	AI_Output(other,self,"DIA_VLK_989_Reinar_SellWeapon_01_02");	//Ну, и как тебе?
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_03");	//Хммм...(оценивающе) Что же, действительно прекрасное и по-настоящему редкое оружие!
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_04");	//Так что я, наверное, возьму его у вас. Вот, пожалуйста, возьмите это золото!
	B_GiveInvItems(self,other,ItMi_Gold,700);
	Npc_RemoveInvItems(self,itmw_2h_urizel,1);
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_05");	//И будьте уверены, это хорошая цена. Больше за него вам не даст ни один торговец!
};

func void dia_vlk_989_reinar_sellweapon_urizel_nomagic()
{
	B_GivePlayerXP(200);
	B_GiveInvItems(other,self,itmw_2h_urizel_nomagic,1);
	AI_Output(other,self,"DIA_VLK_989_Reinar_SellWeapon_01_02");	//Ну, и как тебе?
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_03");	//Хммм...(оценивающе) Что же, действительно прекрасное и по-настоящему редкое оружие!
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_04");	//Так что я, наверное, возьму его у вас. Вот, пожалуйста, возьмите это золото!
	B_GiveInvItems(self,other,ItMi_Gold,500);
	Npc_RemoveInvItems(self,itmw_2h_urizel_nomagic,1);
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_05");	//И будьте уверены, это хорошая цена. Больше за него вам не даст ни один торговец!
};

func void dia_vlk_989_reinar_sellweapon_weltenspalter()
{
	B_GivePlayerXP(1000);
	B_GiveInvItems(other,self,itmw_2h_weltenspalter,1);
	AI_Output(other,self,"DIA_VLK_989_Reinar_SellWeapon_01_02");	//Ну, и как тебе?
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_03");	//Хммм...(оценивающе) Что же, действительно прекрасное и по-настоящему редкое оружие!
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_04");	//Так что я, наверное, возьму его у вас. Вот, пожалуйста, возьмите это золото!
	B_GiveInvItems(self,other,ItMi_Gold,2000);
	Npc_RemoveInvItems(self,itmw_2h_weltenspalter,1);
	AI_Output(self,other,"DIA_VLK_989_Reinar_SellWeapon_01_05");	//И будьте уверены, это хорошая цена. Больше за него вам не даст ни один торговец!
};

instance DIA_VLK_989_REINAR_FUCKOFF(C_Info)
{
	npc = vlk_989_reinar;
	nr = 10;
	condition = dia_vlk_989_reinar_fuckoff_condition;
	information = dia_vlk_989_reinar_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_vlk_989_reinar_fuckoff_condition()
{
	if((REINARPISSOFF == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_vlk_989_reinar_fuckoff_info()
{
	AI_Output(self,other,"DIA_VLK_989_Reinar_FuckOff_01_00");	//Убирайся прочь! (гневно) С такими, как вы Рейнар не будет иметь никаких дел!
	AI_StopProcessInfos(self);
};