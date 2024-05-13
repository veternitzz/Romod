--[[ Romod V1.0 | (c) alex_black20101

	Romod is easily the most basic chat-based admin and moderation command
	system on the Roblox platoform. Romod combines simplicity with
	customizability and is designed to be easily configurable,
	modifiable, and expandable.
	
]]

-- // Services
local Players = game:GetService("Players")
local TextChatService = game:GetService("TextChatService")

-- move commands container to textchatservice
script.RomodCommands.Parent = TextChatService

-- // Containers
local RomodCommands: Folder = TextChatService:WaitForChild("RomodCommands")
local TextChannels: Folder = TextChatService:WaitForChild("TextChannels")

-- // Variables
local Config = script.Config
local FastFlags = script.FastFlags

-- get the text channels
local RBXGeneral = TextChannels:WaitForChild("RBXGeneral")
local RBXSystem = TextChannels:WaitForChild("RBXSystem")

-- define group id
local GroupID = Config:GetAttribute("GroupID")

-- define place owner
local CreatorID = game.CreatorId

-- // Command Functions

function Kick(TextSource: TextSource, PlayerToKick: Player, Reason: string)
	PlayerToKick:Kick(Reason.." Kicked By: "..TextSource.Name)
end


-- // Commands

RomodCommands.Kick.Triggered:Connect(function(TextSource: TextSource, UncheckedMsg: string)
	local Msg = UncheckedMsg:split(" ")
	
	if Msg[1] == "/kick" then
		local RequiredRank = RomodCommands.Kick:GetAttribute("RequiredRank")
		local Admin: Player = Players:FindFirstChild(TextSource.Name)
		local AdminRank = Admin:GetRankInGroup(GroupID)
		
		if AdminRank >= RequiredRank then
			if Msg[2] == "me" then
				local PlayerToKick: Player = Players:FindFirstChild(TextSource.Name)
				local PlayerToKickRank = PlayerToKick:GetRankInGroup(GroupID)
				local Reason = Msg[3]
				
				if AdminRank > PlayerToKickRank then
					Kick(TextSource, PlayerToKick, Reason)
				else

				end
			else
				local PlayerToKick = Players:FindFirstChild(Msg[2])
				local PlayerToKickRank = PlayerToKick:GetRankInGroup(GroupID)
				local Reason = Msg[3]

				if AdminRank > PlayerToKickRank then
					Kick(TextSource, PlayerToKick, Reason)
				else

				end
			end
		else
			
		end
	end
end)