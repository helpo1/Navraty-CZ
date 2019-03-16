instance DIA_Ass_130_CorGalomDemon_EXIT(C_Info)
{
	npc = Ass_130_CorGalomDemon;
	nr = 999;
	condition = DIA_Ass_130_CorGalomDemon_exit_condition;
	information = DIA_Ass_130_CorGalomDemon_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Ass_130_CorGalomDemon_exit_condition()
{
	return TRUE;
};

func void DIA_Ass_130_CorGalomDemon_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Ass_130_CorGalomDemon_Hello(C_Info)
{
	npc = Ass_130_CorGalomDemon;
	nr = 1;
	condition = DIA_Ass_130_CorGalomDemon_hello_condition;
	information = DIA_Ass_130_CorGalomDemon_hello_info;
	permanent = FALSE;
	important= TRUE;
};
	
func int DIA_Ass_130_CorGalomDemon_hello_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};	
	
func void DIA_Ass_130_CorGalomDemon_hello_info()
{
	if(Npc_HasItems(other,ItKe_Masiaf_Prision) >= 1)
	{
		Npc_RemoveInvItems(other,ItKe_Masiaf_Prision,1);
	};

	AI_Output(self,other,"DIA_Ass_130_CorGalomDemon_hello_01_00");	//А вот и наш герой!
	AI_Output(self,other,"DIA_Ass_130_CorGalomDemon_hello_01_01");	//Признаться, я с нетерпением ждал твоего появления c момента последней нашей встречи.
	AI_Output(other,self,"DIA_Ass_130_CorGalomDemon_hello_01_02");	//Разве мы знакомы?
	AI_Output(self,other,"DIA_Ass_130_CorGalomDemon_hello_01_03");	//Конечно. Или ты уже позабыл, что произошло в храме Спящего?
	AI_Output(other,self,"DIA_Ass_130_CorGalomDemon_hello_01_04");	//Ммм... Да, твое лицо мне кажется знакомым. Неужели Кор-Галом?
	AI_Output(self,other,"DIA_Ass_130_CorGalomDemon_hello_01_05");	//А я уж думал, ты никогда не догадаешься.
	AI_Output(other,self,"DIA_Ass_130_CorGalomDemon_hello_01_06");	//Но я же тогда убил тебя там, в храме!
	AI_Output(self,other,"DIA_Ass_130_CorGalomDemon_hello_01_07");	//Так оно и есть. Однако какая-то неизвестная мне темная магия вернула меня обратно к жизни.
	AI_Output(self,other,"DIA_Ass_130_CorGalomDemon_hello_01_08");	//И, видимо, мой хозяин решил, что я буду более полезен в виде демона, нежели в роли обычного мага-скелета.

	if(MeetDarkTempleMage == TRUE)
	{
		AI_Output(self,other,"DIA_Ass_130_CorGalomDemon_hello_01_09");	//Кстати, ты уже ведь с ним встречался.
		AI_Output(other,self,"DIA_Ass_130_CorGalomDemon_hello_01_10");	//Если ты имеешь в виду того некроманта в храме - то да.

		if(Npc_IsDead(dmt_1298_darkmage) == TRUE)
		{

			AI_Output(other,self,"DIA_Ass_130_CorGalomDemon_hello_01_11");	//Правда, его магия не смогла спасти его от смерти.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Ass_130_CorGalomDemon_hello_01_12");	//Кстати, я уверен, что ты с ним еще встретишься.
		AI_Output(other,self,"DIA_Ass_130_CorGalomDemon_hello_01_13");	//Значит, придется убить и его.
	};

	AI_Output(other,self,"DIA_Ass_130_CorGalomDemon_hello_01_14");	//Но лучше ответь мне на другой вопрос.
	AI_Output(other,self,"DIA_Ass_130_CorGalomDemon_hello_01_15");	//Зачем тебе понадобились послушники Братства?
	AI_Output(self,other,"DIA_Ass_130_CorGalomDemon_hello_01_16");	//Это легко объяснить. Ты ведь всегда знал про мою страсть к различным исследованиям.
	AI_Output(self,other,"DIA_Ass_130_CorGalomDemon_hello_01_17");	//А для них, как ты понимаешь, всегда необходимы некоторые расходные материалы.
	AI_Output(self,other,"DIA_Ass_130_CorGalomDemon_hello_01_18");	//И Ханиар Слепец с его Тенями вполне сгодились для того, чтобы регулярно снабжать меня ими.
	AI_Output(self,other,"DIA_Ass_130_CorGalomDemon_hello_01_19");	//В обмен на его услуги я даровал ему свое покровительство. Ведь он всегда жаждал огромного могущества.
	AI_Output(other,self,"DIA_Ass_130_CorGalomDemon_hello_01_20");	//Но ему это не очень помогло.
	AI_Output(self,other,"DIA_Ass_130_CorGalomDemon_hello_01_21");	//(мрачно) Я уже догадался, что ты убил его. Как и моего слугу Небироса.
	AI_Output(self,other,"DIA_Ass_130_CorGalomDemon_hello_01_22");	//Кстати, он как раз был одним из творений моих исследований.
	AI_Output(other,self,"DIA_Ass_130_CorGalomDemon_hello_01_23");	//Я уже по достоинству оценил твой труд. И отправил его туда, где ему самое место!
	AI_Output(self,other,"DIA_Ass_130_CorGalomDemon_hello_01_24");	//Хммм. Похоже, что на твоем пути тебя ничто и никто не сможет остановить.
	AI_Output(other,self,"DIA_Ass_130_CorGalomDemon_hello_01_25");	//Ты можешь попробовать!
	AI_Output(self,other,"DIA_Ass_130_CorGalomDemon_hello_01_26");	//Именно это я и собираюсь сейчас сделать. Я ведь уже говорил, что давно ждал этого момента!
	Info_ClearChoices(DIA_Ass_130_CorGalomDemon_hello);
	Info_AddChoice(DIA_Ass_130_CorGalomDemon_hello,Dialog_Ende,DIA_Ass_130_CorGalomDemon_hello_Exit);
};

func void DIA_Ass_130_CorGalomDemon_hello_Exit()
{
	CorGalomDontSpeak = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,0);
	self.aivar[AIV_EnemyOverride] = FALSE;
};	