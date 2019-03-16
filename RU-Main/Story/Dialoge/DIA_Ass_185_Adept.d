instance DIA_Ass_185_Adept_EXIT(C_Info)
{
	npc = Ass_185_Adept;
	nr = 999;
	condition = DIA_Ass_185_Adept_exit_condition;
	information = DIA_Ass_185_Adept_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Ass_185_Adept_exit_condition()
{
	return TRUE;
};

func void DIA_Ass_185_Adept_exit_info()
{
	AI_Output(self,other,"DIA_Ass_185_Adept_exit_01_01");	//(мрачно) Извини, приятель. Но, к сожалению, я просто так тебя отпустить не смогу.
	AI_Output(self,other,"DIA_Ass_185_Adept_exit_01_02");	//Это, конечно, не моя тайна, однако мой хозяин будет недоволен, если ты всем разболтаешь про этот рудник.
	AI_Output(self,other,"DIA_Ass_185_Adept_exit_01_03");	//Не волнуйся, я убью тебя быстро.
	B_LogEntry(TOPIC_Intriges,"Лука задумал меня убить. Как всегда, я оказался не в том месте и не в то время.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(Ass_184_Adept,"Pray");
	B_Attack(self,other,AR_KILL,1);
};

instance DIA_Ass_185_Adept_Hello(C_Info)
{
	npc = Ass_185_Adept;
	nr = 1;
	condition = DIA_Ass_185_Adept_hello_condition;
	information = DIA_Ass_185_Adept_hello_info;
	permanent = FALSE;
	important = TRUE;
};
	
func int DIA_Ass_185_Adept_hello_condition()
{
	return TRUE;
};	
	
func void DIA_Ass_185_Adept_hello_info()
{
	AI_Output(self,other,"DIA_Ass_185_Adept_hello_01_01");	//Так-так. Кто это у нас здесь?
	AI_Output(other,self,"DIA_Ass_185_Adept_hello_01_02");	//А кто спрашивает?
	AI_Output(self,other,"DIA_Ass_185_Adept_hello_01_03");	//Братья зовут меня Лука, но, думаю, мое имя тебе мало что сейчас говорит.
	AI_Output(self,other,"DIA_Ass_185_Adept_hello_01_04");	//(оценивающе) Хммм. А ты не производишь впечатление особо сильного человека.
	AI_Output(self,other,"DIA_Ass_185_Adept_hello_01_05");	//Хотя, насколько мне известно, довольно лихо разделался с Хасимом.
	AI_Output(other,self,"DIA_Ass_185_Adept_hello_01_06");	//А откуда тебе это известно?
	AI_Output(self,other,"DIA_Ass_185_Adept_hello_01_07");	//Как откуда? Потому что это я должен был позаботиться о нем.
	AI_Output(self,other,"DIA_Ass_185_Adept_hello_01_08");	//Но приор Тиамант почему-то решил доверить это дело тебе.
	AI_Output(self,other,"DIA_Ass_185_Adept_hello_01_09");	//И ты, как ни странно, свой шанс не упустил.
	B_LogEntry(TOPIC_Intriges,"В золотом руднике я повстречал Тень по имени Лука. Кажется, эта встреча не случайна, поскольку он работает на приора Тиаманта. Надо разузнать у него обо всем поподробней.");
};	

instance DIA_Ass_185_Adept_Tiamant(C_Info)
{
	npc = Ass_185_Adept;
	nr = 1;
	condition = DIA_Ass_185_Adept_Tiamant_condition;
	information = DIA_Ass_185_Adept_Tiamant_info;
	permanent = FALSE;
	description = "Почему Тиамант приказал его убить?";
};
	
func int DIA_Ass_185_Adept_Tiamant_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Ass_185_Adept_hello))
	{
		return TRUE;
	};
};	
	
func void DIA_Ass_185_Adept_Tiamant_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Ass_185_Adept_Tiamant_01_01");	//Почему Тиамант приказал его убить?
	AI_Output(self,other,"DIA_Ass_185_Adept_Tiamant_01_02");	//Просто парень влез не в свое дело. А остальное тебя волновать не должно.
	AI_Output(self,other,"DIA_Ass_185_Adept_Tiamant_01_03");	//Иначе можешь кончить так же, как и он.
};	

instance DIA_Ass_185_Adept_WhatDo(C_Info)
{
	npc = Ass_185_Adept;
	nr = 1;
	condition = DIA_Ass_185_Adept_WhatDo_condition;
	information = DIA_Ass_185_Adept_WhatDo_info;
	permanent = FALSE;
	description = "А что ты здесь делаешь?";
};
	
