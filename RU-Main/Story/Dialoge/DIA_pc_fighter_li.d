
instance DIA_GORN_LI_KAP5_EXIT(C_Info)
{
	npc = pc_fighter_li;
	nr = 999;
	condition = dia_gorn_li_kap5_exit_condition;
	information = dia_gorn_li_kap5_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_gorn_li_kap5_exit_condition()
{
	return TRUE;
};

func void dia_gorn_li_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GORN_LI_TEACH(C_Info)
{
	npc = pc_fighter_li;
	nr = 10;
	condition = dia_gorn_li_teach_condition;
	information = dia_gorn_li_teach_info;
	permanent = TRUE;
	description = "Я нуждаюсь в тренировке.";
};


func int dia_gorn_li_teach_condition()
{
	return TRUE;
};

func void dia_gorn_li_teach_info()
{
	AI_Output(other,self,"DIA_Gorn_DI_Teach_15_00");	//Я хочу потренироваться.
	AI_Output(self,other,"DIA_Gorn_DI_Teach_12_01");	//Это не помешает.
	Info_ClearChoices(dia_gorn_li_teach);
	Info_AddChoice(dia_gorn_li_teach,Dialog_Back,dia_gorn_li_teach_back);
	Info_AddChoice(dia_gorn_li_teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_gorn_li_teach_2h_5);
	Info_AddChoice(dia_gorn_li_teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_gorn_li_teach_2h_1);
};

func void dia_gorn_li_teach_2h_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,100))
	{
		AI_Output(self,other,"DIA_Gorn_DI_Teach_2H_1_12_00");	//Ну. Однако, уже лучше.
	};
	Info_ClearChoices(dia_gorn_li_teach);
	Info_AddChoice(dia_gorn_li_teach,Dialog_Back,dia_gorn_li_teach_back);
	Info_AddChoice(dia_gorn_li_teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_gorn_li_teach_2h_5);
	Info_AddChoice(dia_gorn_li_teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_gorn_li_teach_2h_1);
};

func void dia_gorn_li_teach_2h_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,100))
	{
		AI_Output(self,other,"DIA_Gorn_DI_Teach_2H_5_12_00");	//Ты должен держать оружие выше. Твою защиту пробьет слепой с костылем.
	};
	Info_ClearChoices(dia_gorn_li_teach);
	Info_AddChoice(dia_gorn_li_teach,Dialog_Back,dia_gorn_li_teach_back);
	Info_AddChoice(dia_gorn_li_teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_gorn_li_teach_2h_5);
	Info_AddChoice(dia_gorn_li_teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_gorn_li_teach_2h_1);
};

func void dia_gorn_li_teach_back()
{
	Info_ClearChoices(dia_gorn_li_teach);
};


