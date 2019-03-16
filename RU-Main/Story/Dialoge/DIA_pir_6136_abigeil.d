
instance DIA_PIR_6136_ABIGEIL_EXIT(C_Info)
{
	npc = pir_6136_abigeil;
	nr = 999;
	condition = dia_pir_6136_abigeil_exit_condition;
	information = dia_pir_6136_abigeil_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pir_6136_abigeil_exit_condition()
{
	return TRUE;
};

func void dia_pir_6136_abigeil_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PIR_6136_ABIGEIL_PICKPOCKET(C_Info)
{
	npc = pir_6136_abigeil;
	nr = 900;
	condition = dia_pir_6136_abigeil_pickpocket_condition;
	information = dia_pir_6136_abigeil_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_pir_6136_abigeil_pickpocket_condition()
{
	return C_Beklauen(80,100);
};

func void dia_pir_6136_abigeil_pickpocket_info()
{
	Info_ClearChoices(dia_pir_6136_abigeil_pickpocket);
	Info_AddChoice(dia_pir_6136_abigeil_pickpocket,Dialog_Back,dia_pir_6136_abigeil_pickpocket_back);
	Info_AddChoice(dia_pir_6136_abigeil_pickpocket,DIALOG_PICKPOCKET,dia_pir_6136_abigeil_pickpocket_doit);
};

func void dia_pir_6136_abigeil_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_pir_6136_abigeil_pickpocket);
};

func void dia_pir_6136_abigeil_pickpocket_back()
{
	Info_ClearChoices(dia_pir_6136_abigeil_pickpocket);
};


instance DIA_PIR_6136_ABIGEIL_HELLO(C_Info)
{
	npc = pir_6136_abigeil;
	nr = 1;
	condition = dia_pir_6136_abigeil_hello_condition;
	information = dia_pir_6136_abigeil_hello_info;
	permanent = FALSE;
	description = "Привет, малышка! Ты кто?!";
};


func int dia_pir_6136_abigeil_hello_condition()
{
	return TRUE;
};

func void dia_pir_6136_abigeil_hello_info()
{
	AI_Output(other,self,"DIA_PIR_6136_Abigeil_Hello_01_00");	//Привет, малышка! Ты кто?
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_Hello_01_01");	//Какая я тебе малышка, сопляк! И вообще, твое-то какое дело?!
	AI_Output(other,self,"DIA_PIR_6136_Abigeil_Hello_01_02");	//Просто хотел познакомиться.
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_Hello_01_03");	//Хммм...(оценивающе) Ну, если просто так, то можешь называть меня Абигаль.
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_Hello_01_04");	//Только не вздумай ко мне лезть, а то я тебе голову откушу!
	AI_Output(other,self,"DIA_PIR_6136_Abigeil_Hello_01_05");	//Ого, ну и манеры! Скажи, а ты тоже пират?
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_Hello_01_06");	//(раздраженно) Нет, я - твоя бабушка.
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_Hello_01_09");	//Что за глупый вопрос!
};


instance DIA_PIR_6136_ABIGEIL_MISSWEAPON(C_Info)
{
	npc = pir_6136_abigeil;
	nr = 1;
	condition = dia_pir_6136_abigeil_missweapon_condition;
	information = dia_pir_6136_abigeil_missweapon_info;
	permanent = FALSE;
	description = "Так в чем же проблема?";
};


func int dia_pir_6136_abigeil_missweapon_condition()
{
	if(Npc_KnowsInfo(hero,dia_pir_6136_abigeil_hello))
	{
		return TRUE;
	};
};

