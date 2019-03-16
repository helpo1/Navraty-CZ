
instance DIA_HOLGER_EXIT(C_Info)
{
	npc = nov_11114_holger;
	nr = 999;
	condition = dia_holger_exit_condition;
	information = dia_holger_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_holger_exit_condition()
{
	return TRUE;
};

func void dia_holger_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HOLGER_STORY(C_Info)
{
	npc = nov_11114_holger;
	nr = 1;
	condition = dia_holger_story_condition;
	information = dia_holger_story_info;
	important = FALSE;
	permanent = TRUE;
	description = "Расскажи мне всю историю.";
};

func int dia_holger_story_condition()
{
	if(MIS_HOLGER_QUEST == 3)
	{
		return TRUE;
	};
};

func void dia_holger_story_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Holger_01_01");	//Расскажи мне всю историю, как и обещал.
	AI_Output(self,other,"DIA_Holger_01_02");	//Да что тут теперь скрывать. В монастыре я около года.
	AI_Output(self,other,"DIA_Holger_01_03");	//Тогда еще над Долиной Рудников стоял Барьер, и Хоринис процветал. Но в один 'прекрасный' день я подрался с кем-то в трактире Корагона.
	AI_Output(self,other,"DIA_Holger_01_04");	//Я был в стельку пьян, и не помню, с чего все началось. Но драка закончилась плохо для нас двоих.
	AI_Output(self,other,"DIA_Holger_01_05");	//Рона - так звали того парня - я избил чуть ли не до полусмерти, и меня уже хотели кинуть за Барьер.
	AI_Output(self,other,"DIA_Holger_01_06");	//Но мой отец собрал все деньги, которые у нас тогда были, и отдал меня в монастырь.
	AI_Output(self,other,"DIA_Holger_01_07");	//Он был вынужден продать почти все. И после этого я не могу смотреть ему в глаза.
	AI_Output(self,other,"DIA_Holger_01_08");	//И именно поэтому я не смог отправиться к нему сам.
	AI_Output(other,self,"DIA_Holger_01_09");	//Да уж, история не из веселых. Но я хочу тебе сказать, что твои родители очень по тебе скучают и хотят тебя увидеть.
	AI_Output(self,other,"DIA_Holger_01_10");	//Правда? Они не гневаются на меня? Ты не лжешь?
	AI_Output(other,self,"DIA_Holger_01_11");	//Нет конечно.
	AI_Output(self,other,"DIA_Holger_01_12");	//Тогда я скоро буду у них!
	MIS_HOLGER_QUEST = 4;
	Log_SetTopicStatus(TOPIC_BADSON,LOG_SUCCESS);
	B_LogEntry(TOPIC_BADSON,"Теперь, наконец, все встало на свои места. Хольгер - человек, которому просто в жизни не повезло. И монастырь для него был единственным спасением. Надеюсь, что теперь у него с Альвином будут нормальные отношения.");
	INNOSPRAYCOUNT += 1;
	Npc_ExchangeRoutine(nov_11114_holger,"Smoke");
};

instance DIA_HOLGER_HELLO(C_Info)
{
	npc = nov_11114_holger;
	nr = 1;
	condition = dia_holger_hello_condition;
	information = dia_holger_hello_info;
	important = TRUE;
	permanent = FALSE;
};

func int dia_holger_hello_condition()
{
	if(Wld_IsTime(20,0,8,0) && (Kapitel <= 2) && (MIS_HOLGER_QUEST < 1))
	{
		return TRUE;
	};
};

