#include <sourcemod> 
#include <sdktools> 

public Plugin:myinfo = { 
    name = "Joinsound", 
    author = "Aleksander Niedźwiedź", 
    description = "Greeting sound plays on client put in server.", 
    version = "1.0", 
    url = "https://github.com/shadaxv" 
} 

public void OnConfigsExecuted()
{
	char sBuffer[PLATFORM_MAX_PATH];
	
	PrecacheSound("music/MyJailbreak/joinsoundmilicja.mp3", true);
	Format(sBuffer, sizeof(sBuffer), "sound/music/MyJailbreak/joinsoundmilicja.mp3");
	AddFileToDownloadsTable(sBuffer);
}


public OnClientPostAdminCheck(client)
{
	if( !IsFakeClient(client) && GetClientCount(true) < MaxClients )
	{
		EmitSoundToClient(client, "music/MyJailbreak/joinsoundmilicja.mp3", _, _, _, _, 1.0);
	}
}