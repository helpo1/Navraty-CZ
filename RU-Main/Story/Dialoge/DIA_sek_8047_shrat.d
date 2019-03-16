
instance DIA_SHRAT_EXIT(C_Info)
{
	npc = sek_8047_shrat;
	nr = 999;
	condition = dia_shrat_exit_condition;
	information = dia_shrat_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_shrat_exit_condition()
{
	return TRUE;
};

func void dia_shrat_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SHRAT_NOFOREVER(C_Info)
{
	npc = sek_8047_shrat;
	nr = 5;
	condition = dia_shrat_noforever_condition;
	information = dia_shrat_noforever_info;
	permanent = FALSE;
	description = "Что вы тут делаете?";
};

func int dia_shrat_noforever_condition()
{
	return TRUE;
};

func void dia_shrat_noforever_info()
{
	AI_Output(other,self,"DIA_Shrat_NoForever_01_00");	//Что вы тут делаете?
	AI_Output(self,other,"DIA_Shrat_NoForever_01_01");	//А что, не видно? Собираем болотник, чтобы потом наши братья в лагере смогли его курить.
	AI_Output(self,other,"DIA_Shrat_NoForever_01_02");	//Знаешь, сколько в нашем Братстве любителей забить косячок? (смеется) ОЧЕНЬ МНОГО!

	MeetLobartPsiCamp = TRUE;

	if(MIS_Lobart_Psicamp == LOG_Running)
	{
		B_GivePlayerXP(50);
		B_LogEntry(TOPIC_Lobart_Psicamp,"Кажется, те люди, о которых говорил Лобарт - всего-навсего обыкновенные сборщики болотной травы.");
	};
};


instance DIA_SHRAT_PSIINFO(C_Info)
{
	npc = sek_8047_shrat;
	nr = 5;
	condition = dia_shrat_psiinfo_condition;
	information = dia_shrat_psiinfo_info;
	permanent = FALSE;
	description = "В Братстве? В каком Братстве?!";
};


func int dia_shrat_psiinfo_condition()
{
	if(!Npc_KnowsInfo(hero,dia_tpl_8014_templer_first) && !Npc_KnowsInfo(hero,dia_hanis_psiinfo) && !Npc_KnowsInfo(hero,dia_balam_psiinfo) && Npc_KnowsInfo(hero,dia_shrat_noforever))
	{
		return TRUE;
	};
};

func void dia_shrat_psiinfo_info()
{
	AI_Output(other,self,"DIA_Shrat_PsiInfo_01_00");	//В Братстве? В каком Братстве?
	AI_Output(self,other,"DIA_Shrat_PsiInfo_01_01");	//В Братстве Спящего, конечно! Хотя теперь его можно называть просто - Братство.
	AI_Output(other,self,"DIA_Shrat_PsiInfo_01_02");	//Но я думал, что после падения барьера, Братство Спящего перестало существовать!
	AI_Output(self,other,"DIA_Shrat_PsiInfo_01_03");	//Это не так. Большинство наших братьев погибли, а многие сошли с ума от тлетворного влияния демонических сил.
	AI_Output(self,other,"DIA_Shrat_PsiInfo_01_04");	//Но были и те, кто выжил. Именно они стали лидерами нашего нового лагеря.
	AI_Output(other,self,"DIA_Shrat_PsiInfo_01_05");	//А где находится ваш лагерь?
	AI_Output(self,other,"DIA_Shrat_PsiInfo_01_06");	//Ступай по направлению к проходу в Долину Рудников. Не доходя до самого прохода, ты найдешь небольшую ферму.
	AI_Output(self,other,"DIA_Shrat_PsiInfo_01_07");	//Недалеко от нее и находится наша новая обитель.
};


instance DIA_SHRAT_HELLO(C_Info)
{
	npc = sek_8047_shrat;
	nr = 5;
	condition = dia_shrat_hello_condition;
	information = dia_shrat_hello_info;
	permanent = FALSE;
	description = "Эй, я тебя знаю!";
};


func int dia_shrat_hello_condition()
{
	if(Npc_KnowsInfo(hero,dia_shrat_noforever))
	{
		return TRUE;
	};
};

func void dia_shrat_hello_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Shrat_Hello_01_00");	//Эй, я тебя знаю!
	AI_Output(other,self,"DIA_Shrat_Hello_01_01");	//Ты тот парень, что прятался в хижине на болотах.
	AI_Output(self,other,"DIA_Shrat_Hello_01_02");	//Хммм... Верно. Разве мы с тобой раньше встречались?
	AI_Output(self,other,"DIA_Shrat_Hello_01_03");	//Хотя постой! (внимательно всматривается) Ну-ка...
	AI_Output(self,other,"DIA_Shrat_Hello_01_04");	//Ах, да! Теперь я тебя вспоминаю...(смеется) Ты тот парень, что принес нам яйца ползунов.
	AI_Output(other,self,"DIA_Shrat_Hello_01_05");	//Ну вот, вспомнил наконец-то.
	AI_Output(self,other,"DIA_Shrat_Hello_01_06");	//Ну ладно, не обижайся. За последнее время столько всего произошло - разве все и всех упомнишь.
	AI_Output(self,other,"DIA_Shrat_Hello_01_07");	//Рад тебя видеть - здорового и невредимого!
};


