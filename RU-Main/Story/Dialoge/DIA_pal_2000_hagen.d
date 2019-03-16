
instance DIA_PAL_2000_HAGEN_EXIT(C_Info)
{
	npc = pal_2000_hagen;
	nr = 999;
	condition = dia_pal_2000_hagen_exit_condition;
	information = dia_pal_2000_hagen_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_2000_hagen_exit_condition()
{
	return TRUE;
};

func void dia_pal_2000_hagen_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_2000_HAGEN_TEACH(C_Info)
{
	npc = pal_2000_hagen;
	nr = 100;
	condition = dia_pal_2000_hagen_teach_condition;
	information = dia_pal_2000_hagen_teach_info;
	permanent = TRUE;
	description = "Давай начнем тренировку.";
};


func int dia_pal_2000_hagen_teach_condition()
{
	if((LordHagen_Teach2H == TRUE) && (DIA_Hagen_Teach_permanent == FALSE))
	{
		return TRUE;
	};
};

func void dia_pal_2000_hagen_teach_info()
{
	AI_Output(other,self,"DIA_Hagen_Teach_15_00");	//Приступим к обучению.
	Info_ClearChoices(dia_pal_2000_hagen_teach);
	Info_AddChoice(dia_pal_2000_hagen_teach,Dialog_Back,dia_pal_2000_hagen_teach_back);
	Info_AddChoice(dia_pal_2000_hagen_teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_pal_2000_hagen_teach_2h_1);
	Info_AddChoice(dia_pal_2000_hagen_teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_pal_2000_hagen_teach_2h_5);
};

func void dia_pal_2000_hagen_teach_back()
{
	if(other.HitChance[NPC_TALENT_2H] >= 100)
	{
		AI_Output(self,other,"DIA_Hagen_Teach_04_00");	//Теперь ты достойный мастер меча. Я больше не могу ничему тебя научить.
		AI_Output(self,other,"DIA_Hagen_Teach_04_01");	//Да ведет твою руку в будущих свершениях мудрость мастера-мечника.
		DIA_Hagen_Teach_permanent = TRUE;
	};
	Info_ClearChoices(dia_pal_2000_hagen_teach);
};

func void dia_pal_2000_hagen_teach_2h_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,100);
	Info_ClearChoices(dia_pal_2000_hagen_teach);
	Info_AddChoice(dia_pal_2000_hagen_teach,Dialog_Back,dia_pal_2000_hagen_teach_back);
	Info_AddChoice(dia_pal_2000_hagen_teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_pal_2000_hagen_teach_2h_1);
	Info_AddChoice(dia_pal_2000_hagen_teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_pal_2000_hagen_teach_2h_5);
};

func void dia_pal_2000_hagen_teach_2h_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,100);
	Info_ClearChoices(dia_pal_2000_hagen_teach);
	Info_AddChoice(dia_pal_2000_hagen_teach,Dialog_Back,dia_pal_2000_hagen_teach_back);
	Info_AddChoice(dia_pal_2000_hagen_teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_pal_2000_hagen_teach_2h_1);
	Info_AddChoice(dia_pal_2000_hagen_teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_pal_2000_hagen_teach_2h_5);
};


instance DIA_PAL_2000_HAGEN_WARSTART(C_Info)
{
	npc = pal_2000_hagen;
	nr = 2;
	condition = dia_pal_2000_hagen_warstart_condition;
	information = dia_pal_2000_hagen_warstart_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_pal_2000_hagen_warstart_condition()
{
	if((MIS_ORсGREATWAR == LOG_Running) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_pal_2000_hagen_warstart_info()
{
	AI_Output(self,other,"DIA_PAL_2000_Hagen_WarStart_01_00");	//(удивленно) Ты? А я уж, честно говоря, и не надеялся, что снова увижу тебя!
	AI_Output(self,other,"DIA_PAL_2000_Hagen_WarStart_01_01");	//В особенности после того, как ты увел у нас из под носа наш единственный корабль! (гневно) Или ты думал, что я ничего об этом не знаю?
	AI_Output(other,self,"DIA_PAL_2000_Hagen_WarStart_01_02");	//Сейчас не самое лучшее время выяснять наши отношения.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_WarStart_01_03");	//Да?! (гневно) Ты так считаешь? И почему же?
	AI_Output(other,self,"DIA_PAL_2000_Hagen_WarStart_01_04");	//Потому что орки вторглись в Хоринис!
	AI_Output(other,self,"DIA_PAL_2000_Hagen_WarStart_01_05");	//И мне кажется, что сейчас именно эта вещь должна волновать тебя больше всего.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_WarStart_01_06");	//Ах да... Еще эти чертовы орки! Эти проклятые твари уже практически заполонили всю долину.
	AI_Output(other,self,"DIA_PAL_2000_Hagen_WarStart_01_07");	//Вот именно. И с этим нужно что-то делать.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_WarStart_01_08");	//Хммм...(задумчиво) Ну, хорошо! О наших с тобою делах мы поговорим позже. Только не надейся, что я забуду про это!
	AI_Output(self,other,"DIA_PAL_2000_Hagen_WarStart_01_09");	//А сейчас отвечай: что привело тебя ко мне?
};


instance DIA_PAL_2000_HAGEN_HIDDENORE(C_Info)
{
	npc = pal_2000_hagen;
	nr = 2;
	condition = dia_pal_2000_hagen_hiddenore_condition;
	information = dia_pal_2000_hagen_hiddenore_info;
	permanent = FALSE;
	description = "У меня есть для тебя одно очень важное сообщение.";
};


func int dia_pal_2000_hagen_hiddenore_condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_2000_hagen_warstart) && (Npc_HasItems(hero,itmi_seamaplostisland) >= 1))
	{
		return TRUE;
	};
};

