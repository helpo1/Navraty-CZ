
instance DIA_Addon_Rhademes_EXIT(C_Info)
{
	npc = NONE_ADDON_112_Rhademes;
	nr = 999;
	condition = DIA_Addon_Rhademes_EXIT_Condition;
	information = DIA_Addon_Rhademes_EXIT_Info;
	permanent = TRUE;
	description = "Я сам найду путь туда!";
};


func int DIA_Addon_Rhademes_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Rhademes_EXIT_Info()
{
	AI_Output(other,self,"DIA_Addon_Rhademes_EXIT_15_00");	//Я сам найду путь!
	AI_Output(self,other,"DIA_Addon_Rhademes_EXIT_03_01");	//Как пожелаешь...
	AI_StopProcessInfos(self);
};


var int Rhademes_Understood;

instance DIA_Addon_Rhademes_First(C_Info)
{
	npc = NONE_ADDON_112_Rhademes;
	nr = 1;
	condition = DIA_Addon_Rhademes_First_Condition;
	information = DIA_Addon_Rhademes_First_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Rhademes_First_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Rhademes_Understood == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Rhademes_First_Info()
{
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Rhademes_First_03_00");	//Мой дух был заперт здесь целую вечность.
		AI_Output(self,other,"DIA_Addon_Rhademes_First_03_01");	//Теперь я наконец-то свободен. У меча новый хозяин!
		AI_Output(self,other,"DIA_Addon_Rhademes_First_03_02");	//Проход в последний зал открыт.
		AI_Output(other,self,"DIA_Addon_Rhademes_First_15_03");	//Но ворота закрыты!
		AI_Output(self,other,"DIA_Addon_Rhademes_First_03_04");	//Эти ворота не ведут в последний зал.
		AI_Output(self,other,"DIA_Addon_Rhademes_First_03_05");	//Они ведут в небольшой вестибюль.
		AI_Output(self,other,"DIA_Addon_Rhademes_First_03_06");	//Владелец меча... закрыл их за собой.
		Rhademes_Understood = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Rhademes_First_03_07");	//Ганима эн кандра Аданос?
		B_Say(other,self,"$CANTUNDERSTANDTHIS");
		AI_Output(self,other,"DIA_Addon_Rhademes_First_03_08");	//Бенгла антани!
		AI_StopProcessInfos(self);
	};
};


instance DIA_Addon_Rhademes_Pforte(C_Info)
{
	npc = NONE_ADDON_112_Rhademes;
	nr = 2;
	condition = DIA_Addon_Rhademes_Pforte_Condition;
	information = DIA_Addon_Rhademes_Pforte_Info;
	permanent = FALSE;
	description = "Как открыть ворота?";
};


func int DIA_Addon_Rhademes_Pforte_Condition()
{
	return TRUE;
};

func void DIA_Addon_Rhademes_Pforte_Info()
{
	AI_Output(other,self,"DIA_Addon_Rhademes_Pforte_15_00");	//Как открыть ворота?
	AI_Output(self,other,"DIA_Addon_Rhademes_Pforte_03_01");	//Потяни... за один из рычагов.
	AI_Output(other,self,"DIA_Addon_Rhademes_Pforte_15_02");	//Любой?
	AI_Output(self,other,"DIA_Addon_Rhademes_Pforte_03_03");	//Да. Любой из них открывает ворота.
};


instance DIA_Addon_Rhademes_Hebel(C_Info)
{
	npc = NONE_ADDON_112_Rhademes;
	nr = 3;
	condition = DIA_Addon_Rhademes_Hebel_Condition;
	information = DIA_Addon_Rhademes_Hebel_Info;
	permanent = FALSE;
	description = "Но не все активируют ловушку, верно?";
};


func int DIA_Addon_Rhademes_Hebel_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Rhademes_Pforte) && !Npc_KnowsInfo(other,DIA_Addon_Rhademes_DeinVater))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Rhademes_Hebel_Info()
{
	AI_Output(other,self,"DIA_Addon_Rhademes_Hebel_15_00");	//Но не все активируют ловушку, верно?
	AI_Output(self,other,"DIA_Addon_Rhademes_Hebel_03_01");	//Все!
};