instance DIA_SHRAT_HELLOTWO(C_Info)
{
	npc = sek_8047_shrat;
	nr = 5;
	condition = dia_shrat_hellotwo_condition;
	information = dia_shrat_hellotwo_info;
	permanent = TRUE;
	description = "Как продвигается сбор болотника?";
};


func int dia_shrat_hellotwo_condition()
{
	if(Npc_KnowsInfo(hero,dia_shrat_noforever))
	{
		return TRUE;
	};
};

func void dia_shrat_hellotwo_info()
{
	AI_Output(other,self,"DIA_Shrat_HelloTwo_01_00");	//Как продвигается сбор болотника?
	AI_Output(self,other,"DIA_Shrat_HelloTwo_01_01");	//Если ты не будешь приставать к нашим сборщикам, он будет продвигаться еще быстрее!
};

instance dia_shrat_PrioratStart(C_Info)
{
	npc = sek_8047_shrat;
	nr = 1;
	condition = dia_shrat_PrioratStart_condition;
	information = dia_shrat_PrioratStart_info;
	permanent = FALSE;
	description = "Меня прислал Идол Намиб.";
};

func int dia_shrat_PrioratStart_condition()
{
	if(MIS_PrioratStart == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_shrat_PrioratStart_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"dia_shrat_PrioratStart_01_00");	//Меня прислал Идол Намиб.
	AI_Output(self,other,"dia_shrat_PrioratStart_01_01");	//Я весь во внимании...(уважительно) Что хочет от нас Гуру Братства?
	AI_Output(other,self,"dia_shrat_PrioratStart_01_02");	//Он хочет знать, какова на данный момент обстановка у вас в лагере.
	AI_Output(self,other,"dia_shrat_PrioratStart_01_03");	//Можешь передать ему, что у нас все хорошо.
	AI_Output(self,other,"dia_shrat_PrioratStart_01_04");	//Сбор болотника продвигается нормальными темпами, и его новая партия будет доставлена точно в срок.
	AI_Output(other,self,"dia_shrat_PrioratStart_01_05");	//Хорошо, так ему и передам. У меня есть еще один вопрос.
	AI_Output(self,other,"dia_shrat_PrioratStart_01_06");	//Спрашивай, если есть.
	AI_Output(other,self,"dia_shrat_PrioratStart_01_07");	//Вы что-нибудь слышали о пропавших послушниках Братства? 
	AI_Output(self,other,"dia_shrat_PrioratStart_01_08");	//Ты это серьезно?! (в ужасе) Несколько наших послушников пропало?
	AI_Output(other,self,"dia_shrat_PrioratStart_01_09");	//Да нет, это всего лишь слухи. Ничего серьезного!
	AI_Output(self,other,"dia_shrat_PrioratStart_01_10");	//А... ну, если так...(растерянно) Я уже подумал, что случилось действительно что-то плохое.
	AI_Output(self,other,"dia_shrat_PrioratStart_01_11");	//Нет, мы ничего не знаем об этом.
	PsiCamp_02_Ok = TRUE;
	B_LogEntry(TOPIC_PrioratStart,"В лагере сборщиков Шрэта все без изменений. О пропавших послушниках им тоже ничего не известно.");
};

instance DIA_SHRAT_GIVEPLANT(C_Info)
{
	npc = sek_8047_shrat;
	nr = 5;
	condition = dia_shrat_giveplant_condition;
	information = dia_shrat_giveplant_info;
	permanent = TRUE;
	description = "Я от Идола Кадара.";
};


func int dia_shrat_giveplant_condition()
{
	if((MIS_PLANTSFORBAALCADAR == LOG_Running) && (THIRDGROUPSEK == FALSE) && (other.guild == GIL_SEK) && Npc_KnowsInfo(hero,dia_shrat_noforever))
	{
		return TRUE;
	};
};

func void dia_shrat_giveplant_info()
{
	var C_Item itm;
	itm = Npc_GetEquippedArmor(other);
	AI_Output(other,self,"DIA_Shrat_GivePlant_01_00");	//Я от Идола Кадара.
	AI_Output(self,other,"DIA_Shrat_GivePlant_01_01");	//Идол Кадар прислал тебя? Но зачем?
	AI_Output(other,self,"DIA_Shrat_GivePlant_01_02");	//Я должен забрать ваш урожай болотника, который вы успели собрать к этому моменту.
	if((Hlp_IsItem(itm,itar_sekbed) == TRUE) || (Hlp_IsItem(itm,itar_sekbed_v1) == TRUE) || (Hlp_IsItem(itm,itar_slp_ul) == TRUE) || (Hlp_IsItem(itm,itar_slp_l) == TRUE))
	{
		AI_Output(self,other,"DIA_Shrat_GivePlant_01_03");	//Наконец-то! А я уж думал, что про нас все забыли.
		B_GiveInvItems(self,other,ItPl_SwampHerb,50);
		AI_Output(self,other,"DIA_Shrat_GivePlant_01_04");	//Вот, держи и не потеряй. Тут весь болотник, что у нас есть.
		THIRDGROUPSEK = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Shrat_GivePlant_01_05");	//Идол Кадар не мог послать к нам такого оборванца!
		AI_Output(self,other,"DIA_Shrat_GivePlant_01_06");	//Ты верно пошутил, приятель.
	};
};

