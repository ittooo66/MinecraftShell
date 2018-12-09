import discord
import Server_Config as CONF

client = discord.Client()

@client.event
async def on_ready():
    print('ログインしました')

@client.event
async def on_message(message):
    if message.content.startswith('!live'):
        reply = 'Server Alive !'
        await client.send_message(message.channel, reply)

client.run(CONF.SERVER_KEY)
