var int CheckTadeNaKosh;

func void B_GorNaKoshEquipWeapon(var C_Npc slf)
{
	var C_Item EquipWeapon;

	EquipWeapon = Npc_GetEquippedMeleeWeapon(slf);

	if(CheckTadeNaKosh == TRUE)
	{
		if(Hlp_IsItem(EquipWeapon,ITMW_ZWEIHAENDER_GORNAKOSH) == FALSE)
		{
			AI_UnequipWeapons(slf);

			if(Npc_HasItems(slf,ITMW_ZWEIHAENDER_GORNAKOSH) < 1)
			{
				CreateInvItem(slf,ITMW_ZWEIHAENDER_GORNAKOSH);
			};

			Npc_EquipItem(slf,ITMW_ZWEIHAENDER_GORNAKOSH);
		};

		CheckTadeNaKosh = FALSE;
	};
};

instance DIA_GORNAKOSH_EXIT(C_Info)
{
	npc = tpl_8005_gornakosh;
	nr = 999;
	condition = dia_gornakosh_exit_condition;
	information = dia_gornakosh_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_gornakosh_exit_condition()
{
	return TRUE;
};

func void dia_gornakosh_exit_info()
{
	AI_StopProcessInfos(self);
	B_GorNaKoshEquipWeapon(self);
};

instance dia_gornakosh_PICKPOCKET(C_Info)
{
	npc = tpl_8005_gornakosh;
	nr = 900;
	condition = dia_gornakosh_PICKPOCKET_Condition;
	information = dia_gornakosh_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int dia_gornakosh_PICKPOCKET_Condition()
{
	return C_Beklauen(15,35);
};

func void dia_gornakosh_PICKPOCKET_Info()
{
	Info_ClearChoices(dia_gornakosh_PICKPOCKET);
	Info_AddChoice(dia_gornakosh_PICKPOCKET,Dialog_Back,dia_gornakosh_PICKPOCKET_BACK);
	Info_AddChoice(dia_gornakosh_PICKPOCKET,DIALOG_PICKPOCKET,dia_gornakosh_PICKPOCKET_DoIt);
};

func void dia_gornakosh_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(dia_gornakosh_PICKPOCKET);
};

func void dia_gornakosh_PICKPOCKET_BACK()
{
	Info_ClearChoices(dia_gornakosh_PICKPOCKET);
};


instance DIA_GORNAKOSH_WHOYOU(C_Info)
{
	npc = tpl_8005_gornakosh;
	nr = 1;
	condition = dia_gornakosh_whoyou_condition;
	information = dia_gornakosh_whoyou_info;
	permanent = FALSE;
	description = "Кто ты?";
};


func int dia_gornakosh_whoyou_condition()
{
	if((Kapitel < 5) && (PSI_TALK == TRUE))
	{
		return TRUE;
	};
};

func void dia_gornakosh_whoyou_info()
{
	AI_Output(other,self,"DIA_GorNaKosh_WhoYou_01_00");	//Кто ты?
	AI_Output(self,other,"DIA_GorNaKosh_WhoYou_01_01");	//Мое имя - Гор На Кош, верховный Страж Братства! (гордо) У тебя еще вопрос?
	AI_Output(other,self,"DIA_GorNaKosh_WhoYou_01_02");	//Как мне получить такие же доспехи, как у тебя?
	AI_Output(self,other,"DIA_GorNaKosh_WhoYou_01_03");	//Ха! Для начала тебе придется стать одним из нас, и, может, после этого ты будешь удостоен чести носить доспехи Стражей.
	AI_Output(self,other,"DIA_GorNaKosh_WhoYou_01_04");	//И скажу тебе прямо, парень - просто пустой болтовней ты этого точно не добьешься!
	AI_Output(other,self,"DIA_GorNaKosh_WhoYou_01_05");	//А каково это - быть Стражем?
	AI_Output(self,other,"DIA_GorNaKosh_WhoYou_01_06");	//Это как и большая честь, так и огромная ответственность!
	AI_Output(self,other,"DIA_GorNaKosh_WhoYou_01_07");	//Мы сражаемся во имя нашего Братства - и готовы отдать свои жизни за наши идеи, если это потребуется.
	AI_Output(self,other,"DIA_GorNaKosh_WhoYou_01_08");	//Только опытные и сильные духом воины могут вступить на этот путь.
};


instance DIA_GORNAKOSH_WHAT(C_Info)
{
	npc = tpl_8005_gornakosh;
	nr = 1;
	condition = dia_gornakosh_what_condition;
	information = dia_gornakosh_what_info;
	permanent = FALSE;
	description = "Чем ты здесь занимаешься?";
};


func int dia_gornakosh_what_condition()
{
	if((Kapitel < 5) && (PSI_TALK == TRUE) && Npc_KnowsInfo(other,dia_gornakosh_whoyou))
	{
		return TRUE;
	};
};

func void dia_gornakosh_what_info()
{
	AI_Output(other,self,"DIA_GorNaKosh_What_01_00");	//Чем ты здесь занимаешься?
	AI_Output(self,other,"DIA_GorNaKosh_What_01_01");	//(гордо) Я тренирую стражей Братства!
	AI_Output(self,other,"DIA_GorNaKosh_What_01_02");	//В отсутствии нашего наставника - Кор Ангара, теперь эту обязанность в Братстве исполняю я.
	AI_Output(self,other,"DIA_GorNaKosh_What_01_03");	//Но меня не покидает надежда, что когда-нибудь наш учитель вновь вернется к нам.
};


instance DIA_GORNAKOSH_ANGAR(C_Info)
{
	npc = tpl_8005_gornakosh;
	nr = 1;
	condition = dia_gornakosh_angar_condition;
	information = dia_gornakosh_angar_info;
	permanent = FALSE;
	description = "(рассказать о Кор Ангаре)";
};


func int dia_gornakosh_angar_condition()
{
	if((PSI_TALK == TRUE) && (GORNAKOSHKNOWSANGAR == FALSE) && Npc_KnowsInfo(other,dia_gornakosh_what) && Npc_KnowsInfo(other,DIA_AngarDJG_HALLO))
	{
		return TRUE;
	};
};

func void dia_gornakosh_angar_info()
{
	if(ANGARISDEAD == FALSE)
	{
		B_GivePlayerXP(250);
		AI_Output(other,self,"DIA_GorNaKosh_Angar_01_01");	//Кор Ангар жив!
		AI_Output(self,other,"DIA_GorNaKosh_Angar_01_02");	//Откуда тебе это известно?! (непонимающе) Но... 
		AI_Output(other,self,"DIA_GorNaKosh_Angar_01_03");	//Я встретил его в Долине Рудников. С ним все в порядке.
		AI_Output(self,other,"DIA_GorNaKosh_Angar_01_04");	//(радостно) О, это воистину чудесная новость, которой возрадуются все Братья без исключения!
		GORNAKOSHKNOWSANGAR = TRUE;
	}
	else
	{
		B_GivePlayerXP(50);
		AI_Output(other,self,"DIA_GorNaKosh_Angar_01_05");	//Боюсь, у меня плохие новости. Кор Ангар мертв.
		AI_Output(self,other,"DIA_GorNaKosh_Angar_01_06");	//ЧТО?! (гневно) Откуда тебе это известно?
		AI_Output(other,self,"DIA_GorNaKosh_Angar_01_07");	//Он нашел свою судьбу в Долине Рудников. Мне очень жаль.
		AI_Output(self,other,"DIA_GorNaKosh_Angar_01_08");	//О, нет. Как это могло произойти? Нет! Этого не может быть!
		AI_Output(self,other,"DIA_GorNaKosh_Angar_01_10");	//(печально) Это большая утрата для всего Братства. Мы все будем оплакивать смерть нашего лидера и учителя.
		GORNAKOSHKNOWSANGAR = TRUE;
		AI_StopProcessInfos(self);
		B_GorNaKoshEquipWeapon(self);
	};
};


instance DIA_GORNAKOSH_CANBETPL(C_Info)
{
	npc = tpl_8005_gornakosh;
	nr = 1;
	condition = dia_gornakosh_canbetpl_condition;
	information = dia_gornakosh_canbetpl_info;
	permanent = FALSE;
	description = "А ты бы мог принять меня в Стражи Братства?";
};


func int dia_gornakosh_canbetpl_condition()
{
	if((Kapitel < 5) && (PSI_TALK == TRUE) && Npc_KnowsInfo(other,dia_gornakosh_whoyou))
	{
		return TRUE;
	};
};

func void dia_gornakosh_canbetpl_info()
{
	AI_Output(other,self,"DIA_GorNaKosh_CanBeTPL_01_00");	//А ты бы мог принять меня в Стражи Братства?

	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_GorNaKosh_CanBeTPL_01_01");	//Для начала ты должен стать одним из братьев.
		AI_Output(self,other,"DIA_GorNaKosh_CanBeTPL_01_02");	//Поговори с Идолом Ораном - он поможет тебе в этом.
		CANBETPL = TRUE;

		if(MIS_CanDoTempler == FALSE)
		{
			MIS_CanDoTempler = LOG_Running;
			Log_CreateTopic(TOPIC_CanDoTempler,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_CanDoTempler,LOG_Running);
			B_LogEntry(TOPIC_CanDoTempler,"Для того, чтобы вступить в Стражи, необходимо произвести впечатление на Гор На Коша и других наставников Братства.");
		};
	}
	else if(other.guild == GIL_SEK)
	{
		AI_Output(self,other,"DIA_GorNaKosh_CanBeTPL_01_03");	//Я вижу, ты стал одним из наших Братьев. Это хорошо.
		AI_Output(self,other,"DIA_GorNaKosh_CanBeTPL_01_04");	//Ты сделал правильный выбор.
		AI_Output(self,other,"DIA_GorNaKosh_CanBeTPL_01_05");	//Но ты также должен понимать, что быть Стражем - это не просто пустые слова.
		AI_Output(self,other,"DIA_GorNaKosh_CanBeTPL_01_06");	//Только достойные из достойнейших могут войти в наш Круг. Эта огромная честь и, естественно, ее надо заслужить.
		AI_Output(self,other,"DIA_GorNaKosh_CanBeTPL_01_07");	//Поэтому перед тем как просить меня посвятить тебя в круг Стражей - ты должен будешь доказать, что на деле являешься одним из них.
		CANBETPL = TRUE;

		if(MIS_CanDoTempler == FALSE)
		{
			MIS_CanDoTempler = LOG_Running;
			Log_CreateTopic(TOPIC_CanDoTempler,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_CanDoTempler,LOG_Running);
			B_LogEntry(TOPIC_CanDoTempler,"Для того, чтобы вступить в Стражи, необходимо произвести впечатление на Гор На Коша и других наставников Братства.");
		};
	}
	else if(other.guild == GIL_GUR)
	{
		AI_Output(self,other,"DIA_GorNaKosh_CanBeTPL_01_08");	//Ты уже выбрал священный путь Гуру! И вместе с тем определил свою судьбу.
		AI_Output(self,other,"DIA_GorNaKosh_CanBeTPL_01_09");	//Так что ступай смело по нему и не сомневайся в своем выборе.
	}
	else
	{
		AI_Output(self,other,"DIA_GorNaKosh_CanBeTPL_01_10");	//Только тот, кто принадлежит к нашему Братству, может быть удостоен этой чести!
		AI_Output(self,other,"DIA_GorNaKosh_CanBeTPL_01_11");	//Так что не трать мое время попусту, неверный!
		AI_StopProcessInfos(self);
		B_GorNaKoshEquipWeapon(self);
	};
};


