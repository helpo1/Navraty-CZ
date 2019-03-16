
instance DIA_Abuyin_EXIT(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 999;
	condition = DIA_Abuyin_EXIT_Condition;
	information = DIA_Abuyin_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Abuyin_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Abuyin_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Abuyin_PICKPOCKET(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 900;
	condition = DIA_Abuyin_PICKPOCKET_Condition;
	information = DIA_Abuyin_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Abuyin_PICKPOCKET_Condition()
{
	return C_Beklauen(75,200);
};

func void DIA_Abuyin_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Abuyin_PICKPOCKET);
	Info_AddChoice(DIA_Abuyin_PICKPOCKET,Dialog_Back,DIA_Abuyin_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Abuyin_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Abuyin_PICKPOCKET_DoIt);
};

func void DIA_Abuyin_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Abuyin_PICKPOCKET);
};

func void DIA_Abuyin_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Abuyin_PICKPOCKET);
};


instance DIA_Abuyin_Hallo(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Hallo_Condition;
	information = DIA_Abuyin_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Abuyin_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Hallo_Info()
{
	AI_Output(self,other,"DIA_Addon_Abuyin_Hallo_13_00");	//Как странно...(задумчиво) Мне кажется, что мы с тобой уже встречались, путник.
	AI_Output(self,other,"DIA_Addon_Abuyin_Hallo_13_01");	//Что же, велики загадки нашего мира... О, прошу простить мою грубость, сын терпения, я даже не поприветствовал тебя.
	AI_Output(self,other,"DIA_Addon_Abuyin_Hallo_13_02");	//Добро пожаловать, друг мой, присядь на мой скромный ковер и выкури трубку, наслаждаясь покоем.
};


instance DIA_Abuyin_du(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_du_Condition;
	information = DIA_Abuyin_du_Info;
	permanent = FALSE;
	description = "Кто ты?";
};


func int DIA_Abuyin_du_Condition()
{
	return TRUE;
};

func void DIA_Abuyin_du_Info()
{
	AI_Output(other,self,"DIA_Abuyin_du_15_00");	//Кто ты?
	AI_Output(self,other,"DIA_Abuyin_du_13_01");	//Меня зовут Абуин ибн Джадир ибн Омар Халид бен Хаджи аль Шариди. Я пророк и предсказатель, астролог и торговец табаком.
};


instance DIA_Abuyin_Kraut(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Kraut_Condition;
	information = DIA_Abuyin_Kraut_Info;
	permanent = FALSE;
	description = "Что за табак ты предлагаешь?";
};


func int DIA_Abuyin_Kraut_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Abuyin_du))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Kraut_Info()
{
	AI_Output(other,self,"DIA_Abuyin_Kraut_15_00");	//Что за табак ты предлагаешь?
	AI_Output(self,other,"DIA_Abuyin_Kraut_13_01");	//Мои трубки набиты острым, освежающим яблочным табаком.
	AI_Output(self,other,"DIA_Abuyin_Kraut_13_02");	//Выбирай, что хочешь, Сын Приключений.
};


instance DIA_Abuyin_anderen(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_anderen_Condition;
	information = DIA_Abuyin_anderen_Info;
	permanent = FALSE;
	description = "А у тебя есть другой табак?";
};


func int DIA_Abuyin_anderen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Abuyin_Kraut))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_anderen_Info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Abuyin_anderen_15_00");	//А у тебя есть другой табак?
	AI_Output(self,other,"DIA_Abuyin_anderen_13_01");	//Я предлагаю только лучший табак. Эта яблочная смесь - симфония моей родины - южных островов.
	AI_Output(self,other,"DIA_Abuyin_anderen_13_02");	//Но, конечно же, я всегда готов попробовать другой сорт табака - если кто-нибудь сумеет приготовить действительно хороший табак.
	AI_Output(other,self,"DIA_Abuyin_anderen_15_03");	//А как это делается?
	AI_Output(self,other,"DIA_Abuyin_anderen_13_04");	//Возьми за основу яблочный табак. И попробуй добавлять в него различные ингредиенты.
	AI_Output(self,other,"DIA_Abuyin_anderen_13_05");	//Это делается на алхимическом столе, если, конечно ты имеешь навыки в алхимии.
	AbuyinTellTabak = TRUE;
	Log_CreateTopic(TOPIC_TalentAlchemy,LOG_NOTE);
	B_LogEntry(TOPIC_TalentAlchemy,"Абуин рассказал мне, как можно получить новый сорт табака. Для этого мне нужно взять за основу яблочный табак и смешать на алхимическом столе его с каким-нибудь другим компонентом.");
};


instance DIA_Abuyin_Woher(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Woher_Condition;
	information = DIA_Abuyin_Woher_Info;
	permanent = FALSE;
	description = "Где мне взять яблочный табак?";
};


func int DIA_Abuyin_Woher_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Abuyin_anderen))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Woher_Info()
{
	AI_Output(other,self,"DIA_Abuyin_Woher_15_00");	//Где мне взять яблочный табак?
	AI_Output(self,other,"DIA_Abuyin_Woher_13_01");	//Я дам тебе две порции. А там делай с ними, что тебе захочется.
	AI_Output(self,other,"DIA_Abuyin_Woher_13_02");	//Если тебе понадобится еще табак, то направь свои стопы к Зурису, Мастеру Зелий. Он производит это табак и продает его.
	B_GiveInvItems(self,other,ItMi_ApfelTabak,2);
};

