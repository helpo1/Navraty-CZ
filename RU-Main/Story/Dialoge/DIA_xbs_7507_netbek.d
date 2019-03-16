var int NetBekIsDruid;

instance DIA_NETBEK_EXIT(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 999;
	condition = dia_netbek_exit_condition;
	information = dia_netbek_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int dia_netbek_exit_condition()
{
	return TRUE;
};

func void dia_netbek_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_NETBEK_FIRSTHALLO(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 2;
	condition = dia_netbek_firsthallo_condition;
	information = dia_netbek_firsthallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_netbek_firsthallo_condition()
{
	return TRUE;
};

func void dia_netbek_firsthallo_info()
{
	AI_Output(self,other,"DIA_Netbek_Hallo_01_00");	//Приветствую тебя, старый знакомый.
	AI_Output(other,self,"DIA_Netbek_Hallo_01_01");	//Как?! Ты меня еще помнишь?
	AI_Output(self,other,"DIA_Netbek_Hallo_01_02");	//(улыбается) А как же. Хотя я и был тогда в основном занят только разговорами с окружающими меня деревьями, но такого человека, как ты, позабыть трудно!
	AI_Output(other,self,"DIA_Netbek_Hallo_01_03");	//Что же, это радует. А что тут произошло?
	AI_Output(self,other,"DIA_Netbek_Hallo_01_04");	//Ничего. Но если тебя интересует, как я смог остаться в живых, то это очень просто.
	AI_Output(self,other,"DIA_Netbek_Hallo_01_05");	//Мои деревья дали мне защиту от магии Спящего - они спасли меня от безумия и страшной смерти, постигшей прочих моих братьев.
	AI_Output(self,other,"DIA_Netbek_Hallo_01_06");	//А теперь привели меня к божеству, помогающему обрести мудрость и познать истинный смысл этой жизни.
	AI_Output(self,other,"DIA_Netbek_Hallo_01_08");	//Это дух природы, чью силу ты наверняка должен ощущать сейчас вокруг себя. Не так ли?
};


instance DIA_NETBEK_HALLO2(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 3;
	condition = dia_netbek_hallo_condition;
	information = dia_netbek_hallo_brothers;
	permanent = FALSE;
	description = "А как ты относишься к другим божествам?";
};

instance DIA_NETBEK_HALLO3(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 3;
	condition = dia_netbek_hallo_condition;
	information = dia_netbek_hallo_orcs;
	permanent = FALSE;
	description = "А как же твой бог относится к оркам?";
};

instance DIA_NETBEK_HALLO4(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 3;
	condition = dia_netbek_hallo4_condition;
	information = dia_netbek_hallo_runes;
	permanent = TRUE;
	description = "А твой бог дал тебе знание рун?";
};

func int dia_netbek_hallo_condition()
{
	return TRUE;
};

var int netbek_hallo4;

func int dia_netbek_hallo4_condition()
{
	if(NETBEK_HALLO4 == FALSE)
	{
		return TRUE;
	};
};

func void dia_netbek_hallo_brothers()
{
	AI_Output(other,self,"DIA_Netbek_Hallo_15_05");	//А как же другие божества?
	AI_Output(self,other,"DIA_Netbek_Hallo_01_09");	//(надменно) Ты имеешь в виду Инноса и прочих?  Что мне эти братья, играющие в свои игры!
	AI_Output(other,self,"DIA_Netbek_Hallo_15_06");	//Иннос несет свет в этот мир - разве это игра?
	AI_Output(self,other,"DIA_Netbek_Hallo_01_10");	//Ты принял за свет блеск монет, сложенных у его статуй.
	AI_Output(other,self,"DIA_Netbek_Hallo_15_07");	//И тебя не прельщает сила, которую обещает Белиар?
	AI_Output(self,other,"DIA_Netbek_Hallo_01_11");	//Разве смог бы он создать такой лес, который создал тут мой Бог?
	AI_Output(other,self,"DIA_Netbek_Hallo_15_08");	//А как же тогда насчет Аданоса?
	AI_Output(self,other,"DIA_Netbek_Hallo_01_12");	//Пожалуй, только Аданос достоин уважения. Он мудр в своем срединном пути.
	AI_Output(self,other,"DIA_Netbek_Hallo_01_20");	//И его вода несет жизнь моим деревьям.
	NetBekIsDruid = TRUE;
};

func void dia_netbek_hallo_orcs()
{
	AI_Output(other,self,"DIA_Netbek_Hallo_15_09");	//Как твой бог относится к оркам?
	AI_Output(self,other,"DIA_Netbek_Hallo_01_13");	//Он отец всем живым созданиям.
	AI_Output(other,self,"DIA_Netbek_Hallo_15_10");	//Так почему орки ушли отсюда?
	AI_Output(self,other,"DIA_Netbek_Hallo_01_14");	//Я думал, что эти зверушки любят мои деревья, а они хотели их СРУБИТЬ!
	AI_Output(self,other,"DIA_Netbek_Hallo_01_15");	//Теперь они ушли, и больше в мой лес они не зайдут.
};

func void dia_netbek_hallo_runes()
{
	AI_Output(other,self,"DIA_Netbek_Hallo_15_12");	//Раз твой бог такой могучий, значит, он может дать тебе знание новых рун?
	AI_Output(self,other,"DIA_Netbek_Hallo_01_16");	//Разве ты видишь где-то у меня эти руны?
	AI_Output(self,other,"DIA_Netbek_Hallo_01_19");	//Правда, я иногда использую камни трансформации для превращения в различных животных.
	AI_Output(self,other,"DIA_Netbek_Hallo_01_21");	//Но рунами их назвать довольно-таки сложно.
	NETBEK_HALLO4 = TRUE;
};

instance DIA_NETBEK_OrcFight(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 3;
	condition = dia_netbek_OrcFight_condition;
	information = dia_netbek_OrcFight_info;
	permanent = FALSE;
	description = "Ты как-нибудь можешь мне помочь в сражении с орками?";
};

func int dia_netbek_OrcFight_condition()
{
	if(Npc_KnowsInfo(hero,DIA_NETBEK_HALLO3) == TRUE)
	{
		return TRUE;
	};
};

func void dia_netbek_OrcFight_info()
{
	AI_Output(other,self,"DIA_Netbek_OrcFight_01_01");	//Ты можешь как-нибудь помочь мне в сражении с орками?
	AI_Output(self,other,"DIA_Netbek_OrcFight_01_02");	//Конечно. Но только в том случае, если ты поможешь мне решить одну небольшую проблему.
	AI_Output(self,other,"DIA_Netbek_OrcFight_01_03");	//Совсем недавно в моем лесу появилось огромное чудовище - пещерный тролль.
	AI_Output(self,other,"DIA_Netbek_OrcFight_01_04");	//Это создание несет лишь разрушение моему лесу, вытаптывая растения и ломая деревья. Его надо остановить, пока он не наделал еще больше бед!
	AI_Output(other,self,"DIA_Netbek_OrcFight_01_05");	//Ты хочешь, чтобы я убил его?
	AI_Output(self,other,"DIA_Netbek_OrcFight_01_06");	//Это ты решай сам. Главное, чтобы он больше не причинял вреда моим деревьям.
	AI_Output(other,self,"DIA_Netbek_OrcFight_01_07");	//Ладно, я поговорю с этим парнем.
	MIS_EvilTroll = LOG_Running;
	Log_CreateTopic(TOPIC_EvilTroll,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_EvilTroll,LOG_Running);
	B_LogEntry(TOPIC_EvilTroll,"Нетбек хочет, чтобы я разобрался с огромным троллем, который недавно поселился в его лесу.");
	Wld_InsertNpc(TROLL_CAVE_UNIQ,"WP_COAST_FOREST_72");
};

instance DIA_NETBEK_OrcFight_Done(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 3;
	condition = dia_netbek_OrcFight_Done_condition;
	information = dia_netbek_OrcFight_Done_info;
	permanent = FALSE;
	description = "Я разобрался с твоим гостем.";
};

func int dia_netbek_OrcFight_Done_condition()
{
	if((MIS_EvilTroll == LOG_Running) && (UturIsDead == TRUE))
	{
		return TRUE;
	};
};

func void dia_netbek_OrcFight_Done_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Netbek_OrcFight_Done_01_01");	//Я разобрался с твоим гостем.
	AI_Output(self,other,"DIA_Netbek_OrcFight_Done_01_02");	//Хорошо. Теперь моим созданиям ничто не угрожает.

	if(other.attribute[ATR_DEXTERITY] > other.attribute[ATR_STRENGTH])
	{
		if((other.guild == GIL_KDF) || (other.guild == GIL_KDW) || (other.guild == GIL_KDM) || (other.guild == GIL_GUR) || (other.guild == GIL_NDM) || (other.guild == GIL_NDW) || (other.guild == GIL_NOV))
		{
			AI_Output(self,other,"DIA_Netbek_OrcFight_Done_01_08");	//Возьми эти магические травы в знак моей признательности.
			B_GiveInvItems(self,other,ItPl_NetbekPlant_Magic,10);
			AI_Output(self,other,"DIA_Netbek_OrcFight_Done_01_09");	//Они помогут тебе в твоих странствиях.
		}
		else
		{
			AI_Output(self,other,"DIA_Netbek_OrcFight_Done_01_03");	//Возьми этот лук в знак моей признательности.
			B_GiveInvItems(self,other,ITRW_KMR_KADAT_BOW_01,1);
			AI_Output(self,other,"DIA_Netbek_OrcFight_Done_01_04");	//Его создала сама природа! Он надежно защитит тебя от твоих врагов.
		};
	}
	else
	{
		if((other.guild == GIL_KDF) || (other.guild == GIL_KDW) || (other.guild == GIL_KDM) || (other.guild == GIL_GUR) || (other.guild == GIL_NDM) || (other.guild == GIL_NDW) || (other.guild == GIL_NOV))
		{
			AI_Output(self,other,"DIA_Netbek_OrcFight_Done_01_08");	//Возьми эти магические травы в знак моей признательности.
			B_GiveInvItems(self,other,ItPl_NetbekPlant_Magic,10);
			AI_Output(self,other,"DIA_Netbek_OrcFight_Done_01_09");	//Они помогут тебе в твоих странствиях.
		}
		else
		{
			AI_Output(self,other,"DIA_Netbek_OrcFight_Done_01_06");	//Возьми эти целебные травы в знак моей признательности.
			B_GiveInvItems(self,other,ItPl_NetbekPlant,10);
			AI_Output(self,other,"DIA_Netbek_OrcFight_Done_01_07");	//Они излечат любые раны, полученные тобой в бою!
		};
	};

	MIS_EvilTroll = LOG_Success;
	Log_SetTopicStatus(TOPIC_EvilTroll,LOG_Success);
	B_LogEntry(TOPIC_EvilTroll,"Нетбек был рад услышать о том, что его лесу больше ничто не угрожает.");
};

instance DIA_NETBEK_DRAGONS(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 3;
	condition = dia_netbek_dragons_condition;
	information = dia_netbek_dragons_info;
	permanent = FALSE;
	description = "Я иду сражаться с драконами.";
};

func int dia_netbek_dragons_condition()
{
	if((MIS_RitualInnosEyeRepair == LOG_SUCCESS) && (MIS_AllDragonsDead == FALSE))
	{
		return TRUE;
	};
};

func void dia_netbek_dragons_info()
{
	AI_Output(other,self,"DIA_Netbek_Dragons_15_00");	//Я иду сражаться с драконами. Твой бог ничем не может мне помочь?
	AI_Output(self,other,"DIA_Netbek_Dragons_01_00");	//Он признает свободу не только для тебя, но и для драконов. Даже несмотря на то, что их мысли темны и полны разрушения.
	AI_Output(self,other,"DIA_Netbek_Dragons_01_01");	//Но поскольку это разрушение зашло слишком далеко, он может помочь.
	AI_Output(self,other,"DIA_Netbek_Dragons_01_02");	//Вот, прими от него этот небольшой дар - сила природы защитит тебя.
	B_GiveInvItems(self,other,ITRU_SUMTREANT,1);
	AI_Output(other,self,"DIA_Netbek_Dragons_01_03");	//Хммм... что это?
	AI_Output(self,other,"DIA_Netbek_Dragons_01_04");	//Это магический камень друидов.
	AI_Output(self,other,"DIA_Netbek_Dragons_01_05");	//С его помощью ты сможешь вызвать себе в подмогу верных слуг моего Бога. 
	AI_Output(self,other,"DIA_Netbek_Dragons_01_06");	//Их гнев уже не раз помогал мне защитить это место от врагов.
};

var int netbeksayonetimemoney;

func void netbekaboutmoney()
{
	if(NETBEKSAYONETIMEMONEY == FALSE)
	{
		AI_Output(other,self,"DIA_Netbek_AboutMoney_15_00");	//И?
		AI_Output(self,other,"DIA_Netbek_AboutMoney_01_01");	//Ты ожидаешь от меня вознаграждения?
		AI_Output(self,other,"DIA_Netbek_AboutMoney_01_02");	//Разве все в своей жизни ты делаешь за деньги?
		AI_Output(self,other,"DIA_Netbek_AboutMoney_01_03");	//Не жди их от меня. Ты же видишь, что мне даже некуда их положить.
		AI_Output(self,other,"DIA_Netbek_AboutMoney_01_04");	//Чтобы положить деньги, нужен кошелек. Кошелек надо класть в штаны. Тут уже не обойтись без меча, чтобы защитить эти штаны и кошелек.
		AI_Output(self,other,"DIA_Netbek_AboutMoney_01_05");	//Где штаны и меч, там и дом. Где дом, там и много-много мыслей - как сохранить всю эту кучу рухляди, которую ты купил на свое золото.
		AI_Output(self,other,"DIA_Netbek_AboutMoney_01_06");	//А с этими мыслями не останется времени ни на мои деревья, ни на разговор с моим Богом.
		AI_Output(self,other,"DIA_Netbek_AboutMoney_01_07");	//Тогда зачем мне это? И больше не проси у меня денег.
		NETBEKSAYONETIMEMONEY = TRUE;
	};
};


instance DIA_NETBEK_DRAGONSDEAD(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 3;
	condition = dia_netbek_dragonsdead_condition;
	information = dia_netbek_dragonsdead_info;
	permanent = FALSE;
	description = "Все драконы мертвы!";
};


func int dia_netbek_dragonsdead_condition()
{
	if((MIS_AllDragonsDead == TRUE) && (Kapitel < 6))
	{
		return TRUE;
	};
};

func void dia_netbek_dragonsdead_info()
{
	B_GivePlayerXP(XP_NETBEKGREATWORK);
	AI_Output(other,self,"DIA_Netbek_DragonsDead_15_00");	//Все драконы мертвы!
	AI_Output(self,other,"DIA_Netbek_DragonsDead_01_01");	//Благодарю тебя. Они были плохими гостями.
	netbekaboutmoney();
};


instance DIA_NETBEK_LASTDRAGON(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 3;
	condition = dia_netbek_lastdragon_condition;
	information = dia_netbek_lastdragon_info;
	permanent = FALSE;
	description = "Я отправляюсь в храм Ирдората.";
};


func int dia_netbek_lastdragon_condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && (Kapitel < 6) && (RealMode[2] == FALSE))
	{
		return TRUE;
	};
};

