
import Debug "mo:base/Debug";
import List "mo:base/List";
import HashMap "mo:base/HashMap";
import Principal "mo:base/Principal";
import Cycles "mo:base/ExperimentalCycles";

actor {
    
    // public shared(msg) func whoami() : async Principal {
    // let principal_caller = msg.caller;
    // return(principal_caller);
    //   };
    // //dfx canister call motokocamp_d5 whoami '()'

    // publc func is_anonymous () :  async Bool {
    //     let principal_caller = msg.caller;
    //     if (principal_caller is notnull) {
    //        return ()
    //     } else {
    //         return
    //     };
    //   };

//c1 
    let anonymous_principal : Principal = Principal.fromText("2vxsx-fae");
    public shared({caller}) func is_anonymous() : async Bool {
        return Principal.equal(caller, anonymous_principal);
    };


//c2 
    let favoriteNumber = HashMap.HashMap<Principal, Nat>(0, Principal.equal, Principal.hash);

//c3 
    public shared({caller}) func add_favorite_number(n : Nat) : async () {
        favoriteNumber.put(caller, n);
    };
    public shared({caller}) func show_favorite_number() : async ?Nat {
        favoriteNumber.get(caller);
    };

//c4 

    public shared({caller}) func add_favorite_number_new(n : Nat) : async Text {
        switch (favoriteNumber.get(caller)) {
            case (null) {
                favoriteNumber.put(caller, n);
                return "You've successfully registered your number";
            };
            case (?_) {
                return "You've already registered your number";
            };
        };
    };

//c5 
    public shared({caller}) func update_favorite_number(n : Nat) : async ?Nat {
        return favoriteNumber.replace(caller, n);
    };
    public shared({caller}) func delete_favorite_number() : async () {
        favoriteNumber.delete(caller);
    };


//c6 
    public func deposit_cycles() : async Nat {
        return Cycles.accept(Cycles.available());
    };

    // let users = HashMap.HashMap<Principal, Text>(0, Principal.equal, Principal.hash);
    // users.put(anonymous_principal, "This is the anonymous principal");

    // public func test() : async ?Text {
    //     return(users.get(Principal.fromText("2vxsx-fae")));
    // };






};
