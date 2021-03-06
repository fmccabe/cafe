star.cmdOpts{
  import star.

  -- Process command line list of strings to produce a set of Options
  public all o ~~ optionsProcessor[o] ~> {
    shortForm : string.
    alternatives : cons[string].
    usage : string.
    validator : option[(string)=>boolean].
    setOption: (string,o) => o.
  }

  public processOptions:all o ~~ (cons[string],cons[optionsProcessor[o]],o) =>
    either[string,(o,cons[string])].
  processOptions(Raw,Specs,Opts) => processAll(Raw,Specs,Opts).

  processAll:all o ~~ (cons[string],cons[optionsProcessor[o]],o) => either[string,(o,cons[string])].
  processAll([],_,SoFar) => either((SoFar,[])).
  processAll(["--",..A],_,SoFar) => either((SoFar,A)).
  processAll([A,..L],Specs,SoFar) => processOption(A,L,Specs,SoFar).

processOption:all o ~~ (string,cons[string],cons[optionsProcessor[o]],o) =>
  either[string,(o,cons[string])].
  processOption(A,L,Specs,SoFar) where
      O ^= search(Specs,(e)=>(e.shortForm==A|| _ ^=search(e.alternatives,(o)=>o==A))) => 
	checkOption(L,O.shortForm,O.validator,O.setOption,Specs,SoFar).
  processOption(A,L,_,SoFar) => either((SoFar,[A,..L])).

  checkOption:all o ~~ (cons[string],string,option[(string)=>boolean],(string,o) => o,cons[optionsProcessor[o]],o) =>
    either[string,(o,cons[string])].
  checkOption(Args,O,.none,setter,Specs,SoFar) => processAll(Args,Specs,setter(O,SoFar)).
  checkOption([A,..Args],O,some(V),Setter,Specs,SoFar)
      where V(A) => processAll(Args,Specs,Setter(A,SoFar)).
  checkOption(_,_,_,_,Specs,_) => other(collectUsage(Specs)).

  collectUsage:all o ~~ (cons[optionsProcessor[o]]) => string.
  collectUsage(Specs) => ssSeq([ss("Usage: \n"),..interleave(Specs//((O)=>O.usage),"\n")//((X)=>ss(X))])::string.
}
