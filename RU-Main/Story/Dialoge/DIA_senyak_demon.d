
instance DIA_SENYAK_DEMON_EXIT(C_Info)
{
	npc = senyak_demon;
	nr = 999;
	condition = dia_senyak_demon_exit_condition;
	information = dia_senyak_demon_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_senyak_demon_exit_condition()
{
	if(SHEMRON_TALK == TRUE)
	{
		return TRUE;
	};
};

func void dia_senyak_demon_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SENYAK_DEMON_HELLO(C_Info)
{
	npc = senyak_demon;
	nr = 1;
	condition = dia_senyak_demon_hello_condition;
	information = dia_senyak_demon_hello_info;
	important = TRUE;
};


func int dia_senyak_demon_hello_condition()
{
	return TRUE;
};

func void dia_senyak_demon_hello_info()
{
	Snd_Play("MFX_FEAR_CAST");
	Npc_RemoveInvItems(self,ITMI_DRAGONGOLDGORN,1);
	AI_Output(self,other,"DIA_Senyak_Demon_Hello_01_00");	//...(рычит) КТО ПОСМЕЛ ПОТРЕВОЖИТЬ МОЕ УЕДИНЕНИЕ?!!!
	AI_Output(self,other,"DIA_Senyak_Demon_Hello_01_01");	//(внимательно вглядываясь) Жалкий человечишка, неужели именно ты осмелился это сделать?!
	AI_Output(other,self,"DIA_Senyak_Demon_Hello_01_02");	//Да, это я призвал тебя!
	AI_Output(self,other,"DIA_Senyak_Demon_Hello_01_03");	//ЗАЧЕМ ТЫ ЭТО СДЕЛАЛ?!
	AI_Output(other,self,"DIA_Senyak_Demon_Hello_01_04");	//А ты разве не догадываешься, демон?!
	AI_Output(other,self,"DIA_Senyak_Demon_Hello_01_05");	//Я вызвал тебя сюда, чтобы убить и тем самым положить конец тому ужасу, в который ты собираешься погрузить этот мир...
	AI_Output(self,other,"DIA_Senyak_Demon_Hello_01_06");	//...(смеется) ТЫ РЕШИЛ БРОСИТЬ МНЕ ВЫЗОВ?!!!
	AI_Output(self,other,"DIA_Senyak_Demon_Hello_01_07");	//Аргххх...(рычит) Ты, видимо, очень глуп, если думаешь, что тебе это по силам!
	AI_Output(self,other,"DIA_Senyak_Demon_Hello_01_08");	//ТЫ ХОТЬ ЗНАЕШЬ - КТО Я?!
	AI_Output(other,self,"DIA_Senyak_Demon_Hello_01_09");	//Знаю. Можешь не утруждать себя представлением собственной персоны, С'эньяк!
	AI_Output(self,other,"DIA_Senyak_Demon_Hello_01_10");	//Аргххх...(рычит) Если ты знаешь мое имя, то твой поступок еще больше говорит о том, что ты явно не осознаешь того, кто сейчас находится перед тобой!
	AI_Output(self,other,"DIA_Senyak_Demon_Hello_01_11");	//Бросить вызов МНЕ... бессмертному созданию божественной тьмы Белиара и самому могущественному из его демонов... (рычит)
	AI_Output(self,other,"DIA_Senyak_Demon_Hello_01_12");	//Это равносильно самоубийству! Как безрассудно с твоей стороны рассчитывать на успех в этом деле.
	AI_Output(self,other,"DIA_Senyak_Demon_Hello_01_13");	//Возможно, даже ты уже сейчас осознаешь, что последние мгновения твоей жизни уже сочтены...

	if((Npc_HasItems(other,itru_beliarsrune01) == TRUE) || (Npc_HasItems(other,itru_beliarsrune02) == TRUE) || (Npc_HasItems(other,itru_beliarsrune03) == TRUE) || (Npc_HasItems(other,itru_beliarsrune04) == TRUE) || (Npc_HasItems(other,itru_beliarsrune05) == TRUE) || (Npc_HasItems(other,itru_beliarsrune06) == TRUE) || Npc_HasItems(hero,ItMw_BeliarWeapon_Raven) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_01) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_02) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_03) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_04) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_05) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_06) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_07) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_08) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_09) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_10) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_11) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_12) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_13) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_14) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_15) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_16) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_17) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_18) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_19) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_20) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_01) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_02) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_03) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_04) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_05) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_06) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_07) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_08) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_09) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_10) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_11) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_12) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_13) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_14) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_15) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_16) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_17) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_18) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_19) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_20))
	{
		AI_Output(self,other,"DIA_Senyak_Demon_Hello_01_14");	//...(рычит)!!!
		AI_Output(other,self,"DIA_Senyak_Demon_Hello_01_15");	//Что?
		AI_Output(self,other,"DIA_Senyak_Demon_Hello_01_16");	//....(внимательно вглядываясь) Я почувствовал, что у тебя с собой одна вещь, которая по праву принадлежит мне!
		AI_Output(other,self,"DIA_Senyak_Demon_Hello_01_17");	//Если ты насчет Когтя Белиара, то ты ошибаешься - теперь это моя вещь!
		AI_Output(self,other,"DIA_Senyak_Demon_Hello_01_18");	//КОГОТЬ МОЙ!!! Он и я - единое целое, он моя вторая сущность, моя суть!
		AI_Output(other,self,"DIA_Senyak_Demon_Hello_01_19");	//Ну, тем хуже для тебя. Теперь тебе его точно не видать!
		AI_Output(self,other,"DIA_Senyak_Demon_Hello_01_20");	//Это не надолго! Когда я вырву тебе сердце из груди и заберу твою душу - он снова станет моим!
		AI_Output(self,other,"DIA_Senyak_Demon_Hello_01_21");	//Аргххх...(рычит) Глупый смертный! Мне надо поблагодарить тебя за этот подарок.
	}
	else
	{
		AI_Output(self,other,"DIA_Senyak_Demon_Hello_01_22");	//Аргххх...(рычит) Я с легкостью вырву тебе сердце из груди и заберу твою душу!
	};
	AI_Output(self,other,"DIA_Senyak_Demon_Hello_01_23");	//Не бойся! Смерть тебе покажется не столь мучительной и страшной, насколько это можно представить.
	AI_Output(self,other,"DIA_Senyak_Demon_Hello_01_24");	//Ты даже не успеешь осознать то, что уже мертв!
	AI_Output(self,other,"DIA_Senyak_Demon_Hello_01_25");	//Можешь даже считать, что это уже свершилось! Аргххх...(рычит)
	Info_ClearChoices(dia_senyak_demon_hello);
	Info_AddChoice(dia_senyak_demon_hello,"Хватит болтать! Пора заняться делом...",dia_senyak_demon_hello_ok);

	if(MoraUlartuIsOn[1] == TRUE)
	{
		Info_AddChoice(dia_senyak_demon_hello,"(использовать Мора Уларту)",dia_senyak_demon_hello_mora);
	};
};

