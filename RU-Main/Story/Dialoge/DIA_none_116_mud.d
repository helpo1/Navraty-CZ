
instance NONE_116_MUD_EXIT(C_Info)
{
	npc = none_116_mud;
	nr = 999;
	condition = none_116_mud_exit_condition;
	information = none_116_mud_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int none_116_mud_exit_condition()
{
	return TRUE;
};

func void none_116_mud_exit_info()
{
	AI_StopProcessInfos(self);
};


instance NONE_116_MUD_HALLO(C_Info)
{
	npc = none_116_mud;
	condition = none_116_mud_hallo_condition;
	information = none_116_mud_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int none_116_mud_hallo_condition()
{
	return TRUE;
};

func void none_116_mud_hallo_info()
{
	AI_Output(self,other,"NONE_116_Mud_Hallo_Info_01_00");	//Эй, ты кто? И откуда?
	AI_Output(self,other,"NONE_116_Mud_Hallo_Info_01_01");	//Хотя постой... Я же тебя знаю! Ну конечно...
	AI_Output(self,other,"NONE_116_Mud_Hallo_Info_01_02");	//Ты же тот новичок, что прикончил самого Гомеза!
	AI_Output(self,other,"NONE_116_Mud_Hallo_Info_01_03");	//Ох, парень, как же я рад этой встрече!
	Info_ClearChoices(none_116_mud_hallo);
	Info_AddChoice(none_116_mud_hallo,"А, как я вижу, ты ничуть не изменился, Мад.",none_116_mud_hallo_mud);
	Info_AddChoice(none_116_mud_hallo,"Извини, но у меня что-то с памятью стало.",none_116_mud_hallo_who);
};

func void none_116_mud_hallo_mud()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"NONE_116_Mud_Hallo_Mud_01_01");	//А, как я вижу, ты ничуть не изменился, Мад. Все также болтаешь без умолку!
	AI_Output(other,self,"NONE_116_Mud_Hallo_Mud_01_02");	//Правда, выглядеть стал... несколько иначе, чем раньше.
	AI_Output(self,other,"NONE_116_Mud_Hallo_Mud_01_03");	//Ты меня вспомнил! Какое счастье! Мой старый друг!
	AI_Output(self,other,"NONE_116_Mud_Hallo_Mud_01_04");	//А помнишь, как мы повстречались в Старом лагере?
	AI_Output(self,other,"NONE_116_Mud_Hallo_Mud_01_06");	//Вот же было времечко, а! Кстати, а что ты тут делаешь?
	AI_Output(self,other,"NONE_116_Mud_Hallo_Mud_01_07");	//А ладно, какая разница - теперь ты снова рядом со мной, и я уже даже перестал немного бояться...
	AI_Output(other,self,"NONE_116_Mud_Hallo_Mud_01_08");	//Заткнись, Мад! Иначе я сейчас побью тебя - как в старые добрые времена.
	AI_Output(self,other,"NONE_116_Mud_Hallo_Mud_01_09");	//Ладно, ладно... Как скажешь, уже молчу. Видишь, я молчу.
	AI_Output(self,other,"NONE_116_Mud_Hallo_Mud_01_10");	//Хотя, если я буду молчать, - как я смогу говорить с тобой?
	Info_ClearChoices(none_116_mud_hallo);
};

func void none_116_mud_hallo_who()
{
	AI_Output(other,self,"NONE_116_Mud_Hallo_Who_01_01");	//Извини, но я что-то не припоминаю тебя.
	AI_Output(self,other,"NONE_116_Mud_Hallo_Who_01_02");	//Как?! Ты не помнишь старого друга? Ты не помнишь Мада?
	AI_Output(self,other,"NONE_116_Mud_Hallo_Who_01_04");	//Мы же с тобой были друзьями!
	AI_Output(self,other,"NONE_116_Mud_Hallo_Who_01_05");	//Ты был единственным моим другом в Старом лагере, хотя все остальные считали меня придурком.
	AI_Output(self,other,"NONE_116_Mud_Hallo_Who_01_06");	//Но они ошибались. Особенно, когда узнали, что у меня есть такой друг, как ты!
	AI_Output(self,other,"NONE_116_Mud_Hallo_Who_01_07");	//Хорошо иметь друзей. А у тебя есть друзья?
	AI_Output(self,other,"NONE_116_Mud_Hallo_Who_01_08");	//Ну, один у тебя точно есть - это я.
	AI_Output(other,self,"NONE_116_Mud_Hallo_Who_01_09");	//Мне кажется, ты слишком много болтаешь.
	AI_Output(self,other,"NONE_116_Mud_Hallo_Who_01_10");	//А что тут удивительного? Всегда приятно поболтать со старым другом.
	AI_Output(self,other,"NONE_116_Mud_Hallo_Who_01_11");	//Разве ты так не считаешь, а?
	AI_Output(other,self,"NONE_116_Mud_Hallo_Who_01_12");	//Я думаю, тебе стоит для начала научиться хотя бы изредка держать свой язык за зубами.
	AI_Output(self,other,"NONE_116_Mud_Hallo_Who_01_14");	//Хорошо, как скажешь. Я могу и помолчать.
	Info_ClearChoices(none_116_mud_hallo);
};


