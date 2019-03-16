
instance DIA_Dragomir_EXIT(C_Info)
{
	npc = BAU_983_Dragomir;
	nr = 999;
	condition = DIA_Dragomir_EXIT_Condition;
	information = DIA_Dragomir_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Dragomir_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Dragomir_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Dragomir_Hello(C_Info)
{
	npc = BAU_983_Dragomir;
	nr = 1;
	condition = DIA_Dragomir_Hello_Condition;
	information = DIA_Dragomir_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Dragomir_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Dragomir_Hello_Info()
{
	var C_Item itm;
	itm = Npc_GetEquippedArmor(other);
	if((Hlp_IsItem(itm,ITAR_Leather_L) == TRUE) || (HEROISHUNTER == TRUE))
	{
		AI_Output(self,other,"DIA_Dragomir_Hello_12_00");	//Путешествуешь так далеко от дома?
		AI_Output(self,other,"DIA_Dragomir_Hello_12_01");	//Здесь тебе не помещает осторожность, особенно когда ты совсем один.
	}
	else
	{
		AI_Output(self,other,"DIA_Dragomir_Hello_01_00");	//Кто впустил ТЕБЯ?
		AI_Output(self,other,"DIA_Dragomir_Hello_01_01");	//И какого черта ты здесь делаешь?
		AI_Output(other,self,"DIA_Dragomir_Hello_01_02");	//Просто зашел посмотреть.
		AI_Output(self,other,"DIA_Dragomir_Hello_01_03");	//Очень смешно.
	};
};


instance DIA_Dragomir_OutHere(C_Info)
{
	npc = BAU_983_Dragomir;
	nr = 2;
	condition = DIA_Dragomir_OutHere_Condition;
	information = DIA_Dragomir_OutHere_Info;
	permanent = FALSE;
	description = "Кто ты?";
};


func int DIA_Dragomir_OutHere_Condition()
{
	return TRUE;
};

func void DIA_Dragomir_OutHere_Info()
{
	var C_Item itm;
	itm = Npc_GetEquippedArmor(other);
	if((Hlp_IsItem(itm,ITAR_Leather_L) == TRUE) || (HEROISHUNTER == TRUE))
	{
		AI_Output(other,self,"DIA_Dragomir_OutHere_01_00");	//Кто ты?
		AI_Output(self,other,"DIA_Dragomir_OutHere_01_01");	//Я - охотник! (смеется) Разве это незаметно?
		AI_Output(self,other,"DIA_Dragomir_OutHere_01_02");	//Ну, а здесь, как видишь, наш лагерь - отличное местечко для парней вроде нас.
	}
	else
	{
		AI_Output(other,self,"DIA_Dragomir_OutHere_01_03");	//Кто ты?
		AI_Output(self,other,"DIA_Dragomir_OutHere_01_04");	//А по-твоему, на кого я похож? Не думаю, что на клоуна. (раздраженно)
		AI_Output(self,other,"DIA_Dragomir_OutHere_01_05");	//Так что прекрати задавать свои глупые вопросы, и оставь меня в покое.
		AI_StopProcessInfos(self);
	};
};


instance DIA_Dragomir_Settlers(C_Info)
{
	npc = BAU_983_Dragomir;
	nr = 1;
	condition = DIA_Dragomir_Settlers_Condition;
	information = DIA_Dragomir_Settlers_Info;
	permanent = FALSE;
	description = "И как тебе быть охотником?";
};


func int DIA_Dragomir_Settlers_Condition()
{
	if((HEROISHUNTER == TRUE) && Npc_KnowsInfo(other,DIA_Dragomir_OutHere))
	{
		return TRUE;
	};
};

func void DIA_Dragomir_Settlers_Info()
{
	AI_Output(other,self,"DIA_Dragomir_Settlers_01_00");	//И как тебе быть охотником?
	AI_Output(self,other,"DIA_Dragomir_Settlers_01_01");	//Вполне сносно, тем более в компании этих ребят, что ты видишь вокруг себя.
	AI_Output(self,other,"DIA_Dragomir_Settlers_01_02");	//Здесь тихо и спокойно.
	DRAGOMIRCANGIVEQUEST = TRUE;
};


instance DIA_Dragomir_Dangerous(C_Info)
{
	npc = BAU_983_Dragomir;
	nr = 2;
	condition = DIA_Dragomir_Dangerous_Condition;
	information = DIA_Dragomir_Dangerous_Info;
	permanent = FALSE;
	description = "Разве здесь в лесу не опасно?";
};


func int DIA_Dragomir_Dangerous_Condition()
{
	if((HEROISHUNTER == TRUE) && (DRAGOMIRCANGIVEQUEST == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Dragomir_Dangerous_Info()
{
	AI_Output(other,self,"DIA_Dragomir_Dangerous_15_00");	//А разве здесь не опасно?
	AI_Output(self,other,"DIA_Dragomir_Dangerous_12_01");	//Ну... Не очень, если ты можешь постоять за себя. Мой арбалет уже неоднократно спасал меня.
	AI_Output(other,self,"DIA_Dragomir_Dangerous_15_02");	//Хм. Он не такой уж большой.
	AI_Output(self,other,"DIA_Dragomir_Dangerous_12_03");	//Но смертоносный, если ты знаешь, как обращаться с ним. Да, у меня был арбалет побольше. Но, к сожалению, я потерял его.
	AI_Output(self,other,"DIA_Dragomir_Dangerous_12_04");	//Я забрел слишком далеко на север, в горы. Там находится большой каменный круг с жертвенным алтарем.
	AI_Output(self,other,"DIA_Dragomir_Dangerous_12_05");	//Пока я охотился там на падальщиков, из леса выбежали эти чертовы скелеты и напали на меня.
	AI_Output(self,other,"DIA_Dragomir_Dangerous_12_06");	//Мне пришлось бежать со всех ног.
	AI_Output(self,other,"DIA_Dragomir_Dangerous_12_07");	//А когда я бежал, арбалет выскользнул из моей руки. Я думаю, он все еще лежит там, у этого странного круга на севере.
	MIS_DragomirsArmbrust = LOG_Running;
	Log_CreateTopic(TOPIC_DragomirsArmbrust,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DragomirsArmbrust,LOG_Running);
	B_LogEntry(TOPIC_DragomirsArmbrust,"Драгомир потерял свой арбалет где-то у странного камня в высоких северных горах.");
};


instance DIA_Dragomir_Armbrust(C_Info)
{
	npc = BAU_983_Dragomir;
	nr = 2;
	condition = DIA_Dragomir_Armbrust_Condition;
	information = DIA_Dragomir_Armbrust_Info;
	permanent = FALSE;
	description = "Вот, я нашел твой арбалет.";
};


func int DIA_Dragomir_Armbrust_Condition()
{
	if((MIS_DragomirsArmbrust == LOG_Running) && Npc_HasItems(other,ItRw_DragomirsArmbrust_MIS))
	{
		return TRUE;
	};
};

func void DIA_Dragomir_Armbrust_Info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Dragomir_Armbrust_15_00");	//Вот, я нашел твой арбалет.
	B_GiveInvItems(other,self,ItRw_DragomirsArmbrust_MIS,1);
	AI_Output(self,other,"DIA_Dragomir_Armbrust_12_01");	//Точно, это мой арбалет. Только не говори мне, что ты ходил к этому каменному кругу.
	AI_Output(other,self,"DIA_Dragomir_Armbrust_15_02");	//А что в этом такого?
	AI_Output(self,other,"DIA_Dragomir_Armbrust_12_03");	//Это было очень безрассудно с твоей стороны. Но все равно, спасибо.
	AI_Output(self,other,"DIA_Dragomir_Armbrust_12_05");	//Охотник в наше время не пример состоятельности, и я даже не знаю, чем тебя отблагодарить.
	AI_Output(self,other,"DIA_Dragomir_Armbrust_12_06");	//Хотя... вот, возьми эту старую книгу.
	B_GiveInvItems(self,other,ITWR_CBOW_T1,1);
	AI_Output(self,other,"DIA_Dragomir_Armbrust_12_07");	//Надеюсь, ты что-то почерпнешь из нее - я почерпнул многое.
	MIS_DragomirsArmbrust = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_DragomirsArmbrust,LOG_SUCCESS);
	B_LogEntry(TOPIC_DragomirsArmbrust,"Я вернул Драгомиру потерянный им арбалет.");
};

var int Dragomir_TeachPlayer;
const int Dragomir_TeachingCost = 150;

instance DIA_Dragomir_Learn(C_Info)
{
	npc = BAU_983_Dragomir;
	nr = 2;
	condition = DIA_Dragomir_Learn_Condition;
	information = DIA_Dragomir_Learn_Info;
	permanent = TRUE;
	description = "Ты можешь научить меня чему-нибудь?";
};

func int DIA_Dragomir_Learn_Condition()
{
	if((MIS_DragomirsArmbrust == LOG_SUCCESS) && (Dragomir_TeachPlayer == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Dragomir_Learn_Info()
{
	AI_Output(other,self,"DIA_Dragomir_Learn_15_00");	//Ты можешь научить меня чему-нибудь?
	AI_Output(self,other,"DIA_Dragomir_Learn_12_02");	//Если ты можешь заплатить. Как я уже говорил, я сейчас немного стеснен в средствах.
	AI_Output(other,self,"DIA_Dragomir_Learn_15_03");	//Сколько ты хочешь?
	B_Say_Gold(self,other,Dragomir_TeachingCost);
	Log_CreateTopic(TOPIC_HUNTERTEACHERS,LOG_NOTE);
	Log_AddEntry(TOPIC_HUNTERTEACHERS,"Драгомир научит меня стрельбе из арбалета.");
	Info_ClearChoices(DIA_Dragomir_Learn);
	Info_AddChoice(DIA_Dragomir_Learn,"Возможно, позже.",DIA_Dragomir_Learn_Later);

	if(Npc_HasItems(other,ItMi_Gold) >= Dragomir_TeachingCost)
	{
		Info_AddChoice(DIA_Dragomir_Learn,"По рукам! Покажи, как нужно с ним обращаться.",DIA_Dragomir_Learn_Here);
	};
};

func void DIA_Dragomir_Learn_Later()
{
	AI_Output(other,self,"DIA_Dragomir_Learn_Later_15_00");	//Возможно, позже.
	Info_ClearChoices(DIA_Dragomir_Learn);
};

func void DIA_Dragomir_Learn_Here()
{
	AI_Output(other,self,"DIA_Dragomir_Learn_Here_15_01");	//По рукам! Покажи, как нужно с ним обращаться.
	B_GiveInvItems(other,self,ItMi_Gold,Dragomir_TeachingCost);
	AI_Output(self,other,"DIA_Dragomir_Learn_Here_12_01");	//Хорошо, мы можем начать хоть сейчас.
	Dragomir_TeachPlayer = TRUE;
	Info_ClearChoices(DIA_Dragomir_Learn);
};

var int DIA_Dragomir_Teach_permanent;

instance DIA_Dragomir_Teach(C_Info)
{
	npc = BAU_983_Dragomir;
	nr = 2;
	condition = DIA_Dragomir_Teach_Condition;
	information = DIA_Dragomir_Teach_Info;
	permanent = TRUE;
	description = "Покажи мне, как стрелять из арбалета.";
};

func int DIA_Dragomir_Teach_Condition()
{
	if((Dragomir_TeachPlayer == TRUE) && (DIA_Dragomir_Teach_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Dragomir_Teach_Info()
{
	AI_Output(other,self,"DIA_Dragomir_Teach_15_01");	//Покажи мне, как стрелять из арбалета.
	Info_ClearChoices(DIA_Dragomir_Teach);
	Info_AddChoice(DIA_Dragomir_Teach,Dialog_Back,DIA_Dragomir_Teach_Back);
	Info_AddChoice(DIA_Dragomir_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),dia_dragomir_teach_crossbow_1);
	Info_AddChoice(DIA_Dragomir_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1) * 5),dia_dragomir_teach_crossbow_5);
};

func void DIA_Dragomir_Teach_Back()
{
	if(other.HitChance[NPC_TALENT_CROSSBOW] >= 75)
	{
		AI_Output(self,other,"DIA_Dragomir_Teach_12_00");	//Я больше ничему не могу научить тебя. Тебе стоит поискать другого учителя.
		DIA_Dragomir_Teach_permanent = TRUE;
	};
	Info_ClearChoices(DIA_Dragomir_Teach);
};

func void dia_dragomir_teach_crossbow_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,1,75))
	{
		if(DRAGOMIRTEACHFT == FALSE)
		{
			AI_Output(self,other,"DIA_Dragomir_Teach_CrossBow_1_01_01");	//Ладно, начнем.
			AI_Output(self,other,"DIA_Dragomir_Teach_CrossBow_1_01_02");	//Ты берешься за рукоятку и упираешь ее в плечо. Это поможет тебе лучше прицелиться.
			AI_Output(self,other,"DIA_Dragomir_Teach_CrossBow_1_01_03");	//Первые несколько дней тебе будет казаться, что плечо вот-вот отвалится.
			AI_Output(self,other,"DIA_Dragomir_Teach_CrossBow_1_01_04");	//Но через неделю оно будет как камень!
			AI_Output(self,other,"DIA_Dragomir_Teach_CrossBow_1_01_05");	//Наводи точно на цель и оттягивай стрелу назад. Она полетит куда сильнее, чем из лука, а значит, нанесет больший урон!
			DRAGOMIRTEACHFT = TRUE;
		};
		if((DRAGOMIRTEACHST == FALSE) && (other.HitChance[NPC_TALENT_CROSSBOW] >= 60))
		{
			AI_Output(other,self,"DIA_Dragomir_Teach_CrossBow_1_01_06");	//Расскажи мне еще что-нибудь об арбалете.
			AI_Output(self,other,"DIA_Dragomir_Teach_CrossBow_1_01_07");	//Ладно. Выстрелы будут более точными, если перед стрельбой ты немного присядешь.
			AI_Output(self,other,"DIA_Dragomir_Teach_CrossBow_1_01_08");	//Тебе предстоит научиться рассчитывать скорость, с которой движется цель.
			AI_Output(self,other,"DIA_Dragomir_Teach_CrossBow_1_01_09");	//Выпускай стрелу с должным упреждением по пути движущейся цели, чтобы замедлить или остановить ее.
			AI_Output(self,other,"DIA_Dragomir_Teach_CrossBow_1_01_10");	//Если целей несколько, не трать зря времени - снимай их одну за другой непрерывной серией выстрелов.
			DRAGOMIRTEACHST = TRUE;
		};
		Info_ClearChoices(DIA_Dragomir_Teach);
		Info_AddChoice(DIA_Dragomir_Teach,Dialog_Back,DIA_Dragomir_Teach_Back);
		Info_AddChoice(DIA_Dragomir_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),dia_dragomir_teach_crossbow_1);
		Info_AddChoice(DIA_Dragomir_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1) * 5),dia_dragomir_teach_crossbow_5);
	};
};

