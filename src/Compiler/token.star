star.compiler.token{
  import star.
  import star.compiler.ast.
  import star.compiler.location.

  public token ::= tok(locn,tk).

  public tk ::= idQTok(string)
              | idTok(string)
              | lftTok(string)
              | rgtTok(string)
              | intTok(integer)
              | fltTok(float)
              | strTok(list[stringSegment]).

  public stringSegment ::= segment(string) | interpolate(locn,string,string).

  public implementation display[tk] => {.
    disp(idQTok(Id)) => ssSeq([ss("''"),ss(Id),ss("''")]).
    disp(idTok(Id)) => ssSeq([ss("'"),ss(Id),ss("'")]).
    disp(intTok(Ix)) => disp(Ix).
    disp(fltTok(Dx)) => disp(Dx).
    disp(strTok(S)) => ssSeq([ss("\""),ssSeq(dispSegments(S)),ss("\"")]).
    disp(lftTok(Id)) => ssSeq([ss("<"),ss(Id)]).
    disp(rgtTok(Id)) => ssSeq([ss(Id),ss(">")]).
  .}

  dispSegments:(list[stringSegment]) => list[ss].
  dispSegments(Segs) => Segs//disp.

  implementation display[stringSegment] => {.
    disp(segment(S)) => ss(S).
    disp(interpolate(_,S,"")) => ssSeq([ss("\\("),ss(S),ss(")")]).
    disp(interpolate(_,S,F)) => ssSeq([ss("\\("),ss(S),ss("):"),ss(F),ss(";")]).
  .}

  implementation equality[stringSegment] => {.
    segment(S1) == segment(S2) => S1==S2.
    interpolate(_,S1,F1) == interpolate(_,S2,F2) => S1==S2 && F1==F2.
    _ == _ default => false.
  .}

  public implementation equality[tk] => {.
    idQTok(Id1) == idQTok(Id2) => Id1==Id2.
    idTok(Id1) == idTok(Id2) => Id1==Id2.
    intTok(Ix1) == intTok(Ix2) => Ix1==Ix2.
    fltTok(Dx1) == fltTok(Dx2) => Dx1==Dx2.
    strTok(S1) == strTok(S2) => S1==S2.
    lftTok(S1) == lftTok(S2) => S1==S2.
    rgtTok(S1) == rgtTok(S2) => S1==S2.
    _ == _ default => false.
  .}

  public implementation display[token] => {.
    disp(tok(Lc,Tk)) => ssSeq([disp(Tk),ss("@"),disp(Lc)]).
  .}

  public implementation hasLoc[token] => {.
    locOf(tok(Lc,_)) => Lc.
  .}
}