func void dia_pal_2000_hagen_hiddenore_info()
{
	AI_Output(other,self,"DIA_PAL_2000_Hagen_HiddenOre_01_00");	//У меня есть для тебя одно очень важное сообщение.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_HiddenOre_01_01");	//(надменно) И в чем же оно заключается?
	AI_Output(other,self,"DIA_PAL_2000_Hagen_HiddenOre_01_03");	//Когда мы были в море, то случайно наткнулись на один необитаемый остров, доверху набитый залежами магической руды!
	AI_Output(other,self,"DIA_PAL_2000_Hagen_HiddenOre_01_04");	//Вот я и решил, что возможно паладинам было бы интересно узнать об этом.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_HiddenOre_01_05");	//Что?! Ты серьезно? (очень удивленно) Но этого просто быть не может!
	AI_Output(other,self,"DIA_PAL_2000_Hagen_HiddenOre_01_06");	//Поверь мне, это так. Найденная нами магическая руда и была одной из тех причин, по которой мы вернулись обратно.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_HiddenOre_01_07");	//Невероятно! Я и представить себе не мог, что такое возможно.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_HiddenOre_01_08");	//Если все что ты говоришь - правда, то это самая лучшая новость, которую я мог только услышать!
	AI_Output(self,other,"DIA_PAL_2000_Hagen_HiddenOre_01_09");	//А то в последнее время они стали уж слишком большой редкостью.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_HiddenOre_01_12");	//А как далеко отсюда находится этот остров?
	AI_Output(other,self,"DIA_PAL_2000_Hagen_HiddenOre_01_13");	//Всего лишь в нескольких днях плавания от Хориниса. Вот, взгляни сам.
	B_GiveInvItems(other,self,itmi_seamaplostisland,1);
	AI_Output(self,other,"DIA_PAL_2000_Hagen_HiddenOre_01_14");	//Что это?
	AI_Output(other,self,"DIA_PAL_2000_Hagen_HiddenOre_01_15");	//Это морская карта. Мой капитан сделал на ней пару отметин и проложил точный курс.
	AI_Output(other,self,"DIA_PAL_2000_Hagen_HiddenOre_01_16");	//Так что найти этот остров теперь будет для вас не очень трудно.
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_PAL_2000_Hagen_HiddenOre_01_17");	//(внимательно разглядывая) Да, очень интересно.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_HiddenOre_01_18");	//Судя по этой карте, найденный вами клочок суши находится в неизведанной нами доселе части океана. Как вас туда занесло?
	AI_Output(other,self,"DIA_PAL_2000_Hagen_HiddenOre_01_19");	//По дороге мы угодили в очень сильный шторм. Он-то нас и вывел к этому острову.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_HiddenOre_01_20");	//Да уж. И вправду говорят, что пути Инноса неисповедимы!
	AI_Output(self,other,"DIA_PAL_2000_Hagen_HiddenOre_01_21");	//Уверен, что без его воли тут уж точно не обошлось.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_HiddenOre_01_23");	//Ну что же. (серьезно) Тогда от имени всего нашего ордена прими мою искреннюю благодарность!
	AI_Output(self,other,"DIA_PAL_2000_Hagen_HiddenOre_01_24");	//Будем надеяться, что найденная вами руда еще сможет помочь королю в войне против орков.
	HAGENTAKESMAPSORE = TRUE;

	if(LIGOFORGOLD == TRUE)
	{
		Info_ClearChoices(dia_pal_2000_hagen_hiddenore);
		Info_AddChoice(dia_pal_2000_hagen_hiddenore,"Не так быстро, паладин!",dia_pal_2000_hagen_hiddenore_gold);
	}
	else if(LIGOFORUNKNOWN == TRUE)
	{
		Info_ClearChoices(dia_pal_2000_hagen_hiddenore);
		Info_AddChoice(dia_pal_2000_hagen_hiddenore,"Не так быстро, паладин!",dia_pal_2000_hagen_hiddenore_gold);
		Info_AddChoice(dia_pal_2000_hagen_hiddenore,"Само собой.",dia_pal_2000_hagen_hiddenore_nothing);
	}
	else if(LIGOFORFREE == TRUE)
	{
		B_GivePlayerXP(200);
		AI_Output(other,self,"DIA_PAL_2000_Hagen_HiddenOre_01_25");	//Само собой.
	};
};

func void dia_pal_2000_hagen_hiddenore_gold()
{
	AI_Output(other,self,"DIA_PAL_2000_Hagen_HiddenOre_Gold_01_01");	//Не так быстро, паладин! Боюсь, одной твоей благодарности будет маловато.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_HiddenOre_Gold_01_02");	//То есть? (удивленно) Что ты хочешь этим сказать?
	AI_Output(other,self,"DIA_PAL_2000_Hagen_HiddenOre_Gold_01_03");	//Каждая информация всегда чего-то стоит. Тем более такая ценная.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_HiddenOre_Gold_01_06");	//(надменно) Ах, ну да. Естественно! Было бы странно, если бы ты не заговорил со мной об этом.
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_PAL_2000_Hagen_HiddenOre_Gold_01_07");	//Хотя, по правде говоря, я никак не ожидал таких слов от паладина!
	}
	else if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_PAL_2000_Hagen_HiddenOre_Gold_01_08");	//Хотя, по правде говоря, я никак не ожидал таких слов от достопочтенного мага Огня!
	}
	else if(other.guild == GIL_KDW)
	{
		AI_Output(self,other,"DIA_PAL_2000_Hagen_HiddenOre_Gold_01_09");	//Хотя, по правде говоря, я никак не ожидал таких слов от достопочтенного мага Воды!
	};
	AI_Output(other,self,"DIA_PAL_2000_Hagen_HiddenOre_Gold_01_10");	//Давай оставим подробности. Лучше скажи - сколько ты мне заплатишь?
	AI_Output(self,other,"DIA_PAL_2000_Hagen_HiddenOre_Gold_01_11");	//Хммм... Ну, скажем, десять тысяч золотых монет. Тебя это устроит?
	AI_Output(other,self,"DIA_PAL_2000_Hagen_HiddenOre_Gold_01_12");	//Вполне. Надеюсь, что я не продешевил.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_HiddenOre_Gold_01_13");	//Тебе решать! Вот, возьми свои деньги.
	B_GiveInvItems(self,other,ItMi_Gold,10000);
	AI_Output(other,self,"DIA_PAL_2000_Hagen_HiddenOre_Gold_01_14");	//С тобой приятно иметь дело.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_HiddenOre_Gold_01_15");	//(недовольно) Хммм...
	Info_ClearChoices(dia_pal_2000_hagen_hiddenore);
};

func void dia_pal_2000_hagen_hiddenore_nothing()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_PAL_2000_Hagen_HiddenOre_Nothing_01_01");	//Само собой.
	Info_ClearChoices(dia_pal_2000_hagen_hiddenore);
};


instance DIA_PAL_2000_HAGEN_TELLFROMPYROKAR(C_Info)
{
	npc = pal_2000_hagen;
	nr = 2;
	condition = dia_pal_2000_hagen_tellfrompyrokar_condition;
	information = dia_pal_2000_hagen_tellfrompyrokar_info;
	permanent = FALSE;
	description = "Меня прислал Пирокар.";
};


