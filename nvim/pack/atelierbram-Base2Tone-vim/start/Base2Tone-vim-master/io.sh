#!/bin/bash -x

# write to file
overwrite_to_file()
{
  base16-builder --scheme "db/schemes/base2tone-evening.yml" --template "db/templates/vim/dark.ejs" > "colors/Base2Tone_EveningDark.vim"
  base16-builder --scheme "db/schemes/base2tone-evening.yml" --template "db/templates/vim/light-alt.ejs" > "colors/Base2Tone_EveningLight.vim"
  base16-builder --scheme "db/schemes/base2tone-morning.yml" --template "db/templates/vim/dark-alt.ejs" > "colors/Base2Tone_MorningDark.vim"
  base16-builder --scheme "db/schemes/base2tone-morning.yml" --template "db/templates/vim/light.ejs" > "colors/Base2Tone_MorningLight.vim"
  base16-builder --scheme "db/schemes/base2tone-space.yml" --template "db/templates/vim/dark.ejs" > "colors/Base2Tone_SpaceDark.vim"
  base16-builder --scheme "db/schemes/base2tone-space.yml" --template "db/templates/vim/light-alt.ejs" > "colors/Base2Tone_SpaceLight.vim"
  base16-builder --scheme "db/schemes/base2tone-sea.yml" --template "db/templates/vim/dark.ejs" > "colors/Base2Tone_SeaDark.vim"
  base16-builder --scheme "db/schemes/base2tone-sea.yml" --template "db/templates/vim/light-alt.ejs" > "colors/Base2Tone_SeaLight.vim"
  base16-builder --scheme "db/schemes/base2tone-forest.yml" --template "db/templates/vim/dark.ejs" > "colors/Base2Tone_ForestDark.vim"
  base16-builder --scheme "db/schemes/base2tone-forest.yml" --template "db/templates/vim/light-alt.ejs" > "colors/Base2Tone_ForestLight.vim"
  base16-builder --scheme "db/schemes/base2tone-earth.yml" --template "db/templates/vim/dark.ejs" > "colors/Base2Tone_EarthDark.vim"
  base16-builder --scheme "db/schemes/base2tone-earth.yml" --template "db/templates/vim/light-alt.ejs" > "colors/Base2Tone_EarthLight.vim"
  base16-builder --scheme "db/schemes/base2tone-garden.yml" --template "db/templates/vim/dark.ejs" > "colors/Base2Tone_GardenDark.vim"
  base16-builder --scheme "db/schemes/base2tone-garden.yml" --template "db/templates/vim/light-alt.ejs" > "colors/Base2Tone_GardenLight.vim"
  base16-builder --scheme "db/schemes/base2tone-desert.yml" --template "db/templates/vim/dark.ejs" > "colors/Base2Tone_DesertDark.vim"
  base16-builder --scheme "db/schemes/base2tone-desert.yml" --template "db/templates/vim/light.ejs" > "colors/Base2Tone_DesertLight.vim"
  base16-builder --scheme "db/schemes/base2tone-suburb.yml" --template "db/templates/vim/dark.ejs" > "colors/Base2Tone_SuburbDark.vim"
  base16-builder --scheme "db/schemes/base2tone-suburb.yml" --template "db/templates/vim/light-alt.ejs" > "colors/Base2Tone_SuburbLight.vim"
  base16-builder --scheme "db/schemes/base2tone-lavender.yml" --template "db/templates/vim/dark.ejs" > "colors/Base2Tone_LavenderDark.vim"
  base16-builder --scheme "db/schemes/base2tone-lavender.yml" --template "db/templates/vim/light-alt.ejs" > "colors/Base2Tone_LavenderLight.vim"
  base16-builder --scheme "db/schemes/base2tone-pool.yml" --template "db/templates/vim/dark.ejs" > "colors/Base2Tone_PoolDark.vim"
  base16-builder --scheme "db/schemes/base2tone-pool.yml" --template "db/templates/vim/light-alt.ejs" > "colors/Base2Tone_PoolLight.vim"
  base16-builder --scheme "db/schemes/base2tone-lake.yml" --template "db/templates/vim/dark.ejs" > "colors/Base2Tone_LakeDark.vim"
  base16-builder --scheme "db/schemes/base2tone-lake.yml" --template "db/templates/vim/light-alt.ejs" > "colors/Base2Tone_LakeLight.vim"
  base16-builder --scheme "db/schemes/base2tone-cave.yml" --template "db/templates/vim/dark.ejs" > "colors/Base2Tone_CaveDark.vim"
  base16-builder --scheme "db/schemes/base2tone-cave.yml" --template "db/templates/vim/light.ejs" > "colors/Base2Tone_CaveLight.vim"
  base16-builder --scheme "db/schemes/base2tone-heath.yml" --template "db/templates/vim/dark.ejs" > "colors/Base2Tone_HeathDark.vim"
  base16-builder --scheme "db/schemes/base2tone-heath.yml" --template "db/templates/vim/light.ejs" > "colors/Base2Tone_HeathLight.vim"
  base16-builder --scheme "db/schemes/base2tone-drawbridge.yml" --template "db/templates/vim/dark.ejs" > "colors/Base2Tone_DrawbridgeDark.vim"
  base16-builder --scheme "db/schemes/base2tone-drawbridge.yml" --template "db/templates/vim/light-alt.ejs" > "colors/Base2Tone_DrawbridgeLight.vim"
  base16-builder --scheme "db/schemes/base2tone-meadow.yml" --template "db/templates/vim/dark.ejs" > "colors/Base2Tone_MeadowDark.vim"
  base16-builder --scheme "db/schemes/base2tone-meadow.yml" --template "db/templates/vim/light-alt.ejs" > "colors/Base2Tone_MeadowLight.vim"
  base16-builder --scheme "db/schemes/base2tone-mall.yml" --template "db/templates/vim/dark.ejs" > "colors/Base2Tone_MallDark.vim"
  base16-builder --scheme "db/schemes/base2tone-mall.yml" --template "db/templates/vim/light-alt.ejs" > "colors/Base2Tone_MallLight.vim"
  base16-builder --scheme "db/schemes/base2tone-porch.yml" --template "db/templates/vim/dark.ejs" > "colors/Base2Tone_PorchDark.vim"
  base16-builder --scheme "db/schemes/base2tone-porch.yml" --template "db/templates/vim/light-alt.ejs" > "colors/Base2Tone_PorchLight.vim"
  base16-builder --scheme "db/schemes/base2tone-field.yml" --template "db/templates/vim/dark.ejs" > "colors/Base2Tone_FieldDark.vim"
  base16-builder --scheme "db/schemes/base2tone-field.yml" --template "db/templates/vim/light-alt.ejs" > "colors/Base2Tone_FieldLight.vim"
  base16-builder --scheme "db/schemes/base2tone-motel.yml" --template "db/templates/vim/dark.ejs" > "colors/Base2Tone_MotelDark.vim"
  base16-builder --scheme "db/schemes/base2tone-motel.yml" --template "db/templates/vim/light-alt.ejs" > "colors/Base2Tone_MotelLight.vim"

  base16-builder --scheme "db/schemes/base2tone-evening.yml" --template "db/templates/vim-airline/dark.ejs" > "autoload/airline/themes/Base2Tone_EveningDark.vim"
  base16-builder --scheme "db/schemes/base2tone-evening.yml" --template "db/templates/vim-airline/light.ejs" > "autoload/airline/themes/Base2Tone_EveningLight.vim"
  base16-builder --scheme "db/schemes/base2tone-morning.yml" --template "db/templates/vim-airline/dark.ejs" > "autoload/airline/themes/Base2Tone_MorningDark.vim"
  base16-builder --scheme "db/schemes/base2tone-morning.yml" --template "db/templates/vim-airline/light.ejs" > "autoload/airline/themes/Base2Tone_MorningLight.vim"
  base16-builder --scheme "db/schemes/base2tone-space.yml" --template "db/templates/vim-airline/dark.ejs" > "autoload/airline/themes/Base2Tone_SpaceDark.vim"
  base16-builder --scheme "db/schemes/base2tone-space.yml" --template "db/templates/vim-airline/light.ejs" > "autoload/airline/themes/Base2Tone_SpaceLight.vim"
  base16-builder --scheme "db/schemes/base2tone-sea.yml" --template "db/templates/vim-airline/dark.ejs" > "autoload/airline/themes/Base2Tone_SeaDark.vim"
  base16-builder --scheme "db/schemes/base2tone-sea.yml" --template "db/templates/vim-airline/light.ejs" > "autoload/airline/themes/Base2Tone_SeaLight.vim"
  base16-builder --scheme "db/schemes/base2tone-forest.yml" --template "db/templates/vim-airline/dark.ejs" > "autoload/airline/themes/Base2Tone_ForestDark.vim"
  base16-builder --scheme "db/schemes/base2tone-forest.yml" --template "db/templates/vim-airline/light.ejs" > "autoload/airline/themes/Base2Tone_ForestLight.vim"
  base16-builder --scheme "db/schemes/base2tone-earth.yml" --template "db/templates/vim-airline/dark.ejs" > "autoload/airline/themes/Base2Tone_EarthDark.vim"
  base16-builder --scheme "db/schemes/base2tone-earth.yml" --template "db/templates/vim-airline/light.ejs" > "autoload/airline/themes/Base2Tone_EarthLight.vim"
  base16-builder --scheme "db/schemes/base2tone-garden.yml" --template "db/templates/vim-airline/dark.ejs" > "autoload/airline/themes/Base2Tone_GardenDark.vim"
  base16-builder --scheme "db/schemes/base2tone-garden.yml" --template "db/templates/vim-airline/light.ejs" > "autoload/airline/themes/Base2Tone_GardenLight.vim"
  base16-builder --scheme "db/schemes/base2tone-desert.yml" --template "db/templates/vim-airline/dark.ejs" > "autoload/airline/themes/Base2Tone_DesertDark.vim"
  base16-builder --scheme "db/schemes/base2tone-desert.yml" --template "db/templates/vim-airline/light.ejs" > "autoload/airline/themes/Base2Tone_DesertLight.vim"
  base16-builder --scheme "db/schemes/base2tone-suburb.yml" --template "db/templates/vim-airline/dark.ejs" > "autoload/airline/themes/Base2Tone_SuburbDark.vim"
  base16-builder --scheme "db/schemes/base2tone-suburb.yml" --template "db/templates/vim-airline/light.ejs" > "autoload/airline/themes/Base2Tone_SuburbLight.vim"
  base16-builder --scheme "db/schemes/base2tone-lavender.yml" --template "db/templates/vim-airline/dark.ejs" > "autoload/airline/themes/Base2Tone_LavenderDark.vim"
  base16-builder --scheme "db/schemes/base2tone-lavender.yml" --template "db/templates/vim-airline/light.ejs" > "autoload/airline/themes/Base2Tone_LavenderLight.vim"
  base16-builder --scheme "db/schemes/base2tone-pool.yml" --template "db/templates/vim-airline/dark.ejs" > "autoload/airline/themes/Base2Tone_PoolDark.vim"
  base16-builder --scheme "db/schemes/base2tone-pool.yml" --template "db/templates/vim-airline/light.ejs" > "autoload/airline/themes/Base2Tone_PoolLight.vim"
  base16-builder --scheme "db/schemes/base2tone-lake.yml" --template "db/templates/vim-airline/dark.ejs" > "autoload/airline/themes/Base2Tone_LakeDark.vim"
  base16-builder --scheme "db/schemes/base2tone-lake.yml" --template "db/templates/vim-airline/light.ejs" > "autoload/airline/themes/Base2Tone_LakeLight.vim"
  base16-builder --scheme "db/schemes/base2tone-cave.yml" --template "db/templates/vim-airline/dark.ejs" > "autoload/airline/themes/Base2Tone_CaveDark.vim"
  base16-builder --scheme "db/schemes/base2tone-cave.yml" --template "db/templates/vim-airline/light.ejs" > "autoload/airline/themes/Base2Tone_CaveLight.vim"
  base16-builder --scheme "db/schemes/base2tone-heath.yml" --template "db/templates/vim-airline/dark.ejs" > "autoload/airline/themes/Base2Tone_HeathDark.vim"
  base16-builder --scheme "db/schemes/base2tone-heath.yml" --template "db/templates/vim-airline/light.ejs" > "autoload/airline/themes/Base2Tone_HeathLight.vim"
  base16-builder --scheme "db/schemes/base2tone-drawbridge.yml" --template "db/templates/vim-airline/dark.ejs" > "autoload/airline/themes/Base2Tone_DrawbridgeDark.vim"
  base16-builder --scheme "db/schemes/base2tone-drawbridge.yml" --template "db/templates/vim-airline/light.ejs" > "autoload/airline/themes/Base2Tone_DrawbridgeLight.vim"
  base16-builder --scheme "db/schemes/base2tone-meadow.yml" --template "db/templates/vim-airline/dark.ejs" > "autoload/airline/themes/Base2Tone_MeadowDark.vim"
  base16-builder --scheme "db/schemes/base2tone-meadow.yml" --template "db/templates/vim-airline/light.ejs" > "autoload/airline/themes/Base2Tone_MeadowLight.vim"
  base16-builder --scheme "db/schemes/base2tone-mall.yml" --template "db/templates/vim-airline/dark.ejs" > "autoload/airline/themes/Base2Tone_MallDark.vim"
  base16-builder --scheme "db/schemes/base2tone-mall.yml" --template "db/templates/vim-airline/light.ejs" > "autoload/airline/themes/Base2Tone_MallLight.vim"
  base16-builder --scheme "db/schemes/base2tone-porch.yml" --template "db/templates/vim-airline/dark.ejs" > "autoload/airline/themes/Base2Tone_PorchDark.vim"
  base16-builder --scheme "db/schemes/base2tone-porch.yml" --template "db/templates/vim-airline/light.ejs" > "autoload/airline/themes/Base2Tone_PorchLight.vim"
  base16-builder --scheme "db/schemes/base2tone-field.yml" --template "db/templates/vim-airline/dark.ejs" > "autoload/airline/themes/Base2Tone_FieldDark.vim"
  base16-builder --scheme "db/schemes/base2tone-field.yml" --template "db/templates/vim-airline/light.ejs" > "autoload/airline/themes/Base2Tone_FieldLight.vim"
  base16-builder --scheme "db/schemes/base2tone-motel.yml" --template "db/templates/vim-airline/dark.ejs" > "autoload/airline/themes/Base2Tone_MotelDark.vim"
  base16-builder --scheme "db/schemes/base2tone-motel.yml" --template "db/templates/vim-airline/light.ejs" > "autoload/airline/themes/Base2Tone_MotelLight.vim"

  base16-builder --scheme "db/schemes/base2tone-evening.yml" --template "db/templates/lightline/template.ejs" > "autoload/lightline/colorscheme/Base2Tone_Evening.vim"
  base16-builder --scheme "db/schemes/base2tone-morning.yml" --template "db/templates/lightline/template.ejs" > "autoload/lightline/colorscheme/Base2Tone_Morning.vim"
  base16-builder --scheme "db/schemes/base2tone-space.yml" --template "db/templates/lightline/template.ejs" > "autoload/lightline/colorscheme/Base2Tone_Space.vim"
  base16-builder --scheme "db/schemes/base2tone-sea.yml" --template "db/templates/lightline/template.ejs" > "autoload/lightline/colorscheme/Base2Tone_Sea.vim"
  base16-builder --scheme "db/schemes/base2tone-forest.yml" --template "db/templates/lightline/template.ejs" > "autoload/lightline/colorscheme/Base2Tone_Forest.vim"
  base16-builder --scheme "db/schemes/base2tone-earth.yml" --template "db/templates/lightline/template.ejs" > "autoload/lightline/colorscheme/Base2Tone_Earth.vim"
  base16-builder --scheme "db/schemes/base2tone-garden.yml" --template "db/templates/lightline/template.ejs" > "autoload/lightline/colorscheme/Base2Tone_Garden.vim"
  base16-builder --scheme "db/schemes/base2tone-desert.yml" --template "db/templates/lightline/template.ejs" > "autoload/lightline/colorscheme/Base2Tone_Desert.vim"
  base16-builder --scheme "db/schemes/base2tone-suburb.yml" --template "db/templates/lightline/template.ejs" > "autoload/lightline/colorscheme/Base2Tone_Suburb.vim"
  base16-builder --scheme "db/schemes/base2tone-lavender.yml" --template "db/templates/lightline/template.ejs" > "autoload/lightline/colorscheme/Base2Tone_Lavender.vim"
  base16-builder --scheme "db/schemes/base2tone-pool.yml" --template "db/templates/lightline/template.ejs" > "autoload/lightline/colorscheme/Base2Tone_Pool.vim"
  base16-builder --scheme "db/schemes/base2tone-lake.yml" --template "db/templates/lightline/template.ejs" > "autoload/lightline/colorscheme/Base2Tone_Lake.vim"
  base16-builder --scheme "db/schemes/base2tone-cave.yml" --template "db/templates/lightline/template.ejs" > "autoload/lightline/colorscheme/Base2Tone_Cave.vim"
  base16-builder --scheme "db/schemes/base2tone-heath.yml" --template "db/templates/lightline/template.ejs" > "autoload/lightline/colorscheme/Base2Tone_Heath.vim"
  base16-builder --scheme "db/schemes/base2tone-drawbridge.yml" --template "db/templates/lightline/template.ejs" > "autoload/lightline/colorscheme/Base2Tone_Drawbridge.vim"
  base16-builder --scheme "db/schemes/base2tone-meadow.yml" --template "db/templates/lightline/template.ejs" > "autoload/lightline/colorscheme/Base2Tone_Meadow.vim"
  base16-builder --scheme "db/schemes/base2tone-mall.yml" --template "db/templates/lightline/template.ejs" > "autoload/lightline/colorscheme/Base2Tone_Mall.vim"
  base16-builder --scheme "db/schemes/base2tone-porch.yml" --template "db/templates/lightline/template.ejs" > "autoload/lightline/colorscheme/Base2Tone_Porch.vim"
  base16-builder --scheme "db/schemes/base2tone-field.yml" --template "db/templates/lightline/template.ejs" > "autoload/lightline/colorscheme/Base2Tone_Field.vim"
  base16-builder --scheme "db/schemes/base2tone-motel.yml" --template "db/templates/lightline/template.ejs" > "autoload/lightline/colorscheme/Base2Tone_Motel.vim"

}

# execute it
overwrite_to_file