
instance DIA_PAL_7523_EXIT(C_Info)
{
	npc = pal_7523_albert;
	nr = 999;
	condition = dia_pal_7523_exit_condition;
	information = dia_pal_7523_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_7523_exit_condition()
{
	return TRUE;
};

func void dia_pal_7523_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_7523_GREET(C_Info)
{
	npc = pal_7523_albert;
	nr = 2;
	condition = dia_pal_7523_greet_condition;
	information = dia_pal_7523_greet_info;
	important = TRUE;
};


func int dia_pal_7523_greet_condition()
{
	if(KAPITELORCATC == FALSE)
	{
		return TRUE;
	};
};

func void dia_pal_7523_greet_info()
{
	AI_Output(self,other,"DIA_PAL_7523_Greet_01_00");	//Кто ты?! И как ты сюда попал?
	AI_Output(other,self,"DIA_PAL_7523_Greet_01_01");	//Я из замка, разведываю местность.
	AI_Output(self,other,"DIA_PAL_7523_Greet_01_02");	//Ты был в замке?! И как там?

	if(MIS_OCGateOpen == TRUE)
	{
		AI_Output(other,self,"DIA_PAL_7523_Greet_01_03");	//Орки штурмовали замок!
		AI_Output(self,other,"DIA_PAL_7523_Greet_01_04");	//О, Иннос! За что на нас такие напасти?
		AI_Output(self,other,"DIA_PAL_7523_Greet_01_05");	//Хоть это и ужасные вести, но я благодарю тебя за них.
		AI_Output(self,other,"DIA_PAL_7523_Greet_01_06");	//Теперь уже нет смысла слать за помощью к Гаронду - мы должны пробиваться сами.
	}
	else
	{
		AI_Output(other,self,"DIA_PAL_7523_Greet_01_07");	//Ничего хорошего. Орки все так же держат его в плотном кольце.
		AI_Output(other,self,"DIA_PAL_7523_Greet_01_08");	//А каждую неделю к ним приходят новые подкрепления.
		AI_Output(self,other,"DIA_PAL_7523_Greet_01_09");	//Это плохо! Мы не сможем пробиться в замок, чтобы сражаться там вместе со всеми.
		AI_Output(self,other,"DIA_PAL_7523_Greet_01_11");	//Ладно. Но в таком случае не сможешь ли ты оказать нам небольшую помощь?
		AI_Output(self,other,"DIA_PAL_7523_Greet_01_13");	//Необходимо отнести в замок сообщение о том, где мы и сколько нас.
		AI_Output(other,self,"DIA_PAL_7523_Greet_Ok_01_01");	//Хорошо, я сообщу Гаронду о вас.
		AI_Output(self,other,"DIA_PAL_7523_Greet_Ok_01_02");	//Благодарю тебя. Да благослови тебя Иннос!
	};

	AlbertGroup = TRUE;

	if(MIS_LostPaladins == LOG_Running)
	{
		B_LogEntry(TOPIC_LostPaladins,"В пещере, за забором орков, я нашел группу паладинов.");
	};
};

instance DIA_PAL_7523_GREET2(C_Info)
{
	npc = pal_7523_albert;
	nr = 2;
	condition = dia_pal_7523_greet2_condition;
	information = dia_pal_7523_greet2_info;
	permanent = FALSE;
	description = "А паладин Тандор, случайно, не из вашего отряда?";
};

func int dia_pal_7523_greet2_condition()
{
	if((AlbertGroup == TRUE) && Npc_KnowsInfo(other,DIA_Tandor_Trupp) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void dia_pal_7523_greet2_info()
{
	AI_Output(other,self,"DIA_PAL_7523_Greet2_01_00");	//А паладин Тандор, случайно, не из вашего отряда?
	AI_Output(self,other,"DIA_PAL_7523_Greet2_01_01");	//Да, он был с нами до тех пор, пока мы не нарвались на передовой отряд орков.
	AI_Output(self,other,"DIA_PAL_7523_Greet2_01_02");	//Но к сожалению, после той битвы он пропал без вести. А ты что-нибудь знаешь о нем?

	if(Npc_IsDead(tandor))
	{
		AI_Output(other,self,"DIA_PAL_7523_Greet2_01_03");	//У меня плохие новости - ему удалось добраться до замка, но во время одной из стычек с орками он погиб.
		AI_Output(self,other,"DIA_PAL_7523_Greet2_01_04");	//Печально. Хотя мы считали его уже давно погибшим.
		AI_Output(self,other,"DIA_PAL_7523_Greet2_01_05");	//Да одарит Иннос покоем его душу!
	}
	else
	{
		AI_Output(other,self,"DIA_PAL_7523_Greet2_01_06");	//У меня хорошие новости - ему удалось добраться до замка.
		AI_Output(self,other,"DIA_PAL_7523_Greet2_01_07");	//О, Иннос! Поистине, хотя бы одна радостная новость за все это время.
		AI_Output(self,other,"DIA_PAL_7523_Greet2_01_08");	//Тогда передай ему, что с его братьями по оружию тоже все в порядке.
		SAYTOTANDORABOUTGROUP = TRUE;
	};
};

instance DIA_PAL_7523_GREET3(C_Info)
{
	npc = pal_7523_albert;
	nr = 2;
	condition = dia_pal_7523_greet3_condition;
	information = dia_pal_7523_greet3_info;
	permanent = FALSE;
	description = "Я передал сообщение Гаронду.";
};

func int dia_pal_7523_greet3_condition()
{
	if((MIS_FINDEDOCGROUP == LOG_Running) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void dia_pal_7523_greet3_info()
{
	var C_Npc ritter1;
	var C_Npc ritter2;
	AI_Output(other,self,"DIA_PAL_7523_Greet3_01_00");	//Я передал сообщение Гаронду.
	AI_Output(self,other,"DIA_PAL_7523_Greet3_01_01");	//И что он сказал?
	AI_Output(other,self,"DIA_PAL_7523_Greet3_01_02");	//Он велел вам не высовываться до тех пор, пока в долине не появится лорд Хаген с подкреплением.
	AI_Output(other,self,"DIA_PAL_7523_Greet3_01_03");	//И только тогда нанести удар в тыл оркам.
	AI_Output(self,other,"DIA_PAL_7523_Greet3_01_04");	//Все ясно! В таком случае мы будем наготове.
	MIS_FINDEDOCGROUP = LOG_Success;
	Log_SetTopicStatus(TOPIC_FINDEDOCGROUP,LOG_Success);
	B_LogEntry_Quiet(TOPIC_FINDEDOCGROUP,"Я сообщил распоряжение Гаронда Альберту.");
	B_GivePlayerXP(XP_Ambient);
	Npc_ExchangeRoutine(self,"Prepare");
	ritter1 = Hlp_GetNpc(pal_7520_ritter);
	ritter2 = Hlp_GetNpc(pal_7521_ritter);

	if(Hlp_IsValidNpc(ritter1) && !Npc_IsDead(ritter1))
	{
		B_StartOtherRoutine(ritter1,"Prepare");
	};
	if(Hlp_IsValidNpc(ritter2) && !Npc_IsDead(ritter2))
	{
		B_StartOtherRoutine(ritter2,"Prepare");
	};
};


instance DIA_PAL_7523_FORESTBASE(C_Info)
{
	npc = pal_7523_albert;
	nr = 3;
	condition = dia_pal_7523_forestbase_condition;
	information = dia_pal_7523_forestbase_info;
	permanent = FALSE;
	description = "Какие у вас отношения с лагерем наверху?";
};

func int dia_pal_7523_forestbase_condition()
{
	if((HEROKNOWFORESTBASE == TRUE) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void dia_pal_7523_forestbase_info()
{
	AI_Output(other,self,"DIA_PAL_7523_Forestbase_01_00");	//Какие у вас отношения с лагерем наверху?
	AI_Output(self,other,"DIA_PAL_7523_Forestbase_01_01");	//(заносчиво) Хотя они там все и заключенные из этой колонии...
	AI_Output(self,other,"DIA_PAL_7523_Forestbase_01_02");	//...но мы все-таки поддерживаем с ними постоянный контакт - торгуем и обмениваемся свежей информацией.
	AI_Output(self,other,"DIA_PAL_7523_Forestbase_01_03");	//В любом случае - если орки нападут, то наверняка нам придется сражаться плечом к плечу.
};


instance DIA_PAL_7523_PERM(C_Info)
{
	npc = pal_7523_albert;
	nr = 3;
	condition = dia_pal_7523_perm_condition;
	information = dia_pal_7523_perm_info;
	permanent = TRUE;
	description = "Как идут дела?";
};


func int dia_pal_7523_perm_condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_7523_greet))
	{
		return TRUE;
	};
};

func void dia_pal_7523_perm_info()
{
	AI_Output(other,self,"DIA_PAL_7523_Perm_01_00");	//Как обстановка?
	if(KAPITELORCATC == TRUE)
	{
		AI_Output(self,other,"DIA_PAL_7523_Perm_01_01");	//Думаю, ты и сам прекрасно это видишь...
		AI_StopProcessInfos(self);
	};
	if(Npc_KnowsInfo(hero,dia_pal_7523_greet3))
	{
		AI_Output(self,other,"DIA_PAL_7523_Perm_01_02");	//Не сказать, что плохо...
		AI_Output(self,other,"DIA_PAL_7523_Perm_01_03");	//Нам остается только дождаться того момента, когда лорд Хаген прибудет сюда с подкреплениями.
		AI_Output(self,other,"DIA_PAL_7523_Perm_01_04");	//А потом мы ударим в тыл оркам! И надеюсь, что у нас все получится.
	}
	else
	{
		AI_Output(self,other,"DIA_PAL_7523_Perm_01_05");	//Сейчас тут все спокойно. Хотя это всего лишь видимость!
	};
};


instance DIA_PAL_7523_DRAKAR(C_Info)
{
	npc = pal_7523_albert;
	nr = 3;
	condition = dia_pal_7523_drakar_condition;
	information = dia_pal_7523_drakar_info;
	permanent = FALSE;
	description = "Могу ли я еще чем-то помочь?";
};


func int dia_pal_7523_drakar_condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_7523_greet3) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void dia_pal_7523_drakar_info()
{
	AI_Output(other,self,"DIA_PAL_7523_Drakar_01_00");	//Могу я тебе еще чем-то помочь?
	AI_Output(self,other,"DIA_PAL_7523_Drakar_01_05");	//Эх... С каждым новым днем здесь появляется все большее и большее количество этих зеленокожих тварей.
	AI_Output(self,other,"DIA_PAL_7523_Drakar_01_06");	//Ты был у моря? Видел боевой дракар орков? Ну, даже если не видел, - он все равно там есть.
	AI_Output(self,other,"DIA_PAL_7523_Drakar_01_07");	//Именно эта посудина доставляет сюда их новые и новые силы.
	AI_Output(self,other,"DIA_PAL_7523_Drakar_01_08");	//Если дело пойдет так и дальше, то скоро они полностью завладеют ситуацией здесь, в долине.
	AI_Output(self,other,"DIA_PAL_7523_Drakar_01_09");	//И лорд Хаген с подкреплением уже вряд ли сможет нам помочь - численный перевес орков скажет свое веское слово.
	AI_Output(other,self,"DIA_PAL_7523_Drakar_01_10");	//И что ты предлагаешь?
	AI_Output(self,other,"DIA_PAL_7523_Drakar_01_11");	//Если нам удастся каким-то образом заставить эту лохань застрять тут, то это будет серьезный удар по позициям орков.
	AI_Output(self,other,"DIA_PAL_7523_Drakar_01_12");	//По крайней мере, на какое-то время они останутся здесь без какой-либо поддержки, а это уже довольно много!
	AI_Output(other,self,"DIA_PAL_7523_Drakar_01_13");	//И как я это сделаю? Ты хочешь, чтоб я проковырял в борту дырочку?
	AI_Output(self,other,"DIA_PAL_7523_Drakar_01_15");	//Нет! Но поломка какой-нибудь маленькой шестеренки в рулевом механизме превращает его в корыто.
	AI_Output(self,other,"DIA_PAL_7523_Drakar_01_16");	//Уверен, ты сумеешь найти в нем слабое место.
	AI_Output(other,self,"DIA_PAL_7523_Drakar_01_18");	//Я посмотрю, что можно сделать.
	MIS_DRAKARBROKE = LOG_Running;
	Log_CreateTopic(TOPIC_DRAKARBROKE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DRAKARBROKE,LOG_Running);
	B_LogEntry(TOPIC_DRAKARBROKE,"Альберт хочет, чтобы я попробовал вывести из строя боевой дракар орков, который бросил якорь недалеко от места стоянки паладинов. Это лишит орков возможности переброски на остров новых отрядов. Сам Альберт точно не знает, как это можно сделать, но точно уверен, что такое возможно.");
};


instance DIA_PAL_7523_DRAKARDONE(C_Info)
{
	npc = pal_7523_albert;
	nr = 3;
	condition = dia_pal_7523_drakardone_condition;
	information = dia_pal_7523_drakardone_info;
	permanent = FALSE;
	description = "Насчет дракара орков...";
};


func int dia_pal_7523_drakardone_condition()
{
	if((MIS_DRAKARBROKE == LOG_Running) && (DRAKARISBROKEN == TRUE) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void dia_pal_7523_drakardone_info()
{
	B_GivePlayerXP(400);
	AI_Output(other,self,"DIA_PAL_7523_DrakarDone_01_00");	//Насчет дракара орков...
	AI_Output(other,self,"DIA_PAL_7523_DrakarDone_01_02");	//Уверен, что теперь этот корабль навряд ли куда-либо уплывет.
	AI_Output(self,other,"DIA_PAL_7523_DrakarDone_01_04");	//Ты это серьезно? Ну тогда это очень хорошие новости!
	AI_Output(self,other,"DIA_PAL_7523_DrakarDone_01_05");	//Это значит, что поток прибывающих орков сократится, и это наверняка ослабит их позиции.
	AI_Output(self,other,"DIA_PAL_7523_DrakarDone_01_06");	//Нам же осталось дождаться лорда Хагена с подкреплением. А потом мы выбьем отсюда этих тварей!
	MIS_DRAKARBROKE = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_DRAKARBROKE,LOG_SUCCESS);
	B_LogEntry(TOPIC_DRAKARBROKE,"Альберт был рад услышать о том, что дракар орков получил серьезную поломку.");
};


instance DIA_PAL_7523_ORCORDER(C_Info)
{
	npc = pal_7523_albert;
	nr = 3;
	condition = dia_pal_7523_orcorder_condition;
	information = dia_pal_7523_orcorder_info;
	permanent = FALSE;
	description = "У меня кое-что есть для тебя.";
};

func int dia_pal_7523_orcorder_condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_7523_drakar) && (KNOWSTARANBUILD == FALSE) && (FLAG_ORCS_DRAKAR == TRUE) && (Npc_IsDead(NONE_110_Urshak) == FALSE) && (Npc_HasItems(hero,itwr_orcsorder) >= 1) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void dia_pal_7523_orcorder_info()
{
	AI_Output(other,self,"DIA_PAL_7523_OrcOrder_01_00");	//У меня кое-что есть для тебя.
	AI_Output(other,self,"DIA_PAL_7523_OrcOrder_01_01");	//Вот это письмо с записями - я нашел его у одного элитного орка на борту дракара.
	AI_Output(self,other,"DIA_PAL_7523_OrcOrder_01_02");	//Хммм...(с интересом) Дай мне взглянуть!
	B_GiveInvItems(other,self,itwr_orcsorder,1);
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_PAL_7523_OrcOrder_01_04");	//Так-так... Судя по всему, эти записи сделаны на языке орков. Мне уже встречались раньше подобные вещи.
	AI_Output(other,self,"DIA_PAL_7523_OrcOrder_01_05");	//(саркастически) А я-то думал, что-то почерк какой-то неразборчивый.
	AI_Output(self,other,"DIA_PAL_7523_OrcOrder_01_06");	//(не реагируя) Кстати, обрати внимание - на этих письменах стоит их военное клеймо.
	AI_Output(self,other,"DIA_PAL_7523_OrcOrder_01_08");	//Значит, это военный документ! И в нем наверняка содержатся сведения о планах орков.
	AI_Output(other,self,"DIA_PAL_7523_OrcOrder_01_10");	//Ладно, давай мне письмо, я что-нибудь придумаю.
	AI_Output(self,other,"DIA_PAL_7523_OrcOrder_01_11");	//Собрался поймать орка и выпытать у него? (смеется)
	B_GiveInvItems(self,other,itwr_orcsorder,1);
	MIS_ORCORDER = LOG_Running;
	Log_CreateTopic(TOPIC_ORCORDER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ORCORDER,LOG_Running);
	B_LogEntry(TOPIC_ORCORDER,"Я показал Альберту письмо, которое обнаружил у элитного орка на борту дракара. Судя по его словам, эти записи представляют для орков очень большую важность, поскольку на письме стоит их военное клеймо. Теперь необходимо выяснить - о чем именно идет речь в этом письме. Надо найти того, кто поможет перевести мне это письмо.");
};


instance DIA_PAL_7523_ORCORDERPROGRESS(C_Info)
{
	npc = pal_7523_albert;
	nr = 3;
	condition = dia_pal_7523_orcorderprogress_condition;
	information = dia_pal_7523_orcorderprogress_info;
	permanent = FALSE;
	description = "Я узнал, о чем говорится в письме орков.";
};


func int dia_pal_7523_orcorderprogress_condition()
{
	if((MIS_ORCORDER == LOG_Running) && (KNOWSTARANBUILD == TRUE) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void dia_pal_7523_orcorderprogress_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_PAL_7523_OrcOrderProgress_01_00");	//Я узнал, о чем говорилось в письме орков.
	AI_Output(other,self,"DIA_PAL_7523_OrcOrderProgress_01_01");	//Орки не уйдут из долины до тех пор, пока не овладеют крепостью.
	AI_Output(self,other,"DIA_PAL_7523_OrcOrderProgress_01_02");	//Тоже мне новость, это и гоблину понятно.
	AI_Output(other,self,"DIA_PAL_7523_OrcOrderProgress_01_03");	//И самое важное: для этого они прислали сюда отряд рабов, который должен будет сделать для них новый таран.
	AI_Output(other,self,"DIA_PAL_7523_OrcOrderProgress_01_04");	//Когда он будет закончен - орки вновь пойдут на штурм замка!
	AI_Output(self,other,"DIA_PAL_7523_OrcOrderProgress_01_05");	//Проклятье! Если это так, то у Гаронда и его людей не будет ни единого шанса сдержать их натиск.
	AI_Output(self,other,"DIA_PAL_7523_OrcOrderProgress_01_06");	//Этого никак нельзя допустить! Где сейчас этот отряд?
	AI_Output(other,self,"DIA_PAL_7523_OrcOrderProgress_01_07");	//Судя по всему, движется к позициям орков.
	AI_Output(self,other,"DIA_PAL_7523_OrcOrderProgress_01_08");	//Тогда ты должен его остановить любой ценой! Эти рабы не должны добраться до крепости!
	AI_Output(self,other,"DIA_PAL_7523_OrcOrderProgress_01_10");	//Я дам тебе несколько своих лучших людей. Теперь отправляйся!
	B_LogEntry(TOPIC_ORCORDER,"Я рассказал Альберту о содержании письма орков. Он приказал мне отправиться на поиски этого отряда, выделив мне несколько своих людей.");
	Wld_InsertNpc(orcslave_01,"FP_ROAM_ORCSLAVETEAM_01");
	Wld_InsertNpc(orcslave_02,"FP_ROAM_ORCSLAVETEAM_02");
	Wld_InsertNpc(orcslave_03,"FP_ROAM_ORCSLAVETEAM_03");
	Wld_InsertNpc(orcslave_04,"FP_ROAM_ORCSLAVETEAM_04");
	Wld_InsertNpc(orcslave_05,"FP_ROAM_ORCSLAVETEAM_05");
	Wld_InsertNpc(orcslave_06,"FP_ROAM_ORCSLAVETEAM_06");
	Wld_InsertNpc(orcslave_07,"FP_ROAM_ORCSLAVETEAM_07");
	Wld_InsertNpc(orcslave_08,"FP_ROAM_ORCSLAVETEAM_08");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ORCSLAVEGUARD_01");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ORCSLAVEGUARD_02");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ORCSLAVEGUARD_04");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ORCSLAVEGUARD_05");
	Wld_InsertNpc(orkelite_addon3,"FP_ROAM_ORCSLAVEGUARD_03");
	GOTOKILLORCSLAVES = TRUE;
};

instance DIA_PAL_7523_ORCORDERDONE(C_Info)
{
	npc = pal_7523_albert;
	nr = 3;
	condition = dia_pal_7523_orcorderdone_condition;
	information = dia_pal_7523_orcorderdone_info;
	permanent = FALSE;
	description = "С отрядом орков покончено!";
};

func int dia_pal_7523_orcorderdone_condition()
{
	if((MIS_ORCORDER == LOG_Running) && (GOTOKILLORCSLAVESDONE == TRUE) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void dia_pal_7523_orcorderdone_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_PAL_7523_OrcOrderDone_01_00");	//С отрядом орков покончено!
	AI_Output(self,other,"DIA_PAL_7523_OrcOrderDone_01_01");	//Отлично! Эта самая лучшая новость, которую ты только мог принести.
	AI_Output(self,other,"DIA_PAL_7523_OrcOrderDone_01_02");	//Теперь нашим братьям в крепости нечего бояться штурма.
	AI_Output(self,other,"DIA_PAL_7523_OrcOrderDone_01_03");	//А орки пускай грызут камни замка зубами, пытаясь пробить в них брешь.
	AI_Output(self,other,"DIA_PAL_7523_OrcOrderDone_01_05");	//Что касается тебя - то по моему мнению, ты заслужил щедрую награду за свои труды.
	AI_Output(self,other,"DIA_PAL_7523_OrcOrderDone_01_06");	//К сожалению... у меня не так много золота, чтобы это выглядело достойной для тебя наградой.
	AI_Output(self,other,"DIA_PAL_7523_OrcOrderDone_01_07");	//Но думаю, что смогу отблагодарить тебя по-другому.
	AI_Output(self,other,"DIA_PAL_7523_OrcOrderDone_01_09");	//Вот...(гордо) Возьми этот драгоценный перстень.
	CreateInvItems(self,itri_innosjudge,1);
	B_GiveInvItems(self,other,itri_innosjudge,1);
	AI_Output(self,other,"DIA_PAL_7523_OrcOrderDone_01_10");	//Он достался мне из рук самого короля Робара!
	AI_Output(self,other,"DIA_PAL_7523_OrcOrderDone_01_11");	//Обычно такими вещами награждаются только самые отважные воины Инноса!
	if(other.guild != GIL_PAL)
	{
		AI_Output(self,other,"DIA_PAL_7523_OrcOrderDone_01_12");	//Хотя ты и не паладин, но по праву заслужил этой чести! Носи его с гордостью.
	}
	else
	{
		AI_Output(self,other,"DIA_PAL_7523_OrcOrderDone_01_13");	//Ты по праву заслужил этой чести! Носи его с гордостью.
	};
	AI_Output(other,self,"DIA_PAL_7523_OrcOrderDone_01_14");	//Спасибо.
	MIS_ORCORDER = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_ORCORDER,LOG_SUCCESS);
	B_LogEntry(TOPIC_ORCORDER,"Я сообщил Альберту о том, что отряд орков уничтожен. Он подарил мне перстень Доблесть Инноса - вещь, которой награждают только самых отважных паладинов.");
	if(!Npc_IsDead(pal_7518_ritter))
	{
		Npc_ExchangeRoutine(pal_7518_ritter,"Start");
		AI_Teleport(pal_7518_ritter,"WP_COAST_CAMP_01_ORCTEAM");
	};
	if(!Npc_IsDead(pal_7519_ritter))
	{
		Npc_ExchangeRoutine(pal_7519_ritter,"Start");
		AI_Teleport(pal_7519_ritter,"WP_COAST_CAMP_02_ORCTEAM");
	};
};


instance DIA_PAL_7523_LEADER(C_Info)
{
	npc = pal_7523_albert;
	nr = 3;
	condition = dia_pal_7523_leader_condition;
	information = dia_pal_7523_leader_info;
	permanent = FALSE;
	description = "Кто сейчас вами командует?";
};


func int dia_pal_7523_leader_condition()
{
	if((KAPITELORCATC == TRUE) && (PALADINCASTELFREE == FALSE) && (COMMANDPALOW == FALSE))
	{
		return TRUE;
	};
};

func void dia_pal_7523_leader_info()
{
	AI_Output(other,self,"DIA_PAL_7523_Leader_01_00");	//Кто сейчас вами командует?
	AI_Output(self,other,"DIA_PAL_7523_Leader_01_01");	//Нашим отрядом сейчас руководит паладин Натан, поскольку он самый старший из нас по званию.
	AI_Output(other,self,"DIA_PAL_7523_Leader_01_03");	//Ясно.
	COMMANDPALOW = TRUE;
};


instance DIA_PAL_7523_HOWHERE(C_Info)
{
	npc = pal_7523_albert;
	nr = 1;
	condition = dia_pal_7523_howhere_condition;
	information = dia_pal_7523_howhere_info;
	permanent = FALSE;
	description = "Как вы здесь оказались?";
};


func int dia_pal_7523_howhere_condition()
{
	if((KAPITELORCATC == TRUE) && (PALADINCASTELFREE == FALSE))
	{
		return TRUE;
	};
};

func void dia_pal_7523_howhere_info()
{
	AI_Output(other,self,"DIA_PAL_7523_HowHere_01_00");	//Как вы здесь оказались?
	AI_Output(self,other,"DIA_PAL_7523_HowHere_01_01");	//Это был приказ Гаронда! Он прислал посыльного с сообщением о том, что орки планируют очередной штурм.
	AI_Output(self,other,"DIA_PAL_7523_HowHere_01_02");	//Нам предписывалось как можно скорее выдвинуться по направлению к замку, чтобы нанести внезапный удар оркам в тыл.
	AI_Output(other,self,"DIA_PAL_7523_HowHere_01_03");	//И как все прошло?
	AI_Output(self,other,"DIA_PAL_7523_HowHere_01_04");	//Поверь мне - план был хорош...(с досадой) Но, к сожалению, наша помощь подоспела слишком поздно!
	AI_Output(self,other,"DIA_PAL_7523_HowHere_01_06");	//По дороге к осажденной крепости наш отряд угодили в засаду к оркам.
	AI_Output(self,other,"DIA_PAL_7523_HowHere_01_07");	//Их было немного, но драгоценное время было потеряно!
	AI_Output(self,other,"DIA_PAL_7523_HowHere_01_08");	//Когда мы подошли к крепости, на ней уже развивался боевой стяг орков.
	AI_Output(self,other,"DIA_PAL_7523_HowHere_01_09");	//Поняв всю безнадежность ситуации, я велел своим людям отступать, а дойдя до этого места - занял тут оборону.
	AI_Output(other,self,"DIA_PAL_7523_HowHere_01_10");	//А почему именно в этом месте?
	AI_Output(self,other,"DIA_PAL_7523_HowHere_01_11");	//Потому, что здесь дорога сужается, и нам было бы проще обороняться, если бы орки нагрянули сюда.
	AI_Output(self,other,"DIA_PAL_7523_HowHere_01_12");	//Но пока что этого не случилось.
	AI_Output(other,self,"DIA_PAL_7523_HowHere_01_13");	//Понятно.
};

