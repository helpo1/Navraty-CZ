
instance DIA_ORC_8563_URGROM_EXIT(C_Info)
{
	npc = orc_8563_urgrom;
	condition = dia_orc_8563_urgrom_exit_condition;
	information = dia_orc_8563_urgrom_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};


func int dia_orc_8563_urgrom_exit_condition()
{
	return TRUE;
};

func void dia_orc_8563_urgrom_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ORC_8563_URGROM_HELLO_WAIT(C_Info)
{
	npc = orc_8563_urgrom;
	condition = dia_orc_8563_urgrom_hello_wait_condition;
	information = dia_orc_8563_urgrom_hello_wait_info;
	important = FALSE;
	permanent = TRUE;
	description = "Похоже я знаю тебя, призрак!";
};


func int dia_orc_8563_urgrom_hello_wait_condition()
{
	if((MEETURGROM == FALSE) && (BLKDRAGNISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_orc_8563_urgrom_hello_wait_info()
{
	AI_Output(other,self,"DIA_Orc_8563_UrGrom_Hello_Wait_Info_01_01");	//Похоже, я тебя знаю, призрак! Твое лицо... оно кажется мне знакомым.
	AI_Output(other,self,"DIA_Orc_8563_UrGrom_Hello_Wait_Info_01_02");	//Ты... ты наверно... ну да... конечно! Ур-Гром!
	AI_Output(self,other,"DIA_Orc_8563_UrGrom_Hello_Wait_Info_01_03");	//...Человек говорить Ур-Гром? Откуда он знать мое имя?
	AI_Output(other,self,"DIA_Orc_8563_UrGrom_Hello_Wait_Info_01_04");	//Твой брат, Ур-Тралл рассказывал о тебе.
	AI_Output(self,other,"DIA_Orc_8563_UrGrom_Hello_Wait_Info_01_05");	//Брат Ур-Грома... брат... брат... Ур-Тралл...(думает)
	AI_Output(self,other,"DIA_Orc_8563_UrGrom_Hello_Wait_Info_01_06");	//Да, думать, что так.
	AI_Output(self,other,"DIA_Orc_8563_UrGrom_Hello_Wait_Info_01_07");	//Иметь брат очень давно, много зим назад. Ур-Гром помнить брата Ур-Тралла!
	AI_Output(self,other,"DIA_Orc_8563_UrGrom_Hello_Wait_Info_01_08");	//Ур-Гром и брат сражаться вместе против своих врагов, сражаться против злой демон.
	AI_Output(self,other,"DIA_Orc_8563_UrGrom_Hello_Wait_Info_01_09");	//Человек знать брата Ур-Грома?
	AI_Output(other,self,"DIA_Orc_8563_UrGrom_Hello_Wait_Info_01_10");	//Да, я встречал твоего брата. Скажу больше, именно он та причина, что заставила меня появится здесь.
	AI_Output(self,other,"DIA_Orc_8563_UrGrom_Hello_Wait_Info_01_11");	//Зачем человек прийти сюда?
	AI_Output(other,self,"DIA_Orc_8563_UrGrom_Hello_Wait_Info_01_12");	//Я здесь потому, что Ур-Тралл хочет отомстить Азгалору. Отомстить за свой народ, отомстить за тебя и за себя!
	AI_Output(self,other,"DIA_Orc_8563_UrGrom_Hello_Wait_Info_01_13");	//Он не забыть ужасный демон?!
	AI_Output(self,other,"DIA_Orc_8563_UrGrom_Hello_Wait_Info_01_14");	//Брат приходить убить его?
	AI_Output(other,self,"DIA_Orc_8563_UrGrom_Hello_Wait_Info_01_15");	//Нет, Ур-Тралл не может появится в долине, иначе проклятие, наложенное на всех вас Азгалором, снова возобладает над ним.
	AI_Output(self,other,"DIA_Orc_8563_UrGrom_Hello_Wait_Info_01_16");	//Человек один хотеть убить демон?!
	AI_Output(self,other,"DIA_Orc_8563_UrGrom_Hello_Wait_Info_01_18");	//Ур-Гром думать, что человек быть очень смелый воин. Но человек не сможет один победить демон.
	AI_Output(self,other,"DIA_Orc_8563_UrGrom_Hello_Wait_Info_01_19");	//Человек умирать, отдавать дух демону. Демон очень сильный, очень злой!
	AI_Output(other,self,"DIA_Orc_8563_UrGrom_Hello_Wait_Info_01_20");	//Мне уже не раз приходилось сражаться с чудовищами, подобными ему. Справлюсь и в этот раз.
	AI_Output(self,other,"DIA_Orc_8563_UrGrom_Hello_Wait_Info_01_21");	//Не знать силу демон! Думать, демон слабый. Думать, что он сильнее, чем демон.
	AI_Output(self,other,"DIA_Orc_8563_UrGrom_Hello_Wait_Info_01_22");	//Ур-Гром говорить, человек ошибаться! Много братьев хотеть убить демон, но все мертвы, все теперь служат ему.
	AI_Output(self,other,"DIA_Orc_8563_UrGrom_Hello_Wait_Info_01_23");	//Человек нужен помощь. Один он умирать!
	B_LogEntry(TOPIC_URNAZULRAGE,"В заброшенном лагере орков-призраков я встретил погибшего брата Ур-Тралла - Ур-Грома. По его словам, черный дракон Азгалор - очень могущественное создание, и в одиночку мне с ним не справиться.");
	self.name[0] = "Ур-Гром, орк-призрак";
	MEETURGROM = TRUE;
};


instance DIA_ORC_8563_URGROM_HELLO_HELP(C_Info)
{
	npc = orc_8563_urgrom;
	condition = dia_orc_8563_urgrom_hello_help_condition;
	information = dia_orc_8563_urgrom_hello_help_info;
	important = FALSE;
	permanent = TRUE;
	description = "Ты можешь мне чем-то помочь?";
};


func int dia_orc_8563_urgrom_hello_help_condition()
{
	if((MEETURGROM == TRUE) && (MEETURGROMNEXT == FALSE))
	{
		return TRUE;
	};
};

func void dia_orc_8563_urgrom_hello_help_info()
{
	AI_Output(other,self,"DIA_Orc_8563_UrGrom_Hello_Help_Info_01_01");	//А ты сможешь помочь мне уничтожить эту тварь?
	AI_Output(self,other,"DIA_Orc_8563_UrGrom_Hello_Help_Info_01_02");	//Ур-Гром думать, как он может помочь человек...
	AI_Output(self,other,"DIA_Orc_8563_UrGrom_Hello_Help_Info_01_03");	//Хотеть идти сражаться вместе с человек против демон! (гневно) Мстить за братьев!
	AI_Output(self,other,"DIA_Orc_8563_UrGrom_Hello_Help_Info_01_04");	//Но не может. Азгалор забрал душу Ур-Грома - Ур-Гром умереть, если пойти против демон.
	AI_Output(self,other,"DIA_Orc_8563_UrGrom_Hello_Help_Info_01_05");	//Человеку нужен другой помощник... Думать, человеку нужно найти ДВАРТАЗДАХ.
	AI_Output(other,self,"DIA_Orc_8563_UrGrom_Hello_Help_Info_01_06");	//А что это такое - ДВАРТАЗДАХ?
	AI_Output(self,other,"DIA_Orc_8563_UrGrom_Hello_Help_Info_01_07");	//Быть древний оружие! Оружие великого воина-духа!
	AI_Output(self,other,"DIA_Orc_8563_UrGrom_Hello_Help_Info_01_08");	//С ним человек может победить демон.
	AI_Output(other,self,"DIA_Orc_8563_UrGrom_Hello_Help_Info_01_09");	//Где мне искать это оружие?
	AI_Output(self,other,"DIA_Orc_8563_UrGrom_Hello_Help_Info_01_10");	//Ур-Гром не знать точно. Только слышать когда-то о нем от сынов духа, но сам не видеть никогда.
	AI_Output(self,other,"DIA_Orc_8563_UrGrom_Hello_Help_Info_01_11");	//Человек сам находить ДВАРТАЗДАХ, приносить его Ур-Грому, а потом идти сражаться против демон.
	AI_Output(self,other,"DIA_Orc_8563_UrGrom_Hello_Help_Info_01_12");	//Если находить ДВАРТАЗДАХ, приносить его Ур-Грому. Потом идти сражаться против демон.
	AI_Output(other,self,"DIA_Orc_8563_UrGrom_Hello_Help_Info_01_13");	//Хорошо, я попробую отыскать этот... как его там...
	AI_Output(self,other,"DIA_Orc_8563_UrGrom_Hello_Help_Info_01_14");	//ДВАРТАЗДАХ!
	AI_Output(other,self,"DIA_Orc_8563_UrGrom_Hello_Help_Info_01_15");	//...точно, именно его.
	AI_Output(self,other,"DIA_Orc_8563_UrGrom_Hello_Help_Info_01_16");	//Тогда человек идти, Ур-Гром его ждать.
	B_LogEntry(TOPIC_URNAZULRAGE,"Ур-Гром поведал мне, что где-то в долине спрятано древнее оружие духов - по-орочьи оно называется ДВАРТАЗДАХ. Это оружие, по словам Ур-Грома, способно доставить серьезные неприятности Азгалору.");
	MEETURGROMNEXT = TRUE;
};


instance DIA_ORC_8563_URGROM_HELLO_FIND(C_Info)
{
	npc = orc_8563_urgrom;
	condition = dia_orc_8563_urgrom_hello_find_condition;
	information = dia_orc_8563_urgrom_hello_find_info;
	important = FALSE;
	permanent = TRUE;
	description = "Это случайно не то оружие?";
};


func int dia_orc_8563_urgrom_hello_find_condition()
{
	if((Npc_HasItems(other,itrw_addon_magiccrossbow_shv) >= 1) && (MEETURGROMNEXT == TRUE) && (MEETURGROMCOME == FALSE))
	{
		return TRUE;
	};
};

func void dia_orc_8563_urgrom_hello_find_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Orc_8563_UrGrom_Hello_Find_01_01");	//А это случайно не то оружие, про которое ты говорил?
	AI_Output(self,other,"DIA_Orc_8563_UrGrom_Hello_Find_01_02");	//Ур-Гром думать, что то. Человек нашел ДВАРТАЗДАХ!!!
	AI_Output(self,other,"DIA_Orc_8563_UrGrom_Hello_Find_01_03");	//Теперь идти убивать демон! Мстить за братьев!
	AI_Output(other,self,"DIA_Orc_8563_UrGrom_Hello_Find_01_04");	//Тогда я пошел.
	B_LogEntry(TOPIC_URNAZULRAGE,"Я нашел ДВАРТАЗДАХ, точнее Вершитель - древнее оружие воинов-духов, обитавших когда-то в этих местах...");
	AI_StopProcessInfos(self);
	MEETURGROMCOME = TRUE;
	Npc_ExchangeRoutine(self,"UrGromGoBattle");
};


instance DIA_ORC_8563_URGROM_AZGOLOR_WAIT(C_Info)
{
	npc = orc_8563_urgrom;
	condition = dia_orc_8563_urgrom_azgolor_wait_condition;
	information = dia_orc_8563_urgrom_azgolor_wait_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_orc_8563_urgrom_azgolor_wait_condition()
{
	if((AZGOLORAPPEAR == TRUE) && (MEETURGROMCOME == TRUE) && (MEETURGROMEND == FALSE))
	{
		return TRUE;
	};
};

func void dia_orc_8563_urgrom_azgolor_wait_info()
{
	AI_Output(self,other,"DIA_Orc_8563_UrGrom_Azgolor_Wait_01_01");	//Демон быть уже здесь, ждать человек.
	AI_Output(self,other,"DIA_Orc_8563_UrGrom_Azgolor_Wait_01_02");	//Человек идти дальше и встречать демон...
	AI_Output(self,other,"DIA_Orc_8563_UrGrom_Azgolor_Wait_01_03");	//Ур-Гром смотреть, как человек убивать демон.
	AI_Output(self,other,"DIA_Orc_8563_UrGrom_Azgolor_Wait_01_04");	//Человек не забыть носить с собой ДВАРТАЗДАХ!
	AI_Output(other,self,"DIA_Orc_8563_UrGrom_Azgolor_Wait_01_05");	//Само собой.
	AI_Output(self,other,"DIA_Orc_8563_UrGrom_Azgolor_Wait_01_06");	//Ур-Гром желать человек удачная охота.
	self.flags = 0;
	MEETURGROMEND = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_ORC_8563_URGROM_AZGOLOR_WAIT_AGAIN(C_Info)
{
	npc = orc_8563_urgrom;
	condition = dia_orc_8563_urgrom_azgolor_wait_again_condition;
	information = dia_orc_8563_urgrom_azgolor_wait_again_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_orc_8563_urgrom_azgolor_wait_again_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MEETURGROMEND == TRUE) && (BLKDRAGNISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_orc_8563_urgrom_azgolor_wait_again_info()
{
	AI_Output(self,other,"DIA_Orc_8563_UrGrom_Azgolor_Wait_Again_01_01");	//Человек идти убивать демон. Ур-Гром ждать его здесь!
	AI_StopProcessInfos(self);
};

