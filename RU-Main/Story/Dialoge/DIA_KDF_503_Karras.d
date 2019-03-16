
instance DIA_Karras_KAP1_EXIT(C_Info)
{
	npc = KDF_503_Karras;
	nr = 999;
	condition = DIA_Karras_KAP1_EXIT_Condition;
	information = DIA_Karras_KAP1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Karras_KAP1_EXIT_Condition()
{
	if(Kapitel <= 1)
	{
		return TRUE;
	};
};

func void DIA_Karras_KAP1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Karras_Hello(C_Info)
{
	npc = KDF_503_Karras;
	nr = 1;
	condition = DIA_Karras_Hello_Condition;
	information = DIA_Karras_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Karras_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MIS_NovizenChase != LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Karras_Hello_Info()
{
	if(hero.guild == GIL_NOV)
	{
		AI_Output(self,other,"DIA_Karras_Hello_10_00");	//Что я могу сделать для тебя, послушник?
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Karras_Hello_10_01");	//Что я могу сделать для тебя, брат?
	}
	else if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Karras_Hello_10_02");	//Благородные воины Инноса редко останавливаются здесь.
		AI_Output(self,other,"DIA_Karras_Hello_10_03");	//Что я могу сделать для тебя?
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_Hello_10_04");	//(недоверчиво) Что ты делаешь здесь?
	};
};


instance DIA_Karras_Mission(C_Info)
{
	npc = KDF_503_Karras;
	nr = 2;
	condition = DIA_Karras_Mission_Condition;
	information = DIA_Karras_Mission_Info;
	permanent = FALSE;
	description = "Я пришел почитать писания.";
};


func int DIA_Karras_Mission_Condition()
{
	if(other.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void DIA_Karras_Mission_Info()
{
	AI_Output(other,self,"DIA_Karras_Mission_15_00");	//Я пришел почитать писания.
	AI_Output(self,other,"DIA_Karras_Mission_10_01");	//Понимаю. Если тебе удастся выкроить время при изучении писаний, обратись ко мне.
	AI_Output(self,other,"DIA_Karras_Mission_10_02");	//Есть один вопрос, в котором мне не помешала бы помощь здравомыслящего послушника.
};


instance DIA_Karras_Aufgabe(C_Info)
{
	npc = KDF_503_Karras;
	nr = 2;
	condition = DIA_Karras_Aufgabe_Condition;
	information = DIA_Karras_Aufgabe_Info;
	permanent = FALSE;
	description = "У тебя есть поручение для меня?";
};


func int DIA_Karras_Aufgabe_Condition()
{
	return TRUE;
};

func void DIA_Karras_Aufgabe_Info()
{
	AI_Output(other,self,"DIA_Karras_Aufgabe_15_00");	//У тебя есть поручение для меня?
	AI_Output(self,other,"DIA_Karras_Aufgabe_10_01");	//Да. Это касается безумного Игнаца. Он живет в Хоринисе и экспериментирует с различными зельями и лечебными настойками. Но также он занимается магическими заклинаниями.
	AI_Output(self,other,"DIA_Karras_Aufgabe_10_02");	//И это очень беспокоит меня. Я задаю себе вопрос - а угодна ли эта магия Инносу?
	AI_Output(self,other,"DIA_Karras_Aufgabe_10_03");	//Чтобы проверить это, мне хотелось бы заполучить некоторые из его свитков.
	AI_Output(self,other,"DIA_Karras_Aufgabe_10_04");	//Я хочу, чтобы ты отправился в город и купил у него три свитка для меня.
	B_GiveInvItems(self,other,ItMi_Gold,600);
	AI_Output(self,other,"DIA_Karras_Aufgabe_10_05");	//Но никому ни слова - понятно?
	AI_Output(other,self,"DIA_Karras_Aufgabe_15_06");	//Конечно.
	MIS_KarrasVergessen = LOG_Running;
	Log_CreateTopic(Topic_KarrasCharm,LOG_MISSION);
	Log_SetTopicStatus(Topic_KarrasCharm,LOG_Running);
	B_LogEntry(Topic_KarrasCharm,"Мастер Каррас отправил меня в город. Он хочет, чтобы я принес ему три свитка с заклинаниями, которые изготавливает и продает Игнац.");
};


instance DIA_Karras_Success(C_Info)
{
	npc = KDF_503_Karras;
	nr = 2;
	condition = DIA_Karras_Success_Condition;
	information = DIA_Karras_Success_Info;
	permanent = FALSE;
	description = "Вот свитки, которые ты хотел получить.";
};


func int DIA_Karras_Success_Condition()
{
	if((MIS_KarrasVergessen == LOG_Running) && (Npc_HasItems(other,ItSc_Charm) >= 3))
	{
		return TRUE;
	};
};

func void DIA_Karras_Success_Info()
{
	AI_Output(other,self,"DIA_Karras_Success_15_00");	//Вот свитки, которые ты хотел получить.
	AI_Output(self,other,"DIA_Karras_Success_10_01");	//Отлично, мой юный друг.
	AI_Output(self,other,"DIA_Karras_Success_10_02");	//Теперь ты можешь полностью посвятить себя обучению в библиотеке.
	AI_Output(self,other,"DIA_Karras_Success_10_03");	//И возьми этот свиток в качестве награды.
	MIS_KarrasVergessen = LOG_SUCCESS;
	B_GivePlayerXP(XP_KarrasCharm);
	B_GiveInvItems(other,self,ItSc_Charm,3);
	B_GiveInvItems(self,other,ItSc_SumWolf,1);
};


instance DIA_Karras_JOB(C_Info)
{
	npc = KDF_503_Karras;
	nr = 2;
	condition = DIA_Karras_JOB_Condition;
	information = DIA_Karras_JOB_Info;
	permanent = FALSE;
	description = "А чем именно ты занимаешься?";
};


func int DIA_Karras_JOB_Condition()
{
	return TRUE;
};

func void DIA_Karras_JOB_Info()
{
	AI_Output(other,self,"DIA_Karras_JOB_15_00");	//А чем именно ты занимаешься?
	AI_Output(self,other,"DIA_Karras_JOB_10_01");	//Я отвечаю за обучение магов искусству сферического проявления.
	AI_Output(other,self,"DIA_Karras_JOB_15_02");	//Что это означает?
	AI_Output(self,other,"DIA_Karras_JOB_10_03");	//Ну, я обучаю их вызову существ из других измерений или сфер.
	AI_Output(self,other,"DIA_Karras_JOB_10_04");	//Это обычно называется просто вызовом. Хотя это определение недостаточно полно отражает суть искусства вызова слуг.
};


instance DIA_Karras_CIRCLE4(C_Info)
{
	npc = KDF_503_Karras;
	nr = 3;
	condition = DIA_Karras_CIRCLE4_Condition;
	information = DIA_Karras_CIRCLE4_Info;
	permanent = TRUE;
	description = "Я хочу изучить четвертый Круг Магии. (Очков обучения: 60)";
};


func int DIA_Karras_CIRCLE4_Condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 3) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Karras_CIRCLE4_Info()
{
	AI_Output(other,self,"DIA_Karras_CIRCLE4_15_00");	//Я хочу изучить четвертый Круг Магии.
	if(MIS_ReadyforChapter4 == TRUE)
	{
		if(B_TeachMagicCircle(self,other,4))
		{
			AI_Output(self,other,"DIA_Karras_CIRCLE4_10_01");	//Хорошо. Для этого ты располагаешь всем необходимым. Войди же в Четвертый Круг, да пребудет с тобой сила этой новой магии.
			AI_Output(self,other,"DIA_Karras_CIRCLE4_10_02");	//Ты через многое прошел, и Иннос будет продолжать освещать твой путь.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_CIRCLE4_10_03");	//Он еще далеко не закончен.
	};
};

instance DIA_Karras_CIRCLE5(C_Info)
{
	npc = KDF_503_Karras;
	nr = 3;
	condition = DIA_Karras_CIRCLE5_Condition;
	information = DIA_Karras_CIRCLE5_Info;
	permanent = TRUE;
	description = "Я хочу изучить пятый Круг Магии. (Очков обучения: 80)";
};

func int DIA_Karras_CIRCLE5_Condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 4) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Karras_CIRCLE5_Info()
{
	AI_Output(other,self,"DIA_Karras_CIRCLE5_15_00");	//Я хочу изучить пятый Круг Магии.

	if(Kapitel >= 5)
	{
		if(B_TeachMagicCircle(self,other,5))
		{
			AI_Output(self,other,"DIA_Karras_CIRCLE5_10_01");	//Войди же в пятый Круг Магии. Тебе станет подвластна могущественная магия, несравнимая с тем, чем ты владел ранее.
			AI_Output(self,other,"DIA_Karras_CIRCLE5_10_02");	//Используй эту силу во благо, брат - тьма еще сильна, и сильны твои враги.
			AI_Output(self,other,"DIA_Karras_CIRCLE5_10_03");	//Я не могу сопроводить тебя по пути к шестому и наивысшему Кругу Магии. Сам Пирокар введет тебя в него, когда придет время.
			B_LogEntry(Topic_KlosterTeacher,"Мастер Пирокар посвятит меня в шестой Круг Магии.");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_CIRCLE4_10_04");	//Время еще не пришло.
	};
};


instance DIA_Karras_KAP2_EXIT(C_Info)
{
	npc = KDF_503_Karras;
	nr = 999;
	condition = DIA_Karras_KAP2_EXIT_Condition;
	information = DIA_Karras_KAP2_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Karras_KAP2_EXIT_Condition()
{
	if(Kapitel == 2)
	{
		return TRUE;
	};
};

func void DIA_Karras_KAP2_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Karras_KAP3_EXIT(C_Info)
{
	npc = KDF_503_Karras;
	nr = 999;
	condition = DIA_Karras_KAP3_EXIT_Condition;
	information = DIA_Karras_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Karras_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Karras_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Karras_ChasePedro(C_Info)
{
	npc = KDF_503_Karras;
	nr = 31;
	condition = DIA_Karras_ChasePedro_Condition;
	information = DIA_Karras_ChasePedro_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Karras_ChasePedro_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Kapitel == 3) && (MIS_NovizenChase == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Karras_ChasePedro_Info()
{
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Karras_ChasePedro_10_00");	//Брат, тебе нельзя терять времени. Ты должен найти Педро и вернуть Глаз Инноса монастырю.
		AI_Output(self,other,"DIA_Karras_ChasePedro_10_01");	//Если Глаз не вернуть, мы все обречены.
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_ChasePedro_10_02");	//Что ты делаешь здесь? Разве ты не должен сейчас искать коварного предателя Педро?
		Info_ClearChoices(DIA_Karras_ChasePedro);
		Info_AddChoice(DIA_Karras_ChasePedro,"Это подождет. Есть другие, более важные дела.",DIA_Karras_ChasePedro_Later);
		Info_AddChoice(DIA_Karras_ChasePedro,"Ему все равно далеко не уйти.",DIA_Karras_ChasePedro_WontEscape);
	};
};

func void DIA_Karras_ChasePedro_Later()
{
	AI_Output(other,self,"DIA_Karras_ChasePedro_Later_15_00");	//Это подождет. Есть другие, более важные дела.
	AI_Output(self,other,"DIA_Karras_ChasePedro_Later_10_01");	//Да ты представляешь, что эта потеря означает для монастыря? Глаз Инноса - грозное оружие.
	AI_Output(self,other,"DIA_Karras_ChasePedro_Later_10_02");	//Никто не в состоянии предугадать, что враг намеревается сделать с этим амулетом, но он что-то задумал, и мы должны предотвратить эту беду.
	AI_Output(self,other,"DIA_Karras_ChasePedro_Later_10_03");	//Так отправляйся же немедленно на поиски и найди этого вора!
	AI_StopProcessInfos(self);
};

func void DIA_Karras_ChasePedro_WontEscape()
{
	AI_Output(other,self,"DIA_Karras_ChasePedro_WontEscape_15_00");	//Ему все равно далеко не уйти.
	AI_Output(self,other,"DIA_Karras_ChasePedro_WontEscape_10_01");	//Я очень надеюсь на это, ради твоего же блага. Если же ему удастся уйти из-за того, что ты болтаешься здесь, я лично позабочусь о том, чтобы ты предстал перед трибуналом.
	AI_Output(other,self,"DIA_Karras_ChasePedro_WontEscape_15_02");	//А в чем меня можно обвинить?
	AI_Output(self,other,"DIA_Karras_ChasePedro_WontEscape_10_03");	//В заговоре с врагом. Не нужно большого воображения, чтобы представить себе наказание за такое преступление.
	AI_Output(self,other,"DIA_Karras_ChasePedro_WontEscape_10_04");	//А теперь не теряй времени попусту. В противном случае, боюсь, при следующей нашей встрече ты будешь гореть на костре.
	AI_StopProcessInfos(self);
};


instance DIA_Karras_NeedInfo(C_Info)
{
	npc = KDF_503_Karras;
	nr = 31;
	condition = DIA_Karras_NeedInfo_Condition;
	information = DIA_Karras_NeedInfo_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Karras_NeedInfo_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Karras_ChasePedro) && (Kapitel == 3) && (hero.guild != GIL_KDF) && (MIS_NovizenChase == LOG_Running) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Karras_NeedInfo_Info()
{
	AI_Output(self,other,"DIA_Karras_NeedInfo_10_00");	//Ты знаешь, что тебе нужно делать. Так иди же!
	AI_StopProcessInfos(self);
};


instance DIA_Karras_InnosEyeRetrieved(C_Info)
{
	npc = KDF_503_Karras;
	nr = 1;
	condition = DIA_Karras_InnosEyeRetrieved_Condition;
	information = DIA_Karras_InnosEyeRetrieved_Info;
	permanent = FALSE;
	description = "Я принес назад Глаз Инноса.";
};


func int DIA_Karras_InnosEyeRetrieved_Condition()
{
	if((Kapitel == 3) && (MIS_NovizenChase == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Karras_InnosEyeRetrieved_Info()
{
	AI_Output(other,self,"DIA_Karras_InnosEyeRetrieved_15_00");	//Я принес назад Глаз Инноса.
	AI_Output(self,other,"DIA_Karras_InnosEyeRetrieved_10_01");	//Я так рад, что тебе удалось вырвать Глаз из лап врага.
	AI_Output(self,other,"DIA_Karras_InnosEyeRetrieved_10_02");	//Но опасность все еще нависает над нами. Враг разрабатывает новые планы и претворяет их в жизнь с необычайной агрессивностью.
	AI_Output(other,self,"DIA_Karras_InnosEyeRetrieved_15_03");	//Я уже почувствовал это на своей шкуре.
	AI_Output(self,other,"DIA_Karras_InnosEyeRetrieved_10_04");	//Сейчас не время для шуток. Ситуация серьезна. Очень серьезна. Теперь мы даже не знаем, кому можно доверять, а кому нет.
	AI_Output(self,other,"DIA_Karras_InnosEyeRetrieved_10_05");	//Враг уже преуспел в искушении послушника Педро. Он может преуспеть в этом и со многими другими.
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Karras_KAP3_Perm(C_Info)
{
	npc = KDF_503_Karras;
	nr = 5;
	condition = DIA_Karras_KAP3_Perm_Condition;
	information = DIA_Karras_KAP3_Perm_Info;
	permanent = TRUE;
	description = "Как продвигаются твои исследования?";
};


func int DIA_Karras_KAP3_Perm_Condition()
{
	if((Kapitel >= 3) && Npc_KnowsInfo(other,DIA_Karras_JOB))
	{
		return TRUE;
	};
};

func void DIA_Karras_KAP3_Perm_Info()
{
	AI_Output(other,self,"DIA_Karras_KAP3_Perm_15_00");	//Как продвигаются твои исследования?
	if((MIS_KarrasResearchDMT == FALSE) && (PyrokarToldKarrasToResearchDMT == TRUE) && (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_01");	//Я смог выяснить кое-что об ищущих.
		AI_Output(other,self,"DIA_Karras_KAP3_Perm_15_02");	//И что это такое?
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_03");	//Они имеют очевидное демоническое происхождение. Ну, по крайней мере, они находятся или находились под влиянием демонов.
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_04");	//Будь осторожен при встрече с ними.
		AI_Output(other,self,"DIA_Karras_KAP3_Perm_15_05");	//Надо же! Какая свежая концепция!
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_06");	//Я приношу свои извинения, но у меня недостаточно материала, чтобы сделать более детальные утверждения.
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_07");	//Но ты мог бы принести мне что-нибудь, принадлежащее им, для изучения...
		MIS_KarrasResearchDMT = LOG_Running;
		B_LogEntry(TOPIC_DEMENTOREN,"Чтобы продолжать свои исследования, Каррасу нужно что-нибудь, что было в прямом контакте с темными странниками.");
		Info_ClearChoices(DIA_Karras_KAP3_Perm);
		Info_AddChoice(DIA_Karras_KAP3_Perm,Dialog_Back,DIA_Karras_KAP3_Perm_Back);
		Info_AddChoice(DIA_Karras_KAP3_Perm,"Я попробую что-нибудь сделать.",DIA_Karras_KAP3_Perm_WillSee);
		Info_AddChoice(DIA_Karras_KAP3_Perm,"Может иметь к этому отношение Спящий?",DIA_Karras_KAP3_Perm_Sleeper);
		Info_AddChoice(DIA_Karras_KAP3_Perm,"Что именно тебе нужно?",DIA_Karras_KAP3_Perm_Material);
	}
	else if(MIS_KarrasResearchDMT == LOG_Running)
	{
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_08");	//Я все еще работаю над интерпретацией данных об ищущих.
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_09");	//Как только я что-нибудь выясню, я, конечно же, немедленно информирую тебя.
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_10");	//У врага много обликов. Какой из них представляет наибольшую опасность для монастыря - чрезвычайно трудно определить.
	};
};

func void DIA_Karras_KAP3_Perm_Back()
{
	Info_ClearChoices(DIA_Karras_KAP3_Perm);
};

func void DIA_Karras_KAP3_Perm_Sleeper()
{
	AI_Output(other,self,"DIA_Karras_KAP3_Perm_Sleeper_15_00");	//Может иметь к этому отношение Спящий?
	AI_Output(self,other,"DIA_Karras_KAP3_Perm_Sleeper_10_01");	//Я слышал о Спящем. Но, исходя из имеющейся у меня информации, я ничего не могу сказать об этом.
	AI_Output(self,other,"DIA_Karras_KAP3_Perm_Sleeper_10_02");	//К нему могут иметь отношение бесчисленное количество демонов, и любой из них может быть причастен.
};

func void DIA_Karras_KAP3_Perm_Corpse()
{
	AI_Output(other,self,"DIA_Karras_KAP3_Perm_Corpse_15_00");	//Ты хочешь, чтобы я принес тебе труп, что ли?
	AI_Output(self,other,"DIA_Karras_KAP3_Perm_Corpse_10_01");	//Нет! Ты с ума сошел?! Опасность, представляемая нахождением демонической сущности в стенах монастыря, слишком велика.
	AI_Output(self,other,"DIA_Karras_KAP3_Perm_Corpse_10_02");	//Будет достаточно, если ты найдешь какие-нибудь предметы, типичные для этих созданий.
	AI_Output(self,other,"DIA_Karras_KAP3_Perm_Corpse_10_03");	//Остатки демонической ауры, прилипшие к ним, должны дать достаточно информации для изучения.
};

func void DIA_Karras_KAP3_Perm_Material()
{
	AI_Output(other,self,"DIA_Karras_KAP3_Perm_Material_15_00");	//Что именно тебе нужно?
	AI_Output(self,other,"DIA_Karras_KAP3_Perm_Material_10_01");	//Откуда я знаю? Любой предмет, который принадлежит только этим созданиям.
	Info_AddChoice(DIA_Karras_KAP3_Perm,"Ты хочешь, чтобы я принес тебе труп?",DIA_Karras_KAP3_Perm_Corpse);
};

func void DIA_Karras_KAP3_Perm_WillSee()
{
	AI_Output(other,self,"DIA_Karras_KAP3_Perm_WillSee_15_00");	//Я попробую что-нибудь сделать.
	AI_Output(self,other,"DIA_Karras_KAP3_Perm_WillSee_10_01");	//Это было бы очень полезным. А пока я займусь своими обычными исследованиями.
	Info_ClearChoices(DIA_Karras_KAP3_Perm);
};


instance DIA_Karras_HaveBook(C_Info)
{
	npc = KDF_503_Karras;
	nr = 2;
	condition = DIA_Karras_HaveBook_Condition;
	information = DIA_Karras_HaveBook_Info;
	permanent = FALSE;
	description = "Я принес Альманах Одержимых.";
};


func int DIA_Karras_HaveBook_Condition()
{
	if((MIS_KarrasResearchDMT == LOG_Running) && (Npc_HasItems(hero,ITWR_DementorObsessionBook_MIS) >= 1) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};


var int KarrasGotResearchDMTBook_Day;

func void DIA_Karras_HaveBook_Info()
{
	AI_Output(other,self,"DIA_Karras_HaveBook_15_00");	//Я принес Альманах Одержимых. Может быть, он чем-нибудь тебе поможет.
	AI_Output(self,other,"DIA_Karras_HaveBook_10_01");	//Покажи.
	B_GiveInvItems(other,self,ITWR_DementorObsessionBook_MIS,1);
	Npc_RemoveInvItems(self,ITWR_DementorObsessionBook_MIS,1);
	AI_Output(self,other,"DIA_Karras_HaveBook_10_02");	//Да, это может подойти. Я должен изучить эту книгу.
	AI_Output(self,other,"DIA_Karras_HaveBook_10_03");	//Но я уже уверен в одном...
	AI_Output(self,other,"DIA_Karras_HaveBook_10_04");	//По моему мнению, ищущие - это крайне извращенная жизненная форма, созданная Белиаром.
	AI_Output(self,other,"DIA_Karras_HaveBook_10_05");	//Эти создания имеют частично демоническую и частично человеческую природу.
	AI_Output(self,other,"DIA_Karras_HaveBook_10_06");	//Однако, я пока не могу сказать, - имеем ли мы дело с типичной спиритуальной одержимостью, или с чистой физической мутацией.
	AI_Output(self,other,"DIA_Karras_HaveBook_10_07");	//Заходи попозже. Тогда я определенно смогу сказать больше.
	MIS_KarrasResearchDMT = LOG_SUCCESS;
	B_LogEntry(TOPIC_DEMENTOREN,"Каррас смог использовать Альманах одержимых для продолжения своих исследований. Я должен вернуться к нему позже.");
	KarrasGotResearchDMTBook_Day = Wld_GetDay();
	B_GivePlayerXP(XP_KarrasResearchDMT);
};


instance DIA_Karras_ResearchDMTEnd(C_Info)
{
	npc = KDF_503_Karras;
	nr = 2;
	condition = DIA_Karras_ResearchDMTEnd_Condition;
	information = DIA_Karras_ResearchDMTEnd_Info;
	permanent = TRUE;
	description = "Выяснил что-нибудь новое об ищущих?";
};


func int DIA_Karras_ResearchDMTEnd_Condition()
{
	if((MIS_KarrasResearchDMT == LOG_SUCCESS) && (hero.guild == GIL_KDF) && (SC_KnowsMadPsi == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Karras_ResearchDMTEnd_Info()
{
	AI_Output(other,self,"DIA_Karras_ResearchDMTEnd_15_00");	//Выяснил что-нибудь новое об ищущих?
	if(KarrasGotResearchDMTBook_Day <= (Wld_GetDay() - 2))
	{
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_01");	//Да. Теперь я знаю, кем или чем эти ищущие являются в действительности.
		AI_Output(other,self,"DIA_Karras_ResearchDMTEnd_15_02");	//Выкладывай!
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_03");	//Когда-то они были людьми, как ты или я. Они сделали трагическую ошибку, посвятив себя нечистой магии очень сильного архидемона.
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_04");	//Под влиянием этого архидемона, а также очень сильных наркотиков, единственной целью их существования стало служение ему, и со временем от их былой сущности осталась лишь тень.
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_05");	//Сегодня же, они не более чем орудие зла, не обладающее собственной волей, и они никогда не перестанут охотиться на последователей Инноса.
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_06");	//Мы должны проявлять осторожность. Похоже, они боятся этих священных чертогов Инноса.
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_07");	//Однако, если их сила продолжит расти, я не смогу поручиться, что мы будем здесь в безопасности.
		AI_Output(other,self,"DIA_Karras_ResearchDMTEnd_15_08");	//Спасибо. Это все было очень поучительно.
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_09");	//Правда? Мне кажется, что это поднимает только еще больше вопросов. Например, кем они были раньше, и какой архидемон сделал их тем, что они есть сейчас?
		AI_Output(other,self,"DIA_Karras_ResearchDMTEnd_15_10");	//У меня есть догадка. Это все похоже на Братство Спящего. Я знаю этих парней.
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_11");	//Надеюсь, ты понимаешь, с чем имеешь дело. Будь осторожен, брат.
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_12");	//Да, конечно же! Вот твой альманах. Мне он больше не нужен.
		B_GiveInvItems(self,other,ITWR_DementorObsessionBook_MIS,1);
		SC_KnowsMadPsi = TRUE;
		B_LogEntry(TOPIC_DEMENTOREN,"Исследования Карраса завершились успехом. Похоже, есть связь между темными странниками и Братством Спящего.");
		B_GivePlayerXP(XP_SC_KnowsMadPsi);
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_13");	//Я работаю над этим. Заходи позже.
	};
};


instance DIA_Karras_Prot_BlackEye(C_Info)
{
	npc = KDF_503_Karras;
	nr = 2;
	condition = DIA_Karras_Prot_BlackEye_Condition;
	information = DIA_Karras_Prot_BlackEye_Info;
	permanent = TRUE;
	description = "Есть ли способ защититься от ментальных атак темных странников?";
};


func int DIA_Karras_Prot_BlackEye_Condition()
{
	if((hero.guild == GIL_KDF) && (Pyrokar_AskKarrasAboutDMTAmulett == TRUE) && (MIS_Karras_FindBlessedStone == FALSE) && Npc_KnowsInfo(other,DIA_Karras_JOB))
	{
		return TRUE;
	};
};

func void DIA_Karras_Prot_BlackEye_Info()
{
	AI_Output(other,self,"DIA_Karras_Prot_BlackEye_15_00");	//Есть ли способ защититься от ментальных атак темных странников?
	if(SC_KnowsMadPsi == TRUE)
	{
		AI_Output(self,other,"DIA_Karras_Prot_BlackEye_10_01");	//Конечно. Амулет, изготовленный из камня с благословенной земли, мог бы оказать защитное действие.
		AI_Output(self,other,"DIA_Karras_Prot_BlackEye_10_02");	//К сожалению, у меня не осталось таких камней.
		AI_Output(self,other,"DIA_Karras_Prot_BlackEye_10_03");	//Некоторые из алтарей, возведенных нами, сложены из таких камней.
		AI_Output(other,self,"DIA_Karras_Prot_BlackEye_15_04");	//Хорошо. Я попробую раздобыть такой камень.
		AI_Output(self,other,"DIA_Karras_Prot_BlackEye_10_05");	//Да, сделай это. Но даже не думай, чтобы повредить какой-нибудь алтарь, ты слышишь меня?
		B_LogEntry(TOPIC_DEMENTOREN,"Каррас может дать мне некоторую защиту от ментальных атак темных странников. Для этого ему нужен камень из благословенной земли. Некоторые алтари сделаны из таких камней.");
		MIS_Karras_FindBlessedStone = LOG_Running;
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_Prot_BlackEye_10_06");	//Понятия не имею. Я пока знаю слишком мало, чтобы дать ответ на твой вопрос. Задай мне его еще раз попозже.
	};
};


instance DIA_Karras_KarrasBlessedStone(C_Info)
{
	npc = KDF_503_Karras;
	nr = 2;
	condition = DIA_Karras_KarrasBlessedStone_Condition;
	information = DIA_Karras_KarrasBlessedStone_Info;
	description = "Я принес несколько камней с благословенной земли.";
};


func int DIA_Karras_KarrasBlessedStone_Condition()
{
	if((hero.guild == GIL_KDF) && Npc_HasItems(other,ItMi_KarrasBlessedStone_Mis) && (MIS_Karras_FindBlessedStone == LOG_Running))
	{
		return TRUE;
	};
};


var int KarrasMakesBlessedStone_Day;

func void DIA_Karras_KarrasBlessedStone_Info()
{
	AI_Output(other,self,"DIA_Karras_KarrasBlessedStone_15_00");	//Я принес несколько камней с благословенной земли.
	B_GiveInvItems(other,self,ItMi_KarrasBlessedStone_Mis,1);
	AI_Output(self,other,"DIA_Karras_KarrasBlessedStone_10_01");	//Это хорошо. Надеюсь, все алтари по-прежнему стоят на своих местах.
	AI_Output(self,other,"DIA_Karras_KarrasBlessedStone_10_02");	//Хорошо. Я сделаю для тебя амулет, защищающий от черного взгляда темных магов.
	AI_Output(self,other,"DIA_Karras_KarrasBlessedStone_10_03");	//Дай мне немного времени. Над этим нужно поработать.
	KarrasMakesBlessedStone_Day = Wld_GetDay();
	MIS_Karras_FindBlessedStone = LOG_SUCCESS;
	B_LogEntry(TOPIC_DEMENTOREN,"Каррас даст мне амулет, который будет защищать меня от ментальных атак темных магов. Это должно сильно облегчить мне жизнь.");
	B_GivePlayerXP(XP_Karras_FoundBlessedStone);
	AI_StopProcessInfos(self);
};


instance DIA_Karras_ItAm_Prot_BlackEye_Mis(C_Info)
{
	npc = KDF_503_Karras;
	nr = 2;
	condition = DIA_Karras_ItAm_Prot_BlackEye_Mis_Condition;
	information = DIA_Karras_ItAm_Prot_BlackEye_Mis_Info;
	permanent = TRUE;
	description = "Так как насчет защитного амулета, что ты обещал мне?";
};


var int DIA_Karras_ItAm_Prot_BlackEye_Mis_NoPerm;

func int DIA_Karras_ItAm_Prot_BlackEye_Mis_Condition()
{
	if((hero.guild == GIL_KDF) && (MIS_Karras_FindBlessedStone == LOG_SUCCESS) && (DIA_Karras_ItAm_Prot_BlackEye_Mis_NoPerm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Karras_ItAm_Prot_BlackEye_Mis_Info()
{
	AI_Output(other,self,"DIA_Karras_ItAm_Prot_BlackEye_Mis_15_00");	//Так как насчет защитного амулета, что ты обещал мне?
	if(KarrasMakesBlessedStone_Day <= (Wld_GetDay() - 2))
	{
		AI_Output(self,other,"DIA_Karras_ItAm_Prot_BlackEye_Mis_10_01");	//Я закончил. Вот, взгляни. Он получился очень изящным.
		CreateInvItems(self,ItAm_Prot_BlackEye_Mis,1);
		B_GiveInvItems(self,other,ItAm_Prot_BlackEye_Mis,1);
		AI_Output(self,other,"DIA_Karras_ItAm_Prot_BlackEye_Mis_10_02");	//Носи его, не снимая, и темные странники не смогут затянуть тебя в свою ментальную пропасть.
		AI_Output(other,self,"DIA_Karras_ItAm_Prot_BlackEye_Mis_15_03");	//Спасибо.
		B_LogEntry(TOPIC_DEMENTOREN,"Каррас дал мне амулет, который будет защищать меня от черного взгляда темных странников.");
		DIA_Karras_ItAm_Prot_BlackEye_Mis_NoPerm = TRUE;
		B_GivePlayerXP(XP_Ambient);
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_ItAm_Prot_BlackEye_Mis_10_04");	//Спокойствие. Я все еще работаю над ним.
	};
};


instance DIA_Karras_KAP4_EXIT(C_Info)
{
	npc = KDF_503_Karras;
	nr = 999;
	condition = DIA_Karras_KAP4_EXIT_Condition;
	information = DIA_Karras_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Karras_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Karras_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Karras_KAP5_EXIT(C_Info)
{
	npc = KDF_503_Karras;
	nr = 999;
	condition = DIA_Karras_KAP5_EXIT_Condition;
	information = DIA_Karras_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Karras_KAP5_EXIT_Condition()
{
	if(Kapitel >= 5)
	{
		return TRUE;
	};
};

func void DIA_Karras_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Karras_PICKPOCKET(C_Info)
{
	npc = KDF_503_Karras;
	nr = 900;
	condition = DIA_Karras_PICKPOCKET_Condition;
	information = DIA_Karras_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Karras_PICKPOCKET_Condition()
{
	return C_Beklauen(49,35);
};

func void DIA_Karras_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Karras_PICKPOCKET);
	Info_AddChoice(DIA_Karras_PICKPOCKET,Dialog_Back,DIA_Karras_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Karras_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Karras_PICKPOCKET_DoIt);
};

func void DIA_Karras_PICKPOCKET_DoIt()
{
	B_Beklauen();
	INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
	Info_ClearChoices(DIA_Karras_PICKPOCKET);
};

func void DIA_Karras_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Karras_PICKPOCKET);
};


instance DIA_KARRAS_KILLIGNAZ(C_Info)
{
	npc = KDF_503_Karras;
	nr = 2;
	condition = dia_karras_killignaz_condition;
	information = dia_karras_killignaz_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_karras_killignaz_condition()
{
	if((MIS_KILLIGNAZ == LOG_Running) && (READORTEGO == TRUE) && (Npc_GetDistToWP(self,"NW_CITY_SMFOREST_09") < 2000))
	{
		return TRUE;
	};
};

func void dia_karras_killignaz_info()
{
	B_GivePlayerXP(500);
	AI_Output(self,other,"DIA_Karras_KillIgnaz_01_00");	//(вкрадчиво) Ты здесь, Ортего? Это хорошо. Тогда не будем терять времени.
	AI_Output(other,self,"DIA_Karras_KillIgnaz_01_01");	//Подожди. Я не Ортего.
	AI_Output(self,other,"DIA_Karras_KillIgnaz_01_02");	//Что?! То есть как? Кто ты?
	AI_Output(other,self,"DIA_Karras_KillIgnaz_01_03");	//Я тот, кто отправил твоего дружка на тот свет.
	AI_Output(other,self,"DIA_Karras_KillIgnaz_01_05");	//Не думал, что маги Огня занимаются такими вещами. Может, объяснишь, что здесь происходит?
	AI_Output(self,other,"DIA_Karras_KillIgnaz_01_06");	//Постой...(взволнованно) Это было просто необходимостью! Мы не могли поступить иначе.
	AI_Output(self,other,"DIA_Karras_KillIgnaz_01_08");	//Этот безумец мог бы поставить под угрозу саму суть магии и всего того, что с этим связано.
	AI_Output(self,other,"DIA_Karras_KillIgnaz_01_09");	//Кроме этого, до меня также дошли слухи, что Игнац ставил некоторые свои эксперименты на людях. А это уже слишком!
	AI_Output(self,other,"DIA_Karras_KillIgnaz_01_10");	//Поэтому наш орден и принял подобное решение, хотя это было и не так легко, как тебе может показаться.
	AI_Output(other,self,"DIA_Karras_KillIgnaz_01_11");	//Хочешь сказать, что все маги Огня в курсе этого?
	AI_Output(self,other,"DIA_Karras_KillIgnaz_01_12");	//Этого я тебе не скажу. Ты и так слишком много узнал!
	AI_Output(self,other,"DIA_Karras_KillIgnaz_01_15");	//Это решать только тебе! И думаю, что будет правильным, если ты не станешь никому рассказывать о нашей встрече.
	AI_Output(self,other,"DIA_Karras_KillIgnaz_01_16");	//Уверен, что не многие поверят твоим словам.
	KARRASTELLABOUTIGNAZ = TRUE;
	B_LogEntry(TOPIC_KILLIGNAZ,"Мне удалось выяснить, кто на самом деле стоял за убийством Игнаца. Это были маги Огня! Они посчитали его исследования слишком опасными и неугодными их вере, тем самым предопределив участь бедняги. Теперь мне стоит подумать, как быть дальше, ибо правда, которую я узнал, может оказаться никому не нужной в подобной ситуации.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(KDF_503_Karras,"Start");
};


instance DIA_KARRAS_KILLIGNAZ_AFTER(C_Info)
{
	npc = KDF_503_Karras;
	nr = 2;
	condition = dia_karras_killignaz_after_condition;
	information = dia_karras_killignaz_after_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_karras_killignaz_after_condition()
{
	if((MIS_KILLIGNAZ == LOG_SUCCESS) && (KARRASTELLABOUTIGNAZ == TRUE))
	{
		return TRUE;
	};
};

func void dia_karras_killignaz_after_info()
{
	if(TELLANDRETRUTH == TRUE)
	{
		B_GivePlayerXP(200);
		AI_Output(self,other,"DIA_Karras_KillIgnaz_After_01_00");	//Значит, ты все-таки решил рассказать лорду Андрэ о нашей встрече.
		AI_Output(other,self,"DIA_Karras_KillIgnaz_After_01_01");	//По-другому я поступить не мог.
		AI_Output(self,other,"DIA_Karras_KillIgnaz_After_01_02");	//Хммм...(с укором) Хорошо, дело твое! Но мне кажется, это было все-таки не слишком умно с твоей стороны.
		if(INNOSPRAYCOUNT >= 10)
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 10;
		}
		else
		{
			INNOSPRAYCOUNT = 0;
		};
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_KillIgnaz_After_01_07");	//Значит, ты все-таки не стал рассказывать лорду Андрэ о нашей встрече.
		AI_Output(self,other,"DIA_Karras_KillIgnaz_After_01_09");	//Это было мудрым решением с твоей стороны.
		AI_Output(self,other,"DIA_Karras_KillIgnaz_After_01_10");	//Ибо настоящая правда иногда может принести куда больше зла, нежели чем просто небольшая ложь.
		AI_Output(self,other,"DIA_Karras_KillIgnaz_After_01_11");	//Вот, прими в знак моей благодарности этот небольшой дар. Думаю, ты его заслужил.
		B_GiveInvItems(self,other,ItPo_Perm_Mana,1);
		AI_Output(other,self,"DIA_Karras_KillIgnaz_After_01_12");	//Да? Ну что же, спасибо. Хотя я и не ожидал.
		AI_Output(self,other,"DIA_Karras_KillIgnaz_After_01_13");	//Пути Инноса не исповедимы, сын мой...(улыбаясь) А теперь ступай и пусть он хранит тебя!
		AI_StopProcessInfos(self);
	};
};


instance DIA_KARRAS_RUNEMAGICNOTWORK(C_Info)
{
	npc = KDF_503_Karras;
	nr = 1;
	condition = dia_karras_runemagicnotwork_condition;
	information = dia_karras_runemagicnotwork_info;
	permanent = FALSE;
	description = "Твои магические руны - они все еще работают?";
};


func int dia_karras_runemagicnotwork_condition()
{
	if((STOPBIGBATTLE == TRUE) && (MIS_RUNEMAGICNOTWORK == LOG_Running) && (FIREMAGERUNESNOT == FALSE))
	{
		return TRUE;
	};
};

func void dia_karras_runemagicnotwork_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Karras_RuneMagicNotWork_01_00");	//Твои магические руны - они все еще работают?
	AI_Output(self,other,"DIA_Karras_RuneMagicNotWork_01_01");	//В том то и дело, что нет. И я никак не пойму причину, по которой не могу их использовать!
	AI_Output(self,other,"DIA_Karras_RuneMagicNotWork_01_03");	//По всей видимости, это коснулось нас всех! У других магов Огня тоже ничего не получается сделать.
	AI_Output(other,self,"DIA_Karras_RuneMagicNotWork_01_04");	//Понятно.
	B_LogEntry(TOPIC_RUNEMAGICNOTWORK,"Рунические камни остальных Магов Огня тоже потеряли свою силу.");
	FIREMAGERUNESNOT = TRUE;
};


instance DIA_Karras_HelpBooks(C_Info)
{
	npc = KDF_503_Karras;
	nr = 2;
	condition = DIA_Karras_HelpBooks_condition;
	information = DIA_Karras_HelpBooks_info;
	permanent = FALSE;
	description = "Пирокар послал меня к тебе...";
};

func int DIA_Karras_HelpBooks_condition()
{
	if(MIS_KARRAS_BOOKS == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Karras_HelpBooks_info()
{
	AI_Output(other,self,"DIA_Karras_HelpBooks_0131_012");	//Пирокар послал меня к тебе...
	AI_Output(self,other,"DIA_Karras_HelpBooks_01_01");	//Я как раз тебя искал, послушник.
	AI_Output(self,other,"DIA_Karras_HelpBooks_01_02");	//Я уже слышал, что тебе удалось пройти Испытание - и это невероятно!
	AI_Output(self,other,"DIA_Karras_HelpBooks_01_03");	//И именно поэтому для моего поручения подойдешь только ты.
	AI_Output(self,other,"DIA_Karras_HelpBooks_01_04");	//В данный момент я изучаю труды наших предков - древних магов Хориниса.
	AI_Output(self,other,"DIA_Karras_HelpBooks_01_05");	//Они тоже служили Инносу, но многие их обряды мне не понятны, а многие, вероятно, и вовсе неизвестны.
	AI_Output(self,other,"DIA_Karras_HelpBooks_01_06");	//Судя по всему, их магия сильно отличалась от той, к которой привыкли мы...
	AI_Output(self,other,"DIA_Karras_HelpBooks_01_07");	//Я собрал уже достаточно много сведений...
	AI_Output(self,other,"DIA_Karras_HelpBooks_01_08");	//И точно знаю, что некоторые из нужных мне книг до сих пор находятся где-то в Хоринисе.
	AI_Output(self,other,"DIA_Karras_HelpBooks_01_09");	//К сожалению, я не могу тебе подсказать, где их можно найти, но очень надеюсь на твою сообразительность и знание острова.
	AI_Output(self,other,"DIA_Karras_HelpBooks_01_10");	//Тебе нужно найти пять книг и свиток с пояснениями к ним. Без него было бы трудно понять написанное.
	B_LogEntry(TOPIC_HELPKARRASBOOKS,"Каррас рассказал мне о древних магах, некогда живших на острове Хоринис. Мне необходимо найти пять книг, оставленных этими людьми, а также некий свиток с пояснениями к книгам. Никаких подсказок, где искать эти книги, мне, конечно же, не смогли дать - придется действовать вслепую и надеяться на свою интуицию.");
};

instance DIA_Karras_HelpBooks_Ok(C_Info)
{
	npc = KDF_503_Karras;
	nr = 2;
	condition = DIA_Karras_HelpBooks_Ok_condition;
	information = DIA_Karras_HelpBooks_Ok_info;
	permanent = FALSE;
	description = "Я нашел книги и свиток.";
};

func int DIA_Karras_HelpBooks_Ok_condition()
{
	if((MIS_KARRAS_BOOKS == LOG_Running) && Npc_HasItems(hero,itwr_oldbook1) && Npc_HasItems(hero,itwr_oldbook2) && Npc_HasItems(hero,itwr_oldbook3) && Npc_HasItems(hero,itwr_oldbook4) && Npc_HasItems(hero,itwr_oldbook5) && Npc_HasItems(hero,itwr_oldbook6))
	{
		return TRUE;
	};
};

func void DIA_Karras_HelpBooks_Ok_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self,"DIA_Karras_HelpBooks_Ok_01_01");	//Я нашел книги и свиток.
	AI_Output(self,other,"DIA_Karras_HelpBooks_Ok_01_02");	//(удивленно) Не может быть! Покажи.
	B_GiveInvItemsManyThings(other,self);
	Npc_RemoveInvItems(other,itwr_oldbook1,1);
	Npc_RemoveInvItems(other,itwr_oldbook2,1);
	Npc_RemoveInvItems(other,itwr_oldbook3,1);
	Npc_RemoveInvItems(other,itwr_oldbook4,1);
	Npc_RemoveInvItems(other,itwr_oldbook5,1);
	Npc_RemoveInvItems(other,itwr_oldbook6,1);
	AI_Output(self,other,"DIA_Karras_HelpBooks_Ok_01_03");	//О Иннос, ты сделал это! Хотя, наверняка, даже не представляешь, насколько интересные и важные сведения мы получим из этих фолиантов.
	AI_Output(other,self,"DIA_Karras_HelpBooks_Ok_01_04");	//Может, поделишься потом со мной своими знаниями?
	AI_Output(self,other,"DIA_Karras_HelpBooks_Ok_01_05");	//Как знать, как знать...(ехидно) Иди к Пирокару, он уже с нетерпением ждет твоего посвящения в Круг Огня! А пока прими от меня этот рунный камень, он тебе точно пригодится.
	B_GiveInvItems(self,other,ItMi_RuneBlank,1);
	MIS_KARRAS_BOOKS = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_HELPKARRASBOOKS,LOG_SUCCESS);
	B_LogEntry(TOPIC_HELPKARRASBOOKS,"Мне наконец-то удалось отыскать все древние фолианты, чему и я, и, главное, Каррас, несказанно рады. Содержание этих книг, видимо, останется для меня загадкой, по крайней мере, пока...");
};