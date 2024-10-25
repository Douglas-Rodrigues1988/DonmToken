// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

// ERC20 Interface
interface ERC20Interface {
    function totalSupply() external view returns (uint256);
    function balanceOf(address tokenOwner) external view returns (uint256 balance);
    function allowance(address tokenOwner, address spender) external view returns (uint256 remaining);

    function transfer(address to, uint256 tokens) external returns (bool success);
    function approve(address spender, uint256 tokens) external returns (bool success);
    function transferFrom(address from, address to, uint256 tokens) external returns (bool success);

    event Transfer(address indexed from, address indexed to, uint256 tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint256 tokens);
}

// Token Contract
contract DonmToken is ERC20Interface {
    string public constant symbol = "Donm";
    string public constant name = "Donm Coin";
    uint8 public constant decimals = 2;
    uint256 private _totalSupply;

    mapping(address => uint256) private balances;
    mapping(address => mapping(address => uint256)) private allowed;

    constructor() {
        _totalSupply = 10000000 * 10 ** uint256(decimals); // Ajuste do totalSupply considerando os decimais
        balances[msg.sender] = _totalSupply; // Aloca todo o supply para o criador do contrato
        emit Transfer(address(0), msg.sender, _totalSupply); // Emitir um evento de transferência
    }

    function totalSupply() public view override returns (uint256) {
        return _totalSupply;
    }

    function balanceOf(address tokenOwner) public view override returns (uint256) {
        return balances[tokenOwner];
    }

    function transfer(address to, uint256 tokens) public override returns (bool success) {
        require(tokens <= balances[msg.sender], "Saldo insuficiente");
        require(to != address(0), "Endereco invalido");

        balances[msg.sender] -= tokens;
        balances[to] += tokens;
        emit Transfer(msg.sender, to, tokens);
        return true;
    }

    function approve(address spender, uint256 tokens) public override returns (bool success) {
        require(spender != address(0), "Endereco invalido");

        allowed[msg.sender][spender] = tokens;
        emit Approval(msg.sender, spender, tokens);
        return true;
    }

    function allowance(address tokenOwner, address spender) public view override returns (uint256) {
        return allowed[tokenOwner][spender];
    }

    function transferFrom(address from, address to, uint256 tokens) public override returns (bool success) {
        require(tokens <= balances[from], "Saldo insuficiente no remetente");
        require(tokens <= allowed[from][msg.sender], "Tokens excedem o limite permitido");
        require(to != address(0), "Endereco invalido");

        balances[from] -= tokens;
        allowed[from][msg.sender] -= tokens;
        balances[to] += tokens;
        emit Transfer(from, to, tokens);
        return true;
    }
}
