
var int trd_mageli;

instance DIA_MILTEN_LI_EXIT(C_Info)
{
	npc = pc_mage_li;
	nr = 999;
	condition = dia_milten_li_exit_condition;
	information = dia_milten_li_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_milten_li_exit_condition()
{
	return TRUE;
};

func void dia_milten_li_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MAGE_LI_HELLOS(C_Info)
{
	npc = pc_mage_li;
	nr = 2;
	condition = dia_mage_li_hellos_condition;
	information = dia_mage_li_hellos_info;
	permanent = FALSE;
	description = "Как обстоят дела?";
};


func int dia_mage_li_hellos_condition()
{
	return TRUE;
};

func void dia_mage_li_hellos_info()
{
	AI_Output(other,self,"DIA_Mage_LI_Ancient_01_01");	//Как обстоят дела?
	AI_Output(self,other,"DIA_Mage_LI_Ancient_01_02");	//Пока вроде бы все нормально. Все парни потихоньку приходят в себя после этого ужасного шторма!
	AI_Output(self,other,"DIA_Mage_LI_Ancient_01_04");	//Но меня все-таки беспокоит одна вещь...
	AI_Output(self,other,"DIA_Mage_LI_Ancient_01_06");	//Когда мы только высадились на этот берег, я ощутил небольшое магическое волнение.
	AI_Output(other,self,"DIA_Mage_LI_Ancient_01_08");	//И что, по-твоему, это было?
	AI_Output(self,other,"DIA_Mage_LI_Ancient_01_09");	//Я пока не знаю... Но, возможно, его вызвало присутствие здесь на этом острове какой-то очень сильной магии.
	AI_Output(self,other,"DIA_Mage_LI_Ancient_01_10");	//Причем абсолютно мне не знакомой!
	AI_Output(self,other,"DIA_Mage_LI_Ancient_01_13");	//Думаю, что, скорее всего, ее источник находится где-то в центре этого острова.
	AI_Output(self,other,"DIA_Mage_LI_Ancient_01_15");	//Когда я попытался немного проследовать вглубь этих зарослей, то ощутил на себе куда более сильное магическое волнение.
	AI_Output(self,other,"DIA_Mage_LI_Ancient_01_21");	//И мне показалось, что вдали я увидел какую-то небольшую каменную башню!
	AI_Output(self,other,"DIA_Mage_LI_Ancient_01_22");	//Большая ее часть была сокрыта кронами деревьев, поэтому мне не удалось ее как следует разглядеть.
	AI_Output(other,self,"DIA_Mage_LI_Ancient_01_24");	//Тогда нам стоит как можно быстрее проверить эту башню!
	AI_Output(self,other,"DIA_Mage_LI_Ancient_01_26");	//Но, боюсь, что тебе придется проделывать все это в одиночку.
	AI_Output(self,other,"DIA_Mage_LI_Ancient_01_30");	//Влияние на меня этой магической силы слишком велико, и я не знаю, к каким последствиям это может привести.
	AI_Output(other,self,"DIA_Mage_LI_Ancient_01_32");	//Ладно, если мне удастся что-нибудь выяснить, - дам тебе знать.
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		self.aivar[AIV_PARTYMEMBER] = FALSE;
	};
	MIS_MILTENANCIENT = LOG_Running;
	Log_CreateTopic(TOPIC_MILTENANCIENT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MILTENANCIENT,LOG_Running);
	B_LogEntry(TOPIC_MILTENANCIENT,"Милтен рассказал мне, что, едва сойдя на берег, он ощутил магическое волнение. Возможно, оно вызвано присутствием на острове какой-то странной магической силы. По словам Милтена, источник этой магии находится в старой каменной башне, которую Милтен обнаружил при исследовании самого острова. Думаю, стоит наведаться туда и разобраться, что к чему.");
};


instance DIA_MAGE_LI_ANCIENTPROGRESS(C_Info)
{
	npc = pc_mage_li;
	nr = 2;
	condition = dia_mage_li_ancientprogress_condition;
	information = dia_mage_li_ancientprogress_info;
	permanent = FALSE;
	description = "Я обыскал эту каменную башню.";
};


func int dia_mage_li_ancientprogress_condition()
{
	if((MIS_MILTENANCIENT == LOG_Running) && (Npc_HasItems(other,itwr_ancient) >= 1))
	{
		return TRUE;
	};
};

