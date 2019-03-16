
instance DIA_BAGRUS_EXIT(C_Info)
{
	npc = vlk_6002_bagrus;
	nr = 999;
	condition = dia_bagrus_exit_condition;
	information = dia_bagrus_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_bagrus_exit_condition()
{
	return TRUE;
};

func void dia_bagrus_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BAGRUS_HELLO(C_Info)
{
	npc = vlk_6002_bagrus;
	nr = 1;
	condition = dia_bagrus_hello_condition;
	information = dia_bagrus_hello_info;
	permanent = TRUE;
	important = FALSE;
	description = "Эй, как дела?";
};


func int dia_bagrus_hello_condition()
{
	if(MEETBAGRUS == FALSE)
	{
		return TRUE;
	};
};

func void dia_bagrus_hello_info()
{
	AI_Output(other,self,"DIA_Bagrus_Hello_01_01");	//Эй, как дела?
	AI_Output(self,other,"DIA_Bagrus_Hello_01_02");	//Пока все нормально. А ты, видимо, тот самый парень, о ком говорит весь лагерь.
	AI_Output(self,other,"DIA_Bagrus_Hello_01_03");	//Слышал, ты ищещь здесь какого-то дракона.
	AI_Output(other,self,"DIA_Bagrus_Hello_01_04");	//Да, черного дракона по имени Азгалор. Знаешь о нем что-нибудь?
	AI_Output(self,other,"DIA_Bagrus_Hello_01_05");	//Нет, абсолютно ничего. Если бы тут водились драконы, я бы и сам с удовольствием поохотился на одного из них.
	AI_Output(self,other,"DIA_Bagrus_Hello_01_06");	//Но тут отродясь кроме огненных ящериц ничего не водилось.
	AI_Output(other,self,"DIA_Bagrus_Hello_01_07");	//Мне пора идти.
	MEETBAGRUS = TRUE;
};


instance DIA_BAGRUS_HELLO_TEACH(C_Info)
{
	npc = vlk_6002_bagrus;
	nr = 1;
	condition = dia_bagrus_hello_teach_condition;
	information = dia_bagrus_hello_teach_info;
	permanent = TRUE;
	important = FALSE;
	description = "Я слышал, ты лучший охотник в лагере.";
};


func int dia_bagrus_hello_teach_condition()
{
	if((MEETBAGRUS == TRUE) && (BARGUSTEACHER == TRUE) && (BARGUSREADYTEACH == FALSE))
	{
		return TRUE;
	};
};

func void dia_bagrus_hello_teach_info()
{
	AI_Output(other,self,"DIA_Bagrus_Hello_Teach_01_01");	//Я слышал, ты лучший охотник в лагере.
	AI_Output(self,other,"DIA_Bagrus_Hello_Teach_01_02");	//Не хочу хвастаться, но я действительно кое-что понимаю в охоте.
	AI_Output(other,self,"DIA_Bagrus_Hello_Teach_01_03");	//А разделывать туши убитых животных ты умеешь?
	AI_Output(self,other,"DIA_Bagrus_Hello_Teach_01_04");	//Ха, так это и есть самое главное в этом деле. Завалить зверя много ума не надо.
	AI_Output(self,other,"DIA_Bagrus_Hello_Teach_01_05");	//Но если ты не знаешь, что делать дальше - считай, все твои усилия были напрасны.
	AI_Output(other,self,"DIA_Bagrus_Hello_Teach_01_06");	//А меня научишь?
	AI_Output(self,other,"DIA_Bagrus_Hello_Teach_01_08");	//Конечно, я могу показать тебе, как снимать различные охотничьи трофеи с тела убитого зверя.
	AI_Output(self,other,"DIA_Bagrus_Hello_Teach_01_10");	//Скажи, когда будешь готов.
	BARGUSREADYTEACH = TRUE;
};


instance DIA_BAGRUS_TEACHHUNTING(C_Info)
{
	npc = vlk_6002_bagrus;
	nr = 1;
	condition = dia_bagrus_teachhunting_condition;
	information = dia_bagrus_teachhunting_info;
	permanent = TRUE;
	description = "Научи меня разделывать туши.";
};


func int dia_bagrus_teachhunting_condition()
{
	if((MEETBAGRUS == TRUE) && (BARGUSREADYTEACH == TRUE))
	{
		return TRUE;
	};
};

func void dia_bagrus_teachhunting_info()
{
	AI_Output(other,self,"DIA_Bagrus_TeachHunting_01_01");	//Научи меня разделывать туши.
	if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Heart] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FireTongue] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ShadowHorn] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonScale] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] == FALSE))
	{
		AI_Output(self,other,"DIA_Bagrus_TeachHunting_01_02");	//Что точно ты хочешь знать?
		Info_AddChoice(dia_bagrus_teachhunting,Dialog_Back,dia_bagrus_teachhunting_back);
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
		{
			Info_AddChoice(dia_bagrus_teachhunting,b_buildlearnstringforsmithhunt("Сдирать шкуру",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Fur)),dia_bagrus_teachhunting_fur);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE)
		{
			Info_AddChoice(dia_bagrus_teachhunting,b_buildlearnstringforsmithhunt("Вырывать клыки",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Teeth)),dia_bagrus_teachhunting_teeth);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE)
		{
			Info_AddChoice(dia_bagrus_teachhunting,b_buildlearnstringforsmithhunt("Ломать когти",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Claws)),dia_bagrus_teachhunting_claws);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Heart] == FALSE)
		{
			Info_AddChoice(dia_bagrus_teachhunting,b_buildlearnstringforsmithhunt("Вырезать сердце",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Heart)),dia_bagrus_teachhunting_heart);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FireTongue] == FALSE)
		{
			Info_AddChoice(dia_bagrus_teachhunting,b_buildlearnstringforsmithhunt("Вырезать огненный язык",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_FireTongue)),dia_bagrus_teachhunting_firetongue);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn] == FALSE)
		{
			Info_AddChoice(dia_bagrus_teachhunting,b_buildlearnstringforsmithhunt("Отламывать рог драконьего снеппера",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DrgSnapperHorn)),dia_bagrus_teachhunting_drgsnapperhorn);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ShadowHorn] == FALSE)
		{
			Info_AddChoice(dia_bagrus_teachhunting,b_buildlearnstringforsmithhunt("Отламывать рог мракориса",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_ShadowHorn)),dia_bagrus_teachhunting_shadowhorn);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonScale] == FALSE)
		{
			Info_AddChoice(dia_bagrus_teachhunting,b_buildlearnstringforsmithhunt("Снять чешую дракона",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DragonScale)),dia_bagrus_teachhunting_dragonscale);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] == FALSE)
		{
			Info_AddChoice(dia_bagrus_teachhunting,b_buildlearnstringforsmithhunt("Слить кровь дракона",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DragonBlood)),dia_bagrus_teachhunting_dragonblood);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Bagrus_TeachHunting_01_03");	//Ты уже знаешь все то, чему я мог тебя научить.
	};
};