instance DIA_Addon_Rhademes_DontBelieve(C_Info)
{
	npc = NONE_ADDON_112_Rhademes;
	nr = 4;
	condition = DIA_Addon_Rhademes_DontBelieve_Condition;
	information = DIA_Addon_Rhademes_DontBelieve_Info;
	permanent = FALSE;
	description = "Я не верю тебе!";
};


func int DIA_Addon_Rhademes_DontBelieve_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Rhademes_Pforte) && !Npc_KnowsInfo(other,DIA_Addon_Rhademes_DeinVater))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Rhademes_DontBelieve_Info()
{
	AI_Output(other,self,"DIA_Addon_Rhademes_DontBelieve_15_00");	//Я не верю тебе!
	AI_Output(self,other,"DIA_Addon_Rhademes_DontBelieve_03_01");	//И все же я говорю правду.
};


instance DIA_Addon_Rhademes_DeinVater(C_Info)
{
	npc = NONE_ADDON_112_Rhademes;
	nr = 5;
	condition = DIA_Addon_Rhademes_DeinVater_Condition;
	information = DIA_Addon_Rhademes_DeinVater_Info;
	permanent = FALSE;
	description = "Твой отец создал эту ловушку. Откуда тебе знать, как она работает?!";
};


func int DIA_Addon_Rhademes_DeinVater_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Rhademes_Pforte) && (Npc_HasItems(other,ItMi_Addon_Stone_04) >= 1))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Rhademes_DeinVater_Info()
{
	AI_Output(other,self,"DIA_Addon_Rhademes_DeinVater_15_00");	//Твой отец создал эту ловушку. Откуда тебе знать, как она работает?!
	AI_Output(self,other,"DIA_Addon_Rhademes_DeinVater_03_01");	//Куарходрон! Я все еще помню стук молотков... на другой стороне ворот... спустя столько времени...
	AI_Output(self,other,"DIA_Addon_Rhademes_DeinVater_03_02");	//Меч... отомстил мне... за то, что я не справился...
	AI_Output(other,self,"DIA_Addon_Rhademes_DeinVater_15_03");	//Ты помнишь, какой из рычагов - правильный?
	AI_Output(self,other,"DIA_Addon_Rhademes_DeinVater_03_04");	//Я давно все забыл.
	Info_ClearChoices(DIA_Addon_Rhademes_DeinVater);
	Info_AddChoice(DIA_Addon_Rhademes_DeinVater,"Тогда попробуй догадаться!",DIA_Addon_Rhademes_DeinVater_Guess);
	Info_AddChoice(DIA_Addon_Rhademes_DeinVater,"Вспоминай!",DIA_Addon_Rhademes_DeinVater_Remember);
	Info_AddChoice(DIA_Addon_Rhademes_DeinVater,"Думай!",DIA_Addon_Rhademes_DeinVater_Think);
};


var int Rhademes_fertig;

func void B_Addon_Rhademes_Lever(var int Choice)
{
	AI_Output(self,other,"DIA_Addon_Rhademes_Lever_03_00");	//Это было так давно...
	AI_StopProcessInfos(self);
	if(Choice <= 1)
	{
		AI_GotoWP(self,"ADW_ADANOSTEMPEL_RHADEMES_04");
	}
	else if(Choice == 2)
	{
		AI_GotoWP(self,"ADW_ADANOSTEMPEL_RHADEMES_04");
	}
	else
	{
		AI_GotoWP(self,"ADW_ADANOSTEMPEL_RHADEMES_04");
	};
	AI_UseMob(self,"LEVER",1);
	Rhademes_fertig = TRUE;
};

func void DIA_Addon_Rhademes_DeinVater_Think()
{
	AI_Output(other,self,"DIA_Addon_Rhademes_DeinVater_Think_15_00");	//Думай!
	B_Addon_Rhademes_Lever(1);
};

func void DIA_Addon_Rhademes_DeinVater_Remember()
{
	AI_Output(other,self,"DIA_Addon_Rhademes_DeinVater_Remember_15_00");	//Вспоминай!
	B_Addon_Rhademes_Lever(2);
};

