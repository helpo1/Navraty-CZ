instance DIA_Ass_183_Adept_EXIT(C_Info)
{
	npc = Ass_183_Adept;
	nr = 999;
	condition = DIA_Ass_183_Adept_exit_condition;
	information = DIA_Ass_183_Adept_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Ass_183_Adept_exit_condition()
{
	return TRUE;
};

func void DIA_Ass_183_Adept_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Ass_183_Adept_Hello(C_Info)
{
	npc = Ass_183_Adept;
	nr = 1;
	condition = DIA_Ass_183_Adept_hello_condition;
	information = DIA_Ass_183_Adept_hello_info;
	permanent = FALSE;
	description = "Кто ты?";
};
	
func int DIA_Ass_183_Adept_hello_condition()
{
	return TRUE;
};	
	
func void DIA_Ass_183_Adept_hello_info()
{
	AI_Output(other,self,"DIA_Ass_183_Adept_hello_01_01");	//Кто ты?
	AI_Output(self,other,"DIA_Ass_183_Adept_hello_01_02");	//Меня зовут Каду ибн Акбар ибн Имам ибн Хасим ибн Салим ибн Аман ибн Джадир ибн Омар ибн Халид бен Хаджи аль Мудари.
	AI_Output(other,self,"DIA_Ass_183_Adept_hello_01_03");	//Ого! А покороче никак?
	AI_Output(self,other,"DIA_Ass_183_Adept_hello_01_04");	//Можно и покороче. Братья меня зовут просто Кадуином.
	AI_Output(other,self,"DIA_Ass_183_Adept_hello_01_05");	//Так намного лучше.
};	

instance DIA_Ass_183_Adept_WhatDo(C_Info)
{
	npc = Ass_183_Adept;
	nr = 1;
	condition = DIA_Ass_183_Adept_WhatDo_condition;
	information = DIA_Ass_183_Adept_WhatDo_info;
	permanent = FALSE;
	description = "И чем ты тут занимаешься?";
};
	
func int DIA_Ass_183_Adept_WhatDo_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Ass_183_Adept_Hello))
	{
		return TRUE;
	};
};	
	
func void DIA_Ass_183_Adept_WhatDo_info()
{
	AI_Output(other,self,"DIA_Ass_183_Adept_WhatDo_01_01");	//И чем ты тут занимаешься?
	AI_Output(self,other,"DIA_Ass_183_Adept_WhatDo_01_02");	//Обычно я тут на побегушках у мастера Нрозаса.
	AI_Output(self,other,"DIA_Ass_183_Adept_WhatDo_01_03");	//Достаю для него разного рода ингредиенты, которые он обычно использует в своих экспериментах с ядами.
	AI_Output(self,other,"DIA_Ass_183_Adept_WhatDo_01_04");	//Но тебе, я думаю, будет не слишком интересно слушать про все это.
};
	
instance DIA_Ass_183_Adept_TalkAboutJoin(C_Info)
{
	npc = Ass_183_Adept;
	nr = 1;
	condition = DIA_Ass_183_Adept_TalkAboutJoin_condition;
	information = DIA_Ass_183_Adept_TalkAboutJoin_info;
	permanent = FALSE;
	description = "Ты выглядишь немного расстроенным.";
};
	
func int DIA_Ass_183_Adept_TalkAboutJoin_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Ass_183_Adept_Hello))
	{
		return TRUE;
	};
};	
	
