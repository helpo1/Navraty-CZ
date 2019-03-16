
instance DMT_1212_DAGOT_EXIT(C_Info)
{
	npc = dmt_1212_dagot;
	nr = 999;
	condition = dmt_1212_dagot_exit_condition;
	information = dmt_1212_dagot_exit_info;
	important = FALSE;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dmt_1212_dagot_exit_condition()
{
	return TRUE;
};

func void dmt_1212_dagot_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DMT_1212_DAGOT_HELLO(C_Info)
{
	npc = dmt_1212_dagot;
	condition = dmt_1212_dagot_hello_condition;
	information = dmt_1212_dagot_hello_info;
	important = TRUE;
	permanent = FALSE;
};

func int dmt_1212_dagot_hello_condition()
{
	if((Npc_KnowsInfo(other,DIA_Xardas_FirstEXIT) == TRUE) && (Npc_IsInState(self,ZS_Talk) == TRUE))
	{
		return TRUE;
	};
};

func void dmt_1212_dagot_hello_info()
{
	B_GivePlayerXP(100);
	AI_Output(self,other,"DMT_1212_Dagot_Hello_01");	//Я так понимаю, что это ты изгнал Спящего из этого мира?
	AI_Output(other,self,"DMT_1212_Dagot_Hello_02");	//Да, это был я.
	AI_Output(self,other,"DMT_1212_Dagot_Hello_03");	//Ксардас много о тебе рассказывал. Немногим героям этого мира удавались подобные вещи!
	AI_Output(other,self,"DMT_1212_Dagot_Hello_04");	//Кто ты? И что здесь делаешь, в башне Ксардаса?
	AI_Output(self,other,"DMT_1212_Dagot_Hello_05");	//Я - Дагот, один из девяти Хранителей священных Чертогов Вакхана.
	AI_Output(other,self,"DMT_1212_Dagot_Hello_07");	//Ты тоже некромант и заклинатель демонов, как и Ксардас?
	AI_Output(self,other,"DMT_1212_Dagot_Hello_08");	//Если ты имеешь в виду то, что я наделен теми же способностями и могущественной властью рун, дарованной Белиаром, как и Ксардас, - да.
	AI_Output(self,other,"DMT_1212_Dagot_Hello_10");	//Но Ксардас только начинает делать первые шаги этого пути, тогда как мы - Хранители - уже давно следуем ему.
	AI_Output(self,other,"DMT_1212_Dagot_Hello_11");	//Наш путь - это наша жизнь и смысл нашего пребывания в этом мире.
	AI_Output(other,self,"DMT_1212_Dagot_Hello_12");	//А что это за путь?
	AI_Output(self,other,"DMT_1212_Dagot_Hello_13");	//Путь Хранителя. Его смысл нельзя понять и ему нельзя дать определение словом. Это твоя сущность, твой внутренний мир, твоя судьба!
	AI_Output(self,other,"DMT_1212_Dagot_Hello_14");	//Каждому живому существу предопределен свой путь, которому он будет следовать всю свою жизнь - от рождения до смерти.
	AI_Output(other,self,"DMT_1212_Dagot_Hello_15");	//А какой мой путь?
	AI_Output(self,other,"DMT_1212_Dagot_Hello_16");	//Это сейчас тебя волновать не должно. Как и причина моего пребывания здесь.
	AI_Output(other,self,"DMT_1212_Dagot_Hello_18");	//А какому божеству служат Хранители? Я очень сильно сомневаюсь, что те, кто обладает могуществом черной магии, служат богам.
	AI_Output(self,other,"DMT_1212_Dagot_Hello_19");	//Хранители никому не служат. Их цель - хранить баланс этого мира от разрушительного действия того же Белиара, Инноса или Аданоса!
	AI_Output(other,self,"DMT_1212_Dagot_Hello_20");	//Аданоса?! А разве этот бог сам не являет собой цель сохранения баланса между своими братьями?
	AI_Output(self,other,"DMT_1212_Dagot_Hello_22");	//Послушай: неважно, с чем ассоциируется божество - с багровой тьмой Белиара, священным светом Инноса или мудрыми водами Аданоса...
	AI_Output(self,other,"DMT_1212_Dagot_Hello_23");	//Их пути, несмотря на цели, не могут принести тот результат, при котором достигается состояние равновесия этого мира в целом, ибо...
	AI_Output(self,other,"DMT_1212_Dagot_Hello_24");	//...не бывает добра без зла, как не бывает зла без добра, как и не бывает середины без начала и конца!
	AI_Output(self,other,"DMT_1212_Dagot_Hello_25");	//Каждая сила своим вмешательством в этот мир нарушает всю сущность священного баланса...
	AI_Output(self,other,"DMT_1212_Dagot_Hello_26");	//...как нарушил ее Белиар, позволив Спящему прийти в этот мир...
	AI_Output(self,other,"DMT_1212_Dagot_Hello_27");	//...или как нарушил ее Иннос, уничтожив с помощью своих паладинов великие Чертоги Зверя...
	AI_Output(self,other,"DMT_1212_Dagot_Hello_28");	//...или как нарушил ее Аданос, уничтожив все творения своих братьев вместе с тем, что он считал злом.
	AI_Output(self,other,"DMT_1212_Dagot_Hello_29");	//Путь Хранителей проложен как между каждым из этих путей, так и между их общего пути в целом.
	AI_Output(self,other,"DMT_1212_Dagot_Hello_30");	//Если ты сумеешь понять все это - возможно, ты сможешь сам встать на этот путь.
	AI_Output(other,self,"DMT_1212_Dagot_Hello_31");	//То есть ты хочешь сказать, что я тоже смогу стать Хранителем?
	AI_Output(self,other,"DMT_1212_Dagot_Hello_32");	//Возможно, но сейчас слишком рано говорить об этом.
	AI_Output(other,self,"DMT_1212_Dagot_Hello_33");	//А что такое Чертоги Вакхана? Я никогда о них не слышал.
	AI_Output(self,other,"DMT_1212_Dagot_Hello_34");	//Священные Чертоги Вакхана... Древние называли их 'Чертогами Хаоса'. Это место, где нет ничего, кроме пустоты...
	AI_Output(self,other,"DMT_1212_Dagot_Hello_35");	//...и силы, способной навсегда изменить облик этого мира!
	AI_Output(self,other,"DMT_1212_Dagot_Hello_36");	//И даже могущественные божества, такие, как Иннос, Белиар или Аданос, не смогут противостоять этой силе, если она придет в этот мир.
	AI_Output(self,other,"DMT_1212_Dagot_Hello_37");	//A мы - Хранители, стражи этих Чертогов, - призваны для того, чтобы сокрыть это место и ту тайну, что оно хранит тысячелетиями.
	AI_Output(other,self,"DMT_1212_Dagot_Hello_39");	//А что ты хочешь от меня сейчас?
	AI_Output(self,other,"DMT_1212_Dagot_Hello_40");	//Пока я только предлагаю тебе вступить на этот путь, герой. И я могу предложить тебе это только один раз!
	AI_Output(self,other,"DMT_1212_Dagot_Hello_41");	//После ты не сможешь изменить свое решение. Поэтому хорошо подумай, прежде чем дать мне ответ...
	AI_Output(self,other,"DMT_1212_Dagot_Hello_42");	//(властно) Итак, твой выбор?
	DAGOT_MEET = TRUE;
	XARDAS_SPEAKDAGOT = FALSE;
	GUARDIAN_WAY = FALSE;
	Info_ClearChoices(dmt_1212_dagot_hello);
	Info_AddChoice(dmt_1212_dagot_hello,"Нет, это слишком сложно для меня.",dmt_1212_dagot_hello_no);
	Info_AddChoice(dmt_1212_dagot_hello,"Я готов.",dmt_1212_dagot_hello_yes);
};

func void dmt_1212_dagot_hello_yes()
{
	AI_Output(other,self,"DMT_1212_Dagot_Hello_43");	//Я готов.
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	GUARDIAN_WAY = TRUE;
	AI_Output(self,other,"DMT_1212_Dagot_Hello_44");	//Твое решение вписано в великую Книгу Судьбы! Возможно, ты даже не осознаешь, что сейчас сделал.
	AI_Output(self,other,"DMT_1212_Dagot_Hello_45");	//Хотя я не сомневался, что так и будет - ты выбрал путь Хранителя и вступил на него.
	AI_Output(other,self,"DMT_1212_Dagot_Hello_46");	//Что мне теперь делать?
	AI_Output(self,other,"DMT_1212_Dagot_Hello_47");	//Теперь ты можешь заняться своими мирскими делами.
	AI_Output(self,other,"DMT_1212_Dagot_Hello_48");	//Об остальном ты узнаешь позже.
	AI_Output(self,other,"DMT_1212_Dagot_Hello_49");	//Прощай!
	MIS_GUARDIANS = LOG_Running;
	Log_CreateTopic(TOPIC_GUARDIANS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GUARDIANS,LOG_Running);
	B_LogEntry(TOPIC_GUARDIANS,"В башне Ксардаса я встретил одного из Хранителей - Дагота, древнего стража священных Чертогов Вакхана.");
	Log_AddEntry(TOPIC_GUARDIANS,"Я принял предложение Дагота вступить на путь Хранителя. После этого он неожиданно исчез. Наверное, это не последняя наша встреча. Надо посоветоваться с Ксардасом.");
	Info_ClearChoices(dmt_1212_dagot_hello);
	Info_AddChoice(dmt_1212_dagot_hello,"Эй, постой...(надо бы поговорить об этом с Ксардасом)",dmt_1212_dagot_endyes);
};

func void dmt_1212_dagot_hello_no()
{
	AI_Output(other,self,"DMT_1212_Dagot_Hello_50");	//Нет, это все слишком сложно для меня.
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DMT_1212_Dagot_Hello_51");	//Твое решение вписано в великую Книгу Судьбы! Возможно, ты даже не осознаешь, что сейчас сделал.
	AI_Output(self,other,"DMT_1212_Dagot_Hello_52");	//Твой ответ сильно разочаровал меня. Но это означает, что именно так и должно было быть.
	AI_Output(self,other,"DMT_1212_Dagot_Hello_53");	//Больше мы никогда не встретимся. Прощай!
	GUARDIAN_WAY = FALSE;
	MIS_GUARDIANS = LOG_Running;
	Log_CreateTopic(TOPIC_GUARDIANS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GUARDIANS,LOG_Running);
	B_LogEntry(TOPIC_GUARDIANS,"В башне Ксардаса я встретил одного из Хранителей - Дагота, древних стражей священных Чертогов Вакхана.");
	Log_AddEntry(TOPIC_GUARDIANS,"Я отказался от его предложения вступить на путь Хранителя. Больше мы никогда не встретимся. Надо посоветоваться с Ксардасом.");
	Info_ClearChoices(dmt_1212_dagot_hello);
	Info_AddChoice(dmt_1212_dagot_hello,"...(надо бы поговорить об этом с Ксардасом)",dmt_1212_dagot_endno);
};

func void dmt_1212_dagot_endyes()
{
	Npc_ExchangeRoutine(self,"WaitInSecretLab");
	AI_StopProcessInfos(self);
	B_Attack(self,other,0,0);
	Wld_InsertNpc(Wisp,"NW_DMT_1212_DAGOT");
	Wld_InsertNpc(Wisp,"NW_DMT_1213_MORIUS");
	Wld_InsertNpc(Wisp,"NW_DMT_1214_TEGON");
	Wld_InsertNpc(Wisp,"NW_DMT_1215_KELIOS");
	Wld_InsertNpc(Wisp,"NW_DMT_1216_DEMOS");
	Wld_InsertNpc(Wisp,"NW_DMT_1217_FARION");
	Wld_InsertNpc(Wisp,"NW_DMT_1218_GADER");
	Wld_InsertNpc(Wisp,"NW_DMT_1219_NARUS");
	Wld_InsertNpc(Wisp,"NW_DMT_1220_WAKON");
	Wld_InsertNpc(Wisp,"NW_DMT_1297_STONNOS");
};

func void dmt_1212_dagot_endno()
{
	Npc_ExchangeRoutine(self,"WaitInSecretLab");
	AI_StopProcessInfos(self);
	B_Attack(self,other,0,0);
};


instance DMT_1212_DAGOT_HELLOTWO(C_Info)
{
	npc = dmt_1212_dagot;
	condition = dmt_1212_dagot_hellotwo_condition;
	information = dmt_1212_dagot_hellotwo_info;
	important = TRUE;
	permanent = FALSE;
};


func int dmt_1212_dagot_hellotwo_condition()
{
	if((MIS_GUARDIANS == LOG_Running) && (XARDAS_SPEAKDAGOT == TRUE))
	{
		return TRUE;
	};
};

func void dmt_1212_dagot_hellotwo_info()
{
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_00");	//Итак, твой путь привел тебя сюда.
	AI_Output(other,self,"DMT_1212_Dagot_HelloTwo_02");	//Как ты оказался здесь?
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_04");	//Не стоит удивляться этому. Наша встреча была предопределена уже в тот момент, когда ты принял мое предложение.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_05");	//Раньше бы или позже это случилось - значения не имеет. Важен лишь тот факт, что это произошло и ты здесь.
	AI_Output(other,self,"DMT_1212_Dagot_HelloTwo_06");	//Ты ждал меня? Зачем?
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_07");	//Мое присутствие тут, как и наша встреча, означает то, что пришло время тебе узнать больше о нас - Хранителях...
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_08");	//...и сделать свой первый шаг навстречу твоей же судьбе.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_09");	//Ты готов?
	AI_Output(other,self,"DMT_1212_Dagot_HelloTwo_10");	//Да, мастер.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_11");	//Хорошо. Слушай меня внимательно...
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_12");	//На восходе древних времен мир был погружен в хаос. Он не был похож на тот мир, что окружает тебя сейчас.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_13");	//В этом мире не было ничего - одна бесконечная пустота. В этом хаосе зародились четыре стихии - Земля, Вода, Камень и Огонь.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_14");	//Но в хаосе эти стихии несли одно лишь разрушение. И не было им покоя в своей вечной борьбе между собой.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_15");	//И все это привело бы к тому, что они бы сами себя уничтожили и канули в вечность...
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_16");	//И поняли стихии: в мире, где правит Хаос, им нет места. И только избавившись от него, они смогут обрести покой.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_17");	//Тогда, придя на путь согласия между собой, стихии смогли изгнать Великий Хаос и заточить в том месте, где он был порожден...
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_18");	//В Чертогах Вакхана... Навсегда сокрыв его от этого мира за священными вратами, наложив на них великую печать вечности.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_19");	//А для того, чтобы более никто не смог открыть эти врата, каждая стихия породило свое божество...
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_20");	//Так в этот мир пришли четыре брата-божества...
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_21");	//Иннос, порожденный пламенным Огнем, был первым из братьев...
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_22");	//Вторым был Белиар, которого породила земная Тьма...
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_23");	//Аданос стал божеством, которого породила Водная гладь...
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_24");	//И четвертым из братьев стал Стоннос - божество, которое породила твердая Скала...
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_25");	//И эти божества хранили тайну печати и то, что сокрыто ею.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_26");	//Но братья не смогли долго жить в согласии, поскольку каждый считал себя главным божеством, не принимая баланс равновесия стихий.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_27");	//И случилось так, что Белиар, поспорив со своим братом Стонносом, в отчаянной ярости убил его...
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_28");	//И осталось их трое... Именно поэтому до времен людей не дошло имя четвертого божества, которому они бы сейчас поклонялись.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_29");	//Иннос, первый из братьев, осудил действия Белиара, и с тех пор братья возненавидели друг друга...
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_30");	//Аданос же не принял ни сторону Инноса, ни сторону Белиара, а встал между ними, отождествив себя с мудрой серединой в их противостоянии.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_31");	//И забыли братья, зачем они были обращены в этот мир, что нельзя было делать. И чем больше разгоралась их борьба между собой...
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_32");	//... тем больше слабела великая печать вечности, хранившая истинное зло.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_33");	//И явилась опасность того, что Хаос вновь овладеет этим миром и ввергнет всех в пустоту небытия.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_34");	//Тогда стихии, породившие эти божества, более не желавшие смотреть на их вражду и опасавшиеся появления в этом мире Хаоса...
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_35");	//... словом силы велели каждому божеству создать трех Стражей от каждого...
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_36");	//...дабы те, наделенные силой и мудростью своих создателей, хранили священный покой Чертогов Вакхана.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_37");	//Стихия же, лишившаяся своего созданного божества, сама создала одного стража, наделив его могуществом трех и по согласию остальных стихий...
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_38");	//...чтоб более не было разногласия среди стражей, также как и между их создателями, поставила его во главе всех остальных.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_39");	//И так появилось девять Хранителей священного Круга Равновесия и Баланса, и главный Хранитель, владыка Вакханы и повелитель четырех стихий...
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_40");	//... и до сих пор Хранители стоят на страже священных Чертогов.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_41");	//Этому миру были дарованы многие тысячелетия мира и спокойствия.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_42");	//Но вражда между Инносом и Белиаром росла с непреодолимой силой, и последствия этой вражды становились все ужаснее и ужаснее...
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_43");	//И создал Иннос человека, и наделил его своей божественной силой, а Белиар создал зверя, даровав ему свою ярость и гнев...
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_44");	//И так же, как и братья, человек и зверь начали войну друг против друга на Земле...
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_45");	//И вскоре это братоубийственное противостояние стало угрожать этому миру в такой же степени, как и Хаос когда-то угрожал всему живому.
	AI_Output(other,self,"DMT_1212_Dagot_HelloTwo_46");	//А что сделал Аданос? Третий из братьев...
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_47");	//Аданос же, видя, что не может примирить братьев своих, оградил свою священную вотчину от их разрушительной вражды...
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_48");	//...И запретил он своим братьям сеять ужас и смерть там, где ни у Инноса, ни у Белиара не было власти - уничтожая все, что нарушало его священный покой.
	AI_Output(other,self,"DMT_1212_Dagot_HelloTwo_49");	//Ясно. А что можем сделать с этим?
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_50");	//Мы - Хранители - в силах сохранить этот мир от разрушения, ведя его существование по пути равновесия и баланса сил.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_51");	//Поэтому наше вмешательство в божественный конфликт лишь несет цель не дать одной из сторон победить в этом противостоянии.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_52");	//Именно поэтому Ксардас смог разгадать загадку Спящего, тем самым сведя все усилия Белиара привести в этот мир одного из своих самых могущественных демонов на нет.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_53");	//Именно поэтому паладины Инноса не смогли уничтожить два оставшихся Чертога Ирдората, поскольку те просто исчезли. Стихии скрыли их от взора служителей Инноса.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_54");	//И именно поэтому гнев Аданоса не смог предотвратить приход в этот мир самых мощных артефактов древности, созданных его братьями.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_55");	//В этом и есть мудрость пути Хранителей, на который вступил и ты...
	AI_Output(other,self,"DMT_1212_Dagot_HelloTwo_56");	//Но как я смогу стать Хранителем, таким как ты?
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_57");	//Естественно, ты не сможешь им стать, поскольку наше божественное происхождение не имеет ничего общего со смертными, подобными тебе.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_58");	//Но, как и у всех божеств в этом мире, - у нас, Хранителей, тоже есть последователи из сметрных, которые воплощают наши мысли и волю.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_59");	//Как паладины Инноса и маги Огня, как маги воды Аданоса и его кольцо, как слуги Белиара и все создания Тьмы - наши воины несут имя священного Круга Хранителей...
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_60");	//...на своих устах и нашу веру в своих сердцах!
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_61");	//Асгарды - воины стихий, такое они носят имя. Испокон веков они стояли на страже Хранителей и их великой тайны.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_62");	//И только избранные из них удостаивались чести носить имя Пророка - величайшего заклинателя четырех стихий, чье могущество было даровано священными знаниями Круга Хранителей.
	AI_Output(other,self,"DMT_1212_Dagot_HelloTwo_63");	//То есть мой путь - это путь воина стихий?
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_64");	//До того чтобы стать великим воином стихий, тебе еще далеко. Ты только вступил на этот путь, не сделав и шага по нему.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_66");	//Прежде всего, ты должен быть удостоен чести носить имя адепта нашего Круга.
	AI_Output(other,self,"DMT_1212_Dagot_HelloTwo_67");	//Как я смогу удостоиться этой чести, мастер?
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_68");	//Только сами Хранители могут решить - достоин ли ты носить его или нет. Каждый Хранитель даст тебе испытание, которое ты должен пройти.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_69");	//После того как ты получишь одобрение всех девяти Хранителей, ты должен будешь пройти Испытание Веры, и только пройдя его, ты будешь удостоен этой чести.
	AI_Output(other,self,"DMT_1212_Dagot_HelloTwo_70");	//А где мне искать Хранителей, мастер?
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_71");	//(смеется) Не пытайся их искать - твой путь сам приведет тебя к ним, как привел тебя ко мне.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_72");	//Я буду первым Хранителем, чье испытание ты должен будешь пройти.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_73");	//И, получив мое согласие и одобрение, ты сможешь встретится со следующим из нас.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_74");	//Заручившись поддержкой всех Хранителей, ты будешь удостоен чести встретиться с главой нашего Круга - главным Хранителем, владыкой Вакхана.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_75");	//Он объяснит тебе, в чем заключается твое Испытание Веры... Но сейчас тебе еще до этого очень далеко...
	AI_Output(other,self,"DMT_1212_Dagot_HelloTwo_76");	//Я понял, мастер.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_77");	//Итак, ты готов принять мое испытание?
	MIS_GUARDIANSTEST = LOG_Running;
	Log_CreateTopic(TOPIC_GUARDIANSTEST,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GUARDIANSTEST,LOG_Running);
	B_LogEntry(TOPIC_GUARDIANSTEST,"Для того чтобы стать воином стихий, я должен соответствовать Кругу Хранителей. Каждый из них проверит мои силы и настойчивость. В конце предстоит Испытание Веры, которое предложит Главный Страж.");
	Log_AddEntry(TOPIC_GUARDIANSTEST,"Лишь после выполнения испытания одного из Хранителей я смогу предстать перед следующим.");
	Log_AddEntry(TOPIC_GUARDIANS,"В одной из пещер наши пути с Хранителем пересеклись вновь. Дагот поведал мне легенды прошлого. Я узнал о начале мира, о богах, о борьбе богов, о ненависти богов, о Хранителях. О священном Круге равновесия и баланса.");
	Log_AddEntry(TOPIC_GUARDIANS,"Дагот сказал мне, что ни один смертный не может стать Хранителем, и что мой путь - это путь воина стихий, Асгарда. Это цель, к которой я приду в конце своего пути.");
	Info_ClearChoices(dmt_1212_dagot_hellotwo);
	Info_AddChoice(dmt_1212_dagot_hellotwo,"Да, мастер. Я готов.",dmt_1212_dagot_hellotwo_test);
};

