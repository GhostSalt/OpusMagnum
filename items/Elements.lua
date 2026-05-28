OpusMagnumAPI = SMODS.current_mod

OpusMagnumAPI.Element = SMODS.Center:extend {
    unlocked = true,
    discovered = true,
    config = {},
    set = "opusm_Element",
    class_prefix = "omelem",
    required_params = { "key", "atlas", "pos" },
    pre_inject_class = function(self)
        G.P_CENTER_POOLS[self.set] = {}
    end
}

OpusMagnumAPI.Element {
    key = "fire",
    atlas = "TileElements",
    pos = { x = 1, y = 0 }
}
