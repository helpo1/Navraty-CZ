
instance DIA_Orc_5500_WoundedOrc_EXIT(C_Info)
{
	npc = Orc_5500_WoundedOrc;
	condition = DIA_Orc_5500_WoundedOrc_exit_condition;
	information = DIA_Orc_5500_WoundedOrc_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};


func int DIA_Orc_5500_WoundedOrc_exit_condition()
{
	return TRUE;
};

func void DIA_Orc_5500_WoundedOrc_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Orc_5500_WoundedOrc_Hello(C_Info)
{
	npc = Orc_5500_WoundedOrc;
	condition = DIA_Orc_5500_WoundedOrc_Hello_condition;
	information = DIA_Orc_5500_WoundedOrc_Hello_info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_Orc_5500_WoundedOrc_Hello_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Kapitel <= 1))
	{
		return TRUE;
	};
};

func void DIA_Orc_5500_WoundedOrc_Hello_info()
{
	B_GivePlayerXP(100);
	AI_Output(self,other,"DIA_Orc_5500_WoundedOrc_Hello_Info_18_01");	//Аргх!!! (тяжело дыша) Еще один человек прийти, чтобы убить меня.
	AI_Output(other,self,"DIA_Orc_5500_WoundedOrc_Hello_Info_18_02");	//Да, обычно я так и поступаю! Хотя нечасто встретишь орка, говорящего на человеческом языке.
	AI_Output(other,self,"DIA_Orc_5500_WoundedOrc_Hello_Info_18_03");	//Я выслушаю тебя, но предупреждаю: одно неверное движение - и я снесу тебе голову, орк!
	AI_Output(other,self,"DIA_Orc_5500_WoundedOrc_Hello_Info_18_04");	//А теперь отвечай - кто ты и что здесь делаешь?
	AI_Output(self,other,"DIA_Orc_5500_WoundedOrc_Hello_Info_18_05");	//Меня звать Ур-Каррас, но я думать, тебе это мало что скажет обо мне.
	AI_Output(other,self,"DIA_Orc_5500_WoundedOrc_Hello_Info_18_06");	//Да, я не слышал раньше этого имени. Но, судя по твоим доспехам, ты не простой орк.
	AI_Output(other,self,"DIA_Orc_5500_WoundedOrc_Hello_Info_18_07");	//Скорее всего, ты один из военачальников орков. Где же тогда твой отряд?
	AI_Output(self,other,"DIA_Orc_5500_WoundedOrc_Hello_Info_18_08");	//Все быть убиты, все быть мертвые! Только я остаться один жить, но быть тяжело ранен и не мочь идти обратно в долину.
	AI_Output(other,self,"DIA_Orc_5500_WoundedOrc_Hello_Info_18_09");	//Их перебили паладины?
	AI_Output(self,other,"DIA_Orc_5500_WoundedOrc_Hello_Info_18_10");	//Нет, мы не сражаться с паладинами...(хрипя) Мой отряд быть очень маленький, чтобы напасть на их.
	AI_Output(other,self,"DIA_Orc_5500_WoundedOrc_Hello_Info_18_11");	//Если не они, то кто же? И что в таком случае вы делали в Хоринисе?
	AI_Output(self,other,"DIA_Orc_5500_WoundedOrc_Hello_Info_18_12");	//Я не мочь сказать это человек.
	AI_Output(other,self,"DIA_Orc_5500_WoundedOrc_Hello_Info_18_13");	//Если ты мне этого не скажешь, то я прикончу тебя прямо сейчас!
	AI_Output(self,other,"DIA_Orc_5500_WoundedOrc_Hello_Info_18_14");	//Если человек хочет убить его, то пусть не тянуть время. (превозмогая боль) Ур-Каррас не бояться смерти.
	Info_ClearChoices(DIA_Orc_5500_WoundedOrc_Hello);
	Info_AddChoice(DIA_Orc_5500_WoundedOrc_Hello,"Твои слова достойны уважения, Ур-Каррас.",DIA_Orc_5500_WoundedOrc_Hello_Mercy);
	Info_AddChoice(DIA_Orc_5500_WoundedOrc_Hello,"Что же, ты сам выбрал свою судьбу, орк!",DIA_Orc_5500_WoundedOrc_Hello_Kill);
};


