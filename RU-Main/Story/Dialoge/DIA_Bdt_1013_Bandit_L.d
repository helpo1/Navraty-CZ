
instance DIA_BDT_1013_BANDIT_FIRSTEXIT(C_Info)
{
	npc = Bdt_1013_Bandit_L;
	nr = 999;
	condition = DIA_BDT_1013_BANDIT_FIRSTEXIT_Condition;
	information = DIA_BDT_1013_BANDIT_FIRSTEXIT_Info;
	permanent = FALSE;
	description = Dialog_Ende;
};


func int DIA_BDT_1013_BANDIT_FIRSTEXIT_Condition()
{
	return TRUE;
};

func void DIA_BDT_1013_BANDIT_FIRSTEXIT_Info()
{
	if((Bdt13_Friend == TRUE) && !Npc_IsDead(Ambusher_1014) && !Npc_IsDead(Ambusher_1015))
	{
		AI_Output(self,other,"DIA_BDT_1013_BANDIT_FIRSTEXIT_01_00");	//На твоем месте я бы не ходил в эту пещеру - мои приятели, что живут там, сдерут с тебя шкуру живьем.
	};
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1013_BANDIT_EXIT(C_Info)
{
	npc = Bdt_1013_Bandit_L;
	nr = 999;
	condition = DIA_BDT_1013_BANDIT_EXIT_Condition;
	information = DIA_BDT_1013_BANDIT_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_BDT_1013_BANDIT_EXIT_Condition()
{
	if(Npc_KnowsInfo(other,dia_bdt_1013_bandit_firstexit))
	{
		return TRUE;
	};
};

func void DIA_BDT_1013_BANDIT_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_BDT_1013_BANDIT_WHERE(C_Info)
{
	npc = Bdt_1013_Bandit_L;
	nr = 3;
	condition = DIA_BDT_1013_BANDIT_WHERE_Condition;
	information = DIA_BDT_1013_BANDIT_WHERE_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_BDT_1013_BANDIT_WHERE_Condition()
{
	if(CAVALORNGOBANDITS == FALSE)
	{
		return TRUE;
	};
};

func void DIA_BDT_1013_BANDIT_WHERE_Info()
{
	self.guild = GIL_BDT;
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_01_00");	//Эй! Откуда ты такой взялся, а?
	Info_ClearChoices(dia_bdt_1013_bandit_where);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Я спустился с гор.",dia_bdt_1013_bandit_where_mountain);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Я пришел от Ксардаса.",dia_bdt_1013_bandit_where_xardas);
};

func void dia_bdt_1013_bandit_where_mountain()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_15_00");	//Я спустился с гор.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_01_01");	//Точно! Ты спустился с гор. И это плохо для тебя.
	B_UseFakeScroll();
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_01_02");	//Очень плохо!
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_01_03");	//Тебя ищут - целая куча плохих парней.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_01_04");	//Есть человек, с которым тебе просто необходимо переговорить. Иди за мной!
	Info_ClearChoices(dia_bdt_1013_bandit_where);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Может быть, позже...",dia_bdt_1013_bandit_where_later);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Кто ищет меня?",dia_bdt_1013_bandit_where_who);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Хорошо! Ты идешь первым!",dia_bdt_1013_bandit_where_yes);
};

func void dia_bdt_1013_bandit_where_xardas()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_XARDAS_15_00");	//Я пришел от Ксардаса.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_XARDAS_01_01");	//Это тот старый маг? Он называет себя Ксардасом. Браго это будет интересно!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
};

func void dia_bdt_1013_bandit_where_yes()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_YES_15_00");	//Хорошо! Ты идешь первым!
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_YES_01_01");	//Просто следуй за мной, пещера находится вон там.
	Npc_ExchangeRoutine(self,"AMBUSH");
	AI_StopProcessInfos(self);
};

func void dia_bdt_1013_bandit_where_who()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_WHO_15_00");	//Кто ищет меня?
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_WHO_01_01");	//За тобой охотится половина Хориниса, а ты хочешь сказать мне, что ничего не знаешь об этом?
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_WHO_01_02");	//Ах! Понимаю! Ты не хочешь говорить мне об этом, хм? Хорошо - это твое дело.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_WHO_01_03");	//Так ты идешь или нет?
	Info_ClearChoices(dia_bdt_1013_bandit_where);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Возможно, позже...",dia_bdt_1013_bandit_where_later);
	Info_AddChoice(dia_bdt_1013_bandit_where,"С кем я должен поговорить?",dia_bdt_1013_bandit_where_talkpartner);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Хорошо! Ты идешь первым!",dia_bdt_1013_bandit_where_yes);
};

