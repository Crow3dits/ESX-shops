
Config = {}
Config.Storelist = {}

Config.Lang = 'EN' --- Can be added more from shared/locales.lua
Config.Notifications = 'ox_lib' -- ox_lib or custom


--- More information in our documentation: https://estscripts.gitbook.io/info/documentations/simple-stores/installation
--- Original version: https://github.com/kac5a/k5_shops

Config.Storelist = {
    ['shadypawnshop'] = { -- Unique shop identifier; ensure PNG logo matches this name
        DisplayName = "Dirty Pawnshop", -- Name displayed for the shop
        PaymentID = 3, -- Payment Styles (selling and buying): 1 = cash, 2 = bank, 3 = black money
        Distancetoseller = 1.5,  --- Distance that opens TextUI and you are able to open the shop
        Restartrefresh = false, --- should store stock be wiped on server restart?
        IsUnlimited = false, -- Controls if items can be bought/sold without limit (stock)
        Nobuying = true,--- If true shop does not have buy option, you can only sell items there!
        Position = vector3(706.1038, -965.5582, 30.4129), -- Store location
        BlipSettings = { -- Blip creation (delete this section if you do not want a blip)
            ColorID = 1, -- Color for the shop blip
            SpriteID = 272, -- Sprite ID for the blip
            ScaleFactor = 1.0, -- Size of the blip on the map
            StoreBlipName = "Dirty Pawnshop" --- Blip name
        },
        SellerNPC = { -- Seller NPC Configuration 
            Model = 'a_m_y_soucent_02', -- NPC model (set to nil if you do not want to have a ped)
            Location = vector3(706.1038, -965.5582, 29.4129), -- NPC Spawn location
            HeadingDirection = 285.1291, -- NPC Heading
            Animation = {
                Dict = "amb@world_human_aa_smoke@male@idle_a", -- Animation dictionary for NPC
                Name = "idle_a" -- Name of the animation to play
            }
        },
        items = { -- Items available for sale or buying in the shop
            ['goldbull'] = { -- Unique ID for the product, matching the database
            ItemLabel = "Gold coins", -- ItemItemLabel for the item
            Defaultamount = 2, --- Amount of this item that shop has by default
            BPrice = math.random(85, 105), -- Random buy price for the item (set this to nil you you do not want shop to sell this item)
            --- PS Don't have to use math random if you want stabile price!
            ---Example: BPrice = 85
            MaxAmount = 20, -- Maximum stock the shop can hold of this item
            SPrice = math.random(57, 77) -- Random sell price for the item (set this to nil if you do not want shop to buy this item)
             --- PS Don't have to use math random if you want stabile price!
             --- Example:  SPrice = 77
            },
            ['gold_bar'] = { -- Unique ID for the product, matching the database
            ItemLabel = "Gold bar", -- ItemItemLabel for the item
            Defaultamount = 2, --- Amount of this item that shop has by default
            BPrice = math.random(85, 105), -- Random buy price for the item (set this to nil you you do not want shop to sell this item)
            MaxAmount = 20, -- Maximum stock the shop can hold of this item
            SPrice = math.random(57, 77) -- Random sell price for the item (set this to nil if you do not want shop to buy this item)
            },
            ['bluediamond'] = { -- Unique ID for the product, matching the database
            ItemLabel = "Blue diamond", -- ItemItemLabel for the item
            Defaultamount = 2, --- Amount of this item that shop has by default
            BPrice = math.random(85, 105), -- Random buy price for the item (set this to nil you you do not want shop to sell this item)
            MaxAmount = 20, -- Maximum stock the shop can hold of this item
            SPrice = math.random(57, 77) -- Random sell price for the item (set this to nil if you do not want shop to buy this item)
            },
            ['diamond'] = { -- Unique ID for the product, matching the database
            ItemLabel = "Diamond", -- ItemItemLabel for the item
            Defaultamount = 2, --- Amount of this item that shop has by default
            BPrice = math.random(85, 105), -- Random buy price for the item (set this to nil you you do not want shop to sell this item)
            MaxAmount = 20, -- Maximum stock the shop can hold of this item
            SPrice = math.random(57, 77) -- Random sell price for the item (set this to nil if you do not want shop to buy this item)
            },
            ['pinkdiamond'] = { -- Unique ID for the product, matching the database
            ItemLabel = "Pink diamond", -- ItemItemLabel for the item
            Defaultamount = 2, --- Amount of this item that shop has by default
            BPrice = math.random(85, 105), -- Random buy price for the item (set this to nil you you do not want shop to sell this item)
            MaxAmount = 20, -- Maximum stock the shop can hold of this item
            SPrice = math.random(57, 77) -- Random sell price for the item (set this to nil if you do not want shop to buy this item)
            },
            ['panther'] = { -- Unique ID for the product, matching the database
            ItemLabel = "Panther statue", -- ItemItemLabel for the item
            Defaultamount = 2, --- Amount of this item that shop has by default
            BPrice = math.random(85, 105), -- Random buy price for the item (set this to nil you you do not want shop to sell this item)
            MaxAmount = 20, -- Maximum stock the shop can hold of this item
            SPrice = math.random(57, 77) -- Random sell price for the item (set this to nil if you do not want shop to buy this item)
            },
            ['pbottle'] = { -- Unique ID for the product, matching the database
            ItemLabel = "Expensive bottle", -- ItemItemLabel for the item
            Defaultamount = 2, --- Amount of this item that shop has by default
            BPrice = math.random(85, 105), -- Random buy price for the item (set this to nil you you do not want shop to sell this item)
            MaxAmount = 20, -- Maximum stock the shop can hold of this item
            SPrice = math.random(57, 77) -- Random sell price for the item (set this to nil if you do not want shop to buy this item)
            },
            ['pnecklace'] = { -- Unique ID for the product, matching the database
            ItemLabel = "Expensive necklace", -- ItemItemLabel for the item
            Defaultamount = 2, --- Amount of this item that shop has by default
            BPrice = math.random(85, 105), -- Random buy price for the item (set this to nil you you do not want shop to sell this item)
            MaxAmount = 20, -- Maximum stock the shop can hold of this item
            SPrice = math.random(57, 77) -- Random sell price for the item (set this to nil if you do not want shop to buy this item)
            },
            ['pmonkey'] = { -- Unique ID for the product, matching the database
            ItemLabel = "Monkey statue", -- ItemItemLabel for the item
            Defaultamount = 2, --- Amount of this item that shop has by default
            BPrice = math.random(85, 105), -- Random buy price for the item (set this to nil you you do not want shop to sell this item)
            MaxAmount = 20, -- Maximum stock the shop can hold of this item
            SPrice = math.random(57, 77) -- Random sell price for the item (set this to nil if you do not want shop to buy this item)
            },
            ['necklace'] = { -- Unique ID for the product, matching the database
            ItemLabel = "Necklace", -- ItemItemLabel for the item
            Defaultamount = 2, --- Amount of this item that shop has by default
            BPrice = math.random(85, 105), -- Random buy price for the item (set this to nil you you do not want shop to sell this item)
            MaxAmount = 20, -- Maximum stock the shop can hold of this item
            SPrice = math.random(57, 77) -- Random sell price for the item (set this to nil if you do not want shop to buy this item)
            },
            ['ring'] = { -- Unique ID for the product, matching the database
            ItemLabel = "Ring", -- ItemItemLabel for the item
            Defaultamount = 2, --- Amount of this item that shop has by default
            BPrice = math.random(85, 105), -- Random buy price for the item (set this to nil you you do not want shop to sell this item)
            MaxAmount = 20, -- Maximum stock the shop can hold of this item
            SPrice = math.random(57, 77) -- Random sell price for the item (set this to nil if you do not want shop to buy this item)
            },
            ['rolex'] = { -- Unique ID for the product, matching the database
            ItemLabel = "Rolex", -- ItemItemLabel for the item
            Defaultamount = 2, --- Amount of this item that shop has by default
            BPrice = math.random(85, 105), -- Random buy price for the item (set this to nil you you do not want shop to sell this item)
            MaxAmount = 20, -- Maximum stock the shop can hold of this item
            SPrice = math.random(57, 77) -- Random sell price for the item (set this to nil if you do not want shop to buy this item)
            },
        },
    },
    ['cleanpwnshop'] = { -- Unique shop identifier; ensure PNG logo matches this name
    DisplayName = "Pawnshop", -- Name displayed for the shop
    PaymentID = 1, -- Payment Styles (selling and buying): 1 = cash, 2 = bank, 3 = black money
    Distancetoseller = 1.5,  --- Distance that opens TextUI and you are able to open the shop
    Restartrefresh = true, --- should store stock be wiped on server restart?
    IsUnlimited = false, -- Controls if items can be bought/sold without limit (stock)
    Nobuying = false,--- If true shop does not have buy option, you can only sell items there!
    Position = vector3(713.0685, -967.4807, 30.3953), -- Store location
    BlipSettings = { -- Blip creation (delete this section if you do not want a blip)
        ColorID = 2, -- Color for the shop blip
        SpriteID = 272, -- Sprite ID for the blip
        ScaleFactor = 1.0, -- Size of the blip on the map
        StoreBlipName = "Pawnshop" --- Blip name
    },
    SellerNPC = { -- Seller NPC Configuration 
        Model = 'cs_carbuyer', -- NPC model (set to nil if you do not want to have a ped)
        Location = vector3(713.0685, -967.4807, 29.3953), -- NPC Spawn location
        HeadingDirection = 349.6501, -- NPC Heading
        Animation = {
            Dict = "amb@world_human_hang_out_street@female_arms_crossed@idle_a", -- Animation dictionary for NPC
            Name = "idle_a" -- Name of the animation to play
        }
    },
    items = { -- Items available for sale or buying in the shop
        ['goldbull'] = { -- Unique ID for the product, matching the database
        ItemLabel = "Gold coins", -- ItemItemLabel for the item
        Defaultamount = 2, --- Amount of this item that shop has by default
        BPrice = math.random(85, 105), -- Random buy price for the item (set this to nil you you do not want shop to sell this item)
        MaxAmount = 20, -- Maximum stock the shop can hold of this item
        SPrice = math.random(57, 77) -- Random sell price for the item (set this to nil if you do not want shop to buy this item)
        },
        ['gold_bar'] = { -- Unique ID for the product, matching the database
        ItemLabel = "Gold bar", -- ItemItemLabel for the item
        Defaultamount = 2, --- Amount of this item that shop has by default
        BPrice = math.random(85, 105), -- Random buy price for the item (set this to nil you you do not want shop to sell this item)
        MaxAmount = 20, -- Maximum stock the shop can hold of this item
        SPrice = math.random(57, 77) -- Random sell price for the item (set this to nil if you do not want shop to buy this item)
        },
        ['bluediamond'] = { -- Unique ID for the product, matching the database
        ItemLabel = "Blue diamond", -- ItemItemLabel for the item
        Defaultamount = 2, --- Amount of this item that shop has by default
        BPrice = math.random(85, 105), -- Random buy price for the item (set this to nil you you do not want shop to sell this item)
        MaxAmount = 20, -- Maximum stock the shop can hold of this item
        SPrice = math.random(57, 77) -- Random sell price for the item (set this to nil if you do not want shop to buy this item)
        },
        ['diamond'] = { -- Unique ID for the product, matching the database
        ItemLabel = "Diamond", -- ItemItemLabel for the item
        Defaultamount = 2, --- Amount of this item that shop has by default
        BPrice = math.random(85, 105), -- Random buy price for the item (set this to nil you you do not want shop to sell this item)
        MaxAmount = 20, -- Maximum stock the shop can hold of this item
        SPrice = math.random(57, 77) -- Random sell price for the item (set this to nil if you do not want shop to buy this item)
        },
        ['pinkdiamond'] = { -- Unique ID for the product, matching the database
        ItemLabel = "Pink diamond", -- ItemItemLabel for the item
        Defaultamount = 2, --- Amount of this item that shop has by default
        BPrice = math.random(85, 105), -- Random buy price for the item (set this to nil you you do not want shop to sell this item)
        MaxAmount = 20, -- Maximum stock the shop can hold of this item
        SPrice = math.random(57, 77) -- Random sell price for the item (set this to nil if you do not want shop to buy this item)
        },
        ['panther'] = { -- Unique ID for the product, matching the database
        ItemLabel = "Panther statue", -- ItemItemLabel for the item
        Defaultamount = 2, --- Amount of this item that shop has by default
        BPrice = math.random(85, 105), -- Random buy price for the item (set this to nil you you do not want shop to sell this item)
        MaxAmount = 20, -- Maximum stock the shop can hold of this item
        SPrice = math.random(57, 77) -- Random sell price for the item (set this to nil if you do not want shop to buy this item)
        },
        ['pbottle'] = { -- Unique ID for the product, matching the database
        ItemLabel = "Expensive bottle", -- ItemItemLabel for the item
        Defaultamount = 2, --- Amount of this item that shop has by default
        BPrice = math.random(85, 105), -- Random buy price for the item (set this to nil you you do not want shop to sell this item)
        MaxAmount = 20, -- Maximum stock the shop can hold of this item
        SPrice = math.random(57, 77) -- Random sell price for the item (set this to nil if you do not want shop to buy this item)
        },
        ['pnecklace'] = { -- Unique ID for the product, matching the database
        ItemLabel = "Expensive necklace", -- ItemItemLabel for the item
        Defaultamount = 2, --- Amount of this item that shop has by default
        BPrice = math.random(85, 105), -- Random buy price for the item (set this to nil you you do not want shop to sell this item)
        MaxAmount = 20, -- Maximum stock the shop can hold of this item
        SPrice = math.random(57, 77) -- Random sell price for the item (set this to nil if you do not want shop to buy this item)
        },
        ['pmonkey'] = { -- Unique ID for the product, matching the database
        ItemLabel = "Monkey statue", -- ItemItemLabel for the item
        Defaultamount = 2, --- Amount of this item that shop has by default
        BPrice = math.random(85, 105), -- Random buy price for the item (set this to nil you you do not want shop to sell this item)
        MaxAmount = 20, -- Maximum stock the shop can hold of this item
        SPrice = math.random(57, 77) -- Random sell price for the item (set this to nil if you do not want shop to buy this item)
        },
        ['necklace'] = { -- Unique ID for the product, matching the database
        ItemLabel = "Necklace", -- ItemItemLabel for the item
        Defaultamount = 2, --- Amount of this item that shop has by default
        BPrice = math.random(85, 105), -- Random buy price for the item (set this to nil you you do not want shop to sell this item)
        MaxAmount = 20, -- Maximum stock the shop can hold of this item
        SPrice = math.random(57, 77) -- Random sell price for the item (set this to nil if you do not want shop to buy this item)
        },
        ['ring'] = { -- Unique ID for the product, matching the database
        ItemLabel = "Ring", -- ItemItemLabel for the item
        Defaultamount = 2, --- Amount of this item that shop has by default
        BPrice = math.random(85, 105), -- Random buy price for the item (set this to nil you you do not want shop to sell this item)
        MaxAmount = 20, -- Maximum stock the shop can hold of this item
        SPrice = math.random(57, 77) -- Random sell price for the item (set this to nil if you do not want shop to buy this item)
        },
        ['rolex'] = { -- Unique ID for the product, matching the database
        ItemLabel = "Rolex", -- ItemItemLabel for the item
        Defaultamount = 2, --- Amount of this item that shop has by default
        BPrice = math.random(85, 105), -- Random buy price for the item (set this to nil you you do not want shop to sell this item)
        MaxAmount = 20, -- Maximum stock the shop can hold of this item
        SPrice = math.random(57, 77) -- Random sell price for the item (set this to nil if you do not want shop to buy this item)
        },
    },
},
['example-shop-no-ped-no-blip'] = { -- Unique shop identifier; ensure PNG logo matches this name
        DisplayName = "exampleshopnopednoblip", -- Name displayed for the shop
        PaymentID = 2, -- Payment Styles (selling and buying): 1 = cash, 2 = bank, 3 = black money
        Distancetoseller = 1.5,  --- Distance that opens TextUI and you are able to open the shop
        Restartrefresh = false, --- should store stock be wiped on server restart?
        IsUnlimited = false, -- Controls if items can be bought/sold without limit (stock)
        Nobuying = false,--- If true shop does not have buy option, you can only sell items there!
        Position = vector3(707.0936, -960.8204, 30.3953), -- Store location
        BlipSettings = false,
        SellerNPC = false,
        items = { -- Items available for sale or buying in the shop
            ['rolex'] = { -- Unique ID for the product, matching the database
            ItemLabel = "Rolex", -- ItemItemLabel for the item
            Defaultamount = 2, --- Amount of this item that shop has by default
            BPrice = math.random(85, 105), -- Random buy price for the item (set this to nil you you do not want shop to sell this item)
            MaxAmount = 20, -- Maximum stock the shop can hold of this item
            SPrice = math.random(57, 77) -- Random sell price for the item (set this to nil if you do not want shop to buy this item)
            },
            ['gold_bar'] = { -- Unique ID for the product, matching the database
            ItemLabel = "Gold bar", -- ItemItemLabel for the item
            Defaultamount = 2, --- Amount of this item that shop has by default
            BPrice = math.random(85, 105), -- Random buy price for the item (set this to nil you you do not want shop to sell this item)
            MaxAmount = 20, -- Maximum stock the shop can hold of this item
            SPrice = math.random(57, 77) -- Random sell price for the item (set this to nil if you do not want shop to buy this item)
            },
            ['bluediamond'] = { -- Unique ID for the product, matching the database
            ItemLabel = "Blue diamond", -- ItemItemLabel for the item
            Defaultamount = 2, --- Amount of this item that shop has by default
            BPrice = math.random(85, 105), -- Random buy price for the item (set this to nil you you do not want shop to sell this item)
            MaxAmount = 20, -- Maximum stock the shop can hold of this item
            SPrice = math.random(57, 77) -- Random sell price for the item (set this to nil if you do not want shop to buy this item)
            },
            ['diamond'] = { -- Unique ID for the product, matching the database
            ItemLabel = "Diamond", -- ItemItemLabel for the item
            Defaultamount = 2, --- Amount of this item that shop has by default
            BPrice = math.random(85, 105), -- Random buy price for the item (set this to nil you you do not want shop to sell this item)
            MaxAmount = 20, -- Maximum stock the shop can hold of this item
            SPrice = math.random(57, 77) -- Random sell price for the item (set this to nil if you do not want shop to buy this item)
            },
            ['pinkdiamond'] = { -- Unique ID for the product, matching the database
            ItemLabel = "Pink diamond", -- ItemItemLabel for the item
            Defaultamount = 2, --- Amount of this item that shop has by default
            BPrice = math.random(85, 105), -- Random buy price for the item (set this to nil you you do not want shop to sell this item)
            MaxAmount = 20, -- Maximum stock the shop can hold of this item
            SPrice = math.random(57, 77) -- Random sell price for the item (set this to nil if you do not want shop to buy this item)
            },
            ['panther'] = { -- Unique ID for the product, matching the database
            ItemLabel = "Panther statue", -- ItemItemLabel for the item
            Defaultamount = 2, --- Amount of this item that shop has by default
            BPrice = math.random(85, 105), -- Random buy price for the item (set this to nil you you do not want shop to sell this item)
            MaxAmount = 20, -- Maximum stock the shop can hold of this item
            SPrice = math.random(57, 77) -- Random sell price for the item (set this to nil if you do not want shop to buy this item)
            },
        },
    },
    ['jobexample'] = {
        DisplayName = "BurgerShot",
        sellJob = {'burgershot'}, -- The name of the jobs that can access this shop's sell option. Money goes to the society
        Position = vector3(-1198.8856201172, -882.81433105469, 13.348832130432),
        BlipSettings = { -- Blip creation (set this to false if do not want a blip)
        ColorID = 75, -- Color for the shop blip
        SpriteID = 103, -- Sprite ID for the blip
        ScaleFactor = 1.0, -- Size of the blip on the map
        StoreBlipName = "Burgershot" --- Blip name
    },
        SellerNPC = { -- Seller NPC Configuration 
        Model = 'csb_burgerdrug', -- NPC model (set to nil if you do not want to have a ped)
        Location = vector3(-1198.7757568359, -882.98065185547, 12.349102020264), -- NPC Spawn location
        HeadingDirection = 34.899082183838, -- NPC Heading
        Animation = {
            Dict = "amb@world_human_hang_out_street@female_arms_crossed@idle_a", -- Animation dictionary for NPC
            Name = "idle_a" -- Name of the animation to play
        }
    },
        PaymentID = 1,
        items = {
            ['sandwich'] = {
                ItemLabel = "Sandwich",
                Defaultamount = 50,
                BPrice = 200,
                MaxAmount = 50,
                SPrice = 150,
            },
            ['cola'] = {
                label = "Cola",
                Defaultamount = 50,
                BPrice = 50,
                MaxAmount = 50,
                SPrice = 10,
            },
        }
    },
    ----- More shops can be created wherever you want.
}

----- Notifications ----
function Notifi(data)
    if Config.Notifications == 'ox_lib' then
        lib.defaultNotify({
            title = Config.title,
            description = data.text or data,
            duration = data.duration or 8000,
            style = {
                backgroundColor = '#292929',
                color = '#c2c2c2',
                ['.description'] = {
                    color = '#cccccc'
                }
            },
            icon = data.icon or 'car',
            iconColor = data.color or '#d46363'
        })
    elseif Config.Notifications == 'custom' then
    end
end

function NotifiServ(src, data)
    if Config.Notifications == 'ox_lib' then
        TriggerClientEvent('ox_lib:notify', src, {
            title = Config.title,
            description = data.text or data,
            duration = 6000,
            style = {
                backgroundColor = '#292929',
                color = '#c2c2c2',
                ['.description'] = {
                    color = '#cccccc'
                }
            },
            icon = data.icon or "car",
            iconColor = data.color or '#d46363'
        })
    elseif Config.Notifications == 'custom' then
    end
end