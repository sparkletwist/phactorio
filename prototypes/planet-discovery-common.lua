local planet_discovery_vulcanus = "planet-discovery-vulcanus"
local planet_discovery_fulgora = "planet-discovery-fulgora"
local planet_discovery_gleba = "planet-discovery-gleba"
local planet_discovery_aquilo = "planet-discovery-aquilo"
if (mods["EverythingOnNauvis"]) then
	planet_discovery_vulcanus = "tungsten-carbide"
	planet_discovery_fulgora = "holmium-processing"
	planet_discovery_gleba = "agriculture"
	planet_discovery_aquilo = "lithium-processing"
elseif (mods["onlyNauvis"]) then
	planet_discovery_vulcanus = "inner-belt-discovery"
	planet_discovery_fulgora = "scrap-belt-discovery"
	planet_discovery_gleba = "gleba-belt-discovery"
	planet_discovery_aquilo = "outer-belt-discovery"
end


planet_discovery_table = {
	vulcanus = planet_discovery_vulcanus,
	fulgora = planet_discovery_fulgora,
	gleba = planet_discovery_gleba,
	aquilo = planet_discovery_aquilo
}
return planet_discovery_table