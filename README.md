# Marko CarJack

## The script has several sides, legal and illegal:

**Illegal:**
* Theft of cars by players who belong to gangs/mafias.
* Earning experience for each stolen car, the level system allows you to adjust the reward according to the level and value of the car.

**Legal:**
* Police officers can catch robbers and return the car to a parking fine by accumulating experience and levels.
* The level of patrol affects the % of funds received for the return of a stolen car.

## Technical part.

**Detailed Debug Mode - Allows you to monitor a large part of aspects of the script, which allows you to easily control its operation.**

**Slot system - Allows you to limit the number of simultaneous car thefts. If a player takes a task, he occupies 1 of the slots, which is freed when the task is completed or failed.**
  - If all slots are occupied, the player receives a corresponding message.
  - The slot system helps to control the number of simultaneous car thefts, this is convenient in the case of the advantage of one of the factions on the server.
  - Automatic completion of the task after the specified deadline, removes the car and frees up one slot

**Locations of the appearance of cars can be easily edited in the config file**

**The level system allows you to customize the type of car and the reward for it based on the level of the player.**
  - This allows, for example, at level 0 to steal cheap cars and with each subsequent level to provide the player with the best cars and a higher reward.
  - The level system is also adapted for the legal part of the script, the players who return the stolen car to the parking lot receive % of the value of the car that the thief could get.
   - With each subsequent level, the police officer will receive a higher % reward.
   - All this is easily adjusted in **config.lua**

##### Automob search system.

* **The police officer can turn on the "radar" which will display cars on the map at a certain time interval.**
  - Blips start to appear from the moment the thief stole the car.
  - Blips and their refresh rate can also be easily customized.
* **False activation of the car alarm**
  - Blips can also be assigned to random cars, which can sometimes confuse cops.

##### PS-MDT
* If you use **PS-MDT**, when the car is stolen, information about it enters the system.
  - This allows the police to check for car theft by the number plate and make of the car.


## Instruction
##### Choose a language that is convenient for you:
* **English** [InstallationENG.md](InstallationENG.md).
* **Ukrainian** [InstallationUA.md](InstallationUA.md).

## Contribution to the project

[REP-SCRIPTS](https://discord.gg/JXAqu6Sc) - Script of dialogue system with NPC - rep-talkNPC
## Dependencies

[QBcore](https://github.com/qbcore-framework/qb-core)
[OxLib](https://github.com/overextended/ox_lib)
[rep-talkNPC](https://github.com/BahnMiFPS/rep-talkNPC)

## Authors

* **Marko Scripts** - *marko_leveling* - [Discord](https://discord.gg/ptUTdGWtjX)



## Versions

* **V-1.0** - Release version.