func void dia_bdt_1013_bandit_where_talkpartner()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_TALKPARTNER_15_00");	//С кем я должен поговорить?
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_TALKPARTNER_01_01");	//С нашим главарем. Его зовут Браго. Он лучше все тебе объяснит, чем я.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_TALKPARTNER_01_02");	//Ну что ты - мы идем?
	Info_ClearChoices(dia_bdt_1013_bandit_where);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Возможно, позже...",dia_bdt_1013_bandit_where_later);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Откуда мне знать, что это не ловушка?",dia_bdt_1013_bandit_where_notrap);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Хорошо! Иди вперед!",dia_bdt_1013_bandit_where_yes);
};

func void dia_bdt_1013_bandit_where_notrap()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_NOTRAP_15_00");	//Откуда мне знать, что это не ловушка?
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_NOTRAP_01_01");	//Знаешь, я уже устал от тебя. Если тебе не нужна моя помощь, можешь просто идти в город, пусть там тебя посадят за решетку!
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_NOTRAP_01_02");	//Либо ты сейчас идешь со мной, либо забудь о том, что я тебе говорил!
	Info_ClearChoices(dia_bdt_1013_bandit_where);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Возможно, позже...",dia_bdt_1013_bandit_where_later);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Кое-кто уже пытался провести меня...",dia_bdt_1013_bandit_where_damals);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Хорошо! Иди вперед!",dia_bdt_1013_bandit_where_yes);
};

func void dia_bdt_1013_bandit_where_damals()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_DAMALS_15_00");	//Полегче, приятель! Кое-кто уже пытался провести меня...
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_DAMALS_01_01");	//О-оо?... (заинтересовано)
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_DAMALS_15_02");	//Этот парень предложил, чтобы мы вместе нашли амулет и поделили доход.
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_DAMALS_15_03");	//А когда мы достигли нашей цели, он и со своими дружками напал на меня.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_DAMALS_01_04");	//Похоже, ты просто связался с плохими людьми - и где это было?
	Info_ClearChoices(dia_bdt_1013_bandit_where);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Это не так уж важно.",dia_bdt_1013_bandit_where_notimportant);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Я был заключенным в горнодобывающей колонии.",dia_bdt_1013_bandit_where_prisoner);
};

func void dia_bdt_1013_bandit_where_prisoner()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_15_00");	//Я был заключенным в горнодобывающей колонии.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_01");	//(потрясенный) Ты пришел из-за Барьера? Парень, тогда мы были там вместе.
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_15_02");	//Я не знаю тебя...
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_03");	//Я был шахтером в Старом Лагере. Я оттуда почти никогда не выходил.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_04");	//(заговорщицки) Но сейчас важнее то, что у тебя большие проблемы!
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_05");	//Кто-то назначил кругленькую сумму за твою голову. И раздал несколько рисунков с твоей физиономией!
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_06");	//На твоем месте я был бы очень, очень осторожным. Среди нас есть люди, которые за деньги готовы убить свою собственную мать.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_07");	//Но я думаю, что мы, бывшие заключенные из колонии, должны держаться вместе!
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_15_08");	//Тогда я должен сказать тебе большое спасибо...
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_09");	//Пустяки. Просто постарайся остаться в живых.

	if(RhetorikSkillValue[1] < 100)
	{
		RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
		AI_Print("Риторика + 1");
	};

	Bdt13_Friend = TRUE;
	B_SetAttitude(self,ATT_FRIENDLY);
	self.npcType = NPCTYPE_FRIEND;
	self.aivar[AIV_EnemyOverride] = FALSE;
	Info_ClearChoices(dia_bdt_1013_bandit_where);
};

func void dia_bdt_1013_bandit_where_notimportant()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_NOTIMPORTANT_15_00");	//Это не так уж важно.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_NOTIMPORTANT_01_01");	//Как знаешь. Так как, ты идешь или нет?
	Info_ClearChoices(dia_bdt_1013_bandit_where);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Возможно, позже...",dia_bdt_1013_bandit_where_later);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Хорошо! Иди вперед!",dia_bdt_1013_bandit_where_yes);
};

