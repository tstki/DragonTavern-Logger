unit UStrings;

interface

resourcestring
  StrVersion            = '1.0.9';

const
  //
  cBaseUrl              = 'http://www.dragontavern.com/';
  cRefStr               = '?ref=';
  cExploreStr           = '<A class=locName href="/char/';
  cNoneStr              = '- None -';
  cRecentStr            = '- Active Zone -';
  cNoDataStr            = 'No data available for this zone (yet)';
  cTavernZoneName       = 'Dragon Tavern';
  cCreatureWench        = 'Bar wench';
  cCreatureRandom       = 'Bar patrons';

  cInventoryStr         = 'currently carrying the following items:';
  cInvItemNameStart     = '<LI><B>';
  cBoldEnd              = '</B>';
  cSpanEnd              = '</SPAN>';
  cCubeStartStr         = 'Loot Transmutation Cube';
  cCubeEndStr           = 'left today.';

  cSoulAdded            = 'note-immortal>You add a soul';
  cSoulBursting         = 'note-immortal>You feel yourself almost bursting';

  //tmpstr '</P>'#$D#$A'<UL>'#$D#$A'<LI><B>Asbestos Fungoid Stalk</B> - <SPAN class="loot tooltip"
  //title="Common Loot|Common loot is heavier and less valuable than other loot" jQuery1307305243529="4">
  //<SPAN class=lootType-com>[C]</SPAN></SPAN> Value: <SPAN class=lootValue>249</SPAN> gold, Weight: <SPAN class=lootWeight>8</SPAN>'#$D#$A'<LI><B>Doom Furnace Schematics</B> - <SPAN class="loot tooltip" title="Exotic Loot|Exotic loot is lighter and more valuable than other loot" jQuery1307305243529="5"><SPAN class=lootType-exo>[E]</SPAN></SPAN> Value: <SPAN class=lootValue>3,330</SPAN> gold, Weight: <SPAN class=lootWeight>1</SPAN>'#$D#$A'<LI><B>Hemmax Pendant</B> - <SPAN class="loot tooltip" title="Rare Loot|Rare loot is lighter than common loot, and more valuable" jQuery1307305243529="6"><SPAN class=lootType-rar>[R]</SPAN></SPAN> Value: <SPAN class=lootValue>1,219</SPAN> gold, Weight: <SPAN class=lootWeight>1</SPAN>'#$D#$A'<LI><B>Lump of Starsteel Ore</B> - <SPAN class="loot tooltip" title="Exotic Loot|Exotic loot is lighter and more valuable than other loot" jQuery1307305243529="7"><SPAN class=lootType-exo>[E]</SPAN></SPAN> Value: <SPAN class=lootValue>4,719</SPAN> gold, Weight: <SPAN class=lootWeight>1</SPAN>'#$D#$A'<LI><B>Gold Necklace</B> - <SPAN class="loot tooltip" title="Rare Loot|Rare loot is lighter than common loot, and more valuable" jQuery1307305243529="8"><SPAN class=lootType-rar>[R]</SPAN></SPAN> Value: <SPAN class=lootValue>976</SPAN> gold, Weight: <SPAN class=lootWeight>3</SPAN>'#$D#$A'<LI><B>Pickwood Goblet</B> - <SPAN class="loot tooltip" title="Common Loot|Common loot is heavier and less valuable than other loot" jQuery1307305243529="9"><SPAN class=lootType-com>[C]</SPAN></SPAN> Value: <SPAN class=lootValue>257</SPAN> gold, Weight: <SPAN class=lootWeight>7</SPAN>'#$D#$A'<LI><B>Doom Furnace Schematics</B> - <SPAN class="loot tooltip" title="Exotic Loot|Exotic loot is lighter and more valuable than other loot" jQuery1307305243529="10"><SPAN class=lootType-exo>[E]</SPAN></SPAN> Value: <SPAN class=lootValue>3,441</SPAN> gold, Weight: <SPAN class=lootWeight>1</SPAN>'#$D#$A'<LI><B>Krell Reef Coral Jewelry</B> - <SPAN class="loot tooltip" title="Common Loot|Common loot is heavier and less valuable than other loot" jQuery1307305243529="11"><SPAN class=lootType-com>[C]</SPAN></SPAN> Value: <SPAN class=lootValue>196</SPAN> gold, Weight: <SPAN class=lootWeight>10</SPAN>'#$D#$A'<LI><B>Jadevine Amulet</B> - <SPAN class="loot tooltip" title="Common Loot|Common loot is heavier and less valuable than other loot" jQuery1307305243529="12"><SPAN class=lootType-com>[C]</SPAN></SPAN> Value: <SPAN class=lootValue>194</SPAN> gold, Weight: <SPAN class=lootWeight>9</SPAN>'#$D#$A'<LI><B>Gloomstone Jewelry</B> - <SPAN class="loot tooltip" title="Common Loot|Common loot is heavier and less valuable than other loot" jQuery1307305243529="13"><SPAN class=lootType-com>[C]</SPAN></SPAN> Value: <SPAN class=lootValue>188</SPAN> gold, Weight: <SPAN class=lootWeight>11</SPAN></LI></UL>'#$D#$A'<P><B>'

  cInvLootTypeStart     = 'class=lootType-';
  cInvLootTypeEnd       = ']</SPAN></SPAN>';
  cInvLootValueStart    = 'class=lootValue>';
  cInvLootValueEnd      = '</SPAN> gold';
  cInvLootWeightStart   = 'class=lootWeight>';
  cInvItemEnd           = #$D#$A;
  cInvRecycleStart      = 'href="';
  cInvRecycleEnd        = '" jQuery';

  strUnknown            = 'Unknown';
  strNoData             = 'No data';

  strIconAndText        = 'Icon and Text';
  strIconOnly           = 'Icon only';
  strTextOnly           = 'Text only';

  strMergeWarning       = 'Merging your local data into the host file will delete your local findings. Doing this means your changes might be lost if the application is updated at a later time. Are you sure you wish to continue?';
  strNoUndo             = 'This action can not be reverted. Really sure?';
  strBeerDragonRealms   = 'Beer Dragon Realms';

  strExportToFile       = 'Export data to file';
  strExportCsvExt       = 'csv';

implementation

end.
