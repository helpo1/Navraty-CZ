
instance DIA_SHEMRON_DEMON_EXIT(C_Info)
{
	npc = shemron_demon;
	nr = 999;
	condition = dia_shemron_demon_exit_condition;
	information = dia_shemron_demon_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_shemron_demon_exit_condition()
{
	if(SHEMRON_TALK == TRUE)
	{
		return TRUE;
	};
};

func void dia_shemron_demon_exit_info()
{
	AI_StopProcessInfos(self);
	self.flags = 0;
};


instance DIA_SHEMRON_DEMON_HELLO(C_Info)
{
	npc = shemron_demon;
	nr = 1;
	condition = dia_shemron_demon_hello_condition;
	information = dia_shemron_demon_hello_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_shemron_demon_hello_condition()
{
	if((SHEMRON_TALK == FALSE) && (KNOWDEMENTORLANGUAGE == TRUE) && (Npc_HasItems(other,itmi_darkshpere) >= 1))
	{
		return TRUE;
	};
};

func void dia_shemron_demon_hello_info()
{
	Snd_Play("MFX_FEAR_CAST");
	AI_Output(self,other,"DIA_Shemron_Demon_Hello_01_00");	//Человек!?...(рычит) А я то думал - что за сумасшедший посмел потревожить мой покой!!!
	AI_Output(self,other,"DIA_Shemron_Demon_Hello_01_01");	//Ты видно сам не осознал до сих пор, во что ввязался придя сюда...
	AI_Output(self,other,"DIA_Shemron_Demon_Hello_01_02");	//Но скоро ты это поймешь...(зловеще)
	AI_Output(other,self,"DIA_Shemron_Demon_Hello_01_03");	//Кто ты, порождение тьмы?! Еще один прихвостень Белиара?
	AI_Output(self,other,"DIA_Shemron_Demon_Hello_01_04");	//Глупый человек!...(смеется) Мой создатель не Темный бог!
	AI_Output(self,other,"DIA_Shemron_Demon_Hello_01_06");	//Я - Шемрон, пятый демон легиона Элигора, верный страж Хранителей божественной Тьмы, чью мудрость хранит ночь!
	self.name[0] = "Шемррон";
	SHEMRONKNOWS = TRUE;
	AI_Output(self,other,"DIA_Shemron_Demon_Hello_01_07");	//По их приказу я оберегаю то, что ты - жалкий вор, только что украл.
	AI_Output(self,other,"DIA_Shemron_Demon_Hello_01_08");	//И сейчас я позабочусь о том, чтобы это больше никогда не повторилось...(рычит)
	if(GUARDIAN_WAY == TRUE)
	{
		AI_Output(other,self,"DIA_Shemron_Demon_Hello_01_09");	//Постой. Ты сказал, Хранителей? Ты хочешь сказать, что ты, демон, служишь Хранителям?
		AI_Output(other,self,"DIA_Shemron_Demon_Hello_01_11");	//М-да, вот так сюрприз... Хранители никогда не упоминали, что у них есть подобного рода слуги.
		AI_Output(self,other,"DIA_Shemron_Demon_Hello_01_13");	//Хмм...не хочешь ли ты сказать жалкий червяк, что имеешь хотя бы какое-то представление о том, о чем только что сказал!
		if(ADEPTGUARDIAN == TRUE)
		{
			AI_Output(other,self,"DIA_Shemron_Demon_Hello_01_14");	//Я посвящен в священный Круг Хранителей и являюсь их адептом.
			AI_Output(other,self,"DIA_Shemron_Demon_Hello_01_15");	//Не думаю, что им понравится, если со мной вдруг случиться что-нибудь плохое.
		}
		else
		{
			AI_Output(other,self,"DIA_Shemron_Demon_Hello_01_16");	//Я встречал Хранителей и они указали мне путь, которому я начал следовать.
			AI_Output(other,self,"DIA_Shemron_Demon_Hello_01_17");	//Не думаю, что им понравится, если со мной вдруг случиться что-нибудь плохое...
		};
		AI_Output(self,other,"DIA_Shemron_Demon_Hello_01_18");	//Быть того не может! Я не верю ни одному твоему слову, жалкий человек!
		AI_Output(self,other,"DIA_Shemron_Demon_Hello_01_19");	//Немыслимо, чтобы Стражи Стихий обратили свой взор на такого паршивого червя, как ты...(рычит)
		AI_Output(other,self,"DIA_Shemron_Demon_Hello_01_20");	//Я говорю правду!
		AI_Output(other,self,"DIA_Shemron_Demon_Hello_01_21");	//Иначе как по-твоему я бы вообще смог с тобой разговаривать. Именно Хранители научили меня языку демонов.
		AI_Output(self,other,"DIA_Shemron_Demon_Hello_01_22");	//Да...это очень странно, что ты владеешь этим знанием. Но этого не достаточно для того, чтобы я поверил тебе.
		AI_Output(self,other,"DIA_Shemron_Demon_Hello_01_24");	//Если ты сможешь доказать то, что действительно тот за кого себя выдаешь то...
		AI_Output(self,other,"DIA_Shemron_Demon_Hello_01_25");	//...то возможно я не стану сейчас разрывать твою плоть на куски. Хотя сейчас мне очень хочется это сделать!...(рычит)
		if(Npc_HasItems(other,itri_guardians_01) >= 1)
		{
			AI_Output(other,self,"DIA_Shemron_Demon_Hello_01_26");	//У меня есть это кольцо. Его мне дал Хранитель Дагот во время нашей первой встречи.
			AI_Output(self,other,"DIA_Shemron_Demon_Hello_01_27");	//...(рычит) Кольцо Баала!!!... Только Хранитель мог дать тебе эту вещь.
			AI_Output(other,self,"DIA_Shemron_Demon_Hello_01_28");	//Теперь ты мне веришь?
			AI_Output(self,other,"DIA_Shemron_Demon_Hello_01_29");	//Да. Этого вполне достаточно!
			AI_Output(self,other,"DIA_Shemron_Demon_Hello_01_30");	//Я сохраню тебе жизнь, человек. Но то, что ты забрал - все равно останется здесь.
			AI_Output(self,other,"DIA_Shemron_Demon_Hello_01_31");	//Сфера покинет это место только в том случае, если на то будет воля Хранителей.
			AI_Output(self,other,"DIA_Shemron_Demon_Hello_01_32");	//Отдай мне ее.
			Info_ClearChoices(dia_shemron_demon_hello);
			Info_AddChoice(dia_shemron_demon_hello,"Хорошо! Вот возьми ее.",dia_shemron_demon_hello_ok);
			Info_AddChoice(dia_shemron_demon_hello,"Мне она нужна самому.",dia_shemron_demon_hello_no);
			if(MIS_STONNOSTEST == LOG_Running)
			{
				Info_AddChoice(dia_shemron_demon_hello,"Хранителю Стонносу нужна эта Сфера...",dia_shemron_demon_hello_stonnos);
			};
		}
		else if(Npc_HasItems(other,itri_guardians_02) >= 1)
		{
			AI_Output(other,self,"DIA_Shemron_Demon_Hello_01_33");	//У меня есть это кольцо адепта священного круга. Хранитель Стоннос дал его мне при посвящении.
			AI_Output(self,other,"DIA_Shemron_Demon_Hello_01_34");	//...(рычит) Кольцо Стихий!!!... Только Хранитель мог дать тебе эту вещь.
			AI_Output(other,self,"DIA_Shemron_Demon_Hello_01_35");	//Теперь ты мне веришь?
			AI_Output(self,other,"DIA_Shemron_Demon_Hello_01_36");	//Да. Этого вполне достаточно!
			AI_Output(self,other,"DIA_Shemron_Demon_Hello_01_37");	//Я сохраню тебе жизнь, человек. Но то, что ты забрал - все равно останется здесь.
			AI_Output(self,other,"DIA_Shemron_Demon_Hello_01_38");	//Сфера покинет это место только в том случае, если на то будет воля Хранителей.
			AI_Output(self,other,"DIA_Shemron_Demon_Hello_01_39");	//Отдай мне ее.
			Info_ClearChoices(dia_shemron_demon_hello);
			Info_AddChoice(dia_shemron_demon_hello,"Хорошо! Вот возьми ее.",dia_shemron_demon_hello_ok);
			Info_AddChoice(dia_shemron_demon_hello,"Мне она нужна самому.",dia_shemron_demon_hello_no);
			if(MIS_STONNOSTEST == LOG_Running)
			{
				Info_AddChoice(dia_shemron_demon_hello,"Хранителю Стонносу нужна эта Сфера...",dia_shemron_demon_hello_stonnos);
			};
		}
		else if(Npc_HasItems(other,itri_narus) >= 1)
		{
			AI_Output(other,self,"DIA_Shemron_Demon_Hello_01_40");	//У меня есть это кольцо. Его мне дал Хранитель Вакон во время нашей первой встречи.
			AI_Output(self,other,"DIA_Shemron_Demon_Hello_01_41");	//...(рычит) Кольцо Воды!!!... Только Хранитель мог дать тебе эту вещь.
			AI_Output(other,self,"DIA_Shemron_Demon_Hello_01_42");	//Теперь ты мне веришь?
			AI_Output(self,other,"DIA_Shemron_Demon_Hello_01_43");	//Да. Этого вполне достаточно!
			AI_Output(self,other,"DIA_Shemron_Demon_Hello_01_44");	//Я сохраню тебе жизнь, человек. Но то, что ты забрал - все равно останется здесь.
			AI_Output(self,other,"DIA_Shemron_Demon_Hello_01_45");	//Ты мудро поступил человек! В противном случае ты был бы сейчас уже мертв.
			Info_ClearChoices(dia_shemron_demon_hello);
			Info_AddChoice(dia_shemron_demon_hello,"Хорошо! Вот возьми ее.",dia_shemron_demon_hello_ok);
			Info_AddChoice(dia_shemron_demon_hello,"Мне она нужна самому.",dia_shemron_demon_hello_no);
			if(MIS_STONNOSTEST == LOG_Running)
			{
				Info_AddChoice(dia_shemron_demon_hello,"Хранителю Стонносу нужна эта Сфера...",dia_shemron_demon_hello_stonnos);
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Shemron_Demon_Hello_01_47");	//Теперь продолжай свой путь! Возможно когда-нибудь наши дороги вновь пересекуться.
			AI_StopProcessInfos(self);
			Snd_Play("MFX_FEAR_CAST");
			B_Attack(self,other,AR_SuddenEnemyInferno,1);
			SHEMRON_TALK = TRUE;
			SHEMRON_FIGHT = TRUE;
			self.start_aistate = ZS_MM_AllScheduler;
		};
	}
	else
	{
		AI_StopProcessInfos(self);
		Snd_Play("MFX_FEAR_CAST");
		B_Attack(self,other,AR_SuddenEnemyInferno,1);
		SHEMRON_TALK = TRUE;
		SHEMRON_FIGHT = TRUE;
		self.start_aistate = ZS_MM_AllScheduler;
	};
};

func void dia_shemron_demon_hello_stonnos()
{
	AI_Output(other,self,"DIA_Shemron_Demon_Hello_Stonnos_01_01");	//Хранителю Стонносу нужна эта Сфера и я намереваюсь во чтобы то ни стало выполнить его поручение.
	AI_Output(self,other,"DIA_Shemron_Demon_Hello_Stonnos_01_03");	//Стоннос?! Хммм...(рычит) Ну раз так, тогда в этом нет необходимости, человек.
	AI_Output(self,other,"DIA_Shemron_Demon_Hello_Stonnos_01_04");	//Если все, что ты говоришь - правда, и тебя сюда прислал сам верховный Хранитель Стоннос - то я более не смеею тебя задерживать!
	AI_Output(self,other,"DIA_Shemron_Demon_Hello_Stonnos_01_05");	//Можешь оставить эту Сферу себе и продолжить свой путь!
	GIVESHEPHRESHEMRONBACK = TRUE;
	AI_StopProcessInfos(self);
	SHEMRON_TALK = TRUE;
	SHEMRON_FIGHT = FALSE;
	self.aivar[AIV_EnemyOverride] = FALSE;
	self.start_aistate = zs_mm_rtn_demonrest;
};

func void dia_shemron_demon_hello_ok()
{
	AI_Output(self,other,"DIA_Shemron_Demon_Hello_01_44");	//Я сохраню тебе жизнь, человек. Но то, что ты забрал - все равно останется здесь.
	B_GiveInvItems(other,self,itmi_darkshpere,1);
	AI_Output(self,other,"DIA_Shemron_Demon_Hello_01_45");	//Ты мудро поступил человек! В противном случае ты был бы сейчас уже мертв.
	AI_Output(self,other,"DIA_Shemron_Demon_Hello_01_47");	//Теперь продолжай свой путь! Возможно когда-нибудь наши дороги вновь пересекуться.
	AI_StopProcessInfos(self);
	SHEMRON_TALK = TRUE;
	SHEMRON_FIGHT = FALSE;
	GIVESHEPHRESHEMRON = TRUE;
	self.aivar[AIV_EnemyOverride] = FALSE;
};

func void dia_shemron_demon_hello_no()
{
	AI_Output(other,self,"DIA_Shemron_Demon_Hello_01_48");	//Мне она нужна самому.
	AI_Output(self,other,"DIA_Shemron_Demon_Hello_01_49");	//Ну это мы еще посмотрим.
	AI_Output(self,other,"DIA_Shemron_Demon_Hello_01_51");	//Ха ха ха...(рычит) Возможно, ты и хороший боец, но со мной тебе не совладать!
	AI_StopProcessInfos(self);
	Snd_Play("MFX_FEAR_CAST");
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
	SHEMRON_TALK = TRUE;
	SHEMRON_FIGHT = TRUE;
	self.start_aistate = ZS_MM_AllScheduler;
};


instance DIA_SHEMRON_DEMON_BACKSHEPHRE(C_Info)
{
	npc = shemron_demon;
	nr = 1;
	condition = dia_shemron_demon_backshephre_condition;
	information = dia_shemron_demon_backshephre_info;
	permanent = FALSE;
	description = "Хранителю Стонносу нужна Сфера Тьмы!";
};


func int dia_shemron_demon_backshephre_condition()
{
	if((MIS_STONNOSTEST == LOG_Running) && (GIVESHEPHRESHEMRON == TRUE) && (GIVESHEPHRESHEMRONBACK == FALSE))
	{
		return TRUE;
	};
};

func void dia_shemron_demon_backshephre_info()
{
	AI_Output(other,self,"DIA_Shemron_Demon_BackShephre_01_01");	//Хранителю Стонносу нужна Сфера Тьмы! И я намереваюсь во чтобы то ни стало выполнить его поручение.
	AI_Output(self,other,"DIA_Shemron_Demon_BackShephre_01_03");	//Стоннос?! Хммм...(рычит) Ну раз так, тогда в этом нет необходимости, человек.
	AI_Output(self,other,"DIA_Shemron_Demon_BackShephre_01_04");	//Если все, что ты говоришь - правда, и тебя сюда прислал сам глава священного круга - то тогда ты можешь совершенно спокойно забрать ее у меня!
	AI_Output(self,other,"DIA_Shemron_Demon_BackShephre_01_05");	//Вот, возьми этот магический артефакт и отнеси его верховному Хранителю!
	B_GiveInvItems(self,other,itmi_darkshpere,1);
	GIVESHEPHRESHEMRONBACK = TRUE;
	AI_StopProcessInfos(self);
	SHEMRON_TALK = TRUE;
	SHEMRON_FIGHT = FALSE;
	self.aivar[AIV_EnemyOverride] = FALSE;
	self.start_aistate = zs_mm_rtn_demonrest;
};