func void dia_pir_6136_abigeil_missweapon_info()
{
	AI_Output(other,self,"DIA_PIR_6136_Abigeil_MissWeapon_01_00");	//В чем твоя проблема?
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_MissWeapon_01_01");	//А разве не видно? (раздраженно) У меня нет с собой моей шпаги.
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_MissWeapon_01_03");	//Я...(замялась) Я ее потеряла.
	AI_Output(other,self,"DIA_PIR_6136_Abigeil_MissWeapon_01_04");	//Так найди себе какое-нибудь другое оружие - разве это такая большая проблема?
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_MissWeapon_01_05");	//Мне нужна только моя шпага.
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_MissWeapon_01_08");	//Это наследство от моего отца.
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_MissWeapon_01_09");	//К тому же она не так проста, как кажется на первый взгляд.
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_MissWeapon_01_11");	//В моих руках ее клинок словно оживает, и проткнет любого, кто встанет у меня на пути.
	AI_Output(other,self,"DIA_PIR_6136_Abigeil_MissWeapon_01_12");	//Ого! Неплохая вещица.
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_MissWeapon_01_13");	//(смеется) А то небось уже губы раскатал на мое добро.
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_MissWeapon_01_16");	//Вот только управляться ею могу только я. Если ей попытается воспользоваться кто-то другой - эта шпага просто убьет его!
	AI_Output(other,self,"DIA_PIR_6136_Abigeil_MissWeapon_01_17");	//И где ты ее потеряла?
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_MissWeapon_01_18");	//Во время одной охоты на болотных крыс я немного увлеклась и слишком близко подошла к лагерю бандитов, что на востоке.
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_MissWeapon_01_21");	//Если бы не моя шпага, я была бы уже мертва.
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_MissWeapon_01_22");	//При первом же выпаде я умудрилась заколоть двух насмерть. Дело бы дошло и до остальных, если бы...
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_MissWeapon_01_24");	//Если бы не этот поганый огненный мракорис...(гневно) До сих пор не пойму, откуда он там взялся!
	AI_Output(other,self,"DIA_PIR_6136_Abigeil_MissWeapon_01_25");	//Огненный мракорис?
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_MissWeapon_01_26");	//Это огненное дерьмо болотной вонючки напало на меня сзади, и я, не удержав равновесие, упала на землю, выронив свою шпагу.
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_MissWeapon_01_29");	//Впервые в жизни мне пришлось спасаться бегством и, клянусь Белиаром - в последний!
	AI_Output(other,self,"DIA_PIR_6136_Abigeil_MissWeapon_01_30");	//А что стало со шпагой?
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_MissWeapon_01_31");	//Естественно, пришлось ее бросить. У меня просто не было времени искать ее среди зарослей болотной травы.
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_MissWeapon_01_32");	//Вот теперь и торчу здесь в лагере целыми днями, выслушивая глупые вопросы таких умников, как ты.
	AI_Output(other,self,"DIA_PIR_6136_Abigeil_MissWeapon_01_33");	//Почему же ты не вернешься и не заберешь свою шпагу?
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_MissWeapon_01_34");	//Да ты что? (нервно) Без нее я и шага отсюда не сделаю!
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_MissWeapon_01_35");	//А с другим оружием я не слишком хорошо управляюсь.
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_MissWeapon_01_36");	//К тому же мне что-то больше не хочется снова встречаться с этим огненным мракорисом.
	Info_ClearChoices(dia_pir_6136_abigeil_missweapon);
	Info_AddChoice(dia_pir_6136_abigeil_missweapon,"Ну, тогда счастливо оставаться!",dia_pir_6136_abigeil_missweapon_no);
	Info_AddChoice(dia_pir_6136_abigeil_missweapon,"А что я получу, если верну твою шпагу?",dia_pir_6136_abigeil_missweapon_yes);
};

