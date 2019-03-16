
instance DIA_ORCSHAMAN_UR_DAH_EXIT(C_Info)
{
	npc = orcshaman_ur_dah;
	nr = 999;
	condition = dia_orcshaman_ur_dah_exit_condition;
	information = dia_orcshaman_ur_dah_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_orcshaman_ur_dah_exit_condition()
{
	if(URDAHTELLME == FALSE)
	{
		return TRUE;
	}
	else if(URDAHTELLME >= 4)
	{
		return TRUE;
	};
};

func void dia_orcshaman_ur_dah_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ORCSHAMAN_UR_DAH_HELLO(C_Info)
{
	npc = orcshaman_ur_dah;
	condition = dia_orcshaman_ur_dah_hello_condition;
	information = dia_orcshaman_ur_dah_hello_info;
	permanent = FALSE;
	description = "Это ты шаман по имени Ур-Дах?";
};


func int dia_orcshaman_ur_dah_hello_condition()
{
	if(NAGSHORTELLME == TRUE)
	{
		return TRUE;
	};
};

func void dia_orcshaman_ur_dah_hello_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_OrcShaman_Ur_Dah_Hello_01_01");	//Это ты шаман по имени Ур-Дах?
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_Hello_01_02");	//Ты быть прав, человек...(враждебно) Я есть Ур-Дах, верховный шаман клана Высокой Скалы.
	AI_Output(other,self,"DIA_OrcShaman_Ur_Dah_Hello_01_03");	//Значит, я не ошибся - именно ты мне и нужен!
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_Hello_01_04");	//Человек искать меня?! И что ему нужно от Ур-Дах?
	AI_Output(other,self,"DIA_OrcShaman_Ur_Dah_Hello_01_05");	//Я хочу тебя расспросить об одном древнем создании - Духе Воды.
	AI_Output(other,self,"DIA_OrcShaman_Ur_Dah_Hello_01_06");	//Наг Шор, вождь твоего клана, сказал мне, что ты должен кое-что знать об этом.
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_Hello_01_07");	//Дух Воды? Хммм...(задумчиво) А почему человек интересуется этим?!
	AI_Output(other,self,"DIA_OrcShaman_Ur_Dah_Hello_01_08");	//Я слышал, что когда-то давным давно шаманы из одного орочьего племени поработили это существо.
	AI_Output(other,self,"DIA_OrcShaman_Ur_Dah_Hello_01_09");	//И теперь я хочу найти способ вернуть этому созданию свободу!
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_Hello_01_10");	//Так ты хотеть освободить Духа Воды?! Хммм...(очень удивленно) Однако человек очень сильно удивить Ур-Дах!
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_Hello_01_15");	//Человек быть очень смелый, если прийти сюда и говорить о том, что может рассердить орков.
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_Hello_01_16");	//Если человек сказать об этом другим братьям Ур-Даха - орки сейчас убивать человек! Делать из него мертвого.
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_Hello_01_17");	//Ур-Дах полагать, что даже знак силы, который носить человек, мог бы его не спасти.
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_Hello_01_18");	//Однако человек быть мудрый, что говорить это только Ур-Дах.
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_Hello_01_19");	//Ур-Дах выслушать человек и решить, что если человек хотеть освободить Дух Воды - он помогать ему.
	B_LogEntry(TOPIC_WAKONTEST,"Я нашел орка-шамана по имени Ур-Дах. Поначалу он был удивлен моему визиту, но когда я рассказал ему о том, что хочу освободить Духа Воды, неожиданно согласился мне помочь.");
};


instance DIA_ORCSHAMAN_UR_DAH_TELLSTORY(C_Info)
{
	npc = orcshaman_ur_dah;
	condition = dia_orcshaman_ur_dah_tellstory_condition;
	information = dia_orcshaman_ur_dah_tellstory_info;
	permanent = FALSE;
	description = "Расскажи мне, что знаешь о Духе Воды.";
};


func int dia_orcshaman_ur_dah_tellstory_condition()
{
	if(Npc_KnowsInfo(hero,dia_orcshaman_ur_dah_hello))
	{
		return TRUE;
	};
};

