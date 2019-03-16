instance DIA_NONE_119_Assasin_EXIT(C_Info)
{
	npc = NONE_119_Assasin;
	nr = 999;
	condition = DIA_NONE_119_Assasin_EXIT_Condition;
	information = DIA_NONE_119_Assasin_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_NONE_119_Assasin_EXIT_Condition()
{
	return TRUE;
};

func void DIA_NONE_119_Assasin_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_NONE_119_Assasin_PICKPOCKET(C_Info)
{
	npc = NONE_119_Assasin;
	nr = 900;
	condition = DIA_NONE_119_Assasin_PICKPOCKET_Condition;
	information = DIA_NONE_119_Assasin_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int DIA_NONE_119_Assasin_PICKPOCKET_Condition()
{
	return C_Beklauen(95,350);
};

func void DIA_NONE_119_Assasin_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_NONE_119_Assasin_PICKPOCKET);
	Info_AddChoice(DIA_NONE_119_Assasin_PICKPOCKET,Dialog_Back,DIA_NONE_119_Assasin_PICKPOCKET_BACK);
	Info_AddChoice(DIA_NONE_119_Assasin_PICKPOCKET,DIALOG_PICKPOCKET,DIA_NONE_119_Assasin_PICKPOCKET_DoIt);
};

func void DIA_NONE_119_Assasin_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_NONE_119_Assasin_PICKPOCKET);
};

func void DIA_NONE_119_Assasin_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_NONE_119_Assasin_PICKPOCKET);
};


instance DIA_NONE_119_Assasin_PreHallo(C_Info)
{
	npc = NONE_119_Assasin;
	nr = 1;
	condition = DIA_NONE_119_Assasin_PreHallo_Condition;
	information = DIA_NONE_119_Assasin_PreHallo_Info;
	permanent = FALSE;
	description = "Кто ты?";
};

func int DIA_NONE_119_Assasin_PreHallo_Condition()
{
	return TRUE;
};

func void DIA_NONE_119_Assasin_PreHallo_Info()
{
	AI_Output(other,self,"DIA_NONE_119_Assasin_PreHallo_01_00");	//Кто ты?
	AI_Output(self,other,"DIA_NONE_119_Assasin_PreHallo_01_01");	//Мое имя Гонсалес. А большего тебе знать необязательно.
};

instance DIA_NONE_119_Assasin_Hallo(C_Info)
{
	npc = NONE_119_Assasin;
	nr = 1;
	condition = DIA_NONE_119_Assasin_Hallo_Condition;
	information = DIA_NONE_119_Assasin_Hallo_Info;
	permanent = FALSE;
	description = "Ты не похож на жителя этого города.";
};

func int DIA_NONE_119_Assasin_Hallo_Condition()
{
	if(Npc_KnowsInfo(other,DIA_NONE_119_Assasin_PreHallo))
	{
		return TRUE;
	};
};

func void DIA_NONE_119_Assasin_Hallo_Info()
{
	AI_Output(other,self,"DIA_NONE_119_Assasin_Hallo_01_00");	//Ты не похож на жителя этого города.
	AI_Output(self,other,"DIA_NONE_119_Assasin_Hallo_01_01");	//Это так сильно бросается в глаза, да?
	AI_Output(self,other,"DIA_NONE_119_Assasin_Hallo_01_02");	//Хозяин таверны тоже поначалу относился ко мне с подозрением.
	AI_Output(self,other,"DIA_NONE_119_Assasin_Hallo_01_03");	//Однако, когда увидел мой туго натянутый кошелек с золотом, сразу изменил свое отношение.
	AI_Output(self,other,"DIA_NONE_119_Assasin_Hallo_01_04");	//Теперь я один из его лучших клиентов.
	AI_Output(self,other,"DIA_NONE_119_Assasin_Hallo_01_05");	//Ведь все любят золото. И ты наверняка тоже.
	AI_Output(other,self,"DIA_NONE_119_Assasin_Hallo_01_06");	//А что ты здесь делаешь?
	AI_Output(self,other,"DIA_NONE_119_Assasin_Hallo_01_07");	//По возможности стараюсь держаться подальше от неприятностей.
	AI_Output(self,other,"DIA_NONE_119_Assasin_Hallo_01_08");	//И тебе советую придерживаться того же.
};


instance DIA_NONE_119_Assasin_WorkFor(C_Info)
{
	npc = NONE_119_Assasin;
	nr = 1;
	condition = DIA_NONE_119_Assasin_WorkFor_Condition;
	information = DIA_NONE_119_Assasin_WorkFor_Info;
	permanent = FALSE;
	description = "У тебя есть работа для меня?";
};

func int DIA_NONE_119_Assasin_WorkFor_Condition()
{
	if(Npc_KnowsInfo(other,DIA_NONE_119_Assasin_Hallo))
	{
		return TRUE;
	};
};

func void DIA_NONE_119_Assasin_WorkFor_Info()
{
	AI_Output(other,self,"DIA_NONE_119_Assasin_WorkFor_01_00");	//У тебя есть работа для меня?
	AI_Output(self,other,"DIA_NONE_119_Assasin_WorkFor_01_01");	//Хммм...(задумчиво) Как таковой работы у меня для тебя нет.
	AI_Output(self,other,"DIA_NONE_119_Assasin_WorkFor_01_02");	//Но у меня есть одна проблемка, возможно, которую ты мне поможешь решить.
	AI_Output(other,self,"DIA_NONE_119_Assasin_WorkFor_01_03");	//Что именно у тебя случилось?
	AI_Output(self,other,"DIA_NONE_119_Assasin_WorkFor_01_04");	//Видишь ли, во время своего путешествия в Хоринис я потерял свой меч.
	AI_Output(self,other,"DIA_NONE_119_Assasin_WorkFor_01_05");	//Или его украли, я точно не могу сказать.
	AI_Output(self,other,"DIA_NONE_119_Assasin_WorkFor_01_06");	//А местное оружие меня не слишком впечатлило. Оно очень плохого качества и быстро приходит в негодность.
	AI_Output(self,other,"DIA_NONE_119_Assasin_WorkFor_01_07");	//Уверен, ты бываешь в разных местах. И, возможно, тебе попадется на глаза то, что придется мне по душе.
	AI_Output(self,other,"DIA_NONE_119_Assasin_WorkFor_01_08");	//За это я тебя щедро вознагражу. Уж будь уверен.
	AI_Output(other,self,"DIA_NONE_119_Assasin_WorkFor_01_09");	//Ладно, постараюсь найти для тебя что-нибудь подходящее.
	AI_Output(self,other,"DIA_NONE_119_Assasin_WorkFor_01_10");	//Отлично! Ты уж постарайся.
	Log_CreateTopic(TOPIC_AssasinHelp,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AssasinHelp,LOG_Running);
	B_LogEntry(TOPIC_AssasinHelp,"В таверне портового квартала мне повстречался странного вида незнакомец по имени Гонсалес. Он попросил решить его проблему - найти для него оружие, которое бы пришлось ему по душе. По его словам, местное оружие слишком плохого качества и на него нельзя положиться в бою.");
	MIS_AssasinHelp = LOG_Running;
};

instance DIA_NONE_119_Assasin_WorkForDone(C_Info)
{
	npc = NONE_119_Assasin;
	nr = 1;
	condition = DIA_NONE_119_Assasin_WorkForDone_Condition;
	information = DIA_NONE_119_Assasin_WorkForDone_Info;
	permanent = FALSE;
	description = "У меня для тебя кое-что есть.";
};

func int DIA_NONE_119_Assasin_WorkForDone_Condition()
{
	if((MIS_AssasinHelp == LOG_Running) && (Npc_HasItems(other,ItMw_2H_Katana) >= 1))
	{
		return TRUE;
	};
};

func void DIA_NONE_119_Assasin_WorkForDone_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_NONE_119_Assasin_WorkForDone_01_00");	//У меня для тебя кое-что есть.
	AI_Output(self,other,"DIA_NONE_119_Assasin_WorkForDone_01_01");	//Тогда показывай, не тяни. Что у тебя там?
	AI_Output(other,self,"DIA_NONE_119_Assasin_WorkForDone_01_02");	//Держи! Думаю, это оружие придется тебе по душе.
	AI_UnequipWeapons(self);
	B_ClearNpcInventory(self);
	B_GiveInvItems(other,self,ItMw_2H_Katana,1);
	AI_EquipBestMeleeWeapon(self);
	AI_ReadyMeleeWeapon(self);
	AI_PlayAni(self,"T_1HSINSPECT");
	AI_RemoveWeapon(self);
	AI_Output(self,other,"DIA_NONE_119_Assasin_WorkForDone_01_03");	//Невероятно! Где ты достал этот клинок?
	AI_Output(other,self,"DIA_NONE_119_Assasin_WorkForDone_01_04");	//Мне отдал его один из паладинов. Этот меч был одним из его военных трофеев, которые он привез из Варанта.
	AI_Output(self,other,"DIA_NONE_119_Assasin_WorkForDone_01_05");	//Хмм, паладин? Ну что же, это вполне возможно.
	AI_Output(self,other,"DIA_NONE_119_Assasin_WorkForDone_01_06");	//Что же касается меча - думаю, ты не будешь против, если я его оставлю себе. 
	AI_Output(other,self,"DIA_NONE_119_Assasin_WorkForDone_01_07");	//А что насчет обещанной награды?
	AI_Output(self,other,"DIA_NONE_119_Assasin_WorkForDone_01_08");	//Как и договаривались. Вот - тут тысяча золотых монет.
	B_GiveInvItems(self,other,ItMi_Gold,1000);
	AI_Output(self,other,"DIA_NONE_119_Assasin_WorkForDone_01_09");	//Полагаю, что этого вполне хватит, чтобы компенсировать твои хлопоты.
	MIS_AssasinHelp = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_AssasinHelp,LOG_SUCCESS);
	B_LogEntry(TOPIC_AssasinHelp,"Я принес Гонсалесу двуручный меч, который получил от паладина Парсиваля. Он был очень доволен этим оружием.");
};

instance DIA_NONE_119_Assasin_PrioratBlade(C_Info)
{
	npc = NONE_119_Assasin;
	nr = 1;
	condition = DIA_NONE_119_Assasin_PrioratBlade_Condition;
	information = DIA_NONE_119_Assasin_PrioratBlade_Info;
	permanent = FALSE;
	description = "Ты ведь ассасин, не так ли?";
};

func int DIA_NONE_119_Assasin_PrioratBlade_Condition()
{
	if((MIS_PrioratStart == LOG_Running) && (BladePrioratKnowsAssasins == TRUE) && (Npc_HasItems(other,ItMw_1H_AssBlade) >= 1))
	{
		return TRUE;
	};
};

func void DIA_NONE_119_Assasin_PrioratBlade_Info()
{
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratBlade_01_00");	//Ты ведь ассасин, не так ли?
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_01");	//Хммм. (надменно) Ты сам догадался - или подсказал кто-то?
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratBlade_01_02");	//Вижу, что я не ошибся. Тогда ты именно тот, кто мне нужен.
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratBlade_01_03");	//У меня есть к тебе один вопрос, на который, я надеюсь, ты сможешь ответить.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_04");	//Неужели? Ну, спрашивай, если есть.
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratBlade_01_05");	//Ты можешь взглянуть на этот клинок? Я слышал, что он из тех мест, где живете вы - ассасины.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_06");	//Хммм. (с интересом) Ты меня заинтересовал. Показывай его.
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratBlade_01_07");	//Вот, держи.
	B_GiveInvItems(other,self,ItMw_1H_AssBlade,1);
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_08");	//Невероятно... Откуда он у тебя?
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratBlade_01_09");	//По правде говоря, это очень долгая история, и...
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_10");	//(серьезно) У меня достаточно много времени, чтобы ее выслушать.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_11");	//И потом, если ты расскажешь мне, откуда у тебя этот клинок, то я отсыплю тебе такую гору золота, которую ты еще никогда не видел в своей жизни!
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratBlade_01_12");	//Я смотрю, он тебя сильно заинтересовал. Кстати, в основании клинка есть какая-то странная гравировка.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_13");	//В ней все и дело! Обычно такие клинки не редкость в наших краях.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_14");	//Но эти символы...(серьезно) Так ты мне расскажешь, как в твоих руках очутилось это оружие?
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratBlade_01_15");	//Ну хорошо. Это оружие я забрал у одного очень странного типа. 
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_16");	//И как он выглядел?
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratBlade_01_17");	//Его лица я не видел - оно было скрыто под маской.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_18");	//На лице маска, сверху капюшон, а на теле странного вида татуировки?
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratBlade_01_19");	//Именно так.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_20");	//Тогда мне все ясно. А где именно ты его встретил?
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratBlade_01_21");	//Я наткнулся на него в одной из пещер. Он истекал кровью.
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratBlade_01_22");	//Но, несмотря на это, мне стоило больших трудов не дать ему убить себя.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_23");	//Тебе еще повезло, что ты остался жив! Обычно встреча с этими людьми - это последнее, что человек видит в своей жизни.
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratBlade_01_24");	//А кто они? Похоже, ты что-то знаешь о них.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_25");	//Больше, чем ты думаешь.

	if(MIS_AssasinHelp == LOG_SUCCESS)
	{
		B_GivePlayerXP(500);
		B_GiveInvItems(self,other,ItMw_1H_AssBlade,1);
		AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratBlade_01_26");	//Может, тогда расскажешь мне о них?
		AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_27");	//Хммм...(задумчиво) А для тебя это так важно?
		AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratBlade_01_28");	//Ты не представляешь, насколько.
		AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_29");	//Ну хорошо. Ты все-таки помог мне в моей проблеме. А я помогу тебе...
		AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_30");	//Тогда слушай внимательно. Те, с кем ты столкнулся в лесу, именуют себя Тенями Масиафа.
		AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_31");	//Это древнее Братство безжалостных убийц, которое наводит страх на всех жителей Варанта только при одном упоминании их имени.
		AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_32");	//Полагаю, что ты и сам смог убедится в том, насколько сильны и беспощадны эти люди.
		AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_33");	//Здешние местные головорезы - просто дети по сравнению с бойцами Масиафа.
		AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratBlade_01_34");	//И неужели никто не пытался разделаться с ними?
		AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_35");	//Это не так просто, малыш. (ехидно) Выследить даже одного из них практически не представляется возможным. 
		AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_36");	//И то, что тебе это удалось, крайне меня удивляет!
		AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_37");	//Во-вторых, услугами Теней иногда пользуются некоторые влиятельные ассасины, решая свои проблемы с помощью их кинжалов.
		AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_38");	//Поговаривают, что даже сам Зубен прибегал к услугам этого Братства.
		AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratBlade_01_39");	//Зубен?
		AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_40");	//(уважительно) Зубен. Это тот, кто на правах самого сильного из нас, ассасинов, правит Варантом уже долгие годы.
		AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratBlade_01_41");	//Понимаю.
		AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_42");	//Ну, а в-третьих, мало кто решится открыто выступить против них. Поскольку всем попросту дорога их собственная жизнь.
		AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_43");	//Тени ничего, никому и никогда не прощают!
		B_LogEntry(TOPIC_PrioratStart,"Кажется, я нашел того, кого искал. Гонсалес, ассасин из Варанта, только при одном взгляде на загадочный клинок дал понять, что знает, кому он принадлежит. Его хозяином был один из воинов древнего Братства убийц Варанта, именуемого Тенями Масиафа.");
		AssBlaseHistory = TRUE;
	}
	else
	{
		B_GivePlayerXP(250);
		AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_44");	//Однако я тебе не слишком доверяю, чтобы обсуждать с тобой подобные вещи.
		AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_45");	//Вот, возьми свой клинок обратно. Все, что я хотел узнать, я уже выяснил.
		B_GiveInvItems(self,other,ItMw_1H_AssBlade,1);
		B_LogEntry(TOPIC_PrioratStart,"Кажется, я нашел того, кого искал. Гонсалес, ассасин из Варанта, только при одном взгляде на загадочный клинок дал понять что знает, кому он принадлежит. Однако он пока недостаточно мне доверяет, чтобы обсуждать со мной подобные темы.");
		AssDoNotTrust = TRUE;
	};
};

instance DIA_NONE_119_Assasin_PrioratBladeTrust(C_Info)
{
	npc = NONE_119_Assasin;
	nr = 1;
	condition = DIA_NONE_119_Assasin_PrioratBladeTrust_Condition;
	information = DIA_NONE_119_Assasin_PrioratBladeTrust_Info;
	permanent = FALSE;
	description = "Может, теперь ты расскажешь, кто эти люди?";
};


func int DIA_NONE_119_Assasin_PrioratBladeTrust_Condition()
{
	if((MIS_PrioratStart == LOG_Running) && (MIS_AssasinHelp == LOG_SUCCESS) && (AssDoNotTrust == TRUE) && (AssBlaseHistory == FALSE) && (Npc_HasItems(other,ItMw_1H_AssBlade) >= 1))
	{
		return TRUE;
	};
};

func void DIA_NONE_119_Assasin_PrioratBladeTrust_Info()
{
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratBladeTrust_01_00");	//Может, теперь ты расскажешь, кто эти люди?
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBladeTrust_01_01");	//Хммм... (задумчиво) А для тебя это так важно?
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratBladeTrust_01_02");	//Ты не представляешь, насколько.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBladeTrust_01_03");	//Ну хорошо. Ты все-таки помог мне в моей проблеме. А я помогу тебе...
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBladeTrust_01_04");	//Тогда слушай внимательно. Те, с кем ты столкнулся в лесу, именуют себя Тенями Масиафа.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBladeTrust_01_05");	//Это древнее Братство безжалостных убийц, которое наводит страх на всех жителей Варанта только при одном упоминании их имени.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBladeTrust_01_06");	//Полагаю, что ты и сам смог убедится в том, насколько сильны и беспощадны эти люди.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBladeTrust_01_07");	//Здешние головорезы просто дети по сравнению с бойцами Масиафа.
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratBladeTrust_01_08");	//И неужели никто не пытался разделаться с ними?
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBladeTrust_01_09");	//Это не так просто, малыш. (ехидно) Выследить даже одного из них практически не представляется возможным. 
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBladeTrust_01_10");	//И то, что тебе это удалось, крайне меня удивляет!
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBladeTrust_01_11");	//Во-вторых, услугами Теней иногда пользуются некоторые влиятельные ассасины, решая свои проблемы с помощью их кинжалов.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBladeTrust_01_12");	//Поговаривают, что даже сам Зубен прибегал к услугам этого ордена.
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratBladeTrust_01_13");	//Зубен?
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBladeTrust_01_14");	//Зубен. (уважительно) Это тот, кто на правах самого сильного из нас, ассасинов, правит Варантом уже долгие годы.
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratBladeTrust_01_15");	//Понимаю.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBladeTrust_01_16");	//Ну, а в-третьих, мало кто решится открыто выступить против них. Поскольку всем попросту дорога их собственная жизнь.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBladeTrust_01_17");	//Тени ничего, никому и никогда не прощают!
	B_LogEntry(TOPIC_PrioratStart,"По словам Гонсалеса, загадочное оружие принадлежало одному из воинов древнего ордена убийц Варанта, именуемого Тенями Масиафа.");
	AssBlaseHistory = TRUE;
};

instance DIA_NONE_119_Assasin_TellAboutVarrant(C_Info)
{
	npc = NONE_119_Assasin;
	nr = 2;
	condition = DIA_NONE_119_Assasin_TellAboutVarrant_Condition;
	information = DIA_NONE_119_Assasin_TellAboutVarrant_Info;
	permanent = FALSE;
	description = "Расскажи мне о Варанте.";
};