instance NONE_116_MUD_FACE(C_Info)
{
	npc = none_116_mud;
	nr = 1;
	condition = none_116_mud_face_condition;
	information = none_116_mud_face_info;
	permanent = FALSE;
	description = "Что произошло с тобой?";
};


func int none_116_mud_face_condition()
{
	if(Npc_KnowsInfo(hero,none_116_mud_hallo))
	{
		return TRUE;
	};
};

func void none_116_mud_face_info()
{
	AI_Output(other,self,"NONE_116_Mud_Face_Info_01_01");	//Что произошло с тобой?
	AI_Output(self,other,"NONE_116_Mud_Face_Info_01_02");	//Ты имеешь в виду мое лицо?
	AI_Output(other,self,"NONE_116_Mud_Face_Info_01_03");	//Да. Именно это я и имею в виду. Кто тебя так изуродовал?
	AI_Output(self,other,"NONE_116_Mud_Face_Info_01_04");	//Эх... Одна мерзкая тварь постаралась.
	AI_Output(self,other,"NONE_116_Mud_Face_Info_01_05");	//Хотя мне надо поблагодарить свою судьбу, что я вообще остался в живых!
	AI_Output(self,other,"NONE_116_Mud_Face_Info_01_09");	//Раньше здесь не встречал!
	AI_Output(self,other,"NONE_116_Mud_Face_Info_01_10");	//Чем-то немного напоминает снеппера, но только еще более ужаснее и свирепее.
	AI_Output(other,self,"NONE_116_Mud_Face_Info_01_12");	//А как ты тут оказался?
	AI_Output(self,other,"NONE_116_Mud_Face_Info_01_14");	//После того, как рухнул барьер, я думал отправиться обратно в Хоринис.
	AI_Output(self,other,"NONE_116_Mud_Face_Info_01_15");	//Но по дороге к проходу я случайно наткнулся на отряд орков.
	AI_Output(self,other,"NONE_116_Mud_Face_Info_01_18");	//Видимо, эти зеленокожие твари решили, что я бы неплохо смотрелся у них в котелке. Ну и погнались за мной!
	AI_Output(self,other,"NONE_116_Mud_Face_Info_01_19");	//Как сейчас помню - бежал я тогда, что есть сил, не особо разбирая, куда именно.
	AI_Output(self,other,"NONE_116_Mud_Face_Info_01_21");	//А когда заметил, что орки подотстали, - оглядевшись, понял, что заблудился.
	AI_Output(other,self,"NONE_116_Mud_Face_Info_01_25");	//Значит, ты больше не пробовал пройти через проход?
	AI_Output(self,other,"NONE_116_Mud_Face_Info_01_26");	//Нет. Я в долину больше ни ногой!
	AI_Output(self,other,"NONE_116_Mud_Face_Info_01_27");	//Туда только сунься - и тебя сразу же сожрут заживо. Так что лучше уж тут.
	AI_Output(self,other,"NONE_116_Mud_Face_Info_01_28");	//Кстати, скажу тебе по правде, местечко это - довольно неплохое.
	AI_Output(self,other,"NONE_116_Mud_Face_Info_01_30");	//И орки тут не бродят - их лагерь там дальше, в горах.
};


instance NONE_116_MUD_CRATES(C_Info)
{
	npc = none_116_mud;
	nr = 1;
	condition = none_116_mud_crates_condition;
	information = none_116_mud_crates_info;
	permanent = FALSE;
	description = "Что это за ящики?";
};


func int none_116_mud_crates_condition()
{
	if(Npc_KnowsInfo(hero,none_116_mud_hallo) && (Kapitel < 5))
	{
		return TRUE;
	};
};