func void dia_dragomir_teach_crossbow_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,5,75))
	{
		if(DRAGOMIRTEACHFT == FALSE)
		{
			AI_Output(self,other,"DIA_Dragomir_Teach_CrossBow_5_01_01");	//Ладно, начнем.
			AI_Output(self,other,"DIA_Dragomir_Teach_CrossBow_5_01_02");	//Ты берешься за рукоятку и упираешь ее в плечо. Это поможет тебе лучше прицелиться.
			AI_Output(self,other,"DIA_Dragomir_Teach_CrossBow_5_01_03");	//Первые несколько дней тебе будет казаться, что плечо вот-вот отвалится.
			AI_Output(self,other,"DIA_Dragomir_Teach_CrossBow_5_01_04");	//Но через неделю оно будет как камень!
			AI_Output(self,other,"DIA_Dragomir_Teach_CrossBow_5_01_05");	//Наводи точно на цель и оттягивай стрелу назад. Она полетит куда сильнее, чем из лука, а значит, нанесет больший урон!
			DRAGOMIRTEACHFT = TRUE;
		};
		if((DRAGOMIRTEACHST == FALSE) && (other.HitChance[NPC_TALENT_CROSSBOW] >= 60))
		{
			AI_Output(other,self,"DIA_Dragomir_Teach_CrossBow_5_01_06");	//Расскажи мне еще что-нибудь об арбалете.
			AI_Output(self,other,"DIA_Dragomir_Teach_CrossBow_5_01_07");	//Ладно. Выстрелы будут более точными, если перед стрельбой ты немного присядешь.
			AI_Output(self,other,"DIA_Dragomir_Teach_CrossBow_5_01_08");	//Тебе предстоит научиться рассчитывать скорость, с которой движется цель.
			AI_Output(self,other,"DIA_Dragomir_Teach_CrossBow_5_01_09");	//Выпускай стрелу с должным упреждением по пути движущейся цели, чтобы замедлить или остановить ее.
			AI_Output(self,other,"DIA_Dragomir_Teach_CrossBow_5_01_10");	//Если целей несколько, не трать зря времени - снимай их одну за другой непрерывной серией выстрелов.
			DRAGOMIRTEACHST = TRUE;
		};
		Info_ClearChoices(DIA_Dragomir_Teach);
		Info_AddChoice(DIA_Dragomir_Teach,Dialog_Back,DIA_Dragomir_Teach_Back);
		Info_AddChoice(DIA_Dragomir_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),dia_dragomir_teach_crossbow_1);
		Info_AddChoice(DIA_Dragomir_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1) * 5),dia_dragomir_teach_crossbow_5);
	};
};


