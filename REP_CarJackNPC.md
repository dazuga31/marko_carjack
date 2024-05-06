## Інсталяція та підготовка.

Додайте додаткові рядки коду до файлів вказаних нище.

Цей код лише як приклад застосування діалогової системи, тому він потребує доопрацювання.


1. Додайте до **rep-talkNPC\server\server.lua:**

```lua
-- Server-side
RegisterServerEvent('myresource:server:DrawText')
AddEventHandler('myresource:server:DrawText', function(playerId, text, position)
    TriggerClientEvent('myresource:client:DrawText', playerId, text, position)
end)

RegisterServerEvent('marko_carsjack:startJob')
AddEventHandler('marko_carsjack:startJob', function(playerId)
    StartJob(playerId)
end)
```


2. Додайте до **rep-talkNPC\client\cl_ex.lua:**

```lua
function CreateDirtyJobNPC()
    local npcCoords = vector4(-73.59, -822.64, 325.18, 125.78)

    local targetCoordsList = {
        vector3(-321.0, -465.56, 295.98),
        vector3(448.28, -607.87, 255.57),
        vector3(770.96, -1568.75, 98.95),
        -- Додайте інші координати за потреби
    }

    local npc = exports['rep-talkNPC']:CreateNPC({
        npc = 'g_m_y_ballasout_01',
        coords = npcCoords,
        name = 'Старший Брат',
        animName = "amb@world_human_smoking@male@male_a@enter",
        animDist = "enter",
        tag = "Старший Брат",
        colorr = "#f5c93b",
        startMSG = 'Шукаєш роботу?'
    }, {
        [1] = {
            label = "Так шукаю.",
            shouldClose = false,
            action = function()
                exports['rep-talkNPC']:changeDialog("Можу запропонувати тобі роботу з нерухомістю, каршерінгом (з натяком що це грабунок будинків та угон автомобілів)",
                    {
                        [1] = {
                            label = "Мене цікавить нерухомість.",
                            shouldClose = false,
                            action = function()
                                exports['rep-talkNPC']:changeDialog("Тобі потрібні деталі роботи чи ти почнеш одразу?",
                                    {
                                        [1] = {
                                            label = "Розповідай, я вперше тут.",
                                            shouldClose = true,
                                            action = function()
                                                TriggerServerEvent('rcore_guidebook:open')
                                                TriggerEvent("wais:addNotification", "info", "Інформація", "Знайди сторінку 'Нелегальний заробіток!'", 5000)
                                            end
                                        },
                                        [2] = {
                                            label = "Давай адресу, я вже все знаю.",
                                            shouldClose = true,
                                            action = function()
                                                local newTargetCoords = targetCoordsList[math.random(1, #targetCoordsList)]
                                                SetNewWaypoint(newTargetCoords.x, newTargetCoords.y)
                                                exports['rep-talkNPC']:updateMessage("The job location is marked on your GPS. Good luck!")
                                                TriggerEvent("wais:addNotification", "info", "Адреса", "Власник на роботі, ти можеш почати! Але будь обачним!", 5000)
                                            end
                                        },
                                        [3] = {
                                            label = "Я передумав.",
                                            shouldClose = true,
                                            action = function()
                                                TriggerEvent('rep-talkNPC:client:close')
                                            end
                                        }
                                    }
                                )
                            end
                        },
                        [2] = {
                            label = "Думаю каршерінг буде цікавим.",
                            shouldClose = false,
                            action = function()
                                exports['rep-talkNPC']:changeDialog("Тобі потрібно підготуватись, тобі потрібна з цим допомога?",
                                    {
                                        [1] = {
                                            label = "Так, я вперше це роблю.",
                                            shouldClose = false,
                                            action = function()
                                                exports['rep-talkNPC']:changeDialog("Тобі потрібні деталі роботи, почитай ось це.",
                                                    {
                                                        [1] = {
                                                            label = "Читати",
                                                            shouldClose = true,
                                                            action = function()
                                                                TriggerServerEvent('rcore_guidebook:open')
                                                                TriggerEvent("wais:addNotification", "info", "Інформація", "Знайди сторінку 'Нелегальний заробіток!'", 5000)
                                                            end
                                                        },
                                                        [2] = {
                                                            label = "Далі",
                                                            shouldClose = true,
                                                            action = function()
                                                                TriggerEvent('rep-talkNPC:client:close')
                                                                print("Викликаємо серверну функцію StartJob") -- Додайте цей рядок для дебагу
                                                                TriggerServerEvent('marko_carsjack:startJob') -- Додайте цей виклик
                                                                TriggerEvent("wais:addNotification", "info", "Розробка", "В розробці, Марко не спить, щоб це було готово як змога швидше!", 5000)
                                                            end
                                                        },
                                                        [3] = {
                                                            label = "Відмовитись від справи",
                                                            shouldClose = true,
                                                            action = function()
                                                                TriggerEvent('rep-talkNPC:client:close')
                                                            end
                                                        }
                                                    }
                                                )
                                            end
                                        },
                                        [2] = {
                                            label = "Почнімо",
                                            shouldClose = true,
                                            action = function()
                                                exports['rep-talkNPC']:updateMessage("Тобі потрібно підготуватись, тобі потрібна з цим допомога!")
                                                
                                                TriggerEvent("wais:addNotification", "info", "Розробка", "В розробці, Марко не спить, щоб це було готово як змога швидше!", 5000)
                                            end
                                        },
                                        [3] = {
                                            label = "Я краще підготуюсь.",
                                            shouldClose = true,
                                            action = function()
                                                TriggerEvent('rep-talkNPC:client:close')
                                            end
                                        }
                                    }
                                )
                            end
                        },
                        [3] = {
                            label = "Я подумаю.",
                            shouldClose = true,
                            action = function()
                                TriggerEvent('rep-talkNPC:client:close')
                            end
                        }
                    }
                )
            end
        },
        [2] = {
            label = "Ні не шукаю.",
            shouldClose = true,
            action = function()
                TriggerEvent('rep-talkNPC:client:close')
            end
        },
        [3] = {
            label = "Я хочу купити дещо.",
            shouldClose = true,
            action = function()
                -- Додайте код для виведення товарів або щось подібне за потреби
            end
        }
    })
    -- Додавання тексту над головою NPC
    local textCoords = vector3(npcCoords.x, npcCoords.y, npcCoords.z + 1.0)
    DrawText3DAboveNPC('Бiг Дедi', textCoords.x, textCoords.y, textCoords.z, 0.4)
end
-- Іріш Паб

function CreateIrishPubNPC()
    local npcCoords = vector4(844.27, -119.85, 78.24, 59.06) --     local npcCoords = vector4(844.27, -119.85, 78.24, 59.06)

    local targetCoordsList = {
        vector3(-321.0, -465.56, 295.98),
        vector3(448.28, -607.87, 255.57),
        vector3(770.96, -1568.75, 98.95),
        -- Додайте інші координати за потреби
    }

    local npc = exports['rep-talkNPC']:CreateNPC({
        npc = 'mp_m_exarmy_01',
        coords = npcCoords,
        name = 'Степан',
        animName = "anim@amb@beach_party@",
        animDist = "seated_male_a_base",
        tag = "Степан",
        colorr = "#f5c93b",
        startMSG = 'Шукаєш роботу?'
    }, {
        [1] = {
            label = "Так шукаю.",
            shouldClose = false,
            action = function()
                exports['rep-talkNPC']:changeDialog("Можу запропонувати тобі роботу з нерухомістю, каршерінгом (з натяком що це грабунок будинків та угон автомобілів)",
                    {
                        [1] = {
                            label = "Мене цікавить нерухомість.",
                            shouldClose = false,
                            action = function()
                                exports['rep-talkNPC']:changeDialog("Тобі потрібні деталі роботи чи ти почнеш одразу?",
                                    {
                                        [1] = {
                                            label = "Розповідай, я вперше тут.",
                                            shouldClose = true,
                                            action = function()
                                                TriggerServerEvent('rcore_guidebook:open')
                                                TriggerEvent("wais:addNotification", "info", "Інформація", "Знайди сторінку 'Нелегальний заробіток!'", 5000)
                                            end
                                        },
                                        [2] = {
                                            label = "Давай адресу, я вже все знаю.",
                                            shouldClose = true,
                                            action = function()
                                                local newTargetCoords = targetCoordsList[math.random(1, #targetCoordsList)]
                                                SetNewWaypoint(newTargetCoords.x, newTargetCoords.y)
                                                exports['rep-talkNPC']:updateMessage("The job location is marked on your GPS. Good luck!")
                                                TriggerEvent("wais:addNotification", "info", "Адреса", "Власник на роботі, ти можеш почати! Але будь обачним!", 5000)
                                            end
                                        },
                                        [3] = {
                                            label = "Я передумав.",
                                            shouldClose = true,
                                            action = function()
                                                TriggerEvent('rep-talkNPC:client:close')
                                            end
                                        }
                                    }
                                )
                            end
                        },
                        [2] = {
                            label = "Думаю каршерінг буде цікавим.",
                            shouldClose = false,
                            action = function()
                                exports['rep-talkNPC']:changeDialog("Тобі потрібно підготуватись, тобі потрібна з цим допомога?",
                                    {
                                        [1] = {
                                            label = "Так, я вперше це роблю.",
                                            shouldClose = false,
                                            action = function()
                                                exports['rep-talkNPC']:changeDialog("Тобі потрібні деталі роботи, почитай ось це.",
                                                    {
                                                        [1] = {
                                                            label = "Читати",
                                                            shouldClose = true,
                                                            action = function()
                                                                TriggerServerEvent('rcore_guidebook:open')
                                                                TriggerEvent("wais:addNotification", "info", "Інформація", "Знайди сторінку 'Нелегальний заробіток!'", 5000)
                                                            end
                                                        },
                                                        [2] = {
                                                            label = "Далі",
                                                            shouldClose = true,
                                                            action = function()
                                                                TriggerEvent('rep-talkNPC:client:close')
                                                            
                                                                TriggerEvent("wais:addNotification", "info", "Розробка", "В розробці, Марко не спить, щоб це було готово як змога швидше!", 5000)
                                                            end
                                                        },
                                                        [3] = {
                                                            label = "Відмовитись від справи",
                                                            shouldClose = true,
                                                            action = function()
                                                                TriggerEvent('rep-talkNPC:client:close')
                                                            end
                                                        }
                                                    }
                                                )
                                            end
                                        },
                                        [2] = {
                                            label = "Далі",
                                            shouldClose = true,
                                            action = function()
                                                TriggerEvent('rep-talkNPC:client:close')
                                                -- Виклик серверного експорту з іншого ресурсу
                                                TriggerServerEvent('marko_carsjack:startjob', {your, arguments, here})
                                            end
                                        },
                                        
                                        [3] = {
                                            label = "Я краще підготуюсь.",
                                            shouldClose = true,
                                            action = function()
                                                TriggerEvent('rep-talkNPC:client:close')
                                            end
                                        }
                                    }
                                )
                            end
                        },
                        [3] = {
                            label = "Я подумаю.",
                            shouldClose = true,
                            action = function()
                                TriggerEvent('rep-talkNPC:client:close')
                            end
                        }
                    }
                )
            end
        },
        [2] = {
            label = "Ні не шукаю.",
            shouldClose = true,
            action = function()
                TriggerEvent('rep-talkNPC:client:close')
            end
        },
        [3] = {
            label = "Я хочу купити дещо.",
            shouldClose = true,
            action = function()
                -- Додайте код для виведення товарів або щось подібне за потреби
            end
        }
    })
    -- Додавання тексту над головою NPC
    local textCoords = vector3(npcCoords.x, npcCoords.y, npcCoords.z + 1.2)
    DrawText3DAboveNPC('Степан', textCoords.x, textCoords.y, textCoords.z, 0.4)
end


RegisterNetEvent('police:giveSpecialBadge')
AddEventHandler('police:giveSpecialBadge', function()
    TriggerServerEvent('police:giveSpecialBadge')
end)

function DrawText3DAboveNPC(text, x, y, z, scale)
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
            local ped = PlayerPedId()
            local distance = GetDistanceBetweenCoords(x, y, z, GetEntityCoords(ped), true)

            if distance <= 4.0 then
                DrawText3D(vector3(x, y, z + 1.0), text, scale)
            end
        end
    end)
end

function DrawText3D(coords, text, scale)
    local onScreen, x, y = World3dToScreen2d(coords.x, coords.y, coords.z)
    local camCoords = GetGameplayCamCoord()

    if onScreen then
        SetTextScale(scale, scale)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry('STRING')
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(x, y)
    end
end

```