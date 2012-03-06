class stages {
  # declare an arbitrary stage name
  stage{'first':}

  # and now define the order
  Stage['first'] -> Stage['main']
}
