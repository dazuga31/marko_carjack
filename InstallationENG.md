## Getting Started

Before starting the installation, make sure that you have the latest version of FiveM, QBcore, OxLib installed - You will find links to them below.

## Installation and preparation.

What you need to install first:

1. Unzip the **marko_carsjack.rar** archive into your resources folder.

2. Make sure you have **OX lib** installed - It is required to interact with the MySQL database.

3. Open **HeldiSQL** (Or another application) and import into your database [importDB.sql](importDB.sql).

4. add **ensure marko_carsjack** to **config.cfg** of your server at the end.
* Make sure **marko_carsjack** is downstream of **OX lib** and **[qb]**


5. Install the auxiliary script of the leveling system [Marko_Leveling](https://github.com/dazuga31/marko_leveling)

6. If you want to use a dialogue system with NPCs that will allow players to take tasks to steal a car, install the following script:
* [rep-talkNPC](https://github.com/BahnMiFPS/rep-talkNPC)
* **Additional instruction** [REP_CarJackNPC.md](REP_CarJackNPC.md).

7. Install [ps-mdt](https://github.com/Project-Sloth/ps-mdt)
  - Allows you to receive reports about the theft of a car and adds it to the police register. Which allows cops to check cars for stolen status.
  - Set in **Config.lua** - **Config.Use_mdt_bolos = true**

## Usage

You can easily customize the level system with **Config.lua**.
* All configs are signed with comments, so it won't be difficult.


##### qb_radialmenu
Add to **config.lua:**

```lua
        {
            id = 'carthief',
            title = 'Vehicle Radar',
            icon = 'car-on',
            type = 'command',
            event = 'PoliceMarkerLocation',
            shouldClose = true
        },
```
