pragma circom 2.0.0;
include '../node_modules/circomlib/circuits/mux4.circom';
include '../node_modules/circomlib/circuits/pedersen.circom';
template baloot(){
  //the card order [7,8,9,J,Q,K,10,A]
  signal input cards[8]; // private //[0-7 heart , 8-15 Diamonds, 16-23 Spades, 24-31 Clubs ]
  signal input card_index; // private
  signal input category; // public[1 haert, 2 Diamonds, 3 Spades ,4 Clubs]
  signal input current_card_commit; // public
  signal output new_card_commit;
  signal output played_card;
 var i = 0;
 if(cards(card_index)=>0&&7=<cards(card_index)){
  i=1;
 }
 if(cards(card_index)=>8&&15<=cards(card_index)){
  i=2;
 }
 if(cards(card_index)=>23&&16=<cards(card_index)){
  i=3;
 }
 if(cards(card_index)=>24&&31=<cards(card_index)){
  i=4;
 }
  category === i;
played_card <== cards(card_index);

cards(card_index) = 0; 
  component P = Pedersen(8);
  p.in(0) = cards(0);
  p.in(1) = cards(1);
  p.in(2) = cards(2);
  p.in(3) = cards(3);
  p.in(4) = cards(4);
  p.in(5) = cards(5);
  p.in(6) = cards(6);
  p.in(7) = cards(7);
new_card_commit <== p.out(0);




}