func void dia_holger_hello_info()
{
	AI_Output(self,other,"DIA_Holger_Hello_01_01");	//Эй! Подожди минутку.
	AI_Output(self,other,"DIA_Holger_Hello_01_02");	//У меня к тебе есть одно дело. Ты можешь принести мне кое-что?
	AI_Output(other,self,"DIA_Holger_Hello_01_03");	//Воды? Еды? Болотника?
	AI_Output(self,other,"DIA_Holger_Hello_01_04");	//Нет, мне это не нужно. Здесь в монастыре этого добра хватает.
	AI_Output(self,other,"DIA_Holger_Hello_01_05");	//А если ты упомянешь болотник при магах или еще как-нибудь провинишься, тебе придется долго мести пыль в подвалах.
	AI_Output(self,other,"DIA_Holger_Hello_01_06");	//Вон, бедолага Рэм случайно уронил черный гриб в чан с вином. Так Горакс его уже третью неделю заставляет работать метлой.
	AI_Output(self,other,"DIA_Holger_Hello_01_07");	//И если честно, я даже не знаю, когда он остынет.
	AI_Output(other,self,"DIA_Holger_Hello_01_08");	//Жаль, конечно, этого парня. Но давай ближе к делу!
	AI_Output(self,other,"DIA_Holger_Hello_01_09");	//Ах да. Заговорился я что-то... Так вот, не мог бы ты забрать одну вещицу у Альвина? Если быть точным - один амулет.
	AI_Output(other,self,"DIA_Holger_Hello_01_10");	//И как мне его достать - украсть, купить?
	AI_Output(self,other,"DIA_Holger_Hello_01_11");	//Нет, что ты! Просто назови о... э-э... ему мое имя и передай вот это письмо. Он поймет, о чем идет речь.
	AI_Output(other,self,"DIA_Holger_Hello_01_12");	//А почему ты сам не сходишь в Хоринис, чтобы забрать у Альвина этот амулет?
	AI_Output(self,other,"DIA_Holger_Hello_01_13");	//(замявшись) Понимаешь, это долгая история...
	AI_Output(self,other,"DIA_Holger_Hello_01_14");	//Давай так: ты принесешь мне амулет, тогда я тебе расскажу всю историю и еще кое-чем помогу. Согласен?
	Info_ClearChoices(dia_holger_hello);
	Info_AddChoice(dia_holger_hello,"Хорошо, интересно будет послушать.",dia_holger_hello_yes);
	Info_AddChoice(dia_holger_hello,"Нет, не хочу вмешиваться в ваши дела.",dia_holger_hello_no);
};

func void dia_holger_hello_yes()
{
	AI_Output(other,self,"DIA_Holger_Hello_Yes_01_01");	//Хорошо, интересно будет послушать.
	AI_Output(self,other,"DIA_Holger_Hello_Yes_01_02");	//Тогда жду тебя с новостями.
	B_GiveInvItems(self,hero,itwr_holger_letter,1);
	Log_CreateTopic(TOPIC_BADSON,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BADSON,LOG_Running);
	MIS_HOLGER_QUEST = 1;
	B_LogEntry(TOPIC_BADSON,"Я поговорил с послушником по имени Хольгер. Он попросил меня принести ему из города какой-то амулет. И эта драгоценность почему-то находится у пастуха Альвина. Какая-то мутная история... Стоит в ней разобраться.");
	Info_ClearChoices(dia_holger_hello);
};

func void dia_holger_hello_no()
{
	AI_Output(other,self,"DIA_Holger_Hello_No_01_01");	//Нет, я не хочу вмешиваться в ваши дела.
	AI_Output(self,other,"DIA_Holger_Hello_No_01_02");	//Что же. Нет так нет.
	Info_ClearChoices(dia_holger_hello);
};


instance DIA_Holger_GiveAmulet(C_Info)
{
	npc = nov_11114_holger;
	nr = 1;
	condition = DIA_Holger_GiveAmulet_condition;
	information = DIA_Holger_GiveAmulet_info;
	permanent = FALSE;
	description = "Я принес тебе твой амулет.";
};