func void DIA_Orc_5500_WoundedOrc_Hello_Mercy()
{
	AI_Output(other,self,"DIA_Orc_5500_WoundedOrc_Hello_Mercy_18_01");	//Твои слова достойны уважения, Ур-Каррас. Пожалуй, я оставлю тебе жизнь.
	AI_Output(other,self,"DIA_Orc_5500_WoundedOrc_Hello_Mercy_18_02");	//Но ты должен поклясться мне, что немедленно покинешь Хоринис! При следующей нашей встрече я без колебаний перережу тебе глотку.
	AI_Output(self,other,"DIA_Orc_5500_WoundedOrc_Hello_Mercy_18_03");	//Человек может не стараться. Как я уже говорить, Ур-Каррас тяжело ранен и не может вернуться к братам.
	AI_Output(self,other,"DIA_Orc_5500_WoundedOrc_Hello_Mercy_18_04");	//Можешь убить меня сейчас...(тяжело дыша) Время ничего не изменить.
	Info_ClearChoices(DIA_Orc_5500_WoundedOrc_Hello);
	Info_AddChoice(DIA_Orc_5500_WoundedOrc_Hello,"Как уже было сказано, я не стану этого делать.",DIA_Orc_5500_WoundedOrc_Hello_Mercy_Two);
	Info_AddChoice(DIA_Orc_5500_WoundedOrc_Hello,"Ты не оставляешь мне выбора, орк.",DIA_Orc_5500_WoundedOrc_Hello_Kill_Two);
};

func void DIA_Orc_5500_WoundedOrc_Hello_Kill()
{
	AI_Output(other,self,"DIA_Orc_5500_WoundedOrc_Hello_Kill_18_01");	//Что же, ты сам выбрал свою судьбу, орк!
	AI_Output(other,self,"DIA_Orc_5500_WoundedOrc_Hello_Kill_18_02");	//Сейчас я прикончу тебя, и еще на одну гнусную тварь станет меньше.
	AI_Output(self,other,"DIA_Orc_5500_WoundedOrc_Hello_Kill_18_03");	//Аргххх!!!
	AI_StopProcessInfos(self);
	self.guild = GIL_ORC;
};

func void DIA_Orc_5500_WoundedOrc_Hello_Kill_Two()
{
	AI_Output(other,self,"DIA_Orc_5500_WoundedOrc_Hello_Kill_Two_18_01");	//Ты не оставляешь мне выбора, орк. Приготовься умереть.
	AI_Output(self,other,"DIA_Orc_5500_WoundedOrc_Hello_Kill_Two_18_02");	//Аргххх!!!
	AI_StopProcessInfos(self);
	self.guild = GIL_ORC;
};