instance DIA_GORNAKOSH_TEST(C_Info)
{
	npc = tpl_8005_gornakosh;
	nr = 1;
	condition = dia_gornakosh_test_condition;
	information = dia_gornakosh_test_info;
	permanent = FALSE;
	description = "Как я могу доказать тебе, что достоин стать Стражем?";
};


func int dia_gornakosh_test_condition()
{
	if((CANBETPL == TRUE) && (other.guild == GIL_SEK))
	{
		return TRUE;
	};
};

func void dia_gornakosh_test_info()
{
	AI_Output(other,self,"DIA_GorNaKosh_Test_01_00");	//Как я могу доказать тебе, что достоин стать Стражем?
	AI_Output(self,other,"DIA_GorNaKosh_Test_01_01");	//Видимо, ты хочешь, чтобы я проверил тебя?
	AI_Output(other,self,"DIA_GorNaKosh_Test_01_02");	//Да, испытай меня!
	AI_Output(self,other,"DIA_GorNaKosh_Test_01_04");	//Возможно, у меня и есть одно поручение, как раз подходящее для тебя.
	AI_Output(self,other,"DIA_GorNaKosh_Test_01_08");	//Мне стало доподлинно известно, что где-то в этой части острова сокрыт один могущественный артефакт - Молот Таракота, оружие великого воина древности.
	AI_Output(self,other,"DIA_GorNaKosh_Test_01_09");	//Доселе неизвестно, где точно спрятан этот молот, но если бы Братство завладело этим сокровищем - оно бы только выиграло от этого!
	AI_Output(self,other,"DIA_GorNaKosh_Test_01_10");	//Если ты и вправду хочешь произвести на меня впечатление - принеси мне этот молот.
	AI_Output(self,other,"DIA_GorNaKosh_Test_01_11");	//Правда, я также слышал, что этот артефакт очень хорошо охраняется. Поэтому поиски не обещают быть легкими.
	AI_Output(other,self,"DIA_GorNaKosh_Test_01_17");	//Я постараюсь добыть этот молот для тебя.
	AI_Output(self,other,"DIA_GorNaKosh_Test_01_20");	//Тогда возвращайся ко мне, когда выполнишь мое поручение.
	MIS_TARACOTHAMMER = LOG_Running;
	Log_CreateTopic(TOPIC_TARACOTHAMMER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TARACOTHAMMER,LOG_Running);
	B_LogEntry(TOPIC_TARACOTHAMMER,"Для того, чтобы произвести впечатление на Гор На Коша и получить шанс стать Стражем, я должен принести ему некий могущественный артефакт - Молот Таракота. По словам верховного стража, молот сокрыт где-то в этих краях. Однако Гор На Кош предупредил меня, что сокровище хорошо охраняется, поэтому не стоит рассчитывать на легкую прогулку.");
};


instance DIA_GORNAKOSH_TESTOK(C_Info)
{
	npc = tpl_8005_gornakosh;
	nr = 1;
	condition = dia_gornakosh_testok_condition;
	information = dia_gornakosh_testok_info;
	permanent = FALSE;
	description = "Я принес Молот!";
};

func int dia_gornakosh_testok_condition()
{
	if((MIS_TARACOTHAMMER == LOG_Running) && (Npc_HasItems(other,itmi_taracothammer) >= 1))
	{
		return TRUE;
	};
};

func void dia_gornakosh_testok_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_GorNaKosh_TestOk_01_00");	//Я принес Молот!
	B_GiveInvItems(other,self,itmi_taracothammer,1);
	Npc_RemoveInvItems(self,itmi_taracothammer,Npc_HasItems(self,itmi_taracothammer));
	AI_Output(self,other,"DIA_GorNaKosh_TestOk_01_02");	//Невероятно! Это... это действительно Молот Таракота!
	AI_Output(self,other,"DIA_GorNaKosh_TestOk_01_03");	//Отличная работа! Честно говоря, я и не надеялся на то, что ты справишься с этим заданием.
	AI_Output(self,other,"DIA_GorNaKosh_TestOk_01_06");	//Ну, что же, судя по всему, ты прошел мое испытание и доказал, что обладаешь недюжей смелостью и силой духа. Все это достойно большого уважения!
	AI_Output(self,other,"DIA_GorNaKosh_TestOk_01_07");	//Кроме того, ты еще и оказал неоценимую услугу всему Братству, что также не может не вызывать должного внимания к тебе.
	AI_Output(self,other,"DIA_GorNaKosh_TestOk_01_08");	//Если твои поступки и дальше будут носить столь же плодотворный характер - то вскоре можно будет подумать и о твоем вступлении в ряды Стражей.
	AI_Output(self,other,"DIA_GorNaKosh_TestOk_01_09");	//Нам бы пригодились таки люди, как ты!
	AI_Output(self,other,"DIA_GorNaKosh_TestOk_01_10");	//С моей же стороны, в знак благодарности всего Братства и от меня лично - прими этот скромный дар.
	B_GiveInvItems(self,other,ItPo_Perm_STR,1);
	GORNAKOSHTEST = TRUE;
	MIS_TARACOTHAMMER = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_TARACOTHAMMER,LOG_SUCCESS);
	B_LogEntry(TOPIC_TARACOTHAMMER,"Я прошел испытание Гор На Коша.");
};


instance DIA_GORNAKOSH_READYBETPL(C_Info)
{
	npc = tpl_8005_gornakosh;
	nr = 1;
	condition = dia_gornakosh_readybetpl_condition;
	information = dia_gornakosh_readybetpl_info;
	permanent = TRUE;
	description = "Я хочу присоединиться к Стражам.";
};


func int dia_gornakosh_readybetpl_condition()
{
	if((CANBETPL == TRUE) && (hero.guild == GIL_SEK) && (READYBETPL == FALSE))
	{
		return TRUE;
	};
};