func int dia_pal_2000_hagen_tellfrompyrokar_condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_2000_hagen_warstart) && (MIS_ORсGREATWAR == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_pal_2000_hagen_tellfrompyrokar_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_PAL_2000_Hagen_TellFromPyrokar_01_00");	//Меня прислал Пирокар.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_TellFromPyrokar_01_01");	//И чего же он хочет?
	AI_Output(other,self,"DIA_PAL_2000_Hagen_TellFromPyrokar_01_02");	//Для начала хотя бы выяснить то, как у вас обстоят дела. Насколько велики ваши потери?
	AI_Output(self,other,"DIA_PAL_2000_Hagen_TellFromPyrokar_01_03");	//(ворчливо) А то он и сам не знает, как они обстоят!
	AI_Output(self,other,"DIA_PAL_2000_Hagen_TellFromPyrokar_01_04");	//При защите города я потерял практически треть своих людей. Не думаю, что это можно назвать хорошим поворотом дел.
	AI_Output(other,self,"DIA_PAL_2000_Hagen_TellFromPyrokar_01_05");	//А что с остальными?
	AI_Output(self,other,"DIA_PAL_2000_Hagen_TellFromPyrokar_01_06");	//Все, кто выжил в этой заварушке, сейчас находятся здесь.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_TellFromPyrokar_01_07");	//А если говорить конкретнее, то в моем распоряжении сейчас порядка полсотни бойцов. Может, чуть больше.
	AI_Output(other,self,"DIA_PAL_2000_Hagen_TellFromPyrokar_01_08");	//И каков их настрой?
	AI_Output(self,other,"DIA_PAL_2000_Hagen_TellFromPyrokar_01_09");	//(грозно) Если ты думаешь, что после всего случившегося они пали духом, то ты ошибаешься!
	AI_Output(self,other,"DIA_PAL_2000_Hagen_TellFromPyrokar_01_10");	//Их боевой дух как никогда высок! И в скором времени ты сам в этом убедишься.
	AI_Output(other,self,"DIA_PAL_2000_Hagen_TellFromPyrokar_01_11");	//Тогда почему вы до сих пор здесь?
	AI_Output(other,self,"DIA_PAL_2000_Hagen_TellFromPyrokar_01_12");	//Орки уже вовсю хозяйничают в долине - грабя и уничтожая все, что встречается им на пути.
	AI_Output(other,self,"DIA_PAL_2000_Hagen_TellFromPyrokar_01_13");	//Или вы просто боитесь дать им открытый бой?
	AI_Output(self,other,"DIA_PAL_2000_Hagen_TellFromPyrokar_01_17");	//Для открытого сражения с орками нас слишком мало. У нас просто не хватит сил, чтобы противостоять им всем!
	AI_Output(other,self,"DIA_PAL_2000_Hagen_TellFromPyrokar_01_18");	//И что же вы собираетесь делать дальше?
	AI_Output(self,other,"DIA_PAL_2000_Hagen_TellFromPyrokar_01_19");	//Полагаю, что пока мы останемся здесь. Мне нужно перегруппировать свои войска и основательно подготовиться к дальнейшим боевым действиям.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_TellFromPyrokar_01_20");	//К тому же Азган практически неприступен, так что здесь можно себя чувствовать в полной безопасности.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_TellFromPyrokar_01_21");	//А если эти твари и попытаются нас атаковать, то уж будь уверен - они прилично пообломают себе зубы о стены этой крепости.
	B_LogEntry(TOPIC_ORсGREATWAR,"Потеряв при защите Хориниса почти треть паладинов, лорд Хаген не собирается в ближайшее время что-то делать против вторжения орков. Паладины останутся в форте, что более выгодно в сложившейся обстановке. Форт Азган - практически неприступная крепость, и взять ее штурмом орки вряд ли смогут.");
	TELLTOHAGENFORT = TRUE;
};


instance DIA_PAL_2000_HAGEN_MAYJOINOTHERS(C_Info)
{
	npc = pal_2000_hagen;
	nr = 2;
	condition = dia_pal_2000_hagen_mayjoinothers_condition;
	information = dia_pal_2000_hagen_mayjoinothers_info;
	permanent = FALSE;
	description = "Но нам нельзя просто сидеть сложа руки!";
};


func int dia_pal_2000_hagen_mayjoinothers_condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_2000_hagen_tellfrompyrokar) && (MIS_ORсGREATWAR == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_pal_2000_hagen_mayjoinothers_info()
{
	AI_Output(other,self,"DIA_PAL_2000_Hagen_MayJoinOthers_01_00");	//Но нам нельзя просто сидеть сложа руки!
	AI_Output(other,self,"DIA_PAL_2000_Hagen_MayJoinOthers_01_01");	//Рано или поздно орки перебьют всех оставшихся в долине людей и после этого наверняка пожалуют сюда.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_MayJoinOthers_01_03");	//Я и без тебя все это прекрасно знаю!
	AI_Output(self,other,"DIA_PAL_2000_Hagen_MayJoinOthers_01_04");	//Но, как уже говорил ранее, у меня слишком мало людей, чтобы в открытую выступить против такого количества орков.
	AI_Output(other,self,"DIA_PAL_2000_Hagen_MayJoinOthers_01_05");	//Тогда тебе нужно найти себе еще воинов!
	AI_Output(self,other,"DIA_PAL_2000_Hagen_MayJoinOthers_01_06");	//Да?! (ехидно) И где же ты предлагаешь мне их искать? Может быть, посоветуешь?
	AI_Output(self,other,"DIA_PAL_2000_Hagen_MayJoinOthers_01_07");	//Откуда мне еще взять хотя бы сотню отважных смельчаков, готовых отдать свои жизни ради призрачной надежды на успех?
	AI_Output(self,other,"DIA_PAL_2000_Hagen_MayJoinOthers_01_08");	//Нет, друг мой - в этой битве мы одиноки. Нам неоткуда ждать какой-либо помощи.
	AI_Output(other,self,"DIA_PAL_2000_Hagen_MayJoinOthers_01_09");	//А как же наемники или люди из болотного Братства? Может, обратиться к ним за помощью?
	AI_Output(self,other,"DIA_PAL_2000_Hagen_MayJoinOthers_01_10");	//Что?! Сражаться бок о бок с преступниками и беглыми каторжниками?
	AI_Output(self,other,"DIA_PAL_2000_Hagen_MayJoinOthers_01_11");	//Да ты в своем уме предлагать мне такое? Я никогда не соглашусь иметь дело с подобного рода личностями, даже если дело будет касаться вопроса жизни и смерти.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_MayJoinOthers_01_12");	//Все это позорит честное имя паладина! Не говоря уже о том, что многим из них и вовсе нельзя доверять.
	AI_Output(other,self,"DIA_PAL_2000_Hagen_MayJoinOthers_01_13");	//Я знаю, что для паладина честь превыше всего. Но только не в данной ситуации!
	AI_Output(other,self,"DIA_PAL_2000_Hagen_MayJoinOthers_01_15");	//Пока ты здесь стоишь и рассуждаешь о понятиях чести - в долине от топоров орков гибнет все больше и больше ни в чем не повинных людей!
	AI_Output(self,other,"DIA_PAL_2000_Hagen_MayJoinOthers_01_16");	//(недоуменно) Что ты этим хочешь сказать?
	AI_Output(other,self,"DIA_PAL_2000_Hagen_MayJoinOthers_01_17");	//Твой долг как паладина короля - сделать все необходимое для того, чтобы их как-то спасти!
	AI_Output(self,other,"DIA_PAL_2000_Hagen_MayJoinOthers_01_21");	//Хммм. Ну, хорошо...(скрепя сердце) Да, ты прав.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_MayJoinOthers_01_22");	//Мне действительно не следовало бы быть столь заносчивым и самонадеянным. Жизнь подданных короля превыше всего!
	AI_Output(self,other,"DIA_PAL_2000_Hagen_MayJoinOthers_01_23");	//Ведь их защита - это наш священный долг. И кроме нас им не на кого больше надеяться.
	AI_Output(other,self,"DIA_PAL_2000_Hagen_MayJoinOthers_01_25");	//Я уверен, что тебе стоит обратиться за помощью ко всем тем, кто сейчас сможет держать оружие в руках.
	AI_Output(other,self,"DIA_PAL_2000_Hagen_MayJoinOthers_01_26");	//А думаю, таких наберется немало.
	AI_Output(other,self,"DIA_PAL_2000_Hagen_MayJoinOthers_01_27");	//К тому же если эти самые преступники, как ты их называешь, согласятся выступить вместе с тобой против орков - это уже будет достойно хоть какого-то уважения.
	AI_Output(other,self,"DIA_PAL_2000_Hagen_MayJoinOthers_01_28");	//В конце концов, многие из них заплатят жизнью, а это чего-то все-таки стоит.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_MayJoinOthers_01_29");	//Ладно! Считай, что ты меня почти уговорил. Однако мне все равно нужно немного времени, чтобы все это обдумать.
	AI_Output(other,self,"DIA_PAL_2000_Hagen_MayJoinOthers_01_30");	//Думай быстрее, времени у нас и так уже нет.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_MayJoinOthers_01_31");	//Постараюсь!
	B_LogEntry(TOPIC_ORсGREATWAR,"После долгих споров с лордом Хагеном мне удалось убедить его, что единственный способ одолеть орков - это собрать под знамена паладинов всех, кто способен держать в руках оружие. Наемников, сектантов или еще кого-нибудь. Однако глава паладинов все-таки взял время подумать над моим предложением. Но я не сомневаюсь, что он примет правильное решение.");
};


instance DIA_PAL_2000_HAGEN_MAYJOINOTHERSAGREED(C_Info)
{
	npc = pal_2000_hagen;
	nr = 2;
	condition = dia_pal_2000_hagen_mayjoinothersagreed_condition;
	information = dia_pal_2000_hagen_mayjoinothersagreed_info;
	permanent = TRUE;
	description = "Так что ты решил?";
};


func int dia_pal_2000_hagen_mayjoinothersagreed_condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_2000_hagen_mayjoinothers) && (HAGENOTHERSAGREED == FALSE))
	{
		return TRUE;
	};
};