func void dia_bdt_1013_bandit_where_later()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_LATER_15_00");	//Может быть, позже...
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_LATER_01_01");	//Позже не будет, приятель!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
};


instance DIA_1013_BANDIT_AMBUSH(C_Info)
{
	npc = Bdt_1013_Bandit_L;
	nr = 1;
	condition = DIA_1013_BANDIT_AMBUSH_Condition;
	information = DIA_1013_BANDIT_AMBUSH_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_1013_BANDIT_AMBUSH_Condition()
{
	if((Npc_GetDistToWP(self,"NW_XARDAS_BANDITS_RIGHT") <= 300) && (Bdt13_Friend == FALSE))
	{
		return TRUE;
	};
};

func void DIA_1013_BANDIT_AMBUSH_Info()
{
	if(Npc_IsDead(Ambusher_1014) && Npc_IsDead(Ambusher_1015))
	{
		AI_Output(self,other,"DIA_1013_BANDIT_AMBUSH_01_00");	//Тебе не стоило идти за мной.
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_SuddenEnemyInferno,0);
	}
	else
	{
		AI_Output(self,other,"DIA_1013_BANDIT_AMBUSH_01_01");	//Эй, парни, посмотрите, кто у нас здесь...
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_SuddenEnemyInferno,0);
	};
};


instance DIA_1013_BANDIT_NAME(C_Info)
{
	npc = Bdt_1013_Bandit_L;
	nr = 1;
	condition = DIA_1013_BANDIT_NAME_Condition;
	information = DIA_1013_BANDIT_NAME_Info;
	permanent = FALSE;
	description = "Кто назначил цену за мою голову?";
};


func int DIA_1013_BANDIT_NAME_Condition()
{
	if(Bdt13_Friend == TRUE)
	{
		return TRUE;
	};
};

func void DIA_1013_BANDIT_NAME_Info()
{
	AI_Output(other,self,"DIA_1013_BANDIT_NAME_15_00");	//Кто назначил цену за мою голову?
	AI_Output(self,other,"DIA_1013_BANDIT_NAME_01_01");	//Я этого не знаю, только один из нас видел его.
	AI_Output(other,self,"DIA_1013_BANDIT_NAME_15_02");	//И кто это?
	AI_Output(self,other,"DIA_1013_BANDIT_NAME_01_03");	//Эй, послушай - я действительно не могу сказать тебе это. Кто знает, как все выйдет...
	Log_CreateTopic(Topic_Bandits,LOG_MISSION);
	Log_SetTopicStatus(Topic_Bandits,LOG_Running);
	B_LogEntry(Topic_Bandits,"Несколько бандитов ищут меня. У них есть объявление о моем розыске. Что это может значить?");
	MIS_Steckbriefe = LOG_Running;
};


instance DIA_1013_BANDIT_DEXTER(C_Info)
{
	npc = Bdt_1013_Bandit_L;
	nr = 1;
	condition = DIA_1013_BANDIT_DEXTER_Condition;
	information = DIA_1013_BANDIT_DEXTER_Info;
	permanent = TRUE;
	description = "Десять золотых монет за имя!";
};


func int DIA_1013_BANDIT_DEXTER_Condition()
{
	if((Bdt13_Friend == TRUE) && (Bdt13_Dexter_verraten == FALSE) && Npc_KnowsInfo(other,dia_1013_bandit_name))
	{
		return TRUE;
	};
};