instance DIA_Dragomir_PICKPOCKET(C_Info)
{
	npc = BAU_983_Dragomir;
	nr = 900;
	condition = DIA_Dragomir_PICKPOCKET_Condition;
	information = DIA_Dragomir_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Dragomir_PICKPOCKET_Condition()
{
	return C_Beklauen(47,70);
};

func void DIA_Dragomir_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Dragomir_PICKPOCKET);
	Info_AddChoice(DIA_Dragomir_PICKPOCKET,Dialog_Back,DIA_Dragomir_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Dragomir_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Dragomir_PICKPOCKET_DoIt);
};

func void DIA_Dragomir_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Dragomir_PICKPOCKET);
};

func void DIA_Dragomir_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Dragomir_PICKPOCKET);
};


instance DIA_DRAGOMIR_RESPECT(C_Info)
{
	npc = BAU_983_Dragomir;
	nr = 1;
	condition = dia_dragomir_respect_condition;
	information = dia_dragomir_respect_info;
	permanent = FALSE;
	description = "Ты проголосуешь за меня?";
};


func int dia_dragomir_respect_condition()
{
	if((CANHUNTERCHALLANGE == TRUE) && (MIS_HUNTERCHALLANGE == FALSE) && (DRAGOMIR_RESPECT == FALSE) && Npc_KnowsInfo(other,DIA_Dragomir_OutHere))
	{
		return TRUE;
	};
};

