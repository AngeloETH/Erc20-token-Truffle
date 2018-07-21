pragma solidity ^0.4.24;



contract TWTD  {
    string public name;
    string public symbol;
    uint8 public decimals = 0;
    uint256 public totalSupply;
    
    mapping (address => uint256) public balanceOf;
    mapping (address => mapping (address => uint256)) public allowance;
     
    event Approval(address indexed owner, address indexed spender, uint256 value);
    event Transfer(address indexed from, address indexed to, uint256 value);

    
    
    
    constructor TWTD(string _name, string _symbol, uint256 _initialsupply) public {
        totalSupply = _initialsupply * 10 ** uint256(decimals);
        balanceOf[msg.sender] = totalSupply;
        name = _name;
        symbol = _symbol;
    }
    
    using SafeMath for uint256;
    
    function totalSupply() public view returns (uint256){
        return totalSupply;
    }
    function balanceOf(address who) public view returns (uint256) {
        return balanceOf[who];
    }
    
    function _transfer(address from, address to, uint256 value) internal {
        require ( to != 0x0);
        //uint256 value = _value * 10 ** uint256(decimals);
        require (balanceOf[from] >= value);
        uint256 Balance = balanceOf[from].add(balanceOf[to]);
        balanceOf[from] = balanceOf[from].sub(value);
        balanceOf[to] = balanceOf[to].add(value);
        assert(balanceOf[from].add(balanceOf[to]) == Balance);
        emit Transfer(from,to,value);
        
    }
    function transfer(address to, uint256 value) public returns (bool) {
        _transfer(msg.sender,to,value);
        return true;
    }
    
    function transferFrom(address from, address to, uint256 value) public returns (bool) {
        require (allowance[from][msg.sender] >= value);
        allowance[from][msg.sender] = allowance[from][msg.sender].sub(value);
        _transfer(from,to,value);
        return true;
    }
    
    function approve(address spender, uint256 value) public returns (bool) {
        require(value > 0);
        allowance[msg.sender][spender] = allowance[msg.sender][spender].sub(value);
        emit Approval(msg.sender,spender,value);
        return true;
    }
    
    function allowance(address owner, address spender)
    public view returns (uint256) {
        return allowance[owner][spender];
    }
    
}

library SafeMath {

  /**
  * @dev Multiplies two numbers, throws on overflow.
  */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        if (a == 0) {
            return 0;
        }
        uint256 c = a * b;
        assert(c / a == b);
        return c;
    }

  /**
  * @dev Integer division of two numbers, truncating the quotient.
  */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        // assert(b > 0); // Solidity automatically throws when dividing by 0
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold
        return c;
    }

  /**
  * @dev Subtracts two numbers, throws on overflow (i.e. if subtrahend is greater than minuend).
  */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b <= a);
        return a - b;
    }

  /**
  * @dev Adds two numbers, throws on overflow.
  */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}

/**
 * @title SafeMath32
 * @dev SafeMath library implemented for uint32
 */
library SafeMath32 {

    function mul(uint32 a, uint32 b) internal pure returns (uint32) {
        if (a == 0) {
            return 0;
        }
        uint32 c = a * b;
        assert(c / a == b);
        return c;
    }

    function div(uint32 a, uint32 b) internal pure returns (uint32) {
        // assert(b > 0); // Solidity automatically throws when dividing by 0
        uint32 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold
        return c;
    }

    function sub(uint32 a, uint32 b) internal pure returns (uint32) {
        assert(b <= a);
        return a - b;
    }

    function add(uint32 a, uint32 b) internal pure returns (uint32) {
        uint32 c = a + b;
        assert(c >= a);
        return c;
    }
}

/**
 * @title SafeMath16
 * @dev SafeMath library implemented for uint16
 */
library SafeMath16 {

    function mul(uint16 a, uint16 b) internal pure returns (uint16) {
        if (a == 0) {
            return 0;
        }
        uint16 c = a * b;
        assert(c / a == b);
        return c;
    }

    function div(uint16 a, uint16 b) internal pure returns (uint16) {
        // assert(b > 0); // Solidity automatically throws when dividing by 0
        uint16 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold
        return c;
    }

    function sub(uint16 a, uint16 b) internal pure returns (uint16) {
        assert(b <= a);
        return a - b;
    }

    function add(uint16 a, uint16 b) internal pure returns (uint16) {
        uint16 c = a + b;
        assert(c >= a);
        return c;
    }
}

