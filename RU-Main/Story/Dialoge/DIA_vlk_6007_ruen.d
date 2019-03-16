
instance DIA_RUEN_EXIT(C_Info)
{
	npc = vlk_6007_ruen;
	nr = 999;
	condition = dia_ruen_exit_condition;
	information = dia_ruen_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_ruen_exit_condition()
{
	return TRUE;
};

func void dia_ruen_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RUEN_HELLO(C_Info)
{
	npc = vlk_6007_ruen;
	nr = 1;
	condition = dia_ruen_hello_condition;
	information = dia_ruen_hello_info;
	permanent = TRUE;
	important = FALSE;
	description = "Как дела в лагере?";
};


func int dia_ruen_hello_condition()
{
	if(MEETRUEN == 0)
	{
		return TRUE;
	};
};

func void dia_ruen_hello_info()
{
	AI_Output(other,self,"DIA_Ruen_Hello_01_00");	//Как дела в лагере?
	AI_Output(self,other,"DIA_Ruen_Hello_01_01");	//...Постой! Ты же тот парень, что недавно тут появился!
	AI_Output(self,other,"DIA_Ruen_Hello_01_02");	//Все о тебе только и говорят...
	AI_Output(self,other,"DIA_Ruen_Hello_01_03");	//Да хреново, братишка. Охотиться здесь в последнее время становится все опаснее и опаснее.
	AI_Output(self,other,"DIA_Ruen_Hello_01_04");	//Куда ни кинь, рискуешь нарваться на каких-нибудь злобных тварей.
	AI_Output(self,other,"DIA_Ruen_Hello_01_05");	//А по ночам вообще становиться жутко до дрожи!
	AI_Output(self,other,"DIA_Ruen_Hello_01_06");	//Эта пещера единственное место, где можно чувствовать себя более или менее в безопасности.
	AI_Output(self,other,"DIA_Ruen_Hello_01_07");	//В общем, жизнь здесь не сахар, а сплошная нервотрепка!
	AI_Output(other,self,"DIA_Ruen_Hello_01_08");	//А на кого вы охотитесь?
	AI_Output(self,other,"DIA_Ruen_Hello_01_09");	//В основном на варгов. Скажу тебе - чертовски опасные твари!
	AI_Output(self,other,"DIA_Ruen_Hello_01_10");	//Но выбирать особо не приходится. Лучше этого здесь все равно не найти.
	AI_Output(other,self,"DIA_Ruen_Hello_01_11");	//Ты тоже охотник?
	AI_Output(self,other,"DIA_Ruen_Hello_01_12");	//Все мы тут охотники. Да, собственно, тут и заняться больше нечем, кроме охоты.
	MEETRUEN = 1;
};


instance DIA_RUEN_HELLO_TWO(C_Info)
{
	npc = vlk_6007_ruen;
	nr = 1;
	condition = dia_ruen_hello_two_condition;
	information = dia_ruen_hello_two_info;
	permanent = TRUE;
	important = FALSE;
	description = "Ты можешь научить меня охотиться?";
};


func int dia_ruen_hello_two_condition()
{
	if(MEETRUEN == 1)
	{
		return TRUE;
	};
};

func void dia_ruen_hello_two_info()
{
	AI_Output(other,self,"DIA_Ruen_Hello_Two_01_01");	//Ты можешь научить меня охотиться?
	AI_Output(self,other,"DIA_Ruen_Hello_Two_01_02");	//Навряд ли я тебе смогу много рассказать об этом.
	AI_Output(self,other,"DIA_Ruen_Hello_Two_01_03");	//Если хочешь действительно научиться чему-то стоящему, тебе лучше поговорить с Баргусом.
	AI_Output(self,other,"DIA_Ruen_Hello_Two_01_04");	//Он у нас лучший! Поговори с ним. Он в той пещере, что слева от меня.
	AI_Output(other,self,"DIA_Ruen_Hello_Two_01_05");	//А кто еще меня сможет здесь чему-то научить?
	AI_Output(self,other,"DIA_Ruen_Hello_Two_01_06");	//Ну, как я и сказал, Багрус может тебя научить искусству охоты и разделке животных.
	AI_Output(self,other,"DIA_Ruen_Hello_Two_01_07");	//Гунмар - стрелок, какого еще надо поискать! Уж если захотел научиться метко стрелять из лука - он именно тот человек, к кому следует обратиться.
	AI_Output(self,other,"DIA_Ruen_Hello_Two_01_08");	//Гиллимор сможет тебя обучить различным тонкостям в приготовлении лечебных снадобий. Он у нас что-то вроде алхимика.
	AI_Output(self,other,"DIA_Ruen_Hello_Two_01_09");	//Эмнол - этот парень просто гора мышц! Если хочешь стать сильнее - обратись к нему. Он покажет тебе пару приемов, которые повысят твой силу.
	AI_Output(self,other,"DIA_Ruen_Hello_Two_01_10");	//Если хочешь научиться получше обращаться с холодным оружием - неважно - одноручным или двуручным, Кардор может тебе показать, как это сделать. В этом ему нет равных среди нас!
	AI_Output(self,other,"DIA_Ruen_Hello_Two_01_11");	//Нофельд покажет тебе, как повысить свою ловкость.
	AI_Output(self,other,"DIA_Ruen_Hello_Two_01_12");	//Хасан может продать тебе какой-нибудь хлам, завалявшийся на складе.
	AI_Output(self,other,"DIA_Ruen_Hello_Two_01_13");	//Что касается остальных парней, то вряд ли они смогут тебя чему-то научить.
	AI_Output(other,self,"DIA_Ruen_Hello_Two_01_14");	//А ты сам?
	AI_Output(self,other,"DIA_Ruen_Hello_Two_01_15");	//Я? Хммм... боюсь, ни чем...(смеется)
	AI_Output(other,self,"DIA_Ruen_Hello_Two_01_16");	//Ладно, и на том спасибо.
	AI_Output(self,other,"DIA_Ruen_Hello_Two_01_17");	//Да не за что.
	Log_CreateTopic(TOPIC_TEACHERSINVALLEY,LOG_NOTE);
	B_LogEntry(TOPIC_TEACHERSINVALLEY,"Багрус - лучший охотник в лагере. Он может показать мне, как разделывать трупы убитых животных");
	B_LogEntry(TOPIC_TEACHERSINVALLEY,"Гунмар специализируется на стрельбе из лука. Руэн сказал, что он лучший стрелок в этих местах.");
	B_LogEntry(TOPIC_TEACHERSINVALLEY,"Гиллимор - травник и может обучить меня приготовлению различных снадобий.");
	B_LogEntry(TOPIC_TEACHERSINVALLEY,"Эмнол может увеличить мою силу.");
	B_LogEntry(TOPIC_TEACHERSINVALLEY,"Кардор сможет показать мне пару приемов владения холодным оружием.");
	B_LogEntry(TOPIC_TEACHERSINVALLEY,"Нофельд поможет мне увеличить мою ловкость.");
	B_LogEntry(TOPIC_TEACHERSINVALLEY,"Хасан торгует разным хламом. Его можно найти на складе.");
	BARGUSTEACHER = TRUE;
	GUNMARTEACHER = TRUE;
	GILLIMORTEACHER = TRUE;
	EMNOLTEACHER = TRUE;
	KARDORTEACHER = TRUE;
	NOFELDTEACHER = TRUE;
	HASANTEACHER = TRUE;
	MEETRUEN = 2;
};


instance DIA_RUEN_HELLO_SKLEP(C_Info)
{
	npc = vlk_6007_ruen;
	nr = 1;
	condition = dia_ruen_hello_sklep_condition;
	information = dia_ruen_hello_sklep_info;
	permanent = TRUE;
	important = FALSE;
	description = "(спросить про заброшенный склеп в долине)";
};


func int dia_ruen_hello_sklep_condition()
{
	if((MEETHARUMTWO == TRUE) && (RUENSKLEPKNOWN == FALSE))
	{
		return TRUE;
	};
};

func void dia_ruen_hello_sklep_info()
{
	AI_Output(other,self,"DIA_Ruen_Hello_Sklep_01_00");	//Эльваис рассказал мне, что ты во время одной охоты нактнулся на какой-то заброшенный склеп.
	AI_Output(self,other,"DIA_Ruen_Hello_Sklep_01_01");	//Да, было дело. Жуткое местечко, я тебе скажу!
	AI_Output(self,other,"DIA_Ruen_Hello_Sklep_01_03");	//А тебе зачем это?
	AI_Output(other,self,"DIA_Ruen_Hello_Sklep_01_04");	//Да, так. Хочу туда наведаться. Эльваис сказал мне, что ты оттуда приволок добрую кучу старинных фолиантов.
	AI_Output(other,self,"DIA_Ruen_Hello_Sklep_01_05");	//Некоторые из которых, по словам Эльваиса, содержали в себе очень полезную информацию.
	AI_Output(other,self,"DIA_Ruen_Hello_Sklep_01_06");	//Вот я и думаю, что мне стоит там побывать. Может, найду что-нибудь интересное.
	AI_Output(self,other,"DIA_Ruen_Hello_Sklep_01_07");	//Я бы посоветовал тебе держаться подальше от этого места. Этот склеп просто рассадник зла.
	AI_Output(self,other,"DIA_Ruen_Hello_Sklep_01_08");	//Никогда не видел столько нежити в одном месте. Да ими просто все кишит там!
	AI_Output(other,self,"DIA_Ruen_Hello_Sklep_01_09");	//Ну, с этим, я думаю, как-нибудь разберусь. Ты не мог бы точнее сказать, где находится этот склеп?
	AI_Output(self,other,"DIA_Ruen_Hello_Sklep_01_10");	//А я погляжу, ты парень рисковый! Дело твое, конечно...
	AI_Output(self,other,"DIA_Ruen_Hello_Sklep_01_11");	//Только, боюсь, сказать тебе точное место, где находился этот склеп, я не смогу.
	AI_Output(self,other,"DIA_Ruen_Hello_Sklep_01_12");	//Случайно на него набрел. Да и когда сматывался оттуда, времени, чтобы запоминать дорогу, особенно-то и не было.
	AI_Output(self,other,"DIA_Ruen_Hello_Sklep_01_13");	//Помню только, что склеп этот расположен в пещере, где-то у круга камней.
	AI_Output(other,self,"DIA_Ruen_Hello_Sklep_01_14");	//Круг камней?
	AI_Output(self,other,"DIA_Ruen_Hello_Sklep_01_15");	//Да, круг камней. Он, кажется, расположен к северу от нашего лагеря.
	AI_Output(other,self,"DIA_Ruen_Hello_Sklep_01_16");	//Да уж... теперь найти его точно не проблема!
	AI_Output(self,other,"DIA_Ruen_Hello_Sklep_01_17");	//Ну, парень - все, что знал, то сказал.
	B_LogEntry(TOPIC_URNAZULRAGE,"Я поговорил с Руэном о заброшенном склепе. Он рассказал мне, что склеп этот находится к северу от лагеря, недалеко от круга камней, в пещере.");
	RUENSKLEPKNOWN = TRUE;
};


instance DIA_RUEN_HELLO_LAST(C_Info)
{
	npc = vlk_6007_ruen;
	nr = 1;
	condition = dia_ruen_hello_last_condition;
	information = dia_ruen_hello_last_info;
	permanent = TRUE;
	important = FALSE;
	description = "Есть еще новости?";
};


func int dia_ruen_hello_last_condition()
{
	if(RUENSKLEPKNOWN == TRUE)
	{
		return TRUE;
	};
};

func void dia_ruen_hello_last_info()
{
	AI_Output(other,self,"DIA_Ruen_Hello_Last_01_00");	//Есть еще новости?
	AI_Output(self,other,"DIA_Ruen_Hello_Last_01_01");	//Пока нет.
};


