
instance DIA_Addon_Samuel_EXIT(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 999;
	condition = DIA_Addon_Samuel_EXIT_Condition;
	information = DIA_Addon_Samuel_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Samuel_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Samuel_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SAMUEL_NO_TALK(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 1;
	condition = dia_samuel_no_talk_condition;
	information = dia_samuel_no_talk_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_samuel_no_talk_condition()
{
	if((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_samuel_no_talk_info()
{
	B_Say(self,other,"$SPAREME");
	B_Say(self,other,"$NEVERENTERROOMAGAIN");
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Samuel_Hello(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 1;
	condition = DIA_Addon_Samuel_Hello_Condition;
	information = DIA_Addon_Samuel_Hello_Info;
	important = TRUE;
};


func int DIA_Addon_Samuel_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Samuel_Hello_Info()
{
	AI_Output(self,other,"DIA_Addon_Samuel_Hello_14_00");	//А, новичок!
	AI_Output(self,other,"DIA_Addon_Samuel_Hello_14_01");	//Итак, чего ты хочешь? Рому или чего-нибудь покрепче?
	Log_CreateTopic(Topic_Addon_PIR_Trader,LOG_NOTE);
	B_LogEntry(Topic_Addon_PIR_Trader,Log_Text_Addon_SamuelTrade);
};


instance DIA_Addon_Samuel_Francis(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 2;
	condition = DIA_Addon_Samuel_Francis_Condition;
	information = DIA_Addon_Samuel_Francis_Info;
	description = "Я хочу поговорить с тобой о Фрэнсисе.";
};


func int DIA_Addon_Samuel_Francis_Condition()
{
	if(Francis_ausgeschissen == FALSE)
	{
		if(Npc_KnowsInfo(other,DIA_Addon_Skip_GregsHut) || (Francis.aivar[AIV_TalkedToPlayer] == TRUE))
		{
			return TRUE;
		};
	};
	return FALSE;
};

func void DIA_Addon_Samuel_Francis_Info()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Francis_15_00");	//Я хочу поговорить с тобой о Фрэнсисе.
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_01");	//Не упоминай при мне эту жалкую пародию на капитана!
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_02");	//Он целыми днями сидит на своей жирной заднице с важным видом.
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_03");	//Никто из нас не может понять, о чем, черт возьми, думал капитан, когда оставлял ЕГО за главного!
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_04");	//Что тебе нужно от этого идиота?
};


instance DIA_Addon_Samuel_Versteck(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 3;
	condition = DIA_Addon_Samuel_Versteck_Condition;
	information = DIA_Addon_Samuel_Versteck_Info;
	description = "Я должен попасть в хижину Грэга.";
};


func int DIA_Addon_Samuel_Versteck_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Samuel_Francis) && (Francis_ausgeschissen == FALSE) && (GregIsBack == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Samuel_Versteck_Info()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Francis_15_02");	//Я должен попасть в хижину Грэга.
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_05");	//Неужели? А зачем, интересно?
	AI_Output(other,self,"DIA_Addon_Samuel_Francis_15_01");	//Мне нужны бандитские доспехи.
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_06");	//Ха-ха-ха... (смеется) Фрэнсис ни за что не пустит тебя в хижину, чтоб ты мог покопаться в вещах Грэга.
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_07");	//Если только...
	AI_Output(other,self,"DIA_Addon_Samuel_Francis_15_03");	//Что?
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_08");	//...Если только у тебя не будет что-то, что действительно нужно Фрэнсису.
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_09");	//Я знаю, что Фрэнсис что-то спрятал в заброшенной шахте в каньоне.
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_10");	//Однажды мы вместе стояли в карауле, и он как всегда заснул. Я услышал, как он бормочет об этом во сне.
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_11");	//Не знаю, что он там зарыл, но возможно, что это настолько для него важно, что за этот предмет он пропустит тебя в хижину...
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_12");	//(радостно) Когда капитан вернется и увидит, что что-то из его вещей пропало, он спустит с Фрэнсиса шкуру!
	B_LogEntry(TOPIC_Addon_BDTRuestung,"Самогонщик Сэмюэль упомянул тайник Фрэнсиса, который находится в одной из пещер каньона. Возможно, я найду там что-либо, что поможет мне попасть в хижину.");
};


var int Samuel_Knows_LousHammer;
var int Samuel_Knows_SchlafHammer;

instance DIA_Addon_Samuel_Recipe(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 4;
	condition = DIA_Addon_Samuel_Recipe_Condition;
	information = DIA_Addon_Samuel_Recipe_Info;
	permanent = TRUE;
	description = "У меня есть для тебя рецепт!";
};


func int DIA_Addon_Samuel_Recipe_Condition()
{
	if(((Samuel_Knows_LousHammer == FALSE) && (Npc_HasItems(other,ITWr_Addon_Lou_Rezept) > 0)) || ((Samuel_Knows_SchlafHammer == FALSE) && (Npc_HasItems(other,ITWr_Addon_Lou_Rezept2) > 0)))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Samuel_Recipe_Info()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Recipe_15_00");	//У меня есть для тебя рецепт!
	AI_Output(self,other,"DIA_Addon_Samuel_Recipe_14_01");	//Отлично, показывай. Что это за рецепт?
	Info_ClearChoices(DIA_Addon_Samuel_Recipe);

	if((Samuel_Knows_LousHammer == FALSE) && (Npc_HasItems(other,ITWr_Addon_Lou_Rezept) > 0))
	{
		Info_AddChoice(DIA_Addon_Samuel_Recipe,"Молот Лу",DIA_Addon_Samuel_Recipe_LousHammer);
	};
	if((Samuel_Knows_SchlafHammer == FALSE) && (Npc_HasItems(other,ITWr_Addon_Lou_Rezept2) > 0))
	{
		Info_AddChoice(DIA_Addon_Samuel_Recipe,"Двойной молот Лу",DIA_Addon_Samuel_Recipe_LousDoubleHammer);
	};
};

func void DIA_Addon_Samuel_Recipe_Back()
{
	Info_ClearChoices(DIA_Addon_Samuel_Recipe);
};

func void DIA_Addon_Samuel_Recipe_LousHammer()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Recipe_LousHammer_15_00");	//Это от Снафа.
	B_GiveInvItems(other,self,ITWr_Addon_Lou_Rezept,1);
	Npc_RemoveInvItems(self,ITWr_Addon_Lou_Rezept,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Addon_Samuel_Recipe_LousHammer_14_04");	//Но это же ужасно! Я должен немедленно попробовать...
	B_GivePlayerXP(XP_Ambient);
	Samuel_Knows_LousHammer = TRUE;
};

func void DIA_Addon_Samuel_Recipe_LousDoubleHammer()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Recipe_LousDoubleHammer_15_00");	//Будь осторожен. Это опасная штука!
	B_GiveInvItems(other,self,ITWr_Addon_Lou_Rezept2,1);
	Npc_RemoveInvItems(self,ITWr_Addon_Lou_Rezept2,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_Addon_Samuel_Recipe_LousDoubleHammer_14_04");	//Ты меня пугаешь. Но я все равно попробую.
	B_GivePlayerXP(XP_Ambient);
	Samuel_Knows_SchlafHammer = TRUE;
};


var int Samuel_Grog_Varianz;

instance DIA_Addon_Samuel_Grog(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 5;
	condition = DIA_Addon_Samuel_Grog_Condition;
	information = DIA_Addon_Samuel_Grog_Info;
	permanent = TRUE;
	description = "Я пришел за своей порцией грога! (Цена: 10 монет)";
};


func int DIA_Addon_Samuel_Grog_Condition()
{
	return TRUE;
};

func void DIA_Addon_Samuel_Grog_Info()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Grog_15_00");	//Я пришел за своей порцией грога.
	if(B_GiveInvItems(other,self,ItMi_Gold,10))
	{
		if(Samuel_Grog_Varianz == 0)
		{
			AI_Output(self,other,"DIA_Addon_Samuel_Grog_14_01");	//Да, без грога вы палец о палец ударить не можете. Вот, забирай.
			Samuel_Grog_Varianz = 1;
		}
		else if(Samuel_Grog_Varianz == 1)
		{
			AI_Output(self,other,"DIA_Addon_Samuel_Grog_14_02");	//Надеюсь, пить его можно. У меня кончилась пресная вода. Но немного морской воды еще никому не повредило, верно?
			Samuel_Grog_Varianz = 2;
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Samuel_Grog_14_03");	//Ты можешь получить столько грога, сколько захочешь!
		};
		B_GiveInvItems(self,other,ItFo_Addon_Grog,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Samuel_Grog_14_04");	//Продаю я грог дешево, но не бесплатно! Раздобудь немного золота, приятель.
	};
};


var int Samuel_Rum_Varianz;

instance DIA_Addon_Samuel_Rum(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 6;
	condition = DIA_Addon_Samuel_Rum_Condition;
	information = DIA_Addon_Samuel_Rum_Info;
	permanent = TRUE;
	description = "Дай мне рома! (Цена: 30 монет)";
};


func int DIA_Addon_Samuel_Rum_Condition()
{
	return TRUE;
};

func void DIA_Addon_Samuel_Rum_Info()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Rum_15_00");	//Дай мне рома!
	if(B_GiveInvItems(other,self,ItMi_Gold,30))
	{
		if(Samuel_Rum_Varianz == 0)
		{
			AI_Output(self,other,"DIA_Addon_Samuel_Rum_14_01");	//А-а, ром для моряка - все равно что молоко матери! Вот, бери!
			Samuel_Rum_Varianz = 1;
		}
		else if(Samuel_Rum_Varianz == 1)
		{
			AI_Output(self,other,"DIA_Addon_Samuel_Rum_14_02");	//У рома может быть небольшой привкус рыбы. У меня остались только бочки из-под селедки. Но ром остается ромом. Твое здоровье!
			Samuel_Rum_Varianz = 2;
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Samuel_Rum_14_03");	//Вот, бери.
		};
		B_GiveInvItems(self,other,ItFo_Addon_Rum,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Samuel_Rum_14_04");	//У тебя недостаточно золота, приятель! Как насчет грога?
	};
};


var int Samuel_Stronger_Varianz;
var int Samuel_DoppelHammer_Varianz;

instance DIA_Addon_Samuel_Stronger(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 7;
	condition = DIA_Addon_Samuel_Stronger_Condition;
	information = DIA_Addon_Samuel_Stronger_Info;
	permanent = TRUE;
	description = "Я хочу чего-нибудь покрепче!";
};


func int DIA_Addon_Samuel_Stronger_Condition()
{
	return TRUE;
};

func void DIA_Addon_Samuel_Stronger_Info()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Stronger_15_00");	//Я хочу чего-нибудь покрепче!

	if(Samuel_Stronger_Varianz == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_01");	//А, вижу родственную душу! Я и сам люблю экспериментировать.
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_02");	//Хорошая выпивка должна быть чистой, крепкой, а глотку продирать, как жидкий огонь.
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_03");	//Такое нечасто встречается. Но я слишком много болтаю, а ты хочешь выпить.
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_04");	//Вот. Мой собственный рецепт. Тебе понравится. Я называю этот напиток 'Быстрая селедка'.
		B_GiveInvItems(self,other,ItFo_Addon_SchnellerHering,1);
		B_UseItem(other,ItFo_Addon_SchnellerHering);
		AI_Output(other,self,"DIA_Addon_Samuel_Stronger_15_05");	//Впечатляет!
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_06");	//(смеется) Это точно!
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_07");	//А тебе не встречались рецепты напитков? Если встретятся, обязательно расскажи мне.
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_08");	//Хочешь еще?
		Samuel_Stronger_Varianz = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_09");	//Что тебе приготовить?
	};
	Info_ClearChoices(DIA_Addon_Samuel_Stronger);
	Info_AddChoice(DIA_Addon_Samuel_Stronger,Dialog_Back,DIA_Addon_Samuel_Stronger_Back);
	if(Samuel_Knows_SchlafHammer == TRUE)
	{
		Info_AddChoice(DIA_Addon_Samuel_Stronger,"Двойной Молот Лу (Цена: 60 монет)",DIA_Addon_Samuel_Stronger_LousDoubleHammer);
	};
	if(Samuel_Knows_LousHammer == TRUE)
	{
		Info_AddChoice(DIA_Addon_Samuel_Stronger,"Молот Лу (Цена: 30 монет)",DIA_Addon_Samuel_Stronger_LousHammer);
	};
	Info_AddChoice(DIA_Addon_Samuel_Stronger,"Быстрая селедка (Цена: 60 монет)",DIA_Addon_Samuel_Stronger_SchnellerHering);
};

func void B_Addon_Samuel_NoGold()
{
	AI_Output(self,other,"DIA_Addon_Samuel_NoGold_14_00");	//Нет золота - нет выпивки!
};

func void DIA_Addon_Samuel_Stronger_Back()
{
	Info_ClearChoices(DIA_Addon_Samuel_Stronger);
};

func void DIA_Addon_Samuel_Stronger_SchnellerHering()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Stronger_SchnellerHering_15_00");	//Дай мне 'Быструю Селедку'.
	if(B_GiveInvItems(other,self,ItMi_Gold,60))
	{
		AI_Output(self,other,"DIa_Addon_Samuel_Stronger_SchnellerHering_14_01");	//Злой напиток. Но эффективный!
		B_GiveInvItems(self,other,ItFo_Addon_SchnellerHering,1);
	}
	else
	{
		B_Addon_Samuel_NoGold();
	};
	Info_ClearChoices(DIA_Addon_Samuel_Stronger);
	Info_AddChoice(DIA_Addon_Samuel_Stronger,Dialog_Back,DIA_Addon_Samuel_Stronger_Back);
	if(Samuel_Knows_SchlafHammer == TRUE)
	{
		Info_AddChoice(DIA_Addon_Samuel_Stronger,"Двойной Молот Лу (Цена: 60 монет)",DIA_Addon_Samuel_Stronger_LousDoubleHammer);
	};
	if(Samuel_Knows_LousHammer == TRUE)
	{
		Info_AddChoice(DIA_Addon_Samuel_Stronger,"Молот Лу (Цена: 30 монет)",DIA_Addon_Samuel_Stronger_LousHammer);
	};
	Info_AddChoice(DIA_Addon_Samuel_Stronger,"Быстрая селедка (Цена: 60 монет)",DIA_Addon_Samuel_Stronger_SchnellerHering);
};

func void DIA_Addon_Samuel_Stronger_LousHammer()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Stronger_LousHammer_15_00");	//Я хочу 'Молоток Лу'!
	if(B_GiveInvItems(other,self,ItMi_Gold,30))
	{
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_LousHammer_14_01");	//Отличное пойло! Наслаждайся!
		B_GiveInvItems(self,other,ItFo_Addon_LousHammer,1);
	}
	else
	{
		B_Addon_Samuel_NoGold();
	};
	Info_ClearChoices(DIA_Addon_Samuel_Stronger);
	Info_AddChoice(DIA_Addon_Samuel_Stronger,Dialog_Back,DIA_Addon_Samuel_Stronger_Back);
	if(Samuel_Knows_SchlafHammer == TRUE)
	{
		Info_AddChoice(DIA_Addon_Samuel_Stronger,"Двойной Молот Лу (Цена: 60 монет)",DIA_Addon_Samuel_Stronger_LousDoubleHammer);
	};
	if(Samuel_Knows_LousHammer == TRUE)
	{
		Info_AddChoice(DIA_Addon_Samuel_Stronger,"Молот Лу (Цена: 30 монет)",DIA_Addon_Samuel_Stronger_LousHammer);
	};
	Info_AddChoice(DIA_Addon_Samuel_Stronger,"Быстрая селедка (Цена: 60 монет)",DIA_Addon_Samuel_Stronger_SchnellerHering);
};

func void DIA_Addon_Samuel_Stronger_LousDoubleHammer()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Stronger_LousDoubleHammer_15_00");	//(спокойно) Сделай мне двойной 'Молот'.
	if(B_GiveInvItems(other,self,ItMi_Gold,60))
	{
		if(Samuel_DoppelHammer_Varianz == 0)
		{
			AI_Output(self,other,"DIA_Addon_Samuel_Stronger_LousDoubleHammer_14_01");	//Не делай глупостей, сынок. Очень надеюсь, что ты берешь это не для себя.
		}
		else
		{
			AI_Output(self,other,"DIa_Addon_Samuel_Stronger_LousDoubleHammer_14_02");	//Да! Ничто так не укрепляет дух!
		};
		B_GiveInvItems(self,other,ItFo_Addon_SchlafHammer,1);
	}
	else
	{
		B_Addon_Samuel_NoGold();
	};
	Info_ClearChoices(DIA_Addon_Samuel_Stronger);
	Info_AddChoice(DIA_Addon_Samuel_Stronger,Dialog_Back,DIA_Addon_Samuel_Stronger_Back);
	if(Samuel_Knows_SchlafHammer == TRUE)
	{
		Info_AddChoice(DIA_Addon_Samuel_Stronger,"Двойной Молот Лу (Цена: 60 монет)",DIA_Addon_Samuel_Stronger_LousDoubleHammer);
	};
	if(Samuel_Knows_LousHammer == TRUE)
	{
		Info_AddChoice(DIA_Addon_Samuel_Stronger,"Молот Лу (Цена: 30 монет)",DIA_Addon_Samuel_Stronger_LousHammer);
	};
	Info_AddChoice(DIA_Addon_Samuel_Stronger,"Быстрая селедка (Цена: 60 монет)",DIA_Addon_Samuel_Stronger_SchnellerHering);
};