func void dia_mage_li_ancientprogress_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Mage_LI_AncientProgress_01_01");	//Я обыскал эту каменную башню.
	AI_Output(self,other,"DIA_Mage_LI_AncientProgress_01_02");	//(заинтересованно) И как? Тебе удалось что-нибудь выяснить?
	AI_Output(other,self,"DIA_Mage_LI_AncientProgress_01_03");	//Боюсь тебя огорчить, но ничего интересного в этой башне я так и не обнаружил.
	AI_Output(other,self,"DIA_Mage_LI_AncientProgress_01_04");	//Но зато я нашел там вот эту странную книгу. Похоже, она содержит в себе необычную магическую силу.
	AI_Output(self,other,"DIA_Mage_LI_AncientProgress_01_05");	//Правда? Дай мне на нее взглянуть.
	B_GiveInvItems(other,self,itwr_ancient,1);
	AI_Output(self,other,"DIA_Mage_LI_AncientProgress_01_07");	//Хммм... похоже, ты прав!
	AI_Output(self,other,"DIA_Mage_LI_AncientProgress_01_08");	//Судя по всему, эта книга действительно содержит в себе магию.
	AI_Output(self,other,"DIA_Mage_LI_AncientProgress_01_11");	//Возможно, мне понадобится некоторое время, что бы разобраться с этим.
	AI_Output(other,self,"DIA_Mage_LI_AncientProgress_01_12");	//Хорошо. Но я так и не смог ее открыть.
	AI_Output(other,self,"DIA_Mage_LI_AncientProgress_01_13");	//Похоже, эта книга защищена каким-то магическим заклинанием.
	AI_Output(self,other,"DIA_Mage_LI_AncientProgress_01_14");	//(серьезно) Тогда, пожалуй, я постараюсь быть с ней поосторожнее. Спасибо.
	B_LogEntry(TOPIC_MILTENANCIENT,"Я принес Милтену книгу, которую обнаружил в каменной башне. Он пообещал разобраться со всем этим.");
	MILTENDEMONTIMER = Wld_GetDay();
};


