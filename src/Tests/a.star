test.a{
  import star.

  o : action[string,integer].
  o = return 1.

  p : action[string,integer].
  p = (o >>= double) >>= double.

  double:(integer) => action[string,integer].
  double(I) => return (I+I).

  assert valof o==1.

  assert _perform(p) == 4.

  a = do{
    x <- p;
    valis x
  }.

  assert valof a == 4.
}
