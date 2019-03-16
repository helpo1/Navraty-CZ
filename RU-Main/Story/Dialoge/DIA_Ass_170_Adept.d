instance DIA_Ass_170_Adept_EXIT(C_Info)
{
	npc = Ass_170_Adept;
	nr = 999;
	condition = DIA_Ass_170_Adept_exit_condition;
	information = DIA_Ass_170_Adept_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Ass_170_Adept_exit_condition()
{
	return TRUE;
};

func void DIA_Ass_170_Adept_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Ass_170_Adept_Muritan(C_Info)
{
	npc = Ass_170_Adept;
	nr = 2;
	condition = DIA_Ass_170_Adept_Muritan_Condition;
	information = DIA_Ass_170_Adept_Muritan_Info;
	permanent = FALSE;
	description = "Я слышал, что тебе приходилось убивать муритана.";
};

func int DIA_Ass_170_Adept_Muritan_Condition()
{
	if(MIS_TiamantMuritan == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Ass_170_Adept_Muritan_Info()
{
	AI_Output(other,self,"DIA_Ass_170_Adept_Muritan_01_01");	//Я слышал, тебе приходилось убивать муритана.
	AI_Output(self,other,"DIA_Ass_170_Adept_Muritan_01_02");	//Да, приходилось. А тебе что с того, послушник?
	AI_Output(other,self,"DIA_Ass_170_Adept_Muritan_01_03");	//Приор Тиамант поручил мне выследить и убить эту тварь.
	AI_Output(self,other,"DIA_Ass_170_Adept_Muritan_01_04");	//Что же, тогда тебе не позавидуешь. Этот хищник точно тебе не по зубам!
	AI_Output(other,self,"DIA_Ass_170_Adept_Muritan_01_05");	//Может, дашь мне совет, как можно прикончить его?

	if(HasimGetHisGold == TRUE)
	{
		AI_Output(self,other,"DIA_Ass_170_Adept_Muritan_01_06");	//Ну, поскольку ты мне помог... Так уж и быть, я расскажу тебе одну хитрость.
		AI_Output(self,other,"DIA_Ass_170_Adept_Muritan_01_07");	//Но пообещай мне, что больше не расскажешь об этом никому!
		AI_Output(other,self,"DIA_Ass_170_Adept_Muritan_01_08");	//(молча кивает)
		AI_PlayAni(other,"T_YES");
		AI_Output(self,other,"DIA_Ass_170_Adept_Muritan_01_09");	//Тогда слушай. Как это не смешно звучит, но эта тварь крайне падка на обычную серу. 
		AI_Output(self,other,"DIA_Ass_170_Adept_Muritan_01_10");	//Ее запах достаточно быстро привлекает внимание этого хищника.
		AI_Output(self,other,"DIA_Ass_170_Adept_Muritan_01_11");	//Так что просто сделай наживку из сырого мяса и хорошенько обработай его этим веществом на алхимическом столе.
		AI_Output(self,other,"DIA_Ass_170_Adept_Muritan_01_12");	//Потом найди более-менее открытое место и размести там приманку.
		AI_Output(self,other,"DIA_Ass_170_Adept_Muritan_01_13");	//Вот увидишь, что не пройдет и получаса, как муритан сам найдет тебя.
		AI_Output(self,other,"DIA_Ass_170_Adept_Muritan_01_14");	//А уж там не теряйся. Постарайся сразу нанести ему смертельный удар, иначе потом придется туго.
		AI_Output(self,other,"DIA_Ass_170_Adept_Muritan_01_15");	//Все запомнил?
		AI_Output(other,self,"DIA_Ass_170_Adept_Muritan_01_16");	//Да, спасибо за совет.
		AI_Output(self,other,"DIA_Ass_170_Adept_Muritan_01_17");	//Не за что. Как говорится, рука руку моет.
		B_LogEntry(TOPIC_TiamantMuritan,"Хасим подсказал мне, как выследить муритана. Оказывается, запах серы очень привлекает этого хищника. Если я захочу его поймать, мне необходимо будет сделать наживку из сырого мяса, а потом обработать ее серой на алхимическом столе. Затем подыскать место, где много серы и использовать свою наживку.");
		MakeMuritanSweet = TRUE;
		AI_StopProcessInfos(self);
		Wld_InsertNpc(Scavenger,"FP_ROAM_PW_MONSTER_23");
		Wld_InsertNpc(Scavenger,"FP_ROAM_PW_MONSTER_25");
		Wld_InsertNpc(Scavenger,"FP_ROAM_PW_MONSTER_27");
		Wld_InsertNpc(Scavenger,"FP_ROAM_PW_MONSTER_29");
		Wld_InsertNpc(Scavenger,"FP_ROAM_PW_MONSTER_31");
		Wld_InsertNpc(Scavenger,"FP_ROAM_PW_MONSTER_33");
		Wld_InsertNpc(Scavenger,"FP_ROAM_PW_MONSTER_35");
		Wld_InsertNpc(Scavenger,"FP_ROAM_PW_MONSTER_37");
	}
	else
	{
		AI_Output(self,other,"DIA_Ass_170_Adept_Muritan_01_18");	//И с какой стати мне это делать, послушник? Нет уж, в этом деле я тебе помогать не стану.
		AI_Output(self,other,"DIA_Ass_170_Adept_Muritan_01_19");	//Так что это только твои проблемы и ничьи больше.
		HasimNeedProof = TRUE;
		AI_StopProcessInfos(self);
	};
};


instance DIA_Ass_170_Adept_AssasinGold(C_Info)
{
	npc = Ass_170_Adept;
	nr = 2;
	condition = DIA_Ass_170_Adept_AssasinGold_Condition;
	information = DIA_Ass_170_Adept_AssasinGold_Info;
	permanent = FALSE;
	description = "(отдать кошелек с золотом)";
};

func int DIA_Ass_170_Adept_AssasinGold_Condition()
{
	if((MIS_AssasinGold == LOG_Running) && (Npc_HasItems(other,ItMi_AssGoldPocket) >= 1) && (HasimGetHisGold == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Ass_170_Adept_AssasinGold_Info()
{
	B_GivePlayerXP(200);
	B_GiveInvItems(other,self,ItMi_AssGoldPocket,1);
	Npc_RemoveInvItems(self,ItMi_AssGoldPocket,1);
	AI_Output(self,other,"DIA_Ass_170_Adept_AssasinGold_01_01");	//Что это?
	AI_Output(other,self,"DIA_Ass_170_Adept_AssasinGold_01_02");	//Осаир передает тебе золото за последнюю партию рабов.
	AI_Output(self,other,"DIA_Ass_170_Adept_AssasinGold_01_03");	//Отлично! А то я уж думал, что мне самому придется идти к нему.
	AI_Output(other,self,"DIA_Ass_170_Adept_AssasinGold_01_04");	//А с этим есть проблемы?
	AI_Output(self,other,"DIA_Ass_170_Adept_AssasinGold_01_05");	//Не то чтобы проблемы. Просто мне всегда немного не по себе, когда я оказываюсь в его пещере.
	AI_Output(self,other,"DIA_Ass_170_Adept_AssasinGold_01_06");	//Всегда одолевает такое чувство, что пришел не к нему, а к самому Белиару.
	AI_Output(self,other,"DIA_Ass_170_Adept_AssasinGold_01_07");	//Так что ты оказал мне небольшую услугу, принеся это золото сюда.
	B_LogEntry(TOPIC_AssasinGold,"Я передал золото Хасиму. Он был рад тому, что ему не придется самому идти к Осаиру.");
	HasimGetHisGold = TRUE;
};

instance DIA_Ass_170_Adept_Muritan_Ext(C_Info)
{
	npc = Ass_170_Adept;
	nr = 2;
	condition = DIA_Ass_170_Adept_Muritan_Ext_Condition;
	information = DIA_Ass_170_Adept_Muritan_Ext_Info;
	permanent = FALSE;
	description = "Может, теперь ты расскажешь, как убить муритана?";
};

func int DIA_Ass_170_Adept_Muritan_Ext_Condition()
{
	if((MIS_TiamantMuritan == LOG_Running) && (HasimGetHisGold == TRUE) && (HasimNeedProof == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Ass_170_Adept_Muritan_Ext_Info()
{
	AI_Output(other,self,"DIA_Ass_170_Adept_Muritan_Ext_01_01");	//Может, теперь ты расскажешь, как убить муритана?
	AI_Output(self,other,"DIA_Ass_170_Adept_Muritan_Ext_01_02");	//Ну, поскольку ты мне помог... Так уж и быть, я расскажу тебе одну хитрость.
	AI_Output(self,other,"DIA_Ass_170_Adept_Muritan_Ext_01_03");	//Но пообещай мне, что больше не расскажешь об этом никому!
	AI_Output(other,self,"DIA_Ass_170_Adept_Muritan_Ext_01_04");	//(молча кивает)
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Ass_170_Adept_Muritan_Ext_01_05");	//Тогда слушай! Как это не смешно звучит, но эта тварь крайне падка на обычную серу. 
	AI_Output(self,other,"DIA_Ass_170_Adept_Muritan_Ext_01_06");	//Ее запах достаточно быстро привлекает внимание этого хищника.
	AI_Output(self,other,"DIA_Ass_170_Adept_Muritan_Ext_01_07");	//Так что просто сделай наживку из сырого мяса и хорошенько обработай его этим веществом на алхимическом столе.
	AI_Output(self,other,"DIA_Ass_170_Adept_Muritan_Ext_01_08");	//Потом найди более-менее открытое место и размести там приманку.
	AI_Output(self,other,"DIA_Ass_170_Adept_Muritan_Ext_01_09");	//Вот увидишь, что не пройдет и получаса, как муритан сам найдет тебя.
	AI_Output(self,other,"DIA_Ass_170_Adept_Muritan_Ext_01_10");	//А уж там не теряйся. Постарайся сразу нанести ему смертельный удар, иначе потом придется туго.
	AI_Output(self,other,"DIA_Ass_170_Adept_Muritan_Ext_01_11");	//Все запомнил?
	AI_Output(other,self,"DIA_Ass_170_Adept_Muritan_Ext_01_12");	//Да, спасибо за совет.
	AI_Output(self,other,"DIA_Ass_170_Adept_Muritan_Ext_01_13");	//Не за что! Как говорится, рука руку моет.
	B_LogEntry(TOPIC_TiamantMuritan,"Хасим подсказал мне, как выследить муритана. Оказывается, запах серы очень привлекает этого хищника. Если я захочу его поймать, мне необходимо будет сделать наживку из сырого мяса, а потом обработать ее серой на алхимическом столе.");
	MakeMuritanSweet = TRUE;
	AI_StopProcessInfos(self);
	Wld_InsertNpc(Scavenger,"FP_ROAM_PW_MONSTER_23");
	Wld_InsertNpc(Scavenger,"FP_ROAM_PW_MONSTER_25");
	Wld_InsertNpc(Scavenger,"FP_ROAM_PW_MONSTER_27");
	Wld_InsertNpc(Scavenger,"FP_ROAM_PW_MONSTER_29");
	Wld_InsertNpc(Scavenger,"FP_ROAM_PW_MONSTER_31");
	Wld_InsertNpc(Scavenger,"FP_ROAM_PW_MONSTER_33");
	Wld_InsertNpc(Scavenger,"FP_ROAM_PW_MONSTER_35");
	Wld_InsertNpc(Scavenger,"FP_ROAM_PW_MONSTER_37");
};

instance DIA_Ass_170_Adept_Narug(C_Info)
{
	npc = Ass_170_Adept;
	nr = 2;
	condition = DIA_Ass_170_Adept_Narug_Condition;
	information = DIA_Ass_170_Adept_Narug_Info;
	permanent = FALSE;
	description = "Ты не знаешь, где мне найти Наруга?";
};

func int DIA_Ass_170_Adept_Narug_Condition()
{
	if((MIS_AssasinGold == LOG_Running) && (HasimGetHisGold == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Ass_170_Adept_Narug_Info()
{
	AI_Output(other,self,"DIA_Ass_170_Adept_Narug_01_01");	//Ты не знаешь, где мне найти Наруга?
	AI_Output(self,other,"DIA_Ass_170_Adept_Narug_01_02");	//Нет. Но, кажется, он собирался навестить Осаира, чтобы забрать свое золото.
	AI_Output(self,other,"DIA_Ass_170_Adept_Narug_01_03");	//Хотя тогда непонятно, зачем Осаир послал тебя к нему.
	AI_Output(other,self,"DIA_Ass_170_Adept_Narug_01_04");	//Ладно, разберемся.
	B_LogEntry(TOPIC_AssasinGold,"Хасим сказал, что Наруг сам уже давно собирался отправиться к Осаиру. Странно, но, похоже, до его пещеры он так и не дошел.");
	Wld_InsertNpc(Ass_171_Adept,"PW_NARUG");
};


instance DIA_Ass_170_Adept_NarugGold(C_Info)
{
	npc = Ass_170_Adept;
	nr = 2;
	condition = DIA_Ass_170_Adept_NarugGold_Condition;
	information = DIA_Ass_170_Adept_NarugGold_Info;
	permanent = FALSE;
	description = "Знаешь, я никак не могу найти Наруга.";
};

func int DIA_Ass_170_Adept_NarugGold_Condition()
{
	if((MIS_AssasinGold == LOG_Running) && (MakeHasimKiller == TRUE) && (Npc_HasItems(other,ItMi_AssGoldPocket) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Ass_170_Adept_NarugGold_Info()
{
	AI_Output(other,self,"DIA_Ass_170_Adept_NarugGold_01_01");	//Знаешь, я никак не могу найти Наруга.
	AI_Output(self,other,"DIA_Ass_170_Adept_NarugGold_01_02");	//А что ты хочешь от меня?
	AI_Output(other,self,"DIA_Ass_170_Adept_NarugGold_01_03");	//Не мог бы ты забрать и его кошелек с золотом, чтобы потом передать ему при встрече?
	AI_Output(self,other,"DIA_Ass_170_Adept_NarugGold_01_04");	//(удивленно) Я? Нет. Извини, но этого я сделать не могу.
	Info_ClearChoices(DIA_Ass_170_Adept_NarugGold);
	Info_AddChoice(DIA_Ass_170_Adept_NarugGold,"Что ты хочешь за свою помощь?",DIA_Ass_170_Adept_NarugGold_Help);
	Info_AddChoice(DIA_Ass_170_Adept_NarugGold,"А как насчет пары золотых за твою помощь?",DIA_Ass_170_Adept_NarugGold_Gold);
	Info_AddChoice(DIA_Ass_170_Adept_NarugGold,"Тогда мне придется сообщить об этом Осаиру.",DIA_Ass_170_Adept_NarugGold_Osair);
	Info_AddChoice(DIA_Ass_170_Adept_NarugGold,"Может, как-нибудь договоримся?",DIA_Ass_170_Adept_NarugGold_Deal);
};

func void DIA_Ass_170_Adept_NarugGold_Gold()
{
	AI_Output(other,self,"DIA_Ass_170_Adept_NarugGold_Gold_01_01");	//А как насчет пары золотых за твою помощь?
	AI_Output(self,other,"DIA_Ass_170_Adept_NarugGold_Gold_01_02");	//Золото тут тебе не поможет, послушник.
	AI_Output(self,other,"DIA_Ass_170_Adept_NarugGold_Gold_01_03");	//Тут есть куда более серьезные вещи!
	AI_Output(other,self,"DIA_Ass_170_Adept_NarugGold_Gold_01_04");	//Например?
	AI_Output(self,other,"DIA_Ass_170_Adept_NarugGold_Gold_01_05");	//Этого я тебе пока сказать не могу. Ты ведь даже не Тень.
	AI_Output(self,other,"DIA_Ass_170_Adept_NarugGold_Gold_01_06");	//Так что не трать мое время попусту, и свое тоже.
	HasimPissOffGold = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_Ass_170_Adept_NarugGold_Osair()
{
	AI_Output(other,self,"DIA_Ass_170_Adept_NarugGold_Osair_01_01");	//Тогда мне придется сообщить об этом Осаиру.
	AI_Output(other,self,"DIA_Ass_170_Adept_NarugGold_Osair_01_02");	//И вряд ли ему придется по душе известие о том, что Наруг куда-то пропал.
	AI_Output(self,other,"DIA_Ass_170_Adept_NarugGold_Osair_01_03");	//И что с того?
	AI_Output(other,self,"DIA_Ass_170_Adept_NarugGold_Osair_01_04");	//Ему наверняка захочется лично обсудить это дело с тобой.
	AI_Output(self,other,"DIA_Ass_170_Adept_NarugGold_Osair_01_05");	//(недовольно) Если Осаир захочет меня видеть... что же, значит, придется прогуляться до его пещеры.
	AI_Output(self,other,"DIA_Ass_170_Adept_NarugGold_Osair_01_06");	//Но это все равно ничего не меняет. Кошелек Наруга я не возьму! Даже не проси.
	HasimPissOffGold = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_Ass_170_Adept_NarugGold_Deal()
{
	AI_Output(other,self,"DIA_Ass_170_Adept_NarugGold_Deal_01_01");	//Может, как-нибудь договоримся?
	AI_Output(self,other,"DIA_Ass_170_Adept_NarugGold_Deal_01_02");	//Об этом и речи не может идти, послушник.
	AI_Output(self,other,"DIA_Ass_170_Adept_NarugGold_Deal_01_03");	//Ни о чем с тобой я договариваться не собираюсь.
	AI_Output(self,other,"DIA_Ass_170_Adept_NarugGold_Deal_01_04");	//Так что лучше иди куда шел, от греха подальше.
	HasimPissOffGold = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_Ass_170_Adept_NarugGold_Help()
{
	AI_Output(other,self,"DIA_Ass_170_Adept_NarugGold_Help_01_01");	//Что ты хочешь за свою помощь?

	if(RhetorikSkillValue[1] >= 50)
	{
		AI_Output(self,other,"DIA_Ass_170_Adept_NarugGold_Help_01_02");	//(задумчиво) Уж и не знаю, что тебе сказать на этот счет.
		AI_Output(self,other,"DIA_Ass_170_Adept_NarugGold_Help_01_03");	//Есть, конечно, пара вещей, которые бы я хотел заполучить.
		AI_Output(self,other,"DIA_Ass_170_Adept_NarugGold_Help_01_04");	//Но для меня это будет слишком большим риском, а тебе может стоить головы.
		AI_Output(other,self,"DIA_Ass_170_Adept_NarugGold_Help_01_05");	//Значит, в принципе тебя предложение устраивает, и осталось лишь сойтись в цене?
		AI_Output(self,other,"DIA_Ass_170_Adept_NarugGold_Help_01_06");	//Ну, если так. Ладно, но никому ни слова об этом. Понял?
		AI_Output(other,self,"DIA_Ass_170_Adept_NarugGold_Help_01_07");	//Само собой.
		AI_Output(self,other,"DIA_Ass_170_Adept_NarugGold_Help_01_08");	//Так вот, я слышал, что на складе хранится одна бутылка очень редкого и дорогого вина.
		AI_Output(self,other,"DIA_Ass_170_Adept_NarugGold_Help_01_09");	//Если достанешь ее для меня, то так уж и быть - я возьму у тебя кошелек Наруга.
		AI_Output(self,other,"DIA_Ass_170_Adept_NarugGold_Help_01_10");	//Но смотри ничего не перепутай, иначе можешь забыть про наш уговор.
		B_LogEntry(TOPIC_AssasinGold,"Хасим все-таки согласился взять кошелек Наруга, но только в обмен на редкую бутылку вина, хранящуюся в кладовой Братства.");
		HasimNeedRareWine = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Ass_170_Adept_NarugGold_Help_01_11");	//Хммм...(задумчиво) Пожалуй, что ничего.
		AI_Output(self,other,"DIA_Ass_170_Adept_NarugGold_Help_01_12");	//И больше не приставай ко мне с подобными вопросами.
		HasimPissOffGold = TRUE;
		AI_StopProcessInfos(self);
	};
};

instance DIA_Ass_170_Adept_NarugGold_Again(C_Info)
{
	npc = Ass_170_Adept;
	nr = 2;
	condition = DIA_Ass_170_Adept_NarugGold_Again_Condition;
	information = DIA_Ass_170_Adept_NarugGold_Again_Info;
	permanent = FALSE;
	description = "Не хочешь выпить хорошего вина?";
};

func int DIA_Ass_170_Adept_NarugGold_Again_Condition()
{
	if((MIS_AssasinGold == LOG_Running) && (HasimPissOffGold == TRUE) && (Npc_HasItems(other,ItMi_AssGoldPocket) >= 1) && (Npc_HasItems(other,ItPo_AssasinsRareWine) >= 1) && (RhetorikSkillValue[1] > 0))
	{
		return TRUE;
	};
};

func void DIA_Ass_170_Adept_NarugGold_Again_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Ass_170_Adept_NarugGold_Again_01_01");	//Не хочешь выпить хорошего вина?
	AI_Output(self,other,"DIA_Ass_170_Adept_NarugGold_Again_01_02");	//Смотря какого. Вообще-то, здесь очень трудно достать действительно хорошее пойло.
	AI_Output(other,self,"DIA_Ass_170_Adept_NarugGold_Again_01_03");	//А как тебе это?
	B_GiveInvItems(other,self,ItPo_AssasinsRareWine,1);
	Npc_RemoveInvItems(self,ItPo_AssasinsRareWine,1);
	CreateInvItems(self,ItPo_AssasinsRareWine_Use,2);
	AI_Output(self,other,"DIA_Ass_170_Adept_NarugGold_Again_01_04");	//Хммм... интересно. Ну, давай-ка попробуем.
	AI_UseItem(self,ItPo_AssasinsRareWine_Use);
	AI_Output(self,other,"DIA_Ass_170_Adept_NarugGold_Again_01_05");	//Ух, отличное вино! По правде говоря, я давно не пробовал такого чудесного напитка. 
	AI_Output(self,other,"DIA_Ass_170_Adept_NarugGold_Again_01_06");	//Что ты хочешь за эту бутылку?
	AI_Output(other,self,"DIA_Ass_170_Adept_NarugGold_Again_01_07");	//Можешь оставить ее себе, а теперь вернемся к вопросу о золоте Наруга.
	AI_Output(self,other,"DIA_Ass_170_Adept_NarugGold_Again_01_08");	//Ах, ты все об этом. Ну да ладно! За такую вещь можно, наверно, и рискнуть.
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_Ass_170_Adept_NarugGold_Again_01_09");	//Давай сюда его кошелек. Только тихо!
	AI_Output(other,self,"DIA_Ass_170_Adept_NarugGold_Again_01_10");	//Вот, держи.
	B_GiveInvItems(other,self,ItMi_AssGoldPocket,1);
	AI_Output(self,other,"DIA_Ass_170_Adept_NarugGold_Again_01_11");	//Но смотри - никому ни слова об этом. Иначе у нас обоих будут неприятности.
	AI_Output(other,self,"DIA_Ass_170_Adept_NarugGold_Again_01_12");	//Само собой.
	B_LogEntry(TOPIC_AssasinGold,"Я всучил Хасиму кошелек с золотом Наруга. Думаю, теперь стоит сообщить Осаиру, что золото за партию рабов было роздано.");
	HasimNeedRareWineDone = TRUE;
};

instance DIA_Ass_170_Adept_NarugGold_Wine(C_Info)
{
	npc = Ass_170_Adept;
	nr = 2;
	condition = DIA_Ass_170_Adept_NarugGold_Wine_Condition;
	information = DIA_Ass_170_Adept_NarugGold_Wine_Info;
	permanent = FALSE;
	description = "Вот твое редкое вино.";
};

func int DIA_Ass_170_Adept_NarugGold_Wine_Condition()
{
	if((MIS_AssasinGold == LOG_Running) && (HasimNeedRareWine == TRUE) && (Npc_HasItems(other,ItMi_AssGoldPocket) >= 1) && (Npc_HasItems(other,ItPo_AssasinsRareWine) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Ass_170_Adept_NarugGold_Wine_Info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Ass_170_Adept_NarugGold_Wine_01_01");	//Вот твое редкое вино.
	B_GiveInvItems(other,self,ItPo_AssasinsRareWine,1);
	Npc_RemoveInvItems(self,ItPo_AssasinsRareWine,1);
	CreateInvItems(self,ItPo_AssasinsRareWine_Use,2);
	AI_Output(self,other,"DIA_Ass_170_Adept_NarugGold_Wine_01_02");	//Хммм... Ну хорошо! Давай посмотрим, что ты принес.
	AI_UseItem(self,ItPo_AssasinsRareWine_Use);
	AI_Output(self,other,"DIA_Ass_170_Adept_NarugGold_Wine_01_03");	//Да, действительно отличное вино! Давно я не пробовал такого чудесного напитка. 
	AI_Output(other,self,"DIA_Ass_170_Adept_NarugGold_Wine_01_04");	//А что насчет золота Наруга?
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_Ass_170_Adept_NarugGold_Wine_01_05");	//Ну, как и договаривались. Давай сюда его кошелек. Только тихо!
	AI_Output(other,self,"DIA_Ass_170_Adept_NarugGold_Wine_01_06");	//Вот, держи.
	B_GiveInvItems(other,self,ItMi_AssGoldPocket,1);
	Npc_RemoveInvItems(self,ItMi_AssGoldPocket,1);
	AI_Output(self,other,"DIA_Ass_170_Adept_NarugGold_Wine_01_07");	//Но смотри, никому ни слова об этом! Иначе у нас обоих будут неприятности.
	AI_Output(other,self,"DIA_Ass_170_Adept_NarugGold_Wine_01_08");	//Само собой.
	B_LogEntry(TOPIC_AssasinGold,"Я всучил Хасиму кошелек с золотом Наруга. Думаю, теперь стоит сообщить Осаиру, что золото за партию рабов было роздано.");
	HasimNeedRareWineDone = TRUE;
};

instance DIA_Ass_170_Adept_PICKPOCKET(C_Info)
{
	npc = Ass_170_Adept;
	nr = 900;
	condition = DIA_Ass_170_Adept_PICKPOCKET_Condition;
	information = DIA_Ass_170_Adept_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(Попытаться украсть его четки)";
};

func int DIA_Ass_170_Adept_PICKPOCKET_Condition()
{
	if((self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (MakeHasimKiller == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Ass_170_Adept_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Ass_170_Adept_PICKPOCKET);
	Info_AddChoice(DIA_Ass_170_Adept_PICKPOCKET,Dialog_Back,DIA_Ass_170_Adept_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Ass_170_Adept_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Ass_170_Adept_PICKPOCKET_DoIt);
};

func void DIA_Ass_170_Adept_PICKPOCKET_DoIt()
{
	AI_PlayAni(other,"T_STEAL");
	AI_Wait(other,1);

	if((other.attribute[ATR_DEXTERITY] + PickPocketBonusCount) >= 50)
	{
		B_GivePlayerXP(300);
		B_GiveInvItems(self,other,ItMi_HasimAmuls,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		Info_ClearChoices(DIA_Ass_170_Adept_PICKPOCKET);
	}
	else
	{
		PlayerIsPrioratFake = TRUE;
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
};

func void DIA_Ass_170_Adept_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Ass_170_Adept_PICKPOCKET);
};

var int ExpLoseCount;

instance DIA_Ass_170_Adept_HasimKill(C_Info)
{
	npc = Ass_170_Adept;
	nr = 2;
	condition = DIA_Ass_170_Adept_HasimKill_Condition;
	information = DIA_Ass_170_Adept_HasimKill_Info;
	permanent = FALSE;
	description = "У меня к тебе есть одно дело.";
};

func int DIA_Ass_170_Adept_HasimKill_Condition()
{
	if(MIS_HasimKill == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Ass_170_Adept_HasimKill_Info()
{
	ExpLoseCount = TRUE;
	AI_Output(other,self,"DIA_Ass_170_Adept_HasimKill_01_01");	//У меня к тебе есть одно дело.
	AI_Output(self,other,"DIA_Ass_170_Adept_HasimKill_01_02");	//Что еще такое?
	Info_ClearChoices(DIA_Ass_170_Adept_HasimKill);
	Info_AddChoice(DIA_Ass_170_Adept_HasimKill,"Приор Осаир хочет тебя видеть.",DIA_Ass_170_Adept_Osair);
	Info_AddChoice(DIA_Ass_170_Adept_HasimKill,"Не хочешь сходить поохотиться?",DIA_Ass_170_Adept_Hunt);
	Info_AddChoice(DIA_Ass_170_Adept_HasimKill,"Я нашел твоего приятеля Наруга.",DIA_Ass_170_Adept_NarugFind);

	if(PW_GOLDSHAHT == TRUE)
	{
		Info_AddChoice(DIA_Ass_170_Adept_HasimKill,"Не хочешь немного поживиться?",DIA_Ass_170_Adept_Gold);
	};
};

func void DIA_Ass_170_Adept_Osair()
{
	var int bonusexp;

	bonusexp = 1000 / ExpLoseCount;

	B_GivePlayerXP(bonusexp);
	AI_Output(other,self,"DIA_Ass_170_Adept_Osair_01_01");	//Приор Осаир хочет тебя видеть.
	AI_Output(other,self,"DIA_Ass_170_Adept_Osair_01_02");	//И попросил меня как можно скорее сопроводить тебя до его пещеры.
	AI_Output(self,other,"DIA_Ass_170_Adept_Osair_01_03");	//(удивленно) Осаир? Хммм. Раньше он не присылал послушников, чтобы сообщить мне об этом.
	AI_Output(other,self,"DIA_Ass_170_Adept_Osair_01_04");	//Уверен, он сделал это не просто так.
	AI_Output(other,self,"DIA_Ass_170_Adept_Osair_01_05");	//Поэтому лучше не терять времени и поспешить к нему.
	AI_Output(self,other,"DIA_Ass_170_Adept_Osair_01_06");	//Ладно, как скажешь. Ступай, а я пойду следом за тобой.
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	HasimGoForKilled = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FollowHero");
};

func void DIA_Ass_170_Adept_Hunt()
{
	AI_Output(other,self,"DIA_Ass_170_Adept_Hunt_01_01");		//Не хочешь сходить поохотиться?
	AI_Output(self,other,"DIA_Ass_170_Adept_Hunt_01_02");		//Нет. Я бы лучше предпочел остаться здесь и насладиться замечательным вкусом этого кальяна.
	AI_Output(self,other,"DIA_Ass_170_Adept_Hunt_01_03");		//Так что извини, приятель.
	AI_Output(other,self,"DIA_Ass_170_Adept_Hunt_01_04");		//Понимаю.
	ExpLoseCount = ExpLoseCount + 1;
};


func void DIA_Ass_170_Adept_NarugFind()
{
	AI_Output(other,self,"DIA_Ass_170_Adept_NarugFind_01_01");	//Я нашел твоего приятеля Наруга.
	AI_Output(self,other,"DIA_Ass_170_Adept_NarugFind_01_02");	//Хммм...(безучастно) И где же шатается этот бездельник?
	AI_Output(other,self,"DIA_Ass_170_Adept_NarugFind_01_03");	//Тут недалеко, в лесу. И он просил передать, что ждет тебя.
	AI_Output(other,self,"DIA_Ass_170_Adept_NarugFind_01_04");	//Кажется, он что-то задумал.
	AI_Output(self,other,"DIA_Ass_170_Adept_NarugFind_01_05");	//Правда? И что же мог задумать этот болван?
	AI_Output(self,other,"DIA_Ass_170_Adept_NarugFind_01_06");	//Нет уж, пожалуй, лучше я останусь тут.
	AI_Output(self,other,"DIA_Ass_170_Adept_NarugFind_01_07");	//А если ему что-то нужно от меня, пусть сам сюда тащит свою задницу.
	AI_Output(self,other,"DIA_Ass_170_Adept_NarugFind_01_08");	//Так ему и передай.
	ExpLoseCount = ExpLoseCount + 1;
};

func void DIA_Ass_170_Adept_Gold()
{
	AI_Output(other,self,"DIA_Ass_170_Adept_Gold_01_01");		//Не хочешь немного поживиться?
	AI_Output(self,other,"DIA_Ass_170_Adept_Gold_01_02");		//Хммм... И о чем идет речь?
	AI_Output(other,self,"DIA_Ass_170_Adept_Gold_01_03");		//В одной из пещер я наткнулся на большие залежи золотой руды.
	AI_Output(other,self,"DIA_Ass_170_Adept_Gold_01_04");		//Но одному мне там не управиться.
	AI_Output(other,self,"DIA_Ass_170_Adept_Gold_01_05");		//Вот я и подумал: может, тебя заинтересует это дельце?
	AI_Output(self,other,"DIA_Ass_170_Adept_Gold_01_06");		//Хммм... Золотая руда? По правде говоря, не думаю, что мне это будет интересно.
	AI_Output(self,other,"DIA_Ass_170_Adept_Gold_01_07");		//Золота у меня и так достаточно, а гнуть спину в шахтах совсем не для меня.
	AI_Output(self,other,"DIA_Ass_170_Adept_Gold_01_08");		//Конечно, можно было бы нагнать туда рабов.
	AI_Output(self,other,"DIA_Ass_170_Adept_Gold_01_09");		//Но тогда об этом узнают приоры, и тогда плакало наше золото!
	AI_Output(self,other,"DIA_Ass_170_Adept_Gold_01_10");		//Так что я лучше останусь здесь.
	AI_Output(other,self,"DIA_Ass_170_Adept_Gold_01_11");		//Дело твое.
	ExpLoseCount = ExpLoseCount + 1;
};

instance DIA_Ass_170_Adept_ANGEKOMMEN(C_Info)
{
	npc = Ass_170_Adept;
	nr = 55;
	condition = DIA_Ass_170_Adept_ANGEKOMMEN_Condition;
	information = DIA_Ass_170_Adept_ANGEKOMMEN_Info;
	important = TRUE;
};

func int DIA_Ass_170_Adept_ANGEKOMMEN_Condition()
{
	if((MIS_HasimKill == LOG_Running) && (HasimGoForKilled == TRUE) && (Npc_GetDistToWP(self,"PW_HASIM_DEAD") < 6000))
	{
		return TRUE;
	};
};

func void DIA_Ass_170_Adept_ANGEKOMMEN_Info()
{
	AI_Output(self,other,"DIA_Ass_170_Adept_ANGEKOMMEN_01_00");	//Почему ты остановился?
	AI_Output(other,self,"DIA_Ass_170_Adept_ANGEKOMMEN_01_01");	//Потому, что мы пришли.
	AI_Output(self,other,"DIA_Ass_170_Adept_ANGEKOMMEN_01_02");	//(удивленно) И как это понимать?
	AI_Output(other,self,"DIA_Ass_170_Adept_ANGEKOMMEN_01_03");	//Просто приор Тиамант хочет твоей смерти, и я сейчас исполню его волю.
	AI_Output(self,other,"DIA_Ass_170_Adept_ANGEKOMMEN_01_04");	//Что?! Так значит, ты просто заманил в эту глушь, чтобы убить?
	AI_Output(other,self,"DIA_Ass_170_Adept_ANGEKOMMEN_01_05");	//Все верно.
	AI_ReadyMeleeWeapon(self);
	AI_Output(self,other,"DIA_Ass_170_Adept_ANGEKOMMEN_01_06");	//(зловеще) Ну что же, ты можешь попробовать, сопляк!
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	B_Attack(self,other,AR_KILL,1);
};
