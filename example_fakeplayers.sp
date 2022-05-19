#pragma tabsize 4

#include <sourcemod>
#include <fakequeries>
#include <helpfull>
int g_Random;
public void OnPluginStart()
{
    FQ_ResetA2sInfo();
    FQ_RemoveAllFakePlayer();
	g_Random = GetRandomInt(10,12);
	
	for(int i = 1;i<g_Random;i++)
	{
		CreateTimer(GetRandomFloat(0.0,7200.0), Timer_Repeat, i);
	}
	
    //deprecated, use FQ_InfoResponseAutoPlayerCount instead
    //g_iFakePlayerCount = 3;
    //FQ_SetNumClients(g_iFakePlayerCount + GetClientCount());
    //Player count in A2S_INFO response will be automatically set according to the fake players you add.
    FQ_InfoResponseAutoPlayerCount(true);

    //You can do like this to only add what you want in A2S_INFO extra data
    FQ_SetEDF(ExtraData_GamePort | ExtraData_ServerTag);
    
    FQ_ToggleStatus(true);
}

public Action Timer_Repeat(Handle hTimer, i)
{
	FQ_AddFakePlayer(i, name[i], GetRandomInt(0,150), GetEngineTime());
}