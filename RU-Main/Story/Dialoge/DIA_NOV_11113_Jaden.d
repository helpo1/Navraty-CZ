
instance DIA_JADEN_KAP1_EXIT(C_Info)
{
	npc = nov_11113_jaden;
	nr = 999;
	condition = dia_jaden_kap1_exit_condition;
	information = dia_jaden_kap1_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_jaden_kap1_exit_condition()
{
	return TRUE;
};

func void dia_jaden_kap1_exit_info()
{
	AI_StopProcessInfos(self);
};


var int is_jaden_about_church_condition;
var int jaden_about_sengo_answer_1;

instance DIA_JADEN_HELLO1(C_Info)
{
	npc = nov_11113_jaden;
	nr = 1;
	condition = dia_jaden_hello1_condition;
	information = dia_jaden_hello1_info;
	permanent = TRUE;
	important = FALSE;
	description = "Ты давно в монастыре?";
};


func int dia_jaden_hello1_condition()
{
	return TRUE;
};

func void dia_jaden_hello1_info()
{
	AI_Output(other,self,"DIA_Jaden_Hello_00_01");	//Ты давно в монастыре?
	AI_Output(self,other,"DIA_Jaden_Hello_00_02");	//Уже почти год. А так, сам я с материка...
	AI_Output(other,self,"DIA_Jaden_Hello_00_03");	//А как ты попал сюда?
	AI_Output(self,other,"DIA_Jaden_Hello_00_04");	//На корабле, как же еще? Мы ведь на острове. Или ты забыл?
	AI_Output(other,self,"DIA_Jaden_Hello_00_05");	//Я хотел сказать - почему ты приплыл именно сюда? Разве на материке нет ни одного монастыря?
	AI_Output(self,other,"DIA_Jaden_Hello_00_06");	//Ну почему же, есть один - в Нордмаре.
	AI_Output(self,other,"DIA_Jaden_Hello_00_07");	//Но в одиночку мне туда было не добраться. А найти провожатого в разгар войны оказалось проблемой.
	AI_Output(self,other,"DIA_Jaden_Hello_00_08");	//Поэтому я взял деньги, оставленные мне моим отцом, сел на корабль и приплыл сюда.
	AI_Output(other,self,"DIA_Jaden_Hello_00_09");	//Должно быть, твой отец был состоятельным человеком?
	AI_Output(self,other,"DIA_Jaden_Hello_00_10");	//Он был паладином. В ордене получают не так много, как ты думаешь. 
	AI_Output(self,other,"DIA_Jaden_Hello_00_11");	//Эту сумму он копил не один год. Он все надеялся, что я пойду в городскую стражу в Венгарде.
	AI_Output(self,other,"DIA_Jaden_Hello_00_12");	//Но меня всегда привлекала магия и тайны прошлого. И вот я здесь!
	AI_Output(other,self,"DIA_Jaden_Hello_00_13");	//Он БЫЛ паладином?
	AI_Output(self,other,"DIA_Jaden_Hello_00_14");	//(печально) Да. Полгода назад я получил письмо о том, что он погиб в сражении.
};

instance DIA_JADEN_JOIN(C_Info)
{
	nr = 4;
	condition = dia_jaden_join_condition;
	information = dia_jaden_join_info;
	permanent = TRUE;
	npc = nov_11113_jaden;
	description = "Я хочу стать магом!";
};

func int dia_jaden_join_condition()
{
	if(hero.guild == GIL_NOV)
	{
		return TRUE;
	};
	return FALSE;
};

func void dia_jaden_join_info()
{
	AI_Output(other,self,"DIA_NOV_3_JOIN_15_00");	//Я хочу стать магом!
	AI_Output(self,other,"DIA_Jaden_Join_03_01");	//Этого хотят все послушники. Но только немногие из них становятся Избранными и получают шанс быть принятыми в Круг Огня.
	AI_Output(self,other,"DIA_Jaden_Join_03_02");	//Стать магом Круга Огня - это высочайшая честь, и ее нужно заслужить.
	AI_Output(self,other,"DIA_Jaden_Join_03_03");	//Ты должен прилежно трудиться, и тогда, возможно, у тебя появится шанс.
};


instance DIA_JADEN_PEOPLE(C_Info)
{
	nr = 5;
	condition = dia_jaden_people_condition;
	information = dia_jaden_people_info;
	permanent = TRUE;
	npc = nov_11113_jaden;
	description = "Кто возглавляет этот монастырь?";
};


func int dia_jaden_people_condition()
{
	return TRUE;
};

func void dia_jaden_people_info()
{
	AI_Output(other,self,"DIA_NOV_3_PEOPLE_15_00");	//Кто возглавляет этот монастырь?
	AI_Output(self,other,"DIA_Jaden_People_03_01");	//Мы, послушники, служим магам Круга Огня. Их, в свою очередь, возглавляет Высший Совет, состоящий из трех самых влиятельных магов.
	AI_Output(self,other,"DIA_Jaden_People_03_02");	//Но за все дела послушников отвечает Парлан. Его всегда можно найти во дворе, он наблюдает за работой послушников.
};


instance DIA_JADEN_LOCATION(C_Info)
{
	nr = 6;
	condition = dia_jaden_location_condition;
	information = dia_jaden_location_info;
	permanent = TRUE;
	npc = nov_11113_jaden;
	description = "Что ты можешь сказать мне об этом монастыре?";
};


func int dia_jaden_location_condition()
{
	return TRUE;
};

func void dia_jaden_location_info()
{
	AI_Output(other,self,"DIA_NOV_3_LOCATION_15_00");	//Что ты можешь сказать мне об этом монастыре?
	AI_Output(self,other,"DIA_Jaden_Location_03_01");	//Мы свои трудом добываем хлеб насущный. Мы выращиваем овец и делаем вино.
	AI_Output(self,other,"DIA_Jaden_Location_03_02");	//Здесь есть библиотека, но вход в нее разрешен только магам и избранным послушникам.
	AI_Output(self,other,"DIA_Jaden_Location_03_03");	//Мы же, остальные послушники, следим за тем, чтобы маги Круга Огня ни в чем не нуждались.
};


instance DIA_JADEN_STANDARD(C_Info)
{
	nr = 10;
	condition = dia_jaden_standard_condition;
	information = dia_jaden_standard_info;
	permanent = TRUE;
	npc = nov_11113_jaden;
	description = "Что нового?";
};

func int dia_jaden_standard_condition()
{
	return TRUE;
};

func void dia_jaden_standard_info()
{
	AI_Output(other,self,"DIA_NOV_3_STANDARD_15_00");	//Что новенького?
	if(Kapitel == 1)
	{
		if(hero.guild == GIL_KDF)
		{
			AI_Output(self,other,"DIA_Jaden_Standard_03_01");	//И ты еще спрашиваешь! Да все послушники только о тебе и говорят.
			AI_Output(self,other,"DIA_Jaden_Standard_03_02");	//Очень редко бывает так, чтобы зеленый новичок вроде тебя был избран в Круг Огня.
		}
		else
		{
			AI_Output(self,other,"DIA_Jaden_Standard_03_03");	//Скоро опять состоятся выборы. Один из послушников скоро будет принят в Круг Огня.
			AI_Output(self,other,"DIA_Jaden_Standard_03_04");	//Скоро он приступит к выполнению испытаний.
		};
	};
	if((Kapitel == 2) || (Kapitel == 3))
	{
		if((Pedro_Traitor == TRUE) && (MIS_NovizenChase != LOG_SUCCESS))
		{
			AI_Output(self,other,"DIA_Jaden_Standard_03_05");	//Нашего ордена коснулась грязная лапа Белиара! Зло, должно быть, очень сильно, если оно смогло найти союзников здесь.
			AI_Output(self,other,"DIA_Jaden_Standard_03_06");	//Педро жил в этом монастыре многие годы. Я думаю, что он слишком много времени проводил за стенами монастыря. Это ослабило его веру и сделало уязвимым для искушений Белиара.
		}
		else if(MIS_NovizenChase == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Jaden_Standard_03_07");	//Ты пришел как раз вовремя. Сам Иннос не мог бы выбрать лучший момент для твоего появления.
			AI_Output(self,other,"DIA_Jaden_Standard_03_08");	//Ты войдешь в анналы нашего монастыря как спаситель Глаза.
		}
		else if(MIS_OLDWORLD == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Jaden_Standard_03_09");	//Новости из Долины Рудников очень тревожные. Я думаю, что Иннос специально подвергает нас суровым испытаниям.
		}
		else
		{
			AI_Output(self,other,"DIA_Jaden_Standard_03_10");	//Говорят, что от паладинов, отправившихся в Долину Рудников, нет никаких вестей. Высший Совет лучше знает, что нужно делать.
		};
	};
	if(Kapitel == 4)
	{
		AI_Output(self,other,"DIA_Jaden_Standard_03_11");	//Говорят, что мы должны уничтожить драконов с помощью нашего Владыки. Гнев Инноса испепелит созданий Белиара.
	};
	if(Kapitel == 5)
	{
		AI_Output(self,other,"DIA_Jaden_Standard_03_12");	//Хвала Инносу, нового кризиса нет. Мы должны дальше идти дорогой нашего господина, ведь только с его помощью мы сможем противостоять злу.
	};
	if(Kapitel >= 6)
	{
		AI_Output(self,other,"DIA_Jaden_Standard_03_13");	//А ты сам не знаешь? Орки, орки, орки - вот единственная новость за последнее время. И с каждым днем их появляется еще больше!
	};
};

func void b_assignambientinfos_jaden(var C_Npc slf)
{
	dia_nov_3_exit.npc = Hlp_GetInstanceID(slf);
	dia_nov_3_join.npc = Hlp_GetInstanceID(slf);
	dia_nov_3_people.npc = Hlp_GetInstanceID(slf);
	dia_nov_3_location.npc = Hlp_GetInstanceID(slf);
	dia_nov_3_standard.npc = Hlp_GetInstanceID(slf);
	DIA_NOV_3_Fegen.npc = Hlp_GetInstanceID(slf);
	DIA_NOV_3_Wurst.npc = Hlp_GetInstanceID(slf);
};

instance DIA_Jaden_Wurst(C_Info)
{
	npc = nov_11113_jaden;
	nr = 2;
	condition = DIA_Jaden_Wurst_Condition;
	information = DIA_Jaden_Wurst_Info;
	permanent = FALSE;
	description = "Вот, у меня есть баранья колбаса для тебя.";
};

func int DIA_Jaden_Wurst_Condition()
{
	if((Kapitel == 1) && (MIS_GoraxEssen == LOG_Running) && (Npc_HasItems(self,ItFo_Schafswurst) == 0) && (Npc_HasItems(other,ItFo_Schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Jaden_Wurst_Info()
{
	var string NovizeText;
	var string NovizeLeft;
	AI_Output(other,self,"DIA_Agon_Wurst_15_00");	//Вот, у меня есть баранья колбаса для тебя.
	AI_Output(self,other,"DIA_Agon_Wurst_07_03");	//Ладно, давай ее сюда!
	B_GiveInvItems(other,self,ItFo_Schafswurst,1);
	Wurst_Gegeben = Wurst_Gegeben + 1;
	CreateInvItems(self,ItFo_Sausage,1);
	B_UseItem(self,ItFo_Sausage);
};

instance DIA_JADENSLD_PICKPOCKET(C_Info)
{
	nr = 900;
	npc = nov_11113_jaden;
	condition = dia_jadensld_pickpocket_condition;
	information = dia_jadensld_pickpocket_info;
	permanent = TRUE;
	description = Pickpocket_40;
};

func int dia_jadensld_pickpocket_condition()
{
	return C_Beklauen(56,35);
};

func void dia_jadensld_pickpocket_info()
{
	Info_ClearChoices(dia_jadensld_pickpocket);
	Info_AddChoice(dia_jadensld_pickpocket,Dialog_Back,dia_jadensld_pickpocket_back);
	Info_AddChoice(dia_jadensld_pickpocket,DIALOG_PICKPOCKET,dia_jadensld_pickpocket_doit);
};

func void dia_jadensld_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 40)
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		}
		else
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		};
		B_GiveInvItems(self,other,ItMi_Gold,20);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		BELIARPRAYCOUNT = BELIARPRAYCOUNT + 1;
		B_GiveThiefXP();
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

func void dia_jadensld_pickpocket_back()
{
	Info_ClearChoices(dia_jadensld_pickpocket);
};