func void dmt_1212_dagot_hellotwo_test()
{
	Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_Output(other,self,"DMT_1212_Dagot_HelloTwo_78");	//Да, мастер. Я готов.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_79");	//Хорошо. Я - Дагот, первый Страж бога Белиара и седьмой Хранитель священных Чертогов Вакхана, - даю тебе твое первое испытание...
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_80");	//Ты должен найти и уничтожить одного из древних демонов пламени Баала - Люциана. Принеси мне его сердце - и ты пройдешь мое испытание.
	AI_Output(other,self,"DMT_1212_Dagot_HelloTwo_81");	//Это будет нелегко. А где мне искать этого демона?
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_82");	//Никто и не говорил, что выбранный тобой путь будет легкой прогулкой. Ты должен сам его найти.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_99");	//Но могу дать один совет. Если ты в чем-то сомневаешься, лучше вернуться к началу.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_83");	//Люциан - древнее создание, пришедшее еще со времен возникновения этого мира. Встреча с ним для простого смертного - почти то же самое, что верная смерть.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_84");	//Меня не волнует, как ты это сделаешь. Но без его сердца ты не сможешь получить мое согласие.
	AI_Output(other,self,"DMT_1212_Dagot_HelloTwo_85");	//Хорошо, я найду и уничтожу этого демона.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_86");	//Хорошо! Я буду ждать тебя здесь.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_87");	//(властно) И еще кое-что.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_88");	//Прими от меня это кольцо. Возможно, оно тебе пригодится.
	B_GiveInvItems(self,other,itri_guardians_01,1);
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_89");	//Теперь ступай.
	MIS_DAGOTTEST = LOG_Running;
	Log_CreateTopic(TOPIC_DAGOTTEST,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DAGOTTEST,LOG_Running);
	B_LogEntry(TOPIC_DAGOTTEST,"Мое первое испытание дал мне Хранитель Дагот. Я должен уничтожить древнего демона Люциана и принести его сердце Даготу в качестве доказательства.");
	GUARDIAN_RING = FALSE;
	AI_StopProcessInfos(self);
	Wld_InsertNpc(XOR_12207_WARRIORNATURE,"NW_XARDAS_TOWER_VALLEY_09");
	Wld_InsertNpc(luzian_demon,"NW_XARDAS_TOWER_SECRET_CAVE_04");
};

