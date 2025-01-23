--Lighting--
local Lighting = game:GetService("Lighting")
Lighting.GlobalShadows = false
Lighting.Brightness = 0
Lighting.FogEnd = 9e9
for i,v in pairs(Lighting:GetChildren()) do
    if v:IsA("BlurEffect") or v:IsA("SunRaysEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("BloomEffect") or v:IsA("DepthOfFieldEffect") then
        v:Destroy()
    end
end

--Terrain--
local Terrain = game:GetService("Workspace").Terrain
Terrain.WaterWaveSize = 0
Terrain.WaterWaveSpeed = 0
Terrain.WaterReflectance = 0
Terrain.WaterTransparency = 0

--setting--
settings().Rendering.QualityLevel = Enum.QualityLevel.Level01

for i, v in pairs(game:GetDescendants()) do
    if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
        v.Material = "Plastic"
        v.Reflectance = 0
    elseif v:IsA("Decal") or v:IsA("Texture") or v:IsA("FaceInstance") then
        v.Transparency = 1
    elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
        v.Lifetime = NumberRange.new(0)
    elseif v:IsA("Explosion") then
        v.Visible = false
    elseif v:IsA("Smoke") or v:IsA("Fire") or v:IsA("Sparkles") or v:IsA("PostEffect") then
        v.Enabled = false
    elseif v:IsA("MeshPart") or v:IsA("BasePart") then
        v.Material = "Plastic"
        v.Reflectance = 0
    elseif v:IsA("Clothing") then
        v:Destroy()
    elseif v:IsA("Highlight") then
        v.OutlineTransparency = 1
        v.FillTransparency = 1
    end
end