func int DIA_NONE_119_Assasin_TellAboutVarrant_Condition()
{
	if(AssBlaseHistory == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NONE_119_Assasin_TellAboutVarrant_Info()
{
	AI_Output(other,self,"DIA_NONE_119_Assasin_TellAboutVarrant_01_00");	//Расскажи мне о Варанте.
	AI_Output(self,other,"DIA_NONE_119_Assasin_TellAboutVarrant_01_01");	//Да что тут рассказывать. Обычная пустыня. Кругом раскаленный песок, а над головой жаркое палящее солнце.
	AI_Output(self,other,"DIA_NONE_119_Assasin_TellAboutVarrant_01_02");	//Жара стоит такая, что легко может свести с ума неподготовленного человека!
	AI_Output(self,other,"DIA_NONE_119_Assasin_TellAboutVarrant_01_03");	//Но за долгие годы мы, местные жители, научились ее как-то переносить.
	AI_Output(other,self,"DIA_NONE_119_Assasin_TellAboutVarrant_01_04");	//Ясно.
};

instance DIA_NONE_119_Assasin_HotReduce(C_Info)
{
	npc = NONE_119_Assasin;
	nr = 2;
	condition = DIA_NONE_119_Assasin_HotReduce_Condition;
	information = DIA_NONE_119_Assasin_HotReduce_Info;
	permanent = FALSE;
	description = "Ты можешь научить меня переносить жару?";
};

func int DIA_NONE_119_Assasin_HotReduce_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_NONE_119_Assasin_TellAboutVarrant) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NONE_119_Assasin_HotReduce_Info()
{
	AI_Output(other,self,"DIA_NONE_119_Assasin_HotReduce_01_00");	//А МЕНЯ ты можешь научить переносить жару?
	AI_Output(self,other,"DIA_NONE_119_Assasin_HotReduce_01_01");	//Хммм. (оценивающе) Даже и не знаю. Вообще-то этому учатся многие годы.
	AI_Output(self,other,"DIA_NONE_119_Assasin_HotReduce_01_02");	//Но я могу дать тебе некоторые советы, как можно немного справиться с удушьем жары и солнечными ожогами.
	AI_Output(self,other,"DIA_NONE_119_Assasin_HotReduce_01_03");	//Правда, тебе понадобится для этого некоторый опыт. Ну и от пары золотых монет я тоже не откажусь.
	GonsaCanTeachMeHot = TRUE;
};

instance DIA_NONE_119_Assasin_HotReduceTeach(C_Info)
{
	npc = NONE_119_Assasin;
	nr = 800;
	condition = DIA_NONE_119_Assasin_HotReduceTeach_Condition;
	information = DIA_NONE_119_Assasin_HotReduceTeach_Info;
	permanent = TRUE;
	description = "Научи меня переносить жару (Очки обучения: 10, Цена: 5000 монет)";
};

func int DIA_NONE_119_Assasin_HotReduceTeach_Condition()
{
	if((GonsaCanTeachMeHot == TRUE) && (HotReduceKnow == FALSE))
	{
		return TRUE;
	};
};

func void DIA_NONE_119_Assasin_HotReduceTeach_Info()
{
	var int kosten;
	var int money;

	AI_Output(other,self,"DIA_NONE_119_Assasin_HotReduceTeach_01_00");	//Научи меня переносить жару.

	kosten = 10;
	money = 5000;

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		AI_Output(self,other,"DIA_NONE_119_Assasin_HotReduceTeach_01_01");	//Извини, но для этого у тебя еще не хватает опыта.
		AI_StopProcessInfos(self);
	};

	if(Npc_HasItems(hero,ItMi_Gold) < money)
	{
		AI_Print(Print_NotEnoughGold);
		AI_Output(self,other,"DIA_NONE_119_Assasin_HotReduceTeach_01_02");	//Извини, но бесплатно я этого делать не стану.
		AI_StopProcessInfos(self);
	};
	if((hero.lp >= kosten) && (Npc_HasItems(hero,ItMi_Gold) >= money))
	{
		AI_Output(self,other,"DIA_NONE_119_Assasin_HotReduceTeach_01_03");	//Не делай лишних движений.
		AI_Output(self,other,"DIA_NONE_119_Assasin_HotReduceTeach_01_04");	//Двигайся как можно меньше, экономь силы.
		AI_Output(self,other,"DIA_NONE_119_Assasin_HotReduceTeach_01_05");	//Жара может быть более изнуряющей, чем бой с целой стаей монстров.
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + kosten;
		Npc_RemoveInvItems(hero,ItMi_Gold,money);
		hero.protection[PROT_FIRE] += 5;
		REALPROTFIRE += 5;
		AI_Print(PRINT_LEARNPROTHOT);
		HotReduceKnow = TRUE;
		Snd_Play("LevelUP");
	};
};

instance DIA_NONE_119_Assasin_PrioratBladeKnown(C_Info)
{
	npc = NONE_119_Assasin;
	nr = 1;
	condition = DIA_NONE_119_Assasin_PrioratBladeKnown_Condition;
	information = DIA_NONE_119_Assasin_PrioratBladeKnown_Info;
	permanent = FALSE;
	description = "А что насчет самого оружия?";
};

func int DIA_NONE_119_Assasin_PrioratBladeKnown_Condition()
{
	if((MIS_PrioratStart == LOG_Running) && (AssBlaseHistory == TRUE) && (Npc_HasItems(other,ItMw_1H_AssBlade) >= 1))
	{
		return TRUE;
	};
};

func void DIA_NONE_119_Assasin_PrioratBladeKnown_Info()
{
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratBladeKnown_01_00");	//А что насчет самого оружия?
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBladeKnown_01_01");	//Мы, ассасины, называем его Кама. Легкое, очень прочное и смертельно опасное для тех, кто решится встать у него на пути.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBladeKnown_01_02");	//Но будь осторожен, если решишь использовать его. Лезвие этого клинка отравлено сильнодействующим ядом.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBladeKnown_01_03");	//Это большое преимущество в тех случаях, когда клинок бессилен.
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratBladeKnown_01_04");	//Понимаю.
	Npc_RemoveInvItems(other,ItMw_1H_AssBlade,Npc_HasItems(other,ItMw_1H_AssBlade));
	CreateInvItems(other,ItMw_1H_AssBlade_Known,1);
	B_LogEntry(TOPIC_PrioratStart,"Само оружие ассасины называют Кама. Если я решу его использовать, то мне надо будет учесть, что лезвие клинка смазано сильнодействующим ядом и способно убить практически любое живое существо.");
};


instance DIA_NONE_119_Assasin_PrioratNeedFind(C_Info)
{
	npc = NONE_119_Assasin;
	nr = 1;
	condition = DIA_NONE_119_Assasin_PrioratNeedFind_Condition;
	information = DIA_NONE_119_Assasin_PrioratNeedFind_Info;
	permanent = FALSE;
	description = "По поводу этого Братства...";
};


func int DIA_NONE_119_Assasin_PrioratNeedFind_Condition()
{
	if((MIS_PrioratStart == LOG_Running) && (AssBlaseHistory == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_119_Assasin_PrioratNeedFind_Info()
{
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratNeedFind_01_01");	//По поводу этого Братства...
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratNeedFind_01_02");	//У тебя нет никаких мыслей насчет того, каким образом те парни могли оказаться на этом острове?
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratNeedFind_01_03");	//По всей видимости, что-то привело их сюда. Просто так Братство никогда бы не покинуло Варант.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratNeedFind_01_04");	//Правда, ходили слухи, что в последнее время Масиаф стал слишком кровожаден, и это не особо пришлось по душе Зубену.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratNeedFind_01_05");	//В итоге под его давлением Теням пришлось скрыться на время.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratNeedFind_01_06");	//И, по всей видимости, этот остров пришелся им по душе.
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratNeedFind_01_07");	//Полагаешь, у меня есть шансы отыскать их здесь?
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratNeedFind_01_08");	//Ну, раз ты смог выследить одного из них, то и остальных, думаю, сможешь. Чем Белиар не шутит?
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratNeedFind_01_09");	//Однако ты должен понимать, что в одиночку тебе вряд ли удастся справиться с ними.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratNeedFind_01_10");	//Поэтому если ты все-таки узнаешь, где находится их укрытие - не забудь сообщить мне об этом.
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratNeedFind_01_11");	//А тебе-то это зачем?
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratNeedFind_01_12");	//Сейчас это не так важно. (серьезно) Просто дай знать, что нашел место, где скрывается Масиаф.
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratNeedFind_01_13");	//Ну ладно.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratNeedFind_01_14");	//Смотри не забудь.
	GonsalesRemind = TRUE;
};


instance DIA_NONE_119_Assasin_AmuletFind(C_Info)
{
	npc = NONE_119_Assasin;
	nr = 1;
	condition = DIA_NONE_119_Assasin_AmuletFind_Condition;
	information = DIA_NONE_119_Assasin_AmuletFind_Info;
	permanent = FALSE;
	description = "Полагаю, что эта вещица тебя заинтересует.";
};


func int DIA_NONE_119_Assasin_AmuletFind_Condition()
{
	if((MIS_PrioratStart == LOG_Running) && (AssInvasionStop == TRUE) && (NamibAmuletResearch == FALSE))
	{
		return TRUE;
	};
};

func void DIA_NONE_119_Assasin_AmuletFind_Info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_NONE_119_Assasin_AmuletFind_01_01");	//Полагаю, что эта вещица тебя заинтересует.
	AI_Output(self,other,"DIA_NONE_119_Assasin_AmuletFind_01_02");	//Какая именно?
	AI_Output(other,self,"DIA_NONE_119_Assasin_AmuletFind_01_03");	//Вот, взгляни на этот амулет.
	AI_Output(self,other,"DIA_NONE_119_Assasin_AmuletFind_01_04");	//Хммм. (задумчиво) Амулет? Нет, приятель, это вовсе не амулет. Хотя и выглядит довольно схоже.
	AI_Output(other,self,"DIA_NONE_119_Assasin_AmuletFind_01_05");	//А что же тогда?
	AI_Output(self,other,"DIA_NONE_119_Assasin_AmuletFind_01_06");	//Этот медальон, что ты мне сейчас показал - не что иное, как тайный знак Братства Масиафа!
	AI_Output(other,self,"DIA_NONE_119_Assasin_AmuletFind_01_07");	//Ты в этом уверен?
	AI_Output(self,other,"DIA_NONE_119_Assasin_AmuletFind_01_08");	//Его очень трудно спутать с чем-либо еще, уж поверь мне.
	AI_Output(self,other,"DIA_NONE_119_Assasin_AmuletFind_01_09");	//И, раз ты держишь его у себя в руках, то, значит, смог подобраться к ним ближе, чем это можно себе представить.
	AI_Output(other,self,"DIA_NONE_119_Assasin_AmuletFind_01_10");	//Что ты имеешь в виду?
	AI_Output(self,other,"DIA_NONE_119_Assasin_AmuletFind_01_11");	//Видишь этот металлический узор, изображенный в центре медальона? Он сделан не просто так.
	AI_Output(self,other,"DIA_NONE_119_Assasin_AmuletFind_01_12");	//Если верить слухам, Тени Масиафа используют его в качестве ключа, чтобы открывать потайные ходы, ведущие в их логова.
	AI_Output(self,other,"DIA_NONE_119_Assasin_AmuletFind_01_13");	//(задумчиво) Правда это или нет... никто точно не знает.
	AI_Output(self,other,"DIA_NONE_119_Assasin_AmuletFind_01_14");	//Но заполучить подобную вещь представляется почти невозможным, если ты, конечно, не один из них.
	AI_Output(other,self,"DIA_NONE_119_Assasin_AmuletFind_01_15");	//Просто удача на моей стороне.
	AI_Output(self,other,"DIA_NONE_119_Assasin_AmuletFind_01_16");	//Как знать. Многие предпочитают держаться от подобных вещей подальше.
	AI_Output(self,other,"DIA_NONE_119_Assasin_AmuletFind_01_17");	//Но, по всей видимости, ты не из их числа.
	AI_Output(self,other,"DIA_NONE_119_Assasin_AmuletFind_01_18");	//(серьезно) И еще. Если вдруг найдешь что-нибудь интересное, сообщи об этом.
	AI_Output(other,self,"DIA_NONE_119_Assasin_AmuletFind_01_19");	//Хорошо.
	PlayerKnowsMasiafKey = TRUE;
	B_LogEntry(TOPIC_PrioratStart,"Я показал Гонсалесу тот амулет, что я нашел у одного из убийц. По его словам, этот амулет - тайный знак Братства Масиафа. Тени используют этот медальон в качестве ключа. Однако что именно можно открыть этим ключом, никто толком не знает. Гонсалес попросил меня сообщить ему, если я вдруг наткнусь на что-нибудь интересное.");
};

instance DIA_NONE_119_Assasin_PrioratFindOk(C_Info)
{
	npc = NONE_119_Assasin;
	nr = 1;
	condition = DIA_NONE_119_Assasin_PrioratFindOk_Condition;
	information = DIA_NONE_119_Assasin_PrioratFindOk_Info;
	permanent = FALSE;
	description = "У меня есть для тебя новости.";
};

func int DIA_NONE_119_Assasin_PrioratFindOk_Condition()
{
	if((MIS_PrioratStart == LOG_Running) && (GonsalesRemind == TRUE) && (ReadyGoForMasiafLair == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_119_Assasin_PrioratFindOk_Info()
{
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratFindOk_01_01");	//У меня есть для тебя новости.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratFindOk_01_02");	//Хммм...(ехидно) Надеюсь, что они хорошие.
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratFindOk_01_03");	//Я нашел тайный проход в скале. 
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratFindOk_01_04");	//И что с того?
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratFindOk_01_05");	//Этот проход открылся, когда я использовал амулет, найденный у одного из твоих старых друзей.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratFindOk_01_06");	//Вот это уже интересней! И ты уже ходил туда?
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratFindOk_01_07");	//Еще нет. Но я собираюсь отправиться туда и выяснить, что сокрыто по ту сторону прохода.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratFindOk_01_08");	//Хорошо. Но прежде чем это сделать, я хочу, чтобы ты отвел меня к этому месту. Сможешь?
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratFindOk_01_09");	//Конечно.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratFindOk_01_10");	//Тогда пошли. Пора немного прогуляться, а то эта таверна мне уже порядком надоела.
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratFindOk_01_11");	//Иди за мной.
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"FollowMasiafLair");
	Log_CreateTopic(TOPIC_FollowMasiafLair,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FollowMasiafLair,LOG_Running);
	B_LogEntry(TOPIC_FollowMasiafLair,"Гонсалес попросил меня отвести его к тайному проходу, который мне удалось открыть.");
	MIS_FollowMasiafLair = LOG_Running;
};


instance DIA_NONE_119_Assasin_ANGEKOMMEN(C_Info)
{
	npc = NONE_119_Assasin;
	nr = 55;
	condition = DIA_NONE_119_Assasin_ANGEKOMMEN_Condition;
	information = DIA_NONE_119_Assasin_ANGEKOMMEN_Info;
	important = TRUE;
};

func int DIA_NONE_119_Assasin_ANGEKOMMEN_Condition()
{
	if((MIS_FollowMasiafLair == LOG_Running) && (Npc_GetDistToWP(self,"NW_ASSASINS_ENTRANCE_01") < 2000))
	{
		return TRUE;
	};
};

func void DIA_NONE_119_Assasin_ANGEKOMMEN_Info()
{
	B_GivePlayerXP(500);
	AI_Output(self,other,"DIA_NONE_119_Assasin_ANGEKOMMEN_01_00");	//Постой! Я уже вижу его.
	AI_Output(other,self,"DIA_NONE_119_Assasin_ANGEKOMMEN_01_01");	//Да, этот тот самый проход, о котором я тебе говорил.
	AI_Output(self,other,"DIA_NONE_119_Assasin_ANGEKOMMEN_01_02");	//Спасибо, что довел. Дальше я как-нибудь сам.
	AI_Output(other,self,"DIA_NONE_119_Assasin_ANGEKOMMEN_01_03");	//И что ты теперь собираешься делать?
	AI_Output(self,other,"DIA_NONE_119_Assasin_ANGEKOMMEN_01_04");	//Сначала немного передохну, а потом двину дальше - проверю, куда ведет эта пещера.
	AI_Output(self,other,"DIA_NONE_119_Assasin_ANGEKOMMEN_01_05");	//Кстати, если ты собрался сделать то же самое, то на твоем месте я бы сначала очень хорошо подготовился.
	AI_Output(self,other,"DIA_NONE_119_Assasin_ANGEKOMMEN_01_06");	//Ибо, если там окажется то, о чем я подумал... Это запросто может стать для тебя просто непосильной ношей.
	AI_Output(other,self,"DIA_NONE_119_Assasin_ANGEKOMMEN_01_07");	//Хорошо, буду иметь в виду.
	AI_Output(self,other,"DIA_NONE_119_Assasin_ANGEKOMMEN_01_08");	//Не за что, приятель. Ладно, давай, еще увидимся.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	MIS_FollowMasiafLair = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_FollowMasiafLair,LOG_SUCCESS);
	B_LogEntry(TOPIC_FollowMasiafLair,"Я довел Гонсалеса до места назначения.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"TOT");
};


//--------------------Гонсалес в PRIORAT-------------------------------



instance DIA_NONE_1190_Assasin_EXIT(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 999;
	condition = DIA_NONE_1190_Assasin_EXIT_Condition;
	information = DIA_NONE_1190_Assasin_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_NONE_1190_Assasin_EXIT_Condition()
{
	return TRUE;
};

func void DIA_NONE_1190_Assasin_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_NONE_1190_Assasin_PICKPOCKET(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 900;
	condition = DIA_NONE_1190_Assasin_PICKPOCKET_Condition;
	information = DIA_NONE_1190_Assasin_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int DIA_NONE_1190_Assasin_PICKPOCKET_Condition()
{
	return C_Beklauen(95,350);
};

func void DIA_NONE_1190_Assasin_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_NONE_1190_Assasin_PICKPOCKET);
	Info_AddChoice(DIA_NONE_1190_Assasin_PICKPOCKET,Dialog_Back,DIA_NONE_1190_Assasin_PICKPOCKET_BACK);
	Info_AddChoice(DIA_NONE_1190_Assasin_PICKPOCKET,DIALOG_PICKPOCKET,DIA_NONE_1190_Assasin_PICKPOCKET_DoIt);
};

func void DIA_NONE_1190_Assasin_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_NONE_1190_Assasin_PICKPOCKET);
};

func void DIA_NONE_1190_Assasin_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_NONE_1190_Assasin_PICKPOCKET);
};