instance DMT_1212_DAGOT_LUZIAN(C_Info)
{
	npc = dmt_1212_dagot;
	nr = 1;
	condition = dmt_1212_dagot_luzian_condition;
	information = dmt_1212_dagot_luzian_info;
	permanent = FALSE;
	description = "Я принес тебе сердце Люциана!";
};

func int dmt_1212_dagot_luzian_condition()
{
	if((MIS_GUARDIANSTEST == LOG_Running) && (MIS_DAGOTTEST == LOG_Running) && (Npc_HasItems(other,itat_luzianheart) >= 1) && Npc_IsDead(luzian_demon))
	{
		return TRUE;
	};
};

func void dmt_1212_dagot_luzian_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DMT_1212_Dagot_Luzian_00");	//Я принес тебе сердце Люциана!
	AI_Output(self,other,"DMT_1212_Dagot_Luzian_01");	//Покажи мне его.
	B_GiveInvItems(other,self,itat_luzianheart,1);
	AI_Output(self,other,"DMT_1212_Dagot_Luzian_02");	//Да, это его седрце! Ты доказал, что способен на многое, и не пал духом перед смертельной опасностью.
	MIS_DAGOTTEST = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_DAGOTTEST,LOG_SUCCESS);
	B_LogEntry(TOPIC_DAGOTTEST,"Я принес сердце Люциана Хранителю Даготу, и тем самым прошел свое первое испытание.");
	Info_ClearChoices(dmt_1212_dagot_luzian);
	Info_AddChoice(dmt_1212_dagot_luzian,"Теперь ты дашь мне свое согласие, мастер?",dmt_1212_dagot_luzian_pass);
};