func void DIA_Orc_5500_WoundedOrc_Hello_Mercy_Two()
{
	AI_Output(other,self,"DIA_Orc_5500_WoundedOrc_Hello_Mercy_Two_18_01");	//Я не стану этого делать.
	AI_Output(other,self,"DIA_Orc_5500_WoundedOrc_Hello_Mercy_Two_18_02");	//Но позволить тебе остаться в Хоринисе я тоже не могу. И что же мне с тобой делать?
	AI_Output(self,other,"DIA_Orc_5500_WoundedOrc_Hello_Mercy_Two_18_03");	//Ур-Каррас не мочь знать этого.
	AI_Output(other,self,"DIA_Orc_5500_WoundedOrc_Hello_Mercy_Two_18_04");	//Хммм. Дай мне хотя бы взглянуть на твою рану.
	AI_Output(self,other,"DIA_Orc_5500_WoundedOrc_Hello_Mercy_Two_18_05");	//Ррррр...(хрипя) Хорошо, смотри, человек.
	AI_Output(other,self,"DIA_Orc_5500_WoundedOrc_Hello_Mercy_Two_18_06");	//Да, рана серьезная. Похоже, тебя покусала какая-то ужасная тварь.
	AI_Output(other,self,"DIA_Orc_5500_WoundedOrc_Hello_Mercy_Two_18_07");	//Есть ли какой-нибудь способ помочь тебе излечиться?
	AI_Output(self,other,"DIA_Orc_5500_WoundedOrc_Hello_Mercy_Two_18_08");	//Ур-Каррас думать, что только его браты - говорящие с духами - смогли бы помочь ему. Но они быть далеко в долине...
	AI_Output(other,self,"DIA_Orc_5500_WoundedOrc_Hello_Mercy_Two_18_09");	//Что еще за говорящие с духами?
	AI_Output(self,other,"DIA_Orc_5500_WoundedOrc_Hello_Mercy_Two_18_10");	//Быть великими магами орков. Люди обычно называть их шаманами.
	AI_Output(other,self,"DIA_Orc_5500_WoundedOrc_Hello_Mercy_Two_18_11");	//Но к вашим шаманам просто так не подойдешь.
	AI_Output(other,self,"DIA_Orc_5500_WoundedOrc_Hello_Mercy_Two_18_12");	//Скорее они превратят меня в пылающую головешку, чем выслушают меня.
	AI_Output(self,other,"DIA_Orc_5500_WoundedOrc_Hello_Mercy_Two_18_13");	//Тогда человеку остается бросить тут умирать Ур-Карраса...(хрипя) А самому уходить.
	AI_Output(other,self,"DIA_Orc_5500_WoundedOrc_Hello_Mercy_Two_18_14");	//Нет. Если на то пошло, я тебя не брошу.
	AI_Output(other,self,"DIA_Orc_5500_WoundedOrc_Hello_Mercy_Two_18_15");	//Похоже, у меня входит в привычку помогать раненым оркам.
	AI_Output(self,other,"DIA_Orc_5500_WoundedOrc_Hello_Mercy_Two_18_17");	//Аргххх...(удивленно) Ур-Каррас быть удивленным, что человек пытаться помочь ему.
	AI_Output(self,other,"DIA_Orc_5500_WoundedOrc_Hello_Mercy_Two_18_18");	//Обычно раньше все люди хотеть только убить его!
	AI_Output(other,self,"DIA_Orc_5500_WoundedOrc_Hello_Mercy_Two_18_19");	//Ладно, сиди тут и постарайся не умереть, пока я не вернусь.
	AI_Output(other,self,"DIA_Orc_5500_WoundedOrc_Hello_Mercy_Two_18_20");	//Меня не очень радует перспектива впустую потратить на тебя свое время.
	AI_Output(self,other,"DIA_Orc_5500_WoundedOrc_Hello_Mercy_Two_18_21");	//Ур-Каррас иметь немного лечебных орочих зелий, чтобы пока не быть мертвым. Но их хватать ненадолго.
	AI_Output(other,self,"DIA_Orc_5500_WoundedOrc_Hello_Mercy_Two_18_22");	//Тогда не будем терять времени на разговоры. Я скоро вернусь.
	MIS_Orcwayhero = LOG_Running;
	Log_CreateTopic(TOPIC_Orcwayhero,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Orcwayhero,LOG_Running);
	B_LogEntry(TOPIC_Orcwayhero,"Недалеко от Хориниса я наткнулся на раненого орка по имени Ур-Каррас. Он возглавлял небольшой отряд, прибывший из Долины для выполнения важного поручения, о котором отказался говорить даже под угрозой смерти. Из отряда выжил он один, но серьезные раны не дают ему вернуться обратно. Я решил помочь орку, знающему язык людей. Целительная магия шаманов смогла бы помочь, но где в Хоринисе найти шамана орков, согласившегося бы со мной разговаривать? Мне придется самому что-нибудь придумать, чтобы помочь Ур-Каррасу. Времени мало, нужно действовать быстро.");
	AI_StopProcessInfos(self);
	self.name[0] = "Ур-Каррас";
};