func void dia_orcshaman_ur_dah_tellstory_info()
{
	AI_Output(other,self,"DIA_OrcShaman_Ur_Dah_TellStory_01_01");	//Расскажи мне, что знаешь о Духе Воды.
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_01_02");	//Хорошо! Ур-Дах говорить - человек внимательно слушать и запоминать, что ему скажет Ур-Дах.
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_01_04");	//Это быть много зим назад, очень много зим назад - когда Ур-Дах еще не жить здесь.
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_01_05");	//Великий шаман могущественного клана Большой Камень искать силу, которая должна была помочь братьям сражаться с их враг!
	AI_Output(other,self,"DIA_OrcShaman_Ur_Dah_TellStory_01_06");	//Я так понимаю, что Большой Камень - это Высокая Скала?
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_01_07");	//Быть прав, человек!
	AI_Output(other,self,"DIA_OrcShaman_Ur_Dah_TellStory_01_08");	//Понятно. И что было дальше?
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_01_09");	//Братья знать и видеть, что их враг призвать могущественный демон - Крушак и становиться очень сильный! Враг нельзя было победить!
	AI_Output(other,self,"DIA_OrcShaman_Ur_Dah_TellStory_01_10");	//Крушак? Кажется, я знаю, о чем ты говоришь, орк - этого демона еще звали Спящим.
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_01_11");	//Все быть правда, человек. Люди звать Крушака - Спать!
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_01_14");	//Братья тоже искать силу, как и Крушак.
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_01_15");	//Шаманы клана много думать, призывать предков - говорить с ними, искать совет, как быть братьям.
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_01_16");	//Предки говорить шаманам, что в мире есть древнее создание - Дух Воды. Быть очень сильное и давать братьям силу не меньше, чем сила Крушак!
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_01_17");	//Тогда братья искать Духа Воды и очень радоваться, когда находить его в этой долине.
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_01_18");	//Шаманы клана использовать магию, очень сильную магию, чтобы пленить и заточать его в камень, чтобы Дух Воды не смог уйти от братьев.
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_01_19");	//Однако после этого братья не знать, что им делать дальше. Как заполучить силу и могущество Духа Воды!
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_01_22");	//Тогда братья очень сильно злиться и гневаться, что не могут стать сильными, как их враг!
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_01_23");	//Они проклинать Духа Воды и колдовать так, чтобы он никогда не смог получить свободу.
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_01_24");	//Использовать очень древняя и смертельная магия орков, чтобы никто не смог освобождать его, кроме самих шаманов клана.
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_01_25");	//Но потом быть война с враги! (печально) Враги убивать всех шаман клана, и братья больше не могли освободить Духа Воды.
	AI_Output(other,self,"DIA_OrcShaman_Ur_Dah_TellStory_01_27");	//Да, это не самый удачный исход...
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_01_28");	//Но самое плохое быть - что из места, где находиться лагерь клана, уйти вся вода!
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_01_29");	//Нет воды, ничего не расти... быть только один камень.
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_01_30");	//Орки видеть это и уходить в другое место - но там быть то же самое.
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_01_31");	//Братья понять это и возвращаться обратно! Жить рядом с большой камень и быть проклят навсегда!
	AI_Output(other,self,"DIA_OrcShaman_Ur_Dah_TellStory_01_32");	//Выходит, орки сами загнали себя в свою собственную ловушку.
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_01_33");	//Ур-Дах думать так же, как человек - орки наказать себя сами.
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_01_34");	//Поэтому Ур-Дах будет помогать человек освободить Духа Воды!
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_01_35");	//Если у человек получиться это сделать, то возможно, проклятье клан исчезать и вода возвращаться в лагерь.
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_01_36");	//Братьям нужна вода - без воды клан быть слабым и медленно умирать.
	AI_Output(other,self,"DIA_OrcShaman_Ur_Dah_TellStory_01_37");	//Что же, теперь мне все стало ясно.
	URDAHTELLME = URDAHTELLME + 1;
	B_LogEntry(TOPIC_WAKONTEST,"Ур-Дах поведал мне, почему орки клана Высокой Скалы пленили Духа Воды. Не получив от этого создания ту силу, на которую они рассчитывали, орки прокляли Духа Воды и наложили на него древнее заклинание, навсегда сокрыв его от взора этого мира. Как выяснилось позже - для них это тоже не прошло бесследно. Из места где, где обосновался клан, ушла вся вода и больше никогда не выпадали дожди. Проще говоря, орки сами же пострадали от своего проклятия.");
	Log_AddEntry(TOPIC_WAKONTEST,"Что же касается самого Духа Воды - освободить его могли только сами шаманы, которые тогда наложили на него это заклинание. Однако в одной из войн между орками все шаманы клана Высокой Скалы были убиты, и та тайна, которую они хранили, похоже, умерла вместе с ними.");
};