instance DIA_MAGE_LI_ANCIENTPROGRESSTWO(C_Info)
{
	npc = pc_mage_li;
	nr = 2;
	condition = dia_mage_li_ancientprogresstwo_condition;
	information = dia_mage_li_ancientprogresstwo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_mage_li_ancientprogresstwo_condition()
{
	var int daynow;
	daynow = Wld_GetDay();
	if((MIS_MILTENANCIENT == LOG_Running) && (MEANDMILTENTELEPORTDC == FALSE) && Npc_KnowsInfo(hero,dia_mage_li_ancientprogress) && (MILTENDEMONTIMER <= (daynow - 1)))
	{
		return TRUE;
	};
};

func void dia_mage_li_ancientprogresstwo_info()
{
	B_GivePlayerXP(100);
	AI_Output(self,other,"DIA_Mage_LI_AncientProgressTwo_01_01");	//Постой! У меня есть новости насчет той книги, которую ты мне принес.
	AI_Output(self,other,"DIA_Mage_LI_AncientProgressTwo_01_03");	//Кажется, я понял, как ее можно открыть.
	AI_Output(self,other,"DIA_Mage_LI_AncientProgressTwo_01_05");	//Но мне как-то не по себе от этой идеи!
	AI_Output(other,self,"DIA_Mage_LI_AncientProgressTwo_01_06");	//Чего ты боишься?
	AI_Output(self,other,"DIA_Mage_LI_AncientProgressTwo_01_07");	//Я не боюсь... Просто кто знает - какую тайну она скрывает...
	AI_Output(other,self,"DIA_Mage_LI_AncientProgressTwo_01_08");	//Да брось! Что может произойти из-за того, что мы просто откроем книгу?
	AI_Output(self,other,"DIA_Mage_LI_AncientProgressTwo_01_09");	//Ну ладно, как скажешь. Ты готов?
	B_LogEntry(TOPIC_MILTENANCIENT,"Кажется, Милтен разгадал секрет этой книги. Теперь мы попытаемся ее открыть.");
	Info_ClearChoices(dia_mage_li_ancientprogresstwo);
	Info_AddChoice(dia_mage_li_ancientprogresstwo,"Давай, открывай!",dia_mage_li_ancientprogresstwo_freedemon);
};

func void dia_mage_li_ancientprogresstwo_freedemon()
{
	AI_StopProcessInfos(self);
	MEANDMILTENTELEPORTDC = TRUE;
	B_UseFakeScroll();
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
	Snd_Play("DEM_WARN");
	Wld_SendTrigger("LI_TRIGGER_TELEPORTDC");
};


instance DIA_MAGE_LI_ANCIENTPROGRESSTHREE(C_Info)
{
	npc = pc_mage_li;
	nr = 2;
	condition = dia_mage_li_ancientprogressthree_condition;
	information = dia_mage_li_ancientprogressthree_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_mage_li_ancientprogressthree_condition()
{
	if((MIS_MILTENANCIENT == LOG_Running) && (MEANDMILTENTELEPORTDC == TRUE) && (MEANDMILTENTELEPORTDCDONE == TRUE) && (Hlp_StrCmp(Npc_GetNearestWP(self),"DEM_CAVE_01") == TRUE))
	{
		return TRUE;
	};
};

func void dia_mage_li_ancientprogressthree_info()
{
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_Mage_LI_AncientProgressThree_01_01");	//(в недоумении) Черт! Где мы, и что все это было?
	AI_Output(self,other,"DIA_Mage_LI_AncientProgressThree_01_03");	//Не стоило нам открывать эту книгу - с древней магией шутки плохи!
	AI_Output(other,self,"DIA_Mage_LI_AncientProgressThree_01_04");	//И что нам теперь делать?
	AI_Output(self,other,"DIA_Mage_LI_AncientProgressThree_01_05");	//Это ты у меня спрашиваешь? Понятия не имею!
	AI_Output(other,self,"DIA_Mage_LI_AncientProgressThree_01_06");	//Ладно, не переживай! Что-нибудь придумаем.
	AI_Output(self,other,"DIA_Mage_LI_AncientProgressThree_01_07");	//Да уж...
	AI_Output(other,self,"DIA_Mage_LI_AncientProgressThree_01_08");	//Пойдем осмотрим эту пещеру.
	AI_Output(self,other,"DIA_Mage_LI_AncientProgressThree_01_09");	//Хорошо!
	B_LogEntry(TOPIC_MILTENANCIENT,"Мы с Милтеном оказались в какой-то пещере глубоко под землей. Интересно, куда на этот раз нас занесло?");
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"FOLLOW");
};


instance DIA_MAGE_LI_ANCIENTPROGRESSTHREE_SLEEP(C_Info)
{
	npc = pc_mage_li;
	nr = 14;
	condition = dia_mage_li_ancientprogressthree_sleep_condition;
	information = dia_mage_li_ancientprogressthree_sleep_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_mage_li_ancientprogressthree_sleep_condition()
{
	if(((Npc_GetDistToWP(self,"EASTER_SKELETON_3") < 2000) || (Npc_GetDistToWP(self,"EASTER_SKELETON_2") < 2000) || (Npc_GetDistToWP(self,"EASTER_ASH") < 5000)) && (self.aivar[AIV_PARTYMEMBER] == TRUE) && (MIS_MILTENANCIENT == LOG_Running) && (LIDEMCAVEAWAY != TRUE))
	{
		return TRUE;
	};
};

func void dia_mage_li_ancientprogressthree_sleep_info()
{
	AI_Output(self,other,"DIA_Mage_LI_AncientProgressThree_SLEEP_01_01");	//Черт!!! Что за хрень огнедышащая?
	AI_Output(self,other,"DIA_Mage_LI_AncientProgressThree_SLEEP_01_02");	//Я как раз хотел опробовать одну руну!
	AI_StopProcessInfos(self);
};


instance DIA_MAGE_LI_ANCIENTPROGRESSTHREE_WAIT(C_Info)
{
	npc = pc_mage_li;
	nr = 13;
	condition = dia_mage_li_ancientprogressthree_wait_condition;
	information = dia_mage_li_ancientprogressthree_wait_info;
	permanent = TRUE;
	description = "Подожди здесь!";
};


func int dia_mage_li_ancientprogressthree_wait_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (MIS_MILTENANCIENT == LOG_Running) && (LIDEMCAVEAWAY != TRUE) && (MEANDMILTENTELEPORTDC == TRUE) && (MEANDMILTENTELEPORTDCDONE == TRUE))
	{
		return TRUE;
	};
};

func void dia_mage_li_ancientprogressthree_wait_info()
{
	AI_Output(other,self,"DIA_Addon_Diego_WarteHier_15_00");	//Подожди здесь!
	AI_Output(self,other,"DIA_Mage_LI_GoHome_11_05");	//Я подожду поблизости.
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"CAVE");
};


instance DIA_MAGE_LI_ANCIENTPROGRESSTHREE_FOLL(C_Info)
{
	npc = pc_mage_li;
	nr = 12;
	condition = dia_mage_li_ancientprogressthree_foll_condition;
	information = dia_mage_li_ancientprogressthree_foll_info;
	permanent = TRUE;
	description = "Пойдем со мной.";
};


func int dia_mage_li_ancientprogressthree_foll_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == FALSE) && (LIDEMCAVEAWAY != TRUE) && (MEANDMILTENTELEPORTDC == TRUE) && (MEANDMILTENTELEPORTDCDONE == TRUE))
	{
		return TRUE;
	};
};

func void dia_mage_li_ancientprogressthree_foll_info()
{
	AI_Output(other,self,"DIA_Addon_Diego_ComeOn_15_00");	//Пойдем со мной.
	AI_Output(self,other,"DIA_Mage_LI_ComeOn_11_02");	//Хорошо.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FOLLOW");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
};


