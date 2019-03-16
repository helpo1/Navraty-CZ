
instance DIA_PAL_187_MELHIOR_EXIT(C_Info)
{
	npc = pal_187_melhior;
	nr = 999;
	condition = dia_pal_187_melhior_exit_condition;
	information = dia_pal_187_melhior_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_187_melhior_exit_condition()
{
	return TRUE;
};

func void dia_pal_187_melhior_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_187_MELHIOR_FIRSTWARN(C_Info)
{
	npc = pal_187_melhior;
	nr = 1;
	condition = dia_pal_187_melhior_firstwarn_condition;
	information = dia_pal_187_melhior_firstwarn_info;
	permanent = FALSE;
	description = "Что ты тут делаешь?";
};


func int dia_pal_187_melhior_firstwarn_condition()
{
	return TRUE;
};

func void dia_pal_187_melhior_firstwarn_info()
{
	AI_Output(other,self,"DIA_Pal_187_Melhior_FirstWarn_01_00");	//Что ты тут делаешь?
	AI_Output(self,other,"DIA_Pal_187_Melhior_FirstWarn_01_01");	//(испуганно) ЧТО?! Я?
	AI_Output(self,other,"DIA_Pal_187_Melhior_FirstWarn_01_02");	//Не твоего ума дело. Какого черта тебе от меня надо?
	AI_Output(self,other,"DIA_Pal_187_Melhior_FirstWarn_01_03");	//Иди отсюда, куда шел.
	CreateInvItems(self,ItFo_Booze,1);
	B_UseItem(self,ItFo_Booze);
	AI_Output(self,other,"DIA_Pal_187_Melhior_FirstWarn_01_04");	//Ну, что уставился? Давай, проваливай...
	AI_StopProcessInfos(self);
};


instance DIA_PAL_187_MELHIOR_SECONDWARN(C_Info)
{
	npc = pal_187_melhior;
	nr = 1;
	condition = dia_pal_187_melhior_secondwarn_condition;
	information = dia_pal_187_melhior_secondwarn_info;
	permanent = FALSE;
	description = "А разве ты не должен быть на посту, вояка?";
};


func int dia_pal_187_melhior_secondwarn_condition()
{
	if(Npc_KnowsInfo(other,dia_pal_187_melhior_firstwarn))
	{
		return TRUE;
	};
};

func void dia_pal_187_melhior_secondwarn_info()
{
	AI_Output(other,self,"DIA_Pal_187_Melhior_SecondWarn_01_00");	//А разве ты не должен быть на посту?
	AI_Output(self,other,"DIA_Pal_187_Melhior_SecondWarn_01_01");	//Опять ты?! Ты действуешь мне на нервы!
	AI_Output(self,other,"DIA_Pal_187_Melhior_SecondWarn_01_02");	//Проваливай к Белиару! И не мешай мне здесь пить.
	AI_Output(self,other,"DIA_Pal_187_Melhior_SecondWarn_01_03");	//Или я тебя сам отучу от таких вещей.
	CreateInvItems(self,ItFo_Booze,1);
	B_UseItem(self,ItFo_Booze);
	AI_Output(self,other,"DIA_Pal_187_Melhior_SecondWarn_01_04");	//(икает) Понял?
	AI_StopProcessInfos(self);
};


instance DIA_PAL_187_MELHIOR_LASTWARN(C_Info)
{
	npc = pal_187_melhior;
	nr = 1;
	condition = dia_pal_187_melhior_lastwarn_condition;
	information = dia_pal_187_melhior_lastwarn_info;
	permanent = FALSE;
	description = "Интересно, что на это скажет лорд Хаген?";
};


func int dia_pal_187_melhior_lastwarn_condition()
{
	if(Npc_KnowsInfo(other,dia_pal_187_melhior_secondwarn))
	{
		return TRUE;
	};
};

func void dia_pal_187_melhior_lastwarn_info()
{
	AI_Output(other,self,"DIA_Pal_187_Melhior_LastWarn_01_00");	//Да ты пьян как сапожник! Интересно, что на это скажет лорд Хаген?
	AI_Output(self,other,"DIA_Pal_187_Melhior_LastWarn_01_01");	//ЧТО?! Ты еще будешь мне угрожать?
	AI_Output(self,other,"DIA_Pal_187_Melhior_LastWarn_01_02");	//Да плевал я на мнение всяких там Хагенов с высокой колокольни.
	CreateInvItems(self,ItFo_Booze,1);
	B_UseItem(self,ItFo_Booze);
	AI_Output(self,other,"DIA_Pal_187_Melhior_LastWarn_01_03");	//А вот ты, кретин, меня не послушал.
	AI_Output(self,other,"DIA_Pal_187_Melhior_LastWarn_01_04");	//Так что сейчас я тебе покажу, как со мной связываться.
	CreateInvItems(self,ItFo_Booze,1);
	B_UseItem(self,ItFo_Booze);
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,0);
};


