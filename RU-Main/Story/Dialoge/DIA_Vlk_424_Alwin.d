
instance DIA_Alwin_EXIT(C_Info)
{
	npc = Vlk_424_Alwin;
	nr = 999;
	condition = DIA_Alwin_EXIT_Condition;
	information = DIA_Alwin_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Alwin_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Alwin_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Alwin_PICKPOCKET(C_Info)
{
	npc = Vlk_424_Alwin;
	nr = 900;
	condition = DIA_Alwin_PICKPOCKET_Condition;
	information = DIA_Alwin_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Alwin_PICKPOCKET_Condition()
{
	return C_Beklauen(20,10);
};

func void DIA_Alwin_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Alwin_PICKPOCKET);
	Info_AddChoice(DIA_Alwin_PICKPOCKET,Dialog_Back,DIA_Alwin_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Alwin_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Alwin_PICKPOCKET_DoIt);
};

func void DIA_Alwin_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Alwin_PICKPOCKET);
};

func void DIA_Alwin_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Alwin_PICKPOCKET);
};


instance DIA_Alwin_Sheep(C_Info)
{
	npc = Vlk_424_Alwin;
	nr = 3;
	condition = DIA_Alwin_Sheep_Condition;
	information = DIA_Alwin_Sheep_Info;
	permanent = FALSE;
	description = "Это твои овцы?";
};


func int DIA_Alwin_Sheep_Condition()
{
	return TRUE;
};

func void DIA_Alwin_Sheep_Info()
{
	AI_Output(other,self,"DIA_Alwin_Sheep_15_00");	//Это твои овцы?
	AI_Output(self,other,"DIA_Alwin_Sheep_12_01");	//Единственная овца, что принадлежит мне, отзывается на имя Люси. (смеется) Это моя жена - Люси.
	AI_Output(self,other,"DIA_Alwin_Sheep_12_02");	//Эти овцы принадлежат ополчению. Они забирают их у фермеров и приводят ко мне.
};

instance DIA_Alwin_Sheep_Do(C_Info)
{
	npc = Vlk_424_Alwin;
	nr = 3;
	condition = DIA_Alwin_Sheep_Do_Condition;
	information = DIA_Alwin_Sheep_Do_Info;
	permanent = FALSE;
	description = "А что ты с ними делаешь?";
};

func int DIA_Alwin_Sheep_Do_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Alwin_Sheep))
	{
		return TRUE;
	};
};

func void DIA_Alwin_Sheep_Do_Info()
{
   	AI_Output(other,self,"DIA_Alwin_Sheep_Do_12_00");   //А что ты с ними делаешь?
   	AI_Output(self,other,"DIA_Alwin_Sheep_Do_12_01");   //(удивленно) Как что? Забиваю! Ополчению и паладинам требуется регулярное снабжение продовольствием.
   	AI_Output(self,other,"DIA_Alwin_Sheep_Do_12_02");   //Но в последнее время это случается крайне редко, поскольку сейчас каждая живая овца почти на вес золота.
   	AI_Output(other,self,"DIA_Alwin_Sheep_Do_12_03");   //У тебя не очень сложная работа.
   	AI_Output(self,other,"DIA_Alwin_Sheep_Do_12_04");   //Ну, как тебе сказать. Да, работа несложная, но все равно требует некоторого опыта.
   	AI_Output(self,other,"DIA_Alwin_Sheep_Do_12_05");   //Поскольку надо знать, как правильно освежевать тушу и из какого места вырезать самый сочный кусок мяса.
   	AI_Output(self,other,"DIA_Alwin_Sheep_Do_12_06");   //И еще при этом не испортить его. Ну, а теперь сам посуди - сложная у меня работа или нет?
   	AI_Output(other,self,"DIA_Alwin_Sheep_Do_12_07");   //А меня можешь этому научить?
   	AI_Output(self,other,"DIA_Alwin_Sheep_Do_12_08");   //Чему? Разделывать туши? Хммм... Ну, почему бы и нет.
   	AI_Output(self,other,"DIA_Alwin_Sheep_Do_12_09");   //Но тебе придется заплатить за это! Бесплатно я этого делать не стану.
   	AI_Output(other,self,"DIA_Alwin_Sheep_Do_12_10");   //Сколько?
	AI_Output(self,other,"DIA_Alwin_Sheep_Do_12_11");   //Ну, скажем... сто пятьдесят золотых монет.
   	AI_Output(self,other,"DIA_Alwin_Sheep_Do_12_12");   //По крайней мере, это покроет мои расходы в том случае, если кто-то решит украсть одну из моих овец, пока я буду тебя учить.
	Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_CityTeacher,"Альвин может обучить меня свежевать туши животных и срезать с них съедобные куски мяса.");
};