instance DIA_FIGHTER_LI_PICKPOCKET(C_Info)
{
	npc = pc_fighter_li;
	nr = 900;
	condition = dia_fighter_li_pickpocket_condition;
	information = dia_fighter_li_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_fighter_li_pickpocket_condition()
{
	return C_Beklauen(10,45);
};

func void dia_fighter_li_pickpocket_info()
{
	Info_ClearChoices(dia_fighter_li_pickpocket);
	Info_AddChoice(dia_fighter_li_pickpocket,Dialog_Back,dia_fighter_li_pickpocket_back);
	Info_AddChoice(dia_fighter_li_pickpocket,DIALOG_PICKPOCKET,dia_fighter_li_pickpocket_doit);
};

func void dia_fighter_li_pickpocket_doit()
{
	B_Beklauen();
	Info_ClearChoices(dia_fighter_li_pickpocket);
};

func void dia_fighter_li_pickpocket_back()
{
	Info_ClearChoices(dia_fighter_li_pickpocket);
};


instance DIA_GORN_LI_STORMFEAR(C_Info)
{
	npc = pc_fighter_li;
	nr = 2;
	condition = dia_gorn_li_stormfear_condition;
	information = dia_gorn_li_stormfear_info;
	permanent = FALSE;
	description = "Как дела?";
};


func int dia_gorn_li_stormfear_condition()
{
	return TRUE;
};

func void dia_gorn_li_stormfear_info()
{
	AI_Output(other,self,"DIA_Gorn_LI_StormFear_00_00");	//Как дела?
	AI_Output(self,other,"DIA_Gorn_LI_StormFear_00_01");	//(нервно) Могло быть и лучше, приятель.
	AI_Output(self,other,"DIA_Gorn_LI_StormFear_00_02");	//После того шторма, в который мы попали, я до сих пор не могу прийти в себя!
};


instance DIA_GORN_LI_BRINGFOOD(C_Info)
{
	npc = pc_fighter_li;
	nr = 2;
	condition = dia_gorn_li_bringfood_condition;
	information = dia_gorn_li_bringfood_info;
	permanent = FALSE;
	description = "Тебе уже пора успокоиться.";
};


func int dia_gorn_li_bringfood_condition()
{
	if(Npc_KnowsInfo(hero,dia_gorn_li_stormfear))
	{
		return TRUE;
	};
};

func void dia_gorn_li_bringfood_info()
{
	AI_Output(other,self,"DIA_Gorn_LI_BringFood_00_00");	//Тебе уже пора успокоиться и привести себя в чувства.
	AI_Output(self,other,"DIA_Gorn_LI_BringFood_00_01");	//Тебе легко говорить! Ведь ты же большую часть времени провел без сознания.
	AI_Output(self,other,"DIA_Gorn_LI_BringFood_00_02");	//А я в момент шторма натерпелся такого ужаса, что...
	AI_Output(self,other,"DIA_Gorn_LI_BringFood_00_03");	//Если что-то и могло бы сейчас вернуть меня к жизни, так это только большое количество вкусной жратвы!
	AI_Output(self,other,"DIA_Gorn_LI_BringFood_00_04");	//Но...
	if(TorlofIsCaptain == TRUE)
	{
		AI_Output(self,other,"DIA_Gorn_LI_BringFood_00_06");	//Судя по словам Торлофа, наши запасы провианта подходят к концу.
	};
	if(JorgenIsCaptain == TRUE)
	{
		AI_Output(self,other,"DIA_Gorn_LI_BringFood_00_07");	//Судя по словам Йоргена, наши запасы провианта подходят к концу.
	};
	if(JackIsCaptain == TRUE)
	{
		AI_Output(self,other,"DIA_Gorn_LI_BringFood_00_08");	//Судя по словам Джека, наши запасы провианта подходят к концу.
	};
	AI_Output(self,other,"DIA_Gorn_LI_BringFood_00_09");	//Поэтому всем парням пришлось немного поумерить свои аппетиты...(грустно) И особенно мне!
	AI_Output(self,other,"DIA_Gorn_LI_BringFood_00_13");	//Эх... я бы сейчас не отказался от здоровенного куска хорошо прожаренного мяса!
	AI_Output(other,self,"DIA_Gorn_LI_BringFood_00_15");	//Но мне кажется, что на этом острове достаточно зверей.
	AI_Output(other,self,"DIA_Gorn_LI_BringFood_00_16");	//Охота пополнила бы запасы еды.
	AI_Output(self,other,"DIA_Gorn_LI_BringFood_00_17");	//Да, но многие парни пока что предпочитают не заходить далеко в глубь острова.
	AI_Output(self,other,"DIA_Gorn_LI_BringFood_00_18");	//Никто же не знает, что за твари там могут водиться.
	AI_Output(self,other,"DIA_Gorn_LI_BringFood_00_19");	//А один я туда не пойду!
};


instance DIA_GORN_LI_BRINGFOODPROGGRESS(C_Info)
{
	npc = pc_fighter_li;
	nr = 2;
	condition = dia_gorn_li_bringfoodproggress_condition;
	information = dia_gorn_li_bringfoodproggress_info;
	permanent = FALSE;
	description = "Сколько нам нужно еды?";
};


func int dia_gorn_li_bringfoodproggress_condition()
{
	if(Npc_KnowsInfo(hero,dia_gorn_li_bringfood))
	{
		return TRUE;
	};
};

func void dia_gorn_li_bringfoodproggress_info()
{
	AI_Output(other,self,"DIA_Gorn_LI_BringFoodProggress_00_00");	//Сколько нам нужно еды?
	AI_Output(self,other,"DIA_Gorn_LI_BringFoodProggress_00_01");	//Чем больше, тем лучше!
	AI_Output(self,other,"DIA_Gorn_LI_BringFoodProggress_00_03");	//Ну, думаю, что для начала двух дюжин кусков мяса и штук двадцать яблок будет вполне достаточно.
	AI_Output(self,other,"DIA_Gorn_LI_BringFoodProggress_00_05");	//А ты что же это, решил сам сходить на охоту?
	AI_Output(other,self,"DIA_Gorn_LI_BringFoodProggress_00_06");	//Ну, почему бы и нет. В конце концов, кто-то же должен наконец выяснить, что из себя представляет этот остров.
	AI_Output(self,other,"DIA_Gorn_LI_BringFoodProggress_00_12");	//Если ты действительно это сделаешь, то все только скажут тебе большое спасибо.
	AI_Output(self,other,"DIA_Gorn_LI_BringFoodProggress_00_13");	//Но будь осторожен!
	MIS_BRINGFOOD = LOG_Running;
	Log_CreateTopic(TOPIC_BRINGFOOD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BRINGFOOD,LOG_Running);
	B_LogEntry(TOPIC_BRINGFOOD,"Горн сказал, что запасы провианта на корабле подходят к концу, и по этой причине всем парням пришлось потуже затянуть свои ремни. Эта ситуация его очень удручает. Я планирую отправиться в глубь острова и поохотиться, чтобы пополнить наши запасы провизии. По словам Горна, на первое время нам хватит двух дюжин кусков свежего мяса и штук двадцать яблок.");
};


instance DIA_GORN_LI_BRINGFOODPROGGRESSTOEND(C_Info)
{
	npc = pc_fighter_li;
	nr = 2;
	condition = dia_gorn_li_bringfoodproggresstoend_condition;
	information = dia_gorn_li_bringfoodproggresstoend_info;
	permanent = FALSE;
	description = "Я достал свежее мясо и яблоки.";
};


func int dia_gorn_li_bringfoodproggresstoend_condition()
{
	if((MIS_BRINGFOOD == LOG_Running) && (Npc_HasItems(hero,ItFoMuttonRaw) >= 24) && (Npc_HasItems(hero,ItFo_Apple) >= 20))
	{
		return TRUE;
	};
};

func void dia_gorn_li_bringfoodproggresstoend_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Gorn_LI_BringFoodProggressToEnd_00_00");	//Я достал свежее мясо и яблоки.
	AI_Output(self,other,"DIA_Gorn_LI_BringFoodProggressToEnd_00_01");	//Отлично, приятель! Теперь мы точно не умрем с голоду.
	if(TorlofIsCaptain == TRUE)
	{
		AI_Output(self,other,"DIA_Gorn_LI_BringFoodProggressToEnd_00_03");	//Думаю, тебе стоит отнести его Торлофу.
	};
	if(JorgenIsCaptain == TRUE)
	{
		AI_Output(self,other,"DIA_Gorn_LI_BringFoodProggressToEnd_00_04");	//Думаю, тебе стоит отнести его Йоргену.
	};
	if(JackIsCaptain == TRUE)
	{
		AI_Output(self,other,"DIA_Gorn_LI_BringFoodProggressToEnd_00_05");	//Думаю, тебе стоит отнести его Джеку.
	};
	AI_Output(self,other,"DIA_Gorn_LI_BringFoodProggressToEnd_00_06");	//Он наверняка знает, как с ним лучше поступить.
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_Gorn_LI_BringFoodProggressToEnd_00_08");	//Подожди! (шепотом) И еще кое-что...
	AI_Output(other,self,"DIA_Gorn_LI_BringFoodProggressToEnd_00_09");	//Что?
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_Gorn_LI_BringFoodProggressToEnd_00_10");	//Я уверен, что наш капитан - даже несмотря на то, что жратвы у нас теперь предостаточно - не слишком-то будет нас баловать изобилием пищи.
	AI_Output(other,self,"DIA_Gorn_LI_BringFoodProggressToEnd_00_12");	//К чему это ты ведешь?
	AI_Output(self,other,"DIA_Gorn_LI_BringFoodProggressToEnd_00_13");	//К тому, что...(замявшись) ...если у тебя где-нибудь вдруг, случайно, заваляются несколько лишних кусков мяса, то...
	AI_Output(self,other,"DIA_Gorn_LI_BringFoodProggressToEnd_00_14");	//...отдай его мне. У меня желудок с голоду сводит!
	AI_Output(self,other,"DIA_Gorn_LI_BringFoodProggressToEnd_00_18");	//Поверь мне, я у тебя в долгу не останусь.
	AI_Output(self,other,"DIA_Gorn_LI_BringFoodProggressToEnd_00_19");	//Только учти, что сырое мясо мне не нужно.
	AI_Output(self,other,"DIA_Gorn_LI_BringFoodProggressToEnd_00_20");	//А вот от хорошо прожаренного, пожалуй, не откажусь.
	AI_Output(other,self,"DIA_Gorn_LI_BringFoodProggressToEnd_00_23");	//Сколько тебе нужно?
	AI_Output(self,other,"DIA_Gorn_LI_BringFoodProggressToEnd_00_24");	//Думаю, что десяти жирных кусков мне хватит.
	AI_Output(other,self,"DIA_Gorn_LI_BringFoodProggressToEnd_00_25");	//Я посмотрю, что можно сделать.
	B_LogEntry(TOPIC_BRINGFOOD,"Я достал то количество мяса, о котором говорил Горн. Теперь надо отнести его нашему капитану.");
	Log_AddEntry(TOPIC_BRINGFOOD,"Кроме того, Горн попросил меня отдать ему кусков десять добытого мною мяса, перед этим хорошо его прожарив. Бедняга настолько оголодал, что уже готов жевать подошвы своих сапог, лишь бы немного утолить свой голод.");
	GORNTELLABOUTMEAT = TRUE;
};


