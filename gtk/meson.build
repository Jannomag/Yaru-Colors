flavours = []
foreach flavour: ['default', 'dark', 'Aqua', 'Aqua-dark', 'Blue', Blue-dark', 'Green', 'Green-dark', 'Lavender', 'Lavender-dark', 'Pink', 'Pink-dark', 'Red', 'Red-dark', 'Yellow', 'Yellow-dark']
  if not get_option(flavour)
    message('skip flavour ' + flavour)
    continue
  endif
  flavours += flavour
endforeach


subdir('src')