instance DIA_Alwin_Butcher(C_Info)
{
	npc = Vlk_424_Alwin;
	nr = 5;
	condition = DIA_Alwin_Butcher_condition;
	information = DIA_Alwin_Butcher_info;
	permanent = TRUE;
	description = "Научи меня разделывать туши животных. (Очки обучения: 2, Цена: 150 монет)";
};

func int DIA_Alwin_Butcher_condition()
{
	if(Npc_KnowsInfo(other,DIA_Alwin_Sheep_Do) && (ButcherSkill == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Alwin_Butcher_info()
{
	var int kosten;
	var int money;

	AI_Output(other,self,"DIA_Alwin_Butcher_01_00");   //Научи меня разделывать туши животных.
	kosten = 2;
	money = 150;

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		B_Say(self,other,"$NOLEARNNOPOINTS");
		AI_StopProcessInfos(self);
	}
	else if(Npc_HasItems(other,ItMi_Gold) < money)
	{
		AI_Print(Print_NotEnoughGold);
		AI_Output(self,other,"DIA_Alwin_Butcher_01_90");   //Да у тебя даже золота нет!
		AI_StopProcessInfos(self);
	};
	if((hero.lp >= kosten) && (Npc_HasItems(other,ItMi_Gold) >= money))
	{
      	AI_Output(self,other,"DIA_Alwin_Butcher_01_01");   //Все просто. Главное, помни: никогда не начинай разделывать тушу с головы.
      	AI_Output(self,other,"DIA_Alwin_Butcher_01_02");   //Первый надрез лучше делать в области живота. Там кожа мягкая и легко сдирается.
      	AI_Output(self,other,"DIA_Alwin_Butcher_01_03");   //Всегда выбирай у туши только те места, где сможешь вырезать приличный кусок мяса. И чем больше, тем лучше.
      	AI_Output(self,other,"DIA_Alwin_Butcher_01_04");   //Теперь можешь попрактиковаться. Но только не вздумай делать это на моих овцах, иначе я сам с тебя шкуру спущу!
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + kosten;
		Npc_RemoveInvItems(other,ItMi_Gold,money);
		AI_Print("Изучено: разделывание туш");
		ButcherSkill = TRUE;
		Snd_Play("LevelUP");
		B_LogEntry(TOPIC_TalentAnimalTrophy,"Теперь я умею разделывать туши животных и добывать из них мясо.");
	};
};

instance DIA_Alwin_Fellan(C_Info)
{
	npc = Vlk_424_Alwin;
	nr = 2;
	condition = DIA_Alwin_Fellan_Condition;
	information = DIA_Alwin_Fellan_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Alwin_Fellan_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Npc_IsDead(Fellan) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Alwin_Fellan_Info()
{
	AI_Output(self,other,"DIA_Alwin_Fellan_12_00");	//Ох, этот стук молотка этого сумасшедшего скоро и меня сведет с ума.
	AI_Output(other,self,"DIA_Alwin_Fellan_15_01");	//О ком ты говоришь?
	AI_Output(self,other,"DIA_Alwin_Fellan_12_02");	//Разве ты не слышишь стук молотка? Кто, как ты думаешь, колотит дни напролет в портовом квартале?
	AI_Output(self,other,"DIA_Alwin_Fellan_12_03");	//Я имею в виду этого психа Феллана. Он стучит молотком по своей хижине каждый день.
};


instance DIA_Alwin_FellanRunning(C_Info)
{
	npc = Vlk_424_Alwin;
	nr = 2;
	condition = DIA_Alwin_FellanRunning_Condition;
	information = DIA_Alwin_FellanRunning_Info;
	permanent = FALSE;
	description = "Я могу поговорить с Фелланом.";
};


func int DIA_Alwin_FellanRunning_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Npc_IsDead(Fellan) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Alwin_FellanRunning_Info()
{
	AI_Output(other,self,"DIA_Alwin_FellanRunning_15_00");	//Я могу поговорить с Фелланом.
	AI_Output(self,other,"DIA_Alwin_FellanRunning_12_01");	//Ты хочешь помочь мне? А зачем тебе это?
	AI_Output(other,self,"DIA_Alwin_FellanRunning_15_02");	//Ты скажи мне.
	AI_Output(self,other,"DIA_Alwin_FellanRunning_12_03");	//Ох, вот ты как! Хорошо - если ты заставишь его перестать молотить, я заплачу тебе 25 золотых монет.
	AI_Output(self,other,"DIA_Alwin_FellanRunning_12_04");	//Но я скажу тебе сразу - ты не сможешь уговорить этого парня. Он сошел с ума. Единственное, что может помочь, это несколько хороших тумаков!
	MIS_AttackFellan = LOG_Running;
	Log_CreateTopic(TOPIC_Alwin,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Alwin,LOG_Running);
	B_LogEntry(TOPIC_Alwin,"Алвин хочет, чтобы я заставил Феллана перестать колотить молотком. Впрочем, убивать его за это не стоит.");
	Info_ClearChoices(DIA_Alwin_FellanRunning);
	Info_AddChoice(DIA_Alwin_FellanRunning,"Я посмотрю, что я смогу сделать.",DIA_Alwin_FellanRunning_Ok);
	if((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL) && (hero.guild != GIL_KDF) && (hero.guild != GIL_KDW))
	{
		Info_AddChoice(DIA_Alwin_FellanRunning,"Если я начну бить его, у меня будут проблемы с ополчением.",DIA_Alwin_FellanRunning_Problems);
	};
};

func void DIA_Alwin_FellanRunning_Ok()
{
	AI_Output(other,self,"DIA_Alwin_FellanRunning_Ok_15_00");	//Я посмотрю, что можно сделать.
	AI_Output(self,other,"DIA_Alwin_FellanRunning_Ok_12_01");	//Подумай об этом. И помни, я заплачу тебе 25 золотых.
	Info_ClearChoices(DIA_Alwin_FellanRunning);
};

func void DIA_Alwin_FellanRunning_Problems()
{
	AI_Output(other,self,"DIA_Alwin_FellanRunning_Problems_15_00");	//Если я начну бить его, у меня будут проблемы с ополчением.
	AI_Output(self,other,"DIA_Alwin_Add_12_00");	//Здесь, в порту, никто не обращает внимания на драки.
	AI_Output(self,other,"DIA_Alwin_Add_12_01");	//Но если ты украдешь что-нибудь, или убьешь овцу, у тебя будут большие проблемы.
};


instance DIA_Alwin_FellanSuccess(C_Info)
{
	npc = Vlk_424_Alwin;
	nr = 4;
	condition = DIA_Alwin_FellanSuccess_Condition;
	information = DIA_Alwin_FellanSuccess_Info;
	permanent = FALSE;
	description = "Феллан больше не будет стучать.";
};


func int DIA_Alwin_FellanSuccess_Condition()
{
	if((MIS_AttackFellan == LOG_Running) && ((FellanGeschlagen == TRUE) || Npc_IsDead(Fellan)))
	{
		return TRUE;
	};
};

func void DIA_Alwin_FellanSuccess_Info()
{
	AI_Output(other,self,"DIA_Alwin_FellanSuccess_15_00");	//Феллан больше не будет стучать.
	AI_Output(self,other,"DIA_Alwin_FellanSuccess_12_01");	//Надо же! Больше нет этого стука. Наконец-то. Я уж думал, он никогда не перестанет.
	if(Npc_IsDead(Fellan) == FALSE)
	{
		AI_Output(self,other,"DIA_Alwin_FellanSuccess_12_02");	//Ты оказал мне большую услугу. Знаешь что, я дам тебе тридцать золотых монет.
		B_GiveInvItems(self,other,ItMi_Gold,30);
		MIS_AttackFellan = LOG_SUCCESS;
		B_GivePlayerXP(XP_Ambient);
	}
	else
	{
		MIS_AttackFellan = LOG_FAILED;
	};
};


instance DIA_Alwin_Endlos(C_Info)
{
	npc = Vlk_424_Alwin;
	nr = 8;
	condition = DIA_Alwin_Endlos_Condition;
	information = DIA_Alwin_Endlos_Info;
	permanent = TRUE;
	description = "Как твои овцы?";
};


func int DIA_Alwin_Endlos_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Alwin_Sheep))
	{
		return TRUE;
	};
};

