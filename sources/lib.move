 module demopackage::lib {
    use sui::object::{Self, UID};   
    use sui::tx_context::{Self, TxContext};
    use sui::transfer;

    struct Bank has key, store {
        id: UID,
        name: vector<u8>,
        balance: u128, //number - unsign integer
        accounts: vector<Account>
    }

    struct Account has key {
      id:UID,
      name: vector<u8>,
      balance: u128
    }

    fun init(ctx: &mut TxContext){
         let bank = create_bank(ctx);
         transfer::transfer(bank,tx_context::sender(ctx));
    }
   //private => only run, can't call in contract
    public fun create_bank(ctx: &mut TxContext): Bank {
      Bank {
         id: object::new(ctx),
         name: b"MBBANK",
         balance:1_000_000_000,
         accounts: vector[],
      };
      transfer::transfer(bank, tx_context::sender(ctx));
    }
    public entry fun create_account(_:&Bank,name:vector<u8>, ctx: &mut TxContext){
      let account = Account {
         id: object::new(ctx),
         name,
         balance: 0,

      }
      transfer::transfer(account, tx_context::sender(ctx));

    }
 }