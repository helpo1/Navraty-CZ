
var int luzian_betreten;

instance XOR_8001_WARRIORNATURE_EXIT(C_Info)
{
	npc = XOR_12207_WARRIORNATURE;
	nr = 999;
	condition = xor_8001_warriornature_exit_condition;
	information = xor_8001_warriornature_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int xor_8001_warriornature_exit_condition()
{
	return TRUE;
};

func void xor_8001_warriornature_exit_info()
{
	AI_StopProcessInfos(self);
};


instance XOR_8001_WARRIORNATURE_FOUND(C_Info)
{
	npc = XOR_12207_WARRIORNATURE;
	nr = 1;
	condition = xor_8001_warriornature_found_condition;
	information = xor_8001_warriornature_found_info;
	important = TRUE;
	permanent = FALSE;
};


func int xor_8001_warriornature_found_condition()
{
	if((GUARDIAN_RING == TRUE) && !Npc_IsDead(luzian_demon))
	{
		return TRUE;
	};
};

func void xor_8001_warriornature_found_info()
{
	LUZIAN_BETRETEN = FALSE;
	AI_Output(self,other,"XOR_8001_WarriorNature_Found_01");	//Так вот кого Хранители послали мне в подмогу...(оценивающе) А ты не производишь впечатление сильного воина.
	AI_Output(other,self,"XOR_8001_WarriorNature_Found_02");	//Хранители... А как ты узнал?
	AI_Output(self,other,"XOR_8001_WarriorNature_Found_03");	//Ты хоть имеешь представление, что за кольцо у тебя на руке? Кто дал его тебе?
	AI_Output(other,self,"XOR_8001_WarriorNature_Found_04");	//Мне дал его Дагот.
	AI_Output(self,other,"XOR_8001_WarriorNature_Found_05");	//Все правильно - один из Хранителей! Это кольцо - их символ власти. Именно поэтому я и заговорил с тобой.
	AI_Output(self,other,"XOR_8001_WarriorNature_Found_06");	//Судя по твоим словам, ты еще только вступил на этот путь. Что привело тебя сюда?
	AI_Output(other,self,"XOR_8001_WarriorNature_Found_07");	//Я ищу древнего демона - Люциана. Может, ты мне поможешь в моих поисках?
	AI_Output(self,other,"XOR_8001_WarriorNature_Found_08");	//(смеется) Вот уж не думал.
	AI_Output(self,other,"XOR_8001_WarriorNature_Found_09");	//Ты назвал имя Люциан? Считай, что ты уже нашел его. Он находится в пещере позади меня.
	AI_Output(self,other,"XOR_8001_WarriorNature_Found_10");	//Хорошо, что ты не пошел туда один - демон разорвал бы тебя на части!
	AI_Output(other,self,"XOR_8001_WarriorNature_Found_11");	//А откуда ты знаешь, что он там?
	AI_Output(self,other,"XOR_8001_WarriorNature_Found_12");	//Он там, поверь мне. Этот демон - сущее зло! Я охочусь за ним уже более тысячи лет.
	AI_Output(self,other,"XOR_8001_WarriorNature_Found_13");	//И, наконец, мне удалось загнать зверя в ловушку. Но Люциан силен, и мне одному будет трудно справится с ним.
	AI_Output(self,other,"XOR_8001_WarriorNature_Found_14");	//Вот почему я просил Хранителей прислать мне кого-нибудь в помощь - и они прислали тебя.
	AI_Output(self,other,"XOR_8001_WarriorNature_Found_15");	//Да, парень, - похоже, иного выхода у меня нет, кроме как идти в пещеру именно с тобой.
	AI_Output(self,other,"XOR_8001_WarriorNature_Found_16");	//Ты готов?
	Info_ClearChoices(xor_8001_warriornature_found);
	B_LogEntry(TOPIC_GUARDIANSTEST,"В долине рядом с башней Ксардаса я встретил одного воина. И, похоже, у нас с ним оказались схожие цели. Нам обоим надо прогуляться в пещеру, где находится демон Люциан.");
	Info_AddChoice(xor_8001_warriornature_found,"Подожди! Мне надо немного времени, чтобы собраться с духом.",xor_8001_warriornature_found_no);
	Info_AddChoice(xor_8001_warriornature_found,"Идем в пещеру - уничтожим Люциана!",xor_8001_warriornature_found_yes);
};

func void xor_8001_warriornature_found_no()
{
	AI_Output(other,self,"XOR_8001_WarriorNature_Found_17");	//Подожди, мне надо немного времени, чтобы собраться с духом и проверить снаряжение.
	AI_Output(self,other,"XOR_8001_WarriorNature_Found_18");	//Ага, ты немного боишься? Хорошо, я жду тебя тут. Но не тяни долго с подготовкой.
	LUZIAN_BETRETEN = TRUE;
	Info_ClearChoices(xor_8001_warriornature_found);
};

func void xor_8001_warriornature_found_yes()
{
	AI_Output(other,self,"XOR_8001_WarriorNature_Found_19");	//Хорошо, идем.
	AI_Output(self,other,"XOR_8001_WarriorNature_Found_20");	//Да защитят нас Хранители!
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"Guide");
	LUZIAN_BETRETEN = FALSE;
};