func void dia_gornakosh_readybetpl_info()
{
	AI_Output(other,self,"DIA_GorNaKosh_ReadyBeTPL_01_00");	//Я хочу присоединиться к Стражам.
	AI_Output(self,other,"DIA_GorNaKosh_ReadyBeTPL_01_01");	//Я уже говорил тебе, что одного твоего желания будет маловато для того, чтобы присоединиться к священному кругу Стражей.
	AI_Output(self,other,"DIA_GorNaKosh_ReadyBeTPL_01_02");	//Ты должен доказать, что достоин этой чести!
	AI_Output(self,other,"DIA_GorNaKosh_ReadyBeTPL_01_03");	//А лучшие доказательства - это твои действия и поступки на благо нашего Братства.

	if((CADARAGREED == TRUE) || (CANJOINPSI == TRUE) || (PARVEZAGREED == TRUE) || (GORNAKOSHTEST == TRUE))
	{
		AI_Output(other,self,"DIA_GorNaKosh_ReadyBeTPL_01_04");	//А разве их недостаточно?
		AI_Output(self,other,"DIA_GorNaKosh_ReadyBeTPL_01_05");	//И что же ты сделал?

		if(GORNAKOSHTEST == TRUE)
		{
			AI_Output(other,self,"DIA_GorNaKosh_ReadyBeTPL_01_06");	//Я прошел твое испытание!
			AI_Output(self,other,"DIA_GorNaKosh_ReadyBeTPL_01_07");	//Хммм... Да, ты его действительно прошел.
			AI_Output(self,other,"DIA_GorNaKosh_ReadyBeTPL_01_08");	//Этим ты доказал, что являешься неплохим бойцом и тебе можно поручать выполнение серьезных задач.
			AI_Output(self,other,"DIA_GorNaKosh_ReadyBeTPL_01_09");	//Что еще?
		};
		if(CADARAGREED == TRUE)
		{
			AI_Output(other,self,"DIA_GorNaKosh_ReadyBeTPL_01_10");	//Идол Кадар считает, что моя вера в Братство не может поддаваться сомнению.
			AI_Output(self,other,"DIA_GorNaKosh_ReadyBeTPL_01_13");	//Что еще?
		};
		if(PARVEZAGREED == TRUE)
		{
			AI_Output(other,self,"DIA_GorNaKosh_ReadyBeTPL_01_14");	//Идол Парвез согласен на мое принятие...
		};
		if(CANJOINPSI == TRUE)
		{
			AI_Output(other,self,"DIA_GorNaKosh_ReadyBeTPL_01_19");	//Идол Оран доверяет мне.
			AI_Output(self,other,"DIA_GorNaKosh_ReadyBeTPL_01_21");	//Я вижу - Гуру доверяют тебе! Это говорит мне о многом...
			AI_Output(self,other,"DIA_GorNaKosh_ReadyBeTPL_01_22");	//Что еще?
		};
		if((CADARAGREED == TRUE) && (CANJOINPSI == TRUE) && (PARVEZAGREED == TRUE) && (GORNAKOSHTEST == TRUE))
		{
			B_GivePlayerXP(200);
			AI_Output(other,self,"DIA_GorNaKosh_ReadyBeTPL_01_23");	//Это все!
			AI_Output(self,other,"DIA_GorNaKosh_ReadyBeTPL_01_24");	//Хммм... Хорошо! Ты доказал, что способен на многое.
			AI_Output(self,other,"DIA_GorNaKosh_ReadyBeTPL_01_25");	//И, безусловно, про тебя я могу сказать лишь только одно - нам нужны такие люди!
			AI_Output(self,other,"DIA_GorNaKosh_ReadyBeTPL_01_26");	//Однако ты должен понимать, что став Стражем, ты не сможешь уже просто так отказаться от этого выбора.
			AI_Output(self,other,"DIA_GorNaKosh_ReadyBeTPL_01_27");	//Если ты хочешь посвятить себя божественному пути Гуру - то тогда тебе следует поговорить на эту тему с Идолом Ораном.
			AI_Output(self,other,"DIA_GorNaKosh_ReadyBeTPL_01_28");	//Если же ты все-таки твердо решил вступить на путь Стража - то я без колебаний готов принять тебя в наш священный Круг.
			AI_Output(self,other,"DIA_GorNaKosh_ReadyBeTPL_01_29");	//В любом случае выбор за тобой...
			AI_Output(self,other,"DIA_GorNaKosh_ReadyBeTPL_01_30");	//...но ты должен целиком и полностью осознавать его - и только после этого принять свое окончательное решение.
			AI_Output(self,other,"DIA_GorNaKosh_ReadyBeTPL_01_31");	//Подумай хорошенько о том, что я тебе сказал.
			READYBETPL = TRUE;

			if(MIS_CanDoTempler == LOG_Running)
			{
				B_LogEntry(TOPIC_CanDoTempler,"Гор На Кош готов принять меня в Круг стражей Братства.");
			};
		}
		else
		{
			AI_Output(other,self,"DIA_GorNaKosh_ReadyBeTPL_01_33");	//Это все.
			AI_Output(self,other,"DIA_GorNaKosh_ReadyBeTPL_01_34");	//Хммм...(задумался) Извини, но этого мало.
			AI_Output(self,other,"DIA_GorNaKosh_ReadyBeTPL_01_35");	//Твои деяния перед Братством велики, но их недостаточно для того, чтобы я принял тебя в священный круг Стражей!
			AI_Output(self,other,"DIA_GorNaKosh_ReadyBeTPL_01_37");	//Продолжай в том же духе - и вскоре ты будешь удостоен чести примерить доспех Стража!
		};
	}
	else
	{
		AI_Output(self,other,"DIA_GorNaKosh_ReadyBeTPL_01_38");	//Поэтому поговорим о твоем вступлении позже, когда на то будут веские причины.
	};
};

var int TplNeedTwoH;
var int TplNeedStr;

instance DIA_GORNAKOSH_BETPL(C_Info)
{
	npc = tpl_8005_gornakosh;
	nr = 1;
	condition = dia_gornakosh_betpl_condition;
	information = dia_gornakosh_betpl_info;
	permanent = TRUE;
	description = "Прими меня в священный круг Стражей.";
};


func int dia_gornakosh_betpl_condition()
{
	if((READYBETPL == TRUE) && (hero.guild == GIL_SEK))
	{
		return TRUE;
	};
};

func void dia_gornakosh_betpl_info()
{
	if((other.HitChance[NPC_TALENT_2H] >= 30) && (other.attribute[ATR_STRENGTH] >= 50))
	{
		Snd_Play("GUILD_INV");
		hero.guild = GIL_TPL;
		CheckHeroGuild[0] = TRUE;
		AI_Output(other,self,"DIA_GorNaKosh_BeTPL_01_00");	//Прими меня в священный круг Стражей.
		AI_Output(self,other,"DIA_GorNaKosh_BeTPL_01_01");	//Да будет так!
		AI_Output(self,other,"DIA_GorNaKosh_BeTPL_01_02");	//Я посвящаю тебя в Стражи Братства - отныне ты один из нас!
		AI_Output(self,other,"DIA_GorNaKosh_BeTPL_01_03");	//Вот - возьми этот доспех.
		CreateInvItems(self,itar_tpl_lst,1);
		B_GiveInvItems(self,other,itar_tpl_lst,1);
		AI_Output(self,other,"DIA_GorNaKosh_BeTPL_01_04");	//Носи его с гордостью. Лишь немногие удостаивались такой чести!
		AI_Output(self,other,"DIA_GorNaKosh_BeTPL_01_05");	//Также прими от меня этот меч - символ нашего священного Круга.
		CreateInvItems(self,itmw_zweihaender6,1);
		B_GiveInvItems(self,other,itmw_zweihaender6,1);
		AI_Output(self,other,"DIA_GorNaKosh_BeTPL_01_06");	//Он поможет тебе одолеть твоих врагов!
		AI_Output(self,other,"DIA_GorNaKosh_BeTPL_01_07");	//И не забудь, что быть Стражем - это не только носить их доспехи...
		AI_Output(self,other,"DIA_GorNaKosh_BeTPL_01_08");	//...это означает целиком и полностью посвятить себя служению Братству и его целям!
		AI_Output(self,other,"DIA_GorNaKosh_BeTPL_01_09");	//Мы находим применение и физической, и духовной силе. Лишь те, чье тело и дух представляют единое целое, могут считаться истинными Стражами.
		AI_Output(self,other,"DIA_GorNaKosh_BeTPL_01_11");	//И запомни: невозмутимый дух и тренированное тело помогут тебе выстоять против любого врага.
		MIS_CanDoTempler = LOG_Success;
		Log_SetTopicStatus(TOPIC_CanDoTempler,LOG_Success);
		B_LogEntry(TOPIC_CanDoTempler,"Гор На Кош принял меня в Стражи.");
	}
	else if(other.attribute[ATR_STRENGTH] < 50)
	{
		AI_Output(self,other,"DIA_GorNaKosh_BeTPL_01_12");	//Твоей силы не хватит поднять двуручник и одеть броню.

		if((MIS_CanDoTempler == LOG_Running) && (TplNeedStr == FALSE))
		{
			B_LogEntry(TOPIC_CanDoTempler,"Гор На Кош считает, что я пока слабоват для вступления в Стражи. (требуемая сила: 50 и более)");
			TplNeedStr = TRUE;
		};
	}
	else if(other.HitChance[NPC_TALENT_2H] < 30)
	{
		AI_Output(self,other,"DIA_GorNaKosh_BeTPL_01_13");	//Твои навыки владения двуручным оружием недостаточны.

		if((MIS_CanDoTempler == LOG_Running) && (TplNeedTwoH == FALSE))
		{
			B_LogEntry(TOPIC_CanDoTempler,"Гор На Кош считает, что пока я не достаточно хорошо обращаюсь с двуручным оружием, чтобы стать Стражем. (требуемый навык владения двуручным оружием: 30 и более)");
			TplNeedTwoH = TRUE;
		};
	};
};