func void DIA_Alwin_Endlos_Info()
{
	AI_Output(other,self,"DIA_Alwin_Endlos_15_00");	//Как твои овцы?
	if((MIS_AttackFellan != LOG_SUCCESS) && (Npc_IsDead(Fellan) == FALSE))
	{
		AI_Output(self,other,"DIA_Alwin_Endlos_12_01");	//Стук этого Феллана сведет их с ума. Однажды они все разбегутся.
	}
	else if(Kapitel <= 2)
	{
		AI_Output(self,other,"DIA_Alwin_Endlos_12_02");	//Овцы едят и становятся все толще и толще. Прямо как моя жена. ХАХАХА (громко смеется)
	}
	else if(Kapitel == 3)
	{
		if(MIS_RescueBennet != LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Alwin_Endlos_12_03");	//Я, пожалуй, забью одну из них. На мясо для последней трапезы!
			AI_Output(other,self,"DIA_Alwin_Endlos_15_04");	//Для кого?
			AI_Output(self,other,"DIA_Alwin_Endlos_12_05");	//Для наемника, который убил паладина. Конечно же, его казнят.
			AI_Output(self,other,"DIA_Alwin_Endlos_12_06");	//Мне только нужно решить, какую из них отправить на бойню.
		}
		else
		{
			AI_Output(self,other,"DIA_Alwin_Endlos_12_07");	//Люси очень повезло, что она осталась в живых.
			AI_Output(other,self,"DIA_Alwin_Endlos_15_08");	//Я думал, что Люси - это твоя жена.
			AI_Output(self,other,"DIA_Alwin_Endlos_12_09");	//Правильно, но я также назвал эту овцу Люси. Я имею в виду овцу, которая была предназначена для последней трапезы Беннета.
			AI_Output(self,other,"DIA_Alwin_Endlos_12_10");	//Но все кончилось хорошо. Люси должна быть рада.
		};
	}
	else if(Kapitel == 4)
	{
		AI_Output(self,other,"DIA_Alwin_Endlos_12_11");	//Откровенно говоря, смотреть за тем, как овцы едят - такая скука!
	}
	else
	{
		AI_Output(self,other,"DIA_Alwin_Endlos_12_12");	//Я говорю им - прощайте. Лорд Хаген приказал, чтобы все овцы пошли на провиант для его армии.
		AI_Output(self,other,"DIA_Alwin_Endlos_12_13");	//Ну, теперь я хотя бы буду проводить больше времени со своей женой.
	};
};

