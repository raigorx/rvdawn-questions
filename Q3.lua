-- change function name that better reflects what the function does
function remove_player_from_party(playerId, membername)
  player = Player(playerId)
  local party = player:getParty()

  -- no need to create a Player object every time the loop runs
  local memberToRemove = Player(membername)

  -- in the community the variable name _ is often used to indicate that the variable is not used
  for _, member in pairs(party:getMembers()) do
    if member == memberToRemove then
      party:removeMember(memberToRemove)
    end
  end
end