instance DIA_MAGE_LI_ANCIENTPROGRESSDONE(C_Info)
{
	npc = pc_mage_li;
	nr = 2;
	condition = dia_mage_li_ancientprogressdone_condition;
	information = dia_mage_li_ancientprogressdone_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_mage_li_ancientprogressdone_condition()
{
	if((MIS_MILTENANCIENT == LOG_Running) && (LIDEMONISDEAD == TRUE))
	{
		return TRUE;
	};
};

func void dia_mage_li_ancientprogressdone_info()
{
	B_GivePlayerXP(200);
	AI_Output(self,other,"DIA_Mage_LI_AncientProgressDone_01_01");	//С тобой все в порядке?..(переводя дух) Что это была за тварь?!
	AI_Output(other,self,"DIA_Mage_LI_AncientProgressDone_01_04");	//Похоже, что демон. Но теперь расслабься! Все уже позади.
	AI_Output(self,other,"DIA_Mage_LI_AncientProgressDone_01_05");	//Ладно... Радует хотя бы то, что он для нас более не опасен.
	AI_Output(self,other,"DIA_Mage_LI_AncientProgressDone_01_06");	//Правда, теперь нам надо подумать, как выбраться из этого места. У тебя есть идеи?
	AI_Output(other,self,"DIA_Mage_LI_AncientProgressDone_01_07");	//Кажется, в начале этого тунеля я видел телепорт.
	AI_Output(self,other,"DIA_Mage_LI_AncientProgressDone_01_10");	//Тогда идем быстрее! А то у меня от этой пещеры уже мурашки по коже.
	self.flags = 0;
	B_LogEntry(TOPIC_MILTENANCIENT,"Кажется, этот остров полон сюрпризов. В пещере мы наткнулись на огромного темного демона. Тварь оказалась чудовищно сильна, однако мы с Милтеном все-таки справились с ней. Теперь, когда демон мертв, надо попытаться выбраться из этого могильника.");
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_MAGE_LI_ANCIENTPROGRESSDONEEXT(C_Info)
{
	npc = pc_mage_li;
	nr = 2;
	condition = dia_mage_li_ancientprogressdoneext_condition;
	information = dia_mage_li_ancientprogressdoneext_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_mage_li_ancientprogressdoneext_condition()
{
	if((MIS_MILTENANCIENT == LOG_Running) && (LIDEMCAVEAWAY == TRUE))
	{
		return TRUE;
	};
};

func void dia_mage_li_ancientprogressdoneext_info()
{
	B_GivePlayerXP(200);
	AI_Output(self,other,"DIA_Mage_LI_AncientProgressDoneExt_01_01");	//Наконец-то все это закончилось.
	AI_Output(self,other,"DIA_Mage_LI_AncientProgressDoneExt_01_03");	//Судьба преподнесла нам хороший урок за нашу неосторожность!
	AI_Output(self,other,"DIA_Mage_LI_AncientProgressDoneExt_01_04");	//Хорошо, что мы еще остались живы! А то бы все могло закончиться для нас куда хуже...
	AI_Output(other,self,"DIA_Mage_LI_AncientProgressDoneExt_01_05");	//Значит, теперь все в порядке?
	AI_Output(self,other,"DIA_Mage_LI_AncientProgressDoneExt_01_06");	//Да. Но мне, правда, кажется, что что-то все-таки изменилось.
	AI_Output(self,other,"DIA_Mage_LI_AncientProgressDoneExt_01_08");	//Я больше не ощущаю присутствие той магической силы, что раньше окутывала этот остров. Она исчезла!
	AI_Output(self,other,"DIA_Mage_LI_AncientProgressDoneExt_01_10");	//Видимо, тот демон, которого мы прикончили в пещере, и был ее источником.
	AI_Output(self,other,"DIA_Mage_LI_AncientProgressDoneExt_01_11");	//Других объяснений всего этого у меня просто нет.
	MIS_MILTENANCIENT = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_MILTENANCIENT,LOG_SUCCESS);
	B_LogEntry(TOPIC_MILTENANCIENT,"Похоже, что-то изменилось. Милтен больше не ощущает той магической силы, что раньше окутывала этот остров. Скорее всего, ее источником был тот демон, которого мы прикончили в глубокой пещере.");
	MILTENDEMONTIMEREXT = Wld_GetDay();
};


instance DIA_MAGE_LI_ANCIENTPROGRESSDONEEXTBOOK(C_Info)
{
	npc = pc_mage_li;
	nr = 2;
	condition = dia_mage_li_ancientprogressdoneextbook_condition;
	information = dia_mage_li_ancientprogressdoneextbook_info;
	permanent = FALSE;
	description = "У тебя осталась та книга?";
};


func int dia_mage_li_ancientprogressdoneextbook_condition()
{
	if(MIS_MILTENANCIENT == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_mage_li_ancientprogressdoneextbook_info()
{
	AI_Output(other,self,"DIA_Mage_LI_AncientProgressDoneExtBook_01_01");	//У тебя осталась с собой та книга?
	AI_Output(self,other,"DIA_Mage_LI_AncientProgressDoneExtBook_01_02");	//Да, она до сих пор у меня. А почему ты спрашиваешь?
	AI_Output(other,self,"DIA_Mage_LI_AncientProgressDoneExtBook_01_03");	//Ты не мог бы отдать ее мне?
	AI_Output(self,other,"DIA_Mage_LI_AncientProgressDoneExtBook_01_07");	//По всей видимости, того, что случилось в пещере, тебе оказалось мало...(с укором)
	AI_Output(self,other,"DIA_Mage_LI_AncientProgressDoneExtBook_01_09");	//Ладно. Вот, возьми.
	B_GiveInvItems(self,other,itwr_ancient,1);
	AI_Output(self,other,"DIA_Mage_LI_AncientProgressDoneExtBook_01_10");	//Будь крайне осторожен!
};


instance DIA_MAGE_LI_ANCIENTAFTER(C_Info)
{
	npc = pc_mage_li;
	nr = 2;
	condition = dia_mage_li_ancientafter_condition;
	information = dia_mage_li_ancientafter_info;
	permanent = TRUE;
	description = "За последнее время ничего больше не изменилось?";
};


func int dia_mage_li_ancientafter_condition()
{
	var int daynow;
	daynow = Wld_GetDay();
	if((MIS_MILTENANCIENT == LOG_SUCCESS) && (MILTENDEMONTIMEREXT <= (daynow - 1)))
	{
		return TRUE;
	};
};

func void dia_mage_li_ancientafter_info()
{
	AI_Output(other,self,"DIA_Mage_LI_AncientAfter_01_01");	//За последнее время ничего больше не изменилось?
	if(MILTENJOKE == FALSE)
	{
		AI_Output(self,other,"DIA_Mage_LI_AncientAfter_01_02");	//Нет. Все так же - тихо и спокойно.
		MILTENJOKE = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Mage_LI_AncientAfter_01_11");	//Нет.) Ничего такого.
	};
};


instance DIA_MILTEN_LI_TRADE(C_Info)
{
	npc = pc_mage_li;
	nr = 12;
	condition = dia_milten_li_trade_condition;
	information = dia_milten_li_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "У тебя есть пара напитков?";
};


func int dia_milten_li_trade_condition()
{
	return TRUE;
};

func void dia_milten_li_trade_info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Milten_DI_TRADE_15_00");	//Есть несколько лишних зелий?
	AI_Output(self,other,"DIA_Milten_DI_TRADE_03_01");	//Пока запас достаточный.

	if(TRD_MAGELI != TRUE)
	{
		CreateInvItems(self,ItPl_Temp_Herb,9);
		CreateInvItems(self,ItPl_Health_Herb_01,15);
		CreateInvItems(self,ItPl_Health_Herb_02,4);
		CreateInvItems(self,ItPl_Health_Herb_03,3);
		CreateInvItems(self,ItPl_Mana_Herb_01,13);
		CreateInvItems(self,ItPl_Mana_Herb_02,8);
		CreateInvItems(self,ItPl_Mana_Herb_03,2);
		CreateInvItems(self,ItPo_Health_02,5);
		CreateInvItems(self,ItPo_Health_03,2);
		CreateInvItems(self,ItPo_Mana_01,4);
		CreateInvItems(self,ItPo_Mana_02,2);
		CreateInvItems(self,ItMi_RuneBlank,1);
		CreateInvItems(self,ItPo_HealObsession_MIS,2);
		TRD_MAGELI = TRUE;
	};
	if(Npc_HasItems(self,itpo_anpois) != 3)
	{
		Npc_RemoveInvItems(self,itpo_anpois,Npc_HasItems(self,itpo_anpois));
		CreateInvItems(self,itpo_anpois,3);
	};

	B_GiveTradeInv(self);
};


instance DIA_MILTEN_LI_TEACHMAGIC(C_Info)
{
	npc = pc_mage_li;
	nr = 31;
	condition = dia_milten_li_teachmagic_condition;
	information = dia_milten_li_teachmagic_info;
	permanent = TRUE;
	description = "Я хочу улучшить свои магические способности.";
};


func int dia_milten_li_teachmagic_condition()
{
	return TRUE;
};

func void dia_milten_li_teachmagic_info()
{
	AI_Output(other,self,"DIA_Milten_DI_TeachMagic_15_00");	//Я хочу повысить свои магические способности.
	AI_Output(self,other,"DIA_Milten_DI_TeachMagic_03_03");	//Хорошо. Что тебе требуется?
	Info_ClearChoices(dia_milten_li_teachmagic);
	Info_AddChoice(dia_milten_li_teachmagic,Dialog_Back,dia_milten_li_teachmagic_back);
	Info_AddChoice(dia_milten_li_teachmagic,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_milten_li_teachmagic_mana_1);
	Info_AddChoice(dia_milten_li_teachmagic,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_milten_li_teachmagic_mana_5);

	if((hero.guild == GIL_KDF) || (CHOOSEFIRE == TRUE))
	{
		Info_AddChoice(dia_milten_li_teachmagic,"Создать руну",dia_milten_li_teachmagic_runes);
	};
};

func void dia_milten_li_teachmagic_runes()
{
	Info_ClearChoices(dia_milten_li_teachmagic);
	Info_AddChoice(dia_milten_li_teachmagic,Dialog_Back,dia_milten_li_teachmagic_back);
	AI_Output(self,other,"DIA_Milten_DI_TeachMagic_RUNES_03_00");	//Ох, нет! Я не большой специалист в этом, но мы как-нибудь справимся.

	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 4) && ((hero.guild == GIL_KDF) || (CHOOSEFIRE == TRUE)))
	{
		Info_AddChoice(dia_milten_li_teachmagic,"Круг четвертый",dia_milten_li_teachmagic_runen_circle_4);
	};
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 5) && ((hero.guild == GIL_KDF) || (CHOOSEFIRE == TRUE)))
	{
		Info_AddChoice(dia_milten_li_teachmagic,"Круг пятый",dia_milten_li_teachmagic_runen_circle_5);
	};
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 6) && ((hero.guild == GIL_KDF) || (CHOOSEFIRE == TRUE)))
	{
		Info_AddChoice(dia_milten_li_teachmagic,"Круг шестой",dia_milten_li_teachmagic_runen_circle_6);
	};
};

