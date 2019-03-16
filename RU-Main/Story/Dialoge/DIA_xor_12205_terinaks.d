
instance DIA_XOR_12205_TERINAKS_EXIT(C_Info)
{
	npc = xor_12205_terinaks;
	nr = 999;
	condition = dia_xor_12205_terinaks_exit_condition;
	information = dia_xor_12205_terinaks_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_xor_12205_terinaks_exit_condition()
{
	return TRUE;
};

func void dia_xor_12205_terinaks_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_XOR_12205_TERINAKS_HALLO(C_Info)
{
	npc = xor_12205_terinaks;
	nr = 5;
	condition = dia_xor_12205_terinaks_hallo_condition;
	information = dia_xor_12205_terinaks_hallo_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_xor_12205_terinaks_hallo_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_xor_12205_terinaks_hallo_info()
{
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_HALLO_01_00");	//Хммм. Твое лицо мне знакомо, смертный!
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_HALLO_01_03");	//Ах да. Ты тот, кого Хранители прислали мне на помощь в битве с Люцианом.
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_HALLO_01_05");	//Ну что же... Раз ты сейчас здесь, это было сделано неспроста.
	AI_Output(other,self,"DIA_XOR_12205_Terinaks_HALLO_01_06");	//Это было одно из испытаний Хранителей.
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_HALLO_01_07");	//И полагаю, ты прошел ВСЕ их испытания?
	AI_Output(other,self,"DIA_XOR_12205_Terinaks_HALLO_01_08");	//Да! Хранитель Стоннос принял меня в адепты Круга. Теперь я один из вас.
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_HALLO_01_11");	//Я немного удивлен тому, чего тебе удалось достичь за такой короткий срок.
};


instance DIA_XOR_12205_TERINAKS_WHOYOU(C_Info)
{
	npc = xor_12205_terinaks;
	nr = 1;
	condition = dia_xor_12205_terinaks_whoyou_condition;
	information = dia_xor_12205_terinaks_whoyou_info;
	permanent = FALSE;
	description = "Кто ты?";
};


func int dia_xor_12205_terinaks_whoyou_condition()
{
	return TRUE;
};

func void dia_xor_12205_terinaks_whoyou_info()
{
	AI_Output(other,self,"DIA_XOR_12205_Terinaks_WhoYou_01_00");	//Кто ты?
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_WhoYou_01_01");	//Мое имя Таринакс, и я наставник Асгардов, воинов стихий.
	AI_Output(other,self,"DIA_XOR_12205_Terinaks_WhoYou_01_02");	//А кто такие Асгарды?
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_WhoYou_01_06");	//Основное предназначение Асгардов - нести божественную мудрость Хранителей в этот мир.
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_WhoYou_01_07");	//Мы все являемся их преданными и покорными слугами, беспрекословно следующими их божественной воле...
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_WhoYou_01_08");	//...и готовы не задумываясь пожертвовать своей жизнью ради тех целей, которые они преследуют.
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_WhoYou_01_09");	//Тот же, кто усомнится в их деяниях, - просто не достоин быть воином стихий, ибо смысл нашей жизни только в служении Творцам!
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_WhoYou_01_10");	//Асгарды также являются личной стражей Хранителей и хранят их священный покой в этих чертогах.
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_WhoYou_01_12");	//Как и у всех прочих божеств, у Творцов также найдутся враги, готовые с радостью их уничтожить.
};


instance DIA_XOR_12205_TERINAKS_CANTEACHME(C_Info)
{
	npc = xor_12205_terinaks;
	nr = 1;
	condition = dia_xor_12205_terinaks_canteachme_condition;
	information = dia_xor_12205_terinaks_canteachme_info;
	permanent = FALSE;
	description = "Чему ты можешь меня научить?";
};


func int dia_xor_12205_terinaks_canteachme_condition()
{
	if(Npc_KnowsInfo(hero,dia_xor_12205_terinaks_whoyou) && (GUARDIANTEACHMEWAR == FALSE))
	{
		return TRUE;
	};
};

func void dia_xor_12205_terinaks_canteachme_info()
{
	AI_Output(other,self,"DIA_XOR_12205_Terinaks_CanTeachMe_01_00");	//Чему ты можешь меня научить?
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_CanTeachMe_01_01");	//Много чему. Но я обучаю только Асгардов и тех, кто выбрал этот путь.
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_CanTeachMe_01_02");	//Ты же пока не вступил на этот путь. Поэтому нам пока не о чем разговаривать!
};


instance DIA_XOR_12205_TERINAKS_PERM(C_Info)
{
	npc = xor_12205_terinaks;
	nr = 4;
	condition = dia_xor_12205_terinaks_perm_condition;
	information = dia_xor_12205_terinaks_perm_info;
	permanent = TRUE;
	description = "Как обстоят дела?";
};


func int dia_xor_12205_terinaks_perm_condition()
{
	if(Npc_KnowsInfo(hero,dia_xor_12205_terinaks_whoyou))
	{
		return TRUE;
	};
};

func void dia_xor_12205_terinaks_perm_info()
{
	AI_Output(other,self,"DIA_XOR_12205_Terinaks_Perm_01_00");	//Как обстоят дела?
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_Perm_01_01");	//Все спокойно.
};


instance DIA_XOR_12205_TERINAKS_TEACHME(C_Info)
{
	npc = xor_12205_terinaks;
	nr = 1;
	condition = dia_xor_12205_terinaks_teachme_condition;
	information = dia_xor_12205_terinaks_teachme_info;
	permanent = FALSE;
	description = "Меня прислали к тебе Хранители.";
};


func int dia_xor_12205_terinaks_teachme_condition()
{
	if(Npc_KnowsInfo(hero,dia_xor_12205_terinaks_whoyou) && (GUARDIANTEACHMEWAR == TRUE))
	{
		return TRUE;
	};
};

func void dia_xor_12205_terinaks_teachme_info()
{
	AI_Output(other,self,"DIA_XOR_12205_Terinaks_TeachMe_01_00");	//Меня прислали к тебе Хранители.
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_TeachMe_01_01");	//Хорошо. Что хотят от меня Творцы?
	AI_Output(other,self,"DIA_XOR_12205_Terinaks_TeachMe_01_02");	//Они хотят, чтобы ты стал моим наставником. Мой путь - это путь воина!
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_TeachMe_01_03");	//Что же, если на то их воля, то так тому и быть - я стану твоим наставником и учителем.
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_TeachMe_01_04");	//Однако ты должен понять, что вступить на путь Воина Стихий...
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_TeachMe_01_05");	//...это великая честь, которой удостаиваются лишь немногие избранные.
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_TeachMe_01_08");	//В твоей жизни должна остаться лишь одна цель, и эта цель - служение Творцам и их заветам!
	AI_Output(other,self,"DIA_XOR_12205_Terinaks_TeachMe_01_12");	//А чему ты сможешь меня обучить?
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_TeachMe_01_13");	//Искусству боя.
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_TeachMe_01_14");	//Для Асгардов это основная дисциплина, в которой им нет равных среди остальных смертных.
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_TeachMe_01_18");	//И когда ты будешь готов встать в наши ряды, я посвящу тебя в секреты ковки самых лучших доспехов, которые только есть в этом мире.
	B_LogEntry(TOPIC_GUARDIANS,"Я поговорил с мастером Таринаксом. Теперь он станет моим наставником и сможет обучить меня искусству воина.");
	TARINAKSTEACHME = TRUE;
};


instance DIA_XOR_12205_TERINAKS_BEXOR(C_Info)
{
	npc = xor_12205_terinaks;
	nr = 1;
	condition = dia_xor_12205_terinaks_bexor_condition;
	information = dia_xor_12205_terinaks_bexor_info;
	permanent = FALSE;
	description = "Как мне стать Асгардом?";
};


func int dia_xor_12205_terinaks_bexor_condition()
{
	if(TARINAKSTEACHME == TRUE)
	{
		return TRUE;
	};
};

func void dia_xor_12205_terinaks_bexor_info()
{
	AI_Output(other,self,"DIA_XOR_12205_Terinaks_BeXOR_01_00");	//Как мне стать Асгардом?
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_BeXOR_01_01");	//Для этого ты должен будешь победить одного из нас в честном бою.
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_BeXOR_01_03");	//Но, как ты понимаешь, сделать это будет довольно непросто.
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_BeXOR_01_04");	//Однако если ты почувствуешь вдруг в себе силу бросить нам вызов, скажи мне об этом.
	B_LogEntry(TOPIC_GUARDIANS,"Чтобы стать Асгардом, воином Стихий, я должен бросить вызов одному из этих воинов и победить его.");
};


var int chalangeharadrimfirsttime;

instance DIA_XOR_12205_TERINAKS_BATTLE(C_Info)
{
	npc = xor_12205_terinaks;
	nr = 1;
	condition = dia_xor_12205_terinaks_battle_condition;
	information = dia_xor_12205_terinaks_battle_info;
	permanent = TRUE;
	description = "Я готов бросить вызов одному из вас!";
};


func int dia_xor_12205_terinaks_battle_condition()
{
	if(Npc_KnowsInfo(hero,dia_xor_12205_terinaks_bexor) && (TARINAKSBATTLEWIN == FALSE) && (TARINAKSTEACHME == TRUE) && (CHALANGEHARADRIMSTART == FALSE))
	{
		return TRUE;
	};
};

func void dia_xor_12205_terinaks_battle_info()
{
	AI_Output(other,self,"DIA_XOR_12205_Terinaks_Battle_01_00");	//Я готов бросить вызов одному из вас!
	if(Kapitel >= 5)
	{
		AI_Output(self,other,"DIA_XOR_12205_Terinaks_Battle_01_01");	//Ну хорошо. Ты в этом точно уверен?
		Info_ClearChoices(dia_xor_12205_terinaks_battle);
		Info_AddChoice(dia_xor_12205_terinaks_battle,"Нет, я передумал.",dia_xor_12205_terinaks_battle_no);
		Info_AddChoice(dia_xor_12205_terinaks_battle,"Да, я уверен.",dia_xor_12205_terinaks_battle_ok);
	}
	else
	{
		AI_Output(self,other,"DIA_XOR_12205_Terinaks_Battle_01_02");	//Ты еще не готов к этому!
		AI_Output(self,other,"DIA_XOR_12205_Terinaks_Battle_01_04");	//Ты еще слаб, и никак пока не проявил себя, чтобы я поверил в это.
		AI_Output(self,other,"DIA_XOR_12205_Terinaks_Battle_01_05");	//Я позволю тебе сразиться с одним из нас только тогда, когда сам увижу, что ты готов к этому испытанию.
		AI_StopProcessInfos(self);
	};
};

func void dia_xor_12205_terinaks_battle_no()
{
	AI_Output(other,self,"DIA_XOR_12205_Terinaks_Battle_No_01_00");	//Нет, я передумал.
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_Battle_No_01_01");	//Хорошо. Тогда вернемся к этому, когда ты будешь готов.
	Info_ClearChoices(dia_xor_12205_terinaks_battle);
};

func void dia_xor_12205_terinaks_battle_ok()
{
	AI_Output(other,self,"DIA_XOR_12205_Terinaks_Battle_Ok_01_00");	//Да, я готов.
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_Battle_Ok_01_01");	//Ну что же, хорошо. В таком случае один из моих воинов уже ожидает тебя.
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_Battle_Ok_01_02");	//Одержи над ним победу, и ты будешь принят в наш Священный Круг!

	if(CHALANGEHARADRIMFIRSTTIME == FALSE)
	{
		AI_Output(other,self,"DIA_XOR_12205_Terinaks_Battle_Ok_01_03");	//Где именно я должен буду сразиться с ним?
		AI_Output(self,other,"DIA_XOR_12205_Terinaks_Battle_Ok_01_04");	//Камень телепортации, что находится в центре этих чертогов, приведет тебя в нужное место.
		AI_Output(self,other,"DIA_XOR_12205_Terinaks_Battle_Ok_01_05");	//Теперь ступай! Битва ждет тебя.
		CHALANGEHARADRIMFIRSTTIME = TRUE;
	};

	CHALANGEHARADRIMSTART = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_XOR_12205_TERINAKS_BATTLEWIN(C_Info)
{
	npc = xor_12205_terinaks;
	nr = 1;
	condition = dia_xor_12205_terinaks_battlewin_condition;
	information = dia_xor_12205_terinaks_battlewin_info;
	permanent = FALSE;
	description = "Я выиграл этот бой.";
};

func int dia_xor_12205_terinaks_battlewin_condition()
{
	if(Npc_KnowsInfo(hero,dia_xor_12205_terinaks_bexor) && (TARINAKSBATTLEWIN == TRUE) && (TARINAKSTEACHME == TRUE))
	{
		return TRUE;
	};
};

func void dia_xor_12205_terinaks_battlewin_info()
{
	B_GivePlayerXP(2000);
	AI_Output(other,self,"DIA_XOR_12205_Terinaks_BattleWin_01_00");	//Я выиграл этот бой.
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_BattleWin_01_01");	//Ну что же, мои уроки не прошли для тебя даром.
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_BattleWin_01_03");	//Победить Асгарда в честном бою может только другой Асгард. А это значит лишь одно - ты доказал, что готов стать им!
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_BattleWin_01_05");	//Теперь ты один из нас.
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_BattleWin_01_06");	//И в знак моего признания твоего статуса прими от меня вот этот меч. Меч Асгарда!
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_BattleWin_01_07");	//Это оружие не знает себе равных в бою и является символом нашего Священного Круга.
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_BattleWin_01_08");	//Он станет частью тебя, и на острие его клинка ты понесешь в этот мир силу и мудрость Творцов!
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_BattleWin_01_09");	//Однако, прежде чем я тебе его дам, ты должен будешь ответить на один несложный вопрос.
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_BattleWin_01_10");	//Какой тип оружия ты предпочитаешь - одноручный или двуручный?
	BEHARADRIM = TRUE;
	Snd_Play("LevelUP");
	B_LogEntry(TOPIC_GUARDIANS,"Мастер Таринакс возвел меня в ранг Асгарда. Теперь я воин Стихий.");
	Info_ClearChoices(dia_xor_12205_terinaks_battlewin);
	Info_AddChoice(dia_xor_12205_terinaks_battlewin,"Я предпочитаю одноручный меч.",dia_xor_12205_terinaks_battlewin_1h);
	Info_AddChoice(dia_xor_12205_terinaks_battlewin,"Я предпочитаю двуручный меч.",dia_xor_12205_terinaks_battlewin_2h);
};

func void dia_xor_12205_terinaks_battlewin_1h()
{
	AI_Output(other,self,"DIA_XOR_12205_Terinaks_BattleWin_1H_01_00");	//Я предпочитаю одноручный меч.
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_BattleWin_1H_01_01");	//Хорошо. Возьми этот клинок. Носи его с гордостью и честью, честью Асгарда!
	CreateInvItems(self,itmw_1h_xaradrim,1);
	B_GiveInvItems(self,other,itmw_1h_xaradrim,1);
	Info_ClearChoices(dia_xor_12205_terinaks_battlewin);
};

func void dia_xor_12205_terinaks_battlewin_2h()
{
	AI_Output(other,self,"DIA_XOR_12205_Terinaks_BattleWin_2H_01_00");	//Я предпочитаю двуручный меч.
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_BattleWin_2H_01_01");	//Хорошо. Возьми этот клинок. Носи его с гордостью и честью, честью Асгарда!
	CreateInvItems(self,itmw_2h_xaradrim,1);
	B_GiveInvItems(self,other,itmw_2h_xaradrim,1);
	Info_ClearChoices(dia_xor_12205_terinaks_battlewin);
};


instance DIA_XOR_12205_TERINAKS_ARMOR(C_Info)
{
	npc = xor_12205_terinaks;
	nr = 2;
	condition = dia_xor_12205_terinaks_armor_condition;
	information = dia_xor_12205_terinaks_armor_info;
	permanent = FALSE;
	description = "Что насчет доспехов?";
};


func int dia_xor_12205_terinaks_armor_condition()
{
	if((BEHARADRIM == TRUE) && ((SBMode == TRUE) || (RealMode[2] == TRUE)))
	{
		return TRUE;
	};
};

func void dia_xor_12205_terinaks_armor_info()
{
	AI_Output(other,self,"DIA_XOR_12205_Terinaks_Armor_01_00");	//Что насчет доспехов?
	AI_Output(other,self,"DIA_XOR_12205_Terinaks_Armor_01_01");	//Ты говорил, что сможешь обучить меня секрету их ковки.
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_Armor_01_02");	//Конечно. Каждый асгард носит подобную броню.
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_Armor_01_03");	//Существуют два типа доспеха, секретам ковки которых я смогу тебя обучить.
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_Armor_01_04");	//Однако выбрать ты сможешь только один. Поэтому подумай хорошенько, прежде чем сделать свой выбор.
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_Armor_01_05");	//Итак, какой из них ты выбираешь?
	Info_ClearChoices(dia_xor_12205_terinaks_armor);
	Info_AddChoice(dia_xor_12205_terinaks_armor,"Доспехи Тьмы (Требование экипировки: 500 или более ловкости)",dia_xor_12205_terinaks_armor_dark);
	Info_AddChoice(dia_xor_12205_terinaks_armor,"Доспехи Света (Требование экипировки: 500 или более силы)",dia_xor_12205_terinaks_armor_light);
};

func void dia_xor_12205_terinaks_armor_dark()
{
	AI_Output(other,self,"DIA_XOR_12205_Terinaks_Armor_Dark_01_00");	//Я выбираю рудные доспехи Тьмы.
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_Armor_Dark_01_01");	//Хорошо. Это твой выбор! Теперь ты сможешь сам выковать этот доспех.
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_Armor_Dark_01_02");	//Это большая честь, которая выпадает немногим.
	AI_Print("Изучен рецепт ковки - 'Рудные доспехи Тьмы'");
	Npc_SetTalentSkill(other,NPC_TALENT_SMITH,1);
	Snd_Play("LevelUP");
	PLAYER_TALENT_SMITH[34] = TRUE;
	PLAYER_TALENT_SMITH_34 = TRUE;
	B_LogEntry(TOPIC_ARMORTEACHER,"Для того, чтобы выковать доспехи Тьмы мне необходимо: десять слитков из магической руды, два куска черной руды, десять кусков серы, пять смоляных растворов, пять кусков угля, черный жемчуг и кусок адаманта.");
	Info_ClearChoices(dia_xor_12205_terinaks_armor);
};

func void dia_xor_12205_terinaks_armor_light()
{
	AI_Output(other,self,"DIA_XOR_12205_Terinaks_Armor_Light_01_00");	//Я выбираю рудные доспехи Света.
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_Armor_Light_01_01");	//Хорошо. Это твой выбор! Теперь ты сможешь сам выковать этот доспех.
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_Armor_Light_01_02");	//Это большая честь, которая выпадает немногим.
	AI_Print("Изучен рецепт ковки - 'Рудные доспехи Света'");
	Npc_SetTalentSkill(other,NPC_TALENT_SMITH,1);
	Snd_Play("LevelUP");
	PLAYER_TALENT_SMITH[33] = TRUE;
	PLAYER_TALENT_SMITH_33 = TRUE;
	B_LogEntry(TOPIC_ARMORTEACHER,"Для того чтобы выковать рудные доспехи Света мне необходимо: десять слитков из магической руды, кусок черной руды, десять кусков серы, пять смоляных растворов, пять кусков кварца, аквамарин и кусок адаманта.");
	Info_ClearChoices(dia_xor_12205_terinaks_armor);
};

instance DIA_XOR_12205_TERINAKS_ADAMANT(C_Info)
{
	npc = xor_12205_terinaks;
	nr = 2;
	condition = dia_xor_12205_terinaks_ADAMANT_condition;
	information = dia_xor_12205_terinaks_ADAMANT_info;
	permanent = FALSE;
	description = "Насчет доспехов...";
};

func int dia_xor_12205_terinaks_ADAMANT_condition()
{
	if((PLAYER_TALENT_SMITH[33] == TRUE) || (PLAYER_TALENT_SMITH[34] == TRUE))
	{
		return TRUE;
	};
};

func void dia_xor_12205_terinaks_ADAMANT_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self,"DIA_XOR_12205_Terinaks_ADAMANT_01_00");	//Насчет доспехов...
	AI_Output(other,self,"DIA_XOR_12205_Terinaks_ADAMANT_01_01");	//Для их ковки требуется некий адамант. Что это такое?
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_ADAMANT_01_02");	//Это очень редкий металл почти божественного происхождения. Все доспехи Асгардов сделаны именно из него.
	AI_Output(other,self,"DIA_XOR_12205_Terinaks_ADAMANT_01_03");	//И где мне его достать?
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_ADAMANT_01_04");	//Обычно его залежи встречаются только в местах огромного скопления магической энергии.
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_ADAMANT_01_05");	//Ибо только очень сильная магия способна превратить обычную руду в этот бесценный металл.
	B_LogEntry(TOPIC_ARMORTEACHER,"По словам Таринакса, адамант можно найти только в местах с огромным сосредоточением магии.");
};

instance DIA_XOR_12205_TERINAKS_PERMTASK(C_Info)
{
	npc = xor_12205_terinaks;
	nr = 2;
	condition = dia_xor_12205_terinaks_permtask_condition;
	information = dia_xor_12205_terinaks_permtask_info;
	permanent = FALSE;
	description = "У тебя есть для меня какие-нибудь поручения?";
};

func int dia_xor_12205_terinaks_permtask_condition()
{
	if(TARINAKSTEACHME == TRUE)
	{
		return TRUE;
	};
};

func void dia_xor_12205_terinaks_permtask_info()
{
	AI_Output(other,self,"DIA_XOR_12205_Terinaks_PermTask_01_00");	//У тебя есть для меня какие-нибудь поручения?
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_PermTask_01_01");	//Боюсь, что нет. Думаю, тебе следует поговорить о этом с Хранителями.
};


instance DIA_XOR_12205_TERINAKS_TEACH_MELEE(C_Info)
{
	npc = xor_12205_terinaks;
	nr = 7;
	condition = dia_xor_12205_terinaks_teach_melee_condition;
	information = dia_xor_12205_terinaks_teach_melee_info;
	permanent = TRUE;
	description = "Обучи меня владению оружием ближнего боя.";
};

func int dia_xor_12205_terinaks_teach_melee_condition()
{
	if(TARINAKSTEACHME == TRUE)
	{
		return TRUE;
	};
};

func void dia_xor_12205_terinaks_teach_melee_info()
{
	AI_Output(other,self,"DIA_XOR_12205_Terinaks_Teach_Melee_01_00");	//Обучи меня владению оружием ближнего боя.
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_Teach_Melee_01_01");	//Хорошо. Что ты хочешь узнать?
	Info_ClearChoices(dia_xor_12205_terinaks_teach_melee);
	Info_AddChoice(dia_xor_12205_terinaks_teach_melee,Dialog_Back,dia_xor_12205_terinaks_teach_melee_back);
	Info_AddChoice(dia_xor_12205_terinaks_teach_melee,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_xor_12205_terinaks_teach_melee_2h_1);
	Info_AddChoice(dia_xor_12205_terinaks_teach_melee,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_xor_12205_terinaks_teach_melee_2h_5);
	Info_AddChoice(dia_xor_12205_terinaks_teach_melee,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_xor_12205_terinaks_teach_melee_1h_1);
	Info_AddChoice(dia_xor_12205_terinaks_teach_melee,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_xor_12205_terinaks_teach_melee_1h_5);
};

func void dia_xor_12205_terinaks_teach_melee_back()
{
	Info_ClearChoices(dia_xor_12205_terinaks_teach_melee);
};

func void dia_xor_12205_terinaks_teach_melee_1h_1()
{
	if(b_teachfighttalentpercenttarinaks(self,other,NPC_TALENT_1H,1,100))
	{
		Info_ClearChoices(dia_xor_12205_terinaks_teach_melee);
		Info_AddChoice(dia_xor_12205_terinaks_teach_melee,Dialog_Back,dia_xor_12205_terinaks_teach_melee_back);
		Info_AddChoice(dia_xor_12205_terinaks_teach_melee,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_xor_12205_terinaks_teach_melee_2h_1);
		Info_AddChoice(dia_xor_12205_terinaks_teach_melee,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_xor_12205_terinaks_teach_melee_2h_5);
		Info_AddChoice(dia_xor_12205_terinaks_teach_melee,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_xor_12205_terinaks_teach_melee_1h_1);
		Info_AddChoice(dia_xor_12205_terinaks_teach_melee,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_xor_12205_terinaks_teach_melee_1h_5);
	};
};

func void dia_xor_12205_terinaks_teach_melee_1h_5()
{
	if(b_teachfighttalentpercenttarinaks(self,other,NPC_TALENT_1H,5,100))
	{
		Info_ClearChoices(dia_xor_12205_terinaks_teach_melee);
		Info_AddChoice(dia_xor_12205_terinaks_teach_melee,Dialog_Back,dia_xor_12205_terinaks_teach_melee_back);
		Info_AddChoice(dia_xor_12205_terinaks_teach_melee,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_xor_12205_terinaks_teach_melee_2h_1);
		Info_AddChoice(dia_xor_12205_terinaks_teach_melee,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_xor_12205_terinaks_teach_melee_2h_5);
		Info_AddChoice(dia_xor_12205_terinaks_teach_melee,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_xor_12205_terinaks_teach_melee_1h_1);
		Info_AddChoice(dia_xor_12205_terinaks_teach_melee,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_xor_12205_terinaks_teach_melee_1h_5);
	};
};

func void dia_xor_12205_terinaks_teach_melee_2h_1()
{
	if(b_teachfighttalentpercenttarinaks(self,other,NPC_TALENT_2H,1,100))
	{
		Info_ClearChoices(dia_xor_12205_terinaks_teach_melee);
		Info_AddChoice(dia_xor_12205_terinaks_teach_melee,Dialog_Back,dia_xor_12205_terinaks_teach_melee_back);
		Info_AddChoice(dia_xor_12205_terinaks_teach_melee,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_xor_12205_terinaks_teach_melee_2h_1);
		Info_AddChoice(dia_xor_12205_terinaks_teach_melee,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_xor_12205_terinaks_teach_melee_2h_5);
		Info_AddChoice(dia_xor_12205_terinaks_teach_melee,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_xor_12205_terinaks_teach_melee_1h_1);
		Info_AddChoice(dia_xor_12205_terinaks_teach_melee,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_xor_12205_terinaks_teach_melee_1h_5);
	};
};

func void dia_xor_12205_terinaks_teach_melee_2h_5()
{
	if(b_teachfighttalentpercenttarinaks(self,other,NPC_TALENT_2H,5,100))
	{
		Info_ClearChoices(dia_xor_12205_terinaks_teach_melee);
		Info_AddChoice(dia_xor_12205_terinaks_teach_melee,Dialog_Back,dia_xor_12205_terinaks_teach_melee_back);
		Info_AddChoice(dia_xor_12205_terinaks_teach_melee,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_xor_12205_terinaks_teach_melee_2h_1);
		Info_AddChoice(dia_xor_12205_terinaks_teach_melee,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_xor_12205_terinaks_teach_melee_2h_5);
		Info_AddChoice(dia_xor_12205_terinaks_teach_melee,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_xor_12205_terinaks_teach_melee_1h_1);
		Info_AddChoice(dia_xor_12205_terinaks_teach_melee,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_xor_12205_terinaks_teach_melee_1h_5);
	};
};


instance DIA_XOR_12205_TERINAKS_TEACH_RANGED(C_Info)
{
	npc = xor_12205_terinaks;
	nr = 8;
	condition = dia_xor_12205_terinaks_teach_ranged_condition;
	information = dia_xor_12205_terinaks_teach_ranged_info;
	permanent = TRUE;
	description = "Обучи меня владению оружием дальнего боя.";
};


func int dia_xor_12205_terinaks_teach_ranged_condition()
{
	if(TARINAKSTEACHME == TRUE)
	{
		return TRUE;
	};
};

func void dia_xor_12205_terinaks_teach_ranged_info()
{
	AI_Output(other,self,"DIA_XOR_12205_Terinaks_Teach_Ranged_01_00");	//Обучи меня владению оружием дальнего боя.
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_Teach_Ranged_01_01");	//Хорошо. Что ты хочешь узнать?
	Info_ClearChoices(dia_xor_12205_terinaks_teach_ranged);
	Info_AddChoice(dia_xor_12205_terinaks_teach_ranged,Dialog_Back,dia_xor_12205_terinaks_teach_ranged_back);
	Info_AddChoice(dia_xor_12205_terinaks_teach_ranged,B_BuildLearnString(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),dia_xor_12205_terinaks_teach_ranged_2h_1);
	Info_AddChoice(dia_xor_12205_terinaks_teach_ranged,B_BuildLearnString(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),dia_xor_12205_terinaks_teach_ranged_2h_5);
	Info_AddChoice(dia_xor_12205_terinaks_teach_ranged,B_BuildLearnString(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),dia_xor_12205_terinaks_teach_ranged_1h_1);
	Info_AddChoice(dia_xor_12205_terinaks_teach_ranged,B_BuildLearnString(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),dia_xor_12205_terinaks_teach_ranged_1h_5);
};

func void dia_xor_12205_terinaks_teach_ranged_back()
{
	Info_ClearChoices(dia_xor_12205_terinaks_teach_ranged);
};

func void dia_xor_12205_terinaks_teach_ranged_1h_1()
{
	if(b_teachfighttalentpercenttarinaks(self,other,NPC_TALENT_CROSSBOW,1,100))
	{
		Info_ClearChoices(dia_xor_12205_terinaks_teach_ranged);
		Info_AddChoice(dia_xor_12205_terinaks_teach_ranged,Dialog_Back,dia_xor_12205_terinaks_teach_ranged_back);
		Info_AddChoice(dia_xor_12205_terinaks_teach_ranged,B_BuildLearnString(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),dia_xor_12205_terinaks_teach_ranged_2h_1);
		Info_AddChoice(dia_xor_12205_terinaks_teach_ranged,B_BuildLearnString(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),dia_xor_12205_terinaks_teach_ranged_2h_5);
		Info_AddChoice(dia_xor_12205_terinaks_teach_ranged,B_BuildLearnString(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),dia_xor_12205_terinaks_teach_ranged_1h_1);
		Info_AddChoice(dia_xor_12205_terinaks_teach_ranged,B_BuildLearnString(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),dia_xor_12205_terinaks_teach_ranged_1h_5);
	};
};

func void dia_xor_12205_terinaks_teach_ranged_1h_5()
{
	if(b_teachfighttalentpercenttarinaks(self,other,NPC_TALENT_CROSSBOW,5,100))
	{
		Info_ClearChoices(dia_xor_12205_terinaks_teach_ranged);
		Info_AddChoice(dia_xor_12205_terinaks_teach_ranged,Dialog_Back,dia_xor_12205_terinaks_teach_ranged_back);
		Info_AddChoice(dia_xor_12205_terinaks_teach_ranged,B_BuildLearnString(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),dia_xor_12205_terinaks_teach_ranged_2h_1);
		Info_AddChoice(dia_xor_12205_terinaks_teach_ranged,B_BuildLearnString(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),dia_xor_12205_terinaks_teach_ranged_2h_5);
		Info_AddChoice(dia_xor_12205_terinaks_teach_ranged,B_BuildLearnString(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),dia_xor_12205_terinaks_teach_ranged_1h_1);
		Info_AddChoice(dia_xor_12205_terinaks_teach_ranged,B_BuildLearnString(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),dia_xor_12205_terinaks_teach_ranged_1h_5);
	};
};

func void dia_xor_12205_terinaks_teach_ranged_2h_1()
{
	if(b_teachfighttalentpercenttarinaks(self,other,NPC_TALENT_BOW,1,100))
	{
		Info_ClearChoices(dia_xor_12205_terinaks_teach_ranged);
		Info_AddChoice(dia_xor_12205_terinaks_teach_ranged,Dialog_Back,dia_xor_12205_terinaks_teach_ranged_back);
		Info_AddChoice(dia_xor_12205_terinaks_teach_ranged,B_BuildLearnString(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),dia_xor_12205_terinaks_teach_ranged_2h_1);
		Info_AddChoice(dia_xor_12205_terinaks_teach_ranged,B_BuildLearnString(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),dia_xor_12205_terinaks_teach_ranged_2h_5);
		Info_AddChoice(dia_xor_12205_terinaks_teach_ranged,B_BuildLearnString(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),dia_xor_12205_terinaks_teach_ranged_1h_1);
		Info_AddChoice(dia_xor_12205_terinaks_teach_ranged,B_BuildLearnString(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),dia_xor_12205_terinaks_teach_ranged_1h_5);
	};
};

func void dia_xor_12205_terinaks_teach_ranged_2h_5()
{
	if(b_teachfighttalentpercenttarinaks(self,other,NPC_TALENT_BOW,5,100))
	{
		Info_ClearChoices(dia_xor_12205_terinaks_teach_ranged);
		Info_AddChoice(dia_xor_12205_terinaks_teach_ranged,Dialog_Back,dia_xor_12205_terinaks_teach_ranged_back);
		Info_AddChoice(dia_xor_12205_terinaks_teach_ranged,B_BuildLearnString(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),dia_xor_12205_terinaks_teach_ranged_2h_1);
		Info_AddChoice(dia_xor_12205_terinaks_teach_ranged,B_BuildLearnString(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),dia_xor_12205_terinaks_teach_ranged_2h_5);
		Info_AddChoice(dia_xor_12205_terinaks_teach_ranged,B_BuildLearnString(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),dia_xor_12205_terinaks_teach_ranged_1h_1);
		Info_AddChoice(dia_xor_12205_terinaks_teach_ranged,B_BuildLearnString(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),dia_xor_12205_terinaks_teach_ranged_1h_5);
	};
};

instance DIA_XOR_12205_TERINAKS_TEACH_SKILLS(C_Info)
{
	npc = xor_12205_terinaks;
	nr = 9;
	condition = dia_xor_12205_terinaks_teach_skills_condition;
	information = dia_xor_12205_terinaks_teach_skills_info;
	permanent = TRUE;
	description = "Я хочу увеличить свои навыки.";
};

func int dia_xor_12205_terinaks_teach_skills_condition()
{
	if(TARINAKSTEACHME == TRUE)
	{
		return TRUE;
	};
};

func void dia_xor_12205_terinaks_teach_skills_info()
{
	AI_Output(other,self,"DIA_XOR_12205_Terinaks_Teach_Skills_01_00");	//Я хочу увеличить свои навыки.
	AI_Output(self,other,"DIA_XOR_12205_Terinaks_Teach_Skills_01_01");	//Хорошо. Что ты хочешь узнать?
	Info_ClearChoices(dia_xor_12205_terinaks_teach_skills);
	Info_AddChoice(dia_xor_12205_terinaks_teach_skills,Dialog_Back,dia_xor_12205_terinaks_teach_skills_back);
	Info_AddChoice(dia_xor_12205_terinaks_teach_skills,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_xor_12205_terinaks_teach_skills_dex_1);
	Info_AddChoice(dia_xor_12205_terinaks_teach_skills,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_xor_12205_terinaks_teach_skills_dex_5);
	Info_AddChoice(dia_xor_12205_terinaks_teach_skills,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),dia_xor_12205_terinaks_teach_skills_str_1);
	Info_AddChoice(dia_xor_12205_terinaks_teach_skills,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),dia_xor_12205_terinaks_teach_skills_str_5);
};

