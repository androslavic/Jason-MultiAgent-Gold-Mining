// leader agent

{ include("$jacamoJar/templates/common-cartago.asl") }

/*
 * By Joao Leite
 * Based on implementation developed by Rafael Bordini, Jomi Hubner and Maicon Zatelli
 */

winning(none,0).

score(miner1,0).
score(miner2,0).
score(miner3,0).
score(miner4,0).

//the start goal only works after execise j)
//!start.
//+!start <- tweet("a new mining is starting! (posted by jason agent)").


	


+dropped[source(A)] : score(A,S)
   <- -score(A,S);
      +score(A,S+1);
      +droppedd[source(A)];
      -dropped[source(A)].
     // .print("Agent ",A," has dropped ",S+1," pieces of gold").
		
+droppedd[source(A)] : score(A,S) & winning(L,SL) & S+1>SL
   <- -winning(L,SL);
   	  +winning(A,S);
      -droppedd[source(A)];
      .print("Agent ",A," is winning with ",S," pieces of gold");
      .broadcast(tell,winning(A,S)).
		
			
		
	