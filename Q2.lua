-- the name doesn't reflect what the function does, so I changed it to reflect that
function printNoFullGuildName(memberCount)
  -- get the guilds where its max members is less than memberCount seems to be a mistake it might be the other way around
  -- another thing is that memberCount must be sanitized to avoid SQL injection, in case the sql lib/dependency doesn't do it
  local selectGuildQuery = "SELECT name FROM guilds WHERE %d < max_members;"
  -- remove resultId is not being used
  db.storeQuery(string.format(selectGuildQuery, memberCount))
  -- no need for guildName variable
  print(result.getString("name"))
end
