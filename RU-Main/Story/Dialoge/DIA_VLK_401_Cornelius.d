
instance DIA_Cornelius_Exit(C_Info)
{
	npc = VLK_401_Cornelius;
	nr = 999;
	condition = DIA_Cornelius_Exit_Condition;
	information = DIA_Cornelius_Exit_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Cornelius_Exit_Condition()
{
	return TRUE;
};

func void DIA_Cornelius_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Cornelius_SeeMurder(C_Info)
{
	npc = VLK_401_Cornelius;
	nr = 4;
	condition = DIA_Cornelius_SeeMurder_Condition;
	information = DIA_Cornelius_SeeMurder_Info;
	permanent = FALSE;
	description = "Ты видел, как убили Лотара, да?";
};


func int DIA_Cornelius_SeeMurder_Condition()
{
	if(RecueBennet_KnowsCornelius == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Cornelius_SeeMurder_Info()
{
	AI_Output(other,self,"DIA_Cornelius_SeeMurder_15_00");	//Ты видел, как убили Лотара, да?
	AI_Output(self,other,"DIA_Cornelius_SeeMurder_13_01");	//(нервно) Я не обязан отвечать на такие вопросы.
	AI_Output(self,other,"DIA_Cornelius_SeeMurder_13_02");	//Лорд Хаген уже допрашивал меня.
};


instance DIA_Cornelius_WhatYouSee(C_Info)
{
	npc = VLK_401_Cornelius;
	nr = 5;
	condition = DIA_Cornelius_WhatYouSee_Condition;
	information = DIA_Cornelius_WhatYouSee_Info;
	permanent = FALSE;
	description = "Что именно ты видел?";
};


func int DIA_Cornelius_WhatYouSee_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Cornelius_SeeMurder))
	{
		return TRUE;
	};
};

func void DIA_Cornelius_WhatYouSee_Info()
{
	AI_Output(other,self,"DIA_Cornelius_WhatYouSee_15_00");	//Что именно ты видел?
	AI_Output(self,other,"DIA_Cornelius_WhatYouSee_13_01");	//(возбужденно) Послушай, у меня нет времени на болтовню с тобой.
	AI_Output(self,other,"DIA_Cornelius_WhatYouSee_13_02");	//(возбужденно) Уходи, я сейчас никого не принимаю.
	B_LogEntry(TOPIC_RescueBennet,"Корнелиус отказывается разговаривать со мной.");
	AI_StopProcessInfos(self);
};


instance DIA_Cornelius_Enough(C_Info)
{
	npc = VLK_401_Cornelius;
	nr = 6;
	condition = DIA_Cornelius_Enough_Condition;
	information = DIA_Cornelius_Enough_Info;
	permanent = FALSE;
	description = "Хватит! ЧТО ТЫ ВИДЕЛ?";
};


func int DIA_Cornelius_Enough_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Cornelius_WhatYouSee))
	{
		return TRUE;
	};
};

func void DIA_Cornelius_Enough_Info()
{
	AI_Output(other,self,"DIA_Cornelius_Enough_15_00");	//Хватит! ЧТО ТЫ ВИДЕЛ?
	AI_Output(self,other,"DIA_Cornelius_Enough_13_01");	//(нервно) Я... я видел, как наемник нанес удар в спину паладину.
	AI_Output(self,other,"DIA_Cornelius_Enough_13_02");	//(нервно) А затем он вынул свой меч и вонзил его ему в грудь.
	AI_Output(other,self,"DIA_Cornelius_Enough_15_03");	//Ты в этом совершенно уверен?
	AI_Output(self,other,"DIA_Cornelius_Enough_13_04");	//(испуганно) Да, конечно. Я видел это своим собственными глазами.
	AI_Output(self,other,"DIA_Cornelius_Enough_13_05");	//(испуганно) Но мне правда сейчас некогда. Мне нужно работать с документами.
	AI_StopProcessInfos(self);
};


instance DIA_Cornelius_DontBelieveYou(C_Info)
{
	npc = VLK_401_Cornelius;
	nr = 4;
	condition = DIA_Cornelius_DontBelieveYou_Condition;
	information = DIA_Cornelius_DontBelieveYou_Info;
	permanent = TRUE;
	description = "Я тебе не верю.";
};


