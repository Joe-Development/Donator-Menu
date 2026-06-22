# Donator Menu

Simple donator menu for FiveM. Edit `config.lua` to set up vehicles, weapons, peds, nested menus, and permission locks.

Needs [ox_lib](https://github.com/overextended/ox_lib).

## Install

1. Drop the folder in `resources/`
2. Make sure `ox_lib` starts first
3. Add to `server.cfg`:

```cfg
ensure ox_lib
ensure Donator-Menu
```

Opens with `/donatormenu` by default. Change `Config.Open.type` to `"keybind"` if you want a key instead.

## Config

`config.lua` is split into `Menu`, `Open`, `Messages`, and `Entries`.

```lua
-- Submenu
{
    label = "Police Packs",
    permission = "donator.police",
    items = { ... },
},

-- Item
{
    label = "Police Maverick",
    action = "vehicle",
    model = "police",
},
```

`action` can be `"vehicle"`, `"weapon"`, or `"ped"`.

## Permissions

Set `permission` on a submenu, then add the ACE in `server.cfg`:

```cfg
add_ace group.donator donator.police allow
add_principal identifier.license:xxxxxxxx group.donator
```

## License

[MIT](LICENSE)
