
instance DIA_Fellan_EXIT(C_Info)
{
	npc = VLK_480_Fellan;
	nr = 999;
	condition = DIA_Fellan_EXIT_Condition;
	information = DIA_Fellan_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Fellan_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Fellan_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Fellan_PICKPOCKET(C_Info)
{
	npc = VLK_480_Fellan;
	nr = 998;
	condition = DIA_Fellan_PICKPOCKET_Condition;
	information = DIA_Fellan_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int DIA_Fellan_PICKPOCKET_Condition()
{
	return C_Beklauen(18,10);
};

func void DIA_Fellan_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Fellan_PICKPOCKET);
	Info_AddChoice(DIA_Fellan_PICKPOCKET,Dialog_Back,DIA_Fellan_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Fellan_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Fellan_PICKPOCKET_DoIt);
};

func void DIA_Fellan_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Fellan_PICKPOCKET);
};

func void DIA_Fellan_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Fellan_PICKPOCKET);
};

instance DIA_Fellan_News(C_Info)
{
	npc = VLK_480_Fellan;
	nr = 1;
	condition = DIA_Fellan_News_Condition;
	information = DIA_Fellan_News_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Fellan_News_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_NONE) && (self.aivar[AIV_LastFightComment] == FALSE) && (MIS_BELIARHELPME == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Fellan_News_Info()
{
	if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output(self,other,"DIA_Fellan_News_06_00");	//Ох, ты побил меня. Какой героический поступок!

		if((MIS_AttackFellan == LOG_Running) && (FellanGeschlagen == FALSE))
		{
			AI_Output(other,self,"DIA_Fellan_News_15_01");	//Ты прекратишь стучать молотком, или мне задать тебе трепку еще раз?
			AI_Output(self,other,"DIA_Fellan_News_06_02");	//Нет, не надо бить меня больше. Я перестану. Но здесь все обрушится, и в этом будешь виноват ты!
			FellanGeschlagen = TRUE;
			AI_StopProcessInfos(self);
			Npc_ExchangeRoutine(self,"OHNEHAMMER");
		};
	};
	if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
	{
		AI_Output(self,other,"DIA_Fellan_News_06_03");	//В чем дело? Хочешь еще получить по морде?
	};
	if(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_CANCEL)
	{
		AI_Output(self,other,"DIA_Fellan_News_06_04");	//Что ты за псих? То сражаешься, то убегаешь, то болтаешь - что тебе вообще нужно?
	};
	self.aivar[AIV_LastFightComment] = TRUE;
};


instance DIA_Fellan_HALLO(C_Info)
{
	npc = VLK_480_Fellan;
	nr = 2;
	condition = DIA_Fellan_HALLO_Condition;
	information = DIA_Fellan_HALLO_Info;
	permanent = FALSE;
	description = "Зачем ты колотишь молотком?";
};


