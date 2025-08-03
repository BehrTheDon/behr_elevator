Config = {}

Config.Debug = true -- Set to true to enable debug messages in the console

Config.OxTextPosition = "right-center"  -- left-center/right-center/bottom-center/top-center

Config.Elevator = {
    {
        info = {
            name = "Main Building",
            floors = {
                { level = 1, elevator = true, coords = vector4(-36.5976, -1122.8666, 26.3593, 188.9286) },
                { level = 2, elevator = true, coords = vector4(-35.9049, -1119.2615, 32.5727, 322.4975) },
            },
        },
    },
    {
        info = {
            name = "Second Building",
            floors = {
                { level = 1, elevator = true, coords = vector4(-715.6709, 303.8033, 85.3046, 181.4266) },
                { level = 2, elevator = true, coords = vector4(-713.7637, 315.7631, 140.1452, 73.2663) },
                { level = 3, elevator = true, coords = vector4(-755.2869, 334.4506, 230.6366, 271.8299) },
            },
        },
    },
    -- Add More Elevators Here!
}