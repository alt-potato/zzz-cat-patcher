PROTOCHAR = require("__CharacterModHelper__.common")("ProtogenCharacterUpdated")
PROTOCHAR.is_debug = false
local charname = "protogen-skin"

-- Setup new animations, etc
local ICONPATH = "__ProtogenCharacterUpdated__/graphics/icons/"
local SR_IMGPATH = "__ProtogenCharacterUpdated__/graphics/SR/"
local HR_IMGPATH = "__ProtogenCharacterUpdatedHR__/graphics/HR/"

local protogen_animations = {
    water_reflection = {
        pictures = {
            filename = SR_IMGPATH .. "character-reflection.png",
            priority = "extra-high",
            width = 13,
            height = 19,
            shift = util.by_pixel(0, 67),
            scale = 5,
            variation_count = 1,
            hr_version = {
                filename = HR_IMGPATH .. "hr-character-reflection.png",
                priority = "extra-high",
                width = 13 * 2,
                height = 19 * 2,
                shift = util.by_pixel(0, 67 * 0.5),
                scale = 5/2,
                variation_count = 1
            }
        },
        rotate = false,
        orientation_to_variation = false
    },
    level1 = {
        dead = {
            filename = SR_IMGPATH .. "level1_dead.png",
            width = 186,
            height = 227,
            shift = util.by_pixel(-7.0,-5.5),
            frame_count = 2,
            scale = 0.5,
            hr_version = {
                filename = HR_IMGPATH .. "hr-level1_dead.png",
                width = 186 * 2,
                height = 227 * 2,
                shift = util.by_pixel(-7.0, -5.5),
                frame_count = 2,
                scale = 0.5/2
            }
        },
        dead_mask = {
            filename = SR_IMGPATH .. "level1_dead_mask.png",
            width = 186,
            height = 227,
            shift = util.by_pixel(-7.0, -5.5),
            frame_count = 2,
            apply_runtime_tint = true,
            scale = 0.5,
            hr_version = {
                filename = HR_IMGPATH .. "hr-level1_dead_mask.png",
                width = 186 * 2,
                height = 227 * 2,
                shift = util.by_pixel(-7.0, -5.5),
                frame_count = 2,
                apply_runtime_tint = true,
                scale = 0.5/2
            }
        },
        dead_shadow = {
            filename = SR_IMGPATH .. "level1_dead_shadow.png",
            width = 186,
            height = 227,
            shift = util.by_pixel(-7.5, -2.5),
            frame_count = 2,
            draw_as_shadow = true,
            scale = 0.85,
            hr_version = {
                filename = HR_IMGPATH .. "hr-level1_dead_shadow.png",
                width = 186 * 2,
                height = 227 * 2,
                shift = util.by_pixel(-7.5, -2.5),
                frame_count = 2,
                draw_as_shadow = true,
                scale = 0.85/2
            }
        },
        idle = {
            filename = SR_IMGPATH .. "level1_idle.png",
            width = 186,
            height = 227,
            shift = util.by_pixel(0.0, -21.0),
            frame_count = 22,
            direction_count = 8,
            animation_speed = 0.15,
            scale = 0.5,
            hr_version = {
                filename = HR_IMGPATH .. "hr-level1_idle.png",
                width = 186 * 2,
                height = 227 * 2,
                shift = util.by_pixel(0.0, -21.0),
                frame_count = 22,
                direction_count = 8,
                animation_speed = 0.15,
                scale = 0.5/2
            }
        },
        idle_mask = {
            filename = SR_IMGPATH .. "level1_idle_mask.png",
            width = 186,
            height = 227,
            shift = util.by_pixel(0.0, -21.0),
            frame_count = 22,
            direction_count = 8,
            animation_speed = 0.15,
            apply_runtime_tint = true,
            scale = 0.5,
            hr_version = {
                filename = HR_IMGPATH .. "hr-level1_idle_mask.png",
                width = 186 * 2,
                height = 227 * 2,
                shift = util.by_pixel(0.0, -21.0),
                frame_count = 22,
                direction_count = 8,
                animation_speed = 0.15,
                apply_runtime_tint = true,
                scale = 0.5/2
            }
        },
        idle_shadow = {
            filename = SR_IMGPATH .. "level1_idle_shadow.png",
            width = 186,
            height = 227,
            shift = util.by_pixel(0.0, -21.0),
            frame_count = 22,
            direction_count = 8,
            animation_speed = 0.15,
            draw_as_shadow = true,
            scale = 0.8,
            hr_version = {
                filename = HR_IMGPATH .. "hr-level1_idle_shadow.png",
                width = 186 * 2,
                height = 227 * 2,
                shift = util.by_pixel(0.0, -21.0),
                frame_count = 22,
                direction_count = 8,
                animation_speed = 0.15,
                draw_as_shadow = true,
                scale = 0.8/2
            }
        },
        idle_gun = {
            filename = SR_IMGPATH .. "level1_idle_gun.png",
            width = 186,
            height = 227,
            shift = util.by_pixel(0.0, -22.0),
            frame_count = 22,
            direction_count = 8,
            animation_speed = 0.15,
            scale = 0.5,
            hr_version = {
                filename = HR_IMGPATH .. "hr-level1_idle_gun.png",
                width = 186 * 2,
                height = 227 * 2,
                shift = util.by_pixel(0.0, -22.0),
                frame_count = 22,
                direction_count = 8,
                animation_speed = 0.15,
                scale = 0.5/2
            }
        },
        idle_gun_mask = {
            filename = SR_IMGPATH .. "level1_idle_gun_mask.png",
            width = 186,
            height = 227,
            shift = util.by_pixel(0.0, -22.0),
            frame_count = 22,
            direction_count = 8,
            animation_speed = 0.15,
            apply_runtime_tint = true,
            scale = 0.5,
            hr_version = {
                filename = HR_IMGPATH .. "hr-level1_idle_gun_mask.png",
                width = 186 * 2,
                height = 227 * 2,
                shift = util.by_pixel(0.0, -22.0),
                frame_count = 22,
                direction_count = 8,
                animation_speed = 0.15,
                apply_runtime_tint = true,
                scale = 0.5/2
            }
        },
        idle_gun_shadow = {
            filename = SR_IMGPATH .. "level1_idle_gun_shadow.png",
            width = 186,
            height = 227,
            shift = util.by_pixel(0.0, -22.0),
            frame_count = 22,
            direction_count = 8,
            animation_speed = 0.15,
            draw_as_shadow = true,
            scale = 0.9,
            hr_version = {
                filename = HR_IMGPATH .. "hr-level1_idle_gun_shadow.png",
                width = 186 * 2,
                height = 227 * 2,
                shift = util.by_pixel(0.0, -22.0),
                frame_count = 22,
                direction_count = 8,
                animation_speed = 0.15,
                draw_as_shadow = true,
                scale = 0.9/2
            }
        },
        mining_tool = {
            stripes = {
                {
                    filename = SR_IMGPATH .. "level1_mining_tool-1.png",
                    width_in_frames = 13,
                    height_in_frames = 8
                },
                {
                    filename = SR_IMGPATH .. "level1_mining_tool-2.png",
                    width_in_frames = 13,
                    height_in_frames = 8
                }
            },
            width = 186,
            height = 227,
            shift = util.by_pixel(0.0, -15.0),
            frame_count = 26,
            direction_count = 8,
            animation_speed = 0.9,
            scale = 0.5,
            hr_version = {
                stripes = {
                    {
                        filename = HR_IMGPATH .. "hr-level1_mining_tool-1.png",
                        width_in_frames = 13,
                        height_in_frames = 8
                    },
                    {
                        filename = HR_IMGPATH .. "hr-level1_mining_tool-2.png",
                        width_in_frames = 13,
                        height_in_frames = 8
                    }
                },
                width = 186 * 2,
                height = 227 * 2,
                shift = util.by_pixel(0.0, -15.0),
                frame_count = 26,
                direction_count = 8,
                animation_speed = 0.9,
                scale = 0.5/2
            }
        },
        mining_tool_mask = {
            stripes = {
                {
                    filename = SR_IMGPATH .. "level1_mining_tool_mask-1.png",
                    width_in_frames = 13,
                    height_in_frames = 8
                },
                {
                    filename = SR_IMGPATH .. "level1_mining_tool_mask-2.png",
                    width_in_frames = 13,
                    height_in_frames = 8
                }
            },
            width = 186,
            height = 227,
            shift = util.by_pixel(0.0, -15.0),
            frame_count = 26,
            direction_count = 8,
            animation_speed = 0.9,
            apply_runtime_tint = true,
            scale = 0.5,
            hr_version = {
                stripes = {
                    {
                        filename = HR_IMGPATH .. "hr-level1_mining_tool_mask-1.png",
                        width_in_frames = 13,
                        height_in_frames = 8
                    },
                    {
                        filename = HR_IMGPATH .. "hr-level1_mining_tool_mask-2.png",
                        width_in_frames = 13,
                        height_in_frames = 8
                    }
                },
                width = 186 * 2,
                height = 227 * 2,
                shift = util.by_pixel(0.0, -15.0),
                frame_count = 26,
                direction_count = 8,
                animation_speed = 0.9,
                apply_runtime_tint = true,
                scale = 0.5/2
            }
        },
        mining_tool_shadow = {
            stripes = {
                {
                    filename = SR_IMGPATH .. "level1_mining_tool_shadow-1.png",
                    width_in_frames = 13,
                    height_in_frames = 8
                },
                {
                    filename = SR_IMGPATH .. "level1_mining_tool_shadow-2.png",
                    width_in_frames = 13,
                    height_in_frames = 8
                }
            },
            width = 186 ,
            height = 227 ,
            shift = util.by_pixel(0.0, -15.0),
            frame_count = 26,
            direction_count = 8,
            animation_speed = 0.9,
            draw_as_shadow = true,
            scale = 0.7,
            hr_version = {
                stripes = {
                    {
                        filename = HR_IMGPATH .. "hr-level1_mining_tool_shadow-1.png",
                        width_in_frames = 13,
                        height_in_frames = 8
                    },
                    {
                        filename = HR_IMGPATH .. "hr-level1_mining_tool_shadow-2.png",
                        width_in_frames = 13,
                        height_in_frames = 8
                    }
                },
                width = 186 * 2,
                height = 227 * 2,
                shift = util.by_pixel(0.0, -15.0),
                frame_count = 26,
                direction_count = 8,
                animation_speed = 0.9,
                draw_as_shadow = true,
                scale = 0.7/2
            }
        },
        running = {
            filename = SR_IMGPATH .. "level1_running.png",
            width = 186,
            height = 227,
            shift = util.by_pixel(0.0, -18.0),
            frame_count = 22,
            direction_count = 8,
            animation_speed = 0.6,
            scale = 0.5,
            hr_version = {
                filename = HR_IMGPATH .. "hr-level1_running.png",
                width = 186 * 2,
                height = 2327 * 2,
                shift = util.by_pixel(0.0, -18.0),
                frame_count = 22,
                direction_count = 8,
                animation_speed = 0.6,
                scale = 0.5/2
            }
        },
        running_mask = {
            filename = SR_IMGPATH .. "level1_running_mask.png",
            width = 186,
            height = 227,
            shift = util.by_pixel(0.0, -18.0),
            frame_count = 22,
            direction_count = 8,
            animation_speed = 0.6,
            apply_runtime_tint = true,
            scale = 0.5,
            hr_version = {
                filename = HR_IMGPATH .. "hr-level1_running_mask.png",
                width = 186 * 2,
                height = 227 * 2,
                shift = util.by_pixel(0.0, -18.0),
                frame_count = 22,
                direction_count = 8,
                animation_speed = 0.6,
                apply_runtime_tint = true,
                scale = 0.5/2
            }
        },
        running_shadow = {
            filename = SR_IMGPATH .. "level1_running_shadow.png",
            width = 186,
            height = 227,
            shift = util.by_pixel(0.0, -18.0),
            frame_count = 22,
            direction_count = 8,
            animation_speed = 0.6,
            draw_as_shadow = true,
            scale = 0.7,
            hr_version = {
                filename = HR_IMGPATH .. "hr-level1_running_shadow.png",
                width = 186 * 2,
                height = 227 * 2,
                shift = util.by_pixel(0.0, -18.0),
                frame_count = 22,
                direction_count = 8,
                animation_speed = 0.6,
                draw_as_shadow = true,
                scale = 0.7/2
            }
        },
        running_gun = {
            filename = SR_IMGPATH .. "level1_running_gun.png",
            width = 186,
            height = 227,
            shift = util.by_pixel(2.5, -19.5),
            frame_count = 22,
            direction_count = 18,
            animation_speed = 0.6,
            scale = 0.5,
            hr_version = {
                filename = HR_IMGPATH .. "hr-level1_running_gun.png",
                width = 186 * 2,
                height = 227 * 2,
                shift = util.by_pixel(2.5, -19.5),
                frame_count = 22,
                direction_count = 18,
                animation_speed = 0.6,
                scale = 0.5/2
            }
        },
        running_gun_mask = {
            filename = SR_IMGPATH .. "level1_running_gun_mask.png",
            width = 186,
            height = 227,
            shift = util.by_pixel(2.5, -19.5),
            frame_count = 22,
            direction_count = 18,
            animation_speed = 0.6,
            apply_runtime_tint = true,
            scale = 0.5,
            hr_version = {
                filename = HR_IMGPATH .. "hr-level1_running_gun_mask.png",
                width = 186 * 2,
                height = 227 * 2,
                shift = util.by_pixel(2.5, -19.5),
                frame_count = 22,
                direction_count = 18,
                animation_speed = 0.6,
                apply_runtime_tint = true,
                scale = 0.5/2
            }
        },
        running_gun_shadow = {
            filename = SR_IMGPATH .. "level1_running_gun_shadow.png",
            width = 186,
            height = 227,
            shift = util.by_pixel(2.5, -19.5),
            frame_count = 22,
            direction_count = 18,
            animation_speed = 0.6,
            draw_as_shadow = true,
            scale = 0.8,
            hr_version = {
                filename = HR_IMGPATH .. "hr-level1_running_gun_shadow.png",
                width = 186 * 2,
                height = 227 * 2,
                shift = util.by_pixel(2.5, -19.5),
                frame_count = 22,
                direction_count = 18,
                animation_speed = 0.6,
                draw_as_shadow = true,
                scale = 0.8/2
            }
        }
    },
    level2addon = { },
    level3addon = { }
}

