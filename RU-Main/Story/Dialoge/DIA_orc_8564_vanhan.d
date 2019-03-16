
instance DIA_ORC_8564_VANHAN_EXIT(C_Info)
{
	npc = orc_8564_vanhan;
	condition = dia_orc_8564_vanhan_exit_condition;
	information = dia_orc_8564_vanhan_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};


func int dia_orc_8564_vanhan_exit_condition()
{
	return TRUE;
};

func void dia_orc_8564_vanhan_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ORC_8564_VANHAN_HELLO(C_Info)
{
	npc = orc_8564_vanhan;
	nr = 1;
	condition = dia_orc_8564_vanhan_hello_condition;
	information = dia_orc_8564_vanhan_hello_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_orc_8564_vanhan_hello_condition()
{
	if((FIRSTVANHAN == FALSE) && (BLKDRAGNISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_orc_8564_vanhan_hello_info()
{
	var C_Item heroweapon;
	AI_Output(self,other,"DIA_Orc_8564_VanHan_Hello_01_01");	//УЧА-ЧА... ФАТГАР!
	AI_Output(self,other,"DIA_Orc_8564_VanHan_Hello_01_02");	//НОР ХАТАГ БАР КЕР ДАРАН!
	AI_Output(other,self,"DIA_Orc_8564_VanHan_Hello_01_03");	//Не понимаю... Что ты говоришь?
	AI_Output(self,other,"DIA_Orc_8564_VanHan_Hello_01_04");	//БЭР ТОГАН УРХАН БОГОТ! Зачем смертный тревожить Ур-Хан, зачем приходить сюда?
	AI_Output(other,self,"DIA_Orc_8564_VanHan_Hello_01_05");	//(себе под нос) Так значит, Эмнол был прав - они действительно все призраки!
	AI_Output(other,self,"DIA_Orc_8564_VanHan_Hello_01_06");	//Я пришел поговорить с орками - у меня есть вопросы.
	AI_Output(self,other,"DIA_Orc_8564_VanHan_Hello_01_07");	//НОКАН БАДАР! Почему человек решил что орки станут слушать человек?
	if(Npc_HasItems(hero,itmw_2h_orcprestige) >= 1)
	{
		heroweapon = Npc_GetEquippedMeleeWeapon(hero);
		if(Hlp_IsItem(heroweapon,itmw_2h_orcprestige) == TRUE)
		{
			AI_Output(other,self,"DIA_Orc_8564_VanHan_Hello_01_08");	//Вот почему.
			AI_ReadyMeleeWeapon(other);
			AI_Output(self,other,"DIA_Orc_8564_VanHan_Hello_01_09");	//Ммм...(удивленно) Ур-Хан помнить, что это такое. Видеть человек носить Улу-Мулу. Быть великий воин, полагать.
			AI_Output(self,other,"DIA_Orc_8564_VanHan_Hello_01_10");	//Откуда смертный знать про Улу-Мулу? Откуда человек знать, что не умирать, если прийти сюда?
			AI_Output(other,self,"DIA_Orc_8564_VanHan_Hello_01_11");	//Один орк сделал его для меня и рассказал, что означает этот талисман.
			AI_Output(other,self,"DIA_Orc_8564_VanHan_Hello_01_12");	//Так что тебе не отвертеться, орк!
			AI_RemoveWeapon(other);
		}
		else
		{
			AI_Output(other,self,"DIA_Orc_8564_VanHan_Hello_01_51");	//Раз ты заговорил со мной - значит и выслушаешь меня!
			AI_Output(self,other,"DIA_Orc_8564_VanHan_Hello_01_52");	//КВАГАД ДЖАБАР! Ну хорошо, человек. Говори, что хотеть сказать.
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Orc_8564_VanHan_Hello_01_53");	//Раз ты заговорил со мной - значит и выслушаешь меня!
		AI_Output(self,other,"DIA_Orc_8564_VanHan_Hello_01_54");	//КВАГАД ДЖАБАР! Ну хорошо, человек. Говори, что хотеть сказать.
	};
	AI_Output(other,self,"DIA_Orc_8564_VanHan_Hello_01_12A");	//Значит, тебя зовут Ур-Хан. А кем ты был?
	AI_Output(self,other,"DIA_Orc_8564_VanHan_Hello_01_13");	//Быть когда-то великий сын духа много зим назад. Люди звать шаман...
	AI_Output(other,self,"DIA_Orc_8564_VanHan_Hello_01_14");	//А почему сейчас вы все стали призраками?
	AI_Output(self,other,"DIA_Orc_8564_VanHan_Hello_01_15");	//Злой демон убивать всех, проклинать всех... забирать дух.
	AI_Output(other,self,"DIA_Orc_8564_VanHan_Hello_01_16");	//Ты имеешь в виду душу?
	AI_Output(self,other,"DIA_Orc_8564_VanHan_Hello_01_17");	//Ур-Хан полагать, что так.
	AI_Output(other,self,"DIA_Orc_8564_VanHan_Hello_01_18");	//А что это был за демон такой?
	AI_Output(self,other,"DIA_Orc_8564_VanHan_Hello_01_19");	//КРАКТАР ТЕКАН...
	AI_Output(other,self,"DIA_Orc_8564_VanHan_Hello_01_20");	//И что это значит?
	AI_Output(self,other,"DIA_Orc_8564_VanHan_Hello_01_21");	//Люди говорить - Великая Тень, быть тот кто проклинать всех...
	AI_Output(other,self,"DIA_Orc_8564_VanHan_Hello_01_22");	//Великая Тень?! Я уже слышал об этом...
	AI_Output(other,self,"DIA_Orc_8564_VanHan_Hello_01_23");	//А это создание случайно не смахивало на такого большого черного дракона, которого звали Азгалор?
	AI_Output(self,other,"DIA_Orc_8564_VanHan_Hello_01_24");	//КРОТ БУТУР ОРФАГ! Ур-Хан полагать, что так... КРАКТАР ТЕКАН АЗГАЛОР!
	AI_Output(other,self,"DIA_Orc_8564_VanHan_Hello_01_25");	//Теперь все стало ясно. Но как Азгалор попал в этот мир?
	AI_Output(self,other,"DIA_Orc_8564_VanHan_Hello_01_26");	//Ур-Хан и братья звать демон. Думать, демон помогать братьям - делать их сильными.
	AI_Output(other,self,"DIA_Orc_8564_VanHan_Hello_01_27");	//Как предсказуемы орки! Видимо, история со Спящим вас так ничему и не научила!
	AI_Output(self,other,"DIA_Orc_8564_VanHan_Hello_01_28");	//Кто быть Спящий?!
	AI_Output(other,self,"DIA_Orc_8564_VanHan_Hello_01_29");	//По-орочьему - КРУШАК! Он что-то вроде вашего Азгалора... тоже злой демон.
	AI_Output(self,other,"DIA_Orc_8564_VanHan_Hello_01_30");	//Ур-Хан не знать КРУШАК... Но думать - плохой демон, если убивать братьев.
	AI_Output(other,self,"DIA_Orc_8564_VanHan_Hello_01_31");	//Скажи, а каким образом вам удалось призвать Азгалора в долину?
	AI_Output(self,other,"DIA_Orc_8564_VanHan_Hello_01_32");	//Братья искать древний артефакт, зваться ДАХ БАР ФАТГАР... Находить и заклинать демон прийти.
	AI_Output(other,self,"DIA_Orc_8564_VanHan_Hello_01_33");	//ДАХ БАР ФАТГАР - это, видимо, Око Гнева...
	AI_Output(self,other,"DIA_Orc_8564_VanHan_Hello_01_34");	//Полагать, что так звать люди... Ур-Хан видеть, что человек много знать. Ур-Хан удивляться этому!
	AI_Output(other,self,"DIA_Orc_8564_VanHan_Hello_01_35");	//Ничего удивительного - я слышал об одной легенде, где как раз говорилось и о Великой Тени, и об Оке Гнева, и о том, к чему все это может привести...
	AI_Output(other,self,"DIA_Orc_8564_VanHan_Hello_01_37");	//Ладно, скажи, а где теперь этот Азгалор? Где мне его найти?
	AI_Output(self,other,"DIA_Orc_8564_VanHan_Hello_01_38");	//Ур-Хан не знать. Демон давно не быть здесь. Не быть с тех пор, как проклинать...
	AI_Output(self,other,"DIA_Orc_8564_VanHan_Hello_01_39");	//А зачем человек искать злой демон?
	AI_Output(other,self,"DIA_Orc_8564_VanHan_Hello_01_40");	//Я хочу избавить этот мир от этого чудовища раз и навсегда.
	AI_Output(self,other,"DIA_Orc_8564_VanHan_Hello_01_41");	//Человек хочет убить демон?! ХРОТОК ДЖАБАР!
	AI_Output(self,other,"DIA_Orc_8564_VanHan_Hello_01_42");	//Человек думать, он великий воин. Но человек умирать, если сделать это. Демон очень сильный, больше, чем человек думать.
	AI_Output(other,self,"DIA_Orc_8564_VanHan_Hello_01_43");	//Ну, это мы еще посмотрим! Так ты знаешь, как мне найти Азгалора?
	AI_Output(self,other,"DIA_Orc_8564_VanHan_Hello_01_44");	//Ур-Хан не знать это...
	AI_Output(self,other,"DIA_Orc_8564_VanHan_Hello_01_45");	//Но думать, если человек заклинать демон как братья - демон вновь прийти сюда.
	AI_Output(other,self,"DIA_Orc_8564_VanHan_Hello_01_46");	//Тогда мне нужно это Око Гнева... А где мне его искать?
	AI_Output(self,other,"DIA_Orc_8564_VanHan_Hello_01_47");	//Братья отдавать ДАХ БАР ФАТГАР демон, когда тот прийти...
	AI_Output(self,other,"DIA_Orc_8564_VanHan_Hello_01_48");	//Ур-Хан не знать, где искать ДАХ БАР ФАТГАР. Человек искать сам...
	AI_Output(other,self,"DIA_Orc_8564_VanHan_Hello_01_49");	//Да, как всегда, все приходится делать самому...(иронично)
	FIRSTVANHAN = TRUE;
	B_LogEntry(TOPIC_URNAZULRAGE,"Мне удалось поговорить с одним орком-призраком, Ур-Ханом. Теперь вся картина ясна. По его словам, орки отыскали в долине древний артефакт - Око Гнева, о котором Эльваис упоминал в легенде. С помощью этого артефакта орки и призвали в долину Великую Тень - Азгалора. А после этого, действия в долине развивались уже по известному мне сценарию.");
	B_LogEntry(TOPIC_URNAZULRAGE,"Также по словам Ур-Хана, Азгалор не появлялся в долине уже много веков, и единственный способ для меня призвать его обратно - это найти то самое Око Гнева и исполнить с помощью него некий ритуал заклинания. Тогда, возможно, Азголор вновь явится на зов артефакта, и я смогу его тут прикончить. Все просто...");
	B_LogEntry(TOPIC_URNAZULRAGE,"Ур-Хан не знает, где сейчас находится этот артефакт. Придется искать его самому.");
	self.name[0] = "Ур-Хан, шаман-призрак";
	AI_StopProcessInfos(self);
};


instance DIA_ORC_8564_VANHAN_TALISMAN(C_Info)
{
	npc = orc_8564_vanhan;
	nr = 1;
	condition = dia_orc_8564_vanhan_talisman_condition;
	information = dia_orc_8564_vanhan_talisman_info;
	important = FALSE;
	permanent = TRUE;
	description = "Я нашел твой талисман.";
};


func int dia_orc_8564_vanhan_talisman_condition()
{
	if((FIRSTVANHAN == TRUE) && (BLKDRAGNISDEAD == FALSE) && (Npc_HasItems(other,itmi_orcamulet_vanhan) >= 1))
	{
		return TRUE;
	};
};

func void dia_orc_8564_vanhan_talisman_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self,"DIA_Orc_8564_VanHan_Talisman_01_01");	//Я нашел твой талисман.
	AI_Output(self,other,"DIA_Orc_8564_VanHan_Talisman_01_02");	//(удивленно) КАВАРОК МАТАР НЕМРОК...
	AI_Output(self,other,"DIA_Orc_8564_VanHan_Talisman_01_03");	//Где человек отыскать его?
	AI_Output(other,self,"DIA_Orc_8564_VanHan_Talisman_01_04");	//В подземном храме, что к востоку отсюда. А как он вообще оказался там?
	AI_Output(self,other,"DIA_Orc_8564_VanHan_Talisman_01_05");	//Ур-Хан не знать. Он терять его, когда сражаться с мертвыми очень давно.
	AI_Output(self,other,"DIA_Orc_8564_VanHan_Talisman_01_06");	//Ур-Хан сильно расстраиваться тогда - талисман быть подарок одного великого шамана...
	AI_Output(self,other,"DIA_Orc_8564_VanHan_Talisman_01_07");	//Но теперь человек вернуть его Ур-Хану и он радоваться снова...
	B_GiveInvItems(other,self,itmi_orcamulet_vanhan,1);
	AI_Output(self,other,"DIA_Orc_8564_VanHan_Talisman_01_09");	//Шаман говорить человек спасибо.
	AI_Output(self,other,"DIA_Orc_8564_VanHan_Talisman_01_10");	//Хотеть благодарить человек - хотеть давать ему что-то вместо талисмана...
	AI_Output(self,other,"DIA_Orc_8564_VanHan_Talisman_01_11");	//Ур-Хан знать, что давать... Давать ключ от сундук в чуме Ур-Хана. Человек открывать его и брать все себе.
	AI_Output(other,self,"DIA_Orc_8564_VanHan_Talisman_01_12");	//А где твой чум?
	AI_Output(self,other,"DIA_Orc_8564_VanHan_Talisman_01_13");	//Внизу, идти дальше искать лагерь братьев. Там искать сундук.
	AI_Output(other,self,"DIA_Orc_8564_VanHan_Talisman_01_14");	//А что в сундуке?
	AI_Output(self,other,"DIA_Orc_8564_VanHan_Talisman_01_15");	//Ур-Хан не помнить. Быть очень давно, когда класть туда.
	AI_Output(other,self,"DIA_Orc_8564_VanHan_Talisman_01_16");	//Понятно.
	B_GiveInvItems(self,other,itke_orcshaman_shv,1);
};


instance DIA_ORC_8564_VANHAN_PRISONSOUL(C_Info)
{
	npc = orc_8564_vanhan;
	nr = 1;
	condition = dia_orc_8564_vanhan_prisonsoul_condition;
	information = dia_orc_8564_vanhan_prisonsoul_info;
	important = FALSE;
	permanent = TRUE;
	description = "Я нашел этот странный камень.";
};


func int dia_orc_8564_vanhan_prisonsoul_condition()
{
	if((FIRSTVANHAN == TRUE) && (BLKDRAGNISDEAD == FALSE) && (Npc_HasItems(other,itmi_prisonsoul) >= 1) && (FINDPRISONSOUL == FALSE))
	{
		return TRUE;
	};
};

func void dia_orc_8564_vanhan_prisonsoul_info()
{
	AI_Output(other,self,"DIA_Orc_8564_VanHan_PrisonSoul_01_01");	//В подземном храме я нашел этот странный камень.
	AI_Output(self,other,"DIA_Orc_8564_VanHan_PrisonSoul_01_02");	//Давать смотреть камень Ур-Хану. Ур-Хан говорить.
	B_GiveInvItems(other,self,itmi_prisonsoul,1);
	AI_Output(self,other,"DIA_Orc_8564_VanHan_PrisonSoul_01_03");	//Ммм... Ур-Хан смотреть и видеть, что это ДАХ ФАТГАР!
	AI_Output(other,self,"DIA_Orc_8564_VanHan_PrisonSoul_01_04");	//Что это такое, ДАХ ФАТГАР?
	AI_Output(self,other,"DIA_Orc_8564_VanHan_PrisonSoul_01_05");	//Человек найти ДАХ ФАТГАР - Око Гнева, но он не иметь силу магия.
	AI_Output(other,self,"DIA_Orc_8564_VanHan_PrisonSoul_01_06");	//И что это значит?
	AI_Output(self,other,"DIA_Orc_8564_VanHan_PrisonSoul_01_07");	//Человек должен вернуть камень магию, тогда он стать ДАХ БАР ФАТГАР. Можно будет заклинать демон.
	if(READ_AZGOLOR == FALSE)
	{
		AI_Output(other,self,"DIA_Orc_8564_VanHan_PrisonSoul_01_08");	//А как мне вернуть ему прежнюю силу?
		AI_Output(self,other,"DIA_Orc_8564_VanHan_PrisonSoul_01_09");	//Ур-Хан не знать это.
		B_LogEntry(TOPIC_URNAZULRAGE,"Я показал Ур-Хану найденный мной в храме странного вида камень. Орк сказал, что я нашел тот самый древний артефакт - Око Гнева. Но камень утратил свою магическую силу. А как ее вернуть артефакту, он не знает.");
	}
	else
	{
		B_GivePlayerXP(100);
		AI_Output(other,self,"DIA_Orc_8564_VanHan_PrisonSoul_01_10");	//Я, кажется, знаю, как это сделать. В храме я нашел одну старую книгу, в которой как раз говорится об этом.
		AI_Output(other,self,"DIA_Orc_8564_VanHan_PrisonSoul_01_11");	//Посмотрим, что из этого получится...
		B_LogEntry(TOPIC_URNAZULRAGE,"Я показал Ур-Хану найденный мной в храме странного вида камень. Орк сказал, что я нашел это самое Око Гнева. Теперь мне осталось только вернуть ему его магическую силу, как это описывается в найденной мною книге демонов.");
	};
	B_GiveInvItems(self,other,itmi_prisonsoul,1);
	FINDPRISONSOUL = TRUE;
};


instance DIA_ORC_8564_VANHAN_AZGALORBOOK(C_Info)
{
	npc = orc_8564_vanhan;
	nr = 1;
	condition = dia_orc_8564_vanhan_azgalorbook_condition;
	information = dia_orc_8564_vanhan_azgalorbook_info;
	important = FALSE;
	permanent = TRUE;
	description = "Ты можешь прочитать эту книгу?";
};


func int dia_orc_8564_vanhan_azgalorbook_condition()
{
	if((FIRSTVANHAN == TRUE) && (BLKDRAGNISDEAD == FALSE) && (Npc_HasItems(other,itwr_azgolor) >= 1) && (FINDAZGALORBOOK == FALSE) && (READ_AZGOLOR == FALSE))
	{
		return TRUE;
	};
};

func void dia_orc_8564_vanhan_azgalorbook_info()
{
	var int ingcount;
	ingcount = 0;
	AI_Output(other,self,"DIA_Orc_8564_VanHan_AzgalorBook_01_01");	//Ты можешь прочитать эту книгу?
	AI_Output(self,other,"DIA_Orc_8564_VanHan_AzgalorBook_01_02");	//Человек дать книгу Ур-Хану...
	B_GiveInvItems(other,self,itwr_azgolor,1);
	AI_Output(self,other,"DIA_Orc_8564_VanHan_AzgalorBook_01_03");	//...(смотрит книгу)
	AI_Output(self,other,"DIA_Orc_8564_VanHan_AzgalorBook_01_04");	//Очень древний язык - язык демон... Ур-Хан знать этот язык, заклинать им КРАКТАР ТЕКАН.
	AI_Output(other,self,"DIA_Orc_8564_VanHan_AzgalorBook_01_05");	//О чем в ней говориться?
	AI_Output(self,other,"DIA_Orc_8564_VanHan_AzgalorBook_01_06");	//...(смотрит книгу)
	AI_Output(self,other,"DIA_Orc_8564_VanHan_AzgalorBook_01_07");	//Здесь сказать, зачем быть нужен ДАХ БАР ФАТГАР и как вернуть его магия.
	AI_Output(self,other,"DIA_Orc_8564_VanHan_AzgalorBook_01_09");	//Человек ждать еще... Ур-Хан смотреть.
	AI_Output(self,other,"DIA_Orc_8564_VanHan_AzgalorBook_01_10");	//...(смотрит книгу)
	AI_Output(self,other,"DIA_Orc_8564_VanHan_AzgalorBook_01_11");	//Чтобы вернуть магия, человек должен иметь БЛАДАР, ХОРКАН и СОЛФАГ.
	AI_Output(other,self,"DIA_Orc_8564_VanHan_AzgalorBook_01_12");	//Ты все время говоришь на непонятном мне языке. Что такое БЛАДАР?
	AI_Output(self,other,"DIA_Orc_8564_VanHan_AzgalorBook_01_13");	//Быть кровь брата - кровь орка.
	if(Npc_HasItems(other,itmi_orcblood) >= 1)
	{
		ingcount = ingcount + 1;
	};
	AI_Output(other,self,"DIA_Orc_8564_VanHan_AzgalorBook_01_14");	//А ХОРКАН?
	AI_Output(self,other,"DIA_Orc_8564_VanHan_AzgalorBook_01_15");	//Быть кровь демон огня.
	if(Npc_HasItems(other,itmi_barlokheart) >= 1)
	{
		ingcount = ingcount + 1;
	};
	AI_Output(other,self,"DIA_Orc_8564_VanHan_AzgalorBook_01_16");	//Ну, а что такое СОЛФАГ?
	AI_Output(self,other,"DIA_Orc_8564_VanHan_AzgalorBook_01_17");	//Быть желтый камень огня. Если поджигать - то он гореть.
	if(Npc_HasItems(other,ItMi_Sulfur) >= 1)
	{
		ingcount = ingcount + 1;
	};
	AI_Output(other,self,"DIA_Orc_8564_VanHan_AzgalorBook_01_18");	//Да, неплохой набор. И что надо со всем этим делать?
	AI_Output(self,other,"DIA_Orc_8564_VanHan_AzgalorBook_01_19");	//Нужно колдовать, нужно заклинать все вместе с ДАХ БАР ФАТГАР, чтобы оно просыпаться и наполняться магия.
	AI_Output(other,self,"DIA_Orc_8564_VanHan_AzgalorBook_01_19A");	//То есть наполнившись магической энергией, Око Гнева пробудится!
	if(ingcount == 0)
	{
		AI_Output(other,self,"DIA_Orc_8564_VanHan_AzgalorBook_01_20");	//Интересно. А ты случаем не знаешь, где я могу найти все эти вещи?
		AI_Output(self,other,"DIA_Orc_8564_VanHan_AzgalorBook_01_21");	//...
		AI_Output(other,self,"DIA_Orc_8564_VanHan_AzgalorBook_01_22");	//Ясно, не знаешь.
		B_LogEntry(TOPIC_URNAZULRAGE,"Я принес Ур-Хану книгу, что нашел в храме. Как оказалась, книга написана на древнем языке демонов. Из нее я узнал, как мне вернуть магическую силу Оку Гнева. Для этого нужно три ингредиента - кровь орка, кровь демона и непонятная субстанция желтого цвета. Ур-Хан не смог мне объяснить, что это такое. Теперь необходимо найти все эти вещи и попытаться с их помощью вернуть силу артефакту.");
	}
	else if(ingcount == 3)
	{
		B_GivePlayerXP(300);
		AI_Output(other,self,"DIA_Orc_8564_VanHan_AzgalorBook_01_23");	//Интересно. Похоже все, что ты перечислил, у меня уже есть.
		AI_Output(other,self,"DIA_Orc_8564_VanHan_AzgalorBook_01_24");	//Остается теперь только подумать, каким образом вернуть магию Ока с помощью этих предметов.
		B_LogEntry(TOPIC_URNAZULRAGE,"Я принес Ур-Хану книгу, что нашел в храме. Как оказалась, книга написана на древнем языке демонов. Из нее я узнал, как мне вернуть магическую силу Оку Гнева. Для этого нужно три ингредиента - кровь орка, кровь демона и непонятная субстанция желтого цвета. Ур-Хан не смог мне объяснить, что это такое, но я подозреваю, что это сера. Теперь необходимо найти все эти вещи и попытаться с их помощью вернуть силу артефакту.");
	}
	else
	{
		AI_Output(other,self,"DIA_Orc_8564_VanHan_AzgalorBook_01_25");	//Интересно. Часть необходимых для этого предметов у меня уже есть...
		AI_Output(other,self,"DIA_Orc_8564_VanHan_AzgalorBook_01_26");	//Осталось только найти остальные и подумать, каким образом с их помощью можно вернуть магию Ока.
		B_LogEntry(TOPIC_URNAZULRAGE,"Я принес Ур-Хану книгу, что нашел в храме. Как оказалась, книга написана на древнем языке демонов. Из нее я узнал, как мне вернуть магическую силу Оку Гнева. Для этого нужно три ингредиента - кровь орка, кровь демона и непонятная субстанция желтого цвета. Ур-Хан не смог мне объяснить, что это такое. Теперь необходимо найти все эти вещи и попытаться с их помощью вернуть силу артефакту.");
	};
	AI_Output(other,self,"DIA_Orc_8564_VanHan_AzgalorBook_01_27");	//А что-нибудь еще в этой книге написано?
	AI_Output(self,other,"DIA_Orc_8564_VanHan_AzgalorBook_01_28");	//Да... Для того, чтобы заклинать демон, человек должен еще знать Слова Силы.
	AI_Output(other,self,"DIA_Orc_8564_VanHan_AzgalorBook_01_29");	//Что это еще за слова такие?
	AI_Output(self,other,"DIA_Orc_8564_VanHan_AzgalorBook_01_30");	//Слова, которые заставлять прийти демон.
	if(KNOWS_AZGOGLOR_SUMMON == TRUE)
	{
		AI_Output(other,self,"DIA_Orc_8564_VanHan_AzgalorBook_01_31");	//Мне кажется, я знаю о чем ты говоришь. 		
		AI_Output(other,self,"DIA_Orc_8564_VanHan_AzgalorBook_01_32");	//В одной старой книге, что обнаружил в заброшенном склепе, упоминалось про какой-то странный ритуал, который должен сопровождаться некими заклинаниями.
		AI_Output(other,self,"DIA_Orc_8564_VanHan_AzgalorBook_01_33");	//Думаю, что это как раз и есть нужные слова...
		B_LogEntry(TOPIC_URNAZULRAGE,"Также Ур-Хан сказал, что для того, чтобы призвать Азгалора, мне нужно знать некоторого рода заклинание - или, как написано в книге, Слова Силы. Помнится, в заброшенном склепе я прочитал одну из книжек, где упоминалось подобное выражение...");
	}
	else
	{
		AI_Output(other,self,"DIA_Orc_8564_VanHan_AzgalorBook_01_34");	//В книге больше ничего нет, что может мне помочь?
		B_LogEntry(TOPIC_URNAZULRAGE,"Также Ур-Хан сказал, что для того, чтобы призвать Азгалора, мне нужно знать некоторого рода заклинание - или, как написано в книге, Слова Силы...");
	};
	AI_Output(other,self,"DIA_Orc_8564_VanHan_AzgalorBook_01_34");	//Больше в книге ничего, что может мне помочь нет?
	AI_Output(self,other,"DIA_Orc_8564_VanHan_AzgalorBook_01_35");	//Ур-Хан думать это все.
	AI_Output(self,other,"DIA_Orc_8564_VanHan_AzgalorBook_01_37");	//Удачный дорога, человек.
	B_GiveInvItems(self,other,itwr_azgolor,1);
	READ_AZGOLOR = TRUE;
	FINDAZGALORBOOK = TRUE;
};