func void dia_pal_2000_hagen_mayjoinothersagreed_info()
{
	AI_Output(other,self,"DIA_PAL_2000_Hagen_MayJoinOthersAgreed_01_00");	//Так что ты решил?
	if((MIS_RESCUEGAROND == LOG_SUCCESS) || (GARONDISBACK == TRUE))
	{
		B_GivePlayerXP(200);
		AI_Output(self,other,"DIA_PAL_2000_Hagen_MayJoinOthersAgreed_01_01");	//Хммм...(задумчиво) Ну, хорошо! Я согласен принять помощь наемников или кого-либо другого.
		AI_Output(self,other,"DIA_PAL_2000_Hagen_MayJoinOthersAgreed_01_02");	//Но только потому, что иного выхода у нас действительно просто нет.
		AI_Output(other,self,"DIA_PAL_2000_Hagen_MayJoinOthersAgreed_01_03");	//Уверен, что ты поступил правильно.
		AI_Output(self,other,"DIA_PAL_2000_Hagen_MayJoinOthersAgreed_01_04");	//Надеюсь. (серьезно) Очень не хотелось бы потом пожалеть о своем решении. Оно мне и так далось с большим трудом!
		AI_Output(other,self,"DIA_PAL_2000_Hagen_MayJoinOthersAgreed_01_05");	//И что теперь?
		AI_Output(self,other,"DIA_PAL_2000_Hagen_MayJoinOthersAgreed_01_06");	//Это ты у меня спрашиваешь? Я уже тебе и так сказал все, что думал по этому поводу.
		AI_Output(self,other,"DIA_PAL_2000_Hagen_MayJoinOthersAgreed_01_07");	//Теперь же все остальное зависит только от тебя.
		AI_Output(self,other,"DIA_PAL_2000_Hagen_MayJoinOthersAgreed_01_09");	//Или ты полагаешь, что я собственнолично буду бегать и упрашивать всех подряд присоединиться к армии паладинов?
		AI_Output(self,other,"DIA_PAL_2000_Hagen_MayJoinOthersAgreed_01_10");	//Хватит и того, что мне, по всей видимости, скоро придется якшаться с разного рода преступниками и прочими темными личностями.
		AI_Output(self,other,"DIA_PAL_2000_Hagen_MayJoinOthersAgreed_01_11");	//К тому же ты сам предложил эту идею - вот теперь и думай, как быть дальше.
		AI_Output(other,self,"DIA_PAL_2000_Hagen_MayJoinOthersAgreed_01_12");	//Ладно, я что-нибудь придумаю.
		AI_Output(self,other,"DIA_PAL_2000_Hagen_MayJoinOthersAgreed_01_13");	//Только не затягивай с этим! Не думаю, что орки дадут нам много времени на раздумия.
		ALLFRACTIONS = 6;
		HAGENOTHERSAGREED = TRUE;
		HAGENCOUNTSTIME = Wld_GetDay();
		B_LogEntry(TOPIC_ORсGREATWAR,"Лорд Хаген согласился с моим предложением и поручил именно мне заняться, так сказать, набором ополченцев в армию паладинов. Посмотрим, что из этого получится.");
	}
	else
	{
		AI_Output(self,other,"DIA_PAL_2000_Hagen_MayJoinOthersAgreed_01_15");	//(нервно) Пока ничего. Так что не надо мне действовать на нервы!
		if(MIS_RESCUEGAROND == LOG_Running)
		{
			AI_Output(self,other,"DIA_PAL_2000_Hagen_MayJoinOthersAgreed_01_16");	//Лучше займись моим поручением насчет отряда Гаронда! Это сейчас куда важнее.
		};
		AI_Output(other,self,"DIA_PAL_2000_Hagen_MayJoinOthersAgreed_01_17");	//Хорошо, как скажешь.
	};
};


instance DIA_PAL_2000_HAGEN_ALREADYJOINOTHERSAGREED(C_Info)
{
	npc = pal_2000_hagen;
	nr = 1;
	condition = dia_pal_2000_hagen_alreadyjoinothersagreed_condition;
	information = dia_pal_2000_hagen_alreadyjoinothersagreed_info;
	permanent = TRUE;
	description = "Насчет людей, готовых поддержать тебя...";
};


func int dia_pal_2000_hagen_alreadyjoinothersagreed_condition()
{
	if((HAGENOTHERSAGREED == TRUE) && (PREGATHERALLONBIGFARM == FALSE))
	{
		return TRUE;
	};
};