func void dia_milten_li_teachmagic_runen_circle_4()
{
	Info_ClearChoices(dia_milten_li_teachmagic);
	Info_AddChoice(dia_milten_li_teachmagic,Dialog_Back,dia_milten_li_teachmagic_back);
	if(PLAYER_TALENT_RUNES[SPL_ChargeFireball] == FALSE)
	{
		Info_AddChoice(dia_milten_li_teachmagic,b_buildlearnstringforrunes(NAME_SPL_ChargeFireball,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_ChargeFireball)),dia_milten_li_teachmagic_runen_circle_4_spl_chargefireball);
	};
	if(PLAYER_TALENT_RUNES[93] == FALSE)
	{
		Info_AddChoice(dia_milten_li_teachmagic,b_buildlearnstringforrunes(NAME_SPL_FIRELIGHT,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_FIRELIGHT)),dia_milten_li_teachmagic_runen_circle_4_spl_firelight);
	};
};

func void dia_milten_li_teachmagic_runen_circle_4_spl_chargefireball()
{
	B_TeachPlayerTalentRunes(self,other,SPL_ChargeFireball);
};

func void dia_milten_li_teachmagic_runen_circle_4_spl_firelight()
{
	B_TeachPlayerTalentRunes(self,other,SPL_FIRELIGHT);
};