var int GorNaKosh_Trade_OneTime;
var int TPLSword2;
var int TPLSword3;
var int TPLSword4;

instance DIA_GorNaKosh_TRADE(C_Info)
{
	npc = tpl_8005_gornakosh;
	nr = 700;
	condition = DIA_GorNaKosh_TRADE_Condition;
	information = DIA_GorNaKosh_TRADE_Info;
	permanent = TRUE;
	description = "Какое еще оружие ты можешь мне предложить?";
	trade = TRUE;
};

func int DIA_GorNaKosh_TRADE_Condition()
{
	if((hero.guild == GIL_TPL) && Wld_IsTime(8,0,21,30))
	{
		return TRUE;
	};
};

func void DIA_GorNaKosh_TRADE_Info()
{
	AI_Output(other,self,"DIA_GorNaKosh_TRADE_15_00");	//Какое еще оружие ты можешь мне предложить?

	if((GorNaKosh_Trade_OneTime == FALSE) && (hero.guild == GIL_TPL))
	{
		AI_Output(self,other,"DIA_GorNaKosh_TRADE_11_01");	//Поскольку ты теперь один из нас, я могу продать тебе самое лучшее оружие, которое только могут носить Стражи.
		AI_Output(self,other,"DIA_GorNaKosh_TRADE_11_02");	//Но за него, естественно, придется заплатить.
		CreateInvItems(self,ITMW_TAMPLIER_SPECIAL_2H_SWORD_1,1);
		GorNaKosh_Trade_OneTime = TRUE;
	};
	if((Kapitel >= 2) && (TPLSword2 == FALSE))
	{
		CreateInvItems(self,ITMW_TAMPLIER_SPECIAL_2H_SWORD_2,1);
		TPLSword2 = TRUE;
	};
	if((Kapitel >= 3) && (TPLSword3 == FALSE))
	{
		CreateInvItems(self,ITMW_TAMPLIER_SPECIAL_2H_SWORD_3,1);
		TPLSword3 = TRUE;
	};
	if((Kapitel >= 4) && (TPLSword4 == FALSE))
	{
		CreateInvItems(self,ITMW_TAMPLIER_SPECIAL_2H_SWORD_4,1);
		TPLSword4 = TRUE;
	};
	if((TplBelt_01 == FALSE) && (hero.guild == GIL_TPL))
	{
		CreateInvItems(self,ItBE_Addon_TPL_01,1);
		TplBelt_01 = TRUE;
	};

	B_GiveTradeInv(self);
	AI_UnequipWeapons(self);

	if(Npc_HasItems(self,ITMW_ZWEIHAENDER_GORNAKOSH) >= 1)
	{
		Npc_RemoveInvItems(self,ITMW_ZWEIHAENDER_GORNAKOSH,Npc_HasItems(self,ITMW_ZWEIHAENDER_GORNAKOSH));
	};

	CheckTadeNaKosh = TRUE;
};

instance DIA_GORNAKOSH_ABWEISEND(C_Info)
{
	npc = tpl_8005_gornakosh;
	nr = 1;
	condition = dia_gornakosh_abweisend_condition;
	information = dia_gornakosh_abweisend_info;
	permanent = TRUE;
	description = "Ты можешь чему-нибудь научить меня?";
};

func int dia_gornakosh_abweisend_condition()
{
	if((other.guild != GIL_SEK) && (other.guild != GIL_GUR) && (other.guild != GIL_TPL) && Npc_KnowsInfo(other,dia_gornakosh_what))
	{
		return TRUE;
	};
};

func void dia_gornakosh_abweisend_info()
{
	AI_Output(other,self,"DIA_GorNaKosh_Abweisend_01_00");	//Ты можешь чему-нибудь научить меня?
	AI_Output(self,other,"DIA_GorNaKosh_Abweisend_01_01");	//Убирайся с глаз, неверный!
	AI_StopProcessInfos(self);
	B_GorNaKoshEquipWeapon(self);
};


instance DIA_GORNAKOSH_ABWEISENDTWO(C_Info)
{
	npc = tpl_8005_gornakosh;
	nr = 1;
	condition = dia_gornakosh_abweisendtwo_condition;
	information = dia_gornakosh_abweisendtwo_info;
	permanent = TRUE;
	description = "Ты можешь чему-нибудь научить меня?";
};


func int dia_gornakosh_abweisendtwo_condition()
{
	if(Npc_KnowsInfo(other,dia_gornakosh_what) && (GORNAKOSHTEACH == FALSE) && ((other.guild == GIL_SEK) || (other.guild == GIL_GUR) || (other.guild == GIL_TPL)))
	{
		return TRUE;
	};
};

func void dia_gornakosh_abweisendtwo_info()
{
	AI_Output(other,self,"DIA_GorNaKosh_AbweisendTwo_01_00");	//Ты можешь чему-нибудь научить меня?
	if(other.guild == GIL_SEK)
	{
		AI_Output(self,other,"DIA_GorNaKosh_AbweisendTwo_01_01");	//Я учу только Стражей, послушник.
		AI_Output(self,other,"DIA_GorNaKosh_AbweisendTwo_01_02");	//Так что не трать мое время попусту.
	}
	else if(other.guild == GIL_GUR)
	{
		AI_Output(self,other,"DIA_GorNaKosh_AbweisendTwo_01_03");	//Я обучаю только Стражей, господин.
		AI_Output(self,other,"DIA_GorNaKosh_AbweisendTwo_01_04");	//Обучением Гуру занимаются Идолы Братства.
	}
	else
	{
		AI_Output(self,other,"DIA_GorNaKosh_AbweisendTwo_01_05");	//Поскольку ты входишь в священный круг Стражей Братства - я готов заняться твоим обучением.
		AI_Output(self,other,"DIA_GorNaKosh_AbweisendTwo_01_06");	//Я могу научить тебя сражаться одноручным и двуручным оружием, а также помогу тебе повысить твою силу и ловкость.
		AI_Output(self,other,"DIA_GorNaKosh_AbweisendTwo_01_07");	//Кроме этого, Гор На Тоф сможет обучить тебя использованию боевых рун Стражей, а Гор На Вид покажет тебе, как обращаться со стрелковым оружием - если ты предпочитаешь дальний бой ближнему.
		Log_CreateTopic(TOPIC_ADDON_TPLTEACHER,LOG_NOTE);
		B_LogEntry(TOPIC_ADDON_TPLTEACHER,"Гор На Кош научит меня сражаться одноручным и двуручным оружием, а также поможет мне увеличить мои навыки силы и ловкости.");
		GORNAKOSHTEACH = TRUE;
	};
};


instance DIA_GORNAKOSH_TEACH(C_Info)
{
	npc = tpl_8005_gornakosh;
	nr = 10;
	condition = dia_gornakosh_teach_condition;
	information = dia_gornakosh_teach_info;
	permanent = TRUE;
	description = "Я нуждаюсь в тренировке.";
};

func int dia_gornakosh_teach_condition()
{
	if(GORNAKOSHTEACH == TRUE)
	{
		return TRUE;
	};
};

func void dia_gornakosh_teach_info()
{
	AI_Output(other,self,"DIA_GorNaKosh_Teach_15_00");	//Я нуждаюсь в тренировке.
	AI_Output(self,other,"DIA_GorNaKosh_Teach_04_01");	//Что точно ты хочешь тренировать?
	Info_ClearChoices(dia_gornakosh_teach);
	Info_AddChoice(dia_gornakosh_teach,Dialog_Back,dia_gornakosh_teach_back);
	Info_AddChoice(dia_gornakosh_teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_gornakosh_teach_2h_1);
	Info_AddChoice(dia_gornakosh_teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_gornakosh_teach_2h_5);
	Info_AddChoice(dia_gornakosh_teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_gornakosh_teach_1h_1);
	Info_AddChoice(dia_gornakosh_teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_gornakosh_teach_1h_5);
};

func void dia_gornakosh_teach_1h_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,60))
	{
		AI_Output(self,other,"DIA_GorNaKosh_Teach_1H_1_04_00");	//Твоя оборона еще ни куда не годится, но когда-нибудь ты станешь настоящим мастером.
	};
	Info_ClearChoices(dia_gornakosh_teach);
	Info_AddChoice(dia_gornakosh_teach,Dialog_Back,dia_gornakosh_teach_back);
	Info_AddChoice(dia_gornakosh_teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_gornakosh_teach_2h_1);
	Info_AddChoice(dia_gornakosh_teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_gornakosh_teach_2h_5);
	Info_AddChoice(dia_gornakosh_teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_gornakosh_teach_1h_1);
	Info_AddChoice(dia_gornakosh_teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_gornakosh_teach_1h_5);
};