func void dia_senyak_demon_hello_ok()
{
	Snd_Play("MYSTERY_04");
	AI_Output(other,self,"DIA_Senyak_Demon_Hello_Ok_01_00");	//Хватит болтать! Пора заняться делом...
	AI_Output(self,other,"DIA_Senyak_Demon_Hello_Ok_01_01");	//Ты так спешишь умереть - ну что же, это твое право, смертный.
	AI_Output(other,self,"DIA_Senyak_Demon_Hello_Ok_01_02");	//Это мы еще посмотрим!
	AI_Output(self,other,"DIA_Senyak_Demon_Hello_Ok_01_03");	//Аргххх...(рычит)
	TALKSENYAK = TRUE;
	self.start_aistate = ZS_MM_AllScheduler;
	AI_StopProcessInfos(self);
};

func void dia_senyak_demon_hello_mora()
{
	AI_PlayAni(other,"T_PRACTICEMAGIC2");
	Wld_PlayEffect("spellFX_Innoseye",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_LIGHTSTAR_RED",self,self,0,0,0,FALSE);
	Snd_Play("DEM_Warn");
	AI_TurnToNPC(other,self);
	AI_Output(self,other,"DIA_Senyak_Demon_Hello_Mora_01_00");	//Аргххх...(рычит)
	AI_Output(other,self,"DIA_Senyak_Demon_Hello_Mora_01_01");	//А как тебе это, демон!
	AI_Output(self,other,"DIA_Senyak_Demon_Hello_Mora_01_02");	//...(рычит) А я тебя недооценил! И думаю, я догадываюсь, что ты задумал, жалкий червь!
	AI_Output(self,other,"DIA_Senyak_Demon_Hello_Mora_01_03");	//Но тебе все равно не одолеть меня, также как и не заполучить мою душу!
	AI_Output(self,other,"DIA_Senyak_Demon_Hello_Mora_01_04");	//К тому же она тебе будет ни к чему, когда ты будешь мертв! Аргххх...(рычит)
	AI_Output(self,other,"DIA_Senyak_Demon_Hello_Mora_01_05");	//Мора Уларту тебе не поможет!
	USEMORAULARTU = TRUE;
};