func void none_116_mud_crates_info()
{
	AI_Output(other,self,"NONE_116_Mud_Crates_Info_01_00");	//Что это за ящики?
	AI_Output(self,other,"NONE_116_Mud_Crates_Info_01_01");	//Это ящики с магической рудой.
	AI_Output(other,self,"NONE_116_Mud_Crates_Info_01_02");	//С рудой? Откуда они взялись?
	AI_Output(self,other,"NONE_116_Mud_Crates_Info_01_03");	//Они были здесь еще до того, как я тут обосновался.
	AI_Output(self,other,"NONE_116_Mud_Crates_Info_01_06");	//Их не меньше двадцати!
	AI_Output(other,self,"NONE_116_Mud_Crates_Info_01_07");	//Хммм... Тогда, думаю, об этом стоит сообщить паладинам. Гаронд будет очень удивлен.
	AI_Output(self,other,"NONE_116_Mud_Crates_Info_01_08");	//Паладинам? Каким паладинам?
	AI_Output(other,self,"NONE_116_Mud_Crates_Info_01_09");	//Да, похоже, ты очень сильно отстал от жизни.
	AI_Output(self,other,"NONE_116_Mud_Crates_Info_01_10");	//Ха! А чему тут удивляться? Ты первый человек, которого я встретил за последние несколько недель.
	AI_Output(self,other,"NONE_116_Mud_Crates_Info_01_11");	//А что ты там говорил про паладинов?
	AI_Output(other,self,"NONE_116_Mud_Crates_Info_01_12");	//Недавно в долину пришел небольшой отряд паладинов короля, и обосновался в старом замке баронов.
	AI_Output(other,self,"NONE_116_Mud_Crates_Info_01_16");	//В данный момент замок находится под осадой орков, так что попасть туда довольно трудно.
	AI_Output(other,self,"NONE_116_Mud_Crates_Info_01_17");	//Да и выход из долины также перекрыт этими зеленокожими тварями. Так что выбраться из долины удалось лишь немногим.
	AI_Output(self,other,"NONE_116_Mud_Crates_Info_01_18");	//Черт! Ох уж эти орки!
	AI_Output(self,other,"NONE_116_Mud_Crates_Info_01_20");	//И что теперь?
	AI_Output(other,self,"NONE_116_Mud_Crates_Info_01_21");	//Надо отправиться в замок и сообщить паладинам об этих запасах магической руды.
	AI_Output(self,other,"NONE_116_Mud_Crates_Info_01_24");	//Послушай, а... а ты мог бы взять меня с собой, если пойдешь в этот замок?
	AI_Output(self,other,"NONE_116_Mud_Crates_Info_01_26");	//Одному мне туда точно не пробраться, а с тобой у меня есть хоть какие-то шансы.
	AI_Output(other,self,"NONE_116_Mud_Crates_Info_01_29");	//Извини, но это слишком опасно.
	AI_Output(other,self,"NONE_116_Mud_Crates_Info_01_31");	//А, насколько мне помнится, ты никогда не был хорошим бойцом.
	AI_Output(self,other,"NONE_116_Mud_Crates_Info_01_32");	//Ну да, я понимаю. Ладно, посижу пока тут.
	AI_Output(other,self,"NONE_116_Mud_Crates_Info_01_34");	//Не волнуйся, я попытаюсь привести подкрепление.
	MIS_MADERZ = LOG_Running;
	Log_CreateTopic(TOPIC_MADERZ,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MADERZ,LOG_Running);
	B_LogEntry(TOPIC_MADERZ,"На том месте, где обосновался Мад, я обнаружил большие запасы магической руды. Мне необходимо срочно попасть в замок и сообщить об этом Гаронду. Эта новость должна его обрадовать.");
	Log_AddEntry(TOPIC_MADERZ,"Я решил не брать Мада с собой в замок, но пообещал ему, что постараюсь уговорить Гаронда прислать ему помощь.");
};


instance NONE_116_MUD_PERM(C_Info)
{
	npc = none_116_mud;
	nr = 1;
	condition = none_116_mud_perm_condition;
	information = none_116_mud_perm_info;
	permanent = TRUE;
	description = "Как дела, Мад?";
};


func int none_116_mud_perm_condition()
{
	if(Npc_KnowsInfo(hero,none_116_mud_face))
	{
		return TRUE;
	};
};

func void none_116_mud_perm_info()
{
	AI_Output(other,self,"NONE_116_Mud_Perm_01_00");	//Как дела, Мад?
	if(MIS_MADERZ == LOG_SUCCESS)
	{
		AI_Output(self,other,"NONE_116_Mud_Perm_01_01");	//Могло быть и лучше. Не нравится мне все это.
		AI_Output(self,other,"NONE_116_Mud_Perm_01_02");	//Единственное, что меня успокаивает, - эти ребята в доспехах.
	}
	else
	{
		AI_Output(self,other,"NONE_116_Mud_Perm_01_06");	//Как-как... Никак!
		AI_Output(self,other,"NONE_116_Mud_Perm_01_07");	//Оглянись вокруг, и все поймешь - кругом одна безнадега!
		AI_Output(self,other,"NONE_116_Mud_Perm_01_08");	//Эх... И когда все это только закончится.
	};
};


instance NONE_116_MUD_NOTINCASTLE(C_Info)
{
	npc = none_116_mud;
	nr = 1;
	condition = none_116_mud_notincastle_condition;
	information = none_116_mud_notincastle_info;
	permanent = FALSE;
	description = "Теперь тебе не так страшно?";
};


func int none_116_mud_notincastle_condition()
{
	if(MIS_MADERZ == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void none_116_mud_notincastle_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"NONE_116_Mud_NotInCastle_01_00");	//Теперь тебе не так страшно?
	AI_Output(self,other,"NONE_116_Mud_NotInCastle_01_02");	//С этими ребятами я чувствую себя в полной безопасности.
	AI_Output(self,other,"NONE_116_Mud_NotInCastle_01_04");	//Спасибо тебе, друг!
};