func void dia_pal_2000_hagen_alreadyjoinothersagreed_info()
{
	AI_Output(other,self,"DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_01_00");	//Насчет людей, готовых поддержать тебя...
	AI_Output(self,other,"DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_01_01");	//Да? (с интересом) У тебя есть какие-то новости?
	Info_ClearChoices(dia_pal_2000_hagen_alreadyjoinothersagreed);
	if(Npc_KnowsInfo(hero,dia_pal_2000_hagen_sldanswer) && (SLD_JOINHAGEN == TRUE) && (FRACTIONSLDJOIN == FALSE))
	{
		Info_AddChoice(dia_pal_2000_hagen_alreadyjoinothersagreed,"Наемники будут сражаться на твоей стороне.",dia_pal_2000_hagen_alreadyjoinothersagreed_sld);
	};
	if((PIR_JOINHAGEN == TRUE) && (FRACTIONPIRJOIN == FALSE))
	{
		Info_AddChoice(dia_pal_2000_hagen_alreadyjoinothersagreed,"Пираты согласились присоединиться к твоей армии.",dia_pal_2000_hagen_alreadyjoinothersagreed_pir);
	};
	if((TPL_JOINHAGEN == TRUE) && (FRACTIONTPLJOIN == FALSE))
	{
		Info_AddChoice(dia_pal_2000_hagen_alreadyjoinothersagreed,"Люди из Братства готовы помочь тебе с орками.",dia_pal_2000_hagen_alreadyjoinothersagreed_tpl);
	};
	if((HUN_JOINHAGEN == TRUE) && (FRACTIONHUNJOIN == FALSE))
	{
		Info_AddChoice(dia_pal_2000_hagen_alreadyjoinothersagreed,"Охотники тоже будут сражаться вместе с вами.",dia_pal_2000_hagen_alreadyjoinothersagreed_hun);
	};
	if((KDW_JOINHAGEN == TRUE) && (FRACTIONKDWJOIN == FALSE))
	{
		Info_AddChoice(dia_pal_2000_hagen_alreadyjoinothersagreed,"Маги Воды с радостью приняли твое предложение.",dia_pal_2000_hagen_alreadyjoinothersagreed_kdw);
	};
	if((KDF_JOINHAGEN == TRUE) && (FRACTIONKDFJOIN == FALSE))
	{
		Info_AddChoice(dia_pal_2000_hagen_alreadyjoinothersagreed,"Ты можешь рассчитывать на помощь со стороны Магов Огня.",dia_pal_2000_hagen_alreadyjoinothersagreed_kdf);
	};
	Info_AddChoice(dia_pal_2000_hagen_alreadyjoinothersagreed,"Пока ничего нового.",dia_pal_2000_hagen_alreadyjoinothersagreed_no);
};

func void dia_pal_2000_hagen_alreadyjoinothersagreed_sld()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_SLD_01_00");	//Наемники будут сражаться на твоей стороне.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_SLD_01_01");	//Это я уже знаю! (раздраженно) Какой смысл сообщать мне об этом еще один раз?
	AI_Output(other,self,"DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_SLD_01_02");	//Просто решил тебе напомнить.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_SLD_01_03");	//Не держи меня за идиота! Я всегда отлично помню, что говорят мне люди.
	AI_Output(other,self,"DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_SLD_01_04");	//Ну ладно, как скажешь.
	FRACTIONSLDJOIN = TRUE;
	AVAILABLEFRACTIONS = AVAILABLEFRACTIONS + 1;
	if(AVAILABLEFRACTIONS >= ALLFRACTIONS)
	{
		PREGATHERALLONBIGFARM = TRUE;
		Info_ClearChoices(dia_pal_2000_hagen_alreadyjoinothersagreed);
	};
};

func void dia_pal_2000_hagen_alreadyjoinothersagreed_pir()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_PIR_01_00");	//Пираты согласились присоединиться к твоей армии.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_PIR_01_01");	//Не сказать, что я очень сильно рад этому факту...(ворчливо) Но уж лучше так, чем ничего!
	AI_Output(self,other,"DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_PIR_01_02");	//Хотя, по правде говоря, я думал, что они все-таки предпочтут виселицу, нежели быть у меня в подчинении.
	AI_Output(other,self,"DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_PIR_01_03");	//Я их смог отговорить от этой идеи. Тем более ты обещал им корабль!
	AI_Output(self,other,"DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_PIR_01_04");	//Да, я помню про свое обещание! Можешь в этом не сомневаться.
	FRACTIONPIRJOIN = TRUE;
	AVAILABLEFRACTIONS = AVAILABLEFRACTIONS + 1;
	if(AVAILABLEFRACTIONS >= ALLFRACTIONS)
	{
		PREGATHERALLONBIGFARM = TRUE;
		Info_ClearChoices(dia_pal_2000_hagen_alreadyjoinothersagreed);
	};
};

func void dia_pal_2000_hagen_alreadyjoinothersagreed_tpl()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_TPL_01_00");	//Люди из Братства готовы помочь тебе с орками.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_TPL_01_01");	//Хммм. (удивленно) Серьезно? По правде говоря, на их помощь я совсем не рассчитывал!
	AI_Output(self,other,"DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_TPL_01_02");	//Поскольку всегда считал, что им вообще нет никакого дела до всего происходящего вокруг.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_TPL_01_03");	//Но на сей раз я, видимо, все-таки ошибся! Хотя, может быть, это и к лучшему.
	FRACTIONTPLJOIN = TRUE;
	AVAILABLEFRACTIONS = AVAILABLEFRACTIONS + 1;
	if(AVAILABLEFRACTIONS >= ALLFRACTIONS)
	{
		PREGATHERALLONBIGFARM = TRUE;
		Info_ClearChoices(dia_pal_2000_hagen_alreadyjoinothersagreed);
	};
};

func void dia_pal_2000_hagen_alreadyjoinothersagreed_hun()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_HUN_01_00");	//Охотники тоже будут сражаться вместе с вами.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_HUN_01_01");	//Охотники? Но они же фермеры, а не воины! Может быть, ты тогда и простых крестьян призовешь под мои знамена?
	AI_Output(other,self,"DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_HUN_01_02");	//Уверен, что лишние люди тебе в любом случае не помешают.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_HUN_01_03");	//Хммм...(ворчливо) Ну ладно! Надеюсь, что от них будет хоть какой-то толк.
	FRACTIONHUNJOIN = TRUE;
	AVAILABLEFRACTIONS = AVAILABLEFRACTIONS + 1;
	if(AVAILABLEFRACTIONS >= ALLFRACTIONS)
	{
		PREGATHERALLONBIGFARM = TRUE;
		Info_ClearChoices(dia_pal_2000_hagen_alreadyjoinothersagreed);
	};
};

func void dia_pal_2000_hagen_alreadyjoinothersagreed_kdw()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_KDW_01_00");	//Маги Воды с радостью приняли твое предложение.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_KDW_01_01");	//Что же, это очень хорошая новость. Я хорошо знаю Сатураса, и уверен, что он попросту не мог принять иного решения.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_KDW_01_02");	//Это будет большой честью для меня сражаться бок о бок с таким благородным человеком, как он.
	FRACTIONKDWJOIN = TRUE;
	AVAILABLEFRACTIONS = AVAILABLEFRACTIONS + 1;
	if(AVAILABLEFRACTIONS >= ALLFRACTIONS)
	{
		PREGATHERALLONBIGFARM = TRUE;
		Info_ClearChoices(dia_pal_2000_hagen_alreadyjoinothersagreed);
	};
};

func void dia_pal_2000_hagen_alreadyjoinothersagreed_kdf()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_KDF_01_00");	//Ты можешь рассчитывать на помощь со стороны магов Огня.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_KDF_01_01");	//В этом я ни капли не сомневался...(с уважением) Поскольку сражаться со злом - это их священный долг перед Инносом!
	AI_Output(self,other,"DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_KDF_01_02");	//Уверен, что их знания и мудрость помогут нам в борьбе против орков.
	AI_Output(other,self,"DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_KDF_01_03");	//Само собой.
	FRACTIONKDFJOIN = TRUE;
	AVAILABLEFRACTIONS = AVAILABLEFRACTIONS + 1;
	if(AVAILABLEFRACTIONS >= ALLFRACTIONS)
	{
		PREGATHERALLONBIGFARM = TRUE;
		Info_ClearChoices(dia_pal_2000_hagen_alreadyjoinothersagreed);
	};
};