func void DIA_1013_BANDIT_DEXTER_Info()
{
	AI_Output(other,self,"DIA_1013_BANDIT_DEXTER_15_00");	//Десять золотых монет за имя того, кто назначил цену за мою голову!
	AI_Output(self,other,"DIA_1013_BANDIT_DEXTER_01_01");	//Ох, я действительно не могу сказать...
	AI_Output(other,self,"DIA_1013_BANDIT_DEXTER_15_02");	//Выкладывай, живее!
	AI_Output(self,other,"DIA_1013_BANDIT_DEXTER_01_03");	//(делает глубокий вдох) Ох, парень! Хорошо. Его зовут Декстер. Около большой фермы есть крутая скала.
	AI_Output(self,other,"DIA_1013_BANDIT_DEXTER_01_04");	//На ней сторожевая башня и несколько шахт. Он устроил свое логово где-то там.
	B_LogEntry(Topic_Bandits,"Главаря бандитов зовут Декстер. Он скрывается в шахте около поместья Онара.");

	if(B_GiveInvItems(other,self,ItMi_Gold,10))
	{
		AI_Output(other,self,"DIA_1013_BANDIT_DEXTER_15_05");	//Видишь, это было не так уж и сложно. Вот твое золото.
	}
	else
	{
		AI_Output(other,self,"DIA_1013_BANDIT_DEXTER_15_06");	//Эээ - я только что понял, что у меня не осталось даже десяти монет.
		AI_Output(self,other,"DIA_1013_BANDIT_DEXTER_01_07");	//Что?! Я... Ох - забудь об этом - я сам виноват. Не нужно было называть тебе имя, пока я не увидел золота...
	};

	if(RhetorikSkillValue[1] < 100)
	{
		RhetorikSkillValue[1] = RhetorikSkillValue[1] + 1;
		AI_Print("Риторика + 1");
	};

	AI_Output(self,other,"DIA_1013_BANDIT_DEXTER_01_08");	//Только никому не говори, что это я назвал тебе его.
	Bdt13_Dexter_verraten = TRUE;
};


instance DIA_1013_BANDIT_PIC(C_Info)
{
	npc = Bdt_1013_Bandit_L;
	nr = 2;
	condition = DIA_1013_BANDIT_PIC_Condition;
	information = DIA_1013_BANDIT_PIC_Info;
	permanent = FALSE;
	description = "Могу я взять эту картинку?";
};


func int DIA_1013_BANDIT_PIC_Condition()
{
	if(Bdt13_Friend == TRUE)
	{
		return TRUE;
	};
};

func void DIA_1013_BANDIT_PIC_Info()
{
	AI_Output(other,self,"DIA_1013_BANDIT_PIC_15_00");	//Могу я взять эту картинку?
	AI_Output(self,other,"DIA_1013_BANDIT_PIC_01_01");	//Конечно...(ухмыляется) Ведь на ней ТВОЯ рожа!
	B_GiveInvItems(self,other,ItWr_Poster_MIS,1);
};


instance DIA_1013_BANDIT_FromMaleth(C_Info)
{
	npc = Bdt_1013_Bandit_L;
	nr = 3;
	condition = DIA_1013_BANDIT_FromMaleth_Condition;
	information = DIA_1013_BANDIT_FromMaleth_Info;
	permanent = FALSE;
	description = "Меня послал один из фермеров у города...";
};

