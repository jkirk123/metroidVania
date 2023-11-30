 
  void makeMaps()
  {
   String mapString = "";
   int mapIndex = 0;
   int mapX;
   
   println("Working on map 1...");
  mapString += "[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[["; mapX = mapString.length();
  mapString += "[                         !    ####["; 
  mapString += "[[[[[[[[[[[[[[[[[[[[[[[[[        ##["; 
  mapString += "[                                  ["; 
  mapString += "[            [                     ["; 
  mapString += "[   X        [        ]         TTT["; 
  mapString += "[         ...[[[[[[[[[[[[[[[[[[[[[[["; 
  mapString += "#       .....                      ["; 
  mapString += "[         .....                    #"; 
  mapString += "[ [##[                             ["; 
  mapString += "#     [   ###############^^#       ["; 
  mapString += "[            ......     B######### #";   
  mapString += "#   B  [      ........   #         ["; 
  mapString += "#     [         ......   # #       #"; 
  mapString += "[   [              ..    # # #######"; 
  mapString += "#       [                # #       #"; 
  mapString += "#^^^^          TTTTTTTTTT#^####### #"; 
  mapString += "###########################        #";
  mapString += "#!D!                              ]#";
  mapString += "####################################";
  mapString += "####################################";
  //adds doors
  doors.add(new Portal(0, 24, 16, 3, 2, 3));
  doors.add(new Portal(0,  2, 18, 1, 2, 2));
  lockDoor();
  Keys.add(new Key(0,4,8));
  
  world.add(new Map(mapString, mapX, mapIndex) );
  mapIndex++;
  mapString = "";
  
  
  
  
   println("Working on map 2...");
  mapString += "####################################"; mapX = mapString.length();
  mapString += "#!D! L#                            #";
  mapString += "#[[[ L#     ##      ###            #";
  mapString += "#    L#            # B#            #";
  mapString += "#    L# [[     #####  # ###        #";
  mapString += "#    L#     #         #            #";
  mapString += "#    L#     #        ##            #";
  mapString += "#    L#               #      ##    #";
  mapString += "#    L#      ##       #    #       #";
  mapString += "#    L#         #     #            #";
  mapString += "#    L#       ###     #           ##";
  mapString += "#    L#               #            #";
  mapString += "#    L#B    #         #            #";
  mapString += "#    L#               #            #";
  mapString += "#    L#     ###       #            #";
  mapString += "#    L#               #            #";
  mapString += "#    L#        ##     #   ###      #";
  mapString += "#    L#    ##         #            #";
  mapString += "#    L#               #       ###  #";
  mapString += "#    L#  ##  ##       #            #";
  mapString += "#    L              T #^^^^^^     [#";
  mapString += "##############################   []#";
  mapString += "#!D!         TTT         T      []]#";
  mapString += "####################################";
  mapString += "####################################";
  doors.add(new Portal(1, 2, 22, 2, 2, 1));
  lockDoor();
  Keys.add(new Key(1,29,20));
  world.add(new Map(mapString, mapX, mapIndex) );
  mapIndex++;
  mapString = "";
  
  
  
  
  
  
  
   println("Working on map 3...");
  mapString += "####################################"; mapX = mapString.length();
  mapString += "#!D!T!T T T T T T T T T T T T  TT T#";
  mapString += "##################T###############T#";
  mapString += "#TTTTTT TT TTTTTTTTT!TTTTTTTTTT T T#";
  mapString += "#T######T#################T#########";
  mapString += "#TTTTTT TTTTTTTTT TTTT TTTTTTT TT T#";
  mapString += "###########################T######T#";
  mapString += "#TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT T#";
  mapString += "#T####################T#############";
  mapString += "#TTTTTTBTT TTTTTTTTTTTTTTTTTTTTTT T#";
  mapString += "###################T##############T#";
  mapString += "#TTTTTTTTT T TTTTTTTTTTTTTTTTTTTT T#";
  mapString += "#T########T############T############";
  mapString += "#TTTT TTTTTTTTTTTTTTTTTTTTTTTTTTTBT#";
  mapString += "#############T####T###############T#";
  mapString += "#TTTT TTTTTTTTTTTTTTTTTTTTTTTTTTT T#";
  mapString += "#T##############T##############T####";
  mapString += "#TTTT TTTT TTTTTTTTTTTTTTTTTTTTTTBT#";
  mapString += "#TD!TTT TTTTTTTTTTTTTTTTTTTTTTTTTBT#";
  mapString += "####################################";
  mapString += "####################################";
  doors.add(new Portal(2, 2, 18, 3, 2, 3));
  lockDoor();
  Keys.add(new Key(2,29,1));
  world.add(new Map(mapString, mapX, mapIndex) );
  mapIndex++;
  mapString = "";
  
  
   println("Working on map 4...");
  mapString += "####################################"; mapX = mapString.length();
  mapString += "#  !    !      !      !   !   !    #";
  mapString += "#                                  #";
  mapString += "# D     T ^     T   ^    T       D #";
  mapString += "###########################^^#######";
  mapString += ".........B.........B.....######.....";
  mapString += "................................... ";
  mapString += "...........................         ";
  mapString += ".................                   ";
  mapString += "...............                     ";
  mapString += ".............       ...             ";
  mapString += "......   ...          ...           ";
  mapString += "....     ...                        ";
  mapString += "...       .         ....            ";
  mapString += "..        .       .....             ";
  mapString += "..        .         ...             ";
  mapString += "..        .                        T";
  mapString += "..                               TTT";
  mapString += ".                              TTTTT";
  mapString += ".                      TTTTTTTTTTTTT";
  mapString += "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT";
  doors.add(new Portal(3, 33, 3, 4, 3, 3));
  Keys.add(new Key(3,11,2));
  world.add(new Map(mapString, mapX, mapIndex) );
  mapIndex++;
  mapString = "";
  
  
   println("Working on map 5...");
  mapString += "########################################################################"; mapX = mapString.length();
  mapString += "#  !    !      !      !   !   !     !    !      !      !   !   !    !  #";
  mapString += "#                                                                      #";
  mapString += "# D                                                                  D #";
  mapString += "###########^^###########################################################";
  mapString += ".........#######...............B......................B.................";
  mapString += "........................................................................";
  mapString += "...... .................................................................";
  mapString += "               .........................................................";
  mapString += "                      ..................................................";
  mapString += "            ...        . ...............................................";
  mapString += "             ...         ...............................................";
  mapString += "              .            .............................................";
  mapString += "                            ............................................";
  mapString += "                              ..........................................";
  mapString += "                              ..........................................";
  mapString += "T                              .........................................";
  mapString += "TTTTTTTT                       .........................................";
  mapString += "TTTTTTTTTTTTTTTTT                 ......................................";
  mapString += "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTT      ....................................";
  mapString += "TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT....................................";
   doors.add(new Portal(4, 69, 3, 5, 3, 3));
    world.add(new Map(mapString, mapX, mapIndex) );
  mapIndex++;
  mapString = "";
  //151 WIDTH
  //61 HEIGHT
  mapString += "##############################################################################################################################################"; mapX = mapString.length();
  mapString += "#  !    !      !      !   !   !     !    !      !      !   !   !    !    !    !      !      !   !   !     !    !      !      !   !   !    !  #";
  mapString += "#                                                                                                                                      TTTTTT#";
  mapString += "#FDF                                                                                                                         TTTTTTTTTTTTTTDL#";
  mapString += "############################################################################################################################################L#";
  mapString += "#....    ........................................................................................................................           L[";
  mapString += "#....   ..........................................................................................................                          L[";
  mapString += "#...  ..................................................................................................                                    L[";
  mapString += "#....  .............................................................                                                                        L[";
  mapString += "#.... ............................... ..............                                   FFFFFFFFFFFFD#                                       L[";
  mapString += "#...............................                                                       ##############                                       L[";
  mapString += "#.......................                                                                           L#                                       L[";
  mapString += "#...................                                                                 ###           L#                                       L[";
  mapString += "#    ..............                                                                   !            L#                                       L[";
  mapString += "#  ...........                                                                    ###              L#                                       L[";
  mapString += "#........                                                                                          L#                                       L[";
  mapString += "#                                                                               ###                L#                                       L[";
  mapString += "#                                                                                                  L#                                       L[";
  mapString += "#                                                                             ###                  L#                                       L[";
  mapString += "#                                                                                                  L#                                       L[";
  mapString += "#                                                                          ####                    L#                                       L[";
  mapString += "#                                                                                                  L#                                       L[";
  mapString += "#                                                                        ##                        L#                                       L[";
  mapString += "#                                                                         ^^^^^^^^^^^^^^^^^^^^^^^^^L#                                       L[";
  mapString += "#               ####  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ###############################                                       L[";
  mapString += "#                         !                                                                         #                                       L[";
  mapString += "#             ##    B                b     B                     b                                  #                                       L[";
  mapString += "#                                                                                                   #                                       L[";
  mapString += "#           ##                                                                                      #                                       L[";
  mapString += "#                                                                                                   #                                       L[";
  mapString += "#         ##                                                                                        #                                       L[";
  mapString += "#                                                                                                   #                                       L[";
  mapString += "#       ##                                                                                          #                                       L[";
  mapString += "#                                                                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^#                                       L[";
  mapString += "#     ##                                                         ####################################                                       L[";
  mapString += "#                                                                !       !       ! !         !!    L#                                       L[";
  mapString += "###################################### # # # # # #  #  #  #  #                                     L#                                       L[";
  mapString += "#                                   B# # # # # # #  #  #  #  #D                                    L#                                       L[";
  mapString += "#                                    # # # # # # #  #  #  #  #[                                    L#                                       L[";
  mapString += "#                                    # # # # # # #  #  #  #  #[[[       ^      ^     ^     ^       L#                                       L[";
  mapString += "#                                    # # # # # # #  #  #  #  ##################################    L#                                    .  L[";
  mapString += "#                                    # # # # # # #  #  #  #  #  !   !          !     !   !  !  #   L#                                   ..  L[";
  mapString += "#                                    #^#^#^#^#^#^#^^#^^#^^#^^#                                     L#                                   ..  L[";
  mapString += "#                                    #########################                                   # L#                                  .... L[";
  mapString += "#                                                                                                  L#                                .......L[";
  mapString += "#                                                                ####################################                              .........[[";
  mapString += "#..........                                             ^^     #                                                               ............[[[";
  mapString += "#..........                                             #####                                                           ..............[[[[[[[[";
  mapString += "#...............                                           !                                                        ................[[[[[[[[[[";
  mapString += "#....................                                                                                               ............[[[[[[[[[[[[[[";
  mapString += "#.........................                                    ##                                                   ............[[[[[[[[[[[[[[[";
  mapString += "#.........................                                        D                                                 .........[[[[[[[[[[[[[[[[[";
  mapString += "#...............................                                 ###   ###                                         ..........[[[[[[[[[[[[[[[[[";
  mapString += "#......................................                           !                                                  .......[[[[[[[[[[[[[[[[[[";
  mapString += "#.........................................                                                                            ..... [[[[[[[[[[[[[[[[[[";
  mapString += "#..............................................                           ###                                         ....TT[[[[[[[[[[[[[[[[[[";
  mapString += "#...........................................................              !!    ##                                  .....TT[[[[[[[[[[[[[[[[[[[";
  mapString += "#.......TTTTTTTTTTTTTTTTTTT.............................................                                         .......TTT[[[[[[[[[[[[[[[[[[[";
  mapString += "#....TTTTTTTTTTTTTTTTTTTTTTTTTTT...........................................  #####                              ..TTTTTTTT[[[[[[[[[[[[[[[[[[[[";
  mapString += "#TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                  TTTTTTTTTT[[[[[[[[[[[[[[[[[[[[[[[";
  mapString += "[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[";
  mapString += "[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[";
  doors.add(new Portal(5, 66, 51, 5, 66, 51));
   doors.add(new Portal(5, 139, 3, 5, 62, 37));
   lockDoor();
    doors.add(new Portal(5, 62, 37, 5,  62, 37));
    doors.add(new Portal(5, 99, 9, 6,  1, 0));
    lockDoor();
  world.add(new Map(mapString, mapX, mapIndex) );
  mapIndex++;
  mapString = "";
  
  mapString += "#      B                                          B                                                                                          B                                                                                                                                                                                                                B                                                             B            #"; mapX = mapString.length();
  mapString += "#                                                                                                                                                                                                                                                                                                                                                                                                                                        #";
  mapString += "#TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT#";
  mapString += "##########################################################################################################################################################################################################################################################################################################################################################################################################################################";
  
  }