func void dia_bagrus_teachhunting_back()
{
	Info_ClearChoices(dia_bagrus_teachhunting);
};

func void dia_bagrus_teachhunting_fur()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Fur))
	{
		AI_Output(self,other,"DIA_Bagrus_TeachHunting_Fur_01_00");	//Проделываешь в шкуре зверя разрез, через который сможешь снять мех. Делать это нужно спереди назад, не наоборот.
	};
	Info_ClearChoices(dia_bagrus_teachhunting);
};

func void dia_bagrus_teachhunting_teeth()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Teeth))
	{
		AI_Output(self,other,"DIA_Bagrus_TeachHunting_Teeth_01_00");	//Когда удаляешь зубы, нужно действовать так, что чтобы не сломать челюсть.
	};
	Info_ClearChoices(dia_bagrus_teachhunting);
};

func void dia_bagrus_teachhunting_claws()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Claws))
	{
		AI_Output(self,other,"DIA_Bagrus_TeachHunting_Claws_01_00");	//Когти можно удалять по-разному. У одних зверей просто сильным ударом, у других достаточно обрезать их ножом.
	};
	Info_ClearChoices(dia_bagrus_teachhunting);
};

func void dia_bagrus_teachhunting_heart()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Heart))
	{
		AI_Output(self,other,"DIA_Bagrus_TeachHunting_Heart_01_00");	//Вырезать сердце зверя нужно умелым ударом в грудь. Но часто это стоит того, особенно с определенными зверьми или магическими существами.
	};
	Info_ClearChoices(dia_bagrus_teachhunting);
};

func void dia_bagrus_teachhunting_firetongue()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_FireTongue))
	{
		AI_Output(self,other,"DIA_Bagrus_TeachHunting_FireTongue_01_00");	//Язык огненного ящера нужно вырезать одним точным движением ножа, удерживая его при этом другой рукой.
	};
	Info_ClearChoices(dia_bagrus_teachhunting);
};

func void dia_bagrus_teachhunting_drgsnapperhorn()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_DrgSnapperHorn))
	{
		AI_Output(self,other,"DIA_Bagrus_TeachHunting_DrgSnapperHorn_01_00");	//Лучше всего отделять рог драконьего снеппера от черепа при помощи толстого ножа.
	};
	Info_ClearChoices(dia_bagrus_teachhunting);
};

func void dia_bagrus_teachhunting_shadowhorn()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_ShadowHorn))
	{
		AI_Output(self,other,"DIA_Bagrus_TeachHunting_ShadowHorn_01_00");	//Чтобы заполучить рог, ты изо всех сил упираешься в череп и давишь на рог - тогда он отломается.
	};
	Info_ClearChoices(dia_bagrus_teachhunting);
};

func void dia_bagrus_teachhunting_dragonscale()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_DragonScale))
	{
		AI_Output(self,other,"DIA_Bagrus_TeachHunting_DragonScale_01_00");	//Чешую дракона очень сложно оторвать. Но когда ты уже думаешь, что у тебя ничего не получится, раз - и она все же отделяется.
	};
	Info_ClearChoices(dia_bagrus_teachhunting);
};

func void dia_bagrus_teachhunting_dragonblood()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_DragonBlood))
	{
		AI_Output(self,other,"DIA_Bagrus_TeachHunting_DragonBlood_01_00");	//Лучше всего брать кровь из брюха. Найди слабое место и вонзи туда острый нож.
	};
	Info_ClearChoices(dia_bagrus_teachhunting);
};