func void dia_milten_li_teachmagic_runen_circle_5()
{
	Info_ClearChoices(dia_milten_li_teachmagic);
	Info_AddChoice(dia_milten_li_teachmagic,Dialog_Back,dia_milten_li_teachmagic_back);

	if(PLAYER_TALENT_RUNES[SPL_Pyrokinesis] == FALSE)
	{
		Info_AddChoice(dia_milten_li_teachmagic,b_buildlearnstringforrunes(NAME_SPL_Pyrokinesis,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Pyrokinesis)),dia_milten_li_teachmagic_runen_circle_5_spl_pyrokinesis);
	};
	if(PLAYER_TALENT_RUNES[SPL_Explosion] == FALSE)
	{
		Info_AddChoice(dia_milten_li_teachmagic,b_buildlearnstringforrunes(NAME_SPL_Explosion,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Explosion)),dia_milten_li_teachmagic_runen_circle_5_SPL_Explosion);
	};
};

func void dia_milten_li_teachmagic_runen_circle_5_spl_pyrokinesis()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Pyrokinesis);
};

func void dia_milten_li_teachmagic_runen_circle_5_SPL_Explosion()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Explosion);
};

func void dia_milten_li_teachmagic_runen_circle_6()
{
	Info_ClearChoices(dia_milten_li_teachmagic);
	Info_AddChoice(dia_milten_li_teachmagic,Dialog_Back,dia_milten_li_teachmagic_back);

	if(PLAYER_TALENT_RUNES[SPL_Firerain] == FALSE)
	{
		Info_AddChoice(dia_milten_li_teachmagic,b_buildlearnstringforrunes(NAME_SPL_Firerain,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Firerain)),dia_milten_li_teachmagic_runen_circle_6_spl_firerain);
	};
};