instance DIA_NONE_1190_Assasin_PreHallo(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_PreHallo_Condition;
	information = DIA_NONE_1190_Assasin_PreHallo_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_NONE_1190_Assasin_PreHallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_PreHallo_Info()
{
	AI_Output(self,other,"DIA_NONE_1190_Assasin_PreHallo_01_00");	//Ага, вот и ты! Давай, подсаживайся к костру, погрейся.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_PreHallo_01_01");	//Спешить теперь все равно некуда.
};


instance DIA_NONE_1190_Assasin_Hallo(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_Hallo_Condition;
	information = DIA_NONE_1190_Assasin_Hallo_Info;
	permanent = FALSE;
	description = "Что это за место?";
};

func int DIA_NONE_1190_Assasin_Hallo_Condition()
{
	return TRUE;
};

func void DIA_NONE_1190_Assasin_Hallo_Info()
{
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Hallo_01_00");	//Что это за место?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_01_01");	//Откуда мне знать? Я, как и ты, тут впервые.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_01_02");	//Но могу посоветовать тебе одну вещь - я бы дальше этого места не ходил.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Hallo_01_03");	//Почему?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_01_04");	//Потому что там, кроме смерти, тебя ничего не ждет. Если, конечно, ты не задумал покончить с собой.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Hallo_01_05");	//А что там такого опасного?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_01_06");	//Впереди находится святилище Братства Масиаф. (серьезно) И я не думаю, что эти парни будут рады тебя видеть.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Hallo_01_07");	//Так значит, мы нашли их логово?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_01_08");	//Да, но... Вопрос в другом - что теперь делать со всем этим?
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Hallo_01_09");	//И какие у тебя мысли на этот счет?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_01_10");	//Ну, на мой взгляд, мне видится только, ммм... три решения этой проблемы.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_01_11");	//Если ты уверен в своих силах, то мы можем попробовать атаковать их в лоб.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_01_12");	//Хотя по мне это абсолютно глупая затея. Скорее всего, мы даже не дойдем до ворот храма.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_01_13");	//Поскольку перевес явно не в нашу пользу.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_01_14");	//Во-вторых, мы можем просто уйти отсюда и забыть обо всем этом, как о страшном сне.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_01_15");	//Точнее, уйдешь только ты, поскольку я не для того пересек море, чтобы так легко отказаться от своих планов.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_01_16");	//Ну, а ты спасешь себе жизнь. Уж она того стоит, поверь.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Hallo_01_17");	//Не хочу тебя расстраивать, но обратный проход завалило камнями, так что уйти отсюда просто так не удастся.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_01_18");	//Тем лучше! Значит, теперь не придется выбирать.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Hallo_01_19");	//Ладно. А что там насчет третьего?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_01_20");	//Последний вариант еще хуже, чем первые два. Надо как-то попытаться проникнуть в храм, но без лишнего шума.

	if((PlayerIsPrioratFake == FALSE) && (InsMasiafKillers == FALSE))
	{
		AI_Output(other,self,"DIA_NONE_1190_Assasin_Hallo_01_21");	//Ты знаешь, как это сделать?
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_01_22");	//Нет. Но у меня есть одна идея. И она может сработать.
		AI_Output(other,self,"DIA_NONE_1190_Assasin_Hallo_01_23");	//Тогда выкладывай, не тяни.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_01_24");	//Хорошо! Так вот. (серьезно) Я нахожусь тут уже несколько дней, и за это время успел кое-что разнюхать.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_01_25");	//Иногда из храма по направлению к вон той скале ходит один из послушников Масиаф.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_01_26");	//Сначала я не придал этому большого значения, - до тех пор, пока не увидел, с кем он возвращается обратно.
		AI_Output(other,self,"DIA_NONE_1190_Assasin_Hallo_01_27");	//И с кем же?
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_01_28");	//Как оказалось, он вел с собой обратно в храм нескольких рабов.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_01_29");	//Я решил проверить то место, и, как оказалось, в скале есть пещера.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_01_30");	//Заходить вглубь я не стал, но, судя по всему, там они держат своих пленников.
		AI_Output(other,self,"DIA_NONE_1190_Assasin_Hallo_01_31");	//И что ты предлагаешь?
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_01_32");	//Единственный шанс попасть в храм, не привлекая к себе внимания, это выдать себя за одного из них.
		AI_Output(other,self,"DIA_NONE_1190_Assasin_Hallo_01_33");	//План, конечно, хорош, но почему бы это не сделать тебе самому?
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_01_34");	//Нет! Некоторые из них видели меня раньше. А вот ты - другое дело!
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_01_35");	//Убьешь его, заберешь доспехи, и вместо него отведешь рабов обратно к святилищу. 
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_01_36");	//Уверен, что с одним-то бойцом ты должен справиться.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_01_37");	//А уж дальше решим, что нам делать.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_01_38");	//Ну так как, что скажешь?
		Info_ClearChoices(DIA_NONE_1190_Assasin_Hallo);
		Info_AddChoice(DIA_NONE_1190_Assasin_Hallo,"Я бы предпочел бой.",DIA_NONE_1190_Assasin_Hallo_Fight);
		Info_AddChoice(DIA_NONE_1190_Assasin_Hallo,"Надеюсь, что твой план сработает.",DIA_NONE_1190_Assasin_Hallo_Spy);
	}
	else
	{
		Info_ClearChoices(DIA_NONE_1190_Assasin_Hallo);
		Info_AddChoice(DIA_NONE_1190_Assasin_Hallo,"Я бы предпочел бой.",DIA_NONE_1190_Assasin_Hallo_Fight);
	};
};

func void DIA_NONE_1190_Assasin_Hallo_Fight()
{
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Hallo_Fight_01_01");	//Я бы предпочел бой.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_Fight_01_02");	//Эх, горячая ты голова, как я погляжу... 
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_Fight_01_03");	//Но, раз ты так уверен в себе, то тогда не будем терять времени.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_Fight_01_04");	//Иди вперед, я за тобой!
	PlayerChooseFight_PW = TRUE;
	PlayerIsPrioratFake = TRUE;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	MIS_MasiafStory = LOG_Running;
	Log_CreateTopic(TOPIC_MasiafStory,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MasiafStory,LOG_Running);
	B_LogEntry(TOPIC_MasiafStory,"Я вновь повстречал Гонсалеса. По его словам, в этой долине находится храм Теней, Братства фанатиков Масиаф. Кажется, я нашел то, что искал. Теперь осталось понять, что нам делать дальше. Я без раздумий предложил Гонсалесу атаковать храм. Эта идея показалась ему немного абсурдной, но он поддержит меня. Итак, пора нам покончить с этим мерзким отродьем.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FollowMasiafTemple");
	Npc_ExchangeRoutine(Ass_126_Haniar,"TOT");
	AI_Teleport(Ass_126_Haniar,"TOT");
	Wld_InsertNpc(Ass_129_DeadNrozas,"PW_INNER_DEMON_SPAWN");
};

func void DIA_NONE_1190_Assasin_Hallo_Spy()
{
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Hallo_Spy_01_01");	//Надеюсь, что твой план сработает.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_Spy_01_02");	//Если он не сработает, то в скором времени мы оба с тобой будем мертвы.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_Spy_01_03");	//Тени поймут, что они не одни тут, и наверняка пошлют найти нас.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_Spy_01_04");	//А это лишь всего вопрос времени!
	MIS_MasiafStory = LOG_Running;
	Log_CreateTopic(TOPIC_MasiafStory,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MasiafStory,LOG_Running);
	B_LogEntry(TOPIC_MasiafStory,"Я вновь повстречал Гонсалеса. По его словам, в этой долине находится храм фанатиков Масиаф. Кажется, я нашел то, что искал. Теперь осталось понять, что нам делать дальше. Гонсалес предложил пойти на хитрость и тайком проникнуть в храм. Каждое утро из храма по направлению к высокой горе ходит один из послушников Братства, а обратно он возвращается с пленными рабами. Если перехватить этот конвой, то, возможно, мне удастся без малейших подозрений проникнуть в святилище, выдав себя за послушника Масиаф.");
	PlayerChooseSpy_PW = TRUE;
	Info_ClearChoices(DIA_NONE_1190_Assasin_Hallo);
};

var int PW_BeginFakeOnceAgainQuest;

instance DIA_NONE_1190_Assasin_When(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_When_Condition;
	information = DIA_NONE_1190_Assasin_When_Info;
	permanent = TRUE;
	description = "Когда начнем?";
};