func void dia_gornakosh_teach_1h_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,60))
	{
		AI_Output(self,other,"DIA_GorNaKosh_Teach_1H_5_04_00");	//Твое запястье еще очень негнущееся. Оружие ты должен держать свободно.
	};
	Info_ClearChoices(dia_gornakosh_teach);
	Info_AddChoice(dia_gornakosh_teach,Dialog_Back,dia_gornakosh_teach_back);
	Info_AddChoice(dia_gornakosh_teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_gornakosh_teach_2h_1);
	Info_AddChoice(dia_gornakosh_teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_gornakosh_teach_2h_5);
	Info_AddChoice(dia_gornakosh_teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_gornakosh_teach_1h_1);
	Info_AddChoice(dia_gornakosh_teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_gornakosh_teach_1h_5);
};

func void dia_gornakosh_teach_2h_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,100))
	{
		AI_Output(self,other,"DIA_GorNaKosh_Teach_2H_1_04_00");	//Думай всегда о том, что бросок идет от бедра, не от запястья.
	};
	Info_ClearChoices(dia_gornakosh_teach);
	Info_AddChoice(dia_gornakosh_teach,Dialog_Back,dia_gornakosh_teach_back);
	Info_AddChoice(dia_gornakosh_teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_gornakosh_teach_2h_1);
	Info_AddChoice(dia_gornakosh_teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_gornakosh_teach_2h_5);
	Info_AddChoice(dia_gornakosh_teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_gornakosh_teach_1h_1);
	Info_AddChoice(dia_gornakosh_teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_gornakosh_teach_1h_5);
};

func void dia_gornakosh_teach_2h_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,100))
	{
		AI_Output(self,other,"DIA_GorNaKosh_Teach_2H_5_04_00");	//Самый сильный удар бесполезен, если он идет в пустоту. Так что используй свою силу обдуманно.
	};
	Info_ClearChoices(dia_gornakosh_teach);
	Info_AddChoice(dia_gornakosh_teach,Dialog_Back,dia_gornakosh_teach_back);
	Info_AddChoice(dia_gornakosh_teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_gornakosh_teach_2h_1);
	Info_AddChoice(dia_gornakosh_teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_gornakosh_teach_2h_5);
	Info_AddChoice(dia_gornakosh_teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_gornakosh_teach_1h_1);
	Info_AddChoice(dia_gornakosh_teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_gornakosh_teach_1h_5);
};

func void dia_gornakosh_teach_back()
{
	Info_ClearChoices(dia_gornakosh_teach);
};


var int gornakosh_merke_str;
var int gornakosh_merke_dex;

instance DIA_GORNAKOSH_TEACHATT(C_Info)
{
	npc = tpl_8005_gornakosh;
	nr = 150;
	condition = dia_gornakosh_teachatt_condition;
	information = dia_gornakosh_teachatt_info;
	permanent = TRUE;
	description = "Я хочу увеличить свои навыки.";
};

func int dia_gornakosh_teachatt_condition()
{
	if(GORNAKOSHTEACH == TRUE)
	{
		return TRUE;
	};
};

func void dia_gornakosh_teachatt_info()
{
	AI_Output(other,self,"DIA_GorNaKosh_TeachATT_15_00");	//Я хочу увеличить свои навыки.
	GORNAKOSH_MERKE_STR = other.attribute[ATR_STRENGTH];
	GORNAKOSH_MERKE_DEX = other.attribute[ATR_DEXTERITY];
	Info_ClearChoices(dia_gornakosh_teachatt);
	Info_AddChoice(dia_gornakosh_teachatt,Dialog_Back,dia_gornakosh_teachatt_back);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_gornakosh_teachatt_stamina_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_gornakosh_teachatt_stamina_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_gornakosh_teachatt_hp_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_gornakosh_teachatt_hp_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_gornakosh_teachatt_dex_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_gornakosh_teachatt_dex_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),dia_gornakosh_teachatt_str_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),dia_gornakosh_teachatt_str_5);

	if((Kapitel >= 2) && (VATRAS_TEACHREGENSTAM == FALSE) && (other.guild == GIL_TPL)) 
	{
		Info_AddChoice(DIA_GorNaKosh_TeachATT,"Регенерация выносливости (Очки обучения: 15, Цена: 5000 монет)",DIA_GorNaKosh_TeachATT_RegenStam);
	};
};

func void dia_gornakosh_teachatt_back()
{
	if((GORNAKOSH_MERKE_STR < other.attribute[ATR_STRENGTH]) || (GORNAKOSH_MERKE_DEX < other.attribute[ATR_DEXTERITY]))
	{
		AI_Output(self,other,"DIA_GorNaKosh_TeachATT_Back_01_00");	//Хорошо! Теперь ты можешь использовать свои способности с большим успехом!
	};

	Info_ClearChoices(dia_gornakosh_teachatt);
};

func void DIA_GorNaKosh_TeachATT_RegenStam()
{
	var int kosten;
	var int money;

	AI_Output(other,self,"DIA_Vatras_Teach_regen_15_03");	//Научи меня ускоренному восстановлению выносливости.

	kosten = 15;
	money = 5000;

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		AI_StopProcessInfos(self);
		B_GorNaKoshEquipWeapon(self);
	};
	if(Npc_HasItems(other,ItMi_Gold) < money)
	{
		AI_Print(Print_NotEnoughGold);
		AI_StopProcessInfos(self);
		B_GorNaKoshEquipWeapon(self);
	};
	if((hero.lp >= kosten) && (Npc_HasItems(other,ItMi_Gold) >= money))
	{
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + kosten;
		Npc_RemoveInvItems(other,ItMi_Gold,money);
		AI_Print("Обучение: Ускоренная регенерация выносливости");
		VATRAS_TEACHREGENSTAM = TRUE;
		Snd_Play("LevelUP");
	};

	Info_ClearChoices(dia_gornakosh_teachatt);
	Info_AddChoice(dia_gornakosh_teachatt,Dialog_Back,dia_gornakosh_teachatt_back);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_gornakosh_teachatt_stamina_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_gornakosh_teachatt_stamina_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_gornakosh_teachatt_hp_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_gornakosh_teachatt_hp_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_gornakosh_teachatt_dex_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_gornakosh_teachatt_dex_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),dia_gornakosh_teachatt_str_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),dia_gornakosh_teachatt_str_5);
};

func void dia_gornakosh_teachatt_str_1()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_MEGA);
	Info_ClearChoices(dia_gornakosh_teachatt);
	Info_AddChoice(dia_gornakosh_teachatt,Dialog_Back,dia_gornakosh_teachatt_back);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_gornakosh_teachatt_stamina_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_gornakosh_teachatt_stamina_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_gornakosh_teachatt_hp_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_gornakosh_teachatt_hp_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_gornakosh_teachatt_dex_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_gornakosh_teachatt_dex_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),dia_gornakosh_teachatt_str_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),dia_gornakosh_teachatt_str_5);

	if((Kapitel >= 2) && (VATRAS_TEACHREGENSTAM == FALSE) && (other.guild == GIL_TPL)) 
	{
		Info_AddChoice(DIA_GorNaKosh_TeachATT,"Регенерация выносливости (Очки обучения: 15, Цена: 5000 монет)",DIA_GorNaKosh_TeachATT_RegenStam);
	};
};

func void dia_gornakosh_teachatt_str_5()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_MEGA);
	Info_ClearChoices(dia_gornakosh_teachatt);
	Info_AddChoice(dia_gornakosh_teachatt,Dialog_Back,dia_gornakosh_teachatt_back);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_gornakosh_teachatt_stamina_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_gornakosh_teachatt_stamina_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_gornakosh_teachatt_hp_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_gornakosh_teachatt_hp_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_gornakosh_teachatt_dex_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_gornakosh_teachatt_dex_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),dia_gornakosh_teachatt_str_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),dia_gornakosh_teachatt_str_5);

	if((Kapitel >= 2) && (VATRAS_TEACHREGENSTAM == FALSE) && (other.guild == GIL_TPL)) 
	{
		Info_AddChoice(DIA_GorNaKosh_TeachATT,"Регенерация выносливости (Очки обучения: 15, Цена: 5000 монет)",DIA_GorNaKosh_TeachATT_RegenStam);
	};
};