func void dia_milten_li_teachmagic_runen_circle_6_spl_firerain()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Firerain);
};

func void dia_milten_li_teachmagic_back()
{
	Info_ClearChoices(dia_milten_li_teachmagic);
};

func void dia_milten_li_teachmagic_mana_1()
{
	if(B_TeachAttributePoints(self,other,ATR_MANA_MAX,1,T_MAX))
	{
		AI_Output(self,other,"DIA_Milten_DI_TeachMagic_MANA_1_03_00");	//Да ведет тебя рука Инноса.
	};
	Info_ClearChoices(dia_milten_li_teachmagic);
	Info_AddChoice(dia_milten_li_teachmagic,Dialog_Back,dia_milten_li_teachmagic_back);
	Info_AddChoice(dia_milten_li_teachmagic,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_milten_li_teachmagic_mana_1);
	Info_AddChoice(dia_milten_li_teachmagic,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_milten_li_teachmagic_mana_5);
};

func void dia_milten_li_teachmagic_mana_5()
{
	if(B_TeachAttributePoints(self,other,ATR_MANA_MAX,5,T_MAX))
	{
		AI_Output(self,other,"DIA_Milten_DI_TeachMagic_MANA_5_03_00");	//Пусть Иннос осветит твой путь.
	};
	Info_ClearChoices(dia_milten_li_teachmagic);
	Info_AddChoice(dia_milten_li_teachmagic,Dialog_Back,dia_milten_li_teachmagic_back);
	Info_AddChoice(dia_milten_li_teachmagic,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_milten_li_teachmagic_mana_1);
	Info_AddChoice(dia_milten_li_teachmagic,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_milten_li_teachmagic_mana_5);
};


instance DIA_MAGE_LI_PICKPOCKET(C_Info)
{
	npc = pc_mage_li;
	nr = 900;
	condition = dia_mage_li_pickpocket_condition;
	information = dia_mage_li_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_mage_li_pickpocket_condition()
{
	return C_Beklauen(45,120);
};

func void dia_mage_li_pickpocket_info()
{
	Info_ClearChoices(dia_mage_li_pickpocket);
	Info_AddChoice(dia_mage_li_pickpocket,Dialog_Back,dia_mage_li_pickpocket_back);
	Info_AddChoice(dia_mage_li_pickpocket,DIALOG_PICKPOCKET,dia_mage_li_pickpocket_doit);
};

func void dia_mage_li_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_mage_li_pickpocket);
};

func void dia_mage_li_pickpocket_back()
{
	Info_ClearChoices(dia_mage_li_pickpocket);
};


instance DIA_MAGE_LI_MISSMYGOLD(C_Info)
{
	npc = pc_mage_li;
	nr = 2;
	condition = dia_mage_li_missmygold_condition;
	information = dia_mage_li_missmygold_info;
	permanent = FALSE;
	description = "Ты, случайно, не знаешь, где мое золото?";
};