func int DIA_NONE_1190_Assasin_When_Condition()
{
	if((PlayerChooseSpy_PW == TRUE) && (PW_BeginFake == FALSE) && (PlayerIsPrioratFake == FALSE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_When_Info()
{
	AI_Output(other,self,"DIA_NONE_1190_Assasin_When_01_00");	//Когда начнем?

	if(Wld_IsTime(7,0,8,0))
	{
		AI_Output(self,other,"DIA_NONE_1190_Assasin_When_01_01");	//Сейчас. Думаю, что в это время он уже должен вести рабов обратно в храм.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_When_01_02");	//Но смотри, у тебя будет только один шанс.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_When_01_03");	//Если он от тебя сбежит, то поднимет тревогу. И тогда все пропало.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_When_01_04");	//Так что смотри не наломай дров.
		AI_Output(other,self,"DIA_NONE_1190_Assasin_When_01_05");	//Постараюсь.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_When_01_06");	//И еще одна вещь, которую тебе следует знать. Ни с кем не заговаривай сам!
		AI_Output(self,other,"DIA_NONE_1190_Assasin_When_01_07");	//Насколько мне известно, у Масиафа свои правила на этот счет.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_When_01_08");	//Если ты сделаешь что-то не так, то все сразу поймут, кто ты.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_When_01_09");	//И живым ты уже оттуда не выйдешь. Запомнил?
		AI_Output(other,self,"DIA_NONE_1190_Assasin_When_01_10");	//Да. А куда мне идти?
		AI_Output(self,other,"DIA_NONE_1190_Assasin_When_01_11");	//Иди прямо, вглубь долины, пока не выйдешь на небольшую тропку.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_When_01_12");	//Там и поджидай их. Теперь поспеши!
		B_LogEntry(TOPIC_MasiafStory,"Итак, пришло время действовать. Мне нужно выследить послушника и его рабов, после чего разделаться с ним и, одев его доспехи, попытаться проникнуть в храм Теней. Надеюсь, у меня все получится, иначе придется прорубать себе дорогу мечом.");
		PW_BeginFake = TRUE;
		AI_StopProcessInfos(self);
		Wld_InsertNpc(Ass_167_Adept_Convoy,"PW_CONVOY_START_01");
		Wld_InsertNpc(SEK_168_SLAVEOBSSEK,"PW_CONVOY_START_01");
	}
	else
	{
		if(PW_BeginFakeOnceAgainQuest == FALSE)
		{
			AI_Output(self,other,"DIA_NONE_1190_Assasin_When_01_13");	//Надо дождаться утра, примерно часов семи. (зевая) Раньше этого времени никто не появится.
			AI_Output(other,self,"DIA_NONE_1190_Assasin_When_01_14");	//Понимаю.
			PW_BeginFakeOnceAgainQuest = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_NONE_1190_Assasin_When_01_15");	//Я же сказал - ждем утра! Ты что, меня не слушаешь?
			AI_StopProcessInfos(self);
		};
	};
};

instance DIA_NONE_1190_Assasin_WhatYourGoal(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_WhatYourGoal_Condition;
	information = DIA_NONE_1190_Assasin_WhatYourGoal_Info;
	permanent = FALSE;
	description = "Что тебя связывает с Масиафом?";
};

func int DIA_NONE_1190_Assasin_WhatYourGoal_Condition()
{
	if(PlayerChooseSpy_PW == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_WhatYourGoal_Info()
{
	AI_Output(other,self,"DIA_NONE_1190_Assasin_WhatYourGoal_01_00");	//Что тебя связывает с Масиафом?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhatYourGoal_01_01");	//О, это долгая история. Может быть, потом я тебе ее расскажу.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhatYourGoal_01_02");	//Но сейчас лучше не спрашивай.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_WhatYourGoal_01_03");	//Ладно.
};


instance DIA_NONE_1190_Assasin_WhatAbout(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_WhatAbout_Condition;
	information = DIA_NONE_1190_Assasin_WhatAbout_Info;
	permanent = FALSE;
	description = "Что ты еще можешь рассказать мне про Масиаф?";
};

func int DIA_NONE_1190_Assasin_WhatAbout_Condition()
{
	if(PlayerChooseSpy_PW == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_WhatAbout_Info()
{
	AI_Output(other,self,"DIA_NONE_1190_Assasin_WhatAbout_01_00");	//Что ты еще можешь рассказать мне про Масиаф?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhatAbout_01_01");	//Хммм... (задумчиво) Не очень много.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhatAbout_01_02");	//Если быть кратким, то Масиаф - это слепые фанатики, не знающие ни жалости, ни милосердия.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhatAbout_01_03");	//Их Братству насчитывается уже несколько столетий, и иcпокон веков их имя вызывало только страх и трепет.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhatAbout_01_04");	//Этих людей, если их так и можно назвать, в чем я лично сомневаюсь...(серьезно) ...ничего не остановит на их пути.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhatAbout_01_05");	//Будучи выходцами из Варанта, они поклоняются Белиару, как и все ассасины.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhatAbout_01_06");	//Однако вместо золота они приносят ему в дар человеческие жизни!
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhatAbout_01_07");	//Поговаривают, что сам Белиар покровительствует им лично, но это всего лишь слухи.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhatAbout_01_08");	//Сами законы Масиафа жестоки и суровы. 
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhatAbout_01_09");	//Железная дисциплина и изнурительные тренировки делают их бойцов лучшими войнами, которых мне доводилось видеть.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhatAbout_01_10");	//Я лично наблюдал, как один единственный элитный боец Масиаф перебил всю охрану в несколько десятков человек одного из наместников Зубена!
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhatAbout_01_11");	//После чего, судя по всему, у них и начались проблемы, из-за которых им пришлось покинуть материк и перебраться сюда.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhatAbout_01_12");	//Так что против нас выступает достойнейший противник, которого ни в коем случае нельзя недооценивать.
};

instance DIA_NONE_1190_Assasin_WhatAdvise(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_WhatAdvise_Condition;
	information = DIA_NONE_1190_Assasin_WhatAdvise_Info;
	permanent = FALSE;
	description = "Можешь дать мне какой-нибудь совет?";
};

func int DIA_NONE_1190_Assasin_WhatAdvise_Condition()
{
	if(PlayerChooseSpy_PW == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_WhatAdvise_Info()
{
	AI_Output(other,self,"DIA_NONE_1190_Assasin_WhatAdvise_01_00");	//Можешь дать мне какой-нибудь совет?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhatAdvise_01_01");	//Не делай того, в чем не уверен.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhatAdvise_01_02");	//В нашем деле любая неточность приведет к провалу, а что еще хуже, к твоей гибели.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhatAdvise_01_03");	//Также, когда пойдешь в храм, лучше снять с себя шлем и щит.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_WhatAdvise_01_04");	//Почему?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhatAdvise_01_05");	//Это запросто выдаст тебя! Бойцы Масиафа не используют эти виды защиты.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhatAdvise_01_06");	//И не смей там ничего воровать! Воров нигде не жалуют...
	AI_Output(other,self,"DIA_NONE_1190_Assasin_WhatAdvise_01_07");	//Ясно.
	B_LogEntry(TOPIC_MasiafStory,"Гонсалес посоветовал мне снять шлем и щит, если я отправлюсь в храм Масиаф. Тени не используют данный вид брони и запросто вычислят во мне чужака, если они будут на мне надеты. Ну, и воровать там тоже не стоит.");
};

instance DIA_NONE_1190_Assasin_InHram(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_InHram_Condition;
	information = DIA_NONE_1190_Assasin_InHram_Info;
	permanent = FALSE;
	description = "Мне удалось попасть в храм.";
};

func int DIA_NONE_1190_Assasin_InHram_Condition()
{
	if(MeetNrozas == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_InHram_Info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_NONE_1190_Assasin_InHram_01_00");	//Мне удалось попасть в храм.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_InHram_01_01");	//Значит, тебе удалось сойти за одного из их послушников? Это хорошие новости! Что еще?
	AI_Output(other,self,"DIA_NONE_1190_Assasin_InHram_01_03");	//Я привел послушника к некоему Нрозасу. Все остальные называли его мастером.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_InHram_01_04");	//По всей видимости, это один из приоров Масиафа.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_InHram_01_05");	//А кто это такие?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_InHram_01_06");	//Насколько мне известно, эти люди стоят во главе всего Братства и пользуются безграничным уважением среди фанатиков. 
	AI_Output(self,other,"DIA_NONE_1190_Assasin_InHram_01_07");	//Поэтому с ними надо быть особенно осторожным!
	AI_Output(other,self,"DIA_NONE_1190_Assasin_InHram_01_08");	//Нрозас дал мне несколько поручений, которые я должен выполнить.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_InHram_01_09");	//Полагаю, что тогда надо воспользоваться этим шансом.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_InHram_01_10");	//Если ты проявишь себя, то, возможно, завоюешь его уважение, и это даст нам возможность узнать о них немного больше.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_InHram_01_11");	//Так что продолжай выполнять их поручения, если такие будут.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_InHram_01_12");	//И, надеюсь, что в итоге мы отыщем их слабое место, и тогда нанесем смертельный удар!
	AI_Output(other,self,"DIA_NONE_1190_Assasin_InHram_01_13");	//Я все понял.
	B_LogEntry(TOPIC_MasiafStory,"Я сообщил Гонсалесу, что мне удалось проникнуть в храм Масиафа. Он был удивлен моей прыти, и посоветовал побыть в роли послушника и присмотреться к происходящему.");
};

instance DIA_NONE_1190_Assasin_NARUG(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_NARUG_Condition;
	information = DIA_NONE_1190_Assasin_NARUG_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_NONE_1190_Assasin_NARUG_Condition()
{
	if((MIS_AssasinGold == LOG_Running) && (NarugIsDeadNow == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_NARUG_Info()
{
	AI_ReadyMeleeWeapon(self);
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NARUG_01_00");	//Ах, это ты...(грозно) А я уж думал, что мне придется сегодня опять пролить кровь.
	AI_RemoveWeapon(self);
	AI_Output(other,self,"DIA_NONE_1190_Assasin_NARUG_01_01");	//Ты убил его?!
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NARUG_01_02");	//Как видишь. Извини, но у меня не было выбора.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NARUG_01_03");	//Уж не знаю, как он смог найти меня, но уйти я ему позволить не мог.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NARUG_01_04");	//А что, тебя это так беспокоит?
	AI_Output(other,self,"DIA_NONE_1190_Assasin_NARUG_01_05");	//У меня было поручение. Я должен был передать ему золото за новую партию рабов.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NARUG_01_06");	//Хммм, м-да... (задумчиво) Не очень удачное стечение обстоятельств.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NARUG_01_07");	//Но теперь уже ничего не поделаешь. Что сделано, то сделано.
	B_LogEntry(TOPIC_AssasinGold,"Кажется, Наруг нашел убежище Гонсалеса, и тому ничего не оставалось, кроме как убить его. Теперь у нас большая проблема, так как пропажа одного из бойцов Масиафа не останется незаметной.");
	NarugIsDead = TRUE;
};


instance DIA_NONE_1190_Assasin_NarugProblem(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_NarugProblem_Condition;
	information = DIA_NONE_1190_Assasin_NarugProblem_Info;
	permanent = FALSE;
	description = "Что будем делать?";
};

func int DIA_NONE_1190_Assasin_NarugProblem_Condition()
{
	if((MIS_AssasinGold == LOG_Running) && (NarugIsDead == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_NarugProblem_Info()
{
	AI_Output(other,self,"DIA_NONE_1190_Assasin_NarugProblem_01_00");	//Что будем делать?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_01_01");	//(задумчиво) Хороший вопрос. Если бы только ответить на него было бы так же просто.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_01_02");	//На мой взгляд, единственное, что мы сейчас можем...
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_01_03");	//...это сделать так, чтобы Тени приняли гибель их бойца, скажем, за несчастный случай.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_NarugProblem_01_04");	//Ну да - бедняга сам случайно напоролся на свой меч!
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_01_05");	//В том то и дело. (с досадой) Любой опытный боец сразу поймет, как он был убит, и, главное - чем!
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_01_06");	//Поэтому этот вариант отпадает сразу. 
	AI_Output(other,self,"DIA_NONE_1190_Assasin_NarugProblem_01_07");	//Как ты думаешь, как быстро Тени хватятся его?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_01_08");	//Все зависит от того, насколько он был важной фигурой для них.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_01_09");	//Пропажу простого послушника могут и вовсе не заметить. Но другое дело, когда это элитный боец Масиафа.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_01_10");	//Кстати, ты говорил, что должен был кое-что ему передать?
	AI_Output(other,self,"DIA_NONE_1190_Assasin_NarugProblem_01_11");	//Да, кошелек с золотом.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_01_12");	//Хммм. Дай мне взглянуть на него.

	if(Npc_HasItems(other,ItMi_AssGoldPocket) >= 1)
	{
		B_GivePlayerXP(500);
		AI_Output(other,self,"DIA_NONE_1190_Assasin_NarugProblem_01_13");	//Вот, держи.
		B_GiveInvItems(other,self,ItMi_AssGoldPocket,1);
		AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_01_14");	//Так, так. Судя по всему, ты получил этот кошель из рук не совсем простого человека.
		AI_Output(other,self,"DIA_NONE_1190_Assasin_NarugProblem_01_15");	//С чего ты взял?
		AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_01_16");	//Видишь - на этом кошельке вышит знак скрещенных мечей. 
		AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_01_17");	//А это означает только то, что мы имеем дело с довольно влиятельным человеком в Братстве.
		AI_Output(other,self,"DIA_NONE_1190_Assasin_NarugProblem_01_18");	//Ну да, ты прав. Мне его дал один из приоров Масиафа.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_01_19");	//Даже так? Хммм... А больше он тебе ничего не давал?
		AI_Output(other,self,"DIA_NONE_1190_Assasin_NarugProblem_01_20");	//Нет. Он дал только два кошелька с золотом, которые я был должен раздать Теням.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_01_21");	//Так их было два?
		AI_Output(other,self,"DIA_NONE_1190_Assasin_NarugProblem_01_22");	//Да. Другой кошелек предназначался Тени по имени Хасим.

		if(HasimGetHisGold == TRUE)
		{
			AI_Output(other,self,"DIA_NONE_1190_Assasin_NarugProblem_01_23");	//И он его уже получил.
		};

		AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_01_24");	//Хммм... А знаешь, кажется, у меня появилась одна идея, как нам решить нашу проблему.
		AI_Output(other,self,"DIA_NONE_1190_Assasin_NarugProblem_01_25");	//Правда?
		AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_01_26");	//Да. Но это слишком рискованно. Очень многое будет зависеть от того, насколько тебе доверяют в Братстве.
		AI_Output(other,self,"DIA_NONE_1190_Assasin_NarugProblem_01_27");	//Выкладывай, что ты там задумал.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_01_28");	//Слушай внимательно. Ты возьмешь этот кошелек и вернешься в Хасиму.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_01_29");	//Скажи, что не нашел его друга, и попроси его передать ему кошелек в случае того, если тот вдруг встретит его.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_01_30");	//Обычно Теням запрещается брать вещи, не принадлежащие им.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_01_31");	//Поэтому тебе придется поломать голову над тем, как можно заставить его забрать себе эту вещь.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_01_32");	//Это очень важно. Поскольку если все получится, то, считай, что первая половина нашего плана удалась.
		AI_Output(other,self,"DIA_NONE_1190_Assasin_NarugProblem_01_33");	//Хорошо, я все понял. Что дальше?
		AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_01_34");	//Дальше отправляйся к приору, который тебе дал эти кошельки, и скажи, что выполнил его просьбу.
		AI_Output(other,self,"DIA_NONE_1190_Assasin_NarugProblem_01_35");	//То есть я должен буду соврать, сказав, что отдал золото обоим?
		AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_01_36");	//Именно так. Ну, а дальше придется выждать кое-какое время.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_01_37");	//Рано или поздно Тени хватятся своего бойца. Вот тогда мы и посмотрим, насколько он был важен для них.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_01_38");	//Да, и еще кое-что...
		AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_01_39");	//Когда будешь говорить с Хасимом, было бы неплохо постараться выкрасть у него какую-нибудь вещь.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_01_40");	//А мы ее подкинем нашему мертвому другу.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_01_41");	//Тогда Хасим ни за что не отвертится от того факта, что это он убил бойца Масиафа. А золото забрал себе. 
		AI_Output(other,self,"DIA_NONE_1190_Assasin_NarugProblem_01_42");	//Так вот, что ты задумал! Это выглядит как-то не очень красиво.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_01_43");	//(серьезно) Ты, кажется, забыл, с кем имеешь дело, приятель. А на войне, как говорят, все средства хороши.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_01_44");	//Так что возьми обратно этот кошелек, и сделай все в точности, как я сказал.
		B_GiveInvItems(self,other,ItMi_AssGoldPocket,1);
		AI_Output(other,self,"DIA_NONE_1190_Assasin_NarugProblem_01_45");	//Ладно, как скажешь.
		B_LogEntry(TOPIC_AssasinGold,"Гонсалес придумал, как нам можно будет выкрутиться из сложившейся ситуации. Я должен заставить Хасима забрать и второй кошелек с золотом, предназначавшийся Наругу. Хотя по законам Братства запрещено брать себе вещи, принадлежавшие другим. Также мне надо постараться выкрасть у Хасима какую-нибудь личную вещь. Ее мы подкинем на труп Наруга, что окончательно обличит Хасима в его убийстве, если Тени начнут искать своего бойца.");
		MakeHasimKiller = TRUE;
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(Ass_171_Adept,"TOT");
	}
	else
	{
		AI_Output(other,self,"DIA_NONE_1190_Assasin_NarugProblem_01_46");	//У меня сейчас нет его с собой.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_01_47");	//Тогда пойди и принеси мне его. 
		AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_01_48");	//Возможно, что это как-то поможет нам. Хотя пока еще и не знаю, как...
		AI_Output(other,self,"DIA_NONE_1190_Assasin_NarugProblem_01_49");	//Как скажешь.
		B_LogEntry(TOPIC_AssasinGold,"Гонсалес захотел взглянуть на кошелек, который Осаир передал для Наруга. К сожалению, его у меня с собой не оказалось.");
		PreMakeHasimKiller = TRUE;
		AI_StopProcessInfos(self);
	};
};

instance DIA_NONE_1190_Assasin_NarugProblem_Temp(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_NarugProblem_Temp_Condition;
	information = DIA_NONE_1190_Assasin_NarugProblem_Temp_Info;
	permanent = FALSE;
	description = "Вот, держи тот кошелек.";
};

func int DIA_NONE_1190_Assasin_NarugProblem_Temp_Condition()
{
	if((MIS_AssasinGold == LOG_Running) && (PreMakeHasimKiller == TRUE) && (Npc_HasItems(other,ItMi_AssGoldPocket) >= 1) && (MakeHasimKiller == FALSE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_NarugProblem_Temp_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_NONE_1190_Assasin_NarugProblem_Temp_01_13");	//Вот, держи тот кошелек.
	B_GiveInvItems(other,self,ItMi_AssGoldPocket,1);
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_Temp_01_14");	//Так-так. Судя по всему, ты получил этот кошель из рук не совсем простого человека.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_NarugProblem_Temp_01_15");	//С чего ты взял?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_Temp_01_16");	//Видишь - на этом кошельке вышит знак скрещенных мечей. 
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_Temp_01_17");	//А это означает только то, что мы имеем дело с довольно влиятельным человеком в Братстве.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_NarugProblem_Temp_01_18");	//Ну да, ты прав. Мне его дал один из приоров Масиафа.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_Temp_01_19");	//Даже так? Хммм... А больше он тебе ничего не давал?
	AI_Output(other,self,"DIA_NONE_1190_Assasin_NarugProblem_Temp_01_20");	//Нет. Он дал только два кошелька с золотом, которые я был должен раздать Теням.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_Temp_01_21");	//Так их было два?
	AI_Output(other,self,"DIA_NONE_1190_Assasin_NarugProblem_Temp_01_22");	//Да. Другой кошелек предназначался Тени по имени Хасим.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_NarugProblem_Temp_01_23");	//И он его уже получил.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_Temp_01_24");	//Хммм... А знаешь, кажется, у меня появилась одна идея, как нам решить нашу проблему.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_NarugProblem_Temp_01_25");	//Правда?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_Temp_01_26");	//Да. Но это слишком рискованно. Очень многое будет зависеть от того, насколько тебе доверяют в Братстве.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_NarugProblem_Temp_01_27");	//Выкладывай, что ты там задумал.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_Temp_01_28");	//Слушай внимательно. (серьезно) Ты возьмешь этот кошелек и вернешься в Хасиму.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_Temp_01_29");	//Скажи, что не нашел его друга, и попроси его передать ему кошелек в случае того, если тот вдруг встретит его.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_Temp_01_30");	//Обычно Теням запрещается брать вещи, не принадлежащие им.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_Temp_01_31");	//Поэтому тебе придется поломать голову над тем, как можно заставить его забрать себе эту вещь.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_Temp_01_32");	//Это очень важно. Поскольку если все получится, то, считай, что первая половина нашего плана удалась.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_NarugProblem_Temp_01_33");	//Хорошо, я все понял. Что дальше?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_Temp_01_34");	//Дальше отправляйся к приору, который тебе дал эти кошельки, и скажи, что выполнил его просьбу.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_NarugProblem_Temp_01_35");	//То есть я должен буду соврать, сказав, что отдал золото обоим?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_Temp_01_36");	//Именно так. Ну а дальше придется выждать кое-какое время.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_Temp_01_37");	//Рано или поздно Тени хватятся своего бойца. Вот тогда мы и посмотрим, насколько он был важен для них.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_Temp_01_38");	//Да, и еще кое-что...
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_Temp_01_39");	//Когда будешь говорить с Хасимом, было бы неплохо постараться выкрасть у него какую-нибудь вещь.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_Temp_01_40");	//А мы ее подкинем нашему мертвому другу.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_Temp_01_41");	//Тогда Хасим ни за что не отвертится от того факта, что это он убил бойца Масиафа. А золото забрал себе! 
	AI_Output(other,self,"DIA_NONE_1190_Assasin_NarugProblem_Temp_01_42");	//Так вот, что ты задумал! Это выглядит как-то не очень красиво!
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_Temp_01_43");	//(серьезно) Ты, кажется, забыл с кем имеешь дело, приятель. А на войне, как говорят, все средства хороши.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_Temp_01_44");	//Так что возьми обратно этот кошелек, и сделай все в точности, как я сказал.
	B_GiveInvItems(self,other,ItMi_AssGoldPocket,1);
	AI_Output(other,self,"DIA_NONE_1190_Assasin_NarugProblem_Temp_01_45");	//Ладно, как скажешь.
	B_LogEntry(TOPIC_AssasinGold,"Гонсалес придумал, как нам можно будет выкрутиться из сложившейся ситуации. Я должен заставить Хасима забрать и второй кошелек с золотом, предназначавшийся Наругу. Хотя по законам Братства запрещено брать себе вещи, принадлежавшие другим. Также мне надо постараться выкрасть у Хасима какую-нибудь личную вещь. Ее мы подкинем на труп Наруга, что окончательно обличит Хасима в его убийстве, если Тени начнут искать своего бойца.");
	MakeHasimKiller = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(Ass_171_Adept,"TOT");
};

instance DIA_NONE_1190_Assasin_NarugProblem_Chetki(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_NarugProblem_Chetki_Condition;
	information = DIA_NONE_1190_Assasin_NarugProblem_Chetki_Info;
	permanent = FALSE;
	description = "У меня тут есть четки Хасима.";
};

func int DIA_NONE_1190_Assasin_NarugProblem_Chetki_Condition()
{
	if((Npc_HasItems(other,ItMi_HasimAmuls) >= 1) && (MakeHasimKiller == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_NarugProblem_Chetki_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_NONE_1190_Assasin_NarugProblem_Chetki_01_01");	//У меня тут есть четки Хасима.
	B_GiveInvItems(other,self,ItMi_HasimAmuls,1);
	Npc_RemoveInvItems(self,ItMi_HasimAmuls,1);
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_Chetki_01_02");	//Отлично. Они нам пригодятся, чтобы снять с нас подозрения.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_NarugProblem_Chetki_01_03");	//Ты уже избавился от трупа?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_Chetki_01_04");	//Я просто перенес его подальше отсюда.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_NarugProblem_Chetki_01_05");	//Ясно.
	HasimAmuls = TRUE;

	if(MIS_AssasinGold == LOG_Running)
	{
		B_LogEntry(TOPIC_AssasinGold,"Я отдал четки Хасима Гонсалесу. Теперь стоит подождать около двух дней, пока Тени хватятся своего бойца. А пока лучше заняться другими делами.");
	};
};

instance DIA_NONE_1190_Assasin_HaniarFirstQuest(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_HaniarFirstQuest_Condition;
	information = DIA_NONE_1190_Assasin_HaniarFirstQuest_Info;
	permanent = FALSE;
	description = "У нас есть небольшая проблема.";
};

func int DIA_NONE_1190_Assasin_HaniarFirstQuest_Condition()
{
	if((HaniarSeekKiller == TRUE) && (HaniarKnowKiller == FALSE))
	{
		return TRUE;
	};

};

func void DIA_NONE_1190_Assasin_HaniarFirstQuest_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_NONE_1190_Assasin_HaniarFirstQuest_01_01");	//У нас есть небольшая проблема.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HaniarFirstQuest_01_02");	//Это меня не удивляет. (саркастически) И что на этот раз?
	AI_Output(other,self,"DIA_NONE_1190_Assasin_HaniarFirstQuest_01_03");	//Один из приоров Масиафа дал мне поручение найти убийцу Хасима. То есть меня самого!
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HaniarFirstQuest_01_04");	//Забавно, ничего не скажешь! И кто же именно из приоров заинтересовался его гибелью?
	AI_Output(other,self,"DIA_NONE_1190_Assasin_HaniarFirstQuest_01_05");	//Его зовут Ханиар. 
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HaniarFirstQuest_01_06");	//(удивленно) Ханиар? Сам Ханиар Слепец дал тебе это поручение?
	AI_Output(other,self,"DIA_NONE_1190_Assasin_HaniarFirstQuest_01_07");	//А что, ты его знаешь?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HaniarFirstQuest_01_08");	//Эх, парень. Я бы и рад сказать, что нет - да только это не так. 
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HaniarFirstQuest_01_09");	//Да, я его знаю! И готов поспорить, что знаю даже лучше, чем некоторые из нынешних братьев Масиаф.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HaniarFirstQuest_01_10");	//Ханиар Слепец - самый жестокий и кровавый ублюдок из тех, с кем мне доводилось иметь дело.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HaniarFirstQuest_01_11");	//Он же самый могущественный из приоров Братства. А самое главное - этот человек абсолютно непредсказуем в своих действиях.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HaniarFirstQuest_01_12");	//Так что смотри - остерегайся его!
	AI_Output(other,self,"DIA_NONE_1190_Assasin_HaniarFirstQuest_01_13");	//Спасибо, что предупредил.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HaniarFirstQuest_01_14");	//Да не за что! Однако если ты смог добраться до самого Слепца, значит в Братстве ты уже кое-чего стоишь.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HaniarFirstQuest_01_15");	//А это хорошая новость. Что же касается Хасима... Дай мне подумать.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_HaniarFirstQuest_01_16");	//У нас нет времени на раздумья.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HaniarFirstQuest_01_17");	//Ну, тогда у тебя только два варианта.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HaniarFirstQuest_01_18");	//Либо ты рассказываешь Ханиару правду, либо попытайся поговорить с приором Тиамантом.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HaniarFirstQuest_01_19");	//В конце концов, это же ведь по его приказу ты отправил бедолагу на тот свет.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HaniarFirstQuest_01_20");	//Вот пусть теперь сам и выкручивается!
	AI_Output(other,self,"DIA_NONE_1190_Assasin_HaniarFirstQuest_01_21");	//Ясно. Больше никаких мыслей на этот счет?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HaniarFirstQuest_01_22");	//Нет. Конечно, это все довольно рискованно, но тебе придется сделать выбор.
	GonsalesAdvice = TRUE;
	B_LogEntry(TOPIC_HasimKill,"Гонсалес был весьма озадачен сложившейся ситуацией. Единственное, что он смог предложить - это либо поговорить с Тиамантом, либо же попытаться рассказать всю правду Ханиару и надеяться на его снисхождение. В любом случае выбирать мне.");
};


instance DIA_NONE_1190_Assasin_HaniarFirstQuestFinal(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_HaniarFirstQuestFinal_Condition;
	information = DIA_NONE_1190_Assasin_HaniarFirstQuestFinal_Info;
	permanent = FALSE;
	description = "Насчет проблемы с Хасимом...";
};

func int DIA_NONE_1190_Assasin_HaniarFirstQuestFinal_Condition()
{
	if(HaniarKnowKiller == TRUE)
	{
		return TRUE;
	};

};

func void DIA_NONE_1190_Assasin_HaniarFirstQuestFinal_Info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_NONE_1190_Assasin_HaniarFirstQuestFinal_01_01");	//Насчет проблемы с Хасимом...
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HaniarFirstQuestFinal_01_02");	//Сдается мне, раз ты все еще жив, то тебе-таки удалось выкрутиться из этой непростой ситуации.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_HaniarFirstQuestFinal_01_03");	//Ты как всегда прав. Хотя мне и пришлось для этого изрядно попотеть.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_HaniarFirstQuestFinal_01_04");	//Этот Ханиар тот еще хитрец.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HaniarFirstQuestFinal_01_05");	//Это тебе еще повезло... Обычно он не слишком любит церемониться с такими мелочами.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HaniarFirstQuestFinal_01_06");	//Что-то мне подсказывает, что он не просто так сохранил тебе жизнь.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HaniarFirstQuestFinal_01_07");	//Но вот зачем он это сделал - это большой вопрос!
	AI_Output(other,self,"DIA_NONE_1190_Assasin_HaniarFirstQuestFinal_01_08");	//Давно хотел спросить - откуда тебе столько известно про Братство?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HaniarFirstQuestFinal_01_09");	//Придет время - и все сам узнаешь. А пока не надо доставать меня этими расспросами. Договорились?
	AI_Output(other,self,"DIA_NONE_1190_Assasin_HaniarFirstQuestFinal_01_10");	//Как скажешь.
	GonsalesFinishHasimStory = TRUE;
};

instance DIA_NONE_1190_Assasin_IDo(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_IDo_Condition;
	information = DIA_NONE_1190_Assasin_IDo_Info;
	permanent = FALSE;
	description = "Я теперь Тень Братства Масиаф!";
};

func int DIA_NONE_1190_Assasin_IDo_Condition()
{
	if(PlayerIsAssNow == TRUE)
	{
		return TRUE;
	};

};

func void DIA_NONE_1190_Assasin_IDo_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_NONE_1190_Assasin_IDo_01_01");	//Я теперь Тень Братства Масиаф!
	AI_Output(self,other,"DIA_NONE_1190_Assasin_IDo_01_02");	//Хммм...(улыбаясь) Это я и так вижу. Что же, прими мои поздравления.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_IDo_01_03");	//Хотя поначалу я не особо верил в то, что у тебя получится это сделать.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_IDo_01_04");	//Теперь же нам стоит подумать над тем, как воспользоваться твоим преимуществом.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_IDo_01_05");	//Какие будут предложения?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_IDo_01_06");	//На мой взгляд, для начала крайне необходимо позаботиться о приорах.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_IDo_01_07");	//Это столпы Братства Масиаф. Без них остальные - лишь кучка бандитов, хотя и довольно опасных.

	if(TiamantIsDead == TRUE)
	{
		AI_Output(other,self,"DIA_NONE_1190_Assasin_IDo_01_08");	//Один из приоров уже мертв.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_IDo_01_09");	//(удивленно) Кто именно?
		AI_Output(other,self,"DIA_NONE_1190_Assasin_IDo_01_10");	//Тиамант.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_IDo_01_11");	//А, Тиамант! Мастер меча Масиаф... Интересно, как же это случилось?
		AI_Output(other,self,"DIA_NONE_1190_Assasin_IDo_01_12");	//Его убил Ханиар за то, что тот решил прикарманить себе целый золотой рудник.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_IDo_01_13");	//Что же, с Ханиаром шутки плохи. Тебе это тоже стоит запомнить.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_IDo_01_14");	//Хотя, если говорить начистоту, Тиамант был единственным человеком, которого я когда-то уважал в Братстве.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_IDo_01_15");	//Это был настоящий воин до мозга костей! Но, как и многих, его сгубила жадность.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_IDo_01_16");	//Кстати, его меч, - он случайно не у тебя?

		if(Npc_HasItems(other,ITMW_2H_MASIAF_TIAMANT) >= 1)
		{
			B_GivePlayerXP(1000);
			AI_Output(other,self,"DIA_NONE_1190_Assasin_IDo_01_17");	//Да, вот он.
			B_GiveInvItems(other,self,ITMW_2H_MASIAF_TIAMANT,1);
			AI_Output(self,other,"DIA_NONE_1190_Assasin_IDo_01_18");	//Отлично! Не возражаешь, если я оставлю его пока у себя?
			AI_Output(other,self,"DIA_NONE_1190_Assasin_IDo_01_19");	//Конечно, бери его.
			AI_Output(self,other,"DIA_NONE_1190_Assasin_IDo_01_20");	//Благодарю! Да, и если что, мечи других приоров тоже приноси мне.
			AI_Output(self,other,"DIA_NONE_1190_Assasin_IDo_01_21");	//Будет лучше, если их проклятое оружие останется здесь.
			AI_Output(other,self,"DIA_NONE_1190_Assasin_IDo_01_22");	//Ладно, как скажешь.
			GonsaTakeSword_Tiamant = TRUE;
		}
		else
		{
			B_GivePlayerXP(250);
			AI_Output(other,self,"DIA_NONE_1190_Assasin_IDo_01_23");	//К сожалению, нет.
			AI_Output(self,other,"DIA_NONE_1190_Assasin_IDo_01_24");	//На твоем месте я бы отыскал этот меч и принес его мне.
			AI_Output(self,other,"DIA_NONE_1190_Assasin_IDo_01_25");	//Будет лучше, если это проклятое оружие останется здесь.
			AI_Output(other,self,"DIA_NONE_1190_Assasin_IDo_01_26");	//Ладно, как скажешь.
		};

		GonsaKnow_Tiamant = TRUE;
	};

	AI_Output(self,other,"DIA_NONE_1190_Assasin_IDo_01_27");	//В остальном же, я думаю, ты разберешься и без меня.
};

instance DIA_NONE_1190_Assasin_Sword_Tiamant(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_Sword_Tiamant_Condition;
	information = DIA_NONE_1190_Assasin_Sword_Tiamant_Info;
	permanent = FALSE;
	description = "Я принес меч Тиаманта.";
};

func int DIA_NONE_1190_Assasin_Sword_Tiamant_Condition()
{
	if((GonsaKnow_Tiamant == TRUE) && (PlayerIsAssNow == TRUE) && (GonsaTakeSword_Tiamant == FALSE) && (Npc_HasItems(other,ITMW_2H_MASIAF_TIAMANT) >= 1))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_Sword_Tiamant_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Sword_Tiamant_01_01");	//Я принес меч Тиаманта.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Sword_Tiamant_01_02");	//Отлично. Давай его сюда.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Sword_Tiamant_01_03");	//Вот, держи.
	B_GiveInvItems(other,self,ITMW_2H_MASIAF_TIAMANT,1);
	Npc_RemoveInvItems(self,ITMW_2H_MASIAF_TIAMANT,1);
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Sword_Tiamant_01_04");	//Благодарю! Пусть пока полежит у меня. А то мало ли что.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Sword_Tiamant_01_05");	//Ну, тебе видней.
	GonsaTakeSword_Tiamant = TRUE;
};