func void DIA_Ass_183_Adept_TalkAboutJoin_info()
{
	AI_Output(other,self,"DIA_Ass_183_Adept_TalkAboutJoin_01_00");	//Ты выглядишь немного расстроенным.
	AI_Output(self,other,"DIA_Ass_183_Adept_TalkAboutJoin_01_01");	//(удрученно) Это что, так заметно? Хотя, ты прав. У меня действительно есть небольшая проблемка.
	AI_Output(other,self,"DIA_Ass_183_Adept_TalkAboutJoin_01_02");	//В чем дело?
	AI_Output(self,other,"DIA_Ass_183_Adept_TalkAboutJoin_01_03");	//Дело в том, что мастер Нрозас послал меня достать редкий ядовитый экстракт из сердцевины клыка муритана.
	AI_Output(self,other,"DIA_Ass_183_Adept_TalkAboutJoin_01_04");	//Но я и понятия не имею, где мне искать его.
	AI_Output(self,other,"DIA_Ass_183_Adept_TalkAboutJoin_01_05");	//К тому же я слышал, что эта тварь крайне опасна, и встреча с ним может стоить мне жизни.
	AI_Output(other,self,"DIA_Ass_183_Adept_TalkAboutJoin_01_06");	//В этом ты можешь не сомневаться.
	AI_Output(self,other,"DIA_Ass_183_Adept_TalkAboutJoin_01_07");	//Тем более. Вот только если я вернусь к Нрозасу ни с чем, он просто живьем сдерет с меня шкуру.
	AI_Output(self,other,"DIA_Ass_183_Adept_TalkAboutJoin_01_08");	//Чего, как ты понимаешь, мне вовсе не хочется. Он крайне не любит, когда ему в чем-то отказывают.
	AI_Output(other,self,"DIA_Ass_183_Adept_TalkAboutJoin_01_09");	//Может, я смогу помочь тебе в этом деле?
	AI_Output(other,self,"DIA_Ass_183_Adept_TalkAboutJoin_01_10");	//Я слышал, что у приора Тиаманта есть один клык муритана.
	AI_Output(self,other,"DIA_Ass_183_Adept_TalkAboutJoin_01_11");	//В том-то и дело. Нрозас уже общался на эту тему с Тиамантом, но тот ему отказал.
	AI_Output(self,other,"DIA_Ass_183_Adept_TalkAboutJoin_01_12");	//Тогда Нрозас пришел в такую ярость, что чуть не отправил к Белиару пару послушников Братства.
	AI_Output(self,other,"DIA_Ass_183_Adept_TalkAboutJoin_01_13");	//После чего послал меня искать этот проклятый клык.
	AI_Output(self,other,"DIA_Ass_183_Adept_TalkAboutJoin_01_14");	//Так что теперь все их дерьмо приходится разгребать мне.
	MIS_KaduinTooth = LOG_Running;
	B_LogEntry(TOPIC_Intriges,"Мастер Нрозас приказал этому бедолаге Кадуину достать ядовитый клык Муритана. Нрозас уже обращался по этому вопросу к приору Тиаманту, у которого есть один экземпляр, но тот ему отказал. Если я помогу Кадуину, это будет хорошим моментом, когда можно будет разузнать про Нрозаса и Тиаманта поподробней.");
	Wld_InsertNpc(Muritan_PW_02,"PW_MURITAN_02");
};	


instance DIA_Ass_183_Adept_TalkAboutJoin_Done(C_Info)
{
	npc = Ass_183_Adept;
	nr = 1;
	condition = DIA_Ass_183_Adept_TalkAboutJoin_Done_condition;
	information = DIA_Ass_183_Adept_TalkAboutJoin_Done_info;
	permanent = FALSE;
	description = "У меня есть с собой клык муритана.";
};
	
func int DIA_Ass_183_Adept_TalkAboutJoin_Done_condition()
{
	if((MIS_KaduinTooth == LOG_Running) && (Npc_HasItems(other,ItAt_PW_MuritanTooth) >= 1))
	{
		return TRUE;
	};
};	
	
