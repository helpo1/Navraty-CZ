
instance NONE_117_NERGAL_EXIT(C_Info)
{
	npc = none_117_nergal;
	nr = 999;
	condition = none_117_nergal_exit_condition;
	information = none_117_nergal_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int none_117_nergal_exit_condition()
{
	return TRUE;
};

func void none_117_nergal_exit_info()
{
	AI_StopProcessInfos(self);
};


instance NONE_117_NERGAL_HALLO(C_Info)
{
	npc = none_117_nergal;
	condition = none_117_nergal_hallo_condition;
	information = none_117_nergal_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int none_117_nergal_hallo_condition()
{
	if(XARDASRITUALFAIL == TRUE)
	{
		return TRUE;
	};
};

func void none_117_nergal_hallo_info()
{
	self.name[0] = "Душа Нергала";
	B_GivePlayerXP(100);
	//Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	Snd_Play("DEM_Warn");
	AI_Output(self,other,"NONE_117_Nergal_Hallo_01_01");	//(мертвым голосом) СМЕРТНЫЙ... Значит, именно тебя я должен поблагодарить.
	AI_Output(other,self,"NONE_117_Nergal_Hallo_01_02");	//За что?
	AI_Output(self,other,"NONE_117_Nergal_Hallo_01_03");	//За то, что ты избавил меня от необходимости отвечать на вопросы этого никчемного старикашки-мага.
	AI_Output(self,other,"NONE_117_Nergal_Hallo_01_04");	//И думаю, что в качестве награды за твою услугу... я позволю тебе умереть последним!
	AI_Output(other,self,"NONE_117_Nergal_Hallo_01_06");	//Ну, раз ты собрался убить меня, - может, тогда перед этим ответишь мне всего на один вопрос?
	AI_Output(self,other,"NONE_117_Nergal_Hallo_01_07");	//Хочешь задать вопрос? Ну что же, попробуй, задай его.
	AI_Output(other,self,"NONE_117_Nergal_Hallo_01_08");	//Ответь мне, где я смогу найти Некрономикон?
	AI_Output(self,other,"NONE_117_Nergal_Hallo_01_09");	//Некрономикон? Так меня призвали сюда, чтобы узнать, где я спрятал этот древний артефакт?
	AI_Output(other,self,"NONE_117_Nergal_Hallo_01_10");	//А разве для тебя сейчас это имеет большое значение?
	AI_Output(self,other,"NONE_117_Nergal_Hallo_01_11");	//Нет, абсолютно никакого... Причины могут быть подчас разными, однако итог будет всегда только один.
	AI_Output(other,self,"NONE_117_Nergal_Hallo_01_12");	//Ладно, хватит болтать! Просто ответь на мой вопрос.
	AI_Output(self,other,"NONE_117_Nergal_Hallo_01_13");	//А ты дерзок, как я погляжу... Но мне это нравится!
	AI_Output(self,other,"NONE_117_Nergal_Hallo_01_14");	//Хорошо. Я отвечу на твой вопрос, поскольку ты уже навряд ли сможешь воспользоваться моим ответом.
	AI_Output(self,other,"NONE_117_Nergal_Hallo_01_15");	//Я спрятал эту реликвию там, куда ни одному смертному вроде тебя никогда не попасть...
	AI_Output(self,other,"NONE_117_Nergal_Hallo_01_17");	//На вершине темной башни Ашерона!
	AI_Output(other,self,"NONE_117_Nergal_Hallo_01_18");	//Башня Ашерона? А где она находится?
	AI_Output(self,other,"NONE_117_Nergal_Hallo_01_19");	//Я уже точно не помню...(ностальгически) Ведь это было так давно...
	AI_Output(other,self,"NONE_117_Nergal_Hallo_01_20");	//Выходит, что надо только отыскать эту башню, и, можно считать, что этот артефакт уже у меня в руках.
	AI_Output(self,other,"NONE_117_Nergal_Hallo_01_21");	//Не все так просто, смертный... Мое сокровище охраняет бессмертное создание Тьмы, которое тебе навряд ли удастся одолеть.
	AI_Output(self,other,"NONE_117_Nergal_Hallo_01_22");	//Уверен, что многие пытались это сделать. Но я также уверен в том, что все они сейчас мертвы.
	AI_Output(other,self,"NONE_117_Nergal_Hallo_01_23");	//И что, нет ни одного способа уничтожить это создание?
	AI_Output(self,other,"NONE_117_Nergal_Hallo_01_24");	//Почему же, есть один. Но тебе я его не скажу... Можешь даже не просить.
	AI_Output(other,self,"NONE_117_Nergal_Hallo_01_25");	//Ладно, спасибо и на этом.
	AI_Output(self,other,"NONE_117_Nergal_Hallo_01_26");	//Не за что. А теперь приготовься к смерти... Сейчас я тебя уничтожу!
	B_LogEntry(TOPIC_XARDASTASKSFOUR,"Перед тем как напасть на меня, душа некроманта Нергала заговорила со мной, и любезно согласилась ответить на вопрос о Некрономиконе. Как оказалось, этот артефакт спрятан на вершине некой башни Ашерона, а вход в нее охраняет бессмертное существо, порожденное самой Тьмой. Есть лишь один способ убить его, о котором Нергал мне, конечно, рассказывать не стал. Придется самому найти башню и придумать, как справиться с этим созданием.");
	KNOWWHERENERCONOMICON = TRUE;
	Info_ClearChoices(none_117_nergal_hallo);
	Info_AddChoice(none_117_nergal_hallo,"Ну что же, попробуй, если получится.",none_117_nergal_hallo_ex1);
};

func void none_117_nergal_hallo_ex1()
{
	AI_Output(other,self,"NONE_117_Nergal_Hallo_Ex1_01_01");	//Ну что же, попробуй, если получится.
	AI_Output(self,other,"NONE_117_Nergal_Hallo_Ex1_01_02");	//Аргххх...(мертвым голосом)
	self.flags = NPC_FLAG_NONE;
	Wld_StopEffect("DEMENTOR_FX");
	AI_StopProcessInfos(self);
	self.aivar[AIV_EnemyOverride] = FALSE;
};


