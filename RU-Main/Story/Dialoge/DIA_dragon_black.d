
instance DIA_DRAGON_BLACK_EXIT(C_Info)
{
	npc = dragon_black;
	nr = 999;
	condition = dia_dragon_black_exit_condition;
	information = dia_dragon_black_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_dragon_black_exit_condition()
{
	if(DragonTalk_Exit_Free == TRUE)
	{
		return TRUE;
	};
};

func void dia_dragon_black_exit_info()
{
	AI_StopProcessInfos(self);
	DragonTalk_Exit_Free = FALSE;
	self.flags = 0;
};


instance DIA_DRAGON_BLACK_HELLO(C_Info)
{
	npc = dragon_black;
	nr = 5;
	condition = dia_dragon_black_hello_condition;
	information = dia_dragon_black_hello_info;
	important = TRUE;
};


func int dia_dragon_black_hello_condition()
{
	if((DRAGONBLACKMEET == FALSE) && (AZGOLORAPPEAR == TRUE))
	{
		return TRUE;
	};
};

func void dia_dragon_black_hello_info()
{
	Snd_Play("MFX_FEAR_CAST");
	AI_Output(self,other,"DIA_Dragon_Black_Hello_01_00");	//Человек!? А я-то думал, что уничтожил вас всех, жалкие людишки!
	AI_Output(other,self,"DIA_Dragon_Black_Hello_01_01");	//Как видишь, ты немного ошибся. И думаю, что это станет твоей последней ошибкой.
	AI_Output(self,other,"DIA_Dragon_Black_Hello_01_05");	//(рычит) Значит, своим беспокойством я обязан тебе?! Простому смертному?
	AI_Output(other,self,"DIA_Dragon_Black_Hello_01_03");	//Именно так оно и есть, дракон. Я пришел сюда, чтобы снести тебе твою поганую голову!
	AI_Output(self,other,"DIA_Dragon_Black_Hello_01_07");	//(рычит) Раз ты сумел добраться до меня, то, очевидно, мой верный слуга Дакат потерпел неудачу.
	AI_Output(self,other,"DIA_Dragon_Black_Hello_01_08");	//Безмозглая тварь! Все надо доделывать самому!
	AI_Output(self,other,"DIA_Dragon_Black_Hello_01_09");	//Ну что же, я вырву у тебя сердце, заберу душу, а плоть разорву на мелкие кусочки!
	AI_Output(other,self,"DIA_Dragon_Black_Hello_01_10");	//Это мы еще посмотрим, кто кому вырвет сердце! Привет тебе от Ур-Тралла!
	AI_Output(self,other,"DIA_Dragon_Black_Hello_01_14");	//Ур-Тралл? Ах да, я помню этого слизняка. Сам он не осмелился бросить мне вызов? Впрочем, это не важно.

	if(MEETURGROM == 4)
	{
		AI_Output(self,other,"DIA_Dragon_Black_Hello_01_19");	//Я вижу, ты привел с собой могучего Ур-Грома!
		AI_Output(self,other,"DIA_Dragon_Black_Hello_01_20");	//Его душа принадлежит мне, так же как и весь их мерзкий народец!
	};
	if(Npc_HasItems(other,itrw_addon_magiccrossbow_shv) >= 1)
	{
		AI_Output(self,other,"DIA_Dragon_Black_Hello_01_21");	//О, я вижу, ты отыскал Вершителя - оружие воина-духа, низвергнутого мной!
		AI_Output(self,other,"DIA_Dragon_Black_Hello_01_22");	//И ты наивно полагаешь, что он тебе поможет одолеть меня?
	};

	AI_Output(other,self,"DIA_Dragon_Black_Hello_01_17");	//Хватит попусту тратить время на болтовню! Пора заняться делом.
	AI_Output(self,other,"DIA_Dragon_Black_Hello_01_18");	//(презрительно) Я уже чувствую вкус твоей крови, герой...
	AI_PlayAni(self,"T_WARN");
	AI_Output(self,other,"DIA_Dragon_Black_Hello_01_23");	//МОИ ЗУБЫ - МЕЧИ! МОИ КОГТИ - КОПЬЯ! МОИ КРЫЛЬЯ - УРАГАН!
	AI_Output(self,other,"DIA_Dragon_Black_Hello_01_24");	//Я - ЭТО ПЛАМЯ! Я - ЭТО... СМЕРТЬ!
	B_LogEntry(TOPIC_URNAZULRAGE,"Великая Тень, Азгалор, - здесь! Око Гнева пробудило черного дракона и он явился в Долину Теней, ведомый зовом этого могущественного артефакта. В общем, именно этого я и добивался. Теперь только мой меч сможет дать ответ - не напрасно ли все это было сделано?");
	AI_StopProcessInfos(self);
	DragonTalk_Exit_Free = FALSE;
	DRAGONBLACKMEET = TRUE;
	self.flags = 0;
	self.aivar[AIV_EnemyOverride] = FALSE;
};