instance DIA_GORN_LI_BRINGFOODBEGINEND(C_Info)
{
	npc = pc_fighter_li;
	nr = 1;
	condition = dia_gorn_li_bringfoodbeginend_condition;
	information = dia_gorn_li_bringfoodbeginend_info;
	permanent = FALSE;
	description = "Вот тебе жареное мясо.";
};


func int dia_gorn_li_bringfoodbeginend_condition()
{
	if((GORNTELLABOUTMEAT == TRUE) && (NOTTHANKSTELLALLMEAT == TRUE) && (Npc_HasItems(hero,ItFoMutton) >= 10))
	{
		return TRUE;
	};
};

func void dia_gorn_li_bringfoodbeginend_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self,"DIA_Gorn_LI_BringFoodBeginEnd_00_01");	//Вот тебе жареное мясо.
	B_GiveInvItems(other,self,ItFoMutton,10);
	AI_Output(self,other,"DIA_Gorn_LI_BringFoodBeginEnd_00_02");	//Спасибо, парень! Теперь я наконец-то наемся до отвала!
	AI_Output(self,other,"DIA_Gorn_LI_BringFoodBeginEnd_00_06");	//Теперь насчет моей благодарности... что ты хочешь?
	if(MIS_BRINGFOOD == LOG_Running)
	{
		B_LogEntry(TOPIC_BRINGFOOD,"Я принес Горну жареное мясо, которое он просил.");
	};
	Info_ClearChoices(dia_gorn_li_bringfoodbeginend);
	if((MIS_MISSMYGOLD == LOG_Running) && (GORNTELLNONEABOUTGOLD == TRUE) && (Npc_HasItems(hero,itmi_misstorlofthing) == 0))
	{
		Info_AddChoice(dia_gorn_li_bringfoodbeginend,"Тогда давай вернемся к вопросу о моем пропавшем золоте...",dia_gorn_li_bringfoodbeginend_missgold);
	};
	Info_AddChoice(dia_gorn_li_bringfoodbeginend,"Золото было бы в самый раз.",dia_gorn_li_bringfoodbeginend_gold);
	Info_AddChoice(dia_gorn_li_bringfoodbeginend,"У тебя есть что-нибудь особенное?",dia_gorn_li_bringfoodbeginend_special);
};

