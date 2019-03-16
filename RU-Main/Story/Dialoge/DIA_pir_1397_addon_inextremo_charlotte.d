
instance DIA_ADDON_INEXTREMO_CHARLOTTE_EXIT(C_Info)
{
	npc = pir_1397_addon_inextremo_charlotte;
	nr = 999;
	condition = dia_addon_inextremo_charlotte_exit_condition;
	information = dia_addon_inextremo_charlotte_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_addon_inextremo_charlotte_exit_condition()
{
	return TRUE;
};

func void dia_addon_inextremo_charlotte_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_INEXTREMO_CHARLOTTE_PICKPOCKET(C_Info)
{
	npc = pir_1397_addon_inextremo_charlotte;
	nr = 900;
	condition = dia_addon_inextremo_charlotte_pickpocket_condition;
	information = dia_addon_inextremo_charlotte_pickpocket_info;
	permanent = TRUE;
	description = Pickpocket_60_Female;
};


func int dia_addon_inextremo_charlotte_pickpocket_condition()
{
	return C_Beklauen(118,300);
};

func void dia_addon_inextremo_charlotte_pickpocket_info()
{
	Info_ClearChoices(dia_addon_inextremo_charlotte_pickpocket);
	Info_AddChoice(dia_addon_inextremo_charlotte_pickpocket,Dialog_Back,dia_addon_inextremo_charlotte_pickpocket_back);
	Info_AddChoice(dia_addon_inextremo_charlotte_pickpocket,DIALOG_PICKPOCKET,dia_addon_inextremo_charlotte_pickpocket_doit);
};

func void dia_addon_inextremo_charlotte_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 50)
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
			BELIARPRAYCOUNT = BELIARPRAYCOUNT + 1;
		}
		else
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
			BELIARPRAYCOUNT = BELIARPRAYCOUNT + 2;
		};
		B_GiveInvItems(self,other,ItMi_Gold,100);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		BELIARPRAYCOUNT = BELIARPRAYCOUNT + 1;
		B_GiveThiefXP();
		Info_ClearChoices(dia_lord_hagen_pickpocket);
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

func void dia_addon_inextremo_charlotte_pickpocket_back()
{
	Info_ClearChoices(dia_addon_inextremo_charlotte_pickpocket);
};


