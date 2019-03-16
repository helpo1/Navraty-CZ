
instance DIA_Grimes_EXIT(C_Info)
{
	npc = VLK_4111_Grimes;
	nr = 999;
	condition = DIA_Grimes_EXIT_Condition;
	information = DIA_Grimes_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


var int Grimes_First;

func int DIA_Grimes_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Grimes_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Grimes_Hallo(C_Info)
{
	npc = VLK_4111_Grimes;
	nr = 2;
	condition = DIA_Grimes_Hallo_Condition;
	information = DIA_Grimes_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Grimes_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Grimes_Hallo_Info()
{
	AI_Output(self,other,"DIA_Grimes_Hallo_05_00");	//Ты? Кто бы мог подумать, что мы опять свидимся!
	AI_Output(self,other,"DIA_Grimes_Hallo_05_01");	//Похоже, мы оба умеем выживать, но, как видишь, я застрял в этой шахте.
	if(Grimes_First == FALSE)
	{
		Wld_InsertNpc(DragonSnapper,"OW_PATH_148_A");
		Wld_InsertNpc(DragonSnapper,"OW_PATH_146");
		Wld_InsertNpc(DragonSnapper,"OW_PATH_147");
		Wld_InsertNpc(DragonSnapper,"OW_PATH_148");
		Wld_InsertNpc(DragonSnapper,"OW_PATH_264");
		Grimes_First = TRUE;
	};
};


instance DIA_Grimes_Erz(C_Info)
{
	npc = VLK_4111_Grimes;
	nr = 2;
	condition = DIA_Grimes_Erz_Condition;
	information = DIA_Grimes_Erz_Info;
	permanent = FALSE;
	description = "Сколько руды вам удалось добыть?";
};


func int DIA_Grimes_Erz_Condition()
{
	if((Kapitel == 2) && (MIS_ScoutMine == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Grimes_Erz_Info()
{
	AI_Output(other,self,"DIA_Grimes_Erz_15_00");	//Сколько руды вам удалось добыть?
	AI_Output(self,other,"DIA_Grimes_Erz_05_01");	//Несколько ящиков. Но их здесь уже нет.
	AI_Output(self,other,"DIA_Grimes_Erz_05_02");	//Паладин Маркос решил отправить руду в замок, так как нас все время атаковали орки.
};


instance DIA_Grimes_Weg(C_Info)
{
	npc = VLK_4111_Grimes;
	nr = 3;
	condition = DIA_Grimes_Weg_Condition;
	information = DIA_Grimes_Weg_Info;
	permanent = FALSE;
	description = "Ты знаешь, в каком направлении пошел Маркос?";
};


func int DIA_Grimes_Weg_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Grimes_Erz) && (Npc_KnowsInfo(other,DIA_Marcos_Garond) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Grimes_Weg_Info()
{
	AI_Output(other,self,"DIA_Grimes_Weg_15_00");	//Ты знаешь, в каком направлении пошел Маркос?
	AI_Output(self,other,"DIA_Grimes_Weg_05_01");	//Он не пошел прямой дорогой. Вместо этого он хотел пересечь реку там, где она замерзла.
	AI_Output(self,other,"DIA_Grimes_Weg_05_02");	//Он хотел пойти в обход и подойти к замку с запада.
};

instance DIA_Grimes_PERM(C_Info)
{
	npc = VLK_4111_Grimes;
	nr = 2;
	condition = DIA_Grimes_PERM_Condition;
	information = DIA_Grimes_PERM_Info;
	permanent = TRUE;
	description = "Как твоя работа?";
};


func int DIA_Grimes_PERM_Condition()
{
	if(Kapitel >= 2)
	{
		return TRUE;
	};
};

func void DIA_Grimes_PERM_Info()
{
	AI_Output(other,self,"DIA_Grimes_PERM_15_00");	//Как твоя работа?
	AI_Output(self,other,"DIA_Grimes_PERM_05_01");	//Эта скала ужасно твердая - она как будто не хочет отдавать нам руду.
};


instance DIA_Grimes_PICKPOCKET(C_Info)
{
	npc = VLK_4111_Grimes;
	nr = 900;
	condition = DIA_Grimes_PICKPOCKET_Condition;
	information = DIA_Grimes_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Grimes_PICKPOCKET_Condition()
{
	return C_Beklauen(43,21);
};

func void DIA_Grimes_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Grimes_PICKPOCKET);
	Info_AddChoice(DIA_Grimes_PICKPOCKET,Dialog_Back,DIA_Grimes_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Grimes_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Grimes_PICKPOCKET_DoIt);
};

func void DIA_Grimes_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Grimes_PICKPOCKET);
};

func void DIA_Grimes_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Grimes_PICKPOCKET);
};


instance DIA_GRIMES_KNOWABOUTERZHUNT(C_Info)
{
	npc = VLK_4111_Grimes;
	nr = 2;
	condition = dia_grimes_knowabouterzhunt_condition;
	information = dia_grimes_knowabouterzhunt_info;
	permanent = FALSE;
	description = "Ты что-нибудь знаешь о добыче руды?";
};


func int dia_grimes_knowabouterzhunt_condition()
{
	return TRUE;
};

func void dia_grimes_knowabouterzhunt_info()
{
	AI_Output(other,self,"DIA_Grimes_KnowAboutErzHunt_01_00");	//Ты что-нибудь знаешь о добыче руды?
	AI_Output(self,other,"DIA_Grimes_KnowAboutErzHunt_01_01");	//Я половину своей жизни только тем и занимаюсь, что добываю ее.
	AI_Output(other,self,"DIA_Grimes_KnowAboutErzHunt_01_03");	//Я хочу научиться добывать руду. Ты можешь мне помочь?
	AI_Output(self,other,"DIA_Grimes_KnowAboutErzHunt_01_04");	//Нет проблем. Я научу тебя всему, что знаю сам.
	if(ORE_TOPIC_EXIST == TRUE)
	{
		B_LogEntry(TOPIC_MAGICORE,"Граймс может научить меня добывать магическую руду из породы.");
	}
	else
	{
		Log_CreateTopic(TOPIC_MAGICORE,LOG_NOTE);
		B_LogEntry(TOPIC_MAGICORE,"Граймс может научить меня добывать магическую руду из породы.");
		ORE_TOPIC_EXIST = TRUE;
	};
};