instance DIA_PAL_187_MELHIOR_PAYBACKOK(C_Info)
{
	npc = pal_187_melhior;
	nr = 1;
	condition = dia_pal_187_melhior_paybackok_condition;
	information = dia_pal_187_melhior_paybackok_info;
	permanent = FALSE;
	description = "Ты не достоин быть паладином!";
};


func int dia_pal_187_melhior_paybackok_condition()
{
	if((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST) && Npc_KnowsInfo(hero,dia_pal_187_melhior_lastwarn))
	{
		return TRUE;
	};
};

func void dia_pal_187_melhior_paybackok_info()
{
	if(Npc_HasEquippedWeapon(self) == FALSE)
	{
		CreateInvItems(self,ItMw_1h_Pal_Sword,1);
		EquipItem(self,ItMw_1h_Pal_Sword);
	};
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_Pal_187_Melhior_PayBackOk_01_00");	//Ты не достоин быть паладином!
	if(hero.guild == GIL_PAL)
	{
		AI_Output(other,self,"DIA_Pal_187_Melhior_PayBackOk_01_01");	//Своим поведением ты позоришь весь орден!
		AI_Output(other,self,"DIA_Pal_187_Melhior_PayBackOk_01_02");	//Думаю, мне все-таки стоит поговорить с лордом Хагеном.
	}
	else
	{
		AI_Output(other,self,"DIA_Pal_187_Melhior_PayBackOk_01_04");	//Своим поведением, ты позоришь весь орден!
		AI_Output(other,self,"DIA_Pal_187_Melhior_PayBackOk_01_05");	//Думаю, мне все-таки стоит поговорить с лордом Хагеном.
	};
	AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_01_07");	//Что? (испуганно) Нет, не надо! Прошу тебя, не делай этого! Только не это!
	AI_Output(other,self,"DIA_Pal_187_Melhior_PayBackOk_01_08");	//И почему же я не должен этого делать?
	AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_01_09");	//Ты не представляешь, какого это - быть изгнанным из ордена!
	AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_01_10");	//После этого моя жизнь станет просто невыносимой.
	AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_01_11");	//Все кругом начнут презирать меня, и это лишь только малая часть тех бедствий, которые меня ожидают!
	AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_01_12");	//Если хочешь, я даже могу дать тебе денег. Много денег!
	Info_ClearChoices(dia_pal_187_melhior_paybackok);
	if((TELLABOUTDS == TRUE) && (MIS_GOLDDRAGONPORTAL == LOG_Running))
	{
		Info_AddChoice(dia_pal_187_melhior_paybackok,"Мне нужна информация.",dia_pal_187_melhior_paybackok_inform);
	};
	Info_AddChoice(dia_pal_187_melhior_paybackok,"Деньги тут бесполезны.",dia_pal_187_melhior_paybackok_gotcha);
	Info_AddChoice(dia_pal_187_melhior_paybackok,"Сколько ты заплатишь, если я тебя отпущу?",dia_pal_187_melhior_paybackok_money);
};

func void dia_pal_187_melhior_paybackok_money()
{
	AI_Output(other,self,"DIA_Pal_187_Melhior_PayBackOk_Money_01_00");	//Сколько ты заплатишь, если я тебя отпущу?
	AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_Money_01_01");	//Я дам тебе целую сотню золотых монет!
	AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_Money_01_02");	//Ну как, мы договорились?
	B_LogEntry(TOPIC_GOLDDRAGONPORTAL,"Думаю, я упустил свой шанс узнать больше о амулете Трирамар. Теперь про Мора Уларту можно забыть.");
	Info_ClearChoices(dia_pal_187_melhior_paybackok);
	Info_AddChoice(dia_pal_187_melhior_paybackok,"Этого мало!",dia_pal_187_melhior_paybackok_notok);
	Info_AddChoice(dia_pal_187_melhior_paybackok,"Хорошо!",dia_pal_187_melhior_paybackok_ok);
};

