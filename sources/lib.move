 module demopackage::lib {
    use sui::object::{Self, UID};   
    use sui::tx_context::{Self, TxContext};
    use sui::transfer;

    struct Bank has key {
        id: UID,
        name: vector<u8>,
        balance: u128, //number - unsign integer
    }

    fun init(ctx: &mut TxContext){
         let bank = Bank {
            id: object::new(ctx),
            name: b"vbi bank",
            balance: 1_000_000_000
         };
         transfer::transfer(bank,tx_context::sender(ctx));
    }
 }