func void dia_netbek_lastdragon_info()
{
	AI_Output(other,self,"DIA_Netbek_LastDragon_01_00");	//Я отправляюсь в храм Ирдората, чтобы сражаться там с темными слугами Белиара.
	AI_Output(other,self,"DIA_Netbek_LastDragon_01_01");	//Твой бог не может мне чем-нибудь помочь?
	AI_Output(self,other,"DIA_Netbek_LastDragon_01_02");	//Он уже предупредил меня о твоем появлении здесь.
	AI_Output(self,other,"DIA_Netbek_LastDragon_01_03");	//И с его помощью я изготовил особенное зелье специально для тебя.
	AI_Output(other,self,"DIA_Netbek_LastDragon_01_04");	//Что это за зелье?
	AI_Output(self,other,"DIA_Netbek_LastDragon_01_05");	//Как я уже сказал, это очень необычное зелье. Оно дарует тебе бессмертие!
	AI_Output(self,other,"DIA_Netbek_LastDragon_01_06");	//Правда, лишь на некоторое время и всего один раз.
	AI_Output(self,other,"DIA_Netbek_LastDragon_01_07");	//Используй его только в случае крайней необходимости. Вот, возьми.
	B_GiveInvItems(self,other,itpo_xmagicdef,1);
	AI_Output(other,self,"DIA_Netbek_LastDragon_01_08");	//Что же, спасибо.
	AI_Output(self,other,"DIA_Netbek_LastDragon_01_09");	//И помни: твоя главная битва может оказаться далеко не такой, какой ты ее представляешь.
};


instance DIA_NETBEK_DEMENTORS(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 3;
	condition = dia_netbek_dementors_condition;
	information = dia_netbek_dementors_info;
	permanent = FALSE;
	description = "Мне нужна помощь, чтобы одолеть темных странников.";
};


func int dia_netbek_dementors_condition()
{
	if((Kapitel < 6) && ((SC_ObsessionCounter > 0) || (SC_ObsessionTimes > 0) || (SC_IsObsessed == TRUE)))
	{
		return TRUE;
	};
};

func void dia_netbek_dementors_info()
{
	AI_Output(other,self,"DIA_Netbek_Dementors_15_00");	//Мне нужна помощь, чтобы одолеть темных странников. Ты поможешь мне?
	AI_Output(self,other,"DIA_Netbek_Dementors_01_00");	//Ты и сам справишься.
	AI_Output(self,other,"DIA_Netbek_Dementors_01_01");	//Мне тяжело убивать своих вчерашних братьев, даже если они уже погибли!

	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF) || (hero.guild == GIL_NOV))
	{
		AI_Output(self,other,"DIA_Netbek_Dementors_01_02");	//А твой Иннос освобождает тебя от излишних раздумий.
	};
};


instance DIA_NETBEK_HEADILL(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 3;
	condition = dia_netbek_headill_condition;
	information = dia_netbek_headill_info;
	permanent = FALSE;
	description = "У кого-нибудь в лагере есть головные боли?";
};


func int dia_netbek_headill_condition()
{
	if(Kapitel >= 3)
	{
		return TRUE;
	};
};

func void dia_netbek_headill_info()
{
	AI_Output(other,self,"DIA_Netbek_HeadIll_15_00");	//У кого-нибудь в лагере есть головные боли? Или дурные сны?
	AI_Output(self,other,"DIA_Netbek_HeadIll_01_00");	//Я чувствую темную магию, которая кружит над этой долиной.
	AI_Output(self,other,"DIA_Netbek_HeadIll_01_01");	//Тут действительно опасно находиться! Особенно моим бывшим собратьям по Болотному лагерю.
	AI_Output(self,other,"DIA_Netbek_HeadIll_01_02");	//Но мой Бог дает мне силы и умение защитить это место. Здесь они в полной безопасности.
};


instance DIA_NETBEK_HEALING(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 3;
	condition = dia_netbek_healing_condition;
	information = dia_netbek_healing_info;
	permanent = TRUE;
	description = "Пожалуйста, вылечи меня.";
};


func int dia_netbek_healing_condition()
{
	if(Npc_KnowsInfo(other,dia_netbek_firsthallo))
	{
		return TRUE;
	};
};


var int netbekhealobsession;