func void dia_pal_187_melhior_paybackok_notok()
{
	AI_Output(other,self,"DIA_Pal_187_Melhior_PayBackOk_NotOk_01_00");	//Ты смеешься надо мной?
	AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_NotOk_01_02");	//Но это все что у меня есть!
	AI_Output(other,self,"DIA_Pal_187_Melhior_PayBackOk_NotOk_01_04");	//Тогда, думаю, лорду Хагену будет интересно узнать о твоих подвигах.
	AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_NotOk_01_07");	//Ладно, ублюдок! Делай, что хочешь.
	AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_NotOk_01_08");	//Но учти, я этого просто так не оставлю!
	MELHIORPISSOFF = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_pal_187_melhior_paybackok_ok()
{
	AI_Output(other,self,"DIA_Pal_187_Melhior_PayBackOk_Ok_01_00");	//Ладно, давай их сюда.
	AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_Ok_01_03");	//О Иннос. Как это здорово, что ты согласился!
	AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_Ok_01_04");	//Вот, возьми мои деньги.
	B_GiveInvItems(self,other,ItMi_Gold,100);
	AI_Output(other,self,"DIA_Pal_187_Melhior_PayBackOk_Ok_01_05");	//Дам тебе совет на будущее: или бросай пить, или лучше прячься.
	AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_Ok_01_06");	//Да-да, конечно! (заискивающе улыбаясь)
	AI_StopProcessInfos(self);
};

func void dia_pal_187_melhior_paybackok_gotcha()
{
	AI_Output(other,self,"DIA_Pal_187_Melhior_PayBackOk_Gotcha_01_00");	//Деньги тут бесполезны. Тобой займется стража!
	AI_Output(other,self,"DIA_Pal_187_Melhior_PayBackOk_Gotcha_01_01");	//Думаю, лорду Хагену будет интересно узнать о твоих подвигах.
	AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_Gotcha_01_04");	//Ладно, ублюдок! Делай, что хочешь.
	AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_Gotcha_01_05");	//Но учти, я этого просто так не оставлю!
	B_LogEntry(TOPIC_GOLDDRAGONPORTAL,"Думаю, я упустил свой шанс узнать больше о амулете Трирамар. Теперь про Мора Уларту можно забыть.");
	MELHIORPISSOFF = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_pal_187_melhior_paybackok_inform()
{
	AI_Output(other,self,"DIA_Pal_187_Melhior_PayBackOk_Inform_01_00");	//Мне нужна информация.
	AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_Inform_01_01");	//Конечно! И что ты хочешь знать?
	AI_Output(other,self,"DIA_Pal_187_Melhior_PayBackOk_Inform_01_02");	//Меня интересует судьба одного амулета.
	AI_Output(other,self,"DIA_Pal_187_Melhior_PayBackOk_Inform_01_03");	//Насколько мне известно, последнее время он находился у паладинов.
	AI_Output(other,self,"DIA_Pal_187_Melhior_PayBackOk_Inform_01_04");	//Амулет называется Трирамар. Ты что-нибудь слышал о такой вещице?
	AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_Inform_01_05");	//Т-т-трирамар? (в ужасе) Я... да, я слышал о нем.
	AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_Inform_01_06");	//Но я не могу тебе рассказать. Это священная тайна.
	AI_Output(other,self,"DIA_Pal_187_Melhior_PayBackOk_Inform_01_08");	//А ну выкладывай все что знаешь об нем, пока я не нанес визит вежливости лорду Хагену!
	AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_Inform_01_11");	//Ладно... я расскажу тебе все, что мне известно:
	AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_Inform_01_12");	//...(скрепя сердце) Я знаю, этот амулет хранят на острове Этлу.
	AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_Inform_01_14");	//Это островок на юге материка — точнее не могу сказать...
	AI_Output(other,self,"DIA_Pal_187_Melhior_PayBackOk_Inform_01_18");	//Ладно, скажи, как туда можно добраться, на этот остров?
	AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_Inform_01_25");	//Я случайно подслушал, как лорд Хаген заказывал магам из монастыря, 'нащупать' портал на Этлу.
	AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_Inform_01_26");	//Знаю, что у них получилось, и знаю что...(разрываемый противоречиями) ключ к порталу хранится у самого Хагена.
	AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_Inform_01_31");	//зачем тебе все то, что ты у меня сейчас выпытал?
	B_LogEntry(TOPIC_GOLDDRAGONPORTAL,"Мне удалось выяснить, что паладины спрятали Амулет Трирамар на острове Этлу. Единственный способ попасть туда - это магический портал паладинов, который находится здесь на острове. Правда, точное место мне так и не удалось выяснить у Мельхиора. Ко всему прочему мне понадобится еще и ключ, который откроет мне проход к порталу. Как полагает Мельхиор, этот ключ, видимо, хранит при себе сам лорд Хаген, и это очень осложняет мою задачу добраться до Этлу.");
	ETLUBEGINS = TRUE;
	Info_ClearChoices(dia_pal_187_melhior_paybackok);
	Info_AddChoice(dia_pal_187_melhior_paybackok,"Просто захотелось узнать о нем чуть побольше.",dia_pal_187_melhior_paybackok_nothing);
	Info_AddChoice(dia_pal_187_melhior_paybackok,"Мне он очень нужен.",dia_pal_187_melhior_paybackok_take);
};

func void dia_pal_187_melhior_paybackok_nothing()
{
	AI_Output(other,self,"DIA_Pal_187_Melhior_PayBackOk_Nothing_01_00");	//Повышаю уровень своего интелекта.
	AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_Nothing_01_02");	//(облегченно) А-ааа, а то мне показалось...
	AI_Output(other,self,"DIA_Pal_187_Melhior_PayBackOk_Nothing_01_03");	//(перебивая) Когда кажется, надо Инносу молится. Бывай, солдат!
	AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_Nothing_01_04");	//Ага, и тебе счастливо... (растерянно)
	Info_ClearChoices(dia_pal_187_melhior_paybackok);
};

func void dia_pal_187_melhior_paybackok_take()
{
	AI_Output(other,self,"DIA_Pal_187_Melhior_PayBackOk_Take_01_00");	//Мне он очень нужен.
	AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_Take_01_01");	//Кто?! Амулет?
	AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_Take_01_02");	//Но ведь он есть зло в чистом виде! Кому он может понадобиться?
	AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_Take_01_03");	//Разве что... тому, кто продал душу Белиару!
	AI_Output(other,self,"DIA_Pal_187_Melhior_PayBackOk_Take_01_04");	//Не говори глупостей!
	AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_Take_01_05");	//Нет-нет, сейчас мне все стало ясно: твоя настойчивость, осведомленность...
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_Take_01_06");	//Никак я не ожидал такого от паладина!
	}
	else if(hero.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_Take_01_07");	//Никак я не ожидал такого от ополченца!
	}
	else if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW))
	{
		AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_Take_01_08");	//Никак я не ожидал такого от мага...
	}
	else if((hero.guild == GIL_GUR) || (hero.guild == GIL_TPL))
	{
		AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_Take_01_09");	//Да что еще можно ожидать от укуренного еретика?!
	}
	else if(hero.guild == GIL_KDM)
	{
		AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_Take_01_10");	//Что еще можно было ожидать от некроманта?!
	}
	else if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_Take_01_11");	//Да что еще можно ожидать от наемника?!
	};
	AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_Take_01_12");	//О Иннос! Что же я наделал. Я все тебе рассказал.
	AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_Take_01_13");	//Но я искуплю свой грех! Даже ценой своей жизни.
	AI_ReadyMeleeWeapon(self);
	AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_Take_01_14");	//Ты не получишь его, прихвостень Белиара, никогда!	
	MELHIORPISSOFFKILL = TRUE;
	self.aivar[AIV_DropDeadAndKill] = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,0);
};