func int dia_mage_li_missmygold_condition()
{
	if((BEGINGOLDSEEK == TRUE) && (MIS_MISSMYGOLD == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_mage_li_missmygold_info()
{
	AI_Output(other,self,"DIA_Mage_LI_MissMyGold_01_01");	//Ты, случайно, не знаешь, где мое золото?
	AI_Output(self,other,"DIA_Mage_LI_MissMyGold_01_02");	//Нет, приятель. Я этого не знаю.
	AI_Output(self,other,"DIA_Mage_LI_MissMyGold_01_05");	//Мага Огня абсолютно не интересуют подобного рода вещи!
	AI_Output(self,other,"DIA_Mage_LI_MissMyGold_01_06");	//Для нас наиболее ценной субстанцией являются знания, а не блеск этого презренного металла.
	B_LogEntry(TOPIC_MISSMYGOLD,"Милтен совершенно не в курсе, что стало с моим золотом.");
};


instance DIA_MAGE_LI_AWAY(C_Info)
{
	npc = pc_mage_li;
	nr = 3;
	condition = dia_mage_li_away_condition;
	information = dia_mage_li_away_info;
	permanent = FALSE;
	description = "Пора возвращаться на корабль.";
};


func int dia_mage_li_away_condition()
{
	if((MIS_GATHERCREW == LOG_Running) && (MILTENLIONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_mage_li_away_info()
{
	var int countpeopple;
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Mage_LI_Away_01_01");	//Пора возвращаться на корабль.
	AI_Output(self,other,"DIA_Mage_LI_Away_01_02");	//Неужели мы покидаем этот остров?
	AI_Output(other,self,"DIA_Mage_LI_Away_01_03");	//Да. Корабль в полном порядке, и теперь нам ничего не мешает смыться отсюда.
	AI_Output(self,other,"DIA_Mage_LI_Away_01_04");	//Хорошо! Тогда я скоро буду.
	B_LogEntry(TOPIC_GATHERCREW,"Я передал Милтену, что мы уходим с острова.");
	MILTENLIONBOARD = TRUE;
	if((GORNLIHERE == TRUE) && (GORNLIONBOARD == TRUE))
	{
		countpeopple = countpeopple + 1;
	};
	if((MILTENLIONBOARD == TRUE) && (MILTENLIHERE == TRUE))
	{
		countpeopple = countpeopple + 1;
	};
	if((LESTERLIONBOARD == TRUE) && (LESTERLIHERE == TRUE))
	{
		countpeopple = countpeopple + 1;
	};
	if((DIEGOLIONBOARD == TRUE) && (DIEGOLIHERE == TRUE))
	{
		countpeopple = countpeopple + 1;
	};
	if((ANGARLIONBOARD == TRUE) && (ANGARLIHERE == TRUE))
	{
		countpeopple = countpeopple + 1;
	};
	if((COUNTPEOPLEONBEACH <= countpeopple) && (LICREWONBOARD == FALSE))
	{
		LICREWONBOARD = TRUE;
	};
	AI_StopProcessInfos(self);
};


instance DIA_MAGE_LI_FINDMAGICORECAVE(C_Info)
{
	npc = pc_mage_li;
	nr = 2;
	condition = dia_mage_li_findmagicorecave_condition;
	information = dia_mage_li_findmagicorecave_info;
	permanent = FALSE;
	description = "Я нашел пещеру с залежами магической руды.";
};


func int dia_mage_li_findmagicorecave_condition()
{
	if((MIS_FINDMAGICORECAVE == LOG_Running) && (LIBEFORETESTOK == FALSE) && (LITESTOK == FALSE) && (GOTOORECAPITAN == FALSE))
	{
		return TRUE;
	};
};

func void dia_mage_li_findmagicorecave_info()
{
	AI_Output(other,self,"DIA_Mage_LI_FindMagicOreCave_01_01");	//Я нашел пещеру с залежами магической руды.
	AI_Output(self,other,"DIA_Mage_LI_FindMagicOreCave_01_02");	//Правда? Тогда тебе стоит поговорить об этом с нашим капитаном.
	AI_Output(self,other,"DIA_Mage_LI_FindMagicOreCave_01_03");	//Думаю, ему будет интересно услышать эту новость.
	GOTOORECAPITAN = TRUE;
};


instance DIA_MAGE_LI_CHANGECOURSE(C_Info)
{
	npc = pc_mage_li;
	nr = 2;
	condition = dia_mage_li_changecourse_condition;
	information = dia_mage_li_changecourse_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_mage_li_changecourse_condition()
{
	if((MIS_CHANGECOURSE == LOG_Running) && Npc_IsInState(self,ZS_Talk) && (MIS_MILTENANCIENT != LOG_Running))
	{
		return TRUE;
	};
};

func void dia_mage_li_changecourse_info()
{
	B_GivePlayerXP(50);
	AI_Output(self,other,"DIA_Mage_LI_ChangeCourse_01_00");	//Я слышал, что ты хочешь вернуться обратно в Хоринис, чтобы сообщить паладинам о руде?
	AI_Output(self,other,"DIA_Mage_LI_ChangeCourse_01_03");	//Лорд Хаген должен узнать об этом. И наверняка эта новость сможет во многих вселить определенную надежду.
	AI_Output(other,self,"DIA_Mage_LI_ChangeCourse_01_04");	//А ты отправишься вместе со мной?
	AI_Output(self,other,"DIA_Mage_LI_ChangeCourse_01_05");	//Разумеется. Помогать паладинам короля - это мой священный долг перед Инносом.
	AI_Output(self,other,"DIA_Mage_LI_ChangeCourse_01_06");	//К тому же магам в монастыре, возможно, в скором времени понадобится помощь.
	AI_Output(self,other,"DIA_Mage_LI_ChangeCourse_01_07");	//Если орки вдруг решат пройти через перевал, то их всех ждут крайне тяжелые времена.
	AI_Output(other,self,"DIA_Mage_LI_ChangeCourse_01_10");	//Рад слышать это, Милтен!
	B_LogEntry(TOPIC_CHANGECOURSE,"Милтен рад, что мы решили вернуться в Хоринис. Он поплывет с нами.");
	CREWAGREEAWAYBACKPAL = CREWAGREEAWAYBACKPAL + 1;
	COUNTPEOPLEDECIDEPRG = COUNTPEOPLEDECIDEPRG + 1;
	if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
	{
		READYCHANGECOURSE = TRUE;
		Log_AddEntry(TOPIC_CHANGECOURSE,"Кажется, я поговорил со всеми парнями. Пора сообщить об этом нашему капитану.");
	};
};