func void dia_gorn_li_bringfoodbeginend_missgold()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Gorn_LI_BringFoodBeginEnd_MissGold_00_00");	//Давай вернемся к вопросу о моем пропавшем золоте...
	AI_Output(other,self,"DIA_Gorn_LI_BringFoodBeginEnd_MissGold_00_01");	//Что с ним все-таки произошло?
	AI_Output(self,other,"DIA_Gorn_LI_BringFoodBeginEnd_MissGold_00_02");	//Но я ведь уже сказал тебе, что ничего об этом не знаю...(растерянно) Что еще ты от меня хочешь услышать?
	AI_Output(other,self,"DIA_Gorn_LI_BringFoodBeginEnd_MissGold_00_05");	//Тогда скажи, кто из парней может что-нибудь знать об этом?
	AI_Output(self,other,"DIA_Gorn_LI_BringFoodBeginEnd_MissGold_00_06");	//Понятия не имею! Но, полагаю, что, если кто-нибудь и знает что-то о случившимся, то это только наш капитан.
	AI_Output(self,other,"DIA_Gorn_LI_BringFoodBeginEnd_MissGold_00_07");	//Правда, не думаю, что ему сейчас до этого есть какое-либо дело.
	AI_Output(self,other,"DIA_Gorn_LI_BringFoodBeginEnd_MissGold_00_09");	//Во время шторма он где-то на корабле потерял свой компас, и теперь у него все мысли только о нем.
	AI_Output(self,other,"DIA_Gorn_LI_BringFoodBeginEnd_MissGold_00_10");	//Судя по тому, как он сильно расстроился, - эта штука была достаточно дорога ему.
	AI_Output(self,other,"DIA_Gorn_LI_BringFoodBeginEnd_MissGold_00_15");	//Больше мне нечего сказать тебе.
	GORNTELLABOUTCOMPAS = TRUE;
	if(TorlofIsCaptain == TRUE)
	{
		B_LogEntry(TOPIC_MISSMYGOLD,"Горн думает, что знать о пропавшем золоте может только наш капитан. Также он упомянул, что Торлоф во время шторма где-то на корабле потерял свой компас. Возможно, если я найду его, Торлоф будет более сговорчив на интересующую меня тему.");
	};
	if(JorgenIsCaptain == TRUE)
	{
		B_LogEntry(TOPIC_MISSMYGOLD,"Горн думает, что знать о пропавшем золоте может только наш капитан. Также он упомянул, что Йорген во время шторма где-то на корабле потерял свой компас. Возможно, если я найду его, Йорген будет более сговорчив на интересующую меня тему.");
	};
	if(JackIsCaptain == TRUE)
	{
		B_LogEntry(TOPIC_MISSMYGOLD,"Горн думает, что знать о пропавшем золоте может только наш капитан. Также он упомянул, что Джек во время шторма где-то на корабле потерял свой компас. Возможно, если я найду его, Джек будет более сговорчив на интересующую меня тему.");
	};
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(pc_fighter_li,"EatMeat");
};