func void B_TabakProbieren()
{
	AI_Output(self,other,"DIA_Abuyin_Mischung_Nichts_13_00");	//Позволь мне попробовать твой табак.
	CreateInvItems(self,ItMi_Joint,1);
	B_UseItem(self,ItMi_Joint);
	AI_Output(self,other,"DIA_Abuyin_Mischung_Nichts_13_01");	//Нет, этот аромат мне не очень нравится. Но, может быть, ты найдешь кого-нибудь, кто оценит его... э-э... утонченность.
};

var int Test_SumpfTabak;
var int Test_PilzTabak;
var int Test_DoppelTabak;
var int Test_Honigtabak;
var int Test_Hasish;

instance DIA_Abuyin_Mischung(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 10;
	condition = DIA_Abuyin_Mischung_Condition;
	information = DIA_Abuyin_Mischung_Info;
	permanent = TRUE;
	description = "Я принес новый сорт табака...";
};

func int DIA_Abuyin_Mischung_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Abuyin_anderen) && (Abuyin_DoneSpiltz == FALSE) && ((Npc_HasItems(other,ItMi_SumpfTabak) >= 1) || (Npc_HasItems(other,ItMi_PilzTabak) >= 1) || (Npc_HasItems(other,ItMi_Hasish) >= 1) || (Npc_HasItems(other,ItMi_DoppelTabak) >= 1) || (Npc_HasItems(other,ItMi_Honigtabak) >= 1)))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Mischung_Info()
{
	AI_Output(other,self,"DIA_Abuyin_Mischung_15_00");	//Я принес новый сорт табака...
	Info_ClearChoices(DIA_Abuyin_Mischung);

	Info_AddChoice(DIA_Abuyin_Mischung,Dialog_Back,DIA_Abuyin_Mischung_BACK);

	if((Npc_HasItems(other,ItMi_SumpfTabak) >= 1) && (Test_SumpfTabak == FALSE))
	{
		Info_AddChoice(DIA_Abuyin_Mischung,PRINT_KRAUT,DIA_Abuyin_Mischung_Sumpf);
	};
	if((Npc_HasItems(other,ItMi_PilzTabak) >= 1) && (Test_PilzTabak == FALSE))
	{
		Info_AddChoice(DIA_Abuyin_Mischung,PRINT_PILZ,DIA_Abuyin_Mischung_Pilz);
	};
	if((Npc_HasItems(other,ItMi_DoppelTabak) >= 1) && (Test_DoppelTabak == FALSE))
	{
		Info_AddChoice(DIA_Abuyin_Mischung,PRINT_DOPPEL,DIA_Abuyin_Mischung_Doppel);
	};
	if((Npc_HasItems(other,ItMi_Honigtabak) >= 1) && (Test_Honigtabak == FALSE))
	{
		Info_AddChoice(DIA_Abuyin_Mischung,PRINT_HONIG,DIA_Abuyin_Mischung_Super);
	};
	if((Npc_HasItems(other,ItMi_Hasish) >= 1) && (Test_Hasish == FALSE))
	{
		Info_AddChoice(DIA_Abuyin_Mischung,PRINT_GANDJA,DIA_Abuyin_Mischung_MegaSuper);
	};
};

func void DIA_Abuyin_Mischung_BACK()
{
	Info_ClearChoices(DIA_Abuyin_Mischung);
};

func void DIA_Abuyin_Mischung_Sumpf()
{
	B_GiveInvItems(other,self,ItMi_SumpfTabak,1);
	Test_SumpfTabak = TRUE;
	B_TabakProbieren();
	Info_ClearChoices(DIA_Abuyin_Mischung);
};

func void DIA_Abuyin_Mischung_Pilz()
{
	B_GiveInvItems(other,self,ItMi_PilzTabak,1);
	Test_PilzTabak = TRUE;
	B_TabakProbieren();
	Info_ClearChoices(DIA_Abuyin_Mischung);
};

func void DIA_Abuyin_Mischung_Doppel()
{
	B_GiveInvItems(other,self,ItMi_DoppelTabak,1);
	Test_DoppelTabak = TRUE;
	B_TabakProbieren();
	Info_ClearChoices(DIA_Abuyin_Mischung);
};

func void DIA_Abuyin_Mischung_Super()
{
	B_GiveInvItems(other,self,ItMi_Honigtabak,1);
	AI_Output(self,other,"DIA_Abuyin_Mischung_Super_13_00");	//Давай я попробую твой табак.
	CreateInvItems(self,ItMi_Joint,1);
	B_UseItem(self,ItMi_Joint);
	AI_Output(self,other,"DIA_Abuyin_Mischung_Super_13_01");	//Это невероятно! В жизни ничего подобного не пробовал!
	AI_Output(self,other,"DIA_Abuyin_Mischung_Super_13_02");	//Как ты приготовил его?
	AI_Output(other,self,"DIA_Abuyin_Mischung_Super_15_03");	//Я смешал обычный табак с медом.
	AI_Output(self,other,"DIA_Abuyin_Mischung_Super_13_04");	//Ты хорошо поработал, о, Отец Искусства Смешения. Я с превеликим удовольствием набью им свои презренные трубки.
	AI_Output(other,self,"DIA_Abuyin_Mischung_Super_15_05");	//Ну, набей.
	AI_Output(self,other,"DIA_Abuyin_Mischung_Super_13_06");	//Спасибо тебе, о, Сын Великодушия. Ни одна другая смесь не сравнится с твоим творением. Я готов покупать все, что ты сможешь принести мне.
	Abuyin_Honigtabak = TRUE;
	Test_Honigtabak = TRUE;

	if((Abuyin_Hasish == TRUE) && (Abuyin_Honigtabak == TRUE))
	{
		Abuyin_DoneSpiltz = TRUE;
	};

	B_GivePlayerXP(XP_Ambient * 2);
	Info_ClearChoices(DIA_Abuyin_Mischung);
};