func void dia_netbek_healing_info()
{
	AI_Output(other,self,"DIA_Netbek_Healing_15_00");	//Пожалуйста, вылечи меня.
	if(SC_IsObsessed == TRUE)
	{
		if(SC_ObsessionTimes < 1)
		{
			AI_Output(other,self,"DIA_Netbek_Healing_15_01");	//И еще у меня какие-то неприятные ощущения после встречи с темными странниками.
			AI_Output(self,other,"DIA_Netbek_Healing_01_00");	//Они заразили твою душу одержимостью!
			AI_Output(self,other,"DIA_Netbek_Healing_01_01");	//Ты должен отправиться к магам Инноса.
			AI_Output(self,other,"DIA_Netbek_Healing_01_02");	//Впрочем, ты же попросил вылечить тебя - и мой Бог научил меня этому.
			NETBEKHEALOBSESSION = TRUE;
		}
		else
		{
			AI_Output(other,self,"DIA_Netbek_Healing_15_02");	//И я снова одержим.
			if(NETBEKHEALOBSESSION == FALSE)
			{
				AI_Output(self,other,"DIA_Netbek_Healing_01_03");	//Ты должен бы отправиться к магам Инноса.
				AI_Output(self,other,"DIA_Netbek_Healing_01_04");	//Но ты попросил тебя вылечить - и мой Бог научил меня этому.
				NETBEKHEALOBSESSION = TRUE;
			}
			else if(MIS_OCGateOpen == TRUE)
			{
				AI_Output(self,other,"DIA_Netbek_Healing_01_08");	//Хорошо, хоть ты этого и не заслуживаешь.
			}
			else
			{
				AI_Output(self,other,"DIA_Netbek_Healing_01_07");	//Хорошо.
			};
		};
		AI_WaitTillEnd(self,other);
		SC_ObsessionTimes = SC_ObsessionTimes + 1;
		B_ClearSCObsession(hero);
		Wld_PlayEffect("spellFX_LIGHTSTAR_WHITE",hero,hero,0,0,0,FALSE);
		Snd_Play("SFX_HealObsession");
	}
	else if(hero.attribute[ATR_HITPOINTS] >= hero.attribute[ATR_HITPOINTS_MAX])
	{
		AI_Output(self,other,"DIA_Netbek_Healing_01_05");	//Ты здоров.
		AI_StopProcessInfos(self);
		return;
	}
	else
	{
		if(MIS_OCGateOpen == TRUE)
		{
			AI_Output(self,other,"DIA_Netbek_Healing_01_09");	//Хорошо, я помогу тебе. Хотя ты этого и не заслуживаешь.
		}
		else
		{
			AI_Output(self,other,"DIA_Netbek_Healing_01_06");	//Хорошо. Я помогу тебе.
		};
		AI_WaitTillEnd(self,other);
	};
	if(hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX])
	{
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
		AI_Print(PRINT_FullyHealed);
	};
	AI_Output(self,other,"DIA_Netbek_Healing_01_10");	//Вот. Теперь ты снова здоров.
	AI_Output(other,self,"DIA_Netbek_Healing_15_03");	//Спасибо.
};


instance DIA_NETBEK_WHATHAPPENED(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 1;
	condition = dia_netbek_whathappened_condition;
	information = dia_netbek_whathappened_info;
	permanent = FALSE;
	description = "Что-нибудь произошло за последнее время?";
};


func int dia_netbek_whathappened_condition()
{
	if(MIS_ORсGREATWAR == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_netbek_whathappened_info()
{
	AI_Output(other,self,"DIA_Netbek_WhatHappened_01_01");	//Что-нибудь произошло за последнее время?
	AI_Output(self,other,"DIA_Netbek_WhatHappened_01_02");	//Пару дней назад орки пытались атаковать наш лагерь, но у них ничего не вышло.
	AI_Output(self,other,"DIA_Netbek_WhatHappened_01_03");	//Уверен, что они больше не сунутся сюда.
	AI_Output(self,other,"DIA_Netbek_WhatHappened_01_05");	//Оглянись вокруг, и ты сам все поймешь.
	AI_Output(other,self,"DIA_Netbek_WhatHappened_01_06");	//Это твой бог защитил вас?
	AI_Output(self,other,"DIA_Netbek_WhatHappened_01_07");	//(улыбается) Конечно. Он всегда будет помогать нам.
};

instance DIA_NETBEK_GUARDIANSKNOW(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 1;
	condition = dia_netbek_guardiansknow_condition;
	information = dia_netbek_guardiansknow_info;
	permanent = FALSE;
	description = "Что твой бог знает о Хранителях?";
};

func int dia_netbek_guardiansknow_condition()
{
	if((GATHERALLONBIGFARM == TRUE) && (MIS_ORCSECRET == LOG_Running) && (PyrokarTellAboutCreatures == TRUE))
	{
		return TRUE;
	};
};

func void dia_netbek_guardiansknow_info()
{
	B_GivePlayerXP(400);
	AI_Output(other,self,"DIA_Netbek_GuardiansKnow_01_01");	//Что твой бог знает о Хранителях?
	AI_Output(self,other,"DIA_Netbek_GuardiansKnow_01_02");	//Он знает все. Но мне кажется, что ты хотел спросить меня совсем о другом. Не так ли?
	AI_Output(other,self,"DIA_Netbek_GuardiansKnow_01_03");	//Да, ты прав. Я действительно намеревался задать тебе совсем иной вопрос.
	AI_Output(self,other,"DIA_Netbek_GuardiansKnow_01_04");	//Сможет ли мой бог уничтожить этих древних созданий, которых ты называешь Хранителями? Полагаю, ты хотел узнать об этом.
	AI_Output(other,self,"DIA_Netbek_GuardiansKnow_01_05");	//Судя по всему, от тебя ничего не скроешь.
	AI_Output(self,other,"DIA_Netbek_GuardiansKnow_01_06");	//Что же, тогда я отвечу на твой вопрос. К сожалению, его власть в этом мире не столь велика, чтобы противостоять могуществу самих Создателей.
	AI_Output(self,other,"DIA_Netbek_GuardiansKnow_01_07");	//Но несмотря на это, ему вполне по силам оказать помощь тому, кому самой судьбой уготовлено бросить им вызов.
	AI_Output(other,self,"DIA_Netbek_GuardiansKnow_01_08");	//И кто же на такое способен?
	AI_Output(self,other,"DIA_Netbek_GuardiansKnow_01_09");	//В этом мире существует только один человек, от чьих действий зависят судьбы богов - ты сам.
	AI_Output(other,self,"DIA_Netbek_GuardiansKnow_01_10");	//Я?!
	AI_Output(self,other,"DIA_Netbek_GuardiansKnow_01_11");	//(серьезно) Ты не простой смертный, и уже должен был это понять. Простые люди не могут совершать поступки и действия, подобные твоим.
	AI_Output(other,self,"DIA_Netbek_GuardiansKnow_01_15");	//Я - избранник богов?!
	AI_Output(self,other,"DIA_Netbek_GuardiansKnow_01_16");	//А ты еще этого не понял? Только ты повинуешься Инносу, Белиару или Аданосу не так, как все остальные.
	AI_Output(self,other,"DIA_Netbek_GuardiansKnow_01_17");	//В этом и есть твое отличие от других. Ты всегда сам выбирал свой путь, сам выбирал, кому из них служить, а кому нет.
	AI_Output(self,other,"DIA_Netbek_GuardiansKnow_01_18");	//Но теперь пришло время, когда от тебя требуется встать на защиту всего сущего этого мира.
	AI_Output(self,other,"DIA_Netbek_GuardiansKnow_01_19");	//И только ты сможешь оградить этот мир от зла Хранителей!
 	B_LogEntry(TOPIC_GUARDIANS,"Я обратился за помощью к Нетбеку, полагая, что божество, которому он служит, вполне способно одолеть Хранителей. Однако его ответ несколько удивил меня. По его словам, только я смогу одолеть Хранителей, а его бог может лишь помочь мне в этом. По всей видимости, судьба этого мира и его богов действительно лежит только на моих плечах. Впрочем, как и всегда...");
};

instance DIA_NETBEK_GUARDIANSHOWHELP(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 1;
	condition = dia_netbek_guardianshowhelp_condition;
	information = dia_netbek_guardianshowhelp_info;
	permanent = FALSE;
	description = "И как твой бог мне поможет?";
};

func int dia_netbek_guardianshowhelp_condition()
{
	if(Npc_KnowsInfo(hero,dia_netbek_guardiansknow) == TRUE)
	{
		return TRUE;
	};
};

func void dia_netbek_guardianshowhelp_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Netbek_GuardiansHowHelp_01_01");	//И как твой бог мне поможет?
	AI_Output(self,other,"DIA_Netbek_GuardiansHowHelp_01_02");	//Он подскажет тебе, как подготовиться к битве с этими древними созданиями.
	AI_Output(other,self,"DIA_Netbek_GuardiansHowHelp_01_04");	//Хорошо. Что именно мне надо делать?
	AI_Output(self,other,"DIA_Netbek_GuardiansHowHelp_01_05");	//Для начала тебе следует обратиться к самим богам. Проси их наделить тебя своей божественной силой и могуществом.
	AI_Output(self,other,"DIA_Netbek_GuardiansHowHelp_01_06");	//Уверен, что любой из алтарей или какое-либо священное место, отмеченное их знаком, вполне для этого подойдет.
	AI_Output(other,self,"DIA_Netbek_GuardiansHowHelp_01_07");	//Это не так сложно. Что дальше?
	AI_Output(self,other,"DIA_Netbek_GuardiansHowHelp_01_08");	//Тебе будет необходимо создать особое магическое оружие, коим ты захочешь сразить Хранителей.
	AI_Output(self,other,"DIA_Netbek_GuardiansHowHelp_01_09");	//Поскольку обычное оружие смертных или магия рун вряд ли смогут им навредить.
	AI_Output(self,other,"DIA_Netbek_GuardiansHowHelp_01_12");	//Хранители, помимо своей божественной сущности, также являются созданиями различных форм стихий.
	AI_Output(self,other,"DIA_Netbek_GuardiansHowHelp_01_13");	//Поэтому вначале тебе придется отыскать несколько очень редких артефактов, содержащих в себе истинную структуру каждой из них.
	AI_Output(self,other,"DIA_Netbek_GuardiansHowHelp_01_14");	//Ну а после ты должен будешь каким-то образом вложить всю их силу в выбранную тобой руну или клинок.
	AI_Output(self,other,"DIA_Netbek_GuardiansHowHelp_01_18");	//После того как ты получишь благословение богов, я подскажу тебе, где именно их искать.
	AI_Output(other,self,"DIA_Netbek_GuardiansHowHelp_01_21");	//Как скажешь. Что-нибудь еще?
	AI_Output(self,other,"DIA_Netbek_GuardiansHowHelp_01_22");	//Ну и последнее, что тебе понадобится, так это отыскать сам путь в священную обитель Хранителей!
	AI_Output(self,other,"DIA_Netbek_GuardiansHowHelp_01_23");	//И с этим, по правде говоря, я уже не знаю, как быть.
	AI_Output(other,self,"DIA_Netbek_GuardiansHowHelp_01_24");	//Это как раз не проблема. Кажется, у меня где-то была руна телепортации, ведущая прямо в их логово.
	AI_Output(self,other,"DIA_Netbek_GuardiansHowHelp_01_25");	//Правда? Ну, если так, то тогда тебе осталось выполнить только первые два условия.
	B_LogEntry(TOPIC_GUARDIANS,"Нетбек рассказал мне, как подготовить себя к битве с Хранителями. Сначала я должен обратиться к богам, чтобы получить их силу и могущество. После необходимо будет создать особое магическое оружие, которым можно сразить Хранителей. Для его создания понадобится несколько очень редких артефактов, сила которых способна наделить его невиданной мощью. Судя по всему, сами артефакты будет отыскать довольно трудно, но Нетбек обещал мне помочь и с этим.");
};

instance DIA_NETBEK_HOWGETBLESSED(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 1;
	condition = DIA_NETBEK_HOWGETBLESSED_condition;
	information = DIA_NETBEK_HOWGETBLESSED_info;
	permanent = FALSE;
	description = "И ты полагаешь, что боги вот так просто даруют мне свое могущество?";
};

func int DIA_NETBEK_HOWGETBLESSED_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Netbek_GuardiansHowHelp) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NETBEK_HOWGETBLESSED_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_NETBEK_HOWGETBLESSED_01_01");	//И ты полагаешь, что боги вот так просто даруют мне свое могущество?
	AI_Output(self,other,"DIA_NETBEK_HOWGETBLESSED_01_02");	//Поверь, у них просто нет иного выбора!
	AI_Output(self,other,"DIA_NETBEK_HOWGETBLESSED_01_03");	//Сейчас никто, кроме тебя, не способен стать тем, в чьи руки они готовы вверить свое могущество.
	AI_Output(self,other,"DIA_NETBEK_HOWGETBLESSED_01_04");	//(серьезно) Однако прежде чем это сделать, боги наверняка захотят вновь убедится в правильности своего решения.
	AI_Output(self,other,"DIA_NETBEK_HOWGETBLESSED_01_05");	//Судьба этого мира зависит от их выбора, и сейчас они не имеют права на ошибку. Так же, как и ты.
	AI_Output(other,self,"DIA_NETBEK_HOWGETBLESSED_01_07");	//Это я прекрасно понимаю. Но что им от меня будет нужно в этот раз?
	AI_Output(self,other,"DIA_NETBEK_HOWGETBLESSED_01_08");	//Уверен, что они сами скажут тебе об этом.
	AI_Output(self,other,"DIA_NETBEK_HOWGETBLESSED_01_09");	//Просто обратись к ним в молитве, и ты услышишь волю богов!
	NETBEKLEADME_STEP1 = TRUE;
	B_LogEntry(TOPIC_GUARDIANS,"Прежде чем боги даруют мне свое могущество, они захотят проверить меня еще раз. В чем будет заключаться их испытание, мне придется узнать у них самих.");
};