func void dia_pal_2000_hagen_alreadyjoinothersagreed_no()
{
	AI_Output(other,self,"DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_No_01_00");	//У меня пока нет новостей.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_No_01_01");	//Тогда зачем ты попросту тратишь мое время? (раздраженно) Лучше иди и займись каким-нибудь полезным делом!
	Info_ClearChoices(dia_pal_2000_hagen_alreadyjoinothersagreed);
};


instance DIA_PAL_2000_HAGEN_DONEJOINOTHERSAGREED(C_Info)
{
	npc = pal_2000_hagen;
	nr = 1;
	condition = dia_pal_2000_hagen_donejoinothersagreed_condition;
	information = dia_pal_2000_hagen_donejoinothersagreed_info;
	permanent = FALSE;
	description = "Думаю, это все, кто сможет присоединиться к твоей армии.";
};


func int dia_pal_2000_hagen_donejoinothersagreed_condition()
{
	if(PREGATHERALLONBIGFARM == TRUE)
	{
		return TRUE;
	};
};

func void dia_pal_2000_hagen_donejoinothersagreed_info()
{
	AI_Output(other,self,"DIA_PAL_2000_Hagen_DoneJoinOthersAgreed_01_00");	//Думаю, это все, кто сможет присоединиться к твоей армии.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_DoneJoinOthersAgreed_01_01");	//Ну что же, совсем неплохо. Теперь у нас действительно достаточно людей, чтобы открыто выступить против орков. И медлить с этим уже не имеет никакого смысла!
	AI_Output(self,other,"DIA_PAL_2000_Hagen_DoneJoinOthersAgreed_01_02");	//Тем более что по моим сведениям, орки уже начали стягивать свои силы вблизи фермы Онара, и наверняка захотят нанести свой удар именно туда.
	AI_Output(other,self,"DIA_PAL_2000_Hagen_DoneJoinOthersAgreed_01_03");	//Тогда надо предупредить остальных, что вы выступаете.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_DoneJoinOthersAgreed_01_04");	//Не беспокойся, об этом я сам позабочусь. За исключением, конечно, магов Огня. С этим как раз могут возникнуть серьезные проблемы.
	AI_Output(other,self,"DIA_PAL_2000_Hagen_DoneJoinOthersAgreed_01_05");	//Почему?
	AI_Output(self,other,"DIA_PAL_2000_Hagen_DoneJoinOthersAgreed_01_06");	//Насколько мне известно, монастырь до сих пор еще находится под осадой, и я не думаю, что орки с распростертыми объятиями встретят там моего гонца.
	AI_Output(other,self,"DIA_PAL_2000_Hagen_DoneJoinOthersAgreed_01_07");	//Пожалуй, я справлюсь с этим. У меня уже не раз получалось проникать туда незамеченным.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_DoneJoinOthersAgreed_01_08");	//Ну ладно, пускай будет по-твоему. Тогда сообщи Пирокару, что мы встанем лагерем рядом с фермой, и пусть он будет готов в ближайшее время присоединиться к нам.
	B_LogEntry(TOPIC_ORсGREATWAR,"Теперь лорд Хаген готов выступить со своими людьми из форта, чтобы атаковать орков. Мне же необходимо немедленно отправиться в монастырь и сообщить об этом магам Огня.");
	HAGENNOMORETIMEWAIT = TRUE;
	OTH_JOINHAGEN = TRUE;
};


instance DIA_PAL_2000_HAGEN_RESCUEGAROND(C_Info)
{
	npc = pal_2000_hagen;
	nr = 2;
	condition = dia_pal_2000_hagen_rescuegarond_condition;
	information = dia_pal_2000_hagen_rescuegarond_info;
	permanent = FALSE;
	description = "Могу я еще чем-то помочь?";
};


func int dia_pal_2000_hagen_rescuegarond_condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_2000_hagen_mayjoinothers) && (GARONDISBACK == FALSE))
	{
		return TRUE;
	};
};

func void dia_pal_2000_hagen_rescuegarond_info()
{
	AI_Output(other,self,"DIA_PAL_2000_Hagen_RescueGarond_01_01");	//Могу я еще чем-то помочь?
	AI_Output(self,other,"DIA_PAL_2000_Hagen_RescueGarond_01_02");	//(задумчиво) Возможно, что у меня действительно для тебя есть одно очень важное поручение.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_RescueGarond_01_03");	//Хотя, откровенно говоря, оно связанно с крайне большим риском и опасностью.
	AI_Output(other,self,"DIA_PAL_2000_Hagen_RescueGarond_01_04");	//Звучит уже заманчиво! И что надо делать?
	AI_Output(self,other,"DIA_PAL_2000_Hagen_RescueGarond_01_06");	//Дело в том, что я до сих пор так и не знаю, что стало с моей экспедицией в Долине Рудников.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_RescueGarond_01_07");	//От Гаронда давно уже не поступало никаких вестей! Честно говоря, я уж и не знаю, что думать.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_RescueGarond_01_08");	//Возможно, что все они уже мертвы, но возможно и нет...(серьезно) И вся эта неопределенность крайне достает меня!
	AI_Output(self,other,"DIA_PAL_2000_Hagen_RescueGarond_01_09");	//Поэтому я хочу, чтобы ты немедленно отправился в долину и разузнал там всю обстановку, связанную с замком.
	if(MIS_OCGateOpen == TRUE)
	{
		AI_Output(other,self,"DIA_PAL_2000_Hagen_RescueGarond_01_10");	//Насколько я знаю, до недавнего времени их ситуация была крайне тяжелой!
		AI_Output(other,self,"DIA_PAL_2000_Hagen_RescueGarond_01_11");	//Орки уже пытались штурмовать замок, но тогда паладинам удалось отбить их атаку.
		AI_Output(other,self,"DIA_PAL_2000_Hagen_RescueGarond_01_12");	//Однако не думаю, что это продлится вечно!
	};
	AI_Output(self,other,"DIA_PAL_2000_Hagen_RescueGarond_01_13");	//В любом случае я должен знать, что стало с моими людьми. Даже если они уже все мертвы!
	AI_Output(other,self,"DIA_PAL_2000_Hagen_RescueGarond_01_14");	//Хорошо, я постараюсь это выяснить.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_RescueGarond_01_15");	//Тогда ступай. И да пребудет с тобой Иннос!
	MIS_RESCUEGAROND = LOG_Running;
	Log_CreateTopic(TOPIC_RESCUEGAROND,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RESCUEGAROND,LOG_Running);
	B_LogEntry(TOPIC_RESCUEGAROND,"Лорд Хаген поручил мне разузнать все о судьбе экспедиции, которую он направил в Долину Рудников. Последнее время от Гаронда не поступало никаких вестей, что очень сильно тревожит главу паладинов. Лорд Хаген хочет знать, что стало с его людьми.");
};


