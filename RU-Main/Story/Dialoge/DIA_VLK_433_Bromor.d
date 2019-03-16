
instance DIA_Bromor_EXIT(C_Info)
{
	npc = VLK_433_Bromor;
	nr = 999;
	condition = DIA_Bromor_EXIT_Condition;
	information = DIA_Bromor_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bromor_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Bromor_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};

var int BromorFirstMeet;

instance DIA_Bromor_GIRLS(C_Info)
{
	npc = VLK_433_Bromor;
	nr = 2;
	condition = DIA_Bromor_GIRLS_Condition;
	information = DIA_Bromor_GIRLS_Info;
	permanent = TRUE;
	description = "Ты хозяин этого заведения?";
};

func int DIA_Bromor_GIRLS_Condition()
{
	if((NpcObsessedByDMT_Bromor == FALSE)	 && (BromorFirstMeet == FALSE))

	{
		return TRUE;
	};
};

func void DIA_Bromor_GIRLS_Info()
{
	if(Wld_IsTime(13,0,16,0) == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_Bromor_GIRLS_15_00");	//Ты хозяин этого заведения?
		AI_Output(self,other,"DIA_Bromor_GIRLS_07_02");	//Я Бромор! Это мой дом, а это мои девочки. Я люблю моих девочек.
		AI_Output(self,other,"DIA_Bromor_GIRLS_07_03");	//А если ты любишь моих девочек тоже, ты должен заплатить за это пятьдесят золотых монет.
		AI_Output(self,other,"DIA_Bromor_GIRLS_07_04");	//Смотри только, чтобы никаких проблем.
		BromorFirstMeet = TRUE;
	}
	else
	{
		B_Say(self,other,"$NOTNOW");
		AI_StopProcessInfos(self);
		Npc_SetRefuseTalk(self,300);
	};
};


instance DIA_Addon_Bromor_MissingPeople(C_Info)
{
	npc = VLK_433_Bromor;
	nr = 2;
	condition = DIA_Addon_Bromor_MissingPeople_Condition;
	information = DIA_Addon_Bromor_MissingPeople_Info;
	description = "С твоими девочками все в порядке?";
};