instance DIA_NETBEK_TITANS(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 1;
	condition = DIA_NETBEK_TITANS_condition;
	information = DIA_NETBEK_TITANS_info;
	permanent = FALSE;
	description = "Кажется, Хранители покровительствуют еще и оркам.";
};

func int DIA_NETBEK_TITANS_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Netbek_GuardiansHowHelp) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NETBEK_TITANS_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_NETBEK_TITANS_01_01");	//Кажется, Хранители покровительствуют еще и оркам.
	AI_Output(other,self,"DIA_NETBEK_TITANS_01_02");	//Ты что-нибудь знаешь об этом?
	AI_Output(self,other,"DIA_NETBEK_TITANS_01_03");	//(серьезно) Недавно нам вновь пришлось иметь с ними дело.
	AI_Output(self,other,"DIA_NETBEK_TITANS_01_04");	//Мне показалось, что их окружала какая-то очень могущественная защитная аура.
	AI_Output(self,other,"DIA_NETBEK_TITANS_01_05");	//По правде говоря, я не знаю, с чем это связано.
	AI_Output(self,other,"DIA_NETBEK_TITANS_01_06");	//Мой бог помог мне и в этот раз совладать с этой угрозой.
	AI_Output(self,other,"DIA_NETBEK_TITANS_01_07");	//Однако я готов с тобой согласиться, что сами орки никогда бы не смогли использовать подобную магию.
	AI_Output(self,other,"DIA_NETBEK_TITANS_01_08");	//Возможно, тут действительно не обошлось без вмешательства каких-то древних сил.
	AI_Output(other,self,"DIA_NETBEK_TITANS_01_09");	//Нам надо как-то найти и уничтожить источник этой магии!
	AI_Output(other,self,"DIA_NETBEK_TITANS_01_10");	//Иначе у людей не будет ни единого шанса противостоять оркам.
	AI_Output(other,self,"DIA_NETBEK_TITANS_01_11");	//Ведь твой бог не сможет защитить их всех.
	AI_Output(self,other,"DIA_NETBEK_TITANS_01_12");	//Да, ты прав. Он не столь могущественнен, как остальные божества этого мира. 
	AI_Output(other,self,"DIA_NETBEK_TITANS_01_13");	//Тогда пускай хотя бы поможет мне отыскать это древнее зло. Если уж на большее не способен.
	AI_Output(self,other,"DIA_NETBEK_TITANS_01_14");	//Я попрошу его помочь. Но для этого потребуется некоторое время.
	AI_Output(other,self,"DIA_NETBEK_TITANS_01_15");	//Как раз времени у нас сейчас нет! Так что лучше поторопи своего друга.
	AI_Output(self,other,"DIA_NETBEK_TITANS_01_16");	//Приходи завтра. Я попробую выяснить, что явилось причиной могущественной магии орков.
	NetBekWaitDay = Wld_GetDay();
	B_LogEntry(TOPIC_ORCSECRET,"Нетбек уже сталкивался с отрядами орков, защищенных древней магией. Он постарается узнать у своего бога причину ее появления. Но не раньше утра следующего дня...");
	AI_StopProcessInfos(self);
};

instance DIA_NETBEK_TITANS_KNOW(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 1;
	condition = DIA_NETBEK_TITANS_KNOW_condition;
	information = DIA_NETBEK_TITANS_KNOW_info;
	permanent = FALSE;
	description = "Так что насчет магии, защищающей орков?";
};

func int DIA_NETBEK_TITANS_KNOW_condition()
{
	var int daynow;

	daynow = Wld_GetDay();

	if((Npc_KnowsInfo(hero,DIA_NETBEK_TITANS) == TRUE) && (NetBekWaitDay != FALSE) && (NetBekWaitDay < daynow))
	{
		return TRUE;
	};
};

func void DIA_NETBEK_TITANS_KNOW_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_NETBEK_TITANS_KNOW_01_01");	//Так что насчет магии, защищающей орков?
	AI_Output(self,other,"DIA_NETBEK_TITANS_KNOW_01_02");	//Ее причиной явились очень древние существа, которые повинуются только воле Хранителей.
	AI_Output(self,other,"DIA_NETBEK_TITANS_KNOW_01_03");	//Они явились в этот мир с их согласия, и именно их магия помогает оркам в войне против людей.
	AI_Output(other,self,"DIA_NETBEK_TITANS_KNOW_01_04");	//Что это еще за создания?
	AI_Output(self,other,"DIA_NETBEK_TITANS_KNOW_01_05");	//Все они являются порождением чистейшей магии этого мира.
	AI_Output(self,other,"DIA_NETBEK_TITANS_KNOW_01_06");	//Уверен, что и Хранители вложили в них огромную часть своих сил и могущества.
	AI_Output(self,other,"DIA_NETBEK_TITANS_KNOW_01_07");	//Если исходить из того, что каждый из миротворцев являет собой само воплощение одной из стихий...
	AI_Output(self,other,"DIA_NETBEK_TITANS_KNOW_01_08");	//...то вполне можно предположить, что эти существа являют саму их сущность.
	AI_Output(self,other,"DIA_NETBEK_TITANS_KNOW_01_09");	//Большего, к сожалению, я сказать тебе пока не могу. 
	AI_Output(other,self,"DIA_NETBEK_TITANS_KNOW_01_10");	//М-да, не густо. Знаешь, я, пожалуй, пойду.
	AI_Output(other,self,"DIA_NETBEK_TITANS_KNOW_01_11");	//Не хочу больше терять времени на болтовню.
	AI_Output(self,other,"DIA_NETBEK_TITANS_KNOW_01_12");	//Постой. Это еще не все, о чем я хотел с тобой поговорить.
	B_LogEntry(TOPIC_ORCSECRET,"Бог Нетбека поведал ему, что причиной всему явились древние создания, которых породили сами Хранители. Они вложили в них большую часть своего могущества и именно их магия позволяет оркам оставаться неуязвимыми. По словам друида, сами существа представляют из себя сущность той из стихий, которую являют сами Хранители, создавшие их. Это все, что знает Нетбек.");
};

instance DIA_NETBEK_TITANS_Sleeper(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 1;
	condition = DIA_NETBEK_TITANS_Sleeper_condition;
	information = DIA_NETBEK_TITANS_Sleeper_info;
	permanent = FALSE;
	description = "Есть какие-нибудь новости?";
};