func void dia_pir_6136_abigeil_missweapon_no()
{
	AI_Output(other,self,"DIA_PIR_6136_Abigeil_MissWeapon_No_01_01");	//Надеюсь, ты когда-нибудь отыщешь свою шпагу.
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_MissWeapon_No_01_03");	//(раздраженно) Хватит уже болтать - оставь меня!
	ABIGEILPISSOFF = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_pir_6136_abigeil_missweapon_yes()
{
	AI_Output(other,self,"DIA_PIR_6136_Abigeil_MissWeapon_Yes_01_00");	//А что я получу, если верну твою шпагу?
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_MissWeapon_Yes_01_01");	//Что? (удивленно) Ты хочешь помочь мне?
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_MissWeapon_Yes_01_03");	//Ну... (задумчиво) Боюсь, у меня нет ничего такого, что могло бы тебя заинтересовать.
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_MissWeapon_Yes_01_04");	//Если только вот эта небольшая каменная табличка с какими-то иероглифами.
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_MissWeapon_Yes_01_05");	//Я еще нашла в одной из пещер, недалеко от каньона.
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_MissWeapon_Yes_01_06");	//Говорят, что она волшебная! Правда, в чем заключается ее волшебство - я так и не поняла.
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_MissWeapon_Yes_01_08");	//Верни мне мою шпагу - и она твоя.
	Info_ClearChoices(dia_pir_6136_abigeil_missweapon);
	MIS_ABIGEILMISSWEAPON = LOG_Running;
	Log_CreateTopic(TOPIC_ABIGEILMISSWEAPON,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ABIGEILMISSWEAPON,LOG_Running);
	B_LogEntry(TOPIC_ABIGEILMISSWEAPON,"В лагере пиратов я познакомился с очень милой девушкой по имени Абигаль. Она рассказала мне, что где-то на болотах потеряла свою шпагу. По словам Абигаль - это не простая шпага, а волшебная. Однако волшебство этой вещицы действует только в ее руках, для других же она смертельна! Я вызвался помочь Абигаль отыскать эту шпагу в обмен на волшебную каменную табличку, которая, по всей видимости, принадлежит зодчим. Абигаль также предупредила меня, что недалеко от того места, где эта шпага была потеряна, она наткнулась на огненного мракориса. Надо быть осторожнее.");
};


instance DIA_PIR_6136_ABIGEIL_FUCKOFF(C_Info)
{
	npc = pir_6136_abigeil;
	nr = 10;
	condition = dia_pir_6136_abigeil_fuckoff_condition;
	information = dia_pir_6136_abigeil_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_pir_6136_abigeil_fuckoff_condition()
{
	if((ABIGEILPISSOFF == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_pir_6136_abigeil_fuckoff_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
};


instance DIA_PIR_6136_ABIGEIL_LIFE(C_Info)
{
	npc = pir_6136_abigeil;
	nr = 1;
	condition = dia_pir_6136_abigeil_life_condition;
	information = dia_pir_6136_abigeil_life_info;
	permanent = TRUE;
	description = "Как жизнь?";
};


func int dia_pir_6136_abigeil_life_condition()
{
	if(Npc_KnowsInfo(hero,dia_pir_6136_abigeil_hello))
	{
		return TRUE;
	};
};

func void dia_pir_6136_abigeil_life_info()
{
	AI_Output(other,self,"DIA_PIR_6136_Abigeil_Life_01_00");	//Как жизнь?
	if((MIS_ABIGEILMISSWEAPON == LOG_SUCCESS) && (MIS_ABIGEILHELPHANNA != LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_PIR_6136_Abigeil_Life_01_01");	//Все просто отлично, приятель!
		AI_ReadyMeleeWeapon(self);
		AI_Output(self,other,"DIA_PIR_6136_Abigeil_Life_01_07");	//Посмотри...
		AI_RemoveWeapon(self);
		AI_Output(self,other,"DIA_PIR_6136_Abigeil_Life_01_09");	//...правда она хороша, да?
	}
	else if((MIS_ABIGEILMISSWEAPON == LOG_SUCCESS) && (MIS_ABIGEILHELPHANNA == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_PIR_6136_Abigeil_Life_01_10");	//Лучше и быть не может.
	}
	else
	{
		AI_Output(self,other,"DIA_PIR_6136_Abigeil_Life_01_16");	//Паршиво! Так что лучше не зли меня... Ясно?!
	};
};


instance DIA_PIR_6136_ABIGEIL_MISSWEAPONDONE(C_Info)
{
	npc = pir_6136_abigeil;
	nr = 1;
	condition = dia_pir_6136_abigeil_missweapondone_condition;
	information = dia_pir_6136_abigeil_missweapondone_info;
	permanent = FALSE;
	description = "Я нашел твою шпагу.";
};


func int dia_pir_6136_abigeil_missweapondone_condition()
{
	if((MIS_ABIGEILMISSWEAPON == LOG_Running) && (Npc_HasItems(hero,itmw_abigeilspage) >= 1))
	{
		return TRUE;
	};
};

func void dia_pir_6136_abigeil_missweapondone_info()
{
	B_GivePlayerXP(350);
	AI_Output(other,self,"DIA_PIR_6136_Abigeil_MissWeaponDone_01_00");	//Я нашел твою шпагу.
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_MissWeaponDone_01_01");	//Правда? Не может быть! Это точно она?
	AI_Output(other,self,"DIA_PIR_6136_Abigeil_MissWeaponDone_01_04");	//Вот, сама посмотри.
	B_GiveInvItems(other,self,itmw_abigeilspage,1);
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_MissWeaponDone_01_05");	//Хммм...(разглядывает)
	Info_ClearChoices(dia_pir_6136_abigeil_missweapondone);
	Info_AddChoice(dia_pir_6136_abigeil_missweapondone,"Узнаешь?",dia_pir_6136_abigeil_missweapondone_give);
};

func void dia_pir_6136_abigeil_missweapondone_give()
{
	AI_EquipBestMeleeWeapon(self);
	AI_Output(other,self,"DIA_PIR_6136_Abigeil_MissWeaponDone_Give_01_00");	//Узнаешь?
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_MissWeaponDone_Give_01_01");	//Вау! И вправду она...
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_MissWeaponDone_Give_01_02");	//Наконец-то моя малышка снова со мной!
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_MissWeaponDone_Give_01_04");	//Ах да...(улыбается) Вот та каменная табличка, о которой я тебе говорила. Держи!
	B_GiveInvItems(self,other,ItWr_HitPointStonePlate2_Addon,1);
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_MissWeaponDone_Give_01_06");	//Ты молодец...(с уважением) Не думала, что тебе хватит храбрости побывать в тех местах!
	AI_Output(other,self,"DIA_PIR_6136_Abigeil_MissWeaponDone_Give_01_09");	//Да не за что. Если что - обращайся!
	MIS_ABIGEILMISSWEAPON = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_ABIGEILMISSWEAPON,LOG_SUCCESS);
	B_LogEntry(TOPIC_ABIGEILMISSWEAPON,"Я принес Абигаль ее шпагу.");
};

instance DIA_PIR_6136_ABIGEIL_ABIGEILHELPHANNA(C_Info)
{
	npc = pir_6136_abigeil;
	nr = 10;
	condition = dia_pir_6136_abigeil_abigeilhelphanna_condition;
	information = dia_pir_6136_abigeil_abigeilhelphanna_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_pir_6136_abigeil_abigeilhelphanna_condition()
{
	if((MIS_ABIGEILMISSWEAPON == LOG_SUCCESS) && (Kapitel <= 5))
	{
		return TRUE;
	};
};

func void dia_pir_6136_abigeil_abigeilhelphanna_info()
{
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_AbigeilHelpHanna_01_00");	//Эй, постой! Можно тебя попросить еще об одной услуге?
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_AbigeilHelpHanna_01_02");	//Я пообещала своей любимой сестренке привезти золотое ожерелье.
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_AbigeilHelpHanna_01_09");	//Вот только теперь у нас корабля не стало!
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_AbigeilHelpHanna_01_11");	//Моя сестренка живет в Хоринисе, а туда без корабля не попадешь.
	AI_Output(other,self,"DIA_PIR_6136_Abigeil_AbigeilHelpHanna_01_12");	//И ты, видимо, хочешь, чтобы это сделал я?
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_AbigeilHelpHanna_01_13");	//Ну да! Ты, как я слышала, частенько бываешь там.
	AI_Output(other,self,"DIA_PIR_6136_Abigeil_AbigeilHelpHanna_01_15");	//Ну... ты сама понимаешь, что каждый труд имеет свою цену.
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_AbigeilHelpHanna_01_17");	//Ладно, если ты поможешь мне - я дам тебе... ну, скажем, двести золотых монет.
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_AbigeilHelpHanna_01_18");	//Идет?
	Info_ClearChoices(dia_pir_6136_abigeil_abigeilhelphanna);
	Info_AddChoice(dia_pir_6136_abigeil_abigeilhelphanna,"Это того не стоит.",dia_pir_6136_abigeil_abigeilhelphanna_no);
	Info_AddChoice(dia_pir_6136_abigeil_abigeilhelphanna,"Хорошо, считай, мы договорились.",dia_pir_6136_abigeil_abigeilhelphanna_yes);
};

func void dia_pir_6136_abigeil_abigeilhelphanna_no()
{
	AI_Output(other,self,"DIA_PIR_6136_Abigeil_AbigeilHelpHanna_No_01_00");	//Это того не стоит.
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_AbigeilHelpHanna_No_01_01");	//Ну и жадная же ты скотина! (гневно) Только и думаешь, что о себе!
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_AbigeilHelpHanna_No_01_06");	//Пошел к черту, придурок!
	ABIGEILPISSOFF = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_pir_6136_abigeil_abigeilhelphanna_yes()
{
	AI_Output(other,self,"DIA_PIR_6136_Abigeil_AbigeilHelpHanna_Yes_01_00");	//Хорошо, считай, мы договорились.
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_AbigeilHelpHanna_Yes_01_01");	//Тогда вот - возьми это золотое ожерелье и отнеси его моей сестре.
	B_GiveInvItems(self,other,ITMI_HANNAGOLDNECKLACE,1);
	AI_Output(other,self,"DIA_PIR_6136_Abigeil_AbigeilHelpHanna_Yes_01_02");	//А как зовут твою сестру?
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_AbigeilHelpHanna_Yes_01_03");	//Ее зовут Ханна, она хозяйка гостиницы в Хоринисе.
	AI_Output(other,self,"DIA_PIR_6136_Abigeil_AbigeilHelpHanna_Yes_01_04");	//Ханна - твоя сестра?!
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_AbigeilHelpHanna_Yes_01_05");	//Хммм. И почему все удивляются, когда узнают об этом? Что в этом такого удивительного?
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_AbigeilHelpHanna_Yes_01_09");	//(раздраженно) И хватит этих глупых вопросов.
	AI_Output(other,self,"DIA_PIR_6136_Abigeil_AbigeilHelpHanna_Yes_01_10");	//Ладно, я все понял.
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_AbigeilHelpHanna_Yes_01_11");	//Вот и замечательно. Так что лучше не теряй времени и отправляйся в Хоринис.
	MIS_ABIGEILHELPHANNA = LOG_Running;
	Log_CreateTopic(TOPIC_ABIGEILHELPHANNA,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ABIGEILHELPHANNA,LOG_Running);
	B_LogEntry(TOPIC_ABIGEILHELPHANNA,"Абигаль попросила меня отнести золотое ожерелье Ханне - ее сестре в Хоринисе. За эту услугу Абигаль обещала заплатить мне двести золотых монет.");
	AI_StopProcessInfos(self);
};


instance DIA_PIR_6136_ABIGEIL_INPRISION(C_Info)
{
	npc = pir_6136_abigeil;
	nr = 10;
	condition = dia_pir_6136_abigeil_inprision_condition;
	information = dia_pir_6136_abigeil_inprision_info;
	permanent = FALSE;
	description = "Боюсь, у меня для тебя плохие новости.";
};


func int dia_pir_6136_abigeil_inprision_condition()
{
	if((MIS_ABIGEILHELPHANNA == LOG_Running) && (KNOWSHANNAINPRISIONABIGEIL == TRUE) && (Kapitel <= 5))
	{
		return TRUE;
	};
};

func void dia_pir_6136_abigeil_inprision_info()
{
	var C_Npc gregcap;
	gregcap = Hlp_GetNpc(PIR_1320_Addon_Greg);
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_PIR_6136_Abigeil_InPrision_01_00");	//Боюсь, у меня для тебя плохие новости.
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_InPrision_01_01");	//Что случилось?
	AI_Output(other,self,"DIA_PIR_6136_Abigeil_InPrision_01_02");	//Твою сестру обвинили в воровстве и посадили в тюрьму.
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_InPrision_01_03");	//(в бешенстве) Что?! Проклятье! Но как же это произошло?
	AI_Output(other,self,"DIA_PIR_6136_Abigeil_InPrision_01_04");	//Сейчас я это и пытаюсь выяснить. Поэтому мне нужна твоя помощь.
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_InPrision_01_05");	//(вне себя) Черт! Да как они посмели это сделать?!
	AI_Output(other,self,"DIA_PIR_6136_Abigeil_InPrision_01_06");	//Абигаль, послушай, мне нужна твоя по...
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_InPrision_01_07");	//...(не обращая внимания) Ну, они у меня получат! Я этого так не оставлю!
	AI_TurnToNPC(self,gregcap);
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_InPrision_01_08");	//Грэг! (срываясь на крик) Немедленно собирай людей - мы сейчас же атакуем Хоринис!
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_InPrision_01_09");	//(Грэг - "Ты что Абигаль, совсем рехнулась?")
	AI_Output(other,self,"DIA_PIR_6136_Abigeil_InPrision_01_10");	//ДА ТЫ ЧТО, ОГЛОХЛА?! Я ГОВОРЮ - МНЕ НУЖНА ТВОЯ ПОМОЩЬ!
	AI_TurnToNPC(self,other);
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_InPrision_01_11");	//А?! Что? (растерянно) Черт! Какая помощь, когда моя сестра за решеткой?!
	AI_Output(other,self,"DIA_PIR_6136_Abigeil_InPrision_01_16");	//Расскажи мне, что ты знаешь о человеке по имени Гаспар?
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_InPrision_01_17");	//Гаспар?! Хммм...(задумчиво) Кажется, это имя мне знакомо.
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_InPrision_01_22");	//Ханна мне как-то говорила, что один ублюдок по имени Гаспар предлагал ей продать ему свою гостиницу.
	AI_Output(other,self,"DIA_PIR_6136_Abigeil_InPrision_01_24");	//Ага! Кажется теперь, мне все ясно.
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_InPrision_01_25");	//Что ясно?
	AI_Output(other,self,"DIA_PIR_6136_Abigeil_InPrision_01_26");	//Дело в том, что именно Гаспар сейчас всем и заправляет в гостинице твоей сестры.
	AI_Output(other,self,"DIA_PIR_6136_Abigeil_InPrision_01_29");	//Думаю, это он все подстроил и подставил твою сестру.
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_InPrision_01_30");	//ЧТО?! Да я ему кишки выпущу!
	AI_Output(other,self,"DIA_PIR_6136_Abigeil_InPrision_01_33");	//Успокойся! Я отправлюсь обратно в Хоринис и попробую найти улики против Гаспара.
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_InPrision_01_41");	//Ладно, но хорошенько врежешь этому ублюдку!
	KNOWSHANNAINPRISIONCARAGON = TRUE;
	B_LogEntry(TOPIC_ABIGEILHELPHANNA,"После разговора с Абигаль мне все стало ясно. Этот ублюдок Гаспар уже давно хотел заполучить гостиницу, которой управляла Ханна. Думаю, кража вещей у торговца Хакона - это его рук дело. Остается только найти улики, которые позволят уличить Гаспара и снять обвинения с Ханны. Может, попробовать поискать то кольцо, о котором говорил Хакон?");
	AI_StopProcessInfos(self);
};


instance DIA_PIR_6136_ABIGEIL_INPRISIONDONE(C_Info)
{
	npc = pir_6136_abigeil;
	nr = 10;
	condition = dia_pir_6136_abigeil_inprisiondone_condition;
	information = dia_pir_6136_abigeil_inprisiondone_info;
	permanent = FALSE;
	description = "У меня есть для тебя новость.";
};


func int dia_pir_6136_abigeil_inprisiondone_condition()
{
	if((MIS_ABIGEILHELPHANNA == LOG_Running) && (HANNAISFREE == TRUE) && (HANNATAKESNECKLACE == TRUE) && (Kapitel <= 5))
	{
		return TRUE;
	};
};

func void dia_pir_6136_abigeil_inprisiondone_info()
{
	AI_Output(other,self,"DIA_PIR_6136_Abigeil_InPrisionDone_01_00");	//У меня есть для тебя новость.
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_InPrisionDone_01_01");	//Какие новости? Что с моей сестрой? Ну, не тяни!
	AI_Output(other,self,"DIA_PIR_6136_Abigeil_InPrisionDone_01_02");	//Не волнуйся, все в порядке.
	AI_Output(other,self,"DIA_PIR_6136_Abigeil_InPrisionDone_01_03");	//Гаспар за решеткой, а твоя сестра свободна.
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_InPrisionDone_01_04");	//(с обожанием) О! Спасибо тебе!
	AI_Output(self,other,"DIA_PIR_6136_Abigeil_InPrisionDone_01_11");	//Вот, как и договаривались - двести золотых монет.
	B_GiveInvItems(self,other,ItMi_Gold,200);
	MIS_ABIGEILHELPHANNA = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_ABIGEILHELPHANNA,LOG_SUCCESS);
	B_LogEntry(TOPIC_ABIGEILHELPHANNA,"Абигаль поблагодарила меня за помощь ее сестре. И даже поцеловала!");
};