func void dia_gorn_li_bringfoodbeginend_gold()
{
	AI_Output(other,self,"DIA_Gorn_LI_BringFoodBeginEnd_Gold_00_00");	//Золото было бы в самый раз.
	AI_Output(self,other,"DIA_Gorn_LI_BringFoodBeginEnd_Gold_00_01");	//Как скажешь! Вот, возьми - здесь ровно две тысячи золотых монет.
	B_GiveInvItems(self,other,ItMi_Gold,2000);
	AI_Output(self,other,"DIA_Gorn_LI_BringFoodBeginEnd_Gold_00_04");	//А теперь я начну набивать свой желудок этим вкусным мясом!
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(pc_fighter_li,"EatMeat");
};

func void dia_gorn_li_bringfoodbeginend_special()
{
	AI_Output(other,self,"DIA_Gorn_LI_BringFoodBeginEnd_Special_00_00");	//Может, у тебя есть что-нибудь особенное?
	AI_Output(self,other,"DIA_Gorn_LI_BringFoodBeginEnd_Special_00_01");	//Хммм... ну, если только, может быть, вот этот эликсир.
	AI_Output(self,other,"DIA_Gorn_LI_BringFoodBeginEnd_Special_00_02");	//Я прихватил его с собой перед отплытием на Ирдорат, и так до сих пор им не воспользовался!
	AI_Output(self,other,"DIA_Gorn_LI_BringFoodBeginEnd_Special_00_03");	//Вот, возьми его.
	B_GiveInvItems(self,other,ItPo_Perm_STR,1);
	AI_Output(self,other,"DIA_Gorn_LI_BringFoodBeginEnd_Special_00_05");	//А теперь я начну набивать свой желудок этим вкусным мясом!
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(pc_fighter_li,"EatMeat");
};


instance DIA_GORN_LI_HALLO(C_Info)
{
	npc = pc_fighter_li;
	nr = 2;
	condition = dia_gorn_li_hallo_condition;
	information = dia_gorn_li_hallo_info;
	permanent = TRUE;
	description = "Теперь все в порядке?";
};


func int dia_gorn_li_hallo_condition()
{
	if(Npc_KnowsInfo(hero,dia_gorn_li_bringfoodbeginend))
	{
		return TRUE;
	};
};