func int DIA_NETBEK_TITANS_Sleeper_condition()
{
	if((Npc_KnowsInfo(hero,DIA_NETBEK_TITANS_KNOW) == TRUE) && (MIS_SleeperBack == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_NETBEK_TITANS_Sleeper_info()
{
	AI_Output(other,self,"DIA_NETBEK_TITANS_Sleeper_01_01");	//Есть какие-нибудь новости?
	AI_Output(self,other,"DIA_NETBEK_TITANS_Sleeper_01_02");	//Дело в том, что в последнее время меня мучают странные видения из моего прошлого.
	AI_Output(self,other,"DIA_NETBEK_TITANS_Sleeper_01_03");	//Это очень странно, учитывая, что магия этого места всегда надежно защищала нас от всякого рода кошмаров.
	AI_Output(self,other,"DIA_NETBEK_TITANS_Sleeper_01_04");	//К тому же у многих бывших послушников Братства, что сейчас находятся здесь, вновь появились сильные головные боли!
	AI_Output(self,other,"DIA_NETBEK_TITANS_Sleeper_01_05");	//Примерно такие же, как были тогда, во время разрушения магического барьера.
	AI_Output(self,other,"DIA_NETBEK_TITANS_Sleeper_01_06");	//К сожалению, я пока не могу объяснить происходящее, но у меня уже закрались определенного рода опасения.
	AI_Output(other,self,"DIA_NETBEK_TITANS_Sleeper_01_07");	//На что ты намекаешь?
	AI_Output(self,other,"DIA_NETBEK_TITANS_Sleeper_01_08");	//Мне кажется, в этот мир могло вернуться зло, что некогда было изгнано тобой.
	AI_Output(other,self,"DIA_NETBEK_TITANS_Sleeper_01_09");	//Ты имеешь в виду Спящего?
	AI_Output(self,other,"DIA_NETBEK_TITANS_Sleeper_01_10");	//Да... Я говорю именно о нем.
	AI_Output(self,other,"DIA_NETBEK_TITANS_Sleeper_01_11");	//Мне бы не хотелось думать об этом, но с каждым днем мои тревоги растут все больше и больше.
	AI_Output(other,self,"DIA_NETBEK_TITANS_Sleeper_01_12");	//Тогда нам стоит немедленно проверить храм орков! Возможно, что ты и прав.
	AI_Output(self,other,"DIA_NETBEK_TITANS_Sleeper_01_13");	//В каком смысле?
	AI_Output(other,self,"DIA_NETBEK_TITANS_Sleeper_01_14");	//Тот темный маг, которого я убил в храме, сказал мне перед смертью, что успел закончить ритуал вызова демона.
	AI_Output(other,self,"DIA_NETBEK_TITANS_Sleeper_01_15");	//Конечно, тогда я не придал его словам большого значения.
	AI_Output(other,self,"DIA_NETBEK_TITANS_Sleeper_01_16");	//Но, по всей видимости, этот колдун мог говорить правду!
	AI_Output(self,other,"DIA_NETBEK_TITANS_Sleeper_01_17");	//Если это так, то тебе необходимо как можно скорее отправиться в храм.
	AI_Output(self,other,"DIA_NETBEK_TITANS_Sleeper_01_18");	//Пока еще не слишком поздно!
	AI_Output(self,other,"DIA_NETBEK_TITANS_Sleeper_01_19");	//Возвращение Спящего в этот мир может негативно сказаться не только на нас всех!
	AI_Output(self,other,"DIA_NETBEK_TITANS_Sleeper_01_20");	//К тому же, учитывая угрозу со стороны Хранителей, мир может рухнуть в одночасье!
	AI_Output(self,other,"DIA_NETBEK_TITANS_Sleeper_01_21");	//И не Иннос, ни Белиар не смогут помешать этому.
	AI_Output(other,self,"DIA_NETBEK_TITANS_Sleeper_01_22");	//Ладно, успокойся. Считай, что я уже на полпути в храм.
	AI_Output(other,self,"DIA_NETBEK_TITANS_Sleeper_01_23");	//И при необходимости верну этого непрошеного гостя туда, откуда он пришел.
	AI_Output(self,other,"DIA_NETBEK_TITANS_Sleeper_01_24");	//Тогда скорее отправляйся туда! Сейчас дорога каждая минута.
	B_LogEntry(TOPIC_SLEEPERBACK,"Похоже, мои опасения насчет Спящего начинают подтверждаться. Нетбека по ночам стали мучить кошмары, а у бывших послушников Братства начались сильные головные боли. Надо как можно скорее наведаться в Храм и разобраться в этой ситуации.");
	SLEEPERINSHRAM = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_NETBEK_TITANS_Sleeper_Find(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 1;
	condition = DIA_NETBEK_TITANS_Sleeper_Find_condition;
	information = DIA_NETBEK_TITANS_Sleeper_Find_info;
	permanent = FALSE;
	description = "Спящий вернулся в мир людей!";
};

func int DIA_NETBEK_TITANS_Sleeper_Find_condition()
{
	if((SleeperOldIsDead == FALSE) && (NeedSleeperStone == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NETBEK_TITANS_Sleeper_Find_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_NETBEK_TITANS_Sleeper_Find_01_01");	//Спящий вернулся в мир людей!
	AI_Output(self,other,"DIA_NETBEK_TITANS_Sleeper_Find_01_02");	//Значит, мои опасения были не напрасны...(обреченно) И теперь мы все в большой опасности!
	AI_Output(self,other,"DIA_NETBEK_TITANS_Sleeper_Find_01_03");	//Этот демон способен уничтожить наш мир даже без вмешательства Хранителей.
	AI_Output(self,other,"DIA_NETBEK_TITANS_Sleeper_Find_01_04");	//Мы должны что-то предпринять, пока не поздно.
	AI_Output(other,self,"DIA_NETBEK_TITANS_Sleeper_Find_01_05");	//Есть еще и другая проблема.
	AI_Output(other,self,"DIA_NETBEK_TITANS_Sleeper_Find_01_06");	//Я абсолютно беспомощен против магии Спящего!
	AI_Output(other,self,"DIA_NETBEK_TITANS_Sleeper_Find_01_07");	//Как только я приближаюсь к нему, то погружаюсь в глубокий сон.
	AI_Output(self,other,"DIA_NETBEK_TITANS_Sleeper_Find_01_08");	//Магия Спящего очень опасна! Ему даже не обязательно будет кромсать тебя на куски.
	AI_Output(self,other,"DIA_NETBEK_TITANS_Sleeper_Find_01_09");	//Достаточно будет того, что он просто сведет тебя с ума.
	AI_Output(other,self,"DIA_NETBEK_TITANS_Sleeper_Find_01_10");	//И как же мне быть?
	AI_Output(self,other,"DIA_NETBEK_TITANS_Sleeper_Find_01_11");	//Тебе нужен могущественный артефакт, способный защитить тебя от его ментальных щупалец.
	AI_Output(other,self,"DIA_NETBEK_TITANS_Sleeper_Find_01_12");	//А ты знаешь о таком?
	AI_Output(self,other,"DIA_NETBEK_TITANS_Sleeper_Find_01_13");	//К сожалению, нет. По всей видимости, о нем знает только тот, кому хорошо известна сама сущность демонов.
	AI_Output(other,self,"DIA_NETBEK_TITANS_Sleeper_Find_01_14");	//А что насчет твоего бога? Он мне ничем не сможет помочь?
	AI_Output(self,other,"DIA_NETBEK_TITANS_Sleeper_Find_01_15");	//Боюсь, что нет. Вряд ли его сил хватит на то, чтобы противостоять магии древнего демона.
	AI_Output(self,other,"DIA_NETBEK_TITANS_Sleeper_Find_01_16");	//Его дар - это прежде всего дар исцеления и жизни! Здесь он абсолютно бессилен.
	NeedDemonolog = TRUE;
	B_LogEntry(TOPIC_SLEEPERBACK,"Мне понадобится могущественный артефакт, чтобы противостоять магии Спящего. Но какой именно, знает лишь тот, кто хорошо разбирается в самой сущности демонов.");
};

instance DIA_NETBEK_TITANS_Sleeper_Dead(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 1;
	condition = DIA_NETBEK_TITANS_Sleeper_Dead_condition;
	information = DIA_NETBEK_TITANS_Sleeper_Dead_info;
	permanent = FALSE;
	description = "Спящий мертв!";
};

func int DIA_NETBEK_TITANS_Sleeper_Dead_condition()
{
	if(SleeperOldIsDead == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NETBEK_TITANS_Sleeper_Dead_info()
{
	B_GivePlayerXP(1500);
	AI_Output(other,self,"DIA_NETBEK_TITANS_Sleeper_Dead_01_01");	//Спящий мертв! 
	AI_Output(other,self,"DIA_NETBEK_TITANS_Sleeper_Dead_01_02");	//Я сразил злого демона, и больше он никогда не потревожит вас.
	AI_Output(self,other,"DIA_NETBEK_TITANS_Sleeper_Dead_01_03");	//Мне это уже известно. Я почувствовал это, как только ты убил его.
	AI_Output(self,other,"DIA_NETBEK_TITANS_Sleeper_Dead_01_04");	//Мои кошмары отступили и больше не беспокоят ни меня, ни остальных братьев.
	AI_Output(self,other,"DIA_NETBEK_TITANS_Sleeper_Dead_01_05");	//Я благодарю тебя за помощь в избавлении этого мира от огромного зла.
	AI_Output(self,other,"DIA_NETBEK_TITANS_Sleeper_Dead_01_06");	//Прими эту награду в качестве моей благодарности.
	Info_ClearChoices(DIA_NETBEK_TITANS_Sleeper_Dead);
	Info_AddChoice(DIA_NETBEK_TITANS_Sleeper_Dead,"И где она?",DIA_NETBEK_TITANS_Sleeper_Dead_Prize);
};

func void DIA_NETBEK_TITANS_Sleeper_Dead_Prize()
{
	AI_PlayAni(hero,"T_MAGRUN_2_HEASHOOT");
	AI_PlayAni(self,"T_PRACTICEMAGIC4");
	Wld_PlayEffect("SPELLFX_HEALSHRINE",hero,hero,0,0,0,FALSE);
	B_RaiseAttribute(hero,ATR_HITPOINTS_MAX,EligorPrice);
	Npc_ChangeAttribute(hero,ATR_HITPOINTS,ATR_HITPOINTS_MAX);
	AI_Wait(hero,1);
	AI_PlayAni(hero,"T_HEASHOOT_2_STAND");
	AI_Wait(hero,1);
	AI_Output(other,self,"DIA_NETBEK_TITANS_Sleeper_Dead_Prize_01_01");	//Что происходит?!
	AI_Output(self,other,"DIA_NETBEK_TITANS_Sleeper_Dead_Prize_01_02");	//Мой бог одарил тебя жизненной силой!
	AI_Output(self,other,"DIA_NETBEK_TITANS_Sleeper_Dead_Prize_01_03");	//Это поможет тебе в дальнейшем более уверенно противостоять врагам и угрозам этого мира.
	AI_Output(other,self,"DIA_NETBEK_TITANS_Sleeper_Dead_Prize_01_04");	//Благодарю! Знаешь, я даже как-то стал чувствовать себя лучше.
	AI_Output(self,other,"DIA_NETBEK_TITANS_Sleeper_Dead_Prize_01_05");	//(улыбаясь) Не сомневаюсь.
	Info_ClearChoices(DIA_NETBEK_TITANS_Sleeper_Dead);
};

instance DIA_NETBEK_LEADMESTEPONEDONE(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 1;
	condition = dia_netbek_leadmesteponedone_condition;
	information = dia_netbek_leadmesteponedone_info;
	permanent = FALSE;
	description = "Боги даровали мне свое могущество!";
};

func int dia_netbek_leadmesteponedone_condition()
{
	if(NETBEKLEADME_STEP1DONE == TRUE)
	{
		return TRUE;
	};
};

func void dia_netbek_leadmesteponedone_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Netbek_LeadMeStepOneDone_01_00");	//Боги даровали мне свое могущество!
	AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_02");	//Тогда пришло время подумать о твоем следующем шаге.
	AI_Output(other,self,"DIA_Netbek_LeadMeStepOneDone_01_03");	//Да, что насчет артефактов и магического оружия?
	AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_04");	//Хранители слишком могущественны, чтобы их можно было одолеть обычным клинком или магией.
	AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_05");	//Тут необходимо что-то особенное...
	AI_Output(other,self,"DIA_Netbek_LeadMeStepOneDone_01_06");	//Что ты имеешь в виду?
	AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_07");	//Вся сила Хранителей проистекает из магических сущностей элементов этого мира - Огня, Воды, Тьмы и Камня!
	AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_08");	//И только то оружие, которое наделено сразу всеми этими свойствами, будет способно поразить их.
	AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_09");	//Отыскать его вряд ли где-то получится. Но его можно будет создать. И я помогу тебе в этом.
	AI_Output(other,self,"DIA_Netbek_LeadMeStepOneDone_01_10");	//Тогда я весь во внимании.
	AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_11");	//Хорошо. Для начала тебе понадобятся артефакты, хранящие в себе чистейшую магию стихий.
	AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_12");	//Они могут быть заключены только в очень древних и могущественных существах этого мира.
	AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_13");	//Помнится, ты спрашивал о том, что за необычная магия защищает орков.
	AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_14");	//Так вот, те создания, порожденные магией Хранителей, вполне могут содержать в себе нужные нам предметы.
	AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_15");	//Только не спрашивай меня, где их искать. Этого я не знаю. И знать не могу.
	AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_16");	//Тебе придется найти их самому. Но я уверен, что это будет не сложно.
	AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_17");	//Особенно учитывая тот факт, что они уже наверняка собрали вокруг себя великое множество низших существ, порожденных их же собственной магией.
	AI_Output(other,self,"DIA_Netbek_LeadMeStepOneDone_01_18");	//Ладно, что дальше?
	ELEMTITANSINS = TRUE;

	if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_GUR) || (hero.guild == GIL_KDM))
	{
		AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_20");	//Поскольку ты маг, тебе наверняка будет проще обходиться с магической руной, нежели с мечом.
		AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_21");	//Однако для того, чтобы вложить в нее силу найденных тобой артефактов, тебе понадобится еще один редкий предмет.
		AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_23");	//Фокусирующий кристалл. Его еще называют юнитором.
		AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_24");	//Эти камни обладают практически всеми магическими свойствами, необходимыми для переноса энергии артефактов в твою руну.
		AI_Output(other,self,"DIA_Netbek_LeadMeStepOneDone_01_26");	//Где я смогу найти этот юнитор?
		AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_27");	//Насколько я помню, подобный предмет был когда-то у Юбериона - верховного гуру Братства.
		AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_29");	//Так что не исключено, что этот камень до сих пор остался в нашем старом лагере на болотах. Попробуй поискать его там.
		AI_Output(other,self,"DIA_Netbek_LeadMeStepOneDone_01_30");	//Боюсь, что твой совет мне не очень поможет, поскольку я отнес этот кристалл магам Воды.
		AI_Output(other,self,"DIA_Netbek_LeadMeStepOneDone_01_31");	//И недавно они использовали его для активации порталов в забытой части острова, Яркендаре.
		AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_32");	//Боюсь, в таком случае я ничем помочь не могу. Попробуй спросить у самих магов.
		AI_Output(other,self,"DIA_Netbek_LeadMeStepOneDone_01_34");	//Ладно. Я что-нибудь придумаю.
		AI_Output(other,self,"DIA_Netbek_LeadMeStepOneDone_01_35");	//Лучше расскажи мне, как перенести через него силу артефактов в руну.
		AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_36");	//Для этого ты должен будешь использовать рунический стол.
		AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_37");	//Помести камень в центр сферы и через юнитор сфокусируй на нем энергию каждого из элементов одновременно.
		AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_38");	//После этого сам рунный камень начнет светится ярким светом.
		AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_39");	//И чем больше он будет поглощать направленной на него энергии, тем сильнее будет становится это свечение.
		AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_40");	//В конце концов яркий свет резко пропадет - это будет означать, что руна полностью поглотила всю силу артефактов.
		AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_41");	//Ну, а все остальное уже будет зависеть только от тебя.
		AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_43");	//Битва с Хранителями обещает быть трудной, но будем надеяться, что у тебя все получится.
		B_LogEntry(TOPIC_GUARDIANS,"После того как я выполнил первое поручение Нетбека, он открыл мне секрет создания некоего магического оружия, коим я должен буду сразить Хранителей. И поскольку я маг, мне было бы проще управляться с ним как с магической руной, нежели как с мечом. Для всего этого мне понадобится найти несколько артефактов, сила которых придаст этому оружию небывалую мощь. По его словам, все эти предметы являются частью древнейших созданий, порожденных стихиями этого мира. Нетбек предположил, что те существа, которые защищают орков своей магией, вполне могут содержать в себе подобные артефакты. Искать их мне придется самому.");
		Log_AddEntry(TOPIC_GUARDIANS,"Когда сами артефакты окажутся у меня на руках, мне потребуется еще один предмет - фокусирующий камень-юнитор. С его помощью я смогу перенести энергию найденных мною этих артефактов в рунический камень. Сам же процесс создания этой магической руны довольно прост - достаточно лишь поместить ее в центр сферы на руническом столе и сфокусировать на ней через юнитор энергию всех предметов. После чего сама руна полностью поглотит эту энергию и я получу оружие, по своей силе не знающее себе равных в этом мире. Мне лишь останется отправиться в обитель Хранителей и сразиться с ними.");
		HOWCANMAKERUNE = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_45");	//Поскольку ты воин, тебе наверняка будет проще обходиться с мечом, нежели с магической руной.
		AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_46");	//Поэтому для начала тебе придется выковать особенный рудный клинок.
		AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_48");	//Но обычная магическая руда здесь не сгодится.
		AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_49");	//Для создания этого меча подойдет только очень редкая порода. А именно - черная руда.
		AI_Output(other,self,"DIA_Netbek_LeadMeStepOneDone_01_50");	//Черная руда? Да, ее действительно нелегко найти.
		AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_52");	//Каждый кусок этой породы настоящее сокровище, по своим магическим свойствам она намного превосходит обычную.
		AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_53");	//Тебе понадобится целых пять таких кусков для того, чтобы сковать свой меч.
		AI_Output(other,self,"DIA_Netbek_LeadMeStepOneDone_01_54");	//Ты не знаешь, где мне ее можно достать?
		AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_56");	//Честно говоря, нет. Тебе придется поискать ее самому.
		AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_58");	//Когда у тебя на руках будет этот меч, тебе будет нужно перенести в него энергию найденных тобой артефактов.
		AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_60");	//Уверен, что в этом тебе наверняка смогут помочь маги Огня.
		AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_61");	//Их могущества должно хватить, чтобы создать подобное заклинание.
		AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_62");	//Используй его, чтобы перенести силу артефактов в твой меч, и в итоге ты получишь оружие, сила которого не будет знать себе равных!
		AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_63");	//Ну, а все остальное будет уже зависеть только от тебя самого.
		AI_Output(self,other,"DIA_Netbek_LeadMeStepOneDone_01_64");	//Битва с Хранителями обещает быть трудной, но будем надеяться, что у тебя все получится.
		B_LogEntry(TOPIC_GUARDIANS,"После того как я выполнил первое поручение Нетбека, он открыл мне секрет создания некоего магического оружия, коим я должен буду сразить Хранителей. И поскольку я воин, мне было бы проще управляться с ним как с мечом, нежели как с магической руной. Для всего этого мне понадобится найти несколько артефактов, сила которых придаст этому оружию небывалую мощь. По его словам, все эти предметы являются частью древнейших созданий, порожденных стихиями этого мира. Нетбек предположил, что те существа, которые защищают орков своей магией, вполне могут содержать в себе подобные артефакты. Искать их мне придется самому.");
		Log_AddEntry(TOPIC_GUARDIANS,"Далее мне понадобится найти пять кусков черной руды для одноручного меча и десять кусков для двуручного, после чего я смогу сковать черный рудный меч. По словам Нетбека, любой кусок этой породы по своей сути является настоящим сокровищем, и найти ее будет крайне сложно. Когда же сам меч окажется у меня на руках, мне потребуется отыскать еще один предмет - заклинание, способное перенести в него всю энергию найденных мною артефактов. По словам Нетбека, в этом мне смогут помочь маги Огня. Использовав это заклинание, я получу оружие, по своей силе не знающее себе равных в этом мире. Мне лишь останется отправиться в обитель Хранителей и сразиться с ними.");
		HOWCANMAKEBLACKSWORD = TRUE;
	};

	NETBEKLEADME_STEP2 = TRUE;
	AI_StopProcessInfos(self);

	Wld_InsertNpc(Avatar_Water,"OW_ICEREGION_78");
	Wld_InsertNpc(Avatar_Fire,"URHAN_CHALANGE");
	Wld_InsertNpc(Avatar_Stone,"OW_ROCKDRAGON_11");

	Wld_InsertNpc(DMT_13004_STONEMAGE,"DM_RITUAL_04");
	Wld_InsertNpc(DMT_13005_STONEMAGE,"DM_RITUAL_05");
	Wld_InsertNpc(DMT_13006_STONEMAGE,"DM_RITUAL_06");
	Wld_InsertNpc(DMT_13007_FIREMAGE,"DM_RITUAL_07");
	Wld_InsertNpc(DMT_13008_FIREMAGE,"DM_RITUAL_08");
	Wld_InsertNpc(DMT_13009_FIREMAGE,"DM_RITUAL_09");
	Wld_InsertNpc(DMT_13010_WATERMAGE,"DM_RITUAL_10");
	Wld_InsertNpc(DMT_13011_WATERMAGE,"DM_RITUAL_11");
	Wld_InsertNpc(DMT_13012_WATERMAGE,"DM_RITUAL_12");

	//-------свита Аватара Воды--------------------------------

	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_67");
	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_66");
	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_65");
	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_109");
	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_101");
	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_102");
	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_103");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_20_01");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_20_03");
	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_95");
	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_96");
	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_97");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_18_02");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_18_03");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_18_01");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_17_01");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_17_02");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_17_03");
	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_93");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_16_01");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_16_02");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_16_03");
	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_91");
	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_92");
	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_89");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_15_01");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_15_02");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_15_03");
	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_86");
	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_87");
	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_88");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_14_03");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_14_02");
	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_77");
	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_78");
	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_79");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_13_05");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_14_01");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_13_04");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_13_01");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_13_02");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_13_03");
	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_72");
	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_73");
	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_74");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_12_01");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_12_02");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_12_03");
	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_69");
	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_70");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_33_02");
	Wld_InsertNpc(IceGolem,"FP_ROAM_OW_ICEREGION_33_01");
	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_63");
	Wld_InsertNpc(IceGolem,"FP_ROAM_DRACONIAN_64");

	//-------свита Аватара Воды--------------------------------


	//-------свита Аватара Огня--------------------------------

	Wld_InsertNpc(FireGolem,"CASTLE_35");
	Wld_InsertNpc(FireGolem,"CASTLE_30");
	Wld_InsertNpc(FireGolem,"FP_ROAM_DRACONIAN_150");
	Wld_InsertNpc(FireGolem,"FP_ROAM_DRACONIAN_149");
	Wld_InsertNpc(FireGolem,"FP_ROAM_DRACONIAN_144");
	Wld_InsertNpc(FireGolem,"FP_ROAM_DRACONIAN_145");
	Wld_InsertNpc(FireGolem,"FP_ROAM_DRACONIAN_146");
	Wld_InsertNpc(FireGolem,"CASTLE_22");
	Wld_InsertNpc(FireGolem,"FP_ROAM_DRACONIAN_142");
	Wld_InsertNpc(FireGolem,"FP_ROAM_DRACONIAN_143");
	Wld_InsertNpc(FireGolem,"FP_ROAM_DRACONIAN_141");
	Wld_InsertNpc(FireGolem,"FP_ROAM_DRACONIAN_139");
	Wld_InsertNpc(FireGolem,"FP_ROAM_DRACONIAN_140");
	Wld_InsertNpc(FireGolem,"FP_ROAM_DRACONIAN_136");
	Wld_InsertNpc(FireGolem,"FP_ROAM_DRACONIAN_137");
	Wld_InsertNpc(FireGolem,"FP_ROAM_DRACONIAN_138");
	Wld_InsertNpc(FireGolem,"FP_ROAM_DRACONIAN_133");
	Wld_InsertNpc(FireGolem,"FP_ROAM_DRACONIAN_134");
	Wld_InsertNpc(FireGolem,"FP_ROAM_DRACONIAN_135");
	Wld_InsertNpc(FireGolem,"CASTLE_12");
	Wld_InsertNpc(FireGolem,"FP_ROAM_DRACONIAN_132");
	Wld_InsertNpc(FireGolem,"CASTLE_32");
	Wld_InsertNpc(FireGolem,"CASTLE_33");
	Wld_InsertNpc(FireGolem,"CASTLE_34");

	//-------свита Аватара Огня--------------------------------


	//-------свита Аватара Скалы--------------------------------

	Wld_InsertNpc(WindGolem,"OW_ROCKDRAGON_05");
	Wld_InsertNpc(StoneGolem,"OW_ROCKDRAGON_06");
	Wld_InsertNpc(WindGolem,"OW_ROCKDRAGON_04");
	Wld_InsertNpc(StoneGolem,"FP_ROAM_DRACONIAN_181");
	Wld_InsertNpc(StoneGolem,"FP_ROAM_DRACONIAN_188");
	Wld_InsertNpc(StoneGolem,"FP_ROAM_DRACONIAN_182");
	Wld_InsertNpc(StoneGolem,"FP_ROAM_DRACONIAN_180");
	Wld_InsertNpc(StoneGolem,"OW_ROCKDRAGON_02");
	Wld_InsertNpc(StoneGolem,"FP_ROAM_DRACONIAN_179");
	Wld_InsertNpc(StoneGolem,"FP_ROAM_DRACONIAN_176");
	Wld_InsertNpc(StoneGolem,"FP_ROAM_DRACONIAN_177");
	Wld_InsertNpc(StoneGolem,"FP_ROAM_DRACONIAN_178");
	Wld_InsertNpc(StoneGolem,"OW_ROCKDRAGON_03");
	Wld_InsertNpc(StoneGolem,"FP_ROAM_DRACONIAN_183");
	Wld_InsertNpc(StoneGolem,"FP_ROAM_DRACONIAN_187");
	Wld_InsertNpc(StoneGolem,"OW_ROCKDRAGON_15");
	Wld_InsertNpc(StoneGolem,"FP_ROAM_DRACONIAN_186");
	Wld_InsertNpc(WindGolem,"FP_ROAM_DRACONIAN_184");

	//-------свита Аватара Скалы--------------------------------
};