func void DIA_Abuyin_Mischung_MegaSuper()
{
	AI_Output(self,other,"DIA_Abuyin_Mischung_MegaSuper_13_00");	//(с недоверием) Что это такое?
	AI_Output(other,self,"DIA_Abuyin_Mischung_MegaSuper_13_01");	//Попробуй! Тебе понравится.
	AI_Output(self,other,"DIA_Abuyin_Mischung_MegaSuper_13_02");	//Ну хорошо, давай сюда.
	B_GiveInvItems(other,self,ItMi_Hasish,1);
	Npc_RemoveInvItems(self,ItMi_Hasish,1);	
	CreateInvItems(self,itmi_specialjoint,1);
	Abuyin_Hasish = TRUE;
	Test_Hasish = TRUE;

	if((Abuyin_Hasish == TRUE) && (Abuyin_Honigtabak == TRUE))
	{
		Abuyin_DoneSpiltz = TRUE;
	};

	AI_StopProcessInfos(self);

	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};
	AI_UseItem(self,itmi_specialjoint);
	Npc_SetRefuseTalk(self,5);
	hero.aivar[AIV_INVINCIBLE] = FALSE;
};

instance DIA_Abuyin_Mischung_MegaSuper_Ok(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Mischung_MegaSuper_Ok_Condition;
	information = DIA_Abuyin_Mischung_MegaSuper_Ok_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Abuyin_Mischung_MegaSuper_Ok_Condition()
{
	if(Abuyin_Hasish == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Mischung_MegaSuper_Ok_Info()
{
	B_GivePlayerXP(XP_Ambient * 5);
	AI_Output(self,other,"DIA_Abuyin_Mischung_MegaSuper_Ok_13_03");	//Эээ...(приходя в себя) Что это было? И как ты его приготовил?
	AI_Output(other,self,"DIA_Abuyin_Mischung_MegaSuper_Ok_13_04");	//Пусть это останется моим маленьким секретом.
	AI_Output(self,other,"DIA_Abuyin_Mischung_MegaSuper_Ok_15_05");	//Парень, еще ни разу в жизни я не испытывал столь невероятных ощущений!
	AI_Output(other,self,"DIA_Abuyin_Mischung_MegaSuper_Ok_13_06");	//Ну, тогда можешь оставить его весь себе.
	AI_Output(self,other,"DIA_Abuyin_Mischung_MegaSuper_Ok_15_07");	//Уж не премину это сделать. М-да, забавная вещица!
	AI_Output(self,other,"DIA_Abuyin_Mischung_MegaSuper_Ok_15_08");	//Только смотри, больше никому ее не предлагай! А то мало ли...
};

instance DIA_Abuyin_Trade(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Trade_Condition;
	information = DIA_Abuyin_Trade_Info;
	permanent = TRUE;
	description = "Я принес тебе медового табака.";
};

func int DIA_Abuyin_Trade_Condition()
{
	if((Abuyin_Honigtabak == TRUE) && (Npc_HasItems(other,ItMi_Honigtabak) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Trade_Info()
{
	var int TabakExp;

	Abuyin_Score = FALSE;
	Abuyin_Score = Npc_HasItems(other,ItMi_Honigtabak) * VALUE_ItMi_HonigTabak;
	TabakExp = FALSE;
	TabakExp = Npc_HasItems(other,ItMi_Honigtabak);

	B_GivePlayerXP(TabakExp * 50);
	AI_Output(other,self,"DIA_Abuyin_Trade_15_00");	//Я принес тебе медового табака.
	B_GiveInvItems(other,self,ItMi_Honigtabak,Npc_HasItems(other,ItMi_Honigtabak));
	Npc_RemoveInvItems(self,ItMi_Honigtabak,Npc_HasItems(self,ItMi_Honigtabak));	
	AI_Output(self,other,"DIA_Abuyin_Trade_13_01");	//Для меня огромное удовольствие иметь с тобой дело.
	B_GiveInvItems(self,other,ItMi_Gold,Abuyin_Score);
};

instance DIA_Abuyin_Herb(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Herb_Condition;
	information = DIA_Abuyin_Herb_Info;
	permanent = FALSE;
	description = "Тебя не заинтересует этот тюк травы?";
};

func int DIA_Abuyin_Herb_Condition()
{
	if(Npc_HasItems(other,ItMi_HerbPaket) >= 1)
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Herb_Info()
{
	AI_Output(other,self,"DIA_Abuyin_Herb_15_00");	//Тебя не заинтересует этот тюк травы?
	AI_Output(self,other,"DIA_Abuyin_Herb_13_01");	//Тюк трав - это не болотная трава, нет? Ох, убери ее, о, Сын Недальновидности.
	AI_Output(self,other,"DIA_Abuyin_Herb_13_02");	//Если городская стража увидит ее у меня, они бросят меня в тюрьму - а тебя будет ждать не лучшая судьба!
	AI_Output(self,other,"DIA_Abuyin_Herb_13_03");	//Если тебе так хочется продать эту траву, послушай моего совета - покинь этот город.
	AI_Output(self,other,"DIA_Abuyin_Herb_13_04");	//Попробуй избавиться от нее где-нибудь за пределами городских стен. А здесь тебя ждет с ней одна головная боль.
};

instance DIA_Abuyin_Weissagung(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Weissagung_Condition;
	information = DIA_Abuyin_Weissagung_Info;
	permanent = FALSE;
	description = "Ты можешь сделать пророчество?";
};


func int DIA_Abuyin_Weissagung_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Abuyin_du) && (Kapitel == 1))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Weissagung_Info()
{
	AI_Output(other,self,"DIA_Abuyin_Weissagung_15_00");	//Ты можешь сделать пророчество?
	AI_Output(self,other,"DIA_Abuyin_Weissagung_13_01");	//Я к твоим услугам за скромное вознаграждение, о, Отец Щедрости.
	AI_Output(other,self,"DIA_Abuyin_Weissagung_15_02");	//Сколько ты хочешь?
	AI_Output(self,other,"DIA_Abuyin_Weissagung_13_03");	//За какие-то двадцать пять монет, я рискну заглянуть для тебя в будущее.
	AI_Output(self,other,"DIA_Abuyin_Weissagung_13_04");	//Но помни - будущее всегда неопределенно. Все, что в моих силах - это уловить лишь крошечные фрагменты времени.
};


instance DIA_Abuyin_Zukunft(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Zukunft_Condition;
	information = DIA_Abuyin_Zukunft_Info;
	permanent = TRUE;
	description = "Расскажи мне о будущем. (Цена: 25 монет)";
};


var int DIA_Abuyin_Zukunft_permanent;

func int DIA_Abuyin_Zukunft_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Abuyin_Weissagung) && (DIA_Abuyin_Zukunft_permanent == FALSE) && (Kapitel == 1))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Zukunft_Info()
{
	AI_Output(other,self,"DIA_Abuyin_Zukunft_15_00");	//Расскажи мне о будущем.

	if(B_GiveInvItems(other,self,ItMi_Gold,25))
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft_13_01");	//Хорошо, о, Жаждущий Знаний. Я сейчас войду в состояние транса. Ты готов?
		Info_ClearChoices(DIA_Abuyin_Zukunft);
		Info_AddChoice(DIA_Abuyin_Zukunft,"Я готов.",DIA_Abuyin_Zukunft_Trance);
	}
	else
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft_13_02");	//О, Отец Монет, я прошу у тебя двадцать пять монет в обмен на взгляд в туманное будущее.
	};
};

func void DIA_Abuyin_Zukunft_Trance()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Abuyin_Zukunft_Trance_13_00");	//(в трансе) Орки...они охраняют вход...старый туннель...Долина Рудников...
	AI_Output(self,other,"DIA_Abuyin_Zukunft_Trance_13_01");	//(в трансе) Люди в сверкающих доспехах...маг...твой друг с ними...он ждет тебя...
	AI_Output(self,other,"DIA_Abuyin_Zukunft_Trance_13_02");	//(в трансе) Огонь! Нападение...могучего существа...пламя...многие...погибнут...
	AI_Output(self,other,"DIA_Addon_Abuyin_Zukunft_Trance_13_00");	//(в трансе)...Что это?..Город...Руины...Куарходрон из Яркендара...
	AI_Output(self,other,"DIA_Addon_Abuyin_Zukunft_Trance_13_01");	//(в трансе)...Он был призван...Куарходрон из Яркендара!
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Abuyin_Zukunft_Trance_13_03");	//... Извини - видение кончилось. Больше я ничего не смог увидеть.
	DIA_Abuyin_Zukunft_permanent = TRUE;
	Abuyin_Zukunft = 1;
	Info_ClearChoices(DIA_Abuyin_Zukunft);
	B_GivePlayerXP(XP_Ambient * 4);
};


