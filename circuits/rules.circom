pragma circom 2.0.0;
include "../node_modules/circomlib/circuits/mux4.circom";
include "../node_modules/circomlib/circuits/pedersen.circom";
template baloot(card_index){
  //the card order [7,8,9,J,Q,K,10,A]
  signal input cards[8]; // private //[0-7 heart , 8-15 Diamonds, 16-23 Spades, 24-31 Clubs ]
  // signal input card_index; // private
  signal input category; // public[1 haert, 2 Diamonds, 3 Spades ,4 Clubs]
  signal input current_card_commit; // public
  signal output new_card_commit;
  signal output played_card;
 var i = 0;
 var the_card = cards[card_index];
 var cat = category;
 if(cards[card_index]>=0&&7<=cards[card_index]){
  i=1;
 }
 if(cards[card_index]>=8&&15<=cards[card_index]){
  i=2;
 }
 if(cards[card_index]>=23&&16<=cards[card_index]){
  i=3;
 }
 if(cards[card_index]>=24&&31<=cards[card_index]){
  i=4;
 }

assert(category == i);

played_card <== the_card;
 
component P = Pedersen(8);
for(var j = 0; j < 8; j++){
    P.in[j] <== cards[j];
  }
new_card_commit <== P.out[0];




}

component main {public [cards,category,current_card_commit]} = baloot(1);