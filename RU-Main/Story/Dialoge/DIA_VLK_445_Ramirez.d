
instance DIA_Ramirez_EXIT(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 999;
	condition = DIA_Ramirez_EXIT_Condition;
	information = DIA_Ramirez_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Ramirez_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Ramirez_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Ramirez_PICKPOCKET(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 900;
	condition = DIA_Ramirez_PICKPOCKET_Condition;
	information = DIA_Ramirez_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};

func int DIA_Ramirez_PICKPOCKET_Condition()
{
	return C_Beklauen(90,300);
};

func void DIA_Ramirez_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Ramirez_PICKPOCKET);
	Info_AddChoice(DIA_Ramirez_PICKPOCKET,Dialog_Back,DIA_Ramirez_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Ramirez_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Ramirez_PICKPOCKET_DoIt);
};

func void DIA_Ramirez_PICKPOCKET_DoIt()
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

func void DIA_Ramirez_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Ramirez_PICKPOCKET);
};

instance DIA_Ramirez_Hallo(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 2;
	condition = DIA_Ramirez_Hallo_Condition;
	information = DIA_Ramirez_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Ramirez_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Ramirez_Hallo_Info()
{
	if(IS_LOVCACH == FALSE)
	{
		AI_Output(self,other,"DIA_Ramirez_Hallo_14_00");	//Ты что, заблудился? По-моему, это не самое подходящее место для тебя.
		AI_Output(self,other,"DIA_Ramirez_Hallo_14_01");	//Если здесь с тобой что-нибудь случится, тебе никто не придет на помощь. Так что будь осторожен.
	}
	else
	{
		AI_Output(self,other,"DIA_Ramirez_Hallo_14_02");	//Итак, ты с нами! Что ж, тогда я желаю тебе успеха - но будь осторожен.
		AI_Output(self,other,"DIA_Ramirez_Hallo_14_03");	//Ох, и еще одно - меня не интересует кто ты там наверху, и кем ты работаешь.
		AI_Output(self,other,"DIA_Ramirez_Hallo_14_04");	//Но здесь, внизу, ты один из нас - вор! Не больше и не меньше.
	};
};

var int RamirezPissOff;

instance DIA_Ramirez_First(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 50;
	condition = DIA_Ramirez_First_condition;
	information = DIA_Ramirez_First_info;
	permanent = FALSE;
	description = "Меня прислала Кассия.";
};

func int DIA_Ramirez_First_condition()
{
	if(IS_LOVCACH == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Ramirez_First_info()
{
	AI_Output(other,self,"DIA_Ramirez_First_01_00");	//Меня прислала Кассия. Она сказала, что ты сможешь меня кое-чему обучить.

	if(AttilaIsDead == TRUE)
	{
		AI_Output(self,other,"DIA_Ramirez_First_01_20");	//Она так сказала? Хммм... Для начала ей стоило бы поинтересоваться моим мнением.
		AI_Output(other,self,"DIA_Ramirez_First_01_21");	//А что, с этим есть какие-то проблемы?
		AI_Output(self,other,"DIA_Ramirez_First_01_22");	//Проблема лишь в том, что ты прикончил Аттилу, а он до недавнего времени был моим лучшим другом.
		AI_Output(self,other,"DIA_Ramirez_First_01_23");	//Так что придется тебе поискать учителей где-нибудь в другом месте. А я тебя ничему учить не стану.
		AI_Output(other,self,"DIA_Ramirez_First_01_24");	//Постой...
		AI_Output(self,other,"DIA_Ramirez_First_01_25");	//Я уже все сказал. Разговор окончен!
		RamirezPissOff = TRUE;
		B_LogEntry(Topic_Bonus,"Рамирез отказался меня обучать чему-либо из-за того, что я убил его друга Аттилу. Возможно, есть способ его переубедить?");
		AI_StopProcessInfos(self);
	}
	else
	{
		B_GivePlayerXP(100);
		AI_Output(self,other,"DIA_Ramirez_First_01_02");	//Ну, раз она так сказала... Для начала добро пожаловать в нашу гильдию, мой друг!
		AI_Output(self,other,"DIA_Ramirez_First_01_03");	//Что же касается обучения, то я действительно смогу обучить тебя тому, чему не научат больше нигде в Миртане.
		AI_Output(self,other,"DIA_Ramirez_First_01_04");	//Мало кто владеет теми секретами создания шпаг и рапир, которыми обладает наша гильдия. 
		AI_Output(other,self,"DIA_Ramirez_First_01_05");	//Чем же так хороши шпаги и рапиры?
		AI_Output(self,other,"DIA_Ramirez_First_01_06");	//Уверен, ты знаешь, что обычное оружие очень громоздкое и порой слишком тяжелое. Пока взмахнешь им, пока нанесешь удар...
		AI_Output(self,other,"DIA_Ramirez_First_01_07");	//Пока ты будешь все это проделывать, хороший мастер шпаги с десяток раз нанесет тебе смертельный укол!
		AI_Output(self,other,"DIA_Ramirez_First_01_08");	//Оно и понятно, ведь шпага - это выбор воров, убийц и всех тех, кто хочет быть всегда на шаг впереди своего врага.
		AI_Output(other,self,"DIA_Ramirez_First_01_09");	//И ты знаешь, как сделать подобное оружие?
		AI_Output(self,other,"DIA_Ramirez_First_01_10");	//Существует много различных методов. Главное в этом деле - знать, какие компоненты следует смешивать со сталью.
		AI_Output(self,other,"DIA_Ramirez_First_01_11");	//Даже обычная шпага, заточенная с использованием серы становится значительно опаснее, чем раньше!
		AI_Output(other,self,"DIA_Ramirez_First_01_12");	//Как интересно!
		AI_Output(self,other,"DIA_Ramirez_First_01_13");	//Хм, еще бы. Я буду учить тебя постепенно, рассказывая все новые и новые рецепты выточки шпаг, а также и рапир.
		AI_Output(self,other,"DIA_Ramirez_First_01_14");	//Но, как ты понимаешь, наша гильдия не занимается благотворительностью.
		AI_Output(self,other,"DIA_Ramirez_First_01_15");	//Ты будешь должен доказать, что мы передаем свои сведения полезному человеку.
		AI_Output(self,other,"DIA_Ramirez_First_01_16");	//Выполняй задания Кассии, помогай членам гильдии - и, возможно, когда-нибудь ты вооружишься так, как никогда и не мечтал!
		AI_Output(self,other,"DIA_Ramirez_First_01_17");	//Да, и чуть не забыл - прежде чем начать обучение у меня, сходи к какому-нибудь кузнецу и научись основам ковки.
		AI_Output(self,other,"DIA_Ramirez_First_01_18");	//Эти знания пригодятся тебе в дальнейшем.
		AI_Output(other,self,"DIA_Ramirez_First_01_19");	//Я все понял.
		B_LogEntry(Topic_Bonus,"Рамирез, мастер гильдии воров, будет учить меня изготавливать шпаги и рапиры, а также снабдит меня разными нужными вещами.");
		RamirezTechMe = TRUE;
	};
};

instance DIA_Ramirez_RamirezPissOff(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 50;
	condition = DIA_Ramirez_RamirezPissOff_condition;
	information = DIA_Ramirez_RamirezPissOff_info;
	permanent = TRUE;
	description = "Может, как-нибудь уладим наши разногласия?";
};

func int DIA_Ramirez_RamirezPissOff_condition()
{
	if((RamirezPissOff == TRUE) && (RamirezTechMe == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Ramirez_RamirezPissOff_info()
{
	AI_Output(other,self,"DIA_Ramirez_RamirezPissOff_01_00");	//Может, как-нибудь уладим наши разногласия?

	if(RamirezMagicDone == FALSE)
	{
		AI_Output(self,other,"DIA_Ramirez_RamirezPissOff_01_01");	//Ха... И как же ты собрался их улаживать?
		Info_ClearChoices(DIA_Ramirez_RamirezPissOff);
		Info_AddChoice(DIA_Ramirez_RamirezPissOff,"Пока не знаю.",DIA_Ramirez_RamirezPissOff_No);

		if(RhetorikSkillValue[1] >= 25)
		{
			Info_AddChoice(DIA_Ramirez_RamirezPissOff,"Давай взглянем на ситуацию с другой стороны.",DIA_Ramirez_RamirezPissOff_Deal);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Ramirez_RamirezPissOff_01_02");	//Хмм... А разве нам есть что улаживать?
		AI_Output(other,self,"DIA_Ramirez_RamirezPissOff_01_03");	//Кажется, уже нет.
		AI_Output(self,other,"DIA_Ramirez_RamirezPissOff_01_04");	//Тогда что тебе от меня нужно?
		AI_Output(other,self,"DIA_Ramirez_First_01_00");	//Меня прислала Кассия. Она сказала, что ты сможешь меня кое-чему обучить.
		AI_Output(self,other,"DIA_Ramirez_First_01_03");	//Что же касается обучения, то я действительно смогу обучить тебя тому, чему не научат больше нигде в Миртане.
		AI_Output(self,other,"DIA_Ramirez_First_01_04");	//Мало кто владеет теми секретами создания шпаг и рапир, которыми обладает наша гильдия. 
		AI_Output(other,self,"DIA_Ramirez_First_01_05");	//Чем же так хороши шпаги и рапиры?
		AI_Output(self,other,"DIA_Ramirez_First_01_06");	//Уверен, ты знаешь, что обычное оружие очень громоздкое и порой слишком тяжелое. Пока взмахнешь им, пока нанесешь удар...
		AI_Output(self,other,"DIA_Ramirez_First_01_07");	//Пока ты будешь все это проделывать, хороший мастер шпаги с десяток раз нанесет тебе смертельный укол!
		AI_Output(self,other,"DIA_Ramirez_First_01_08");	//Оно и понятно, ведь шпага - это выбор воров, убийц и всех тех, кто хочет быть всегда на шаг впереди своего врага.
		AI_Output(other,self,"DIA_Ramirez_First_01_09");	//И ты знаешь, как сделать подобное оружие?
		AI_Output(self,other,"DIA_Ramirez_First_01_10");	//Существует много различных методов. Главное в этом деле - знать, какие компоненты следует смешивать со сталью.
		AI_Output(self,other,"DIA_Ramirez_First_01_11");	//Даже обычная шпага, заточенная с использованием серы становится значительно опаснее, чем раньше!
		AI_Output(other,self,"DIA_Ramirez_First_01_12");	//Как интересно!
		AI_Output(self,other,"DIA_Ramirez_First_01_13");	//Хм, еще бы! Я буду учить тебя постепенно, рассказывая все новые и новые рецепты выточки шпаг, а также и рапир.
		AI_Output(self,other,"DIA_Ramirez_First_01_14");	//Но как ты понимаешь, наша гильдия не занимается благотворительностью.
		AI_Output(self,other,"DIA_Ramirez_First_01_15");	//Ты будешь должен доказать, что мы передаем свои сведения полезному человеку.
		AI_Output(self,other,"DIA_Ramirez_First_01_16");	//Выполняй задания Кассии, помогай членам гильдии и, возможно, когда-нибудь ты вооружишься так, как никогда и не мечтал!
		AI_Output(self,other,"DIA_Ramirez_First_01_17");	//Да, и чуть не забыл - прежде чем начать обучение у меня, сходи к какому-нибудь кузнецу и научись основам ковки.
		AI_Output(self,other,"DIA_Ramirez_First_01_18");	//Эти знания пригодятся тебе в дальнейшем.
		AI_Output(other,self,"DIA_Ramirez_First_01_19");	//Я все понял.
		B_LogEntry(Topic_Bonus,"Рамирез, мастер гильдии воров будет учить меня изготавливать шпаги и рапиры, а также снабдит меня разными нужными вещами.");
		RamirezTechMe = TRUE;
		Info_ClearChoices(DIA_Ramirez_RamirezPissOff);
	};
};

func void DIA_Ramirez_RamirezPissOff_No()
{
	AI_Output(other,self,"DIA_Ramirez_RamirezPissOff_No_01_00");	//Пока не знаю.
	AI_Output(self,other,"DIA_Ramirez_RamirezPissOff_No_01_01");	//Тогда зачем ты попусту тратишь мое время?!
	AI_StopProcessInfos(self);
};

func void DIA_Ramirez_RamirezPissOff_Deal()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Ramirez_RamirezPissOff_Deal_01_00");	//Давай взглянем на ситуацию с другой стороны.
	AI_Output(other,self,"DIA_Ramirez_RamirezPissOff_Deal_01_01");	//Аттила пытался меня убить! Он просто не оставил мне выбора.
	AI_Output(self,other,"DIA_Ramirez_RamirezPissOff_Deal_01_02");	//Но ты мог хотя бы сохранить ему жизнь!
	AI_Output(other,self,"DIA_Ramirez_RamirezPissOff_Deal_01_03");	//Иннос свидетель, я не хотел его убивать. Так уж случилось, что один из моих ударов пришелся точно в область сердца.
	AI_Output(other,self,"DIA_Ramirez_RamirezPissOff_Deal_01_04");	//Уверен, он даже ничего не почувствовал. Просто упал замертво на землю и все на этом закончилось.
	AI_Output(self,other,"DIA_Ramirez_RamirezPissOff_Deal_01_05");	//Ну хоть так... по крайней мере ему не пришлось долго мучиться.
	AI_Output(self,other,"DIA_Ramirez_RamirezPissOff_Deal_01_06");	//Ах, ладно. Белиар с тобой! В конце концов, те поручения, которые давала ему Кассия, все равно рано или поздно свели бы его в могилу.
	AI_Output(self,other,"DIA_Ramirez_RamirezPissOff_Deal_01_07");	//А посему считай, что я больше не в обиде на тебя за смерть Аттилы.
	AI_Output(other,self,"DIA_Ramirez_RamirezPissOff_Deal_01_08");	//Вот и отлично.
	RamirezTechMe = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_Ramirez_Beute(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 3;
	condition = DIA_Ramirez_Beute_Condition;
	information = DIA_Ramirez_Beute_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Ramirez_Beute_Condition()
{
	if((Mob_HasItems("THIEF_CHEST_01",ItMi_Gold) < 50) || (Mob_HasItems("THIEF_CHEST_02",ItMi_Gold) < 100) || (Mob_HasItems("THIEF_CHEST_02",ItMi_SilverCup) == FALSE) || (Mob_HasItems("THIEF_CHEST_03",ItMi_Gold) < 75))
	{
		return TRUE;
	};
};

func void DIA_Ramirez_Beute_Info()
{
	AI_Output(self,other,"DIA_Ramirez_Beute_14_00");	//Послушай, ты что, пытаешься так пошутить? Ты набиваешь карманы нашим золотом... ты что, пытаешься красть у нас?
	AI_Output(other,self,"DIA_Ramirez_Beute_15_01");	//Не стоит расстраиваться так из-за пары монет.
	AI_Output(other,self,"DIA_Ramirez_Beute_15_02");	//Я хочу сказать, эта мелочь, что есть здесь - это ВСЕ, что вам удалось награбить? Это все, что гильдия воров Хориниса может предложить?
	AI_Output(self,other,"DIA_Ramirez_Beute_14_03");	//Кто сказал, что наши сокровища хранятся здесь?
	AI_Output(other,self,"DIA_Ramirez_Beute_15_04");	//Да, я тоже не могу в это поверить. А где вы прячете ваши сокровища?
	AI_Output(self,other,"DIA_Ramirez_Beute_14_05");	//В очень надежном месте.
	AI_Output(other,self,"DIA_Ramirez_Beute_15_06");	//Понимаю.
	AI_Output(self,other,"DIA_Ramirez_Beute_14_07");	//Хорошо, ты можешь оставить себе это золото. Но я буду присматривать за тобой. Так что не пытайся повторить этот трюк.
};

instance DIA_Ramirez_Bezahlen(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 9;
	condition = DIA_Ramirez_Bezahlen_Condition;
	information = DIA_Ramirez_Bezahlen_Info;
	permanent = FALSE;
	description = "Ты можешь научить меня чему-нибудь еще?";
};

func int DIA_Ramirez_Bezahlen_Condition()
{
	if((IS_LOVCACH == TRUE) && (RamirezTechMe == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Ramirez_Bezahlen_Info()
{
	AI_Output(other,self,"DIA_Ramirez_Bezahlen_14_99");	//Ты можешь научить меня чему-нибудь еще?

	if(Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK) == TRUE)
	{
		AI_Output(self,other,"DIA_Ramirez_Bezahlen_14_01");	//Я больше ничему не могу научить тебя - ты знаешь, как взламывать замки.

		if(other.attribute[ATR_DEXTERITY] < T_MAX)
		{
			AI_Output(self,other,"DIA_Ramirez_Add_14_00");	//Теперь тебе остается только повышать свою ловкость...
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Ramirez_Bezahlen_14_02");	//Я могу показать тебе, как пользоваться отмычками.
		Ramirez_TeachPlayer = TRUE;
	};
};

instance DIA_Ramirez_Teach(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 99;
	condition = DIA_Ramirez_Teach_Condition;
	information = DIA_Ramirez_Teach_Info;
	permanent = TRUE;
	description = "Научи меня взламывать замки. (Очки обучения: 10)";
};

func int DIA_Ramirez_Teach_Condition()
{
	if((IS_LOVCACH == TRUE) && (Ramirez_TeachPlayer == TRUE) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Ramirez_Teach_Info()
{
	AI_Output(other,self,"DIA_Ramirez_Teach_15_00");	//Покажи мне, как взламывать замки.

	if(Ramirez_Zweimal == FALSE)
	{
		AI_Output(self,other,"DIA_Ramirez_Teach_14_06");	//Вскрытие замков - это высшее искусство.
		AI_Output(self,other,"DIA_Ramirez_Teach_14_01");	//Для этого нужны чувствительные пальчики и интуиция. И пара хороших отмычек!
		AI_Output(self,other,"DIA_Ramirez_Teach_14_02");	//Некоторые сундуки, впрочем, закрыты на особые замки, которые можно открыть только правильным ключом.
		Ramirez_Zweimal = TRUE;
	};
	if(b_teachthieftalentfree(self,other,NPC_TALENT_PICKLOCK))
	{
		AI_Output(self,other,"DIA_Ramirez_Teach_14_03");	//Итак, встань перед замком, и поворачивай отмычку влево и вправо.
		AI_Output(self,other,"DIA_Ramirez_Teach_14_04");	//Если ты будешь поворачивать ее слишком быстро или слишком сильно, она сломается.
		AI_Output(self,other,"DIA_Ramirez_Teach_14_05");	//Но чем более опытным ты будешь становиться, тем проще тебе будет управляться с этим воровским инструментом.
	};
};

instance DIA_Ramirez_Viertel(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 8;
	condition = DIA_Ramirez_Viertel_Condition;
	information = DIA_Ramirez_Viertel_Info;
	permanent = FALSE;
	description = "Где ты порекомендуешь мне попробовать свои силы?";
};

func int DIA_Ramirez_Viertel_Condition()
{
	if((IS_LOVCACH == TRUE) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Ramirez_Viertel_Info()
{
	AI_Output(other,self,"DIA_Ramirez_Viertel_15_00");	//Где ты порекомендуешь мне попробовать свои силы?
	AI_Output(self,other,"DIA_Ramirez_Viertel_14_01");	//В верхней части города, конечно же.
	AI_Output(self,other,"DIA_Ramirez_Viertel_14_02");	//Но если ты хочешь пробраться в какой-то дом, лучше дождаться ночи, ночью все спят - за исключением городской стражи.
	AI_Output(self,other,"DIA_Ramirez_Viertel_14_03");	//Они патрулируют город всю ночь. Я знаю одного из них - Вамбо. Его интересует только золото.
	AI_Output(self,other,"DIA_Ramirez_Viertel_14_04");	//Его услуги стоят недешево, но если ты ему заплатишь, тебе больше не о чем не нужно будет волноваться.
};

instance DIA_Ramirez_Sextant(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 2;
	condition = DIA_Ramirez_Sextant_Condition;
	information = DIA_Ramirez_Sextant_Info;
	permanent = FALSE;
	description = "У тебя есть работа для меня?";
};

func int DIA_Ramirez_Sextant_Condition()
{
	if((IS_LOVCACH == TRUE) && (RamirezTechMe == TRUE) && (Kapitel >= 1))
	{
		return TRUE;
	};
};

func void DIA_Ramirez_Sextant_Info()
{
	AI_Output(other,self,"DIA_Ramirez_Sextant_15_00");	//У тебя есть работа для меня?
	AI_Output(self,other,"DIA_Ramirez_Sextant_14_01");	//Хмм... есть вещица, которую я хотел бы заполучить. Но я нигде не могу найти ее.
	AI_Output(other,self,"DIA_Ramirez_Sextant_15_02");	//Что ты хотел бы получить?
	AI_Output(self,other,"DIA_Ramirez_Sextant_14_03");	//Секстант! Принеси мне секстант - я заплачу за него хорошую цену.
	MIS_RamirezSextant = LOG_Running;
	Log_CreateTopic(Topic_RamirezSextant,LOG_MISSION);
	Log_SetTopicStatus(Topic_RamirezSextant,LOG_Running);
	B_LogEntry(Topic_RamirezSextant,"Рамирез хочет, чтобы я принес ему секстант.");
};

instance DIA_Ramirez_Success(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 2;
	condition = DIA_Ramirez_Success_Condition;
	information = DIA_Ramirez_Success_Info;
	permanent = FALSE;
	description = "Я принес тебе секстант.";
};

func int DIA_Ramirez_Success_Condition()
{
	if((MIS_RamirezSextant == LOG_Running) && (Npc_HasItems(other,ItMi_Sextant) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Ramirez_Success_Info()
{
	B_GivePlayerXP(XP_RamirezSextant);
	AI_Output(other,self,"DIA_Ramirez_Success_15_00");	//Я принес тебе секстант.
	B_GiveInvItems(other,self,ItMi_Sextant,1);
	Npc_RemoveInvItems(self,ItMi_Sextant,1);
	AI_Output(self,other,"DIA_Ramirez_Success_14_01");	//Невероятно. Тебе удалось найти его!
	AI_Output(self,other,"DIA_Ramirez_Success_14_02");	//Вот, держи, ты заслужил эти деньги.
	B_GiveInvItems(self,other,ItMi_Gold,200);
	THIEF_REPUTATION = THIEF_REPUTATION + 1;
	Ramirez_Sextant = TRUE;
	MIS_RamirezSextant = LOG_SUCCESS;
	Log_SetTopicStatus(Topic_RamirezSextant,LOG_SUCCESS);
	B_LogEntry(Topic_RamirezSextant,"Рамирез получил свой секстант.");
};

instance DIA_RAMIREZ_GUILDKILL(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 1;
	condition = dia_ramirez_guildkill_condition;
	information = dia_ramirez_guildkill_info;
	permanent = FALSE;
	description = "Ты что-нибудь знаешь про гильдию убийц?";
};

func int dia_ramirez_guildkill_condition()
{
	if((MIS_GUILDKILL == LOG_Running) && (IS_LOVCACH == TRUE) && Npc_KnowsInfo(hero,dia_cassia_guildkill) && (CANCOMPLETEGUILDKILL == FALSE))
	{
		return TRUE;
	};
};

func void dia_ramirez_guildkill_info()
{
	AI_Output(other,self,"DIA_Ramirez_GuildKill_01_00");	//Ты что-нибудь знаешь про гильдию убийц?
	AI_Output(self,other,"DIA_Ramirez_GuildKill_01_01");	//(испуганно) А почему ты об этом спрашиваешь?
	AI_Output(other,self,"DIA_Ramirez_GuildKill_01_02");	//Кассия сказала, что ты должен кое-что знать.
	AI_Output(self,other,"DIA_Ramirez_GuildKill_01_03");	//Она так и сказала? Черт!
	AI_Output(self,other,"DIA_Ramirez_GuildKill_01_04");	//Знаешь, о таких вещах вообще-то всегда лучше помалкивать! А то, не ровен час, можно и нарваться на большие неприятности.
	AI_Output(other,self,"DIA_Ramirez_GuildKill_01_05");	//Может, все-таки расскажешь?
	AI_Output(self,other,"DIA_Ramirez_GuildKill_01_06");	//Ну, хорошо...(с неохотой) Но учти, многое я тебе не скажу, потому что не хочу потом сидеть тут и трястись за свою жизнь.
	AI_Output(self,other,"DIA_Ramirez_GuildKill_01_07");	//В общем, тебе стоит поговорить с человеком по имени Гиллиан.
	AI_Output(self,other,"DIA_Ramirez_GuildKill_01_08");	//Он из труппы бродячих музыкантов, что выступают на городской площади. Обратись к нему - он поможет тебе отыскать то, что ты ищещь.
	AI_Output(other,self,"DIA_Ramirez_GuildKill_01_09");	//И это все, что ты знаешь?
	AI_Output(self,other,"DIA_Ramirez_GuildKill_01_10");	//(нервно) Это все...
	B_LogEntry(TOPIC_GUILDKILL,"Рамирез был очень напуган, когда я заговорил с ним о гильдии убийц, однако посоветовал мне поговорить об этом с Гиллианом - бродячим музыкантом, выступающем на рыночной площади.");
};

instance DIA_RAMIREZ_WAREZ(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 1;
	condition = dia_ramirez_warez_condition;
	information = dia_ramirez_warez_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Покажи мне свои товары.";
};

func int dia_ramirez_warez_condition()
{
	if((IS_LOVCACH == TRUE) && (RamirezTechMe == TRUE))
	{
		return TRUE;
	};
};

func void dia_ramirez_warez_info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Ramirez_WAREZ_15_00");	//Покажи мне свои товары.
	AI_Output(self,other,"DIA_Ramirez_WAREZ_15_01");	//Только попробуй меня надуть - шкуру сдеру!
	B_GiveTradeInv(self);
	Npc_RemoveInvItems(self,itmiswordblade_1,Npc_HasItems(self,itmiswordblade_1));
};

instance DIA_Ramirez_Teach_W1(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 50;
	condition = DIA_Ramirez_Teach_W1_condition;
	information = DIA_Ramirez_Teach_W1_info;
	permanent = TRUE;
	description = "Покажи мне, как сделать хорошую шпагу.";
};

func int DIA_Ramirez_Teach_W1_condition()
{
	if((Lovkach_W1 == FALSE) && (RamirezTechMe == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Ramirez_Teach_W1_info()
{
	AI_Output(other,self,"DIA_Ramirez_Teach_W1_01_00");	//Покажи мне, как сделать хорошую шпагу.
	AI_Output(self,other,"DIA_Ramirez_Teach_W1_01_01");	//А ты умеешь обращаться с молотом и наковальней?

	if(PLAYER_TALENT_SMITH[WEAPON_Common] == TRUE)
	{
		AI_Output(other,self,"DIA_Ramirez_Teach_W1_01_02");	//Конечно.
		AI_Output(self,other,"DIA_Ramirez_Teach_W1_01_03");	//Вот и славненько! Тогда берешь стальную заготовку и кусок серы...
		AI_Output(self,other,"DIA_Ramirez_Teach_W1_01_04");	//...и слегка поворачиваешь вот так и вот так, проводя серой по заготовке.
		AI_Output(self,other,"DIA_Ramirez_Teach_W1_01_05");	//Потом проделываешь то же самое со вторым куском, но с другой стороны лезвия.
		AI_Output(self,other,"DIA_Ramirez_Teach_W1_01_06");	//Очень скоро оно должно заостриться, тогда работа будет окончена.
		AI_Output(other,self,"DIA_Ramirez_Teach_W1_01_07");	//Выглядит не очень сложно.
		AI_Output(self,other,"DIA_Ramirez_Teach_W1_01_08");	//Уверен, что у тебя все получится.
		AI_Print("Изучен рецепт ковки - 'Шпага вора'");
		B_LogEntry(TOPIC_TalentSmith,"Я научился делать простую воровскую шпагу. Для этого мне потребуется стальная заготовка и два куска серы.");
		Npc_SetTalentSkill(other,NPC_TALENT_SMITH,1);
		Lovkach_W1 = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Ramirez_Teach_W1_01_09");	//Пока нет.
		AI_Output(self,other,"DIA_Ramirez_Teach_W1_01_10");	//Так ты сначала хоть как-нибудь научись обращаться с кузнечными приспособлениями.
		AI_Output(self,other,"DIA_Ramirez_Teach_W1_01_11");	//Потом уже и заходи, поговорим.
		AI_StopProcessInfos(self);
	};

};


instance DIA_Ramirez_Teach_W2(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 50;
	condition = DIA_Ramirez_Teach_W2_condition;
	information = DIA_Ramirez_Teach_W2_info;
	permanent = TRUE;
	description = "Покажи мне, как сделать хорошую рапиру. (Очки обучения: 2, Цена: 1000 монет)";
};

func int DIA_Ramirez_Teach_W2_condition()
{
	if((IS_LOVCACH == TRUE) && (Lovkach_W1 == TRUE) && (THIEF_REPUTATION >= 5) && (Lovkach_W2 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Ramirez_Teach_W2_info()
{
	AI_Output(other,self,"DIA_Ramirez_Teach_W2_01_01");	//Покажи мне, как сделать хорошую рапиру.

	if((hero.lp >= 2) && (Npc_HasItems(other,ItMi_Gold) >= 1000))
	{
		AI_Output(self,other,"DIA_Ramirez_Teach_W2_01_02");	//Хорошо, слушай внимательно.
		AI_Output(self,other,"DIA_Ramirez_Teach_W2_01_03");	//Берешь стальную заготовку, разогреваешь ее, придаешь форму и остужаешь.
		AI_Output(self,other,"DIA_Ramirez_Teach_W2_01_04");	//Все как обычно! Вот только для заточки используй аквамарин. Минерал пойдет твоей шпаге только на пользу.
		AI_Output(self,other,"DIA_Ramirez_Teach_W2_01_05");	//В заключение, покрываешь весь клинок от основания до кончика смолой.
		AI_Output(self,other,"DIA_Ramirez_Teach_W2_01_06");	//Она наделит твою шпагу особым мрачным оттенком!
		hero.lp = hero.lp - 2;
		RankPoints = RankPoints + 2;
		Npc_RemoveInvItems(other,ItMi_Gold,1000);
		AI_Print("Изучен рецепт ковки - 'Рапира вора'");
		B_LogEntry(TOPIC_TalentSmith,"Теперь я могу делать рапиры. Для этого мне необходимо иметь аквамарин, смолу и стальную заготовку.");
		Lovkach_W2 = TRUE;
	}
	else
	{
		if(hero.lp < 2)
		{
			AI_Print(PRINT_NotEnoughLearnPoints);
			B_Say(self,other,"$NOLEARNNOPOINTS");
			AI_StopProcessInfos(self);
		};
		if(Npc_HasItems(other,ItMi_Gold) < 1000)
		{
			AI_Print(Print_NotEnoughGold);
			AI_Output(self,other,"DIA_Ramirez_Teach_W2_03_90");	//У тебя не хватает для этого золота! Приходи позже.
			AI_StopProcessInfos(self);
		};
	};
};


instance DIA_Ramirez_Teach_W3(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 50;
	condition = DIA_Ramirez_Teach_W3_condition;
	information = DIA_Ramirez_Teach_W3_info;
	permanent = TRUE;
	description = "Покажи мне, как сделать шпагу мастера. (Очки обучения: 3, Цена: 1500 монет)";
};

func int DIA_Ramirez_Teach_W3_condition()
{
	if((IS_LOVCACH == TRUE) && (Lovkach_W2 == TRUE) && (THIEF_REPUTATION >= 10) && (Lovkach_W3 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Ramirez_Teach_W3_info()
{
	AI_Output(other,self,"DIA_Ramirez_Teach_W3_01_01");	//Покажи мне, как сделать шпагу мастера.

	if((hero.lp >= 3) && (Npc_HasItems(other,ItMi_Gold) >= 1500))
	{
		AI_Output(self,other,"DIA_Ramirez_Teach_W3_01_02");	//Это уже серьезное оружие! Будь внимателен при выборе компонентов. Выбирай только лучшее, и у тебя получится замечательная шпага.
		AI_Output(self,other,"DIA_Ramirez_Teach_W3_01_03");	//А теперь слушай внимательно...
		AI_Output(self,other,"DIA_Ramirez_Teach_W3_01_04");	//Ты должен проделать то же, что делал при изготовлении рапиры.
		AI_Output(self,other,"DIA_Ramirez_Teach_W3_01_05");	//Но помимо этого, еще и инкрустировать в гарду шпаги черную жемчужину.
		AI_Output(self,other,"DIA_Ramirez_Teach_W3_01_06");	//Ее таинственный, манящий блеск отвлечет внимание противника во время боя.
		hero.lp = hero.lp - 3;
		RankPoints = RankPoints + 3;
		Npc_RemoveInvItems(other,ItMi_Gold,1500);
		AI_Print("Изучен рецепт ковки - 'Шпага мастера'");
		B_LogEntry(TOPIC_TalentSmith,"Теперь я смогу сделать шпагу мастера. Для этого мне необходимо иметь смолу, стальную заготовку и черную жемчужину.");
		Lovkach_W3 = TRUE;
	}
	else
	{
		if(hero.lp < 3)
		{
			AI_Print(PRINT_NotEnoughLearnPoints);
			B_Say(self,other,"$NOLEARNNOPOINTS");
			AI_StopProcessInfos(self);
		};
		if(Npc_HasItems(other,ItMi_Gold) < 1500)
		{
			AI_Print(Print_NotEnoughGold);
			AI_Output(self,other,"DIA_Ramirez_Teach_W3_03_90");	//У тебя не хватает для этого золота! Приходи позже.
			AI_StopProcessInfos(self);
		};
	};
};


instance DIA_Ramirez_Teach_W4(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 50;
	condition = DIA_Ramirez_Teach_W4_condition;
	information = DIA_Ramirez_Teach_W4_info;
	permanent = TRUE;
	description = "Изготовление шпаги 'Тихая смерть'. (Очки обучения: 4, Цена: 2000 монет)";
};

func int DIA_Ramirez_Teach_W4_condition()
{
	if((IS_LOVCACH == TRUE) && (Lovkach_W3 == TRUE) && (THIEF_REPUTATION >= 15) && (Lovkach_W4 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Ramirez_Teach_W4_info()
{
	AI_Output(other,self,"DIA_Ramirez_Teach_W4_01_01");	//Покажи мне, как сделать шпагу 'Тихая смерть'.

	if((hero.lp >= 4) && (Npc_HasItems(other,ItMi_Gold) >= 2000))
	{
		AI_Output(self,other,"DIA_Ramirez_Teach_W4_01_02");	//Немногим дано владеть таким великолепным орудием убийства.
		AI_Output(self,other,"DIA_Ramirez_Teach_W4_01_03");	//А теперь слушай внимательно...
		AI_Output(self,other,"DIA_Ramirez_Teach_W4_01_04");	//Смола здесь уже не требуется, но инкрустации необходимо подвергнуть две черных жемчужины.
		AI_Output(self,other,"DIA_Ramirez_Teach_W4_01_05");	//По одной на каждый конец гарды.
		hero.lp = hero.lp - 4;
		RankPoints = RankPoints + 4;
		Npc_RemoveInvItems(other,ItMi_Gold,2000);
		AI_Print("Изучен рецепт ковки - 'Тихая смерть'");
		B_LogEntry(TOPIC_TalentSmith,"Теперь я смогу сделать шпагу 'Тихая смерть'. Для этого мне необходимо иметь стальную заготовку и две черных жемчужины.");
		Lovkach_W4 = TRUE;
	}
	else
	{
		if(hero.lp < 4)
		{
			AI_Print(PRINT_NotEnoughLearnPoints);
			B_Say(self,other,"$NOLEARNNOPOINTS");
			AI_StopProcessInfos(self);
		};
		if(Npc_HasItems(other,ItMi_Gold) < 2000)
		{
			AI_Print(Print_NotEnoughGold);
			AI_Output(self,other,"DIA_Ramirez_Teach_W4_03_90");	//У тебя не хватает для этого золота! Приходи позже.
			AI_StopProcessInfos(self);
		};
	};
};


instance DIA_Ramirez_Teach_W5(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 50;
	condition = DIA_Ramirez_Teach_W5_condition;
	information = DIA_Ramirez_Teach_W5_info;
	permanent = TRUE;
	description = "Изготовление шпаги 'Пронзающая сталь'. (Очки обучения: 5, Цена: 3000 монет)";
};

func int DIA_Ramirez_Teach_W5_condition()
{
	if((IS_LOVCACH == TRUE) && (Lovkach_W4 == TRUE) && (THIEF_REPUTATION >= 20) && (Lovkach_W5 == FALSE) && (RavenAway == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Ramirez_Teach_W5_info()
{
	AI_Output(other,self,"DIA_Ramirez_Teach_W5_01_01");	//Покажи мне, как сделать шпагу 'Пронзающая сталь'.

	if((hero.lp >= 5) && (Npc_HasItems(other,ItMi_Gold) >= 3000))
	{
		AI_Output(self,other,"DIA_Ramirez_Teach_W5_01_02");	//Очень сложное оружие, поскольку при заточке используется огромное число различных компонентов. 
		AI_Output(self,other,"DIA_Ramirez_Teach_W5_01_03");	//И будь внимателен при выборе руды - для этой шпаги это особенно важно!
		AI_Output(self,other,"DIA_Ramirez_Teach_W5_01_04");	//А теперь слушай внимательно...
		AI_Output(self,other,"DIA_Ramirez_Teach_W5_01_05");	//Эта шпага должна быть украшена теми же элементами декора, что и предыдущая.
		AI_Output(self,other,"DIA_Ramirez_Teach_W5_01_06");	//Сталь на сей раз требует примеси руды, а заточка лезвия производится с использованием серы.
		AI_Output(self,other,"DIA_Ramirez_Teach_W5_01_07");	//Удели особое внимание остроте кончика! 
		AI_Output(self,other,"DIA_Ramirez_Teach_W5_01_08");	//Шпага должна легко пронзать противника, а название должно себя оправдывать.
		hero.lp = hero.lp - 5;
		RankPoints = RankPoints + 5;
		Npc_RemoveInvItems(other,ItMi_Gold,3000);
		AI_Print("Изучен рецепт ковки - 'Пронзающая сталь'");
		B_LogEntry(TOPIC_TalentSmith,"Теперь я смогу сделать шпагу 'Пронзающая сталь'. Для этого мне необходимо иметь стальную заготовку, две черных жемчужины, рудный слиток, а также десяток кусков серы.");
		Lovkach_W5 = TRUE;
	}
	else
	{
		if(hero.lp < 5)
		{
			AI_Print(PRINT_NotEnoughLearnPoints);
			B_Say(self,other,"$NOLEARNNOPOINTS");
			AI_StopProcessInfos(self);
		};
		if(Npc_HasItems(other,ItMi_Gold) < 3000)
		{
			AI_Print(Print_NotEnoughGold);
			AI_Output(self,other,"DIA_Ramirez_Teach_W5_03_90");	//У тебя не хватает для этого золота! Приходи позже.
			AI_StopProcessInfos(self);
		};
	};
};

instance DIA_Ramirez_Teach_W6(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 50;
	condition = DIA_Ramirez_Teach_W6_condition;
	information = DIA_Ramirez_Teach_W6_info;
	permanent = TRUE;
	description = "Изготовление шпаги 'Жало Скорпиона'. (Очки обучения: 6, Цена: 4000 монет)";
};

func int DIA_Ramirez_Teach_W6_condition()
{
	if((IS_LOVCACH == TRUE) && (Lovkach_W5 == TRUE) && (THIEF_REPUTATION >= 30) && (Kapitel >= 2) && (Lovkach_W6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Ramirez_Teach_W6_info()
{
	AI_Output(other,self,"DIA_Ramirez_Teach_W6_01_01");	//Покажи мне, как сделать шпагу 'Жало Скорпиона'.

	if((hero.lp >= 6) && (Npc_HasItems(other,ItMi_Gold) >= 4000))
	{
		AI_Output(self,other,"DIA_Ramirez_Teach_W6_01_02");	//Ты добрался до самого интересного этапа в своем обучении! Простые шпаги больше не должны интересовать тебя...
		AI_Output(self,other,"DIA_Ramirez_Teach_W6_01_03");	//Природа следующего оружия - отчасти магическая!
		AI_Output(self,other,"DIA_Ramirez_Teach_W6_01_04");	//А теперь слушай внимательно...
		AI_Output(self,other,"DIA_Ramirez_Teach_W6_01_05");	//Бросаешь в горн побольше угля - заготовка должна быстро раскалиться.
		AI_Output(self,other,"DIA_Ramirez_Teach_W6_01_06");	//Аквамарин теперь послужит украшением. Выложи им всю внешнюю сторону защитной дужки эфеса.
		AI_Output(self,other,"DIA_Ramirez_Teach_W6_01_07");	//Так она станет похожа на изогнутое жало скорпиона!
		AI_Output(self,other,"DIA_Ramirez_Teach_W6_01_08");	//А навершие в виде черной жемчужины символизирует черную каплю скорпионьего яда.
		AI_Output(self,other,"DIA_Ramirez_Teach_W6_01_09");	//Ну, а чтобы шпага напоминала жало не только видом, но и действием - нанеси настоящий яд на ее клинок.
		hero.lp = hero.lp - 6;
		RankPoints = RankPoints + 6;
		Npc_RemoveInvItems(other,ItMi_Gold,4000);
		AI_Print("Изучен рецепт ковки - 'Жало Скорпиона'");
		B_LogEntry(TOPIC_TalentSmith,"Теперь я смогу сделать шпагу 'Жало Скорпиона'. Для этого мне необходимо иметь: стальную заготовку, пять кусков угля, пять аквамаринов, черную жемчужину и две бутылки яда.");
		Lovkach_W6 = TRUE;
	}
	else
	{
		if(hero.lp < 6)
		{
			AI_Print(PRINT_NotEnoughLearnPoints);
			B_Say(self,other,"$NOLEARNNOPOINTS");
			AI_StopProcessInfos(self);
		};
		if(Npc_HasItems(other,ItMi_Gold) < 4000)
		{
			AI_Print(Print_NotEnoughGold);
			AI_Output(self,other,"DIA_Ramirez_Teach_W6_03_90");	//У тебя не хватает для этого золота! Приходи позже.
			AI_StopProcessInfos(self);
		};
	};
};

instance DIA_Ramirez_Teach_W7(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 50;
	condition = DIA_Ramirez_Teach_W7_condition;
	information = DIA_Ramirez_Teach_W7_info;
	permanent = TRUE;
	description = "Изготовление шпаги 'Крик в ночи'. (Очки обучения: 7, Цена: 5000 монет)";
};

func int DIA_Ramirez_Teach_W7_condition()
{
	if((IS_LOVCACH == TRUE) && (Lovkach_W6 == TRUE) && (THIEF_REPUTATION >= 40) && (Kapitel >= 2) && (Lovkach_W7 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Ramirez_Teach_W7_info()
{
	AI_Output(other,self,"DIA_Ramirez_Teach_W7_01_01");	//Покажи мне, как сделать шпагу 'Крик в ночи'.

	if((hero.lp >= 7) && (Npc_HasItems(other,ItMi_Gold) >= 5000))
	{
		AI_Output(self,other,"DIA_Ramirez_Teach_W7_01_02");	//Сложно достать компоненты для шпаги 'Крик в ночи', но это лучшее оружие, что я пока могу тебе предложить.
		AI_Output(self,other,"DIA_Ramirez_Teach_W7_01_03");	//Как видишь, нужно немало опыта, чтобы сделать такую штуку, но что поделать - ведь это настоящее произведение искусства.
		AI_Output(self,other,"DIA_Ramirez_Teach_W7_01_04");	//Шпага излучает темную ауру и смертоносна для любых твоих врагов!
		AI_Output(self,other,"DIA_Ramirez_Teach_W7_01_05");	//А теперь, слушай внимательно...
		AI_Output(self,other,"DIA_Ramirez_Teach_W7_01_06");	//Стальная заготовка, уголь, горный хрусталь, черная жемчужина и три частицы эктоплазмы - вот ее компоненты.
		AI_Output(self,other,"DIA_Ramirez_Teach_W7_01_07");	//Изготовление данной шпаги завершается совершенно мистическим ритуалом. Ты должен прорубить ею мертвую плоть!
		AI_Output(self,other,"DIA_Ramirez_Teach_W7_01_08");	//Мастера, придумавшие это, говорили, что, разрубая мертвую плоть, шпага буквально запоминает, к какому виду нужно приводить живую.
		hero.lp = hero.lp - 7;
		RankPoints = RankPoints + 7;
		Npc_RemoveInvItems(other,ItMi_Gold,5000);
		AI_Print("Изучен рецепт ковки - 'Крик в ночи'");
		B_LogEntry(TOPIC_TalentSmith,"Теперь я смогу сделать шпагу 'Крик в ночи'. Для этого мне необходимо иметь стальную заготовку, пять кусков угля, пять образцов горного хрусталя, черную жемчужину, мертвую плоть, а также три частицы эктоплазмы.");
		Lovkach_W7 = TRUE;
	}
	else
	{
		if(hero.lp < 7)
		{
			AI_Print(PRINT_NotEnoughLearnPoints);
			B_Say(self,other,"$NOLEARNNOPOINTS");
			AI_StopProcessInfos(self);
		};
		if(Npc_HasItems(other,ItMi_Gold) < 5000)
		{
			AI_Print(Print_NotEnoughGold);
			AI_Output(self,other,"DIA_Ramirez_Teach_W7_03_90");	//У тебя не хватает для этого золота! Приходи позже.
			AI_StopProcessInfos(self);
		};
	};
};

instance DIA_Ramirez_TellAboutFingers(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 50;
	condition = DIA_Ramirez_TellAboutFingers_condition;
	information = DIA_Ramirez_TellAboutFingers_info;
	permanent = FALSE;
	description = "А есть шпага лучше той, о которой ты мне рассказывал в последний раз?";
};

func int DIA_Ramirez_TellAboutFingers_condition()
{
	if((IS_LOVCACH == TRUE) && (Lovkach_W7 == TRUE) && (THIEF_REPUTATION >= 50) && (Kapitel >= 2) && (Lovkach_W8 == FALSE) && (FingersIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Ramirez_TellAboutFingers_info()
{
	AI_Output(other,self,"DIA_Ramirez_TellAboutFingers_01_01");	//А есть шпага лучше той, о которой ты мне рассказывал в последний раз?
	AI_Output(self,other,"DIA_Ramirez_TellAboutFingers_01_02");	//Хммм...(задумчиво) Ходят слухи, что когда-то такая шпага была у мастера Фингерса.
	AI_Output(self,other,"DIA_Ramirez_TellAboutFingers_01_03");	//Это было воистину прекрасное и смертоносное оружие! Но правда это или нет, я тебе точно не скажу.
	AI_Output(self,other,"DIA_Ramirez_TellAboutFingers_01_04");	//А если кто и знает об этом, то только сам Фингерс. 
	AI_Output(self,other,"DIA_Ramirez_TellAboutFingers_01_05");	//Но я о нем ничего не слышал с тех пор, как его забросили гнить в колонию.
	MIS_TellAboutFingers = LOG_Running;
	Log_CreateTopic(TOPIC_TellAboutFingers,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TellAboutFingers,LOG_Running);
	B_LogEntry(TOPIC_TellAboutFingers,"Рамирез рассказал мне о шпаге мастера Фингерса. Это было воистину прекрасное и смертоносное оружие. Однако это всего лишь слухи. Если кто и знает этот секрет, то только сам Фингерс.");
};

instance DIA_Ramirez_BanditShpaga(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 7;
	condition = DIA_Ramirez_BanditShpaga_condition;
	information = DIA_Ramirez_BanditShpaga_info;
	permanent = FALSE;
	description = "Ты интересуешься бандитскими шпагами?";
};

func int DIA_Ramirez_BanditShpaga_condition()
{
	if((THIEF_REPUTATION >= 5) && Npc_HasItems(hero,ItMw_Addon_BanditTrader))
	{
		return TRUE;
	};
};

func void DIA_Ramirez_BanditShpaga_info()
{
	AI_Output(other,self,"DIA_Ramirez_BanditShpaga_01_00");	//Ты интересуешься бандитскими шпагами?
	AI_Output(self,other,"DIA_Ramirez_BanditShpaga_01_01");	//Конечно нет...(презрительно) Зачем мне этот мусор? Впрочем, я могу скупать их у тебя.
	AI_Output(self,other,"DIA_Ramirez_BanditShpaga_01_02");	//Гильдии будет выгодно, если этих проклятых бандитов станет куда меньше... чертовы конкуренты!
	B_LogEntry(Topic_Bonus,"Рамирез согласился покупать у меня шпаги бандитов. На этом можно сделать маленький бизнес!");
	RamirezBuyBanditShpaga = TRUE;
};

instance DIA_Ramirez_BanditShpaga_Buy(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 7;
	condition = DIA_Ramirez_BanditShpaga_Buy_condition;
	information = DIA_Ramirez_BanditShpaga_Buy_info;
	permanent = TRUE;
	important = FALSE;
	description = "У меня есть бандитские шпаги.";
};

func int DIA_Ramirez_BanditShpaga_Buy_condition()
{
	if((RamirezBuyBanditShpaga == TRUE) && Npc_HasItems(hero,ItMw_Addon_BanditTrader))
	{
		return TRUE;
	};
};

func void DIA_Ramirez_BanditShpaga_Buy_info()
{
	var C_Item EquipWeap;
	var int tempgoldrap;

	AI_Output(other,self,"DIA_Ramirez_BanditShpaga_Buy_01_01");	//У меня есть бандитские шпаги.
	EquipWeap = Npc_GetEquippedMeleeWeapon(hero);
	tempgoldrap = Npc_HasItems(hero,ItMw_Addon_BanditTrader);

	if(Hlp_IsItem(EquipWeap,ItMw_Addon_BanditTrader) == TRUE)
	{
		if(tempgoldrap > 1)
		{
			tempgoldrap -= 1;
		};
	};

	AI_Output(self,other,"DIA_Ramirez_BanditShpaga_Buy_01_02");	//Что же, давай их сюда...(мрачно) Надеюсь, что мы сможем когда-нибудь продать весь этот металлолом!
	Npc_RemoveInvItems(hero,ItMw_Addon_BanditTrader,Npc_HasItems(hero,ItMw_Addon_BanditTrader));
	B_GiveInvItems(self,other,ItMi_Gold,tempgoldrap * 80);
};

instance DIA_Ramirez_MagicBook(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 7;
	condition = DIA_Ramirez_MagicBook_condition;
	information = DIA_Ramirez_MagicBook_info;
	permanent = FALSE;
	description = "Я слышал, что это ты обокрал дом Ватраса.";
};

func int DIA_Ramirez_MagicBook_condition()
{
	if((MagicBookFindTradeExt == TRUE) && (MIS_VatrasMagicBook == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Ramirez_MagicBook_info()
{
	AI_Output(other,self,"DIA_Ramirez_MagicBook_01_00");	//Я слышал, что это ты обокрал дом Ватраса.
	AI_Output(self,other,"DIA_Ramirez_MagicBook_01_01");	//Ну, если ты так уверенно говоришь об этом...(оценивающе) То, значит, это был я. А почему ты, собственно, спрашиваешь?
	AI_Output(other,self,"DIA_Ramirez_MagicBook_01_02");	//Я ищу один предмет, который ему принадлежал.
	AI_Output(self,other,"DIA_Ramirez_MagicBook_01_03");	//И о чем конкретно идет речь?
	AI_Output(other,self,"DIA_Ramirez_MagicBook_01_04");	//Это должно быть нечто похожее на книгу или дневник.
	AI_Output(self,other,"DIA_Ramirez_MagicBook_01_05");	//Хммм...(задумчиво) Ах да, припоминаю! Я ее приметил в самый последний момент.
	AI_Output(self,other,"DIA_Ramirez_MagicBook_01_06");	//И решил, что, возможно, она представляет какую-нибудь ценность.
	AI_Output(self,other,"DIA_Ramirez_MagicBook_01_07");	//Но оказалось, что это абсолютно бесполезный кусок бумаги! Вряд ли я смогу за нее выручить приличные деньги.
	AI_Output(other,self,"DIA_Ramirez_MagicBook_01_08");	//Выходит, что книга сейчас у тебя?
	AI_Output(self,other,"DIA_Ramirez_MagicBook_01_09");	//Да, она тут. Я пока что еще не придумал, что с ней делать.
	AI_Output(other,self,"DIA_Ramirez_MagicBook_01_10");	//Тогда просто отдай ее мне.
	AI_Output(self,other,"DIA_Ramirez_MagicBook_01_11");	//Хммм... ну, если ты так хочешь ее заполучить, то почему бы и нет. 
	AI_Output(self,other,"DIA_Ramirez_MagicBook_01_12");	//Однако я все-таки хочу что-то поиметь с этой вещицы! Поэтому давай договоримся так...
	AI_Output(self,other,"DIA_Ramirez_MagicBook_01_13");	//...скажем, ты даешь мне сто золотых - и книга твоя. Ну как, идет?
	B_LogEntry(TOPIC_VatrasMagicBook,"Дневник Ватраса до сих пор находится у Рамиреза. Он продаст мне его за сто золотых монет.");	
	Info_ClearChoices(DIA_Ramirez_MagicBook);

	if(Npc_HasItems(hero,ItMi_Gold) >= 100)
	{
		Info_AddChoice(DIA_Ramirez_MagicBook,"Конечно. Вот твои деньги.",DIA_Ramirez_MagicBook_Yes);
	};

	Info_AddChoice(DIA_Ramirez_MagicBook,"Нет! Это слишком дорого.",DIA_Ramirez_MagicBook_No);

	if(RhetorikSkillValue[1] >= 30)
	{
		Info_AddChoice(DIA_Ramirez_MagicBook,"Ты хочешь, чтобы я у тебя купил вещь, которая и гроша не стоит?",DIA_Ramirez_MagicBook_Nothing);
	};
};

func void DIA_Ramirez_MagicBook_Yes()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Ramirez_MagicBook_Yes_01_01");	//Конечно. Вот твои деньги.
	B_GiveInvItems(other,self,ItMi_Gold,100);
	Npc_RemoveInvItems(self,ItMi_Gold,100);
	AI_Output(self,other,"DIA_Ramirez_MagicBook_Yes_01_02");	//Отлично, приятель. И я не в пролете с ней, и ты не в накладе.
	AI_Output(self,other,"DIA_Ramirez_MagicBook_Yes_01_03");	//На вот, забирай свою книгу!
	B_GiveInvItems(self,other,ItWr_VatrasDiary,1);
	Info_ClearChoices(DIA_Ramirez_MagicBook);
};

func void DIA_Ramirez_MagicBook_No()
{
	AI_Output(other,self,"DIA_Ramirez_MagicBook_No_01_01");	//Это слишком дорого.
	AI_Output(self,other,"DIA_Ramirez_MagicBook_No_01_02");	//Как скажешь...(ворчливо) Но тогда, пожалуй, я оставлю ее у себя. 
	AI_Output(self,other,"DIA_Ramirez_MagicBook_No_01_03");	//А то мало ли, знаешь... вдруг пригодится?
	MagicBookFindTrade = TRUE;
	Info_ClearChoices(DIA_Ramirez_MagicBook);
};

func void DIA_Ramirez_MagicBook_Nothing()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Ramirez_MagicBook_Nothing_01_00");	//Ты хочешь, чтобы я у тебя купил вещь, которая и гроша не стоит?
	AI_Output(self,other,"DIA_Ramirez_MagicBook_Nothing_01_01");	//Эммм...
	AI_Output(other,self,"DIA_Ramirez_MagicBook_Nothing_01_02");	//Неужели ты хочешь меня надуть?
	AI_Output(self,other,"DIA_Ramirez_MagicBook_Nothing_01_03");	//Я?! Нет, что ты... я просто подумал, что если она тебе так нужна...
	AI_Output(self,other,"DIA_Ramirez_MagicBook_Nothing_01_04");	//Эх, ладно! Белиар с ней...(в сердцах) На вот, забирай ее так! Все равно толку от нее никакого.

	if(RhetorikSkillValue[1] < 100)
	{
		RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
		AI_Print("Риторика + 1");
	};

	B_GiveInvItems(self,other,ItWr_VatrasDiary,1);
	Info_ClearChoices(DIA_Ramirez_MagicBook);
};