instance DIA_Abuyin_Nochmal(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Nochmal_Condition;
	information = DIA_Abuyin_Nochmal_Info;
	permanent = TRUE;
	description = "Ты можешь дать мне еще одно пророчество?";
};


func int DIA_Abuyin_Nochmal_Condition()
{
	if(Kapitel == Abuyin_Zukunft)
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Nochmal_Info()
{
	AI_Output(other,self,"DIA_Abuyin_Nochmal_15_00");	//Ты можешь дать мне еще одно пророчество?
	AI_Output(self,other,"DIA_Abuyin_Nochmal_13_01");	//О, Сын Загадочного Будущего, сейчас я не в силах приподнять завесу времени.
	AI_Output(self,other,"DIA_Abuyin_Nochmal_13_02");	//Только когда время подаст мне очередной знак, я смогу помочь тебе еще раз.
	if(Abuyin_Erzaehlt == FALSE)
	{
		AI_Output(other,self,"DIA_Abuyin_Nochmal_15_03");	//А когда это будет?
		AI_Output(self,other,"DIA_Abuyin_Nochmal_13_04");	//Когда будущее станет настоящим, и ты продолжишь свой путь.
		Abuyin_Erzaehlt = TRUE;
	};
};

func void B_Abuyin_Weissagung()
{
	AI_Output(other,self,"B_Abuyin_Weissagung_15_00");	//Ты можешь сделать пророчество?
	AI_Output(self,other,"B_Abuyin_Weissagung_13_01");	//Да, время ушло вперед, и я могу сделать еще одно пророчество, если у тебя найдется несколько монет.
	AI_Output(other,self,"B_Abuyin_Weissagung_15_02");	//Сколько?
};


instance DIA_Abuyin_Weissagung2(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Weissagung2_Condition;
	information = DIA_Abuyin_Weissagung2_Info;
	permanent = FALSE;
	description = "Ты можешь сделать пророчество?";
};


func int DIA_Abuyin_Weissagung2_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Abuyin_du) && (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Weissagung2_Info()
{
	B_Abuyin_Weissagung();
	AI_Output(self,other,"DIA_Abuyin_Weissagung2_13_00");	//За какие-то сто монет, я рискну заглянуть для тебя в будущее.
};


instance DIA_Abuyin_Zukunft2(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Zukunft2_Condition;
	information = DIA_Abuyin_Zukunft2_Info;
	permanent = TRUE;
	description = "Расскажи мне о будущем. (Цена: 100 монет)";
};


var int DIA_Abuyin_Zukunft2_permanent;

func int DIA_Abuyin_Zukunft2_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Abuyin_Weissagung2) && (DIA_Abuyin_Zukunft2_permanent == FALSE) && (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Zukunft2_Info()
{
	AI_Output(other,self,"DIA_Abuyin_Zukunft2_15_00");	//Расскажи мне о будущем.
	if(B_GiveInvItems(other,self,ItMi_Gold,100))
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft2_13_01");	//Хорошо, о, Сын Мужества. Я сейчас войду в состояние транса. Ты готов?
		Info_ClearChoices(DIA_Abuyin_Zukunft2);
		Info_AddChoice(DIA_Abuyin_Zukunft2,"Я готов.",DIA_Abuyin_Zukunft2_Trance);
	}
	else
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft2_13_02");	//О, Отец Монет, я прошу у тебя сто золотых в обмен на взгляд в туманное будущее.
	};
};