if not mods["ProtogenCharacterUpdatedHR"] then
    for _, level in pairs(protogen_animations) do
        for _, layer in pairs(level) do
            if type(layer) == "table" and layer.hr_version then
                layer.hr_version = nil
            end
        end
    end
end

-- Initialize prototypes for character and character-corpse
PROTOCHAR.protos = {}
PROTOCHAR.protos.character = { name = charname }
PROTOCHAR.protos.corpse = { name = charname .. "-corpse" }

-- Character
PROTOCHAR.protos.character.localised_name = {"entity-name." .. charname}
PROTOCHAR.protos.character.localised_description = {"entity-description." .. charname}
PROTOCHAR.protos.character.icons = {
    {
        icon = ICONPATH .. "character.png",
        icon_size = 64,
        icon_mipmaps = 4,
    }
}
PROTOCHAR.protos.character.character_corpse = PROTOCHAR.protos.corpse.name
PROTOCHAR.protos.character.fast_replaceable_group = "character"
PROTOCHAR.protos.character.animations = {
    {
        idle = {
            layers = {
                protogen_animations.level1.idle,
                protogen_animations.level1.idle_mask,
                protogen_animations.level1.idle_shadow
            }
        },
        idle_with_gun = {
            layers = {
                protogen_animations.level1.idle_gun,
                protogen_animations.level1.idle_gun_mask,
                protogen_animations.level1.idle_gun_shadow
            }
        },
        mining_with_tool = {
            layers = {
                protogen_animations.level1.mining_tool,
                protogen_animations.level1.mining_tool_mask,
                protogen_animations.level1.mining_tool_shadow
            }
        },
        running_with_gun = {
            layers = {
                protogen_animations.level1.running_gun,
                protogen_animations.level1.running_gun_mask,
                protogen_animations.level1.running_gun_shadow
            }
        },
        flipped_shadow_running_with_gun = {
            layers = {
                protogen_animations.level1.running_gun_shadow
            }
        },
        running = {
            layers = {
                protogen_animations.level1.running,
                protogen_animations.level1.running_mask,
                protogen_animations.level1.running_shadow
            }
        }
    }
}
PROTOCHAR.protos.character.water_reflection = protogen_animations.water_reflection

-- Character corpse
PROTOCHAR.protos.corpse.name = charname.."-corpse"
PROTOCHAR.protos.corpse.localised_name = {"entity-name." .. PROTOCHAR.protos.corpse.name}
PROTOCHAR.protos.corpse.icons = {
    {
        icon = ICONPATH .. "character.png",
        icon_mipmaps = 4,
        icon_size = 64,
    },
}
PROTOCHAR.protos.corpse.pictures = {
    {
        layers = {
            protogen_animations.level1.dead,
            protogen_animations.level1.dead_mask,
            protogen_animations.level1.dead_shadow
        }
    },
    {
        layers = {
            protogen_animations.level1.dead,
            protogen_animations.level1.dead_mask,
            protogen_animations.level1.dead_shadow
        }
    },
    {
        layers = {
            protogen_animations.level1.dead,
            protogen_animations.level1.dead_mask,
            protogen_animations.level1.dead_shadow
        }
    },
    {
        layers = {
            protogen_animations.level1.dead,
            protogen_animations.level1.dead_mask,
            protogen_animations.level1.dead_shadow
        }
    }
}

-- Create prototypes
CharModHelper.create_prototypes(PROTOCHAR.protos)
CharModHelper.check_my_prototypes(PROTOCHAR.protos)