func void dia_xor_12205_terinaks_teach_skills_back()
{
	Info_ClearChoices(dia_xor_12205_terinaks_teach_skills);
};

func void dia_xor_12205_terinaks_teach_skills_str_1()
{
	b_teachattributepointstarinaks(self,other,ATR_STRENGTH,1,T_MEGA);
	Info_ClearChoices(dia_xor_12205_terinaks_teach_skills);
	Info_AddChoice(dia_xor_12205_terinaks_teach_skills,Dialog_Back,dia_xor_12205_terinaks_teach_skills_back);
	Info_AddChoice(dia_xor_12205_terinaks_teach_skills,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_xor_12205_terinaks_teach_skills_dex_1);
	Info_AddChoice(dia_xor_12205_terinaks_teach_skills,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_xor_12205_terinaks_teach_skills_dex_5);
	Info_AddChoice(dia_xor_12205_terinaks_teach_skills,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),dia_xor_12205_terinaks_teach_skills_str_1);
	Info_AddChoice(dia_xor_12205_terinaks_teach_skills,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),dia_xor_12205_terinaks_teach_skills_str_5);
};

func void dia_xor_12205_terinaks_teach_skills_str_5()
{
	b_teachattributepointstarinaks(self,other,ATR_STRENGTH,5,T_MEGA);
	Info_ClearChoices(dia_xor_12205_terinaks_teach_skills);
	Info_AddChoice(dia_xor_12205_terinaks_teach_skills,Dialog_Back,dia_xor_12205_terinaks_teach_skills_back);
	Info_AddChoice(dia_xor_12205_terinaks_teach_skills,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_xor_12205_terinaks_teach_skills_dex_1);
	Info_AddChoice(dia_xor_12205_terinaks_teach_skills,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_xor_12205_terinaks_teach_skills_dex_5);
	Info_AddChoice(dia_xor_12205_terinaks_teach_skills,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),dia_xor_12205_terinaks_teach_skills_str_1);
	Info_AddChoice(dia_xor_12205_terinaks_teach_skills,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),dia_xor_12205_terinaks_teach_skills_str_5);
};