func void DIA_Abuyin_Zukunft2_Trance()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Abuyin_Zukunft2_Trance_13_00");	//(в трансе) Наемник... ему нужен ты... ужасное убийство... Глаз...
	AI_Output(self,other,"DIA_Abuyin_Zukunft2_Trance_13_01");	//(в трансе) Зловещие приспешники... они идут... ищут тебя... страж падет...
	AI_Output(self,other,"DIA_Abuyin_Zukunft2_Trance_13_02");	//(в трансе) ...но трое должны объединиться... только тогда ты получишь то, что должно принадлежать тебе...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Abuyin_Zukunft2_Trance_13_03");	//Это все. Больше я ничего не смог увидеть.
	DIA_Abuyin_Zukunft2_permanent = TRUE;
	Abuyin_Zukunft = 2;
	Info_ClearChoices(DIA_Abuyin_Zukunft2);
	B_GivePlayerXP(XP_Ambient * 4);
};


instance DIA_Abuyin_Weissagung3(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Weissagung3_Condition;
	information = DIA_Abuyin_Weissagung3_Info;
	permanent = FALSE;
	description = "Ты можешь сделать пророчество?";
};


func int DIA_Abuyin_Weissagung3_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Abuyin_du) && (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Weissagung3_Info()
{
	B_Abuyin_Weissagung();
	AI_Output(self,other,"DIA_Abuyin_Weissagung3_13_00");	//За какие-то двести пятьдесят монет, я рискну заглянуть для тебя в будущее.
};


instance DIA_Abuyin_Zukunft3(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Zukunft3_Condition;
	information = DIA_Abuyin_Zukunft3_Info;
	permanent = TRUE;
	description = "Расскажи мне о будущем. (Цена: 250 монет)";
};


var int DIA_Abuyin_Zukunft3_permanent;

func int DIA_Abuyin_Zukunft3_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Abuyin_Weissagung3) && (DIA_Abuyin_Zukunft3_permanent == FALSE) && (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Zukunft3_Info()
{
	AI_Output(other,self,"DIA_Abuyin_Zukunft3_15_00");	//Расскажи мне о будущем.
	if(B_GiveInvItems(other,self,ItMi_Gold,250))
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft3_13_01");	//Хорошо, о, Сын Знаний. Я сейчас войду в состояние транса. Ты готов?
		Info_ClearChoices(DIA_Abuyin_Zukunft3);
		Info_AddChoice(DIA_Abuyin_Zukunft3,"Я готов.",DIA_Abuyin_Zukunft3_Trance);
	}
	else
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft3_13_02");	//О, Отец Монет, я прошу у тебя двухсот пятидесяти золотых в обмен на взгляд в туманное будущее.
	};
};

func void DIA_Abuyin_Zukunft3_Trance()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Abuyin_Zukunft3_Trance_13_00");	//(в трансе) Ты должен пробиться... это суждено только тебе...
	AI_Output(self,other,"DIA_Abuyin_Zukunft3_Trance_13_01");	//(в трансе) ...сквозь огонь и снег... сквозь лед и пламя...
	AI_Output(self,other,"DIA_Abuyin_Zukunft3_Trance_13_02");	//(в трансе) Люди в странных доспехах... болото... ящеры... они ждут тебя...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Abuyin_Zukunft3_Trance_13_03");	//Это все. Больше я ничего не смог увидеть.
	DIA_Abuyin_Zukunft3_permanent = TRUE;
	Abuyin_Zukunft = 3;
	Info_ClearChoices(DIA_Abuyin_Zukunft3);
	B_GivePlayerXP(XP_Ambient * 4);
};


instance DIA_Abuyin_Weissagung4(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Weissagung4_Condition;
	information = DIA_Abuyin_Weissagung4_Info;
	permanent = FALSE;
	description = "Ты можешь сделать пророчество?";
};


func int DIA_Abuyin_Weissagung4_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Abuyin_du) && (Kapitel == 4))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Weissagung4_Info()
{
	B_Abuyin_Weissagung();
	AI_Output(self,other,"DIA_Abuyin_Weissagung4_13_00");	//За какие-то пятьсот монет, я рискну заглянуть для тебя в будущее.
};