instance DIA_NONE_1190_Assasin_TiamantDead(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_TiamantDead_Condition;
	information = DIA_NONE_1190_Assasin_TiamantDead_Info;
	permanent = FALSE;
	description = "Один из приоров мертв!";
};

func int DIA_NONE_1190_Assasin_TiamantDead_Condition()
{
	if((TiamantIsDead == TRUE) && (PlayerIsAssNow == TRUE) && (GonsaKnow_Tiamant == FALSE) && (Npc_KnowsInfo(hero,DIA_NONE_1190_Assasin_IDo)))
	{
		return TRUE;
	};

};

func void DIA_NONE_1190_Assasin_TiamantDead_Info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_NONE_1190_Assasin_TiamantDead_01_01");	//Один из приоров мертв.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_TiamantDead_01_02");	//(удивленно) Кто именно?
	AI_Output(other,self,"DIA_NONE_1190_Assasin_TiamantDead_01_03");	//Тиамант.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_TiamantDead_01_04");	//А, Тиамант! Мастер меча Масиаф... Интересно, как же это случилось?
	AI_Output(other,self,"DIA_NONE_1190_Assasin_TiamantDead_01_05");	//Его убил Ханиар за то, что тот решил прикарманить себе целый золотой рудник.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_TiamantDead_01_06");	//Что же, с Ханиаром шутки плохи. Тебе это тоже стоит запомнить.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_TiamantDead_01_07");	//Хотя, если говорить начистоту, Тиамант был единственным человеком, которого я когда-то уважал в Братстве.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_TiamantDead_01_08");	//Это был настоящий воин до мозга костей! Но, как и многих, его сгубила жадность.
	GonsaKnow_Tiamant = TRUE;
};


instance DIA_NONE_1190_Assasin_WhoAreYouMister(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_WhoAreYouMister_Condition;
	information = DIA_NONE_1190_Assasin_WhoAreYouMister_Info;
	permanent = FALSE;
	description = "У меня есть к тебе вопрос.";
};

func int DIA_NONE_1190_Assasin_WhoAreYouMister_Condition()
{
	if((GonsaKnow_Tiamant == TRUE) && (PlayerIsAssNow == TRUE))
	{
		return TRUE;
	};

};

func void DIA_NONE_1190_Assasin_WhoAreYouMister_Info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_01");	//У меня есть к тебе вопрос.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_02");	//(серьезно) Ну, задавай, если есть.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_03");	//Думаю, ты и сам уже догадываешься, о чем я.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_04");	//Ведь я прекрасно понимаю, что тебя что-то связывает со всеми этими людьми.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_05");	//Тебе многое о них известно, как будто ты сам один из них!
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_06");	//Хммм. (твердо) Ты недалек от истины.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_07");	//Может, тогда просто мне все расскажешь?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_08");	//Ну хорошо. Думаю, что пришло время тебе услышать мою историю.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_09");	//Но обещай мне, что сперва выслушаешь меня до конца. А потом уже делай, что считаешь нужным.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_10");	//Договорились.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_11");	//Тогда я начну, пожалуй...
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_12");	//(мрачно) В общем, дело в том, что раньше... раньше я был очень плохим человеком.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_13");	//И дело даже не в том, что ради золота и славы я убивал людей, не особо разбираясь, кто они, и в чем виноваты. 
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_14");	//Моя вера и преданность Братству никогда не давала мне усомниться в правоте моих деяний.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_15");	//Я был ослеплен своим желанием доказать самому Белиару, что я - самый достойный его слуга.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_16");	//Благодаря этому слепому фанатизму я смог многого добиться и даже стать одним из приоров Масиафа...
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_17");	//...могущественного Братства ассасинов, чье одно лишь имя наводило страх и ужас на жителей всего Варанта.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_18");	//И, возможно, мы бы сейчас не разговаривали с тобой...
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_19");	//...если бы не один случай, перевернувший всю мою жизнь!
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_20");	//Однажды в Мора Сул, преследуя свою очередную жертву, я повстречал прекрасную деву по имени Азиль.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_21");	//Она была прекрасна, как сама любовь! Я не знаю, что тогда со мной произошло, но...
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_22");	//...вместо того, чтобы продолжать слежку, я, как тупой баран, просто отправился за ней.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_23");	//Я проследовал за Азиль до ее дома. Хотя, конечно, она ни о чем не подозревала.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_24");	//Как оказалось, она была дочерью одного из крупных купцов в Мора Сул - очень богатого и влиятельного человека.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_25");	//Законы Масиафа запрещают всякие отношения с теми, кто не состоит в Братстве.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_26");	//Того же, кто нарушит их, ждет только одно - смерть.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_27");	//Однако, несмотря даже на это, меня с неодолимой силой тянуло к Азиль! Мне хотелось видеть ее вновь и вновь.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_28");	//И однажды я все-таки решился подойти к ней. Вот так мы и познакомились...
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_29");	//Прошло время, и мы с ней стали очень близкими для друг друга людьми.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_30");	//Но вот в один прекрасный день из самого Иштара поступил очередной заказ на убийство.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_31");	//Думаю, ты и сам уже догадался о том, в чем была его суть.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_32");	//Бойцы Масиаф должны были вырезать всю семью того влиятельного купца из Мора Сул, отца Азиль!
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_33");	//Поскольку его дом очень хорошо охранялся, всю работу поручили людям Ханиара Слепца.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_34");	//Правда, тогда он был еще зрячим. Но не в этом дело.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_35");	//Я помню, как я чуть ли не на коленях умолял Ханиара пощадить мою возлюбленную.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_36");	//Но он лишь посмеялся надо мной и сказал, что я недостоин быть приором Братства и слугой Белиара.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_37");	//Тогда я, не думая, отправился в Мора Сул, в надежде, что успею предотвратить нападение.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_38");	//Однако я опоздал... Когда я пришел в дом Азиль, она была уже мертва. Как и все те, кому не посчастливилось находиться там.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_39");	//Это была моя расплата за мои грехи, за мои убийства... За мою гордыню.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_40");	//Обезумев от горя, я вернулся в чертог Братства с твердым намерением навсегда уничтожить эту обитель зла.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_41");	//Мой клинок с невероятной силой и жестокостью разил всех, кто только смел встать у меня на пути.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_42");	//И тут появился тот, кто отдал этот злосчастный приказ.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_43");	//(гневно) Ханиар! Мое проклятье и мой позор!
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_44");	//Как ты понимаешь, тогда я не смог его одолеть в бою, и мне оставалось только спасаться бегством.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_45");	//Однако, перед тем как скрыться, я оставил ему напоследок небольшое напоминание о себе.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_46");	//Я бросил в него пузырек с кислотой, и, по всей видимости, несколько капель все-таки попали ему в глаза.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_47");	//Видимо, поэтому он ослеп. Однако мне иногда кажется, что это его сделало только сильней.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_48");	//После я поклялся, что посвящу всю свою оставшуюся жизнь уничтожению Братства Масиаф!
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_49");	//Я понимаю, что это не загладит полностью мою вину.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhoAreYouMister_01_50");	//Но я доведу это дело до конца, чего бы мне это не стоило.
	B_LogEntry(TOPIC_MasiafStory,"Как оказалось, Гонсалес был когда-то одним из приоров Масиаф. Он рассказал мне свою историю и поведал причины, которые привели его сюда. Что ж, довольно необычный поворот событий. И я пока не знаю, что мне со всем этим делать.");
	GonsaTellHistory = TRUE;
};


instance DIA_NONE_1190_Assasin_PrayInnos(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_PrayInnos_Condition;
	information = DIA_NONE_1190_Assasin_PrayInnos_Info;
	permanent = FALSE;
	description = "Ты молишься Инносу?";
};

func int DIA_NONE_1190_Assasin_PrayInnos_Condition()
{
	if(GonsaTellHistory == TRUE)
	{
		return TRUE;
	};

};

func void DIA_NONE_1190_Assasin_PrayInnos_Info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_NONE_1190_Assasin_PrayInnos_01_01");	//Ты молишься Инносу?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_PrayInnos_01_02");	//Боюсь, что после всего Иннос меня не услышит. (обреченно) Слишком много зла я принес в этот мир!
	AI_Output(other,self,"DIA_NONE_1190_Assasin_PrayInnos_01_03");	//Но ты бы мог попробовать.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_PrayInnos_01_04");	//Хммм... (задумчиво) Возможно, что когда-нибудь я и смогу склонить колени перед статуей Инноса в мольбе о прощении.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_PrayInnos_01_05");	//Но для начала я должен уничтожить то зло, которое сам и посеял.
};


instance DIA_NONE_1190_Assasin_Kills(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_Kills_Condition;
	information = DIA_NONE_1190_Assasin_Kills_Info;
	permanent = FALSE;
	description = "Тебе часто приходилось убивать?";
};

func int DIA_NONE_1190_Assasin_Kills_Condition()
{
	if(GonsaTellHistory == TRUE)
	{
		return TRUE;
	};

};

func void DIA_NONE_1190_Assasin_Kills_Info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Kills_01_01");	//Тебе часто приходилось убивать?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Kills_01_02");	//Ты и представить не сможешь, насколько часто. От моей руки погибло очень много людей!
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Kills_01_03");	//Однако даже сейчас, спустя столько лет, я помню лицо почти каждой моей жертвы.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Kills_01_04");	//Это мое проклятье! Которое, по всей видимости, навсегда останется вместе со мной.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Kills_01_05");	//И, возможно, что даже смерть не даст мне облегчения от всего совершенного мною.
};

instance DIA_NONE_1190_Assasin_Death(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_Death_Condition;
	information = DIA_NONE_1190_Assasin_Death_Info;
	permanent = FALSE;
	description = "Ты боишься смерти?";
};

func int DIA_NONE_1190_Assasin_Death_Condition()
{
	if(GonsaTellHistory == TRUE)
	{
		return TRUE;
	};

};

func void DIA_NONE_1190_Assasin_Death_Info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Death_01_01");	//Ты боишься смерти?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Death_01_02");	//Нет. И даже больше того, я сам уже столько лет ищу ее!
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Death_01_03");	//Но, по всей видимости, даже она отвернулась от меня.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Death_01_04");	//Что же тебе мешает, например, броситься вниз со скалы?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Death_01_05");	//Я воин! (грозно) А значит, только лишь смерть на поле боя способна смыть мой позор.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Death_01_06");	//А просто покончить с собой - это удел трусов.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Death_01_07");	//Может, я смогу тебе в этом помочь?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Death_01_08");	//Ты хочешь сразиться со мной? (серьезно) Что же, я готов!
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Death_01_09");	//Как знать, может быть, ты и есть тот человек, которого я так ждал все это время.
	Info_ClearChoices(DIA_NONE_1190_Assasin_Death);
	Info_AddChoice(DIA_NONE_1190_Assasin_Death,"Нет! Сейчас это будет крайне глупо.",DIA_NONE_1190_Assasin_Death_No);

	if(MIS_PW_PoisonNrozas == FALSE)
	{
		Info_AddChoice(DIA_NONE_1190_Assasin_Death,"Давай сразимся!",DIA_NONE_1190_Assasin_Death_Yes);
	};
};

func void DIA_NONE_1190_Assasin_Death_Yes()
{
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Death_Yes_01_01");	//Давай сразимся!
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Death_Yes_01_02");	//Тогда не будем терять времени.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Death_Yes_01_03");	//Надеюсь, что ты мне дашь то, чего я так желаю всей душой!
	GonsaChalange = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_NONE_1190_Assasin_Death_No()
{
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Death_No_01_01");	//Нет. Сейчас это будет крайне глупо...
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Death_No_01_02");	//Сначала мы должны разобраться с Братством. 
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Death_No_01_03");	//Все остальное сейчас не столь важно.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Death_No_01_04");	//Эх...(разочарованно) Да, ты, скорее всего, прав. Сейчас главное уничтожить Масиаф.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Death_No_01_05");	//А мои личные проблемы могут только помешать нам в этом.
	Info_ClearChoices(DIA_NONE_1190_Assasin_Death);
};

instance DIA_NONE_1190_Assasin_DeathWin(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_DeathWin_Condition;
	information = DIA_NONE_1190_Assasin_DeathWin_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_NONE_1190_Assasin_DeathWin_Condition()
{
	if((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON) && (GonsaChalange == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_DeathWin_Info()
{
	AI_Output(self,other,"DIA_NONE_1190_Assasin_DeathWin_01_01");	//Ты хорошо сражался...(разочарованно) Но, видимо, даже ты не в силах дать мне достойную смерть.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_DeathWin_01_02");	//Я проклят навсегда!
	AI_StopProcessInfos(self);
};

instance DIA_NONE_1190_Assasin_DeathLost(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_DeathLost_Condition;
	information = DIA_NONE_1190_Assasin_DeathLost_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_NONE_1190_Assasin_DeathLost_Condition()
{
	if((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST) && (GonsaChalange == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_DeathLost_Info()
{
	B_GivePlayerXP(500);
	AI_Output(self,other,"DIA_NONE_1190_Assasin_DeathLost_01_01");	//Ты очень хороший боец. Уверен, что тебе будет под силу уничтожить Масиаф.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_DeathLost_01_02");	//Там будет видно!
	AI_StopProcessInfos(self);
};

instance DIA_NONE_1190_Assasin_AboutExit(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_AboutExit_Condition;
	information = DIA_NONE_1190_Assasin_AboutExit_Info;
	permanent = FALSE;
	description = "Меня кое-что беспокоит...";
};

func int DIA_NONE_1190_Assasin_AboutExit_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_NONE_1190_Assasin_IDo))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_AboutExit_Info()
{
	AI_Output(other,self,"DIA_NONE_1190_Assasin_AboutExit_01_00");	//Меня кое-что беспокоит...
	AI_Output(self,other,"DIA_NONE_1190_Assasin_AboutExit_01_01");	//Что именно?
	AI_Output(other,self,"DIA_NONE_1190_Assasin_AboutExit_01_02");	//Как мы выберемся отсюда, когда все закончится?
	AI_Output(other,self,"DIA_NONE_1190_Assasin_AboutExit_01_03");	//У меня нет ни малейшего желания остаться здесь навсегда.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_AboutExit_01_04");	//Этого я пока не знаю. Но уверен, что нужный нам ответ сам явится в руки.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_AboutExit_01_05");	//А сейчас лучше не думать об этом. Лишние мысли только мешают сосредоточиться на главном.
};


instance DIA_NONE_1190_Assasin_Poison(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_Poison_Condition;
	information = DIA_NONE_1190_Assasin_Poison_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_NONE_1190_Assasin_Poison_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (NoTrollPoison == FALSE) && (MIS_PW_PoisonNrozas == LOG_Running) && (Npc_HasItems(other,ItMi_NrozasPoison) >= 1) && (Npc_KnowsInfo(hero,DIA_NONE_1190_Assasin_PreHallo)))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_Poison_Info()
{
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_01_00");	//Эй! (жуя) Хочешь мяса?
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Poison_01_01");	//Давай как-нибудь потом.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_01_02");	//Ну и зря. (довольно) Сочное, хорошо прожаренное мясо только что убитого мной падальщика!
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_01_03");	//Уверен, что ты такого отродясь не пробовал.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Poison_01_04");	//Ну, раз ты у нас такой знаток насчет пожрать, может, ответишь на вопрос?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_01_05");	//Что еще такое?
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Poison_01_06");	//Ты случайно не знаешь, едят ли горные тролли пузырьки с ядом?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_01_07");	//Все шутишь, как я погляжу.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_01_08");	//А насчет твоего вопроса... То это смотря какое главное блюдо ты преподнесешь ему на закуску.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_01_09");	//Например, тебя он вполне сможет сожрать прямо вместе с твоим пузырьком.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_01_10");	//Но, думаю, ты не настолько глуп, чтобы предоставить ему такой шанс.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_01_11");	//Кстати, а к чему все эти вопросы?
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Poison_01_12");	//Приор Нрозас поручил мне испытать действие одного сильного яда.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Poison_01_13");	//И, по его мнению, лучше всего для этого подойдет огромный горный тролль.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_01_14");	//А, ну теперь мне все ясно. Значит, Нрозас все никак не успокоится.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Poison_01_15");	//В смысле?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_01_16");	//Ну, сколько я его знал...
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_01_17");	//...он все время пытался найти идеальный состав для такого яда, который был бы способен мгновенно убить любое живое создание.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_01_18");	//И, по всей видимости, его поиски продолжаются до сих пор.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_01_19");	//Он просто помешан на всех этих своих склянках с различными ядами, эликсирами и прочей алхимической ерундой!
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Poison_01_20");	//Давай оставим Нрозаса в покое. Лучше скажи, что мне-то делать?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_01_21");	//Хммм... (спокойно) Ничего! Считай, что тебе повезло.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Poison_01_22");	//Что ты имеешь в виду?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_01_23");	//Просто недавно я видел как раз одного горного тролля вон в той расщелине, что позади тебя.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_01_24");	//И сейчас эта тварь наверняка лакомится падальщиками, которых я убил сегодня утром.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_01_25");	//Так что на твоем месте я бы не терял времени.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_01_26");	//Попробуй подкрасться к нему незаметно и обработать своим ядом одну из мертвых туш падальщика.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_01_27");	//А потом останется лишь только посмотреть - сдохнет он от твоего яда или нет.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_01_28");	//Только смотри не переборщи с самим зельем! Сильные яды обычно очень пахучи, и это может запросто отпугнуть тварь.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Poison_01_29");	//Ясно, я понял.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_01_30");	//И все-таки зря ты отказался от мяса.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_01_31");	//Ладно, иди уже! Потом расскажешь, как все прошло.
	TrollPWIsPlace = TRUE;
	B_LogEntry(TOPIC_PW_PoisonNrozas,"Гонсалес посоветовал мне использовать тушу убитого падальщика, чтобы сделать ядовитую приманку для тролля.");
	AI_StopProcessInfos(self);
	Wld_InsertNpc(TROLL_YOUNG_PW,"PW_YOUNGTROLL");	
	Wld_InsertNpc(Scavenger_PW_01,"FP_STAND_MOLERATDEAD_01");
	Wld_InsertNpc(Scavenger_PW_02,"FP_STAND_MOLERATDEAD_02");
	Wld_InsertNpc(Scavenger_PW_03,"FP_STAND_MOLERATDEAD_03");
	B_KillNpc(Scavenger_PW_01);
	B_KillNpc(Scavenger_PW_02);
	B_KillNpc(Scavenger_PW_03);
	Wld_SendTrigger("EVT_TROLL_POISON");
};