instance DIA_NETBEK_MAKEBLACKSWORD(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 2;
	condition = dia_netbek_makeblacksword_condition;
	information = dia_netbek_makeblacksword_info;
	permanent = FALSE;
	description = "А как мне выковать этот меч из черной руды?";
};

func int dia_netbek_makeblacksword_condition()
{
	if((NETBEKLEADME_STEP2 == TRUE) && (NETBEKLEADME_STEP2DONE == FALSE) && (HOWCANMAKEBLACKSWORD == TRUE))
	{
		return TRUE;
	};
};

func void dia_netbek_makeblacksword_info()
{
	AI_Output(other,self,"DIA_Netbek_MakeBlackSword_01_00");	//Как мне выковать этот меч из черной руды?
	AI_Output(self,other,"DIA_Netbek_MakeBlackSword_01_01");	//Так же, как и обычный рудный клинок.
	AI_Output(self,other,"DIA_Netbek_MakeBlackSword_01_02");	//Однако если ты не знаешь, как это сделать... То тогда Дарион, наш кузнец, сможет тебя этому обучить. Поговори с ним.
};

instance DIA_NETBEK_GUARDDEFEAT(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 1;
	condition = dia_netbek_guarddefeat_condition;
	information = dia_netbek_guarddefeat_info;
	permanent = FALSE;
	description = "Я уничтожил Хранителей!";
};

