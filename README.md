# APCSFinalProject
- Checkers This Out
- Miles Davies
- The project will be a checkers board. The plan is to make the sides black and red and make the tiles essentially the same colors. If it is your turn, and you click on a tile with one of your pieces on it, then small white dots will appear on the spaces that you are able to move to. The normal rules of checkers will apply, which means that if there is an opponent’s piece next to your piece and an opening behind them, then the white dot will be two places away from the original place instead of just being right next to it. The pieces will be able to move diagonally and can only move forwards until they have reached the other end of the board at which point they will have a gold crown added to them and they will be able to move both forwards and backwards, but will still only be able to move diagonally. If there is an opportunity to be able to jump over several of the opponent’s pieces, which comes from there being open before and after another piece after the original piece that the player’s piece jumped. The ability to take multiple pieces still requires the player’s piece to follow the movement rules that have been stated above, this means that an unkinged piece can’t jump a piece moving forward and then jump a second by moving backwards.

https://docs.google.com/document/d/1IsOXf5mbFWUrsB2Ye8Y9Q6WMxDmMMF3zVIcXQDVS-Y0/edit?usp=sharing


Development log:
5/23 - I began work on the Design document as I answered the first few questions.
5/24 - I finished answering the questions on the Design document except for the UML diagram. I created the basic checkers board by copy and pasting a series of rect commands.
5/25 & 5/26 - I worked on and finished the first draft of the UML diagram.
5/27 - I changed the board creation so that it was constructed by for loops instead of a series of copy and pasted commands. I added the images of the checkers pieces and their positions on the board.
5/28 - I reformatted the code to remove the NullPointerException that kept happening, updated images so that pieces appear and added draw() so the window that pops up isn't just a gray square, and added the basics of mousePressed and a small tester. I created the possible end conditions that of a win for either side, which comes from the other side having no pieces left on the board, and a tie, which comes from when one side can not make any legal moves.
5/1 - Began work on the Basic checkers code, including move, jump, mustJump, and multiJump.
5/3 - Finished implementing move, jump, and mustJump, multiJump still isn't working.
5/7 - Continued to work on attempting to implement multiJump.