func int DIA_1013_BANDIT_FromMaleth_Condition()
{
	if((Bdt13_Friend == TRUE) && (self.guild != GIL_SLD) && ((MIS_Maleth_Bandits == LOG_Running) || (MIS_Maleth_Bandits == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void DIA_1013_BANDIT_FromMaleth_Info()
{
	var C_Npc b14;
	var C_Npc b15;

	AI_Output(other,self,"DIA_1013_BANDIT_FromMaleth_15_00");	//Меня послал один из фермеров у города...
	AI_Output(self,other,"DIA_1013_BANDIT_FromMaleth_01_01");	//Что? Фермеры знают об этом укрытии?
	AI_Output(other,self,"DIA_1013_BANDIT_FromMaleth_15_02");	//Они заметили пропажу овцы.
	b14 = Hlp_GetNpc(Bdt_1014_Bandit_L);
	b15 = Hlp_GetNpc(Bdt_1015_Bandit_L);

	if(Npc_IsDead(b14) && Npc_IsDead(b15))
	{
		AI_Output(self,other,"DIA_1013_BANDIT_FromMaleth_01_03");	//Черт! Ну, тогда мне стоит поискать другое место. Если они найдут это логово пустым, может быть, они прекратят искать меня.
	}
	else
	{
		AI_Output(other,self,"DIA_1013_BANDIT_FromMaleth_15_04");	//Он хочет, чтобы вы все были мертвы...
		AI_Output(self,other,"DIA_1013_BANDIT_FromMaleth_01_05");	//Подожди - ты ведь не сделаешь этого со мной, правда, ведь я помог тебе?
		AI_Output(self,other,"DIA_1013_BANDIT_FromMaleth_01_06");	//Иди туда и расправься с другими, если ты так жаждешь крови - а я сваливаю отсюда!
	};
	Bdt_1013_Away = TRUE;
	B_GivePlayerXP(XP_BanditWeg);
	Npc_ExchangeRoutine(self,"AWAY");
	AI_StopProcessInfos(self);
};

instance DIA_1013_BANDIT_FromCavalorn(C_Info)
{
	npc = Bdt_1013_Bandit_L;
	nr = 3;
	condition = DIA_1013_BANDIT_FromCavalorn_Condition;
	information = DIA_1013_BANDIT_FromCavalorn_Info;
	permanent = FALSE;
	description = "Похоже, у тебя скоро будут проблемы!";
};

func int DIA_1013_BANDIT_FromCavalorn_Condition()
{
	if((Bdt13_Friend == TRUE) && (MIS_Addon_Cavalorn_KillBrago == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_1013_BANDIT_FromCavalorn_Info()
{
	AI_Output(other,self,"DIA_ADDON_1013_BANDIT_FromCavalorn_15_00");	//Похоже, у тебя скоро будут проблемы!
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_FromCavalorn_01_01");	//Что такое?
	AI_Output(other,self,"DIA_ADDON_1013_BANDIT_FromCavalorn_15_02");	//Сюда направляется парень по имени Кавалорн.
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_FromCavalorn_01_03");	//Проклятье! Он все еще жив? Я сматываюсь отсюда...
	Bdt_1013_Away = TRUE;
	B_GivePlayerXP(XP_BanditWeg);
	Npc_ExchangeRoutine(self,"AWAY2");
	AI_StopProcessInfos(self);
};


var int bdt13_Gossip_Wildnis;

instance DIA_1013_BANDIT_PERM(C_Info)
{
	npc = Bdt_1013_Bandit_L;
	nr = 4;
	condition = DIA_1013_BANDIT_PERM_Condition;
	information = DIA_1013_BANDIT_PERM_Info;
	permanent = TRUE;
	description = "Есть что-нибудь еще, что может заинтересовать меня?";
};

func int DIA_1013_BANDIT_PERM_Condition()
{
	if(Bdt13_Friend == TRUE)
	{
		return TRUE;
	};
};

func void DIA_1013_BANDIT_PERM_Info()
{
	AI_Output(other,self,"DIA_1013_BANDIT_PERM_15_00");	//Есть что-нибудь еще, что может заинтересовать меня?
	if(bdt13_Gossip_Wildnis == FALSE)
	{
		AI_Output(self,other,"DIA_1013_BANDIT_PERM_01_01");	//Ты имеешь в виду эту местность? Если хочешь остаться в живых, тебе лучше держаться дороги.
		AI_Output(self,other,"DIA_1013_BANDIT_PERM_01_02");	//Чем дальше ты заходишь в глушь, тем опаснее там находиться.
		bdt13_Gossip_Wildnis = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_1013_BANDIT_PERM_01_03");	//Я сказал тебе все, что мог.
	};
};

instance DIA_1013_BANDIT_LeeFarm(C_Info)
{
	npc = Bdt_1013_Bandit_L;
	nr = 3;
	condition = DIA_1013_BANDIT_LeeFarm_Condition;
	information = DIA_1013_BANDIT_LeeFarm_Info;
	permanent = FALSE;
	description = "На твое месте я бы отправился на ферму к Онару.";
};

func int DIA_1013_BANDIT_LeeFarm_Condition()
{
	if((Bdt_1013_Away == TRUE) && (LeeMeet == TRUE))
	{
		return TRUE;
	};
};

func void DIA_1013_BANDIT_LeeFarm_Info()
{
	AI_Output(other,self,"DIA_ADDON_1013_BANDIT_LeeFarm_01_00");	//На твоем месте я бы лучше отправился на ферму к Онару.
	AI_Output(other,self,"DIA_ADDON_1013_BANDIT_LeeFarm_01_01");	//Среди наемников Ли полно тех, кто раньше сидел за Барьером. Там ты будешь чувствовать себя почти как дома.
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_LeeFarm_01_03");	//Я уже и сам думал об этом. Но есть небольшая проблемка.
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_LeeFarm_01_04");	//Как только они увидят меня в этих доспехах, то обязательно примут за бандита.
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_LeeFarm_01_05");	//А отправляться в такой долгий путь совершенно голым - чистое безумие.
	AI_Output(other,self,"DIA_ADDON_1013_BANDIT_LeeFarm_01_06");	//Тогда тебе нужно найти другие.
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_LeeFarm_01_07");	//Легко сказать. Хорошие доспехи тут отыскать сложно.
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_LeeFarm_01_08");	//А всякое тряпье я носить не буду.
	AI_Output(other,self,"DIA_ADDON_1013_BANDIT_LeeFarm_01_09");	//Ладно, я попробую раздобыть для тебя какие-нибудь доспехи поприличней.
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_LeeFarm_01_10");	//Спасибо, приятель. Поверь, я в долгу не останусь.
	MIS_JessArmor = LOG_Running;
	Log_CreateTopic(TOPIC_JessArmor,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_JessArmor,LOG_Running);
	B_LogEntry(TOPIC_JessArmor,"Я пообещал Джессу раздобыть для него приличные доспехи, чтобы он смог отправиться на ферму Онара.");
};

instance DIA_1013_BANDIT_LeeFarm_Done(C_Info)
{
	npc = Bdt_1013_Bandit_L;
	nr = 1;
	condition = DIA_1013_BANDIT_LeeFarm_Done_Condition;
	information = DIA_1013_BANDIT_LeeFarm_Done_Info;
	permanent = FALSE;
	description = "У меня есть для тебя новые доспехи.";
};

func int DIA_1013_BANDIT_LeeFarm_Done_Condition()
{
	if((MIS_JessArmor == LOG_Running) && ((Npc_HasItems(hero,ItAr_Sld_L) >= 1) || (Npc_HasItems(hero,itar_sld_M) >= 1) || (Npc_HasItems(hero,ItAr_Sld_H) >= 1) || (Npc_HasItems(hero,ITAR_ADVENTURE_HERO) >= 1)))
	{
		return TRUE;
	};
};

func void DIA_1013_BANDIT_LeeFarm_Done_Info()
{
	AI_Output(other,self,"DIA_ADDON_1013_BANDIT_LeeFarm_Done_01_00");	//У меня есть для тебя новые доспехи.
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_LeeFarm_Done_01_01");	//Дай мне взглянуть на них. Они точно мне подойдут?
	AI_Output(other,self,"DIA_ADDON_1013_BANDIT_LeeFarm_Done_01_02");	//Сам посмотри.

	Info_ClearChoices(DIA_1013_BANDIT_LeeFarm_Done);

	if(Npc_HasItems(hero,ITAR_ADVENTURE_HERO) >= 1)
	{
		Info_AddChoice(DIA_1013_BANDIT_LeeFarm_Done,"(отдать доспехи авантюриста)",DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_01);
	};
	if(Npc_HasItems(hero,ItAr_Sld_L) >= 1)
	{
		Info_AddChoice(DIA_1013_BANDIT_LeeFarm_Done,"(отдать легкие доспехи наемника)",DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_02);
	};
	if(Npc_HasItems(hero,itar_sld_M) >= 1)
	{
		Info_AddChoice(DIA_1013_BANDIT_LeeFarm_Done,"(отдать средние доспехи наемника)",DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_03);
	};
	if(Npc_HasItems(hero,ItAr_Sld_H) >= 1)
	{
		Info_AddChoice(DIA_1013_BANDIT_LeeFarm_Done,"(отдать тяжелые доспехи наемника)",DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_04);
	};
};

func void DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_01()
{
	B_GivePlayerXP(250);
	B_GiveInvItems(other,self,ITAR_ADVENTURE_HERO,1);
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_01_03");	//Да, приятель! В самый раз.
	AI_EquipArmor(self,ITAR_ADVENTURE_HERO);
	Npc_RemoveInvItems(self,itar_bdt_f,1);
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_01_04");	//Ну что ж, теперь можно и к наемникам податься.
	AI_Output(other,self,"DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_01_05");	//Сам дорогу найдешь?
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_01_06");	//Конечно. Спасибо за помощь! 
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_01_07");	//Вот, возьми это кольцо.
	B_GiveInvItems(self,other,ItRi_OreBarons,1);
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_01_08");	//Я прихватил его с собой из сундука одного стражника в Старом лагере, когда уносил оттуда ноги.
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_01_09");	//Думаю, оно тебе пригодится. Еще увидимся.
	MIS_JessArmor = LOG_Success;
	Log_SetTopicStatus(TOPIC_JessArmor,LOG_Success);
	B_LogEntry(TOPIC_JessArmor,"Я принес Джессу доспехи. Теперь он может отправляться на ферму к наемникам Ли.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Onar");
	self.guild = GIL_SLD;
};

func void DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_02()
{
	B_GivePlayerXP(500);
	B_GiveInvItems(other,self,ItAr_Sld_L,1);
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_02_03");	//Да, приятель! В самый раз.
	AI_EquipArmor(self,ItAr_Sld_L);
	Npc_RemoveInvItems(self,itar_bdt_f,1);
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_02_04");	//Ну что ж, теперь можно и к наемникам податься.
	AI_Output(other,self,"DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_02_05");	//Сам дорогу найдешь?
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_02_06");	//Конечно. Спасибо за помощь! 
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_02_07");	//Вот, возьми это кольцо.
	B_GiveInvItems(self,other,ItRi_OreBarons,1);
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_02_08");	//Я прихватил его с собой из сундука одного стражника в Старом лагере, когда уносил оттуда ноги.
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_02_09");	//Думаю, оно тебе пригодится. Еще увидимся.
	MIS_JessArmor = LOG_Success;
	Log_SetTopicStatus(TOPIC_JessArmor,LOG_Success);
	B_LogEntry(TOPIC_JessArmor,"Я принес Джессу доспехи. Теперь он может отправляться на ферму к наемникам Ли.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Onar");
	self.guild = GIL_SLD;
};

func void DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_03()
{
	B_GivePlayerXP(750);
	B_GiveInvItems(other,self,itar_sld_M,1);
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_03_03");	//Да, приятель! В самый раз.
	AI_EquipArmor(self,itar_sld_M);
	Npc_RemoveInvItems(self,itar_bdt_f,1);
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_03_04");	//Ну что ж, теперь можно и к наемникам податься.
	AI_Output(other,self,"DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_03_05");	//Сам дорогу найдешь?
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_03_06");	//Конечно. Спасибо за помощь! 
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_03_07");	//Вот, возьми это кольцо.
	B_GiveInvItems(self,other,ItRi_OreBarons,1);
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_03_08");	//Я прихватил его с собой из сундука одного стражника в Старом лагере, когда уносил оттуда ноги.
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_03_09");	//Думаю, оно тебе пригодится. Еще увидимся.
	MIS_JessArmor = LOG_Success;
	Log_SetTopicStatus(TOPIC_JessArmor,LOG_Success);
	B_LogEntry(TOPIC_JessArmor,"Я принес Джессу доспехи. Теперь он может отправляться на ферму к наемникам Ли.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Onar");
	self.guild = GIL_SLD;
};

func void DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_04()
{
	B_GivePlayerXP(1000);
	B_GiveInvItems(other,self,ItAr_Sld_H,1);
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_04_03");	//Да, приятель! В самый раз.
	AI_EquipArmor(self,ItAr_Sld_H);
	Npc_RemoveInvItems(self,itar_bdt_f,1);
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_04_04");	//Ну что ж, теперь можно и к наемникам податься.
	AI_Output(other,self,"DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_04_05");	//Сам дорогу найдешь?
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_04_06");	//Конечно. Спасибо за помощь! 
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_04_07");	//Вот, возьми это кольцо.
	B_GiveInvItems(self,other,ItRi_OreBarons,1);
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_04_08");	//Я прихватил его с собой из сундука одного стражника в Старом лагере, когда уносил оттуда ноги.
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_LeeFarm_Done_Armor_04_09");	//Думаю, оно тебе пригодится. Еще увидимся.
	MIS_JessArmor = LOG_Success;
	Log_SetTopicStatus(TOPIC_JessArmor,LOG_Success);
	B_LogEntry(TOPIC_JessArmor,"Я принес Джессу доспехи. Теперь он может отправляться на ферму к наемникам Ли.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Onar");
	self.guild = GIL_SLD;
};