func int dia_netbek_guarddefeat_condition()
{
	if(ALLGUARDIANSKILLED == TRUE)
	{
		return TRUE;
	};
};

func void dia_netbek_guarddefeat_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_Netbek_GuardDefeat_01_00");	//Я уничтожил Хранителей! Нам больше ничто не угрожает.
	AI_Output(self,other,"DIA_Netbek_GuardDefeat_01_01");	//Хорошо. Хотя, по правде говоря, я с самого начала был уверен в том, что у тебя получится это сделать.
	AI_Output(self,other,"DIA_Netbek_GuardDefeat_01_02");	//Ведь не случайно выбор богов пал именно на тебя. В итоге ты же сам это и доказал.
};

instance DIA_NETBEK_CALMYOU(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 1;
	condition = dia_netbek_calmyou_condition;
	information = dia_netbek_calmyou_info;
	permanent = FALSE;
	description = "Твое спокойствие впечатляет.";
};

func int dia_netbek_calmyou_condition()
{
	if(Npc_KnowsInfo(hero,dia_netbek_guarddefeat))
	{
		return TRUE;
	};
};

func void dia_netbek_calmyou_info()
{
	AI_Output(other,self,"DIA_Netbek_CalmYou_01_01");	//Твое спокойствие впечатляет.
	AI_Output(self,other,"DIA_Netbek_CalmYou_01_02");	//Что ты хочешь этим сказать?
	AI_Output(other,self,"DIA_Netbek_CalmYou_01_03");	//Ты ведешь себя так, как будто за последнее дни ничего и вовсе не происходило.
	AI_Output(self,other,"DIA_Netbek_CalmYou_01_05");	//Этому меня учит мой бог.
	AI_Output(self,other,"DIA_Netbek_CalmYou_01_06");	//Его мудрость помогает мне познать истинный смысл и понимание различных вещей в этом мире. Все это касается и их восприятия.
	AI_Output(self,other,"DIA_Netbek_CalmYou_01_07");	//К тому же благодаря тебе наш главный враг уже побежден. А значит, и нет причин для особого беспокойства.
	AI_Output(self,other,"DIA_Netbek_CalmYou_01_09");	//Уверен, ты и с орками справишься. Тем более теперь, когда они утратили помощь со стороны Хранителей.
	AI_Output(other,self,"DIA_Netbek_CalmYou_01_11");	//Надеюсь, ты прав.
};

instance DIA_NETBEK_DRUID(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 1;
	condition = dia_netbek_DRUID_condition;
	information = dia_netbek_DRUID_info;
	permanent = FALSE;
	description = "Ты ведь друид, не так ли?";
};

func int dia_netbek_DRUID_condition()
{
	if((NetBekIsDruid == TRUE) && (XarDruid == TRUE) && (RootIsUp == FALSE))
	{
		return TRUE;
	};
};

func void dia_netbek_DRUID_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Netbek_DRUID_01_01");	//Ты ведь друид, не так ли?
	AI_Output(self,other,"DIA_Netbek_DRUID_01_02");	//Что ты подразумеваешь под этим словом?
	AI_Output(other,self,"DIA_Netbek_DRUID_01_03");	//Ну, ты говоришь с деревьями и используешь их магическую силу.
	AI_Output(other,self,"DIA_Netbek_DRUID_01_04");	//Насколько я знаю, это умеют только друиды.
	AI_Output(self,other,"DIA_Netbek_DRUID_01_05");	//Ну, если так, - значит, ты прав. Я друид.
	AI_Output(other,self,"DIA_Netbek_DRUID_01_06");	//Тогда мне нужна твоя помощь.
	AI_Output(self,other,"DIA_Netbek_DRUID_01_07");	//Хорошо. Чем я могу тебе помочь?
	AI_Output(other,self,"DIA_Netbek_DRUID_01_08");	//Мне необходимо вернуть к жизни одно древо. И, боюсь, без твоей помощи мне никак этого не сделать.
	AI_Output(self,other,"DIA_Netbek_DRUID_01_09");	//Это благое дело. Безусловно, я помогу тебе в этом. Подожди минутку...
	AI_PlayAni(self,"T_PRACTICEMAGIC4");
	AI_Output(self,other,"DIA_Netbek_DRUID_01_10");	//Вот, возьми это корень. С его помощью ты вдохнешь в мертвую древесную плоть новую жизнь.
	B_GiveInvItems(self,other,ItPl_MagicRoot,1);
	AI_Output(other,self,"DIA_Netbek_DRUID_01_11");	//Вот так просто?
	AI_Output(self,other,"DIA_Netbek_DRUID_01_12");	//А ты хочешь что-то посложней? Если так, тогда тебе лучше обратиться к кому-нибудь другому.
	AI_Output(other,self,"DIA_Netbek_DRUID_01_13");	//Нет, меня все устраивает.
	AI_Output(self,other,"DIA_Netbek_DRUID_01_14");	//Тогда зачем все эти вопросы?
	AI_Output(other,self,"DIA_Netbek_DRUID_01_15");	//Ах, не бери в голову!
	B_LogEntry(TOPIC_AdanosCrone,"Все оказалось куда проще. Я попросил Нетбека о помощи и тот дал мне магическое растение, способное вернуть великое древо к жизни.");
	RootIsUp = TRUE;
};