func void dmt_1212_dagot_luzian_pass()
{
	AI_Output(other,self,"DMT_1212_Dagot_Luzian_03");	//Теперь ты дашь мне свое согласие, мастер?
	Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_Output(self,other,"DMT_1212_Dagot_Luzian_04");	//Ты доказал, что достоин получить мое согласие.
	AI_Output(self,other,"DMT_1212_Dagot_Luzian_05");	//И ты получил его!
	AI_Output(self,other,"DMT_1212_Dagot_Luzian_06");	//Теперь ступай! Ищи следующего Хранителя - он даст тебе твое следующее испытание.
	AI_Output(self,other,"DMT_1212_Dagot_Luzian_07");	//Прощай.
	B_LogEntry(TOPIC_GUARDIANSTEST,"Я получил согласие Хранителя Дагота на принятие меня в Круг адептов. Теперь я должен искать следующего Хранителя и пройти свое следующее испытание.");
	DAGOT_AGREE = TRUE;
	B_RemoveNpc(XOR_12207_WARRIORNATURE);
	Info_ClearChoices(dmt_1212_dagot_luzian);
	Info_AddChoice(dmt_1212_dagot_luzian,"(закончить разговор)",dmt_1212_dagot_luzian_end);
};

func void dmt_1212_dagot_luzian_end()
{
	Npc_ExchangeRoutine(self,"WaitInSecretLab");
	AI_StopProcessInfos(self);
	B_Attack(self,other,0,0);
};