
instance DIA_GOMEZ_EXIT(C_Info)
{
	npc = none_104_gomez;
	nr = 999;
	condition = dia_gomez_exit_condition;
	information = dia_gomez_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_gomez_exit_condition()
{
	return TRUE;
};

func void dia_gomez_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GOMEZ_HELLO(C_Info)
{
	npc = none_104_gomez;
	nr = 1;
	condition = dia_gomez_hello_condition;
	information = dia_gomez_hello_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_gomez_hello_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_gomez_hello_info()
{
	AI_Output(self,other,"DIA_Gomez_Hello_01_00");	//Вот наши пути и пересеклись вновь, герой. Кто бы мог подумать.
	AI_Output(self,other,"DIA_Gomez_Hello_01_01");	//Спасибо, что избавил меня от этого гнилого тела, в котором томилась моя душа.
	AI_Output(other,self,"DIA_Gomez_Hello_01_02");	//Гомез?! Ты же...
	AI_Output(self,other,"DIA_Gomez_Hello_01_03");	//Мертв? Ты, наверно, это хотел сказать.
	AI_Output(self,other,"DIA_Gomez_Hello_01_04");	//Могу тебя обрадовать, ты не далек от истины - я действительно мертв.
	AI_Output(other,self,"DIA_Gomez_Hello_01_05");	//Ты заслужил это, ублюдок!
	AI_Output(self,other,"DIA_Gomez_Hello_01_06");	//Ты прав, в свое время я творил просто ужасные вещи.
	AI_Output(other,self,"DIA_Gomez_Hello_01_07");	//Ужасные?! Это еще слабо сказано!
	AI_Output(other,self,"DIA_Gomez_Hello_01_08");	//Чего стоит только та резня ни в чем неповинных магов Огня!
	AI_Output(self,other,"DIA_Gomez_Hello_01_09");	//Ты можешь не сомневаться - за всю эту кровь боги уже заставили меня заплатить высокую цену.
	AI_Output(self,other,"DIA_Gomez_Hello_01_10");	//И теперь у меня есть целая вечность, чтобы подумать и раскаяться во всем, мною совершенном...
};


instance DIA_GOMEZ_HAST(C_Info)
{
	npc = none_104_gomez;
	nr = 1;
	condition = dia_gomez_hast_condition;
	information = dia_gomez_hast_info;
	permanent = FALSE;
	description = "Значит, ты проклят?";
};


func int dia_gomez_hast_condition()
{
	if(Npc_KnowsInfo(hero,dia_gomez_hello))
	{
		return TRUE;
	};
};

func void dia_gomez_hast_info()
{
	AI_Output(other,self,"DIA_Gomez_Hast_01_00");	//Так, значит, ты проклят?
	AI_Output(self,other,"DIA_Gomez_Hast_01_03");	//Да, мертвые, наконец-то, начинают понимать, какова цена власти и золота.
	AI_Output(self,other,"DIA_Gomez_Hast_01_05");	//Я был уверен в том, что могу ВСЕ. И это действительно было именно так!
	AI_Output(self,other,"DIA_Gomez_Hast_01_06");	//В моих руках была власть, которой позавидовал бы сам король.
	AI_Output(self,other,"DIA_Gomez_Hast_01_07");	//Но только сейчас я понял то, что самое ценное у нас - это душа.
	AI_Output(self,other,"DIA_Gomez_Hast_01_08");	//Душа, которой теперь нет покоя.
};


var int gomezpermonetime;

instance DIA_GOMEZ_CANDO(C_Info)
{
	npc = none_104_gomez;
	nr = 5;
	condition = dia_gomez_cando_condition;
	information = dia_gomez_cando_info;
	permanent = TRUE;
	description = "Что ты теперь будешь делать?";
};


func int dia_gomez_cando_condition()
{
	if(Npc_KnowsInfo(hero,dia_gomez_hast) && (MIS_RESCUEGOMEZ != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_gomez_cando_info()
{
	AI_Output(other,self,"DIA_Gomez_CanDo_01_00");	//Что ты теперь будешь делать?
	AI_Output(self,other,"DIA_Gomez_CanDo_01_01");	//Мне нет пути отсюда.
	AI_Output(self,other,"DIA_Gomez_CanDo_01_02");	//Море пролитой когда-то мной крови крепко держит меня в этом месте.
	AI_Output(self,other,"DIA_Gomez_CanDo_01_03");	//Никогда не думал, что стану проклятием своего же замка.
	if(GOMEZPERMONETIME == FALSE)
	{
		AI_Output(other,self,"DIA_Gomez_CanDo_01_04");	//Выходит, ты здесь застрял надолго.
		AI_Output(self,other,"DIA_Gomez_CanDo_01_05");	//Да, на целую вечность.
		AI_Output(self,other,"DIA_Gomez_CanDo_01_06");	//Но если бы ты помог бы мне искупить свою вину и тем самым успокоить мою грешную душу...
		AI_Output(self,other,"DIA_Gomez_CanDo_01_07");	//Тогда бы я смог покинуть это место и обрести долгожданный покой.
		AI_Output(other,self,"DIA_Gomez_CanDo_01_08");	//На мою помощь ты точно не можешь рассчитывать!
		GOMEZPERMONETIME = TRUE;
	};
};


instance DIA_GOMEZ_MRAMORSTATUE(C_Info)
{
	npc = none_104_gomez;
	nr = 1;
	condition = dia_gomez_mramorstatue_condition;
	information = dia_gomez_mramorstatue_info;
	permanent = FALSE;
	description = "Что ты знаешь о мраморных статуэтках?";
};


func int dia_gomez_mramorstatue_condition()
{
	if(Npc_KnowsInfo(hero,dia_gomez_hast) && (MIS_RARETHINGS == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_gomez_mramorstatue_info()
{
	AI_Output(other,self,"DIA_Gomez_MramorStatue_01_00");	//Что ты знаешь о мраморных статуэтках?
	AI_Output(self,other,"DIA_Gomez_MramorStatue_01_01");	//О чем это ты?
	AI_Output(other,self,"DIA_Gomez_MramorStatue_01_02");	//Я о трех статуэтках Инноса, выполненных из черного нордмарского мрамора.
	AI_Output(other,self,"DIA_Gomez_MramorStatue_01_03");	//Один из рудных баронов потребовал их у короля Робара в качестве оплаты за груз магической руды.
	AI_Output(other,self,"DIA_Gomez_MramorStatue_01_04");	//Ты знаешь, где они?
	AI_Output(self,other,"DIA_Gomez_MramorStatue_01_05");	//Конечно. Я тоже был рудным бароном, и в курсе того, где мои предшественники хранили сокровища.
	AI_Output(self,other,"DIA_Gomez_MramorStatue_01_06");	//Но ты должен оказать мне одну небольшую услугу.
	AI_Output(self,other,"DIA_Gomez_MramorStatue_01_08");	//Помоги мне стать свободным! Успокой мою душу, и я поделюсь с тобой всем тем, что знаю сам.
	AI_Output(self,other,"DIA_Gomez_MramorStatue_01_09");	//Мои страдания, эта боль - они просто ужасны!
	AI_Output(self,other,"DIA_Gomez_MramorStatue_01_10");	//И с каждым днем мои мучения становятся все более и более невыносимыми.
	AI_Output(self,other,"DIA_Gomez_MramorStatue_01_11");	//Особенно когда в эту долину пришло огромное зло.
	AI_Output(other,self,"DIA_Gomez_MramorStatue_01_12");	//Откуда тебе это известно? Ты же ни разу не покидал замка?
	AI_Output(self,other,"DIA_Gomez_MramorStatue_01_13");	//Я это чувствую!
	AI_Output(self,other,"DIA_Gomez_MramorStatue_01_14");	//Тлетворные узы этого зла растеклись по всей округе, проникая в каждую щелочку и в каждую душу. И я не исключение.
	AI_Output(other,self,"DIA_Gomez_MramorStatue_01_15");	//Хммм... А если я не стану тебе помогать?
	AI_Output(self,other,"DIA_Gomez_MramorStatue_01_16");	//Тогда ты никогда не сможешь найти то, что ищешь.
	AI_Output(other,self,"DIA_Gomez_MramorStatue_01_17");	//Выходит, у меня нет выбора.
	B_LogEntry(TOPIC_RARETHINGS,"В замке Старого лагеря я повстречался с давним знакомым - рудным бароном Гомезом. Точнее, с его проклятой душой, обличенной в виде призрака. Довольно неожиданная встреча... Пользуясь случаем, я поинтересовался у Гомеза на тему тех драгоценных статуэток, которые так нужны Лютеро. Гомез ответил, что знает, где находятся эти мраморные статуэтки, и согласился указать мне это место. Но при одном условии - я должен буду помочь ему снять проклятие с его души. Похоже, чтобы заполучить нужные мне вещи, я должен буду немного поступиться своими принципами и помочь Гомезу снять его проклятие.");
};


instance DIA_GOMEZ_MRAMORSTATUEHELP(C_Info)
{
	npc = none_104_gomez;
	nr = 1;
	condition = dia_gomez_mramorstatuehelp_condition;
	information = dia_gomez_mramorstatuehelp_info;
	permanent = FALSE;
	description = "Хорошо, я помогу тебе.";
};


func int dia_gomez_mramorstatuehelp_condition()
{
	if(Npc_KnowsInfo(hero,dia_gomez_mramorstatue) && (MIS_RARETHINGS == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_gomez_mramorstatuehelp_info()
{
	AI_Output(other,self,"DIA_Gomez_MramorStatueHelp_01_00");	//Хорошо, я помогу тебе. Что я должен делать?
	AI_Output(self,other,"DIA_Gomez_MramorStatueHelp_01_01");	//Для начала тебе необходимо посетить алтари всех трех великих божеств и помолиться перед ними за мою душу.
	AI_Output(self,other,"DIA_Gomez_MramorStatueHelp_01_02");	//Здесь в долине ты без особого труда сможешь отыскать алтари, посвященные Инносу и Белиару.
	AI_Output(other,self,"DIA_Gomez_MramorStatueHelp_01_03");	//А что насчет с молитвы Аданосу?
	AI_Output(self,other,"DIA_Gomez_MramorStatueHelp_01_04");	//В этом тебе наверняка смогут помочь маги Воды.
	AI_Output(self,other,"DIA_Gomez_MramorStatueHelp_01_05");	//Благословления одного из них будет вполне достаточно.
	AI_Output(self,other,"DIA_Gomez_MramorStatueHelp_01_11");	//После этого тебе следует отправиться в Старую шахту.
	AI_Output(self,other,"DIA_Gomez_MramorStatueHelp_01_12");	//В ней ты должен будешь отыскать как минимум десять неупокоенных душ тех людей, что раньше там работали на меня.
	AI_Output(self,other,"DIA_Gomez_MramorStatueHelp_01_14");	//Позаботься о том, чтобы они обрели, наконец-то, тот покой, которого так жаждут.
	AI_Output(other,self,"DIA_Gomez_MramorStatueHelp_01_15");	//А как же мне это сделать?
	AI_Output(self,other,"DIA_Gomez_MramorStatueHelp_01_16");	//Просто убей их.
	AI_Output(other,self,"DIA_Gomez_MramorStatueHelp_01_17");	//Убить? Хммм... А я смотрю, твои методы решений проблем не отличаются особым разнообразием.
	AI_Output(self,other,"DIA_Gomez_MramorStatueHelp_01_18");	//Поверь, это единственный способ освободить эти души от того проклятия, что наложено на них.
	AI_Output(self,other,"DIA_Gomez_MramorStatueHelp_01_20");	//И запомни...
	AI_Output(self,other,"DIA_Gomez_MramorStatueHelp_01_21");	//...перед тем как убить очередную душу, ты должен будешь испросить у нее прощение для меня.
	AI_Output(self,other,"DIA_Gomez_MramorStatueHelp_01_22");	//И только получив его - обнажай свой меч!
	AI_Output(self,other,"DIA_Gomez_MramorStatueHelp_01_23");	//Иначе все твои действия окажутся бессмысленной тратой времени.
	AI_Output(other,self,"DIA_Gomez_MramorStatueHelp_01_24");	//А зачем тебе понадобилось их прощение?
	AI_Output(self,other,"DIA_Gomez_MramorStatueHelp_01_25");	//Потому что я сам проклял этих людей. И именно по моей вине их души до сих пор не могут обрести покой в этом мире.
	AI_Output(self,other,"DIA_Gomez_MramorStatueHelp_01_27");	//Когда я узнал, что в Старой шахте произошел обвал, я впал в безудержную ярость и был просто взбешен случившимся!
	AI_Output(self,other,"DIA_Gomez_MramorStatueHelp_01_28");	//Мне казалось, что все вокруг меня предали.
	AI_Output(self,other,"DIA_Gomez_MramorStatueHelp_01_29");	//В безнадежных попытках как-то исправить сложившуюся ситуацию я не нашел ничего лучшего, как проклянуть всех тех, кто допустил обрушение этой шахты.
	AI_Output(self,other,"DIA_Gomez_MramorStatueHelp_01_30");	//Шахты, на которой держалась вся моя власть и все мое богатство.
	AI_Output(other,self,"DIA_Gomez_MramorStatueHelp_01_35");	//Да, непростое дело.
	AI_Output(self,other,"DIA_Gomez_MramorStatueHelp_01_36");	//Это еще не все.
	AI_Output(self,other,"DIA_Gomez_MramorStatueHelp_01_37");	//После того, как ты побываешь в Старой шахте, тебе нужно будет вернуться сюда в замок.
	AI_Output(self,other,"DIA_Gomez_MramorStatueHelp_01_39");	//Как ты знаешь, мое самое тяжкое преступление - это убийство Корристо и его магов Огня.
	AI_Output(self,other,"DIA_Gomez_MramorStatueHelp_01_40");	//Поэтому тебе еще будет необходимо провести ритуал вызова душ умерших магов.
	AI_Output(self,other,"DIA_Gomez_MramorStatueHelp_01_43");	//На верхнем этаже в бывшей келье магов Огня сохранилась магическая пентаграмма.
	AI_Output(self,other,"DIA_Gomez_MramorStatueHelp_01_44");	//Используй ее. Для этого встань в середине магического круга и произнеси слова - ФАР АКТУС БЕК НОР КАР!
	AI_Output(self,other,"DIA_Gomez_MramorStatueHelp_01_46");	//Эти слова - часть древнего магического заклинания, которое поможет тебе призвать души умерших в этот мир...
	AI_Output(self,other,"DIA_Gomez_MramorStatueHelp_01_47");	//...и, естественно, как ты сам понимаешь, - только лишь на некоторое время.
	AI_Output(self,other,"DIA_Gomez_MramorStatueHelp_01_49");	//Чтобы ты не забыл их - я дам тебе свиток, где они будут записаны.
	B_GiveInvItems(self,other,itwr_gomezmagicwords,1);
	AI_Output(other,self,"DIA_Gomez_MramorStatueHelp_01_55");	//И каковы мои дальнейшие действия?
	AI_Output(self,other,"DIA_Gomez_MramorStatueHelp_01_56");	//Поговори с каждым из них, и пусть каждый дарует мне свое прощение. Этого будет достаточно!
	AI_Output(self,other,"DIA_Gomez_MramorStatueHelp_01_58");	//Это все. Так что не теряй времени и отправляйся в путь.
	AI_Output(self,other,"DIA_Gomez_MramorStatueHelp_01_59");	//Я буду ждать тебя здесь, и, надеюсь, что ты принесешь мне хорошие новости.
	MIS_RESCUEGOMEZ = LOG_Running;
	RESCUEGOMEZSTEPONE = TRUE;
	Log_CreateTopic(TOPIC_RESCUEGOMEZ,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RESCUEGOMEZ,LOG_Running);
	B_LogEntry(TOPIC_RESCUEGOMEZ,"Для того, чтобы снять проклятие с души Гомеза, мне необходимо сделать три вещи.");
	Log_AddEntry(TOPIC_RESCUEGOMEZ,"Для начала необходимо помолиться за душу рудного барона всем трем богам - Инносу, Белиару и Аданосу. Для молитв первым двум божествам подойдут их алтари, которые я без труда смогу отыскать в Долине Рудников. Что же касается благословения Аданоса, то в этом мне могут помочь маги Воды. Однако, помня тот ужас, который сеял Гомез при жизни, многие из них наверняка откажут мне в этой просьбе. Придется поискать мага, который не знал Гомеза при жизни.");
	Log_AddEntry(TOPIC_RESCUEGOMEZ,"После того, как я получу согласие всех трех божеств, я должен буду отправиться в Старую шахту. Там мне предстоит отыскать как минимум десять неупокоенных душ тех людей, что работали когда-то на Гомеза, и принести им долгожданное упокоение или, проще говоря, убить их всех. Однако перед смертью, души должны дать прощение Гомезу - это очень важный момент.");
	Log_AddEntry(TOPIC_RESCUEGOMEZ,"И в самую последнюю очередь мне необходимо совершить ритуал вызова душ магов Огня, убитых по приказу Гомеза в Старом лагере. Для этого он дал мне свиток со словами древнего заклинания. Ритуал необходимо провести в бывшей келье магов внутри замка, у пентаграммы на верхнем этаже. Души магов также должны согласиться простить злодеяния Гомеза.");
	Log_AddEntry(TOPIC_RESCUEGOMEZ,"После того, как я выполню все эти поручения, мне необходимо будет вернуться к Гомезу.");
};


instance DIA_GOMEZ_ISFREE(C_Info)
{
	npc = none_104_gomez;
	nr = 1;
	condition = dia_gomez_isfree_condition;
	information = dia_gomez_isfree_info;
	permanent = FALSE;
	description = "Ты свободен!";
};


func int dia_gomez_isfree_condition()
{
	if((MIS_RARETHINGS == LOG_Running) && (GOMEZISFREE == TRUE) && (MIS_RESCUEGOMEZ == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_gomez_isfree_info()
{
	B_GivePlayerXP(400);
	GOMEZISFREENOW = TRUE;
	MIS_RESCUEGOMEZ = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_RESCUEGOMEZ,LOG_SUCCESS);
	Log_AddEntry(TOPIC_RESCUEGOMEZ,"Душа Гомеза покинула этот мир.");
	AI_Output(other,self,"DIA_Gomez_IsFree_01_00");	//Ты свободен! Твоя душа прощена.
	AI_Output(self,other,"DIA_Gomez_IsFree_01_01");	//Наконец-то. Я чувствую это! Мои страдания, мои муки - им пришел конец...
	AI_Output(self,other,"DIA_Gomez_IsFree_01_02");	//Это проклятое место больше не удерживает меня. Я действительно свободен!
	AI_Output(other,self,"DIA_Gomez_IsFree_01_04");	//Что насчет тех драгоценных статуэток из нордмарского мрамора? Ты обещал мне сказать, где их искать.
	AI_Output(self,other,"DIA_Gomez_IsFree_01_05");	//Поверь, тебе не придется их искать - они находятся в том сундуке, что стоит позади меня.
	AI_Output(self,other,"DIA_Gomez_IsFree_01_06");	//Я дам тебе ключ, который откроет этот сундук.
	AI_Output(self,other,"DIA_Gomez_IsFree_01_07");	//Вот, возьми его.
	B_GiveInvItems(self,other,itkey_gomeztreasure,1);
	AI_Output(self,other,"DIA_Gomez_IsFree_01_09");	//А теперь мне пора... Прощай!
	B_LogEntry(TOPIC_RARETHINGS,"После того, как я помог Гомезу снять проклятие с его души, он дал мне ключ от сундука, что находится здесь, в старой башне. В этом сундуке и хранятся все три нордмарские статуэтки.");
	Info_ClearChoices(dia_gomez_isfree);
	Info_AddChoice(dia_gomez_isfree,"Прощай, рудный барон...",dia_gomez_isfree_ok);
};

func void dia_gomez_isfree_ok()
{
	AI_StopProcessInfos(self);
	GomezSoulAway = TRUE;
};