func void dia_xor_12205_terinaks_teach_skills_dex_1()
{
	b_teachattributepointstarinaks(self,other,ATR_DEXTERITY,1,T_MEGA);
	Info_ClearChoices(dia_xor_12205_terinaks_teach_skills);
	Info_AddChoice(dia_xor_12205_terinaks_teach_skills,Dialog_Back,dia_xor_12205_terinaks_teach_skills_back);
	Info_AddChoice(dia_xor_12205_terinaks_teach_skills,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_xor_12205_terinaks_teach_skills_dex_1);
	Info_AddChoice(dia_xor_12205_terinaks_teach_skills,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_xor_12205_terinaks_teach_skills_dex_5);
	Info_AddChoice(dia_xor_12205_terinaks_teach_skills,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),dia_xor_12205_terinaks_teach_skills_str_1);
	Info_AddChoice(dia_xor_12205_terinaks_teach_skills,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),dia_xor_12205_terinaks_teach_skills_str_5);
};

func void dia_xor_12205_terinaks_teach_skills_dex_5()
{
	b_teachattributepointstarinaks(self,other,ATR_DEXTERITY,5,T_MEGA);
	Info_ClearChoices(dia_xor_12205_terinaks_teach_skills);
	Info_AddChoice(dia_xor_12205_terinaks_teach_skills,Dialog_Back,dia_xor_12205_terinaks_teach_skills_back);
	Info_AddChoice(dia_xor_12205_terinaks_teach_skills,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_xor_12205_terinaks_teach_skills_dex_1);
	Info_AddChoice(dia_xor_12205_terinaks_teach_skills,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_xor_12205_terinaks_teach_skills_dex_5);
	Info_AddChoice(dia_xor_12205_terinaks_teach_skills,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),dia_xor_12205_terinaks_teach_skills_str_1);
	Info_AddChoice(dia_xor_12205_terinaks_teach_skills,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),dia_xor_12205_terinaks_teach_skills_str_5);
};