instance DIA_ORCSHAMAN_UR_DAH_TELLSTORY_MAGIC(C_Info)
{
	npc = orcshaman_ur_dah;
	condition = dia_orcshaman_ur_dah_tellstory_magic_condition;
	information = dia_orcshaman_ur_dah_tellstory_magic_info;
	permanent = FALSE;
	description = "Что за магию использовали шаманы?";
};


func int dia_orcshaman_ur_dah_tellstory_magic_condition()
{
	if(Npc_KnowsInfo(hero,dia_orcshaman_ur_dah_tellstory))
	{
		return TRUE;
	};
};

func void dia_orcshaman_ur_dah_tellstory_magic_info()
{
	AI_Output(other,self,"DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_01");	//Что за магию использовали шаманы?
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_02");	//Ур-Дах точно не знать этого. Но слышать, что шаманы делать на жертвенный алтарь клана большой черный кристалл и вкладывать туда магия.
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_03");	//Магия шаман очень древняя, очень сильная... Ур-Дах никогда такого не видеть.
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_04");	//Когда Ур-Дах сам пытаться освободить Духа Воды, то у него ничего не получаться.
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_05");	//Думать, что черный кристалл хранить древняя магия шаман, которая охранять Дух Воды.
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_06");	//Если магия уйти - Дух Воды быть свободен!
	AI_Output(other,self,"DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_07");	//Тогда надо попытаться уничтожить этот кристалл! Ты уже пробовал это сделать?
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_08");	//Ур-Дах уже пробовать... Нельзя сломать, нельзя разрушить!
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_09");	//Поэтому человек сам никогда не трогать кристалл. Иначе, если прикасаться к нему, то сразу умирать!
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_10");	//Ур-Дах не хотеть, чтобы человек умирать - поэтому сейчас говорить ему об этом.
	AI_Output(other,self,"DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_11");	//Спасибо, что предупредил, орк. А еще что-нибудь знаешь об этом кристалле?
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_12");	//Ур-Дах еще слышать, что когда шаман создавать этот кристалл - они сами его ломать!
	AI_Output(other,self,"DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_13");	//Что ты имеешь в виду?
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_14");	//Шаман забирать из него несколько кусок и хранить у себя. Быть очень важная вещь для шаман!
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_15");	//Очень сильно беречь его, никому не показывать, прятать кусок ото всех братьев.
	AI_Output(other,self,"DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_16");	//Но почему это было так важно для них?
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_17");	//Ур-Дах точно не знать этого. Но думать, что кусок из черный кристалл хранить часть его древний магия.
	AI_Output(other,self,"DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_18");	//Если так, то тогда, возможно, это и есть ключ к разгадке тайны шаманов.
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_19");	//Ур-Дах не быть точно уверен в этом, но думать, что возможно человек быть прав.
	AI_Output(other,self,"DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_20");	//Хорошо! Тогда для начала нам надо найти все эти куски. Сколько их было всего?
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_21");	//Кусок кристалл быть столько, сколько быть шаман в клане! Пять шаман - пять кусок.
	AI_Output(other,self,"DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_22");	//Пять шаманов? Да, кажется, мне это опять что-то напоминает.
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_23");	//Почему человек так удивляться? Ур-Дах не понимать...
	AI_Output(other,self,"DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_24");	//Когда-то несколько шаманов из другого племени орков призвали в этот мир Спящего - демона, которого они называли Крушак. И тех шаманов было тоже пять!
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_25");	//Аргхх... Человек быть прав! Теперь Ур-Дах понимать. Говорить, что все это быть очень похожим.
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_26");	//Ур-Дах не знать, почему так. Думать и не понимать.
	AI_Output(other,self,"DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_27");	//Ладно! Давай больше не будем говорить об этом.
	AI_Output(other,self,"DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_28");	//Лучше ответь - где мне искать эти части черного кристалла?
	AI_Output(other,self,"DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_29");	//Насколько я помню, ты сказал что во время войны между орками тех шаманов убили. А эти части, судя по всему, были тогда при них?
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_30");	//Не совсем быть так. Каждый шаман прятать свой кристалл в тайный место - не носить его всегда с собой.
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_31");	//Правда, где прятать никто не знать... И Ур-Дах тоже!
	AI_Output(other,self,"DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_32");	//Ясно. По всей видимости, придется искать их самому.
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_33");	//Ур-Дах надеяться, что у человек все получиться делать. И желать ему удача!
	AI_Output(other,self,"DIA_OrcShaman_Ur_Dah_TellStory_Magic_01_34");	//Спасибо.
	URDAHTELLME = URDAHTELLME + 1;
	B_LogEntry(TOPIC_WAKONTEST,"Чтобы не дать Духу Воды вырваться на свободу, орки-шаманы возвели черный магический кристалл на жертвенном алтаре клана, в который вложили древнее заклинание. Ур-Дах предостерег меня, что касаться кристалла нельзя - его магия мгновенно убьет всякого, кто к нему прикоснется. Кроме того, Ур-Дах сказал, что после своего ритуала каждый из шаманов отколол по куску от этого кристалла. Думаю, эти частицы хранят часть древней магии шаманов и, возможно, являются ключом к освобождению Духа Воды. Мне придется найти эти части и подумать, как их использовать. Только где их искать не знает даже Ур-Дах.");
};