instance DIA_Orc_5500_WoundedOrc_HaveCure(C_Info)
{
	npc = Orc_5500_WoundedOrc;
	condition = DIA_Orc_5500_WoundedOrc_HaveCure_condition;
	information = DIA_Orc_5500_WoundedOrc_HaveCure_info;
	important = FALSE;
	permanent = FALSE;
	description = "Я нашел средство, чтобы поднять тебя на ноги.";
};


func int DIA_Orc_5500_WoundedOrc_HaveCure_condition()
{
	if((MIS_Orcwayhero == LOG_Running) && (Npc_HasItems(other,ItSc_OrcHeal) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Orc_5500_WoundedOrc_HaveCure_info()
{
	B_GivePlayerXP(250);	
	Npc_RemoveInvItems(other,ItSc_OrcHeal,1);
	AI_Output(other,self,"DIA_Orc_5500_WoundedOrc_HaveCure_18_01");	//Я нашел средство, чтобы поднять тебя на ноги.
	AI_Output(self,other,"DIA_Orc_5500_WoundedOrc_HaveCure_18_02");	//Надеюсь, что человек быть прав...(хрипя и харкая кровью) Ур-Каррас чувствует, что скоро умирать...
	AI_Output(other,self,"DIA_Orc_5500_WoundedOrc_HaveCure_18_03");	//Не так быстро, орк. Думаю, это тебе поможет.
	B_HeroUseFakeScroll();
	AI_PlayAni(other,"T_PRACTICEMAGIC5");
	AI_Output(self,other,"DIA_Orc_5500_WoundedOrc_HaveCure_18_04");	//Аргхх... Что человек делать с Ур-Каррасом?!
	AI_Output(other,self,"DIA_Orc_5500_WoundedOrc_HaveCure_18_05");	//Спокойно! Это всего лишь целебная магия.
	AI_Output(other,self,"DIA_Orc_5500_WoundedOrc_HaveCure_18_06");	//И, кажется, твои раны начали потихоньку затягиваться.
	AI_Output(self,other,"DIA_Orc_5500_WoundedOrc_HaveCure_18_07");	//Не верить своим глазам! Человек смочь вылечить Ур-Карраса.
	AI_Output(self,other,"DIA_Orc_5500_WoundedOrc_HaveCure_18_08");	//Ур-Каррас чувствовать, как к нему начала возвращаться его сила. Он думать, что его смерть отступить перед магией человека.
	AI_Output(other,self,"DIA_Orc_5500_WoundedOrc_HaveCure_18_09");	//Ну-ка, подожди еще немного...
	B_HeroUseFakeScroll();
	AI_PlayAni(other,"T_PRACTICEMAGIC5");
	AI_Output(other,self,"DIA_Orc_5500_WoundedOrc_HaveCure_18_10");	//Ну как? Полагаю, что теперь ты должен чувствовать себя абсолютно здоровым.
	AI_Output(self,other,"DIA_Orc_5500_WoundedOrc_HaveCure_18_11");	//Ур-Каррас чувствовать себя совсем здоровый! (восхищенно) Человек, наверно, быть великий шаман, что смог излечить Ур-Карраса!
	AI_Output(other,self,"DIA_Orc_5500_WoundedOrc_HaveCure_18_12");	//Если хочешь, можешь считать именно так.
	AI_Output(self,other,"DIA_Orc_5500_WoundedOrc_HaveCure_18_13");	//Ур-Каррас благодарить человек...(с уважением) Он никогда не говорить этого людям, но он теперь очень уважать человек.
	AI_Output(other,self,"DIA_Orc_5500_WoundedOrc_HaveCure_18_14");	//Эй, оставь свои комплименты! Теперь, когда ты снова встал на ноги, ты можешь покинуть Хоринис.
	AI_Output(other,self,"DIA_Orc_5500_WoundedOrc_HaveCure_18_15");	//И будет лучше, если ты сделаешь это как можно скорей.
	AI_Output(self,other,"DIA_Orc_5500_WoundedOrc_HaveCure_18_16");	//Человек помог Ур-Каррасу, и он может теперь уходить к своим братам в долину.
	AI_Output(self,other,"DIA_Orc_5500_WoundedOrc_HaveCure_18_17");	//Ур-Каррас только дожидаться темноты, чтобы идти к ним.
	AI_Output(other,self,"DIA_Orc_5500_WoundedOrc_HaveCure_18_18");	//Хорошо, я тебе верю, орк. И надеюсь, что нам больше не доведется встретиться вновь.
	AI_Output(other,self,"DIA_Orc_5500_WoundedOrc_HaveCure_18_19");	//В иной раз все может сложиться не так гладко.
	AI_Output(self,other,"DIA_Orc_5500_WoundedOrc_HaveCure_18_20");	//Этого Ур-Каррас не может обещать человек. Но он не забудет его помощь, теперь человек для него стать братом!
	AI_PlayAni(self,"T_GREETGRD");
	AI_Output(self,other,"DIA_Orc_5500_WoundedOrc_HaveCure_18_21");	//Ур-Каррас дать клятву человек в этом. А теперь Ур-Каррас говорить прощай великий шаман!
	AI_Output(other,self,"DIA_Orc_5500_WoundedOrc_HaveCure_18_22");	//Само собой... кмм... братишка.
	MIS_Orcwayhero = LOG_SUCCESS;
	Log_SetTopicStatus(Topic_Orcwayhero,LOG_SUCCESS);
	B_LogEntry(Topic_Orcwayhero,"Я помог Ур-Каррасу и залечил его раны. Теперь он может вернуться обратно в Долину. В свою очередь Ур-Каррас обещал не забыть о том, что я помог ему избежать верной гибели, и с этого момента стал называть меня своим... братом. Странные, все-таки, создания эти орки.");
	Info_ClearChoices(DIA_Orc_5500_WoundedOrc_HaveCure);
	Info_AddChoice(DIA_Orc_5500_WoundedOrc_HaveCure,Dialog_Ende,DIA_Orc_5500_WoundedOrc_HaveCure_Quit);
};

func void DIA_Orc_5500_WoundedOrc_HaveCure_Quit()
{
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"TOT");
	self.attribute[ATR_STRENGTH] = 300;
	self.attribute[ATR_DEXTERITY] = 300;
	self.attribute[ATR_HITPOINTS_MAX] = 3000;
	self.attribute[ATR_HITPOINTS] = 3000;
	self.attribute[ATR_MANA_MAX] = 10;
	self.attribute[ATR_MANA] = 10;
	self.protection[PROT_BLUNT] = 300;
	self.protection[PROT_EDGE] = 300;
	self.protection[PROT_POINT] = 300;
	self.protection[PROT_FIRE] = 100;
	self.protection[PROT_FLY] = 100;
	self.protection[PROT_MAGIC] = 100;
	self.HitChance[NPC_TALENT_1H] = 100;
	self.HitChance[NPC_TALENT_2H] = 100;
	self.HitChance[NPC_TALENT_BOW] = 100;
	self.HitChance[NPC_TALENT_CROSSBOW] = 100;
	CreateInvItems(self,ItMw_2H_OrcSword_02,1);
	AI_EquipBestMeleeWeapon(self);
};

instance DIA_Orc_5500_WoundedOrc_Buy(C_Info)
{
	npc = Orc_5500_WoundedOrc;
	condition = DIA_Orc_5500_WoundedOrc_Buy_condition;
	information = DIA_Orc_5500_WoundedOrc_Buy_info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_Orc_5500_WoundedOrc_Buy_condition()
{
	if((Npc_IsInState(self,ZS_Talk)) && (MIS_Orcwayhero == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Orc_5500_WoundedOrc_Buy_info()
{
	AI_Output(self,other,"DIA_Orc_5500_WoundedOrc_Buy_Info_18_01");	//Ур-Каррас идти к своим братьям, как и обещать брат человек.
	AI_Output(self,other,"DIA_Orc_5500_WoundedOrc_Buy_Info_18_02");	//Он может не волноваться!
	AI_StopProcessInfos(self);
};