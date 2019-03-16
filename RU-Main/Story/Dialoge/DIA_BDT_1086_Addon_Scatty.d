
var int Scatty_Start;

instance DIA_Addon_Scatty_EXIT(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 999;
	condition = DIA_Addon_Scatty_EXIT_Condition;
	information = DIA_Addon_Scatty_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Scatty_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Scatty_EXIT_Info()
{
	AI_StopProcessInfos(self);
	if(Scatty_Start == FALSE)
	{
		Npc_ExchangeRoutine(self,"START");
		Scatty_Start = TRUE;
	};
};


instance DIA_Addon_Scatty_PICKPOCKET(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 900;
	condition = DIA_Addon_Scatty_PICKPOCKET_Condition;
	information = DIA_Addon_Scatty_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Scatty_PICKPOCKET_Condition()
{
	return C_Beklauen(60,90);
};

func void DIA_Addon_Scatty_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Scatty_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Scatty_PICKPOCKET,Dialog_Back,DIA_Addon_Scatty_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Scatty_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Scatty_PICKPOCKET_DoIt);
};

func void DIA_Addon_Scatty_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Scatty_PICKPOCKET);
};

func void DIA_Addon_Scatty_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Scatty_PICKPOCKET);
};


instance DIA_Addon_Scatty_Hi(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 2;
	condition = DIA_Addon_Scatty_Hi_Condition;
	information = DIA_Addon_Scatty_Hi_Info;
	permanent = FALSE;
	description = "Как торговля?";
};