instance DIA_ADDON_INEXTREMO_CHARLOTTE_HI(C_Info)
{
	npc = pir_1397_addon_inextremo_charlotte;
	nr = 1;
	condition = dia_addon_inextremo_charlotte_hi_condition;
	information = dia_addon_inextremo_charlotte_hi_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_addon_inextremo_charlotte_hi_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_charlotte_hi_info()
{
	if(BEKILLMASTER == TRUE)
	{
		if(KILLMEMBER5 == FALSE)
		{
			Snd_Play("LevelUp");
			hero.exp = hero.exp + 500;
			AI_NoticePrint(3000,4098,NAME_Addon_KillerBonus);
			KillerBonus = TRUE;
			AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_Hi_01_00");	//Так, так. И кто это у нас здесь?
			AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_Hi_01_01");	//Честно говоря, я рада, что ты смог справиться с Асмалом. Нам он всем не очень-то и нравился.
			AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_Hi_01_02");	//Ну, если только Лютеру. Хотя, по большому счету, этому парню вообще все равно, кто у руля. (смеется)
			AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_Hi_01_03");	//Так что прими мои поздравления! Думаю, из тебя получится неплохой глава гильдии.
			AI_Output(other,self,"DIA_Addon_InExtremo_Charlotte_Hi_01_04");	//Спасибо!
			KILLMEMBER5 = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_Hi_01_05");	//Чем порадуешь на этот раз?
		};
	}
	else if(Wld_IsTime(8,30,19,30))
	{
		if(IS_INEXTREMO_PLAYING_DONE == FALSE)
		{
			if((MIS_JESPERMUSIC == LOG_Running) && (MSINEXTREMO == FALSE))
			{
				Info_ClearChoices(dia_addon_inextremo_charlotte_hi);
				Info_AddChoice(dia_addon_inextremo_charlotte_hi,"Сыграйте что-нибудь веселенькое! (Цена: 100 монет)",dia_addon_inextremo_charlotte_hi_doit);
			}
			else
			{
				AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_Hi_01_07");	//Отстань!
				AI_StopProcessInfos(self);
				Npc_SetRefuseTalk(self,300);
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_Hi_01_07");	//Отстань!
			AI_StopProcessInfos(self);
			Npc_SetRefuseTalk(self,300);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_Hi_01_08");	//Отстань!
		AI_StopProcessInfos(self);
		Npc_SetRefuseTalk(self,300);
	};
};

func void dia_addon_inextremo_charlotte_hi_back()
{
	AI_StopProcessInfos(self);
};

func void dia_addon_inextremo_charlotte_hi_doit()
{
	var C_Npc MusHer;

	MusHer = Hlp_GetNpc(pir_1398_addon_inextremo_announcer);

	if(Npc_HasItems(hero,ItMi_Gold) >= 100)
	{
		B_TurnToNpc(self,MusHer);
		AI_Output(self,other,"dia_addon_inextremo_charlotte_hi_doit_01_00");	//(улыбаясь) Конечно. Эй, ребята! У нас заказ... Что-нибудь веселенькое!
		B_TurnToNpc(self,hero);
		AI_Output(self,other,"dia_addon_inextremo_charlotte_hi_doit_01_01");	//Cейчас все будет...
		Npc_RemoveInvItems(other,ItMi_Gold,100);
		IS_INEXTREMO_PLAYING = TRUE;
		IS_INEXTREMO_PLAYING_DONE = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"dia_addon_inextremo_charlotte_hi_doit_01_02");	//А золото где? Если нет золота, то нет и музыки.
		AI_StopProcessInfos(self);
	};
};

instance DIA_ADDON_INEXTREMO_CHARLOTTE_WhatNext(C_Info)
{
	npc = pir_1397_addon_inextremo_charlotte;
	nr = 1;
	condition = dia_addon_inextremo_charlotte_WhatNext_condition;
	information = dia_addon_inextremo_charlotte_WhatNext_info;
	permanent = FALSE;
	description = "Что будем делать дальше?";
};

func int dia_addon_inextremo_charlotte_WhatNext_condition()
{
	if((BEKILLMASTER == TRUE) && (KILLMEMBER5 == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_charlotte_WhatNext_info()
{
	AI_Output(other,self,"DIA_Addon_InExtremo_Charlotte_WhatNext_01_01");	//Что будем делать дальше?
	AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_WhatNext_01_02");	//Не знаю. Ты теперь тут босс.
	AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_WhatNext_01_03");	//Но, будь я на твоем месте, то прежде всего я бы подыскала для нас новое укромное местечко.
	AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_WhatNext_01_04");	//Здесь оставаться опасно. Кругом полно диких тварей, да и мы тут как на ладони.
	AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_WhatNext_01_05");	//Не ровен час, кто-нибудь заметит нас, - и тогда нам несдобровать.
	AI_Output(other,self,"DIA_Addon_InExtremo_Charlotte_WhatNext_01_06");	//И какое, по-твоему, это должно быть место?
	AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_WhatNext_01_07");	//Не знаю... Какая-нибудь уютная пещерка или домик.
	AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_WhatNext_01_08");	//В общем, такое, где мы не опасались бы за свою жизнь.
	AI_Output(other,self,"DIA_Addon_InExtremo_Charlotte_WhatNext_01_09");	//Ладно, постараюсь подыскать для вас теплое гнездышко.
	MIS_FindKillPlace = LOG_Running;
	Log_CreateTopic(TOPIC_FindKillPlace,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FindKillPlace,LOG_Running);
	B_LogEntry(TOPIC_FindKillPlace,"Надо найти для ребят какое-нибудь тихое и спокойное местечко. Тут оставаться для них слишком опасно.");
};

instance DIA_ADDON_INEXTREMO_CHARLOTTE_WhatNextTwo(C_Info)
{
	npc = pir_1397_addon_inextremo_charlotte;
	nr = 1;
	condition = dia_addon_inextremo_charlotte_WhatNextTwo_condition;
	information = dia_addon_inextremo_charlotte_WhatNextTwo_info;
	permanent = FALSE;
	description = "Что я еще должен знать?";
};

func int dia_addon_inextremo_charlotte_WhatNextTwo_condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_InExtremo_Charlotte_WhatNext) == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_charlotte_WhatNextTwo_info()
{
	AI_Output(other,self,"DIA_Addon_InExtremo_Charlotte_WhatNextTwo_01_01");	//Что я еще должен знать?
	AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_WhatNextTwo_01_02");	//Думаю, тебе стоит позаботится о том, чтобы ребята не сидели без дела.
	AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_WhatNextTwo_01_03");	//Иначе от безделья они начинают тупеть и злиться.
	AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_WhatNextTwo_01_04");	//А это не очень хорошо для нашего дела.
	AI_Output(other,self,"DIA_Addon_InExtremo_Charlotte_WhatNextTwo_01_05");	//Но у меня нет времени всем этим заниматься. Может быть, ты мне в этом поможешь?
	AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_WhatNextTwo_01_06");	//Ну, если ты мне доверяешь...
	AI_Output(other,self,"DIA_Addon_InExtremo_Charlotte_WhatNextTwo_01_07");	//Просто из всех вас ты мне кажешься самой умной.
	AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_WhatNextTwo_01_08");	//Тогда можешь положиться на меня. Уж я-то знаю, как управляться с этими болванами.
	AI_Output(other,self,"DIA_Addon_InExtremo_Charlotte_WhatNextTwo_01_09");	//Договорились. Только держи меня в курсе происходящего.
	AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_WhatNextTwo_01_10");	//Конечно, можешь не переживать.
	CharlotteMyAss = TRUE;
};

instance DIA_ADDON_INEXTREMO_CHARLOTTE_FindPlace(C_Info)
{
	npc = pir_1397_addon_inextremo_charlotte;
	nr = 1;
	condition = dia_addon_inextremo_charlotte_FindPlace_condition;
	information = dia_addon_inextremo_charlotte_FindPlace_info;
	permanent = FALSE;
	description = "Кажется, я нашел для вас подходящее место.";
};

func int dia_addon_inextremo_charlotte_FindPlace_condition()
{
	if((MIS_FindKillPlace == LOG_Running) && (FoundVinosKellerei == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_charlotte_FindPlace_info()
{
	B_GivePlayerXP(350);
	AI_Output(other,self,"DIA_Addon_InExtremo_Charlotte_FindPlace_01_01");	//Кажется, я нашел для вас подходящее место.
	AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_FindPlace_01_02");	//Какое именно?
	AI_Output(other,self,"DIA_Addon_InExtremo_Charlotte_FindPlace_01_03");	//Недалеко от круга камней, если идти в глубь леса, есть укромная пещерка.
	AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_FindPlace_01_04");	//Хммм...(задумчиво) Да, это вполне сгодится.
	AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_FindPlace_01_05");	//Ладно, я поговорю с ребятами насчет нее.
	AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_FindPlace_01_06");	//Если в следующий раз нас здесь не будет - значит, мы уже там.
	MIS_FindKillPlace = LOG_Success;
	KillersMoveInCave = TRUE;
	Log_SetTopicStatus(TOPIC_FindKillPlace,LOG_Success);
	B_LogEntry(TOPIC_FindKillPlace,"Шарлотте пришлась по душе идея с пещерой. Думаю, все они вскоре отправятся туда.");
};

instance DIA_ADDON_INEXTREMO_CHARLOTTE_Cave(C_Info)
{
	npc = pir_1397_addon_inextremo_charlotte;
	nr = 1;
	condition = dia_addon_inextremo_charlotte_Cave_condition;
	information = dia_addon_inextremo_charlotte_Cave_info;
	permanent = FALSE;
	description = "Как идут дела?";
};

func int dia_addon_inextremo_charlotte_Cave_condition()
{
	if(MoveKillNewPlace == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_charlotte_Cave_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_Addon_InExtremo_Charlotte_Cave_01_01");	//Как идут дела?
	AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_Cave_01_02");	//Все хорошо. Здесь оказалось даже лучше, чем было до этого в городе.
	AI_Output(other,self,"DIA_Addon_InExtremo_Charlotte_Cave_01_03");	//Правда?
	AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_Cave_01_04");	//Уж не знаю, что раньше было в этой пещере, но здесь оказались большие запасы рисового солода. 
	AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_Cave_01_05");	//И теперь Флейл целыми сутками напролет гонит из него шнапс. А я продаю его торговцам в городе.
	AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_Cave_01_06");	//К тому же я смогла договориться с один фермером, что мы будем приглядывать за его хозяйством.
	AI_Output(other,self,"DIA_Addon_InExtremo_Charlotte_Cave_01_07");	//Каким же образом?
	AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_Cave_01_08");	//Ну, ты же знаешь, сейчас такие времена, что кругом полно разного рода сброда и отребья.
	AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_Cave_01_09");	//Городское ополчение не слишком-то и чешется, если вдруг случаются проблемы.
	AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_Cave_01_10");	//А с нашими парнями особо не забалуешь! Вот он и платит нам.
	AI_Output(other,self,"DIA_Addon_InExtremo_Charlotte_Cave_01_11");	//Он платит вам за защиту?
	AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_Cave_01_12");	//(лукаво) Что-то в этом роде.
	AI_Output(other,self,"DIA_Addon_InExtremo_Charlotte_Cave_01_13");	//Да, неплохо вы тут устроились.
};

instance DIA_ADDON_INEXTREMO_CHARLOTTE_Perm(C_Info)
{
	npc = pir_1397_addon_inextremo_charlotte;
	nr = 1;
	condition = dia_addon_inextremo_charlotte_Perm_condition;
	information = dia_addon_inextremo_charlotte_Perm_info;
	permanent = TRUE;
	description = "Все тихо?";
};

func int dia_addon_inextremo_charlotte_Perm_condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_InExtremo_Charlotte_Cave) == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_charlotte_Perm_info()
{
	AI_Output(other,self,"DIA_Addon_InExtremo_Charlotte_Perm_01_01");	//Все тихо?
	AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_Perm_01_02");	//Да, лучше не придумаешь.
};

var int MyGuildMoney;
var int FirstKillPay;

instance DIA_ADDON_INEXTREMO_CHARLOTTE_Navar(C_Info)
{
	npc = pir_1397_addon_inextremo_charlotte;
	nr = 1;
	condition = dia_addon_inextremo_charlotte_Navar_condition;
	information = dia_addon_inextremo_charlotte_Navar_info;
	permanent = FALSE;
	description = "А я что-нибудь с этого поимею?";
};

func int dia_addon_inextremo_charlotte_Navar_condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_InExtremo_Charlotte_Cave) == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_charlotte_Navar_info()
{
	AI_Output(other,self,"DIA_Addon_InExtremo_Charlotte_Navar_01_01");	//А я что-нибудь с этого поимею?
	AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_Navar_01_02");	//Конечно. Ты же наш босс! И это ты отыскал для нас эту пещеру.
	AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_Navar_01_03");	//Можешь заходить сюда раз в неделю. Твоя доля будет ждать тебя прямо тут.
	AI_Output(other,self,"DIA_Addon_InExtremo_Charlotte_Navar_01_04");	//Вот это дело!
	MyGuildMoney = TRUE;
};

instance dia_addon_inextremo_charlotte_PERMJOBPAY(C_Info)
{
	npc = pir_1397_addon_inextremo_charlotte;
	nr = 51;
	condition = dia_addon_inextremo_charlotte_permjobpay_condition;
	information = dia_addon_inextremo_charlotte_permjobpay_info;
	permanent = TRUE;
	description = "Как насчет моей доли?";
};

func int dia_addon_inextremo_charlotte_permjobpay_condition()
{
	if(MyGuildMoney == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_charlotte_permjobpay_info()
{
	var int daynow;
	var int sumpay;

	daynow = Wld_GetDay();

	AI_Output(other,self,"DIA_Сharlotte_PermJobPay_01_00");	//Как насчет моей доли?

	if((KILLPAYDAY <= (daynow - 7)) || (FirstKillPay == FALSE))
	{
		AI_Output(self,other,"DIA_Сharlotte_PermJobPay_01_01");	//Конечно! Вот, возьми ее.
		sumpay = Hlp_Random(300) + 200;
		B_GiveInvItems(self,other,ItMi_Gold,sumpay);
		KILLPAYDAY = Wld_GetDay();
		FirstKillPay = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Сharlotte_PermJobPay_01_03");	//Но ты ведь уже получил свою долю! Теперь надо немного подождать.
		AI_Output(other,self,"DIA_Сharlotte_PermJobPay_01_04");	//Ах да, я и забыл.
	};
};

instance DIA_ADDON_INEXTREMO_CHARLOTTE_Siege(C_Info)
{
	npc = pir_1397_addon_inextremo_charlotte;
	nr = 1;
	condition = dia_addon_inextremo_charlotte_Siege_condition;
	information = dia_addon_inextremo_charlotte_Siege_info;
	permanent = FALSE;
	description = "Орки захватили Хоринис.";
};

func int dia_addon_inextremo_charlotte_Siege_condition()
{
	if(KAPITELORCATC == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_inextremo_charlotte_Siege_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_Addon_InExtremo_Charlotte_Siege_01_01");	//Орки захватили Хоринис.
	AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_Siege_01_02");	//Мы знаем об этом. Поэтому нам лучше сейчас оставаться здесь, в этой пещере.
	AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_Siege_01_03");	//Орки сюда навряд ли сунутся.
	AI_Output(other,self,"DIA_Addon_InExtremo_Charlotte_Siege_01_04");	//Но будьте наготове. В любой момент мне может понадобиться ваша помощь.
	AI_Output(self,other,"DIA_Addon_InExtremo_Charlotte_Siege_01_05");	//Само собой.
};