
instance DIA_DUGO_EXIT(C_Info)
{
	npc = vlk_6008_dugo;
	nr = 999;
	condition = dia_dugo_exit_condition;
	information = dia_dugo_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_dugo_exit_condition()
{
	return TRUE;
};

func void dia_dugo_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DUGO_HELLO(C_Info)
{
	npc = vlk_6008_dugo;
	nr = 1;
	condition = dia_dugo_hello_condition;
	information = dia_dugo_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_dugo_hello_condition()
{
	return TRUE;
};

func void dia_dugo_hello_info()
{
	AI_Output(self,other,"DIA_Dugo_Hello_01_00");	//Не могу поверить своим глазам! Откуда? (удивленно) Как ты попал сюда?!
	AI_Output(other,self,"DIA_Dugo_Hello_01_01");	//Я прошел через портал, тот, что наверху этой пирамиды. А что тебя так удивляет?
	AI_Output(self,other,"DIA_Dugo_Hello_01_03");	//За все то время, что я себя помню, ты - первый, кого занесло в эти богом забытые края...
};


instance DIA_DUGO_HELLO_TWO(C_Info)
{
	npc = vlk_6008_dugo;
	nr = 1;
	condition = dia_dugo_hello_two_condition;
	information = dia_dugo_hello_two_info;
	permanent = TRUE;
	important = FALSE;
	description = "Кто ты и что это за место?";
};


func int dia_dugo_hello_two_condition()
{
	if(DUGOMEET == 0)
	{
		return TRUE;
	};
};

func void dia_dugo_hello_two_info()
{
	AI_Output(other,self,"DIA_Dugo_Hello_Two_01_00");	//Кто ты и что это за место?
	AI_Output(self,other,"DIA_Dugo_Hello_Two_01_01");	//Мое имя Дюго. А все, что ты видишь вокруг, зовется Долиной Теней...
	AI_Output(self,other,"DIA_Dugo_Hello_Two_01_02");	//И скажу тебе честно, парень - ты попал в самое пекло ада!
	AI_Output(self,other,"DIA_Dugo_Hello_Two_01_03");	//Это долина проклята! Кругом бродит нечисть, а то и пострашнее создания.
	AI_Output(self,other,"DIA_Dugo_Hello_Two_01_04");	//А по ночам вообще не стоит бродить в этих местах - иначе моментально рискуешь расстаться с жизнью.
	DUGOMEET = 1;
};


instance DIA_DUGO_HELLO_THREE(C_Info)
{
	npc = vlk_6008_dugo;
	nr = 1;
	condition = dia_dugo_hello_three_condition;
	information = dia_dugo_hello_three_info;
	permanent = TRUE;
	important = FALSE;
	description = "Расскажи мне об этой долине.";
};


func int dia_dugo_hello_three_condition()
{
	if(DUGOMEET == 1)
	{
		return TRUE;
	};
};

func void dia_dugo_hello_three_info()
{
	AI_Output(other,self,"DIA_Dugo_Hello_Three_01_15");	//Расскажи мне об этой долине.
	AI_Output(self,other,"DIA_Dugo_Hello_Three_01_00");	//Да что тут рассказывать...
	AI_Output(self,other,"DIA_Dugo_Hello_Three_01_01");	//(вздыхает) Когда-то это была прекрасная долина с красивыми лугами и вечнозелеными лесами у подножья этих величественных гор.
	AI_Output(self,other,"DIA_Dugo_Hello_Three_01_02");	//К сожалению, от этого остались лишь воспоминания и ничего более.
	AI_Output(self,other,"DIA_Dugo_Hello_Three_01_03");	//Теперь это безжизненная пустошь, покрытая золой и пеплом. А все вокруг пропитано злом и ужасом.
	AI_Output(self,other,"DIA_Dugo_Hello_Three_01_04");	//Поверь, здесь нет ничего кроме смерти.
	AI_Output(other,self,"DIA_Dugo_Hello_Three_01_05");	//А что здесь случилось?
	AI_Output(self,other,"DIA_Dugo_Hello_Three_01_06");	//Зло пришло в этот мир. Страшное зло! Зло, которому нет имени.
	AI_Output(self,other,"DIA_Dugo_Hello_Three_01_08");	//Говорили, что это было невиданное чудовище, которое изрыгнула сама преисподняя!
	AI_Output(other,self,"DIA_Dugo_Hello_Three_01_09");	//А это случайно не был дракон?
	AI_Output(self,other,"DIA_Dugo_Hello_Three_01_10");	//Я не знаю, кто это был. Может и дракон, а может и нет. Никто не знает.
	AI_Output(self,other,"DIA_Dugo_Hello_Three_01_11");	//Одно знаю: немногим в те ужасные времена уладось спасти свои жизни...
	AI_Output(self,other,"DIA_Dugo_Hello_Three_01_12");	//А те, кому все-таки это удалось - были обречены вечно прозябать в этой долине смерти! (вздыхает)
	AI_Output(self,other,"DIA_Dugo_Hello_Three_01_14");	//Это все, что я мог тебе рассказать. Если хочешь узнать больше, тебе стоит спросить об этом у Эльваиса.
	if(MIS_URNAZULRAGE == LOG_Running)
	{
		B_LogEntry(TOPIC_URNAZULRAGE,"Недалеко от пирамиды с телепортером, который меня привел в Долину Теней, я встретил охотника по имени Дюго. Судя по его словам, место, в которое я попал - сущий ад!");
	};
	DUGOMEET = 2;
};


instance DIA_DUGO_HELLO_FOUR(C_Info)
{
	npc = vlk_6008_dugo;
	nr = 1;
	condition = dia_dugo_hello_four_condition;
	information = dia_dugo_hello_four_info;
	permanent = TRUE;
	important = FALSE;
	description = "А вы не думали убраться отсюда?";
};


func int dia_dugo_hello_four_condition()
{
	if((DUGOMEET == 2) && (DUGOMEETONE == 0))
	{
		return TRUE;
	};
};

func void dia_dugo_hello_four_info()
{
	AI_Output(other,self,"DIA_Dugo_Hello_Four_01_01");	//А вы не думали убраться отсюда?
	AI_Output(self,other,"DIA_Dugo_Hello_Four_01_03");	//Из этой долины нет выхода. Проход через горы, ведущий отсюда, давно завалило камнями после одного из землетрясений.
	AI_Output(self,other,"DIA_Dugo_Hello_Four_01_04");	//Оставался только каменный пьедестал в пирамиде, похожий на портал...
	AI_Output(self,other,"DIA_Dugo_Hello_Four_01_05");	//Но до сегодняшнего дня все наши попытки активировать его ни к чему не привели.
	AI_Output(other,self,"DIA_Dugo_Hello_Four_01_08");	//Я бы не стал сильно рассчитывать на это.
	AI_Output(other,self,"DIA_Dugo_Hello_Four_01_11");	//Дело в том, что портал ведем прямиком в подземный город орков, и, скорее всего, вы не сможете пробится через их орды.
	AI_Output(self,other,"DIA_Dugo_Hello_Four_01_13");	//Что?! О боже, это была наша последняя надежда на спасение.
	AI_Output(self,other,"DIA_Dugo_Hello_Four_01_14");	//Но как ТЫ смог пройти мимо орков?!
	AI_Output(other,self,"DIA_Dugo_Hello_Four_01_15");	//У меня есть орочий талисман. Один из орков сделал его для меня, поскольку я спас ему жизнь.
	AI_Output(other,self,"DIA_Dugo_Hello_Four_01_16");	//Для орков он означает знак силы и дружбы. Они уважают его владельца и не смеют на него нападать.
	AI_Output(self,other,"DIA_Dugo_Hello_Four_01_17");	//(зло) Чертовы орки!
	AI_Output(self,other,"DIA_Dugo_Hello_Four_01_18");	//Тогда, боюсь, у нас нет другого выбора. Придется пробивать себе дорогу мечом.
	DUGOMEETONE = 1;
};


instance DIA_DUGO_HELLO_FIVE(C_Info)
{
	npc = vlk_6008_dugo;
	nr = 1;
	condition = dia_dugo_hello_five_condition;
	information = dia_dugo_hello_five_info;
	permanent = TRUE;
	important = FALSE;
	description = "Эльваис? А кто это?";
};


func int dia_dugo_hello_five_condition()
{
	if((DUGOMEET == 2) && (DUGOMEETTWO == 0))
	{
		return TRUE;
	};
};

func void dia_dugo_hello_five_info()
{
	AI_Output(other,self,"DIA_Dugo_Hello_Five_01_01");	//Эльваис? А кто это?
	AI_Output(self,other,"DIA_Dugo_Hello_Five_01_02");	//Он что-то вроде нашего старейшины в лагере. Кроме того, он самый умный из нас, и может о многом тебе рассказать.
	AI_Output(self,other,"DIA_Dugo_Hello_Five_01_04");	//Позади меня пещера - это наш лагерь. Там можно чувствовать себя в безопасности!
	AI_Output(self,other,"DIA_Dugo_Hello_Five_01_05");	//Ты найдешь Эльваиса в одной из дальних частей пещеры. Можешь пообщаться и с другими ребятами.
	AI_Output(self,other,"DIA_Dugo_Hello_Five_01_06");	//Некоторые из них отличные охотники - например, Багрус. А Гунмар - лучший из лучников, которых мне приходилось знать.
	AI_Output(self,other,"DIA_Dugo_Hello_Five_01_07");	//У них есть чему поучиться!
	if(MIS_URNAZULRAGE == LOG_Running)
	{
		B_LogEntry(TOPIC_URNAZULRAGE,"Дюго посоветовал мне поговорить с Эльваисом - старейшиной в лагере. Он сможет рассказать мне больше об этом месте. Возможно, я смогу разузнать у него кое-что о черном драконе. Я смогу найти Эльваиса в дальней из пещер, что слева от входа в лагерь.");
	};
	DUGOMEETTWO = 1;
	KNOWABELV = TRUE;
	Wld_InsertNpc(vlk_6020_harum,"SV_HUMAN_20");
};


instance DIA_DUGO_HELLO_SEVEN(C_Info)
{
	npc = vlk_6008_dugo;
	nr = 1;
	condition = dia_dugo_hello_seven_condition;
	information = dia_dugo_hello_seven_info;
	permanent = TRUE;
	important = FALSE;
	description = "Возможно мне удастся помочь вам.";
};


func int dia_dugo_hello_seven_condition()
{
	if((DUGOMEETONE == 1) && (MIS_URNAZULRAGE == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_dugo_hello_seven_info()
{
	AI_Output(other,self,"DIA_Dugo_Hello_Seven_01_01");	//Возможно, мне все-таки удастся помочь вам выбраться отсюда.
	AI_Output(other,self,"DIA_Dugo_Hello_Seven_01_02");	//Идея прорываться через орды орков просто безумна. Вы и понятия не имеете, сколько их там!
	AI_Output(other,self,"DIA_Dugo_Hello_Seven_01_03");	//Они разорвут вас на куски!
	AI_Output(self,other,"DIA_Dugo_Hello_Seven_01_04");	//А что, у тебя есть предложение получше?
	AI_Output(other,self,"DIA_Dugo_Hello_Seven_01_07");	//Возможно. Но для начала мне надо уладить здесь одного рода дело.
	AI_Output(self,other,"DIA_Dugo_Hello_Seven_01_08");	//И какое же дело могло привести человека в эти забытые Инносом края?
	AI_Output(other,self,"DIA_Dugo_Hello_Seven_01_10");	//Я слышал, в этой долине живет один очень могущественный дракон. Его имя Азгалор.
	AI_Output(self,other,"DIA_Dugo_Hello_Seven_01_11");	//Я уже слышал это имя. Эльваис упоминал его в одной из своих историй.
	AI_Output(self,other,"DIA_Dugo_Hello_Seven_01_12");	//Тебе следует поговорить с ним. Он знает об этом создании больше, чем я.
	AI_Output(self,other,"DIA_Dugo_Hello_Seven_01_14");	//Скажи, а на кой черт тебе вообще сдался этот дракон?
	AI_Output(other,self,"DIA_Dugo_Hello_Seven_01_15");	//Я пришел сюда, чтобы убить эту тварь.
	AI_Output(self,other,"DIA_Dugo_Hello_Seven_01_16");	//Ну, парень, ты не перестаешь удивлять меня. Дело, конечно, твое, но по-моему у тебя крыша съехала!
	Log_CreateTopic(TOPIC_HUMANINVALLEY,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HUMANINVALLEY,LOG_Running);
	B_LogEntry(TOPIC_HUMANINVALLEY,"Возможно, я мог бы помочь живущим здесь людям выбраться из этого адского местечка. Вопрос в том - как?");
	DUGOMEETONE = 2;
};