func void DIA_Ass_183_Adept_TalkAboutJoin_Done_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Ass_183_Adept_TalkAboutJoin_Done_01_00");	//У меня есть с собой клык муритана. И я бы мог отдать его тебе.
	AI_Output(self,other,"DIA_Ass_183_Adept_TalkAboutJoin_Done_01_01");	//Что? Ты не шутишь, приятель?
	AI_Output(other,self,"DIA_Ass_183_Adept_TalkAboutJoin_Done_01_02");	//Какие шутки! Совсем недавно я лично прикончил одну из этих тварей.
	AI_Output(other,self,"DIA_Ass_183_Adept_TalkAboutJoin_Done_01_03");	//Мне он без надобности, а тебе мог бы пригодиться.
	AI_Output(self,other,"DIA_Ass_183_Adept_TalkAboutJoin_Done_01_04");	//(растерянно) Ну, раз так... Тогда я готов отдать за него... все, что угодно!
	AI_Output(other,self,"DIA_Ass_183_Adept_TalkAboutJoin_Done_01_05");	//Не сомневаюсь. Но мне будет достаточно, если ты просто ответишь на один мой вопрос.
	AI_Output(self,other,"DIA_Ass_183_Adept_TalkAboutJoin_Done_01_06");	//Договорились. Спрашивай! Я постараюсь ответить тебе на него.
	AI_Output(other,self,"DIA_Ass_183_Adept_TalkAboutJoin_Done_01_07");	//Вот что меня интересует: как приор Нрозас относится к приору Тиаманту?
	AI_Output(self,other,"DIA_Ass_183_Adept_TalkAboutJoin_Done_01_08");	//Да как... Они и до последнего времени не очень-то ладили.
	AI_Output(self,other,"DIA_Ass_183_Adept_TalkAboutJoin_Done_01_09");	//А после того разговора Нрозас, кажется, затаил очень сильную обиду на Тиаманта.
	AI_Output(self,other,"DIA_Ass_183_Adept_TalkAboutJoin_Done_01_10");	//По крайней мере, мне так показалось, поскольку Нрозас постоянно бормочет про себя, что когда-нибудь отомстит тому.
	AI_Output(self,other,"DIA_Ass_183_Adept_TalkAboutJoin_Done_01_11");	//Ну а больше я ничего об этом не знаю.
	AI_Output(other,self,"DIA_Ass_183_Adept_TalkAboutJoin_Done_01_12");	//Этого достаточно. Вот, держи свой клык.
	B_GiveInvItems(other,self,ItAt_PW_MuritanTooth,1);
	Npc_RemoveInvItems(self,ItAt_PW_MuritanTooth,1);

	if(Trophy_MuritanTooth  == TRUE)
	{
		if((Npc_HasItems(other,ItAt_PW_MuritanTooth) == FALSE) && (Npc_HasItems(other,ItAt_BuritanTooth) == FALSE))
		{
			Ext_RemoveFromSlot(other,"BIP01 PELVIS");
			Npc_RemoveInvItems(other,ItUt_MuritanTooth,Npc_HasItems(other,ItUt_MuritanTooth));
			Trophy_MuritanTooth  = FALSE;
		};
	};

	AI_Output(self,other,"DIA_Ass_183_Adept_TalkAboutJoin_Done_01_13");	//Спасибо, приятель! Ты просто спас меня.
	MIS_KaduinTooth = LOG_SUCCESS;
	KnowNrozasToTiamant = TRUE;
	B_LogEntry(TOPIC_Intriges,"Кажется, Нрозас затаил большую обиду на Тиаманта и жаждет ему отомстить. Уверен, это сильно заинтересует Ханиара.");
};	

instance DIA_Ass_183_Adept_Trade(C_Info)
{
	npc = Ass_183_Adept;
	nr = 80;
	condition = DIA_Ass_183_Adept_Trade_Condition;
	information = DIA_Ass_183_Adept_Trade_Info;
	trade = TRUE;
	permanent = TRUE;
	description = "Что ты можешь предложить?";
};

func int DIA_Ass_183_Adept_Trade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Ass_183_Adept_WhatDo) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Ass_183_Adept_Trade_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self,"DIA_Addon_Martin_Trade_15_00");	//Что ты можешь предложить?
	B_GiveTradeInv(self);
};
