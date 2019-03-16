
instance DIA_ELIGOR_DEMON_EXIT(C_Info)
{
	npc = eligor_demon;
	nr = 999;
	condition = dia_eligor_demon_exit_condition;
	information = dia_eligor_demon_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_eligor_demon_exit_condition()
{
	if(SHEMRON_TALK == TRUE)
	{
		return TRUE;
	};
};

func void dia_eligor_demon_exit_info()
{
	AI_StopProcessInfos(self);
	self.flags = 0;
};


instance DIA_ELIGOR_DEMON_HELLO(C_Info)
{
	npc = eligor_demon;
	nr = 1;
	condition = dia_eligor_demon_hello_condition;
	information = dia_eligor_demon_hello_info;
	important = TRUE;
};


func int dia_eligor_demon_hello_condition()
{
	return TRUE;
};

func void dia_eligor_demon_hello_info()
{
	Snd_Play("MFX_FEAR_CAST");
	AI_Output(self,other,"DIA_Eligor_Demon_Hello_01_00");	//Ни один демон больше не придет на твой зов, человек. Руна лишилась своей силы.
	AI_Output(self,other,"DIA_Eligor_Demon_Hello_01_01");	//Ты сам все прекрасно понимаешь...(рычит)
	AI_Output(other,self,"DIA_Eligor_Demon_Hello_01_02");	//Так значит, ты и есть великий Элигор, повелитель Легиона демонов Лэнга. А ты производишь впечатление!
	AI_Output(other,self,"DIA_Eligor_Demon_Hello_01_03");	//Позволь задать тебе вопрос - зачем ты сам явился ко мне?
	AI_Output(self,other,"DIA_Eligor_Demon_Hello_01_04");	//Я явился на твой зов, дабы предложить тебе одну вещь, которая, возможно, заинтересует тебя, человек.
	AI_Output(other,self,"DIA_Eligor_Demon_Hello_01_05");	//Что именно ты хочешь мне предложить?
	AI_Output(self,other,"DIA_Eligor_Demon_Hello_01_06");	//Ты наверняка уже успел убедиться в могуществе Легиона и в том, что демоны Лэнга не знают себе равных по силе и мощи!
	AI_Output(self,other,"DIA_Eligor_Demon_Hello_01_07");	//Ты сможешь и дальше пользоваться услугами демонов моего легиона. Но при одном условии...
	AI_Output(other,self,"DIA_Eligor_Demon_Hello_01_08");	//Что это за условие?
	AI_Output(self,other,"DIA_Eligor_Demon_Hello_01_09");	//Каждый раз, когда ты захочешь вызвать одного из демонов, тебе придется пожертвовать небольшим количеством своей жизненной силы.
	AI_Output(self,other,"DIA_Eligor_Demon_Hello_01_10");	//Согласись, не очень большая плата по сравнению с тем могуществом, что тебе будет даровано!
	AI_Output(other,self,"DIA_Eligor_Demon_Hello_01_11");	//Не слишком ли высокая цена за твои услуги?!
	AI_Output(self,other,"DIA_Eligor_Demon_Hello_01_12");	//Мое дело только предложить. Решение же вправе принять ты сам.
	AI_Output(self,other,"DIA_Eligor_Demon_Hello_01_13");	//Подумай, после этого ты сможешь пользоваться услугами Легиона столько раз, сколько этого сам захочешь.
	AI_Output(self,other,"DIA_Eligor_Demon_Hello_01_14");	//И запомни: я предагаю это лишь один раз. Поэтому хорошенько подумай, прежде чем дать свой ответ.
	AI_Output(self,other,"DIA_Eligor_Demon_Hello_01_15");	//Итак, твой выбор, человек?
	Info_ClearChoices(dia_eligor_demon_hello);
	Info_AddChoice(dia_eligor_demon_hello,"Считай, что мы договорились.",dia_eligor_demon_hello_ok);
	Info_AddChoice(dia_eligor_demon_hello,"Слишком высокая плата.",dia_eligor_demon_hello_no);
};

func void dia_eligor_demon_hello_ok()
{
	Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Snd_Play("DEM_WARN");
	AI_Output(other,self,"DIA_Eligor_Demon_Hello_01_16");	//Считай, что мы договорились.
	AI_Output(self,other,"DIA_Eligor_Demon_Hello_01_17");	//На другое я и не рассчитывал. Теперь демоны Лэнга в полном твоем распоряжении.
	AI_StopProcessInfos(self);
	ELIGOR_FOREVER = TRUE;
	ELIGOR_TALK = TRUE;
	ELIGORSUM01 = FALSE;
	ELIGORSUM02 = FALSE;
	ELIGORSUM03 = FALSE;
	ELIGORSUM04 = FALSE;
	ELIGORSUM05 = FALSE;
	ELIGORSUM06 = FALSE;
	ELIGORSUM07 = FALSE;
	ELIGORSUM08 = FALSE;
	ELIGORSUM09 = FALSE;
	ELIGORSUM10 = FALSE;
	self.start_aistate = zs_mm_rtn_demonrest;
};

func void dia_eligor_demon_hello_no()
{
	Snd_Play("MYSTERY_04");
	AI_Output(other,self,"DIA_Eligor_Demon_Hello_01_18");	//Слишком высокая плата, Элигор.
	AI_Output(self,other,"DIA_Eligor_Demon_Hello_01_19");	//Как скажешь, человек. Наша беседа окончена! Прощай.
	AI_StopProcessInfos(self);
	ELIGOR_TALK = TRUE;
	self.start_aistate = zs_mm_rtn_demonrest;
};

//---------------------------------------------Элигор 7 глава---------------------------------------------------------

instance DIA_ELIGOR_DEMON_OW_EXIT(C_Info)
{
	npc = eligor_demon_ow;
	nr = 999;
	condition = dia_eligor_demon_ow_exit_condition;
	information = dia_eligor_demon_ow_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int dia_eligor_demon_ow_exit_condition()
{
	return TRUE;
};

func void dia_eligor_demon_ow_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_ELIGOR_DEMON_OW_HELLO(C_Info)
{
	npc = eligor_demon_ow;
	nr = 1;
	condition = dia_eligor_demon_ow_hello_condition;
	information = dia_eligor_demon_ow_hello_info;
	important = TRUE;
};

func int dia_eligor_demon_ow_hello_condition()
{
	return TRUE;
};

func void dia_eligor_demon_ow_hello_info()
{
	Snd_Play("MFX_FEAR_CAST");
	AI_Output(self,other,"DIA_Eligor_Demon_OW_Hello_01_01");	//КТО ВОЗЗВАЛ КО МНЕ? КТО ПОСМЕЛ ПОТРЕВОЖИТЬ МОЙ ПОКОЙ?!
	AI_Output(other,self,"DIA_Eligor_Demon_OW_Hello_01_02");	//Это я тебя вызвал.
	AI_Output(self,other,"DIA_Eligor_Demon_OW_Hello_01_03");	//Твое лицо кажется мне знакомым, смертный.
	AI_Output(self,other,"DIA_Eligor_Demon_OW_Hello_01_04");	//Ну конечно, теперь я тебя вспомнил.
	AI_Output(self,other,"DIA_Eligor_Demon_OW_Hello_01_05");	//Ты тот, кто сразил избранника Белиара в Чертогах Ирдората! 
	AI_Output(self,other,"DIA_Eligor_Demon_OW_Hello_01_06");	//По моему мнению, этот поступок действительно достоин уважения.
	AI_Output(other,self,"DIA_Eligor_Demon_OW_Hello_01_07");	//Я отправил на тот свет множество приспешников Белиара.
	AI_Output(self,other,"DIA_Eligor_Demon_OW_Hello_01_08");	//Однако не каждый из них был настолько могущественнен, как тот дракон!
	AI_Output(self,other,"DIA_Eligor_Demon_OW_Hello_01_09");	//Но хватит уже пустой болтовни...(рычит) Говори, чего ты хочешь?
	AI_Output(other,self,"DIA_Eligor_Demon_OW_Hello_01_10");	//Мне нужен Венец Демонов! Ты отдашь его мне?
	AI_Output(self,other,"DIA_Eligor_Demon_OW_Hello_01_11");	//С чего бы мне это делать, смертный?

	if(HasSleeperDefence == 1)
	{
		AI_Output(other,self,"DIA_Eligor_Demon_OW_Hello_01_12");	//Но ты ведь получил маску Спящего! Не так ли?
	}
	else if(HasSleeperDefence == 2)
	{
		AI_Output(other,self,"DIA_Eligor_Demon_OW_Hello_01_13");	//Но ты ведь получил Корону Льда! Не так ли?
	}
	else if(HasSleeperDefence == 3)
	{
		AI_Output(other,self,"DIA_Eligor_Demon_OW_Hello_01_14");	//Но ты ведь получил Глаз Инноса! Не так ли?
	}
	else
	{
		AI_Output(other,self,"DIA_Eligor_Demon_OW_Hello_01_99");	//Но ты ведь кое-что получил! Не так ли?
	};

	AI_Output(other,self,"DIA_Eligor_Demon_OW_Hello_01_15");	//Теперь и я хочу получить тот артефакт взамен своего!
	AI_Output(self,other,"DIA_Eligor_Demon_OW_Hello_01_16");	//(смеется) Ты ошибаешься, смертный.
	AI_Output(self,other,"DIA_Eligor_Demon_OW_Hello_01_17");	//Это была лишь плата за то, что ты сейчас имеешь возможность говорить со мной.
	AI_Output(self,other,"DIA_Eligor_Demon_OW_Hello_01_18");	//Не более того. Скажи, зачем тебе понадобился мой артефакт?
	AI_Output(other,self,"DIA_Eligor_Demon_OW_Hello_01_19");	//Он поможет мне одолеть древнейшего из демонов этого мира - Спящего!
	AI_Output(self,other,"DIA_Eligor_Demon_OW_Hello_01_20");	//(задумчиво) Так вот оно что! Все дело в нем.
	AI_Output(self,other,"DIA_Eligor_Demon_OW_Hello_01_21");	//Когда-то он был могущественнен, как и я сам! Но сейчас он мне не ровня.
	AI_Output(other,self,"DIA_Eligor_Demon_OW_Hello_01_22");	//Тебе - может быть. А я к нему даже подступиться не могу из-за его магии.
	AI_Output(other,self,"DIA_Eligor_Demon_OW_Hello_01_23");	//Поэтому и прошу у тебя Венец Демонов.
	AI_Output(self,other,"DIA_Eligor_Demon_OW_Hello_01_24");	//Само собой...(смеется) Как я сразу не догадался.
	AI_Output(self,other,"DIA_Eligor_Demon_OW_Hello_01_25");	//Однако ты должен понимать, что просто так я его не отдам. Тебе придется заплатить за него.
	AI_Output(other,self,"DIA_Eligor_Demon_OW_Hello_01_26");	//И сколько золота тебе нужно?
	AI_Output(self,other,"DIA_Eligor_Demon_OW_Hello_01_27");	//Золото меня абсолютно не интересует. Ты заплатишь мне своей жизнью!
	AI_Output(other,self,"DIA_Eligor_Demon_OW_Hello_01_28");	//Ты что, убьешь меня?
	AI_Output(self,other,"DIA_Eligor_Demon_OW_Hello_01_29");	//Нет. (смеется) Я лишь заберу у тебя половину твоей жизненной энергии.
	AI_Output(other,self,"DIA_Eligor_Demon_OW_Hello_01_30");	//Кммм... Может, есть какой-нибудь иной способ?
	AI_Output(self,other,"DIA_Eligor_Demon_OW_Hello_01_31");	//Я не собираюсь с тобой торговаться, смертный!
	AI_Output(self,other,"DIA_Eligor_Demon_OW_Hello_01_32");	//Либо ты принимаешь мои условия, либо закончим этот разговор.
	Info_ClearChoices(DIA_Eligor_Demon_OW_Hello);
	Info_AddChoice(DIA_Eligor_Demon_OW_Hello,"Хорошо. Забирай мою жизненную силу.",DIA_Eligor_Demon_OW_Hello_Health);
};

func void DIA_Eligor_Demon_OW_Hello_Health()
{
	var int HalfLife;

	HalfLife = hero.attribute[ATR_HITPOINTS_MAX] / 2;
	EligorPrice = hero.attribute[ATR_HITPOINTS_MAX] / 2;
	AI_Wait(self,4);
	Snd_Play("MYSTERY_04");
	AI_PlayAni(hero,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("spellFX_Innoseye",hero,hero,0,0,0,FALSE);
	B_RaiseAttributeQuet(hero,ATR_HITPOINTS_MAX,-HalfLife);
	Npc_ChangeAttribute(hero,ATR_HITPOINTS,ATR_HITPOINTS_MAX);
	AI_Wait(hero,1);
	AI_PlayAni(hero,"T_HEASHOOT_2_STAND");
	AI_Wait(hero,1);
	AI_Output(self,other,"DIA_Eligor_Demon_OW_Hello_Health_01_01");	//Ну что же. Сделка есть сделка! Венец Демонов теперь твой.
	B_GiveInvItems(self,other,ItAr_Helm_G3_06,1);
	AI_Output(self,other,"DIA_Eligor_Demon_OW_Hello_Health_01_02");	//Надеюсь, ты еще не пожалел о том решении, которое принял.
	AI_Output(other,self,"DIA_Eligor_Demon_OW_Hello_Health_01_03");	//Что сделано, то сделано.
	AI_Output(self,other,"DIA_Eligor_Demon_OW_Hello_Health_01_04");	//Как скажешь, человек. Наша встреча окончена... прощай.
	B_LogEntry(TOPIC_SLEEPERBACK,"Элигор потребовал от меня часть моей жизненной силы. У меня не было выбора. Мне во чтобы то ни стало нужно было заполучить его артефакт!");
	AI_StopProcessInfos(self);
	ELIGOR_OW_TALK = TRUE;
	self.start_aistate = zs_mm_rtn_demonrest;
};

//-----------------------------призрак маяка------------------

instance DIA_Skeleton_Stefan_EXIT(C_Info)
{
	npc = Skeleton_Stefan;
	nr = 999;
	condition = DIA_Skeleton_Stefan_EXIT_condition;
	information = DIA_Skeleton_Stefan_EXIT_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Skeleton_Stefan_EXIT_condition()
{
	return TRUE;
};

func void DIA_Skeleton_Stefan_EXIT_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Skeleton_Stefan_Hello(C_Info)
{
	npc = Skeleton_Stefan;
	nr = 1;
	condition = DIA_Skeleton_Stefan_Hello_condition;
	information = DIA_Skeleton_Stefan_Hello_info;
	important = TRUE;
};

func int DIA_Skeleton_Stefan_Hello_condition()
{
	if(MIS_HauntedLighthouse == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Skeleton_Stefan_Hello_info()
{
	Snd_Play("MFX_FEAR_CAST");
	B_GivePlayerXP(500);
	AI_Output(self,other,"DIA_Skeleton_Stefan_Hello_01_00");	//Что привело тебя сюда, смертный? Что ты тут ищешь?
	AI_Output(other,self,"DIA_Skeleton_Stefan_Hello_01_01");	//Хммм... Значит, слухи - не вымысел. На этом маяке действительно обитают призраки!
	AI_Output(self,other,"DIA_Skeleton_Stefan_Hello_01_02");	//Тебя не обманули. Это действительно правда. А теперь ответь на мой вопрос.
	AI_Output(other,self,"DIA_Skeleton_Stefan_Hello_01_03");	//Я ищу Стефана, смотрителя маяка. Он был убит тут много лет назад.
	AI_Output(self,other,"DIA_Skeleton_Stefan_Hello_01_04");	//Зачем он тебе понадобился?
	AI_Output(other,self,"DIA_Skeleton_Stefan_Hello_01_05");	//Я хочу снять проклятие с этого места, поэтому мне нужно знать обо всем, что тут произошло. 
	AI_Output(self,other,"DIA_Skeleton_Stefan_Hello_01_06");	//Меня удивляет твое желание, смертный. Обычно живые стараются обходить это место стороной.
	AI_Output(self,other,"DIA_Skeleton_Stefan_Hello_01_07");	//А ты пришел сюда и говоришь, что хочешь мне помочь.
	AI_Output(other,self,"DIA_Skeleton_Stefan_Hello_01_08");	//Так ты и есть Стефан? Тогда расскажи мне, почему тебя убили - и, главное, за что?
	AI_Output(self,other,"DIA_Skeleton_Stefan_Hello_01_09");	//За мою доброту и чрезмерное сострадание к людям. Похоже, в этом и была вся проблема.
	AI_Output(self,other,"DIA_Skeleton_Stefan_Hello_01_10");	//Когда-то я помог человеку, попавшему в беду. За это он отплатил мне тем, что лишил меня жизни.
	AI_Output(other,self,"DIA_Skeleton_Stefan_Hello_01_11");	//Кто этот человек?
	AI_Output(self,other,"DIA_Skeleton_Stefan_Hello_01_12");	//Я не знаю его настоящего имени. Он просил называть его Келевра.
	AI_Output(other,self,"DIA_Skeleton_Stefan_Hello_01_13");	//Келевра? Больше похоже на прозвище. Возможно даже - пиратское.
	AI_Output(self,other,"DIA_Skeleton_Stefan_Hello_01_14");	//Думаю, он и был пиратом. По крайней мере, у него при себе была пиратская сабля.
	AI_Output(other,self,"DIA_Skeleton_Stefan_Hello_01_15");	//А как он вообще попал на маяк?
	AI_Output(self,other,"DIA_Skeleton_Stefan_Hello_01_16");	//В тот день на море бушевал сильный шторм. Я поднялся на верхний ярус маяка, чтобы немного подлить масла в огонь, и тут увидел, как его тело выбросило волнами на берег.
	AI_Output(self,other,"DIA_Skeleton_Stefan_Hello_01_17");	//По всей видимости, его корабль затонул. Я подобрал его почти бездыханное тело и отнес на маяк.
	AI_Output(self,other,"DIA_Skeleton_Stefan_Hello_01_18");	//Он долго приходил в себя. Мне пришлось несколько раз сплавать в город за лекарствами, потому что у него началась лихорадка. Но в итоге он поправился.
	AI_Output(other,self,"DIA_Skeleton_Stefan_Hello_01_19");	//И что было дальше? 
	AI_Output(self,other,"DIA_Skeleton_Stefan_Hello_01_20");	//В один прекрасный день он сказал, что уходит и ему потребовалась моя лодка.
	AI_Output(self,other,"DIA_Skeleton_Stefan_Hello_01_21");	//Но я не мог отдать ему лодку, потому что она была нужна мне самому. И я предложил отвезти его в Хоринис.
	AI_Output(self,other,"DIA_Skeleton_Stefan_Hello_01_22");	//В тот момент мне показалось, что он немного напрягся и занервничал.
	AI_Output(self,other,"DIA_Skeleton_Stefan_Hello_01_23");	//Он предложил мне подняться наверх, чтобы показать место, где будет лучше высадить его на берег.
	AI_Output(self,other,"DIA_Skeleton_Stefan_Hello_01_24");	//А когда мы поднялись, проткнул меня своей саблей, сказав, что так или иначе лодка ему нужна самому.
	AI_Output(self,other,"DIA_Skeleton_Stefan_Hello_01_25");	//Он ушел, оставив меня умирать в луже собственной крови...
	B_LogEntry(TOPIC_HauntedLighthouse,"Призрак Стефана, обитавший на маяке, рассказал мне историю своей гибели. Его убил некий Келевра, который, надо полагать, был пиратом.");
};

instance DIA_Skeleton_Stefan_How(C_Info)
{
	npc = Skeleton_Stefan;
	nr = 1;
	condition = DIA_Skeleton_Stefan_How_condition;
	information = DIA_Skeleton_Stefan_How_info;
	permanent = FALSE;
	description = "Как снять проклятие с этого места?";
};

func int DIA_Skeleton_Stefan_How_condition()
{
	return TRUE;
};

func void DIA_Skeleton_Stefan_How_info()
{
	Snd_Play("MFX_FEAR_CAST");
	AI_Output(other,self,"DIA_Skeleton_Stefan_How_01_00");	//Как снять проклятие с этого места? Уверен, многие в Хоринисе хотели бы вернуть этот маяк обратно.
	AI_Output(self,other,"DIA_Skeleton_Stefan_How_01_01");	//У них уже есть новый. Зачем им еще один? 
	AI_Output(other,self,"DIA_Skeleton_Stefan_How_01_02");	//Не знаю. Но призракам не место среди людей. Ты должен это понимать.
	AI_Output(self,other,"DIA_Skeleton_Stefan_How_01_03");	//Я тебя понимаю. Но ничем помочь не могу. Извини...
	DealStoryDLH = TRUE;
	B_LogEntry(TOPIC_HauntedLighthouse,"Похоже, мне опять нужна помощь Ксардаса. Он наверняка должен знать, как можно снять проклятие с этого маяка.");
	AI_StopProcessInfos(self);
};

instance DIA_Skeleton_Stefan_FinalMeet(C_Info)
{
	npc = Skeleton_Stefan;
	nr = 1;
	condition = DIA_Skeleton_Stefan_FinalMeet_condition;
	information = DIA_Skeleton_Stefan_FinalMeet_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Skeleton_Stefan_FinalMeet_condition()
{
	if((MIS_HauntedLighthouse == LOG_Running) && (JackMeetLHGhost == TRUE) && (Npc_GetDistToWP(hero,"NW_SOUL_LH_01") <= 600) && (Npc_GetDistToWP(VLK_444_Jack,"NW_SOUL_LH_01") <= 600))
	{
		return TRUE;
	};
};

func void DIA_Skeleton_Stefan_FinalMeet_info()
{
	Snd_Play("MFX_FEAR_CAST");
	B_GivePlayerXP(250);
	AI_Output(self,other,"DIA_Skeleton_Stefan_FinalMeet_01_00");	//Ты снова пришел повидаться со мной, смертный. И на этот раз не один... 
	AI_Output(other,self,"DIA_Skeleton_Stefan_FinalMeet_01_01");	//Узнаешь моего спутника?
	AI_Output(self,other,"DIA_Skeleton_Stefan_FinalMeet_01_02");	//Узнаю. Хотя он и сильно постарел за это время.
	AI_Output(other,self,"DIA_Skeleton_Stefan_FinalMeet_01_03");	//Джек пришел, чтобы испросить у тебя прощения за свое злодеяние.
	AI_Output(self,other,"DIA_Skeleton_Stefan_FinalMeet_01_04");	//Можешь не продолжать, смертный. Я знаю, зачем он здесь. Я почувствовал это, как только он приплыл сюда.
	AI_Output(self,other,"DIA_Skeleton_Stefan_FinalMeet_01_05");	//Не думал, что у него хватит смелости явиться сюда.
	AI_Output(self,other,"DIA_Skeleton_Stefan_FinalMeet_01_06");	//Но раз он тут... Полагаю, у нас найдется с ним общая тема для разговора. Ты же пока зажги пламя у маяка.
	AI_Output(other,self,"DIA_Skeleton_Stefan_FinalMeet_01_07");	//Зачем мне это делать?
	AI_Output(self,other,"DIA_Skeleton_Stefan_FinalMeet_01_08");	//Так ты хочешь избавить это место от проклятия, или нет?
	AI_Output(other,self,"DIA_Skeleton_Stefan_FinalMeet_01_09");	//Хочу, но...
	AI_Output(self,other,"DIA_Skeleton_Stefan_FinalMeet_01_10");	//(перебивает) Тогда слушай и делай, что тебе говорят!
	AI_Output(self,other,"DIA_Skeleton_Stefan_FinalMeet_01_11");	//Присутствие здесь этого человека и сила связанного с ним проклятия скоро привлечет сюда остальных призраков.
	AI_Output(self,other,"DIA_Skeleton_Stefan_FinalMeet_01_12");	//А пламя маяка на время остановит их! Поэтому ты должен подняться наверх и зажечь маяк.
	AI_Output(self,other,"DIA_Skeleton_Stefan_FinalMeet_01_13");	//И поторопись, они уже близко...
	JackMeetGhost = TRUE;
	Info_ClearChoices(DIA_Skeleton_Stefan_FinalMeet);

	if(RhetorikSkillValue[1] >= 50)
	{
		Info_AddChoice(DIA_Skeleton_Stefan_FinalMeet,"Тогда ты должен кое-что пообещать мне, призрак.",DIA_Skeleton_Stefan_FinalMeet_Promise);
	};

	Info_AddChoice(DIA_Skeleton_Stefan_FinalMeet,"Нет, я не буду этого делать.",DIA_Skeleton_Stefan_FinalMeet_No);
	Info_AddChoice(DIA_Skeleton_Stefan_FinalMeet,"Хорошо, сейчас зажгу.",DIA_Skeleton_Stefan_FinalMeet_Yes);
};

func void DIA_Skeleton_Stefan_FinalMeet_Promise()
{
	AI_Output(other,self,"DIA_Skeleton_Stefan_FinalMeet_Promise_01_00");	//Тогда ты должен кое-что пообещать мне, призрак.
	AI_Output(self,other,"DIA_Skeleton_Stefan_FinalMeet_Promise_01_01");	//О чем ты говоришь?
	AI_Output(other,self,"DIA_Skeleton_Stefan_FinalMeet_Promise_01_02");	//Пока я буду наверху, Джек не должен умереть. Хватит уже и той крови, которая здесь когда-то пролилась.
	AI_Output(self,other,"DIA_Skeleton_Stefan_FinalMeet_Promise_01_03");	//Мертвые не в ответе перед живыми, смертный!
	AI_Output(other,self,"DIA_Skeleton_Stefan_FinalMeet_Promise_01_04");	//Поклянись, что он не умрет! Иначе, ты будешь проклят до скончания времен.
	AI_Output(self,other,"DIA_Skeleton_Stefan_FinalMeet_Promise_01_05");	//Хорошо...(спокойно) Я обещаю тебе, что он не погибнет.
	AI_Output(other,self,"DIA_Skeleton_Stefan_FinalMeet_Promise_01_06");	//Так-то лучше.
	JackDontDie = TRUE;
	B_LogEntry(TOPIC_HauntedLighthouse,"Призрак пообещал мне не убивать Джека. Надеюсь, он сдержит свое слово...");
};

func void DIA_Skeleton_Stefan_FinalMeet_No()
{
	AI_Output(other,self,"DIA_Skeleton_Stefan_FinalMeet_No_01_00");	//Нет, я не буду этого делать.
	AI_Output(self,other,"DIA_Skeleton_Stefan_FinalMeet_No_01_01");	//Как скажешь, смертный. Мне жаль, но тогда вы все тут умрете...
	AI_StopProcessInfos(self);
	LeaveMeetGhost = TRUE;
	StefanCanFight = TRUE;
	self.flags = 0;
	self.aivar[AIV_EnemyOverride] = FALSE;
	VLK_444_Jack.aivar[AIV_PARTYMEMBER] = FALSE;
	B_StartOtherRoutine(VLK_444_Jack,"JackFight");
	Wld_InsertNpc(Ghost_LH,"NW_SOUL_LH_03");
	Wld_InsertNpc(Ghost_LH,"NW_SOUL_LH_04");
	Wld_InsertNpc(Ghost_LH,"NW_SOUL_LH_05");
	Wld_InsertNpc(Ghost_LH,"NW_SOUL_LH_06");
};

func void DIA_Skeleton_Stefan_FinalMeet_Yes()
{
	AI_Output(other,self,"DIA_Skeleton_Stefan_FinalMeet_Yes_01_00");	//Хорошо, сейчас зажгу.
	AI_Output(self,other,"DIA_Skeleton_Stefan_FinalMeet_Yes_01_01");	//Тогда не мешкай.
	VLK_444_Jack.aivar[AIV_PARTYMEMBER] = FALSE;
	LeaveMeetGhost = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"JackTalk");
	B_StartOtherRoutine(VLK_444_Jack,"JackTalk");
};