func void dia_gornakosh_teachatt_dex_1()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,T_MAX);
	Info_ClearChoices(dia_gornakosh_teachatt);
	Info_AddChoice(dia_gornakosh_teachatt,Dialog_Back,dia_gornakosh_teachatt_back);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_gornakosh_teachatt_stamina_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_gornakosh_teachatt_stamina_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_gornakosh_teachatt_hp_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_gornakosh_teachatt_hp_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_gornakosh_teachatt_dex_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_gornakosh_teachatt_dex_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),dia_gornakosh_teachatt_str_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),dia_gornakosh_teachatt_str_5);

	if((Kapitel >= 2) && (VATRAS_TEACHREGENSTAM == FALSE) && (other.guild == GIL_TPL)) 
	{
		Info_AddChoice(DIA_GorNaKosh_TeachATT,"Регенерация выносливости (Очки обучения: 15, Цена: 5000 монет)",DIA_GorNaKosh_TeachATT_RegenStam);
	};
};

func void dia_gornakosh_teachatt_dex_5()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,T_MAX);
	Info_ClearChoices(dia_gornakosh_teachatt);
	Info_AddChoice(dia_gornakosh_teachatt,Dialog_Back,dia_gornakosh_teachatt_back);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_gornakosh_teachatt_stamina_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_gornakosh_teachatt_stamina_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_gornakosh_teachatt_hp_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_gornakosh_teachatt_hp_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_gornakosh_teachatt_dex_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_gornakosh_teachatt_dex_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),dia_gornakosh_teachatt_str_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),dia_gornakosh_teachatt_str_5);

	if((Kapitel >= 2) && (VATRAS_TEACHREGENSTAM == FALSE) && (other.guild == GIL_TPL)) 
	{
		Info_AddChoice(DIA_GorNaKosh_TeachATT,"Регенерация выносливости (Очки обучения: 15, Цена: 5000 монет)",DIA_GorNaKosh_TeachATT_RegenStam);
	};
};

func void dia_gornakosh_teachatt_stamina_1()
{
	b_teachstamina(self,other,NPC_TALENT_STAMINA,1);
	Info_ClearChoices(dia_gornakosh_teachatt);
	Info_AddChoice(dia_gornakosh_teachatt,Dialog_Back,dia_gornakosh_teachatt_back);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_gornakosh_teachatt_stamina_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_gornakosh_teachatt_stamina_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_gornakosh_teachatt_hp_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_gornakosh_teachatt_hp_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_gornakosh_teachatt_dex_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_gornakosh_teachatt_dex_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),dia_gornakosh_teachatt_str_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),dia_gornakosh_teachatt_str_5);

	if((Kapitel >= 2) && (VATRAS_TEACHREGENSTAM == FALSE) && (other.guild == GIL_TPL)) 
	{
		Info_AddChoice(DIA_GorNaKosh_TeachATT,"Регенерация выносливости (Очки обучения: 15, Цена: 5000 монет)",DIA_GorNaKosh_TeachATT_RegenStam);
	};
};

func void dia_gornakosh_teachatt_stamina_5()
{
	b_teachstamina(self,other,NPC_TALENT_STAMINA,5);
	Info_ClearChoices(dia_gornakosh_teachatt);
	Info_AddChoice(dia_gornakosh_teachatt,Dialog_Back,dia_gornakosh_teachatt_back);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_gornakosh_teachatt_stamina_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_gornakosh_teachatt_stamina_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_gornakosh_teachatt_hp_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_gornakosh_teachatt_hp_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_gornakosh_teachatt_dex_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_gornakosh_teachatt_dex_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),dia_gornakosh_teachatt_str_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),dia_gornakosh_teachatt_str_5);

	if((Kapitel >= 2) && (VATRAS_TEACHREGENSTAM == FALSE) && (other.guild == GIL_TPL)) 
	{
		Info_AddChoice(DIA_GorNaKosh_TeachATT,"Регенерация выносливости (Очки обучения: 15, Цена: 5000 монет)",DIA_GorNaKosh_TeachATT_RegenStam);
	};
};

func void dia_gornakosh_teachatt_hp_1()
{
	b_teachattributepointshitpoints(self,other,ATR_HITPOINTS_MAX,1,T_MAX_HP);
	Info_ClearChoices(dia_gornakosh_teachatt);
	Info_AddChoice(dia_gornakosh_teachatt,Dialog_Back,dia_gornakosh_teachatt_back);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_gornakosh_teachatt_stamina_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_gornakosh_teachatt_stamina_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_gornakosh_teachatt_hp_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_gornakosh_teachatt_hp_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_gornakosh_teachatt_dex_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_gornakosh_teachatt_dex_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),dia_gornakosh_teachatt_str_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),dia_gornakosh_teachatt_str_5);

	if((Kapitel >= 2) && (VATRAS_TEACHREGENSTAM == FALSE) && (other.guild == GIL_TPL)) 
	{
		Info_AddChoice(DIA_GorNaKosh_TeachATT,"Регенерация выносливости (Очки обучения: 15, Цена: 5000 монет)",DIA_GorNaKosh_TeachATT_RegenStam);
	};
};

func void dia_gornakosh_teachatt_hp_5()
{
	b_teachattributepointshitpoints(self,other,ATR_HITPOINTS_MAX,5,T_MAX_HP);
	Info_ClearChoices(dia_gornakosh_teachatt);
	Info_AddChoice(dia_gornakosh_teachatt,Dialog_Back,dia_gornakosh_teachatt_back);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforstamina(PRINT_LEARNSTMN1,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1)),dia_gornakosh_teachatt_stamina_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforstamina(PRINT_LEARNSTMN5,B_GetLearnCostTalent(other,NPC_TALENT_STAMINA,1) * 5),dia_gornakosh_teachatt_stamina_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_gornakosh_teachatt_hp_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_gornakosh_teachatt_hp_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_gornakosh_teachatt_dex_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_gornakosh_teachatt_dex_5);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),dia_gornakosh_teachatt_str_1);
	Info_AddChoice(dia_gornakosh_teachatt,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),dia_gornakosh_teachatt_str_5);

	if((Kapitel >= 2) && (VATRAS_TEACHREGENSTAM == FALSE) && (other.guild == GIL_TPL)) 
	{
		Info_AddChoice(DIA_GorNaKosh_TeachATT,"Регенерация выносливости (Очки обучения: 15, Цена: 5000 монет)",DIA_GorNaKosh_TeachATT_RegenStam);
	};
};


instance DIA_GORNAKOSH_ADVANTAGE(C_Info)
{
	npc = tpl_8005_gornakosh;
	nr = 5;
	condition = dia_gornakosh_advantage_condition;
	information = dia_gornakosh_advantage_info;
	permanent = FALSE;
	description = "Каковы преимущества двуручного оружия?";
};


func int dia_gornakosh_advantage_condition()
{
	if(GORNAKOSHTEACH == TRUE)
	{
		return TRUE;
	};
};

func void dia_gornakosh_advantage_info()
{
	AI_Output(other,self,"DIA_GorNaKosh_Advantage_15_00");	//Каковы преимущества двуручного оружия?
	AI_Output(self,other,"DIA_GorNaKosh_Advantage_04_01");	//Все очень просто. С одноручным мечом ты быстрее. В битве это может сыграть решающую роль.
	AI_Output(self,other,"DIA_GorNaKosh_Advantage_04_02");	//С двуручным мечом все наоборот. Ты должен быть внимательней, но сможешь нанести больше вреда, чем одноручным мечом.
};


instance DIA_GORNAKOSH_HOWTOBEGIN(C_Info)
{
	npc = tpl_8005_gornakosh;
	nr = 6;
	condition = dia_gornakosh_howtobegin_condition;
	information = dia_gornakosh_howtobegin_info;
	permanent = FALSE;
	description = "С чего мне лучше начать? С одноручного или двуручного оружия?";
};


func int dia_gornakosh_howtobegin_condition()
{
	if(Npc_KnowsInfo(other,dia_gornakosh_advantage))
	{
		return TRUE;
	};
};

func void dia_gornakosh_howtobegin_info()
{
	AI_Output(other,self,"DIA_GorNaKosh_HowToBegin_15_00");	//С чего мне лучше начать? С одноручного или двуручного оружия?
	AI_Output(self,other,"DIA_GorNaKosh_HowToBegin_04_01");	//Можешь начинать как тебе удобно.
	AI_Output(self,other,"DIA_GorNaKosh_HowToBegin_04_02");	//Если ты научишься владеть только одним видом оружия, ничего страшного, остальное приложится.
	AI_Output(self,other,"DIA_GorNaKosh_HowToBegin_04_03");	//Если ты, например, хорошо владеешь одноручным мечом, но плохо двуручным...
	AI_Output(self,other,"DIA_GorNaKosh_HowToBegin_04_04");	//... все выпады, какие ты освоишь с одноручным мечом, улучшат и твое умение биться двуручным мечом.
	AI_Output(self,other,"DIA_GorNaKosh_HowToBegin_04_05");	//Если ты будешь учиться владеть обоими видами оружия, тренировки будут исключительно жесткие.
	AI_Output(self,other,"DIA_GorNaKosh_HowToBegin_04_06");	//Просто начни, потом поймешь, о чем я говорил.
};