func int DIA_Fellan_HALLO_Condition()
{
	if((FellanGeschlagen == FALSE) && (MIS_BELIARHELPME == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Fellan_HALLO_Info()
{
	AI_Output(other,self,"DIA_Fellan_HALLO_15_00");	//Зачем ты колотишь молотком?
	AI_Output(self,other,"DIA_Fellan_HALLO_06_01");	//Вот уже несколько дней я отчаянно пытаюсь устранить протечки в моем доме.
	AI_Output(self,other,"DIA_Fellan_HALLO_06_02");	//Балки крошатся с тех пор, как прошли эти последние дожди. Скоро все это упадет мне на голову!
	AI_StopProcessInfos(self);
};


instance DIA_Fellan_Stop(C_Info)
{
	npc = VLK_480_Fellan;
	nr = 3;
	condition = DIA_Fellan_Stop_Condition;
	information = DIA_Fellan_Stop_Info;
	permanent = FALSE;
	description = "Ты не мог бы перестать молотить?";
};


func int DIA_Fellan_Stop_Condition()
{
	if(MIS_AttackFellan == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Fellan_Stop_Info()
{
	AI_Output(other,self,"DIA_Fellan_Stop_15_00");	//Ты не мог бы перестать молотить?
	AI_Output(self,other,"DIA_Fellan_Stop_06_01");	//Нет, я должен закончить работу.
	Info_ClearChoices(DIA_Fellan_Stop);
	Info_AddChoice(DIA_Fellan_Stop,"Прекрати стучать молотком, или я переломаю тебе все кости.",DIA_Fellan_Stop_Bones);
	Info_AddChoice(DIA_Fellan_Stop,"Я дам тебе десять монет, чтобы ты перестал колотить.",DIA_Fellan_Stop_Gold);
	Info_AddChoice(DIA_Fellan_Stop,"Просто перестань молотить. Хорошо?",DIA_Fellan_Stop_Just);
};

func void DIA_Fellan_Stop_Bones()
{
	AI_Output(other,self,"DIA_Fellan_Stop_Bones_15_00");	//Прекрати стучать молотком, или я переломаю тебе все кости.
	AI_Output(self,other,"DIA_Fellan_Stop_Bones_06_01");	//Забудь об этом, или мне придется образумить тебя хорошим ударом молотка по голове.
	AI_StopProcessInfos(self);
};

func void DIA_Fellan_Stop_Gold()
{
	AI_Output(other,self,"DIA_Fellan_Stop_Gold_15_00");	//Я дам тебе десять монет, чтобы ты перестал колотить.
	AI_Output(self,other,"DIA_Fellan_Stop_Gold_06_01");	//Эй... Это очень великодушно с твоей стороны. Но что касается твоего золота, ты можешь...
	AI_Output(self,other,"DIA_Fellan_Stop_Gold_06_02");	//...ну, ты знаешь, куда его засунуть.
};

func void DIA_Fellan_Stop_Just()
{
	AI_Output(other,self,"DIA_Fellan_Stop_Just_15_00");	//Просто перестань молотить. Хорошо?
	AI_Output(self,other,"DIA_Fellan_Stop_Just_06_01");	//Не приставай кол мне, ладно?
};


instance DIA_Fellan_klar(C_Info)
{
	npc = VLK_480_Fellan;
	nr = 5;
	condition = DIA_Fellan_klar_Condition;
	information = DIA_Fellan_klar_Info;
	permanent = TRUE;
	description = "С тобой все в порядке?";
};


func int DIA_Fellan_klar_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Fellan_HALLO) && (MIS_BELIARHELPME == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Fellan_klar_Info()
{
	AI_Output(other,self,"DIA_Fellan_klar_15_00");	//Эй! С тобой все в порядке?

	if(FellanGeschlagen == FALSE)
	{
		AI_Output(self,other,"DIA_Fellan_klar_06_01");	//Будет в порядке, если я смогу закончить ремонт вовремя.
	}
	else
	{
		AI_Output(self,other,"DIA_Fellan_klar_06_02");	//Состояние крыши ухудшается прямо на глазах. В следующий дождь вода в доме поднимется до пояса, и в этом будешь виноват ты!
	};

	AI_StopProcessInfos(self);
};


instance DIA_FELLAN_INSANE(C_Info)
{
	npc = VLK_480_Fellan;
	nr = 1;
	condition = dia_fellan_insane_condition;
	information = dia_fellan_insane_info;
	permanent = FALSE;
	description = "Что ты здесь делаешь?";
};


func int dia_fellan_insane_condition()
{
	if(MIS_BELIARHELPME == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_fellan_insane_info()
{
	AI_Output(other,self,"DIA_Fellan_Insane_01_00");	//Что ты здесь делаешь?
	AI_Output(self,other,"DIA_Fellan_Insane_01_01");	//Не мешай мне! (раздраженно) Не видишь, я пытаюсь починить эту сгоревшую хибару.
	AI_Output(self,other,"DIA_Fellan_Insane_01_03");	//Я решил поселится в ней. Хоринис мне чертовски надоел - а тут все так красиво, тихо и спокойно.
	AI_Output(other,self,"DIA_Fellan_Insane_01_04");	//А ты не боишься, что тебя здесь съедят волки?
	AI_Output(self,other,"DIA_Fellan_Insane_01_07");	//Хватит! Оставь меня в покое!
	AI_StopProcessInfos(self);
};


instance DIA_FELLAN_INSANETWO(C_Info)
{
	npc = VLK_480_Fellan;
	nr = 1;
	condition = dia_fellan_insanetwo_condition;
	information = dia_fellan_insanetwo_info;
	permanent = FALSE;
	description = "Ты и вправду хочешь тут остаться?";
};


func int dia_fellan_insanetwo_condition()
{
	if(Npc_KnowsInfo(other,dia_fellan_insane) && (MIS_BELIARHELPME == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_fellan_insanetwo_info()
{
	AI_Output(other,self,"DIA_Fellan_InsaneTwo_01_00");	//Ты и вправду хочешь тут остаться?
	AI_Output(self,other,"DIA_Fellan_InsaneTwo_01_01");	//Конечно...(восхищенно) Разве ты еще не заметил - как здесь красиво?
	AI_Output(other,self,"DIA_Fellan_InsaneTwo_01_03");	//Но что может быть красивого в куче обгорелых деревяшек?
	AI_Output(self,other,"DIA_Fellan_InsaneTwo_01_04");	//Ты просто глупец, если этого не понимаешь! (презренно) Это самое прекрасное место, которое я когда-либо встречал.
	AI_StopProcessInfos(self);
};


instance DIA_FELLAN_INSANELAST(C_Info)
{
	npc = VLK_480_Fellan;
	nr = 1;
	condition = dia_fellan_insanelast_condition;
	information = dia_fellan_insanelast_info;
	permanent = TRUE;
	description = "Постой! Тут еще одно дело.";
};


func int dia_fellan_insanelast_condition()
{
	if(Npc_KnowsInfo(other,dia_fellan_insanetwo) && (MIS_BELIARHELPME == LOG_Running) && (FELLANGORFIRSTMEET == FALSE))
	{
		return TRUE;
	};
};

func void dia_fellan_insanelast_info()
{
	AI_Output(other,self,"DIA_Fellan_InsaneLast_01_01");	//Постой! Тут еще одно дело.
	if(TELLFIRSTFELLAN == FALSE)
	{
		AI_Output(self,other,"DIA_Fellan_InsaneLast_01_02");	//Опять ты? (злобно) Что тебе от меня нужно?
		AI_Output(other,self,"DIA_Fellan_InsaneLast_01_03");	//Просто я думаю, что ты именно тот человек, которого я ищу.
		AI_Output(self,other,"DIA_Fellan_InsaneLast_01_04");	//(раздраженно) Ну, что опять?
		TELLFIRSTFELLAN = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Fellan_InsaneLast_01_04");	//(раздраженно) Ну, что опять?
	};
	Info_ClearChoices(dia_fellan_insanelast);
	if(ZIGOSMAGICISON == TRUE)
	{
		Info_AddChoice(dia_fellan_insanelast,"...АРХ БЕЛИАР НОМЭН САКТ ДАГАР ХАР...!",dia_fellan_insanelast_yes);
	};
	Info_AddChoice(dia_fellan_insanelast,"Забудь об этом.",dia_fellan_insanelast_no);
};

func void dia_fellan_insanelast_no()
{
	AI_Output(other,self,"DIA_Fellan_InsaneLast_No_01_00");	//Забудь об этом.
	AI_Output(self,other,"DIA_Fellan_InsaneLast_No_01_01");	//Хммм...
	AI_StopProcessInfos(self);
};

func void dia_fellan_insanelast_yes()
{
	B_GivePlayerXP(100);
	//Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
	CreateInvItems(self,ITAR_Dementor,1);
	AI_UnequipArmor(self);
	AI_EquipArmor(self,ITAR_Dementor);
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	self.flags = NPC_FLAG_IMMORTAL;
	self.name[0] = "Феллангор";
	FELLANGORFIRSTMEET = TRUE;
	AI_PlayAni(other,"T_PRACTICEMAGIC5");
	Wld_PlayEffect("spellFX_Fear",other,other,0,0,0,FALSE);
	AI_Output(other,self,"DIA_Fellan_InsaneLast_Yes_01_00");	//...АРХ БЕЛИАР НОМЭН САКТ ДАГАР ХАР...!
	AI_Output(self,other,"DIA_Fellan_InsaneLast_Yes_01_01");	//Аргхх!!! (мертвым голосом) Что ты наделал, жалкий человек? Ты раскрыл мою тайну.
	AI_Output(other,self,"DIA_Fellan_InsaneLast_Yes_01_02");	//Так значит, ты и есть тот избранный, что когда-то служил Белиару, но потом обезумел и отверг своего господина?
	AI_Output(self,other,"DIA_Fellan_InsaneLast_Yes_01_03");	//Да, это я! (властно) И я догадываюсь, зачем ты искал со мной встречи.
	AI_Output(self,other,"DIA_Fellan_InsaneLast_Yes_01_04");	//Но тебе не удастся уничтожить меня, ибо я бессмертен!
	AI_Output(other,self,"DIA_Fellan_InsaneLast_Yes_01_05");	//Вот, взгляни на этот амулет и испытай его силу!
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("spellFX_Innoseye",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Fellan_InsaneLast_Yes_01_06");	//О, нет! Этого не может быть...(обезумевши) Как ты посмел явится с ним ко мне?
	AI_Output(other,self,"DIA_Fellan_InsaneLast_Yes_01_07");	//Я здесь по приказу твоего хозяина, который хочет забрать у тебя то, что принадлежит ему.
	AI_Output(self,other,"DIA_Fellan_InsaneLast_Yes_01_08");	//Аргххх! (сопротивляясь) Глупец! У тебя все равно ничего не выйдет.
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Fellan_InsaneLast_Yes_01_09");	//Магия амулета сильна, но она не способна уничтожить меня до конца!
	AI_Output(self,other,"DIA_Fellan_InsaneLast_Yes_01_10");	//Я уже чувствую, что его сила немного ослабла и теперь мне никто не помешает вновь скрыться от гнева Темного Бога.
	B_LogEntry(TOPIC_BELIARHELPME,"Мне удалось отыскать Феллангора! Я произнес заклинание и использовал амулет, который мне дал Зигос. Как и предполагалось, его сила не смогла убить избранника Белиара, однако, по всей видимости, сильно ослабила его, после чего сам Феллангор исчез. Мне нужно попытаться отыскать его еще раз.");
	Info_ClearChoices(dia_fellan_insanelast);
	Info_AddChoice(dia_fellan_insanelast,"(закончить разговор)",dia_fellan_insanelast_away);
};

func void dia_fellan_insanelast_away()
{
	Wld_StopEffect("DEMENTOR_FX");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,10);
	Npc_ExchangeRoutine(self,"InsanePath");
	B_Attack(self,other,0,0);
};

instance DIA_FELLAN_MEETTWO(C_Info)
{
	npc = VLK_480_Fellan;
	nr = 1;
	condition = dia_fellan_meettwo_condition;
	information = dia_fellan_meettwo_info;
	permanent = FALSE;
	description = "Как ты тут оказалась?";
};


func int dia_fellan_meettwo_condition()
{
	if((MIS_BELIARHELPME == LOG_Running) && (FELLANGORFIRSTMEET == TRUE) && (FELLANGORSECONDMEET == FALSE))
	{
		return TRUE;
	};
};

func void dia_fellan_meettwo_info()
{
	AI_Output(other,self,"DIA_Fellan_MeetTwo_01_00");	//Как ты тут оказалась?
	AI_Output(self,other,"DIA_Fellan_MeetTwo_01_01");	//Я просто решила прогуляться по лесу.
	AI_Output(other,self,"DIA_Fellan_MeetTwo_01_02");	//Прогуляться? Одна и в такой глуши?
	AI_Output(self,other,"DIA_Fellan_MeetTwo_01_03");	//Разве это глушь? Посмотри вокруг - как здесь красиво!
	AI_Output(other,self,"DIA_Fellan_MeetTwo_01_04");	//Хммм... Мне кажется это немного странным.
	AI_Output(self,other,"DIA_Fellan_MeetTwo_01_05");	//(удивленно) О чем это ты?
	SPEAKTWOFELLANGORONCE = TRUE;
	Info_ClearChoices(dia_fellan_meettwo);
	if(ZIGOSMAGICISON == TRUE)
	{
		Info_AddChoice(dia_fellan_meettwo,"...АРХ БЕЛИАР НОМЭН САКТ ДАГАР ХАР...!",dia_fellan_meettwo_yes);
	};
	Info_AddChoice(dia_fellan_meettwo,"Не важно.",dia_fellan_meettwo_no);
};

func void dia_fellan_meettwo_no()
{
	AI_Output(other,self,"DIA_Fellan_MeetTwo_No_01_00");	//Не важно.
	AI_Output(self,other,"DIA_Fellan_MeetTwo_No_01_01");	//Хорошо, как скажешь.
	AI_StopProcessInfos(self);
};

func void dia_fellan_meettwo_yes()
{
	B_GivePlayerXP(200);
	//Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
	CreateInvItems(self,ITAR_Dementor,1);
	AI_UnequipArmor(self);
	AI_EquipArmor(self,ITAR_Dementor);
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	self.flags = NPC_FLAG_IMMORTAL;
	self.name[0] = "Феллангор";
	FELLANGORSECONDMEET = TRUE;
	AI_PlayAni(other,"T_PRACTICEMAGIC5");
	Wld_PlayEffect("spellFX_Fear",other,other,0,0,0,FALSE);
	AI_Output(other,self,"DIA_Fellan_MeetTwo_Yes_01_00");	//...АРХ БЕЛИАР НОМЭН САКТ ДАГАР ХАР...!
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("spellFX_Innoseye",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Fellan_MeetTwo_Yes_01_01");	//Аргхх!!! (сопротивляясь) Тебе все-таки удалось найти меня, человек!
	AI_Output(other,self,"DIA_Fellan_MeetTwo_Yes_01_02");	//Тебе не укрыться от меня, Феллангор! Подчинись воле амулета и верни то, что тебе не принадлежит!
	AI_Output(self,other,"DIA_Fellan_MeetTwo_Yes_01_03");	//Это только мой дар! И я никому его не отдам. Даже самому Белиару!
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Fellan_MeetTwo_Yes_01_04");	//(дико смеясь) Магия амулета вновь не смогла убить меня!
	AI_Output(self,other,"DIA_Fellan_MeetTwo_Yes_01_06");	//Я скроюсь во мраке, и ты больше никогда не сможешь меня отыскать.
	B_LogEntry(TOPIC_BELIARHELPME,"Я вновь повстречал Феллангора. Сила амулета снова серьезно ослабила его - еще немного, и избранник Белиара будет уничтожен! На этот раз Феллангору вновь удалось скрыться от меня, но уверен, что это было в последний раз.");
	Info_ClearChoices(dia_fellan_meettwo);
	Info_AddChoice(dia_fellan_meettwo,"(закончить разговор)",dia_fellan_meettwo_away);
};

func void dia_fellan_meettwo_away()
{
	Wld_StopEffect("DEMENTOR_FX");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,10);
	Npc_ExchangeRoutine(self,"InsanePathNext");
	B_Attack(self,other,0,0);
};


instance DIA_FELLAN_MEETTWOAGAIN(C_Info)
{
	npc = VLK_480_Fellan;
	nr = 1;
	condition = dia_fellan_meettwoagain_condition;
	information = dia_fellan_meettwoagain_info;
	permanent = TRUE;
	description = "Эй, послушай меня!";
};


func int dia_fellan_meettwoagain_condition()
{
	if((MIS_BELIARHELPME == LOG_Running) && (FELLANGORFIRSTMEET == TRUE) && (SPEAKTWOFELLANGORONCE == TRUE) && (FELLANGORSECONDMEET == FALSE))
	{
		return TRUE;
	};
};

func void dia_fellan_meettwoagain_info()
{
	AI_Output(other,self,"DIA_Fellan_MeetTwoAgain_01_00");	//Эй, послушай меня!
	AI_Output(self,other,"DIA_Fellan_MeetTwoAgain_01_01");	//Ну, что еще?!
	Info_ClearChoices(dia_fellan_meettwoagain);
	if(ZIGOSMAGICISON == TRUE)
	{
		Info_AddChoice(dia_fellan_meettwoagain,"...АРХ БЕЛИАР НОМЭН САКТ ДАГАР ХАР...!",dia_fellan_meettwoagain_yes);
	};
	Info_AddChoice(dia_fellan_meettwoagain,"Не важно.",dia_fellan_meettwoagain_no);
};

func void dia_fellan_meettwoagain_no()
{
	AI_Output(other,self,"DIA_Fellan_MeetTwoAgain_No_01_00");	//Не важно.
	AI_Output(self,other,"DIA_Fellan_MeetTwoAgain_No_01_01");	//Тогда оставь меня в покое!
	AI_StopProcessInfos(self);
};

func void dia_fellan_meettwoagain_yes()
{
	B_GivePlayerXP(200);
	//Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
	CreateInvItems(self,ITAR_Dementor,1);
	AI_UnequipArmor(self);
	AI_EquipArmor(self,ITAR_Dementor);
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	self.flags = NPC_FLAG_IMMORTAL;
	self.name[0] = "Феллангор";
	FELLANGORSECONDMEET = TRUE;
	AI_PlayAni(other,"T_PRACTICEMAGIC5");
	Wld_PlayEffect("spellFX_Fear",other,other,0,0,0,FALSE);
	AI_Output(other,self,"DIA_Fellan_MeetTwoAgain_Yes_01_00");	//...АРХ БЕЛИАР НОМЭН САКТ ДАГАР ХАР...!
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("spellFX_Innoseye",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Fellan_MeetTwoAgain_Yes_01_01");	//Аргхх!!! (сопротивляясь) Тебе все-таки удалось найти меня, человек!
	AI_Output(other,self,"DIA_Fellan_MeetTwoAgain_Yes_01_02");	//Тебе не укрыться от меня, Феллангор! Подчинись воле амулета и верни то, что тебе более не принадлежит!
	AI_Output(self,other,"DIA_Fellan_MeetTwoAgain_Yes_01_03");	//Это только мой дар! И я никому его не отдам. Даже самому Белиару!
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Fellan_MeetTwoAgain_Yes_01_04");	//(дико смеясь) Магия амулета вновь не смогла убить меня!
	AI_Output(self,other,"DIA_Fellan_MeetTwoAgain_Yes_01_06");	//Я скроюсь во мраке и ты больше никогда не сможешь меня отыскать.
	B_LogEntry(TOPIC_BELIARHELPME,"Я вновь повстречал Феллангора. Сила амулета снова серьезно ослабила его - еще немного, и избранник Белиара будет уничтожен! На этот раз Феллангору вновь удалось скрыться от меня, но уверен, что это было в последний раз.");
	Info_ClearChoices(dia_fellan_meettwoagain);
	Info_AddChoice(dia_fellan_meettwoagain,"(закончить разговор)",dia_fellan_meettwoagain_away);
};

func void dia_fellan_meettwoagain_away()
{
	Wld_StopEffect("DEMENTOR_FX");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,10);
	Npc_ExchangeRoutine(self,"InsanePathNext");
	B_Attack(self,other,0,0);
};


instance DIA_FELLAN_MEETLAST(C_Info)
{
	npc = VLK_480_Fellan;
	nr = 1;
	condition = dia_fellan_meetlast_condition;
	information = dia_fellan_meetlast_info;
	permanent = FALSE;
	description = "Эй, приятель! Что ты тут делаешь?";
};


func int dia_fellan_meetlast_condition()
{
	if((MIS_BELIARHELPME == LOG_Running) && (FELLANGORSECONDMEET == TRUE) && (FELLANGORTHIRDMEET == FALSE))
	{
		return TRUE;
	};
};

func void dia_fellan_meetlast_info()
{
	AI_Output(other,self,"DIA_Fellan_MeetLast_01_00");	//Эй, приятель! Что ты тут делаешь?
	AI_Output(self,other,"DIA_Fellan_MeetLast_01_01");	//Как что? Торгую. Поэтому не отвлекай меня! Сейчас уже с минуты на минуту придут новые покупатели.
	AI_Output(other,self,"DIA_Fellan_MeetLast_01_02");	//Торгуешь здесь?! Один посреди леса, который полон монстров?
	AI_Output(other,self,"DIA_Fellan_MeetLast_01_04");	//Хммм... А где же все твои товары?
	AI_Output(self,other,"DIA_Fellan_MeetLast_01_05");	//Э-э-э... я оставил все в городе на тот случай, если на меня вдруг нападут бандиты.
	AI_Output(self,other,"DIA_Fellan_MeetLast_01_07");	//Что ты на меня так смотришь?
	SPEAKTHIRDFELLANGORONCE = TRUE;
	Info_ClearChoices(dia_fellan_meetlast);

	if(ZIGOSMAGICISON == TRUE)
	{
		Info_AddChoice(dia_fellan_meetlast,"...АРХ БЕЛИАР НОМЭН САКТ ДАГАР ХАР...!",dia_fellan_meetlast_yes);
	};
	Info_AddChoice(dia_fellan_meetlast,"Не важно.",dia_fellan_meetlast_no);
};

func void dia_fellan_meetlast_no()
{
	AI_Output(other,self,"DIA_Fellan_MeetLast_No_01_00");	//Забудь об этом.
	AI_Output(self,other,"DIA_Fellan_MeetLast_No_01_01");	//Ну, раз так, тогда я пожалуй вернусь к своей торговле. Не возражаешь?
	AI_StopProcessInfos(self);
};

func void dia_fellan_meetlast_yes()
{
	//Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
	CreateInvItems(self,ITAR_Dementor,1);
	AI_UnequipArmor(self);
	AI_EquipArmor(self,ITAR_Dementor);
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	self.flags = NPC_FLAG_IMMORTAL;
	self.name[0] = "Феллангор";
	FELLANGORTHIRDMEET = TRUE;
	AI_PlayAni(other,"T_PRACTICEMAGIC5");
	Wld_PlayEffect("spellFX_Fear",other,other,0,0,0,FALSE);
	AI_Output(other,self,"DIA_Fellan_MeetLast_Yes_01_00");	//...АРХ БЕЛИАР НОМЭН САКТ ДАГАР ХАР...!
	AI_Output(self,other,"DIA_Fellan_MeetLast_Yes_01_01");	//Мне не скрыться от тебя, человек... Ты опять выследил меня!
	AI_Output(other,self,"DIA_Fellan_MeetLast_Yes_01_02");	//На этот раз хватит - тебе не уйти! Лучше приготовься умереть.
	AI_Output(self,other,"DIA_Fellan_MeetLast_Yes_01_03");	//Постой! (умоляюще) Прошу, пощади меня! И моя благодарность не будет знать равных.
	B_LogEntry(TOPIC_BELIARHELPME,"Я поймал Феллангора! Теперь он от меня не уйдет. Мне только остается использовать амулет, чтобы окончательно положить конец его мучениям.");
	Info_ClearChoices(dia_fellan_meetlast);
	Info_AddChoice(dia_fellan_meetlast,"А что ты можешь предложить?",dia_fellan_meetlast_what);
	Info_AddChoice(dia_fellan_meetlast,"Ну, хорошо. Я согласен.",dia_fellan_meetlast_free);
	Info_AddChoice(dia_fellan_meetlast,"Я завершу до конца то, что начал.",dia_fellan_meetlast_kill);
};

func void dia_fellan_meetlast_what()
{
	AI_Output(other,self,"DIA_Fellan_MeetLast_What_01_00");	//А что ты можешь предложить?
	AI_Output(self,other,"DIA_Fellan_MeetLast_What_01_01");	//То, что дарует тебе огромную силу и могущество. А владеть этим или нет - это уже решать тебе!
};

func void dia_fellan_meetlast_free()
{
	AI_Output(other,self,"DIA_Fellan_MeetLast_Free_01_00");	//Ну, хорошо. Я согласен.
	AI_Output(self,other,"DIA_Fellan_MeetLast_Free_01_01");	//Благодарю тебя, человек. И в качестве доказательства моих слов, вот - прими это кольцо!
	if((other.guild == GIL_KDF) || (other.guild == GIL_KDW) || (other.guild == GIL_KDM) || (other.guild == GIL_GUR) || (other.guild == GIL_NOV) || (other.guild == GIL_NDW) || (other.guild == GIL_NDM))
	{
		CreateInvItems(self,itri_fellangor_magic,1);
		B_GiveInvItems(self,other,itri_fellangor_magic,1);
	}
	else
	{
		CreateInvItems(self,itri_fellangor,1);
		B_GiveInvItems(self,other,itri_fellangor,1);
	};
	AI_Output(other,self,"DIA_Fellan_MeetLast_Free_01_02");	//Кольцо? И всего лишь?
	AI_Output(self,other,"DIA_Fellan_MeetLast_Free_01_03");	//Подобное ему ты вряд ли сможешь отыскать в этом мире.
	AI_Output(self,other,"DIA_Fellan_MeetLast_Free_01_04");	//Надень его, и ты поймешь, что я говорю истинную правду.
	AI_Output(self,other,"DIA_Fellan_MeetLast_Free_01_05");	//А теперь прощай!
	FELLANGORSAVE = TRUE;
	Info_ClearChoices(dia_fellan_meetlast);
	Info_AddChoice(dia_fellan_meetlast,Dialog_Ende,dia_fellan_meetlast_ext);
};

func void dia_fellan_meetlast_ext()
{
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"TOT");
	Npc_SetRefuseTalk(self,10);
	B_Attack(self,other,0,0);
};

func void dia_fellan_meetlast_kill()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Fellan_MeetLast_Kill_01_00");	//Нет!
	AI_Output(other,self,"DIA_Fellan_MeetLast_Kill_01_01");	//Тебе не уйти от расплаты! Умри!
	AI_PlayAni(other,"T_PRACTICEMAGIC5");
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("spellFX_Innoseye",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Fellan_MeetLast_Kill_01_02");	//Аргхх...(обреченно)
	Info_ClearChoices(dia_fellan_meetlast);
	Info_AddChoice(dia_fellan_meetlast,"...(использовать амулет)",dia_fellan_meetlast_extkill);
};

func void dia_fellan_meetlast_extkill()
{
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"TOT");
	Npc_SetRefuseTalk(self,10);
	B_Attack(self,other,0,0);
};


instance DIA_FELLAN_MEETLASTAGAIN(C_Info)
{
	npc = VLK_480_Fellan;
	nr = 1;
	condition = dia_fellan_meetlastagain_condition;
	information = dia_fellan_meetlastagain_info;
	permanent = TRUE;
	description = "Я хочу тебе кое-что сказать.";
};


func int dia_fellan_meetlastagain_condition()
{
	if((MIS_BELIARHELPME == LOG_Running) && (SPEAKTHIRDFELLANGORONCE == TRUE) && (FELLANGORSECONDMEET == TRUE) && (FELLANGORTHIRDMEET == FALSE))
	{
		return TRUE;
	};
};

func void dia_fellan_meetlastagain_info()
{
	AI_Output(other,self,"DIA_Fellan_MeetLastAgain_01_00");	//Я хочу тебе кое-что сказать.
	AI_Output(self,other,"DIA_Fellan_MeetLastAgain_01_01");	//Да? (удивленно) И что же это?
	Info_ClearChoices(dia_fellan_meetlastagain);
	if(ZIGOSMAGICISON == TRUE)
	{
		Info_AddChoice(dia_fellan_meetlastagain,"...АРХ БЕЛИАР НОМЭН САКТ ДАГАР ХАР...!",dia_fellan_meetlastagain_yes);
	};
	Info_AddChoice(dia_fellan_meetlastagain,"Не важно.",dia_fellan_meetlastagain_no);
};

func void dia_fellan_meetlastagain_no()
{
	AI_Output(other,self,"DIA_Fellan_MeetLastAgain_No_01_00");	//Ладно, забудь об этом.
	AI_Output(self,other,"DIA_Fellan_MeetLastAgain_No_01_01");	//Ну, раз так, тогда я пожалуй вернусь к своей торговле. Не возражаешь?
	AI_StopProcessInfos(self);
};

func void dia_fellan_meetlastagain_yes()
{
	//Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
	CreateInvItems(self,ITAR_Dementor,1);
	AI_UnequipArmor(self);
	AI_EquipArmor(self,ITAR_Dementor);
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	self.flags = NPC_FLAG_IMMORTAL;
	self.name[0] = "Феллангор";
	FELLANGORTHIRDMEET = TRUE;
	AI_PlayAni(other,"T_PRACTICEMAGIC5");
	Wld_PlayEffect("spellFX_Fear",other,other,0,0,0,FALSE);
	AI_Output(other,self,"DIA_Fellan_MeetLastAgain_Yes_01_00");	//...АРХ БЕЛИАР НОМЭН САКТ ДАГАР ХАР...!
	AI_Output(self,other,"DIA_Fellan_MeetLastAgain_Yes_01_01");	//Мне не скрыться от тебя, человек... Ты опять выследил меня!
	AI_Output(other,self,"DIA_Fellan_MeetLastAgain_Yes_01_02");	//На этот раз хватит - тебе не уйти! Лучше приготовься умереть.
	AI_Output(self,other,"DIA_Fellan_MeetLastAgain_Yes_01_03");	//Постой! (умоляюще) Прошу, пощади меня! И моя благодарность не будет знать равных.
	B_LogEntry(TOPIC_BELIARHELPME,"Я поймал Феллангора! Теперь он от меня не уйдет. Мне только остается использовать амулет, чтобы окончательно положить конец его мучениям.");
	Info_ClearChoices(dia_fellan_meetlastagain);
	Info_AddChoice(dia_fellan_meetlastagain,"А что ты можешь предложить?",dia_fellan_meetlastagain_what);
	Info_AddChoice(dia_fellan_meetlastagain,"Ну, хорошо. Я согласен.",dia_fellan_meetlastagain_free);
	Info_AddChoice(dia_fellan_meetlastagain,"Я завершу до конца то, что начал.",dia_fellan_meetlastagain_kill);
};

func void dia_fellan_meetlastagain_what()
{
	AI_Output(other,self,"DIA_Fellan_MeetLastAgain_What_01_00");	//А что ты можешь предложить?
	AI_Output(self,other,"DIA_Fellan_MeetLastAgain_What_01_01");	//То, что дарует тебе огромную силу и могущество...(серьезно) А владеть этим или нет - это уже решать тебе!
};

func void dia_fellan_meetlastagain_free()
{
	AI_Output(other,self,"DIA_Fellan_MeetLastAgain_Free_01_00");	//Ну хорошо. Я согласен.
	AI_Output(self,other,"DIA_Fellan_MeetLastAgain_Free_01_01");	//Благодарю тебя, человек. И в качестве доказательства моих слов, вот - прими это кольцо!
	if((other.guild == GIL_KDF) || (other.guild == GIL_KDW) || (other.guild == GIL_KDM) || (other.guild == GIL_GUR) || (other.guild == GIL_NOV) || (other.guild == GIL_NDW) || (other.guild == GIL_NDM))
	{
		CreateInvItems(self,itri_fellangor_magic,1);
		B_GiveInvItems(self,other,itri_fellangor_magic,1);
	}
	else
	{
		CreateInvItems(self,itri_fellangor,1);
		B_GiveInvItems(self,other,itri_fellangor,1);
	};
	AI_Output(other,self,"DIA_Fellan_MeetLastAgain_Free_01_02");	//Кольцо? И всего лишь?
	AI_Output(self,other,"DIA_Fellan_MeetLastAgain_Free_01_03");	//Подобное ему ты вряд ли сможешь отыскать в этом мире.
	AI_Output(self,other,"DIA_Fellan_MeetLastAgain_Free_01_04");	//Надень его, и ты поймешь, что я говорю истинную правду.
	AI_Output(self,other,"DIA_Fellan_MeetLastAgain_Free_01_05");	//А теперь прощай!
	FELLANGORSAVE = TRUE;
	Info_ClearChoices(dia_fellan_meetlastagain);
	Info_AddChoice(dia_fellan_meetlastagain,Dialog_Ende,dia_fellan_meetlastagain_ext);
};

func void dia_fellan_meetlastagain_ext()
{
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"TOT");
	Npc_SetRefuseTalk(self,10);
	B_Attack(self,other,0,0);
};

func void dia_fellan_meetlastagain_kill()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Fellan_MeetLastAgain_Kill_01_00");	//Нет!
	AI_Output(other,self,"DIA_Fellan_MeetLastAgain_Kill_01_01");	//Тебе не уйти от расплаты! Умри!
	AI_PlayAni(other,"T_PRACTICEMAGIC5");
	Wld_PlayEffect("spellFX_Fear",other,other,0,0,0,FALSE);
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("spellFX_Innoseye",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Fellan_MeetLastAgain_Kill_01_02");	//Аргхх...(обреченно)
	Info_ClearChoices(dia_fellan_meetlastagain);
	Info_AddChoice(dia_fellan_meetlastagain,"...(использовать амулет)",dia_fellan_meetlastagain_extkill);
};

func void dia_fellan_meetlastagain_extkill()
{
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"TOT");
	Npc_SetRefuseTalk(self,10);
	B_Attack(self,other,0,0);
};