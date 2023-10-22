--// Developed by yh_2231. Free to use model //--

--// Config //--
local GroupID = 33214791
local Rainbow = 629498138 --gamepass ID
local cmdrank = 2
--//Deeper Config //--
local Headtag = script.Headtag
local Username = Headtag.Username
local Rank = Headtag.GPRNK


--// Locals//--
local MPS = game:GetService("MarketplaceService")
function splitString(input, delimiter)
	local result = {}
	local pattern = "[^" .. delimiter .. "]+"
	for word in string.gmatch(input, pattern) do
		table.insert(result, word)
	end
	return result
end


--// Main Loader //--


game.Players.PlayerAdded:Connect(function(player)
	local Rainbowbought = MPS:UserOwnsGamePassAsync(player.UserId,Rainbow)
	
	local groupRank = player:GetRoleInGroup(GroupID)
	local clone = script.Headtag
	clone.Parent = game.Workspace:WaitForChild(player.Name).Head
	clone.Username.Text = player.DisplayName.." [@"..player.name.."]"
	clone.GPRNK.Text = groupRank
	if Rainbowbought then
		clone.Username.Rainbow.Enabled = true
	else 
		print(player.Name.. " Doesn't own the Rainbow Gamepass")
	end
	


	player.CharacterAdded:Connect(function()
		
		
		local groupRank = player:GetRoleInGroup(GroupID)
		local clone = script.Headtag
		clone.Parent = game.Workspace:WaitForChild(player.Name).Head
		clone.Username.Text = player.DisplayName.." [@"..player.name.."]"
		clone.GPRNK.Text = groupRank
		if Rainbowbought then
			clone.Username.Rainbow.Enabled = true
			print(player.Name.." Owns the Rainbow gamepass")
		else 
			print(player.Name.. " Doesn't own the Rainbow Gamepass")
		end
		
	end)


end)


--// End of module //--