func int DIA_Addon_Bromor_MissingPeople_Condition()
{
	if((NpcObsessedByDMT_Bromor == FALSE) && (SC_HearedAboutMissingPeople == TRUE) && (BromorFirstMeet == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bromor_MissingPeople_Info()
{
	AI_Output(other,self,"DIA_Addon_Bromor_MissingPeople_15_00");	//С твоими девочками все в порядке?
	AI_Output(self,other,"DIA_Addon_Bromor_MissingPeople_07_01");	//Конечно! Или ты думаешь, что я хочу отправиться в тюрьму?
	AI_Output(other,self,"DIA_Addon_Bromor_MissingPeople_15_02");	//Я не спрашиваю об их здоровье. Я имел в виду, они все на месте. Или кого-то нет?!
	AI_Output(self,other,"DIA_Addon_Bromor_MissingPeople_07_03");	//Ааа...(задумчиво) Да, одна из моих девочек действительно пропала! Ее зовут Люсия.
	AI_Output(self,other,"DIA_Addon_Bromor_MissingPeople_07_04");	//Я даже обращался к людям из ополчения. Но они не нашли никаких ее следов.
	Log_CreateTopic(TOPIC_Addon_MissingPeople,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople,LOG_Running);
	B_LogEntry(TOPIC_Addon_MissingPeople,"Шлюха по имени Люсия пропала из борделя в гавани.");
};


instance DIA_Addon_Bromor_Lucia(C_Info)
{
	npc = VLK_433_Bromor;
	nr = 5;
	condition = DIA_Addon_Bromor_Lucia_Condition;
	information = DIA_Addon_Bromor_Lucia_Info;
	description = "Как долго не было Люсии?";
};


func int DIA_Addon_Bromor_Lucia_Condition()
{
	if((NpcObsessedByDMT_Bromor == FALSE) && (SC_HearedAboutMissingPeople == TRUE) && Npc_KnowsInfo(other,DIA_Addon_Bromor_MissingPeople))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bromor_Lucia_Info()
{
	AI_Output(other,self,"DIA_Addon_Bromor_Lucia_15_00");	//Как долго не было Люсии?
	AI_Output(self,other,"DIA_Addon_Bromor_Lucia_07_01");	//Несколько дней. Не знаю точно, сколько.
	AI_Output(self,other,"DIA_Addon_Bromor_Lucia_07_02");	//Полагаю, она сбежала с одним из своих поклонников.
	AI_Output(self,other,"DIA_Addon_Bromor_Lucia_07_03");	//Эта сучка кое-что с собой прихватила. Мое драгоценное золотое блюдо.
	AI_Output(self,other,"DIA_Addon_Bromor_Lucia_07_04");	//Если она попадет ко мне в руки, она поплатится!
	AI_Output(self,other,"DIA_Addon_Bromor_Lucia_07_05");	//Но тебе-то какое до этого дело? Ты что, хочешь надо мной посмеяться?
	Log_CreateTopic(TOPIC_Addon_BromorsGold,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BromorsGold,LOG_Running);
	B_LogEntry(TOPIC_Addon_BromorsGold,"Шлюха Люсия украла золотую чашу у своего босса, Бромора. Бромор хочет вернуть эту чашу назад.");
	MIS_Bromor_LuciaStoleGold = LOG_Running;
};


instance DIA_Addon_Bromor_LuciaGold(C_Info)
{
	npc = VLK_433_Bromor;
	nr = 5;
	condition = DIA_Addon_Bromor_LuciaGold_Condition;
	information = DIA_Addon_Bromor_LuciaGold_Info;
	permanent = TRUE;
	description = "Я нашел блюдо, которое украла Люсия.";
};


func int DIA_Addon_Bromor_LuciaGold_Condition()
{
	if((NpcObsessedByDMT_Bromor == FALSE) && (MIS_Bromor_LuciaStoleGold == LOG_Running) && Npc_HasItems(other,ItMi_BromorsGeld_Addon))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bromor_LuciaGold_Info()
{
	AI_Output(other,self,"DIA_Addon_Bromor_LuciaGold_15_00");	//Я нашел блюдо, которое украла Люсия.
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_07_01");	//Прекрасно, буду рад получить его назад.
	Info_ClearChoices(DIA_Addon_Bromor_LuciaGold);
	if(Bromor_Hausverbot == FALSE)
	{
		Info_AddChoice(DIA_Addon_Bromor_LuciaGold,"Как насчет награды?",DIA_Addon_Bromor_LuciaGold_lohn);
	};
	Info_AddChoice(DIA_Addon_Bromor_LuciaGold,"Вот блюдо.",DIA_Addon_Bromor_LuciaGold_einfachgeben);
	if(DIA_Addon_Bromor_LuciaGold_lucia_OneTime == FALSE)
	{
		Info_AddChoice(DIA_Addon_Bromor_LuciaGold,"Тебе не интересно, что случилось с Люсией?",DIA_Addon_Bromor_LuciaGold_lucia);
	};
};

func void DIA_Addon_Bromor_LuciaGold_einfachgeben()
{
	AI_Output(other,self,"DIA_Addon_Bromor_LuciaGold_einfachgeben_15_00");	//Вот блюдо.
	B_GiveInvItems(other,self,ItMi_BromorsGeld_Addon,1);
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_einfachgeben_07_01");	//Благодарю. Очень щедро с твоей стороны. Что-нибудь еще?
	MIS_Bromor_LuciaStoleGold = LOG_SUCCESS;
	Bromor_Hausverbot = FALSE;
	B_GivePlayerXP(XP_Addon_Bromor_LuciaGold);
	Info_ClearChoices(DIA_Addon_Bromor_LuciaGold);
};


var int DIA_Addon_Bromor_LuciaGold_lucia_OneTime;

func void DIA_Addon_Bromor_LuciaGold_lucia()
{
	AI_Output(other,self,"DIA_Addon_Bromor_LuciaGold_lucia_15_00");	//Тебе не интересно, что случилось с Люсией?
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_lucia_07_01");	//Нет. А зачем мне знать? Главное, что блюдо у меня.
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_lucia_07_02");	//Я обходился без Люсии все это время, обойдусь и дальше. Почему я должен пытаться ее вернуть?
	DIA_Addon_Bromor_LuciaGold_lucia_OneTime = TRUE;
};

func void DIA_Addon_Bromor_LuciaGold_lohn()
{
	AI_Output(other,self,"DIA_Addon_Bromor_LuciaGold_lohn_15_00");	//Как насчет награды?
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_lohn_07_01");	//Можешь бесплатно провести время с одной из моих девочек. Что скажешь?
	Info_ClearChoices(DIA_Addon_Bromor_LuciaGold);
	if(DIA_Addon_Bromor_LuciaGold_lucia_OneTime == FALSE)
	{
		Info_AddChoice(DIA_Addon_Bromor_LuciaGold,"Тебе не интересно, что случилось с Люсией?",DIA_Addon_Bromor_LuciaGold_lucia);
	};
	Info_AddChoice(DIA_Addon_Bromor_LuciaGold,"Этого недостаточно.",DIA_Addon_Bromor_LuciaGold_mehr);
	Info_AddChoice(DIA_Addon_Bromor_LuciaGold,"Согласен! Вот блюдо.",DIA_Addon_Bromor_LuciaGold_geben);
};

func void DIA_Addon_Bromor_LuciaGold_mehr()
{
	AI_Output(other,self,"DIA_Addon_Bromor_LuciaGold_mehr_15_00");	//Этого недостаточно.
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_mehr_07_01");	//Соглашайся, или можешь здесь больше не показываться.
	Info_AddChoice(DIA_Addon_Bromor_LuciaGold,"Забудь об этом.",DIA_Addon_Bromor_LuciaGold_nein);
};

func void DIA_Addon_Bromor_LuciaGold_nein()
{
	AI_Output(other,self,"DIA_Addon_Bromor_LuciaGold_nein_15_00");	//Забудь об этом.
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_nein_07_01");	//Тогда убирайся из моего заведения, скотина.
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_nein_07_02");	//И не думай, что тебя здесь когда-нибудь обслужат.
	Info_ClearChoices(DIA_Addon_Bromor_LuciaGold);
	Bromor_Hausverbot = TRUE;
	Bromor_Pay = 0;
};

func void DIA_Addon_Bromor_LuciaGold_geben()
{
	AI_Output(other,self,"DIA_Addon_Bromor_LuciaGold_geben_15_00");	//Согласен! Вот блюдо.
	B_GiveInvItems(other,self,ItMi_BromorsGeld_Addon,1);
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_geben_07_01");	//Благодарю. Иди к Наде. Она составит тебе компанию наверху.
	Bromor_Pay = TRUE;
	NadjaIsUp = FALSE;
	Nadja_Nacht = FALSE;
	MIS_Bromor_LuciaStoleGold = LOG_SUCCESS;
	Bromor_Hausverbot = FALSE;
	B_GivePlayerXP(XP_Addon_Bromor_LuciaGold);
	Info_ClearChoices(DIA_Addon_Bromor_LuciaGold);
};


instance DIA_Bromor_Pay(C_Info)
{
	npc = VLK_433_Bromor;
	nr = 2;
	condition = DIA_Bromor_Pay_Condition;
	information = DIA_Bromor_Pay_Info;
	permanent = TRUE;
	description = "Я хочу развлечься. (Цена: 50 золотых монет)";
};

func int DIA_Bromor_Pay_Condition()
{
	if((Bromor_Pay == FALSE) && (Bromor_Hausverbot == FALSE) && (BromorFirstMeet == TRUE) && (NpcObsessedByDMT_Bromor == FALSE) && (Npc_IsDead(Nadja) == FALSE))
	{
		return TRUE;
	};
};


var int DIA_Bromor_Pay_OneTime;

func void DIA_Bromor_Pay_Info()
{
	AI_Output(other,self,"DIA_Bromor_Pay_15_00");	//Я хочу развлечься.

	if(B_GiveInvItems(other,self,ItMi_Gold,50))
	{
		AI_Output(self,other,"DIA_Bromor_Pay_07_01");	//Отлично! Ты долго не забудешь следующие несколько часов твоей жизни.
		AI_Output(self,other,"DIA_Bromor_Pay_07_02");	//Иди наверх с Надей! Удачи.

		if(DIA_Bromor_Pay_OneTime == FALSE)
		{
			DIA_Bromor_Pay_OneTime = TRUE;
		};

		Bromor_Pay = TRUE;
		NadjaIsUp = FALSE;
	}
	else
	{
		AI_Output(self,other,"DIA_Bromor_Pay_07_03");	//Я не выношу, когда кто-нибудь пытается надуть меня! Убирайся отсюда, если не можешь заплатить.
	};

	B_NpcClearObsessionByDMT(self);
};


instance DIA_Bromor_DOPE(C_Info)
{
	npc = VLK_433_Bromor;
	nr = 3;
	condition = DIA_Bromor_DOPE_Condition;
	information = DIA_Bromor_DOPE_Info;
	permanent = FALSE;
	description = "А могу я рассчитывать на 'особые' услуги, а?";
};

func int DIA_Bromor_DOPE_Condition()
{
	if((MIS_Andre_REDLIGHT == LOG_Running) && (NpcObsessedByDMT_Bromor == FALSE) && (Bromor_Hausverbot == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bromor_DOPE_Info()
{
	AI_Output(other,self,"DIA_Bromor_DOPE_15_00");	//А могу я рассчитывать на 'особые' услуги, а?
	AI_Output(self,other,"DIA_Bromor_DOPE_07_01");	//Конечно, все мои девочки особенные!
	AI_Output(self,other,"DIA_Bromor_DOPE_07_02");	//Если у тебя есть деньги, ты можешь пойти наверх с Надей.
};

instance DIA_Bromor_Obsession(C_Info)
{
	npc = VLK_433_Bromor;
	nr = 30;
	condition = DIA_Bromor_Obsession_Condition;
	information = DIA_Bromor_Obsession_Info;
	description = "Все в порядке?";
};


func int DIA_Bromor_Obsession_Condition()
{
	if((Kapitel >= 3) && (NpcObsessedByDMT_Bromor == FALSE) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

var int DIA_Bromor_Obsession_GotMoney;

func void DIA_Bromor_Obsession_Info()
{
	B_NpcObsessedByDMT(self);
};


instance DIA_Bromor_Heilung(C_Info)
{
	npc = VLK_433_Bromor;
	nr = 55;
	condition = DIA_Bromor_Heilung_Condition;
	information = DIA_Bromor_Heilung_Info;
	permanent = TRUE;
	description = "Ты одержим.";
};


func int DIA_Bromor_Heilung_Condition()
{
	if((NpcObsessedByDMT_Bromor == TRUE) && (NpcObsessedByDMT == FALSE) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Bromor_Heilung_Info()
{
	AI_Output(other,self,"DIA_Bromor_Heilung_15_00");	//Ты одержим.
	AI_Output(self,other,"DIA_Bromor_Heilung_07_01");	//Что? О чем это ты? Убирайся отсюда.
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Bromor_PICKPOCKET(C_Info)
{
	npc = VLK_433_Bromor;
	nr = 900;
	condition = DIA_Bromor_PICKPOCKET_Condition;
	information = DIA_Bromor_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(Попытаться украсть его ключ)";
};

func int DIA_Bromor_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) >= 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (Npc_HasItems(self,ItKe_Bromor) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Bromor_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Bromor_PICKPOCKET);
	Info_AddChoice(DIA_Bromor_PICKPOCKET,Dialog_Back,DIA_Bromor_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Bromor_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Bromor_PICKPOCKET_DoIt);
};

func void DIA_Bromor_PICKPOCKET_DoIt()
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
		B_GiveInvItems(self,other,ItKe_Bromor,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Bromor_PICKPOCKET);
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

func void DIA_Bromor_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Bromor_PICKPOCKET);
};

instance DIA_Bromor_AskForWoman(C_Info)
{
	npc = VLK_433_Bromor;
	nr = 2;
	condition = DIA_Bromor_AskForWoman_Condition;
	information = DIA_Bromor_AskForWoman_Info;
	permanent = FALSE;
	description = "У меня есть особенный заказ!";
};

func int DIA_Bromor_AskForWoman_Condition()
{
	if((MIS_WomanForSkip == LOG_Running)  && (BromorFirstMeet == TRUE) && (NpcObsessedByDMT_Bromor == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bromor_AskForWoman_Info()
{
	AI_Output(other,self,"DIA_Bromor_AskForWoman_01_01");	//У меня есть особенный заказ!

	if(Npc_IsDead(VLK_436_Sonja) == FALSE)
	{
		AI_Output(self,other,"DIA_Bromor_AskForWoman_01_02");	//(улыбаясь) Ты хочешь сразу двоих? Или, быть может, троих?
		AI_Output(self,other,"DIA_Bromor_AskForWoman_01_03");	//Мне жаль, но у меня сейчас нет столько свободных пташек.
		AI_Output(other,self,"DIA_Bromor_AskForWoman_01_04");	//Нет, мне нужна одна, но на три дня.
		AI_Output(self,other,"DIA_Bromor_AskForWoman_01_05");	//Да нет проблем! (смеется) Хоть неделю не выходи из моего заведения! Я буду только рад.
		AI_Output(other,self,"DIA_Bromor_AskForWoman_01_06");	//Ну, вообще-то, я хочу забрать одну из твоих девочек с собой.
		AI_Output(other,self,"DIA_Bromor_AskForWoman_01_07");	//Но обещаю вернуть ее в целости и сохранности!
		AI_Output(self,other,"DIA_Bromor_AskForWoman_01_08");	//(удивленно) Да, твоя просьба действительно необычна! Однако и это не проблема.
		AI_Output(self,other,"DIA_Bromor_AskForWoman_01_09");	//Просто придется заплатить больше! И тогда она твоя.
		AI_Output(other,self,"DIA_Bromor_AskForWoman_01_10");	//Сколько ты хочешь?
		AI_Output(self,other,"DIA_Bromor_AskForWoman_01_11");	//Дай мне подумать. Три дня по полсотни золотых... Это у нас получается сто пятьдесят монет.
		AI_Output(self,other,"DIA_Bromor_AskForWoman_01_12");	//За работу вне стен моего заведения я беру двойной тариф! И это уже выходит триста золотых.
		AI_Output(self,other,"DIA_Bromor_AskForWoman_01_13");	//Тот риск, что девушка пострадает или не вернется, будет стоить тебе еще семь сотен монет.
		AI_Output(self,other,"DIA_Bromor_AskForWoman_01_14");	//Так что...(считая) На двух тысячах золотых мы с тобой вполне сойдемся!
		Info_ClearChoices(DIA_Bromor_AskForWoman);

		if(RhetorikSkillValue[1] >= 20)
		{
			Info_AddChoice(DIA_Bromor_AskForWoman,"У тебя очень странный счет!",DIA_Bromor_AskForWoman_Yes);
		};

		Info_AddChoice(DIA_Bromor_AskForWoman,"Не слишком ли дорого?",DIA_Bromor_AskForWoman_No);
	}
	else
	{
		AI_Output(self,other,"DIA_Bromor_AskForWoman_01_15");	//Извини. Одна из моих девочек мертва.
		AI_Output(self,other,"DIA_Bromor_AskForWoman_01_16");	//Так что мне сейчас не до особенных заказов.
		SonyaNoGoWithMe = TRUE;
	};
};



func void DIA_Bromor_AskForWoman_Yes()
{
	AI_Output(other,self,"DIA_Bromor_AskForWoman_Yes_01_01");	//У тебя очень странный счет!
	AI_Output(self,other,"DIA_Bromor_AskForWoman_Yes_01_02");	//Правда?
	AI_Output(other,self,"DIA_Bromor_AskForWoman_Yes_01_03");	//Я насчитал всего лишь тысячу золотых.
	AI_Output(self,other,"DIA_Bromor_AskForWoman_Yes_01_04");	//Ах, да...(невинно) Я просто забыл еще упомянуть про небольшой налог ополчению.
	AI_Output(self,other,"DIA_Bromor_AskForWoman_Yes_01_05");	//А то мало ли, вдруг возникнут какие-нибудь проблемы.
	AI_Output(other,self,"DIA_Bromor_AskForWoman_Yes_01_06");	//С ополчением разбирайся сам! Меня сюда не приплетай.
	AI_Output(other,self,"DIA_Bromor_AskForWoman_Yes_01_07");	//Так что я плачу тебе ровно тысячу монет - и девка моя.
	AI_Output(self,other,"DIA_Bromor_AskForWoman_Yes_01_08");	//Эх... Ладно, по рукам. Но деньги вперед!

	if(RhetorikSkillValue[1] < 100)
	{
		RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
		AI_Print("Риторика + 1");
	};

	B_LogEntry(TOPIC_WomanForSkip,"Бромор согласился отдать мне одну из своих девочек за одну тысячу монет.");
	BromorDisCount_01 = TRUE;
};

func void DIA_Bromor_AskForWoman_No()
{
	AI_Output(other,self,"DIA_Bromor_AskForWoman_No_01_01");	//Не слишком ли дорого?
	AI_Output(self,other,"DIA_Bromor_AskForWoman_No_01_02");	//Это мои условия! Если не хочешь, можешь не платить.
	AI_Output(self,other,"DIA_Bromor_AskForWoman_No_01_03");	//Но и про мою девочку тоже тогда забудь.
	B_LogEntry(TOPIC_WomanForSkip,"Бромор согласился отдать мне одну из своих девочек за две тысячи монет.");
	BromorDisCount_02 = TRUE;
};

instance DIA_Bromor_AskForWoman_Pay(C_Info)
{
	npc = VLK_433_Bromor;
	nr = 2;
	condition = DIA_Bromor_AskForWoman_Pay_Condition;
	information = DIA_Bromor_AskForWoman_Pay_Info;
	permanent = TRUE;
	description = "Вот твое золото.";
};

func int DIA_Bromor_AskForWoman_Pay_Condition()
{
	if((MIS_WomanForSkip == LOG_Running) && (SonyaGoWithMe == FALSE) && (SonyaNoGoWithMe == FALSE) && ((BromorDisCount_01 == TRUE) || (BromorDisCount_02 == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Bromor_AskForWoman_Pay_Info()
{
	AI_Output(other,self,"DIA_Bromor_AskForWoman_Pay_01_01");	//Вот твое золото.
	
	if(Npc_IsDead(VLK_436_Sonja) == TRUE)
	{
		AI_Output(self,other,"DIA_Bromor_AskForWoman_Pay_01_02");	//Одна из моих девочек мертва! Так что наш договор отменяется.
		B_LogEntry(TOPIC_WomanForSkip,"Бромор отказался от сделки, поскольку одна из его девушек мертва.");
		SonyaNoGoWithMe = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		if(BromorDisCount_01 == TRUE)
		{
			if(Npc_HasItems(hero,ItMi_Gold) >= 1000)
			{
				B_GivePlayerXP(100);
				B_GiveInvItems(other,self,ItMi_Gold,1000);
				Npc_RemoveInvItems(self,ItMi_Gold,1000);
				AI_Output(self,other,"DIA_Bromor_AskForWoman_Pay_01_03");	//Отлично! Тогда можешь взять с собой Соню.
				AI_Output(self,other,"DIA_Bromor_AskForWoman_Pay_01_04");	//Только смотри, верни ее в срок! Иначе я подниму тревогу.
				B_LogEntry(TOPIC_WomanForSkip,"Теперь я могу взять Соню с собой. Нужно не забыть вернуть ее Бромору в срок.");	
				SonyaGoWithMe = TRUE;
				SonyaGoWithMeDay = Wld_GetDay();
				AI_StopProcessInfos(self);
			}
			else
			{
				AI_Print(Print_NotEnoughGold);
				AI_Output(self,other,"DIA_Bromor_Pay_07_03");	//Я не выношу, когда кто-нибудь пытается надуть меня! Убирайся отсюда, если не можешь заплатить.
				AI_StopProcessInfos(self);
			};
		}
		else if(BromorDisCount_02 == TRUE)
		{
			if(Npc_HasItems(hero,ItMi_Gold) >= 2000)
			{
				B_GivePlayerXP(100);
				B_GiveInvItems(other,self,ItMi_Gold,2000);
				Npc_RemoveInvItems(self,ItMi_Gold,2000);
				AI_Output(self,other,"DIA_Bromor_AskForWoman_Pay_01_03");	//Отлично! Тогда можешь взять с собой Соню.
				AI_Output(self,other,"DIA_Bromor_AskForWoman_Pay_01_04");	//Только смотри, верни ее в срок! Иначе я подниму тревогу.
				B_LogEntry(TOPIC_WomanForSkip,"Теперь я могу взять Соню с собой. Нужно не забыть вернуть ее Бромору в срок.");	
				SonyaGoWithMe = TRUE;
				SonyaGoWithMeDay = Wld_GetDay();
				AI_StopProcessInfos(self);
			}
			else
			{
				AI_Print(Print_NotEnoughGold);
				AI_Output(self,other,"DIA_Bromor_Pay_07_03");	//Я не выношу, когда кто-нибудь пытается надуть меня! Убирайся отсюда, если не можешь заплатить.
				AI_StopProcessInfos(self);
			};
		}
		else
		{
			AI_Print(Print_NotEnoughGold);
			AI_Output(self,other,"DIA_Bromor_Pay_07_03");	//Я не выношу, когда кто-нибудь пытается надуть меня! Убирайся отсюда, если не можешь заплатить.
			AI_StopProcessInfos(self);
		};
	};
};

instance DIA_Bromor_AskForWoman_Back(C_Info)
{
	npc = VLK_433_Bromor;
	nr = 2;
	condition = DIA_Bromor_AskForWoman_Back_Condition;
	information = DIA_Bromor_AskForWoman_Back_Info;
	permanent = FALSE;
	description = "Я вернул Соню.";
};

func int DIA_Bromor_AskForWoman_Back_Condition()
{
	if((MIS_WomanForSkip == LOG_Running) && (SonyaBackOk == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Bromor_AskForWoman_Back_Info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Bromor_AskForWoman_Back_01_01");	//Я вернул Соню.
	AI_Output(self,other,"DIA_Bromor_AskForWoman_Back_01_02");	//Хорошо! Если вдруг что-нибудь еще понадобится, то обращайся.
	MIS_WomanForSkip = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_WomanForSkip,LOG_SUCCESS);
	B_LogEntry(TOPIC_WomanForSkip,"Я привел Соню обратно в бордель.");
};

instance DIA_Bromor_AskForWoman_BadBack(C_Info)
{
	npc = VLK_433_Bromor;
	nr = 2;
	condition = DIA_Bromor_AskForWoman_BadBack_Condition;
	information = DIA_Bromor_AskForWoman_BadBack_Info;
	permanent = FALSE;
	description = "Я вернул Соню.";
};

func int DIA_Bromor_AskForWoman_BadBack_Condition()
{
	if((MIS_WomanForSkip == LOG_Running) && (SonyaBackOkNot == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Bromor_AskForWoman_BadBack_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Bromor_AskForWoman_BadBack_01_01");	//Я вернул Соню.
	AI_Output(self,other,"DIA_Bromor_AskForWoman_BadBack_01_02");	//Постой! Вроде разговор шел только о трех днях.
	AI_Output(self,other,"DIA_Bromor_AskForWoman_BadBack_01_03");	//А прошло гораздо больше!
	AI_Output(other,self,"DIA_Bromor_AskForWoman_BadBack_01_04");	//Ну и что с того?
	AI_Output(self,other,"DIA_Bromor_AskForWoman_BadBack_01_05");	//А вот что...
	MIS_WomanForSkip = LOG_FAILED;
	B_LogEntry_Failed(TOPIC_WomanForSkip);
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};