func void dia_dragomir_respect_info()
{
	AI_Output(other,self,"DIA_Dragomir_Respect_01_00");	//Ты проголосуешь за меня?
	AI_Output(self,other,"DIA_Dragomir_Respect_01_01");	//А причина?
	AI_Output(other,self,"DIA_Dragomir_Respect_01_02");	//Хочу бросить Фальку вызов - потягаться с ним в искусстве охоты.
	AI_Output(self,other,"DIA_Dragomir_Respect_01_03");	//Ты? Фальку? Веришь, что сможешь взять над ним верх в деле, в котором он много опытнее тебя?
	AI_Output(other,self,"DIA_Dragomir_Respect_01_06");	//Я попробую. Так ты поможешь мне?
	AI_Output(self,other,"DIA_Dragomir_Respect_01_07");	//Ладно, помогу - мне это не сложно.
	AI_Output(self,other,"DIA_Dragomir_Respect_01_08");	//Но для начала докажи мне, что ты действительно чего-то стоишь в нашем деле.
	AI_Output(self,other,"DIA_Dragomir_Respect_01_09");	//А то на словах у нас все великие охотники.
	AI_Output(other,self,"DIA_Dragomir_Respect_01_10");	//И что именно ты хочешь, чтобы я доказал?
	AI_Output(self,other,"DIA_Dragomir_Respect_01_11");	//Ну, хотя бы то, что ты неплохой стрелок.
	AI_Output(self,other,"DIA_Dragomir_Respect_01_12");	//Ведь без этого навыка ты, скорее всего, легкая добыча для зверей, а не охотник.
	AI_Output(self,other,"DIA_Dragomir_Respect_01_13");	//Я, конечно, не особо хорошо разбираюсь в технике стрельбы из лука, но вполне могу определить, насколько ты хорош в стрельбе из арбалета.
	AI_Output(other,self,"DIA_Dragomir_Respect_01_14");	//И кого я должен подстрелить для тебя?
	AI_Output(self,other,"DIA_Dragomir_Respect_01_15");	//Никого! Просто покажи мне, как хорошо ты с ним обращаешься. Этого будет вполне достаточно.
	AI_Output(other,self,"DIA_Dragomir_Respect_01_16");	//Хорошо. Почему бы и нет?
	if(other.HitChance[NPC_TALENT_CROSSBOW] >= 55)
	{
		B_GivePlayerXP(100);
		AI_Output(self,other,"DIA_Dragomir_Respect_01_17");	//Хммм...(с уважением) Вижу, что достаточно неплохо. Ты произвел на меня впечатление.
		AI_Output(other,self,"DIA_Dragomir_Respect_01_18");	//Значит ли это, что теперь я могу рассчитывать на твой голос?
		AI_Output(self,other,"DIA_Dragomir_Respect_01_19");	//Конечно! Такой хороший стрелок просто не может быть плохим охотником.
		AI_Output(self,other,"DIA_Dragomir_Respect_01_20");	//Так что я за тебя.
		AI_Output(other,self,"DIA_Dragomir_Respect_01_21");	//Спасибо.
		DRAGOMIR_RESPECT = TRUE;
		B_LogEntry(TOPIC_HUNTERSWORK,"Я смог произвести на Драгомира впечатление своим умением стрельбы из арбалета, и теперь он поддержит меня в споре с Фальком.");
		HUNTCHALLENGECOUNT = HUNTCHALLENGECOUNT + 1;
	}
	else
	{
		AI_Output(self,other,"DIA_Dragomir_Respect_01_22");	//Хммм... Вижу, что совсем неважно.
		AI_Output(self,other,"DIA_Dragomir_Respect_01_23");	//Нет, парень - с такой стрельбой тебе на охоте делать нечего.
		AI_Output(self,other,"DIA_Dragomir_Respect_01_24");	//Так что, если хочешь произвести на меня впечатление и тем самым завоевать мое уважение, - лучше иди тренируйся.
		AI_Output(self,other,"DIA_Dragomir_Respect_01_25");	//А там посмотрим.
	};
};