instance DIA_Abuyin_Zukunft4(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Zukunft4_Condition;
	information = DIA_Abuyin_Zukunft4_Info;
	permanent = TRUE;
	description = "Расскажи мне о будущем. (Цена: 500 монет)";
};


var int DIA_Abuyin_Zukunft4_permanent;

func int DIA_Abuyin_Zukunft4_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Abuyin_Weissagung4) && (DIA_Abuyin_Zukunft4_permanent == FALSE) && (Kapitel == 4))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Zukunft4_Info()
{
	AI_Output(other,self,"DIA_Abuyin_Zukunft4_15_00");	//Расскажи мне о будущем.
	if(B_GiveInvItems(other,self,ItMi_Gold,500))
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft4_13_01");	//Хорошо, о, Сын Знаний. Я сейчас войду в состояние транса. Ты готов?
		Info_ClearChoices(DIA_Abuyin_Zukunft4);
		Info_AddChoice(DIA_Abuyin_Zukunft4,"Я готов.",DIA_Abuyin_Zukunft4_Trance);
	}
	else
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft4_13_02");	//О, Отец Монет, я прошу у тебя пятиста золотых в обмен на взгляд в туманное будущее.
	};
};

func void DIA_Abuyin_Zukunft4_Trance()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Abuyin_Zukunft4_Trance_13_00");	//(в трансе) Место знаний... другая страна... темное место далеко-далеко...
	AI_Output(self,other,"DIA_Abuyin_Zukunft4_Trance_13_01");	//(в трансе) Мужественные спутники... ты должен сделать выбор...
	AI_Output(self,other,"DIA_Abuyin_Zukunft4_Trance_13_02");	//(в трансе) Храм... стоит одиноко в царстве Аданоса... покрытый туманом...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Abuyin_Zukunft4_Trance_13_03");	//Это все. Больше я ничего не смог увидеть.
	DIA_Abuyin_Zukunft4_permanent = TRUE;
	Abuyin_Zukunft = 4;
	Info_ClearChoices(DIA_Abuyin_Zukunft4);
	B_GivePlayerXP(XP_Ambient * 4);
};


instance DIA_Abuyin_Weissagung5(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Weissagung5_Condition;
	information = DIA_Abuyin_Weissagung5_Info;
	permanent = FALSE;
	description = "Ты можешь сделать пророчество?";
};


func int DIA_Abuyin_Weissagung5_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Abuyin_du) && (Kapitel == 5))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Weissagung5_Info()
{
	B_Abuyin_Weissagung();
	AI_Output(self,other,"DIA_Abuyin_Weissagung5_13_00");	//За какую-то тысячу монет, я рискну заглянуть для тебя в будущее.
};


instance DIA_Abuyin_Zukunft5(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Zukunft5_Condition;
	information = DIA_Abuyin_Zukunft5_Info;
	permanent = TRUE;
	description = "Расскажи мне о будущем. (Цена: 1000 монет)";
};


var int DIA_Abuyin_Zukunft5_permanent;

func int DIA_Abuyin_Zukunft5_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Abuyin_Weissagung5) && (DIA_Abuyin_Zukunft5_permanent == FALSE) && (Kapitel == 5))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Zukunft5_Info()
{
	AI_Output(other,self,"DIA_Abuyin_Zukunft5_15_00");	//Расскажи мне о будущем.
	if(B_GiveInvItems(other,self,ItMi_Gold,1000))
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft5_13_01");	//Хорошо, о, Сын Знаний. Я сейчас войду в состояние транса. Ты готов?
		Info_ClearChoices(DIA_Abuyin_Zukunft5);
		Info_AddChoice(DIA_Abuyin_Zukunft5,"Я готов.",DIA_Abuyin_Zukunft5_Trance);
	}
	else
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft5_13_02");	//Но ведь у тебя нет денег. Я прошу всего лишь тысячу золотых монет!
	};
};

func void DIA_Abuyin_Zukunft5_Trance()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Abuyin_Zukunft5_Trance_13_00");	//(в трансе) Тьма опустилась на землю... зло торжествует...
	AI_Output(self,other,"DIA_Abuyin_Zukunft5_Trance_13_01");	//(в трансе) Король проиграет войну против орков...
	AI_Output(self,other,"DIA_Abuyin_Zukunft5_Trance_13_02");	//(в трансе) Ты вернешься, но не найдешь покоя...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Abuyin_Zukunft5_Trance_13_03");	//Это все. Больше я ничего не смог увидеть.
	DIA_Abuyin_Zukunft5_permanent = TRUE;
	Abuyin_Zukunft = 5;
	Info_ClearChoices(DIA_Abuyin_Zukunft5);
	B_GivePlayerXP(XP_Ambient * 4);
};


instance DIA_ABUYIN_TELLGUARDIANS(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = dia_abuyin_tellguardians_condition;
	information = dia_abuyin_tellguardians_info;
	permanent = FALSE;
	description = "Нечто странное происходит вокруг меня.";
};


func int dia_abuyin_tellguardians_condition()
{
	if(Npc_KnowsInfo(other,DIA_Abuyin_du) && (GUARDIAN_WAY == TRUE))
	{
		return TRUE;
	};
};