func int DIA_Ass_185_Adept_WhatDo_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Ass_185_Adept_hello))
	{
		return TRUE;
	};
};	
	
func void DIA_Ass_185_Adept_WhatDo_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Ass_185_Adept_WhatDo_01_01");	//А что ты здесь делаешь?
	AI_Output(self,other,"DIA_Ass_185_Adept_WhatDo_01_02");	//Я и сам толком не знаю. Но раз ты сюда пришел, то, наверное, жду тебя.
	AI_Output(other,self,"DIA_Ass_185_Adept_WhatDo_01_03");	//Интересно, зачем?
	AI_Output(self,other,"DIA_Ass_185_Adept_WhatDo_01_04");	//Тот же вопрос я могу задать и тебе. Что тебе тут понадобилось, раз ты сюда явился?
	AI_Output(other,self,"DIA_Ass_185_Adept_WhatDo_01_05");	//Я выполняю приказ приора Осаира. Он полагает, что тут где-то есть большой золотой рудник.
	AI_Output(other,self,"DIA_Ass_185_Adept_WhatDo_01_06");	//И, по всей видимости, он тут действительно есть!
	AI_Output(self,other,"DIA_Ass_185_Adept_WhatDo_01_07");	//Правда?
	AI_Output(other,self,"DIA_Ass_185_Adept_WhatDo_01_08");	//Ну да, он как раз позади тебя.
	AI_Output(self,other,"DIA_Ass_185_Adept_WhatDo_01_09");	//Эх...(ехидно) Видимо, не заметил.
	AI_Output(other,self,"DIA_Ass_185_Adept_WhatDo_01_10");	//Это довольно странно, ведь чуть ли не вся пещера блестит золотом.
	AI_Output(self,other,"DIA_Ass_185_Adept_WhatDo_01_11");	//Ну, с кем не бывает.
};	


instance DIA_Ass_185_Adept_StrangeGuy(C_Info)
{
	npc = Ass_185_Adept;
	nr = 1;
	condition = DIA_Ass_185_Adept_StrangeGuy_condition;
	information = DIA_Ass_185_Adept_StrangeGuy_info;
	permanent = FALSE;
	description = "Так ты работаешь на приора Тиаманта?";
};
	
func int DIA_Ass_185_Adept_StrangeGuy_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Ass_185_Adept_hello))
	{
		return TRUE;
	};
};	
	
func void DIA_Ass_185_Adept_StrangeGuy_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Ass_185_Adept_StrangeGuy_01_01");	//Так ты работаешь на приора Тиаманта?
	AI_Output(self,other,"DIA_Ass_185_Adept_StrangeGuy_01_02");	//Да, это так. А тебя это удивляет?
	AI_Output(other,self,"DIA_Ass_185_Adept_StrangeGuy_01_03");	//Почему в деле с Хасимом он решил довериться новичку, а не тебе?
	AI_Output(self,other,"DIA_Ass_185_Adept_StrangeGuy_01_04");	//Это легко объяснить.
	AI_Output(self,other,"DIA_Ass_185_Adept_StrangeGuy_01_05");	//Если бы ты наломал дров, ни у кого и мысли не возникло бы, что это сделано по его приказу.
	AI_Output(self,other,"DIA_Ass_185_Adept_StrangeGuy_01_06");	//Тебе попросту никто не поверил бы.
	AI_Output(self,other,"DIA_Ass_185_Adept_StrangeGuy_01_07");	//А с лгунами у нас разговор короткий. Чик - и ты уже у Белиара!
	AI_Output(self,other,"DIA_Ass_185_Adept_StrangeGuy_01_08");	//Но ты, по всей видимости, не из числа тех тупых баранов, что сами суют свою голову в петлю. 
	AI_Output(self,other,"DIA_Ass_185_Adept_StrangeGuy_01_09");	//Хасим был крепким орешком, и я был очень сильно удивлен, когда узнал, что у тебя получилось его убить.
	AI_Output(self,other,"DIA_Ass_185_Adept_StrangeGuy_01_10");	//Надеюсь, что ты вновь подтвердишь свою репутацию. Иначе будет не очень интересно!
	AI_Output(other,self,"DIA_Ass_185_Adept_StrangeGuy_01_11");	//Ты это о чем?
	AI_Output(self,other,"DIA_Ass_185_Adept_StrangeGuy_01_12");	//Не переживай, скоро ты сам обо всем узнаешь.
};	