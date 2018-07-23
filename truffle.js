/*
 * NB: since truffle-hdwallet-provider 0.0.5 you must wrap HDWallet providers in a 
 * function when declaring them. Failure to do so will cause commands to hang. ex:
 * ```
 * mainnet: {
 *     provider: function() { 
 *       return new HDWalletProvider(mnemonic, 'https://mainnet.infura.io/<infura-key>') 
 *     },
 *     network_id: '1',
 *     gas: 4500000,
 *     gasPrice: 10000000000,
 *   },
 */

var HDWalletProvider = require("truffle-hdwallet-provider"); 

var infura_apikey = "ea50cdfcb9744f9286e4d5f535e52e2d";

var mnemonic = "isolate hockey pattern believe finish opera guard panel ordinary swim kiwi ignore";
 module.exports = {
    // See <http://truffleframework.com/docs/advanced/configuration>
    // to customize your Truffle configuration!
    solc: {
      optimizer: {
        enabled: true,
        runs: 200
      }
    },
    networks: {
      development: {
        host: "localhost",
        port: 8545,
        network_id: "*" // Match any network id
      },
      ropsten: {
        provider: function() {
          return new HDWalletProvider(mnemonic, "https://ropsten.infura.io/v3/ea50cdfcb9744f9286e4d5f535e52e2d")
            },
        network_id: '3',
        gas: 3012388,
        gasPrice: 30000000000
      }
    }
  };