instance DIA_PAL_2000_HAGEN_HOWTHINGS(C_Info)
{
	npc = pal_2000_hagen;
	nr = 2;
	condition = dia_pal_2000_hagen_howthings_condition;
	information = dia_pal_2000_hagen_howthings_info;
	permanent = TRUE;
	description = "Как обстановка в форте?";
};


func int dia_pal_2000_hagen_howthings_condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_2000_hagen_mayjoinothers))
	{
		return TRUE;
	};
};

func void dia_pal_2000_hagen_howthings_info()
{
	AI_Output(other,self,"DIA_PAL_2000_Hagen_HowThings_01_01");	//Как обстановка в форте?
	if((PERMGARONDNEWS == FALSE) && (GARONDISBACK == TRUE))
	{
		B_GivePlayerXP(50);
		AI_Output(self,other,"DIA_PAL_2000_Hagen_HowThings_01_02");	//Лучше, чем было раньше! Возвращение Гаронда стало для многих радостным известием и хорошим знаком на будущее.
		AI_Output(other,self,"DIA_PAL_2000_Hagen_HowThings_01_03");	//Ты это серьезно?
		AI_Output(self,other,"DIA_PAL_2000_Hagen_HowThings_01_04");	//Конечно! Ведь в сложившейся ситуации выбраться живым из Долины раньше вообще никому не представлялось возможным.
		AI_Output(self,other,"DIA_PAL_2000_Hagen_HowThings_01_06");	//Но он, несмотря ни на что, все-таки смог это сделать, хотя и с твоей помощью.
		AI_Output(self,other,"DIA_PAL_2000_Hagen_HowThings_01_07");	//К тому же не стоит забывать, что все это время его небольшой отряд сдерживал натиск целой армии орков, не давая им продвинуться дальше вглубь острова.
		AI_Output(self,other,"DIA_PAL_2000_Hagen_HowThings_01_08");	//А все это также крайне немаловажно. В особенности, учитывая нынешнее положение всех наших дел.
		AI_Output(other,self,"DIA_PAL_2000_Hagen_HowThings_01_09");	//Само собой.
		PERMGARONDNEWS = TRUE;
	}
	else if(Npc_KnowsInfo(hero,dia_pal_2000_hagen_donejoinothersagreed))
	{
		AI_Output(self,other,"DIA_PAL_2000_Hagen_HowThings_01_16");	//Как будто ты и сам не курсе происходящего! Мы готовимся выступить на позиции в Хоринис и занять там оборону рядом с фермой.
		AI_Output(self,other,"DIA_PAL_2000_Hagen_HowThings_01_17");	//Надеюсь, это станет сюрпризом для орков! По крайне мере, я на это очень рассчитываю.
	}
	else
	{
		AI_Output(self,other,"DIA_PAL_2000_Hagen_HowThings_01_14");	//За последнее время пока что ничего не изменилось.
	};
};


instance DIA_PAL_2000_HAGEN_RESCUEGARONDOTHERS(C_Info)
{
	npc = pal_2000_hagen;
	nr = 2;
	condition = dia_pal_2000_hagen_rescuegarondothers_condition;
	information = dia_pal_2000_hagen_rescuegarondothers_info;
	permanent = FALSE;
	description = "Ты уже кого-то посылал в долину выяснить обстановку?";
};


func int dia_pal_2000_hagen_rescuegarondothers_condition()
{
	if(MIS_RESCUEGAROND == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_pal_2000_hagen_rescuegarondothers_info()
{
	AI_Output(other,self,"DIA_PAL_2000_Hagen_RescueGarondOthers_01_01");	//Ты уже кого-то посылал в долину выяснить обстановку?
	AI_Output(self,other,"DIA_PAL_2000_Hagen_RescueGarondOthers_01_02");	//Да, я уже отправил туда одного человека, но от него также пока нет никаких вестей.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_RescueGarondOthers_01_03");	//Эх...(печально) Боюсь, орки не дали ему далеко уйти. Хотя, может быть, он еще и жив!
	AI_Output(other,self,"DIA_PAL_2000_Hagen_RescueGarondOthers_01_04");	//И как звали того парня?
	AI_Output(self,other,"DIA_PAL_2000_Hagen_RescueGarondOthers_01_05");	//Его звали Натан. Славный малый, хочу тебе сказать!
	AI_Output(other,self,"DIA_PAL_2000_Hagen_RescueGarondOthers_01_06");	//И он тоже был паладином?
	AI_Output(self,other,"DIA_PAL_2000_Hagen_RescueGarondOthers_01_07");	//Само собой! Другие бы просто не взялись за столь опасное дело, как это.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_RescueGarondOthers_01_08");	//Натан был одним из тех людей лорда Варуса, которые добровольно вызвались плыть с моей экспедицией на этот остров.
	B_LogEntry(TOPIC_RESCUEGAROND,"Лорд Хаген уже посылал человека разведать обстановку в долине, но он также пропал без вести. Его звали Натан.");
};


instance DIA_PAL_2000_HAGEN_GARONDISBACK(C_Info)
{
	npc = pal_2000_hagen;
	nr = 2;
	condition = dia_pal_2000_hagen_garondisback_condition;
	information = dia_pal_2000_hagen_garondisback_info;
	permanent = FALSE;
	description = "Гаронд и его люди прибыли в форт!";
};


func int dia_pal_2000_hagen_garondisback_condition()
{
	if(GARONDISBACK == TRUE)
	{
		return TRUE;
	};
};

func void dia_pal_2000_hagen_garondisback_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_PAL_2000_Hagen_GarondIsBack_01_01");	//Гаронд и его люди прибыли в форт!
	AI_Output(self,other,"DIA_PAL_2000_Hagen_GarondIsBack_01_02");	//Это по-настоящему отличная новость. И она наверняка еще больше укрепит боевой дух моих солдат и нашу общую веру в победу!
	AI_Output(self,other,"DIA_PAL_2000_Hagen_GarondIsBack_01_03");	//Поэтому прими от меня мою благодарность и вот это золото в качестве награды за свои труды. Ты это заслужил!
	B_GiveInvItems(self,other,ItMi_Gold,1000);
	AI_Output(other,self,"DIA_PAL_2000_Hagen_GarondIsBack_01_04");	//Спасибо.
	if(MIS_RESCUEGAROND == LOG_Running)
	{
		MIS_RESCUEGAROND = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_RESCUEGAROND,LOG_SUCCESS);
		B_LogEntry(TOPIC_RESCUEGAROND,"Гаронд и его люди прибыли в форт паладинов. Думаю, теперь лорд Хаген должен согласиться с моим предложением.");
	};
};


instance DIA_PAL_2000_HAGEN_PIRATENEEDSHIP(C_Info)
{
	npc = pal_2000_hagen;
	nr = 2;
	condition = dia_pal_2000_hagen_pirateneedship_condition;
	information = dia_pal_2000_hagen_pirateneedship_info;
	permanent = FALSE;
	description = "Пиратам нужен ваш корабль.";
};