instance DIA_DRAGOMIR_RESPECTDONE(C_Info)
{
	npc = BAU_983_Dragomir;
	nr = 1;
	condition = dia_dragomir_respectdone_condition;
	information = dia_dragomir_respectdone_info;
	permanent = TRUE;
	description = "Как тебе теперь моя стрельба из арбалета?";
};


func int dia_dragomir_respectdone_condition()
{
	if(Npc_KnowsInfo(other,dia_dragomir_respect) && (CANHUNTERCHALLANGE == TRUE) && (DRAGOMIR_RESPECT == FALSE) && (MIS_HUNTERCHALLANGE == FALSE))
	{
		return TRUE;
	};
};

func void dia_dragomir_respectdone_info()
{
	AI_Output(other,self,"DIA_Dragomir_RespectDone_01_00");	//Как тебе теперь моя стрельба из арбалета?
	AI_Output(self,other,"DIA_Dragomir_RespectDone_01_01");	//Хорошо, давай посмотрим.
	if(other.HitChance[NPC_TALENT_CROSSBOW] >= 55)
	{
		B_GivePlayerXP(100);
		AI_Output(self,other,"DIA_Dragomir_RespectDone_01_03");	//Хммм...(с уважением) Ну что же - вижу, что достаточно неплохо. Ты произвел на меня впечатление.
		AI_Output(other,self,"DIA_Dragomir_RespectDone_01_04");	//Значит ли это, что теперь я могу рассчитывать на твой голос?
		AI_Output(self,other,"DIA_Dragomir_RespectDone_01_05");	//Конечно! Такой хороший стрелок просто не может быть плохим охотником.
		AI_Output(self,other,"DIA_Dragomir_RespectDone_01_06");	//Так что я за тебя.
		AI_Output(other,self,"DIA_Dragomir_RespectDone_01_07");	//Спасибо.
		DRAGOMIR_RESPECT = TRUE;
		B_LogEntry(TOPIC_HUNTERSWORK,"Я смог произвести на Драгомира впечатление своим умением стрельбы из арбалета. И теперь он поддержит меня в споре с Фальком.");
		HUNTCHALLENGECOUNT = HUNTCHALLENGECOUNT + 1;
	}
	else
	{
		AI_Output(self,other,"DIA_Dragomir_RespectDone_01_08");	//Хммм... Ну и чем же ты хотел меня удивить?
		AI_Output(self,other,"DIA_Dragomir_RespectDone_01_09");	//Она все так же никуда не годится.
		AI_Output(self,other,"DIA_Dragomir_RespectDone_01_10");	//Если ты хочешь произвести на меня впечатление, тебе нужно научиться это делать куда лучше, чем сейчас.
		AI_Output(self,other,"DIA_Dragomir_RespectDone_01_11");	//Так что иди тренируйся.
	};
};