func int DIA_Addon_Scatty_Hi_Condition()
{
	if(SCATTY_TP == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Scatty_Hi_Info()
{
	AI_Output(other,self,"DIA_Addon_Scatty_Hi_15_00");	//Как идут дела?
	AI_Output(self,other,"DIA_Addon_Scatty_Hi_01_01");	//С тех пор как гробница была открыта, покупателей не так много.
	AI_Output(self,other,"DIA_Addon_Scatty_Hi_01_02");	//Ворону больше не нужны рабы, поэтому они теперь добывают золото. По приказу Бладвина.
	AI_Output(self,other,"DIA_Addon_Scatty_Hi_01_03");	//Рудокопы не слишком усердствуют. (бормочет) А рудокопам, которые не усердствуют, не так много и нужно.
	Log_CreateTopic(Topic_Addon_BDT_Trader,LOG_NOTE);
	B_LogEntry(Topic_Addon_BDT_Trader,"Скатти продает различные товары.");
};


instance DIA_Addon_Scatty_last(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 2;
	condition = DIA_Addon_Scatty_last_Condition;
	information = DIA_Addon_Scatty_last_Info;
	permanent = FALSE;
	description = "Бладвин? Он сейчас командует?";
};


func int DIA_Addon_Scatty_last_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Scatty_Hi) && !Npc_IsDead(Bloodwyn) && (SCATTY_TP == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Scatty_last_Info()
{
	AI_Output(other,self,"DIA_Addon_Scatty_last_15_00");	//Бладвин? Он сейчас командует?
	AI_Output(self,other,"DIA_Addon_Scatty_last_01_01");	//Он старший по шахте. Но сам он почти никогда не спускается. Большинство времени он проводит в храме с Вороном.
	AI_Output(other,self,"DIA_Addon_Scatty_last_15_02");	//'Почти никогда' - это как часто, если быть точным?
	AI_Output(self,other,"DIA_Addon_Scatty_last_01_03");	//Последний раз я видел его, когда он выходил из гробницы...
	AI_Output(self,other,"DIA_Addon_Scatty_last_01_04");	//Хотя нет, подожди! Последний раз был, когда он посылал рабов добывать золото.
	AI_Output(self,other,"DIA_Addon_Scatty_last_01_05");	//В отличие от Ворона, его ОЧЕНЬ интересует золото.
};


instance DIA_Addon_Scatty_Gruft(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 2;
	condition = DIA_Addon_Scatty_Gruft_Condition;
	information = DIA_Addon_Scatty_Gruft_Info;
	permanent = FALSE;
	description = "А что это за гробница?";
};


func int DIA_Addon_Scatty_Gruft_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Scatty_Hi) && (SCATTY_TP == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Scatty_Gruft_Info()
{
	AI_Output(other,self,"DIA_Addon_Scatty_Gruft_15_00");	//А что это за гробница?
	AI_Output(self,other,"DIA_Addon_Scatty_Gruft_01_01");	//Проклятая, роковая гробница! Ее хранители убили множество народу!
	AI_Output(other,self,"DIA_Addon_Scatty_Gruft_15_02");	//Хранители? Ты имеешь в виду таких каменных существ? Плоских и с круглой головой?
	AI_Output(self,other,"DIA_Addon_Scatty_Gruft_01_03");	//В точности! Они выходят из глубин камня целыми дюжинами.
	AI_Output(self,other,"DIA_Addon_Scatty_Gruft_01_04");	//Я с самого начала знал, что раскапывать гробницу - плохая идея.
	AI_Output(self,other,"DIA_Addon_Scatty_Gruft_01_05");	//Но Ворон был просто одержим идеей копать здесь. А когда гробницу все-таки раскопали, он пошел туда со своими охранниками.
};


instance DIA_Addon_Scatty_GruftAgain(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 2;
	condition = DIA_Addon_Scatty_GruftAgain_Condition;
	information = DIA_Addon_Scatty_GruftAgain_Info;
	permanent = FALSE;
	description = "Что Ворону нужно в гробнице?";
};


func int DIA_Addon_Scatty_GruftAgain_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Scatty_Gruft) && (SCATTY_TP == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Scatty_GruftAgain_Info()
{
	AI_Output(other,self,"DIA_Addon_Scatty_GruftAgain_15_00");	//Что Ворону нужно в гробнице?
	AI_Output(self,other,"DIA_Addon_Scatty_GruftAgain_01_01");	//(резко останавливается) Хм... ты очень любопытен. Ты напоминаешь мне одного парня, что я когда-то знал.
	AI_Output(self,other,"DIA_Addon_Scatty_GruftAgain_01_02");	//Он был таким же любопытным. И в какой-то момент это стало причиной его гибели.
	AI_Output(other,self,"DIA_Addon_Scatty_GruftAgain_15_03");	//Давай-ка к делу. Что случилось в гробнице?
	AI_Output(self,other,"DIA_Addon_Scatty_GruftAgain_01_04");	//Ну... Э-э... Что-то у меня горло пересохло...
	AI_Output(other,self,"DIA_Addon_Scatty_GruftAgain_15_05");	//Эй, Скатти, НЕ СЕЙЧАС. Это важно, так что Ворону там нужно?
	AI_Output(self,other,"DIA_Addon_Scatty_GruftAgain_01_06");	//Ладно. (глубокий вдох) Он... он звал... призывал кого-то. Он произносил слова на чужом языке.
	AI_Output(self,other,"DIA_Addon_Scatty_GruftAgain_01_07");	//Яркий свет вырвался из гробницы, и я услышал вопль, который пробрал меня до костей - демонический вопль.
	AI_Output(other,self,"DIA_Addon_Scatty_GruftAgain_15_08");	//А потом?
	AI_Output(self,other,"DIA_Addon_Scatty_GruftAgain_01_09");	//Это все, что я знаю. После этого Бладвин вышел из гробницы и сказал, чтобы я проваливал. Что я и сделал.
	AI_Output(self,other,"DIA_Addon_Scatty_GruftAgain_01_10");	//Через короткое время Ворон со своими людьми вернулся в храм. И с тех пор никто не видел Ворона.
};


instance DIA_Addon_Scatty_Trinken(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 99;
	condition = DIA_Addon_Scatty_Trinken_Condition;
	information = DIA_Addon_Scatty_Trinken_Info;
	permanent = FALSE;
	description = "Хочешь выпить?";
};


func int DIA_Addon_Scatty_Trinken_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Scatty_GruftAgain) && (SCATTY_TP == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Scatty_Trinken_Info()
{
	AI_Output(other,self,"DIA_Addon_Scatty_Trinken_15_00");	//Хочешь выпить?
	AI_Output(self,other,"DIA_Addon_Scatty_Trinken_01_01");	//Хорошо бы...пива! Но вряд ли в лагере есть пиво.
	AI_Output(self,other,"DIA_Addon_Scatty_Trinken_01_02");	//Но, может быть, у Люсии есть бутылочка...
};


instance DIA_Addon_Scatty_Bier(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 99;
	condition = DIA_Addon_Scatty_Bier_Condition;
	information = DIA_Addon_Scatty_Bier_Info;
	permanent = FALSE;
	description = "Вот, твое пиво!";
};

func int DIA_Addon_Scatty_Bier_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Scatty_Trinken) && Npc_HasItems(other,ItFo_Beer) && (SCATTY_TP == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Scatty_Bier_Info()
{
	AI_Output(other,self,"DIA_Addon_Scatty_Bier_15_00");	//Вот, твое пиво!
	if(B_GiveInvItems(other,self,ItFo_Beer,1))
	{
		AI_UseItem(self,ItFo_Beer);
	};
	AI_Output(self,other,"DIA_Addon_Scatty_Bier_01_01");	//О, спасибо. Это вкусно. Спасибо! Ты мой герой!
	AI_Output(self,other,"DIA_Addon_Scatty_Bier_01_02");	//За это я даже продам тебе более лучшие доспехи.
	SCATTY_CANTRADESHC = TRUE;
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Addon_Scatty_Gold(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 2;
	condition = DIA_Addon_Scatty_Gold_Condition;
	information = DIA_Addon_Scatty_Gold_Info;
	permanent = FALSE;
	description = "Что мне нужно знать о добыче золота?";
};


func int DIA_Addon_Scatty_Gold_Condition()
{
	if(SCATTY_TP == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Scatty_Gold_Info()
{
	B_Say(other,self,"$ADDON_GOLD_DESCRIPTION");
	AI_Output(self,other,"DIA_Addon_Scatty_Gold_01_00");	//Возьми кирку в руки и рубани по золотой жиле - каждый может это сделать.
	AI_Output(self,other,"DIA_Addon_Scatty_Gold_01_01");	//Но, если так сделать, разлетится много самородков. Поэтому копать должны люди, которые понимают в этом деле.
	AI_Output(self,other,"DIA_Addon_Scatty_Gold_01_02");	//Я смогу рассказать тебе больше, когда у тебя будет больше опыта.
};

instance DIA_Addon_Scatty_teach(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 2;
	condition = DIA_Addon_Scatty_teach_Condition;
	information = DIA_Addon_Scatty_teach_Info;
	permanent = TRUE;
	description = "Научи меня добывать золото.";
};

func int DIA_Addon_Scatty_teach_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Scatty_Gold) && (Hero_HackChance < 100))
	{
		return TRUE;
	};
};

func void DIA_Addon_Scatty_teach_Info()
{
	if(KNOWHOWPICKGOLD == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Scatty_teach_15_00");	//Расскажи мне больше о добыче золота.
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Scatty_teach_01_05");	//Научи меня добывать золото.
	};

	Info_ClearChoices(DIA_Addon_Scatty_teach);
	Info_AddChoice(DIA_Addon_Scatty_teach,Dialog_Back,DIA_Addon_Scatty_teach_Back);
	Info_AddChoice(DIA_Addon_Scatty_teach,b_buildlearnstringforgoldhunt("Добыча золота",B_GetLearnCostTalent(other,NPC_TALENT_GOLDWORK,1)),DIA_Addon_Scatty_teach_GOLDWORK);
};

func void DIA_Addon_Scatty_teach_Back()
{
	Info_ClearChoices(DIA_Addon_Scatty_teach);
};

func void DIA_Addon_Scatty_teach_GOLDWORK()
{
	if(b_teachplayertalentgoldhunt(self,other,NPC_TALENT_GOLDWORK))
	{
		if(SCATTYTEACHMOREGOLD == FALSE)
		{
			AI_Output(self,other,"DIA_Addon_Scatty_teach_01_01");	//В первую очередь ты должен знать, что золото - это не руда. Оно мягкое, как масло. Если ты ударишь слишком сильно - все разлетится!
			AI_Output(self,other,"DIA_Addon_Scatty_teach_01_02");	//У каждого рудокопа есть свои приемы, позволяющие ему отделить самородки от породы.
			AI_Output(self,other,"DIA_Addon_Scatty_teach_01_03");	//В конечном итоге эти приемы отличают просто рудокопа от хорошего рудокопа.
			AI_Output(self,other,"DIA_Addon_Scatty_teach_01_04");	//Кроме этого, повторение - мать учения. Только работая ты станешь хорошим рудокопом.
			SCATTYTEACHMOREGOLD = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Scatty_teach_01_06");	//Хорошо! Я расскажу. (рассказывает)
		};
	};

	Info_ClearChoices(DIA_Addon_Scatty_teach);
};

instance DIA_Addon_Scatty_tot(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 2;
	condition = DIA_Addon_Scatty_tot_Condition;
	information = DIA_Addon_Scatty_tot_Info;
	permanent = FALSE;
	description = "Бладвин мертв.";
};


func int DIA_Addon_Scatty_tot_Condition()
{
	if(Npc_IsDead(Bloodwyn) && (SCATTY_TP == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Scatty_tot_Info()
{
	AI_Output(other,self,"DIA_Addon_Scatty_tot_15_00");	//Бладвин мертв.
	AI_Output(self,other,"DIA_Addon_Scatty_tot_01_01");	//Хм, есть не так много людей, чьей смерти я бы желал... но мертвый Бладвин лучше живого.
};


instance DIA_Addon_Scatty_trade(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 99;
	condition = DIA_Addon_Scatty_trade_Condition;
	information = DIA_Addon_Scatty_trade_Info;
	permanent = TRUE;
	trade = TRUE;
	description = "Давай займемся делом!";
};


func int DIA_Addon_Scatty_trade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Scatty_Hi) && (SCATTY_TP == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Scatty_trade_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	B_Say(other,self,"$TRADE_1");
	B_GiveTradeInv(self);
};


instance DIA_ADDON_SCATTY_ORCINVASION(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 99;
	condition = dia_addon_scatty_orcinvasion_condition;
	information = dia_addon_scatty_orcinvasion_info;
	permanent = FALSE;
	description = "Как дела?";
};


func int dia_addon_scatty_orcinvasion_condition()
{
	if((RavenAway == TRUE) && (SCATTY_TP == TRUE) && !Npc_KnowsInfo(other,dia_addon_scatty_orcinvasion))
	{
		return TRUE;
	};
};

func void dia_addon_scatty_orcinvasion_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Scatty_OrcInvasion_01_00");	//Как дела?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Scatty_OrcInvasion_01_01");	//Как, как - да лучше не придумаешь! И откуда взялись эти орки, вообще не представляю!
	AI_Output(self,other,"DIA_Addon_BDT_10014_Scatty_OrcInvasion_01_02");	//Скажу честно, парень: у меня до сих пор коленки трясутся.
	AI_Output(other,self,"DIA_Addon_BDT_10014_Scatty_OrcInvasion_01_03");	//Ну, ты жив, что еще надо?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Scatty_OrcInvasion_01_04");	//Да, это так. Но в лагере у меня осталась добрая куча разного барахла, с которым я бы не очень хотел расставаться.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Scatty_OrcInvasion_01_05");	//А теперь туда и носа не сунешь, иначе моментально рискуешь расстаться с собственной головой!
	if(ORCSHAMAN4ISDEAD == TRUE)
	{
		B_GivePlayerXP(150);
		AI_Output(other,self,"DIA_Addon_BDT_10014_Scatty_OrcInvasion_01_06");	//Нет, парень! Не то чтобы я тебе не верю, но туда я даже и шагу не сделаю.
	};
};


instance DIA_ADDON_SCATTY_CHEST(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 99;
	condition = dia_addon_scatty_chest_condition;
	information = dia_addon_scatty_chest_info;
	permanent = FALSE;
	description = "А что это за барахло?";
};


func int dia_addon_scatty_chest_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_scatty_orcinvasion) && (SCATTYCHEST == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_scatty_chest_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Scatty_Chest_01_00");	//А что это за барахло?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Scatty_Chest_01_01");	//Ну, так, ничего особенного...(замялся)
	AI_Output(other,self,"DIA_Addon_BDT_10014_Scatty_Chest_01_02");	//Если ничего особенного, почему ты так переживаешь?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Scatty_Chest_01_03");	//Ох, парень. Да, в рот тебе палец не клади...
	AI_Output(other,self,"DIA_Addon_BDT_10014_Scatty_Chest_01_04");	//Давай, Скатти, колись. Что там?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Scatty_Chest_01_05");	//Ну ладно. В общем, там остался мой сундук, который довержу набит золотыми слитками.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Scatty_Chest_01_06");	//Сам понимаешь, что, когда мы спасались бегством из лагеря, мне как-то не сподручно было тащить его с собой.
	AI_Output(other,self,"DIA_Addon_BDT_10014_Scatty_Chest_01_07");	//Золото?!
	AI_Output(self,other,"DIA_Addon_BDT_10014_Scatty_Chest_01_08");	//Да! Мое золото, заметь! Но тебе все равно его не открыть, если ты вознамерился присвоить его себе.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Scatty_Chest_01_09");	//Там очень хитрый замок, и тебе его ни в жизнь не взломать.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Scatty_Chest_01_10");	//А ключ у меня!
	AI_Output(other,self,"DIA_Addon_BDT_10014_Scatty_Chest_01_11");	//Ну ладно, ладно. Чего ты злишься? Не собираюсь я присваивать себе твое золото.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Scatty_Chest_01_12");	//А зачем тогда ты интересуешся?
	AI_Output(other,self,"DIA_Addon_BDT_10014_Scatty_Chest_01_13");	//Может, я смогу помочь тебе? Схожу в лагерь и принесу тебе все твое золото.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Scatty_Chest_01_14");	//Ты и вправду это сделаешь?
	AI_Output(other,self,"DIA_Addon_BDT_10014_Scatty_Chest_01_15");	//Ну, если мы разделим содержимое сундука пополам, то, пожалуй, запросто.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Scatty_Chest_01_16");	//(гневно) ЧТО?!
	AI_Output(other,self,"DIA_Addon_BDT_10014_Scatty_Chest_01_17");	//Мое дело - предложить.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Scatty_Chest_01_18");	//Эх... Вижу, у меня особо нет выбора. По крайней мере, половина - это тоже что-то.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Scatty_Chest_01_19");	//Ладно, считай, договорились. Но смотри, если надуешь меня... Я найду тебя и покромсаю на куски!
	AI_Output(other,self,"DIA_Addon_BDT_10014_Scatty_Chest_01_20");	//Да не переживай ты так! Я тебя не обману.
	B_GiveInvItems(self,other,itke_scattychest,1);
	AI_Output(self,other,"DIA_Addon_BDT_10014_Scatty_Chest_01_21");	//Вот, держи ключ. И поторопись!
	AI_StopProcessInfos(self);
	SCATTYCHEST = TRUE;
	Log_CreateTopic(TOPIC_SCATTYCHEST,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SCATTYCHEST,LOG_Running);
	B_LogEntry(TOPIC_SCATTYCHEST,"Скатти рассказал мне, что в лагере остался его сундук, доверху набитый золотыми самородками. Если я принесу ему их, то половину могу оставить себе.");
};