instance DIA_NETBEK_DRUID_TEACH(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 1;
	condition = dia_netbek_DRUID_TEACH_condition;
	information = dia_netbek_DRUID_TEACH_info;
	permanent = FALSE;
	description = "А ты можешь научить меня делать эти камни?";
};

func int dia_netbek_DRUID_TEACH_condition()
{
	if((NETBEK_HALLO4 == TRUE) && ((other.guild == GIL_KDF) || (other.guild == GIL_KDW) || (other.guild == GIL_KDM) || (other.guild == GIL_GUR) || (other.guild == GIL_NDW) || (other.guild == GIL_NDM) || (other.guild == GIL_NOV)))
	{
		return TRUE;
	};
};

func void dia_netbek_DRUID_TEACH_info()
{
	AI_Output(other,self,"DIA_Netbek_DRUID_TEACH_01_01");	//А ты можешь научить меня делать эти камни?
	AI_Output(self,other,"DIA_Netbek_DRUID_TEACH_01_02");	//Хммм... Почему бы и нет.
	AI_Output(self,other,"DIA_Netbek_DRUID_TEACH_01_03");	//Однако тебе необходим некоторый опыт и знание магических кругов, чтобы овладеть этими знаниями.
	AI_Output(self,other,"DIA_Netbek_DRUID_TEACH_01_04");	//И, разумеется, рунный стол, чтобы изготовить эти камни.
	Netbek_TeachRunes = TRUE;
	Log_CreateTopic(TOPIC_NetbekTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_NetbekTeacher,"Нетбек может научить меня созданию камней трансформации для превращения в различных животных.");
};

instance DIA_Netbek_Runen(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 99;
	condition = DIA_Netbek_Runen_Condition;
	information = DIA_Netbek_Runen_Info;
	permanent = TRUE;
	description = "Научи меня создавать камни трансформации.";
};

func int DIA_Netbek_Runen_Condition()
{
	if((Netbek_TeachRunes == TRUE) && (HeroKnownTrans_Troll == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Netbek_Runen_Info()
{
	AI_Output(other,self,"DIA_Parlan_TEACH_15_00");	//Обучи меня!
	Info_ClearChoices(DIA_Netbek_Runen);
	Info_AddChoice(DIA_Netbek_Runen,Dialog_Back,DIA_Netbek_Runen_BACK);

	if(HeroKnownTrans_BloodFly == FALSE)
	{
		Info_AddChoice(DIA_Netbek_Runen,"Превращение в кровяного шершня (Очки обучения: 1)",DIA_Netbek_Runen_BloodFly);
	};
	if((HeroKnownTrans_FireWaran == FALSE) && (HeroKnownTrans_BloodFly == TRUE))
	{
		Info_AddChoice(DIA_Netbek_Runen,"Превращение в огненного варана (Очки обучения: 2)",DIA_Netbek_Runen_FireWaran);
	};
	if((HeroKnownTrans_Warg == FALSE) && (HeroKnownTrans_FireWaran == TRUE))
	{
		Info_AddChoice(DIA_Netbek_Runen,"Превращение в варга (Очки обучения: 4)",DIA_Netbek_Runen_Warg);
	};
	if((HeroKnownTrans_ShadowBeast == FALSE) && (HeroKnownTrans_Warg == TRUE))
	{
		Info_AddChoice(DIA_Netbek_Runen,"Превращение в мракориса (Очки обучения: 6)",DIA_Netbek_Runen_ShadowBeast);
	};
	if((HeroKnownTrans_DragonSnapper == FALSE) && (HeroKnownTrans_ShadowBeast == TRUE))
	{
		Info_AddChoice(DIA_Netbek_Runen,"Превращение в драконьего снеппера (Очки обучения: 8)",DIA_Netbek_Runen_DragonSnapper);
	};
	//if((HeroKnownTrans_Troll == FALSE) && (HeroKnownTrans_DragonSnapper == TRUE))
	//{
	//	Info_AddChoice(DIA_Netbek_Runen,"Превращение в тролля (Очки обучения: 10)",DIA_Netbek_Runen_Troll);
	//};
};

func void DIA_Netbek_Runen_BACK()
{
	Info_ClearChoices(DIA_Netbek_Runen);
};

func void DIA_Netbek_Runen_BloodFly()
{
	if(hero.lp < 1)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	}
	else
	{
		hero.lp = hero.lp - 1;
		RankPoints = RankPoints + 1;
		AI_Print("Обучение: Камни трансформации");
		HeroKnownTrans_BloodFly = TRUE;
		Snd_Play("LevelUP");
		B_LogEntry(TOPIC_NetbekTeacher,"Для изготовления камня трансформации в кровяного шершня необходимо иметь: рунный камень, крылья, смолу и аквамарин.");

		if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR) || (hero.guild == GIL_NDM) || (hero.guild == GIL_NDW) || (hero.guild == GIL_NOV))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(hero,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
		};

	};
};

func void DIA_Netbek_Runen_FireWaran()
{
	if(hero.lp < 2)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	}
	else
	{
		hero.lp = hero.lp - 2;
		RankPoints = RankPoints + 2;
		AI_Print("Обучение: Камни трансформации");
		HeroKnownTrans_FireWaran = TRUE;
		Snd_Play("LevelUP");
		B_LogEntry(TOPIC_NetbekTeacher,"Для изготовления камня трансформации в огненного варана необходимо иметь: рунный камень, огненный язык, серу и шкуру рептилии.");

		if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR) || (hero.guild == GIL_NDM) || (hero.guild == GIL_NDW) || (hero.guild == GIL_NOV))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(hero,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
		};
	};
};

func void DIA_Netbek_Runen_Warg()
{
	if(hero.lp < 4)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	}
	else
	{
		hero.lp = hero.lp - 4;
		RankPoints = RankPoints + 4;
		AI_Print("Обучение: Камни трансформации");
		HeroKnownTrans_Warg = TRUE;
		Snd_Play("LevelUP");
		B_LogEntry(TOPIC_NetbekTeacher,"Для изготовления камня трансформации в варга необходимо иметь: рунный камень, два клыка, черный жемчуг и шкуру варга.");

		if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR) || (hero.guild == GIL_NDM) || (hero.guild == GIL_NDW) || (hero.guild == GIL_NOV))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(hero,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
		};
	};
};

func void DIA_Netbek_Runen_ShadowBeast()
{
	if(hero.lp < 6)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	}
	else
	{
		hero.lp = hero.lp - 6;
		RankPoints = RankPoints + 6;
		AI_Print("Обучение: Камни трансформации");
		HeroKnownTrans_ShadowBeast = TRUE;
		Snd_Play("LevelUP");
		B_LogEntry(TOPIC_NetbekTeacher,"Для изготовления камня трансформации в мракориса необходимо иметь: рунный камень, уголь, рог и шкуру мракориса.");

		if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR) || (hero.guild == GIL_NDM) || (hero.guild == GIL_NDW) || (hero.guild == GIL_NOV))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(hero,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
		};
	};
};

func void DIA_Netbek_Runen_DragonSnapper()
{
	if(hero.lp < 8)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	}
	else
	{
		hero.lp = hero.lp - 8;
		RankPoints = RankPoints + 8;
		AI_Print("Обучение: Камни трансформации");
		HeroKnownTrans_DragonSnapper = TRUE;
		Snd_Play("LevelUP");
		B_LogEntry(TOPIC_NetbekTeacher,"Для изготовления камня трансформации в драконьего снеппера необходимо иметь: рунный камень, рог драконьего снеппера, ледяной кварц и кусок магической руды.");

		if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR) || (hero.guild == GIL_NDM) || (hero.guild == GIL_NDW) || (hero.guild == GIL_NOV))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(hero,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
		};
	};
};

func void DIA_Netbek_Runen_Troll()
{
	if(hero.lp < 10)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	}
	else
	{
		hero.lp = hero.lp - 10;
		RankPoints = RankPoints + 10;
		AI_Print("Обучение: Камни трансформации");
		HeroKnownTrans_Troll = TRUE;
		Snd_Play("LevelUP");
		B_LogEntry(TOPIC_NetbekTeacher,"Для изготовления камня трансформации в тролля необходимо иметь: рунный камень, два клыка тролля, смолу, серу и шкуру тролля.");


		if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR) || (hero.guild == GIL_NDM) || (hero.guild == GIL_NDW) || (hero.guild == GIL_NOV))
		{
			ATR_INTELLECT += 1;
			Npc_SetTalentSkill(hero,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
		};
	};
};

instance DIA_Netbek_Trade(C_Info)
{
	npc = xbs_7507_netbek;
	nr = 99;
	condition = DIA_Netbek_Trade_condition;
	information = DIA_Netbek_Trade_info;
	trade = TRUE;
	permanent = TRUE;
	description = "Покажи мне свои магические свитки.";
};

func int DIA_Netbek_Trade_condition()
{
	if((CHOOSESTONE == TRUE) && (other.guild != GIL_GUR))
	{
		if((other.guild == GIL_KDW) || (other.guild == GIL_KDF) || (other.guild == GIL_KDM))
		{
			return TRUE;
		};
	};
};

func void DIA_Netbek_Trade_info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_BaalTyon_Trade_01_01");	//Покажи мне свои магические свитки.
	B_GiveTradeInv(self);
};