instance DIA_PAL_187_MELHIOR_FUCKOFF(C_Info)
{
	npc = pal_187_melhior;
	nr = 10;
	condition = dia_pal_187_melhior_fuckoff_condition;
	information = dia_pal_187_melhior_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_pal_187_melhior_fuckoff_condition()
{
	if((MELHIORPISSOFF == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_pal_187_melhior_fuckoff_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
};


instance DIA_PAL_187_MELHIOR_FUCKOFFKILL(C_Info)
{
	npc = pal_187_melhior;
	nr = 10;
	condition = dia_pal_187_melhior_fuckoffkill_condition;
	information = dia_pal_187_melhior_fuckoffkill_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_pal_187_melhior_fuckoffkill_condition()
{
	if(MELHIORPISSOFFKILL == TRUE)
	{
		return TRUE;
	};
};

func void dia_pal_187_melhior_fuckoffkill_info()
{
	B_Say(self,other,"$KillEnemy");
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,0);
};


instance DIA_PAL_187_MELHIOR_HOWTHINGS(C_Info)
{
	npc = pal_187_melhior;
	nr = 10;
	condition = dia_pal_187_melhior_howthings_condition;
	information = dia_pal_187_melhior_howthings_info;
	permanent = TRUE;
	description = "Ну как, все в порядке?";
};


func int dia_pal_187_melhior_howthings_condition()
{
	if((MELHIORPISSOFFKILL == FALSE) && (MELHIORPISSOFF == FALSE) && Npc_KnowsInfo(other,dia_pal_187_melhior_paybackok))
	{
		return TRUE;
	};
};

func void dia_pal_187_melhior_howthings_info()
{
	AI_Output(other,self,"DIA_Pal_187_Melhior_PayBackOk_HowThings_01_00");	//Ну как, все в порядке?
	AI_Output(self,other,"DIA_Pal_187_Melhior_PayBackOk_HowThings_01_01");	//Да, все нормально.
};