instance DIA_ADDON_SCATTY_DOCHESTIT(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 99;
	condition = dia_addon_scatty_dochestit_condition;
	information = dia_addon_scatty_dochestit_info;
	permanent = FALSE;
	description = "По поводу золота...";
};


func int dia_addon_scatty_dochestit_condition()
{
	if((SCATTYCHEST == TRUE) && (Npc_HasItems(other,ItMi_Addon_GoldNugget) >= 500) && (SCATTYCHESTDONE == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_scatty_dochestit_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Addon_BDT_10014_Scatty_DoChestIt_01_00");	//Вот твои слитки.
	B_GiveInvItems(other,self,ItMi_Addon_GoldNugget,500);
	AI_Output(self,other,"DIA_Addon_BDT_10014_Scatty_DoChestIt_01_01");	//Ну-ка, дай посмотрю...(считает) Хммм...
	AI_Output(self,other,"DIA_Addon_BDT_10014_Scatty_DoChestIt_01_02");	//Да, вроде все правильно, столько и должно быть.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Scatty_DoChestIt_01_03");	//А я смотрю, ты честный парень. Тебе можно доверять, в отличии от этих бандитских морд!
	AI_Output(other,self,"DIA_Addon_BDT_10014_Scatty_DoChestIt_01_04");	//А ты когда-то в этом сомневался?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Scatty_DoChestIt_01_05");	//Ну, сам понимаешь - не маленький. Дружба дружбой, а золото врозь.
	AI_Output(other,self,"DIA_Addon_BDT_10014_Scatty_DoChestIt_01_06");	//Что насчет нашего договора?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Scatty_DoChestIt_01_07");	//Договор дороже денег...(смеется) Вот, возьми свою долю.
	B_GiveInvItems(self,other,ItMi_Addon_GoldNugget,250);
	AI_Output(other,self,"DIA_Addon_BDT_10014_Scatty_DoChestIt_01_08");	//Отлично.
	B_LogEntry(TOPIC_SCATTYCHEST,"Я принес Скатти золото. Как мы и договаривались, половина - моя.");
	Log_SetTopicStatus(TOPIC_SCATTYCHEST,LOG_SUCCESS);
	SCATTYCHESTDONE = TRUE;
};


instance DIA_ADDON_SCATTY_CANTRADEARMOR(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 99;
	condition = dia_addon_scatty_cantradearmor_condition;
	information = dia_addon_scatty_cantradearmor_info;
	permanent = FALSE;
	description = "Ты продаешь доспехи?";
};

func int dia_addon_scatty_cantradearmor_condition()
{
	if((SCATTY_CANTRADESHC == TRUE) && (SCATTY_CANTRADEARMOR == FALSE) && (SCATTY_TP == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_scatty_cantradearmor_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Scatty_CanTradeArmor_01_00");	//Ты продаешь доспехи?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Scatty_CanTradeArmor_01_05");	//Хмм... Я, конечно, мог бы тебе продать и доспехи стражника, но Бладвин мне голову оторвет, если узнает об этом!
	AI_Output(self,other,"DIA_Addon_BDT_10014_Scatty_CanTradeArmor_01_06");	//Это я могу сделать только по его личному распоряжению. Так что извини, парень, - в этом вопросе я ничем не могу тебе помочь.
	AI_Output(other,self,"DIA_Addon_BDT_10014_Scatty_CanTradeArmor_01_07");	//А если Бладвин вдруг умрет, например? Тогда ты сможешь мне продать эти доспехи?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Scatty_CanTradeArmor_01_08");	//Ну, если, конечно, это произойдет то... думаю, что смогу. Хотя, что-то я в этом сомневаюсь...(смеется)
	AI_Output(other,self,"DIA_Addon_BDT_10014_Scatty_CanTradeArmor_01_09");	//Понятно.
	SCATTY_CANTRADEARMOR = TRUE;
};


instance DIA_ADDON_SCATTY_ARMOR(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 3;
	condition = dia_addon_scatty_armor_condition;
	information = dia_addon_scatty_armor_info;
	permanent = TRUE;
	description = "Покажи мне свои доспехи.";
};


func int dia_addon_scatty_armor_condition()
{
	if((SCATTY_CANTRADEARMOR == TRUE) && (BLOODWYNISDEAD == TRUE) && (SCATTY_TP == FALSE) && ((SCATTY_ARMORPERM_THREE == FALSE) || (SCATTY_ARMORPERM_FOUR == FALSE)))
	{
		return TRUE;
	};
};

func void dia_addon_scatty_armor_info()
{
	AI_Output(other,self,"DIA_Addon_Scatty_Armor_15_01");	//Бладвин мертв! Теперь ты продашь мне доспехи стражника?
	AI_Output(self,other,"DIA_Addon_Scatty_Armor_15_02");	//Ну, как и обещал.

	if(SCATTY_CANTRADESHC == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Scatty_Armor_15_03");	//И даже больше. Я могу предложить тебе самое лучшее, что есть у меня!
	};

	Info_AddChoice(dia_addon_scatty_armor,Dialog_Back,dia_addon_scatty_armor_back);

	if(SCATTY_ARMORPERM_THREE == FALSE)
	{
		Info_AddChoice(dia_addon_scatty_armor,"Лeгкие доспехи стражника (Цена: 1800 монет)",dia_addon_scatty_armor_buy3);
	};
	if((SCATTY_CANTRADESHC == TRUE) && (SCATTY_ARMORPERM_FOUR == FALSE))
	{
		Info_AddChoice(dia_addon_scatty_armor,"Доспехи стражника (Цена: 2100 монет)",dia_addon_scatty_armor_buy4);
	};
};

func void dia_addon_scatty_armor_back()
{
	Info_ClearChoices(dia_addon_scatty_armor);
};

func void dia_addon_scatty_armor_buy3()
{
	AI_Output(other,self,"DIA_Addon_Scatty_Armor_Buy3_15_00");	//Хорошо, я беру эти доспехи.
	if(B_GiveInvItems(other,self,ItMi_Gold,1800))
	{
		AI_Output(self,other,"DIA_Addon_Scatty_Armor_Buy3_06_01");	//Отлично.
		B_GiveInvItems(self,other,itar_grd_l,1);
		SCATTY_ARMORPERM_THREE = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Scatty_Armor_Buy3_06_02");	//Нет денег - нет доспехов.
	};
	Info_ClearChoices(dia_addon_scatty_armor);
};

func void dia_addon_scatty_armor_buy4()
{
	AI_Output(other,self,"DIA_Addon_Scatty_Armor_Buy4_15_00");	//Хорошо, я беру эти доспехи.
	if(B_GiveInvItems(other,self,ItMi_Gold,VALUE_ITAR_Bloodwyn_Addon))
	{
		AI_Output(self,other,"DIA_Addon_Scatty_Armor_Buy4_06_01");	//Отлично.
		B_GiveInvItems(self,other,ITAR_Bloodwyn_Addon,1);
		SCATTY_ARMORPERM_FOUR = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Scatty_Armor_Buy4_06_02");	//Нет денег - нет доспехов.
	};
	Info_ClearChoices(dia_addon_scatty_armor);
};