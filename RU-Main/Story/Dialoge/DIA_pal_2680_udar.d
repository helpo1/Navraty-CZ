
instance DIA_PAL_2680_UDAR_EXIT(C_Info)
{
	npc = pal_2680_udar;
	nr = 999;
	condition = dia_pal_2680_udar_exit_condition;
	information = dia_pal_2680_udar_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_2680_udar_exit_condition()
{
	return TRUE;
};

func void dia_pal_2680_udar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_2680_UDAR_TEACH(C_Info)
{
	npc = pal_2680_udar;
	nr = 3;
	condition = dia_pal_2680_udar_teach_condition;
	information = dia_pal_2680_udar_teach_info;
	permanent = TRUE;
	description = "Я хочу учиться у тебя.";
};


func int dia_pal_2680_udar_teach_condition()
{
	if(Udar_TeachPlayer == TRUE)
	{
		return TRUE;
	};
};

func void dia_pal_2680_udar_teach_info()
{
	AI_Output(other,self,"DIA_Udar_Teach_15_00");	//Я хочу учиться у тебя.
	AI_Output(self,other,"DIA_Udar_Teach_09_01");	//Ладно, учись!
	Info_ClearChoices(DIA_PAL_2680_UDAR_TEACH);
	Info_AddChoice(dia_pal_2680_udar_teach,Dialog_Back,dia_pal_2680_udar_teach_back);
	Info_AddChoice(dia_pal_2680_udar_teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),dia_pal_2680_udar_teach_crossbow_1);
	Info_AddChoice(dia_pal_2680_udar_teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),dia_pal_2680_udar_teach_crossbow_5);
};

func void dia_pal_2680_udar_teach_back()
{
	Info_ClearChoices(DIA_PAL_2680_UDAR_TEACH);
};

func void dia_pal_2680_udar_teachnomore1()
{
	AI_Output(self,other,"B_Udar_TeachNoMore1_09_00");	//Ты уже знаешь основы - на большее у нас нет времени.
};

func void dia_pal_2680_udar_teachnomore2()
{
	AI_Output(self,other,"B_Udar_TeachNoMore2_09_00");	//Чтобы улучшить владение этим оружием, тебе лучше поискать более подходящего учителя.
};

func void dia_pal_2680_udar_teach_crossbow_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,1,60);
	if(other.HitChance[NPC_TALENT_CROSSBOW] >= 60)
	{
		dia_pal_2680_udar_teachnomore1();
		if(Npc_GetTalentSkill(other,NPC_TALENT_CROSSBOW) == 1)
		{
			dia_pal_2680_udar_teachnomore2();
		};
	};
	Info_AddChoice(dia_pal_2680_udar_teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),dia_pal_2680_udar_teach_crossbow_1);
};

func void dia_pal_2680_udar_teach_crossbow_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,5,60);
	if(other.HitChance[NPC_TALENT_CROSSBOW] >= 60)
	{
		dia_pal_2680_udar_teachnomore1();
		if(Npc_GetTalentSkill(other,NPC_TALENT_CROSSBOW) == 1)
		{
			dia_pal_2680_udar_teachnomore2();
		};
	};
	Info_AddChoice(dia_pal_2680_udar_teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),dia_pal_2680_udar_teach_crossbow_5);
};


instance DIA_PAL_2680_UDAR_PERM(C_Info)
{
	npc = pal_2680_udar;
	nr = 1;
	condition = dia_pal_2680_udar_perm_condition;
	information = dia_pal_2680_udar_perm_info;
	permanent = FALSE;
	description = "Ты выглядишь немного усталым.";
};


func int dia_pal_2680_udar_perm_condition()
{
	return TRUE;
};

func void dia_pal_2680_udar_perm_info()
{
	AI_Output(other,self,"DIA_PAL_2680_Udar_Perm_01_00");	//Ты выглядишь немного усталым.
	AI_Output(self,other,"DIA_PAL_2680_Udar_Perm_01_01");	//Да, есть немного. Последние стычки с орками меня окончательно измотали.
	AI_Output(self,other,"DIA_PAL_2680_Udar_Perm_01_02");	//Но я стараюсь об этом не думать, поскольку шанс немного передохнуть нам представиться еще не очень скоро.
};


instance DIA_PAL_2680_UDAR_NATAN(C_Info)
{
	npc = pal_2680_udar;
	nr = 2;
	condition = dia_pal_2680_udar_natan_condition;
	information = dia_pal_2680_udar_natan_info;
	permanent = FALSE;
	description = "Ты уже говорил с Натаном?";
};


