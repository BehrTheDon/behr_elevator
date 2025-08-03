# 🛗 behr_elevator

A lightweight and configurable elevator system for FiveM using **ox_lib**. Allows players to teleport between floors in buildings through interactive zones.

---

## 🌟 Features

- 🔹 Configurable elevators and floors via `config.lua`
- 🧭 `[E]` interaction prompt using ox_lib’s Text UI
- 🗂 Context menus generated automatically from config
- 🌒 Optional screen fade transitions
- 📦 Zero dependencies outside of `ox_lib`
- 🧪 Debug logging for development

---

## 📦 Requirements

- [ox_lib](https://github.com/overextended/ox_lib)

---

## 🛠️ Installation

1. **Download or clone** this repository into your `resources` folder:

   ```bash
   git clone https://github.com/yourusername/behr_elevator.git
   ```

2. **Add the following to your `server.cfg`** (make sure `ox_lib` starts first):

   ```
   ensure ox_lib
   ensure behr_elevator
   ```

3. **Configure** your elevators in `shared/config.lua`.

---

## ⚙️ Configuration

Open `shared/config.lua` to define your elevators and floors:

```lua
Config.Elevator = {
    {
        info = {
            name = "Main Building",
            floors = {
                { level = 1, elevator = true, coords = vector4(-36.59, -1122.86, 26.35, 188.92) },
                { level = 2, elevator = true, coords = vector4(-35.90, -1119.26, 32.57, 322.49) },
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
}
```

### Other Config Options

```lua
Config.Debug = true -- Enable console debug messages
Config.TextUI = "oxlib" -- Use ox_lib Text UI
Config.TextPosition = "right-center" -- UI placement
```

---

## 🎮 Usage

* Walk into an elevator's interaction zone
* Press `[E]` to open the elevator menu
* Select a floor to teleport
* Screen fades (if enabled) for a smooth transition

---

## 📄 License

This project is licensed under the terms of the [LICENSE](./LICENSE).

---

## 💬 Support

Need help or want to suggest a feature?
Open an issue or contact [Behr Development](https://discord.gg/wA7W5dUMG6) on Discord.

```