instance DIA_GRIMES_LEARNABOUTERZHUNT(C_Info)
{
	npc = VLK_4111_Grimes;
	nr = 2;
	condition = dia_grimes_learnabouterzhunt_condition;
	information = dia_grimes_learnabouterzhunt_info;
	permanent = TRUE;
	description = "Научи меня добывать руду.";
};

func int dia_grimes_learnabouterzhunt_condition()
{
	if(Npc_KnowsInfo(other,dia_grimes_knowabouterzhunt) && (HERO_HACKCHANCEORE < 100))
	{
		return TRUE;
	};
};

func void dia_grimes_learnabouterzhunt_info()
{
	if(KNOWHOWPICKORE == TRUE)
	{
		AI_Output(other,self,"DIA_Grimes_LearnAboutErzHunt_01_0A");	//Расскажи мне больше о добыче руды.
	}
	else
	{
		AI_Output(other,self,"DIA_Grimes_LearnAboutErzHunt_01_00");	//Научи меня добывать руду.
	};

	Info_ClearChoices(dia_grimes_learnabouterzhunt);
	Info_AddChoice(dia_grimes_learnabouterzhunt,Dialog_Back,dia_grimes_learnabouterzhunt_Back);
	Info_AddChoice(dia_grimes_learnabouterzhunt,b_buildlearnstringforerzhunt("Добыча руды",B_GetLearnCostTalent(other,NPC_TALENT_ERZWORK,1)),dia_grimes_learnabouterzhunt_ERZWORK);
};

func void dia_grimes_learnabouterzhunt_Back()
{
	Info_ClearChoices(dia_grimes_learnabouterzhunt);
};