instance DIA_NONE_1190_Assasin_Poison_Done(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_Poison_Done_Condition;
	information = DIA_NONE_1190_Assasin_Poison_Done_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_NONE_1190_Assasin_Poison_Done_Condition()
{
	if((MIS_PW_PoisonNrozas == LOG_Running) && (PoisonResult == TRUE) && (TellNrozasAboutTest == FALSE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_Poison_Done_Info()
{
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_00");	//Ну как все прошло?

	if(PoisonDoneFull == TRUE)
	{
		AI_Output(other,self,"DIA_NONE_1190_Assasin_Poison_Done_01_01");	//Тролль отказался глотать наживку. Наверное, я немного перестарался с количеством яда.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_02");	//Эх... Я же тебя предупреждал, что сильные яды крайне пахучи!
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_03");	//Поэтому, естественно, что унюхав неприятный запах, эта тварь начала воротить нос.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_04");	//И сколько же ты вылил этого яда в наживку?
		AI_Output(other,self,"DIA_NONE_1190_Assasin_Poison_Done_01_05");	//Все, что было.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_06");	//Ясно. (отрешенно) Ты еще и без яда остался, к тому же. Молодец, прими мои поздравления.
		AI_Output(other,self,"DIA_NONE_1190_Assasin_Poison_Done_01_07");	//И что же теперь будет?
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_08");	//Ну... Зная Нрозаса, ничего хорошего для тебя.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_09");	//Ты умудрился профукать работу всей его жизни, поэтому за это он сотрет тебя в порошок.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_10");	//Так что на твоем месте я бы больше не ходил к нему. Но это решать тебе, конечно.
	}
	else if(PoisonDoneHalf == TRUE)
	{
		AI_Output(other,self,"DIA_NONE_1190_Assasin_Poison_Done_01_11");	//Все прошло как по маслу. Тролль заглотил наживку и мгновенно умер.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_12");	//А ты что-нибудь прихватил с собой в качестве доказательств?

		if(Npc_HasItems(other,ItAt_TrollPoisonTongue) >= 1)
		{
			AI_Output(other,self,"DIA_NONE_1190_Assasin_Poison_Done_01_13");	//Конечно! У меня его язык, разбухший от яда.
			AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_14");	//Ну, тогда все в порядке. Отправляйся к Нрозасу и порадуй старика!
		}
		else
		{
			AI_Output(other,self,"DIA_NONE_1190_Assasin_Poison_Done_01_15");	//Об этом я как-то не подумал.
			AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_16");	//Тогда, на твоем месте, я бы вернулся обратно и взял что-нибудь на память.
			AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_17");	//Насколько я знаю Нрозаса, тот привык верить лишь только своим глазам!
		};
	}
	else if(PoisonDoneOneTear == TRUE)
	{
		AI_Output(other,self,"DIA_NONE_1190_Assasin_Poison_Done_01_18");	//Эта тварь заглотила наживку, но почему-то отказалась умирать!
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_19");	//Видимо, ты добавил слишком мало яда. Я только так могу это объяснить.
		AI_Output(other,self,"DIA_NONE_1190_Assasin_Poison_Done_01_20");	//Может, яд Нрозаса просто не действует?
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_21");	//Только не вздумай сказать такое ему самому! Если, конечно, тебе еще дорога твоя жизнь.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_22");	//Насколько я помню, Нрозас был настоящим мастером своего дела.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_23");	//У него почти никогда не бывало промахов. Конечно, случались неудачи, но это было очень давно.
		AI_Output(other,self,"DIA_NONE_1190_Assasin_Poison_Done_01_24");	//И что же теперь будет?
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_25");	//Ну... Зная Нрозаса, ничего хорошего для тебя.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_26");	//Кстати, надеюсь, этот яд у тебя все еще с собой?
		AI_Output(other,self,"DIA_NONE_1190_Assasin_Poison_Done_01_27");	//Да, вот он.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_28");	//Тогда отнеси его обратно, и надейся на то, что его гнев не оставит тебя без головы.
		AI_Output(other,self,"DIA_NONE_1190_Assasin_Poison_Done_01_29");	//А почему бы нам вновь не попробовать этот трюк с наживкой?
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_30");	//Потому что на это теперь у нас уйдет уйма времени! А сейчас дорога каждая минута.
		AI_Output(other,self,"DIA_NONE_1190_Assasin_Poison_Done_01_31");	//Выходит, что и к Осаиру я вернусь тоже ни с чем.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_32");	//Осаиру?! А он тут при чем?
		AI_Output(other,self,"DIA_NONE_1190_Assasin_Poison_Done_01_33");	//Нрозас обещал дать немного яда для мастера Осаира, если я смогу проверить действие его зелья.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_34");	//Хммм... А это немного меняет дело.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_35");	//Возможно, что твой промах мы сможем использовать в наших целях!
		AI_Output(other,self,"DIA_NONE_1190_Assasin_Poison_Done_01_36");	//И каким же образом?
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_37");	//Мы попробуем их столкнуть лбами между собой.
		AI_Output(other,self,"DIA_NONE_1190_Assasin_Poison_Done_01_38");	//И что мне нужно для этого сделать?
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_39");	//Ну, мне видится лишь два варианта. 
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_40");	//Либо ты отдаешь этот яд Осаиру, либо просто говоришь ему, что яд Нрозаса не действует.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_41");	//Однако в первом случае у Нрозаса будет серьезный повод убить тебя.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_42");	//И наверняка его поддержат все остальные братья Масиафа!
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_43");	//Ну а во втором случае - мы имеем всего лишь слова одного приора против другого.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_44");	//Что для тебя куда лучше и безопаснее.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_45");	//Ведь наверняка эта весть очень быстро разнесется по всему Братству.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_46");	//А сам Осаир не преминет случаем поднять Нрозаса на смех!
		AI_Output(other,self,"DIA_NONE_1190_Assasin_Poison_Done_01_47");	//Кажется, теперь я понимаю, о чем ты.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_48");	//Ну, тогда действуй. Не стоит терять времени.
		PlayerSafeFromNrozas = TRUE;
		B_LogEntry(TOPIC_PW_PoisonNrozas,"Гонсалес, хитрый лис, придумал, как можно использовать мой промах. Надо столкнуть лбами двух приоров - Осаира и Нрозаса. Я могу отдать этот пузырек с ядом Осаиру, но тогда Нрозас будет иметь полное право убить меня. Или же я могу отнести пузырек Нрозасу, а Осаиру сказать, что яд просто не действует.");
		AI_StopProcessInfos(self);
	}
	else if((NoTrollPoison == TRUE) || (TrollSeeMe == TRUE))
	{
		if(NoTrollPoison == TRUE)
		{
			AI_Output(other,self,"DIA_NONE_1190_Assasin_Poison_Done_01_49");	//К сожалению, я прикончил тролля до того, как смог испытать на нем яд.
		}
		else if(TrollSeeMe == TRUE)
		{
			AI_Output(other,self,"DIA_NONE_1190_Assasin_Poison_Done_01_49_01");	//К сожалению, я спугнул тролля до того, как смог испытать на нем яд.
		};

		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_50");	//Ну, тогда ты упустил свой шанс отличиться перед Нрозасом.
		AI_Output(other,self,"DIA_NONE_1190_Assasin_Poison_Done_01_51");	//И что теперь будет?
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_52");	//Ну... Зная Нрозаса, ничего хорошего для тебя.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_53");	//Кстати, надеюсь, этот яд у тебя все еще с собой?
		AI_Output(other,self,"DIA_NONE_1190_Assasin_Poison_Done_01_54");	//Да, вот он.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_55");	//Тогда отнеси его обратно и надейся на то, что его гнев не оставит тебя без головы.
		AI_Output(other,self,"DIA_NONE_1190_Assasin_Poison_Done_01_56");	//А почему нам вновь не попробовать этот трюк с наживкой?
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_57");	//Потому что на это теперь у нас уйдет уйма времени! А сейчас дорога каждая минута.
		AI_Output(other,self,"DIA_NONE_1190_Assasin_Poison_Done_01_58");	//Выходит, что и к Осаиру я вернусь тоже ни с чем.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_59");	//Осаиру?! А он тут при чем?
		AI_Output(other,self,"DIA_NONE_1190_Assasin_Poison_Done_01_60");	//Нрозас обещал дать немного яда для мастера Осаира, если я смогу проверить действие его зелья.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_61");	//Хммм... А это немного меняет дело.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_62");	//Возможно, что твой промах мы сможем использовать в наших целях.
		AI_Output(other,self,"DIA_NONE_1190_Assasin_Poison_Done_01_63");	//И каким же образом?
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_64");	//Мы попробуем их столкнуть лбами между собой.
		AI_Output(other,self,"DIA_NONE_1190_Assasin_Poison_Done_01_65");	//И что мне нужно для этого сделать?
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_66");	//Ну, мне видится лишь два варианта.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_67");	//Либо ты отдаешь этот яд Осаиру, либо просто говоришь ему, что яд Нрозаса не действует.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_68");	//Однако в первом случае у Нрозаса будет серьезный повод убить тебя.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_69");	//И наверняка его поддержат все остальные братья Масиафа!
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_70");	//Ну а во втором случае - мы имеем всего лишь слова одного приора против другого.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_71");	//Что для тебя куда лучше и безопаснее!
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_72");	//Ведь наверняка эта весть очень быстро разнесется по всему Братству.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_73");	//А сам Осаир не преминет случаем поднять Нрозаса на смех.
		AI_Output(other,self,"DIA_NONE_1190_Assasin_Poison_Done_01_74");	//Кажется, теперь я понимаю, о чем ты.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Poison_Done_01_75");	//Ну, тогда действуй. Не стоит терять времени.
		PlayerSafeFromNrozas = TRUE;
		B_LogEntry(TOPIC_PW_PoisonNrozas,"Гонсалес, хитрый лис, придумал, как можно использовать мой промах. Надо столкнуть лбами двух приоров - Осаира и Нрозаса. Я могу отдать этот пузырек с ядом Осаиру, но тогда Нрозас будет иметь полное право убить меня. Или же я могу отнести пузырек Нрозасу, а Осаиру сказать, что яд просто не действует.");
		AI_StopProcessInfos(self);
	};
};

instance DIA_NONE_1190_Assasin_OsairLiar(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_OsairLiar_Condition;
	information = DIA_NONE_1190_Assasin_OsairLiar_Info;
	permanent = FALSE;
	description = "У меня большие проблемы!";
};