instance DIA_Addon_Samuel_Trade(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 8;
	condition = DIA_Addon_Samuel_Trade_Condition;
	information = DIA_Addon_Samuel_Trade_Info;
	permanent = TRUE;
	description = "Что у тебя еще есть?";
	trade = TRUE;
};


func int DIA_Addon_Samuel_Trade_Condition()
{
	return TRUE;
};

func void DIA_Addon_Samuel_Trade_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Addon_Samuel_Trade_15_00");	//Что у тебя еще есть?
	AI_Output(self,other,"DIA_Addon_Samuel_Trade_14_01");	//Я могу продать тебе все, что нужно пирату для жизни.
	B_GiveTradeInv(self);
	Npc_RemoveInvItems(self,ItFo_Addon_Grog,Npc_HasItems(self,ItFo_Addon_Grog));
	CreateInvItems(self,ItFo_Addon_Grog,15);
};


instance DIA_Addon_Samuel_News(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 99;
	condition = DIA_Addon_Samuel_News_Condition;
	information = DIA_Addon_Samuel_News_Info;
	permanent = TRUE;
	description = "Что нового в лагере?";
};


func int DIA_Addon_Samuel_News_Condition()
{
	return TRUE;
};

func void DIA_Addon_Samuel_News_Info()
{
	AI_Output(other,self,"DIA_Addon_Samuel_News_15_00");	//Что нового в лагере?
	if(Npc_IsDead(Francis) || (Francis_ausgeschissen == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Samuel_News_14_01");	//Фрэнсис получил по заслугам! Не могу даже описать, как это меня радует.
		AI_Output(self,other,"DIA_Addon_Samuel_News_14_02");	//А ты нормальный парень. Давай выпьем - я угощаю!
		if(GregIsBack == TRUE)
		{
			AI_Output(self,other,"DIA_Addon_Samuel_News_14_03");	//И Грэг наконец-то вернулся. Он потерял корабль, но, по крайней мере, восстановил порядок в лагере.
		};
	}
	else
	{
		if(!Npc_IsDead(Morgan))
		{
			AI_Output(self,other,"DIA_Addon_Samuel_News_14_04");	//С тех пор как Грэг уехал, ничего интересного не происходило. Морган и большинство парней целыми днями пьянствуют.
		};
		if(!Npc_IsDead(Henry))
		{
			AI_Output(self,other,"DIA_Addon_Samuel_News_14_05");	//Только Генри занимается делом. Он со своими людьми строит частокол.
		};
		AI_Output(self,other,"DIA_Addon_Samuel_News_14_06");	//Пора бы уже капитану вернуться и дать Фрэнсису хорошего пинка под зад!
	};
};

var int RezeptCost;
var int SamuelTradeTod;
var int SamuelTradeTodDone;

instance DIA_Addon_Samuel_RiordanRezept(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 2;
	condition = DIA_Addon_Samuel_RiordanRezept_Condition;
	information = DIA_Addon_Samuel_RiordanRezept_Info;
	description = "А ты можешь научить меня делать напиток ускорения?";
};

func int DIA_Addon_Samuel_RiordanRezept_Condition()
{
	if((MIS_SpeedPotion == LOG_Running) && (Samuel_Stronger_Varianz == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Samuel_RiordanRezept_Info()
{
	AI_Output(other,self,"DIA_Addon_Samuel_RiordanRezept_01_00");	//А ты можешь научить меня делать напиток ускорения?
	AI_Output(self,other,"DIA_Addon_Samuel_RiordanRezept_01_01");	//Обычно я держу в тайне свою рецептуру.
	AI_Output(self,other,"DIA_Addon_Samuel_RiordanRezept_01_02");	//Но мне интересно, зачем он тебе вдруг понадобился?
	Info_ClearChoices(DIA_Addon_Samuel_RiordanRezept);
	Info_AddChoice(DIA_Addon_Samuel_RiordanRezept,"Им интересуется один из магов Воды.",DIA_Addon_Samuel_RiordanRezept_Riordan);

	if(RhetorikSkillValue[1] >= 50)
	{
		Info_AddChoice(DIA_Addon_Samuel_RiordanRezept,"Хочу наладить его продажу в Хоринисе.",DIA_Addon_Samuel_RiordanRezept_Trade);
	};

	Info_AddChoice(DIA_Addon_Samuel_RiordanRezept,"Просто стало интересно.",DIA_Addon_Samuel_RiordanRezept_Just);
};

func void DIA_Addon_Samuel_RiordanRezept_Riordan()
{
	AI_Output(other,self,"DIA_Addon_Samuel_RiordanRezept_Riordan_01_00");	//Им интересуется один из магов Воды.
	AI_Output(self,other,"DIA_Addon_Samuel_RiordanRezept_Riordan_01_01");	//Да ты что? Вот это новость!
	AI_Output(self,other,"DIA_Addon_Samuel_RiordanRezept_Riordan_01_02");	//Но с чего вдруг магам интересоваться такой вещью, как обычный самогон?
	AI_Output(other,self,"DIA_Addon_Samuel_RiordanRezept_Riordan_01_03");	//Твое пойло имеет очень интересный эффект. Так что в этом нет ничего удивительного.
	AI_Output(self,other,"DIA_Addon_Samuel_RiordanRezept_Riordan_01_04");	//Это ты верно подметил...(ехидно) Ладно! Я покажу тебе, как готовить мое зелье.
	AI_Output(self,other,"DIA_Addon_Samuel_RiordanRezept_Riordan_01_05");	//Но тебе придется заплатить! И не думай, что я продам его задешево.
	AI_Output(other,self,"DIA_Addon_Samuel_RiordanRezept_Riordan_01_06");	//Сколько?
	AI_Output(self,other,"DIA_Addon_Samuel_RiordanRezept_Riordan_01_07");	//Я слышал, что у магов водится много золота! Так что не меньше тысячи золотых.
	AI_Output(other,self,"DIA_Addon_Samuel_RiordanRezept_Riordan_01_08");	//Ты с ума сошел! Оно столько не стоит.
	AI_Output(self,other,"DIA_Addon_Samuel_RiordanRezept_Riordan_01_09");	//Дело твое. Хочешь бери, а хочешь нет! Я тебе цену назвал - и точка.
	RezeptCost = 1000;
	SamuelTradeTod = TRUE;
	B_LogEntry(TOPIC_SpeedPotion,"Сэмюэль продаст мне свой рецепт за тысячу золотых.");
	Info_ClearChoices(DIA_Addon_Samuel_RiordanRezept);
};

func void DIA_Addon_Samuel_RiordanRezept_Trade()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Addon_Samuel_RiordanRezept_Trade_01_00");	//Просто хочу наладить его продажу в Хоринисе.
	AI_Output(self,other,"DIA_Addon_Samuel_RiordanRezept_Trade_01_01");	//Хочешь обогатиться? Понимаю.
	AI_Output(self,other,"DIA_Addon_Samuel_RiordanRezept_Trade_01_02");	//Ладно! Я открою его тебе, но только при одном условии.
	AI_Output(self,other,"DIA_Addon_Samuel_RiordanRezept_Trade_01_03");	//Половина тех денег, которые ты выручишь за него - моя! Договорились?
	AI_Output(other,self,"DIA_Addon_Samuel_RiordanRezept_Trade_01_04");	//Ну, похоже, что у меня нет выбора. По рукам!
	AI_Output(self,other,"DIA_Addon_Samuel_RiordanRezept_Trade_01_05");	//Вот, держи. Только смотри не обмани меня, иначе я с тебя шкуру спущу.
	B_GiveInvItems(self,other,ITWr_Addon_Piratentod,1);
	AI_Output(other,self,"DIA_Addon_Samuel_RiordanRezept_Trade_01_06");	//Я все понял. Только мне нужно какое-то время. Сам понимаешь - дело не быстрое.
	AI_Output(self,other,"DIA_Addon_Samuel_RiordanRezept_Trade_01_07");	//Само собой.
	B_LogEntry(TOPIC_SpeedPotion,"Рецепт у меня. Пора возвращаться к Риордиану.");
	Info_ClearChoices(DIA_Addon_Samuel_RiordanRezept);
};

func void DIA_Addon_Samuel_RiordanRezept_Just()
{
	AI_Output(other,self,"DIA_Addon_Samuel_RiordanRezept_Just_01_00");	//Просто стало интересно.
	AI_Output(self,other,"DIA_Addon_Samuel_RiordanRezept_Just_01_01");	//Интересно? (ехидно) Тогда мой ответ - нет.
	AI_Output(self,other,"DIA_Addon_Samuel_RiordanRezept_Just_01_02");	//Он мне слишком дорог, чтобы я рассказывал о нем каждому встречному.
	AI_Output(self,other,"DIA_Addon_Samuel_RiordanRezept_Just_01_03");	//Так что лучше поищи интересное где-нибудь в другом месте.
	AI_Output(other,self,"DIA_Addon_Samuel_RiordanRezept_Just_01_04");	//Я бы мог заплатить за него!
	AI_Output(self,other,"DIA_Addon_Samuel_RiordanRezept_Just_01_05");	//(задумчиво) Хорошо. Но это обойдется тебе, по меньшей мере, в две тысячи золотых монет.
	AI_Output(self,other,"DIA_Addon_Samuel_RiordanRezept_Just_01_06");	//И в твоем случае торговаться со мной не имеет никакого смысла.
	AI_Output(other,self,"DIA_Addon_Samuel_RiordanRezept_Just_01_07");	//Да уж.
	RezeptCost = 2000;
	SamuelTradeTod = TRUE;
	B_LogEntry(TOPIC_SpeedPotion,"Сэмюэль продаст мне свой рецепт за две тысячи золотых.");
	Info_ClearChoices(DIA_Addon_Samuel_RiordanRezept);
};

instance DIA_Addon_Samuel_RiordanRezept_Buy(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 2;
	condition = DIA_Addon_Samuel_RiordanRezept_Buy_Condition;
	information = DIA_Addon_Samuel_RiordanRezept_Buy_Info;
	permanent = TRUE;
	description = "Продай мне рецепт.";
};

func int DIA_Addon_Samuel_RiordanRezept_Buy_Condition()
{
	if((MIS_SpeedPotion == LOG_Running) && (SamuelTradeTod == TRUE) && (SamuelTradeTodDone == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Samuel_RiordanRezept_Buy_Info()
{
	AI_Output(other,self,"DIA_Addon_Samuel_RiordanRezept_Buy_01_00");	//Продай мне рецепт.
	AI_Output(self,other,"DIA_Addon_Samuel_RiordanRezept_Buy_01_01");	//(небрежно) А где золото?

	if(Npc_HasItems(hero,ItMi_Gold) >= RezeptCost)
	{
		AI_Output(other,self,"DIA_Addon_Samuel_RiordanRezept_Buy_01_02");	//Вот, держи.
		B_GiveInvItems(other,self,ItMi_Gold,RezeptCost);
		AI_Output(self,other,"DIA_Addon_Samuel_RiordanRezept_Buy_01_03");	//Хорошо. Рецепт твой, как и договаривались.
		B_GiveInvItems(self,other,ITWr_Addon_Piratentod,1);
		SamuelTradeTodDone = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Samuel_RiordanRezept_Buy_01_04");	//У меня пока нет такой суммы.
		AI_Output(self,other,"DIA_Addon_Samuel_RiordanRezept_Buy_01_05");	//Тогда приходи, когда найдешь ее.
	};
};

//--------------------------------кости-------------------------------------

instance DIA_PIR_1351_Addon_Samuel_Game(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 3;
	condition = DIA_PIR_1351_Addon_Samuel_Game_condition;
	information = DIA_PIR_1351_Addon_Samuel_Game_info;
	description = "Тут кто-нибудь из вас в кости играет?";
};

func int DIA_PIR_1351_Addon_Samuel_Game_condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Samuel_Hello))
	{
		return TRUE;
	};
};

func void DIA_PIR_1351_Addon_Samuel_Game_info()
{
 	AI_Output(other,self,"DIA_PIR_1351_Addon_Samuel_Game_01_00"); //Тут кто-нибудь из вас в кости играет?
 	AI_Output(self,other,"DIA_PIR_1351_Addon_Samuel_Game_01_01"); //Ну, допустим, я играю. А тебе-то что? Хочешь сыграть?
 	AI_Output(other,self,"DIA_PIR_1351_Addon_Samuel_Game_01_02"); //Не отказался бы.
 	AI_Output(self,other,"DIA_PIR_1351_Addon_Samuel_Game_01_03"); //Хорошо! Тогда деньги на бочку - и вперед.
	SamuelPlayResult = 350;
	Menu_WriteInt("AST","SysTimer06",0);
};

instance DIA_PIR_1351_Addon_Samuel_GamePlay(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 900;
	condition = DIA_PIR_1351_Addon_Samuel_GamePlay_condition;
	information = DIA_PIR_1351_Addon_Samuel_GamePlay_info;
	permanent = TRUE;
	description = "Сыграем в кости!";
};

func int DIA_PIR_1351_Addon_Samuel_GamePlay_condition()
{
	if((Npc_KnowsInfo(other,DIA_PIR_1351_Addon_Samuel_Game) == TRUE) && (Mount_Up == FALSE) && (FlyCarpetIsOn == FALSE))
	{
		return TRUE;
	};
};

func void DIA_PIR_1351_Addon_Samuel_GamePlay_info()
{
	var int DayNow;

	DayNow = Wld_GetDay();
	CheckLastGame = Menu_ReadInt("AST","SysTimer06");

	if(CheckLastGame >= SamuelPlayResult)
	{
		CheckLastSum = CheckLastGame - SamuelPlayResult;
	};

	AI_Output(other,self,"DIA_PIR_1351_Addon_Samuel_GamePlay_01_00");	//Сыграем в кости!

	if(SamuelPlayResult >= CheckLastGame)
	{
		if((SamuelPlayResult > 0) && (SamuelDayFlag == FALSE))
		{
			AI_Output(self,other,"DIA_PIR_1351_Addon_Samuel_GamePlay_01_01");	//Ну, посмотрим, чего ты стоишь!
			PlayPocker(1,self);
		}
		else
		{
			if(SamuelDayFlag == FALSE)
			{
				AI_Output(self,other,"DIA_PIR_1351_Addon_Samuel_GamePlay_01_02");	//Нет! Ты уже и так достаточно выиграл.
				SamuelDayPlay = Wld_GetDay();
				SamuelDayFlag = TRUE;
			}
			else
			{
				AI_Output(self,other,"DIA_PIR_1351_Addon_Samuel_GamePlay_01_03");	//Не сегодня, приятель.
			};
		};
	}
	else
	{
		AI_Output(self,other,"DIA_PIR_1351_Addon_Samuel_GamePlay_01_04");	//Ты еще не отдал мне деньги за прошлую игру.
		AI_Output(self,other,"DIA_PIR_1351_Addon_Samuel_GamePlay_01_05");	//Так что сначала отдай свой долг! А потом сыграем.
		Info_ClearChoices(DIA_PIR_1351_Addon_Samuel_GamePlay);

		if(Npc_HasItems(other,ItMi_Gold) >= CheckLastSum)
		{
			Info_AddChoice(DIA_PIR_1351_Addon_Samuel_GamePlay,"Вот твои деньги.",DIA_PIR_1351_Addon_Samuel_GamePlay_Here);
		};

		Info_AddChoice(DIA_PIR_1351_Addon_Samuel_GamePlay,"У меня нет столько денег.",DIA_PIR_1351_Addon_Samuel_GamePlay_No);
	};
};

func void DIA_PIR_1351_Addon_Samuel_GamePlay_Here()
{
	Snd_Play("Geldbeutel");
	Npc_RemoveInvItems(hero,ItMi_Gold,CheckLastSum);
	SamuelPlayResult = CheckLastGame;
	AI_Output(other,self,"DIA_PIR_1351_Addon_Samuel_GamePlay_Here_01_01");	//Вот твои деньги.
	AI_Output(self,other,"DIA_PIR_1351_Addon_Samuel_GamePlay_Here_01_02");	//Другое дело! Тогда, пожалуй, начнем.
	PlayPocker(1,self);
};

func void DIA_PIR_1351_Addon_Samuel_GamePlay_No()
{
	AI_Output(other,self,"DIA_PIR_1351_Addon_Samuel_GamePlay_No_01_01");	//У меня нет столько денег.
	AI_Output(self,other,"DIA_PIR_1351_Addon_Samuel_GamePlay_No_01_02");	//Ну, а я тут причем?
	Info_ClearChoices(DIA_PIR_1351_Addon_Samuel_GamePlay);
};

instance DIA_PIR_1351_Addon_Samuel_GameEnd(C_Info)
{
	npc = PIR_1351_Addon_Samuel;
	nr = 3;
	condition = DIA_PIR_1351_Addon_Samuel_GameEnd_condition;
	information = DIA_PIR_1351_Addon_Samuel_GameEnd_info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_PIR_1351_Addon_Samuel_GameEnd_condition()
{
	if((MustTellResult_Samuel == TRUE) && ((SamuelLost == TRUE) || (SamuelWon == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_PIR_1351_Addon_Samuel_GameEnd_info()
{
	if(SamuelLost == TRUE)
	{
		AI_Output(self,other,"DIA_PIR_1351_Addon_Samuel_GameEnd_00");	//Якорь мне в корму! Как ты смог меня обыграть?!
		SamuelLost = FALSE;
	}
	else if(SamuelWon == TRUE)
	{
		AI_Output(self,other,"DIA_PIR_1351_Addon_Samuel_GameEnd_01");	//Приходи еще, когда появится лишнее золотишко.
		SamuelWon = FALSE;
	};

	MustTellResult_Samuel = FALSE;
};