func int DIA_Cornelius_DontBelieveYou_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Cornelius_Enough) && (Cornelius_TellTruth != TRUE) && (MIS_RescueBennet != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Cornelius_DontBelieveYou_Info()
{
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_15_00");	//Я тебе не верю.
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_13_01");	//(с напускной уверенностью) И что? Что ты собираешься делать?
	Info_ClearChoices(DIA_Cornelius_DontBelieveYou);
	Info_AddChoice(DIA_Cornelius_DontBelieveYou,"Сколько ты хочешь?",DIA_Cornelius_DontBelieveYou_WhatYouWant);
	Info_AddChoice(DIA_Cornelius_DontBelieveYou,"Ты ведь очень дорожишь своей жизнью, правда?",DIA_Cornelius_DontBelieveYou_WantSurvive);
	if(hero.guild == GIL_KDF)
	{
		Info_AddChoice(DIA_Cornelius_DontBelieveYou,"Тебя могли бы заставить говорить в монастыре.",DIA_Cornelius_DontBelieveYou_Monastery);
	};
	if(hero.guild == GIL_SLD)
	{
		Info_AddChoice(DIA_Cornelius_DontBelieveYou,"Я могу сказать наемникам, где ты живешь.",DIA_Cornelius_DontBelieveYou_KnowYourHome);
	};
	if(hero.guild == GIL_MIL)
	{
		Info_AddChoice(DIA_Cornelius_DontBelieveYou,"За лжесвидетельство дают длинный срок!",DIA_Cornelius_DontBelieveYou_Perjury);
	};
	if(hero.guild == GIL_KDM)
	{
		Info_AddChoice(DIA_Cornelius_DontBelieveYou,"Скажи, ты любишь боль?",dia_cornelius_dontbelieveyou_kdm);
	};
	if(hero.guild == GIL_KDW)
	{
		Info_AddChoice(DIA_Cornelius_DontBelieveYou,"Во имя Аданоса, я добьюсь от тебя правды!",dia_cornelius_dontbelieveyou_kdw);
	};
	if((hero.guild == GIL_SEK) || (hero.guild == GIL_TPL) || (hero.guild == GIL_GUR))
	{
		Info_AddChoice(DIA_Cornelius_DontBelieveYou,"Придется применить к тебе особый подход.",dia_cornelius_dontbelieveyou_sek);
	};
};

func void DIA_Cornelius_DontBelieveYou_WhatYouWant()
{
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_WhatYouWant_15_00");	//Сколько ты хочешь?
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_WhatYouWant_13_01");	//(надменно) У тебя не хватит золота, чтобы заплатить мне.
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_WhatYouWant_15_02");	//Сколько?
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_WhatYouWant_13_03");	//Две тысячи золотых монет! Тогда я, возможно, пересмотрю свою точку зрения.
	B_LogEntry(TOPIC_RescueBennet,"Корнелиус готов разговаривать со мной за две тысячи золотых монет.");
	Cornelius_PayForProof = TRUE;
	Info_ClearChoices(DIA_Cornelius_DontBelieveYou);
};

func void DIA_Cornelius_DontBelieveYou_WantSurvive()
{
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_WantSurvive_15_00");	//Ты ведь очень дорожишь своей жизнью, правда?
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_WantSurvive_13_01");	//(испуганно) Если ты нападешь на меня, тебя повесят.
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_WantSurvive_13_02");	//У меня очень влиятельные друзья. Так что даже не думай тронуть меня хотя бы пальцем.
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_WantSurvive_13_03");	//А теперь убирайся отсюда! Иди я позову стражу!
	AI_StopProcessInfos(self);
};

func void DIA_Cornelius_DontBelieveYou_Monastery()
{
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_Monastery_15_00");	//Тебя могли бы заставить говорить в монастыре.
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_Monastery_13_01");	//(побелев как снег) Что ты этим хочешь сказать?
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_Monastery_15_02");	//Ну, у нас есть методы заставить говорить правду. Очень болезненные методы.
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_Monastery_13_03");	//Нет, пожалуйста, не нужно. Я скажу тебе все, что ты хочешь узнать.
	Cornelius_TellTruth = TRUE;
	Info_ClearChoices(DIA_Cornelius_DontBelieveYou);
};

func void dia_cornelius_dontbelieveyou_kdm()
{
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_KDM_15_00");	//Скажи, ты любишь боль?
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_KDM_13_01");	//Что ты этим хочешь сказать?
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_KDM_15_02");	//Ну, у меня родилась идея познакомить тебя с некоторыми из моих слуг.
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_KDM_15_03");	//Они очень любят пытать и мучить таких, как ты! Думаю, пары зомби хватит для того, чтобы развязать тебе язык.
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_KDM_15_04");	//Или... демон, например. Ох, как эти милашки любят рвать человеческую плоть! Ты бы видел!..
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_KDM_13_05");	//(побелев как снег) Нет, пожалуйста. Я скажу все, что хочешь.
	Cornelius_TellTruth = TRUE;
	Info_ClearChoices(DIA_Cornelius_DontBelieveYou);
};

func void dia_cornelius_dontbelieveyou_kdw()
{
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_KDW_15_00");	//Во имя Аданоса, я добьюсь от тебя правды!
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_KDW_15_01");	//Даже если мне придется поступиться при этом некоторыми нашими принципами.
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_KDW_15_02");	//Хочешь ты того или нет, но я извещу Ватраса о некоторых твоих злодеяниях.
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_KDW_15_03");	//Пусть и немного вымышленных. Поверь, слухи быстро расползутся по городу. Твое имя станет позором для всего города.
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_KDW_15_05");	//Люди будут тебе плевать в лицо, а твое имя смешают с грязью!
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_KDW_15_06");	//(побелев как снег) ЧТО?! Ты этого не сделаешь! Да кто поверит тебе?
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_KDW_15_07");	//Мне - может быть, и нет. А Ватрас - очень влиятельное лицо в городе. Смекаешь?
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_KDW_13_08");	//Хорошо, хорошо. Я скажу все, что ты хочешь.
	Cornelius_TellTruth = TRUE;
	Info_ClearChoices(DIA_Cornelius_DontBelieveYou);
};

func void dia_cornelius_dontbelieveyou_sek()
{
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_SEK_15_00");	//Придется применить к тебе особый подход.
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_SEK_15_01");	//Ты ведь знаешь, что некоторые Гуру из нашего Братства очень дружны со многими влиятельными людьми этого города.
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_SEK_15_02");	//И с твоим боссом - тоже!
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_SEK_15_03");	//(побелев как снег) К чему ты ведешь?
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_SEK_15_04");	//К тому, что может получиться так, что в скором времени тебе придется искать новую работу.
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_SEK_15_05");	//И, скорее всего, так может получиться, что в Хоринисе ты ее уже точно не найдешь!
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_SEK_15_06");	//Так что думаю замолвить за тебя пару словечек Лариусу - и посмотрим, как быстро тебя выставят отсюда на улицу.
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_SEK_15_07");	//Ты... ты не станешь делать этого!
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_SEK_15_08");	//Поверь мне, еще как стану, если ты мне сейчас не расскажешь всю правду об убийстве Лотара.
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_SEK_13_09");	//Хорошо, хорошо. Я скажу все, что ты хочешь.
	Cornelius_TellTruth = TRUE;
	Info_ClearChoices(DIA_Cornelius_DontBelieveYou);
};

func void DIA_Cornelius_DontBelieveYou_KnowYourHome()
{
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_KnowYourHome_15_00");	//Я могу сказать наемникам, где ты живешь.
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_KnowYourHome_13_01");	//(белый как мел) Что ты этим хочешь сказать?
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_KnowYourHome_15_02");	//Ручаюсь, они жаждут познакомиться с тобой. Им очень не нравится эта ситуация.
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_KnowYourHome_13_03");	//Ты не можешь сделать это. Они убьют меня!
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_KnowYourHome_15_04");	//Вполне вероятно.
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_KnowYourHome_13_05");	//Я скажу все, что ты хочешь, только не делай этого.
	Cornelius_TellTruth = TRUE;
	Info_ClearChoices(DIA_Cornelius_DontBelieveYou);
};

func void DIA_Cornelius_DontBelieveYou_Perjury()
{
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_Perjury_15_00");	//За лжесвидетельство тебя посадят в тюрьму - и надолго!
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_Perjury_13_01");	//Ты пытаешься угрожать мне? Какой-то жалкий стражник угрожает мне, секретарю губернатора?
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_Perjury_13_02");	//Если ты немедленно не исчезнешь, я позабочусь, чтобы тебя разжаловали.
	Cornelius_ThreatenByMilSC = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_Cornelius_PayCornelius(C_Info)
{
	npc = VLK_401_Cornelius;
	nr = 4;
	condition = DIA_Cornelius_PayCornelius_Condition;
	information = DIA_Cornelius_PayCornelius_Info;
	permanent = TRUE;
	description = "Вот золото.";
};


func int DIA_Cornelius_PayCornelius_Condition()
{
	if((Cornelius_PayForProof == TRUE) && (Npc_HasItems(other,ItMi_Gold) >= 2000))
	{
		return TRUE;
	};
};

func void DIA_Cornelius_PayCornelius_Info()
{
	AI_Output(other,self,"DIA_Cornelius_PayCornelius_15_00");	//Вот золото.
	B_GiveInvItems(other,self,ItMi_Gold,2000);
	AI_Output(self,other,"DIA_Cornelius_PayCornelius_13_01");	//Лучше я не буду спрашивать, где ты его взял.
	AI_Output(self,other,"DIA_Cornelius_PayCornelius_13_02");	//Правда, если честно, меня это совсем не волнует.
	AI_Output(self,other,"DIA_Cornelius_PayCornelius_13_03");	//Главное, что оно теперь мое.
	Cornelius_TellTruth = TRUE;
};

instance DIA_Cornelius_RealStory(C_Info)
{
	npc = VLK_401_Cornelius;
	nr = 4;
	condition = DIA_Cornelius_RealStory_Condition;
	information = DIA_Cornelius_RealStory_Info;
	permanent = TRUE;
	description = "Так что произошло на самом деле?";
};

func int DIA_Cornelius_RealStory_Condition()
{
	if(Cornelius_TellTruth == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Cornelius_RealStory_Info()
{
	AI_Output(other,self,"DIA_Cornelius_RealStory_15_00");	//Так что произошло на самом деле?
	AI_Output(self,other,"DIA_Cornelius_RealStory_13_01");	//Я не видел, что произошло. Я получил золото за то, что обвиню этого наемника.
	AI_Output(self,other,"DIA_Cornelius_RealStory_13_02");	//В нынешние времена каждый сам за себя. А мне нужны были деньги.
	AI_Output(other,self,"DIA_Cornelius_RealStory_15_03");	//Кто заплатил тебе?
	AI_Output(self,other,"DIA_Cornelius_RealStory_13_04");	//Тебе достаточно того, что я сказал. Он убьет меня, если я проговорюсь.
	AI_Output(other,self,"DIA_Cornelius_RealStory_15_05");	//Ты готов подтвердить сказанное тобой перед лордом Хагеном?
	AI_Output(self,other,"DIA_Cornelius_RealStory_13_06");	//Я пока еще не выжил из ума. Я не собираюсь оставаться в городе.

	if(Npc_HasItems(self,ItWr_CorneliusTagebuch_Mis) >= 1)
	{
		AI_Output(self,other,"DIA_Cornelius_RealStory_13_07");	//Я дам тебе мой дневник, он послужит достаточным доказательством.
		B_GiveInvItems(self,other,ItWr_CorneliusTagebuch_Mis,1);
	};
	if(RhetorikSkillValue[1] < 100)
	{
		RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
		AI_Print("Риторика + 1");
	};

	B_LogEntry(TOPIC_RescueBennet,"Корнелиус солгал. Ему заплатили, чтобы упечь Беннета в тюрьму. Но он не говорит мне, кто подкупил его. Он весь дрожит от страха.");
	CorneliusFlee = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FLEE");
};


instance DIA_Cornelius_Fleeing(C_Info)
{
	npc = VLK_401_Cornelius;
	nr = 1;
	condition = DIA_Cornelius_Fleeing_Condition;
	information = DIA_Cornelius_Fleeing_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Cornelius_Fleeing_Condition()
{
	if((CorneliusFlee == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Cornelius_Fleeing_Info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
};


instance DIA_Cornelius_PICKPOCKET(C_Info)
{
	npc = VLK_401_Cornelius;
	nr = 900;
	condition = DIA_Cornelius_PICKPOCKET_Condition;
	information = DIA_Cornelius_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(Попытаться украсть его книгу)";
};


func int DIA_Cornelius_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) >= 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (Npc_HasItems(self,ItWr_CorneliusTagebuch_Mis) >= 1) && (RecueBennet_KnowsCornelius == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Cornelius_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Cornelius_PICKPOCKET);
	Info_AddChoice(DIA_Cornelius_PICKPOCKET,Dialog_Back,DIA_Cornelius_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Cornelius_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Cornelius_PICKPOCKET_DoIt);
};

func void DIA_Cornelius_PICKPOCKET_DoIt()
{
	AI_PlayAni(other,"T_STEAL");
	AI_Wait(other,1);

	if((other.attribute[ATR_DEXTERITY] + PickPocketBonusCount) >= Hlp_Random(self.attribute[ATR_DEXTERITY]))
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 2;
		}
		else
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		};
		B_GiveInvItems(self,other,ItWr_CorneliusTagebuch_Mis,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Cornelius_PICKPOCKET);
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

func void DIA_Cornelius_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Cornelius_PICKPOCKET);
};

