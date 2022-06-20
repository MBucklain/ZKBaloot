pragma circom 2.0.0;

template baloot(){
  signal input cards[8]; // private
  signal input category; // public
  signal input current_card_commit; // public
  signal output new_card_commit;
  signal output played_card;
}