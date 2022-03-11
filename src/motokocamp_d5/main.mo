
import Debug "mo:base/Debug";
import List "mo:base/List";

actor {
    
    public shared(msg) func whoami() : async Principal {
    let principal_caller = msg.caller;
    return(principal_caller);
      };
    //dfx canister call motokocamp_d5 whoami '()'

    publc func is_anonymous () :  async Bool {
        let principal_caller = msg.caller;
        if (principal_caller is notnull) {
           return ()
        } else {
            return
        };
      };
  
};
