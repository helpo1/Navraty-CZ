
func void B_DIA_Addon_Myxir_TeachRequest()
{
	AI_Output(other,self,"DIA_Addon_Myxir_TeachRequest_15_00");	//Nauč mě jazyk Stavitelů.
};

func void B_DIA_Addon_Myxir_TeachL1()
{
	AI_Output(self,other,"DIA_Addon_Myxir_TeachL1_12_00");	//Dobře, začneme s něčím jednoduchým. Nejdřív se budeme zabývat jazykem rolníků.
	AI_Output(self,other,"DIA_Addon_Myxir_TeachL1_12_01");	//Texty psané v jazyce rolníků většinou pojednávají o světských zájmech jako práce, láska a opatřování potravin.
	AI_Output(self,other,"DIA_Addon_Myxir_TeachL1_12_02");	//Byl to nejrozšířenější jazyk ve společnosti. Pokud si ho osvojíš, budeš rozumět většině textů, které se zde nacházejí.
};

func void B_DIA_Addon_Myxir_TeachL2()
{
	AI_Output(self,other,"DIA_Addon_Myxir_TeachL2_12_00");	//S jazykem rolníků ses už seznámil. Jazyk válečníků je trochu komplikovanější.
	AI_Output(self,other,"DIA_Addon_Myxir_TeachL2_12_01");	//Jak asi tušíš, texty psané v jazyce válečníků většinou obsahují informace příbuzné válkám a zbraním. Myslím si, že pro tebe to bude velmi užitečné.
};

func void B_DIA_Addon_Myxir_TeachL3()
{
	AI_Output(self,other,"DIA_Addon_Myxir_TeachL3_12_00");	//Vznešenému jazyku kněží je velice těžké porozumět, ale já ti ho s radostí vysvětlím.
	AI_Output(self,other,"DIA_Addon_Myxir_TeachL3_12_01");	//V jazyku kněží jsou mimo jiné všechny posvátné texty, které vysvětlují příběh a magii Stavitelů.
	AI_Output(self,other,"DIA_Addon_Myxir_TeachL3_12_02");	//Každý z těchto textů je pro člověka, který jim rozumí, opravdový poklad.
};

func void B_DIA_Addon_Myxir_TeachNoMore()
{
	AI_Output(self,other,"DIA_Addon_Myxir_TeachNoMore_12_00");	//Už není nic, co bych ti mohl ukázat. Mistrovsky jsi ovládl jazyk Stavitelů.
};

func void B_DIA_Addon_Myxir_Teach_LANGUAGE_X()
{
	AI_Output(self,other,"DIA_Addon_Myxir_Teach_LANGUAGE_X_12_00");	//Jdi a vyzkoušej své nové znalosti. Uvidíš - jazyk Stavitelů už pro tebe není nerozluštitelnou záhadou.
};