func void dia_abuyin_tellguardians_info()
{
	AI_Output(other,self,"DIA_Abuyin_TellGuardians_01_02");	//Нечто странное происходит вокруг меня. И я никак не могу понять, что именно.
	AI_Output(self,other,"DIA_Abuyin_TellGuardians_01_03");	//Хммм...(внимательно вглядываясь) Интересно! Я ощущаю вокруг тебя ореол некой огромной тайны.
	AI_Output(other,self,"DIA_Abuyin_TellGuardians_01_05");	//Может быть, твой дар предсказания поможет мне в этом?
	AI_Output(self,other,"DIA_Abuyin_TellGuardians_01_06");	//Ну...(неуверенно) Я могу, конечно, попробовать это сделать.
	AI_Output(self,other,"DIA_Abuyin_TellGuardians_01_07");	//Однако, как ты сам понимаешь, до конца ответить на твои вопросы я все равно не смогу.
	ABUYIN_TELLGUARDIANS = TRUE;
};


instance DIA_ABUYIN_FINDMEGUARDIANS(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = dia_abuyin_findmeguardians_condition;
	information = dia_abuyin_findmeguardians_info;
	permanent = TRUE;
	description = "Поведай мне, что ты знаешь.";
};


func int dia_abuyin_findmeguardians_condition()
{
	if((ABUYIN_TELLGUARDIANS == TRUE) && (TELLABOUTALL == FALSE))
	{
		return TRUE;
	};
};

func void dia_abuyin_findmeguardians_info()
{
	AI_Output(other,self,"DIA_Abuyin_FindMeGuardians_01_00");	//Поведай мне, что ты знаешь.
	AI_Output(self,other,"DIA_Abuyin_FindMeGuardians_01_01");	//Хорошо. Ты готов?
	Info_ClearChoices(dia_abuyin_findmeguardians);
	if(MIS_DAGOTTEST == FALSE)
	{
		Info_AddChoice(dia_abuyin_findmeguardians,"Я готов.",dia_abuyin_findmeguardians_dagot);
	}
	else if((DAGOT_AGREE == TRUE) && (MIS_MORIUSTEST == FALSE))
	{
		Info_AddChoice(dia_abuyin_findmeguardians,"Я готов.",dia_abuyin_findmeguardians_morius);
	}
	else if((MORIUS_AGREE == TRUE) && (MIS_TEGONTEST == FALSE))
	{
		Info_AddChoice(dia_abuyin_findmeguardians,"Я готов.",dia_abuyin_findmeguardians_tegon);
	}
	else if((TEGON_AGREE == TRUE) && (MIS_KELIOSTEST == FALSE) && (Kapitel >= 3))
	{
		Info_AddChoice(dia_abuyin_findmeguardians,"Я готов.",dia_abuyin_findmeguardians_kelios);
	}
	else if((KELIOS_AGREE == TRUE) && (MIS_DEMOSTEST == FALSE) && (Kapitel >= 3))
	{
		Info_AddChoice(dia_abuyin_findmeguardians,"Я готов.",dia_abuyin_findmeguardians_demos);
	}
	else if((DEMOS_AGREE == TRUE) && (MIS_FARIONTEST == FALSE) && (Kapitel >= 3))
	{
		Info_AddChoice(dia_abuyin_findmeguardians,"Я готов.",dia_abuyin_findmeguardians_farion);
	}
	else if((FARION_AGREE == TRUE) && (MIS_GADERTEST == FALSE) && (Kapitel >= 4))
	{
		Info_AddChoice(dia_abuyin_findmeguardians,"Я готов.",dia_abuyin_findmeguardians_gader);
	}
	else if((GADER_AGREE == TRUE) && (MIS_NARUSTEST == FALSE) && (Kapitel >= 4))
	{
		Info_AddChoice(dia_abuyin_findmeguardians,"Я готов.",dia_abuyin_findmeguardians_narus);
	}
	else if((NARUS_AGREE == TRUE) && (MIS_WAKONTEST == FALSE) && (Kapitel >= 4))
	{
		Info_AddChoice(dia_abuyin_findmeguardians,"Я готов.",dia_abuyin_findmeguardians_wakon);
	}
	else if((WAKON_AGREE == TRUE) && (MIS_STONNOSTEST == FALSE) && (Kapitel >= 4))
	{
		Info_AddChoice(dia_abuyin_findmeguardians,"Я готов.",dia_abuyin_findmeguardians_stonnos);
	}
	else
	{
		Info_AddChoice(dia_abuyin_findmeguardians,"Я готов.",dia_abuyin_findmeguardians_noone);
	};
};

func void dia_abuyin_findmeguardians_dagot()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Abuyin_FindMeGuardians_Dagot_01_00");	//(пытается сосредоточится) ...внимай мне, странник!
	AI_Output(self,other,"DIA_Abuyin_FindMeGuardians_Dagot_01_01");	//...Путь твой будет долгим: через висячий мост, мимо озера к дальней статуе Инноса. Только там ты найдешь то, что ищешь...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Abuyin_FindMeGuardians_Dagot_01_02");	//Больше пока ничего. Надеюсь, тебе этого хватит, чтобы понять, что делать.
	Info_ClearChoices(dia_abuyin_findmeguardians);
};

func void dia_abuyin_findmeguardians_morius()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Abuyin_FindMeGuardians_Morius_01_00");	//(пытается сосредоточится) ...внимай мне, странник!
	AI_Output(self,other,"DIA_Abuyin_FindMeGuardians_Morius_01_01");	//...Каменная твердыня, что явилась из небытия, откроет тебе ключ к разгадке...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Abuyin_FindMeGuardians_Morius_01_02");	//Больше пока ничего. Надеюсь, тебе пока этого хватит, чтобы понять, что делать.
	Info_ClearChoices(dia_abuyin_findmeguardians);
};