func int DIA_Holger_GiveAmulet_condition()
{
	if((MIS_HOLGER_QUEST == 2) && (Npc_HasItems(other,itam_holger_amulet) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Holger_GiveAmulet_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Holger_GiveAmulet_01_01");	//Я принес тебе твой амулет.
	AI_Output(self,other,"DIA_Holger_GiveAmulet_01_02");	//Ты не шутишь, приятель?
	AI_Output(other,self,"DIA_Holger_GiveAmulet_01_03");	//Вот, держи его.
	B_GiveInvItems(other,self,itam_holger_amulet,1);
	Npc_RemoveInvItems(self,itam_holger_amulet,1);
	AI_Output(self,other,"DIA_Holger_GiveAmulet_01_04");	//Да, это действительно он! Большое тебе спасибо.
	AI_Output(self,other,"DIA_Holger_GiveAmulet_01_05");	//Вот, теперь этот свиток огненной бури твой.
	B_GiveInvItems(self,other,ItSc_Firestorm,1);
	B_LogEntry(TOPIC_BADSON,"Я поговорил с послушником по имени Хольгер. Он попросил меня принести ему из города какой-то амулет. И эта драгоценность почему-то находится у пастуха Альвина. Какая-то мутная история... Стоит в ней разобраться.");
	MIS_HOLGER_QUEST = 3;
};

instance DIA_Holger_Wurst(C_Info)
{
	npc = nov_11114_holger;
	nr = 2;
	condition = DIA_Holger_Wurst_Condition;
	information = DIA_Holger_Wurst_Info;
	permanent = FALSE;
	description = "Вот, у меня есть баранья колбаса для тебя.";
};

func int DIA_Holger_Wurst_Condition()
{
	if((Kapitel == 1) && (MIS_HOLGER_QUEST < 4) && (MIS_GoraxEssen == LOG_Running) && (Npc_HasItems(self,ItFo_Schafswurst) == 0) && (Npc_HasItems(other,ItFo_Schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Holger_Wurst_Info()
{
	var string NovizeText;
	var string NovizeLeft;
	AI_Output(other,self,"DIA_Agon_Wurst_15_00");	//Вот, у меня есть баранья колбаса для тебя.
	AI_Output(self,other,"DIA_Agon_Wurst_07_03");	//Ладно, давай ее сюда.
	B_GiveInvItems(other,self,ItFo_Schafswurst,1);
	Wurst_Gegeben = Wurst_Gegeben + 1;
	CreateInvItems(self,ItFo_Sausage,1);
	B_UseItem(self,ItFo_Sausage);
};

instance DIA_HOLGER_TRADE(C_Info)
{
	npc = nov_11114_holger;
	nr = 1;
	condition = dia_holger_trade_condition;
	information = dia_holger_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "У тебя есть что-нибудь на продажу?";
};

func int dia_holger_trade_condition()
{
	if(HOLGER_TRADE_COND == TRUE)
	{
		return TRUE;
	};
};

func void dia_holger_trade_info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_holger_TRADE_01_01");	//У тебя есть что-нибудь на продажу?
	AI_Output(self,other,"DIA_holger_TRADE_01_02");	//Смотри сам...
	B_GiveTradeInv(self);
};

instance DIA_HOLGER_RELAX(C_Info)
{
	npc = nov_11114_holger;
	nr = 1;
	condition = dia_holger_relax_condition;
	information = dia_holger_relax_info;
	permanent = TRUE;
	description = "Ну, как дела?";
};

func int dia_holger_relax_condition()
{
	if((MIS_HOLGER_QUEST == 4) && (Npc_GetDistToWP(nov_11114_holger,"NW_CITY_PATH_HABOUR_08_B") <= 100))
	{
		return TRUE;
	};
};

func void dia_holger_relax_info()
{
	AI_Output(other,self,"DIA_holger_Relax_01_01");	//Ну, как дела?
	AI_Output(self,other,"DIA_holger_Relax_01_02");	//Прекрасно! Родители приняли меня, простив прошлые промашки.
	AI_Output(self,other,"DIA_holger_Relax_01_03");	//Теперь я снова дома, и могу хоть немного побыть рядом с ними.

	if(hero.guild != GIL_KDF)
	{
		AI_Output(self,other,"DIA_holger_Relax_01_04");	//И еще я чертовски рад выкурить старый добрый косяк! А то в монастыре этим особо не позанимаешься.
	};

	AI_Output(self,other,"DIA_holger_Relax_01_05");	//Я отпросился всего на пару недель. Если я понадоблюсь тебе, можешь потом найти меня там же, в монастыре.

	MIS_HOLGER_QUEST = 5;
	HOLGER_TRADE_COND = TRUE;
};

instance DIA_HOLGER_PICKPOCKET(C_Info)
{
	npc = nov_11114_holger;
	nr = 900;
	condition = dia_holger_pickpocket_condition;
	information = dia_holger_pickpocket_info;
	permanent = TRUE;
	description = Pickpocket_40;
};

func int dia_holger_pickpocket_condition()
{
	return C_Beklauen(54,70);
};

func void dia_holger_pickpocket_info()
{
	Info_ClearChoices(dia_holger_pickpocket);
	Info_AddChoice(dia_holger_pickpocket,Dialog_Back,dia_holger_pickpocket_back);
	Info_AddChoice(dia_holger_pickpocket,DIALOG_PICKPOCKET,dia_holger_pickpocket_doit);
};

func void dia_holger_pickpocket_doit()
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

func void dia_holger_pickpocket_back()
{
	Info_ClearChoices(dia_holger_pickpocket);
};