class myfuncs {
  $mastername = mycrypt('hello, world')
  notify {"mycrypt('hello, world') returns ${mastername}\n": }
}
