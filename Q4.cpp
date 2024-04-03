void Game::addItemToPlayer(const std::string& recipient, uint16_t itemId) {
  Player* player = g_game.getPlayerByName(recipient);
  if (!player) {
    player = new Player(nullptr);
    if (!IOLoginData::loadPlayerByName(player, recipient)) {
      /*
      this not neccesary has to be a memory leak, if for example
      loadPlayerByName free the memory, a better option would be use smart
      pointers
      */
      delete player;  // this fix the memory leak
      return;
    }
  }

  Item* item = Item::CreateItem(itemId);
  if (!item) {
    delete item;  // this fix the memory leak
    return;
  }

  g_game.internalAddItem(player->getInbox(), item, INDEX_WHEREEVER,
                         FLAG_NOLIMIT);

  if (player->isOffline()) {
    IOLoginData::savePlayer(player);
  }
  delete player;  // this fix the memory leak
  delete item;    // this fix the memory leak
}
