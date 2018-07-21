var TWTD = artifacts.require("TWTD");

module.experts = function (deployer,name,symbol,supply) {
	var name = 'Taiwan Coin';
	var symbol = 'TWTD';
	var supply = 50000;
	deployer.deploy(TWTD, name, symbol, supply);
};