func void DIA_Addon_Rhademes_DeinVater_Guess()
{
	AI_Output(other,self,"DIA_Addon_Rhademes_DeinVater_Guess_15_00");	//Тогда попробуй догадаться!
	B_Addon_Rhademes_Lever(3);
};


instance DIA_Addon_Rhademes_PERM(C_Info)
{
	npc = NONE_ADDON_112_Rhademes;
	nr = 2;
	condition = DIA_Addon_Rhademes_PERM_Condition;
	information = DIA_Addon_Rhademes_PERM_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Rhademes_PERM_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Rhademes_fertig == TRUE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Rhademes_PERM_Info()
{
	AI_Output(self,other,"DIA_Addon_Rhademes_PERM_03_00");	//Если ты обладаешь силой... утопи ее... в глубинах моря...
	SC_TookRhademesTrap = TRUE;
	SC_TalkedToRhademAfter = TRUE;
	AI_StopProcessInfos(self);
};

//---------------------------------Радамес новый---------------------


instance DIA_NONE_ADDON_1159_Rhademes_EXIT(C_Info)
{
	npc = NONE_ADDON_1159_Rhademes;
	nr = 999;
	condition = DIA_NONE_ADDON_1159_Rhademes_EXIT_Condition;
	information = DIA_NONE_ADDON_1159_Rhademes_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_NONE_ADDON_1159_Rhademes_EXIT_Condition()
{
	return TRUE;
};

func void DIA_NONE_ADDON_1159_Rhademes_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_NONE_ADDON_1159_Rhademes_Why(C_Info)
{
	npc = NONE_ADDON_1159_Rhademes;
	nr = 4;
	condition = DIA_NONE_ADDON_1159_Rhademes_Why_Condition;
	information = DIA_NONE_ADDON_1159_Rhademes_Why_Info;
	permanent = FALSE;
	description = "Радамес? Что ты тут делаешь?";
};

func int DIA_NONE_ADDON_1159_Rhademes_Why_Condition()
{
	return TRUE;
};

func void DIA_NONE_ADDON_1159_Rhademes_Why_Info()
{
	AI_Output(other,self,"DIA_NONE_ADDON_1159_Rhademes_Why_01_00");	//Радемес? Что ты тут делаешь?
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_Why_01_01");	//(холодно) Я пришел сюда поговорить с Аш'Таром.
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_Why_01_02");	//Мой дух все еще не может найти путь в мир предков.
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_Why_01_03");	//Возможно, он сможет помочь мне.

	if(DragonGoldIsDead == TRUE)
	{
		AI_Output(other,self,"DIA_NONE_ADDON_1159_Rhademes_Why_01_04");	//Но Аш'Тар мертв!
		AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_Why_01_05");	//Я вижу. И от этого моя душа еще больше наполняется печалью.
		AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_Why_01_06");	//По всей видимости, мне никогда не будет покоя в этом мире.
	};
};

instance DIA_NONE_ADDON_1159_Rhademes_Father(C_Info)
{
	npc = NONE_ADDON_1159_Rhademes;
	nr = 4;
	condition = DIA_NONE_ADDON_1159_Rhademes_Father_Condition;
	information = DIA_NONE_ADDON_1159_Rhademes_Father_Info;
	permanent = FALSE;
	description = "Где твой отец?";
};

func int DIA_NONE_ADDON_1159_Rhademes_Father_Condition()
{
	if((MIS_JarCurse == LOG_Running) && (Npc_KnowsInfo(other,DIA_NONE_ADDON_1159_Rhademes_Why) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_ADDON_1159_Rhademes_Father_Info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_NONE_ADDON_1159_Rhademes_Father_01_00");	//Где твой отец?
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_Father_01_01");	//Куарходрон? А почему ты спрашиваешь?
	AI_Output(other,self,"DIA_NONE_ADDON_1159_Rhademes_Father_01_02");	//Если ты не заметил, весь Яркендар заполонила нежить!
	AI_Output(other,self,"DIA_NONE_ADDON_1159_Rhademes_Father_01_03");	//И угрожает она уже не только ему, но и другим частям острова.
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_Father_01_04");	//Темные времена наступили для этого мира...
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_Father_01_05");	//Дети Аданоса более не могут смотреть на то, как живые разрушают их святыни и оскверняют древние храмы наших предков.
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_Father_01_06");	//Поэтому они восстали, дабы отомстить им. И они уничтожат всех, кто посмеет противиться воле Аданоса.
	AI_Output(other,self,"DIA_NONE_ADDON_1159_Rhademes_Father_01_07");	//Я сомневаюсь, что к этому причастен Аданос.
	AI_Output(other,self,"DIA_NONE_ADDON_1159_Rhademes_Father_01_08");	//Скорее всего, они подчиняются злой воле какого-нибудь демона или, может, даже самому Белиару.
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_Father_01_09");	//Ты многого не знаешь, человек...(холодно) Но именно так сказал мой отец.
	AI_Output(other,self,"DIA_NONE_ADDON_1159_Rhademes_Father_01_10");	//Интересно, а какое он имеет отношение ко всему этому?
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_Father_01_11");	//Именно мой отец призвал к себе своих братьев, дабы они помогли ему свершить суд Аданоса.
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_Father_01_12");	//Когда-то он был великим полководцем моего народа. Многие помнят его, и готовы служить ему даже после смерти.
	AI_Output(other,self,"DIA_NONE_ADDON_1159_Rhademes_Father_01_13");	//Так, значит, виной всех бед является Куарходрон?! Кто бы мог подумать...
	B_LogEntry(TOPIC_JarCurse,"Я встретил Радемеса недалеко от храма Аш'Тара. Похоже, слова Сатураса о том, что осквернение святынь Древних имели далеко идущие последствия, недалеки от правды. И именно его отец, Куарходрон, великий военачальник Зодчих, поднял на бой своих братьев, дабы отомстить живым за их святотатство.");
};

instance DIA_NONE_ADDON_1159_Rhademes_SeekFath(C_Info)
{
	npc = NONE_ADDON_1159_Rhademes;
	nr = 4;
	condition = DIA_NONE_ADDON_1159_Rhademes_SeekFath_Condition;
	information = DIA_NONE_ADDON_1159_Rhademes_SeekFath_Info;
	permanent = FALSE;
	description = "И все-таки где мне найти его?";
};

func int DIA_NONE_ADDON_1159_Rhademes_SeekFath_Condition()
{
	if((MIS_JarCurse == LOG_Running) && (Npc_KnowsInfo(other,DIA_NONE_ADDON_1159_Rhademes_Father) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_ADDON_1159_Rhademes_SeekFath_Info()
{
	AI_Output(other,self,"DIA_NONE_ADDON_1159_Rhademes_SeekFath_01_00");	//И все-таки где мне найти его?
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_SeekFath_01_01");	//Он сейчас там, где когда-то произошла великая битва Кхар Арам.
	AI_Output(other,self,"DIA_NONE_ADDON_1159_Rhademes_SeekFath_01_02");	//Звучит здорово. Но если быть чуточку точнее?
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_SeekFath_01_03");	//Извини, но я уже не помню, где находится это место.
	AI_Output(other,self,"DIA_NONE_ADDON_1159_Rhademes_SeekFath_01_04");	//Все это очень плохо.
	B_LogEntry(TOPIC_JarCurse,"На вопрос, где сейчас находится Куарходрон, Радемес упомянул место, где когда-то произошла великая битва Кхар Арам. Однако сам он уже не помнит, где точно оно находится.");		
};

instance DIA_NONE_ADDON_1159_Rhademes_Near(C_Info)
{
	npc = NONE_ADDON_1159_Rhademes;
	nr = 4;
	condition = DIA_NONE_ADDON_1159_Rhademes_Near_Condition;
	information = DIA_NONE_ADDON_1159_Rhademes_Near_Info;
	permanent = FALSE;
	description = "А почему ты сейчас не рядом с ним?";
};

func int DIA_NONE_ADDON_1159_Rhademes_Near_Condition()
{
	if((MIS_JarCurse == LOG_Running) && (Npc_KnowsInfo(other,DIA_NONE_ADDON_1159_Rhademes_Father) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_ADDON_1159_Rhademes_Near_Info()
{
	AI_Output(other,self,"DIA_NONE_ADDON_1159_Rhademes_Near_01_00");	//А почему ты сейчас не рядом с ним?
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_Near_01_01");	//(холодно) Я не могу просто так вернутся к своему отцу...
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_Near_01_02");	//Он проклял меня за то, что я тогда натворил. И с тех пор мой отец больше не желает меня видеть.
	AI_Output(other,self,"DIA_NONE_ADDON_1159_Rhademes_Near_01_03");	//Неужели за все это время он тебя так и не простил?
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_Near_01_04");	//Этого я не знаю. Я не разговаривал с ним уже на протяжении многих столетий.
	AI_Output(other,self,"DIA_NONE_ADDON_1159_Rhademes_Near_01_05");	//Тогда, может, стоит попробовать?
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_Near_01_06");	//Я уже много раз думал об этом. Но захочет ли он меня слушать?
	AI_Output(other,self,"DIA_NONE_ADDON_1159_Rhademes_Near_01_07");	//Ну, по крайне мере, это будет лучше, чем без конца теряться в догадках.
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_Near_01_08");	//(задумчиво) Да, возможно ты прав.
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_Near_01_09");	//Однако, пока древнее проклятие моего народа не снято, я не смогу показаться ему на глаза.
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_Near_01_10");	//Ведь именно я стал причиной всех наших бедствий.
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_Near_01_11");	//И именно мне надо как-то исправить эту ситуацию.
};

instance DIA_NONE_ADDON_1159_Rhademes_Priest(C_Info)
{
	npc = NONE_ADDON_1159_Rhademes;
	nr = 4;
	condition = DIA_NONE_ADDON_1159_Rhademes_Priest_Condition;
	information = DIA_NONE_ADDON_1159_Rhademes_Priest_Info;
	permanent = FALSE;
	description = "Значит, сам Куарходрон управляет этой армией нежити?";
};

func int DIA_NONE_ADDON_1159_Rhademes_Priest_Condition()
{
	if((MIS_JarCurse == LOG_Running) && (Npc_KnowsInfo(other,DIA_NONE_ADDON_1159_Rhademes_Father) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_ADDON_1159_Rhademes_Priest_Info()
{
	AI_Output(other,self,"DIA_NONE_ADDON_1159_Rhademes_Priest_01_00");	//Значит, сам Куарходрон управляет этой армией нежити?
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_Priest_01_01");	//(холодно) Мой отец возглавляет только армию воинов...
	AI_Output(other,self,"DIA_NONE_ADDON_1159_Rhademes_Priest_01_02");	//А что насчет жрецов?
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_Priest_01_03");	//Они подчиняются воле Кардимона, верховного жреца нашего народа.
	AI_Output(other,self,"DIA_NONE_ADDON_1159_Rhademes_Priest_01_04");	//Я уже слышал это имя. 
	AI_Output(other,self,"DIA_NONE_ADDON_1159_Rhademes_Priest_01_05");	//Именно его дух Ворон вызвал в этот мир, чтобы проникнуть в храм Аданоса.
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_Priest_01_06");	//Я не понимаю о чем ты говоришь, человек.
	AI_Output(other,self,"DIA_NONE_ADDON_1159_Rhademes_Priest_01_07");	//Ладно, неважно. Просто скажи, где мне найти этого Кардимона?
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_Priest_01_08");	//Его дух должен обитать в большом храме, что на северо-востоке этой долины.
	MIS_Qvardemon = LOG_Running;
	Log_CreateTopic(TOPIC_Qvardemon,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Qvardemon,LOG_Running);
	B_LogEntry(TOPIC_Qvardemon,"Куарходрон управляет лишь армией воинов-нежити. Жрецы же подчиняются Кардимону, верховному магу Зодчих. По всей видимости, мне придется разобраться и с ним. По словам Радемеса, дух Кардимона обитает в развалинах храма на северо-востоке долины.");	
	Wld_InsertNpc(Skeleton_Shadow_Priest,"FP_ROAM_ENTRANCEORCGUARD_18");
	Wld_InsertNpc(Skeleton_Mage_AV_Elite,"FP_ROAM_ENTRANCEORCGUARD_17");
	Wld_InsertNpc(Skeleton_Shadow_Priest,"ADW_CANYON_LIBRARY_02");
	Wld_InsertNpc(Skeleton_Mage_AV_Elite,"ADW_CANYON_LIBRARY_LEFT_01");
	Wld_InsertNpc(Skeleton_Shadow_Priest,"ADW_CANYON_LIBRARY_RIGHT_01");
	Wld_InsertNpc(Skeleton_Mage_AV_Elite,"ADW_CANYON_LIBRARY_LEFT_07");
	Wld_InsertNpc(Skeleton_Shadow_Priest,"ADW_CANYON_LIBRARY_LEFT_04");
	Wld_InsertNpc(Skeleton_Mage_AV_Elite,"ADW_CANYON_LIBRARY_LEFT_08");
	Wld_InsertNpc(Skeleton_Shadow_Priest,"ADW_CANYON_LIBRARY_RIGHT_03");
	Wld_InsertNpc(Skeleton_Mage_AV_Elite,"ADW_CANYON_LIBRARY_RIGHT_06");
	Wld_InsertNpc(Skeleton_Shadow_Priest,"ADW_CANYON_LIBRARY_RIGHT_07");
	Wld_InsertNpc(Skeleton_Mage_AV_Elite,"ADW_CANYON_LIBRARY_RIGHT_09");
	Wld_InsertNpc(Skeleton_Shadow_Priest,"FP_STAND_QUARDIMON_GUARD_02");
	Wld_InsertNpc(Skeleton_Mage_AV_Elite,"FP_STAND_QUARDIMON_GUARD_01");
	Wld_InsertNpc(Skeleton_Shadow_Priest_Quardimon,"ADW_CANYON_LIBRARY_RIORDIAN");
};

instance DIA_NONE_ADDON_1159_Rhademes_SeekFathDone(C_Info)
{
	npc = NONE_ADDON_1159_Rhademes;
	nr = 4;
	condition = DIA_NONE_ADDON_1159_Rhademes_SeekFathDone_Condition;
	information = DIA_NONE_ADDON_1159_Rhademes_SeekFathDone_Info;
	permanent = FALSE;
	description = "А что поможет тебе вспомнить это?";
};

func int DIA_NONE_ADDON_1159_Rhademes_SeekFathDone_Condition()
{
	if((MIS_JarCurse == LOG_Running) && (Npc_KnowsInfo(other,DIA_NONE_ADDON_1159_Rhademes_SeekFath) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_ADDON_1159_Rhademes_SeekFathDone_Info()
{
	AI_Output(other,self,"DIA_NONE_ADDON_1159_Rhademes_SeekFathDone_01_00");	//А что поможет тебе вспомнить это?
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_SeekFathDone_01_01");	//(вздыхая) Проклятие моего народа не дает мне возможности вернуться в прошлое.
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_SeekFathDone_01_02");	//Если бы я только смог избавится от него, то, возможно, это бы вернуло мне мои воспоминания.
	AI_Output(other,self,"DIA_NONE_ADDON_1159_Rhademes_SeekFathDone_01_03");	//Как это можно сделать?
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_SeekFathDone_01_04");	//Я не знаю...(холодно) Аданос не слышит мои молитвы, сколько бы я к нему не обращался.
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_SeekFathDone_01_05");	//А если кому-то это и под силу, то только ему.
	MIS_CurseAncient = LOG_Running;
	Log_CreateTopic(TOPIC_CurseAncient,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CurseAncient,LOG_Running);
	B_LogEntry(TOPIC_CurseAncient,"Мне надо найти способ избавить Радемеса и его народ от древнего проклятия. По его словам, это под силу лишь самому Аданосу.");	
};

instance DIA_NONE_ADDON_1159_Rhademes_CurseAncientDone(C_Info)
{
	npc = NONE_ADDON_1159_Rhademes;
	nr = 4;
	condition = DIA_NONE_ADDON_1159_Rhademes_CurseAncientDone_Condition;
	information = DIA_NONE_ADDON_1159_Rhademes_CurseAncientDone_Info;
	permanent = FALSE;
	description = "Аданос снял проклятие с твоего народа.";
};

func int DIA_NONE_ADDON_1159_Rhademes_CurseAncientDone_Condition()
{
	if((MIS_CurseAncient == LOG_Running) && (CurseAncientRemove == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_ADDON_1159_Rhademes_CurseAncientDone_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self,"DIA_NONE_ADDON_1159_Rhademes_CurseAncientDone_01_00");	//Аданос снял проклятие с твоего народа.
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_CurseAncientDone_01_01");	//Да, я это уже почувствовал...(вздыхая) Теперь я, наконец-то, свободен.
	AI_Output(other,self,"DIA_NONE_ADDON_1159_Rhademes_CurseAncientDone_01_02");	//Значит, память вернулась к тебе, и теперь ты мне скажешь, где искать твоего отца?
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_CurseAncientDone_01_03");	//Как я уже говорил, он сейчас там, где когда-то произошла великая битва Кхар Арам.
	AI_Output(other,self,"DIA_NONE_ADDON_1159_Rhademes_CurseAncientDone_01_04");	//Это я уже знаю. А где конкретно находится это место?
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_CurseAncientDone_01_05");	//Ищи его в священных землях Аданоса. Именно там мой отец собирает свою армию, которая должна будет отомстить людям.
	AI_Output(other,self,"DIA_NONE_ADDON_1159_Rhademes_CurseAncientDone_01_06");	//А если еще точнее? Те земли довольно-таки обширные.
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_CurseAncientDone_01_07");	//Хммм...(задумчиво) Рядом с тем местом есть огромная скала.
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_CurseAncientDone_01_08");	//Как мне помнится, с нее когда-то открывался изумительный вид почти на всю долину.
	AI_Output(other,self,"DIA_NONE_ADDON_1159_Rhademes_CurseAncientDone_01_09");	//Ну, хоть что-то. Иначе мне пришлось бы целую вечность скитаться по пустыне.
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_CurseAncientDone_01_10");	//Постой, это еще не все...
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_CurseAncientDone_01_11");	//Если ты действительно хочешь повстречаться с моим отцом, то тебе сначала придется дождаться ночи.
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_CurseAncientDone_01_12");	//Ибо только в отблеске лунного света ты сможешь увидеть его.
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_CurseAncientDone_01_13");	//Но будь осторожен. Его окружает многочисленная армия мертвых воинов.
	AI_Output(other,self,"DIA_NONE_ADDON_1159_Rhademes_CurseAncientDone_01_14");	//Тогда сперва придется разобраться с ними.
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_CurseAncientDone_01_15");	//Они тебя не тронут, если ты дашь им понять, что служишь самому Аданосу.
	AI_Output(other,self,"DIA_NONE_ADDON_1159_Rhademes_CurseAncientDone_01_16");	//Хорошо, я учту это.
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_CurseAncientDone_01_17");	//Теперь прощай. Мы более не свидимся...
	AI_Output(self,other,"DIA_NONE_ADDON_1159_Rhademes_CurseAncientDone_01_18");	//И спасибо тебе, что спас мой народ!
	AI_Output(other,self,"DIA_NONE_ADDON_1159_Rhademes_CurseAncientDone_01_19");	//Прощай.
	MIS_CurseAncient = LOG_Success;
	Log_SetTopicStatus(TOPIC_CurseAncient,LOG_Success);
	B_LogEntry(TOPIC_JarCurse,"Похоже, мне снова придется отправиться на плато Древних. Именно там Куарходрон собирает армию мертвых, чтобы уничтожить все живое на этом острове. Радемес сказал, что рядом с местом, где я смогу найти Куарходрона, находится огромная скала. Однако мне придется дождаться ночи, поскольку только в лунном свете я смогу встретиться с его отцом. Также он предупредил меня, что Куарходрона охраняет огромное число воинов Зодчих. Но если я смогу как-то доказать, что служу Аданосу, они не станут на меня нападать. В противном случае мне придется сражаться с целой армией.");
	B_LogEntry_Quiet(TOPIC_CurseAncient,"Душа Радемеса теперь свободна, как и весь его народ. Похоже, история с древним проклятием окончена.");
	AI_StopProcessInfos(self);
};