var int BuyTemplerHeavy;
var int BuyTemplerMed;
var int BuyTemplerLight;

instance TPL_8005_GORNAKOSH_ARMOR(C_Info)
{
	npc = tpl_8005_gornakosh;
	condition = tpl_8005_gornakosh_armor_condition;
	information = tpl_8005_gornakosh_armor_info;
	permanent = TRUE;
	description = "Мне нужны доспехи получше.";
};


func int tpl_8005_gornakosh_armor_condition()
{
	if((hero.guild == GIL_TPL) && (TAKETPLBESTARMOR == FALSE))
	{
		return TRUE;
	};
};

func void tpl_8005_gornakosh_armor_info()
{
	var C_Item itm;
	itm = Npc_GetEquippedArmor(other);
	AI_Output(other,self,"TPL_8005_GorNaKosh_ARMOR_01_00");	//Я хочу доспехи получше.
	AI_Output(self,other,"TPL_8005_GorNaKosh_ARMOR_01_01");	//У меня есть хорошие доспехи, но тебе придется внести щедрое пожертвование на нужды Братства.
	Info_ClearChoices(tpl_8005_gornakosh_armor);
	Info_AddChoice(tpl_8005_gornakosh_armor,Dialog_Back,tpl_8005_gornakosh_armor_back);

	if(BuyTemplerHeavy == FALSE)
	{
		Info_AddChoice(tpl_8005_gornakosh_armor,"Тяжелые доспехи Стража (Цена: 14000 монет)",tpl_8005_gornakosh_armor_h);
	};
	if(BuyTemplerMed == FALSE)
	{
		Info_AddChoice(tpl_8005_gornakosh_armor,"Доспехи Стража (Цена: 9500 монет)",tpl_8005_gornakosh_armor_m);
	};
	if(BuyTemplerLight == FALSE)
	{
		Info_AddChoice(tpl_8005_gornakosh_armor,"Легкие доспехи Стража (Цена: 1500 монет)",tpl_8005_gornakosh_armor_l);
	};
};

func void tpl_8005_gornakosh_armor_m()
{
	AI_Output(hero,self,"TPL_8005_GorNaKosh_ARMOR_M_01_00");	//Мне нужны средние доспехи Стража.

	if(Npc_HasItems(hero,ItMi_Gold) < VALUE_ITAR_TPL_M)
	{
		AI_Output(self,hero,"TPL_8005_GorNaKosh_ARMOR_M_01_02");	//Как только у тебя появится возможность внести пожертвование на нужды Братства, ты получишь новые доспехи.
	}
	else if((Kapitel >= 2) && (FORTUNOBACK == TRUE) && (MIS_KORANGAR == LOG_SUCCESS))
	{
		AI_Output(self,hero,"TPL_8005_GorNaKosh_ARMOR_M_01_03");	//Теперь, когда ты можешь внести пожертвование, ты получишь новые доспехи.
		B_GiveInvItems(hero,self,ItMi_Gold,VALUE_ITAR_TPL_M);
		CreateInvItems(hero,itar_tpl_m,1);
		Npc_RemoveInvItems(self,ItMi_Gold,VALUE_ITAR_TPL_M);
		BuyTemplerMed = TRUE;
	}
	else
	{
		AI_Output(self,hero,"TPL_8005_GorNaKosh_ARMOR_M_01_01");	//Для этого у тебя еще недостаточно опыта. Покажи себя достойным Стражем, и ты заслужишь право носить лучшие доспехи.
	};
	Info_ClearChoices(tpl_8005_gornakosh_armor);
};

func void tpl_8005_gornakosh_armor_h()
{
	AI_Output(hero,self,"TPL_8005_GorNaKosh_ARMOR_H_01_00");	//Мне нужны тяжелые доспехи Стража.

	if(Kapitel < 4)
	{
		AI_Output(self,hero,"TPL_8005_GorNaKosh_ARMOR_H_01_01");	//Для этого у тебя еще недостаточно опыта. Прояви себя достойным членом нашего Братства, и ты заслужишь право носить столь совершенные доспехи.
	}
	else if(Npc_HasItems(hero,ItMi_Gold) < VALUE_ITAR_TPL_S)
	{
		AI_Output(self,hero,"TPL_8005_GorNaKosh_ARMOR_H_01_02");	//Как только у тебя появится возможность внести пожертвование на нужды Братства, ты получишь новые доспехи.
	}
	else
	{
		AI_Output(self,hero,"TPL_8005_GorNaKosh_ARMOR_H_01_03");	//Теперь ты будешь носить эти доспехи в знак высочайшей чести, оказанной тебе Братством.
		B_GiveInvItems(hero,self,ItMi_Gold,VALUE_ITAR_TPL_S);
		CreateInvItems(hero,itar_tpl_s,1);
		Npc_RemoveInvItems(self,ItMi_Gold,VALUE_ITAR_TPL_S);
		TAKETPLBESTARMOR = TRUE;
		BuyTemplerHeavy = TRUE;
	};
	Info_ClearChoices(tpl_8005_gornakosh_armor);
};

func void tpl_8005_gornakosh_armor_l()
{
	AI_Output(hero,self,"TPL_8005_GorNaKosh_ARMOR_L_01_00");	//Мне нужны легкие доспехи Стража.

	if(Npc_HasItems(hero,ItMi_Gold) < VALUE_ITAR_TPL_L)
	{
		AI_Output(self,hero,"TPL_8005_GorNaKosh_ARMOR_L_01_02");	//Как только у тебя появится возможность внести пожертвование на нужды Братства, ты получишь новые доспехи.
	}
	else
	{
		AI_Output(self,hero,"TPL_8005_GorNaKosh_ARMOR_L_01_03");	//Теперь ты будешь носить эти доспехи в знак высочайшей чести, оказанной тебе Братством.
		B_GiveInvItems(hero,self,ItMi_Gold,VALUE_ITAR_TPL_L);
		CreateInvItems(hero,itar_tpl_l,1);
		Npc_RemoveInvItems(self,ItMi_Gold,VALUE_ITAR_TPL_L);
		BuyTemplerLight = TRUE;
	};
	Info_ClearChoices(tpl_8005_gornakosh_armor);
};

func void tpl_8005_gornakosh_armor_back()
{
	AI_Output(hero,self,"TPL_8005_GorNaKosh_ARMOR_BACK_01_01");	//Я передумал.
	AI_Output(self,hero,"TPL_8005_GorNaKosh_ARMOR_BACK_01_02");	//Как хочешь. Ты знаешь, где меня найти.
	Info_ClearChoices(tpl_8005_gornakosh_armor);
};


instance DIA_GORNAKOSH_GATHERARMY(C_Info)
{
	npc = tpl_8005_gornakosh;
	nr = 1;
	condition = dia_gornakosh_gatherarmy_condition;
	information = dia_gornakosh_gatherarmy_info;
	permanent = FALSE;
	description = "Меня прислал Идол Оран.";
};


func int dia_gornakosh_gatherarmy_condition()
{
	if(Npc_KnowsInfo(hero,dia_baalorun_gatherarmy))
	{
		return TRUE;
	};
};

func void dia_gornakosh_gatherarmy_info()
{
	AI_Output(other,self,"DIA_GorNaKosh_GatherArmy_01_00");	//Меня прислал Идол Оран.
	AI_Output(self,other,"DIA_GorNaKosh_GatherArmy_01_01");	//И что от меня хочет верховный Гуру?
	AI_Output(other,self,"DIA_GorNaKosh_GatherArmy_01_02");	//Он просил тебе передать, что Братство готово выступить против орков! Вы будете сражаться вместе с паладинами!
	AI_Output(self,other,"DIA_GorNaKosh_GatherArmy_01_06");	//Что же, отлично! (решительно) Я уже давно говорил, что нельзя просто так сидеть сложа руки и ждать, пока орки сами заявятся сюда.
	AI_Output(self,other,"DIA_GorNaKosh_GatherArmy_01_09");	//Но видишь ли...(замялся) Тут все-таки остается еще одна небольшая проблема.
	AI_Output(other,self,"DIA_GorNaKosh_GatherArmy_01_10");	//Что еще за проблема?
	AI_Output(self,other,"DIA_GorNaKosh_GatherArmy_01_13");	//Многие из наших послушников тоже наверняка захотят присоединится к нам. Это меня и беспокоит!
	AI_Output(self,other,"DIA_GorNaKosh_GatherArmy_01_15");	//Выйти на битву с целой армией орков для них будет равносильно неминуемой гибели. Ведь у них даже нет нормальных доспехов!
	AI_Output(self,other,"DIA_GorNaKosh_GatherArmy_01_16");	//Не думаю, что набедренная повязка послушника надежно защитит кого-либо из них от топоров орков.
	AI_Output(other,self,"DIA_GorNaKosh_GatherArmy_01_17");	//Тогда раздай им доспехи Стражей!
	AI_Output(self,other,"DIA_GorNaKosh_GatherArmy_01_18");	//Наши запасы крайне ограничены с тех пор, как мы покинули лагерь на болотах в Долине Рудников.
	AI_Output(other,self,"DIA_GorNaKosh_GatherArmy_01_22");	//Что ты предлагаешь?
	AI_Output(self,other,"DIA_GorNaKosh_GatherArmy_01_23");	//Насколько я знаю орков - эти твари достаточно медлительные в бою.
	AI_Output(self,other,"DIA_GorNaKosh_GatherArmy_01_24");	//Так что если мы дадим моим людям преимущество в скорости, то, возможно, у них будет шанс выстоять против них.
	AI_Output(other,self,"DIA_GorNaKosh_GatherArmy_01_25");	//И что нам в этом поможет?
	AI_Output(self,other,"DIA_GorNaKosh_GatherArmy_01_26");	//Единственная вещь, которая мне приходит в голову - это зелье ускорения или что-то в этом роде! Только оно способно вызвать подобный эффект на длительное время.
	AI_Output(self,other,"DIA_GorNaKosh_GatherArmy_01_28");	//Полагаю, полсотни порций этого напитка будет достаточно, чтобы хватило на всех.
	MIS_GORNAKOSHSPEEDPOTION = LOG_Running;
	Log_CreateTopic(TOPIC_GORNAKOSHSPEEDPOTION,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GORNAKOSHSPEEDPOTION,LOG_Running);
	B_LogEntry(TOPIC_GORNAKOSHSPEEDPOTION,"Для того, чтобы Гор На Кош и воины Братства поддержали паладинов в битве - мне необходимо достать ему полсотни напитков ускорения или чего-нибудь подобного. Он полагает, что если его люди получат преимущество в скорости боя перед орками, то у них будет шанс выжить. Это его условие. Придется достать ему эти напитки.");
};