func int DIA_NONE_1190_Assasin_OsairLiar_Condition()
{
	if((MIS_PW_PoisonNrozas == LOG_Success) && (OsairLiarNrozasPoison == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_OsairLiar_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_NONE_1190_Assasin_OsairLiar_01_01");	//У меня большие проблемы!
	AI_Output(self,other,"DIA_NONE_1190_Assasin_OsairLiar_01_02");	//Что случилось?!
	AI_Output(other,self,"DIA_NONE_1190_Assasin_OsairLiar_01_03");	//Та история с ядом! Я не придумал ничего лучше, чем соврать Осаиру.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_OsairLiar_01_04");	//Теперь он собирается лично наведаться к Нрозасу и уладить этот вопрос.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_OsairLiar_01_05");	//И тогда твое вранье быстро всплывет наружу. (ехидно) Ну ты даешь, парень!
	AI_Output(self,other,"DIA_NONE_1190_Assasin_OsairLiar_01_06");	//Ты нашел явно не того человека, чтобы водить его вокруг пальца.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_OsairLiar_01_07");	//Осаир очень жестокий и мстительный человек.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_OsairLiar_01_08");	//Хотя уверен, ты и сам прекрасно знаешь, что он с тобой сделает, когда узнает правду.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_OsairLiar_01_09");	//Что мы можем сделать в этой ситуации?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_OsairLiar_01_10");	//Хммм...(задумчиво) На мой взгляд, единственный выход - это убить самого Осаира!
	AI_Output(self,other,"DIA_NONE_1190_Assasin_OsairLiar_01_11");	//Только это надо сделать по-тихому, без свидетелей.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_OsairLiar_01_12");	//Полагаю, что лучше всего подойдет момент, когда Осаир отправится в храм к Нрозасу.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_OsairLiar_01_13");	//Я, конечно, абсолютно не в курсе, станет ли его кто-то сопровождать, или он отправится в храм один.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_OsairLiar_01_14");	//Но в любом случае это будет реальный шанс прикончить еще одного приора.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_OsairLiar_01_15");	//А как ты думаешь, один я с ним справлюсь?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_OsairLiar_01_16");	//Сомневаюсь. Поэтому я пойду с тобой. Так, на всякий случай.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_OsairLiar_01_17");	//Надеюсь, ты хотя бы знаешь время, когда Осаир пойдет в храм Братства.

	if(OsairGotoHram == TRUE)
	{
		AI_Output(other,self,"DIA_NONE_1190_Assasin_OsairLiar_01_18");	//Конечно.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_OsairLiar_01_19");	//Тогда я спокоен. Просто скажи, как будешь готов.
	}
	else
	{
		AI_Output(other,self,"DIA_NONE_1190_Assasin_OsairLiar_01_20");	//Эммм...
		AI_Output(self,other,"DIA_NONE_1190_Assasin_OsairLiar_01_21");	//(с укором) Видимо, нет.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_OsairLiar_01_22");	//Тогда наша затея не будет иметь абсолютно никакого смысла!
	};
};

var int PW_OsairKill_OneTimer;

instance DIA_NONE_1190_Assasin_OsairGetKill(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_OsairGetKill_Condition;
	information = DIA_NONE_1190_Assasin_OsairGetKill_Info;
	permanent = TRUE;
	description = "Уже пора, идем!";
};

func int DIA_NONE_1190_Assasin_OsairGetKill_Condition()
{
	var int daynow;

	daynow = Wld_GetDay();

	if((OsairGotoHram == TRUE) && (OsairGotoHramDay == (daynow - 1)) && (Npc_KnowsInfo(hero,DIA_NONE_1190_Assasin_OsairLiar)) && ((OsairGetKill == FALSE) || (OsairGoKill == FALSE)))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_OsairGetKill_Info()
{
	AI_Output(other,self,"DIA_NONE_1190_Assasin_OsairGetKill_01_01");	//Уже пора, идем!
	AI_Output(other,self,"DIA_NONE_1190_Assasin_OsairGetKill_01_02");	//Осаир должен прибыть в храм до полудня.

	if(Wld_IsTime(10,0,12,0))
	{
		AI_Output(self,other,"DIA_NONE_1190_Assasin_OsairGetKill_01_03");	//(решительно) Тогда вперед. Не будем терять времени!
		AI_Output(self,other,"DIA_NONE_1190_Assasin_OsairGetKill_01_04");	//Возможно, мы даже успеем выбрать более выгодную позицию для нападения.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_OsairGetKill_01_05");	//Следуй за мной.
		OsairGoKill = TRUE;
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(Ass_127_Osair,"GotoHram");

		if(SBMODE == 1)
		{
			Npc_ExchangeRoutine(Ass_133_Adept,"GotoHram");			
			Npc_ExchangeRoutine(Ass_134_Adept,"GotoHram");	
		};

		Npc_ExchangeRoutine(self,"FollowOsairKill");
		Npc_SetRefuseTalk(NONE_1190_Assasin,600);
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	}
	else if(Wld_IsTime(12,0,23,59))
	{
		AI_Output(self,other,"DIA_NONE_1190_Assasin_OsairGetKill_01_06");	//Эх! Тогда мы упустили свой шанс. Наверняка Осаир уже там.
		AI_Output(other,self,"DIA_NONE_1190_Assasin_OsairGetKill_01_07");	//И что теперь будет?
		AI_Output(self,other,"DIA_NONE_1190_Assasin_OsairGetKill_01_08");	//Можешь отправиться к Осаиру и сам узнать это!
		AI_Output(self,other,"DIA_NONE_1190_Assasin_OsairGetKill_01_09");	//Но, думаю, лучше не стоит.
		OsairGetKill = TRUE;
	}
	else
	{
		if(PW_OsairKill_OneTimer == FALSE)
		{
			AI_Output(self,other,"DIA_NONE_1190_Assasin_OsairGetKill_01_10");	//Тогда нам еще рано выдвигаться.
			AI_Output(other,self,"DIA_NONE_1190_Assasin_OsairGetKill_01_11");	//Это почему?
			AI_Output(self,other,"DIA_NONE_1190_Assasin_OsairGetKill_01_12");	//Знаешь, все-таки торчать на виду у всего Братства - не самая лучшая идея.
			AI_Output(other,self,"DIA_NONE_1190_Assasin_OsairGetKill_01_13");	//Хорошо, как скажешь.
			PW_OsairKill_OneTimer = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_NONE_1190_Assasin_OsairGetKill_01_14");	//Все еще рано. Успокойся уже, и прекрати меня дергать!
		};
	};
};

instance DIA_NONE_1190_Assasin_BattleForever(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_BattleForever_Condition;
	information = DIA_NONE_1190_Assasin_BattleForever_Info;
	permanent = FALSE;
	description = "Кажется, мне остается только сражаться с Масиаф!";
};

func int DIA_NONE_1190_Assasin_BattleForever_Condition()
{
	if((PlayerIsPrioratFake == TRUE) && (PlayerChooseFight_PW == FALSE) && (TempleIsClear == FALSE) && (OsairAttackMe == FALSE) && (HideMeetCome == FALSE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_BattleForever_Info()
{
	AI_Output(other,self,"DIA_NONE_1190_Assasin_BattleForever_01_01");	//Кажется, мне остается только сражаться с Масиаф! Ты мне поможешь?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_BattleForever_01_02");	//Ну, если все так плохо. В любом случае я с тобой!
	AI_Output(self,other,"DIA_NONE_1190_Assasin_BattleForever_01_03");	//Ступай вперед. Я прикрою твою спину.
	PlayerChooseFight_PW = TRUE;
	self.aivar[AIV_PARTYMEMBER] = TRUE;

	if(MIS_MasiafStory == FALSE)
	{
		MIS_MasiafStory = LOG_Running;
		Log_CreateTopic(TOPIC_MasiafStory,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_MasiafStory,LOG_Running);
	};
	if(MIS_MasiafStory == LOG_Running)
	{
		B_LogEntry(TOPIC_MasiafStory,"Похоже, атака на храм - теперь единственный путь отсюда. Гонсалес поддержит меня!");
	};	

	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FollowMasiafTemple");
	Npc_ExchangeRoutine(Ass_126_Haniar,"TOT");
	AI_Teleport(Ass_126_Haniar,"TOT");
	Wld_InsertNpc(Ass_129_DeadNrozas,"PW_INNER_DEMON_SPAWN");
};

instance DIA_NONE_1190_Assasin_OsairGetKill_Done(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_OsairGetKill_Done_Condition;
	information = DIA_NONE_1190_Assasin_OsairGetKill_Done_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_NONE_1190_Assasin_OsairGetKill_Done_Condition()
{
	if((OsairIsDead == TRUE) && (NoGonsaHereMe == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_OsairGetKill_Done_Info()
{
	AI_Output(other,self,"DIA_NONE_1190_Assasin_OsairGetKill_Done_01_01");	//Осаир мертв!
	AI_Output(self,other,"DIA_NONE_1190_Assasin_OsairGetKill_Done_01_02");	//Да, он мертв. Однако это еще не означает, что мы победили.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_OsairGetKill_Done_01_03");	//Мы только ранили зверя, но в своей смертельной агонии он может быть еще страшней!
	AI_Output(other,self,"DIA_NONE_1190_Assasin_OsairGetKill_Done_01_04");	//И что мы будем делать дальше?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_OsairGetKill_Done_01_05");	//Хммм... Я уверен, что как только в Братстве узнают о смерти Осаира, они наверняка поднимут тревогу.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_OsairGetKill_Done_01_06");	//И тогда Ханиар начнет убивать всех, на кого хотя бы падет тень подозрения.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_OsairGetKill_Done_01_07");	//Тебя на тот момент не было в храме, а значит, по возвращению туда твоя жизнь может быть в опасности.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_OsairGetKill_Done_01_08");	//Что ты предлагаешь?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_OsairGetKill_Done_01_09");	//Сейчас нельзя терять ни минуты. Поэтому мы поступим следующим образом.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_OsairGetKill_Done_01_00");	//Возвращайся в пещеру Осаира и убей всех его людей!
	AI_Output(self,other,"DIA_NONE_1190_Assasin_OsairGetKill_Done_01_10");	//А я отправлюсь к храму и прослежу, чтобы никто не направился оттуда в твою сторону.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_OsairGetKill_Done_01_11");	//Да, и не забудь освободить всех пленных рабов. Не оставлять же их здесь!
	AI_Output(other,self,"DIA_NONE_1190_Assasin_OsairGetKill_Done_01_12");	//Сделаю все что смогу.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_OsairGetKill_Done_01_13");	//Отлично! Тогда ступай.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"MasiafTempleWait");
};

instance DIA_NONE_1190_Assasin_PreFinalBattle(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_PreFinalBattle_Condition;
	information = DIA_NONE_1190_Assasin_PreFinalBattle_Info;
	permanent = FALSE;
	description = "Я позаботился о людях Осаира.";
};

func int DIA_NONE_1190_Assasin_PreFinalBattle_Condition()
{
	if((Npc_KnowsInfo(hero,DIA_NONE_1190_Assasin_OsairGetKill_Done)) && (Npc_IsDead(Ass_133_Adept) == TRUE) && (Npc_IsDead(Ass_134_Adept) == TRUE) && (Npc_IsDead(Ass_135_Adept) == TRUE) && (Npc_IsDead(Ass_136_Adept) == TRUE) && (Npc_IsDead(Ass_137_Adept) == TRUE) && (OsairSlavesIsFree == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_PreFinalBattle_Info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_NONE_1190_Assasin_PreFinalBattle_01_01");	//Я позаботился о людях Осаира. А у тебя как дела?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_PreFinalBattle_01_02");	//Пока все было тихо. Но раз ты уже здесь, то, видимо, пришло время немного пошуметь тут.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_PreFinalBattle_01_03");	//Ты хочешь напасть на храм?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_PreFinalBattle_01_04");	//Именно так! Пока они ничего не подозревают, нам вдвоем это будет вполне по силам.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_PreFinalBattle_01_05");	//Застанем их врасплох. Тем более что медлить нам сейчас никак нельзя.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_PreFinalBattle_01_06");	//Как скажешь.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_PreFinalBattle_01_07");	//Тогда ступай вперед. Я прикрою твою спину.
	PlayerChooseFight_PW = TRUE;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	B_LogEntry(TOPIC_MasiafStory,"Гонсалес хочет атаковать храм. Он полагает, что у нас теперь хватит на это сил.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FollowMasiafTemple");
	Npc_ExchangeRoutine(Ass_126_Haniar,"TOT");
	AI_Teleport(Ass_126_Haniar,"TOT");
	Npc_ExchangeRoutine(Ass_128_Nrozas,"TOT");
	AI_Teleport(Ass_128_Nrozas,"TOT");
	Wld_InsertNpc(Ass_129_DeadNrozas,"PW_INNER_DEMON_SPAWN");
};

instance DIA_NONE_1190_Assasin_Sword_Osair(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_Sword_Osair_Condition;
	information = DIA_NONE_1190_Assasin_Sword_Osair_Info;
	permanent = FALSE;
	description = "У меня тут меч Осаира.";
};

func int DIA_NONE_1190_Assasin_Sword_Osair_Condition()
{
	if((Npc_KnowsInfo(hero,DIA_NONE_1190_Assasin_OsairGetKill_Done)) && (PlayerIsAssNow == TRUE) && (GonsaTakeSword_Osair == FALSE) && (Npc_HasItems(other,ITMW_2H_MASIAF_OSAIR) >= 1))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_Sword_Osair_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Sword_Osair_01_01");	//У меня тут меч Осаира.
	B_GiveInvItems(other,self,ITMW_2H_MASIAF_OSAIR,1);
	Npc_RemoveInvItems(self,ITMW_2H_MASIAF_OSAIR,1);
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Sword_Osair_01_02");	//Ага! У меня ему будет куда лучше.
	GonsaTakeSword_Osair = TRUE;
};

instance DIA_NONE_1190_Assasin_Sword_Nrozas(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_Sword_Nrozas_Condition;
	information = DIA_NONE_1190_Assasin_Sword_Nrozas_Info;
	permanent = FALSE;
	description = "У меня есть меч Нрозаса.";
};

func int DIA_NONE_1190_Assasin_Sword_Nrozas_Condition()
{
	if((MIS_TrueBattle == LOG_Success) && (NrozasIsDead == TRUE) && (PlayerIsAssNow == TRUE) && (GonsaTakeSword_Nrozas == FALSE) && (Npc_HasItems(other,ITMW_2H_MASIAF_NROZAS) >= 1))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_Sword_Nrozas_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Sword_Nrozas_01_01");	//У меня есть меч Нрозаса.
	B_GiveInvItems(other,self,ITMW_2H_MASIAF_NROZAS,1);
	Npc_RemoveInvItems(self,ITMW_2H_MASIAF_NROZAS,1);
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Sword_Nrozas_01_02");	//Хорошо. Я оставлю его у себя.
	GonsaTakeSword_Nrozas = TRUE;
};

instance DIA_NONE_1190_Assasin_Sword_MasiafRitual(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_Sword_MasiafRitual_Condition;
	information = DIA_NONE_1190_Assasin_Sword_MasiafRitual_Info;
	permanent = FALSE;
	description = "У меня при себе есть один странный меч.";
};

func int DIA_NONE_1190_Assasin_Sword_MasiafRitual_Condition()
{
	if(Npc_HasItems(other,ITMW_FAKESWORD_01) >= 1)
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_Sword_MasiafRitual_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Sword_MasiafRitual_01_01");	//У меня при себе есть один странный меч.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Sword_MasiafRitual_01_02");	//Дай мне взглянуть.
	B_GiveInvItems(other,self,ITMW_2H_MASIAF_NROZAS,1);
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Sword_MasiafRitual_01_03");	//А, этот! Ну, в нем нет ничего необычного.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Sword_MasiafRitual_01_04");	//Просто это оружие используется только для священных ритуальных убийств.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Sword_MasiafRitual_01_05");	//Что ты имеешь в виду?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Sword_MasiafRitual_01_06");	//Ты ведь уже знаешь, что все братья Масиаф поклоняются Белиару.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Sword_MasiafRitual_01_07");	//Так вот. Порой, убивая свою жертву, они это делают специальным ритуальным клинком.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Sword_MasiafRitual_01_08");	//Тем самым принося душу убитого в дар Темному богу.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Sword_MasiafRitual_01_09");	//Однако подобное делается только с согласия и разрешения самого Зубена.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Sword_MasiafRitual_01_10");	//Ну, или же другого очень влиятельного темного мага.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Sword_MasiafRitual_01_11");	//В противном случае, человека, совершившего такое убийство, ожидает долгая и мучительная смерть.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Sword_MasiafRitual_01_12");	//С богами, знаешь ли, не шутят!
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Sword_MasiafRitual_01_13");	//А ты, случайно, не знаешь, кто ими мог бы заинтересоваться?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Sword_MasiafRitual_01_14");	//Хммм... Трудно сказать.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Sword_MasiafRitual_01_15");	//Насколько я помню, они содержат в себе частицу магии Белиара.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Sword_MasiafRitual_01_16");	//Так что вполне вероятно, кто-нибудь из темных магов, возможно, и заинтересовался бы ими.
	DarkMageBuySwords = TRUE;
};

instance DIA_NONE_1190_Assasin_NrozasKill_Done(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_NrozasKill_Done_Condition;
	information = DIA_NONE_1190_Assasin_NrozasKill_Done_Info;
	permanent = FALSE;
	description = "Приор Нрозас мертв.";
};

func int DIA_NONE_1190_Assasin_NrozasKill_Done_Condition()
{
	if((MIS_TrueBattle == LOG_Success) && (NrozasIsDead == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_NrozasKill_Done_Info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_NONE_1190_Assasin_NrozasKill_Done_01_01");	//Приор Нрозас мертв.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NrozasKill_Done_01_02");	//(удивленно) Интересно, как так вышло?
	AI_Output(other,self,"DIA_NONE_1190_Assasin_NrozasKill_Done_01_03");	//Он вызвал меня на поединок Истины. Так что у меня не было выбора!
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NrozasKill_Done_01_04");	//Хммм... Что же, считай, тебе повезло! Бой на мечах была не самая сильная его сторона.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NrozasKill_Done_01_05");	//В любом случае смерть одного из приоров сильно ослабит Братство.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_NrozasKill_Done_01_06");	//И это нам только на руку.
};

instance DIA_NONE_1190_Assasin_HideMeeting(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_HideMeeting_Condition;
	information = DIA_NONE_1190_Assasin_HideMeeting_Info;
	permanent = FALSE;
	description = "У меня есть для тебя интересные новости.";
};

func int DIA_NONE_1190_Assasin_HideMeeting_Condition()
{
	if(HaniarReadyMeeting == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_HideMeeting_Info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_NONE_1190_Assasin_HideMeeting_01_01");	//У меня есть для тебя интересные новости.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HideMeeting_01_02");	//Тогда выкладывай быстрей. Что у тебя там?
	AI_Output(other,self,"DIA_NONE_1190_Assasin_HideMeeting_01_03");	//По всей видимости, в Братстве скоро произойдет большая заварушка!
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HideMeeting_01_04");	//С чего ты это взял?
	AI_Output(other,self,"DIA_NONE_1190_Assasin_HideMeeting_01_05");	//Осаир захотел прибрать власть в свои руки, но Ханиар, как ты понимаешь, против этого.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HideMeeting_01_06");	//Еще бы! Никто не захочет уйти в тень. Тем более такой человек, как Ханиар.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_HideMeeting_01_07");	//В скором времени они должны будут встретиться, чтобы разрешить этот вопрос.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_HideMeeting_01_08");	//И, скорее всего, после этого в живых останется только один из них.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HideMeeting_01_09");	//Как интересно. А сколько человек возьмет с собой Ханиар?
	AI_Output(other,self,"DIA_NONE_1190_Assasin_HideMeeting_01_10");	//Он пошел на эту встречу один.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HideMeeting_01_11");	//Хммм... Он что, с ума сошел? Это же чистое самоубийство.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_HideMeeting_01_12");	//Он был довольно уверенным в себе, когда говорил мне об этом.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HideMeeting_01_13");	//Не нравится мне все это! Ханиар никогда не отличался глупостью и безрассудством.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HideMeeting_01_14");	//Наверняка он подготовил для Осаира какой-нибудь сюрприз, о котором тот ничего даже не подозревает.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HideMeeting_01_15");	//А ты случайно не знаешь, где должна состояться эта встреча?
	AI_Output(other,self,"DIA_NONE_1190_Assasin_HideMeeting_01_16");	//Нет, об этом они оба умолчали.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HideMeeting_01_17");	//Тогда на твоем месте я бы узнал об этом.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HideMeeting_01_18");	//Мне кажется, что нам стоит тоже поприсутствовать на ней. Естественно, незаметно для всех остальных.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_HideMeeting_01_19");	//Ладно, попробую это выяснить.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HideMeeting_01_20");	//Ты уж постарайся, приятель!
	MIS_HaniarSecret = LOG_Running;
	Log_CreateTopic(TOPIC_HaniarSecret,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HaniarSecret,LOG_Running);
	B_LogEntry(TOPIC_HaniarSecret,"Я рассказал Гонсалесу о предстоящей встрече приоров. Его очень сильно удивило то, что Ханиар отправится на нее один. Гонсалес попросил меня выяснить, где будет происходить встреча. Скорее всего, она произойдет где-то вдалеке от посторонних глаз.");
	AI_StopProcessInfos(self);

	B_KillNpc(SEK_179_SLAVEOBSSEK);
	B_KillNpc(SEK_180_SLAVEOBSSEK);
	B_KillNpc(SEK_181_SLAVEOBSSEK);
	B_KillNpc(Ass_182_Adept);

	Wld_InsertNpc(Ass_395_Adept,"PW_OSAIR_MEET_GUARD_05");
	Wld_InsertNpc(Ass_396_Adept,"PW_OSAIR_MEET_GUARD_05_01");
	Wld_InsertNpc(Ass_397_Adept,"PW_OSAIR_MEET_GUARD_05_02");

};

instance DIA_NONE_1190_Assasin_KnowPlaceMeeting(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_KnowPlaceMeeting_Condition;
	information = DIA_NONE_1190_Assasin_KnowPlaceMeeting_Info;
	permanent = FALSE;
	description = "Кажется, я знаю где произойдет встреча.";
};

func int DIA_NONE_1190_Assasin_KnowPlaceMeeting_Condition()
{
	if((MIS_HaniarSecret == LOG_Running) && (KnowPlaceMeeting == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_KnowPlaceMeeting_Info()
{
	AI_Output(other,self,"DIA_NONE_1190_Assasin_KnowPlaceMeeting_01_01");	//Кажется, я знаю где произойдет встреча.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_KnowPlaceMeeting_01_02");	//И где же?

	if((Npc_IsDead(Ass_395_Adept) == TRUE) && (Npc_IsDead(Ass_396_Adept) == TRUE) && (Npc_IsDead(Ass_397_Adept) == TRUE))
	{
		B_GivePlayerXP(300);
		AI_Output(other,self,"DIA_NONE_1190_Assasin_KnowPlaceMeeting_01_03");	//Люди Осаира заблокировали вход в подгорную пещеру. Правда, мне пришлось их убить.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_KnowPlaceMeeting_01_04");	//М-да. Ты никогда не упустишь свой шанс порубить кого-нибудь на куски.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_KnowPlaceMeeting_01_05");	//Но, скорее всего, ты прав.
	}
	else
	{
		B_GivePlayerXP(100);
		AI_Output(other,self,"DIA_NONE_1190_Assasin_KnowPlaceMeeting_01_06");	//Люди Осаира заблокировали вход в подгорную пещеру и никого туда не пускают.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_KnowPlaceMeeting_01_07");	//Скорее всего, ты прав.
	};

	AI_Output(self,other,"DIA_NONE_1190_Assasin_KnowPlaceMeeting_01_08");	//По всей видимости, Осаир принял все меры предосторожности, чтобы ему никто не помешал разделаться с Ханиаром.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_KnowPlaceMeeting_01_09");	//(серьезно) Тогда не будем терять времени. Ступай за мной!
	AI_Output(self,other,"DIA_NONE_1190_Assasin_KnowPlaceMeeting_01_10");	//Нам надо во что бы то ни стало пробиться в эту пещеру.
	RespPWMeet = TRUE;
	HideMeetCome = TRUE;
	PlayerIsPrioratFake = TRUE;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FollowHideMeet");

	if(FazimAgreed == TRUE)
	{
		Npc_ExchangeRoutine(Ass_391_Adept,"OsairMeet");
	}
	else
	{
		Wld_InsertNpc(Ass_398_Adept,"PW_OSAIR_MEET_GUARD_01");
	};
	if(RafatAgreed == TRUE)
	{
		Npc_ExchangeRoutine(Ass_392_Adept,"OsairMeet");
	}
	else
	{
		Wld_InsertNpc(Ass_399_Adept,"PW_OSAIR_MEET_GUARD_03");
	};
	if(NazimGetOutCave == TRUE)
	{
		Npc_ExchangeRoutine(Ass_393_Adept,"OsairMeet");
	}
	else
	{
		Wld_InsertNpc(Ass_598_Adept,"PW_OSAIR_MEET_GUARD_02");
	};
	if(KudirGetTrollPlant == TRUE)
	{
		Npc_ExchangeRoutine(Ass_394_Adept,"OsairMeet");
	}
	else
	{
		Wld_InsertNpc(Ass_599_Adept,"PW_OSAIR_MEET_GUARD_04");
	};

	Npc_ExchangeRoutine(Ass_126_Haniar,"OsairMeet");
	Npc_ExchangeRoutine(Ass_127_Osair,"OsairMeet");
};

instance DIA_NONE_1190_Assasin_Showdown(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_Showdown_Condition;
	information = DIA_NONE_1190_Assasin_Showdown_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_NONE_1190_Assasin_Showdown_Condition()
{
	if((MIS_HaniarSecret == LOG_Running) && (HideMeetCamera == TRUE) && (HaniarDemonRitualEnd == TRUE) && (Npc_GetDistToWP(self,"PW_GOLD_CAVEORE_TEMP_06") < 400))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_Showdown_Info()
{
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Showdown_01_01");	//Что это были за твари?
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Showdown_01_02");	//Похоже, это демоны.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Showdown_01_03");	//Хммм...(задумчиво) А Ханиар действительно не так прост, как казался на первый взгляд.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Showdown_01_04");	//Я был просто уверен, что он преподнесет Осаиру сюрприз. 
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Showdown_01_05");	//А он преподнес его не только ему, да?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Showdown_01_06");	//Нет человека, которого бы я испугался. Но эти твари меня немного нервируют!
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Showdown_01_07");	//Ты видел, как они играючи расправились с Осаиром и его людьми?
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Showdown_01_08");	//И что мы теперь будем делать?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Showdown_01_09");	//Я не знаю. Но в любом случае лучшего шанса уничтожить Ханиара уже не будет.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Showdown_01_10");	//Поэтому придется сначала уничтожить это белиарово отродье!
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Showdown_01_11");	//Ну, ты искал достойного врага - и вот - он перед тобой.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Showdown_01_12");	//Тогда вперед! Не будем терять времени.
	HaniarCantTalk = TRUE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"MeetHaniar");
};

instance DIA_NONE_1190_Assasin_HaniarAway(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_HaniarAway_Condition;
	information = DIA_NONE_1190_Assasin_HaniarAway_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_NONE_1190_Assasin_HaniarAway_Condition()
{
	if((MIS_HaniarSecret == LOG_Running) && (HaniarAway == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_HaniarAway_Info()
{
	B_GivePlayerXP(2000);
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HaniarAway_01_01");	//Хорошие дела. Этот ублюдок просто сбежал от нас!
	AI_Output(other,self,"DIA_NONE_1190_Assasin_HaniarAway_01_02");	//Я бы на его месте поступил точно так же.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HaniarAway_01_03");	//И что же, по-твоему, нам теперь делать?
	AI_Output(other,self,"DIA_NONE_1190_Assasin_HaniarAway_01_04");	//Ханиар упомянул о каком-то внутреннем святилище храма.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_HaniarAway_01_05");	//Думаю, стоит поискать это место.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HaniarAway_01_06");	//Если его и искать, то только в храме.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_HaniarAway_01_07");	//Тогда идем. Пора покончить со всем этим.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HaniarAway_01_08");	//Хорошо! Я следую за тобой.
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	MIS_HaniarSecret = LOG_Success;
	Log_SetTopicStatus(TOPIC_HaniarSecret,LOG_Success);
	B_LogEntry(TOPIC_HaniarSecret,"Ханиар сбежал от нас. Его хваленое могущество не устояло против наших с Гонсалесом мечей. Но дело еще не закончено. Ханиар говорил о каком-то внутреннем святилище храма, где находится его повелитель. Необходимо скорее выяснить - кто это, пока не поздно. Мы решили начать поиски в храме Масиаф.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FollowMasiafTemple");
};

instance DIA_NONE_1190_Assasin_InTemple(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_InTemple_Condition;
	information = DIA_NONE_1190_Assasin_InTemple_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_NONE_1190_Assasin_InTemple_Condition()
{
	if((Npc_GetDistToWP(self,"PW_TEMPLE_HASIM_TEMP") < 1000) && (Npc_IsInFightMode(hero,FMODE_NONE) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_InTemple_Info()
{
	AI_Output(self,other,"DIA_NONE_1190_Assasin_InTemple_01_01");	//Итак, мы на месте! Значит, это тут было их логово?

	if(PlayerChooseFight_PW == TRUE)
	{
		AI_Output(other,self,"DIA_NONE_1190_Assasin_InTemple_01_02");	//Как видишь.
		AI_PlayAni(self,"T_SEARCH");
		AI_Output(self,other,"DIA_NONE_1190_Assasin_InTemple_01_03");	//Красивое место! Но слишком много зла в нем. 
		AI_Output(other,self,"DIA_NONE_1190_Assasin_InTemple_01_04");	//Все это зло теперь лежит мертвое в луже собственной крови.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_InTemple_01_05");	//(мрачно) Еще не все. Мы лишь ранили зверя, но не снесли ему голову!
		AI_Output(other,self,"DIA_NONE_1190_Assasin_InTemple_01_06");	//Ты в этом уверен?
		AI_Output(self,other,"DIA_NONE_1190_Assasin_InTemple_01_07");	//Я имею в виду Ханиара Слепца, самого могущественного из приоров Масиафа!
		AI_Output(other,self,"DIA_NONE_1190_Assasin_InTemple_01_08");	//Но его вроде не было среди остальных.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_InTemple_01_09");	//В этом то и дело. И если он жив, то ничего еще не закончено.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_InTemple_01_10");	//Только когда, его хладный труп упадет к моим ногам...
		AI_Output(self,other,"DIA_NONE_1190_Assasin_InTemple_01_11");	//...только тогда можно считать, что эта битва выиграна!
		AI_Output(other,self,"DIA_NONE_1190_Assasin_InTemple_01_12");	//И где же нам его искать?
	}
	else
	{
		AI_Output(other,self,"DIA_NONE_1190_Assasin_InTemple_01_13");	//Как видишь.
		AI_PlayAni(self,"T_SEARCH");
		AI_Output(self,other,"DIA_NONE_1190_Assasin_InTemple_01_14");	//Красивое место! Но слишком много зла в нем. 
		AI_Output(other,self,"DIA_NONE_1190_Assasin_InTemple_01_15");	//Все это зло теперь лежит мертвое в луже собственной крови.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_InTemple_01_16");	//(мрачно) Еще не все. Мы лишь ранили зверя, но не снесли ему голову.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_InTemple_01_17");	//Пока Ханиар жив, еще ничего не закончено.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_InTemple_01_18");	//Только когда его хладный труп упадет к моим ногам...
		AI_Output(self,other,"DIA_NONE_1190_Assasin_InTemple_01_19");	//...только тогда можно считать, что эта битва выиграна!
		AI_Output(other,self,"DIA_NONE_1190_Assasin_InTemple_01_20");	//И с чего нам начать поиски?
	};

	AI_Output(self,other,"DIA_NONE_1190_Assasin_InTemple_01_21");	//Для начала необходимо обыскать весь храм. Займись этим.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_InTemple_01_22");	//Возможно, мы отыщем то, что поможет нам в наших поисках.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_InTemple_01_23");	//А я же пока что обдумаю сложившуюся ситуацию.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_InTemple_01_24");	//Ну как всегда, самая 'простая' работенка достается именно мне.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_InTemple_01_25");	//Хватит ныть! Лучше займись делом.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_InTemple_01_26");	//Как скажешь.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	B_LogEntry(TOPIC_MasiafStory,"Мы с Гонсалесом добрались до храма. Однако нас ждало небольшое разочарование. Ханиар Слепец, главный духовный наставник и самый могущественный из приоров Братства Масиаф, бесследно исчез. Гонсалес предложил обыскать храм в поисках того, что поможет нам выйти на его след.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"InTemple");
	GonsaInTemple = TRUE;
	Wld_InsertItem(ItWr_DemonScroll,"FP_ITEMSPAWN_DEMONSCROLL");
};

instance DIA_NONE_1190_Assasin_DemonScroll(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_DemonScroll_Condition;
	information = DIA_NONE_1190_Assasin_DemonScroll_Info;
	permanent = FALSE;
	description = "Я тут нашел только этот странный свиток.";
};

func int DIA_NONE_1190_Assasin_DemonScroll_Condition()
{

	if((GonsaInTemple == TRUE) && (Npc_HasItems(other,ItWr_DemonScroll) >= 1))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_DemonScroll_Info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_NONE_1190_Assasin_DemonScroll_01_01");	//Я тут нашел только этот странный свиток.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_DemonScroll_01_02");	//Дай мне взглянуть на него.
	B_GiveInvItems(other,self,ItWr_DemonScroll,1);
	Npc_RemoveInvItems(self,ItWr_DemonScroll,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_NONE_1190_Assasin_DemonScroll_01_03");	//Это не просто свиток! Похоже, здесь написано какое-то заклинание.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_DemonScroll_01_04");	//И, похоже, оно написано на древнем языке Белиара.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_DemonScroll_01_05");	//А ты откуда знаешь?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_DemonScroll_01_06");	//Не забывай, что братья Масиаф поклоняются Белиару так же, как паладины короля - Инносу!
	AI_Output(self,other,"DIA_NONE_1190_Assasin_DemonScroll_01_07");	//И как, ты думаешь, они обращаются к нему в молитвах?
	AI_Output(other,self,"DIA_NONE_1190_Assasin_DemonScroll_01_08");	//Ну, мне это неизвестно.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_DemonScroll_01_09");	//Тогда просто поверь мне! Этот язык я ни с чем не перепутаю.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_DemonScroll_01_10");	//И что мне с ним делать?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_DemonScroll_01_11");	//Попробуй использовать это заклинание в молитве к Белиару.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_DemonScroll_01_12");	//Возможно, что-то и прояснится!
	AI_Output(other,self,"DIA_NONE_1190_Assasin_DemonScroll_01_13");	//Ладно, давай попробую.
	B_GiveInvItems(self,other,ItWr_HaniarDemonScroll,1);
	B_LogEntry(TOPIC_MasiafStory,"В храме я нашел свиток с заклинанием на древнем языке Белиара. Гонсалес посоветовал мне использовать это заклинание перед статуей Белиара. Возможно, из этого что-то и получится.");
};

instance DIA_NONE_1190_Assasin_MasiafSecret(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_MasiafSecret_Condition;
	information = DIA_NONE_1190_Assasin_MasiafSecret_Info;
	permanent = FALSE;
	description = "Я нашел потайную комнату в храме.";
};

func int DIA_NONE_1190_Assasin_MasiafSecret_Condition()
{

	if((MasiafSecret == TRUE) && (GonsHere == FALSE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_MasiafSecret_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_NONE_1190_Assasin_MasiafSecret_01_01");	//Я нашел потайную комнату в храме. И, кажется, в ней есть магический портал.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_MasiafSecret_01_02");	//Ну что же, похоже, что теперь Ханиару не уйти от нас.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_MasiafSecret_01_03");	//Готов поспорить, что именно этот портал ведет во внутреннее святилище храма.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_MasiafSecret_01_04");	//Однако прежде чем отправиться туда, хорошенько подготовься!
	AI_Output(self,other,"DIA_NONE_1190_Assasin_MasiafSecret_01_05");	//Думаю, что там тебя ждет куда более серьезный враг, чем просто один приор Масиафа.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_MasiafSecret_01_06");	//А ты разве не пойдешь со мной?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_MasiafSecret_01_07");	//Думал, что я тебя брошу? (улыбаясь) Я последую за тобой, как только закончу тут все свои дела.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_MasiafSecret_01_08");	//Хорошо! Тогда встретимся на той стороне портала.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_MasiafSecret_01_09");	//Удачи.
	AI_StopProcessInfos(self);
};

instance DIA_NONE_1190_Assasin_HaniarDead(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_HaniarDead_Condition;
	information = DIA_NONE_1190_Assasin_HaniarDead_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_NONE_1190_Assasin_HaniarDead_Condition()
{

	if(Npc_IsDead(Ass_178_Prior_ArchDemon) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_HaniarDead_Info()
{
	B_GivePlayerXP(2000);
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HaniarDead_01_01");	//Все кончено! Ханиар мертв.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_HaniarDead_01_02");	//Мне кажется, что нам надо проверить оставшуюся часть храма.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HaniarDead_01_03");	//Возможно...(переводя дух) Но для меня этот бой уже окончен.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_HaniarDead_01_04");	//Ну, раз так... Теперь ты доволен?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HaniarDead_01_05");	//Я сделал то, что должен был сделать. И при этом не важно, какие эмоции я испытываю.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HaniarDead_01_06");	//Но я крайне благодарен тебе за твою помощь.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_HaniarDead_01_07");	//Не стоит! Это зло должно было быть уничтожено.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HaniarDead_01_08");	//А ты теперь отправишься в глубь храма?
	AI_Output(other,self,"DIA_NONE_1190_Assasin_HaniarDead_01_09");	//Да. Надо выяснить, кто стоит за всем этим.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HaniarDead_01_10");	//Хорошо. Тогда я останусь пока здесь и прикрою твою спину.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_HaniarDead_01_11");	//Ступай. Не стоит терять времени на пустые разговоры.
	GonsaOut = TRUE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	AI_StopProcessInfos(self);
};

instance DIA_NONE_1190_Assasin_HotReduceTeach(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 800;
	condition = DIA_NONE_1190_Assasin_HotReduceTeach_Condition;
	information = DIA_NONE_1190_Assasin_HotReduceTeach_Info;
	permanent = TRUE;
	description = "Научи меня переносить жару (Очки обучения: 10, Цена: 5000 монет)";
};

func int DIA_NONE_1190_Assasin_HotReduceTeach_Condition()
{
	if((GonsaCanTeachMeHot == TRUE) && (HotReduceKnow == FALSE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_HotReduceTeach_Info()
{
	var int kosten;
	var int money;

	AI_Output(other,self,"DIA_NONE_119_Assasin_HotReduceTeach_01_00");	//Научи меня переносить жару.

	kosten = 10;
	money = 5000;

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		AI_Output(self,other,"DIA_NONE_119_Assasin_HotReduceTeach_01_01");	//Извини, но для этого у тебя еще не хватает опыта.
		AI_StopProcessInfos(self);
	};

	if(Npc_HasItems(hero,ItMi_Gold) < money)
	{
		AI_Print(Print_NotEnoughGold);
		AI_Output(self,other,"DIA_NONE_119_Assasin_HotReduceTeach_01_02");	//Извини, но бесплатно я этого делать не стану.
		AI_StopProcessInfos(self);
	};
	if((hero.lp >= kosten) && (Npc_HasItems(hero,ItMi_Gold) >= money))
	{
		AI_Output(self,other,"DIA_NONE_119_Assasin_HotReduceTeach_01_03");	//Не делай лишних движений.
		AI_Output(self,other,"DIA_NONE_119_Assasin_HotReduceTeach_01_04");	//Двигайся как можно меньше, экономь силы.
		AI_Output(self,other,"DIA_NONE_119_Assasin_HotReduceTeach_01_05");	//Жара может быть более изнуряющей, чем бой с целой стаей монстров.
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + kosten;
		Npc_RemoveInvItems(hero,ItMi_Gold,money);
		hero.protection[PROT_FIRE] += 5;
		REALPROTFIRE += 5;
		AI_Print(PRINT_LEARNPROTHOT);
		HotReduceKnow = TRUE;
		Snd_Play("LevelUP");
	};
};

//--------------------------после приората--------------------------------------------

instance DIA_NONE_1191_Assasin_EXIT(C_Info)
{
	npc = NONE_1191_Assasin;
	nr = 999;
	condition = DIA_NONE_1191_Assasin_EXIT_Condition;
	information = DIA_NONE_1191_Assasin_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_NONE_1191_Assasin_EXIT_Condition()
{
	return TRUE;
};

func void DIA_NONE_1191_Assasin_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_NONE_1191_Assasin_PICKPOCKET(C_Info)
{
	npc = NONE_1191_Assasin;
	nr = 900;
	condition = DIA_NONE_1191_Assasin_PICKPOCKET_Condition;
	information = DIA_NONE_1191_Assasin_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int DIA_NONE_1191_Assasin_PICKPOCKET_Condition()
{
	return C_Beklauen(95,350);
};

func void DIA_NONE_1191_Assasin_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_NONE_1191_Assasin_PICKPOCKET);
	Info_AddChoice(DIA_NONE_1191_Assasin_PICKPOCKET,Dialog_Back,DIA_NONE_1191_Assasin_PICKPOCKET_BACK);
	Info_AddChoice(DIA_NONE_1191_Assasin_PICKPOCKET,DIALOG_PICKPOCKET,DIA_NONE_1191_Assasin_PICKPOCKET_DoIt);
};

func void DIA_NONE_1191_Assasin_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_NONE_1191_Assasin_PICKPOCKET);
};

func void DIA_NONE_1191_Assasin_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_NONE_1191_Assasin_PICKPOCKET);
};

instance DIA_NONE_1191_Assasin_PreHallo(C_Info)
{
	npc = NONE_1191_Assasin;
	nr = 1;
	condition = DIA_NONE_1191_Assasin_PreHallo_Condition;
	information = DIA_NONE_1191_Assasin_PreHallo_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_NONE_1191_Assasin_PreHallo_Condition()
{
	if(MIS_PrioratStart == LOG_Success)
	{
		return TRUE;
	};
};

func void DIA_NONE_1191_Assasin_PreHallo_Info()
{
	B_GivePlayerXP(100);
	AI_Output(self,other,"DIA_NONE_1191_Assasin_PreHallo_01_00");	//(улыбаясь) Рад тебя видеть живым и здоровым, мой друг.
	AI_Output(self,other,"DIA_NONE_1191_Assasin_PreHallo_01_01");	//Как все прошло в храме?
	AI_Output(other,self,"DIA_NONE_1191_Assasin_PreHallo_01_02");	//Возникли некоторые трудности, но, как видишь, я с ними справился.
	AI_Output(other,self,"DIA_NONE_1191_Assasin_PreHallo_01_03");	//А как тебе удалось выбраться оттуда?
	AI_Output(self,other,"DIA_NONE_1191_Assasin_PreHallo_01_04");	//Очень просто! У их главаря при себе оказалась магическая руна, которая телепортировала меня обратно в Хоринис.
	AI_Output(other,self,"DIA_NONE_1191_Assasin_PreHallo_01_05");	//Ясно. И что ты намереваешься делать теперь?
	AI_Output(self,other,"DIA_NONE_1191_Assasin_PreHallo_01_06");	//По правде говоря, я собирался отплыть обратно в Варант.
	AI_Output(self,other,"DIA_NONE_1191_Assasin_PreHallo_01_07");	//Но, как оказалось, паладинская галера - единственный корабль на этом острове.
	AI_Output(self,other,"DIA_NONE_1191_Assasin_PreHallo_01_08");	//А другие корабли не заходили в порт Хориниса уже несколько месяцев.
	AI_Output(self,other,"DIA_NONE_1191_Assasin_PreHallo_01_09");	//По всей видимости, война с орками в Миртане идет совсем плохо.
	AI_Output(self,other,"DIA_NONE_1191_Assasin_PreHallo_01_10");	//(серьезно) Вот так. Но потом у меня возникла другая идея.
	AI_Output(self,other,"DIA_NONE_1191_Assasin_PreHallo_01_11");	//Я долго думал над всем тем, что произошло в моей жизни.
	AI_Output(self,other,"DIA_NONE_1191_Assasin_PreHallo_01_12");	//И в итоге я решил посвятить свою оставшуюся жизнь служению Инносу.
	AI_Output(self,other,"DIA_NONE_1191_Assasin_PreHallo_01_13");	//К тому же я слышал, что на острове есть монастырь магов Огня.
	AI_Output(self,other,"DIA_NONE_1191_Assasin_PreHallo_01_14");	//Поэтому я отправлюсь туда и попытаюсь стать их послушником.
	AI_Output(self,other,"DIA_NONE_1191_Assasin_PreHallo_01_15");	//А уж там, простит меня Иннос или нет, - не мне решать.
	AI_Output(other,self,"DIA_NONE_1191_Assasin_PreHallo_01_16");	//Это правильное решение.
	AI_Output(other,self,"DIA_NONE_1191_Assasin_PreHallo_01_17");	//Молись почаще, и он простит тебя.
	AI_Output(self,other,"DIA_NONE_1191_Assasin_PreHallo_01_18");	//Будем надеяться, что ты прав.
	GonsaGoKloster = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"City");


};

instance DIA_NONE_1191_Assasin_Simple(C_Info)
{
	npc = NONE_1191_Assasin;
	nr = 1;
	condition = DIA_NONE_1191_Assasin_Simple_Condition;
	information = DIA_NONE_1191_Assasin_Simple_Info;
	permanent = TRUE;
	description = "Как дела?";
};

func int DIA_NONE_1191_Assasin_Simple_Condition()
{
	if(GonsaGoKloster == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NONE_1191_Assasin_Simple_Info()
{
	AI_Output(other,self,"DIA_NONE_1191_Assasin_Simple_01_00");	//Как дела?
	AI_Output(self,other,"DIA_NONE_1191_Assasin_Simple_01_01");	//Все в порядке, приятель.

	if(GonsaGoKlosterDone == TRUE)
	{
		AI_Output(self,other,"DIA_NONE_1191_Assasin_Simple_01_02");	//Особенно здесь, в монастыре. Я, кажется, стал заново обретать веру в жизнь.
		AI_Output(other,self,"DIA_NONE_1191_Assasin_Simple_01_03");	//Рад это слышать.
	}
	else
	{
		AI_Output(self,other,"DIA_NONE_1191_Assasin_Simple_01_04");	//Только сначала немного передохну, а потом отправлюсь в монастырь.
		AI_Output(other,self,"DIA_NONE_1191_Assasin_Simple_01_05");	//Смотри не затягивай с этим.
	};
};

instance DIA_NONE_1191_Assasin_Kloster(C_Info)
{
	npc = NONE_1191_Assasin;
	nr = 1;
	condition = DIA_NONE_1191_Assasin_Kloster_Condition;
	information = DIA_NONE_1191_Assasin_Kloster_Info;
	permanent = FALSE;
	description = "Тебя приняли в монастырь?";
};

func int DIA_NONE_1191_Assasin_Kloster_Condition()
{
	if(GonsaGoKlosterDone == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NONE_1191_Assasin_Kloster_Info()
{
	AI_Output(other,self,"DIA_NONE_1191_Assasin_Kloster_01_00");	//Тебя приняли в монастырь?
	AI_Output(self,other,"DIA_NONE_1191_Assasin_Kloster_01_01");	//Да. Как видишь.
	AI_Output(self,other,"DIA_NONE_1191_Assasin_Kloster_01_02");	//Правда, для этого мне пришлось исповедаться Пирокару.
	AI_Output(self,other,"DIA_NONE_1191_Assasin_Kloster_01_03");	//Он сначала меня внимательно выслушал, а потом сказал, что каждый имеет шанс покаяться.
	AI_Output(self,other,"DIA_NONE_1191_Assasin_Kloster_01_04");	//И вот теперь я здесь. Ночью молюсь, ну а днем занимаюсь хозяйством.
	AI_Output(self,other,"DIA_NONE_1191_Assasin_Kloster_01_05");	//Кстати, мне выдали робу послушника монастыря.
	AI_Output(self,other,"DIA_NONE_1191_Assasin_Kloster_01_06");	//Так что мои доспехи ассасина мне теперь ни к чему. Как и мое оружие.
	AI_Output(self,other,"DIA_NONE_1191_Assasin_Kloster_01_07");	//Я начал новую жизнь, а значит, в ней не должно быть места прошлому.
	AI_Output(self,other,"DIA_NONE_1191_Assasin_Kloster_01_08");	//Поэтому, если хочешь, я отдам это все тебе.
	AI_Output(self,other,"DIA_NONE_1191_Assasin_Kloster_01_09");	//Наверняка ты сможешь найти им лучшее применение, чем когда-то находил я.
	CreateInvItems(self,ItAr_NOV_L,1);
	Info_ClearChoices(DIA_NONE_1191_Assasin_Kloster);
	Info_AddChoice(DIA_NONE_1191_Assasin_Kloster,"Хорошо! Я заберу их у тебя.",DIA_NONE_1191_Assasin_Kloster_Go);
};

func void DIA_NONE_1191_Assasin_Kloster_Go()
{
	AI_UnequipWeapons(self);
	Npc_RemoveInvItems(self,ITMW_2H_KATANA_GIFT,1);
	Npc_RemoveInvItems(self,ITRW_G3_SILENTDEATH_BOW_01_NPC,1);
	AI_Output(other,self,"DIA_NONE_1191_Assasin_Kloster_Go_01_01");	//Хорошо! Я заберу их у тебя.
	AI_EquipArmor(self,ItAr_NOV_L);
	Npc_RemoveInvItems(self,ITAR_GONSALES,1);
	B_GiveInvItemsManyThings(self,other);
	CreateInvItems(hero,ITAR_ASS,1);
	CreateInvItems(hero,ITMW_2H_KATANA,1);
	CreateInvItems(hero,ITRW_G3_SILENTDEATH_BOW_01,1);
	AI_Output(self,other,"DIA_NONE_1191_Assasin_Kloster_Go_01_02");	//Вот и отлично! Теперь я полностью освобожден от призраков прошлого.
};

instance DIA_NONE_1191_Assasin_HotReduceTeach(C_Info)
{
	npc = NONE_1191_Assasin;
	nr = 800;
	condition = DIA_NONE_1191_Assasin_HotReduceTeach_Condition;
	information = DIA_NONE_1191_Assasin_HotReduceTeach_Info;
	permanent = TRUE;
	description = "Научи меня переносить жару (Очки обучения: 10)";
};

func int DIA_NONE_1191_Assasin_HotReduceTeach_Condition()
{
	if((GonsaCanTeachMeHot == TRUE) && (HotReduceKnow == FALSE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1191_Assasin_HotReduceTeach_Info()
{
	var int kosten;

	AI_Output(other,self,"DIA_NONE_119_Assasin_HotReduceTeach_01_00");	//Научи меня переносить жару.

	kosten = 10;

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		AI_Output(self,other,"DIA_NONE_119_Assasin_HotReduceTeach_01_01");	//Извини, но для этого у тебя еще не хватает опыта.
		AI_StopProcessInfos(self);
	};
	if(hero.lp >= kosten)
	{
		AI_Output(self,other,"DIA_NONE_119_Assasin_HotReduceTeach_01_03");	//Не делай лишних движений.
		AI_Output(self,other,"DIA_NONE_119_Assasin_HotReduceTeach_01_04");	//Двигайся как можно меньше, экономь силы.
		AI_Output(self,other,"DIA_NONE_119_Assasin_HotReduceTeach_01_05");	//Жара может быть более изнуряющей, чем бой с целой стаей монстров.
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + kosten;
		hero.protection[PROT_FIRE] += 5;
		REALPROTFIRE += 5;
		AI_Print(PRINT_LEARNPROTHOT);
		HotReduceKnow = TRUE;
		Snd_Play("LevelUP");
	};
};