instance DIA_Alwin_GiveAmulet(C_Info)
{
	npc = Vlk_424_Alwin;
	nr = 2;
	condition = DIA_Alwin_GiveAmulet_condition;
	information = DIA_Alwin_GiveAmulet_info;
	permanent = FALSE;
	description = "Меня прислал к тебе Хольгер.";
};

func int DIA_Alwin_GiveAmulet_condition()
{
	if(MIS_HOLGER_QUEST == 1)
	{
		return TRUE;
	};
};

func void DIA_Alwin_GiveAmulet_info()
{
	AI_Output(other,self,"DIA_Alwin_GiveAmulet_01_01");	//Меня прислал к тебе Хольгер.
	AI_Output(self,other,"DIA_Alwin_GiveAmulet_01_02");	//(удивленно) Мой сын? Люси! Ты слышала? Наконец-то пришла весточка от Хольгера.
	AI_Output(self,other,"DIA_Alwin_GiveAmulet_01_03");	//Ну, как он там поживает? Ни в чем не нуждается?
	AI_Output(other,self,"DIA_Alwin_GiveAmulet_01_04");	//Ни в чем, как мне показалось.
	AI_Output(other,self,"DIA_Alwin_GiveAmulet_01_05");	//Единственное, что ему там не нравится, так это чрезмерная дисциплина.
	AI_Output(self,other,"DIA_Alwin_GiveAmulet_01_06");	//Узнаю своего сына! Никогда не был послушным дитeм.
	AI_Output(other,self,"DIA_Alwin_GiveAmulet_01_07");	//Он попросил меня забрать кое-какой амулет и сказал, что вы должны понять, о чем идет речь.
	AI_Output(self,other,"DIA_Alwin_GiveAmulet_01_08");	//Вот этот, наверное. Эту вещицу мы подарили Хольгеру, когда ему было еще восемь лет. 
	AI_Output(self,other,"DIA_Alwin_GiveAmulet_01_09");	//Она должна была приносить счастье, но в тот злосчастный день он забыл надеть этот амулет... 
	AI_Output(self,other,"DIA_Alwin_GiveAmulet_01_10");	//Вот, передай его ему и скажи, что мы по нему очень скучаем!
	B_GiveInvItems(self,other,itam_holger_amulet,1);
	AI_Output(other,self,"DIA_Alwin_GiveAmulet_01_11");	//Ладно, передам.
	MIS_HOLGER_QUEST = 2;
	B_LogEntry(TOPIC_BADSON,"Кое-что прояснилось. Оказывается, Хольгер - сын Альвина. Кто бы мог подумать. Только что имел в виду Альвин, когда сказал про 'тот злосчастный день'? Хольгер должен будет мне рассказать все!");

	if(Npc_HasItems(other,itwr_holger_letter) >= 1)
	{
		B_GivePlayerXP(50);
		AI_Output(other,self,"DIA_Alwin_GiveAmulet_01_12");	//И еще кое-что, чуть не забыл...
		AI_Output(other,self,"DIA_Alwin_GiveAmulet_01_13");	//Он еще просил передать вам вот это письмо.
		B_GiveInvItems(other,self,itwr_holger_letter,1);
		B_UseFakeScroll();

		if((hero.guild != GIL_NDM) && (hero.guild != GIL_KDM))
		{
			AI_Output(self,other,"DIA_Alwin_GiveAmulet_01_14");	//Большое спасибо! Пусть Иннос поможет тебе в твоих делах.
		}
		else
		{
			AI_Output(self,other,"DIA_Alwin_GiveAmulet_01_15");	//(про себя) Некромант делает добро людям... Видать, ничего я уже не понимаю в этой жизни! Старею, наверное...
		};
	};
};