instance DIA_GORNAKOSH_GATHERARMYDONE(C_Info)
{
	npc = tpl_8005_gornakosh;
	nr = 1;
	condition = dia_gornakosh_gatherarmydone_condition;
	information = dia_gornakosh_gatherarmydone_info;
	permanent = FALSE;
	description = "Я достал зелья для твоих людей.";
};

func int dia_gornakosh_gatherarmydone_condition()
{
	if((MIS_GORNAKOSHSPEEDPOTION == LOG_Running) && ((Npc_HasItems(other,ITPO_SPEED_03) >= 50) || (Npc_HasItems(other,ItPo_Speed) >= 50) || (Npc_HasItems(other,itpo_speed_02) >= 50) || (Npc_HasItems(other,ItFo_Addon_SchnellerHering) >= 50)))
	{
		return TRUE;
	};
};

func void dia_gornakosh_gatherarmydone_info()
{
	AI_Output(other,self,"DIA_GorNaKosh_GatherArmyDone_01_01");	//Я достал зелья ускорения для твоих людей.

	if(Npc_HasItems(other,ItFo_Addon_SchnellerHering) >= 50)
	{
		B_GivePlayerXP(500);
		B_GiveInvItems(other,self,ItFo_Addon_SchnellerHering,50);
		AI_Output(self,other,"DIA_GorNaKosh_GatherArmyDone_01_04");	//Хммм...(с подозрением) И что это?
		AI_Output(other,self,"DIA_GorNaKosh_GatherArmyDone_01_05");	//Этот напиток называется 'Быстрая селедка'! Он куда лучше обычных эликсиров.
		AI_Output(self,other,"DIA_GorNaKosh_GatherArmyDone_01_08");	//Кхмм...(с опаской) Ну ладно. Надеюсь, ты знаешь, что говоришь.
		if(Npc_HasItems(self,ItFo_Addon_SchnellerHering) == 0)
		{
			CreateInvItem(self,ItFo_Addon_SchnellerHering);
		};
		AI_UseItem(self,ItFo_Addon_SchnellerHering);
		AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
		AI_Output(self,other,"DIA_GorNaKosh_GatherArmyDone_01_09");	//Ааархх...
		AI_PlayAni(self,"T_HEASHOOT_2_STAND");
		AI_Output(self,other,"DIA_GorNaKosh_GatherArmyDone_01_10");	//Черт...(морщась) Какой крепкий напиток! У меня даже уши заложило.
		AI_Output(other,self,"DIA_GorNaKosh_GatherArmyDone_01_11");	//Что-нибудь еще кроме этого чувствуешь?
		AI_Output(self,other,"DIA_GorNaKosh_GatherArmyDone_01_12");	//Кажется, да...(удивленно) Сейчас у меня вдруг появилось такое ощущение, что теперь я смогу обогнать и самого дракона.
		AI_Output(self,other,"DIA_GorNaKosh_GatherArmyDone_01_13");	//Где ты достал это пойло?
		AI_Output(other,self,"DIA_GorNaKosh_GatherArmyDone_01_14");	//У пиратов. Они действительно знают толк в хорошем самогоне.
		AI_Output(self,other,"DIA_GorNaKosh_GatherArmyDone_01_15");	//Ну что же, ладно...(решительно) Думаю, этого вполне хватит моим людям. Заодно и мозги им прочистит!
		B_LogEntry(TOPIC_GORNAKOSHSPEEDPOTION,"Я принес Гор На Кошу полсотни бутылок 'Быстрой селедки'. Поначалу он засомневался в моем выборе, но попробовав разок этот замечательный напиток, решил, что он подойдет его парням.");
	}
	else if(Npc_HasItems(other,itpo_speed_02) >= 50)
	{
		B_GivePlayerXP(400);
		B_GiveInvItems(other,self,itpo_speed_02,50);
		AI_Output(self,other,"DIA_GorNaKosh_GatherArmyDone_01_18");	//Двойной напиток ускорения? Отлично! Это даже лучше, чем я предполагал.
		AI_Output(self,other,"DIA_GorNaKosh_GatherArmyDone_01_21");	//Теперь у моих людей будет преимущество перед орками в бою. Спасибо тебе за помощь.
		B_LogEntry(TOPIC_GORNAKOSHSPEEDPOTION,"Я достал для Гор На Коша полсотни двойных эликсиров ускорения.");
	}
	else if(Npc_HasItems(other,ITPO_SPEED_03) >= 50)
	{
		B_GivePlayerXP(300);
		B_GiveInvItems(other,self,ITPO_SPEED_03,50);
		AI_Output(self,other,"DIA_GorNaKosh_GatherArmyDone_01_24");	//Хорошо! Это как раз то, что нужно.
		AI_Output(self,other,"DIA_GorNaKosh_GatherArmyDone_01_25");	//Теперь у моих людей будет преимущество перед орками в бою. Спасибо тебе за помощь.
		B_LogEntry(TOPIC_GORNAKOSHSPEEDPOTION,"Я достал для Гор На Коша полсотни эликсиров ускорения.");
	}
	else if(Npc_HasItems(other,ItPo_Speed) >= 50)
	{
		B_GivePlayerXP(300);
		B_GiveInvItems(other,self,ItPo_Speed,50);
		AI_Output(self,other,"DIA_GorNaKosh_GatherArmyDone_01_24");	//Хорошо! Это как раз то, что нужно.
		AI_Output(self,other,"DIA_GorNaKosh_GatherArmyDone_01_25");	//Теперь у моих людей будет преимущество перед орками в бою. Спасибо тебе за помощь.
		B_LogEntry(TOPIC_GORNAKOSHSPEEDPOTION,"Я достал для Гор На Коша полсотни эликсиров ускорения.");
	};
	MIS_GORNAKOSHSPEEDPOTION = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_GORNAKOSHSPEEDPOTION,LOG_SUCCESS);
};

instance DIA_GORNAKOSH_GATHERARMYGO(C_Info)
{
	npc = tpl_8005_gornakosh;
	nr = 1;
	condition = dia_gornakosh_gatherarmygo_condition;
	information = dia_gornakosh_gatherarmygo_info;
	permanent = FALSE;
	description = "Теперь вы готовы поддержать паладинов?";
};

func int dia_gornakosh_gatherarmygo_condition()
{
	if(MIS_GORNAKOSHSPEEDPOTION == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_gornakosh_gatherarmygo_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_GorNaKosh_GatherArmyGo_01_01");	//Теперь вы готовы поддержать паладинов?
	AI_Output(self,other,"DIA_GorNaKosh_GatherArmyGo_01_02");	//Да, можешь пойти и передать мой ответ самому лорду Хагену.
	AI_Output(self,other,"DIA_GorNaKosh_GatherArmyGo_01_03");	//И заодно узнай у него - где он планирует сражение с орками!
	TPL_JOINHAGEN = TRUE;
	B_LogEntry(TOPIC_ORсGREATWAR,"Гор На Кош и его воины присоединятся к армии паладинов. Мне необходимо сообщить об этом лорду Хагену, а заодно и выяснить, где он планирует дать бой оркам.");
	AI_StopProcessInfos(self);
	B_GorNaKoshEquipWeapon(self);
};