func void dia_gorn_li_hallo_info()
{
	AI_Output(other,self,"DIA_Gorn_DI_Hallo_00_00");	//Теперь все в порядке?
	AI_Output(self,other,"DIA_Gorn_DI_Hallo_00_01");	//Вроде да...(невесело) По крайней мере, я теперь сыт.
	AI_Output(self,other,"DIA_Gorn_DI_Hallo_00_03");	//Но здесь чертовски скучно, приятель! У меня уже руки от безделия чешутся.
};


instance DIA_FIGHTER_LI_MISSMYGOLD(C_Info)
{
	npc = pc_fighter_li;
	nr = 2;
	condition = dia_fighter_li_missmygold_condition;
	information = dia_fighter_li_missmygold_info;
	permanent = FALSE;
	description = "Куда подевалось мое золото?";
};


func int dia_fighter_li_missmygold_condition()
{
	if((BEGINGOLDSEEK == TRUE) && (MIS_MISSMYGOLD == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_fighter_li_missmygold_info()
{
	AI_Output(other,self,"DIA_Fighter_LI_MissMyGold_01_01");	//Куда подевалось мое золото?
	AI_Output(self,other,"DIA_Fighter_LI_MissMyGold_01_04");	//Я... я тут не причем! Лучше спроси об этом у других парней.
	GORNTELLNONEABOUTGOLD = TRUE;
	B_LogEntry(TOPIC_MISSMYGOLD,"Горн сказал, что ничего не знает о пропаже моего золота.");
};


instance DIA_FIGHTER_LI_AWAY(C_Info)
{
	npc = pc_fighter_li;
	nr = 3;
	condition = dia_fighter_li_away_condition;
	information = dia_fighter_li_away_info;
	permanent = FALSE;
	description = "Пора возвращаться на корабль.";
};


func int dia_fighter_li_away_condition()
{
	if((MIS_GATHERCREW == LOG_Running) && (GORNLIONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_fighter_li_away_info()
{
	var int countpeopple;
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Fighter_LI_Away_01_01");	//Пора возвращаться на корабль.
	AI_Output(self,other,"DIA_Fighter_LI_Away_01_02");	//Это еще зачем?
	AI_Output(other,self,"DIA_Fighter_LI_Away_01_03");	//Мы закончили ремонт корабля и готовы к отплытию с острова.
	AI_Output(self,other,"DIA_Fighter_LI_Away_01_04");	//Наконец-то! А то я уж думал, что мы здесь навечно застряли.
	B_LogEntry(TOPIC_GATHERCREW,"Я сообщил Горну о том, что мы снимаемся с якоря. Он был в восторге от этой новости.");
	GORNLIONBOARD = TRUE;
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


instance DIA_FIGHTER_LI_FINDMAGICORECAVE(C_Info)
{
	npc = pc_fighter_li;
	nr = 2;
	condition = dia_fighter_li_findmagicorecave_condition;
	information = dia_fighter_li_findmagicorecave_info;
	permanent = FALSE;
	description = "Я нашел пещеру с залежами магической руды.";
};


func int dia_fighter_li_findmagicorecave_condition()
{
	if((MIS_FINDMAGICORECAVE == LOG_Running) && (LIBEFORETESTOK == FALSE) && (LITESTOK == FALSE) && (GOTOORECAPITAN == FALSE))
	{
		return TRUE;
	};
};

func void dia_fighter_li_findmagicorecave_info()
{
	AI_Output(other,self,"DIA_Fighter_LI_FindMagicOreCave_01_01");	//Я нашел пещеру с залежами магической руды.
	AI_Output(self,other,"DIA_Fighter_LI_FindMagicOreCave_01_02");	//Правда? Тогда тебе стоит поговорить об этом с нашим капитаном.
	AI_Output(self,other,"DIA_Fighter_LI_FindMagicOreCave_01_03");	//Думаю, ему будет интересно услышать эту новость.
	GOTOORECAPITAN = TRUE;
};


instance DIA_FIGHTER_LI_CHANGECOURSE(C_Info)
{
	npc = pc_fighter_li;
	nr = 2;
	condition = dia_fighter_li_changecourse_condition;
	information = dia_fighter_li_changecourse_info;
	permanent = FALSE;
	description = "Нам надо вернуться в Хоринис.";
};


func int dia_fighter_li_changecourse_condition()
{
	if(MIS_CHANGECOURSE == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_fighter_li_changecourse_info()
{
	AI_Output(other,self,"DIA_Fighter_LI_ChangeCourse_01_00");	//Нам надо вернуться в Хоринис.
	AI_Output(self,other,"DIA_Fighter_LI_ChangeCourse_01_01");	//Парень, что ты задумал?
	Info_ClearChoices(dia_fighter_li_changecourse);
	Info_AddChoice(dia_fighter_li_changecourse,"Я хочу сообщить паладинам о залежах руды на острове.",dia_fighter_li_changecourse_ore);
	Info_AddChoice(dia_fighter_li_changecourse,"Дело касается золота.",dia_fighter_li_changecourse_gold);
};

func void dia_fighter_li_changecourse_ore()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Fighter_LI_ChangeCourse_Ore_01_01");	//Мы должны помочь паладинам! Необходимо сообщить им о магической руде, что мы нашли на этом острове.
	AI_Output(other,self,"DIA_Fighter_LI_ChangeCourse_Ore_01_04");	//Эта руда даст им хоть какой-то шанс в войне против орков.
	AI_Output(self,other,"DIA_Fighter_LI_ChangeCourse_Ore_01_05");	//Хммм. Если честно, приятель, то по мне из этой затеи ничего путного не выйдет!
	AI_Output(self,other,"DIA_Fighter_LI_ChangeCourse_Ore_01_07");	//Паладины все равно навряд ли смогут выиграть войну. Слишком уж не равны силы!
	AI_Output(self,other,"DIA_Fighter_LI_ChangeCourse_Ore_01_08");	//К тому же, если мы решим вернуться обратно в Хоринис, то нам самим наверняка придется иметь дело с теми же орками.
	AI_Output(self,other,"DIA_Fighter_LI_ChangeCourse_Ore_01_09");	//Не думаю, что за время нашего отсутствия ситуация там сильно изменилась.
	AI_Output(other,self,"DIA_Fighter_LI_ChangeCourse_Ore_01_11");	//А ты что, боишься орков?
	AI_Output(self,other,"DIA_Fighter_LI_ChangeCourse_Ore_01_12");	//(возмущенно) Еще чего! Да, я с радостью бы прикончил пару десятков этих тварей!
	AI_Output(self,other,"DIA_Fighter_LI_ChangeCourse_Ore_01_13");	//И так уже давно руки чешутся, чтобы вновь покрепче ухватиться за свой топор.
	AI_Output(self,other,"DIA_Fighter_LI_ChangeCourse_Ore_01_15");	//Эх, ладно...(ворчливо) Я с тобой!
	B_LogEntry(TOPIC_CHANGECOURSE,"Горна удивило мое предложение вернуться в Хоринис, чтобы сообщить паладинам о магической руде, однако в конце концов он поддержал меня.");
	CREWAGREEAWAYBACKPAL = CREWAGREEAWAYBACKPAL + 1;
	COUNTPEOPLEDECIDEPRG = COUNTPEOPLEDECIDEPRG + 1;
	if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
	{
		READYCHANGECOURSE = TRUE;
		Log_AddEntry(TOPIC_CHANGECOURSE,"Кажется, я поговорил со всеми парнями. Пора сообщить об этом нашему капитану.");
	};
	Info_ClearChoices(dia_fighter_li_changecourse);
};

func void dia_fighter_li_changecourse_gold()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_Fighter_LI_ChangeCourse_Gold_01_01");	//Дело касается золота.
	AI_Output(self,other,"DIA_Fighter_LI_ChangeCourse_Gold_01_02");	//Ну, если такое дело, то тогда я в любом случае с тобой. Лишнее золото никогда не помешает!
	AI_Output(self,other,"DIA_Fighter_LI_ChangeCourse_Gold_01_03");	//Да и орков я давно не рубил! Руки так уже и чешутся, чтобы вновь покрепче ухватиться за свой топор.
	B_LogEntry(TOPIC_CHANGECOURSE,"Горн согласен отправиться обратно в Хоринис. Как и все наемники, он очень любит золото.");
	CREWAGREEAWAYBACKPAL = CREWAGREEAWAYBACKSELL + 1;
	COUNTPEOPLEDECIDEPRG = COUNTPEOPLEDECIDEPRG + 1;
	if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
	{
		READYCHANGECOURSE = TRUE;
		Log_AddEntry(TOPIC_CHANGECOURSE,"Кажется, я поговорил со всеми парнями. Пора сообщить об этом нашему капитану.");
	};
	Info_ClearChoices(dia_fighter_li_changecourse);
};