func void dia_abuyin_findmeguardians_tegon()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Abuyin_FindMeGuardians_Tegon_01_00");	//(пытается сосредоточится) ...внимай мне, странник!
	AI_Output(self,other,"DIA_Abuyin_FindMeGuardians_Tegon_01_01");	//...По дороге через темный лес, куда должен был ходить вместе с другом, по бездорожью в горы мимо странного лагеря. Твой путь лежит на плато высоко в горах.
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Abuyin_FindMeGuardians_Tegon_01_02");	//Больше пока ничего. Надеюсь, тебе пока этого хватит, чтобы понять, что делать.
	Info_ClearChoices(dia_abuyin_findmeguardians);
};

func void dia_abuyin_findmeguardians_kelios()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Abuyin_FindMeGuardians_Kelios_01_00");	//(пытается сосредоточится) ...внимай мне, странник!
	AI_Output(self,other,"DIA_Abuyin_FindMeGuardians_Kelios_01_01");	//...И вновь твой путь лежит в горы, мимо одинокого охотника к руинам на скале...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Abuyin_FindMeGuardians_Kelios_01_02");	//Больше пока ничего. Надеюсь, тебе пока этого хватит, чтобы понять, что делать.
	Info_ClearChoices(dia_abuyin_findmeguardians);
};

func void dia_abuyin_findmeguardians_demos()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Abuyin_FindMeGuardians_Demos_01_00");	//(пытается сосредоточится) ...внимай мне, странник!
	AI_Output(self,other,"DIA_Abuyin_FindMeGuardians_Demos_01_01");	//...Река... Водопад... Мост... Ворота... Дальше смерть и страх...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Abuyin_FindMeGuardians_Demos_01_02");	//Больше пока ничего. Надеюсь, тебе пока этого хватит, чтобы понять, что делать.
	Info_ClearChoices(dia_abuyin_findmeguardians);
};

func void dia_abuyin_findmeguardians_farion()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Abuyin_FindMeGuardians_Farion_01_00");	//(пытается сосредоточится) ...внимай мне, странник!
	AI_Output(self,other,"DIA_Abuyin_FindMeGuardians_Farion_01_01");	//...Дорога... Дорога в обитель служителей бога...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Abuyin_FindMeGuardians_Farion_01_02");	//Больше пока ничего. Надеюсь, тебе пока этого хватит, чтобы понять, что делать.
	Info_ClearChoices(dia_abuyin_findmeguardians);
};

func void dia_abuyin_findmeguardians_gader()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Abuyin_FindMeGuardians_Gader_01_00");	//(пытается сосредоточится) ...внимай мне, странник!
	AI_Output(self,other,"DIA_Abuyin_FindMeGuardians_Gader_01_01");	//...Длинный путь к волшебному Кругу далеко в горах...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Abuyin_FindMeGuardians_Gader_01_02");	//Больше пока ничего. Надеюсь, тебе пока этого хватит, чтобы понять, что делать.
	Info_ClearChoices(dia_abuyin_findmeguardians);
};

func void dia_abuyin_findmeguardians_narus()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Abuyin_FindMeGuardians_Narus_01_00");	//(пытается сосредоточится) ...внимай мне, странник!
	AI_Output(self,other,"DIA_Abuyin_FindMeGuardians_Narus_01_01");	//...Плато в горах... Ферма... Вода... Много воды, падающей вниз...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Abuyin_FindMeGuardians_Narus_01_02");	//Больше пока ничего. Надеюсь, тебе пока этого хватит, чтобы понять, что делать.
	Info_ClearChoices(dia_abuyin_findmeguardians);
};

func void dia_abuyin_findmeguardians_wakon()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Abuyin_FindMeGuardians_Wakon_01_00");	//(пытается сосредоточится) ...внимай мне, странник!
	AI_Output(self,other,"DIA_Abuyin_FindMeGuardians_Wakon_01_01");	//...В полях, на перекрестке двух дорог, найдешь ты то, что ищешь...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Abuyin_FindMeGuardians_Wakon_01_02");	//Больше пока ничего. Надеюсь, тебе пока этого хватит, чтобы понять, что делать.
	Info_ClearChoices(dia_abuyin_findmeguardians);
};

func void dia_abuyin_findmeguardians_stonnos()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Abuyin_FindMeGuardians_Stonnos_01_00");	//...(пытается сосредоточится)...внимай мне, странник!
	AI_Output(self,other,"DIA_Abuyin_FindMeGuardians_Stonnos_01_01");	//...Круг волшебных камней зовет тебя, сын поисков и открытий...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Abuyin_FindMeGuardians_Stonnos_01_02");	//Больше пока ничего. Надеюсь, тебе пока этого хватит, чтобы понять. что делать.
	TELLABOUTALL = TRUE;
	Info_ClearChoices(dia_abuyin_findmeguardians);
};

func void dia_abuyin_findmeguardians_noone()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Abuyin_FindMeGuardians_NoOne_01_00");	//(пытается сосредоточится) ...нет
	AI_Output(self,other,"DIA_Abuyin_FindMeGuardians_NoOne_01_01");	//...не получается!
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Abuyin_FindMeGuardians_NoOne_01_02");	//Извини... Но мои видения уж слишком туманны!
	AI_Output(self,other,"DIA_Abuyin_FindMeGuardians_NoOne_01_03");	//Я не могу тебе пока сообщить ничего нового.
	AI_Output(other,self,"DIA_Abuyin_FindMeGuardians_NoOne_01_04");	//Понимаю.
	Info_ClearChoices(dia_abuyin_findmeguardians);
};