func int dia_pal_2680_udar_natan_condition()
{
	if(MIS_NATANDOLG == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_pal_2680_udar_natan_info()
{
	AI_Output(other,self,"DIA_PAL_2680_Udar_Natan_01_00");	//Ты уже говорил с Натаном?
	if(Npc_IsDead(pal_91680_natan))
	{
		B_GivePlayerXP(100);
		AI_Output(self,other,"DIA_PAL_2680_Udar_Natan_01_01");	//Как видишь, к сожалению я не успел этого сделать.
		AI_Output(self,other,"DIA_PAL_2680_Udar_Natan_01_02");	//Теперь он мертв, и все из-за этого глупого долга чести, который он поклялся вернуть мне любой ценой.
		AI_Output(self,other,"DIA_PAL_2680_Udar_Natan_01_08");	//Он выполнил то, что хотел. Только цена для него оказалось слишком высока.
		AI_Output(self,other,"DIA_PAL_2680_Udar_Natan_01_09");	//(расстроенно) И я, к сожалению, уже ничего не могу изменить.
		AI_Output(other,self,"DIA_PAL_2680_Udar_Natan_01_10");	//Понимаю.
		MIS_NATANDOLG = LOG_FAILED;
		B_LogEntry_Failed(TOPIC_NATANDOLG);
	}
	else
	{
		B_GivePlayerXP(200);
		AI_Output(self,other,"DIA_PAL_2680_Udar_Natan_01_11");	//Как видишь, мне пока было не до этого. (улыбается) Но не волнуйся, я обязательно поговорю с ним.
		AI_Output(self,other,"DIA_PAL_2680_Udar_Natan_01_12");	//Он все-таки умудрился вернуть мне свой долг чести. (посмеивается)
		AI_Output(other,self,"DIA_PAL_2680_Udar_Natan_01_14");	//Да, это так, однако думаю, что сам он так не считает.
		AI_Output(self,other,"DIA_PAL_2680_Udar_Natan_01_15");	//Эх...(расстроенно) Неужели он полагает, что должен перебить для меня армию орков?
		AI_Output(other,self,"DIA_PAL_2680_Udar_Natan_01_17");	//Может быть, я смогу тебе помочь убедить его?
		AI_Output(self,other,"DIA_PAL_2680_Udar_Natan_01_18");	//Хммм...(задумчиво) Возможно, у меня действительно тут появилась одна очень неплохая идея.
		AI_Output(other,self,"DIA_PAL_2680_Udar_Natan_01_20");	//И что ты задумал?
		AI_Output(self,other,"DIA_PAL_2680_Udar_Natan_01_21");	//Я думаю устроить все так, чтобы у Натана появилась возможность спасти мне жизнь. И ты как раз бы мог мне в этом помочь.
		AI_Output(other,self,"DIA_PAL_2680_Udar_Natan_01_22");	//Каким образом?
		AI_Output(self,other,"DIA_PAL_2680_Udar_Natan_01_23");	//Хммм...(задумался) Я устрою засаду небольшому отряду орков. И просто для начала вступлю с ними в бой.
		AI_Output(self,other,"DIA_PAL_2680_Udar_Natan_01_24");	//Однако со стороны все будет выглядеть несколько иначе! Покажется, что это они сами загнали меня в ловушку.
		AI_Output(self,other,"DIA_PAL_2680_Udar_Natan_01_25");	//В этот момент ты и должен будешь появиться вместе с Натаном, чтобы помочь мне.
		AI_Output(other,self,"DIA_PAL_2680_Udar_Natan_01_26");	//Но это же чертовски опасно! Ты не боишься, что когда мы подоспеем к тебе на помощь, может быть уже слишком поздно?
		AI_Output(self,other,"DIA_PAL_2680_Udar_Natan_01_27");	//Не волнуйся...(улыбается) Несколько орков для меня вовсе не проблема.
		AI_Output(other,self,"DIA_PAL_2680_Udar_Natan_01_29");	//И ты хочешь, чтобы эх убил Натан?
		AI_Output(self,other,"DIA_PAL_2680_Udar_Natan_01_30");	//Все верно! В этом и заключается мой план. Так ты мне поможешь?
		AI_Output(other,self,"DIA_PAL_2680_Udar_Natan_01_31");	//Ладно, договорились! Только обозначь точное место, где ты собираешься устроить эту засаду.
		AI_Output(other,self,"DIA_PAL_2680_Udar_Natan_01_32");	//Не буду же я бегать по всему Хоринису в твоих поисках.
		AI_Output(self,other,"DIA_PAL_2680_Udar_Natan_01_33");	//Хммм, хороший вопрос. Полагаю, что небольшое полесье к востоку от таверны Орлана вполне для этого подойдет.
		AI_Output(self,other,"DIA_PAL_2680_Udar_Natan_01_34");	//Кажется, там есть одна небольшая пещера, где можно будет спрятаться. Да и дорога, проходящая вдоль этого места, наверняка сейчас занята орками.
		AI_Output(self,other,"DIA_PAL_2680_Udar_Natan_01_37");	//Я отправлюсь туда прямо сейчас и буду выжидать появления какого-нибудь небольшого отряда орков.
		AI_Output(self,other,"DIA_PAL_2680_Udar_Natan_01_38");	//А ты, соответственно, постарайся отвлечь Натана разговором, чтобы дать мне возможность на подготовку.
		AI_Output(other,self,"DIA_PAL_2680_Udar_Natan_01_39");	//Хорошо, я все понял.
		B_LogEntry(TOPIC_NATANDOLG,"У Удара появилась идея, как можно помочь паладину Натану выполнить свою клятву, хотя и не совсем честная. Удар хочет устроить засаду на небольшой отряд орков и вступить с ними в 'неравный' бой. После чего я должен буду подоспеть вместе с Натаном ему на помощь. По мнению Удара, этого хватит, чтобы после убедить Натана в том, что отныне его не связывает данный им обет чести.");
		Log_AddEntry(TOPIC_NATANDOLG,"Теперь мне надо поговорить с самим Натаном и дать возможность Удару подготовиться к засаде. Он будет ждать нас недалеко от таверны Орлана, в небольшом лесу напротив одной из пещер.");
		AI_StopProcessInfos(self);
		UDARORCSTRAP = TRUE;
		self.aivar[93] = TRUE;
		Npc_ExchangeRoutine(self,"OrcsTrap");
	};
};


instance DIA_PAL_2680_UDAR_NATANDOLGDONE(C_Info)
{
	npc = pal_2680_udar;
	nr = 1;
	condition = dia_pal_2680_udar_natandolgdone_condition;
	information = dia_pal_2680_udar_natandolgdone_info;
	permanent = FALSE;
	description = "Что скажешь?";
};


func int dia_pal_2680_udar_natandolgdone_condition()
{
	if(MIS_NATANDOLG == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_pal_2680_udar_natandolgdone_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_PAL_2680_Udar_NatanDolgDone_01_00");	//Что скажешь?
	AI_Output(self,other,"DIA_PAL_2680_Udar_NatanDolgDone_01_01");	//(улыбается) Наша хитрость вполне удалась.
	AI_Output(self,other,"DIA_PAL_2680_Udar_NatanDolgDone_01_02");	//Теперь на Натана постоянно не будет давить необходимость спасти мне жизнь.
	AI_Output(self,other,"DIA_PAL_2680_Udar_NatanDolgDone_01_05");	//Спасибо, что помог мне в этом деле.
	AI_Output(self,other,"DIA_PAL_2680_Udar_NatanDolgDone_01_06");	//Вот - прими от меня в качестве благодарности эту вещицу. Думаю, она тебе пригодится!
	B_GiveInvItems(self,other,itri_udargift,1);
	AI_Output(other,self,"DIA_PAL_2680_Udar_NatanDolgDone_01_07");	//Спасибо.
	AI_StopProcessInfos(self);
	self.aivar[93] = FALSE;
	Npc_ExchangeRoutine(self,"Start");
	Npc_ExchangeRoutine(pal_2500_garond,"Start");
	Npc_ExchangeRoutine(pal_2510_oric,"Start");
	Npc_ExchangeRoutine(pal_2520_parcival,"Start");
	Npc_ExchangeRoutine(pal_2170_marcos,"Start");
	Npc_ExchangeRoutine(pal_75230_albert,"Start");
	Npc_ExchangeRoutine(pal_75180_ritter,"Start");
	Npc_ExchangeRoutine(pal_75190_ritter,"Start");
	Npc_ExchangeRoutine(pal_75200_ritter,"Start");
	Npc_ExchangeRoutine(pal_75210_ritter,"Start");
	Npc_ExchangeRoutine(pal_75220_ritter,"Start");
	Npc_ExchangeRoutine(pal_75240_ritter,"Start");
	Npc_ExchangeRoutine(pal_2530_wache,"Start");
	Npc_ExchangeRoutine(pal_2570_ritter,"Start");
	Npc_ExchangeRoutine(pal_91650_ritter,"Start");
	Npc_ExchangeRoutine(pal_91660_ritter,"Start");
	Npc_ExchangeRoutine(pal_91670_ritter,"Start");
};

