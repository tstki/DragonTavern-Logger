=================================================================================
Dragon Tavern Logger.
---
Created by: Thomas Hansen
Contact: 		bbrundrscoretkiathotmaildtcom (You're smart, you can figure it out)
Site:    		http://rrvs.blogspot.nl
Compiler:		Delphi RAD Studio 2010
=================================================================================

What is it?
---
It's a Delphi tool which loads your local Internet Explorer into an subframe that monitors some of your actions while playing Dragon Tavern.
* It keeps track of the number of creatures you've killed of each type. So you can see the best place to hunt for a certain type of creature.
* It has a special easy-to-use loot-to-cube helper dialog to maximize your efficiency at transmuting loot into gold.
* More utility to come in the future.

Why did I make it?
---
In theory it could have been done in Greasemonkey, but, I've got no experience with that script language. So, I made it into a desktop application. This means it's faster, easier to update, and can log much more data without it affecting compatibility. It also allows for a lot more user interface dialogues and ease-of-use utility in the future.
The reason, well, I was getting tired of manually logging what zones had which type of creature in a google spread sheet. This is much more efficient. Once I had the basics, it kind of grew from there.

How does it work?
---
The application uses your installed Internet Explorer (Tested with IE9) in a subframe.
The data is stored locally in an few .ini files and updated as you explore and play the game as normal.
The right side holds some shortcut buttons - so you can go from cube transmutions STRAIGHT to the dragon tavern, without having to go "return to location" first.
There's a detail box for your current zone info, and it will update (+1), and show info about any other zone you want - like subzones.

---------------------------------------------------------------------------------
1.0.9 : 201x
---------------------------------------------------------------------------------
* Increase/decrease difficulty buttons added to main interface.
* Main interface slightly narrowed, to allow more room for the second data view panel.
* Fixed a number of missing popup button descriptions.
* The bar is now filled with random patrons.
* Added "Dynamic Data view" option. Which adds the ability to view the best 2 hunting columns for each subzone in the selected or recent zone. This option is enabled by default, you can disable it in the options.

Data analysis dialog (F9):
* Added option to show the best 2 creatures to hunt for each location instead of all creatures. This option is enabled by default.
* Added option to sort the "best 2" columns by kill % or by creature type.
* Added option to hide "beer dragon realms" data. Set this option in the preferences dialog. This option is enabled by default.

---------------------------------------------------------------------------------
1.0.8 : 20121106
---------------------------------------------------------------------------------
We're now on GitHub!

Inventory dialog:
* Added option to limit the number of rows the auto-selection performs if you have a cube.

---------------------------------------------------------------------------------
1.0.7 : 20111225
---------------------------------------------------------------------------------
* Fixed the name of "Abyssal Mines" in Zones.ini : All subzones have now been fixed and confirmed to be spelled correctly!
* Added option to block out logging of "double XP" monsters such as spawn during festivus. Since these can spawn in all areas and may disrupt data integrity.

Data analysis dialog (F9):
* Added ability to completely hide certain rows based on kill count.
* The dialog should now save it's settings more reliably.
* The level column now sorts by it's first number rather than by text. So, it will sort as: 1,2,3,4,5,6 instead of 1,20,3,50+,7 etc.

---------------------------------------------------------------------------------
1.0.6 : 2011118
---------------------------------------------------------------------------------
* Fixed the name of "Fork Tongue Clutch" in Zones.ini
* Fixed Alt+F4 to close application.
* Added "Lazy Zoneview" option. This ensures the zone view is never cleared automatically. To combat a so far unknown issue some people were having.
* Added ability to pre-fill your username and password. Note: These are stored locally in DragonLogger.ini as plain text. So, only use this feature if your pc is 100% secure.
* Added data export to .csv file format. See Menu: Browser -> Export. The exported data is controlled by your other preferences (such as include host data)
* Added option to preferences(F11) to export .csv data as total kill count(default) or percentages(as seen in the analyze dialog).

Inventory dialog:
* Added progress dialog upon cubing more than two items. To show it is working hard on making your items into gold.
* Sort columns are now remembered on open/close.
* Position on screen and width/height are now remembered on open/close.

Data analysis dialog (F9):
* Dialog is no longer modal. Meaning you can keep it open while exploring, and press the new refresh button to update the data.
* Sort columns are now remembered on open/close.
* Position on screen and width/height are now remembered on open/close.
* Now has a smaller "minimum" size.

---------------------------------------------------------------------------------
1.0.5 : 20111024
---------------------------------------------------------------------------------
* Fixed the names of "Temple of Filth", "The Sandy Beggar" and "Den of the Delvisha" in Zones.ini - hope that's the last of them, but can't be 100% sure just yet.
* Data analysis dialog(F9) added. You'll be able to find detailed % of which zones have the highest population to hunt.
* Added background color preferences(F11) for the data analyzer. Fixed colors for now, but you can change the activation %.
* Inventory list by default now sorts the value/weight column instead of the weight column.
* Main window tables and Inventory dialog table changed to "read only" - doesn't affect anything but it looked silly if you tried to double click it.
* Added lots more icons. Once again thanks to the FatCow free Farm-fresh set. http://www.fatcow.com/free-icons

---------------------------------------------------------------------------------
1.0.4 : 20111015
---------------------------------------------------------------------------------
* Fixed the names of "Planar Crossroads" and "Sliverghoul Burrow" in Zones.ini.
* Inventory list dialog is now sortable.
* Implemented alternating row colors for all tables.
* Collected data is now stored separately from the developer data. You will never have to worry about losing your data after upgrading again!
* Added preferences dialog (F11). Currently you are able to hide the developer collected data, and show/hide the combined data columns.
* Added hotkey for help dialog (F1) and about dialog (F2).

Main screen:
* Gathered data method changed to "table views" to support host/local data.
* The table row indication for new creatures found during this exploration attempt will now draw in a "bold" style instead of show "(+1)".
* Zoneview and Dataview tables are now sortable! - Current sort column and direction will be remembered in the settings.
* Made the screen slightly less wide. (Around 40-50 pixels or so)
* Added ability to hide the browser navigation bar. You can find the option in the preferences dialog (F11).
* Added ability to manually refresh the data view with the push of a single button.

---------------------------------------------------------------------------------
1.0.3 : 20110925
---------------------------------------------------------------------------------
* Fixed browser window losing focus after closing the Inventory list dialog, or pressing certain action buttons. It should be a bit less "strange" to use now.
* Disabled buttons when logged out or timed out.
* More button icons added.
* Buttons are now double buffered - which stops the strange icon fade-in / fade-out after selection on Vista and Windows 7.
* Added several button tooltips.
* Menubar added, to fit in a lot more actions and shortcuts for the future.
* Hotkeys dialog added. It shows you all the known DT hotkeys and how to enable them.
* Page source dialog: Added select all ability (Ctrl+A), as well as Escape button to close.
* Dialog creation changed to runtime rather than global. (You shouldn't notice much other than a slightly smaller memory footprint)
* Subdialog default positions changed to "Owner Form Center". So, no more random positions on those.
* We are now hiding several "strange" urls like google syndication, facebook, blanc, javascript e.a. that were reported earlier. Remember this is a Dragon Tavern logger, so while other webpages might work - it is not the main focus of this application. As a result of hiding these urls, the buttons and menu actions should be enabled/disabled in a more reliable & predictable manner.
* Disabled "Return to tavern", if you are in the tavern. It isn't going to do you much good to go where you already are.
* Added the list of monsters found in the tavern.
* Now keeping track of the latest version of the application you started. So we can show a changelog on startup later.

Inventory dialog:
* Added "select common" button.
* Changed select weight in to work as "this weight and greater".
* OK button renamed to: "Portal It!"
* Turned warning text red.

---------------------------------------------------------------------------------
1.0.2 : 20110917
---------------------------------------------------------------------------------
* Added application icon

Main screen:
* Button tab order improved.
* Added "about" dialog. (Questionmark button topright)
* Added some icons. It's not much, but looks better at least.
* Page source button. Mostly for debugging purposes.
* Inventory list button now has a better placement among it's fellows.
* Inventory list button is now disabled properly.
* Inventory list button can now be pressed even when you are not on your inventory page. It will try to load your inventory, "and then" open the dialog.

Inventory dialog:
* Button tab order improved.
* Added 5 new buttons - Select all by weight: 10, 11, 12, 13, unselect all.
* It will now tell you how many items you have selected.
* Implemented number of cube charges available.
* Show a warning if you select more items than the available cube charges.
* No longer tries to recycle selected items if you do not have a cube.
* Will not show certain buttons if you do not have a cube.

---------------------------------------------------------------------------------
1.0.1 : 20110606
---------------------------------------------------------------------------------
* Added inventory list dialog.
* Lots more initial data than the last version.
* Window saves it's size and location.
* Some spelling errors fixed in the elite sublocations (let me know if you find any more!)

---------------------------------------------------------------------------------
1.0.0 : 20110220
---------------------------------------------------------------------------------
* Initial version.
* Web frame
* Url bars
* Zone logging