func void dia_grimes_learnabouterzhunt_ERZWORK()
{
	if(HERO_HACKCHANCEORE < 100)
	{
		if(b_teachplayertalenterzhunt(self,other,NPC_TALENT_ERZWORK))
		{
			if(GRIMESTEACHMOREORE == FALSE)
			{
				AI_Output(self,other,"DIA_Grimes_LearnAboutErzHunt_01_01");	//Хорошо! Слушай внимательно...
				AI_Output(self,other,"DIA_Grimes_LearnAboutErzHunt_01_02");	//Для начала тебе необходимо обзавестись хорошей киркой - это половина дела.
				AI_Output(self,other,"DIA_Grimes_LearnAboutErzHunt_01_03");	//Потом начинай обрабатывать найденную тобой рудную жилу.
				AI_Output(self,other,"DIA_Grimes_LearnAboutErzHunt_01_04");	//Бить надо не по краю породы, а точно в центр. Наноси один мощный удар, а после - несколько ударов послабее.
				AI_Output(self,other,"DIA_Grimes_LearnAboutErzHunt_01_05");	//Тем самым ты немного нарушишь структуру самородка, и при следующем сильном ударе какой-нибудь кусок от него обязательно отколется.
				AI_Output(self,other,"DIA_Grimes_LearnAboutErzHunt_01_06");	//А потом повторяй все заново...
				AI_Output(self,other,"DIA_Grimes_LearnAboutErzHunt_01_07");	//Это главное, что тебе нужно знать о добыче руды.
				GRIMESTEACHMOREORE = TRUE;
			}
			else
			{
				AI_Output(self,other,"DIA_Grimes_LearnAboutErzHunt_01_09");	//Ладно! Слушай внимательно...(рассказывает)
			};
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Grimes_LearnAboutErzHunt_01_10");	//Я научил тебя всему, что знаю. Дальше сам набирайся опыта, махая киркой.
	};

	Info_ClearChoices(dia_grimes_learnabouterzhunt);
};

var int grimes_einmal;
var int grimes_gratulation;

instance DIA_GRIMES_ELIGORPOTION(C_Info)
{
	npc = VLK_4111_Grimes;
	nr = 2;
	condition = dia_grimes_eligorpotion_condition;
	information = dia_grimes_eligorpotion_info;
	permanent = FALSE;
	description = "Что тебе известно об ограблении торговца Лютеро?";
};

func int dia_grimes_eligorpotion_condition()
{
	if(Npc_KnowsInfo(other,DIA_Grimes_Hallo) && (MIS_JORAHELP == LOG_Running) && (ZURISGIVEMETASKINFO == TRUE))
	{
		return TRUE;
	};
};

func void dia_grimes_eligorpotion_info()
{
	AI_Output(other,self,"DIA_Grimes_EligorPotion_01_00");	//Что тебе известно об ограблении торговца Лютеро?
	AI_Output(self,other,"DIA_Grimes_EligorPotion_01_01");	//(удивленно) Кого? О чем это ты говоришь?
	AI_Output(other,self,"DIA_Grimes_EligorPotion_01_03");	//Это произошло много лет назад.
	AI_Output(other,self,"DIA_Grimes_EligorPotion_01_04");	//Дело было громкое, и ты наверняка должен об этом что-нибудь помнить.
	AI_Output(self,other,"DIA_Grimes_EligorPotion_01_05");	//Хммм...(задумчиво) ну я...(вспоминает)
	AI_Output(self,other,"DIA_Grimes_EligorPotion_01_07");	//...ну да - кажется, я кое-что такое припоминаю. (прищуриваясь) Только тебе зачем это?
	AI_Output(other,self,"DIA_Grimes_EligorPotion_01_08");	//Ходили слухи, что ты был причастен к этому ограблению.
	AI_Output(self,other,"DIA_Grimes_EligorPotion_01_09");	//(удивленно) Я?
	AI_Output(self,other,"DIA_Grimes_EligorPotion_01_13");	//Я понятия не имею, кто грабанул того торговца!
	AI_Output(other,self,"DIA_Grimes_EligorPotion_01_14");	//То есть ты ничего не знаешь об этом?
	AI_Output(self,other,"DIA_Grimes_EligorPotion_01_15");	//(ехидно) Вообще ничего.
	AI_Output(self,other,"DIA_Grimes_EligorPotion_01_16");	//А даже если бы и знал что-то - с какой стати я должен тебе об этом рассказывать?
	Info_ClearChoices(dia_grimes_eligorpotion);
	Info_AddChoice(dia_grimes_eligorpotion,"Если ты не расскажешь, я убью тебя!",dia_grimes_eligorpotion_kill);

	if(RhetorikSkillValue[1] >= 30)
	{
		Info_AddChoice(dia_grimes_eligorpotion,"Сделай это по старой дружбе.",dia_grimes_eligorpotion_memory);
	};

	Info_AddChoice(dia_grimes_eligorpotion,"Я могу заплатить тебе за эту информацию.",dia_grimes_eligorpotion_money);
};

func void dia_grimes_eligorpotion_kill()
{
	CreateInvItems(self,itke_grimkey,1);
	AI_Output(other,self,"DIA_Grimes_EligorPotion_Kill_01_00");	//Если ты не расскажешь, я убью тебя!
	AI_Output(self,other,"DIA_Grimes_EligorPotion_Kill_01_01");	//Угрозы здесь не помогут, мой мальчик.
	AI_Output(self,other,"DIA_Grimes_EligorPotion_Kill_01_02");	//Я уже стар, и смертью меня испугать трудно.
	AI_Output(self,other,"DIA_Grimes_EligorPotion_Kill_01_03");	//А если внимательно осмотреться по сторонам, то и так станет понятно, что вряд ли мы выберемся отсюда живыми.
	B_LogEntry(TOPIC_JORAHELP,"Я поинтересовался у Граймса о деле, связанным с ограблением торговца Лютеро. Мне показалось, что он что-то знает об этом. Но, к сожалению, Граймс не стал посвящать меня в подробности, даже несмотря на то, что я угрожал ему расправой. Теперь мне нужно думать, что делать дальше.");
	AI_StopProcessInfos(self);
};

func void dia_grimes_eligorpotion_money()
{
	CreateInvItems(self,itke_grimkey,1);
	AI_Output(other,self,"DIA_Grimes_EligorPotion_Money_01_00");	//Я могу заплатить тебе за эту информацию.
	AI_Output(self,other,"DIA_Grimes_EligorPotion_Money_01_01");	//Э-хе-хе! И на что здесь я смогу потратить твои деньги?
	AI_Output(self,other,"DIA_Grimes_EligorPotion_Money_01_02");	//На новую кирку?
	AI_Output(self,other,"DIA_Grimes_EligorPotion_Money_01_04");	//Нет, парень. Деньги тут абсолютно бестолковая вещь.
	AI_Output(self,other,"DIA_Grimes_EligorPotion_Money_01_05");	//Да и к чему они мне? (печально) Я уже стар, и знаю, что здесь, в этой проклятой долине моя жизнь и закончится.
	AI_Output(self,other,"DIA_Grimes_EligorPotion_Money_01_06");	//Отсюда уже не выбраться - кругом только орды орков да ужасные твари, готовые всех нас сожрать!
	B_LogEntry(TOPIC_JORAHELP,"Я поинтересовался у Граймса о деле, связанным с ограблением торговца Лютеро. Мне показалось, что он что-то знает об этом. Но, к сожалению, Граймс не стал посвящать меня в подробности, даже несмотря на то, что я предложил ему золото за эту информацию. Теперь мне нужно думать, что делать дальше.");
	AI_StopProcessInfos(self);
};

func void dia_grimes_eligorpotion_memory()
{
	B_GivePlayerXP(500);
	CreateInvItems(self,itke_grimkey,1);
	AI_Output(other,self,"DIA_Grimes_EligorPotion_Memory_01_00");	//Сделай это по старой дружбе.
	AI_Output(other,self,"DIA_Grimes_EligorPotion_Memory_01_01");	//Мы же долгое время плыли с тобой в одной лодке, Граймс! Ты помнишь Старую шахту?
	AI_Output(other,self,"DIA_Grimes_EligorPotion_Memory_01_02");   //А жизнь в Старом лагере?
	AI_Output(self,other,"DIA_Grimes_EligorPotion_Memory_01_04");	//Эх... Ну ладно, что ты хочешь?
	AI_Output(other,self,"DIA_Grimes_EligorPotion_Memory_01_08");	//Расскажи, откуда ты знаешь об этом ограблении?
	AI_Output(self,other,"DIA_Grimes_EligorPotion_Memory_01_14");	//Хмм... Это было несколько лет назад. Однажды вечером я сидел в кабаке у Кардифа и подслушал разговор двух парней.
	AI_Output(self,other,"DIA_Grimes_EligorPotion_Memory_01_18");	//Они говорили, что у какого-то крупного торговца в верхнем квартале есть чем поживиться.
	AI_Output(self,other,"DIA_Grimes_EligorPotion_Memory_01_27");	//А на следующее утро я узнал, что в верхнем квартале города обокрали дом одного богача!
	AI_Output(other,self,"DIA_Grimes_EligorPotion_Memory_01_2F");	//М-да... Значит, тебе так и не удалось узнать имена тех людей, которые совершили это ограбление?
	AI_Output(self,other,"DIA_Grimes_EligorPotion_Memory_01_43");	//Ну, почему же. Через год я встретил одного из них в колонии. Его звали Руфус.
	AI_Output(self,other,"DIA_Grimes_EligorPotion_Memory_01_44");	//Он сказал, что это они ограбили дом богатого торговца и вынесли оттуда все, что только можно было вынести.
	AI_Output(self,other,"DIA_Grimes_EligorPotion_Memory_01_47");	//Более того, Руфус сказал, что одна из вещичек, которые они прихватили, стоила целое состояние!
	AI_Output(self,other,"DIA_Grimes_EligorPotion_Memory_01_51");	//Кажется, это был какой-то эликсир.
	AI_Output(self,other,"DIA_Grimes_EligorPotion_Memory_01_57");	//А потом произошел один случай...
	AI_Output(other,self,"DIA_Grimes_EligorPotion_Memory_01_59");	//Что за случай?
	AI_Output(self,other,"DIA_Grimes_EligorPotion_Memory_01_60");	//Как-то в заброшенной шахте в одном из туннелей шахты начался обвал. Стражники поспешно начали выводить нас оттуда. Но тут Руфус отстал.
	AI_Output(self,other,"DIA_Grimes_EligorPotion_Memory_01_67");	//Мы увидели его, бегущего сквозь град падающих каменных глыб!
	AI_Output(self,other,"DIA_Grimes_EligorPotion_Memory_01_69");	//Он же почти достиг конца туннеля, когда один из падающих камней угодил ему прямо в голову. Он упал замертво.
	AI_Output(other,self,"DIA_Grimes_EligorPotion_Memory_01_76");	//А что стало с эликсиром Руфуса?
	AI_Output(self,other,"DIA_Grimes_EligorPotion_Memory_01_77");	//Его забрали охранники шахты и спрятали в своем сундуке, подальше от посторонних глаз.
	AI_Output(other,self,"DIA_Grimes_EligorPotion_Memory_01_81");	//Но насколько мне известно, в заброшенной шахте давно уже никто не работает.
	AI_Output(other,self,"DIA_Grimes_EligorPotion_Memory_01_82");	//Наверняка охранники забрали его перед тем, как оттуда уйти.
	AI_Output(self,other,"DIA_Grimes_EligorPotion_Memory_01_83");	//Не думаю, что у них тогда было время копаться в своем барахле.
	AI_Output(self,other,"DIA_Grimes_EligorPotion_Memory_01_84");	//(удивленно) Разве ты не знаешь, что там случилось?
	AI_Output(other,self,"DIA_Grimes_EligorPotion_Memory_01_85");	//Что ты имеешь в виду?
	AI_Output(self,other,"DIA_Grimes_EligorPotion_Memory_01_89");	//Однажды рудокопы наткнулись на одну необычную пещеру, спрятанную в скале.
	AI_Output(self,other,"DIA_Grimes_EligorPotion_Memory_01_92");	//Несколько рудокопов вместе с тремя охранниками отправились, чтобы осмотреть ту пещеру.
	AI_Output(self,other,"DIA_Grimes_EligorPotion_Memory_01_93");	//Оттуда доносились странные звуки, похожие на ужасающие стоны.
	AI_Output(self,other,"DIA_Grimes_EligorPotion_Memory_01_99");	//Та пещера просто кишела нежитью!
	AI_Output(self,other,"DIA_Grimes_EligorPotion_Memory_01_106");	//Там была настоящая кровавая бойня! Много народу погибло...
	AI_Output(self,other,"DIA_Grimes_EligorPotion_Memory_01_108");	//Я тогда был рядом и успел прихватить ключ, который валялся рядом с изуродованным телом одного охранника.
	AI_Output(other,self,"DIA_Grimes_EligorPotion_Memory_01_113");	//А ты можешь отдать мне этот ключ?
	AI_Output(self,other,"DIA_Grimes_EligorPotion_Memory_01_123");	//Зачем? Хотя ладно, дело твое. Но лучше держись подальше от того места.
	B_GiveInvItems(self,other,itke_grimkey,1);
	B_LogEntry(TOPIC_JORAHELP,"Я поинтересовался у Граймса о деле, связанным с ограблением торговца Лютеро. Мне показалось, что он что-то знает об этом, и я оказался прав! Граймс рассказал мне историю одного человека по имени Руфус. Он был одним из тех парней, что ограбили дом Лютеро. Потом Руфуса сослали в Долину на рудники. По словам Граймса, когда они оба были рудокопами и работали в заброшенной шахте, у Руфуса всегда при себе был один странный эликсир, который, как он сам говорил, был простым лекарством от кашля. Однако Руфус очень дорожил своим эликсиром - дорожил так, что отдал за него собственную жизнь! Похоже, этот пузырек с лекарством и есть тот самый эликсир, известный как Пламя Элигора.");
	Log_AddEntry(TOPIC_JORAHELP,"Граймс также поведал событиях, которые много лет назад произошли в заброшенной шахте. Рудокопы тогда наткнулись на скрытую в скале пещеру, которая просто кишела нежитью. Она и перебила практически всех обитателей шахты. Граймсу удалось выбраться из этого кошмара живым, да и к тому же, не с пустыми руками. Спасаясь бегством, он прихватил ключ, принадлежавший одному из охранников. Возможно, этот ключ поможет мне в поисках эликсира, следы которого обрываются в глубинах шахты. Однако мне стоит быть осторожнее, если я захочу наведаться туда.");
	GrimesCanEscape = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_GRIMES_POSSECCELIGORPOTION(C_Info)
{
	npc = VLK_4111_Grimes;
	nr = 2;
	condition = dia_grimes_possecceligorpotion_condition;
	information = dia_grimes_possecceligorpotion_info;
	permanent = FALSE;
	description = "Я был в заброшенной шахте.";
};

func int dia_grimes_possecceligorpotion_condition()
{
	if((MIS_JORAHELP == LOG_Running) && (Npc_HasItems(other,itpo_eligorfire) >= 1))
	{
		return TRUE;
	};
};

func void dia_grimes_possecceligorpotion_info()
{
	AI_Output(other,self,"DIA_Grimes_PosseccEligorPotion_01_00");	//Я был в заброшенной шахте.
	AI_Output(self,other,"DIA_Grimes_PosseccEligorPotion_01_01");	//(недоверчиво) Да ну? Не может быть...
	AI_Output(other,self,"DIA_Grimes_PosseccEligorPotion_01_02");	//Там я нашел вот этот эликсир. Узнаешь?
	AI_Output(self,other,"DIA_Grimes_PosseccEligorPotion_01_03");	//Невероятно. Это же то самое зелье Руфуса!
	AI_Output(self,other,"DIA_Grimes_PosseccEligorPotion_01_05");	//Да, парень... Смелости тебе не занимать.

	if(Npc_IsDead(demonlord_am))
	{
		B_GivePlayerXP(200);
		AI_Output(self,other,"DIA_Grimes_PosseccEligorPotion_01_07");	//Что ты там видел?
		AI_Output(other,self,"DIA_Grimes_PosseccEligorPotion_01_08");	//Там был демон, но я его прикончил.
		AI_Output(other,self,"DIA_Grimes_PosseccEligorPotion_01_09");	//В общем, как и всю ту нежить, что была в шахте.
		AI_Output(self,other,"DIA_Grimes_PosseccEligorPotion_01_15");	//Да, удивительный ты человек!
	}
	else
	{
		B_GivePlayerXP(50);
	};
};

instance DIA_GRIMES_LETSGETOUTSUGG(C_Info)
{
	npc = VLK_4111_Grimes;
	nr = 7;
	condition = dia_grimes_letsgetoutsugg_condition;
	information = dia_grimes_letsgetoutsugg_info;
	permanent = FALSE;
	description = "Ты не хотел бы выбраться из Долины Рудников?";
};

func int dia_grimes_letsgetoutsugg_condition()
{
	if((GrimesCanEscape == TRUE) && Npc_KnowsInfo(other,dia_viper_getminedata) && (HURRAYICANHIRE == TRUE))
	{
		return TRUE;
	};
};

func void dia_grimes_letsgetoutsugg_info()
{
	AI_Output(other,self,"DIA_GRIMES_LetsGetOutSugg_15_00");	//Ты не думал о том, чтобы выбраться из этой шахты и из Долины Рудников?
	AI_Output(self,other,"DIA_GRIMES_LetsGetOutSugg_01_01");	//Как же не думал. Да только толку от этого?
	AI_Output(self,other,"DIA_GRIMES_LetsGetOutSugg_01_02");	//Паладины меня никуда не пустят. И даже если я как-нибудь сумею мимо них проскользнуть, вокруг толпы орков.
	AI_Output(self,other,"DIA_GRIMES_LetsGetOutSugg_01_03");	//Я и двадцати минут снаружи не проживу. Так что нет, лучше я останусь здесь.
	AI_Output(other,self,"DIA_GRIMES_LetsGetOutSugg_15_04");	//Ясно. А если бы кто-то, кого ты знаешь, помог тебе выбраться отсюда?
	AI_Output(self,other,"DIA_GRIMES_LetsGetOutSugg_01_05");	//Ты? Но как ты сумеешь пробраться через орды орков, даже если забыть о паладинах?
	AI_Output(other,self,"DIA_GRIMES_LetsGetOutSugg_15_06");	//Так же, как и в предыдущие несколько раз.
	AI_Output(self,other,"DIA_GRIMES_LetsGetOutSugg_01_07");	//Хмм… хорошо, но зачем я тебе? Ты же не просто так хочешь помочь мне?
	AI_Output(other,self,"DIA_GRIMES_LetsGetOutSugg_15_08");	//Мне нужны люди, хорошо орудующие киркой. В Хоринисе, как оказалось, имеется немного магической руды.
	AI_Output(other,self,"DIA_GRIMES_LetsGetOutSugg_15_09");	//Сейчас я пытаюсь освоить это месторождение, но одному мне этого не сделать.
	AI_Output(other,self,"DIA_GRIMES_LetsGetOutSugg_15_10");	//Если коротко, я хочу, чтобы ты работал на меня.
	AI_Output(self,other,"DIA_GRIMES_LetsGetOutSugg_01_11");	//(Разочарованно) Опять шахта? Но чем твоя шахта лучше этой?
	AI_Output(other,self,"DIA_GRIMES_LetsGetOutSugg_15_12");	//Дай подумать...
	AI_Output(other,self,"DIA_GRIMES_LetsGetOutSugg_15_13");	//Вокруг нее не бродят орды орков, тебе не придется работать сутками, у тебя будет жилье и трехразовое питание.
	AI_Output(other,self,"DIA_GRIMES_LetsGetOutSugg_15_14");	//Краулеров там тоже больше нет.
	AI_Output(other,self,"DIA_GRIMES_LetsGetOutSugg_15_15");	//Ах да, добытая там руда совершенно точно пойдет на дело, а не будет валяться рядом с шахтой в ожидании, когда орки смогут забрать ее себе.
	AI_Output(self,other,"DIA_GRIMES_LetsGetOutSugg_01_16");	//Ну, если все это правда, то предлагаемые тобой условия работы будут получше, чем здесь.

	if(HuntyIsDead == FALSE)
	{
		AI_Output(self,other,"DIA_GRIMES_LetsGetOutSugg_01_17");	//Хорошо, я согласен. Но один я не пойду, ты должен захватить и моего приятеля.
		AI_Output(other,self,"DIA_GRIMES_LetsGetOutSugg_15_18");	//Нет проблем. Четыре руки всяко лучше двух.
	};

	AI_Output(self,other,"DIA_GRIMES_LetsGetOutSugg_01_19");	//Отлично. Тогда нам нужно для начала выбраться из шахты.	
	AI_Output(self,other,"DIA_GRIMES_LetsGetOutSugg_01_20");	//К сожалению, эти паладины вечно на карауле, просто так мимо них не проскользнуть...
	AI_Output(self,other,"DIA_GRIMES_LetsGetOutSugg_01_21");	//Хотя подожди. У меня есть идея! Я слышал о заклинании, способном усыплять человека.
	AI_Output(self,other,"DIA_GRIMES_LetsGetOutSugg_01_22");	//Если бы ты смог достать пару свитков...
	AI_Output(self,other,"DIA_GRIMES_LetsGetOutSugg_01_23");	//Кроме того, мне надо подготовиться. Дай мне денек, а потом возвращайся со свитками.
	GRIMESDAYDT = Wld_GetDay();
	AI_StopProcessInfos(self);
};

instance DIA_GRIMES_LETSGETOUTOFHERE(C_Info)
{
	npc = VLK_4111_Grimes;
	nr = 7;
	condition = dia_grimes_letsgetoutofhere_condition;
	information = dia_grimes_letsgetoutofhere_info;
	permanent = FALSE;
	description = "Я достал свитки. Собирайтесь.";
};

func int dia_grimes_letsgetoutofhere_condition()
{
	if(Npc_KnowsInfo(other,dia_grimes_letsgetoutsugg) && (GRIMESDAYDT < Wld_GetDay()) && (HURRAYICANHIRE == TRUE) && (Npc_HasItems(other,ItSc_Sleep) >= 2))
	{
		return TRUE;
	};
};

func void dia_grimes_letsgetoutofhere_info()
{
	AI_Output(other,self,"DIA_GRIMES_LetsGetOutOfHere_15_00");	//Я достал свитки. Собирайтесь.
	AI_Output(other,self,"DIA_GRIMES_LetsGetOutOfHere_15_01");	//Как только мы выберемся из этого лагеря, я проведу вас безопасным путем к Проходу.
	AI_Output(self,other,"DIA_GRIMES_LetsGetOutOfHere_01_02");	//Забудь про свитки! Я недавно был на улице и слышал, что паладины вскоре намеревались молиться Инносу.
	AI_Output(self,other,"DIA_GRIMES_LetsGetOutOfHere_01_03");	//Из того места не видно входа в шахту!
	AI_Output(self,other,"DIA_GRIMES_LetsGetOutOfHere_01_04");	//Стой. Кажется, я слышу позванивание доспехов.
	AI_Output(self,other,"DIA_GRIMES_LetsGetOutOfHere_01_05");	//А теперь тишина...
	AI_Output(self,other,"DIA_GRIMES_LetsGetOutOfHere_01_06");	//Думаю, они ушли.
	AI_Output(self,other,"DIA_GRIMES_LetsGetOutOfHere_01_07");	//Вперед! Сейчас или никогда.
	self.aivar[AIV_PARTYMEMBER] = TRUE;

	if(HuntyIsDead == FALSE)
	{
		STRF_1117_Straefling.aivar[AIV_PARTYMEMBER] = TRUE;
	};

	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FollowMe");

	if(HuntyIsDead == FALSE)
	{
		B_StartOtherRoutine(STRF_1117_Straefling,"FollowMe");
	};

	b_changeguild(Pal_219_Ritter,GIL_BDT);
	B_StartOtherRoutine(Pal_219_Ritter,"GrimesEsc");
	AI_Teleport(Pal_219_Ritter,"OW_PAL_WESTMINE_03");
	b_changeguild(Pal_218_Ritter,GIL_BDT);
	B_StartOtherRoutine(Pal_218_Ritter,"GrimesEsc");
	AI_Teleport(Pal_218_Ritter,"OW_PAL_WESTMINE_02");
	B_StartOtherRoutine(vlk_7527_waffenknecht,"GrimesEsc");
	AI_Teleport(vlk_7527_waffenknecht,"OW_PAL_WESTMINE_06");
};

instance DIA_GRIMES_WEGOTOUTOFHERE(C_Info)
{
	npc = VLK_4111_Grimes;
	nr = 7;
	condition = dia_grimes_wegotoutofhere_condition;
	information = dia_grimes_wegotoutofhere_info;
	permanent = FALSE;
	description = "Мы на месте.";
};

func int dia_grimes_wegotoutofhere_condition()
{
	if(Npc_KnowsInfo(other,dia_grimes_letsgetoutofhere) && (Npc_GetDistToWP(self,"START") < 2000) && (HURRAYICANHIRE == TRUE))
	{
		return TRUE;
	};
};

func void dia_grimes_wegotoutofhere_info()
{
	AI_Output(other,self,"DIA_GRIMES_WeGotOutOfHere_15_00");	//Мы на месте! Через эту шахту можно пробраться в Хоринис. Просто следуй за мной.
	AI_Output(self,other,"DIA_GRIMES_WeGotOutOfHere_01_01");	//Как скажешь.
	HUNTYGRIMESESCAPEOW = TRUE;
	Pal_219_Ritter.flags = 0;
	Pal_218_Ritter.flags = 0;
	vlk_7527_waffenknecht.flags = 0;
	self.aivar[AIV_PARTYMEMBER] = FALSE;

	if(HuntyIsDead == FALSE)
	{
		STRF_1117_Straefling.aivar[AIV_PARTYMEMBER] = FALSE;
	};

	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"NearPassOW");

	if(HuntyIsDead == FALSE)
	{
		B_StartOtherRoutine(STRF_1117_Straefling,"NearPassOW");
	};

	B_KillNpc(Pal_218_Ritter);
	B_KillNpc(Pal_219_Ritter);
	B_KillNpc(vlk_7527_waffenknecht);

	Wld_InsertNpc(orkelite_addon2,"OW_PAL_WESTMINE_02");
	Wld_InsertNpc(orkelite_addon2,"OW_PAL_WESTMINE_01");
	Wld_InsertNpc(orkelite_addon3,"OW_PATH_266");
	Wld_InsertNpc(orkelite_addon2,"OW_PATH_2_04");
	Wld_InsertNpc(orkelite_addon3,"OW_PAL_WESTMINE_SIT");
};

//-----------------------новый-----------------------------------------------------------

instance DIA_GRIMESNW_EXIT(C_Info)
{
	npc = vlk_41110_grimesnw;
	nr = 999;
	condition = dia_grimesnw_exit_condition;
	information = dia_grimesnw_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int dia_grimesnw_exit_condition()
{
	return TRUE;
};

func void dia_grimesnw_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_GRIMESNW_FREEDOM(C_Info)
{
	npc = vlk_41110_grimesnw;
	nr = 1;
	condition = dia_grimesnw_freedom_condition;
	information = dia_grimesnw_freedom_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_grimesnw_freedom_condition()
{
	if((HURRAYICANHIRE == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_grimesnw_freedom_info()
{
	AI_Output(self,other,"DIA_GRIMESNW_Freedom_01_00");	//(глубоко вдыхает воздух) Свобода...
	AI_Output(self,other,"DIA_GRIMESNW_Freedom_01_01");	//Последние несколько лет я был уверен, что мне так и суждено умереть в этой проклятой долине.
	AI_Output(self,other,"DIA_GRIMESNW_Freedom_01_02");	//Не могу поверить, что я наконец-то покинул ее...
	AI_Output(other,self,"DIA_GRIMESNW_Freedom_15_03");	//Погоди радоваться. Мы еще не добрались до моего лагеря.
	AI_Output(self,other,"DIA_GRIMESNW_Freedom_01_04");	//Ты прав! Не будем задерживаться.
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	vlk_41111_huntynw.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FollowMe");
	B_StartOtherRoutine(vlk_41111_huntynw,"FollowMe");
};

instance DIA_GRIMESNW_FINALLYINTOWER(C_Info)
{
	npc = vlk_41110_grimesnw;
	nr = 1;
	condition = dia_grimesnw_finallyintower_condition;
	information = dia_grimesnw_finallyintower_info;
	permanent = FALSE;
	description = "Мы на месте. Вот мой лагерь.";
};

func int dia_grimesnw_finallyintower_condition()
{
	if((HURRAYICANHIRE == TRUE) && (Npc_GetDistToWP(self,"NW_CASTLEMINE_TOWER_CAMPFIRE_01") < 3000))
	{
		return TRUE;
	};
};

func void dia_grimesnw_finallyintower_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_GRIMESNW_FinallyInTower_15_00");	//Мы на месте. Вот мой лагерь. Вон там вход в шахту.
	AI_Output(self,other,"DIA_GRIMESNW_FinallyInTower_01_01");	//Отличное место! Спасибо тебе, что вывел меня из долины.
	AI_Output(other,self,"DIA_GRIMESNW_FinallyInTower_15_02");	//Не за что. Первое время можете отдохнуть, а когда наберешься сил, принимайся за работу.
	AI_Output(other,self,"DIA_GRIMESNW_FinallyInTower_15_03");	//Надеюсь, ты помнишь наш уговор?
	AI_Output(self,other,"DIA_GRIMESNW_FinallyInTower_01_04");	//Разумеется! Я не забываю данных мною слов.
	AI_Output(other,self,"DIA_GRIMESNW_FinallyInTower_15_05");	//Тогда располагайся! Ах да, за твою работу я буду платить тебе по тридцать пять золотых в день. Согласен?
	AI_Output(self,other,"DIA_GRIMESNW_FinallyInTower_01_06");	//Деньги? Я уже и забыл, что это такое.
	AI_Output(self,other,"DIA_GRIMESNW_FinallyInTower_01_07");	//Еще раз спасибо тебе.
	B_LogEntry_Quiet(TOPIC_PPL_FOR_TOWER,"Мне удалось вытащить шахтеров Граймса и Ханти из Долины Рудников. Теперь они будут работать на меня.");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	self.npcType = NPCTYPE_FRIEND;
	self.aivar[AIV_ToughGuy] = TRUE;
	self.aivar[AIV_IGNORE_Theft] = TRUE;
	self.aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	self.aivar[AIV_IgnoresArmor] = TRUE;
	HUNTYGRIMESRECRUITEDDT = TRUE;

	if(DT_OREGATHER_START == FALSE)
	{
		DT_OREGATHER_START = TRUE;
		EVERYDAYDTORE = Wld_GetDay();
	};

	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"InTower");
};

instance DIA_GRIMESNW_INTOWER(C_Info)
{
	npc = vlk_41110_grimesnw;
	nr = 22;
	condition = dia_grimesnw_intower_condition;
	information = dia_grimesnw_intower_info;
	permanent = TRUE;
	description = "Как тебе новое место работы?";
};

func int dia_grimesnw_intower_condition()
{
	if(HUNTYGRIMESRECRUITEDDT == TRUE)
	{
		return TRUE;
	};
};

func void dia_grimesnw_intower_info()
{
	AI_Output(other,self,"DIA_GrimesNW_InTower_15_00");	//Как тебе новое место работы?
	AI_Output(self,other,"DIA_GrimesNW_InTower_01_01");	//Отличное! Клянусь, я не оставлю в твоей шахте ни грамма недобытой руды.
};

instance DIA_GRIMES_NW_KNOWABOUTERZHUNT(C_Info)
{
	npc = vlk_41110_grimesnw;
	nr = 2;
	condition = dia_grimes_NW_knowabouterzhunt_condition;
	information = dia_grimes_NW_knowabouterzhunt_info;
	permanent = FALSE;
	description = "Ты что-нибудь знаешь о добыче руды?";
};

func int dia_grimes_NW_knowabouterzhunt_condition()
{
	return TRUE;
};

func void dia_grimes_NW_knowabouterzhunt_info()
{
	AI_Output(other,self,"DIA_Grimes_KnowAboutErzHunt_01_00");	//Ты что-нибудь знаешь о добыче руды?
	AI_Output(self,other,"DIA_Grimes_KnowAboutErzHunt_01_01");	//Я половину своей жизни только тем и занимаюсь, что добываю ее.
	AI_Output(other,self,"DIA_Grimes_KnowAboutErzHunt_01_03");	//Я хочу научиться добывать руду. Ты можешь мне помочь?
	AI_Output(self,other,"DIA_Grimes_KnowAboutErzHunt_01_04");	//Нет проблем. Я научу тебя всему, что знаю сам.

	if(ORE_TOPIC_EXIST == TRUE)
	{
		B_LogEntry(TOPIC_MAGICORE,"Граймс может научить меня добывать магическую руду из породы.");
	}
	else
	{
		Log_CreateTopic(TOPIC_MAGICORE,LOG_NOTE);
		B_LogEntry(TOPIC_MAGICORE,"Граймс может научить меня добывать магическую руду из породы.");
		ORE_TOPIC_EXIST = TRUE;
	};
};

instance DIA_GRIMES_NW_LEARNABOUTERZHUNT(C_Info)
{
	npc = vlk_41110_grimesnw;
	nr = 2;
	condition = dia_grimes_NW_learnabouterzhunt_condition;
	information = dia_grimes_NW_learnabouterzhunt_info;
	permanent = TRUE;
	description = "Научи меня добывать руду.";
};

func int dia_grimes_NW_learnabouterzhunt_condition()
{
	if(Npc_KnowsInfo(other,dia_grimes_knowabouterzhunt) && (HERO_HACKCHANCEORE < 100))
	{
		return TRUE;
	};
};

func void dia_grimes_NW_learnabouterzhunt_info()
{
	if(KNOWHOWPICKORE == TRUE)
	{
		AI_Output(other,self,"DIA_Grimes_LearnAboutErzHunt_01_0A");	//Расскажи мне больше о добыче руды.
	}
	else
	{
		AI_Output(other,self,"DIA_Grimes_LearnAboutErzHunt_01_00");	//Научи меня добывать руду.
	};

	Info_ClearChoices(dia_grimes_NW_learnabouterzhunt);
	Info_AddChoice(dia_grimes_NW_learnabouterzhunt,Dialog_Back,dia_grimes_NW_learnabouterzhunt_Back);
	Info_AddChoice(dia_grimes_NW_learnabouterzhunt,b_buildlearnstringforerzhunt("Добыча руды",B_GetLearnCostTalent(other,NPC_TALENT_ERZWORK,1)),dia_grimes_NW_learnabouterzhunt_ERZWORK);
};

func void dia_grimes_NW_learnabouterzhunt_Back()
{
	Info_ClearChoices(dia_grimes_NW_learnabouterzhunt);
};

func void dia_grimes_NW_learnabouterzhunt_ERZWORK()
{
	if(HERO_HACKCHANCEORE < 100)
	{
		if(b_teachplayertalenterzhunt(self,other,NPC_TALENT_ERZWORK))
		{
			if(GRIMESTEACHMOREORE == FALSE)
			{
				AI_Output(self,other,"DIA_Grimes_LearnAboutErzHunt_01_01");	//Хорошо! Слушай внимательно...
				AI_Output(self,other,"DIA_Grimes_LearnAboutErzHunt_01_02");	//Для начала тебе необходимо обзавестись хорошей киркой - это половина дела.
				AI_Output(self,other,"DIA_Grimes_LearnAboutErzHunt_01_03");	//Потом начинай обрабатывать найденную тобой рудную жилу.
				AI_Output(self,other,"DIA_Grimes_LearnAboutErzHunt_01_04");	//Бить надо не по краю породы, а точно в центр. Наноси один мощный удар, а после - несколько ударов послабее.
				AI_Output(self,other,"DIA_Grimes_LearnAboutErzHunt_01_05");	//Тем самым ты немного нарушишь структуру самородка, и при следующем сильном ударе какой-нибудь кусок от него обязательно отколется.
				AI_Output(self,other,"DIA_Grimes_LearnAboutErzHunt_01_06");	//А потом повторяй все заново...
				AI_Output(self,other,"DIA_Grimes_LearnAboutErzHunt_01_07");	//Это главное, что тебе нужно знать о добыче руды.
				GRIMESTEACHMOREORE = TRUE;
			}
			else
			{
				AI_Output(self,other,"DIA_Grimes_LearnAboutErzHunt_01_09");	//Ладно! Слушай внимательно...(рассказывает)
			};
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Grimes_LearnAboutErzHunt_01_10");	//Я научил тебя всему, что знаю. Дальше сам набирайся опыта, махая киркой.
	};

	Info_ClearChoices(dia_grimes_NW_learnabouterzhunt);
};

//------------------------------Ханти------------------------------------------

instance DIA_HUNTYNW_EXIT(C_Info)
{
	npc = vlk_41111_huntynw;
	nr = 999;
	condition = dia_huntynw_exit_condition;
	information = dia_huntynw_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int dia_huntynw_exit_condition()
{
	return TRUE;
};

func void dia_huntynw_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_HUNTYNW_INTOWER_IRON(C_Info)
{
	npc = vlk_41111_huntynw;
	nr = 22;
	condition = dia_huntynw_intower_IRON_condition;
	information = dia_huntynw_intower_IRON_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_huntynw_intower_IRON_condition()
{
	if(HUNTYGRIMESRECRUITEDDT == TRUE)
	{
		return TRUE;
	};
};

func void dia_huntynw_intower_IRON_info()
{
	AI_Output(self,other,"DIA_HuntyNW_InTower_01_01");	//Спасибо, что помог выбраться из долины!
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	self.npcType = NPCTYPE_FRIEND;
	self.aivar[AIV_ToughGuy] = TRUE;
	self.aivar[AIV_IGNORE_Theft] = TRUE;
	self.aivar[AIV_IGNORE_Sheepkiller] = TRUE;
	self.aivar[AIV_IgnoresArmor] = TRUE;

	if(DT_IRONGATHER_START == FALSE)
	{
		DT_IRONGATHER_START = TRUE;
		EVERYDAYDTIRON = Wld_GetDay();
	};

	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"InTower");
};

instance DIA_HUNTYNW_INTOWER(C_Info)
{
	npc = vlk_41111_huntynw;
	nr = 22;
	condition = dia_huntynw_intower_condition;
	information = dia_huntynw_intower_info;
	permanent = TRUE;
	description = "Как дела?";
};

func int dia_huntynw_intower_condition()
{
	if(HUNTYGRIMESRECRUITEDDT == TRUE)
	{
		return TRUE;
	};
};

func void dia_huntynw_intower_info()
{
	AI_Output(other,self,"DIA_HuntyNW_InTower_15_00");	//Как дела?
	AI_Output(self,other,"DIA_HuntyNW_InTower_01_01");	//Все в порядке.
};