func int dia_pal_2000_hagen_pirateneedship_condition()
{
	if(MIS_PIRATENEEDSHIP == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_pal_2000_hagen_pirateneedship_info()
{
	AI_Output(other,self,"DIA_PAL_2000_Hagen_PirateNeedShip_01_01");	//Пиратам нужен ваш корабль.
	AI_Output(other,self,"DIA_PAL_2000_Hagen_PirateNeedShip_01_02");	//Только на этих условиях они готовы присоединиться к вашей армии.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_PirateNeedShip_01_03");	//Отдать им наш корабль? (гневно) Что они, черт побери, о себе возомнили?!
	AI_Output(self,other,"DIA_PAL_2000_Hagen_PirateNeedShip_01_04");	//Да я скорее сдамся в плен к оркам, чем приму такие условия!
	AI_Output(other,self,"DIA_PAL_2000_Hagen_PirateNeedShip_01_05");	//Но нам очень нужна их помощь!
	AI_Output(other,self,"DIA_PAL_2000_Hagen_PirateNeedShip_01_06");	//В конце концов, он тебе больше не пригодится в случае нашей неудачи.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_PirateNeedShip_01_07");	//Ты прав! Но я не могу вот так просто идти у всех на поводу. Тем более у этих грязных мошенников!
	AI_Output(self,other,"DIA_PAL_2000_Hagen_PirateNeedShip_01_08");	//А что будет, если они завтра попросят принять их всех в орден паладинов - ты мне и это прикажешь сделать?!
	AI_Output(other,self,"DIA_PAL_2000_Hagen_PirateNeedShip_01_09");	//Довольно неплохая мысль с твоей стороны.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_PirateNeedShip_01_10");	//Что?! (гневно) Какая мысль? Да ты в своем уме, парень?!
	AI_Output(other,self,"DIA_PAL_2000_Hagen_PirateNeedShip_01_11");	//Конечно! Ведь сделав это и отдав им свой корабль, ты ничего не потеряешь.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_PirateNeedShip_01_12");	//Но Орден Паладинов священен! Лишь только достойные этой чести могут быть приняты в наши ряды.
	AI_Output(other,self,"DIA_PAL_2000_Hagen_PirateNeedShip_01_13");	//Только в скором времени может получиться так, что достойных уже не будет.
	AI_Output(other,self,"DIA_PAL_2000_Hagen_PirateNeedShip_01_14");	//Поскольку всех просто-напросто перебьют орки.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_PirateNeedShip_01_15");	//(потерянно) О, Иннос! И за что только ты мне посылаешь подобные испытания?
	AI_Output(other,self,"DIA_PAL_2000_Hagen_PirateNeedShip_01_16");	//Насколько я вижу, что ты уже почти согласен с подобным предложением. Не так ли?
	AI_Output(self,other,"DIA_PAL_2000_Hagen_PirateNeedShip_01_17");	//Эх...(обреченно) Ну, хорошо. Считай, что ты смог убедить меня в целесообразности этих действий.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_PirateNeedShip_01_18");	//Передай им, что если они готовы послужить делу Инноса и вступить в наши ряды, то я отдам им свой корабль.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_PirateNeedShip_01_19");	//И да простит меня он за подобные решения.
	HAGENINVITEPIRATES = TRUE;
	B_LogEntry(TOPIC_PIRATENEEDSHIP,"Лорд Хаген был крайне возмущен требованиям пиратов, но в конце концов, мне удалось убедить его в необходимости подобной сделки. С условием, что сами пираты вступят в его орден.");
};


instance DIA_PAL_2000_HAGEN_SLDANSWER(C_Info)
{
	npc = pal_2000_hagen;
	nr = 2;
	condition = dia_pal_2000_hagen_sldanswer_condition;
	information = dia_pal_2000_hagen_sldanswer_info;
	permanent = FALSE;
	description = "Я принес ответ от наемников.";
};


func int dia_pal_2000_hagen_sldanswer_condition()
{
	if(MIS_OREWEAPONSLD == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_pal_2000_hagen_sldanswer_info()
{
	AI_Output(other,self,"DIA_PAL_2000_Hagen_SldAnswer_01_01");	//Я принес ответ от наемников.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_SldAnswer_01_02");	//(угрюмо) И что они сказали?
	AI_Output(other,self,"DIA_PAL_2000_Hagen_SldAnswer_01_03");	//Ли согласен поддержать вас и выступить со своими людьми против орков.
	AI_Output(other,self,"DIA_PAL_2000_Hagen_SldAnswer_01_04");	//Однако он хочет, чтобы ты вооружил его людей рудными клинками.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_SldAnswer_01_05");	//Что?! А не слишком ли многого он хочет?
	AI_Output(other,self,"DIA_PAL_2000_Hagen_SldAnswer_01_06");	//По его мнению, это сделает его людей более боеспособными. А остальное уже решать тебе.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_SldAnswer_01_07");	//Так я и знал...(ворчливо) Стоит только раз пойти на уступки по отношению к этим мерзавцам, так они сразу начнут от тебя требовать невесть что!
	AI_Output(self,other,"DIA_PAL_2000_Hagen_SldAnswer_01_08");	//Надеюсь, тебе известно, что рудные клинки носят только паладины короля. Почему я должен нарушать это правило?
	AI_Output(other,self,"DIA_PAL_2000_Hagen_SldAnswer_01_09");	//Потому что этого требует ситуация!
	AI_Output(self,other,"DIA_PAL_2000_Hagen_SldAnswer_01_10");	//Ну, допустим. Однако, даже если бы я согласился на это, то у меня все равно нет такого количества этого оружия, чтобы вооружить всех его головорезов.
	AI_Output(other,self,"DIA_PAL_2000_Hagen_SldAnswer_01_11");	//Тогда их нужно просто выковать.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_SldAnswer_01_12");	//И как ты мне прикажешь это сделать? Ведь для этого нужна магическая руда!
	AI_Output(self,other,"DIA_PAL_2000_Hagen_SldAnswer_01_13");	//А единственное место, где ее можно еще добыть - это Долина Рудников, в которой сейчас заправляют орки.
	AI_Output(other,self,"DIA_PAL_2000_Hagen_SldAnswer_01_14");	//Если дело только в руде, то я ее достану.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_SldAnswer_01_15");	//Какой же ты все-таки упрямец, это что-то! Никогда еще не встречал людей, подобных тебе.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_SldAnswer_01_16");	//Эх, ладно! Если ты действительно так в этом уверен, пускай будет по-твоему.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_SldAnswer_01_17");	//Найди магическую руду и выкуй из нее столько рудных клинков, сколько посчитаешь нужным.
	AI_Output(self,other,"DIA_PAL_2000_Hagen_SldAnswer_01_18");	//Вот, возьми этот свиток. Там ты найдешь все инструкции касательно этого.
	B_GiveInvItems(self,other,itwr_letteroresword,1);
	B_LogEntry(TOPIC_OREWEAPONSLD,"После долгих споров мне удалось убедить лорда Хагена в необходимости вооружить людей Ли рудными клинками. Он дал мне свиток, где описан процесс ковки этого священного оружия. Осталось достать магическую руду и узнать, сколько клинков нужно Ли и его людям.");
};