instance XOR_8001_WARRIORNATURE_PLATIE(C_Info)
{
	npc = XOR_12207_WARRIORNATURE;
	nr = 1;
	condition = xor_8001_warriornature_PLATIE_condition;
	information = xor_8001_warriornature_PLATIE_info;
	permanent = FALSE;
	description = "Что на тебе за доспехи?";
};

func int xor_8001_warriornature_PLATIE_condition()
{
	if(Npc_KnowsInfo(hero,XOR_8001_WarriorNature_Found) == TRUE)
	{
		return TRUE;
	};
};

func void xor_8001_warriornature_PLATIE_info()
{
	AI_Output(other,self,"XOR_8001_WarriorNature_PLATIE_01");	//Что на тебе за доспехи? Немного на платье смахивает.
	AI_Output(self,other,"XOR_8001_WarriorNature_PLATIE_02");	//Хммм...
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

instance XOR_8001_WARRIORNATURE_LUZIAN(C_Info)
{
	npc = XOR_12207_WARRIORNATURE;
	nr = 1;
	condition = xor_8001_warriornature_luzian_condition;
	information = xor_8001_warriornature_luzian_info;
	important = FALSE;
	permanent = TRUE;
	description = "Идем в пещеру - уничтожим Люциана!";
};

func int xor_8001_warriornature_luzian_condition()
{
	if(LUZIAN_BETRETEN == TRUE)
	{
		return TRUE;
	};
};

func void xor_8001_warriornature_luzian_info()
{
	AI_Output(other,self,"XOR_8001_WarriorNature_Found_21");	//Идем в пещеру - уничтожим Люциана!
	AI_Output(self,other,"XOR_8001_WarriorNature_Found_22");	//Хорошо, идем. Будь наготове! Да защитят нас Хранители...
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"Guide");
	LUZIAN_BETRETEN = FALSE;
};

instance XOR_8001_WARRIORNATURE_DEMON_DEAD(C_Info)
{
	npc = XOR_12207_WARRIORNATURE;
	condition = xor_8001_warriornature_demon_dead_condition;
	information = xor_8001_warriornature_demon_dead_info;
	important = TRUE;
	permanent = FALSE;
};


func int xor_8001_warriornature_demon_dead_condition()
{
	if(Npc_KnowsInfo(hero,xor_8001_warriornature_found) && Npc_IsDead(luzian_demon))
	{
		return TRUE;
	};
};

func void xor_8001_warriornature_demon_dead_info()
{
	AI_Output(self,other,"XOR_8001_WarriorNature_Demon_Dead_01");	//Он мертв! Наконец-то... Я уже и не думал, что это когда-либо произойдет.
	AI_Output(other,self,"XOR_8001_WarriorNature_Demon_Dead_02");	//Да, Люциан мертв. Никогда еще не видел подобных существ!
	AI_Output(self,other,"XOR_8001_WarriorNature_Demon_Dead_03");	//Сколько силы и злобы было в этом демоне - я до сих пор не могу поверить, что все позади.
	AI_Output(other,self,"XOR_8001_WarriorNature_Demon_Dead_04");	//Да, этот бой я не забуду никогда!
	AI_Output(self,other,"XOR_8001_WarriorNature_Demon_Dead_05");	//Я тоже, мой друг! Спасибо, что помог мне. Теперь прощай. Может быть, мы еще встретимся.
	B_LogEntry(TOPIC_GUARDIANSTEST,"Люциан мертв. Древний демон оказался очень серьезным противником, и бой с ним, кажется, отнял у меня все силы. Но все позади, и теперь мне надо вернуться к Даготу, чтобы отдать ему сердце поверженного нами демона.");
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"Guard");
};

