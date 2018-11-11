%% Assignment 2: Delhi Metro
%% Please fill the following details
%% Full Name:Venkat Sai Akash Cheerla	
%% Roll No:111601029

%% Given below is the metro lines of New Delhi. Write a function
%% that given any two metro station prints out the route to take
%%
%% A route you can represent as a list [[x1,l1,x2],[x2,l2,x3]...]
%% where the entry [x,l,y] should be read as "from x take line l to
%% reach y and ...

%%
%% Remark: You code *should work* work even if the lines are changed.
%% In particular you should not assume anything about the names of the
%% station, or their ordering or the topology of the network. In other
%% words think of this red, blue and green line as a sample input to your
%% program.
%%
%% Hint you will need to work with junctions when there is not direct
%% connections between two points.
%%
%% For checking whether X is a junction you can use the setof/3
%% predicated, together with the length function.
%%
%% http://www.swi-prolog.org/pldoc/man?predicate=setof/3


line(red,
	[ rithala,
          rohini-east,
          rohini-west,
          pitam-pura,
          kohat-enclave,
          netaji-subash-place,
          keshav-puram,
          kanhaiya-nagar,
          indralok,
          shastri-nagar,
          pratap-nagar,
          pul-bangesh,
          tiz-hazari,
          kashmiri-gate,
          shastri-park,
          seelam-pur,
          welcome,
          shahdara,
          mansarovar-park,
          jhilmil,
          dilshad-garden
        ]
    ).
line(yellow,[ vishwa-vidayala
            , vidhan-sabha
            , civil-lines
            , kashmiri-gate
            , chandini-chowk
            , chawari-bazar
            , new-delhi
            , rajiv-chowk
            , patel-chowk
            , central-secretariat
            ]
    ).

line(blue,[ indraprastha
          , pragati-maidan
          , mandi-house
          , barakhamba-road
          , rajiv-chowk
          , ramakrishna-ashram-marg
          , jhandewala
          , karol-bagh
          , rajendra-place
          , patel-nagar
          , shadipur
          , kirti-nagar
          , moti-nagar
          , ramesh-nagar
          , rajouri-garden
          , tagore-garden
          , subhash-nagar
          , tilak-nagar
          , janakpuri-east
          , janakpuri-west
          , uttam-nagar-east
          , uttam-nagar-west
          , nawada
          , dwarka-mor
          , dwarka
          , sector-14-dwarka
          , sector-13-dwarka
          , sector-12-dwarka
          , sector-11-dwarka
          , sector-10-dwarka
          , sector-9-dwarka
          ]).

%change the input from findRoute/2 to findroute/4 with the unallowed routes set
%to [] and currentToure to []
findRoute(X,Y):-findRoute(X,Y,[],[]).

%%%%%%%%%%%%%%% DIRECT ROUTE %%%%%%%%%%%%%%
%Firstly we consider a route from X to Y not using any of the Lines specified in
%Lines and using only a sinlge line
findRoute(X,Y,Lines,Output):-line(Line,Stations),\+ member(Line,Lines),member(X,Stations),member(Y,Stations),append(Output,[[X,Line,Y]],NewOutput),print(NewOutput).

%%%%%%%%%%%%%% INDIRECT ROUTE %%%%%%%%%%%%%
%Next we consider an indirect route from X to Y not using any of the routes
%specified in Lines via an intermediate station Intermediate
findRoute(X,Y,Lines,Output):-line(Line,Stations),\+ member(Line,Lines),member(X,Stations),member(Intermediate,Stations),X\=Intermediate,Intermediate\=Y,append(Output,[[X,Line,Intermediate]],NewOutput),findRoute(Intermediate,Y,[Line|Lines],NewOutput).

%prints a formatted output
print([]).
print([H|T]):-format('from ~w take ~w line to ~w\n', H),print(T).