instance DIA_ORCSHAMAN_UR_DAH_TELLSTORY_FIND(C_Info)
{
	npc = orcshaman_ur_dah;
	condition = dia_orcshaman_ur_dah_tellstory_find_condition;
	information = dia_orcshaman_ur_dah_tellstory_find_info;
	permanent = FALSE;
	description = "Где именно орки заточили Духа Воды?";
};


func int dia_orcshaman_ur_dah_tellstory_find_condition()
{
	if(Npc_KnowsInfo(hero,dia_orcshaman_ur_dah_tellstory))
	{
		return TRUE;
	};
};

func void dia_orcshaman_ur_dah_tellstory_find_info()
{
	AI_Output(other,self,"DIA_OrcShaman_Ur_Dah_TellStory_Find_01_01");	//Где именно орки заточили Духа Воды?
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_Find_01_02");	//Человек идти в лагерь клана Высокой Скалы - искать там очень большой камень. Внутри быть Дух Воды!
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_Find_01_03");	//Однако человек не пытаться разрушить камень - это делать нельзя, иначе Дух Воды сразу погибнуть.
	AI_Output(other,self,"DIA_OrcShaman_Ur_Dah_TellStory_Find_01_04");	//Хорошо! Я все понял.
	URDAHTELLME = URDAHTELLME + 1;
	B_LogEntry(TOPIC_WAKONTEST,"По словам Ур-Даха, Дух Воды заточен в большем камне, что находится в лагере клана Высокой Скалы.");
};


instance DIA_ORCSHAMAN_UR_DAH_TELLSTORY_DONE(C_Info)
{
	npc = orcshaman_ur_dah;
	condition = dia_orcshaman_ur_dah_tellstory_done_condition;
	information = dia_orcshaman_ur_dah_tellstory_done_info;
	permanent = FALSE;
	description = "А что мне делать, если я найду части кристалла?";
};


func int dia_orcshaman_ur_dah_tellstory_done_condition()
{
	if(Npc_KnowsInfo(hero,dia_orcshaman_ur_dah_tellstory_magic))
	{
		return TRUE;
	};
};

func void dia_orcshaman_ur_dah_tellstory_done_info()
{
	AI_Output(other,self,"DIA_OrcShaman_Ur_Dah_TellStory_Done_01_01");	//А что мне делать, если я найду недостающие части кристалла?
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_Done_01_02");	//Ур-Дах не может точно сказать это человек, поскольку сам не знать.
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_Done_01_03");	//Но он думать, что человек должен пробовать делать кристалл снова целый. И смотреть, что будет.
	AI_Output(other,self,"DIA_OrcShaman_Ur_Dah_TellStory_Done_01_04");	//Но ты же говорил, что к нему нельзя прикасаться?
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_Done_01_05");	//Ур-Дах так и говорить! Трогать нельзя, иначе быть мертвый.
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_Done_01_06");	//Поэтому человек надо искать защиту от магия кристалла - магию более сильную, чем магия шаман.
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_Done_01_07");	//Такую магию, как магия Духа Воды!
	AI_Output(self,other,"DIA_OrcShaman_Ur_Dah_TellStory_Done_01_09");	//Человек думать долго и хорошо, чтобы не быть мертвый...
	AI_Output(other,self,"DIA_OrcShaman_Ur_Dah_TellStory_Done_01_10");	//Я посмотрю, что можно сделать.
	URDAHTELLME = URDAHTELLME + 1;
	B_LogEntry(TOPIC_WAKONTEST,"Если мне удастся найти все недостающие части кристалла, я должен буду попробовать вернуть их обратно на место. Однако для того, чтобы это сделать, мне потребуется защита от древней магии шаманов. По словам Ур-Даха, это должна быть такая магия, которая по силе будет соизмерима с магией самого Духа Воды.");
};

